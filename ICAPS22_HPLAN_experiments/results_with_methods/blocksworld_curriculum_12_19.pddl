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
      ?auto_202712 - BLOCK
    )
    :vars
    (
      ?auto_202713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202712 ?auto_202713 ) ( CLEAR ?auto_202712 ) ( HAND-EMPTY ) ( not ( = ?auto_202712 ?auto_202713 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202712 ?auto_202713 )
      ( !PUTDOWN ?auto_202712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_202715 - BLOCK
    )
    :vars
    (
      ?auto_202716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202715 ?auto_202716 ) ( CLEAR ?auto_202715 ) ( HAND-EMPTY ) ( not ( = ?auto_202715 ?auto_202716 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202715 ?auto_202716 )
      ( !PUTDOWN ?auto_202715 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202719 - BLOCK
      ?auto_202720 - BLOCK
    )
    :vars
    (
      ?auto_202721 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202719 ) ( ON ?auto_202720 ?auto_202721 ) ( CLEAR ?auto_202720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202719 ) ( not ( = ?auto_202719 ?auto_202720 ) ) ( not ( = ?auto_202719 ?auto_202721 ) ) ( not ( = ?auto_202720 ?auto_202721 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202720 ?auto_202721 )
      ( !STACK ?auto_202720 ?auto_202719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202724 - BLOCK
      ?auto_202725 - BLOCK
    )
    :vars
    (
      ?auto_202726 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202724 ) ( ON ?auto_202725 ?auto_202726 ) ( CLEAR ?auto_202725 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202724 ) ( not ( = ?auto_202724 ?auto_202725 ) ) ( not ( = ?auto_202724 ?auto_202726 ) ) ( not ( = ?auto_202725 ?auto_202726 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202725 ?auto_202726 )
      ( !STACK ?auto_202725 ?auto_202724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202729 - BLOCK
      ?auto_202730 - BLOCK
    )
    :vars
    (
      ?auto_202731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202730 ?auto_202731 ) ( not ( = ?auto_202729 ?auto_202730 ) ) ( not ( = ?auto_202729 ?auto_202731 ) ) ( not ( = ?auto_202730 ?auto_202731 ) ) ( ON ?auto_202729 ?auto_202730 ) ( CLEAR ?auto_202729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202729 )
      ( MAKE-2PILE ?auto_202729 ?auto_202730 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202734 - BLOCK
      ?auto_202735 - BLOCK
    )
    :vars
    (
      ?auto_202736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202735 ?auto_202736 ) ( not ( = ?auto_202734 ?auto_202735 ) ) ( not ( = ?auto_202734 ?auto_202736 ) ) ( not ( = ?auto_202735 ?auto_202736 ) ) ( ON ?auto_202734 ?auto_202735 ) ( CLEAR ?auto_202734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202734 )
      ( MAKE-2PILE ?auto_202734 ?auto_202735 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202740 - BLOCK
      ?auto_202741 - BLOCK
      ?auto_202742 - BLOCK
    )
    :vars
    (
      ?auto_202743 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202741 ) ( ON ?auto_202742 ?auto_202743 ) ( CLEAR ?auto_202742 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202740 ) ( ON ?auto_202741 ?auto_202740 ) ( not ( = ?auto_202740 ?auto_202741 ) ) ( not ( = ?auto_202740 ?auto_202742 ) ) ( not ( = ?auto_202740 ?auto_202743 ) ) ( not ( = ?auto_202741 ?auto_202742 ) ) ( not ( = ?auto_202741 ?auto_202743 ) ) ( not ( = ?auto_202742 ?auto_202743 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202742 ?auto_202743 )
      ( !STACK ?auto_202742 ?auto_202741 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202747 - BLOCK
      ?auto_202748 - BLOCK
      ?auto_202749 - BLOCK
    )
    :vars
    (
      ?auto_202750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202748 ) ( ON ?auto_202749 ?auto_202750 ) ( CLEAR ?auto_202749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202747 ) ( ON ?auto_202748 ?auto_202747 ) ( not ( = ?auto_202747 ?auto_202748 ) ) ( not ( = ?auto_202747 ?auto_202749 ) ) ( not ( = ?auto_202747 ?auto_202750 ) ) ( not ( = ?auto_202748 ?auto_202749 ) ) ( not ( = ?auto_202748 ?auto_202750 ) ) ( not ( = ?auto_202749 ?auto_202750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202749 ?auto_202750 )
      ( !STACK ?auto_202749 ?auto_202748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202754 - BLOCK
      ?auto_202755 - BLOCK
      ?auto_202756 - BLOCK
    )
    :vars
    (
      ?auto_202757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202756 ?auto_202757 ) ( ON-TABLE ?auto_202754 ) ( not ( = ?auto_202754 ?auto_202755 ) ) ( not ( = ?auto_202754 ?auto_202756 ) ) ( not ( = ?auto_202754 ?auto_202757 ) ) ( not ( = ?auto_202755 ?auto_202756 ) ) ( not ( = ?auto_202755 ?auto_202757 ) ) ( not ( = ?auto_202756 ?auto_202757 ) ) ( CLEAR ?auto_202754 ) ( ON ?auto_202755 ?auto_202756 ) ( CLEAR ?auto_202755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202754 ?auto_202755 )
      ( MAKE-3PILE ?auto_202754 ?auto_202755 ?auto_202756 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202761 - BLOCK
      ?auto_202762 - BLOCK
      ?auto_202763 - BLOCK
    )
    :vars
    (
      ?auto_202764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202763 ?auto_202764 ) ( ON-TABLE ?auto_202761 ) ( not ( = ?auto_202761 ?auto_202762 ) ) ( not ( = ?auto_202761 ?auto_202763 ) ) ( not ( = ?auto_202761 ?auto_202764 ) ) ( not ( = ?auto_202762 ?auto_202763 ) ) ( not ( = ?auto_202762 ?auto_202764 ) ) ( not ( = ?auto_202763 ?auto_202764 ) ) ( CLEAR ?auto_202761 ) ( ON ?auto_202762 ?auto_202763 ) ( CLEAR ?auto_202762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202761 ?auto_202762 )
      ( MAKE-3PILE ?auto_202761 ?auto_202762 ?auto_202763 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202768 - BLOCK
      ?auto_202769 - BLOCK
      ?auto_202770 - BLOCK
    )
    :vars
    (
      ?auto_202771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202770 ?auto_202771 ) ( not ( = ?auto_202768 ?auto_202769 ) ) ( not ( = ?auto_202768 ?auto_202770 ) ) ( not ( = ?auto_202768 ?auto_202771 ) ) ( not ( = ?auto_202769 ?auto_202770 ) ) ( not ( = ?auto_202769 ?auto_202771 ) ) ( not ( = ?auto_202770 ?auto_202771 ) ) ( ON ?auto_202769 ?auto_202770 ) ( ON ?auto_202768 ?auto_202769 ) ( CLEAR ?auto_202768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202768 )
      ( MAKE-3PILE ?auto_202768 ?auto_202769 ?auto_202770 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202775 - BLOCK
      ?auto_202776 - BLOCK
      ?auto_202777 - BLOCK
    )
    :vars
    (
      ?auto_202778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202777 ?auto_202778 ) ( not ( = ?auto_202775 ?auto_202776 ) ) ( not ( = ?auto_202775 ?auto_202777 ) ) ( not ( = ?auto_202775 ?auto_202778 ) ) ( not ( = ?auto_202776 ?auto_202777 ) ) ( not ( = ?auto_202776 ?auto_202778 ) ) ( not ( = ?auto_202777 ?auto_202778 ) ) ( ON ?auto_202776 ?auto_202777 ) ( ON ?auto_202775 ?auto_202776 ) ( CLEAR ?auto_202775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202775 )
      ( MAKE-3PILE ?auto_202775 ?auto_202776 ?auto_202777 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202783 - BLOCK
      ?auto_202784 - BLOCK
      ?auto_202785 - BLOCK
      ?auto_202786 - BLOCK
    )
    :vars
    (
      ?auto_202787 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202785 ) ( ON ?auto_202786 ?auto_202787 ) ( CLEAR ?auto_202786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202783 ) ( ON ?auto_202784 ?auto_202783 ) ( ON ?auto_202785 ?auto_202784 ) ( not ( = ?auto_202783 ?auto_202784 ) ) ( not ( = ?auto_202783 ?auto_202785 ) ) ( not ( = ?auto_202783 ?auto_202786 ) ) ( not ( = ?auto_202783 ?auto_202787 ) ) ( not ( = ?auto_202784 ?auto_202785 ) ) ( not ( = ?auto_202784 ?auto_202786 ) ) ( not ( = ?auto_202784 ?auto_202787 ) ) ( not ( = ?auto_202785 ?auto_202786 ) ) ( not ( = ?auto_202785 ?auto_202787 ) ) ( not ( = ?auto_202786 ?auto_202787 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202786 ?auto_202787 )
      ( !STACK ?auto_202786 ?auto_202785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202792 - BLOCK
      ?auto_202793 - BLOCK
      ?auto_202794 - BLOCK
      ?auto_202795 - BLOCK
    )
    :vars
    (
      ?auto_202796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202794 ) ( ON ?auto_202795 ?auto_202796 ) ( CLEAR ?auto_202795 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202792 ) ( ON ?auto_202793 ?auto_202792 ) ( ON ?auto_202794 ?auto_202793 ) ( not ( = ?auto_202792 ?auto_202793 ) ) ( not ( = ?auto_202792 ?auto_202794 ) ) ( not ( = ?auto_202792 ?auto_202795 ) ) ( not ( = ?auto_202792 ?auto_202796 ) ) ( not ( = ?auto_202793 ?auto_202794 ) ) ( not ( = ?auto_202793 ?auto_202795 ) ) ( not ( = ?auto_202793 ?auto_202796 ) ) ( not ( = ?auto_202794 ?auto_202795 ) ) ( not ( = ?auto_202794 ?auto_202796 ) ) ( not ( = ?auto_202795 ?auto_202796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202795 ?auto_202796 )
      ( !STACK ?auto_202795 ?auto_202794 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202801 - BLOCK
      ?auto_202802 - BLOCK
      ?auto_202803 - BLOCK
      ?auto_202804 - BLOCK
    )
    :vars
    (
      ?auto_202805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202804 ?auto_202805 ) ( ON-TABLE ?auto_202801 ) ( ON ?auto_202802 ?auto_202801 ) ( not ( = ?auto_202801 ?auto_202802 ) ) ( not ( = ?auto_202801 ?auto_202803 ) ) ( not ( = ?auto_202801 ?auto_202804 ) ) ( not ( = ?auto_202801 ?auto_202805 ) ) ( not ( = ?auto_202802 ?auto_202803 ) ) ( not ( = ?auto_202802 ?auto_202804 ) ) ( not ( = ?auto_202802 ?auto_202805 ) ) ( not ( = ?auto_202803 ?auto_202804 ) ) ( not ( = ?auto_202803 ?auto_202805 ) ) ( not ( = ?auto_202804 ?auto_202805 ) ) ( CLEAR ?auto_202802 ) ( ON ?auto_202803 ?auto_202804 ) ( CLEAR ?auto_202803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202801 ?auto_202802 ?auto_202803 )
      ( MAKE-4PILE ?auto_202801 ?auto_202802 ?auto_202803 ?auto_202804 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202810 - BLOCK
      ?auto_202811 - BLOCK
      ?auto_202812 - BLOCK
      ?auto_202813 - BLOCK
    )
    :vars
    (
      ?auto_202814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202813 ?auto_202814 ) ( ON-TABLE ?auto_202810 ) ( ON ?auto_202811 ?auto_202810 ) ( not ( = ?auto_202810 ?auto_202811 ) ) ( not ( = ?auto_202810 ?auto_202812 ) ) ( not ( = ?auto_202810 ?auto_202813 ) ) ( not ( = ?auto_202810 ?auto_202814 ) ) ( not ( = ?auto_202811 ?auto_202812 ) ) ( not ( = ?auto_202811 ?auto_202813 ) ) ( not ( = ?auto_202811 ?auto_202814 ) ) ( not ( = ?auto_202812 ?auto_202813 ) ) ( not ( = ?auto_202812 ?auto_202814 ) ) ( not ( = ?auto_202813 ?auto_202814 ) ) ( CLEAR ?auto_202811 ) ( ON ?auto_202812 ?auto_202813 ) ( CLEAR ?auto_202812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202810 ?auto_202811 ?auto_202812 )
      ( MAKE-4PILE ?auto_202810 ?auto_202811 ?auto_202812 ?auto_202813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202819 - BLOCK
      ?auto_202820 - BLOCK
      ?auto_202821 - BLOCK
      ?auto_202822 - BLOCK
    )
    :vars
    (
      ?auto_202823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202822 ?auto_202823 ) ( ON-TABLE ?auto_202819 ) ( not ( = ?auto_202819 ?auto_202820 ) ) ( not ( = ?auto_202819 ?auto_202821 ) ) ( not ( = ?auto_202819 ?auto_202822 ) ) ( not ( = ?auto_202819 ?auto_202823 ) ) ( not ( = ?auto_202820 ?auto_202821 ) ) ( not ( = ?auto_202820 ?auto_202822 ) ) ( not ( = ?auto_202820 ?auto_202823 ) ) ( not ( = ?auto_202821 ?auto_202822 ) ) ( not ( = ?auto_202821 ?auto_202823 ) ) ( not ( = ?auto_202822 ?auto_202823 ) ) ( ON ?auto_202821 ?auto_202822 ) ( CLEAR ?auto_202819 ) ( ON ?auto_202820 ?auto_202821 ) ( CLEAR ?auto_202820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202819 ?auto_202820 )
      ( MAKE-4PILE ?auto_202819 ?auto_202820 ?auto_202821 ?auto_202822 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202828 - BLOCK
      ?auto_202829 - BLOCK
      ?auto_202830 - BLOCK
      ?auto_202831 - BLOCK
    )
    :vars
    (
      ?auto_202832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202831 ?auto_202832 ) ( ON-TABLE ?auto_202828 ) ( not ( = ?auto_202828 ?auto_202829 ) ) ( not ( = ?auto_202828 ?auto_202830 ) ) ( not ( = ?auto_202828 ?auto_202831 ) ) ( not ( = ?auto_202828 ?auto_202832 ) ) ( not ( = ?auto_202829 ?auto_202830 ) ) ( not ( = ?auto_202829 ?auto_202831 ) ) ( not ( = ?auto_202829 ?auto_202832 ) ) ( not ( = ?auto_202830 ?auto_202831 ) ) ( not ( = ?auto_202830 ?auto_202832 ) ) ( not ( = ?auto_202831 ?auto_202832 ) ) ( ON ?auto_202830 ?auto_202831 ) ( CLEAR ?auto_202828 ) ( ON ?auto_202829 ?auto_202830 ) ( CLEAR ?auto_202829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202828 ?auto_202829 )
      ( MAKE-4PILE ?auto_202828 ?auto_202829 ?auto_202830 ?auto_202831 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202837 - BLOCK
      ?auto_202838 - BLOCK
      ?auto_202839 - BLOCK
      ?auto_202840 - BLOCK
    )
    :vars
    (
      ?auto_202841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202840 ?auto_202841 ) ( not ( = ?auto_202837 ?auto_202838 ) ) ( not ( = ?auto_202837 ?auto_202839 ) ) ( not ( = ?auto_202837 ?auto_202840 ) ) ( not ( = ?auto_202837 ?auto_202841 ) ) ( not ( = ?auto_202838 ?auto_202839 ) ) ( not ( = ?auto_202838 ?auto_202840 ) ) ( not ( = ?auto_202838 ?auto_202841 ) ) ( not ( = ?auto_202839 ?auto_202840 ) ) ( not ( = ?auto_202839 ?auto_202841 ) ) ( not ( = ?auto_202840 ?auto_202841 ) ) ( ON ?auto_202839 ?auto_202840 ) ( ON ?auto_202838 ?auto_202839 ) ( ON ?auto_202837 ?auto_202838 ) ( CLEAR ?auto_202837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202837 )
      ( MAKE-4PILE ?auto_202837 ?auto_202838 ?auto_202839 ?auto_202840 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202846 - BLOCK
      ?auto_202847 - BLOCK
      ?auto_202848 - BLOCK
      ?auto_202849 - BLOCK
    )
    :vars
    (
      ?auto_202850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202849 ?auto_202850 ) ( not ( = ?auto_202846 ?auto_202847 ) ) ( not ( = ?auto_202846 ?auto_202848 ) ) ( not ( = ?auto_202846 ?auto_202849 ) ) ( not ( = ?auto_202846 ?auto_202850 ) ) ( not ( = ?auto_202847 ?auto_202848 ) ) ( not ( = ?auto_202847 ?auto_202849 ) ) ( not ( = ?auto_202847 ?auto_202850 ) ) ( not ( = ?auto_202848 ?auto_202849 ) ) ( not ( = ?auto_202848 ?auto_202850 ) ) ( not ( = ?auto_202849 ?auto_202850 ) ) ( ON ?auto_202848 ?auto_202849 ) ( ON ?auto_202847 ?auto_202848 ) ( ON ?auto_202846 ?auto_202847 ) ( CLEAR ?auto_202846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202846 )
      ( MAKE-4PILE ?auto_202846 ?auto_202847 ?auto_202848 ?auto_202849 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202856 - BLOCK
      ?auto_202857 - BLOCK
      ?auto_202858 - BLOCK
      ?auto_202859 - BLOCK
      ?auto_202860 - BLOCK
    )
    :vars
    (
      ?auto_202861 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202859 ) ( ON ?auto_202860 ?auto_202861 ) ( CLEAR ?auto_202860 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202856 ) ( ON ?auto_202857 ?auto_202856 ) ( ON ?auto_202858 ?auto_202857 ) ( ON ?auto_202859 ?auto_202858 ) ( not ( = ?auto_202856 ?auto_202857 ) ) ( not ( = ?auto_202856 ?auto_202858 ) ) ( not ( = ?auto_202856 ?auto_202859 ) ) ( not ( = ?auto_202856 ?auto_202860 ) ) ( not ( = ?auto_202856 ?auto_202861 ) ) ( not ( = ?auto_202857 ?auto_202858 ) ) ( not ( = ?auto_202857 ?auto_202859 ) ) ( not ( = ?auto_202857 ?auto_202860 ) ) ( not ( = ?auto_202857 ?auto_202861 ) ) ( not ( = ?auto_202858 ?auto_202859 ) ) ( not ( = ?auto_202858 ?auto_202860 ) ) ( not ( = ?auto_202858 ?auto_202861 ) ) ( not ( = ?auto_202859 ?auto_202860 ) ) ( not ( = ?auto_202859 ?auto_202861 ) ) ( not ( = ?auto_202860 ?auto_202861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202860 ?auto_202861 )
      ( !STACK ?auto_202860 ?auto_202859 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202867 - BLOCK
      ?auto_202868 - BLOCK
      ?auto_202869 - BLOCK
      ?auto_202870 - BLOCK
      ?auto_202871 - BLOCK
    )
    :vars
    (
      ?auto_202872 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202870 ) ( ON ?auto_202871 ?auto_202872 ) ( CLEAR ?auto_202871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202867 ) ( ON ?auto_202868 ?auto_202867 ) ( ON ?auto_202869 ?auto_202868 ) ( ON ?auto_202870 ?auto_202869 ) ( not ( = ?auto_202867 ?auto_202868 ) ) ( not ( = ?auto_202867 ?auto_202869 ) ) ( not ( = ?auto_202867 ?auto_202870 ) ) ( not ( = ?auto_202867 ?auto_202871 ) ) ( not ( = ?auto_202867 ?auto_202872 ) ) ( not ( = ?auto_202868 ?auto_202869 ) ) ( not ( = ?auto_202868 ?auto_202870 ) ) ( not ( = ?auto_202868 ?auto_202871 ) ) ( not ( = ?auto_202868 ?auto_202872 ) ) ( not ( = ?auto_202869 ?auto_202870 ) ) ( not ( = ?auto_202869 ?auto_202871 ) ) ( not ( = ?auto_202869 ?auto_202872 ) ) ( not ( = ?auto_202870 ?auto_202871 ) ) ( not ( = ?auto_202870 ?auto_202872 ) ) ( not ( = ?auto_202871 ?auto_202872 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202871 ?auto_202872 )
      ( !STACK ?auto_202871 ?auto_202870 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202878 - BLOCK
      ?auto_202879 - BLOCK
      ?auto_202880 - BLOCK
      ?auto_202881 - BLOCK
      ?auto_202882 - BLOCK
    )
    :vars
    (
      ?auto_202883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202882 ?auto_202883 ) ( ON-TABLE ?auto_202878 ) ( ON ?auto_202879 ?auto_202878 ) ( ON ?auto_202880 ?auto_202879 ) ( not ( = ?auto_202878 ?auto_202879 ) ) ( not ( = ?auto_202878 ?auto_202880 ) ) ( not ( = ?auto_202878 ?auto_202881 ) ) ( not ( = ?auto_202878 ?auto_202882 ) ) ( not ( = ?auto_202878 ?auto_202883 ) ) ( not ( = ?auto_202879 ?auto_202880 ) ) ( not ( = ?auto_202879 ?auto_202881 ) ) ( not ( = ?auto_202879 ?auto_202882 ) ) ( not ( = ?auto_202879 ?auto_202883 ) ) ( not ( = ?auto_202880 ?auto_202881 ) ) ( not ( = ?auto_202880 ?auto_202882 ) ) ( not ( = ?auto_202880 ?auto_202883 ) ) ( not ( = ?auto_202881 ?auto_202882 ) ) ( not ( = ?auto_202881 ?auto_202883 ) ) ( not ( = ?auto_202882 ?auto_202883 ) ) ( CLEAR ?auto_202880 ) ( ON ?auto_202881 ?auto_202882 ) ( CLEAR ?auto_202881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202878 ?auto_202879 ?auto_202880 ?auto_202881 )
      ( MAKE-5PILE ?auto_202878 ?auto_202879 ?auto_202880 ?auto_202881 ?auto_202882 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202889 - BLOCK
      ?auto_202890 - BLOCK
      ?auto_202891 - BLOCK
      ?auto_202892 - BLOCK
      ?auto_202893 - BLOCK
    )
    :vars
    (
      ?auto_202894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202893 ?auto_202894 ) ( ON-TABLE ?auto_202889 ) ( ON ?auto_202890 ?auto_202889 ) ( ON ?auto_202891 ?auto_202890 ) ( not ( = ?auto_202889 ?auto_202890 ) ) ( not ( = ?auto_202889 ?auto_202891 ) ) ( not ( = ?auto_202889 ?auto_202892 ) ) ( not ( = ?auto_202889 ?auto_202893 ) ) ( not ( = ?auto_202889 ?auto_202894 ) ) ( not ( = ?auto_202890 ?auto_202891 ) ) ( not ( = ?auto_202890 ?auto_202892 ) ) ( not ( = ?auto_202890 ?auto_202893 ) ) ( not ( = ?auto_202890 ?auto_202894 ) ) ( not ( = ?auto_202891 ?auto_202892 ) ) ( not ( = ?auto_202891 ?auto_202893 ) ) ( not ( = ?auto_202891 ?auto_202894 ) ) ( not ( = ?auto_202892 ?auto_202893 ) ) ( not ( = ?auto_202892 ?auto_202894 ) ) ( not ( = ?auto_202893 ?auto_202894 ) ) ( CLEAR ?auto_202891 ) ( ON ?auto_202892 ?auto_202893 ) ( CLEAR ?auto_202892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202889 ?auto_202890 ?auto_202891 ?auto_202892 )
      ( MAKE-5PILE ?auto_202889 ?auto_202890 ?auto_202891 ?auto_202892 ?auto_202893 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202900 - BLOCK
      ?auto_202901 - BLOCK
      ?auto_202902 - BLOCK
      ?auto_202903 - BLOCK
      ?auto_202904 - BLOCK
    )
    :vars
    (
      ?auto_202905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202904 ?auto_202905 ) ( ON-TABLE ?auto_202900 ) ( ON ?auto_202901 ?auto_202900 ) ( not ( = ?auto_202900 ?auto_202901 ) ) ( not ( = ?auto_202900 ?auto_202902 ) ) ( not ( = ?auto_202900 ?auto_202903 ) ) ( not ( = ?auto_202900 ?auto_202904 ) ) ( not ( = ?auto_202900 ?auto_202905 ) ) ( not ( = ?auto_202901 ?auto_202902 ) ) ( not ( = ?auto_202901 ?auto_202903 ) ) ( not ( = ?auto_202901 ?auto_202904 ) ) ( not ( = ?auto_202901 ?auto_202905 ) ) ( not ( = ?auto_202902 ?auto_202903 ) ) ( not ( = ?auto_202902 ?auto_202904 ) ) ( not ( = ?auto_202902 ?auto_202905 ) ) ( not ( = ?auto_202903 ?auto_202904 ) ) ( not ( = ?auto_202903 ?auto_202905 ) ) ( not ( = ?auto_202904 ?auto_202905 ) ) ( ON ?auto_202903 ?auto_202904 ) ( CLEAR ?auto_202901 ) ( ON ?auto_202902 ?auto_202903 ) ( CLEAR ?auto_202902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202900 ?auto_202901 ?auto_202902 )
      ( MAKE-5PILE ?auto_202900 ?auto_202901 ?auto_202902 ?auto_202903 ?auto_202904 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202911 - BLOCK
      ?auto_202912 - BLOCK
      ?auto_202913 - BLOCK
      ?auto_202914 - BLOCK
      ?auto_202915 - BLOCK
    )
    :vars
    (
      ?auto_202916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202915 ?auto_202916 ) ( ON-TABLE ?auto_202911 ) ( ON ?auto_202912 ?auto_202911 ) ( not ( = ?auto_202911 ?auto_202912 ) ) ( not ( = ?auto_202911 ?auto_202913 ) ) ( not ( = ?auto_202911 ?auto_202914 ) ) ( not ( = ?auto_202911 ?auto_202915 ) ) ( not ( = ?auto_202911 ?auto_202916 ) ) ( not ( = ?auto_202912 ?auto_202913 ) ) ( not ( = ?auto_202912 ?auto_202914 ) ) ( not ( = ?auto_202912 ?auto_202915 ) ) ( not ( = ?auto_202912 ?auto_202916 ) ) ( not ( = ?auto_202913 ?auto_202914 ) ) ( not ( = ?auto_202913 ?auto_202915 ) ) ( not ( = ?auto_202913 ?auto_202916 ) ) ( not ( = ?auto_202914 ?auto_202915 ) ) ( not ( = ?auto_202914 ?auto_202916 ) ) ( not ( = ?auto_202915 ?auto_202916 ) ) ( ON ?auto_202914 ?auto_202915 ) ( CLEAR ?auto_202912 ) ( ON ?auto_202913 ?auto_202914 ) ( CLEAR ?auto_202913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202911 ?auto_202912 ?auto_202913 )
      ( MAKE-5PILE ?auto_202911 ?auto_202912 ?auto_202913 ?auto_202914 ?auto_202915 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202922 - BLOCK
      ?auto_202923 - BLOCK
      ?auto_202924 - BLOCK
      ?auto_202925 - BLOCK
      ?auto_202926 - BLOCK
    )
    :vars
    (
      ?auto_202927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202926 ?auto_202927 ) ( ON-TABLE ?auto_202922 ) ( not ( = ?auto_202922 ?auto_202923 ) ) ( not ( = ?auto_202922 ?auto_202924 ) ) ( not ( = ?auto_202922 ?auto_202925 ) ) ( not ( = ?auto_202922 ?auto_202926 ) ) ( not ( = ?auto_202922 ?auto_202927 ) ) ( not ( = ?auto_202923 ?auto_202924 ) ) ( not ( = ?auto_202923 ?auto_202925 ) ) ( not ( = ?auto_202923 ?auto_202926 ) ) ( not ( = ?auto_202923 ?auto_202927 ) ) ( not ( = ?auto_202924 ?auto_202925 ) ) ( not ( = ?auto_202924 ?auto_202926 ) ) ( not ( = ?auto_202924 ?auto_202927 ) ) ( not ( = ?auto_202925 ?auto_202926 ) ) ( not ( = ?auto_202925 ?auto_202927 ) ) ( not ( = ?auto_202926 ?auto_202927 ) ) ( ON ?auto_202925 ?auto_202926 ) ( ON ?auto_202924 ?auto_202925 ) ( CLEAR ?auto_202922 ) ( ON ?auto_202923 ?auto_202924 ) ( CLEAR ?auto_202923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202922 ?auto_202923 )
      ( MAKE-5PILE ?auto_202922 ?auto_202923 ?auto_202924 ?auto_202925 ?auto_202926 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202933 - BLOCK
      ?auto_202934 - BLOCK
      ?auto_202935 - BLOCK
      ?auto_202936 - BLOCK
      ?auto_202937 - BLOCK
    )
    :vars
    (
      ?auto_202938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202937 ?auto_202938 ) ( ON-TABLE ?auto_202933 ) ( not ( = ?auto_202933 ?auto_202934 ) ) ( not ( = ?auto_202933 ?auto_202935 ) ) ( not ( = ?auto_202933 ?auto_202936 ) ) ( not ( = ?auto_202933 ?auto_202937 ) ) ( not ( = ?auto_202933 ?auto_202938 ) ) ( not ( = ?auto_202934 ?auto_202935 ) ) ( not ( = ?auto_202934 ?auto_202936 ) ) ( not ( = ?auto_202934 ?auto_202937 ) ) ( not ( = ?auto_202934 ?auto_202938 ) ) ( not ( = ?auto_202935 ?auto_202936 ) ) ( not ( = ?auto_202935 ?auto_202937 ) ) ( not ( = ?auto_202935 ?auto_202938 ) ) ( not ( = ?auto_202936 ?auto_202937 ) ) ( not ( = ?auto_202936 ?auto_202938 ) ) ( not ( = ?auto_202937 ?auto_202938 ) ) ( ON ?auto_202936 ?auto_202937 ) ( ON ?auto_202935 ?auto_202936 ) ( CLEAR ?auto_202933 ) ( ON ?auto_202934 ?auto_202935 ) ( CLEAR ?auto_202934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202933 ?auto_202934 )
      ( MAKE-5PILE ?auto_202933 ?auto_202934 ?auto_202935 ?auto_202936 ?auto_202937 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202944 - BLOCK
      ?auto_202945 - BLOCK
      ?auto_202946 - BLOCK
      ?auto_202947 - BLOCK
      ?auto_202948 - BLOCK
    )
    :vars
    (
      ?auto_202949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202948 ?auto_202949 ) ( not ( = ?auto_202944 ?auto_202945 ) ) ( not ( = ?auto_202944 ?auto_202946 ) ) ( not ( = ?auto_202944 ?auto_202947 ) ) ( not ( = ?auto_202944 ?auto_202948 ) ) ( not ( = ?auto_202944 ?auto_202949 ) ) ( not ( = ?auto_202945 ?auto_202946 ) ) ( not ( = ?auto_202945 ?auto_202947 ) ) ( not ( = ?auto_202945 ?auto_202948 ) ) ( not ( = ?auto_202945 ?auto_202949 ) ) ( not ( = ?auto_202946 ?auto_202947 ) ) ( not ( = ?auto_202946 ?auto_202948 ) ) ( not ( = ?auto_202946 ?auto_202949 ) ) ( not ( = ?auto_202947 ?auto_202948 ) ) ( not ( = ?auto_202947 ?auto_202949 ) ) ( not ( = ?auto_202948 ?auto_202949 ) ) ( ON ?auto_202947 ?auto_202948 ) ( ON ?auto_202946 ?auto_202947 ) ( ON ?auto_202945 ?auto_202946 ) ( ON ?auto_202944 ?auto_202945 ) ( CLEAR ?auto_202944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202944 )
      ( MAKE-5PILE ?auto_202944 ?auto_202945 ?auto_202946 ?auto_202947 ?auto_202948 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202955 - BLOCK
      ?auto_202956 - BLOCK
      ?auto_202957 - BLOCK
      ?auto_202958 - BLOCK
      ?auto_202959 - BLOCK
    )
    :vars
    (
      ?auto_202960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202959 ?auto_202960 ) ( not ( = ?auto_202955 ?auto_202956 ) ) ( not ( = ?auto_202955 ?auto_202957 ) ) ( not ( = ?auto_202955 ?auto_202958 ) ) ( not ( = ?auto_202955 ?auto_202959 ) ) ( not ( = ?auto_202955 ?auto_202960 ) ) ( not ( = ?auto_202956 ?auto_202957 ) ) ( not ( = ?auto_202956 ?auto_202958 ) ) ( not ( = ?auto_202956 ?auto_202959 ) ) ( not ( = ?auto_202956 ?auto_202960 ) ) ( not ( = ?auto_202957 ?auto_202958 ) ) ( not ( = ?auto_202957 ?auto_202959 ) ) ( not ( = ?auto_202957 ?auto_202960 ) ) ( not ( = ?auto_202958 ?auto_202959 ) ) ( not ( = ?auto_202958 ?auto_202960 ) ) ( not ( = ?auto_202959 ?auto_202960 ) ) ( ON ?auto_202958 ?auto_202959 ) ( ON ?auto_202957 ?auto_202958 ) ( ON ?auto_202956 ?auto_202957 ) ( ON ?auto_202955 ?auto_202956 ) ( CLEAR ?auto_202955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202955 )
      ( MAKE-5PILE ?auto_202955 ?auto_202956 ?auto_202957 ?auto_202958 ?auto_202959 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_202967 - BLOCK
      ?auto_202968 - BLOCK
      ?auto_202969 - BLOCK
      ?auto_202970 - BLOCK
      ?auto_202971 - BLOCK
      ?auto_202972 - BLOCK
    )
    :vars
    (
      ?auto_202973 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202971 ) ( ON ?auto_202972 ?auto_202973 ) ( CLEAR ?auto_202972 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202967 ) ( ON ?auto_202968 ?auto_202967 ) ( ON ?auto_202969 ?auto_202968 ) ( ON ?auto_202970 ?auto_202969 ) ( ON ?auto_202971 ?auto_202970 ) ( not ( = ?auto_202967 ?auto_202968 ) ) ( not ( = ?auto_202967 ?auto_202969 ) ) ( not ( = ?auto_202967 ?auto_202970 ) ) ( not ( = ?auto_202967 ?auto_202971 ) ) ( not ( = ?auto_202967 ?auto_202972 ) ) ( not ( = ?auto_202967 ?auto_202973 ) ) ( not ( = ?auto_202968 ?auto_202969 ) ) ( not ( = ?auto_202968 ?auto_202970 ) ) ( not ( = ?auto_202968 ?auto_202971 ) ) ( not ( = ?auto_202968 ?auto_202972 ) ) ( not ( = ?auto_202968 ?auto_202973 ) ) ( not ( = ?auto_202969 ?auto_202970 ) ) ( not ( = ?auto_202969 ?auto_202971 ) ) ( not ( = ?auto_202969 ?auto_202972 ) ) ( not ( = ?auto_202969 ?auto_202973 ) ) ( not ( = ?auto_202970 ?auto_202971 ) ) ( not ( = ?auto_202970 ?auto_202972 ) ) ( not ( = ?auto_202970 ?auto_202973 ) ) ( not ( = ?auto_202971 ?auto_202972 ) ) ( not ( = ?auto_202971 ?auto_202973 ) ) ( not ( = ?auto_202972 ?auto_202973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202972 ?auto_202973 )
      ( !STACK ?auto_202972 ?auto_202971 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_202980 - BLOCK
      ?auto_202981 - BLOCK
      ?auto_202982 - BLOCK
      ?auto_202983 - BLOCK
      ?auto_202984 - BLOCK
      ?auto_202985 - BLOCK
    )
    :vars
    (
      ?auto_202986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202984 ) ( ON ?auto_202985 ?auto_202986 ) ( CLEAR ?auto_202985 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202980 ) ( ON ?auto_202981 ?auto_202980 ) ( ON ?auto_202982 ?auto_202981 ) ( ON ?auto_202983 ?auto_202982 ) ( ON ?auto_202984 ?auto_202983 ) ( not ( = ?auto_202980 ?auto_202981 ) ) ( not ( = ?auto_202980 ?auto_202982 ) ) ( not ( = ?auto_202980 ?auto_202983 ) ) ( not ( = ?auto_202980 ?auto_202984 ) ) ( not ( = ?auto_202980 ?auto_202985 ) ) ( not ( = ?auto_202980 ?auto_202986 ) ) ( not ( = ?auto_202981 ?auto_202982 ) ) ( not ( = ?auto_202981 ?auto_202983 ) ) ( not ( = ?auto_202981 ?auto_202984 ) ) ( not ( = ?auto_202981 ?auto_202985 ) ) ( not ( = ?auto_202981 ?auto_202986 ) ) ( not ( = ?auto_202982 ?auto_202983 ) ) ( not ( = ?auto_202982 ?auto_202984 ) ) ( not ( = ?auto_202982 ?auto_202985 ) ) ( not ( = ?auto_202982 ?auto_202986 ) ) ( not ( = ?auto_202983 ?auto_202984 ) ) ( not ( = ?auto_202983 ?auto_202985 ) ) ( not ( = ?auto_202983 ?auto_202986 ) ) ( not ( = ?auto_202984 ?auto_202985 ) ) ( not ( = ?auto_202984 ?auto_202986 ) ) ( not ( = ?auto_202985 ?auto_202986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202985 ?auto_202986 )
      ( !STACK ?auto_202985 ?auto_202984 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_202993 - BLOCK
      ?auto_202994 - BLOCK
      ?auto_202995 - BLOCK
      ?auto_202996 - BLOCK
      ?auto_202997 - BLOCK
      ?auto_202998 - BLOCK
    )
    :vars
    (
      ?auto_202999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202998 ?auto_202999 ) ( ON-TABLE ?auto_202993 ) ( ON ?auto_202994 ?auto_202993 ) ( ON ?auto_202995 ?auto_202994 ) ( ON ?auto_202996 ?auto_202995 ) ( not ( = ?auto_202993 ?auto_202994 ) ) ( not ( = ?auto_202993 ?auto_202995 ) ) ( not ( = ?auto_202993 ?auto_202996 ) ) ( not ( = ?auto_202993 ?auto_202997 ) ) ( not ( = ?auto_202993 ?auto_202998 ) ) ( not ( = ?auto_202993 ?auto_202999 ) ) ( not ( = ?auto_202994 ?auto_202995 ) ) ( not ( = ?auto_202994 ?auto_202996 ) ) ( not ( = ?auto_202994 ?auto_202997 ) ) ( not ( = ?auto_202994 ?auto_202998 ) ) ( not ( = ?auto_202994 ?auto_202999 ) ) ( not ( = ?auto_202995 ?auto_202996 ) ) ( not ( = ?auto_202995 ?auto_202997 ) ) ( not ( = ?auto_202995 ?auto_202998 ) ) ( not ( = ?auto_202995 ?auto_202999 ) ) ( not ( = ?auto_202996 ?auto_202997 ) ) ( not ( = ?auto_202996 ?auto_202998 ) ) ( not ( = ?auto_202996 ?auto_202999 ) ) ( not ( = ?auto_202997 ?auto_202998 ) ) ( not ( = ?auto_202997 ?auto_202999 ) ) ( not ( = ?auto_202998 ?auto_202999 ) ) ( CLEAR ?auto_202996 ) ( ON ?auto_202997 ?auto_202998 ) ( CLEAR ?auto_202997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202993 ?auto_202994 ?auto_202995 ?auto_202996 ?auto_202997 )
      ( MAKE-6PILE ?auto_202993 ?auto_202994 ?auto_202995 ?auto_202996 ?auto_202997 ?auto_202998 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203006 - BLOCK
      ?auto_203007 - BLOCK
      ?auto_203008 - BLOCK
      ?auto_203009 - BLOCK
      ?auto_203010 - BLOCK
      ?auto_203011 - BLOCK
    )
    :vars
    (
      ?auto_203012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203011 ?auto_203012 ) ( ON-TABLE ?auto_203006 ) ( ON ?auto_203007 ?auto_203006 ) ( ON ?auto_203008 ?auto_203007 ) ( ON ?auto_203009 ?auto_203008 ) ( not ( = ?auto_203006 ?auto_203007 ) ) ( not ( = ?auto_203006 ?auto_203008 ) ) ( not ( = ?auto_203006 ?auto_203009 ) ) ( not ( = ?auto_203006 ?auto_203010 ) ) ( not ( = ?auto_203006 ?auto_203011 ) ) ( not ( = ?auto_203006 ?auto_203012 ) ) ( not ( = ?auto_203007 ?auto_203008 ) ) ( not ( = ?auto_203007 ?auto_203009 ) ) ( not ( = ?auto_203007 ?auto_203010 ) ) ( not ( = ?auto_203007 ?auto_203011 ) ) ( not ( = ?auto_203007 ?auto_203012 ) ) ( not ( = ?auto_203008 ?auto_203009 ) ) ( not ( = ?auto_203008 ?auto_203010 ) ) ( not ( = ?auto_203008 ?auto_203011 ) ) ( not ( = ?auto_203008 ?auto_203012 ) ) ( not ( = ?auto_203009 ?auto_203010 ) ) ( not ( = ?auto_203009 ?auto_203011 ) ) ( not ( = ?auto_203009 ?auto_203012 ) ) ( not ( = ?auto_203010 ?auto_203011 ) ) ( not ( = ?auto_203010 ?auto_203012 ) ) ( not ( = ?auto_203011 ?auto_203012 ) ) ( CLEAR ?auto_203009 ) ( ON ?auto_203010 ?auto_203011 ) ( CLEAR ?auto_203010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203006 ?auto_203007 ?auto_203008 ?auto_203009 ?auto_203010 )
      ( MAKE-6PILE ?auto_203006 ?auto_203007 ?auto_203008 ?auto_203009 ?auto_203010 ?auto_203011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203019 - BLOCK
      ?auto_203020 - BLOCK
      ?auto_203021 - BLOCK
      ?auto_203022 - BLOCK
      ?auto_203023 - BLOCK
      ?auto_203024 - BLOCK
    )
    :vars
    (
      ?auto_203025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203024 ?auto_203025 ) ( ON-TABLE ?auto_203019 ) ( ON ?auto_203020 ?auto_203019 ) ( ON ?auto_203021 ?auto_203020 ) ( not ( = ?auto_203019 ?auto_203020 ) ) ( not ( = ?auto_203019 ?auto_203021 ) ) ( not ( = ?auto_203019 ?auto_203022 ) ) ( not ( = ?auto_203019 ?auto_203023 ) ) ( not ( = ?auto_203019 ?auto_203024 ) ) ( not ( = ?auto_203019 ?auto_203025 ) ) ( not ( = ?auto_203020 ?auto_203021 ) ) ( not ( = ?auto_203020 ?auto_203022 ) ) ( not ( = ?auto_203020 ?auto_203023 ) ) ( not ( = ?auto_203020 ?auto_203024 ) ) ( not ( = ?auto_203020 ?auto_203025 ) ) ( not ( = ?auto_203021 ?auto_203022 ) ) ( not ( = ?auto_203021 ?auto_203023 ) ) ( not ( = ?auto_203021 ?auto_203024 ) ) ( not ( = ?auto_203021 ?auto_203025 ) ) ( not ( = ?auto_203022 ?auto_203023 ) ) ( not ( = ?auto_203022 ?auto_203024 ) ) ( not ( = ?auto_203022 ?auto_203025 ) ) ( not ( = ?auto_203023 ?auto_203024 ) ) ( not ( = ?auto_203023 ?auto_203025 ) ) ( not ( = ?auto_203024 ?auto_203025 ) ) ( ON ?auto_203023 ?auto_203024 ) ( CLEAR ?auto_203021 ) ( ON ?auto_203022 ?auto_203023 ) ( CLEAR ?auto_203022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203019 ?auto_203020 ?auto_203021 ?auto_203022 )
      ( MAKE-6PILE ?auto_203019 ?auto_203020 ?auto_203021 ?auto_203022 ?auto_203023 ?auto_203024 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203032 - BLOCK
      ?auto_203033 - BLOCK
      ?auto_203034 - BLOCK
      ?auto_203035 - BLOCK
      ?auto_203036 - BLOCK
      ?auto_203037 - BLOCK
    )
    :vars
    (
      ?auto_203038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203037 ?auto_203038 ) ( ON-TABLE ?auto_203032 ) ( ON ?auto_203033 ?auto_203032 ) ( ON ?auto_203034 ?auto_203033 ) ( not ( = ?auto_203032 ?auto_203033 ) ) ( not ( = ?auto_203032 ?auto_203034 ) ) ( not ( = ?auto_203032 ?auto_203035 ) ) ( not ( = ?auto_203032 ?auto_203036 ) ) ( not ( = ?auto_203032 ?auto_203037 ) ) ( not ( = ?auto_203032 ?auto_203038 ) ) ( not ( = ?auto_203033 ?auto_203034 ) ) ( not ( = ?auto_203033 ?auto_203035 ) ) ( not ( = ?auto_203033 ?auto_203036 ) ) ( not ( = ?auto_203033 ?auto_203037 ) ) ( not ( = ?auto_203033 ?auto_203038 ) ) ( not ( = ?auto_203034 ?auto_203035 ) ) ( not ( = ?auto_203034 ?auto_203036 ) ) ( not ( = ?auto_203034 ?auto_203037 ) ) ( not ( = ?auto_203034 ?auto_203038 ) ) ( not ( = ?auto_203035 ?auto_203036 ) ) ( not ( = ?auto_203035 ?auto_203037 ) ) ( not ( = ?auto_203035 ?auto_203038 ) ) ( not ( = ?auto_203036 ?auto_203037 ) ) ( not ( = ?auto_203036 ?auto_203038 ) ) ( not ( = ?auto_203037 ?auto_203038 ) ) ( ON ?auto_203036 ?auto_203037 ) ( CLEAR ?auto_203034 ) ( ON ?auto_203035 ?auto_203036 ) ( CLEAR ?auto_203035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203032 ?auto_203033 ?auto_203034 ?auto_203035 )
      ( MAKE-6PILE ?auto_203032 ?auto_203033 ?auto_203034 ?auto_203035 ?auto_203036 ?auto_203037 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203045 - BLOCK
      ?auto_203046 - BLOCK
      ?auto_203047 - BLOCK
      ?auto_203048 - BLOCK
      ?auto_203049 - BLOCK
      ?auto_203050 - BLOCK
    )
    :vars
    (
      ?auto_203051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203050 ?auto_203051 ) ( ON-TABLE ?auto_203045 ) ( ON ?auto_203046 ?auto_203045 ) ( not ( = ?auto_203045 ?auto_203046 ) ) ( not ( = ?auto_203045 ?auto_203047 ) ) ( not ( = ?auto_203045 ?auto_203048 ) ) ( not ( = ?auto_203045 ?auto_203049 ) ) ( not ( = ?auto_203045 ?auto_203050 ) ) ( not ( = ?auto_203045 ?auto_203051 ) ) ( not ( = ?auto_203046 ?auto_203047 ) ) ( not ( = ?auto_203046 ?auto_203048 ) ) ( not ( = ?auto_203046 ?auto_203049 ) ) ( not ( = ?auto_203046 ?auto_203050 ) ) ( not ( = ?auto_203046 ?auto_203051 ) ) ( not ( = ?auto_203047 ?auto_203048 ) ) ( not ( = ?auto_203047 ?auto_203049 ) ) ( not ( = ?auto_203047 ?auto_203050 ) ) ( not ( = ?auto_203047 ?auto_203051 ) ) ( not ( = ?auto_203048 ?auto_203049 ) ) ( not ( = ?auto_203048 ?auto_203050 ) ) ( not ( = ?auto_203048 ?auto_203051 ) ) ( not ( = ?auto_203049 ?auto_203050 ) ) ( not ( = ?auto_203049 ?auto_203051 ) ) ( not ( = ?auto_203050 ?auto_203051 ) ) ( ON ?auto_203049 ?auto_203050 ) ( ON ?auto_203048 ?auto_203049 ) ( CLEAR ?auto_203046 ) ( ON ?auto_203047 ?auto_203048 ) ( CLEAR ?auto_203047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203045 ?auto_203046 ?auto_203047 )
      ( MAKE-6PILE ?auto_203045 ?auto_203046 ?auto_203047 ?auto_203048 ?auto_203049 ?auto_203050 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203058 - BLOCK
      ?auto_203059 - BLOCK
      ?auto_203060 - BLOCK
      ?auto_203061 - BLOCK
      ?auto_203062 - BLOCK
      ?auto_203063 - BLOCK
    )
    :vars
    (
      ?auto_203064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203063 ?auto_203064 ) ( ON-TABLE ?auto_203058 ) ( ON ?auto_203059 ?auto_203058 ) ( not ( = ?auto_203058 ?auto_203059 ) ) ( not ( = ?auto_203058 ?auto_203060 ) ) ( not ( = ?auto_203058 ?auto_203061 ) ) ( not ( = ?auto_203058 ?auto_203062 ) ) ( not ( = ?auto_203058 ?auto_203063 ) ) ( not ( = ?auto_203058 ?auto_203064 ) ) ( not ( = ?auto_203059 ?auto_203060 ) ) ( not ( = ?auto_203059 ?auto_203061 ) ) ( not ( = ?auto_203059 ?auto_203062 ) ) ( not ( = ?auto_203059 ?auto_203063 ) ) ( not ( = ?auto_203059 ?auto_203064 ) ) ( not ( = ?auto_203060 ?auto_203061 ) ) ( not ( = ?auto_203060 ?auto_203062 ) ) ( not ( = ?auto_203060 ?auto_203063 ) ) ( not ( = ?auto_203060 ?auto_203064 ) ) ( not ( = ?auto_203061 ?auto_203062 ) ) ( not ( = ?auto_203061 ?auto_203063 ) ) ( not ( = ?auto_203061 ?auto_203064 ) ) ( not ( = ?auto_203062 ?auto_203063 ) ) ( not ( = ?auto_203062 ?auto_203064 ) ) ( not ( = ?auto_203063 ?auto_203064 ) ) ( ON ?auto_203062 ?auto_203063 ) ( ON ?auto_203061 ?auto_203062 ) ( CLEAR ?auto_203059 ) ( ON ?auto_203060 ?auto_203061 ) ( CLEAR ?auto_203060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203058 ?auto_203059 ?auto_203060 )
      ( MAKE-6PILE ?auto_203058 ?auto_203059 ?auto_203060 ?auto_203061 ?auto_203062 ?auto_203063 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203071 - BLOCK
      ?auto_203072 - BLOCK
      ?auto_203073 - BLOCK
      ?auto_203074 - BLOCK
      ?auto_203075 - BLOCK
      ?auto_203076 - BLOCK
    )
    :vars
    (
      ?auto_203077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203076 ?auto_203077 ) ( ON-TABLE ?auto_203071 ) ( not ( = ?auto_203071 ?auto_203072 ) ) ( not ( = ?auto_203071 ?auto_203073 ) ) ( not ( = ?auto_203071 ?auto_203074 ) ) ( not ( = ?auto_203071 ?auto_203075 ) ) ( not ( = ?auto_203071 ?auto_203076 ) ) ( not ( = ?auto_203071 ?auto_203077 ) ) ( not ( = ?auto_203072 ?auto_203073 ) ) ( not ( = ?auto_203072 ?auto_203074 ) ) ( not ( = ?auto_203072 ?auto_203075 ) ) ( not ( = ?auto_203072 ?auto_203076 ) ) ( not ( = ?auto_203072 ?auto_203077 ) ) ( not ( = ?auto_203073 ?auto_203074 ) ) ( not ( = ?auto_203073 ?auto_203075 ) ) ( not ( = ?auto_203073 ?auto_203076 ) ) ( not ( = ?auto_203073 ?auto_203077 ) ) ( not ( = ?auto_203074 ?auto_203075 ) ) ( not ( = ?auto_203074 ?auto_203076 ) ) ( not ( = ?auto_203074 ?auto_203077 ) ) ( not ( = ?auto_203075 ?auto_203076 ) ) ( not ( = ?auto_203075 ?auto_203077 ) ) ( not ( = ?auto_203076 ?auto_203077 ) ) ( ON ?auto_203075 ?auto_203076 ) ( ON ?auto_203074 ?auto_203075 ) ( ON ?auto_203073 ?auto_203074 ) ( CLEAR ?auto_203071 ) ( ON ?auto_203072 ?auto_203073 ) ( CLEAR ?auto_203072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203071 ?auto_203072 )
      ( MAKE-6PILE ?auto_203071 ?auto_203072 ?auto_203073 ?auto_203074 ?auto_203075 ?auto_203076 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203084 - BLOCK
      ?auto_203085 - BLOCK
      ?auto_203086 - BLOCK
      ?auto_203087 - BLOCK
      ?auto_203088 - BLOCK
      ?auto_203089 - BLOCK
    )
    :vars
    (
      ?auto_203090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203089 ?auto_203090 ) ( ON-TABLE ?auto_203084 ) ( not ( = ?auto_203084 ?auto_203085 ) ) ( not ( = ?auto_203084 ?auto_203086 ) ) ( not ( = ?auto_203084 ?auto_203087 ) ) ( not ( = ?auto_203084 ?auto_203088 ) ) ( not ( = ?auto_203084 ?auto_203089 ) ) ( not ( = ?auto_203084 ?auto_203090 ) ) ( not ( = ?auto_203085 ?auto_203086 ) ) ( not ( = ?auto_203085 ?auto_203087 ) ) ( not ( = ?auto_203085 ?auto_203088 ) ) ( not ( = ?auto_203085 ?auto_203089 ) ) ( not ( = ?auto_203085 ?auto_203090 ) ) ( not ( = ?auto_203086 ?auto_203087 ) ) ( not ( = ?auto_203086 ?auto_203088 ) ) ( not ( = ?auto_203086 ?auto_203089 ) ) ( not ( = ?auto_203086 ?auto_203090 ) ) ( not ( = ?auto_203087 ?auto_203088 ) ) ( not ( = ?auto_203087 ?auto_203089 ) ) ( not ( = ?auto_203087 ?auto_203090 ) ) ( not ( = ?auto_203088 ?auto_203089 ) ) ( not ( = ?auto_203088 ?auto_203090 ) ) ( not ( = ?auto_203089 ?auto_203090 ) ) ( ON ?auto_203088 ?auto_203089 ) ( ON ?auto_203087 ?auto_203088 ) ( ON ?auto_203086 ?auto_203087 ) ( CLEAR ?auto_203084 ) ( ON ?auto_203085 ?auto_203086 ) ( CLEAR ?auto_203085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203084 ?auto_203085 )
      ( MAKE-6PILE ?auto_203084 ?auto_203085 ?auto_203086 ?auto_203087 ?auto_203088 ?auto_203089 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203097 - BLOCK
      ?auto_203098 - BLOCK
      ?auto_203099 - BLOCK
      ?auto_203100 - BLOCK
      ?auto_203101 - BLOCK
      ?auto_203102 - BLOCK
    )
    :vars
    (
      ?auto_203103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203102 ?auto_203103 ) ( not ( = ?auto_203097 ?auto_203098 ) ) ( not ( = ?auto_203097 ?auto_203099 ) ) ( not ( = ?auto_203097 ?auto_203100 ) ) ( not ( = ?auto_203097 ?auto_203101 ) ) ( not ( = ?auto_203097 ?auto_203102 ) ) ( not ( = ?auto_203097 ?auto_203103 ) ) ( not ( = ?auto_203098 ?auto_203099 ) ) ( not ( = ?auto_203098 ?auto_203100 ) ) ( not ( = ?auto_203098 ?auto_203101 ) ) ( not ( = ?auto_203098 ?auto_203102 ) ) ( not ( = ?auto_203098 ?auto_203103 ) ) ( not ( = ?auto_203099 ?auto_203100 ) ) ( not ( = ?auto_203099 ?auto_203101 ) ) ( not ( = ?auto_203099 ?auto_203102 ) ) ( not ( = ?auto_203099 ?auto_203103 ) ) ( not ( = ?auto_203100 ?auto_203101 ) ) ( not ( = ?auto_203100 ?auto_203102 ) ) ( not ( = ?auto_203100 ?auto_203103 ) ) ( not ( = ?auto_203101 ?auto_203102 ) ) ( not ( = ?auto_203101 ?auto_203103 ) ) ( not ( = ?auto_203102 ?auto_203103 ) ) ( ON ?auto_203101 ?auto_203102 ) ( ON ?auto_203100 ?auto_203101 ) ( ON ?auto_203099 ?auto_203100 ) ( ON ?auto_203098 ?auto_203099 ) ( ON ?auto_203097 ?auto_203098 ) ( CLEAR ?auto_203097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203097 )
      ( MAKE-6PILE ?auto_203097 ?auto_203098 ?auto_203099 ?auto_203100 ?auto_203101 ?auto_203102 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203110 - BLOCK
      ?auto_203111 - BLOCK
      ?auto_203112 - BLOCK
      ?auto_203113 - BLOCK
      ?auto_203114 - BLOCK
      ?auto_203115 - BLOCK
    )
    :vars
    (
      ?auto_203116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203115 ?auto_203116 ) ( not ( = ?auto_203110 ?auto_203111 ) ) ( not ( = ?auto_203110 ?auto_203112 ) ) ( not ( = ?auto_203110 ?auto_203113 ) ) ( not ( = ?auto_203110 ?auto_203114 ) ) ( not ( = ?auto_203110 ?auto_203115 ) ) ( not ( = ?auto_203110 ?auto_203116 ) ) ( not ( = ?auto_203111 ?auto_203112 ) ) ( not ( = ?auto_203111 ?auto_203113 ) ) ( not ( = ?auto_203111 ?auto_203114 ) ) ( not ( = ?auto_203111 ?auto_203115 ) ) ( not ( = ?auto_203111 ?auto_203116 ) ) ( not ( = ?auto_203112 ?auto_203113 ) ) ( not ( = ?auto_203112 ?auto_203114 ) ) ( not ( = ?auto_203112 ?auto_203115 ) ) ( not ( = ?auto_203112 ?auto_203116 ) ) ( not ( = ?auto_203113 ?auto_203114 ) ) ( not ( = ?auto_203113 ?auto_203115 ) ) ( not ( = ?auto_203113 ?auto_203116 ) ) ( not ( = ?auto_203114 ?auto_203115 ) ) ( not ( = ?auto_203114 ?auto_203116 ) ) ( not ( = ?auto_203115 ?auto_203116 ) ) ( ON ?auto_203114 ?auto_203115 ) ( ON ?auto_203113 ?auto_203114 ) ( ON ?auto_203112 ?auto_203113 ) ( ON ?auto_203111 ?auto_203112 ) ( ON ?auto_203110 ?auto_203111 ) ( CLEAR ?auto_203110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203110 )
      ( MAKE-6PILE ?auto_203110 ?auto_203111 ?auto_203112 ?auto_203113 ?auto_203114 ?auto_203115 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203124 - BLOCK
      ?auto_203125 - BLOCK
      ?auto_203126 - BLOCK
      ?auto_203127 - BLOCK
      ?auto_203128 - BLOCK
      ?auto_203129 - BLOCK
      ?auto_203130 - BLOCK
    )
    :vars
    (
      ?auto_203131 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_203129 ) ( ON ?auto_203130 ?auto_203131 ) ( CLEAR ?auto_203130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203124 ) ( ON ?auto_203125 ?auto_203124 ) ( ON ?auto_203126 ?auto_203125 ) ( ON ?auto_203127 ?auto_203126 ) ( ON ?auto_203128 ?auto_203127 ) ( ON ?auto_203129 ?auto_203128 ) ( not ( = ?auto_203124 ?auto_203125 ) ) ( not ( = ?auto_203124 ?auto_203126 ) ) ( not ( = ?auto_203124 ?auto_203127 ) ) ( not ( = ?auto_203124 ?auto_203128 ) ) ( not ( = ?auto_203124 ?auto_203129 ) ) ( not ( = ?auto_203124 ?auto_203130 ) ) ( not ( = ?auto_203124 ?auto_203131 ) ) ( not ( = ?auto_203125 ?auto_203126 ) ) ( not ( = ?auto_203125 ?auto_203127 ) ) ( not ( = ?auto_203125 ?auto_203128 ) ) ( not ( = ?auto_203125 ?auto_203129 ) ) ( not ( = ?auto_203125 ?auto_203130 ) ) ( not ( = ?auto_203125 ?auto_203131 ) ) ( not ( = ?auto_203126 ?auto_203127 ) ) ( not ( = ?auto_203126 ?auto_203128 ) ) ( not ( = ?auto_203126 ?auto_203129 ) ) ( not ( = ?auto_203126 ?auto_203130 ) ) ( not ( = ?auto_203126 ?auto_203131 ) ) ( not ( = ?auto_203127 ?auto_203128 ) ) ( not ( = ?auto_203127 ?auto_203129 ) ) ( not ( = ?auto_203127 ?auto_203130 ) ) ( not ( = ?auto_203127 ?auto_203131 ) ) ( not ( = ?auto_203128 ?auto_203129 ) ) ( not ( = ?auto_203128 ?auto_203130 ) ) ( not ( = ?auto_203128 ?auto_203131 ) ) ( not ( = ?auto_203129 ?auto_203130 ) ) ( not ( = ?auto_203129 ?auto_203131 ) ) ( not ( = ?auto_203130 ?auto_203131 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203130 ?auto_203131 )
      ( !STACK ?auto_203130 ?auto_203129 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203139 - BLOCK
      ?auto_203140 - BLOCK
      ?auto_203141 - BLOCK
      ?auto_203142 - BLOCK
      ?auto_203143 - BLOCK
      ?auto_203144 - BLOCK
      ?auto_203145 - BLOCK
    )
    :vars
    (
      ?auto_203146 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_203144 ) ( ON ?auto_203145 ?auto_203146 ) ( CLEAR ?auto_203145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203139 ) ( ON ?auto_203140 ?auto_203139 ) ( ON ?auto_203141 ?auto_203140 ) ( ON ?auto_203142 ?auto_203141 ) ( ON ?auto_203143 ?auto_203142 ) ( ON ?auto_203144 ?auto_203143 ) ( not ( = ?auto_203139 ?auto_203140 ) ) ( not ( = ?auto_203139 ?auto_203141 ) ) ( not ( = ?auto_203139 ?auto_203142 ) ) ( not ( = ?auto_203139 ?auto_203143 ) ) ( not ( = ?auto_203139 ?auto_203144 ) ) ( not ( = ?auto_203139 ?auto_203145 ) ) ( not ( = ?auto_203139 ?auto_203146 ) ) ( not ( = ?auto_203140 ?auto_203141 ) ) ( not ( = ?auto_203140 ?auto_203142 ) ) ( not ( = ?auto_203140 ?auto_203143 ) ) ( not ( = ?auto_203140 ?auto_203144 ) ) ( not ( = ?auto_203140 ?auto_203145 ) ) ( not ( = ?auto_203140 ?auto_203146 ) ) ( not ( = ?auto_203141 ?auto_203142 ) ) ( not ( = ?auto_203141 ?auto_203143 ) ) ( not ( = ?auto_203141 ?auto_203144 ) ) ( not ( = ?auto_203141 ?auto_203145 ) ) ( not ( = ?auto_203141 ?auto_203146 ) ) ( not ( = ?auto_203142 ?auto_203143 ) ) ( not ( = ?auto_203142 ?auto_203144 ) ) ( not ( = ?auto_203142 ?auto_203145 ) ) ( not ( = ?auto_203142 ?auto_203146 ) ) ( not ( = ?auto_203143 ?auto_203144 ) ) ( not ( = ?auto_203143 ?auto_203145 ) ) ( not ( = ?auto_203143 ?auto_203146 ) ) ( not ( = ?auto_203144 ?auto_203145 ) ) ( not ( = ?auto_203144 ?auto_203146 ) ) ( not ( = ?auto_203145 ?auto_203146 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203145 ?auto_203146 )
      ( !STACK ?auto_203145 ?auto_203144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203154 - BLOCK
      ?auto_203155 - BLOCK
      ?auto_203156 - BLOCK
      ?auto_203157 - BLOCK
      ?auto_203158 - BLOCK
      ?auto_203159 - BLOCK
      ?auto_203160 - BLOCK
    )
    :vars
    (
      ?auto_203161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203160 ?auto_203161 ) ( ON-TABLE ?auto_203154 ) ( ON ?auto_203155 ?auto_203154 ) ( ON ?auto_203156 ?auto_203155 ) ( ON ?auto_203157 ?auto_203156 ) ( ON ?auto_203158 ?auto_203157 ) ( not ( = ?auto_203154 ?auto_203155 ) ) ( not ( = ?auto_203154 ?auto_203156 ) ) ( not ( = ?auto_203154 ?auto_203157 ) ) ( not ( = ?auto_203154 ?auto_203158 ) ) ( not ( = ?auto_203154 ?auto_203159 ) ) ( not ( = ?auto_203154 ?auto_203160 ) ) ( not ( = ?auto_203154 ?auto_203161 ) ) ( not ( = ?auto_203155 ?auto_203156 ) ) ( not ( = ?auto_203155 ?auto_203157 ) ) ( not ( = ?auto_203155 ?auto_203158 ) ) ( not ( = ?auto_203155 ?auto_203159 ) ) ( not ( = ?auto_203155 ?auto_203160 ) ) ( not ( = ?auto_203155 ?auto_203161 ) ) ( not ( = ?auto_203156 ?auto_203157 ) ) ( not ( = ?auto_203156 ?auto_203158 ) ) ( not ( = ?auto_203156 ?auto_203159 ) ) ( not ( = ?auto_203156 ?auto_203160 ) ) ( not ( = ?auto_203156 ?auto_203161 ) ) ( not ( = ?auto_203157 ?auto_203158 ) ) ( not ( = ?auto_203157 ?auto_203159 ) ) ( not ( = ?auto_203157 ?auto_203160 ) ) ( not ( = ?auto_203157 ?auto_203161 ) ) ( not ( = ?auto_203158 ?auto_203159 ) ) ( not ( = ?auto_203158 ?auto_203160 ) ) ( not ( = ?auto_203158 ?auto_203161 ) ) ( not ( = ?auto_203159 ?auto_203160 ) ) ( not ( = ?auto_203159 ?auto_203161 ) ) ( not ( = ?auto_203160 ?auto_203161 ) ) ( CLEAR ?auto_203158 ) ( ON ?auto_203159 ?auto_203160 ) ( CLEAR ?auto_203159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203154 ?auto_203155 ?auto_203156 ?auto_203157 ?auto_203158 ?auto_203159 )
      ( MAKE-7PILE ?auto_203154 ?auto_203155 ?auto_203156 ?auto_203157 ?auto_203158 ?auto_203159 ?auto_203160 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203169 - BLOCK
      ?auto_203170 - BLOCK
      ?auto_203171 - BLOCK
      ?auto_203172 - BLOCK
      ?auto_203173 - BLOCK
      ?auto_203174 - BLOCK
      ?auto_203175 - BLOCK
    )
    :vars
    (
      ?auto_203176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203175 ?auto_203176 ) ( ON-TABLE ?auto_203169 ) ( ON ?auto_203170 ?auto_203169 ) ( ON ?auto_203171 ?auto_203170 ) ( ON ?auto_203172 ?auto_203171 ) ( ON ?auto_203173 ?auto_203172 ) ( not ( = ?auto_203169 ?auto_203170 ) ) ( not ( = ?auto_203169 ?auto_203171 ) ) ( not ( = ?auto_203169 ?auto_203172 ) ) ( not ( = ?auto_203169 ?auto_203173 ) ) ( not ( = ?auto_203169 ?auto_203174 ) ) ( not ( = ?auto_203169 ?auto_203175 ) ) ( not ( = ?auto_203169 ?auto_203176 ) ) ( not ( = ?auto_203170 ?auto_203171 ) ) ( not ( = ?auto_203170 ?auto_203172 ) ) ( not ( = ?auto_203170 ?auto_203173 ) ) ( not ( = ?auto_203170 ?auto_203174 ) ) ( not ( = ?auto_203170 ?auto_203175 ) ) ( not ( = ?auto_203170 ?auto_203176 ) ) ( not ( = ?auto_203171 ?auto_203172 ) ) ( not ( = ?auto_203171 ?auto_203173 ) ) ( not ( = ?auto_203171 ?auto_203174 ) ) ( not ( = ?auto_203171 ?auto_203175 ) ) ( not ( = ?auto_203171 ?auto_203176 ) ) ( not ( = ?auto_203172 ?auto_203173 ) ) ( not ( = ?auto_203172 ?auto_203174 ) ) ( not ( = ?auto_203172 ?auto_203175 ) ) ( not ( = ?auto_203172 ?auto_203176 ) ) ( not ( = ?auto_203173 ?auto_203174 ) ) ( not ( = ?auto_203173 ?auto_203175 ) ) ( not ( = ?auto_203173 ?auto_203176 ) ) ( not ( = ?auto_203174 ?auto_203175 ) ) ( not ( = ?auto_203174 ?auto_203176 ) ) ( not ( = ?auto_203175 ?auto_203176 ) ) ( CLEAR ?auto_203173 ) ( ON ?auto_203174 ?auto_203175 ) ( CLEAR ?auto_203174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203169 ?auto_203170 ?auto_203171 ?auto_203172 ?auto_203173 ?auto_203174 )
      ( MAKE-7PILE ?auto_203169 ?auto_203170 ?auto_203171 ?auto_203172 ?auto_203173 ?auto_203174 ?auto_203175 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203184 - BLOCK
      ?auto_203185 - BLOCK
      ?auto_203186 - BLOCK
      ?auto_203187 - BLOCK
      ?auto_203188 - BLOCK
      ?auto_203189 - BLOCK
      ?auto_203190 - BLOCK
    )
    :vars
    (
      ?auto_203191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203190 ?auto_203191 ) ( ON-TABLE ?auto_203184 ) ( ON ?auto_203185 ?auto_203184 ) ( ON ?auto_203186 ?auto_203185 ) ( ON ?auto_203187 ?auto_203186 ) ( not ( = ?auto_203184 ?auto_203185 ) ) ( not ( = ?auto_203184 ?auto_203186 ) ) ( not ( = ?auto_203184 ?auto_203187 ) ) ( not ( = ?auto_203184 ?auto_203188 ) ) ( not ( = ?auto_203184 ?auto_203189 ) ) ( not ( = ?auto_203184 ?auto_203190 ) ) ( not ( = ?auto_203184 ?auto_203191 ) ) ( not ( = ?auto_203185 ?auto_203186 ) ) ( not ( = ?auto_203185 ?auto_203187 ) ) ( not ( = ?auto_203185 ?auto_203188 ) ) ( not ( = ?auto_203185 ?auto_203189 ) ) ( not ( = ?auto_203185 ?auto_203190 ) ) ( not ( = ?auto_203185 ?auto_203191 ) ) ( not ( = ?auto_203186 ?auto_203187 ) ) ( not ( = ?auto_203186 ?auto_203188 ) ) ( not ( = ?auto_203186 ?auto_203189 ) ) ( not ( = ?auto_203186 ?auto_203190 ) ) ( not ( = ?auto_203186 ?auto_203191 ) ) ( not ( = ?auto_203187 ?auto_203188 ) ) ( not ( = ?auto_203187 ?auto_203189 ) ) ( not ( = ?auto_203187 ?auto_203190 ) ) ( not ( = ?auto_203187 ?auto_203191 ) ) ( not ( = ?auto_203188 ?auto_203189 ) ) ( not ( = ?auto_203188 ?auto_203190 ) ) ( not ( = ?auto_203188 ?auto_203191 ) ) ( not ( = ?auto_203189 ?auto_203190 ) ) ( not ( = ?auto_203189 ?auto_203191 ) ) ( not ( = ?auto_203190 ?auto_203191 ) ) ( ON ?auto_203189 ?auto_203190 ) ( CLEAR ?auto_203187 ) ( ON ?auto_203188 ?auto_203189 ) ( CLEAR ?auto_203188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203184 ?auto_203185 ?auto_203186 ?auto_203187 ?auto_203188 )
      ( MAKE-7PILE ?auto_203184 ?auto_203185 ?auto_203186 ?auto_203187 ?auto_203188 ?auto_203189 ?auto_203190 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203199 - BLOCK
      ?auto_203200 - BLOCK
      ?auto_203201 - BLOCK
      ?auto_203202 - BLOCK
      ?auto_203203 - BLOCK
      ?auto_203204 - BLOCK
      ?auto_203205 - BLOCK
    )
    :vars
    (
      ?auto_203206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203205 ?auto_203206 ) ( ON-TABLE ?auto_203199 ) ( ON ?auto_203200 ?auto_203199 ) ( ON ?auto_203201 ?auto_203200 ) ( ON ?auto_203202 ?auto_203201 ) ( not ( = ?auto_203199 ?auto_203200 ) ) ( not ( = ?auto_203199 ?auto_203201 ) ) ( not ( = ?auto_203199 ?auto_203202 ) ) ( not ( = ?auto_203199 ?auto_203203 ) ) ( not ( = ?auto_203199 ?auto_203204 ) ) ( not ( = ?auto_203199 ?auto_203205 ) ) ( not ( = ?auto_203199 ?auto_203206 ) ) ( not ( = ?auto_203200 ?auto_203201 ) ) ( not ( = ?auto_203200 ?auto_203202 ) ) ( not ( = ?auto_203200 ?auto_203203 ) ) ( not ( = ?auto_203200 ?auto_203204 ) ) ( not ( = ?auto_203200 ?auto_203205 ) ) ( not ( = ?auto_203200 ?auto_203206 ) ) ( not ( = ?auto_203201 ?auto_203202 ) ) ( not ( = ?auto_203201 ?auto_203203 ) ) ( not ( = ?auto_203201 ?auto_203204 ) ) ( not ( = ?auto_203201 ?auto_203205 ) ) ( not ( = ?auto_203201 ?auto_203206 ) ) ( not ( = ?auto_203202 ?auto_203203 ) ) ( not ( = ?auto_203202 ?auto_203204 ) ) ( not ( = ?auto_203202 ?auto_203205 ) ) ( not ( = ?auto_203202 ?auto_203206 ) ) ( not ( = ?auto_203203 ?auto_203204 ) ) ( not ( = ?auto_203203 ?auto_203205 ) ) ( not ( = ?auto_203203 ?auto_203206 ) ) ( not ( = ?auto_203204 ?auto_203205 ) ) ( not ( = ?auto_203204 ?auto_203206 ) ) ( not ( = ?auto_203205 ?auto_203206 ) ) ( ON ?auto_203204 ?auto_203205 ) ( CLEAR ?auto_203202 ) ( ON ?auto_203203 ?auto_203204 ) ( CLEAR ?auto_203203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203199 ?auto_203200 ?auto_203201 ?auto_203202 ?auto_203203 )
      ( MAKE-7PILE ?auto_203199 ?auto_203200 ?auto_203201 ?auto_203202 ?auto_203203 ?auto_203204 ?auto_203205 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203214 - BLOCK
      ?auto_203215 - BLOCK
      ?auto_203216 - BLOCK
      ?auto_203217 - BLOCK
      ?auto_203218 - BLOCK
      ?auto_203219 - BLOCK
      ?auto_203220 - BLOCK
    )
    :vars
    (
      ?auto_203221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203220 ?auto_203221 ) ( ON-TABLE ?auto_203214 ) ( ON ?auto_203215 ?auto_203214 ) ( ON ?auto_203216 ?auto_203215 ) ( not ( = ?auto_203214 ?auto_203215 ) ) ( not ( = ?auto_203214 ?auto_203216 ) ) ( not ( = ?auto_203214 ?auto_203217 ) ) ( not ( = ?auto_203214 ?auto_203218 ) ) ( not ( = ?auto_203214 ?auto_203219 ) ) ( not ( = ?auto_203214 ?auto_203220 ) ) ( not ( = ?auto_203214 ?auto_203221 ) ) ( not ( = ?auto_203215 ?auto_203216 ) ) ( not ( = ?auto_203215 ?auto_203217 ) ) ( not ( = ?auto_203215 ?auto_203218 ) ) ( not ( = ?auto_203215 ?auto_203219 ) ) ( not ( = ?auto_203215 ?auto_203220 ) ) ( not ( = ?auto_203215 ?auto_203221 ) ) ( not ( = ?auto_203216 ?auto_203217 ) ) ( not ( = ?auto_203216 ?auto_203218 ) ) ( not ( = ?auto_203216 ?auto_203219 ) ) ( not ( = ?auto_203216 ?auto_203220 ) ) ( not ( = ?auto_203216 ?auto_203221 ) ) ( not ( = ?auto_203217 ?auto_203218 ) ) ( not ( = ?auto_203217 ?auto_203219 ) ) ( not ( = ?auto_203217 ?auto_203220 ) ) ( not ( = ?auto_203217 ?auto_203221 ) ) ( not ( = ?auto_203218 ?auto_203219 ) ) ( not ( = ?auto_203218 ?auto_203220 ) ) ( not ( = ?auto_203218 ?auto_203221 ) ) ( not ( = ?auto_203219 ?auto_203220 ) ) ( not ( = ?auto_203219 ?auto_203221 ) ) ( not ( = ?auto_203220 ?auto_203221 ) ) ( ON ?auto_203219 ?auto_203220 ) ( ON ?auto_203218 ?auto_203219 ) ( CLEAR ?auto_203216 ) ( ON ?auto_203217 ?auto_203218 ) ( CLEAR ?auto_203217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203214 ?auto_203215 ?auto_203216 ?auto_203217 )
      ( MAKE-7PILE ?auto_203214 ?auto_203215 ?auto_203216 ?auto_203217 ?auto_203218 ?auto_203219 ?auto_203220 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203229 - BLOCK
      ?auto_203230 - BLOCK
      ?auto_203231 - BLOCK
      ?auto_203232 - BLOCK
      ?auto_203233 - BLOCK
      ?auto_203234 - BLOCK
      ?auto_203235 - BLOCK
    )
    :vars
    (
      ?auto_203236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203235 ?auto_203236 ) ( ON-TABLE ?auto_203229 ) ( ON ?auto_203230 ?auto_203229 ) ( ON ?auto_203231 ?auto_203230 ) ( not ( = ?auto_203229 ?auto_203230 ) ) ( not ( = ?auto_203229 ?auto_203231 ) ) ( not ( = ?auto_203229 ?auto_203232 ) ) ( not ( = ?auto_203229 ?auto_203233 ) ) ( not ( = ?auto_203229 ?auto_203234 ) ) ( not ( = ?auto_203229 ?auto_203235 ) ) ( not ( = ?auto_203229 ?auto_203236 ) ) ( not ( = ?auto_203230 ?auto_203231 ) ) ( not ( = ?auto_203230 ?auto_203232 ) ) ( not ( = ?auto_203230 ?auto_203233 ) ) ( not ( = ?auto_203230 ?auto_203234 ) ) ( not ( = ?auto_203230 ?auto_203235 ) ) ( not ( = ?auto_203230 ?auto_203236 ) ) ( not ( = ?auto_203231 ?auto_203232 ) ) ( not ( = ?auto_203231 ?auto_203233 ) ) ( not ( = ?auto_203231 ?auto_203234 ) ) ( not ( = ?auto_203231 ?auto_203235 ) ) ( not ( = ?auto_203231 ?auto_203236 ) ) ( not ( = ?auto_203232 ?auto_203233 ) ) ( not ( = ?auto_203232 ?auto_203234 ) ) ( not ( = ?auto_203232 ?auto_203235 ) ) ( not ( = ?auto_203232 ?auto_203236 ) ) ( not ( = ?auto_203233 ?auto_203234 ) ) ( not ( = ?auto_203233 ?auto_203235 ) ) ( not ( = ?auto_203233 ?auto_203236 ) ) ( not ( = ?auto_203234 ?auto_203235 ) ) ( not ( = ?auto_203234 ?auto_203236 ) ) ( not ( = ?auto_203235 ?auto_203236 ) ) ( ON ?auto_203234 ?auto_203235 ) ( ON ?auto_203233 ?auto_203234 ) ( CLEAR ?auto_203231 ) ( ON ?auto_203232 ?auto_203233 ) ( CLEAR ?auto_203232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203229 ?auto_203230 ?auto_203231 ?auto_203232 )
      ( MAKE-7PILE ?auto_203229 ?auto_203230 ?auto_203231 ?auto_203232 ?auto_203233 ?auto_203234 ?auto_203235 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203244 - BLOCK
      ?auto_203245 - BLOCK
      ?auto_203246 - BLOCK
      ?auto_203247 - BLOCK
      ?auto_203248 - BLOCK
      ?auto_203249 - BLOCK
      ?auto_203250 - BLOCK
    )
    :vars
    (
      ?auto_203251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203250 ?auto_203251 ) ( ON-TABLE ?auto_203244 ) ( ON ?auto_203245 ?auto_203244 ) ( not ( = ?auto_203244 ?auto_203245 ) ) ( not ( = ?auto_203244 ?auto_203246 ) ) ( not ( = ?auto_203244 ?auto_203247 ) ) ( not ( = ?auto_203244 ?auto_203248 ) ) ( not ( = ?auto_203244 ?auto_203249 ) ) ( not ( = ?auto_203244 ?auto_203250 ) ) ( not ( = ?auto_203244 ?auto_203251 ) ) ( not ( = ?auto_203245 ?auto_203246 ) ) ( not ( = ?auto_203245 ?auto_203247 ) ) ( not ( = ?auto_203245 ?auto_203248 ) ) ( not ( = ?auto_203245 ?auto_203249 ) ) ( not ( = ?auto_203245 ?auto_203250 ) ) ( not ( = ?auto_203245 ?auto_203251 ) ) ( not ( = ?auto_203246 ?auto_203247 ) ) ( not ( = ?auto_203246 ?auto_203248 ) ) ( not ( = ?auto_203246 ?auto_203249 ) ) ( not ( = ?auto_203246 ?auto_203250 ) ) ( not ( = ?auto_203246 ?auto_203251 ) ) ( not ( = ?auto_203247 ?auto_203248 ) ) ( not ( = ?auto_203247 ?auto_203249 ) ) ( not ( = ?auto_203247 ?auto_203250 ) ) ( not ( = ?auto_203247 ?auto_203251 ) ) ( not ( = ?auto_203248 ?auto_203249 ) ) ( not ( = ?auto_203248 ?auto_203250 ) ) ( not ( = ?auto_203248 ?auto_203251 ) ) ( not ( = ?auto_203249 ?auto_203250 ) ) ( not ( = ?auto_203249 ?auto_203251 ) ) ( not ( = ?auto_203250 ?auto_203251 ) ) ( ON ?auto_203249 ?auto_203250 ) ( ON ?auto_203248 ?auto_203249 ) ( ON ?auto_203247 ?auto_203248 ) ( CLEAR ?auto_203245 ) ( ON ?auto_203246 ?auto_203247 ) ( CLEAR ?auto_203246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203244 ?auto_203245 ?auto_203246 )
      ( MAKE-7PILE ?auto_203244 ?auto_203245 ?auto_203246 ?auto_203247 ?auto_203248 ?auto_203249 ?auto_203250 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203259 - BLOCK
      ?auto_203260 - BLOCK
      ?auto_203261 - BLOCK
      ?auto_203262 - BLOCK
      ?auto_203263 - BLOCK
      ?auto_203264 - BLOCK
      ?auto_203265 - BLOCK
    )
    :vars
    (
      ?auto_203266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203265 ?auto_203266 ) ( ON-TABLE ?auto_203259 ) ( ON ?auto_203260 ?auto_203259 ) ( not ( = ?auto_203259 ?auto_203260 ) ) ( not ( = ?auto_203259 ?auto_203261 ) ) ( not ( = ?auto_203259 ?auto_203262 ) ) ( not ( = ?auto_203259 ?auto_203263 ) ) ( not ( = ?auto_203259 ?auto_203264 ) ) ( not ( = ?auto_203259 ?auto_203265 ) ) ( not ( = ?auto_203259 ?auto_203266 ) ) ( not ( = ?auto_203260 ?auto_203261 ) ) ( not ( = ?auto_203260 ?auto_203262 ) ) ( not ( = ?auto_203260 ?auto_203263 ) ) ( not ( = ?auto_203260 ?auto_203264 ) ) ( not ( = ?auto_203260 ?auto_203265 ) ) ( not ( = ?auto_203260 ?auto_203266 ) ) ( not ( = ?auto_203261 ?auto_203262 ) ) ( not ( = ?auto_203261 ?auto_203263 ) ) ( not ( = ?auto_203261 ?auto_203264 ) ) ( not ( = ?auto_203261 ?auto_203265 ) ) ( not ( = ?auto_203261 ?auto_203266 ) ) ( not ( = ?auto_203262 ?auto_203263 ) ) ( not ( = ?auto_203262 ?auto_203264 ) ) ( not ( = ?auto_203262 ?auto_203265 ) ) ( not ( = ?auto_203262 ?auto_203266 ) ) ( not ( = ?auto_203263 ?auto_203264 ) ) ( not ( = ?auto_203263 ?auto_203265 ) ) ( not ( = ?auto_203263 ?auto_203266 ) ) ( not ( = ?auto_203264 ?auto_203265 ) ) ( not ( = ?auto_203264 ?auto_203266 ) ) ( not ( = ?auto_203265 ?auto_203266 ) ) ( ON ?auto_203264 ?auto_203265 ) ( ON ?auto_203263 ?auto_203264 ) ( ON ?auto_203262 ?auto_203263 ) ( CLEAR ?auto_203260 ) ( ON ?auto_203261 ?auto_203262 ) ( CLEAR ?auto_203261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203259 ?auto_203260 ?auto_203261 )
      ( MAKE-7PILE ?auto_203259 ?auto_203260 ?auto_203261 ?auto_203262 ?auto_203263 ?auto_203264 ?auto_203265 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203274 - BLOCK
      ?auto_203275 - BLOCK
      ?auto_203276 - BLOCK
      ?auto_203277 - BLOCK
      ?auto_203278 - BLOCK
      ?auto_203279 - BLOCK
      ?auto_203280 - BLOCK
    )
    :vars
    (
      ?auto_203281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203280 ?auto_203281 ) ( ON-TABLE ?auto_203274 ) ( not ( = ?auto_203274 ?auto_203275 ) ) ( not ( = ?auto_203274 ?auto_203276 ) ) ( not ( = ?auto_203274 ?auto_203277 ) ) ( not ( = ?auto_203274 ?auto_203278 ) ) ( not ( = ?auto_203274 ?auto_203279 ) ) ( not ( = ?auto_203274 ?auto_203280 ) ) ( not ( = ?auto_203274 ?auto_203281 ) ) ( not ( = ?auto_203275 ?auto_203276 ) ) ( not ( = ?auto_203275 ?auto_203277 ) ) ( not ( = ?auto_203275 ?auto_203278 ) ) ( not ( = ?auto_203275 ?auto_203279 ) ) ( not ( = ?auto_203275 ?auto_203280 ) ) ( not ( = ?auto_203275 ?auto_203281 ) ) ( not ( = ?auto_203276 ?auto_203277 ) ) ( not ( = ?auto_203276 ?auto_203278 ) ) ( not ( = ?auto_203276 ?auto_203279 ) ) ( not ( = ?auto_203276 ?auto_203280 ) ) ( not ( = ?auto_203276 ?auto_203281 ) ) ( not ( = ?auto_203277 ?auto_203278 ) ) ( not ( = ?auto_203277 ?auto_203279 ) ) ( not ( = ?auto_203277 ?auto_203280 ) ) ( not ( = ?auto_203277 ?auto_203281 ) ) ( not ( = ?auto_203278 ?auto_203279 ) ) ( not ( = ?auto_203278 ?auto_203280 ) ) ( not ( = ?auto_203278 ?auto_203281 ) ) ( not ( = ?auto_203279 ?auto_203280 ) ) ( not ( = ?auto_203279 ?auto_203281 ) ) ( not ( = ?auto_203280 ?auto_203281 ) ) ( ON ?auto_203279 ?auto_203280 ) ( ON ?auto_203278 ?auto_203279 ) ( ON ?auto_203277 ?auto_203278 ) ( ON ?auto_203276 ?auto_203277 ) ( CLEAR ?auto_203274 ) ( ON ?auto_203275 ?auto_203276 ) ( CLEAR ?auto_203275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203274 ?auto_203275 )
      ( MAKE-7PILE ?auto_203274 ?auto_203275 ?auto_203276 ?auto_203277 ?auto_203278 ?auto_203279 ?auto_203280 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203289 - BLOCK
      ?auto_203290 - BLOCK
      ?auto_203291 - BLOCK
      ?auto_203292 - BLOCK
      ?auto_203293 - BLOCK
      ?auto_203294 - BLOCK
      ?auto_203295 - BLOCK
    )
    :vars
    (
      ?auto_203296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203295 ?auto_203296 ) ( ON-TABLE ?auto_203289 ) ( not ( = ?auto_203289 ?auto_203290 ) ) ( not ( = ?auto_203289 ?auto_203291 ) ) ( not ( = ?auto_203289 ?auto_203292 ) ) ( not ( = ?auto_203289 ?auto_203293 ) ) ( not ( = ?auto_203289 ?auto_203294 ) ) ( not ( = ?auto_203289 ?auto_203295 ) ) ( not ( = ?auto_203289 ?auto_203296 ) ) ( not ( = ?auto_203290 ?auto_203291 ) ) ( not ( = ?auto_203290 ?auto_203292 ) ) ( not ( = ?auto_203290 ?auto_203293 ) ) ( not ( = ?auto_203290 ?auto_203294 ) ) ( not ( = ?auto_203290 ?auto_203295 ) ) ( not ( = ?auto_203290 ?auto_203296 ) ) ( not ( = ?auto_203291 ?auto_203292 ) ) ( not ( = ?auto_203291 ?auto_203293 ) ) ( not ( = ?auto_203291 ?auto_203294 ) ) ( not ( = ?auto_203291 ?auto_203295 ) ) ( not ( = ?auto_203291 ?auto_203296 ) ) ( not ( = ?auto_203292 ?auto_203293 ) ) ( not ( = ?auto_203292 ?auto_203294 ) ) ( not ( = ?auto_203292 ?auto_203295 ) ) ( not ( = ?auto_203292 ?auto_203296 ) ) ( not ( = ?auto_203293 ?auto_203294 ) ) ( not ( = ?auto_203293 ?auto_203295 ) ) ( not ( = ?auto_203293 ?auto_203296 ) ) ( not ( = ?auto_203294 ?auto_203295 ) ) ( not ( = ?auto_203294 ?auto_203296 ) ) ( not ( = ?auto_203295 ?auto_203296 ) ) ( ON ?auto_203294 ?auto_203295 ) ( ON ?auto_203293 ?auto_203294 ) ( ON ?auto_203292 ?auto_203293 ) ( ON ?auto_203291 ?auto_203292 ) ( CLEAR ?auto_203289 ) ( ON ?auto_203290 ?auto_203291 ) ( CLEAR ?auto_203290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203289 ?auto_203290 )
      ( MAKE-7PILE ?auto_203289 ?auto_203290 ?auto_203291 ?auto_203292 ?auto_203293 ?auto_203294 ?auto_203295 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203304 - BLOCK
      ?auto_203305 - BLOCK
      ?auto_203306 - BLOCK
      ?auto_203307 - BLOCK
      ?auto_203308 - BLOCK
      ?auto_203309 - BLOCK
      ?auto_203310 - BLOCK
    )
    :vars
    (
      ?auto_203311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203310 ?auto_203311 ) ( not ( = ?auto_203304 ?auto_203305 ) ) ( not ( = ?auto_203304 ?auto_203306 ) ) ( not ( = ?auto_203304 ?auto_203307 ) ) ( not ( = ?auto_203304 ?auto_203308 ) ) ( not ( = ?auto_203304 ?auto_203309 ) ) ( not ( = ?auto_203304 ?auto_203310 ) ) ( not ( = ?auto_203304 ?auto_203311 ) ) ( not ( = ?auto_203305 ?auto_203306 ) ) ( not ( = ?auto_203305 ?auto_203307 ) ) ( not ( = ?auto_203305 ?auto_203308 ) ) ( not ( = ?auto_203305 ?auto_203309 ) ) ( not ( = ?auto_203305 ?auto_203310 ) ) ( not ( = ?auto_203305 ?auto_203311 ) ) ( not ( = ?auto_203306 ?auto_203307 ) ) ( not ( = ?auto_203306 ?auto_203308 ) ) ( not ( = ?auto_203306 ?auto_203309 ) ) ( not ( = ?auto_203306 ?auto_203310 ) ) ( not ( = ?auto_203306 ?auto_203311 ) ) ( not ( = ?auto_203307 ?auto_203308 ) ) ( not ( = ?auto_203307 ?auto_203309 ) ) ( not ( = ?auto_203307 ?auto_203310 ) ) ( not ( = ?auto_203307 ?auto_203311 ) ) ( not ( = ?auto_203308 ?auto_203309 ) ) ( not ( = ?auto_203308 ?auto_203310 ) ) ( not ( = ?auto_203308 ?auto_203311 ) ) ( not ( = ?auto_203309 ?auto_203310 ) ) ( not ( = ?auto_203309 ?auto_203311 ) ) ( not ( = ?auto_203310 ?auto_203311 ) ) ( ON ?auto_203309 ?auto_203310 ) ( ON ?auto_203308 ?auto_203309 ) ( ON ?auto_203307 ?auto_203308 ) ( ON ?auto_203306 ?auto_203307 ) ( ON ?auto_203305 ?auto_203306 ) ( ON ?auto_203304 ?auto_203305 ) ( CLEAR ?auto_203304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203304 )
      ( MAKE-7PILE ?auto_203304 ?auto_203305 ?auto_203306 ?auto_203307 ?auto_203308 ?auto_203309 ?auto_203310 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_203319 - BLOCK
      ?auto_203320 - BLOCK
      ?auto_203321 - BLOCK
      ?auto_203322 - BLOCK
      ?auto_203323 - BLOCK
      ?auto_203324 - BLOCK
      ?auto_203325 - BLOCK
    )
    :vars
    (
      ?auto_203326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203325 ?auto_203326 ) ( not ( = ?auto_203319 ?auto_203320 ) ) ( not ( = ?auto_203319 ?auto_203321 ) ) ( not ( = ?auto_203319 ?auto_203322 ) ) ( not ( = ?auto_203319 ?auto_203323 ) ) ( not ( = ?auto_203319 ?auto_203324 ) ) ( not ( = ?auto_203319 ?auto_203325 ) ) ( not ( = ?auto_203319 ?auto_203326 ) ) ( not ( = ?auto_203320 ?auto_203321 ) ) ( not ( = ?auto_203320 ?auto_203322 ) ) ( not ( = ?auto_203320 ?auto_203323 ) ) ( not ( = ?auto_203320 ?auto_203324 ) ) ( not ( = ?auto_203320 ?auto_203325 ) ) ( not ( = ?auto_203320 ?auto_203326 ) ) ( not ( = ?auto_203321 ?auto_203322 ) ) ( not ( = ?auto_203321 ?auto_203323 ) ) ( not ( = ?auto_203321 ?auto_203324 ) ) ( not ( = ?auto_203321 ?auto_203325 ) ) ( not ( = ?auto_203321 ?auto_203326 ) ) ( not ( = ?auto_203322 ?auto_203323 ) ) ( not ( = ?auto_203322 ?auto_203324 ) ) ( not ( = ?auto_203322 ?auto_203325 ) ) ( not ( = ?auto_203322 ?auto_203326 ) ) ( not ( = ?auto_203323 ?auto_203324 ) ) ( not ( = ?auto_203323 ?auto_203325 ) ) ( not ( = ?auto_203323 ?auto_203326 ) ) ( not ( = ?auto_203324 ?auto_203325 ) ) ( not ( = ?auto_203324 ?auto_203326 ) ) ( not ( = ?auto_203325 ?auto_203326 ) ) ( ON ?auto_203324 ?auto_203325 ) ( ON ?auto_203323 ?auto_203324 ) ( ON ?auto_203322 ?auto_203323 ) ( ON ?auto_203321 ?auto_203322 ) ( ON ?auto_203320 ?auto_203321 ) ( ON ?auto_203319 ?auto_203320 ) ( CLEAR ?auto_203319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203319 )
      ( MAKE-7PILE ?auto_203319 ?auto_203320 ?auto_203321 ?auto_203322 ?auto_203323 ?auto_203324 ?auto_203325 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203335 - BLOCK
      ?auto_203336 - BLOCK
      ?auto_203337 - BLOCK
      ?auto_203338 - BLOCK
      ?auto_203339 - BLOCK
      ?auto_203340 - BLOCK
      ?auto_203341 - BLOCK
      ?auto_203342 - BLOCK
    )
    :vars
    (
      ?auto_203343 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_203341 ) ( ON ?auto_203342 ?auto_203343 ) ( CLEAR ?auto_203342 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203335 ) ( ON ?auto_203336 ?auto_203335 ) ( ON ?auto_203337 ?auto_203336 ) ( ON ?auto_203338 ?auto_203337 ) ( ON ?auto_203339 ?auto_203338 ) ( ON ?auto_203340 ?auto_203339 ) ( ON ?auto_203341 ?auto_203340 ) ( not ( = ?auto_203335 ?auto_203336 ) ) ( not ( = ?auto_203335 ?auto_203337 ) ) ( not ( = ?auto_203335 ?auto_203338 ) ) ( not ( = ?auto_203335 ?auto_203339 ) ) ( not ( = ?auto_203335 ?auto_203340 ) ) ( not ( = ?auto_203335 ?auto_203341 ) ) ( not ( = ?auto_203335 ?auto_203342 ) ) ( not ( = ?auto_203335 ?auto_203343 ) ) ( not ( = ?auto_203336 ?auto_203337 ) ) ( not ( = ?auto_203336 ?auto_203338 ) ) ( not ( = ?auto_203336 ?auto_203339 ) ) ( not ( = ?auto_203336 ?auto_203340 ) ) ( not ( = ?auto_203336 ?auto_203341 ) ) ( not ( = ?auto_203336 ?auto_203342 ) ) ( not ( = ?auto_203336 ?auto_203343 ) ) ( not ( = ?auto_203337 ?auto_203338 ) ) ( not ( = ?auto_203337 ?auto_203339 ) ) ( not ( = ?auto_203337 ?auto_203340 ) ) ( not ( = ?auto_203337 ?auto_203341 ) ) ( not ( = ?auto_203337 ?auto_203342 ) ) ( not ( = ?auto_203337 ?auto_203343 ) ) ( not ( = ?auto_203338 ?auto_203339 ) ) ( not ( = ?auto_203338 ?auto_203340 ) ) ( not ( = ?auto_203338 ?auto_203341 ) ) ( not ( = ?auto_203338 ?auto_203342 ) ) ( not ( = ?auto_203338 ?auto_203343 ) ) ( not ( = ?auto_203339 ?auto_203340 ) ) ( not ( = ?auto_203339 ?auto_203341 ) ) ( not ( = ?auto_203339 ?auto_203342 ) ) ( not ( = ?auto_203339 ?auto_203343 ) ) ( not ( = ?auto_203340 ?auto_203341 ) ) ( not ( = ?auto_203340 ?auto_203342 ) ) ( not ( = ?auto_203340 ?auto_203343 ) ) ( not ( = ?auto_203341 ?auto_203342 ) ) ( not ( = ?auto_203341 ?auto_203343 ) ) ( not ( = ?auto_203342 ?auto_203343 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203342 ?auto_203343 )
      ( !STACK ?auto_203342 ?auto_203341 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203352 - BLOCK
      ?auto_203353 - BLOCK
      ?auto_203354 - BLOCK
      ?auto_203355 - BLOCK
      ?auto_203356 - BLOCK
      ?auto_203357 - BLOCK
      ?auto_203358 - BLOCK
      ?auto_203359 - BLOCK
    )
    :vars
    (
      ?auto_203360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_203358 ) ( ON ?auto_203359 ?auto_203360 ) ( CLEAR ?auto_203359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203352 ) ( ON ?auto_203353 ?auto_203352 ) ( ON ?auto_203354 ?auto_203353 ) ( ON ?auto_203355 ?auto_203354 ) ( ON ?auto_203356 ?auto_203355 ) ( ON ?auto_203357 ?auto_203356 ) ( ON ?auto_203358 ?auto_203357 ) ( not ( = ?auto_203352 ?auto_203353 ) ) ( not ( = ?auto_203352 ?auto_203354 ) ) ( not ( = ?auto_203352 ?auto_203355 ) ) ( not ( = ?auto_203352 ?auto_203356 ) ) ( not ( = ?auto_203352 ?auto_203357 ) ) ( not ( = ?auto_203352 ?auto_203358 ) ) ( not ( = ?auto_203352 ?auto_203359 ) ) ( not ( = ?auto_203352 ?auto_203360 ) ) ( not ( = ?auto_203353 ?auto_203354 ) ) ( not ( = ?auto_203353 ?auto_203355 ) ) ( not ( = ?auto_203353 ?auto_203356 ) ) ( not ( = ?auto_203353 ?auto_203357 ) ) ( not ( = ?auto_203353 ?auto_203358 ) ) ( not ( = ?auto_203353 ?auto_203359 ) ) ( not ( = ?auto_203353 ?auto_203360 ) ) ( not ( = ?auto_203354 ?auto_203355 ) ) ( not ( = ?auto_203354 ?auto_203356 ) ) ( not ( = ?auto_203354 ?auto_203357 ) ) ( not ( = ?auto_203354 ?auto_203358 ) ) ( not ( = ?auto_203354 ?auto_203359 ) ) ( not ( = ?auto_203354 ?auto_203360 ) ) ( not ( = ?auto_203355 ?auto_203356 ) ) ( not ( = ?auto_203355 ?auto_203357 ) ) ( not ( = ?auto_203355 ?auto_203358 ) ) ( not ( = ?auto_203355 ?auto_203359 ) ) ( not ( = ?auto_203355 ?auto_203360 ) ) ( not ( = ?auto_203356 ?auto_203357 ) ) ( not ( = ?auto_203356 ?auto_203358 ) ) ( not ( = ?auto_203356 ?auto_203359 ) ) ( not ( = ?auto_203356 ?auto_203360 ) ) ( not ( = ?auto_203357 ?auto_203358 ) ) ( not ( = ?auto_203357 ?auto_203359 ) ) ( not ( = ?auto_203357 ?auto_203360 ) ) ( not ( = ?auto_203358 ?auto_203359 ) ) ( not ( = ?auto_203358 ?auto_203360 ) ) ( not ( = ?auto_203359 ?auto_203360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203359 ?auto_203360 )
      ( !STACK ?auto_203359 ?auto_203358 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203369 - BLOCK
      ?auto_203370 - BLOCK
      ?auto_203371 - BLOCK
      ?auto_203372 - BLOCK
      ?auto_203373 - BLOCK
      ?auto_203374 - BLOCK
      ?auto_203375 - BLOCK
      ?auto_203376 - BLOCK
    )
    :vars
    (
      ?auto_203377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203376 ?auto_203377 ) ( ON-TABLE ?auto_203369 ) ( ON ?auto_203370 ?auto_203369 ) ( ON ?auto_203371 ?auto_203370 ) ( ON ?auto_203372 ?auto_203371 ) ( ON ?auto_203373 ?auto_203372 ) ( ON ?auto_203374 ?auto_203373 ) ( not ( = ?auto_203369 ?auto_203370 ) ) ( not ( = ?auto_203369 ?auto_203371 ) ) ( not ( = ?auto_203369 ?auto_203372 ) ) ( not ( = ?auto_203369 ?auto_203373 ) ) ( not ( = ?auto_203369 ?auto_203374 ) ) ( not ( = ?auto_203369 ?auto_203375 ) ) ( not ( = ?auto_203369 ?auto_203376 ) ) ( not ( = ?auto_203369 ?auto_203377 ) ) ( not ( = ?auto_203370 ?auto_203371 ) ) ( not ( = ?auto_203370 ?auto_203372 ) ) ( not ( = ?auto_203370 ?auto_203373 ) ) ( not ( = ?auto_203370 ?auto_203374 ) ) ( not ( = ?auto_203370 ?auto_203375 ) ) ( not ( = ?auto_203370 ?auto_203376 ) ) ( not ( = ?auto_203370 ?auto_203377 ) ) ( not ( = ?auto_203371 ?auto_203372 ) ) ( not ( = ?auto_203371 ?auto_203373 ) ) ( not ( = ?auto_203371 ?auto_203374 ) ) ( not ( = ?auto_203371 ?auto_203375 ) ) ( not ( = ?auto_203371 ?auto_203376 ) ) ( not ( = ?auto_203371 ?auto_203377 ) ) ( not ( = ?auto_203372 ?auto_203373 ) ) ( not ( = ?auto_203372 ?auto_203374 ) ) ( not ( = ?auto_203372 ?auto_203375 ) ) ( not ( = ?auto_203372 ?auto_203376 ) ) ( not ( = ?auto_203372 ?auto_203377 ) ) ( not ( = ?auto_203373 ?auto_203374 ) ) ( not ( = ?auto_203373 ?auto_203375 ) ) ( not ( = ?auto_203373 ?auto_203376 ) ) ( not ( = ?auto_203373 ?auto_203377 ) ) ( not ( = ?auto_203374 ?auto_203375 ) ) ( not ( = ?auto_203374 ?auto_203376 ) ) ( not ( = ?auto_203374 ?auto_203377 ) ) ( not ( = ?auto_203375 ?auto_203376 ) ) ( not ( = ?auto_203375 ?auto_203377 ) ) ( not ( = ?auto_203376 ?auto_203377 ) ) ( CLEAR ?auto_203374 ) ( ON ?auto_203375 ?auto_203376 ) ( CLEAR ?auto_203375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203369 ?auto_203370 ?auto_203371 ?auto_203372 ?auto_203373 ?auto_203374 ?auto_203375 )
      ( MAKE-8PILE ?auto_203369 ?auto_203370 ?auto_203371 ?auto_203372 ?auto_203373 ?auto_203374 ?auto_203375 ?auto_203376 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203386 - BLOCK
      ?auto_203387 - BLOCK
      ?auto_203388 - BLOCK
      ?auto_203389 - BLOCK
      ?auto_203390 - BLOCK
      ?auto_203391 - BLOCK
      ?auto_203392 - BLOCK
      ?auto_203393 - BLOCK
    )
    :vars
    (
      ?auto_203394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203393 ?auto_203394 ) ( ON-TABLE ?auto_203386 ) ( ON ?auto_203387 ?auto_203386 ) ( ON ?auto_203388 ?auto_203387 ) ( ON ?auto_203389 ?auto_203388 ) ( ON ?auto_203390 ?auto_203389 ) ( ON ?auto_203391 ?auto_203390 ) ( not ( = ?auto_203386 ?auto_203387 ) ) ( not ( = ?auto_203386 ?auto_203388 ) ) ( not ( = ?auto_203386 ?auto_203389 ) ) ( not ( = ?auto_203386 ?auto_203390 ) ) ( not ( = ?auto_203386 ?auto_203391 ) ) ( not ( = ?auto_203386 ?auto_203392 ) ) ( not ( = ?auto_203386 ?auto_203393 ) ) ( not ( = ?auto_203386 ?auto_203394 ) ) ( not ( = ?auto_203387 ?auto_203388 ) ) ( not ( = ?auto_203387 ?auto_203389 ) ) ( not ( = ?auto_203387 ?auto_203390 ) ) ( not ( = ?auto_203387 ?auto_203391 ) ) ( not ( = ?auto_203387 ?auto_203392 ) ) ( not ( = ?auto_203387 ?auto_203393 ) ) ( not ( = ?auto_203387 ?auto_203394 ) ) ( not ( = ?auto_203388 ?auto_203389 ) ) ( not ( = ?auto_203388 ?auto_203390 ) ) ( not ( = ?auto_203388 ?auto_203391 ) ) ( not ( = ?auto_203388 ?auto_203392 ) ) ( not ( = ?auto_203388 ?auto_203393 ) ) ( not ( = ?auto_203388 ?auto_203394 ) ) ( not ( = ?auto_203389 ?auto_203390 ) ) ( not ( = ?auto_203389 ?auto_203391 ) ) ( not ( = ?auto_203389 ?auto_203392 ) ) ( not ( = ?auto_203389 ?auto_203393 ) ) ( not ( = ?auto_203389 ?auto_203394 ) ) ( not ( = ?auto_203390 ?auto_203391 ) ) ( not ( = ?auto_203390 ?auto_203392 ) ) ( not ( = ?auto_203390 ?auto_203393 ) ) ( not ( = ?auto_203390 ?auto_203394 ) ) ( not ( = ?auto_203391 ?auto_203392 ) ) ( not ( = ?auto_203391 ?auto_203393 ) ) ( not ( = ?auto_203391 ?auto_203394 ) ) ( not ( = ?auto_203392 ?auto_203393 ) ) ( not ( = ?auto_203392 ?auto_203394 ) ) ( not ( = ?auto_203393 ?auto_203394 ) ) ( CLEAR ?auto_203391 ) ( ON ?auto_203392 ?auto_203393 ) ( CLEAR ?auto_203392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203386 ?auto_203387 ?auto_203388 ?auto_203389 ?auto_203390 ?auto_203391 ?auto_203392 )
      ( MAKE-8PILE ?auto_203386 ?auto_203387 ?auto_203388 ?auto_203389 ?auto_203390 ?auto_203391 ?auto_203392 ?auto_203393 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203403 - BLOCK
      ?auto_203404 - BLOCK
      ?auto_203405 - BLOCK
      ?auto_203406 - BLOCK
      ?auto_203407 - BLOCK
      ?auto_203408 - BLOCK
      ?auto_203409 - BLOCK
      ?auto_203410 - BLOCK
    )
    :vars
    (
      ?auto_203411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203410 ?auto_203411 ) ( ON-TABLE ?auto_203403 ) ( ON ?auto_203404 ?auto_203403 ) ( ON ?auto_203405 ?auto_203404 ) ( ON ?auto_203406 ?auto_203405 ) ( ON ?auto_203407 ?auto_203406 ) ( not ( = ?auto_203403 ?auto_203404 ) ) ( not ( = ?auto_203403 ?auto_203405 ) ) ( not ( = ?auto_203403 ?auto_203406 ) ) ( not ( = ?auto_203403 ?auto_203407 ) ) ( not ( = ?auto_203403 ?auto_203408 ) ) ( not ( = ?auto_203403 ?auto_203409 ) ) ( not ( = ?auto_203403 ?auto_203410 ) ) ( not ( = ?auto_203403 ?auto_203411 ) ) ( not ( = ?auto_203404 ?auto_203405 ) ) ( not ( = ?auto_203404 ?auto_203406 ) ) ( not ( = ?auto_203404 ?auto_203407 ) ) ( not ( = ?auto_203404 ?auto_203408 ) ) ( not ( = ?auto_203404 ?auto_203409 ) ) ( not ( = ?auto_203404 ?auto_203410 ) ) ( not ( = ?auto_203404 ?auto_203411 ) ) ( not ( = ?auto_203405 ?auto_203406 ) ) ( not ( = ?auto_203405 ?auto_203407 ) ) ( not ( = ?auto_203405 ?auto_203408 ) ) ( not ( = ?auto_203405 ?auto_203409 ) ) ( not ( = ?auto_203405 ?auto_203410 ) ) ( not ( = ?auto_203405 ?auto_203411 ) ) ( not ( = ?auto_203406 ?auto_203407 ) ) ( not ( = ?auto_203406 ?auto_203408 ) ) ( not ( = ?auto_203406 ?auto_203409 ) ) ( not ( = ?auto_203406 ?auto_203410 ) ) ( not ( = ?auto_203406 ?auto_203411 ) ) ( not ( = ?auto_203407 ?auto_203408 ) ) ( not ( = ?auto_203407 ?auto_203409 ) ) ( not ( = ?auto_203407 ?auto_203410 ) ) ( not ( = ?auto_203407 ?auto_203411 ) ) ( not ( = ?auto_203408 ?auto_203409 ) ) ( not ( = ?auto_203408 ?auto_203410 ) ) ( not ( = ?auto_203408 ?auto_203411 ) ) ( not ( = ?auto_203409 ?auto_203410 ) ) ( not ( = ?auto_203409 ?auto_203411 ) ) ( not ( = ?auto_203410 ?auto_203411 ) ) ( ON ?auto_203409 ?auto_203410 ) ( CLEAR ?auto_203407 ) ( ON ?auto_203408 ?auto_203409 ) ( CLEAR ?auto_203408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203403 ?auto_203404 ?auto_203405 ?auto_203406 ?auto_203407 ?auto_203408 )
      ( MAKE-8PILE ?auto_203403 ?auto_203404 ?auto_203405 ?auto_203406 ?auto_203407 ?auto_203408 ?auto_203409 ?auto_203410 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203420 - BLOCK
      ?auto_203421 - BLOCK
      ?auto_203422 - BLOCK
      ?auto_203423 - BLOCK
      ?auto_203424 - BLOCK
      ?auto_203425 - BLOCK
      ?auto_203426 - BLOCK
      ?auto_203427 - BLOCK
    )
    :vars
    (
      ?auto_203428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203427 ?auto_203428 ) ( ON-TABLE ?auto_203420 ) ( ON ?auto_203421 ?auto_203420 ) ( ON ?auto_203422 ?auto_203421 ) ( ON ?auto_203423 ?auto_203422 ) ( ON ?auto_203424 ?auto_203423 ) ( not ( = ?auto_203420 ?auto_203421 ) ) ( not ( = ?auto_203420 ?auto_203422 ) ) ( not ( = ?auto_203420 ?auto_203423 ) ) ( not ( = ?auto_203420 ?auto_203424 ) ) ( not ( = ?auto_203420 ?auto_203425 ) ) ( not ( = ?auto_203420 ?auto_203426 ) ) ( not ( = ?auto_203420 ?auto_203427 ) ) ( not ( = ?auto_203420 ?auto_203428 ) ) ( not ( = ?auto_203421 ?auto_203422 ) ) ( not ( = ?auto_203421 ?auto_203423 ) ) ( not ( = ?auto_203421 ?auto_203424 ) ) ( not ( = ?auto_203421 ?auto_203425 ) ) ( not ( = ?auto_203421 ?auto_203426 ) ) ( not ( = ?auto_203421 ?auto_203427 ) ) ( not ( = ?auto_203421 ?auto_203428 ) ) ( not ( = ?auto_203422 ?auto_203423 ) ) ( not ( = ?auto_203422 ?auto_203424 ) ) ( not ( = ?auto_203422 ?auto_203425 ) ) ( not ( = ?auto_203422 ?auto_203426 ) ) ( not ( = ?auto_203422 ?auto_203427 ) ) ( not ( = ?auto_203422 ?auto_203428 ) ) ( not ( = ?auto_203423 ?auto_203424 ) ) ( not ( = ?auto_203423 ?auto_203425 ) ) ( not ( = ?auto_203423 ?auto_203426 ) ) ( not ( = ?auto_203423 ?auto_203427 ) ) ( not ( = ?auto_203423 ?auto_203428 ) ) ( not ( = ?auto_203424 ?auto_203425 ) ) ( not ( = ?auto_203424 ?auto_203426 ) ) ( not ( = ?auto_203424 ?auto_203427 ) ) ( not ( = ?auto_203424 ?auto_203428 ) ) ( not ( = ?auto_203425 ?auto_203426 ) ) ( not ( = ?auto_203425 ?auto_203427 ) ) ( not ( = ?auto_203425 ?auto_203428 ) ) ( not ( = ?auto_203426 ?auto_203427 ) ) ( not ( = ?auto_203426 ?auto_203428 ) ) ( not ( = ?auto_203427 ?auto_203428 ) ) ( ON ?auto_203426 ?auto_203427 ) ( CLEAR ?auto_203424 ) ( ON ?auto_203425 ?auto_203426 ) ( CLEAR ?auto_203425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203420 ?auto_203421 ?auto_203422 ?auto_203423 ?auto_203424 ?auto_203425 )
      ( MAKE-8PILE ?auto_203420 ?auto_203421 ?auto_203422 ?auto_203423 ?auto_203424 ?auto_203425 ?auto_203426 ?auto_203427 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203437 - BLOCK
      ?auto_203438 - BLOCK
      ?auto_203439 - BLOCK
      ?auto_203440 - BLOCK
      ?auto_203441 - BLOCK
      ?auto_203442 - BLOCK
      ?auto_203443 - BLOCK
      ?auto_203444 - BLOCK
    )
    :vars
    (
      ?auto_203445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203444 ?auto_203445 ) ( ON-TABLE ?auto_203437 ) ( ON ?auto_203438 ?auto_203437 ) ( ON ?auto_203439 ?auto_203438 ) ( ON ?auto_203440 ?auto_203439 ) ( not ( = ?auto_203437 ?auto_203438 ) ) ( not ( = ?auto_203437 ?auto_203439 ) ) ( not ( = ?auto_203437 ?auto_203440 ) ) ( not ( = ?auto_203437 ?auto_203441 ) ) ( not ( = ?auto_203437 ?auto_203442 ) ) ( not ( = ?auto_203437 ?auto_203443 ) ) ( not ( = ?auto_203437 ?auto_203444 ) ) ( not ( = ?auto_203437 ?auto_203445 ) ) ( not ( = ?auto_203438 ?auto_203439 ) ) ( not ( = ?auto_203438 ?auto_203440 ) ) ( not ( = ?auto_203438 ?auto_203441 ) ) ( not ( = ?auto_203438 ?auto_203442 ) ) ( not ( = ?auto_203438 ?auto_203443 ) ) ( not ( = ?auto_203438 ?auto_203444 ) ) ( not ( = ?auto_203438 ?auto_203445 ) ) ( not ( = ?auto_203439 ?auto_203440 ) ) ( not ( = ?auto_203439 ?auto_203441 ) ) ( not ( = ?auto_203439 ?auto_203442 ) ) ( not ( = ?auto_203439 ?auto_203443 ) ) ( not ( = ?auto_203439 ?auto_203444 ) ) ( not ( = ?auto_203439 ?auto_203445 ) ) ( not ( = ?auto_203440 ?auto_203441 ) ) ( not ( = ?auto_203440 ?auto_203442 ) ) ( not ( = ?auto_203440 ?auto_203443 ) ) ( not ( = ?auto_203440 ?auto_203444 ) ) ( not ( = ?auto_203440 ?auto_203445 ) ) ( not ( = ?auto_203441 ?auto_203442 ) ) ( not ( = ?auto_203441 ?auto_203443 ) ) ( not ( = ?auto_203441 ?auto_203444 ) ) ( not ( = ?auto_203441 ?auto_203445 ) ) ( not ( = ?auto_203442 ?auto_203443 ) ) ( not ( = ?auto_203442 ?auto_203444 ) ) ( not ( = ?auto_203442 ?auto_203445 ) ) ( not ( = ?auto_203443 ?auto_203444 ) ) ( not ( = ?auto_203443 ?auto_203445 ) ) ( not ( = ?auto_203444 ?auto_203445 ) ) ( ON ?auto_203443 ?auto_203444 ) ( ON ?auto_203442 ?auto_203443 ) ( CLEAR ?auto_203440 ) ( ON ?auto_203441 ?auto_203442 ) ( CLEAR ?auto_203441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203437 ?auto_203438 ?auto_203439 ?auto_203440 ?auto_203441 )
      ( MAKE-8PILE ?auto_203437 ?auto_203438 ?auto_203439 ?auto_203440 ?auto_203441 ?auto_203442 ?auto_203443 ?auto_203444 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203454 - BLOCK
      ?auto_203455 - BLOCK
      ?auto_203456 - BLOCK
      ?auto_203457 - BLOCK
      ?auto_203458 - BLOCK
      ?auto_203459 - BLOCK
      ?auto_203460 - BLOCK
      ?auto_203461 - BLOCK
    )
    :vars
    (
      ?auto_203462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203461 ?auto_203462 ) ( ON-TABLE ?auto_203454 ) ( ON ?auto_203455 ?auto_203454 ) ( ON ?auto_203456 ?auto_203455 ) ( ON ?auto_203457 ?auto_203456 ) ( not ( = ?auto_203454 ?auto_203455 ) ) ( not ( = ?auto_203454 ?auto_203456 ) ) ( not ( = ?auto_203454 ?auto_203457 ) ) ( not ( = ?auto_203454 ?auto_203458 ) ) ( not ( = ?auto_203454 ?auto_203459 ) ) ( not ( = ?auto_203454 ?auto_203460 ) ) ( not ( = ?auto_203454 ?auto_203461 ) ) ( not ( = ?auto_203454 ?auto_203462 ) ) ( not ( = ?auto_203455 ?auto_203456 ) ) ( not ( = ?auto_203455 ?auto_203457 ) ) ( not ( = ?auto_203455 ?auto_203458 ) ) ( not ( = ?auto_203455 ?auto_203459 ) ) ( not ( = ?auto_203455 ?auto_203460 ) ) ( not ( = ?auto_203455 ?auto_203461 ) ) ( not ( = ?auto_203455 ?auto_203462 ) ) ( not ( = ?auto_203456 ?auto_203457 ) ) ( not ( = ?auto_203456 ?auto_203458 ) ) ( not ( = ?auto_203456 ?auto_203459 ) ) ( not ( = ?auto_203456 ?auto_203460 ) ) ( not ( = ?auto_203456 ?auto_203461 ) ) ( not ( = ?auto_203456 ?auto_203462 ) ) ( not ( = ?auto_203457 ?auto_203458 ) ) ( not ( = ?auto_203457 ?auto_203459 ) ) ( not ( = ?auto_203457 ?auto_203460 ) ) ( not ( = ?auto_203457 ?auto_203461 ) ) ( not ( = ?auto_203457 ?auto_203462 ) ) ( not ( = ?auto_203458 ?auto_203459 ) ) ( not ( = ?auto_203458 ?auto_203460 ) ) ( not ( = ?auto_203458 ?auto_203461 ) ) ( not ( = ?auto_203458 ?auto_203462 ) ) ( not ( = ?auto_203459 ?auto_203460 ) ) ( not ( = ?auto_203459 ?auto_203461 ) ) ( not ( = ?auto_203459 ?auto_203462 ) ) ( not ( = ?auto_203460 ?auto_203461 ) ) ( not ( = ?auto_203460 ?auto_203462 ) ) ( not ( = ?auto_203461 ?auto_203462 ) ) ( ON ?auto_203460 ?auto_203461 ) ( ON ?auto_203459 ?auto_203460 ) ( CLEAR ?auto_203457 ) ( ON ?auto_203458 ?auto_203459 ) ( CLEAR ?auto_203458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203454 ?auto_203455 ?auto_203456 ?auto_203457 ?auto_203458 )
      ( MAKE-8PILE ?auto_203454 ?auto_203455 ?auto_203456 ?auto_203457 ?auto_203458 ?auto_203459 ?auto_203460 ?auto_203461 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203471 - BLOCK
      ?auto_203472 - BLOCK
      ?auto_203473 - BLOCK
      ?auto_203474 - BLOCK
      ?auto_203475 - BLOCK
      ?auto_203476 - BLOCK
      ?auto_203477 - BLOCK
      ?auto_203478 - BLOCK
    )
    :vars
    (
      ?auto_203479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203478 ?auto_203479 ) ( ON-TABLE ?auto_203471 ) ( ON ?auto_203472 ?auto_203471 ) ( ON ?auto_203473 ?auto_203472 ) ( not ( = ?auto_203471 ?auto_203472 ) ) ( not ( = ?auto_203471 ?auto_203473 ) ) ( not ( = ?auto_203471 ?auto_203474 ) ) ( not ( = ?auto_203471 ?auto_203475 ) ) ( not ( = ?auto_203471 ?auto_203476 ) ) ( not ( = ?auto_203471 ?auto_203477 ) ) ( not ( = ?auto_203471 ?auto_203478 ) ) ( not ( = ?auto_203471 ?auto_203479 ) ) ( not ( = ?auto_203472 ?auto_203473 ) ) ( not ( = ?auto_203472 ?auto_203474 ) ) ( not ( = ?auto_203472 ?auto_203475 ) ) ( not ( = ?auto_203472 ?auto_203476 ) ) ( not ( = ?auto_203472 ?auto_203477 ) ) ( not ( = ?auto_203472 ?auto_203478 ) ) ( not ( = ?auto_203472 ?auto_203479 ) ) ( not ( = ?auto_203473 ?auto_203474 ) ) ( not ( = ?auto_203473 ?auto_203475 ) ) ( not ( = ?auto_203473 ?auto_203476 ) ) ( not ( = ?auto_203473 ?auto_203477 ) ) ( not ( = ?auto_203473 ?auto_203478 ) ) ( not ( = ?auto_203473 ?auto_203479 ) ) ( not ( = ?auto_203474 ?auto_203475 ) ) ( not ( = ?auto_203474 ?auto_203476 ) ) ( not ( = ?auto_203474 ?auto_203477 ) ) ( not ( = ?auto_203474 ?auto_203478 ) ) ( not ( = ?auto_203474 ?auto_203479 ) ) ( not ( = ?auto_203475 ?auto_203476 ) ) ( not ( = ?auto_203475 ?auto_203477 ) ) ( not ( = ?auto_203475 ?auto_203478 ) ) ( not ( = ?auto_203475 ?auto_203479 ) ) ( not ( = ?auto_203476 ?auto_203477 ) ) ( not ( = ?auto_203476 ?auto_203478 ) ) ( not ( = ?auto_203476 ?auto_203479 ) ) ( not ( = ?auto_203477 ?auto_203478 ) ) ( not ( = ?auto_203477 ?auto_203479 ) ) ( not ( = ?auto_203478 ?auto_203479 ) ) ( ON ?auto_203477 ?auto_203478 ) ( ON ?auto_203476 ?auto_203477 ) ( ON ?auto_203475 ?auto_203476 ) ( CLEAR ?auto_203473 ) ( ON ?auto_203474 ?auto_203475 ) ( CLEAR ?auto_203474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203471 ?auto_203472 ?auto_203473 ?auto_203474 )
      ( MAKE-8PILE ?auto_203471 ?auto_203472 ?auto_203473 ?auto_203474 ?auto_203475 ?auto_203476 ?auto_203477 ?auto_203478 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203488 - BLOCK
      ?auto_203489 - BLOCK
      ?auto_203490 - BLOCK
      ?auto_203491 - BLOCK
      ?auto_203492 - BLOCK
      ?auto_203493 - BLOCK
      ?auto_203494 - BLOCK
      ?auto_203495 - BLOCK
    )
    :vars
    (
      ?auto_203496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203495 ?auto_203496 ) ( ON-TABLE ?auto_203488 ) ( ON ?auto_203489 ?auto_203488 ) ( ON ?auto_203490 ?auto_203489 ) ( not ( = ?auto_203488 ?auto_203489 ) ) ( not ( = ?auto_203488 ?auto_203490 ) ) ( not ( = ?auto_203488 ?auto_203491 ) ) ( not ( = ?auto_203488 ?auto_203492 ) ) ( not ( = ?auto_203488 ?auto_203493 ) ) ( not ( = ?auto_203488 ?auto_203494 ) ) ( not ( = ?auto_203488 ?auto_203495 ) ) ( not ( = ?auto_203488 ?auto_203496 ) ) ( not ( = ?auto_203489 ?auto_203490 ) ) ( not ( = ?auto_203489 ?auto_203491 ) ) ( not ( = ?auto_203489 ?auto_203492 ) ) ( not ( = ?auto_203489 ?auto_203493 ) ) ( not ( = ?auto_203489 ?auto_203494 ) ) ( not ( = ?auto_203489 ?auto_203495 ) ) ( not ( = ?auto_203489 ?auto_203496 ) ) ( not ( = ?auto_203490 ?auto_203491 ) ) ( not ( = ?auto_203490 ?auto_203492 ) ) ( not ( = ?auto_203490 ?auto_203493 ) ) ( not ( = ?auto_203490 ?auto_203494 ) ) ( not ( = ?auto_203490 ?auto_203495 ) ) ( not ( = ?auto_203490 ?auto_203496 ) ) ( not ( = ?auto_203491 ?auto_203492 ) ) ( not ( = ?auto_203491 ?auto_203493 ) ) ( not ( = ?auto_203491 ?auto_203494 ) ) ( not ( = ?auto_203491 ?auto_203495 ) ) ( not ( = ?auto_203491 ?auto_203496 ) ) ( not ( = ?auto_203492 ?auto_203493 ) ) ( not ( = ?auto_203492 ?auto_203494 ) ) ( not ( = ?auto_203492 ?auto_203495 ) ) ( not ( = ?auto_203492 ?auto_203496 ) ) ( not ( = ?auto_203493 ?auto_203494 ) ) ( not ( = ?auto_203493 ?auto_203495 ) ) ( not ( = ?auto_203493 ?auto_203496 ) ) ( not ( = ?auto_203494 ?auto_203495 ) ) ( not ( = ?auto_203494 ?auto_203496 ) ) ( not ( = ?auto_203495 ?auto_203496 ) ) ( ON ?auto_203494 ?auto_203495 ) ( ON ?auto_203493 ?auto_203494 ) ( ON ?auto_203492 ?auto_203493 ) ( CLEAR ?auto_203490 ) ( ON ?auto_203491 ?auto_203492 ) ( CLEAR ?auto_203491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203488 ?auto_203489 ?auto_203490 ?auto_203491 )
      ( MAKE-8PILE ?auto_203488 ?auto_203489 ?auto_203490 ?auto_203491 ?auto_203492 ?auto_203493 ?auto_203494 ?auto_203495 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203505 - BLOCK
      ?auto_203506 - BLOCK
      ?auto_203507 - BLOCK
      ?auto_203508 - BLOCK
      ?auto_203509 - BLOCK
      ?auto_203510 - BLOCK
      ?auto_203511 - BLOCK
      ?auto_203512 - BLOCK
    )
    :vars
    (
      ?auto_203513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203512 ?auto_203513 ) ( ON-TABLE ?auto_203505 ) ( ON ?auto_203506 ?auto_203505 ) ( not ( = ?auto_203505 ?auto_203506 ) ) ( not ( = ?auto_203505 ?auto_203507 ) ) ( not ( = ?auto_203505 ?auto_203508 ) ) ( not ( = ?auto_203505 ?auto_203509 ) ) ( not ( = ?auto_203505 ?auto_203510 ) ) ( not ( = ?auto_203505 ?auto_203511 ) ) ( not ( = ?auto_203505 ?auto_203512 ) ) ( not ( = ?auto_203505 ?auto_203513 ) ) ( not ( = ?auto_203506 ?auto_203507 ) ) ( not ( = ?auto_203506 ?auto_203508 ) ) ( not ( = ?auto_203506 ?auto_203509 ) ) ( not ( = ?auto_203506 ?auto_203510 ) ) ( not ( = ?auto_203506 ?auto_203511 ) ) ( not ( = ?auto_203506 ?auto_203512 ) ) ( not ( = ?auto_203506 ?auto_203513 ) ) ( not ( = ?auto_203507 ?auto_203508 ) ) ( not ( = ?auto_203507 ?auto_203509 ) ) ( not ( = ?auto_203507 ?auto_203510 ) ) ( not ( = ?auto_203507 ?auto_203511 ) ) ( not ( = ?auto_203507 ?auto_203512 ) ) ( not ( = ?auto_203507 ?auto_203513 ) ) ( not ( = ?auto_203508 ?auto_203509 ) ) ( not ( = ?auto_203508 ?auto_203510 ) ) ( not ( = ?auto_203508 ?auto_203511 ) ) ( not ( = ?auto_203508 ?auto_203512 ) ) ( not ( = ?auto_203508 ?auto_203513 ) ) ( not ( = ?auto_203509 ?auto_203510 ) ) ( not ( = ?auto_203509 ?auto_203511 ) ) ( not ( = ?auto_203509 ?auto_203512 ) ) ( not ( = ?auto_203509 ?auto_203513 ) ) ( not ( = ?auto_203510 ?auto_203511 ) ) ( not ( = ?auto_203510 ?auto_203512 ) ) ( not ( = ?auto_203510 ?auto_203513 ) ) ( not ( = ?auto_203511 ?auto_203512 ) ) ( not ( = ?auto_203511 ?auto_203513 ) ) ( not ( = ?auto_203512 ?auto_203513 ) ) ( ON ?auto_203511 ?auto_203512 ) ( ON ?auto_203510 ?auto_203511 ) ( ON ?auto_203509 ?auto_203510 ) ( ON ?auto_203508 ?auto_203509 ) ( CLEAR ?auto_203506 ) ( ON ?auto_203507 ?auto_203508 ) ( CLEAR ?auto_203507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203505 ?auto_203506 ?auto_203507 )
      ( MAKE-8PILE ?auto_203505 ?auto_203506 ?auto_203507 ?auto_203508 ?auto_203509 ?auto_203510 ?auto_203511 ?auto_203512 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203522 - BLOCK
      ?auto_203523 - BLOCK
      ?auto_203524 - BLOCK
      ?auto_203525 - BLOCK
      ?auto_203526 - BLOCK
      ?auto_203527 - BLOCK
      ?auto_203528 - BLOCK
      ?auto_203529 - BLOCK
    )
    :vars
    (
      ?auto_203530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203529 ?auto_203530 ) ( ON-TABLE ?auto_203522 ) ( ON ?auto_203523 ?auto_203522 ) ( not ( = ?auto_203522 ?auto_203523 ) ) ( not ( = ?auto_203522 ?auto_203524 ) ) ( not ( = ?auto_203522 ?auto_203525 ) ) ( not ( = ?auto_203522 ?auto_203526 ) ) ( not ( = ?auto_203522 ?auto_203527 ) ) ( not ( = ?auto_203522 ?auto_203528 ) ) ( not ( = ?auto_203522 ?auto_203529 ) ) ( not ( = ?auto_203522 ?auto_203530 ) ) ( not ( = ?auto_203523 ?auto_203524 ) ) ( not ( = ?auto_203523 ?auto_203525 ) ) ( not ( = ?auto_203523 ?auto_203526 ) ) ( not ( = ?auto_203523 ?auto_203527 ) ) ( not ( = ?auto_203523 ?auto_203528 ) ) ( not ( = ?auto_203523 ?auto_203529 ) ) ( not ( = ?auto_203523 ?auto_203530 ) ) ( not ( = ?auto_203524 ?auto_203525 ) ) ( not ( = ?auto_203524 ?auto_203526 ) ) ( not ( = ?auto_203524 ?auto_203527 ) ) ( not ( = ?auto_203524 ?auto_203528 ) ) ( not ( = ?auto_203524 ?auto_203529 ) ) ( not ( = ?auto_203524 ?auto_203530 ) ) ( not ( = ?auto_203525 ?auto_203526 ) ) ( not ( = ?auto_203525 ?auto_203527 ) ) ( not ( = ?auto_203525 ?auto_203528 ) ) ( not ( = ?auto_203525 ?auto_203529 ) ) ( not ( = ?auto_203525 ?auto_203530 ) ) ( not ( = ?auto_203526 ?auto_203527 ) ) ( not ( = ?auto_203526 ?auto_203528 ) ) ( not ( = ?auto_203526 ?auto_203529 ) ) ( not ( = ?auto_203526 ?auto_203530 ) ) ( not ( = ?auto_203527 ?auto_203528 ) ) ( not ( = ?auto_203527 ?auto_203529 ) ) ( not ( = ?auto_203527 ?auto_203530 ) ) ( not ( = ?auto_203528 ?auto_203529 ) ) ( not ( = ?auto_203528 ?auto_203530 ) ) ( not ( = ?auto_203529 ?auto_203530 ) ) ( ON ?auto_203528 ?auto_203529 ) ( ON ?auto_203527 ?auto_203528 ) ( ON ?auto_203526 ?auto_203527 ) ( ON ?auto_203525 ?auto_203526 ) ( CLEAR ?auto_203523 ) ( ON ?auto_203524 ?auto_203525 ) ( CLEAR ?auto_203524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203522 ?auto_203523 ?auto_203524 )
      ( MAKE-8PILE ?auto_203522 ?auto_203523 ?auto_203524 ?auto_203525 ?auto_203526 ?auto_203527 ?auto_203528 ?auto_203529 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203539 - BLOCK
      ?auto_203540 - BLOCK
      ?auto_203541 - BLOCK
      ?auto_203542 - BLOCK
      ?auto_203543 - BLOCK
      ?auto_203544 - BLOCK
      ?auto_203545 - BLOCK
      ?auto_203546 - BLOCK
    )
    :vars
    (
      ?auto_203547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203546 ?auto_203547 ) ( ON-TABLE ?auto_203539 ) ( not ( = ?auto_203539 ?auto_203540 ) ) ( not ( = ?auto_203539 ?auto_203541 ) ) ( not ( = ?auto_203539 ?auto_203542 ) ) ( not ( = ?auto_203539 ?auto_203543 ) ) ( not ( = ?auto_203539 ?auto_203544 ) ) ( not ( = ?auto_203539 ?auto_203545 ) ) ( not ( = ?auto_203539 ?auto_203546 ) ) ( not ( = ?auto_203539 ?auto_203547 ) ) ( not ( = ?auto_203540 ?auto_203541 ) ) ( not ( = ?auto_203540 ?auto_203542 ) ) ( not ( = ?auto_203540 ?auto_203543 ) ) ( not ( = ?auto_203540 ?auto_203544 ) ) ( not ( = ?auto_203540 ?auto_203545 ) ) ( not ( = ?auto_203540 ?auto_203546 ) ) ( not ( = ?auto_203540 ?auto_203547 ) ) ( not ( = ?auto_203541 ?auto_203542 ) ) ( not ( = ?auto_203541 ?auto_203543 ) ) ( not ( = ?auto_203541 ?auto_203544 ) ) ( not ( = ?auto_203541 ?auto_203545 ) ) ( not ( = ?auto_203541 ?auto_203546 ) ) ( not ( = ?auto_203541 ?auto_203547 ) ) ( not ( = ?auto_203542 ?auto_203543 ) ) ( not ( = ?auto_203542 ?auto_203544 ) ) ( not ( = ?auto_203542 ?auto_203545 ) ) ( not ( = ?auto_203542 ?auto_203546 ) ) ( not ( = ?auto_203542 ?auto_203547 ) ) ( not ( = ?auto_203543 ?auto_203544 ) ) ( not ( = ?auto_203543 ?auto_203545 ) ) ( not ( = ?auto_203543 ?auto_203546 ) ) ( not ( = ?auto_203543 ?auto_203547 ) ) ( not ( = ?auto_203544 ?auto_203545 ) ) ( not ( = ?auto_203544 ?auto_203546 ) ) ( not ( = ?auto_203544 ?auto_203547 ) ) ( not ( = ?auto_203545 ?auto_203546 ) ) ( not ( = ?auto_203545 ?auto_203547 ) ) ( not ( = ?auto_203546 ?auto_203547 ) ) ( ON ?auto_203545 ?auto_203546 ) ( ON ?auto_203544 ?auto_203545 ) ( ON ?auto_203543 ?auto_203544 ) ( ON ?auto_203542 ?auto_203543 ) ( ON ?auto_203541 ?auto_203542 ) ( CLEAR ?auto_203539 ) ( ON ?auto_203540 ?auto_203541 ) ( CLEAR ?auto_203540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203539 ?auto_203540 )
      ( MAKE-8PILE ?auto_203539 ?auto_203540 ?auto_203541 ?auto_203542 ?auto_203543 ?auto_203544 ?auto_203545 ?auto_203546 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203556 - BLOCK
      ?auto_203557 - BLOCK
      ?auto_203558 - BLOCK
      ?auto_203559 - BLOCK
      ?auto_203560 - BLOCK
      ?auto_203561 - BLOCK
      ?auto_203562 - BLOCK
      ?auto_203563 - BLOCK
    )
    :vars
    (
      ?auto_203564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203563 ?auto_203564 ) ( ON-TABLE ?auto_203556 ) ( not ( = ?auto_203556 ?auto_203557 ) ) ( not ( = ?auto_203556 ?auto_203558 ) ) ( not ( = ?auto_203556 ?auto_203559 ) ) ( not ( = ?auto_203556 ?auto_203560 ) ) ( not ( = ?auto_203556 ?auto_203561 ) ) ( not ( = ?auto_203556 ?auto_203562 ) ) ( not ( = ?auto_203556 ?auto_203563 ) ) ( not ( = ?auto_203556 ?auto_203564 ) ) ( not ( = ?auto_203557 ?auto_203558 ) ) ( not ( = ?auto_203557 ?auto_203559 ) ) ( not ( = ?auto_203557 ?auto_203560 ) ) ( not ( = ?auto_203557 ?auto_203561 ) ) ( not ( = ?auto_203557 ?auto_203562 ) ) ( not ( = ?auto_203557 ?auto_203563 ) ) ( not ( = ?auto_203557 ?auto_203564 ) ) ( not ( = ?auto_203558 ?auto_203559 ) ) ( not ( = ?auto_203558 ?auto_203560 ) ) ( not ( = ?auto_203558 ?auto_203561 ) ) ( not ( = ?auto_203558 ?auto_203562 ) ) ( not ( = ?auto_203558 ?auto_203563 ) ) ( not ( = ?auto_203558 ?auto_203564 ) ) ( not ( = ?auto_203559 ?auto_203560 ) ) ( not ( = ?auto_203559 ?auto_203561 ) ) ( not ( = ?auto_203559 ?auto_203562 ) ) ( not ( = ?auto_203559 ?auto_203563 ) ) ( not ( = ?auto_203559 ?auto_203564 ) ) ( not ( = ?auto_203560 ?auto_203561 ) ) ( not ( = ?auto_203560 ?auto_203562 ) ) ( not ( = ?auto_203560 ?auto_203563 ) ) ( not ( = ?auto_203560 ?auto_203564 ) ) ( not ( = ?auto_203561 ?auto_203562 ) ) ( not ( = ?auto_203561 ?auto_203563 ) ) ( not ( = ?auto_203561 ?auto_203564 ) ) ( not ( = ?auto_203562 ?auto_203563 ) ) ( not ( = ?auto_203562 ?auto_203564 ) ) ( not ( = ?auto_203563 ?auto_203564 ) ) ( ON ?auto_203562 ?auto_203563 ) ( ON ?auto_203561 ?auto_203562 ) ( ON ?auto_203560 ?auto_203561 ) ( ON ?auto_203559 ?auto_203560 ) ( ON ?auto_203558 ?auto_203559 ) ( CLEAR ?auto_203556 ) ( ON ?auto_203557 ?auto_203558 ) ( CLEAR ?auto_203557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203556 ?auto_203557 )
      ( MAKE-8PILE ?auto_203556 ?auto_203557 ?auto_203558 ?auto_203559 ?auto_203560 ?auto_203561 ?auto_203562 ?auto_203563 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203573 - BLOCK
      ?auto_203574 - BLOCK
      ?auto_203575 - BLOCK
      ?auto_203576 - BLOCK
      ?auto_203577 - BLOCK
      ?auto_203578 - BLOCK
      ?auto_203579 - BLOCK
      ?auto_203580 - BLOCK
    )
    :vars
    (
      ?auto_203581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203580 ?auto_203581 ) ( not ( = ?auto_203573 ?auto_203574 ) ) ( not ( = ?auto_203573 ?auto_203575 ) ) ( not ( = ?auto_203573 ?auto_203576 ) ) ( not ( = ?auto_203573 ?auto_203577 ) ) ( not ( = ?auto_203573 ?auto_203578 ) ) ( not ( = ?auto_203573 ?auto_203579 ) ) ( not ( = ?auto_203573 ?auto_203580 ) ) ( not ( = ?auto_203573 ?auto_203581 ) ) ( not ( = ?auto_203574 ?auto_203575 ) ) ( not ( = ?auto_203574 ?auto_203576 ) ) ( not ( = ?auto_203574 ?auto_203577 ) ) ( not ( = ?auto_203574 ?auto_203578 ) ) ( not ( = ?auto_203574 ?auto_203579 ) ) ( not ( = ?auto_203574 ?auto_203580 ) ) ( not ( = ?auto_203574 ?auto_203581 ) ) ( not ( = ?auto_203575 ?auto_203576 ) ) ( not ( = ?auto_203575 ?auto_203577 ) ) ( not ( = ?auto_203575 ?auto_203578 ) ) ( not ( = ?auto_203575 ?auto_203579 ) ) ( not ( = ?auto_203575 ?auto_203580 ) ) ( not ( = ?auto_203575 ?auto_203581 ) ) ( not ( = ?auto_203576 ?auto_203577 ) ) ( not ( = ?auto_203576 ?auto_203578 ) ) ( not ( = ?auto_203576 ?auto_203579 ) ) ( not ( = ?auto_203576 ?auto_203580 ) ) ( not ( = ?auto_203576 ?auto_203581 ) ) ( not ( = ?auto_203577 ?auto_203578 ) ) ( not ( = ?auto_203577 ?auto_203579 ) ) ( not ( = ?auto_203577 ?auto_203580 ) ) ( not ( = ?auto_203577 ?auto_203581 ) ) ( not ( = ?auto_203578 ?auto_203579 ) ) ( not ( = ?auto_203578 ?auto_203580 ) ) ( not ( = ?auto_203578 ?auto_203581 ) ) ( not ( = ?auto_203579 ?auto_203580 ) ) ( not ( = ?auto_203579 ?auto_203581 ) ) ( not ( = ?auto_203580 ?auto_203581 ) ) ( ON ?auto_203579 ?auto_203580 ) ( ON ?auto_203578 ?auto_203579 ) ( ON ?auto_203577 ?auto_203578 ) ( ON ?auto_203576 ?auto_203577 ) ( ON ?auto_203575 ?auto_203576 ) ( ON ?auto_203574 ?auto_203575 ) ( ON ?auto_203573 ?auto_203574 ) ( CLEAR ?auto_203573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203573 )
      ( MAKE-8PILE ?auto_203573 ?auto_203574 ?auto_203575 ?auto_203576 ?auto_203577 ?auto_203578 ?auto_203579 ?auto_203580 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_203590 - BLOCK
      ?auto_203591 - BLOCK
      ?auto_203592 - BLOCK
      ?auto_203593 - BLOCK
      ?auto_203594 - BLOCK
      ?auto_203595 - BLOCK
      ?auto_203596 - BLOCK
      ?auto_203597 - BLOCK
    )
    :vars
    (
      ?auto_203598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203597 ?auto_203598 ) ( not ( = ?auto_203590 ?auto_203591 ) ) ( not ( = ?auto_203590 ?auto_203592 ) ) ( not ( = ?auto_203590 ?auto_203593 ) ) ( not ( = ?auto_203590 ?auto_203594 ) ) ( not ( = ?auto_203590 ?auto_203595 ) ) ( not ( = ?auto_203590 ?auto_203596 ) ) ( not ( = ?auto_203590 ?auto_203597 ) ) ( not ( = ?auto_203590 ?auto_203598 ) ) ( not ( = ?auto_203591 ?auto_203592 ) ) ( not ( = ?auto_203591 ?auto_203593 ) ) ( not ( = ?auto_203591 ?auto_203594 ) ) ( not ( = ?auto_203591 ?auto_203595 ) ) ( not ( = ?auto_203591 ?auto_203596 ) ) ( not ( = ?auto_203591 ?auto_203597 ) ) ( not ( = ?auto_203591 ?auto_203598 ) ) ( not ( = ?auto_203592 ?auto_203593 ) ) ( not ( = ?auto_203592 ?auto_203594 ) ) ( not ( = ?auto_203592 ?auto_203595 ) ) ( not ( = ?auto_203592 ?auto_203596 ) ) ( not ( = ?auto_203592 ?auto_203597 ) ) ( not ( = ?auto_203592 ?auto_203598 ) ) ( not ( = ?auto_203593 ?auto_203594 ) ) ( not ( = ?auto_203593 ?auto_203595 ) ) ( not ( = ?auto_203593 ?auto_203596 ) ) ( not ( = ?auto_203593 ?auto_203597 ) ) ( not ( = ?auto_203593 ?auto_203598 ) ) ( not ( = ?auto_203594 ?auto_203595 ) ) ( not ( = ?auto_203594 ?auto_203596 ) ) ( not ( = ?auto_203594 ?auto_203597 ) ) ( not ( = ?auto_203594 ?auto_203598 ) ) ( not ( = ?auto_203595 ?auto_203596 ) ) ( not ( = ?auto_203595 ?auto_203597 ) ) ( not ( = ?auto_203595 ?auto_203598 ) ) ( not ( = ?auto_203596 ?auto_203597 ) ) ( not ( = ?auto_203596 ?auto_203598 ) ) ( not ( = ?auto_203597 ?auto_203598 ) ) ( ON ?auto_203596 ?auto_203597 ) ( ON ?auto_203595 ?auto_203596 ) ( ON ?auto_203594 ?auto_203595 ) ( ON ?auto_203593 ?auto_203594 ) ( ON ?auto_203592 ?auto_203593 ) ( ON ?auto_203591 ?auto_203592 ) ( ON ?auto_203590 ?auto_203591 ) ( CLEAR ?auto_203590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203590 )
      ( MAKE-8PILE ?auto_203590 ?auto_203591 ?auto_203592 ?auto_203593 ?auto_203594 ?auto_203595 ?auto_203596 ?auto_203597 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203608 - BLOCK
      ?auto_203609 - BLOCK
      ?auto_203610 - BLOCK
      ?auto_203611 - BLOCK
      ?auto_203612 - BLOCK
      ?auto_203613 - BLOCK
      ?auto_203614 - BLOCK
      ?auto_203615 - BLOCK
      ?auto_203616 - BLOCK
    )
    :vars
    (
      ?auto_203617 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_203615 ) ( ON ?auto_203616 ?auto_203617 ) ( CLEAR ?auto_203616 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203608 ) ( ON ?auto_203609 ?auto_203608 ) ( ON ?auto_203610 ?auto_203609 ) ( ON ?auto_203611 ?auto_203610 ) ( ON ?auto_203612 ?auto_203611 ) ( ON ?auto_203613 ?auto_203612 ) ( ON ?auto_203614 ?auto_203613 ) ( ON ?auto_203615 ?auto_203614 ) ( not ( = ?auto_203608 ?auto_203609 ) ) ( not ( = ?auto_203608 ?auto_203610 ) ) ( not ( = ?auto_203608 ?auto_203611 ) ) ( not ( = ?auto_203608 ?auto_203612 ) ) ( not ( = ?auto_203608 ?auto_203613 ) ) ( not ( = ?auto_203608 ?auto_203614 ) ) ( not ( = ?auto_203608 ?auto_203615 ) ) ( not ( = ?auto_203608 ?auto_203616 ) ) ( not ( = ?auto_203608 ?auto_203617 ) ) ( not ( = ?auto_203609 ?auto_203610 ) ) ( not ( = ?auto_203609 ?auto_203611 ) ) ( not ( = ?auto_203609 ?auto_203612 ) ) ( not ( = ?auto_203609 ?auto_203613 ) ) ( not ( = ?auto_203609 ?auto_203614 ) ) ( not ( = ?auto_203609 ?auto_203615 ) ) ( not ( = ?auto_203609 ?auto_203616 ) ) ( not ( = ?auto_203609 ?auto_203617 ) ) ( not ( = ?auto_203610 ?auto_203611 ) ) ( not ( = ?auto_203610 ?auto_203612 ) ) ( not ( = ?auto_203610 ?auto_203613 ) ) ( not ( = ?auto_203610 ?auto_203614 ) ) ( not ( = ?auto_203610 ?auto_203615 ) ) ( not ( = ?auto_203610 ?auto_203616 ) ) ( not ( = ?auto_203610 ?auto_203617 ) ) ( not ( = ?auto_203611 ?auto_203612 ) ) ( not ( = ?auto_203611 ?auto_203613 ) ) ( not ( = ?auto_203611 ?auto_203614 ) ) ( not ( = ?auto_203611 ?auto_203615 ) ) ( not ( = ?auto_203611 ?auto_203616 ) ) ( not ( = ?auto_203611 ?auto_203617 ) ) ( not ( = ?auto_203612 ?auto_203613 ) ) ( not ( = ?auto_203612 ?auto_203614 ) ) ( not ( = ?auto_203612 ?auto_203615 ) ) ( not ( = ?auto_203612 ?auto_203616 ) ) ( not ( = ?auto_203612 ?auto_203617 ) ) ( not ( = ?auto_203613 ?auto_203614 ) ) ( not ( = ?auto_203613 ?auto_203615 ) ) ( not ( = ?auto_203613 ?auto_203616 ) ) ( not ( = ?auto_203613 ?auto_203617 ) ) ( not ( = ?auto_203614 ?auto_203615 ) ) ( not ( = ?auto_203614 ?auto_203616 ) ) ( not ( = ?auto_203614 ?auto_203617 ) ) ( not ( = ?auto_203615 ?auto_203616 ) ) ( not ( = ?auto_203615 ?auto_203617 ) ) ( not ( = ?auto_203616 ?auto_203617 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203616 ?auto_203617 )
      ( !STACK ?auto_203616 ?auto_203615 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203627 - BLOCK
      ?auto_203628 - BLOCK
      ?auto_203629 - BLOCK
      ?auto_203630 - BLOCK
      ?auto_203631 - BLOCK
      ?auto_203632 - BLOCK
      ?auto_203633 - BLOCK
      ?auto_203634 - BLOCK
      ?auto_203635 - BLOCK
    )
    :vars
    (
      ?auto_203636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_203634 ) ( ON ?auto_203635 ?auto_203636 ) ( CLEAR ?auto_203635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203627 ) ( ON ?auto_203628 ?auto_203627 ) ( ON ?auto_203629 ?auto_203628 ) ( ON ?auto_203630 ?auto_203629 ) ( ON ?auto_203631 ?auto_203630 ) ( ON ?auto_203632 ?auto_203631 ) ( ON ?auto_203633 ?auto_203632 ) ( ON ?auto_203634 ?auto_203633 ) ( not ( = ?auto_203627 ?auto_203628 ) ) ( not ( = ?auto_203627 ?auto_203629 ) ) ( not ( = ?auto_203627 ?auto_203630 ) ) ( not ( = ?auto_203627 ?auto_203631 ) ) ( not ( = ?auto_203627 ?auto_203632 ) ) ( not ( = ?auto_203627 ?auto_203633 ) ) ( not ( = ?auto_203627 ?auto_203634 ) ) ( not ( = ?auto_203627 ?auto_203635 ) ) ( not ( = ?auto_203627 ?auto_203636 ) ) ( not ( = ?auto_203628 ?auto_203629 ) ) ( not ( = ?auto_203628 ?auto_203630 ) ) ( not ( = ?auto_203628 ?auto_203631 ) ) ( not ( = ?auto_203628 ?auto_203632 ) ) ( not ( = ?auto_203628 ?auto_203633 ) ) ( not ( = ?auto_203628 ?auto_203634 ) ) ( not ( = ?auto_203628 ?auto_203635 ) ) ( not ( = ?auto_203628 ?auto_203636 ) ) ( not ( = ?auto_203629 ?auto_203630 ) ) ( not ( = ?auto_203629 ?auto_203631 ) ) ( not ( = ?auto_203629 ?auto_203632 ) ) ( not ( = ?auto_203629 ?auto_203633 ) ) ( not ( = ?auto_203629 ?auto_203634 ) ) ( not ( = ?auto_203629 ?auto_203635 ) ) ( not ( = ?auto_203629 ?auto_203636 ) ) ( not ( = ?auto_203630 ?auto_203631 ) ) ( not ( = ?auto_203630 ?auto_203632 ) ) ( not ( = ?auto_203630 ?auto_203633 ) ) ( not ( = ?auto_203630 ?auto_203634 ) ) ( not ( = ?auto_203630 ?auto_203635 ) ) ( not ( = ?auto_203630 ?auto_203636 ) ) ( not ( = ?auto_203631 ?auto_203632 ) ) ( not ( = ?auto_203631 ?auto_203633 ) ) ( not ( = ?auto_203631 ?auto_203634 ) ) ( not ( = ?auto_203631 ?auto_203635 ) ) ( not ( = ?auto_203631 ?auto_203636 ) ) ( not ( = ?auto_203632 ?auto_203633 ) ) ( not ( = ?auto_203632 ?auto_203634 ) ) ( not ( = ?auto_203632 ?auto_203635 ) ) ( not ( = ?auto_203632 ?auto_203636 ) ) ( not ( = ?auto_203633 ?auto_203634 ) ) ( not ( = ?auto_203633 ?auto_203635 ) ) ( not ( = ?auto_203633 ?auto_203636 ) ) ( not ( = ?auto_203634 ?auto_203635 ) ) ( not ( = ?auto_203634 ?auto_203636 ) ) ( not ( = ?auto_203635 ?auto_203636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203635 ?auto_203636 )
      ( !STACK ?auto_203635 ?auto_203634 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203646 - BLOCK
      ?auto_203647 - BLOCK
      ?auto_203648 - BLOCK
      ?auto_203649 - BLOCK
      ?auto_203650 - BLOCK
      ?auto_203651 - BLOCK
      ?auto_203652 - BLOCK
      ?auto_203653 - BLOCK
      ?auto_203654 - BLOCK
    )
    :vars
    (
      ?auto_203655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203654 ?auto_203655 ) ( ON-TABLE ?auto_203646 ) ( ON ?auto_203647 ?auto_203646 ) ( ON ?auto_203648 ?auto_203647 ) ( ON ?auto_203649 ?auto_203648 ) ( ON ?auto_203650 ?auto_203649 ) ( ON ?auto_203651 ?auto_203650 ) ( ON ?auto_203652 ?auto_203651 ) ( not ( = ?auto_203646 ?auto_203647 ) ) ( not ( = ?auto_203646 ?auto_203648 ) ) ( not ( = ?auto_203646 ?auto_203649 ) ) ( not ( = ?auto_203646 ?auto_203650 ) ) ( not ( = ?auto_203646 ?auto_203651 ) ) ( not ( = ?auto_203646 ?auto_203652 ) ) ( not ( = ?auto_203646 ?auto_203653 ) ) ( not ( = ?auto_203646 ?auto_203654 ) ) ( not ( = ?auto_203646 ?auto_203655 ) ) ( not ( = ?auto_203647 ?auto_203648 ) ) ( not ( = ?auto_203647 ?auto_203649 ) ) ( not ( = ?auto_203647 ?auto_203650 ) ) ( not ( = ?auto_203647 ?auto_203651 ) ) ( not ( = ?auto_203647 ?auto_203652 ) ) ( not ( = ?auto_203647 ?auto_203653 ) ) ( not ( = ?auto_203647 ?auto_203654 ) ) ( not ( = ?auto_203647 ?auto_203655 ) ) ( not ( = ?auto_203648 ?auto_203649 ) ) ( not ( = ?auto_203648 ?auto_203650 ) ) ( not ( = ?auto_203648 ?auto_203651 ) ) ( not ( = ?auto_203648 ?auto_203652 ) ) ( not ( = ?auto_203648 ?auto_203653 ) ) ( not ( = ?auto_203648 ?auto_203654 ) ) ( not ( = ?auto_203648 ?auto_203655 ) ) ( not ( = ?auto_203649 ?auto_203650 ) ) ( not ( = ?auto_203649 ?auto_203651 ) ) ( not ( = ?auto_203649 ?auto_203652 ) ) ( not ( = ?auto_203649 ?auto_203653 ) ) ( not ( = ?auto_203649 ?auto_203654 ) ) ( not ( = ?auto_203649 ?auto_203655 ) ) ( not ( = ?auto_203650 ?auto_203651 ) ) ( not ( = ?auto_203650 ?auto_203652 ) ) ( not ( = ?auto_203650 ?auto_203653 ) ) ( not ( = ?auto_203650 ?auto_203654 ) ) ( not ( = ?auto_203650 ?auto_203655 ) ) ( not ( = ?auto_203651 ?auto_203652 ) ) ( not ( = ?auto_203651 ?auto_203653 ) ) ( not ( = ?auto_203651 ?auto_203654 ) ) ( not ( = ?auto_203651 ?auto_203655 ) ) ( not ( = ?auto_203652 ?auto_203653 ) ) ( not ( = ?auto_203652 ?auto_203654 ) ) ( not ( = ?auto_203652 ?auto_203655 ) ) ( not ( = ?auto_203653 ?auto_203654 ) ) ( not ( = ?auto_203653 ?auto_203655 ) ) ( not ( = ?auto_203654 ?auto_203655 ) ) ( CLEAR ?auto_203652 ) ( ON ?auto_203653 ?auto_203654 ) ( CLEAR ?auto_203653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_203646 ?auto_203647 ?auto_203648 ?auto_203649 ?auto_203650 ?auto_203651 ?auto_203652 ?auto_203653 )
      ( MAKE-9PILE ?auto_203646 ?auto_203647 ?auto_203648 ?auto_203649 ?auto_203650 ?auto_203651 ?auto_203652 ?auto_203653 ?auto_203654 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203665 - BLOCK
      ?auto_203666 - BLOCK
      ?auto_203667 - BLOCK
      ?auto_203668 - BLOCK
      ?auto_203669 - BLOCK
      ?auto_203670 - BLOCK
      ?auto_203671 - BLOCK
      ?auto_203672 - BLOCK
      ?auto_203673 - BLOCK
    )
    :vars
    (
      ?auto_203674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203673 ?auto_203674 ) ( ON-TABLE ?auto_203665 ) ( ON ?auto_203666 ?auto_203665 ) ( ON ?auto_203667 ?auto_203666 ) ( ON ?auto_203668 ?auto_203667 ) ( ON ?auto_203669 ?auto_203668 ) ( ON ?auto_203670 ?auto_203669 ) ( ON ?auto_203671 ?auto_203670 ) ( not ( = ?auto_203665 ?auto_203666 ) ) ( not ( = ?auto_203665 ?auto_203667 ) ) ( not ( = ?auto_203665 ?auto_203668 ) ) ( not ( = ?auto_203665 ?auto_203669 ) ) ( not ( = ?auto_203665 ?auto_203670 ) ) ( not ( = ?auto_203665 ?auto_203671 ) ) ( not ( = ?auto_203665 ?auto_203672 ) ) ( not ( = ?auto_203665 ?auto_203673 ) ) ( not ( = ?auto_203665 ?auto_203674 ) ) ( not ( = ?auto_203666 ?auto_203667 ) ) ( not ( = ?auto_203666 ?auto_203668 ) ) ( not ( = ?auto_203666 ?auto_203669 ) ) ( not ( = ?auto_203666 ?auto_203670 ) ) ( not ( = ?auto_203666 ?auto_203671 ) ) ( not ( = ?auto_203666 ?auto_203672 ) ) ( not ( = ?auto_203666 ?auto_203673 ) ) ( not ( = ?auto_203666 ?auto_203674 ) ) ( not ( = ?auto_203667 ?auto_203668 ) ) ( not ( = ?auto_203667 ?auto_203669 ) ) ( not ( = ?auto_203667 ?auto_203670 ) ) ( not ( = ?auto_203667 ?auto_203671 ) ) ( not ( = ?auto_203667 ?auto_203672 ) ) ( not ( = ?auto_203667 ?auto_203673 ) ) ( not ( = ?auto_203667 ?auto_203674 ) ) ( not ( = ?auto_203668 ?auto_203669 ) ) ( not ( = ?auto_203668 ?auto_203670 ) ) ( not ( = ?auto_203668 ?auto_203671 ) ) ( not ( = ?auto_203668 ?auto_203672 ) ) ( not ( = ?auto_203668 ?auto_203673 ) ) ( not ( = ?auto_203668 ?auto_203674 ) ) ( not ( = ?auto_203669 ?auto_203670 ) ) ( not ( = ?auto_203669 ?auto_203671 ) ) ( not ( = ?auto_203669 ?auto_203672 ) ) ( not ( = ?auto_203669 ?auto_203673 ) ) ( not ( = ?auto_203669 ?auto_203674 ) ) ( not ( = ?auto_203670 ?auto_203671 ) ) ( not ( = ?auto_203670 ?auto_203672 ) ) ( not ( = ?auto_203670 ?auto_203673 ) ) ( not ( = ?auto_203670 ?auto_203674 ) ) ( not ( = ?auto_203671 ?auto_203672 ) ) ( not ( = ?auto_203671 ?auto_203673 ) ) ( not ( = ?auto_203671 ?auto_203674 ) ) ( not ( = ?auto_203672 ?auto_203673 ) ) ( not ( = ?auto_203672 ?auto_203674 ) ) ( not ( = ?auto_203673 ?auto_203674 ) ) ( CLEAR ?auto_203671 ) ( ON ?auto_203672 ?auto_203673 ) ( CLEAR ?auto_203672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_203665 ?auto_203666 ?auto_203667 ?auto_203668 ?auto_203669 ?auto_203670 ?auto_203671 ?auto_203672 )
      ( MAKE-9PILE ?auto_203665 ?auto_203666 ?auto_203667 ?auto_203668 ?auto_203669 ?auto_203670 ?auto_203671 ?auto_203672 ?auto_203673 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203684 - BLOCK
      ?auto_203685 - BLOCK
      ?auto_203686 - BLOCK
      ?auto_203687 - BLOCK
      ?auto_203688 - BLOCK
      ?auto_203689 - BLOCK
      ?auto_203690 - BLOCK
      ?auto_203691 - BLOCK
      ?auto_203692 - BLOCK
    )
    :vars
    (
      ?auto_203693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203692 ?auto_203693 ) ( ON-TABLE ?auto_203684 ) ( ON ?auto_203685 ?auto_203684 ) ( ON ?auto_203686 ?auto_203685 ) ( ON ?auto_203687 ?auto_203686 ) ( ON ?auto_203688 ?auto_203687 ) ( ON ?auto_203689 ?auto_203688 ) ( not ( = ?auto_203684 ?auto_203685 ) ) ( not ( = ?auto_203684 ?auto_203686 ) ) ( not ( = ?auto_203684 ?auto_203687 ) ) ( not ( = ?auto_203684 ?auto_203688 ) ) ( not ( = ?auto_203684 ?auto_203689 ) ) ( not ( = ?auto_203684 ?auto_203690 ) ) ( not ( = ?auto_203684 ?auto_203691 ) ) ( not ( = ?auto_203684 ?auto_203692 ) ) ( not ( = ?auto_203684 ?auto_203693 ) ) ( not ( = ?auto_203685 ?auto_203686 ) ) ( not ( = ?auto_203685 ?auto_203687 ) ) ( not ( = ?auto_203685 ?auto_203688 ) ) ( not ( = ?auto_203685 ?auto_203689 ) ) ( not ( = ?auto_203685 ?auto_203690 ) ) ( not ( = ?auto_203685 ?auto_203691 ) ) ( not ( = ?auto_203685 ?auto_203692 ) ) ( not ( = ?auto_203685 ?auto_203693 ) ) ( not ( = ?auto_203686 ?auto_203687 ) ) ( not ( = ?auto_203686 ?auto_203688 ) ) ( not ( = ?auto_203686 ?auto_203689 ) ) ( not ( = ?auto_203686 ?auto_203690 ) ) ( not ( = ?auto_203686 ?auto_203691 ) ) ( not ( = ?auto_203686 ?auto_203692 ) ) ( not ( = ?auto_203686 ?auto_203693 ) ) ( not ( = ?auto_203687 ?auto_203688 ) ) ( not ( = ?auto_203687 ?auto_203689 ) ) ( not ( = ?auto_203687 ?auto_203690 ) ) ( not ( = ?auto_203687 ?auto_203691 ) ) ( not ( = ?auto_203687 ?auto_203692 ) ) ( not ( = ?auto_203687 ?auto_203693 ) ) ( not ( = ?auto_203688 ?auto_203689 ) ) ( not ( = ?auto_203688 ?auto_203690 ) ) ( not ( = ?auto_203688 ?auto_203691 ) ) ( not ( = ?auto_203688 ?auto_203692 ) ) ( not ( = ?auto_203688 ?auto_203693 ) ) ( not ( = ?auto_203689 ?auto_203690 ) ) ( not ( = ?auto_203689 ?auto_203691 ) ) ( not ( = ?auto_203689 ?auto_203692 ) ) ( not ( = ?auto_203689 ?auto_203693 ) ) ( not ( = ?auto_203690 ?auto_203691 ) ) ( not ( = ?auto_203690 ?auto_203692 ) ) ( not ( = ?auto_203690 ?auto_203693 ) ) ( not ( = ?auto_203691 ?auto_203692 ) ) ( not ( = ?auto_203691 ?auto_203693 ) ) ( not ( = ?auto_203692 ?auto_203693 ) ) ( ON ?auto_203691 ?auto_203692 ) ( CLEAR ?auto_203689 ) ( ON ?auto_203690 ?auto_203691 ) ( CLEAR ?auto_203690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203684 ?auto_203685 ?auto_203686 ?auto_203687 ?auto_203688 ?auto_203689 ?auto_203690 )
      ( MAKE-9PILE ?auto_203684 ?auto_203685 ?auto_203686 ?auto_203687 ?auto_203688 ?auto_203689 ?auto_203690 ?auto_203691 ?auto_203692 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203703 - BLOCK
      ?auto_203704 - BLOCK
      ?auto_203705 - BLOCK
      ?auto_203706 - BLOCK
      ?auto_203707 - BLOCK
      ?auto_203708 - BLOCK
      ?auto_203709 - BLOCK
      ?auto_203710 - BLOCK
      ?auto_203711 - BLOCK
    )
    :vars
    (
      ?auto_203712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203711 ?auto_203712 ) ( ON-TABLE ?auto_203703 ) ( ON ?auto_203704 ?auto_203703 ) ( ON ?auto_203705 ?auto_203704 ) ( ON ?auto_203706 ?auto_203705 ) ( ON ?auto_203707 ?auto_203706 ) ( ON ?auto_203708 ?auto_203707 ) ( not ( = ?auto_203703 ?auto_203704 ) ) ( not ( = ?auto_203703 ?auto_203705 ) ) ( not ( = ?auto_203703 ?auto_203706 ) ) ( not ( = ?auto_203703 ?auto_203707 ) ) ( not ( = ?auto_203703 ?auto_203708 ) ) ( not ( = ?auto_203703 ?auto_203709 ) ) ( not ( = ?auto_203703 ?auto_203710 ) ) ( not ( = ?auto_203703 ?auto_203711 ) ) ( not ( = ?auto_203703 ?auto_203712 ) ) ( not ( = ?auto_203704 ?auto_203705 ) ) ( not ( = ?auto_203704 ?auto_203706 ) ) ( not ( = ?auto_203704 ?auto_203707 ) ) ( not ( = ?auto_203704 ?auto_203708 ) ) ( not ( = ?auto_203704 ?auto_203709 ) ) ( not ( = ?auto_203704 ?auto_203710 ) ) ( not ( = ?auto_203704 ?auto_203711 ) ) ( not ( = ?auto_203704 ?auto_203712 ) ) ( not ( = ?auto_203705 ?auto_203706 ) ) ( not ( = ?auto_203705 ?auto_203707 ) ) ( not ( = ?auto_203705 ?auto_203708 ) ) ( not ( = ?auto_203705 ?auto_203709 ) ) ( not ( = ?auto_203705 ?auto_203710 ) ) ( not ( = ?auto_203705 ?auto_203711 ) ) ( not ( = ?auto_203705 ?auto_203712 ) ) ( not ( = ?auto_203706 ?auto_203707 ) ) ( not ( = ?auto_203706 ?auto_203708 ) ) ( not ( = ?auto_203706 ?auto_203709 ) ) ( not ( = ?auto_203706 ?auto_203710 ) ) ( not ( = ?auto_203706 ?auto_203711 ) ) ( not ( = ?auto_203706 ?auto_203712 ) ) ( not ( = ?auto_203707 ?auto_203708 ) ) ( not ( = ?auto_203707 ?auto_203709 ) ) ( not ( = ?auto_203707 ?auto_203710 ) ) ( not ( = ?auto_203707 ?auto_203711 ) ) ( not ( = ?auto_203707 ?auto_203712 ) ) ( not ( = ?auto_203708 ?auto_203709 ) ) ( not ( = ?auto_203708 ?auto_203710 ) ) ( not ( = ?auto_203708 ?auto_203711 ) ) ( not ( = ?auto_203708 ?auto_203712 ) ) ( not ( = ?auto_203709 ?auto_203710 ) ) ( not ( = ?auto_203709 ?auto_203711 ) ) ( not ( = ?auto_203709 ?auto_203712 ) ) ( not ( = ?auto_203710 ?auto_203711 ) ) ( not ( = ?auto_203710 ?auto_203712 ) ) ( not ( = ?auto_203711 ?auto_203712 ) ) ( ON ?auto_203710 ?auto_203711 ) ( CLEAR ?auto_203708 ) ( ON ?auto_203709 ?auto_203710 ) ( CLEAR ?auto_203709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203703 ?auto_203704 ?auto_203705 ?auto_203706 ?auto_203707 ?auto_203708 ?auto_203709 )
      ( MAKE-9PILE ?auto_203703 ?auto_203704 ?auto_203705 ?auto_203706 ?auto_203707 ?auto_203708 ?auto_203709 ?auto_203710 ?auto_203711 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203722 - BLOCK
      ?auto_203723 - BLOCK
      ?auto_203724 - BLOCK
      ?auto_203725 - BLOCK
      ?auto_203726 - BLOCK
      ?auto_203727 - BLOCK
      ?auto_203728 - BLOCK
      ?auto_203729 - BLOCK
      ?auto_203730 - BLOCK
    )
    :vars
    (
      ?auto_203731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203730 ?auto_203731 ) ( ON-TABLE ?auto_203722 ) ( ON ?auto_203723 ?auto_203722 ) ( ON ?auto_203724 ?auto_203723 ) ( ON ?auto_203725 ?auto_203724 ) ( ON ?auto_203726 ?auto_203725 ) ( not ( = ?auto_203722 ?auto_203723 ) ) ( not ( = ?auto_203722 ?auto_203724 ) ) ( not ( = ?auto_203722 ?auto_203725 ) ) ( not ( = ?auto_203722 ?auto_203726 ) ) ( not ( = ?auto_203722 ?auto_203727 ) ) ( not ( = ?auto_203722 ?auto_203728 ) ) ( not ( = ?auto_203722 ?auto_203729 ) ) ( not ( = ?auto_203722 ?auto_203730 ) ) ( not ( = ?auto_203722 ?auto_203731 ) ) ( not ( = ?auto_203723 ?auto_203724 ) ) ( not ( = ?auto_203723 ?auto_203725 ) ) ( not ( = ?auto_203723 ?auto_203726 ) ) ( not ( = ?auto_203723 ?auto_203727 ) ) ( not ( = ?auto_203723 ?auto_203728 ) ) ( not ( = ?auto_203723 ?auto_203729 ) ) ( not ( = ?auto_203723 ?auto_203730 ) ) ( not ( = ?auto_203723 ?auto_203731 ) ) ( not ( = ?auto_203724 ?auto_203725 ) ) ( not ( = ?auto_203724 ?auto_203726 ) ) ( not ( = ?auto_203724 ?auto_203727 ) ) ( not ( = ?auto_203724 ?auto_203728 ) ) ( not ( = ?auto_203724 ?auto_203729 ) ) ( not ( = ?auto_203724 ?auto_203730 ) ) ( not ( = ?auto_203724 ?auto_203731 ) ) ( not ( = ?auto_203725 ?auto_203726 ) ) ( not ( = ?auto_203725 ?auto_203727 ) ) ( not ( = ?auto_203725 ?auto_203728 ) ) ( not ( = ?auto_203725 ?auto_203729 ) ) ( not ( = ?auto_203725 ?auto_203730 ) ) ( not ( = ?auto_203725 ?auto_203731 ) ) ( not ( = ?auto_203726 ?auto_203727 ) ) ( not ( = ?auto_203726 ?auto_203728 ) ) ( not ( = ?auto_203726 ?auto_203729 ) ) ( not ( = ?auto_203726 ?auto_203730 ) ) ( not ( = ?auto_203726 ?auto_203731 ) ) ( not ( = ?auto_203727 ?auto_203728 ) ) ( not ( = ?auto_203727 ?auto_203729 ) ) ( not ( = ?auto_203727 ?auto_203730 ) ) ( not ( = ?auto_203727 ?auto_203731 ) ) ( not ( = ?auto_203728 ?auto_203729 ) ) ( not ( = ?auto_203728 ?auto_203730 ) ) ( not ( = ?auto_203728 ?auto_203731 ) ) ( not ( = ?auto_203729 ?auto_203730 ) ) ( not ( = ?auto_203729 ?auto_203731 ) ) ( not ( = ?auto_203730 ?auto_203731 ) ) ( ON ?auto_203729 ?auto_203730 ) ( ON ?auto_203728 ?auto_203729 ) ( CLEAR ?auto_203726 ) ( ON ?auto_203727 ?auto_203728 ) ( CLEAR ?auto_203727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203722 ?auto_203723 ?auto_203724 ?auto_203725 ?auto_203726 ?auto_203727 )
      ( MAKE-9PILE ?auto_203722 ?auto_203723 ?auto_203724 ?auto_203725 ?auto_203726 ?auto_203727 ?auto_203728 ?auto_203729 ?auto_203730 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203741 - BLOCK
      ?auto_203742 - BLOCK
      ?auto_203743 - BLOCK
      ?auto_203744 - BLOCK
      ?auto_203745 - BLOCK
      ?auto_203746 - BLOCK
      ?auto_203747 - BLOCK
      ?auto_203748 - BLOCK
      ?auto_203749 - BLOCK
    )
    :vars
    (
      ?auto_203750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203749 ?auto_203750 ) ( ON-TABLE ?auto_203741 ) ( ON ?auto_203742 ?auto_203741 ) ( ON ?auto_203743 ?auto_203742 ) ( ON ?auto_203744 ?auto_203743 ) ( ON ?auto_203745 ?auto_203744 ) ( not ( = ?auto_203741 ?auto_203742 ) ) ( not ( = ?auto_203741 ?auto_203743 ) ) ( not ( = ?auto_203741 ?auto_203744 ) ) ( not ( = ?auto_203741 ?auto_203745 ) ) ( not ( = ?auto_203741 ?auto_203746 ) ) ( not ( = ?auto_203741 ?auto_203747 ) ) ( not ( = ?auto_203741 ?auto_203748 ) ) ( not ( = ?auto_203741 ?auto_203749 ) ) ( not ( = ?auto_203741 ?auto_203750 ) ) ( not ( = ?auto_203742 ?auto_203743 ) ) ( not ( = ?auto_203742 ?auto_203744 ) ) ( not ( = ?auto_203742 ?auto_203745 ) ) ( not ( = ?auto_203742 ?auto_203746 ) ) ( not ( = ?auto_203742 ?auto_203747 ) ) ( not ( = ?auto_203742 ?auto_203748 ) ) ( not ( = ?auto_203742 ?auto_203749 ) ) ( not ( = ?auto_203742 ?auto_203750 ) ) ( not ( = ?auto_203743 ?auto_203744 ) ) ( not ( = ?auto_203743 ?auto_203745 ) ) ( not ( = ?auto_203743 ?auto_203746 ) ) ( not ( = ?auto_203743 ?auto_203747 ) ) ( not ( = ?auto_203743 ?auto_203748 ) ) ( not ( = ?auto_203743 ?auto_203749 ) ) ( not ( = ?auto_203743 ?auto_203750 ) ) ( not ( = ?auto_203744 ?auto_203745 ) ) ( not ( = ?auto_203744 ?auto_203746 ) ) ( not ( = ?auto_203744 ?auto_203747 ) ) ( not ( = ?auto_203744 ?auto_203748 ) ) ( not ( = ?auto_203744 ?auto_203749 ) ) ( not ( = ?auto_203744 ?auto_203750 ) ) ( not ( = ?auto_203745 ?auto_203746 ) ) ( not ( = ?auto_203745 ?auto_203747 ) ) ( not ( = ?auto_203745 ?auto_203748 ) ) ( not ( = ?auto_203745 ?auto_203749 ) ) ( not ( = ?auto_203745 ?auto_203750 ) ) ( not ( = ?auto_203746 ?auto_203747 ) ) ( not ( = ?auto_203746 ?auto_203748 ) ) ( not ( = ?auto_203746 ?auto_203749 ) ) ( not ( = ?auto_203746 ?auto_203750 ) ) ( not ( = ?auto_203747 ?auto_203748 ) ) ( not ( = ?auto_203747 ?auto_203749 ) ) ( not ( = ?auto_203747 ?auto_203750 ) ) ( not ( = ?auto_203748 ?auto_203749 ) ) ( not ( = ?auto_203748 ?auto_203750 ) ) ( not ( = ?auto_203749 ?auto_203750 ) ) ( ON ?auto_203748 ?auto_203749 ) ( ON ?auto_203747 ?auto_203748 ) ( CLEAR ?auto_203745 ) ( ON ?auto_203746 ?auto_203747 ) ( CLEAR ?auto_203746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203741 ?auto_203742 ?auto_203743 ?auto_203744 ?auto_203745 ?auto_203746 )
      ( MAKE-9PILE ?auto_203741 ?auto_203742 ?auto_203743 ?auto_203744 ?auto_203745 ?auto_203746 ?auto_203747 ?auto_203748 ?auto_203749 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203760 - BLOCK
      ?auto_203761 - BLOCK
      ?auto_203762 - BLOCK
      ?auto_203763 - BLOCK
      ?auto_203764 - BLOCK
      ?auto_203765 - BLOCK
      ?auto_203766 - BLOCK
      ?auto_203767 - BLOCK
      ?auto_203768 - BLOCK
    )
    :vars
    (
      ?auto_203769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203768 ?auto_203769 ) ( ON-TABLE ?auto_203760 ) ( ON ?auto_203761 ?auto_203760 ) ( ON ?auto_203762 ?auto_203761 ) ( ON ?auto_203763 ?auto_203762 ) ( not ( = ?auto_203760 ?auto_203761 ) ) ( not ( = ?auto_203760 ?auto_203762 ) ) ( not ( = ?auto_203760 ?auto_203763 ) ) ( not ( = ?auto_203760 ?auto_203764 ) ) ( not ( = ?auto_203760 ?auto_203765 ) ) ( not ( = ?auto_203760 ?auto_203766 ) ) ( not ( = ?auto_203760 ?auto_203767 ) ) ( not ( = ?auto_203760 ?auto_203768 ) ) ( not ( = ?auto_203760 ?auto_203769 ) ) ( not ( = ?auto_203761 ?auto_203762 ) ) ( not ( = ?auto_203761 ?auto_203763 ) ) ( not ( = ?auto_203761 ?auto_203764 ) ) ( not ( = ?auto_203761 ?auto_203765 ) ) ( not ( = ?auto_203761 ?auto_203766 ) ) ( not ( = ?auto_203761 ?auto_203767 ) ) ( not ( = ?auto_203761 ?auto_203768 ) ) ( not ( = ?auto_203761 ?auto_203769 ) ) ( not ( = ?auto_203762 ?auto_203763 ) ) ( not ( = ?auto_203762 ?auto_203764 ) ) ( not ( = ?auto_203762 ?auto_203765 ) ) ( not ( = ?auto_203762 ?auto_203766 ) ) ( not ( = ?auto_203762 ?auto_203767 ) ) ( not ( = ?auto_203762 ?auto_203768 ) ) ( not ( = ?auto_203762 ?auto_203769 ) ) ( not ( = ?auto_203763 ?auto_203764 ) ) ( not ( = ?auto_203763 ?auto_203765 ) ) ( not ( = ?auto_203763 ?auto_203766 ) ) ( not ( = ?auto_203763 ?auto_203767 ) ) ( not ( = ?auto_203763 ?auto_203768 ) ) ( not ( = ?auto_203763 ?auto_203769 ) ) ( not ( = ?auto_203764 ?auto_203765 ) ) ( not ( = ?auto_203764 ?auto_203766 ) ) ( not ( = ?auto_203764 ?auto_203767 ) ) ( not ( = ?auto_203764 ?auto_203768 ) ) ( not ( = ?auto_203764 ?auto_203769 ) ) ( not ( = ?auto_203765 ?auto_203766 ) ) ( not ( = ?auto_203765 ?auto_203767 ) ) ( not ( = ?auto_203765 ?auto_203768 ) ) ( not ( = ?auto_203765 ?auto_203769 ) ) ( not ( = ?auto_203766 ?auto_203767 ) ) ( not ( = ?auto_203766 ?auto_203768 ) ) ( not ( = ?auto_203766 ?auto_203769 ) ) ( not ( = ?auto_203767 ?auto_203768 ) ) ( not ( = ?auto_203767 ?auto_203769 ) ) ( not ( = ?auto_203768 ?auto_203769 ) ) ( ON ?auto_203767 ?auto_203768 ) ( ON ?auto_203766 ?auto_203767 ) ( ON ?auto_203765 ?auto_203766 ) ( CLEAR ?auto_203763 ) ( ON ?auto_203764 ?auto_203765 ) ( CLEAR ?auto_203764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203760 ?auto_203761 ?auto_203762 ?auto_203763 ?auto_203764 )
      ( MAKE-9PILE ?auto_203760 ?auto_203761 ?auto_203762 ?auto_203763 ?auto_203764 ?auto_203765 ?auto_203766 ?auto_203767 ?auto_203768 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203779 - BLOCK
      ?auto_203780 - BLOCK
      ?auto_203781 - BLOCK
      ?auto_203782 - BLOCK
      ?auto_203783 - BLOCK
      ?auto_203784 - BLOCK
      ?auto_203785 - BLOCK
      ?auto_203786 - BLOCK
      ?auto_203787 - BLOCK
    )
    :vars
    (
      ?auto_203788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203787 ?auto_203788 ) ( ON-TABLE ?auto_203779 ) ( ON ?auto_203780 ?auto_203779 ) ( ON ?auto_203781 ?auto_203780 ) ( ON ?auto_203782 ?auto_203781 ) ( not ( = ?auto_203779 ?auto_203780 ) ) ( not ( = ?auto_203779 ?auto_203781 ) ) ( not ( = ?auto_203779 ?auto_203782 ) ) ( not ( = ?auto_203779 ?auto_203783 ) ) ( not ( = ?auto_203779 ?auto_203784 ) ) ( not ( = ?auto_203779 ?auto_203785 ) ) ( not ( = ?auto_203779 ?auto_203786 ) ) ( not ( = ?auto_203779 ?auto_203787 ) ) ( not ( = ?auto_203779 ?auto_203788 ) ) ( not ( = ?auto_203780 ?auto_203781 ) ) ( not ( = ?auto_203780 ?auto_203782 ) ) ( not ( = ?auto_203780 ?auto_203783 ) ) ( not ( = ?auto_203780 ?auto_203784 ) ) ( not ( = ?auto_203780 ?auto_203785 ) ) ( not ( = ?auto_203780 ?auto_203786 ) ) ( not ( = ?auto_203780 ?auto_203787 ) ) ( not ( = ?auto_203780 ?auto_203788 ) ) ( not ( = ?auto_203781 ?auto_203782 ) ) ( not ( = ?auto_203781 ?auto_203783 ) ) ( not ( = ?auto_203781 ?auto_203784 ) ) ( not ( = ?auto_203781 ?auto_203785 ) ) ( not ( = ?auto_203781 ?auto_203786 ) ) ( not ( = ?auto_203781 ?auto_203787 ) ) ( not ( = ?auto_203781 ?auto_203788 ) ) ( not ( = ?auto_203782 ?auto_203783 ) ) ( not ( = ?auto_203782 ?auto_203784 ) ) ( not ( = ?auto_203782 ?auto_203785 ) ) ( not ( = ?auto_203782 ?auto_203786 ) ) ( not ( = ?auto_203782 ?auto_203787 ) ) ( not ( = ?auto_203782 ?auto_203788 ) ) ( not ( = ?auto_203783 ?auto_203784 ) ) ( not ( = ?auto_203783 ?auto_203785 ) ) ( not ( = ?auto_203783 ?auto_203786 ) ) ( not ( = ?auto_203783 ?auto_203787 ) ) ( not ( = ?auto_203783 ?auto_203788 ) ) ( not ( = ?auto_203784 ?auto_203785 ) ) ( not ( = ?auto_203784 ?auto_203786 ) ) ( not ( = ?auto_203784 ?auto_203787 ) ) ( not ( = ?auto_203784 ?auto_203788 ) ) ( not ( = ?auto_203785 ?auto_203786 ) ) ( not ( = ?auto_203785 ?auto_203787 ) ) ( not ( = ?auto_203785 ?auto_203788 ) ) ( not ( = ?auto_203786 ?auto_203787 ) ) ( not ( = ?auto_203786 ?auto_203788 ) ) ( not ( = ?auto_203787 ?auto_203788 ) ) ( ON ?auto_203786 ?auto_203787 ) ( ON ?auto_203785 ?auto_203786 ) ( ON ?auto_203784 ?auto_203785 ) ( CLEAR ?auto_203782 ) ( ON ?auto_203783 ?auto_203784 ) ( CLEAR ?auto_203783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203779 ?auto_203780 ?auto_203781 ?auto_203782 ?auto_203783 )
      ( MAKE-9PILE ?auto_203779 ?auto_203780 ?auto_203781 ?auto_203782 ?auto_203783 ?auto_203784 ?auto_203785 ?auto_203786 ?auto_203787 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203798 - BLOCK
      ?auto_203799 - BLOCK
      ?auto_203800 - BLOCK
      ?auto_203801 - BLOCK
      ?auto_203802 - BLOCK
      ?auto_203803 - BLOCK
      ?auto_203804 - BLOCK
      ?auto_203805 - BLOCK
      ?auto_203806 - BLOCK
    )
    :vars
    (
      ?auto_203807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203806 ?auto_203807 ) ( ON-TABLE ?auto_203798 ) ( ON ?auto_203799 ?auto_203798 ) ( ON ?auto_203800 ?auto_203799 ) ( not ( = ?auto_203798 ?auto_203799 ) ) ( not ( = ?auto_203798 ?auto_203800 ) ) ( not ( = ?auto_203798 ?auto_203801 ) ) ( not ( = ?auto_203798 ?auto_203802 ) ) ( not ( = ?auto_203798 ?auto_203803 ) ) ( not ( = ?auto_203798 ?auto_203804 ) ) ( not ( = ?auto_203798 ?auto_203805 ) ) ( not ( = ?auto_203798 ?auto_203806 ) ) ( not ( = ?auto_203798 ?auto_203807 ) ) ( not ( = ?auto_203799 ?auto_203800 ) ) ( not ( = ?auto_203799 ?auto_203801 ) ) ( not ( = ?auto_203799 ?auto_203802 ) ) ( not ( = ?auto_203799 ?auto_203803 ) ) ( not ( = ?auto_203799 ?auto_203804 ) ) ( not ( = ?auto_203799 ?auto_203805 ) ) ( not ( = ?auto_203799 ?auto_203806 ) ) ( not ( = ?auto_203799 ?auto_203807 ) ) ( not ( = ?auto_203800 ?auto_203801 ) ) ( not ( = ?auto_203800 ?auto_203802 ) ) ( not ( = ?auto_203800 ?auto_203803 ) ) ( not ( = ?auto_203800 ?auto_203804 ) ) ( not ( = ?auto_203800 ?auto_203805 ) ) ( not ( = ?auto_203800 ?auto_203806 ) ) ( not ( = ?auto_203800 ?auto_203807 ) ) ( not ( = ?auto_203801 ?auto_203802 ) ) ( not ( = ?auto_203801 ?auto_203803 ) ) ( not ( = ?auto_203801 ?auto_203804 ) ) ( not ( = ?auto_203801 ?auto_203805 ) ) ( not ( = ?auto_203801 ?auto_203806 ) ) ( not ( = ?auto_203801 ?auto_203807 ) ) ( not ( = ?auto_203802 ?auto_203803 ) ) ( not ( = ?auto_203802 ?auto_203804 ) ) ( not ( = ?auto_203802 ?auto_203805 ) ) ( not ( = ?auto_203802 ?auto_203806 ) ) ( not ( = ?auto_203802 ?auto_203807 ) ) ( not ( = ?auto_203803 ?auto_203804 ) ) ( not ( = ?auto_203803 ?auto_203805 ) ) ( not ( = ?auto_203803 ?auto_203806 ) ) ( not ( = ?auto_203803 ?auto_203807 ) ) ( not ( = ?auto_203804 ?auto_203805 ) ) ( not ( = ?auto_203804 ?auto_203806 ) ) ( not ( = ?auto_203804 ?auto_203807 ) ) ( not ( = ?auto_203805 ?auto_203806 ) ) ( not ( = ?auto_203805 ?auto_203807 ) ) ( not ( = ?auto_203806 ?auto_203807 ) ) ( ON ?auto_203805 ?auto_203806 ) ( ON ?auto_203804 ?auto_203805 ) ( ON ?auto_203803 ?auto_203804 ) ( ON ?auto_203802 ?auto_203803 ) ( CLEAR ?auto_203800 ) ( ON ?auto_203801 ?auto_203802 ) ( CLEAR ?auto_203801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203798 ?auto_203799 ?auto_203800 ?auto_203801 )
      ( MAKE-9PILE ?auto_203798 ?auto_203799 ?auto_203800 ?auto_203801 ?auto_203802 ?auto_203803 ?auto_203804 ?auto_203805 ?auto_203806 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203817 - BLOCK
      ?auto_203818 - BLOCK
      ?auto_203819 - BLOCK
      ?auto_203820 - BLOCK
      ?auto_203821 - BLOCK
      ?auto_203822 - BLOCK
      ?auto_203823 - BLOCK
      ?auto_203824 - BLOCK
      ?auto_203825 - BLOCK
    )
    :vars
    (
      ?auto_203826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203825 ?auto_203826 ) ( ON-TABLE ?auto_203817 ) ( ON ?auto_203818 ?auto_203817 ) ( ON ?auto_203819 ?auto_203818 ) ( not ( = ?auto_203817 ?auto_203818 ) ) ( not ( = ?auto_203817 ?auto_203819 ) ) ( not ( = ?auto_203817 ?auto_203820 ) ) ( not ( = ?auto_203817 ?auto_203821 ) ) ( not ( = ?auto_203817 ?auto_203822 ) ) ( not ( = ?auto_203817 ?auto_203823 ) ) ( not ( = ?auto_203817 ?auto_203824 ) ) ( not ( = ?auto_203817 ?auto_203825 ) ) ( not ( = ?auto_203817 ?auto_203826 ) ) ( not ( = ?auto_203818 ?auto_203819 ) ) ( not ( = ?auto_203818 ?auto_203820 ) ) ( not ( = ?auto_203818 ?auto_203821 ) ) ( not ( = ?auto_203818 ?auto_203822 ) ) ( not ( = ?auto_203818 ?auto_203823 ) ) ( not ( = ?auto_203818 ?auto_203824 ) ) ( not ( = ?auto_203818 ?auto_203825 ) ) ( not ( = ?auto_203818 ?auto_203826 ) ) ( not ( = ?auto_203819 ?auto_203820 ) ) ( not ( = ?auto_203819 ?auto_203821 ) ) ( not ( = ?auto_203819 ?auto_203822 ) ) ( not ( = ?auto_203819 ?auto_203823 ) ) ( not ( = ?auto_203819 ?auto_203824 ) ) ( not ( = ?auto_203819 ?auto_203825 ) ) ( not ( = ?auto_203819 ?auto_203826 ) ) ( not ( = ?auto_203820 ?auto_203821 ) ) ( not ( = ?auto_203820 ?auto_203822 ) ) ( not ( = ?auto_203820 ?auto_203823 ) ) ( not ( = ?auto_203820 ?auto_203824 ) ) ( not ( = ?auto_203820 ?auto_203825 ) ) ( not ( = ?auto_203820 ?auto_203826 ) ) ( not ( = ?auto_203821 ?auto_203822 ) ) ( not ( = ?auto_203821 ?auto_203823 ) ) ( not ( = ?auto_203821 ?auto_203824 ) ) ( not ( = ?auto_203821 ?auto_203825 ) ) ( not ( = ?auto_203821 ?auto_203826 ) ) ( not ( = ?auto_203822 ?auto_203823 ) ) ( not ( = ?auto_203822 ?auto_203824 ) ) ( not ( = ?auto_203822 ?auto_203825 ) ) ( not ( = ?auto_203822 ?auto_203826 ) ) ( not ( = ?auto_203823 ?auto_203824 ) ) ( not ( = ?auto_203823 ?auto_203825 ) ) ( not ( = ?auto_203823 ?auto_203826 ) ) ( not ( = ?auto_203824 ?auto_203825 ) ) ( not ( = ?auto_203824 ?auto_203826 ) ) ( not ( = ?auto_203825 ?auto_203826 ) ) ( ON ?auto_203824 ?auto_203825 ) ( ON ?auto_203823 ?auto_203824 ) ( ON ?auto_203822 ?auto_203823 ) ( ON ?auto_203821 ?auto_203822 ) ( CLEAR ?auto_203819 ) ( ON ?auto_203820 ?auto_203821 ) ( CLEAR ?auto_203820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203817 ?auto_203818 ?auto_203819 ?auto_203820 )
      ( MAKE-9PILE ?auto_203817 ?auto_203818 ?auto_203819 ?auto_203820 ?auto_203821 ?auto_203822 ?auto_203823 ?auto_203824 ?auto_203825 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203836 - BLOCK
      ?auto_203837 - BLOCK
      ?auto_203838 - BLOCK
      ?auto_203839 - BLOCK
      ?auto_203840 - BLOCK
      ?auto_203841 - BLOCK
      ?auto_203842 - BLOCK
      ?auto_203843 - BLOCK
      ?auto_203844 - BLOCK
    )
    :vars
    (
      ?auto_203845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203844 ?auto_203845 ) ( ON-TABLE ?auto_203836 ) ( ON ?auto_203837 ?auto_203836 ) ( not ( = ?auto_203836 ?auto_203837 ) ) ( not ( = ?auto_203836 ?auto_203838 ) ) ( not ( = ?auto_203836 ?auto_203839 ) ) ( not ( = ?auto_203836 ?auto_203840 ) ) ( not ( = ?auto_203836 ?auto_203841 ) ) ( not ( = ?auto_203836 ?auto_203842 ) ) ( not ( = ?auto_203836 ?auto_203843 ) ) ( not ( = ?auto_203836 ?auto_203844 ) ) ( not ( = ?auto_203836 ?auto_203845 ) ) ( not ( = ?auto_203837 ?auto_203838 ) ) ( not ( = ?auto_203837 ?auto_203839 ) ) ( not ( = ?auto_203837 ?auto_203840 ) ) ( not ( = ?auto_203837 ?auto_203841 ) ) ( not ( = ?auto_203837 ?auto_203842 ) ) ( not ( = ?auto_203837 ?auto_203843 ) ) ( not ( = ?auto_203837 ?auto_203844 ) ) ( not ( = ?auto_203837 ?auto_203845 ) ) ( not ( = ?auto_203838 ?auto_203839 ) ) ( not ( = ?auto_203838 ?auto_203840 ) ) ( not ( = ?auto_203838 ?auto_203841 ) ) ( not ( = ?auto_203838 ?auto_203842 ) ) ( not ( = ?auto_203838 ?auto_203843 ) ) ( not ( = ?auto_203838 ?auto_203844 ) ) ( not ( = ?auto_203838 ?auto_203845 ) ) ( not ( = ?auto_203839 ?auto_203840 ) ) ( not ( = ?auto_203839 ?auto_203841 ) ) ( not ( = ?auto_203839 ?auto_203842 ) ) ( not ( = ?auto_203839 ?auto_203843 ) ) ( not ( = ?auto_203839 ?auto_203844 ) ) ( not ( = ?auto_203839 ?auto_203845 ) ) ( not ( = ?auto_203840 ?auto_203841 ) ) ( not ( = ?auto_203840 ?auto_203842 ) ) ( not ( = ?auto_203840 ?auto_203843 ) ) ( not ( = ?auto_203840 ?auto_203844 ) ) ( not ( = ?auto_203840 ?auto_203845 ) ) ( not ( = ?auto_203841 ?auto_203842 ) ) ( not ( = ?auto_203841 ?auto_203843 ) ) ( not ( = ?auto_203841 ?auto_203844 ) ) ( not ( = ?auto_203841 ?auto_203845 ) ) ( not ( = ?auto_203842 ?auto_203843 ) ) ( not ( = ?auto_203842 ?auto_203844 ) ) ( not ( = ?auto_203842 ?auto_203845 ) ) ( not ( = ?auto_203843 ?auto_203844 ) ) ( not ( = ?auto_203843 ?auto_203845 ) ) ( not ( = ?auto_203844 ?auto_203845 ) ) ( ON ?auto_203843 ?auto_203844 ) ( ON ?auto_203842 ?auto_203843 ) ( ON ?auto_203841 ?auto_203842 ) ( ON ?auto_203840 ?auto_203841 ) ( ON ?auto_203839 ?auto_203840 ) ( CLEAR ?auto_203837 ) ( ON ?auto_203838 ?auto_203839 ) ( CLEAR ?auto_203838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203836 ?auto_203837 ?auto_203838 )
      ( MAKE-9PILE ?auto_203836 ?auto_203837 ?auto_203838 ?auto_203839 ?auto_203840 ?auto_203841 ?auto_203842 ?auto_203843 ?auto_203844 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203855 - BLOCK
      ?auto_203856 - BLOCK
      ?auto_203857 - BLOCK
      ?auto_203858 - BLOCK
      ?auto_203859 - BLOCK
      ?auto_203860 - BLOCK
      ?auto_203861 - BLOCK
      ?auto_203862 - BLOCK
      ?auto_203863 - BLOCK
    )
    :vars
    (
      ?auto_203864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203863 ?auto_203864 ) ( ON-TABLE ?auto_203855 ) ( ON ?auto_203856 ?auto_203855 ) ( not ( = ?auto_203855 ?auto_203856 ) ) ( not ( = ?auto_203855 ?auto_203857 ) ) ( not ( = ?auto_203855 ?auto_203858 ) ) ( not ( = ?auto_203855 ?auto_203859 ) ) ( not ( = ?auto_203855 ?auto_203860 ) ) ( not ( = ?auto_203855 ?auto_203861 ) ) ( not ( = ?auto_203855 ?auto_203862 ) ) ( not ( = ?auto_203855 ?auto_203863 ) ) ( not ( = ?auto_203855 ?auto_203864 ) ) ( not ( = ?auto_203856 ?auto_203857 ) ) ( not ( = ?auto_203856 ?auto_203858 ) ) ( not ( = ?auto_203856 ?auto_203859 ) ) ( not ( = ?auto_203856 ?auto_203860 ) ) ( not ( = ?auto_203856 ?auto_203861 ) ) ( not ( = ?auto_203856 ?auto_203862 ) ) ( not ( = ?auto_203856 ?auto_203863 ) ) ( not ( = ?auto_203856 ?auto_203864 ) ) ( not ( = ?auto_203857 ?auto_203858 ) ) ( not ( = ?auto_203857 ?auto_203859 ) ) ( not ( = ?auto_203857 ?auto_203860 ) ) ( not ( = ?auto_203857 ?auto_203861 ) ) ( not ( = ?auto_203857 ?auto_203862 ) ) ( not ( = ?auto_203857 ?auto_203863 ) ) ( not ( = ?auto_203857 ?auto_203864 ) ) ( not ( = ?auto_203858 ?auto_203859 ) ) ( not ( = ?auto_203858 ?auto_203860 ) ) ( not ( = ?auto_203858 ?auto_203861 ) ) ( not ( = ?auto_203858 ?auto_203862 ) ) ( not ( = ?auto_203858 ?auto_203863 ) ) ( not ( = ?auto_203858 ?auto_203864 ) ) ( not ( = ?auto_203859 ?auto_203860 ) ) ( not ( = ?auto_203859 ?auto_203861 ) ) ( not ( = ?auto_203859 ?auto_203862 ) ) ( not ( = ?auto_203859 ?auto_203863 ) ) ( not ( = ?auto_203859 ?auto_203864 ) ) ( not ( = ?auto_203860 ?auto_203861 ) ) ( not ( = ?auto_203860 ?auto_203862 ) ) ( not ( = ?auto_203860 ?auto_203863 ) ) ( not ( = ?auto_203860 ?auto_203864 ) ) ( not ( = ?auto_203861 ?auto_203862 ) ) ( not ( = ?auto_203861 ?auto_203863 ) ) ( not ( = ?auto_203861 ?auto_203864 ) ) ( not ( = ?auto_203862 ?auto_203863 ) ) ( not ( = ?auto_203862 ?auto_203864 ) ) ( not ( = ?auto_203863 ?auto_203864 ) ) ( ON ?auto_203862 ?auto_203863 ) ( ON ?auto_203861 ?auto_203862 ) ( ON ?auto_203860 ?auto_203861 ) ( ON ?auto_203859 ?auto_203860 ) ( ON ?auto_203858 ?auto_203859 ) ( CLEAR ?auto_203856 ) ( ON ?auto_203857 ?auto_203858 ) ( CLEAR ?auto_203857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203855 ?auto_203856 ?auto_203857 )
      ( MAKE-9PILE ?auto_203855 ?auto_203856 ?auto_203857 ?auto_203858 ?auto_203859 ?auto_203860 ?auto_203861 ?auto_203862 ?auto_203863 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203874 - BLOCK
      ?auto_203875 - BLOCK
      ?auto_203876 - BLOCK
      ?auto_203877 - BLOCK
      ?auto_203878 - BLOCK
      ?auto_203879 - BLOCK
      ?auto_203880 - BLOCK
      ?auto_203881 - BLOCK
      ?auto_203882 - BLOCK
    )
    :vars
    (
      ?auto_203883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203882 ?auto_203883 ) ( ON-TABLE ?auto_203874 ) ( not ( = ?auto_203874 ?auto_203875 ) ) ( not ( = ?auto_203874 ?auto_203876 ) ) ( not ( = ?auto_203874 ?auto_203877 ) ) ( not ( = ?auto_203874 ?auto_203878 ) ) ( not ( = ?auto_203874 ?auto_203879 ) ) ( not ( = ?auto_203874 ?auto_203880 ) ) ( not ( = ?auto_203874 ?auto_203881 ) ) ( not ( = ?auto_203874 ?auto_203882 ) ) ( not ( = ?auto_203874 ?auto_203883 ) ) ( not ( = ?auto_203875 ?auto_203876 ) ) ( not ( = ?auto_203875 ?auto_203877 ) ) ( not ( = ?auto_203875 ?auto_203878 ) ) ( not ( = ?auto_203875 ?auto_203879 ) ) ( not ( = ?auto_203875 ?auto_203880 ) ) ( not ( = ?auto_203875 ?auto_203881 ) ) ( not ( = ?auto_203875 ?auto_203882 ) ) ( not ( = ?auto_203875 ?auto_203883 ) ) ( not ( = ?auto_203876 ?auto_203877 ) ) ( not ( = ?auto_203876 ?auto_203878 ) ) ( not ( = ?auto_203876 ?auto_203879 ) ) ( not ( = ?auto_203876 ?auto_203880 ) ) ( not ( = ?auto_203876 ?auto_203881 ) ) ( not ( = ?auto_203876 ?auto_203882 ) ) ( not ( = ?auto_203876 ?auto_203883 ) ) ( not ( = ?auto_203877 ?auto_203878 ) ) ( not ( = ?auto_203877 ?auto_203879 ) ) ( not ( = ?auto_203877 ?auto_203880 ) ) ( not ( = ?auto_203877 ?auto_203881 ) ) ( not ( = ?auto_203877 ?auto_203882 ) ) ( not ( = ?auto_203877 ?auto_203883 ) ) ( not ( = ?auto_203878 ?auto_203879 ) ) ( not ( = ?auto_203878 ?auto_203880 ) ) ( not ( = ?auto_203878 ?auto_203881 ) ) ( not ( = ?auto_203878 ?auto_203882 ) ) ( not ( = ?auto_203878 ?auto_203883 ) ) ( not ( = ?auto_203879 ?auto_203880 ) ) ( not ( = ?auto_203879 ?auto_203881 ) ) ( not ( = ?auto_203879 ?auto_203882 ) ) ( not ( = ?auto_203879 ?auto_203883 ) ) ( not ( = ?auto_203880 ?auto_203881 ) ) ( not ( = ?auto_203880 ?auto_203882 ) ) ( not ( = ?auto_203880 ?auto_203883 ) ) ( not ( = ?auto_203881 ?auto_203882 ) ) ( not ( = ?auto_203881 ?auto_203883 ) ) ( not ( = ?auto_203882 ?auto_203883 ) ) ( ON ?auto_203881 ?auto_203882 ) ( ON ?auto_203880 ?auto_203881 ) ( ON ?auto_203879 ?auto_203880 ) ( ON ?auto_203878 ?auto_203879 ) ( ON ?auto_203877 ?auto_203878 ) ( ON ?auto_203876 ?auto_203877 ) ( CLEAR ?auto_203874 ) ( ON ?auto_203875 ?auto_203876 ) ( CLEAR ?auto_203875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203874 ?auto_203875 )
      ( MAKE-9PILE ?auto_203874 ?auto_203875 ?auto_203876 ?auto_203877 ?auto_203878 ?auto_203879 ?auto_203880 ?auto_203881 ?auto_203882 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203893 - BLOCK
      ?auto_203894 - BLOCK
      ?auto_203895 - BLOCK
      ?auto_203896 - BLOCK
      ?auto_203897 - BLOCK
      ?auto_203898 - BLOCK
      ?auto_203899 - BLOCK
      ?auto_203900 - BLOCK
      ?auto_203901 - BLOCK
    )
    :vars
    (
      ?auto_203902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203901 ?auto_203902 ) ( ON-TABLE ?auto_203893 ) ( not ( = ?auto_203893 ?auto_203894 ) ) ( not ( = ?auto_203893 ?auto_203895 ) ) ( not ( = ?auto_203893 ?auto_203896 ) ) ( not ( = ?auto_203893 ?auto_203897 ) ) ( not ( = ?auto_203893 ?auto_203898 ) ) ( not ( = ?auto_203893 ?auto_203899 ) ) ( not ( = ?auto_203893 ?auto_203900 ) ) ( not ( = ?auto_203893 ?auto_203901 ) ) ( not ( = ?auto_203893 ?auto_203902 ) ) ( not ( = ?auto_203894 ?auto_203895 ) ) ( not ( = ?auto_203894 ?auto_203896 ) ) ( not ( = ?auto_203894 ?auto_203897 ) ) ( not ( = ?auto_203894 ?auto_203898 ) ) ( not ( = ?auto_203894 ?auto_203899 ) ) ( not ( = ?auto_203894 ?auto_203900 ) ) ( not ( = ?auto_203894 ?auto_203901 ) ) ( not ( = ?auto_203894 ?auto_203902 ) ) ( not ( = ?auto_203895 ?auto_203896 ) ) ( not ( = ?auto_203895 ?auto_203897 ) ) ( not ( = ?auto_203895 ?auto_203898 ) ) ( not ( = ?auto_203895 ?auto_203899 ) ) ( not ( = ?auto_203895 ?auto_203900 ) ) ( not ( = ?auto_203895 ?auto_203901 ) ) ( not ( = ?auto_203895 ?auto_203902 ) ) ( not ( = ?auto_203896 ?auto_203897 ) ) ( not ( = ?auto_203896 ?auto_203898 ) ) ( not ( = ?auto_203896 ?auto_203899 ) ) ( not ( = ?auto_203896 ?auto_203900 ) ) ( not ( = ?auto_203896 ?auto_203901 ) ) ( not ( = ?auto_203896 ?auto_203902 ) ) ( not ( = ?auto_203897 ?auto_203898 ) ) ( not ( = ?auto_203897 ?auto_203899 ) ) ( not ( = ?auto_203897 ?auto_203900 ) ) ( not ( = ?auto_203897 ?auto_203901 ) ) ( not ( = ?auto_203897 ?auto_203902 ) ) ( not ( = ?auto_203898 ?auto_203899 ) ) ( not ( = ?auto_203898 ?auto_203900 ) ) ( not ( = ?auto_203898 ?auto_203901 ) ) ( not ( = ?auto_203898 ?auto_203902 ) ) ( not ( = ?auto_203899 ?auto_203900 ) ) ( not ( = ?auto_203899 ?auto_203901 ) ) ( not ( = ?auto_203899 ?auto_203902 ) ) ( not ( = ?auto_203900 ?auto_203901 ) ) ( not ( = ?auto_203900 ?auto_203902 ) ) ( not ( = ?auto_203901 ?auto_203902 ) ) ( ON ?auto_203900 ?auto_203901 ) ( ON ?auto_203899 ?auto_203900 ) ( ON ?auto_203898 ?auto_203899 ) ( ON ?auto_203897 ?auto_203898 ) ( ON ?auto_203896 ?auto_203897 ) ( ON ?auto_203895 ?auto_203896 ) ( CLEAR ?auto_203893 ) ( ON ?auto_203894 ?auto_203895 ) ( CLEAR ?auto_203894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203893 ?auto_203894 )
      ( MAKE-9PILE ?auto_203893 ?auto_203894 ?auto_203895 ?auto_203896 ?auto_203897 ?auto_203898 ?auto_203899 ?auto_203900 ?auto_203901 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203912 - BLOCK
      ?auto_203913 - BLOCK
      ?auto_203914 - BLOCK
      ?auto_203915 - BLOCK
      ?auto_203916 - BLOCK
      ?auto_203917 - BLOCK
      ?auto_203918 - BLOCK
      ?auto_203919 - BLOCK
      ?auto_203920 - BLOCK
    )
    :vars
    (
      ?auto_203921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203920 ?auto_203921 ) ( not ( = ?auto_203912 ?auto_203913 ) ) ( not ( = ?auto_203912 ?auto_203914 ) ) ( not ( = ?auto_203912 ?auto_203915 ) ) ( not ( = ?auto_203912 ?auto_203916 ) ) ( not ( = ?auto_203912 ?auto_203917 ) ) ( not ( = ?auto_203912 ?auto_203918 ) ) ( not ( = ?auto_203912 ?auto_203919 ) ) ( not ( = ?auto_203912 ?auto_203920 ) ) ( not ( = ?auto_203912 ?auto_203921 ) ) ( not ( = ?auto_203913 ?auto_203914 ) ) ( not ( = ?auto_203913 ?auto_203915 ) ) ( not ( = ?auto_203913 ?auto_203916 ) ) ( not ( = ?auto_203913 ?auto_203917 ) ) ( not ( = ?auto_203913 ?auto_203918 ) ) ( not ( = ?auto_203913 ?auto_203919 ) ) ( not ( = ?auto_203913 ?auto_203920 ) ) ( not ( = ?auto_203913 ?auto_203921 ) ) ( not ( = ?auto_203914 ?auto_203915 ) ) ( not ( = ?auto_203914 ?auto_203916 ) ) ( not ( = ?auto_203914 ?auto_203917 ) ) ( not ( = ?auto_203914 ?auto_203918 ) ) ( not ( = ?auto_203914 ?auto_203919 ) ) ( not ( = ?auto_203914 ?auto_203920 ) ) ( not ( = ?auto_203914 ?auto_203921 ) ) ( not ( = ?auto_203915 ?auto_203916 ) ) ( not ( = ?auto_203915 ?auto_203917 ) ) ( not ( = ?auto_203915 ?auto_203918 ) ) ( not ( = ?auto_203915 ?auto_203919 ) ) ( not ( = ?auto_203915 ?auto_203920 ) ) ( not ( = ?auto_203915 ?auto_203921 ) ) ( not ( = ?auto_203916 ?auto_203917 ) ) ( not ( = ?auto_203916 ?auto_203918 ) ) ( not ( = ?auto_203916 ?auto_203919 ) ) ( not ( = ?auto_203916 ?auto_203920 ) ) ( not ( = ?auto_203916 ?auto_203921 ) ) ( not ( = ?auto_203917 ?auto_203918 ) ) ( not ( = ?auto_203917 ?auto_203919 ) ) ( not ( = ?auto_203917 ?auto_203920 ) ) ( not ( = ?auto_203917 ?auto_203921 ) ) ( not ( = ?auto_203918 ?auto_203919 ) ) ( not ( = ?auto_203918 ?auto_203920 ) ) ( not ( = ?auto_203918 ?auto_203921 ) ) ( not ( = ?auto_203919 ?auto_203920 ) ) ( not ( = ?auto_203919 ?auto_203921 ) ) ( not ( = ?auto_203920 ?auto_203921 ) ) ( ON ?auto_203919 ?auto_203920 ) ( ON ?auto_203918 ?auto_203919 ) ( ON ?auto_203917 ?auto_203918 ) ( ON ?auto_203916 ?auto_203917 ) ( ON ?auto_203915 ?auto_203916 ) ( ON ?auto_203914 ?auto_203915 ) ( ON ?auto_203913 ?auto_203914 ) ( ON ?auto_203912 ?auto_203913 ) ( CLEAR ?auto_203912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203912 )
      ( MAKE-9PILE ?auto_203912 ?auto_203913 ?auto_203914 ?auto_203915 ?auto_203916 ?auto_203917 ?auto_203918 ?auto_203919 ?auto_203920 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_203931 - BLOCK
      ?auto_203932 - BLOCK
      ?auto_203933 - BLOCK
      ?auto_203934 - BLOCK
      ?auto_203935 - BLOCK
      ?auto_203936 - BLOCK
      ?auto_203937 - BLOCK
      ?auto_203938 - BLOCK
      ?auto_203939 - BLOCK
    )
    :vars
    (
      ?auto_203940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203939 ?auto_203940 ) ( not ( = ?auto_203931 ?auto_203932 ) ) ( not ( = ?auto_203931 ?auto_203933 ) ) ( not ( = ?auto_203931 ?auto_203934 ) ) ( not ( = ?auto_203931 ?auto_203935 ) ) ( not ( = ?auto_203931 ?auto_203936 ) ) ( not ( = ?auto_203931 ?auto_203937 ) ) ( not ( = ?auto_203931 ?auto_203938 ) ) ( not ( = ?auto_203931 ?auto_203939 ) ) ( not ( = ?auto_203931 ?auto_203940 ) ) ( not ( = ?auto_203932 ?auto_203933 ) ) ( not ( = ?auto_203932 ?auto_203934 ) ) ( not ( = ?auto_203932 ?auto_203935 ) ) ( not ( = ?auto_203932 ?auto_203936 ) ) ( not ( = ?auto_203932 ?auto_203937 ) ) ( not ( = ?auto_203932 ?auto_203938 ) ) ( not ( = ?auto_203932 ?auto_203939 ) ) ( not ( = ?auto_203932 ?auto_203940 ) ) ( not ( = ?auto_203933 ?auto_203934 ) ) ( not ( = ?auto_203933 ?auto_203935 ) ) ( not ( = ?auto_203933 ?auto_203936 ) ) ( not ( = ?auto_203933 ?auto_203937 ) ) ( not ( = ?auto_203933 ?auto_203938 ) ) ( not ( = ?auto_203933 ?auto_203939 ) ) ( not ( = ?auto_203933 ?auto_203940 ) ) ( not ( = ?auto_203934 ?auto_203935 ) ) ( not ( = ?auto_203934 ?auto_203936 ) ) ( not ( = ?auto_203934 ?auto_203937 ) ) ( not ( = ?auto_203934 ?auto_203938 ) ) ( not ( = ?auto_203934 ?auto_203939 ) ) ( not ( = ?auto_203934 ?auto_203940 ) ) ( not ( = ?auto_203935 ?auto_203936 ) ) ( not ( = ?auto_203935 ?auto_203937 ) ) ( not ( = ?auto_203935 ?auto_203938 ) ) ( not ( = ?auto_203935 ?auto_203939 ) ) ( not ( = ?auto_203935 ?auto_203940 ) ) ( not ( = ?auto_203936 ?auto_203937 ) ) ( not ( = ?auto_203936 ?auto_203938 ) ) ( not ( = ?auto_203936 ?auto_203939 ) ) ( not ( = ?auto_203936 ?auto_203940 ) ) ( not ( = ?auto_203937 ?auto_203938 ) ) ( not ( = ?auto_203937 ?auto_203939 ) ) ( not ( = ?auto_203937 ?auto_203940 ) ) ( not ( = ?auto_203938 ?auto_203939 ) ) ( not ( = ?auto_203938 ?auto_203940 ) ) ( not ( = ?auto_203939 ?auto_203940 ) ) ( ON ?auto_203938 ?auto_203939 ) ( ON ?auto_203937 ?auto_203938 ) ( ON ?auto_203936 ?auto_203937 ) ( ON ?auto_203935 ?auto_203936 ) ( ON ?auto_203934 ?auto_203935 ) ( ON ?auto_203933 ?auto_203934 ) ( ON ?auto_203932 ?auto_203933 ) ( ON ?auto_203931 ?auto_203932 ) ( CLEAR ?auto_203931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203931 )
      ( MAKE-9PILE ?auto_203931 ?auto_203932 ?auto_203933 ?auto_203934 ?auto_203935 ?auto_203936 ?auto_203937 ?auto_203938 ?auto_203939 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_203951 - BLOCK
      ?auto_203952 - BLOCK
      ?auto_203953 - BLOCK
      ?auto_203954 - BLOCK
      ?auto_203955 - BLOCK
      ?auto_203956 - BLOCK
      ?auto_203957 - BLOCK
      ?auto_203958 - BLOCK
      ?auto_203959 - BLOCK
      ?auto_203960 - BLOCK
    )
    :vars
    (
      ?auto_203961 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_203959 ) ( ON ?auto_203960 ?auto_203961 ) ( CLEAR ?auto_203960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203951 ) ( ON ?auto_203952 ?auto_203951 ) ( ON ?auto_203953 ?auto_203952 ) ( ON ?auto_203954 ?auto_203953 ) ( ON ?auto_203955 ?auto_203954 ) ( ON ?auto_203956 ?auto_203955 ) ( ON ?auto_203957 ?auto_203956 ) ( ON ?auto_203958 ?auto_203957 ) ( ON ?auto_203959 ?auto_203958 ) ( not ( = ?auto_203951 ?auto_203952 ) ) ( not ( = ?auto_203951 ?auto_203953 ) ) ( not ( = ?auto_203951 ?auto_203954 ) ) ( not ( = ?auto_203951 ?auto_203955 ) ) ( not ( = ?auto_203951 ?auto_203956 ) ) ( not ( = ?auto_203951 ?auto_203957 ) ) ( not ( = ?auto_203951 ?auto_203958 ) ) ( not ( = ?auto_203951 ?auto_203959 ) ) ( not ( = ?auto_203951 ?auto_203960 ) ) ( not ( = ?auto_203951 ?auto_203961 ) ) ( not ( = ?auto_203952 ?auto_203953 ) ) ( not ( = ?auto_203952 ?auto_203954 ) ) ( not ( = ?auto_203952 ?auto_203955 ) ) ( not ( = ?auto_203952 ?auto_203956 ) ) ( not ( = ?auto_203952 ?auto_203957 ) ) ( not ( = ?auto_203952 ?auto_203958 ) ) ( not ( = ?auto_203952 ?auto_203959 ) ) ( not ( = ?auto_203952 ?auto_203960 ) ) ( not ( = ?auto_203952 ?auto_203961 ) ) ( not ( = ?auto_203953 ?auto_203954 ) ) ( not ( = ?auto_203953 ?auto_203955 ) ) ( not ( = ?auto_203953 ?auto_203956 ) ) ( not ( = ?auto_203953 ?auto_203957 ) ) ( not ( = ?auto_203953 ?auto_203958 ) ) ( not ( = ?auto_203953 ?auto_203959 ) ) ( not ( = ?auto_203953 ?auto_203960 ) ) ( not ( = ?auto_203953 ?auto_203961 ) ) ( not ( = ?auto_203954 ?auto_203955 ) ) ( not ( = ?auto_203954 ?auto_203956 ) ) ( not ( = ?auto_203954 ?auto_203957 ) ) ( not ( = ?auto_203954 ?auto_203958 ) ) ( not ( = ?auto_203954 ?auto_203959 ) ) ( not ( = ?auto_203954 ?auto_203960 ) ) ( not ( = ?auto_203954 ?auto_203961 ) ) ( not ( = ?auto_203955 ?auto_203956 ) ) ( not ( = ?auto_203955 ?auto_203957 ) ) ( not ( = ?auto_203955 ?auto_203958 ) ) ( not ( = ?auto_203955 ?auto_203959 ) ) ( not ( = ?auto_203955 ?auto_203960 ) ) ( not ( = ?auto_203955 ?auto_203961 ) ) ( not ( = ?auto_203956 ?auto_203957 ) ) ( not ( = ?auto_203956 ?auto_203958 ) ) ( not ( = ?auto_203956 ?auto_203959 ) ) ( not ( = ?auto_203956 ?auto_203960 ) ) ( not ( = ?auto_203956 ?auto_203961 ) ) ( not ( = ?auto_203957 ?auto_203958 ) ) ( not ( = ?auto_203957 ?auto_203959 ) ) ( not ( = ?auto_203957 ?auto_203960 ) ) ( not ( = ?auto_203957 ?auto_203961 ) ) ( not ( = ?auto_203958 ?auto_203959 ) ) ( not ( = ?auto_203958 ?auto_203960 ) ) ( not ( = ?auto_203958 ?auto_203961 ) ) ( not ( = ?auto_203959 ?auto_203960 ) ) ( not ( = ?auto_203959 ?auto_203961 ) ) ( not ( = ?auto_203960 ?auto_203961 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203960 ?auto_203961 )
      ( !STACK ?auto_203960 ?auto_203959 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_203972 - BLOCK
      ?auto_203973 - BLOCK
      ?auto_203974 - BLOCK
      ?auto_203975 - BLOCK
      ?auto_203976 - BLOCK
      ?auto_203977 - BLOCK
      ?auto_203978 - BLOCK
      ?auto_203979 - BLOCK
      ?auto_203980 - BLOCK
      ?auto_203981 - BLOCK
    )
    :vars
    (
      ?auto_203982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_203980 ) ( ON ?auto_203981 ?auto_203982 ) ( CLEAR ?auto_203981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203972 ) ( ON ?auto_203973 ?auto_203972 ) ( ON ?auto_203974 ?auto_203973 ) ( ON ?auto_203975 ?auto_203974 ) ( ON ?auto_203976 ?auto_203975 ) ( ON ?auto_203977 ?auto_203976 ) ( ON ?auto_203978 ?auto_203977 ) ( ON ?auto_203979 ?auto_203978 ) ( ON ?auto_203980 ?auto_203979 ) ( not ( = ?auto_203972 ?auto_203973 ) ) ( not ( = ?auto_203972 ?auto_203974 ) ) ( not ( = ?auto_203972 ?auto_203975 ) ) ( not ( = ?auto_203972 ?auto_203976 ) ) ( not ( = ?auto_203972 ?auto_203977 ) ) ( not ( = ?auto_203972 ?auto_203978 ) ) ( not ( = ?auto_203972 ?auto_203979 ) ) ( not ( = ?auto_203972 ?auto_203980 ) ) ( not ( = ?auto_203972 ?auto_203981 ) ) ( not ( = ?auto_203972 ?auto_203982 ) ) ( not ( = ?auto_203973 ?auto_203974 ) ) ( not ( = ?auto_203973 ?auto_203975 ) ) ( not ( = ?auto_203973 ?auto_203976 ) ) ( not ( = ?auto_203973 ?auto_203977 ) ) ( not ( = ?auto_203973 ?auto_203978 ) ) ( not ( = ?auto_203973 ?auto_203979 ) ) ( not ( = ?auto_203973 ?auto_203980 ) ) ( not ( = ?auto_203973 ?auto_203981 ) ) ( not ( = ?auto_203973 ?auto_203982 ) ) ( not ( = ?auto_203974 ?auto_203975 ) ) ( not ( = ?auto_203974 ?auto_203976 ) ) ( not ( = ?auto_203974 ?auto_203977 ) ) ( not ( = ?auto_203974 ?auto_203978 ) ) ( not ( = ?auto_203974 ?auto_203979 ) ) ( not ( = ?auto_203974 ?auto_203980 ) ) ( not ( = ?auto_203974 ?auto_203981 ) ) ( not ( = ?auto_203974 ?auto_203982 ) ) ( not ( = ?auto_203975 ?auto_203976 ) ) ( not ( = ?auto_203975 ?auto_203977 ) ) ( not ( = ?auto_203975 ?auto_203978 ) ) ( not ( = ?auto_203975 ?auto_203979 ) ) ( not ( = ?auto_203975 ?auto_203980 ) ) ( not ( = ?auto_203975 ?auto_203981 ) ) ( not ( = ?auto_203975 ?auto_203982 ) ) ( not ( = ?auto_203976 ?auto_203977 ) ) ( not ( = ?auto_203976 ?auto_203978 ) ) ( not ( = ?auto_203976 ?auto_203979 ) ) ( not ( = ?auto_203976 ?auto_203980 ) ) ( not ( = ?auto_203976 ?auto_203981 ) ) ( not ( = ?auto_203976 ?auto_203982 ) ) ( not ( = ?auto_203977 ?auto_203978 ) ) ( not ( = ?auto_203977 ?auto_203979 ) ) ( not ( = ?auto_203977 ?auto_203980 ) ) ( not ( = ?auto_203977 ?auto_203981 ) ) ( not ( = ?auto_203977 ?auto_203982 ) ) ( not ( = ?auto_203978 ?auto_203979 ) ) ( not ( = ?auto_203978 ?auto_203980 ) ) ( not ( = ?auto_203978 ?auto_203981 ) ) ( not ( = ?auto_203978 ?auto_203982 ) ) ( not ( = ?auto_203979 ?auto_203980 ) ) ( not ( = ?auto_203979 ?auto_203981 ) ) ( not ( = ?auto_203979 ?auto_203982 ) ) ( not ( = ?auto_203980 ?auto_203981 ) ) ( not ( = ?auto_203980 ?auto_203982 ) ) ( not ( = ?auto_203981 ?auto_203982 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203981 ?auto_203982 )
      ( !STACK ?auto_203981 ?auto_203980 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_203993 - BLOCK
      ?auto_203994 - BLOCK
      ?auto_203995 - BLOCK
      ?auto_203996 - BLOCK
      ?auto_203997 - BLOCK
      ?auto_203998 - BLOCK
      ?auto_203999 - BLOCK
      ?auto_204000 - BLOCK
      ?auto_204001 - BLOCK
      ?auto_204002 - BLOCK
    )
    :vars
    (
      ?auto_204003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204002 ?auto_204003 ) ( ON-TABLE ?auto_203993 ) ( ON ?auto_203994 ?auto_203993 ) ( ON ?auto_203995 ?auto_203994 ) ( ON ?auto_203996 ?auto_203995 ) ( ON ?auto_203997 ?auto_203996 ) ( ON ?auto_203998 ?auto_203997 ) ( ON ?auto_203999 ?auto_203998 ) ( ON ?auto_204000 ?auto_203999 ) ( not ( = ?auto_203993 ?auto_203994 ) ) ( not ( = ?auto_203993 ?auto_203995 ) ) ( not ( = ?auto_203993 ?auto_203996 ) ) ( not ( = ?auto_203993 ?auto_203997 ) ) ( not ( = ?auto_203993 ?auto_203998 ) ) ( not ( = ?auto_203993 ?auto_203999 ) ) ( not ( = ?auto_203993 ?auto_204000 ) ) ( not ( = ?auto_203993 ?auto_204001 ) ) ( not ( = ?auto_203993 ?auto_204002 ) ) ( not ( = ?auto_203993 ?auto_204003 ) ) ( not ( = ?auto_203994 ?auto_203995 ) ) ( not ( = ?auto_203994 ?auto_203996 ) ) ( not ( = ?auto_203994 ?auto_203997 ) ) ( not ( = ?auto_203994 ?auto_203998 ) ) ( not ( = ?auto_203994 ?auto_203999 ) ) ( not ( = ?auto_203994 ?auto_204000 ) ) ( not ( = ?auto_203994 ?auto_204001 ) ) ( not ( = ?auto_203994 ?auto_204002 ) ) ( not ( = ?auto_203994 ?auto_204003 ) ) ( not ( = ?auto_203995 ?auto_203996 ) ) ( not ( = ?auto_203995 ?auto_203997 ) ) ( not ( = ?auto_203995 ?auto_203998 ) ) ( not ( = ?auto_203995 ?auto_203999 ) ) ( not ( = ?auto_203995 ?auto_204000 ) ) ( not ( = ?auto_203995 ?auto_204001 ) ) ( not ( = ?auto_203995 ?auto_204002 ) ) ( not ( = ?auto_203995 ?auto_204003 ) ) ( not ( = ?auto_203996 ?auto_203997 ) ) ( not ( = ?auto_203996 ?auto_203998 ) ) ( not ( = ?auto_203996 ?auto_203999 ) ) ( not ( = ?auto_203996 ?auto_204000 ) ) ( not ( = ?auto_203996 ?auto_204001 ) ) ( not ( = ?auto_203996 ?auto_204002 ) ) ( not ( = ?auto_203996 ?auto_204003 ) ) ( not ( = ?auto_203997 ?auto_203998 ) ) ( not ( = ?auto_203997 ?auto_203999 ) ) ( not ( = ?auto_203997 ?auto_204000 ) ) ( not ( = ?auto_203997 ?auto_204001 ) ) ( not ( = ?auto_203997 ?auto_204002 ) ) ( not ( = ?auto_203997 ?auto_204003 ) ) ( not ( = ?auto_203998 ?auto_203999 ) ) ( not ( = ?auto_203998 ?auto_204000 ) ) ( not ( = ?auto_203998 ?auto_204001 ) ) ( not ( = ?auto_203998 ?auto_204002 ) ) ( not ( = ?auto_203998 ?auto_204003 ) ) ( not ( = ?auto_203999 ?auto_204000 ) ) ( not ( = ?auto_203999 ?auto_204001 ) ) ( not ( = ?auto_203999 ?auto_204002 ) ) ( not ( = ?auto_203999 ?auto_204003 ) ) ( not ( = ?auto_204000 ?auto_204001 ) ) ( not ( = ?auto_204000 ?auto_204002 ) ) ( not ( = ?auto_204000 ?auto_204003 ) ) ( not ( = ?auto_204001 ?auto_204002 ) ) ( not ( = ?auto_204001 ?auto_204003 ) ) ( not ( = ?auto_204002 ?auto_204003 ) ) ( CLEAR ?auto_204000 ) ( ON ?auto_204001 ?auto_204002 ) ( CLEAR ?auto_204001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_203993 ?auto_203994 ?auto_203995 ?auto_203996 ?auto_203997 ?auto_203998 ?auto_203999 ?auto_204000 ?auto_204001 )
      ( MAKE-10PILE ?auto_203993 ?auto_203994 ?auto_203995 ?auto_203996 ?auto_203997 ?auto_203998 ?auto_203999 ?auto_204000 ?auto_204001 ?auto_204002 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204014 - BLOCK
      ?auto_204015 - BLOCK
      ?auto_204016 - BLOCK
      ?auto_204017 - BLOCK
      ?auto_204018 - BLOCK
      ?auto_204019 - BLOCK
      ?auto_204020 - BLOCK
      ?auto_204021 - BLOCK
      ?auto_204022 - BLOCK
      ?auto_204023 - BLOCK
    )
    :vars
    (
      ?auto_204024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204023 ?auto_204024 ) ( ON-TABLE ?auto_204014 ) ( ON ?auto_204015 ?auto_204014 ) ( ON ?auto_204016 ?auto_204015 ) ( ON ?auto_204017 ?auto_204016 ) ( ON ?auto_204018 ?auto_204017 ) ( ON ?auto_204019 ?auto_204018 ) ( ON ?auto_204020 ?auto_204019 ) ( ON ?auto_204021 ?auto_204020 ) ( not ( = ?auto_204014 ?auto_204015 ) ) ( not ( = ?auto_204014 ?auto_204016 ) ) ( not ( = ?auto_204014 ?auto_204017 ) ) ( not ( = ?auto_204014 ?auto_204018 ) ) ( not ( = ?auto_204014 ?auto_204019 ) ) ( not ( = ?auto_204014 ?auto_204020 ) ) ( not ( = ?auto_204014 ?auto_204021 ) ) ( not ( = ?auto_204014 ?auto_204022 ) ) ( not ( = ?auto_204014 ?auto_204023 ) ) ( not ( = ?auto_204014 ?auto_204024 ) ) ( not ( = ?auto_204015 ?auto_204016 ) ) ( not ( = ?auto_204015 ?auto_204017 ) ) ( not ( = ?auto_204015 ?auto_204018 ) ) ( not ( = ?auto_204015 ?auto_204019 ) ) ( not ( = ?auto_204015 ?auto_204020 ) ) ( not ( = ?auto_204015 ?auto_204021 ) ) ( not ( = ?auto_204015 ?auto_204022 ) ) ( not ( = ?auto_204015 ?auto_204023 ) ) ( not ( = ?auto_204015 ?auto_204024 ) ) ( not ( = ?auto_204016 ?auto_204017 ) ) ( not ( = ?auto_204016 ?auto_204018 ) ) ( not ( = ?auto_204016 ?auto_204019 ) ) ( not ( = ?auto_204016 ?auto_204020 ) ) ( not ( = ?auto_204016 ?auto_204021 ) ) ( not ( = ?auto_204016 ?auto_204022 ) ) ( not ( = ?auto_204016 ?auto_204023 ) ) ( not ( = ?auto_204016 ?auto_204024 ) ) ( not ( = ?auto_204017 ?auto_204018 ) ) ( not ( = ?auto_204017 ?auto_204019 ) ) ( not ( = ?auto_204017 ?auto_204020 ) ) ( not ( = ?auto_204017 ?auto_204021 ) ) ( not ( = ?auto_204017 ?auto_204022 ) ) ( not ( = ?auto_204017 ?auto_204023 ) ) ( not ( = ?auto_204017 ?auto_204024 ) ) ( not ( = ?auto_204018 ?auto_204019 ) ) ( not ( = ?auto_204018 ?auto_204020 ) ) ( not ( = ?auto_204018 ?auto_204021 ) ) ( not ( = ?auto_204018 ?auto_204022 ) ) ( not ( = ?auto_204018 ?auto_204023 ) ) ( not ( = ?auto_204018 ?auto_204024 ) ) ( not ( = ?auto_204019 ?auto_204020 ) ) ( not ( = ?auto_204019 ?auto_204021 ) ) ( not ( = ?auto_204019 ?auto_204022 ) ) ( not ( = ?auto_204019 ?auto_204023 ) ) ( not ( = ?auto_204019 ?auto_204024 ) ) ( not ( = ?auto_204020 ?auto_204021 ) ) ( not ( = ?auto_204020 ?auto_204022 ) ) ( not ( = ?auto_204020 ?auto_204023 ) ) ( not ( = ?auto_204020 ?auto_204024 ) ) ( not ( = ?auto_204021 ?auto_204022 ) ) ( not ( = ?auto_204021 ?auto_204023 ) ) ( not ( = ?auto_204021 ?auto_204024 ) ) ( not ( = ?auto_204022 ?auto_204023 ) ) ( not ( = ?auto_204022 ?auto_204024 ) ) ( not ( = ?auto_204023 ?auto_204024 ) ) ( CLEAR ?auto_204021 ) ( ON ?auto_204022 ?auto_204023 ) ( CLEAR ?auto_204022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_204014 ?auto_204015 ?auto_204016 ?auto_204017 ?auto_204018 ?auto_204019 ?auto_204020 ?auto_204021 ?auto_204022 )
      ( MAKE-10PILE ?auto_204014 ?auto_204015 ?auto_204016 ?auto_204017 ?auto_204018 ?auto_204019 ?auto_204020 ?auto_204021 ?auto_204022 ?auto_204023 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204035 - BLOCK
      ?auto_204036 - BLOCK
      ?auto_204037 - BLOCK
      ?auto_204038 - BLOCK
      ?auto_204039 - BLOCK
      ?auto_204040 - BLOCK
      ?auto_204041 - BLOCK
      ?auto_204042 - BLOCK
      ?auto_204043 - BLOCK
      ?auto_204044 - BLOCK
    )
    :vars
    (
      ?auto_204045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204044 ?auto_204045 ) ( ON-TABLE ?auto_204035 ) ( ON ?auto_204036 ?auto_204035 ) ( ON ?auto_204037 ?auto_204036 ) ( ON ?auto_204038 ?auto_204037 ) ( ON ?auto_204039 ?auto_204038 ) ( ON ?auto_204040 ?auto_204039 ) ( ON ?auto_204041 ?auto_204040 ) ( not ( = ?auto_204035 ?auto_204036 ) ) ( not ( = ?auto_204035 ?auto_204037 ) ) ( not ( = ?auto_204035 ?auto_204038 ) ) ( not ( = ?auto_204035 ?auto_204039 ) ) ( not ( = ?auto_204035 ?auto_204040 ) ) ( not ( = ?auto_204035 ?auto_204041 ) ) ( not ( = ?auto_204035 ?auto_204042 ) ) ( not ( = ?auto_204035 ?auto_204043 ) ) ( not ( = ?auto_204035 ?auto_204044 ) ) ( not ( = ?auto_204035 ?auto_204045 ) ) ( not ( = ?auto_204036 ?auto_204037 ) ) ( not ( = ?auto_204036 ?auto_204038 ) ) ( not ( = ?auto_204036 ?auto_204039 ) ) ( not ( = ?auto_204036 ?auto_204040 ) ) ( not ( = ?auto_204036 ?auto_204041 ) ) ( not ( = ?auto_204036 ?auto_204042 ) ) ( not ( = ?auto_204036 ?auto_204043 ) ) ( not ( = ?auto_204036 ?auto_204044 ) ) ( not ( = ?auto_204036 ?auto_204045 ) ) ( not ( = ?auto_204037 ?auto_204038 ) ) ( not ( = ?auto_204037 ?auto_204039 ) ) ( not ( = ?auto_204037 ?auto_204040 ) ) ( not ( = ?auto_204037 ?auto_204041 ) ) ( not ( = ?auto_204037 ?auto_204042 ) ) ( not ( = ?auto_204037 ?auto_204043 ) ) ( not ( = ?auto_204037 ?auto_204044 ) ) ( not ( = ?auto_204037 ?auto_204045 ) ) ( not ( = ?auto_204038 ?auto_204039 ) ) ( not ( = ?auto_204038 ?auto_204040 ) ) ( not ( = ?auto_204038 ?auto_204041 ) ) ( not ( = ?auto_204038 ?auto_204042 ) ) ( not ( = ?auto_204038 ?auto_204043 ) ) ( not ( = ?auto_204038 ?auto_204044 ) ) ( not ( = ?auto_204038 ?auto_204045 ) ) ( not ( = ?auto_204039 ?auto_204040 ) ) ( not ( = ?auto_204039 ?auto_204041 ) ) ( not ( = ?auto_204039 ?auto_204042 ) ) ( not ( = ?auto_204039 ?auto_204043 ) ) ( not ( = ?auto_204039 ?auto_204044 ) ) ( not ( = ?auto_204039 ?auto_204045 ) ) ( not ( = ?auto_204040 ?auto_204041 ) ) ( not ( = ?auto_204040 ?auto_204042 ) ) ( not ( = ?auto_204040 ?auto_204043 ) ) ( not ( = ?auto_204040 ?auto_204044 ) ) ( not ( = ?auto_204040 ?auto_204045 ) ) ( not ( = ?auto_204041 ?auto_204042 ) ) ( not ( = ?auto_204041 ?auto_204043 ) ) ( not ( = ?auto_204041 ?auto_204044 ) ) ( not ( = ?auto_204041 ?auto_204045 ) ) ( not ( = ?auto_204042 ?auto_204043 ) ) ( not ( = ?auto_204042 ?auto_204044 ) ) ( not ( = ?auto_204042 ?auto_204045 ) ) ( not ( = ?auto_204043 ?auto_204044 ) ) ( not ( = ?auto_204043 ?auto_204045 ) ) ( not ( = ?auto_204044 ?auto_204045 ) ) ( ON ?auto_204043 ?auto_204044 ) ( CLEAR ?auto_204041 ) ( ON ?auto_204042 ?auto_204043 ) ( CLEAR ?auto_204042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204035 ?auto_204036 ?auto_204037 ?auto_204038 ?auto_204039 ?auto_204040 ?auto_204041 ?auto_204042 )
      ( MAKE-10PILE ?auto_204035 ?auto_204036 ?auto_204037 ?auto_204038 ?auto_204039 ?auto_204040 ?auto_204041 ?auto_204042 ?auto_204043 ?auto_204044 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204056 - BLOCK
      ?auto_204057 - BLOCK
      ?auto_204058 - BLOCK
      ?auto_204059 - BLOCK
      ?auto_204060 - BLOCK
      ?auto_204061 - BLOCK
      ?auto_204062 - BLOCK
      ?auto_204063 - BLOCK
      ?auto_204064 - BLOCK
      ?auto_204065 - BLOCK
    )
    :vars
    (
      ?auto_204066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204065 ?auto_204066 ) ( ON-TABLE ?auto_204056 ) ( ON ?auto_204057 ?auto_204056 ) ( ON ?auto_204058 ?auto_204057 ) ( ON ?auto_204059 ?auto_204058 ) ( ON ?auto_204060 ?auto_204059 ) ( ON ?auto_204061 ?auto_204060 ) ( ON ?auto_204062 ?auto_204061 ) ( not ( = ?auto_204056 ?auto_204057 ) ) ( not ( = ?auto_204056 ?auto_204058 ) ) ( not ( = ?auto_204056 ?auto_204059 ) ) ( not ( = ?auto_204056 ?auto_204060 ) ) ( not ( = ?auto_204056 ?auto_204061 ) ) ( not ( = ?auto_204056 ?auto_204062 ) ) ( not ( = ?auto_204056 ?auto_204063 ) ) ( not ( = ?auto_204056 ?auto_204064 ) ) ( not ( = ?auto_204056 ?auto_204065 ) ) ( not ( = ?auto_204056 ?auto_204066 ) ) ( not ( = ?auto_204057 ?auto_204058 ) ) ( not ( = ?auto_204057 ?auto_204059 ) ) ( not ( = ?auto_204057 ?auto_204060 ) ) ( not ( = ?auto_204057 ?auto_204061 ) ) ( not ( = ?auto_204057 ?auto_204062 ) ) ( not ( = ?auto_204057 ?auto_204063 ) ) ( not ( = ?auto_204057 ?auto_204064 ) ) ( not ( = ?auto_204057 ?auto_204065 ) ) ( not ( = ?auto_204057 ?auto_204066 ) ) ( not ( = ?auto_204058 ?auto_204059 ) ) ( not ( = ?auto_204058 ?auto_204060 ) ) ( not ( = ?auto_204058 ?auto_204061 ) ) ( not ( = ?auto_204058 ?auto_204062 ) ) ( not ( = ?auto_204058 ?auto_204063 ) ) ( not ( = ?auto_204058 ?auto_204064 ) ) ( not ( = ?auto_204058 ?auto_204065 ) ) ( not ( = ?auto_204058 ?auto_204066 ) ) ( not ( = ?auto_204059 ?auto_204060 ) ) ( not ( = ?auto_204059 ?auto_204061 ) ) ( not ( = ?auto_204059 ?auto_204062 ) ) ( not ( = ?auto_204059 ?auto_204063 ) ) ( not ( = ?auto_204059 ?auto_204064 ) ) ( not ( = ?auto_204059 ?auto_204065 ) ) ( not ( = ?auto_204059 ?auto_204066 ) ) ( not ( = ?auto_204060 ?auto_204061 ) ) ( not ( = ?auto_204060 ?auto_204062 ) ) ( not ( = ?auto_204060 ?auto_204063 ) ) ( not ( = ?auto_204060 ?auto_204064 ) ) ( not ( = ?auto_204060 ?auto_204065 ) ) ( not ( = ?auto_204060 ?auto_204066 ) ) ( not ( = ?auto_204061 ?auto_204062 ) ) ( not ( = ?auto_204061 ?auto_204063 ) ) ( not ( = ?auto_204061 ?auto_204064 ) ) ( not ( = ?auto_204061 ?auto_204065 ) ) ( not ( = ?auto_204061 ?auto_204066 ) ) ( not ( = ?auto_204062 ?auto_204063 ) ) ( not ( = ?auto_204062 ?auto_204064 ) ) ( not ( = ?auto_204062 ?auto_204065 ) ) ( not ( = ?auto_204062 ?auto_204066 ) ) ( not ( = ?auto_204063 ?auto_204064 ) ) ( not ( = ?auto_204063 ?auto_204065 ) ) ( not ( = ?auto_204063 ?auto_204066 ) ) ( not ( = ?auto_204064 ?auto_204065 ) ) ( not ( = ?auto_204064 ?auto_204066 ) ) ( not ( = ?auto_204065 ?auto_204066 ) ) ( ON ?auto_204064 ?auto_204065 ) ( CLEAR ?auto_204062 ) ( ON ?auto_204063 ?auto_204064 ) ( CLEAR ?auto_204063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204056 ?auto_204057 ?auto_204058 ?auto_204059 ?auto_204060 ?auto_204061 ?auto_204062 ?auto_204063 )
      ( MAKE-10PILE ?auto_204056 ?auto_204057 ?auto_204058 ?auto_204059 ?auto_204060 ?auto_204061 ?auto_204062 ?auto_204063 ?auto_204064 ?auto_204065 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204077 - BLOCK
      ?auto_204078 - BLOCK
      ?auto_204079 - BLOCK
      ?auto_204080 - BLOCK
      ?auto_204081 - BLOCK
      ?auto_204082 - BLOCK
      ?auto_204083 - BLOCK
      ?auto_204084 - BLOCK
      ?auto_204085 - BLOCK
      ?auto_204086 - BLOCK
    )
    :vars
    (
      ?auto_204087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204086 ?auto_204087 ) ( ON-TABLE ?auto_204077 ) ( ON ?auto_204078 ?auto_204077 ) ( ON ?auto_204079 ?auto_204078 ) ( ON ?auto_204080 ?auto_204079 ) ( ON ?auto_204081 ?auto_204080 ) ( ON ?auto_204082 ?auto_204081 ) ( not ( = ?auto_204077 ?auto_204078 ) ) ( not ( = ?auto_204077 ?auto_204079 ) ) ( not ( = ?auto_204077 ?auto_204080 ) ) ( not ( = ?auto_204077 ?auto_204081 ) ) ( not ( = ?auto_204077 ?auto_204082 ) ) ( not ( = ?auto_204077 ?auto_204083 ) ) ( not ( = ?auto_204077 ?auto_204084 ) ) ( not ( = ?auto_204077 ?auto_204085 ) ) ( not ( = ?auto_204077 ?auto_204086 ) ) ( not ( = ?auto_204077 ?auto_204087 ) ) ( not ( = ?auto_204078 ?auto_204079 ) ) ( not ( = ?auto_204078 ?auto_204080 ) ) ( not ( = ?auto_204078 ?auto_204081 ) ) ( not ( = ?auto_204078 ?auto_204082 ) ) ( not ( = ?auto_204078 ?auto_204083 ) ) ( not ( = ?auto_204078 ?auto_204084 ) ) ( not ( = ?auto_204078 ?auto_204085 ) ) ( not ( = ?auto_204078 ?auto_204086 ) ) ( not ( = ?auto_204078 ?auto_204087 ) ) ( not ( = ?auto_204079 ?auto_204080 ) ) ( not ( = ?auto_204079 ?auto_204081 ) ) ( not ( = ?auto_204079 ?auto_204082 ) ) ( not ( = ?auto_204079 ?auto_204083 ) ) ( not ( = ?auto_204079 ?auto_204084 ) ) ( not ( = ?auto_204079 ?auto_204085 ) ) ( not ( = ?auto_204079 ?auto_204086 ) ) ( not ( = ?auto_204079 ?auto_204087 ) ) ( not ( = ?auto_204080 ?auto_204081 ) ) ( not ( = ?auto_204080 ?auto_204082 ) ) ( not ( = ?auto_204080 ?auto_204083 ) ) ( not ( = ?auto_204080 ?auto_204084 ) ) ( not ( = ?auto_204080 ?auto_204085 ) ) ( not ( = ?auto_204080 ?auto_204086 ) ) ( not ( = ?auto_204080 ?auto_204087 ) ) ( not ( = ?auto_204081 ?auto_204082 ) ) ( not ( = ?auto_204081 ?auto_204083 ) ) ( not ( = ?auto_204081 ?auto_204084 ) ) ( not ( = ?auto_204081 ?auto_204085 ) ) ( not ( = ?auto_204081 ?auto_204086 ) ) ( not ( = ?auto_204081 ?auto_204087 ) ) ( not ( = ?auto_204082 ?auto_204083 ) ) ( not ( = ?auto_204082 ?auto_204084 ) ) ( not ( = ?auto_204082 ?auto_204085 ) ) ( not ( = ?auto_204082 ?auto_204086 ) ) ( not ( = ?auto_204082 ?auto_204087 ) ) ( not ( = ?auto_204083 ?auto_204084 ) ) ( not ( = ?auto_204083 ?auto_204085 ) ) ( not ( = ?auto_204083 ?auto_204086 ) ) ( not ( = ?auto_204083 ?auto_204087 ) ) ( not ( = ?auto_204084 ?auto_204085 ) ) ( not ( = ?auto_204084 ?auto_204086 ) ) ( not ( = ?auto_204084 ?auto_204087 ) ) ( not ( = ?auto_204085 ?auto_204086 ) ) ( not ( = ?auto_204085 ?auto_204087 ) ) ( not ( = ?auto_204086 ?auto_204087 ) ) ( ON ?auto_204085 ?auto_204086 ) ( ON ?auto_204084 ?auto_204085 ) ( CLEAR ?auto_204082 ) ( ON ?auto_204083 ?auto_204084 ) ( CLEAR ?auto_204083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204077 ?auto_204078 ?auto_204079 ?auto_204080 ?auto_204081 ?auto_204082 ?auto_204083 )
      ( MAKE-10PILE ?auto_204077 ?auto_204078 ?auto_204079 ?auto_204080 ?auto_204081 ?auto_204082 ?auto_204083 ?auto_204084 ?auto_204085 ?auto_204086 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204098 - BLOCK
      ?auto_204099 - BLOCK
      ?auto_204100 - BLOCK
      ?auto_204101 - BLOCK
      ?auto_204102 - BLOCK
      ?auto_204103 - BLOCK
      ?auto_204104 - BLOCK
      ?auto_204105 - BLOCK
      ?auto_204106 - BLOCK
      ?auto_204107 - BLOCK
    )
    :vars
    (
      ?auto_204108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204107 ?auto_204108 ) ( ON-TABLE ?auto_204098 ) ( ON ?auto_204099 ?auto_204098 ) ( ON ?auto_204100 ?auto_204099 ) ( ON ?auto_204101 ?auto_204100 ) ( ON ?auto_204102 ?auto_204101 ) ( ON ?auto_204103 ?auto_204102 ) ( not ( = ?auto_204098 ?auto_204099 ) ) ( not ( = ?auto_204098 ?auto_204100 ) ) ( not ( = ?auto_204098 ?auto_204101 ) ) ( not ( = ?auto_204098 ?auto_204102 ) ) ( not ( = ?auto_204098 ?auto_204103 ) ) ( not ( = ?auto_204098 ?auto_204104 ) ) ( not ( = ?auto_204098 ?auto_204105 ) ) ( not ( = ?auto_204098 ?auto_204106 ) ) ( not ( = ?auto_204098 ?auto_204107 ) ) ( not ( = ?auto_204098 ?auto_204108 ) ) ( not ( = ?auto_204099 ?auto_204100 ) ) ( not ( = ?auto_204099 ?auto_204101 ) ) ( not ( = ?auto_204099 ?auto_204102 ) ) ( not ( = ?auto_204099 ?auto_204103 ) ) ( not ( = ?auto_204099 ?auto_204104 ) ) ( not ( = ?auto_204099 ?auto_204105 ) ) ( not ( = ?auto_204099 ?auto_204106 ) ) ( not ( = ?auto_204099 ?auto_204107 ) ) ( not ( = ?auto_204099 ?auto_204108 ) ) ( not ( = ?auto_204100 ?auto_204101 ) ) ( not ( = ?auto_204100 ?auto_204102 ) ) ( not ( = ?auto_204100 ?auto_204103 ) ) ( not ( = ?auto_204100 ?auto_204104 ) ) ( not ( = ?auto_204100 ?auto_204105 ) ) ( not ( = ?auto_204100 ?auto_204106 ) ) ( not ( = ?auto_204100 ?auto_204107 ) ) ( not ( = ?auto_204100 ?auto_204108 ) ) ( not ( = ?auto_204101 ?auto_204102 ) ) ( not ( = ?auto_204101 ?auto_204103 ) ) ( not ( = ?auto_204101 ?auto_204104 ) ) ( not ( = ?auto_204101 ?auto_204105 ) ) ( not ( = ?auto_204101 ?auto_204106 ) ) ( not ( = ?auto_204101 ?auto_204107 ) ) ( not ( = ?auto_204101 ?auto_204108 ) ) ( not ( = ?auto_204102 ?auto_204103 ) ) ( not ( = ?auto_204102 ?auto_204104 ) ) ( not ( = ?auto_204102 ?auto_204105 ) ) ( not ( = ?auto_204102 ?auto_204106 ) ) ( not ( = ?auto_204102 ?auto_204107 ) ) ( not ( = ?auto_204102 ?auto_204108 ) ) ( not ( = ?auto_204103 ?auto_204104 ) ) ( not ( = ?auto_204103 ?auto_204105 ) ) ( not ( = ?auto_204103 ?auto_204106 ) ) ( not ( = ?auto_204103 ?auto_204107 ) ) ( not ( = ?auto_204103 ?auto_204108 ) ) ( not ( = ?auto_204104 ?auto_204105 ) ) ( not ( = ?auto_204104 ?auto_204106 ) ) ( not ( = ?auto_204104 ?auto_204107 ) ) ( not ( = ?auto_204104 ?auto_204108 ) ) ( not ( = ?auto_204105 ?auto_204106 ) ) ( not ( = ?auto_204105 ?auto_204107 ) ) ( not ( = ?auto_204105 ?auto_204108 ) ) ( not ( = ?auto_204106 ?auto_204107 ) ) ( not ( = ?auto_204106 ?auto_204108 ) ) ( not ( = ?auto_204107 ?auto_204108 ) ) ( ON ?auto_204106 ?auto_204107 ) ( ON ?auto_204105 ?auto_204106 ) ( CLEAR ?auto_204103 ) ( ON ?auto_204104 ?auto_204105 ) ( CLEAR ?auto_204104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204098 ?auto_204099 ?auto_204100 ?auto_204101 ?auto_204102 ?auto_204103 ?auto_204104 )
      ( MAKE-10PILE ?auto_204098 ?auto_204099 ?auto_204100 ?auto_204101 ?auto_204102 ?auto_204103 ?auto_204104 ?auto_204105 ?auto_204106 ?auto_204107 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204119 - BLOCK
      ?auto_204120 - BLOCK
      ?auto_204121 - BLOCK
      ?auto_204122 - BLOCK
      ?auto_204123 - BLOCK
      ?auto_204124 - BLOCK
      ?auto_204125 - BLOCK
      ?auto_204126 - BLOCK
      ?auto_204127 - BLOCK
      ?auto_204128 - BLOCK
    )
    :vars
    (
      ?auto_204129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204128 ?auto_204129 ) ( ON-TABLE ?auto_204119 ) ( ON ?auto_204120 ?auto_204119 ) ( ON ?auto_204121 ?auto_204120 ) ( ON ?auto_204122 ?auto_204121 ) ( ON ?auto_204123 ?auto_204122 ) ( not ( = ?auto_204119 ?auto_204120 ) ) ( not ( = ?auto_204119 ?auto_204121 ) ) ( not ( = ?auto_204119 ?auto_204122 ) ) ( not ( = ?auto_204119 ?auto_204123 ) ) ( not ( = ?auto_204119 ?auto_204124 ) ) ( not ( = ?auto_204119 ?auto_204125 ) ) ( not ( = ?auto_204119 ?auto_204126 ) ) ( not ( = ?auto_204119 ?auto_204127 ) ) ( not ( = ?auto_204119 ?auto_204128 ) ) ( not ( = ?auto_204119 ?auto_204129 ) ) ( not ( = ?auto_204120 ?auto_204121 ) ) ( not ( = ?auto_204120 ?auto_204122 ) ) ( not ( = ?auto_204120 ?auto_204123 ) ) ( not ( = ?auto_204120 ?auto_204124 ) ) ( not ( = ?auto_204120 ?auto_204125 ) ) ( not ( = ?auto_204120 ?auto_204126 ) ) ( not ( = ?auto_204120 ?auto_204127 ) ) ( not ( = ?auto_204120 ?auto_204128 ) ) ( not ( = ?auto_204120 ?auto_204129 ) ) ( not ( = ?auto_204121 ?auto_204122 ) ) ( not ( = ?auto_204121 ?auto_204123 ) ) ( not ( = ?auto_204121 ?auto_204124 ) ) ( not ( = ?auto_204121 ?auto_204125 ) ) ( not ( = ?auto_204121 ?auto_204126 ) ) ( not ( = ?auto_204121 ?auto_204127 ) ) ( not ( = ?auto_204121 ?auto_204128 ) ) ( not ( = ?auto_204121 ?auto_204129 ) ) ( not ( = ?auto_204122 ?auto_204123 ) ) ( not ( = ?auto_204122 ?auto_204124 ) ) ( not ( = ?auto_204122 ?auto_204125 ) ) ( not ( = ?auto_204122 ?auto_204126 ) ) ( not ( = ?auto_204122 ?auto_204127 ) ) ( not ( = ?auto_204122 ?auto_204128 ) ) ( not ( = ?auto_204122 ?auto_204129 ) ) ( not ( = ?auto_204123 ?auto_204124 ) ) ( not ( = ?auto_204123 ?auto_204125 ) ) ( not ( = ?auto_204123 ?auto_204126 ) ) ( not ( = ?auto_204123 ?auto_204127 ) ) ( not ( = ?auto_204123 ?auto_204128 ) ) ( not ( = ?auto_204123 ?auto_204129 ) ) ( not ( = ?auto_204124 ?auto_204125 ) ) ( not ( = ?auto_204124 ?auto_204126 ) ) ( not ( = ?auto_204124 ?auto_204127 ) ) ( not ( = ?auto_204124 ?auto_204128 ) ) ( not ( = ?auto_204124 ?auto_204129 ) ) ( not ( = ?auto_204125 ?auto_204126 ) ) ( not ( = ?auto_204125 ?auto_204127 ) ) ( not ( = ?auto_204125 ?auto_204128 ) ) ( not ( = ?auto_204125 ?auto_204129 ) ) ( not ( = ?auto_204126 ?auto_204127 ) ) ( not ( = ?auto_204126 ?auto_204128 ) ) ( not ( = ?auto_204126 ?auto_204129 ) ) ( not ( = ?auto_204127 ?auto_204128 ) ) ( not ( = ?auto_204127 ?auto_204129 ) ) ( not ( = ?auto_204128 ?auto_204129 ) ) ( ON ?auto_204127 ?auto_204128 ) ( ON ?auto_204126 ?auto_204127 ) ( ON ?auto_204125 ?auto_204126 ) ( CLEAR ?auto_204123 ) ( ON ?auto_204124 ?auto_204125 ) ( CLEAR ?auto_204124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204119 ?auto_204120 ?auto_204121 ?auto_204122 ?auto_204123 ?auto_204124 )
      ( MAKE-10PILE ?auto_204119 ?auto_204120 ?auto_204121 ?auto_204122 ?auto_204123 ?auto_204124 ?auto_204125 ?auto_204126 ?auto_204127 ?auto_204128 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204140 - BLOCK
      ?auto_204141 - BLOCK
      ?auto_204142 - BLOCK
      ?auto_204143 - BLOCK
      ?auto_204144 - BLOCK
      ?auto_204145 - BLOCK
      ?auto_204146 - BLOCK
      ?auto_204147 - BLOCK
      ?auto_204148 - BLOCK
      ?auto_204149 - BLOCK
    )
    :vars
    (
      ?auto_204150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204149 ?auto_204150 ) ( ON-TABLE ?auto_204140 ) ( ON ?auto_204141 ?auto_204140 ) ( ON ?auto_204142 ?auto_204141 ) ( ON ?auto_204143 ?auto_204142 ) ( ON ?auto_204144 ?auto_204143 ) ( not ( = ?auto_204140 ?auto_204141 ) ) ( not ( = ?auto_204140 ?auto_204142 ) ) ( not ( = ?auto_204140 ?auto_204143 ) ) ( not ( = ?auto_204140 ?auto_204144 ) ) ( not ( = ?auto_204140 ?auto_204145 ) ) ( not ( = ?auto_204140 ?auto_204146 ) ) ( not ( = ?auto_204140 ?auto_204147 ) ) ( not ( = ?auto_204140 ?auto_204148 ) ) ( not ( = ?auto_204140 ?auto_204149 ) ) ( not ( = ?auto_204140 ?auto_204150 ) ) ( not ( = ?auto_204141 ?auto_204142 ) ) ( not ( = ?auto_204141 ?auto_204143 ) ) ( not ( = ?auto_204141 ?auto_204144 ) ) ( not ( = ?auto_204141 ?auto_204145 ) ) ( not ( = ?auto_204141 ?auto_204146 ) ) ( not ( = ?auto_204141 ?auto_204147 ) ) ( not ( = ?auto_204141 ?auto_204148 ) ) ( not ( = ?auto_204141 ?auto_204149 ) ) ( not ( = ?auto_204141 ?auto_204150 ) ) ( not ( = ?auto_204142 ?auto_204143 ) ) ( not ( = ?auto_204142 ?auto_204144 ) ) ( not ( = ?auto_204142 ?auto_204145 ) ) ( not ( = ?auto_204142 ?auto_204146 ) ) ( not ( = ?auto_204142 ?auto_204147 ) ) ( not ( = ?auto_204142 ?auto_204148 ) ) ( not ( = ?auto_204142 ?auto_204149 ) ) ( not ( = ?auto_204142 ?auto_204150 ) ) ( not ( = ?auto_204143 ?auto_204144 ) ) ( not ( = ?auto_204143 ?auto_204145 ) ) ( not ( = ?auto_204143 ?auto_204146 ) ) ( not ( = ?auto_204143 ?auto_204147 ) ) ( not ( = ?auto_204143 ?auto_204148 ) ) ( not ( = ?auto_204143 ?auto_204149 ) ) ( not ( = ?auto_204143 ?auto_204150 ) ) ( not ( = ?auto_204144 ?auto_204145 ) ) ( not ( = ?auto_204144 ?auto_204146 ) ) ( not ( = ?auto_204144 ?auto_204147 ) ) ( not ( = ?auto_204144 ?auto_204148 ) ) ( not ( = ?auto_204144 ?auto_204149 ) ) ( not ( = ?auto_204144 ?auto_204150 ) ) ( not ( = ?auto_204145 ?auto_204146 ) ) ( not ( = ?auto_204145 ?auto_204147 ) ) ( not ( = ?auto_204145 ?auto_204148 ) ) ( not ( = ?auto_204145 ?auto_204149 ) ) ( not ( = ?auto_204145 ?auto_204150 ) ) ( not ( = ?auto_204146 ?auto_204147 ) ) ( not ( = ?auto_204146 ?auto_204148 ) ) ( not ( = ?auto_204146 ?auto_204149 ) ) ( not ( = ?auto_204146 ?auto_204150 ) ) ( not ( = ?auto_204147 ?auto_204148 ) ) ( not ( = ?auto_204147 ?auto_204149 ) ) ( not ( = ?auto_204147 ?auto_204150 ) ) ( not ( = ?auto_204148 ?auto_204149 ) ) ( not ( = ?auto_204148 ?auto_204150 ) ) ( not ( = ?auto_204149 ?auto_204150 ) ) ( ON ?auto_204148 ?auto_204149 ) ( ON ?auto_204147 ?auto_204148 ) ( ON ?auto_204146 ?auto_204147 ) ( CLEAR ?auto_204144 ) ( ON ?auto_204145 ?auto_204146 ) ( CLEAR ?auto_204145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204140 ?auto_204141 ?auto_204142 ?auto_204143 ?auto_204144 ?auto_204145 )
      ( MAKE-10PILE ?auto_204140 ?auto_204141 ?auto_204142 ?auto_204143 ?auto_204144 ?auto_204145 ?auto_204146 ?auto_204147 ?auto_204148 ?auto_204149 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204161 - BLOCK
      ?auto_204162 - BLOCK
      ?auto_204163 - BLOCK
      ?auto_204164 - BLOCK
      ?auto_204165 - BLOCK
      ?auto_204166 - BLOCK
      ?auto_204167 - BLOCK
      ?auto_204168 - BLOCK
      ?auto_204169 - BLOCK
      ?auto_204170 - BLOCK
    )
    :vars
    (
      ?auto_204171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204170 ?auto_204171 ) ( ON-TABLE ?auto_204161 ) ( ON ?auto_204162 ?auto_204161 ) ( ON ?auto_204163 ?auto_204162 ) ( ON ?auto_204164 ?auto_204163 ) ( not ( = ?auto_204161 ?auto_204162 ) ) ( not ( = ?auto_204161 ?auto_204163 ) ) ( not ( = ?auto_204161 ?auto_204164 ) ) ( not ( = ?auto_204161 ?auto_204165 ) ) ( not ( = ?auto_204161 ?auto_204166 ) ) ( not ( = ?auto_204161 ?auto_204167 ) ) ( not ( = ?auto_204161 ?auto_204168 ) ) ( not ( = ?auto_204161 ?auto_204169 ) ) ( not ( = ?auto_204161 ?auto_204170 ) ) ( not ( = ?auto_204161 ?auto_204171 ) ) ( not ( = ?auto_204162 ?auto_204163 ) ) ( not ( = ?auto_204162 ?auto_204164 ) ) ( not ( = ?auto_204162 ?auto_204165 ) ) ( not ( = ?auto_204162 ?auto_204166 ) ) ( not ( = ?auto_204162 ?auto_204167 ) ) ( not ( = ?auto_204162 ?auto_204168 ) ) ( not ( = ?auto_204162 ?auto_204169 ) ) ( not ( = ?auto_204162 ?auto_204170 ) ) ( not ( = ?auto_204162 ?auto_204171 ) ) ( not ( = ?auto_204163 ?auto_204164 ) ) ( not ( = ?auto_204163 ?auto_204165 ) ) ( not ( = ?auto_204163 ?auto_204166 ) ) ( not ( = ?auto_204163 ?auto_204167 ) ) ( not ( = ?auto_204163 ?auto_204168 ) ) ( not ( = ?auto_204163 ?auto_204169 ) ) ( not ( = ?auto_204163 ?auto_204170 ) ) ( not ( = ?auto_204163 ?auto_204171 ) ) ( not ( = ?auto_204164 ?auto_204165 ) ) ( not ( = ?auto_204164 ?auto_204166 ) ) ( not ( = ?auto_204164 ?auto_204167 ) ) ( not ( = ?auto_204164 ?auto_204168 ) ) ( not ( = ?auto_204164 ?auto_204169 ) ) ( not ( = ?auto_204164 ?auto_204170 ) ) ( not ( = ?auto_204164 ?auto_204171 ) ) ( not ( = ?auto_204165 ?auto_204166 ) ) ( not ( = ?auto_204165 ?auto_204167 ) ) ( not ( = ?auto_204165 ?auto_204168 ) ) ( not ( = ?auto_204165 ?auto_204169 ) ) ( not ( = ?auto_204165 ?auto_204170 ) ) ( not ( = ?auto_204165 ?auto_204171 ) ) ( not ( = ?auto_204166 ?auto_204167 ) ) ( not ( = ?auto_204166 ?auto_204168 ) ) ( not ( = ?auto_204166 ?auto_204169 ) ) ( not ( = ?auto_204166 ?auto_204170 ) ) ( not ( = ?auto_204166 ?auto_204171 ) ) ( not ( = ?auto_204167 ?auto_204168 ) ) ( not ( = ?auto_204167 ?auto_204169 ) ) ( not ( = ?auto_204167 ?auto_204170 ) ) ( not ( = ?auto_204167 ?auto_204171 ) ) ( not ( = ?auto_204168 ?auto_204169 ) ) ( not ( = ?auto_204168 ?auto_204170 ) ) ( not ( = ?auto_204168 ?auto_204171 ) ) ( not ( = ?auto_204169 ?auto_204170 ) ) ( not ( = ?auto_204169 ?auto_204171 ) ) ( not ( = ?auto_204170 ?auto_204171 ) ) ( ON ?auto_204169 ?auto_204170 ) ( ON ?auto_204168 ?auto_204169 ) ( ON ?auto_204167 ?auto_204168 ) ( ON ?auto_204166 ?auto_204167 ) ( CLEAR ?auto_204164 ) ( ON ?auto_204165 ?auto_204166 ) ( CLEAR ?auto_204165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204161 ?auto_204162 ?auto_204163 ?auto_204164 ?auto_204165 )
      ( MAKE-10PILE ?auto_204161 ?auto_204162 ?auto_204163 ?auto_204164 ?auto_204165 ?auto_204166 ?auto_204167 ?auto_204168 ?auto_204169 ?auto_204170 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204182 - BLOCK
      ?auto_204183 - BLOCK
      ?auto_204184 - BLOCK
      ?auto_204185 - BLOCK
      ?auto_204186 - BLOCK
      ?auto_204187 - BLOCK
      ?auto_204188 - BLOCK
      ?auto_204189 - BLOCK
      ?auto_204190 - BLOCK
      ?auto_204191 - BLOCK
    )
    :vars
    (
      ?auto_204192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204191 ?auto_204192 ) ( ON-TABLE ?auto_204182 ) ( ON ?auto_204183 ?auto_204182 ) ( ON ?auto_204184 ?auto_204183 ) ( ON ?auto_204185 ?auto_204184 ) ( not ( = ?auto_204182 ?auto_204183 ) ) ( not ( = ?auto_204182 ?auto_204184 ) ) ( not ( = ?auto_204182 ?auto_204185 ) ) ( not ( = ?auto_204182 ?auto_204186 ) ) ( not ( = ?auto_204182 ?auto_204187 ) ) ( not ( = ?auto_204182 ?auto_204188 ) ) ( not ( = ?auto_204182 ?auto_204189 ) ) ( not ( = ?auto_204182 ?auto_204190 ) ) ( not ( = ?auto_204182 ?auto_204191 ) ) ( not ( = ?auto_204182 ?auto_204192 ) ) ( not ( = ?auto_204183 ?auto_204184 ) ) ( not ( = ?auto_204183 ?auto_204185 ) ) ( not ( = ?auto_204183 ?auto_204186 ) ) ( not ( = ?auto_204183 ?auto_204187 ) ) ( not ( = ?auto_204183 ?auto_204188 ) ) ( not ( = ?auto_204183 ?auto_204189 ) ) ( not ( = ?auto_204183 ?auto_204190 ) ) ( not ( = ?auto_204183 ?auto_204191 ) ) ( not ( = ?auto_204183 ?auto_204192 ) ) ( not ( = ?auto_204184 ?auto_204185 ) ) ( not ( = ?auto_204184 ?auto_204186 ) ) ( not ( = ?auto_204184 ?auto_204187 ) ) ( not ( = ?auto_204184 ?auto_204188 ) ) ( not ( = ?auto_204184 ?auto_204189 ) ) ( not ( = ?auto_204184 ?auto_204190 ) ) ( not ( = ?auto_204184 ?auto_204191 ) ) ( not ( = ?auto_204184 ?auto_204192 ) ) ( not ( = ?auto_204185 ?auto_204186 ) ) ( not ( = ?auto_204185 ?auto_204187 ) ) ( not ( = ?auto_204185 ?auto_204188 ) ) ( not ( = ?auto_204185 ?auto_204189 ) ) ( not ( = ?auto_204185 ?auto_204190 ) ) ( not ( = ?auto_204185 ?auto_204191 ) ) ( not ( = ?auto_204185 ?auto_204192 ) ) ( not ( = ?auto_204186 ?auto_204187 ) ) ( not ( = ?auto_204186 ?auto_204188 ) ) ( not ( = ?auto_204186 ?auto_204189 ) ) ( not ( = ?auto_204186 ?auto_204190 ) ) ( not ( = ?auto_204186 ?auto_204191 ) ) ( not ( = ?auto_204186 ?auto_204192 ) ) ( not ( = ?auto_204187 ?auto_204188 ) ) ( not ( = ?auto_204187 ?auto_204189 ) ) ( not ( = ?auto_204187 ?auto_204190 ) ) ( not ( = ?auto_204187 ?auto_204191 ) ) ( not ( = ?auto_204187 ?auto_204192 ) ) ( not ( = ?auto_204188 ?auto_204189 ) ) ( not ( = ?auto_204188 ?auto_204190 ) ) ( not ( = ?auto_204188 ?auto_204191 ) ) ( not ( = ?auto_204188 ?auto_204192 ) ) ( not ( = ?auto_204189 ?auto_204190 ) ) ( not ( = ?auto_204189 ?auto_204191 ) ) ( not ( = ?auto_204189 ?auto_204192 ) ) ( not ( = ?auto_204190 ?auto_204191 ) ) ( not ( = ?auto_204190 ?auto_204192 ) ) ( not ( = ?auto_204191 ?auto_204192 ) ) ( ON ?auto_204190 ?auto_204191 ) ( ON ?auto_204189 ?auto_204190 ) ( ON ?auto_204188 ?auto_204189 ) ( ON ?auto_204187 ?auto_204188 ) ( CLEAR ?auto_204185 ) ( ON ?auto_204186 ?auto_204187 ) ( CLEAR ?auto_204186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204182 ?auto_204183 ?auto_204184 ?auto_204185 ?auto_204186 )
      ( MAKE-10PILE ?auto_204182 ?auto_204183 ?auto_204184 ?auto_204185 ?auto_204186 ?auto_204187 ?auto_204188 ?auto_204189 ?auto_204190 ?auto_204191 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204203 - BLOCK
      ?auto_204204 - BLOCK
      ?auto_204205 - BLOCK
      ?auto_204206 - BLOCK
      ?auto_204207 - BLOCK
      ?auto_204208 - BLOCK
      ?auto_204209 - BLOCK
      ?auto_204210 - BLOCK
      ?auto_204211 - BLOCK
      ?auto_204212 - BLOCK
    )
    :vars
    (
      ?auto_204213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204212 ?auto_204213 ) ( ON-TABLE ?auto_204203 ) ( ON ?auto_204204 ?auto_204203 ) ( ON ?auto_204205 ?auto_204204 ) ( not ( = ?auto_204203 ?auto_204204 ) ) ( not ( = ?auto_204203 ?auto_204205 ) ) ( not ( = ?auto_204203 ?auto_204206 ) ) ( not ( = ?auto_204203 ?auto_204207 ) ) ( not ( = ?auto_204203 ?auto_204208 ) ) ( not ( = ?auto_204203 ?auto_204209 ) ) ( not ( = ?auto_204203 ?auto_204210 ) ) ( not ( = ?auto_204203 ?auto_204211 ) ) ( not ( = ?auto_204203 ?auto_204212 ) ) ( not ( = ?auto_204203 ?auto_204213 ) ) ( not ( = ?auto_204204 ?auto_204205 ) ) ( not ( = ?auto_204204 ?auto_204206 ) ) ( not ( = ?auto_204204 ?auto_204207 ) ) ( not ( = ?auto_204204 ?auto_204208 ) ) ( not ( = ?auto_204204 ?auto_204209 ) ) ( not ( = ?auto_204204 ?auto_204210 ) ) ( not ( = ?auto_204204 ?auto_204211 ) ) ( not ( = ?auto_204204 ?auto_204212 ) ) ( not ( = ?auto_204204 ?auto_204213 ) ) ( not ( = ?auto_204205 ?auto_204206 ) ) ( not ( = ?auto_204205 ?auto_204207 ) ) ( not ( = ?auto_204205 ?auto_204208 ) ) ( not ( = ?auto_204205 ?auto_204209 ) ) ( not ( = ?auto_204205 ?auto_204210 ) ) ( not ( = ?auto_204205 ?auto_204211 ) ) ( not ( = ?auto_204205 ?auto_204212 ) ) ( not ( = ?auto_204205 ?auto_204213 ) ) ( not ( = ?auto_204206 ?auto_204207 ) ) ( not ( = ?auto_204206 ?auto_204208 ) ) ( not ( = ?auto_204206 ?auto_204209 ) ) ( not ( = ?auto_204206 ?auto_204210 ) ) ( not ( = ?auto_204206 ?auto_204211 ) ) ( not ( = ?auto_204206 ?auto_204212 ) ) ( not ( = ?auto_204206 ?auto_204213 ) ) ( not ( = ?auto_204207 ?auto_204208 ) ) ( not ( = ?auto_204207 ?auto_204209 ) ) ( not ( = ?auto_204207 ?auto_204210 ) ) ( not ( = ?auto_204207 ?auto_204211 ) ) ( not ( = ?auto_204207 ?auto_204212 ) ) ( not ( = ?auto_204207 ?auto_204213 ) ) ( not ( = ?auto_204208 ?auto_204209 ) ) ( not ( = ?auto_204208 ?auto_204210 ) ) ( not ( = ?auto_204208 ?auto_204211 ) ) ( not ( = ?auto_204208 ?auto_204212 ) ) ( not ( = ?auto_204208 ?auto_204213 ) ) ( not ( = ?auto_204209 ?auto_204210 ) ) ( not ( = ?auto_204209 ?auto_204211 ) ) ( not ( = ?auto_204209 ?auto_204212 ) ) ( not ( = ?auto_204209 ?auto_204213 ) ) ( not ( = ?auto_204210 ?auto_204211 ) ) ( not ( = ?auto_204210 ?auto_204212 ) ) ( not ( = ?auto_204210 ?auto_204213 ) ) ( not ( = ?auto_204211 ?auto_204212 ) ) ( not ( = ?auto_204211 ?auto_204213 ) ) ( not ( = ?auto_204212 ?auto_204213 ) ) ( ON ?auto_204211 ?auto_204212 ) ( ON ?auto_204210 ?auto_204211 ) ( ON ?auto_204209 ?auto_204210 ) ( ON ?auto_204208 ?auto_204209 ) ( ON ?auto_204207 ?auto_204208 ) ( CLEAR ?auto_204205 ) ( ON ?auto_204206 ?auto_204207 ) ( CLEAR ?auto_204206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204203 ?auto_204204 ?auto_204205 ?auto_204206 )
      ( MAKE-10PILE ?auto_204203 ?auto_204204 ?auto_204205 ?auto_204206 ?auto_204207 ?auto_204208 ?auto_204209 ?auto_204210 ?auto_204211 ?auto_204212 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204224 - BLOCK
      ?auto_204225 - BLOCK
      ?auto_204226 - BLOCK
      ?auto_204227 - BLOCK
      ?auto_204228 - BLOCK
      ?auto_204229 - BLOCK
      ?auto_204230 - BLOCK
      ?auto_204231 - BLOCK
      ?auto_204232 - BLOCK
      ?auto_204233 - BLOCK
    )
    :vars
    (
      ?auto_204234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204233 ?auto_204234 ) ( ON-TABLE ?auto_204224 ) ( ON ?auto_204225 ?auto_204224 ) ( ON ?auto_204226 ?auto_204225 ) ( not ( = ?auto_204224 ?auto_204225 ) ) ( not ( = ?auto_204224 ?auto_204226 ) ) ( not ( = ?auto_204224 ?auto_204227 ) ) ( not ( = ?auto_204224 ?auto_204228 ) ) ( not ( = ?auto_204224 ?auto_204229 ) ) ( not ( = ?auto_204224 ?auto_204230 ) ) ( not ( = ?auto_204224 ?auto_204231 ) ) ( not ( = ?auto_204224 ?auto_204232 ) ) ( not ( = ?auto_204224 ?auto_204233 ) ) ( not ( = ?auto_204224 ?auto_204234 ) ) ( not ( = ?auto_204225 ?auto_204226 ) ) ( not ( = ?auto_204225 ?auto_204227 ) ) ( not ( = ?auto_204225 ?auto_204228 ) ) ( not ( = ?auto_204225 ?auto_204229 ) ) ( not ( = ?auto_204225 ?auto_204230 ) ) ( not ( = ?auto_204225 ?auto_204231 ) ) ( not ( = ?auto_204225 ?auto_204232 ) ) ( not ( = ?auto_204225 ?auto_204233 ) ) ( not ( = ?auto_204225 ?auto_204234 ) ) ( not ( = ?auto_204226 ?auto_204227 ) ) ( not ( = ?auto_204226 ?auto_204228 ) ) ( not ( = ?auto_204226 ?auto_204229 ) ) ( not ( = ?auto_204226 ?auto_204230 ) ) ( not ( = ?auto_204226 ?auto_204231 ) ) ( not ( = ?auto_204226 ?auto_204232 ) ) ( not ( = ?auto_204226 ?auto_204233 ) ) ( not ( = ?auto_204226 ?auto_204234 ) ) ( not ( = ?auto_204227 ?auto_204228 ) ) ( not ( = ?auto_204227 ?auto_204229 ) ) ( not ( = ?auto_204227 ?auto_204230 ) ) ( not ( = ?auto_204227 ?auto_204231 ) ) ( not ( = ?auto_204227 ?auto_204232 ) ) ( not ( = ?auto_204227 ?auto_204233 ) ) ( not ( = ?auto_204227 ?auto_204234 ) ) ( not ( = ?auto_204228 ?auto_204229 ) ) ( not ( = ?auto_204228 ?auto_204230 ) ) ( not ( = ?auto_204228 ?auto_204231 ) ) ( not ( = ?auto_204228 ?auto_204232 ) ) ( not ( = ?auto_204228 ?auto_204233 ) ) ( not ( = ?auto_204228 ?auto_204234 ) ) ( not ( = ?auto_204229 ?auto_204230 ) ) ( not ( = ?auto_204229 ?auto_204231 ) ) ( not ( = ?auto_204229 ?auto_204232 ) ) ( not ( = ?auto_204229 ?auto_204233 ) ) ( not ( = ?auto_204229 ?auto_204234 ) ) ( not ( = ?auto_204230 ?auto_204231 ) ) ( not ( = ?auto_204230 ?auto_204232 ) ) ( not ( = ?auto_204230 ?auto_204233 ) ) ( not ( = ?auto_204230 ?auto_204234 ) ) ( not ( = ?auto_204231 ?auto_204232 ) ) ( not ( = ?auto_204231 ?auto_204233 ) ) ( not ( = ?auto_204231 ?auto_204234 ) ) ( not ( = ?auto_204232 ?auto_204233 ) ) ( not ( = ?auto_204232 ?auto_204234 ) ) ( not ( = ?auto_204233 ?auto_204234 ) ) ( ON ?auto_204232 ?auto_204233 ) ( ON ?auto_204231 ?auto_204232 ) ( ON ?auto_204230 ?auto_204231 ) ( ON ?auto_204229 ?auto_204230 ) ( ON ?auto_204228 ?auto_204229 ) ( CLEAR ?auto_204226 ) ( ON ?auto_204227 ?auto_204228 ) ( CLEAR ?auto_204227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204224 ?auto_204225 ?auto_204226 ?auto_204227 )
      ( MAKE-10PILE ?auto_204224 ?auto_204225 ?auto_204226 ?auto_204227 ?auto_204228 ?auto_204229 ?auto_204230 ?auto_204231 ?auto_204232 ?auto_204233 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204245 - BLOCK
      ?auto_204246 - BLOCK
      ?auto_204247 - BLOCK
      ?auto_204248 - BLOCK
      ?auto_204249 - BLOCK
      ?auto_204250 - BLOCK
      ?auto_204251 - BLOCK
      ?auto_204252 - BLOCK
      ?auto_204253 - BLOCK
      ?auto_204254 - BLOCK
    )
    :vars
    (
      ?auto_204255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204254 ?auto_204255 ) ( ON-TABLE ?auto_204245 ) ( ON ?auto_204246 ?auto_204245 ) ( not ( = ?auto_204245 ?auto_204246 ) ) ( not ( = ?auto_204245 ?auto_204247 ) ) ( not ( = ?auto_204245 ?auto_204248 ) ) ( not ( = ?auto_204245 ?auto_204249 ) ) ( not ( = ?auto_204245 ?auto_204250 ) ) ( not ( = ?auto_204245 ?auto_204251 ) ) ( not ( = ?auto_204245 ?auto_204252 ) ) ( not ( = ?auto_204245 ?auto_204253 ) ) ( not ( = ?auto_204245 ?auto_204254 ) ) ( not ( = ?auto_204245 ?auto_204255 ) ) ( not ( = ?auto_204246 ?auto_204247 ) ) ( not ( = ?auto_204246 ?auto_204248 ) ) ( not ( = ?auto_204246 ?auto_204249 ) ) ( not ( = ?auto_204246 ?auto_204250 ) ) ( not ( = ?auto_204246 ?auto_204251 ) ) ( not ( = ?auto_204246 ?auto_204252 ) ) ( not ( = ?auto_204246 ?auto_204253 ) ) ( not ( = ?auto_204246 ?auto_204254 ) ) ( not ( = ?auto_204246 ?auto_204255 ) ) ( not ( = ?auto_204247 ?auto_204248 ) ) ( not ( = ?auto_204247 ?auto_204249 ) ) ( not ( = ?auto_204247 ?auto_204250 ) ) ( not ( = ?auto_204247 ?auto_204251 ) ) ( not ( = ?auto_204247 ?auto_204252 ) ) ( not ( = ?auto_204247 ?auto_204253 ) ) ( not ( = ?auto_204247 ?auto_204254 ) ) ( not ( = ?auto_204247 ?auto_204255 ) ) ( not ( = ?auto_204248 ?auto_204249 ) ) ( not ( = ?auto_204248 ?auto_204250 ) ) ( not ( = ?auto_204248 ?auto_204251 ) ) ( not ( = ?auto_204248 ?auto_204252 ) ) ( not ( = ?auto_204248 ?auto_204253 ) ) ( not ( = ?auto_204248 ?auto_204254 ) ) ( not ( = ?auto_204248 ?auto_204255 ) ) ( not ( = ?auto_204249 ?auto_204250 ) ) ( not ( = ?auto_204249 ?auto_204251 ) ) ( not ( = ?auto_204249 ?auto_204252 ) ) ( not ( = ?auto_204249 ?auto_204253 ) ) ( not ( = ?auto_204249 ?auto_204254 ) ) ( not ( = ?auto_204249 ?auto_204255 ) ) ( not ( = ?auto_204250 ?auto_204251 ) ) ( not ( = ?auto_204250 ?auto_204252 ) ) ( not ( = ?auto_204250 ?auto_204253 ) ) ( not ( = ?auto_204250 ?auto_204254 ) ) ( not ( = ?auto_204250 ?auto_204255 ) ) ( not ( = ?auto_204251 ?auto_204252 ) ) ( not ( = ?auto_204251 ?auto_204253 ) ) ( not ( = ?auto_204251 ?auto_204254 ) ) ( not ( = ?auto_204251 ?auto_204255 ) ) ( not ( = ?auto_204252 ?auto_204253 ) ) ( not ( = ?auto_204252 ?auto_204254 ) ) ( not ( = ?auto_204252 ?auto_204255 ) ) ( not ( = ?auto_204253 ?auto_204254 ) ) ( not ( = ?auto_204253 ?auto_204255 ) ) ( not ( = ?auto_204254 ?auto_204255 ) ) ( ON ?auto_204253 ?auto_204254 ) ( ON ?auto_204252 ?auto_204253 ) ( ON ?auto_204251 ?auto_204252 ) ( ON ?auto_204250 ?auto_204251 ) ( ON ?auto_204249 ?auto_204250 ) ( ON ?auto_204248 ?auto_204249 ) ( CLEAR ?auto_204246 ) ( ON ?auto_204247 ?auto_204248 ) ( CLEAR ?auto_204247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204245 ?auto_204246 ?auto_204247 )
      ( MAKE-10PILE ?auto_204245 ?auto_204246 ?auto_204247 ?auto_204248 ?auto_204249 ?auto_204250 ?auto_204251 ?auto_204252 ?auto_204253 ?auto_204254 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204266 - BLOCK
      ?auto_204267 - BLOCK
      ?auto_204268 - BLOCK
      ?auto_204269 - BLOCK
      ?auto_204270 - BLOCK
      ?auto_204271 - BLOCK
      ?auto_204272 - BLOCK
      ?auto_204273 - BLOCK
      ?auto_204274 - BLOCK
      ?auto_204275 - BLOCK
    )
    :vars
    (
      ?auto_204276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204275 ?auto_204276 ) ( ON-TABLE ?auto_204266 ) ( ON ?auto_204267 ?auto_204266 ) ( not ( = ?auto_204266 ?auto_204267 ) ) ( not ( = ?auto_204266 ?auto_204268 ) ) ( not ( = ?auto_204266 ?auto_204269 ) ) ( not ( = ?auto_204266 ?auto_204270 ) ) ( not ( = ?auto_204266 ?auto_204271 ) ) ( not ( = ?auto_204266 ?auto_204272 ) ) ( not ( = ?auto_204266 ?auto_204273 ) ) ( not ( = ?auto_204266 ?auto_204274 ) ) ( not ( = ?auto_204266 ?auto_204275 ) ) ( not ( = ?auto_204266 ?auto_204276 ) ) ( not ( = ?auto_204267 ?auto_204268 ) ) ( not ( = ?auto_204267 ?auto_204269 ) ) ( not ( = ?auto_204267 ?auto_204270 ) ) ( not ( = ?auto_204267 ?auto_204271 ) ) ( not ( = ?auto_204267 ?auto_204272 ) ) ( not ( = ?auto_204267 ?auto_204273 ) ) ( not ( = ?auto_204267 ?auto_204274 ) ) ( not ( = ?auto_204267 ?auto_204275 ) ) ( not ( = ?auto_204267 ?auto_204276 ) ) ( not ( = ?auto_204268 ?auto_204269 ) ) ( not ( = ?auto_204268 ?auto_204270 ) ) ( not ( = ?auto_204268 ?auto_204271 ) ) ( not ( = ?auto_204268 ?auto_204272 ) ) ( not ( = ?auto_204268 ?auto_204273 ) ) ( not ( = ?auto_204268 ?auto_204274 ) ) ( not ( = ?auto_204268 ?auto_204275 ) ) ( not ( = ?auto_204268 ?auto_204276 ) ) ( not ( = ?auto_204269 ?auto_204270 ) ) ( not ( = ?auto_204269 ?auto_204271 ) ) ( not ( = ?auto_204269 ?auto_204272 ) ) ( not ( = ?auto_204269 ?auto_204273 ) ) ( not ( = ?auto_204269 ?auto_204274 ) ) ( not ( = ?auto_204269 ?auto_204275 ) ) ( not ( = ?auto_204269 ?auto_204276 ) ) ( not ( = ?auto_204270 ?auto_204271 ) ) ( not ( = ?auto_204270 ?auto_204272 ) ) ( not ( = ?auto_204270 ?auto_204273 ) ) ( not ( = ?auto_204270 ?auto_204274 ) ) ( not ( = ?auto_204270 ?auto_204275 ) ) ( not ( = ?auto_204270 ?auto_204276 ) ) ( not ( = ?auto_204271 ?auto_204272 ) ) ( not ( = ?auto_204271 ?auto_204273 ) ) ( not ( = ?auto_204271 ?auto_204274 ) ) ( not ( = ?auto_204271 ?auto_204275 ) ) ( not ( = ?auto_204271 ?auto_204276 ) ) ( not ( = ?auto_204272 ?auto_204273 ) ) ( not ( = ?auto_204272 ?auto_204274 ) ) ( not ( = ?auto_204272 ?auto_204275 ) ) ( not ( = ?auto_204272 ?auto_204276 ) ) ( not ( = ?auto_204273 ?auto_204274 ) ) ( not ( = ?auto_204273 ?auto_204275 ) ) ( not ( = ?auto_204273 ?auto_204276 ) ) ( not ( = ?auto_204274 ?auto_204275 ) ) ( not ( = ?auto_204274 ?auto_204276 ) ) ( not ( = ?auto_204275 ?auto_204276 ) ) ( ON ?auto_204274 ?auto_204275 ) ( ON ?auto_204273 ?auto_204274 ) ( ON ?auto_204272 ?auto_204273 ) ( ON ?auto_204271 ?auto_204272 ) ( ON ?auto_204270 ?auto_204271 ) ( ON ?auto_204269 ?auto_204270 ) ( CLEAR ?auto_204267 ) ( ON ?auto_204268 ?auto_204269 ) ( CLEAR ?auto_204268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204266 ?auto_204267 ?auto_204268 )
      ( MAKE-10PILE ?auto_204266 ?auto_204267 ?auto_204268 ?auto_204269 ?auto_204270 ?auto_204271 ?auto_204272 ?auto_204273 ?auto_204274 ?auto_204275 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204287 - BLOCK
      ?auto_204288 - BLOCK
      ?auto_204289 - BLOCK
      ?auto_204290 - BLOCK
      ?auto_204291 - BLOCK
      ?auto_204292 - BLOCK
      ?auto_204293 - BLOCK
      ?auto_204294 - BLOCK
      ?auto_204295 - BLOCK
      ?auto_204296 - BLOCK
    )
    :vars
    (
      ?auto_204297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204296 ?auto_204297 ) ( ON-TABLE ?auto_204287 ) ( not ( = ?auto_204287 ?auto_204288 ) ) ( not ( = ?auto_204287 ?auto_204289 ) ) ( not ( = ?auto_204287 ?auto_204290 ) ) ( not ( = ?auto_204287 ?auto_204291 ) ) ( not ( = ?auto_204287 ?auto_204292 ) ) ( not ( = ?auto_204287 ?auto_204293 ) ) ( not ( = ?auto_204287 ?auto_204294 ) ) ( not ( = ?auto_204287 ?auto_204295 ) ) ( not ( = ?auto_204287 ?auto_204296 ) ) ( not ( = ?auto_204287 ?auto_204297 ) ) ( not ( = ?auto_204288 ?auto_204289 ) ) ( not ( = ?auto_204288 ?auto_204290 ) ) ( not ( = ?auto_204288 ?auto_204291 ) ) ( not ( = ?auto_204288 ?auto_204292 ) ) ( not ( = ?auto_204288 ?auto_204293 ) ) ( not ( = ?auto_204288 ?auto_204294 ) ) ( not ( = ?auto_204288 ?auto_204295 ) ) ( not ( = ?auto_204288 ?auto_204296 ) ) ( not ( = ?auto_204288 ?auto_204297 ) ) ( not ( = ?auto_204289 ?auto_204290 ) ) ( not ( = ?auto_204289 ?auto_204291 ) ) ( not ( = ?auto_204289 ?auto_204292 ) ) ( not ( = ?auto_204289 ?auto_204293 ) ) ( not ( = ?auto_204289 ?auto_204294 ) ) ( not ( = ?auto_204289 ?auto_204295 ) ) ( not ( = ?auto_204289 ?auto_204296 ) ) ( not ( = ?auto_204289 ?auto_204297 ) ) ( not ( = ?auto_204290 ?auto_204291 ) ) ( not ( = ?auto_204290 ?auto_204292 ) ) ( not ( = ?auto_204290 ?auto_204293 ) ) ( not ( = ?auto_204290 ?auto_204294 ) ) ( not ( = ?auto_204290 ?auto_204295 ) ) ( not ( = ?auto_204290 ?auto_204296 ) ) ( not ( = ?auto_204290 ?auto_204297 ) ) ( not ( = ?auto_204291 ?auto_204292 ) ) ( not ( = ?auto_204291 ?auto_204293 ) ) ( not ( = ?auto_204291 ?auto_204294 ) ) ( not ( = ?auto_204291 ?auto_204295 ) ) ( not ( = ?auto_204291 ?auto_204296 ) ) ( not ( = ?auto_204291 ?auto_204297 ) ) ( not ( = ?auto_204292 ?auto_204293 ) ) ( not ( = ?auto_204292 ?auto_204294 ) ) ( not ( = ?auto_204292 ?auto_204295 ) ) ( not ( = ?auto_204292 ?auto_204296 ) ) ( not ( = ?auto_204292 ?auto_204297 ) ) ( not ( = ?auto_204293 ?auto_204294 ) ) ( not ( = ?auto_204293 ?auto_204295 ) ) ( not ( = ?auto_204293 ?auto_204296 ) ) ( not ( = ?auto_204293 ?auto_204297 ) ) ( not ( = ?auto_204294 ?auto_204295 ) ) ( not ( = ?auto_204294 ?auto_204296 ) ) ( not ( = ?auto_204294 ?auto_204297 ) ) ( not ( = ?auto_204295 ?auto_204296 ) ) ( not ( = ?auto_204295 ?auto_204297 ) ) ( not ( = ?auto_204296 ?auto_204297 ) ) ( ON ?auto_204295 ?auto_204296 ) ( ON ?auto_204294 ?auto_204295 ) ( ON ?auto_204293 ?auto_204294 ) ( ON ?auto_204292 ?auto_204293 ) ( ON ?auto_204291 ?auto_204292 ) ( ON ?auto_204290 ?auto_204291 ) ( ON ?auto_204289 ?auto_204290 ) ( CLEAR ?auto_204287 ) ( ON ?auto_204288 ?auto_204289 ) ( CLEAR ?auto_204288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204287 ?auto_204288 )
      ( MAKE-10PILE ?auto_204287 ?auto_204288 ?auto_204289 ?auto_204290 ?auto_204291 ?auto_204292 ?auto_204293 ?auto_204294 ?auto_204295 ?auto_204296 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204308 - BLOCK
      ?auto_204309 - BLOCK
      ?auto_204310 - BLOCK
      ?auto_204311 - BLOCK
      ?auto_204312 - BLOCK
      ?auto_204313 - BLOCK
      ?auto_204314 - BLOCK
      ?auto_204315 - BLOCK
      ?auto_204316 - BLOCK
      ?auto_204317 - BLOCK
    )
    :vars
    (
      ?auto_204318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204317 ?auto_204318 ) ( ON-TABLE ?auto_204308 ) ( not ( = ?auto_204308 ?auto_204309 ) ) ( not ( = ?auto_204308 ?auto_204310 ) ) ( not ( = ?auto_204308 ?auto_204311 ) ) ( not ( = ?auto_204308 ?auto_204312 ) ) ( not ( = ?auto_204308 ?auto_204313 ) ) ( not ( = ?auto_204308 ?auto_204314 ) ) ( not ( = ?auto_204308 ?auto_204315 ) ) ( not ( = ?auto_204308 ?auto_204316 ) ) ( not ( = ?auto_204308 ?auto_204317 ) ) ( not ( = ?auto_204308 ?auto_204318 ) ) ( not ( = ?auto_204309 ?auto_204310 ) ) ( not ( = ?auto_204309 ?auto_204311 ) ) ( not ( = ?auto_204309 ?auto_204312 ) ) ( not ( = ?auto_204309 ?auto_204313 ) ) ( not ( = ?auto_204309 ?auto_204314 ) ) ( not ( = ?auto_204309 ?auto_204315 ) ) ( not ( = ?auto_204309 ?auto_204316 ) ) ( not ( = ?auto_204309 ?auto_204317 ) ) ( not ( = ?auto_204309 ?auto_204318 ) ) ( not ( = ?auto_204310 ?auto_204311 ) ) ( not ( = ?auto_204310 ?auto_204312 ) ) ( not ( = ?auto_204310 ?auto_204313 ) ) ( not ( = ?auto_204310 ?auto_204314 ) ) ( not ( = ?auto_204310 ?auto_204315 ) ) ( not ( = ?auto_204310 ?auto_204316 ) ) ( not ( = ?auto_204310 ?auto_204317 ) ) ( not ( = ?auto_204310 ?auto_204318 ) ) ( not ( = ?auto_204311 ?auto_204312 ) ) ( not ( = ?auto_204311 ?auto_204313 ) ) ( not ( = ?auto_204311 ?auto_204314 ) ) ( not ( = ?auto_204311 ?auto_204315 ) ) ( not ( = ?auto_204311 ?auto_204316 ) ) ( not ( = ?auto_204311 ?auto_204317 ) ) ( not ( = ?auto_204311 ?auto_204318 ) ) ( not ( = ?auto_204312 ?auto_204313 ) ) ( not ( = ?auto_204312 ?auto_204314 ) ) ( not ( = ?auto_204312 ?auto_204315 ) ) ( not ( = ?auto_204312 ?auto_204316 ) ) ( not ( = ?auto_204312 ?auto_204317 ) ) ( not ( = ?auto_204312 ?auto_204318 ) ) ( not ( = ?auto_204313 ?auto_204314 ) ) ( not ( = ?auto_204313 ?auto_204315 ) ) ( not ( = ?auto_204313 ?auto_204316 ) ) ( not ( = ?auto_204313 ?auto_204317 ) ) ( not ( = ?auto_204313 ?auto_204318 ) ) ( not ( = ?auto_204314 ?auto_204315 ) ) ( not ( = ?auto_204314 ?auto_204316 ) ) ( not ( = ?auto_204314 ?auto_204317 ) ) ( not ( = ?auto_204314 ?auto_204318 ) ) ( not ( = ?auto_204315 ?auto_204316 ) ) ( not ( = ?auto_204315 ?auto_204317 ) ) ( not ( = ?auto_204315 ?auto_204318 ) ) ( not ( = ?auto_204316 ?auto_204317 ) ) ( not ( = ?auto_204316 ?auto_204318 ) ) ( not ( = ?auto_204317 ?auto_204318 ) ) ( ON ?auto_204316 ?auto_204317 ) ( ON ?auto_204315 ?auto_204316 ) ( ON ?auto_204314 ?auto_204315 ) ( ON ?auto_204313 ?auto_204314 ) ( ON ?auto_204312 ?auto_204313 ) ( ON ?auto_204311 ?auto_204312 ) ( ON ?auto_204310 ?auto_204311 ) ( CLEAR ?auto_204308 ) ( ON ?auto_204309 ?auto_204310 ) ( CLEAR ?auto_204309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204308 ?auto_204309 )
      ( MAKE-10PILE ?auto_204308 ?auto_204309 ?auto_204310 ?auto_204311 ?auto_204312 ?auto_204313 ?auto_204314 ?auto_204315 ?auto_204316 ?auto_204317 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204329 - BLOCK
      ?auto_204330 - BLOCK
      ?auto_204331 - BLOCK
      ?auto_204332 - BLOCK
      ?auto_204333 - BLOCK
      ?auto_204334 - BLOCK
      ?auto_204335 - BLOCK
      ?auto_204336 - BLOCK
      ?auto_204337 - BLOCK
      ?auto_204338 - BLOCK
    )
    :vars
    (
      ?auto_204339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204338 ?auto_204339 ) ( not ( = ?auto_204329 ?auto_204330 ) ) ( not ( = ?auto_204329 ?auto_204331 ) ) ( not ( = ?auto_204329 ?auto_204332 ) ) ( not ( = ?auto_204329 ?auto_204333 ) ) ( not ( = ?auto_204329 ?auto_204334 ) ) ( not ( = ?auto_204329 ?auto_204335 ) ) ( not ( = ?auto_204329 ?auto_204336 ) ) ( not ( = ?auto_204329 ?auto_204337 ) ) ( not ( = ?auto_204329 ?auto_204338 ) ) ( not ( = ?auto_204329 ?auto_204339 ) ) ( not ( = ?auto_204330 ?auto_204331 ) ) ( not ( = ?auto_204330 ?auto_204332 ) ) ( not ( = ?auto_204330 ?auto_204333 ) ) ( not ( = ?auto_204330 ?auto_204334 ) ) ( not ( = ?auto_204330 ?auto_204335 ) ) ( not ( = ?auto_204330 ?auto_204336 ) ) ( not ( = ?auto_204330 ?auto_204337 ) ) ( not ( = ?auto_204330 ?auto_204338 ) ) ( not ( = ?auto_204330 ?auto_204339 ) ) ( not ( = ?auto_204331 ?auto_204332 ) ) ( not ( = ?auto_204331 ?auto_204333 ) ) ( not ( = ?auto_204331 ?auto_204334 ) ) ( not ( = ?auto_204331 ?auto_204335 ) ) ( not ( = ?auto_204331 ?auto_204336 ) ) ( not ( = ?auto_204331 ?auto_204337 ) ) ( not ( = ?auto_204331 ?auto_204338 ) ) ( not ( = ?auto_204331 ?auto_204339 ) ) ( not ( = ?auto_204332 ?auto_204333 ) ) ( not ( = ?auto_204332 ?auto_204334 ) ) ( not ( = ?auto_204332 ?auto_204335 ) ) ( not ( = ?auto_204332 ?auto_204336 ) ) ( not ( = ?auto_204332 ?auto_204337 ) ) ( not ( = ?auto_204332 ?auto_204338 ) ) ( not ( = ?auto_204332 ?auto_204339 ) ) ( not ( = ?auto_204333 ?auto_204334 ) ) ( not ( = ?auto_204333 ?auto_204335 ) ) ( not ( = ?auto_204333 ?auto_204336 ) ) ( not ( = ?auto_204333 ?auto_204337 ) ) ( not ( = ?auto_204333 ?auto_204338 ) ) ( not ( = ?auto_204333 ?auto_204339 ) ) ( not ( = ?auto_204334 ?auto_204335 ) ) ( not ( = ?auto_204334 ?auto_204336 ) ) ( not ( = ?auto_204334 ?auto_204337 ) ) ( not ( = ?auto_204334 ?auto_204338 ) ) ( not ( = ?auto_204334 ?auto_204339 ) ) ( not ( = ?auto_204335 ?auto_204336 ) ) ( not ( = ?auto_204335 ?auto_204337 ) ) ( not ( = ?auto_204335 ?auto_204338 ) ) ( not ( = ?auto_204335 ?auto_204339 ) ) ( not ( = ?auto_204336 ?auto_204337 ) ) ( not ( = ?auto_204336 ?auto_204338 ) ) ( not ( = ?auto_204336 ?auto_204339 ) ) ( not ( = ?auto_204337 ?auto_204338 ) ) ( not ( = ?auto_204337 ?auto_204339 ) ) ( not ( = ?auto_204338 ?auto_204339 ) ) ( ON ?auto_204337 ?auto_204338 ) ( ON ?auto_204336 ?auto_204337 ) ( ON ?auto_204335 ?auto_204336 ) ( ON ?auto_204334 ?auto_204335 ) ( ON ?auto_204333 ?auto_204334 ) ( ON ?auto_204332 ?auto_204333 ) ( ON ?auto_204331 ?auto_204332 ) ( ON ?auto_204330 ?auto_204331 ) ( ON ?auto_204329 ?auto_204330 ) ( CLEAR ?auto_204329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204329 )
      ( MAKE-10PILE ?auto_204329 ?auto_204330 ?auto_204331 ?auto_204332 ?auto_204333 ?auto_204334 ?auto_204335 ?auto_204336 ?auto_204337 ?auto_204338 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_204350 - BLOCK
      ?auto_204351 - BLOCK
      ?auto_204352 - BLOCK
      ?auto_204353 - BLOCK
      ?auto_204354 - BLOCK
      ?auto_204355 - BLOCK
      ?auto_204356 - BLOCK
      ?auto_204357 - BLOCK
      ?auto_204358 - BLOCK
      ?auto_204359 - BLOCK
    )
    :vars
    (
      ?auto_204360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204359 ?auto_204360 ) ( not ( = ?auto_204350 ?auto_204351 ) ) ( not ( = ?auto_204350 ?auto_204352 ) ) ( not ( = ?auto_204350 ?auto_204353 ) ) ( not ( = ?auto_204350 ?auto_204354 ) ) ( not ( = ?auto_204350 ?auto_204355 ) ) ( not ( = ?auto_204350 ?auto_204356 ) ) ( not ( = ?auto_204350 ?auto_204357 ) ) ( not ( = ?auto_204350 ?auto_204358 ) ) ( not ( = ?auto_204350 ?auto_204359 ) ) ( not ( = ?auto_204350 ?auto_204360 ) ) ( not ( = ?auto_204351 ?auto_204352 ) ) ( not ( = ?auto_204351 ?auto_204353 ) ) ( not ( = ?auto_204351 ?auto_204354 ) ) ( not ( = ?auto_204351 ?auto_204355 ) ) ( not ( = ?auto_204351 ?auto_204356 ) ) ( not ( = ?auto_204351 ?auto_204357 ) ) ( not ( = ?auto_204351 ?auto_204358 ) ) ( not ( = ?auto_204351 ?auto_204359 ) ) ( not ( = ?auto_204351 ?auto_204360 ) ) ( not ( = ?auto_204352 ?auto_204353 ) ) ( not ( = ?auto_204352 ?auto_204354 ) ) ( not ( = ?auto_204352 ?auto_204355 ) ) ( not ( = ?auto_204352 ?auto_204356 ) ) ( not ( = ?auto_204352 ?auto_204357 ) ) ( not ( = ?auto_204352 ?auto_204358 ) ) ( not ( = ?auto_204352 ?auto_204359 ) ) ( not ( = ?auto_204352 ?auto_204360 ) ) ( not ( = ?auto_204353 ?auto_204354 ) ) ( not ( = ?auto_204353 ?auto_204355 ) ) ( not ( = ?auto_204353 ?auto_204356 ) ) ( not ( = ?auto_204353 ?auto_204357 ) ) ( not ( = ?auto_204353 ?auto_204358 ) ) ( not ( = ?auto_204353 ?auto_204359 ) ) ( not ( = ?auto_204353 ?auto_204360 ) ) ( not ( = ?auto_204354 ?auto_204355 ) ) ( not ( = ?auto_204354 ?auto_204356 ) ) ( not ( = ?auto_204354 ?auto_204357 ) ) ( not ( = ?auto_204354 ?auto_204358 ) ) ( not ( = ?auto_204354 ?auto_204359 ) ) ( not ( = ?auto_204354 ?auto_204360 ) ) ( not ( = ?auto_204355 ?auto_204356 ) ) ( not ( = ?auto_204355 ?auto_204357 ) ) ( not ( = ?auto_204355 ?auto_204358 ) ) ( not ( = ?auto_204355 ?auto_204359 ) ) ( not ( = ?auto_204355 ?auto_204360 ) ) ( not ( = ?auto_204356 ?auto_204357 ) ) ( not ( = ?auto_204356 ?auto_204358 ) ) ( not ( = ?auto_204356 ?auto_204359 ) ) ( not ( = ?auto_204356 ?auto_204360 ) ) ( not ( = ?auto_204357 ?auto_204358 ) ) ( not ( = ?auto_204357 ?auto_204359 ) ) ( not ( = ?auto_204357 ?auto_204360 ) ) ( not ( = ?auto_204358 ?auto_204359 ) ) ( not ( = ?auto_204358 ?auto_204360 ) ) ( not ( = ?auto_204359 ?auto_204360 ) ) ( ON ?auto_204358 ?auto_204359 ) ( ON ?auto_204357 ?auto_204358 ) ( ON ?auto_204356 ?auto_204357 ) ( ON ?auto_204355 ?auto_204356 ) ( ON ?auto_204354 ?auto_204355 ) ( ON ?auto_204353 ?auto_204354 ) ( ON ?auto_204352 ?auto_204353 ) ( ON ?auto_204351 ?auto_204352 ) ( ON ?auto_204350 ?auto_204351 ) ( CLEAR ?auto_204350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204350 )
      ( MAKE-10PILE ?auto_204350 ?auto_204351 ?auto_204352 ?auto_204353 ?auto_204354 ?auto_204355 ?auto_204356 ?auto_204357 ?auto_204358 ?auto_204359 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204372 - BLOCK
      ?auto_204373 - BLOCK
      ?auto_204374 - BLOCK
      ?auto_204375 - BLOCK
      ?auto_204376 - BLOCK
      ?auto_204377 - BLOCK
      ?auto_204378 - BLOCK
      ?auto_204379 - BLOCK
      ?auto_204380 - BLOCK
      ?auto_204381 - BLOCK
      ?auto_204382 - BLOCK
    )
    :vars
    (
      ?auto_204383 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_204381 ) ( ON ?auto_204382 ?auto_204383 ) ( CLEAR ?auto_204382 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204372 ) ( ON ?auto_204373 ?auto_204372 ) ( ON ?auto_204374 ?auto_204373 ) ( ON ?auto_204375 ?auto_204374 ) ( ON ?auto_204376 ?auto_204375 ) ( ON ?auto_204377 ?auto_204376 ) ( ON ?auto_204378 ?auto_204377 ) ( ON ?auto_204379 ?auto_204378 ) ( ON ?auto_204380 ?auto_204379 ) ( ON ?auto_204381 ?auto_204380 ) ( not ( = ?auto_204372 ?auto_204373 ) ) ( not ( = ?auto_204372 ?auto_204374 ) ) ( not ( = ?auto_204372 ?auto_204375 ) ) ( not ( = ?auto_204372 ?auto_204376 ) ) ( not ( = ?auto_204372 ?auto_204377 ) ) ( not ( = ?auto_204372 ?auto_204378 ) ) ( not ( = ?auto_204372 ?auto_204379 ) ) ( not ( = ?auto_204372 ?auto_204380 ) ) ( not ( = ?auto_204372 ?auto_204381 ) ) ( not ( = ?auto_204372 ?auto_204382 ) ) ( not ( = ?auto_204372 ?auto_204383 ) ) ( not ( = ?auto_204373 ?auto_204374 ) ) ( not ( = ?auto_204373 ?auto_204375 ) ) ( not ( = ?auto_204373 ?auto_204376 ) ) ( not ( = ?auto_204373 ?auto_204377 ) ) ( not ( = ?auto_204373 ?auto_204378 ) ) ( not ( = ?auto_204373 ?auto_204379 ) ) ( not ( = ?auto_204373 ?auto_204380 ) ) ( not ( = ?auto_204373 ?auto_204381 ) ) ( not ( = ?auto_204373 ?auto_204382 ) ) ( not ( = ?auto_204373 ?auto_204383 ) ) ( not ( = ?auto_204374 ?auto_204375 ) ) ( not ( = ?auto_204374 ?auto_204376 ) ) ( not ( = ?auto_204374 ?auto_204377 ) ) ( not ( = ?auto_204374 ?auto_204378 ) ) ( not ( = ?auto_204374 ?auto_204379 ) ) ( not ( = ?auto_204374 ?auto_204380 ) ) ( not ( = ?auto_204374 ?auto_204381 ) ) ( not ( = ?auto_204374 ?auto_204382 ) ) ( not ( = ?auto_204374 ?auto_204383 ) ) ( not ( = ?auto_204375 ?auto_204376 ) ) ( not ( = ?auto_204375 ?auto_204377 ) ) ( not ( = ?auto_204375 ?auto_204378 ) ) ( not ( = ?auto_204375 ?auto_204379 ) ) ( not ( = ?auto_204375 ?auto_204380 ) ) ( not ( = ?auto_204375 ?auto_204381 ) ) ( not ( = ?auto_204375 ?auto_204382 ) ) ( not ( = ?auto_204375 ?auto_204383 ) ) ( not ( = ?auto_204376 ?auto_204377 ) ) ( not ( = ?auto_204376 ?auto_204378 ) ) ( not ( = ?auto_204376 ?auto_204379 ) ) ( not ( = ?auto_204376 ?auto_204380 ) ) ( not ( = ?auto_204376 ?auto_204381 ) ) ( not ( = ?auto_204376 ?auto_204382 ) ) ( not ( = ?auto_204376 ?auto_204383 ) ) ( not ( = ?auto_204377 ?auto_204378 ) ) ( not ( = ?auto_204377 ?auto_204379 ) ) ( not ( = ?auto_204377 ?auto_204380 ) ) ( not ( = ?auto_204377 ?auto_204381 ) ) ( not ( = ?auto_204377 ?auto_204382 ) ) ( not ( = ?auto_204377 ?auto_204383 ) ) ( not ( = ?auto_204378 ?auto_204379 ) ) ( not ( = ?auto_204378 ?auto_204380 ) ) ( not ( = ?auto_204378 ?auto_204381 ) ) ( not ( = ?auto_204378 ?auto_204382 ) ) ( not ( = ?auto_204378 ?auto_204383 ) ) ( not ( = ?auto_204379 ?auto_204380 ) ) ( not ( = ?auto_204379 ?auto_204381 ) ) ( not ( = ?auto_204379 ?auto_204382 ) ) ( not ( = ?auto_204379 ?auto_204383 ) ) ( not ( = ?auto_204380 ?auto_204381 ) ) ( not ( = ?auto_204380 ?auto_204382 ) ) ( not ( = ?auto_204380 ?auto_204383 ) ) ( not ( = ?auto_204381 ?auto_204382 ) ) ( not ( = ?auto_204381 ?auto_204383 ) ) ( not ( = ?auto_204382 ?auto_204383 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204382 ?auto_204383 )
      ( !STACK ?auto_204382 ?auto_204381 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204395 - BLOCK
      ?auto_204396 - BLOCK
      ?auto_204397 - BLOCK
      ?auto_204398 - BLOCK
      ?auto_204399 - BLOCK
      ?auto_204400 - BLOCK
      ?auto_204401 - BLOCK
      ?auto_204402 - BLOCK
      ?auto_204403 - BLOCK
      ?auto_204404 - BLOCK
      ?auto_204405 - BLOCK
    )
    :vars
    (
      ?auto_204406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_204404 ) ( ON ?auto_204405 ?auto_204406 ) ( CLEAR ?auto_204405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204395 ) ( ON ?auto_204396 ?auto_204395 ) ( ON ?auto_204397 ?auto_204396 ) ( ON ?auto_204398 ?auto_204397 ) ( ON ?auto_204399 ?auto_204398 ) ( ON ?auto_204400 ?auto_204399 ) ( ON ?auto_204401 ?auto_204400 ) ( ON ?auto_204402 ?auto_204401 ) ( ON ?auto_204403 ?auto_204402 ) ( ON ?auto_204404 ?auto_204403 ) ( not ( = ?auto_204395 ?auto_204396 ) ) ( not ( = ?auto_204395 ?auto_204397 ) ) ( not ( = ?auto_204395 ?auto_204398 ) ) ( not ( = ?auto_204395 ?auto_204399 ) ) ( not ( = ?auto_204395 ?auto_204400 ) ) ( not ( = ?auto_204395 ?auto_204401 ) ) ( not ( = ?auto_204395 ?auto_204402 ) ) ( not ( = ?auto_204395 ?auto_204403 ) ) ( not ( = ?auto_204395 ?auto_204404 ) ) ( not ( = ?auto_204395 ?auto_204405 ) ) ( not ( = ?auto_204395 ?auto_204406 ) ) ( not ( = ?auto_204396 ?auto_204397 ) ) ( not ( = ?auto_204396 ?auto_204398 ) ) ( not ( = ?auto_204396 ?auto_204399 ) ) ( not ( = ?auto_204396 ?auto_204400 ) ) ( not ( = ?auto_204396 ?auto_204401 ) ) ( not ( = ?auto_204396 ?auto_204402 ) ) ( not ( = ?auto_204396 ?auto_204403 ) ) ( not ( = ?auto_204396 ?auto_204404 ) ) ( not ( = ?auto_204396 ?auto_204405 ) ) ( not ( = ?auto_204396 ?auto_204406 ) ) ( not ( = ?auto_204397 ?auto_204398 ) ) ( not ( = ?auto_204397 ?auto_204399 ) ) ( not ( = ?auto_204397 ?auto_204400 ) ) ( not ( = ?auto_204397 ?auto_204401 ) ) ( not ( = ?auto_204397 ?auto_204402 ) ) ( not ( = ?auto_204397 ?auto_204403 ) ) ( not ( = ?auto_204397 ?auto_204404 ) ) ( not ( = ?auto_204397 ?auto_204405 ) ) ( not ( = ?auto_204397 ?auto_204406 ) ) ( not ( = ?auto_204398 ?auto_204399 ) ) ( not ( = ?auto_204398 ?auto_204400 ) ) ( not ( = ?auto_204398 ?auto_204401 ) ) ( not ( = ?auto_204398 ?auto_204402 ) ) ( not ( = ?auto_204398 ?auto_204403 ) ) ( not ( = ?auto_204398 ?auto_204404 ) ) ( not ( = ?auto_204398 ?auto_204405 ) ) ( not ( = ?auto_204398 ?auto_204406 ) ) ( not ( = ?auto_204399 ?auto_204400 ) ) ( not ( = ?auto_204399 ?auto_204401 ) ) ( not ( = ?auto_204399 ?auto_204402 ) ) ( not ( = ?auto_204399 ?auto_204403 ) ) ( not ( = ?auto_204399 ?auto_204404 ) ) ( not ( = ?auto_204399 ?auto_204405 ) ) ( not ( = ?auto_204399 ?auto_204406 ) ) ( not ( = ?auto_204400 ?auto_204401 ) ) ( not ( = ?auto_204400 ?auto_204402 ) ) ( not ( = ?auto_204400 ?auto_204403 ) ) ( not ( = ?auto_204400 ?auto_204404 ) ) ( not ( = ?auto_204400 ?auto_204405 ) ) ( not ( = ?auto_204400 ?auto_204406 ) ) ( not ( = ?auto_204401 ?auto_204402 ) ) ( not ( = ?auto_204401 ?auto_204403 ) ) ( not ( = ?auto_204401 ?auto_204404 ) ) ( not ( = ?auto_204401 ?auto_204405 ) ) ( not ( = ?auto_204401 ?auto_204406 ) ) ( not ( = ?auto_204402 ?auto_204403 ) ) ( not ( = ?auto_204402 ?auto_204404 ) ) ( not ( = ?auto_204402 ?auto_204405 ) ) ( not ( = ?auto_204402 ?auto_204406 ) ) ( not ( = ?auto_204403 ?auto_204404 ) ) ( not ( = ?auto_204403 ?auto_204405 ) ) ( not ( = ?auto_204403 ?auto_204406 ) ) ( not ( = ?auto_204404 ?auto_204405 ) ) ( not ( = ?auto_204404 ?auto_204406 ) ) ( not ( = ?auto_204405 ?auto_204406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204405 ?auto_204406 )
      ( !STACK ?auto_204405 ?auto_204404 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204418 - BLOCK
      ?auto_204419 - BLOCK
      ?auto_204420 - BLOCK
      ?auto_204421 - BLOCK
      ?auto_204422 - BLOCK
      ?auto_204423 - BLOCK
      ?auto_204424 - BLOCK
      ?auto_204425 - BLOCK
      ?auto_204426 - BLOCK
      ?auto_204427 - BLOCK
      ?auto_204428 - BLOCK
    )
    :vars
    (
      ?auto_204429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204428 ?auto_204429 ) ( ON-TABLE ?auto_204418 ) ( ON ?auto_204419 ?auto_204418 ) ( ON ?auto_204420 ?auto_204419 ) ( ON ?auto_204421 ?auto_204420 ) ( ON ?auto_204422 ?auto_204421 ) ( ON ?auto_204423 ?auto_204422 ) ( ON ?auto_204424 ?auto_204423 ) ( ON ?auto_204425 ?auto_204424 ) ( ON ?auto_204426 ?auto_204425 ) ( not ( = ?auto_204418 ?auto_204419 ) ) ( not ( = ?auto_204418 ?auto_204420 ) ) ( not ( = ?auto_204418 ?auto_204421 ) ) ( not ( = ?auto_204418 ?auto_204422 ) ) ( not ( = ?auto_204418 ?auto_204423 ) ) ( not ( = ?auto_204418 ?auto_204424 ) ) ( not ( = ?auto_204418 ?auto_204425 ) ) ( not ( = ?auto_204418 ?auto_204426 ) ) ( not ( = ?auto_204418 ?auto_204427 ) ) ( not ( = ?auto_204418 ?auto_204428 ) ) ( not ( = ?auto_204418 ?auto_204429 ) ) ( not ( = ?auto_204419 ?auto_204420 ) ) ( not ( = ?auto_204419 ?auto_204421 ) ) ( not ( = ?auto_204419 ?auto_204422 ) ) ( not ( = ?auto_204419 ?auto_204423 ) ) ( not ( = ?auto_204419 ?auto_204424 ) ) ( not ( = ?auto_204419 ?auto_204425 ) ) ( not ( = ?auto_204419 ?auto_204426 ) ) ( not ( = ?auto_204419 ?auto_204427 ) ) ( not ( = ?auto_204419 ?auto_204428 ) ) ( not ( = ?auto_204419 ?auto_204429 ) ) ( not ( = ?auto_204420 ?auto_204421 ) ) ( not ( = ?auto_204420 ?auto_204422 ) ) ( not ( = ?auto_204420 ?auto_204423 ) ) ( not ( = ?auto_204420 ?auto_204424 ) ) ( not ( = ?auto_204420 ?auto_204425 ) ) ( not ( = ?auto_204420 ?auto_204426 ) ) ( not ( = ?auto_204420 ?auto_204427 ) ) ( not ( = ?auto_204420 ?auto_204428 ) ) ( not ( = ?auto_204420 ?auto_204429 ) ) ( not ( = ?auto_204421 ?auto_204422 ) ) ( not ( = ?auto_204421 ?auto_204423 ) ) ( not ( = ?auto_204421 ?auto_204424 ) ) ( not ( = ?auto_204421 ?auto_204425 ) ) ( not ( = ?auto_204421 ?auto_204426 ) ) ( not ( = ?auto_204421 ?auto_204427 ) ) ( not ( = ?auto_204421 ?auto_204428 ) ) ( not ( = ?auto_204421 ?auto_204429 ) ) ( not ( = ?auto_204422 ?auto_204423 ) ) ( not ( = ?auto_204422 ?auto_204424 ) ) ( not ( = ?auto_204422 ?auto_204425 ) ) ( not ( = ?auto_204422 ?auto_204426 ) ) ( not ( = ?auto_204422 ?auto_204427 ) ) ( not ( = ?auto_204422 ?auto_204428 ) ) ( not ( = ?auto_204422 ?auto_204429 ) ) ( not ( = ?auto_204423 ?auto_204424 ) ) ( not ( = ?auto_204423 ?auto_204425 ) ) ( not ( = ?auto_204423 ?auto_204426 ) ) ( not ( = ?auto_204423 ?auto_204427 ) ) ( not ( = ?auto_204423 ?auto_204428 ) ) ( not ( = ?auto_204423 ?auto_204429 ) ) ( not ( = ?auto_204424 ?auto_204425 ) ) ( not ( = ?auto_204424 ?auto_204426 ) ) ( not ( = ?auto_204424 ?auto_204427 ) ) ( not ( = ?auto_204424 ?auto_204428 ) ) ( not ( = ?auto_204424 ?auto_204429 ) ) ( not ( = ?auto_204425 ?auto_204426 ) ) ( not ( = ?auto_204425 ?auto_204427 ) ) ( not ( = ?auto_204425 ?auto_204428 ) ) ( not ( = ?auto_204425 ?auto_204429 ) ) ( not ( = ?auto_204426 ?auto_204427 ) ) ( not ( = ?auto_204426 ?auto_204428 ) ) ( not ( = ?auto_204426 ?auto_204429 ) ) ( not ( = ?auto_204427 ?auto_204428 ) ) ( not ( = ?auto_204427 ?auto_204429 ) ) ( not ( = ?auto_204428 ?auto_204429 ) ) ( CLEAR ?auto_204426 ) ( ON ?auto_204427 ?auto_204428 ) ( CLEAR ?auto_204427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_204418 ?auto_204419 ?auto_204420 ?auto_204421 ?auto_204422 ?auto_204423 ?auto_204424 ?auto_204425 ?auto_204426 ?auto_204427 )
      ( MAKE-11PILE ?auto_204418 ?auto_204419 ?auto_204420 ?auto_204421 ?auto_204422 ?auto_204423 ?auto_204424 ?auto_204425 ?auto_204426 ?auto_204427 ?auto_204428 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204441 - BLOCK
      ?auto_204442 - BLOCK
      ?auto_204443 - BLOCK
      ?auto_204444 - BLOCK
      ?auto_204445 - BLOCK
      ?auto_204446 - BLOCK
      ?auto_204447 - BLOCK
      ?auto_204448 - BLOCK
      ?auto_204449 - BLOCK
      ?auto_204450 - BLOCK
      ?auto_204451 - BLOCK
    )
    :vars
    (
      ?auto_204452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204451 ?auto_204452 ) ( ON-TABLE ?auto_204441 ) ( ON ?auto_204442 ?auto_204441 ) ( ON ?auto_204443 ?auto_204442 ) ( ON ?auto_204444 ?auto_204443 ) ( ON ?auto_204445 ?auto_204444 ) ( ON ?auto_204446 ?auto_204445 ) ( ON ?auto_204447 ?auto_204446 ) ( ON ?auto_204448 ?auto_204447 ) ( ON ?auto_204449 ?auto_204448 ) ( not ( = ?auto_204441 ?auto_204442 ) ) ( not ( = ?auto_204441 ?auto_204443 ) ) ( not ( = ?auto_204441 ?auto_204444 ) ) ( not ( = ?auto_204441 ?auto_204445 ) ) ( not ( = ?auto_204441 ?auto_204446 ) ) ( not ( = ?auto_204441 ?auto_204447 ) ) ( not ( = ?auto_204441 ?auto_204448 ) ) ( not ( = ?auto_204441 ?auto_204449 ) ) ( not ( = ?auto_204441 ?auto_204450 ) ) ( not ( = ?auto_204441 ?auto_204451 ) ) ( not ( = ?auto_204441 ?auto_204452 ) ) ( not ( = ?auto_204442 ?auto_204443 ) ) ( not ( = ?auto_204442 ?auto_204444 ) ) ( not ( = ?auto_204442 ?auto_204445 ) ) ( not ( = ?auto_204442 ?auto_204446 ) ) ( not ( = ?auto_204442 ?auto_204447 ) ) ( not ( = ?auto_204442 ?auto_204448 ) ) ( not ( = ?auto_204442 ?auto_204449 ) ) ( not ( = ?auto_204442 ?auto_204450 ) ) ( not ( = ?auto_204442 ?auto_204451 ) ) ( not ( = ?auto_204442 ?auto_204452 ) ) ( not ( = ?auto_204443 ?auto_204444 ) ) ( not ( = ?auto_204443 ?auto_204445 ) ) ( not ( = ?auto_204443 ?auto_204446 ) ) ( not ( = ?auto_204443 ?auto_204447 ) ) ( not ( = ?auto_204443 ?auto_204448 ) ) ( not ( = ?auto_204443 ?auto_204449 ) ) ( not ( = ?auto_204443 ?auto_204450 ) ) ( not ( = ?auto_204443 ?auto_204451 ) ) ( not ( = ?auto_204443 ?auto_204452 ) ) ( not ( = ?auto_204444 ?auto_204445 ) ) ( not ( = ?auto_204444 ?auto_204446 ) ) ( not ( = ?auto_204444 ?auto_204447 ) ) ( not ( = ?auto_204444 ?auto_204448 ) ) ( not ( = ?auto_204444 ?auto_204449 ) ) ( not ( = ?auto_204444 ?auto_204450 ) ) ( not ( = ?auto_204444 ?auto_204451 ) ) ( not ( = ?auto_204444 ?auto_204452 ) ) ( not ( = ?auto_204445 ?auto_204446 ) ) ( not ( = ?auto_204445 ?auto_204447 ) ) ( not ( = ?auto_204445 ?auto_204448 ) ) ( not ( = ?auto_204445 ?auto_204449 ) ) ( not ( = ?auto_204445 ?auto_204450 ) ) ( not ( = ?auto_204445 ?auto_204451 ) ) ( not ( = ?auto_204445 ?auto_204452 ) ) ( not ( = ?auto_204446 ?auto_204447 ) ) ( not ( = ?auto_204446 ?auto_204448 ) ) ( not ( = ?auto_204446 ?auto_204449 ) ) ( not ( = ?auto_204446 ?auto_204450 ) ) ( not ( = ?auto_204446 ?auto_204451 ) ) ( not ( = ?auto_204446 ?auto_204452 ) ) ( not ( = ?auto_204447 ?auto_204448 ) ) ( not ( = ?auto_204447 ?auto_204449 ) ) ( not ( = ?auto_204447 ?auto_204450 ) ) ( not ( = ?auto_204447 ?auto_204451 ) ) ( not ( = ?auto_204447 ?auto_204452 ) ) ( not ( = ?auto_204448 ?auto_204449 ) ) ( not ( = ?auto_204448 ?auto_204450 ) ) ( not ( = ?auto_204448 ?auto_204451 ) ) ( not ( = ?auto_204448 ?auto_204452 ) ) ( not ( = ?auto_204449 ?auto_204450 ) ) ( not ( = ?auto_204449 ?auto_204451 ) ) ( not ( = ?auto_204449 ?auto_204452 ) ) ( not ( = ?auto_204450 ?auto_204451 ) ) ( not ( = ?auto_204450 ?auto_204452 ) ) ( not ( = ?auto_204451 ?auto_204452 ) ) ( CLEAR ?auto_204449 ) ( ON ?auto_204450 ?auto_204451 ) ( CLEAR ?auto_204450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_204441 ?auto_204442 ?auto_204443 ?auto_204444 ?auto_204445 ?auto_204446 ?auto_204447 ?auto_204448 ?auto_204449 ?auto_204450 )
      ( MAKE-11PILE ?auto_204441 ?auto_204442 ?auto_204443 ?auto_204444 ?auto_204445 ?auto_204446 ?auto_204447 ?auto_204448 ?auto_204449 ?auto_204450 ?auto_204451 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204464 - BLOCK
      ?auto_204465 - BLOCK
      ?auto_204466 - BLOCK
      ?auto_204467 - BLOCK
      ?auto_204468 - BLOCK
      ?auto_204469 - BLOCK
      ?auto_204470 - BLOCK
      ?auto_204471 - BLOCK
      ?auto_204472 - BLOCK
      ?auto_204473 - BLOCK
      ?auto_204474 - BLOCK
    )
    :vars
    (
      ?auto_204475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204474 ?auto_204475 ) ( ON-TABLE ?auto_204464 ) ( ON ?auto_204465 ?auto_204464 ) ( ON ?auto_204466 ?auto_204465 ) ( ON ?auto_204467 ?auto_204466 ) ( ON ?auto_204468 ?auto_204467 ) ( ON ?auto_204469 ?auto_204468 ) ( ON ?auto_204470 ?auto_204469 ) ( ON ?auto_204471 ?auto_204470 ) ( not ( = ?auto_204464 ?auto_204465 ) ) ( not ( = ?auto_204464 ?auto_204466 ) ) ( not ( = ?auto_204464 ?auto_204467 ) ) ( not ( = ?auto_204464 ?auto_204468 ) ) ( not ( = ?auto_204464 ?auto_204469 ) ) ( not ( = ?auto_204464 ?auto_204470 ) ) ( not ( = ?auto_204464 ?auto_204471 ) ) ( not ( = ?auto_204464 ?auto_204472 ) ) ( not ( = ?auto_204464 ?auto_204473 ) ) ( not ( = ?auto_204464 ?auto_204474 ) ) ( not ( = ?auto_204464 ?auto_204475 ) ) ( not ( = ?auto_204465 ?auto_204466 ) ) ( not ( = ?auto_204465 ?auto_204467 ) ) ( not ( = ?auto_204465 ?auto_204468 ) ) ( not ( = ?auto_204465 ?auto_204469 ) ) ( not ( = ?auto_204465 ?auto_204470 ) ) ( not ( = ?auto_204465 ?auto_204471 ) ) ( not ( = ?auto_204465 ?auto_204472 ) ) ( not ( = ?auto_204465 ?auto_204473 ) ) ( not ( = ?auto_204465 ?auto_204474 ) ) ( not ( = ?auto_204465 ?auto_204475 ) ) ( not ( = ?auto_204466 ?auto_204467 ) ) ( not ( = ?auto_204466 ?auto_204468 ) ) ( not ( = ?auto_204466 ?auto_204469 ) ) ( not ( = ?auto_204466 ?auto_204470 ) ) ( not ( = ?auto_204466 ?auto_204471 ) ) ( not ( = ?auto_204466 ?auto_204472 ) ) ( not ( = ?auto_204466 ?auto_204473 ) ) ( not ( = ?auto_204466 ?auto_204474 ) ) ( not ( = ?auto_204466 ?auto_204475 ) ) ( not ( = ?auto_204467 ?auto_204468 ) ) ( not ( = ?auto_204467 ?auto_204469 ) ) ( not ( = ?auto_204467 ?auto_204470 ) ) ( not ( = ?auto_204467 ?auto_204471 ) ) ( not ( = ?auto_204467 ?auto_204472 ) ) ( not ( = ?auto_204467 ?auto_204473 ) ) ( not ( = ?auto_204467 ?auto_204474 ) ) ( not ( = ?auto_204467 ?auto_204475 ) ) ( not ( = ?auto_204468 ?auto_204469 ) ) ( not ( = ?auto_204468 ?auto_204470 ) ) ( not ( = ?auto_204468 ?auto_204471 ) ) ( not ( = ?auto_204468 ?auto_204472 ) ) ( not ( = ?auto_204468 ?auto_204473 ) ) ( not ( = ?auto_204468 ?auto_204474 ) ) ( not ( = ?auto_204468 ?auto_204475 ) ) ( not ( = ?auto_204469 ?auto_204470 ) ) ( not ( = ?auto_204469 ?auto_204471 ) ) ( not ( = ?auto_204469 ?auto_204472 ) ) ( not ( = ?auto_204469 ?auto_204473 ) ) ( not ( = ?auto_204469 ?auto_204474 ) ) ( not ( = ?auto_204469 ?auto_204475 ) ) ( not ( = ?auto_204470 ?auto_204471 ) ) ( not ( = ?auto_204470 ?auto_204472 ) ) ( not ( = ?auto_204470 ?auto_204473 ) ) ( not ( = ?auto_204470 ?auto_204474 ) ) ( not ( = ?auto_204470 ?auto_204475 ) ) ( not ( = ?auto_204471 ?auto_204472 ) ) ( not ( = ?auto_204471 ?auto_204473 ) ) ( not ( = ?auto_204471 ?auto_204474 ) ) ( not ( = ?auto_204471 ?auto_204475 ) ) ( not ( = ?auto_204472 ?auto_204473 ) ) ( not ( = ?auto_204472 ?auto_204474 ) ) ( not ( = ?auto_204472 ?auto_204475 ) ) ( not ( = ?auto_204473 ?auto_204474 ) ) ( not ( = ?auto_204473 ?auto_204475 ) ) ( not ( = ?auto_204474 ?auto_204475 ) ) ( ON ?auto_204473 ?auto_204474 ) ( CLEAR ?auto_204471 ) ( ON ?auto_204472 ?auto_204473 ) ( CLEAR ?auto_204472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_204464 ?auto_204465 ?auto_204466 ?auto_204467 ?auto_204468 ?auto_204469 ?auto_204470 ?auto_204471 ?auto_204472 )
      ( MAKE-11PILE ?auto_204464 ?auto_204465 ?auto_204466 ?auto_204467 ?auto_204468 ?auto_204469 ?auto_204470 ?auto_204471 ?auto_204472 ?auto_204473 ?auto_204474 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204487 - BLOCK
      ?auto_204488 - BLOCK
      ?auto_204489 - BLOCK
      ?auto_204490 - BLOCK
      ?auto_204491 - BLOCK
      ?auto_204492 - BLOCK
      ?auto_204493 - BLOCK
      ?auto_204494 - BLOCK
      ?auto_204495 - BLOCK
      ?auto_204496 - BLOCK
      ?auto_204497 - BLOCK
    )
    :vars
    (
      ?auto_204498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204497 ?auto_204498 ) ( ON-TABLE ?auto_204487 ) ( ON ?auto_204488 ?auto_204487 ) ( ON ?auto_204489 ?auto_204488 ) ( ON ?auto_204490 ?auto_204489 ) ( ON ?auto_204491 ?auto_204490 ) ( ON ?auto_204492 ?auto_204491 ) ( ON ?auto_204493 ?auto_204492 ) ( ON ?auto_204494 ?auto_204493 ) ( not ( = ?auto_204487 ?auto_204488 ) ) ( not ( = ?auto_204487 ?auto_204489 ) ) ( not ( = ?auto_204487 ?auto_204490 ) ) ( not ( = ?auto_204487 ?auto_204491 ) ) ( not ( = ?auto_204487 ?auto_204492 ) ) ( not ( = ?auto_204487 ?auto_204493 ) ) ( not ( = ?auto_204487 ?auto_204494 ) ) ( not ( = ?auto_204487 ?auto_204495 ) ) ( not ( = ?auto_204487 ?auto_204496 ) ) ( not ( = ?auto_204487 ?auto_204497 ) ) ( not ( = ?auto_204487 ?auto_204498 ) ) ( not ( = ?auto_204488 ?auto_204489 ) ) ( not ( = ?auto_204488 ?auto_204490 ) ) ( not ( = ?auto_204488 ?auto_204491 ) ) ( not ( = ?auto_204488 ?auto_204492 ) ) ( not ( = ?auto_204488 ?auto_204493 ) ) ( not ( = ?auto_204488 ?auto_204494 ) ) ( not ( = ?auto_204488 ?auto_204495 ) ) ( not ( = ?auto_204488 ?auto_204496 ) ) ( not ( = ?auto_204488 ?auto_204497 ) ) ( not ( = ?auto_204488 ?auto_204498 ) ) ( not ( = ?auto_204489 ?auto_204490 ) ) ( not ( = ?auto_204489 ?auto_204491 ) ) ( not ( = ?auto_204489 ?auto_204492 ) ) ( not ( = ?auto_204489 ?auto_204493 ) ) ( not ( = ?auto_204489 ?auto_204494 ) ) ( not ( = ?auto_204489 ?auto_204495 ) ) ( not ( = ?auto_204489 ?auto_204496 ) ) ( not ( = ?auto_204489 ?auto_204497 ) ) ( not ( = ?auto_204489 ?auto_204498 ) ) ( not ( = ?auto_204490 ?auto_204491 ) ) ( not ( = ?auto_204490 ?auto_204492 ) ) ( not ( = ?auto_204490 ?auto_204493 ) ) ( not ( = ?auto_204490 ?auto_204494 ) ) ( not ( = ?auto_204490 ?auto_204495 ) ) ( not ( = ?auto_204490 ?auto_204496 ) ) ( not ( = ?auto_204490 ?auto_204497 ) ) ( not ( = ?auto_204490 ?auto_204498 ) ) ( not ( = ?auto_204491 ?auto_204492 ) ) ( not ( = ?auto_204491 ?auto_204493 ) ) ( not ( = ?auto_204491 ?auto_204494 ) ) ( not ( = ?auto_204491 ?auto_204495 ) ) ( not ( = ?auto_204491 ?auto_204496 ) ) ( not ( = ?auto_204491 ?auto_204497 ) ) ( not ( = ?auto_204491 ?auto_204498 ) ) ( not ( = ?auto_204492 ?auto_204493 ) ) ( not ( = ?auto_204492 ?auto_204494 ) ) ( not ( = ?auto_204492 ?auto_204495 ) ) ( not ( = ?auto_204492 ?auto_204496 ) ) ( not ( = ?auto_204492 ?auto_204497 ) ) ( not ( = ?auto_204492 ?auto_204498 ) ) ( not ( = ?auto_204493 ?auto_204494 ) ) ( not ( = ?auto_204493 ?auto_204495 ) ) ( not ( = ?auto_204493 ?auto_204496 ) ) ( not ( = ?auto_204493 ?auto_204497 ) ) ( not ( = ?auto_204493 ?auto_204498 ) ) ( not ( = ?auto_204494 ?auto_204495 ) ) ( not ( = ?auto_204494 ?auto_204496 ) ) ( not ( = ?auto_204494 ?auto_204497 ) ) ( not ( = ?auto_204494 ?auto_204498 ) ) ( not ( = ?auto_204495 ?auto_204496 ) ) ( not ( = ?auto_204495 ?auto_204497 ) ) ( not ( = ?auto_204495 ?auto_204498 ) ) ( not ( = ?auto_204496 ?auto_204497 ) ) ( not ( = ?auto_204496 ?auto_204498 ) ) ( not ( = ?auto_204497 ?auto_204498 ) ) ( ON ?auto_204496 ?auto_204497 ) ( CLEAR ?auto_204494 ) ( ON ?auto_204495 ?auto_204496 ) ( CLEAR ?auto_204495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_204487 ?auto_204488 ?auto_204489 ?auto_204490 ?auto_204491 ?auto_204492 ?auto_204493 ?auto_204494 ?auto_204495 )
      ( MAKE-11PILE ?auto_204487 ?auto_204488 ?auto_204489 ?auto_204490 ?auto_204491 ?auto_204492 ?auto_204493 ?auto_204494 ?auto_204495 ?auto_204496 ?auto_204497 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204510 - BLOCK
      ?auto_204511 - BLOCK
      ?auto_204512 - BLOCK
      ?auto_204513 - BLOCK
      ?auto_204514 - BLOCK
      ?auto_204515 - BLOCK
      ?auto_204516 - BLOCK
      ?auto_204517 - BLOCK
      ?auto_204518 - BLOCK
      ?auto_204519 - BLOCK
      ?auto_204520 - BLOCK
    )
    :vars
    (
      ?auto_204521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204520 ?auto_204521 ) ( ON-TABLE ?auto_204510 ) ( ON ?auto_204511 ?auto_204510 ) ( ON ?auto_204512 ?auto_204511 ) ( ON ?auto_204513 ?auto_204512 ) ( ON ?auto_204514 ?auto_204513 ) ( ON ?auto_204515 ?auto_204514 ) ( ON ?auto_204516 ?auto_204515 ) ( not ( = ?auto_204510 ?auto_204511 ) ) ( not ( = ?auto_204510 ?auto_204512 ) ) ( not ( = ?auto_204510 ?auto_204513 ) ) ( not ( = ?auto_204510 ?auto_204514 ) ) ( not ( = ?auto_204510 ?auto_204515 ) ) ( not ( = ?auto_204510 ?auto_204516 ) ) ( not ( = ?auto_204510 ?auto_204517 ) ) ( not ( = ?auto_204510 ?auto_204518 ) ) ( not ( = ?auto_204510 ?auto_204519 ) ) ( not ( = ?auto_204510 ?auto_204520 ) ) ( not ( = ?auto_204510 ?auto_204521 ) ) ( not ( = ?auto_204511 ?auto_204512 ) ) ( not ( = ?auto_204511 ?auto_204513 ) ) ( not ( = ?auto_204511 ?auto_204514 ) ) ( not ( = ?auto_204511 ?auto_204515 ) ) ( not ( = ?auto_204511 ?auto_204516 ) ) ( not ( = ?auto_204511 ?auto_204517 ) ) ( not ( = ?auto_204511 ?auto_204518 ) ) ( not ( = ?auto_204511 ?auto_204519 ) ) ( not ( = ?auto_204511 ?auto_204520 ) ) ( not ( = ?auto_204511 ?auto_204521 ) ) ( not ( = ?auto_204512 ?auto_204513 ) ) ( not ( = ?auto_204512 ?auto_204514 ) ) ( not ( = ?auto_204512 ?auto_204515 ) ) ( not ( = ?auto_204512 ?auto_204516 ) ) ( not ( = ?auto_204512 ?auto_204517 ) ) ( not ( = ?auto_204512 ?auto_204518 ) ) ( not ( = ?auto_204512 ?auto_204519 ) ) ( not ( = ?auto_204512 ?auto_204520 ) ) ( not ( = ?auto_204512 ?auto_204521 ) ) ( not ( = ?auto_204513 ?auto_204514 ) ) ( not ( = ?auto_204513 ?auto_204515 ) ) ( not ( = ?auto_204513 ?auto_204516 ) ) ( not ( = ?auto_204513 ?auto_204517 ) ) ( not ( = ?auto_204513 ?auto_204518 ) ) ( not ( = ?auto_204513 ?auto_204519 ) ) ( not ( = ?auto_204513 ?auto_204520 ) ) ( not ( = ?auto_204513 ?auto_204521 ) ) ( not ( = ?auto_204514 ?auto_204515 ) ) ( not ( = ?auto_204514 ?auto_204516 ) ) ( not ( = ?auto_204514 ?auto_204517 ) ) ( not ( = ?auto_204514 ?auto_204518 ) ) ( not ( = ?auto_204514 ?auto_204519 ) ) ( not ( = ?auto_204514 ?auto_204520 ) ) ( not ( = ?auto_204514 ?auto_204521 ) ) ( not ( = ?auto_204515 ?auto_204516 ) ) ( not ( = ?auto_204515 ?auto_204517 ) ) ( not ( = ?auto_204515 ?auto_204518 ) ) ( not ( = ?auto_204515 ?auto_204519 ) ) ( not ( = ?auto_204515 ?auto_204520 ) ) ( not ( = ?auto_204515 ?auto_204521 ) ) ( not ( = ?auto_204516 ?auto_204517 ) ) ( not ( = ?auto_204516 ?auto_204518 ) ) ( not ( = ?auto_204516 ?auto_204519 ) ) ( not ( = ?auto_204516 ?auto_204520 ) ) ( not ( = ?auto_204516 ?auto_204521 ) ) ( not ( = ?auto_204517 ?auto_204518 ) ) ( not ( = ?auto_204517 ?auto_204519 ) ) ( not ( = ?auto_204517 ?auto_204520 ) ) ( not ( = ?auto_204517 ?auto_204521 ) ) ( not ( = ?auto_204518 ?auto_204519 ) ) ( not ( = ?auto_204518 ?auto_204520 ) ) ( not ( = ?auto_204518 ?auto_204521 ) ) ( not ( = ?auto_204519 ?auto_204520 ) ) ( not ( = ?auto_204519 ?auto_204521 ) ) ( not ( = ?auto_204520 ?auto_204521 ) ) ( ON ?auto_204519 ?auto_204520 ) ( ON ?auto_204518 ?auto_204519 ) ( CLEAR ?auto_204516 ) ( ON ?auto_204517 ?auto_204518 ) ( CLEAR ?auto_204517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204510 ?auto_204511 ?auto_204512 ?auto_204513 ?auto_204514 ?auto_204515 ?auto_204516 ?auto_204517 )
      ( MAKE-11PILE ?auto_204510 ?auto_204511 ?auto_204512 ?auto_204513 ?auto_204514 ?auto_204515 ?auto_204516 ?auto_204517 ?auto_204518 ?auto_204519 ?auto_204520 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204533 - BLOCK
      ?auto_204534 - BLOCK
      ?auto_204535 - BLOCK
      ?auto_204536 - BLOCK
      ?auto_204537 - BLOCK
      ?auto_204538 - BLOCK
      ?auto_204539 - BLOCK
      ?auto_204540 - BLOCK
      ?auto_204541 - BLOCK
      ?auto_204542 - BLOCK
      ?auto_204543 - BLOCK
    )
    :vars
    (
      ?auto_204544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204543 ?auto_204544 ) ( ON-TABLE ?auto_204533 ) ( ON ?auto_204534 ?auto_204533 ) ( ON ?auto_204535 ?auto_204534 ) ( ON ?auto_204536 ?auto_204535 ) ( ON ?auto_204537 ?auto_204536 ) ( ON ?auto_204538 ?auto_204537 ) ( ON ?auto_204539 ?auto_204538 ) ( not ( = ?auto_204533 ?auto_204534 ) ) ( not ( = ?auto_204533 ?auto_204535 ) ) ( not ( = ?auto_204533 ?auto_204536 ) ) ( not ( = ?auto_204533 ?auto_204537 ) ) ( not ( = ?auto_204533 ?auto_204538 ) ) ( not ( = ?auto_204533 ?auto_204539 ) ) ( not ( = ?auto_204533 ?auto_204540 ) ) ( not ( = ?auto_204533 ?auto_204541 ) ) ( not ( = ?auto_204533 ?auto_204542 ) ) ( not ( = ?auto_204533 ?auto_204543 ) ) ( not ( = ?auto_204533 ?auto_204544 ) ) ( not ( = ?auto_204534 ?auto_204535 ) ) ( not ( = ?auto_204534 ?auto_204536 ) ) ( not ( = ?auto_204534 ?auto_204537 ) ) ( not ( = ?auto_204534 ?auto_204538 ) ) ( not ( = ?auto_204534 ?auto_204539 ) ) ( not ( = ?auto_204534 ?auto_204540 ) ) ( not ( = ?auto_204534 ?auto_204541 ) ) ( not ( = ?auto_204534 ?auto_204542 ) ) ( not ( = ?auto_204534 ?auto_204543 ) ) ( not ( = ?auto_204534 ?auto_204544 ) ) ( not ( = ?auto_204535 ?auto_204536 ) ) ( not ( = ?auto_204535 ?auto_204537 ) ) ( not ( = ?auto_204535 ?auto_204538 ) ) ( not ( = ?auto_204535 ?auto_204539 ) ) ( not ( = ?auto_204535 ?auto_204540 ) ) ( not ( = ?auto_204535 ?auto_204541 ) ) ( not ( = ?auto_204535 ?auto_204542 ) ) ( not ( = ?auto_204535 ?auto_204543 ) ) ( not ( = ?auto_204535 ?auto_204544 ) ) ( not ( = ?auto_204536 ?auto_204537 ) ) ( not ( = ?auto_204536 ?auto_204538 ) ) ( not ( = ?auto_204536 ?auto_204539 ) ) ( not ( = ?auto_204536 ?auto_204540 ) ) ( not ( = ?auto_204536 ?auto_204541 ) ) ( not ( = ?auto_204536 ?auto_204542 ) ) ( not ( = ?auto_204536 ?auto_204543 ) ) ( not ( = ?auto_204536 ?auto_204544 ) ) ( not ( = ?auto_204537 ?auto_204538 ) ) ( not ( = ?auto_204537 ?auto_204539 ) ) ( not ( = ?auto_204537 ?auto_204540 ) ) ( not ( = ?auto_204537 ?auto_204541 ) ) ( not ( = ?auto_204537 ?auto_204542 ) ) ( not ( = ?auto_204537 ?auto_204543 ) ) ( not ( = ?auto_204537 ?auto_204544 ) ) ( not ( = ?auto_204538 ?auto_204539 ) ) ( not ( = ?auto_204538 ?auto_204540 ) ) ( not ( = ?auto_204538 ?auto_204541 ) ) ( not ( = ?auto_204538 ?auto_204542 ) ) ( not ( = ?auto_204538 ?auto_204543 ) ) ( not ( = ?auto_204538 ?auto_204544 ) ) ( not ( = ?auto_204539 ?auto_204540 ) ) ( not ( = ?auto_204539 ?auto_204541 ) ) ( not ( = ?auto_204539 ?auto_204542 ) ) ( not ( = ?auto_204539 ?auto_204543 ) ) ( not ( = ?auto_204539 ?auto_204544 ) ) ( not ( = ?auto_204540 ?auto_204541 ) ) ( not ( = ?auto_204540 ?auto_204542 ) ) ( not ( = ?auto_204540 ?auto_204543 ) ) ( not ( = ?auto_204540 ?auto_204544 ) ) ( not ( = ?auto_204541 ?auto_204542 ) ) ( not ( = ?auto_204541 ?auto_204543 ) ) ( not ( = ?auto_204541 ?auto_204544 ) ) ( not ( = ?auto_204542 ?auto_204543 ) ) ( not ( = ?auto_204542 ?auto_204544 ) ) ( not ( = ?auto_204543 ?auto_204544 ) ) ( ON ?auto_204542 ?auto_204543 ) ( ON ?auto_204541 ?auto_204542 ) ( CLEAR ?auto_204539 ) ( ON ?auto_204540 ?auto_204541 ) ( CLEAR ?auto_204540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204533 ?auto_204534 ?auto_204535 ?auto_204536 ?auto_204537 ?auto_204538 ?auto_204539 ?auto_204540 )
      ( MAKE-11PILE ?auto_204533 ?auto_204534 ?auto_204535 ?auto_204536 ?auto_204537 ?auto_204538 ?auto_204539 ?auto_204540 ?auto_204541 ?auto_204542 ?auto_204543 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204556 - BLOCK
      ?auto_204557 - BLOCK
      ?auto_204558 - BLOCK
      ?auto_204559 - BLOCK
      ?auto_204560 - BLOCK
      ?auto_204561 - BLOCK
      ?auto_204562 - BLOCK
      ?auto_204563 - BLOCK
      ?auto_204564 - BLOCK
      ?auto_204565 - BLOCK
      ?auto_204566 - BLOCK
    )
    :vars
    (
      ?auto_204567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204566 ?auto_204567 ) ( ON-TABLE ?auto_204556 ) ( ON ?auto_204557 ?auto_204556 ) ( ON ?auto_204558 ?auto_204557 ) ( ON ?auto_204559 ?auto_204558 ) ( ON ?auto_204560 ?auto_204559 ) ( ON ?auto_204561 ?auto_204560 ) ( not ( = ?auto_204556 ?auto_204557 ) ) ( not ( = ?auto_204556 ?auto_204558 ) ) ( not ( = ?auto_204556 ?auto_204559 ) ) ( not ( = ?auto_204556 ?auto_204560 ) ) ( not ( = ?auto_204556 ?auto_204561 ) ) ( not ( = ?auto_204556 ?auto_204562 ) ) ( not ( = ?auto_204556 ?auto_204563 ) ) ( not ( = ?auto_204556 ?auto_204564 ) ) ( not ( = ?auto_204556 ?auto_204565 ) ) ( not ( = ?auto_204556 ?auto_204566 ) ) ( not ( = ?auto_204556 ?auto_204567 ) ) ( not ( = ?auto_204557 ?auto_204558 ) ) ( not ( = ?auto_204557 ?auto_204559 ) ) ( not ( = ?auto_204557 ?auto_204560 ) ) ( not ( = ?auto_204557 ?auto_204561 ) ) ( not ( = ?auto_204557 ?auto_204562 ) ) ( not ( = ?auto_204557 ?auto_204563 ) ) ( not ( = ?auto_204557 ?auto_204564 ) ) ( not ( = ?auto_204557 ?auto_204565 ) ) ( not ( = ?auto_204557 ?auto_204566 ) ) ( not ( = ?auto_204557 ?auto_204567 ) ) ( not ( = ?auto_204558 ?auto_204559 ) ) ( not ( = ?auto_204558 ?auto_204560 ) ) ( not ( = ?auto_204558 ?auto_204561 ) ) ( not ( = ?auto_204558 ?auto_204562 ) ) ( not ( = ?auto_204558 ?auto_204563 ) ) ( not ( = ?auto_204558 ?auto_204564 ) ) ( not ( = ?auto_204558 ?auto_204565 ) ) ( not ( = ?auto_204558 ?auto_204566 ) ) ( not ( = ?auto_204558 ?auto_204567 ) ) ( not ( = ?auto_204559 ?auto_204560 ) ) ( not ( = ?auto_204559 ?auto_204561 ) ) ( not ( = ?auto_204559 ?auto_204562 ) ) ( not ( = ?auto_204559 ?auto_204563 ) ) ( not ( = ?auto_204559 ?auto_204564 ) ) ( not ( = ?auto_204559 ?auto_204565 ) ) ( not ( = ?auto_204559 ?auto_204566 ) ) ( not ( = ?auto_204559 ?auto_204567 ) ) ( not ( = ?auto_204560 ?auto_204561 ) ) ( not ( = ?auto_204560 ?auto_204562 ) ) ( not ( = ?auto_204560 ?auto_204563 ) ) ( not ( = ?auto_204560 ?auto_204564 ) ) ( not ( = ?auto_204560 ?auto_204565 ) ) ( not ( = ?auto_204560 ?auto_204566 ) ) ( not ( = ?auto_204560 ?auto_204567 ) ) ( not ( = ?auto_204561 ?auto_204562 ) ) ( not ( = ?auto_204561 ?auto_204563 ) ) ( not ( = ?auto_204561 ?auto_204564 ) ) ( not ( = ?auto_204561 ?auto_204565 ) ) ( not ( = ?auto_204561 ?auto_204566 ) ) ( not ( = ?auto_204561 ?auto_204567 ) ) ( not ( = ?auto_204562 ?auto_204563 ) ) ( not ( = ?auto_204562 ?auto_204564 ) ) ( not ( = ?auto_204562 ?auto_204565 ) ) ( not ( = ?auto_204562 ?auto_204566 ) ) ( not ( = ?auto_204562 ?auto_204567 ) ) ( not ( = ?auto_204563 ?auto_204564 ) ) ( not ( = ?auto_204563 ?auto_204565 ) ) ( not ( = ?auto_204563 ?auto_204566 ) ) ( not ( = ?auto_204563 ?auto_204567 ) ) ( not ( = ?auto_204564 ?auto_204565 ) ) ( not ( = ?auto_204564 ?auto_204566 ) ) ( not ( = ?auto_204564 ?auto_204567 ) ) ( not ( = ?auto_204565 ?auto_204566 ) ) ( not ( = ?auto_204565 ?auto_204567 ) ) ( not ( = ?auto_204566 ?auto_204567 ) ) ( ON ?auto_204565 ?auto_204566 ) ( ON ?auto_204564 ?auto_204565 ) ( ON ?auto_204563 ?auto_204564 ) ( CLEAR ?auto_204561 ) ( ON ?auto_204562 ?auto_204563 ) ( CLEAR ?auto_204562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204556 ?auto_204557 ?auto_204558 ?auto_204559 ?auto_204560 ?auto_204561 ?auto_204562 )
      ( MAKE-11PILE ?auto_204556 ?auto_204557 ?auto_204558 ?auto_204559 ?auto_204560 ?auto_204561 ?auto_204562 ?auto_204563 ?auto_204564 ?auto_204565 ?auto_204566 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204579 - BLOCK
      ?auto_204580 - BLOCK
      ?auto_204581 - BLOCK
      ?auto_204582 - BLOCK
      ?auto_204583 - BLOCK
      ?auto_204584 - BLOCK
      ?auto_204585 - BLOCK
      ?auto_204586 - BLOCK
      ?auto_204587 - BLOCK
      ?auto_204588 - BLOCK
      ?auto_204589 - BLOCK
    )
    :vars
    (
      ?auto_204590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204589 ?auto_204590 ) ( ON-TABLE ?auto_204579 ) ( ON ?auto_204580 ?auto_204579 ) ( ON ?auto_204581 ?auto_204580 ) ( ON ?auto_204582 ?auto_204581 ) ( ON ?auto_204583 ?auto_204582 ) ( ON ?auto_204584 ?auto_204583 ) ( not ( = ?auto_204579 ?auto_204580 ) ) ( not ( = ?auto_204579 ?auto_204581 ) ) ( not ( = ?auto_204579 ?auto_204582 ) ) ( not ( = ?auto_204579 ?auto_204583 ) ) ( not ( = ?auto_204579 ?auto_204584 ) ) ( not ( = ?auto_204579 ?auto_204585 ) ) ( not ( = ?auto_204579 ?auto_204586 ) ) ( not ( = ?auto_204579 ?auto_204587 ) ) ( not ( = ?auto_204579 ?auto_204588 ) ) ( not ( = ?auto_204579 ?auto_204589 ) ) ( not ( = ?auto_204579 ?auto_204590 ) ) ( not ( = ?auto_204580 ?auto_204581 ) ) ( not ( = ?auto_204580 ?auto_204582 ) ) ( not ( = ?auto_204580 ?auto_204583 ) ) ( not ( = ?auto_204580 ?auto_204584 ) ) ( not ( = ?auto_204580 ?auto_204585 ) ) ( not ( = ?auto_204580 ?auto_204586 ) ) ( not ( = ?auto_204580 ?auto_204587 ) ) ( not ( = ?auto_204580 ?auto_204588 ) ) ( not ( = ?auto_204580 ?auto_204589 ) ) ( not ( = ?auto_204580 ?auto_204590 ) ) ( not ( = ?auto_204581 ?auto_204582 ) ) ( not ( = ?auto_204581 ?auto_204583 ) ) ( not ( = ?auto_204581 ?auto_204584 ) ) ( not ( = ?auto_204581 ?auto_204585 ) ) ( not ( = ?auto_204581 ?auto_204586 ) ) ( not ( = ?auto_204581 ?auto_204587 ) ) ( not ( = ?auto_204581 ?auto_204588 ) ) ( not ( = ?auto_204581 ?auto_204589 ) ) ( not ( = ?auto_204581 ?auto_204590 ) ) ( not ( = ?auto_204582 ?auto_204583 ) ) ( not ( = ?auto_204582 ?auto_204584 ) ) ( not ( = ?auto_204582 ?auto_204585 ) ) ( not ( = ?auto_204582 ?auto_204586 ) ) ( not ( = ?auto_204582 ?auto_204587 ) ) ( not ( = ?auto_204582 ?auto_204588 ) ) ( not ( = ?auto_204582 ?auto_204589 ) ) ( not ( = ?auto_204582 ?auto_204590 ) ) ( not ( = ?auto_204583 ?auto_204584 ) ) ( not ( = ?auto_204583 ?auto_204585 ) ) ( not ( = ?auto_204583 ?auto_204586 ) ) ( not ( = ?auto_204583 ?auto_204587 ) ) ( not ( = ?auto_204583 ?auto_204588 ) ) ( not ( = ?auto_204583 ?auto_204589 ) ) ( not ( = ?auto_204583 ?auto_204590 ) ) ( not ( = ?auto_204584 ?auto_204585 ) ) ( not ( = ?auto_204584 ?auto_204586 ) ) ( not ( = ?auto_204584 ?auto_204587 ) ) ( not ( = ?auto_204584 ?auto_204588 ) ) ( not ( = ?auto_204584 ?auto_204589 ) ) ( not ( = ?auto_204584 ?auto_204590 ) ) ( not ( = ?auto_204585 ?auto_204586 ) ) ( not ( = ?auto_204585 ?auto_204587 ) ) ( not ( = ?auto_204585 ?auto_204588 ) ) ( not ( = ?auto_204585 ?auto_204589 ) ) ( not ( = ?auto_204585 ?auto_204590 ) ) ( not ( = ?auto_204586 ?auto_204587 ) ) ( not ( = ?auto_204586 ?auto_204588 ) ) ( not ( = ?auto_204586 ?auto_204589 ) ) ( not ( = ?auto_204586 ?auto_204590 ) ) ( not ( = ?auto_204587 ?auto_204588 ) ) ( not ( = ?auto_204587 ?auto_204589 ) ) ( not ( = ?auto_204587 ?auto_204590 ) ) ( not ( = ?auto_204588 ?auto_204589 ) ) ( not ( = ?auto_204588 ?auto_204590 ) ) ( not ( = ?auto_204589 ?auto_204590 ) ) ( ON ?auto_204588 ?auto_204589 ) ( ON ?auto_204587 ?auto_204588 ) ( ON ?auto_204586 ?auto_204587 ) ( CLEAR ?auto_204584 ) ( ON ?auto_204585 ?auto_204586 ) ( CLEAR ?auto_204585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204579 ?auto_204580 ?auto_204581 ?auto_204582 ?auto_204583 ?auto_204584 ?auto_204585 )
      ( MAKE-11PILE ?auto_204579 ?auto_204580 ?auto_204581 ?auto_204582 ?auto_204583 ?auto_204584 ?auto_204585 ?auto_204586 ?auto_204587 ?auto_204588 ?auto_204589 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204602 - BLOCK
      ?auto_204603 - BLOCK
      ?auto_204604 - BLOCK
      ?auto_204605 - BLOCK
      ?auto_204606 - BLOCK
      ?auto_204607 - BLOCK
      ?auto_204608 - BLOCK
      ?auto_204609 - BLOCK
      ?auto_204610 - BLOCK
      ?auto_204611 - BLOCK
      ?auto_204612 - BLOCK
    )
    :vars
    (
      ?auto_204613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204612 ?auto_204613 ) ( ON-TABLE ?auto_204602 ) ( ON ?auto_204603 ?auto_204602 ) ( ON ?auto_204604 ?auto_204603 ) ( ON ?auto_204605 ?auto_204604 ) ( ON ?auto_204606 ?auto_204605 ) ( not ( = ?auto_204602 ?auto_204603 ) ) ( not ( = ?auto_204602 ?auto_204604 ) ) ( not ( = ?auto_204602 ?auto_204605 ) ) ( not ( = ?auto_204602 ?auto_204606 ) ) ( not ( = ?auto_204602 ?auto_204607 ) ) ( not ( = ?auto_204602 ?auto_204608 ) ) ( not ( = ?auto_204602 ?auto_204609 ) ) ( not ( = ?auto_204602 ?auto_204610 ) ) ( not ( = ?auto_204602 ?auto_204611 ) ) ( not ( = ?auto_204602 ?auto_204612 ) ) ( not ( = ?auto_204602 ?auto_204613 ) ) ( not ( = ?auto_204603 ?auto_204604 ) ) ( not ( = ?auto_204603 ?auto_204605 ) ) ( not ( = ?auto_204603 ?auto_204606 ) ) ( not ( = ?auto_204603 ?auto_204607 ) ) ( not ( = ?auto_204603 ?auto_204608 ) ) ( not ( = ?auto_204603 ?auto_204609 ) ) ( not ( = ?auto_204603 ?auto_204610 ) ) ( not ( = ?auto_204603 ?auto_204611 ) ) ( not ( = ?auto_204603 ?auto_204612 ) ) ( not ( = ?auto_204603 ?auto_204613 ) ) ( not ( = ?auto_204604 ?auto_204605 ) ) ( not ( = ?auto_204604 ?auto_204606 ) ) ( not ( = ?auto_204604 ?auto_204607 ) ) ( not ( = ?auto_204604 ?auto_204608 ) ) ( not ( = ?auto_204604 ?auto_204609 ) ) ( not ( = ?auto_204604 ?auto_204610 ) ) ( not ( = ?auto_204604 ?auto_204611 ) ) ( not ( = ?auto_204604 ?auto_204612 ) ) ( not ( = ?auto_204604 ?auto_204613 ) ) ( not ( = ?auto_204605 ?auto_204606 ) ) ( not ( = ?auto_204605 ?auto_204607 ) ) ( not ( = ?auto_204605 ?auto_204608 ) ) ( not ( = ?auto_204605 ?auto_204609 ) ) ( not ( = ?auto_204605 ?auto_204610 ) ) ( not ( = ?auto_204605 ?auto_204611 ) ) ( not ( = ?auto_204605 ?auto_204612 ) ) ( not ( = ?auto_204605 ?auto_204613 ) ) ( not ( = ?auto_204606 ?auto_204607 ) ) ( not ( = ?auto_204606 ?auto_204608 ) ) ( not ( = ?auto_204606 ?auto_204609 ) ) ( not ( = ?auto_204606 ?auto_204610 ) ) ( not ( = ?auto_204606 ?auto_204611 ) ) ( not ( = ?auto_204606 ?auto_204612 ) ) ( not ( = ?auto_204606 ?auto_204613 ) ) ( not ( = ?auto_204607 ?auto_204608 ) ) ( not ( = ?auto_204607 ?auto_204609 ) ) ( not ( = ?auto_204607 ?auto_204610 ) ) ( not ( = ?auto_204607 ?auto_204611 ) ) ( not ( = ?auto_204607 ?auto_204612 ) ) ( not ( = ?auto_204607 ?auto_204613 ) ) ( not ( = ?auto_204608 ?auto_204609 ) ) ( not ( = ?auto_204608 ?auto_204610 ) ) ( not ( = ?auto_204608 ?auto_204611 ) ) ( not ( = ?auto_204608 ?auto_204612 ) ) ( not ( = ?auto_204608 ?auto_204613 ) ) ( not ( = ?auto_204609 ?auto_204610 ) ) ( not ( = ?auto_204609 ?auto_204611 ) ) ( not ( = ?auto_204609 ?auto_204612 ) ) ( not ( = ?auto_204609 ?auto_204613 ) ) ( not ( = ?auto_204610 ?auto_204611 ) ) ( not ( = ?auto_204610 ?auto_204612 ) ) ( not ( = ?auto_204610 ?auto_204613 ) ) ( not ( = ?auto_204611 ?auto_204612 ) ) ( not ( = ?auto_204611 ?auto_204613 ) ) ( not ( = ?auto_204612 ?auto_204613 ) ) ( ON ?auto_204611 ?auto_204612 ) ( ON ?auto_204610 ?auto_204611 ) ( ON ?auto_204609 ?auto_204610 ) ( ON ?auto_204608 ?auto_204609 ) ( CLEAR ?auto_204606 ) ( ON ?auto_204607 ?auto_204608 ) ( CLEAR ?auto_204607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204602 ?auto_204603 ?auto_204604 ?auto_204605 ?auto_204606 ?auto_204607 )
      ( MAKE-11PILE ?auto_204602 ?auto_204603 ?auto_204604 ?auto_204605 ?auto_204606 ?auto_204607 ?auto_204608 ?auto_204609 ?auto_204610 ?auto_204611 ?auto_204612 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204625 - BLOCK
      ?auto_204626 - BLOCK
      ?auto_204627 - BLOCK
      ?auto_204628 - BLOCK
      ?auto_204629 - BLOCK
      ?auto_204630 - BLOCK
      ?auto_204631 - BLOCK
      ?auto_204632 - BLOCK
      ?auto_204633 - BLOCK
      ?auto_204634 - BLOCK
      ?auto_204635 - BLOCK
    )
    :vars
    (
      ?auto_204636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204635 ?auto_204636 ) ( ON-TABLE ?auto_204625 ) ( ON ?auto_204626 ?auto_204625 ) ( ON ?auto_204627 ?auto_204626 ) ( ON ?auto_204628 ?auto_204627 ) ( ON ?auto_204629 ?auto_204628 ) ( not ( = ?auto_204625 ?auto_204626 ) ) ( not ( = ?auto_204625 ?auto_204627 ) ) ( not ( = ?auto_204625 ?auto_204628 ) ) ( not ( = ?auto_204625 ?auto_204629 ) ) ( not ( = ?auto_204625 ?auto_204630 ) ) ( not ( = ?auto_204625 ?auto_204631 ) ) ( not ( = ?auto_204625 ?auto_204632 ) ) ( not ( = ?auto_204625 ?auto_204633 ) ) ( not ( = ?auto_204625 ?auto_204634 ) ) ( not ( = ?auto_204625 ?auto_204635 ) ) ( not ( = ?auto_204625 ?auto_204636 ) ) ( not ( = ?auto_204626 ?auto_204627 ) ) ( not ( = ?auto_204626 ?auto_204628 ) ) ( not ( = ?auto_204626 ?auto_204629 ) ) ( not ( = ?auto_204626 ?auto_204630 ) ) ( not ( = ?auto_204626 ?auto_204631 ) ) ( not ( = ?auto_204626 ?auto_204632 ) ) ( not ( = ?auto_204626 ?auto_204633 ) ) ( not ( = ?auto_204626 ?auto_204634 ) ) ( not ( = ?auto_204626 ?auto_204635 ) ) ( not ( = ?auto_204626 ?auto_204636 ) ) ( not ( = ?auto_204627 ?auto_204628 ) ) ( not ( = ?auto_204627 ?auto_204629 ) ) ( not ( = ?auto_204627 ?auto_204630 ) ) ( not ( = ?auto_204627 ?auto_204631 ) ) ( not ( = ?auto_204627 ?auto_204632 ) ) ( not ( = ?auto_204627 ?auto_204633 ) ) ( not ( = ?auto_204627 ?auto_204634 ) ) ( not ( = ?auto_204627 ?auto_204635 ) ) ( not ( = ?auto_204627 ?auto_204636 ) ) ( not ( = ?auto_204628 ?auto_204629 ) ) ( not ( = ?auto_204628 ?auto_204630 ) ) ( not ( = ?auto_204628 ?auto_204631 ) ) ( not ( = ?auto_204628 ?auto_204632 ) ) ( not ( = ?auto_204628 ?auto_204633 ) ) ( not ( = ?auto_204628 ?auto_204634 ) ) ( not ( = ?auto_204628 ?auto_204635 ) ) ( not ( = ?auto_204628 ?auto_204636 ) ) ( not ( = ?auto_204629 ?auto_204630 ) ) ( not ( = ?auto_204629 ?auto_204631 ) ) ( not ( = ?auto_204629 ?auto_204632 ) ) ( not ( = ?auto_204629 ?auto_204633 ) ) ( not ( = ?auto_204629 ?auto_204634 ) ) ( not ( = ?auto_204629 ?auto_204635 ) ) ( not ( = ?auto_204629 ?auto_204636 ) ) ( not ( = ?auto_204630 ?auto_204631 ) ) ( not ( = ?auto_204630 ?auto_204632 ) ) ( not ( = ?auto_204630 ?auto_204633 ) ) ( not ( = ?auto_204630 ?auto_204634 ) ) ( not ( = ?auto_204630 ?auto_204635 ) ) ( not ( = ?auto_204630 ?auto_204636 ) ) ( not ( = ?auto_204631 ?auto_204632 ) ) ( not ( = ?auto_204631 ?auto_204633 ) ) ( not ( = ?auto_204631 ?auto_204634 ) ) ( not ( = ?auto_204631 ?auto_204635 ) ) ( not ( = ?auto_204631 ?auto_204636 ) ) ( not ( = ?auto_204632 ?auto_204633 ) ) ( not ( = ?auto_204632 ?auto_204634 ) ) ( not ( = ?auto_204632 ?auto_204635 ) ) ( not ( = ?auto_204632 ?auto_204636 ) ) ( not ( = ?auto_204633 ?auto_204634 ) ) ( not ( = ?auto_204633 ?auto_204635 ) ) ( not ( = ?auto_204633 ?auto_204636 ) ) ( not ( = ?auto_204634 ?auto_204635 ) ) ( not ( = ?auto_204634 ?auto_204636 ) ) ( not ( = ?auto_204635 ?auto_204636 ) ) ( ON ?auto_204634 ?auto_204635 ) ( ON ?auto_204633 ?auto_204634 ) ( ON ?auto_204632 ?auto_204633 ) ( ON ?auto_204631 ?auto_204632 ) ( CLEAR ?auto_204629 ) ( ON ?auto_204630 ?auto_204631 ) ( CLEAR ?auto_204630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204625 ?auto_204626 ?auto_204627 ?auto_204628 ?auto_204629 ?auto_204630 )
      ( MAKE-11PILE ?auto_204625 ?auto_204626 ?auto_204627 ?auto_204628 ?auto_204629 ?auto_204630 ?auto_204631 ?auto_204632 ?auto_204633 ?auto_204634 ?auto_204635 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204648 - BLOCK
      ?auto_204649 - BLOCK
      ?auto_204650 - BLOCK
      ?auto_204651 - BLOCK
      ?auto_204652 - BLOCK
      ?auto_204653 - BLOCK
      ?auto_204654 - BLOCK
      ?auto_204655 - BLOCK
      ?auto_204656 - BLOCK
      ?auto_204657 - BLOCK
      ?auto_204658 - BLOCK
    )
    :vars
    (
      ?auto_204659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204658 ?auto_204659 ) ( ON-TABLE ?auto_204648 ) ( ON ?auto_204649 ?auto_204648 ) ( ON ?auto_204650 ?auto_204649 ) ( ON ?auto_204651 ?auto_204650 ) ( not ( = ?auto_204648 ?auto_204649 ) ) ( not ( = ?auto_204648 ?auto_204650 ) ) ( not ( = ?auto_204648 ?auto_204651 ) ) ( not ( = ?auto_204648 ?auto_204652 ) ) ( not ( = ?auto_204648 ?auto_204653 ) ) ( not ( = ?auto_204648 ?auto_204654 ) ) ( not ( = ?auto_204648 ?auto_204655 ) ) ( not ( = ?auto_204648 ?auto_204656 ) ) ( not ( = ?auto_204648 ?auto_204657 ) ) ( not ( = ?auto_204648 ?auto_204658 ) ) ( not ( = ?auto_204648 ?auto_204659 ) ) ( not ( = ?auto_204649 ?auto_204650 ) ) ( not ( = ?auto_204649 ?auto_204651 ) ) ( not ( = ?auto_204649 ?auto_204652 ) ) ( not ( = ?auto_204649 ?auto_204653 ) ) ( not ( = ?auto_204649 ?auto_204654 ) ) ( not ( = ?auto_204649 ?auto_204655 ) ) ( not ( = ?auto_204649 ?auto_204656 ) ) ( not ( = ?auto_204649 ?auto_204657 ) ) ( not ( = ?auto_204649 ?auto_204658 ) ) ( not ( = ?auto_204649 ?auto_204659 ) ) ( not ( = ?auto_204650 ?auto_204651 ) ) ( not ( = ?auto_204650 ?auto_204652 ) ) ( not ( = ?auto_204650 ?auto_204653 ) ) ( not ( = ?auto_204650 ?auto_204654 ) ) ( not ( = ?auto_204650 ?auto_204655 ) ) ( not ( = ?auto_204650 ?auto_204656 ) ) ( not ( = ?auto_204650 ?auto_204657 ) ) ( not ( = ?auto_204650 ?auto_204658 ) ) ( not ( = ?auto_204650 ?auto_204659 ) ) ( not ( = ?auto_204651 ?auto_204652 ) ) ( not ( = ?auto_204651 ?auto_204653 ) ) ( not ( = ?auto_204651 ?auto_204654 ) ) ( not ( = ?auto_204651 ?auto_204655 ) ) ( not ( = ?auto_204651 ?auto_204656 ) ) ( not ( = ?auto_204651 ?auto_204657 ) ) ( not ( = ?auto_204651 ?auto_204658 ) ) ( not ( = ?auto_204651 ?auto_204659 ) ) ( not ( = ?auto_204652 ?auto_204653 ) ) ( not ( = ?auto_204652 ?auto_204654 ) ) ( not ( = ?auto_204652 ?auto_204655 ) ) ( not ( = ?auto_204652 ?auto_204656 ) ) ( not ( = ?auto_204652 ?auto_204657 ) ) ( not ( = ?auto_204652 ?auto_204658 ) ) ( not ( = ?auto_204652 ?auto_204659 ) ) ( not ( = ?auto_204653 ?auto_204654 ) ) ( not ( = ?auto_204653 ?auto_204655 ) ) ( not ( = ?auto_204653 ?auto_204656 ) ) ( not ( = ?auto_204653 ?auto_204657 ) ) ( not ( = ?auto_204653 ?auto_204658 ) ) ( not ( = ?auto_204653 ?auto_204659 ) ) ( not ( = ?auto_204654 ?auto_204655 ) ) ( not ( = ?auto_204654 ?auto_204656 ) ) ( not ( = ?auto_204654 ?auto_204657 ) ) ( not ( = ?auto_204654 ?auto_204658 ) ) ( not ( = ?auto_204654 ?auto_204659 ) ) ( not ( = ?auto_204655 ?auto_204656 ) ) ( not ( = ?auto_204655 ?auto_204657 ) ) ( not ( = ?auto_204655 ?auto_204658 ) ) ( not ( = ?auto_204655 ?auto_204659 ) ) ( not ( = ?auto_204656 ?auto_204657 ) ) ( not ( = ?auto_204656 ?auto_204658 ) ) ( not ( = ?auto_204656 ?auto_204659 ) ) ( not ( = ?auto_204657 ?auto_204658 ) ) ( not ( = ?auto_204657 ?auto_204659 ) ) ( not ( = ?auto_204658 ?auto_204659 ) ) ( ON ?auto_204657 ?auto_204658 ) ( ON ?auto_204656 ?auto_204657 ) ( ON ?auto_204655 ?auto_204656 ) ( ON ?auto_204654 ?auto_204655 ) ( ON ?auto_204653 ?auto_204654 ) ( CLEAR ?auto_204651 ) ( ON ?auto_204652 ?auto_204653 ) ( CLEAR ?auto_204652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204648 ?auto_204649 ?auto_204650 ?auto_204651 ?auto_204652 )
      ( MAKE-11PILE ?auto_204648 ?auto_204649 ?auto_204650 ?auto_204651 ?auto_204652 ?auto_204653 ?auto_204654 ?auto_204655 ?auto_204656 ?auto_204657 ?auto_204658 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204671 - BLOCK
      ?auto_204672 - BLOCK
      ?auto_204673 - BLOCK
      ?auto_204674 - BLOCK
      ?auto_204675 - BLOCK
      ?auto_204676 - BLOCK
      ?auto_204677 - BLOCK
      ?auto_204678 - BLOCK
      ?auto_204679 - BLOCK
      ?auto_204680 - BLOCK
      ?auto_204681 - BLOCK
    )
    :vars
    (
      ?auto_204682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204681 ?auto_204682 ) ( ON-TABLE ?auto_204671 ) ( ON ?auto_204672 ?auto_204671 ) ( ON ?auto_204673 ?auto_204672 ) ( ON ?auto_204674 ?auto_204673 ) ( not ( = ?auto_204671 ?auto_204672 ) ) ( not ( = ?auto_204671 ?auto_204673 ) ) ( not ( = ?auto_204671 ?auto_204674 ) ) ( not ( = ?auto_204671 ?auto_204675 ) ) ( not ( = ?auto_204671 ?auto_204676 ) ) ( not ( = ?auto_204671 ?auto_204677 ) ) ( not ( = ?auto_204671 ?auto_204678 ) ) ( not ( = ?auto_204671 ?auto_204679 ) ) ( not ( = ?auto_204671 ?auto_204680 ) ) ( not ( = ?auto_204671 ?auto_204681 ) ) ( not ( = ?auto_204671 ?auto_204682 ) ) ( not ( = ?auto_204672 ?auto_204673 ) ) ( not ( = ?auto_204672 ?auto_204674 ) ) ( not ( = ?auto_204672 ?auto_204675 ) ) ( not ( = ?auto_204672 ?auto_204676 ) ) ( not ( = ?auto_204672 ?auto_204677 ) ) ( not ( = ?auto_204672 ?auto_204678 ) ) ( not ( = ?auto_204672 ?auto_204679 ) ) ( not ( = ?auto_204672 ?auto_204680 ) ) ( not ( = ?auto_204672 ?auto_204681 ) ) ( not ( = ?auto_204672 ?auto_204682 ) ) ( not ( = ?auto_204673 ?auto_204674 ) ) ( not ( = ?auto_204673 ?auto_204675 ) ) ( not ( = ?auto_204673 ?auto_204676 ) ) ( not ( = ?auto_204673 ?auto_204677 ) ) ( not ( = ?auto_204673 ?auto_204678 ) ) ( not ( = ?auto_204673 ?auto_204679 ) ) ( not ( = ?auto_204673 ?auto_204680 ) ) ( not ( = ?auto_204673 ?auto_204681 ) ) ( not ( = ?auto_204673 ?auto_204682 ) ) ( not ( = ?auto_204674 ?auto_204675 ) ) ( not ( = ?auto_204674 ?auto_204676 ) ) ( not ( = ?auto_204674 ?auto_204677 ) ) ( not ( = ?auto_204674 ?auto_204678 ) ) ( not ( = ?auto_204674 ?auto_204679 ) ) ( not ( = ?auto_204674 ?auto_204680 ) ) ( not ( = ?auto_204674 ?auto_204681 ) ) ( not ( = ?auto_204674 ?auto_204682 ) ) ( not ( = ?auto_204675 ?auto_204676 ) ) ( not ( = ?auto_204675 ?auto_204677 ) ) ( not ( = ?auto_204675 ?auto_204678 ) ) ( not ( = ?auto_204675 ?auto_204679 ) ) ( not ( = ?auto_204675 ?auto_204680 ) ) ( not ( = ?auto_204675 ?auto_204681 ) ) ( not ( = ?auto_204675 ?auto_204682 ) ) ( not ( = ?auto_204676 ?auto_204677 ) ) ( not ( = ?auto_204676 ?auto_204678 ) ) ( not ( = ?auto_204676 ?auto_204679 ) ) ( not ( = ?auto_204676 ?auto_204680 ) ) ( not ( = ?auto_204676 ?auto_204681 ) ) ( not ( = ?auto_204676 ?auto_204682 ) ) ( not ( = ?auto_204677 ?auto_204678 ) ) ( not ( = ?auto_204677 ?auto_204679 ) ) ( not ( = ?auto_204677 ?auto_204680 ) ) ( not ( = ?auto_204677 ?auto_204681 ) ) ( not ( = ?auto_204677 ?auto_204682 ) ) ( not ( = ?auto_204678 ?auto_204679 ) ) ( not ( = ?auto_204678 ?auto_204680 ) ) ( not ( = ?auto_204678 ?auto_204681 ) ) ( not ( = ?auto_204678 ?auto_204682 ) ) ( not ( = ?auto_204679 ?auto_204680 ) ) ( not ( = ?auto_204679 ?auto_204681 ) ) ( not ( = ?auto_204679 ?auto_204682 ) ) ( not ( = ?auto_204680 ?auto_204681 ) ) ( not ( = ?auto_204680 ?auto_204682 ) ) ( not ( = ?auto_204681 ?auto_204682 ) ) ( ON ?auto_204680 ?auto_204681 ) ( ON ?auto_204679 ?auto_204680 ) ( ON ?auto_204678 ?auto_204679 ) ( ON ?auto_204677 ?auto_204678 ) ( ON ?auto_204676 ?auto_204677 ) ( CLEAR ?auto_204674 ) ( ON ?auto_204675 ?auto_204676 ) ( CLEAR ?auto_204675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204671 ?auto_204672 ?auto_204673 ?auto_204674 ?auto_204675 )
      ( MAKE-11PILE ?auto_204671 ?auto_204672 ?auto_204673 ?auto_204674 ?auto_204675 ?auto_204676 ?auto_204677 ?auto_204678 ?auto_204679 ?auto_204680 ?auto_204681 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204694 - BLOCK
      ?auto_204695 - BLOCK
      ?auto_204696 - BLOCK
      ?auto_204697 - BLOCK
      ?auto_204698 - BLOCK
      ?auto_204699 - BLOCK
      ?auto_204700 - BLOCK
      ?auto_204701 - BLOCK
      ?auto_204702 - BLOCK
      ?auto_204703 - BLOCK
      ?auto_204704 - BLOCK
    )
    :vars
    (
      ?auto_204705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204704 ?auto_204705 ) ( ON-TABLE ?auto_204694 ) ( ON ?auto_204695 ?auto_204694 ) ( ON ?auto_204696 ?auto_204695 ) ( not ( = ?auto_204694 ?auto_204695 ) ) ( not ( = ?auto_204694 ?auto_204696 ) ) ( not ( = ?auto_204694 ?auto_204697 ) ) ( not ( = ?auto_204694 ?auto_204698 ) ) ( not ( = ?auto_204694 ?auto_204699 ) ) ( not ( = ?auto_204694 ?auto_204700 ) ) ( not ( = ?auto_204694 ?auto_204701 ) ) ( not ( = ?auto_204694 ?auto_204702 ) ) ( not ( = ?auto_204694 ?auto_204703 ) ) ( not ( = ?auto_204694 ?auto_204704 ) ) ( not ( = ?auto_204694 ?auto_204705 ) ) ( not ( = ?auto_204695 ?auto_204696 ) ) ( not ( = ?auto_204695 ?auto_204697 ) ) ( not ( = ?auto_204695 ?auto_204698 ) ) ( not ( = ?auto_204695 ?auto_204699 ) ) ( not ( = ?auto_204695 ?auto_204700 ) ) ( not ( = ?auto_204695 ?auto_204701 ) ) ( not ( = ?auto_204695 ?auto_204702 ) ) ( not ( = ?auto_204695 ?auto_204703 ) ) ( not ( = ?auto_204695 ?auto_204704 ) ) ( not ( = ?auto_204695 ?auto_204705 ) ) ( not ( = ?auto_204696 ?auto_204697 ) ) ( not ( = ?auto_204696 ?auto_204698 ) ) ( not ( = ?auto_204696 ?auto_204699 ) ) ( not ( = ?auto_204696 ?auto_204700 ) ) ( not ( = ?auto_204696 ?auto_204701 ) ) ( not ( = ?auto_204696 ?auto_204702 ) ) ( not ( = ?auto_204696 ?auto_204703 ) ) ( not ( = ?auto_204696 ?auto_204704 ) ) ( not ( = ?auto_204696 ?auto_204705 ) ) ( not ( = ?auto_204697 ?auto_204698 ) ) ( not ( = ?auto_204697 ?auto_204699 ) ) ( not ( = ?auto_204697 ?auto_204700 ) ) ( not ( = ?auto_204697 ?auto_204701 ) ) ( not ( = ?auto_204697 ?auto_204702 ) ) ( not ( = ?auto_204697 ?auto_204703 ) ) ( not ( = ?auto_204697 ?auto_204704 ) ) ( not ( = ?auto_204697 ?auto_204705 ) ) ( not ( = ?auto_204698 ?auto_204699 ) ) ( not ( = ?auto_204698 ?auto_204700 ) ) ( not ( = ?auto_204698 ?auto_204701 ) ) ( not ( = ?auto_204698 ?auto_204702 ) ) ( not ( = ?auto_204698 ?auto_204703 ) ) ( not ( = ?auto_204698 ?auto_204704 ) ) ( not ( = ?auto_204698 ?auto_204705 ) ) ( not ( = ?auto_204699 ?auto_204700 ) ) ( not ( = ?auto_204699 ?auto_204701 ) ) ( not ( = ?auto_204699 ?auto_204702 ) ) ( not ( = ?auto_204699 ?auto_204703 ) ) ( not ( = ?auto_204699 ?auto_204704 ) ) ( not ( = ?auto_204699 ?auto_204705 ) ) ( not ( = ?auto_204700 ?auto_204701 ) ) ( not ( = ?auto_204700 ?auto_204702 ) ) ( not ( = ?auto_204700 ?auto_204703 ) ) ( not ( = ?auto_204700 ?auto_204704 ) ) ( not ( = ?auto_204700 ?auto_204705 ) ) ( not ( = ?auto_204701 ?auto_204702 ) ) ( not ( = ?auto_204701 ?auto_204703 ) ) ( not ( = ?auto_204701 ?auto_204704 ) ) ( not ( = ?auto_204701 ?auto_204705 ) ) ( not ( = ?auto_204702 ?auto_204703 ) ) ( not ( = ?auto_204702 ?auto_204704 ) ) ( not ( = ?auto_204702 ?auto_204705 ) ) ( not ( = ?auto_204703 ?auto_204704 ) ) ( not ( = ?auto_204703 ?auto_204705 ) ) ( not ( = ?auto_204704 ?auto_204705 ) ) ( ON ?auto_204703 ?auto_204704 ) ( ON ?auto_204702 ?auto_204703 ) ( ON ?auto_204701 ?auto_204702 ) ( ON ?auto_204700 ?auto_204701 ) ( ON ?auto_204699 ?auto_204700 ) ( ON ?auto_204698 ?auto_204699 ) ( CLEAR ?auto_204696 ) ( ON ?auto_204697 ?auto_204698 ) ( CLEAR ?auto_204697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204694 ?auto_204695 ?auto_204696 ?auto_204697 )
      ( MAKE-11PILE ?auto_204694 ?auto_204695 ?auto_204696 ?auto_204697 ?auto_204698 ?auto_204699 ?auto_204700 ?auto_204701 ?auto_204702 ?auto_204703 ?auto_204704 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204717 - BLOCK
      ?auto_204718 - BLOCK
      ?auto_204719 - BLOCK
      ?auto_204720 - BLOCK
      ?auto_204721 - BLOCK
      ?auto_204722 - BLOCK
      ?auto_204723 - BLOCK
      ?auto_204724 - BLOCK
      ?auto_204725 - BLOCK
      ?auto_204726 - BLOCK
      ?auto_204727 - BLOCK
    )
    :vars
    (
      ?auto_204728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204727 ?auto_204728 ) ( ON-TABLE ?auto_204717 ) ( ON ?auto_204718 ?auto_204717 ) ( ON ?auto_204719 ?auto_204718 ) ( not ( = ?auto_204717 ?auto_204718 ) ) ( not ( = ?auto_204717 ?auto_204719 ) ) ( not ( = ?auto_204717 ?auto_204720 ) ) ( not ( = ?auto_204717 ?auto_204721 ) ) ( not ( = ?auto_204717 ?auto_204722 ) ) ( not ( = ?auto_204717 ?auto_204723 ) ) ( not ( = ?auto_204717 ?auto_204724 ) ) ( not ( = ?auto_204717 ?auto_204725 ) ) ( not ( = ?auto_204717 ?auto_204726 ) ) ( not ( = ?auto_204717 ?auto_204727 ) ) ( not ( = ?auto_204717 ?auto_204728 ) ) ( not ( = ?auto_204718 ?auto_204719 ) ) ( not ( = ?auto_204718 ?auto_204720 ) ) ( not ( = ?auto_204718 ?auto_204721 ) ) ( not ( = ?auto_204718 ?auto_204722 ) ) ( not ( = ?auto_204718 ?auto_204723 ) ) ( not ( = ?auto_204718 ?auto_204724 ) ) ( not ( = ?auto_204718 ?auto_204725 ) ) ( not ( = ?auto_204718 ?auto_204726 ) ) ( not ( = ?auto_204718 ?auto_204727 ) ) ( not ( = ?auto_204718 ?auto_204728 ) ) ( not ( = ?auto_204719 ?auto_204720 ) ) ( not ( = ?auto_204719 ?auto_204721 ) ) ( not ( = ?auto_204719 ?auto_204722 ) ) ( not ( = ?auto_204719 ?auto_204723 ) ) ( not ( = ?auto_204719 ?auto_204724 ) ) ( not ( = ?auto_204719 ?auto_204725 ) ) ( not ( = ?auto_204719 ?auto_204726 ) ) ( not ( = ?auto_204719 ?auto_204727 ) ) ( not ( = ?auto_204719 ?auto_204728 ) ) ( not ( = ?auto_204720 ?auto_204721 ) ) ( not ( = ?auto_204720 ?auto_204722 ) ) ( not ( = ?auto_204720 ?auto_204723 ) ) ( not ( = ?auto_204720 ?auto_204724 ) ) ( not ( = ?auto_204720 ?auto_204725 ) ) ( not ( = ?auto_204720 ?auto_204726 ) ) ( not ( = ?auto_204720 ?auto_204727 ) ) ( not ( = ?auto_204720 ?auto_204728 ) ) ( not ( = ?auto_204721 ?auto_204722 ) ) ( not ( = ?auto_204721 ?auto_204723 ) ) ( not ( = ?auto_204721 ?auto_204724 ) ) ( not ( = ?auto_204721 ?auto_204725 ) ) ( not ( = ?auto_204721 ?auto_204726 ) ) ( not ( = ?auto_204721 ?auto_204727 ) ) ( not ( = ?auto_204721 ?auto_204728 ) ) ( not ( = ?auto_204722 ?auto_204723 ) ) ( not ( = ?auto_204722 ?auto_204724 ) ) ( not ( = ?auto_204722 ?auto_204725 ) ) ( not ( = ?auto_204722 ?auto_204726 ) ) ( not ( = ?auto_204722 ?auto_204727 ) ) ( not ( = ?auto_204722 ?auto_204728 ) ) ( not ( = ?auto_204723 ?auto_204724 ) ) ( not ( = ?auto_204723 ?auto_204725 ) ) ( not ( = ?auto_204723 ?auto_204726 ) ) ( not ( = ?auto_204723 ?auto_204727 ) ) ( not ( = ?auto_204723 ?auto_204728 ) ) ( not ( = ?auto_204724 ?auto_204725 ) ) ( not ( = ?auto_204724 ?auto_204726 ) ) ( not ( = ?auto_204724 ?auto_204727 ) ) ( not ( = ?auto_204724 ?auto_204728 ) ) ( not ( = ?auto_204725 ?auto_204726 ) ) ( not ( = ?auto_204725 ?auto_204727 ) ) ( not ( = ?auto_204725 ?auto_204728 ) ) ( not ( = ?auto_204726 ?auto_204727 ) ) ( not ( = ?auto_204726 ?auto_204728 ) ) ( not ( = ?auto_204727 ?auto_204728 ) ) ( ON ?auto_204726 ?auto_204727 ) ( ON ?auto_204725 ?auto_204726 ) ( ON ?auto_204724 ?auto_204725 ) ( ON ?auto_204723 ?auto_204724 ) ( ON ?auto_204722 ?auto_204723 ) ( ON ?auto_204721 ?auto_204722 ) ( CLEAR ?auto_204719 ) ( ON ?auto_204720 ?auto_204721 ) ( CLEAR ?auto_204720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204717 ?auto_204718 ?auto_204719 ?auto_204720 )
      ( MAKE-11PILE ?auto_204717 ?auto_204718 ?auto_204719 ?auto_204720 ?auto_204721 ?auto_204722 ?auto_204723 ?auto_204724 ?auto_204725 ?auto_204726 ?auto_204727 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204740 - BLOCK
      ?auto_204741 - BLOCK
      ?auto_204742 - BLOCK
      ?auto_204743 - BLOCK
      ?auto_204744 - BLOCK
      ?auto_204745 - BLOCK
      ?auto_204746 - BLOCK
      ?auto_204747 - BLOCK
      ?auto_204748 - BLOCK
      ?auto_204749 - BLOCK
      ?auto_204750 - BLOCK
    )
    :vars
    (
      ?auto_204751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204750 ?auto_204751 ) ( ON-TABLE ?auto_204740 ) ( ON ?auto_204741 ?auto_204740 ) ( not ( = ?auto_204740 ?auto_204741 ) ) ( not ( = ?auto_204740 ?auto_204742 ) ) ( not ( = ?auto_204740 ?auto_204743 ) ) ( not ( = ?auto_204740 ?auto_204744 ) ) ( not ( = ?auto_204740 ?auto_204745 ) ) ( not ( = ?auto_204740 ?auto_204746 ) ) ( not ( = ?auto_204740 ?auto_204747 ) ) ( not ( = ?auto_204740 ?auto_204748 ) ) ( not ( = ?auto_204740 ?auto_204749 ) ) ( not ( = ?auto_204740 ?auto_204750 ) ) ( not ( = ?auto_204740 ?auto_204751 ) ) ( not ( = ?auto_204741 ?auto_204742 ) ) ( not ( = ?auto_204741 ?auto_204743 ) ) ( not ( = ?auto_204741 ?auto_204744 ) ) ( not ( = ?auto_204741 ?auto_204745 ) ) ( not ( = ?auto_204741 ?auto_204746 ) ) ( not ( = ?auto_204741 ?auto_204747 ) ) ( not ( = ?auto_204741 ?auto_204748 ) ) ( not ( = ?auto_204741 ?auto_204749 ) ) ( not ( = ?auto_204741 ?auto_204750 ) ) ( not ( = ?auto_204741 ?auto_204751 ) ) ( not ( = ?auto_204742 ?auto_204743 ) ) ( not ( = ?auto_204742 ?auto_204744 ) ) ( not ( = ?auto_204742 ?auto_204745 ) ) ( not ( = ?auto_204742 ?auto_204746 ) ) ( not ( = ?auto_204742 ?auto_204747 ) ) ( not ( = ?auto_204742 ?auto_204748 ) ) ( not ( = ?auto_204742 ?auto_204749 ) ) ( not ( = ?auto_204742 ?auto_204750 ) ) ( not ( = ?auto_204742 ?auto_204751 ) ) ( not ( = ?auto_204743 ?auto_204744 ) ) ( not ( = ?auto_204743 ?auto_204745 ) ) ( not ( = ?auto_204743 ?auto_204746 ) ) ( not ( = ?auto_204743 ?auto_204747 ) ) ( not ( = ?auto_204743 ?auto_204748 ) ) ( not ( = ?auto_204743 ?auto_204749 ) ) ( not ( = ?auto_204743 ?auto_204750 ) ) ( not ( = ?auto_204743 ?auto_204751 ) ) ( not ( = ?auto_204744 ?auto_204745 ) ) ( not ( = ?auto_204744 ?auto_204746 ) ) ( not ( = ?auto_204744 ?auto_204747 ) ) ( not ( = ?auto_204744 ?auto_204748 ) ) ( not ( = ?auto_204744 ?auto_204749 ) ) ( not ( = ?auto_204744 ?auto_204750 ) ) ( not ( = ?auto_204744 ?auto_204751 ) ) ( not ( = ?auto_204745 ?auto_204746 ) ) ( not ( = ?auto_204745 ?auto_204747 ) ) ( not ( = ?auto_204745 ?auto_204748 ) ) ( not ( = ?auto_204745 ?auto_204749 ) ) ( not ( = ?auto_204745 ?auto_204750 ) ) ( not ( = ?auto_204745 ?auto_204751 ) ) ( not ( = ?auto_204746 ?auto_204747 ) ) ( not ( = ?auto_204746 ?auto_204748 ) ) ( not ( = ?auto_204746 ?auto_204749 ) ) ( not ( = ?auto_204746 ?auto_204750 ) ) ( not ( = ?auto_204746 ?auto_204751 ) ) ( not ( = ?auto_204747 ?auto_204748 ) ) ( not ( = ?auto_204747 ?auto_204749 ) ) ( not ( = ?auto_204747 ?auto_204750 ) ) ( not ( = ?auto_204747 ?auto_204751 ) ) ( not ( = ?auto_204748 ?auto_204749 ) ) ( not ( = ?auto_204748 ?auto_204750 ) ) ( not ( = ?auto_204748 ?auto_204751 ) ) ( not ( = ?auto_204749 ?auto_204750 ) ) ( not ( = ?auto_204749 ?auto_204751 ) ) ( not ( = ?auto_204750 ?auto_204751 ) ) ( ON ?auto_204749 ?auto_204750 ) ( ON ?auto_204748 ?auto_204749 ) ( ON ?auto_204747 ?auto_204748 ) ( ON ?auto_204746 ?auto_204747 ) ( ON ?auto_204745 ?auto_204746 ) ( ON ?auto_204744 ?auto_204745 ) ( ON ?auto_204743 ?auto_204744 ) ( CLEAR ?auto_204741 ) ( ON ?auto_204742 ?auto_204743 ) ( CLEAR ?auto_204742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204740 ?auto_204741 ?auto_204742 )
      ( MAKE-11PILE ?auto_204740 ?auto_204741 ?auto_204742 ?auto_204743 ?auto_204744 ?auto_204745 ?auto_204746 ?auto_204747 ?auto_204748 ?auto_204749 ?auto_204750 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204763 - BLOCK
      ?auto_204764 - BLOCK
      ?auto_204765 - BLOCK
      ?auto_204766 - BLOCK
      ?auto_204767 - BLOCK
      ?auto_204768 - BLOCK
      ?auto_204769 - BLOCK
      ?auto_204770 - BLOCK
      ?auto_204771 - BLOCK
      ?auto_204772 - BLOCK
      ?auto_204773 - BLOCK
    )
    :vars
    (
      ?auto_204774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204773 ?auto_204774 ) ( ON-TABLE ?auto_204763 ) ( ON ?auto_204764 ?auto_204763 ) ( not ( = ?auto_204763 ?auto_204764 ) ) ( not ( = ?auto_204763 ?auto_204765 ) ) ( not ( = ?auto_204763 ?auto_204766 ) ) ( not ( = ?auto_204763 ?auto_204767 ) ) ( not ( = ?auto_204763 ?auto_204768 ) ) ( not ( = ?auto_204763 ?auto_204769 ) ) ( not ( = ?auto_204763 ?auto_204770 ) ) ( not ( = ?auto_204763 ?auto_204771 ) ) ( not ( = ?auto_204763 ?auto_204772 ) ) ( not ( = ?auto_204763 ?auto_204773 ) ) ( not ( = ?auto_204763 ?auto_204774 ) ) ( not ( = ?auto_204764 ?auto_204765 ) ) ( not ( = ?auto_204764 ?auto_204766 ) ) ( not ( = ?auto_204764 ?auto_204767 ) ) ( not ( = ?auto_204764 ?auto_204768 ) ) ( not ( = ?auto_204764 ?auto_204769 ) ) ( not ( = ?auto_204764 ?auto_204770 ) ) ( not ( = ?auto_204764 ?auto_204771 ) ) ( not ( = ?auto_204764 ?auto_204772 ) ) ( not ( = ?auto_204764 ?auto_204773 ) ) ( not ( = ?auto_204764 ?auto_204774 ) ) ( not ( = ?auto_204765 ?auto_204766 ) ) ( not ( = ?auto_204765 ?auto_204767 ) ) ( not ( = ?auto_204765 ?auto_204768 ) ) ( not ( = ?auto_204765 ?auto_204769 ) ) ( not ( = ?auto_204765 ?auto_204770 ) ) ( not ( = ?auto_204765 ?auto_204771 ) ) ( not ( = ?auto_204765 ?auto_204772 ) ) ( not ( = ?auto_204765 ?auto_204773 ) ) ( not ( = ?auto_204765 ?auto_204774 ) ) ( not ( = ?auto_204766 ?auto_204767 ) ) ( not ( = ?auto_204766 ?auto_204768 ) ) ( not ( = ?auto_204766 ?auto_204769 ) ) ( not ( = ?auto_204766 ?auto_204770 ) ) ( not ( = ?auto_204766 ?auto_204771 ) ) ( not ( = ?auto_204766 ?auto_204772 ) ) ( not ( = ?auto_204766 ?auto_204773 ) ) ( not ( = ?auto_204766 ?auto_204774 ) ) ( not ( = ?auto_204767 ?auto_204768 ) ) ( not ( = ?auto_204767 ?auto_204769 ) ) ( not ( = ?auto_204767 ?auto_204770 ) ) ( not ( = ?auto_204767 ?auto_204771 ) ) ( not ( = ?auto_204767 ?auto_204772 ) ) ( not ( = ?auto_204767 ?auto_204773 ) ) ( not ( = ?auto_204767 ?auto_204774 ) ) ( not ( = ?auto_204768 ?auto_204769 ) ) ( not ( = ?auto_204768 ?auto_204770 ) ) ( not ( = ?auto_204768 ?auto_204771 ) ) ( not ( = ?auto_204768 ?auto_204772 ) ) ( not ( = ?auto_204768 ?auto_204773 ) ) ( not ( = ?auto_204768 ?auto_204774 ) ) ( not ( = ?auto_204769 ?auto_204770 ) ) ( not ( = ?auto_204769 ?auto_204771 ) ) ( not ( = ?auto_204769 ?auto_204772 ) ) ( not ( = ?auto_204769 ?auto_204773 ) ) ( not ( = ?auto_204769 ?auto_204774 ) ) ( not ( = ?auto_204770 ?auto_204771 ) ) ( not ( = ?auto_204770 ?auto_204772 ) ) ( not ( = ?auto_204770 ?auto_204773 ) ) ( not ( = ?auto_204770 ?auto_204774 ) ) ( not ( = ?auto_204771 ?auto_204772 ) ) ( not ( = ?auto_204771 ?auto_204773 ) ) ( not ( = ?auto_204771 ?auto_204774 ) ) ( not ( = ?auto_204772 ?auto_204773 ) ) ( not ( = ?auto_204772 ?auto_204774 ) ) ( not ( = ?auto_204773 ?auto_204774 ) ) ( ON ?auto_204772 ?auto_204773 ) ( ON ?auto_204771 ?auto_204772 ) ( ON ?auto_204770 ?auto_204771 ) ( ON ?auto_204769 ?auto_204770 ) ( ON ?auto_204768 ?auto_204769 ) ( ON ?auto_204767 ?auto_204768 ) ( ON ?auto_204766 ?auto_204767 ) ( CLEAR ?auto_204764 ) ( ON ?auto_204765 ?auto_204766 ) ( CLEAR ?auto_204765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204763 ?auto_204764 ?auto_204765 )
      ( MAKE-11PILE ?auto_204763 ?auto_204764 ?auto_204765 ?auto_204766 ?auto_204767 ?auto_204768 ?auto_204769 ?auto_204770 ?auto_204771 ?auto_204772 ?auto_204773 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204786 - BLOCK
      ?auto_204787 - BLOCK
      ?auto_204788 - BLOCK
      ?auto_204789 - BLOCK
      ?auto_204790 - BLOCK
      ?auto_204791 - BLOCK
      ?auto_204792 - BLOCK
      ?auto_204793 - BLOCK
      ?auto_204794 - BLOCK
      ?auto_204795 - BLOCK
      ?auto_204796 - BLOCK
    )
    :vars
    (
      ?auto_204797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204796 ?auto_204797 ) ( ON-TABLE ?auto_204786 ) ( not ( = ?auto_204786 ?auto_204787 ) ) ( not ( = ?auto_204786 ?auto_204788 ) ) ( not ( = ?auto_204786 ?auto_204789 ) ) ( not ( = ?auto_204786 ?auto_204790 ) ) ( not ( = ?auto_204786 ?auto_204791 ) ) ( not ( = ?auto_204786 ?auto_204792 ) ) ( not ( = ?auto_204786 ?auto_204793 ) ) ( not ( = ?auto_204786 ?auto_204794 ) ) ( not ( = ?auto_204786 ?auto_204795 ) ) ( not ( = ?auto_204786 ?auto_204796 ) ) ( not ( = ?auto_204786 ?auto_204797 ) ) ( not ( = ?auto_204787 ?auto_204788 ) ) ( not ( = ?auto_204787 ?auto_204789 ) ) ( not ( = ?auto_204787 ?auto_204790 ) ) ( not ( = ?auto_204787 ?auto_204791 ) ) ( not ( = ?auto_204787 ?auto_204792 ) ) ( not ( = ?auto_204787 ?auto_204793 ) ) ( not ( = ?auto_204787 ?auto_204794 ) ) ( not ( = ?auto_204787 ?auto_204795 ) ) ( not ( = ?auto_204787 ?auto_204796 ) ) ( not ( = ?auto_204787 ?auto_204797 ) ) ( not ( = ?auto_204788 ?auto_204789 ) ) ( not ( = ?auto_204788 ?auto_204790 ) ) ( not ( = ?auto_204788 ?auto_204791 ) ) ( not ( = ?auto_204788 ?auto_204792 ) ) ( not ( = ?auto_204788 ?auto_204793 ) ) ( not ( = ?auto_204788 ?auto_204794 ) ) ( not ( = ?auto_204788 ?auto_204795 ) ) ( not ( = ?auto_204788 ?auto_204796 ) ) ( not ( = ?auto_204788 ?auto_204797 ) ) ( not ( = ?auto_204789 ?auto_204790 ) ) ( not ( = ?auto_204789 ?auto_204791 ) ) ( not ( = ?auto_204789 ?auto_204792 ) ) ( not ( = ?auto_204789 ?auto_204793 ) ) ( not ( = ?auto_204789 ?auto_204794 ) ) ( not ( = ?auto_204789 ?auto_204795 ) ) ( not ( = ?auto_204789 ?auto_204796 ) ) ( not ( = ?auto_204789 ?auto_204797 ) ) ( not ( = ?auto_204790 ?auto_204791 ) ) ( not ( = ?auto_204790 ?auto_204792 ) ) ( not ( = ?auto_204790 ?auto_204793 ) ) ( not ( = ?auto_204790 ?auto_204794 ) ) ( not ( = ?auto_204790 ?auto_204795 ) ) ( not ( = ?auto_204790 ?auto_204796 ) ) ( not ( = ?auto_204790 ?auto_204797 ) ) ( not ( = ?auto_204791 ?auto_204792 ) ) ( not ( = ?auto_204791 ?auto_204793 ) ) ( not ( = ?auto_204791 ?auto_204794 ) ) ( not ( = ?auto_204791 ?auto_204795 ) ) ( not ( = ?auto_204791 ?auto_204796 ) ) ( not ( = ?auto_204791 ?auto_204797 ) ) ( not ( = ?auto_204792 ?auto_204793 ) ) ( not ( = ?auto_204792 ?auto_204794 ) ) ( not ( = ?auto_204792 ?auto_204795 ) ) ( not ( = ?auto_204792 ?auto_204796 ) ) ( not ( = ?auto_204792 ?auto_204797 ) ) ( not ( = ?auto_204793 ?auto_204794 ) ) ( not ( = ?auto_204793 ?auto_204795 ) ) ( not ( = ?auto_204793 ?auto_204796 ) ) ( not ( = ?auto_204793 ?auto_204797 ) ) ( not ( = ?auto_204794 ?auto_204795 ) ) ( not ( = ?auto_204794 ?auto_204796 ) ) ( not ( = ?auto_204794 ?auto_204797 ) ) ( not ( = ?auto_204795 ?auto_204796 ) ) ( not ( = ?auto_204795 ?auto_204797 ) ) ( not ( = ?auto_204796 ?auto_204797 ) ) ( ON ?auto_204795 ?auto_204796 ) ( ON ?auto_204794 ?auto_204795 ) ( ON ?auto_204793 ?auto_204794 ) ( ON ?auto_204792 ?auto_204793 ) ( ON ?auto_204791 ?auto_204792 ) ( ON ?auto_204790 ?auto_204791 ) ( ON ?auto_204789 ?auto_204790 ) ( ON ?auto_204788 ?auto_204789 ) ( CLEAR ?auto_204786 ) ( ON ?auto_204787 ?auto_204788 ) ( CLEAR ?auto_204787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204786 ?auto_204787 )
      ( MAKE-11PILE ?auto_204786 ?auto_204787 ?auto_204788 ?auto_204789 ?auto_204790 ?auto_204791 ?auto_204792 ?auto_204793 ?auto_204794 ?auto_204795 ?auto_204796 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204809 - BLOCK
      ?auto_204810 - BLOCK
      ?auto_204811 - BLOCK
      ?auto_204812 - BLOCK
      ?auto_204813 - BLOCK
      ?auto_204814 - BLOCK
      ?auto_204815 - BLOCK
      ?auto_204816 - BLOCK
      ?auto_204817 - BLOCK
      ?auto_204818 - BLOCK
      ?auto_204819 - BLOCK
    )
    :vars
    (
      ?auto_204820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204819 ?auto_204820 ) ( ON-TABLE ?auto_204809 ) ( not ( = ?auto_204809 ?auto_204810 ) ) ( not ( = ?auto_204809 ?auto_204811 ) ) ( not ( = ?auto_204809 ?auto_204812 ) ) ( not ( = ?auto_204809 ?auto_204813 ) ) ( not ( = ?auto_204809 ?auto_204814 ) ) ( not ( = ?auto_204809 ?auto_204815 ) ) ( not ( = ?auto_204809 ?auto_204816 ) ) ( not ( = ?auto_204809 ?auto_204817 ) ) ( not ( = ?auto_204809 ?auto_204818 ) ) ( not ( = ?auto_204809 ?auto_204819 ) ) ( not ( = ?auto_204809 ?auto_204820 ) ) ( not ( = ?auto_204810 ?auto_204811 ) ) ( not ( = ?auto_204810 ?auto_204812 ) ) ( not ( = ?auto_204810 ?auto_204813 ) ) ( not ( = ?auto_204810 ?auto_204814 ) ) ( not ( = ?auto_204810 ?auto_204815 ) ) ( not ( = ?auto_204810 ?auto_204816 ) ) ( not ( = ?auto_204810 ?auto_204817 ) ) ( not ( = ?auto_204810 ?auto_204818 ) ) ( not ( = ?auto_204810 ?auto_204819 ) ) ( not ( = ?auto_204810 ?auto_204820 ) ) ( not ( = ?auto_204811 ?auto_204812 ) ) ( not ( = ?auto_204811 ?auto_204813 ) ) ( not ( = ?auto_204811 ?auto_204814 ) ) ( not ( = ?auto_204811 ?auto_204815 ) ) ( not ( = ?auto_204811 ?auto_204816 ) ) ( not ( = ?auto_204811 ?auto_204817 ) ) ( not ( = ?auto_204811 ?auto_204818 ) ) ( not ( = ?auto_204811 ?auto_204819 ) ) ( not ( = ?auto_204811 ?auto_204820 ) ) ( not ( = ?auto_204812 ?auto_204813 ) ) ( not ( = ?auto_204812 ?auto_204814 ) ) ( not ( = ?auto_204812 ?auto_204815 ) ) ( not ( = ?auto_204812 ?auto_204816 ) ) ( not ( = ?auto_204812 ?auto_204817 ) ) ( not ( = ?auto_204812 ?auto_204818 ) ) ( not ( = ?auto_204812 ?auto_204819 ) ) ( not ( = ?auto_204812 ?auto_204820 ) ) ( not ( = ?auto_204813 ?auto_204814 ) ) ( not ( = ?auto_204813 ?auto_204815 ) ) ( not ( = ?auto_204813 ?auto_204816 ) ) ( not ( = ?auto_204813 ?auto_204817 ) ) ( not ( = ?auto_204813 ?auto_204818 ) ) ( not ( = ?auto_204813 ?auto_204819 ) ) ( not ( = ?auto_204813 ?auto_204820 ) ) ( not ( = ?auto_204814 ?auto_204815 ) ) ( not ( = ?auto_204814 ?auto_204816 ) ) ( not ( = ?auto_204814 ?auto_204817 ) ) ( not ( = ?auto_204814 ?auto_204818 ) ) ( not ( = ?auto_204814 ?auto_204819 ) ) ( not ( = ?auto_204814 ?auto_204820 ) ) ( not ( = ?auto_204815 ?auto_204816 ) ) ( not ( = ?auto_204815 ?auto_204817 ) ) ( not ( = ?auto_204815 ?auto_204818 ) ) ( not ( = ?auto_204815 ?auto_204819 ) ) ( not ( = ?auto_204815 ?auto_204820 ) ) ( not ( = ?auto_204816 ?auto_204817 ) ) ( not ( = ?auto_204816 ?auto_204818 ) ) ( not ( = ?auto_204816 ?auto_204819 ) ) ( not ( = ?auto_204816 ?auto_204820 ) ) ( not ( = ?auto_204817 ?auto_204818 ) ) ( not ( = ?auto_204817 ?auto_204819 ) ) ( not ( = ?auto_204817 ?auto_204820 ) ) ( not ( = ?auto_204818 ?auto_204819 ) ) ( not ( = ?auto_204818 ?auto_204820 ) ) ( not ( = ?auto_204819 ?auto_204820 ) ) ( ON ?auto_204818 ?auto_204819 ) ( ON ?auto_204817 ?auto_204818 ) ( ON ?auto_204816 ?auto_204817 ) ( ON ?auto_204815 ?auto_204816 ) ( ON ?auto_204814 ?auto_204815 ) ( ON ?auto_204813 ?auto_204814 ) ( ON ?auto_204812 ?auto_204813 ) ( ON ?auto_204811 ?auto_204812 ) ( CLEAR ?auto_204809 ) ( ON ?auto_204810 ?auto_204811 ) ( CLEAR ?auto_204810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204809 ?auto_204810 )
      ( MAKE-11PILE ?auto_204809 ?auto_204810 ?auto_204811 ?auto_204812 ?auto_204813 ?auto_204814 ?auto_204815 ?auto_204816 ?auto_204817 ?auto_204818 ?auto_204819 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204832 - BLOCK
      ?auto_204833 - BLOCK
      ?auto_204834 - BLOCK
      ?auto_204835 - BLOCK
      ?auto_204836 - BLOCK
      ?auto_204837 - BLOCK
      ?auto_204838 - BLOCK
      ?auto_204839 - BLOCK
      ?auto_204840 - BLOCK
      ?auto_204841 - BLOCK
      ?auto_204842 - BLOCK
    )
    :vars
    (
      ?auto_204843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204842 ?auto_204843 ) ( not ( = ?auto_204832 ?auto_204833 ) ) ( not ( = ?auto_204832 ?auto_204834 ) ) ( not ( = ?auto_204832 ?auto_204835 ) ) ( not ( = ?auto_204832 ?auto_204836 ) ) ( not ( = ?auto_204832 ?auto_204837 ) ) ( not ( = ?auto_204832 ?auto_204838 ) ) ( not ( = ?auto_204832 ?auto_204839 ) ) ( not ( = ?auto_204832 ?auto_204840 ) ) ( not ( = ?auto_204832 ?auto_204841 ) ) ( not ( = ?auto_204832 ?auto_204842 ) ) ( not ( = ?auto_204832 ?auto_204843 ) ) ( not ( = ?auto_204833 ?auto_204834 ) ) ( not ( = ?auto_204833 ?auto_204835 ) ) ( not ( = ?auto_204833 ?auto_204836 ) ) ( not ( = ?auto_204833 ?auto_204837 ) ) ( not ( = ?auto_204833 ?auto_204838 ) ) ( not ( = ?auto_204833 ?auto_204839 ) ) ( not ( = ?auto_204833 ?auto_204840 ) ) ( not ( = ?auto_204833 ?auto_204841 ) ) ( not ( = ?auto_204833 ?auto_204842 ) ) ( not ( = ?auto_204833 ?auto_204843 ) ) ( not ( = ?auto_204834 ?auto_204835 ) ) ( not ( = ?auto_204834 ?auto_204836 ) ) ( not ( = ?auto_204834 ?auto_204837 ) ) ( not ( = ?auto_204834 ?auto_204838 ) ) ( not ( = ?auto_204834 ?auto_204839 ) ) ( not ( = ?auto_204834 ?auto_204840 ) ) ( not ( = ?auto_204834 ?auto_204841 ) ) ( not ( = ?auto_204834 ?auto_204842 ) ) ( not ( = ?auto_204834 ?auto_204843 ) ) ( not ( = ?auto_204835 ?auto_204836 ) ) ( not ( = ?auto_204835 ?auto_204837 ) ) ( not ( = ?auto_204835 ?auto_204838 ) ) ( not ( = ?auto_204835 ?auto_204839 ) ) ( not ( = ?auto_204835 ?auto_204840 ) ) ( not ( = ?auto_204835 ?auto_204841 ) ) ( not ( = ?auto_204835 ?auto_204842 ) ) ( not ( = ?auto_204835 ?auto_204843 ) ) ( not ( = ?auto_204836 ?auto_204837 ) ) ( not ( = ?auto_204836 ?auto_204838 ) ) ( not ( = ?auto_204836 ?auto_204839 ) ) ( not ( = ?auto_204836 ?auto_204840 ) ) ( not ( = ?auto_204836 ?auto_204841 ) ) ( not ( = ?auto_204836 ?auto_204842 ) ) ( not ( = ?auto_204836 ?auto_204843 ) ) ( not ( = ?auto_204837 ?auto_204838 ) ) ( not ( = ?auto_204837 ?auto_204839 ) ) ( not ( = ?auto_204837 ?auto_204840 ) ) ( not ( = ?auto_204837 ?auto_204841 ) ) ( not ( = ?auto_204837 ?auto_204842 ) ) ( not ( = ?auto_204837 ?auto_204843 ) ) ( not ( = ?auto_204838 ?auto_204839 ) ) ( not ( = ?auto_204838 ?auto_204840 ) ) ( not ( = ?auto_204838 ?auto_204841 ) ) ( not ( = ?auto_204838 ?auto_204842 ) ) ( not ( = ?auto_204838 ?auto_204843 ) ) ( not ( = ?auto_204839 ?auto_204840 ) ) ( not ( = ?auto_204839 ?auto_204841 ) ) ( not ( = ?auto_204839 ?auto_204842 ) ) ( not ( = ?auto_204839 ?auto_204843 ) ) ( not ( = ?auto_204840 ?auto_204841 ) ) ( not ( = ?auto_204840 ?auto_204842 ) ) ( not ( = ?auto_204840 ?auto_204843 ) ) ( not ( = ?auto_204841 ?auto_204842 ) ) ( not ( = ?auto_204841 ?auto_204843 ) ) ( not ( = ?auto_204842 ?auto_204843 ) ) ( ON ?auto_204841 ?auto_204842 ) ( ON ?auto_204840 ?auto_204841 ) ( ON ?auto_204839 ?auto_204840 ) ( ON ?auto_204838 ?auto_204839 ) ( ON ?auto_204837 ?auto_204838 ) ( ON ?auto_204836 ?auto_204837 ) ( ON ?auto_204835 ?auto_204836 ) ( ON ?auto_204834 ?auto_204835 ) ( ON ?auto_204833 ?auto_204834 ) ( ON ?auto_204832 ?auto_204833 ) ( CLEAR ?auto_204832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204832 )
      ( MAKE-11PILE ?auto_204832 ?auto_204833 ?auto_204834 ?auto_204835 ?auto_204836 ?auto_204837 ?auto_204838 ?auto_204839 ?auto_204840 ?auto_204841 ?auto_204842 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_204855 - BLOCK
      ?auto_204856 - BLOCK
      ?auto_204857 - BLOCK
      ?auto_204858 - BLOCK
      ?auto_204859 - BLOCK
      ?auto_204860 - BLOCK
      ?auto_204861 - BLOCK
      ?auto_204862 - BLOCK
      ?auto_204863 - BLOCK
      ?auto_204864 - BLOCK
      ?auto_204865 - BLOCK
    )
    :vars
    (
      ?auto_204866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204865 ?auto_204866 ) ( not ( = ?auto_204855 ?auto_204856 ) ) ( not ( = ?auto_204855 ?auto_204857 ) ) ( not ( = ?auto_204855 ?auto_204858 ) ) ( not ( = ?auto_204855 ?auto_204859 ) ) ( not ( = ?auto_204855 ?auto_204860 ) ) ( not ( = ?auto_204855 ?auto_204861 ) ) ( not ( = ?auto_204855 ?auto_204862 ) ) ( not ( = ?auto_204855 ?auto_204863 ) ) ( not ( = ?auto_204855 ?auto_204864 ) ) ( not ( = ?auto_204855 ?auto_204865 ) ) ( not ( = ?auto_204855 ?auto_204866 ) ) ( not ( = ?auto_204856 ?auto_204857 ) ) ( not ( = ?auto_204856 ?auto_204858 ) ) ( not ( = ?auto_204856 ?auto_204859 ) ) ( not ( = ?auto_204856 ?auto_204860 ) ) ( not ( = ?auto_204856 ?auto_204861 ) ) ( not ( = ?auto_204856 ?auto_204862 ) ) ( not ( = ?auto_204856 ?auto_204863 ) ) ( not ( = ?auto_204856 ?auto_204864 ) ) ( not ( = ?auto_204856 ?auto_204865 ) ) ( not ( = ?auto_204856 ?auto_204866 ) ) ( not ( = ?auto_204857 ?auto_204858 ) ) ( not ( = ?auto_204857 ?auto_204859 ) ) ( not ( = ?auto_204857 ?auto_204860 ) ) ( not ( = ?auto_204857 ?auto_204861 ) ) ( not ( = ?auto_204857 ?auto_204862 ) ) ( not ( = ?auto_204857 ?auto_204863 ) ) ( not ( = ?auto_204857 ?auto_204864 ) ) ( not ( = ?auto_204857 ?auto_204865 ) ) ( not ( = ?auto_204857 ?auto_204866 ) ) ( not ( = ?auto_204858 ?auto_204859 ) ) ( not ( = ?auto_204858 ?auto_204860 ) ) ( not ( = ?auto_204858 ?auto_204861 ) ) ( not ( = ?auto_204858 ?auto_204862 ) ) ( not ( = ?auto_204858 ?auto_204863 ) ) ( not ( = ?auto_204858 ?auto_204864 ) ) ( not ( = ?auto_204858 ?auto_204865 ) ) ( not ( = ?auto_204858 ?auto_204866 ) ) ( not ( = ?auto_204859 ?auto_204860 ) ) ( not ( = ?auto_204859 ?auto_204861 ) ) ( not ( = ?auto_204859 ?auto_204862 ) ) ( not ( = ?auto_204859 ?auto_204863 ) ) ( not ( = ?auto_204859 ?auto_204864 ) ) ( not ( = ?auto_204859 ?auto_204865 ) ) ( not ( = ?auto_204859 ?auto_204866 ) ) ( not ( = ?auto_204860 ?auto_204861 ) ) ( not ( = ?auto_204860 ?auto_204862 ) ) ( not ( = ?auto_204860 ?auto_204863 ) ) ( not ( = ?auto_204860 ?auto_204864 ) ) ( not ( = ?auto_204860 ?auto_204865 ) ) ( not ( = ?auto_204860 ?auto_204866 ) ) ( not ( = ?auto_204861 ?auto_204862 ) ) ( not ( = ?auto_204861 ?auto_204863 ) ) ( not ( = ?auto_204861 ?auto_204864 ) ) ( not ( = ?auto_204861 ?auto_204865 ) ) ( not ( = ?auto_204861 ?auto_204866 ) ) ( not ( = ?auto_204862 ?auto_204863 ) ) ( not ( = ?auto_204862 ?auto_204864 ) ) ( not ( = ?auto_204862 ?auto_204865 ) ) ( not ( = ?auto_204862 ?auto_204866 ) ) ( not ( = ?auto_204863 ?auto_204864 ) ) ( not ( = ?auto_204863 ?auto_204865 ) ) ( not ( = ?auto_204863 ?auto_204866 ) ) ( not ( = ?auto_204864 ?auto_204865 ) ) ( not ( = ?auto_204864 ?auto_204866 ) ) ( not ( = ?auto_204865 ?auto_204866 ) ) ( ON ?auto_204864 ?auto_204865 ) ( ON ?auto_204863 ?auto_204864 ) ( ON ?auto_204862 ?auto_204863 ) ( ON ?auto_204861 ?auto_204862 ) ( ON ?auto_204860 ?auto_204861 ) ( ON ?auto_204859 ?auto_204860 ) ( ON ?auto_204858 ?auto_204859 ) ( ON ?auto_204857 ?auto_204858 ) ( ON ?auto_204856 ?auto_204857 ) ( ON ?auto_204855 ?auto_204856 ) ( CLEAR ?auto_204855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204855 )
      ( MAKE-11PILE ?auto_204855 ?auto_204856 ?auto_204857 ?auto_204858 ?auto_204859 ?auto_204860 ?auto_204861 ?auto_204862 ?auto_204863 ?auto_204864 ?auto_204865 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_204879 - BLOCK
      ?auto_204880 - BLOCK
      ?auto_204881 - BLOCK
      ?auto_204882 - BLOCK
      ?auto_204883 - BLOCK
      ?auto_204884 - BLOCK
      ?auto_204885 - BLOCK
      ?auto_204886 - BLOCK
      ?auto_204887 - BLOCK
      ?auto_204888 - BLOCK
      ?auto_204889 - BLOCK
      ?auto_204890 - BLOCK
    )
    :vars
    (
      ?auto_204891 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_204889 ) ( ON ?auto_204890 ?auto_204891 ) ( CLEAR ?auto_204890 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204879 ) ( ON ?auto_204880 ?auto_204879 ) ( ON ?auto_204881 ?auto_204880 ) ( ON ?auto_204882 ?auto_204881 ) ( ON ?auto_204883 ?auto_204882 ) ( ON ?auto_204884 ?auto_204883 ) ( ON ?auto_204885 ?auto_204884 ) ( ON ?auto_204886 ?auto_204885 ) ( ON ?auto_204887 ?auto_204886 ) ( ON ?auto_204888 ?auto_204887 ) ( ON ?auto_204889 ?auto_204888 ) ( not ( = ?auto_204879 ?auto_204880 ) ) ( not ( = ?auto_204879 ?auto_204881 ) ) ( not ( = ?auto_204879 ?auto_204882 ) ) ( not ( = ?auto_204879 ?auto_204883 ) ) ( not ( = ?auto_204879 ?auto_204884 ) ) ( not ( = ?auto_204879 ?auto_204885 ) ) ( not ( = ?auto_204879 ?auto_204886 ) ) ( not ( = ?auto_204879 ?auto_204887 ) ) ( not ( = ?auto_204879 ?auto_204888 ) ) ( not ( = ?auto_204879 ?auto_204889 ) ) ( not ( = ?auto_204879 ?auto_204890 ) ) ( not ( = ?auto_204879 ?auto_204891 ) ) ( not ( = ?auto_204880 ?auto_204881 ) ) ( not ( = ?auto_204880 ?auto_204882 ) ) ( not ( = ?auto_204880 ?auto_204883 ) ) ( not ( = ?auto_204880 ?auto_204884 ) ) ( not ( = ?auto_204880 ?auto_204885 ) ) ( not ( = ?auto_204880 ?auto_204886 ) ) ( not ( = ?auto_204880 ?auto_204887 ) ) ( not ( = ?auto_204880 ?auto_204888 ) ) ( not ( = ?auto_204880 ?auto_204889 ) ) ( not ( = ?auto_204880 ?auto_204890 ) ) ( not ( = ?auto_204880 ?auto_204891 ) ) ( not ( = ?auto_204881 ?auto_204882 ) ) ( not ( = ?auto_204881 ?auto_204883 ) ) ( not ( = ?auto_204881 ?auto_204884 ) ) ( not ( = ?auto_204881 ?auto_204885 ) ) ( not ( = ?auto_204881 ?auto_204886 ) ) ( not ( = ?auto_204881 ?auto_204887 ) ) ( not ( = ?auto_204881 ?auto_204888 ) ) ( not ( = ?auto_204881 ?auto_204889 ) ) ( not ( = ?auto_204881 ?auto_204890 ) ) ( not ( = ?auto_204881 ?auto_204891 ) ) ( not ( = ?auto_204882 ?auto_204883 ) ) ( not ( = ?auto_204882 ?auto_204884 ) ) ( not ( = ?auto_204882 ?auto_204885 ) ) ( not ( = ?auto_204882 ?auto_204886 ) ) ( not ( = ?auto_204882 ?auto_204887 ) ) ( not ( = ?auto_204882 ?auto_204888 ) ) ( not ( = ?auto_204882 ?auto_204889 ) ) ( not ( = ?auto_204882 ?auto_204890 ) ) ( not ( = ?auto_204882 ?auto_204891 ) ) ( not ( = ?auto_204883 ?auto_204884 ) ) ( not ( = ?auto_204883 ?auto_204885 ) ) ( not ( = ?auto_204883 ?auto_204886 ) ) ( not ( = ?auto_204883 ?auto_204887 ) ) ( not ( = ?auto_204883 ?auto_204888 ) ) ( not ( = ?auto_204883 ?auto_204889 ) ) ( not ( = ?auto_204883 ?auto_204890 ) ) ( not ( = ?auto_204883 ?auto_204891 ) ) ( not ( = ?auto_204884 ?auto_204885 ) ) ( not ( = ?auto_204884 ?auto_204886 ) ) ( not ( = ?auto_204884 ?auto_204887 ) ) ( not ( = ?auto_204884 ?auto_204888 ) ) ( not ( = ?auto_204884 ?auto_204889 ) ) ( not ( = ?auto_204884 ?auto_204890 ) ) ( not ( = ?auto_204884 ?auto_204891 ) ) ( not ( = ?auto_204885 ?auto_204886 ) ) ( not ( = ?auto_204885 ?auto_204887 ) ) ( not ( = ?auto_204885 ?auto_204888 ) ) ( not ( = ?auto_204885 ?auto_204889 ) ) ( not ( = ?auto_204885 ?auto_204890 ) ) ( not ( = ?auto_204885 ?auto_204891 ) ) ( not ( = ?auto_204886 ?auto_204887 ) ) ( not ( = ?auto_204886 ?auto_204888 ) ) ( not ( = ?auto_204886 ?auto_204889 ) ) ( not ( = ?auto_204886 ?auto_204890 ) ) ( not ( = ?auto_204886 ?auto_204891 ) ) ( not ( = ?auto_204887 ?auto_204888 ) ) ( not ( = ?auto_204887 ?auto_204889 ) ) ( not ( = ?auto_204887 ?auto_204890 ) ) ( not ( = ?auto_204887 ?auto_204891 ) ) ( not ( = ?auto_204888 ?auto_204889 ) ) ( not ( = ?auto_204888 ?auto_204890 ) ) ( not ( = ?auto_204888 ?auto_204891 ) ) ( not ( = ?auto_204889 ?auto_204890 ) ) ( not ( = ?auto_204889 ?auto_204891 ) ) ( not ( = ?auto_204890 ?auto_204891 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204890 ?auto_204891 )
      ( !STACK ?auto_204890 ?auto_204889 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_204904 - BLOCK
      ?auto_204905 - BLOCK
      ?auto_204906 - BLOCK
      ?auto_204907 - BLOCK
      ?auto_204908 - BLOCK
      ?auto_204909 - BLOCK
      ?auto_204910 - BLOCK
      ?auto_204911 - BLOCK
      ?auto_204912 - BLOCK
      ?auto_204913 - BLOCK
      ?auto_204914 - BLOCK
      ?auto_204915 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_204914 ) ( ON-TABLE ?auto_204915 ) ( CLEAR ?auto_204915 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204904 ) ( ON ?auto_204905 ?auto_204904 ) ( ON ?auto_204906 ?auto_204905 ) ( ON ?auto_204907 ?auto_204906 ) ( ON ?auto_204908 ?auto_204907 ) ( ON ?auto_204909 ?auto_204908 ) ( ON ?auto_204910 ?auto_204909 ) ( ON ?auto_204911 ?auto_204910 ) ( ON ?auto_204912 ?auto_204911 ) ( ON ?auto_204913 ?auto_204912 ) ( ON ?auto_204914 ?auto_204913 ) ( not ( = ?auto_204904 ?auto_204905 ) ) ( not ( = ?auto_204904 ?auto_204906 ) ) ( not ( = ?auto_204904 ?auto_204907 ) ) ( not ( = ?auto_204904 ?auto_204908 ) ) ( not ( = ?auto_204904 ?auto_204909 ) ) ( not ( = ?auto_204904 ?auto_204910 ) ) ( not ( = ?auto_204904 ?auto_204911 ) ) ( not ( = ?auto_204904 ?auto_204912 ) ) ( not ( = ?auto_204904 ?auto_204913 ) ) ( not ( = ?auto_204904 ?auto_204914 ) ) ( not ( = ?auto_204904 ?auto_204915 ) ) ( not ( = ?auto_204905 ?auto_204906 ) ) ( not ( = ?auto_204905 ?auto_204907 ) ) ( not ( = ?auto_204905 ?auto_204908 ) ) ( not ( = ?auto_204905 ?auto_204909 ) ) ( not ( = ?auto_204905 ?auto_204910 ) ) ( not ( = ?auto_204905 ?auto_204911 ) ) ( not ( = ?auto_204905 ?auto_204912 ) ) ( not ( = ?auto_204905 ?auto_204913 ) ) ( not ( = ?auto_204905 ?auto_204914 ) ) ( not ( = ?auto_204905 ?auto_204915 ) ) ( not ( = ?auto_204906 ?auto_204907 ) ) ( not ( = ?auto_204906 ?auto_204908 ) ) ( not ( = ?auto_204906 ?auto_204909 ) ) ( not ( = ?auto_204906 ?auto_204910 ) ) ( not ( = ?auto_204906 ?auto_204911 ) ) ( not ( = ?auto_204906 ?auto_204912 ) ) ( not ( = ?auto_204906 ?auto_204913 ) ) ( not ( = ?auto_204906 ?auto_204914 ) ) ( not ( = ?auto_204906 ?auto_204915 ) ) ( not ( = ?auto_204907 ?auto_204908 ) ) ( not ( = ?auto_204907 ?auto_204909 ) ) ( not ( = ?auto_204907 ?auto_204910 ) ) ( not ( = ?auto_204907 ?auto_204911 ) ) ( not ( = ?auto_204907 ?auto_204912 ) ) ( not ( = ?auto_204907 ?auto_204913 ) ) ( not ( = ?auto_204907 ?auto_204914 ) ) ( not ( = ?auto_204907 ?auto_204915 ) ) ( not ( = ?auto_204908 ?auto_204909 ) ) ( not ( = ?auto_204908 ?auto_204910 ) ) ( not ( = ?auto_204908 ?auto_204911 ) ) ( not ( = ?auto_204908 ?auto_204912 ) ) ( not ( = ?auto_204908 ?auto_204913 ) ) ( not ( = ?auto_204908 ?auto_204914 ) ) ( not ( = ?auto_204908 ?auto_204915 ) ) ( not ( = ?auto_204909 ?auto_204910 ) ) ( not ( = ?auto_204909 ?auto_204911 ) ) ( not ( = ?auto_204909 ?auto_204912 ) ) ( not ( = ?auto_204909 ?auto_204913 ) ) ( not ( = ?auto_204909 ?auto_204914 ) ) ( not ( = ?auto_204909 ?auto_204915 ) ) ( not ( = ?auto_204910 ?auto_204911 ) ) ( not ( = ?auto_204910 ?auto_204912 ) ) ( not ( = ?auto_204910 ?auto_204913 ) ) ( not ( = ?auto_204910 ?auto_204914 ) ) ( not ( = ?auto_204910 ?auto_204915 ) ) ( not ( = ?auto_204911 ?auto_204912 ) ) ( not ( = ?auto_204911 ?auto_204913 ) ) ( not ( = ?auto_204911 ?auto_204914 ) ) ( not ( = ?auto_204911 ?auto_204915 ) ) ( not ( = ?auto_204912 ?auto_204913 ) ) ( not ( = ?auto_204912 ?auto_204914 ) ) ( not ( = ?auto_204912 ?auto_204915 ) ) ( not ( = ?auto_204913 ?auto_204914 ) ) ( not ( = ?auto_204913 ?auto_204915 ) ) ( not ( = ?auto_204914 ?auto_204915 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_204915 )
      ( !STACK ?auto_204915 ?auto_204914 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_204928 - BLOCK
      ?auto_204929 - BLOCK
      ?auto_204930 - BLOCK
      ?auto_204931 - BLOCK
      ?auto_204932 - BLOCK
      ?auto_204933 - BLOCK
      ?auto_204934 - BLOCK
      ?auto_204935 - BLOCK
      ?auto_204936 - BLOCK
      ?auto_204937 - BLOCK
      ?auto_204938 - BLOCK
      ?auto_204939 - BLOCK
    )
    :vars
    (
      ?auto_204940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204939 ?auto_204940 ) ( ON-TABLE ?auto_204928 ) ( ON ?auto_204929 ?auto_204928 ) ( ON ?auto_204930 ?auto_204929 ) ( ON ?auto_204931 ?auto_204930 ) ( ON ?auto_204932 ?auto_204931 ) ( ON ?auto_204933 ?auto_204932 ) ( ON ?auto_204934 ?auto_204933 ) ( ON ?auto_204935 ?auto_204934 ) ( ON ?auto_204936 ?auto_204935 ) ( ON ?auto_204937 ?auto_204936 ) ( not ( = ?auto_204928 ?auto_204929 ) ) ( not ( = ?auto_204928 ?auto_204930 ) ) ( not ( = ?auto_204928 ?auto_204931 ) ) ( not ( = ?auto_204928 ?auto_204932 ) ) ( not ( = ?auto_204928 ?auto_204933 ) ) ( not ( = ?auto_204928 ?auto_204934 ) ) ( not ( = ?auto_204928 ?auto_204935 ) ) ( not ( = ?auto_204928 ?auto_204936 ) ) ( not ( = ?auto_204928 ?auto_204937 ) ) ( not ( = ?auto_204928 ?auto_204938 ) ) ( not ( = ?auto_204928 ?auto_204939 ) ) ( not ( = ?auto_204928 ?auto_204940 ) ) ( not ( = ?auto_204929 ?auto_204930 ) ) ( not ( = ?auto_204929 ?auto_204931 ) ) ( not ( = ?auto_204929 ?auto_204932 ) ) ( not ( = ?auto_204929 ?auto_204933 ) ) ( not ( = ?auto_204929 ?auto_204934 ) ) ( not ( = ?auto_204929 ?auto_204935 ) ) ( not ( = ?auto_204929 ?auto_204936 ) ) ( not ( = ?auto_204929 ?auto_204937 ) ) ( not ( = ?auto_204929 ?auto_204938 ) ) ( not ( = ?auto_204929 ?auto_204939 ) ) ( not ( = ?auto_204929 ?auto_204940 ) ) ( not ( = ?auto_204930 ?auto_204931 ) ) ( not ( = ?auto_204930 ?auto_204932 ) ) ( not ( = ?auto_204930 ?auto_204933 ) ) ( not ( = ?auto_204930 ?auto_204934 ) ) ( not ( = ?auto_204930 ?auto_204935 ) ) ( not ( = ?auto_204930 ?auto_204936 ) ) ( not ( = ?auto_204930 ?auto_204937 ) ) ( not ( = ?auto_204930 ?auto_204938 ) ) ( not ( = ?auto_204930 ?auto_204939 ) ) ( not ( = ?auto_204930 ?auto_204940 ) ) ( not ( = ?auto_204931 ?auto_204932 ) ) ( not ( = ?auto_204931 ?auto_204933 ) ) ( not ( = ?auto_204931 ?auto_204934 ) ) ( not ( = ?auto_204931 ?auto_204935 ) ) ( not ( = ?auto_204931 ?auto_204936 ) ) ( not ( = ?auto_204931 ?auto_204937 ) ) ( not ( = ?auto_204931 ?auto_204938 ) ) ( not ( = ?auto_204931 ?auto_204939 ) ) ( not ( = ?auto_204931 ?auto_204940 ) ) ( not ( = ?auto_204932 ?auto_204933 ) ) ( not ( = ?auto_204932 ?auto_204934 ) ) ( not ( = ?auto_204932 ?auto_204935 ) ) ( not ( = ?auto_204932 ?auto_204936 ) ) ( not ( = ?auto_204932 ?auto_204937 ) ) ( not ( = ?auto_204932 ?auto_204938 ) ) ( not ( = ?auto_204932 ?auto_204939 ) ) ( not ( = ?auto_204932 ?auto_204940 ) ) ( not ( = ?auto_204933 ?auto_204934 ) ) ( not ( = ?auto_204933 ?auto_204935 ) ) ( not ( = ?auto_204933 ?auto_204936 ) ) ( not ( = ?auto_204933 ?auto_204937 ) ) ( not ( = ?auto_204933 ?auto_204938 ) ) ( not ( = ?auto_204933 ?auto_204939 ) ) ( not ( = ?auto_204933 ?auto_204940 ) ) ( not ( = ?auto_204934 ?auto_204935 ) ) ( not ( = ?auto_204934 ?auto_204936 ) ) ( not ( = ?auto_204934 ?auto_204937 ) ) ( not ( = ?auto_204934 ?auto_204938 ) ) ( not ( = ?auto_204934 ?auto_204939 ) ) ( not ( = ?auto_204934 ?auto_204940 ) ) ( not ( = ?auto_204935 ?auto_204936 ) ) ( not ( = ?auto_204935 ?auto_204937 ) ) ( not ( = ?auto_204935 ?auto_204938 ) ) ( not ( = ?auto_204935 ?auto_204939 ) ) ( not ( = ?auto_204935 ?auto_204940 ) ) ( not ( = ?auto_204936 ?auto_204937 ) ) ( not ( = ?auto_204936 ?auto_204938 ) ) ( not ( = ?auto_204936 ?auto_204939 ) ) ( not ( = ?auto_204936 ?auto_204940 ) ) ( not ( = ?auto_204937 ?auto_204938 ) ) ( not ( = ?auto_204937 ?auto_204939 ) ) ( not ( = ?auto_204937 ?auto_204940 ) ) ( not ( = ?auto_204938 ?auto_204939 ) ) ( not ( = ?auto_204938 ?auto_204940 ) ) ( not ( = ?auto_204939 ?auto_204940 ) ) ( CLEAR ?auto_204937 ) ( ON ?auto_204938 ?auto_204939 ) ( CLEAR ?auto_204938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_204928 ?auto_204929 ?auto_204930 ?auto_204931 ?auto_204932 ?auto_204933 ?auto_204934 ?auto_204935 ?auto_204936 ?auto_204937 ?auto_204938 )
      ( MAKE-12PILE ?auto_204928 ?auto_204929 ?auto_204930 ?auto_204931 ?auto_204932 ?auto_204933 ?auto_204934 ?auto_204935 ?auto_204936 ?auto_204937 ?auto_204938 ?auto_204939 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_204953 - BLOCK
      ?auto_204954 - BLOCK
      ?auto_204955 - BLOCK
      ?auto_204956 - BLOCK
      ?auto_204957 - BLOCK
      ?auto_204958 - BLOCK
      ?auto_204959 - BLOCK
      ?auto_204960 - BLOCK
      ?auto_204961 - BLOCK
      ?auto_204962 - BLOCK
      ?auto_204963 - BLOCK
      ?auto_204964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204964 ) ( ON-TABLE ?auto_204953 ) ( ON ?auto_204954 ?auto_204953 ) ( ON ?auto_204955 ?auto_204954 ) ( ON ?auto_204956 ?auto_204955 ) ( ON ?auto_204957 ?auto_204956 ) ( ON ?auto_204958 ?auto_204957 ) ( ON ?auto_204959 ?auto_204958 ) ( ON ?auto_204960 ?auto_204959 ) ( ON ?auto_204961 ?auto_204960 ) ( ON ?auto_204962 ?auto_204961 ) ( not ( = ?auto_204953 ?auto_204954 ) ) ( not ( = ?auto_204953 ?auto_204955 ) ) ( not ( = ?auto_204953 ?auto_204956 ) ) ( not ( = ?auto_204953 ?auto_204957 ) ) ( not ( = ?auto_204953 ?auto_204958 ) ) ( not ( = ?auto_204953 ?auto_204959 ) ) ( not ( = ?auto_204953 ?auto_204960 ) ) ( not ( = ?auto_204953 ?auto_204961 ) ) ( not ( = ?auto_204953 ?auto_204962 ) ) ( not ( = ?auto_204953 ?auto_204963 ) ) ( not ( = ?auto_204953 ?auto_204964 ) ) ( not ( = ?auto_204954 ?auto_204955 ) ) ( not ( = ?auto_204954 ?auto_204956 ) ) ( not ( = ?auto_204954 ?auto_204957 ) ) ( not ( = ?auto_204954 ?auto_204958 ) ) ( not ( = ?auto_204954 ?auto_204959 ) ) ( not ( = ?auto_204954 ?auto_204960 ) ) ( not ( = ?auto_204954 ?auto_204961 ) ) ( not ( = ?auto_204954 ?auto_204962 ) ) ( not ( = ?auto_204954 ?auto_204963 ) ) ( not ( = ?auto_204954 ?auto_204964 ) ) ( not ( = ?auto_204955 ?auto_204956 ) ) ( not ( = ?auto_204955 ?auto_204957 ) ) ( not ( = ?auto_204955 ?auto_204958 ) ) ( not ( = ?auto_204955 ?auto_204959 ) ) ( not ( = ?auto_204955 ?auto_204960 ) ) ( not ( = ?auto_204955 ?auto_204961 ) ) ( not ( = ?auto_204955 ?auto_204962 ) ) ( not ( = ?auto_204955 ?auto_204963 ) ) ( not ( = ?auto_204955 ?auto_204964 ) ) ( not ( = ?auto_204956 ?auto_204957 ) ) ( not ( = ?auto_204956 ?auto_204958 ) ) ( not ( = ?auto_204956 ?auto_204959 ) ) ( not ( = ?auto_204956 ?auto_204960 ) ) ( not ( = ?auto_204956 ?auto_204961 ) ) ( not ( = ?auto_204956 ?auto_204962 ) ) ( not ( = ?auto_204956 ?auto_204963 ) ) ( not ( = ?auto_204956 ?auto_204964 ) ) ( not ( = ?auto_204957 ?auto_204958 ) ) ( not ( = ?auto_204957 ?auto_204959 ) ) ( not ( = ?auto_204957 ?auto_204960 ) ) ( not ( = ?auto_204957 ?auto_204961 ) ) ( not ( = ?auto_204957 ?auto_204962 ) ) ( not ( = ?auto_204957 ?auto_204963 ) ) ( not ( = ?auto_204957 ?auto_204964 ) ) ( not ( = ?auto_204958 ?auto_204959 ) ) ( not ( = ?auto_204958 ?auto_204960 ) ) ( not ( = ?auto_204958 ?auto_204961 ) ) ( not ( = ?auto_204958 ?auto_204962 ) ) ( not ( = ?auto_204958 ?auto_204963 ) ) ( not ( = ?auto_204958 ?auto_204964 ) ) ( not ( = ?auto_204959 ?auto_204960 ) ) ( not ( = ?auto_204959 ?auto_204961 ) ) ( not ( = ?auto_204959 ?auto_204962 ) ) ( not ( = ?auto_204959 ?auto_204963 ) ) ( not ( = ?auto_204959 ?auto_204964 ) ) ( not ( = ?auto_204960 ?auto_204961 ) ) ( not ( = ?auto_204960 ?auto_204962 ) ) ( not ( = ?auto_204960 ?auto_204963 ) ) ( not ( = ?auto_204960 ?auto_204964 ) ) ( not ( = ?auto_204961 ?auto_204962 ) ) ( not ( = ?auto_204961 ?auto_204963 ) ) ( not ( = ?auto_204961 ?auto_204964 ) ) ( not ( = ?auto_204962 ?auto_204963 ) ) ( not ( = ?auto_204962 ?auto_204964 ) ) ( not ( = ?auto_204963 ?auto_204964 ) ) ( CLEAR ?auto_204962 ) ( ON ?auto_204963 ?auto_204964 ) ( CLEAR ?auto_204963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_204953 ?auto_204954 ?auto_204955 ?auto_204956 ?auto_204957 ?auto_204958 ?auto_204959 ?auto_204960 ?auto_204961 ?auto_204962 ?auto_204963 )
      ( MAKE-12PILE ?auto_204953 ?auto_204954 ?auto_204955 ?auto_204956 ?auto_204957 ?auto_204958 ?auto_204959 ?auto_204960 ?auto_204961 ?auto_204962 ?auto_204963 ?auto_204964 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_204977 - BLOCK
      ?auto_204978 - BLOCK
      ?auto_204979 - BLOCK
      ?auto_204980 - BLOCK
      ?auto_204981 - BLOCK
      ?auto_204982 - BLOCK
      ?auto_204983 - BLOCK
      ?auto_204984 - BLOCK
      ?auto_204985 - BLOCK
      ?auto_204986 - BLOCK
      ?auto_204987 - BLOCK
      ?auto_204988 - BLOCK
    )
    :vars
    (
      ?auto_204989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204988 ?auto_204989 ) ( ON-TABLE ?auto_204977 ) ( ON ?auto_204978 ?auto_204977 ) ( ON ?auto_204979 ?auto_204978 ) ( ON ?auto_204980 ?auto_204979 ) ( ON ?auto_204981 ?auto_204980 ) ( ON ?auto_204982 ?auto_204981 ) ( ON ?auto_204983 ?auto_204982 ) ( ON ?auto_204984 ?auto_204983 ) ( ON ?auto_204985 ?auto_204984 ) ( not ( = ?auto_204977 ?auto_204978 ) ) ( not ( = ?auto_204977 ?auto_204979 ) ) ( not ( = ?auto_204977 ?auto_204980 ) ) ( not ( = ?auto_204977 ?auto_204981 ) ) ( not ( = ?auto_204977 ?auto_204982 ) ) ( not ( = ?auto_204977 ?auto_204983 ) ) ( not ( = ?auto_204977 ?auto_204984 ) ) ( not ( = ?auto_204977 ?auto_204985 ) ) ( not ( = ?auto_204977 ?auto_204986 ) ) ( not ( = ?auto_204977 ?auto_204987 ) ) ( not ( = ?auto_204977 ?auto_204988 ) ) ( not ( = ?auto_204977 ?auto_204989 ) ) ( not ( = ?auto_204978 ?auto_204979 ) ) ( not ( = ?auto_204978 ?auto_204980 ) ) ( not ( = ?auto_204978 ?auto_204981 ) ) ( not ( = ?auto_204978 ?auto_204982 ) ) ( not ( = ?auto_204978 ?auto_204983 ) ) ( not ( = ?auto_204978 ?auto_204984 ) ) ( not ( = ?auto_204978 ?auto_204985 ) ) ( not ( = ?auto_204978 ?auto_204986 ) ) ( not ( = ?auto_204978 ?auto_204987 ) ) ( not ( = ?auto_204978 ?auto_204988 ) ) ( not ( = ?auto_204978 ?auto_204989 ) ) ( not ( = ?auto_204979 ?auto_204980 ) ) ( not ( = ?auto_204979 ?auto_204981 ) ) ( not ( = ?auto_204979 ?auto_204982 ) ) ( not ( = ?auto_204979 ?auto_204983 ) ) ( not ( = ?auto_204979 ?auto_204984 ) ) ( not ( = ?auto_204979 ?auto_204985 ) ) ( not ( = ?auto_204979 ?auto_204986 ) ) ( not ( = ?auto_204979 ?auto_204987 ) ) ( not ( = ?auto_204979 ?auto_204988 ) ) ( not ( = ?auto_204979 ?auto_204989 ) ) ( not ( = ?auto_204980 ?auto_204981 ) ) ( not ( = ?auto_204980 ?auto_204982 ) ) ( not ( = ?auto_204980 ?auto_204983 ) ) ( not ( = ?auto_204980 ?auto_204984 ) ) ( not ( = ?auto_204980 ?auto_204985 ) ) ( not ( = ?auto_204980 ?auto_204986 ) ) ( not ( = ?auto_204980 ?auto_204987 ) ) ( not ( = ?auto_204980 ?auto_204988 ) ) ( not ( = ?auto_204980 ?auto_204989 ) ) ( not ( = ?auto_204981 ?auto_204982 ) ) ( not ( = ?auto_204981 ?auto_204983 ) ) ( not ( = ?auto_204981 ?auto_204984 ) ) ( not ( = ?auto_204981 ?auto_204985 ) ) ( not ( = ?auto_204981 ?auto_204986 ) ) ( not ( = ?auto_204981 ?auto_204987 ) ) ( not ( = ?auto_204981 ?auto_204988 ) ) ( not ( = ?auto_204981 ?auto_204989 ) ) ( not ( = ?auto_204982 ?auto_204983 ) ) ( not ( = ?auto_204982 ?auto_204984 ) ) ( not ( = ?auto_204982 ?auto_204985 ) ) ( not ( = ?auto_204982 ?auto_204986 ) ) ( not ( = ?auto_204982 ?auto_204987 ) ) ( not ( = ?auto_204982 ?auto_204988 ) ) ( not ( = ?auto_204982 ?auto_204989 ) ) ( not ( = ?auto_204983 ?auto_204984 ) ) ( not ( = ?auto_204983 ?auto_204985 ) ) ( not ( = ?auto_204983 ?auto_204986 ) ) ( not ( = ?auto_204983 ?auto_204987 ) ) ( not ( = ?auto_204983 ?auto_204988 ) ) ( not ( = ?auto_204983 ?auto_204989 ) ) ( not ( = ?auto_204984 ?auto_204985 ) ) ( not ( = ?auto_204984 ?auto_204986 ) ) ( not ( = ?auto_204984 ?auto_204987 ) ) ( not ( = ?auto_204984 ?auto_204988 ) ) ( not ( = ?auto_204984 ?auto_204989 ) ) ( not ( = ?auto_204985 ?auto_204986 ) ) ( not ( = ?auto_204985 ?auto_204987 ) ) ( not ( = ?auto_204985 ?auto_204988 ) ) ( not ( = ?auto_204985 ?auto_204989 ) ) ( not ( = ?auto_204986 ?auto_204987 ) ) ( not ( = ?auto_204986 ?auto_204988 ) ) ( not ( = ?auto_204986 ?auto_204989 ) ) ( not ( = ?auto_204987 ?auto_204988 ) ) ( not ( = ?auto_204987 ?auto_204989 ) ) ( not ( = ?auto_204988 ?auto_204989 ) ) ( ON ?auto_204987 ?auto_204988 ) ( CLEAR ?auto_204985 ) ( ON ?auto_204986 ?auto_204987 ) ( CLEAR ?auto_204986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_204977 ?auto_204978 ?auto_204979 ?auto_204980 ?auto_204981 ?auto_204982 ?auto_204983 ?auto_204984 ?auto_204985 ?auto_204986 )
      ( MAKE-12PILE ?auto_204977 ?auto_204978 ?auto_204979 ?auto_204980 ?auto_204981 ?auto_204982 ?auto_204983 ?auto_204984 ?auto_204985 ?auto_204986 ?auto_204987 ?auto_204988 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205002 - BLOCK
      ?auto_205003 - BLOCK
      ?auto_205004 - BLOCK
      ?auto_205005 - BLOCK
      ?auto_205006 - BLOCK
      ?auto_205007 - BLOCK
      ?auto_205008 - BLOCK
      ?auto_205009 - BLOCK
      ?auto_205010 - BLOCK
      ?auto_205011 - BLOCK
      ?auto_205012 - BLOCK
      ?auto_205013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205013 ) ( ON-TABLE ?auto_205002 ) ( ON ?auto_205003 ?auto_205002 ) ( ON ?auto_205004 ?auto_205003 ) ( ON ?auto_205005 ?auto_205004 ) ( ON ?auto_205006 ?auto_205005 ) ( ON ?auto_205007 ?auto_205006 ) ( ON ?auto_205008 ?auto_205007 ) ( ON ?auto_205009 ?auto_205008 ) ( ON ?auto_205010 ?auto_205009 ) ( not ( = ?auto_205002 ?auto_205003 ) ) ( not ( = ?auto_205002 ?auto_205004 ) ) ( not ( = ?auto_205002 ?auto_205005 ) ) ( not ( = ?auto_205002 ?auto_205006 ) ) ( not ( = ?auto_205002 ?auto_205007 ) ) ( not ( = ?auto_205002 ?auto_205008 ) ) ( not ( = ?auto_205002 ?auto_205009 ) ) ( not ( = ?auto_205002 ?auto_205010 ) ) ( not ( = ?auto_205002 ?auto_205011 ) ) ( not ( = ?auto_205002 ?auto_205012 ) ) ( not ( = ?auto_205002 ?auto_205013 ) ) ( not ( = ?auto_205003 ?auto_205004 ) ) ( not ( = ?auto_205003 ?auto_205005 ) ) ( not ( = ?auto_205003 ?auto_205006 ) ) ( not ( = ?auto_205003 ?auto_205007 ) ) ( not ( = ?auto_205003 ?auto_205008 ) ) ( not ( = ?auto_205003 ?auto_205009 ) ) ( not ( = ?auto_205003 ?auto_205010 ) ) ( not ( = ?auto_205003 ?auto_205011 ) ) ( not ( = ?auto_205003 ?auto_205012 ) ) ( not ( = ?auto_205003 ?auto_205013 ) ) ( not ( = ?auto_205004 ?auto_205005 ) ) ( not ( = ?auto_205004 ?auto_205006 ) ) ( not ( = ?auto_205004 ?auto_205007 ) ) ( not ( = ?auto_205004 ?auto_205008 ) ) ( not ( = ?auto_205004 ?auto_205009 ) ) ( not ( = ?auto_205004 ?auto_205010 ) ) ( not ( = ?auto_205004 ?auto_205011 ) ) ( not ( = ?auto_205004 ?auto_205012 ) ) ( not ( = ?auto_205004 ?auto_205013 ) ) ( not ( = ?auto_205005 ?auto_205006 ) ) ( not ( = ?auto_205005 ?auto_205007 ) ) ( not ( = ?auto_205005 ?auto_205008 ) ) ( not ( = ?auto_205005 ?auto_205009 ) ) ( not ( = ?auto_205005 ?auto_205010 ) ) ( not ( = ?auto_205005 ?auto_205011 ) ) ( not ( = ?auto_205005 ?auto_205012 ) ) ( not ( = ?auto_205005 ?auto_205013 ) ) ( not ( = ?auto_205006 ?auto_205007 ) ) ( not ( = ?auto_205006 ?auto_205008 ) ) ( not ( = ?auto_205006 ?auto_205009 ) ) ( not ( = ?auto_205006 ?auto_205010 ) ) ( not ( = ?auto_205006 ?auto_205011 ) ) ( not ( = ?auto_205006 ?auto_205012 ) ) ( not ( = ?auto_205006 ?auto_205013 ) ) ( not ( = ?auto_205007 ?auto_205008 ) ) ( not ( = ?auto_205007 ?auto_205009 ) ) ( not ( = ?auto_205007 ?auto_205010 ) ) ( not ( = ?auto_205007 ?auto_205011 ) ) ( not ( = ?auto_205007 ?auto_205012 ) ) ( not ( = ?auto_205007 ?auto_205013 ) ) ( not ( = ?auto_205008 ?auto_205009 ) ) ( not ( = ?auto_205008 ?auto_205010 ) ) ( not ( = ?auto_205008 ?auto_205011 ) ) ( not ( = ?auto_205008 ?auto_205012 ) ) ( not ( = ?auto_205008 ?auto_205013 ) ) ( not ( = ?auto_205009 ?auto_205010 ) ) ( not ( = ?auto_205009 ?auto_205011 ) ) ( not ( = ?auto_205009 ?auto_205012 ) ) ( not ( = ?auto_205009 ?auto_205013 ) ) ( not ( = ?auto_205010 ?auto_205011 ) ) ( not ( = ?auto_205010 ?auto_205012 ) ) ( not ( = ?auto_205010 ?auto_205013 ) ) ( not ( = ?auto_205011 ?auto_205012 ) ) ( not ( = ?auto_205011 ?auto_205013 ) ) ( not ( = ?auto_205012 ?auto_205013 ) ) ( ON ?auto_205012 ?auto_205013 ) ( CLEAR ?auto_205010 ) ( ON ?auto_205011 ?auto_205012 ) ( CLEAR ?auto_205011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_205002 ?auto_205003 ?auto_205004 ?auto_205005 ?auto_205006 ?auto_205007 ?auto_205008 ?auto_205009 ?auto_205010 ?auto_205011 )
      ( MAKE-12PILE ?auto_205002 ?auto_205003 ?auto_205004 ?auto_205005 ?auto_205006 ?auto_205007 ?auto_205008 ?auto_205009 ?auto_205010 ?auto_205011 ?auto_205012 ?auto_205013 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205026 - BLOCK
      ?auto_205027 - BLOCK
      ?auto_205028 - BLOCK
      ?auto_205029 - BLOCK
      ?auto_205030 - BLOCK
      ?auto_205031 - BLOCK
      ?auto_205032 - BLOCK
      ?auto_205033 - BLOCK
      ?auto_205034 - BLOCK
      ?auto_205035 - BLOCK
      ?auto_205036 - BLOCK
      ?auto_205037 - BLOCK
    )
    :vars
    (
      ?auto_205038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205037 ?auto_205038 ) ( ON-TABLE ?auto_205026 ) ( ON ?auto_205027 ?auto_205026 ) ( ON ?auto_205028 ?auto_205027 ) ( ON ?auto_205029 ?auto_205028 ) ( ON ?auto_205030 ?auto_205029 ) ( ON ?auto_205031 ?auto_205030 ) ( ON ?auto_205032 ?auto_205031 ) ( ON ?auto_205033 ?auto_205032 ) ( not ( = ?auto_205026 ?auto_205027 ) ) ( not ( = ?auto_205026 ?auto_205028 ) ) ( not ( = ?auto_205026 ?auto_205029 ) ) ( not ( = ?auto_205026 ?auto_205030 ) ) ( not ( = ?auto_205026 ?auto_205031 ) ) ( not ( = ?auto_205026 ?auto_205032 ) ) ( not ( = ?auto_205026 ?auto_205033 ) ) ( not ( = ?auto_205026 ?auto_205034 ) ) ( not ( = ?auto_205026 ?auto_205035 ) ) ( not ( = ?auto_205026 ?auto_205036 ) ) ( not ( = ?auto_205026 ?auto_205037 ) ) ( not ( = ?auto_205026 ?auto_205038 ) ) ( not ( = ?auto_205027 ?auto_205028 ) ) ( not ( = ?auto_205027 ?auto_205029 ) ) ( not ( = ?auto_205027 ?auto_205030 ) ) ( not ( = ?auto_205027 ?auto_205031 ) ) ( not ( = ?auto_205027 ?auto_205032 ) ) ( not ( = ?auto_205027 ?auto_205033 ) ) ( not ( = ?auto_205027 ?auto_205034 ) ) ( not ( = ?auto_205027 ?auto_205035 ) ) ( not ( = ?auto_205027 ?auto_205036 ) ) ( not ( = ?auto_205027 ?auto_205037 ) ) ( not ( = ?auto_205027 ?auto_205038 ) ) ( not ( = ?auto_205028 ?auto_205029 ) ) ( not ( = ?auto_205028 ?auto_205030 ) ) ( not ( = ?auto_205028 ?auto_205031 ) ) ( not ( = ?auto_205028 ?auto_205032 ) ) ( not ( = ?auto_205028 ?auto_205033 ) ) ( not ( = ?auto_205028 ?auto_205034 ) ) ( not ( = ?auto_205028 ?auto_205035 ) ) ( not ( = ?auto_205028 ?auto_205036 ) ) ( not ( = ?auto_205028 ?auto_205037 ) ) ( not ( = ?auto_205028 ?auto_205038 ) ) ( not ( = ?auto_205029 ?auto_205030 ) ) ( not ( = ?auto_205029 ?auto_205031 ) ) ( not ( = ?auto_205029 ?auto_205032 ) ) ( not ( = ?auto_205029 ?auto_205033 ) ) ( not ( = ?auto_205029 ?auto_205034 ) ) ( not ( = ?auto_205029 ?auto_205035 ) ) ( not ( = ?auto_205029 ?auto_205036 ) ) ( not ( = ?auto_205029 ?auto_205037 ) ) ( not ( = ?auto_205029 ?auto_205038 ) ) ( not ( = ?auto_205030 ?auto_205031 ) ) ( not ( = ?auto_205030 ?auto_205032 ) ) ( not ( = ?auto_205030 ?auto_205033 ) ) ( not ( = ?auto_205030 ?auto_205034 ) ) ( not ( = ?auto_205030 ?auto_205035 ) ) ( not ( = ?auto_205030 ?auto_205036 ) ) ( not ( = ?auto_205030 ?auto_205037 ) ) ( not ( = ?auto_205030 ?auto_205038 ) ) ( not ( = ?auto_205031 ?auto_205032 ) ) ( not ( = ?auto_205031 ?auto_205033 ) ) ( not ( = ?auto_205031 ?auto_205034 ) ) ( not ( = ?auto_205031 ?auto_205035 ) ) ( not ( = ?auto_205031 ?auto_205036 ) ) ( not ( = ?auto_205031 ?auto_205037 ) ) ( not ( = ?auto_205031 ?auto_205038 ) ) ( not ( = ?auto_205032 ?auto_205033 ) ) ( not ( = ?auto_205032 ?auto_205034 ) ) ( not ( = ?auto_205032 ?auto_205035 ) ) ( not ( = ?auto_205032 ?auto_205036 ) ) ( not ( = ?auto_205032 ?auto_205037 ) ) ( not ( = ?auto_205032 ?auto_205038 ) ) ( not ( = ?auto_205033 ?auto_205034 ) ) ( not ( = ?auto_205033 ?auto_205035 ) ) ( not ( = ?auto_205033 ?auto_205036 ) ) ( not ( = ?auto_205033 ?auto_205037 ) ) ( not ( = ?auto_205033 ?auto_205038 ) ) ( not ( = ?auto_205034 ?auto_205035 ) ) ( not ( = ?auto_205034 ?auto_205036 ) ) ( not ( = ?auto_205034 ?auto_205037 ) ) ( not ( = ?auto_205034 ?auto_205038 ) ) ( not ( = ?auto_205035 ?auto_205036 ) ) ( not ( = ?auto_205035 ?auto_205037 ) ) ( not ( = ?auto_205035 ?auto_205038 ) ) ( not ( = ?auto_205036 ?auto_205037 ) ) ( not ( = ?auto_205036 ?auto_205038 ) ) ( not ( = ?auto_205037 ?auto_205038 ) ) ( ON ?auto_205036 ?auto_205037 ) ( ON ?auto_205035 ?auto_205036 ) ( CLEAR ?auto_205033 ) ( ON ?auto_205034 ?auto_205035 ) ( CLEAR ?auto_205034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_205026 ?auto_205027 ?auto_205028 ?auto_205029 ?auto_205030 ?auto_205031 ?auto_205032 ?auto_205033 ?auto_205034 )
      ( MAKE-12PILE ?auto_205026 ?auto_205027 ?auto_205028 ?auto_205029 ?auto_205030 ?auto_205031 ?auto_205032 ?auto_205033 ?auto_205034 ?auto_205035 ?auto_205036 ?auto_205037 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205051 - BLOCK
      ?auto_205052 - BLOCK
      ?auto_205053 - BLOCK
      ?auto_205054 - BLOCK
      ?auto_205055 - BLOCK
      ?auto_205056 - BLOCK
      ?auto_205057 - BLOCK
      ?auto_205058 - BLOCK
      ?auto_205059 - BLOCK
      ?auto_205060 - BLOCK
      ?auto_205061 - BLOCK
      ?auto_205062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205062 ) ( ON-TABLE ?auto_205051 ) ( ON ?auto_205052 ?auto_205051 ) ( ON ?auto_205053 ?auto_205052 ) ( ON ?auto_205054 ?auto_205053 ) ( ON ?auto_205055 ?auto_205054 ) ( ON ?auto_205056 ?auto_205055 ) ( ON ?auto_205057 ?auto_205056 ) ( ON ?auto_205058 ?auto_205057 ) ( not ( = ?auto_205051 ?auto_205052 ) ) ( not ( = ?auto_205051 ?auto_205053 ) ) ( not ( = ?auto_205051 ?auto_205054 ) ) ( not ( = ?auto_205051 ?auto_205055 ) ) ( not ( = ?auto_205051 ?auto_205056 ) ) ( not ( = ?auto_205051 ?auto_205057 ) ) ( not ( = ?auto_205051 ?auto_205058 ) ) ( not ( = ?auto_205051 ?auto_205059 ) ) ( not ( = ?auto_205051 ?auto_205060 ) ) ( not ( = ?auto_205051 ?auto_205061 ) ) ( not ( = ?auto_205051 ?auto_205062 ) ) ( not ( = ?auto_205052 ?auto_205053 ) ) ( not ( = ?auto_205052 ?auto_205054 ) ) ( not ( = ?auto_205052 ?auto_205055 ) ) ( not ( = ?auto_205052 ?auto_205056 ) ) ( not ( = ?auto_205052 ?auto_205057 ) ) ( not ( = ?auto_205052 ?auto_205058 ) ) ( not ( = ?auto_205052 ?auto_205059 ) ) ( not ( = ?auto_205052 ?auto_205060 ) ) ( not ( = ?auto_205052 ?auto_205061 ) ) ( not ( = ?auto_205052 ?auto_205062 ) ) ( not ( = ?auto_205053 ?auto_205054 ) ) ( not ( = ?auto_205053 ?auto_205055 ) ) ( not ( = ?auto_205053 ?auto_205056 ) ) ( not ( = ?auto_205053 ?auto_205057 ) ) ( not ( = ?auto_205053 ?auto_205058 ) ) ( not ( = ?auto_205053 ?auto_205059 ) ) ( not ( = ?auto_205053 ?auto_205060 ) ) ( not ( = ?auto_205053 ?auto_205061 ) ) ( not ( = ?auto_205053 ?auto_205062 ) ) ( not ( = ?auto_205054 ?auto_205055 ) ) ( not ( = ?auto_205054 ?auto_205056 ) ) ( not ( = ?auto_205054 ?auto_205057 ) ) ( not ( = ?auto_205054 ?auto_205058 ) ) ( not ( = ?auto_205054 ?auto_205059 ) ) ( not ( = ?auto_205054 ?auto_205060 ) ) ( not ( = ?auto_205054 ?auto_205061 ) ) ( not ( = ?auto_205054 ?auto_205062 ) ) ( not ( = ?auto_205055 ?auto_205056 ) ) ( not ( = ?auto_205055 ?auto_205057 ) ) ( not ( = ?auto_205055 ?auto_205058 ) ) ( not ( = ?auto_205055 ?auto_205059 ) ) ( not ( = ?auto_205055 ?auto_205060 ) ) ( not ( = ?auto_205055 ?auto_205061 ) ) ( not ( = ?auto_205055 ?auto_205062 ) ) ( not ( = ?auto_205056 ?auto_205057 ) ) ( not ( = ?auto_205056 ?auto_205058 ) ) ( not ( = ?auto_205056 ?auto_205059 ) ) ( not ( = ?auto_205056 ?auto_205060 ) ) ( not ( = ?auto_205056 ?auto_205061 ) ) ( not ( = ?auto_205056 ?auto_205062 ) ) ( not ( = ?auto_205057 ?auto_205058 ) ) ( not ( = ?auto_205057 ?auto_205059 ) ) ( not ( = ?auto_205057 ?auto_205060 ) ) ( not ( = ?auto_205057 ?auto_205061 ) ) ( not ( = ?auto_205057 ?auto_205062 ) ) ( not ( = ?auto_205058 ?auto_205059 ) ) ( not ( = ?auto_205058 ?auto_205060 ) ) ( not ( = ?auto_205058 ?auto_205061 ) ) ( not ( = ?auto_205058 ?auto_205062 ) ) ( not ( = ?auto_205059 ?auto_205060 ) ) ( not ( = ?auto_205059 ?auto_205061 ) ) ( not ( = ?auto_205059 ?auto_205062 ) ) ( not ( = ?auto_205060 ?auto_205061 ) ) ( not ( = ?auto_205060 ?auto_205062 ) ) ( not ( = ?auto_205061 ?auto_205062 ) ) ( ON ?auto_205061 ?auto_205062 ) ( ON ?auto_205060 ?auto_205061 ) ( CLEAR ?auto_205058 ) ( ON ?auto_205059 ?auto_205060 ) ( CLEAR ?auto_205059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_205051 ?auto_205052 ?auto_205053 ?auto_205054 ?auto_205055 ?auto_205056 ?auto_205057 ?auto_205058 ?auto_205059 )
      ( MAKE-12PILE ?auto_205051 ?auto_205052 ?auto_205053 ?auto_205054 ?auto_205055 ?auto_205056 ?auto_205057 ?auto_205058 ?auto_205059 ?auto_205060 ?auto_205061 ?auto_205062 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205075 - BLOCK
      ?auto_205076 - BLOCK
      ?auto_205077 - BLOCK
      ?auto_205078 - BLOCK
      ?auto_205079 - BLOCK
      ?auto_205080 - BLOCK
      ?auto_205081 - BLOCK
      ?auto_205082 - BLOCK
      ?auto_205083 - BLOCK
      ?auto_205084 - BLOCK
      ?auto_205085 - BLOCK
      ?auto_205086 - BLOCK
    )
    :vars
    (
      ?auto_205087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205086 ?auto_205087 ) ( ON-TABLE ?auto_205075 ) ( ON ?auto_205076 ?auto_205075 ) ( ON ?auto_205077 ?auto_205076 ) ( ON ?auto_205078 ?auto_205077 ) ( ON ?auto_205079 ?auto_205078 ) ( ON ?auto_205080 ?auto_205079 ) ( ON ?auto_205081 ?auto_205080 ) ( not ( = ?auto_205075 ?auto_205076 ) ) ( not ( = ?auto_205075 ?auto_205077 ) ) ( not ( = ?auto_205075 ?auto_205078 ) ) ( not ( = ?auto_205075 ?auto_205079 ) ) ( not ( = ?auto_205075 ?auto_205080 ) ) ( not ( = ?auto_205075 ?auto_205081 ) ) ( not ( = ?auto_205075 ?auto_205082 ) ) ( not ( = ?auto_205075 ?auto_205083 ) ) ( not ( = ?auto_205075 ?auto_205084 ) ) ( not ( = ?auto_205075 ?auto_205085 ) ) ( not ( = ?auto_205075 ?auto_205086 ) ) ( not ( = ?auto_205075 ?auto_205087 ) ) ( not ( = ?auto_205076 ?auto_205077 ) ) ( not ( = ?auto_205076 ?auto_205078 ) ) ( not ( = ?auto_205076 ?auto_205079 ) ) ( not ( = ?auto_205076 ?auto_205080 ) ) ( not ( = ?auto_205076 ?auto_205081 ) ) ( not ( = ?auto_205076 ?auto_205082 ) ) ( not ( = ?auto_205076 ?auto_205083 ) ) ( not ( = ?auto_205076 ?auto_205084 ) ) ( not ( = ?auto_205076 ?auto_205085 ) ) ( not ( = ?auto_205076 ?auto_205086 ) ) ( not ( = ?auto_205076 ?auto_205087 ) ) ( not ( = ?auto_205077 ?auto_205078 ) ) ( not ( = ?auto_205077 ?auto_205079 ) ) ( not ( = ?auto_205077 ?auto_205080 ) ) ( not ( = ?auto_205077 ?auto_205081 ) ) ( not ( = ?auto_205077 ?auto_205082 ) ) ( not ( = ?auto_205077 ?auto_205083 ) ) ( not ( = ?auto_205077 ?auto_205084 ) ) ( not ( = ?auto_205077 ?auto_205085 ) ) ( not ( = ?auto_205077 ?auto_205086 ) ) ( not ( = ?auto_205077 ?auto_205087 ) ) ( not ( = ?auto_205078 ?auto_205079 ) ) ( not ( = ?auto_205078 ?auto_205080 ) ) ( not ( = ?auto_205078 ?auto_205081 ) ) ( not ( = ?auto_205078 ?auto_205082 ) ) ( not ( = ?auto_205078 ?auto_205083 ) ) ( not ( = ?auto_205078 ?auto_205084 ) ) ( not ( = ?auto_205078 ?auto_205085 ) ) ( not ( = ?auto_205078 ?auto_205086 ) ) ( not ( = ?auto_205078 ?auto_205087 ) ) ( not ( = ?auto_205079 ?auto_205080 ) ) ( not ( = ?auto_205079 ?auto_205081 ) ) ( not ( = ?auto_205079 ?auto_205082 ) ) ( not ( = ?auto_205079 ?auto_205083 ) ) ( not ( = ?auto_205079 ?auto_205084 ) ) ( not ( = ?auto_205079 ?auto_205085 ) ) ( not ( = ?auto_205079 ?auto_205086 ) ) ( not ( = ?auto_205079 ?auto_205087 ) ) ( not ( = ?auto_205080 ?auto_205081 ) ) ( not ( = ?auto_205080 ?auto_205082 ) ) ( not ( = ?auto_205080 ?auto_205083 ) ) ( not ( = ?auto_205080 ?auto_205084 ) ) ( not ( = ?auto_205080 ?auto_205085 ) ) ( not ( = ?auto_205080 ?auto_205086 ) ) ( not ( = ?auto_205080 ?auto_205087 ) ) ( not ( = ?auto_205081 ?auto_205082 ) ) ( not ( = ?auto_205081 ?auto_205083 ) ) ( not ( = ?auto_205081 ?auto_205084 ) ) ( not ( = ?auto_205081 ?auto_205085 ) ) ( not ( = ?auto_205081 ?auto_205086 ) ) ( not ( = ?auto_205081 ?auto_205087 ) ) ( not ( = ?auto_205082 ?auto_205083 ) ) ( not ( = ?auto_205082 ?auto_205084 ) ) ( not ( = ?auto_205082 ?auto_205085 ) ) ( not ( = ?auto_205082 ?auto_205086 ) ) ( not ( = ?auto_205082 ?auto_205087 ) ) ( not ( = ?auto_205083 ?auto_205084 ) ) ( not ( = ?auto_205083 ?auto_205085 ) ) ( not ( = ?auto_205083 ?auto_205086 ) ) ( not ( = ?auto_205083 ?auto_205087 ) ) ( not ( = ?auto_205084 ?auto_205085 ) ) ( not ( = ?auto_205084 ?auto_205086 ) ) ( not ( = ?auto_205084 ?auto_205087 ) ) ( not ( = ?auto_205085 ?auto_205086 ) ) ( not ( = ?auto_205085 ?auto_205087 ) ) ( not ( = ?auto_205086 ?auto_205087 ) ) ( ON ?auto_205085 ?auto_205086 ) ( ON ?auto_205084 ?auto_205085 ) ( ON ?auto_205083 ?auto_205084 ) ( CLEAR ?auto_205081 ) ( ON ?auto_205082 ?auto_205083 ) ( CLEAR ?auto_205082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205075 ?auto_205076 ?auto_205077 ?auto_205078 ?auto_205079 ?auto_205080 ?auto_205081 ?auto_205082 )
      ( MAKE-12PILE ?auto_205075 ?auto_205076 ?auto_205077 ?auto_205078 ?auto_205079 ?auto_205080 ?auto_205081 ?auto_205082 ?auto_205083 ?auto_205084 ?auto_205085 ?auto_205086 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205100 - BLOCK
      ?auto_205101 - BLOCK
      ?auto_205102 - BLOCK
      ?auto_205103 - BLOCK
      ?auto_205104 - BLOCK
      ?auto_205105 - BLOCK
      ?auto_205106 - BLOCK
      ?auto_205107 - BLOCK
      ?auto_205108 - BLOCK
      ?auto_205109 - BLOCK
      ?auto_205110 - BLOCK
      ?auto_205111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205111 ) ( ON-TABLE ?auto_205100 ) ( ON ?auto_205101 ?auto_205100 ) ( ON ?auto_205102 ?auto_205101 ) ( ON ?auto_205103 ?auto_205102 ) ( ON ?auto_205104 ?auto_205103 ) ( ON ?auto_205105 ?auto_205104 ) ( ON ?auto_205106 ?auto_205105 ) ( not ( = ?auto_205100 ?auto_205101 ) ) ( not ( = ?auto_205100 ?auto_205102 ) ) ( not ( = ?auto_205100 ?auto_205103 ) ) ( not ( = ?auto_205100 ?auto_205104 ) ) ( not ( = ?auto_205100 ?auto_205105 ) ) ( not ( = ?auto_205100 ?auto_205106 ) ) ( not ( = ?auto_205100 ?auto_205107 ) ) ( not ( = ?auto_205100 ?auto_205108 ) ) ( not ( = ?auto_205100 ?auto_205109 ) ) ( not ( = ?auto_205100 ?auto_205110 ) ) ( not ( = ?auto_205100 ?auto_205111 ) ) ( not ( = ?auto_205101 ?auto_205102 ) ) ( not ( = ?auto_205101 ?auto_205103 ) ) ( not ( = ?auto_205101 ?auto_205104 ) ) ( not ( = ?auto_205101 ?auto_205105 ) ) ( not ( = ?auto_205101 ?auto_205106 ) ) ( not ( = ?auto_205101 ?auto_205107 ) ) ( not ( = ?auto_205101 ?auto_205108 ) ) ( not ( = ?auto_205101 ?auto_205109 ) ) ( not ( = ?auto_205101 ?auto_205110 ) ) ( not ( = ?auto_205101 ?auto_205111 ) ) ( not ( = ?auto_205102 ?auto_205103 ) ) ( not ( = ?auto_205102 ?auto_205104 ) ) ( not ( = ?auto_205102 ?auto_205105 ) ) ( not ( = ?auto_205102 ?auto_205106 ) ) ( not ( = ?auto_205102 ?auto_205107 ) ) ( not ( = ?auto_205102 ?auto_205108 ) ) ( not ( = ?auto_205102 ?auto_205109 ) ) ( not ( = ?auto_205102 ?auto_205110 ) ) ( not ( = ?auto_205102 ?auto_205111 ) ) ( not ( = ?auto_205103 ?auto_205104 ) ) ( not ( = ?auto_205103 ?auto_205105 ) ) ( not ( = ?auto_205103 ?auto_205106 ) ) ( not ( = ?auto_205103 ?auto_205107 ) ) ( not ( = ?auto_205103 ?auto_205108 ) ) ( not ( = ?auto_205103 ?auto_205109 ) ) ( not ( = ?auto_205103 ?auto_205110 ) ) ( not ( = ?auto_205103 ?auto_205111 ) ) ( not ( = ?auto_205104 ?auto_205105 ) ) ( not ( = ?auto_205104 ?auto_205106 ) ) ( not ( = ?auto_205104 ?auto_205107 ) ) ( not ( = ?auto_205104 ?auto_205108 ) ) ( not ( = ?auto_205104 ?auto_205109 ) ) ( not ( = ?auto_205104 ?auto_205110 ) ) ( not ( = ?auto_205104 ?auto_205111 ) ) ( not ( = ?auto_205105 ?auto_205106 ) ) ( not ( = ?auto_205105 ?auto_205107 ) ) ( not ( = ?auto_205105 ?auto_205108 ) ) ( not ( = ?auto_205105 ?auto_205109 ) ) ( not ( = ?auto_205105 ?auto_205110 ) ) ( not ( = ?auto_205105 ?auto_205111 ) ) ( not ( = ?auto_205106 ?auto_205107 ) ) ( not ( = ?auto_205106 ?auto_205108 ) ) ( not ( = ?auto_205106 ?auto_205109 ) ) ( not ( = ?auto_205106 ?auto_205110 ) ) ( not ( = ?auto_205106 ?auto_205111 ) ) ( not ( = ?auto_205107 ?auto_205108 ) ) ( not ( = ?auto_205107 ?auto_205109 ) ) ( not ( = ?auto_205107 ?auto_205110 ) ) ( not ( = ?auto_205107 ?auto_205111 ) ) ( not ( = ?auto_205108 ?auto_205109 ) ) ( not ( = ?auto_205108 ?auto_205110 ) ) ( not ( = ?auto_205108 ?auto_205111 ) ) ( not ( = ?auto_205109 ?auto_205110 ) ) ( not ( = ?auto_205109 ?auto_205111 ) ) ( not ( = ?auto_205110 ?auto_205111 ) ) ( ON ?auto_205110 ?auto_205111 ) ( ON ?auto_205109 ?auto_205110 ) ( ON ?auto_205108 ?auto_205109 ) ( CLEAR ?auto_205106 ) ( ON ?auto_205107 ?auto_205108 ) ( CLEAR ?auto_205107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205100 ?auto_205101 ?auto_205102 ?auto_205103 ?auto_205104 ?auto_205105 ?auto_205106 ?auto_205107 )
      ( MAKE-12PILE ?auto_205100 ?auto_205101 ?auto_205102 ?auto_205103 ?auto_205104 ?auto_205105 ?auto_205106 ?auto_205107 ?auto_205108 ?auto_205109 ?auto_205110 ?auto_205111 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205124 - BLOCK
      ?auto_205125 - BLOCK
      ?auto_205126 - BLOCK
      ?auto_205127 - BLOCK
      ?auto_205128 - BLOCK
      ?auto_205129 - BLOCK
      ?auto_205130 - BLOCK
      ?auto_205131 - BLOCK
      ?auto_205132 - BLOCK
      ?auto_205133 - BLOCK
      ?auto_205134 - BLOCK
      ?auto_205135 - BLOCK
    )
    :vars
    (
      ?auto_205136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205135 ?auto_205136 ) ( ON-TABLE ?auto_205124 ) ( ON ?auto_205125 ?auto_205124 ) ( ON ?auto_205126 ?auto_205125 ) ( ON ?auto_205127 ?auto_205126 ) ( ON ?auto_205128 ?auto_205127 ) ( ON ?auto_205129 ?auto_205128 ) ( not ( = ?auto_205124 ?auto_205125 ) ) ( not ( = ?auto_205124 ?auto_205126 ) ) ( not ( = ?auto_205124 ?auto_205127 ) ) ( not ( = ?auto_205124 ?auto_205128 ) ) ( not ( = ?auto_205124 ?auto_205129 ) ) ( not ( = ?auto_205124 ?auto_205130 ) ) ( not ( = ?auto_205124 ?auto_205131 ) ) ( not ( = ?auto_205124 ?auto_205132 ) ) ( not ( = ?auto_205124 ?auto_205133 ) ) ( not ( = ?auto_205124 ?auto_205134 ) ) ( not ( = ?auto_205124 ?auto_205135 ) ) ( not ( = ?auto_205124 ?auto_205136 ) ) ( not ( = ?auto_205125 ?auto_205126 ) ) ( not ( = ?auto_205125 ?auto_205127 ) ) ( not ( = ?auto_205125 ?auto_205128 ) ) ( not ( = ?auto_205125 ?auto_205129 ) ) ( not ( = ?auto_205125 ?auto_205130 ) ) ( not ( = ?auto_205125 ?auto_205131 ) ) ( not ( = ?auto_205125 ?auto_205132 ) ) ( not ( = ?auto_205125 ?auto_205133 ) ) ( not ( = ?auto_205125 ?auto_205134 ) ) ( not ( = ?auto_205125 ?auto_205135 ) ) ( not ( = ?auto_205125 ?auto_205136 ) ) ( not ( = ?auto_205126 ?auto_205127 ) ) ( not ( = ?auto_205126 ?auto_205128 ) ) ( not ( = ?auto_205126 ?auto_205129 ) ) ( not ( = ?auto_205126 ?auto_205130 ) ) ( not ( = ?auto_205126 ?auto_205131 ) ) ( not ( = ?auto_205126 ?auto_205132 ) ) ( not ( = ?auto_205126 ?auto_205133 ) ) ( not ( = ?auto_205126 ?auto_205134 ) ) ( not ( = ?auto_205126 ?auto_205135 ) ) ( not ( = ?auto_205126 ?auto_205136 ) ) ( not ( = ?auto_205127 ?auto_205128 ) ) ( not ( = ?auto_205127 ?auto_205129 ) ) ( not ( = ?auto_205127 ?auto_205130 ) ) ( not ( = ?auto_205127 ?auto_205131 ) ) ( not ( = ?auto_205127 ?auto_205132 ) ) ( not ( = ?auto_205127 ?auto_205133 ) ) ( not ( = ?auto_205127 ?auto_205134 ) ) ( not ( = ?auto_205127 ?auto_205135 ) ) ( not ( = ?auto_205127 ?auto_205136 ) ) ( not ( = ?auto_205128 ?auto_205129 ) ) ( not ( = ?auto_205128 ?auto_205130 ) ) ( not ( = ?auto_205128 ?auto_205131 ) ) ( not ( = ?auto_205128 ?auto_205132 ) ) ( not ( = ?auto_205128 ?auto_205133 ) ) ( not ( = ?auto_205128 ?auto_205134 ) ) ( not ( = ?auto_205128 ?auto_205135 ) ) ( not ( = ?auto_205128 ?auto_205136 ) ) ( not ( = ?auto_205129 ?auto_205130 ) ) ( not ( = ?auto_205129 ?auto_205131 ) ) ( not ( = ?auto_205129 ?auto_205132 ) ) ( not ( = ?auto_205129 ?auto_205133 ) ) ( not ( = ?auto_205129 ?auto_205134 ) ) ( not ( = ?auto_205129 ?auto_205135 ) ) ( not ( = ?auto_205129 ?auto_205136 ) ) ( not ( = ?auto_205130 ?auto_205131 ) ) ( not ( = ?auto_205130 ?auto_205132 ) ) ( not ( = ?auto_205130 ?auto_205133 ) ) ( not ( = ?auto_205130 ?auto_205134 ) ) ( not ( = ?auto_205130 ?auto_205135 ) ) ( not ( = ?auto_205130 ?auto_205136 ) ) ( not ( = ?auto_205131 ?auto_205132 ) ) ( not ( = ?auto_205131 ?auto_205133 ) ) ( not ( = ?auto_205131 ?auto_205134 ) ) ( not ( = ?auto_205131 ?auto_205135 ) ) ( not ( = ?auto_205131 ?auto_205136 ) ) ( not ( = ?auto_205132 ?auto_205133 ) ) ( not ( = ?auto_205132 ?auto_205134 ) ) ( not ( = ?auto_205132 ?auto_205135 ) ) ( not ( = ?auto_205132 ?auto_205136 ) ) ( not ( = ?auto_205133 ?auto_205134 ) ) ( not ( = ?auto_205133 ?auto_205135 ) ) ( not ( = ?auto_205133 ?auto_205136 ) ) ( not ( = ?auto_205134 ?auto_205135 ) ) ( not ( = ?auto_205134 ?auto_205136 ) ) ( not ( = ?auto_205135 ?auto_205136 ) ) ( ON ?auto_205134 ?auto_205135 ) ( ON ?auto_205133 ?auto_205134 ) ( ON ?auto_205132 ?auto_205133 ) ( ON ?auto_205131 ?auto_205132 ) ( CLEAR ?auto_205129 ) ( ON ?auto_205130 ?auto_205131 ) ( CLEAR ?auto_205130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_205124 ?auto_205125 ?auto_205126 ?auto_205127 ?auto_205128 ?auto_205129 ?auto_205130 )
      ( MAKE-12PILE ?auto_205124 ?auto_205125 ?auto_205126 ?auto_205127 ?auto_205128 ?auto_205129 ?auto_205130 ?auto_205131 ?auto_205132 ?auto_205133 ?auto_205134 ?auto_205135 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205149 - BLOCK
      ?auto_205150 - BLOCK
      ?auto_205151 - BLOCK
      ?auto_205152 - BLOCK
      ?auto_205153 - BLOCK
      ?auto_205154 - BLOCK
      ?auto_205155 - BLOCK
      ?auto_205156 - BLOCK
      ?auto_205157 - BLOCK
      ?auto_205158 - BLOCK
      ?auto_205159 - BLOCK
      ?auto_205160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205160 ) ( ON-TABLE ?auto_205149 ) ( ON ?auto_205150 ?auto_205149 ) ( ON ?auto_205151 ?auto_205150 ) ( ON ?auto_205152 ?auto_205151 ) ( ON ?auto_205153 ?auto_205152 ) ( ON ?auto_205154 ?auto_205153 ) ( not ( = ?auto_205149 ?auto_205150 ) ) ( not ( = ?auto_205149 ?auto_205151 ) ) ( not ( = ?auto_205149 ?auto_205152 ) ) ( not ( = ?auto_205149 ?auto_205153 ) ) ( not ( = ?auto_205149 ?auto_205154 ) ) ( not ( = ?auto_205149 ?auto_205155 ) ) ( not ( = ?auto_205149 ?auto_205156 ) ) ( not ( = ?auto_205149 ?auto_205157 ) ) ( not ( = ?auto_205149 ?auto_205158 ) ) ( not ( = ?auto_205149 ?auto_205159 ) ) ( not ( = ?auto_205149 ?auto_205160 ) ) ( not ( = ?auto_205150 ?auto_205151 ) ) ( not ( = ?auto_205150 ?auto_205152 ) ) ( not ( = ?auto_205150 ?auto_205153 ) ) ( not ( = ?auto_205150 ?auto_205154 ) ) ( not ( = ?auto_205150 ?auto_205155 ) ) ( not ( = ?auto_205150 ?auto_205156 ) ) ( not ( = ?auto_205150 ?auto_205157 ) ) ( not ( = ?auto_205150 ?auto_205158 ) ) ( not ( = ?auto_205150 ?auto_205159 ) ) ( not ( = ?auto_205150 ?auto_205160 ) ) ( not ( = ?auto_205151 ?auto_205152 ) ) ( not ( = ?auto_205151 ?auto_205153 ) ) ( not ( = ?auto_205151 ?auto_205154 ) ) ( not ( = ?auto_205151 ?auto_205155 ) ) ( not ( = ?auto_205151 ?auto_205156 ) ) ( not ( = ?auto_205151 ?auto_205157 ) ) ( not ( = ?auto_205151 ?auto_205158 ) ) ( not ( = ?auto_205151 ?auto_205159 ) ) ( not ( = ?auto_205151 ?auto_205160 ) ) ( not ( = ?auto_205152 ?auto_205153 ) ) ( not ( = ?auto_205152 ?auto_205154 ) ) ( not ( = ?auto_205152 ?auto_205155 ) ) ( not ( = ?auto_205152 ?auto_205156 ) ) ( not ( = ?auto_205152 ?auto_205157 ) ) ( not ( = ?auto_205152 ?auto_205158 ) ) ( not ( = ?auto_205152 ?auto_205159 ) ) ( not ( = ?auto_205152 ?auto_205160 ) ) ( not ( = ?auto_205153 ?auto_205154 ) ) ( not ( = ?auto_205153 ?auto_205155 ) ) ( not ( = ?auto_205153 ?auto_205156 ) ) ( not ( = ?auto_205153 ?auto_205157 ) ) ( not ( = ?auto_205153 ?auto_205158 ) ) ( not ( = ?auto_205153 ?auto_205159 ) ) ( not ( = ?auto_205153 ?auto_205160 ) ) ( not ( = ?auto_205154 ?auto_205155 ) ) ( not ( = ?auto_205154 ?auto_205156 ) ) ( not ( = ?auto_205154 ?auto_205157 ) ) ( not ( = ?auto_205154 ?auto_205158 ) ) ( not ( = ?auto_205154 ?auto_205159 ) ) ( not ( = ?auto_205154 ?auto_205160 ) ) ( not ( = ?auto_205155 ?auto_205156 ) ) ( not ( = ?auto_205155 ?auto_205157 ) ) ( not ( = ?auto_205155 ?auto_205158 ) ) ( not ( = ?auto_205155 ?auto_205159 ) ) ( not ( = ?auto_205155 ?auto_205160 ) ) ( not ( = ?auto_205156 ?auto_205157 ) ) ( not ( = ?auto_205156 ?auto_205158 ) ) ( not ( = ?auto_205156 ?auto_205159 ) ) ( not ( = ?auto_205156 ?auto_205160 ) ) ( not ( = ?auto_205157 ?auto_205158 ) ) ( not ( = ?auto_205157 ?auto_205159 ) ) ( not ( = ?auto_205157 ?auto_205160 ) ) ( not ( = ?auto_205158 ?auto_205159 ) ) ( not ( = ?auto_205158 ?auto_205160 ) ) ( not ( = ?auto_205159 ?auto_205160 ) ) ( ON ?auto_205159 ?auto_205160 ) ( ON ?auto_205158 ?auto_205159 ) ( ON ?auto_205157 ?auto_205158 ) ( ON ?auto_205156 ?auto_205157 ) ( CLEAR ?auto_205154 ) ( ON ?auto_205155 ?auto_205156 ) ( CLEAR ?auto_205155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_205149 ?auto_205150 ?auto_205151 ?auto_205152 ?auto_205153 ?auto_205154 ?auto_205155 )
      ( MAKE-12PILE ?auto_205149 ?auto_205150 ?auto_205151 ?auto_205152 ?auto_205153 ?auto_205154 ?auto_205155 ?auto_205156 ?auto_205157 ?auto_205158 ?auto_205159 ?auto_205160 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205173 - BLOCK
      ?auto_205174 - BLOCK
      ?auto_205175 - BLOCK
      ?auto_205176 - BLOCK
      ?auto_205177 - BLOCK
      ?auto_205178 - BLOCK
      ?auto_205179 - BLOCK
      ?auto_205180 - BLOCK
      ?auto_205181 - BLOCK
      ?auto_205182 - BLOCK
      ?auto_205183 - BLOCK
      ?auto_205184 - BLOCK
    )
    :vars
    (
      ?auto_205185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205184 ?auto_205185 ) ( ON-TABLE ?auto_205173 ) ( ON ?auto_205174 ?auto_205173 ) ( ON ?auto_205175 ?auto_205174 ) ( ON ?auto_205176 ?auto_205175 ) ( ON ?auto_205177 ?auto_205176 ) ( not ( = ?auto_205173 ?auto_205174 ) ) ( not ( = ?auto_205173 ?auto_205175 ) ) ( not ( = ?auto_205173 ?auto_205176 ) ) ( not ( = ?auto_205173 ?auto_205177 ) ) ( not ( = ?auto_205173 ?auto_205178 ) ) ( not ( = ?auto_205173 ?auto_205179 ) ) ( not ( = ?auto_205173 ?auto_205180 ) ) ( not ( = ?auto_205173 ?auto_205181 ) ) ( not ( = ?auto_205173 ?auto_205182 ) ) ( not ( = ?auto_205173 ?auto_205183 ) ) ( not ( = ?auto_205173 ?auto_205184 ) ) ( not ( = ?auto_205173 ?auto_205185 ) ) ( not ( = ?auto_205174 ?auto_205175 ) ) ( not ( = ?auto_205174 ?auto_205176 ) ) ( not ( = ?auto_205174 ?auto_205177 ) ) ( not ( = ?auto_205174 ?auto_205178 ) ) ( not ( = ?auto_205174 ?auto_205179 ) ) ( not ( = ?auto_205174 ?auto_205180 ) ) ( not ( = ?auto_205174 ?auto_205181 ) ) ( not ( = ?auto_205174 ?auto_205182 ) ) ( not ( = ?auto_205174 ?auto_205183 ) ) ( not ( = ?auto_205174 ?auto_205184 ) ) ( not ( = ?auto_205174 ?auto_205185 ) ) ( not ( = ?auto_205175 ?auto_205176 ) ) ( not ( = ?auto_205175 ?auto_205177 ) ) ( not ( = ?auto_205175 ?auto_205178 ) ) ( not ( = ?auto_205175 ?auto_205179 ) ) ( not ( = ?auto_205175 ?auto_205180 ) ) ( not ( = ?auto_205175 ?auto_205181 ) ) ( not ( = ?auto_205175 ?auto_205182 ) ) ( not ( = ?auto_205175 ?auto_205183 ) ) ( not ( = ?auto_205175 ?auto_205184 ) ) ( not ( = ?auto_205175 ?auto_205185 ) ) ( not ( = ?auto_205176 ?auto_205177 ) ) ( not ( = ?auto_205176 ?auto_205178 ) ) ( not ( = ?auto_205176 ?auto_205179 ) ) ( not ( = ?auto_205176 ?auto_205180 ) ) ( not ( = ?auto_205176 ?auto_205181 ) ) ( not ( = ?auto_205176 ?auto_205182 ) ) ( not ( = ?auto_205176 ?auto_205183 ) ) ( not ( = ?auto_205176 ?auto_205184 ) ) ( not ( = ?auto_205176 ?auto_205185 ) ) ( not ( = ?auto_205177 ?auto_205178 ) ) ( not ( = ?auto_205177 ?auto_205179 ) ) ( not ( = ?auto_205177 ?auto_205180 ) ) ( not ( = ?auto_205177 ?auto_205181 ) ) ( not ( = ?auto_205177 ?auto_205182 ) ) ( not ( = ?auto_205177 ?auto_205183 ) ) ( not ( = ?auto_205177 ?auto_205184 ) ) ( not ( = ?auto_205177 ?auto_205185 ) ) ( not ( = ?auto_205178 ?auto_205179 ) ) ( not ( = ?auto_205178 ?auto_205180 ) ) ( not ( = ?auto_205178 ?auto_205181 ) ) ( not ( = ?auto_205178 ?auto_205182 ) ) ( not ( = ?auto_205178 ?auto_205183 ) ) ( not ( = ?auto_205178 ?auto_205184 ) ) ( not ( = ?auto_205178 ?auto_205185 ) ) ( not ( = ?auto_205179 ?auto_205180 ) ) ( not ( = ?auto_205179 ?auto_205181 ) ) ( not ( = ?auto_205179 ?auto_205182 ) ) ( not ( = ?auto_205179 ?auto_205183 ) ) ( not ( = ?auto_205179 ?auto_205184 ) ) ( not ( = ?auto_205179 ?auto_205185 ) ) ( not ( = ?auto_205180 ?auto_205181 ) ) ( not ( = ?auto_205180 ?auto_205182 ) ) ( not ( = ?auto_205180 ?auto_205183 ) ) ( not ( = ?auto_205180 ?auto_205184 ) ) ( not ( = ?auto_205180 ?auto_205185 ) ) ( not ( = ?auto_205181 ?auto_205182 ) ) ( not ( = ?auto_205181 ?auto_205183 ) ) ( not ( = ?auto_205181 ?auto_205184 ) ) ( not ( = ?auto_205181 ?auto_205185 ) ) ( not ( = ?auto_205182 ?auto_205183 ) ) ( not ( = ?auto_205182 ?auto_205184 ) ) ( not ( = ?auto_205182 ?auto_205185 ) ) ( not ( = ?auto_205183 ?auto_205184 ) ) ( not ( = ?auto_205183 ?auto_205185 ) ) ( not ( = ?auto_205184 ?auto_205185 ) ) ( ON ?auto_205183 ?auto_205184 ) ( ON ?auto_205182 ?auto_205183 ) ( ON ?auto_205181 ?auto_205182 ) ( ON ?auto_205180 ?auto_205181 ) ( ON ?auto_205179 ?auto_205180 ) ( CLEAR ?auto_205177 ) ( ON ?auto_205178 ?auto_205179 ) ( CLEAR ?auto_205178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205173 ?auto_205174 ?auto_205175 ?auto_205176 ?auto_205177 ?auto_205178 )
      ( MAKE-12PILE ?auto_205173 ?auto_205174 ?auto_205175 ?auto_205176 ?auto_205177 ?auto_205178 ?auto_205179 ?auto_205180 ?auto_205181 ?auto_205182 ?auto_205183 ?auto_205184 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205198 - BLOCK
      ?auto_205199 - BLOCK
      ?auto_205200 - BLOCK
      ?auto_205201 - BLOCK
      ?auto_205202 - BLOCK
      ?auto_205203 - BLOCK
      ?auto_205204 - BLOCK
      ?auto_205205 - BLOCK
      ?auto_205206 - BLOCK
      ?auto_205207 - BLOCK
      ?auto_205208 - BLOCK
      ?auto_205209 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205209 ) ( ON-TABLE ?auto_205198 ) ( ON ?auto_205199 ?auto_205198 ) ( ON ?auto_205200 ?auto_205199 ) ( ON ?auto_205201 ?auto_205200 ) ( ON ?auto_205202 ?auto_205201 ) ( not ( = ?auto_205198 ?auto_205199 ) ) ( not ( = ?auto_205198 ?auto_205200 ) ) ( not ( = ?auto_205198 ?auto_205201 ) ) ( not ( = ?auto_205198 ?auto_205202 ) ) ( not ( = ?auto_205198 ?auto_205203 ) ) ( not ( = ?auto_205198 ?auto_205204 ) ) ( not ( = ?auto_205198 ?auto_205205 ) ) ( not ( = ?auto_205198 ?auto_205206 ) ) ( not ( = ?auto_205198 ?auto_205207 ) ) ( not ( = ?auto_205198 ?auto_205208 ) ) ( not ( = ?auto_205198 ?auto_205209 ) ) ( not ( = ?auto_205199 ?auto_205200 ) ) ( not ( = ?auto_205199 ?auto_205201 ) ) ( not ( = ?auto_205199 ?auto_205202 ) ) ( not ( = ?auto_205199 ?auto_205203 ) ) ( not ( = ?auto_205199 ?auto_205204 ) ) ( not ( = ?auto_205199 ?auto_205205 ) ) ( not ( = ?auto_205199 ?auto_205206 ) ) ( not ( = ?auto_205199 ?auto_205207 ) ) ( not ( = ?auto_205199 ?auto_205208 ) ) ( not ( = ?auto_205199 ?auto_205209 ) ) ( not ( = ?auto_205200 ?auto_205201 ) ) ( not ( = ?auto_205200 ?auto_205202 ) ) ( not ( = ?auto_205200 ?auto_205203 ) ) ( not ( = ?auto_205200 ?auto_205204 ) ) ( not ( = ?auto_205200 ?auto_205205 ) ) ( not ( = ?auto_205200 ?auto_205206 ) ) ( not ( = ?auto_205200 ?auto_205207 ) ) ( not ( = ?auto_205200 ?auto_205208 ) ) ( not ( = ?auto_205200 ?auto_205209 ) ) ( not ( = ?auto_205201 ?auto_205202 ) ) ( not ( = ?auto_205201 ?auto_205203 ) ) ( not ( = ?auto_205201 ?auto_205204 ) ) ( not ( = ?auto_205201 ?auto_205205 ) ) ( not ( = ?auto_205201 ?auto_205206 ) ) ( not ( = ?auto_205201 ?auto_205207 ) ) ( not ( = ?auto_205201 ?auto_205208 ) ) ( not ( = ?auto_205201 ?auto_205209 ) ) ( not ( = ?auto_205202 ?auto_205203 ) ) ( not ( = ?auto_205202 ?auto_205204 ) ) ( not ( = ?auto_205202 ?auto_205205 ) ) ( not ( = ?auto_205202 ?auto_205206 ) ) ( not ( = ?auto_205202 ?auto_205207 ) ) ( not ( = ?auto_205202 ?auto_205208 ) ) ( not ( = ?auto_205202 ?auto_205209 ) ) ( not ( = ?auto_205203 ?auto_205204 ) ) ( not ( = ?auto_205203 ?auto_205205 ) ) ( not ( = ?auto_205203 ?auto_205206 ) ) ( not ( = ?auto_205203 ?auto_205207 ) ) ( not ( = ?auto_205203 ?auto_205208 ) ) ( not ( = ?auto_205203 ?auto_205209 ) ) ( not ( = ?auto_205204 ?auto_205205 ) ) ( not ( = ?auto_205204 ?auto_205206 ) ) ( not ( = ?auto_205204 ?auto_205207 ) ) ( not ( = ?auto_205204 ?auto_205208 ) ) ( not ( = ?auto_205204 ?auto_205209 ) ) ( not ( = ?auto_205205 ?auto_205206 ) ) ( not ( = ?auto_205205 ?auto_205207 ) ) ( not ( = ?auto_205205 ?auto_205208 ) ) ( not ( = ?auto_205205 ?auto_205209 ) ) ( not ( = ?auto_205206 ?auto_205207 ) ) ( not ( = ?auto_205206 ?auto_205208 ) ) ( not ( = ?auto_205206 ?auto_205209 ) ) ( not ( = ?auto_205207 ?auto_205208 ) ) ( not ( = ?auto_205207 ?auto_205209 ) ) ( not ( = ?auto_205208 ?auto_205209 ) ) ( ON ?auto_205208 ?auto_205209 ) ( ON ?auto_205207 ?auto_205208 ) ( ON ?auto_205206 ?auto_205207 ) ( ON ?auto_205205 ?auto_205206 ) ( ON ?auto_205204 ?auto_205205 ) ( CLEAR ?auto_205202 ) ( ON ?auto_205203 ?auto_205204 ) ( CLEAR ?auto_205203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205198 ?auto_205199 ?auto_205200 ?auto_205201 ?auto_205202 ?auto_205203 )
      ( MAKE-12PILE ?auto_205198 ?auto_205199 ?auto_205200 ?auto_205201 ?auto_205202 ?auto_205203 ?auto_205204 ?auto_205205 ?auto_205206 ?auto_205207 ?auto_205208 ?auto_205209 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205222 - BLOCK
      ?auto_205223 - BLOCK
      ?auto_205224 - BLOCK
      ?auto_205225 - BLOCK
      ?auto_205226 - BLOCK
      ?auto_205227 - BLOCK
      ?auto_205228 - BLOCK
      ?auto_205229 - BLOCK
      ?auto_205230 - BLOCK
      ?auto_205231 - BLOCK
      ?auto_205232 - BLOCK
      ?auto_205233 - BLOCK
    )
    :vars
    (
      ?auto_205234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205233 ?auto_205234 ) ( ON-TABLE ?auto_205222 ) ( ON ?auto_205223 ?auto_205222 ) ( ON ?auto_205224 ?auto_205223 ) ( ON ?auto_205225 ?auto_205224 ) ( not ( = ?auto_205222 ?auto_205223 ) ) ( not ( = ?auto_205222 ?auto_205224 ) ) ( not ( = ?auto_205222 ?auto_205225 ) ) ( not ( = ?auto_205222 ?auto_205226 ) ) ( not ( = ?auto_205222 ?auto_205227 ) ) ( not ( = ?auto_205222 ?auto_205228 ) ) ( not ( = ?auto_205222 ?auto_205229 ) ) ( not ( = ?auto_205222 ?auto_205230 ) ) ( not ( = ?auto_205222 ?auto_205231 ) ) ( not ( = ?auto_205222 ?auto_205232 ) ) ( not ( = ?auto_205222 ?auto_205233 ) ) ( not ( = ?auto_205222 ?auto_205234 ) ) ( not ( = ?auto_205223 ?auto_205224 ) ) ( not ( = ?auto_205223 ?auto_205225 ) ) ( not ( = ?auto_205223 ?auto_205226 ) ) ( not ( = ?auto_205223 ?auto_205227 ) ) ( not ( = ?auto_205223 ?auto_205228 ) ) ( not ( = ?auto_205223 ?auto_205229 ) ) ( not ( = ?auto_205223 ?auto_205230 ) ) ( not ( = ?auto_205223 ?auto_205231 ) ) ( not ( = ?auto_205223 ?auto_205232 ) ) ( not ( = ?auto_205223 ?auto_205233 ) ) ( not ( = ?auto_205223 ?auto_205234 ) ) ( not ( = ?auto_205224 ?auto_205225 ) ) ( not ( = ?auto_205224 ?auto_205226 ) ) ( not ( = ?auto_205224 ?auto_205227 ) ) ( not ( = ?auto_205224 ?auto_205228 ) ) ( not ( = ?auto_205224 ?auto_205229 ) ) ( not ( = ?auto_205224 ?auto_205230 ) ) ( not ( = ?auto_205224 ?auto_205231 ) ) ( not ( = ?auto_205224 ?auto_205232 ) ) ( not ( = ?auto_205224 ?auto_205233 ) ) ( not ( = ?auto_205224 ?auto_205234 ) ) ( not ( = ?auto_205225 ?auto_205226 ) ) ( not ( = ?auto_205225 ?auto_205227 ) ) ( not ( = ?auto_205225 ?auto_205228 ) ) ( not ( = ?auto_205225 ?auto_205229 ) ) ( not ( = ?auto_205225 ?auto_205230 ) ) ( not ( = ?auto_205225 ?auto_205231 ) ) ( not ( = ?auto_205225 ?auto_205232 ) ) ( not ( = ?auto_205225 ?auto_205233 ) ) ( not ( = ?auto_205225 ?auto_205234 ) ) ( not ( = ?auto_205226 ?auto_205227 ) ) ( not ( = ?auto_205226 ?auto_205228 ) ) ( not ( = ?auto_205226 ?auto_205229 ) ) ( not ( = ?auto_205226 ?auto_205230 ) ) ( not ( = ?auto_205226 ?auto_205231 ) ) ( not ( = ?auto_205226 ?auto_205232 ) ) ( not ( = ?auto_205226 ?auto_205233 ) ) ( not ( = ?auto_205226 ?auto_205234 ) ) ( not ( = ?auto_205227 ?auto_205228 ) ) ( not ( = ?auto_205227 ?auto_205229 ) ) ( not ( = ?auto_205227 ?auto_205230 ) ) ( not ( = ?auto_205227 ?auto_205231 ) ) ( not ( = ?auto_205227 ?auto_205232 ) ) ( not ( = ?auto_205227 ?auto_205233 ) ) ( not ( = ?auto_205227 ?auto_205234 ) ) ( not ( = ?auto_205228 ?auto_205229 ) ) ( not ( = ?auto_205228 ?auto_205230 ) ) ( not ( = ?auto_205228 ?auto_205231 ) ) ( not ( = ?auto_205228 ?auto_205232 ) ) ( not ( = ?auto_205228 ?auto_205233 ) ) ( not ( = ?auto_205228 ?auto_205234 ) ) ( not ( = ?auto_205229 ?auto_205230 ) ) ( not ( = ?auto_205229 ?auto_205231 ) ) ( not ( = ?auto_205229 ?auto_205232 ) ) ( not ( = ?auto_205229 ?auto_205233 ) ) ( not ( = ?auto_205229 ?auto_205234 ) ) ( not ( = ?auto_205230 ?auto_205231 ) ) ( not ( = ?auto_205230 ?auto_205232 ) ) ( not ( = ?auto_205230 ?auto_205233 ) ) ( not ( = ?auto_205230 ?auto_205234 ) ) ( not ( = ?auto_205231 ?auto_205232 ) ) ( not ( = ?auto_205231 ?auto_205233 ) ) ( not ( = ?auto_205231 ?auto_205234 ) ) ( not ( = ?auto_205232 ?auto_205233 ) ) ( not ( = ?auto_205232 ?auto_205234 ) ) ( not ( = ?auto_205233 ?auto_205234 ) ) ( ON ?auto_205232 ?auto_205233 ) ( ON ?auto_205231 ?auto_205232 ) ( ON ?auto_205230 ?auto_205231 ) ( ON ?auto_205229 ?auto_205230 ) ( ON ?auto_205228 ?auto_205229 ) ( ON ?auto_205227 ?auto_205228 ) ( CLEAR ?auto_205225 ) ( ON ?auto_205226 ?auto_205227 ) ( CLEAR ?auto_205226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205222 ?auto_205223 ?auto_205224 ?auto_205225 ?auto_205226 )
      ( MAKE-12PILE ?auto_205222 ?auto_205223 ?auto_205224 ?auto_205225 ?auto_205226 ?auto_205227 ?auto_205228 ?auto_205229 ?auto_205230 ?auto_205231 ?auto_205232 ?auto_205233 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205247 - BLOCK
      ?auto_205248 - BLOCK
      ?auto_205249 - BLOCK
      ?auto_205250 - BLOCK
      ?auto_205251 - BLOCK
      ?auto_205252 - BLOCK
      ?auto_205253 - BLOCK
      ?auto_205254 - BLOCK
      ?auto_205255 - BLOCK
      ?auto_205256 - BLOCK
      ?auto_205257 - BLOCK
      ?auto_205258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205258 ) ( ON-TABLE ?auto_205247 ) ( ON ?auto_205248 ?auto_205247 ) ( ON ?auto_205249 ?auto_205248 ) ( ON ?auto_205250 ?auto_205249 ) ( not ( = ?auto_205247 ?auto_205248 ) ) ( not ( = ?auto_205247 ?auto_205249 ) ) ( not ( = ?auto_205247 ?auto_205250 ) ) ( not ( = ?auto_205247 ?auto_205251 ) ) ( not ( = ?auto_205247 ?auto_205252 ) ) ( not ( = ?auto_205247 ?auto_205253 ) ) ( not ( = ?auto_205247 ?auto_205254 ) ) ( not ( = ?auto_205247 ?auto_205255 ) ) ( not ( = ?auto_205247 ?auto_205256 ) ) ( not ( = ?auto_205247 ?auto_205257 ) ) ( not ( = ?auto_205247 ?auto_205258 ) ) ( not ( = ?auto_205248 ?auto_205249 ) ) ( not ( = ?auto_205248 ?auto_205250 ) ) ( not ( = ?auto_205248 ?auto_205251 ) ) ( not ( = ?auto_205248 ?auto_205252 ) ) ( not ( = ?auto_205248 ?auto_205253 ) ) ( not ( = ?auto_205248 ?auto_205254 ) ) ( not ( = ?auto_205248 ?auto_205255 ) ) ( not ( = ?auto_205248 ?auto_205256 ) ) ( not ( = ?auto_205248 ?auto_205257 ) ) ( not ( = ?auto_205248 ?auto_205258 ) ) ( not ( = ?auto_205249 ?auto_205250 ) ) ( not ( = ?auto_205249 ?auto_205251 ) ) ( not ( = ?auto_205249 ?auto_205252 ) ) ( not ( = ?auto_205249 ?auto_205253 ) ) ( not ( = ?auto_205249 ?auto_205254 ) ) ( not ( = ?auto_205249 ?auto_205255 ) ) ( not ( = ?auto_205249 ?auto_205256 ) ) ( not ( = ?auto_205249 ?auto_205257 ) ) ( not ( = ?auto_205249 ?auto_205258 ) ) ( not ( = ?auto_205250 ?auto_205251 ) ) ( not ( = ?auto_205250 ?auto_205252 ) ) ( not ( = ?auto_205250 ?auto_205253 ) ) ( not ( = ?auto_205250 ?auto_205254 ) ) ( not ( = ?auto_205250 ?auto_205255 ) ) ( not ( = ?auto_205250 ?auto_205256 ) ) ( not ( = ?auto_205250 ?auto_205257 ) ) ( not ( = ?auto_205250 ?auto_205258 ) ) ( not ( = ?auto_205251 ?auto_205252 ) ) ( not ( = ?auto_205251 ?auto_205253 ) ) ( not ( = ?auto_205251 ?auto_205254 ) ) ( not ( = ?auto_205251 ?auto_205255 ) ) ( not ( = ?auto_205251 ?auto_205256 ) ) ( not ( = ?auto_205251 ?auto_205257 ) ) ( not ( = ?auto_205251 ?auto_205258 ) ) ( not ( = ?auto_205252 ?auto_205253 ) ) ( not ( = ?auto_205252 ?auto_205254 ) ) ( not ( = ?auto_205252 ?auto_205255 ) ) ( not ( = ?auto_205252 ?auto_205256 ) ) ( not ( = ?auto_205252 ?auto_205257 ) ) ( not ( = ?auto_205252 ?auto_205258 ) ) ( not ( = ?auto_205253 ?auto_205254 ) ) ( not ( = ?auto_205253 ?auto_205255 ) ) ( not ( = ?auto_205253 ?auto_205256 ) ) ( not ( = ?auto_205253 ?auto_205257 ) ) ( not ( = ?auto_205253 ?auto_205258 ) ) ( not ( = ?auto_205254 ?auto_205255 ) ) ( not ( = ?auto_205254 ?auto_205256 ) ) ( not ( = ?auto_205254 ?auto_205257 ) ) ( not ( = ?auto_205254 ?auto_205258 ) ) ( not ( = ?auto_205255 ?auto_205256 ) ) ( not ( = ?auto_205255 ?auto_205257 ) ) ( not ( = ?auto_205255 ?auto_205258 ) ) ( not ( = ?auto_205256 ?auto_205257 ) ) ( not ( = ?auto_205256 ?auto_205258 ) ) ( not ( = ?auto_205257 ?auto_205258 ) ) ( ON ?auto_205257 ?auto_205258 ) ( ON ?auto_205256 ?auto_205257 ) ( ON ?auto_205255 ?auto_205256 ) ( ON ?auto_205254 ?auto_205255 ) ( ON ?auto_205253 ?auto_205254 ) ( ON ?auto_205252 ?auto_205253 ) ( CLEAR ?auto_205250 ) ( ON ?auto_205251 ?auto_205252 ) ( CLEAR ?auto_205251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205247 ?auto_205248 ?auto_205249 ?auto_205250 ?auto_205251 )
      ( MAKE-12PILE ?auto_205247 ?auto_205248 ?auto_205249 ?auto_205250 ?auto_205251 ?auto_205252 ?auto_205253 ?auto_205254 ?auto_205255 ?auto_205256 ?auto_205257 ?auto_205258 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205271 - BLOCK
      ?auto_205272 - BLOCK
      ?auto_205273 - BLOCK
      ?auto_205274 - BLOCK
      ?auto_205275 - BLOCK
      ?auto_205276 - BLOCK
      ?auto_205277 - BLOCK
      ?auto_205278 - BLOCK
      ?auto_205279 - BLOCK
      ?auto_205280 - BLOCK
      ?auto_205281 - BLOCK
      ?auto_205282 - BLOCK
    )
    :vars
    (
      ?auto_205283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205282 ?auto_205283 ) ( ON-TABLE ?auto_205271 ) ( ON ?auto_205272 ?auto_205271 ) ( ON ?auto_205273 ?auto_205272 ) ( not ( = ?auto_205271 ?auto_205272 ) ) ( not ( = ?auto_205271 ?auto_205273 ) ) ( not ( = ?auto_205271 ?auto_205274 ) ) ( not ( = ?auto_205271 ?auto_205275 ) ) ( not ( = ?auto_205271 ?auto_205276 ) ) ( not ( = ?auto_205271 ?auto_205277 ) ) ( not ( = ?auto_205271 ?auto_205278 ) ) ( not ( = ?auto_205271 ?auto_205279 ) ) ( not ( = ?auto_205271 ?auto_205280 ) ) ( not ( = ?auto_205271 ?auto_205281 ) ) ( not ( = ?auto_205271 ?auto_205282 ) ) ( not ( = ?auto_205271 ?auto_205283 ) ) ( not ( = ?auto_205272 ?auto_205273 ) ) ( not ( = ?auto_205272 ?auto_205274 ) ) ( not ( = ?auto_205272 ?auto_205275 ) ) ( not ( = ?auto_205272 ?auto_205276 ) ) ( not ( = ?auto_205272 ?auto_205277 ) ) ( not ( = ?auto_205272 ?auto_205278 ) ) ( not ( = ?auto_205272 ?auto_205279 ) ) ( not ( = ?auto_205272 ?auto_205280 ) ) ( not ( = ?auto_205272 ?auto_205281 ) ) ( not ( = ?auto_205272 ?auto_205282 ) ) ( not ( = ?auto_205272 ?auto_205283 ) ) ( not ( = ?auto_205273 ?auto_205274 ) ) ( not ( = ?auto_205273 ?auto_205275 ) ) ( not ( = ?auto_205273 ?auto_205276 ) ) ( not ( = ?auto_205273 ?auto_205277 ) ) ( not ( = ?auto_205273 ?auto_205278 ) ) ( not ( = ?auto_205273 ?auto_205279 ) ) ( not ( = ?auto_205273 ?auto_205280 ) ) ( not ( = ?auto_205273 ?auto_205281 ) ) ( not ( = ?auto_205273 ?auto_205282 ) ) ( not ( = ?auto_205273 ?auto_205283 ) ) ( not ( = ?auto_205274 ?auto_205275 ) ) ( not ( = ?auto_205274 ?auto_205276 ) ) ( not ( = ?auto_205274 ?auto_205277 ) ) ( not ( = ?auto_205274 ?auto_205278 ) ) ( not ( = ?auto_205274 ?auto_205279 ) ) ( not ( = ?auto_205274 ?auto_205280 ) ) ( not ( = ?auto_205274 ?auto_205281 ) ) ( not ( = ?auto_205274 ?auto_205282 ) ) ( not ( = ?auto_205274 ?auto_205283 ) ) ( not ( = ?auto_205275 ?auto_205276 ) ) ( not ( = ?auto_205275 ?auto_205277 ) ) ( not ( = ?auto_205275 ?auto_205278 ) ) ( not ( = ?auto_205275 ?auto_205279 ) ) ( not ( = ?auto_205275 ?auto_205280 ) ) ( not ( = ?auto_205275 ?auto_205281 ) ) ( not ( = ?auto_205275 ?auto_205282 ) ) ( not ( = ?auto_205275 ?auto_205283 ) ) ( not ( = ?auto_205276 ?auto_205277 ) ) ( not ( = ?auto_205276 ?auto_205278 ) ) ( not ( = ?auto_205276 ?auto_205279 ) ) ( not ( = ?auto_205276 ?auto_205280 ) ) ( not ( = ?auto_205276 ?auto_205281 ) ) ( not ( = ?auto_205276 ?auto_205282 ) ) ( not ( = ?auto_205276 ?auto_205283 ) ) ( not ( = ?auto_205277 ?auto_205278 ) ) ( not ( = ?auto_205277 ?auto_205279 ) ) ( not ( = ?auto_205277 ?auto_205280 ) ) ( not ( = ?auto_205277 ?auto_205281 ) ) ( not ( = ?auto_205277 ?auto_205282 ) ) ( not ( = ?auto_205277 ?auto_205283 ) ) ( not ( = ?auto_205278 ?auto_205279 ) ) ( not ( = ?auto_205278 ?auto_205280 ) ) ( not ( = ?auto_205278 ?auto_205281 ) ) ( not ( = ?auto_205278 ?auto_205282 ) ) ( not ( = ?auto_205278 ?auto_205283 ) ) ( not ( = ?auto_205279 ?auto_205280 ) ) ( not ( = ?auto_205279 ?auto_205281 ) ) ( not ( = ?auto_205279 ?auto_205282 ) ) ( not ( = ?auto_205279 ?auto_205283 ) ) ( not ( = ?auto_205280 ?auto_205281 ) ) ( not ( = ?auto_205280 ?auto_205282 ) ) ( not ( = ?auto_205280 ?auto_205283 ) ) ( not ( = ?auto_205281 ?auto_205282 ) ) ( not ( = ?auto_205281 ?auto_205283 ) ) ( not ( = ?auto_205282 ?auto_205283 ) ) ( ON ?auto_205281 ?auto_205282 ) ( ON ?auto_205280 ?auto_205281 ) ( ON ?auto_205279 ?auto_205280 ) ( ON ?auto_205278 ?auto_205279 ) ( ON ?auto_205277 ?auto_205278 ) ( ON ?auto_205276 ?auto_205277 ) ( ON ?auto_205275 ?auto_205276 ) ( CLEAR ?auto_205273 ) ( ON ?auto_205274 ?auto_205275 ) ( CLEAR ?auto_205274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205271 ?auto_205272 ?auto_205273 ?auto_205274 )
      ( MAKE-12PILE ?auto_205271 ?auto_205272 ?auto_205273 ?auto_205274 ?auto_205275 ?auto_205276 ?auto_205277 ?auto_205278 ?auto_205279 ?auto_205280 ?auto_205281 ?auto_205282 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205296 - BLOCK
      ?auto_205297 - BLOCK
      ?auto_205298 - BLOCK
      ?auto_205299 - BLOCK
      ?auto_205300 - BLOCK
      ?auto_205301 - BLOCK
      ?auto_205302 - BLOCK
      ?auto_205303 - BLOCK
      ?auto_205304 - BLOCK
      ?auto_205305 - BLOCK
      ?auto_205306 - BLOCK
      ?auto_205307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205307 ) ( ON-TABLE ?auto_205296 ) ( ON ?auto_205297 ?auto_205296 ) ( ON ?auto_205298 ?auto_205297 ) ( not ( = ?auto_205296 ?auto_205297 ) ) ( not ( = ?auto_205296 ?auto_205298 ) ) ( not ( = ?auto_205296 ?auto_205299 ) ) ( not ( = ?auto_205296 ?auto_205300 ) ) ( not ( = ?auto_205296 ?auto_205301 ) ) ( not ( = ?auto_205296 ?auto_205302 ) ) ( not ( = ?auto_205296 ?auto_205303 ) ) ( not ( = ?auto_205296 ?auto_205304 ) ) ( not ( = ?auto_205296 ?auto_205305 ) ) ( not ( = ?auto_205296 ?auto_205306 ) ) ( not ( = ?auto_205296 ?auto_205307 ) ) ( not ( = ?auto_205297 ?auto_205298 ) ) ( not ( = ?auto_205297 ?auto_205299 ) ) ( not ( = ?auto_205297 ?auto_205300 ) ) ( not ( = ?auto_205297 ?auto_205301 ) ) ( not ( = ?auto_205297 ?auto_205302 ) ) ( not ( = ?auto_205297 ?auto_205303 ) ) ( not ( = ?auto_205297 ?auto_205304 ) ) ( not ( = ?auto_205297 ?auto_205305 ) ) ( not ( = ?auto_205297 ?auto_205306 ) ) ( not ( = ?auto_205297 ?auto_205307 ) ) ( not ( = ?auto_205298 ?auto_205299 ) ) ( not ( = ?auto_205298 ?auto_205300 ) ) ( not ( = ?auto_205298 ?auto_205301 ) ) ( not ( = ?auto_205298 ?auto_205302 ) ) ( not ( = ?auto_205298 ?auto_205303 ) ) ( not ( = ?auto_205298 ?auto_205304 ) ) ( not ( = ?auto_205298 ?auto_205305 ) ) ( not ( = ?auto_205298 ?auto_205306 ) ) ( not ( = ?auto_205298 ?auto_205307 ) ) ( not ( = ?auto_205299 ?auto_205300 ) ) ( not ( = ?auto_205299 ?auto_205301 ) ) ( not ( = ?auto_205299 ?auto_205302 ) ) ( not ( = ?auto_205299 ?auto_205303 ) ) ( not ( = ?auto_205299 ?auto_205304 ) ) ( not ( = ?auto_205299 ?auto_205305 ) ) ( not ( = ?auto_205299 ?auto_205306 ) ) ( not ( = ?auto_205299 ?auto_205307 ) ) ( not ( = ?auto_205300 ?auto_205301 ) ) ( not ( = ?auto_205300 ?auto_205302 ) ) ( not ( = ?auto_205300 ?auto_205303 ) ) ( not ( = ?auto_205300 ?auto_205304 ) ) ( not ( = ?auto_205300 ?auto_205305 ) ) ( not ( = ?auto_205300 ?auto_205306 ) ) ( not ( = ?auto_205300 ?auto_205307 ) ) ( not ( = ?auto_205301 ?auto_205302 ) ) ( not ( = ?auto_205301 ?auto_205303 ) ) ( not ( = ?auto_205301 ?auto_205304 ) ) ( not ( = ?auto_205301 ?auto_205305 ) ) ( not ( = ?auto_205301 ?auto_205306 ) ) ( not ( = ?auto_205301 ?auto_205307 ) ) ( not ( = ?auto_205302 ?auto_205303 ) ) ( not ( = ?auto_205302 ?auto_205304 ) ) ( not ( = ?auto_205302 ?auto_205305 ) ) ( not ( = ?auto_205302 ?auto_205306 ) ) ( not ( = ?auto_205302 ?auto_205307 ) ) ( not ( = ?auto_205303 ?auto_205304 ) ) ( not ( = ?auto_205303 ?auto_205305 ) ) ( not ( = ?auto_205303 ?auto_205306 ) ) ( not ( = ?auto_205303 ?auto_205307 ) ) ( not ( = ?auto_205304 ?auto_205305 ) ) ( not ( = ?auto_205304 ?auto_205306 ) ) ( not ( = ?auto_205304 ?auto_205307 ) ) ( not ( = ?auto_205305 ?auto_205306 ) ) ( not ( = ?auto_205305 ?auto_205307 ) ) ( not ( = ?auto_205306 ?auto_205307 ) ) ( ON ?auto_205306 ?auto_205307 ) ( ON ?auto_205305 ?auto_205306 ) ( ON ?auto_205304 ?auto_205305 ) ( ON ?auto_205303 ?auto_205304 ) ( ON ?auto_205302 ?auto_205303 ) ( ON ?auto_205301 ?auto_205302 ) ( ON ?auto_205300 ?auto_205301 ) ( CLEAR ?auto_205298 ) ( ON ?auto_205299 ?auto_205300 ) ( CLEAR ?auto_205299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205296 ?auto_205297 ?auto_205298 ?auto_205299 )
      ( MAKE-12PILE ?auto_205296 ?auto_205297 ?auto_205298 ?auto_205299 ?auto_205300 ?auto_205301 ?auto_205302 ?auto_205303 ?auto_205304 ?auto_205305 ?auto_205306 ?auto_205307 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205320 - BLOCK
      ?auto_205321 - BLOCK
      ?auto_205322 - BLOCK
      ?auto_205323 - BLOCK
      ?auto_205324 - BLOCK
      ?auto_205325 - BLOCK
      ?auto_205326 - BLOCK
      ?auto_205327 - BLOCK
      ?auto_205328 - BLOCK
      ?auto_205329 - BLOCK
      ?auto_205330 - BLOCK
      ?auto_205331 - BLOCK
    )
    :vars
    (
      ?auto_205332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205331 ?auto_205332 ) ( ON-TABLE ?auto_205320 ) ( ON ?auto_205321 ?auto_205320 ) ( not ( = ?auto_205320 ?auto_205321 ) ) ( not ( = ?auto_205320 ?auto_205322 ) ) ( not ( = ?auto_205320 ?auto_205323 ) ) ( not ( = ?auto_205320 ?auto_205324 ) ) ( not ( = ?auto_205320 ?auto_205325 ) ) ( not ( = ?auto_205320 ?auto_205326 ) ) ( not ( = ?auto_205320 ?auto_205327 ) ) ( not ( = ?auto_205320 ?auto_205328 ) ) ( not ( = ?auto_205320 ?auto_205329 ) ) ( not ( = ?auto_205320 ?auto_205330 ) ) ( not ( = ?auto_205320 ?auto_205331 ) ) ( not ( = ?auto_205320 ?auto_205332 ) ) ( not ( = ?auto_205321 ?auto_205322 ) ) ( not ( = ?auto_205321 ?auto_205323 ) ) ( not ( = ?auto_205321 ?auto_205324 ) ) ( not ( = ?auto_205321 ?auto_205325 ) ) ( not ( = ?auto_205321 ?auto_205326 ) ) ( not ( = ?auto_205321 ?auto_205327 ) ) ( not ( = ?auto_205321 ?auto_205328 ) ) ( not ( = ?auto_205321 ?auto_205329 ) ) ( not ( = ?auto_205321 ?auto_205330 ) ) ( not ( = ?auto_205321 ?auto_205331 ) ) ( not ( = ?auto_205321 ?auto_205332 ) ) ( not ( = ?auto_205322 ?auto_205323 ) ) ( not ( = ?auto_205322 ?auto_205324 ) ) ( not ( = ?auto_205322 ?auto_205325 ) ) ( not ( = ?auto_205322 ?auto_205326 ) ) ( not ( = ?auto_205322 ?auto_205327 ) ) ( not ( = ?auto_205322 ?auto_205328 ) ) ( not ( = ?auto_205322 ?auto_205329 ) ) ( not ( = ?auto_205322 ?auto_205330 ) ) ( not ( = ?auto_205322 ?auto_205331 ) ) ( not ( = ?auto_205322 ?auto_205332 ) ) ( not ( = ?auto_205323 ?auto_205324 ) ) ( not ( = ?auto_205323 ?auto_205325 ) ) ( not ( = ?auto_205323 ?auto_205326 ) ) ( not ( = ?auto_205323 ?auto_205327 ) ) ( not ( = ?auto_205323 ?auto_205328 ) ) ( not ( = ?auto_205323 ?auto_205329 ) ) ( not ( = ?auto_205323 ?auto_205330 ) ) ( not ( = ?auto_205323 ?auto_205331 ) ) ( not ( = ?auto_205323 ?auto_205332 ) ) ( not ( = ?auto_205324 ?auto_205325 ) ) ( not ( = ?auto_205324 ?auto_205326 ) ) ( not ( = ?auto_205324 ?auto_205327 ) ) ( not ( = ?auto_205324 ?auto_205328 ) ) ( not ( = ?auto_205324 ?auto_205329 ) ) ( not ( = ?auto_205324 ?auto_205330 ) ) ( not ( = ?auto_205324 ?auto_205331 ) ) ( not ( = ?auto_205324 ?auto_205332 ) ) ( not ( = ?auto_205325 ?auto_205326 ) ) ( not ( = ?auto_205325 ?auto_205327 ) ) ( not ( = ?auto_205325 ?auto_205328 ) ) ( not ( = ?auto_205325 ?auto_205329 ) ) ( not ( = ?auto_205325 ?auto_205330 ) ) ( not ( = ?auto_205325 ?auto_205331 ) ) ( not ( = ?auto_205325 ?auto_205332 ) ) ( not ( = ?auto_205326 ?auto_205327 ) ) ( not ( = ?auto_205326 ?auto_205328 ) ) ( not ( = ?auto_205326 ?auto_205329 ) ) ( not ( = ?auto_205326 ?auto_205330 ) ) ( not ( = ?auto_205326 ?auto_205331 ) ) ( not ( = ?auto_205326 ?auto_205332 ) ) ( not ( = ?auto_205327 ?auto_205328 ) ) ( not ( = ?auto_205327 ?auto_205329 ) ) ( not ( = ?auto_205327 ?auto_205330 ) ) ( not ( = ?auto_205327 ?auto_205331 ) ) ( not ( = ?auto_205327 ?auto_205332 ) ) ( not ( = ?auto_205328 ?auto_205329 ) ) ( not ( = ?auto_205328 ?auto_205330 ) ) ( not ( = ?auto_205328 ?auto_205331 ) ) ( not ( = ?auto_205328 ?auto_205332 ) ) ( not ( = ?auto_205329 ?auto_205330 ) ) ( not ( = ?auto_205329 ?auto_205331 ) ) ( not ( = ?auto_205329 ?auto_205332 ) ) ( not ( = ?auto_205330 ?auto_205331 ) ) ( not ( = ?auto_205330 ?auto_205332 ) ) ( not ( = ?auto_205331 ?auto_205332 ) ) ( ON ?auto_205330 ?auto_205331 ) ( ON ?auto_205329 ?auto_205330 ) ( ON ?auto_205328 ?auto_205329 ) ( ON ?auto_205327 ?auto_205328 ) ( ON ?auto_205326 ?auto_205327 ) ( ON ?auto_205325 ?auto_205326 ) ( ON ?auto_205324 ?auto_205325 ) ( ON ?auto_205323 ?auto_205324 ) ( CLEAR ?auto_205321 ) ( ON ?auto_205322 ?auto_205323 ) ( CLEAR ?auto_205322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205320 ?auto_205321 ?auto_205322 )
      ( MAKE-12PILE ?auto_205320 ?auto_205321 ?auto_205322 ?auto_205323 ?auto_205324 ?auto_205325 ?auto_205326 ?auto_205327 ?auto_205328 ?auto_205329 ?auto_205330 ?auto_205331 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205345 - BLOCK
      ?auto_205346 - BLOCK
      ?auto_205347 - BLOCK
      ?auto_205348 - BLOCK
      ?auto_205349 - BLOCK
      ?auto_205350 - BLOCK
      ?auto_205351 - BLOCK
      ?auto_205352 - BLOCK
      ?auto_205353 - BLOCK
      ?auto_205354 - BLOCK
      ?auto_205355 - BLOCK
      ?auto_205356 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205356 ) ( ON-TABLE ?auto_205345 ) ( ON ?auto_205346 ?auto_205345 ) ( not ( = ?auto_205345 ?auto_205346 ) ) ( not ( = ?auto_205345 ?auto_205347 ) ) ( not ( = ?auto_205345 ?auto_205348 ) ) ( not ( = ?auto_205345 ?auto_205349 ) ) ( not ( = ?auto_205345 ?auto_205350 ) ) ( not ( = ?auto_205345 ?auto_205351 ) ) ( not ( = ?auto_205345 ?auto_205352 ) ) ( not ( = ?auto_205345 ?auto_205353 ) ) ( not ( = ?auto_205345 ?auto_205354 ) ) ( not ( = ?auto_205345 ?auto_205355 ) ) ( not ( = ?auto_205345 ?auto_205356 ) ) ( not ( = ?auto_205346 ?auto_205347 ) ) ( not ( = ?auto_205346 ?auto_205348 ) ) ( not ( = ?auto_205346 ?auto_205349 ) ) ( not ( = ?auto_205346 ?auto_205350 ) ) ( not ( = ?auto_205346 ?auto_205351 ) ) ( not ( = ?auto_205346 ?auto_205352 ) ) ( not ( = ?auto_205346 ?auto_205353 ) ) ( not ( = ?auto_205346 ?auto_205354 ) ) ( not ( = ?auto_205346 ?auto_205355 ) ) ( not ( = ?auto_205346 ?auto_205356 ) ) ( not ( = ?auto_205347 ?auto_205348 ) ) ( not ( = ?auto_205347 ?auto_205349 ) ) ( not ( = ?auto_205347 ?auto_205350 ) ) ( not ( = ?auto_205347 ?auto_205351 ) ) ( not ( = ?auto_205347 ?auto_205352 ) ) ( not ( = ?auto_205347 ?auto_205353 ) ) ( not ( = ?auto_205347 ?auto_205354 ) ) ( not ( = ?auto_205347 ?auto_205355 ) ) ( not ( = ?auto_205347 ?auto_205356 ) ) ( not ( = ?auto_205348 ?auto_205349 ) ) ( not ( = ?auto_205348 ?auto_205350 ) ) ( not ( = ?auto_205348 ?auto_205351 ) ) ( not ( = ?auto_205348 ?auto_205352 ) ) ( not ( = ?auto_205348 ?auto_205353 ) ) ( not ( = ?auto_205348 ?auto_205354 ) ) ( not ( = ?auto_205348 ?auto_205355 ) ) ( not ( = ?auto_205348 ?auto_205356 ) ) ( not ( = ?auto_205349 ?auto_205350 ) ) ( not ( = ?auto_205349 ?auto_205351 ) ) ( not ( = ?auto_205349 ?auto_205352 ) ) ( not ( = ?auto_205349 ?auto_205353 ) ) ( not ( = ?auto_205349 ?auto_205354 ) ) ( not ( = ?auto_205349 ?auto_205355 ) ) ( not ( = ?auto_205349 ?auto_205356 ) ) ( not ( = ?auto_205350 ?auto_205351 ) ) ( not ( = ?auto_205350 ?auto_205352 ) ) ( not ( = ?auto_205350 ?auto_205353 ) ) ( not ( = ?auto_205350 ?auto_205354 ) ) ( not ( = ?auto_205350 ?auto_205355 ) ) ( not ( = ?auto_205350 ?auto_205356 ) ) ( not ( = ?auto_205351 ?auto_205352 ) ) ( not ( = ?auto_205351 ?auto_205353 ) ) ( not ( = ?auto_205351 ?auto_205354 ) ) ( not ( = ?auto_205351 ?auto_205355 ) ) ( not ( = ?auto_205351 ?auto_205356 ) ) ( not ( = ?auto_205352 ?auto_205353 ) ) ( not ( = ?auto_205352 ?auto_205354 ) ) ( not ( = ?auto_205352 ?auto_205355 ) ) ( not ( = ?auto_205352 ?auto_205356 ) ) ( not ( = ?auto_205353 ?auto_205354 ) ) ( not ( = ?auto_205353 ?auto_205355 ) ) ( not ( = ?auto_205353 ?auto_205356 ) ) ( not ( = ?auto_205354 ?auto_205355 ) ) ( not ( = ?auto_205354 ?auto_205356 ) ) ( not ( = ?auto_205355 ?auto_205356 ) ) ( ON ?auto_205355 ?auto_205356 ) ( ON ?auto_205354 ?auto_205355 ) ( ON ?auto_205353 ?auto_205354 ) ( ON ?auto_205352 ?auto_205353 ) ( ON ?auto_205351 ?auto_205352 ) ( ON ?auto_205350 ?auto_205351 ) ( ON ?auto_205349 ?auto_205350 ) ( ON ?auto_205348 ?auto_205349 ) ( CLEAR ?auto_205346 ) ( ON ?auto_205347 ?auto_205348 ) ( CLEAR ?auto_205347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205345 ?auto_205346 ?auto_205347 )
      ( MAKE-12PILE ?auto_205345 ?auto_205346 ?auto_205347 ?auto_205348 ?auto_205349 ?auto_205350 ?auto_205351 ?auto_205352 ?auto_205353 ?auto_205354 ?auto_205355 ?auto_205356 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205369 - BLOCK
      ?auto_205370 - BLOCK
      ?auto_205371 - BLOCK
      ?auto_205372 - BLOCK
      ?auto_205373 - BLOCK
      ?auto_205374 - BLOCK
      ?auto_205375 - BLOCK
      ?auto_205376 - BLOCK
      ?auto_205377 - BLOCK
      ?auto_205378 - BLOCK
      ?auto_205379 - BLOCK
      ?auto_205380 - BLOCK
    )
    :vars
    (
      ?auto_205381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205380 ?auto_205381 ) ( ON-TABLE ?auto_205369 ) ( not ( = ?auto_205369 ?auto_205370 ) ) ( not ( = ?auto_205369 ?auto_205371 ) ) ( not ( = ?auto_205369 ?auto_205372 ) ) ( not ( = ?auto_205369 ?auto_205373 ) ) ( not ( = ?auto_205369 ?auto_205374 ) ) ( not ( = ?auto_205369 ?auto_205375 ) ) ( not ( = ?auto_205369 ?auto_205376 ) ) ( not ( = ?auto_205369 ?auto_205377 ) ) ( not ( = ?auto_205369 ?auto_205378 ) ) ( not ( = ?auto_205369 ?auto_205379 ) ) ( not ( = ?auto_205369 ?auto_205380 ) ) ( not ( = ?auto_205369 ?auto_205381 ) ) ( not ( = ?auto_205370 ?auto_205371 ) ) ( not ( = ?auto_205370 ?auto_205372 ) ) ( not ( = ?auto_205370 ?auto_205373 ) ) ( not ( = ?auto_205370 ?auto_205374 ) ) ( not ( = ?auto_205370 ?auto_205375 ) ) ( not ( = ?auto_205370 ?auto_205376 ) ) ( not ( = ?auto_205370 ?auto_205377 ) ) ( not ( = ?auto_205370 ?auto_205378 ) ) ( not ( = ?auto_205370 ?auto_205379 ) ) ( not ( = ?auto_205370 ?auto_205380 ) ) ( not ( = ?auto_205370 ?auto_205381 ) ) ( not ( = ?auto_205371 ?auto_205372 ) ) ( not ( = ?auto_205371 ?auto_205373 ) ) ( not ( = ?auto_205371 ?auto_205374 ) ) ( not ( = ?auto_205371 ?auto_205375 ) ) ( not ( = ?auto_205371 ?auto_205376 ) ) ( not ( = ?auto_205371 ?auto_205377 ) ) ( not ( = ?auto_205371 ?auto_205378 ) ) ( not ( = ?auto_205371 ?auto_205379 ) ) ( not ( = ?auto_205371 ?auto_205380 ) ) ( not ( = ?auto_205371 ?auto_205381 ) ) ( not ( = ?auto_205372 ?auto_205373 ) ) ( not ( = ?auto_205372 ?auto_205374 ) ) ( not ( = ?auto_205372 ?auto_205375 ) ) ( not ( = ?auto_205372 ?auto_205376 ) ) ( not ( = ?auto_205372 ?auto_205377 ) ) ( not ( = ?auto_205372 ?auto_205378 ) ) ( not ( = ?auto_205372 ?auto_205379 ) ) ( not ( = ?auto_205372 ?auto_205380 ) ) ( not ( = ?auto_205372 ?auto_205381 ) ) ( not ( = ?auto_205373 ?auto_205374 ) ) ( not ( = ?auto_205373 ?auto_205375 ) ) ( not ( = ?auto_205373 ?auto_205376 ) ) ( not ( = ?auto_205373 ?auto_205377 ) ) ( not ( = ?auto_205373 ?auto_205378 ) ) ( not ( = ?auto_205373 ?auto_205379 ) ) ( not ( = ?auto_205373 ?auto_205380 ) ) ( not ( = ?auto_205373 ?auto_205381 ) ) ( not ( = ?auto_205374 ?auto_205375 ) ) ( not ( = ?auto_205374 ?auto_205376 ) ) ( not ( = ?auto_205374 ?auto_205377 ) ) ( not ( = ?auto_205374 ?auto_205378 ) ) ( not ( = ?auto_205374 ?auto_205379 ) ) ( not ( = ?auto_205374 ?auto_205380 ) ) ( not ( = ?auto_205374 ?auto_205381 ) ) ( not ( = ?auto_205375 ?auto_205376 ) ) ( not ( = ?auto_205375 ?auto_205377 ) ) ( not ( = ?auto_205375 ?auto_205378 ) ) ( not ( = ?auto_205375 ?auto_205379 ) ) ( not ( = ?auto_205375 ?auto_205380 ) ) ( not ( = ?auto_205375 ?auto_205381 ) ) ( not ( = ?auto_205376 ?auto_205377 ) ) ( not ( = ?auto_205376 ?auto_205378 ) ) ( not ( = ?auto_205376 ?auto_205379 ) ) ( not ( = ?auto_205376 ?auto_205380 ) ) ( not ( = ?auto_205376 ?auto_205381 ) ) ( not ( = ?auto_205377 ?auto_205378 ) ) ( not ( = ?auto_205377 ?auto_205379 ) ) ( not ( = ?auto_205377 ?auto_205380 ) ) ( not ( = ?auto_205377 ?auto_205381 ) ) ( not ( = ?auto_205378 ?auto_205379 ) ) ( not ( = ?auto_205378 ?auto_205380 ) ) ( not ( = ?auto_205378 ?auto_205381 ) ) ( not ( = ?auto_205379 ?auto_205380 ) ) ( not ( = ?auto_205379 ?auto_205381 ) ) ( not ( = ?auto_205380 ?auto_205381 ) ) ( ON ?auto_205379 ?auto_205380 ) ( ON ?auto_205378 ?auto_205379 ) ( ON ?auto_205377 ?auto_205378 ) ( ON ?auto_205376 ?auto_205377 ) ( ON ?auto_205375 ?auto_205376 ) ( ON ?auto_205374 ?auto_205375 ) ( ON ?auto_205373 ?auto_205374 ) ( ON ?auto_205372 ?auto_205373 ) ( ON ?auto_205371 ?auto_205372 ) ( CLEAR ?auto_205369 ) ( ON ?auto_205370 ?auto_205371 ) ( CLEAR ?auto_205370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205369 ?auto_205370 )
      ( MAKE-12PILE ?auto_205369 ?auto_205370 ?auto_205371 ?auto_205372 ?auto_205373 ?auto_205374 ?auto_205375 ?auto_205376 ?auto_205377 ?auto_205378 ?auto_205379 ?auto_205380 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205394 - BLOCK
      ?auto_205395 - BLOCK
      ?auto_205396 - BLOCK
      ?auto_205397 - BLOCK
      ?auto_205398 - BLOCK
      ?auto_205399 - BLOCK
      ?auto_205400 - BLOCK
      ?auto_205401 - BLOCK
      ?auto_205402 - BLOCK
      ?auto_205403 - BLOCK
      ?auto_205404 - BLOCK
      ?auto_205405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205405 ) ( ON-TABLE ?auto_205394 ) ( not ( = ?auto_205394 ?auto_205395 ) ) ( not ( = ?auto_205394 ?auto_205396 ) ) ( not ( = ?auto_205394 ?auto_205397 ) ) ( not ( = ?auto_205394 ?auto_205398 ) ) ( not ( = ?auto_205394 ?auto_205399 ) ) ( not ( = ?auto_205394 ?auto_205400 ) ) ( not ( = ?auto_205394 ?auto_205401 ) ) ( not ( = ?auto_205394 ?auto_205402 ) ) ( not ( = ?auto_205394 ?auto_205403 ) ) ( not ( = ?auto_205394 ?auto_205404 ) ) ( not ( = ?auto_205394 ?auto_205405 ) ) ( not ( = ?auto_205395 ?auto_205396 ) ) ( not ( = ?auto_205395 ?auto_205397 ) ) ( not ( = ?auto_205395 ?auto_205398 ) ) ( not ( = ?auto_205395 ?auto_205399 ) ) ( not ( = ?auto_205395 ?auto_205400 ) ) ( not ( = ?auto_205395 ?auto_205401 ) ) ( not ( = ?auto_205395 ?auto_205402 ) ) ( not ( = ?auto_205395 ?auto_205403 ) ) ( not ( = ?auto_205395 ?auto_205404 ) ) ( not ( = ?auto_205395 ?auto_205405 ) ) ( not ( = ?auto_205396 ?auto_205397 ) ) ( not ( = ?auto_205396 ?auto_205398 ) ) ( not ( = ?auto_205396 ?auto_205399 ) ) ( not ( = ?auto_205396 ?auto_205400 ) ) ( not ( = ?auto_205396 ?auto_205401 ) ) ( not ( = ?auto_205396 ?auto_205402 ) ) ( not ( = ?auto_205396 ?auto_205403 ) ) ( not ( = ?auto_205396 ?auto_205404 ) ) ( not ( = ?auto_205396 ?auto_205405 ) ) ( not ( = ?auto_205397 ?auto_205398 ) ) ( not ( = ?auto_205397 ?auto_205399 ) ) ( not ( = ?auto_205397 ?auto_205400 ) ) ( not ( = ?auto_205397 ?auto_205401 ) ) ( not ( = ?auto_205397 ?auto_205402 ) ) ( not ( = ?auto_205397 ?auto_205403 ) ) ( not ( = ?auto_205397 ?auto_205404 ) ) ( not ( = ?auto_205397 ?auto_205405 ) ) ( not ( = ?auto_205398 ?auto_205399 ) ) ( not ( = ?auto_205398 ?auto_205400 ) ) ( not ( = ?auto_205398 ?auto_205401 ) ) ( not ( = ?auto_205398 ?auto_205402 ) ) ( not ( = ?auto_205398 ?auto_205403 ) ) ( not ( = ?auto_205398 ?auto_205404 ) ) ( not ( = ?auto_205398 ?auto_205405 ) ) ( not ( = ?auto_205399 ?auto_205400 ) ) ( not ( = ?auto_205399 ?auto_205401 ) ) ( not ( = ?auto_205399 ?auto_205402 ) ) ( not ( = ?auto_205399 ?auto_205403 ) ) ( not ( = ?auto_205399 ?auto_205404 ) ) ( not ( = ?auto_205399 ?auto_205405 ) ) ( not ( = ?auto_205400 ?auto_205401 ) ) ( not ( = ?auto_205400 ?auto_205402 ) ) ( not ( = ?auto_205400 ?auto_205403 ) ) ( not ( = ?auto_205400 ?auto_205404 ) ) ( not ( = ?auto_205400 ?auto_205405 ) ) ( not ( = ?auto_205401 ?auto_205402 ) ) ( not ( = ?auto_205401 ?auto_205403 ) ) ( not ( = ?auto_205401 ?auto_205404 ) ) ( not ( = ?auto_205401 ?auto_205405 ) ) ( not ( = ?auto_205402 ?auto_205403 ) ) ( not ( = ?auto_205402 ?auto_205404 ) ) ( not ( = ?auto_205402 ?auto_205405 ) ) ( not ( = ?auto_205403 ?auto_205404 ) ) ( not ( = ?auto_205403 ?auto_205405 ) ) ( not ( = ?auto_205404 ?auto_205405 ) ) ( ON ?auto_205404 ?auto_205405 ) ( ON ?auto_205403 ?auto_205404 ) ( ON ?auto_205402 ?auto_205403 ) ( ON ?auto_205401 ?auto_205402 ) ( ON ?auto_205400 ?auto_205401 ) ( ON ?auto_205399 ?auto_205400 ) ( ON ?auto_205398 ?auto_205399 ) ( ON ?auto_205397 ?auto_205398 ) ( ON ?auto_205396 ?auto_205397 ) ( CLEAR ?auto_205394 ) ( ON ?auto_205395 ?auto_205396 ) ( CLEAR ?auto_205395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205394 ?auto_205395 )
      ( MAKE-12PILE ?auto_205394 ?auto_205395 ?auto_205396 ?auto_205397 ?auto_205398 ?auto_205399 ?auto_205400 ?auto_205401 ?auto_205402 ?auto_205403 ?auto_205404 ?auto_205405 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205418 - BLOCK
      ?auto_205419 - BLOCK
      ?auto_205420 - BLOCK
      ?auto_205421 - BLOCK
      ?auto_205422 - BLOCK
      ?auto_205423 - BLOCK
      ?auto_205424 - BLOCK
      ?auto_205425 - BLOCK
      ?auto_205426 - BLOCK
      ?auto_205427 - BLOCK
      ?auto_205428 - BLOCK
      ?auto_205429 - BLOCK
    )
    :vars
    (
      ?auto_205430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205429 ?auto_205430 ) ( not ( = ?auto_205418 ?auto_205419 ) ) ( not ( = ?auto_205418 ?auto_205420 ) ) ( not ( = ?auto_205418 ?auto_205421 ) ) ( not ( = ?auto_205418 ?auto_205422 ) ) ( not ( = ?auto_205418 ?auto_205423 ) ) ( not ( = ?auto_205418 ?auto_205424 ) ) ( not ( = ?auto_205418 ?auto_205425 ) ) ( not ( = ?auto_205418 ?auto_205426 ) ) ( not ( = ?auto_205418 ?auto_205427 ) ) ( not ( = ?auto_205418 ?auto_205428 ) ) ( not ( = ?auto_205418 ?auto_205429 ) ) ( not ( = ?auto_205418 ?auto_205430 ) ) ( not ( = ?auto_205419 ?auto_205420 ) ) ( not ( = ?auto_205419 ?auto_205421 ) ) ( not ( = ?auto_205419 ?auto_205422 ) ) ( not ( = ?auto_205419 ?auto_205423 ) ) ( not ( = ?auto_205419 ?auto_205424 ) ) ( not ( = ?auto_205419 ?auto_205425 ) ) ( not ( = ?auto_205419 ?auto_205426 ) ) ( not ( = ?auto_205419 ?auto_205427 ) ) ( not ( = ?auto_205419 ?auto_205428 ) ) ( not ( = ?auto_205419 ?auto_205429 ) ) ( not ( = ?auto_205419 ?auto_205430 ) ) ( not ( = ?auto_205420 ?auto_205421 ) ) ( not ( = ?auto_205420 ?auto_205422 ) ) ( not ( = ?auto_205420 ?auto_205423 ) ) ( not ( = ?auto_205420 ?auto_205424 ) ) ( not ( = ?auto_205420 ?auto_205425 ) ) ( not ( = ?auto_205420 ?auto_205426 ) ) ( not ( = ?auto_205420 ?auto_205427 ) ) ( not ( = ?auto_205420 ?auto_205428 ) ) ( not ( = ?auto_205420 ?auto_205429 ) ) ( not ( = ?auto_205420 ?auto_205430 ) ) ( not ( = ?auto_205421 ?auto_205422 ) ) ( not ( = ?auto_205421 ?auto_205423 ) ) ( not ( = ?auto_205421 ?auto_205424 ) ) ( not ( = ?auto_205421 ?auto_205425 ) ) ( not ( = ?auto_205421 ?auto_205426 ) ) ( not ( = ?auto_205421 ?auto_205427 ) ) ( not ( = ?auto_205421 ?auto_205428 ) ) ( not ( = ?auto_205421 ?auto_205429 ) ) ( not ( = ?auto_205421 ?auto_205430 ) ) ( not ( = ?auto_205422 ?auto_205423 ) ) ( not ( = ?auto_205422 ?auto_205424 ) ) ( not ( = ?auto_205422 ?auto_205425 ) ) ( not ( = ?auto_205422 ?auto_205426 ) ) ( not ( = ?auto_205422 ?auto_205427 ) ) ( not ( = ?auto_205422 ?auto_205428 ) ) ( not ( = ?auto_205422 ?auto_205429 ) ) ( not ( = ?auto_205422 ?auto_205430 ) ) ( not ( = ?auto_205423 ?auto_205424 ) ) ( not ( = ?auto_205423 ?auto_205425 ) ) ( not ( = ?auto_205423 ?auto_205426 ) ) ( not ( = ?auto_205423 ?auto_205427 ) ) ( not ( = ?auto_205423 ?auto_205428 ) ) ( not ( = ?auto_205423 ?auto_205429 ) ) ( not ( = ?auto_205423 ?auto_205430 ) ) ( not ( = ?auto_205424 ?auto_205425 ) ) ( not ( = ?auto_205424 ?auto_205426 ) ) ( not ( = ?auto_205424 ?auto_205427 ) ) ( not ( = ?auto_205424 ?auto_205428 ) ) ( not ( = ?auto_205424 ?auto_205429 ) ) ( not ( = ?auto_205424 ?auto_205430 ) ) ( not ( = ?auto_205425 ?auto_205426 ) ) ( not ( = ?auto_205425 ?auto_205427 ) ) ( not ( = ?auto_205425 ?auto_205428 ) ) ( not ( = ?auto_205425 ?auto_205429 ) ) ( not ( = ?auto_205425 ?auto_205430 ) ) ( not ( = ?auto_205426 ?auto_205427 ) ) ( not ( = ?auto_205426 ?auto_205428 ) ) ( not ( = ?auto_205426 ?auto_205429 ) ) ( not ( = ?auto_205426 ?auto_205430 ) ) ( not ( = ?auto_205427 ?auto_205428 ) ) ( not ( = ?auto_205427 ?auto_205429 ) ) ( not ( = ?auto_205427 ?auto_205430 ) ) ( not ( = ?auto_205428 ?auto_205429 ) ) ( not ( = ?auto_205428 ?auto_205430 ) ) ( not ( = ?auto_205429 ?auto_205430 ) ) ( ON ?auto_205428 ?auto_205429 ) ( ON ?auto_205427 ?auto_205428 ) ( ON ?auto_205426 ?auto_205427 ) ( ON ?auto_205425 ?auto_205426 ) ( ON ?auto_205424 ?auto_205425 ) ( ON ?auto_205423 ?auto_205424 ) ( ON ?auto_205422 ?auto_205423 ) ( ON ?auto_205421 ?auto_205422 ) ( ON ?auto_205420 ?auto_205421 ) ( ON ?auto_205419 ?auto_205420 ) ( ON ?auto_205418 ?auto_205419 ) ( CLEAR ?auto_205418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205418 )
      ( MAKE-12PILE ?auto_205418 ?auto_205419 ?auto_205420 ?auto_205421 ?auto_205422 ?auto_205423 ?auto_205424 ?auto_205425 ?auto_205426 ?auto_205427 ?auto_205428 ?auto_205429 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205443 - BLOCK
      ?auto_205444 - BLOCK
      ?auto_205445 - BLOCK
      ?auto_205446 - BLOCK
      ?auto_205447 - BLOCK
      ?auto_205448 - BLOCK
      ?auto_205449 - BLOCK
      ?auto_205450 - BLOCK
      ?auto_205451 - BLOCK
      ?auto_205452 - BLOCK
      ?auto_205453 - BLOCK
      ?auto_205454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205454 ) ( not ( = ?auto_205443 ?auto_205444 ) ) ( not ( = ?auto_205443 ?auto_205445 ) ) ( not ( = ?auto_205443 ?auto_205446 ) ) ( not ( = ?auto_205443 ?auto_205447 ) ) ( not ( = ?auto_205443 ?auto_205448 ) ) ( not ( = ?auto_205443 ?auto_205449 ) ) ( not ( = ?auto_205443 ?auto_205450 ) ) ( not ( = ?auto_205443 ?auto_205451 ) ) ( not ( = ?auto_205443 ?auto_205452 ) ) ( not ( = ?auto_205443 ?auto_205453 ) ) ( not ( = ?auto_205443 ?auto_205454 ) ) ( not ( = ?auto_205444 ?auto_205445 ) ) ( not ( = ?auto_205444 ?auto_205446 ) ) ( not ( = ?auto_205444 ?auto_205447 ) ) ( not ( = ?auto_205444 ?auto_205448 ) ) ( not ( = ?auto_205444 ?auto_205449 ) ) ( not ( = ?auto_205444 ?auto_205450 ) ) ( not ( = ?auto_205444 ?auto_205451 ) ) ( not ( = ?auto_205444 ?auto_205452 ) ) ( not ( = ?auto_205444 ?auto_205453 ) ) ( not ( = ?auto_205444 ?auto_205454 ) ) ( not ( = ?auto_205445 ?auto_205446 ) ) ( not ( = ?auto_205445 ?auto_205447 ) ) ( not ( = ?auto_205445 ?auto_205448 ) ) ( not ( = ?auto_205445 ?auto_205449 ) ) ( not ( = ?auto_205445 ?auto_205450 ) ) ( not ( = ?auto_205445 ?auto_205451 ) ) ( not ( = ?auto_205445 ?auto_205452 ) ) ( not ( = ?auto_205445 ?auto_205453 ) ) ( not ( = ?auto_205445 ?auto_205454 ) ) ( not ( = ?auto_205446 ?auto_205447 ) ) ( not ( = ?auto_205446 ?auto_205448 ) ) ( not ( = ?auto_205446 ?auto_205449 ) ) ( not ( = ?auto_205446 ?auto_205450 ) ) ( not ( = ?auto_205446 ?auto_205451 ) ) ( not ( = ?auto_205446 ?auto_205452 ) ) ( not ( = ?auto_205446 ?auto_205453 ) ) ( not ( = ?auto_205446 ?auto_205454 ) ) ( not ( = ?auto_205447 ?auto_205448 ) ) ( not ( = ?auto_205447 ?auto_205449 ) ) ( not ( = ?auto_205447 ?auto_205450 ) ) ( not ( = ?auto_205447 ?auto_205451 ) ) ( not ( = ?auto_205447 ?auto_205452 ) ) ( not ( = ?auto_205447 ?auto_205453 ) ) ( not ( = ?auto_205447 ?auto_205454 ) ) ( not ( = ?auto_205448 ?auto_205449 ) ) ( not ( = ?auto_205448 ?auto_205450 ) ) ( not ( = ?auto_205448 ?auto_205451 ) ) ( not ( = ?auto_205448 ?auto_205452 ) ) ( not ( = ?auto_205448 ?auto_205453 ) ) ( not ( = ?auto_205448 ?auto_205454 ) ) ( not ( = ?auto_205449 ?auto_205450 ) ) ( not ( = ?auto_205449 ?auto_205451 ) ) ( not ( = ?auto_205449 ?auto_205452 ) ) ( not ( = ?auto_205449 ?auto_205453 ) ) ( not ( = ?auto_205449 ?auto_205454 ) ) ( not ( = ?auto_205450 ?auto_205451 ) ) ( not ( = ?auto_205450 ?auto_205452 ) ) ( not ( = ?auto_205450 ?auto_205453 ) ) ( not ( = ?auto_205450 ?auto_205454 ) ) ( not ( = ?auto_205451 ?auto_205452 ) ) ( not ( = ?auto_205451 ?auto_205453 ) ) ( not ( = ?auto_205451 ?auto_205454 ) ) ( not ( = ?auto_205452 ?auto_205453 ) ) ( not ( = ?auto_205452 ?auto_205454 ) ) ( not ( = ?auto_205453 ?auto_205454 ) ) ( ON ?auto_205453 ?auto_205454 ) ( ON ?auto_205452 ?auto_205453 ) ( ON ?auto_205451 ?auto_205452 ) ( ON ?auto_205450 ?auto_205451 ) ( ON ?auto_205449 ?auto_205450 ) ( ON ?auto_205448 ?auto_205449 ) ( ON ?auto_205447 ?auto_205448 ) ( ON ?auto_205446 ?auto_205447 ) ( ON ?auto_205445 ?auto_205446 ) ( ON ?auto_205444 ?auto_205445 ) ( ON ?auto_205443 ?auto_205444 ) ( CLEAR ?auto_205443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205443 )
      ( MAKE-12PILE ?auto_205443 ?auto_205444 ?auto_205445 ?auto_205446 ?auto_205447 ?auto_205448 ?auto_205449 ?auto_205450 ?auto_205451 ?auto_205452 ?auto_205453 ?auto_205454 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_205467 - BLOCK
      ?auto_205468 - BLOCK
      ?auto_205469 - BLOCK
      ?auto_205470 - BLOCK
      ?auto_205471 - BLOCK
      ?auto_205472 - BLOCK
      ?auto_205473 - BLOCK
      ?auto_205474 - BLOCK
      ?auto_205475 - BLOCK
      ?auto_205476 - BLOCK
      ?auto_205477 - BLOCK
      ?auto_205478 - BLOCK
    )
    :vars
    (
      ?auto_205479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205467 ?auto_205468 ) ) ( not ( = ?auto_205467 ?auto_205469 ) ) ( not ( = ?auto_205467 ?auto_205470 ) ) ( not ( = ?auto_205467 ?auto_205471 ) ) ( not ( = ?auto_205467 ?auto_205472 ) ) ( not ( = ?auto_205467 ?auto_205473 ) ) ( not ( = ?auto_205467 ?auto_205474 ) ) ( not ( = ?auto_205467 ?auto_205475 ) ) ( not ( = ?auto_205467 ?auto_205476 ) ) ( not ( = ?auto_205467 ?auto_205477 ) ) ( not ( = ?auto_205467 ?auto_205478 ) ) ( not ( = ?auto_205468 ?auto_205469 ) ) ( not ( = ?auto_205468 ?auto_205470 ) ) ( not ( = ?auto_205468 ?auto_205471 ) ) ( not ( = ?auto_205468 ?auto_205472 ) ) ( not ( = ?auto_205468 ?auto_205473 ) ) ( not ( = ?auto_205468 ?auto_205474 ) ) ( not ( = ?auto_205468 ?auto_205475 ) ) ( not ( = ?auto_205468 ?auto_205476 ) ) ( not ( = ?auto_205468 ?auto_205477 ) ) ( not ( = ?auto_205468 ?auto_205478 ) ) ( not ( = ?auto_205469 ?auto_205470 ) ) ( not ( = ?auto_205469 ?auto_205471 ) ) ( not ( = ?auto_205469 ?auto_205472 ) ) ( not ( = ?auto_205469 ?auto_205473 ) ) ( not ( = ?auto_205469 ?auto_205474 ) ) ( not ( = ?auto_205469 ?auto_205475 ) ) ( not ( = ?auto_205469 ?auto_205476 ) ) ( not ( = ?auto_205469 ?auto_205477 ) ) ( not ( = ?auto_205469 ?auto_205478 ) ) ( not ( = ?auto_205470 ?auto_205471 ) ) ( not ( = ?auto_205470 ?auto_205472 ) ) ( not ( = ?auto_205470 ?auto_205473 ) ) ( not ( = ?auto_205470 ?auto_205474 ) ) ( not ( = ?auto_205470 ?auto_205475 ) ) ( not ( = ?auto_205470 ?auto_205476 ) ) ( not ( = ?auto_205470 ?auto_205477 ) ) ( not ( = ?auto_205470 ?auto_205478 ) ) ( not ( = ?auto_205471 ?auto_205472 ) ) ( not ( = ?auto_205471 ?auto_205473 ) ) ( not ( = ?auto_205471 ?auto_205474 ) ) ( not ( = ?auto_205471 ?auto_205475 ) ) ( not ( = ?auto_205471 ?auto_205476 ) ) ( not ( = ?auto_205471 ?auto_205477 ) ) ( not ( = ?auto_205471 ?auto_205478 ) ) ( not ( = ?auto_205472 ?auto_205473 ) ) ( not ( = ?auto_205472 ?auto_205474 ) ) ( not ( = ?auto_205472 ?auto_205475 ) ) ( not ( = ?auto_205472 ?auto_205476 ) ) ( not ( = ?auto_205472 ?auto_205477 ) ) ( not ( = ?auto_205472 ?auto_205478 ) ) ( not ( = ?auto_205473 ?auto_205474 ) ) ( not ( = ?auto_205473 ?auto_205475 ) ) ( not ( = ?auto_205473 ?auto_205476 ) ) ( not ( = ?auto_205473 ?auto_205477 ) ) ( not ( = ?auto_205473 ?auto_205478 ) ) ( not ( = ?auto_205474 ?auto_205475 ) ) ( not ( = ?auto_205474 ?auto_205476 ) ) ( not ( = ?auto_205474 ?auto_205477 ) ) ( not ( = ?auto_205474 ?auto_205478 ) ) ( not ( = ?auto_205475 ?auto_205476 ) ) ( not ( = ?auto_205475 ?auto_205477 ) ) ( not ( = ?auto_205475 ?auto_205478 ) ) ( not ( = ?auto_205476 ?auto_205477 ) ) ( not ( = ?auto_205476 ?auto_205478 ) ) ( not ( = ?auto_205477 ?auto_205478 ) ) ( ON ?auto_205467 ?auto_205479 ) ( not ( = ?auto_205478 ?auto_205479 ) ) ( not ( = ?auto_205477 ?auto_205479 ) ) ( not ( = ?auto_205476 ?auto_205479 ) ) ( not ( = ?auto_205475 ?auto_205479 ) ) ( not ( = ?auto_205474 ?auto_205479 ) ) ( not ( = ?auto_205473 ?auto_205479 ) ) ( not ( = ?auto_205472 ?auto_205479 ) ) ( not ( = ?auto_205471 ?auto_205479 ) ) ( not ( = ?auto_205470 ?auto_205479 ) ) ( not ( = ?auto_205469 ?auto_205479 ) ) ( not ( = ?auto_205468 ?auto_205479 ) ) ( not ( = ?auto_205467 ?auto_205479 ) ) ( ON ?auto_205468 ?auto_205467 ) ( ON ?auto_205469 ?auto_205468 ) ( ON ?auto_205470 ?auto_205469 ) ( ON ?auto_205471 ?auto_205470 ) ( ON ?auto_205472 ?auto_205471 ) ( ON ?auto_205473 ?auto_205472 ) ( ON ?auto_205474 ?auto_205473 ) ( ON ?auto_205475 ?auto_205474 ) ( ON ?auto_205476 ?auto_205475 ) ( ON ?auto_205477 ?auto_205476 ) ( ON ?auto_205478 ?auto_205477 ) ( CLEAR ?auto_205478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_205478 ?auto_205477 ?auto_205476 ?auto_205475 ?auto_205474 ?auto_205473 ?auto_205472 ?auto_205471 ?auto_205470 ?auto_205469 ?auto_205468 ?auto_205467 )
      ( MAKE-12PILE ?auto_205467 ?auto_205468 ?auto_205469 ?auto_205470 ?auto_205471 ?auto_205472 ?auto_205473 ?auto_205474 ?auto_205475 ?auto_205476 ?auto_205477 ?auto_205478 ) )
  )

)

