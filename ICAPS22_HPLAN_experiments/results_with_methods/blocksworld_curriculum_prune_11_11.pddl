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
      ?auto_130589 - BLOCK
    )
    :vars
    (
      ?auto_130590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130589 ?auto_130590 ) ( CLEAR ?auto_130589 ) ( HAND-EMPTY ) ( not ( = ?auto_130589 ?auto_130590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130589 ?auto_130590 )
      ( !PUTDOWN ?auto_130589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130596 - BLOCK
      ?auto_130597 - BLOCK
    )
    :vars
    (
      ?auto_130598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130596 ) ( ON ?auto_130597 ?auto_130598 ) ( CLEAR ?auto_130597 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130596 ) ( not ( = ?auto_130596 ?auto_130597 ) ) ( not ( = ?auto_130596 ?auto_130598 ) ) ( not ( = ?auto_130597 ?auto_130598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130597 ?auto_130598 )
      ( !STACK ?auto_130597 ?auto_130596 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130606 - BLOCK
      ?auto_130607 - BLOCK
    )
    :vars
    (
      ?auto_130608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130607 ?auto_130608 ) ( not ( = ?auto_130606 ?auto_130607 ) ) ( not ( = ?auto_130606 ?auto_130608 ) ) ( not ( = ?auto_130607 ?auto_130608 ) ) ( ON ?auto_130606 ?auto_130607 ) ( CLEAR ?auto_130606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130606 )
      ( MAKE-2PILE ?auto_130606 ?auto_130607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130617 - BLOCK
      ?auto_130618 - BLOCK
      ?auto_130619 - BLOCK
    )
    :vars
    (
      ?auto_130620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130618 ) ( ON ?auto_130619 ?auto_130620 ) ( CLEAR ?auto_130619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130617 ) ( ON ?auto_130618 ?auto_130617 ) ( not ( = ?auto_130617 ?auto_130618 ) ) ( not ( = ?auto_130617 ?auto_130619 ) ) ( not ( = ?auto_130617 ?auto_130620 ) ) ( not ( = ?auto_130618 ?auto_130619 ) ) ( not ( = ?auto_130618 ?auto_130620 ) ) ( not ( = ?auto_130619 ?auto_130620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130619 ?auto_130620 )
      ( !STACK ?auto_130619 ?auto_130618 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130631 - BLOCK
      ?auto_130632 - BLOCK
      ?auto_130633 - BLOCK
    )
    :vars
    (
      ?auto_130634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130633 ?auto_130634 ) ( ON-TABLE ?auto_130631 ) ( not ( = ?auto_130631 ?auto_130632 ) ) ( not ( = ?auto_130631 ?auto_130633 ) ) ( not ( = ?auto_130631 ?auto_130634 ) ) ( not ( = ?auto_130632 ?auto_130633 ) ) ( not ( = ?auto_130632 ?auto_130634 ) ) ( not ( = ?auto_130633 ?auto_130634 ) ) ( CLEAR ?auto_130631 ) ( ON ?auto_130632 ?auto_130633 ) ( CLEAR ?auto_130632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130631 ?auto_130632 )
      ( MAKE-3PILE ?auto_130631 ?auto_130632 ?auto_130633 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130645 - BLOCK
      ?auto_130646 - BLOCK
      ?auto_130647 - BLOCK
    )
    :vars
    (
      ?auto_130648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130647 ?auto_130648 ) ( not ( = ?auto_130645 ?auto_130646 ) ) ( not ( = ?auto_130645 ?auto_130647 ) ) ( not ( = ?auto_130645 ?auto_130648 ) ) ( not ( = ?auto_130646 ?auto_130647 ) ) ( not ( = ?auto_130646 ?auto_130648 ) ) ( not ( = ?auto_130647 ?auto_130648 ) ) ( ON ?auto_130646 ?auto_130647 ) ( ON ?auto_130645 ?auto_130646 ) ( CLEAR ?auto_130645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130645 )
      ( MAKE-3PILE ?auto_130645 ?auto_130646 ?auto_130647 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130660 - BLOCK
      ?auto_130661 - BLOCK
      ?auto_130662 - BLOCK
      ?auto_130663 - BLOCK
    )
    :vars
    (
      ?auto_130664 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130662 ) ( ON ?auto_130663 ?auto_130664 ) ( CLEAR ?auto_130663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130660 ) ( ON ?auto_130661 ?auto_130660 ) ( ON ?auto_130662 ?auto_130661 ) ( not ( = ?auto_130660 ?auto_130661 ) ) ( not ( = ?auto_130660 ?auto_130662 ) ) ( not ( = ?auto_130660 ?auto_130663 ) ) ( not ( = ?auto_130660 ?auto_130664 ) ) ( not ( = ?auto_130661 ?auto_130662 ) ) ( not ( = ?auto_130661 ?auto_130663 ) ) ( not ( = ?auto_130661 ?auto_130664 ) ) ( not ( = ?auto_130662 ?auto_130663 ) ) ( not ( = ?auto_130662 ?auto_130664 ) ) ( not ( = ?auto_130663 ?auto_130664 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130663 ?auto_130664 )
      ( !STACK ?auto_130663 ?auto_130662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130678 - BLOCK
      ?auto_130679 - BLOCK
      ?auto_130680 - BLOCK
      ?auto_130681 - BLOCK
    )
    :vars
    (
      ?auto_130682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130681 ?auto_130682 ) ( ON-TABLE ?auto_130678 ) ( ON ?auto_130679 ?auto_130678 ) ( not ( = ?auto_130678 ?auto_130679 ) ) ( not ( = ?auto_130678 ?auto_130680 ) ) ( not ( = ?auto_130678 ?auto_130681 ) ) ( not ( = ?auto_130678 ?auto_130682 ) ) ( not ( = ?auto_130679 ?auto_130680 ) ) ( not ( = ?auto_130679 ?auto_130681 ) ) ( not ( = ?auto_130679 ?auto_130682 ) ) ( not ( = ?auto_130680 ?auto_130681 ) ) ( not ( = ?auto_130680 ?auto_130682 ) ) ( not ( = ?auto_130681 ?auto_130682 ) ) ( CLEAR ?auto_130679 ) ( ON ?auto_130680 ?auto_130681 ) ( CLEAR ?auto_130680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130678 ?auto_130679 ?auto_130680 )
      ( MAKE-4PILE ?auto_130678 ?auto_130679 ?auto_130680 ?auto_130681 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130696 - BLOCK
      ?auto_130697 - BLOCK
      ?auto_130698 - BLOCK
      ?auto_130699 - BLOCK
    )
    :vars
    (
      ?auto_130700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130699 ?auto_130700 ) ( ON-TABLE ?auto_130696 ) ( not ( = ?auto_130696 ?auto_130697 ) ) ( not ( = ?auto_130696 ?auto_130698 ) ) ( not ( = ?auto_130696 ?auto_130699 ) ) ( not ( = ?auto_130696 ?auto_130700 ) ) ( not ( = ?auto_130697 ?auto_130698 ) ) ( not ( = ?auto_130697 ?auto_130699 ) ) ( not ( = ?auto_130697 ?auto_130700 ) ) ( not ( = ?auto_130698 ?auto_130699 ) ) ( not ( = ?auto_130698 ?auto_130700 ) ) ( not ( = ?auto_130699 ?auto_130700 ) ) ( ON ?auto_130698 ?auto_130699 ) ( CLEAR ?auto_130696 ) ( ON ?auto_130697 ?auto_130698 ) ( CLEAR ?auto_130697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130696 ?auto_130697 )
      ( MAKE-4PILE ?auto_130696 ?auto_130697 ?auto_130698 ?auto_130699 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130714 - BLOCK
      ?auto_130715 - BLOCK
      ?auto_130716 - BLOCK
      ?auto_130717 - BLOCK
    )
    :vars
    (
      ?auto_130718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130717 ?auto_130718 ) ( not ( = ?auto_130714 ?auto_130715 ) ) ( not ( = ?auto_130714 ?auto_130716 ) ) ( not ( = ?auto_130714 ?auto_130717 ) ) ( not ( = ?auto_130714 ?auto_130718 ) ) ( not ( = ?auto_130715 ?auto_130716 ) ) ( not ( = ?auto_130715 ?auto_130717 ) ) ( not ( = ?auto_130715 ?auto_130718 ) ) ( not ( = ?auto_130716 ?auto_130717 ) ) ( not ( = ?auto_130716 ?auto_130718 ) ) ( not ( = ?auto_130717 ?auto_130718 ) ) ( ON ?auto_130716 ?auto_130717 ) ( ON ?auto_130715 ?auto_130716 ) ( ON ?auto_130714 ?auto_130715 ) ( CLEAR ?auto_130714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130714 )
      ( MAKE-4PILE ?auto_130714 ?auto_130715 ?auto_130716 ?auto_130717 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130733 - BLOCK
      ?auto_130734 - BLOCK
      ?auto_130735 - BLOCK
      ?auto_130736 - BLOCK
      ?auto_130737 - BLOCK
    )
    :vars
    (
      ?auto_130738 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130736 ) ( ON ?auto_130737 ?auto_130738 ) ( CLEAR ?auto_130737 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130733 ) ( ON ?auto_130734 ?auto_130733 ) ( ON ?auto_130735 ?auto_130734 ) ( ON ?auto_130736 ?auto_130735 ) ( not ( = ?auto_130733 ?auto_130734 ) ) ( not ( = ?auto_130733 ?auto_130735 ) ) ( not ( = ?auto_130733 ?auto_130736 ) ) ( not ( = ?auto_130733 ?auto_130737 ) ) ( not ( = ?auto_130733 ?auto_130738 ) ) ( not ( = ?auto_130734 ?auto_130735 ) ) ( not ( = ?auto_130734 ?auto_130736 ) ) ( not ( = ?auto_130734 ?auto_130737 ) ) ( not ( = ?auto_130734 ?auto_130738 ) ) ( not ( = ?auto_130735 ?auto_130736 ) ) ( not ( = ?auto_130735 ?auto_130737 ) ) ( not ( = ?auto_130735 ?auto_130738 ) ) ( not ( = ?auto_130736 ?auto_130737 ) ) ( not ( = ?auto_130736 ?auto_130738 ) ) ( not ( = ?auto_130737 ?auto_130738 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130737 ?auto_130738 )
      ( !STACK ?auto_130737 ?auto_130736 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130755 - BLOCK
      ?auto_130756 - BLOCK
      ?auto_130757 - BLOCK
      ?auto_130758 - BLOCK
      ?auto_130759 - BLOCK
    )
    :vars
    (
      ?auto_130760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130759 ?auto_130760 ) ( ON-TABLE ?auto_130755 ) ( ON ?auto_130756 ?auto_130755 ) ( ON ?auto_130757 ?auto_130756 ) ( not ( = ?auto_130755 ?auto_130756 ) ) ( not ( = ?auto_130755 ?auto_130757 ) ) ( not ( = ?auto_130755 ?auto_130758 ) ) ( not ( = ?auto_130755 ?auto_130759 ) ) ( not ( = ?auto_130755 ?auto_130760 ) ) ( not ( = ?auto_130756 ?auto_130757 ) ) ( not ( = ?auto_130756 ?auto_130758 ) ) ( not ( = ?auto_130756 ?auto_130759 ) ) ( not ( = ?auto_130756 ?auto_130760 ) ) ( not ( = ?auto_130757 ?auto_130758 ) ) ( not ( = ?auto_130757 ?auto_130759 ) ) ( not ( = ?auto_130757 ?auto_130760 ) ) ( not ( = ?auto_130758 ?auto_130759 ) ) ( not ( = ?auto_130758 ?auto_130760 ) ) ( not ( = ?auto_130759 ?auto_130760 ) ) ( CLEAR ?auto_130757 ) ( ON ?auto_130758 ?auto_130759 ) ( CLEAR ?auto_130758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130755 ?auto_130756 ?auto_130757 ?auto_130758 )
      ( MAKE-5PILE ?auto_130755 ?auto_130756 ?auto_130757 ?auto_130758 ?auto_130759 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130777 - BLOCK
      ?auto_130778 - BLOCK
      ?auto_130779 - BLOCK
      ?auto_130780 - BLOCK
      ?auto_130781 - BLOCK
    )
    :vars
    (
      ?auto_130782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130781 ?auto_130782 ) ( ON-TABLE ?auto_130777 ) ( ON ?auto_130778 ?auto_130777 ) ( not ( = ?auto_130777 ?auto_130778 ) ) ( not ( = ?auto_130777 ?auto_130779 ) ) ( not ( = ?auto_130777 ?auto_130780 ) ) ( not ( = ?auto_130777 ?auto_130781 ) ) ( not ( = ?auto_130777 ?auto_130782 ) ) ( not ( = ?auto_130778 ?auto_130779 ) ) ( not ( = ?auto_130778 ?auto_130780 ) ) ( not ( = ?auto_130778 ?auto_130781 ) ) ( not ( = ?auto_130778 ?auto_130782 ) ) ( not ( = ?auto_130779 ?auto_130780 ) ) ( not ( = ?auto_130779 ?auto_130781 ) ) ( not ( = ?auto_130779 ?auto_130782 ) ) ( not ( = ?auto_130780 ?auto_130781 ) ) ( not ( = ?auto_130780 ?auto_130782 ) ) ( not ( = ?auto_130781 ?auto_130782 ) ) ( ON ?auto_130780 ?auto_130781 ) ( CLEAR ?auto_130778 ) ( ON ?auto_130779 ?auto_130780 ) ( CLEAR ?auto_130779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130777 ?auto_130778 ?auto_130779 )
      ( MAKE-5PILE ?auto_130777 ?auto_130778 ?auto_130779 ?auto_130780 ?auto_130781 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130799 - BLOCK
      ?auto_130800 - BLOCK
      ?auto_130801 - BLOCK
      ?auto_130802 - BLOCK
      ?auto_130803 - BLOCK
    )
    :vars
    (
      ?auto_130804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130803 ?auto_130804 ) ( ON-TABLE ?auto_130799 ) ( not ( = ?auto_130799 ?auto_130800 ) ) ( not ( = ?auto_130799 ?auto_130801 ) ) ( not ( = ?auto_130799 ?auto_130802 ) ) ( not ( = ?auto_130799 ?auto_130803 ) ) ( not ( = ?auto_130799 ?auto_130804 ) ) ( not ( = ?auto_130800 ?auto_130801 ) ) ( not ( = ?auto_130800 ?auto_130802 ) ) ( not ( = ?auto_130800 ?auto_130803 ) ) ( not ( = ?auto_130800 ?auto_130804 ) ) ( not ( = ?auto_130801 ?auto_130802 ) ) ( not ( = ?auto_130801 ?auto_130803 ) ) ( not ( = ?auto_130801 ?auto_130804 ) ) ( not ( = ?auto_130802 ?auto_130803 ) ) ( not ( = ?auto_130802 ?auto_130804 ) ) ( not ( = ?auto_130803 ?auto_130804 ) ) ( ON ?auto_130802 ?auto_130803 ) ( ON ?auto_130801 ?auto_130802 ) ( CLEAR ?auto_130799 ) ( ON ?auto_130800 ?auto_130801 ) ( CLEAR ?auto_130800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130799 ?auto_130800 )
      ( MAKE-5PILE ?auto_130799 ?auto_130800 ?auto_130801 ?auto_130802 ?auto_130803 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130821 - BLOCK
      ?auto_130822 - BLOCK
      ?auto_130823 - BLOCK
      ?auto_130824 - BLOCK
      ?auto_130825 - BLOCK
    )
    :vars
    (
      ?auto_130826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130825 ?auto_130826 ) ( not ( = ?auto_130821 ?auto_130822 ) ) ( not ( = ?auto_130821 ?auto_130823 ) ) ( not ( = ?auto_130821 ?auto_130824 ) ) ( not ( = ?auto_130821 ?auto_130825 ) ) ( not ( = ?auto_130821 ?auto_130826 ) ) ( not ( = ?auto_130822 ?auto_130823 ) ) ( not ( = ?auto_130822 ?auto_130824 ) ) ( not ( = ?auto_130822 ?auto_130825 ) ) ( not ( = ?auto_130822 ?auto_130826 ) ) ( not ( = ?auto_130823 ?auto_130824 ) ) ( not ( = ?auto_130823 ?auto_130825 ) ) ( not ( = ?auto_130823 ?auto_130826 ) ) ( not ( = ?auto_130824 ?auto_130825 ) ) ( not ( = ?auto_130824 ?auto_130826 ) ) ( not ( = ?auto_130825 ?auto_130826 ) ) ( ON ?auto_130824 ?auto_130825 ) ( ON ?auto_130823 ?auto_130824 ) ( ON ?auto_130822 ?auto_130823 ) ( ON ?auto_130821 ?auto_130822 ) ( CLEAR ?auto_130821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130821 )
      ( MAKE-5PILE ?auto_130821 ?auto_130822 ?auto_130823 ?auto_130824 ?auto_130825 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130844 - BLOCK
      ?auto_130845 - BLOCK
      ?auto_130846 - BLOCK
      ?auto_130847 - BLOCK
      ?auto_130848 - BLOCK
      ?auto_130849 - BLOCK
    )
    :vars
    (
      ?auto_130850 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130848 ) ( ON ?auto_130849 ?auto_130850 ) ( CLEAR ?auto_130849 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130844 ) ( ON ?auto_130845 ?auto_130844 ) ( ON ?auto_130846 ?auto_130845 ) ( ON ?auto_130847 ?auto_130846 ) ( ON ?auto_130848 ?auto_130847 ) ( not ( = ?auto_130844 ?auto_130845 ) ) ( not ( = ?auto_130844 ?auto_130846 ) ) ( not ( = ?auto_130844 ?auto_130847 ) ) ( not ( = ?auto_130844 ?auto_130848 ) ) ( not ( = ?auto_130844 ?auto_130849 ) ) ( not ( = ?auto_130844 ?auto_130850 ) ) ( not ( = ?auto_130845 ?auto_130846 ) ) ( not ( = ?auto_130845 ?auto_130847 ) ) ( not ( = ?auto_130845 ?auto_130848 ) ) ( not ( = ?auto_130845 ?auto_130849 ) ) ( not ( = ?auto_130845 ?auto_130850 ) ) ( not ( = ?auto_130846 ?auto_130847 ) ) ( not ( = ?auto_130846 ?auto_130848 ) ) ( not ( = ?auto_130846 ?auto_130849 ) ) ( not ( = ?auto_130846 ?auto_130850 ) ) ( not ( = ?auto_130847 ?auto_130848 ) ) ( not ( = ?auto_130847 ?auto_130849 ) ) ( not ( = ?auto_130847 ?auto_130850 ) ) ( not ( = ?auto_130848 ?auto_130849 ) ) ( not ( = ?auto_130848 ?auto_130850 ) ) ( not ( = ?auto_130849 ?auto_130850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130849 ?auto_130850 )
      ( !STACK ?auto_130849 ?auto_130848 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130870 - BLOCK
      ?auto_130871 - BLOCK
      ?auto_130872 - BLOCK
      ?auto_130873 - BLOCK
      ?auto_130874 - BLOCK
      ?auto_130875 - BLOCK
    )
    :vars
    (
      ?auto_130876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130875 ?auto_130876 ) ( ON-TABLE ?auto_130870 ) ( ON ?auto_130871 ?auto_130870 ) ( ON ?auto_130872 ?auto_130871 ) ( ON ?auto_130873 ?auto_130872 ) ( not ( = ?auto_130870 ?auto_130871 ) ) ( not ( = ?auto_130870 ?auto_130872 ) ) ( not ( = ?auto_130870 ?auto_130873 ) ) ( not ( = ?auto_130870 ?auto_130874 ) ) ( not ( = ?auto_130870 ?auto_130875 ) ) ( not ( = ?auto_130870 ?auto_130876 ) ) ( not ( = ?auto_130871 ?auto_130872 ) ) ( not ( = ?auto_130871 ?auto_130873 ) ) ( not ( = ?auto_130871 ?auto_130874 ) ) ( not ( = ?auto_130871 ?auto_130875 ) ) ( not ( = ?auto_130871 ?auto_130876 ) ) ( not ( = ?auto_130872 ?auto_130873 ) ) ( not ( = ?auto_130872 ?auto_130874 ) ) ( not ( = ?auto_130872 ?auto_130875 ) ) ( not ( = ?auto_130872 ?auto_130876 ) ) ( not ( = ?auto_130873 ?auto_130874 ) ) ( not ( = ?auto_130873 ?auto_130875 ) ) ( not ( = ?auto_130873 ?auto_130876 ) ) ( not ( = ?auto_130874 ?auto_130875 ) ) ( not ( = ?auto_130874 ?auto_130876 ) ) ( not ( = ?auto_130875 ?auto_130876 ) ) ( CLEAR ?auto_130873 ) ( ON ?auto_130874 ?auto_130875 ) ( CLEAR ?auto_130874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130870 ?auto_130871 ?auto_130872 ?auto_130873 ?auto_130874 )
      ( MAKE-6PILE ?auto_130870 ?auto_130871 ?auto_130872 ?auto_130873 ?auto_130874 ?auto_130875 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130896 - BLOCK
      ?auto_130897 - BLOCK
      ?auto_130898 - BLOCK
      ?auto_130899 - BLOCK
      ?auto_130900 - BLOCK
      ?auto_130901 - BLOCK
    )
    :vars
    (
      ?auto_130902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130901 ?auto_130902 ) ( ON-TABLE ?auto_130896 ) ( ON ?auto_130897 ?auto_130896 ) ( ON ?auto_130898 ?auto_130897 ) ( not ( = ?auto_130896 ?auto_130897 ) ) ( not ( = ?auto_130896 ?auto_130898 ) ) ( not ( = ?auto_130896 ?auto_130899 ) ) ( not ( = ?auto_130896 ?auto_130900 ) ) ( not ( = ?auto_130896 ?auto_130901 ) ) ( not ( = ?auto_130896 ?auto_130902 ) ) ( not ( = ?auto_130897 ?auto_130898 ) ) ( not ( = ?auto_130897 ?auto_130899 ) ) ( not ( = ?auto_130897 ?auto_130900 ) ) ( not ( = ?auto_130897 ?auto_130901 ) ) ( not ( = ?auto_130897 ?auto_130902 ) ) ( not ( = ?auto_130898 ?auto_130899 ) ) ( not ( = ?auto_130898 ?auto_130900 ) ) ( not ( = ?auto_130898 ?auto_130901 ) ) ( not ( = ?auto_130898 ?auto_130902 ) ) ( not ( = ?auto_130899 ?auto_130900 ) ) ( not ( = ?auto_130899 ?auto_130901 ) ) ( not ( = ?auto_130899 ?auto_130902 ) ) ( not ( = ?auto_130900 ?auto_130901 ) ) ( not ( = ?auto_130900 ?auto_130902 ) ) ( not ( = ?auto_130901 ?auto_130902 ) ) ( ON ?auto_130900 ?auto_130901 ) ( CLEAR ?auto_130898 ) ( ON ?auto_130899 ?auto_130900 ) ( CLEAR ?auto_130899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130896 ?auto_130897 ?auto_130898 ?auto_130899 )
      ( MAKE-6PILE ?auto_130896 ?auto_130897 ?auto_130898 ?auto_130899 ?auto_130900 ?auto_130901 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130922 - BLOCK
      ?auto_130923 - BLOCK
      ?auto_130924 - BLOCK
      ?auto_130925 - BLOCK
      ?auto_130926 - BLOCK
      ?auto_130927 - BLOCK
    )
    :vars
    (
      ?auto_130928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130927 ?auto_130928 ) ( ON-TABLE ?auto_130922 ) ( ON ?auto_130923 ?auto_130922 ) ( not ( = ?auto_130922 ?auto_130923 ) ) ( not ( = ?auto_130922 ?auto_130924 ) ) ( not ( = ?auto_130922 ?auto_130925 ) ) ( not ( = ?auto_130922 ?auto_130926 ) ) ( not ( = ?auto_130922 ?auto_130927 ) ) ( not ( = ?auto_130922 ?auto_130928 ) ) ( not ( = ?auto_130923 ?auto_130924 ) ) ( not ( = ?auto_130923 ?auto_130925 ) ) ( not ( = ?auto_130923 ?auto_130926 ) ) ( not ( = ?auto_130923 ?auto_130927 ) ) ( not ( = ?auto_130923 ?auto_130928 ) ) ( not ( = ?auto_130924 ?auto_130925 ) ) ( not ( = ?auto_130924 ?auto_130926 ) ) ( not ( = ?auto_130924 ?auto_130927 ) ) ( not ( = ?auto_130924 ?auto_130928 ) ) ( not ( = ?auto_130925 ?auto_130926 ) ) ( not ( = ?auto_130925 ?auto_130927 ) ) ( not ( = ?auto_130925 ?auto_130928 ) ) ( not ( = ?auto_130926 ?auto_130927 ) ) ( not ( = ?auto_130926 ?auto_130928 ) ) ( not ( = ?auto_130927 ?auto_130928 ) ) ( ON ?auto_130926 ?auto_130927 ) ( ON ?auto_130925 ?auto_130926 ) ( CLEAR ?auto_130923 ) ( ON ?auto_130924 ?auto_130925 ) ( CLEAR ?auto_130924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130922 ?auto_130923 ?auto_130924 )
      ( MAKE-6PILE ?auto_130922 ?auto_130923 ?auto_130924 ?auto_130925 ?auto_130926 ?auto_130927 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130948 - BLOCK
      ?auto_130949 - BLOCK
      ?auto_130950 - BLOCK
      ?auto_130951 - BLOCK
      ?auto_130952 - BLOCK
      ?auto_130953 - BLOCK
    )
    :vars
    (
      ?auto_130954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130953 ?auto_130954 ) ( ON-TABLE ?auto_130948 ) ( not ( = ?auto_130948 ?auto_130949 ) ) ( not ( = ?auto_130948 ?auto_130950 ) ) ( not ( = ?auto_130948 ?auto_130951 ) ) ( not ( = ?auto_130948 ?auto_130952 ) ) ( not ( = ?auto_130948 ?auto_130953 ) ) ( not ( = ?auto_130948 ?auto_130954 ) ) ( not ( = ?auto_130949 ?auto_130950 ) ) ( not ( = ?auto_130949 ?auto_130951 ) ) ( not ( = ?auto_130949 ?auto_130952 ) ) ( not ( = ?auto_130949 ?auto_130953 ) ) ( not ( = ?auto_130949 ?auto_130954 ) ) ( not ( = ?auto_130950 ?auto_130951 ) ) ( not ( = ?auto_130950 ?auto_130952 ) ) ( not ( = ?auto_130950 ?auto_130953 ) ) ( not ( = ?auto_130950 ?auto_130954 ) ) ( not ( = ?auto_130951 ?auto_130952 ) ) ( not ( = ?auto_130951 ?auto_130953 ) ) ( not ( = ?auto_130951 ?auto_130954 ) ) ( not ( = ?auto_130952 ?auto_130953 ) ) ( not ( = ?auto_130952 ?auto_130954 ) ) ( not ( = ?auto_130953 ?auto_130954 ) ) ( ON ?auto_130952 ?auto_130953 ) ( ON ?auto_130951 ?auto_130952 ) ( ON ?auto_130950 ?auto_130951 ) ( CLEAR ?auto_130948 ) ( ON ?auto_130949 ?auto_130950 ) ( CLEAR ?auto_130949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130948 ?auto_130949 )
      ( MAKE-6PILE ?auto_130948 ?auto_130949 ?auto_130950 ?auto_130951 ?auto_130952 ?auto_130953 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130974 - BLOCK
      ?auto_130975 - BLOCK
      ?auto_130976 - BLOCK
      ?auto_130977 - BLOCK
      ?auto_130978 - BLOCK
      ?auto_130979 - BLOCK
    )
    :vars
    (
      ?auto_130980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130979 ?auto_130980 ) ( not ( = ?auto_130974 ?auto_130975 ) ) ( not ( = ?auto_130974 ?auto_130976 ) ) ( not ( = ?auto_130974 ?auto_130977 ) ) ( not ( = ?auto_130974 ?auto_130978 ) ) ( not ( = ?auto_130974 ?auto_130979 ) ) ( not ( = ?auto_130974 ?auto_130980 ) ) ( not ( = ?auto_130975 ?auto_130976 ) ) ( not ( = ?auto_130975 ?auto_130977 ) ) ( not ( = ?auto_130975 ?auto_130978 ) ) ( not ( = ?auto_130975 ?auto_130979 ) ) ( not ( = ?auto_130975 ?auto_130980 ) ) ( not ( = ?auto_130976 ?auto_130977 ) ) ( not ( = ?auto_130976 ?auto_130978 ) ) ( not ( = ?auto_130976 ?auto_130979 ) ) ( not ( = ?auto_130976 ?auto_130980 ) ) ( not ( = ?auto_130977 ?auto_130978 ) ) ( not ( = ?auto_130977 ?auto_130979 ) ) ( not ( = ?auto_130977 ?auto_130980 ) ) ( not ( = ?auto_130978 ?auto_130979 ) ) ( not ( = ?auto_130978 ?auto_130980 ) ) ( not ( = ?auto_130979 ?auto_130980 ) ) ( ON ?auto_130978 ?auto_130979 ) ( ON ?auto_130977 ?auto_130978 ) ( ON ?auto_130976 ?auto_130977 ) ( ON ?auto_130975 ?auto_130976 ) ( ON ?auto_130974 ?auto_130975 ) ( CLEAR ?auto_130974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130974 )
      ( MAKE-6PILE ?auto_130974 ?auto_130975 ?auto_130976 ?auto_130977 ?auto_130978 ?auto_130979 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131001 - BLOCK
      ?auto_131002 - BLOCK
      ?auto_131003 - BLOCK
      ?auto_131004 - BLOCK
      ?auto_131005 - BLOCK
      ?auto_131006 - BLOCK
      ?auto_131007 - BLOCK
    )
    :vars
    (
      ?auto_131008 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_131006 ) ( ON ?auto_131007 ?auto_131008 ) ( CLEAR ?auto_131007 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131001 ) ( ON ?auto_131002 ?auto_131001 ) ( ON ?auto_131003 ?auto_131002 ) ( ON ?auto_131004 ?auto_131003 ) ( ON ?auto_131005 ?auto_131004 ) ( ON ?auto_131006 ?auto_131005 ) ( not ( = ?auto_131001 ?auto_131002 ) ) ( not ( = ?auto_131001 ?auto_131003 ) ) ( not ( = ?auto_131001 ?auto_131004 ) ) ( not ( = ?auto_131001 ?auto_131005 ) ) ( not ( = ?auto_131001 ?auto_131006 ) ) ( not ( = ?auto_131001 ?auto_131007 ) ) ( not ( = ?auto_131001 ?auto_131008 ) ) ( not ( = ?auto_131002 ?auto_131003 ) ) ( not ( = ?auto_131002 ?auto_131004 ) ) ( not ( = ?auto_131002 ?auto_131005 ) ) ( not ( = ?auto_131002 ?auto_131006 ) ) ( not ( = ?auto_131002 ?auto_131007 ) ) ( not ( = ?auto_131002 ?auto_131008 ) ) ( not ( = ?auto_131003 ?auto_131004 ) ) ( not ( = ?auto_131003 ?auto_131005 ) ) ( not ( = ?auto_131003 ?auto_131006 ) ) ( not ( = ?auto_131003 ?auto_131007 ) ) ( not ( = ?auto_131003 ?auto_131008 ) ) ( not ( = ?auto_131004 ?auto_131005 ) ) ( not ( = ?auto_131004 ?auto_131006 ) ) ( not ( = ?auto_131004 ?auto_131007 ) ) ( not ( = ?auto_131004 ?auto_131008 ) ) ( not ( = ?auto_131005 ?auto_131006 ) ) ( not ( = ?auto_131005 ?auto_131007 ) ) ( not ( = ?auto_131005 ?auto_131008 ) ) ( not ( = ?auto_131006 ?auto_131007 ) ) ( not ( = ?auto_131006 ?auto_131008 ) ) ( not ( = ?auto_131007 ?auto_131008 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131007 ?auto_131008 )
      ( !STACK ?auto_131007 ?auto_131006 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131031 - BLOCK
      ?auto_131032 - BLOCK
      ?auto_131033 - BLOCK
      ?auto_131034 - BLOCK
      ?auto_131035 - BLOCK
      ?auto_131036 - BLOCK
      ?auto_131037 - BLOCK
    )
    :vars
    (
      ?auto_131038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131037 ?auto_131038 ) ( ON-TABLE ?auto_131031 ) ( ON ?auto_131032 ?auto_131031 ) ( ON ?auto_131033 ?auto_131032 ) ( ON ?auto_131034 ?auto_131033 ) ( ON ?auto_131035 ?auto_131034 ) ( not ( = ?auto_131031 ?auto_131032 ) ) ( not ( = ?auto_131031 ?auto_131033 ) ) ( not ( = ?auto_131031 ?auto_131034 ) ) ( not ( = ?auto_131031 ?auto_131035 ) ) ( not ( = ?auto_131031 ?auto_131036 ) ) ( not ( = ?auto_131031 ?auto_131037 ) ) ( not ( = ?auto_131031 ?auto_131038 ) ) ( not ( = ?auto_131032 ?auto_131033 ) ) ( not ( = ?auto_131032 ?auto_131034 ) ) ( not ( = ?auto_131032 ?auto_131035 ) ) ( not ( = ?auto_131032 ?auto_131036 ) ) ( not ( = ?auto_131032 ?auto_131037 ) ) ( not ( = ?auto_131032 ?auto_131038 ) ) ( not ( = ?auto_131033 ?auto_131034 ) ) ( not ( = ?auto_131033 ?auto_131035 ) ) ( not ( = ?auto_131033 ?auto_131036 ) ) ( not ( = ?auto_131033 ?auto_131037 ) ) ( not ( = ?auto_131033 ?auto_131038 ) ) ( not ( = ?auto_131034 ?auto_131035 ) ) ( not ( = ?auto_131034 ?auto_131036 ) ) ( not ( = ?auto_131034 ?auto_131037 ) ) ( not ( = ?auto_131034 ?auto_131038 ) ) ( not ( = ?auto_131035 ?auto_131036 ) ) ( not ( = ?auto_131035 ?auto_131037 ) ) ( not ( = ?auto_131035 ?auto_131038 ) ) ( not ( = ?auto_131036 ?auto_131037 ) ) ( not ( = ?auto_131036 ?auto_131038 ) ) ( not ( = ?auto_131037 ?auto_131038 ) ) ( CLEAR ?auto_131035 ) ( ON ?auto_131036 ?auto_131037 ) ( CLEAR ?auto_131036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131031 ?auto_131032 ?auto_131033 ?auto_131034 ?auto_131035 ?auto_131036 )
      ( MAKE-7PILE ?auto_131031 ?auto_131032 ?auto_131033 ?auto_131034 ?auto_131035 ?auto_131036 ?auto_131037 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131061 - BLOCK
      ?auto_131062 - BLOCK
      ?auto_131063 - BLOCK
      ?auto_131064 - BLOCK
      ?auto_131065 - BLOCK
      ?auto_131066 - BLOCK
      ?auto_131067 - BLOCK
    )
    :vars
    (
      ?auto_131068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131067 ?auto_131068 ) ( ON-TABLE ?auto_131061 ) ( ON ?auto_131062 ?auto_131061 ) ( ON ?auto_131063 ?auto_131062 ) ( ON ?auto_131064 ?auto_131063 ) ( not ( = ?auto_131061 ?auto_131062 ) ) ( not ( = ?auto_131061 ?auto_131063 ) ) ( not ( = ?auto_131061 ?auto_131064 ) ) ( not ( = ?auto_131061 ?auto_131065 ) ) ( not ( = ?auto_131061 ?auto_131066 ) ) ( not ( = ?auto_131061 ?auto_131067 ) ) ( not ( = ?auto_131061 ?auto_131068 ) ) ( not ( = ?auto_131062 ?auto_131063 ) ) ( not ( = ?auto_131062 ?auto_131064 ) ) ( not ( = ?auto_131062 ?auto_131065 ) ) ( not ( = ?auto_131062 ?auto_131066 ) ) ( not ( = ?auto_131062 ?auto_131067 ) ) ( not ( = ?auto_131062 ?auto_131068 ) ) ( not ( = ?auto_131063 ?auto_131064 ) ) ( not ( = ?auto_131063 ?auto_131065 ) ) ( not ( = ?auto_131063 ?auto_131066 ) ) ( not ( = ?auto_131063 ?auto_131067 ) ) ( not ( = ?auto_131063 ?auto_131068 ) ) ( not ( = ?auto_131064 ?auto_131065 ) ) ( not ( = ?auto_131064 ?auto_131066 ) ) ( not ( = ?auto_131064 ?auto_131067 ) ) ( not ( = ?auto_131064 ?auto_131068 ) ) ( not ( = ?auto_131065 ?auto_131066 ) ) ( not ( = ?auto_131065 ?auto_131067 ) ) ( not ( = ?auto_131065 ?auto_131068 ) ) ( not ( = ?auto_131066 ?auto_131067 ) ) ( not ( = ?auto_131066 ?auto_131068 ) ) ( not ( = ?auto_131067 ?auto_131068 ) ) ( ON ?auto_131066 ?auto_131067 ) ( CLEAR ?auto_131064 ) ( ON ?auto_131065 ?auto_131066 ) ( CLEAR ?auto_131065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131061 ?auto_131062 ?auto_131063 ?auto_131064 ?auto_131065 )
      ( MAKE-7PILE ?auto_131061 ?auto_131062 ?auto_131063 ?auto_131064 ?auto_131065 ?auto_131066 ?auto_131067 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131091 - BLOCK
      ?auto_131092 - BLOCK
      ?auto_131093 - BLOCK
      ?auto_131094 - BLOCK
      ?auto_131095 - BLOCK
      ?auto_131096 - BLOCK
      ?auto_131097 - BLOCK
    )
    :vars
    (
      ?auto_131098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131097 ?auto_131098 ) ( ON-TABLE ?auto_131091 ) ( ON ?auto_131092 ?auto_131091 ) ( ON ?auto_131093 ?auto_131092 ) ( not ( = ?auto_131091 ?auto_131092 ) ) ( not ( = ?auto_131091 ?auto_131093 ) ) ( not ( = ?auto_131091 ?auto_131094 ) ) ( not ( = ?auto_131091 ?auto_131095 ) ) ( not ( = ?auto_131091 ?auto_131096 ) ) ( not ( = ?auto_131091 ?auto_131097 ) ) ( not ( = ?auto_131091 ?auto_131098 ) ) ( not ( = ?auto_131092 ?auto_131093 ) ) ( not ( = ?auto_131092 ?auto_131094 ) ) ( not ( = ?auto_131092 ?auto_131095 ) ) ( not ( = ?auto_131092 ?auto_131096 ) ) ( not ( = ?auto_131092 ?auto_131097 ) ) ( not ( = ?auto_131092 ?auto_131098 ) ) ( not ( = ?auto_131093 ?auto_131094 ) ) ( not ( = ?auto_131093 ?auto_131095 ) ) ( not ( = ?auto_131093 ?auto_131096 ) ) ( not ( = ?auto_131093 ?auto_131097 ) ) ( not ( = ?auto_131093 ?auto_131098 ) ) ( not ( = ?auto_131094 ?auto_131095 ) ) ( not ( = ?auto_131094 ?auto_131096 ) ) ( not ( = ?auto_131094 ?auto_131097 ) ) ( not ( = ?auto_131094 ?auto_131098 ) ) ( not ( = ?auto_131095 ?auto_131096 ) ) ( not ( = ?auto_131095 ?auto_131097 ) ) ( not ( = ?auto_131095 ?auto_131098 ) ) ( not ( = ?auto_131096 ?auto_131097 ) ) ( not ( = ?auto_131096 ?auto_131098 ) ) ( not ( = ?auto_131097 ?auto_131098 ) ) ( ON ?auto_131096 ?auto_131097 ) ( ON ?auto_131095 ?auto_131096 ) ( CLEAR ?auto_131093 ) ( ON ?auto_131094 ?auto_131095 ) ( CLEAR ?auto_131094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131091 ?auto_131092 ?auto_131093 ?auto_131094 )
      ( MAKE-7PILE ?auto_131091 ?auto_131092 ?auto_131093 ?auto_131094 ?auto_131095 ?auto_131096 ?auto_131097 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131121 - BLOCK
      ?auto_131122 - BLOCK
      ?auto_131123 - BLOCK
      ?auto_131124 - BLOCK
      ?auto_131125 - BLOCK
      ?auto_131126 - BLOCK
      ?auto_131127 - BLOCK
    )
    :vars
    (
      ?auto_131128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131127 ?auto_131128 ) ( ON-TABLE ?auto_131121 ) ( ON ?auto_131122 ?auto_131121 ) ( not ( = ?auto_131121 ?auto_131122 ) ) ( not ( = ?auto_131121 ?auto_131123 ) ) ( not ( = ?auto_131121 ?auto_131124 ) ) ( not ( = ?auto_131121 ?auto_131125 ) ) ( not ( = ?auto_131121 ?auto_131126 ) ) ( not ( = ?auto_131121 ?auto_131127 ) ) ( not ( = ?auto_131121 ?auto_131128 ) ) ( not ( = ?auto_131122 ?auto_131123 ) ) ( not ( = ?auto_131122 ?auto_131124 ) ) ( not ( = ?auto_131122 ?auto_131125 ) ) ( not ( = ?auto_131122 ?auto_131126 ) ) ( not ( = ?auto_131122 ?auto_131127 ) ) ( not ( = ?auto_131122 ?auto_131128 ) ) ( not ( = ?auto_131123 ?auto_131124 ) ) ( not ( = ?auto_131123 ?auto_131125 ) ) ( not ( = ?auto_131123 ?auto_131126 ) ) ( not ( = ?auto_131123 ?auto_131127 ) ) ( not ( = ?auto_131123 ?auto_131128 ) ) ( not ( = ?auto_131124 ?auto_131125 ) ) ( not ( = ?auto_131124 ?auto_131126 ) ) ( not ( = ?auto_131124 ?auto_131127 ) ) ( not ( = ?auto_131124 ?auto_131128 ) ) ( not ( = ?auto_131125 ?auto_131126 ) ) ( not ( = ?auto_131125 ?auto_131127 ) ) ( not ( = ?auto_131125 ?auto_131128 ) ) ( not ( = ?auto_131126 ?auto_131127 ) ) ( not ( = ?auto_131126 ?auto_131128 ) ) ( not ( = ?auto_131127 ?auto_131128 ) ) ( ON ?auto_131126 ?auto_131127 ) ( ON ?auto_131125 ?auto_131126 ) ( ON ?auto_131124 ?auto_131125 ) ( CLEAR ?auto_131122 ) ( ON ?auto_131123 ?auto_131124 ) ( CLEAR ?auto_131123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131121 ?auto_131122 ?auto_131123 )
      ( MAKE-7PILE ?auto_131121 ?auto_131122 ?auto_131123 ?auto_131124 ?auto_131125 ?auto_131126 ?auto_131127 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131151 - BLOCK
      ?auto_131152 - BLOCK
      ?auto_131153 - BLOCK
      ?auto_131154 - BLOCK
      ?auto_131155 - BLOCK
      ?auto_131156 - BLOCK
      ?auto_131157 - BLOCK
    )
    :vars
    (
      ?auto_131158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131157 ?auto_131158 ) ( ON-TABLE ?auto_131151 ) ( not ( = ?auto_131151 ?auto_131152 ) ) ( not ( = ?auto_131151 ?auto_131153 ) ) ( not ( = ?auto_131151 ?auto_131154 ) ) ( not ( = ?auto_131151 ?auto_131155 ) ) ( not ( = ?auto_131151 ?auto_131156 ) ) ( not ( = ?auto_131151 ?auto_131157 ) ) ( not ( = ?auto_131151 ?auto_131158 ) ) ( not ( = ?auto_131152 ?auto_131153 ) ) ( not ( = ?auto_131152 ?auto_131154 ) ) ( not ( = ?auto_131152 ?auto_131155 ) ) ( not ( = ?auto_131152 ?auto_131156 ) ) ( not ( = ?auto_131152 ?auto_131157 ) ) ( not ( = ?auto_131152 ?auto_131158 ) ) ( not ( = ?auto_131153 ?auto_131154 ) ) ( not ( = ?auto_131153 ?auto_131155 ) ) ( not ( = ?auto_131153 ?auto_131156 ) ) ( not ( = ?auto_131153 ?auto_131157 ) ) ( not ( = ?auto_131153 ?auto_131158 ) ) ( not ( = ?auto_131154 ?auto_131155 ) ) ( not ( = ?auto_131154 ?auto_131156 ) ) ( not ( = ?auto_131154 ?auto_131157 ) ) ( not ( = ?auto_131154 ?auto_131158 ) ) ( not ( = ?auto_131155 ?auto_131156 ) ) ( not ( = ?auto_131155 ?auto_131157 ) ) ( not ( = ?auto_131155 ?auto_131158 ) ) ( not ( = ?auto_131156 ?auto_131157 ) ) ( not ( = ?auto_131156 ?auto_131158 ) ) ( not ( = ?auto_131157 ?auto_131158 ) ) ( ON ?auto_131156 ?auto_131157 ) ( ON ?auto_131155 ?auto_131156 ) ( ON ?auto_131154 ?auto_131155 ) ( ON ?auto_131153 ?auto_131154 ) ( CLEAR ?auto_131151 ) ( ON ?auto_131152 ?auto_131153 ) ( CLEAR ?auto_131152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131151 ?auto_131152 )
      ( MAKE-7PILE ?auto_131151 ?auto_131152 ?auto_131153 ?auto_131154 ?auto_131155 ?auto_131156 ?auto_131157 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131181 - BLOCK
      ?auto_131182 - BLOCK
      ?auto_131183 - BLOCK
      ?auto_131184 - BLOCK
      ?auto_131185 - BLOCK
      ?auto_131186 - BLOCK
      ?auto_131187 - BLOCK
    )
    :vars
    (
      ?auto_131188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131187 ?auto_131188 ) ( not ( = ?auto_131181 ?auto_131182 ) ) ( not ( = ?auto_131181 ?auto_131183 ) ) ( not ( = ?auto_131181 ?auto_131184 ) ) ( not ( = ?auto_131181 ?auto_131185 ) ) ( not ( = ?auto_131181 ?auto_131186 ) ) ( not ( = ?auto_131181 ?auto_131187 ) ) ( not ( = ?auto_131181 ?auto_131188 ) ) ( not ( = ?auto_131182 ?auto_131183 ) ) ( not ( = ?auto_131182 ?auto_131184 ) ) ( not ( = ?auto_131182 ?auto_131185 ) ) ( not ( = ?auto_131182 ?auto_131186 ) ) ( not ( = ?auto_131182 ?auto_131187 ) ) ( not ( = ?auto_131182 ?auto_131188 ) ) ( not ( = ?auto_131183 ?auto_131184 ) ) ( not ( = ?auto_131183 ?auto_131185 ) ) ( not ( = ?auto_131183 ?auto_131186 ) ) ( not ( = ?auto_131183 ?auto_131187 ) ) ( not ( = ?auto_131183 ?auto_131188 ) ) ( not ( = ?auto_131184 ?auto_131185 ) ) ( not ( = ?auto_131184 ?auto_131186 ) ) ( not ( = ?auto_131184 ?auto_131187 ) ) ( not ( = ?auto_131184 ?auto_131188 ) ) ( not ( = ?auto_131185 ?auto_131186 ) ) ( not ( = ?auto_131185 ?auto_131187 ) ) ( not ( = ?auto_131185 ?auto_131188 ) ) ( not ( = ?auto_131186 ?auto_131187 ) ) ( not ( = ?auto_131186 ?auto_131188 ) ) ( not ( = ?auto_131187 ?auto_131188 ) ) ( ON ?auto_131186 ?auto_131187 ) ( ON ?auto_131185 ?auto_131186 ) ( ON ?auto_131184 ?auto_131185 ) ( ON ?auto_131183 ?auto_131184 ) ( ON ?auto_131182 ?auto_131183 ) ( ON ?auto_131181 ?auto_131182 ) ( CLEAR ?auto_131181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131181 )
      ( MAKE-7PILE ?auto_131181 ?auto_131182 ?auto_131183 ?auto_131184 ?auto_131185 ?auto_131186 ?auto_131187 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131212 - BLOCK
      ?auto_131213 - BLOCK
      ?auto_131214 - BLOCK
      ?auto_131215 - BLOCK
      ?auto_131216 - BLOCK
      ?auto_131217 - BLOCK
      ?auto_131218 - BLOCK
      ?auto_131219 - BLOCK
    )
    :vars
    (
      ?auto_131220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_131218 ) ( ON ?auto_131219 ?auto_131220 ) ( CLEAR ?auto_131219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131212 ) ( ON ?auto_131213 ?auto_131212 ) ( ON ?auto_131214 ?auto_131213 ) ( ON ?auto_131215 ?auto_131214 ) ( ON ?auto_131216 ?auto_131215 ) ( ON ?auto_131217 ?auto_131216 ) ( ON ?auto_131218 ?auto_131217 ) ( not ( = ?auto_131212 ?auto_131213 ) ) ( not ( = ?auto_131212 ?auto_131214 ) ) ( not ( = ?auto_131212 ?auto_131215 ) ) ( not ( = ?auto_131212 ?auto_131216 ) ) ( not ( = ?auto_131212 ?auto_131217 ) ) ( not ( = ?auto_131212 ?auto_131218 ) ) ( not ( = ?auto_131212 ?auto_131219 ) ) ( not ( = ?auto_131212 ?auto_131220 ) ) ( not ( = ?auto_131213 ?auto_131214 ) ) ( not ( = ?auto_131213 ?auto_131215 ) ) ( not ( = ?auto_131213 ?auto_131216 ) ) ( not ( = ?auto_131213 ?auto_131217 ) ) ( not ( = ?auto_131213 ?auto_131218 ) ) ( not ( = ?auto_131213 ?auto_131219 ) ) ( not ( = ?auto_131213 ?auto_131220 ) ) ( not ( = ?auto_131214 ?auto_131215 ) ) ( not ( = ?auto_131214 ?auto_131216 ) ) ( not ( = ?auto_131214 ?auto_131217 ) ) ( not ( = ?auto_131214 ?auto_131218 ) ) ( not ( = ?auto_131214 ?auto_131219 ) ) ( not ( = ?auto_131214 ?auto_131220 ) ) ( not ( = ?auto_131215 ?auto_131216 ) ) ( not ( = ?auto_131215 ?auto_131217 ) ) ( not ( = ?auto_131215 ?auto_131218 ) ) ( not ( = ?auto_131215 ?auto_131219 ) ) ( not ( = ?auto_131215 ?auto_131220 ) ) ( not ( = ?auto_131216 ?auto_131217 ) ) ( not ( = ?auto_131216 ?auto_131218 ) ) ( not ( = ?auto_131216 ?auto_131219 ) ) ( not ( = ?auto_131216 ?auto_131220 ) ) ( not ( = ?auto_131217 ?auto_131218 ) ) ( not ( = ?auto_131217 ?auto_131219 ) ) ( not ( = ?auto_131217 ?auto_131220 ) ) ( not ( = ?auto_131218 ?auto_131219 ) ) ( not ( = ?auto_131218 ?auto_131220 ) ) ( not ( = ?auto_131219 ?auto_131220 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131219 ?auto_131220 )
      ( !STACK ?auto_131219 ?auto_131218 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131246 - BLOCK
      ?auto_131247 - BLOCK
      ?auto_131248 - BLOCK
      ?auto_131249 - BLOCK
      ?auto_131250 - BLOCK
      ?auto_131251 - BLOCK
      ?auto_131252 - BLOCK
      ?auto_131253 - BLOCK
    )
    :vars
    (
      ?auto_131254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131253 ?auto_131254 ) ( ON-TABLE ?auto_131246 ) ( ON ?auto_131247 ?auto_131246 ) ( ON ?auto_131248 ?auto_131247 ) ( ON ?auto_131249 ?auto_131248 ) ( ON ?auto_131250 ?auto_131249 ) ( ON ?auto_131251 ?auto_131250 ) ( not ( = ?auto_131246 ?auto_131247 ) ) ( not ( = ?auto_131246 ?auto_131248 ) ) ( not ( = ?auto_131246 ?auto_131249 ) ) ( not ( = ?auto_131246 ?auto_131250 ) ) ( not ( = ?auto_131246 ?auto_131251 ) ) ( not ( = ?auto_131246 ?auto_131252 ) ) ( not ( = ?auto_131246 ?auto_131253 ) ) ( not ( = ?auto_131246 ?auto_131254 ) ) ( not ( = ?auto_131247 ?auto_131248 ) ) ( not ( = ?auto_131247 ?auto_131249 ) ) ( not ( = ?auto_131247 ?auto_131250 ) ) ( not ( = ?auto_131247 ?auto_131251 ) ) ( not ( = ?auto_131247 ?auto_131252 ) ) ( not ( = ?auto_131247 ?auto_131253 ) ) ( not ( = ?auto_131247 ?auto_131254 ) ) ( not ( = ?auto_131248 ?auto_131249 ) ) ( not ( = ?auto_131248 ?auto_131250 ) ) ( not ( = ?auto_131248 ?auto_131251 ) ) ( not ( = ?auto_131248 ?auto_131252 ) ) ( not ( = ?auto_131248 ?auto_131253 ) ) ( not ( = ?auto_131248 ?auto_131254 ) ) ( not ( = ?auto_131249 ?auto_131250 ) ) ( not ( = ?auto_131249 ?auto_131251 ) ) ( not ( = ?auto_131249 ?auto_131252 ) ) ( not ( = ?auto_131249 ?auto_131253 ) ) ( not ( = ?auto_131249 ?auto_131254 ) ) ( not ( = ?auto_131250 ?auto_131251 ) ) ( not ( = ?auto_131250 ?auto_131252 ) ) ( not ( = ?auto_131250 ?auto_131253 ) ) ( not ( = ?auto_131250 ?auto_131254 ) ) ( not ( = ?auto_131251 ?auto_131252 ) ) ( not ( = ?auto_131251 ?auto_131253 ) ) ( not ( = ?auto_131251 ?auto_131254 ) ) ( not ( = ?auto_131252 ?auto_131253 ) ) ( not ( = ?auto_131252 ?auto_131254 ) ) ( not ( = ?auto_131253 ?auto_131254 ) ) ( CLEAR ?auto_131251 ) ( ON ?auto_131252 ?auto_131253 ) ( CLEAR ?auto_131252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131246 ?auto_131247 ?auto_131248 ?auto_131249 ?auto_131250 ?auto_131251 ?auto_131252 )
      ( MAKE-8PILE ?auto_131246 ?auto_131247 ?auto_131248 ?auto_131249 ?auto_131250 ?auto_131251 ?auto_131252 ?auto_131253 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131280 - BLOCK
      ?auto_131281 - BLOCK
      ?auto_131282 - BLOCK
      ?auto_131283 - BLOCK
      ?auto_131284 - BLOCK
      ?auto_131285 - BLOCK
      ?auto_131286 - BLOCK
      ?auto_131287 - BLOCK
    )
    :vars
    (
      ?auto_131288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131287 ?auto_131288 ) ( ON-TABLE ?auto_131280 ) ( ON ?auto_131281 ?auto_131280 ) ( ON ?auto_131282 ?auto_131281 ) ( ON ?auto_131283 ?auto_131282 ) ( ON ?auto_131284 ?auto_131283 ) ( not ( = ?auto_131280 ?auto_131281 ) ) ( not ( = ?auto_131280 ?auto_131282 ) ) ( not ( = ?auto_131280 ?auto_131283 ) ) ( not ( = ?auto_131280 ?auto_131284 ) ) ( not ( = ?auto_131280 ?auto_131285 ) ) ( not ( = ?auto_131280 ?auto_131286 ) ) ( not ( = ?auto_131280 ?auto_131287 ) ) ( not ( = ?auto_131280 ?auto_131288 ) ) ( not ( = ?auto_131281 ?auto_131282 ) ) ( not ( = ?auto_131281 ?auto_131283 ) ) ( not ( = ?auto_131281 ?auto_131284 ) ) ( not ( = ?auto_131281 ?auto_131285 ) ) ( not ( = ?auto_131281 ?auto_131286 ) ) ( not ( = ?auto_131281 ?auto_131287 ) ) ( not ( = ?auto_131281 ?auto_131288 ) ) ( not ( = ?auto_131282 ?auto_131283 ) ) ( not ( = ?auto_131282 ?auto_131284 ) ) ( not ( = ?auto_131282 ?auto_131285 ) ) ( not ( = ?auto_131282 ?auto_131286 ) ) ( not ( = ?auto_131282 ?auto_131287 ) ) ( not ( = ?auto_131282 ?auto_131288 ) ) ( not ( = ?auto_131283 ?auto_131284 ) ) ( not ( = ?auto_131283 ?auto_131285 ) ) ( not ( = ?auto_131283 ?auto_131286 ) ) ( not ( = ?auto_131283 ?auto_131287 ) ) ( not ( = ?auto_131283 ?auto_131288 ) ) ( not ( = ?auto_131284 ?auto_131285 ) ) ( not ( = ?auto_131284 ?auto_131286 ) ) ( not ( = ?auto_131284 ?auto_131287 ) ) ( not ( = ?auto_131284 ?auto_131288 ) ) ( not ( = ?auto_131285 ?auto_131286 ) ) ( not ( = ?auto_131285 ?auto_131287 ) ) ( not ( = ?auto_131285 ?auto_131288 ) ) ( not ( = ?auto_131286 ?auto_131287 ) ) ( not ( = ?auto_131286 ?auto_131288 ) ) ( not ( = ?auto_131287 ?auto_131288 ) ) ( ON ?auto_131286 ?auto_131287 ) ( CLEAR ?auto_131284 ) ( ON ?auto_131285 ?auto_131286 ) ( CLEAR ?auto_131285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131280 ?auto_131281 ?auto_131282 ?auto_131283 ?auto_131284 ?auto_131285 )
      ( MAKE-8PILE ?auto_131280 ?auto_131281 ?auto_131282 ?auto_131283 ?auto_131284 ?auto_131285 ?auto_131286 ?auto_131287 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131314 - BLOCK
      ?auto_131315 - BLOCK
      ?auto_131316 - BLOCK
      ?auto_131317 - BLOCK
      ?auto_131318 - BLOCK
      ?auto_131319 - BLOCK
      ?auto_131320 - BLOCK
      ?auto_131321 - BLOCK
    )
    :vars
    (
      ?auto_131322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131321 ?auto_131322 ) ( ON-TABLE ?auto_131314 ) ( ON ?auto_131315 ?auto_131314 ) ( ON ?auto_131316 ?auto_131315 ) ( ON ?auto_131317 ?auto_131316 ) ( not ( = ?auto_131314 ?auto_131315 ) ) ( not ( = ?auto_131314 ?auto_131316 ) ) ( not ( = ?auto_131314 ?auto_131317 ) ) ( not ( = ?auto_131314 ?auto_131318 ) ) ( not ( = ?auto_131314 ?auto_131319 ) ) ( not ( = ?auto_131314 ?auto_131320 ) ) ( not ( = ?auto_131314 ?auto_131321 ) ) ( not ( = ?auto_131314 ?auto_131322 ) ) ( not ( = ?auto_131315 ?auto_131316 ) ) ( not ( = ?auto_131315 ?auto_131317 ) ) ( not ( = ?auto_131315 ?auto_131318 ) ) ( not ( = ?auto_131315 ?auto_131319 ) ) ( not ( = ?auto_131315 ?auto_131320 ) ) ( not ( = ?auto_131315 ?auto_131321 ) ) ( not ( = ?auto_131315 ?auto_131322 ) ) ( not ( = ?auto_131316 ?auto_131317 ) ) ( not ( = ?auto_131316 ?auto_131318 ) ) ( not ( = ?auto_131316 ?auto_131319 ) ) ( not ( = ?auto_131316 ?auto_131320 ) ) ( not ( = ?auto_131316 ?auto_131321 ) ) ( not ( = ?auto_131316 ?auto_131322 ) ) ( not ( = ?auto_131317 ?auto_131318 ) ) ( not ( = ?auto_131317 ?auto_131319 ) ) ( not ( = ?auto_131317 ?auto_131320 ) ) ( not ( = ?auto_131317 ?auto_131321 ) ) ( not ( = ?auto_131317 ?auto_131322 ) ) ( not ( = ?auto_131318 ?auto_131319 ) ) ( not ( = ?auto_131318 ?auto_131320 ) ) ( not ( = ?auto_131318 ?auto_131321 ) ) ( not ( = ?auto_131318 ?auto_131322 ) ) ( not ( = ?auto_131319 ?auto_131320 ) ) ( not ( = ?auto_131319 ?auto_131321 ) ) ( not ( = ?auto_131319 ?auto_131322 ) ) ( not ( = ?auto_131320 ?auto_131321 ) ) ( not ( = ?auto_131320 ?auto_131322 ) ) ( not ( = ?auto_131321 ?auto_131322 ) ) ( ON ?auto_131320 ?auto_131321 ) ( ON ?auto_131319 ?auto_131320 ) ( CLEAR ?auto_131317 ) ( ON ?auto_131318 ?auto_131319 ) ( CLEAR ?auto_131318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131314 ?auto_131315 ?auto_131316 ?auto_131317 ?auto_131318 )
      ( MAKE-8PILE ?auto_131314 ?auto_131315 ?auto_131316 ?auto_131317 ?auto_131318 ?auto_131319 ?auto_131320 ?auto_131321 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131348 - BLOCK
      ?auto_131349 - BLOCK
      ?auto_131350 - BLOCK
      ?auto_131351 - BLOCK
      ?auto_131352 - BLOCK
      ?auto_131353 - BLOCK
      ?auto_131354 - BLOCK
      ?auto_131355 - BLOCK
    )
    :vars
    (
      ?auto_131356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131355 ?auto_131356 ) ( ON-TABLE ?auto_131348 ) ( ON ?auto_131349 ?auto_131348 ) ( ON ?auto_131350 ?auto_131349 ) ( not ( = ?auto_131348 ?auto_131349 ) ) ( not ( = ?auto_131348 ?auto_131350 ) ) ( not ( = ?auto_131348 ?auto_131351 ) ) ( not ( = ?auto_131348 ?auto_131352 ) ) ( not ( = ?auto_131348 ?auto_131353 ) ) ( not ( = ?auto_131348 ?auto_131354 ) ) ( not ( = ?auto_131348 ?auto_131355 ) ) ( not ( = ?auto_131348 ?auto_131356 ) ) ( not ( = ?auto_131349 ?auto_131350 ) ) ( not ( = ?auto_131349 ?auto_131351 ) ) ( not ( = ?auto_131349 ?auto_131352 ) ) ( not ( = ?auto_131349 ?auto_131353 ) ) ( not ( = ?auto_131349 ?auto_131354 ) ) ( not ( = ?auto_131349 ?auto_131355 ) ) ( not ( = ?auto_131349 ?auto_131356 ) ) ( not ( = ?auto_131350 ?auto_131351 ) ) ( not ( = ?auto_131350 ?auto_131352 ) ) ( not ( = ?auto_131350 ?auto_131353 ) ) ( not ( = ?auto_131350 ?auto_131354 ) ) ( not ( = ?auto_131350 ?auto_131355 ) ) ( not ( = ?auto_131350 ?auto_131356 ) ) ( not ( = ?auto_131351 ?auto_131352 ) ) ( not ( = ?auto_131351 ?auto_131353 ) ) ( not ( = ?auto_131351 ?auto_131354 ) ) ( not ( = ?auto_131351 ?auto_131355 ) ) ( not ( = ?auto_131351 ?auto_131356 ) ) ( not ( = ?auto_131352 ?auto_131353 ) ) ( not ( = ?auto_131352 ?auto_131354 ) ) ( not ( = ?auto_131352 ?auto_131355 ) ) ( not ( = ?auto_131352 ?auto_131356 ) ) ( not ( = ?auto_131353 ?auto_131354 ) ) ( not ( = ?auto_131353 ?auto_131355 ) ) ( not ( = ?auto_131353 ?auto_131356 ) ) ( not ( = ?auto_131354 ?auto_131355 ) ) ( not ( = ?auto_131354 ?auto_131356 ) ) ( not ( = ?auto_131355 ?auto_131356 ) ) ( ON ?auto_131354 ?auto_131355 ) ( ON ?auto_131353 ?auto_131354 ) ( ON ?auto_131352 ?auto_131353 ) ( CLEAR ?auto_131350 ) ( ON ?auto_131351 ?auto_131352 ) ( CLEAR ?auto_131351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131348 ?auto_131349 ?auto_131350 ?auto_131351 )
      ( MAKE-8PILE ?auto_131348 ?auto_131349 ?auto_131350 ?auto_131351 ?auto_131352 ?auto_131353 ?auto_131354 ?auto_131355 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131382 - BLOCK
      ?auto_131383 - BLOCK
      ?auto_131384 - BLOCK
      ?auto_131385 - BLOCK
      ?auto_131386 - BLOCK
      ?auto_131387 - BLOCK
      ?auto_131388 - BLOCK
      ?auto_131389 - BLOCK
    )
    :vars
    (
      ?auto_131390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131389 ?auto_131390 ) ( ON-TABLE ?auto_131382 ) ( ON ?auto_131383 ?auto_131382 ) ( not ( = ?auto_131382 ?auto_131383 ) ) ( not ( = ?auto_131382 ?auto_131384 ) ) ( not ( = ?auto_131382 ?auto_131385 ) ) ( not ( = ?auto_131382 ?auto_131386 ) ) ( not ( = ?auto_131382 ?auto_131387 ) ) ( not ( = ?auto_131382 ?auto_131388 ) ) ( not ( = ?auto_131382 ?auto_131389 ) ) ( not ( = ?auto_131382 ?auto_131390 ) ) ( not ( = ?auto_131383 ?auto_131384 ) ) ( not ( = ?auto_131383 ?auto_131385 ) ) ( not ( = ?auto_131383 ?auto_131386 ) ) ( not ( = ?auto_131383 ?auto_131387 ) ) ( not ( = ?auto_131383 ?auto_131388 ) ) ( not ( = ?auto_131383 ?auto_131389 ) ) ( not ( = ?auto_131383 ?auto_131390 ) ) ( not ( = ?auto_131384 ?auto_131385 ) ) ( not ( = ?auto_131384 ?auto_131386 ) ) ( not ( = ?auto_131384 ?auto_131387 ) ) ( not ( = ?auto_131384 ?auto_131388 ) ) ( not ( = ?auto_131384 ?auto_131389 ) ) ( not ( = ?auto_131384 ?auto_131390 ) ) ( not ( = ?auto_131385 ?auto_131386 ) ) ( not ( = ?auto_131385 ?auto_131387 ) ) ( not ( = ?auto_131385 ?auto_131388 ) ) ( not ( = ?auto_131385 ?auto_131389 ) ) ( not ( = ?auto_131385 ?auto_131390 ) ) ( not ( = ?auto_131386 ?auto_131387 ) ) ( not ( = ?auto_131386 ?auto_131388 ) ) ( not ( = ?auto_131386 ?auto_131389 ) ) ( not ( = ?auto_131386 ?auto_131390 ) ) ( not ( = ?auto_131387 ?auto_131388 ) ) ( not ( = ?auto_131387 ?auto_131389 ) ) ( not ( = ?auto_131387 ?auto_131390 ) ) ( not ( = ?auto_131388 ?auto_131389 ) ) ( not ( = ?auto_131388 ?auto_131390 ) ) ( not ( = ?auto_131389 ?auto_131390 ) ) ( ON ?auto_131388 ?auto_131389 ) ( ON ?auto_131387 ?auto_131388 ) ( ON ?auto_131386 ?auto_131387 ) ( ON ?auto_131385 ?auto_131386 ) ( CLEAR ?auto_131383 ) ( ON ?auto_131384 ?auto_131385 ) ( CLEAR ?auto_131384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131382 ?auto_131383 ?auto_131384 )
      ( MAKE-8PILE ?auto_131382 ?auto_131383 ?auto_131384 ?auto_131385 ?auto_131386 ?auto_131387 ?auto_131388 ?auto_131389 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131416 - BLOCK
      ?auto_131417 - BLOCK
      ?auto_131418 - BLOCK
      ?auto_131419 - BLOCK
      ?auto_131420 - BLOCK
      ?auto_131421 - BLOCK
      ?auto_131422 - BLOCK
      ?auto_131423 - BLOCK
    )
    :vars
    (
      ?auto_131424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131423 ?auto_131424 ) ( ON-TABLE ?auto_131416 ) ( not ( = ?auto_131416 ?auto_131417 ) ) ( not ( = ?auto_131416 ?auto_131418 ) ) ( not ( = ?auto_131416 ?auto_131419 ) ) ( not ( = ?auto_131416 ?auto_131420 ) ) ( not ( = ?auto_131416 ?auto_131421 ) ) ( not ( = ?auto_131416 ?auto_131422 ) ) ( not ( = ?auto_131416 ?auto_131423 ) ) ( not ( = ?auto_131416 ?auto_131424 ) ) ( not ( = ?auto_131417 ?auto_131418 ) ) ( not ( = ?auto_131417 ?auto_131419 ) ) ( not ( = ?auto_131417 ?auto_131420 ) ) ( not ( = ?auto_131417 ?auto_131421 ) ) ( not ( = ?auto_131417 ?auto_131422 ) ) ( not ( = ?auto_131417 ?auto_131423 ) ) ( not ( = ?auto_131417 ?auto_131424 ) ) ( not ( = ?auto_131418 ?auto_131419 ) ) ( not ( = ?auto_131418 ?auto_131420 ) ) ( not ( = ?auto_131418 ?auto_131421 ) ) ( not ( = ?auto_131418 ?auto_131422 ) ) ( not ( = ?auto_131418 ?auto_131423 ) ) ( not ( = ?auto_131418 ?auto_131424 ) ) ( not ( = ?auto_131419 ?auto_131420 ) ) ( not ( = ?auto_131419 ?auto_131421 ) ) ( not ( = ?auto_131419 ?auto_131422 ) ) ( not ( = ?auto_131419 ?auto_131423 ) ) ( not ( = ?auto_131419 ?auto_131424 ) ) ( not ( = ?auto_131420 ?auto_131421 ) ) ( not ( = ?auto_131420 ?auto_131422 ) ) ( not ( = ?auto_131420 ?auto_131423 ) ) ( not ( = ?auto_131420 ?auto_131424 ) ) ( not ( = ?auto_131421 ?auto_131422 ) ) ( not ( = ?auto_131421 ?auto_131423 ) ) ( not ( = ?auto_131421 ?auto_131424 ) ) ( not ( = ?auto_131422 ?auto_131423 ) ) ( not ( = ?auto_131422 ?auto_131424 ) ) ( not ( = ?auto_131423 ?auto_131424 ) ) ( ON ?auto_131422 ?auto_131423 ) ( ON ?auto_131421 ?auto_131422 ) ( ON ?auto_131420 ?auto_131421 ) ( ON ?auto_131419 ?auto_131420 ) ( ON ?auto_131418 ?auto_131419 ) ( CLEAR ?auto_131416 ) ( ON ?auto_131417 ?auto_131418 ) ( CLEAR ?auto_131417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131416 ?auto_131417 )
      ( MAKE-8PILE ?auto_131416 ?auto_131417 ?auto_131418 ?auto_131419 ?auto_131420 ?auto_131421 ?auto_131422 ?auto_131423 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131450 - BLOCK
      ?auto_131451 - BLOCK
      ?auto_131452 - BLOCK
      ?auto_131453 - BLOCK
      ?auto_131454 - BLOCK
      ?auto_131455 - BLOCK
      ?auto_131456 - BLOCK
      ?auto_131457 - BLOCK
    )
    :vars
    (
      ?auto_131458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131457 ?auto_131458 ) ( not ( = ?auto_131450 ?auto_131451 ) ) ( not ( = ?auto_131450 ?auto_131452 ) ) ( not ( = ?auto_131450 ?auto_131453 ) ) ( not ( = ?auto_131450 ?auto_131454 ) ) ( not ( = ?auto_131450 ?auto_131455 ) ) ( not ( = ?auto_131450 ?auto_131456 ) ) ( not ( = ?auto_131450 ?auto_131457 ) ) ( not ( = ?auto_131450 ?auto_131458 ) ) ( not ( = ?auto_131451 ?auto_131452 ) ) ( not ( = ?auto_131451 ?auto_131453 ) ) ( not ( = ?auto_131451 ?auto_131454 ) ) ( not ( = ?auto_131451 ?auto_131455 ) ) ( not ( = ?auto_131451 ?auto_131456 ) ) ( not ( = ?auto_131451 ?auto_131457 ) ) ( not ( = ?auto_131451 ?auto_131458 ) ) ( not ( = ?auto_131452 ?auto_131453 ) ) ( not ( = ?auto_131452 ?auto_131454 ) ) ( not ( = ?auto_131452 ?auto_131455 ) ) ( not ( = ?auto_131452 ?auto_131456 ) ) ( not ( = ?auto_131452 ?auto_131457 ) ) ( not ( = ?auto_131452 ?auto_131458 ) ) ( not ( = ?auto_131453 ?auto_131454 ) ) ( not ( = ?auto_131453 ?auto_131455 ) ) ( not ( = ?auto_131453 ?auto_131456 ) ) ( not ( = ?auto_131453 ?auto_131457 ) ) ( not ( = ?auto_131453 ?auto_131458 ) ) ( not ( = ?auto_131454 ?auto_131455 ) ) ( not ( = ?auto_131454 ?auto_131456 ) ) ( not ( = ?auto_131454 ?auto_131457 ) ) ( not ( = ?auto_131454 ?auto_131458 ) ) ( not ( = ?auto_131455 ?auto_131456 ) ) ( not ( = ?auto_131455 ?auto_131457 ) ) ( not ( = ?auto_131455 ?auto_131458 ) ) ( not ( = ?auto_131456 ?auto_131457 ) ) ( not ( = ?auto_131456 ?auto_131458 ) ) ( not ( = ?auto_131457 ?auto_131458 ) ) ( ON ?auto_131456 ?auto_131457 ) ( ON ?auto_131455 ?auto_131456 ) ( ON ?auto_131454 ?auto_131455 ) ( ON ?auto_131453 ?auto_131454 ) ( ON ?auto_131452 ?auto_131453 ) ( ON ?auto_131451 ?auto_131452 ) ( ON ?auto_131450 ?auto_131451 ) ( CLEAR ?auto_131450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131450 )
      ( MAKE-8PILE ?auto_131450 ?auto_131451 ?auto_131452 ?auto_131453 ?auto_131454 ?auto_131455 ?auto_131456 ?auto_131457 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_131485 - BLOCK
      ?auto_131486 - BLOCK
      ?auto_131487 - BLOCK
      ?auto_131488 - BLOCK
      ?auto_131489 - BLOCK
      ?auto_131490 - BLOCK
      ?auto_131491 - BLOCK
      ?auto_131492 - BLOCK
      ?auto_131493 - BLOCK
    )
    :vars
    (
      ?auto_131494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_131492 ) ( ON ?auto_131493 ?auto_131494 ) ( CLEAR ?auto_131493 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131485 ) ( ON ?auto_131486 ?auto_131485 ) ( ON ?auto_131487 ?auto_131486 ) ( ON ?auto_131488 ?auto_131487 ) ( ON ?auto_131489 ?auto_131488 ) ( ON ?auto_131490 ?auto_131489 ) ( ON ?auto_131491 ?auto_131490 ) ( ON ?auto_131492 ?auto_131491 ) ( not ( = ?auto_131485 ?auto_131486 ) ) ( not ( = ?auto_131485 ?auto_131487 ) ) ( not ( = ?auto_131485 ?auto_131488 ) ) ( not ( = ?auto_131485 ?auto_131489 ) ) ( not ( = ?auto_131485 ?auto_131490 ) ) ( not ( = ?auto_131485 ?auto_131491 ) ) ( not ( = ?auto_131485 ?auto_131492 ) ) ( not ( = ?auto_131485 ?auto_131493 ) ) ( not ( = ?auto_131485 ?auto_131494 ) ) ( not ( = ?auto_131486 ?auto_131487 ) ) ( not ( = ?auto_131486 ?auto_131488 ) ) ( not ( = ?auto_131486 ?auto_131489 ) ) ( not ( = ?auto_131486 ?auto_131490 ) ) ( not ( = ?auto_131486 ?auto_131491 ) ) ( not ( = ?auto_131486 ?auto_131492 ) ) ( not ( = ?auto_131486 ?auto_131493 ) ) ( not ( = ?auto_131486 ?auto_131494 ) ) ( not ( = ?auto_131487 ?auto_131488 ) ) ( not ( = ?auto_131487 ?auto_131489 ) ) ( not ( = ?auto_131487 ?auto_131490 ) ) ( not ( = ?auto_131487 ?auto_131491 ) ) ( not ( = ?auto_131487 ?auto_131492 ) ) ( not ( = ?auto_131487 ?auto_131493 ) ) ( not ( = ?auto_131487 ?auto_131494 ) ) ( not ( = ?auto_131488 ?auto_131489 ) ) ( not ( = ?auto_131488 ?auto_131490 ) ) ( not ( = ?auto_131488 ?auto_131491 ) ) ( not ( = ?auto_131488 ?auto_131492 ) ) ( not ( = ?auto_131488 ?auto_131493 ) ) ( not ( = ?auto_131488 ?auto_131494 ) ) ( not ( = ?auto_131489 ?auto_131490 ) ) ( not ( = ?auto_131489 ?auto_131491 ) ) ( not ( = ?auto_131489 ?auto_131492 ) ) ( not ( = ?auto_131489 ?auto_131493 ) ) ( not ( = ?auto_131489 ?auto_131494 ) ) ( not ( = ?auto_131490 ?auto_131491 ) ) ( not ( = ?auto_131490 ?auto_131492 ) ) ( not ( = ?auto_131490 ?auto_131493 ) ) ( not ( = ?auto_131490 ?auto_131494 ) ) ( not ( = ?auto_131491 ?auto_131492 ) ) ( not ( = ?auto_131491 ?auto_131493 ) ) ( not ( = ?auto_131491 ?auto_131494 ) ) ( not ( = ?auto_131492 ?auto_131493 ) ) ( not ( = ?auto_131492 ?auto_131494 ) ) ( not ( = ?auto_131493 ?auto_131494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131493 ?auto_131494 )
      ( !STACK ?auto_131493 ?auto_131492 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_131523 - BLOCK
      ?auto_131524 - BLOCK
      ?auto_131525 - BLOCK
      ?auto_131526 - BLOCK
      ?auto_131527 - BLOCK
      ?auto_131528 - BLOCK
      ?auto_131529 - BLOCK
      ?auto_131530 - BLOCK
      ?auto_131531 - BLOCK
    )
    :vars
    (
      ?auto_131532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131531 ?auto_131532 ) ( ON-TABLE ?auto_131523 ) ( ON ?auto_131524 ?auto_131523 ) ( ON ?auto_131525 ?auto_131524 ) ( ON ?auto_131526 ?auto_131525 ) ( ON ?auto_131527 ?auto_131526 ) ( ON ?auto_131528 ?auto_131527 ) ( ON ?auto_131529 ?auto_131528 ) ( not ( = ?auto_131523 ?auto_131524 ) ) ( not ( = ?auto_131523 ?auto_131525 ) ) ( not ( = ?auto_131523 ?auto_131526 ) ) ( not ( = ?auto_131523 ?auto_131527 ) ) ( not ( = ?auto_131523 ?auto_131528 ) ) ( not ( = ?auto_131523 ?auto_131529 ) ) ( not ( = ?auto_131523 ?auto_131530 ) ) ( not ( = ?auto_131523 ?auto_131531 ) ) ( not ( = ?auto_131523 ?auto_131532 ) ) ( not ( = ?auto_131524 ?auto_131525 ) ) ( not ( = ?auto_131524 ?auto_131526 ) ) ( not ( = ?auto_131524 ?auto_131527 ) ) ( not ( = ?auto_131524 ?auto_131528 ) ) ( not ( = ?auto_131524 ?auto_131529 ) ) ( not ( = ?auto_131524 ?auto_131530 ) ) ( not ( = ?auto_131524 ?auto_131531 ) ) ( not ( = ?auto_131524 ?auto_131532 ) ) ( not ( = ?auto_131525 ?auto_131526 ) ) ( not ( = ?auto_131525 ?auto_131527 ) ) ( not ( = ?auto_131525 ?auto_131528 ) ) ( not ( = ?auto_131525 ?auto_131529 ) ) ( not ( = ?auto_131525 ?auto_131530 ) ) ( not ( = ?auto_131525 ?auto_131531 ) ) ( not ( = ?auto_131525 ?auto_131532 ) ) ( not ( = ?auto_131526 ?auto_131527 ) ) ( not ( = ?auto_131526 ?auto_131528 ) ) ( not ( = ?auto_131526 ?auto_131529 ) ) ( not ( = ?auto_131526 ?auto_131530 ) ) ( not ( = ?auto_131526 ?auto_131531 ) ) ( not ( = ?auto_131526 ?auto_131532 ) ) ( not ( = ?auto_131527 ?auto_131528 ) ) ( not ( = ?auto_131527 ?auto_131529 ) ) ( not ( = ?auto_131527 ?auto_131530 ) ) ( not ( = ?auto_131527 ?auto_131531 ) ) ( not ( = ?auto_131527 ?auto_131532 ) ) ( not ( = ?auto_131528 ?auto_131529 ) ) ( not ( = ?auto_131528 ?auto_131530 ) ) ( not ( = ?auto_131528 ?auto_131531 ) ) ( not ( = ?auto_131528 ?auto_131532 ) ) ( not ( = ?auto_131529 ?auto_131530 ) ) ( not ( = ?auto_131529 ?auto_131531 ) ) ( not ( = ?auto_131529 ?auto_131532 ) ) ( not ( = ?auto_131530 ?auto_131531 ) ) ( not ( = ?auto_131530 ?auto_131532 ) ) ( not ( = ?auto_131531 ?auto_131532 ) ) ( CLEAR ?auto_131529 ) ( ON ?auto_131530 ?auto_131531 ) ( CLEAR ?auto_131530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_131523 ?auto_131524 ?auto_131525 ?auto_131526 ?auto_131527 ?auto_131528 ?auto_131529 ?auto_131530 )
      ( MAKE-9PILE ?auto_131523 ?auto_131524 ?auto_131525 ?auto_131526 ?auto_131527 ?auto_131528 ?auto_131529 ?auto_131530 ?auto_131531 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_131561 - BLOCK
      ?auto_131562 - BLOCK
      ?auto_131563 - BLOCK
      ?auto_131564 - BLOCK
      ?auto_131565 - BLOCK
      ?auto_131566 - BLOCK
      ?auto_131567 - BLOCK
      ?auto_131568 - BLOCK
      ?auto_131569 - BLOCK
    )
    :vars
    (
      ?auto_131570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131569 ?auto_131570 ) ( ON-TABLE ?auto_131561 ) ( ON ?auto_131562 ?auto_131561 ) ( ON ?auto_131563 ?auto_131562 ) ( ON ?auto_131564 ?auto_131563 ) ( ON ?auto_131565 ?auto_131564 ) ( ON ?auto_131566 ?auto_131565 ) ( not ( = ?auto_131561 ?auto_131562 ) ) ( not ( = ?auto_131561 ?auto_131563 ) ) ( not ( = ?auto_131561 ?auto_131564 ) ) ( not ( = ?auto_131561 ?auto_131565 ) ) ( not ( = ?auto_131561 ?auto_131566 ) ) ( not ( = ?auto_131561 ?auto_131567 ) ) ( not ( = ?auto_131561 ?auto_131568 ) ) ( not ( = ?auto_131561 ?auto_131569 ) ) ( not ( = ?auto_131561 ?auto_131570 ) ) ( not ( = ?auto_131562 ?auto_131563 ) ) ( not ( = ?auto_131562 ?auto_131564 ) ) ( not ( = ?auto_131562 ?auto_131565 ) ) ( not ( = ?auto_131562 ?auto_131566 ) ) ( not ( = ?auto_131562 ?auto_131567 ) ) ( not ( = ?auto_131562 ?auto_131568 ) ) ( not ( = ?auto_131562 ?auto_131569 ) ) ( not ( = ?auto_131562 ?auto_131570 ) ) ( not ( = ?auto_131563 ?auto_131564 ) ) ( not ( = ?auto_131563 ?auto_131565 ) ) ( not ( = ?auto_131563 ?auto_131566 ) ) ( not ( = ?auto_131563 ?auto_131567 ) ) ( not ( = ?auto_131563 ?auto_131568 ) ) ( not ( = ?auto_131563 ?auto_131569 ) ) ( not ( = ?auto_131563 ?auto_131570 ) ) ( not ( = ?auto_131564 ?auto_131565 ) ) ( not ( = ?auto_131564 ?auto_131566 ) ) ( not ( = ?auto_131564 ?auto_131567 ) ) ( not ( = ?auto_131564 ?auto_131568 ) ) ( not ( = ?auto_131564 ?auto_131569 ) ) ( not ( = ?auto_131564 ?auto_131570 ) ) ( not ( = ?auto_131565 ?auto_131566 ) ) ( not ( = ?auto_131565 ?auto_131567 ) ) ( not ( = ?auto_131565 ?auto_131568 ) ) ( not ( = ?auto_131565 ?auto_131569 ) ) ( not ( = ?auto_131565 ?auto_131570 ) ) ( not ( = ?auto_131566 ?auto_131567 ) ) ( not ( = ?auto_131566 ?auto_131568 ) ) ( not ( = ?auto_131566 ?auto_131569 ) ) ( not ( = ?auto_131566 ?auto_131570 ) ) ( not ( = ?auto_131567 ?auto_131568 ) ) ( not ( = ?auto_131567 ?auto_131569 ) ) ( not ( = ?auto_131567 ?auto_131570 ) ) ( not ( = ?auto_131568 ?auto_131569 ) ) ( not ( = ?auto_131568 ?auto_131570 ) ) ( not ( = ?auto_131569 ?auto_131570 ) ) ( ON ?auto_131568 ?auto_131569 ) ( CLEAR ?auto_131566 ) ( ON ?auto_131567 ?auto_131568 ) ( CLEAR ?auto_131567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131561 ?auto_131562 ?auto_131563 ?auto_131564 ?auto_131565 ?auto_131566 ?auto_131567 )
      ( MAKE-9PILE ?auto_131561 ?auto_131562 ?auto_131563 ?auto_131564 ?auto_131565 ?auto_131566 ?auto_131567 ?auto_131568 ?auto_131569 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_131599 - BLOCK
      ?auto_131600 - BLOCK
      ?auto_131601 - BLOCK
      ?auto_131602 - BLOCK
      ?auto_131603 - BLOCK
      ?auto_131604 - BLOCK
      ?auto_131605 - BLOCK
      ?auto_131606 - BLOCK
      ?auto_131607 - BLOCK
    )
    :vars
    (
      ?auto_131608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131607 ?auto_131608 ) ( ON-TABLE ?auto_131599 ) ( ON ?auto_131600 ?auto_131599 ) ( ON ?auto_131601 ?auto_131600 ) ( ON ?auto_131602 ?auto_131601 ) ( ON ?auto_131603 ?auto_131602 ) ( not ( = ?auto_131599 ?auto_131600 ) ) ( not ( = ?auto_131599 ?auto_131601 ) ) ( not ( = ?auto_131599 ?auto_131602 ) ) ( not ( = ?auto_131599 ?auto_131603 ) ) ( not ( = ?auto_131599 ?auto_131604 ) ) ( not ( = ?auto_131599 ?auto_131605 ) ) ( not ( = ?auto_131599 ?auto_131606 ) ) ( not ( = ?auto_131599 ?auto_131607 ) ) ( not ( = ?auto_131599 ?auto_131608 ) ) ( not ( = ?auto_131600 ?auto_131601 ) ) ( not ( = ?auto_131600 ?auto_131602 ) ) ( not ( = ?auto_131600 ?auto_131603 ) ) ( not ( = ?auto_131600 ?auto_131604 ) ) ( not ( = ?auto_131600 ?auto_131605 ) ) ( not ( = ?auto_131600 ?auto_131606 ) ) ( not ( = ?auto_131600 ?auto_131607 ) ) ( not ( = ?auto_131600 ?auto_131608 ) ) ( not ( = ?auto_131601 ?auto_131602 ) ) ( not ( = ?auto_131601 ?auto_131603 ) ) ( not ( = ?auto_131601 ?auto_131604 ) ) ( not ( = ?auto_131601 ?auto_131605 ) ) ( not ( = ?auto_131601 ?auto_131606 ) ) ( not ( = ?auto_131601 ?auto_131607 ) ) ( not ( = ?auto_131601 ?auto_131608 ) ) ( not ( = ?auto_131602 ?auto_131603 ) ) ( not ( = ?auto_131602 ?auto_131604 ) ) ( not ( = ?auto_131602 ?auto_131605 ) ) ( not ( = ?auto_131602 ?auto_131606 ) ) ( not ( = ?auto_131602 ?auto_131607 ) ) ( not ( = ?auto_131602 ?auto_131608 ) ) ( not ( = ?auto_131603 ?auto_131604 ) ) ( not ( = ?auto_131603 ?auto_131605 ) ) ( not ( = ?auto_131603 ?auto_131606 ) ) ( not ( = ?auto_131603 ?auto_131607 ) ) ( not ( = ?auto_131603 ?auto_131608 ) ) ( not ( = ?auto_131604 ?auto_131605 ) ) ( not ( = ?auto_131604 ?auto_131606 ) ) ( not ( = ?auto_131604 ?auto_131607 ) ) ( not ( = ?auto_131604 ?auto_131608 ) ) ( not ( = ?auto_131605 ?auto_131606 ) ) ( not ( = ?auto_131605 ?auto_131607 ) ) ( not ( = ?auto_131605 ?auto_131608 ) ) ( not ( = ?auto_131606 ?auto_131607 ) ) ( not ( = ?auto_131606 ?auto_131608 ) ) ( not ( = ?auto_131607 ?auto_131608 ) ) ( ON ?auto_131606 ?auto_131607 ) ( ON ?auto_131605 ?auto_131606 ) ( CLEAR ?auto_131603 ) ( ON ?auto_131604 ?auto_131605 ) ( CLEAR ?auto_131604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131599 ?auto_131600 ?auto_131601 ?auto_131602 ?auto_131603 ?auto_131604 )
      ( MAKE-9PILE ?auto_131599 ?auto_131600 ?auto_131601 ?auto_131602 ?auto_131603 ?auto_131604 ?auto_131605 ?auto_131606 ?auto_131607 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_131637 - BLOCK
      ?auto_131638 - BLOCK
      ?auto_131639 - BLOCK
      ?auto_131640 - BLOCK
      ?auto_131641 - BLOCK
      ?auto_131642 - BLOCK
      ?auto_131643 - BLOCK
      ?auto_131644 - BLOCK
      ?auto_131645 - BLOCK
    )
    :vars
    (
      ?auto_131646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131645 ?auto_131646 ) ( ON-TABLE ?auto_131637 ) ( ON ?auto_131638 ?auto_131637 ) ( ON ?auto_131639 ?auto_131638 ) ( ON ?auto_131640 ?auto_131639 ) ( not ( = ?auto_131637 ?auto_131638 ) ) ( not ( = ?auto_131637 ?auto_131639 ) ) ( not ( = ?auto_131637 ?auto_131640 ) ) ( not ( = ?auto_131637 ?auto_131641 ) ) ( not ( = ?auto_131637 ?auto_131642 ) ) ( not ( = ?auto_131637 ?auto_131643 ) ) ( not ( = ?auto_131637 ?auto_131644 ) ) ( not ( = ?auto_131637 ?auto_131645 ) ) ( not ( = ?auto_131637 ?auto_131646 ) ) ( not ( = ?auto_131638 ?auto_131639 ) ) ( not ( = ?auto_131638 ?auto_131640 ) ) ( not ( = ?auto_131638 ?auto_131641 ) ) ( not ( = ?auto_131638 ?auto_131642 ) ) ( not ( = ?auto_131638 ?auto_131643 ) ) ( not ( = ?auto_131638 ?auto_131644 ) ) ( not ( = ?auto_131638 ?auto_131645 ) ) ( not ( = ?auto_131638 ?auto_131646 ) ) ( not ( = ?auto_131639 ?auto_131640 ) ) ( not ( = ?auto_131639 ?auto_131641 ) ) ( not ( = ?auto_131639 ?auto_131642 ) ) ( not ( = ?auto_131639 ?auto_131643 ) ) ( not ( = ?auto_131639 ?auto_131644 ) ) ( not ( = ?auto_131639 ?auto_131645 ) ) ( not ( = ?auto_131639 ?auto_131646 ) ) ( not ( = ?auto_131640 ?auto_131641 ) ) ( not ( = ?auto_131640 ?auto_131642 ) ) ( not ( = ?auto_131640 ?auto_131643 ) ) ( not ( = ?auto_131640 ?auto_131644 ) ) ( not ( = ?auto_131640 ?auto_131645 ) ) ( not ( = ?auto_131640 ?auto_131646 ) ) ( not ( = ?auto_131641 ?auto_131642 ) ) ( not ( = ?auto_131641 ?auto_131643 ) ) ( not ( = ?auto_131641 ?auto_131644 ) ) ( not ( = ?auto_131641 ?auto_131645 ) ) ( not ( = ?auto_131641 ?auto_131646 ) ) ( not ( = ?auto_131642 ?auto_131643 ) ) ( not ( = ?auto_131642 ?auto_131644 ) ) ( not ( = ?auto_131642 ?auto_131645 ) ) ( not ( = ?auto_131642 ?auto_131646 ) ) ( not ( = ?auto_131643 ?auto_131644 ) ) ( not ( = ?auto_131643 ?auto_131645 ) ) ( not ( = ?auto_131643 ?auto_131646 ) ) ( not ( = ?auto_131644 ?auto_131645 ) ) ( not ( = ?auto_131644 ?auto_131646 ) ) ( not ( = ?auto_131645 ?auto_131646 ) ) ( ON ?auto_131644 ?auto_131645 ) ( ON ?auto_131643 ?auto_131644 ) ( ON ?auto_131642 ?auto_131643 ) ( CLEAR ?auto_131640 ) ( ON ?auto_131641 ?auto_131642 ) ( CLEAR ?auto_131641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131637 ?auto_131638 ?auto_131639 ?auto_131640 ?auto_131641 )
      ( MAKE-9PILE ?auto_131637 ?auto_131638 ?auto_131639 ?auto_131640 ?auto_131641 ?auto_131642 ?auto_131643 ?auto_131644 ?auto_131645 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_131675 - BLOCK
      ?auto_131676 - BLOCK
      ?auto_131677 - BLOCK
      ?auto_131678 - BLOCK
      ?auto_131679 - BLOCK
      ?auto_131680 - BLOCK
      ?auto_131681 - BLOCK
      ?auto_131682 - BLOCK
      ?auto_131683 - BLOCK
    )
    :vars
    (
      ?auto_131684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131683 ?auto_131684 ) ( ON-TABLE ?auto_131675 ) ( ON ?auto_131676 ?auto_131675 ) ( ON ?auto_131677 ?auto_131676 ) ( not ( = ?auto_131675 ?auto_131676 ) ) ( not ( = ?auto_131675 ?auto_131677 ) ) ( not ( = ?auto_131675 ?auto_131678 ) ) ( not ( = ?auto_131675 ?auto_131679 ) ) ( not ( = ?auto_131675 ?auto_131680 ) ) ( not ( = ?auto_131675 ?auto_131681 ) ) ( not ( = ?auto_131675 ?auto_131682 ) ) ( not ( = ?auto_131675 ?auto_131683 ) ) ( not ( = ?auto_131675 ?auto_131684 ) ) ( not ( = ?auto_131676 ?auto_131677 ) ) ( not ( = ?auto_131676 ?auto_131678 ) ) ( not ( = ?auto_131676 ?auto_131679 ) ) ( not ( = ?auto_131676 ?auto_131680 ) ) ( not ( = ?auto_131676 ?auto_131681 ) ) ( not ( = ?auto_131676 ?auto_131682 ) ) ( not ( = ?auto_131676 ?auto_131683 ) ) ( not ( = ?auto_131676 ?auto_131684 ) ) ( not ( = ?auto_131677 ?auto_131678 ) ) ( not ( = ?auto_131677 ?auto_131679 ) ) ( not ( = ?auto_131677 ?auto_131680 ) ) ( not ( = ?auto_131677 ?auto_131681 ) ) ( not ( = ?auto_131677 ?auto_131682 ) ) ( not ( = ?auto_131677 ?auto_131683 ) ) ( not ( = ?auto_131677 ?auto_131684 ) ) ( not ( = ?auto_131678 ?auto_131679 ) ) ( not ( = ?auto_131678 ?auto_131680 ) ) ( not ( = ?auto_131678 ?auto_131681 ) ) ( not ( = ?auto_131678 ?auto_131682 ) ) ( not ( = ?auto_131678 ?auto_131683 ) ) ( not ( = ?auto_131678 ?auto_131684 ) ) ( not ( = ?auto_131679 ?auto_131680 ) ) ( not ( = ?auto_131679 ?auto_131681 ) ) ( not ( = ?auto_131679 ?auto_131682 ) ) ( not ( = ?auto_131679 ?auto_131683 ) ) ( not ( = ?auto_131679 ?auto_131684 ) ) ( not ( = ?auto_131680 ?auto_131681 ) ) ( not ( = ?auto_131680 ?auto_131682 ) ) ( not ( = ?auto_131680 ?auto_131683 ) ) ( not ( = ?auto_131680 ?auto_131684 ) ) ( not ( = ?auto_131681 ?auto_131682 ) ) ( not ( = ?auto_131681 ?auto_131683 ) ) ( not ( = ?auto_131681 ?auto_131684 ) ) ( not ( = ?auto_131682 ?auto_131683 ) ) ( not ( = ?auto_131682 ?auto_131684 ) ) ( not ( = ?auto_131683 ?auto_131684 ) ) ( ON ?auto_131682 ?auto_131683 ) ( ON ?auto_131681 ?auto_131682 ) ( ON ?auto_131680 ?auto_131681 ) ( ON ?auto_131679 ?auto_131680 ) ( CLEAR ?auto_131677 ) ( ON ?auto_131678 ?auto_131679 ) ( CLEAR ?auto_131678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131675 ?auto_131676 ?auto_131677 ?auto_131678 )
      ( MAKE-9PILE ?auto_131675 ?auto_131676 ?auto_131677 ?auto_131678 ?auto_131679 ?auto_131680 ?auto_131681 ?auto_131682 ?auto_131683 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_131713 - BLOCK
      ?auto_131714 - BLOCK
      ?auto_131715 - BLOCK
      ?auto_131716 - BLOCK
      ?auto_131717 - BLOCK
      ?auto_131718 - BLOCK
      ?auto_131719 - BLOCK
      ?auto_131720 - BLOCK
      ?auto_131721 - BLOCK
    )
    :vars
    (
      ?auto_131722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131721 ?auto_131722 ) ( ON-TABLE ?auto_131713 ) ( ON ?auto_131714 ?auto_131713 ) ( not ( = ?auto_131713 ?auto_131714 ) ) ( not ( = ?auto_131713 ?auto_131715 ) ) ( not ( = ?auto_131713 ?auto_131716 ) ) ( not ( = ?auto_131713 ?auto_131717 ) ) ( not ( = ?auto_131713 ?auto_131718 ) ) ( not ( = ?auto_131713 ?auto_131719 ) ) ( not ( = ?auto_131713 ?auto_131720 ) ) ( not ( = ?auto_131713 ?auto_131721 ) ) ( not ( = ?auto_131713 ?auto_131722 ) ) ( not ( = ?auto_131714 ?auto_131715 ) ) ( not ( = ?auto_131714 ?auto_131716 ) ) ( not ( = ?auto_131714 ?auto_131717 ) ) ( not ( = ?auto_131714 ?auto_131718 ) ) ( not ( = ?auto_131714 ?auto_131719 ) ) ( not ( = ?auto_131714 ?auto_131720 ) ) ( not ( = ?auto_131714 ?auto_131721 ) ) ( not ( = ?auto_131714 ?auto_131722 ) ) ( not ( = ?auto_131715 ?auto_131716 ) ) ( not ( = ?auto_131715 ?auto_131717 ) ) ( not ( = ?auto_131715 ?auto_131718 ) ) ( not ( = ?auto_131715 ?auto_131719 ) ) ( not ( = ?auto_131715 ?auto_131720 ) ) ( not ( = ?auto_131715 ?auto_131721 ) ) ( not ( = ?auto_131715 ?auto_131722 ) ) ( not ( = ?auto_131716 ?auto_131717 ) ) ( not ( = ?auto_131716 ?auto_131718 ) ) ( not ( = ?auto_131716 ?auto_131719 ) ) ( not ( = ?auto_131716 ?auto_131720 ) ) ( not ( = ?auto_131716 ?auto_131721 ) ) ( not ( = ?auto_131716 ?auto_131722 ) ) ( not ( = ?auto_131717 ?auto_131718 ) ) ( not ( = ?auto_131717 ?auto_131719 ) ) ( not ( = ?auto_131717 ?auto_131720 ) ) ( not ( = ?auto_131717 ?auto_131721 ) ) ( not ( = ?auto_131717 ?auto_131722 ) ) ( not ( = ?auto_131718 ?auto_131719 ) ) ( not ( = ?auto_131718 ?auto_131720 ) ) ( not ( = ?auto_131718 ?auto_131721 ) ) ( not ( = ?auto_131718 ?auto_131722 ) ) ( not ( = ?auto_131719 ?auto_131720 ) ) ( not ( = ?auto_131719 ?auto_131721 ) ) ( not ( = ?auto_131719 ?auto_131722 ) ) ( not ( = ?auto_131720 ?auto_131721 ) ) ( not ( = ?auto_131720 ?auto_131722 ) ) ( not ( = ?auto_131721 ?auto_131722 ) ) ( ON ?auto_131720 ?auto_131721 ) ( ON ?auto_131719 ?auto_131720 ) ( ON ?auto_131718 ?auto_131719 ) ( ON ?auto_131717 ?auto_131718 ) ( ON ?auto_131716 ?auto_131717 ) ( CLEAR ?auto_131714 ) ( ON ?auto_131715 ?auto_131716 ) ( CLEAR ?auto_131715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131713 ?auto_131714 ?auto_131715 )
      ( MAKE-9PILE ?auto_131713 ?auto_131714 ?auto_131715 ?auto_131716 ?auto_131717 ?auto_131718 ?auto_131719 ?auto_131720 ?auto_131721 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_131751 - BLOCK
      ?auto_131752 - BLOCK
      ?auto_131753 - BLOCK
      ?auto_131754 - BLOCK
      ?auto_131755 - BLOCK
      ?auto_131756 - BLOCK
      ?auto_131757 - BLOCK
      ?auto_131758 - BLOCK
      ?auto_131759 - BLOCK
    )
    :vars
    (
      ?auto_131760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131759 ?auto_131760 ) ( ON-TABLE ?auto_131751 ) ( not ( = ?auto_131751 ?auto_131752 ) ) ( not ( = ?auto_131751 ?auto_131753 ) ) ( not ( = ?auto_131751 ?auto_131754 ) ) ( not ( = ?auto_131751 ?auto_131755 ) ) ( not ( = ?auto_131751 ?auto_131756 ) ) ( not ( = ?auto_131751 ?auto_131757 ) ) ( not ( = ?auto_131751 ?auto_131758 ) ) ( not ( = ?auto_131751 ?auto_131759 ) ) ( not ( = ?auto_131751 ?auto_131760 ) ) ( not ( = ?auto_131752 ?auto_131753 ) ) ( not ( = ?auto_131752 ?auto_131754 ) ) ( not ( = ?auto_131752 ?auto_131755 ) ) ( not ( = ?auto_131752 ?auto_131756 ) ) ( not ( = ?auto_131752 ?auto_131757 ) ) ( not ( = ?auto_131752 ?auto_131758 ) ) ( not ( = ?auto_131752 ?auto_131759 ) ) ( not ( = ?auto_131752 ?auto_131760 ) ) ( not ( = ?auto_131753 ?auto_131754 ) ) ( not ( = ?auto_131753 ?auto_131755 ) ) ( not ( = ?auto_131753 ?auto_131756 ) ) ( not ( = ?auto_131753 ?auto_131757 ) ) ( not ( = ?auto_131753 ?auto_131758 ) ) ( not ( = ?auto_131753 ?auto_131759 ) ) ( not ( = ?auto_131753 ?auto_131760 ) ) ( not ( = ?auto_131754 ?auto_131755 ) ) ( not ( = ?auto_131754 ?auto_131756 ) ) ( not ( = ?auto_131754 ?auto_131757 ) ) ( not ( = ?auto_131754 ?auto_131758 ) ) ( not ( = ?auto_131754 ?auto_131759 ) ) ( not ( = ?auto_131754 ?auto_131760 ) ) ( not ( = ?auto_131755 ?auto_131756 ) ) ( not ( = ?auto_131755 ?auto_131757 ) ) ( not ( = ?auto_131755 ?auto_131758 ) ) ( not ( = ?auto_131755 ?auto_131759 ) ) ( not ( = ?auto_131755 ?auto_131760 ) ) ( not ( = ?auto_131756 ?auto_131757 ) ) ( not ( = ?auto_131756 ?auto_131758 ) ) ( not ( = ?auto_131756 ?auto_131759 ) ) ( not ( = ?auto_131756 ?auto_131760 ) ) ( not ( = ?auto_131757 ?auto_131758 ) ) ( not ( = ?auto_131757 ?auto_131759 ) ) ( not ( = ?auto_131757 ?auto_131760 ) ) ( not ( = ?auto_131758 ?auto_131759 ) ) ( not ( = ?auto_131758 ?auto_131760 ) ) ( not ( = ?auto_131759 ?auto_131760 ) ) ( ON ?auto_131758 ?auto_131759 ) ( ON ?auto_131757 ?auto_131758 ) ( ON ?auto_131756 ?auto_131757 ) ( ON ?auto_131755 ?auto_131756 ) ( ON ?auto_131754 ?auto_131755 ) ( ON ?auto_131753 ?auto_131754 ) ( CLEAR ?auto_131751 ) ( ON ?auto_131752 ?auto_131753 ) ( CLEAR ?auto_131752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131751 ?auto_131752 )
      ( MAKE-9PILE ?auto_131751 ?auto_131752 ?auto_131753 ?auto_131754 ?auto_131755 ?auto_131756 ?auto_131757 ?auto_131758 ?auto_131759 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_131789 - BLOCK
      ?auto_131790 - BLOCK
      ?auto_131791 - BLOCK
      ?auto_131792 - BLOCK
      ?auto_131793 - BLOCK
      ?auto_131794 - BLOCK
      ?auto_131795 - BLOCK
      ?auto_131796 - BLOCK
      ?auto_131797 - BLOCK
    )
    :vars
    (
      ?auto_131798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131797 ?auto_131798 ) ( not ( = ?auto_131789 ?auto_131790 ) ) ( not ( = ?auto_131789 ?auto_131791 ) ) ( not ( = ?auto_131789 ?auto_131792 ) ) ( not ( = ?auto_131789 ?auto_131793 ) ) ( not ( = ?auto_131789 ?auto_131794 ) ) ( not ( = ?auto_131789 ?auto_131795 ) ) ( not ( = ?auto_131789 ?auto_131796 ) ) ( not ( = ?auto_131789 ?auto_131797 ) ) ( not ( = ?auto_131789 ?auto_131798 ) ) ( not ( = ?auto_131790 ?auto_131791 ) ) ( not ( = ?auto_131790 ?auto_131792 ) ) ( not ( = ?auto_131790 ?auto_131793 ) ) ( not ( = ?auto_131790 ?auto_131794 ) ) ( not ( = ?auto_131790 ?auto_131795 ) ) ( not ( = ?auto_131790 ?auto_131796 ) ) ( not ( = ?auto_131790 ?auto_131797 ) ) ( not ( = ?auto_131790 ?auto_131798 ) ) ( not ( = ?auto_131791 ?auto_131792 ) ) ( not ( = ?auto_131791 ?auto_131793 ) ) ( not ( = ?auto_131791 ?auto_131794 ) ) ( not ( = ?auto_131791 ?auto_131795 ) ) ( not ( = ?auto_131791 ?auto_131796 ) ) ( not ( = ?auto_131791 ?auto_131797 ) ) ( not ( = ?auto_131791 ?auto_131798 ) ) ( not ( = ?auto_131792 ?auto_131793 ) ) ( not ( = ?auto_131792 ?auto_131794 ) ) ( not ( = ?auto_131792 ?auto_131795 ) ) ( not ( = ?auto_131792 ?auto_131796 ) ) ( not ( = ?auto_131792 ?auto_131797 ) ) ( not ( = ?auto_131792 ?auto_131798 ) ) ( not ( = ?auto_131793 ?auto_131794 ) ) ( not ( = ?auto_131793 ?auto_131795 ) ) ( not ( = ?auto_131793 ?auto_131796 ) ) ( not ( = ?auto_131793 ?auto_131797 ) ) ( not ( = ?auto_131793 ?auto_131798 ) ) ( not ( = ?auto_131794 ?auto_131795 ) ) ( not ( = ?auto_131794 ?auto_131796 ) ) ( not ( = ?auto_131794 ?auto_131797 ) ) ( not ( = ?auto_131794 ?auto_131798 ) ) ( not ( = ?auto_131795 ?auto_131796 ) ) ( not ( = ?auto_131795 ?auto_131797 ) ) ( not ( = ?auto_131795 ?auto_131798 ) ) ( not ( = ?auto_131796 ?auto_131797 ) ) ( not ( = ?auto_131796 ?auto_131798 ) ) ( not ( = ?auto_131797 ?auto_131798 ) ) ( ON ?auto_131796 ?auto_131797 ) ( ON ?auto_131795 ?auto_131796 ) ( ON ?auto_131794 ?auto_131795 ) ( ON ?auto_131793 ?auto_131794 ) ( ON ?auto_131792 ?auto_131793 ) ( ON ?auto_131791 ?auto_131792 ) ( ON ?auto_131790 ?auto_131791 ) ( ON ?auto_131789 ?auto_131790 ) ( CLEAR ?auto_131789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131789 )
      ( MAKE-9PILE ?auto_131789 ?auto_131790 ?auto_131791 ?auto_131792 ?auto_131793 ?auto_131794 ?auto_131795 ?auto_131796 ?auto_131797 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_131828 - BLOCK
      ?auto_131829 - BLOCK
      ?auto_131830 - BLOCK
      ?auto_131831 - BLOCK
      ?auto_131832 - BLOCK
      ?auto_131833 - BLOCK
      ?auto_131834 - BLOCK
      ?auto_131835 - BLOCK
      ?auto_131836 - BLOCK
      ?auto_131837 - BLOCK
    )
    :vars
    (
      ?auto_131838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_131836 ) ( ON ?auto_131837 ?auto_131838 ) ( CLEAR ?auto_131837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131828 ) ( ON ?auto_131829 ?auto_131828 ) ( ON ?auto_131830 ?auto_131829 ) ( ON ?auto_131831 ?auto_131830 ) ( ON ?auto_131832 ?auto_131831 ) ( ON ?auto_131833 ?auto_131832 ) ( ON ?auto_131834 ?auto_131833 ) ( ON ?auto_131835 ?auto_131834 ) ( ON ?auto_131836 ?auto_131835 ) ( not ( = ?auto_131828 ?auto_131829 ) ) ( not ( = ?auto_131828 ?auto_131830 ) ) ( not ( = ?auto_131828 ?auto_131831 ) ) ( not ( = ?auto_131828 ?auto_131832 ) ) ( not ( = ?auto_131828 ?auto_131833 ) ) ( not ( = ?auto_131828 ?auto_131834 ) ) ( not ( = ?auto_131828 ?auto_131835 ) ) ( not ( = ?auto_131828 ?auto_131836 ) ) ( not ( = ?auto_131828 ?auto_131837 ) ) ( not ( = ?auto_131828 ?auto_131838 ) ) ( not ( = ?auto_131829 ?auto_131830 ) ) ( not ( = ?auto_131829 ?auto_131831 ) ) ( not ( = ?auto_131829 ?auto_131832 ) ) ( not ( = ?auto_131829 ?auto_131833 ) ) ( not ( = ?auto_131829 ?auto_131834 ) ) ( not ( = ?auto_131829 ?auto_131835 ) ) ( not ( = ?auto_131829 ?auto_131836 ) ) ( not ( = ?auto_131829 ?auto_131837 ) ) ( not ( = ?auto_131829 ?auto_131838 ) ) ( not ( = ?auto_131830 ?auto_131831 ) ) ( not ( = ?auto_131830 ?auto_131832 ) ) ( not ( = ?auto_131830 ?auto_131833 ) ) ( not ( = ?auto_131830 ?auto_131834 ) ) ( not ( = ?auto_131830 ?auto_131835 ) ) ( not ( = ?auto_131830 ?auto_131836 ) ) ( not ( = ?auto_131830 ?auto_131837 ) ) ( not ( = ?auto_131830 ?auto_131838 ) ) ( not ( = ?auto_131831 ?auto_131832 ) ) ( not ( = ?auto_131831 ?auto_131833 ) ) ( not ( = ?auto_131831 ?auto_131834 ) ) ( not ( = ?auto_131831 ?auto_131835 ) ) ( not ( = ?auto_131831 ?auto_131836 ) ) ( not ( = ?auto_131831 ?auto_131837 ) ) ( not ( = ?auto_131831 ?auto_131838 ) ) ( not ( = ?auto_131832 ?auto_131833 ) ) ( not ( = ?auto_131832 ?auto_131834 ) ) ( not ( = ?auto_131832 ?auto_131835 ) ) ( not ( = ?auto_131832 ?auto_131836 ) ) ( not ( = ?auto_131832 ?auto_131837 ) ) ( not ( = ?auto_131832 ?auto_131838 ) ) ( not ( = ?auto_131833 ?auto_131834 ) ) ( not ( = ?auto_131833 ?auto_131835 ) ) ( not ( = ?auto_131833 ?auto_131836 ) ) ( not ( = ?auto_131833 ?auto_131837 ) ) ( not ( = ?auto_131833 ?auto_131838 ) ) ( not ( = ?auto_131834 ?auto_131835 ) ) ( not ( = ?auto_131834 ?auto_131836 ) ) ( not ( = ?auto_131834 ?auto_131837 ) ) ( not ( = ?auto_131834 ?auto_131838 ) ) ( not ( = ?auto_131835 ?auto_131836 ) ) ( not ( = ?auto_131835 ?auto_131837 ) ) ( not ( = ?auto_131835 ?auto_131838 ) ) ( not ( = ?auto_131836 ?auto_131837 ) ) ( not ( = ?auto_131836 ?auto_131838 ) ) ( not ( = ?auto_131837 ?auto_131838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131837 ?auto_131838 )
      ( !STACK ?auto_131837 ?auto_131836 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_131870 - BLOCK
      ?auto_131871 - BLOCK
      ?auto_131872 - BLOCK
      ?auto_131873 - BLOCK
      ?auto_131874 - BLOCK
      ?auto_131875 - BLOCK
      ?auto_131876 - BLOCK
      ?auto_131877 - BLOCK
      ?auto_131878 - BLOCK
      ?auto_131879 - BLOCK
    )
    :vars
    (
      ?auto_131880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131879 ?auto_131880 ) ( ON-TABLE ?auto_131870 ) ( ON ?auto_131871 ?auto_131870 ) ( ON ?auto_131872 ?auto_131871 ) ( ON ?auto_131873 ?auto_131872 ) ( ON ?auto_131874 ?auto_131873 ) ( ON ?auto_131875 ?auto_131874 ) ( ON ?auto_131876 ?auto_131875 ) ( ON ?auto_131877 ?auto_131876 ) ( not ( = ?auto_131870 ?auto_131871 ) ) ( not ( = ?auto_131870 ?auto_131872 ) ) ( not ( = ?auto_131870 ?auto_131873 ) ) ( not ( = ?auto_131870 ?auto_131874 ) ) ( not ( = ?auto_131870 ?auto_131875 ) ) ( not ( = ?auto_131870 ?auto_131876 ) ) ( not ( = ?auto_131870 ?auto_131877 ) ) ( not ( = ?auto_131870 ?auto_131878 ) ) ( not ( = ?auto_131870 ?auto_131879 ) ) ( not ( = ?auto_131870 ?auto_131880 ) ) ( not ( = ?auto_131871 ?auto_131872 ) ) ( not ( = ?auto_131871 ?auto_131873 ) ) ( not ( = ?auto_131871 ?auto_131874 ) ) ( not ( = ?auto_131871 ?auto_131875 ) ) ( not ( = ?auto_131871 ?auto_131876 ) ) ( not ( = ?auto_131871 ?auto_131877 ) ) ( not ( = ?auto_131871 ?auto_131878 ) ) ( not ( = ?auto_131871 ?auto_131879 ) ) ( not ( = ?auto_131871 ?auto_131880 ) ) ( not ( = ?auto_131872 ?auto_131873 ) ) ( not ( = ?auto_131872 ?auto_131874 ) ) ( not ( = ?auto_131872 ?auto_131875 ) ) ( not ( = ?auto_131872 ?auto_131876 ) ) ( not ( = ?auto_131872 ?auto_131877 ) ) ( not ( = ?auto_131872 ?auto_131878 ) ) ( not ( = ?auto_131872 ?auto_131879 ) ) ( not ( = ?auto_131872 ?auto_131880 ) ) ( not ( = ?auto_131873 ?auto_131874 ) ) ( not ( = ?auto_131873 ?auto_131875 ) ) ( not ( = ?auto_131873 ?auto_131876 ) ) ( not ( = ?auto_131873 ?auto_131877 ) ) ( not ( = ?auto_131873 ?auto_131878 ) ) ( not ( = ?auto_131873 ?auto_131879 ) ) ( not ( = ?auto_131873 ?auto_131880 ) ) ( not ( = ?auto_131874 ?auto_131875 ) ) ( not ( = ?auto_131874 ?auto_131876 ) ) ( not ( = ?auto_131874 ?auto_131877 ) ) ( not ( = ?auto_131874 ?auto_131878 ) ) ( not ( = ?auto_131874 ?auto_131879 ) ) ( not ( = ?auto_131874 ?auto_131880 ) ) ( not ( = ?auto_131875 ?auto_131876 ) ) ( not ( = ?auto_131875 ?auto_131877 ) ) ( not ( = ?auto_131875 ?auto_131878 ) ) ( not ( = ?auto_131875 ?auto_131879 ) ) ( not ( = ?auto_131875 ?auto_131880 ) ) ( not ( = ?auto_131876 ?auto_131877 ) ) ( not ( = ?auto_131876 ?auto_131878 ) ) ( not ( = ?auto_131876 ?auto_131879 ) ) ( not ( = ?auto_131876 ?auto_131880 ) ) ( not ( = ?auto_131877 ?auto_131878 ) ) ( not ( = ?auto_131877 ?auto_131879 ) ) ( not ( = ?auto_131877 ?auto_131880 ) ) ( not ( = ?auto_131878 ?auto_131879 ) ) ( not ( = ?auto_131878 ?auto_131880 ) ) ( not ( = ?auto_131879 ?auto_131880 ) ) ( CLEAR ?auto_131877 ) ( ON ?auto_131878 ?auto_131879 ) ( CLEAR ?auto_131878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_131870 ?auto_131871 ?auto_131872 ?auto_131873 ?auto_131874 ?auto_131875 ?auto_131876 ?auto_131877 ?auto_131878 )
      ( MAKE-10PILE ?auto_131870 ?auto_131871 ?auto_131872 ?auto_131873 ?auto_131874 ?auto_131875 ?auto_131876 ?auto_131877 ?auto_131878 ?auto_131879 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_131912 - BLOCK
      ?auto_131913 - BLOCK
      ?auto_131914 - BLOCK
      ?auto_131915 - BLOCK
      ?auto_131916 - BLOCK
      ?auto_131917 - BLOCK
      ?auto_131918 - BLOCK
      ?auto_131919 - BLOCK
      ?auto_131920 - BLOCK
      ?auto_131921 - BLOCK
    )
    :vars
    (
      ?auto_131922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131921 ?auto_131922 ) ( ON-TABLE ?auto_131912 ) ( ON ?auto_131913 ?auto_131912 ) ( ON ?auto_131914 ?auto_131913 ) ( ON ?auto_131915 ?auto_131914 ) ( ON ?auto_131916 ?auto_131915 ) ( ON ?auto_131917 ?auto_131916 ) ( ON ?auto_131918 ?auto_131917 ) ( not ( = ?auto_131912 ?auto_131913 ) ) ( not ( = ?auto_131912 ?auto_131914 ) ) ( not ( = ?auto_131912 ?auto_131915 ) ) ( not ( = ?auto_131912 ?auto_131916 ) ) ( not ( = ?auto_131912 ?auto_131917 ) ) ( not ( = ?auto_131912 ?auto_131918 ) ) ( not ( = ?auto_131912 ?auto_131919 ) ) ( not ( = ?auto_131912 ?auto_131920 ) ) ( not ( = ?auto_131912 ?auto_131921 ) ) ( not ( = ?auto_131912 ?auto_131922 ) ) ( not ( = ?auto_131913 ?auto_131914 ) ) ( not ( = ?auto_131913 ?auto_131915 ) ) ( not ( = ?auto_131913 ?auto_131916 ) ) ( not ( = ?auto_131913 ?auto_131917 ) ) ( not ( = ?auto_131913 ?auto_131918 ) ) ( not ( = ?auto_131913 ?auto_131919 ) ) ( not ( = ?auto_131913 ?auto_131920 ) ) ( not ( = ?auto_131913 ?auto_131921 ) ) ( not ( = ?auto_131913 ?auto_131922 ) ) ( not ( = ?auto_131914 ?auto_131915 ) ) ( not ( = ?auto_131914 ?auto_131916 ) ) ( not ( = ?auto_131914 ?auto_131917 ) ) ( not ( = ?auto_131914 ?auto_131918 ) ) ( not ( = ?auto_131914 ?auto_131919 ) ) ( not ( = ?auto_131914 ?auto_131920 ) ) ( not ( = ?auto_131914 ?auto_131921 ) ) ( not ( = ?auto_131914 ?auto_131922 ) ) ( not ( = ?auto_131915 ?auto_131916 ) ) ( not ( = ?auto_131915 ?auto_131917 ) ) ( not ( = ?auto_131915 ?auto_131918 ) ) ( not ( = ?auto_131915 ?auto_131919 ) ) ( not ( = ?auto_131915 ?auto_131920 ) ) ( not ( = ?auto_131915 ?auto_131921 ) ) ( not ( = ?auto_131915 ?auto_131922 ) ) ( not ( = ?auto_131916 ?auto_131917 ) ) ( not ( = ?auto_131916 ?auto_131918 ) ) ( not ( = ?auto_131916 ?auto_131919 ) ) ( not ( = ?auto_131916 ?auto_131920 ) ) ( not ( = ?auto_131916 ?auto_131921 ) ) ( not ( = ?auto_131916 ?auto_131922 ) ) ( not ( = ?auto_131917 ?auto_131918 ) ) ( not ( = ?auto_131917 ?auto_131919 ) ) ( not ( = ?auto_131917 ?auto_131920 ) ) ( not ( = ?auto_131917 ?auto_131921 ) ) ( not ( = ?auto_131917 ?auto_131922 ) ) ( not ( = ?auto_131918 ?auto_131919 ) ) ( not ( = ?auto_131918 ?auto_131920 ) ) ( not ( = ?auto_131918 ?auto_131921 ) ) ( not ( = ?auto_131918 ?auto_131922 ) ) ( not ( = ?auto_131919 ?auto_131920 ) ) ( not ( = ?auto_131919 ?auto_131921 ) ) ( not ( = ?auto_131919 ?auto_131922 ) ) ( not ( = ?auto_131920 ?auto_131921 ) ) ( not ( = ?auto_131920 ?auto_131922 ) ) ( not ( = ?auto_131921 ?auto_131922 ) ) ( ON ?auto_131920 ?auto_131921 ) ( CLEAR ?auto_131918 ) ( ON ?auto_131919 ?auto_131920 ) ( CLEAR ?auto_131919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_131912 ?auto_131913 ?auto_131914 ?auto_131915 ?auto_131916 ?auto_131917 ?auto_131918 ?auto_131919 )
      ( MAKE-10PILE ?auto_131912 ?auto_131913 ?auto_131914 ?auto_131915 ?auto_131916 ?auto_131917 ?auto_131918 ?auto_131919 ?auto_131920 ?auto_131921 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_131954 - BLOCK
      ?auto_131955 - BLOCK
      ?auto_131956 - BLOCK
      ?auto_131957 - BLOCK
      ?auto_131958 - BLOCK
      ?auto_131959 - BLOCK
      ?auto_131960 - BLOCK
      ?auto_131961 - BLOCK
      ?auto_131962 - BLOCK
      ?auto_131963 - BLOCK
    )
    :vars
    (
      ?auto_131964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131963 ?auto_131964 ) ( ON-TABLE ?auto_131954 ) ( ON ?auto_131955 ?auto_131954 ) ( ON ?auto_131956 ?auto_131955 ) ( ON ?auto_131957 ?auto_131956 ) ( ON ?auto_131958 ?auto_131957 ) ( ON ?auto_131959 ?auto_131958 ) ( not ( = ?auto_131954 ?auto_131955 ) ) ( not ( = ?auto_131954 ?auto_131956 ) ) ( not ( = ?auto_131954 ?auto_131957 ) ) ( not ( = ?auto_131954 ?auto_131958 ) ) ( not ( = ?auto_131954 ?auto_131959 ) ) ( not ( = ?auto_131954 ?auto_131960 ) ) ( not ( = ?auto_131954 ?auto_131961 ) ) ( not ( = ?auto_131954 ?auto_131962 ) ) ( not ( = ?auto_131954 ?auto_131963 ) ) ( not ( = ?auto_131954 ?auto_131964 ) ) ( not ( = ?auto_131955 ?auto_131956 ) ) ( not ( = ?auto_131955 ?auto_131957 ) ) ( not ( = ?auto_131955 ?auto_131958 ) ) ( not ( = ?auto_131955 ?auto_131959 ) ) ( not ( = ?auto_131955 ?auto_131960 ) ) ( not ( = ?auto_131955 ?auto_131961 ) ) ( not ( = ?auto_131955 ?auto_131962 ) ) ( not ( = ?auto_131955 ?auto_131963 ) ) ( not ( = ?auto_131955 ?auto_131964 ) ) ( not ( = ?auto_131956 ?auto_131957 ) ) ( not ( = ?auto_131956 ?auto_131958 ) ) ( not ( = ?auto_131956 ?auto_131959 ) ) ( not ( = ?auto_131956 ?auto_131960 ) ) ( not ( = ?auto_131956 ?auto_131961 ) ) ( not ( = ?auto_131956 ?auto_131962 ) ) ( not ( = ?auto_131956 ?auto_131963 ) ) ( not ( = ?auto_131956 ?auto_131964 ) ) ( not ( = ?auto_131957 ?auto_131958 ) ) ( not ( = ?auto_131957 ?auto_131959 ) ) ( not ( = ?auto_131957 ?auto_131960 ) ) ( not ( = ?auto_131957 ?auto_131961 ) ) ( not ( = ?auto_131957 ?auto_131962 ) ) ( not ( = ?auto_131957 ?auto_131963 ) ) ( not ( = ?auto_131957 ?auto_131964 ) ) ( not ( = ?auto_131958 ?auto_131959 ) ) ( not ( = ?auto_131958 ?auto_131960 ) ) ( not ( = ?auto_131958 ?auto_131961 ) ) ( not ( = ?auto_131958 ?auto_131962 ) ) ( not ( = ?auto_131958 ?auto_131963 ) ) ( not ( = ?auto_131958 ?auto_131964 ) ) ( not ( = ?auto_131959 ?auto_131960 ) ) ( not ( = ?auto_131959 ?auto_131961 ) ) ( not ( = ?auto_131959 ?auto_131962 ) ) ( not ( = ?auto_131959 ?auto_131963 ) ) ( not ( = ?auto_131959 ?auto_131964 ) ) ( not ( = ?auto_131960 ?auto_131961 ) ) ( not ( = ?auto_131960 ?auto_131962 ) ) ( not ( = ?auto_131960 ?auto_131963 ) ) ( not ( = ?auto_131960 ?auto_131964 ) ) ( not ( = ?auto_131961 ?auto_131962 ) ) ( not ( = ?auto_131961 ?auto_131963 ) ) ( not ( = ?auto_131961 ?auto_131964 ) ) ( not ( = ?auto_131962 ?auto_131963 ) ) ( not ( = ?auto_131962 ?auto_131964 ) ) ( not ( = ?auto_131963 ?auto_131964 ) ) ( ON ?auto_131962 ?auto_131963 ) ( ON ?auto_131961 ?auto_131962 ) ( CLEAR ?auto_131959 ) ( ON ?auto_131960 ?auto_131961 ) ( CLEAR ?auto_131960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131954 ?auto_131955 ?auto_131956 ?auto_131957 ?auto_131958 ?auto_131959 ?auto_131960 )
      ( MAKE-10PILE ?auto_131954 ?auto_131955 ?auto_131956 ?auto_131957 ?auto_131958 ?auto_131959 ?auto_131960 ?auto_131961 ?auto_131962 ?auto_131963 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_131996 - BLOCK
      ?auto_131997 - BLOCK
      ?auto_131998 - BLOCK
      ?auto_131999 - BLOCK
      ?auto_132000 - BLOCK
      ?auto_132001 - BLOCK
      ?auto_132002 - BLOCK
      ?auto_132003 - BLOCK
      ?auto_132004 - BLOCK
      ?auto_132005 - BLOCK
    )
    :vars
    (
      ?auto_132006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132005 ?auto_132006 ) ( ON-TABLE ?auto_131996 ) ( ON ?auto_131997 ?auto_131996 ) ( ON ?auto_131998 ?auto_131997 ) ( ON ?auto_131999 ?auto_131998 ) ( ON ?auto_132000 ?auto_131999 ) ( not ( = ?auto_131996 ?auto_131997 ) ) ( not ( = ?auto_131996 ?auto_131998 ) ) ( not ( = ?auto_131996 ?auto_131999 ) ) ( not ( = ?auto_131996 ?auto_132000 ) ) ( not ( = ?auto_131996 ?auto_132001 ) ) ( not ( = ?auto_131996 ?auto_132002 ) ) ( not ( = ?auto_131996 ?auto_132003 ) ) ( not ( = ?auto_131996 ?auto_132004 ) ) ( not ( = ?auto_131996 ?auto_132005 ) ) ( not ( = ?auto_131996 ?auto_132006 ) ) ( not ( = ?auto_131997 ?auto_131998 ) ) ( not ( = ?auto_131997 ?auto_131999 ) ) ( not ( = ?auto_131997 ?auto_132000 ) ) ( not ( = ?auto_131997 ?auto_132001 ) ) ( not ( = ?auto_131997 ?auto_132002 ) ) ( not ( = ?auto_131997 ?auto_132003 ) ) ( not ( = ?auto_131997 ?auto_132004 ) ) ( not ( = ?auto_131997 ?auto_132005 ) ) ( not ( = ?auto_131997 ?auto_132006 ) ) ( not ( = ?auto_131998 ?auto_131999 ) ) ( not ( = ?auto_131998 ?auto_132000 ) ) ( not ( = ?auto_131998 ?auto_132001 ) ) ( not ( = ?auto_131998 ?auto_132002 ) ) ( not ( = ?auto_131998 ?auto_132003 ) ) ( not ( = ?auto_131998 ?auto_132004 ) ) ( not ( = ?auto_131998 ?auto_132005 ) ) ( not ( = ?auto_131998 ?auto_132006 ) ) ( not ( = ?auto_131999 ?auto_132000 ) ) ( not ( = ?auto_131999 ?auto_132001 ) ) ( not ( = ?auto_131999 ?auto_132002 ) ) ( not ( = ?auto_131999 ?auto_132003 ) ) ( not ( = ?auto_131999 ?auto_132004 ) ) ( not ( = ?auto_131999 ?auto_132005 ) ) ( not ( = ?auto_131999 ?auto_132006 ) ) ( not ( = ?auto_132000 ?auto_132001 ) ) ( not ( = ?auto_132000 ?auto_132002 ) ) ( not ( = ?auto_132000 ?auto_132003 ) ) ( not ( = ?auto_132000 ?auto_132004 ) ) ( not ( = ?auto_132000 ?auto_132005 ) ) ( not ( = ?auto_132000 ?auto_132006 ) ) ( not ( = ?auto_132001 ?auto_132002 ) ) ( not ( = ?auto_132001 ?auto_132003 ) ) ( not ( = ?auto_132001 ?auto_132004 ) ) ( not ( = ?auto_132001 ?auto_132005 ) ) ( not ( = ?auto_132001 ?auto_132006 ) ) ( not ( = ?auto_132002 ?auto_132003 ) ) ( not ( = ?auto_132002 ?auto_132004 ) ) ( not ( = ?auto_132002 ?auto_132005 ) ) ( not ( = ?auto_132002 ?auto_132006 ) ) ( not ( = ?auto_132003 ?auto_132004 ) ) ( not ( = ?auto_132003 ?auto_132005 ) ) ( not ( = ?auto_132003 ?auto_132006 ) ) ( not ( = ?auto_132004 ?auto_132005 ) ) ( not ( = ?auto_132004 ?auto_132006 ) ) ( not ( = ?auto_132005 ?auto_132006 ) ) ( ON ?auto_132004 ?auto_132005 ) ( ON ?auto_132003 ?auto_132004 ) ( ON ?auto_132002 ?auto_132003 ) ( CLEAR ?auto_132000 ) ( ON ?auto_132001 ?auto_132002 ) ( CLEAR ?auto_132001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131996 ?auto_131997 ?auto_131998 ?auto_131999 ?auto_132000 ?auto_132001 )
      ( MAKE-10PILE ?auto_131996 ?auto_131997 ?auto_131998 ?auto_131999 ?auto_132000 ?auto_132001 ?auto_132002 ?auto_132003 ?auto_132004 ?auto_132005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_132038 - BLOCK
      ?auto_132039 - BLOCK
      ?auto_132040 - BLOCK
      ?auto_132041 - BLOCK
      ?auto_132042 - BLOCK
      ?auto_132043 - BLOCK
      ?auto_132044 - BLOCK
      ?auto_132045 - BLOCK
      ?auto_132046 - BLOCK
      ?auto_132047 - BLOCK
    )
    :vars
    (
      ?auto_132048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132047 ?auto_132048 ) ( ON-TABLE ?auto_132038 ) ( ON ?auto_132039 ?auto_132038 ) ( ON ?auto_132040 ?auto_132039 ) ( ON ?auto_132041 ?auto_132040 ) ( not ( = ?auto_132038 ?auto_132039 ) ) ( not ( = ?auto_132038 ?auto_132040 ) ) ( not ( = ?auto_132038 ?auto_132041 ) ) ( not ( = ?auto_132038 ?auto_132042 ) ) ( not ( = ?auto_132038 ?auto_132043 ) ) ( not ( = ?auto_132038 ?auto_132044 ) ) ( not ( = ?auto_132038 ?auto_132045 ) ) ( not ( = ?auto_132038 ?auto_132046 ) ) ( not ( = ?auto_132038 ?auto_132047 ) ) ( not ( = ?auto_132038 ?auto_132048 ) ) ( not ( = ?auto_132039 ?auto_132040 ) ) ( not ( = ?auto_132039 ?auto_132041 ) ) ( not ( = ?auto_132039 ?auto_132042 ) ) ( not ( = ?auto_132039 ?auto_132043 ) ) ( not ( = ?auto_132039 ?auto_132044 ) ) ( not ( = ?auto_132039 ?auto_132045 ) ) ( not ( = ?auto_132039 ?auto_132046 ) ) ( not ( = ?auto_132039 ?auto_132047 ) ) ( not ( = ?auto_132039 ?auto_132048 ) ) ( not ( = ?auto_132040 ?auto_132041 ) ) ( not ( = ?auto_132040 ?auto_132042 ) ) ( not ( = ?auto_132040 ?auto_132043 ) ) ( not ( = ?auto_132040 ?auto_132044 ) ) ( not ( = ?auto_132040 ?auto_132045 ) ) ( not ( = ?auto_132040 ?auto_132046 ) ) ( not ( = ?auto_132040 ?auto_132047 ) ) ( not ( = ?auto_132040 ?auto_132048 ) ) ( not ( = ?auto_132041 ?auto_132042 ) ) ( not ( = ?auto_132041 ?auto_132043 ) ) ( not ( = ?auto_132041 ?auto_132044 ) ) ( not ( = ?auto_132041 ?auto_132045 ) ) ( not ( = ?auto_132041 ?auto_132046 ) ) ( not ( = ?auto_132041 ?auto_132047 ) ) ( not ( = ?auto_132041 ?auto_132048 ) ) ( not ( = ?auto_132042 ?auto_132043 ) ) ( not ( = ?auto_132042 ?auto_132044 ) ) ( not ( = ?auto_132042 ?auto_132045 ) ) ( not ( = ?auto_132042 ?auto_132046 ) ) ( not ( = ?auto_132042 ?auto_132047 ) ) ( not ( = ?auto_132042 ?auto_132048 ) ) ( not ( = ?auto_132043 ?auto_132044 ) ) ( not ( = ?auto_132043 ?auto_132045 ) ) ( not ( = ?auto_132043 ?auto_132046 ) ) ( not ( = ?auto_132043 ?auto_132047 ) ) ( not ( = ?auto_132043 ?auto_132048 ) ) ( not ( = ?auto_132044 ?auto_132045 ) ) ( not ( = ?auto_132044 ?auto_132046 ) ) ( not ( = ?auto_132044 ?auto_132047 ) ) ( not ( = ?auto_132044 ?auto_132048 ) ) ( not ( = ?auto_132045 ?auto_132046 ) ) ( not ( = ?auto_132045 ?auto_132047 ) ) ( not ( = ?auto_132045 ?auto_132048 ) ) ( not ( = ?auto_132046 ?auto_132047 ) ) ( not ( = ?auto_132046 ?auto_132048 ) ) ( not ( = ?auto_132047 ?auto_132048 ) ) ( ON ?auto_132046 ?auto_132047 ) ( ON ?auto_132045 ?auto_132046 ) ( ON ?auto_132044 ?auto_132045 ) ( ON ?auto_132043 ?auto_132044 ) ( CLEAR ?auto_132041 ) ( ON ?auto_132042 ?auto_132043 ) ( CLEAR ?auto_132042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132038 ?auto_132039 ?auto_132040 ?auto_132041 ?auto_132042 )
      ( MAKE-10PILE ?auto_132038 ?auto_132039 ?auto_132040 ?auto_132041 ?auto_132042 ?auto_132043 ?auto_132044 ?auto_132045 ?auto_132046 ?auto_132047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_132080 - BLOCK
      ?auto_132081 - BLOCK
      ?auto_132082 - BLOCK
      ?auto_132083 - BLOCK
      ?auto_132084 - BLOCK
      ?auto_132085 - BLOCK
      ?auto_132086 - BLOCK
      ?auto_132087 - BLOCK
      ?auto_132088 - BLOCK
      ?auto_132089 - BLOCK
    )
    :vars
    (
      ?auto_132090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132089 ?auto_132090 ) ( ON-TABLE ?auto_132080 ) ( ON ?auto_132081 ?auto_132080 ) ( ON ?auto_132082 ?auto_132081 ) ( not ( = ?auto_132080 ?auto_132081 ) ) ( not ( = ?auto_132080 ?auto_132082 ) ) ( not ( = ?auto_132080 ?auto_132083 ) ) ( not ( = ?auto_132080 ?auto_132084 ) ) ( not ( = ?auto_132080 ?auto_132085 ) ) ( not ( = ?auto_132080 ?auto_132086 ) ) ( not ( = ?auto_132080 ?auto_132087 ) ) ( not ( = ?auto_132080 ?auto_132088 ) ) ( not ( = ?auto_132080 ?auto_132089 ) ) ( not ( = ?auto_132080 ?auto_132090 ) ) ( not ( = ?auto_132081 ?auto_132082 ) ) ( not ( = ?auto_132081 ?auto_132083 ) ) ( not ( = ?auto_132081 ?auto_132084 ) ) ( not ( = ?auto_132081 ?auto_132085 ) ) ( not ( = ?auto_132081 ?auto_132086 ) ) ( not ( = ?auto_132081 ?auto_132087 ) ) ( not ( = ?auto_132081 ?auto_132088 ) ) ( not ( = ?auto_132081 ?auto_132089 ) ) ( not ( = ?auto_132081 ?auto_132090 ) ) ( not ( = ?auto_132082 ?auto_132083 ) ) ( not ( = ?auto_132082 ?auto_132084 ) ) ( not ( = ?auto_132082 ?auto_132085 ) ) ( not ( = ?auto_132082 ?auto_132086 ) ) ( not ( = ?auto_132082 ?auto_132087 ) ) ( not ( = ?auto_132082 ?auto_132088 ) ) ( not ( = ?auto_132082 ?auto_132089 ) ) ( not ( = ?auto_132082 ?auto_132090 ) ) ( not ( = ?auto_132083 ?auto_132084 ) ) ( not ( = ?auto_132083 ?auto_132085 ) ) ( not ( = ?auto_132083 ?auto_132086 ) ) ( not ( = ?auto_132083 ?auto_132087 ) ) ( not ( = ?auto_132083 ?auto_132088 ) ) ( not ( = ?auto_132083 ?auto_132089 ) ) ( not ( = ?auto_132083 ?auto_132090 ) ) ( not ( = ?auto_132084 ?auto_132085 ) ) ( not ( = ?auto_132084 ?auto_132086 ) ) ( not ( = ?auto_132084 ?auto_132087 ) ) ( not ( = ?auto_132084 ?auto_132088 ) ) ( not ( = ?auto_132084 ?auto_132089 ) ) ( not ( = ?auto_132084 ?auto_132090 ) ) ( not ( = ?auto_132085 ?auto_132086 ) ) ( not ( = ?auto_132085 ?auto_132087 ) ) ( not ( = ?auto_132085 ?auto_132088 ) ) ( not ( = ?auto_132085 ?auto_132089 ) ) ( not ( = ?auto_132085 ?auto_132090 ) ) ( not ( = ?auto_132086 ?auto_132087 ) ) ( not ( = ?auto_132086 ?auto_132088 ) ) ( not ( = ?auto_132086 ?auto_132089 ) ) ( not ( = ?auto_132086 ?auto_132090 ) ) ( not ( = ?auto_132087 ?auto_132088 ) ) ( not ( = ?auto_132087 ?auto_132089 ) ) ( not ( = ?auto_132087 ?auto_132090 ) ) ( not ( = ?auto_132088 ?auto_132089 ) ) ( not ( = ?auto_132088 ?auto_132090 ) ) ( not ( = ?auto_132089 ?auto_132090 ) ) ( ON ?auto_132088 ?auto_132089 ) ( ON ?auto_132087 ?auto_132088 ) ( ON ?auto_132086 ?auto_132087 ) ( ON ?auto_132085 ?auto_132086 ) ( ON ?auto_132084 ?auto_132085 ) ( CLEAR ?auto_132082 ) ( ON ?auto_132083 ?auto_132084 ) ( CLEAR ?auto_132083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132080 ?auto_132081 ?auto_132082 ?auto_132083 )
      ( MAKE-10PILE ?auto_132080 ?auto_132081 ?auto_132082 ?auto_132083 ?auto_132084 ?auto_132085 ?auto_132086 ?auto_132087 ?auto_132088 ?auto_132089 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_132122 - BLOCK
      ?auto_132123 - BLOCK
      ?auto_132124 - BLOCK
      ?auto_132125 - BLOCK
      ?auto_132126 - BLOCK
      ?auto_132127 - BLOCK
      ?auto_132128 - BLOCK
      ?auto_132129 - BLOCK
      ?auto_132130 - BLOCK
      ?auto_132131 - BLOCK
    )
    :vars
    (
      ?auto_132132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132131 ?auto_132132 ) ( ON-TABLE ?auto_132122 ) ( ON ?auto_132123 ?auto_132122 ) ( not ( = ?auto_132122 ?auto_132123 ) ) ( not ( = ?auto_132122 ?auto_132124 ) ) ( not ( = ?auto_132122 ?auto_132125 ) ) ( not ( = ?auto_132122 ?auto_132126 ) ) ( not ( = ?auto_132122 ?auto_132127 ) ) ( not ( = ?auto_132122 ?auto_132128 ) ) ( not ( = ?auto_132122 ?auto_132129 ) ) ( not ( = ?auto_132122 ?auto_132130 ) ) ( not ( = ?auto_132122 ?auto_132131 ) ) ( not ( = ?auto_132122 ?auto_132132 ) ) ( not ( = ?auto_132123 ?auto_132124 ) ) ( not ( = ?auto_132123 ?auto_132125 ) ) ( not ( = ?auto_132123 ?auto_132126 ) ) ( not ( = ?auto_132123 ?auto_132127 ) ) ( not ( = ?auto_132123 ?auto_132128 ) ) ( not ( = ?auto_132123 ?auto_132129 ) ) ( not ( = ?auto_132123 ?auto_132130 ) ) ( not ( = ?auto_132123 ?auto_132131 ) ) ( not ( = ?auto_132123 ?auto_132132 ) ) ( not ( = ?auto_132124 ?auto_132125 ) ) ( not ( = ?auto_132124 ?auto_132126 ) ) ( not ( = ?auto_132124 ?auto_132127 ) ) ( not ( = ?auto_132124 ?auto_132128 ) ) ( not ( = ?auto_132124 ?auto_132129 ) ) ( not ( = ?auto_132124 ?auto_132130 ) ) ( not ( = ?auto_132124 ?auto_132131 ) ) ( not ( = ?auto_132124 ?auto_132132 ) ) ( not ( = ?auto_132125 ?auto_132126 ) ) ( not ( = ?auto_132125 ?auto_132127 ) ) ( not ( = ?auto_132125 ?auto_132128 ) ) ( not ( = ?auto_132125 ?auto_132129 ) ) ( not ( = ?auto_132125 ?auto_132130 ) ) ( not ( = ?auto_132125 ?auto_132131 ) ) ( not ( = ?auto_132125 ?auto_132132 ) ) ( not ( = ?auto_132126 ?auto_132127 ) ) ( not ( = ?auto_132126 ?auto_132128 ) ) ( not ( = ?auto_132126 ?auto_132129 ) ) ( not ( = ?auto_132126 ?auto_132130 ) ) ( not ( = ?auto_132126 ?auto_132131 ) ) ( not ( = ?auto_132126 ?auto_132132 ) ) ( not ( = ?auto_132127 ?auto_132128 ) ) ( not ( = ?auto_132127 ?auto_132129 ) ) ( not ( = ?auto_132127 ?auto_132130 ) ) ( not ( = ?auto_132127 ?auto_132131 ) ) ( not ( = ?auto_132127 ?auto_132132 ) ) ( not ( = ?auto_132128 ?auto_132129 ) ) ( not ( = ?auto_132128 ?auto_132130 ) ) ( not ( = ?auto_132128 ?auto_132131 ) ) ( not ( = ?auto_132128 ?auto_132132 ) ) ( not ( = ?auto_132129 ?auto_132130 ) ) ( not ( = ?auto_132129 ?auto_132131 ) ) ( not ( = ?auto_132129 ?auto_132132 ) ) ( not ( = ?auto_132130 ?auto_132131 ) ) ( not ( = ?auto_132130 ?auto_132132 ) ) ( not ( = ?auto_132131 ?auto_132132 ) ) ( ON ?auto_132130 ?auto_132131 ) ( ON ?auto_132129 ?auto_132130 ) ( ON ?auto_132128 ?auto_132129 ) ( ON ?auto_132127 ?auto_132128 ) ( ON ?auto_132126 ?auto_132127 ) ( ON ?auto_132125 ?auto_132126 ) ( CLEAR ?auto_132123 ) ( ON ?auto_132124 ?auto_132125 ) ( CLEAR ?auto_132124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132122 ?auto_132123 ?auto_132124 )
      ( MAKE-10PILE ?auto_132122 ?auto_132123 ?auto_132124 ?auto_132125 ?auto_132126 ?auto_132127 ?auto_132128 ?auto_132129 ?auto_132130 ?auto_132131 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_132164 - BLOCK
      ?auto_132165 - BLOCK
      ?auto_132166 - BLOCK
      ?auto_132167 - BLOCK
      ?auto_132168 - BLOCK
      ?auto_132169 - BLOCK
      ?auto_132170 - BLOCK
      ?auto_132171 - BLOCK
      ?auto_132172 - BLOCK
      ?auto_132173 - BLOCK
    )
    :vars
    (
      ?auto_132174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132173 ?auto_132174 ) ( ON-TABLE ?auto_132164 ) ( not ( = ?auto_132164 ?auto_132165 ) ) ( not ( = ?auto_132164 ?auto_132166 ) ) ( not ( = ?auto_132164 ?auto_132167 ) ) ( not ( = ?auto_132164 ?auto_132168 ) ) ( not ( = ?auto_132164 ?auto_132169 ) ) ( not ( = ?auto_132164 ?auto_132170 ) ) ( not ( = ?auto_132164 ?auto_132171 ) ) ( not ( = ?auto_132164 ?auto_132172 ) ) ( not ( = ?auto_132164 ?auto_132173 ) ) ( not ( = ?auto_132164 ?auto_132174 ) ) ( not ( = ?auto_132165 ?auto_132166 ) ) ( not ( = ?auto_132165 ?auto_132167 ) ) ( not ( = ?auto_132165 ?auto_132168 ) ) ( not ( = ?auto_132165 ?auto_132169 ) ) ( not ( = ?auto_132165 ?auto_132170 ) ) ( not ( = ?auto_132165 ?auto_132171 ) ) ( not ( = ?auto_132165 ?auto_132172 ) ) ( not ( = ?auto_132165 ?auto_132173 ) ) ( not ( = ?auto_132165 ?auto_132174 ) ) ( not ( = ?auto_132166 ?auto_132167 ) ) ( not ( = ?auto_132166 ?auto_132168 ) ) ( not ( = ?auto_132166 ?auto_132169 ) ) ( not ( = ?auto_132166 ?auto_132170 ) ) ( not ( = ?auto_132166 ?auto_132171 ) ) ( not ( = ?auto_132166 ?auto_132172 ) ) ( not ( = ?auto_132166 ?auto_132173 ) ) ( not ( = ?auto_132166 ?auto_132174 ) ) ( not ( = ?auto_132167 ?auto_132168 ) ) ( not ( = ?auto_132167 ?auto_132169 ) ) ( not ( = ?auto_132167 ?auto_132170 ) ) ( not ( = ?auto_132167 ?auto_132171 ) ) ( not ( = ?auto_132167 ?auto_132172 ) ) ( not ( = ?auto_132167 ?auto_132173 ) ) ( not ( = ?auto_132167 ?auto_132174 ) ) ( not ( = ?auto_132168 ?auto_132169 ) ) ( not ( = ?auto_132168 ?auto_132170 ) ) ( not ( = ?auto_132168 ?auto_132171 ) ) ( not ( = ?auto_132168 ?auto_132172 ) ) ( not ( = ?auto_132168 ?auto_132173 ) ) ( not ( = ?auto_132168 ?auto_132174 ) ) ( not ( = ?auto_132169 ?auto_132170 ) ) ( not ( = ?auto_132169 ?auto_132171 ) ) ( not ( = ?auto_132169 ?auto_132172 ) ) ( not ( = ?auto_132169 ?auto_132173 ) ) ( not ( = ?auto_132169 ?auto_132174 ) ) ( not ( = ?auto_132170 ?auto_132171 ) ) ( not ( = ?auto_132170 ?auto_132172 ) ) ( not ( = ?auto_132170 ?auto_132173 ) ) ( not ( = ?auto_132170 ?auto_132174 ) ) ( not ( = ?auto_132171 ?auto_132172 ) ) ( not ( = ?auto_132171 ?auto_132173 ) ) ( not ( = ?auto_132171 ?auto_132174 ) ) ( not ( = ?auto_132172 ?auto_132173 ) ) ( not ( = ?auto_132172 ?auto_132174 ) ) ( not ( = ?auto_132173 ?auto_132174 ) ) ( ON ?auto_132172 ?auto_132173 ) ( ON ?auto_132171 ?auto_132172 ) ( ON ?auto_132170 ?auto_132171 ) ( ON ?auto_132169 ?auto_132170 ) ( ON ?auto_132168 ?auto_132169 ) ( ON ?auto_132167 ?auto_132168 ) ( ON ?auto_132166 ?auto_132167 ) ( CLEAR ?auto_132164 ) ( ON ?auto_132165 ?auto_132166 ) ( CLEAR ?auto_132165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132164 ?auto_132165 )
      ( MAKE-10PILE ?auto_132164 ?auto_132165 ?auto_132166 ?auto_132167 ?auto_132168 ?auto_132169 ?auto_132170 ?auto_132171 ?auto_132172 ?auto_132173 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_132206 - BLOCK
      ?auto_132207 - BLOCK
      ?auto_132208 - BLOCK
      ?auto_132209 - BLOCK
      ?auto_132210 - BLOCK
      ?auto_132211 - BLOCK
      ?auto_132212 - BLOCK
      ?auto_132213 - BLOCK
      ?auto_132214 - BLOCK
      ?auto_132215 - BLOCK
    )
    :vars
    (
      ?auto_132216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132215 ?auto_132216 ) ( not ( = ?auto_132206 ?auto_132207 ) ) ( not ( = ?auto_132206 ?auto_132208 ) ) ( not ( = ?auto_132206 ?auto_132209 ) ) ( not ( = ?auto_132206 ?auto_132210 ) ) ( not ( = ?auto_132206 ?auto_132211 ) ) ( not ( = ?auto_132206 ?auto_132212 ) ) ( not ( = ?auto_132206 ?auto_132213 ) ) ( not ( = ?auto_132206 ?auto_132214 ) ) ( not ( = ?auto_132206 ?auto_132215 ) ) ( not ( = ?auto_132206 ?auto_132216 ) ) ( not ( = ?auto_132207 ?auto_132208 ) ) ( not ( = ?auto_132207 ?auto_132209 ) ) ( not ( = ?auto_132207 ?auto_132210 ) ) ( not ( = ?auto_132207 ?auto_132211 ) ) ( not ( = ?auto_132207 ?auto_132212 ) ) ( not ( = ?auto_132207 ?auto_132213 ) ) ( not ( = ?auto_132207 ?auto_132214 ) ) ( not ( = ?auto_132207 ?auto_132215 ) ) ( not ( = ?auto_132207 ?auto_132216 ) ) ( not ( = ?auto_132208 ?auto_132209 ) ) ( not ( = ?auto_132208 ?auto_132210 ) ) ( not ( = ?auto_132208 ?auto_132211 ) ) ( not ( = ?auto_132208 ?auto_132212 ) ) ( not ( = ?auto_132208 ?auto_132213 ) ) ( not ( = ?auto_132208 ?auto_132214 ) ) ( not ( = ?auto_132208 ?auto_132215 ) ) ( not ( = ?auto_132208 ?auto_132216 ) ) ( not ( = ?auto_132209 ?auto_132210 ) ) ( not ( = ?auto_132209 ?auto_132211 ) ) ( not ( = ?auto_132209 ?auto_132212 ) ) ( not ( = ?auto_132209 ?auto_132213 ) ) ( not ( = ?auto_132209 ?auto_132214 ) ) ( not ( = ?auto_132209 ?auto_132215 ) ) ( not ( = ?auto_132209 ?auto_132216 ) ) ( not ( = ?auto_132210 ?auto_132211 ) ) ( not ( = ?auto_132210 ?auto_132212 ) ) ( not ( = ?auto_132210 ?auto_132213 ) ) ( not ( = ?auto_132210 ?auto_132214 ) ) ( not ( = ?auto_132210 ?auto_132215 ) ) ( not ( = ?auto_132210 ?auto_132216 ) ) ( not ( = ?auto_132211 ?auto_132212 ) ) ( not ( = ?auto_132211 ?auto_132213 ) ) ( not ( = ?auto_132211 ?auto_132214 ) ) ( not ( = ?auto_132211 ?auto_132215 ) ) ( not ( = ?auto_132211 ?auto_132216 ) ) ( not ( = ?auto_132212 ?auto_132213 ) ) ( not ( = ?auto_132212 ?auto_132214 ) ) ( not ( = ?auto_132212 ?auto_132215 ) ) ( not ( = ?auto_132212 ?auto_132216 ) ) ( not ( = ?auto_132213 ?auto_132214 ) ) ( not ( = ?auto_132213 ?auto_132215 ) ) ( not ( = ?auto_132213 ?auto_132216 ) ) ( not ( = ?auto_132214 ?auto_132215 ) ) ( not ( = ?auto_132214 ?auto_132216 ) ) ( not ( = ?auto_132215 ?auto_132216 ) ) ( ON ?auto_132214 ?auto_132215 ) ( ON ?auto_132213 ?auto_132214 ) ( ON ?auto_132212 ?auto_132213 ) ( ON ?auto_132211 ?auto_132212 ) ( ON ?auto_132210 ?auto_132211 ) ( ON ?auto_132209 ?auto_132210 ) ( ON ?auto_132208 ?auto_132209 ) ( ON ?auto_132207 ?auto_132208 ) ( ON ?auto_132206 ?auto_132207 ) ( CLEAR ?auto_132206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132206 )
      ( MAKE-10PILE ?auto_132206 ?auto_132207 ?auto_132208 ?auto_132209 ?auto_132210 ?auto_132211 ?auto_132212 ?auto_132213 ?auto_132214 ?auto_132215 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132249 - BLOCK
      ?auto_132250 - BLOCK
      ?auto_132251 - BLOCK
      ?auto_132252 - BLOCK
      ?auto_132253 - BLOCK
      ?auto_132254 - BLOCK
      ?auto_132255 - BLOCK
      ?auto_132256 - BLOCK
      ?auto_132257 - BLOCK
      ?auto_132258 - BLOCK
      ?auto_132259 - BLOCK
    )
    :vars
    (
      ?auto_132260 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132258 ) ( ON ?auto_132259 ?auto_132260 ) ( CLEAR ?auto_132259 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132249 ) ( ON ?auto_132250 ?auto_132249 ) ( ON ?auto_132251 ?auto_132250 ) ( ON ?auto_132252 ?auto_132251 ) ( ON ?auto_132253 ?auto_132252 ) ( ON ?auto_132254 ?auto_132253 ) ( ON ?auto_132255 ?auto_132254 ) ( ON ?auto_132256 ?auto_132255 ) ( ON ?auto_132257 ?auto_132256 ) ( ON ?auto_132258 ?auto_132257 ) ( not ( = ?auto_132249 ?auto_132250 ) ) ( not ( = ?auto_132249 ?auto_132251 ) ) ( not ( = ?auto_132249 ?auto_132252 ) ) ( not ( = ?auto_132249 ?auto_132253 ) ) ( not ( = ?auto_132249 ?auto_132254 ) ) ( not ( = ?auto_132249 ?auto_132255 ) ) ( not ( = ?auto_132249 ?auto_132256 ) ) ( not ( = ?auto_132249 ?auto_132257 ) ) ( not ( = ?auto_132249 ?auto_132258 ) ) ( not ( = ?auto_132249 ?auto_132259 ) ) ( not ( = ?auto_132249 ?auto_132260 ) ) ( not ( = ?auto_132250 ?auto_132251 ) ) ( not ( = ?auto_132250 ?auto_132252 ) ) ( not ( = ?auto_132250 ?auto_132253 ) ) ( not ( = ?auto_132250 ?auto_132254 ) ) ( not ( = ?auto_132250 ?auto_132255 ) ) ( not ( = ?auto_132250 ?auto_132256 ) ) ( not ( = ?auto_132250 ?auto_132257 ) ) ( not ( = ?auto_132250 ?auto_132258 ) ) ( not ( = ?auto_132250 ?auto_132259 ) ) ( not ( = ?auto_132250 ?auto_132260 ) ) ( not ( = ?auto_132251 ?auto_132252 ) ) ( not ( = ?auto_132251 ?auto_132253 ) ) ( not ( = ?auto_132251 ?auto_132254 ) ) ( not ( = ?auto_132251 ?auto_132255 ) ) ( not ( = ?auto_132251 ?auto_132256 ) ) ( not ( = ?auto_132251 ?auto_132257 ) ) ( not ( = ?auto_132251 ?auto_132258 ) ) ( not ( = ?auto_132251 ?auto_132259 ) ) ( not ( = ?auto_132251 ?auto_132260 ) ) ( not ( = ?auto_132252 ?auto_132253 ) ) ( not ( = ?auto_132252 ?auto_132254 ) ) ( not ( = ?auto_132252 ?auto_132255 ) ) ( not ( = ?auto_132252 ?auto_132256 ) ) ( not ( = ?auto_132252 ?auto_132257 ) ) ( not ( = ?auto_132252 ?auto_132258 ) ) ( not ( = ?auto_132252 ?auto_132259 ) ) ( not ( = ?auto_132252 ?auto_132260 ) ) ( not ( = ?auto_132253 ?auto_132254 ) ) ( not ( = ?auto_132253 ?auto_132255 ) ) ( not ( = ?auto_132253 ?auto_132256 ) ) ( not ( = ?auto_132253 ?auto_132257 ) ) ( not ( = ?auto_132253 ?auto_132258 ) ) ( not ( = ?auto_132253 ?auto_132259 ) ) ( not ( = ?auto_132253 ?auto_132260 ) ) ( not ( = ?auto_132254 ?auto_132255 ) ) ( not ( = ?auto_132254 ?auto_132256 ) ) ( not ( = ?auto_132254 ?auto_132257 ) ) ( not ( = ?auto_132254 ?auto_132258 ) ) ( not ( = ?auto_132254 ?auto_132259 ) ) ( not ( = ?auto_132254 ?auto_132260 ) ) ( not ( = ?auto_132255 ?auto_132256 ) ) ( not ( = ?auto_132255 ?auto_132257 ) ) ( not ( = ?auto_132255 ?auto_132258 ) ) ( not ( = ?auto_132255 ?auto_132259 ) ) ( not ( = ?auto_132255 ?auto_132260 ) ) ( not ( = ?auto_132256 ?auto_132257 ) ) ( not ( = ?auto_132256 ?auto_132258 ) ) ( not ( = ?auto_132256 ?auto_132259 ) ) ( not ( = ?auto_132256 ?auto_132260 ) ) ( not ( = ?auto_132257 ?auto_132258 ) ) ( not ( = ?auto_132257 ?auto_132259 ) ) ( not ( = ?auto_132257 ?auto_132260 ) ) ( not ( = ?auto_132258 ?auto_132259 ) ) ( not ( = ?auto_132258 ?auto_132260 ) ) ( not ( = ?auto_132259 ?auto_132260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132259 ?auto_132260 )
      ( !STACK ?auto_132259 ?auto_132258 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132272 - BLOCK
      ?auto_132273 - BLOCK
      ?auto_132274 - BLOCK
      ?auto_132275 - BLOCK
      ?auto_132276 - BLOCK
      ?auto_132277 - BLOCK
      ?auto_132278 - BLOCK
      ?auto_132279 - BLOCK
      ?auto_132280 - BLOCK
      ?auto_132281 - BLOCK
      ?auto_132282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132281 ) ( ON-TABLE ?auto_132282 ) ( CLEAR ?auto_132282 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132272 ) ( ON ?auto_132273 ?auto_132272 ) ( ON ?auto_132274 ?auto_132273 ) ( ON ?auto_132275 ?auto_132274 ) ( ON ?auto_132276 ?auto_132275 ) ( ON ?auto_132277 ?auto_132276 ) ( ON ?auto_132278 ?auto_132277 ) ( ON ?auto_132279 ?auto_132278 ) ( ON ?auto_132280 ?auto_132279 ) ( ON ?auto_132281 ?auto_132280 ) ( not ( = ?auto_132272 ?auto_132273 ) ) ( not ( = ?auto_132272 ?auto_132274 ) ) ( not ( = ?auto_132272 ?auto_132275 ) ) ( not ( = ?auto_132272 ?auto_132276 ) ) ( not ( = ?auto_132272 ?auto_132277 ) ) ( not ( = ?auto_132272 ?auto_132278 ) ) ( not ( = ?auto_132272 ?auto_132279 ) ) ( not ( = ?auto_132272 ?auto_132280 ) ) ( not ( = ?auto_132272 ?auto_132281 ) ) ( not ( = ?auto_132272 ?auto_132282 ) ) ( not ( = ?auto_132273 ?auto_132274 ) ) ( not ( = ?auto_132273 ?auto_132275 ) ) ( not ( = ?auto_132273 ?auto_132276 ) ) ( not ( = ?auto_132273 ?auto_132277 ) ) ( not ( = ?auto_132273 ?auto_132278 ) ) ( not ( = ?auto_132273 ?auto_132279 ) ) ( not ( = ?auto_132273 ?auto_132280 ) ) ( not ( = ?auto_132273 ?auto_132281 ) ) ( not ( = ?auto_132273 ?auto_132282 ) ) ( not ( = ?auto_132274 ?auto_132275 ) ) ( not ( = ?auto_132274 ?auto_132276 ) ) ( not ( = ?auto_132274 ?auto_132277 ) ) ( not ( = ?auto_132274 ?auto_132278 ) ) ( not ( = ?auto_132274 ?auto_132279 ) ) ( not ( = ?auto_132274 ?auto_132280 ) ) ( not ( = ?auto_132274 ?auto_132281 ) ) ( not ( = ?auto_132274 ?auto_132282 ) ) ( not ( = ?auto_132275 ?auto_132276 ) ) ( not ( = ?auto_132275 ?auto_132277 ) ) ( not ( = ?auto_132275 ?auto_132278 ) ) ( not ( = ?auto_132275 ?auto_132279 ) ) ( not ( = ?auto_132275 ?auto_132280 ) ) ( not ( = ?auto_132275 ?auto_132281 ) ) ( not ( = ?auto_132275 ?auto_132282 ) ) ( not ( = ?auto_132276 ?auto_132277 ) ) ( not ( = ?auto_132276 ?auto_132278 ) ) ( not ( = ?auto_132276 ?auto_132279 ) ) ( not ( = ?auto_132276 ?auto_132280 ) ) ( not ( = ?auto_132276 ?auto_132281 ) ) ( not ( = ?auto_132276 ?auto_132282 ) ) ( not ( = ?auto_132277 ?auto_132278 ) ) ( not ( = ?auto_132277 ?auto_132279 ) ) ( not ( = ?auto_132277 ?auto_132280 ) ) ( not ( = ?auto_132277 ?auto_132281 ) ) ( not ( = ?auto_132277 ?auto_132282 ) ) ( not ( = ?auto_132278 ?auto_132279 ) ) ( not ( = ?auto_132278 ?auto_132280 ) ) ( not ( = ?auto_132278 ?auto_132281 ) ) ( not ( = ?auto_132278 ?auto_132282 ) ) ( not ( = ?auto_132279 ?auto_132280 ) ) ( not ( = ?auto_132279 ?auto_132281 ) ) ( not ( = ?auto_132279 ?auto_132282 ) ) ( not ( = ?auto_132280 ?auto_132281 ) ) ( not ( = ?auto_132280 ?auto_132282 ) ) ( not ( = ?auto_132281 ?auto_132282 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_132282 )
      ( !STACK ?auto_132282 ?auto_132281 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132294 - BLOCK
      ?auto_132295 - BLOCK
      ?auto_132296 - BLOCK
      ?auto_132297 - BLOCK
      ?auto_132298 - BLOCK
      ?auto_132299 - BLOCK
      ?auto_132300 - BLOCK
      ?auto_132301 - BLOCK
      ?auto_132302 - BLOCK
      ?auto_132303 - BLOCK
      ?auto_132304 - BLOCK
    )
    :vars
    (
      ?auto_132305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132304 ?auto_132305 ) ( ON-TABLE ?auto_132294 ) ( ON ?auto_132295 ?auto_132294 ) ( ON ?auto_132296 ?auto_132295 ) ( ON ?auto_132297 ?auto_132296 ) ( ON ?auto_132298 ?auto_132297 ) ( ON ?auto_132299 ?auto_132298 ) ( ON ?auto_132300 ?auto_132299 ) ( ON ?auto_132301 ?auto_132300 ) ( ON ?auto_132302 ?auto_132301 ) ( not ( = ?auto_132294 ?auto_132295 ) ) ( not ( = ?auto_132294 ?auto_132296 ) ) ( not ( = ?auto_132294 ?auto_132297 ) ) ( not ( = ?auto_132294 ?auto_132298 ) ) ( not ( = ?auto_132294 ?auto_132299 ) ) ( not ( = ?auto_132294 ?auto_132300 ) ) ( not ( = ?auto_132294 ?auto_132301 ) ) ( not ( = ?auto_132294 ?auto_132302 ) ) ( not ( = ?auto_132294 ?auto_132303 ) ) ( not ( = ?auto_132294 ?auto_132304 ) ) ( not ( = ?auto_132294 ?auto_132305 ) ) ( not ( = ?auto_132295 ?auto_132296 ) ) ( not ( = ?auto_132295 ?auto_132297 ) ) ( not ( = ?auto_132295 ?auto_132298 ) ) ( not ( = ?auto_132295 ?auto_132299 ) ) ( not ( = ?auto_132295 ?auto_132300 ) ) ( not ( = ?auto_132295 ?auto_132301 ) ) ( not ( = ?auto_132295 ?auto_132302 ) ) ( not ( = ?auto_132295 ?auto_132303 ) ) ( not ( = ?auto_132295 ?auto_132304 ) ) ( not ( = ?auto_132295 ?auto_132305 ) ) ( not ( = ?auto_132296 ?auto_132297 ) ) ( not ( = ?auto_132296 ?auto_132298 ) ) ( not ( = ?auto_132296 ?auto_132299 ) ) ( not ( = ?auto_132296 ?auto_132300 ) ) ( not ( = ?auto_132296 ?auto_132301 ) ) ( not ( = ?auto_132296 ?auto_132302 ) ) ( not ( = ?auto_132296 ?auto_132303 ) ) ( not ( = ?auto_132296 ?auto_132304 ) ) ( not ( = ?auto_132296 ?auto_132305 ) ) ( not ( = ?auto_132297 ?auto_132298 ) ) ( not ( = ?auto_132297 ?auto_132299 ) ) ( not ( = ?auto_132297 ?auto_132300 ) ) ( not ( = ?auto_132297 ?auto_132301 ) ) ( not ( = ?auto_132297 ?auto_132302 ) ) ( not ( = ?auto_132297 ?auto_132303 ) ) ( not ( = ?auto_132297 ?auto_132304 ) ) ( not ( = ?auto_132297 ?auto_132305 ) ) ( not ( = ?auto_132298 ?auto_132299 ) ) ( not ( = ?auto_132298 ?auto_132300 ) ) ( not ( = ?auto_132298 ?auto_132301 ) ) ( not ( = ?auto_132298 ?auto_132302 ) ) ( not ( = ?auto_132298 ?auto_132303 ) ) ( not ( = ?auto_132298 ?auto_132304 ) ) ( not ( = ?auto_132298 ?auto_132305 ) ) ( not ( = ?auto_132299 ?auto_132300 ) ) ( not ( = ?auto_132299 ?auto_132301 ) ) ( not ( = ?auto_132299 ?auto_132302 ) ) ( not ( = ?auto_132299 ?auto_132303 ) ) ( not ( = ?auto_132299 ?auto_132304 ) ) ( not ( = ?auto_132299 ?auto_132305 ) ) ( not ( = ?auto_132300 ?auto_132301 ) ) ( not ( = ?auto_132300 ?auto_132302 ) ) ( not ( = ?auto_132300 ?auto_132303 ) ) ( not ( = ?auto_132300 ?auto_132304 ) ) ( not ( = ?auto_132300 ?auto_132305 ) ) ( not ( = ?auto_132301 ?auto_132302 ) ) ( not ( = ?auto_132301 ?auto_132303 ) ) ( not ( = ?auto_132301 ?auto_132304 ) ) ( not ( = ?auto_132301 ?auto_132305 ) ) ( not ( = ?auto_132302 ?auto_132303 ) ) ( not ( = ?auto_132302 ?auto_132304 ) ) ( not ( = ?auto_132302 ?auto_132305 ) ) ( not ( = ?auto_132303 ?auto_132304 ) ) ( not ( = ?auto_132303 ?auto_132305 ) ) ( not ( = ?auto_132304 ?auto_132305 ) ) ( CLEAR ?auto_132302 ) ( ON ?auto_132303 ?auto_132304 ) ( CLEAR ?auto_132303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_132294 ?auto_132295 ?auto_132296 ?auto_132297 ?auto_132298 ?auto_132299 ?auto_132300 ?auto_132301 ?auto_132302 ?auto_132303 )
      ( MAKE-11PILE ?auto_132294 ?auto_132295 ?auto_132296 ?auto_132297 ?auto_132298 ?auto_132299 ?auto_132300 ?auto_132301 ?auto_132302 ?auto_132303 ?auto_132304 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132317 - BLOCK
      ?auto_132318 - BLOCK
      ?auto_132319 - BLOCK
      ?auto_132320 - BLOCK
      ?auto_132321 - BLOCK
      ?auto_132322 - BLOCK
      ?auto_132323 - BLOCK
      ?auto_132324 - BLOCK
      ?auto_132325 - BLOCK
      ?auto_132326 - BLOCK
      ?auto_132327 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132327 ) ( ON-TABLE ?auto_132317 ) ( ON ?auto_132318 ?auto_132317 ) ( ON ?auto_132319 ?auto_132318 ) ( ON ?auto_132320 ?auto_132319 ) ( ON ?auto_132321 ?auto_132320 ) ( ON ?auto_132322 ?auto_132321 ) ( ON ?auto_132323 ?auto_132322 ) ( ON ?auto_132324 ?auto_132323 ) ( ON ?auto_132325 ?auto_132324 ) ( not ( = ?auto_132317 ?auto_132318 ) ) ( not ( = ?auto_132317 ?auto_132319 ) ) ( not ( = ?auto_132317 ?auto_132320 ) ) ( not ( = ?auto_132317 ?auto_132321 ) ) ( not ( = ?auto_132317 ?auto_132322 ) ) ( not ( = ?auto_132317 ?auto_132323 ) ) ( not ( = ?auto_132317 ?auto_132324 ) ) ( not ( = ?auto_132317 ?auto_132325 ) ) ( not ( = ?auto_132317 ?auto_132326 ) ) ( not ( = ?auto_132317 ?auto_132327 ) ) ( not ( = ?auto_132318 ?auto_132319 ) ) ( not ( = ?auto_132318 ?auto_132320 ) ) ( not ( = ?auto_132318 ?auto_132321 ) ) ( not ( = ?auto_132318 ?auto_132322 ) ) ( not ( = ?auto_132318 ?auto_132323 ) ) ( not ( = ?auto_132318 ?auto_132324 ) ) ( not ( = ?auto_132318 ?auto_132325 ) ) ( not ( = ?auto_132318 ?auto_132326 ) ) ( not ( = ?auto_132318 ?auto_132327 ) ) ( not ( = ?auto_132319 ?auto_132320 ) ) ( not ( = ?auto_132319 ?auto_132321 ) ) ( not ( = ?auto_132319 ?auto_132322 ) ) ( not ( = ?auto_132319 ?auto_132323 ) ) ( not ( = ?auto_132319 ?auto_132324 ) ) ( not ( = ?auto_132319 ?auto_132325 ) ) ( not ( = ?auto_132319 ?auto_132326 ) ) ( not ( = ?auto_132319 ?auto_132327 ) ) ( not ( = ?auto_132320 ?auto_132321 ) ) ( not ( = ?auto_132320 ?auto_132322 ) ) ( not ( = ?auto_132320 ?auto_132323 ) ) ( not ( = ?auto_132320 ?auto_132324 ) ) ( not ( = ?auto_132320 ?auto_132325 ) ) ( not ( = ?auto_132320 ?auto_132326 ) ) ( not ( = ?auto_132320 ?auto_132327 ) ) ( not ( = ?auto_132321 ?auto_132322 ) ) ( not ( = ?auto_132321 ?auto_132323 ) ) ( not ( = ?auto_132321 ?auto_132324 ) ) ( not ( = ?auto_132321 ?auto_132325 ) ) ( not ( = ?auto_132321 ?auto_132326 ) ) ( not ( = ?auto_132321 ?auto_132327 ) ) ( not ( = ?auto_132322 ?auto_132323 ) ) ( not ( = ?auto_132322 ?auto_132324 ) ) ( not ( = ?auto_132322 ?auto_132325 ) ) ( not ( = ?auto_132322 ?auto_132326 ) ) ( not ( = ?auto_132322 ?auto_132327 ) ) ( not ( = ?auto_132323 ?auto_132324 ) ) ( not ( = ?auto_132323 ?auto_132325 ) ) ( not ( = ?auto_132323 ?auto_132326 ) ) ( not ( = ?auto_132323 ?auto_132327 ) ) ( not ( = ?auto_132324 ?auto_132325 ) ) ( not ( = ?auto_132324 ?auto_132326 ) ) ( not ( = ?auto_132324 ?auto_132327 ) ) ( not ( = ?auto_132325 ?auto_132326 ) ) ( not ( = ?auto_132325 ?auto_132327 ) ) ( not ( = ?auto_132326 ?auto_132327 ) ) ( CLEAR ?auto_132325 ) ( ON ?auto_132326 ?auto_132327 ) ( CLEAR ?auto_132326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_132317 ?auto_132318 ?auto_132319 ?auto_132320 ?auto_132321 ?auto_132322 ?auto_132323 ?auto_132324 ?auto_132325 ?auto_132326 )
      ( MAKE-11PILE ?auto_132317 ?auto_132318 ?auto_132319 ?auto_132320 ?auto_132321 ?auto_132322 ?auto_132323 ?auto_132324 ?auto_132325 ?auto_132326 ?auto_132327 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132339 - BLOCK
      ?auto_132340 - BLOCK
      ?auto_132341 - BLOCK
      ?auto_132342 - BLOCK
      ?auto_132343 - BLOCK
      ?auto_132344 - BLOCK
      ?auto_132345 - BLOCK
      ?auto_132346 - BLOCK
      ?auto_132347 - BLOCK
      ?auto_132348 - BLOCK
      ?auto_132349 - BLOCK
    )
    :vars
    (
      ?auto_132350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132349 ?auto_132350 ) ( ON-TABLE ?auto_132339 ) ( ON ?auto_132340 ?auto_132339 ) ( ON ?auto_132341 ?auto_132340 ) ( ON ?auto_132342 ?auto_132341 ) ( ON ?auto_132343 ?auto_132342 ) ( ON ?auto_132344 ?auto_132343 ) ( ON ?auto_132345 ?auto_132344 ) ( ON ?auto_132346 ?auto_132345 ) ( not ( = ?auto_132339 ?auto_132340 ) ) ( not ( = ?auto_132339 ?auto_132341 ) ) ( not ( = ?auto_132339 ?auto_132342 ) ) ( not ( = ?auto_132339 ?auto_132343 ) ) ( not ( = ?auto_132339 ?auto_132344 ) ) ( not ( = ?auto_132339 ?auto_132345 ) ) ( not ( = ?auto_132339 ?auto_132346 ) ) ( not ( = ?auto_132339 ?auto_132347 ) ) ( not ( = ?auto_132339 ?auto_132348 ) ) ( not ( = ?auto_132339 ?auto_132349 ) ) ( not ( = ?auto_132339 ?auto_132350 ) ) ( not ( = ?auto_132340 ?auto_132341 ) ) ( not ( = ?auto_132340 ?auto_132342 ) ) ( not ( = ?auto_132340 ?auto_132343 ) ) ( not ( = ?auto_132340 ?auto_132344 ) ) ( not ( = ?auto_132340 ?auto_132345 ) ) ( not ( = ?auto_132340 ?auto_132346 ) ) ( not ( = ?auto_132340 ?auto_132347 ) ) ( not ( = ?auto_132340 ?auto_132348 ) ) ( not ( = ?auto_132340 ?auto_132349 ) ) ( not ( = ?auto_132340 ?auto_132350 ) ) ( not ( = ?auto_132341 ?auto_132342 ) ) ( not ( = ?auto_132341 ?auto_132343 ) ) ( not ( = ?auto_132341 ?auto_132344 ) ) ( not ( = ?auto_132341 ?auto_132345 ) ) ( not ( = ?auto_132341 ?auto_132346 ) ) ( not ( = ?auto_132341 ?auto_132347 ) ) ( not ( = ?auto_132341 ?auto_132348 ) ) ( not ( = ?auto_132341 ?auto_132349 ) ) ( not ( = ?auto_132341 ?auto_132350 ) ) ( not ( = ?auto_132342 ?auto_132343 ) ) ( not ( = ?auto_132342 ?auto_132344 ) ) ( not ( = ?auto_132342 ?auto_132345 ) ) ( not ( = ?auto_132342 ?auto_132346 ) ) ( not ( = ?auto_132342 ?auto_132347 ) ) ( not ( = ?auto_132342 ?auto_132348 ) ) ( not ( = ?auto_132342 ?auto_132349 ) ) ( not ( = ?auto_132342 ?auto_132350 ) ) ( not ( = ?auto_132343 ?auto_132344 ) ) ( not ( = ?auto_132343 ?auto_132345 ) ) ( not ( = ?auto_132343 ?auto_132346 ) ) ( not ( = ?auto_132343 ?auto_132347 ) ) ( not ( = ?auto_132343 ?auto_132348 ) ) ( not ( = ?auto_132343 ?auto_132349 ) ) ( not ( = ?auto_132343 ?auto_132350 ) ) ( not ( = ?auto_132344 ?auto_132345 ) ) ( not ( = ?auto_132344 ?auto_132346 ) ) ( not ( = ?auto_132344 ?auto_132347 ) ) ( not ( = ?auto_132344 ?auto_132348 ) ) ( not ( = ?auto_132344 ?auto_132349 ) ) ( not ( = ?auto_132344 ?auto_132350 ) ) ( not ( = ?auto_132345 ?auto_132346 ) ) ( not ( = ?auto_132345 ?auto_132347 ) ) ( not ( = ?auto_132345 ?auto_132348 ) ) ( not ( = ?auto_132345 ?auto_132349 ) ) ( not ( = ?auto_132345 ?auto_132350 ) ) ( not ( = ?auto_132346 ?auto_132347 ) ) ( not ( = ?auto_132346 ?auto_132348 ) ) ( not ( = ?auto_132346 ?auto_132349 ) ) ( not ( = ?auto_132346 ?auto_132350 ) ) ( not ( = ?auto_132347 ?auto_132348 ) ) ( not ( = ?auto_132347 ?auto_132349 ) ) ( not ( = ?auto_132347 ?auto_132350 ) ) ( not ( = ?auto_132348 ?auto_132349 ) ) ( not ( = ?auto_132348 ?auto_132350 ) ) ( not ( = ?auto_132349 ?auto_132350 ) ) ( ON ?auto_132348 ?auto_132349 ) ( CLEAR ?auto_132346 ) ( ON ?auto_132347 ?auto_132348 ) ( CLEAR ?auto_132347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_132339 ?auto_132340 ?auto_132341 ?auto_132342 ?auto_132343 ?auto_132344 ?auto_132345 ?auto_132346 ?auto_132347 )
      ( MAKE-11PILE ?auto_132339 ?auto_132340 ?auto_132341 ?auto_132342 ?auto_132343 ?auto_132344 ?auto_132345 ?auto_132346 ?auto_132347 ?auto_132348 ?auto_132349 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132362 - BLOCK
      ?auto_132363 - BLOCK
      ?auto_132364 - BLOCK
      ?auto_132365 - BLOCK
      ?auto_132366 - BLOCK
      ?auto_132367 - BLOCK
      ?auto_132368 - BLOCK
      ?auto_132369 - BLOCK
      ?auto_132370 - BLOCK
      ?auto_132371 - BLOCK
      ?auto_132372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132372 ) ( ON-TABLE ?auto_132362 ) ( ON ?auto_132363 ?auto_132362 ) ( ON ?auto_132364 ?auto_132363 ) ( ON ?auto_132365 ?auto_132364 ) ( ON ?auto_132366 ?auto_132365 ) ( ON ?auto_132367 ?auto_132366 ) ( ON ?auto_132368 ?auto_132367 ) ( ON ?auto_132369 ?auto_132368 ) ( not ( = ?auto_132362 ?auto_132363 ) ) ( not ( = ?auto_132362 ?auto_132364 ) ) ( not ( = ?auto_132362 ?auto_132365 ) ) ( not ( = ?auto_132362 ?auto_132366 ) ) ( not ( = ?auto_132362 ?auto_132367 ) ) ( not ( = ?auto_132362 ?auto_132368 ) ) ( not ( = ?auto_132362 ?auto_132369 ) ) ( not ( = ?auto_132362 ?auto_132370 ) ) ( not ( = ?auto_132362 ?auto_132371 ) ) ( not ( = ?auto_132362 ?auto_132372 ) ) ( not ( = ?auto_132363 ?auto_132364 ) ) ( not ( = ?auto_132363 ?auto_132365 ) ) ( not ( = ?auto_132363 ?auto_132366 ) ) ( not ( = ?auto_132363 ?auto_132367 ) ) ( not ( = ?auto_132363 ?auto_132368 ) ) ( not ( = ?auto_132363 ?auto_132369 ) ) ( not ( = ?auto_132363 ?auto_132370 ) ) ( not ( = ?auto_132363 ?auto_132371 ) ) ( not ( = ?auto_132363 ?auto_132372 ) ) ( not ( = ?auto_132364 ?auto_132365 ) ) ( not ( = ?auto_132364 ?auto_132366 ) ) ( not ( = ?auto_132364 ?auto_132367 ) ) ( not ( = ?auto_132364 ?auto_132368 ) ) ( not ( = ?auto_132364 ?auto_132369 ) ) ( not ( = ?auto_132364 ?auto_132370 ) ) ( not ( = ?auto_132364 ?auto_132371 ) ) ( not ( = ?auto_132364 ?auto_132372 ) ) ( not ( = ?auto_132365 ?auto_132366 ) ) ( not ( = ?auto_132365 ?auto_132367 ) ) ( not ( = ?auto_132365 ?auto_132368 ) ) ( not ( = ?auto_132365 ?auto_132369 ) ) ( not ( = ?auto_132365 ?auto_132370 ) ) ( not ( = ?auto_132365 ?auto_132371 ) ) ( not ( = ?auto_132365 ?auto_132372 ) ) ( not ( = ?auto_132366 ?auto_132367 ) ) ( not ( = ?auto_132366 ?auto_132368 ) ) ( not ( = ?auto_132366 ?auto_132369 ) ) ( not ( = ?auto_132366 ?auto_132370 ) ) ( not ( = ?auto_132366 ?auto_132371 ) ) ( not ( = ?auto_132366 ?auto_132372 ) ) ( not ( = ?auto_132367 ?auto_132368 ) ) ( not ( = ?auto_132367 ?auto_132369 ) ) ( not ( = ?auto_132367 ?auto_132370 ) ) ( not ( = ?auto_132367 ?auto_132371 ) ) ( not ( = ?auto_132367 ?auto_132372 ) ) ( not ( = ?auto_132368 ?auto_132369 ) ) ( not ( = ?auto_132368 ?auto_132370 ) ) ( not ( = ?auto_132368 ?auto_132371 ) ) ( not ( = ?auto_132368 ?auto_132372 ) ) ( not ( = ?auto_132369 ?auto_132370 ) ) ( not ( = ?auto_132369 ?auto_132371 ) ) ( not ( = ?auto_132369 ?auto_132372 ) ) ( not ( = ?auto_132370 ?auto_132371 ) ) ( not ( = ?auto_132370 ?auto_132372 ) ) ( not ( = ?auto_132371 ?auto_132372 ) ) ( ON ?auto_132371 ?auto_132372 ) ( CLEAR ?auto_132369 ) ( ON ?auto_132370 ?auto_132371 ) ( CLEAR ?auto_132370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_132362 ?auto_132363 ?auto_132364 ?auto_132365 ?auto_132366 ?auto_132367 ?auto_132368 ?auto_132369 ?auto_132370 )
      ( MAKE-11PILE ?auto_132362 ?auto_132363 ?auto_132364 ?auto_132365 ?auto_132366 ?auto_132367 ?auto_132368 ?auto_132369 ?auto_132370 ?auto_132371 ?auto_132372 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132384 - BLOCK
      ?auto_132385 - BLOCK
      ?auto_132386 - BLOCK
      ?auto_132387 - BLOCK
      ?auto_132388 - BLOCK
      ?auto_132389 - BLOCK
      ?auto_132390 - BLOCK
      ?auto_132391 - BLOCK
      ?auto_132392 - BLOCK
      ?auto_132393 - BLOCK
      ?auto_132394 - BLOCK
    )
    :vars
    (
      ?auto_132395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132394 ?auto_132395 ) ( ON-TABLE ?auto_132384 ) ( ON ?auto_132385 ?auto_132384 ) ( ON ?auto_132386 ?auto_132385 ) ( ON ?auto_132387 ?auto_132386 ) ( ON ?auto_132388 ?auto_132387 ) ( ON ?auto_132389 ?auto_132388 ) ( ON ?auto_132390 ?auto_132389 ) ( not ( = ?auto_132384 ?auto_132385 ) ) ( not ( = ?auto_132384 ?auto_132386 ) ) ( not ( = ?auto_132384 ?auto_132387 ) ) ( not ( = ?auto_132384 ?auto_132388 ) ) ( not ( = ?auto_132384 ?auto_132389 ) ) ( not ( = ?auto_132384 ?auto_132390 ) ) ( not ( = ?auto_132384 ?auto_132391 ) ) ( not ( = ?auto_132384 ?auto_132392 ) ) ( not ( = ?auto_132384 ?auto_132393 ) ) ( not ( = ?auto_132384 ?auto_132394 ) ) ( not ( = ?auto_132384 ?auto_132395 ) ) ( not ( = ?auto_132385 ?auto_132386 ) ) ( not ( = ?auto_132385 ?auto_132387 ) ) ( not ( = ?auto_132385 ?auto_132388 ) ) ( not ( = ?auto_132385 ?auto_132389 ) ) ( not ( = ?auto_132385 ?auto_132390 ) ) ( not ( = ?auto_132385 ?auto_132391 ) ) ( not ( = ?auto_132385 ?auto_132392 ) ) ( not ( = ?auto_132385 ?auto_132393 ) ) ( not ( = ?auto_132385 ?auto_132394 ) ) ( not ( = ?auto_132385 ?auto_132395 ) ) ( not ( = ?auto_132386 ?auto_132387 ) ) ( not ( = ?auto_132386 ?auto_132388 ) ) ( not ( = ?auto_132386 ?auto_132389 ) ) ( not ( = ?auto_132386 ?auto_132390 ) ) ( not ( = ?auto_132386 ?auto_132391 ) ) ( not ( = ?auto_132386 ?auto_132392 ) ) ( not ( = ?auto_132386 ?auto_132393 ) ) ( not ( = ?auto_132386 ?auto_132394 ) ) ( not ( = ?auto_132386 ?auto_132395 ) ) ( not ( = ?auto_132387 ?auto_132388 ) ) ( not ( = ?auto_132387 ?auto_132389 ) ) ( not ( = ?auto_132387 ?auto_132390 ) ) ( not ( = ?auto_132387 ?auto_132391 ) ) ( not ( = ?auto_132387 ?auto_132392 ) ) ( not ( = ?auto_132387 ?auto_132393 ) ) ( not ( = ?auto_132387 ?auto_132394 ) ) ( not ( = ?auto_132387 ?auto_132395 ) ) ( not ( = ?auto_132388 ?auto_132389 ) ) ( not ( = ?auto_132388 ?auto_132390 ) ) ( not ( = ?auto_132388 ?auto_132391 ) ) ( not ( = ?auto_132388 ?auto_132392 ) ) ( not ( = ?auto_132388 ?auto_132393 ) ) ( not ( = ?auto_132388 ?auto_132394 ) ) ( not ( = ?auto_132388 ?auto_132395 ) ) ( not ( = ?auto_132389 ?auto_132390 ) ) ( not ( = ?auto_132389 ?auto_132391 ) ) ( not ( = ?auto_132389 ?auto_132392 ) ) ( not ( = ?auto_132389 ?auto_132393 ) ) ( not ( = ?auto_132389 ?auto_132394 ) ) ( not ( = ?auto_132389 ?auto_132395 ) ) ( not ( = ?auto_132390 ?auto_132391 ) ) ( not ( = ?auto_132390 ?auto_132392 ) ) ( not ( = ?auto_132390 ?auto_132393 ) ) ( not ( = ?auto_132390 ?auto_132394 ) ) ( not ( = ?auto_132390 ?auto_132395 ) ) ( not ( = ?auto_132391 ?auto_132392 ) ) ( not ( = ?auto_132391 ?auto_132393 ) ) ( not ( = ?auto_132391 ?auto_132394 ) ) ( not ( = ?auto_132391 ?auto_132395 ) ) ( not ( = ?auto_132392 ?auto_132393 ) ) ( not ( = ?auto_132392 ?auto_132394 ) ) ( not ( = ?auto_132392 ?auto_132395 ) ) ( not ( = ?auto_132393 ?auto_132394 ) ) ( not ( = ?auto_132393 ?auto_132395 ) ) ( not ( = ?auto_132394 ?auto_132395 ) ) ( ON ?auto_132393 ?auto_132394 ) ( ON ?auto_132392 ?auto_132393 ) ( CLEAR ?auto_132390 ) ( ON ?auto_132391 ?auto_132392 ) ( CLEAR ?auto_132391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132384 ?auto_132385 ?auto_132386 ?auto_132387 ?auto_132388 ?auto_132389 ?auto_132390 ?auto_132391 )
      ( MAKE-11PILE ?auto_132384 ?auto_132385 ?auto_132386 ?auto_132387 ?auto_132388 ?auto_132389 ?auto_132390 ?auto_132391 ?auto_132392 ?auto_132393 ?auto_132394 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132407 - BLOCK
      ?auto_132408 - BLOCK
      ?auto_132409 - BLOCK
      ?auto_132410 - BLOCK
      ?auto_132411 - BLOCK
      ?auto_132412 - BLOCK
      ?auto_132413 - BLOCK
      ?auto_132414 - BLOCK
      ?auto_132415 - BLOCK
      ?auto_132416 - BLOCK
      ?auto_132417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132417 ) ( ON-TABLE ?auto_132407 ) ( ON ?auto_132408 ?auto_132407 ) ( ON ?auto_132409 ?auto_132408 ) ( ON ?auto_132410 ?auto_132409 ) ( ON ?auto_132411 ?auto_132410 ) ( ON ?auto_132412 ?auto_132411 ) ( ON ?auto_132413 ?auto_132412 ) ( not ( = ?auto_132407 ?auto_132408 ) ) ( not ( = ?auto_132407 ?auto_132409 ) ) ( not ( = ?auto_132407 ?auto_132410 ) ) ( not ( = ?auto_132407 ?auto_132411 ) ) ( not ( = ?auto_132407 ?auto_132412 ) ) ( not ( = ?auto_132407 ?auto_132413 ) ) ( not ( = ?auto_132407 ?auto_132414 ) ) ( not ( = ?auto_132407 ?auto_132415 ) ) ( not ( = ?auto_132407 ?auto_132416 ) ) ( not ( = ?auto_132407 ?auto_132417 ) ) ( not ( = ?auto_132408 ?auto_132409 ) ) ( not ( = ?auto_132408 ?auto_132410 ) ) ( not ( = ?auto_132408 ?auto_132411 ) ) ( not ( = ?auto_132408 ?auto_132412 ) ) ( not ( = ?auto_132408 ?auto_132413 ) ) ( not ( = ?auto_132408 ?auto_132414 ) ) ( not ( = ?auto_132408 ?auto_132415 ) ) ( not ( = ?auto_132408 ?auto_132416 ) ) ( not ( = ?auto_132408 ?auto_132417 ) ) ( not ( = ?auto_132409 ?auto_132410 ) ) ( not ( = ?auto_132409 ?auto_132411 ) ) ( not ( = ?auto_132409 ?auto_132412 ) ) ( not ( = ?auto_132409 ?auto_132413 ) ) ( not ( = ?auto_132409 ?auto_132414 ) ) ( not ( = ?auto_132409 ?auto_132415 ) ) ( not ( = ?auto_132409 ?auto_132416 ) ) ( not ( = ?auto_132409 ?auto_132417 ) ) ( not ( = ?auto_132410 ?auto_132411 ) ) ( not ( = ?auto_132410 ?auto_132412 ) ) ( not ( = ?auto_132410 ?auto_132413 ) ) ( not ( = ?auto_132410 ?auto_132414 ) ) ( not ( = ?auto_132410 ?auto_132415 ) ) ( not ( = ?auto_132410 ?auto_132416 ) ) ( not ( = ?auto_132410 ?auto_132417 ) ) ( not ( = ?auto_132411 ?auto_132412 ) ) ( not ( = ?auto_132411 ?auto_132413 ) ) ( not ( = ?auto_132411 ?auto_132414 ) ) ( not ( = ?auto_132411 ?auto_132415 ) ) ( not ( = ?auto_132411 ?auto_132416 ) ) ( not ( = ?auto_132411 ?auto_132417 ) ) ( not ( = ?auto_132412 ?auto_132413 ) ) ( not ( = ?auto_132412 ?auto_132414 ) ) ( not ( = ?auto_132412 ?auto_132415 ) ) ( not ( = ?auto_132412 ?auto_132416 ) ) ( not ( = ?auto_132412 ?auto_132417 ) ) ( not ( = ?auto_132413 ?auto_132414 ) ) ( not ( = ?auto_132413 ?auto_132415 ) ) ( not ( = ?auto_132413 ?auto_132416 ) ) ( not ( = ?auto_132413 ?auto_132417 ) ) ( not ( = ?auto_132414 ?auto_132415 ) ) ( not ( = ?auto_132414 ?auto_132416 ) ) ( not ( = ?auto_132414 ?auto_132417 ) ) ( not ( = ?auto_132415 ?auto_132416 ) ) ( not ( = ?auto_132415 ?auto_132417 ) ) ( not ( = ?auto_132416 ?auto_132417 ) ) ( ON ?auto_132416 ?auto_132417 ) ( ON ?auto_132415 ?auto_132416 ) ( CLEAR ?auto_132413 ) ( ON ?auto_132414 ?auto_132415 ) ( CLEAR ?auto_132414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132407 ?auto_132408 ?auto_132409 ?auto_132410 ?auto_132411 ?auto_132412 ?auto_132413 ?auto_132414 )
      ( MAKE-11PILE ?auto_132407 ?auto_132408 ?auto_132409 ?auto_132410 ?auto_132411 ?auto_132412 ?auto_132413 ?auto_132414 ?auto_132415 ?auto_132416 ?auto_132417 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132429 - BLOCK
      ?auto_132430 - BLOCK
      ?auto_132431 - BLOCK
      ?auto_132432 - BLOCK
      ?auto_132433 - BLOCK
      ?auto_132434 - BLOCK
      ?auto_132435 - BLOCK
      ?auto_132436 - BLOCK
      ?auto_132437 - BLOCK
      ?auto_132438 - BLOCK
      ?auto_132439 - BLOCK
    )
    :vars
    (
      ?auto_132440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132439 ?auto_132440 ) ( ON-TABLE ?auto_132429 ) ( ON ?auto_132430 ?auto_132429 ) ( ON ?auto_132431 ?auto_132430 ) ( ON ?auto_132432 ?auto_132431 ) ( ON ?auto_132433 ?auto_132432 ) ( ON ?auto_132434 ?auto_132433 ) ( not ( = ?auto_132429 ?auto_132430 ) ) ( not ( = ?auto_132429 ?auto_132431 ) ) ( not ( = ?auto_132429 ?auto_132432 ) ) ( not ( = ?auto_132429 ?auto_132433 ) ) ( not ( = ?auto_132429 ?auto_132434 ) ) ( not ( = ?auto_132429 ?auto_132435 ) ) ( not ( = ?auto_132429 ?auto_132436 ) ) ( not ( = ?auto_132429 ?auto_132437 ) ) ( not ( = ?auto_132429 ?auto_132438 ) ) ( not ( = ?auto_132429 ?auto_132439 ) ) ( not ( = ?auto_132429 ?auto_132440 ) ) ( not ( = ?auto_132430 ?auto_132431 ) ) ( not ( = ?auto_132430 ?auto_132432 ) ) ( not ( = ?auto_132430 ?auto_132433 ) ) ( not ( = ?auto_132430 ?auto_132434 ) ) ( not ( = ?auto_132430 ?auto_132435 ) ) ( not ( = ?auto_132430 ?auto_132436 ) ) ( not ( = ?auto_132430 ?auto_132437 ) ) ( not ( = ?auto_132430 ?auto_132438 ) ) ( not ( = ?auto_132430 ?auto_132439 ) ) ( not ( = ?auto_132430 ?auto_132440 ) ) ( not ( = ?auto_132431 ?auto_132432 ) ) ( not ( = ?auto_132431 ?auto_132433 ) ) ( not ( = ?auto_132431 ?auto_132434 ) ) ( not ( = ?auto_132431 ?auto_132435 ) ) ( not ( = ?auto_132431 ?auto_132436 ) ) ( not ( = ?auto_132431 ?auto_132437 ) ) ( not ( = ?auto_132431 ?auto_132438 ) ) ( not ( = ?auto_132431 ?auto_132439 ) ) ( not ( = ?auto_132431 ?auto_132440 ) ) ( not ( = ?auto_132432 ?auto_132433 ) ) ( not ( = ?auto_132432 ?auto_132434 ) ) ( not ( = ?auto_132432 ?auto_132435 ) ) ( not ( = ?auto_132432 ?auto_132436 ) ) ( not ( = ?auto_132432 ?auto_132437 ) ) ( not ( = ?auto_132432 ?auto_132438 ) ) ( not ( = ?auto_132432 ?auto_132439 ) ) ( not ( = ?auto_132432 ?auto_132440 ) ) ( not ( = ?auto_132433 ?auto_132434 ) ) ( not ( = ?auto_132433 ?auto_132435 ) ) ( not ( = ?auto_132433 ?auto_132436 ) ) ( not ( = ?auto_132433 ?auto_132437 ) ) ( not ( = ?auto_132433 ?auto_132438 ) ) ( not ( = ?auto_132433 ?auto_132439 ) ) ( not ( = ?auto_132433 ?auto_132440 ) ) ( not ( = ?auto_132434 ?auto_132435 ) ) ( not ( = ?auto_132434 ?auto_132436 ) ) ( not ( = ?auto_132434 ?auto_132437 ) ) ( not ( = ?auto_132434 ?auto_132438 ) ) ( not ( = ?auto_132434 ?auto_132439 ) ) ( not ( = ?auto_132434 ?auto_132440 ) ) ( not ( = ?auto_132435 ?auto_132436 ) ) ( not ( = ?auto_132435 ?auto_132437 ) ) ( not ( = ?auto_132435 ?auto_132438 ) ) ( not ( = ?auto_132435 ?auto_132439 ) ) ( not ( = ?auto_132435 ?auto_132440 ) ) ( not ( = ?auto_132436 ?auto_132437 ) ) ( not ( = ?auto_132436 ?auto_132438 ) ) ( not ( = ?auto_132436 ?auto_132439 ) ) ( not ( = ?auto_132436 ?auto_132440 ) ) ( not ( = ?auto_132437 ?auto_132438 ) ) ( not ( = ?auto_132437 ?auto_132439 ) ) ( not ( = ?auto_132437 ?auto_132440 ) ) ( not ( = ?auto_132438 ?auto_132439 ) ) ( not ( = ?auto_132438 ?auto_132440 ) ) ( not ( = ?auto_132439 ?auto_132440 ) ) ( ON ?auto_132438 ?auto_132439 ) ( ON ?auto_132437 ?auto_132438 ) ( ON ?auto_132436 ?auto_132437 ) ( CLEAR ?auto_132434 ) ( ON ?auto_132435 ?auto_132436 ) ( CLEAR ?auto_132435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132429 ?auto_132430 ?auto_132431 ?auto_132432 ?auto_132433 ?auto_132434 ?auto_132435 )
      ( MAKE-11PILE ?auto_132429 ?auto_132430 ?auto_132431 ?auto_132432 ?auto_132433 ?auto_132434 ?auto_132435 ?auto_132436 ?auto_132437 ?auto_132438 ?auto_132439 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132452 - BLOCK
      ?auto_132453 - BLOCK
      ?auto_132454 - BLOCK
      ?auto_132455 - BLOCK
      ?auto_132456 - BLOCK
      ?auto_132457 - BLOCK
      ?auto_132458 - BLOCK
      ?auto_132459 - BLOCK
      ?auto_132460 - BLOCK
      ?auto_132461 - BLOCK
      ?auto_132462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132462 ) ( ON-TABLE ?auto_132452 ) ( ON ?auto_132453 ?auto_132452 ) ( ON ?auto_132454 ?auto_132453 ) ( ON ?auto_132455 ?auto_132454 ) ( ON ?auto_132456 ?auto_132455 ) ( ON ?auto_132457 ?auto_132456 ) ( not ( = ?auto_132452 ?auto_132453 ) ) ( not ( = ?auto_132452 ?auto_132454 ) ) ( not ( = ?auto_132452 ?auto_132455 ) ) ( not ( = ?auto_132452 ?auto_132456 ) ) ( not ( = ?auto_132452 ?auto_132457 ) ) ( not ( = ?auto_132452 ?auto_132458 ) ) ( not ( = ?auto_132452 ?auto_132459 ) ) ( not ( = ?auto_132452 ?auto_132460 ) ) ( not ( = ?auto_132452 ?auto_132461 ) ) ( not ( = ?auto_132452 ?auto_132462 ) ) ( not ( = ?auto_132453 ?auto_132454 ) ) ( not ( = ?auto_132453 ?auto_132455 ) ) ( not ( = ?auto_132453 ?auto_132456 ) ) ( not ( = ?auto_132453 ?auto_132457 ) ) ( not ( = ?auto_132453 ?auto_132458 ) ) ( not ( = ?auto_132453 ?auto_132459 ) ) ( not ( = ?auto_132453 ?auto_132460 ) ) ( not ( = ?auto_132453 ?auto_132461 ) ) ( not ( = ?auto_132453 ?auto_132462 ) ) ( not ( = ?auto_132454 ?auto_132455 ) ) ( not ( = ?auto_132454 ?auto_132456 ) ) ( not ( = ?auto_132454 ?auto_132457 ) ) ( not ( = ?auto_132454 ?auto_132458 ) ) ( not ( = ?auto_132454 ?auto_132459 ) ) ( not ( = ?auto_132454 ?auto_132460 ) ) ( not ( = ?auto_132454 ?auto_132461 ) ) ( not ( = ?auto_132454 ?auto_132462 ) ) ( not ( = ?auto_132455 ?auto_132456 ) ) ( not ( = ?auto_132455 ?auto_132457 ) ) ( not ( = ?auto_132455 ?auto_132458 ) ) ( not ( = ?auto_132455 ?auto_132459 ) ) ( not ( = ?auto_132455 ?auto_132460 ) ) ( not ( = ?auto_132455 ?auto_132461 ) ) ( not ( = ?auto_132455 ?auto_132462 ) ) ( not ( = ?auto_132456 ?auto_132457 ) ) ( not ( = ?auto_132456 ?auto_132458 ) ) ( not ( = ?auto_132456 ?auto_132459 ) ) ( not ( = ?auto_132456 ?auto_132460 ) ) ( not ( = ?auto_132456 ?auto_132461 ) ) ( not ( = ?auto_132456 ?auto_132462 ) ) ( not ( = ?auto_132457 ?auto_132458 ) ) ( not ( = ?auto_132457 ?auto_132459 ) ) ( not ( = ?auto_132457 ?auto_132460 ) ) ( not ( = ?auto_132457 ?auto_132461 ) ) ( not ( = ?auto_132457 ?auto_132462 ) ) ( not ( = ?auto_132458 ?auto_132459 ) ) ( not ( = ?auto_132458 ?auto_132460 ) ) ( not ( = ?auto_132458 ?auto_132461 ) ) ( not ( = ?auto_132458 ?auto_132462 ) ) ( not ( = ?auto_132459 ?auto_132460 ) ) ( not ( = ?auto_132459 ?auto_132461 ) ) ( not ( = ?auto_132459 ?auto_132462 ) ) ( not ( = ?auto_132460 ?auto_132461 ) ) ( not ( = ?auto_132460 ?auto_132462 ) ) ( not ( = ?auto_132461 ?auto_132462 ) ) ( ON ?auto_132461 ?auto_132462 ) ( ON ?auto_132460 ?auto_132461 ) ( ON ?auto_132459 ?auto_132460 ) ( CLEAR ?auto_132457 ) ( ON ?auto_132458 ?auto_132459 ) ( CLEAR ?auto_132458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132452 ?auto_132453 ?auto_132454 ?auto_132455 ?auto_132456 ?auto_132457 ?auto_132458 )
      ( MAKE-11PILE ?auto_132452 ?auto_132453 ?auto_132454 ?auto_132455 ?auto_132456 ?auto_132457 ?auto_132458 ?auto_132459 ?auto_132460 ?auto_132461 ?auto_132462 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132474 - BLOCK
      ?auto_132475 - BLOCK
      ?auto_132476 - BLOCK
      ?auto_132477 - BLOCK
      ?auto_132478 - BLOCK
      ?auto_132479 - BLOCK
      ?auto_132480 - BLOCK
      ?auto_132481 - BLOCK
      ?auto_132482 - BLOCK
      ?auto_132483 - BLOCK
      ?auto_132484 - BLOCK
    )
    :vars
    (
      ?auto_132485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132484 ?auto_132485 ) ( ON-TABLE ?auto_132474 ) ( ON ?auto_132475 ?auto_132474 ) ( ON ?auto_132476 ?auto_132475 ) ( ON ?auto_132477 ?auto_132476 ) ( ON ?auto_132478 ?auto_132477 ) ( not ( = ?auto_132474 ?auto_132475 ) ) ( not ( = ?auto_132474 ?auto_132476 ) ) ( not ( = ?auto_132474 ?auto_132477 ) ) ( not ( = ?auto_132474 ?auto_132478 ) ) ( not ( = ?auto_132474 ?auto_132479 ) ) ( not ( = ?auto_132474 ?auto_132480 ) ) ( not ( = ?auto_132474 ?auto_132481 ) ) ( not ( = ?auto_132474 ?auto_132482 ) ) ( not ( = ?auto_132474 ?auto_132483 ) ) ( not ( = ?auto_132474 ?auto_132484 ) ) ( not ( = ?auto_132474 ?auto_132485 ) ) ( not ( = ?auto_132475 ?auto_132476 ) ) ( not ( = ?auto_132475 ?auto_132477 ) ) ( not ( = ?auto_132475 ?auto_132478 ) ) ( not ( = ?auto_132475 ?auto_132479 ) ) ( not ( = ?auto_132475 ?auto_132480 ) ) ( not ( = ?auto_132475 ?auto_132481 ) ) ( not ( = ?auto_132475 ?auto_132482 ) ) ( not ( = ?auto_132475 ?auto_132483 ) ) ( not ( = ?auto_132475 ?auto_132484 ) ) ( not ( = ?auto_132475 ?auto_132485 ) ) ( not ( = ?auto_132476 ?auto_132477 ) ) ( not ( = ?auto_132476 ?auto_132478 ) ) ( not ( = ?auto_132476 ?auto_132479 ) ) ( not ( = ?auto_132476 ?auto_132480 ) ) ( not ( = ?auto_132476 ?auto_132481 ) ) ( not ( = ?auto_132476 ?auto_132482 ) ) ( not ( = ?auto_132476 ?auto_132483 ) ) ( not ( = ?auto_132476 ?auto_132484 ) ) ( not ( = ?auto_132476 ?auto_132485 ) ) ( not ( = ?auto_132477 ?auto_132478 ) ) ( not ( = ?auto_132477 ?auto_132479 ) ) ( not ( = ?auto_132477 ?auto_132480 ) ) ( not ( = ?auto_132477 ?auto_132481 ) ) ( not ( = ?auto_132477 ?auto_132482 ) ) ( not ( = ?auto_132477 ?auto_132483 ) ) ( not ( = ?auto_132477 ?auto_132484 ) ) ( not ( = ?auto_132477 ?auto_132485 ) ) ( not ( = ?auto_132478 ?auto_132479 ) ) ( not ( = ?auto_132478 ?auto_132480 ) ) ( not ( = ?auto_132478 ?auto_132481 ) ) ( not ( = ?auto_132478 ?auto_132482 ) ) ( not ( = ?auto_132478 ?auto_132483 ) ) ( not ( = ?auto_132478 ?auto_132484 ) ) ( not ( = ?auto_132478 ?auto_132485 ) ) ( not ( = ?auto_132479 ?auto_132480 ) ) ( not ( = ?auto_132479 ?auto_132481 ) ) ( not ( = ?auto_132479 ?auto_132482 ) ) ( not ( = ?auto_132479 ?auto_132483 ) ) ( not ( = ?auto_132479 ?auto_132484 ) ) ( not ( = ?auto_132479 ?auto_132485 ) ) ( not ( = ?auto_132480 ?auto_132481 ) ) ( not ( = ?auto_132480 ?auto_132482 ) ) ( not ( = ?auto_132480 ?auto_132483 ) ) ( not ( = ?auto_132480 ?auto_132484 ) ) ( not ( = ?auto_132480 ?auto_132485 ) ) ( not ( = ?auto_132481 ?auto_132482 ) ) ( not ( = ?auto_132481 ?auto_132483 ) ) ( not ( = ?auto_132481 ?auto_132484 ) ) ( not ( = ?auto_132481 ?auto_132485 ) ) ( not ( = ?auto_132482 ?auto_132483 ) ) ( not ( = ?auto_132482 ?auto_132484 ) ) ( not ( = ?auto_132482 ?auto_132485 ) ) ( not ( = ?auto_132483 ?auto_132484 ) ) ( not ( = ?auto_132483 ?auto_132485 ) ) ( not ( = ?auto_132484 ?auto_132485 ) ) ( ON ?auto_132483 ?auto_132484 ) ( ON ?auto_132482 ?auto_132483 ) ( ON ?auto_132481 ?auto_132482 ) ( ON ?auto_132480 ?auto_132481 ) ( CLEAR ?auto_132478 ) ( ON ?auto_132479 ?auto_132480 ) ( CLEAR ?auto_132479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132474 ?auto_132475 ?auto_132476 ?auto_132477 ?auto_132478 ?auto_132479 )
      ( MAKE-11PILE ?auto_132474 ?auto_132475 ?auto_132476 ?auto_132477 ?auto_132478 ?auto_132479 ?auto_132480 ?auto_132481 ?auto_132482 ?auto_132483 ?auto_132484 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132497 - BLOCK
      ?auto_132498 - BLOCK
      ?auto_132499 - BLOCK
      ?auto_132500 - BLOCK
      ?auto_132501 - BLOCK
      ?auto_132502 - BLOCK
      ?auto_132503 - BLOCK
      ?auto_132504 - BLOCK
      ?auto_132505 - BLOCK
      ?auto_132506 - BLOCK
      ?auto_132507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132507 ) ( ON-TABLE ?auto_132497 ) ( ON ?auto_132498 ?auto_132497 ) ( ON ?auto_132499 ?auto_132498 ) ( ON ?auto_132500 ?auto_132499 ) ( ON ?auto_132501 ?auto_132500 ) ( not ( = ?auto_132497 ?auto_132498 ) ) ( not ( = ?auto_132497 ?auto_132499 ) ) ( not ( = ?auto_132497 ?auto_132500 ) ) ( not ( = ?auto_132497 ?auto_132501 ) ) ( not ( = ?auto_132497 ?auto_132502 ) ) ( not ( = ?auto_132497 ?auto_132503 ) ) ( not ( = ?auto_132497 ?auto_132504 ) ) ( not ( = ?auto_132497 ?auto_132505 ) ) ( not ( = ?auto_132497 ?auto_132506 ) ) ( not ( = ?auto_132497 ?auto_132507 ) ) ( not ( = ?auto_132498 ?auto_132499 ) ) ( not ( = ?auto_132498 ?auto_132500 ) ) ( not ( = ?auto_132498 ?auto_132501 ) ) ( not ( = ?auto_132498 ?auto_132502 ) ) ( not ( = ?auto_132498 ?auto_132503 ) ) ( not ( = ?auto_132498 ?auto_132504 ) ) ( not ( = ?auto_132498 ?auto_132505 ) ) ( not ( = ?auto_132498 ?auto_132506 ) ) ( not ( = ?auto_132498 ?auto_132507 ) ) ( not ( = ?auto_132499 ?auto_132500 ) ) ( not ( = ?auto_132499 ?auto_132501 ) ) ( not ( = ?auto_132499 ?auto_132502 ) ) ( not ( = ?auto_132499 ?auto_132503 ) ) ( not ( = ?auto_132499 ?auto_132504 ) ) ( not ( = ?auto_132499 ?auto_132505 ) ) ( not ( = ?auto_132499 ?auto_132506 ) ) ( not ( = ?auto_132499 ?auto_132507 ) ) ( not ( = ?auto_132500 ?auto_132501 ) ) ( not ( = ?auto_132500 ?auto_132502 ) ) ( not ( = ?auto_132500 ?auto_132503 ) ) ( not ( = ?auto_132500 ?auto_132504 ) ) ( not ( = ?auto_132500 ?auto_132505 ) ) ( not ( = ?auto_132500 ?auto_132506 ) ) ( not ( = ?auto_132500 ?auto_132507 ) ) ( not ( = ?auto_132501 ?auto_132502 ) ) ( not ( = ?auto_132501 ?auto_132503 ) ) ( not ( = ?auto_132501 ?auto_132504 ) ) ( not ( = ?auto_132501 ?auto_132505 ) ) ( not ( = ?auto_132501 ?auto_132506 ) ) ( not ( = ?auto_132501 ?auto_132507 ) ) ( not ( = ?auto_132502 ?auto_132503 ) ) ( not ( = ?auto_132502 ?auto_132504 ) ) ( not ( = ?auto_132502 ?auto_132505 ) ) ( not ( = ?auto_132502 ?auto_132506 ) ) ( not ( = ?auto_132502 ?auto_132507 ) ) ( not ( = ?auto_132503 ?auto_132504 ) ) ( not ( = ?auto_132503 ?auto_132505 ) ) ( not ( = ?auto_132503 ?auto_132506 ) ) ( not ( = ?auto_132503 ?auto_132507 ) ) ( not ( = ?auto_132504 ?auto_132505 ) ) ( not ( = ?auto_132504 ?auto_132506 ) ) ( not ( = ?auto_132504 ?auto_132507 ) ) ( not ( = ?auto_132505 ?auto_132506 ) ) ( not ( = ?auto_132505 ?auto_132507 ) ) ( not ( = ?auto_132506 ?auto_132507 ) ) ( ON ?auto_132506 ?auto_132507 ) ( ON ?auto_132505 ?auto_132506 ) ( ON ?auto_132504 ?auto_132505 ) ( ON ?auto_132503 ?auto_132504 ) ( CLEAR ?auto_132501 ) ( ON ?auto_132502 ?auto_132503 ) ( CLEAR ?auto_132502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132497 ?auto_132498 ?auto_132499 ?auto_132500 ?auto_132501 ?auto_132502 )
      ( MAKE-11PILE ?auto_132497 ?auto_132498 ?auto_132499 ?auto_132500 ?auto_132501 ?auto_132502 ?auto_132503 ?auto_132504 ?auto_132505 ?auto_132506 ?auto_132507 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132519 - BLOCK
      ?auto_132520 - BLOCK
      ?auto_132521 - BLOCK
      ?auto_132522 - BLOCK
      ?auto_132523 - BLOCK
      ?auto_132524 - BLOCK
      ?auto_132525 - BLOCK
      ?auto_132526 - BLOCK
      ?auto_132527 - BLOCK
      ?auto_132528 - BLOCK
      ?auto_132529 - BLOCK
    )
    :vars
    (
      ?auto_132530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132529 ?auto_132530 ) ( ON-TABLE ?auto_132519 ) ( ON ?auto_132520 ?auto_132519 ) ( ON ?auto_132521 ?auto_132520 ) ( ON ?auto_132522 ?auto_132521 ) ( not ( = ?auto_132519 ?auto_132520 ) ) ( not ( = ?auto_132519 ?auto_132521 ) ) ( not ( = ?auto_132519 ?auto_132522 ) ) ( not ( = ?auto_132519 ?auto_132523 ) ) ( not ( = ?auto_132519 ?auto_132524 ) ) ( not ( = ?auto_132519 ?auto_132525 ) ) ( not ( = ?auto_132519 ?auto_132526 ) ) ( not ( = ?auto_132519 ?auto_132527 ) ) ( not ( = ?auto_132519 ?auto_132528 ) ) ( not ( = ?auto_132519 ?auto_132529 ) ) ( not ( = ?auto_132519 ?auto_132530 ) ) ( not ( = ?auto_132520 ?auto_132521 ) ) ( not ( = ?auto_132520 ?auto_132522 ) ) ( not ( = ?auto_132520 ?auto_132523 ) ) ( not ( = ?auto_132520 ?auto_132524 ) ) ( not ( = ?auto_132520 ?auto_132525 ) ) ( not ( = ?auto_132520 ?auto_132526 ) ) ( not ( = ?auto_132520 ?auto_132527 ) ) ( not ( = ?auto_132520 ?auto_132528 ) ) ( not ( = ?auto_132520 ?auto_132529 ) ) ( not ( = ?auto_132520 ?auto_132530 ) ) ( not ( = ?auto_132521 ?auto_132522 ) ) ( not ( = ?auto_132521 ?auto_132523 ) ) ( not ( = ?auto_132521 ?auto_132524 ) ) ( not ( = ?auto_132521 ?auto_132525 ) ) ( not ( = ?auto_132521 ?auto_132526 ) ) ( not ( = ?auto_132521 ?auto_132527 ) ) ( not ( = ?auto_132521 ?auto_132528 ) ) ( not ( = ?auto_132521 ?auto_132529 ) ) ( not ( = ?auto_132521 ?auto_132530 ) ) ( not ( = ?auto_132522 ?auto_132523 ) ) ( not ( = ?auto_132522 ?auto_132524 ) ) ( not ( = ?auto_132522 ?auto_132525 ) ) ( not ( = ?auto_132522 ?auto_132526 ) ) ( not ( = ?auto_132522 ?auto_132527 ) ) ( not ( = ?auto_132522 ?auto_132528 ) ) ( not ( = ?auto_132522 ?auto_132529 ) ) ( not ( = ?auto_132522 ?auto_132530 ) ) ( not ( = ?auto_132523 ?auto_132524 ) ) ( not ( = ?auto_132523 ?auto_132525 ) ) ( not ( = ?auto_132523 ?auto_132526 ) ) ( not ( = ?auto_132523 ?auto_132527 ) ) ( not ( = ?auto_132523 ?auto_132528 ) ) ( not ( = ?auto_132523 ?auto_132529 ) ) ( not ( = ?auto_132523 ?auto_132530 ) ) ( not ( = ?auto_132524 ?auto_132525 ) ) ( not ( = ?auto_132524 ?auto_132526 ) ) ( not ( = ?auto_132524 ?auto_132527 ) ) ( not ( = ?auto_132524 ?auto_132528 ) ) ( not ( = ?auto_132524 ?auto_132529 ) ) ( not ( = ?auto_132524 ?auto_132530 ) ) ( not ( = ?auto_132525 ?auto_132526 ) ) ( not ( = ?auto_132525 ?auto_132527 ) ) ( not ( = ?auto_132525 ?auto_132528 ) ) ( not ( = ?auto_132525 ?auto_132529 ) ) ( not ( = ?auto_132525 ?auto_132530 ) ) ( not ( = ?auto_132526 ?auto_132527 ) ) ( not ( = ?auto_132526 ?auto_132528 ) ) ( not ( = ?auto_132526 ?auto_132529 ) ) ( not ( = ?auto_132526 ?auto_132530 ) ) ( not ( = ?auto_132527 ?auto_132528 ) ) ( not ( = ?auto_132527 ?auto_132529 ) ) ( not ( = ?auto_132527 ?auto_132530 ) ) ( not ( = ?auto_132528 ?auto_132529 ) ) ( not ( = ?auto_132528 ?auto_132530 ) ) ( not ( = ?auto_132529 ?auto_132530 ) ) ( ON ?auto_132528 ?auto_132529 ) ( ON ?auto_132527 ?auto_132528 ) ( ON ?auto_132526 ?auto_132527 ) ( ON ?auto_132525 ?auto_132526 ) ( ON ?auto_132524 ?auto_132525 ) ( CLEAR ?auto_132522 ) ( ON ?auto_132523 ?auto_132524 ) ( CLEAR ?auto_132523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132519 ?auto_132520 ?auto_132521 ?auto_132522 ?auto_132523 )
      ( MAKE-11PILE ?auto_132519 ?auto_132520 ?auto_132521 ?auto_132522 ?auto_132523 ?auto_132524 ?auto_132525 ?auto_132526 ?auto_132527 ?auto_132528 ?auto_132529 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132542 - BLOCK
      ?auto_132543 - BLOCK
      ?auto_132544 - BLOCK
      ?auto_132545 - BLOCK
      ?auto_132546 - BLOCK
      ?auto_132547 - BLOCK
      ?auto_132548 - BLOCK
      ?auto_132549 - BLOCK
      ?auto_132550 - BLOCK
      ?auto_132551 - BLOCK
      ?auto_132552 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132552 ) ( ON-TABLE ?auto_132542 ) ( ON ?auto_132543 ?auto_132542 ) ( ON ?auto_132544 ?auto_132543 ) ( ON ?auto_132545 ?auto_132544 ) ( not ( = ?auto_132542 ?auto_132543 ) ) ( not ( = ?auto_132542 ?auto_132544 ) ) ( not ( = ?auto_132542 ?auto_132545 ) ) ( not ( = ?auto_132542 ?auto_132546 ) ) ( not ( = ?auto_132542 ?auto_132547 ) ) ( not ( = ?auto_132542 ?auto_132548 ) ) ( not ( = ?auto_132542 ?auto_132549 ) ) ( not ( = ?auto_132542 ?auto_132550 ) ) ( not ( = ?auto_132542 ?auto_132551 ) ) ( not ( = ?auto_132542 ?auto_132552 ) ) ( not ( = ?auto_132543 ?auto_132544 ) ) ( not ( = ?auto_132543 ?auto_132545 ) ) ( not ( = ?auto_132543 ?auto_132546 ) ) ( not ( = ?auto_132543 ?auto_132547 ) ) ( not ( = ?auto_132543 ?auto_132548 ) ) ( not ( = ?auto_132543 ?auto_132549 ) ) ( not ( = ?auto_132543 ?auto_132550 ) ) ( not ( = ?auto_132543 ?auto_132551 ) ) ( not ( = ?auto_132543 ?auto_132552 ) ) ( not ( = ?auto_132544 ?auto_132545 ) ) ( not ( = ?auto_132544 ?auto_132546 ) ) ( not ( = ?auto_132544 ?auto_132547 ) ) ( not ( = ?auto_132544 ?auto_132548 ) ) ( not ( = ?auto_132544 ?auto_132549 ) ) ( not ( = ?auto_132544 ?auto_132550 ) ) ( not ( = ?auto_132544 ?auto_132551 ) ) ( not ( = ?auto_132544 ?auto_132552 ) ) ( not ( = ?auto_132545 ?auto_132546 ) ) ( not ( = ?auto_132545 ?auto_132547 ) ) ( not ( = ?auto_132545 ?auto_132548 ) ) ( not ( = ?auto_132545 ?auto_132549 ) ) ( not ( = ?auto_132545 ?auto_132550 ) ) ( not ( = ?auto_132545 ?auto_132551 ) ) ( not ( = ?auto_132545 ?auto_132552 ) ) ( not ( = ?auto_132546 ?auto_132547 ) ) ( not ( = ?auto_132546 ?auto_132548 ) ) ( not ( = ?auto_132546 ?auto_132549 ) ) ( not ( = ?auto_132546 ?auto_132550 ) ) ( not ( = ?auto_132546 ?auto_132551 ) ) ( not ( = ?auto_132546 ?auto_132552 ) ) ( not ( = ?auto_132547 ?auto_132548 ) ) ( not ( = ?auto_132547 ?auto_132549 ) ) ( not ( = ?auto_132547 ?auto_132550 ) ) ( not ( = ?auto_132547 ?auto_132551 ) ) ( not ( = ?auto_132547 ?auto_132552 ) ) ( not ( = ?auto_132548 ?auto_132549 ) ) ( not ( = ?auto_132548 ?auto_132550 ) ) ( not ( = ?auto_132548 ?auto_132551 ) ) ( not ( = ?auto_132548 ?auto_132552 ) ) ( not ( = ?auto_132549 ?auto_132550 ) ) ( not ( = ?auto_132549 ?auto_132551 ) ) ( not ( = ?auto_132549 ?auto_132552 ) ) ( not ( = ?auto_132550 ?auto_132551 ) ) ( not ( = ?auto_132550 ?auto_132552 ) ) ( not ( = ?auto_132551 ?auto_132552 ) ) ( ON ?auto_132551 ?auto_132552 ) ( ON ?auto_132550 ?auto_132551 ) ( ON ?auto_132549 ?auto_132550 ) ( ON ?auto_132548 ?auto_132549 ) ( ON ?auto_132547 ?auto_132548 ) ( CLEAR ?auto_132545 ) ( ON ?auto_132546 ?auto_132547 ) ( CLEAR ?auto_132546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132542 ?auto_132543 ?auto_132544 ?auto_132545 ?auto_132546 )
      ( MAKE-11PILE ?auto_132542 ?auto_132543 ?auto_132544 ?auto_132545 ?auto_132546 ?auto_132547 ?auto_132548 ?auto_132549 ?auto_132550 ?auto_132551 ?auto_132552 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132564 - BLOCK
      ?auto_132565 - BLOCK
      ?auto_132566 - BLOCK
      ?auto_132567 - BLOCK
      ?auto_132568 - BLOCK
      ?auto_132569 - BLOCK
      ?auto_132570 - BLOCK
      ?auto_132571 - BLOCK
      ?auto_132572 - BLOCK
      ?auto_132573 - BLOCK
      ?auto_132574 - BLOCK
    )
    :vars
    (
      ?auto_132575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132574 ?auto_132575 ) ( ON-TABLE ?auto_132564 ) ( ON ?auto_132565 ?auto_132564 ) ( ON ?auto_132566 ?auto_132565 ) ( not ( = ?auto_132564 ?auto_132565 ) ) ( not ( = ?auto_132564 ?auto_132566 ) ) ( not ( = ?auto_132564 ?auto_132567 ) ) ( not ( = ?auto_132564 ?auto_132568 ) ) ( not ( = ?auto_132564 ?auto_132569 ) ) ( not ( = ?auto_132564 ?auto_132570 ) ) ( not ( = ?auto_132564 ?auto_132571 ) ) ( not ( = ?auto_132564 ?auto_132572 ) ) ( not ( = ?auto_132564 ?auto_132573 ) ) ( not ( = ?auto_132564 ?auto_132574 ) ) ( not ( = ?auto_132564 ?auto_132575 ) ) ( not ( = ?auto_132565 ?auto_132566 ) ) ( not ( = ?auto_132565 ?auto_132567 ) ) ( not ( = ?auto_132565 ?auto_132568 ) ) ( not ( = ?auto_132565 ?auto_132569 ) ) ( not ( = ?auto_132565 ?auto_132570 ) ) ( not ( = ?auto_132565 ?auto_132571 ) ) ( not ( = ?auto_132565 ?auto_132572 ) ) ( not ( = ?auto_132565 ?auto_132573 ) ) ( not ( = ?auto_132565 ?auto_132574 ) ) ( not ( = ?auto_132565 ?auto_132575 ) ) ( not ( = ?auto_132566 ?auto_132567 ) ) ( not ( = ?auto_132566 ?auto_132568 ) ) ( not ( = ?auto_132566 ?auto_132569 ) ) ( not ( = ?auto_132566 ?auto_132570 ) ) ( not ( = ?auto_132566 ?auto_132571 ) ) ( not ( = ?auto_132566 ?auto_132572 ) ) ( not ( = ?auto_132566 ?auto_132573 ) ) ( not ( = ?auto_132566 ?auto_132574 ) ) ( not ( = ?auto_132566 ?auto_132575 ) ) ( not ( = ?auto_132567 ?auto_132568 ) ) ( not ( = ?auto_132567 ?auto_132569 ) ) ( not ( = ?auto_132567 ?auto_132570 ) ) ( not ( = ?auto_132567 ?auto_132571 ) ) ( not ( = ?auto_132567 ?auto_132572 ) ) ( not ( = ?auto_132567 ?auto_132573 ) ) ( not ( = ?auto_132567 ?auto_132574 ) ) ( not ( = ?auto_132567 ?auto_132575 ) ) ( not ( = ?auto_132568 ?auto_132569 ) ) ( not ( = ?auto_132568 ?auto_132570 ) ) ( not ( = ?auto_132568 ?auto_132571 ) ) ( not ( = ?auto_132568 ?auto_132572 ) ) ( not ( = ?auto_132568 ?auto_132573 ) ) ( not ( = ?auto_132568 ?auto_132574 ) ) ( not ( = ?auto_132568 ?auto_132575 ) ) ( not ( = ?auto_132569 ?auto_132570 ) ) ( not ( = ?auto_132569 ?auto_132571 ) ) ( not ( = ?auto_132569 ?auto_132572 ) ) ( not ( = ?auto_132569 ?auto_132573 ) ) ( not ( = ?auto_132569 ?auto_132574 ) ) ( not ( = ?auto_132569 ?auto_132575 ) ) ( not ( = ?auto_132570 ?auto_132571 ) ) ( not ( = ?auto_132570 ?auto_132572 ) ) ( not ( = ?auto_132570 ?auto_132573 ) ) ( not ( = ?auto_132570 ?auto_132574 ) ) ( not ( = ?auto_132570 ?auto_132575 ) ) ( not ( = ?auto_132571 ?auto_132572 ) ) ( not ( = ?auto_132571 ?auto_132573 ) ) ( not ( = ?auto_132571 ?auto_132574 ) ) ( not ( = ?auto_132571 ?auto_132575 ) ) ( not ( = ?auto_132572 ?auto_132573 ) ) ( not ( = ?auto_132572 ?auto_132574 ) ) ( not ( = ?auto_132572 ?auto_132575 ) ) ( not ( = ?auto_132573 ?auto_132574 ) ) ( not ( = ?auto_132573 ?auto_132575 ) ) ( not ( = ?auto_132574 ?auto_132575 ) ) ( ON ?auto_132573 ?auto_132574 ) ( ON ?auto_132572 ?auto_132573 ) ( ON ?auto_132571 ?auto_132572 ) ( ON ?auto_132570 ?auto_132571 ) ( ON ?auto_132569 ?auto_132570 ) ( ON ?auto_132568 ?auto_132569 ) ( CLEAR ?auto_132566 ) ( ON ?auto_132567 ?auto_132568 ) ( CLEAR ?auto_132567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132564 ?auto_132565 ?auto_132566 ?auto_132567 )
      ( MAKE-11PILE ?auto_132564 ?auto_132565 ?auto_132566 ?auto_132567 ?auto_132568 ?auto_132569 ?auto_132570 ?auto_132571 ?auto_132572 ?auto_132573 ?auto_132574 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132587 - BLOCK
      ?auto_132588 - BLOCK
      ?auto_132589 - BLOCK
      ?auto_132590 - BLOCK
      ?auto_132591 - BLOCK
      ?auto_132592 - BLOCK
      ?auto_132593 - BLOCK
      ?auto_132594 - BLOCK
      ?auto_132595 - BLOCK
      ?auto_132596 - BLOCK
      ?auto_132597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132597 ) ( ON-TABLE ?auto_132587 ) ( ON ?auto_132588 ?auto_132587 ) ( ON ?auto_132589 ?auto_132588 ) ( not ( = ?auto_132587 ?auto_132588 ) ) ( not ( = ?auto_132587 ?auto_132589 ) ) ( not ( = ?auto_132587 ?auto_132590 ) ) ( not ( = ?auto_132587 ?auto_132591 ) ) ( not ( = ?auto_132587 ?auto_132592 ) ) ( not ( = ?auto_132587 ?auto_132593 ) ) ( not ( = ?auto_132587 ?auto_132594 ) ) ( not ( = ?auto_132587 ?auto_132595 ) ) ( not ( = ?auto_132587 ?auto_132596 ) ) ( not ( = ?auto_132587 ?auto_132597 ) ) ( not ( = ?auto_132588 ?auto_132589 ) ) ( not ( = ?auto_132588 ?auto_132590 ) ) ( not ( = ?auto_132588 ?auto_132591 ) ) ( not ( = ?auto_132588 ?auto_132592 ) ) ( not ( = ?auto_132588 ?auto_132593 ) ) ( not ( = ?auto_132588 ?auto_132594 ) ) ( not ( = ?auto_132588 ?auto_132595 ) ) ( not ( = ?auto_132588 ?auto_132596 ) ) ( not ( = ?auto_132588 ?auto_132597 ) ) ( not ( = ?auto_132589 ?auto_132590 ) ) ( not ( = ?auto_132589 ?auto_132591 ) ) ( not ( = ?auto_132589 ?auto_132592 ) ) ( not ( = ?auto_132589 ?auto_132593 ) ) ( not ( = ?auto_132589 ?auto_132594 ) ) ( not ( = ?auto_132589 ?auto_132595 ) ) ( not ( = ?auto_132589 ?auto_132596 ) ) ( not ( = ?auto_132589 ?auto_132597 ) ) ( not ( = ?auto_132590 ?auto_132591 ) ) ( not ( = ?auto_132590 ?auto_132592 ) ) ( not ( = ?auto_132590 ?auto_132593 ) ) ( not ( = ?auto_132590 ?auto_132594 ) ) ( not ( = ?auto_132590 ?auto_132595 ) ) ( not ( = ?auto_132590 ?auto_132596 ) ) ( not ( = ?auto_132590 ?auto_132597 ) ) ( not ( = ?auto_132591 ?auto_132592 ) ) ( not ( = ?auto_132591 ?auto_132593 ) ) ( not ( = ?auto_132591 ?auto_132594 ) ) ( not ( = ?auto_132591 ?auto_132595 ) ) ( not ( = ?auto_132591 ?auto_132596 ) ) ( not ( = ?auto_132591 ?auto_132597 ) ) ( not ( = ?auto_132592 ?auto_132593 ) ) ( not ( = ?auto_132592 ?auto_132594 ) ) ( not ( = ?auto_132592 ?auto_132595 ) ) ( not ( = ?auto_132592 ?auto_132596 ) ) ( not ( = ?auto_132592 ?auto_132597 ) ) ( not ( = ?auto_132593 ?auto_132594 ) ) ( not ( = ?auto_132593 ?auto_132595 ) ) ( not ( = ?auto_132593 ?auto_132596 ) ) ( not ( = ?auto_132593 ?auto_132597 ) ) ( not ( = ?auto_132594 ?auto_132595 ) ) ( not ( = ?auto_132594 ?auto_132596 ) ) ( not ( = ?auto_132594 ?auto_132597 ) ) ( not ( = ?auto_132595 ?auto_132596 ) ) ( not ( = ?auto_132595 ?auto_132597 ) ) ( not ( = ?auto_132596 ?auto_132597 ) ) ( ON ?auto_132596 ?auto_132597 ) ( ON ?auto_132595 ?auto_132596 ) ( ON ?auto_132594 ?auto_132595 ) ( ON ?auto_132593 ?auto_132594 ) ( ON ?auto_132592 ?auto_132593 ) ( ON ?auto_132591 ?auto_132592 ) ( CLEAR ?auto_132589 ) ( ON ?auto_132590 ?auto_132591 ) ( CLEAR ?auto_132590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132587 ?auto_132588 ?auto_132589 ?auto_132590 )
      ( MAKE-11PILE ?auto_132587 ?auto_132588 ?auto_132589 ?auto_132590 ?auto_132591 ?auto_132592 ?auto_132593 ?auto_132594 ?auto_132595 ?auto_132596 ?auto_132597 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132609 - BLOCK
      ?auto_132610 - BLOCK
      ?auto_132611 - BLOCK
      ?auto_132612 - BLOCK
      ?auto_132613 - BLOCK
      ?auto_132614 - BLOCK
      ?auto_132615 - BLOCK
      ?auto_132616 - BLOCK
      ?auto_132617 - BLOCK
      ?auto_132618 - BLOCK
      ?auto_132619 - BLOCK
    )
    :vars
    (
      ?auto_132620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132619 ?auto_132620 ) ( ON-TABLE ?auto_132609 ) ( ON ?auto_132610 ?auto_132609 ) ( not ( = ?auto_132609 ?auto_132610 ) ) ( not ( = ?auto_132609 ?auto_132611 ) ) ( not ( = ?auto_132609 ?auto_132612 ) ) ( not ( = ?auto_132609 ?auto_132613 ) ) ( not ( = ?auto_132609 ?auto_132614 ) ) ( not ( = ?auto_132609 ?auto_132615 ) ) ( not ( = ?auto_132609 ?auto_132616 ) ) ( not ( = ?auto_132609 ?auto_132617 ) ) ( not ( = ?auto_132609 ?auto_132618 ) ) ( not ( = ?auto_132609 ?auto_132619 ) ) ( not ( = ?auto_132609 ?auto_132620 ) ) ( not ( = ?auto_132610 ?auto_132611 ) ) ( not ( = ?auto_132610 ?auto_132612 ) ) ( not ( = ?auto_132610 ?auto_132613 ) ) ( not ( = ?auto_132610 ?auto_132614 ) ) ( not ( = ?auto_132610 ?auto_132615 ) ) ( not ( = ?auto_132610 ?auto_132616 ) ) ( not ( = ?auto_132610 ?auto_132617 ) ) ( not ( = ?auto_132610 ?auto_132618 ) ) ( not ( = ?auto_132610 ?auto_132619 ) ) ( not ( = ?auto_132610 ?auto_132620 ) ) ( not ( = ?auto_132611 ?auto_132612 ) ) ( not ( = ?auto_132611 ?auto_132613 ) ) ( not ( = ?auto_132611 ?auto_132614 ) ) ( not ( = ?auto_132611 ?auto_132615 ) ) ( not ( = ?auto_132611 ?auto_132616 ) ) ( not ( = ?auto_132611 ?auto_132617 ) ) ( not ( = ?auto_132611 ?auto_132618 ) ) ( not ( = ?auto_132611 ?auto_132619 ) ) ( not ( = ?auto_132611 ?auto_132620 ) ) ( not ( = ?auto_132612 ?auto_132613 ) ) ( not ( = ?auto_132612 ?auto_132614 ) ) ( not ( = ?auto_132612 ?auto_132615 ) ) ( not ( = ?auto_132612 ?auto_132616 ) ) ( not ( = ?auto_132612 ?auto_132617 ) ) ( not ( = ?auto_132612 ?auto_132618 ) ) ( not ( = ?auto_132612 ?auto_132619 ) ) ( not ( = ?auto_132612 ?auto_132620 ) ) ( not ( = ?auto_132613 ?auto_132614 ) ) ( not ( = ?auto_132613 ?auto_132615 ) ) ( not ( = ?auto_132613 ?auto_132616 ) ) ( not ( = ?auto_132613 ?auto_132617 ) ) ( not ( = ?auto_132613 ?auto_132618 ) ) ( not ( = ?auto_132613 ?auto_132619 ) ) ( not ( = ?auto_132613 ?auto_132620 ) ) ( not ( = ?auto_132614 ?auto_132615 ) ) ( not ( = ?auto_132614 ?auto_132616 ) ) ( not ( = ?auto_132614 ?auto_132617 ) ) ( not ( = ?auto_132614 ?auto_132618 ) ) ( not ( = ?auto_132614 ?auto_132619 ) ) ( not ( = ?auto_132614 ?auto_132620 ) ) ( not ( = ?auto_132615 ?auto_132616 ) ) ( not ( = ?auto_132615 ?auto_132617 ) ) ( not ( = ?auto_132615 ?auto_132618 ) ) ( not ( = ?auto_132615 ?auto_132619 ) ) ( not ( = ?auto_132615 ?auto_132620 ) ) ( not ( = ?auto_132616 ?auto_132617 ) ) ( not ( = ?auto_132616 ?auto_132618 ) ) ( not ( = ?auto_132616 ?auto_132619 ) ) ( not ( = ?auto_132616 ?auto_132620 ) ) ( not ( = ?auto_132617 ?auto_132618 ) ) ( not ( = ?auto_132617 ?auto_132619 ) ) ( not ( = ?auto_132617 ?auto_132620 ) ) ( not ( = ?auto_132618 ?auto_132619 ) ) ( not ( = ?auto_132618 ?auto_132620 ) ) ( not ( = ?auto_132619 ?auto_132620 ) ) ( ON ?auto_132618 ?auto_132619 ) ( ON ?auto_132617 ?auto_132618 ) ( ON ?auto_132616 ?auto_132617 ) ( ON ?auto_132615 ?auto_132616 ) ( ON ?auto_132614 ?auto_132615 ) ( ON ?auto_132613 ?auto_132614 ) ( ON ?auto_132612 ?auto_132613 ) ( CLEAR ?auto_132610 ) ( ON ?auto_132611 ?auto_132612 ) ( CLEAR ?auto_132611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132609 ?auto_132610 ?auto_132611 )
      ( MAKE-11PILE ?auto_132609 ?auto_132610 ?auto_132611 ?auto_132612 ?auto_132613 ?auto_132614 ?auto_132615 ?auto_132616 ?auto_132617 ?auto_132618 ?auto_132619 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132632 - BLOCK
      ?auto_132633 - BLOCK
      ?auto_132634 - BLOCK
      ?auto_132635 - BLOCK
      ?auto_132636 - BLOCK
      ?auto_132637 - BLOCK
      ?auto_132638 - BLOCK
      ?auto_132639 - BLOCK
      ?auto_132640 - BLOCK
      ?auto_132641 - BLOCK
      ?auto_132642 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132642 ) ( ON-TABLE ?auto_132632 ) ( ON ?auto_132633 ?auto_132632 ) ( not ( = ?auto_132632 ?auto_132633 ) ) ( not ( = ?auto_132632 ?auto_132634 ) ) ( not ( = ?auto_132632 ?auto_132635 ) ) ( not ( = ?auto_132632 ?auto_132636 ) ) ( not ( = ?auto_132632 ?auto_132637 ) ) ( not ( = ?auto_132632 ?auto_132638 ) ) ( not ( = ?auto_132632 ?auto_132639 ) ) ( not ( = ?auto_132632 ?auto_132640 ) ) ( not ( = ?auto_132632 ?auto_132641 ) ) ( not ( = ?auto_132632 ?auto_132642 ) ) ( not ( = ?auto_132633 ?auto_132634 ) ) ( not ( = ?auto_132633 ?auto_132635 ) ) ( not ( = ?auto_132633 ?auto_132636 ) ) ( not ( = ?auto_132633 ?auto_132637 ) ) ( not ( = ?auto_132633 ?auto_132638 ) ) ( not ( = ?auto_132633 ?auto_132639 ) ) ( not ( = ?auto_132633 ?auto_132640 ) ) ( not ( = ?auto_132633 ?auto_132641 ) ) ( not ( = ?auto_132633 ?auto_132642 ) ) ( not ( = ?auto_132634 ?auto_132635 ) ) ( not ( = ?auto_132634 ?auto_132636 ) ) ( not ( = ?auto_132634 ?auto_132637 ) ) ( not ( = ?auto_132634 ?auto_132638 ) ) ( not ( = ?auto_132634 ?auto_132639 ) ) ( not ( = ?auto_132634 ?auto_132640 ) ) ( not ( = ?auto_132634 ?auto_132641 ) ) ( not ( = ?auto_132634 ?auto_132642 ) ) ( not ( = ?auto_132635 ?auto_132636 ) ) ( not ( = ?auto_132635 ?auto_132637 ) ) ( not ( = ?auto_132635 ?auto_132638 ) ) ( not ( = ?auto_132635 ?auto_132639 ) ) ( not ( = ?auto_132635 ?auto_132640 ) ) ( not ( = ?auto_132635 ?auto_132641 ) ) ( not ( = ?auto_132635 ?auto_132642 ) ) ( not ( = ?auto_132636 ?auto_132637 ) ) ( not ( = ?auto_132636 ?auto_132638 ) ) ( not ( = ?auto_132636 ?auto_132639 ) ) ( not ( = ?auto_132636 ?auto_132640 ) ) ( not ( = ?auto_132636 ?auto_132641 ) ) ( not ( = ?auto_132636 ?auto_132642 ) ) ( not ( = ?auto_132637 ?auto_132638 ) ) ( not ( = ?auto_132637 ?auto_132639 ) ) ( not ( = ?auto_132637 ?auto_132640 ) ) ( not ( = ?auto_132637 ?auto_132641 ) ) ( not ( = ?auto_132637 ?auto_132642 ) ) ( not ( = ?auto_132638 ?auto_132639 ) ) ( not ( = ?auto_132638 ?auto_132640 ) ) ( not ( = ?auto_132638 ?auto_132641 ) ) ( not ( = ?auto_132638 ?auto_132642 ) ) ( not ( = ?auto_132639 ?auto_132640 ) ) ( not ( = ?auto_132639 ?auto_132641 ) ) ( not ( = ?auto_132639 ?auto_132642 ) ) ( not ( = ?auto_132640 ?auto_132641 ) ) ( not ( = ?auto_132640 ?auto_132642 ) ) ( not ( = ?auto_132641 ?auto_132642 ) ) ( ON ?auto_132641 ?auto_132642 ) ( ON ?auto_132640 ?auto_132641 ) ( ON ?auto_132639 ?auto_132640 ) ( ON ?auto_132638 ?auto_132639 ) ( ON ?auto_132637 ?auto_132638 ) ( ON ?auto_132636 ?auto_132637 ) ( ON ?auto_132635 ?auto_132636 ) ( CLEAR ?auto_132633 ) ( ON ?auto_132634 ?auto_132635 ) ( CLEAR ?auto_132634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132632 ?auto_132633 ?auto_132634 )
      ( MAKE-11PILE ?auto_132632 ?auto_132633 ?auto_132634 ?auto_132635 ?auto_132636 ?auto_132637 ?auto_132638 ?auto_132639 ?auto_132640 ?auto_132641 ?auto_132642 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132654 - BLOCK
      ?auto_132655 - BLOCK
      ?auto_132656 - BLOCK
      ?auto_132657 - BLOCK
      ?auto_132658 - BLOCK
      ?auto_132659 - BLOCK
      ?auto_132660 - BLOCK
      ?auto_132661 - BLOCK
      ?auto_132662 - BLOCK
      ?auto_132663 - BLOCK
      ?auto_132664 - BLOCK
    )
    :vars
    (
      ?auto_132665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132664 ?auto_132665 ) ( ON-TABLE ?auto_132654 ) ( not ( = ?auto_132654 ?auto_132655 ) ) ( not ( = ?auto_132654 ?auto_132656 ) ) ( not ( = ?auto_132654 ?auto_132657 ) ) ( not ( = ?auto_132654 ?auto_132658 ) ) ( not ( = ?auto_132654 ?auto_132659 ) ) ( not ( = ?auto_132654 ?auto_132660 ) ) ( not ( = ?auto_132654 ?auto_132661 ) ) ( not ( = ?auto_132654 ?auto_132662 ) ) ( not ( = ?auto_132654 ?auto_132663 ) ) ( not ( = ?auto_132654 ?auto_132664 ) ) ( not ( = ?auto_132654 ?auto_132665 ) ) ( not ( = ?auto_132655 ?auto_132656 ) ) ( not ( = ?auto_132655 ?auto_132657 ) ) ( not ( = ?auto_132655 ?auto_132658 ) ) ( not ( = ?auto_132655 ?auto_132659 ) ) ( not ( = ?auto_132655 ?auto_132660 ) ) ( not ( = ?auto_132655 ?auto_132661 ) ) ( not ( = ?auto_132655 ?auto_132662 ) ) ( not ( = ?auto_132655 ?auto_132663 ) ) ( not ( = ?auto_132655 ?auto_132664 ) ) ( not ( = ?auto_132655 ?auto_132665 ) ) ( not ( = ?auto_132656 ?auto_132657 ) ) ( not ( = ?auto_132656 ?auto_132658 ) ) ( not ( = ?auto_132656 ?auto_132659 ) ) ( not ( = ?auto_132656 ?auto_132660 ) ) ( not ( = ?auto_132656 ?auto_132661 ) ) ( not ( = ?auto_132656 ?auto_132662 ) ) ( not ( = ?auto_132656 ?auto_132663 ) ) ( not ( = ?auto_132656 ?auto_132664 ) ) ( not ( = ?auto_132656 ?auto_132665 ) ) ( not ( = ?auto_132657 ?auto_132658 ) ) ( not ( = ?auto_132657 ?auto_132659 ) ) ( not ( = ?auto_132657 ?auto_132660 ) ) ( not ( = ?auto_132657 ?auto_132661 ) ) ( not ( = ?auto_132657 ?auto_132662 ) ) ( not ( = ?auto_132657 ?auto_132663 ) ) ( not ( = ?auto_132657 ?auto_132664 ) ) ( not ( = ?auto_132657 ?auto_132665 ) ) ( not ( = ?auto_132658 ?auto_132659 ) ) ( not ( = ?auto_132658 ?auto_132660 ) ) ( not ( = ?auto_132658 ?auto_132661 ) ) ( not ( = ?auto_132658 ?auto_132662 ) ) ( not ( = ?auto_132658 ?auto_132663 ) ) ( not ( = ?auto_132658 ?auto_132664 ) ) ( not ( = ?auto_132658 ?auto_132665 ) ) ( not ( = ?auto_132659 ?auto_132660 ) ) ( not ( = ?auto_132659 ?auto_132661 ) ) ( not ( = ?auto_132659 ?auto_132662 ) ) ( not ( = ?auto_132659 ?auto_132663 ) ) ( not ( = ?auto_132659 ?auto_132664 ) ) ( not ( = ?auto_132659 ?auto_132665 ) ) ( not ( = ?auto_132660 ?auto_132661 ) ) ( not ( = ?auto_132660 ?auto_132662 ) ) ( not ( = ?auto_132660 ?auto_132663 ) ) ( not ( = ?auto_132660 ?auto_132664 ) ) ( not ( = ?auto_132660 ?auto_132665 ) ) ( not ( = ?auto_132661 ?auto_132662 ) ) ( not ( = ?auto_132661 ?auto_132663 ) ) ( not ( = ?auto_132661 ?auto_132664 ) ) ( not ( = ?auto_132661 ?auto_132665 ) ) ( not ( = ?auto_132662 ?auto_132663 ) ) ( not ( = ?auto_132662 ?auto_132664 ) ) ( not ( = ?auto_132662 ?auto_132665 ) ) ( not ( = ?auto_132663 ?auto_132664 ) ) ( not ( = ?auto_132663 ?auto_132665 ) ) ( not ( = ?auto_132664 ?auto_132665 ) ) ( ON ?auto_132663 ?auto_132664 ) ( ON ?auto_132662 ?auto_132663 ) ( ON ?auto_132661 ?auto_132662 ) ( ON ?auto_132660 ?auto_132661 ) ( ON ?auto_132659 ?auto_132660 ) ( ON ?auto_132658 ?auto_132659 ) ( ON ?auto_132657 ?auto_132658 ) ( ON ?auto_132656 ?auto_132657 ) ( CLEAR ?auto_132654 ) ( ON ?auto_132655 ?auto_132656 ) ( CLEAR ?auto_132655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132654 ?auto_132655 )
      ( MAKE-11PILE ?auto_132654 ?auto_132655 ?auto_132656 ?auto_132657 ?auto_132658 ?auto_132659 ?auto_132660 ?auto_132661 ?auto_132662 ?auto_132663 ?auto_132664 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132677 - BLOCK
      ?auto_132678 - BLOCK
      ?auto_132679 - BLOCK
      ?auto_132680 - BLOCK
      ?auto_132681 - BLOCK
      ?auto_132682 - BLOCK
      ?auto_132683 - BLOCK
      ?auto_132684 - BLOCK
      ?auto_132685 - BLOCK
      ?auto_132686 - BLOCK
      ?auto_132687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132687 ) ( ON-TABLE ?auto_132677 ) ( not ( = ?auto_132677 ?auto_132678 ) ) ( not ( = ?auto_132677 ?auto_132679 ) ) ( not ( = ?auto_132677 ?auto_132680 ) ) ( not ( = ?auto_132677 ?auto_132681 ) ) ( not ( = ?auto_132677 ?auto_132682 ) ) ( not ( = ?auto_132677 ?auto_132683 ) ) ( not ( = ?auto_132677 ?auto_132684 ) ) ( not ( = ?auto_132677 ?auto_132685 ) ) ( not ( = ?auto_132677 ?auto_132686 ) ) ( not ( = ?auto_132677 ?auto_132687 ) ) ( not ( = ?auto_132678 ?auto_132679 ) ) ( not ( = ?auto_132678 ?auto_132680 ) ) ( not ( = ?auto_132678 ?auto_132681 ) ) ( not ( = ?auto_132678 ?auto_132682 ) ) ( not ( = ?auto_132678 ?auto_132683 ) ) ( not ( = ?auto_132678 ?auto_132684 ) ) ( not ( = ?auto_132678 ?auto_132685 ) ) ( not ( = ?auto_132678 ?auto_132686 ) ) ( not ( = ?auto_132678 ?auto_132687 ) ) ( not ( = ?auto_132679 ?auto_132680 ) ) ( not ( = ?auto_132679 ?auto_132681 ) ) ( not ( = ?auto_132679 ?auto_132682 ) ) ( not ( = ?auto_132679 ?auto_132683 ) ) ( not ( = ?auto_132679 ?auto_132684 ) ) ( not ( = ?auto_132679 ?auto_132685 ) ) ( not ( = ?auto_132679 ?auto_132686 ) ) ( not ( = ?auto_132679 ?auto_132687 ) ) ( not ( = ?auto_132680 ?auto_132681 ) ) ( not ( = ?auto_132680 ?auto_132682 ) ) ( not ( = ?auto_132680 ?auto_132683 ) ) ( not ( = ?auto_132680 ?auto_132684 ) ) ( not ( = ?auto_132680 ?auto_132685 ) ) ( not ( = ?auto_132680 ?auto_132686 ) ) ( not ( = ?auto_132680 ?auto_132687 ) ) ( not ( = ?auto_132681 ?auto_132682 ) ) ( not ( = ?auto_132681 ?auto_132683 ) ) ( not ( = ?auto_132681 ?auto_132684 ) ) ( not ( = ?auto_132681 ?auto_132685 ) ) ( not ( = ?auto_132681 ?auto_132686 ) ) ( not ( = ?auto_132681 ?auto_132687 ) ) ( not ( = ?auto_132682 ?auto_132683 ) ) ( not ( = ?auto_132682 ?auto_132684 ) ) ( not ( = ?auto_132682 ?auto_132685 ) ) ( not ( = ?auto_132682 ?auto_132686 ) ) ( not ( = ?auto_132682 ?auto_132687 ) ) ( not ( = ?auto_132683 ?auto_132684 ) ) ( not ( = ?auto_132683 ?auto_132685 ) ) ( not ( = ?auto_132683 ?auto_132686 ) ) ( not ( = ?auto_132683 ?auto_132687 ) ) ( not ( = ?auto_132684 ?auto_132685 ) ) ( not ( = ?auto_132684 ?auto_132686 ) ) ( not ( = ?auto_132684 ?auto_132687 ) ) ( not ( = ?auto_132685 ?auto_132686 ) ) ( not ( = ?auto_132685 ?auto_132687 ) ) ( not ( = ?auto_132686 ?auto_132687 ) ) ( ON ?auto_132686 ?auto_132687 ) ( ON ?auto_132685 ?auto_132686 ) ( ON ?auto_132684 ?auto_132685 ) ( ON ?auto_132683 ?auto_132684 ) ( ON ?auto_132682 ?auto_132683 ) ( ON ?auto_132681 ?auto_132682 ) ( ON ?auto_132680 ?auto_132681 ) ( ON ?auto_132679 ?auto_132680 ) ( CLEAR ?auto_132677 ) ( ON ?auto_132678 ?auto_132679 ) ( CLEAR ?auto_132678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132677 ?auto_132678 )
      ( MAKE-11PILE ?auto_132677 ?auto_132678 ?auto_132679 ?auto_132680 ?auto_132681 ?auto_132682 ?auto_132683 ?auto_132684 ?auto_132685 ?auto_132686 ?auto_132687 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132699 - BLOCK
      ?auto_132700 - BLOCK
      ?auto_132701 - BLOCK
      ?auto_132702 - BLOCK
      ?auto_132703 - BLOCK
      ?auto_132704 - BLOCK
      ?auto_132705 - BLOCK
      ?auto_132706 - BLOCK
      ?auto_132707 - BLOCK
      ?auto_132708 - BLOCK
      ?auto_132709 - BLOCK
    )
    :vars
    (
      ?auto_132710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132709 ?auto_132710 ) ( not ( = ?auto_132699 ?auto_132700 ) ) ( not ( = ?auto_132699 ?auto_132701 ) ) ( not ( = ?auto_132699 ?auto_132702 ) ) ( not ( = ?auto_132699 ?auto_132703 ) ) ( not ( = ?auto_132699 ?auto_132704 ) ) ( not ( = ?auto_132699 ?auto_132705 ) ) ( not ( = ?auto_132699 ?auto_132706 ) ) ( not ( = ?auto_132699 ?auto_132707 ) ) ( not ( = ?auto_132699 ?auto_132708 ) ) ( not ( = ?auto_132699 ?auto_132709 ) ) ( not ( = ?auto_132699 ?auto_132710 ) ) ( not ( = ?auto_132700 ?auto_132701 ) ) ( not ( = ?auto_132700 ?auto_132702 ) ) ( not ( = ?auto_132700 ?auto_132703 ) ) ( not ( = ?auto_132700 ?auto_132704 ) ) ( not ( = ?auto_132700 ?auto_132705 ) ) ( not ( = ?auto_132700 ?auto_132706 ) ) ( not ( = ?auto_132700 ?auto_132707 ) ) ( not ( = ?auto_132700 ?auto_132708 ) ) ( not ( = ?auto_132700 ?auto_132709 ) ) ( not ( = ?auto_132700 ?auto_132710 ) ) ( not ( = ?auto_132701 ?auto_132702 ) ) ( not ( = ?auto_132701 ?auto_132703 ) ) ( not ( = ?auto_132701 ?auto_132704 ) ) ( not ( = ?auto_132701 ?auto_132705 ) ) ( not ( = ?auto_132701 ?auto_132706 ) ) ( not ( = ?auto_132701 ?auto_132707 ) ) ( not ( = ?auto_132701 ?auto_132708 ) ) ( not ( = ?auto_132701 ?auto_132709 ) ) ( not ( = ?auto_132701 ?auto_132710 ) ) ( not ( = ?auto_132702 ?auto_132703 ) ) ( not ( = ?auto_132702 ?auto_132704 ) ) ( not ( = ?auto_132702 ?auto_132705 ) ) ( not ( = ?auto_132702 ?auto_132706 ) ) ( not ( = ?auto_132702 ?auto_132707 ) ) ( not ( = ?auto_132702 ?auto_132708 ) ) ( not ( = ?auto_132702 ?auto_132709 ) ) ( not ( = ?auto_132702 ?auto_132710 ) ) ( not ( = ?auto_132703 ?auto_132704 ) ) ( not ( = ?auto_132703 ?auto_132705 ) ) ( not ( = ?auto_132703 ?auto_132706 ) ) ( not ( = ?auto_132703 ?auto_132707 ) ) ( not ( = ?auto_132703 ?auto_132708 ) ) ( not ( = ?auto_132703 ?auto_132709 ) ) ( not ( = ?auto_132703 ?auto_132710 ) ) ( not ( = ?auto_132704 ?auto_132705 ) ) ( not ( = ?auto_132704 ?auto_132706 ) ) ( not ( = ?auto_132704 ?auto_132707 ) ) ( not ( = ?auto_132704 ?auto_132708 ) ) ( not ( = ?auto_132704 ?auto_132709 ) ) ( not ( = ?auto_132704 ?auto_132710 ) ) ( not ( = ?auto_132705 ?auto_132706 ) ) ( not ( = ?auto_132705 ?auto_132707 ) ) ( not ( = ?auto_132705 ?auto_132708 ) ) ( not ( = ?auto_132705 ?auto_132709 ) ) ( not ( = ?auto_132705 ?auto_132710 ) ) ( not ( = ?auto_132706 ?auto_132707 ) ) ( not ( = ?auto_132706 ?auto_132708 ) ) ( not ( = ?auto_132706 ?auto_132709 ) ) ( not ( = ?auto_132706 ?auto_132710 ) ) ( not ( = ?auto_132707 ?auto_132708 ) ) ( not ( = ?auto_132707 ?auto_132709 ) ) ( not ( = ?auto_132707 ?auto_132710 ) ) ( not ( = ?auto_132708 ?auto_132709 ) ) ( not ( = ?auto_132708 ?auto_132710 ) ) ( not ( = ?auto_132709 ?auto_132710 ) ) ( ON ?auto_132708 ?auto_132709 ) ( ON ?auto_132707 ?auto_132708 ) ( ON ?auto_132706 ?auto_132707 ) ( ON ?auto_132705 ?auto_132706 ) ( ON ?auto_132704 ?auto_132705 ) ( ON ?auto_132703 ?auto_132704 ) ( ON ?auto_132702 ?auto_132703 ) ( ON ?auto_132701 ?auto_132702 ) ( ON ?auto_132700 ?auto_132701 ) ( ON ?auto_132699 ?auto_132700 ) ( CLEAR ?auto_132699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132699 )
      ( MAKE-11PILE ?auto_132699 ?auto_132700 ?auto_132701 ?auto_132702 ?auto_132703 ?auto_132704 ?auto_132705 ?auto_132706 ?auto_132707 ?auto_132708 ?auto_132709 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132722 - BLOCK
      ?auto_132723 - BLOCK
      ?auto_132724 - BLOCK
      ?auto_132725 - BLOCK
      ?auto_132726 - BLOCK
      ?auto_132727 - BLOCK
      ?auto_132728 - BLOCK
      ?auto_132729 - BLOCK
      ?auto_132730 - BLOCK
      ?auto_132731 - BLOCK
      ?auto_132732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132732 ) ( not ( = ?auto_132722 ?auto_132723 ) ) ( not ( = ?auto_132722 ?auto_132724 ) ) ( not ( = ?auto_132722 ?auto_132725 ) ) ( not ( = ?auto_132722 ?auto_132726 ) ) ( not ( = ?auto_132722 ?auto_132727 ) ) ( not ( = ?auto_132722 ?auto_132728 ) ) ( not ( = ?auto_132722 ?auto_132729 ) ) ( not ( = ?auto_132722 ?auto_132730 ) ) ( not ( = ?auto_132722 ?auto_132731 ) ) ( not ( = ?auto_132722 ?auto_132732 ) ) ( not ( = ?auto_132723 ?auto_132724 ) ) ( not ( = ?auto_132723 ?auto_132725 ) ) ( not ( = ?auto_132723 ?auto_132726 ) ) ( not ( = ?auto_132723 ?auto_132727 ) ) ( not ( = ?auto_132723 ?auto_132728 ) ) ( not ( = ?auto_132723 ?auto_132729 ) ) ( not ( = ?auto_132723 ?auto_132730 ) ) ( not ( = ?auto_132723 ?auto_132731 ) ) ( not ( = ?auto_132723 ?auto_132732 ) ) ( not ( = ?auto_132724 ?auto_132725 ) ) ( not ( = ?auto_132724 ?auto_132726 ) ) ( not ( = ?auto_132724 ?auto_132727 ) ) ( not ( = ?auto_132724 ?auto_132728 ) ) ( not ( = ?auto_132724 ?auto_132729 ) ) ( not ( = ?auto_132724 ?auto_132730 ) ) ( not ( = ?auto_132724 ?auto_132731 ) ) ( not ( = ?auto_132724 ?auto_132732 ) ) ( not ( = ?auto_132725 ?auto_132726 ) ) ( not ( = ?auto_132725 ?auto_132727 ) ) ( not ( = ?auto_132725 ?auto_132728 ) ) ( not ( = ?auto_132725 ?auto_132729 ) ) ( not ( = ?auto_132725 ?auto_132730 ) ) ( not ( = ?auto_132725 ?auto_132731 ) ) ( not ( = ?auto_132725 ?auto_132732 ) ) ( not ( = ?auto_132726 ?auto_132727 ) ) ( not ( = ?auto_132726 ?auto_132728 ) ) ( not ( = ?auto_132726 ?auto_132729 ) ) ( not ( = ?auto_132726 ?auto_132730 ) ) ( not ( = ?auto_132726 ?auto_132731 ) ) ( not ( = ?auto_132726 ?auto_132732 ) ) ( not ( = ?auto_132727 ?auto_132728 ) ) ( not ( = ?auto_132727 ?auto_132729 ) ) ( not ( = ?auto_132727 ?auto_132730 ) ) ( not ( = ?auto_132727 ?auto_132731 ) ) ( not ( = ?auto_132727 ?auto_132732 ) ) ( not ( = ?auto_132728 ?auto_132729 ) ) ( not ( = ?auto_132728 ?auto_132730 ) ) ( not ( = ?auto_132728 ?auto_132731 ) ) ( not ( = ?auto_132728 ?auto_132732 ) ) ( not ( = ?auto_132729 ?auto_132730 ) ) ( not ( = ?auto_132729 ?auto_132731 ) ) ( not ( = ?auto_132729 ?auto_132732 ) ) ( not ( = ?auto_132730 ?auto_132731 ) ) ( not ( = ?auto_132730 ?auto_132732 ) ) ( not ( = ?auto_132731 ?auto_132732 ) ) ( ON ?auto_132731 ?auto_132732 ) ( ON ?auto_132730 ?auto_132731 ) ( ON ?auto_132729 ?auto_132730 ) ( ON ?auto_132728 ?auto_132729 ) ( ON ?auto_132727 ?auto_132728 ) ( ON ?auto_132726 ?auto_132727 ) ( ON ?auto_132725 ?auto_132726 ) ( ON ?auto_132724 ?auto_132725 ) ( ON ?auto_132723 ?auto_132724 ) ( ON ?auto_132722 ?auto_132723 ) ( CLEAR ?auto_132722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132722 )
      ( MAKE-11PILE ?auto_132722 ?auto_132723 ?auto_132724 ?auto_132725 ?auto_132726 ?auto_132727 ?auto_132728 ?auto_132729 ?auto_132730 ?auto_132731 ?auto_132732 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_132744 - BLOCK
      ?auto_132745 - BLOCK
      ?auto_132746 - BLOCK
      ?auto_132747 - BLOCK
      ?auto_132748 - BLOCK
      ?auto_132749 - BLOCK
      ?auto_132750 - BLOCK
      ?auto_132751 - BLOCK
      ?auto_132752 - BLOCK
      ?auto_132753 - BLOCK
      ?auto_132754 - BLOCK
    )
    :vars
    (
      ?auto_132755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132744 ?auto_132745 ) ) ( not ( = ?auto_132744 ?auto_132746 ) ) ( not ( = ?auto_132744 ?auto_132747 ) ) ( not ( = ?auto_132744 ?auto_132748 ) ) ( not ( = ?auto_132744 ?auto_132749 ) ) ( not ( = ?auto_132744 ?auto_132750 ) ) ( not ( = ?auto_132744 ?auto_132751 ) ) ( not ( = ?auto_132744 ?auto_132752 ) ) ( not ( = ?auto_132744 ?auto_132753 ) ) ( not ( = ?auto_132744 ?auto_132754 ) ) ( not ( = ?auto_132745 ?auto_132746 ) ) ( not ( = ?auto_132745 ?auto_132747 ) ) ( not ( = ?auto_132745 ?auto_132748 ) ) ( not ( = ?auto_132745 ?auto_132749 ) ) ( not ( = ?auto_132745 ?auto_132750 ) ) ( not ( = ?auto_132745 ?auto_132751 ) ) ( not ( = ?auto_132745 ?auto_132752 ) ) ( not ( = ?auto_132745 ?auto_132753 ) ) ( not ( = ?auto_132745 ?auto_132754 ) ) ( not ( = ?auto_132746 ?auto_132747 ) ) ( not ( = ?auto_132746 ?auto_132748 ) ) ( not ( = ?auto_132746 ?auto_132749 ) ) ( not ( = ?auto_132746 ?auto_132750 ) ) ( not ( = ?auto_132746 ?auto_132751 ) ) ( not ( = ?auto_132746 ?auto_132752 ) ) ( not ( = ?auto_132746 ?auto_132753 ) ) ( not ( = ?auto_132746 ?auto_132754 ) ) ( not ( = ?auto_132747 ?auto_132748 ) ) ( not ( = ?auto_132747 ?auto_132749 ) ) ( not ( = ?auto_132747 ?auto_132750 ) ) ( not ( = ?auto_132747 ?auto_132751 ) ) ( not ( = ?auto_132747 ?auto_132752 ) ) ( not ( = ?auto_132747 ?auto_132753 ) ) ( not ( = ?auto_132747 ?auto_132754 ) ) ( not ( = ?auto_132748 ?auto_132749 ) ) ( not ( = ?auto_132748 ?auto_132750 ) ) ( not ( = ?auto_132748 ?auto_132751 ) ) ( not ( = ?auto_132748 ?auto_132752 ) ) ( not ( = ?auto_132748 ?auto_132753 ) ) ( not ( = ?auto_132748 ?auto_132754 ) ) ( not ( = ?auto_132749 ?auto_132750 ) ) ( not ( = ?auto_132749 ?auto_132751 ) ) ( not ( = ?auto_132749 ?auto_132752 ) ) ( not ( = ?auto_132749 ?auto_132753 ) ) ( not ( = ?auto_132749 ?auto_132754 ) ) ( not ( = ?auto_132750 ?auto_132751 ) ) ( not ( = ?auto_132750 ?auto_132752 ) ) ( not ( = ?auto_132750 ?auto_132753 ) ) ( not ( = ?auto_132750 ?auto_132754 ) ) ( not ( = ?auto_132751 ?auto_132752 ) ) ( not ( = ?auto_132751 ?auto_132753 ) ) ( not ( = ?auto_132751 ?auto_132754 ) ) ( not ( = ?auto_132752 ?auto_132753 ) ) ( not ( = ?auto_132752 ?auto_132754 ) ) ( not ( = ?auto_132753 ?auto_132754 ) ) ( ON ?auto_132744 ?auto_132755 ) ( not ( = ?auto_132754 ?auto_132755 ) ) ( not ( = ?auto_132753 ?auto_132755 ) ) ( not ( = ?auto_132752 ?auto_132755 ) ) ( not ( = ?auto_132751 ?auto_132755 ) ) ( not ( = ?auto_132750 ?auto_132755 ) ) ( not ( = ?auto_132749 ?auto_132755 ) ) ( not ( = ?auto_132748 ?auto_132755 ) ) ( not ( = ?auto_132747 ?auto_132755 ) ) ( not ( = ?auto_132746 ?auto_132755 ) ) ( not ( = ?auto_132745 ?auto_132755 ) ) ( not ( = ?auto_132744 ?auto_132755 ) ) ( ON ?auto_132745 ?auto_132744 ) ( ON ?auto_132746 ?auto_132745 ) ( ON ?auto_132747 ?auto_132746 ) ( ON ?auto_132748 ?auto_132747 ) ( ON ?auto_132749 ?auto_132748 ) ( ON ?auto_132750 ?auto_132749 ) ( ON ?auto_132751 ?auto_132750 ) ( ON ?auto_132752 ?auto_132751 ) ( ON ?auto_132753 ?auto_132752 ) ( ON ?auto_132754 ?auto_132753 ) ( CLEAR ?auto_132754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_132754 ?auto_132753 ?auto_132752 ?auto_132751 ?auto_132750 ?auto_132749 ?auto_132748 ?auto_132747 ?auto_132746 ?auto_132745 ?auto_132744 )
      ( MAKE-11PILE ?auto_132744 ?auto_132745 ?auto_132746 ?auto_132747 ?auto_132748 ?auto_132749 ?auto_132750 ?auto_132751 ?auto_132752 ?auto_132753 ?auto_132754 ) )
  )

)

