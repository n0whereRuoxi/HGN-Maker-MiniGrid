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
      ?auto_459725 - BLOCK
    )
    :vars
    (
      ?auto_459726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459725 ?auto_459726 ) ( CLEAR ?auto_459725 ) ( HAND-EMPTY ) ( not ( = ?auto_459725 ?auto_459726 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_459725 ?auto_459726 )
      ( !PUTDOWN ?auto_459725 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_459728 - BLOCK
    )
    :vars
    (
      ?auto_459729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459728 ?auto_459729 ) ( CLEAR ?auto_459728 ) ( HAND-EMPTY ) ( not ( = ?auto_459728 ?auto_459729 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_459728 ?auto_459729 )
      ( !PUTDOWN ?auto_459728 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_459732 - BLOCK
      ?auto_459733 - BLOCK
    )
    :vars
    (
      ?auto_459734 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_459732 ) ( ON ?auto_459733 ?auto_459734 ) ( CLEAR ?auto_459733 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_459732 ) ( not ( = ?auto_459732 ?auto_459733 ) ) ( not ( = ?auto_459732 ?auto_459734 ) ) ( not ( = ?auto_459733 ?auto_459734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_459733 ?auto_459734 )
      ( !STACK ?auto_459733 ?auto_459732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_459737 - BLOCK
      ?auto_459738 - BLOCK
    )
    :vars
    (
      ?auto_459739 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_459737 ) ( ON ?auto_459738 ?auto_459739 ) ( CLEAR ?auto_459738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_459737 ) ( not ( = ?auto_459737 ?auto_459738 ) ) ( not ( = ?auto_459737 ?auto_459739 ) ) ( not ( = ?auto_459738 ?auto_459739 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_459738 ?auto_459739 )
      ( !STACK ?auto_459738 ?auto_459737 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_459742 - BLOCK
      ?auto_459743 - BLOCK
    )
    :vars
    (
      ?auto_459744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459743 ?auto_459744 ) ( not ( = ?auto_459742 ?auto_459743 ) ) ( not ( = ?auto_459742 ?auto_459744 ) ) ( not ( = ?auto_459743 ?auto_459744 ) ) ( ON ?auto_459742 ?auto_459743 ) ( CLEAR ?auto_459742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_459742 )
      ( MAKE-2PILE ?auto_459742 ?auto_459743 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_459747 - BLOCK
      ?auto_459748 - BLOCK
    )
    :vars
    (
      ?auto_459749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459748 ?auto_459749 ) ( not ( = ?auto_459747 ?auto_459748 ) ) ( not ( = ?auto_459747 ?auto_459749 ) ) ( not ( = ?auto_459748 ?auto_459749 ) ) ( ON ?auto_459747 ?auto_459748 ) ( CLEAR ?auto_459747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_459747 )
      ( MAKE-2PILE ?auto_459747 ?auto_459748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_459753 - BLOCK
      ?auto_459754 - BLOCK
      ?auto_459755 - BLOCK
    )
    :vars
    (
      ?auto_459756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_459754 ) ( ON ?auto_459755 ?auto_459756 ) ( CLEAR ?auto_459755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_459753 ) ( ON ?auto_459754 ?auto_459753 ) ( not ( = ?auto_459753 ?auto_459754 ) ) ( not ( = ?auto_459753 ?auto_459755 ) ) ( not ( = ?auto_459753 ?auto_459756 ) ) ( not ( = ?auto_459754 ?auto_459755 ) ) ( not ( = ?auto_459754 ?auto_459756 ) ) ( not ( = ?auto_459755 ?auto_459756 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_459755 ?auto_459756 )
      ( !STACK ?auto_459755 ?auto_459754 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_459760 - BLOCK
      ?auto_459761 - BLOCK
      ?auto_459762 - BLOCK
    )
    :vars
    (
      ?auto_459763 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_459761 ) ( ON ?auto_459762 ?auto_459763 ) ( CLEAR ?auto_459762 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_459760 ) ( ON ?auto_459761 ?auto_459760 ) ( not ( = ?auto_459760 ?auto_459761 ) ) ( not ( = ?auto_459760 ?auto_459762 ) ) ( not ( = ?auto_459760 ?auto_459763 ) ) ( not ( = ?auto_459761 ?auto_459762 ) ) ( not ( = ?auto_459761 ?auto_459763 ) ) ( not ( = ?auto_459762 ?auto_459763 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_459762 ?auto_459763 )
      ( !STACK ?auto_459762 ?auto_459761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_459767 - BLOCK
      ?auto_459768 - BLOCK
      ?auto_459769 - BLOCK
    )
    :vars
    (
      ?auto_459770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459769 ?auto_459770 ) ( ON-TABLE ?auto_459767 ) ( not ( = ?auto_459767 ?auto_459768 ) ) ( not ( = ?auto_459767 ?auto_459769 ) ) ( not ( = ?auto_459767 ?auto_459770 ) ) ( not ( = ?auto_459768 ?auto_459769 ) ) ( not ( = ?auto_459768 ?auto_459770 ) ) ( not ( = ?auto_459769 ?auto_459770 ) ) ( CLEAR ?auto_459767 ) ( ON ?auto_459768 ?auto_459769 ) ( CLEAR ?auto_459768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_459767 ?auto_459768 )
      ( MAKE-3PILE ?auto_459767 ?auto_459768 ?auto_459769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_459774 - BLOCK
      ?auto_459775 - BLOCK
      ?auto_459776 - BLOCK
    )
    :vars
    (
      ?auto_459777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459776 ?auto_459777 ) ( ON-TABLE ?auto_459774 ) ( not ( = ?auto_459774 ?auto_459775 ) ) ( not ( = ?auto_459774 ?auto_459776 ) ) ( not ( = ?auto_459774 ?auto_459777 ) ) ( not ( = ?auto_459775 ?auto_459776 ) ) ( not ( = ?auto_459775 ?auto_459777 ) ) ( not ( = ?auto_459776 ?auto_459777 ) ) ( CLEAR ?auto_459774 ) ( ON ?auto_459775 ?auto_459776 ) ( CLEAR ?auto_459775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_459774 ?auto_459775 )
      ( MAKE-3PILE ?auto_459774 ?auto_459775 ?auto_459776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_459781 - BLOCK
      ?auto_459782 - BLOCK
      ?auto_459783 - BLOCK
    )
    :vars
    (
      ?auto_459784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459783 ?auto_459784 ) ( not ( = ?auto_459781 ?auto_459782 ) ) ( not ( = ?auto_459781 ?auto_459783 ) ) ( not ( = ?auto_459781 ?auto_459784 ) ) ( not ( = ?auto_459782 ?auto_459783 ) ) ( not ( = ?auto_459782 ?auto_459784 ) ) ( not ( = ?auto_459783 ?auto_459784 ) ) ( ON ?auto_459782 ?auto_459783 ) ( ON ?auto_459781 ?auto_459782 ) ( CLEAR ?auto_459781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_459781 )
      ( MAKE-3PILE ?auto_459781 ?auto_459782 ?auto_459783 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_459788 - BLOCK
      ?auto_459789 - BLOCK
      ?auto_459790 - BLOCK
    )
    :vars
    (
      ?auto_459791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459790 ?auto_459791 ) ( not ( = ?auto_459788 ?auto_459789 ) ) ( not ( = ?auto_459788 ?auto_459790 ) ) ( not ( = ?auto_459788 ?auto_459791 ) ) ( not ( = ?auto_459789 ?auto_459790 ) ) ( not ( = ?auto_459789 ?auto_459791 ) ) ( not ( = ?auto_459790 ?auto_459791 ) ) ( ON ?auto_459789 ?auto_459790 ) ( ON ?auto_459788 ?auto_459789 ) ( CLEAR ?auto_459788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_459788 )
      ( MAKE-3PILE ?auto_459788 ?auto_459789 ?auto_459790 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_459796 - BLOCK
      ?auto_459797 - BLOCK
      ?auto_459798 - BLOCK
      ?auto_459799 - BLOCK
    )
    :vars
    (
      ?auto_459800 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_459798 ) ( ON ?auto_459799 ?auto_459800 ) ( CLEAR ?auto_459799 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_459796 ) ( ON ?auto_459797 ?auto_459796 ) ( ON ?auto_459798 ?auto_459797 ) ( not ( = ?auto_459796 ?auto_459797 ) ) ( not ( = ?auto_459796 ?auto_459798 ) ) ( not ( = ?auto_459796 ?auto_459799 ) ) ( not ( = ?auto_459796 ?auto_459800 ) ) ( not ( = ?auto_459797 ?auto_459798 ) ) ( not ( = ?auto_459797 ?auto_459799 ) ) ( not ( = ?auto_459797 ?auto_459800 ) ) ( not ( = ?auto_459798 ?auto_459799 ) ) ( not ( = ?auto_459798 ?auto_459800 ) ) ( not ( = ?auto_459799 ?auto_459800 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_459799 ?auto_459800 )
      ( !STACK ?auto_459799 ?auto_459798 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_459805 - BLOCK
      ?auto_459806 - BLOCK
      ?auto_459807 - BLOCK
      ?auto_459808 - BLOCK
    )
    :vars
    (
      ?auto_459809 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_459807 ) ( ON ?auto_459808 ?auto_459809 ) ( CLEAR ?auto_459808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_459805 ) ( ON ?auto_459806 ?auto_459805 ) ( ON ?auto_459807 ?auto_459806 ) ( not ( = ?auto_459805 ?auto_459806 ) ) ( not ( = ?auto_459805 ?auto_459807 ) ) ( not ( = ?auto_459805 ?auto_459808 ) ) ( not ( = ?auto_459805 ?auto_459809 ) ) ( not ( = ?auto_459806 ?auto_459807 ) ) ( not ( = ?auto_459806 ?auto_459808 ) ) ( not ( = ?auto_459806 ?auto_459809 ) ) ( not ( = ?auto_459807 ?auto_459808 ) ) ( not ( = ?auto_459807 ?auto_459809 ) ) ( not ( = ?auto_459808 ?auto_459809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_459808 ?auto_459809 )
      ( !STACK ?auto_459808 ?auto_459807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_459814 - BLOCK
      ?auto_459815 - BLOCK
      ?auto_459816 - BLOCK
      ?auto_459817 - BLOCK
    )
    :vars
    (
      ?auto_459818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459817 ?auto_459818 ) ( ON-TABLE ?auto_459814 ) ( ON ?auto_459815 ?auto_459814 ) ( not ( = ?auto_459814 ?auto_459815 ) ) ( not ( = ?auto_459814 ?auto_459816 ) ) ( not ( = ?auto_459814 ?auto_459817 ) ) ( not ( = ?auto_459814 ?auto_459818 ) ) ( not ( = ?auto_459815 ?auto_459816 ) ) ( not ( = ?auto_459815 ?auto_459817 ) ) ( not ( = ?auto_459815 ?auto_459818 ) ) ( not ( = ?auto_459816 ?auto_459817 ) ) ( not ( = ?auto_459816 ?auto_459818 ) ) ( not ( = ?auto_459817 ?auto_459818 ) ) ( CLEAR ?auto_459815 ) ( ON ?auto_459816 ?auto_459817 ) ( CLEAR ?auto_459816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_459814 ?auto_459815 ?auto_459816 )
      ( MAKE-4PILE ?auto_459814 ?auto_459815 ?auto_459816 ?auto_459817 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_459823 - BLOCK
      ?auto_459824 - BLOCK
      ?auto_459825 - BLOCK
      ?auto_459826 - BLOCK
    )
    :vars
    (
      ?auto_459827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459826 ?auto_459827 ) ( ON-TABLE ?auto_459823 ) ( ON ?auto_459824 ?auto_459823 ) ( not ( = ?auto_459823 ?auto_459824 ) ) ( not ( = ?auto_459823 ?auto_459825 ) ) ( not ( = ?auto_459823 ?auto_459826 ) ) ( not ( = ?auto_459823 ?auto_459827 ) ) ( not ( = ?auto_459824 ?auto_459825 ) ) ( not ( = ?auto_459824 ?auto_459826 ) ) ( not ( = ?auto_459824 ?auto_459827 ) ) ( not ( = ?auto_459825 ?auto_459826 ) ) ( not ( = ?auto_459825 ?auto_459827 ) ) ( not ( = ?auto_459826 ?auto_459827 ) ) ( CLEAR ?auto_459824 ) ( ON ?auto_459825 ?auto_459826 ) ( CLEAR ?auto_459825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_459823 ?auto_459824 ?auto_459825 )
      ( MAKE-4PILE ?auto_459823 ?auto_459824 ?auto_459825 ?auto_459826 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_459832 - BLOCK
      ?auto_459833 - BLOCK
      ?auto_459834 - BLOCK
      ?auto_459835 - BLOCK
    )
    :vars
    (
      ?auto_459836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459835 ?auto_459836 ) ( ON-TABLE ?auto_459832 ) ( not ( = ?auto_459832 ?auto_459833 ) ) ( not ( = ?auto_459832 ?auto_459834 ) ) ( not ( = ?auto_459832 ?auto_459835 ) ) ( not ( = ?auto_459832 ?auto_459836 ) ) ( not ( = ?auto_459833 ?auto_459834 ) ) ( not ( = ?auto_459833 ?auto_459835 ) ) ( not ( = ?auto_459833 ?auto_459836 ) ) ( not ( = ?auto_459834 ?auto_459835 ) ) ( not ( = ?auto_459834 ?auto_459836 ) ) ( not ( = ?auto_459835 ?auto_459836 ) ) ( ON ?auto_459834 ?auto_459835 ) ( CLEAR ?auto_459832 ) ( ON ?auto_459833 ?auto_459834 ) ( CLEAR ?auto_459833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_459832 ?auto_459833 )
      ( MAKE-4PILE ?auto_459832 ?auto_459833 ?auto_459834 ?auto_459835 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_459841 - BLOCK
      ?auto_459842 - BLOCK
      ?auto_459843 - BLOCK
      ?auto_459844 - BLOCK
    )
    :vars
    (
      ?auto_459845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459844 ?auto_459845 ) ( ON-TABLE ?auto_459841 ) ( not ( = ?auto_459841 ?auto_459842 ) ) ( not ( = ?auto_459841 ?auto_459843 ) ) ( not ( = ?auto_459841 ?auto_459844 ) ) ( not ( = ?auto_459841 ?auto_459845 ) ) ( not ( = ?auto_459842 ?auto_459843 ) ) ( not ( = ?auto_459842 ?auto_459844 ) ) ( not ( = ?auto_459842 ?auto_459845 ) ) ( not ( = ?auto_459843 ?auto_459844 ) ) ( not ( = ?auto_459843 ?auto_459845 ) ) ( not ( = ?auto_459844 ?auto_459845 ) ) ( ON ?auto_459843 ?auto_459844 ) ( CLEAR ?auto_459841 ) ( ON ?auto_459842 ?auto_459843 ) ( CLEAR ?auto_459842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_459841 ?auto_459842 )
      ( MAKE-4PILE ?auto_459841 ?auto_459842 ?auto_459843 ?auto_459844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_459850 - BLOCK
      ?auto_459851 - BLOCK
      ?auto_459852 - BLOCK
      ?auto_459853 - BLOCK
    )
    :vars
    (
      ?auto_459854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459853 ?auto_459854 ) ( not ( = ?auto_459850 ?auto_459851 ) ) ( not ( = ?auto_459850 ?auto_459852 ) ) ( not ( = ?auto_459850 ?auto_459853 ) ) ( not ( = ?auto_459850 ?auto_459854 ) ) ( not ( = ?auto_459851 ?auto_459852 ) ) ( not ( = ?auto_459851 ?auto_459853 ) ) ( not ( = ?auto_459851 ?auto_459854 ) ) ( not ( = ?auto_459852 ?auto_459853 ) ) ( not ( = ?auto_459852 ?auto_459854 ) ) ( not ( = ?auto_459853 ?auto_459854 ) ) ( ON ?auto_459852 ?auto_459853 ) ( ON ?auto_459851 ?auto_459852 ) ( ON ?auto_459850 ?auto_459851 ) ( CLEAR ?auto_459850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_459850 )
      ( MAKE-4PILE ?auto_459850 ?auto_459851 ?auto_459852 ?auto_459853 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_459859 - BLOCK
      ?auto_459860 - BLOCK
      ?auto_459861 - BLOCK
      ?auto_459862 - BLOCK
    )
    :vars
    (
      ?auto_459863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459862 ?auto_459863 ) ( not ( = ?auto_459859 ?auto_459860 ) ) ( not ( = ?auto_459859 ?auto_459861 ) ) ( not ( = ?auto_459859 ?auto_459862 ) ) ( not ( = ?auto_459859 ?auto_459863 ) ) ( not ( = ?auto_459860 ?auto_459861 ) ) ( not ( = ?auto_459860 ?auto_459862 ) ) ( not ( = ?auto_459860 ?auto_459863 ) ) ( not ( = ?auto_459861 ?auto_459862 ) ) ( not ( = ?auto_459861 ?auto_459863 ) ) ( not ( = ?auto_459862 ?auto_459863 ) ) ( ON ?auto_459861 ?auto_459862 ) ( ON ?auto_459860 ?auto_459861 ) ( ON ?auto_459859 ?auto_459860 ) ( CLEAR ?auto_459859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_459859 )
      ( MAKE-4PILE ?auto_459859 ?auto_459860 ?auto_459861 ?auto_459862 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_459869 - BLOCK
      ?auto_459870 - BLOCK
      ?auto_459871 - BLOCK
      ?auto_459872 - BLOCK
      ?auto_459873 - BLOCK
    )
    :vars
    (
      ?auto_459874 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_459872 ) ( ON ?auto_459873 ?auto_459874 ) ( CLEAR ?auto_459873 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_459869 ) ( ON ?auto_459870 ?auto_459869 ) ( ON ?auto_459871 ?auto_459870 ) ( ON ?auto_459872 ?auto_459871 ) ( not ( = ?auto_459869 ?auto_459870 ) ) ( not ( = ?auto_459869 ?auto_459871 ) ) ( not ( = ?auto_459869 ?auto_459872 ) ) ( not ( = ?auto_459869 ?auto_459873 ) ) ( not ( = ?auto_459869 ?auto_459874 ) ) ( not ( = ?auto_459870 ?auto_459871 ) ) ( not ( = ?auto_459870 ?auto_459872 ) ) ( not ( = ?auto_459870 ?auto_459873 ) ) ( not ( = ?auto_459870 ?auto_459874 ) ) ( not ( = ?auto_459871 ?auto_459872 ) ) ( not ( = ?auto_459871 ?auto_459873 ) ) ( not ( = ?auto_459871 ?auto_459874 ) ) ( not ( = ?auto_459872 ?auto_459873 ) ) ( not ( = ?auto_459872 ?auto_459874 ) ) ( not ( = ?auto_459873 ?auto_459874 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_459873 ?auto_459874 )
      ( !STACK ?auto_459873 ?auto_459872 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_459880 - BLOCK
      ?auto_459881 - BLOCK
      ?auto_459882 - BLOCK
      ?auto_459883 - BLOCK
      ?auto_459884 - BLOCK
    )
    :vars
    (
      ?auto_459885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_459883 ) ( ON ?auto_459884 ?auto_459885 ) ( CLEAR ?auto_459884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_459880 ) ( ON ?auto_459881 ?auto_459880 ) ( ON ?auto_459882 ?auto_459881 ) ( ON ?auto_459883 ?auto_459882 ) ( not ( = ?auto_459880 ?auto_459881 ) ) ( not ( = ?auto_459880 ?auto_459882 ) ) ( not ( = ?auto_459880 ?auto_459883 ) ) ( not ( = ?auto_459880 ?auto_459884 ) ) ( not ( = ?auto_459880 ?auto_459885 ) ) ( not ( = ?auto_459881 ?auto_459882 ) ) ( not ( = ?auto_459881 ?auto_459883 ) ) ( not ( = ?auto_459881 ?auto_459884 ) ) ( not ( = ?auto_459881 ?auto_459885 ) ) ( not ( = ?auto_459882 ?auto_459883 ) ) ( not ( = ?auto_459882 ?auto_459884 ) ) ( not ( = ?auto_459882 ?auto_459885 ) ) ( not ( = ?auto_459883 ?auto_459884 ) ) ( not ( = ?auto_459883 ?auto_459885 ) ) ( not ( = ?auto_459884 ?auto_459885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_459884 ?auto_459885 )
      ( !STACK ?auto_459884 ?auto_459883 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_459891 - BLOCK
      ?auto_459892 - BLOCK
      ?auto_459893 - BLOCK
      ?auto_459894 - BLOCK
      ?auto_459895 - BLOCK
    )
    :vars
    (
      ?auto_459896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459895 ?auto_459896 ) ( ON-TABLE ?auto_459891 ) ( ON ?auto_459892 ?auto_459891 ) ( ON ?auto_459893 ?auto_459892 ) ( not ( = ?auto_459891 ?auto_459892 ) ) ( not ( = ?auto_459891 ?auto_459893 ) ) ( not ( = ?auto_459891 ?auto_459894 ) ) ( not ( = ?auto_459891 ?auto_459895 ) ) ( not ( = ?auto_459891 ?auto_459896 ) ) ( not ( = ?auto_459892 ?auto_459893 ) ) ( not ( = ?auto_459892 ?auto_459894 ) ) ( not ( = ?auto_459892 ?auto_459895 ) ) ( not ( = ?auto_459892 ?auto_459896 ) ) ( not ( = ?auto_459893 ?auto_459894 ) ) ( not ( = ?auto_459893 ?auto_459895 ) ) ( not ( = ?auto_459893 ?auto_459896 ) ) ( not ( = ?auto_459894 ?auto_459895 ) ) ( not ( = ?auto_459894 ?auto_459896 ) ) ( not ( = ?auto_459895 ?auto_459896 ) ) ( CLEAR ?auto_459893 ) ( ON ?auto_459894 ?auto_459895 ) ( CLEAR ?auto_459894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_459891 ?auto_459892 ?auto_459893 ?auto_459894 )
      ( MAKE-5PILE ?auto_459891 ?auto_459892 ?auto_459893 ?auto_459894 ?auto_459895 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_459902 - BLOCK
      ?auto_459903 - BLOCK
      ?auto_459904 - BLOCK
      ?auto_459905 - BLOCK
      ?auto_459906 - BLOCK
    )
    :vars
    (
      ?auto_459907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459906 ?auto_459907 ) ( ON-TABLE ?auto_459902 ) ( ON ?auto_459903 ?auto_459902 ) ( ON ?auto_459904 ?auto_459903 ) ( not ( = ?auto_459902 ?auto_459903 ) ) ( not ( = ?auto_459902 ?auto_459904 ) ) ( not ( = ?auto_459902 ?auto_459905 ) ) ( not ( = ?auto_459902 ?auto_459906 ) ) ( not ( = ?auto_459902 ?auto_459907 ) ) ( not ( = ?auto_459903 ?auto_459904 ) ) ( not ( = ?auto_459903 ?auto_459905 ) ) ( not ( = ?auto_459903 ?auto_459906 ) ) ( not ( = ?auto_459903 ?auto_459907 ) ) ( not ( = ?auto_459904 ?auto_459905 ) ) ( not ( = ?auto_459904 ?auto_459906 ) ) ( not ( = ?auto_459904 ?auto_459907 ) ) ( not ( = ?auto_459905 ?auto_459906 ) ) ( not ( = ?auto_459905 ?auto_459907 ) ) ( not ( = ?auto_459906 ?auto_459907 ) ) ( CLEAR ?auto_459904 ) ( ON ?auto_459905 ?auto_459906 ) ( CLEAR ?auto_459905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_459902 ?auto_459903 ?auto_459904 ?auto_459905 )
      ( MAKE-5PILE ?auto_459902 ?auto_459903 ?auto_459904 ?auto_459905 ?auto_459906 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_459913 - BLOCK
      ?auto_459914 - BLOCK
      ?auto_459915 - BLOCK
      ?auto_459916 - BLOCK
      ?auto_459917 - BLOCK
    )
    :vars
    (
      ?auto_459918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459917 ?auto_459918 ) ( ON-TABLE ?auto_459913 ) ( ON ?auto_459914 ?auto_459913 ) ( not ( = ?auto_459913 ?auto_459914 ) ) ( not ( = ?auto_459913 ?auto_459915 ) ) ( not ( = ?auto_459913 ?auto_459916 ) ) ( not ( = ?auto_459913 ?auto_459917 ) ) ( not ( = ?auto_459913 ?auto_459918 ) ) ( not ( = ?auto_459914 ?auto_459915 ) ) ( not ( = ?auto_459914 ?auto_459916 ) ) ( not ( = ?auto_459914 ?auto_459917 ) ) ( not ( = ?auto_459914 ?auto_459918 ) ) ( not ( = ?auto_459915 ?auto_459916 ) ) ( not ( = ?auto_459915 ?auto_459917 ) ) ( not ( = ?auto_459915 ?auto_459918 ) ) ( not ( = ?auto_459916 ?auto_459917 ) ) ( not ( = ?auto_459916 ?auto_459918 ) ) ( not ( = ?auto_459917 ?auto_459918 ) ) ( ON ?auto_459916 ?auto_459917 ) ( CLEAR ?auto_459914 ) ( ON ?auto_459915 ?auto_459916 ) ( CLEAR ?auto_459915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_459913 ?auto_459914 ?auto_459915 )
      ( MAKE-5PILE ?auto_459913 ?auto_459914 ?auto_459915 ?auto_459916 ?auto_459917 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_459924 - BLOCK
      ?auto_459925 - BLOCK
      ?auto_459926 - BLOCK
      ?auto_459927 - BLOCK
      ?auto_459928 - BLOCK
    )
    :vars
    (
      ?auto_459929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459928 ?auto_459929 ) ( ON-TABLE ?auto_459924 ) ( ON ?auto_459925 ?auto_459924 ) ( not ( = ?auto_459924 ?auto_459925 ) ) ( not ( = ?auto_459924 ?auto_459926 ) ) ( not ( = ?auto_459924 ?auto_459927 ) ) ( not ( = ?auto_459924 ?auto_459928 ) ) ( not ( = ?auto_459924 ?auto_459929 ) ) ( not ( = ?auto_459925 ?auto_459926 ) ) ( not ( = ?auto_459925 ?auto_459927 ) ) ( not ( = ?auto_459925 ?auto_459928 ) ) ( not ( = ?auto_459925 ?auto_459929 ) ) ( not ( = ?auto_459926 ?auto_459927 ) ) ( not ( = ?auto_459926 ?auto_459928 ) ) ( not ( = ?auto_459926 ?auto_459929 ) ) ( not ( = ?auto_459927 ?auto_459928 ) ) ( not ( = ?auto_459927 ?auto_459929 ) ) ( not ( = ?auto_459928 ?auto_459929 ) ) ( ON ?auto_459927 ?auto_459928 ) ( CLEAR ?auto_459925 ) ( ON ?auto_459926 ?auto_459927 ) ( CLEAR ?auto_459926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_459924 ?auto_459925 ?auto_459926 )
      ( MAKE-5PILE ?auto_459924 ?auto_459925 ?auto_459926 ?auto_459927 ?auto_459928 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_459935 - BLOCK
      ?auto_459936 - BLOCK
      ?auto_459937 - BLOCK
      ?auto_459938 - BLOCK
      ?auto_459939 - BLOCK
    )
    :vars
    (
      ?auto_459940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459939 ?auto_459940 ) ( ON-TABLE ?auto_459935 ) ( not ( = ?auto_459935 ?auto_459936 ) ) ( not ( = ?auto_459935 ?auto_459937 ) ) ( not ( = ?auto_459935 ?auto_459938 ) ) ( not ( = ?auto_459935 ?auto_459939 ) ) ( not ( = ?auto_459935 ?auto_459940 ) ) ( not ( = ?auto_459936 ?auto_459937 ) ) ( not ( = ?auto_459936 ?auto_459938 ) ) ( not ( = ?auto_459936 ?auto_459939 ) ) ( not ( = ?auto_459936 ?auto_459940 ) ) ( not ( = ?auto_459937 ?auto_459938 ) ) ( not ( = ?auto_459937 ?auto_459939 ) ) ( not ( = ?auto_459937 ?auto_459940 ) ) ( not ( = ?auto_459938 ?auto_459939 ) ) ( not ( = ?auto_459938 ?auto_459940 ) ) ( not ( = ?auto_459939 ?auto_459940 ) ) ( ON ?auto_459938 ?auto_459939 ) ( ON ?auto_459937 ?auto_459938 ) ( CLEAR ?auto_459935 ) ( ON ?auto_459936 ?auto_459937 ) ( CLEAR ?auto_459936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_459935 ?auto_459936 )
      ( MAKE-5PILE ?auto_459935 ?auto_459936 ?auto_459937 ?auto_459938 ?auto_459939 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_459946 - BLOCK
      ?auto_459947 - BLOCK
      ?auto_459948 - BLOCK
      ?auto_459949 - BLOCK
      ?auto_459950 - BLOCK
    )
    :vars
    (
      ?auto_459951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459950 ?auto_459951 ) ( ON-TABLE ?auto_459946 ) ( not ( = ?auto_459946 ?auto_459947 ) ) ( not ( = ?auto_459946 ?auto_459948 ) ) ( not ( = ?auto_459946 ?auto_459949 ) ) ( not ( = ?auto_459946 ?auto_459950 ) ) ( not ( = ?auto_459946 ?auto_459951 ) ) ( not ( = ?auto_459947 ?auto_459948 ) ) ( not ( = ?auto_459947 ?auto_459949 ) ) ( not ( = ?auto_459947 ?auto_459950 ) ) ( not ( = ?auto_459947 ?auto_459951 ) ) ( not ( = ?auto_459948 ?auto_459949 ) ) ( not ( = ?auto_459948 ?auto_459950 ) ) ( not ( = ?auto_459948 ?auto_459951 ) ) ( not ( = ?auto_459949 ?auto_459950 ) ) ( not ( = ?auto_459949 ?auto_459951 ) ) ( not ( = ?auto_459950 ?auto_459951 ) ) ( ON ?auto_459949 ?auto_459950 ) ( ON ?auto_459948 ?auto_459949 ) ( CLEAR ?auto_459946 ) ( ON ?auto_459947 ?auto_459948 ) ( CLEAR ?auto_459947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_459946 ?auto_459947 )
      ( MAKE-5PILE ?auto_459946 ?auto_459947 ?auto_459948 ?auto_459949 ?auto_459950 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_459957 - BLOCK
      ?auto_459958 - BLOCK
      ?auto_459959 - BLOCK
      ?auto_459960 - BLOCK
      ?auto_459961 - BLOCK
    )
    :vars
    (
      ?auto_459962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459961 ?auto_459962 ) ( not ( = ?auto_459957 ?auto_459958 ) ) ( not ( = ?auto_459957 ?auto_459959 ) ) ( not ( = ?auto_459957 ?auto_459960 ) ) ( not ( = ?auto_459957 ?auto_459961 ) ) ( not ( = ?auto_459957 ?auto_459962 ) ) ( not ( = ?auto_459958 ?auto_459959 ) ) ( not ( = ?auto_459958 ?auto_459960 ) ) ( not ( = ?auto_459958 ?auto_459961 ) ) ( not ( = ?auto_459958 ?auto_459962 ) ) ( not ( = ?auto_459959 ?auto_459960 ) ) ( not ( = ?auto_459959 ?auto_459961 ) ) ( not ( = ?auto_459959 ?auto_459962 ) ) ( not ( = ?auto_459960 ?auto_459961 ) ) ( not ( = ?auto_459960 ?auto_459962 ) ) ( not ( = ?auto_459961 ?auto_459962 ) ) ( ON ?auto_459960 ?auto_459961 ) ( ON ?auto_459959 ?auto_459960 ) ( ON ?auto_459958 ?auto_459959 ) ( ON ?auto_459957 ?auto_459958 ) ( CLEAR ?auto_459957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_459957 )
      ( MAKE-5PILE ?auto_459957 ?auto_459958 ?auto_459959 ?auto_459960 ?auto_459961 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_459968 - BLOCK
      ?auto_459969 - BLOCK
      ?auto_459970 - BLOCK
      ?auto_459971 - BLOCK
      ?auto_459972 - BLOCK
    )
    :vars
    (
      ?auto_459973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459972 ?auto_459973 ) ( not ( = ?auto_459968 ?auto_459969 ) ) ( not ( = ?auto_459968 ?auto_459970 ) ) ( not ( = ?auto_459968 ?auto_459971 ) ) ( not ( = ?auto_459968 ?auto_459972 ) ) ( not ( = ?auto_459968 ?auto_459973 ) ) ( not ( = ?auto_459969 ?auto_459970 ) ) ( not ( = ?auto_459969 ?auto_459971 ) ) ( not ( = ?auto_459969 ?auto_459972 ) ) ( not ( = ?auto_459969 ?auto_459973 ) ) ( not ( = ?auto_459970 ?auto_459971 ) ) ( not ( = ?auto_459970 ?auto_459972 ) ) ( not ( = ?auto_459970 ?auto_459973 ) ) ( not ( = ?auto_459971 ?auto_459972 ) ) ( not ( = ?auto_459971 ?auto_459973 ) ) ( not ( = ?auto_459972 ?auto_459973 ) ) ( ON ?auto_459971 ?auto_459972 ) ( ON ?auto_459970 ?auto_459971 ) ( ON ?auto_459969 ?auto_459970 ) ( ON ?auto_459968 ?auto_459969 ) ( CLEAR ?auto_459968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_459968 )
      ( MAKE-5PILE ?auto_459968 ?auto_459969 ?auto_459970 ?auto_459971 ?auto_459972 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_459980 - BLOCK
      ?auto_459981 - BLOCK
      ?auto_459982 - BLOCK
      ?auto_459983 - BLOCK
      ?auto_459984 - BLOCK
      ?auto_459985 - BLOCK
    )
    :vars
    (
      ?auto_459986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_459984 ) ( ON ?auto_459985 ?auto_459986 ) ( CLEAR ?auto_459985 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_459980 ) ( ON ?auto_459981 ?auto_459980 ) ( ON ?auto_459982 ?auto_459981 ) ( ON ?auto_459983 ?auto_459982 ) ( ON ?auto_459984 ?auto_459983 ) ( not ( = ?auto_459980 ?auto_459981 ) ) ( not ( = ?auto_459980 ?auto_459982 ) ) ( not ( = ?auto_459980 ?auto_459983 ) ) ( not ( = ?auto_459980 ?auto_459984 ) ) ( not ( = ?auto_459980 ?auto_459985 ) ) ( not ( = ?auto_459980 ?auto_459986 ) ) ( not ( = ?auto_459981 ?auto_459982 ) ) ( not ( = ?auto_459981 ?auto_459983 ) ) ( not ( = ?auto_459981 ?auto_459984 ) ) ( not ( = ?auto_459981 ?auto_459985 ) ) ( not ( = ?auto_459981 ?auto_459986 ) ) ( not ( = ?auto_459982 ?auto_459983 ) ) ( not ( = ?auto_459982 ?auto_459984 ) ) ( not ( = ?auto_459982 ?auto_459985 ) ) ( not ( = ?auto_459982 ?auto_459986 ) ) ( not ( = ?auto_459983 ?auto_459984 ) ) ( not ( = ?auto_459983 ?auto_459985 ) ) ( not ( = ?auto_459983 ?auto_459986 ) ) ( not ( = ?auto_459984 ?auto_459985 ) ) ( not ( = ?auto_459984 ?auto_459986 ) ) ( not ( = ?auto_459985 ?auto_459986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_459985 ?auto_459986 )
      ( !STACK ?auto_459985 ?auto_459984 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_459993 - BLOCK
      ?auto_459994 - BLOCK
      ?auto_459995 - BLOCK
      ?auto_459996 - BLOCK
      ?auto_459997 - BLOCK
      ?auto_459998 - BLOCK
    )
    :vars
    (
      ?auto_459999 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_459997 ) ( ON ?auto_459998 ?auto_459999 ) ( CLEAR ?auto_459998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_459993 ) ( ON ?auto_459994 ?auto_459993 ) ( ON ?auto_459995 ?auto_459994 ) ( ON ?auto_459996 ?auto_459995 ) ( ON ?auto_459997 ?auto_459996 ) ( not ( = ?auto_459993 ?auto_459994 ) ) ( not ( = ?auto_459993 ?auto_459995 ) ) ( not ( = ?auto_459993 ?auto_459996 ) ) ( not ( = ?auto_459993 ?auto_459997 ) ) ( not ( = ?auto_459993 ?auto_459998 ) ) ( not ( = ?auto_459993 ?auto_459999 ) ) ( not ( = ?auto_459994 ?auto_459995 ) ) ( not ( = ?auto_459994 ?auto_459996 ) ) ( not ( = ?auto_459994 ?auto_459997 ) ) ( not ( = ?auto_459994 ?auto_459998 ) ) ( not ( = ?auto_459994 ?auto_459999 ) ) ( not ( = ?auto_459995 ?auto_459996 ) ) ( not ( = ?auto_459995 ?auto_459997 ) ) ( not ( = ?auto_459995 ?auto_459998 ) ) ( not ( = ?auto_459995 ?auto_459999 ) ) ( not ( = ?auto_459996 ?auto_459997 ) ) ( not ( = ?auto_459996 ?auto_459998 ) ) ( not ( = ?auto_459996 ?auto_459999 ) ) ( not ( = ?auto_459997 ?auto_459998 ) ) ( not ( = ?auto_459997 ?auto_459999 ) ) ( not ( = ?auto_459998 ?auto_459999 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_459998 ?auto_459999 )
      ( !STACK ?auto_459998 ?auto_459997 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_460006 - BLOCK
      ?auto_460007 - BLOCK
      ?auto_460008 - BLOCK
      ?auto_460009 - BLOCK
      ?auto_460010 - BLOCK
      ?auto_460011 - BLOCK
    )
    :vars
    (
      ?auto_460012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460011 ?auto_460012 ) ( ON-TABLE ?auto_460006 ) ( ON ?auto_460007 ?auto_460006 ) ( ON ?auto_460008 ?auto_460007 ) ( ON ?auto_460009 ?auto_460008 ) ( not ( = ?auto_460006 ?auto_460007 ) ) ( not ( = ?auto_460006 ?auto_460008 ) ) ( not ( = ?auto_460006 ?auto_460009 ) ) ( not ( = ?auto_460006 ?auto_460010 ) ) ( not ( = ?auto_460006 ?auto_460011 ) ) ( not ( = ?auto_460006 ?auto_460012 ) ) ( not ( = ?auto_460007 ?auto_460008 ) ) ( not ( = ?auto_460007 ?auto_460009 ) ) ( not ( = ?auto_460007 ?auto_460010 ) ) ( not ( = ?auto_460007 ?auto_460011 ) ) ( not ( = ?auto_460007 ?auto_460012 ) ) ( not ( = ?auto_460008 ?auto_460009 ) ) ( not ( = ?auto_460008 ?auto_460010 ) ) ( not ( = ?auto_460008 ?auto_460011 ) ) ( not ( = ?auto_460008 ?auto_460012 ) ) ( not ( = ?auto_460009 ?auto_460010 ) ) ( not ( = ?auto_460009 ?auto_460011 ) ) ( not ( = ?auto_460009 ?auto_460012 ) ) ( not ( = ?auto_460010 ?auto_460011 ) ) ( not ( = ?auto_460010 ?auto_460012 ) ) ( not ( = ?auto_460011 ?auto_460012 ) ) ( CLEAR ?auto_460009 ) ( ON ?auto_460010 ?auto_460011 ) ( CLEAR ?auto_460010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_460006 ?auto_460007 ?auto_460008 ?auto_460009 ?auto_460010 )
      ( MAKE-6PILE ?auto_460006 ?auto_460007 ?auto_460008 ?auto_460009 ?auto_460010 ?auto_460011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_460019 - BLOCK
      ?auto_460020 - BLOCK
      ?auto_460021 - BLOCK
      ?auto_460022 - BLOCK
      ?auto_460023 - BLOCK
      ?auto_460024 - BLOCK
    )
    :vars
    (
      ?auto_460025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460024 ?auto_460025 ) ( ON-TABLE ?auto_460019 ) ( ON ?auto_460020 ?auto_460019 ) ( ON ?auto_460021 ?auto_460020 ) ( ON ?auto_460022 ?auto_460021 ) ( not ( = ?auto_460019 ?auto_460020 ) ) ( not ( = ?auto_460019 ?auto_460021 ) ) ( not ( = ?auto_460019 ?auto_460022 ) ) ( not ( = ?auto_460019 ?auto_460023 ) ) ( not ( = ?auto_460019 ?auto_460024 ) ) ( not ( = ?auto_460019 ?auto_460025 ) ) ( not ( = ?auto_460020 ?auto_460021 ) ) ( not ( = ?auto_460020 ?auto_460022 ) ) ( not ( = ?auto_460020 ?auto_460023 ) ) ( not ( = ?auto_460020 ?auto_460024 ) ) ( not ( = ?auto_460020 ?auto_460025 ) ) ( not ( = ?auto_460021 ?auto_460022 ) ) ( not ( = ?auto_460021 ?auto_460023 ) ) ( not ( = ?auto_460021 ?auto_460024 ) ) ( not ( = ?auto_460021 ?auto_460025 ) ) ( not ( = ?auto_460022 ?auto_460023 ) ) ( not ( = ?auto_460022 ?auto_460024 ) ) ( not ( = ?auto_460022 ?auto_460025 ) ) ( not ( = ?auto_460023 ?auto_460024 ) ) ( not ( = ?auto_460023 ?auto_460025 ) ) ( not ( = ?auto_460024 ?auto_460025 ) ) ( CLEAR ?auto_460022 ) ( ON ?auto_460023 ?auto_460024 ) ( CLEAR ?auto_460023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_460019 ?auto_460020 ?auto_460021 ?auto_460022 ?auto_460023 )
      ( MAKE-6PILE ?auto_460019 ?auto_460020 ?auto_460021 ?auto_460022 ?auto_460023 ?auto_460024 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_460032 - BLOCK
      ?auto_460033 - BLOCK
      ?auto_460034 - BLOCK
      ?auto_460035 - BLOCK
      ?auto_460036 - BLOCK
      ?auto_460037 - BLOCK
    )
    :vars
    (
      ?auto_460038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460037 ?auto_460038 ) ( ON-TABLE ?auto_460032 ) ( ON ?auto_460033 ?auto_460032 ) ( ON ?auto_460034 ?auto_460033 ) ( not ( = ?auto_460032 ?auto_460033 ) ) ( not ( = ?auto_460032 ?auto_460034 ) ) ( not ( = ?auto_460032 ?auto_460035 ) ) ( not ( = ?auto_460032 ?auto_460036 ) ) ( not ( = ?auto_460032 ?auto_460037 ) ) ( not ( = ?auto_460032 ?auto_460038 ) ) ( not ( = ?auto_460033 ?auto_460034 ) ) ( not ( = ?auto_460033 ?auto_460035 ) ) ( not ( = ?auto_460033 ?auto_460036 ) ) ( not ( = ?auto_460033 ?auto_460037 ) ) ( not ( = ?auto_460033 ?auto_460038 ) ) ( not ( = ?auto_460034 ?auto_460035 ) ) ( not ( = ?auto_460034 ?auto_460036 ) ) ( not ( = ?auto_460034 ?auto_460037 ) ) ( not ( = ?auto_460034 ?auto_460038 ) ) ( not ( = ?auto_460035 ?auto_460036 ) ) ( not ( = ?auto_460035 ?auto_460037 ) ) ( not ( = ?auto_460035 ?auto_460038 ) ) ( not ( = ?auto_460036 ?auto_460037 ) ) ( not ( = ?auto_460036 ?auto_460038 ) ) ( not ( = ?auto_460037 ?auto_460038 ) ) ( ON ?auto_460036 ?auto_460037 ) ( CLEAR ?auto_460034 ) ( ON ?auto_460035 ?auto_460036 ) ( CLEAR ?auto_460035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_460032 ?auto_460033 ?auto_460034 ?auto_460035 )
      ( MAKE-6PILE ?auto_460032 ?auto_460033 ?auto_460034 ?auto_460035 ?auto_460036 ?auto_460037 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_460045 - BLOCK
      ?auto_460046 - BLOCK
      ?auto_460047 - BLOCK
      ?auto_460048 - BLOCK
      ?auto_460049 - BLOCK
      ?auto_460050 - BLOCK
    )
    :vars
    (
      ?auto_460051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460050 ?auto_460051 ) ( ON-TABLE ?auto_460045 ) ( ON ?auto_460046 ?auto_460045 ) ( ON ?auto_460047 ?auto_460046 ) ( not ( = ?auto_460045 ?auto_460046 ) ) ( not ( = ?auto_460045 ?auto_460047 ) ) ( not ( = ?auto_460045 ?auto_460048 ) ) ( not ( = ?auto_460045 ?auto_460049 ) ) ( not ( = ?auto_460045 ?auto_460050 ) ) ( not ( = ?auto_460045 ?auto_460051 ) ) ( not ( = ?auto_460046 ?auto_460047 ) ) ( not ( = ?auto_460046 ?auto_460048 ) ) ( not ( = ?auto_460046 ?auto_460049 ) ) ( not ( = ?auto_460046 ?auto_460050 ) ) ( not ( = ?auto_460046 ?auto_460051 ) ) ( not ( = ?auto_460047 ?auto_460048 ) ) ( not ( = ?auto_460047 ?auto_460049 ) ) ( not ( = ?auto_460047 ?auto_460050 ) ) ( not ( = ?auto_460047 ?auto_460051 ) ) ( not ( = ?auto_460048 ?auto_460049 ) ) ( not ( = ?auto_460048 ?auto_460050 ) ) ( not ( = ?auto_460048 ?auto_460051 ) ) ( not ( = ?auto_460049 ?auto_460050 ) ) ( not ( = ?auto_460049 ?auto_460051 ) ) ( not ( = ?auto_460050 ?auto_460051 ) ) ( ON ?auto_460049 ?auto_460050 ) ( CLEAR ?auto_460047 ) ( ON ?auto_460048 ?auto_460049 ) ( CLEAR ?auto_460048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_460045 ?auto_460046 ?auto_460047 ?auto_460048 )
      ( MAKE-6PILE ?auto_460045 ?auto_460046 ?auto_460047 ?auto_460048 ?auto_460049 ?auto_460050 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_460058 - BLOCK
      ?auto_460059 - BLOCK
      ?auto_460060 - BLOCK
      ?auto_460061 - BLOCK
      ?auto_460062 - BLOCK
      ?auto_460063 - BLOCK
    )
    :vars
    (
      ?auto_460064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460063 ?auto_460064 ) ( ON-TABLE ?auto_460058 ) ( ON ?auto_460059 ?auto_460058 ) ( not ( = ?auto_460058 ?auto_460059 ) ) ( not ( = ?auto_460058 ?auto_460060 ) ) ( not ( = ?auto_460058 ?auto_460061 ) ) ( not ( = ?auto_460058 ?auto_460062 ) ) ( not ( = ?auto_460058 ?auto_460063 ) ) ( not ( = ?auto_460058 ?auto_460064 ) ) ( not ( = ?auto_460059 ?auto_460060 ) ) ( not ( = ?auto_460059 ?auto_460061 ) ) ( not ( = ?auto_460059 ?auto_460062 ) ) ( not ( = ?auto_460059 ?auto_460063 ) ) ( not ( = ?auto_460059 ?auto_460064 ) ) ( not ( = ?auto_460060 ?auto_460061 ) ) ( not ( = ?auto_460060 ?auto_460062 ) ) ( not ( = ?auto_460060 ?auto_460063 ) ) ( not ( = ?auto_460060 ?auto_460064 ) ) ( not ( = ?auto_460061 ?auto_460062 ) ) ( not ( = ?auto_460061 ?auto_460063 ) ) ( not ( = ?auto_460061 ?auto_460064 ) ) ( not ( = ?auto_460062 ?auto_460063 ) ) ( not ( = ?auto_460062 ?auto_460064 ) ) ( not ( = ?auto_460063 ?auto_460064 ) ) ( ON ?auto_460062 ?auto_460063 ) ( ON ?auto_460061 ?auto_460062 ) ( CLEAR ?auto_460059 ) ( ON ?auto_460060 ?auto_460061 ) ( CLEAR ?auto_460060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_460058 ?auto_460059 ?auto_460060 )
      ( MAKE-6PILE ?auto_460058 ?auto_460059 ?auto_460060 ?auto_460061 ?auto_460062 ?auto_460063 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_460071 - BLOCK
      ?auto_460072 - BLOCK
      ?auto_460073 - BLOCK
      ?auto_460074 - BLOCK
      ?auto_460075 - BLOCK
      ?auto_460076 - BLOCK
    )
    :vars
    (
      ?auto_460077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460076 ?auto_460077 ) ( ON-TABLE ?auto_460071 ) ( ON ?auto_460072 ?auto_460071 ) ( not ( = ?auto_460071 ?auto_460072 ) ) ( not ( = ?auto_460071 ?auto_460073 ) ) ( not ( = ?auto_460071 ?auto_460074 ) ) ( not ( = ?auto_460071 ?auto_460075 ) ) ( not ( = ?auto_460071 ?auto_460076 ) ) ( not ( = ?auto_460071 ?auto_460077 ) ) ( not ( = ?auto_460072 ?auto_460073 ) ) ( not ( = ?auto_460072 ?auto_460074 ) ) ( not ( = ?auto_460072 ?auto_460075 ) ) ( not ( = ?auto_460072 ?auto_460076 ) ) ( not ( = ?auto_460072 ?auto_460077 ) ) ( not ( = ?auto_460073 ?auto_460074 ) ) ( not ( = ?auto_460073 ?auto_460075 ) ) ( not ( = ?auto_460073 ?auto_460076 ) ) ( not ( = ?auto_460073 ?auto_460077 ) ) ( not ( = ?auto_460074 ?auto_460075 ) ) ( not ( = ?auto_460074 ?auto_460076 ) ) ( not ( = ?auto_460074 ?auto_460077 ) ) ( not ( = ?auto_460075 ?auto_460076 ) ) ( not ( = ?auto_460075 ?auto_460077 ) ) ( not ( = ?auto_460076 ?auto_460077 ) ) ( ON ?auto_460075 ?auto_460076 ) ( ON ?auto_460074 ?auto_460075 ) ( CLEAR ?auto_460072 ) ( ON ?auto_460073 ?auto_460074 ) ( CLEAR ?auto_460073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_460071 ?auto_460072 ?auto_460073 )
      ( MAKE-6PILE ?auto_460071 ?auto_460072 ?auto_460073 ?auto_460074 ?auto_460075 ?auto_460076 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_460084 - BLOCK
      ?auto_460085 - BLOCK
      ?auto_460086 - BLOCK
      ?auto_460087 - BLOCK
      ?auto_460088 - BLOCK
      ?auto_460089 - BLOCK
    )
    :vars
    (
      ?auto_460090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460089 ?auto_460090 ) ( ON-TABLE ?auto_460084 ) ( not ( = ?auto_460084 ?auto_460085 ) ) ( not ( = ?auto_460084 ?auto_460086 ) ) ( not ( = ?auto_460084 ?auto_460087 ) ) ( not ( = ?auto_460084 ?auto_460088 ) ) ( not ( = ?auto_460084 ?auto_460089 ) ) ( not ( = ?auto_460084 ?auto_460090 ) ) ( not ( = ?auto_460085 ?auto_460086 ) ) ( not ( = ?auto_460085 ?auto_460087 ) ) ( not ( = ?auto_460085 ?auto_460088 ) ) ( not ( = ?auto_460085 ?auto_460089 ) ) ( not ( = ?auto_460085 ?auto_460090 ) ) ( not ( = ?auto_460086 ?auto_460087 ) ) ( not ( = ?auto_460086 ?auto_460088 ) ) ( not ( = ?auto_460086 ?auto_460089 ) ) ( not ( = ?auto_460086 ?auto_460090 ) ) ( not ( = ?auto_460087 ?auto_460088 ) ) ( not ( = ?auto_460087 ?auto_460089 ) ) ( not ( = ?auto_460087 ?auto_460090 ) ) ( not ( = ?auto_460088 ?auto_460089 ) ) ( not ( = ?auto_460088 ?auto_460090 ) ) ( not ( = ?auto_460089 ?auto_460090 ) ) ( ON ?auto_460088 ?auto_460089 ) ( ON ?auto_460087 ?auto_460088 ) ( ON ?auto_460086 ?auto_460087 ) ( CLEAR ?auto_460084 ) ( ON ?auto_460085 ?auto_460086 ) ( CLEAR ?auto_460085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_460084 ?auto_460085 )
      ( MAKE-6PILE ?auto_460084 ?auto_460085 ?auto_460086 ?auto_460087 ?auto_460088 ?auto_460089 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_460097 - BLOCK
      ?auto_460098 - BLOCK
      ?auto_460099 - BLOCK
      ?auto_460100 - BLOCK
      ?auto_460101 - BLOCK
      ?auto_460102 - BLOCK
    )
    :vars
    (
      ?auto_460103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460102 ?auto_460103 ) ( ON-TABLE ?auto_460097 ) ( not ( = ?auto_460097 ?auto_460098 ) ) ( not ( = ?auto_460097 ?auto_460099 ) ) ( not ( = ?auto_460097 ?auto_460100 ) ) ( not ( = ?auto_460097 ?auto_460101 ) ) ( not ( = ?auto_460097 ?auto_460102 ) ) ( not ( = ?auto_460097 ?auto_460103 ) ) ( not ( = ?auto_460098 ?auto_460099 ) ) ( not ( = ?auto_460098 ?auto_460100 ) ) ( not ( = ?auto_460098 ?auto_460101 ) ) ( not ( = ?auto_460098 ?auto_460102 ) ) ( not ( = ?auto_460098 ?auto_460103 ) ) ( not ( = ?auto_460099 ?auto_460100 ) ) ( not ( = ?auto_460099 ?auto_460101 ) ) ( not ( = ?auto_460099 ?auto_460102 ) ) ( not ( = ?auto_460099 ?auto_460103 ) ) ( not ( = ?auto_460100 ?auto_460101 ) ) ( not ( = ?auto_460100 ?auto_460102 ) ) ( not ( = ?auto_460100 ?auto_460103 ) ) ( not ( = ?auto_460101 ?auto_460102 ) ) ( not ( = ?auto_460101 ?auto_460103 ) ) ( not ( = ?auto_460102 ?auto_460103 ) ) ( ON ?auto_460101 ?auto_460102 ) ( ON ?auto_460100 ?auto_460101 ) ( ON ?auto_460099 ?auto_460100 ) ( CLEAR ?auto_460097 ) ( ON ?auto_460098 ?auto_460099 ) ( CLEAR ?auto_460098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_460097 ?auto_460098 )
      ( MAKE-6PILE ?auto_460097 ?auto_460098 ?auto_460099 ?auto_460100 ?auto_460101 ?auto_460102 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_460110 - BLOCK
      ?auto_460111 - BLOCK
      ?auto_460112 - BLOCK
      ?auto_460113 - BLOCK
      ?auto_460114 - BLOCK
      ?auto_460115 - BLOCK
    )
    :vars
    (
      ?auto_460116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460115 ?auto_460116 ) ( not ( = ?auto_460110 ?auto_460111 ) ) ( not ( = ?auto_460110 ?auto_460112 ) ) ( not ( = ?auto_460110 ?auto_460113 ) ) ( not ( = ?auto_460110 ?auto_460114 ) ) ( not ( = ?auto_460110 ?auto_460115 ) ) ( not ( = ?auto_460110 ?auto_460116 ) ) ( not ( = ?auto_460111 ?auto_460112 ) ) ( not ( = ?auto_460111 ?auto_460113 ) ) ( not ( = ?auto_460111 ?auto_460114 ) ) ( not ( = ?auto_460111 ?auto_460115 ) ) ( not ( = ?auto_460111 ?auto_460116 ) ) ( not ( = ?auto_460112 ?auto_460113 ) ) ( not ( = ?auto_460112 ?auto_460114 ) ) ( not ( = ?auto_460112 ?auto_460115 ) ) ( not ( = ?auto_460112 ?auto_460116 ) ) ( not ( = ?auto_460113 ?auto_460114 ) ) ( not ( = ?auto_460113 ?auto_460115 ) ) ( not ( = ?auto_460113 ?auto_460116 ) ) ( not ( = ?auto_460114 ?auto_460115 ) ) ( not ( = ?auto_460114 ?auto_460116 ) ) ( not ( = ?auto_460115 ?auto_460116 ) ) ( ON ?auto_460114 ?auto_460115 ) ( ON ?auto_460113 ?auto_460114 ) ( ON ?auto_460112 ?auto_460113 ) ( ON ?auto_460111 ?auto_460112 ) ( ON ?auto_460110 ?auto_460111 ) ( CLEAR ?auto_460110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_460110 )
      ( MAKE-6PILE ?auto_460110 ?auto_460111 ?auto_460112 ?auto_460113 ?auto_460114 ?auto_460115 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_460123 - BLOCK
      ?auto_460124 - BLOCK
      ?auto_460125 - BLOCK
      ?auto_460126 - BLOCK
      ?auto_460127 - BLOCK
      ?auto_460128 - BLOCK
    )
    :vars
    (
      ?auto_460129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460128 ?auto_460129 ) ( not ( = ?auto_460123 ?auto_460124 ) ) ( not ( = ?auto_460123 ?auto_460125 ) ) ( not ( = ?auto_460123 ?auto_460126 ) ) ( not ( = ?auto_460123 ?auto_460127 ) ) ( not ( = ?auto_460123 ?auto_460128 ) ) ( not ( = ?auto_460123 ?auto_460129 ) ) ( not ( = ?auto_460124 ?auto_460125 ) ) ( not ( = ?auto_460124 ?auto_460126 ) ) ( not ( = ?auto_460124 ?auto_460127 ) ) ( not ( = ?auto_460124 ?auto_460128 ) ) ( not ( = ?auto_460124 ?auto_460129 ) ) ( not ( = ?auto_460125 ?auto_460126 ) ) ( not ( = ?auto_460125 ?auto_460127 ) ) ( not ( = ?auto_460125 ?auto_460128 ) ) ( not ( = ?auto_460125 ?auto_460129 ) ) ( not ( = ?auto_460126 ?auto_460127 ) ) ( not ( = ?auto_460126 ?auto_460128 ) ) ( not ( = ?auto_460126 ?auto_460129 ) ) ( not ( = ?auto_460127 ?auto_460128 ) ) ( not ( = ?auto_460127 ?auto_460129 ) ) ( not ( = ?auto_460128 ?auto_460129 ) ) ( ON ?auto_460127 ?auto_460128 ) ( ON ?auto_460126 ?auto_460127 ) ( ON ?auto_460125 ?auto_460126 ) ( ON ?auto_460124 ?auto_460125 ) ( ON ?auto_460123 ?auto_460124 ) ( CLEAR ?auto_460123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_460123 )
      ( MAKE-6PILE ?auto_460123 ?auto_460124 ?auto_460125 ?auto_460126 ?auto_460127 ?auto_460128 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460137 - BLOCK
      ?auto_460138 - BLOCK
      ?auto_460139 - BLOCK
      ?auto_460140 - BLOCK
      ?auto_460141 - BLOCK
      ?auto_460142 - BLOCK
      ?auto_460143 - BLOCK
    )
    :vars
    (
      ?auto_460144 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_460142 ) ( ON ?auto_460143 ?auto_460144 ) ( CLEAR ?auto_460143 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_460137 ) ( ON ?auto_460138 ?auto_460137 ) ( ON ?auto_460139 ?auto_460138 ) ( ON ?auto_460140 ?auto_460139 ) ( ON ?auto_460141 ?auto_460140 ) ( ON ?auto_460142 ?auto_460141 ) ( not ( = ?auto_460137 ?auto_460138 ) ) ( not ( = ?auto_460137 ?auto_460139 ) ) ( not ( = ?auto_460137 ?auto_460140 ) ) ( not ( = ?auto_460137 ?auto_460141 ) ) ( not ( = ?auto_460137 ?auto_460142 ) ) ( not ( = ?auto_460137 ?auto_460143 ) ) ( not ( = ?auto_460137 ?auto_460144 ) ) ( not ( = ?auto_460138 ?auto_460139 ) ) ( not ( = ?auto_460138 ?auto_460140 ) ) ( not ( = ?auto_460138 ?auto_460141 ) ) ( not ( = ?auto_460138 ?auto_460142 ) ) ( not ( = ?auto_460138 ?auto_460143 ) ) ( not ( = ?auto_460138 ?auto_460144 ) ) ( not ( = ?auto_460139 ?auto_460140 ) ) ( not ( = ?auto_460139 ?auto_460141 ) ) ( not ( = ?auto_460139 ?auto_460142 ) ) ( not ( = ?auto_460139 ?auto_460143 ) ) ( not ( = ?auto_460139 ?auto_460144 ) ) ( not ( = ?auto_460140 ?auto_460141 ) ) ( not ( = ?auto_460140 ?auto_460142 ) ) ( not ( = ?auto_460140 ?auto_460143 ) ) ( not ( = ?auto_460140 ?auto_460144 ) ) ( not ( = ?auto_460141 ?auto_460142 ) ) ( not ( = ?auto_460141 ?auto_460143 ) ) ( not ( = ?auto_460141 ?auto_460144 ) ) ( not ( = ?auto_460142 ?auto_460143 ) ) ( not ( = ?auto_460142 ?auto_460144 ) ) ( not ( = ?auto_460143 ?auto_460144 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_460143 ?auto_460144 )
      ( !STACK ?auto_460143 ?auto_460142 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460152 - BLOCK
      ?auto_460153 - BLOCK
      ?auto_460154 - BLOCK
      ?auto_460155 - BLOCK
      ?auto_460156 - BLOCK
      ?auto_460157 - BLOCK
      ?auto_460158 - BLOCK
    )
    :vars
    (
      ?auto_460159 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_460157 ) ( ON ?auto_460158 ?auto_460159 ) ( CLEAR ?auto_460158 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_460152 ) ( ON ?auto_460153 ?auto_460152 ) ( ON ?auto_460154 ?auto_460153 ) ( ON ?auto_460155 ?auto_460154 ) ( ON ?auto_460156 ?auto_460155 ) ( ON ?auto_460157 ?auto_460156 ) ( not ( = ?auto_460152 ?auto_460153 ) ) ( not ( = ?auto_460152 ?auto_460154 ) ) ( not ( = ?auto_460152 ?auto_460155 ) ) ( not ( = ?auto_460152 ?auto_460156 ) ) ( not ( = ?auto_460152 ?auto_460157 ) ) ( not ( = ?auto_460152 ?auto_460158 ) ) ( not ( = ?auto_460152 ?auto_460159 ) ) ( not ( = ?auto_460153 ?auto_460154 ) ) ( not ( = ?auto_460153 ?auto_460155 ) ) ( not ( = ?auto_460153 ?auto_460156 ) ) ( not ( = ?auto_460153 ?auto_460157 ) ) ( not ( = ?auto_460153 ?auto_460158 ) ) ( not ( = ?auto_460153 ?auto_460159 ) ) ( not ( = ?auto_460154 ?auto_460155 ) ) ( not ( = ?auto_460154 ?auto_460156 ) ) ( not ( = ?auto_460154 ?auto_460157 ) ) ( not ( = ?auto_460154 ?auto_460158 ) ) ( not ( = ?auto_460154 ?auto_460159 ) ) ( not ( = ?auto_460155 ?auto_460156 ) ) ( not ( = ?auto_460155 ?auto_460157 ) ) ( not ( = ?auto_460155 ?auto_460158 ) ) ( not ( = ?auto_460155 ?auto_460159 ) ) ( not ( = ?auto_460156 ?auto_460157 ) ) ( not ( = ?auto_460156 ?auto_460158 ) ) ( not ( = ?auto_460156 ?auto_460159 ) ) ( not ( = ?auto_460157 ?auto_460158 ) ) ( not ( = ?auto_460157 ?auto_460159 ) ) ( not ( = ?auto_460158 ?auto_460159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_460158 ?auto_460159 )
      ( !STACK ?auto_460158 ?auto_460157 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460167 - BLOCK
      ?auto_460168 - BLOCK
      ?auto_460169 - BLOCK
      ?auto_460170 - BLOCK
      ?auto_460171 - BLOCK
      ?auto_460172 - BLOCK
      ?auto_460173 - BLOCK
    )
    :vars
    (
      ?auto_460174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460173 ?auto_460174 ) ( ON-TABLE ?auto_460167 ) ( ON ?auto_460168 ?auto_460167 ) ( ON ?auto_460169 ?auto_460168 ) ( ON ?auto_460170 ?auto_460169 ) ( ON ?auto_460171 ?auto_460170 ) ( not ( = ?auto_460167 ?auto_460168 ) ) ( not ( = ?auto_460167 ?auto_460169 ) ) ( not ( = ?auto_460167 ?auto_460170 ) ) ( not ( = ?auto_460167 ?auto_460171 ) ) ( not ( = ?auto_460167 ?auto_460172 ) ) ( not ( = ?auto_460167 ?auto_460173 ) ) ( not ( = ?auto_460167 ?auto_460174 ) ) ( not ( = ?auto_460168 ?auto_460169 ) ) ( not ( = ?auto_460168 ?auto_460170 ) ) ( not ( = ?auto_460168 ?auto_460171 ) ) ( not ( = ?auto_460168 ?auto_460172 ) ) ( not ( = ?auto_460168 ?auto_460173 ) ) ( not ( = ?auto_460168 ?auto_460174 ) ) ( not ( = ?auto_460169 ?auto_460170 ) ) ( not ( = ?auto_460169 ?auto_460171 ) ) ( not ( = ?auto_460169 ?auto_460172 ) ) ( not ( = ?auto_460169 ?auto_460173 ) ) ( not ( = ?auto_460169 ?auto_460174 ) ) ( not ( = ?auto_460170 ?auto_460171 ) ) ( not ( = ?auto_460170 ?auto_460172 ) ) ( not ( = ?auto_460170 ?auto_460173 ) ) ( not ( = ?auto_460170 ?auto_460174 ) ) ( not ( = ?auto_460171 ?auto_460172 ) ) ( not ( = ?auto_460171 ?auto_460173 ) ) ( not ( = ?auto_460171 ?auto_460174 ) ) ( not ( = ?auto_460172 ?auto_460173 ) ) ( not ( = ?auto_460172 ?auto_460174 ) ) ( not ( = ?auto_460173 ?auto_460174 ) ) ( CLEAR ?auto_460171 ) ( ON ?auto_460172 ?auto_460173 ) ( CLEAR ?auto_460172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_460167 ?auto_460168 ?auto_460169 ?auto_460170 ?auto_460171 ?auto_460172 )
      ( MAKE-7PILE ?auto_460167 ?auto_460168 ?auto_460169 ?auto_460170 ?auto_460171 ?auto_460172 ?auto_460173 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460182 - BLOCK
      ?auto_460183 - BLOCK
      ?auto_460184 - BLOCK
      ?auto_460185 - BLOCK
      ?auto_460186 - BLOCK
      ?auto_460187 - BLOCK
      ?auto_460188 - BLOCK
    )
    :vars
    (
      ?auto_460189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460188 ?auto_460189 ) ( ON-TABLE ?auto_460182 ) ( ON ?auto_460183 ?auto_460182 ) ( ON ?auto_460184 ?auto_460183 ) ( ON ?auto_460185 ?auto_460184 ) ( ON ?auto_460186 ?auto_460185 ) ( not ( = ?auto_460182 ?auto_460183 ) ) ( not ( = ?auto_460182 ?auto_460184 ) ) ( not ( = ?auto_460182 ?auto_460185 ) ) ( not ( = ?auto_460182 ?auto_460186 ) ) ( not ( = ?auto_460182 ?auto_460187 ) ) ( not ( = ?auto_460182 ?auto_460188 ) ) ( not ( = ?auto_460182 ?auto_460189 ) ) ( not ( = ?auto_460183 ?auto_460184 ) ) ( not ( = ?auto_460183 ?auto_460185 ) ) ( not ( = ?auto_460183 ?auto_460186 ) ) ( not ( = ?auto_460183 ?auto_460187 ) ) ( not ( = ?auto_460183 ?auto_460188 ) ) ( not ( = ?auto_460183 ?auto_460189 ) ) ( not ( = ?auto_460184 ?auto_460185 ) ) ( not ( = ?auto_460184 ?auto_460186 ) ) ( not ( = ?auto_460184 ?auto_460187 ) ) ( not ( = ?auto_460184 ?auto_460188 ) ) ( not ( = ?auto_460184 ?auto_460189 ) ) ( not ( = ?auto_460185 ?auto_460186 ) ) ( not ( = ?auto_460185 ?auto_460187 ) ) ( not ( = ?auto_460185 ?auto_460188 ) ) ( not ( = ?auto_460185 ?auto_460189 ) ) ( not ( = ?auto_460186 ?auto_460187 ) ) ( not ( = ?auto_460186 ?auto_460188 ) ) ( not ( = ?auto_460186 ?auto_460189 ) ) ( not ( = ?auto_460187 ?auto_460188 ) ) ( not ( = ?auto_460187 ?auto_460189 ) ) ( not ( = ?auto_460188 ?auto_460189 ) ) ( CLEAR ?auto_460186 ) ( ON ?auto_460187 ?auto_460188 ) ( CLEAR ?auto_460187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_460182 ?auto_460183 ?auto_460184 ?auto_460185 ?auto_460186 ?auto_460187 )
      ( MAKE-7PILE ?auto_460182 ?auto_460183 ?auto_460184 ?auto_460185 ?auto_460186 ?auto_460187 ?auto_460188 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460197 - BLOCK
      ?auto_460198 - BLOCK
      ?auto_460199 - BLOCK
      ?auto_460200 - BLOCK
      ?auto_460201 - BLOCK
      ?auto_460202 - BLOCK
      ?auto_460203 - BLOCK
    )
    :vars
    (
      ?auto_460204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460203 ?auto_460204 ) ( ON-TABLE ?auto_460197 ) ( ON ?auto_460198 ?auto_460197 ) ( ON ?auto_460199 ?auto_460198 ) ( ON ?auto_460200 ?auto_460199 ) ( not ( = ?auto_460197 ?auto_460198 ) ) ( not ( = ?auto_460197 ?auto_460199 ) ) ( not ( = ?auto_460197 ?auto_460200 ) ) ( not ( = ?auto_460197 ?auto_460201 ) ) ( not ( = ?auto_460197 ?auto_460202 ) ) ( not ( = ?auto_460197 ?auto_460203 ) ) ( not ( = ?auto_460197 ?auto_460204 ) ) ( not ( = ?auto_460198 ?auto_460199 ) ) ( not ( = ?auto_460198 ?auto_460200 ) ) ( not ( = ?auto_460198 ?auto_460201 ) ) ( not ( = ?auto_460198 ?auto_460202 ) ) ( not ( = ?auto_460198 ?auto_460203 ) ) ( not ( = ?auto_460198 ?auto_460204 ) ) ( not ( = ?auto_460199 ?auto_460200 ) ) ( not ( = ?auto_460199 ?auto_460201 ) ) ( not ( = ?auto_460199 ?auto_460202 ) ) ( not ( = ?auto_460199 ?auto_460203 ) ) ( not ( = ?auto_460199 ?auto_460204 ) ) ( not ( = ?auto_460200 ?auto_460201 ) ) ( not ( = ?auto_460200 ?auto_460202 ) ) ( not ( = ?auto_460200 ?auto_460203 ) ) ( not ( = ?auto_460200 ?auto_460204 ) ) ( not ( = ?auto_460201 ?auto_460202 ) ) ( not ( = ?auto_460201 ?auto_460203 ) ) ( not ( = ?auto_460201 ?auto_460204 ) ) ( not ( = ?auto_460202 ?auto_460203 ) ) ( not ( = ?auto_460202 ?auto_460204 ) ) ( not ( = ?auto_460203 ?auto_460204 ) ) ( ON ?auto_460202 ?auto_460203 ) ( CLEAR ?auto_460200 ) ( ON ?auto_460201 ?auto_460202 ) ( CLEAR ?auto_460201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_460197 ?auto_460198 ?auto_460199 ?auto_460200 ?auto_460201 )
      ( MAKE-7PILE ?auto_460197 ?auto_460198 ?auto_460199 ?auto_460200 ?auto_460201 ?auto_460202 ?auto_460203 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460212 - BLOCK
      ?auto_460213 - BLOCK
      ?auto_460214 - BLOCK
      ?auto_460215 - BLOCK
      ?auto_460216 - BLOCK
      ?auto_460217 - BLOCK
      ?auto_460218 - BLOCK
    )
    :vars
    (
      ?auto_460219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460218 ?auto_460219 ) ( ON-TABLE ?auto_460212 ) ( ON ?auto_460213 ?auto_460212 ) ( ON ?auto_460214 ?auto_460213 ) ( ON ?auto_460215 ?auto_460214 ) ( not ( = ?auto_460212 ?auto_460213 ) ) ( not ( = ?auto_460212 ?auto_460214 ) ) ( not ( = ?auto_460212 ?auto_460215 ) ) ( not ( = ?auto_460212 ?auto_460216 ) ) ( not ( = ?auto_460212 ?auto_460217 ) ) ( not ( = ?auto_460212 ?auto_460218 ) ) ( not ( = ?auto_460212 ?auto_460219 ) ) ( not ( = ?auto_460213 ?auto_460214 ) ) ( not ( = ?auto_460213 ?auto_460215 ) ) ( not ( = ?auto_460213 ?auto_460216 ) ) ( not ( = ?auto_460213 ?auto_460217 ) ) ( not ( = ?auto_460213 ?auto_460218 ) ) ( not ( = ?auto_460213 ?auto_460219 ) ) ( not ( = ?auto_460214 ?auto_460215 ) ) ( not ( = ?auto_460214 ?auto_460216 ) ) ( not ( = ?auto_460214 ?auto_460217 ) ) ( not ( = ?auto_460214 ?auto_460218 ) ) ( not ( = ?auto_460214 ?auto_460219 ) ) ( not ( = ?auto_460215 ?auto_460216 ) ) ( not ( = ?auto_460215 ?auto_460217 ) ) ( not ( = ?auto_460215 ?auto_460218 ) ) ( not ( = ?auto_460215 ?auto_460219 ) ) ( not ( = ?auto_460216 ?auto_460217 ) ) ( not ( = ?auto_460216 ?auto_460218 ) ) ( not ( = ?auto_460216 ?auto_460219 ) ) ( not ( = ?auto_460217 ?auto_460218 ) ) ( not ( = ?auto_460217 ?auto_460219 ) ) ( not ( = ?auto_460218 ?auto_460219 ) ) ( ON ?auto_460217 ?auto_460218 ) ( CLEAR ?auto_460215 ) ( ON ?auto_460216 ?auto_460217 ) ( CLEAR ?auto_460216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_460212 ?auto_460213 ?auto_460214 ?auto_460215 ?auto_460216 )
      ( MAKE-7PILE ?auto_460212 ?auto_460213 ?auto_460214 ?auto_460215 ?auto_460216 ?auto_460217 ?auto_460218 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460227 - BLOCK
      ?auto_460228 - BLOCK
      ?auto_460229 - BLOCK
      ?auto_460230 - BLOCK
      ?auto_460231 - BLOCK
      ?auto_460232 - BLOCK
      ?auto_460233 - BLOCK
    )
    :vars
    (
      ?auto_460234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460233 ?auto_460234 ) ( ON-TABLE ?auto_460227 ) ( ON ?auto_460228 ?auto_460227 ) ( ON ?auto_460229 ?auto_460228 ) ( not ( = ?auto_460227 ?auto_460228 ) ) ( not ( = ?auto_460227 ?auto_460229 ) ) ( not ( = ?auto_460227 ?auto_460230 ) ) ( not ( = ?auto_460227 ?auto_460231 ) ) ( not ( = ?auto_460227 ?auto_460232 ) ) ( not ( = ?auto_460227 ?auto_460233 ) ) ( not ( = ?auto_460227 ?auto_460234 ) ) ( not ( = ?auto_460228 ?auto_460229 ) ) ( not ( = ?auto_460228 ?auto_460230 ) ) ( not ( = ?auto_460228 ?auto_460231 ) ) ( not ( = ?auto_460228 ?auto_460232 ) ) ( not ( = ?auto_460228 ?auto_460233 ) ) ( not ( = ?auto_460228 ?auto_460234 ) ) ( not ( = ?auto_460229 ?auto_460230 ) ) ( not ( = ?auto_460229 ?auto_460231 ) ) ( not ( = ?auto_460229 ?auto_460232 ) ) ( not ( = ?auto_460229 ?auto_460233 ) ) ( not ( = ?auto_460229 ?auto_460234 ) ) ( not ( = ?auto_460230 ?auto_460231 ) ) ( not ( = ?auto_460230 ?auto_460232 ) ) ( not ( = ?auto_460230 ?auto_460233 ) ) ( not ( = ?auto_460230 ?auto_460234 ) ) ( not ( = ?auto_460231 ?auto_460232 ) ) ( not ( = ?auto_460231 ?auto_460233 ) ) ( not ( = ?auto_460231 ?auto_460234 ) ) ( not ( = ?auto_460232 ?auto_460233 ) ) ( not ( = ?auto_460232 ?auto_460234 ) ) ( not ( = ?auto_460233 ?auto_460234 ) ) ( ON ?auto_460232 ?auto_460233 ) ( ON ?auto_460231 ?auto_460232 ) ( CLEAR ?auto_460229 ) ( ON ?auto_460230 ?auto_460231 ) ( CLEAR ?auto_460230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_460227 ?auto_460228 ?auto_460229 ?auto_460230 )
      ( MAKE-7PILE ?auto_460227 ?auto_460228 ?auto_460229 ?auto_460230 ?auto_460231 ?auto_460232 ?auto_460233 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460242 - BLOCK
      ?auto_460243 - BLOCK
      ?auto_460244 - BLOCK
      ?auto_460245 - BLOCK
      ?auto_460246 - BLOCK
      ?auto_460247 - BLOCK
      ?auto_460248 - BLOCK
    )
    :vars
    (
      ?auto_460249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460248 ?auto_460249 ) ( ON-TABLE ?auto_460242 ) ( ON ?auto_460243 ?auto_460242 ) ( ON ?auto_460244 ?auto_460243 ) ( not ( = ?auto_460242 ?auto_460243 ) ) ( not ( = ?auto_460242 ?auto_460244 ) ) ( not ( = ?auto_460242 ?auto_460245 ) ) ( not ( = ?auto_460242 ?auto_460246 ) ) ( not ( = ?auto_460242 ?auto_460247 ) ) ( not ( = ?auto_460242 ?auto_460248 ) ) ( not ( = ?auto_460242 ?auto_460249 ) ) ( not ( = ?auto_460243 ?auto_460244 ) ) ( not ( = ?auto_460243 ?auto_460245 ) ) ( not ( = ?auto_460243 ?auto_460246 ) ) ( not ( = ?auto_460243 ?auto_460247 ) ) ( not ( = ?auto_460243 ?auto_460248 ) ) ( not ( = ?auto_460243 ?auto_460249 ) ) ( not ( = ?auto_460244 ?auto_460245 ) ) ( not ( = ?auto_460244 ?auto_460246 ) ) ( not ( = ?auto_460244 ?auto_460247 ) ) ( not ( = ?auto_460244 ?auto_460248 ) ) ( not ( = ?auto_460244 ?auto_460249 ) ) ( not ( = ?auto_460245 ?auto_460246 ) ) ( not ( = ?auto_460245 ?auto_460247 ) ) ( not ( = ?auto_460245 ?auto_460248 ) ) ( not ( = ?auto_460245 ?auto_460249 ) ) ( not ( = ?auto_460246 ?auto_460247 ) ) ( not ( = ?auto_460246 ?auto_460248 ) ) ( not ( = ?auto_460246 ?auto_460249 ) ) ( not ( = ?auto_460247 ?auto_460248 ) ) ( not ( = ?auto_460247 ?auto_460249 ) ) ( not ( = ?auto_460248 ?auto_460249 ) ) ( ON ?auto_460247 ?auto_460248 ) ( ON ?auto_460246 ?auto_460247 ) ( CLEAR ?auto_460244 ) ( ON ?auto_460245 ?auto_460246 ) ( CLEAR ?auto_460245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_460242 ?auto_460243 ?auto_460244 ?auto_460245 )
      ( MAKE-7PILE ?auto_460242 ?auto_460243 ?auto_460244 ?auto_460245 ?auto_460246 ?auto_460247 ?auto_460248 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460257 - BLOCK
      ?auto_460258 - BLOCK
      ?auto_460259 - BLOCK
      ?auto_460260 - BLOCK
      ?auto_460261 - BLOCK
      ?auto_460262 - BLOCK
      ?auto_460263 - BLOCK
    )
    :vars
    (
      ?auto_460264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460263 ?auto_460264 ) ( ON-TABLE ?auto_460257 ) ( ON ?auto_460258 ?auto_460257 ) ( not ( = ?auto_460257 ?auto_460258 ) ) ( not ( = ?auto_460257 ?auto_460259 ) ) ( not ( = ?auto_460257 ?auto_460260 ) ) ( not ( = ?auto_460257 ?auto_460261 ) ) ( not ( = ?auto_460257 ?auto_460262 ) ) ( not ( = ?auto_460257 ?auto_460263 ) ) ( not ( = ?auto_460257 ?auto_460264 ) ) ( not ( = ?auto_460258 ?auto_460259 ) ) ( not ( = ?auto_460258 ?auto_460260 ) ) ( not ( = ?auto_460258 ?auto_460261 ) ) ( not ( = ?auto_460258 ?auto_460262 ) ) ( not ( = ?auto_460258 ?auto_460263 ) ) ( not ( = ?auto_460258 ?auto_460264 ) ) ( not ( = ?auto_460259 ?auto_460260 ) ) ( not ( = ?auto_460259 ?auto_460261 ) ) ( not ( = ?auto_460259 ?auto_460262 ) ) ( not ( = ?auto_460259 ?auto_460263 ) ) ( not ( = ?auto_460259 ?auto_460264 ) ) ( not ( = ?auto_460260 ?auto_460261 ) ) ( not ( = ?auto_460260 ?auto_460262 ) ) ( not ( = ?auto_460260 ?auto_460263 ) ) ( not ( = ?auto_460260 ?auto_460264 ) ) ( not ( = ?auto_460261 ?auto_460262 ) ) ( not ( = ?auto_460261 ?auto_460263 ) ) ( not ( = ?auto_460261 ?auto_460264 ) ) ( not ( = ?auto_460262 ?auto_460263 ) ) ( not ( = ?auto_460262 ?auto_460264 ) ) ( not ( = ?auto_460263 ?auto_460264 ) ) ( ON ?auto_460262 ?auto_460263 ) ( ON ?auto_460261 ?auto_460262 ) ( ON ?auto_460260 ?auto_460261 ) ( CLEAR ?auto_460258 ) ( ON ?auto_460259 ?auto_460260 ) ( CLEAR ?auto_460259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_460257 ?auto_460258 ?auto_460259 )
      ( MAKE-7PILE ?auto_460257 ?auto_460258 ?auto_460259 ?auto_460260 ?auto_460261 ?auto_460262 ?auto_460263 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460272 - BLOCK
      ?auto_460273 - BLOCK
      ?auto_460274 - BLOCK
      ?auto_460275 - BLOCK
      ?auto_460276 - BLOCK
      ?auto_460277 - BLOCK
      ?auto_460278 - BLOCK
    )
    :vars
    (
      ?auto_460279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460278 ?auto_460279 ) ( ON-TABLE ?auto_460272 ) ( ON ?auto_460273 ?auto_460272 ) ( not ( = ?auto_460272 ?auto_460273 ) ) ( not ( = ?auto_460272 ?auto_460274 ) ) ( not ( = ?auto_460272 ?auto_460275 ) ) ( not ( = ?auto_460272 ?auto_460276 ) ) ( not ( = ?auto_460272 ?auto_460277 ) ) ( not ( = ?auto_460272 ?auto_460278 ) ) ( not ( = ?auto_460272 ?auto_460279 ) ) ( not ( = ?auto_460273 ?auto_460274 ) ) ( not ( = ?auto_460273 ?auto_460275 ) ) ( not ( = ?auto_460273 ?auto_460276 ) ) ( not ( = ?auto_460273 ?auto_460277 ) ) ( not ( = ?auto_460273 ?auto_460278 ) ) ( not ( = ?auto_460273 ?auto_460279 ) ) ( not ( = ?auto_460274 ?auto_460275 ) ) ( not ( = ?auto_460274 ?auto_460276 ) ) ( not ( = ?auto_460274 ?auto_460277 ) ) ( not ( = ?auto_460274 ?auto_460278 ) ) ( not ( = ?auto_460274 ?auto_460279 ) ) ( not ( = ?auto_460275 ?auto_460276 ) ) ( not ( = ?auto_460275 ?auto_460277 ) ) ( not ( = ?auto_460275 ?auto_460278 ) ) ( not ( = ?auto_460275 ?auto_460279 ) ) ( not ( = ?auto_460276 ?auto_460277 ) ) ( not ( = ?auto_460276 ?auto_460278 ) ) ( not ( = ?auto_460276 ?auto_460279 ) ) ( not ( = ?auto_460277 ?auto_460278 ) ) ( not ( = ?auto_460277 ?auto_460279 ) ) ( not ( = ?auto_460278 ?auto_460279 ) ) ( ON ?auto_460277 ?auto_460278 ) ( ON ?auto_460276 ?auto_460277 ) ( ON ?auto_460275 ?auto_460276 ) ( CLEAR ?auto_460273 ) ( ON ?auto_460274 ?auto_460275 ) ( CLEAR ?auto_460274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_460272 ?auto_460273 ?auto_460274 )
      ( MAKE-7PILE ?auto_460272 ?auto_460273 ?auto_460274 ?auto_460275 ?auto_460276 ?auto_460277 ?auto_460278 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460287 - BLOCK
      ?auto_460288 - BLOCK
      ?auto_460289 - BLOCK
      ?auto_460290 - BLOCK
      ?auto_460291 - BLOCK
      ?auto_460292 - BLOCK
      ?auto_460293 - BLOCK
    )
    :vars
    (
      ?auto_460294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460293 ?auto_460294 ) ( ON-TABLE ?auto_460287 ) ( not ( = ?auto_460287 ?auto_460288 ) ) ( not ( = ?auto_460287 ?auto_460289 ) ) ( not ( = ?auto_460287 ?auto_460290 ) ) ( not ( = ?auto_460287 ?auto_460291 ) ) ( not ( = ?auto_460287 ?auto_460292 ) ) ( not ( = ?auto_460287 ?auto_460293 ) ) ( not ( = ?auto_460287 ?auto_460294 ) ) ( not ( = ?auto_460288 ?auto_460289 ) ) ( not ( = ?auto_460288 ?auto_460290 ) ) ( not ( = ?auto_460288 ?auto_460291 ) ) ( not ( = ?auto_460288 ?auto_460292 ) ) ( not ( = ?auto_460288 ?auto_460293 ) ) ( not ( = ?auto_460288 ?auto_460294 ) ) ( not ( = ?auto_460289 ?auto_460290 ) ) ( not ( = ?auto_460289 ?auto_460291 ) ) ( not ( = ?auto_460289 ?auto_460292 ) ) ( not ( = ?auto_460289 ?auto_460293 ) ) ( not ( = ?auto_460289 ?auto_460294 ) ) ( not ( = ?auto_460290 ?auto_460291 ) ) ( not ( = ?auto_460290 ?auto_460292 ) ) ( not ( = ?auto_460290 ?auto_460293 ) ) ( not ( = ?auto_460290 ?auto_460294 ) ) ( not ( = ?auto_460291 ?auto_460292 ) ) ( not ( = ?auto_460291 ?auto_460293 ) ) ( not ( = ?auto_460291 ?auto_460294 ) ) ( not ( = ?auto_460292 ?auto_460293 ) ) ( not ( = ?auto_460292 ?auto_460294 ) ) ( not ( = ?auto_460293 ?auto_460294 ) ) ( ON ?auto_460292 ?auto_460293 ) ( ON ?auto_460291 ?auto_460292 ) ( ON ?auto_460290 ?auto_460291 ) ( ON ?auto_460289 ?auto_460290 ) ( CLEAR ?auto_460287 ) ( ON ?auto_460288 ?auto_460289 ) ( CLEAR ?auto_460288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_460287 ?auto_460288 )
      ( MAKE-7PILE ?auto_460287 ?auto_460288 ?auto_460289 ?auto_460290 ?auto_460291 ?auto_460292 ?auto_460293 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460302 - BLOCK
      ?auto_460303 - BLOCK
      ?auto_460304 - BLOCK
      ?auto_460305 - BLOCK
      ?auto_460306 - BLOCK
      ?auto_460307 - BLOCK
      ?auto_460308 - BLOCK
    )
    :vars
    (
      ?auto_460309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460308 ?auto_460309 ) ( ON-TABLE ?auto_460302 ) ( not ( = ?auto_460302 ?auto_460303 ) ) ( not ( = ?auto_460302 ?auto_460304 ) ) ( not ( = ?auto_460302 ?auto_460305 ) ) ( not ( = ?auto_460302 ?auto_460306 ) ) ( not ( = ?auto_460302 ?auto_460307 ) ) ( not ( = ?auto_460302 ?auto_460308 ) ) ( not ( = ?auto_460302 ?auto_460309 ) ) ( not ( = ?auto_460303 ?auto_460304 ) ) ( not ( = ?auto_460303 ?auto_460305 ) ) ( not ( = ?auto_460303 ?auto_460306 ) ) ( not ( = ?auto_460303 ?auto_460307 ) ) ( not ( = ?auto_460303 ?auto_460308 ) ) ( not ( = ?auto_460303 ?auto_460309 ) ) ( not ( = ?auto_460304 ?auto_460305 ) ) ( not ( = ?auto_460304 ?auto_460306 ) ) ( not ( = ?auto_460304 ?auto_460307 ) ) ( not ( = ?auto_460304 ?auto_460308 ) ) ( not ( = ?auto_460304 ?auto_460309 ) ) ( not ( = ?auto_460305 ?auto_460306 ) ) ( not ( = ?auto_460305 ?auto_460307 ) ) ( not ( = ?auto_460305 ?auto_460308 ) ) ( not ( = ?auto_460305 ?auto_460309 ) ) ( not ( = ?auto_460306 ?auto_460307 ) ) ( not ( = ?auto_460306 ?auto_460308 ) ) ( not ( = ?auto_460306 ?auto_460309 ) ) ( not ( = ?auto_460307 ?auto_460308 ) ) ( not ( = ?auto_460307 ?auto_460309 ) ) ( not ( = ?auto_460308 ?auto_460309 ) ) ( ON ?auto_460307 ?auto_460308 ) ( ON ?auto_460306 ?auto_460307 ) ( ON ?auto_460305 ?auto_460306 ) ( ON ?auto_460304 ?auto_460305 ) ( CLEAR ?auto_460302 ) ( ON ?auto_460303 ?auto_460304 ) ( CLEAR ?auto_460303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_460302 ?auto_460303 )
      ( MAKE-7PILE ?auto_460302 ?auto_460303 ?auto_460304 ?auto_460305 ?auto_460306 ?auto_460307 ?auto_460308 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460317 - BLOCK
      ?auto_460318 - BLOCK
      ?auto_460319 - BLOCK
      ?auto_460320 - BLOCK
      ?auto_460321 - BLOCK
      ?auto_460322 - BLOCK
      ?auto_460323 - BLOCK
    )
    :vars
    (
      ?auto_460324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460323 ?auto_460324 ) ( not ( = ?auto_460317 ?auto_460318 ) ) ( not ( = ?auto_460317 ?auto_460319 ) ) ( not ( = ?auto_460317 ?auto_460320 ) ) ( not ( = ?auto_460317 ?auto_460321 ) ) ( not ( = ?auto_460317 ?auto_460322 ) ) ( not ( = ?auto_460317 ?auto_460323 ) ) ( not ( = ?auto_460317 ?auto_460324 ) ) ( not ( = ?auto_460318 ?auto_460319 ) ) ( not ( = ?auto_460318 ?auto_460320 ) ) ( not ( = ?auto_460318 ?auto_460321 ) ) ( not ( = ?auto_460318 ?auto_460322 ) ) ( not ( = ?auto_460318 ?auto_460323 ) ) ( not ( = ?auto_460318 ?auto_460324 ) ) ( not ( = ?auto_460319 ?auto_460320 ) ) ( not ( = ?auto_460319 ?auto_460321 ) ) ( not ( = ?auto_460319 ?auto_460322 ) ) ( not ( = ?auto_460319 ?auto_460323 ) ) ( not ( = ?auto_460319 ?auto_460324 ) ) ( not ( = ?auto_460320 ?auto_460321 ) ) ( not ( = ?auto_460320 ?auto_460322 ) ) ( not ( = ?auto_460320 ?auto_460323 ) ) ( not ( = ?auto_460320 ?auto_460324 ) ) ( not ( = ?auto_460321 ?auto_460322 ) ) ( not ( = ?auto_460321 ?auto_460323 ) ) ( not ( = ?auto_460321 ?auto_460324 ) ) ( not ( = ?auto_460322 ?auto_460323 ) ) ( not ( = ?auto_460322 ?auto_460324 ) ) ( not ( = ?auto_460323 ?auto_460324 ) ) ( ON ?auto_460322 ?auto_460323 ) ( ON ?auto_460321 ?auto_460322 ) ( ON ?auto_460320 ?auto_460321 ) ( ON ?auto_460319 ?auto_460320 ) ( ON ?auto_460318 ?auto_460319 ) ( ON ?auto_460317 ?auto_460318 ) ( CLEAR ?auto_460317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_460317 )
      ( MAKE-7PILE ?auto_460317 ?auto_460318 ?auto_460319 ?auto_460320 ?auto_460321 ?auto_460322 ?auto_460323 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_460332 - BLOCK
      ?auto_460333 - BLOCK
      ?auto_460334 - BLOCK
      ?auto_460335 - BLOCK
      ?auto_460336 - BLOCK
      ?auto_460337 - BLOCK
      ?auto_460338 - BLOCK
    )
    :vars
    (
      ?auto_460339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460338 ?auto_460339 ) ( not ( = ?auto_460332 ?auto_460333 ) ) ( not ( = ?auto_460332 ?auto_460334 ) ) ( not ( = ?auto_460332 ?auto_460335 ) ) ( not ( = ?auto_460332 ?auto_460336 ) ) ( not ( = ?auto_460332 ?auto_460337 ) ) ( not ( = ?auto_460332 ?auto_460338 ) ) ( not ( = ?auto_460332 ?auto_460339 ) ) ( not ( = ?auto_460333 ?auto_460334 ) ) ( not ( = ?auto_460333 ?auto_460335 ) ) ( not ( = ?auto_460333 ?auto_460336 ) ) ( not ( = ?auto_460333 ?auto_460337 ) ) ( not ( = ?auto_460333 ?auto_460338 ) ) ( not ( = ?auto_460333 ?auto_460339 ) ) ( not ( = ?auto_460334 ?auto_460335 ) ) ( not ( = ?auto_460334 ?auto_460336 ) ) ( not ( = ?auto_460334 ?auto_460337 ) ) ( not ( = ?auto_460334 ?auto_460338 ) ) ( not ( = ?auto_460334 ?auto_460339 ) ) ( not ( = ?auto_460335 ?auto_460336 ) ) ( not ( = ?auto_460335 ?auto_460337 ) ) ( not ( = ?auto_460335 ?auto_460338 ) ) ( not ( = ?auto_460335 ?auto_460339 ) ) ( not ( = ?auto_460336 ?auto_460337 ) ) ( not ( = ?auto_460336 ?auto_460338 ) ) ( not ( = ?auto_460336 ?auto_460339 ) ) ( not ( = ?auto_460337 ?auto_460338 ) ) ( not ( = ?auto_460337 ?auto_460339 ) ) ( not ( = ?auto_460338 ?auto_460339 ) ) ( ON ?auto_460337 ?auto_460338 ) ( ON ?auto_460336 ?auto_460337 ) ( ON ?auto_460335 ?auto_460336 ) ( ON ?auto_460334 ?auto_460335 ) ( ON ?auto_460333 ?auto_460334 ) ( ON ?auto_460332 ?auto_460333 ) ( CLEAR ?auto_460332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_460332 )
      ( MAKE-7PILE ?auto_460332 ?auto_460333 ?auto_460334 ?auto_460335 ?auto_460336 ?auto_460337 ?auto_460338 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460348 - BLOCK
      ?auto_460349 - BLOCK
      ?auto_460350 - BLOCK
      ?auto_460351 - BLOCK
      ?auto_460352 - BLOCK
      ?auto_460353 - BLOCK
      ?auto_460354 - BLOCK
      ?auto_460355 - BLOCK
    )
    :vars
    (
      ?auto_460356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_460354 ) ( ON ?auto_460355 ?auto_460356 ) ( CLEAR ?auto_460355 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_460348 ) ( ON ?auto_460349 ?auto_460348 ) ( ON ?auto_460350 ?auto_460349 ) ( ON ?auto_460351 ?auto_460350 ) ( ON ?auto_460352 ?auto_460351 ) ( ON ?auto_460353 ?auto_460352 ) ( ON ?auto_460354 ?auto_460353 ) ( not ( = ?auto_460348 ?auto_460349 ) ) ( not ( = ?auto_460348 ?auto_460350 ) ) ( not ( = ?auto_460348 ?auto_460351 ) ) ( not ( = ?auto_460348 ?auto_460352 ) ) ( not ( = ?auto_460348 ?auto_460353 ) ) ( not ( = ?auto_460348 ?auto_460354 ) ) ( not ( = ?auto_460348 ?auto_460355 ) ) ( not ( = ?auto_460348 ?auto_460356 ) ) ( not ( = ?auto_460349 ?auto_460350 ) ) ( not ( = ?auto_460349 ?auto_460351 ) ) ( not ( = ?auto_460349 ?auto_460352 ) ) ( not ( = ?auto_460349 ?auto_460353 ) ) ( not ( = ?auto_460349 ?auto_460354 ) ) ( not ( = ?auto_460349 ?auto_460355 ) ) ( not ( = ?auto_460349 ?auto_460356 ) ) ( not ( = ?auto_460350 ?auto_460351 ) ) ( not ( = ?auto_460350 ?auto_460352 ) ) ( not ( = ?auto_460350 ?auto_460353 ) ) ( not ( = ?auto_460350 ?auto_460354 ) ) ( not ( = ?auto_460350 ?auto_460355 ) ) ( not ( = ?auto_460350 ?auto_460356 ) ) ( not ( = ?auto_460351 ?auto_460352 ) ) ( not ( = ?auto_460351 ?auto_460353 ) ) ( not ( = ?auto_460351 ?auto_460354 ) ) ( not ( = ?auto_460351 ?auto_460355 ) ) ( not ( = ?auto_460351 ?auto_460356 ) ) ( not ( = ?auto_460352 ?auto_460353 ) ) ( not ( = ?auto_460352 ?auto_460354 ) ) ( not ( = ?auto_460352 ?auto_460355 ) ) ( not ( = ?auto_460352 ?auto_460356 ) ) ( not ( = ?auto_460353 ?auto_460354 ) ) ( not ( = ?auto_460353 ?auto_460355 ) ) ( not ( = ?auto_460353 ?auto_460356 ) ) ( not ( = ?auto_460354 ?auto_460355 ) ) ( not ( = ?auto_460354 ?auto_460356 ) ) ( not ( = ?auto_460355 ?auto_460356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_460355 ?auto_460356 )
      ( !STACK ?auto_460355 ?auto_460354 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460365 - BLOCK
      ?auto_460366 - BLOCK
      ?auto_460367 - BLOCK
      ?auto_460368 - BLOCK
      ?auto_460369 - BLOCK
      ?auto_460370 - BLOCK
      ?auto_460371 - BLOCK
      ?auto_460372 - BLOCK
    )
    :vars
    (
      ?auto_460373 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_460371 ) ( ON ?auto_460372 ?auto_460373 ) ( CLEAR ?auto_460372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_460365 ) ( ON ?auto_460366 ?auto_460365 ) ( ON ?auto_460367 ?auto_460366 ) ( ON ?auto_460368 ?auto_460367 ) ( ON ?auto_460369 ?auto_460368 ) ( ON ?auto_460370 ?auto_460369 ) ( ON ?auto_460371 ?auto_460370 ) ( not ( = ?auto_460365 ?auto_460366 ) ) ( not ( = ?auto_460365 ?auto_460367 ) ) ( not ( = ?auto_460365 ?auto_460368 ) ) ( not ( = ?auto_460365 ?auto_460369 ) ) ( not ( = ?auto_460365 ?auto_460370 ) ) ( not ( = ?auto_460365 ?auto_460371 ) ) ( not ( = ?auto_460365 ?auto_460372 ) ) ( not ( = ?auto_460365 ?auto_460373 ) ) ( not ( = ?auto_460366 ?auto_460367 ) ) ( not ( = ?auto_460366 ?auto_460368 ) ) ( not ( = ?auto_460366 ?auto_460369 ) ) ( not ( = ?auto_460366 ?auto_460370 ) ) ( not ( = ?auto_460366 ?auto_460371 ) ) ( not ( = ?auto_460366 ?auto_460372 ) ) ( not ( = ?auto_460366 ?auto_460373 ) ) ( not ( = ?auto_460367 ?auto_460368 ) ) ( not ( = ?auto_460367 ?auto_460369 ) ) ( not ( = ?auto_460367 ?auto_460370 ) ) ( not ( = ?auto_460367 ?auto_460371 ) ) ( not ( = ?auto_460367 ?auto_460372 ) ) ( not ( = ?auto_460367 ?auto_460373 ) ) ( not ( = ?auto_460368 ?auto_460369 ) ) ( not ( = ?auto_460368 ?auto_460370 ) ) ( not ( = ?auto_460368 ?auto_460371 ) ) ( not ( = ?auto_460368 ?auto_460372 ) ) ( not ( = ?auto_460368 ?auto_460373 ) ) ( not ( = ?auto_460369 ?auto_460370 ) ) ( not ( = ?auto_460369 ?auto_460371 ) ) ( not ( = ?auto_460369 ?auto_460372 ) ) ( not ( = ?auto_460369 ?auto_460373 ) ) ( not ( = ?auto_460370 ?auto_460371 ) ) ( not ( = ?auto_460370 ?auto_460372 ) ) ( not ( = ?auto_460370 ?auto_460373 ) ) ( not ( = ?auto_460371 ?auto_460372 ) ) ( not ( = ?auto_460371 ?auto_460373 ) ) ( not ( = ?auto_460372 ?auto_460373 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_460372 ?auto_460373 )
      ( !STACK ?auto_460372 ?auto_460371 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460382 - BLOCK
      ?auto_460383 - BLOCK
      ?auto_460384 - BLOCK
      ?auto_460385 - BLOCK
      ?auto_460386 - BLOCK
      ?auto_460387 - BLOCK
      ?auto_460388 - BLOCK
      ?auto_460389 - BLOCK
    )
    :vars
    (
      ?auto_460390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460389 ?auto_460390 ) ( ON-TABLE ?auto_460382 ) ( ON ?auto_460383 ?auto_460382 ) ( ON ?auto_460384 ?auto_460383 ) ( ON ?auto_460385 ?auto_460384 ) ( ON ?auto_460386 ?auto_460385 ) ( ON ?auto_460387 ?auto_460386 ) ( not ( = ?auto_460382 ?auto_460383 ) ) ( not ( = ?auto_460382 ?auto_460384 ) ) ( not ( = ?auto_460382 ?auto_460385 ) ) ( not ( = ?auto_460382 ?auto_460386 ) ) ( not ( = ?auto_460382 ?auto_460387 ) ) ( not ( = ?auto_460382 ?auto_460388 ) ) ( not ( = ?auto_460382 ?auto_460389 ) ) ( not ( = ?auto_460382 ?auto_460390 ) ) ( not ( = ?auto_460383 ?auto_460384 ) ) ( not ( = ?auto_460383 ?auto_460385 ) ) ( not ( = ?auto_460383 ?auto_460386 ) ) ( not ( = ?auto_460383 ?auto_460387 ) ) ( not ( = ?auto_460383 ?auto_460388 ) ) ( not ( = ?auto_460383 ?auto_460389 ) ) ( not ( = ?auto_460383 ?auto_460390 ) ) ( not ( = ?auto_460384 ?auto_460385 ) ) ( not ( = ?auto_460384 ?auto_460386 ) ) ( not ( = ?auto_460384 ?auto_460387 ) ) ( not ( = ?auto_460384 ?auto_460388 ) ) ( not ( = ?auto_460384 ?auto_460389 ) ) ( not ( = ?auto_460384 ?auto_460390 ) ) ( not ( = ?auto_460385 ?auto_460386 ) ) ( not ( = ?auto_460385 ?auto_460387 ) ) ( not ( = ?auto_460385 ?auto_460388 ) ) ( not ( = ?auto_460385 ?auto_460389 ) ) ( not ( = ?auto_460385 ?auto_460390 ) ) ( not ( = ?auto_460386 ?auto_460387 ) ) ( not ( = ?auto_460386 ?auto_460388 ) ) ( not ( = ?auto_460386 ?auto_460389 ) ) ( not ( = ?auto_460386 ?auto_460390 ) ) ( not ( = ?auto_460387 ?auto_460388 ) ) ( not ( = ?auto_460387 ?auto_460389 ) ) ( not ( = ?auto_460387 ?auto_460390 ) ) ( not ( = ?auto_460388 ?auto_460389 ) ) ( not ( = ?auto_460388 ?auto_460390 ) ) ( not ( = ?auto_460389 ?auto_460390 ) ) ( CLEAR ?auto_460387 ) ( ON ?auto_460388 ?auto_460389 ) ( CLEAR ?auto_460388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_460382 ?auto_460383 ?auto_460384 ?auto_460385 ?auto_460386 ?auto_460387 ?auto_460388 )
      ( MAKE-8PILE ?auto_460382 ?auto_460383 ?auto_460384 ?auto_460385 ?auto_460386 ?auto_460387 ?auto_460388 ?auto_460389 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460399 - BLOCK
      ?auto_460400 - BLOCK
      ?auto_460401 - BLOCK
      ?auto_460402 - BLOCK
      ?auto_460403 - BLOCK
      ?auto_460404 - BLOCK
      ?auto_460405 - BLOCK
      ?auto_460406 - BLOCK
    )
    :vars
    (
      ?auto_460407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460406 ?auto_460407 ) ( ON-TABLE ?auto_460399 ) ( ON ?auto_460400 ?auto_460399 ) ( ON ?auto_460401 ?auto_460400 ) ( ON ?auto_460402 ?auto_460401 ) ( ON ?auto_460403 ?auto_460402 ) ( ON ?auto_460404 ?auto_460403 ) ( not ( = ?auto_460399 ?auto_460400 ) ) ( not ( = ?auto_460399 ?auto_460401 ) ) ( not ( = ?auto_460399 ?auto_460402 ) ) ( not ( = ?auto_460399 ?auto_460403 ) ) ( not ( = ?auto_460399 ?auto_460404 ) ) ( not ( = ?auto_460399 ?auto_460405 ) ) ( not ( = ?auto_460399 ?auto_460406 ) ) ( not ( = ?auto_460399 ?auto_460407 ) ) ( not ( = ?auto_460400 ?auto_460401 ) ) ( not ( = ?auto_460400 ?auto_460402 ) ) ( not ( = ?auto_460400 ?auto_460403 ) ) ( not ( = ?auto_460400 ?auto_460404 ) ) ( not ( = ?auto_460400 ?auto_460405 ) ) ( not ( = ?auto_460400 ?auto_460406 ) ) ( not ( = ?auto_460400 ?auto_460407 ) ) ( not ( = ?auto_460401 ?auto_460402 ) ) ( not ( = ?auto_460401 ?auto_460403 ) ) ( not ( = ?auto_460401 ?auto_460404 ) ) ( not ( = ?auto_460401 ?auto_460405 ) ) ( not ( = ?auto_460401 ?auto_460406 ) ) ( not ( = ?auto_460401 ?auto_460407 ) ) ( not ( = ?auto_460402 ?auto_460403 ) ) ( not ( = ?auto_460402 ?auto_460404 ) ) ( not ( = ?auto_460402 ?auto_460405 ) ) ( not ( = ?auto_460402 ?auto_460406 ) ) ( not ( = ?auto_460402 ?auto_460407 ) ) ( not ( = ?auto_460403 ?auto_460404 ) ) ( not ( = ?auto_460403 ?auto_460405 ) ) ( not ( = ?auto_460403 ?auto_460406 ) ) ( not ( = ?auto_460403 ?auto_460407 ) ) ( not ( = ?auto_460404 ?auto_460405 ) ) ( not ( = ?auto_460404 ?auto_460406 ) ) ( not ( = ?auto_460404 ?auto_460407 ) ) ( not ( = ?auto_460405 ?auto_460406 ) ) ( not ( = ?auto_460405 ?auto_460407 ) ) ( not ( = ?auto_460406 ?auto_460407 ) ) ( CLEAR ?auto_460404 ) ( ON ?auto_460405 ?auto_460406 ) ( CLEAR ?auto_460405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_460399 ?auto_460400 ?auto_460401 ?auto_460402 ?auto_460403 ?auto_460404 ?auto_460405 )
      ( MAKE-8PILE ?auto_460399 ?auto_460400 ?auto_460401 ?auto_460402 ?auto_460403 ?auto_460404 ?auto_460405 ?auto_460406 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460416 - BLOCK
      ?auto_460417 - BLOCK
      ?auto_460418 - BLOCK
      ?auto_460419 - BLOCK
      ?auto_460420 - BLOCK
      ?auto_460421 - BLOCK
      ?auto_460422 - BLOCK
      ?auto_460423 - BLOCK
    )
    :vars
    (
      ?auto_460424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460423 ?auto_460424 ) ( ON-TABLE ?auto_460416 ) ( ON ?auto_460417 ?auto_460416 ) ( ON ?auto_460418 ?auto_460417 ) ( ON ?auto_460419 ?auto_460418 ) ( ON ?auto_460420 ?auto_460419 ) ( not ( = ?auto_460416 ?auto_460417 ) ) ( not ( = ?auto_460416 ?auto_460418 ) ) ( not ( = ?auto_460416 ?auto_460419 ) ) ( not ( = ?auto_460416 ?auto_460420 ) ) ( not ( = ?auto_460416 ?auto_460421 ) ) ( not ( = ?auto_460416 ?auto_460422 ) ) ( not ( = ?auto_460416 ?auto_460423 ) ) ( not ( = ?auto_460416 ?auto_460424 ) ) ( not ( = ?auto_460417 ?auto_460418 ) ) ( not ( = ?auto_460417 ?auto_460419 ) ) ( not ( = ?auto_460417 ?auto_460420 ) ) ( not ( = ?auto_460417 ?auto_460421 ) ) ( not ( = ?auto_460417 ?auto_460422 ) ) ( not ( = ?auto_460417 ?auto_460423 ) ) ( not ( = ?auto_460417 ?auto_460424 ) ) ( not ( = ?auto_460418 ?auto_460419 ) ) ( not ( = ?auto_460418 ?auto_460420 ) ) ( not ( = ?auto_460418 ?auto_460421 ) ) ( not ( = ?auto_460418 ?auto_460422 ) ) ( not ( = ?auto_460418 ?auto_460423 ) ) ( not ( = ?auto_460418 ?auto_460424 ) ) ( not ( = ?auto_460419 ?auto_460420 ) ) ( not ( = ?auto_460419 ?auto_460421 ) ) ( not ( = ?auto_460419 ?auto_460422 ) ) ( not ( = ?auto_460419 ?auto_460423 ) ) ( not ( = ?auto_460419 ?auto_460424 ) ) ( not ( = ?auto_460420 ?auto_460421 ) ) ( not ( = ?auto_460420 ?auto_460422 ) ) ( not ( = ?auto_460420 ?auto_460423 ) ) ( not ( = ?auto_460420 ?auto_460424 ) ) ( not ( = ?auto_460421 ?auto_460422 ) ) ( not ( = ?auto_460421 ?auto_460423 ) ) ( not ( = ?auto_460421 ?auto_460424 ) ) ( not ( = ?auto_460422 ?auto_460423 ) ) ( not ( = ?auto_460422 ?auto_460424 ) ) ( not ( = ?auto_460423 ?auto_460424 ) ) ( ON ?auto_460422 ?auto_460423 ) ( CLEAR ?auto_460420 ) ( ON ?auto_460421 ?auto_460422 ) ( CLEAR ?auto_460421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_460416 ?auto_460417 ?auto_460418 ?auto_460419 ?auto_460420 ?auto_460421 )
      ( MAKE-8PILE ?auto_460416 ?auto_460417 ?auto_460418 ?auto_460419 ?auto_460420 ?auto_460421 ?auto_460422 ?auto_460423 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460433 - BLOCK
      ?auto_460434 - BLOCK
      ?auto_460435 - BLOCK
      ?auto_460436 - BLOCK
      ?auto_460437 - BLOCK
      ?auto_460438 - BLOCK
      ?auto_460439 - BLOCK
      ?auto_460440 - BLOCK
    )
    :vars
    (
      ?auto_460441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460440 ?auto_460441 ) ( ON-TABLE ?auto_460433 ) ( ON ?auto_460434 ?auto_460433 ) ( ON ?auto_460435 ?auto_460434 ) ( ON ?auto_460436 ?auto_460435 ) ( ON ?auto_460437 ?auto_460436 ) ( not ( = ?auto_460433 ?auto_460434 ) ) ( not ( = ?auto_460433 ?auto_460435 ) ) ( not ( = ?auto_460433 ?auto_460436 ) ) ( not ( = ?auto_460433 ?auto_460437 ) ) ( not ( = ?auto_460433 ?auto_460438 ) ) ( not ( = ?auto_460433 ?auto_460439 ) ) ( not ( = ?auto_460433 ?auto_460440 ) ) ( not ( = ?auto_460433 ?auto_460441 ) ) ( not ( = ?auto_460434 ?auto_460435 ) ) ( not ( = ?auto_460434 ?auto_460436 ) ) ( not ( = ?auto_460434 ?auto_460437 ) ) ( not ( = ?auto_460434 ?auto_460438 ) ) ( not ( = ?auto_460434 ?auto_460439 ) ) ( not ( = ?auto_460434 ?auto_460440 ) ) ( not ( = ?auto_460434 ?auto_460441 ) ) ( not ( = ?auto_460435 ?auto_460436 ) ) ( not ( = ?auto_460435 ?auto_460437 ) ) ( not ( = ?auto_460435 ?auto_460438 ) ) ( not ( = ?auto_460435 ?auto_460439 ) ) ( not ( = ?auto_460435 ?auto_460440 ) ) ( not ( = ?auto_460435 ?auto_460441 ) ) ( not ( = ?auto_460436 ?auto_460437 ) ) ( not ( = ?auto_460436 ?auto_460438 ) ) ( not ( = ?auto_460436 ?auto_460439 ) ) ( not ( = ?auto_460436 ?auto_460440 ) ) ( not ( = ?auto_460436 ?auto_460441 ) ) ( not ( = ?auto_460437 ?auto_460438 ) ) ( not ( = ?auto_460437 ?auto_460439 ) ) ( not ( = ?auto_460437 ?auto_460440 ) ) ( not ( = ?auto_460437 ?auto_460441 ) ) ( not ( = ?auto_460438 ?auto_460439 ) ) ( not ( = ?auto_460438 ?auto_460440 ) ) ( not ( = ?auto_460438 ?auto_460441 ) ) ( not ( = ?auto_460439 ?auto_460440 ) ) ( not ( = ?auto_460439 ?auto_460441 ) ) ( not ( = ?auto_460440 ?auto_460441 ) ) ( ON ?auto_460439 ?auto_460440 ) ( CLEAR ?auto_460437 ) ( ON ?auto_460438 ?auto_460439 ) ( CLEAR ?auto_460438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_460433 ?auto_460434 ?auto_460435 ?auto_460436 ?auto_460437 ?auto_460438 )
      ( MAKE-8PILE ?auto_460433 ?auto_460434 ?auto_460435 ?auto_460436 ?auto_460437 ?auto_460438 ?auto_460439 ?auto_460440 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460450 - BLOCK
      ?auto_460451 - BLOCK
      ?auto_460452 - BLOCK
      ?auto_460453 - BLOCK
      ?auto_460454 - BLOCK
      ?auto_460455 - BLOCK
      ?auto_460456 - BLOCK
      ?auto_460457 - BLOCK
    )
    :vars
    (
      ?auto_460458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460457 ?auto_460458 ) ( ON-TABLE ?auto_460450 ) ( ON ?auto_460451 ?auto_460450 ) ( ON ?auto_460452 ?auto_460451 ) ( ON ?auto_460453 ?auto_460452 ) ( not ( = ?auto_460450 ?auto_460451 ) ) ( not ( = ?auto_460450 ?auto_460452 ) ) ( not ( = ?auto_460450 ?auto_460453 ) ) ( not ( = ?auto_460450 ?auto_460454 ) ) ( not ( = ?auto_460450 ?auto_460455 ) ) ( not ( = ?auto_460450 ?auto_460456 ) ) ( not ( = ?auto_460450 ?auto_460457 ) ) ( not ( = ?auto_460450 ?auto_460458 ) ) ( not ( = ?auto_460451 ?auto_460452 ) ) ( not ( = ?auto_460451 ?auto_460453 ) ) ( not ( = ?auto_460451 ?auto_460454 ) ) ( not ( = ?auto_460451 ?auto_460455 ) ) ( not ( = ?auto_460451 ?auto_460456 ) ) ( not ( = ?auto_460451 ?auto_460457 ) ) ( not ( = ?auto_460451 ?auto_460458 ) ) ( not ( = ?auto_460452 ?auto_460453 ) ) ( not ( = ?auto_460452 ?auto_460454 ) ) ( not ( = ?auto_460452 ?auto_460455 ) ) ( not ( = ?auto_460452 ?auto_460456 ) ) ( not ( = ?auto_460452 ?auto_460457 ) ) ( not ( = ?auto_460452 ?auto_460458 ) ) ( not ( = ?auto_460453 ?auto_460454 ) ) ( not ( = ?auto_460453 ?auto_460455 ) ) ( not ( = ?auto_460453 ?auto_460456 ) ) ( not ( = ?auto_460453 ?auto_460457 ) ) ( not ( = ?auto_460453 ?auto_460458 ) ) ( not ( = ?auto_460454 ?auto_460455 ) ) ( not ( = ?auto_460454 ?auto_460456 ) ) ( not ( = ?auto_460454 ?auto_460457 ) ) ( not ( = ?auto_460454 ?auto_460458 ) ) ( not ( = ?auto_460455 ?auto_460456 ) ) ( not ( = ?auto_460455 ?auto_460457 ) ) ( not ( = ?auto_460455 ?auto_460458 ) ) ( not ( = ?auto_460456 ?auto_460457 ) ) ( not ( = ?auto_460456 ?auto_460458 ) ) ( not ( = ?auto_460457 ?auto_460458 ) ) ( ON ?auto_460456 ?auto_460457 ) ( ON ?auto_460455 ?auto_460456 ) ( CLEAR ?auto_460453 ) ( ON ?auto_460454 ?auto_460455 ) ( CLEAR ?auto_460454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_460450 ?auto_460451 ?auto_460452 ?auto_460453 ?auto_460454 )
      ( MAKE-8PILE ?auto_460450 ?auto_460451 ?auto_460452 ?auto_460453 ?auto_460454 ?auto_460455 ?auto_460456 ?auto_460457 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460467 - BLOCK
      ?auto_460468 - BLOCK
      ?auto_460469 - BLOCK
      ?auto_460470 - BLOCK
      ?auto_460471 - BLOCK
      ?auto_460472 - BLOCK
      ?auto_460473 - BLOCK
      ?auto_460474 - BLOCK
    )
    :vars
    (
      ?auto_460475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460474 ?auto_460475 ) ( ON-TABLE ?auto_460467 ) ( ON ?auto_460468 ?auto_460467 ) ( ON ?auto_460469 ?auto_460468 ) ( ON ?auto_460470 ?auto_460469 ) ( not ( = ?auto_460467 ?auto_460468 ) ) ( not ( = ?auto_460467 ?auto_460469 ) ) ( not ( = ?auto_460467 ?auto_460470 ) ) ( not ( = ?auto_460467 ?auto_460471 ) ) ( not ( = ?auto_460467 ?auto_460472 ) ) ( not ( = ?auto_460467 ?auto_460473 ) ) ( not ( = ?auto_460467 ?auto_460474 ) ) ( not ( = ?auto_460467 ?auto_460475 ) ) ( not ( = ?auto_460468 ?auto_460469 ) ) ( not ( = ?auto_460468 ?auto_460470 ) ) ( not ( = ?auto_460468 ?auto_460471 ) ) ( not ( = ?auto_460468 ?auto_460472 ) ) ( not ( = ?auto_460468 ?auto_460473 ) ) ( not ( = ?auto_460468 ?auto_460474 ) ) ( not ( = ?auto_460468 ?auto_460475 ) ) ( not ( = ?auto_460469 ?auto_460470 ) ) ( not ( = ?auto_460469 ?auto_460471 ) ) ( not ( = ?auto_460469 ?auto_460472 ) ) ( not ( = ?auto_460469 ?auto_460473 ) ) ( not ( = ?auto_460469 ?auto_460474 ) ) ( not ( = ?auto_460469 ?auto_460475 ) ) ( not ( = ?auto_460470 ?auto_460471 ) ) ( not ( = ?auto_460470 ?auto_460472 ) ) ( not ( = ?auto_460470 ?auto_460473 ) ) ( not ( = ?auto_460470 ?auto_460474 ) ) ( not ( = ?auto_460470 ?auto_460475 ) ) ( not ( = ?auto_460471 ?auto_460472 ) ) ( not ( = ?auto_460471 ?auto_460473 ) ) ( not ( = ?auto_460471 ?auto_460474 ) ) ( not ( = ?auto_460471 ?auto_460475 ) ) ( not ( = ?auto_460472 ?auto_460473 ) ) ( not ( = ?auto_460472 ?auto_460474 ) ) ( not ( = ?auto_460472 ?auto_460475 ) ) ( not ( = ?auto_460473 ?auto_460474 ) ) ( not ( = ?auto_460473 ?auto_460475 ) ) ( not ( = ?auto_460474 ?auto_460475 ) ) ( ON ?auto_460473 ?auto_460474 ) ( ON ?auto_460472 ?auto_460473 ) ( CLEAR ?auto_460470 ) ( ON ?auto_460471 ?auto_460472 ) ( CLEAR ?auto_460471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_460467 ?auto_460468 ?auto_460469 ?auto_460470 ?auto_460471 )
      ( MAKE-8PILE ?auto_460467 ?auto_460468 ?auto_460469 ?auto_460470 ?auto_460471 ?auto_460472 ?auto_460473 ?auto_460474 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460484 - BLOCK
      ?auto_460485 - BLOCK
      ?auto_460486 - BLOCK
      ?auto_460487 - BLOCK
      ?auto_460488 - BLOCK
      ?auto_460489 - BLOCK
      ?auto_460490 - BLOCK
      ?auto_460491 - BLOCK
    )
    :vars
    (
      ?auto_460492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460491 ?auto_460492 ) ( ON-TABLE ?auto_460484 ) ( ON ?auto_460485 ?auto_460484 ) ( ON ?auto_460486 ?auto_460485 ) ( not ( = ?auto_460484 ?auto_460485 ) ) ( not ( = ?auto_460484 ?auto_460486 ) ) ( not ( = ?auto_460484 ?auto_460487 ) ) ( not ( = ?auto_460484 ?auto_460488 ) ) ( not ( = ?auto_460484 ?auto_460489 ) ) ( not ( = ?auto_460484 ?auto_460490 ) ) ( not ( = ?auto_460484 ?auto_460491 ) ) ( not ( = ?auto_460484 ?auto_460492 ) ) ( not ( = ?auto_460485 ?auto_460486 ) ) ( not ( = ?auto_460485 ?auto_460487 ) ) ( not ( = ?auto_460485 ?auto_460488 ) ) ( not ( = ?auto_460485 ?auto_460489 ) ) ( not ( = ?auto_460485 ?auto_460490 ) ) ( not ( = ?auto_460485 ?auto_460491 ) ) ( not ( = ?auto_460485 ?auto_460492 ) ) ( not ( = ?auto_460486 ?auto_460487 ) ) ( not ( = ?auto_460486 ?auto_460488 ) ) ( not ( = ?auto_460486 ?auto_460489 ) ) ( not ( = ?auto_460486 ?auto_460490 ) ) ( not ( = ?auto_460486 ?auto_460491 ) ) ( not ( = ?auto_460486 ?auto_460492 ) ) ( not ( = ?auto_460487 ?auto_460488 ) ) ( not ( = ?auto_460487 ?auto_460489 ) ) ( not ( = ?auto_460487 ?auto_460490 ) ) ( not ( = ?auto_460487 ?auto_460491 ) ) ( not ( = ?auto_460487 ?auto_460492 ) ) ( not ( = ?auto_460488 ?auto_460489 ) ) ( not ( = ?auto_460488 ?auto_460490 ) ) ( not ( = ?auto_460488 ?auto_460491 ) ) ( not ( = ?auto_460488 ?auto_460492 ) ) ( not ( = ?auto_460489 ?auto_460490 ) ) ( not ( = ?auto_460489 ?auto_460491 ) ) ( not ( = ?auto_460489 ?auto_460492 ) ) ( not ( = ?auto_460490 ?auto_460491 ) ) ( not ( = ?auto_460490 ?auto_460492 ) ) ( not ( = ?auto_460491 ?auto_460492 ) ) ( ON ?auto_460490 ?auto_460491 ) ( ON ?auto_460489 ?auto_460490 ) ( ON ?auto_460488 ?auto_460489 ) ( CLEAR ?auto_460486 ) ( ON ?auto_460487 ?auto_460488 ) ( CLEAR ?auto_460487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_460484 ?auto_460485 ?auto_460486 ?auto_460487 )
      ( MAKE-8PILE ?auto_460484 ?auto_460485 ?auto_460486 ?auto_460487 ?auto_460488 ?auto_460489 ?auto_460490 ?auto_460491 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460501 - BLOCK
      ?auto_460502 - BLOCK
      ?auto_460503 - BLOCK
      ?auto_460504 - BLOCK
      ?auto_460505 - BLOCK
      ?auto_460506 - BLOCK
      ?auto_460507 - BLOCK
      ?auto_460508 - BLOCK
    )
    :vars
    (
      ?auto_460509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460508 ?auto_460509 ) ( ON-TABLE ?auto_460501 ) ( ON ?auto_460502 ?auto_460501 ) ( ON ?auto_460503 ?auto_460502 ) ( not ( = ?auto_460501 ?auto_460502 ) ) ( not ( = ?auto_460501 ?auto_460503 ) ) ( not ( = ?auto_460501 ?auto_460504 ) ) ( not ( = ?auto_460501 ?auto_460505 ) ) ( not ( = ?auto_460501 ?auto_460506 ) ) ( not ( = ?auto_460501 ?auto_460507 ) ) ( not ( = ?auto_460501 ?auto_460508 ) ) ( not ( = ?auto_460501 ?auto_460509 ) ) ( not ( = ?auto_460502 ?auto_460503 ) ) ( not ( = ?auto_460502 ?auto_460504 ) ) ( not ( = ?auto_460502 ?auto_460505 ) ) ( not ( = ?auto_460502 ?auto_460506 ) ) ( not ( = ?auto_460502 ?auto_460507 ) ) ( not ( = ?auto_460502 ?auto_460508 ) ) ( not ( = ?auto_460502 ?auto_460509 ) ) ( not ( = ?auto_460503 ?auto_460504 ) ) ( not ( = ?auto_460503 ?auto_460505 ) ) ( not ( = ?auto_460503 ?auto_460506 ) ) ( not ( = ?auto_460503 ?auto_460507 ) ) ( not ( = ?auto_460503 ?auto_460508 ) ) ( not ( = ?auto_460503 ?auto_460509 ) ) ( not ( = ?auto_460504 ?auto_460505 ) ) ( not ( = ?auto_460504 ?auto_460506 ) ) ( not ( = ?auto_460504 ?auto_460507 ) ) ( not ( = ?auto_460504 ?auto_460508 ) ) ( not ( = ?auto_460504 ?auto_460509 ) ) ( not ( = ?auto_460505 ?auto_460506 ) ) ( not ( = ?auto_460505 ?auto_460507 ) ) ( not ( = ?auto_460505 ?auto_460508 ) ) ( not ( = ?auto_460505 ?auto_460509 ) ) ( not ( = ?auto_460506 ?auto_460507 ) ) ( not ( = ?auto_460506 ?auto_460508 ) ) ( not ( = ?auto_460506 ?auto_460509 ) ) ( not ( = ?auto_460507 ?auto_460508 ) ) ( not ( = ?auto_460507 ?auto_460509 ) ) ( not ( = ?auto_460508 ?auto_460509 ) ) ( ON ?auto_460507 ?auto_460508 ) ( ON ?auto_460506 ?auto_460507 ) ( ON ?auto_460505 ?auto_460506 ) ( CLEAR ?auto_460503 ) ( ON ?auto_460504 ?auto_460505 ) ( CLEAR ?auto_460504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_460501 ?auto_460502 ?auto_460503 ?auto_460504 )
      ( MAKE-8PILE ?auto_460501 ?auto_460502 ?auto_460503 ?auto_460504 ?auto_460505 ?auto_460506 ?auto_460507 ?auto_460508 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460518 - BLOCK
      ?auto_460519 - BLOCK
      ?auto_460520 - BLOCK
      ?auto_460521 - BLOCK
      ?auto_460522 - BLOCK
      ?auto_460523 - BLOCK
      ?auto_460524 - BLOCK
      ?auto_460525 - BLOCK
    )
    :vars
    (
      ?auto_460526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460525 ?auto_460526 ) ( ON-TABLE ?auto_460518 ) ( ON ?auto_460519 ?auto_460518 ) ( not ( = ?auto_460518 ?auto_460519 ) ) ( not ( = ?auto_460518 ?auto_460520 ) ) ( not ( = ?auto_460518 ?auto_460521 ) ) ( not ( = ?auto_460518 ?auto_460522 ) ) ( not ( = ?auto_460518 ?auto_460523 ) ) ( not ( = ?auto_460518 ?auto_460524 ) ) ( not ( = ?auto_460518 ?auto_460525 ) ) ( not ( = ?auto_460518 ?auto_460526 ) ) ( not ( = ?auto_460519 ?auto_460520 ) ) ( not ( = ?auto_460519 ?auto_460521 ) ) ( not ( = ?auto_460519 ?auto_460522 ) ) ( not ( = ?auto_460519 ?auto_460523 ) ) ( not ( = ?auto_460519 ?auto_460524 ) ) ( not ( = ?auto_460519 ?auto_460525 ) ) ( not ( = ?auto_460519 ?auto_460526 ) ) ( not ( = ?auto_460520 ?auto_460521 ) ) ( not ( = ?auto_460520 ?auto_460522 ) ) ( not ( = ?auto_460520 ?auto_460523 ) ) ( not ( = ?auto_460520 ?auto_460524 ) ) ( not ( = ?auto_460520 ?auto_460525 ) ) ( not ( = ?auto_460520 ?auto_460526 ) ) ( not ( = ?auto_460521 ?auto_460522 ) ) ( not ( = ?auto_460521 ?auto_460523 ) ) ( not ( = ?auto_460521 ?auto_460524 ) ) ( not ( = ?auto_460521 ?auto_460525 ) ) ( not ( = ?auto_460521 ?auto_460526 ) ) ( not ( = ?auto_460522 ?auto_460523 ) ) ( not ( = ?auto_460522 ?auto_460524 ) ) ( not ( = ?auto_460522 ?auto_460525 ) ) ( not ( = ?auto_460522 ?auto_460526 ) ) ( not ( = ?auto_460523 ?auto_460524 ) ) ( not ( = ?auto_460523 ?auto_460525 ) ) ( not ( = ?auto_460523 ?auto_460526 ) ) ( not ( = ?auto_460524 ?auto_460525 ) ) ( not ( = ?auto_460524 ?auto_460526 ) ) ( not ( = ?auto_460525 ?auto_460526 ) ) ( ON ?auto_460524 ?auto_460525 ) ( ON ?auto_460523 ?auto_460524 ) ( ON ?auto_460522 ?auto_460523 ) ( ON ?auto_460521 ?auto_460522 ) ( CLEAR ?auto_460519 ) ( ON ?auto_460520 ?auto_460521 ) ( CLEAR ?auto_460520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_460518 ?auto_460519 ?auto_460520 )
      ( MAKE-8PILE ?auto_460518 ?auto_460519 ?auto_460520 ?auto_460521 ?auto_460522 ?auto_460523 ?auto_460524 ?auto_460525 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460535 - BLOCK
      ?auto_460536 - BLOCK
      ?auto_460537 - BLOCK
      ?auto_460538 - BLOCK
      ?auto_460539 - BLOCK
      ?auto_460540 - BLOCK
      ?auto_460541 - BLOCK
      ?auto_460542 - BLOCK
    )
    :vars
    (
      ?auto_460543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460542 ?auto_460543 ) ( ON-TABLE ?auto_460535 ) ( ON ?auto_460536 ?auto_460535 ) ( not ( = ?auto_460535 ?auto_460536 ) ) ( not ( = ?auto_460535 ?auto_460537 ) ) ( not ( = ?auto_460535 ?auto_460538 ) ) ( not ( = ?auto_460535 ?auto_460539 ) ) ( not ( = ?auto_460535 ?auto_460540 ) ) ( not ( = ?auto_460535 ?auto_460541 ) ) ( not ( = ?auto_460535 ?auto_460542 ) ) ( not ( = ?auto_460535 ?auto_460543 ) ) ( not ( = ?auto_460536 ?auto_460537 ) ) ( not ( = ?auto_460536 ?auto_460538 ) ) ( not ( = ?auto_460536 ?auto_460539 ) ) ( not ( = ?auto_460536 ?auto_460540 ) ) ( not ( = ?auto_460536 ?auto_460541 ) ) ( not ( = ?auto_460536 ?auto_460542 ) ) ( not ( = ?auto_460536 ?auto_460543 ) ) ( not ( = ?auto_460537 ?auto_460538 ) ) ( not ( = ?auto_460537 ?auto_460539 ) ) ( not ( = ?auto_460537 ?auto_460540 ) ) ( not ( = ?auto_460537 ?auto_460541 ) ) ( not ( = ?auto_460537 ?auto_460542 ) ) ( not ( = ?auto_460537 ?auto_460543 ) ) ( not ( = ?auto_460538 ?auto_460539 ) ) ( not ( = ?auto_460538 ?auto_460540 ) ) ( not ( = ?auto_460538 ?auto_460541 ) ) ( not ( = ?auto_460538 ?auto_460542 ) ) ( not ( = ?auto_460538 ?auto_460543 ) ) ( not ( = ?auto_460539 ?auto_460540 ) ) ( not ( = ?auto_460539 ?auto_460541 ) ) ( not ( = ?auto_460539 ?auto_460542 ) ) ( not ( = ?auto_460539 ?auto_460543 ) ) ( not ( = ?auto_460540 ?auto_460541 ) ) ( not ( = ?auto_460540 ?auto_460542 ) ) ( not ( = ?auto_460540 ?auto_460543 ) ) ( not ( = ?auto_460541 ?auto_460542 ) ) ( not ( = ?auto_460541 ?auto_460543 ) ) ( not ( = ?auto_460542 ?auto_460543 ) ) ( ON ?auto_460541 ?auto_460542 ) ( ON ?auto_460540 ?auto_460541 ) ( ON ?auto_460539 ?auto_460540 ) ( ON ?auto_460538 ?auto_460539 ) ( CLEAR ?auto_460536 ) ( ON ?auto_460537 ?auto_460538 ) ( CLEAR ?auto_460537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_460535 ?auto_460536 ?auto_460537 )
      ( MAKE-8PILE ?auto_460535 ?auto_460536 ?auto_460537 ?auto_460538 ?auto_460539 ?auto_460540 ?auto_460541 ?auto_460542 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460552 - BLOCK
      ?auto_460553 - BLOCK
      ?auto_460554 - BLOCK
      ?auto_460555 - BLOCK
      ?auto_460556 - BLOCK
      ?auto_460557 - BLOCK
      ?auto_460558 - BLOCK
      ?auto_460559 - BLOCK
    )
    :vars
    (
      ?auto_460560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460559 ?auto_460560 ) ( ON-TABLE ?auto_460552 ) ( not ( = ?auto_460552 ?auto_460553 ) ) ( not ( = ?auto_460552 ?auto_460554 ) ) ( not ( = ?auto_460552 ?auto_460555 ) ) ( not ( = ?auto_460552 ?auto_460556 ) ) ( not ( = ?auto_460552 ?auto_460557 ) ) ( not ( = ?auto_460552 ?auto_460558 ) ) ( not ( = ?auto_460552 ?auto_460559 ) ) ( not ( = ?auto_460552 ?auto_460560 ) ) ( not ( = ?auto_460553 ?auto_460554 ) ) ( not ( = ?auto_460553 ?auto_460555 ) ) ( not ( = ?auto_460553 ?auto_460556 ) ) ( not ( = ?auto_460553 ?auto_460557 ) ) ( not ( = ?auto_460553 ?auto_460558 ) ) ( not ( = ?auto_460553 ?auto_460559 ) ) ( not ( = ?auto_460553 ?auto_460560 ) ) ( not ( = ?auto_460554 ?auto_460555 ) ) ( not ( = ?auto_460554 ?auto_460556 ) ) ( not ( = ?auto_460554 ?auto_460557 ) ) ( not ( = ?auto_460554 ?auto_460558 ) ) ( not ( = ?auto_460554 ?auto_460559 ) ) ( not ( = ?auto_460554 ?auto_460560 ) ) ( not ( = ?auto_460555 ?auto_460556 ) ) ( not ( = ?auto_460555 ?auto_460557 ) ) ( not ( = ?auto_460555 ?auto_460558 ) ) ( not ( = ?auto_460555 ?auto_460559 ) ) ( not ( = ?auto_460555 ?auto_460560 ) ) ( not ( = ?auto_460556 ?auto_460557 ) ) ( not ( = ?auto_460556 ?auto_460558 ) ) ( not ( = ?auto_460556 ?auto_460559 ) ) ( not ( = ?auto_460556 ?auto_460560 ) ) ( not ( = ?auto_460557 ?auto_460558 ) ) ( not ( = ?auto_460557 ?auto_460559 ) ) ( not ( = ?auto_460557 ?auto_460560 ) ) ( not ( = ?auto_460558 ?auto_460559 ) ) ( not ( = ?auto_460558 ?auto_460560 ) ) ( not ( = ?auto_460559 ?auto_460560 ) ) ( ON ?auto_460558 ?auto_460559 ) ( ON ?auto_460557 ?auto_460558 ) ( ON ?auto_460556 ?auto_460557 ) ( ON ?auto_460555 ?auto_460556 ) ( ON ?auto_460554 ?auto_460555 ) ( CLEAR ?auto_460552 ) ( ON ?auto_460553 ?auto_460554 ) ( CLEAR ?auto_460553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_460552 ?auto_460553 )
      ( MAKE-8PILE ?auto_460552 ?auto_460553 ?auto_460554 ?auto_460555 ?auto_460556 ?auto_460557 ?auto_460558 ?auto_460559 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460569 - BLOCK
      ?auto_460570 - BLOCK
      ?auto_460571 - BLOCK
      ?auto_460572 - BLOCK
      ?auto_460573 - BLOCK
      ?auto_460574 - BLOCK
      ?auto_460575 - BLOCK
      ?auto_460576 - BLOCK
    )
    :vars
    (
      ?auto_460577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460576 ?auto_460577 ) ( ON-TABLE ?auto_460569 ) ( not ( = ?auto_460569 ?auto_460570 ) ) ( not ( = ?auto_460569 ?auto_460571 ) ) ( not ( = ?auto_460569 ?auto_460572 ) ) ( not ( = ?auto_460569 ?auto_460573 ) ) ( not ( = ?auto_460569 ?auto_460574 ) ) ( not ( = ?auto_460569 ?auto_460575 ) ) ( not ( = ?auto_460569 ?auto_460576 ) ) ( not ( = ?auto_460569 ?auto_460577 ) ) ( not ( = ?auto_460570 ?auto_460571 ) ) ( not ( = ?auto_460570 ?auto_460572 ) ) ( not ( = ?auto_460570 ?auto_460573 ) ) ( not ( = ?auto_460570 ?auto_460574 ) ) ( not ( = ?auto_460570 ?auto_460575 ) ) ( not ( = ?auto_460570 ?auto_460576 ) ) ( not ( = ?auto_460570 ?auto_460577 ) ) ( not ( = ?auto_460571 ?auto_460572 ) ) ( not ( = ?auto_460571 ?auto_460573 ) ) ( not ( = ?auto_460571 ?auto_460574 ) ) ( not ( = ?auto_460571 ?auto_460575 ) ) ( not ( = ?auto_460571 ?auto_460576 ) ) ( not ( = ?auto_460571 ?auto_460577 ) ) ( not ( = ?auto_460572 ?auto_460573 ) ) ( not ( = ?auto_460572 ?auto_460574 ) ) ( not ( = ?auto_460572 ?auto_460575 ) ) ( not ( = ?auto_460572 ?auto_460576 ) ) ( not ( = ?auto_460572 ?auto_460577 ) ) ( not ( = ?auto_460573 ?auto_460574 ) ) ( not ( = ?auto_460573 ?auto_460575 ) ) ( not ( = ?auto_460573 ?auto_460576 ) ) ( not ( = ?auto_460573 ?auto_460577 ) ) ( not ( = ?auto_460574 ?auto_460575 ) ) ( not ( = ?auto_460574 ?auto_460576 ) ) ( not ( = ?auto_460574 ?auto_460577 ) ) ( not ( = ?auto_460575 ?auto_460576 ) ) ( not ( = ?auto_460575 ?auto_460577 ) ) ( not ( = ?auto_460576 ?auto_460577 ) ) ( ON ?auto_460575 ?auto_460576 ) ( ON ?auto_460574 ?auto_460575 ) ( ON ?auto_460573 ?auto_460574 ) ( ON ?auto_460572 ?auto_460573 ) ( ON ?auto_460571 ?auto_460572 ) ( CLEAR ?auto_460569 ) ( ON ?auto_460570 ?auto_460571 ) ( CLEAR ?auto_460570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_460569 ?auto_460570 )
      ( MAKE-8PILE ?auto_460569 ?auto_460570 ?auto_460571 ?auto_460572 ?auto_460573 ?auto_460574 ?auto_460575 ?auto_460576 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460586 - BLOCK
      ?auto_460587 - BLOCK
      ?auto_460588 - BLOCK
      ?auto_460589 - BLOCK
      ?auto_460590 - BLOCK
      ?auto_460591 - BLOCK
      ?auto_460592 - BLOCK
      ?auto_460593 - BLOCK
    )
    :vars
    (
      ?auto_460594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460593 ?auto_460594 ) ( not ( = ?auto_460586 ?auto_460587 ) ) ( not ( = ?auto_460586 ?auto_460588 ) ) ( not ( = ?auto_460586 ?auto_460589 ) ) ( not ( = ?auto_460586 ?auto_460590 ) ) ( not ( = ?auto_460586 ?auto_460591 ) ) ( not ( = ?auto_460586 ?auto_460592 ) ) ( not ( = ?auto_460586 ?auto_460593 ) ) ( not ( = ?auto_460586 ?auto_460594 ) ) ( not ( = ?auto_460587 ?auto_460588 ) ) ( not ( = ?auto_460587 ?auto_460589 ) ) ( not ( = ?auto_460587 ?auto_460590 ) ) ( not ( = ?auto_460587 ?auto_460591 ) ) ( not ( = ?auto_460587 ?auto_460592 ) ) ( not ( = ?auto_460587 ?auto_460593 ) ) ( not ( = ?auto_460587 ?auto_460594 ) ) ( not ( = ?auto_460588 ?auto_460589 ) ) ( not ( = ?auto_460588 ?auto_460590 ) ) ( not ( = ?auto_460588 ?auto_460591 ) ) ( not ( = ?auto_460588 ?auto_460592 ) ) ( not ( = ?auto_460588 ?auto_460593 ) ) ( not ( = ?auto_460588 ?auto_460594 ) ) ( not ( = ?auto_460589 ?auto_460590 ) ) ( not ( = ?auto_460589 ?auto_460591 ) ) ( not ( = ?auto_460589 ?auto_460592 ) ) ( not ( = ?auto_460589 ?auto_460593 ) ) ( not ( = ?auto_460589 ?auto_460594 ) ) ( not ( = ?auto_460590 ?auto_460591 ) ) ( not ( = ?auto_460590 ?auto_460592 ) ) ( not ( = ?auto_460590 ?auto_460593 ) ) ( not ( = ?auto_460590 ?auto_460594 ) ) ( not ( = ?auto_460591 ?auto_460592 ) ) ( not ( = ?auto_460591 ?auto_460593 ) ) ( not ( = ?auto_460591 ?auto_460594 ) ) ( not ( = ?auto_460592 ?auto_460593 ) ) ( not ( = ?auto_460592 ?auto_460594 ) ) ( not ( = ?auto_460593 ?auto_460594 ) ) ( ON ?auto_460592 ?auto_460593 ) ( ON ?auto_460591 ?auto_460592 ) ( ON ?auto_460590 ?auto_460591 ) ( ON ?auto_460589 ?auto_460590 ) ( ON ?auto_460588 ?auto_460589 ) ( ON ?auto_460587 ?auto_460588 ) ( ON ?auto_460586 ?auto_460587 ) ( CLEAR ?auto_460586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_460586 )
      ( MAKE-8PILE ?auto_460586 ?auto_460587 ?auto_460588 ?auto_460589 ?auto_460590 ?auto_460591 ?auto_460592 ?auto_460593 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_460603 - BLOCK
      ?auto_460604 - BLOCK
      ?auto_460605 - BLOCK
      ?auto_460606 - BLOCK
      ?auto_460607 - BLOCK
      ?auto_460608 - BLOCK
      ?auto_460609 - BLOCK
      ?auto_460610 - BLOCK
    )
    :vars
    (
      ?auto_460611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460610 ?auto_460611 ) ( not ( = ?auto_460603 ?auto_460604 ) ) ( not ( = ?auto_460603 ?auto_460605 ) ) ( not ( = ?auto_460603 ?auto_460606 ) ) ( not ( = ?auto_460603 ?auto_460607 ) ) ( not ( = ?auto_460603 ?auto_460608 ) ) ( not ( = ?auto_460603 ?auto_460609 ) ) ( not ( = ?auto_460603 ?auto_460610 ) ) ( not ( = ?auto_460603 ?auto_460611 ) ) ( not ( = ?auto_460604 ?auto_460605 ) ) ( not ( = ?auto_460604 ?auto_460606 ) ) ( not ( = ?auto_460604 ?auto_460607 ) ) ( not ( = ?auto_460604 ?auto_460608 ) ) ( not ( = ?auto_460604 ?auto_460609 ) ) ( not ( = ?auto_460604 ?auto_460610 ) ) ( not ( = ?auto_460604 ?auto_460611 ) ) ( not ( = ?auto_460605 ?auto_460606 ) ) ( not ( = ?auto_460605 ?auto_460607 ) ) ( not ( = ?auto_460605 ?auto_460608 ) ) ( not ( = ?auto_460605 ?auto_460609 ) ) ( not ( = ?auto_460605 ?auto_460610 ) ) ( not ( = ?auto_460605 ?auto_460611 ) ) ( not ( = ?auto_460606 ?auto_460607 ) ) ( not ( = ?auto_460606 ?auto_460608 ) ) ( not ( = ?auto_460606 ?auto_460609 ) ) ( not ( = ?auto_460606 ?auto_460610 ) ) ( not ( = ?auto_460606 ?auto_460611 ) ) ( not ( = ?auto_460607 ?auto_460608 ) ) ( not ( = ?auto_460607 ?auto_460609 ) ) ( not ( = ?auto_460607 ?auto_460610 ) ) ( not ( = ?auto_460607 ?auto_460611 ) ) ( not ( = ?auto_460608 ?auto_460609 ) ) ( not ( = ?auto_460608 ?auto_460610 ) ) ( not ( = ?auto_460608 ?auto_460611 ) ) ( not ( = ?auto_460609 ?auto_460610 ) ) ( not ( = ?auto_460609 ?auto_460611 ) ) ( not ( = ?auto_460610 ?auto_460611 ) ) ( ON ?auto_460609 ?auto_460610 ) ( ON ?auto_460608 ?auto_460609 ) ( ON ?auto_460607 ?auto_460608 ) ( ON ?auto_460606 ?auto_460607 ) ( ON ?auto_460605 ?auto_460606 ) ( ON ?auto_460604 ?auto_460605 ) ( ON ?auto_460603 ?auto_460604 ) ( CLEAR ?auto_460603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_460603 )
      ( MAKE-8PILE ?auto_460603 ?auto_460604 ?auto_460605 ?auto_460606 ?auto_460607 ?auto_460608 ?auto_460609 ?auto_460610 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460621 - BLOCK
      ?auto_460622 - BLOCK
      ?auto_460623 - BLOCK
      ?auto_460624 - BLOCK
      ?auto_460625 - BLOCK
      ?auto_460626 - BLOCK
      ?auto_460627 - BLOCK
      ?auto_460628 - BLOCK
      ?auto_460629 - BLOCK
    )
    :vars
    (
      ?auto_460630 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_460628 ) ( ON ?auto_460629 ?auto_460630 ) ( CLEAR ?auto_460629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_460621 ) ( ON ?auto_460622 ?auto_460621 ) ( ON ?auto_460623 ?auto_460622 ) ( ON ?auto_460624 ?auto_460623 ) ( ON ?auto_460625 ?auto_460624 ) ( ON ?auto_460626 ?auto_460625 ) ( ON ?auto_460627 ?auto_460626 ) ( ON ?auto_460628 ?auto_460627 ) ( not ( = ?auto_460621 ?auto_460622 ) ) ( not ( = ?auto_460621 ?auto_460623 ) ) ( not ( = ?auto_460621 ?auto_460624 ) ) ( not ( = ?auto_460621 ?auto_460625 ) ) ( not ( = ?auto_460621 ?auto_460626 ) ) ( not ( = ?auto_460621 ?auto_460627 ) ) ( not ( = ?auto_460621 ?auto_460628 ) ) ( not ( = ?auto_460621 ?auto_460629 ) ) ( not ( = ?auto_460621 ?auto_460630 ) ) ( not ( = ?auto_460622 ?auto_460623 ) ) ( not ( = ?auto_460622 ?auto_460624 ) ) ( not ( = ?auto_460622 ?auto_460625 ) ) ( not ( = ?auto_460622 ?auto_460626 ) ) ( not ( = ?auto_460622 ?auto_460627 ) ) ( not ( = ?auto_460622 ?auto_460628 ) ) ( not ( = ?auto_460622 ?auto_460629 ) ) ( not ( = ?auto_460622 ?auto_460630 ) ) ( not ( = ?auto_460623 ?auto_460624 ) ) ( not ( = ?auto_460623 ?auto_460625 ) ) ( not ( = ?auto_460623 ?auto_460626 ) ) ( not ( = ?auto_460623 ?auto_460627 ) ) ( not ( = ?auto_460623 ?auto_460628 ) ) ( not ( = ?auto_460623 ?auto_460629 ) ) ( not ( = ?auto_460623 ?auto_460630 ) ) ( not ( = ?auto_460624 ?auto_460625 ) ) ( not ( = ?auto_460624 ?auto_460626 ) ) ( not ( = ?auto_460624 ?auto_460627 ) ) ( not ( = ?auto_460624 ?auto_460628 ) ) ( not ( = ?auto_460624 ?auto_460629 ) ) ( not ( = ?auto_460624 ?auto_460630 ) ) ( not ( = ?auto_460625 ?auto_460626 ) ) ( not ( = ?auto_460625 ?auto_460627 ) ) ( not ( = ?auto_460625 ?auto_460628 ) ) ( not ( = ?auto_460625 ?auto_460629 ) ) ( not ( = ?auto_460625 ?auto_460630 ) ) ( not ( = ?auto_460626 ?auto_460627 ) ) ( not ( = ?auto_460626 ?auto_460628 ) ) ( not ( = ?auto_460626 ?auto_460629 ) ) ( not ( = ?auto_460626 ?auto_460630 ) ) ( not ( = ?auto_460627 ?auto_460628 ) ) ( not ( = ?auto_460627 ?auto_460629 ) ) ( not ( = ?auto_460627 ?auto_460630 ) ) ( not ( = ?auto_460628 ?auto_460629 ) ) ( not ( = ?auto_460628 ?auto_460630 ) ) ( not ( = ?auto_460629 ?auto_460630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_460629 ?auto_460630 )
      ( !STACK ?auto_460629 ?auto_460628 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460640 - BLOCK
      ?auto_460641 - BLOCK
      ?auto_460642 - BLOCK
      ?auto_460643 - BLOCK
      ?auto_460644 - BLOCK
      ?auto_460645 - BLOCK
      ?auto_460646 - BLOCK
      ?auto_460647 - BLOCK
      ?auto_460648 - BLOCK
    )
    :vars
    (
      ?auto_460649 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_460647 ) ( ON ?auto_460648 ?auto_460649 ) ( CLEAR ?auto_460648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_460640 ) ( ON ?auto_460641 ?auto_460640 ) ( ON ?auto_460642 ?auto_460641 ) ( ON ?auto_460643 ?auto_460642 ) ( ON ?auto_460644 ?auto_460643 ) ( ON ?auto_460645 ?auto_460644 ) ( ON ?auto_460646 ?auto_460645 ) ( ON ?auto_460647 ?auto_460646 ) ( not ( = ?auto_460640 ?auto_460641 ) ) ( not ( = ?auto_460640 ?auto_460642 ) ) ( not ( = ?auto_460640 ?auto_460643 ) ) ( not ( = ?auto_460640 ?auto_460644 ) ) ( not ( = ?auto_460640 ?auto_460645 ) ) ( not ( = ?auto_460640 ?auto_460646 ) ) ( not ( = ?auto_460640 ?auto_460647 ) ) ( not ( = ?auto_460640 ?auto_460648 ) ) ( not ( = ?auto_460640 ?auto_460649 ) ) ( not ( = ?auto_460641 ?auto_460642 ) ) ( not ( = ?auto_460641 ?auto_460643 ) ) ( not ( = ?auto_460641 ?auto_460644 ) ) ( not ( = ?auto_460641 ?auto_460645 ) ) ( not ( = ?auto_460641 ?auto_460646 ) ) ( not ( = ?auto_460641 ?auto_460647 ) ) ( not ( = ?auto_460641 ?auto_460648 ) ) ( not ( = ?auto_460641 ?auto_460649 ) ) ( not ( = ?auto_460642 ?auto_460643 ) ) ( not ( = ?auto_460642 ?auto_460644 ) ) ( not ( = ?auto_460642 ?auto_460645 ) ) ( not ( = ?auto_460642 ?auto_460646 ) ) ( not ( = ?auto_460642 ?auto_460647 ) ) ( not ( = ?auto_460642 ?auto_460648 ) ) ( not ( = ?auto_460642 ?auto_460649 ) ) ( not ( = ?auto_460643 ?auto_460644 ) ) ( not ( = ?auto_460643 ?auto_460645 ) ) ( not ( = ?auto_460643 ?auto_460646 ) ) ( not ( = ?auto_460643 ?auto_460647 ) ) ( not ( = ?auto_460643 ?auto_460648 ) ) ( not ( = ?auto_460643 ?auto_460649 ) ) ( not ( = ?auto_460644 ?auto_460645 ) ) ( not ( = ?auto_460644 ?auto_460646 ) ) ( not ( = ?auto_460644 ?auto_460647 ) ) ( not ( = ?auto_460644 ?auto_460648 ) ) ( not ( = ?auto_460644 ?auto_460649 ) ) ( not ( = ?auto_460645 ?auto_460646 ) ) ( not ( = ?auto_460645 ?auto_460647 ) ) ( not ( = ?auto_460645 ?auto_460648 ) ) ( not ( = ?auto_460645 ?auto_460649 ) ) ( not ( = ?auto_460646 ?auto_460647 ) ) ( not ( = ?auto_460646 ?auto_460648 ) ) ( not ( = ?auto_460646 ?auto_460649 ) ) ( not ( = ?auto_460647 ?auto_460648 ) ) ( not ( = ?auto_460647 ?auto_460649 ) ) ( not ( = ?auto_460648 ?auto_460649 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_460648 ?auto_460649 )
      ( !STACK ?auto_460648 ?auto_460647 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460659 - BLOCK
      ?auto_460660 - BLOCK
      ?auto_460661 - BLOCK
      ?auto_460662 - BLOCK
      ?auto_460663 - BLOCK
      ?auto_460664 - BLOCK
      ?auto_460665 - BLOCK
      ?auto_460666 - BLOCK
      ?auto_460667 - BLOCK
    )
    :vars
    (
      ?auto_460668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460667 ?auto_460668 ) ( ON-TABLE ?auto_460659 ) ( ON ?auto_460660 ?auto_460659 ) ( ON ?auto_460661 ?auto_460660 ) ( ON ?auto_460662 ?auto_460661 ) ( ON ?auto_460663 ?auto_460662 ) ( ON ?auto_460664 ?auto_460663 ) ( ON ?auto_460665 ?auto_460664 ) ( not ( = ?auto_460659 ?auto_460660 ) ) ( not ( = ?auto_460659 ?auto_460661 ) ) ( not ( = ?auto_460659 ?auto_460662 ) ) ( not ( = ?auto_460659 ?auto_460663 ) ) ( not ( = ?auto_460659 ?auto_460664 ) ) ( not ( = ?auto_460659 ?auto_460665 ) ) ( not ( = ?auto_460659 ?auto_460666 ) ) ( not ( = ?auto_460659 ?auto_460667 ) ) ( not ( = ?auto_460659 ?auto_460668 ) ) ( not ( = ?auto_460660 ?auto_460661 ) ) ( not ( = ?auto_460660 ?auto_460662 ) ) ( not ( = ?auto_460660 ?auto_460663 ) ) ( not ( = ?auto_460660 ?auto_460664 ) ) ( not ( = ?auto_460660 ?auto_460665 ) ) ( not ( = ?auto_460660 ?auto_460666 ) ) ( not ( = ?auto_460660 ?auto_460667 ) ) ( not ( = ?auto_460660 ?auto_460668 ) ) ( not ( = ?auto_460661 ?auto_460662 ) ) ( not ( = ?auto_460661 ?auto_460663 ) ) ( not ( = ?auto_460661 ?auto_460664 ) ) ( not ( = ?auto_460661 ?auto_460665 ) ) ( not ( = ?auto_460661 ?auto_460666 ) ) ( not ( = ?auto_460661 ?auto_460667 ) ) ( not ( = ?auto_460661 ?auto_460668 ) ) ( not ( = ?auto_460662 ?auto_460663 ) ) ( not ( = ?auto_460662 ?auto_460664 ) ) ( not ( = ?auto_460662 ?auto_460665 ) ) ( not ( = ?auto_460662 ?auto_460666 ) ) ( not ( = ?auto_460662 ?auto_460667 ) ) ( not ( = ?auto_460662 ?auto_460668 ) ) ( not ( = ?auto_460663 ?auto_460664 ) ) ( not ( = ?auto_460663 ?auto_460665 ) ) ( not ( = ?auto_460663 ?auto_460666 ) ) ( not ( = ?auto_460663 ?auto_460667 ) ) ( not ( = ?auto_460663 ?auto_460668 ) ) ( not ( = ?auto_460664 ?auto_460665 ) ) ( not ( = ?auto_460664 ?auto_460666 ) ) ( not ( = ?auto_460664 ?auto_460667 ) ) ( not ( = ?auto_460664 ?auto_460668 ) ) ( not ( = ?auto_460665 ?auto_460666 ) ) ( not ( = ?auto_460665 ?auto_460667 ) ) ( not ( = ?auto_460665 ?auto_460668 ) ) ( not ( = ?auto_460666 ?auto_460667 ) ) ( not ( = ?auto_460666 ?auto_460668 ) ) ( not ( = ?auto_460667 ?auto_460668 ) ) ( CLEAR ?auto_460665 ) ( ON ?auto_460666 ?auto_460667 ) ( CLEAR ?auto_460666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_460659 ?auto_460660 ?auto_460661 ?auto_460662 ?auto_460663 ?auto_460664 ?auto_460665 ?auto_460666 )
      ( MAKE-9PILE ?auto_460659 ?auto_460660 ?auto_460661 ?auto_460662 ?auto_460663 ?auto_460664 ?auto_460665 ?auto_460666 ?auto_460667 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460678 - BLOCK
      ?auto_460679 - BLOCK
      ?auto_460680 - BLOCK
      ?auto_460681 - BLOCK
      ?auto_460682 - BLOCK
      ?auto_460683 - BLOCK
      ?auto_460684 - BLOCK
      ?auto_460685 - BLOCK
      ?auto_460686 - BLOCK
    )
    :vars
    (
      ?auto_460687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460686 ?auto_460687 ) ( ON-TABLE ?auto_460678 ) ( ON ?auto_460679 ?auto_460678 ) ( ON ?auto_460680 ?auto_460679 ) ( ON ?auto_460681 ?auto_460680 ) ( ON ?auto_460682 ?auto_460681 ) ( ON ?auto_460683 ?auto_460682 ) ( ON ?auto_460684 ?auto_460683 ) ( not ( = ?auto_460678 ?auto_460679 ) ) ( not ( = ?auto_460678 ?auto_460680 ) ) ( not ( = ?auto_460678 ?auto_460681 ) ) ( not ( = ?auto_460678 ?auto_460682 ) ) ( not ( = ?auto_460678 ?auto_460683 ) ) ( not ( = ?auto_460678 ?auto_460684 ) ) ( not ( = ?auto_460678 ?auto_460685 ) ) ( not ( = ?auto_460678 ?auto_460686 ) ) ( not ( = ?auto_460678 ?auto_460687 ) ) ( not ( = ?auto_460679 ?auto_460680 ) ) ( not ( = ?auto_460679 ?auto_460681 ) ) ( not ( = ?auto_460679 ?auto_460682 ) ) ( not ( = ?auto_460679 ?auto_460683 ) ) ( not ( = ?auto_460679 ?auto_460684 ) ) ( not ( = ?auto_460679 ?auto_460685 ) ) ( not ( = ?auto_460679 ?auto_460686 ) ) ( not ( = ?auto_460679 ?auto_460687 ) ) ( not ( = ?auto_460680 ?auto_460681 ) ) ( not ( = ?auto_460680 ?auto_460682 ) ) ( not ( = ?auto_460680 ?auto_460683 ) ) ( not ( = ?auto_460680 ?auto_460684 ) ) ( not ( = ?auto_460680 ?auto_460685 ) ) ( not ( = ?auto_460680 ?auto_460686 ) ) ( not ( = ?auto_460680 ?auto_460687 ) ) ( not ( = ?auto_460681 ?auto_460682 ) ) ( not ( = ?auto_460681 ?auto_460683 ) ) ( not ( = ?auto_460681 ?auto_460684 ) ) ( not ( = ?auto_460681 ?auto_460685 ) ) ( not ( = ?auto_460681 ?auto_460686 ) ) ( not ( = ?auto_460681 ?auto_460687 ) ) ( not ( = ?auto_460682 ?auto_460683 ) ) ( not ( = ?auto_460682 ?auto_460684 ) ) ( not ( = ?auto_460682 ?auto_460685 ) ) ( not ( = ?auto_460682 ?auto_460686 ) ) ( not ( = ?auto_460682 ?auto_460687 ) ) ( not ( = ?auto_460683 ?auto_460684 ) ) ( not ( = ?auto_460683 ?auto_460685 ) ) ( not ( = ?auto_460683 ?auto_460686 ) ) ( not ( = ?auto_460683 ?auto_460687 ) ) ( not ( = ?auto_460684 ?auto_460685 ) ) ( not ( = ?auto_460684 ?auto_460686 ) ) ( not ( = ?auto_460684 ?auto_460687 ) ) ( not ( = ?auto_460685 ?auto_460686 ) ) ( not ( = ?auto_460685 ?auto_460687 ) ) ( not ( = ?auto_460686 ?auto_460687 ) ) ( CLEAR ?auto_460684 ) ( ON ?auto_460685 ?auto_460686 ) ( CLEAR ?auto_460685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_460678 ?auto_460679 ?auto_460680 ?auto_460681 ?auto_460682 ?auto_460683 ?auto_460684 ?auto_460685 )
      ( MAKE-9PILE ?auto_460678 ?auto_460679 ?auto_460680 ?auto_460681 ?auto_460682 ?auto_460683 ?auto_460684 ?auto_460685 ?auto_460686 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460697 - BLOCK
      ?auto_460698 - BLOCK
      ?auto_460699 - BLOCK
      ?auto_460700 - BLOCK
      ?auto_460701 - BLOCK
      ?auto_460702 - BLOCK
      ?auto_460703 - BLOCK
      ?auto_460704 - BLOCK
      ?auto_460705 - BLOCK
    )
    :vars
    (
      ?auto_460706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460705 ?auto_460706 ) ( ON-TABLE ?auto_460697 ) ( ON ?auto_460698 ?auto_460697 ) ( ON ?auto_460699 ?auto_460698 ) ( ON ?auto_460700 ?auto_460699 ) ( ON ?auto_460701 ?auto_460700 ) ( ON ?auto_460702 ?auto_460701 ) ( not ( = ?auto_460697 ?auto_460698 ) ) ( not ( = ?auto_460697 ?auto_460699 ) ) ( not ( = ?auto_460697 ?auto_460700 ) ) ( not ( = ?auto_460697 ?auto_460701 ) ) ( not ( = ?auto_460697 ?auto_460702 ) ) ( not ( = ?auto_460697 ?auto_460703 ) ) ( not ( = ?auto_460697 ?auto_460704 ) ) ( not ( = ?auto_460697 ?auto_460705 ) ) ( not ( = ?auto_460697 ?auto_460706 ) ) ( not ( = ?auto_460698 ?auto_460699 ) ) ( not ( = ?auto_460698 ?auto_460700 ) ) ( not ( = ?auto_460698 ?auto_460701 ) ) ( not ( = ?auto_460698 ?auto_460702 ) ) ( not ( = ?auto_460698 ?auto_460703 ) ) ( not ( = ?auto_460698 ?auto_460704 ) ) ( not ( = ?auto_460698 ?auto_460705 ) ) ( not ( = ?auto_460698 ?auto_460706 ) ) ( not ( = ?auto_460699 ?auto_460700 ) ) ( not ( = ?auto_460699 ?auto_460701 ) ) ( not ( = ?auto_460699 ?auto_460702 ) ) ( not ( = ?auto_460699 ?auto_460703 ) ) ( not ( = ?auto_460699 ?auto_460704 ) ) ( not ( = ?auto_460699 ?auto_460705 ) ) ( not ( = ?auto_460699 ?auto_460706 ) ) ( not ( = ?auto_460700 ?auto_460701 ) ) ( not ( = ?auto_460700 ?auto_460702 ) ) ( not ( = ?auto_460700 ?auto_460703 ) ) ( not ( = ?auto_460700 ?auto_460704 ) ) ( not ( = ?auto_460700 ?auto_460705 ) ) ( not ( = ?auto_460700 ?auto_460706 ) ) ( not ( = ?auto_460701 ?auto_460702 ) ) ( not ( = ?auto_460701 ?auto_460703 ) ) ( not ( = ?auto_460701 ?auto_460704 ) ) ( not ( = ?auto_460701 ?auto_460705 ) ) ( not ( = ?auto_460701 ?auto_460706 ) ) ( not ( = ?auto_460702 ?auto_460703 ) ) ( not ( = ?auto_460702 ?auto_460704 ) ) ( not ( = ?auto_460702 ?auto_460705 ) ) ( not ( = ?auto_460702 ?auto_460706 ) ) ( not ( = ?auto_460703 ?auto_460704 ) ) ( not ( = ?auto_460703 ?auto_460705 ) ) ( not ( = ?auto_460703 ?auto_460706 ) ) ( not ( = ?auto_460704 ?auto_460705 ) ) ( not ( = ?auto_460704 ?auto_460706 ) ) ( not ( = ?auto_460705 ?auto_460706 ) ) ( ON ?auto_460704 ?auto_460705 ) ( CLEAR ?auto_460702 ) ( ON ?auto_460703 ?auto_460704 ) ( CLEAR ?auto_460703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_460697 ?auto_460698 ?auto_460699 ?auto_460700 ?auto_460701 ?auto_460702 ?auto_460703 )
      ( MAKE-9PILE ?auto_460697 ?auto_460698 ?auto_460699 ?auto_460700 ?auto_460701 ?auto_460702 ?auto_460703 ?auto_460704 ?auto_460705 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460716 - BLOCK
      ?auto_460717 - BLOCK
      ?auto_460718 - BLOCK
      ?auto_460719 - BLOCK
      ?auto_460720 - BLOCK
      ?auto_460721 - BLOCK
      ?auto_460722 - BLOCK
      ?auto_460723 - BLOCK
      ?auto_460724 - BLOCK
    )
    :vars
    (
      ?auto_460725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460724 ?auto_460725 ) ( ON-TABLE ?auto_460716 ) ( ON ?auto_460717 ?auto_460716 ) ( ON ?auto_460718 ?auto_460717 ) ( ON ?auto_460719 ?auto_460718 ) ( ON ?auto_460720 ?auto_460719 ) ( ON ?auto_460721 ?auto_460720 ) ( not ( = ?auto_460716 ?auto_460717 ) ) ( not ( = ?auto_460716 ?auto_460718 ) ) ( not ( = ?auto_460716 ?auto_460719 ) ) ( not ( = ?auto_460716 ?auto_460720 ) ) ( not ( = ?auto_460716 ?auto_460721 ) ) ( not ( = ?auto_460716 ?auto_460722 ) ) ( not ( = ?auto_460716 ?auto_460723 ) ) ( not ( = ?auto_460716 ?auto_460724 ) ) ( not ( = ?auto_460716 ?auto_460725 ) ) ( not ( = ?auto_460717 ?auto_460718 ) ) ( not ( = ?auto_460717 ?auto_460719 ) ) ( not ( = ?auto_460717 ?auto_460720 ) ) ( not ( = ?auto_460717 ?auto_460721 ) ) ( not ( = ?auto_460717 ?auto_460722 ) ) ( not ( = ?auto_460717 ?auto_460723 ) ) ( not ( = ?auto_460717 ?auto_460724 ) ) ( not ( = ?auto_460717 ?auto_460725 ) ) ( not ( = ?auto_460718 ?auto_460719 ) ) ( not ( = ?auto_460718 ?auto_460720 ) ) ( not ( = ?auto_460718 ?auto_460721 ) ) ( not ( = ?auto_460718 ?auto_460722 ) ) ( not ( = ?auto_460718 ?auto_460723 ) ) ( not ( = ?auto_460718 ?auto_460724 ) ) ( not ( = ?auto_460718 ?auto_460725 ) ) ( not ( = ?auto_460719 ?auto_460720 ) ) ( not ( = ?auto_460719 ?auto_460721 ) ) ( not ( = ?auto_460719 ?auto_460722 ) ) ( not ( = ?auto_460719 ?auto_460723 ) ) ( not ( = ?auto_460719 ?auto_460724 ) ) ( not ( = ?auto_460719 ?auto_460725 ) ) ( not ( = ?auto_460720 ?auto_460721 ) ) ( not ( = ?auto_460720 ?auto_460722 ) ) ( not ( = ?auto_460720 ?auto_460723 ) ) ( not ( = ?auto_460720 ?auto_460724 ) ) ( not ( = ?auto_460720 ?auto_460725 ) ) ( not ( = ?auto_460721 ?auto_460722 ) ) ( not ( = ?auto_460721 ?auto_460723 ) ) ( not ( = ?auto_460721 ?auto_460724 ) ) ( not ( = ?auto_460721 ?auto_460725 ) ) ( not ( = ?auto_460722 ?auto_460723 ) ) ( not ( = ?auto_460722 ?auto_460724 ) ) ( not ( = ?auto_460722 ?auto_460725 ) ) ( not ( = ?auto_460723 ?auto_460724 ) ) ( not ( = ?auto_460723 ?auto_460725 ) ) ( not ( = ?auto_460724 ?auto_460725 ) ) ( ON ?auto_460723 ?auto_460724 ) ( CLEAR ?auto_460721 ) ( ON ?auto_460722 ?auto_460723 ) ( CLEAR ?auto_460722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_460716 ?auto_460717 ?auto_460718 ?auto_460719 ?auto_460720 ?auto_460721 ?auto_460722 )
      ( MAKE-9PILE ?auto_460716 ?auto_460717 ?auto_460718 ?auto_460719 ?auto_460720 ?auto_460721 ?auto_460722 ?auto_460723 ?auto_460724 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460735 - BLOCK
      ?auto_460736 - BLOCK
      ?auto_460737 - BLOCK
      ?auto_460738 - BLOCK
      ?auto_460739 - BLOCK
      ?auto_460740 - BLOCK
      ?auto_460741 - BLOCK
      ?auto_460742 - BLOCK
      ?auto_460743 - BLOCK
    )
    :vars
    (
      ?auto_460744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460743 ?auto_460744 ) ( ON-TABLE ?auto_460735 ) ( ON ?auto_460736 ?auto_460735 ) ( ON ?auto_460737 ?auto_460736 ) ( ON ?auto_460738 ?auto_460737 ) ( ON ?auto_460739 ?auto_460738 ) ( not ( = ?auto_460735 ?auto_460736 ) ) ( not ( = ?auto_460735 ?auto_460737 ) ) ( not ( = ?auto_460735 ?auto_460738 ) ) ( not ( = ?auto_460735 ?auto_460739 ) ) ( not ( = ?auto_460735 ?auto_460740 ) ) ( not ( = ?auto_460735 ?auto_460741 ) ) ( not ( = ?auto_460735 ?auto_460742 ) ) ( not ( = ?auto_460735 ?auto_460743 ) ) ( not ( = ?auto_460735 ?auto_460744 ) ) ( not ( = ?auto_460736 ?auto_460737 ) ) ( not ( = ?auto_460736 ?auto_460738 ) ) ( not ( = ?auto_460736 ?auto_460739 ) ) ( not ( = ?auto_460736 ?auto_460740 ) ) ( not ( = ?auto_460736 ?auto_460741 ) ) ( not ( = ?auto_460736 ?auto_460742 ) ) ( not ( = ?auto_460736 ?auto_460743 ) ) ( not ( = ?auto_460736 ?auto_460744 ) ) ( not ( = ?auto_460737 ?auto_460738 ) ) ( not ( = ?auto_460737 ?auto_460739 ) ) ( not ( = ?auto_460737 ?auto_460740 ) ) ( not ( = ?auto_460737 ?auto_460741 ) ) ( not ( = ?auto_460737 ?auto_460742 ) ) ( not ( = ?auto_460737 ?auto_460743 ) ) ( not ( = ?auto_460737 ?auto_460744 ) ) ( not ( = ?auto_460738 ?auto_460739 ) ) ( not ( = ?auto_460738 ?auto_460740 ) ) ( not ( = ?auto_460738 ?auto_460741 ) ) ( not ( = ?auto_460738 ?auto_460742 ) ) ( not ( = ?auto_460738 ?auto_460743 ) ) ( not ( = ?auto_460738 ?auto_460744 ) ) ( not ( = ?auto_460739 ?auto_460740 ) ) ( not ( = ?auto_460739 ?auto_460741 ) ) ( not ( = ?auto_460739 ?auto_460742 ) ) ( not ( = ?auto_460739 ?auto_460743 ) ) ( not ( = ?auto_460739 ?auto_460744 ) ) ( not ( = ?auto_460740 ?auto_460741 ) ) ( not ( = ?auto_460740 ?auto_460742 ) ) ( not ( = ?auto_460740 ?auto_460743 ) ) ( not ( = ?auto_460740 ?auto_460744 ) ) ( not ( = ?auto_460741 ?auto_460742 ) ) ( not ( = ?auto_460741 ?auto_460743 ) ) ( not ( = ?auto_460741 ?auto_460744 ) ) ( not ( = ?auto_460742 ?auto_460743 ) ) ( not ( = ?auto_460742 ?auto_460744 ) ) ( not ( = ?auto_460743 ?auto_460744 ) ) ( ON ?auto_460742 ?auto_460743 ) ( ON ?auto_460741 ?auto_460742 ) ( CLEAR ?auto_460739 ) ( ON ?auto_460740 ?auto_460741 ) ( CLEAR ?auto_460740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_460735 ?auto_460736 ?auto_460737 ?auto_460738 ?auto_460739 ?auto_460740 )
      ( MAKE-9PILE ?auto_460735 ?auto_460736 ?auto_460737 ?auto_460738 ?auto_460739 ?auto_460740 ?auto_460741 ?auto_460742 ?auto_460743 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460754 - BLOCK
      ?auto_460755 - BLOCK
      ?auto_460756 - BLOCK
      ?auto_460757 - BLOCK
      ?auto_460758 - BLOCK
      ?auto_460759 - BLOCK
      ?auto_460760 - BLOCK
      ?auto_460761 - BLOCK
      ?auto_460762 - BLOCK
    )
    :vars
    (
      ?auto_460763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460762 ?auto_460763 ) ( ON-TABLE ?auto_460754 ) ( ON ?auto_460755 ?auto_460754 ) ( ON ?auto_460756 ?auto_460755 ) ( ON ?auto_460757 ?auto_460756 ) ( ON ?auto_460758 ?auto_460757 ) ( not ( = ?auto_460754 ?auto_460755 ) ) ( not ( = ?auto_460754 ?auto_460756 ) ) ( not ( = ?auto_460754 ?auto_460757 ) ) ( not ( = ?auto_460754 ?auto_460758 ) ) ( not ( = ?auto_460754 ?auto_460759 ) ) ( not ( = ?auto_460754 ?auto_460760 ) ) ( not ( = ?auto_460754 ?auto_460761 ) ) ( not ( = ?auto_460754 ?auto_460762 ) ) ( not ( = ?auto_460754 ?auto_460763 ) ) ( not ( = ?auto_460755 ?auto_460756 ) ) ( not ( = ?auto_460755 ?auto_460757 ) ) ( not ( = ?auto_460755 ?auto_460758 ) ) ( not ( = ?auto_460755 ?auto_460759 ) ) ( not ( = ?auto_460755 ?auto_460760 ) ) ( not ( = ?auto_460755 ?auto_460761 ) ) ( not ( = ?auto_460755 ?auto_460762 ) ) ( not ( = ?auto_460755 ?auto_460763 ) ) ( not ( = ?auto_460756 ?auto_460757 ) ) ( not ( = ?auto_460756 ?auto_460758 ) ) ( not ( = ?auto_460756 ?auto_460759 ) ) ( not ( = ?auto_460756 ?auto_460760 ) ) ( not ( = ?auto_460756 ?auto_460761 ) ) ( not ( = ?auto_460756 ?auto_460762 ) ) ( not ( = ?auto_460756 ?auto_460763 ) ) ( not ( = ?auto_460757 ?auto_460758 ) ) ( not ( = ?auto_460757 ?auto_460759 ) ) ( not ( = ?auto_460757 ?auto_460760 ) ) ( not ( = ?auto_460757 ?auto_460761 ) ) ( not ( = ?auto_460757 ?auto_460762 ) ) ( not ( = ?auto_460757 ?auto_460763 ) ) ( not ( = ?auto_460758 ?auto_460759 ) ) ( not ( = ?auto_460758 ?auto_460760 ) ) ( not ( = ?auto_460758 ?auto_460761 ) ) ( not ( = ?auto_460758 ?auto_460762 ) ) ( not ( = ?auto_460758 ?auto_460763 ) ) ( not ( = ?auto_460759 ?auto_460760 ) ) ( not ( = ?auto_460759 ?auto_460761 ) ) ( not ( = ?auto_460759 ?auto_460762 ) ) ( not ( = ?auto_460759 ?auto_460763 ) ) ( not ( = ?auto_460760 ?auto_460761 ) ) ( not ( = ?auto_460760 ?auto_460762 ) ) ( not ( = ?auto_460760 ?auto_460763 ) ) ( not ( = ?auto_460761 ?auto_460762 ) ) ( not ( = ?auto_460761 ?auto_460763 ) ) ( not ( = ?auto_460762 ?auto_460763 ) ) ( ON ?auto_460761 ?auto_460762 ) ( ON ?auto_460760 ?auto_460761 ) ( CLEAR ?auto_460758 ) ( ON ?auto_460759 ?auto_460760 ) ( CLEAR ?auto_460759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_460754 ?auto_460755 ?auto_460756 ?auto_460757 ?auto_460758 ?auto_460759 )
      ( MAKE-9PILE ?auto_460754 ?auto_460755 ?auto_460756 ?auto_460757 ?auto_460758 ?auto_460759 ?auto_460760 ?auto_460761 ?auto_460762 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460773 - BLOCK
      ?auto_460774 - BLOCK
      ?auto_460775 - BLOCK
      ?auto_460776 - BLOCK
      ?auto_460777 - BLOCK
      ?auto_460778 - BLOCK
      ?auto_460779 - BLOCK
      ?auto_460780 - BLOCK
      ?auto_460781 - BLOCK
    )
    :vars
    (
      ?auto_460782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460781 ?auto_460782 ) ( ON-TABLE ?auto_460773 ) ( ON ?auto_460774 ?auto_460773 ) ( ON ?auto_460775 ?auto_460774 ) ( ON ?auto_460776 ?auto_460775 ) ( not ( = ?auto_460773 ?auto_460774 ) ) ( not ( = ?auto_460773 ?auto_460775 ) ) ( not ( = ?auto_460773 ?auto_460776 ) ) ( not ( = ?auto_460773 ?auto_460777 ) ) ( not ( = ?auto_460773 ?auto_460778 ) ) ( not ( = ?auto_460773 ?auto_460779 ) ) ( not ( = ?auto_460773 ?auto_460780 ) ) ( not ( = ?auto_460773 ?auto_460781 ) ) ( not ( = ?auto_460773 ?auto_460782 ) ) ( not ( = ?auto_460774 ?auto_460775 ) ) ( not ( = ?auto_460774 ?auto_460776 ) ) ( not ( = ?auto_460774 ?auto_460777 ) ) ( not ( = ?auto_460774 ?auto_460778 ) ) ( not ( = ?auto_460774 ?auto_460779 ) ) ( not ( = ?auto_460774 ?auto_460780 ) ) ( not ( = ?auto_460774 ?auto_460781 ) ) ( not ( = ?auto_460774 ?auto_460782 ) ) ( not ( = ?auto_460775 ?auto_460776 ) ) ( not ( = ?auto_460775 ?auto_460777 ) ) ( not ( = ?auto_460775 ?auto_460778 ) ) ( not ( = ?auto_460775 ?auto_460779 ) ) ( not ( = ?auto_460775 ?auto_460780 ) ) ( not ( = ?auto_460775 ?auto_460781 ) ) ( not ( = ?auto_460775 ?auto_460782 ) ) ( not ( = ?auto_460776 ?auto_460777 ) ) ( not ( = ?auto_460776 ?auto_460778 ) ) ( not ( = ?auto_460776 ?auto_460779 ) ) ( not ( = ?auto_460776 ?auto_460780 ) ) ( not ( = ?auto_460776 ?auto_460781 ) ) ( not ( = ?auto_460776 ?auto_460782 ) ) ( not ( = ?auto_460777 ?auto_460778 ) ) ( not ( = ?auto_460777 ?auto_460779 ) ) ( not ( = ?auto_460777 ?auto_460780 ) ) ( not ( = ?auto_460777 ?auto_460781 ) ) ( not ( = ?auto_460777 ?auto_460782 ) ) ( not ( = ?auto_460778 ?auto_460779 ) ) ( not ( = ?auto_460778 ?auto_460780 ) ) ( not ( = ?auto_460778 ?auto_460781 ) ) ( not ( = ?auto_460778 ?auto_460782 ) ) ( not ( = ?auto_460779 ?auto_460780 ) ) ( not ( = ?auto_460779 ?auto_460781 ) ) ( not ( = ?auto_460779 ?auto_460782 ) ) ( not ( = ?auto_460780 ?auto_460781 ) ) ( not ( = ?auto_460780 ?auto_460782 ) ) ( not ( = ?auto_460781 ?auto_460782 ) ) ( ON ?auto_460780 ?auto_460781 ) ( ON ?auto_460779 ?auto_460780 ) ( ON ?auto_460778 ?auto_460779 ) ( CLEAR ?auto_460776 ) ( ON ?auto_460777 ?auto_460778 ) ( CLEAR ?auto_460777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_460773 ?auto_460774 ?auto_460775 ?auto_460776 ?auto_460777 )
      ( MAKE-9PILE ?auto_460773 ?auto_460774 ?auto_460775 ?auto_460776 ?auto_460777 ?auto_460778 ?auto_460779 ?auto_460780 ?auto_460781 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460792 - BLOCK
      ?auto_460793 - BLOCK
      ?auto_460794 - BLOCK
      ?auto_460795 - BLOCK
      ?auto_460796 - BLOCK
      ?auto_460797 - BLOCK
      ?auto_460798 - BLOCK
      ?auto_460799 - BLOCK
      ?auto_460800 - BLOCK
    )
    :vars
    (
      ?auto_460801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460800 ?auto_460801 ) ( ON-TABLE ?auto_460792 ) ( ON ?auto_460793 ?auto_460792 ) ( ON ?auto_460794 ?auto_460793 ) ( ON ?auto_460795 ?auto_460794 ) ( not ( = ?auto_460792 ?auto_460793 ) ) ( not ( = ?auto_460792 ?auto_460794 ) ) ( not ( = ?auto_460792 ?auto_460795 ) ) ( not ( = ?auto_460792 ?auto_460796 ) ) ( not ( = ?auto_460792 ?auto_460797 ) ) ( not ( = ?auto_460792 ?auto_460798 ) ) ( not ( = ?auto_460792 ?auto_460799 ) ) ( not ( = ?auto_460792 ?auto_460800 ) ) ( not ( = ?auto_460792 ?auto_460801 ) ) ( not ( = ?auto_460793 ?auto_460794 ) ) ( not ( = ?auto_460793 ?auto_460795 ) ) ( not ( = ?auto_460793 ?auto_460796 ) ) ( not ( = ?auto_460793 ?auto_460797 ) ) ( not ( = ?auto_460793 ?auto_460798 ) ) ( not ( = ?auto_460793 ?auto_460799 ) ) ( not ( = ?auto_460793 ?auto_460800 ) ) ( not ( = ?auto_460793 ?auto_460801 ) ) ( not ( = ?auto_460794 ?auto_460795 ) ) ( not ( = ?auto_460794 ?auto_460796 ) ) ( not ( = ?auto_460794 ?auto_460797 ) ) ( not ( = ?auto_460794 ?auto_460798 ) ) ( not ( = ?auto_460794 ?auto_460799 ) ) ( not ( = ?auto_460794 ?auto_460800 ) ) ( not ( = ?auto_460794 ?auto_460801 ) ) ( not ( = ?auto_460795 ?auto_460796 ) ) ( not ( = ?auto_460795 ?auto_460797 ) ) ( not ( = ?auto_460795 ?auto_460798 ) ) ( not ( = ?auto_460795 ?auto_460799 ) ) ( not ( = ?auto_460795 ?auto_460800 ) ) ( not ( = ?auto_460795 ?auto_460801 ) ) ( not ( = ?auto_460796 ?auto_460797 ) ) ( not ( = ?auto_460796 ?auto_460798 ) ) ( not ( = ?auto_460796 ?auto_460799 ) ) ( not ( = ?auto_460796 ?auto_460800 ) ) ( not ( = ?auto_460796 ?auto_460801 ) ) ( not ( = ?auto_460797 ?auto_460798 ) ) ( not ( = ?auto_460797 ?auto_460799 ) ) ( not ( = ?auto_460797 ?auto_460800 ) ) ( not ( = ?auto_460797 ?auto_460801 ) ) ( not ( = ?auto_460798 ?auto_460799 ) ) ( not ( = ?auto_460798 ?auto_460800 ) ) ( not ( = ?auto_460798 ?auto_460801 ) ) ( not ( = ?auto_460799 ?auto_460800 ) ) ( not ( = ?auto_460799 ?auto_460801 ) ) ( not ( = ?auto_460800 ?auto_460801 ) ) ( ON ?auto_460799 ?auto_460800 ) ( ON ?auto_460798 ?auto_460799 ) ( ON ?auto_460797 ?auto_460798 ) ( CLEAR ?auto_460795 ) ( ON ?auto_460796 ?auto_460797 ) ( CLEAR ?auto_460796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_460792 ?auto_460793 ?auto_460794 ?auto_460795 ?auto_460796 )
      ( MAKE-9PILE ?auto_460792 ?auto_460793 ?auto_460794 ?auto_460795 ?auto_460796 ?auto_460797 ?auto_460798 ?auto_460799 ?auto_460800 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460811 - BLOCK
      ?auto_460812 - BLOCK
      ?auto_460813 - BLOCK
      ?auto_460814 - BLOCK
      ?auto_460815 - BLOCK
      ?auto_460816 - BLOCK
      ?auto_460817 - BLOCK
      ?auto_460818 - BLOCK
      ?auto_460819 - BLOCK
    )
    :vars
    (
      ?auto_460820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460819 ?auto_460820 ) ( ON-TABLE ?auto_460811 ) ( ON ?auto_460812 ?auto_460811 ) ( ON ?auto_460813 ?auto_460812 ) ( not ( = ?auto_460811 ?auto_460812 ) ) ( not ( = ?auto_460811 ?auto_460813 ) ) ( not ( = ?auto_460811 ?auto_460814 ) ) ( not ( = ?auto_460811 ?auto_460815 ) ) ( not ( = ?auto_460811 ?auto_460816 ) ) ( not ( = ?auto_460811 ?auto_460817 ) ) ( not ( = ?auto_460811 ?auto_460818 ) ) ( not ( = ?auto_460811 ?auto_460819 ) ) ( not ( = ?auto_460811 ?auto_460820 ) ) ( not ( = ?auto_460812 ?auto_460813 ) ) ( not ( = ?auto_460812 ?auto_460814 ) ) ( not ( = ?auto_460812 ?auto_460815 ) ) ( not ( = ?auto_460812 ?auto_460816 ) ) ( not ( = ?auto_460812 ?auto_460817 ) ) ( not ( = ?auto_460812 ?auto_460818 ) ) ( not ( = ?auto_460812 ?auto_460819 ) ) ( not ( = ?auto_460812 ?auto_460820 ) ) ( not ( = ?auto_460813 ?auto_460814 ) ) ( not ( = ?auto_460813 ?auto_460815 ) ) ( not ( = ?auto_460813 ?auto_460816 ) ) ( not ( = ?auto_460813 ?auto_460817 ) ) ( not ( = ?auto_460813 ?auto_460818 ) ) ( not ( = ?auto_460813 ?auto_460819 ) ) ( not ( = ?auto_460813 ?auto_460820 ) ) ( not ( = ?auto_460814 ?auto_460815 ) ) ( not ( = ?auto_460814 ?auto_460816 ) ) ( not ( = ?auto_460814 ?auto_460817 ) ) ( not ( = ?auto_460814 ?auto_460818 ) ) ( not ( = ?auto_460814 ?auto_460819 ) ) ( not ( = ?auto_460814 ?auto_460820 ) ) ( not ( = ?auto_460815 ?auto_460816 ) ) ( not ( = ?auto_460815 ?auto_460817 ) ) ( not ( = ?auto_460815 ?auto_460818 ) ) ( not ( = ?auto_460815 ?auto_460819 ) ) ( not ( = ?auto_460815 ?auto_460820 ) ) ( not ( = ?auto_460816 ?auto_460817 ) ) ( not ( = ?auto_460816 ?auto_460818 ) ) ( not ( = ?auto_460816 ?auto_460819 ) ) ( not ( = ?auto_460816 ?auto_460820 ) ) ( not ( = ?auto_460817 ?auto_460818 ) ) ( not ( = ?auto_460817 ?auto_460819 ) ) ( not ( = ?auto_460817 ?auto_460820 ) ) ( not ( = ?auto_460818 ?auto_460819 ) ) ( not ( = ?auto_460818 ?auto_460820 ) ) ( not ( = ?auto_460819 ?auto_460820 ) ) ( ON ?auto_460818 ?auto_460819 ) ( ON ?auto_460817 ?auto_460818 ) ( ON ?auto_460816 ?auto_460817 ) ( ON ?auto_460815 ?auto_460816 ) ( CLEAR ?auto_460813 ) ( ON ?auto_460814 ?auto_460815 ) ( CLEAR ?auto_460814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_460811 ?auto_460812 ?auto_460813 ?auto_460814 )
      ( MAKE-9PILE ?auto_460811 ?auto_460812 ?auto_460813 ?auto_460814 ?auto_460815 ?auto_460816 ?auto_460817 ?auto_460818 ?auto_460819 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460830 - BLOCK
      ?auto_460831 - BLOCK
      ?auto_460832 - BLOCK
      ?auto_460833 - BLOCK
      ?auto_460834 - BLOCK
      ?auto_460835 - BLOCK
      ?auto_460836 - BLOCK
      ?auto_460837 - BLOCK
      ?auto_460838 - BLOCK
    )
    :vars
    (
      ?auto_460839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460838 ?auto_460839 ) ( ON-TABLE ?auto_460830 ) ( ON ?auto_460831 ?auto_460830 ) ( ON ?auto_460832 ?auto_460831 ) ( not ( = ?auto_460830 ?auto_460831 ) ) ( not ( = ?auto_460830 ?auto_460832 ) ) ( not ( = ?auto_460830 ?auto_460833 ) ) ( not ( = ?auto_460830 ?auto_460834 ) ) ( not ( = ?auto_460830 ?auto_460835 ) ) ( not ( = ?auto_460830 ?auto_460836 ) ) ( not ( = ?auto_460830 ?auto_460837 ) ) ( not ( = ?auto_460830 ?auto_460838 ) ) ( not ( = ?auto_460830 ?auto_460839 ) ) ( not ( = ?auto_460831 ?auto_460832 ) ) ( not ( = ?auto_460831 ?auto_460833 ) ) ( not ( = ?auto_460831 ?auto_460834 ) ) ( not ( = ?auto_460831 ?auto_460835 ) ) ( not ( = ?auto_460831 ?auto_460836 ) ) ( not ( = ?auto_460831 ?auto_460837 ) ) ( not ( = ?auto_460831 ?auto_460838 ) ) ( not ( = ?auto_460831 ?auto_460839 ) ) ( not ( = ?auto_460832 ?auto_460833 ) ) ( not ( = ?auto_460832 ?auto_460834 ) ) ( not ( = ?auto_460832 ?auto_460835 ) ) ( not ( = ?auto_460832 ?auto_460836 ) ) ( not ( = ?auto_460832 ?auto_460837 ) ) ( not ( = ?auto_460832 ?auto_460838 ) ) ( not ( = ?auto_460832 ?auto_460839 ) ) ( not ( = ?auto_460833 ?auto_460834 ) ) ( not ( = ?auto_460833 ?auto_460835 ) ) ( not ( = ?auto_460833 ?auto_460836 ) ) ( not ( = ?auto_460833 ?auto_460837 ) ) ( not ( = ?auto_460833 ?auto_460838 ) ) ( not ( = ?auto_460833 ?auto_460839 ) ) ( not ( = ?auto_460834 ?auto_460835 ) ) ( not ( = ?auto_460834 ?auto_460836 ) ) ( not ( = ?auto_460834 ?auto_460837 ) ) ( not ( = ?auto_460834 ?auto_460838 ) ) ( not ( = ?auto_460834 ?auto_460839 ) ) ( not ( = ?auto_460835 ?auto_460836 ) ) ( not ( = ?auto_460835 ?auto_460837 ) ) ( not ( = ?auto_460835 ?auto_460838 ) ) ( not ( = ?auto_460835 ?auto_460839 ) ) ( not ( = ?auto_460836 ?auto_460837 ) ) ( not ( = ?auto_460836 ?auto_460838 ) ) ( not ( = ?auto_460836 ?auto_460839 ) ) ( not ( = ?auto_460837 ?auto_460838 ) ) ( not ( = ?auto_460837 ?auto_460839 ) ) ( not ( = ?auto_460838 ?auto_460839 ) ) ( ON ?auto_460837 ?auto_460838 ) ( ON ?auto_460836 ?auto_460837 ) ( ON ?auto_460835 ?auto_460836 ) ( ON ?auto_460834 ?auto_460835 ) ( CLEAR ?auto_460832 ) ( ON ?auto_460833 ?auto_460834 ) ( CLEAR ?auto_460833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_460830 ?auto_460831 ?auto_460832 ?auto_460833 )
      ( MAKE-9PILE ?auto_460830 ?auto_460831 ?auto_460832 ?auto_460833 ?auto_460834 ?auto_460835 ?auto_460836 ?auto_460837 ?auto_460838 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460849 - BLOCK
      ?auto_460850 - BLOCK
      ?auto_460851 - BLOCK
      ?auto_460852 - BLOCK
      ?auto_460853 - BLOCK
      ?auto_460854 - BLOCK
      ?auto_460855 - BLOCK
      ?auto_460856 - BLOCK
      ?auto_460857 - BLOCK
    )
    :vars
    (
      ?auto_460858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460857 ?auto_460858 ) ( ON-TABLE ?auto_460849 ) ( ON ?auto_460850 ?auto_460849 ) ( not ( = ?auto_460849 ?auto_460850 ) ) ( not ( = ?auto_460849 ?auto_460851 ) ) ( not ( = ?auto_460849 ?auto_460852 ) ) ( not ( = ?auto_460849 ?auto_460853 ) ) ( not ( = ?auto_460849 ?auto_460854 ) ) ( not ( = ?auto_460849 ?auto_460855 ) ) ( not ( = ?auto_460849 ?auto_460856 ) ) ( not ( = ?auto_460849 ?auto_460857 ) ) ( not ( = ?auto_460849 ?auto_460858 ) ) ( not ( = ?auto_460850 ?auto_460851 ) ) ( not ( = ?auto_460850 ?auto_460852 ) ) ( not ( = ?auto_460850 ?auto_460853 ) ) ( not ( = ?auto_460850 ?auto_460854 ) ) ( not ( = ?auto_460850 ?auto_460855 ) ) ( not ( = ?auto_460850 ?auto_460856 ) ) ( not ( = ?auto_460850 ?auto_460857 ) ) ( not ( = ?auto_460850 ?auto_460858 ) ) ( not ( = ?auto_460851 ?auto_460852 ) ) ( not ( = ?auto_460851 ?auto_460853 ) ) ( not ( = ?auto_460851 ?auto_460854 ) ) ( not ( = ?auto_460851 ?auto_460855 ) ) ( not ( = ?auto_460851 ?auto_460856 ) ) ( not ( = ?auto_460851 ?auto_460857 ) ) ( not ( = ?auto_460851 ?auto_460858 ) ) ( not ( = ?auto_460852 ?auto_460853 ) ) ( not ( = ?auto_460852 ?auto_460854 ) ) ( not ( = ?auto_460852 ?auto_460855 ) ) ( not ( = ?auto_460852 ?auto_460856 ) ) ( not ( = ?auto_460852 ?auto_460857 ) ) ( not ( = ?auto_460852 ?auto_460858 ) ) ( not ( = ?auto_460853 ?auto_460854 ) ) ( not ( = ?auto_460853 ?auto_460855 ) ) ( not ( = ?auto_460853 ?auto_460856 ) ) ( not ( = ?auto_460853 ?auto_460857 ) ) ( not ( = ?auto_460853 ?auto_460858 ) ) ( not ( = ?auto_460854 ?auto_460855 ) ) ( not ( = ?auto_460854 ?auto_460856 ) ) ( not ( = ?auto_460854 ?auto_460857 ) ) ( not ( = ?auto_460854 ?auto_460858 ) ) ( not ( = ?auto_460855 ?auto_460856 ) ) ( not ( = ?auto_460855 ?auto_460857 ) ) ( not ( = ?auto_460855 ?auto_460858 ) ) ( not ( = ?auto_460856 ?auto_460857 ) ) ( not ( = ?auto_460856 ?auto_460858 ) ) ( not ( = ?auto_460857 ?auto_460858 ) ) ( ON ?auto_460856 ?auto_460857 ) ( ON ?auto_460855 ?auto_460856 ) ( ON ?auto_460854 ?auto_460855 ) ( ON ?auto_460853 ?auto_460854 ) ( ON ?auto_460852 ?auto_460853 ) ( CLEAR ?auto_460850 ) ( ON ?auto_460851 ?auto_460852 ) ( CLEAR ?auto_460851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_460849 ?auto_460850 ?auto_460851 )
      ( MAKE-9PILE ?auto_460849 ?auto_460850 ?auto_460851 ?auto_460852 ?auto_460853 ?auto_460854 ?auto_460855 ?auto_460856 ?auto_460857 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460868 - BLOCK
      ?auto_460869 - BLOCK
      ?auto_460870 - BLOCK
      ?auto_460871 - BLOCK
      ?auto_460872 - BLOCK
      ?auto_460873 - BLOCK
      ?auto_460874 - BLOCK
      ?auto_460875 - BLOCK
      ?auto_460876 - BLOCK
    )
    :vars
    (
      ?auto_460877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460876 ?auto_460877 ) ( ON-TABLE ?auto_460868 ) ( ON ?auto_460869 ?auto_460868 ) ( not ( = ?auto_460868 ?auto_460869 ) ) ( not ( = ?auto_460868 ?auto_460870 ) ) ( not ( = ?auto_460868 ?auto_460871 ) ) ( not ( = ?auto_460868 ?auto_460872 ) ) ( not ( = ?auto_460868 ?auto_460873 ) ) ( not ( = ?auto_460868 ?auto_460874 ) ) ( not ( = ?auto_460868 ?auto_460875 ) ) ( not ( = ?auto_460868 ?auto_460876 ) ) ( not ( = ?auto_460868 ?auto_460877 ) ) ( not ( = ?auto_460869 ?auto_460870 ) ) ( not ( = ?auto_460869 ?auto_460871 ) ) ( not ( = ?auto_460869 ?auto_460872 ) ) ( not ( = ?auto_460869 ?auto_460873 ) ) ( not ( = ?auto_460869 ?auto_460874 ) ) ( not ( = ?auto_460869 ?auto_460875 ) ) ( not ( = ?auto_460869 ?auto_460876 ) ) ( not ( = ?auto_460869 ?auto_460877 ) ) ( not ( = ?auto_460870 ?auto_460871 ) ) ( not ( = ?auto_460870 ?auto_460872 ) ) ( not ( = ?auto_460870 ?auto_460873 ) ) ( not ( = ?auto_460870 ?auto_460874 ) ) ( not ( = ?auto_460870 ?auto_460875 ) ) ( not ( = ?auto_460870 ?auto_460876 ) ) ( not ( = ?auto_460870 ?auto_460877 ) ) ( not ( = ?auto_460871 ?auto_460872 ) ) ( not ( = ?auto_460871 ?auto_460873 ) ) ( not ( = ?auto_460871 ?auto_460874 ) ) ( not ( = ?auto_460871 ?auto_460875 ) ) ( not ( = ?auto_460871 ?auto_460876 ) ) ( not ( = ?auto_460871 ?auto_460877 ) ) ( not ( = ?auto_460872 ?auto_460873 ) ) ( not ( = ?auto_460872 ?auto_460874 ) ) ( not ( = ?auto_460872 ?auto_460875 ) ) ( not ( = ?auto_460872 ?auto_460876 ) ) ( not ( = ?auto_460872 ?auto_460877 ) ) ( not ( = ?auto_460873 ?auto_460874 ) ) ( not ( = ?auto_460873 ?auto_460875 ) ) ( not ( = ?auto_460873 ?auto_460876 ) ) ( not ( = ?auto_460873 ?auto_460877 ) ) ( not ( = ?auto_460874 ?auto_460875 ) ) ( not ( = ?auto_460874 ?auto_460876 ) ) ( not ( = ?auto_460874 ?auto_460877 ) ) ( not ( = ?auto_460875 ?auto_460876 ) ) ( not ( = ?auto_460875 ?auto_460877 ) ) ( not ( = ?auto_460876 ?auto_460877 ) ) ( ON ?auto_460875 ?auto_460876 ) ( ON ?auto_460874 ?auto_460875 ) ( ON ?auto_460873 ?auto_460874 ) ( ON ?auto_460872 ?auto_460873 ) ( ON ?auto_460871 ?auto_460872 ) ( CLEAR ?auto_460869 ) ( ON ?auto_460870 ?auto_460871 ) ( CLEAR ?auto_460870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_460868 ?auto_460869 ?auto_460870 )
      ( MAKE-9PILE ?auto_460868 ?auto_460869 ?auto_460870 ?auto_460871 ?auto_460872 ?auto_460873 ?auto_460874 ?auto_460875 ?auto_460876 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460887 - BLOCK
      ?auto_460888 - BLOCK
      ?auto_460889 - BLOCK
      ?auto_460890 - BLOCK
      ?auto_460891 - BLOCK
      ?auto_460892 - BLOCK
      ?auto_460893 - BLOCK
      ?auto_460894 - BLOCK
      ?auto_460895 - BLOCK
    )
    :vars
    (
      ?auto_460896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460895 ?auto_460896 ) ( ON-TABLE ?auto_460887 ) ( not ( = ?auto_460887 ?auto_460888 ) ) ( not ( = ?auto_460887 ?auto_460889 ) ) ( not ( = ?auto_460887 ?auto_460890 ) ) ( not ( = ?auto_460887 ?auto_460891 ) ) ( not ( = ?auto_460887 ?auto_460892 ) ) ( not ( = ?auto_460887 ?auto_460893 ) ) ( not ( = ?auto_460887 ?auto_460894 ) ) ( not ( = ?auto_460887 ?auto_460895 ) ) ( not ( = ?auto_460887 ?auto_460896 ) ) ( not ( = ?auto_460888 ?auto_460889 ) ) ( not ( = ?auto_460888 ?auto_460890 ) ) ( not ( = ?auto_460888 ?auto_460891 ) ) ( not ( = ?auto_460888 ?auto_460892 ) ) ( not ( = ?auto_460888 ?auto_460893 ) ) ( not ( = ?auto_460888 ?auto_460894 ) ) ( not ( = ?auto_460888 ?auto_460895 ) ) ( not ( = ?auto_460888 ?auto_460896 ) ) ( not ( = ?auto_460889 ?auto_460890 ) ) ( not ( = ?auto_460889 ?auto_460891 ) ) ( not ( = ?auto_460889 ?auto_460892 ) ) ( not ( = ?auto_460889 ?auto_460893 ) ) ( not ( = ?auto_460889 ?auto_460894 ) ) ( not ( = ?auto_460889 ?auto_460895 ) ) ( not ( = ?auto_460889 ?auto_460896 ) ) ( not ( = ?auto_460890 ?auto_460891 ) ) ( not ( = ?auto_460890 ?auto_460892 ) ) ( not ( = ?auto_460890 ?auto_460893 ) ) ( not ( = ?auto_460890 ?auto_460894 ) ) ( not ( = ?auto_460890 ?auto_460895 ) ) ( not ( = ?auto_460890 ?auto_460896 ) ) ( not ( = ?auto_460891 ?auto_460892 ) ) ( not ( = ?auto_460891 ?auto_460893 ) ) ( not ( = ?auto_460891 ?auto_460894 ) ) ( not ( = ?auto_460891 ?auto_460895 ) ) ( not ( = ?auto_460891 ?auto_460896 ) ) ( not ( = ?auto_460892 ?auto_460893 ) ) ( not ( = ?auto_460892 ?auto_460894 ) ) ( not ( = ?auto_460892 ?auto_460895 ) ) ( not ( = ?auto_460892 ?auto_460896 ) ) ( not ( = ?auto_460893 ?auto_460894 ) ) ( not ( = ?auto_460893 ?auto_460895 ) ) ( not ( = ?auto_460893 ?auto_460896 ) ) ( not ( = ?auto_460894 ?auto_460895 ) ) ( not ( = ?auto_460894 ?auto_460896 ) ) ( not ( = ?auto_460895 ?auto_460896 ) ) ( ON ?auto_460894 ?auto_460895 ) ( ON ?auto_460893 ?auto_460894 ) ( ON ?auto_460892 ?auto_460893 ) ( ON ?auto_460891 ?auto_460892 ) ( ON ?auto_460890 ?auto_460891 ) ( ON ?auto_460889 ?auto_460890 ) ( CLEAR ?auto_460887 ) ( ON ?auto_460888 ?auto_460889 ) ( CLEAR ?auto_460888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_460887 ?auto_460888 )
      ( MAKE-9PILE ?auto_460887 ?auto_460888 ?auto_460889 ?auto_460890 ?auto_460891 ?auto_460892 ?auto_460893 ?auto_460894 ?auto_460895 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460906 - BLOCK
      ?auto_460907 - BLOCK
      ?auto_460908 - BLOCK
      ?auto_460909 - BLOCK
      ?auto_460910 - BLOCK
      ?auto_460911 - BLOCK
      ?auto_460912 - BLOCK
      ?auto_460913 - BLOCK
      ?auto_460914 - BLOCK
    )
    :vars
    (
      ?auto_460915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460914 ?auto_460915 ) ( ON-TABLE ?auto_460906 ) ( not ( = ?auto_460906 ?auto_460907 ) ) ( not ( = ?auto_460906 ?auto_460908 ) ) ( not ( = ?auto_460906 ?auto_460909 ) ) ( not ( = ?auto_460906 ?auto_460910 ) ) ( not ( = ?auto_460906 ?auto_460911 ) ) ( not ( = ?auto_460906 ?auto_460912 ) ) ( not ( = ?auto_460906 ?auto_460913 ) ) ( not ( = ?auto_460906 ?auto_460914 ) ) ( not ( = ?auto_460906 ?auto_460915 ) ) ( not ( = ?auto_460907 ?auto_460908 ) ) ( not ( = ?auto_460907 ?auto_460909 ) ) ( not ( = ?auto_460907 ?auto_460910 ) ) ( not ( = ?auto_460907 ?auto_460911 ) ) ( not ( = ?auto_460907 ?auto_460912 ) ) ( not ( = ?auto_460907 ?auto_460913 ) ) ( not ( = ?auto_460907 ?auto_460914 ) ) ( not ( = ?auto_460907 ?auto_460915 ) ) ( not ( = ?auto_460908 ?auto_460909 ) ) ( not ( = ?auto_460908 ?auto_460910 ) ) ( not ( = ?auto_460908 ?auto_460911 ) ) ( not ( = ?auto_460908 ?auto_460912 ) ) ( not ( = ?auto_460908 ?auto_460913 ) ) ( not ( = ?auto_460908 ?auto_460914 ) ) ( not ( = ?auto_460908 ?auto_460915 ) ) ( not ( = ?auto_460909 ?auto_460910 ) ) ( not ( = ?auto_460909 ?auto_460911 ) ) ( not ( = ?auto_460909 ?auto_460912 ) ) ( not ( = ?auto_460909 ?auto_460913 ) ) ( not ( = ?auto_460909 ?auto_460914 ) ) ( not ( = ?auto_460909 ?auto_460915 ) ) ( not ( = ?auto_460910 ?auto_460911 ) ) ( not ( = ?auto_460910 ?auto_460912 ) ) ( not ( = ?auto_460910 ?auto_460913 ) ) ( not ( = ?auto_460910 ?auto_460914 ) ) ( not ( = ?auto_460910 ?auto_460915 ) ) ( not ( = ?auto_460911 ?auto_460912 ) ) ( not ( = ?auto_460911 ?auto_460913 ) ) ( not ( = ?auto_460911 ?auto_460914 ) ) ( not ( = ?auto_460911 ?auto_460915 ) ) ( not ( = ?auto_460912 ?auto_460913 ) ) ( not ( = ?auto_460912 ?auto_460914 ) ) ( not ( = ?auto_460912 ?auto_460915 ) ) ( not ( = ?auto_460913 ?auto_460914 ) ) ( not ( = ?auto_460913 ?auto_460915 ) ) ( not ( = ?auto_460914 ?auto_460915 ) ) ( ON ?auto_460913 ?auto_460914 ) ( ON ?auto_460912 ?auto_460913 ) ( ON ?auto_460911 ?auto_460912 ) ( ON ?auto_460910 ?auto_460911 ) ( ON ?auto_460909 ?auto_460910 ) ( ON ?auto_460908 ?auto_460909 ) ( CLEAR ?auto_460906 ) ( ON ?auto_460907 ?auto_460908 ) ( CLEAR ?auto_460907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_460906 ?auto_460907 )
      ( MAKE-9PILE ?auto_460906 ?auto_460907 ?auto_460908 ?auto_460909 ?auto_460910 ?auto_460911 ?auto_460912 ?auto_460913 ?auto_460914 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460925 - BLOCK
      ?auto_460926 - BLOCK
      ?auto_460927 - BLOCK
      ?auto_460928 - BLOCK
      ?auto_460929 - BLOCK
      ?auto_460930 - BLOCK
      ?auto_460931 - BLOCK
      ?auto_460932 - BLOCK
      ?auto_460933 - BLOCK
    )
    :vars
    (
      ?auto_460934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460933 ?auto_460934 ) ( not ( = ?auto_460925 ?auto_460926 ) ) ( not ( = ?auto_460925 ?auto_460927 ) ) ( not ( = ?auto_460925 ?auto_460928 ) ) ( not ( = ?auto_460925 ?auto_460929 ) ) ( not ( = ?auto_460925 ?auto_460930 ) ) ( not ( = ?auto_460925 ?auto_460931 ) ) ( not ( = ?auto_460925 ?auto_460932 ) ) ( not ( = ?auto_460925 ?auto_460933 ) ) ( not ( = ?auto_460925 ?auto_460934 ) ) ( not ( = ?auto_460926 ?auto_460927 ) ) ( not ( = ?auto_460926 ?auto_460928 ) ) ( not ( = ?auto_460926 ?auto_460929 ) ) ( not ( = ?auto_460926 ?auto_460930 ) ) ( not ( = ?auto_460926 ?auto_460931 ) ) ( not ( = ?auto_460926 ?auto_460932 ) ) ( not ( = ?auto_460926 ?auto_460933 ) ) ( not ( = ?auto_460926 ?auto_460934 ) ) ( not ( = ?auto_460927 ?auto_460928 ) ) ( not ( = ?auto_460927 ?auto_460929 ) ) ( not ( = ?auto_460927 ?auto_460930 ) ) ( not ( = ?auto_460927 ?auto_460931 ) ) ( not ( = ?auto_460927 ?auto_460932 ) ) ( not ( = ?auto_460927 ?auto_460933 ) ) ( not ( = ?auto_460927 ?auto_460934 ) ) ( not ( = ?auto_460928 ?auto_460929 ) ) ( not ( = ?auto_460928 ?auto_460930 ) ) ( not ( = ?auto_460928 ?auto_460931 ) ) ( not ( = ?auto_460928 ?auto_460932 ) ) ( not ( = ?auto_460928 ?auto_460933 ) ) ( not ( = ?auto_460928 ?auto_460934 ) ) ( not ( = ?auto_460929 ?auto_460930 ) ) ( not ( = ?auto_460929 ?auto_460931 ) ) ( not ( = ?auto_460929 ?auto_460932 ) ) ( not ( = ?auto_460929 ?auto_460933 ) ) ( not ( = ?auto_460929 ?auto_460934 ) ) ( not ( = ?auto_460930 ?auto_460931 ) ) ( not ( = ?auto_460930 ?auto_460932 ) ) ( not ( = ?auto_460930 ?auto_460933 ) ) ( not ( = ?auto_460930 ?auto_460934 ) ) ( not ( = ?auto_460931 ?auto_460932 ) ) ( not ( = ?auto_460931 ?auto_460933 ) ) ( not ( = ?auto_460931 ?auto_460934 ) ) ( not ( = ?auto_460932 ?auto_460933 ) ) ( not ( = ?auto_460932 ?auto_460934 ) ) ( not ( = ?auto_460933 ?auto_460934 ) ) ( ON ?auto_460932 ?auto_460933 ) ( ON ?auto_460931 ?auto_460932 ) ( ON ?auto_460930 ?auto_460931 ) ( ON ?auto_460929 ?auto_460930 ) ( ON ?auto_460928 ?auto_460929 ) ( ON ?auto_460927 ?auto_460928 ) ( ON ?auto_460926 ?auto_460927 ) ( ON ?auto_460925 ?auto_460926 ) ( CLEAR ?auto_460925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_460925 )
      ( MAKE-9PILE ?auto_460925 ?auto_460926 ?auto_460927 ?auto_460928 ?auto_460929 ?auto_460930 ?auto_460931 ?auto_460932 ?auto_460933 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_460944 - BLOCK
      ?auto_460945 - BLOCK
      ?auto_460946 - BLOCK
      ?auto_460947 - BLOCK
      ?auto_460948 - BLOCK
      ?auto_460949 - BLOCK
      ?auto_460950 - BLOCK
      ?auto_460951 - BLOCK
      ?auto_460952 - BLOCK
    )
    :vars
    (
      ?auto_460953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_460952 ?auto_460953 ) ( not ( = ?auto_460944 ?auto_460945 ) ) ( not ( = ?auto_460944 ?auto_460946 ) ) ( not ( = ?auto_460944 ?auto_460947 ) ) ( not ( = ?auto_460944 ?auto_460948 ) ) ( not ( = ?auto_460944 ?auto_460949 ) ) ( not ( = ?auto_460944 ?auto_460950 ) ) ( not ( = ?auto_460944 ?auto_460951 ) ) ( not ( = ?auto_460944 ?auto_460952 ) ) ( not ( = ?auto_460944 ?auto_460953 ) ) ( not ( = ?auto_460945 ?auto_460946 ) ) ( not ( = ?auto_460945 ?auto_460947 ) ) ( not ( = ?auto_460945 ?auto_460948 ) ) ( not ( = ?auto_460945 ?auto_460949 ) ) ( not ( = ?auto_460945 ?auto_460950 ) ) ( not ( = ?auto_460945 ?auto_460951 ) ) ( not ( = ?auto_460945 ?auto_460952 ) ) ( not ( = ?auto_460945 ?auto_460953 ) ) ( not ( = ?auto_460946 ?auto_460947 ) ) ( not ( = ?auto_460946 ?auto_460948 ) ) ( not ( = ?auto_460946 ?auto_460949 ) ) ( not ( = ?auto_460946 ?auto_460950 ) ) ( not ( = ?auto_460946 ?auto_460951 ) ) ( not ( = ?auto_460946 ?auto_460952 ) ) ( not ( = ?auto_460946 ?auto_460953 ) ) ( not ( = ?auto_460947 ?auto_460948 ) ) ( not ( = ?auto_460947 ?auto_460949 ) ) ( not ( = ?auto_460947 ?auto_460950 ) ) ( not ( = ?auto_460947 ?auto_460951 ) ) ( not ( = ?auto_460947 ?auto_460952 ) ) ( not ( = ?auto_460947 ?auto_460953 ) ) ( not ( = ?auto_460948 ?auto_460949 ) ) ( not ( = ?auto_460948 ?auto_460950 ) ) ( not ( = ?auto_460948 ?auto_460951 ) ) ( not ( = ?auto_460948 ?auto_460952 ) ) ( not ( = ?auto_460948 ?auto_460953 ) ) ( not ( = ?auto_460949 ?auto_460950 ) ) ( not ( = ?auto_460949 ?auto_460951 ) ) ( not ( = ?auto_460949 ?auto_460952 ) ) ( not ( = ?auto_460949 ?auto_460953 ) ) ( not ( = ?auto_460950 ?auto_460951 ) ) ( not ( = ?auto_460950 ?auto_460952 ) ) ( not ( = ?auto_460950 ?auto_460953 ) ) ( not ( = ?auto_460951 ?auto_460952 ) ) ( not ( = ?auto_460951 ?auto_460953 ) ) ( not ( = ?auto_460952 ?auto_460953 ) ) ( ON ?auto_460951 ?auto_460952 ) ( ON ?auto_460950 ?auto_460951 ) ( ON ?auto_460949 ?auto_460950 ) ( ON ?auto_460948 ?auto_460949 ) ( ON ?auto_460947 ?auto_460948 ) ( ON ?auto_460946 ?auto_460947 ) ( ON ?auto_460945 ?auto_460946 ) ( ON ?auto_460944 ?auto_460945 ) ( CLEAR ?auto_460944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_460944 )
      ( MAKE-9PILE ?auto_460944 ?auto_460945 ?auto_460946 ?auto_460947 ?auto_460948 ?auto_460949 ?auto_460950 ?auto_460951 ?auto_460952 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_460964 - BLOCK
      ?auto_460965 - BLOCK
      ?auto_460966 - BLOCK
      ?auto_460967 - BLOCK
      ?auto_460968 - BLOCK
      ?auto_460969 - BLOCK
      ?auto_460970 - BLOCK
      ?auto_460971 - BLOCK
      ?auto_460972 - BLOCK
      ?auto_460973 - BLOCK
    )
    :vars
    (
      ?auto_460974 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_460972 ) ( ON ?auto_460973 ?auto_460974 ) ( CLEAR ?auto_460973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_460964 ) ( ON ?auto_460965 ?auto_460964 ) ( ON ?auto_460966 ?auto_460965 ) ( ON ?auto_460967 ?auto_460966 ) ( ON ?auto_460968 ?auto_460967 ) ( ON ?auto_460969 ?auto_460968 ) ( ON ?auto_460970 ?auto_460969 ) ( ON ?auto_460971 ?auto_460970 ) ( ON ?auto_460972 ?auto_460971 ) ( not ( = ?auto_460964 ?auto_460965 ) ) ( not ( = ?auto_460964 ?auto_460966 ) ) ( not ( = ?auto_460964 ?auto_460967 ) ) ( not ( = ?auto_460964 ?auto_460968 ) ) ( not ( = ?auto_460964 ?auto_460969 ) ) ( not ( = ?auto_460964 ?auto_460970 ) ) ( not ( = ?auto_460964 ?auto_460971 ) ) ( not ( = ?auto_460964 ?auto_460972 ) ) ( not ( = ?auto_460964 ?auto_460973 ) ) ( not ( = ?auto_460964 ?auto_460974 ) ) ( not ( = ?auto_460965 ?auto_460966 ) ) ( not ( = ?auto_460965 ?auto_460967 ) ) ( not ( = ?auto_460965 ?auto_460968 ) ) ( not ( = ?auto_460965 ?auto_460969 ) ) ( not ( = ?auto_460965 ?auto_460970 ) ) ( not ( = ?auto_460965 ?auto_460971 ) ) ( not ( = ?auto_460965 ?auto_460972 ) ) ( not ( = ?auto_460965 ?auto_460973 ) ) ( not ( = ?auto_460965 ?auto_460974 ) ) ( not ( = ?auto_460966 ?auto_460967 ) ) ( not ( = ?auto_460966 ?auto_460968 ) ) ( not ( = ?auto_460966 ?auto_460969 ) ) ( not ( = ?auto_460966 ?auto_460970 ) ) ( not ( = ?auto_460966 ?auto_460971 ) ) ( not ( = ?auto_460966 ?auto_460972 ) ) ( not ( = ?auto_460966 ?auto_460973 ) ) ( not ( = ?auto_460966 ?auto_460974 ) ) ( not ( = ?auto_460967 ?auto_460968 ) ) ( not ( = ?auto_460967 ?auto_460969 ) ) ( not ( = ?auto_460967 ?auto_460970 ) ) ( not ( = ?auto_460967 ?auto_460971 ) ) ( not ( = ?auto_460967 ?auto_460972 ) ) ( not ( = ?auto_460967 ?auto_460973 ) ) ( not ( = ?auto_460967 ?auto_460974 ) ) ( not ( = ?auto_460968 ?auto_460969 ) ) ( not ( = ?auto_460968 ?auto_460970 ) ) ( not ( = ?auto_460968 ?auto_460971 ) ) ( not ( = ?auto_460968 ?auto_460972 ) ) ( not ( = ?auto_460968 ?auto_460973 ) ) ( not ( = ?auto_460968 ?auto_460974 ) ) ( not ( = ?auto_460969 ?auto_460970 ) ) ( not ( = ?auto_460969 ?auto_460971 ) ) ( not ( = ?auto_460969 ?auto_460972 ) ) ( not ( = ?auto_460969 ?auto_460973 ) ) ( not ( = ?auto_460969 ?auto_460974 ) ) ( not ( = ?auto_460970 ?auto_460971 ) ) ( not ( = ?auto_460970 ?auto_460972 ) ) ( not ( = ?auto_460970 ?auto_460973 ) ) ( not ( = ?auto_460970 ?auto_460974 ) ) ( not ( = ?auto_460971 ?auto_460972 ) ) ( not ( = ?auto_460971 ?auto_460973 ) ) ( not ( = ?auto_460971 ?auto_460974 ) ) ( not ( = ?auto_460972 ?auto_460973 ) ) ( not ( = ?auto_460972 ?auto_460974 ) ) ( not ( = ?auto_460973 ?auto_460974 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_460973 ?auto_460974 )
      ( !STACK ?auto_460973 ?auto_460972 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_460985 - BLOCK
      ?auto_460986 - BLOCK
      ?auto_460987 - BLOCK
      ?auto_460988 - BLOCK
      ?auto_460989 - BLOCK
      ?auto_460990 - BLOCK
      ?auto_460991 - BLOCK
      ?auto_460992 - BLOCK
      ?auto_460993 - BLOCK
      ?auto_460994 - BLOCK
    )
    :vars
    (
      ?auto_460995 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_460993 ) ( ON ?auto_460994 ?auto_460995 ) ( CLEAR ?auto_460994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_460985 ) ( ON ?auto_460986 ?auto_460985 ) ( ON ?auto_460987 ?auto_460986 ) ( ON ?auto_460988 ?auto_460987 ) ( ON ?auto_460989 ?auto_460988 ) ( ON ?auto_460990 ?auto_460989 ) ( ON ?auto_460991 ?auto_460990 ) ( ON ?auto_460992 ?auto_460991 ) ( ON ?auto_460993 ?auto_460992 ) ( not ( = ?auto_460985 ?auto_460986 ) ) ( not ( = ?auto_460985 ?auto_460987 ) ) ( not ( = ?auto_460985 ?auto_460988 ) ) ( not ( = ?auto_460985 ?auto_460989 ) ) ( not ( = ?auto_460985 ?auto_460990 ) ) ( not ( = ?auto_460985 ?auto_460991 ) ) ( not ( = ?auto_460985 ?auto_460992 ) ) ( not ( = ?auto_460985 ?auto_460993 ) ) ( not ( = ?auto_460985 ?auto_460994 ) ) ( not ( = ?auto_460985 ?auto_460995 ) ) ( not ( = ?auto_460986 ?auto_460987 ) ) ( not ( = ?auto_460986 ?auto_460988 ) ) ( not ( = ?auto_460986 ?auto_460989 ) ) ( not ( = ?auto_460986 ?auto_460990 ) ) ( not ( = ?auto_460986 ?auto_460991 ) ) ( not ( = ?auto_460986 ?auto_460992 ) ) ( not ( = ?auto_460986 ?auto_460993 ) ) ( not ( = ?auto_460986 ?auto_460994 ) ) ( not ( = ?auto_460986 ?auto_460995 ) ) ( not ( = ?auto_460987 ?auto_460988 ) ) ( not ( = ?auto_460987 ?auto_460989 ) ) ( not ( = ?auto_460987 ?auto_460990 ) ) ( not ( = ?auto_460987 ?auto_460991 ) ) ( not ( = ?auto_460987 ?auto_460992 ) ) ( not ( = ?auto_460987 ?auto_460993 ) ) ( not ( = ?auto_460987 ?auto_460994 ) ) ( not ( = ?auto_460987 ?auto_460995 ) ) ( not ( = ?auto_460988 ?auto_460989 ) ) ( not ( = ?auto_460988 ?auto_460990 ) ) ( not ( = ?auto_460988 ?auto_460991 ) ) ( not ( = ?auto_460988 ?auto_460992 ) ) ( not ( = ?auto_460988 ?auto_460993 ) ) ( not ( = ?auto_460988 ?auto_460994 ) ) ( not ( = ?auto_460988 ?auto_460995 ) ) ( not ( = ?auto_460989 ?auto_460990 ) ) ( not ( = ?auto_460989 ?auto_460991 ) ) ( not ( = ?auto_460989 ?auto_460992 ) ) ( not ( = ?auto_460989 ?auto_460993 ) ) ( not ( = ?auto_460989 ?auto_460994 ) ) ( not ( = ?auto_460989 ?auto_460995 ) ) ( not ( = ?auto_460990 ?auto_460991 ) ) ( not ( = ?auto_460990 ?auto_460992 ) ) ( not ( = ?auto_460990 ?auto_460993 ) ) ( not ( = ?auto_460990 ?auto_460994 ) ) ( not ( = ?auto_460990 ?auto_460995 ) ) ( not ( = ?auto_460991 ?auto_460992 ) ) ( not ( = ?auto_460991 ?auto_460993 ) ) ( not ( = ?auto_460991 ?auto_460994 ) ) ( not ( = ?auto_460991 ?auto_460995 ) ) ( not ( = ?auto_460992 ?auto_460993 ) ) ( not ( = ?auto_460992 ?auto_460994 ) ) ( not ( = ?auto_460992 ?auto_460995 ) ) ( not ( = ?auto_460993 ?auto_460994 ) ) ( not ( = ?auto_460993 ?auto_460995 ) ) ( not ( = ?auto_460994 ?auto_460995 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_460994 ?auto_460995 )
      ( !STACK ?auto_460994 ?auto_460993 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461006 - BLOCK
      ?auto_461007 - BLOCK
      ?auto_461008 - BLOCK
      ?auto_461009 - BLOCK
      ?auto_461010 - BLOCK
      ?auto_461011 - BLOCK
      ?auto_461012 - BLOCK
      ?auto_461013 - BLOCK
      ?auto_461014 - BLOCK
      ?auto_461015 - BLOCK
    )
    :vars
    (
      ?auto_461016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461015 ?auto_461016 ) ( ON-TABLE ?auto_461006 ) ( ON ?auto_461007 ?auto_461006 ) ( ON ?auto_461008 ?auto_461007 ) ( ON ?auto_461009 ?auto_461008 ) ( ON ?auto_461010 ?auto_461009 ) ( ON ?auto_461011 ?auto_461010 ) ( ON ?auto_461012 ?auto_461011 ) ( ON ?auto_461013 ?auto_461012 ) ( not ( = ?auto_461006 ?auto_461007 ) ) ( not ( = ?auto_461006 ?auto_461008 ) ) ( not ( = ?auto_461006 ?auto_461009 ) ) ( not ( = ?auto_461006 ?auto_461010 ) ) ( not ( = ?auto_461006 ?auto_461011 ) ) ( not ( = ?auto_461006 ?auto_461012 ) ) ( not ( = ?auto_461006 ?auto_461013 ) ) ( not ( = ?auto_461006 ?auto_461014 ) ) ( not ( = ?auto_461006 ?auto_461015 ) ) ( not ( = ?auto_461006 ?auto_461016 ) ) ( not ( = ?auto_461007 ?auto_461008 ) ) ( not ( = ?auto_461007 ?auto_461009 ) ) ( not ( = ?auto_461007 ?auto_461010 ) ) ( not ( = ?auto_461007 ?auto_461011 ) ) ( not ( = ?auto_461007 ?auto_461012 ) ) ( not ( = ?auto_461007 ?auto_461013 ) ) ( not ( = ?auto_461007 ?auto_461014 ) ) ( not ( = ?auto_461007 ?auto_461015 ) ) ( not ( = ?auto_461007 ?auto_461016 ) ) ( not ( = ?auto_461008 ?auto_461009 ) ) ( not ( = ?auto_461008 ?auto_461010 ) ) ( not ( = ?auto_461008 ?auto_461011 ) ) ( not ( = ?auto_461008 ?auto_461012 ) ) ( not ( = ?auto_461008 ?auto_461013 ) ) ( not ( = ?auto_461008 ?auto_461014 ) ) ( not ( = ?auto_461008 ?auto_461015 ) ) ( not ( = ?auto_461008 ?auto_461016 ) ) ( not ( = ?auto_461009 ?auto_461010 ) ) ( not ( = ?auto_461009 ?auto_461011 ) ) ( not ( = ?auto_461009 ?auto_461012 ) ) ( not ( = ?auto_461009 ?auto_461013 ) ) ( not ( = ?auto_461009 ?auto_461014 ) ) ( not ( = ?auto_461009 ?auto_461015 ) ) ( not ( = ?auto_461009 ?auto_461016 ) ) ( not ( = ?auto_461010 ?auto_461011 ) ) ( not ( = ?auto_461010 ?auto_461012 ) ) ( not ( = ?auto_461010 ?auto_461013 ) ) ( not ( = ?auto_461010 ?auto_461014 ) ) ( not ( = ?auto_461010 ?auto_461015 ) ) ( not ( = ?auto_461010 ?auto_461016 ) ) ( not ( = ?auto_461011 ?auto_461012 ) ) ( not ( = ?auto_461011 ?auto_461013 ) ) ( not ( = ?auto_461011 ?auto_461014 ) ) ( not ( = ?auto_461011 ?auto_461015 ) ) ( not ( = ?auto_461011 ?auto_461016 ) ) ( not ( = ?auto_461012 ?auto_461013 ) ) ( not ( = ?auto_461012 ?auto_461014 ) ) ( not ( = ?auto_461012 ?auto_461015 ) ) ( not ( = ?auto_461012 ?auto_461016 ) ) ( not ( = ?auto_461013 ?auto_461014 ) ) ( not ( = ?auto_461013 ?auto_461015 ) ) ( not ( = ?auto_461013 ?auto_461016 ) ) ( not ( = ?auto_461014 ?auto_461015 ) ) ( not ( = ?auto_461014 ?auto_461016 ) ) ( not ( = ?auto_461015 ?auto_461016 ) ) ( CLEAR ?auto_461013 ) ( ON ?auto_461014 ?auto_461015 ) ( CLEAR ?auto_461014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_461006 ?auto_461007 ?auto_461008 ?auto_461009 ?auto_461010 ?auto_461011 ?auto_461012 ?auto_461013 ?auto_461014 )
      ( MAKE-10PILE ?auto_461006 ?auto_461007 ?auto_461008 ?auto_461009 ?auto_461010 ?auto_461011 ?auto_461012 ?auto_461013 ?auto_461014 ?auto_461015 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461027 - BLOCK
      ?auto_461028 - BLOCK
      ?auto_461029 - BLOCK
      ?auto_461030 - BLOCK
      ?auto_461031 - BLOCK
      ?auto_461032 - BLOCK
      ?auto_461033 - BLOCK
      ?auto_461034 - BLOCK
      ?auto_461035 - BLOCK
      ?auto_461036 - BLOCK
    )
    :vars
    (
      ?auto_461037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461036 ?auto_461037 ) ( ON-TABLE ?auto_461027 ) ( ON ?auto_461028 ?auto_461027 ) ( ON ?auto_461029 ?auto_461028 ) ( ON ?auto_461030 ?auto_461029 ) ( ON ?auto_461031 ?auto_461030 ) ( ON ?auto_461032 ?auto_461031 ) ( ON ?auto_461033 ?auto_461032 ) ( ON ?auto_461034 ?auto_461033 ) ( not ( = ?auto_461027 ?auto_461028 ) ) ( not ( = ?auto_461027 ?auto_461029 ) ) ( not ( = ?auto_461027 ?auto_461030 ) ) ( not ( = ?auto_461027 ?auto_461031 ) ) ( not ( = ?auto_461027 ?auto_461032 ) ) ( not ( = ?auto_461027 ?auto_461033 ) ) ( not ( = ?auto_461027 ?auto_461034 ) ) ( not ( = ?auto_461027 ?auto_461035 ) ) ( not ( = ?auto_461027 ?auto_461036 ) ) ( not ( = ?auto_461027 ?auto_461037 ) ) ( not ( = ?auto_461028 ?auto_461029 ) ) ( not ( = ?auto_461028 ?auto_461030 ) ) ( not ( = ?auto_461028 ?auto_461031 ) ) ( not ( = ?auto_461028 ?auto_461032 ) ) ( not ( = ?auto_461028 ?auto_461033 ) ) ( not ( = ?auto_461028 ?auto_461034 ) ) ( not ( = ?auto_461028 ?auto_461035 ) ) ( not ( = ?auto_461028 ?auto_461036 ) ) ( not ( = ?auto_461028 ?auto_461037 ) ) ( not ( = ?auto_461029 ?auto_461030 ) ) ( not ( = ?auto_461029 ?auto_461031 ) ) ( not ( = ?auto_461029 ?auto_461032 ) ) ( not ( = ?auto_461029 ?auto_461033 ) ) ( not ( = ?auto_461029 ?auto_461034 ) ) ( not ( = ?auto_461029 ?auto_461035 ) ) ( not ( = ?auto_461029 ?auto_461036 ) ) ( not ( = ?auto_461029 ?auto_461037 ) ) ( not ( = ?auto_461030 ?auto_461031 ) ) ( not ( = ?auto_461030 ?auto_461032 ) ) ( not ( = ?auto_461030 ?auto_461033 ) ) ( not ( = ?auto_461030 ?auto_461034 ) ) ( not ( = ?auto_461030 ?auto_461035 ) ) ( not ( = ?auto_461030 ?auto_461036 ) ) ( not ( = ?auto_461030 ?auto_461037 ) ) ( not ( = ?auto_461031 ?auto_461032 ) ) ( not ( = ?auto_461031 ?auto_461033 ) ) ( not ( = ?auto_461031 ?auto_461034 ) ) ( not ( = ?auto_461031 ?auto_461035 ) ) ( not ( = ?auto_461031 ?auto_461036 ) ) ( not ( = ?auto_461031 ?auto_461037 ) ) ( not ( = ?auto_461032 ?auto_461033 ) ) ( not ( = ?auto_461032 ?auto_461034 ) ) ( not ( = ?auto_461032 ?auto_461035 ) ) ( not ( = ?auto_461032 ?auto_461036 ) ) ( not ( = ?auto_461032 ?auto_461037 ) ) ( not ( = ?auto_461033 ?auto_461034 ) ) ( not ( = ?auto_461033 ?auto_461035 ) ) ( not ( = ?auto_461033 ?auto_461036 ) ) ( not ( = ?auto_461033 ?auto_461037 ) ) ( not ( = ?auto_461034 ?auto_461035 ) ) ( not ( = ?auto_461034 ?auto_461036 ) ) ( not ( = ?auto_461034 ?auto_461037 ) ) ( not ( = ?auto_461035 ?auto_461036 ) ) ( not ( = ?auto_461035 ?auto_461037 ) ) ( not ( = ?auto_461036 ?auto_461037 ) ) ( CLEAR ?auto_461034 ) ( ON ?auto_461035 ?auto_461036 ) ( CLEAR ?auto_461035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_461027 ?auto_461028 ?auto_461029 ?auto_461030 ?auto_461031 ?auto_461032 ?auto_461033 ?auto_461034 ?auto_461035 )
      ( MAKE-10PILE ?auto_461027 ?auto_461028 ?auto_461029 ?auto_461030 ?auto_461031 ?auto_461032 ?auto_461033 ?auto_461034 ?auto_461035 ?auto_461036 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461048 - BLOCK
      ?auto_461049 - BLOCK
      ?auto_461050 - BLOCK
      ?auto_461051 - BLOCK
      ?auto_461052 - BLOCK
      ?auto_461053 - BLOCK
      ?auto_461054 - BLOCK
      ?auto_461055 - BLOCK
      ?auto_461056 - BLOCK
      ?auto_461057 - BLOCK
    )
    :vars
    (
      ?auto_461058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461057 ?auto_461058 ) ( ON-TABLE ?auto_461048 ) ( ON ?auto_461049 ?auto_461048 ) ( ON ?auto_461050 ?auto_461049 ) ( ON ?auto_461051 ?auto_461050 ) ( ON ?auto_461052 ?auto_461051 ) ( ON ?auto_461053 ?auto_461052 ) ( ON ?auto_461054 ?auto_461053 ) ( not ( = ?auto_461048 ?auto_461049 ) ) ( not ( = ?auto_461048 ?auto_461050 ) ) ( not ( = ?auto_461048 ?auto_461051 ) ) ( not ( = ?auto_461048 ?auto_461052 ) ) ( not ( = ?auto_461048 ?auto_461053 ) ) ( not ( = ?auto_461048 ?auto_461054 ) ) ( not ( = ?auto_461048 ?auto_461055 ) ) ( not ( = ?auto_461048 ?auto_461056 ) ) ( not ( = ?auto_461048 ?auto_461057 ) ) ( not ( = ?auto_461048 ?auto_461058 ) ) ( not ( = ?auto_461049 ?auto_461050 ) ) ( not ( = ?auto_461049 ?auto_461051 ) ) ( not ( = ?auto_461049 ?auto_461052 ) ) ( not ( = ?auto_461049 ?auto_461053 ) ) ( not ( = ?auto_461049 ?auto_461054 ) ) ( not ( = ?auto_461049 ?auto_461055 ) ) ( not ( = ?auto_461049 ?auto_461056 ) ) ( not ( = ?auto_461049 ?auto_461057 ) ) ( not ( = ?auto_461049 ?auto_461058 ) ) ( not ( = ?auto_461050 ?auto_461051 ) ) ( not ( = ?auto_461050 ?auto_461052 ) ) ( not ( = ?auto_461050 ?auto_461053 ) ) ( not ( = ?auto_461050 ?auto_461054 ) ) ( not ( = ?auto_461050 ?auto_461055 ) ) ( not ( = ?auto_461050 ?auto_461056 ) ) ( not ( = ?auto_461050 ?auto_461057 ) ) ( not ( = ?auto_461050 ?auto_461058 ) ) ( not ( = ?auto_461051 ?auto_461052 ) ) ( not ( = ?auto_461051 ?auto_461053 ) ) ( not ( = ?auto_461051 ?auto_461054 ) ) ( not ( = ?auto_461051 ?auto_461055 ) ) ( not ( = ?auto_461051 ?auto_461056 ) ) ( not ( = ?auto_461051 ?auto_461057 ) ) ( not ( = ?auto_461051 ?auto_461058 ) ) ( not ( = ?auto_461052 ?auto_461053 ) ) ( not ( = ?auto_461052 ?auto_461054 ) ) ( not ( = ?auto_461052 ?auto_461055 ) ) ( not ( = ?auto_461052 ?auto_461056 ) ) ( not ( = ?auto_461052 ?auto_461057 ) ) ( not ( = ?auto_461052 ?auto_461058 ) ) ( not ( = ?auto_461053 ?auto_461054 ) ) ( not ( = ?auto_461053 ?auto_461055 ) ) ( not ( = ?auto_461053 ?auto_461056 ) ) ( not ( = ?auto_461053 ?auto_461057 ) ) ( not ( = ?auto_461053 ?auto_461058 ) ) ( not ( = ?auto_461054 ?auto_461055 ) ) ( not ( = ?auto_461054 ?auto_461056 ) ) ( not ( = ?auto_461054 ?auto_461057 ) ) ( not ( = ?auto_461054 ?auto_461058 ) ) ( not ( = ?auto_461055 ?auto_461056 ) ) ( not ( = ?auto_461055 ?auto_461057 ) ) ( not ( = ?auto_461055 ?auto_461058 ) ) ( not ( = ?auto_461056 ?auto_461057 ) ) ( not ( = ?auto_461056 ?auto_461058 ) ) ( not ( = ?auto_461057 ?auto_461058 ) ) ( ON ?auto_461056 ?auto_461057 ) ( CLEAR ?auto_461054 ) ( ON ?auto_461055 ?auto_461056 ) ( CLEAR ?auto_461055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_461048 ?auto_461049 ?auto_461050 ?auto_461051 ?auto_461052 ?auto_461053 ?auto_461054 ?auto_461055 )
      ( MAKE-10PILE ?auto_461048 ?auto_461049 ?auto_461050 ?auto_461051 ?auto_461052 ?auto_461053 ?auto_461054 ?auto_461055 ?auto_461056 ?auto_461057 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461069 - BLOCK
      ?auto_461070 - BLOCK
      ?auto_461071 - BLOCK
      ?auto_461072 - BLOCK
      ?auto_461073 - BLOCK
      ?auto_461074 - BLOCK
      ?auto_461075 - BLOCK
      ?auto_461076 - BLOCK
      ?auto_461077 - BLOCK
      ?auto_461078 - BLOCK
    )
    :vars
    (
      ?auto_461079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461078 ?auto_461079 ) ( ON-TABLE ?auto_461069 ) ( ON ?auto_461070 ?auto_461069 ) ( ON ?auto_461071 ?auto_461070 ) ( ON ?auto_461072 ?auto_461071 ) ( ON ?auto_461073 ?auto_461072 ) ( ON ?auto_461074 ?auto_461073 ) ( ON ?auto_461075 ?auto_461074 ) ( not ( = ?auto_461069 ?auto_461070 ) ) ( not ( = ?auto_461069 ?auto_461071 ) ) ( not ( = ?auto_461069 ?auto_461072 ) ) ( not ( = ?auto_461069 ?auto_461073 ) ) ( not ( = ?auto_461069 ?auto_461074 ) ) ( not ( = ?auto_461069 ?auto_461075 ) ) ( not ( = ?auto_461069 ?auto_461076 ) ) ( not ( = ?auto_461069 ?auto_461077 ) ) ( not ( = ?auto_461069 ?auto_461078 ) ) ( not ( = ?auto_461069 ?auto_461079 ) ) ( not ( = ?auto_461070 ?auto_461071 ) ) ( not ( = ?auto_461070 ?auto_461072 ) ) ( not ( = ?auto_461070 ?auto_461073 ) ) ( not ( = ?auto_461070 ?auto_461074 ) ) ( not ( = ?auto_461070 ?auto_461075 ) ) ( not ( = ?auto_461070 ?auto_461076 ) ) ( not ( = ?auto_461070 ?auto_461077 ) ) ( not ( = ?auto_461070 ?auto_461078 ) ) ( not ( = ?auto_461070 ?auto_461079 ) ) ( not ( = ?auto_461071 ?auto_461072 ) ) ( not ( = ?auto_461071 ?auto_461073 ) ) ( not ( = ?auto_461071 ?auto_461074 ) ) ( not ( = ?auto_461071 ?auto_461075 ) ) ( not ( = ?auto_461071 ?auto_461076 ) ) ( not ( = ?auto_461071 ?auto_461077 ) ) ( not ( = ?auto_461071 ?auto_461078 ) ) ( not ( = ?auto_461071 ?auto_461079 ) ) ( not ( = ?auto_461072 ?auto_461073 ) ) ( not ( = ?auto_461072 ?auto_461074 ) ) ( not ( = ?auto_461072 ?auto_461075 ) ) ( not ( = ?auto_461072 ?auto_461076 ) ) ( not ( = ?auto_461072 ?auto_461077 ) ) ( not ( = ?auto_461072 ?auto_461078 ) ) ( not ( = ?auto_461072 ?auto_461079 ) ) ( not ( = ?auto_461073 ?auto_461074 ) ) ( not ( = ?auto_461073 ?auto_461075 ) ) ( not ( = ?auto_461073 ?auto_461076 ) ) ( not ( = ?auto_461073 ?auto_461077 ) ) ( not ( = ?auto_461073 ?auto_461078 ) ) ( not ( = ?auto_461073 ?auto_461079 ) ) ( not ( = ?auto_461074 ?auto_461075 ) ) ( not ( = ?auto_461074 ?auto_461076 ) ) ( not ( = ?auto_461074 ?auto_461077 ) ) ( not ( = ?auto_461074 ?auto_461078 ) ) ( not ( = ?auto_461074 ?auto_461079 ) ) ( not ( = ?auto_461075 ?auto_461076 ) ) ( not ( = ?auto_461075 ?auto_461077 ) ) ( not ( = ?auto_461075 ?auto_461078 ) ) ( not ( = ?auto_461075 ?auto_461079 ) ) ( not ( = ?auto_461076 ?auto_461077 ) ) ( not ( = ?auto_461076 ?auto_461078 ) ) ( not ( = ?auto_461076 ?auto_461079 ) ) ( not ( = ?auto_461077 ?auto_461078 ) ) ( not ( = ?auto_461077 ?auto_461079 ) ) ( not ( = ?auto_461078 ?auto_461079 ) ) ( ON ?auto_461077 ?auto_461078 ) ( CLEAR ?auto_461075 ) ( ON ?auto_461076 ?auto_461077 ) ( CLEAR ?auto_461076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_461069 ?auto_461070 ?auto_461071 ?auto_461072 ?auto_461073 ?auto_461074 ?auto_461075 ?auto_461076 )
      ( MAKE-10PILE ?auto_461069 ?auto_461070 ?auto_461071 ?auto_461072 ?auto_461073 ?auto_461074 ?auto_461075 ?auto_461076 ?auto_461077 ?auto_461078 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461090 - BLOCK
      ?auto_461091 - BLOCK
      ?auto_461092 - BLOCK
      ?auto_461093 - BLOCK
      ?auto_461094 - BLOCK
      ?auto_461095 - BLOCK
      ?auto_461096 - BLOCK
      ?auto_461097 - BLOCK
      ?auto_461098 - BLOCK
      ?auto_461099 - BLOCK
    )
    :vars
    (
      ?auto_461100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461099 ?auto_461100 ) ( ON-TABLE ?auto_461090 ) ( ON ?auto_461091 ?auto_461090 ) ( ON ?auto_461092 ?auto_461091 ) ( ON ?auto_461093 ?auto_461092 ) ( ON ?auto_461094 ?auto_461093 ) ( ON ?auto_461095 ?auto_461094 ) ( not ( = ?auto_461090 ?auto_461091 ) ) ( not ( = ?auto_461090 ?auto_461092 ) ) ( not ( = ?auto_461090 ?auto_461093 ) ) ( not ( = ?auto_461090 ?auto_461094 ) ) ( not ( = ?auto_461090 ?auto_461095 ) ) ( not ( = ?auto_461090 ?auto_461096 ) ) ( not ( = ?auto_461090 ?auto_461097 ) ) ( not ( = ?auto_461090 ?auto_461098 ) ) ( not ( = ?auto_461090 ?auto_461099 ) ) ( not ( = ?auto_461090 ?auto_461100 ) ) ( not ( = ?auto_461091 ?auto_461092 ) ) ( not ( = ?auto_461091 ?auto_461093 ) ) ( not ( = ?auto_461091 ?auto_461094 ) ) ( not ( = ?auto_461091 ?auto_461095 ) ) ( not ( = ?auto_461091 ?auto_461096 ) ) ( not ( = ?auto_461091 ?auto_461097 ) ) ( not ( = ?auto_461091 ?auto_461098 ) ) ( not ( = ?auto_461091 ?auto_461099 ) ) ( not ( = ?auto_461091 ?auto_461100 ) ) ( not ( = ?auto_461092 ?auto_461093 ) ) ( not ( = ?auto_461092 ?auto_461094 ) ) ( not ( = ?auto_461092 ?auto_461095 ) ) ( not ( = ?auto_461092 ?auto_461096 ) ) ( not ( = ?auto_461092 ?auto_461097 ) ) ( not ( = ?auto_461092 ?auto_461098 ) ) ( not ( = ?auto_461092 ?auto_461099 ) ) ( not ( = ?auto_461092 ?auto_461100 ) ) ( not ( = ?auto_461093 ?auto_461094 ) ) ( not ( = ?auto_461093 ?auto_461095 ) ) ( not ( = ?auto_461093 ?auto_461096 ) ) ( not ( = ?auto_461093 ?auto_461097 ) ) ( not ( = ?auto_461093 ?auto_461098 ) ) ( not ( = ?auto_461093 ?auto_461099 ) ) ( not ( = ?auto_461093 ?auto_461100 ) ) ( not ( = ?auto_461094 ?auto_461095 ) ) ( not ( = ?auto_461094 ?auto_461096 ) ) ( not ( = ?auto_461094 ?auto_461097 ) ) ( not ( = ?auto_461094 ?auto_461098 ) ) ( not ( = ?auto_461094 ?auto_461099 ) ) ( not ( = ?auto_461094 ?auto_461100 ) ) ( not ( = ?auto_461095 ?auto_461096 ) ) ( not ( = ?auto_461095 ?auto_461097 ) ) ( not ( = ?auto_461095 ?auto_461098 ) ) ( not ( = ?auto_461095 ?auto_461099 ) ) ( not ( = ?auto_461095 ?auto_461100 ) ) ( not ( = ?auto_461096 ?auto_461097 ) ) ( not ( = ?auto_461096 ?auto_461098 ) ) ( not ( = ?auto_461096 ?auto_461099 ) ) ( not ( = ?auto_461096 ?auto_461100 ) ) ( not ( = ?auto_461097 ?auto_461098 ) ) ( not ( = ?auto_461097 ?auto_461099 ) ) ( not ( = ?auto_461097 ?auto_461100 ) ) ( not ( = ?auto_461098 ?auto_461099 ) ) ( not ( = ?auto_461098 ?auto_461100 ) ) ( not ( = ?auto_461099 ?auto_461100 ) ) ( ON ?auto_461098 ?auto_461099 ) ( ON ?auto_461097 ?auto_461098 ) ( CLEAR ?auto_461095 ) ( ON ?auto_461096 ?auto_461097 ) ( CLEAR ?auto_461096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_461090 ?auto_461091 ?auto_461092 ?auto_461093 ?auto_461094 ?auto_461095 ?auto_461096 )
      ( MAKE-10PILE ?auto_461090 ?auto_461091 ?auto_461092 ?auto_461093 ?auto_461094 ?auto_461095 ?auto_461096 ?auto_461097 ?auto_461098 ?auto_461099 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461111 - BLOCK
      ?auto_461112 - BLOCK
      ?auto_461113 - BLOCK
      ?auto_461114 - BLOCK
      ?auto_461115 - BLOCK
      ?auto_461116 - BLOCK
      ?auto_461117 - BLOCK
      ?auto_461118 - BLOCK
      ?auto_461119 - BLOCK
      ?auto_461120 - BLOCK
    )
    :vars
    (
      ?auto_461121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461120 ?auto_461121 ) ( ON-TABLE ?auto_461111 ) ( ON ?auto_461112 ?auto_461111 ) ( ON ?auto_461113 ?auto_461112 ) ( ON ?auto_461114 ?auto_461113 ) ( ON ?auto_461115 ?auto_461114 ) ( ON ?auto_461116 ?auto_461115 ) ( not ( = ?auto_461111 ?auto_461112 ) ) ( not ( = ?auto_461111 ?auto_461113 ) ) ( not ( = ?auto_461111 ?auto_461114 ) ) ( not ( = ?auto_461111 ?auto_461115 ) ) ( not ( = ?auto_461111 ?auto_461116 ) ) ( not ( = ?auto_461111 ?auto_461117 ) ) ( not ( = ?auto_461111 ?auto_461118 ) ) ( not ( = ?auto_461111 ?auto_461119 ) ) ( not ( = ?auto_461111 ?auto_461120 ) ) ( not ( = ?auto_461111 ?auto_461121 ) ) ( not ( = ?auto_461112 ?auto_461113 ) ) ( not ( = ?auto_461112 ?auto_461114 ) ) ( not ( = ?auto_461112 ?auto_461115 ) ) ( not ( = ?auto_461112 ?auto_461116 ) ) ( not ( = ?auto_461112 ?auto_461117 ) ) ( not ( = ?auto_461112 ?auto_461118 ) ) ( not ( = ?auto_461112 ?auto_461119 ) ) ( not ( = ?auto_461112 ?auto_461120 ) ) ( not ( = ?auto_461112 ?auto_461121 ) ) ( not ( = ?auto_461113 ?auto_461114 ) ) ( not ( = ?auto_461113 ?auto_461115 ) ) ( not ( = ?auto_461113 ?auto_461116 ) ) ( not ( = ?auto_461113 ?auto_461117 ) ) ( not ( = ?auto_461113 ?auto_461118 ) ) ( not ( = ?auto_461113 ?auto_461119 ) ) ( not ( = ?auto_461113 ?auto_461120 ) ) ( not ( = ?auto_461113 ?auto_461121 ) ) ( not ( = ?auto_461114 ?auto_461115 ) ) ( not ( = ?auto_461114 ?auto_461116 ) ) ( not ( = ?auto_461114 ?auto_461117 ) ) ( not ( = ?auto_461114 ?auto_461118 ) ) ( not ( = ?auto_461114 ?auto_461119 ) ) ( not ( = ?auto_461114 ?auto_461120 ) ) ( not ( = ?auto_461114 ?auto_461121 ) ) ( not ( = ?auto_461115 ?auto_461116 ) ) ( not ( = ?auto_461115 ?auto_461117 ) ) ( not ( = ?auto_461115 ?auto_461118 ) ) ( not ( = ?auto_461115 ?auto_461119 ) ) ( not ( = ?auto_461115 ?auto_461120 ) ) ( not ( = ?auto_461115 ?auto_461121 ) ) ( not ( = ?auto_461116 ?auto_461117 ) ) ( not ( = ?auto_461116 ?auto_461118 ) ) ( not ( = ?auto_461116 ?auto_461119 ) ) ( not ( = ?auto_461116 ?auto_461120 ) ) ( not ( = ?auto_461116 ?auto_461121 ) ) ( not ( = ?auto_461117 ?auto_461118 ) ) ( not ( = ?auto_461117 ?auto_461119 ) ) ( not ( = ?auto_461117 ?auto_461120 ) ) ( not ( = ?auto_461117 ?auto_461121 ) ) ( not ( = ?auto_461118 ?auto_461119 ) ) ( not ( = ?auto_461118 ?auto_461120 ) ) ( not ( = ?auto_461118 ?auto_461121 ) ) ( not ( = ?auto_461119 ?auto_461120 ) ) ( not ( = ?auto_461119 ?auto_461121 ) ) ( not ( = ?auto_461120 ?auto_461121 ) ) ( ON ?auto_461119 ?auto_461120 ) ( ON ?auto_461118 ?auto_461119 ) ( CLEAR ?auto_461116 ) ( ON ?auto_461117 ?auto_461118 ) ( CLEAR ?auto_461117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_461111 ?auto_461112 ?auto_461113 ?auto_461114 ?auto_461115 ?auto_461116 ?auto_461117 )
      ( MAKE-10PILE ?auto_461111 ?auto_461112 ?auto_461113 ?auto_461114 ?auto_461115 ?auto_461116 ?auto_461117 ?auto_461118 ?auto_461119 ?auto_461120 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461132 - BLOCK
      ?auto_461133 - BLOCK
      ?auto_461134 - BLOCK
      ?auto_461135 - BLOCK
      ?auto_461136 - BLOCK
      ?auto_461137 - BLOCK
      ?auto_461138 - BLOCK
      ?auto_461139 - BLOCK
      ?auto_461140 - BLOCK
      ?auto_461141 - BLOCK
    )
    :vars
    (
      ?auto_461142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461141 ?auto_461142 ) ( ON-TABLE ?auto_461132 ) ( ON ?auto_461133 ?auto_461132 ) ( ON ?auto_461134 ?auto_461133 ) ( ON ?auto_461135 ?auto_461134 ) ( ON ?auto_461136 ?auto_461135 ) ( not ( = ?auto_461132 ?auto_461133 ) ) ( not ( = ?auto_461132 ?auto_461134 ) ) ( not ( = ?auto_461132 ?auto_461135 ) ) ( not ( = ?auto_461132 ?auto_461136 ) ) ( not ( = ?auto_461132 ?auto_461137 ) ) ( not ( = ?auto_461132 ?auto_461138 ) ) ( not ( = ?auto_461132 ?auto_461139 ) ) ( not ( = ?auto_461132 ?auto_461140 ) ) ( not ( = ?auto_461132 ?auto_461141 ) ) ( not ( = ?auto_461132 ?auto_461142 ) ) ( not ( = ?auto_461133 ?auto_461134 ) ) ( not ( = ?auto_461133 ?auto_461135 ) ) ( not ( = ?auto_461133 ?auto_461136 ) ) ( not ( = ?auto_461133 ?auto_461137 ) ) ( not ( = ?auto_461133 ?auto_461138 ) ) ( not ( = ?auto_461133 ?auto_461139 ) ) ( not ( = ?auto_461133 ?auto_461140 ) ) ( not ( = ?auto_461133 ?auto_461141 ) ) ( not ( = ?auto_461133 ?auto_461142 ) ) ( not ( = ?auto_461134 ?auto_461135 ) ) ( not ( = ?auto_461134 ?auto_461136 ) ) ( not ( = ?auto_461134 ?auto_461137 ) ) ( not ( = ?auto_461134 ?auto_461138 ) ) ( not ( = ?auto_461134 ?auto_461139 ) ) ( not ( = ?auto_461134 ?auto_461140 ) ) ( not ( = ?auto_461134 ?auto_461141 ) ) ( not ( = ?auto_461134 ?auto_461142 ) ) ( not ( = ?auto_461135 ?auto_461136 ) ) ( not ( = ?auto_461135 ?auto_461137 ) ) ( not ( = ?auto_461135 ?auto_461138 ) ) ( not ( = ?auto_461135 ?auto_461139 ) ) ( not ( = ?auto_461135 ?auto_461140 ) ) ( not ( = ?auto_461135 ?auto_461141 ) ) ( not ( = ?auto_461135 ?auto_461142 ) ) ( not ( = ?auto_461136 ?auto_461137 ) ) ( not ( = ?auto_461136 ?auto_461138 ) ) ( not ( = ?auto_461136 ?auto_461139 ) ) ( not ( = ?auto_461136 ?auto_461140 ) ) ( not ( = ?auto_461136 ?auto_461141 ) ) ( not ( = ?auto_461136 ?auto_461142 ) ) ( not ( = ?auto_461137 ?auto_461138 ) ) ( not ( = ?auto_461137 ?auto_461139 ) ) ( not ( = ?auto_461137 ?auto_461140 ) ) ( not ( = ?auto_461137 ?auto_461141 ) ) ( not ( = ?auto_461137 ?auto_461142 ) ) ( not ( = ?auto_461138 ?auto_461139 ) ) ( not ( = ?auto_461138 ?auto_461140 ) ) ( not ( = ?auto_461138 ?auto_461141 ) ) ( not ( = ?auto_461138 ?auto_461142 ) ) ( not ( = ?auto_461139 ?auto_461140 ) ) ( not ( = ?auto_461139 ?auto_461141 ) ) ( not ( = ?auto_461139 ?auto_461142 ) ) ( not ( = ?auto_461140 ?auto_461141 ) ) ( not ( = ?auto_461140 ?auto_461142 ) ) ( not ( = ?auto_461141 ?auto_461142 ) ) ( ON ?auto_461140 ?auto_461141 ) ( ON ?auto_461139 ?auto_461140 ) ( ON ?auto_461138 ?auto_461139 ) ( CLEAR ?auto_461136 ) ( ON ?auto_461137 ?auto_461138 ) ( CLEAR ?auto_461137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_461132 ?auto_461133 ?auto_461134 ?auto_461135 ?auto_461136 ?auto_461137 )
      ( MAKE-10PILE ?auto_461132 ?auto_461133 ?auto_461134 ?auto_461135 ?auto_461136 ?auto_461137 ?auto_461138 ?auto_461139 ?auto_461140 ?auto_461141 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461153 - BLOCK
      ?auto_461154 - BLOCK
      ?auto_461155 - BLOCK
      ?auto_461156 - BLOCK
      ?auto_461157 - BLOCK
      ?auto_461158 - BLOCK
      ?auto_461159 - BLOCK
      ?auto_461160 - BLOCK
      ?auto_461161 - BLOCK
      ?auto_461162 - BLOCK
    )
    :vars
    (
      ?auto_461163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461162 ?auto_461163 ) ( ON-TABLE ?auto_461153 ) ( ON ?auto_461154 ?auto_461153 ) ( ON ?auto_461155 ?auto_461154 ) ( ON ?auto_461156 ?auto_461155 ) ( ON ?auto_461157 ?auto_461156 ) ( not ( = ?auto_461153 ?auto_461154 ) ) ( not ( = ?auto_461153 ?auto_461155 ) ) ( not ( = ?auto_461153 ?auto_461156 ) ) ( not ( = ?auto_461153 ?auto_461157 ) ) ( not ( = ?auto_461153 ?auto_461158 ) ) ( not ( = ?auto_461153 ?auto_461159 ) ) ( not ( = ?auto_461153 ?auto_461160 ) ) ( not ( = ?auto_461153 ?auto_461161 ) ) ( not ( = ?auto_461153 ?auto_461162 ) ) ( not ( = ?auto_461153 ?auto_461163 ) ) ( not ( = ?auto_461154 ?auto_461155 ) ) ( not ( = ?auto_461154 ?auto_461156 ) ) ( not ( = ?auto_461154 ?auto_461157 ) ) ( not ( = ?auto_461154 ?auto_461158 ) ) ( not ( = ?auto_461154 ?auto_461159 ) ) ( not ( = ?auto_461154 ?auto_461160 ) ) ( not ( = ?auto_461154 ?auto_461161 ) ) ( not ( = ?auto_461154 ?auto_461162 ) ) ( not ( = ?auto_461154 ?auto_461163 ) ) ( not ( = ?auto_461155 ?auto_461156 ) ) ( not ( = ?auto_461155 ?auto_461157 ) ) ( not ( = ?auto_461155 ?auto_461158 ) ) ( not ( = ?auto_461155 ?auto_461159 ) ) ( not ( = ?auto_461155 ?auto_461160 ) ) ( not ( = ?auto_461155 ?auto_461161 ) ) ( not ( = ?auto_461155 ?auto_461162 ) ) ( not ( = ?auto_461155 ?auto_461163 ) ) ( not ( = ?auto_461156 ?auto_461157 ) ) ( not ( = ?auto_461156 ?auto_461158 ) ) ( not ( = ?auto_461156 ?auto_461159 ) ) ( not ( = ?auto_461156 ?auto_461160 ) ) ( not ( = ?auto_461156 ?auto_461161 ) ) ( not ( = ?auto_461156 ?auto_461162 ) ) ( not ( = ?auto_461156 ?auto_461163 ) ) ( not ( = ?auto_461157 ?auto_461158 ) ) ( not ( = ?auto_461157 ?auto_461159 ) ) ( not ( = ?auto_461157 ?auto_461160 ) ) ( not ( = ?auto_461157 ?auto_461161 ) ) ( not ( = ?auto_461157 ?auto_461162 ) ) ( not ( = ?auto_461157 ?auto_461163 ) ) ( not ( = ?auto_461158 ?auto_461159 ) ) ( not ( = ?auto_461158 ?auto_461160 ) ) ( not ( = ?auto_461158 ?auto_461161 ) ) ( not ( = ?auto_461158 ?auto_461162 ) ) ( not ( = ?auto_461158 ?auto_461163 ) ) ( not ( = ?auto_461159 ?auto_461160 ) ) ( not ( = ?auto_461159 ?auto_461161 ) ) ( not ( = ?auto_461159 ?auto_461162 ) ) ( not ( = ?auto_461159 ?auto_461163 ) ) ( not ( = ?auto_461160 ?auto_461161 ) ) ( not ( = ?auto_461160 ?auto_461162 ) ) ( not ( = ?auto_461160 ?auto_461163 ) ) ( not ( = ?auto_461161 ?auto_461162 ) ) ( not ( = ?auto_461161 ?auto_461163 ) ) ( not ( = ?auto_461162 ?auto_461163 ) ) ( ON ?auto_461161 ?auto_461162 ) ( ON ?auto_461160 ?auto_461161 ) ( ON ?auto_461159 ?auto_461160 ) ( CLEAR ?auto_461157 ) ( ON ?auto_461158 ?auto_461159 ) ( CLEAR ?auto_461158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_461153 ?auto_461154 ?auto_461155 ?auto_461156 ?auto_461157 ?auto_461158 )
      ( MAKE-10PILE ?auto_461153 ?auto_461154 ?auto_461155 ?auto_461156 ?auto_461157 ?auto_461158 ?auto_461159 ?auto_461160 ?auto_461161 ?auto_461162 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461174 - BLOCK
      ?auto_461175 - BLOCK
      ?auto_461176 - BLOCK
      ?auto_461177 - BLOCK
      ?auto_461178 - BLOCK
      ?auto_461179 - BLOCK
      ?auto_461180 - BLOCK
      ?auto_461181 - BLOCK
      ?auto_461182 - BLOCK
      ?auto_461183 - BLOCK
    )
    :vars
    (
      ?auto_461184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461183 ?auto_461184 ) ( ON-TABLE ?auto_461174 ) ( ON ?auto_461175 ?auto_461174 ) ( ON ?auto_461176 ?auto_461175 ) ( ON ?auto_461177 ?auto_461176 ) ( not ( = ?auto_461174 ?auto_461175 ) ) ( not ( = ?auto_461174 ?auto_461176 ) ) ( not ( = ?auto_461174 ?auto_461177 ) ) ( not ( = ?auto_461174 ?auto_461178 ) ) ( not ( = ?auto_461174 ?auto_461179 ) ) ( not ( = ?auto_461174 ?auto_461180 ) ) ( not ( = ?auto_461174 ?auto_461181 ) ) ( not ( = ?auto_461174 ?auto_461182 ) ) ( not ( = ?auto_461174 ?auto_461183 ) ) ( not ( = ?auto_461174 ?auto_461184 ) ) ( not ( = ?auto_461175 ?auto_461176 ) ) ( not ( = ?auto_461175 ?auto_461177 ) ) ( not ( = ?auto_461175 ?auto_461178 ) ) ( not ( = ?auto_461175 ?auto_461179 ) ) ( not ( = ?auto_461175 ?auto_461180 ) ) ( not ( = ?auto_461175 ?auto_461181 ) ) ( not ( = ?auto_461175 ?auto_461182 ) ) ( not ( = ?auto_461175 ?auto_461183 ) ) ( not ( = ?auto_461175 ?auto_461184 ) ) ( not ( = ?auto_461176 ?auto_461177 ) ) ( not ( = ?auto_461176 ?auto_461178 ) ) ( not ( = ?auto_461176 ?auto_461179 ) ) ( not ( = ?auto_461176 ?auto_461180 ) ) ( not ( = ?auto_461176 ?auto_461181 ) ) ( not ( = ?auto_461176 ?auto_461182 ) ) ( not ( = ?auto_461176 ?auto_461183 ) ) ( not ( = ?auto_461176 ?auto_461184 ) ) ( not ( = ?auto_461177 ?auto_461178 ) ) ( not ( = ?auto_461177 ?auto_461179 ) ) ( not ( = ?auto_461177 ?auto_461180 ) ) ( not ( = ?auto_461177 ?auto_461181 ) ) ( not ( = ?auto_461177 ?auto_461182 ) ) ( not ( = ?auto_461177 ?auto_461183 ) ) ( not ( = ?auto_461177 ?auto_461184 ) ) ( not ( = ?auto_461178 ?auto_461179 ) ) ( not ( = ?auto_461178 ?auto_461180 ) ) ( not ( = ?auto_461178 ?auto_461181 ) ) ( not ( = ?auto_461178 ?auto_461182 ) ) ( not ( = ?auto_461178 ?auto_461183 ) ) ( not ( = ?auto_461178 ?auto_461184 ) ) ( not ( = ?auto_461179 ?auto_461180 ) ) ( not ( = ?auto_461179 ?auto_461181 ) ) ( not ( = ?auto_461179 ?auto_461182 ) ) ( not ( = ?auto_461179 ?auto_461183 ) ) ( not ( = ?auto_461179 ?auto_461184 ) ) ( not ( = ?auto_461180 ?auto_461181 ) ) ( not ( = ?auto_461180 ?auto_461182 ) ) ( not ( = ?auto_461180 ?auto_461183 ) ) ( not ( = ?auto_461180 ?auto_461184 ) ) ( not ( = ?auto_461181 ?auto_461182 ) ) ( not ( = ?auto_461181 ?auto_461183 ) ) ( not ( = ?auto_461181 ?auto_461184 ) ) ( not ( = ?auto_461182 ?auto_461183 ) ) ( not ( = ?auto_461182 ?auto_461184 ) ) ( not ( = ?auto_461183 ?auto_461184 ) ) ( ON ?auto_461182 ?auto_461183 ) ( ON ?auto_461181 ?auto_461182 ) ( ON ?auto_461180 ?auto_461181 ) ( ON ?auto_461179 ?auto_461180 ) ( CLEAR ?auto_461177 ) ( ON ?auto_461178 ?auto_461179 ) ( CLEAR ?auto_461178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_461174 ?auto_461175 ?auto_461176 ?auto_461177 ?auto_461178 )
      ( MAKE-10PILE ?auto_461174 ?auto_461175 ?auto_461176 ?auto_461177 ?auto_461178 ?auto_461179 ?auto_461180 ?auto_461181 ?auto_461182 ?auto_461183 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461195 - BLOCK
      ?auto_461196 - BLOCK
      ?auto_461197 - BLOCK
      ?auto_461198 - BLOCK
      ?auto_461199 - BLOCK
      ?auto_461200 - BLOCK
      ?auto_461201 - BLOCK
      ?auto_461202 - BLOCK
      ?auto_461203 - BLOCK
      ?auto_461204 - BLOCK
    )
    :vars
    (
      ?auto_461205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461204 ?auto_461205 ) ( ON-TABLE ?auto_461195 ) ( ON ?auto_461196 ?auto_461195 ) ( ON ?auto_461197 ?auto_461196 ) ( ON ?auto_461198 ?auto_461197 ) ( not ( = ?auto_461195 ?auto_461196 ) ) ( not ( = ?auto_461195 ?auto_461197 ) ) ( not ( = ?auto_461195 ?auto_461198 ) ) ( not ( = ?auto_461195 ?auto_461199 ) ) ( not ( = ?auto_461195 ?auto_461200 ) ) ( not ( = ?auto_461195 ?auto_461201 ) ) ( not ( = ?auto_461195 ?auto_461202 ) ) ( not ( = ?auto_461195 ?auto_461203 ) ) ( not ( = ?auto_461195 ?auto_461204 ) ) ( not ( = ?auto_461195 ?auto_461205 ) ) ( not ( = ?auto_461196 ?auto_461197 ) ) ( not ( = ?auto_461196 ?auto_461198 ) ) ( not ( = ?auto_461196 ?auto_461199 ) ) ( not ( = ?auto_461196 ?auto_461200 ) ) ( not ( = ?auto_461196 ?auto_461201 ) ) ( not ( = ?auto_461196 ?auto_461202 ) ) ( not ( = ?auto_461196 ?auto_461203 ) ) ( not ( = ?auto_461196 ?auto_461204 ) ) ( not ( = ?auto_461196 ?auto_461205 ) ) ( not ( = ?auto_461197 ?auto_461198 ) ) ( not ( = ?auto_461197 ?auto_461199 ) ) ( not ( = ?auto_461197 ?auto_461200 ) ) ( not ( = ?auto_461197 ?auto_461201 ) ) ( not ( = ?auto_461197 ?auto_461202 ) ) ( not ( = ?auto_461197 ?auto_461203 ) ) ( not ( = ?auto_461197 ?auto_461204 ) ) ( not ( = ?auto_461197 ?auto_461205 ) ) ( not ( = ?auto_461198 ?auto_461199 ) ) ( not ( = ?auto_461198 ?auto_461200 ) ) ( not ( = ?auto_461198 ?auto_461201 ) ) ( not ( = ?auto_461198 ?auto_461202 ) ) ( not ( = ?auto_461198 ?auto_461203 ) ) ( not ( = ?auto_461198 ?auto_461204 ) ) ( not ( = ?auto_461198 ?auto_461205 ) ) ( not ( = ?auto_461199 ?auto_461200 ) ) ( not ( = ?auto_461199 ?auto_461201 ) ) ( not ( = ?auto_461199 ?auto_461202 ) ) ( not ( = ?auto_461199 ?auto_461203 ) ) ( not ( = ?auto_461199 ?auto_461204 ) ) ( not ( = ?auto_461199 ?auto_461205 ) ) ( not ( = ?auto_461200 ?auto_461201 ) ) ( not ( = ?auto_461200 ?auto_461202 ) ) ( not ( = ?auto_461200 ?auto_461203 ) ) ( not ( = ?auto_461200 ?auto_461204 ) ) ( not ( = ?auto_461200 ?auto_461205 ) ) ( not ( = ?auto_461201 ?auto_461202 ) ) ( not ( = ?auto_461201 ?auto_461203 ) ) ( not ( = ?auto_461201 ?auto_461204 ) ) ( not ( = ?auto_461201 ?auto_461205 ) ) ( not ( = ?auto_461202 ?auto_461203 ) ) ( not ( = ?auto_461202 ?auto_461204 ) ) ( not ( = ?auto_461202 ?auto_461205 ) ) ( not ( = ?auto_461203 ?auto_461204 ) ) ( not ( = ?auto_461203 ?auto_461205 ) ) ( not ( = ?auto_461204 ?auto_461205 ) ) ( ON ?auto_461203 ?auto_461204 ) ( ON ?auto_461202 ?auto_461203 ) ( ON ?auto_461201 ?auto_461202 ) ( ON ?auto_461200 ?auto_461201 ) ( CLEAR ?auto_461198 ) ( ON ?auto_461199 ?auto_461200 ) ( CLEAR ?auto_461199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_461195 ?auto_461196 ?auto_461197 ?auto_461198 ?auto_461199 )
      ( MAKE-10PILE ?auto_461195 ?auto_461196 ?auto_461197 ?auto_461198 ?auto_461199 ?auto_461200 ?auto_461201 ?auto_461202 ?auto_461203 ?auto_461204 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461216 - BLOCK
      ?auto_461217 - BLOCK
      ?auto_461218 - BLOCK
      ?auto_461219 - BLOCK
      ?auto_461220 - BLOCK
      ?auto_461221 - BLOCK
      ?auto_461222 - BLOCK
      ?auto_461223 - BLOCK
      ?auto_461224 - BLOCK
      ?auto_461225 - BLOCK
    )
    :vars
    (
      ?auto_461226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461225 ?auto_461226 ) ( ON-TABLE ?auto_461216 ) ( ON ?auto_461217 ?auto_461216 ) ( ON ?auto_461218 ?auto_461217 ) ( not ( = ?auto_461216 ?auto_461217 ) ) ( not ( = ?auto_461216 ?auto_461218 ) ) ( not ( = ?auto_461216 ?auto_461219 ) ) ( not ( = ?auto_461216 ?auto_461220 ) ) ( not ( = ?auto_461216 ?auto_461221 ) ) ( not ( = ?auto_461216 ?auto_461222 ) ) ( not ( = ?auto_461216 ?auto_461223 ) ) ( not ( = ?auto_461216 ?auto_461224 ) ) ( not ( = ?auto_461216 ?auto_461225 ) ) ( not ( = ?auto_461216 ?auto_461226 ) ) ( not ( = ?auto_461217 ?auto_461218 ) ) ( not ( = ?auto_461217 ?auto_461219 ) ) ( not ( = ?auto_461217 ?auto_461220 ) ) ( not ( = ?auto_461217 ?auto_461221 ) ) ( not ( = ?auto_461217 ?auto_461222 ) ) ( not ( = ?auto_461217 ?auto_461223 ) ) ( not ( = ?auto_461217 ?auto_461224 ) ) ( not ( = ?auto_461217 ?auto_461225 ) ) ( not ( = ?auto_461217 ?auto_461226 ) ) ( not ( = ?auto_461218 ?auto_461219 ) ) ( not ( = ?auto_461218 ?auto_461220 ) ) ( not ( = ?auto_461218 ?auto_461221 ) ) ( not ( = ?auto_461218 ?auto_461222 ) ) ( not ( = ?auto_461218 ?auto_461223 ) ) ( not ( = ?auto_461218 ?auto_461224 ) ) ( not ( = ?auto_461218 ?auto_461225 ) ) ( not ( = ?auto_461218 ?auto_461226 ) ) ( not ( = ?auto_461219 ?auto_461220 ) ) ( not ( = ?auto_461219 ?auto_461221 ) ) ( not ( = ?auto_461219 ?auto_461222 ) ) ( not ( = ?auto_461219 ?auto_461223 ) ) ( not ( = ?auto_461219 ?auto_461224 ) ) ( not ( = ?auto_461219 ?auto_461225 ) ) ( not ( = ?auto_461219 ?auto_461226 ) ) ( not ( = ?auto_461220 ?auto_461221 ) ) ( not ( = ?auto_461220 ?auto_461222 ) ) ( not ( = ?auto_461220 ?auto_461223 ) ) ( not ( = ?auto_461220 ?auto_461224 ) ) ( not ( = ?auto_461220 ?auto_461225 ) ) ( not ( = ?auto_461220 ?auto_461226 ) ) ( not ( = ?auto_461221 ?auto_461222 ) ) ( not ( = ?auto_461221 ?auto_461223 ) ) ( not ( = ?auto_461221 ?auto_461224 ) ) ( not ( = ?auto_461221 ?auto_461225 ) ) ( not ( = ?auto_461221 ?auto_461226 ) ) ( not ( = ?auto_461222 ?auto_461223 ) ) ( not ( = ?auto_461222 ?auto_461224 ) ) ( not ( = ?auto_461222 ?auto_461225 ) ) ( not ( = ?auto_461222 ?auto_461226 ) ) ( not ( = ?auto_461223 ?auto_461224 ) ) ( not ( = ?auto_461223 ?auto_461225 ) ) ( not ( = ?auto_461223 ?auto_461226 ) ) ( not ( = ?auto_461224 ?auto_461225 ) ) ( not ( = ?auto_461224 ?auto_461226 ) ) ( not ( = ?auto_461225 ?auto_461226 ) ) ( ON ?auto_461224 ?auto_461225 ) ( ON ?auto_461223 ?auto_461224 ) ( ON ?auto_461222 ?auto_461223 ) ( ON ?auto_461221 ?auto_461222 ) ( ON ?auto_461220 ?auto_461221 ) ( CLEAR ?auto_461218 ) ( ON ?auto_461219 ?auto_461220 ) ( CLEAR ?auto_461219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_461216 ?auto_461217 ?auto_461218 ?auto_461219 )
      ( MAKE-10PILE ?auto_461216 ?auto_461217 ?auto_461218 ?auto_461219 ?auto_461220 ?auto_461221 ?auto_461222 ?auto_461223 ?auto_461224 ?auto_461225 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461237 - BLOCK
      ?auto_461238 - BLOCK
      ?auto_461239 - BLOCK
      ?auto_461240 - BLOCK
      ?auto_461241 - BLOCK
      ?auto_461242 - BLOCK
      ?auto_461243 - BLOCK
      ?auto_461244 - BLOCK
      ?auto_461245 - BLOCK
      ?auto_461246 - BLOCK
    )
    :vars
    (
      ?auto_461247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461246 ?auto_461247 ) ( ON-TABLE ?auto_461237 ) ( ON ?auto_461238 ?auto_461237 ) ( ON ?auto_461239 ?auto_461238 ) ( not ( = ?auto_461237 ?auto_461238 ) ) ( not ( = ?auto_461237 ?auto_461239 ) ) ( not ( = ?auto_461237 ?auto_461240 ) ) ( not ( = ?auto_461237 ?auto_461241 ) ) ( not ( = ?auto_461237 ?auto_461242 ) ) ( not ( = ?auto_461237 ?auto_461243 ) ) ( not ( = ?auto_461237 ?auto_461244 ) ) ( not ( = ?auto_461237 ?auto_461245 ) ) ( not ( = ?auto_461237 ?auto_461246 ) ) ( not ( = ?auto_461237 ?auto_461247 ) ) ( not ( = ?auto_461238 ?auto_461239 ) ) ( not ( = ?auto_461238 ?auto_461240 ) ) ( not ( = ?auto_461238 ?auto_461241 ) ) ( not ( = ?auto_461238 ?auto_461242 ) ) ( not ( = ?auto_461238 ?auto_461243 ) ) ( not ( = ?auto_461238 ?auto_461244 ) ) ( not ( = ?auto_461238 ?auto_461245 ) ) ( not ( = ?auto_461238 ?auto_461246 ) ) ( not ( = ?auto_461238 ?auto_461247 ) ) ( not ( = ?auto_461239 ?auto_461240 ) ) ( not ( = ?auto_461239 ?auto_461241 ) ) ( not ( = ?auto_461239 ?auto_461242 ) ) ( not ( = ?auto_461239 ?auto_461243 ) ) ( not ( = ?auto_461239 ?auto_461244 ) ) ( not ( = ?auto_461239 ?auto_461245 ) ) ( not ( = ?auto_461239 ?auto_461246 ) ) ( not ( = ?auto_461239 ?auto_461247 ) ) ( not ( = ?auto_461240 ?auto_461241 ) ) ( not ( = ?auto_461240 ?auto_461242 ) ) ( not ( = ?auto_461240 ?auto_461243 ) ) ( not ( = ?auto_461240 ?auto_461244 ) ) ( not ( = ?auto_461240 ?auto_461245 ) ) ( not ( = ?auto_461240 ?auto_461246 ) ) ( not ( = ?auto_461240 ?auto_461247 ) ) ( not ( = ?auto_461241 ?auto_461242 ) ) ( not ( = ?auto_461241 ?auto_461243 ) ) ( not ( = ?auto_461241 ?auto_461244 ) ) ( not ( = ?auto_461241 ?auto_461245 ) ) ( not ( = ?auto_461241 ?auto_461246 ) ) ( not ( = ?auto_461241 ?auto_461247 ) ) ( not ( = ?auto_461242 ?auto_461243 ) ) ( not ( = ?auto_461242 ?auto_461244 ) ) ( not ( = ?auto_461242 ?auto_461245 ) ) ( not ( = ?auto_461242 ?auto_461246 ) ) ( not ( = ?auto_461242 ?auto_461247 ) ) ( not ( = ?auto_461243 ?auto_461244 ) ) ( not ( = ?auto_461243 ?auto_461245 ) ) ( not ( = ?auto_461243 ?auto_461246 ) ) ( not ( = ?auto_461243 ?auto_461247 ) ) ( not ( = ?auto_461244 ?auto_461245 ) ) ( not ( = ?auto_461244 ?auto_461246 ) ) ( not ( = ?auto_461244 ?auto_461247 ) ) ( not ( = ?auto_461245 ?auto_461246 ) ) ( not ( = ?auto_461245 ?auto_461247 ) ) ( not ( = ?auto_461246 ?auto_461247 ) ) ( ON ?auto_461245 ?auto_461246 ) ( ON ?auto_461244 ?auto_461245 ) ( ON ?auto_461243 ?auto_461244 ) ( ON ?auto_461242 ?auto_461243 ) ( ON ?auto_461241 ?auto_461242 ) ( CLEAR ?auto_461239 ) ( ON ?auto_461240 ?auto_461241 ) ( CLEAR ?auto_461240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_461237 ?auto_461238 ?auto_461239 ?auto_461240 )
      ( MAKE-10PILE ?auto_461237 ?auto_461238 ?auto_461239 ?auto_461240 ?auto_461241 ?auto_461242 ?auto_461243 ?auto_461244 ?auto_461245 ?auto_461246 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461258 - BLOCK
      ?auto_461259 - BLOCK
      ?auto_461260 - BLOCK
      ?auto_461261 - BLOCK
      ?auto_461262 - BLOCK
      ?auto_461263 - BLOCK
      ?auto_461264 - BLOCK
      ?auto_461265 - BLOCK
      ?auto_461266 - BLOCK
      ?auto_461267 - BLOCK
    )
    :vars
    (
      ?auto_461268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461267 ?auto_461268 ) ( ON-TABLE ?auto_461258 ) ( ON ?auto_461259 ?auto_461258 ) ( not ( = ?auto_461258 ?auto_461259 ) ) ( not ( = ?auto_461258 ?auto_461260 ) ) ( not ( = ?auto_461258 ?auto_461261 ) ) ( not ( = ?auto_461258 ?auto_461262 ) ) ( not ( = ?auto_461258 ?auto_461263 ) ) ( not ( = ?auto_461258 ?auto_461264 ) ) ( not ( = ?auto_461258 ?auto_461265 ) ) ( not ( = ?auto_461258 ?auto_461266 ) ) ( not ( = ?auto_461258 ?auto_461267 ) ) ( not ( = ?auto_461258 ?auto_461268 ) ) ( not ( = ?auto_461259 ?auto_461260 ) ) ( not ( = ?auto_461259 ?auto_461261 ) ) ( not ( = ?auto_461259 ?auto_461262 ) ) ( not ( = ?auto_461259 ?auto_461263 ) ) ( not ( = ?auto_461259 ?auto_461264 ) ) ( not ( = ?auto_461259 ?auto_461265 ) ) ( not ( = ?auto_461259 ?auto_461266 ) ) ( not ( = ?auto_461259 ?auto_461267 ) ) ( not ( = ?auto_461259 ?auto_461268 ) ) ( not ( = ?auto_461260 ?auto_461261 ) ) ( not ( = ?auto_461260 ?auto_461262 ) ) ( not ( = ?auto_461260 ?auto_461263 ) ) ( not ( = ?auto_461260 ?auto_461264 ) ) ( not ( = ?auto_461260 ?auto_461265 ) ) ( not ( = ?auto_461260 ?auto_461266 ) ) ( not ( = ?auto_461260 ?auto_461267 ) ) ( not ( = ?auto_461260 ?auto_461268 ) ) ( not ( = ?auto_461261 ?auto_461262 ) ) ( not ( = ?auto_461261 ?auto_461263 ) ) ( not ( = ?auto_461261 ?auto_461264 ) ) ( not ( = ?auto_461261 ?auto_461265 ) ) ( not ( = ?auto_461261 ?auto_461266 ) ) ( not ( = ?auto_461261 ?auto_461267 ) ) ( not ( = ?auto_461261 ?auto_461268 ) ) ( not ( = ?auto_461262 ?auto_461263 ) ) ( not ( = ?auto_461262 ?auto_461264 ) ) ( not ( = ?auto_461262 ?auto_461265 ) ) ( not ( = ?auto_461262 ?auto_461266 ) ) ( not ( = ?auto_461262 ?auto_461267 ) ) ( not ( = ?auto_461262 ?auto_461268 ) ) ( not ( = ?auto_461263 ?auto_461264 ) ) ( not ( = ?auto_461263 ?auto_461265 ) ) ( not ( = ?auto_461263 ?auto_461266 ) ) ( not ( = ?auto_461263 ?auto_461267 ) ) ( not ( = ?auto_461263 ?auto_461268 ) ) ( not ( = ?auto_461264 ?auto_461265 ) ) ( not ( = ?auto_461264 ?auto_461266 ) ) ( not ( = ?auto_461264 ?auto_461267 ) ) ( not ( = ?auto_461264 ?auto_461268 ) ) ( not ( = ?auto_461265 ?auto_461266 ) ) ( not ( = ?auto_461265 ?auto_461267 ) ) ( not ( = ?auto_461265 ?auto_461268 ) ) ( not ( = ?auto_461266 ?auto_461267 ) ) ( not ( = ?auto_461266 ?auto_461268 ) ) ( not ( = ?auto_461267 ?auto_461268 ) ) ( ON ?auto_461266 ?auto_461267 ) ( ON ?auto_461265 ?auto_461266 ) ( ON ?auto_461264 ?auto_461265 ) ( ON ?auto_461263 ?auto_461264 ) ( ON ?auto_461262 ?auto_461263 ) ( ON ?auto_461261 ?auto_461262 ) ( CLEAR ?auto_461259 ) ( ON ?auto_461260 ?auto_461261 ) ( CLEAR ?auto_461260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_461258 ?auto_461259 ?auto_461260 )
      ( MAKE-10PILE ?auto_461258 ?auto_461259 ?auto_461260 ?auto_461261 ?auto_461262 ?auto_461263 ?auto_461264 ?auto_461265 ?auto_461266 ?auto_461267 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461279 - BLOCK
      ?auto_461280 - BLOCK
      ?auto_461281 - BLOCK
      ?auto_461282 - BLOCK
      ?auto_461283 - BLOCK
      ?auto_461284 - BLOCK
      ?auto_461285 - BLOCK
      ?auto_461286 - BLOCK
      ?auto_461287 - BLOCK
      ?auto_461288 - BLOCK
    )
    :vars
    (
      ?auto_461289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461288 ?auto_461289 ) ( ON-TABLE ?auto_461279 ) ( ON ?auto_461280 ?auto_461279 ) ( not ( = ?auto_461279 ?auto_461280 ) ) ( not ( = ?auto_461279 ?auto_461281 ) ) ( not ( = ?auto_461279 ?auto_461282 ) ) ( not ( = ?auto_461279 ?auto_461283 ) ) ( not ( = ?auto_461279 ?auto_461284 ) ) ( not ( = ?auto_461279 ?auto_461285 ) ) ( not ( = ?auto_461279 ?auto_461286 ) ) ( not ( = ?auto_461279 ?auto_461287 ) ) ( not ( = ?auto_461279 ?auto_461288 ) ) ( not ( = ?auto_461279 ?auto_461289 ) ) ( not ( = ?auto_461280 ?auto_461281 ) ) ( not ( = ?auto_461280 ?auto_461282 ) ) ( not ( = ?auto_461280 ?auto_461283 ) ) ( not ( = ?auto_461280 ?auto_461284 ) ) ( not ( = ?auto_461280 ?auto_461285 ) ) ( not ( = ?auto_461280 ?auto_461286 ) ) ( not ( = ?auto_461280 ?auto_461287 ) ) ( not ( = ?auto_461280 ?auto_461288 ) ) ( not ( = ?auto_461280 ?auto_461289 ) ) ( not ( = ?auto_461281 ?auto_461282 ) ) ( not ( = ?auto_461281 ?auto_461283 ) ) ( not ( = ?auto_461281 ?auto_461284 ) ) ( not ( = ?auto_461281 ?auto_461285 ) ) ( not ( = ?auto_461281 ?auto_461286 ) ) ( not ( = ?auto_461281 ?auto_461287 ) ) ( not ( = ?auto_461281 ?auto_461288 ) ) ( not ( = ?auto_461281 ?auto_461289 ) ) ( not ( = ?auto_461282 ?auto_461283 ) ) ( not ( = ?auto_461282 ?auto_461284 ) ) ( not ( = ?auto_461282 ?auto_461285 ) ) ( not ( = ?auto_461282 ?auto_461286 ) ) ( not ( = ?auto_461282 ?auto_461287 ) ) ( not ( = ?auto_461282 ?auto_461288 ) ) ( not ( = ?auto_461282 ?auto_461289 ) ) ( not ( = ?auto_461283 ?auto_461284 ) ) ( not ( = ?auto_461283 ?auto_461285 ) ) ( not ( = ?auto_461283 ?auto_461286 ) ) ( not ( = ?auto_461283 ?auto_461287 ) ) ( not ( = ?auto_461283 ?auto_461288 ) ) ( not ( = ?auto_461283 ?auto_461289 ) ) ( not ( = ?auto_461284 ?auto_461285 ) ) ( not ( = ?auto_461284 ?auto_461286 ) ) ( not ( = ?auto_461284 ?auto_461287 ) ) ( not ( = ?auto_461284 ?auto_461288 ) ) ( not ( = ?auto_461284 ?auto_461289 ) ) ( not ( = ?auto_461285 ?auto_461286 ) ) ( not ( = ?auto_461285 ?auto_461287 ) ) ( not ( = ?auto_461285 ?auto_461288 ) ) ( not ( = ?auto_461285 ?auto_461289 ) ) ( not ( = ?auto_461286 ?auto_461287 ) ) ( not ( = ?auto_461286 ?auto_461288 ) ) ( not ( = ?auto_461286 ?auto_461289 ) ) ( not ( = ?auto_461287 ?auto_461288 ) ) ( not ( = ?auto_461287 ?auto_461289 ) ) ( not ( = ?auto_461288 ?auto_461289 ) ) ( ON ?auto_461287 ?auto_461288 ) ( ON ?auto_461286 ?auto_461287 ) ( ON ?auto_461285 ?auto_461286 ) ( ON ?auto_461284 ?auto_461285 ) ( ON ?auto_461283 ?auto_461284 ) ( ON ?auto_461282 ?auto_461283 ) ( CLEAR ?auto_461280 ) ( ON ?auto_461281 ?auto_461282 ) ( CLEAR ?auto_461281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_461279 ?auto_461280 ?auto_461281 )
      ( MAKE-10PILE ?auto_461279 ?auto_461280 ?auto_461281 ?auto_461282 ?auto_461283 ?auto_461284 ?auto_461285 ?auto_461286 ?auto_461287 ?auto_461288 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461300 - BLOCK
      ?auto_461301 - BLOCK
      ?auto_461302 - BLOCK
      ?auto_461303 - BLOCK
      ?auto_461304 - BLOCK
      ?auto_461305 - BLOCK
      ?auto_461306 - BLOCK
      ?auto_461307 - BLOCK
      ?auto_461308 - BLOCK
      ?auto_461309 - BLOCK
    )
    :vars
    (
      ?auto_461310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461309 ?auto_461310 ) ( ON-TABLE ?auto_461300 ) ( not ( = ?auto_461300 ?auto_461301 ) ) ( not ( = ?auto_461300 ?auto_461302 ) ) ( not ( = ?auto_461300 ?auto_461303 ) ) ( not ( = ?auto_461300 ?auto_461304 ) ) ( not ( = ?auto_461300 ?auto_461305 ) ) ( not ( = ?auto_461300 ?auto_461306 ) ) ( not ( = ?auto_461300 ?auto_461307 ) ) ( not ( = ?auto_461300 ?auto_461308 ) ) ( not ( = ?auto_461300 ?auto_461309 ) ) ( not ( = ?auto_461300 ?auto_461310 ) ) ( not ( = ?auto_461301 ?auto_461302 ) ) ( not ( = ?auto_461301 ?auto_461303 ) ) ( not ( = ?auto_461301 ?auto_461304 ) ) ( not ( = ?auto_461301 ?auto_461305 ) ) ( not ( = ?auto_461301 ?auto_461306 ) ) ( not ( = ?auto_461301 ?auto_461307 ) ) ( not ( = ?auto_461301 ?auto_461308 ) ) ( not ( = ?auto_461301 ?auto_461309 ) ) ( not ( = ?auto_461301 ?auto_461310 ) ) ( not ( = ?auto_461302 ?auto_461303 ) ) ( not ( = ?auto_461302 ?auto_461304 ) ) ( not ( = ?auto_461302 ?auto_461305 ) ) ( not ( = ?auto_461302 ?auto_461306 ) ) ( not ( = ?auto_461302 ?auto_461307 ) ) ( not ( = ?auto_461302 ?auto_461308 ) ) ( not ( = ?auto_461302 ?auto_461309 ) ) ( not ( = ?auto_461302 ?auto_461310 ) ) ( not ( = ?auto_461303 ?auto_461304 ) ) ( not ( = ?auto_461303 ?auto_461305 ) ) ( not ( = ?auto_461303 ?auto_461306 ) ) ( not ( = ?auto_461303 ?auto_461307 ) ) ( not ( = ?auto_461303 ?auto_461308 ) ) ( not ( = ?auto_461303 ?auto_461309 ) ) ( not ( = ?auto_461303 ?auto_461310 ) ) ( not ( = ?auto_461304 ?auto_461305 ) ) ( not ( = ?auto_461304 ?auto_461306 ) ) ( not ( = ?auto_461304 ?auto_461307 ) ) ( not ( = ?auto_461304 ?auto_461308 ) ) ( not ( = ?auto_461304 ?auto_461309 ) ) ( not ( = ?auto_461304 ?auto_461310 ) ) ( not ( = ?auto_461305 ?auto_461306 ) ) ( not ( = ?auto_461305 ?auto_461307 ) ) ( not ( = ?auto_461305 ?auto_461308 ) ) ( not ( = ?auto_461305 ?auto_461309 ) ) ( not ( = ?auto_461305 ?auto_461310 ) ) ( not ( = ?auto_461306 ?auto_461307 ) ) ( not ( = ?auto_461306 ?auto_461308 ) ) ( not ( = ?auto_461306 ?auto_461309 ) ) ( not ( = ?auto_461306 ?auto_461310 ) ) ( not ( = ?auto_461307 ?auto_461308 ) ) ( not ( = ?auto_461307 ?auto_461309 ) ) ( not ( = ?auto_461307 ?auto_461310 ) ) ( not ( = ?auto_461308 ?auto_461309 ) ) ( not ( = ?auto_461308 ?auto_461310 ) ) ( not ( = ?auto_461309 ?auto_461310 ) ) ( ON ?auto_461308 ?auto_461309 ) ( ON ?auto_461307 ?auto_461308 ) ( ON ?auto_461306 ?auto_461307 ) ( ON ?auto_461305 ?auto_461306 ) ( ON ?auto_461304 ?auto_461305 ) ( ON ?auto_461303 ?auto_461304 ) ( ON ?auto_461302 ?auto_461303 ) ( CLEAR ?auto_461300 ) ( ON ?auto_461301 ?auto_461302 ) ( CLEAR ?auto_461301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_461300 ?auto_461301 )
      ( MAKE-10PILE ?auto_461300 ?auto_461301 ?auto_461302 ?auto_461303 ?auto_461304 ?auto_461305 ?auto_461306 ?auto_461307 ?auto_461308 ?auto_461309 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461321 - BLOCK
      ?auto_461322 - BLOCK
      ?auto_461323 - BLOCK
      ?auto_461324 - BLOCK
      ?auto_461325 - BLOCK
      ?auto_461326 - BLOCK
      ?auto_461327 - BLOCK
      ?auto_461328 - BLOCK
      ?auto_461329 - BLOCK
      ?auto_461330 - BLOCK
    )
    :vars
    (
      ?auto_461331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461330 ?auto_461331 ) ( ON-TABLE ?auto_461321 ) ( not ( = ?auto_461321 ?auto_461322 ) ) ( not ( = ?auto_461321 ?auto_461323 ) ) ( not ( = ?auto_461321 ?auto_461324 ) ) ( not ( = ?auto_461321 ?auto_461325 ) ) ( not ( = ?auto_461321 ?auto_461326 ) ) ( not ( = ?auto_461321 ?auto_461327 ) ) ( not ( = ?auto_461321 ?auto_461328 ) ) ( not ( = ?auto_461321 ?auto_461329 ) ) ( not ( = ?auto_461321 ?auto_461330 ) ) ( not ( = ?auto_461321 ?auto_461331 ) ) ( not ( = ?auto_461322 ?auto_461323 ) ) ( not ( = ?auto_461322 ?auto_461324 ) ) ( not ( = ?auto_461322 ?auto_461325 ) ) ( not ( = ?auto_461322 ?auto_461326 ) ) ( not ( = ?auto_461322 ?auto_461327 ) ) ( not ( = ?auto_461322 ?auto_461328 ) ) ( not ( = ?auto_461322 ?auto_461329 ) ) ( not ( = ?auto_461322 ?auto_461330 ) ) ( not ( = ?auto_461322 ?auto_461331 ) ) ( not ( = ?auto_461323 ?auto_461324 ) ) ( not ( = ?auto_461323 ?auto_461325 ) ) ( not ( = ?auto_461323 ?auto_461326 ) ) ( not ( = ?auto_461323 ?auto_461327 ) ) ( not ( = ?auto_461323 ?auto_461328 ) ) ( not ( = ?auto_461323 ?auto_461329 ) ) ( not ( = ?auto_461323 ?auto_461330 ) ) ( not ( = ?auto_461323 ?auto_461331 ) ) ( not ( = ?auto_461324 ?auto_461325 ) ) ( not ( = ?auto_461324 ?auto_461326 ) ) ( not ( = ?auto_461324 ?auto_461327 ) ) ( not ( = ?auto_461324 ?auto_461328 ) ) ( not ( = ?auto_461324 ?auto_461329 ) ) ( not ( = ?auto_461324 ?auto_461330 ) ) ( not ( = ?auto_461324 ?auto_461331 ) ) ( not ( = ?auto_461325 ?auto_461326 ) ) ( not ( = ?auto_461325 ?auto_461327 ) ) ( not ( = ?auto_461325 ?auto_461328 ) ) ( not ( = ?auto_461325 ?auto_461329 ) ) ( not ( = ?auto_461325 ?auto_461330 ) ) ( not ( = ?auto_461325 ?auto_461331 ) ) ( not ( = ?auto_461326 ?auto_461327 ) ) ( not ( = ?auto_461326 ?auto_461328 ) ) ( not ( = ?auto_461326 ?auto_461329 ) ) ( not ( = ?auto_461326 ?auto_461330 ) ) ( not ( = ?auto_461326 ?auto_461331 ) ) ( not ( = ?auto_461327 ?auto_461328 ) ) ( not ( = ?auto_461327 ?auto_461329 ) ) ( not ( = ?auto_461327 ?auto_461330 ) ) ( not ( = ?auto_461327 ?auto_461331 ) ) ( not ( = ?auto_461328 ?auto_461329 ) ) ( not ( = ?auto_461328 ?auto_461330 ) ) ( not ( = ?auto_461328 ?auto_461331 ) ) ( not ( = ?auto_461329 ?auto_461330 ) ) ( not ( = ?auto_461329 ?auto_461331 ) ) ( not ( = ?auto_461330 ?auto_461331 ) ) ( ON ?auto_461329 ?auto_461330 ) ( ON ?auto_461328 ?auto_461329 ) ( ON ?auto_461327 ?auto_461328 ) ( ON ?auto_461326 ?auto_461327 ) ( ON ?auto_461325 ?auto_461326 ) ( ON ?auto_461324 ?auto_461325 ) ( ON ?auto_461323 ?auto_461324 ) ( CLEAR ?auto_461321 ) ( ON ?auto_461322 ?auto_461323 ) ( CLEAR ?auto_461322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_461321 ?auto_461322 )
      ( MAKE-10PILE ?auto_461321 ?auto_461322 ?auto_461323 ?auto_461324 ?auto_461325 ?auto_461326 ?auto_461327 ?auto_461328 ?auto_461329 ?auto_461330 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461342 - BLOCK
      ?auto_461343 - BLOCK
      ?auto_461344 - BLOCK
      ?auto_461345 - BLOCK
      ?auto_461346 - BLOCK
      ?auto_461347 - BLOCK
      ?auto_461348 - BLOCK
      ?auto_461349 - BLOCK
      ?auto_461350 - BLOCK
      ?auto_461351 - BLOCK
    )
    :vars
    (
      ?auto_461352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461351 ?auto_461352 ) ( not ( = ?auto_461342 ?auto_461343 ) ) ( not ( = ?auto_461342 ?auto_461344 ) ) ( not ( = ?auto_461342 ?auto_461345 ) ) ( not ( = ?auto_461342 ?auto_461346 ) ) ( not ( = ?auto_461342 ?auto_461347 ) ) ( not ( = ?auto_461342 ?auto_461348 ) ) ( not ( = ?auto_461342 ?auto_461349 ) ) ( not ( = ?auto_461342 ?auto_461350 ) ) ( not ( = ?auto_461342 ?auto_461351 ) ) ( not ( = ?auto_461342 ?auto_461352 ) ) ( not ( = ?auto_461343 ?auto_461344 ) ) ( not ( = ?auto_461343 ?auto_461345 ) ) ( not ( = ?auto_461343 ?auto_461346 ) ) ( not ( = ?auto_461343 ?auto_461347 ) ) ( not ( = ?auto_461343 ?auto_461348 ) ) ( not ( = ?auto_461343 ?auto_461349 ) ) ( not ( = ?auto_461343 ?auto_461350 ) ) ( not ( = ?auto_461343 ?auto_461351 ) ) ( not ( = ?auto_461343 ?auto_461352 ) ) ( not ( = ?auto_461344 ?auto_461345 ) ) ( not ( = ?auto_461344 ?auto_461346 ) ) ( not ( = ?auto_461344 ?auto_461347 ) ) ( not ( = ?auto_461344 ?auto_461348 ) ) ( not ( = ?auto_461344 ?auto_461349 ) ) ( not ( = ?auto_461344 ?auto_461350 ) ) ( not ( = ?auto_461344 ?auto_461351 ) ) ( not ( = ?auto_461344 ?auto_461352 ) ) ( not ( = ?auto_461345 ?auto_461346 ) ) ( not ( = ?auto_461345 ?auto_461347 ) ) ( not ( = ?auto_461345 ?auto_461348 ) ) ( not ( = ?auto_461345 ?auto_461349 ) ) ( not ( = ?auto_461345 ?auto_461350 ) ) ( not ( = ?auto_461345 ?auto_461351 ) ) ( not ( = ?auto_461345 ?auto_461352 ) ) ( not ( = ?auto_461346 ?auto_461347 ) ) ( not ( = ?auto_461346 ?auto_461348 ) ) ( not ( = ?auto_461346 ?auto_461349 ) ) ( not ( = ?auto_461346 ?auto_461350 ) ) ( not ( = ?auto_461346 ?auto_461351 ) ) ( not ( = ?auto_461346 ?auto_461352 ) ) ( not ( = ?auto_461347 ?auto_461348 ) ) ( not ( = ?auto_461347 ?auto_461349 ) ) ( not ( = ?auto_461347 ?auto_461350 ) ) ( not ( = ?auto_461347 ?auto_461351 ) ) ( not ( = ?auto_461347 ?auto_461352 ) ) ( not ( = ?auto_461348 ?auto_461349 ) ) ( not ( = ?auto_461348 ?auto_461350 ) ) ( not ( = ?auto_461348 ?auto_461351 ) ) ( not ( = ?auto_461348 ?auto_461352 ) ) ( not ( = ?auto_461349 ?auto_461350 ) ) ( not ( = ?auto_461349 ?auto_461351 ) ) ( not ( = ?auto_461349 ?auto_461352 ) ) ( not ( = ?auto_461350 ?auto_461351 ) ) ( not ( = ?auto_461350 ?auto_461352 ) ) ( not ( = ?auto_461351 ?auto_461352 ) ) ( ON ?auto_461350 ?auto_461351 ) ( ON ?auto_461349 ?auto_461350 ) ( ON ?auto_461348 ?auto_461349 ) ( ON ?auto_461347 ?auto_461348 ) ( ON ?auto_461346 ?auto_461347 ) ( ON ?auto_461345 ?auto_461346 ) ( ON ?auto_461344 ?auto_461345 ) ( ON ?auto_461343 ?auto_461344 ) ( ON ?auto_461342 ?auto_461343 ) ( CLEAR ?auto_461342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_461342 )
      ( MAKE-10PILE ?auto_461342 ?auto_461343 ?auto_461344 ?auto_461345 ?auto_461346 ?auto_461347 ?auto_461348 ?auto_461349 ?auto_461350 ?auto_461351 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_461363 - BLOCK
      ?auto_461364 - BLOCK
      ?auto_461365 - BLOCK
      ?auto_461366 - BLOCK
      ?auto_461367 - BLOCK
      ?auto_461368 - BLOCK
      ?auto_461369 - BLOCK
      ?auto_461370 - BLOCK
      ?auto_461371 - BLOCK
      ?auto_461372 - BLOCK
    )
    :vars
    (
      ?auto_461373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461372 ?auto_461373 ) ( not ( = ?auto_461363 ?auto_461364 ) ) ( not ( = ?auto_461363 ?auto_461365 ) ) ( not ( = ?auto_461363 ?auto_461366 ) ) ( not ( = ?auto_461363 ?auto_461367 ) ) ( not ( = ?auto_461363 ?auto_461368 ) ) ( not ( = ?auto_461363 ?auto_461369 ) ) ( not ( = ?auto_461363 ?auto_461370 ) ) ( not ( = ?auto_461363 ?auto_461371 ) ) ( not ( = ?auto_461363 ?auto_461372 ) ) ( not ( = ?auto_461363 ?auto_461373 ) ) ( not ( = ?auto_461364 ?auto_461365 ) ) ( not ( = ?auto_461364 ?auto_461366 ) ) ( not ( = ?auto_461364 ?auto_461367 ) ) ( not ( = ?auto_461364 ?auto_461368 ) ) ( not ( = ?auto_461364 ?auto_461369 ) ) ( not ( = ?auto_461364 ?auto_461370 ) ) ( not ( = ?auto_461364 ?auto_461371 ) ) ( not ( = ?auto_461364 ?auto_461372 ) ) ( not ( = ?auto_461364 ?auto_461373 ) ) ( not ( = ?auto_461365 ?auto_461366 ) ) ( not ( = ?auto_461365 ?auto_461367 ) ) ( not ( = ?auto_461365 ?auto_461368 ) ) ( not ( = ?auto_461365 ?auto_461369 ) ) ( not ( = ?auto_461365 ?auto_461370 ) ) ( not ( = ?auto_461365 ?auto_461371 ) ) ( not ( = ?auto_461365 ?auto_461372 ) ) ( not ( = ?auto_461365 ?auto_461373 ) ) ( not ( = ?auto_461366 ?auto_461367 ) ) ( not ( = ?auto_461366 ?auto_461368 ) ) ( not ( = ?auto_461366 ?auto_461369 ) ) ( not ( = ?auto_461366 ?auto_461370 ) ) ( not ( = ?auto_461366 ?auto_461371 ) ) ( not ( = ?auto_461366 ?auto_461372 ) ) ( not ( = ?auto_461366 ?auto_461373 ) ) ( not ( = ?auto_461367 ?auto_461368 ) ) ( not ( = ?auto_461367 ?auto_461369 ) ) ( not ( = ?auto_461367 ?auto_461370 ) ) ( not ( = ?auto_461367 ?auto_461371 ) ) ( not ( = ?auto_461367 ?auto_461372 ) ) ( not ( = ?auto_461367 ?auto_461373 ) ) ( not ( = ?auto_461368 ?auto_461369 ) ) ( not ( = ?auto_461368 ?auto_461370 ) ) ( not ( = ?auto_461368 ?auto_461371 ) ) ( not ( = ?auto_461368 ?auto_461372 ) ) ( not ( = ?auto_461368 ?auto_461373 ) ) ( not ( = ?auto_461369 ?auto_461370 ) ) ( not ( = ?auto_461369 ?auto_461371 ) ) ( not ( = ?auto_461369 ?auto_461372 ) ) ( not ( = ?auto_461369 ?auto_461373 ) ) ( not ( = ?auto_461370 ?auto_461371 ) ) ( not ( = ?auto_461370 ?auto_461372 ) ) ( not ( = ?auto_461370 ?auto_461373 ) ) ( not ( = ?auto_461371 ?auto_461372 ) ) ( not ( = ?auto_461371 ?auto_461373 ) ) ( not ( = ?auto_461372 ?auto_461373 ) ) ( ON ?auto_461371 ?auto_461372 ) ( ON ?auto_461370 ?auto_461371 ) ( ON ?auto_461369 ?auto_461370 ) ( ON ?auto_461368 ?auto_461369 ) ( ON ?auto_461367 ?auto_461368 ) ( ON ?auto_461366 ?auto_461367 ) ( ON ?auto_461365 ?auto_461366 ) ( ON ?auto_461364 ?auto_461365 ) ( ON ?auto_461363 ?auto_461364 ) ( CLEAR ?auto_461363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_461363 )
      ( MAKE-10PILE ?auto_461363 ?auto_461364 ?auto_461365 ?auto_461366 ?auto_461367 ?auto_461368 ?auto_461369 ?auto_461370 ?auto_461371 ?auto_461372 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461385 - BLOCK
      ?auto_461386 - BLOCK
      ?auto_461387 - BLOCK
      ?auto_461388 - BLOCK
      ?auto_461389 - BLOCK
      ?auto_461390 - BLOCK
      ?auto_461391 - BLOCK
      ?auto_461392 - BLOCK
      ?auto_461393 - BLOCK
      ?auto_461394 - BLOCK
      ?auto_461395 - BLOCK
    )
    :vars
    (
      ?auto_461396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_461394 ) ( ON ?auto_461395 ?auto_461396 ) ( CLEAR ?auto_461395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_461385 ) ( ON ?auto_461386 ?auto_461385 ) ( ON ?auto_461387 ?auto_461386 ) ( ON ?auto_461388 ?auto_461387 ) ( ON ?auto_461389 ?auto_461388 ) ( ON ?auto_461390 ?auto_461389 ) ( ON ?auto_461391 ?auto_461390 ) ( ON ?auto_461392 ?auto_461391 ) ( ON ?auto_461393 ?auto_461392 ) ( ON ?auto_461394 ?auto_461393 ) ( not ( = ?auto_461385 ?auto_461386 ) ) ( not ( = ?auto_461385 ?auto_461387 ) ) ( not ( = ?auto_461385 ?auto_461388 ) ) ( not ( = ?auto_461385 ?auto_461389 ) ) ( not ( = ?auto_461385 ?auto_461390 ) ) ( not ( = ?auto_461385 ?auto_461391 ) ) ( not ( = ?auto_461385 ?auto_461392 ) ) ( not ( = ?auto_461385 ?auto_461393 ) ) ( not ( = ?auto_461385 ?auto_461394 ) ) ( not ( = ?auto_461385 ?auto_461395 ) ) ( not ( = ?auto_461385 ?auto_461396 ) ) ( not ( = ?auto_461386 ?auto_461387 ) ) ( not ( = ?auto_461386 ?auto_461388 ) ) ( not ( = ?auto_461386 ?auto_461389 ) ) ( not ( = ?auto_461386 ?auto_461390 ) ) ( not ( = ?auto_461386 ?auto_461391 ) ) ( not ( = ?auto_461386 ?auto_461392 ) ) ( not ( = ?auto_461386 ?auto_461393 ) ) ( not ( = ?auto_461386 ?auto_461394 ) ) ( not ( = ?auto_461386 ?auto_461395 ) ) ( not ( = ?auto_461386 ?auto_461396 ) ) ( not ( = ?auto_461387 ?auto_461388 ) ) ( not ( = ?auto_461387 ?auto_461389 ) ) ( not ( = ?auto_461387 ?auto_461390 ) ) ( not ( = ?auto_461387 ?auto_461391 ) ) ( not ( = ?auto_461387 ?auto_461392 ) ) ( not ( = ?auto_461387 ?auto_461393 ) ) ( not ( = ?auto_461387 ?auto_461394 ) ) ( not ( = ?auto_461387 ?auto_461395 ) ) ( not ( = ?auto_461387 ?auto_461396 ) ) ( not ( = ?auto_461388 ?auto_461389 ) ) ( not ( = ?auto_461388 ?auto_461390 ) ) ( not ( = ?auto_461388 ?auto_461391 ) ) ( not ( = ?auto_461388 ?auto_461392 ) ) ( not ( = ?auto_461388 ?auto_461393 ) ) ( not ( = ?auto_461388 ?auto_461394 ) ) ( not ( = ?auto_461388 ?auto_461395 ) ) ( not ( = ?auto_461388 ?auto_461396 ) ) ( not ( = ?auto_461389 ?auto_461390 ) ) ( not ( = ?auto_461389 ?auto_461391 ) ) ( not ( = ?auto_461389 ?auto_461392 ) ) ( not ( = ?auto_461389 ?auto_461393 ) ) ( not ( = ?auto_461389 ?auto_461394 ) ) ( not ( = ?auto_461389 ?auto_461395 ) ) ( not ( = ?auto_461389 ?auto_461396 ) ) ( not ( = ?auto_461390 ?auto_461391 ) ) ( not ( = ?auto_461390 ?auto_461392 ) ) ( not ( = ?auto_461390 ?auto_461393 ) ) ( not ( = ?auto_461390 ?auto_461394 ) ) ( not ( = ?auto_461390 ?auto_461395 ) ) ( not ( = ?auto_461390 ?auto_461396 ) ) ( not ( = ?auto_461391 ?auto_461392 ) ) ( not ( = ?auto_461391 ?auto_461393 ) ) ( not ( = ?auto_461391 ?auto_461394 ) ) ( not ( = ?auto_461391 ?auto_461395 ) ) ( not ( = ?auto_461391 ?auto_461396 ) ) ( not ( = ?auto_461392 ?auto_461393 ) ) ( not ( = ?auto_461392 ?auto_461394 ) ) ( not ( = ?auto_461392 ?auto_461395 ) ) ( not ( = ?auto_461392 ?auto_461396 ) ) ( not ( = ?auto_461393 ?auto_461394 ) ) ( not ( = ?auto_461393 ?auto_461395 ) ) ( not ( = ?auto_461393 ?auto_461396 ) ) ( not ( = ?auto_461394 ?auto_461395 ) ) ( not ( = ?auto_461394 ?auto_461396 ) ) ( not ( = ?auto_461395 ?auto_461396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_461395 ?auto_461396 )
      ( !STACK ?auto_461395 ?auto_461394 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461408 - BLOCK
      ?auto_461409 - BLOCK
      ?auto_461410 - BLOCK
      ?auto_461411 - BLOCK
      ?auto_461412 - BLOCK
      ?auto_461413 - BLOCK
      ?auto_461414 - BLOCK
      ?auto_461415 - BLOCK
      ?auto_461416 - BLOCK
      ?auto_461417 - BLOCK
      ?auto_461418 - BLOCK
    )
    :vars
    (
      ?auto_461419 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_461417 ) ( ON ?auto_461418 ?auto_461419 ) ( CLEAR ?auto_461418 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_461408 ) ( ON ?auto_461409 ?auto_461408 ) ( ON ?auto_461410 ?auto_461409 ) ( ON ?auto_461411 ?auto_461410 ) ( ON ?auto_461412 ?auto_461411 ) ( ON ?auto_461413 ?auto_461412 ) ( ON ?auto_461414 ?auto_461413 ) ( ON ?auto_461415 ?auto_461414 ) ( ON ?auto_461416 ?auto_461415 ) ( ON ?auto_461417 ?auto_461416 ) ( not ( = ?auto_461408 ?auto_461409 ) ) ( not ( = ?auto_461408 ?auto_461410 ) ) ( not ( = ?auto_461408 ?auto_461411 ) ) ( not ( = ?auto_461408 ?auto_461412 ) ) ( not ( = ?auto_461408 ?auto_461413 ) ) ( not ( = ?auto_461408 ?auto_461414 ) ) ( not ( = ?auto_461408 ?auto_461415 ) ) ( not ( = ?auto_461408 ?auto_461416 ) ) ( not ( = ?auto_461408 ?auto_461417 ) ) ( not ( = ?auto_461408 ?auto_461418 ) ) ( not ( = ?auto_461408 ?auto_461419 ) ) ( not ( = ?auto_461409 ?auto_461410 ) ) ( not ( = ?auto_461409 ?auto_461411 ) ) ( not ( = ?auto_461409 ?auto_461412 ) ) ( not ( = ?auto_461409 ?auto_461413 ) ) ( not ( = ?auto_461409 ?auto_461414 ) ) ( not ( = ?auto_461409 ?auto_461415 ) ) ( not ( = ?auto_461409 ?auto_461416 ) ) ( not ( = ?auto_461409 ?auto_461417 ) ) ( not ( = ?auto_461409 ?auto_461418 ) ) ( not ( = ?auto_461409 ?auto_461419 ) ) ( not ( = ?auto_461410 ?auto_461411 ) ) ( not ( = ?auto_461410 ?auto_461412 ) ) ( not ( = ?auto_461410 ?auto_461413 ) ) ( not ( = ?auto_461410 ?auto_461414 ) ) ( not ( = ?auto_461410 ?auto_461415 ) ) ( not ( = ?auto_461410 ?auto_461416 ) ) ( not ( = ?auto_461410 ?auto_461417 ) ) ( not ( = ?auto_461410 ?auto_461418 ) ) ( not ( = ?auto_461410 ?auto_461419 ) ) ( not ( = ?auto_461411 ?auto_461412 ) ) ( not ( = ?auto_461411 ?auto_461413 ) ) ( not ( = ?auto_461411 ?auto_461414 ) ) ( not ( = ?auto_461411 ?auto_461415 ) ) ( not ( = ?auto_461411 ?auto_461416 ) ) ( not ( = ?auto_461411 ?auto_461417 ) ) ( not ( = ?auto_461411 ?auto_461418 ) ) ( not ( = ?auto_461411 ?auto_461419 ) ) ( not ( = ?auto_461412 ?auto_461413 ) ) ( not ( = ?auto_461412 ?auto_461414 ) ) ( not ( = ?auto_461412 ?auto_461415 ) ) ( not ( = ?auto_461412 ?auto_461416 ) ) ( not ( = ?auto_461412 ?auto_461417 ) ) ( not ( = ?auto_461412 ?auto_461418 ) ) ( not ( = ?auto_461412 ?auto_461419 ) ) ( not ( = ?auto_461413 ?auto_461414 ) ) ( not ( = ?auto_461413 ?auto_461415 ) ) ( not ( = ?auto_461413 ?auto_461416 ) ) ( not ( = ?auto_461413 ?auto_461417 ) ) ( not ( = ?auto_461413 ?auto_461418 ) ) ( not ( = ?auto_461413 ?auto_461419 ) ) ( not ( = ?auto_461414 ?auto_461415 ) ) ( not ( = ?auto_461414 ?auto_461416 ) ) ( not ( = ?auto_461414 ?auto_461417 ) ) ( not ( = ?auto_461414 ?auto_461418 ) ) ( not ( = ?auto_461414 ?auto_461419 ) ) ( not ( = ?auto_461415 ?auto_461416 ) ) ( not ( = ?auto_461415 ?auto_461417 ) ) ( not ( = ?auto_461415 ?auto_461418 ) ) ( not ( = ?auto_461415 ?auto_461419 ) ) ( not ( = ?auto_461416 ?auto_461417 ) ) ( not ( = ?auto_461416 ?auto_461418 ) ) ( not ( = ?auto_461416 ?auto_461419 ) ) ( not ( = ?auto_461417 ?auto_461418 ) ) ( not ( = ?auto_461417 ?auto_461419 ) ) ( not ( = ?auto_461418 ?auto_461419 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_461418 ?auto_461419 )
      ( !STACK ?auto_461418 ?auto_461417 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461431 - BLOCK
      ?auto_461432 - BLOCK
      ?auto_461433 - BLOCK
      ?auto_461434 - BLOCK
      ?auto_461435 - BLOCK
      ?auto_461436 - BLOCK
      ?auto_461437 - BLOCK
      ?auto_461438 - BLOCK
      ?auto_461439 - BLOCK
      ?auto_461440 - BLOCK
      ?auto_461441 - BLOCK
    )
    :vars
    (
      ?auto_461442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461441 ?auto_461442 ) ( ON-TABLE ?auto_461431 ) ( ON ?auto_461432 ?auto_461431 ) ( ON ?auto_461433 ?auto_461432 ) ( ON ?auto_461434 ?auto_461433 ) ( ON ?auto_461435 ?auto_461434 ) ( ON ?auto_461436 ?auto_461435 ) ( ON ?auto_461437 ?auto_461436 ) ( ON ?auto_461438 ?auto_461437 ) ( ON ?auto_461439 ?auto_461438 ) ( not ( = ?auto_461431 ?auto_461432 ) ) ( not ( = ?auto_461431 ?auto_461433 ) ) ( not ( = ?auto_461431 ?auto_461434 ) ) ( not ( = ?auto_461431 ?auto_461435 ) ) ( not ( = ?auto_461431 ?auto_461436 ) ) ( not ( = ?auto_461431 ?auto_461437 ) ) ( not ( = ?auto_461431 ?auto_461438 ) ) ( not ( = ?auto_461431 ?auto_461439 ) ) ( not ( = ?auto_461431 ?auto_461440 ) ) ( not ( = ?auto_461431 ?auto_461441 ) ) ( not ( = ?auto_461431 ?auto_461442 ) ) ( not ( = ?auto_461432 ?auto_461433 ) ) ( not ( = ?auto_461432 ?auto_461434 ) ) ( not ( = ?auto_461432 ?auto_461435 ) ) ( not ( = ?auto_461432 ?auto_461436 ) ) ( not ( = ?auto_461432 ?auto_461437 ) ) ( not ( = ?auto_461432 ?auto_461438 ) ) ( not ( = ?auto_461432 ?auto_461439 ) ) ( not ( = ?auto_461432 ?auto_461440 ) ) ( not ( = ?auto_461432 ?auto_461441 ) ) ( not ( = ?auto_461432 ?auto_461442 ) ) ( not ( = ?auto_461433 ?auto_461434 ) ) ( not ( = ?auto_461433 ?auto_461435 ) ) ( not ( = ?auto_461433 ?auto_461436 ) ) ( not ( = ?auto_461433 ?auto_461437 ) ) ( not ( = ?auto_461433 ?auto_461438 ) ) ( not ( = ?auto_461433 ?auto_461439 ) ) ( not ( = ?auto_461433 ?auto_461440 ) ) ( not ( = ?auto_461433 ?auto_461441 ) ) ( not ( = ?auto_461433 ?auto_461442 ) ) ( not ( = ?auto_461434 ?auto_461435 ) ) ( not ( = ?auto_461434 ?auto_461436 ) ) ( not ( = ?auto_461434 ?auto_461437 ) ) ( not ( = ?auto_461434 ?auto_461438 ) ) ( not ( = ?auto_461434 ?auto_461439 ) ) ( not ( = ?auto_461434 ?auto_461440 ) ) ( not ( = ?auto_461434 ?auto_461441 ) ) ( not ( = ?auto_461434 ?auto_461442 ) ) ( not ( = ?auto_461435 ?auto_461436 ) ) ( not ( = ?auto_461435 ?auto_461437 ) ) ( not ( = ?auto_461435 ?auto_461438 ) ) ( not ( = ?auto_461435 ?auto_461439 ) ) ( not ( = ?auto_461435 ?auto_461440 ) ) ( not ( = ?auto_461435 ?auto_461441 ) ) ( not ( = ?auto_461435 ?auto_461442 ) ) ( not ( = ?auto_461436 ?auto_461437 ) ) ( not ( = ?auto_461436 ?auto_461438 ) ) ( not ( = ?auto_461436 ?auto_461439 ) ) ( not ( = ?auto_461436 ?auto_461440 ) ) ( not ( = ?auto_461436 ?auto_461441 ) ) ( not ( = ?auto_461436 ?auto_461442 ) ) ( not ( = ?auto_461437 ?auto_461438 ) ) ( not ( = ?auto_461437 ?auto_461439 ) ) ( not ( = ?auto_461437 ?auto_461440 ) ) ( not ( = ?auto_461437 ?auto_461441 ) ) ( not ( = ?auto_461437 ?auto_461442 ) ) ( not ( = ?auto_461438 ?auto_461439 ) ) ( not ( = ?auto_461438 ?auto_461440 ) ) ( not ( = ?auto_461438 ?auto_461441 ) ) ( not ( = ?auto_461438 ?auto_461442 ) ) ( not ( = ?auto_461439 ?auto_461440 ) ) ( not ( = ?auto_461439 ?auto_461441 ) ) ( not ( = ?auto_461439 ?auto_461442 ) ) ( not ( = ?auto_461440 ?auto_461441 ) ) ( not ( = ?auto_461440 ?auto_461442 ) ) ( not ( = ?auto_461441 ?auto_461442 ) ) ( CLEAR ?auto_461439 ) ( ON ?auto_461440 ?auto_461441 ) ( CLEAR ?auto_461440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_461431 ?auto_461432 ?auto_461433 ?auto_461434 ?auto_461435 ?auto_461436 ?auto_461437 ?auto_461438 ?auto_461439 ?auto_461440 )
      ( MAKE-11PILE ?auto_461431 ?auto_461432 ?auto_461433 ?auto_461434 ?auto_461435 ?auto_461436 ?auto_461437 ?auto_461438 ?auto_461439 ?auto_461440 ?auto_461441 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461454 - BLOCK
      ?auto_461455 - BLOCK
      ?auto_461456 - BLOCK
      ?auto_461457 - BLOCK
      ?auto_461458 - BLOCK
      ?auto_461459 - BLOCK
      ?auto_461460 - BLOCK
      ?auto_461461 - BLOCK
      ?auto_461462 - BLOCK
      ?auto_461463 - BLOCK
      ?auto_461464 - BLOCK
    )
    :vars
    (
      ?auto_461465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461464 ?auto_461465 ) ( ON-TABLE ?auto_461454 ) ( ON ?auto_461455 ?auto_461454 ) ( ON ?auto_461456 ?auto_461455 ) ( ON ?auto_461457 ?auto_461456 ) ( ON ?auto_461458 ?auto_461457 ) ( ON ?auto_461459 ?auto_461458 ) ( ON ?auto_461460 ?auto_461459 ) ( ON ?auto_461461 ?auto_461460 ) ( ON ?auto_461462 ?auto_461461 ) ( not ( = ?auto_461454 ?auto_461455 ) ) ( not ( = ?auto_461454 ?auto_461456 ) ) ( not ( = ?auto_461454 ?auto_461457 ) ) ( not ( = ?auto_461454 ?auto_461458 ) ) ( not ( = ?auto_461454 ?auto_461459 ) ) ( not ( = ?auto_461454 ?auto_461460 ) ) ( not ( = ?auto_461454 ?auto_461461 ) ) ( not ( = ?auto_461454 ?auto_461462 ) ) ( not ( = ?auto_461454 ?auto_461463 ) ) ( not ( = ?auto_461454 ?auto_461464 ) ) ( not ( = ?auto_461454 ?auto_461465 ) ) ( not ( = ?auto_461455 ?auto_461456 ) ) ( not ( = ?auto_461455 ?auto_461457 ) ) ( not ( = ?auto_461455 ?auto_461458 ) ) ( not ( = ?auto_461455 ?auto_461459 ) ) ( not ( = ?auto_461455 ?auto_461460 ) ) ( not ( = ?auto_461455 ?auto_461461 ) ) ( not ( = ?auto_461455 ?auto_461462 ) ) ( not ( = ?auto_461455 ?auto_461463 ) ) ( not ( = ?auto_461455 ?auto_461464 ) ) ( not ( = ?auto_461455 ?auto_461465 ) ) ( not ( = ?auto_461456 ?auto_461457 ) ) ( not ( = ?auto_461456 ?auto_461458 ) ) ( not ( = ?auto_461456 ?auto_461459 ) ) ( not ( = ?auto_461456 ?auto_461460 ) ) ( not ( = ?auto_461456 ?auto_461461 ) ) ( not ( = ?auto_461456 ?auto_461462 ) ) ( not ( = ?auto_461456 ?auto_461463 ) ) ( not ( = ?auto_461456 ?auto_461464 ) ) ( not ( = ?auto_461456 ?auto_461465 ) ) ( not ( = ?auto_461457 ?auto_461458 ) ) ( not ( = ?auto_461457 ?auto_461459 ) ) ( not ( = ?auto_461457 ?auto_461460 ) ) ( not ( = ?auto_461457 ?auto_461461 ) ) ( not ( = ?auto_461457 ?auto_461462 ) ) ( not ( = ?auto_461457 ?auto_461463 ) ) ( not ( = ?auto_461457 ?auto_461464 ) ) ( not ( = ?auto_461457 ?auto_461465 ) ) ( not ( = ?auto_461458 ?auto_461459 ) ) ( not ( = ?auto_461458 ?auto_461460 ) ) ( not ( = ?auto_461458 ?auto_461461 ) ) ( not ( = ?auto_461458 ?auto_461462 ) ) ( not ( = ?auto_461458 ?auto_461463 ) ) ( not ( = ?auto_461458 ?auto_461464 ) ) ( not ( = ?auto_461458 ?auto_461465 ) ) ( not ( = ?auto_461459 ?auto_461460 ) ) ( not ( = ?auto_461459 ?auto_461461 ) ) ( not ( = ?auto_461459 ?auto_461462 ) ) ( not ( = ?auto_461459 ?auto_461463 ) ) ( not ( = ?auto_461459 ?auto_461464 ) ) ( not ( = ?auto_461459 ?auto_461465 ) ) ( not ( = ?auto_461460 ?auto_461461 ) ) ( not ( = ?auto_461460 ?auto_461462 ) ) ( not ( = ?auto_461460 ?auto_461463 ) ) ( not ( = ?auto_461460 ?auto_461464 ) ) ( not ( = ?auto_461460 ?auto_461465 ) ) ( not ( = ?auto_461461 ?auto_461462 ) ) ( not ( = ?auto_461461 ?auto_461463 ) ) ( not ( = ?auto_461461 ?auto_461464 ) ) ( not ( = ?auto_461461 ?auto_461465 ) ) ( not ( = ?auto_461462 ?auto_461463 ) ) ( not ( = ?auto_461462 ?auto_461464 ) ) ( not ( = ?auto_461462 ?auto_461465 ) ) ( not ( = ?auto_461463 ?auto_461464 ) ) ( not ( = ?auto_461463 ?auto_461465 ) ) ( not ( = ?auto_461464 ?auto_461465 ) ) ( CLEAR ?auto_461462 ) ( ON ?auto_461463 ?auto_461464 ) ( CLEAR ?auto_461463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_461454 ?auto_461455 ?auto_461456 ?auto_461457 ?auto_461458 ?auto_461459 ?auto_461460 ?auto_461461 ?auto_461462 ?auto_461463 )
      ( MAKE-11PILE ?auto_461454 ?auto_461455 ?auto_461456 ?auto_461457 ?auto_461458 ?auto_461459 ?auto_461460 ?auto_461461 ?auto_461462 ?auto_461463 ?auto_461464 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461477 - BLOCK
      ?auto_461478 - BLOCK
      ?auto_461479 - BLOCK
      ?auto_461480 - BLOCK
      ?auto_461481 - BLOCK
      ?auto_461482 - BLOCK
      ?auto_461483 - BLOCK
      ?auto_461484 - BLOCK
      ?auto_461485 - BLOCK
      ?auto_461486 - BLOCK
      ?auto_461487 - BLOCK
    )
    :vars
    (
      ?auto_461488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461487 ?auto_461488 ) ( ON-TABLE ?auto_461477 ) ( ON ?auto_461478 ?auto_461477 ) ( ON ?auto_461479 ?auto_461478 ) ( ON ?auto_461480 ?auto_461479 ) ( ON ?auto_461481 ?auto_461480 ) ( ON ?auto_461482 ?auto_461481 ) ( ON ?auto_461483 ?auto_461482 ) ( ON ?auto_461484 ?auto_461483 ) ( not ( = ?auto_461477 ?auto_461478 ) ) ( not ( = ?auto_461477 ?auto_461479 ) ) ( not ( = ?auto_461477 ?auto_461480 ) ) ( not ( = ?auto_461477 ?auto_461481 ) ) ( not ( = ?auto_461477 ?auto_461482 ) ) ( not ( = ?auto_461477 ?auto_461483 ) ) ( not ( = ?auto_461477 ?auto_461484 ) ) ( not ( = ?auto_461477 ?auto_461485 ) ) ( not ( = ?auto_461477 ?auto_461486 ) ) ( not ( = ?auto_461477 ?auto_461487 ) ) ( not ( = ?auto_461477 ?auto_461488 ) ) ( not ( = ?auto_461478 ?auto_461479 ) ) ( not ( = ?auto_461478 ?auto_461480 ) ) ( not ( = ?auto_461478 ?auto_461481 ) ) ( not ( = ?auto_461478 ?auto_461482 ) ) ( not ( = ?auto_461478 ?auto_461483 ) ) ( not ( = ?auto_461478 ?auto_461484 ) ) ( not ( = ?auto_461478 ?auto_461485 ) ) ( not ( = ?auto_461478 ?auto_461486 ) ) ( not ( = ?auto_461478 ?auto_461487 ) ) ( not ( = ?auto_461478 ?auto_461488 ) ) ( not ( = ?auto_461479 ?auto_461480 ) ) ( not ( = ?auto_461479 ?auto_461481 ) ) ( not ( = ?auto_461479 ?auto_461482 ) ) ( not ( = ?auto_461479 ?auto_461483 ) ) ( not ( = ?auto_461479 ?auto_461484 ) ) ( not ( = ?auto_461479 ?auto_461485 ) ) ( not ( = ?auto_461479 ?auto_461486 ) ) ( not ( = ?auto_461479 ?auto_461487 ) ) ( not ( = ?auto_461479 ?auto_461488 ) ) ( not ( = ?auto_461480 ?auto_461481 ) ) ( not ( = ?auto_461480 ?auto_461482 ) ) ( not ( = ?auto_461480 ?auto_461483 ) ) ( not ( = ?auto_461480 ?auto_461484 ) ) ( not ( = ?auto_461480 ?auto_461485 ) ) ( not ( = ?auto_461480 ?auto_461486 ) ) ( not ( = ?auto_461480 ?auto_461487 ) ) ( not ( = ?auto_461480 ?auto_461488 ) ) ( not ( = ?auto_461481 ?auto_461482 ) ) ( not ( = ?auto_461481 ?auto_461483 ) ) ( not ( = ?auto_461481 ?auto_461484 ) ) ( not ( = ?auto_461481 ?auto_461485 ) ) ( not ( = ?auto_461481 ?auto_461486 ) ) ( not ( = ?auto_461481 ?auto_461487 ) ) ( not ( = ?auto_461481 ?auto_461488 ) ) ( not ( = ?auto_461482 ?auto_461483 ) ) ( not ( = ?auto_461482 ?auto_461484 ) ) ( not ( = ?auto_461482 ?auto_461485 ) ) ( not ( = ?auto_461482 ?auto_461486 ) ) ( not ( = ?auto_461482 ?auto_461487 ) ) ( not ( = ?auto_461482 ?auto_461488 ) ) ( not ( = ?auto_461483 ?auto_461484 ) ) ( not ( = ?auto_461483 ?auto_461485 ) ) ( not ( = ?auto_461483 ?auto_461486 ) ) ( not ( = ?auto_461483 ?auto_461487 ) ) ( not ( = ?auto_461483 ?auto_461488 ) ) ( not ( = ?auto_461484 ?auto_461485 ) ) ( not ( = ?auto_461484 ?auto_461486 ) ) ( not ( = ?auto_461484 ?auto_461487 ) ) ( not ( = ?auto_461484 ?auto_461488 ) ) ( not ( = ?auto_461485 ?auto_461486 ) ) ( not ( = ?auto_461485 ?auto_461487 ) ) ( not ( = ?auto_461485 ?auto_461488 ) ) ( not ( = ?auto_461486 ?auto_461487 ) ) ( not ( = ?auto_461486 ?auto_461488 ) ) ( not ( = ?auto_461487 ?auto_461488 ) ) ( ON ?auto_461486 ?auto_461487 ) ( CLEAR ?auto_461484 ) ( ON ?auto_461485 ?auto_461486 ) ( CLEAR ?auto_461485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_461477 ?auto_461478 ?auto_461479 ?auto_461480 ?auto_461481 ?auto_461482 ?auto_461483 ?auto_461484 ?auto_461485 )
      ( MAKE-11PILE ?auto_461477 ?auto_461478 ?auto_461479 ?auto_461480 ?auto_461481 ?auto_461482 ?auto_461483 ?auto_461484 ?auto_461485 ?auto_461486 ?auto_461487 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461500 - BLOCK
      ?auto_461501 - BLOCK
      ?auto_461502 - BLOCK
      ?auto_461503 - BLOCK
      ?auto_461504 - BLOCK
      ?auto_461505 - BLOCK
      ?auto_461506 - BLOCK
      ?auto_461507 - BLOCK
      ?auto_461508 - BLOCK
      ?auto_461509 - BLOCK
      ?auto_461510 - BLOCK
    )
    :vars
    (
      ?auto_461511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461510 ?auto_461511 ) ( ON-TABLE ?auto_461500 ) ( ON ?auto_461501 ?auto_461500 ) ( ON ?auto_461502 ?auto_461501 ) ( ON ?auto_461503 ?auto_461502 ) ( ON ?auto_461504 ?auto_461503 ) ( ON ?auto_461505 ?auto_461504 ) ( ON ?auto_461506 ?auto_461505 ) ( ON ?auto_461507 ?auto_461506 ) ( not ( = ?auto_461500 ?auto_461501 ) ) ( not ( = ?auto_461500 ?auto_461502 ) ) ( not ( = ?auto_461500 ?auto_461503 ) ) ( not ( = ?auto_461500 ?auto_461504 ) ) ( not ( = ?auto_461500 ?auto_461505 ) ) ( not ( = ?auto_461500 ?auto_461506 ) ) ( not ( = ?auto_461500 ?auto_461507 ) ) ( not ( = ?auto_461500 ?auto_461508 ) ) ( not ( = ?auto_461500 ?auto_461509 ) ) ( not ( = ?auto_461500 ?auto_461510 ) ) ( not ( = ?auto_461500 ?auto_461511 ) ) ( not ( = ?auto_461501 ?auto_461502 ) ) ( not ( = ?auto_461501 ?auto_461503 ) ) ( not ( = ?auto_461501 ?auto_461504 ) ) ( not ( = ?auto_461501 ?auto_461505 ) ) ( not ( = ?auto_461501 ?auto_461506 ) ) ( not ( = ?auto_461501 ?auto_461507 ) ) ( not ( = ?auto_461501 ?auto_461508 ) ) ( not ( = ?auto_461501 ?auto_461509 ) ) ( not ( = ?auto_461501 ?auto_461510 ) ) ( not ( = ?auto_461501 ?auto_461511 ) ) ( not ( = ?auto_461502 ?auto_461503 ) ) ( not ( = ?auto_461502 ?auto_461504 ) ) ( not ( = ?auto_461502 ?auto_461505 ) ) ( not ( = ?auto_461502 ?auto_461506 ) ) ( not ( = ?auto_461502 ?auto_461507 ) ) ( not ( = ?auto_461502 ?auto_461508 ) ) ( not ( = ?auto_461502 ?auto_461509 ) ) ( not ( = ?auto_461502 ?auto_461510 ) ) ( not ( = ?auto_461502 ?auto_461511 ) ) ( not ( = ?auto_461503 ?auto_461504 ) ) ( not ( = ?auto_461503 ?auto_461505 ) ) ( not ( = ?auto_461503 ?auto_461506 ) ) ( not ( = ?auto_461503 ?auto_461507 ) ) ( not ( = ?auto_461503 ?auto_461508 ) ) ( not ( = ?auto_461503 ?auto_461509 ) ) ( not ( = ?auto_461503 ?auto_461510 ) ) ( not ( = ?auto_461503 ?auto_461511 ) ) ( not ( = ?auto_461504 ?auto_461505 ) ) ( not ( = ?auto_461504 ?auto_461506 ) ) ( not ( = ?auto_461504 ?auto_461507 ) ) ( not ( = ?auto_461504 ?auto_461508 ) ) ( not ( = ?auto_461504 ?auto_461509 ) ) ( not ( = ?auto_461504 ?auto_461510 ) ) ( not ( = ?auto_461504 ?auto_461511 ) ) ( not ( = ?auto_461505 ?auto_461506 ) ) ( not ( = ?auto_461505 ?auto_461507 ) ) ( not ( = ?auto_461505 ?auto_461508 ) ) ( not ( = ?auto_461505 ?auto_461509 ) ) ( not ( = ?auto_461505 ?auto_461510 ) ) ( not ( = ?auto_461505 ?auto_461511 ) ) ( not ( = ?auto_461506 ?auto_461507 ) ) ( not ( = ?auto_461506 ?auto_461508 ) ) ( not ( = ?auto_461506 ?auto_461509 ) ) ( not ( = ?auto_461506 ?auto_461510 ) ) ( not ( = ?auto_461506 ?auto_461511 ) ) ( not ( = ?auto_461507 ?auto_461508 ) ) ( not ( = ?auto_461507 ?auto_461509 ) ) ( not ( = ?auto_461507 ?auto_461510 ) ) ( not ( = ?auto_461507 ?auto_461511 ) ) ( not ( = ?auto_461508 ?auto_461509 ) ) ( not ( = ?auto_461508 ?auto_461510 ) ) ( not ( = ?auto_461508 ?auto_461511 ) ) ( not ( = ?auto_461509 ?auto_461510 ) ) ( not ( = ?auto_461509 ?auto_461511 ) ) ( not ( = ?auto_461510 ?auto_461511 ) ) ( ON ?auto_461509 ?auto_461510 ) ( CLEAR ?auto_461507 ) ( ON ?auto_461508 ?auto_461509 ) ( CLEAR ?auto_461508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_461500 ?auto_461501 ?auto_461502 ?auto_461503 ?auto_461504 ?auto_461505 ?auto_461506 ?auto_461507 ?auto_461508 )
      ( MAKE-11PILE ?auto_461500 ?auto_461501 ?auto_461502 ?auto_461503 ?auto_461504 ?auto_461505 ?auto_461506 ?auto_461507 ?auto_461508 ?auto_461509 ?auto_461510 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461523 - BLOCK
      ?auto_461524 - BLOCK
      ?auto_461525 - BLOCK
      ?auto_461526 - BLOCK
      ?auto_461527 - BLOCK
      ?auto_461528 - BLOCK
      ?auto_461529 - BLOCK
      ?auto_461530 - BLOCK
      ?auto_461531 - BLOCK
      ?auto_461532 - BLOCK
      ?auto_461533 - BLOCK
    )
    :vars
    (
      ?auto_461534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461533 ?auto_461534 ) ( ON-TABLE ?auto_461523 ) ( ON ?auto_461524 ?auto_461523 ) ( ON ?auto_461525 ?auto_461524 ) ( ON ?auto_461526 ?auto_461525 ) ( ON ?auto_461527 ?auto_461526 ) ( ON ?auto_461528 ?auto_461527 ) ( ON ?auto_461529 ?auto_461528 ) ( not ( = ?auto_461523 ?auto_461524 ) ) ( not ( = ?auto_461523 ?auto_461525 ) ) ( not ( = ?auto_461523 ?auto_461526 ) ) ( not ( = ?auto_461523 ?auto_461527 ) ) ( not ( = ?auto_461523 ?auto_461528 ) ) ( not ( = ?auto_461523 ?auto_461529 ) ) ( not ( = ?auto_461523 ?auto_461530 ) ) ( not ( = ?auto_461523 ?auto_461531 ) ) ( not ( = ?auto_461523 ?auto_461532 ) ) ( not ( = ?auto_461523 ?auto_461533 ) ) ( not ( = ?auto_461523 ?auto_461534 ) ) ( not ( = ?auto_461524 ?auto_461525 ) ) ( not ( = ?auto_461524 ?auto_461526 ) ) ( not ( = ?auto_461524 ?auto_461527 ) ) ( not ( = ?auto_461524 ?auto_461528 ) ) ( not ( = ?auto_461524 ?auto_461529 ) ) ( not ( = ?auto_461524 ?auto_461530 ) ) ( not ( = ?auto_461524 ?auto_461531 ) ) ( not ( = ?auto_461524 ?auto_461532 ) ) ( not ( = ?auto_461524 ?auto_461533 ) ) ( not ( = ?auto_461524 ?auto_461534 ) ) ( not ( = ?auto_461525 ?auto_461526 ) ) ( not ( = ?auto_461525 ?auto_461527 ) ) ( not ( = ?auto_461525 ?auto_461528 ) ) ( not ( = ?auto_461525 ?auto_461529 ) ) ( not ( = ?auto_461525 ?auto_461530 ) ) ( not ( = ?auto_461525 ?auto_461531 ) ) ( not ( = ?auto_461525 ?auto_461532 ) ) ( not ( = ?auto_461525 ?auto_461533 ) ) ( not ( = ?auto_461525 ?auto_461534 ) ) ( not ( = ?auto_461526 ?auto_461527 ) ) ( not ( = ?auto_461526 ?auto_461528 ) ) ( not ( = ?auto_461526 ?auto_461529 ) ) ( not ( = ?auto_461526 ?auto_461530 ) ) ( not ( = ?auto_461526 ?auto_461531 ) ) ( not ( = ?auto_461526 ?auto_461532 ) ) ( not ( = ?auto_461526 ?auto_461533 ) ) ( not ( = ?auto_461526 ?auto_461534 ) ) ( not ( = ?auto_461527 ?auto_461528 ) ) ( not ( = ?auto_461527 ?auto_461529 ) ) ( not ( = ?auto_461527 ?auto_461530 ) ) ( not ( = ?auto_461527 ?auto_461531 ) ) ( not ( = ?auto_461527 ?auto_461532 ) ) ( not ( = ?auto_461527 ?auto_461533 ) ) ( not ( = ?auto_461527 ?auto_461534 ) ) ( not ( = ?auto_461528 ?auto_461529 ) ) ( not ( = ?auto_461528 ?auto_461530 ) ) ( not ( = ?auto_461528 ?auto_461531 ) ) ( not ( = ?auto_461528 ?auto_461532 ) ) ( not ( = ?auto_461528 ?auto_461533 ) ) ( not ( = ?auto_461528 ?auto_461534 ) ) ( not ( = ?auto_461529 ?auto_461530 ) ) ( not ( = ?auto_461529 ?auto_461531 ) ) ( not ( = ?auto_461529 ?auto_461532 ) ) ( not ( = ?auto_461529 ?auto_461533 ) ) ( not ( = ?auto_461529 ?auto_461534 ) ) ( not ( = ?auto_461530 ?auto_461531 ) ) ( not ( = ?auto_461530 ?auto_461532 ) ) ( not ( = ?auto_461530 ?auto_461533 ) ) ( not ( = ?auto_461530 ?auto_461534 ) ) ( not ( = ?auto_461531 ?auto_461532 ) ) ( not ( = ?auto_461531 ?auto_461533 ) ) ( not ( = ?auto_461531 ?auto_461534 ) ) ( not ( = ?auto_461532 ?auto_461533 ) ) ( not ( = ?auto_461532 ?auto_461534 ) ) ( not ( = ?auto_461533 ?auto_461534 ) ) ( ON ?auto_461532 ?auto_461533 ) ( ON ?auto_461531 ?auto_461532 ) ( CLEAR ?auto_461529 ) ( ON ?auto_461530 ?auto_461531 ) ( CLEAR ?auto_461530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_461523 ?auto_461524 ?auto_461525 ?auto_461526 ?auto_461527 ?auto_461528 ?auto_461529 ?auto_461530 )
      ( MAKE-11PILE ?auto_461523 ?auto_461524 ?auto_461525 ?auto_461526 ?auto_461527 ?auto_461528 ?auto_461529 ?auto_461530 ?auto_461531 ?auto_461532 ?auto_461533 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461546 - BLOCK
      ?auto_461547 - BLOCK
      ?auto_461548 - BLOCK
      ?auto_461549 - BLOCK
      ?auto_461550 - BLOCK
      ?auto_461551 - BLOCK
      ?auto_461552 - BLOCK
      ?auto_461553 - BLOCK
      ?auto_461554 - BLOCK
      ?auto_461555 - BLOCK
      ?auto_461556 - BLOCK
    )
    :vars
    (
      ?auto_461557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461556 ?auto_461557 ) ( ON-TABLE ?auto_461546 ) ( ON ?auto_461547 ?auto_461546 ) ( ON ?auto_461548 ?auto_461547 ) ( ON ?auto_461549 ?auto_461548 ) ( ON ?auto_461550 ?auto_461549 ) ( ON ?auto_461551 ?auto_461550 ) ( ON ?auto_461552 ?auto_461551 ) ( not ( = ?auto_461546 ?auto_461547 ) ) ( not ( = ?auto_461546 ?auto_461548 ) ) ( not ( = ?auto_461546 ?auto_461549 ) ) ( not ( = ?auto_461546 ?auto_461550 ) ) ( not ( = ?auto_461546 ?auto_461551 ) ) ( not ( = ?auto_461546 ?auto_461552 ) ) ( not ( = ?auto_461546 ?auto_461553 ) ) ( not ( = ?auto_461546 ?auto_461554 ) ) ( not ( = ?auto_461546 ?auto_461555 ) ) ( not ( = ?auto_461546 ?auto_461556 ) ) ( not ( = ?auto_461546 ?auto_461557 ) ) ( not ( = ?auto_461547 ?auto_461548 ) ) ( not ( = ?auto_461547 ?auto_461549 ) ) ( not ( = ?auto_461547 ?auto_461550 ) ) ( not ( = ?auto_461547 ?auto_461551 ) ) ( not ( = ?auto_461547 ?auto_461552 ) ) ( not ( = ?auto_461547 ?auto_461553 ) ) ( not ( = ?auto_461547 ?auto_461554 ) ) ( not ( = ?auto_461547 ?auto_461555 ) ) ( not ( = ?auto_461547 ?auto_461556 ) ) ( not ( = ?auto_461547 ?auto_461557 ) ) ( not ( = ?auto_461548 ?auto_461549 ) ) ( not ( = ?auto_461548 ?auto_461550 ) ) ( not ( = ?auto_461548 ?auto_461551 ) ) ( not ( = ?auto_461548 ?auto_461552 ) ) ( not ( = ?auto_461548 ?auto_461553 ) ) ( not ( = ?auto_461548 ?auto_461554 ) ) ( not ( = ?auto_461548 ?auto_461555 ) ) ( not ( = ?auto_461548 ?auto_461556 ) ) ( not ( = ?auto_461548 ?auto_461557 ) ) ( not ( = ?auto_461549 ?auto_461550 ) ) ( not ( = ?auto_461549 ?auto_461551 ) ) ( not ( = ?auto_461549 ?auto_461552 ) ) ( not ( = ?auto_461549 ?auto_461553 ) ) ( not ( = ?auto_461549 ?auto_461554 ) ) ( not ( = ?auto_461549 ?auto_461555 ) ) ( not ( = ?auto_461549 ?auto_461556 ) ) ( not ( = ?auto_461549 ?auto_461557 ) ) ( not ( = ?auto_461550 ?auto_461551 ) ) ( not ( = ?auto_461550 ?auto_461552 ) ) ( not ( = ?auto_461550 ?auto_461553 ) ) ( not ( = ?auto_461550 ?auto_461554 ) ) ( not ( = ?auto_461550 ?auto_461555 ) ) ( not ( = ?auto_461550 ?auto_461556 ) ) ( not ( = ?auto_461550 ?auto_461557 ) ) ( not ( = ?auto_461551 ?auto_461552 ) ) ( not ( = ?auto_461551 ?auto_461553 ) ) ( not ( = ?auto_461551 ?auto_461554 ) ) ( not ( = ?auto_461551 ?auto_461555 ) ) ( not ( = ?auto_461551 ?auto_461556 ) ) ( not ( = ?auto_461551 ?auto_461557 ) ) ( not ( = ?auto_461552 ?auto_461553 ) ) ( not ( = ?auto_461552 ?auto_461554 ) ) ( not ( = ?auto_461552 ?auto_461555 ) ) ( not ( = ?auto_461552 ?auto_461556 ) ) ( not ( = ?auto_461552 ?auto_461557 ) ) ( not ( = ?auto_461553 ?auto_461554 ) ) ( not ( = ?auto_461553 ?auto_461555 ) ) ( not ( = ?auto_461553 ?auto_461556 ) ) ( not ( = ?auto_461553 ?auto_461557 ) ) ( not ( = ?auto_461554 ?auto_461555 ) ) ( not ( = ?auto_461554 ?auto_461556 ) ) ( not ( = ?auto_461554 ?auto_461557 ) ) ( not ( = ?auto_461555 ?auto_461556 ) ) ( not ( = ?auto_461555 ?auto_461557 ) ) ( not ( = ?auto_461556 ?auto_461557 ) ) ( ON ?auto_461555 ?auto_461556 ) ( ON ?auto_461554 ?auto_461555 ) ( CLEAR ?auto_461552 ) ( ON ?auto_461553 ?auto_461554 ) ( CLEAR ?auto_461553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_461546 ?auto_461547 ?auto_461548 ?auto_461549 ?auto_461550 ?auto_461551 ?auto_461552 ?auto_461553 )
      ( MAKE-11PILE ?auto_461546 ?auto_461547 ?auto_461548 ?auto_461549 ?auto_461550 ?auto_461551 ?auto_461552 ?auto_461553 ?auto_461554 ?auto_461555 ?auto_461556 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461569 - BLOCK
      ?auto_461570 - BLOCK
      ?auto_461571 - BLOCK
      ?auto_461572 - BLOCK
      ?auto_461573 - BLOCK
      ?auto_461574 - BLOCK
      ?auto_461575 - BLOCK
      ?auto_461576 - BLOCK
      ?auto_461577 - BLOCK
      ?auto_461578 - BLOCK
      ?auto_461579 - BLOCK
    )
    :vars
    (
      ?auto_461580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461579 ?auto_461580 ) ( ON-TABLE ?auto_461569 ) ( ON ?auto_461570 ?auto_461569 ) ( ON ?auto_461571 ?auto_461570 ) ( ON ?auto_461572 ?auto_461571 ) ( ON ?auto_461573 ?auto_461572 ) ( ON ?auto_461574 ?auto_461573 ) ( not ( = ?auto_461569 ?auto_461570 ) ) ( not ( = ?auto_461569 ?auto_461571 ) ) ( not ( = ?auto_461569 ?auto_461572 ) ) ( not ( = ?auto_461569 ?auto_461573 ) ) ( not ( = ?auto_461569 ?auto_461574 ) ) ( not ( = ?auto_461569 ?auto_461575 ) ) ( not ( = ?auto_461569 ?auto_461576 ) ) ( not ( = ?auto_461569 ?auto_461577 ) ) ( not ( = ?auto_461569 ?auto_461578 ) ) ( not ( = ?auto_461569 ?auto_461579 ) ) ( not ( = ?auto_461569 ?auto_461580 ) ) ( not ( = ?auto_461570 ?auto_461571 ) ) ( not ( = ?auto_461570 ?auto_461572 ) ) ( not ( = ?auto_461570 ?auto_461573 ) ) ( not ( = ?auto_461570 ?auto_461574 ) ) ( not ( = ?auto_461570 ?auto_461575 ) ) ( not ( = ?auto_461570 ?auto_461576 ) ) ( not ( = ?auto_461570 ?auto_461577 ) ) ( not ( = ?auto_461570 ?auto_461578 ) ) ( not ( = ?auto_461570 ?auto_461579 ) ) ( not ( = ?auto_461570 ?auto_461580 ) ) ( not ( = ?auto_461571 ?auto_461572 ) ) ( not ( = ?auto_461571 ?auto_461573 ) ) ( not ( = ?auto_461571 ?auto_461574 ) ) ( not ( = ?auto_461571 ?auto_461575 ) ) ( not ( = ?auto_461571 ?auto_461576 ) ) ( not ( = ?auto_461571 ?auto_461577 ) ) ( not ( = ?auto_461571 ?auto_461578 ) ) ( not ( = ?auto_461571 ?auto_461579 ) ) ( not ( = ?auto_461571 ?auto_461580 ) ) ( not ( = ?auto_461572 ?auto_461573 ) ) ( not ( = ?auto_461572 ?auto_461574 ) ) ( not ( = ?auto_461572 ?auto_461575 ) ) ( not ( = ?auto_461572 ?auto_461576 ) ) ( not ( = ?auto_461572 ?auto_461577 ) ) ( not ( = ?auto_461572 ?auto_461578 ) ) ( not ( = ?auto_461572 ?auto_461579 ) ) ( not ( = ?auto_461572 ?auto_461580 ) ) ( not ( = ?auto_461573 ?auto_461574 ) ) ( not ( = ?auto_461573 ?auto_461575 ) ) ( not ( = ?auto_461573 ?auto_461576 ) ) ( not ( = ?auto_461573 ?auto_461577 ) ) ( not ( = ?auto_461573 ?auto_461578 ) ) ( not ( = ?auto_461573 ?auto_461579 ) ) ( not ( = ?auto_461573 ?auto_461580 ) ) ( not ( = ?auto_461574 ?auto_461575 ) ) ( not ( = ?auto_461574 ?auto_461576 ) ) ( not ( = ?auto_461574 ?auto_461577 ) ) ( not ( = ?auto_461574 ?auto_461578 ) ) ( not ( = ?auto_461574 ?auto_461579 ) ) ( not ( = ?auto_461574 ?auto_461580 ) ) ( not ( = ?auto_461575 ?auto_461576 ) ) ( not ( = ?auto_461575 ?auto_461577 ) ) ( not ( = ?auto_461575 ?auto_461578 ) ) ( not ( = ?auto_461575 ?auto_461579 ) ) ( not ( = ?auto_461575 ?auto_461580 ) ) ( not ( = ?auto_461576 ?auto_461577 ) ) ( not ( = ?auto_461576 ?auto_461578 ) ) ( not ( = ?auto_461576 ?auto_461579 ) ) ( not ( = ?auto_461576 ?auto_461580 ) ) ( not ( = ?auto_461577 ?auto_461578 ) ) ( not ( = ?auto_461577 ?auto_461579 ) ) ( not ( = ?auto_461577 ?auto_461580 ) ) ( not ( = ?auto_461578 ?auto_461579 ) ) ( not ( = ?auto_461578 ?auto_461580 ) ) ( not ( = ?auto_461579 ?auto_461580 ) ) ( ON ?auto_461578 ?auto_461579 ) ( ON ?auto_461577 ?auto_461578 ) ( ON ?auto_461576 ?auto_461577 ) ( CLEAR ?auto_461574 ) ( ON ?auto_461575 ?auto_461576 ) ( CLEAR ?auto_461575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_461569 ?auto_461570 ?auto_461571 ?auto_461572 ?auto_461573 ?auto_461574 ?auto_461575 )
      ( MAKE-11PILE ?auto_461569 ?auto_461570 ?auto_461571 ?auto_461572 ?auto_461573 ?auto_461574 ?auto_461575 ?auto_461576 ?auto_461577 ?auto_461578 ?auto_461579 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461592 - BLOCK
      ?auto_461593 - BLOCK
      ?auto_461594 - BLOCK
      ?auto_461595 - BLOCK
      ?auto_461596 - BLOCK
      ?auto_461597 - BLOCK
      ?auto_461598 - BLOCK
      ?auto_461599 - BLOCK
      ?auto_461600 - BLOCK
      ?auto_461601 - BLOCK
      ?auto_461602 - BLOCK
    )
    :vars
    (
      ?auto_461603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461602 ?auto_461603 ) ( ON-TABLE ?auto_461592 ) ( ON ?auto_461593 ?auto_461592 ) ( ON ?auto_461594 ?auto_461593 ) ( ON ?auto_461595 ?auto_461594 ) ( ON ?auto_461596 ?auto_461595 ) ( ON ?auto_461597 ?auto_461596 ) ( not ( = ?auto_461592 ?auto_461593 ) ) ( not ( = ?auto_461592 ?auto_461594 ) ) ( not ( = ?auto_461592 ?auto_461595 ) ) ( not ( = ?auto_461592 ?auto_461596 ) ) ( not ( = ?auto_461592 ?auto_461597 ) ) ( not ( = ?auto_461592 ?auto_461598 ) ) ( not ( = ?auto_461592 ?auto_461599 ) ) ( not ( = ?auto_461592 ?auto_461600 ) ) ( not ( = ?auto_461592 ?auto_461601 ) ) ( not ( = ?auto_461592 ?auto_461602 ) ) ( not ( = ?auto_461592 ?auto_461603 ) ) ( not ( = ?auto_461593 ?auto_461594 ) ) ( not ( = ?auto_461593 ?auto_461595 ) ) ( not ( = ?auto_461593 ?auto_461596 ) ) ( not ( = ?auto_461593 ?auto_461597 ) ) ( not ( = ?auto_461593 ?auto_461598 ) ) ( not ( = ?auto_461593 ?auto_461599 ) ) ( not ( = ?auto_461593 ?auto_461600 ) ) ( not ( = ?auto_461593 ?auto_461601 ) ) ( not ( = ?auto_461593 ?auto_461602 ) ) ( not ( = ?auto_461593 ?auto_461603 ) ) ( not ( = ?auto_461594 ?auto_461595 ) ) ( not ( = ?auto_461594 ?auto_461596 ) ) ( not ( = ?auto_461594 ?auto_461597 ) ) ( not ( = ?auto_461594 ?auto_461598 ) ) ( not ( = ?auto_461594 ?auto_461599 ) ) ( not ( = ?auto_461594 ?auto_461600 ) ) ( not ( = ?auto_461594 ?auto_461601 ) ) ( not ( = ?auto_461594 ?auto_461602 ) ) ( not ( = ?auto_461594 ?auto_461603 ) ) ( not ( = ?auto_461595 ?auto_461596 ) ) ( not ( = ?auto_461595 ?auto_461597 ) ) ( not ( = ?auto_461595 ?auto_461598 ) ) ( not ( = ?auto_461595 ?auto_461599 ) ) ( not ( = ?auto_461595 ?auto_461600 ) ) ( not ( = ?auto_461595 ?auto_461601 ) ) ( not ( = ?auto_461595 ?auto_461602 ) ) ( not ( = ?auto_461595 ?auto_461603 ) ) ( not ( = ?auto_461596 ?auto_461597 ) ) ( not ( = ?auto_461596 ?auto_461598 ) ) ( not ( = ?auto_461596 ?auto_461599 ) ) ( not ( = ?auto_461596 ?auto_461600 ) ) ( not ( = ?auto_461596 ?auto_461601 ) ) ( not ( = ?auto_461596 ?auto_461602 ) ) ( not ( = ?auto_461596 ?auto_461603 ) ) ( not ( = ?auto_461597 ?auto_461598 ) ) ( not ( = ?auto_461597 ?auto_461599 ) ) ( not ( = ?auto_461597 ?auto_461600 ) ) ( not ( = ?auto_461597 ?auto_461601 ) ) ( not ( = ?auto_461597 ?auto_461602 ) ) ( not ( = ?auto_461597 ?auto_461603 ) ) ( not ( = ?auto_461598 ?auto_461599 ) ) ( not ( = ?auto_461598 ?auto_461600 ) ) ( not ( = ?auto_461598 ?auto_461601 ) ) ( not ( = ?auto_461598 ?auto_461602 ) ) ( not ( = ?auto_461598 ?auto_461603 ) ) ( not ( = ?auto_461599 ?auto_461600 ) ) ( not ( = ?auto_461599 ?auto_461601 ) ) ( not ( = ?auto_461599 ?auto_461602 ) ) ( not ( = ?auto_461599 ?auto_461603 ) ) ( not ( = ?auto_461600 ?auto_461601 ) ) ( not ( = ?auto_461600 ?auto_461602 ) ) ( not ( = ?auto_461600 ?auto_461603 ) ) ( not ( = ?auto_461601 ?auto_461602 ) ) ( not ( = ?auto_461601 ?auto_461603 ) ) ( not ( = ?auto_461602 ?auto_461603 ) ) ( ON ?auto_461601 ?auto_461602 ) ( ON ?auto_461600 ?auto_461601 ) ( ON ?auto_461599 ?auto_461600 ) ( CLEAR ?auto_461597 ) ( ON ?auto_461598 ?auto_461599 ) ( CLEAR ?auto_461598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_461592 ?auto_461593 ?auto_461594 ?auto_461595 ?auto_461596 ?auto_461597 ?auto_461598 )
      ( MAKE-11PILE ?auto_461592 ?auto_461593 ?auto_461594 ?auto_461595 ?auto_461596 ?auto_461597 ?auto_461598 ?auto_461599 ?auto_461600 ?auto_461601 ?auto_461602 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461615 - BLOCK
      ?auto_461616 - BLOCK
      ?auto_461617 - BLOCK
      ?auto_461618 - BLOCK
      ?auto_461619 - BLOCK
      ?auto_461620 - BLOCK
      ?auto_461621 - BLOCK
      ?auto_461622 - BLOCK
      ?auto_461623 - BLOCK
      ?auto_461624 - BLOCK
      ?auto_461625 - BLOCK
    )
    :vars
    (
      ?auto_461626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461625 ?auto_461626 ) ( ON-TABLE ?auto_461615 ) ( ON ?auto_461616 ?auto_461615 ) ( ON ?auto_461617 ?auto_461616 ) ( ON ?auto_461618 ?auto_461617 ) ( ON ?auto_461619 ?auto_461618 ) ( not ( = ?auto_461615 ?auto_461616 ) ) ( not ( = ?auto_461615 ?auto_461617 ) ) ( not ( = ?auto_461615 ?auto_461618 ) ) ( not ( = ?auto_461615 ?auto_461619 ) ) ( not ( = ?auto_461615 ?auto_461620 ) ) ( not ( = ?auto_461615 ?auto_461621 ) ) ( not ( = ?auto_461615 ?auto_461622 ) ) ( not ( = ?auto_461615 ?auto_461623 ) ) ( not ( = ?auto_461615 ?auto_461624 ) ) ( not ( = ?auto_461615 ?auto_461625 ) ) ( not ( = ?auto_461615 ?auto_461626 ) ) ( not ( = ?auto_461616 ?auto_461617 ) ) ( not ( = ?auto_461616 ?auto_461618 ) ) ( not ( = ?auto_461616 ?auto_461619 ) ) ( not ( = ?auto_461616 ?auto_461620 ) ) ( not ( = ?auto_461616 ?auto_461621 ) ) ( not ( = ?auto_461616 ?auto_461622 ) ) ( not ( = ?auto_461616 ?auto_461623 ) ) ( not ( = ?auto_461616 ?auto_461624 ) ) ( not ( = ?auto_461616 ?auto_461625 ) ) ( not ( = ?auto_461616 ?auto_461626 ) ) ( not ( = ?auto_461617 ?auto_461618 ) ) ( not ( = ?auto_461617 ?auto_461619 ) ) ( not ( = ?auto_461617 ?auto_461620 ) ) ( not ( = ?auto_461617 ?auto_461621 ) ) ( not ( = ?auto_461617 ?auto_461622 ) ) ( not ( = ?auto_461617 ?auto_461623 ) ) ( not ( = ?auto_461617 ?auto_461624 ) ) ( not ( = ?auto_461617 ?auto_461625 ) ) ( not ( = ?auto_461617 ?auto_461626 ) ) ( not ( = ?auto_461618 ?auto_461619 ) ) ( not ( = ?auto_461618 ?auto_461620 ) ) ( not ( = ?auto_461618 ?auto_461621 ) ) ( not ( = ?auto_461618 ?auto_461622 ) ) ( not ( = ?auto_461618 ?auto_461623 ) ) ( not ( = ?auto_461618 ?auto_461624 ) ) ( not ( = ?auto_461618 ?auto_461625 ) ) ( not ( = ?auto_461618 ?auto_461626 ) ) ( not ( = ?auto_461619 ?auto_461620 ) ) ( not ( = ?auto_461619 ?auto_461621 ) ) ( not ( = ?auto_461619 ?auto_461622 ) ) ( not ( = ?auto_461619 ?auto_461623 ) ) ( not ( = ?auto_461619 ?auto_461624 ) ) ( not ( = ?auto_461619 ?auto_461625 ) ) ( not ( = ?auto_461619 ?auto_461626 ) ) ( not ( = ?auto_461620 ?auto_461621 ) ) ( not ( = ?auto_461620 ?auto_461622 ) ) ( not ( = ?auto_461620 ?auto_461623 ) ) ( not ( = ?auto_461620 ?auto_461624 ) ) ( not ( = ?auto_461620 ?auto_461625 ) ) ( not ( = ?auto_461620 ?auto_461626 ) ) ( not ( = ?auto_461621 ?auto_461622 ) ) ( not ( = ?auto_461621 ?auto_461623 ) ) ( not ( = ?auto_461621 ?auto_461624 ) ) ( not ( = ?auto_461621 ?auto_461625 ) ) ( not ( = ?auto_461621 ?auto_461626 ) ) ( not ( = ?auto_461622 ?auto_461623 ) ) ( not ( = ?auto_461622 ?auto_461624 ) ) ( not ( = ?auto_461622 ?auto_461625 ) ) ( not ( = ?auto_461622 ?auto_461626 ) ) ( not ( = ?auto_461623 ?auto_461624 ) ) ( not ( = ?auto_461623 ?auto_461625 ) ) ( not ( = ?auto_461623 ?auto_461626 ) ) ( not ( = ?auto_461624 ?auto_461625 ) ) ( not ( = ?auto_461624 ?auto_461626 ) ) ( not ( = ?auto_461625 ?auto_461626 ) ) ( ON ?auto_461624 ?auto_461625 ) ( ON ?auto_461623 ?auto_461624 ) ( ON ?auto_461622 ?auto_461623 ) ( ON ?auto_461621 ?auto_461622 ) ( CLEAR ?auto_461619 ) ( ON ?auto_461620 ?auto_461621 ) ( CLEAR ?auto_461620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_461615 ?auto_461616 ?auto_461617 ?auto_461618 ?auto_461619 ?auto_461620 )
      ( MAKE-11PILE ?auto_461615 ?auto_461616 ?auto_461617 ?auto_461618 ?auto_461619 ?auto_461620 ?auto_461621 ?auto_461622 ?auto_461623 ?auto_461624 ?auto_461625 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461638 - BLOCK
      ?auto_461639 - BLOCK
      ?auto_461640 - BLOCK
      ?auto_461641 - BLOCK
      ?auto_461642 - BLOCK
      ?auto_461643 - BLOCK
      ?auto_461644 - BLOCK
      ?auto_461645 - BLOCK
      ?auto_461646 - BLOCK
      ?auto_461647 - BLOCK
      ?auto_461648 - BLOCK
    )
    :vars
    (
      ?auto_461649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461648 ?auto_461649 ) ( ON-TABLE ?auto_461638 ) ( ON ?auto_461639 ?auto_461638 ) ( ON ?auto_461640 ?auto_461639 ) ( ON ?auto_461641 ?auto_461640 ) ( ON ?auto_461642 ?auto_461641 ) ( not ( = ?auto_461638 ?auto_461639 ) ) ( not ( = ?auto_461638 ?auto_461640 ) ) ( not ( = ?auto_461638 ?auto_461641 ) ) ( not ( = ?auto_461638 ?auto_461642 ) ) ( not ( = ?auto_461638 ?auto_461643 ) ) ( not ( = ?auto_461638 ?auto_461644 ) ) ( not ( = ?auto_461638 ?auto_461645 ) ) ( not ( = ?auto_461638 ?auto_461646 ) ) ( not ( = ?auto_461638 ?auto_461647 ) ) ( not ( = ?auto_461638 ?auto_461648 ) ) ( not ( = ?auto_461638 ?auto_461649 ) ) ( not ( = ?auto_461639 ?auto_461640 ) ) ( not ( = ?auto_461639 ?auto_461641 ) ) ( not ( = ?auto_461639 ?auto_461642 ) ) ( not ( = ?auto_461639 ?auto_461643 ) ) ( not ( = ?auto_461639 ?auto_461644 ) ) ( not ( = ?auto_461639 ?auto_461645 ) ) ( not ( = ?auto_461639 ?auto_461646 ) ) ( not ( = ?auto_461639 ?auto_461647 ) ) ( not ( = ?auto_461639 ?auto_461648 ) ) ( not ( = ?auto_461639 ?auto_461649 ) ) ( not ( = ?auto_461640 ?auto_461641 ) ) ( not ( = ?auto_461640 ?auto_461642 ) ) ( not ( = ?auto_461640 ?auto_461643 ) ) ( not ( = ?auto_461640 ?auto_461644 ) ) ( not ( = ?auto_461640 ?auto_461645 ) ) ( not ( = ?auto_461640 ?auto_461646 ) ) ( not ( = ?auto_461640 ?auto_461647 ) ) ( not ( = ?auto_461640 ?auto_461648 ) ) ( not ( = ?auto_461640 ?auto_461649 ) ) ( not ( = ?auto_461641 ?auto_461642 ) ) ( not ( = ?auto_461641 ?auto_461643 ) ) ( not ( = ?auto_461641 ?auto_461644 ) ) ( not ( = ?auto_461641 ?auto_461645 ) ) ( not ( = ?auto_461641 ?auto_461646 ) ) ( not ( = ?auto_461641 ?auto_461647 ) ) ( not ( = ?auto_461641 ?auto_461648 ) ) ( not ( = ?auto_461641 ?auto_461649 ) ) ( not ( = ?auto_461642 ?auto_461643 ) ) ( not ( = ?auto_461642 ?auto_461644 ) ) ( not ( = ?auto_461642 ?auto_461645 ) ) ( not ( = ?auto_461642 ?auto_461646 ) ) ( not ( = ?auto_461642 ?auto_461647 ) ) ( not ( = ?auto_461642 ?auto_461648 ) ) ( not ( = ?auto_461642 ?auto_461649 ) ) ( not ( = ?auto_461643 ?auto_461644 ) ) ( not ( = ?auto_461643 ?auto_461645 ) ) ( not ( = ?auto_461643 ?auto_461646 ) ) ( not ( = ?auto_461643 ?auto_461647 ) ) ( not ( = ?auto_461643 ?auto_461648 ) ) ( not ( = ?auto_461643 ?auto_461649 ) ) ( not ( = ?auto_461644 ?auto_461645 ) ) ( not ( = ?auto_461644 ?auto_461646 ) ) ( not ( = ?auto_461644 ?auto_461647 ) ) ( not ( = ?auto_461644 ?auto_461648 ) ) ( not ( = ?auto_461644 ?auto_461649 ) ) ( not ( = ?auto_461645 ?auto_461646 ) ) ( not ( = ?auto_461645 ?auto_461647 ) ) ( not ( = ?auto_461645 ?auto_461648 ) ) ( not ( = ?auto_461645 ?auto_461649 ) ) ( not ( = ?auto_461646 ?auto_461647 ) ) ( not ( = ?auto_461646 ?auto_461648 ) ) ( not ( = ?auto_461646 ?auto_461649 ) ) ( not ( = ?auto_461647 ?auto_461648 ) ) ( not ( = ?auto_461647 ?auto_461649 ) ) ( not ( = ?auto_461648 ?auto_461649 ) ) ( ON ?auto_461647 ?auto_461648 ) ( ON ?auto_461646 ?auto_461647 ) ( ON ?auto_461645 ?auto_461646 ) ( ON ?auto_461644 ?auto_461645 ) ( CLEAR ?auto_461642 ) ( ON ?auto_461643 ?auto_461644 ) ( CLEAR ?auto_461643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_461638 ?auto_461639 ?auto_461640 ?auto_461641 ?auto_461642 ?auto_461643 )
      ( MAKE-11PILE ?auto_461638 ?auto_461639 ?auto_461640 ?auto_461641 ?auto_461642 ?auto_461643 ?auto_461644 ?auto_461645 ?auto_461646 ?auto_461647 ?auto_461648 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461661 - BLOCK
      ?auto_461662 - BLOCK
      ?auto_461663 - BLOCK
      ?auto_461664 - BLOCK
      ?auto_461665 - BLOCK
      ?auto_461666 - BLOCK
      ?auto_461667 - BLOCK
      ?auto_461668 - BLOCK
      ?auto_461669 - BLOCK
      ?auto_461670 - BLOCK
      ?auto_461671 - BLOCK
    )
    :vars
    (
      ?auto_461672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461671 ?auto_461672 ) ( ON-TABLE ?auto_461661 ) ( ON ?auto_461662 ?auto_461661 ) ( ON ?auto_461663 ?auto_461662 ) ( ON ?auto_461664 ?auto_461663 ) ( not ( = ?auto_461661 ?auto_461662 ) ) ( not ( = ?auto_461661 ?auto_461663 ) ) ( not ( = ?auto_461661 ?auto_461664 ) ) ( not ( = ?auto_461661 ?auto_461665 ) ) ( not ( = ?auto_461661 ?auto_461666 ) ) ( not ( = ?auto_461661 ?auto_461667 ) ) ( not ( = ?auto_461661 ?auto_461668 ) ) ( not ( = ?auto_461661 ?auto_461669 ) ) ( not ( = ?auto_461661 ?auto_461670 ) ) ( not ( = ?auto_461661 ?auto_461671 ) ) ( not ( = ?auto_461661 ?auto_461672 ) ) ( not ( = ?auto_461662 ?auto_461663 ) ) ( not ( = ?auto_461662 ?auto_461664 ) ) ( not ( = ?auto_461662 ?auto_461665 ) ) ( not ( = ?auto_461662 ?auto_461666 ) ) ( not ( = ?auto_461662 ?auto_461667 ) ) ( not ( = ?auto_461662 ?auto_461668 ) ) ( not ( = ?auto_461662 ?auto_461669 ) ) ( not ( = ?auto_461662 ?auto_461670 ) ) ( not ( = ?auto_461662 ?auto_461671 ) ) ( not ( = ?auto_461662 ?auto_461672 ) ) ( not ( = ?auto_461663 ?auto_461664 ) ) ( not ( = ?auto_461663 ?auto_461665 ) ) ( not ( = ?auto_461663 ?auto_461666 ) ) ( not ( = ?auto_461663 ?auto_461667 ) ) ( not ( = ?auto_461663 ?auto_461668 ) ) ( not ( = ?auto_461663 ?auto_461669 ) ) ( not ( = ?auto_461663 ?auto_461670 ) ) ( not ( = ?auto_461663 ?auto_461671 ) ) ( not ( = ?auto_461663 ?auto_461672 ) ) ( not ( = ?auto_461664 ?auto_461665 ) ) ( not ( = ?auto_461664 ?auto_461666 ) ) ( not ( = ?auto_461664 ?auto_461667 ) ) ( not ( = ?auto_461664 ?auto_461668 ) ) ( not ( = ?auto_461664 ?auto_461669 ) ) ( not ( = ?auto_461664 ?auto_461670 ) ) ( not ( = ?auto_461664 ?auto_461671 ) ) ( not ( = ?auto_461664 ?auto_461672 ) ) ( not ( = ?auto_461665 ?auto_461666 ) ) ( not ( = ?auto_461665 ?auto_461667 ) ) ( not ( = ?auto_461665 ?auto_461668 ) ) ( not ( = ?auto_461665 ?auto_461669 ) ) ( not ( = ?auto_461665 ?auto_461670 ) ) ( not ( = ?auto_461665 ?auto_461671 ) ) ( not ( = ?auto_461665 ?auto_461672 ) ) ( not ( = ?auto_461666 ?auto_461667 ) ) ( not ( = ?auto_461666 ?auto_461668 ) ) ( not ( = ?auto_461666 ?auto_461669 ) ) ( not ( = ?auto_461666 ?auto_461670 ) ) ( not ( = ?auto_461666 ?auto_461671 ) ) ( not ( = ?auto_461666 ?auto_461672 ) ) ( not ( = ?auto_461667 ?auto_461668 ) ) ( not ( = ?auto_461667 ?auto_461669 ) ) ( not ( = ?auto_461667 ?auto_461670 ) ) ( not ( = ?auto_461667 ?auto_461671 ) ) ( not ( = ?auto_461667 ?auto_461672 ) ) ( not ( = ?auto_461668 ?auto_461669 ) ) ( not ( = ?auto_461668 ?auto_461670 ) ) ( not ( = ?auto_461668 ?auto_461671 ) ) ( not ( = ?auto_461668 ?auto_461672 ) ) ( not ( = ?auto_461669 ?auto_461670 ) ) ( not ( = ?auto_461669 ?auto_461671 ) ) ( not ( = ?auto_461669 ?auto_461672 ) ) ( not ( = ?auto_461670 ?auto_461671 ) ) ( not ( = ?auto_461670 ?auto_461672 ) ) ( not ( = ?auto_461671 ?auto_461672 ) ) ( ON ?auto_461670 ?auto_461671 ) ( ON ?auto_461669 ?auto_461670 ) ( ON ?auto_461668 ?auto_461669 ) ( ON ?auto_461667 ?auto_461668 ) ( ON ?auto_461666 ?auto_461667 ) ( CLEAR ?auto_461664 ) ( ON ?auto_461665 ?auto_461666 ) ( CLEAR ?auto_461665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_461661 ?auto_461662 ?auto_461663 ?auto_461664 ?auto_461665 )
      ( MAKE-11PILE ?auto_461661 ?auto_461662 ?auto_461663 ?auto_461664 ?auto_461665 ?auto_461666 ?auto_461667 ?auto_461668 ?auto_461669 ?auto_461670 ?auto_461671 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461684 - BLOCK
      ?auto_461685 - BLOCK
      ?auto_461686 - BLOCK
      ?auto_461687 - BLOCK
      ?auto_461688 - BLOCK
      ?auto_461689 - BLOCK
      ?auto_461690 - BLOCK
      ?auto_461691 - BLOCK
      ?auto_461692 - BLOCK
      ?auto_461693 - BLOCK
      ?auto_461694 - BLOCK
    )
    :vars
    (
      ?auto_461695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461694 ?auto_461695 ) ( ON-TABLE ?auto_461684 ) ( ON ?auto_461685 ?auto_461684 ) ( ON ?auto_461686 ?auto_461685 ) ( ON ?auto_461687 ?auto_461686 ) ( not ( = ?auto_461684 ?auto_461685 ) ) ( not ( = ?auto_461684 ?auto_461686 ) ) ( not ( = ?auto_461684 ?auto_461687 ) ) ( not ( = ?auto_461684 ?auto_461688 ) ) ( not ( = ?auto_461684 ?auto_461689 ) ) ( not ( = ?auto_461684 ?auto_461690 ) ) ( not ( = ?auto_461684 ?auto_461691 ) ) ( not ( = ?auto_461684 ?auto_461692 ) ) ( not ( = ?auto_461684 ?auto_461693 ) ) ( not ( = ?auto_461684 ?auto_461694 ) ) ( not ( = ?auto_461684 ?auto_461695 ) ) ( not ( = ?auto_461685 ?auto_461686 ) ) ( not ( = ?auto_461685 ?auto_461687 ) ) ( not ( = ?auto_461685 ?auto_461688 ) ) ( not ( = ?auto_461685 ?auto_461689 ) ) ( not ( = ?auto_461685 ?auto_461690 ) ) ( not ( = ?auto_461685 ?auto_461691 ) ) ( not ( = ?auto_461685 ?auto_461692 ) ) ( not ( = ?auto_461685 ?auto_461693 ) ) ( not ( = ?auto_461685 ?auto_461694 ) ) ( not ( = ?auto_461685 ?auto_461695 ) ) ( not ( = ?auto_461686 ?auto_461687 ) ) ( not ( = ?auto_461686 ?auto_461688 ) ) ( not ( = ?auto_461686 ?auto_461689 ) ) ( not ( = ?auto_461686 ?auto_461690 ) ) ( not ( = ?auto_461686 ?auto_461691 ) ) ( not ( = ?auto_461686 ?auto_461692 ) ) ( not ( = ?auto_461686 ?auto_461693 ) ) ( not ( = ?auto_461686 ?auto_461694 ) ) ( not ( = ?auto_461686 ?auto_461695 ) ) ( not ( = ?auto_461687 ?auto_461688 ) ) ( not ( = ?auto_461687 ?auto_461689 ) ) ( not ( = ?auto_461687 ?auto_461690 ) ) ( not ( = ?auto_461687 ?auto_461691 ) ) ( not ( = ?auto_461687 ?auto_461692 ) ) ( not ( = ?auto_461687 ?auto_461693 ) ) ( not ( = ?auto_461687 ?auto_461694 ) ) ( not ( = ?auto_461687 ?auto_461695 ) ) ( not ( = ?auto_461688 ?auto_461689 ) ) ( not ( = ?auto_461688 ?auto_461690 ) ) ( not ( = ?auto_461688 ?auto_461691 ) ) ( not ( = ?auto_461688 ?auto_461692 ) ) ( not ( = ?auto_461688 ?auto_461693 ) ) ( not ( = ?auto_461688 ?auto_461694 ) ) ( not ( = ?auto_461688 ?auto_461695 ) ) ( not ( = ?auto_461689 ?auto_461690 ) ) ( not ( = ?auto_461689 ?auto_461691 ) ) ( not ( = ?auto_461689 ?auto_461692 ) ) ( not ( = ?auto_461689 ?auto_461693 ) ) ( not ( = ?auto_461689 ?auto_461694 ) ) ( not ( = ?auto_461689 ?auto_461695 ) ) ( not ( = ?auto_461690 ?auto_461691 ) ) ( not ( = ?auto_461690 ?auto_461692 ) ) ( not ( = ?auto_461690 ?auto_461693 ) ) ( not ( = ?auto_461690 ?auto_461694 ) ) ( not ( = ?auto_461690 ?auto_461695 ) ) ( not ( = ?auto_461691 ?auto_461692 ) ) ( not ( = ?auto_461691 ?auto_461693 ) ) ( not ( = ?auto_461691 ?auto_461694 ) ) ( not ( = ?auto_461691 ?auto_461695 ) ) ( not ( = ?auto_461692 ?auto_461693 ) ) ( not ( = ?auto_461692 ?auto_461694 ) ) ( not ( = ?auto_461692 ?auto_461695 ) ) ( not ( = ?auto_461693 ?auto_461694 ) ) ( not ( = ?auto_461693 ?auto_461695 ) ) ( not ( = ?auto_461694 ?auto_461695 ) ) ( ON ?auto_461693 ?auto_461694 ) ( ON ?auto_461692 ?auto_461693 ) ( ON ?auto_461691 ?auto_461692 ) ( ON ?auto_461690 ?auto_461691 ) ( ON ?auto_461689 ?auto_461690 ) ( CLEAR ?auto_461687 ) ( ON ?auto_461688 ?auto_461689 ) ( CLEAR ?auto_461688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_461684 ?auto_461685 ?auto_461686 ?auto_461687 ?auto_461688 )
      ( MAKE-11PILE ?auto_461684 ?auto_461685 ?auto_461686 ?auto_461687 ?auto_461688 ?auto_461689 ?auto_461690 ?auto_461691 ?auto_461692 ?auto_461693 ?auto_461694 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461707 - BLOCK
      ?auto_461708 - BLOCK
      ?auto_461709 - BLOCK
      ?auto_461710 - BLOCK
      ?auto_461711 - BLOCK
      ?auto_461712 - BLOCK
      ?auto_461713 - BLOCK
      ?auto_461714 - BLOCK
      ?auto_461715 - BLOCK
      ?auto_461716 - BLOCK
      ?auto_461717 - BLOCK
    )
    :vars
    (
      ?auto_461718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461717 ?auto_461718 ) ( ON-TABLE ?auto_461707 ) ( ON ?auto_461708 ?auto_461707 ) ( ON ?auto_461709 ?auto_461708 ) ( not ( = ?auto_461707 ?auto_461708 ) ) ( not ( = ?auto_461707 ?auto_461709 ) ) ( not ( = ?auto_461707 ?auto_461710 ) ) ( not ( = ?auto_461707 ?auto_461711 ) ) ( not ( = ?auto_461707 ?auto_461712 ) ) ( not ( = ?auto_461707 ?auto_461713 ) ) ( not ( = ?auto_461707 ?auto_461714 ) ) ( not ( = ?auto_461707 ?auto_461715 ) ) ( not ( = ?auto_461707 ?auto_461716 ) ) ( not ( = ?auto_461707 ?auto_461717 ) ) ( not ( = ?auto_461707 ?auto_461718 ) ) ( not ( = ?auto_461708 ?auto_461709 ) ) ( not ( = ?auto_461708 ?auto_461710 ) ) ( not ( = ?auto_461708 ?auto_461711 ) ) ( not ( = ?auto_461708 ?auto_461712 ) ) ( not ( = ?auto_461708 ?auto_461713 ) ) ( not ( = ?auto_461708 ?auto_461714 ) ) ( not ( = ?auto_461708 ?auto_461715 ) ) ( not ( = ?auto_461708 ?auto_461716 ) ) ( not ( = ?auto_461708 ?auto_461717 ) ) ( not ( = ?auto_461708 ?auto_461718 ) ) ( not ( = ?auto_461709 ?auto_461710 ) ) ( not ( = ?auto_461709 ?auto_461711 ) ) ( not ( = ?auto_461709 ?auto_461712 ) ) ( not ( = ?auto_461709 ?auto_461713 ) ) ( not ( = ?auto_461709 ?auto_461714 ) ) ( not ( = ?auto_461709 ?auto_461715 ) ) ( not ( = ?auto_461709 ?auto_461716 ) ) ( not ( = ?auto_461709 ?auto_461717 ) ) ( not ( = ?auto_461709 ?auto_461718 ) ) ( not ( = ?auto_461710 ?auto_461711 ) ) ( not ( = ?auto_461710 ?auto_461712 ) ) ( not ( = ?auto_461710 ?auto_461713 ) ) ( not ( = ?auto_461710 ?auto_461714 ) ) ( not ( = ?auto_461710 ?auto_461715 ) ) ( not ( = ?auto_461710 ?auto_461716 ) ) ( not ( = ?auto_461710 ?auto_461717 ) ) ( not ( = ?auto_461710 ?auto_461718 ) ) ( not ( = ?auto_461711 ?auto_461712 ) ) ( not ( = ?auto_461711 ?auto_461713 ) ) ( not ( = ?auto_461711 ?auto_461714 ) ) ( not ( = ?auto_461711 ?auto_461715 ) ) ( not ( = ?auto_461711 ?auto_461716 ) ) ( not ( = ?auto_461711 ?auto_461717 ) ) ( not ( = ?auto_461711 ?auto_461718 ) ) ( not ( = ?auto_461712 ?auto_461713 ) ) ( not ( = ?auto_461712 ?auto_461714 ) ) ( not ( = ?auto_461712 ?auto_461715 ) ) ( not ( = ?auto_461712 ?auto_461716 ) ) ( not ( = ?auto_461712 ?auto_461717 ) ) ( not ( = ?auto_461712 ?auto_461718 ) ) ( not ( = ?auto_461713 ?auto_461714 ) ) ( not ( = ?auto_461713 ?auto_461715 ) ) ( not ( = ?auto_461713 ?auto_461716 ) ) ( not ( = ?auto_461713 ?auto_461717 ) ) ( not ( = ?auto_461713 ?auto_461718 ) ) ( not ( = ?auto_461714 ?auto_461715 ) ) ( not ( = ?auto_461714 ?auto_461716 ) ) ( not ( = ?auto_461714 ?auto_461717 ) ) ( not ( = ?auto_461714 ?auto_461718 ) ) ( not ( = ?auto_461715 ?auto_461716 ) ) ( not ( = ?auto_461715 ?auto_461717 ) ) ( not ( = ?auto_461715 ?auto_461718 ) ) ( not ( = ?auto_461716 ?auto_461717 ) ) ( not ( = ?auto_461716 ?auto_461718 ) ) ( not ( = ?auto_461717 ?auto_461718 ) ) ( ON ?auto_461716 ?auto_461717 ) ( ON ?auto_461715 ?auto_461716 ) ( ON ?auto_461714 ?auto_461715 ) ( ON ?auto_461713 ?auto_461714 ) ( ON ?auto_461712 ?auto_461713 ) ( ON ?auto_461711 ?auto_461712 ) ( CLEAR ?auto_461709 ) ( ON ?auto_461710 ?auto_461711 ) ( CLEAR ?auto_461710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_461707 ?auto_461708 ?auto_461709 ?auto_461710 )
      ( MAKE-11PILE ?auto_461707 ?auto_461708 ?auto_461709 ?auto_461710 ?auto_461711 ?auto_461712 ?auto_461713 ?auto_461714 ?auto_461715 ?auto_461716 ?auto_461717 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461730 - BLOCK
      ?auto_461731 - BLOCK
      ?auto_461732 - BLOCK
      ?auto_461733 - BLOCK
      ?auto_461734 - BLOCK
      ?auto_461735 - BLOCK
      ?auto_461736 - BLOCK
      ?auto_461737 - BLOCK
      ?auto_461738 - BLOCK
      ?auto_461739 - BLOCK
      ?auto_461740 - BLOCK
    )
    :vars
    (
      ?auto_461741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461740 ?auto_461741 ) ( ON-TABLE ?auto_461730 ) ( ON ?auto_461731 ?auto_461730 ) ( ON ?auto_461732 ?auto_461731 ) ( not ( = ?auto_461730 ?auto_461731 ) ) ( not ( = ?auto_461730 ?auto_461732 ) ) ( not ( = ?auto_461730 ?auto_461733 ) ) ( not ( = ?auto_461730 ?auto_461734 ) ) ( not ( = ?auto_461730 ?auto_461735 ) ) ( not ( = ?auto_461730 ?auto_461736 ) ) ( not ( = ?auto_461730 ?auto_461737 ) ) ( not ( = ?auto_461730 ?auto_461738 ) ) ( not ( = ?auto_461730 ?auto_461739 ) ) ( not ( = ?auto_461730 ?auto_461740 ) ) ( not ( = ?auto_461730 ?auto_461741 ) ) ( not ( = ?auto_461731 ?auto_461732 ) ) ( not ( = ?auto_461731 ?auto_461733 ) ) ( not ( = ?auto_461731 ?auto_461734 ) ) ( not ( = ?auto_461731 ?auto_461735 ) ) ( not ( = ?auto_461731 ?auto_461736 ) ) ( not ( = ?auto_461731 ?auto_461737 ) ) ( not ( = ?auto_461731 ?auto_461738 ) ) ( not ( = ?auto_461731 ?auto_461739 ) ) ( not ( = ?auto_461731 ?auto_461740 ) ) ( not ( = ?auto_461731 ?auto_461741 ) ) ( not ( = ?auto_461732 ?auto_461733 ) ) ( not ( = ?auto_461732 ?auto_461734 ) ) ( not ( = ?auto_461732 ?auto_461735 ) ) ( not ( = ?auto_461732 ?auto_461736 ) ) ( not ( = ?auto_461732 ?auto_461737 ) ) ( not ( = ?auto_461732 ?auto_461738 ) ) ( not ( = ?auto_461732 ?auto_461739 ) ) ( not ( = ?auto_461732 ?auto_461740 ) ) ( not ( = ?auto_461732 ?auto_461741 ) ) ( not ( = ?auto_461733 ?auto_461734 ) ) ( not ( = ?auto_461733 ?auto_461735 ) ) ( not ( = ?auto_461733 ?auto_461736 ) ) ( not ( = ?auto_461733 ?auto_461737 ) ) ( not ( = ?auto_461733 ?auto_461738 ) ) ( not ( = ?auto_461733 ?auto_461739 ) ) ( not ( = ?auto_461733 ?auto_461740 ) ) ( not ( = ?auto_461733 ?auto_461741 ) ) ( not ( = ?auto_461734 ?auto_461735 ) ) ( not ( = ?auto_461734 ?auto_461736 ) ) ( not ( = ?auto_461734 ?auto_461737 ) ) ( not ( = ?auto_461734 ?auto_461738 ) ) ( not ( = ?auto_461734 ?auto_461739 ) ) ( not ( = ?auto_461734 ?auto_461740 ) ) ( not ( = ?auto_461734 ?auto_461741 ) ) ( not ( = ?auto_461735 ?auto_461736 ) ) ( not ( = ?auto_461735 ?auto_461737 ) ) ( not ( = ?auto_461735 ?auto_461738 ) ) ( not ( = ?auto_461735 ?auto_461739 ) ) ( not ( = ?auto_461735 ?auto_461740 ) ) ( not ( = ?auto_461735 ?auto_461741 ) ) ( not ( = ?auto_461736 ?auto_461737 ) ) ( not ( = ?auto_461736 ?auto_461738 ) ) ( not ( = ?auto_461736 ?auto_461739 ) ) ( not ( = ?auto_461736 ?auto_461740 ) ) ( not ( = ?auto_461736 ?auto_461741 ) ) ( not ( = ?auto_461737 ?auto_461738 ) ) ( not ( = ?auto_461737 ?auto_461739 ) ) ( not ( = ?auto_461737 ?auto_461740 ) ) ( not ( = ?auto_461737 ?auto_461741 ) ) ( not ( = ?auto_461738 ?auto_461739 ) ) ( not ( = ?auto_461738 ?auto_461740 ) ) ( not ( = ?auto_461738 ?auto_461741 ) ) ( not ( = ?auto_461739 ?auto_461740 ) ) ( not ( = ?auto_461739 ?auto_461741 ) ) ( not ( = ?auto_461740 ?auto_461741 ) ) ( ON ?auto_461739 ?auto_461740 ) ( ON ?auto_461738 ?auto_461739 ) ( ON ?auto_461737 ?auto_461738 ) ( ON ?auto_461736 ?auto_461737 ) ( ON ?auto_461735 ?auto_461736 ) ( ON ?auto_461734 ?auto_461735 ) ( CLEAR ?auto_461732 ) ( ON ?auto_461733 ?auto_461734 ) ( CLEAR ?auto_461733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_461730 ?auto_461731 ?auto_461732 ?auto_461733 )
      ( MAKE-11PILE ?auto_461730 ?auto_461731 ?auto_461732 ?auto_461733 ?auto_461734 ?auto_461735 ?auto_461736 ?auto_461737 ?auto_461738 ?auto_461739 ?auto_461740 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461753 - BLOCK
      ?auto_461754 - BLOCK
      ?auto_461755 - BLOCK
      ?auto_461756 - BLOCK
      ?auto_461757 - BLOCK
      ?auto_461758 - BLOCK
      ?auto_461759 - BLOCK
      ?auto_461760 - BLOCK
      ?auto_461761 - BLOCK
      ?auto_461762 - BLOCK
      ?auto_461763 - BLOCK
    )
    :vars
    (
      ?auto_461764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461763 ?auto_461764 ) ( ON-TABLE ?auto_461753 ) ( ON ?auto_461754 ?auto_461753 ) ( not ( = ?auto_461753 ?auto_461754 ) ) ( not ( = ?auto_461753 ?auto_461755 ) ) ( not ( = ?auto_461753 ?auto_461756 ) ) ( not ( = ?auto_461753 ?auto_461757 ) ) ( not ( = ?auto_461753 ?auto_461758 ) ) ( not ( = ?auto_461753 ?auto_461759 ) ) ( not ( = ?auto_461753 ?auto_461760 ) ) ( not ( = ?auto_461753 ?auto_461761 ) ) ( not ( = ?auto_461753 ?auto_461762 ) ) ( not ( = ?auto_461753 ?auto_461763 ) ) ( not ( = ?auto_461753 ?auto_461764 ) ) ( not ( = ?auto_461754 ?auto_461755 ) ) ( not ( = ?auto_461754 ?auto_461756 ) ) ( not ( = ?auto_461754 ?auto_461757 ) ) ( not ( = ?auto_461754 ?auto_461758 ) ) ( not ( = ?auto_461754 ?auto_461759 ) ) ( not ( = ?auto_461754 ?auto_461760 ) ) ( not ( = ?auto_461754 ?auto_461761 ) ) ( not ( = ?auto_461754 ?auto_461762 ) ) ( not ( = ?auto_461754 ?auto_461763 ) ) ( not ( = ?auto_461754 ?auto_461764 ) ) ( not ( = ?auto_461755 ?auto_461756 ) ) ( not ( = ?auto_461755 ?auto_461757 ) ) ( not ( = ?auto_461755 ?auto_461758 ) ) ( not ( = ?auto_461755 ?auto_461759 ) ) ( not ( = ?auto_461755 ?auto_461760 ) ) ( not ( = ?auto_461755 ?auto_461761 ) ) ( not ( = ?auto_461755 ?auto_461762 ) ) ( not ( = ?auto_461755 ?auto_461763 ) ) ( not ( = ?auto_461755 ?auto_461764 ) ) ( not ( = ?auto_461756 ?auto_461757 ) ) ( not ( = ?auto_461756 ?auto_461758 ) ) ( not ( = ?auto_461756 ?auto_461759 ) ) ( not ( = ?auto_461756 ?auto_461760 ) ) ( not ( = ?auto_461756 ?auto_461761 ) ) ( not ( = ?auto_461756 ?auto_461762 ) ) ( not ( = ?auto_461756 ?auto_461763 ) ) ( not ( = ?auto_461756 ?auto_461764 ) ) ( not ( = ?auto_461757 ?auto_461758 ) ) ( not ( = ?auto_461757 ?auto_461759 ) ) ( not ( = ?auto_461757 ?auto_461760 ) ) ( not ( = ?auto_461757 ?auto_461761 ) ) ( not ( = ?auto_461757 ?auto_461762 ) ) ( not ( = ?auto_461757 ?auto_461763 ) ) ( not ( = ?auto_461757 ?auto_461764 ) ) ( not ( = ?auto_461758 ?auto_461759 ) ) ( not ( = ?auto_461758 ?auto_461760 ) ) ( not ( = ?auto_461758 ?auto_461761 ) ) ( not ( = ?auto_461758 ?auto_461762 ) ) ( not ( = ?auto_461758 ?auto_461763 ) ) ( not ( = ?auto_461758 ?auto_461764 ) ) ( not ( = ?auto_461759 ?auto_461760 ) ) ( not ( = ?auto_461759 ?auto_461761 ) ) ( not ( = ?auto_461759 ?auto_461762 ) ) ( not ( = ?auto_461759 ?auto_461763 ) ) ( not ( = ?auto_461759 ?auto_461764 ) ) ( not ( = ?auto_461760 ?auto_461761 ) ) ( not ( = ?auto_461760 ?auto_461762 ) ) ( not ( = ?auto_461760 ?auto_461763 ) ) ( not ( = ?auto_461760 ?auto_461764 ) ) ( not ( = ?auto_461761 ?auto_461762 ) ) ( not ( = ?auto_461761 ?auto_461763 ) ) ( not ( = ?auto_461761 ?auto_461764 ) ) ( not ( = ?auto_461762 ?auto_461763 ) ) ( not ( = ?auto_461762 ?auto_461764 ) ) ( not ( = ?auto_461763 ?auto_461764 ) ) ( ON ?auto_461762 ?auto_461763 ) ( ON ?auto_461761 ?auto_461762 ) ( ON ?auto_461760 ?auto_461761 ) ( ON ?auto_461759 ?auto_461760 ) ( ON ?auto_461758 ?auto_461759 ) ( ON ?auto_461757 ?auto_461758 ) ( ON ?auto_461756 ?auto_461757 ) ( CLEAR ?auto_461754 ) ( ON ?auto_461755 ?auto_461756 ) ( CLEAR ?auto_461755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_461753 ?auto_461754 ?auto_461755 )
      ( MAKE-11PILE ?auto_461753 ?auto_461754 ?auto_461755 ?auto_461756 ?auto_461757 ?auto_461758 ?auto_461759 ?auto_461760 ?auto_461761 ?auto_461762 ?auto_461763 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461776 - BLOCK
      ?auto_461777 - BLOCK
      ?auto_461778 - BLOCK
      ?auto_461779 - BLOCK
      ?auto_461780 - BLOCK
      ?auto_461781 - BLOCK
      ?auto_461782 - BLOCK
      ?auto_461783 - BLOCK
      ?auto_461784 - BLOCK
      ?auto_461785 - BLOCK
      ?auto_461786 - BLOCK
    )
    :vars
    (
      ?auto_461787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461786 ?auto_461787 ) ( ON-TABLE ?auto_461776 ) ( ON ?auto_461777 ?auto_461776 ) ( not ( = ?auto_461776 ?auto_461777 ) ) ( not ( = ?auto_461776 ?auto_461778 ) ) ( not ( = ?auto_461776 ?auto_461779 ) ) ( not ( = ?auto_461776 ?auto_461780 ) ) ( not ( = ?auto_461776 ?auto_461781 ) ) ( not ( = ?auto_461776 ?auto_461782 ) ) ( not ( = ?auto_461776 ?auto_461783 ) ) ( not ( = ?auto_461776 ?auto_461784 ) ) ( not ( = ?auto_461776 ?auto_461785 ) ) ( not ( = ?auto_461776 ?auto_461786 ) ) ( not ( = ?auto_461776 ?auto_461787 ) ) ( not ( = ?auto_461777 ?auto_461778 ) ) ( not ( = ?auto_461777 ?auto_461779 ) ) ( not ( = ?auto_461777 ?auto_461780 ) ) ( not ( = ?auto_461777 ?auto_461781 ) ) ( not ( = ?auto_461777 ?auto_461782 ) ) ( not ( = ?auto_461777 ?auto_461783 ) ) ( not ( = ?auto_461777 ?auto_461784 ) ) ( not ( = ?auto_461777 ?auto_461785 ) ) ( not ( = ?auto_461777 ?auto_461786 ) ) ( not ( = ?auto_461777 ?auto_461787 ) ) ( not ( = ?auto_461778 ?auto_461779 ) ) ( not ( = ?auto_461778 ?auto_461780 ) ) ( not ( = ?auto_461778 ?auto_461781 ) ) ( not ( = ?auto_461778 ?auto_461782 ) ) ( not ( = ?auto_461778 ?auto_461783 ) ) ( not ( = ?auto_461778 ?auto_461784 ) ) ( not ( = ?auto_461778 ?auto_461785 ) ) ( not ( = ?auto_461778 ?auto_461786 ) ) ( not ( = ?auto_461778 ?auto_461787 ) ) ( not ( = ?auto_461779 ?auto_461780 ) ) ( not ( = ?auto_461779 ?auto_461781 ) ) ( not ( = ?auto_461779 ?auto_461782 ) ) ( not ( = ?auto_461779 ?auto_461783 ) ) ( not ( = ?auto_461779 ?auto_461784 ) ) ( not ( = ?auto_461779 ?auto_461785 ) ) ( not ( = ?auto_461779 ?auto_461786 ) ) ( not ( = ?auto_461779 ?auto_461787 ) ) ( not ( = ?auto_461780 ?auto_461781 ) ) ( not ( = ?auto_461780 ?auto_461782 ) ) ( not ( = ?auto_461780 ?auto_461783 ) ) ( not ( = ?auto_461780 ?auto_461784 ) ) ( not ( = ?auto_461780 ?auto_461785 ) ) ( not ( = ?auto_461780 ?auto_461786 ) ) ( not ( = ?auto_461780 ?auto_461787 ) ) ( not ( = ?auto_461781 ?auto_461782 ) ) ( not ( = ?auto_461781 ?auto_461783 ) ) ( not ( = ?auto_461781 ?auto_461784 ) ) ( not ( = ?auto_461781 ?auto_461785 ) ) ( not ( = ?auto_461781 ?auto_461786 ) ) ( not ( = ?auto_461781 ?auto_461787 ) ) ( not ( = ?auto_461782 ?auto_461783 ) ) ( not ( = ?auto_461782 ?auto_461784 ) ) ( not ( = ?auto_461782 ?auto_461785 ) ) ( not ( = ?auto_461782 ?auto_461786 ) ) ( not ( = ?auto_461782 ?auto_461787 ) ) ( not ( = ?auto_461783 ?auto_461784 ) ) ( not ( = ?auto_461783 ?auto_461785 ) ) ( not ( = ?auto_461783 ?auto_461786 ) ) ( not ( = ?auto_461783 ?auto_461787 ) ) ( not ( = ?auto_461784 ?auto_461785 ) ) ( not ( = ?auto_461784 ?auto_461786 ) ) ( not ( = ?auto_461784 ?auto_461787 ) ) ( not ( = ?auto_461785 ?auto_461786 ) ) ( not ( = ?auto_461785 ?auto_461787 ) ) ( not ( = ?auto_461786 ?auto_461787 ) ) ( ON ?auto_461785 ?auto_461786 ) ( ON ?auto_461784 ?auto_461785 ) ( ON ?auto_461783 ?auto_461784 ) ( ON ?auto_461782 ?auto_461783 ) ( ON ?auto_461781 ?auto_461782 ) ( ON ?auto_461780 ?auto_461781 ) ( ON ?auto_461779 ?auto_461780 ) ( CLEAR ?auto_461777 ) ( ON ?auto_461778 ?auto_461779 ) ( CLEAR ?auto_461778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_461776 ?auto_461777 ?auto_461778 )
      ( MAKE-11PILE ?auto_461776 ?auto_461777 ?auto_461778 ?auto_461779 ?auto_461780 ?auto_461781 ?auto_461782 ?auto_461783 ?auto_461784 ?auto_461785 ?auto_461786 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461799 - BLOCK
      ?auto_461800 - BLOCK
      ?auto_461801 - BLOCK
      ?auto_461802 - BLOCK
      ?auto_461803 - BLOCK
      ?auto_461804 - BLOCK
      ?auto_461805 - BLOCK
      ?auto_461806 - BLOCK
      ?auto_461807 - BLOCK
      ?auto_461808 - BLOCK
      ?auto_461809 - BLOCK
    )
    :vars
    (
      ?auto_461810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461809 ?auto_461810 ) ( ON-TABLE ?auto_461799 ) ( not ( = ?auto_461799 ?auto_461800 ) ) ( not ( = ?auto_461799 ?auto_461801 ) ) ( not ( = ?auto_461799 ?auto_461802 ) ) ( not ( = ?auto_461799 ?auto_461803 ) ) ( not ( = ?auto_461799 ?auto_461804 ) ) ( not ( = ?auto_461799 ?auto_461805 ) ) ( not ( = ?auto_461799 ?auto_461806 ) ) ( not ( = ?auto_461799 ?auto_461807 ) ) ( not ( = ?auto_461799 ?auto_461808 ) ) ( not ( = ?auto_461799 ?auto_461809 ) ) ( not ( = ?auto_461799 ?auto_461810 ) ) ( not ( = ?auto_461800 ?auto_461801 ) ) ( not ( = ?auto_461800 ?auto_461802 ) ) ( not ( = ?auto_461800 ?auto_461803 ) ) ( not ( = ?auto_461800 ?auto_461804 ) ) ( not ( = ?auto_461800 ?auto_461805 ) ) ( not ( = ?auto_461800 ?auto_461806 ) ) ( not ( = ?auto_461800 ?auto_461807 ) ) ( not ( = ?auto_461800 ?auto_461808 ) ) ( not ( = ?auto_461800 ?auto_461809 ) ) ( not ( = ?auto_461800 ?auto_461810 ) ) ( not ( = ?auto_461801 ?auto_461802 ) ) ( not ( = ?auto_461801 ?auto_461803 ) ) ( not ( = ?auto_461801 ?auto_461804 ) ) ( not ( = ?auto_461801 ?auto_461805 ) ) ( not ( = ?auto_461801 ?auto_461806 ) ) ( not ( = ?auto_461801 ?auto_461807 ) ) ( not ( = ?auto_461801 ?auto_461808 ) ) ( not ( = ?auto_461801 ?auto_461809 ) ) ( not ( = ?auto_461801 ?auto_461810 ) ) ( not ( = ?auto_461802 ?auto_461803 ) ) ( not ( = ?auto_461802 ?auto_461804 ) ) ( not ( = ?auto_461802 ?auto_461805 ) ) ( not ( = ?auto_461802 ?auto_461806 ) ) ( not ( = ?auto_461802 ?auto_461807 ) ) ( not ( = ?auto_461802 ?auto_461808 ) ) ( not ( = ?auto_461802 ?auto_461809 ) ) ( not ( = ?auto_461802 ?auto_461810 ) ) ( not ( = ?auto_461803 ?auto_461804 ) ) ( not ( = ?auto_461803 ?auto_461805 ) ) ( not ( = ?auto_461803 ?auto_461806 ) ) ( not ( = ?auto_461803 ?auto_461807 ) ) ( not ( = ?auto_461803 ?auto_461808 ) ) ( not ( = ?auto_461803 ?auto_461809 ) ) ( not ( = ?auto_461803 ?auto_461810 ) ) ( not ( = ?auto_461804 ?auto_461805 ) ) ( not ( = ?auto_461804 ?auto_461806 ) ) ( not ( = ?auto_461804 ?auto_461807 ) ) ( not ( = ?auto_461804 ?auto_461808 ) ) ( not ( = ?auto_461804 ?auto_461809 ) ) ( not ( = ?auto_461804 ?auto_461810 ) ) ( not ( = ?auto_461805 ?auto_461806 ) ) ( not ( = ?auto_461805 ?auto_461807 ) ) ( not ( = ?auto_461805 ?auto_461808 ) ) ( not ( = ?auto_461805 ?auto_461809 ) ) ( not ( = ?auto_461805 ?auto_461810 ) ) ( not ( = ?auto_461806 ?auto_461807 ) ) ( not ( = ?auto_461806 ?auto_461808 ) ) ( not ( = ?auto_461806 ?auto_461809 ) ) ( not ( = ?auto_461806 ?auto_461810 ) ) ( not ( = ?auto_461807 ?auto_461808 ) ) ( not ( = ?auto_461807 ?auto_461809 ) ) ( not ( = ?auto_461807 ?auto_461810 ) ) ( not ( = ?auto_461808 ?auto_461809 ) ) ( not ( = ?auto_461808 ?auto_461810 ) ) ( not ( = ?auto_461809 ?auto_461810 ) ) ( ON ?auto_461808 ?auto_461809 ) ( ON ?auto_461807 ?auto_461808 ) ( ON ?auto_461806 ?auto_461807 ) ( ON ?auto_461805 ?auto_461806 ) ( ON ?auto_461804 ?auto_461805 ) ( ON ?auto_461803 ?auto_461804 ) ( ON ?auto_461802 ?auto_461803 ) ( ON ?auto_461801 ?auto_461802 ) ( CLEAR ?auto_461799 ) ( ON ?auto_461800 ?auto_461801 ) ( CLEAR ?auto_461800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_461799 ?auto_461800 )
      ( MAKE-11PILE ?auto_461799 ?auto_461800 ?auto_461801 ?auto_461802 ?auto_461803 ?auto_461804 ?auto_461805 ?auto_461806 ?auto_461807 ?auto_461808 ?auto_461809 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461822 - BLOCK
      ?auto_461823 - BLOCK
      ?auto_461824 - BLOCK
      ?auto_461825 - BLOCK
      ?auto_461826 - BLOCK
      ?auto_461827 - BLOCK
      ?auto_461828 - BLOCK
      ?auto_461829 - BLOCK
      ?auto_461830 - BLOCK
      ?auto_461831 - BLOCK
      ?auto_461832 - BLOCK
    )
    :vars
    (
      ?auto_461833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461832 ?auto_461833 ) ( ON-TABLE ?auto_461822 ) ( not ( = ?auto_461822 ?auto_461823 ) ) ( not ( = ?auto_461822 ?auto_461824 ) ) ( not ( = ?auto_461822 ?auto_461825 ) ) ( not ( = ?auto_461822 ?auto_461826 ) ) ( not ( = ?auto_461822 ?auto_461827 ) ) ( not ( = ?auto_461822 ?auto_461828 ) ) ( not ( = ?auto_461822 ?auto_461829 ) ) ( not ( = ?auto_461822 ?auto_461830 ) ) ( not ( = ?auto_461822 ?auto_461831 ) ) ( not ( = ?auto_461822 ?auto_461832 ) ) ( not ( = ?auto_461822 ?auto_461833 ) ) ( not ( = ?auto_461823 ?auto_461824 ) ) ( not ( = ?auto_461823 ?auto_461825 ) ) ( not ( = ?auto_461823 ?auto_461826 ) ) ( not ( = ?auto_461823 ?auto_461827 ) ) ( not ( = ?auto_461823 ?auto_461828 ) ) ( not ( = ?auto_461823 ?auto_461829 ) ) ( not ( = ?auto_461823 ?auto_461830 ) ) ( not ( = ?auto_461823 ?auto_461831 ) ) ( not ( = ?auto_461823 ?auto_461832 ) ) ( not ( = ?auto_461823 ?auto_461833 ) ) ( not ( = ?auto_461824 ?auto_461825 ) ) ( not ( = ?auto_461824 ?auto_461826 ) ) ( not ( = ?auto_461824 ?auto_461827 ) ) ( not ( = ?auto_461824 ?auto_461828 ) ) ( not ( = ?auto_461824 ?auto_461829 ) ) ( not ( = ?auto_461824 ?auto_461830 ) ) ( not ( = ?auto_461824 ?auto_461831 ) ) ( not ( = ?auto_461824 ?auto_461832 ) ) ( not ( = ?auto_461824 ?auto_461833 ) ) ( not ( = ?auto_461825 ?auto_461826 ) ) ( not ( = ?auto_461825 ?auto_461827 ) ) ( not ( = ?auto_461825 ?auto_461828 ) ) ( not ( = ?auto_461825 ?auto_461829 ) ) ( not ( = ?auto_461825 ?auto_461830 ) ) ( not ( = ?auto_461825 ?auto_461831 ) ) ( not ( = ?auto_461825 ?auto_461832 ) ) ( not ( = ?auto_461825 ?auto_461833 ) ) ( not ( = ?auto_461826 ?auto_461827 ) ) ( not ( = ?auto_461826 ?auto_461828 ) ) ( not ( = ?auto_461826 ?auto_461829 ) ) ( not ( = ?auto_461826 ?auto_461830 ) ) ( not ( = ?auto_461826 ?auto_461831 ) ) ( not ( = ?auto_461826 ?auto_461832 ) ) ( not ( = ?auto_461826 ?auto_461833 ) ) ( not ( = ?auto_461827 ?auto_461828 ) ) ( not ( = ?auto_461827 ?auto_461829 ) ) ( not ( = ?auto_461827 ?auto_461830 ) ) ( not ( = ?auto_461827 ?auto_461831 ) ) ( not ( = ?auto_461827 ?auto_461832 ) ) ( not ( = ?auto_461827 ?auto_461833 ) ) ( not ( = ?auto_461828 ?auto_461829 ) ) ( not ( = ?auto_461828 ?auto_461830 ) ) ( not ( = ?auto_461828 ?auto_461831 ) ) ( not ( = ?auto_461828 ?auto_461832 ) ) ( not ( = ?auto_461828 ?auto_461833 ) ) ( not ( = ?auto_461829 ?auto_461830 ) ) ( not ( = ?auto_461829 ?auto_461831 ) ) ( not ( = ?auto_461829 ?auto_461832 ) ) ( not ( = ?auto_461829 ?auto_461833 ) ) ( not ( = ?auto_461830 ?auto_461831 ) ) ( not ( = ?auto_461830 ?auto_461832 ) ) ( not ( = ?auto_461830 ?auto_461833 ) ) ( not ( = ?auto_461831 ?auto_461832 ) ) ( not ( = ?auto_461831 ?auto_461833 ) ) ( not ( = ?auto_461832 ?auto_461833 ) ) ( ON ?auto_461831 ?auto_461832 ) ( ON ?auto_461830 ?auto_461831 ) ( ON ?auto_461829 ?auto_461830 ) ( ON ?auto_461828 ?auto_461829 ) ( ON ?auto_461827 ?auto_461828 ) ( ON ?auto_461826 ?auto_461827 ) ( ON ?auto_461825 ?auto_461826 ) ( ON ?auto_461824 ?auto_461825 ) ( CLEAR ?auto_461822 ) ( ON ?auto_461823 ?auto_461824 ) ( CLEAR ?auto_461823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_461822 ?auto_461823 )
      ( MAKE-11PILE ?auto_461822 ?auto_461823 ?auto_461824 ?auto_461825 ?auto_461826 ?auto_461827 ?auto_461828 ?auto_461829 ?auto_461830 ?auto_461831 ?auto_461832 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461845 - BLOCK
      ?auto_461846 - BLOCK
      ?auto_461847 - BLOCK
      ?auto_461848 - BLOCK
      ?auto_461849 - BLOCK
      ?auto_461850 - BLOCK
      ?auto_461851 - BLOCK
      ?auto_461852 - BLOCK
      ?auto_461853 - BLOCK
      ?auto_461854 - BLOCK
      ?auto_461855 - BLOCK
    )
    :vars
    (
      ?auto_461856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461855 ?auto_461856 ) ( not ( = ?auto_461845 ?auto_461846 ) ) ( not ( = ?auto_461845 ?auto_461847 ) ) ( not ( = ?auto_461845 ?auto_461848 ) ) ( not ( = ?auto_461845 ?auto_461849 ) ) ( not ( = ?auto_461845 ?auto_461850 ) ) ( not ( = ?auto_461845 ?auto_461851 ) ) ( not ( = ?auto_461845 ?auto_461852 ) ) ( not ( = ?auto_461845 ?auto_461853 ) ) ( not ( = ?auto_461845 ?auto_461854 ) ) ( not ( = ?auto_461845 ?auto_461855 ) ) ( not ( = ?auto_461845 ?auto_461856 ) ) ( not ( = ?auto_461846 ?auto_461847 ) ) ( not ( = ?auto_461846 ?auto_461848 ) ) ( not ( = ?auto_461846 ?auto_461849 ) ) ( not ( = ?auto_461846 ?auto_461850 ) ) ( not ( = ?auto_461846 ?auto_461851 ) ) ( not ( = ?auto_461846 ?auto_461852 ) ) ( not ( = ?auto_461846 ?auto_461853 ) ) ( not ( = ?auto_461846 ?auto_461854 ) ) ( not ( = ?auto_461846 ?auto_461855 ) ) ( not ( = ?auto_461846 ?auto_461856 ) ) ( not ( = ?auto_461847 ?auto_461848 ) ) ( not ( = ?auto_461847 ?auto_461849 ) ) ( not ( = ?auto_461847 ?auto_461850 ) ) ( not ( = ?auto_461847 ?auto_461851 ) ) ( not ( = ?auto_461847 ?auto_461852 ) ) ( not ( = ?auto_461847 ?auto_461853 ) ) ( not ( = ?auto_461847 ?auto_461854 ) ) ( not ( = ?auto_461847 ?auto_461855 ) ) ( not ( = ?auto_461847 ?auto_461856 ) ) ( not ( = ?auto_461848 ?auto_461849 ) ) ( not ( = ?auto_461848 ?auto_461850 ) ) ( not ( = ?auto_461848 ?auto_461851 ) ) ( not ( = ?auto_461848 ?auto_461852 ) ) ( not ( = ?auto_461848 ?auto_461853 ) ) ( not ( = ?auto_461848 ?auto_461854 ) ) ( not ( = ?auto_461848 ?auto_461855 ) ) ( not ( = ?auto_461848 ?auto_461856 ) ) ( not ( = ?auto_461849 ?auto_461850 ) ) ( not ( = ?auto_461849 ?auto_461851 ) ) ( not ( = ?auto_461849 ?auto_461852 ) ) ( not ( = ?auto_461849 ?auto_461853 ) ) ( not ( = ?auto_461849 ?auto_461854 ) ) ( not ( = ?auto_461849 ?auto_461855 ) ) ( not ( = ?auto_461849 ?auto_461856 ) ) ( not ( = ?auto_461850 ?auto_461851 ) ) ( not ( = ?auto_461850 ?auto_461852 ) ) ( not ( = ?auto_461850 ?auto_461853 ) ) ( not ( = ?auto_461850 ?auto_461854 ) ) ( not ( = ?auto_461850 ?auto_461855 ) ) ( not ( = ?auto_461850 ?auto_461856 ) ) ( not ( = ?auto_461851 ?auto_461852 ) ) ( not ( = ?auto_461851 ?auto_461853 ) ) ( not ( = ?auto_461851 ?auto_461854 ) ) ( not ( = ?auto_461851 ?auto_461855 ) ) ( not ( = ?auto_461851 ?auto_461856 ) ) ( not ( = ?auto_461852 ?auto_461853 ) ) ( not ( = ?auto_461852 ?auto_461854 ) ) ( not ( = ?auto_461852 ?auto_461855 ) ) ( not ( = ?auto_461852 ?auto_461856 ) ) ( not ( = ?auto_461853 ?auto_461854 ) ) ( not ( = ?auto_461853 ?auto_461855 ) ) ( not ( = ?auto_461853 ?auto_461856 ) ) ( not ( = ?auto_461854 ?auto_461855 ) ) ( not ( = ?auto_461854 ?auto_461856 ) ) ( not ( = ?auto_461855 ?auto_461856 ) ) ( ON ?auto_461854 ?auto_461855 ) ( ON ?auto_461853 ?auto_461854 ) ( ON ?auto_461852 ?auto_461853 ) ( ON ?auto_461851 ?auto_461852 ) ( ON ?auto_461850 ?auto_461851 ) ( ON ?auto_461849 ?auto_461850 ) ( ON ?auto_461848 ?auto_461849 ) ( ON ?auto_461847 ?auto_461848 ) ( ON ?auto_461846 ?auto_461847 ) ( ON ?auto_461845 ?auto_461846 ) ( CLEAR ?auto_461845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_461845 )
      ( MAKE-11PILE ?auto_461845 ?auto_461846 ?auto_461847 ?auto_461848 ?auto_461849 ?auto_461850 ?auto_461851 ?auto_461852 ?auto_461853 ?auto_461854 ?auto_461855 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_461868 - BLOCK
      ?auto_461869 - BLOCK
      ?auto_461870 - BLOCK
      ?auto_461871 - BLOCK
      ?auto_461872 - BLOCK
      ?auto_461873 - BLOCK
      ?auto_461874 - BLOCK
      ?auto_461875 - BLOCK
      ?auto_461876 - BLOCK
      ?auto_461877 - BLOCK
      ?auto_461878 - BLOCK
    )
    :vars
    (
      ?auto_461879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461878 ?auto_461879 ) ( not ( = ?auto_461868 ?auto_461869 ) ) ( not ( = ?auto_461868 ?auto_461870 ) ) ( not ( = ?auto_461868 ?auto_461871 ) ) ( not ( = ?auto_461868 ?auto_461872 ) ) ( not ( = ?auto_461868 ?auto_461873 ) ) ( not ( = ?auto_461868 ?auto_461874 ) ) ( not ( = ?auto_461868 ?auto_461875 ) ) ( not ( = ?auto_461868 ?auto_461876 ) ) ( not ( = ?auto_461868 ?auto_461877 ) ) ( not ( = ?auto_461868 ?auto_461878 ) ) ( not ( = ?auto_461868 ?auto_461879 ) ) ( not ( = ?auto_461869 ?auto_461870 ) ) ( not ( = ?auto_461869 ?auto_461871 ) ) ( not ( = ?auto_461869 ?auto_461872 ) ) ( not ( = ?auto_461869 ?auto_461873 ) ) ( not ( = ?auto_461869 ?auto_461874 ) ) ( not ( = ?auto_461869 ?auto_461875 ) ) ( not ( = ?auto_461869 ?auto_461876 ) ) ( not ( = ?auto_461869 ?auto_461877 ) ) ( not ( = ?auto_461869 ?auto_461878 ) ) ( not ( = ?auto_461869 ?auto_461879 ) ) ( not ( = ?auto_461870 ?auto_461871 ) ) ( not ( = ?auto_461870 ?auto_461872 ) ) ( not ( = ?auto_461870 ?auto_461873 ) ) ( not ( = ?auto_461870 ?auto_461874 ) ) ( not ( = ?auto_461870 ?auto_461875 ) ) ( not ( = ?auto_461870 ?auto_461876 ) ) ( not ( = ?auto_461870 ?auto_461877 ) ) ( not ( = ?auto_461870 ?auto_461878 ) ) ( not ( = ?auto_461870 ?auto_461879 ) ) ( not ( = ?auto_461871 ?auto_461872 ) ) ( not ( = ?auto_461871 ?auto_461873 ) ) ( not ( = ?auto_461871 ?auto_461874 ) ) ( not ( = ?auto_461871 ?auto_461875 ) ) ( not ( = ?auto_461871 ?auto_461876 ) ) ( not ( = ?auto_461871 ?auto_461877 ) ) ( not ( = ?auto_461871 ?auto_461878 ) ) ( not ( = ?auto_461871 ?auto_461879 ) ) ( not ( = ?auto_461872 ?auto_461873 ) ) ( not ( = ?auto_461872 ?auto_461874 ) ) ( not ( = ?auto_461872 ?auto_461875 ) ) ( not ( = ?auto_461872 ?auto_461876 ) ) ( not ( = ?auto_461872 ?auto_461877 ) ) ( not ( = ?auto_461872 ?auto_461878 ) ) ( not ( = ?auto_461872 ?auto_461879 ) ) ( not ( = ?auto_461873 ?auto_461874 ) ) ( not ( = ?auto_461873 ?auto_461875 ) ) ( not ( = ?auto_461873 ?auto_461876 ) ) ( not ( = ?auto_461873 ?auto_461877 ) ) ( not ( = ?auto_461873 ?auto_461878 ) ) ( not ( = ?auto_461873 ?auto_461879 ) ) ( not ( = ?auto_461874 ?auto_461875 ) ) ( not ( = ?auto_461874 ?auto_461876 ) ) ( not ( = ?auto_461874 ?auto_461877 ) ) ( not ( = ?auto_461874 ?auto_461878 ) ) ( not ( = ?auto_461874 ?auto_461879 ) ) ( not ( = ?auto_461875 ?auto_461876 ) ) ( not ( = ?auto_461875 ?auto_461877 ) ) ( not ( = ?auto_461875 ?auto_461878 ) ) ( not ( = ?auto_461875 ?auto_461879 ) ) ( not ( = ?auto_461876 ?auto_461877 ) ) ( not ( = ?auto_461876 ?auto_461878 ) ) ( not ( = ?auto_461876 ?auto_461879 ) ) ( not ( = ?auto_461877 ?auto_461878 ) ) ( not ( = ?auto_461877 ?auto_461879 ) ) ( not ( = ?auto_461878 ?auto_461879 ) ) ( ON ?auto_461877 ?auto_461878 ) ( ON ?auto_461876 ?auto_461877 ) ( ON ?auto_461875 ?auto_461876 ) ( ON ?auto_461874 ?auto_461875 ) ( ON ?auto_461873 ?auto_461874 ) ( ON ?auto_461872 ?auto_461873 ) ( ON ?auto_461871 ?auto_461872 ) ( ON ?auto_461870 ?auto_461871 ) ( ON ?auto_461869 ?auto_461870 ) ( ON ?auto_461868 ?auto_461869 ) ( CLEAR ?auto_461868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_461868 )
      ( MAKE-11PILE ?auto_461868 ?auto_461869 ?auto_461870 ?auto_461871 ?auto_461872 ?auto_461873 ?auto_461874 ?auto_461875 ?auto_461876 ?auto_461877 ?auto_461878 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_461892 - BLOCK
      ?auto_461893 - BLOCK
      ?auto_461894 - BLOCK
      ?auto_461895 - BLOCK
      ?auto_461896 - BLOCK
      ?auto_461897 - BLOCK
      ?auto_461898 - BLOCK
      ?auto_461899 - BLOCK
      ?auto_461900 - BLOCK
      ?auto_461901 - BLOCK
      ?auto_461902 - BLOCK
      ?auto_461903 - BLOCK
    )
    :vars
    (
      ?auto_461904 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_461902 ) ( ON ?auto_461903 ?auto_461904 ) ( CLEAR ?auto_461903 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_461892 ) ( ON ?auto_461893 ?auto_461892 ) ( ON ?auto_461894 ?auto_461893 ) ( ON ?auto_461895 ?auto_461894 ) ( ON ?auto_461896 ?auto_461895 ) ( ON ?auto_461897 ?auto_461896 ) ( ON ?auto_461898 ?auto_461897 ) ( ON ?auto_461899 ?auto_461898 ) ( ON ?auto_461900 ?auto_461899 ) ( ON ?auto_461901 ?auto_461900 ) ( ON ?auto_461902 ?auto_461901 ) ( not ( = ?auto_461892 ?auto_461893 ) ) ( not ( = ?auto_461892 ?auto_461894 ) ) ( not ( = ?auto_461892 ?auto_461895 ) ) ( not ( = ?auto_461892 ?auto_461896 ) ) ( not ( = ?auto_461892 ?auto_461897 ) ) ( not ( = ?auto_461892 ?auto_461898 ) ) ( not ( = ?auto_461892 ?auto_461899 ) ) ( not ( = ?auto_461892 ?auto_461900 ) ) ( not ( = ?auto_461892 ?auto_461901 ) ) ( not ( = ?auto_461892 ?auto_461902 ) ) ( not ( = ?auto_461892 ?auto_461903 ) ) ( not ( = ?auto_461892 ?auto_461904 ) ) ( not ( = ?auto_461893 ?auto_461894 ) ) ( not ( = ?auto_461893 ?auto_461895 ) ) ( not ( = ?auto_461893 ?auto_461896 ) ) ( not ( = ?auto_461893 ?auto_461897 ) ) ( not ( = ?auto_461893 ?auto_461898 ) ) ( not ( = ?auto_461893 ?auto_461899 ) ) ( not ( = ?auto_461893 ?auto_461900 ) ) ( not ( = ?auto_461893 ?auto_461901 ) ) ( not ( = ?auto_461893 ?auto_461902 ) ) ( not ( = ?auto_461893 ?auto_461903 ) ) ( not ( = ?auto_461893 ?auto_461904 ) ) ( not ( = ?auto_461894 ?auto_461895 ) ) ( not ( = ?auto_461894 ?auto_461896 ) ) ( not ( = ?auto_461894 ?auto_461897 ) ) ( not ( = ?auto_461894 ?auto_461898 ) ) ( not ( = ?auto_461894 ?auto_461899 ) ) ( not ( = ?auto_461894 ?auto_461900 ) ) ( not ( = ?auto_461894 ?auto_461901 ) ) ( not ( = ?auto_461894 ?auto_461902 ) ) ( not ( = ?auto_461894 ?auto_461903 ) ) ( not ( = ?auto_461894 ?auto_461904 ) ) ( not ( = ?auto_461895 ?auto_461896 ) ) ( not ( = ?auto_461895 ?auto_461897 ) ) ( not ( = ?auto_461895 ?auto_461898 ) ) ( not ( = ?auto_461895 ?auto_461899 ) ) ( not ( = ?auto_461895 ?auto_461900 ) ) ( not ( = ?auto_461895 ?auto_461901 ) ) ( not ( = ?auto_461895 ?auto_461902 ) ) ( not ( = ?auto_461895 ?auto_461903 ) ) ( not ( = ?auto_461895 ?auto_461904 ) ) ( not ( = ?auto_461896 ?auto_461897 ) ) ( not ( = ?auto_461896 ?auto_461898 ) ) ( not ( = ?auto_461896 ?auto_461899 ) ) ( not ( = ?auto_461896 ?auto_461900 ) ) ( not ( = ?auto_461896 ?auto_461901 ) ) ( not ( = ?auto_461896 ?auto_461902 ) ) ( not ( = ?auto_461896 ?auto_461903 ) ) ( not ( = ?auto_461896 ?auto_461904 ) ) ( not ( = ?auto_461897 ?auto_461898 ) ) ( not ( = ?auto_461897 ?auto_461899 ) ) ( not ( = ?auto_461897 ?auto_461900 ) ) ( not ( = ?auto_461897 ?auto_461901 ) ) ( not ( = ?auto_461897 ?auto_461902 ) ) ( not ( = ?auto_461897 ?auto_461903 ) ) ( not ( = ?auto_461897 ?auto_461904 ) ) ( not ( = ?auto_461898 ?auto_461899 ) ) ( not ( = ?auto_461898 ?auto_461900 ) ) ( not ( = ?auto_461898 ?auto_461901 ) ) ( not ( = ?auto_461898 ?auto_461902 ) ) ( not ( = ?auto_461898 ?auto_461903 ) ) ( not ( = ?auto_461898 ?auto_461904 ) ) ( not ( = ?auto_461899 ?auto_461900 ) ) ( not ( = ?auto_461899 ?auto_461901 ) ) ( not ( = ?auto_461899 ?auto_461902 ) ) ( not ( = ?auto_461899 ?auto_461903 ) ) ( not ( = ?auto_461899 ?auto_461904 ) ) ( not ( = ?auto_461900 ?auto_461901 ) ) ( not ( = ?auto_461900 ?auto_461902 ) ) ( not ( = ?auto_461900 ?auto_461903 ) ) ( not ( = ?auto_461900 ?auto_461904 ) ) ( not ( = ?auto_461901 ?auto_461902 ) ) ( not ( = ?auto_461901 ?auto_461903 ) ) ( not ( = ?auto_461901 ?auto_461904 ) ) ( not ( = ?auto_461902 ?auto_461903 ) ) ( not ( = ?auto_461902 ?auto_461904 ) ) ( not ( = ?auto_461903 ?auto_461904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_461903 ?auto_461904 )
      ( !STACK ?auto_461903 ?auto_461902 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_461917 - BLOCK
      ?auto_461918 - BLOCK
      ?auto_461919 - BLOCK
      ?auto_461920 - BLOCK
      ?auto_461921 - BLOCK
      ?auto_461922 - BLOCK
      ?auto_461923 - BLOCK
      ?auto_461924 - BLOCK
      ?auto_461925 - BLOCK
      ?auto_461926 - BLOCK
      ?auto_461927 - BLOCK
      ?auto_461928 - BLOCK
    )
    :vars
    (
      ?auto_461929 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_461927 ) ( ON ?auto_461928 ?auto_461929 ) ( CLEAR ?auto_461928 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_461917 ) ( ON ?auto_461918 ?auto_461917 ) ( ON ?auto_461919 ?auto_461918 ) ( ON ?auto_461920 ?auto_461919 ) ( ON ?auto_461921 ?auto_461920 ) ( ON ?auto_461922 ?auto_461921 ) ( ON ?auto_461923 ?auto_461922 ) ( ON ?auto_461924 ?auto_461923 ) ( ON ?auto_461925 ?auto_461924 ) ( ON ?auto_461926 ?auto_461925 ) ( ON ?auto_461927 ?auto_461926 ) ( not ( = ?auto_461917 ?auto_461918 ) ) ( not ( = ?auto_461917 ?auto_461919 ) ) ( not ( = ?auto_461917 ?auto_461920 ) ) ( not ( = ?auto_461917 ?auto_461921 ) ) ( not ( = ?auto_461917 ?auto_461922 ) ) ( not ( = ?auto_461917 ?auto_461923 ) ) ( not ( = ?auto_461917 ?auto_461924 ) ) ( not ( = ?auto_461917 ?auto_461925 ) ) ( not ( = ?auto_461917 ?auto_461926 ) ) ( not ( = ?auto_461917 ?auto_461927 ) ) ( not ( = ?auto_461917 ?auto_461928 ) ) ( not ( = ?auto_461917 ?auto_461929 ) ) ( not ( = ?auto_461918 ?auto_461919 ) ) ( not ( = ?auto_461918 ?auto_461920 ) ) ( not ( = ?auto_461918 ?auto_461921 ) ) ( not ( = ?auto_461918 ?auto_461922 ) ) ( not ( = ?auto_461918 ?auto_461923 ) ) ( not ( = ?auto_461918 ?auto_461924 ) ) ( not ( = ?auto_461918 ?auto_461925 ) ) ( not ( = ?auto_461918 ?auto_461926 ) ) ( not ( = ?auto_461918 ?auto_461927 ) ) ( not ( = ?auto_461918 ?auto_461928 ) ) ( not ( = ?auto_461918 ?auto_461929 ) ) ( not ( = ?auto_461919 ?auto_461920 ) ) ( not ( = ?auto_461919 ?auto_461921 ) ) ( not ( = ?auto_461919 ?auto_461922 ) ) ( not ( = ?auto_461919 ?auto_461923 ) ) ( not ( = ?auto_461919 ?auto_461924 ) ) ( not ( = ?auto_461919 ?auto_461925 ) ) ( not ( = ?auto_461919 ?auto_461926 ) ) ( not ( = ?auto_461919 ?auto_461927 ) ) ( not ( = ?auto_461919 ?auto_461928 ) ) ( not ( = ?auto_461919 ?auto_461929 ) ) ( not ( = ?auto_461920 ?auto_461921 ) ) ( not ( = ?auto_461920 ?auto_461922 ) ) ( not ( = ?auto_461920 ?auto_461923 ) ) ( not ( = ?auto_461920 ?auto_461924 ) ) ( not ( = ?auto_461920 ?auto_461925 ) ) ( not ( = ?auto_461920 ?auto_461926 ) ) ( not ( = ?auto_461920 ?auto_461927 ) ) ( not ( = ?auto_461920 ?auto_461928 ) ) ( not ( = ?auto_461920 ?auto_461929 ) ) ( not ( = ?auto_461921 ?auto_461922 ) ) ( not ( = ?auto_461921 ?auto_461923 ) ) ( not ( = ?auto_461921 ?auto_461924 ) ) ( not ( = ?auto_461921 ?auto_461925 ) ) ( not ( = ?auto_461921 ?auto_461926 ) ) ( not ( = ?auto_461921 ?auto_461927 ) ) ( not ( = ?auto_461921 ?auto_461928 ) ) ( not ( = ?auto_461921 ?auto_461929 ) ) ( not ( = ?auto_461922 ?auto_461923 ) ) ( not ( = ?auto_461922 ?auto_461924 ) ) ( not ( = ?auto_461922 ?auto_461925 ) ) ( not ( = ?auto_461922 ?auto_461926 ) ) ( not ( = ?auto_461922 ?auto_461927 ) ) ( not ( = ?auto_461922 ?auto_461928 ) ) ( not ( = ?auto_461922 ?auto_461929 ) ) ( not ( = ?auto_461923 ?auto_461924 ) ) ( not ( = ?auto_461923 ?auto_461925 ) ) ( not ( = ?auto_461923 ?auto_461926 ) ) ( not ( = ?auto_461923 ?auto_461927 ) ) ( not ( = ?auto_461923 ?auto_461928 ) ) ( not ( = ?auto_461923 ?auto_461929 ) ) ( not ( = ?auto_461924 ?auto_461925 ) ) ( not ( = ?auto_461924 ?auto_461926 ) ) ( not ( = ?auto_461924 ?auto_461927 ) ) ( not ( = ?auto_461924 ?auto_461928 ) ) ( not ( = ?auto_461924 ?auto_461929 ) ) ( not ( = ?auto_461925 ?auto_461926 ) ) ( not ( = ?auto_461925 ?auto_461927 ) ) ( not ( = ?auto_461925 ?auto_461928 ) ) ( not ( = ?auto_461925 ?auto_461929 ) ) ( not ( = ?auto_461926 ?auto_461927 ) ) ( not ( = ?auto_461926 ?auto_461928 ) ) ( not ( = ?auto_461926 ?auto_461929 ) ) ( not ( = ?auto_461927 ?auto_461928 ) ) ( not ( = ?auto_461927 ?auto_461929 ) ) ( not ( = ?auto_461928 ?auto_461929 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_461928 ?auto_461929 )
      ( !STACK ?auto_461928 ?auto_461927 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_461942 - BLOCK
      ?auto_461943 - BLOCK
      ?auto_461944 - BLOCK
      ?auto_461945 - BLOCK
      ?auto_461946 - BLOCK
      ?auto_461947 - BLOCK
      ?auto_461948 - BLOCK
      ?auto_461949 - BLOCK
      ?auto_461950 - BLOCK
      ?auto_461951 - BLOCK
      ?auto_461952 - BLOCK
      ?auto_461953 - BLOCK
    )
    :vars
    (
      ?auto_461954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461953 ?auto_461954 ) ( ON-TABLE ?auto_461942 ) ( ON ?auto_461943 ?auto_461942 ) ( ON ?auto_461944 ?auto_461943 ) ( ON ?auto_461945 ?auto_461944 ) ( ON ?auto_461946 ?auto_461945 ) ( ON ?auto_461947 ?auto_461946 ) ( ON ?auto_461948 ?auto_461947 ) ( ON ?auto_461949 ?auto_461948 ) ( ON ?auto_461950 ?auto_461949 ) ( ON ?auto_461951 ?auto_461950 ) ( not ( = ?auto_461942 ?auto_461943 ) ) ( not ( = ?auto_461942 ?auto_461944 ) ) ( not ( = ?auto_461942 ?auto_461945 ) ) ( not ( = ?auto_461942 ?auto_461946 ) ) ( not ( = ?auto_461942 ?auto_461947 ) ) ( not ( = ?auto_461942 ?auto_461948 ) ) ( not ( = ?auto_461942 ?auto_461949 ) ) ( not ( = ?auto_461942 ?auto_461950 ) ) ( not ( = ?auto_461942 ?auto_461951 ) ) ( not ( = ?auto_461942 ?auto_461952 ) ) ( not ( = ?auto_461942 ?auto_461953 ) ) ( not ( = ?auto_461942 ?auto_461954 ) ) ( not ( = ?auto_461943 ?auto_461944 ) ) ( not ( = ?auto_461943 ?auto_461945 ) ) ( not ( = ?auto_461943 ?auto_461946 ) ) ( not ( = ?auto_461943 ?auto_461947 ) ) ( not ( = ?auto_461943 ?auto_461948 ) ) ( not ( = ?auto_461943 ?auto_461949 ) ) ( not ( = ?auto_461943 ?auto_461950 ) ) ( not ( = ?auto_461943 ?auto_461951 ) ) ( not ( = ?auto_461943 ?auto_461952 ) ) ( not ( = ?auto_461943 ?auto_461953 ) ) ( not ( = ?auto_461943 ?auto_461954 ) ) ( not ( = ?auto_461944 ?auto_461945 ) ) ( not ( = ?auto_461944 ?auto_461946 ) ) ( not ( = ?auto_461944 ?auto_461947 ) ) ( not ( = ?auto_461944 ?auto_461948 ) ) ( not ( = ?auto_461944 ?auto_461949 ) ) ( not ( = ?auto_461944 ?auto_461950 ) ) ( not ( = ?auto_461944 ?auto_461951 ) ) ( not ( = ?auto_461944 ?auto_461952 ) ) ( not ( = ?auto_461944 ?auto_461953 ) ) ( not ( = ?auto_461944 ?auto_461954 ) ) ( not ( = ?auto_461945 ?auto_461946 ) ) ( not ( = ?auto_461945 ?auto_461947 ) ) ( not ( = ?auto_461945 ?auto_461948 ) ) ( not ( = ?auto_461945 ?auto_461949 ) ) ( not ( = ?auto_461945 ?auto_461950 ) ) ( not ( = ?auto_461945 ?auto_461951 ) ) ( not ( = ?auto_461945 ?auto_461952 ) ) ( not ( = ?auto_461945 ?auto_461953 ) ) ( not ( = ?auto_461945 ?auto_461954 ) ) ( not ( = ?auto_461946 ?auto_461947 ) ) ( not ( = ?auto_461946 ?auto_461948 ) ) ( not ( = ?auto_461946 ?auto_461949 ) ) ( not ( = ?auto_461946 ?auto_461950 ) ) ( not ( = ?auto_461946 ?auto_461951 ) ) ( not ( = ?auto_461946 ?auto_461952 ) ) ( not ( = ?auto_461946 ?auto_461953 ) ) ( not ( = ?auto_461946 ?auto_461954 ) ) ( not ( = ?auto_461947 ?auto_461948 ) ) ( not ( = ?auto_461947 ?auto_461949 ) ) ( not ( = ?auto_461947 ?auto_461950 ) ) ( not ( = ?auto_461947 ?auto_461951 ) ) ( not ( = ?auto_461947 ?auto_461952 ) ) ( not ( = ?auto_461947 ?auto_461953 ) ) ( not ( = ?auto_461947 ?auto_461954 ) ) ( not ( = ?auto_461948 ?auto_461949 ) ) ( not ( = ?auto_461948 ?auto_461950 ) ) ( not ( = ?auto_461948 ?auto_461951 ) ) ( not ( = ?auto_461948 ?auto_461952 ) ) ( not ( = ?auto_461948 ?auto_461953 ) ) ( not ( = ?auto_461948 ?auto_461954 ) ) ( not ( = ?auto_461949 ?auto_461950 ) ) ( not ( = ?auto_461949 ?auto_461951 ) ) ( not ( = ?auto_461949 ?auto_461952 ) ) ( not ( = ?auto_461949 ?auto_461953 ) ) ( not ( = ?auto_461949 ?auto_461954 ) ) ( not ( = ?auto_461950 ?auto_461951 ) ) ( not ( = ?auto_461950 ?auto_461952 ) ) ( not ( = ?auto_461950 ?auto_461953 ) ) ( not ( = ?auto_461950 ?auto_461954 ) ) ( not ( = ?auto_461951 ?auto_461952 ) ) ( not ( = ?auto_461951 ?auto_461953 ) ) ( not ( = ?auto_461951 ?auto_461954 ) ) ( not ( = ?auto_461952 ?auto_461953 ) ) ( not ( = ?auto_461952 ?auto_461954 ) ) ( not ( = ?auto_461953 ?auto_461954 ) ) ( CLEAR ?auto_461951 ) ( ON ?auto_461952 ?auto_461953 ) ( CLEAR ?auto_461952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_461942 ?auto_461943 ?auto_461944 ?auto_461945 ?auto_461946 ?auto_461947 ?auto_461948 ?auto_461949 ?auto_461950 ?auto_461951 ?auto_461952 )
      ( MAKE-12PILE ?auto_461942 ?auto_461943 ?auto_461944 ?auto_461945 ?auto_461946 ?auto_461947 ?auto_461948 ?auto_461949 ?auto_461950 ?auto_461951 ?auto_461952 ?auto_461953 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_461967 - BLOCK
      ?auto_461968 - BLOCK
      ?auto_461969 - BLOCK
      ?auto_461970 - BLOCK
      ?auto_461971 - BLOCK
      ?auto_461972 - BLOCK
      ?auto_461973 - BLOCK
      ?auto_461974 - BLOCK
      ?auto_461975 - BLOCK
      ?auto_461976 - BLOCK
      ?auto_461977 - BLOCK
      ?auto_461978 - BLOCK
    )
    :vars
    (
      ?auto_461979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461978 ?auto_461979 ) ( ON-TABLE ?auto_461967 ) ( ON ?auto_461968 ?auto_461967 ) ( ON ?auto_461969 ?auto_461968 ) ( ON ?auto_461970 ?auto_461969 ) ( ON ?auto_461971 ?auto_461970 ) ( ON ?auto_461972 ?auto_461971 ) ( ON ?auto_461973 ?auto_461972 ) ( ON ?auto_461974 ?auto_461973 ) ( ON ?auto_461975 ?auto_461974 ) ( ON ?auto_461976 ?auto_461975 ) ( not ( = ?auto_461967 ?auto_461968 ) ) ( not ( = ?auto_461967 ?auto_461969 ) ) ( not ( = ?auto_461967 ?auto_461970 ) ) ( not ( = ?auto_461967 ?auto_461971 ) ) ( not ( = ?auto_461967 ?auto_461972 ) ) ( not ( = ?auto_461967 ?auto_461973 ) ) ( not ( = ?auto_461967 ?auto_461974 ) ) ( not ( = ?auto_461967 ?auto_461975 ) ) ( not ( = ?auto_461967 ?auto_461976 ) ) ( not ( = ?auto_461967 ?auto_461977 ) ) ( not ( = ?auto_461967 ?auto_461978 ) ) ( not ( = ?auto_461967 ?auto_461979 ) ) ( not ( = ?auto_461968 ?auto_461969 ) ) ( not ( = ?auto_461968 ?auto_461970 ) ) ( not ( = ?auto_461968 ?auto_461971 ) ) ( not ( = ?auto_461968 ?auto_461972 ) ) ( not ( = ?auto_461968 ?auto_461973 ) ) ( not ( = ?auto_461968 ?auto_461974 ) ) ( not ( = ?auto_461968 ?auto_461975 ) ) ( not ( = ?auto_461968 ?auto_461976 ) ) ( not ( = ?auto_461968 ?auto_461977 ) ) ( not ( = ?auto_461968 ?auto_461978 ) ) ( not ( = ?auto_461968 ?auto_461979 ) ) ( not ( = ?auto_461969 ?auto_461970 ) ) ( not ( = ?auto_461969 ?auto_461971 ) ) ( not ( = ?auto_461969 ?auto_461972 ) ) ( not ( = ?auto_461969 ?auto_461973 ) ) ( not ( = ?auto_461969 ?auto_461974 ) ) ( not ( = ?auto_461969 ?auto_461975 ) ) ( not ( = ?auto_461969 ?auto_461976 ) ) ( not ( = ?auto_461969 ?auto_461977 ) ) ( not ( = ?auto_461969 ?auto_461978 ) ) ( not ( = ?auto_461969 ?auto_461979 ) ) ( not ( = ?auto_461970 ?auto_461971 ) ) ( not ( = ?auto_461970 ?auto_461972 ) ) ( not ( = ?auto_461970 ?auto_461973 ) ) ( not ( = ?auto_461970 ?auto_461974 ) ) ( not ( = ?auto_461970 ?auto_461975 ) ) ( not ( = ?auto_461970 ?auto_461976 ) ) ( not ( = ?auto_461970 ?auto_461977 ) ) ( not ( = ?auto_461970 ?auto_461978 ) ) ( not ( = ?auto_461970 ?auto_461979 ) ) ( not ( = ?auto_461971 ?auto_461972 ) ) ( not ( = ?auto_461971 ?auto_461973 ) ) ( not ( = ?auto_461971 ?auto_461974 ) ) ( not ( = ?auto_461971 ?auto_461975 ) ) ( not ( = ?auto_461971 ?auto_461976 ) ) ( not ( = ?auto_461971 ?auto_461977 ) ) ( not ( = ?auto_461971 ?auto_461978 ) ) ( not ( = ?auto_461971 ?auto_461979 ) ) ( not ( = ?auto_461972 ?auto_461973 ) ) ( not ( = ?auto_461972 ?auto_461974 ) ) ( not ( = ?auto_461972 ?auto_461975 ) ) ( not ( = ?auto_461972 ?auto_461976 ) ) ( not ( = ?auto_461972 ?auto_461977 ) ) ( not ( = ?auto_461972 ?auto_461978 ) ) ( not ( = ?auto_461972 ?auto_461979 ) ) ( not ( = ?auto_461973 ?auto_461974 ) ) ( not ( = ?auto_461973 ?auto_461975 ) ) ( not ( = ?auto_461973 ?auto_461976 ) ) ( not ( = ?auto_461973 ?auto_461977 ) ) ( not ( = ?auto_461973 ?auto_461978 ) ) ( not ( = ?auto_461973 ?auto_461979 ) ) ( not ( = ?auto_461974 ?auto_461975 ) ) ( not ( = ?auto_461974 ?auto_461976 ) ) ( not ( = ?auto_461974 ?auto_461977 ) ) ( not ( = ?auto_461974 ?auto_461978 ) ) ( not ( = ?auto_461974 ?auto_461979 ) ) ( not ( = ?auto_461975 ?auto_461976 ) ) ( not ( = ?auto_461975 ?auto_461977 ) ) ( not ( = ?auto_461975 ?auto_461978 ) ) ( not ( = ?auto_461975 ?auto_461979 ) ) ( not ( = ?auto_461976 ?auto_461977 ) ) ( not ( = ?auto_461976 ?auto_461978 ) ) ( not ( = ?auto_461976 ?auto_461979 ) ) ( not ( = ?auto_461977 ?auto_461978 ) ) ( not ( = ?auto_461977 ?auto_461979 ) ) ( not ( = ?auto_461978 ?auto_461979 ) ) ( CLEAR ?auto_461976 ) ( ON ?auto_461977 ?auto_461978 ) ( CLEAR ?auto_461977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_461967 ?auto_461968 ?auto_461969 ?auto_461970 ?auto_461971 ?auto_461972 ?auto_461973 ?auto_461974 ?auto_461975 ?auto_461976 ?auto_461977 )
      ( MAKE-12PILE ?auto_461967 ?auto_461968 ?auto_461969 ?auto_461970 ?auto_461971 ?auto_461972 ?auto_461973 ?auto_461974 ?auto_461975 ?auto_461976 ?auto_461977 ?auto_461978 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_461992 - BLOCK
      ?auto_461993 - BLOCK
      ?auto_461994 - BLOCK
      ?auto_461995 - BLOCK
      ?auto_461996 - BLOCK
      ?auto_461997 - BLOCK
      ?auto_461998 - BLOCK
      ?auto_461999 - BLOCK
      ?auto_462000 - BLOCK
      ?auto_462001 - BLOCK
      ?auto_462002 - BLOCK
      ?auto_462003 - BLOCK
    )
    :vars
    (
      ?auto_462004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462003 ?auto_462004 ) ( ON-TABLE ?auto_461992 ) ( ON ?auto_461993 ?auto_461992 ) ( ON ?auto_461994 ?auto_461993 ) ( ON ?auto_461995 ?auto_461994 ) ( ON ?auto_461996 ?auto_461995 ) ( ON ?auto_461997 ?auto_461996 ) ( ON ?auto_461998 ?auto_461997 ) ( ON ?auto_461999 ?auto_461998 ) ( ON ?auto_462000 ?auto_461999 ) ( not ( = ?auto_461992 ?auto_461993 ) ) ( not ( = ?auto_461992 ?auto_461994 ) ) ( not ( = ?auto_461992 ?auto_461995 ) ) ( not ( = ?auto_461992 ?auto_461996 ) ) ( not ( = ?auto_461992 ?auto_461997 ) ) ( not ( = ?auto_461992 ?auto_461998 ) ) ( not ( = ?auto_461992 ?auto_461999 ) ) ( not ( = ?auto_461992 ?auto_462000 ) ) ( not ( = ?auto_461992 ?auto_462001 ) ) ( not ( = ?auto_461992 ?auto_462002 ) ) ( not ( = ?auto_461992 ?auto_462003 ) ) ( not ( = ?auto_461992 ?auto_462004 ) ) ( not ( = ?auto_461993 ?auto_461994 ) ) ( not ( = ?auto_461993 ?auto_461995 ) ) ( not ( = ?auto_461993 ?auto_461996 ) ) ( not ( = ?auto_461993 ?auto_461997 ) ) ( not ( = ?auto_461993 ?auto_461998 ) ) ( not ( = ?auto_461993 ?auto_461999 ) ) ( not ( = ?auto_461993 ?auto_462000 ) ) ( not ( = ?auto_461993 ?auto_462001 ) ) ( not ( = ?auto_461993 ?auto_462002 ) ) ( not ( = ?auto_461993 ?auto_462003 ) ) ( not ( = ?auto_461993 ?auto_462004 ) ) ( not ( = ?auto_461994 ?auto_461995 ) ) ( not ( = ?auto_461994 ?auto_461996 ) ) ( not ( = ?auto_461994 ?auto_461997 ) ) ( not ( = ?auto_461994 ?auto_461998 ) ) ( not ( = ?auto_461994 ?auto_461999 ) ) ( not ( = ?auto_461994 ?auto_462000 ) ) ( not ( = ?auto_461994 ?auto_462001 ) ) ( not ( = ?auto_461994 ?auto_462002 ) ) ( not ( = ?auto_461994 ?auto_462003 ) ) ( not ( = ?auto_461994 ?auto_462004 ) ) ( not ( = ?auto_461995 ?auto_461996 ) ) ( not ( = ?auto_461995 ?auto_461997 ) ) ( not ( = ?auto_461995 ?auto_461998 ) ) ( not ( = ?auto_461995 ?auto_461999 ) ) ( not ( = ?auto_461995 ?auto_462000 ) ) ( not ( = ?auto_461995 ?auto_462001 ) ) ( not ( = ?auto_461995 ?auto_462002 ) ) ( not ( = ?auto_461995 ?auto_462003 ) ) ( not ( = ?auto_461995 ?auto_462004 ) ) ( not ( = ?auto_461996 ?auto_461997 ) ) ( not ( = ?auto_461996 ?auto_461998 ) ) ( not ( = ?auto_461996 ?auto_461999 ) ) ( not ( = ?auto_461996 ?auto_462000 ) ) ( not ( = ?auto_461996 ?auto_462001 ) ) ( not ( = ?auto_461996 ?auto_462002 ) ) ( not ( = ?auto_461996 ?auto_462003 ) ) ( not ( = ?auto_461996 ?auto_462004 ) ) ( not ( = ?auto_461997 ?auto_461998 ) ) ( not ( = ?auto_461997 ?auto_461999 ) ) ( not ( = ?auto_461997 ?auto_462000 ) ) ( not ( = ?auto_461997 ?auto_462001 ) ) ( not ( = ?auto_461997 ?auto_462002 ) ) ( not ( = ?auto_461997 ?auto_462003 ) ) ( not ( = ?auto_461997 ?auto_462004 ) ) ( not ( = ?auto_461998 ?auto_461999 ) ) ( not ( = ?auto_461998 ?auto_462000 ) ) ( not ( = ?auto_461998 ?auto_462001 ) ) ( not ( = ?auto_461998 ?auto_462002 ) ) ( not ( = ?auto_461998 ?auto_462003 ) ) ( not ( = ?auto_461998 ?auto_462004 ) ) ( not ( = ?auto_461999 ?auto_462000 ) ) ( not ( = ?auto_461999 ?auto_462001 ) ) ( not ( = ?auto_461999 ?auto_462002 ) ) ( not ( = ?auto_461999 ?auto_462003 ) ) ( not ( = ?auto_461999 ?auto_462004 ) ) ( not ( = ?auto_462000 ?auto_462001 ) ) ( not ( = ?auto_462000 ?auto_462002 ) ) ( not ( = ?auto_462000 ?auto_462003 ) ) ( not ( = ?auto_462000 ?auto_462004 ) ) ( not ( = ?auto_462001 ?auto_462002 ) ) ( not ( = ?auto_462001 ?auto_462003 ) ) ( not ( = ?auto_462001 ?auto_462004 ) ) ( not ( = ?auto_462002 ?auto_462003 ) ) ( not ( = ?auto_462002 ?auto_462004 ) ) ( not ( = ?auto_462003 ?auto_462004 ) ) ( ON ?auto_462002 ?auto_462003 ) ( CLEAR ?auto_462000 ) ( ON ?auto_462001 ?auto_462002 ) ( CLEAR ?auto_462001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_461992 ?auto_461993 ?auto_461994 ?auto_461995 ?auto_461996 ?auto_461997 ?auto_461998 ?auto_461999 ?auto_462000 ?auto_462001 )
      ( MAKE-12PILE ?auto_461992 ?auto_461993 ?auto_461994 ?auto_461995 ?auto_461996 ?auto_461997 ?auto_461998 ?auto_461999 ?auto_462000 ?auto_462001 ?auto_462002 ?auto_462003 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462017 - BLOCK
      ?auto_462018 - BLOCK
      ?auto_462019 - BLOCK
      ?auto_462020 - BLOCK
      ?auto_462021 - BLOCK
      ?auto_462022 - BLOCK
      ?auto_462023 - BLOCK
      ?auto_462024 - BLOCK
      ?auto_462025 - BLOCK
      ?auto_462026 - BLOCK
      ?auto_462027 - BLOCK
      ?auto_462028 - BLOCK
    )
    :vars
    (
      ?auto_462029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462028 ?auto_462029 ) ( ON-TABLE ?auto_462017 ) ( ON ?auto_462018 ?auto_462017 ) ( ON ?auto_462019 ?auto_462018 ) ( ON ?auto_462020 ?auto_462019 ) ( ON ?auto_462021 ?auto_462020 ) ( ON ?auto_462022 ?auto_462021 ) ( ON ?auto_462023 ?auto_462022 ) ( ON ?auto_462024 ?auto_462023 ) ( ON ?auto_462025 ?auto_462024 ) ( not ( = ?auto_462017 ?auto_462018 ) ) ( not ( = ?auto_462017 ?auto_462019 ) ) ( not ( = ?auto_462017 ?auto_462020 ) ) ( not ( = ?auto_462017 ?auto_462021 ) ) ( not ( = ?auto_462017 ?auto_462022 ) ) ( not ( = ?auto_462017 ?auto_462023 ) ) ( not ( = ?auto_462017 ?auto_462024 ) ) ( not ( = ?auto_462017 ?auto_462025 ) ) ( not ( = ?auto_462017 ?auto_462026 ) ) ( not ( = ?auto_462017 ?auto_462027 ) ) ( not ( = ?auto_462017 ?auto_462028 ) ) ( not ( = ?auto_462017 ?auto_462029 ) ) ( not ( = ?auto_462018 ?auto_462019 ) ) ( not ( = ?auto_462018 ?auto_462020 ) ) ( not ( = ?auto_462018 ?auto_462021 ) ) ( not ( = ?auto_462018 ?auto_462022 ) ) ( not ( = ?auto_462018 ?auto_462023 ) ) ( not ( = ?auto_462018 ?auto_462024 ) ) ( not ( = ?auto_462018 ?auto_462025 ) ) ( not ( = ?auto_462018 ?auto_462026 ) ) ( not ( = ?auto_462018 ?auto_462027 ) ) ( not ( = ?auto_462018 ?auto_462028 ) ) ( not ( = ?auto_462018 ?auto_462029 ) ) ( not ( = ?auto_462019 ?auto_462020 ) ) ( not ( = ?auto_462019 ?auto_462021 ) ) ( not ( = ?auto_462019 ?auto_462022 ) ) ( not ( = ?auto_462019 ?auto_462023 ) ) ( not ( = ?auto_462019 ?auto_462024 ) ) ( not ( = ?auto_462019 ?auto_462025 ) ) ( not ( = ?auto_462019 ?auto_462026 ) ) ( not ( = ?auto_462019 ?auto_462027 ) ) ( not ( = ?auto_462019 ?auto_462028 ) ) ( not ( = ?auto_462019 ?auto_462029 ) ) ( not ( = ?auto_462020 ?auto_462021 ) ) ( not ( = ?auto_462020 ?auto_462022 ) ) ( not ( = ?auto_462020 ?auto_462023 ) ) ( not ( = ?auto_462020 ?auto_462024 ) ) ( not ( = ?auto_462020 ?auto_462025 ) ) ( not ( = ?auto_462020 ?auto_462026 ) ) ( not ( = ?auto_462020 ?auto_462027 ) ) ( not ( = ?auto_462020 ?auto_462028 ) ) ( not ( = ?auto_462020 ?auto_462029 ) ) ( not ( = ?auto_462021 ?auto_462022 ) ) ( not ( = ?auto_462021 ?auto_462023 ) ) ( not ( = ?auto_462021 ?auto_462024 ) ) ( not ( = ?auto_462021 ?auto_462025 ) ) ( not ( = ?auto_462021 ?auto_462026 ) ) ( not ( = ?auto_462021 ?auto_462027 ) ) ( not ( = ?auto_462021 ?auto_462028 ) ) ( not ( = ?auto_462021 ?auto_462029 ) ) ( not ( = ?auto_462022 ?auto_462023 ) ) ( not ( = ?auto_462022 ?auto_462024 ) ) ( not ( = ?auto_462022 ?auto_462025 ) ) ( not ( = ?auto_462022 ?auto_462026 ) ) ( not ( = ?auto_462022 ?auto_462027 ) ) ( not ( = ?auto_462022 ?auto_462028 ) ) ( not ( = ?auto_462022 ?auto_462029 ) ) ( not ( = ?auto_462023 ?auto_462024 ) ) ( not ( = ?auto_462023 ?auto_462025 ) ) ( not ( = ?auto_462023 ?auto_462026 ) ) ( not ( = ?auto_462023 ?auto_462027 ) ) ( not ( = ?auto_462023 ?auto_462028 ) ) ( not ( = ?auto_462023 ?auto_462029 ) ) ( not ( = ?auto_462024 ?auto_462025 ) ) ( not ( = ?auto_462024 ?auto_462026 ) ) ( not ( = ?auto_462024 ?auto_462027 ) ) ( not ( = ?auto_462024 ?auto_462028 ) ) ( not ( = ?auto_462024 ?auto_462029 ) ) ( not ( = ?auto_462025 ?auto_462026 ) ) ( not ( = ?auto_462025 ?auto_462027 ) ) ( not ( = ?auto_462025 ?auto_462028 ) ) ( not ( = ?auto_462025 ?auto_462029 ) ) ( not ( = ?auto_462026 ?auto_462027 ) ) ( not ( = ?auto_462026 ?auto_462028 ) ) ( not ( = ?auto_462026 ?auto_462029 ) ) ( not ( = ?auto_462027 ?auto_462028 ) ) ( not ( = ?auto_462027 ?auto_462029 ) ) ( not ( = ?auto_462028 ?auto_462029 ) ) ( ON ?auto_462027 ?auto_462028 ) ( CLEAR ?auto_462025 ) ( ON ?auto_462026 ?auto_462027 ) ( CLEAR ?auto_462026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_462017 ?auto_462018 ?auto_462019 ?auto_462020 ?auto_462021 ?auto_462022 ?auto_462023 ?auto_462024 ?auto_462025 ?auto_462026 )
      ( MAKE-12PILE ?auto_462017 ?auto_462018 ?auto_462019 ?auto_462020 ?auto_462021 ?auto_462022 ?auto_462023 ?auto_462024 ?auto_462025 ?auto_462026 ?auto_462027 ?auto_462028 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462042 - BLOCK
      ?auto_462043 - BLOCK
      ?auto_462044 - BLOCK
      ?auto_462045 - BLOCK
      ?auto_462046 - BLOCK
      ?auto_462047 - BLOCK
      ?auto_462048 - BLOCK
      ?auto_462049 - BLOCK
      ?auto_462050 - BLOCK
      ?auto_462051 - BLOCK
      ?auto_462052 - BLOCK
      ?auto_462053 - BLOCK
    )
    :vars
    (
      ?auto_462054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462053 ?auto_462054 ) ( ON-TABLE ?auto_462042 ) ( ON ?auto_462043 ?auto_462042 ) ( ON ?auto_462044 ?auto_462043 ) ( ON ?auto_462045 ?auto_462044 ) ( ON ?auto_462046 ?auto_462045 ) ( ON ?auto_462047 ?auto_462046 ) ( ON ?auto_462048 ?auto_462047 ) ( ON ?auto_462049 ?auto_462048 ) ( not ( = ?auto_462042 ?auto_462043 ) ) ( not ( = ?auto_462042 ?auto_462044 ) ) ( not ( = ?auto_462042 ?auto_462045 ) ) ( not ( = ?auto_462042 ?auto_462046 ) ) ( not ( = ?auto_462042 ?auto_462047 ) ) ( not ( = ?auto_462042 ?auto_462048 ) ) ( not ( = ?auto_462042 ?auto_462049 ) ) ( not ( = ?auto_462042 ?auto_462050 ) ) ( not ( = ?auto_462042 ?auto_462051 ) ) ( not ( = ?auto_462042 ?auto_462052 ) ) ( not ( = ?auto_462042 ?auto_462053 ) ) ( not ( = ?auto_462042 ?auto_462054 ) ) ( not ( = ?auto_462043 ?auto_462044 ) ) ( not ( = ?auto_462043 ?auto_462045 ) ) ( not ( = ?auto_462043 ?auto_462046 ) ) ( not ( = ?auto_462043 ?auto_462047 ) ) ( not ( = ?auto_462043 ?auto_462048 ) ) ( not ( = ?auto_462043 ?auto_462049 ) ) ( not ( = ?auto_462043 ?auto_462050 ) ) ( not ( = ?auto_462043 ?auto_462051 ) ) ( not ( = ?auto_462043 ?auto_462052 ) ) ( not ( = ?auto_462043 ?auto_462053 ) ) ( not ( = ?auto_462043 ?auto_462054 ) ) ( not ( = ?auto_462044 ?auto_462045 ) ) ( not ( = ?auto_462044 ?auto_462046 ) ) ( not ( = ?auto_462044 ?auto_462047 ) ) ( not ( = ?auto_462044 ?auto_462048 ) ) ( not ( = ?auto_462044 ?auto_462049 ) ) ( not ( = ?auto_462044 ?auto_462050 ) ) ( not ( = ?auto_462044 ?auto_462051 ) ) ( not ( = ?auto_462044 ?auto_462052 ) ) ( not ( = ?auto_462044 ?auto_462053 ) ) ( not ( = ?auto_462044 ?auto_462054 ) ) ( not ( = ?auto_462045 ?auto_462046 ) ) ( not ( = ?auto_462045 ?auto_462047 ) ) ( not ( = ?auto_462045 ?auto_462048 ) ) ( not ( = ?auto_462045 ?auto_462049 ) ) ( not ( = ?auto_462045 ?auto_462050 ) ) ( not ( = ?auto_462045 ?auto_462051 ) ) ( not ( = ?auto_462045 ?auto_462052 ) ) ( not ( = ?auto_462045 ?auto_462053 ) ) ( not ( = ?auto_462045 ?auto_462054 ) ) ( not ( = ?auto_462046 ?auto_462047 ) ) ( not ( = ?auto_462046 ?auto_462048 ) ) ( not ( = ?auto_462046 ?auto_462049 ) ) ( not ( = ?auto_462046 ?auto_462050 ) ) ( not ( = ?auto_462046 ?auto_462051 ) ) ( not ( = ?auto_462046 ?auto_462052 ) ) ( not ( = ?auto_462046 ?auto_462053 ) ) ( not ( = ?auto_462046 ?auto_462054 ) ) ( not ( = ?auto_462047 ?auto_462048 ) ) ( not ( = ?auto_462047 ?auto_462049 ) ) ( not ( = ?auto_462047 ?auto_462050 ) ) ( not ( = ?auto_462047 ?auto_462051 ) ) ( not ( = ?auto_462047 ?auto_462052 ) ) ( not ( = ?auto_462047 ?auto_462053 ) ) ( not ( = ?auto_462047 ?auto_462054 ) ) ( not ( = ?auto_462048 ?auto_462049 ) ) ( not ( = ?auto_462048 ?auto_462050 ) ) ( not ( = ?auto_462048 ?auto_462051 ) ) ( not ( = ?auto_462048 ?auto_462052 ) ) ( not ( = ?auto_462048 ?auto_462053 ) ) ( not ( = ?auto_462048 ?auto_462054 ) ) ( not ( = ?auto_462049 ?auto_462050 ) ) ( not ( = ?auto_462049 ?auto_462051 ) ) ( not ( = ?auto_462049 ?auto_462052 ) ) ( not ( = ?auto_462049 ?auto_462053 ) ) ( not ( = ?auto_462049 ?auto_462054 ) ) ( not ( = ?auto_462050 ?auto_462051 ) ) ( not ( = ?auto_462050 ?auto_462052 ) ) ( not ( = ?auto_462050 ?auto_462053 ) ) ( not ( = ?auto_462050 ?auto_462054 ) ) ( not ( = ?auto_462051 ?auto_462052 ) ) ( not ( = ?auto_462051 ?auto_462053 ) ) ( not ( = ?auto_462051 ?auto_462054 ) ) ( not ( = ?auto_462052 ?auto_462053 ) ) ( not ( = ?auto_462052 ?auto_462054 ) ) ( not ( = ?auto_462053 ?auto_462054 ) ) ( ON ?auto_462052 ?auto_462053 ) ( ON ?auto_462051 ?auto_462052 ) ( CLEAR ?auto_462049 ) ( ON ?auto_462050 ?auto_462051 ) ( CLEAR ?auto_462050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_462042 ?auto_462043 ?auto_462044 ?auto_462045 ?auto_462046 ?auto_462047 ?auto_462048 ?auto_462049 ?auto_462050 )
      ( MAKE-12PILE ?auto_462042 ?auto_462043 ?auto_462044 ?auto_462045 ?auto_462046 ?auto_462047 ?auto_462048 ?auto_462049 ?auto_462050 ?auto_462051 ?auto_462052 ?auto_462053 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462067 - BLOCK
      ?auto_462068 - BLOCK
      ?auto_462069 - BLOCK
      ?auto_462070 - BLOCK
      ?auto_462071 - BLOCK
      ?auto_462072 - BLOCK
      ?auto_462073 - BLOCK
      ?auto_462074 - BLOCK
      ?auto_462075 - BLOCK
      ?auto_462076 - BLOCK
      ?auto_462077 - BLOCK
      ?auto_462078 - BLOCK
    )
    :vars
    (
      ?auto_462079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462078 ?auto_462079 ) ( ON-TABLE ?auto_462067 ) ( ON ?auto_462068 ?auto_462067 ) ( ON ?auto_462069 ?auto_462068 ) ( ON ?auto_462070 ?auto_462069 ) ( ON ?auto_462071 ?auto_462070 ) ( ON ?auto_462072 ?auto_462071 ) ( ON ?auto_462073 ?auto_462072 ) ( ON ?auto_462074 ?auto_462073 ) ( not ( = ?auto_462067 ?auto_462068 ) ) ( not ( = ?auto_462067 ?auto_462069 ) ) ( not ( = ?auto_462067 ?auto_462070 ) ) ( not ( = ?auto_462067 ?auto_462071 ) ) ( not ( = ?auto_462067 ?auto_462072 ) ) ( not ( = ?auto_462067 ?auto_462073 ) ) ( not ( = ?auto_462067 ?auto_462074 ) ) ( not ( = ?auto_462067 ?auto_462075 ) ) ( not ( = ?auto_462067 ?auto_462076 ) ) ( not ( = ?auto_462067 ?auto_462077 ) ) ( not ( = ?auto_462067 ?auto_462078 ) ) ( not ( = ?auto_462067 ?auto_462079 ) ) ( not ( = ?auto_462068 ?auto_462069 ) ) ( not ( = ?auto_462068 ?auto_462070 ) ) ( not ( = ?auto_462068 ?auto_462071 ) ) ( not ( = ?auto_462068 ?auto_462072 ) ) ( not ( = ?auto_462068 ?auto_462073 ) ) ( not ( = ?auto_462068 ?auto_462074 ) ) ( not ( = ?auto_462068 ?auto_462075 ) ) ( not ( = ?auto_462068 ?auto_462076 ) ) ( not ( = ?auto_462068 ?auto_462077 ) ) ( not ( = ?auto_462068 ?auto_462078 ) ) ( not ( = ?auto_462068 ?auto_462079 ) ) ( not ( = ?auto_462069 ?auto_462070 ) ) ( not ( = ?auto_462069 ?auto_462071 ) ) ( not ( = ?auto_462069 ?auto_462072 ) ) ( not ( = ?auto_462069 ?auto_462073 ) ) ( not ( = ?auto_462069 ?auto_462074 ) ) ( not ( = ?auto_462069 ?auto_462075 ) ) ( not ( = ?auto_462069 ?auto_462076 ) ) ( not ( = ?auto_462069 ?auto_462077 ) ) ( not ( = ?auto_462069 ?auto_462078 ) ) ( not ( = ?auto_462069 ?auto_462079 ) ) ( not ( = ?auto_462070 ?auto_462071 ) ) ( not ( = ?auto_462070 ?auto_462072 ) ) ( not ( = ?auto_462070 ?auto_462073 ) ) ( not ( = ?auto_462070 ?auto_462074 ) ) ( not ( = ?auto_462070 ?auto_462075 ) ) ( not ( = ?auto_462070 ?auto_462076 ) ) ( not ( = ?auto_462070 ?auto_462077 ) ) ( not ( = ?auto_462070 ?auto_462078 ) ) ( not ( = ?auto_462070 ?auto_462079 ) ) ( not ( = ?auto_462071 ?auto_462072 ) ) ( not ( = ?auto_462071 ?auto_462073 ) ) ( not ( = ?auto_462071 ?auto_462074 ) ) ( not ( = ?auto_462071 ?auto_462075 ) ) ( not ( = ?auto_462071 ?auto_462076 ) ) ( not ( = ?auto_462071 ?auto_462077 ) ) ( not ( = ?auto_462071 ?auto_462078 ) ) ( not ( = ?auto_462071 ?auto_462079 ) ) ( not ( = ?auto_462072 ?auto_462073 ) ) ( not ( = ?auto_462072 ?auto_462074 ) ) ( not ( = ?auto_462072 ?auto_462075 ) ) ( not ( = ?auto_462072 ?auto_462076 ) ) ( not ( = ?auto_462072 ?auto_462077 ) ) ( not ( = ?auto_462072 ?auto_462078 ) ) ( not ( = ?auto_462072 ?auto_462079 ) ) ( not ( = ?auto_462073 ?auto_462074 ) ) ( not ( = ?auto_462073 ?auto_462075 ) ) ( not ( = ?auto_462073 ?auto_462076 ) ) ( not ( = ?auto_462073 ?auto_462077 ) ) ( not ( = ?auto_462073 ?auto_462078 ) ) ( not ( = ?auto_462073 ?auto_462079 ) ) ( not ( = ?auto_462074 ?auto_462075 ) ) ( not ( = ?auto_462074 ?auto_462076 ) ) ( not ( = ?auto_462074 ?auto_462077 ) ) ( not ( = ?auto_462074 ?auto_462078 ) ) ( not ( = ?auto_462074 ?auto_462079 ) ) ( not ( = ?auto_462075 ?auto_462076 ) ) ( not ( = ?auto_462075 ?auto_462077 ) ) ( not ( = ?auto_462075 ?auto_462078 ) ) ( not ( = ?auto_462075 ?auto_462079 ) ) ( not ( = ?auto_462076 ?auto_462077 ) ) ( not ( = ?auto_462076 ?auto_462078 ) ) ( not ( = ?auto_462076 ?auto_462079 ) ) ( not ( = ?auto_462077 ?auto_462078 ) ) ( not ( = ?auto_462077 ?auto_462079 ) ) ( not ( = ?auto_462078 ?auto_462079 ) ) ( ON ?auto_462077 ?auto_462078 ) ( ON ?auto_462076 ?auto_462077 ) ( CLEAR ?auto_462074 ) ( ON ?auto_462075 ?auto_462076 ) ( CLEAR ?auto_462075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_462067 ?auto_462068 ?auto_462069 ?auto_462070 ?auto_462071 ?auto_462072 ?auto_462073 ?auto_462074 ?auto_462075 )
      ( MAKE-12PILE ?auto_462067 ?auto_462068 ?auto_462069 ?auto_462070 ?auto_462071 ?auto_462072 ?auto_462073 ?auto_462074 ?auto_462075 ?auto_462076 ?auto_462077 ?auto_462078 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462092 - BLOCK
      ?auto_462093 - BLOCK
      ?auto_462094 - BLOCK
      ?auto_462095 - BLOCK
      ?auto_462096 - BLOCK
      ?auto_462097 - BLOCK
      ?auto_462098 - BLOCK
      ?auto_462099 - BLOCK
      ?auto_462100 - BLOCK
      ?auto_462101 - BLOCK
      ?auto_462102 - BLOCK
      ?auto_462103 - BLOCK
    )
    :vars
    (
      ?auto_462104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462103 ?auto_462104 ) ( ON-TABLE ?auto_462092 ) ( ON ?auto_462093 ?auto_462092 ) ( ON ?auto_462094 ?auto_462093 ) ( ON ?auto_462095 ?auto_462094 ) ( ON ?auto_462096 ?auto_462095 ) ( ON ?auto_462097 ?auto_462096 ) ( ON ?auto_462098 ?auto_462097 ) ( not ( = ?auto_462092 ?auto_462093 ) ) ( not ( = ?auto_462092 ?auto_462094 ) ) ( not ( = ?auto_462092 ?auto_462095 ) ) ( not ( = ?auto_462092 ?auto_462096 ) ) ( not ( = ?auto_462092 ?auto_462097 ) ) ( not ( = ?auto_462092 ?auto_462098 ) ) ( not ( = ?auto_462092 ?auto_462099 ) ) ( not ( = ?auto_462092 ?auto_462100 ) ) ( not ( = ?auto_462092 ?auto_462101 ) ) ( not ( = ?auto_462092 ?auto_462102 ) ) ( not ( = ?auto_462092 ?auto_462103 ) ) ( not ( = ?auto_462092 ?auto_462104 ) ) ( not ( = ?auto_462093 ?auto_462094 ) ) ( not ( = ?auto_462093 ?auto_462095 ) ) ( not ( = ?auto_462093 ?auto_462096 ) ) ( not ( = ?auto_462093 ?auto_462097 ) ) ( not ( = ?auto_462093 ?auto_462098 ) ) ( not ( = ?auto_462093 ?auto_462099 ) ) ( not ( = ?auto_462093 ?auto_462100 ) ) ( not ( = ?auto_462093 ?auto_462101 ) ) ( not ( = ?auto_462093 ?auto_462102 ) ) ( not ( = ?auto_462093 ?auto_462103 ) ) ( not ( = ?auto_462093 ?auto_462104 ) ) ( not ( = ?auto_462094 ?auto_462095 ) ) ( not ( = ?auto_462094 ?auto_462096 ) ) ( not ( = ?auto_462094 ?auto_462097 ) ) ( not ( = ?auto_462094 ?auto_462098 ) ) ( not ( = ?auto_462094 ?auto_462099 ) ) ( not ( = ?auto_462094 ?auto_462100 ) ) ( not ( = ?auto_462094 ?auto_462101 ) ) ( not ( = ?auto_462094 ?auto_462102 ) ) ( not ( = ?auto_462094 ?auto_462103 ) ) ( not ( = ?auto_462094 ?auto_462104 ) ) ( not ( = ?auto_462095 ?auto_462096 ) ) ( not ( = ?auto_462095 ?auto_462097 ) ) ( not ( = ?auto_462095 ?auto_462098 ) ) ( not ( = ?auto_462095 ?auto_462099 ) ) ( not ( = ?auto_462095 ?auto_462100 ) ) ( not ( = ?auto_462095 ?auto_462101 ) ) ( not ( = ?auto_462095 ?auto_462102 ) ) ( not ( = ?auto_462095 ?auto_462103 ) ) ( not ( = ?auto_462095 ?auto_462104 ) ) ( not ( = ?auto_462096 ?auto_462097 ) ) ( not ( = ?auto_462096 ?auto_462098 ) ) ( not ( = ?auto_462096 ?auto_462099 ) ) ( not ( = ?auto_462096 ?auto_462100 ) ) ( not ( = ?auto_462096 ?auto_462101 ) ) ( not ( = ?auto_462096 ?auto_462102 ) ) ( not ( = ?auto_462096 ?auto_462103 ) ) ( not ( = ?auto_462096 ?auto_462104 ) ) ( not ( = ?auto_462097 ?auto_462098 ) ) ( not ( = ?auto_462097 ?auto_462099 ) ) ( not ( = ?auto_462097 ?auto_462100 ) ) ( not ( = ?auto_462097 ?auto_462101 ) ) ( not ( = ?auto_462097 ?auto_462102 ) ) ( not ( = ?auto_462097 ?auto_462103 ) ) ( not ( = ?auto_462097 ?auto_462104 ) ) ( not ( = ?auto_462098 ?auto_462099 ) ) ( not ( = ?auto_462098 ?auto_462100 ) ) ( not ( = ?auto_462098 ?auto_462101 ) ) ( not ( = ?auto_462098 ?auto_462102 ) ) ( not ( = ?auto_462098 ?auto_462103 ) ) ( not ( = ?auto_462098 ?auto_462104 ) ) ( not ( = ?auto_462099 ?auto_462100 ) ) ( not ( = ?auto_462099 ?auto_462101 ) ) ( not ( = ?auto_462099 ?auto_462102 ) ) ( not ( = ?auto_462099 ?auto_462103 ) ) ( not ( = ?auto_462099 ?auto_462104 ) ) ( not ( = ?auto_462100 ?auto_462101 ) ) ( not ( = ?auto_462100 ?auto_462102 ) ) ( not ( = ?auto_462100 ?auto_462103 ) ) ( not ( = ?auto_462100 ?auto_462104 ) ) ( not ( = ?auto_462101 ?auto_462102 ) ) ( not ( = ?auto_462101 ?auto_462103 ) ) ( not ( = ?auto_462101 ?auto_462104 ) ) ( not ( = ?auto_462102 ?auto_462103 ) ) ( not ( = ?auto_462102 ?auto_462104 ) ) ( not ( = ?auto_462103 ?auto_462104 ) ) ( ON ?auto_462102 ?auto_462103 ) ( ON ?auto_462101 ?auto_462102 ) ( ON ?auto_462100 ?auto_462101 ) ( CLEAR ?auto_462098 ) ( ON ?auto_462099 ?auto_462100 ) ( CLEAR ?auto_462099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_462092 ?auto_462093 ?auto_462094 ?auto_462095 ?auto_462096 ?auto_462097 ?auto_462098 ?auto_462099 )
      ( MAKE-12PILE ?auto_462092 ?auto_462093 ?auto_462094 ?auto_462095 ?auto_462096 ?auto_462097 ?auto_462098 ?auto_462099 ?auto_462100 ?auto_462101 ?auto_462102 ?auto_462103 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462117 - BLOCK
      ?auto_462118 - BLOCK
      ?auto_462119 - BLOCK
      ?auto_462120 - BLOCK
      ?auto_462121 - BLOCK
      ?auto_462122 - BLOCK
      ?auto_462123 - BLOCK
      ?auto_462124 - BLOCK
      ?auto_462125 - BLOCK
      ?auto_462126 - BLOCK
      ?auto_462127 - BLOCK
      ?auto_462128 - BLOCK
    )
    :vars
    (
      ?auto_462129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462128 ?auto_462129 ) ( ON-TABLE ?auto_462117 ) ( ON ?auto_462118 ?auto_462117 ) ( ON ?auto_462119 ?auto_462118 ) ( ON ?auto_462120 ?auto_462119 ) ( ON ?auto_462121 ?auto_462120 ) ( ON ?auto_462122 ?auto_462121 ) ( ON ?auto_462123 ?auto_462122 ) ( not ( = ?auto_462117 ?auto_462118 ) ) ( not ( = ?auto_462117 ?auto_462119 ) ) ( not ( = ?auto_462117 ?auto_462120 ) ) ( not ( = ?auto_462117 ?auto_462121 ) ) ( not ( = ?auto_462117 ?auto_462122 ) ) ( not ( = ?auto_462117 ?auto_462123 ) ) ( not ( = ?auto_462117 ?auto_462124 ) ) ( not ( = ?auto_462117 ?auto_462125 ) ) ( not ( = ?auto_462117 ?auto_462126 ) ) ( not ( = ?auto_462117 ?auto_462127 ) ) ( not ( = ?auto_462117 ?auto_462128 ) ) ( not ( = ?auto_462117 ?auto_462129 ) ) ( not ( = ?auto_462118 ?auto_462119 ) ) ( not ( = ?auto_462118 ?auto_462120 ) ) ( not ( = ?auto_462118 ?auto_462121 ) ) ( not ( = ?auto_462118 ?auto_462122 ) ) ( not ( = ?auto_462118 ?auto_462123 ) ) ( not ( = ?auto_462118 ?auto_462124 ) ) ( not ( = ?auto_462118 ?auto_462125 ) ) ( not ( = ?auto_462118 ?auto_462126 ) ) ( not ( = ?auto_462118 ?auto_462127 ) ) ( not ( = ?auto_462118 ?auto_462128 ) ) ( not ( = ?auto_462118 ?auto_462129 ) ) ( not ( = ?auto_462119 ?auto_462120 ) ) ( not ( = ?auto_462119 ?auto_462121 ) ) ( not ( = ?auto_462119 ?auto_462122 ) ) ( not ( = ?auto_462119 ?auto_462123 ) ) ( not ( = ?auto_462119 ?auto_462124 ) ) ( not ( = ?auto_462119 ?auto_462125 ) ) ( not ( = ?auto_462119 ?auto_462126 ) ) ( not ( = ?auto_462119 ?auto_462127 ) ) ( not ( = ?auto_462119 ?auto_462128 ) ) ( not ( = ?auto_462119 ?auto_462129 ) ) ( not ( = ?auto_462120 ?auto_462121 ) ) ( not ( = ?auto_462120 ?auto_462122 ) ) ( not ( = ?auto_462120 ?auto_462123 ) ) ( not ( = ?auto_462120 ?auto_462124 ) ) ( not ( = ?auto_462120 ?auto_462125 ) ) ( not ( = ?auto_462120 ?auto_462126 ) ) ( not ( = ?auto_462120 ?auto_462127 ) ) ( not ( = ?auto_462120 ?auto_462128 ) ) ( not ( = ?auto_462120 ?auto_462129 ) ) ( not ( = ?auto_462121 ?auto_462122 ) ) ( not ( = ?auto_462121 ?auto_462123 ) ) ( not ( = ?auto_462121 ?auto_462124 ) ) ( not ( = ?auto_462121 ?auto_462125 ) ) ( not ( = ?auto_462121 ?auto_462126 ) ) ( not ( = ?auto_462121 ?auto_462127 ) ) ( not ( = ?auto_462121 ?auto_462128 ) ) ( not ( = ?auto_462121 ?auto_462129 ) ) ( not ( = ?auto_462122 ?auto_462123 ) ) ( not ( = ?auto_462122 ?auto_462124 ) ) ( not ( = ?auto_462122 ?auto_462125 ) ) ( not ( = ?auto_462122 ?auto_462126 ) ) ( not ( = ?auto_462122 ?auto_462127 ) ) ( not ( = ?auto_462122 ?auto_462128 ) ) ( not ( = ?auto_462122 ?auto_462129 ) ) ( not ( = ?auto_462123 ?auto_462124 ) ) ( not ( = ?auto_462123 ?auto_462125 ) ) ( not ( = ?auto_462123 ?auto_462126 ) ) ( not ( = ?auto_462123 ?auto_462127 ) ) ( not ( = ?auto_462123 ?auto_462128 ) ) ( not ( = ?auto_462123 ?auto_462129 ) ) ( not ( = ?auto_462124 ?auto_462125 ) ) ( not ( = ?auto_462124 ?auto_462126 ) ) ( not ( = ?auto_462124 ?auto_462127 ) ) ( not ( = ?auto_462124 ?auto_462128 ) ) ( not ( = ?auto_462124 ?auto_462129 ) ) ( not ( = ?auto_462125 ?auto_462126 ) ) ( not ( = ?auto_462125 ?auto_462127 ) ) ( not ( = ?auto_462125 ?auto_462128 ) ) ( not ( = ?auto_462125 ?auto_462129 ) ) ( not ( = ?auto_462126 ?auto_462127 ) ) ( not ( = ?auto_462126 ?auto_462128 ) ) ( not ( = ?auto_462126 ?auto_462129 ) ) ( not ( = ?auto_462127 ?auto_462128 ) ) ( not ( = ?auto_462127 ?auto_462129 ) ) ( not ( = ?auto_462128 ?auto_462129 ) ) ( ON ?auto_462127 ?auto_462128 ) ( ON ?auto_462126 ?auto_462127 ) ( ON ?auto_462125 ?auto_462126 ) ( CLEAR ?auto_462123 ) ( ON ?auto_462124 ?auto_462125 ) ( CLEAR ?auto_462124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_462117 ?auto_462118 ?auto_462119 ?auto_462120 ?auto_462121 ?auto_462122 ?auto_462123 ?auto_462124 )
      ( MAKE-12PILE ?auto_462117 ?auto_462118 ?auto_462119 ?auto_462120 ?auto_462121 ?auto_462122 ?auto_462123 ?auto_462124 ?auto_462125 ?auto_462126 ?auto_462127 ?auto_462128 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462142 - BLOCK
      ?auto_462143 - BLOCK
      ?auto_462144 - BLOCK
      ?auto_462145 - BLOCK
      ?auto_462146 - BLOCK
      ?auto_462147 - BLOCK
      ?auto_462148 - BLOCK
      ?auto_462149 - BLOCK
      ?auto_462150 - BLOCK
      ?auto_462151 - BLOCK
      ?auto_462152 - BLOCK
      ?auto_462153 - BLOCK
    )
    :vars
    (
      ?auto_462154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462153 ?auto_462154 ) ( ON-TABLE ?auto_462142 ) ( ON ?auto_462143 ?auto_462142 ) ( ON ?auto_462144 ?auto_462143 ) ( ON ?auto_462145 ?auto_462144 ) ( ON ?auto_462146 ?auto_462145 ) ( ON ?auto_462147 ?auto_462146 ) ( not ( = ?auto_462142 ?auto_462143 ) ) ( not ( = ?auto_462142 ?auto_462144 ) ) ( not ( = ?auto_462142 ?auto_462145 ) ) ( not ( = ?auto_462142 ?auto_462146 ) ) ( not ( = ?auto_462142 ?auto_462147 ) ) ( not ( = ?auto_462142 ?auto_462148 ) ) ( not ( = ?auto_462142 ?auto_462149 ) ) ( not ( = ?auto_462142 ?auto_462150 ) ) ( not ( = ?auto_462142 ?auto_462151 ) ) ( not ( = ?auto_462142 ?auto_462152 ) ) ( not ( = ?auto_462142 ?auto_462153 ) ) ( not ( = ?auto_462142 ?auto_462154 ) ) ( not ( = ?auto_462143 ?auto_462144 ) ) ( not ( = ?auto_462143 ?auto_462145 ) ) ( not ( = ?auto_462143 ?auto_462146 ) ) ( not ( = ?auto_462143 ?auto_462147 ) ) ( not ( = ?auto_462143 ?auto_462148 ) ) ( not ( = ?auto_462143 ?auto_462149 ) ) ( not ( = ?auto_462143 ?auto_462150 ) ) ( not ( = ?auto_462143 ?auto_462151 ) ) ( not ( = ?auto_462143 ?auto_462152 ) ) ( not ( = ?auto_462143 ?auto_462153 ) ) ( not ( = ?auto_462143 ?auto_462154 ) ) ( not ( = ?auto_462144 ?auto_462145 ) ) ( not ( = ?auto_462144 ?auto_462146 ) ) ( not ( = ?auto_462144 ?auto_462147 ) ) ( not ( = ?auto_462144 ?auto_462148 ) ) ( not ( = ?auto_462144 ?auto_462149 ) ) ( not ( = ?auto_462144 ?auto_462150 ) ) ( not ( = ?auto_462144 ?auto_462151 ) ) ( not ( = ?auto_462144 ?auto_462152 ) ) ( not ( = ?auto_462144 ?auto_462153 ) ) ( not ( = ?auto_462144 ?auto_462154 ) ) ( not ( = ?auto_462145 ?auto_462146 ) ) ( not ( = ?auto_462145 ?auto_462147 ) ) ( not ( = ?auto_462145 ?auto_462148 ) ) ( not ( = ?auto_462145 ?auto_462149 ) ) ( not ( = ?auto_462145 ?auto_462150 ) ) ( not ( = ?auto_462145 ?auto_462151 ) ) ( not ( = ?auto_462145 ?auto_462152 ) ) ( not ( = ?auto_462145 ?auto_462153 ) ) ( not ( = ?auto_462145 ?auto_462154 ) ) ( not ( = ?auto_462146 ?auto_462147 ) ) ( not ( = ?auto_462146 ?auto_462148 ) ) ( not ( = ?auto_462146 ?auto_462149 ) ) ( not ( = ?auto_462146 ?auto_462150 ) ) ( not ( = ?auto_462146 ?auto_462151 ) ) ( not ( = ?auto_462146 ?auto_462152 ) ) ( not ( = ?auto_462146 ?auto_462153 ) ) ( not ( = ?auto_462146 ?auto_462154 ) ) ( not ( = ?auto_462147 ?auto_462148 ) ) ( not ( = ?auto_462147 ?auto_462149 ) ) ( not ( = ?auto_462147 ?auto_462150 ) ) ( not ( = ?auto_462147 ?auto_462151 ) ) ( not ( = ?auto_462147 ?auto_462152 ) ) ( not ( = ?auto_462147 ?auto_462153 ) ) ( not ( = ?auto_462147 ?auto_462154 ) ) ( not ( = ?auto_462148 ?auto_462149 ) ) ( not ( = ?auto_462148 ?auto_462150 ) ) ( not ( = ?auto_462148 ?auto_462151 ) ) ( not ( = ?auto_462148 ?auto_462152 ) ) ( not ( = ?auto_462148 ?auto_462153 ) ) ( not ( = ?auto_462148 ?auto_462154 ) ) ( not ( = ?auto_462149 ?auto_462150 ) ) ( not ( = ?auto_462149 ?auto_462151 ) ) ( not ( = ?auto_462149 ?auto_462152 ) ) ( not ( = ?auto_462149 ?auto_462153 ) ) ( not ( = ?auto_462149 ?auto_462154 ) ) ( not ( = ?auto_462150 ?auto_462151 ) ) ( not ( = ?auto_462150 ?auto_462152 ) ) ( not ( = ?auto_462150 ?auto_462153 ) ) ( not ( = ?auto_462150 ?auto_462154 ) ) ( not ( = ?auto_462151 ?auto_462152 ) ) ( not ( = ?auto_462151 ?auto_462153 ) ) ( not ( = ?auto_462151 ?auto_462154 ) ) ( not ( = ?auto_462152 ?auto_462153 ) ) ( not ( = ?auto_462152 ?auto_462154 ) ) ( not ( = ?auto_462153 ?auto_462154 ) ) ( ON ?auto_462152 ?auto_462153 ) ( ON ?auto_462151 ?auto_462152 ) ( ON ?auto_462150 ?auto_462151 ) ( ON ?auto_462149 ?auto_462150 ) ( CLEAR ?auto_462147 ) ( ON ?auto_462148 ?auto_462149 ) ( CLEAR ?auto_462148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_462142 ?auto_462143 ?auto_462144 ?auto_462145 ?auto_462146 ?auto_462147 ?auto_462148 )
      ( MAKE-12PILE ?auto_462142 ?auto_462143 ?auto_462144 ?auto_462145 ?auto_462146 ?auto_462147 ?auto_462148 ?auto_462149 ?auto_462150 ?auto_462151 ?auto_462152 ?auto_462153 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462167 - BLOCK
      ?auto_462168 - BLOCK
      ?auto_462169 - BLOCK
      ?auto_462170 - BLOCK
      ?auto_462171 - BLOCK
      ?auto_462172 - BLOCK
      ?auto_462173 - BLOCK
      ?auto_462174 - BLOCK
      ?auto_462175 - BLOCK
      ?auto_462176 - BLOCK
      ?auto_462177 - BLOCK
      ?auto_462178 - BLOCK
    )
    :vars
    (
      ?auto_462179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462178 ?auto_462179 ) ( ON-TABLE ?auto_462167 ) ( ON ?auto_462168 ?auto_462167 ) ( ON ?auto_462169 ?auto_462168 ) ( ON ?auto_462170 ?auto_462169 ) ( ON ?auto_462171 ?auto_462170 ) ( ON ?auto_462172 ?auto_462171 ) ( not ( = ?auto_462167 ?auto_462168 ) ) ( not ( = ?auto_462167 ?auto_462169 ) ) ( not ( = ?auto_462167 ?auto_462170 ) ) ( not ( = ?auto_462167 ?auto_462171 ) ) ( not ( = ?auto_462167 ?auto_462172 ) ) ( not ( = ?auto_462167 ?auto_462173 ) ) ( not ( = ?auto_462167 ?auto_462174 ) ) ( not ( = ?auto_462167 ?auto_462175 ) ) ( not ( = ?auto_462167 ?auto_462176 ) ) ( not ( = ?auto_462167 ?auto_462177 ) ) ( not ( = ?auto_462167 ?auto_462178 ) ) ( not ( = ?auto_462167 ?auto_462179 ) ) ( not ( = ?auto_462168 ?auto_462169 ) ) ( not ( = ?auto_462168 ?auto_462170 ) ) ( not ( = ?auto_462168 ?auto_462171 ) ) ( not ( = ?auto_462168 ?auto_462172 ) ) ( not ( = ?auto_462168 ?auto_462173 ) ) ( not ( = ?auto_462168 ?auto_462174 ) ) ( not ( = ?auto_462168 ?auto_462175 ) ) ( not ( = ?auto_462168 ?auto_462176 ) ) ( not ( = ?auto_462168 ?auto_462177 ) ) ( not ( = ?auto_462168 ?auto_462178 ) ) ( not ( = ?auto_462168 ?auto_462179 ) ) ( not ( = ?auto_462169 ?auto_462170 ) ) ( not ( = ?auto_462169 ?auto_462171 ) ) ( not ( = ?auto_462169 ?auto_462172 ) ) ( not ( = ?auto_462169 ?auto_462173 ) ) ( not ( = ?auto_462169 ?auto_462174 ) ) ( not ( = ?auto_462169 ?auto_462175 ) ) ( not ( = ?auto_462169 ?auto_462176 ) ) ( not ( = ?auto_462169 ?auto_462177 ) ) ( not ( = ?auto_462169 ?auto_462178 ) ) ( not ( = ?auto_462169 ?auto_462179 ) ) ( not ( = ?auto_462170 ?auto_462171 ) ) ( not ( = ?auto_462170 ?auto_462172 ) ) ( not ( = ?auto_462170 ?auto_462173 ) ) ( not ( = ?auto_462170 ?auto_462174 ) ) ( not ( = ?auto_462170 ?auto_462175 ) ) ( not ( = ?auto_462170 ?auto_462176 ) ) ( not ( = ?auto_462170 ?auto_462177 ) ) ( not ( = ?auto_462170 ?auto_462178 ) ) ( not ( = ?auto_462170 ?auto_462179 ) ) ( not ( = ?auto_462171 ?auto_462172 ) ) ( not ( = ?auto_462171 ?auto_462173 ) ) ( not ( = ?auto_462171 ?auto_462174 ) ) ( not ( = ?auto_462171 ?auto_462175 ) ) ( not ( = ?auto_462171 ?auto_462176 ) ) ( not ( = ?auto_462171 ?auto_462177 ) ) ( not ( = ?auto_462171 ?auto_462178 ) ) ( not ( = ?auto_462171 ?auto_462179 ) ) ( not ( = ?auto_462172 ?auto_462173 ) ) ( not ( = ?auto_462172 ?auto_462174 ) ) ( not ( = ?auto_462172 ?auto_462175 ) ) ( not ( = ?auto_462172 ?auto_462176 ) ) ( not ( = ?auto_462172 ?auto_462177 ) ) ( not ( = ?auto_462172 ?auto_462178 ) ) ( not ( = ?auto_462172 ?auto_462179 ) ) ( not ( = ?auto_462173 ?auto_462174 ) ) ( not ( = ?auto_462173 ?auto_462175 ) ) ( not ( = ?auto_462173 ?auto_462176 ) ) ( not ( = ?auto_462173 ?auto_462177 ) ) ( not ( = ?auto_462173 ?auto_462178 ) ) ( not ( = ?auto_462173 ?auto_462179 ) ) ( not ( = ?auto_462174 ?auto_462175 ) ) ( not ( = ?auto_462174 ?auto_462176 ) ) ( not ( = ?auto_462174 ?auto_462177 ) ) ( not ( = ?auto_462174 ?auto_462178 ) ) ( not ( = ?auto_462174 ?auto_462179 ) ) ( not ( = ?auto_462175 ?auto_462176 ) ) ( not ( = ?auto_462175 ?auto_462177 ) ) ( not ( = ?auto_462175 ?auto_462178 ) ) ( not ( = ?auto_462175 ?auto_462179 ) ) ( not ( = ?auto_462176 ?auto_462177 ) ) ( not ( = ?auto_462176 ?auto_462178 ) ) ( not ( = ?auto_462176 ?auto_462179 ) ) ( not ( = ?auto_462177 ?auto_462178 ) ) ( not ( = ?auto_462177 ?auto_462179 ) ) ( not ( = ?auto_462178 ?auto_462179 ) ) ( ON ?auto_462177 ?auto_462178 ) ( ON ?auto_462176 ?auto_462177 ) ( ON ?auto_462175 ?auto_462176 ) ( ON ?auto_462174 ?auto_462175 ) ( CLEAR ?auto_462172 ) ( ON ?auto_462173 ?auto_462174 ) ( CLEAR ?auto_462173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_462167 ?auto_462168 ?auto_462169 ?auto_462170 ?auto_462171 ?auto_462172 ?auto_462173 )
      ( MAKE-12PILE ?auto_462167 ?auto_462168 ?auto_462169 ?auto_462170 ?auto_462171 ?auto_462172 ?auto_462173 ?auto_462174 ?auto_462175 ?auto_462176 ?auto_462177 ?auto_462178 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462192 - BLOCK
      ?auto_462193 - BLOCK
      ?auto_462194 - BLOCK
      ?auto_462195 - BLOCK
      ?auto_462196 - BLOCK
      ?auto_462197 - BLOCK
      ?auto_462198 - BLOCK
      ?auto_462199 - BLOCK
      ?auto_462200 - BLOCK
      ?auto_462201 - BLOCK
      ?auto_462202 - BLOCK
      ?auto_462203 - BLOCK
    )
    :vars
    (
      ?auto_462204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462203 ?auto_462204 ) ( ON-TABLE ?auto_462192 ) ( ON ?auto_462193 ?auto_462192 ) ( ON ?auto_462194 ?auto_462193 ) ( ON ?auto_462195 ?auto_462194 ) ( ON ?auto_462196 ?auto_462195 ) ( not ( = ?auto_462192 ?auto_462193 ) ) ( not ( = ?auto_462192 ?auto_462194 ) ) ( not ( = ?auto_462192 ?auto_462195 ) ) ( not ( = ?auto_462192 ?auto_462196 ) ) ( not ( = ?auto_462192 ?auto_462197 ) ) ( not ( = ?auto_462192 ?auto_462198 ) ) ( not ( = ?auto_462192 ?auto_462199 ) ) ( not ( = ?auto_462192 ?auto_462200 ) ) ( not ( = ?auto_462192 ?auto_462201 ) ) ( not ( = ?auto_462192 ?auto_462202 ) ) ( not ( = ?auto_462192 ?auto_462203 ) ) ( not ( = ?auto_462192 ?auto_462204 ) ) ( not ( = ?auto_462193 ?auto_462194 ) ) ( not ( = ?auto_462193 ?auto_462195 ) ) ( not ( = ?auto_462193 ?auto_462196 ) ) ( not ( = ?auto_462193 ?auto_462197 ) ) ( not ( = ?auto_462193 ?auto_462198 ) ) ( not ( = ?auto_462193 ?auto_462199 ) ) ( not ( = ?auto_462193 ?auto_462200 ) ) ( not ( = ?auto_462193 ?auto_462201 ) ) ( not ( = ?auto_462193 ?auto_462202 ) ) ( not ( = ?auto_462193 ?auto_462203 ) ) ( not ( = ?auto_462193 ?auto_462204 ) ) ( not ( = ?auto_462194 ?auto_462195 ) ) ( not ( = ?auto_462194 ?auto_462196 ) ) ( not ( = ?auto_462194 ?auto_462197 ) ) ( not ( = ?auto_462194 ?auto_462198 ) ) ( not ( = ?auto_462194 ?auto_462199 ) ) ( not ( = ?auto_462194 ?auto_462200 ) ) ( not ( = ?auto_462194 ?auto_462201 ) ) ( not ( = ?auto_462194 ?auto_462202 ) ) ( not ( = ?auto_462194 ?auto_462203 ) ) ( not ( = ?auto_462194 ?auto_462204 ) ) ( not ( = ?auto_462195 ?auto_462196 ) ) ( not ( = ?auto_462195 ?auto_462197 ) ) ( not ( = ?auto_462195 ?auto_462198 ) ) ( not ( = ?auto_462195 ?auto_462199 ) ) ( not ( = ?auto_462195 ?auto_462200 ) ) ( not ( = ?auto_462195 ?auto_462201 ) ) ( not ( = ?auto_462195 ?auto_462202 ) ) ( not ( = ?auto_462195 ?auto_462203 ) ) ( not ( = ?auto_462195 ?auto_462204 ) ) ( not ( = ?auto_462196 ?auto_462197 ) ) ( not ( = ?auto_462196 ?auto_462198 ) ) ( not ( = ?auto_462196 ?auto_462199 ) ) ( not ( = ?auto_462196 ?auto_462200 ) ) ( not ( = ?auto_462196 ?auto_462201 ) ) ( not ( = ?auto_462196 ?auto_462202 ) ) ( not ( = ?auto_462196 ?auto_462203 ) ) ( not ( = ?auto_462196 ?auto_462204 ) ) ( not ( = ?auto_462197 ?auto_462198 ) ) ( not ( = ?auto_462197 ?auto_462199 ) ) ( not ( = ?auto_462197 ?auto_462200 ) ) ( not ( = ?auto_462197 ?auto_462201 ) ) ( not ( = ?auto_462197 ?auto_462202 ) ) ( not ( = ?auto_462197 ?auto_462203 ) ) ( not ( = ?auto_462197 ?auto_462204 ) ) ( not ( = ?auto_462198 ?auto_462199 ) ) ( not ( = ?auto_462198 ?auto_462200 ) ) ( not ( = ?auto_462198 ?auto_462201 ) ) ( not ( = ?auto_462198 ?auto_462202 ) ) ( not ( = ?auto_462198 ?auto_462203 ) ) ( not ( = ?auto_462198 ?auto_462204 ) ) ( not ( = ?auto_462199 ?auto_462200 ) ) ( not ( = ?auto_462199 ?auto_462201 ) ) ( not ( = ?auto_462199 ?auto_462202 ) ) ( not ( = ?auto_462199 ?auto_462203 ) ) ( not ( = ?auto_462199 ?auto_462204 ) ) ( not ( = ?auto_462200 ?auto_462201 ) ) ( not ( = ?auto_462200 ?auto_462202 ) ) ( not ( = ?auto_462200 ?auto_462203 ) ) ( not ( = ?auto_462200 ?auto_462204 ) ) ( not ( = ?auto_462201 ?auto_462202 ) ) ( not ( = ?auto_462201 ?auto_462203 ) ) ( not ( = ?auto_462201 ?auto_462204 ) ) ( not ( = ?auto_462202 ?auto_462203 ) ) ( not ( = ?auto_462202 ?auto_462204 ) ) ( not ( = ?auto_462203 ?auto_462204 ) ) ( ON ?auto_462202 ?auto_462203 ) ( ON ?auto_462201 ?auto_462202 ) ( ON ?auto_462200 ?auto_462201 ) ( ON ?auto_462199 ?auto_462200 ) ( ON ?auto_462198 ?auto_462199 ) ( CLEAR ?auto_462196 ) ( ON ?auto_462197 ?auto_462198 ) ( CLEAR ?auto_462197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_462192 ?auto_462193 ?auto_462194 ?auto_462195 ?auto_462196 ?auto_462197 )
      ( MAKE-12PILE ?auto_462192 ?auto_462193 ?auto_462194 ?auto_462195 ?auto_462196 ?auto_462197 ?auto_462198 ?auto_462199 ?auto_462200 ?auto_462201 ?auto_462202 ?auto_462203 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462217 - BLOCK
      ?auto_462218 - BLOCK
      ?auto_462219 - BLOCK
      ?auto_462220 - BLOCK
      ?auto_462221 - BLOCK
      ?auto_462222 - BLOCK
      ?auto_462223 - BLOCK
      ?auto_462224 - BLOCK
      ?auto_462225 - BLOCK
      ?auto_462226 - BLOCK
      ?auto_462227 - BLOCK
      ?auto_462228 - BLOCK
    )
    :vars
    (
      ?auto_462229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462228 ?auto_462229 ) ( ON-TABLE ?auto_462217 ) ( ON ?auto_462218 ?auto_462217 ) ( ON ?auto_462219 ?auto_462218 ) ( ON ?auto_462220 ?auto_462219 ) ( ON ?auto_462221 ?auto_462220 ) ( not ( = ?auto_462217 ?auto_462218 ) ) ( not ( = ?auto_462217 ?auto_462219 ) ) ( not ( = ?auto_462217 ?auto_462220 ) ) ( not ( = ?auto_462217 ?auto_462221 ) ) ( not ( = ?auto_462217 ?auto_462222 ) ) ( not ( = ?auto_462217 ?auto_462223 ) ) ( not ( = ?auto_462217 ?auto_462224 ) ) ( not ( = ?auto_462217 ?auto_462225 ) ) ( not ( = ?auto_462217 ?auto_462226 ) ) ( not ( = ?auto_462217 ?auto_462227 ) ) ( not ( = ?auto_462217 ?auto_462228 ) ) ( not ( = ?auto_462217 ?auto_462229 ) ) ( not ( = ?auto_462218 ?auto_462219 ) ) ( not ( = ?auto_462218 ?auto_462220 ) ) ( not ( = ?auto_462218 ?auto_462221 ) ) ( not ( = ?auto_462218 ?auto_462222 ) ) ( not ( = ?auto_462218 ?auto_462223 ) ) ( not ( = ?auto_462218 ?auto_462224 ) ) ( not ( = ?auto_462218 ?auto_462225 ) ) ( not ( = ?auto_462218 ?auto_462226 ) ) ( not ( = ?auto_462218 ?auto_462227 ) ) ( not ( = ?auto_462218 ?auto_462228 ) ) ( not ( = ?auto_462218 ?auto_462229 ) ) ( not ( = ?auto_462219 ?auto_462220 ) ) ( not ( = ?auto_462219 ?auto_462221 ) ) ( not ( = ?auto_462219 ?auto_462222 ) ) ( not ( = ?auto_462219 ?auto_462223 ) ) ( not ( = ?auto_462219 ?auto_462224 ) ) ( not ( = ?auto_462219 ?auto_462225 ) ) ( not ( = ?auto_462219 ?auto_462226 ) ) ( not ( = ?auto_462219 ?auto_462227 ) ) ( not ( = ?auto_462219 ?auto_462228 ) ) ( not ( = ?auto_462219 ?auto_462229 ) ) ( not ( = ?auto_462220 ?auto_462221 ) ) ( not ( = ?auto_462220 ?auto_462222 ) ) ( not ( = ?auto_462220 ?auto_462223 ) ) ( not ( = ?auto_462220 ?auto_462224 ) ) ( not ( = ?auto_462220 ?auto_462225 ) ) ( not ( = ?auto_462220 ?auto_462226 ) ) ( not ( = ?auto_462220 ?auto_462227 ) ) ( not ( = ?auto_462220 ?auto_462228 ) ) ( not ( = ?auto_462220 ?auto_462229 ) ) ( not ( = ?auto_462221 ?auto_462222 ) ) ( not ( = ?auto_462221 ?auto_462223 ) ) ( not ( = ?auto_462221 ?auto_462224 ) ) ( not ( = ?auto_462221 ?auto_462225 ) ) ( not ( = ?auto_462221 ?auto_462226 ) ) ( not ( = ?auto_462221 ?auto_462227 ) ) ( not ( = ?auto_462221 ?auto_462228 ) ) ( not ( = ?auto_462221 ?auto_462229 ) ) ( not ( = ?auto_462222 ?auto_462223 ) ) ( not ( = ?auto_462222 ?auto_462224 ) ) ( not ( = ?auto_462222 ?auto_462225 ) ) ( not ( = ?auto_462222 ?auto_462226 ) ) ( not ( = ?auto_462222 ?auto_462227 ) ) ( not ( = ?auto_462222 ?auto_462228 ) ) ( not ( = ?auto_462222 ?auto_462229 ) ) ( not ( = ?auto_462223 ?auto_462224 ) ) ( not ( = ?auto_462223 ?auto_462225 ) ) ( not ( = ?auto_462223 ?auto_462226 ) ) ( not ( = ?auto_462223 ?auto_462227 ) ) ( not ( = ?auto_462223 ?auto_462228 ) ) ( not ( = ?auto_462223 ?auto_462229 ) ) ( not ( = ?auto_462224 ?auto_462225 ) ) ( not ( = ?auto_462224 ?auto_462226 ) ) ( not ( = ?auto_462224 ?auto_462227 ) ) ( not ( = ?auto_462224 ?auto_462228 ) ) ( not ( = ?auto_462224 ?auto_462229 ) ) ( not ( = ?auto_462225 ?auto_462226 ) ) ( not ( = ?auto_462225 ?auto_462227 ) ) ( not ( = ?auto_462225 ?auto_462228 ) ) ( not ( = ?auto_462225 ?auto_462229 ) ) ( not ( = ?auto_462226 ?auto_462227 ) ) ( not ( = ?auto_462226 ?auto_462228 ) ) ( not ( = ?auto_462226 ?auto_462229 ) ) ( not ( = ?auto_462227 ?auto_462228 ) ) ( not ( = ?auto_462227 ?auto_462229 ) ) ( not ( = ?auto_462228 ?auto_462229 ) ) ( ON ?auto_462227 ?auto_462228 ) ( ON ?auto_462226 ?auto_462227 ) ( ON ?auto_462225 ?auto_462226 ) ( ON ?auto_462224 ?auto_462225 ) ( ON ?auto_462223 ?auto_462224 ) ( CLEAR ?auto_462221 ) ( ON ?auto_462222 ?auto_462223 ) ( CLEAR ?auto_462222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_462217 ?auto_462218 ?auto_462219 ?auto_462220 ?auto_462221 ?auto_462222 )
      ( MAKE-12PILE ?auto_462217 ?auto_462218 ?auto_462219 ?auto_462220 ?auto_462221 ?auto_462222 ?auto_462223 ?auto_462224 ?auto_462225 ?auto_462226 ?auto_462227 ?auto_462228 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462242 - BLOCK
      ?auto_462243 - BLOCK
      ?auto_462244 - BLOCK
      ?auto_462245 - BLOCK
      ?auto_462246 - BLOCK
      ?auto_462247 - BLOCK
      ?auto_462248 - BLOCK
      ?auto_462249 - BLOCK
      ?auto_462250 - BLOCK
      ?auto_462251 - BLOCK
      ?auto_462252 - BLOCK
      ?auto_462253 - BLOCK
    )
    :vars
    (
      ?auto_462254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462253 ?auto_462254 ) ( ON-TABLE ?auto_462242 ) ( ON ?auto_462243 ?auto_462242 ) ( ON ?auto_462244 ?auto_462243 ) ( ON ?auto_462245 ?auto_462244 ) ( not ( = ?auto_462242 ?auto_462243 ) ) ( not ( = ?auto_462242 ?auto_462244 ) ) ( not ( = ?auto_462242 ?auto_462245 ) ) ( not ( = ?auto_462242 ?auto_462246 ) ) ( not ( = ?auto_462242 ?auto_462247 ) ) ( not ( = ?auto_462242 ?auto_462248 ) ) ( not ( = ?auto_462242 ?auto_462249 ) ) ( not ( = ?auto_462242 ?auto_462250 ) ) ( not ( = ?auto_462242 ?auto_462251 ) ) ( not ( = ?auto_462242 ?auto_462252 ) ) ( not ( = ?auto_462242 ?auto_462253 ) ) ( not ( = ?auto_462242 ?auto_462254 ) ) ( not ( = ?auto_462243 ?auto_462244 ) ) ( not ( = ?auto_462243 ?auto_462245 ) ) ( not ( = ?auto_462243 ?auto_462246 ) ) ( not ( = ?auto_462243 ?auto_462247 ) ) ( not ( = ?auto_462243 ?auto_462248 ) ) ( not ( = ?auto_462243 ?auto_462249 ) ) ( not ( = ?auto_462243 ?auto_462250 ) ) ( not ( = ?auto_462243 ?auto_462251 ) ) ( not ( = ?auto_462243 ?auto_462252 ) ) ( not ( = ?auto_462243 ?auto_462253 ) ) ( not ( = ?auto_462243 ?auto_462254 ) ) ( not ( = ?auto_462244 ?auto_462245 ) ) ( not ( = ?auto_462244 ?auto_462246 ) ) ( not ( = ?auto_462244 ?auto_462247 ) ) ( not ( = ?auto_462244 ?auto_462248 ) ) ( not ( = ?auto_462244 ?auto_462249 ) ) ( not ( = ?auto_462244 ?auto_462250 ) ) ( not ( = ?auto_462244 ?auto_462251 ) ) ( not ( = ?auto_462244 ?auto_462252 ) ) ( not ( = ?auto_462244 ?auto_462253 ) ) ( not ( = ?auto_462244 ?auto_462254 ) ) ( not ( = ?auto_462245 ?auto_462246 ) ) ( not ( = ?auto_462245 ?auto_462247 ) ) ( not ( = ?auto_462245 ?auto_462248 ) ) ( not ( = ?auto_462245 ?auto_462249 ) ) ( not ( = ?auto_462245 ?auto_462250 ) ) ( not ( = ?auto_462245 ?auto_462251 ) ) ( not ( = ?auto_462245 ?auto_462252 ) ) ( not ( = ?auto_462245 ?auto_462253 ) ) ( not ( = ?auto_462245 ?auto_462254 ) ) ( not ( = ?auto_462246 ?auto_462247 ) ) ( not ( = ?auto_462246 ?auto_462248 ) ) ( not ( = ?auto_462246 ?auto_462249 ) ) ( not ( = ?auto_462246 ?auto_462250 ) ) ( not ( = ?auto_462246 ?auto_462251 ) ) ( not ( = ?auto_462246 ?auto_462252 ) ) ( not ( = ?auto_462246 ?auto_462253 ) ) ( not ( = ?auto_462246 ?auto_462254 ) ) ( not ( = ?auto_462247 ?auto_462248 ) ) ( not ( = ?auto_462247 ?auto_462249 ) ) ( not ( = ?auto_462247 ?auto_462250 ) ) ( not ( = ?auto_462247 ?auto_462251 ) ) ( not ( = ?auto_462247 ?auto_462252 ) ) ( not ( = ?auto_462247 ?auto_462253 ) ) ( not ( = ?auto_462247 ?auto_462254 ) ) ( not ( = ?auto_462248 ?auto_462249 ) ) ( not ( = ?auto_462248 ?auto_462250 ) ) ( not ( = ?auto_462248 ?auto_462251 ) ) ( not ( = ?auto_462248 ?auto_462252 ) ) ( not ( = ?auto_462248 ?auto_462253 ) ) ( not ( = ?auto_462248 ?auto_462254 ) ) ( not ( = ?auto_462249 ?auto_462250 ) ) ( not ( = ?auto_462249 ?auto_462251 ) ) ( not ( = ?auto_462249 ?auto_462252 ) ) ( not ( = ?auto_462249 ?auto_462253 ) ) ( not ( = ?auto_462249 ?auto_462254 ) ) ( not ( = ?auto_462250 ?auto_462251 ) ) ( not ( = ?auto_462250 ?auto_462252 ) ) ( not ( = ?auto_462250 ?auto_462253 ) ) ( not ( = ?auto_462250 ?auto_462254 ) ) ( not ( = ?auto_462251 ?auto_462252 ) ) ( not ( = ?auto_462251 ?auto_462253 ) ) ( not ( = ?auto_462251 ?auto_462254 ) ) ( not ( = ?auto_462252 ?auto_462253 ) ) ( not ( = ?auto_462252 ?auto_462254 ) ) ( not ( = ?auto_462253 ?auto_462254 ) ) ( ON ?auto_462252 ?auto_462253 ) ( ON ?auto_462251 ?auto_462252 ) ( ON ?auto_462250 ?auto_462251 ) ( ON ?auto_462249 ?auto_462250 ) ( ON ?auto_462248 ?auto_462249 ) ( ON ?auto_462247 ?auto_462248 ) ( CLEAR ?auto_462245 ) ( ON ?auto_462246 ?auto_462247 ) ( CLEAR ?auto_462246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_462242 ?auto_462243 ?auto_462244 ?auto_462245 ?auto_462246 )
      ( MAKE-12PILE ?auto_462242 ?auto_462243 ?auto_462244 ?auto_462245 ?auto_462246 ?auto_462247 ?auto_462248 ?auto_462249 ?auto_462250 ?auto_462251 ?auto_462252 ?auto_462253 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462267 - BLOCK
      ?auto_462268 - BLOCK
      ?auto_462269 - BLOCK
      ?auto_462270 - BLOCK
      ?auto_462271 - BLOCK
      ?auto_462272 - BLOCK
      ?auto_462273 - BLOCK
      ?auto_462274 - BLOCK
      ?auto_462275 - BLOCK
      ?auto_462276 - BLOCK
      ?auto_462277 - BLOCK
      ?auto_462278 - BLOCK
    )
    :vars
    (
      ?auto_462279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462278 ?auto_462279 ) ( ON-TABLE ?auto_462267 ) ( ON ?auto_462268 ?auto_462267 ) ( ON ?auto_462269 ?auto_462268 ) ( ON ?auto_462270 ?auto_462269 ) ( not ( = ?auto_462267 ?auto_462268 ) ) ( not ( = ?auto_462267 ?auto_462269 ) ) ( not ( = ?auto_462267 ?auto_462270 ) ) ( not ( = ?auto_462267 ?auto_462271 ) ) ( not ( = ?auto_462267 ?auto_462272 ) ) ( not ( = ?auto_462267 ?auto_462273 ) ) ( not ( = ?auto_462267 ?auto_462274 ) ) ( not ( = ?auto_462267 ?auto_462275 ) ) ( not ( = ?auto_462267 ?auto_462276 ) ) ( not ( = ?auto_462267 ?auto_462277 ) ) ( not ( = ?auto_462267 ?auto_462278 ) ) ( not ( = ?auto_462267 ?auto_462279 ) ) ( not ( = ?auto_462268 ?auto_462269 ) ) ( not ( = ?auto_462268 ?auto_462270 ) ) ( not ( = ?auto_462268 ?auto_462271 ) ) ( not ( = ?auto_462268 ?auto_462272 ) ) ( not ( = ?auto_462268 ?auto_462273 ) ) ( not ( = ?auto_462268 ?auto_462274 ) ) ( not ( = ?auto_462268 ?auto_462275 ) ) ( not ( = ?auto_462268 ?auto_462276 ) ) ( not ( = ?auto_462268 ?auto_462277 ) ) ( not ( = ?auto_462268 ?auto_462278 ) ) ( not ( = ?auto_462268 ?auto_462279 ) ) ( not ( = ?auto_462269 ?auto_462270 ) ) ( not ( = ?auto_462269 ?auto_462271 ) ) ( not ( = ?auto_462269 ?auto_462272 ) ) ( not ( = ?auto_462269 ?auto_462273 ) ) ( not ( = ?auto_462269 ?auto_462274 ) ) ( not ( = ?auto_462269 ?auto_462275 ) ) ( not ( = ?auto_462269 ?auto_462276 ) ) ( not ( = ?auto_462269 ?auto_462277 ) ) ( not ( = ?auto_462269 ?auto_462278 ) ) ( not ( = ?auto_462269 ?auto_462279 ) ) ( not ( = ?auto_462270 ?auto_462271 ) ) ( not ( = ?auto_462270 ?auto_462272 ) ) ( not ( = ?auto_462270 ?auto_462273 ) ) ( not ( = ?auto_462270 ?auto_462274 ) ) ( not ( = ?auto_462270 ?auto_462275 ) ) ( not ( = ?auto_462270 ?auto_462276 ) ) ( not ( = ?auto_462270 ?auto_462277 ) ) ( not ( = ?auto_462270 ?auto_462278 ) ) ( not ( = ?auto_462270 ?auto_462279 ) ) ( not ( = ?auto_462271 ?auto_462272 ) ) ( not ( = ?auto_462271 ?auto_462273 ) ) ( not ( = ?auto_462271 ?auto_462274 ) ) ( not ( = ?auto_462271 ?auto_462275 ) ) ( not ( = ?auto_462271 ?auto_462276 ) ) ( not ( = ?auto_462271 ?auto_462277 ) ) ( not ( = ?auto_462271 ?auto_462278 ) ) ( not ( = ?auto_462271 ?auto_462279 ) ) ( not ( = ?auto_462272 ?auto_462273 ) ) ( not ( = ?auto_462272 ?auto_462274 ) ) ( not ( = ?auto_462272 ?auto_462275 ) ) ( not ( = ?auto_462272 ?auto_462276 ) ) ( not ( = ?auto_462272 ?auto_462277 ) ) ( not ( = ?auto_462272 ?auto_462278 ) ) ( not ( = ?auto_462272 ?auto_462279 ) ) ( not ( = ?auto_462273 ?auto_462274 ) ) ( not ( = ?auto_462273 ?auto_462275 ) ) ( not ( = ?auto_462273 ?auto_462276 ) ) ( not ( = ?auto_462273 ?auto_462277 ) ) ( not ( = ?auto_462273 ?auto_462278 ) ) ( not ( = ?auto_462273 ?auto_462279 ) ) ( not ( = ?auto_462274 ?auto_462275 ) ) ( not ( = ?auto_462274 ?auto_462276 ) ) ( not ( = ?auto_462274 ?auto_462277 ) ) ( not ( = ?auto_462274 ?auto_462278 ) ) ( not ( = ?auto_462274 ?auto_462279 ) ) ( not ( = ?auto_462275 ?auto_462276 ) ) ( not ( = ?auto_462275 ?auto_462277 ) ) ( not ( = ?auto_462275 ?auto_462278 ) ) ( not ( = ?auto_462275 ?auto_462279 ) ) ( not ( = ?auto_462276 ?auto_462277 ) ) ( not ( = ?auto_462276 ?auto_462278 ) ) ( not ( = ?auto_462276 ?auto_462279 ) ) ( not ( = ?auto_462277 ?auto_462278 ) ) ( not ( = ?auto_462277 ?auto_462279 ) ) ( not ( = ?auto_462278 ?auto_462279 ) ) ( ON ?auto_462277 ?auto_462278 ) ( ON ?auto_462276 ?auto_462277 ) ( ON ?auto_462275 ?auto_462276 ) ( ON ?auto_462274 ?auto_462275 ) ( ON ?auto_462273 ?auto_462274 ) ( ON ?auto_462272 ?auto_462273 ) ( CLEAR ?auto_462270 ) ( ON ?auto_462271 ?auto_462272 ) ( CLEAR ?auto_462271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_462267 ?auto_462268 ?auto_462269 ?auto_462270 ?auto_462271 )
      ( MAKE-12PILE ?auto_462267 ?auto_462268 ?auto_462269 ?auto_462270 ?auto_462271 ?auto_462272 ?auto_462273 ?auto_462274 ?auto_462275 ?auto_462276 ?auto_462277 ?auto_462278 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462292 - BLOCK
      ?auto_462293 - BLOCK
      ?auto_462294 - BLOCK
      ?auto_462295 - BLOCK
      ?auto_462296 - BLOCK
      ?auto_462297 - BLOCK
      ?auto_462298 - BLOCK
      ?auto_462299 - BLOCK
      ?auto_462300 - BLOCK
      ?auto_462301 - BLOCK
      ?auto_462302 - BLOCK
      ?auto_462303 - BLOCK
    )
    :vars
    (
      ?auto_462304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462303 ?auto_462304 ) ( ON-TABLE ?auto_462292 ) ( ON ?auto_462293 ?auto_462292 ) ( ON ?auto_462294 ?auto_462293 ) ( not ( = ?auto_462292 ?auto_462293 ) ) ( not ( = ?auto_462292 ?auto_462294 ) ) ( not ( = ?auto_462292 ?auto_462295 ) ) ( not ( = ?auto_462292 ?auto_462296 ) ) ( not ( = ?auto_462292 ?auto_462297 ) ) ( not ( = ?auto_462292 ?auto_462298 ) ) ( not ( = ?auto_462292 ?auto_462299 ) ) ( not ( = ?auto_462292 ?auto_462300 ) ) ( not ( = ?auto_462292 ?auto_462301 ) ) ( not ( = ?auto_462292 ?auto_462302 ) ) ( not ( = ?auto_462292 ?auto_462303 ) ) ( not ( = ?auto_462292 ?auto_462304 ) ) ( not ( = ?auto_462293 ?auto_462294 ) ) ( not ( = ?auto_462293 ?auto_462295 ) ) ( not ( = ?auto_462293 ?auto_462296 ) ) ( not ( = ?auto_462293 ?auto_462297 ) ) ( not ( = ?auto_462293 ?auto_462298 ) ) ( not ( = ?auto_462293 ?auto_462299 ) ) ( not ( = ?auto_462293 ?auto_462300 ) ) ( not ( = ?auto_462293 ?auto_462301 ) ) ( not ( = ?auto_462293 ?auto_462302 ) ) ( not ( = ?auto_462293 ?auto_462303 ) ) ( not ( = ?auto_462293 ?auto_462304 ) ) ( not ( = ?auto_462294 ?auto_462295 ) ) ( not ( = ?auto_462294 ?auto_462296 ) ) ( not ( = ?auto_462294 ?auto_462297 ) ) ( not ( = ?auto_462294 ?auto_462298 ) ) ( not ( = ?auto_462294 ?auto_462299 ) ) ( not ( = ?auto_462294 ?auto_462300 ) ) ( not ( = ?auto_462294 ?auto_462301 ) ) ( not ( = ?auto_462294 ?auto_462302 ) ) ( not ( = ?auto_462294 ?auto_462303 ) ) ( not ( = ?auto_462294 ?auto_462304 ) ) ( not ( = ?auto_462295 ?auto_462296 ) ) ( not ( = ?auto_462295 ?auto_462297 ) ) ( not ( = ?auto_462295 ?auto_462298 ) ) ( not ( = ?auto_462295 ?auto_462299 ) ) ( not ( = ?auto_462295 ?auto_462300 ) ) ( not ( = ?auto_462295 ?auto_462301 ) ) ( not ( = ?auto_462295 ?auto_462302 ) ) ( not ( = ?auto_462295 ?auto_462303 ) ) ( not ( = ?auto_462295 ?auto_462304 ) ) ( not ( = ?auto_462296 ?auto_462297 ) ) ( not ( = ?auto_462296 ?auto_462298 ) ) ( not ( = ?auto_462296 ?auto_462299 ) ) ( not ( = ?auto_462296 ?auto_462300 ) ) ( not ( = ?auto_462296 ?auto_462301 ) ) ( not ( = ?auto_462296 ?auto_462302 ) ) ( not ( = ?auto_462296 ?auto_462303 ) ) ( not ( = ?auto_462296 ?auto_462304 ) ) ( not ( = ?auto_462297 ?auto_462298 ) ) ( not ( = ?auto_462297 ?auto_462299 ) ) ( not ( = ?auto_462297 ?auto_462300 ) ) ( not ( = ?auto_462297 ?auto_462301 ) ) ( not ( = ?auto_462297 ?auto_462302 ) ) ( not ( = ?auto_462297 ?auto_462303 ) ) ( not ( = ?auto_462297 ?auto_462304 ) ) ( not ( = ?auto_462298 ?auto_462299 ) ) ( not ( = ?auto_462298 ?auto_462300 ) ) ( not ( = ?auto_462298 ?auto_462301 ) ) ( not ( = ?auto_462298 ?auto_462302 ) ) ( not ( = ?auto_462298 ?auto_462303 ) ) ( not ( = ?auto_462298 ?auto_462304 ) ) ( not ( = ?auto_462299 ?auto_462300 ) ) ( not ( = ?auto_462299 ?auto_462301 ) ) ( not ( = ?auto_462299 ?auto_462302 ) ) ( not ( = ?auto_462299 ?auto_462303 ) ) ( not ( = ?auto_462299 ?auto_462304 ) ) ( not ( = ?auto_462300 ?auto_462301 ) ) ( not ( = ?auto_462300 ?auto_462302 ) ) ( not ( = ?auto_462300 ?auto_462303 ) ) ( not ( = ?auto_462300 ?auto_462304 ) ) ( not ( = ?auto_462301 ?auto_462302 ) ) ( not ( = ?auto_462301 ?auto_462303 ) ) ( not ( = ?auto_462301 ?auto_462304 ) ) ( not ( = ?auto_462302 ?auto_462303 ) ) ( not ( = ?auto_462302 ?auto_462304 ) ) ( not ( = ?auto_462303 ?auto_462304 ) ) ( ON ?auto_462302 ?auto_462303 ) ( ON ?auto_462301 ?auto_462302 ) ( ON ?auto_462300 ?auto_462301 ) ( ON ?auto_462299 ?auto_462300 ) ( ON ?auto_462298 ?auto_462299 ) ( ON ?auto_462297 ?auto_462298 ) ( ON ?auto_462296 ?auto_462297 ) ( CLEAR ?auto_462294 ) ( ON ?auto_462295 ?auto_462296 ) ( CLEAR ?auto_462295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_462292 ?auto_462293 ?auto_462294 ?auto_462295 )
      ( MAKE-12PILE ?auto_462292 ?auto_462293 ?auto_462294 ?auto_462295 ?auto_462296 ?auto_462297 ?auto_462298 ?auto_462299 ?auto_462300 ?auto_462301 ?auto_462302 ?auto_462303 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462317 - BLOCK
      ?auto_462318 - BLOCK
      ?auto_462319 - BLOCK
      ?auto_462320 - BLOCK
      ?auto_462321 - BLOCK
      ?auto_462322 - BLOCK
      ?auto_462323 - BLOCK
      ?auto_462324 - BLOCK
      ?auto_462325 - BLOCK
      ?auto_462326 - BLOCK
      ?auto_462327 - BLOCK
      ?auto_462328 - BLOCK
    )
    :vars
    (
      ?auto_462329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462328 ?auto_462329 ) ( ON-TABLE ?auto_462317 ) ( ON ?auto_462318 ?auto_462317 ) ( ON ?auto_462319 ?auto_462318 ) ( not ( = ?auto_462317 ?auto_462318 ) ) ( not ( = ?auto_462317 ?auto_462319 ) ) ( not ( = ?auto_462317 ?auto_462320 ) ) ( not ( = ?auto_462317 ?auto_462321 ) ) ( not ( = ?auto_462317 ?auto_462322 ) ) ( not ( = ?auto_462317 ?auto_462323 ) ) ( not ( = ?auto_462317 ?auto_462324 ) ) ( not ( = ?auto_462317 ?auto_462325 ) ) ( not ( = ?auto_462317 ?auto_462326 ) ) ( not ( = ?auto_462317 ?auto_462327 ) ) ( not ( = ?auto_462317 ?auto_462328 ) ) ( not ( = ?auto_462317 ?auto_462329 ) ) ( not ( = ?auto_462318 ?auto_462319 ) ) ( not ( = ?auto_462318 ?auto_462320 ) ) ( not ( = ?auto_462318 ?auto_462321 ) ) ( not ( = ?auto_462318 ?auto_462322 ) ) ( not ( = ?auto_462318 ?auto_462323 ) ) ( not ( = ?auto_462318 ?auto_462324 ) ) ( not ( = ?auto_462318 ?auto_462325 ) ) ( not ( = ?auto_462318 ?auto_462326 ) ) ( not ( = ?auto_462318 ?auto_462327 ) ) ( not ( = ?auto_462318 ?auto_462328 ) ) ( not ( = ?auto_462318 ?auto_462329 ) ) ( not ( = ?auto_462319 ?auto_462320 ) ) ( not ( = ?auto_462319 ?auto_462321 ) ) ( not ( = ?auto_462319 ?auto_462322 ) ) ( not ( = ?auto_462319 ?auto_462323 ) ) ( not ( = ?auto_462319 ?auto_462324 ) ) ( not ( = ?auto_462319 ?auto_462325 ) ) ( not ( = ?auto_462319 ?auto_462326 ) ) ( not ( = ?auto_462319 ?auto_462327 ) ) ( not ( = ?auto_462319 ?auto_462328 ) ) ( not ( = ?auto_462319 ?auto_462329 ) ) ( not ( = ?auto_462320 ?auto_462321 ) ) ( not ( = ?auto_462320 ?auto_462322 ) ) ( not ( = ?auto_462320 ?auto_462323 ) ) ( not ( = ?auto_462320 ?auto_462324 ) ) ( not ( = ?auto_462320 ?auto_462325 ) ) ( not ( = ?auto_462320 ?auto_462326 ) ) ( not ( = ?auto_462320 ?auto_462327 ) ) ( not ( = ?auto_462320 ?auto_462328 ) ) ( not ( = ?auto_462320 ?auto_462329 ) ) ( not ( = ?auto_462321 ?auto_462322 ) ) ( not ( = ?auto_462321 ?auto_462323 ) ) ( not ( = ?auto_462321 ?auto_462324 ) ) ( not ( = ?auto_462321 ?auto_462325 ) ) ( not ( = ?auto_462321 ?auto_462326 ) ) ( not ( = ?auto_462321 ?auto_462327 ) ) ( not ( = ?auto_462321 ?auto_462328 ) ) ( not ( = ?auto_462321 ?auto_462329 ) ) ( not ( = ?auto_462322 ?auto_462323 ) ) ( not ( = ?auto_462322 ?auto_462324 ) ) ( not ( = ?auto_462322 ?auto_462325 ) ) ( not ( = ?auto_462322 ?auto_462326 ) ) ( not ( = ?auto_462322 ?auto_462327 ) ) ( not ( = ?auto_462322 ?auto_462328 ) ) ( not ( = ?auto_462322 ?auto_462329 ) ) ( not ( = ?auto_462323 ?auto_462324 ) ) ( not ( = ?auto_462323 ?auto_462325 ) ) ( not ( = ?auto_462323 ?auto_462326 ) ) ( not ( = ?auto_462323 ?auto_462327 ) ) ( not ( = ?auto_462323 ?auto_462328 ) ) ( not ( = ?auto_462323 ?auto_462329 ) ) ( not ( = ?auto_462324 ?auto_462325 ) ) ( not ( = ?auto_462324 ?auto_462326 ) ) ( not ( = ?auto_462324 ?auto_462327 ) ) ( not ( = ?auto_462324 ?auto_462328 ) ) ( not ( = ?auto_462324 ?auto_462329 ) ) ( not ( = ?auto_462325 ?auto_462326 ) ) ( not ( = ?auto_462325 ?auto_462327 ) ) ( not ( = ?auto_462325 ?auto_462328 ) ) ( not ( = ?auto_462325 ?auto_462329 ) ) ( not ( = ?auto_462326 ?auto_462327 ) ) ( not ( = ?auto_462326 ?auto_462328 ) ) ( not ( = ?auto_462326 ?auto_462329 ) ) ( not ( = ?auto_462327 ?auto_462328 ) ) ( not ( = ?auto_462327 ?auto_462329 ) ) ( not ( = ?auto_462328 ?auto_462329 ) ) ( ON ?auto_462327 ?auto_462328 ) ( ON ?auto_462326 ?auto_462327 ) ( ON ?auto_462325 ?auto_462326 ) ( ON ?auto_462324 ?auto_462325 ) ( ON ?auto_462323 ?auto_462324 ) ( ON ?auto_462322 ?auto_462323 ) ( ON ?auto_462321 ?auto_462322 ) ( CLEAR ?auto_462319 ) ( ON ?auto_462320 ?auto_462321 ) ( CLEAR ?auto_462320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_462317 ?auto_462318 ?auto_462319 ?auto_462320 )
      ( MAKE-12PILE ?auto_462317 ?auto_462318 ?auto_462319 ?auto_462320 ?auto_462321 ?auto_462322 ?auto_462323 ?auto_462324 ?auto_462325 ?auto_462326 ?auto_462327 ?auto_462328 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462342 - BLOCK
      ?auto_462343 - BLOCK
      ?auto_462344 - BLOCK
      ?auto_462345 - BLOCK
      ?auto_462346 - BLOCK
      ?auto_462347 - BLOCK
      ?auto_462348 - BLOCK
      ?auto_462349 - BLOCK
      ?auto_462350 - BLOCK
      ?auto_462351 - BLOCK
      ?auto_462352 - BLOCK
      ?auto_462353 - BLOCK
    )
    :vars
    (
      ?auto_462354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462353 ?auto_462354 ) ( ON-TABLE ?auto_462342 ) ( ON ?auto_462343 ?auto_462342 ) ( not ( = ?auto_462342 ?auto_462343 ) ) ( not ( = ?auto_462342 ?auto_462344 ) ) ( not ( = ?auto_462342 ?auto_462345 ) ) ( not ( = ?auto_462342 ?auto_462346 ) ) ( not ( = ?auto_462342 ?auto_462347 ) ) ( not ( = ?auto_462342 ?auto_462348 ) ) ( not ( = ?auto_462342 ?auto_462349 ) ) ( not ( = ?auto_462342 ?auto_462350 ) ) ( not ( = ?auto_462342 ?auto_462351 ) ) ( not ( = ?auto_462342 ?auto_462352 ) ) ( not ( = ?auto_462342 ?auto_462353 ) ) ( not ( = ?auto_462342 ?auto_462354 ) ) ( not ( = ?auto_462343 ?auto_462344 ) ) ( not ( = ?auto_462343 ?auto_462345 ) ) ( not ( = ?auto_462343 ?auto_462346 ) ) ( not ( = ?auto_462343 ?auto_462347 ) ) ( not ( = ?auto_462343 ?auto_462348 ) ) ( not ( = ?auto_462343 ?auto_462349 ) ) ( not ( = ?auto_462343 ?auto_462350 ) ) ( not ( = ?auto_462343 ?auto_462351 ) ) ( not ( = ?auto_462343 ?auto_462352 ) ) ( not ( = ?auto_462343 ?auto_462353 ) ) ( not ( = ?auto_462343 ?auto_462354 ) ) ( not ( = ?auto_462344 ?auto_462345 ) ) ( not ( = ?auto_462344 ?auto_462346 ) ) ( not ( = ?auto_462344 ?auto_462347 ) ) ( not ( = ?auto_462344 ?auto_462348 ) ) ( not ( = ?auto_462344 ?auto_462349 ) ) ( not ( = ?auto_462344 ?auto_462350 ) ) ( not ( = ?auto_462344 ?auto_462351 ) ) ( not ( = ?auto_462344 ?auto_462352 ) ) ( not ( = ?auto_462344 ?auto_462353 ) ) ( not ( = ?auto_462344 ?auto_462354 ) ) ( not ( = ?auto_462345 ?auto_462346 ) ) ( not ( = ?auto_462345 ?auto_462347 ) ) ( not ( = ?auto_462345 ?auto_462348 ) ) ( not ( = ?auto_462345 ?auto_462349 ) ) ( not ( = ?auto_462345 ?auto_462350 ) ) ( not ( = ?auto_462345 ?auto_462351 ) ) ( not ( = ?auto_462345 ?auto_462352 ) ) ( not ( = ?auto_462345 ?auto_462353 ) ) ( not ( = ?auto_462345 ?auto_462354 ) ) ( not ( = ?auto_462346 ?auto_462347 ) ) ( not ( = ?auto_462346 ?auto_462348 ) ) ( not ( = ?auto_462346 ?auto_462349 ) ) ( not ( = ?auto_462346 ?auto_462350 ) ) ( not ( = ?auto_462346 ?auto_462351 ) ) ( not ( = ?auto_462346 ?auto_462352 ) ) ( not ( = ?auto_462346 ?auto_462353 ) ) ( not ( = ?auto_462346 ?auto_462354 ) ) ( not ( = ?auto_462347 ?auto_462348 ) ) ( not ( = ?auto_462347 ?auto_462349 ) ) ( not ( = ?auto_462347 ?auto_462350 ) ) ( not ( = ?auto_462347 ?auto_462351 ) ) ( not ( = ?auto_462347 ?auto_462352 ) ) ( not ( = ?auto_462347 ?auto_462353 ) ) ( not ( = ?auto_462347 ?auto_462354 ) ) ( not ( = ?auto_462348 ?auto_462349 ) ) ( not ( = ?auto_462348 ?auto_462350 ) ) ( not ( = ?auto_462348 ?auto_462351 ) ) ( not ( = ?auto_462348 ?auto_462352 ) ) ( not ( = ?auto_462348 ?auto_462353 ) ) ( not ( = ?auto_462348 ?auto_462354 ) ) ( not ( = ?auto_462349 ?auto_462350 ) ) ( not ( = ?auto_462349 ?auto_462351 ) ) ( not ( = ?auto_462349 ?auto_462352 ) ) ( not ( = ?auto_462349 ?auto_462353 ) ) ( not ( = ?auto_462349 ?auto_462354 ) ) ( not ( = ?auto_462350 ?auto_462351 ) ) ( not ( = ?auto_462350 ?auto_462352 ) ) ( not ( = ?auto_462350 ?auto_462353 ) ) ( not ( = ?auto_462350 ?auto_462354 ) ) ( not ( = ?auto_462351 ?auto_462352 ) ) ( not ( = ?auto_462351 ?auto_462353 ) ) ( not ( = ?auto_462351 ?auto_462354 ) ) ( not ( = ?auto_462352 ?auto_462353 ) ) ( not ( = ?auto_462352 ?auto_462354 ) ) ( not ( = ?auto_462353 ?auto_462354 ) ) ( ON ?auto_462352 ?auto_462353 ) ( ON ?auto_462351 ?auto_462352 ) ( ON ?auto_462350 ?auto_462351 ) ( ON ?auto_462349 ?auto_462350 ) ( ON ?auto_462348 ?auto_462349 ) ( ON ?auto_462347 ?auto_462348 ) ( ON ?auto_462346 ?auto_462347 ) ( ON ?auto_462345 ?auto_462346 ) ( CLEAR ?auto_462343 ) ( ON ?auto_462344 ?auto_462345 ) ( CLEAR ?auto_462344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_462342 ?auto_462343 ?auto_462344 )
      ( MAKE-12PILE ?auto_462342 ?auto_462343 ?auto_462344 ?auto_462345 ?auto_462346 ?auto_462347 ?auto_462348 ?auto_462349 ?auto_462350 ?auto_462351 ?auto_462352 ?auto_462353 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462367 - BLOCK
      ?auto_462368 - BLOCK
      ?auto_462369 - BLOCK
      ?auto_462370 - BLOCK
      ?auto_462371 - BLOCK
      ?auto_462372 - BLOCK
      ?auto_462373 - BLOCK
      ?auto_462374 - BLOCK
      ?auto_462375 - BLOCK
      ?auto_462376 - BLOCK
      ?auto_462377 - BLOCK
      ?auto_462378 - BLOCK
    )
    :vars
    (
      ?auto_462379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462378 ?auto_462379 ) ( ON-TABLE ?auto_462367 ) ( ON ?auto_462368 ?auto_462367 ) ( not ( = ?auto_462367 ?auto_462368 ) ) ( not ( = ?auto_462367 ?auto_462369 ) ) ( not ( = ?auto_462367 ?auto_462370 ) ) ( not ( = ?auto_462367 ?auto_462371 ) ) ( not ( = ?auto_462367 ?auto_462372 ) ) ( not ( = ?auto_462367 ?auto_462373 ) ) ( not ( = ?auto_462367 ?auto_462374 ) ) ( not ( = ?auto_462367 ?auto_462375 ) ) ( not ( = ?auto_462367 ?auto_462376 ) ) ( not ( = ?auto_462367 ?auto_462377 ) ) ( not ( = ?auto_462367 ?auto_462378 ) ) ( not ( = ?auto_462367 ?auto_462379 ) ) ( not ( = ?auto_462368 ?auto_462369 ) ) ( not ( = ?auto_462368 ?auto_462370 ) ) ( not ( = ?auto_462368 ?auto_462371 ) ) ( not ( = ?auto_462368 ?auto_462372 ) ) ( not ( = ?auto_462368 ?auto_462373 ) ) ( not ( = ?auto_462368 ?auto_462374 ) ) ( not ( = ?auto_462368 ?auto_462375 ) ) ( not ( = ?auto_462368 ?auto_462376 ) ) ( not ( = ?auto_462368 ?auto_462377 ) ) ( not ( = ?auto_462368 ?auto_462378 ) ) ( not ( = ?auto_462368 ?auto_462379 ) ) ( not ( = ?auto_462369 ?auto_462370 ) ) ( not ( = ?auto_462369 ?auto_462371 ) ) ( not ( = ?auto_462369 ?auto_462372 ) ) ( not ( = ?auto_462369 ?auto_462373 ) ) ( not ( = ?auto_462369 ?auto_462374 ) ) ( not ( = ?auto_462369 ?auto_462375 ) ) ( not ( = ?auto_462369 ?auto_462376 ) ) ( not ( = ?auto_462369 ?auto_462377 ) ) ( not ( = ?auto_462369 ?auto_462378 ) ) ( not ( = ?auto_462369 ?auto_462379 ) ) ( not ( = ?auto_462370 ?auto_462371 ) ) ( not ( = ?auto_462370 ?auto_462372 ) ) ( not ( = ?auto_462370 ?auto_462373 ) ) ( not ( = ?auto_462370 ?auto_462374 ) ) ( not ( = ?auto_462370 ?auto_462375 ) ) ( not ( = ?auto_462370 ?auto_462376 ) ) ( not ( = ?auto_462370 ?auto_462377 ) ) ( not ( = ?auto_462370 ?auto_462378 ) ) ( not ( = ?auto_462370 ?auto_462379 ) ) ( not ( = ?auto_462371 ?auto_462372 ) ) ( not ( = ?auto_462371 ?auto_462373 ) ) ( not ( = ?auto_462371 ?auto_462374 ) ) ( not ( = ?auto_462371 ?auto_462375 ) ) ( not ( = ?auto_462371 ?auto_462376 ) ) ( not ( = ?auto_462371 ?auto_462377 ) ) ( not ( = ?auto_462371 ?auto_462378 ) ) ( not ( = ?auto_462371 ?auto_462379 ) ) ( not ( = ?auto_462372 ?auto_462373 ) ) ( not ( = ?auto_462372 ?auto_462374 ) ) ( not ( = ?auto_462372 ?auto_462375 ) ) ( not ( = ?auto_462372 ?auto_462376 ) ) ( not ( = ?auto_462372 ?auto_462377 ) ) ( not ( = ?auto_462372 ?auto_462378 ) ) ( not ( = ?auto_462372 ?auto_462379 ) ) ( not ( = ?auto_462373 ?auto_462374 ) ) ( not ( = ?auto_462373 ?auto_462375 ) ) ( not ( = ?auto_462373 ?auto_462376 ) ) ( not ( = ?auto_462373 ?auto_462377 ) ) ( not ( = ?auto_462373 ?auto_462378 ) ) ( not ( = ?auto_462373 ?auto_462379 ) ) ( not ( = ?auto_462374 ?auto_462375 ) ) ( not ( = ?auto_462374 ?auto_462376 ) ) ( not ( = ?auto_462374 ?auto_462377 ) ) ( not ( = ?auto_462374 ?auto_462378 ) ) ( not ( = ?auto_462374 ?auto_462379 ) ) ( not ( = ?auto_462375 ?auto_462376 ) ) ( not ( = ?auto_462375 ?auto_462377 ) ) ( not ( = ?auto_462375 ?auto_462378 ) ) ( not ( = ?auto_462375 ?auto_462379 ) ) ( not ( = ?auto_462376 ?auto_462377 ) ) ( not ( = ?auto_462376 ?auto_462378 ) ) ( not ( = ?auto_462376 ?auto_462379 ) ) ( not ( = ?auto_462377 ?auto_462378 ) ) ( not ( = ?auto_462377 ?auto_462379 ) ) ( not ( = ?auto_462378 ?auto_462379 ) ) ( ON ?auto_462377 ?auto_462378 ) ( ON ?auto_462376 ?auto_462377 ) ( ON ?auto_462375 ?auto_462376 ) ( ON ?auto_462374 ?auto_462375 ) ( ON ?auto_462373 ?auto_462374 ) ( ON ?auto_462372 ?auto_462373 ) ( ON ?auto_462371 ?auto_462372 ) ( ON ?auto_462370 ?auto_462371 ) ( CLEAR ?auto_462368 ) ( ON ?auto_462369 ?auto_462370 ) ( CLEAR ?auto_462369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_462367 ?auto_462368 ?auto_462369 )
      ( MAKE-12PILE ?auto_462367 ?auto_462368 ?auto_462369 ?auto_462370 ?auto_462371 ?auto_462372 ?auto_462373 ?auto_462374 ?auto_462375 ?auto_462376 ?auto_462377 ?auto_462378 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462392 - BLOCK
      ?auto_462393 - BLOCK
      ?auto_462394 - BLOCK
      ?auto_462395 - BLOCK
      ?auto_462396 - BLOCK
      ?auto_462397 - BLOCK
      ?auto_462398 - BLOCK
      ?auto_462399 - BLOCK
      ?auto_462400 - BLOCK
      ?auto_462401 - BLOCK
      ?auto_462402 - BLOCK
      ?auto_462403 - BLOCK
    )
    :vars
    (
      ?auto_462404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462403 ?auto_462404 ) ( ON-TABLE ?auto_462392 ) ( not ( = ?auto_462392 ?auto_462393 ) ) ( not ( = ?auto_462392 ?auto_462394 ) ) ( not ( = ?auto_462392 ?auto_462395 ) ) ( not ( = ?auto_462392 ?auto_462396 ) ) ( not ( = ?auto_462392 ?auto_462397 ) ) ( not ( = ?auto_462392 ?auto_462398 ) ) ( not ( = ?auto_462392 ?auto_462399 ) ) ( not ( = ?auto_462392 ?auto_462400 ) ) ( not ( = ?auto_462392 ?auto_462401 ) ) ( not ( = ?auto_462392 ?auto_462402 ) ) ( not ( = ?auto_462392 ?auto_462403 ) ) ( not ( = ?auto_462392 ?auto_462404 ) ) ( not ( = ?auto_462393 ?auto_462394 ) ) ( not ( = ?auto_462393 ?auto_462395 ) ) ( not ( = ?auto_462393 ?auto_462396 ) ) ( not ( = ?auto_462393 ?auto_462397 ) ) ( not ( = ?auto_462393 ?auto_462398 ) ) ( not ( = ?auto_462393 ?auto_462399 ) ) ( not ( = ?auto_462393 ?auto_462400 ) ) ( not ( = ?auto_462393 ?auto_462401 ) ) ( not ( = ?auto_462393 ?auto_462402 ) ) ( not ( = ?auto_462393 ?auto_462403 ) ) ( not ( = ?auto_462393 ?auto_462404 ) ) ( not ( = ?auto_462394 ?auto_462395 ) ) ( not ( = ?auto_462394 ?auto_462396 ) ) ( not ( = ?auto_462394 ?auto_462397 ) ) ( not ( = ?auto_462394 ?auto_462398 ) ) ( not ( = ?auto_462394 ?auto_462399 ) ) ( not ( = ?auto_462394 ?auto_462400 ) ) ( not ( = ?auto_462394 ?auto_462401 ) ) ( not ( = ?auto_462394 ?auto_462402 ) ) ( not ( = ?auto_462394 ?auto_462403 ) ) ( not ( = ?auto_462394 ?auto_462404 ) ) ( not ( = ?auto_462395 ?auto_462396 ) ) ( not ( = ?auto_462395 ?auto_462397 ) ) ( not ( = ?auto_462395 ?auto_462398 ) ) ( not ( = ?auto_462395 ?auto_462399 ) ) ( not ( = ?auto_462395 ?auto_462400 ) ) ( not ( = ?auto_462395 ?auto_462401 ) ) ( not ( = ?auto_462395 ?auto_462402 ) ) ( not ( = ?auto_462395 ?auto_462403 ) ) ( not ( = ?auto_462395 ?auto_462404 ) ) ( not ( = ?auto_462396 ?auto_462397 ) ) ( not ( = ?auto_462396 ?auto_462398 ) ) ( not ( = ?auto_462396 ?auto_462399 ) ) ( not ( = ?auto_462396 ?auto_462400 ) ) ( not ( = ?auto_462396 ?auto_462401 ) ) ( not ( = ?auto_462396 ?auto_462402 ) ) ( not ( = ?auto_462396 ?auto_462403 ) ) ( not ( = ?auto_462396 ?auto_462404 ) ) ( not ( = ?auto_462397 ?auto_462398 ) ) ( not ( = ?auto_462397 ?auto_462399 ) ) ( not ( = ?auto_462397 ?auto_462400 ) ) ( not ( = ?auto_462397 ?auto_462401 ) ) ( not ( = ?auto_462397 ?auto_462402 ) ) ( not ( = ?auto_462397 ?auto_462403 ) ) ( not ( = ?auto_462397 ?auto_462404 ) ) ( not ( = ?auto_462398 ?auto_462399 ) ) ( not ( = ?auto_462398 ?auto_462400 ) ) ( not ( = ?auto_462398 ?auto_462401 ) ) ( not ( = ?auto_462398 ?auto_462402 ) ) ( not ( = ?auto_462398 ?auto_462403 ) ) ( not ( = ?auto_462398 ?auto_462404 ) ) ( not ( = ?auto_462399 ?auto_462400 ) ) ( not ( = ?auto_462399 ?auto_462401 ) ) ( not ( = ?auto_462399 ?auto_462402 ) ) ( not ( = ?auto_462399 ?auto_462403 ) ) ( not ( = ?auto_462399 ?auto_462404 ) ) ( not ( = ?auto_462400 ?auto_462401 ) ) ( not ( = ?auto_462400 ?auto_462402 ) ) ( not ( = ?auto_462400 ?auto_462403 ) ) ( not ( = ?auto_462400 ?auto_462404 ) ) ( not ( = ?auto_462401 ?auto_462402 ) ) ( not ( = ?auto_462401 ?auto_462403 ) ) ( not ( = ?auto_462401 ?auto_462404 ) ) ( not ( = ?auto_462402 ?auto_462403 ) ) ( not ( = ?auto_462402 ?auto_462404 ) ) ( not ( = ?auto_462403 ?auto_462404 ) ) ( ON ?auto_462402 ?auto_462403 ) ( ON ?auto_462401 ?auto_462402 ) ( ON ?auto_462400 ?auto_462401 ) ( ON ?auto_462399 ?auto_462400 ) ( ON ?auto_462398 ?auto_462399 ) ( ON ?auto_462397 ?auto_462398 ) ( ON ?auto_462396 ?auto_462397 ) ( ON ?auto_462395 ?auto_462396 ) ( ON ?auto_462394 ?auto_462395 ) ( CLEAR ?auto_462392 ) ( ON ?auto_462393 ?auto_462394 ) ( CLEAR ?auto_462393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_462392 ?auto_462393 )
      ( MAKE-12PILE ?auto_462392 ?auto_462393 ?auto_462394 ?auto_462395 ?auto_462396 ?auto_462397 ?auto_462398 ?auto_462399 ?auto_462400 ?auto_462401 ?auto_462402 ?auto_462403 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462417 - BLOCK
      ?auto_462418 - BLOCK
      ?auto_462419 - BLOCK
      ?auto_462420 - BLOCK
      ?auto_462421 - BLOCK
      ?auto_462422 - BLOCK
      ?auto_462423 - BLOCK
      ?auto_462424 - BLOCK
      ?auto_462425 - BLOCK
      ?auto_462426 - BLOCK
      ?auto_462427 - BLOCK
      ?auto_462428 - BLOCK
    )
    :vars
    (
      ?auto_462429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462428 ?auto_462429 ) ( ON-TABLE ?auto_462417 ) ( not ( = ?auto_462417 ?auto_462418 ) ) ( not ( = ?auto_462417 ?auto_462419 ) ) ( not ( = ?auto_462417 ?auto_462420 ) ) ( not ( = ?auto_462417 ?auto_462421 ) ) ( not ( = ?auto_462417 ?auto_462422 ) ) ( not ( = ?auto_462417 ?auto_462423 ) ) ( not ( = ?auto_462417 ?auto_462424 ) ) ( not ( = ?auto_462417 ?auto_462425 ) ) ( not ( = ?auto_462417 ?auto_462426 ) ) ( not ( = ?auto_462417 ?auto_462427 ) ) ( not ( = ?auto_462417 ?auto_462428 ) ) ( not ( = ?auto_462417 ?auto_462429 ) ) ( not ( = ?auto_462418 ?auto_462419 ) ) ( not ( = ?auto_462418 ?auto_462420 ) ) ( not ( = ?auto_462418 ?auto_462421 ) ) ( not ( = ?auto_462418 ?auto_462422 ) ) ( not ( = ?auto_462418 ?auto_462423 ) ) ( not ( = ?auto_462418 ?auto_462424 ) ) ( not ( = ?auto_462418 ?auto_462425 ) ) ( not ( = ?auto_462418 ?auto_462426 ) ) ( not ( = ?auto_462418 ?auto_462427 ) ) ( not ( = ?auto_462418 ?auto_462428 ) ) ( not ( = ?auto_462418 ?auto_462429 ) ) ( not ( = ?auto_462419 ?auto_462420 ) ) ( not ( = ?auto_462419 ?auto_462421 ) ) ( not ( = ?auto_462419 ?auto_462422 ) ) ( not ( = ?auto_462419 ?auto_462423 ) ) ( not ( = ?auto_462419 ?auto_462424 ) ) ( not ( = ?auto_462419 ?auto_462425 ) ) ( not ( = ?auto_462419 ?auto_462426 ) ) ( not ( = ?auto_462419 ?auto_462427 ) ) ( not ( = ?auto_462419 ?auto_462428 ) ) ( not ( = ?auto_462419 ?auto_462429 ) ) ( not ( = ?auto_462420 ?auto_462421 ) ) ( not ( = ?auto_462420 ?auto_462422 ) ) ( not ( = ?auto_462420 ?auto_462423 ) ) ( not ( = ?auto_462420 ?auto_462424 ) ) ( not ( = ?auto_462420 ?auto_462425 ) ) ( not ( = ?auto_462420 ?auto_462426 ) ) ( not ( = ?auto_462420 ?auto_462427 ) ) ( not ( = ?auto_462420 ?auto_462428 ) ) ( not ( = ?auto_462420 ?auto_462429 ) ) ( not ( = ?auto_462421 ?auto_462422 ) ) ( not ( = ?auto_462421 ?auto_462423 ) ) ( not ( = ?auto_462421 ?auto_462424 ) ) ( not ( = ?auto_462421 ?auto_462425 ) ) ( not ( = ?auto_462421 ?auto_462426 ) ) ( not ( = ?auto_462421 ?auto_462427 ) ) ( not ( = ?auto_462421 ?auto_462428 ) ) ( not ( = ?auto_462421 ?auto_462429 ) ) ( not ( = ?auto_462422 ?auto_462423 ) ) ( not ( = ?auto_462422 ?auto_462424 ) ) ( not ( = ?auto_462422 ?auto_462425 ) ) ( not ( = ?auto_462422 ?auto_462426 ) ) ( not ( = ?auto_462422 ?auto_462427 ) ) ( not ( = ?auto_462422 ?auto_462428 ) ) ( not ( = ?auto_462422 ?auto_462429 ) ) ( not ( = ?auto_462423 ?auto_462424 ) ) ( not ( = ?auto_462423 ?auto_462425 ) ) ( not ( = ?auto_462423 ?auto_462426 ) ) ( not ( = ?auto_462423 ?auto_462427 ) ) ( not ( = ?auto_462423 ?auto_462428 ) ) ( not ( = ?auto_462423 ?auto_462429 ) ) ( not ( = ?auto_462424 ?auto_462425 ) ) ( not ( = ?auto_462424 ?auto_462426 ) ) ( not ( = ?auto_462424 ?auto_462427 ) ) ( not ( = ?auto_462424 ?auto_462428 ) ) ( not ( = ?auto_462424 ?auto_462429 ) ) ( not ( = ?auto_462425 ?auto_462426 ) ) ( not ( = ?auto_462425 ?auto_462427 ) ) ( not ( = ?auto_462425 ?auto_462428 ) ) ( not ( = ?auto_462425 ?auto_462429 ) ) ( not ( = ?auto_462426 ?auto_462427 ) ) ( not ( = ?auto_462426 ?auto_462428 ) ) ( not ( = ?auto_462426 ?auto_462429 ) ) ( not ( = ?auto_462427 ?auto_462428 ) ) ( not ( = ?auto_462427 ?auto_462429 ) ) ( not ( = ?auto_462428 ?auto_462429 ) ) ( ON ?auto_462427 ?auto_462428 ) ( ON ?auto_462426 ?auto_462427 ) ( ON ?auto_462425 ?auto_462426 ) ( ON ?auto_462424 ?auto_462425 ) ( ON ?auto_462423 ?auto_462424 ) ( ON ?auto_462422 ?auto_462423 ) ( ON ?auto_462421 ?auto_462422 ) ( ON ?auto_462420 ?auto_462421 ) ( ON ?auto_462419 ?auto_462420 ) ( CLEAR ?auto_462417 ) ( ON ?auto_462418 ?auto_462419 ) ( CLEAR ?auto_462418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_462417 ?auto_462418 )
      ( MAKE-12PILE ?auto_462417 ?auto_462418 ?auto_462419 ?auto_462420 ?auto_462421 ?auto_462422 ?auto_462423 ?auto_462424 ?auto_462425 ?auto_462426 ?auto_462427 ?auto_462428 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462442 - BLOCK
      ?auto_462443 - BLOCK
      ?auto_462444 - BLOCK
      ?auto_462445 - BLOCK
      ?auto_462446 - BLOCK
      ?auto_462447 - BLOCK
      ?auto_462448 - BLOCK
      ?auto_462449 - BLOCK
      ?auto_462450 - BLOCK
      ?auto_462451 - BLOCK
      ?auto_462452 - BLOCK
      ?auto_462453 - BLOCK
    )
    :vars
    (
      ?auto_462454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462453 ?auto_462454 ) ( not ( = ?auto_462442 ?auto_462443 ) ) ( not ( = ?auto_462442 ?auto_462444 ) ) ( not ( = ?auto_462442 ?auto_462445 ) ) ( not ( = ?auto_462442 ?auto_462446 ) ) ( not ( = ?auto_462442 ?auto_462447 ) ) ( not ( = ?auto_462442 ?auto_462448 ) ) ( not ( = ?auto_462442 ?auto_462449 ) ) ( not ( = ?auto_462442 ?auto_462450 ) ) ( not ( = ?auto_462442 ?auto_462451 ) ) ( not ( = ?auto_462442 ?auto_462452 ) ) ( not ( = ?auto_462442 ?auto_462453 ) ) ( not ( = ?auto_462442 ?auto_462454 ) ) ( not ( = ?auto_462443 ?auto_462444 ) ) ( not ( = ?auto_462443 ?auto_462445 ) ) ( not ( = ?auto_462443 ?auto_462446 ) ) ( not ( = ?auto_462443 ?auto_462447 ) ) ( not ( = ?auto_462443 ?auto_462448 ) ) ( not ( = ?auto_462443 ?auto_462449 ) ) ( not ( = ?auto_462443 ?auto_462450 ) ) ( not ( = ?auto_462443 ?auto_462451 ) ) ( not ( = ?auto_462443 ?auto_462452 ) ) ( not ( = ?auto_462443 ?auto_462453 ) ) ( not ( = ?auto_462443 ?auto_462454 ) ) ( not ( = ?auto_462444 ?auto_462445 ) ) ( not ( = ?auto_462444 ?auto_462446 ) ) ( not ( = ?auto_462444 ?auto_462447 ) ) ( not ( = ?auto_462444 ?auto_462448 ) ) ( not ( = ?auto_462444 ?auto_462449 ) ) ( not ( = ?auto_462444 ?auto_462450 ) ) ( not ( = ?auto_462444 ?auto_462451 ) ) ( not ( = ?auto_462444 ?auto_462452 ) ) ( not ( = ?auto_462444 ?auto_462453 ) ) ( not ( = ?auto_462444 ?auto_462454 ) ) ( not ( = ?auto_462445 ?auto_462446 ) ) ( not ( = ?auto_462445 ?auto_462447 ) ) ( not ( = ?auto_462445 ?auto_462448 ) ) ( not ( = ?auto_462445 ?auto_462449 ) ) ( not ( = ?auto_462445 ?auto_462450 ) ) ( not ( = ?auto_462445 ?auto_462451 ) ) ( not ( = ?auto_462445 ?auto_462452 ) ) ( not ( = ?auto_462445 ?auto_462453 ) ) ( not ( = ?auto_462445 ?auto_462454 ) ) ( not ( = ?auto_462446 ?auto_462447 ) ) ( not ( = ?auto_462446 ?auto_462448 ) ) ( not ( = ?auto_462446 ?auto_462449 ) ) ( not ( = ?auto_462446 ?auto_462450 ) ) ( not ( = ?auto_462446 ?auto_462451 ) ) ( not ( = ?auto_462446 ?auto_462452 ) ) ( not ( = ?auto_462446 ?auto_462453 ) ) ( not ( = ?auto_462446 ?auto_462454 ) ) ( not ( = ?auto_462447 ?auto_462448 ) ) ( not ( = ?auto_462447 ?auto_462449 ) ) ( not ( = ?auto_462447 ?auto_462450 ) ) ( not ( = ?auto_462447 ?auto_462451 ) ) ( not ( = ?auto_462447 ?auto_462452 ) ) ( not ( = ?auto_462447 ?auto_462453 ) ) ( not ( = ?auto_462447 ?auto_462454 ) ) ( not ( = ?auto_462448 ?auto_462449 ) ) ( not ( = ?auto_462448 ?auto_462450 ) ) ( not ( = ?auto_462448 ?auto_462451 ) ) ( not ( = ?auto_462448 ?auto_462452 ) ) ( not ( = ?auto_462448 ?auto_462453 ) ) ( not ( = ?auto_462448 ?auto_462454 ) ) ( not ( = ?auto_462449 ?auto_462450 ) ) ( not ( = ?auto_462449 ?auto_462451 ) ) ( not ( = ?auto_462449 ?auto_462452 ) ) ( not ( = ?auto_462449 ?auto_462453 ) ) ( not ( = ?auto_462449 ?auto_462454 ) ) ( not ( = ?auto_462450 ?auto_462451 ) ) ( not ( = ?auto_462450 ?auto_462452 ) ) ( not ( = ?auto_462450 ?auto_462453 ) ) ( not ( = ?auto_462450 ?auto_462454 ) ) ( not ( = ?auto_462451 ?auto_462452 ) ) ( not ( = ?auto_462451 ?auto_462453 ) ) ( not ( = ?auto_462451 ?auto_462454 ) ) ( not ( = ?auto_462452 ?auto_462453 ) ) ( not ( = ?auto_462452 ?auto_462454 ) ) ( not ( = ?auto_462453 ?auto_462454 ) ) ( ON ?auto_462452 ?auto_462453 ) ( ON ?auto_462451 ?auto_462452 ) ( ON ?auto_462450 ?auto_462451 ) ( ON ?auto_462449 ?auto_462450 ) ( ON ?auto_462448 ?auto_462449 ) ( ON ?auto_462447 ?auto_462448 ) ( ON ?auto_462446 ?auto_462447 ) ( ON ?auto_462445 ?auto_462446 ) ( ON ?auto_462444 ?auto_462445 ) ( ON ?auto_462443 ?auto_462444 ) ( ON ?auto_462442 ?auto_462443 ) ( CLEAR ?auto_462442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_462442 )
      ( MAKE-12PILE ?auto_462442 ?auto_462443 ?auto_462444 ?auto_462445 ?auto_462446 ?auto_462447 ?auto_462448 ?auto_462449 ?auto_462450 ?auto_462451 ?auto_462452 ?auto_462453 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_462467 - BLOCK
      ?auto_462468 - BLOCK
      ?auto_462469 - BLOCK
      ?auto_462470 - BLOCK
      ?auto_462471 - BLOCK
      ?auto_462472 - BLOCK
      ?auto_462473 - BLOCK
      ?auto_462474 - BLOCK
      ?auto_462475 - BLOCK
      ?auto_462476 - BLOCK
      ?auto_462477 - BLOCK
      ?auto_462478 - BLOCK
    )
    :vars
    (
      ?auto_462479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462478 ?auto_462479 ) ( not ( = ?auto_462467 ?auto_462468 ) ) ( not ( = ?auto_462467 ?auto_462469 ) ) ( not ( = ?auto_462467 ?auto_462470 ) ) ( not ( = ?auto_462467 ?auto_462471 ) ) ( not ( = ?auto_462467 ?auto_462472 ) ) ( not ( = ?auto_462467 ?auto_462473 ) ) ( not ( = ?auto_462467 ?auto_462474 ) ) ( not ( = ?auto_462467 ?auto_462475 ) ) ( not ( = ?auto_462467 ?auto_462476 ) ) ( not ( = ?auto_462467 ?auto_462477 ) ) ( not ( = ?auto_462467 ?auto_462478 ) ) ( not ( = ?auto_462467 ?auto_462479 ) ) ( not ( = ?auto_462468 ?auto_462469 ) ) ( not ( = ?auto_462468 ?auto_462470 ) ) ( not ( = ?auto_462468 ?auto_462471 ) ) ( not ( = ?auto_462468 ?auto_462472 ) ) ( not ( = ?auto_462468 ?auto_462473 ) ) ( not ( = ?auto_462468 ?auto_462474 ) ) ( not ( = ?auto_462468 ?auto_462475 ) ) ( not ( = ?auto_462468 ?auto_462476 ) ) ( not ( = ?auto_462468 ?auto_462477 ) ) ( not ( = ?auto_462468 ?auto_462478 ) ) ( not ( = ?auto_462468 ?auto_462479 ) ) ( not ( = ?auto_462469 ?auto_462470 ) ) ( not ( = ?auto_462469 ?auto_462471 ) ) ( not ( = ?auto_462469 ?auto_462472 ) ) ( not ( = ?auto_462469 ?auto_462473 ) ) ( not ( = ?auto_462469 ?auto_462474 ) ) ( not ( = ?auto_462469 ?auto_462475 ) ) ( not ( = ?auto_462469 ?auto_462476 ) ) ( not ( = ?auto_462469 ?auto_462477 ) ) ( not ( = ?auto_462469 ?auto_462478 ) ) ( not ( = ?auto_462469 ?auto_462479 ) ) ( not ( = ?auto_462470 ?auto_462471 ) ) ( not ( = ?auto_462470 ?auto_462472 ) ) ( not ( = ?auto_462470 ?auto_462473 ) ) ( not ( = ?auto_462470 ?auto_462474 ) ) ( not ( = ?auto_462470 ?auto_462475 ) ) ( not ( = ?auto_462470 ?auto_462476 ) ) ( not ( = ?auto_462470 ?auto_462477 ) ) ( not ( = ?auto_462470 ?auto_462478 ) ) ( not ( = ?auto_462470 ?auto_462479 ) ) ( not ( = ?auto_462471 ?auto_462472 ) ) ( not ( = ?auto_462471 ?auto_462473 ) ) ( not ( = ?auto_462471 ?auto_462474 ) ) ( not ( = ?auto_462471 ?auto_462475 ) ) ( not ( = ?auto_462471 ?auto_462476 ) ) ( not ( = ?auto_462471 ?auto_462477 ) ) ( not ( = ?auto_462471 ?auto_462478 ) ) ( not ( = ?auto_462471 ?auto_462479 ) ) ( not ( = ?auto_462472 ?auto_462473 ) ) ( not ( = ?auto_462472 ?auto_462474 ) ) ( not ( = ?auto_462472 ?auto_462475 ) ) ( not ( = ?auto_462472 ?auto_462476 ) ) ( not ( = ?auto_462472 ?auto_462477 ) ) ( not ( = ?auto_462472 ?auto_462478 ) ) ( not ( = ?auto_462472 ?auto_462479 ) ) ( not ( = ?auto_462473 ?auto_462474 ) ) ( not ( = ?auto_462473 ?auto_462475 ) ) ( not ( = ?auto_462473 ?auto_462476 ) ) ( not ( = ?auto_462473 ?auto_462477 ) ) ( not ( = ?auto_462473 ?auto_462478 ) ) ( not ( = ?auto_462473 ?auto_462479 ) ) ( not ( = ?auto_462474 ?auto_462475 ) ) ( not ( = ?auto_462474 ?auto_462476 ) ) ( not ( = ?auto_462474 ?auto_462477 ) ) ( not ( = ?auto_462474 ?auto_462478 ) ) ( not ( = ?auto_462474 ?auto_462479 ) ) ( not ( = ?auto_462475 ?auto_462476 ) ) ( not ( = ?auto_462475 ?auto_462477 ) ) ( not ( = ?auto_462475 ?auto_462478 ) ) ( not ( = ?auto_462475 ?auto_462479 ) ) ( not ( = ?auto_462476 ?auto_462477 ) ) ( not ( = ?auto_462476 ?auto_462478 ) ) ( not ( = ?auto_462476 ?auto_462479 ) ) ( not ( = ?auto_462477 ?auto_462478 ) ) ( not ( = ?auto_462477 ?auto_462479 ) ) ( not ( = ?auto_462478 ?auto_462479 ) ) ( ON ?auto_462477 ?auto_462478 ) ( ON ?auto_462476 ?auto_462477 ) ( ON ?auto_462475 ?auto_462476 ) ( ON ?auto_462474 ?auto_462475 ) ( ON ?auto_462473 ?auto_462474 ) ( ON ?auto_462472 ?auto_462473 ) ( ON ?auto_462471 ?auto_462472 ) ( ON ?auto_462470 ?auto_462471 ) ( ON ?auto_462469 ?auto_462470 ) ( ON ?auto_462468 ?auto_462469 ) ( ON ?auto_462467 ?auto_462468 ) ( CLEAR ?auto_462467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_462467 )
      ( MAKE-12PILE ?auto_462467 ?auto_462468 ?auto_462469 ?auto_462470 ?auto_462471 ?auto_462472 ?auto_462473 ?auto_462474 ?auto_462475 ?auto_462476 ?auto_462477 ?auto_462478 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462493 - BLOCK
      ?auto_462494 - BLOCK
      ?auto_462495 - BLOCK
      ?auto_462496 - BLOCK
      ?auto_462497 - BLOCK
      ?auto_462498 - BLOCK
      ?auto_462499 - BLOCK
      ?auto_462500 - BLOCK
      ?auto_462501 - BLOCK
      ?auto_462502 - BLOCK
      ?auto_462503 - BLOCK
      ?auto_462504 - BLOCK
      ?auto_462505 - BLOCK
    )
    :vars
    (
      ?auto_462506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_462504 ) ( ON ?auto_462505 ?auto_462506 ) ( CLEAR ?auto_462505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_462493 ) ( ON ?auto_462494 ?auto_462493 ) ( ON ?auto_462495 ?auto_462494 ) ( ON ?auto_462496 ?auto_462495 ) ( ON ?auto_462497 ?auto_462496 ) ( ON ?auto_462498 ?auto_462497 ) ( ON ?auto_462499 ?auto_462498 ) ( ON ?auto_462500 ?auto_462499 ) ( ON ?auto_462501 ?auto_462500 ) ( ON ?auto_462502 ?auto_462501 ) ( ON ?auto_462503 ?auto_462502 ) ( ON ?auto_462504 ?auto_462503 ) ( not ( = ?auto_462493 ?auto_462494 ) ) ( not ( = ?auto_462493 ?auto_462495 ) ) ( not ( = ?auto_462493 ?auto_462496 ) ) ( not ( = ?auto_462493 ?auto_462497 ) ) ( not ( = ?auto_462493 ?auto_462498 ) ) ( not ( = ?auto_462493 ?auto_462499 ) ) ( not ( = ?auto_462493 ?auto_462500 ) ) ( not ( = ?auto_462493 ?auto_462501 ) ) ( not ( = ?auto_462493 ?auto_462502 ) ) ( not ( = ?auto_462493 ?auto_462503 ) ) ( not ( = ?auto_462493 ?auto_462504 ) ) ( not ( = ?auto_462493 ?auto_462505 ) ) ( not ( = ?auto_462493 ?auto_462506 ) ) ( not ( = ?auto_462494 ?auto_462495 ) ) ( not ( = ?auto_462494 ?auto_462496 ) ) ( not ( = ?auto_462494 ?auto_462497 ) ) ( not ( = ?auto_462494 ?auto_462498 ) ) ( not ( = ?auto_462494 ?auto_462499 ) ) ( not ( = ?auto_462494 ?auto_462500 ) ) ( not ( = ?auto_462494 ?auto_462501 ) ) ( not ( = ?auto_462494 ?auto_462502 ) ) ( not ( = ?auto_462494 ?auto_462503 ) ) ( not ( = ?auto_462494 ?auto_462504 ) ) ( not ( = ?auto_462494 ?auto_462505 ) ) ( not ( = ?auto_462494 ?auto_462506 ) ) ( not ( = ?auto_462495 ?auto_462496 ) ) ( not ( = ?auto_462495 ?auto_462497 ) ) ( not ( = ?auto_462495 ?auto_462498 ) ) ( not ( = ?auto_462495 ?auto_462499 ) ) ( not ( = ?auto_462495 ?auto_462500 ) ) ( not ( = ?auto_462495 ?auto_462501 ) ) ( not ( = ?auto_462495 ?auto_462502 ) ) ( not ( = ?auto_462495 ?auto_462503 ) ) ( not ( = ?auto_462495 ?auto_462504 ) ) ( not ( = ?auto_462495 ?auto_462505 ) ) ( not ( = ?auto_462495 ?auto_462506 ) ) ( not ( = ?auto_462496 ?auto_462497 ) ) ( not ( = ?auto_462496 ?auto_462498 ) ) ( not ( = ?auto_462496 ?auto_462499 ) ) ( not ( = ?auto_462496 ?auto_462500 ) ) ( not ( = ?auto_462496 ?auto_462501 ) ) ( not ( = ?auto_462496 ?auto_462502 ) ) ( not ( = ?auto_462496 ?auto_462503 ) ) ( not ( = ?auto_462496 ?auto_462504 ) ) ( not ( = ?auto_462496 ?auto_462505 ) ) ( not ( = ?auto_462496 ?auto_462506 ) ) ( not ( = ?auto_462497 ?auto_462498 ) ) ( not ( = ?auto_462497 ?auto_462499 ) ) ( not ( = ?auto_462497 ?auto_462500 ) ) ( not ( = ?auto_462497 ?auto_462501 ) ) ( not ( = ?auto_462497 ?auto_462502 ) ) ( not ( = ?auto_462497 ?auto_462503 ) ) ( not ( = ?auto_462497 ?auto_462504 ) ) ( not ( = ?auto_462497 ?auto_462505 ) ) ( not ( = ?auto_462497 ?auto_462506 ) ) ( not ( = ?auto_462498 ?auto_462499 ) ) ( not ( = ?auto_462498 ?auto_462500 ) ) ( not ( = ?auto_462498 ?auto_462501 ) ) ( not ( = ?auto_462498 ?auto_462502 ) ) ( not ( = ?auto_462498 ?auto_462503 ) ) ( not ( = ?auto_462498 ?auto_462504 ) ) ( not ( = ?auto_462498 ?auto_462505 ) ) ( not ( = ?auto_462498 ?auto_462506 ) ) ( not ( = ?auto_462499 ?auto_462500 ) ) ( not ( = ?auto_462499 ?auto_462501 ) ) ( not ( = ?auto_462499 ?auto_462502 ) ) ( not ( = ?auto_462499 ?auto_462503 ) ) ( not ( = ?auto_462499 ?auto_462504 ) ) ( not ( = ?auto_462499 ?auto_462505 ) ) ( not ( = ?auto_462499 ?auto_462506 ) ) ( not ( = ?auto_462500 ?auto_462501 ) ) ( not ( = ?auto_462500 ?auto_462502 ) ) ( not ( = ?auto_462500 ?auto_462503 ) ) ( not ( = ?auto_462500 ?auto_462504 ) ) ( not ( = ?auto_462500 ?auto_462505 ) ) ( not ( = ?auto_462500 ?auto_462506 ) ) ( not ( = ?auto_462501 ?auto_462502 ) ) ( not ( = ?auto_462501 ?auto_462503 ) ) ( not ( = ?auto_462501 ?auto_462504 ) ) ( not ( = ?auto_462501 ?auto_462505 ) ) ( not ( = ?auto_462501 ?auto_462506 ) ) ( not ( = ?auto_462502 ?auto_462503 ) ) ( not ( = ?auto_462502 ?auto_462504 ) ) ( not ( = ?auto_462502 ?auto_462505 ) ) ( not ( = ?auto_462502 ?auto_462506 ) ) ( not ( = ?auto_462503 ?auto_462504 ) ) ( not ( = ?auto_462503 ?auto_462505 ) ) ( not ( = ?auto_462503 ?auto_462506 ) ) ( not ( = ?auto_462504 ?auto_462505 ) ) ( not ( = ?auto_462504 ?auto_462506 ) ) ( not ( = ?auto_462505 ?auto_462506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_462505 ?auto_462506 )
      ( !STACK ?auto_462505 ?auto_462504 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462520 - BLOCK
      ?auto_462521 - BLOCK
      ?auto_462522 - BLOCK
      ?auto_462523 - BLOCK
      ?auto_462524 - BLOCK
      ?auto_462525 - BLOCK
      ?auto_462526 - BLOCK
      ?auto_462527 - BLOCK
      ?auto_462528 - BLOCK
      ?auto_462529 - BLOCK
      ?auto_462530 - BLOCK
      ?auto_462531 - BLOCK
      ?auto_462532 - BLOCK
    )
    :vars
    (
      ?auto_462533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_462531 ) ( ON ?auto_462532 ?auto_462533 ) ( CLEAR ?auto_462532 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_462520 ) ( ON ?auto_462521 ?auto_462520 ) ( ON ?auto_462522 ?auto_462521 ) ( ON ?auto_462523 ?auto_462522 ) ( ON ?auto_462524 ?auto_462523 ) ( ON ?auto_462525 ?auto_462524 ) ( ON ?auto_462526 ?auto_462525 ) ( ON ?auto_462527 ?auto_462526 ) ( ON ?auto_462528 ?auto_462527 ) ( ON ?auto_462529 ?auto_462528 ) ( ON ?auto_462530 ?auto_462529 ) ( ON ?auto_462531 ?auto_462530 ) ( not ( = ?auto_462520 ?auto_462521 ) ) ( not ( = ?auto_462520 ?auto_462522 ) ) ( not ( = ?auto_462520 ?auto_462523 ) ) ( not ( = ?auto_462520 ?auto_462524 ) ) ( not ( = ?auto_462520 ?auto_462525 ) ) ( not ( = ?auto_462520 ?auto_462526 ) ) ( not ( = ?auto_462520 ?auto_462527 ) ) ( not ( = ?auto_462520 ?auto_462528 ) ) ( not ( = ?auto_462520 ?auto_462529 ) ) ( not ( = ?auto_462520 ?auto_462530 ) ) ( not ( = ?auto_462520 ?auto_462531 ) ) ( not ( = ?auto_462520 ?auto_462532 ) ) ( not ( = ?auto_462520 ?auto_462533 ) ) ( not ( = ?auto_462521 ?auto_462522 ) ) ( not ( = ?auto_462521 ?auto_462523 ) ) ( not ( = ?auto_462521 ?auto_462524 ) ) ( not ( = ?auto_462521 ?auto_462525 ) ) ( not ( = ?auto_462521 ?auto_462526 ) ) ( not ( = ?auto_462521 ?auto_462527 ) ) ( not ( = ?auto_462521 ?auto_462528 ) ) ( not ( = ?auto_462521 ?auto_462529 ) ) ( not ( = ?auto_462521 ?auto_462530 ) ) ( not ( = ?auto_462521 ?auto_462531 ) ) ( not ( = ?auto_462521 ?auto_462532 ) ) ( not ( = ?auto_462521 ?auto_462533 ) ) ( not ( = ?auto_462522 ?auto_462523 ) ) ( not ( = ?auto_462522 ?auto_462524 ) ) ( not ( = ?auto_462522 ?auto_462525 ) ) ( not ( = ?auto_462522 ?auto_462526 ) ) ( not ( = ?auto_462522 ?auto_462527 ) ) ( not ( = ?auto_462522 ?auto_462528 ) ) ( not ( = ?auto_462522 ?auto_462529 ) ) ( not ( = ?auto_462522 ?auto_462530 ) ) ( not ( = ?auto_462522 ?auto_462531 ) ) ( not ( = ?auto_462522 ?auto_462532 ) ) ( not ( = ?auto_462522 ?auto_462533 ) ) ( not ( = ?auto_462523 ?auto_462524 ) ) ( not ( = ?auto_462523 ?auto_462525 ) ) ( not ( = ?auto_462523 ?auto_462526 ) ) ( not ( = ?auto_462523 ?auto_462527 ) ) ( not ( = ?auto_462523 ?auto_462528 ) ) ( not ( = ?auto_462523 ?auto_462529 ) ) ( not ( = ?auto_462523 ?auto_462530 ) ) ( not ( = ?auto_462523 ?auto_462531 ) ) ( not ( = ?auto_462523 ?auto_462532 ) ) ( not ( = ?auto_462523 ?auto_462533 ) ) ( not ( = ?auto_462524 ?auto_462525 ) ) ( not ( = ?auto_462524 ?auto_462526 ) ) ( not ( = ?auto_462524 ?auto_462527 ) ) ( not ( = ?auto_462524 ?auto_462528 ) ) ( not ( = ?auto_462524 ?auto_462529 ) ) ( not ( = ?auto_462524 ?auto_462530 ) ) ( not ( = ?auto_462524 ?auto_462531 ) ) ( not ( = ?auto_462524 ?auto_462532 ) ) ( not ( = ?auto_462524 ?auto_462533 ) ) ( not ( = ?auto_462525 ?auto_462526 ) ) ( not ( = ?auto_462525 ?auto_462527 ) ) ( not ( = ?auto_462525 ?auto_462528 ) ) ( not ( = ?auto_462525 ?auto_462529 ) ) ( not ( = ?auto_462525 ?auto_462530 ) ) ( not ( = ?auto_462525 ?auto_462531 ) ) ( not ( = ?auto_462525 ?auto_462532 ) ) ( not ( = ?auto_462525 ?auto_462533 ) ) ( not ( = ?auto_462526 ?auto_462527 ) ) ( not ( = ?auto_462526 ?auto_462528 ) ) ( not ( = ?auto_462526 ?auto_462529 ) ) ( not ( = ?auto_462526 ?auto_462530 ) ) ( not ( = ?auto_462526 ?auto_462531 ) ) ( not ( = ?auto_462526 ?auto_462532 ) ) ( not ( = ?auto_462526 ?auto_462533 ) ) ( not ( = ?auto_462527 ?auto_462528 ) ) ( not ( = ?auto_462527 ?auto_462529 ) ) ( not ( = ?auto_462527 ?auto_462530 ) ) ( not ( = ?auto_462527 ?auto_462531 ) ) ( not ( = ?auto_462527 ?auto_462532 ) ) ( not ( = ?auto_462527 ?auto_462533 ) ) ( not ( = ?auto_462528 ?auto_462529 ) ) ( not ( = ?auto_462528 ?auto_462530 ) ) ( not ( = ?auto_462528 ?auto_462531 ) ) ( not ( = ?auto_462528 ?auto_462532 ) ) ( not ( = ?auto_462528 ?auto_462533 ) ) ( not ( = ?auto_462529 ?auto_462530 ) ) ( not ( = ?auto_462529 ?auto_462531 ) ) ( not ( = ?auto_462529 ?auto_462532 ) ) ( not ( = ?auto_462529 ?auto_462533 ) ) ( not ( = ?auto_462530 ?auto_462531 ) ) ( not ( = ?auto_462530 ?auto_462532 ) ) ( not ( = ?auto_462530 ?auto_462533 ) ) ( not ( = ?auto_462531 ?auto_462532 ) ) ( not ( = ?auto_462531 ?auto_462533 ) ) ( not ( = ?auto_462532 ?auto_462533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_462532 ?auto_462533 )
      ( !STACK ?auto_462532 ?auto_462531 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462547 - BLOCK
      ?auto_462548 - BLOCK
      ?auto_462549 - BLOCK
      ?auto_462550 - BLOCK
      ?auto_462551 - BLOCK
      ?auto_462552 - BLOCK
      ?auto_462553 - BLOCK
      ?auto_462554 - BLOCK
      ?auto_462555 - BLOCK
      ?auto_462556 - BLOCK
      ?auto_462557 - BLOCK
      ?auto_462558 - BLOCK
      ?auto_462559 - BLOCK
    )
    :vars
    (
      ?auto_462560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462559 ?auto_462560 ) ( ON-TABLE ?auto_462547 ) ( ON ?auto_462548 ?auto_462547 ) ( ON ?auto_462549 ?auto_462548 ) ( ON ?auto_462550 ?auto_462549 ) ( ON ?auto_462551 ?auto_462550 ) ( ON ?auto_462552 ?auto_462551 ) ( ON ?auto_462553 ?auto_462552 ) ( ON ?auto_462554 ?auto_462553 ) ( ON ?auto_462555 ?auto_462554 ) ( ON ?auto_462556 ?auto_462555 ) ( ON ?auto_462557 ?auto_462556 ) ( not ( = ?auto_462547 ?auto_462548 ) ) ( not ( = ?auto_462547 ?auto_462549 ) ) ( not ( = ?auto_462547 ?auto_462550 ) ) ( not ( = ?auto_462547 ?auto_462551 ) ) ( not ( = ?auto_462547 ?auto_462552 ) ) ( not ( = ?auto_462547 ?auto_462553 ) ) ( not ( = ?auto_462547 ?auto_462554 ) ) ( not ( = ?auto_462547 ?auto_462555 ) ) ( not ( = ?auto_462547 ?auto_462556 ) ) ( not ( = ?auto_462547 ?auto_462557 ) ) ( not ( = ?auto_462547 ?auto_462558 ) ) ( not ( = ?auto_462547 ?auto_462559 ) ) ( not ( = ?auto_462547 ?auto_462560 ) ) ( not ( = ?auto_462548 ?auto_462549 ) ) ( not ( = ?auto_462548 ?auto_462550 ) ) ( not ( = ?auto_462548 ?auto_462551 ) ) ( not ( = ?auto_462548 ?auto_462552 ) ) ( not ( = ?auto_462548 ?auto_462553 ) ) ( not ( = ?auto_462548 ?auto_462554 ) ) ( not ( = ?auto_462548 ?auto_462555 ) ) ( not ( = ?auto_462548 ?auto_462556 ) ) ( not ( = ?auto_462548 ?auto_462557 ) ) ( not ( = ?auto_462548 ?auto_462558 ) ) ( not ( = ?auto_462548 ?auto_462559 ) ) ( not ( = ?auto_462548 ?auto_462560 ) ) ( not ( = ?auto_462549 ?auto_462550 ) ) ( not ( = ?auto_462549 ?auto_462551 ) ) ( not ( = ?auto_462549 ?auto_462552 ) ) ( not ( = ?auto_462549 ?auto_462553 ) ) ( not ( = ?auto_462549 ?auto_462554 ) ) ( not ( = ?auto_462549 ?auto_462555 ) ) ( not ( = ?auto_462549 ?auto_462556 ) ) ( not ( = ?auto_462549 ?auto_462557 ) ) ( not ( = ?auto_462549 ?auto_462558 ) ) ( not ( = ?auto_462549 ?auto_462559 ) ) ( not ( = ?auto_462549 ?auto_462560 ) ) ( not ( = ?auto_462550 ?auto_462551 ) ) ( not ( = ?auto_462550 ?auto_462552 ) ) ( not ( = ?auto_462550 ?auto_462553 ) ) ( not ( = ?auto_462550 ?auto_462554 ) ) ( not ( = ?auto_462550 ?auto_462555 ) ) ( not ( = ?auto_462550 ?auto_462556 ) ) ( not ( = ?auto_462550 ?auto_462557 ) ) ( not ( = ?auto_462550 ?auto_462558 ) ) ( not ( = ?auto_462550 ?auto_462559 ) ) ( not ( = ?auto_462550 ?auto_462560 ) ) ( not ( = ?auto_462551 ?auto_462552 ) ) ( not ( = ?auto_462551 ?auto_462553 ) ) ( not ( = ?auto_462551 ?auto_462554 ) ) ( not ( = ?auto_462551 ?auto_462555 ) ) ( not ( = ?auto_462551 ?auto_462556 ) ) ( not ( = ?auto_462551 ?auto_462557 ) ) ( not ( = ?auto_462551 ?auto_462558 ) ) ( not ( = ?auto_462551 ?auto_462559 ) ) ( not ( = ?auto_462551 ?auto_462560 ) ) ( not ( = ?auto_462552 ?auto_462553 ) ) ( not ( = ?auto_462552 ?auto_462554 ) ) ( not ( = ?auto_462552 ?auto_462555 ) ) ( not ( = ?auto_462552 ?auto_462556 ) ) ( not ( = ?auto_462552 ?auto_462557 ) ) ( not ( = ?auto_462552 ?auto_462558 ) ) ( not ( = ?auto_462552 ?auto_462559 ) ) ( not ( = ?auto_462552 ?auto_462560 ) ) ( not ( = ?auto_462553 ?auto_462554 ) ) ( not ( = ?auto_462553 ?auto_462555 ) ) ( not ( = ?auto_462553 ?auto_462556 ) ) ( not ( = ?auto_462553 ?auto_462557 ) ) ( not ( = ?auto_462553 ?auto_462558 ) ) ( not ( = ?auto_462553 ?auto_462559 ) ) ( not ( = ?auto_462553 ?auto_462560 ) ) ( not ( = ?auto_462554 ?auto_462555 ) ) ( not ( = ?auto_462554 ?auto_462556 ) ) ( not ( = ?auto_462554 ?auto_462557 ) ) ( not ( = ?auto_462554 ?auto_462558 ) ) ( not ( = ?auto_462554 ?auto_462559 ) ) ( not ( = ?auto_462554 ?auto_462560 ) ) ( not ( = ?auto_462555 ?auto_462556 ) ) ( not ( = ?auto_462555 ?auto_462557 ) ) ( not ( = ?auto_462555 ?auto_462558 ) ) ( not ( = ?auto_462555 ?auto_462559 ) ) ( not ( = ?auto_462555 ?auto_462560 ) ) ( not ( = ?auto_462556 ?auto_462557 ) ) ( not ( = ?auto_462556 ?auto_462558 ) ) ( not ( = ?auto_462556 ?auto_462559 ) ) ( not ( = ?auto_462556 ?auto_462560 ) ) ( not ( = ?auto_462557 ?auto_462558 ) ) ( not ( = ?auto_462557 ?auto_462559 ) ) ( not ( = ?auto_462557 ?auto_462560 ) ) ( not ( = ?auto_462558 ?auto_462559 ) ) ( not ( = ?auto_462558 ?auto_462560 ) ) ( not ( = ?auto_462559 ?auto_462560 ) ) ( CLEAR ?auto_462557 ) ( ON ?auto_462558 ?auto_462559 ) ( CLEAR ?auto_462558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_462547 ?auto_462548 ?auto_462549 ?auto_462550 ?auto_462551 ?auto_462552 ?auto_462553 ?auto_462554 ?auto_462555 ?auto_462556 ?auto_462557 ?auto_462558 )
      ( MAKE-13PILE ?auto_462547 ?auto_462548 ?auto_462549 ?auto_462550 ?auto_462551 ?auto_462552 ?auto_462553 ?auto_462554 ?auto_462555 ?auto_462556 ?auto_462557 ?auto_462558 ?auto_462559 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462574 - BLOCK
      ?auto_462575 - BLOCK
      ?auto_462576 - BLOCK
      ?auto_462577 - BLOCK
      ?auto_462578 - BLOCK
      ?auto_462579 - BLOCK
      ?auto_462580 - BLOCK
      ?auto_462581 - BLOCK
      ?auto_462582 - BLOCK
      ?auto_462583 - BLOCK
      ?auto_462584 - BLOCK
      ?auto_462585 - BLOCK
      ?auto_462586 - BLOCK
    )
    :vars
    (
      ?auto_462587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462586 ?auto_462587 ) ( ON-TABLE ?auto_462574 ) ( ON ?auto_462575 ?auto_462574 ) ( ON ?auto_462576 ?auto_462575 ) ( ON ?auto_462577 ?auto_462576 ) ( ON ?auto_462578 ?auto_462577 ) ( ON ?auto_462579 ?auto_462578 ) ( ON ?auto_462580 ?auto_462579 ) ( ON ?auto_462581 ?auto_462580 ) ( ON ?auto_462582 ?auto_462581 ) ( ON ?auto_462583 ?auto_462582 ) ( ON ?auto_462584 ?auto_462583 ) ( not ( = ?auto_462574 ?auto_462575 ) ) ( not ( = ?auto_462574 ?auto_462576 ) ) ( not ( = ?auto_462574 ?auto_462577 ) ) ( not ( = ?auto_462574 ?auto_462578 ) ) ( not ( = ?auto_462574 ?auto_462579 ) ) ( not ( = ?auto_462574 ?auto_462580 ) ) ( not ( = ?auto_462574 ?auto_462581 ) ) ( not ( = ?auto_462574 ?auto_462582 ) ) ( not ( = ?auto_462574 ?auto_462583 ) ) ( not ( = ?auto_462574 ?auto_462584 ) ) ( not ( = ?auto_462574 ?auto_462585 ) ) ( not ( = ?auto_462574 ?auto_462586 ) ) ( not ( = ?auto_462574 ?auto_462587 ) ) ( not ( = ?auto_462575 ?auto_462576 ) ) ( not ( = ?auto_462575 ?auto_462577 ) ) ( not ( = ?auto_462575 ?auto_462578 ) ) ( not ( = ?auto_462575 ?auto_462579 ) ) ( not ( = ?auto_462575 ?auto_462580 ) ) ( not ( = ?auto_462575 ?auto_462581 ) ) ( not ( = ?auto_462575 ?auto_462582 ) ) ( not ( = ?auto_462575 ?auto_462583 ) ) ( not ( = ?auto_462575 ?auto_462584 ) ) ( not ( = ?auto_462575 ?auto_462585 ) ) ( not ( = ?auto_462575 ?auto_462586 ) ) ( not ( = ?auto_462575 ?auto_462587 ) ) ( not ( = ?auto_462576 ?auto_462577 ) ) ( not ( = ?auto_462576 ?auto_462578 ) ) ( not ( = ?auto_462576 ?auto_462579 ) ) ( not ( = ?auto_462576 ?auto_462580 ) ) ( not ( = ?auto_462576 ?auto_462581 ) ) ( not ( = ?auto_462576 ?auto_462582 ) ) ( not ( = ?auto_462576 ?auto_462583 ) ) ( not ( = ?auto_462576 ?auto_462584 ) ) ( not ( = ?auto_462576 ?auto_462585 ) ) ( not ( = ?auto_462576 ?auto_462586 ) ) ( not ( = ?auto_462576 ?auto_462587 ) ) ( not ( = ?auto_462577 ?auto_462578 ) ) ( not ( = ?auto_462577 ?auto_462579 ) ) ( not ( = ?auto_462577 ?auto_462580 ) ) ( not ( = ?auto_462577 ?auto_462581 ) ) ( not ( = ?auto_462577 ?auto_462582 ) ) ( not ( = ?auto_462577 ?auto_462583 ) ) ( not ( = ?auto_462577 ?auto_462584 ) ) ( not ( = ?auto_462577 ?auto_462585 ) ) ( not ( = ?auto_462577 ?auto_462586 ) ) ( not ( = ?auto_462577 ?auto_462587 ) ) ( not ( = ?auto_462578 ?auto_462579 ) ) ( not ( = ?auto_462578 ?auto_462580 ) ) ( not ( = ?auto_462578 ?auto_462581 ) ) ( not ( = ?auto_462578 ?auto_462582 ) ) ( not ( = ?auto_462578 ?auto_462583 ) ) ( not ( = ?auto_462578 ?auto_462584 ) ) ( not ( = ?auto_462578 ?auto_462585 ) ) ( not ( = ?auto_462578 ?auto_462586 ) ) ( not ( = ?auto_462578 ?auto_462587 ) ) ( not ( = ?auto_462579 ?auto_462580 ) ) ( not ( = ?auto_462579 ?auto_462581 ) ) ( not ( = ?auto_462579 ?auto_462582 ) ) ( not ( = ?auto_462579 ?auto_462583 ) ) ( not ( = ?auto_462579 ?auto_462584 ) ) ( not ( = ?auto_462579 ?auto_462585 ) ) ( not ( = ?auto_462579 ?auto_462586 ) ) ( not ( = ?auto_462579 ?auto_462587 ) ) ( not ( = ?auto_462580 ?auto_462581 ) ) ( not ( = ?auto_462580 ?auto_462582 ) ) ( not ( = ?auto_462580 ?auto_462583 ) ) ( not ( = ?auto_462580 ?auto_462584 ) ) ( not ( = ?auto_462580 ?auto_462585 ) ) ( not ( = ?auto_462580 ?auto_462586 ) ) ( not ( = ?auto_462580 ?auto_462587 ) ) ( not ( = ?auto_462581 ?auto_462582 ) ) ( not ( = ?auto_462581 ?auto_462583 ) ) ( not ( = ?auto_462581 ?auto_462584 ) ) ( not ( = ?auto_462581 ?auto_462585 ) ) ( not ( = ?auto_462581 ?auto_462586 ) ) ( not ( = ?auto_462581 ?auto_462587 ) ) ( not ( = ?auto_462582 ?auto_462583 ) ) ( not ( = ?auto_462582 ?auto_462584 ) ) ( not ( = ?auto_462582 ?auto_462585 ) ) ( not ( = ?auto_462582 ?auto_462586 ) ) ( not ( = ?auto_462582 ?auto_462587 ) ) ( not ( = ?auto_462583 ?auto_462584 ) ) ( not ( = ?auto_462583 ?auto_462585 ) ) ( not ( = ?auto_462583 ?auto_462586 ) ) ( not ( = ?auto_462583 ?auto_462587 ) ) ( not ( = ?auto_462584 ?auto_462585 ) ) ( not ( = ?auto_462584 ?auto_462586 ) ) ( not ( = ?auto_462584 ?auto_462587 ) ) ( not ( = ?auto_462585 ?auto_462586 ) ) ( not ( = ?auto_462585 ?auto_462587 ) ) ( not ( = ?auto_462586 ?auto_462587 ) ) ( CLEAR ?auto_462584 ) ( ON ?auto_462585 ?auto_462586 ) ( CLEAR ?auto_462585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_462574 ?auto_462575 ?auto_462576 ?auto_462577 ?auto_462578 ?auto_462579 ?auto_462580 ?auto_462581 ?auto_462582 ?auto_462583 ?auto_462584 ?auto_462585 )
      ( MAKE-13PILE ?auto_462574 ?auto_462575 ?auto_462576 ?auto_462577 ?auto_462578 ?auto_462579 ?auto_462580 ?auto_462581 ?auto_462582 ?auto_462583 ?auto_462584 ?auto_462585 ?auto_462586 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462601 - BLOCK
      ?auto_462602 - BLOCK
      ?auto_462603 - BLOCK
      ?auto_462604 - BLOCK
      ?auto_462605 - BLOCK
      ?auto_462606 - BLOCK
      ?auto_462607 - BLOCK
      ?auto_462608 - BLOCK
      ?auto_462609 - BLOCK
      ?auto_462610 - BLOCK
      ?auto_462611 - BLOCK
      ?auto_462612 - BLOCK
      ?auto_462613 - BLOCK
    )
    :vars
    (
      ?auto_462614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462613 ?auto_462614 ) ( ON-TABLE ?auto_462601 ) ( ON ?auto_462602 ?auto_462601 ) ( ON ?auto_462603 ?auto_462602 ) ( ON ?auto_462604 ?auto_462603 ) ( ON ?auto_462605 ?auto_462604 ) ( ON ?auto_462606 ?auto_462605 ) ( ON ?auto_462607 ?auto_462606 ) ( ON ?auto_462608 ?auto_462607 ) ( ON ?auto_462609 ?auto_462608 ) ( ON ?auto_462610 ?auto_462609 ) ( not ( = ?auto_462601 ?auto_462602 ) ) ( not ( = ?auto_462601 ?auto_462603 ) ) ( not ( = ?auto_462601 ?auto_462604 ) ) ( not ( = ?auto_462601 ?auto_462605 ) ) ( not ( = ?auto_462601 ?auto_462606 ) ) ( not ( = ?auto_462601 ?auto_462607 ) ) ( not ( = ?auto_462601 ?auto_462608 ) ) ( not ( = ?auto_462601 ?auto_462609 ) ) ( not ( = ?auto_462601 ?auto_462610 ) ) ( not ( = ?auto_462601 ?auto_462611 ) ) ( not ( = ?auto_462601 ?auto_462612 ) ) ( not ( = ?auto_462601 ?auto_462613 ) ) ( not ( = ?auto_462601 ?auto_462614 ) ) ( not ( = ?auto_462602 ?auto_462603 ) ) ( not ( = ?auto_462602 ?auto_462604 ) ) ( not ( = ?auto_462602 ?auto_462605 ) ) ( not ( = ?auto_462602 ?auto_462606 ) ) ( not ( = ?auto_462602 ?auto_462607 ) ) ( not ( = ?auto_462602 ?auto_462608 ) ) ( not ( = ?auto_462602 ?auto_462609 ) ) ( not ( = ?auto_462602 ?auto_462610 ) ) ( not ( = ?auto_462602 ?auto_462611 ) ) ( not ( = ?auto_462602 ?auto_462612 ) ) ( not ( = ?auto_462602 ?auto_462613 ) ) ( not ( = ?auto_462602 ?auto_462614 ) ) ( not ( = ?auto_462603 ?auto_462604 ) ) ( not ( = ?auto_462603 ?auto_462605 ) ) ( not ( = ?auto_462603 ?auto_462606 ) ) ( not ( = ?auto_462603 ?auto_462607 ) ) ( not ( = ?auto_462603 ?auto_462608 ) ) ( not ( = ?auto_462603 ?auto_462609 ) ) ( not ( = ?auto_462603 ?auto_462610 ) ) ( not ( = ?auto_462603 ?auto_462611 ) ) ( not ( = ?auto_462603 ?auto_462612 ) ) ( not ( = ?auto_462603 ?auto_462613 ) ) ( not ( = ?auto_462603 ?auto_462614 ) ) ( not ( = ?auto_462604 ?auto_462605 ) ) ( not ( = ?auto_462604 ?auto_462606 ) ) ( not ( = ?auto_462604 ?auto_462607 ) ) ( not ( = ?auto_462604 ?auto_462608 ) ) ( not ( = ?auto_462604 ?auto_462609 ) ) ( not ( = ?auto_462604 ?auto_462610 ) ) ( not ( = ?auto_462604 ?auto_462611 ) ) ( not ( = ?auto_462604 ?auto_462612 ) ) ( not ( = ?auto_462604 ?auto_462613 ) ) ( not ( = ?auto_462604 ?auto_462614 ) ) ( not ( = ?auto_462605 ?auto_462606 ) ) ( not ( = ?auto_462605 ?auto_462607 ) ) ( not ( = ?auto_462605 ?auto_462608 ) ) ( not ( = ?auto_462605 ?auto_462609 ) ) ( not ( = ?auto_462605 ?auto_462610 ) ) ( not ( = ?auto_462605 ?auto_462611 ) ) ( not ( = ?auto_462605 ?auto_462612 ) ) ( not ( = ?auto_462605 ?auto_462613 ) ) ( not ( = ?auto_462605 ?auto_462614 ) ) ( not ( = ?auto_462606 ?auto_462607 ) ) ( not ( = ?auto_462606 ?auto_462608 ) ) ( not ( = ?auto_462606 ?auto_462609 ) ) ( not ( = ?auto_462606 ?auto_462610 ) ) ( not ( = ?auto_462606 ?auto_462611 ) ) ( not ( = ?auto_462606 ?auto_462612 ) ) ( not ( = ?auto_462606 ?auto_462613 ) ) ( not ( = ?auto_462606 ?auto_462614 ) ) ( not ( = ?auto_462607 ?auto_462608 ) ) ( not ( = ?auto_462607 ?auto_462609 ) ) ( not ( = ?auto_462607 ?auto_462610 ) ) ( not ( = ?auto_462607 ?auto_462611 ) ) ( not ( = ?auto_462607 ?auto_462612 ) ) ( not ( = ?auto_462607 ?auto_462613 ) ) ( not ( = ?auto_462607 ?auto_462614 ) ) ( not ( = ?auto_462608 ?auto_462609 ) ) ( not ( = ?auto_462608 ?auto_462610 ) ) ( not ( = ?auto_462608 ?auto_462611 ) ) ( not ( = ?auto_462608 ?auto_462612 ) ) ( not ( = ?auto_462608 ?auto_462613 ) ) ( not ( = ?auto_462608 ?auto_462614 ) ) ( not ( = ?auto_462609 ?auto_462610 ) ) ( not ( = ?auto_462609 ?auto_462611 ) ) ( not ( = ?auto_462609 ?auto_462612 ) ) ( not ( = ?auto_462609 ?auto_462613 ) ) ( not ( = ?auto_462609 ?auto_462614 ) ) ( not ( = ?auto_462610 ?auto_462611 ) ) ( not ( = ?auto_462610 ?auto_462612 ) ) ( not ( = ?auto_462610 ?auto_462613 ) ) ( not ( = ?auto_462610 ?auto_462614 ) ) ( not ( = ?auto_462611 ?auto_462612 ) ) ( not ( = ?auto_462611 ?auto_462613 ) ) ( not ( = ?auto_462611 ?auto_462614 ) ) ( not ( = ?auto_462612 ?auto_462613 ) ) ( not ( = ?auto_462612 ?auto_462614 ) ) ( not ( = ?auto_462613 ?auto_462614 ) ) ( ON ?auto_462612 ?auto_462613 ) ( CLEAR ?auto_462610 ) ( ON ?auto_462611 ?auto_462612 ) ( CLEAR ?auto_462611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_462601 ?auto_462602 ?auto_462603 ?auto_462604 ?auto_462605 ?auto_462606 ?auto_462607 ?auto_462608 ?auto_462609 ?auto_462610 ?auto_462611 )
      ( MAKE-13PILE ?auto_462601 ?auto_462602 ?auto_462603 ?auto_462604 ?auto_462605 ?auto_462606 ?auto_462607 ?auto_462608 ?auto_462609 ?auto_462610 ?auto_462611 ?auto_462612 ?auto_462613 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462628 - BLOCK
      ?auto_462629 - BLOCK
      ?auto_462630 - BLOCK
      ?auto_462631 - BLOCK
      ?auto_462632 - BLOCK
      ?auto_462633 - BLOCK
      ?auto_462634 - BLOCK
      ?auto_462635 - BLOCK
      ?auto_462636 - BLOCK
      ?auto_462637 - BLOCK
      ?auto_462638 - BLOCK
      ?auto_462639 - BLOCK
      ?auto_462640 - BLOCK
    )
    :vars
    (
      ?auto_462641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462640 ?auto_462641 ) ( ON-TABLE ?auto_462628 ) ( ON ?auto_462629 ?auto_462628 ) ( ON ?auto_462630 ?auto_462629 ) ( ON ?auto_462631 ?auto_462630 ) ( ON ?auto_462632 ?auto_462631 ) ( ON ?auto_462633 ?auto_462632 ) ( ON ?auto_462634 ?auto_462633 ) ( ON ?auto_462635 ?auto_462634 ) ( ON ?auto_462636 ?auto_462635 ) ( ON ?auto_462637 ?auto_462636 ) ( not ( = ?auto_462628 ?auto_462629 ) ) ( not ( = ?auto_462628 ?auto_462630 ) ) ( not ( = ?auto_462628 ?auto_462631 ) ) ( not ( = ?auto_462628 ?auto_462632 ) ) ( not ( = ?auto_462628 ?auto_462633 ) ) ( not ( = ?auto_462628 ?auto_462634 ) ) ( not ( = ?auto_462628 ?auto_462635 ) ) ( not ( = ?auto_462628 ?auto_462636 ) ) ( not ( = ?auto_462628 ?auto_462637 ) ) ( not ( = ?auto_462628 ?auto_462638 ) ) ( not ( = ?auto_462628 ?auto_462639 ) ) ( not ( = ?auto_462628 ?auto_462640 ) ) ( not ( = ?auto_462628 ?auto_462641 ) ) ( not ( = ?auto_462629 ?auto_462630 ) ) ( not ( = ?auto_462629 ?auto_462631 ) ) ( not ( = ?auto_462629 ?auto_462632 ) ) ( not ( = ?auto_462629 ?auto_462633 ) ) ( not ( = ?auto_462629 ?auto_462634 ) ) ( not ( = ?auto_462629 ?auto_462635 ) ) ( not ( = ?auto_462629 ?auto_462636 ) ) ( not ( = ?auto_462629 ?auto_462637 ) ) ( not ( = ?auto_462629 ?auto_462638 ) ) ( not ( = ?auto_462629 ?auto_462639 ) ) ( not ( = ?auto_462629 ?auto_462640 ) ) ( not ( = ?auto_462629 ?auto_462641 ) ) ( not ( = ?auto_462630 ?auto_462631 ) ) ( not ( = ?auto_462630 ?auto_462632 ) ) ( not ( = ?auto_462630 ?auto_462633 ) ) ( not ( = ?auto_462630 ?auto_462634 ) ) ( not ( = ?auto_462630 ?auto_462635 ) ) ( not ( = ?auto_462630 ?auto_462636 ) ) ( not ( = ?auto_462630 ?auto_462637 ) ) ( not ( = ?auto_462630 ?auto_462638 ) ) ( not ( = ?auto_462630 ?auto_462639 ) ) ( not ( = ?auto_462630 ?auto_462640 ) ) ( not ( = ?auto_462630 ?auto_462641 ) ) ( not ( = ?auto_462631 ?auto_462632 ) ) ( not ( = ?auto_462631 ?auto_462633 ) ) ( not ( = ?auto_462631 ?auto_462634 ) ) ( not ( = ?auto_462631 ?auto_462635 ) ) ( not ( = ?auto_462631 ?auto_462636 ) ) ( not ( = ?auto_462631 ?auto_462637 ) ) ( not ( = ?auto_462631 ?auto_462638 ) ) ( not ( = ?auto_462631 ?auto_462639 ) ) ( not ( = ?auto_462631 ?auto_462640 ) ) ( not ( = ?auto_462631 ?auto_462641 ) ) ( not ( = ?auto_462632 ?auto_462633 ) ) ( not ( = ?auto_462632 ?auto_462634 ) ) ( not ( = ?auto_462632 ?auto_462635 ) ) ( not ( = ?auto_462632 ?auto_462636 ) ) ( not ( = ?auto_462632 ?auto_462637 ) ) ( not ( = ?auto_462632 ?auto_462638 ) ) ( not ( = ?auto_462632 ?auto_462639 ) ) ( not ( = ?auto_462632 ?auto_462640 ) ) ( not ( = ?auto_462632 ?auto_462641 ) ) ( not ( = ?auto_462633 ?auto_462634 ) ) ( not ( = ?auto_462633 ?auto_462635 ) ) ( not ( = ?auto_462633 ?auto_462636 ) ) ( not ( = ?auto_462633 ?auto_462637 ) ) ( not ( = ?auto_462633 ?auto_462638 ) ) ( not ( = ?auto_462633 ?auto_462639 ) ) ( not ( = ?auto_462633 ?auto_462640 ) ) ( not ( = ?auto_462633 ?auto_462641 ) ) ( not ( = ?auto_462634 ?auto_462635 ) ) ( not ( = ?auto_462634 ?auto_462636 ) ) ( not ( = ?auto_462634 ?auto_462637 ) ) ( not ( = ?auto_462634 ?auto_462638 ) ) ( not ( = ?auto_462634 ?auto_462639 ) ) ( not ( = ?auto_462634 ?auto_462640 ) ) ( not ( = ?auto_462634 ?auto_462641 ) ) ( not ( = ?auto_462635 ?auto_462636 ) ) ( not ( = ?auto_462635 ?auto_462637 ) ) ( not ( = ?auto_462635 ?auto_462638 ) ) ( not ( = ?auto_462635 ?auto_462639 ) ) ( not ( = ?auto_462635 ?auto_462640 ) ) ( not ( = ?auto_462635 ?auto_462641 ) ) ( not ( = ?auto_462636 ?auto_462637 ) ) ( not ( = ?auto_462636 ?auto_462638 ) ) ( not ( = ?auto_462636 ?auto_462639 ) ) ( not ( = ?auto_462636 ?auto_462640 ) ) ( not ( = ?auto_462636 ?auto_462641 ) ) ( not ( = ?auto_462637 ?auto_462638 ) ) ( not ( = ?auto_462637 ?auto_462639 ) ) ( not ( = ?auto_462637 ?auto_462640 ) ) ( not ( = ?auto_462637 ?auto_462641 ) ) ( not ( = ?auto_462638 ?auto_462639 ) ) ( not ( = ?auto_462638 ?auto_462640 ) ) ( not ( = ?auto_462638 ?auto_462641 ) ) ( not ( = ?auto_462639 ?auto_462640 ) ) ( not ( = ?auto_462639 ?auto_462641 ) ) ( not ( = ?auto_462640 ?auto_462641 ) ) ( ON ?auto_462639 ?auto_462640 ) ( CLEAR ?auto_462637 ) ( ON ?auto_462638 ?auto_462639 ) ( CLEAR ?auto_462638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_462628 ?auto_462629 ?auto_462630 ?auto_462631 ?auto_462632 ?auto_462633 ?auto_462634 ?auto_462635 ?auto_462636 ?auto_462637 ?auto_462638 )
      ( MAKE-13PILE ?auto_462628 ?auto_462629 ?auto_462630 ?auto_462631 ?auto_462632 ?auto_462633 ?auto_462634 ?auto_462635 ?auto_462636 ?auto_462637 ?auto_462638 ?auto_462639 ?auto_462640 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462655 - BLOCK
      ?auto_462656 - BLOCK
      ?auto_462657 - BLOCK
      ?auto_462658 - BLOCK
      ?auto_462659 - BLOCK
      ?auto_462660 - BLOCK
      ?auto_462661 - BLOCK
      ?auto_462662 - BLOCK
      ?auto_462663 - BLOCK
      ?auto_462664 - BLOCK
      ?auto_462665 - BLOCK
      ?auto_462666 - BLOCK
      ?auto_462667 - BLOCK
    )
    :vars
    (
      ?auto_462668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462667 ?auto_462668 ) ( ON-TABLE ?auto_462655 ) ( ON ?auto_462656 ?auto_462655 ) ( ON ?auto_462657 ?auto_462656 ) ( ON ?auto_462658 ?auto_462657 ) ( ON ?auto_462659 ?auto_462658 ) ( ON ?auto_462660 ?auto_462659 ) ( ON ?auto_462661 ?auto_462660 ) ( ON ?auto_462662 ?auto_462661 ) ( ON ?auto_462663 ?auto_462662 ) ( not ( = ?auto_462655 ?auto_462656 ) ) ( not ( = ?auto_462655 ?auto_462657 ) ) ( not ( = ?auto_462655 ?auto_462658 ) ) ( not ( = ?auto_462655 ?auto_462659 ) ) ( not ( = ?auto_462655 ?auto_462660 ) ) ( not ( = ?auto_462655 ?auto_462661 ) ) ( not ( = ?auto_462655 ?auto_462662 ) ) ( not ( = ?auto_462655 ?auto_462663 ) ) ( not ( = ?auto_462655 ?auto_462664 ) ) ( not ( = ?auto_462655 ?auto_462665 ) ) ( not ( = ?auto_462655 ?auto_462666 ) ) ( not ( = ?auto_462655 ?auto_462667 ) ) ( not ( = ?auto_462655 ?auto_462668 ) ) ( not ( = ?auto_462656 ?auto_462657 ) ) ( not ( = ?auto_462656 ?auto_462658 ) ) ( not ( = ?auto_462656 ?auto_462659 ) ) ( not ( = ?auto_462656 ?auto_462660 ) ) ( not ( = ?auto_462656 ?auto_462661 ) ) ( not ( = ?auto_462656 ?auto_462662 ) ) ( not ( = ?auto_462656 ?auto_462663 ) ) ( not ( = ?auto_462656 ?auto_462664 ) ) ( not ( = ?auto_462656 ?auto_462665 ) ) ( not ( = ?auto_462656 ?auto_462666 ) ) ( not ( = ?auto_462656 ?auto_462667 ) ) ( not ( = ?auto_462656 ?auto_462668 ) ) ( not ( = ?auto_462657 ?auto_462658 ) ) ( not ( = ?auto_462657 ?auto_462659 ) ) ( not ( = ?auto_462657 ?auto_462660 ) ) ( not ( = ?auto_462657 ?auto_462661 ) ) ( not ( = ?auto_462657 ?auto_462662 ) ) ( not ( = ?auto_462657 ?auto_462663 ) ) ( not ( = ?auto_462657 ?auto_462664 ) ) ( not ( = ?auto_462657 ?auto_462665 ) ) ( not ( = ?auto_462657 ?auto_462666 ) ) ( not ( = ?auto_462657 ?auto_462667 ) ) ( not ( = ?auto_462657 ?auto_462668 ) ) ( not ( = ?auto_462658 ?auto_462659 ) ) ( not ( = ?auto_462658 ?auto_462660 ) ) ( not ( = ?auto_462658 ?auto_462661 ) ) ( not ( = ?auto_462658 ?auto_462662 ) ) ( not ( = ?auto_462658 ?auto_462663 ) ) ( not ( = ?auto_462658 ?auto_462664 ) ) ( not ( = ?auto_462658 ?auto_462665 ) ) ( not ( = ?auto_462658 ?auto_462666 ) ) ( not ( = ?auto_462658 ?auto_462667 ) ) ( not ( = ?auto_462658 ?auto_462668 ) ) ( not ( = ?auto_462659 ?auto_462660 ) ) ( not ( = ?auto_462659 ?auto_462661 ) ) ( not ( = ?auto_462659 ?auto_462662 ) ) ( not ( = ?auto_462659 ?auto_462663 ) ) ( not ( = ?auto_462659 ?auto_462664 ) ) ( not ( = ?auto_462659 ?auto_462665 ) ) ( not ( = ?auto_462659 ?auto_462666 ) ) ( not ( = ?auto_462659 ?auto_462667 ) ) ( not ( = ?auto_462659 ?auto_462668 ) ) ( not ( = ?auto_462660 ?auto_462661 ) ) ( not ( = ?auto_462660 ?auto_462662 ) ) ( not ( = ?auto_462660 ?auto_462663 ) ) ( not ( = ?auto_462660 ?auto_462664 ) ) ( not ( = ?auto_462660 ?auto_462665 ) ) ( not ( = ?auto_462660 ?auto_462666 ) ) ( not ( = ?auto_462660 ?auto_462667 ) ) ( not ( = ?auto_462660 ?auto_462668 ) ) ( not ( = ?auto_462661 ?auto_462662 ) ) ( not ( = ?auto_462661 ?auto_462663 ) ) ( not ( = ?auto_462661 ?auto_462664 ) ) ( not ( = ?auto_462661 ?auto_462665 ) ) ( not ( = ?auto_462661 ?auto_462666 ) ) ( not ( = ?auto_462661 ?auto_462667 ) ) ( not ( = ?auto_462661 ?auto_462668 ) ) ( not ( = ?auto_462662 ?auto_462663 ) ) ( not ( = ?auto_462662 ?auto_462664 ) ) ( not ( = ?auto_462662 ?auto_462665 ) ) ( not ( = ?auto_462662 ?auto_462666 ) ) ( not ( = ?auto_462662 ?auto_462667 ) ) ( not ( = ?auto_462662 ?auto_462668 ) ) ( not ( = ?auto_462663 ?auto_462664 ) ) ( not ( = ?auto_462663 ?auto_462665 ) ) ( not ( = ?auto_462663 ?auto_462666 ) ) ( not ( = ?auto_462663 ?auto_462667 ) ) ( not ( = ?auto_462663 ?auto_462668 ) ) ( not ( = ?auto_462664 ?auto_462665 ) ) ( not ( = ?auto_462664 ?auto_462666 ) ) ( not ( = ?auto_462664 ?auto_462667 ) ) ( not ( = ?auto_462664 ?auto_462668 ) ) ( not ( = ?auto_462665 ?auto_462666 ) ) ( not ( = ?auto_462665 ?auto_462667 ) ) ( not ( = ?auto_462665 ?auto_462668 ) ) ( not ( = ?auto_462666 ?auto_462667 ) ) ( not ( = ?auto_462666 ?auto_462668 ) ) ( not ( = ?auto_462667 ?auto_462668 ) ) ( ON ?auto_462666 ?auto_462667 ) ( ON ?auto_462665 ?auto_462666 ) ( CLEAR ?auto_462663 ) ( ON ?auto_462664 ?auto_462665 ) ( CLEAR ?auto_462664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_462655 ?auto_462656 ?auto_462657 ?auto_462658 ?auto_462659 ?auto_462660 ?auto_462661 ?auto_462662 ?auto_462663 ?auto_462664 )
      ( MAKE-13PILE ?auto_462655 ?auto_462656 ?auto_462657 ?auto_462658 ?auto_462659 ?auto_462660 ?auto_462661 ?auto_462662 ?auto_462663 ?auto_462664 ?auto_462665 ?auto_462666 ?auto_462667 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462682 - BLOCK
      ?auto_462683 - BLOCK
      ?auto_462684 - BLOCK
      ?auto_462685 - BLOCK
      ?auto_462686 - BLOCK
      ?auto_462687 - BLOCK
      ?auto_462688 - BLOCK
      ?auto_462689 - BLOCK
      ?auto_462690 - BLOCK
      ?auto_462691 - BLOCK
      ?auto_462692 - BLOCK
      ?auto_462693 - BLOCK
      ?auto_462694 - BLOCK
    )
    :vars
    (
      ?auto_462695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462694 ?auto_462695 ) ( ON-TABLE ?auto_462682 ) ( ON ?auto_462683 ?auto_462682 ) ( ON ?auto_462684 ?auto_462683 ) ( ON ?auto_462685 ?auto_462684 ) ( ON ?auto_462686 ?auto_462685 ) ( ON ?auto_462687 ?auto_462686 ) ( ON ?auto_462688 ?auto_462687 ) ( ON ?auto_462689 ?auto_462688 ) ( ON ?auto_462690 ?auto_462689 ) ( not ( = ?auto_462682 ?auto_462683 ) ) ( not ( = ?auto_462682 ?auto_462684 ) ) ( not ( = ?auto_462682 ?auto_462685 ) ) ( not ( = ?auto_462682 ?auto_462686 ) ) ( not ( = ?auto_462682 ?auto_462687 ) ) ( not ( = ?auto_462682 ?auto_462688 ) ) ( not ( = ?auto_462682 ?auto_462689 ) ) ( not ( = ?auto_462682 ?auto_462690 ) ) ( not ( = ?auto_462682 ?auto_462691 ) ) ( not ( = ?auto_462682 ?auto_462692 ) ) ( not ( = ?auto_462682 ?auto_462693 ) ) ( not ( = ?auto_462682 ?auto_462694 ) ) ( not ( = ?auto_462682 ?auto_462695 ) ) ( not ( = ?auto_462683 ?auto_462684 ) ) ( not ( = ?auto_462683 ?auto_462685 ) ) ( not ( = ?auto_462683 ?auto_462686 ) ) ( not ( = ?auto_462683 ?auto_462687 ) ) ( not ( = ?auto_462683 ?auto_462688 ) ) ( not ( = ?auto_462683 ?auto_462689 ) ) ( not ( = ?auto_462683 ?auto_462690 ) ) ( not ( = ?auto_462683 ?auto_462691 ) ) ( not ( = ?auto_462683 ?auto_462692 ) ) ( not ( = ?auto_462683 ?auto_462693 ) ) ( not ( = ?auto_462683 ?auto_462694 ) ) ( not ( = ?auto_462683 ?auto_462695 ) ) ( not ( = ?auto_462684 ?auto_462685 ) ) ( not ( = ?auto_462684 ?auto_462686 ) ) ( not ( = ?auto_462684 ?auto_462687 ) ) ( not ( = ?auto_462684 ?auto_462688 ) ) ( not ( = ?auto_462684 ?auto_462689 ) ) ( not ( = ?auto_462684 ?auto_462690 ) ) ( not ( = ?auto_462684 ?auto_462691 ) ) ( not ( = ?auto_462684 ?auto_462692 ) ) ( not ( = ?auto_462684 ?auto_462693 ) ) ( not ( = ?auto_462684 ?auto_462694 ) ) ( not ( = ?auto_462684 ?auto_462695 ) ) ( not ( = ?auto_462685 ?auto_462686 ) ) ( not ( = ?auto_462685 ?auto_462687 ) ) ( not ( = ?auto_462685 ?auto_462688 ) ) ( not ( = ?auto_462685 ?auto_462689 ) ) ( not ( = ?auto_462685 ?auto_462690 ) ) ( not ( = ?auto_462685 ?auto_462691 ) ) ( not ( = ?auto_462685 ?auto_462692 ) ) ( not ( = ?auto_462685 ?auto_462693 ) ) ( not ( = ?auto_462685 ?auto_462694 ) ) ( not ( = ?auto_462685 ?auto_462695 ) ) ( not ( = ?auto_462686 ?auto_462687 ) ) ( not ( = ?auto_462686 ?auto_462688 ) ) ( not ( = ?auto_462686 ?auto_462689 ) ) ( not ( = ?auto_462686 ?auto_462690 ) ) ( not ( = ?auto_462686 ?auto_462691 ) ) ( not ( = ?auto_462686 ?auto_462692 ) ) ( not ( = ?auto_462686 ?auto_462693 ) ) ( not ( = ?auto_462686 ?auto_462694 ) ) ( not ( = ?auto_462686 ?auto_462695 ) ) ( not ( = ?auto_462687 ?auto_462688 ) ) ( not ( = ?auto_462687 ?auto_462689 ) ) ( not ( = ?auto_462687 ?auto_462690 ) ) ( not ( = ?auto_462687 ?auto_462691 ) ) ( not ( = ?auto_462687 ?auto_462692 ) ) ( not ( = ?auto_462687 ?auto_462693 ) ) ( not ( = ?auto_462687 ?auto_462694 ) ) ( not ( = ?auto_462687 ?auto_462695 ) ) ( not ( = ?auto_462688 ?auto_462689 ) ) ( not ( = ?auto_462688 ?auto_462690 ) ) ( not ( = ?auto_462688 ?auto_462691 ) ) ( not ( = ?auto_462688 ?auto_462692 ) ) ( not ( = ?auto_462688 ?auto_462693 ) ) ( not ( = ?auto_462688 ?auto_462694 ) ) ( not ( = ?auto_462688 ?auto_462695 ) ) ( not ( = ?auto_462689 ?auto_462690 ) ) ( not ( = ?auto_462689 ?auto_462691 ) ) ( not ( = ?auto_462689 ?auto_462692 ) ) ( not ( = ?auto_462689 ?auto_462693 ) ) ( not ( = ?auto_462689 ?auto_462694 ) ) ( not ( = ?auto_462689 ?auto_462695 ) ) ( not ( = ?auto_462690 ?auto_462691 ) ) ( not ( = ?auto_462690 ?auto_462692 ) ) ( not ( = ?auto_462690 ?auto_462693 ) ) ( not ( = ?auto_462690 ?auto_462694 ) ) ( not ( = ?auto_462690 ?auto_462695 ) ) ( not ( = ?auto_462691 ?auto_462692 ) ) ( not ( = ?auto_462691 ?auto_462693 ) ) ( not ( = ?auto_462691 ?auto_462694 ) ) ( not ( = ?auto_462691 ?auto_462695 ) ) ( not ( = ?auto_462692 ?auto_462693 ) ) ( not ( = ?auto_462692 ?auto_462694 ) ) ( not ( = ?auto_462692 ?auto_462695 ) ) ( not ( = ?auto_462693 ?auto_462694 ) ) ( not ( = ?auto_462693 ?auto_462695 ) ) ( not ( = ?auto_462694 ?auto_462695 ) ) ( ON ?auto_462693 ?auto_462694 ) ( ON ?auto_462692 ?auto_462693 ) ( CLEAR ?auto_462690 ) ( ON ?auto_462691 ?auto_462692 ) ( CLEAR ?auto_462691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_462682 ?auto_462683 ?auto_462684 ?auto_462685 ?auto_462686 ?auto_462687 ?auto_462688 ?auto_462689 ?auto_462690 ?auto_462691 )
      ( MAKE-13PILE ?auto_462682 ?auto_462683 ?auto_462684 ?auto_462685 ?auto_462686 ?auto_462687 ?auto_462688 ?auto_462689 ?auto_462690 ?auto_462691 ?auto_462692 ?auto_462693 ?auto_462694 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462709 - BLOCK
      ?auto_462710 - BLOCK
      ?auto_462711 - BLOCK
      ?auto_462712 - BLOCK
      ?auto_462713 - BLOCK
      ?auto_462714 - BLOCK
      ?auto_462715 - BLOCK
      ?auto_462716 - BLOCK
      ?auto_462717 - BLOCK
      ?auto_462718 - BLOCK
      ?auto_462719 - BLOCK
      ?auto_462720 - BLOCK
      ?auto_462721 - BLOCK
    )
    :vars
    (
      ?auto_462722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462721 ?auto_462722 ) ( ON-TABLE ?auto_462709 ) ( ON ?auto_462710 ?auto_462709 ) ( ON ?auto_462711 ?auto_462710 ) ( ON ?auto_462712 ?auto_462711 ) ( ON ?auto_462713 ?auto_462712 ) ( ON ?auto_462714 ?auto_462713 ) ( ON ?auto_462715 ?auto_462714 ) ( ON ?auto_462716 ?auto_462715 ) ( not ( = ?auto_462709 ?auto_462710 ) ) ( not ( = ?auto_462709 ?auto_462711 ) ) ( not ( = ?auto_462709 ?auto_462712 ) ) ( not ( = ?auto_462709 ?auto_462713 ) ) ( not ( = ?auto_462709 ?auto_462714 ) ) ( not ( = ?auto_462709 ?auto_462715 ) ) ( not ( = ?auto_462709 ?auto_462716 ) ) ( not ( = ?auto_462709 ?auto_462717 ) ) ( not ( = ?auto_462709 ?auto_462718 ) ) ( not ( = ?auto_462709 ?auto_462719 ) ) ( not ( = ?auto_462709 ?auto_462720 ) ) ( not ( = ?auto_462709 ?auto_462721 ) ) ( not ( = ?auto_462709 ?auto_462722 ) ) ( not ( = ?auto_462710 ?auto_462711 ) ) ( not ( = ?auto_462710 ?auto_462712 ) ) ( not ( = ?auto_462710 ?auto_462713 ) ) ( not ( = ?auto_462710 ?auto_462714 ) ) ( not ( = ?auto_462710 ?auto_462715 ) ) ( not ( = ?auto_462710 ?auto_462716 ) ) ( not ( = ?auto_462710 ?auto_462717 ) ) ( not ( = ?auto_462710 ?auto_462718 ) ) ( not ( = ?auto_462710 ?auto_462719 ) ) ( not ( = ?auto_462710 ?auto_462720 ) ) ( not ( = ?auto_462710 ?auto_462721 ) ) ( not ( = ?auto_462710 ?auto_462722 ) ) ( not ( = ?auto_462711 ?auto_462712 ) ) ( not ( = ?auto_462711 ?auto_462713 ) ) ( not ( = ?auto_462711 ?auto_462714 ) ) ( not ( = ?auto_462711 ?auto_462715 ) ) ( not ( = ?auto_462711 ?auto_462716 ) ) ( not ( = ?auto_462711 ?auto_462717 ) ) ( not ( = ?auto_462711 ?auto_462718 ) ) ( not ( = ?auto_462711 ?auto_462719 ) ) ( not ( = ?auto_462711 ?auto_462720 ) ) ( not ( = ?auto_462711 ?auto_462721 ) ) ( not ( = ?auto_462711 ?auto_462722 ) ) ( not ( = ?auto_462712 ?auto_462713 ) ) ( not ( = ?auto_462712 ?auto_462714 ) ) ( not ( = ?auto_462712 ?auto_462715 ) ) ( not ( = ?auto_462712 ?auto_462716 ) ) ( not ( = ?auto_462712 ?auto_462717 ) ) ( not ( = ?auto_462712 ?auto_462718 ) ) ( not ( = ?auto_462712 ?auto_462719 ) ) ( not ( = ?auto_462712 ?auto_462720 ) ) ( not ( = ?auto_462712 ?auto_462721 ) ) ( not ( = ?auto_462712 ?auto_462722 ) ) ( not ( = ?auto_462713 ?auto_462714 ) ) ( not ( = ?auto_462713 ?auto_462715 ) ) ( not ( = ?auto_462713 ?auto_462716 ) ) ( not ( = ?auto_462713 ?auto_462717 ) ) ( not ( = ?auto_462713 ?auto_462718 ) ) ( not ( = ?auto_462713 ?auto_462719 ) ) ( not ( = ?auto_462713 ?auto_462720 ) ) ( not ( = ?auto_462713 ?auto_462721 ) ) ( not ( = ?auto_462713 ?auto_462722 ) ) ( not ( = ?auto_462714 ?auto_462715 ) ) ( not ( = ?auto_462714 ?auto_462716 ) ) ( not ( = ?auto_462714 ?auto_462717 ) ) ( not ( = ?auto_462714 ?auto_462718 ) ) ( not ( = ?auto_462714 ?auto_462719 ) ) ( not ( = ?auto_462714 ?auto_462720 ) ) ( not ( = ?auto_462714 ?auto_462721 ) ) ( not ( = ?auto_462714 ?auto_462722 ) ) ( not ( = ?auto_462715 ?auto_462716 ) ) ( not ( = ?auto_462715 ?auto_462717 ) ) ( not ( = ?auto_462715 ?auto_462718 ) ) ( not ( = ?auto_462715 ?auto_462719 ) ) ( not ( = ?auto_462715 ?auto_462720 ) ) ( not ( = ?auto_462715 ?auto_462721 ) ) ( not ( = ?auto_462715 ?auto_462722 ) ) ( not ( = ?auto_462716 ?auto_462717 ) ) ( not ( = ?auto_462716 ?auto_462718 ) ) ( not ( = ?auto_462716 ?auto_462719 ) ) ( not ( = ?auto_462716 ?auto_462720 ) ) ( not ( = ?auto_462716 ?auto_462721 ) ) ( not ( = ?auto_462716 ?auto_462722 ) ) ( not ( = ?auto_462717 ?auto_462718 ) ) ( not ( = ?auto_462717 ?auto_462719 ) ) ( not ( = ?auto_462717 ?auto_462720 ) ) ( not ( = ?auto_462717 ?auto_462721 ) ) ( not ( = ?auto_462717 ?auto_462722 ) ) ( not ( = ?auto_462718 ?auto_462719 ) ) ( not ( = ?auto_462718 ?auto_462720 ) ) ( not ( = ?auto_462718 ?auto_462721 ) ) ( not ( = ?auto_462718 ?auto_462722 ) ) ( not ( = ?auto_462719 ?auto_462720 ) ) ( not ( = ?auto_462719 ?auto_462721 ) ) ( not ( = ?auto_462719 ?auto_462722 ) ) ( not ( = ?auto_462720 ?auto_462721 ) ) ( not ( = ?auto_462720 ?auto_462722 ) ) ( not ( = ?auto_462721 ?auto_462722 ) ) ( ON ?auto_462720 ?auto_462721 ) ( ON ?auto_462719 ?auto_462720 ) ( ON ?auto_462718 ?auto_462719 ) ( CLEAR ?auto_462716 ) ( ON ?auto_462717 ?auto_462718 ) ( CLEAR ?auto_462717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_462709 ?auto_462710 ?auto_462711 ?auto_462712 ?auto_462713 ?auto_462714 ?auto_462715 ?auto_462716 ?auto_462717 )
      ( MAKE-13PILE ?auto_462709 ?auto_462710 ?auto_462711 ?auto_462712 ?auto_462713 ?auto_462714 ?auto_462715 ?auto_462716 ?auto_462717 ?auto_462718 ?auto_462719 ?auto_462720 ?auto_462721 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462736 - BLOCK
      ?auto_462737 - BLOCK
      ?auto_462738 - BLOCK
      ?auto_462739 - BLOCK
      ?auto_462740 - BLOCK
      ?auto_462741 - BLOCK
      ?auto_462742 - BLOCK
      ?auto_462743 - BLOCK
      ?auto_462744 - BLOCK
      ?auto_462745 - BLOCK
      ?auto_462746 - BLOCK
      ?auto_462747 - BLOCK
      ?auto_462748 - BLOCK
    )
    :vars
    (
      ?auto_462749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462748 ?auto_462749 ) ( ON-TABLE ?auto_462736 ) ( ON ?auto_462737 ?auto_462736 ) ( ON ?auto_462738 ?auto_462737 ) ( ON ?auto_462739 ?auto_462738 ) ( ON ?auto_462740 ?auto_462739 ) ( ON ?auto_462741 ?auto_462740 ) ( ON ?auto_462742 ?auto_462741 ) ( ON ?auto_462743 ?auto_462742 ) ( not ( = ?auto_462736 ?auto_462737 ) ) ( not ( = ?auto_462736 ?auto_462738 ) ) ( not ( = ?auto_462736 ?auto_462739 ) ) ( not ( = ?auto_462736 ?auto_462740 ) ) ( not ( = ?auto_462736 ?auto_462741 ) ) ( not ( = ?auto_462736 ?auto_462742 ) ) ( not ( = ?auto_462736 ?auto_462743 ) ) ( not ( = ?auto_462736 ?auto_462744 ) ) ( not ( = ?auto_462736 ?auto_462745 ) ) ( not ( = ?auto_462736 ?auto_462746 ) ) ( not ( = ?auto_462736 ?auto_462747 ) ) ( not ( = ?auto_462736 ?auto_462748 ) ) ( not ( = ?auto_462736 ?auto_462749 ) ) ( not ( = ?auto_462737 ?auto_462738 ) ) ( not ( = ?auto_462737 ?auto_462739 ) ) ( not ( = ?auto_462737 ?auto_462740 ) ) ( not ( = ?auto_462737 ?auto_462741 ) ) ( not ( = ?auto_462737 ?auto_462742 ) ) ( not ( = ?auto_462737 ?auto_462743 ) ) ( not ( = ?auto_462737 ?auto_462744 ) ) ( not ( = ?auto_462737 ?auto_462745 ) ) ( not ( = ?auto_462737 ?auto_462746 ) ) ( not ( = ?auto_462737 ?auto_462747 ) ) ( not ( = ?auto_462737 ?auto_462748 ) ) ( not ( = ?auto_462737 ?auto_462749 ) ) ( not ( = ?auto_462738 ?auto_462739 ) ) ( not ( = ?auto_462738 ?auto_462740 ) ) ( not ( = ?auto_462738 ?auto_462741 ) ) ( not ( = ?auto_462738 ?auto_462742 ) ) ( not ( = ?auto_462738 ?auto_462743 ) ) ( not ( = ?auto_462738 ?auto_462744 ) ) ( not ( = ?auto_462738 ?auto_462745 ) ) ( not ( = ?auto_462738 ?auto_462746 ) ) ( not ( = ?auto_462738 ?auto_462747 ) ) ( not ( = ?auto_462738 ?auto_462748 ) ) ( not ( = ?auto_462738 ?auto_462749 ) ) ( not ( = ?auto_462739 ?auto_462740 ) ) ( not ( = ?auto_462739 ?auto_462741 ) ) ( not ( = ?auto_462739 ?auto_462742 ) ) ( not ( = ?auto_462739 ?auto_462743 ) ) ( not ( = ?auto_462739 ?auto_462744 ) ) ( not ( = ?auto_462739 ?auto_462745 ) ) ( not ( = ?auto_462739 ?auto_462746 ) ) ( not ( = ?auto_462739 ?auto_462747 ) ) ( not ( = ?auto_462739 ?auto_462748 ) ) ( not ( = ?auto_462739 ?auto_462749 ) ) ( not ( = ?auto_462740 ?auto_462741 ) ) ( not ( = ?auto_462740 ?auto_462742 ) ) ( not ( = ?auto_462740 ?auto_462743 ) ) ( not ( = ?auto_462740 ?auto_462744 ) ) ( not ( = ?auto_462740 ?auto_462745 ) ) ( not ( = ?auto_462740 ?auto_462746 ) ) ( not ( = ?auto_462740 ?auto_462747 ) ) ( not ( = ?auto_462740 ?auto_462748 ) ) ( not ( = ?auto_462740 ?auto_462749 ) ) ( not ( = ?auto_462741 ?auto_462742 ) ) ( not ( = ?auto_462741 ?auto_462743 ) ) ( not ( = ?auto_462741 ?auto_462744 ) ) ( not ( = ?auto_462741 ?auto_462745 ) ) ( not ( = ?auto_462741 ?auto_462746 ) ) ( not ( = ?auto_462741 ?auto_462747 ) ) ( not ( = ?auto_462741 ?auto_462748 ) ) ( not ( = ?auto_462741 ?auto_462749 ) ) ( not ( = ?auto_462742 ?auto_462743 ) ) ( not ( = ?auto_462742 ?auto_462744 ) ) ( not ( = ?auto_462742 ?auto_462745 ) ) ( not ( = ?auto_462742 ?auto_462746 ) ) ( not ( = ?auto_462742 ?auto_462747 ) ) ( not ( = ?auto_462742 ?auto_462748 ) ) ( not ( = ?auto_462742 ?auto_462749 ) ) ( not ( = ?auto_462743 ?auto_462744 ) ) ( not ( = ?auto_462743 ?auto_462745 ) ) ( not ( = ?auto_462743 ?auto_462746 ) ) ( not ( = ?auto_462743 ?auto_462747 ) ) ( not ( = ?auto_462743 ?auto_462748 ) ) ( not ( = ?auto_462743 ?auto_462749 ) ) ( not ( = ?auto_462744 ?auto_462745 ) ) ( not ( = ?auto_462744 ?auto_462746 ) ) ( not ( = ?auto_462744 ?auto_462747 ) ) ( not ( = ?auto_462744 ?auto_462748 ) ) ( not ( = ?auto_462744 ?auto_462749 ) ) ( not ( = ?auto_462745 ?auto_462746 ) ) ( not ( = ?auto_462745 ?auto_462747 ) ) ( not ( = ?auto_462745 ?auto_462748 ) ) ( not ( = ?auto_462745 ?auto_462749 ) ) ( not ( = ?auto_462746 ?auto_462747 ) ) ( not ( = ?auto_462746 ?auto_462748 ) ) ( not ( = ?auto_462746 ?auto_462749 ) ) ( not ( = ?auto_462747 ?auto_462748 ) ) ( not ( = ?auto_462747 ?auto_462749 ) ) ( not ( = ?auto_462748 ?auto_462749 ) ) ( ON ?auto_462747 ?auto_462748 ) ( ON ?auto_462746 ?auto_462747 ) ( ON ?auto_462745 ?auto_462746 ) ( CLEAR ?auto_462743 ) ( ON ?auto_462744 ?auto_462745 ) ( CLEAR ?auto_462744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_462736 ?auto_462737 ?auto_462738 ?auto_462739 ?auto_462740 ?auto_462741 ?auto_462742 ?auto_462743 ?auto_462744 )
      ( MAKE-13PILE ?auto_462736 ?auto_462737 ?auto_462738 ?auto_462739 ?auto_462740 ?auto_462741 ?auto_462742 ?auto_462743 ?auto_462744 ?auto_462745 ?auto_462746 ?auto_462747 ?auto_462748 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462763 - BLOCK
      ?auto_462764 - BLOCK
      ?auto_462765 - BLOCK
      ?auto_462766 - BLOCK
      ?auto_462767 - BLOCK
      ?auto_462768 - BLOCK
      ?auto_462769 - BLOCK
      ?auto_462770 - BLOCK
      ?auto_462771 - BLOCK
      ?auto_462772 - BLOCK
      ?auto_462773 - BLOCK
      ?auto_462774 - BLOCK
      ?auto_462775 - BLOCK
    )
    :vars
    (
      ?auto_462776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462775 ?auto_462776 ) ( ON-TABLE ?auto_462763 ) ( ON ?auto_462764 ?auto_462763 ) ( ON ?auto_462765 ?auto_462764 ) ( ON ?auto_462766 ?auto_462765 ) ( ON ?auto_462767 ?auto_462766 ) ( ON ?auto_462768 ?auto_462767 ) ( ON ?auto_462769 ?auto_462768 ) ( not ( = ?auto_462763 ?auto_462764 ) ) ( not ( = ?auto_462763 ?auto_462765 ) ) ( not ( = ?auto_462763 ?auto_462766 ) ) ( not ( = ?auto_462763 ?auto_462767 ) ) ( not ( = ?auto_462763 ?auto_462768 ) ) ( not ( = ?auto_462763 ?auto_462769 ) ) ( not ( = ?auto_462763 ?auto_462770 ) ) ( not ( = ?auto_462763 ?auto_462771 ) ) ( not ( = ?auto_462763 ?auto_462772 ) ) ( not ( = ?auto_462763 ?auto_462773 ) ) ( not ( = ?auto_462763 ?auto_462774 ) ) ( not ( = ?auto_462763 ?auto_462775 ) ) ( not ( = ?auto_462763 ?auto_462776 ) ) ( not ( = ?auto_462764 ?auto_462765 ) ) ( not ( = ?auto_462764 ?auto_462766 ) ) ( not ( = ?auto_462764 ?auto_462767 ) ) ( not ( = ?auto_462764 ?auto_462768 ) ) ( not ( = ?auto_462764 ?auto_462769 ) ) ( not ( = ?auto_462764 ?auto_462770 ) ) ( not ( = ?auto_462764 ?auto_462771 ) ) ( not ( = ?auto_462764 ?auto_462772 ) ) ( not ( = ?auto_462764 ?auto_462773 ) ) ( not ( = ?auto_462764 ?auto_462774 ) ) ( not ( = ?auto_462764 ?auto_462775 ) ) ( not ( = ?auto_462764 ?auto_462776 ) ) ( not ( = ?auto_462765 ?auto_462766 ) ) ( not ( = ?auto_462765 ?auto_462767 ) ) ( not ( = ?auto_462765 ?auto_462768 ) ) ( not ( = ?auto_462765 ?auto_462769 ) ) ( not ( = ?auto_462765 ?auto_462770 ) ) ( not ( = ?auto_462765 ?auto_462771 ) ) ( not ( = ?auto_462765 ?auto_462772 ) ) ( not ( = ?auto_462765 ?auto_462773 ) ) ( not ( = ?auto_462765 ?auto_462774 ) ) ( not ( = ?auto_462765 ?auto_462775 ) ) ( not ( = ?auto_462765 ?auto_462776 ) ) ( not ( = ?auto_462766 ?auto_462767 ) ) ( not ( = ?auto_462766 ?auto_462768 ) ) ( not ( = ?auto_462766 ?auto_462769 ) ) ( not ( = ?auto_462766 ?auto_462770 ) ) ( not ( = ?auto_462766 ?auto_462771 ) ) ( not ( = ?auto_462766 ?auto_462772 ) ) ( not ( = ?auto_462766 ?auto_462773 ) ) ( not ( = ?auto_462766 ?auto_462774 ) ) ( not ( = ?auto_462766 ?auto_462775 ) ) ( not ( = ?auto_462766 ?auto_462776 ) ) ( not ( = ?auto_462767 ?auto_462768 ) ) ( not ( = ?auto_462767 ?auto_462769 ) ) ( not ( = ?auto_462767 ?auto_462770 ) ) ( not ( = ?auto_462767 ?auto_462771 ) ) ( not ( = ?auto_462767 ?auto_462772 ) ) ( not ( = ?auto_462767 ?auto_462773 ) ) ( not ( = ?auto_462767 ?auto_462774 ) ) ( not ( = ?auto_462767 ?auto_462775 ) ) ( not ( = ?auto_462767 ?auto_462776 ) ) ( not ( = ?auto_462768 ?auto_462769 ) ) ( not ( = ?auto_462768 ?auto_462770 ) ) ( not ( = ?auto_462768 ?auto_462771 ) ) ( not ( = ?auto_462768 ?auto_462772 ) ) ( not ( = ?auto_462768 ?auto_462773 ) ) ( not ( = ?auto_462768 ?auto_462774 ) ) ( not ( = ?auto_462768 ?auto_462775 ) ) ( not ( = ?auto_462768 ?auto_462776 ) ) ( not ( = ?auto_462769 ?auto_462770 ) ) ( not ( = ?auto_462769 ?auto_462771 ) ) ( not ( = ?auto_462769 ?auto_462772 ) ) ( not ( = ?auto_462769 ?auto_462773 ) ) ( not ( = ?auto_462769 ?auto_462774 ) ) ( not ( = ?auto_462769 ?auto_462775 ) ) ( not ( = ?auto_462769 ?auto_462776 ) ) ( not ( = ?auto_462770 ?auto_462771 ) ) ( not ( = ?auto_462770 ?auto_462772 ) ) ( not ( = ?auto_462770 ?auto_462773 ) ) ( not ( = ?auto_462770 ?auto_462774 ) ) ( not ( = ?auto_462770 ?auto_462775 ) ) ( not ( = ?auto_462770 ?auto_462776 ) ) ( not ( = ?auto_462771 ?auto_462772 ) ) ( not ( = ?auto_462771 ?auto_462773 ) ) ( not ( = ?auto_462771 ?auto_462774 ) ) ( not ( = ?auto_462771 ?auto_462775 ) ) ( not ( = ?auto_462771 ?auto_462776 ) ) ( not ( = ?auto_462772 ?auto_462773 ) ) ( not ( = ?auto_462772 ?auto_462774 ) ) ( not ( = ?auto_462772 ?auto_462775 ) ) ( not ( = ?auto_462772 ?auto_462776 ) ) ( not ( = ?auto_462773 ?auto_462774 ) ) ( not ( = ?auto_462773 ?auto_462775 ) ) ( not ( = ?auto_462773 ?auto_462776 ) ) ( not ( = ?auto_462774 ?auto_462775 ) ) ( not ( = ?auto_462774 ?auto_462776 ) ) ( not ( = ?auto_462775 ?auto_462776 ) ) ( ON ?auto_462774 ?auto_462775 ) ( ON ?auto_462773 ?auto_462774 ) ( ON ?auto_462772 ?auto_462773 ) ( ON ?auto_462771 ?auto_462772 ) ( CLEAR ?auto_462769 ) ( ON ?auto_462770 ?auto_462771 ) ( CLEAR ?auto_462770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_462763 ?auto_462764 ?auto_462765 ?auto_462766 ?auto_462767 ?auto_462768 ?auto_462769 ?auto_462770 )
      ( MAKE-13PILE ?auto_462763 ?auto_462764 ?auto_462765 ?auto_462766 ?auto_462767 ?auto_462768 ?auto_462769 ?auto_462770 ?auto_462771 ?auto_462772 ?auto_462773 ?auto_462774 ?auto_462775 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462790 - BLOCK
      ?auto_462791 - BLOCK
      ?auto_462792 - BLOCK
      ?auto_462793 - BLOCK
      ?auto_462794 - BLOCK
      ?auto_462795 - BLOCK
      ?auto_462796 - BLOCK
      ?auto_462797 - BLOCK
      ?auto_462798 - BLOCK
      ?auto_462799 - BLOCK
      ?auto_462800 - BLOCK
      ?auto_462801 - BLOCK
      ?auto_462802 - BLOCK
    )
    :vars
    (
      ?auto_462803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462802 ?auto_462803 ) ( ON-TABLE ?auto_462790 ) ( ON ?auto_462791 ?auto_462790 ) ( ON ?auto_462792 ?auto_462791 ) ( ON ?auto_462793 ?auto_462792 ) ( ON ?auto_462794 ?auto_462793 ) ( ON ?auto_462795 ?auto_462794 ) ( ON ?auto_462796 ?auto_462795 ) ( not ( = ?auto_462790 ?auto_462791 ) ) ( not ( = ?auto_462790 ?auto_462792 ) ) ( not ( = ?auto_462790 ?auto_462793 ) ) ( not ( = ?auto_462790 ?auto_462794 ) ) ( not ( = ?auto_462790 ?auto_462795 ) ) ( not ( = ?auto_462790 ?auto_462796 ) ) ( not ( = ?auto_462790 ?auto_462797 ) ) ( not ( = ?auto_462790 ?auto_462798 ) ) ( not ( = ?auto_462790 ?auto_462799 ) ) ( not ( = ?auto_462790 ?auto_462800 ) ) ( not ( = ?auto_462790 ?auto_462801 ) ) ( not ( = ?auto_462790 ?auto_462802 ) ) ( not ( = ?auto_462790 ?auto_462803 ) ) ( not ( = ?auto_462791 ?auto_462792 ) ) ( not ( = ?auto_462791 ?auto_462793 ) ) ( not ( = ?auto_462791 ?auto_462794 ) ) ( not ( = ?auto_462791 ?auto_462795 ) ) ( not ( = ?auto_462791 ?auto_462796 ) ) ( not ( = ?auto_462791 ?auto_462797 ) ) ( not ( = ?auto_462791 ?auto_462798 ) ) ( not ( = ?auto_462791 ?auto_462799 ) ) ( not ( = ?auto_462791 ?auto_462800 ) ) ( not ( = ?auto_462791 ?auto_462801 ) ) ( not ( = ?auto_462791 ?auto_462802 ) ) ( not ( = ?auto_462791 ?auto_462803 ) ) ( not ( = ?auto_462792 ?auto_462793 ) ) ( not ( = ?auto_462792 ?auto_462794 ) ) ( not ( = ?auto_462792 ?auto_462795 ) ) ( not ( = ?auto_462792 ?auto_462796 ) ) ( not ( = ?auto_462792 ?auto_462797 ) ) ( not ( = ?auto_462792 ?auto_462798 ) ) ( not ( = ?auto_462792 ?auto_462799 ) ) ( not ( = ?auto_462792 ?auto_462800 ) ) ( not ( = ?auto_462792 ?auto_462801 ) ) ( not ( = ?auto_462792 ?auto_462802 ) ) ( not ( = ?auto_462792 ?auto_462803 ) ) ( not ( = ?auto_462793 ?auto_462794 ) ) ( not ( = ?auto_462793 ?auto_462795 ) ) ( not ( = ?auto_462793 ?auto_462796 ) ) ( not ( = ?auto_462793 ?auto_462797 ) ) ( not ( = ?auto_462793 ?auto_462798 ) ) ( not ( = ?auto_462793 ?auto_462799 ) ) ( not ( = ?auto_462793 ?auto_462800 ) ) ( not ( = ?auto_462793 ?auto_462801 ) ) ( not ( = ?auto_462793 ?auto_462802 ) ) ( not ( = ?auto_462793 ?auto_462803 ) ) ( not ( = ?auto_462794 ?auto_462795 ) ) ( not ( = ?auto_462794 ?auto_462796 ) ) ( not ( = ?auto_462794 ?auto_462797 ) ) ( not ( = ?auto_462794 ?auto_462798 ) ) ( not ( = ?auto_462794 ?auto_462799 ) ) ( not ( = ?auto_462794 ?auto_462800 ) ) ( not ( = ?auto_462794 ?auto_462801 ) ) ( not ( = ?auto_462794 ?auto_462802 ) ) ( not ( = ?auto_462794 ?auto_462803 ) ) ( not ( = ?auto_462795 ?auto_462796 ) ) ( not ( = ?auto_462795 ?auto_462797 ) ) ( not ( = ?auto_462795 ?auto_462798 ) ) ( not ( = ?auto_462795 ?auto_462799 ) ) ( not ( = ?auto_462795 ?auto_462800 ) ) ( not ( = ?auto_462795 ?auto_462801 ) ) ( not ( = ?auto_462795 ?auto_462802 ) ) ( not ( = ?auto_462795 ?auto_462803 ) ) ( not ( = ?auto_462796 ?auto_462797 ) ) ( not ( = ?auto_462796 ?auto_462798 ) ) ( not ( = ?auto_462796 ?auto_462799 ) ) ( not ( = ?auto_462796 ?auto_462800 ) ) ( not ( = ?auto_462796 ?auto_462801 ) ) ( not ( = ?auto_462796 ?auto_462802 ) ) ( not ( = ?auto_462796 ?auto_462803 ) ) ( not ( = ?auto_462797 ?auto_462798 ) ) ( not ( = ?auto_462797 ?auto_462799 ) ) ( not ( = ?auto_462797 ?auto_462800 ) ) ( not ( = ?auto_462797 ?auto_462801 ) ) ( not ( = ?auto_462797 ?auto_462802 ) ) ( not ( = ?auto_462797 ?auto_462803 ) ) ( not ( = ?auto_462798 ?auto_462799 ) ) ( not ( = ?auto_462798 ?auto_462800 ) ) ( not ( = ?auto_462798 ?auto_462801 ) ) ( not ( = ?auto_462798 ?auto_462802 ) ) ( not ( = ?auto_462798 ?auto_462803 ) ) ( not ( = ?auto_462799 ?auto_462800 ) ) ( not ( = ?auto_462799 ?auto_462801 ) ) ( not ( = ?auto_462799 ?auto_462802 ) ) ( not ( = ?auto_462799 ?auto_462803 ) ) ( not ( = ?auto_462800 ?auto_462801 ) ) ( not ( = ?auto_462800 ?auto_462802 ) ) ( not ( = ?auto_462800 ?auto_462803 ) ) ( not ( = ?auto_462801 ?auto_462802 ) ) ( not ( = ?auto_462801 ?auto_462803 ) ) ( not ( = ?auto_462802 ?auto_462803 ) ) ( ON ?auto_462801 ?auto_462802 ) ( ON ?auto_462800 ?auto_462801 ) ( ON ?auto_462799 ?auto_462800 ) ( ON ?auto_462798 ?auto_462799 ) ( CLEAR ?auto_462796 ) ( ON ?auto_462797 ?auto_462798 ) ( CLEAR ?auto_462797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_462790 ?auto_462791 ?auto_462792 ?auto_462793 ?auto_462794 ?auto_462795 ?auto_462796 ?auto_462797 )
      ( MAKE-13PILE ?auto_462790 ?auto_462791 ?auto_462792 ?auto_462793 ?auto_462794 ?auto_462795 ?auto_462796 ?auto_462797 ?auto_462798 ?auto_462799 ?auto_462800 ?auto_462801 ?auto_462802 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462817 - BLOCK
      ?auto_462818 - BLOCK
      ?auto_462819 - BLOCK
      ?auto_462820 - BLOCK
      ?auto_462821 - BLOCK
      ?auto_462822 - BLOCK
      ?auto_462823 - BLOCK
      ?auto_462824 - BLOCK
      ?auto_462825 - BLOCK
      ?auto_462826 - BLOCK
      ?auto_462827 - BLOCK
      ?auto_462828 - BLOCK
      ?auto_462829 - BLOCK
    )
    :vars
    (
      ?auto_462830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462829 ?auto_462830 ) ( ON-TABLE ?auto_462817 ) ( ON ?auto_462818 ?auto_462817 ) ( ON ?auto_462819 ?auto_462818 ) ( ON ?auto_462820 ?auto_462819 ) ( ON ?auto_462821 ?auto_462820 ) ( ON ?auto_462822 ?auto_462821 ) ( not ( = ?auto_462817 ?auto_462818 ) ) ( not ( = ?auto_462817 ?auto_462819 ) ) ( not ( = ?auto_462817 ?auto_462820 ) ) ( not ( = ?auto_462817 ?auto_462821 ) ) ( not ( = ?auto_462817 ?auto_462822 ) ) ( not ( = ?auto_462817 ?auto_462823 ) ) ( not ( = ?auto_462817 ?auto_462824 ) ) ( not ( = ?auto_462817 ?auto_462825 ) ) ( not ( = ?auto_462817 ?auto_462826 ) ) ( not ( = ?auto_462817 ?auto_462827 ) ) ( not ( = ?auto_462817 ?auto_462828 ) ) ( not ( = ?auto_462817 ?auto_462829 ) ) ( not ( = ?auto_462817 ?auto_462830 ) ) ( not ( = ?auto_462818 ?auto_462819 ) ) ( not ( = ?auto_462818 ?auto_462820 ) ) ( not ( = ?auto_462818 ?auto_462821 ) ) ( not ( = ?auto_462818 ?auto_462822 ) ) ( not ( = ?auto_462818 ?auto_462823 ) ) ( not ( = ?auto_462818 ?auto_462824 ) ) ( not ( = ?auto_462818 ?auto_462825 ) ) ( not ( = ?auto_462818 ?auto_462826 ) ) ( not ( = ?auto_462818 ?auto_462827 ) ) ( not ( = ?auto_462818 ?auto_462828 ) ) ( not ( = ?auto_462818 ?auto_462829 ) ) ( not ( = ?auto_462818 ?auto_462830 ) ) ( not ( = ?auto_462819 ?auto_462820 ) ) ( not ( = ?auto_462819 ?auto_462821 ) ) ( not ( = ?auto_462819 ?auto_462822 ) ) ( not ( = ?auto_462819 ?auto_462823 ) ) ( not ( = ?auto_462819 ?auto_462824 ) ) ( not ( = ?auto_462819 ?auto_462825 ) ) ( not ( = ?auto_462819 ?auto_462826 ) ) ( not ( = ?auto_462819 ?auto_462827 ) ) ( not ( = ?auto_462819 ?auto_462828 ) ) ( not ( = ?auto_462819 ?auto_462829 ) ) ( not ( = ?auto_462819 ?auto_462830 ) ) ( not ( = ?auto_462820 ?auto_462821 ) ) ( not ( = ?auto_462820 ?auto_462822 ) ) ( not ( = ?auto_462820 ?auto_462823 ) ) ( not ( = ?auto_462820 ?auto_462824 ) ) ( not ( = ?auto_462820 ?auto_462825 ) ) ( not ( = ?auto_462820 ?auto_462826 ) ) ( not ( = ?auto_462820 ?auto_462827 ) ) ( not ( = ?auto_462820 ?auto_462828 ) ) ( not ( = ?auto_462820 ?auto_462829 ) ) ( not ( = ?auto_462820 ?auto_462830 ) ) ( not ( = ?auto_462821 ?auto_462822 ) ) ( not ( = ?auto_462821 ?auto_462823 ) ) ( not ( = ?auto_462821 ?auto_462824 ) ) ( not ( = ?auto_462821 ?auto_462825 ) ) ( not ( = ?auto_462821 ?auto_462826 ) ) ( not ( = ?auto_462821 ?auto_462827 ) ) ( not ( = ?auto_462821 ?auto_462828 ) ) ( not ( = ?auto_462821 ?auto_462829 ) ) ( not ( = ?auto_462821 ?auto_462830 ) ) ( not ( = ?auto_462822 ?auto_462823 ) ) ( not ( = ?auto_462822 ?auto_462824 ) ) ( not ( = ?auto_462822 ?auto_462825 ) ) ( not ( = ?auto_462822 ?auto_462826 ) ) ( not ( = ?auto_462822 ?auto_462827 ) ) ( not ( = ?auto_462822 ?auto_462828 ) ) ( not ( = ?auto_462822 ?auto_462829 ) ) ( not ( = ?auto_462822 ?auto_462830 ) ) ( not ( = ?auto_462823 ?auto_462824 ) ) ( not ( = ?auto_462823 ?auto_462825 ) ) ( not ( = ?auto_462823 ?auto_462826 ) ) ( not ( = ?auto_462823 ?auto_462827 ) ) ( not ( = ?auto_462823 ?auto_462828 ) ) ( not ( = ?auto_462823 ?auto_462829 ) ) ( not ( = ?auto_462823 ?auto_462830 ) ) ( not ( = ?auto_462824 ?auto_462825 ) ) ( not ( = ?auto_462824 ?auto_462826 ) ) ( not ( = ?auto_462824 ?auto_462827 ) ) ( not ( = ?auto_462824 ?auto_462828 ) ) ( not ( = ?auto_462824 ?auto_462829 ) ) ( not ( = ?auto_462824 ?auto_462830 ) ) ( not ( = ?auto_462825 ?auto_462826 ) ) ( not ( = ?auto_462825 ?auto_462827 ) ) ( not ( = ?auto_462825 ?auto_462828 ) ) ( not ( = ?auto_462825 ?auto_462829 ) ) ( not ( = ?auto_462825 ?auto_462830 ) ) ( not ( = ?auto_462826 ?auto_462827 ) ) ( not ( = ?auto_462826 ?auto_462828 ) ) ( not ( = ?auto_462826 ?auto_462829 ) ) ( not ( = ?auto_462826 ?auto_462830 ) ) ( not ( = ?auto_462827 ?auto_462828 ) ) ( not ( = ?auto_462827 ?auto_462829 ) ) ( not ( = ?auto_462827 ?auto_462830 ) ) ( not ( = ?auto_462828 ?auto_462829 ) ) ( not ( = ?auto_462828 ?auto_462830 ) ) ( not ( = ?auto_462829 ?auto_462830 ) ) ( ON ?auto_462828 ?auto_462829 ) ( ON ?auto_462827 ?auto_462828 ) ( ON ?auto_462826 ?auto_462827 ) ( ON ?auto_462825 ?auto_462826 ) ( ON ?auto_462824 ?auto_462825 ) ( CLEAR ?auto_462822 ) ( ON ?auto_462823 ?auto_462824 ) ( CLEAR ?auto_462823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_462817 ?auto_462818 ?auto_462819 ?auto_462820 ?auto_462821 ?auto_462822 ?auto_462823 )
      ( MAKE-13PILE ?auto_462817 ?auto_462818 ?auto_462819 ?auto_462820 ?auto_462821 ?auto_462822 ?auto_462823 ?auto_462824 ?auto_462825 ?auto_462826 ?auto_462827 ?auto_462828 ?auto_462829 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462844 - BLOCK
      ?auto_462845 - BLOCK
      ?auto_462846 - BLOCK
      ?auto_462847 - BLOCK
      ?auto_462848 - BLOCK
      ?auto_462849 - BLOCK
      ?auto_462850 - BLOCK
      ?auto_462851 - BLOCK
      ?auto_462852 - BLOCK
      ?auto_462853 - BLOCK
      ?auto_462854 - BLOCK
      ?auto_462855 - BLOCK
      ?auto_462856 - BLOCK
    )
    :vars
    (
      ?auto_462857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462856 ?auto_462857 ) ( ON-TABLE ?auto_462844 ) ( ON ?auto_462845 ?auto_462844 ) ( ON ?auto_462846 ?auto_462845 ) ( ON ?auto_462847 ?auto_462846 ) ( ON ?auto_462848 ?auto_462847 ) ( ON ?auto_462849 ?auto_462848 ) ( not ( = ?auto_462844 ?auto_462845 ) ) ( not ( = ?auto_462844 ?auto_462846 ) ) ( not ( = ?auto_462844 ?auto_462847 ) ) ( not ( = ?auto_462844 ?auto_462848 ) ) ( not ( = ?auto_462844 ?auto_462849 ) ) ( not ( = ?auto_462844 ?auto_462850 ) ) ( not ( = ?auto_462844 ?auto_462851 ) ) ( not ( = ?auto_462844 ?auto_462852 ) ) ( not ( = ?auto_462844 ?auto_462853 ) ) ( not ( = ?auto_462844 ?auto_462854 ) ) ( not ( = ?auto_462844 ?auto_462855 ) ) ( not ( = ?auto_462844 ?auto_462856 ) ) ( not ( = ?auto_462844 ?auto_462857 ) ) ( not ( = ?auto_462845 ?auto_462846 ) ) ( not ( = ?auto_462845 ?auto_462847 ) ) ( not ( = ?auto_462845 ?auto_462848 ) ) ( not ( = ?auto_462845 ?auto_462849 ) ) ( not ( = ?auto_462845 ?auto_462850 ) ) ( not ( = ?auto_462845 ?auto_462851 ) ) ( not ( = ?auto_462845 ?auto_462852 ) ) ( not ( = ?auto_462845 ?auto_462853 ) ) ( not ( = ?auto_462845 ?auto_462854 ) ) ( not ( = ?auto_462845 ?auto_462855 ) ) ( not ( = ?auto_462845 ?auto_462856 ) ) ( not ( = ?auto_462845 ?auto_462857 ) ) ( not ( = ?auto_462846 ?auto_462847 ) ) ( not ( = ?auto_462846 ?auto_462848 ) ) ( not ( = ?auto_462846 ?auto_462849 ) ) ( not ( = ?auto_462846 ?auto_462850 ) ) ( not ( = ?auto_462846 ?auto_462851 ) ) ( not ( = ?auto_462846 ?auto_462852 ) ) ( not ( = ?auto_462846 ?auto_462853 ) ) ( not ( = ?auto_462846 ?auto_462854 ) ) ( not ( = ?auto_462846 ?auto_462855 ) ) ( not ( = ?auto_462846 ?auto_462856 ) ) ( not ( = ?auto_462846 ?auto_462857 ) ) ( not ( = ?auto_462847 ?auto_462848 ) ) ( not ( = ?auto_462847 ?auto_462849 ) ) ( not ( = ?auto_462847 ?auto_462850 ) ) ( not ( = ?auto_462847 ?auto_462851 ) ) ( not ( = ?auto_462847 ?auto_462852 ) ) ( not ( = ?auto_462847 ?auto_462853 ) ) ( not ( = ?auto_462847 ?auto_462854 ) ) ( not ( = ?auto_462847 ?auto_462855 ) ) ( not ( = ?auto_462847 ?auto_462856 ) ) ( not ( = ?auto_462847 ?auto_462857 ) ) ( not ( = ?auto_462848 ?auto_462849 ) ) ( not ( = ?auto_462848 ?auto_462850 ) ) ( not ( = ?auto_462848 ?auto_462851 ) ) ( not ( = ?auto_462848 ?auto_462852 ) ) ( not ( = ?auto_462848 ?auto_462853 ) ) ( not ( = ?auto_462848 ?auto_462854 ) ) ( not ( = ?auto_462848 ?auto_462855 ) ) ( not ( = ?auto_462848 ?auto_462856 ) ) ( not ( = ?auto_462848 ?auto_462857 ) ) ( not ( = ?auto_462849 ?auto_462850 ) ) ( not ( = ?auto_462849 ?auto_462851 ) ) ( not ( = ?auto_462849 ?auto_462852 ) ) ( not ( = ?auto_462849 ?auto_462853 ) ) ( not ( = ?auto_462849 ?auto_462854 ) ) ( not ( = ?auto_462849 ?auto_462855 ) ) ( not ( = ?auto_462849 ?auto_462856 ) ) ( not ( = ?auto_462849 ?auto_462857 ) ) ( not ( = ?auto_462850 ?auto_462851 ) ) ( not ( = ?auto_462850 ?auto_462852 ) ) ( not ( = ?auto_462850 ?auto_462853 ) ) ( not ( = ?auto_462850 ?auto_462854 ) ) ( not ( = ?auto_462850 ?auto_462855 ) ) ( not ( = ?auto_462850 ?auto_462856 ) ) ( not ( = ?auto_462850 ?auto_462857 ) ) ( not ( = ?auto_462851 ?auto_462852 ) ) ( not ( = ?auto_462851 ?auto_462853 ) ) ( not ( = ?auto_462851 ?auto_462854 ) ) ( not ( = ?auto_462851 ?auto_462855 ) ) ( not ( = ?auto_462851 ?auto_462856 ) ) ( not ( = ?auto_462851 ?auto_462857 ) ) ( not ( = ?auto_462852 ?auto_462853 ) ) ( not ( = ?auto_462852 ?auto_462854 ) ) ( not ( = ?auto_462852 ?auto_462855 ) ) ( not ( = ?auto_462852 ?auto_462856 ) ) ( not ( = ?auto_462852 ?auto_462857 ) ) ( not ( = ?auto_462853 ?auto_462854 ) ) ( not ( = ?auto_462853 ?auto_462855 ) ) ( not ( = ?auto_462853 ?auto_462856 ) ) ( not ( = ?auto_462853 ?auto_462857 ) ) ( not ( = ?auto_462854 ?auto_462855 ) ) ( not ( = ?auto_462854 ?auto_462856 ) ) ( not ( = ?auto_462854 ?auto_462857 ) ) ( not ( = ?auto_462855 ?auto_462856 ) ) ( not ( = ?auto_462855 ?auto_462857 ) ) ( not ( = ?auto_462856 ?auto_462857 ) ) ( ON ?auto_462855 ?auto_462856 ) ( ON ?auto_462854 ?auto_462855 ) ( ON ?auto_462853 ?auto_462854 ) ( ON ?auto_462852 ?auto_462853 ) ( ON ?auto_462851 ?auto_462852 ) ( CLEAR ?auto_462849 ) ( ON ?auto_462850 ?auto_462851 ) ( CLEAR ?auto_462850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_462844 ?auto_462845 ?auto_462846 ?auto_462847 ?auto_462848 ?auto_462849 ?auto_462850 )
      ( MAKE-13PILE ?auto_462844 ?auto_462845 ?auto_462846 ?auto_462847 ?auto_462848 ?auto_462849 ?auto_462850 ?auto_462851 ?auto_462852 ?auto_462853 ?auto_462854 ?auto_462855 ?auto_462856 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462871 - BLOCK
      ?auto_462872 - BLOCK
      ?auto_462873 - BLOCK
      ?auto_462874 - BLOCK
      ?auto_462875 - BLOCK
      ?auto_462876 - BLOCK
      ?auto_462877 - BLOCK
      ?auto_462878 - BLOCK
      ?auto_462879 - BLOCK
      ?auto_462880 - BLOCK
      ?auto_462881 - BLOCK
      ?auto_462882 - BLOCK
      ?auto_462883 - BLOCK
    )
    :vars
    (
      ?auto_462884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462883 ?auto_462884 ) ( ON-TABLE ?auto_462871 ) ( ON ?auto_462872 ?auto_462871 ) ( ON ?auto_462873 ?auto_462872 ) ( ON ?auto_462874 ?auto_462873 ) ( ON ?auto_462875 ?auto_462874 ) ( not ( = ?auto_462871 ?auto_462872 ) ) ( not ( = ?auto_462871 ?auto_462873 ) ) ( not ( = ?auto_462871 ?auto_462874 ) ) ( not ( = ?auto_462871 ?auto_462875 ) ) ( not ( = ?auto_462871 ?auto_462876 ) ) ( not ( = ?auto_462871 ?auto_462877 ) ) ( not ( = ?auto_462871 ?auto_462878 ) ) ( not ( = ?auto_462871 ?auto_462879 ) ) ( not ( = ?auto_462871 ?auto_462880 ) ) ( not ( = ?auto_462871 ?auto_462881 ) ) ( not ( = ?auto_462871 ?auto_462882 ) ) ( not ( = ?auto_462871 ?auto_462883 ) ) ( not ( = ?auto_462871 ?auto_462884 ) ) ( not ( = ?auto_462872 ?auto_462873 ) ) ( not ( = ?auto_462872 ?auto_462874 ) ) ( not ( = ?auto_462872 ?auto_462875 ) ) ( not ( = ?auto_462872 ?auto_462876 ) ) ( not ( = ?auto_462872 ?auto_462877 ) ) ( not ( = ?auto_462872 ?auto_462878 ) ) ( not ( = ?auto_462872 ?auto_462879 ) ) ( not ( = ?auto_462872 ?auto_462880 ) ) ( not ( = ?auto_462872 ?auto_462881 ) ) ( not ( = ?auto_462872 ?auto_462882 ) ) ( not ( = ?auto_462872 ?auto_462883 ) ) ( not ( = ?auto_462872 ?auto_462884 ) ) ( not ( = ?auto_462873 ?auto_462874 ) ) ( not ( = ?auto_462873 ?auto_462875 ) ) ( not ( = ?auto_462873 ?auto_462876 ) ) ( not ( = ?auto_462873 ?auto_462877 ) ) ( not ( = ?auto_462873 ?auto_462878 ) ) ( not ( = ?auto_462873 ?auto_462879 ) ) ( not ( = ?auto_462873 ?auto_462880 ) ) ( not ( = ?auto_462873 ?auto_462881 ) ) ( not ( = ?auto_462873 ?auto_462882 ) ) ( not ( = ?auto_462873 ?auto_462883 ) ) ( not ( = ?auto_462873 ?auto_462884 ) ) ( not ( = ?auto_462874 ?auto_462875 ) ) ( not ( = ?auto_462874 ?auto_462876 ) ) ( not ( = ?auto_462874 ?auto_462877 ) ) ( not ( = ?auto_462874 ?auto_462878 ) ) ( not ( = ?auto_462874 ?auto_462879 ) ) ( not ( = ?auto_462874 ?auto_462880 ) ) ( not ( = ?auto_462874 ?auto_462881 ) ) ( not ( = ?auto_462874 ?auto_462882 ) ) ( not ( = ?auto_462874 ?auto_462883 ) ) ( not ( = ?auto_462874 ?auto_462884 ) ) ( not ( = ?auto_462875 ?auto_462876 ) ) ( not ( = ?auto_462875 ?auto_462877 ) ) ( not ( = ?auto_462875 ?auto_462878 ) ) ( not ( = ?auto_462875 ?auto_462879 ) ) ( not ( = ?auto_462875 ?auto_462880 ) ) ( not ( = ?auto_462875 ?auto_462881 ) ) ( not ( = ?auto_462875 ?auto_462882 ) ) ( not ( = ?auto_462875 ?auto_462883 ) ) ( not ( = ?auto_462875 ?auto_462884 ) ) ( not ( = ?auto_462876 ?auto_462877 ) ) ( not ( = ?auto_462876 ?auto_462878 ) ) ( not ( = ?auto_462876 ?auto_462879 ) ) ( not ( = ?auto_462876 ?auto_462880 ) ) ( not ( = ?auto_462876 ?auto_462881 ) ) ( not ( = ?auto_462876 ?auto_462882 ) ) ( not ( = ?auto_462876 ?auto_462883 ) ) ( not ( = ?auto_462876 ?auto_462884 ) ) ( not ( = ?auto_462877 ?auto_462878 ) ) ( not ( = ?auto_462877 ?auto_462879 ) ) ( not ( = ?auto_462877 ?auto_462880 ) ) ( not ( = ?auto_462877 ?auto_462881 ) ) ( not ( = ?auto_462877 ?auto_462882 ) ) ( not ( = ?auto_462877 ?auto_462883 ) ) ( not ( = ?auto_462877 ?auto_462884 ) ) ( not ( = ?auto_462878 ?auto_462879 ) ) ( not ( = ?auto_462878 ?auto_462880 ) ) ( not ( = ?auto_462878 ?auto_462881 ) ) ( not ( = ?auto_462878 ?auto_462882 ) ) ( not ( = ?auto_462878 ?auto_462883 ) ) ( not ( = ?auto_462878 ?auto_462884 ) ) ( not ( = ?auto_462879 ?auto_462880 ) ) ( not ( = ?auto_462879 ?auto_462881 ) ) ( not ( = ?auto_462879 ?auto_462882 ) ) ( not ( = ?auto_462879 ?auto_462883 ) ) ( not ( = ?auto_462879 ?auto_462884 ) ) ( not ( = ?auto_462880 ?auto_462881 ) ) ( not ( = ?auto_462880 ?auto_462882 ) ) ( not ( = ?auto_462880 ?auto_462883 ) ) ( not ( = ?auto_462880 ?auto_462884 ) ) ( not ( = ?auto_462881 ?auto_462882 ) ) ( not ( = ?auto_462881 ?auto_462883 ) ) ( not ( = ?auto_462881 ?auto_462884 ) ) ( not ( = ?auto_462882 ?auto_462883 ) ) ( not ( = ?auto_462882 ?auto_462884 ) ) ( not ( = ?auto_462883 ?auto_462884 ) ) ( ON ?auto_462882 ?auto_462883 ) ( ON ?auto_462881 ?auto_462882 ) ( ON ?auto_462880 ?auto_462881 ) ( ON ?auto_462879 ?auto_462880 ) ( ON ?auto_462878 ?auto_462879 ) ( ON ?auto_462877 ?auto_462878 ) ( CLEAR ?auto_462875 ) ( ON ?auto_462876 ?auto_462877 ) ( CLEAR ?auto_462876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_462871 ?auto_462872 ?auto_462873 ?auto_462874 ?auto_462875 ?auto_462876 )
      ( MAKE-13PILE ?auto_462871 ?auto_462872 ?auto_462873 ?auto_462874 ?auto_462875 ?auto_462876 ?auto_462877 ?auto_462878 ?auto_462879 ?auto_462880 ?auto_462881 ?auto_462882 ?auto_462883 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462898 - BLOCK
      ?auto_462899 - BLOCK
      ?auto_462900 - BLOCK
      ?auto_462901 - BLOCK
      ?auto_462902 - BLOCK
      ?auto_462903 - BLOCK
      ?auto_462904 - BLOCK
      ?auto_462905 - BLOCK
      ?auto_462906 - BLOCK
      ?auto_462907 - BLOCK
      ?auto_462908 - BLOCK
      ?auto_462909 - BLOCK
      ?auto_462910 - BLOCK
    )
    :vars
    (
      ?auto_462911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462910 ?auto_462911 ) ( ON-TABLE ?auto_462898 ) ( ON ?auto_462899 ?auto_462898 ) ( ON ?auto_462900 ?auto_462899 ) ( ON ?auto_462901 ?auto_462900 ) ( ON ?auto_462902 ?auto_462901 ) ( not ( = ?auto_462898 ?auto_462899 ) ) ( not ( = ?auto_462898 ?auto_462900 ) ) ( not ( = ?auto_462898 ?auto_462901 ) ) ( not ( = ?auto_462898 ?auto_462902 ) ) ( not ( = ?auto_462898 ?auto_462903 ) ) ( not ( = ?auto_462898 ?auto_462904 ) ) ( not ( = ?auto_462898 ?auto_462905 ) ) ( not ( = ?auto_462898 ?auto_462906 ) ) ( not ( = ?auto_462898 ?auto_462907 ) ) ( not ( = ?auto_462898 ?auto_462908 ) ) ( not ( = ?auto_462898 ?auto_462909 ) ) ( not ( = ?auto_462898 ?auto_462910 ) ) ( not ( = ?auto_462898 ?auto_462911 ) ) ( not ( = ?auto_462899 ?auto_462900 ) ) ( not ( = ?auto_462899 ?auto_462901 ) ) ( not ( = ?auto_462899 ?auto_462902 ) ) ( not ( = ?auto_462899 ?auto_462903 ) ) ( not ( = ?auto_462899 ?auto_462904 ) ) ( not ( = ?auto_462899 ?auto_462905 ) ) ( not ( = ?auto_462899 ?auto_462906 ) ) ( not ( = ?auto_462899 ?auto_462907 ) ) ( not ( = ?auto_462899 ?auto_462908 ) ) ( not ( = ?auto_462899 ?auto_462909 ) ) ( not ( = ?auto_462899 ?auto_462910 ) ) ( not ( = ?auto_462899 ?auto_462911 ) ) ( not ( = ?auto_462900 ?auto_462901 ) ) ( not ( = ?auto_462900 ?auto_462902 ) ) ( not ( = ?auto_462900 ?auto_462903 ) ) ( not ( = ?auto_462900 ?auto_462904 ) ) ( not ( = ?auto_462900 ?auto_462905 ) ) ( not ( = ?auto_462900 ?auto_462906 ) ) ( not ( = ?auto_462900 ?auto_462907 ) ) ( not ( = ?auto_462900 ?auto_462908 ) ) ( not ( = ?auto_462900 ?auto_462909 ) ) ( not ( = ?auto_462900 ?auto_462910 ) ) ( not ( = ?auto_462900 ?auto_462911 ) ) ( not ( = ?auto_462901 ?auto_462902 ) ) ( not ( = ?auto_462901 ?auto_462903 ) ) ( not ( = ?auto_462901 ?auto_462904 ) ) ( not ( = ?auto_462901 ?auto_462905 ) ) ( not ( = ?auto_462901 ?auto_462906 ) ) ( not ( = ?auto_462901 ?auto_462907 ) ) ( not ( = ?auto_462901 ?auto_462908 ) ) ( not ( = ?auto_462901 ?auto_462909 ) ) ( not ( = ?auto_462901 ?auto_462910 ) ) ( not ( = ?auto_462901 ?auto_462911 ) ) ( not ( = ?auto_462902 ?auto_462903 ) ) ( not ( = ?auto_462902 ?auto_462904 ) ) ( not ( = ?auto_462902 ?auto_462905 ) ) ( not ( = ?auto_462902 ?auto_462906 ) ) ( not ( = ?auto_462902 ?auto_462907 ) ) ( not ( = ?auto_462902 ?auto_462908 ) ) ( not ( = ?auto_462902 ?auto_462909 ) ) ( not ( = ?auto_462902 ?auto_462910 ) ) ( not ( = ?auto_462902 ?auto_462911 ) ) ( not ( = ?auto_462903 ?auto_462904 ) ) ( not ( = ?auto_462903 ?auto_462905 ) ) ( not ( = ?auto_462903 ?auto_462906 ) ) ( not ( = ?auto_462903 ?auto_462907 ) ) ( not ( = ?auto_462903 ?auto_462908 ) ) ( not ( = ?auto_462903 ?auto_462909 ) ) ( not ( = ?auto_462903 ?auto_462910 ) ) ( not ( = ?auto_462903 ?auto_462911 ) ) ( not ( = ?auto_462904 ?auto_462905 ) ) ( not ( = ?auto_462904 ?auto_462906 ) ) ( not ( = ?auto_462904 ?auto_462907 ) ) ( not ( = ?auto_462904 ?auto_462908 ) ) ( not ( = ?auto_462904 ?auto_462909 ) ) ( not ( = ?auto_462904 ?auto_462910 ) ) ( not ( = ?auto_462904 ?auto_462911 ) ) ( not ( = ?auto_462905 ?auto_462906 ) ) ( not ( = ?auto_462905 ?auto_462907 ) ) ( not ( = ?auto_462905 ?auto_462908 ) ) ( not ( = ?auto_462905 ?auto_462909 ) ) ( not ( = ?auto_462905 ?auto_462910 ) ) ( not ( = ?auto_462905 ?auto_462911 ) ) ( not ( = ?auto_462906 ?auto_462907 ) ) ( not ( = ?auto_462906 ?auto_462908 ) ) ( not ( = ?auto_462906 ?auto_462909 ) ) ( not ( = ?auto_462906 ?auto_462910 ) ) ( not ( = ?auto_462906 ?auto_462911 ) ) ( not ( = ?auto_462907 ?auto_462908 ) ) ( not ( = ?auto_462907 ?auto_462909 ) ) ( not ( = ?auto_462907 ?auto_462910 ) ) ( not ( = ?auto_462907 ?auto_462911 ) ) ( not ( = ?auto_462908 ?auto_462909 ) ) ( not ( = ?auto_462908 ?auto_462910 ) ) ( not ( = ?auto_462908 ?auto_462911 ) ) ( not ( = ?auto_462909 ?auto_462910 ) ) ( not ( = ?auto_462909 ?auto_462911 ) ) ( not ( = ?auto_462910 ?auto_462911 ) ) ( ON ?auto_462909 ?auto_462910 ) ( ON ?auto_462908 ?auto_462909 ) ( ON ?auto_462907 ?auto_462908 ) ( ON ?auto_462906 ?auto_462907 ) ( ON ?auto_462905 ?auto_462906 ) ( ON ?auto_462904 ?auto_462905 ) ( CLEAR ?auto_462902 ) ( ON ?auto_462903 ?auto_462904 ) ( CLEAR ?auto_462903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_462898 ?auto_462899 ?auto_462900 ?auto_462901 ?auto_462902 ?auto_462903 )
      ( MAKE-13PILE ?auto_462898 ?auto_462899 ?auto_462900 ?auto_462901 ?auto_462902 ?auto_462903 ?auto_462904 ?auto_462905 ?auto_462906 ?auto_462907 ?auto_462908 ?auto_462909 ?auto_462910 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462925 - BLOCK
      ?auto_462926 - BLOCK
      ?auto_462927 - BLOCK
      ?auto_462928 - BLOCK
      ?auto_462929 - BLOCK
      ?auto_462930 - BLOCK
      ?auto_462931 - BLOCK
      ?auto_462932 - BLOCK
      ?auto_462933 - BLOCK
      ?auto_462934 - BLOCK
      ?auto_462935 - BLOCK
      ?auto_462936 - BLOCK
      ?auto_462937 - BLOCK
    )
    :vars
    (
      ?auto_462938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462937 ?auto_462938 ) ( ON-TABLE ?auto_462925 ) ( ON ?auto_462926 ?auto_462925 ) ( ON ?auto_462927 ?auto_462926 ) ( ON ?auto_462928 ?auto_462927 ) ( not ( = ?auto_462925 ?auto_462926 ) ) ( not ( = ?auto_462925 ?auto_462927 ) ) ( not ( = ?auto_462925 ?auto_462928 ) ) ( not ( = ?auto_462925 ?auto_462929 ) ) ( not ( = ?auto_462925 ?auto_462930 ) ) ( not ( = ?auto_462925 ?auto_462931 ) ) ( not ( = ?auto_462925 ?auto_462932 ) ) ( not ( = ?auto_462925 ?auto_462933 ) ) ( not ( = ?auto_462925 ?auto_462934 ) ) ( not ( = ?auto_462925 ?auto_462935 ) ) ( not ( = ?auto_462925 ?auto_462936 ) ) ( not ( = ?auto_462925 ?auto_462937 ) ) ( not ( = ?auto_462925 ?auto_462938 ) ) ( not ( = ?auto_462926 ?auto_462927 ) ) ( not ( = ?auto_462926 ?auto_462928 ) ) ( not ( = ?auto_462926 ?auto_462929 ) ) ( not ( = ?auto_462926 ?auto_462930 ) ) ( not ( = ?auto_462926 ?auto_462931 ) ) ( not ( = ?auto_462926 ?auto_462932 ) ) ( not ( = ?auto_462926 ?auto_462933 ) ) ( not ( = ?auto_462926 ?auto_462934 ) ) ( not ( = ?auto_462926 ?auto_462935 ) ) ( not ( = ?auto_462926 ?auto_462936 ) ) ( not ( = ?auto_462926 ?auto_462937 ) ) ( not ( = ?auto_462926 ?auto_462938 ) ) ( not ( = ?auto_462927 ?auto_462928 ) ) ( not ( = ?auto_462927 ?auto_462929 ) ) ( not ( = ?auto_462927 ?auto_462930 ) ) ( not ( = ?auto_462927 ?auto_462931 ) ) ( not ( = ?auto_462927 ?auto_462932 ) ) ( not ( = ?auto_462927 ?auto_462933 ) ) ( not ( = ?auto_462927 ?auto_462934 ) ) ( not ( = ?auto_462927 ?auto_462935 ) ) ( not ( = ?auto_462927 ?auto_462936 ) ) ( not ( = ?auto_462927 ?auto_462937 ) ) ( not ( = ?auto_462927 ?auto_462938 ) ) ( not ( = ?auto_462928 ?auto_462929 ) ) ( not ( = ?auto_462928 ?auto_462930 ) ) ( not ( = ?auto_462928 ?auto_462931 ) ) ( not ( = ?auto_462928 ?auto_462932 ) ) ( not ( = ?auto_462928 ?auto_462933 ) ) ( not ( = ?auto_462928 ?auto_462934 ) ) ( not ( = ?auto_462928 ?auto_462935 ) ) ( not ( = ?auto_462928 ?auto_462936 ) ) ( not ( = ?auto_462928 ?auto_462937 ) ) ( not ( = ?auto_462928 ?auto_462938 ) ) ( not ( = ?auto_462929 ?auto_462930 ) ) ( not ( = ?auto_462929 ?auto_462931 ) ) ( not ( = ?auto_462929 ?auto_462932 ) ) ( not ( = ?auto_462929 ?auto_462933 ) ) ( not ( = ?auto_462929 ?auto_462934 ) ) ( not ( = ?auto_462929 ?auto_462935 ) ) ( not ( = ?auto_462929 ?auto_462936 ) ) ( not ( = ?auto_462929 ?auto_462937 ) ) ( not ( = ?auto_462929 ?auto_462938 ) ) ( not ( = ?auto_462930 ?auto_462931 ) ) ( not ( = ?auto_462930 ?auto_462932 ) ) ( not ( = ?auto_462930 ?auto_462933 ) ) ( not ( = ?auto_462930 ?auto_462934 ) ) ( not ( = ?auto_462930 ?auto_462935 ) ) ( not ( = ?auto_462930 ?auto_462936 ) ) ( not ( = ?auto_462930 ?auto_462937 ) ) ( not ( = ?auto_462930 ?auto_462938 ) ) ( not ( = ?auto_462931 ?auto_462932 ) ) ( not ( = ?auto_462931 ?auto_462933 ) ) ( not ( = ?auto_462931 ?auto_462934 ) ) ( not ( = ?auto_462931 ?auto_462935 ) ) ( not ( = ?auto_462931 ?auto_462936 ) ) ( not ( = ?auto_462931 ?auto_462937 ) ) ( not ( = ?auto_462931 ?auto_462938 ) ) ( not ( = ?auto_462932 ?auto_462933 ) ) ( not ( = ?auto_462932 ?auto_462934 ) ) ( not ( = ?auto_462932 ?auto_462935 ) ) ( not ( = ?auto_462932 ?auto_462936 ) ) ( not ( = ?auto_462932 ?auto_462937 ) ) ( not ( = ?auto_462932 ?auto_462938 ) ) ( not ( = ?auto_462933 ?auto_462934 ) ) ( not ( = ?auto_462933 ?auto_462935 ) ) ( not ( = ?auto_462933 ?auto_462936 ) ) ( not ( = ?auto_462933 ?auto_462937 ) ) ( not ( = ?auto_462933 ?auto_462938 ) ) ( not ( = ?auto_462934 ?auto_462935 ) ) ( not ( = ?auto_462934 ?auto_462936 ) ) ( not ( = ?auto_462934 ?auto_462937 ) ) ( not ( = ?auto_462934 ?auto_462938 ) ) ( not ( = ?auto_462935 ?auto_462936 ) ) ( not ( = ?auto_462935 ?auto_462937 ) ) ( not ( = ?auto_462935 ?auto_462938 ) ) ( not ( = ?auto_462936 ?auto_462937 ) ) ( not ( = ?auto_462936 ?auto_462938 ) ) ( not ( = ?auto_462937 ?auto_462938 ) ) ( ON ?auto_462936 ?auto_462937 ) ( ON ?auto_462935 ?auto_462936 ) ( ON ?auto_462934 ?auto_462935 ) ( ON ?auto_462933 ?auto_462934 ) ( ON ?auto_462932 ?auto_462933 ) ( ON ?auto_462931 ?auto_462932 ) ( ON ?auto_462930 ?auto_462931 ) ( CLEAR ?auto_462928 ) ( ON ?auto_462929 ?auto_462930 ) ( CLEAR ?auto_462929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_462925 ?auto_462926 ?auto_462927 ?auto_462928 ?auto_462929 )
      ( MAKE-13PILE ?auto_462925 ?auto_462926 ?auto_462927 ?auto_462928 ?auto_462929 ?auto_462930 ?auto_462931 ?auto_462932 ?auto_462933 ?auto_462934 ?auto_462935 ?auto_462936 ?auto_462937 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462952 - BLOCK
      ?auto_462953 - BLOCK
      ?auto_462954 - BLOCK
      ?auto_462955 - BLOCK
      ?auto_462956 - BLOCK
      ?auto_462957 - BLOCK
      ?auto_462958 - BLOCK
      ?auto_462959 - BLOCK
      ?auto_462960 - BLOCK
      ?auto_462961 - BLOCK
      ?auto_462962 - BLOCK
      ?auto_462963 - BLOCK
      ?auto_462964 - BLOCK
    )
    :vars
    (
      ?auto_462965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462964 ?auto_462965 ) ( ON-TABLE ?auto_462952 ) ( ON ?auto_462953 ?auto_462952 ) ( ON ?auto_462954 ?auto_462953 ) ( ON ?auto_462955 ?auto_462954 ) ( not ( = ?auto_462952 ?auto_462953 ) ) ( not ( = ?auto_462952 ?auto_462954 ) ) ( not ( = ?auto_462952 ?auto_462955 ) ) ( not ( = ?auto_462952 ?auto_462956 ) ) ( not ( = ?auto_462952 ?auto_462957 ) ) ( not ( = ?auto_462952 ?auto_462958 ) ) ( not ( = ?auto_462952 ?auto_462959 ) ) ( not ( = ?auto_462952 ?auto_462960 ) ) ( not ( = ?auto_462952 ?auto_462961 ) ) ( not ( = ?auto_462952 ?auto_462962 ) ) ( not ( = ?auto_462952 ?auto_462963 ) ) ( not ( = ?auto_462952 ?auto_462964 ) ) ( not ( = ?auto_462952 ?auto_462965 ) ) ( not ( = ?auto_462953 ?auto_462954 ) ) ( not ( = ?auto_462953 ?auto_462955 ) ) ( not ( = ?auto_462953 ?auto_462956 ) ) ( not ( = ?auto_462953 ?auto_462957 ) ) ( not ( = ?auto_462953 ?auto_462958 ) ) ( not ( = ?auto_462953 ?auto_462959 ) ) ( not ( = ?auto_462953 ?auto_462960 ) ) ( not ( = ?auto_462953 ?auto_462961 ) ) ( not ( = ?auto_462953 ?auto_462962 ) ) ( not ( = ?auto_462953 ?auto_462963 ) ) ( not ( = ?auto_462953 ?auto_462964 ) ) ( not ( = ?auto_462953 ?auto_462965 ) ) ( not ( = ?auto_462954 ?auto_462955 ) ) ( not ( = ?auto_462954 ?auto_462956 ) ) ( not ( = ?auto_462954 ?auto_462957 ) ) ( not ( = ?auto_462954 ?auto_462958 ) ) ( not ( = ?auto_462954 ?auto_462959 ) ) ( not ( = ?auto_462954 ?auto_462960 ) ) ( not ( = ?auto_462954 ?auto_462961 ) ) ( not ( = ?auto_462954 ?auto_462962 ) ) ( not ( = ?auto_462954 ?auto_462963 ) ) ( not ( = ?auto_462954 ?auto_462964 ) ) ( not ( = ?auto_462954 ?auto_462965 ) ) ( not ( = ?auto_462955 ?auto_462956 ) ) ( not ( = ?auto_462955 ?auto_462957 ) ) ( not ( = ?auto_462955 ?auto_462958 ) ) ( not ( = ?auto_462955 ?auto_462959 ) ) ( not ( = ?auto_462955 ?auto_462960 ) ) ( not ( = ?auto_462955 ?auto_462961 ) ) ( not ( = ?auto_462955 ?auto_462962 ) ) ( not ( = ?auto_462955 ?auto_462963 ) ) ( not ( = ?auto_462955 ?auto_462964 ) ) ( not ( = ?auto_462955 ?auto_462965 ) ) ( not ( = ?auto_462956 ?auto_462957 ) ) ( not ( = ?auto_462956 ?auto_462958 ) ) ( not ( = ?auto_462956 ?auto_462959 ) ) ( not ( = ?auto_462956 ?auto_462960 ) ) ( not ( = ?auto_462956 ?auto_462961 ) ) ( not ( = ?auto_462956 ?auto_462962 ) ) ( not ( = ?auto_462956 ?auto_462963 ) ) ( not ( = ?auto_462956 ?auto_462964 ) ) ( not ( = ?auto_462956 ?auto_462965 ) ) ( not ( = ?auto_462957 ?auto_462958 ) ) ( not ( = ?auto_462957 ?auto_462959 ) ) ( not ( = ?auto_462957 ?auto_462960 ) ) ( not ( = ?auto_462957 ?auto_462961 ) ) ( not ( = ?auto_462957 ?auto_462962 ) ) ( not ( = ?auto_462957 ?auto_462963 ) ) ( not ( = ?auto_462957 ?auto_462964 ) ) ( not ( = ?auto_462957 ?auto_462965 ) ) ( not ( = ?auto_462958 ?auto_462959 ) ) ( not ( = ?auto_462958 ?auto_462960 ) ) ( not ( = ?auto_462958 ?auto_462961 ) ) ( not ( = ?auto_462958 ?auto_462962 ) ) ( not ( = ?auto_462958 ?auto_462963 ) ) ( not ( = ?auto_462958 ?auto_462964 ) ) ( not ( = ?auto_462958 ?auto_462965 ) ) ( not ( = ?auto_462959 ?auto_462960 ) ) ( not ( = ?auto_462959 ?auto_462961 ) ) ( not ( = ?auto_462959 ?auto_462962 ) ) ( not ( = ?auto_462959 ?auto_462963 ) ) ( not ( = ?auto_462959 ?auto_462964 ) ) ( not ( = ?auto_462959 ?auto_462965 ) ) ( not ( = ?auto_462960 ?auto_462961 ) ) ( not ( = ?auto_462960 ?auto_462962 ) ) ( not ( = ?auto_462960 ?auto_462963 ) ) ( not ( = ?auto_462960 ?auto_462964 ) ) ( not ( = ?auto_462960 ?auto_462965 ) ) ( not ( = ?auto_462961 ?auto_462962 ) ) ( not ( = ?auto_462961 ?auto_462963 ) ) ( not ( = ?auto_462961 ?auto_462964 ) ) ( not ( = ?auto_462961 ?auto_462965 ) ) ( not ( = ?auto_462962 ?auto_462963 ) ) ( not ( = ?auto_462962 ?auto_462964 ) ) ( not ( = ?auto_462962 ?auto_462965 ) ) ( not ( = ?auto_462963 ?auto_462964 ) ) ( not ( = ?auto_462963 ?auto_462965 ) ) ( not ( = ?auto_462964 ?auto_462965 ) ) ( ON ?auto_462963 ?auto_462964 ) ( ON ?auto_462962 ?auto_462963 ) ( ON ?auto_462961 ?auto_462962 ) ( ON ?auto_462960 ?auto_462961 ) ( ON ?auto_462959 ?auto_462960 ) ( ON ?auto_462958 ?auto_462959 ) ( ON ?auto_462957 ?auto_462958 ) ( CLEAR ?auto_462955 ) ( ON ?auto_462956 ?auto_462957 ) ( CLEAR ?auto_462956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_462952 ?auto_462953 ?auto_462954 ?auto_462955 ?auto_462956 )
      ( MAKE-13PILE ?auto_462952 ?auto_462953 ?auto_462954 ?auto_462955 ?auto_462956 ?auto_462957 ?auto_462958 ?auto_462959 ?auto_462960 ?auto_462961 ?auto_462962 ?auto_462963 ?auto_462964 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_462979 - BLOCK
      ?auto_462980 - BLOCK
      ?auto_462981 - BLOCK
      ?auto_462982 - BLOCK
      ?auto_462983 - BLOCK
      ?auto_462984 - BLOCK
      ?auto_462985 - BLOCK
      ?auto_462986 - BLOCK
      ?auto_462987 - BLOCK
      ?auto_462988 - BLOCK
      ?auto_462989 - BLOCK
      ?auto_462990 - BLOCK
      ?auto_462991 - BLOCK
    )
    :vars
    (
      ?auto_462992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_462991 ?auto_462992 ) ( ON-TABLE ?auto_462979 ) ( ON ?auto_462980 ?auto_462979 ) ( ON ?auto_462981 ?auto_462980 ) ( not ( = ?auto_462979 ?auto_462980 ) ) ( not ( = ?auto_462979 ?auto_462981 ) ) ( not ( = ?auto_462979 ?auto_462982 ) ) ( not ( = ?auto_462979 ?auto_462983 ) ) ( not ( = ?auto_462979 ?auto_462984 ) ) ( not ( = ?auto_462979 ?auto_462985 ) ) ( not ( = ?auto_462979 ?auto_462986 ) ) ( not ( = ?auto_462979 ?auto_462987 ) ) ( not ( = ?auto_462979 ?auto_462988 ) ) ( not ( = ?auto_462979 ?auto_462989 ) ) ( not ( = ?auto_462979 ?auto_462990 ) ) ( not ( = ?auto_462979 ?auto_462991 ) ) ( not ( = ?auto_462979 ?auto_462992 ) ) ( not ( = ?auto_462980 ?auto_462981 ) ) ( not ( = ?auto_462980 ?auto_462982 ) ) ( not ( = ?auto_462980 ?auto_462983 ) ) ( not ( = ?auto_462980 ?auto_462984 ) ) ( not ( = ?auto_462980 ?auto_462985 ) ) ( not ( = ?auto_462980 ?auto_462986 ) ) ( not ( = ?auto_462980 ?auto_462987 ) ) ( not ( = ?auto_462980 ?auto_462988 ) ) ( not ( = ?auto_462980 ?auto_462989 ) ) ( not ( = ?auto_462980 ?auto_462990 ) ) ( not ( = ?auto_462980 ?auto_462991 ) ) ( not ( = ?auto_462980 ?auto_462992 ) ) ( not ( = ?auto_462981 ?auto_462982 ) ) ( not ( = ?auto_462981 ?auto_462983 ) ) ( not ( = ?auto_462981 ?auto_462984 ) ) ( not ( = ?auto_462981 ?auto_462985 ) ) ( not ( = ?auto_462981 ?auto_462986 ) ) ( not ( = ?auto_462981 ?auto_462987 ) ) ( not ( = ?auto_462981 ?auto_462988 ) ) ( not ( = ?auto_462981 ?auto_462989 ) ) ( not ( = ?auto_462981 ?auto_462990 ) ) ( not ( = ?auto_462981 ?auto_462991 ) ) ( not ( = ?auto_462981 ?auto_462992 ) ) ( not ( = ?auto_462982 ?auto_462983 ) ) ( not ( = ?auto_462982 ?auto_462984 ) ) ( not ( = ?auto_462982 ?auto_462985 ) ) ( not ( = ?auto_462982 ?auto_462986 ) ) ( not ( = ?auto_462982 ?auto_462987 ) ) ( not ( = ?auto_462982 ?auto_462988 ) ) ( not ( = ?auto_462982 ?auto_462989 ) ) ( not ( = ?auto_462982 ?auto_462990 ) ) ( not ( = ?auto_462982 ?auto_462991 ) ) ( not ( = ?auto_462982 ?auto_462992 ) ) ( not ( = ?auto_462983 ?auto_462984 ) ) ( not ( = ?auto_462983 ?auto_462985 ) ) ( not ( = ?auto_462983 ?auto_462986 ) ) ( not ( = ?auto_462983 ?auto_462987 ) ) ( not ( = ?auto_462983 ?auto_462988 ) ) ( not ( = ?auto_462983 ?auto_462989 ) ) ( not ( = ?auto_462983 ?auto_462990 ) ) ( not ( = ?auto_462983 ?auto_462991 ) ) ( not ( = ?auto_462983 ?auto_462992 ) ) ( not ( = ?auto_462984 ?auto_462985 ) ) ( not ( = ?auto_462984 ?auto_462986 ) ) ( not ( = ?auto_462984 ?auto_462987 ) ) ( not ( = ?auto_462984 ?auto_462988 ) ) ( not ( = ?auto_462984 ?auto_462989 ) ) ( not ( = ?auto_462984 ?auto_462990 ) ) ( not ( = ?auto_462984 ?auto_462991 ) ) ( not ( = ?auto_462984 ?auto_462992 ) ) ( not ( = ?auto_462985 ?auto_462986 ) ) ( not ( = ?auto_462985 ?auto_462987 ) ) ( not ( = ?auto_462985 ?auto_462988 ) ) ( not ( = ?auto_462985 ?auto_462989 ) ) ( not ( = ?auto_462985 ?auto_462990 ) ) ( not ( = ?auto_462985 ?auto_462991 ) ) ( not ( = ?auto_462985 ?auto_462992 ) ) ( not ( = ?auto_462986 ?auto_462987 ) ) ( not ( = ?auto_462986 ?auto_462988 ) ) ( not ( = ?auto_462986 ?auto_462989 ) ) ( not ( = ?auto_462986 ?auto_462990 ) ) ( not ( = ?auto_462986 ?auto_462991 ) ) ( not ( = ?auto_462986 ?auto_462992 ) ) ( not ( = ?auto_462987 ?auto_462988 ) ) ( not ( = ?auto_462987 ?auto_462989 ) ) ( not ( = ?auto_462987 ?auto_462990 ) ) ( not ( = ?auto_462987 ?auto_462991 ) ) ( not ( = ?auto_462987 ?auto_462992 ) ) ( not ( = ?auto_462988 ?auto_462989 ) ) ( not ( = ?auto_462988 ?auto_462990 ) ) ( not ( = ?auto_462988 ?auto_462991 ) ) ( not ( = ?auto_462988 ?auto_462992 ) ) ( not ( = ?auto_462989 ?auto_462990 ) ) ( not ( = ?auto_462989 ?auto_462991 ) ) ( not ( = ?auto_462989 ?auto_462992 ) ) ( not ( = ?auto_462990 ?auto_462991 ) ) ( not ( = ?auto_462990 ?auto_462992 ) ) ( not ( = ?auto_462991 ?auto_462992 ) ) ( ON ?auto_462990 ?auto_462991 ) ( ON ?auto_462989 ?auto_462990 ) ( ON ?auto_462988 ?auto_462989 ) ( ON ?auto_462987 ?auto_462988 ) ( ON ?auto_462986 ?auto_462987 ) ( ON ?auto_462985 ?auto_462986 ) ( ON ?auto_462984 ?auto_462985 ) ( ON ?auto_462983 ?auto_462984 ) ( CLEAR ?auto_462981 ) ( ON ?auto_462982 ?auto_462983 ) ( CLEAR ?auto_462982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_462979 ?auto_462980 ?auto_462981 ?auto_462982 )
      ( MAKE-13PILE ?auto_462979 ?auto_462980 ?auto_462981 ?auto_462982 ?auto_462983 ?auto_462984 ?auto_462985 ?auto_462986 ?auto_462987 ?auto_462988 ?auto_462989 ?auto_462990 ?auto_462991 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_463006 - BLOCK
      ?auto_463007 - BLOCK
      ?auto_463008 - BLOCK
      ?auto_463009 - BLOCK
      ?auto_463010 - BLOCK
      ?auto_463011 - BLOCK
      ?auto_463012 - BLOCK
      ?auto_463013 - BLOCK
      ?auto_463014 - BLOCK
      ?auto_463015 - BLOCK
      ?auto_463016 - BLOCK
      ?auto_463017 - BLOCK
      ?auto_463018 - BLOCK
    )
    :vars
    (
      ?auto_463019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463018 ?auto_463019 ) ( ON-TABLE ?auto_463006 ) ( ON ?auto_463007 ?auto_463006 ) ( ON ?auto_463008 ?auto_463007 ) ( not ( = ?auto_463006 ?auto_463007 ) ) ( not ( = ?auto_463006 ?auto_463008 ) ) ( not ( = ?auto_463006 ?auto_463009 ) ) ( not ( = ?auto_463006 ?auto_463010 ) ) ( not ( = ?auto_463006 ?auto_463011 ) ) ( not ( = ?auto_463006 ?auto_463012 ) ) ( not ( = ?auto_463006 ?auto_463013 ) ) ( not ( = ?auto_463006 ?auto_463014 ) ) ( not ( = ?auto_463006 ?auto_463015 ) ) ( not ( = ?auto_463006 ?auto_463016 ) ) ( not ( = ?auto_463006 ?auto_463017 ) ) ( not ( = ?auto_463006 ?auto_463018 ) ) ( not ( = ?auto_463006 ?auto_463019 ) ) ( not ( = ?auto_463007 ?auto_463008 ) ) ( not ( = ?auto_463007 ?auto_463009 ) ) ( not ( = ?auto_463007 ?auto_463010 ) ) ( not ( = ?auto_463007 ?auto_463011 ) ) ( not ( = ?auto_463007 ?auto_463012 ) ) ( not ( = ?auto_463007 ?auto_463013 ) ) ( not ( = ?auto_463007 ?auto_463014 ) ) ( not ( = ?auto_463007 ?auto_463015 ) ) ( not ( = ?auto_463007 ?auto_463016 ) ) ( not ( = ?auto_463007 ?auto_463017 ) ) ( not ( = ?auto_463007 ?auto_463018 ) ) ( not ( = ?auto_463007 ?auto_463019 ) ) ( not ( = ?auto_463008 ?auto_463009 ) ) ( not ( = ?auto_463008 ?auto_463010 ) ) ( not ( = ?auto_463008 ?auto_463011 ) ) ( not ( = ?auto_463008 ?auto_463012 ) ) ( not ( = ?auto_463008 ?auto_463013 ) ) ( not ( = ?auto_463008 ?auto_463014 ) ) ( not ( = ?auto_463008 ?auto_463015 ) ) ( not ( = ?auto_463008 ?auto_463016 ) ) ( not ( = ?auto_463008 ?auto_463017 ) ) ( not ( = ?auto_463008 ?auto_463018 ) ) ( not ( = ?auto_463008 ?auto_463019 ) ) ( not ( = ?auto_463009 ?auto_463010 ) ) ( not ( = ?auto_463009 ?auto_463011 ) ) ( not ( = ?auto_463009 ?auto_463012 ) ) ( not ( = ?auto_463009 ?auto_463013 ) ) ( not ( = ?auto_463009 ?auto_463014 ) ) ( not ( = ?auto_463009 ?auto_463015 ) ) ( not ( = ?auto_463009 ?auto_463016 ) ) ( not ( = ?auto_463009 ?auto_463017 ) ) ( not ( = ?auto_463009 ?auto_463018 ) ) ( not ( = ?auto_463009 ?auto_463019 ) ) ( not ( = ?auto_463010 ?auto_463011 ) ) ( not ( = ?auto_463010 ?auto_463012 ) ) ( not ( = ?auto_463010 ?auto_463013 ) ) ( not ( = ?auto_463010 ?auto_463014 ) ) ( not ( = ?auto_463010 ?auto_463015 ) ) ( not ( = ?auto_463010 ?auto_463016 ) ) ( not ( = ?auto_463010 ?auto_463017 ) ) ( not ( = ?auto_463010 ?auto_463018 ) ) ( not ( = ?auto_463010 ?auto_463019 ) ) ( not ( = ?auto_463011 ?auto_463012 ) ) ( not ( = ?auto_463011 ?auto_463013 ) ) ( not ( = ?auto_463011 ?auto_463014 ) ) ( not ( = ?auto_463011 ?auto_463015 ) ) ( not ( = ?auto_463011 ?auto_463016 ) ) ( not ( = ?auto_463011 ?auto_463017 ) ) ( not ( = ?auto_463011 ?auto_463018 ) ) ( not ( = ?auto_463011 ?auto_463019 ) ) ( not ( = ?auto_463012 ?auto_463013 ) ) ( not ( = ?auto_463012 ?auto_463014 ) ) ( not ( = ?auto_463012 ?auto_463015 ) ) ( not ( = ?auto_463012 ?auto_463016 ) ) ( not ( = ?auto_463012 ?auto_463017 ) ) ( not ( = ?auto_463012 ?auto_463018 ) ) ( not ( = ?auto_463012 ?auto_463019 ) ) ( not ( = ?auto_463013 ?auto_463014 ) ) ( not ( = ?auto_463013 ?auto_463015 ) ) ( not ( = ?auto_463013 ?auto_463016 ) ) ( not ( = ?auto_463013 ?auto_463017 ) ) ( not ( = ?auto_463013 ?auto_463018 ) ) ( not ( = ?auto_463013 ?auto_463019 ) ) ( not ( = ?auto_463014 ?auto_463015 ) ) ( not ( = ?auto_463014 ?auto_463016 ) ) ( not ( = ?auto_463014 ?auto_463017 ) ) ( not ( = ?auto_463014 ?auto_463018 ) ) ( not ( = ?auto_463014 ?auto_463019 ) ) ( not ( = ?auto_463015 ?auto_463016 ) ) ( not ( = ?auto_463015 ?auto_463017 ) ) ( not ( = ?auto_463015 ?auto_463018 ) ) ( not ( = ?auto_463015 ?auto_463019 ) ) ( not ( = ?auto_463016 ?auto_463017 ) ) ( not ( = ?auto_463016 ?auto_463018 ) ) ( not ( = ?auto_463016 ?auto_463019 ) ) ( not ( = ?auto_463017 ?auto_463018 ) ) ( not ( = ?auto_463017 ?auto_463019 ) ) ( not ( = ?auto_463018 ?auto_463019 ) ) ( ON ?auto_463017 ?auto_463018 ) ( ON ?auto_463016 ?auto_463017 ) ( ON ?auto_463015 ?auto_463016 ) ( ON ?auto_463014 ?auto_463015 ) ( ON ?auto_463013 ?auto_463014 ) ( ON ?auto_463012 ?auto_463013 ) ( ON ?auto_463011 ?auto_463012 ) ( ON ?auto_463010 ?auto_463011 ) ( CLEAR ?auto_463008 ) ( ON ?auto_463009 ?auto_463010 ) ( CLEAR ?auto_463009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_463006 ?auto_463007 ?auto_463008 ?auto_463009 )
      ( MAKE-13PILE ?auto_463006 ?auto_463007 ?auto_463008 ?auto_463009 ?auto_463010 ?auto_463011 ?auto_463012 ?auto_463013 ?auto_463014 ?auto_463015 ?auto_463016 ?auto_463017 ?auto_463018 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_463033 - BLOCK
      ?auto_463034 - BLOCK
      ?auto_463035 - BLOCK
      ?auto_463036 - BLOCK
      ?auto_463037 - BLOCK
      ?auto_463038 - BLOCK
      ?auto_463039 - BLOCK
      ?auto_463040 - BLOCK
      ?auto_463041 - BLOCK
      ?auto_463042 - BLOCK
      ?auto_463043 - BLOCK
      ?auto_463044 - BLOCK
      ?auto_463045 - BLOCK
    )
    :vars
    (
      ?auto_463046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463045 ?auto_463046 ) ( ON-TABLE ?auto_463033 ) ( ON ?auto_463034 ?auto_463033 ) ( not ( = ?auto_463033 ?auto_463034 ) ) ( not ( = ?auto_463033 ?auto_463035 ) ) ( not ( = ?auto_463033 ?auto_463036 ) ) ( not ( = ?auto_463033 ?auto_463037 ) ) ( not ( = ?auto_463033 ?auto_463038 ) ) ( not ( = ?auto_463033 ?auto_463039 ) ) ( not ( = ?auto_463033 ?auto_463040 ) ) ( not ( = ?auto_463033 ?auto_463041 ) ) ( not ( = ?auto_463033 ?auto_463042 ) ) ( not ( = ?auto_463033 ?auto_463043 ) ) ( not ( = ?auto_463033 ?auto_463044 ) ) ( not ( = ?auto_463033 ?auto_463045 ) ) ( not ( = ?auto_463033 ?auto_463046 ) ) ( not ( = ?auto_463034 ?auto_463035 ) ) ( not ( = ?auto_463034 ?auto_463036 ) ) ( not ( = ?auto_463034 ?auto_463037 ) ) ( not ( = ?auto_463034 ?auto_463038 ) ) ( not ( = ?auto_463034 ?auto_463039 ) ) ( not ( = ?auto_463034 ?auto_463040 ) ) ( not ( = ?auto_463034 ?auto_463041 ) ) ( not ( = ?auto_463034 ?auto_463042 ) ) ( not ( = ?auto_463034 ?auto_463043 ) ) ( not ( = ?auto_463034 ?auto_463044 ) ) ( not ( = ?auto_463034 ?auto_463045 ) ) ( not ( = ?auto_463034 ?auto_463046 ) ) ( not ( = ?auto_463035 ?auto_463036 ) ) ( not ( = ?auto_463035 ?auto_463037 ) ) ( not ( = ?auto_463035 ?auto_463038 ) ) ( not ( = ?auto_463035 ?auto_463039 ) ) ( not ( = ?auto_463035 ?auto_463040 ) ) ( not ( = ?auto_463035 ?auto_463041 ) ) ( not ( = ?auto_463035 ?auto_463042 ) ) ( not ( = ?auto_463035 ?auto_463043 ) ) ( not ( = ?auto_463035 ?auto_463044 ) ) ( not ( = ?auto_463035 ?auto_463045 ) ) ( not ( = ?auto_463035 ?auto_463046 ) ) ( not ( = ?auto_463036 ?auto_463037 ) ) ( not ( = ?auto_463036 ?auto_463038 ) ) ( not ( = ?auto_463036 ?auto_463039 ) ) ( not ( = ?auto_463036 ?auto_463040 ) ) ( not ( = ?auto_463036 ?auto_463041 ) ) ( not ( = ?auto_463036 ?auto_463042 ) ) ( not ( = ?auto_463036 ?auto_463043 ) ) ( not ( = ?auto_463036 ?auto_463044 ) ) ( not ( = ?auto_463036 ?auto_463045 ) ) ( not ( = ?auto_463036 ?auto_463046 ) ) ( not ( = ?auto_463037 ?auto_463038 ) ) ( not ( = ?auto_463037 ?auto_463039 ) ) ( not ( = ?auto_463037 ?auto_463040 ) ) ( not ( = ?auto_463037 ?auto_463041 ) ) ( not ( = ?auto_463037 ?auto_463042 ) ) ( not ( = ?auto_463037 ?auto_463043 ) ) ( not ( = ?auto_463037 ?auto_463044 ) ) ( not ( = ?auto_463037 ?auto_463045 ) ) ( not ( = ?auto_463037 ?auto_463046 ) ) ( not ( = ?auto_463038 ?auto_463039 ) ) ( not ( = ?auto_463038 ?auto_463040 ) ) ( not ( = ?auto_463038 ?auto_463041 ) ) ( not ( = ?auto_463038 ?auto_463042 ) ) ( not ( = ?auto_463038 ?auto_463043 ) ) ( not ( = ?auto_463038 ?auto_463044 ) ) ( not ( = ?auto_463038 ?auto_463045 ) ) ( not ( = ?auto_463038 ?auto_463046 ) ) ( not ( = ?auto_463039 ?auto_463040 ) ) ( not ( = ?auto_463039 ?auto_463041 ) ) ( not ( = ?auto_463039 ?auto_463042 ) ) ( not ( = ?auto_463039 ?auto_463043 ) ) ( not ( = ?auto_463039 ?auto_463044 ) ) ( not ( = ?auto_463039 ?auto_463045 ) ) ( not ( = ?auto_463039 ?auto_463046 ) ) ( not ( = ?auto_463040 ?auto_463041 ) ) ( not ( = ?auto_463040 ?auto_463042 ) ) ( not ( = ?auto_463040 ?auto_463043 ) ) ( not ( = ?auto_463040 ?auto_463044 ) ) ( not ( = ?auto_463040 ?auto_463045 ) ) ( not ( = ?auto_463040 ?auto_463046 ) ) ( not ( = ?auto_463041 ?auto_463042 ) ) ( not ( = ?auto_463041 ?auto_463043 ) ) ( not ( = ?auto_463041 ?auto_463044 ) ) ( not ( = ?auto_463041 ?auto_463045 ) ) ( not ( = ?auto_463041 ?auto_463046 ) ) ( not ( = ?auto_463042 ?auto_463043 ) ) ( not ( = ?auto_463042 ?auto_463044 ) ) ( not ( = ?auto_463042 ?auto_463045 ) ) ( not ( = ?auto_463042 ?auto_463046 ) ) ( not ( = ?auto_463043 ?auto_463044 ) ) ( not ( = ?auto_463043 ?auto_463045 ) ) ( not ( = ?auto_463043 ?auto_463046 ) ) ( not ( = ?auto_463044 ?auto_463045 ) ) ( not ( = ?auto_463044 ?auto_463046 ) ) ( not ( = ?auto_463045 ?auto_463046 ) ) ( ON ?auto_463044 ?auto_463045 ) ( ON ?auto_463043 ?auto_463044 ) ( ON ?auto_463042 ?auto_463043 ) ( ON ?auto_463041 ?auto_463042 ) ( ON ?auto_463040 ?auto_463041 ) ( ON ?auto_463039 ?auto_463040 ) ( ON ?auto_463038 ?auto_463039 ) ( ON ?auto_463037 ?auto_463038 ) ( ON ?auto_463036 ?auto_463037 ) ( CLEAR ?auto_463034 ) ( ON ?auto_463035 ?auto_463036 ) ( CLEAR ?auto_463035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_463033 ?auto_463034 ?auto_463035 )
      ( MAKE-13PILE ?auto_463033 ?auto_463034 ?auto_463035 ?auto_463036 ?auto_463037 ?auto_463038 ?auto_463039 ?auto_463040 ?auto_463041 ?auto_463042 ?auto_463043 ?auto_463044 ?auto_463045 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_463060 - BLOCK
      ?auto_463061 - BLOCK
      ?auto_463062 - BLOCK
      ?auto_463063 - BLOCK
      ?auto_463064 - BLOCK
      ?auto_463065 - BLOCK
      ?auto_463066 - BLOCK
      ?auto_463067 - BLOCK
      ?auto_463068 - BLOCK
      ?auto_463069 - BLOCK
      ?auto_463070 - BLOCK
      ?auto_463071 - BLOCK
      ?auto_463072 - BLOCK
    )
    :vars
    (
      ?auto_463073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463072 ?auto_463073 ) ( ON-TABLE ?auto_463060 ) ( ON ?auto_463061 ?auto_463060 ) ( not ( = ?auto_463060 ?auto_463061 ) ) ( not ( = ?auto_463060 ?auto_463062 ) ) ( not ( = ?auto_463060 ?auto_463063 ) ) ( not ( = ?auto_463060 ?auto_463064 ) ) ( not ( = ?auto_463060 ?auto_463065 ) ) ( not ( = ?auto_463060 ?auto_463066 ) ) ( not ( = ?auto_463060 ?auto_463067 ) ) ( not ( = ?auto_463060 ?auto_463068 ) ) ( not ( = ?auto_463060 ?auto_463069 ) ) ( not ( = ?auto_463060 ?auto_463070 ) ) ( not ( = ?auto_463060 ?auto_463071 ) ) ( not ( = ?auto_463060 ?auto_463072 ) ) ( not ( = ?auto_463060 ?auto_463073 ) ) ( not ( = ?auto_463061 ?auto_463062 ) ) ( not ( = ?auto_463061 ?auto_463063 ) ) ( not ( = ?auto_463061 ?auto_463064 ) ) ( not ( = ?auto_463061 ?auto_463065 ) ) ( not ( = ?auto_463061 ?auto_463066 ) ) ( not ( = ?auto_463061 ?auto_463067 ) ) ( not ( = ?auto_463061 ?auto_463068 ) ) ( not ( = ?auto_463061 ?auto_463069 ) ) ( not ( = ?auto_463061 ?auto_463070 ) ) ( not ( = ?auto_463061 ?auto_463071 ) ) ( not ( = ?auto_463061 ?auto_463072 ) ) ( not ( = ?auto_463061 ?auto_463073 ) ) ( not ( = ?auto_463062 ?auto_463063 ) ) ( not ( = ?auto_463062 ?auto_463064 ) ) ( not ( = ?auto_463062 ?auto_463065 ) ) ( not ( = ?auto_463062 ?auto_463066 ) ) ( not ( = ?auto_463062 ?auto_463067 ) ) ( not ( = ?auto_463062 ?auto_463068 ) ) ( not ( = ?auto_463062 ?auto_463069 ) ) ( not ( = ?auto_463062 ?auto_463070 ) ) ( not ( = ?auto_463062 ?auto_463071 ) ) ( not ( = ?auto_463062 ?auto_463072 ) ) ( not ( = ?auto_463062 ?auto_463073 ) ) ( not ( = ?auto_463063 ?auto_463064 ) ) ( not ( = ?auto_463063 ?auto_463065 ) ) ( not ( = ?auto_463063 ?auto_463066 ) ) ( not ( = ?auto_463063 ?auto_463067 ) ) ( not ( = ?auto_463063 ?auto_463068 ) ) ( not ( = ?auto_463063 ?auto_463069 ) ) ( not ( = ?auto_463063 ?auto_463070 ) ) ( not ( = ?auto_463063 ?auto_463071 ) ) ( not ( = ?auto_463063 ?auto_463072 ) ) ( not ( = ?auto_463063 ?auto_463073 ) ) ( not ( = ?auto_463064 ?auto_463065 ) ) ( not ( = ?auto_463064 ?auto_463066 ) ) ( not ( = ?auto_463064 ?auto_463067 ) ) ( not ( = ?auto_463064 ?auto_463068 ) ) ( not ( = ?auto_463064 ?auto_463069 ) ) ( not ( = ?auto_463064 ?auto_463070 ) ) ( not ( = ?auto_463064 ?auto_463071 ) ) ( not ( = ?auto_463064 ?auto_463072 ) ) ( not ( = ?auto_463064 ?auto_463073 ) ) ( not ( = ?auto_463065 ?auto_463066 ) ) ( not ( = ?auto_463065 ?auto_463067 ) ) ( not ( = ?auto_463065 ?auto_463068 ) ) ( not ( = ?auto_463065 ?auto_463069 ) ) ( not ( = ?auto_463065 ?auto_463070 ) ) ( not ( = ?auto_463065 ?auto_463071 ) ) ( not ( = ?auto_463065 ?auto_463072 ) ) ( not ( = ?auto_463065 ?auto_463073 ) ) ( not ( = ?auto_463066 ?auto_463067 ) ) ( not ( = ?auto_463066 ?auto_463068 ) ) ( not ( = ?auto_463066 ?auto_463069 ) ) ( not ( = ?auto_463066 ?auto_463070 ) ) ( not ( = ?auto_463066 ?auto_463071 ) ) ( not ( = ?auto_463066 ?auto_463072 ) ) ( not ( = ?auto_463066 ?auto_463073 ) ) ( not ( = ?auto_463067 ?auto_463068 ) ) ( not ( = ?auto_463067 ?auto_463069 ) ) ( not ( = ?auto_463067 ?auto_463070 ) ) ( not ( = ?auto_463067 ?auto_463071 ) ) ( not ( = ?auto_463067 ?auto_463072 ) ) ( not ( = ?auto_463067 ?auto_463073 ) ) ( not ( = ?auto_463068 ?auto_463069 ) ) ( not ( = ?auto_463068 ?auto_463070 ) ) ( not ( = ?auto_463068 ?auto_463071 ) ) ( not ( = ?auto_463068 ?auto_463072 ) ) ( not ( = ?auto_463068 ?auto_463073 ) ) ( not ( = ?auto_463069 ?auto_463070 ) ) ( not ( = ?auto_463069 ?auto_463071 ) ) ( not ( = ?auto_463069 ?auto_463072 ) ) ( not ( = ?auto_463069 ?auto_463073 ) ) ( not ( = ?auto_463070 ?auto_463071 ) ) ( not ( = ?auto_463070 ?auto_463072 ) ) ( not ( = ?auto_463070 ?auto_463073 ) ) ( not ( = ?auto_463071 ?auto_463072 ) ) ( not ( = ?auto_463071 ?auto_463073 ) ) ( not ( = ?auto_463072 ?auto_463073 ) ) ( ON ?auto_463071 ?auto_463072 ) ( ON ?auto_463070 ?auto_463071 ) ( ON ?auto_463069 ?auto_463070 ) ( ON ?auto_463068 ?auto_463069 ) ( ON ?auto_463067 ?auto_463068 ) ( ON ?auto_463066 ?auto_463067 ) ( ON ?auto_463065 ?auto_463066 ) ( ON ?auto_463064 ?auto_463065 ) ( ON ?auto_463063 ?auto_463064 ) ( CLEAR ?auto_463061 ) ( ON ?auto_463062 ?auto_463063 ) ( CLEAR ?auto_463062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_463060 ?auto_463061 ?auto_463062 )
      ( MAKE-13PILE ?auto_463060 ?auto_463061 ?auto_463062 ?auto_463063 ?auto_463064 ?auto_463065 ?auto_463066 ?auto_463067 ?auto_463068 ?auto_463069 ?auto_463070 ?auto_463071 ?auto_463072 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_463087 - BLOCK
      ?auto_463088 - BLOCK
      ?auto_463089 - BLOCK
      ?auto_463090 - BLOCK
      ?auto_463091 - BLOCK
      ?auto_463092 - BLOCK
      ?auto_463093 - BLOCK
      ?auto_463094 - BLOCK
      ?auto_463095 - BLOCK
      ?auto_463096 - BLOCK
      ?auto_463097 - BLOCK
      ?auto_463098 - BLOCK
      ?auto_463099 - BLOCK
    )
    :vars
    (
      ?auto_463100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463099 ?auto_463100 ) ( ON-TABLE ?auto_463087 ) ( not ( = ?auto_463087 ?auto_463088 ) ) ( not ( = ?auto_463087 ?auto_463089 ) ) ( not ( = ?auto_463087 ?auto_463090 ) ) ( not ( = ?auto_463087 ?auto_463091 ) ) ( not ( = ?auto_463087 ?auto_463092 ) ) ( not ( = ?auto_463087 ?auto_463093 ) ) ( not ( = ?auto_463087 ?auto_463094 ) ) ( not ( = ?auto_463087 ?auto_463095 ) ) ( not ( = ?auto_463087 ?auto_463096 ) ) ( not ( = ?auto_463087 ?auto_463097 ) ) ( not ( = ?auto_463087 ?auto_463098 ) ) ( not ( = ?auto_463087 ?auto_463099 ) ) ( not ( = ?auto_463087 ?auto_463100 ) ) ( not ( = ?auto_463088 ?auto_463089 ) ) ( not ( = ?auto_463088 ?auto_463090 ) ) ( not ( = ?auto_463088 ?auto_463091 ) ) ( not ( = ?auto_463088 ?auto_463092 ) ) ( not ( = ?auto_463088 ?auto_463093 ) ) ( not ( = ?auto_463088 ?auto_463094 ) ) ( not ( = ?auto_463088 ?auto_463095 ) ) ( not ( = ?auto_463088 ?auto_463096 ) ) ( not ( = ?auto_463088 ?auto_463097 ) ) ( not ( = ?auto_463088 ?auto_463098 ) ) ( not ( = ?auto_463088 ?auto_463099 ) ) ( not ( = ?auto_463088 ?auto_463100 ) ) ( not ( = ?auto_463089 ?auto_463090 ) ) ( not ( = ?auto_463089 ?auto_463091 ) ) ( not ( = ?auto_463089 ?auto_463092 ) ) ( not ( = ?auto_463089 ?auto_463093 ) ) ( not ( = ?auto_463089 ?auto_463094 ) ) ( not ( = ?auto_463089 ?auto_463095 ) ) ( not ( = ?auto_463089 ?auto_463096 ) ) ( not ( = ?auto_463089 ?auto_463097 ) ) ( not ( = ?auto_463089 ?auto_463098 ) ) ( not ( = ?auto_463089 ?auto_463099 ) ) ( not ( = ?auto_463089 ?auto_463100 ) ) ( not ( = ?auto_463090 ?auto_463091 ) ) ( not ( = ?auto_463090 ?auto_463092 ) ) ( not ( = ?auto_463090 ?auto_463093 ) ) ( not ( = ?auto_463090 ?auto_463094 ) ) ( not ( = ?auto_463090 ?auto_463095 ) ) ( not ( = ?auto_463090 ?auto_463096 ) ) ( not ( = ?auto_463090 ?auto_463097 ) ) ( not ( = ?auto_463090 ?auto_463098 ) ) ( not ( = ?auto_463090 ?auto_463099 ) ) ( not ( = ?auto_463090 ?auto_463100 ) ) ( not ( = ?auto_463091 ?auto_463092 ) ) ( not ( = ?auto_463091 ?auto_463093 ) ) ( not ( = ?auto_463091 ?auto_463094 ) ) ( not ( = ?auto_463091 ?auto_463095 ) ) ( not ( = ?auto_463091 ?auto_463096 ) ) ( not ( = ?auto_463091 ?auto_463097 ) ) ( not ( = ?auto_463091 ?auto_463098 ) ) ( not ( = ?auto_463091 ?auto_463099 ) ) ( not ( = ?auto_463091 ?auto_463100 ) ) ( not ( = ?auto_463092 ?auto_463093 ) ) ( not ( = ?auto_463092 ?auto_463094 ) ) ( not ( = ?auto_463092 ?auto_463095 ) ) ( not ( = ?auto_463092 ?auto_463096 ) ) ( not ( = ?auto_463092 ?auto_463097 ) ) ( not ( = ?auto_463092 ?auto_463098 ) ) ( not ( = ?auto_463092 ?auto_463099 ) ) ( not ( = ?auto_463092 ?auto_463100 ) ) ( not ( = ?auto_463093 ?auto_463094 ) ) ( not ( = ?auto_463093 ?auto_463095 ) ) ( not ( = ?auto_463093 ?auto_463096 ) ) ( not ( = ?auto_463093 ?auto_463097 ) ) ( not ( = ?auto_463093 ?auto_463098 ) ) ( not ( = ?auto_463093 ?auto_463099 ) ) ( not ( = ?auto_463093 ?auto_463100 ) ) ( not ( = ?auto_463094 ?auto_463095 ) ) ( not ( = ?auto_463094 ?auto_463096 ) ) ( not ( = ?auto_463094 ?auto_463097 ) ) ( not ( = ?auto_463094 ?auto_463098 ) ) ( not ( = ?auto_463094 ?auto_463099 ) ) ( not ( = ?auto_463094 ?auto_463100 ) ) ( not ( = ?auto_463095 ?auto_463096 ) ) ( not ( = ?auto_463095 ?auto_463097 ) ) ( not ( = ?auto_463095 ?auto_463098 ) ) ( not ( = ?auto_463095 ?auto_463099 ) ) ( not ( = ?auto_463095 ?auto_463100 ) ) ( not ( = ?auto_463096 ?auto_463097 ) ) ( not ( = ?auto_463096 ?auto_463098 ) ) ( not ( = ?auto_463096 ?auto_463099 ) ) ( not ( = ?auto_463096 ?auto_463100 ) ) ( not ( = ?auto_463097 ?auto_463098 ) ) ( not ( = ?auto_463097 ?auto_463099 ) ) ( not ( = ?auto_463097 ?auto_463100 ) ) ( not ( = ?auto_463098 ?auto_463099 ) ) ( not ( = ?auto_463098 ?auto_463100 ) ) ( not ( = ?auto_463099 ?auto_463100 ) ) ( ON ?auto_463098 ?auto_463099 ) ( ON ?auto_463097 ?auto_463098 ) ( ON ?auto_463096 ?auto_463097 ) ( ON ?auto_463095 ?auto_463096 ) ( ON ?auto_463094 ?auto_463095 ) ( ON ?auto_463093 ?auto_463094 ) ( ON ?auto_463092 ?auto_463093 ) ( ON ?auto_463091 ?auto_463092 ) ( ON ?auto_463090 ?auto_463091 ) ( ON ?auto_463089 ?auto_463090 ) ( CLEAR ?auto_463087 ) ( ON ?auto_463088 ?auto_463089 ) ( CLEAR ?auto_463088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_463087 ?auto_463088 )
      ( MAKE-13PILE ?auto_463087 ?auto_463088 ?auto_463089 ?auto_463090 ?auto_463091 ?auto_463092 ?auto_463093 ?auto_463094 ?auto_463095 ?auto_463096 ?auto_463097 ?auto_463098 ?auto_463099 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_463114 - BLOCK
      ?auto_463115 - BLOCK
      ?auto_463116 - BLOCK
      ?auto_463117 - BLOCK
      ?auto_463118 - BLOCK
      ?auto_463119 - BLOCK
      ?auto_463120 - BLOCK
      ?auto_463121 - BLOCK
      ?auto_463122 - BLOCK
      ?auto_463123 - BLOCK
      ?auto_463124 - BLOCK
      ?auto_463125 - BLOCK
      ?auto_463126 - BLOCK
    )
    :vars
    (
      ?auto_463127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463126 ?auto_463127 ) ( ON-TABLE ?auto_463114 ) ( not ( = ?auto_463114 ?auto_463115 ) ) ( not ( = ?auto_463114 ?auto_463116 ) ) ( not ( = ?auto_463114 ?auto_463117 ) ) ( not ( = ?auto_463114 ?auto_463118 ) ) ( not ( = ?auto_463114 ?auto_463119 ) ) ( not ( = ?auto_463114 ?auto_463120 ) ) ( not ( = ?auto_463114 ?auto_463121 ) ) ( not ( = ?auto_463114 ?auto_463122 ) ) ( not ( = ?auto_463114 ?auto_463123 ) ) ( not ( = ?auto_463114 ?auto_463124 ) ) ( not ( = ?auto_463114 ?auto_463125 ) ) ( not ( = ?auto_463114 ?auto_463126 ) ) ( not ( = ?auto_463114 ?auto_463127 ) ) ( not ( = ?auto_463115 ?auto_463116 ) ) ( not ( = ?auto_463115 ?auto_463117 ) ) ( not ( = ?auto_463115 ?auto_463118 ) ) ( not ( = ?auto_463115 ?auto_463119 ) ) ( not ( = ?auto_463115 ?auto_463120 ) ) ( not ( = ?auto_463115 ?auto_463121 ) ) ( not ( = ?auto_463115 ?auto_463122 ) ) ( not ( = ?auto_463115 ?auto_463123 ) ) ( not ( = ?auto_463115 ?auto_463124 ) ) ( not ( = ?auto_463115 ?auto_463125 ) ) ( not ( = ?auto_463115 ?auto_463126 ) ) ( not ( = ?auto_463115 ?auto_463127 ) ) ( not ( = ?auto_463116 ?auto_463117 ) ) ( not ( = ?auto_463116 ?auto_463118 ) ) ( not ( = ?auto_463116 ?auto_463119 ) ) ( not ( = ?auto_463116 ?auto_463120 ) ) ( not ( = ?auto_463116 ?auto_463121 ) ) ( not ( = ?auto_463116 ?auto_463122 ) ) ( not ( = ?auto_463116 ?auto_463123 ) ) ( not ( = ?auto_463116 ?auto_463124 ) ) ( not ( = ?auto_463116 ?auto_463125 ) ) ( not ( = ?auto_463116 ?auto_463126 ) ) ( not ( = ?auto_463116 ?auto_463127 ) ) ( not ( = ?auto_463117 ?auto_463118 ) ) ( not ( = ?auto_463117 ?auto_463119 ) ) ( not ( = ?auto_463117 ?auto_463120 ) ) ( not ( = ?auto_463117 ?auto_463121 ) ) ( not ( = ?auto_463117 ?auto_463122 ) ) ( not ( = ?auto_463117 ?auto_463123 ) ) ( not ( = ?auto_463117 ?auto_463124 ) ) ( not ( = ?auto_463117 ?auto_463125 ) ) ( not ( = ?auto_463117 ?auto_463126 ) ) ( not ( = ?auto_463117 ?auto_463127 ) ) ( not ( = ?auto_463118 ?auto_463119 ) ) ( not ( = ?auto_463118 ?auto_463120 ) ) ( not ( = ?auto_463118 ?auto_463121 ) ) ( not ( = ?auto_463118 ?auto_463122 ) ) ( not ( = ?auto_463118 ?auto_463123 ) ) ( not ( = ?auto_463118 ?auto_463124 ) ) ( not ( = ?auto_463118 ?auto_463125 ) ) ( not ( = ?auto_463118 ?auto_463126 ) ) ( not ( = ?auto_463118 ?auto_463127 ) ) ( not ( = ?auto_463119 ?auto_463120 ) ) ( not ( = ?auto_463119 ?auto_463121 ) ) ( not ( = ?auto_463119 ?auto_463122 ) ) ( not ( = ?auto_463119 ?auto_463123 ) ) ( not ( = ?auto_463119 ?auto_463124 ) ) ( not ( = ?auto_463119 ?auto_463125 ) ) ( not ( = ?auto_463119 ?auto_463126 ) ) ( not ( = ?auto_463119 ?auto_463127 ) ) ( not ( = ?auto_463120 ?auto_463121 ) ) ( not ( = ?auto_463120 ?auto_463122 ) ) ( not ( = ?auto_463120 ?auto_463123 ) ) ( not ( = ?auto_463120 ?auto_463124 ) ) ( not ( = ?auto_463120 ?auto_463125 ) ) ( not ( = ?auto_463120 ?auto_463126 ) ) ( not ( = ?auto_463120 ?auto_463127 ) ) ( not ( = ?auto_463121 ?auto_463122 ) ) ( not ( = ?auto_463121 ?auto_463123 ) ) ( not ( = ?auto_463121 ?auto_463124 ) ) ( not ( = ?auto_463121 ?auto_463125 ) ) ( not ( = ?auto_463121 ?auto_463126 ) ) ( not ( = ?auto_463121 ?auto_463127 ) ) ( not ( = ?auto_463122 ?auto_463123 ) ) ( not ( = ?auto_463122 ?auto_463124 ) ) ( not ( = ?auto_463122 ?auto_463125 ) ) ( not ( = ?auto_463122 ?auto_463126 ) ) ( not ( = ?auto_463122 ?auto_463127 ) ) ( not ( = ?auto_463123 ?auto_463124 ) ) ( not ( = ?auto_463123 ?auto_463125 ) ) ( not ( = ?auto_463123 ?auto_463126 ) ) ( not ( = ?auto_463123 ?auto_463127 ) ) ( not ( = ?auto_463124 ?auto_463125 ) ) ( not ( = ?auto_463124 ?auto_463126 ) ) ( not ( = ?auto_463124 ?auto_463127 ) ) ( not ( = ?auto_463125 ?auto_463126 ) ) ( not ( = ?auto_463125 ?auto_463127 ) ) ( not ( = ?auto_463126 ?auto_463127 ) ) ( ON ?auto_463125 ?auto_463126 ) ( ON ?auto_463124 ?auto_463125 ) ( ON ?auto_463123 ?auto_463124 ) ( ON ?auto_463122 ?auto_463123 ) ( ON ?auto_463121 ?auto_463122 ) ( ON ?auto_463120 ?auto_463121 ) ( ON ?auto_463119 ?auto_463120 ) ( ON ?auto_463118 ?auto_463119 ) ( ON ?auto_463117 ?auto_463118 ) ( ON ?auto_463116 ?auto_463117 ) ( CLEAR ?auto_463114 ) ( ON ?auto_463115 ?auto_463116 ) ( CLEAR ?auto_463115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_463114 ?auto_463115 )
      ( MAKE-13PILE ?auto_463114 ?auto_463115 ?auto_463116 ?auto_463117 ?auto_463118 ?auto_463119 ?auto_463120 ?auto_463121 ?auto_463122 ?auto_463123 ?auto_463124 ?auto_463125 ?auto_463126 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_463141 - BLOCK
      ?auto_463142 - BLOCK
      ?auto_463143 - BLOCK
      ?auto_463144 - BLOCK
      ?auto_463145 - BLOCK
      ?auto_463146 - BLOCK
      ?auto_463147 - BLOCK
      ?auto_463148 - BLOCK
      ?auto_463149 - BLOCK
      ?auto_463150 - BLOCK
      ?auto_463151 - BLOCK
      ?auto_463152 - BLOCK
      ?auto_463153 - BLOCK
    )
    :vars
    (
      ?auto_463154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463153 ?auto_463154 ) ( not ( = ?auto_463141 ?auto_463142 ) ) ( not ( = ?auto_463141 ?auto_463143 ) ) ( not ( = ?auto_463141 ?auto_463144 ) ) ( not ( = ?auto_463141 ?auto_463145 ) ) ( not ( = ?auto_463141 ?auto_463146 ) ) ( not ( = ?auto_463141 ?auto_463147 ) ) ( not ( = ?auto_463141 ?auto_463148 ) ) ( not ( = ?auto_463141 ?auto_463149 ) ) ( not ( = ?auto_463141 ?auto_463150 ) ) ( not ( = ?auto_463141 ?auto_463151 ) ) ( not ( = ?auto_463141 ?auto_463152 ) ) ( not ( = ?auto_463141 ?auto_463153 ) ) ( not ( = ?auto_463141 ?auto_463154 ) ) ( not ( = ?auto_463142 ?auto_463143 ) ) ( not ( = ?auto_463142 ?auto_463144 ) ) ( not ( = ?auto_463142 ?auto_463145 ) ) ( not ( = ?auto_463142 ?auto_463146 ) ) ( not ( = ?auto_463142 ?auto_463147 ) ) ( not ( = ?auto_463142 ?auto_463148 ) ) ( not ( = ?auto_463142 ?auto_463149 ) ) ( not ( = ?auto_463142 ?auto_463150 ) ) ( not ( = ?auto_463142 ?auto_463151 ) ) ( not ( = ?auto_463142 ?auto_463152 ) ) ( not ( = ?auto_463142 ?auto_463153 ) ) ( not ( = ?auto_463142 ?auto_463154 ) ) ( not ( = ?auto_463143 ?auto_463144 ) ) ( not ( = ?auto_463143 ?auto_463145 ) ) ( not ( = ?auto_463143 ?auto_463146 ) ) ( not ( = ?auto_463143 ?auto_463147 ) ) ( not ( = ?auto_463143 ?auto_463148 ) ) ( not ( = ?auto_463143 ?auto_463149 ) ) ( not ( = ?auto_463143 ?auto_463150 ) ) ( not ( = ?auto_463143 ?auto_463151 ) ) ( not ( = ?auto_463143 ?auto_463152 ) ) ( not ( = ?auto_463143 ?auto_463153 ) ) ( not ( = ?auto_463143 ?auto_463154 ) ) ( not ( = ?auto_463144 ?auto_463145 ) ) ( not ( = ?auto_463144 ?auto_463146 ) ) ( not ( = ?auto_463144 ?auto_463147 ) ) ( not ( = ?auto_463144 ?auto_463148 ) ) ( not ( = ?auto_463144 ?auto_463149 ) ) ( not ( = ?auto_463144 ?auto_463150 ) ) ( not ( = ?auto_463144 ?auto_463151 ) ) ( not ( = ?auto_463144 ?auto_463152 ) ) ( not ( = ?auto_463144 ?auto_463153 ) ) ( not ( = ?auto_463144 ?auto_463154 ) ) ( not ( = ?auto_463145 ?auto_463146 ) ) ( not ( = ?auto_463145 ?auto_463147 ) ) ( not ( = ?auto_463145 ?auto_463148 ) ) ( not ( = ?auto_463145 ?auto_463149 ) ) ( not ( = ?auto_463145 ?auto_463150 ) ) ( not ( = ?auto_463145 ?auto_463151 ) ) ( not ( = ?auto_463145 ?auto_463152 ) ) ( not ( = ?auto_463145 ?auto_463153 ) ) ( not ( = ?auto_463145 ?auto_463154 ) ) ( not ( = ?auto_463146 ?auto_463147 ) ) ( not ( = ?auto_463146 ?auto_463148 ) ) ( not ( = ?auto_463146 ?auto_463149 ) ) ( not ( = ?auto_463146 ?auto_463150 ) ) ( not ( = ?auto_463146 ?auto_463151 ) ) ( not ( = ?auto_463146 ?auto_463152 ) ) ( not ( = ?auto_463146 ?auto_463153 ) ) ( not ( = ?auto_463146 ?auto_463154 ) ) ( not ( = ?auto_463147 ?auto_463148 ) ) ( not ( = ?auto_463147 ?auto_463149 ) ) ( not ( = ?auto_463147 ?auto_463150 ) ) ( not ( = ?auto_463147 ?auto_463151 ) ) ( not ( = ?auto_463147 ?auto_463152 ) ) ( not ( = ?auto_463147 ?auto_463153 ) ) ( not ( = ?auto_463147 ?auto_463154 ) ) ( not ( = ?auto_463148 ?auto_463149 ) ) ( not ( = ?auto_463148 ?auto_463150 ) ) ( not ( = ?auto_463148 ?auto_463151 ) ) ( not ( = ?auto_463148 ?auto_463152 ) ) ( not ( = ?auto_463148 ?auto_463153 ) ) ( not ( = ?auto_463148 ?auto_463154 ) ) ( not ( = ?auto_463149 ?auto_463150 ) ) ( not ( = ?auto_463149 ?auto_463151 ) ) ( not ( = ?auto_463149 ?auto_463152 ) ) ( not ( = ?auto_463149 ?auto_463153 ) ) ( not ( = ?auto_463149 ?auto_463154 ) ) ( not ( = ?auto_463150 ?auto_463151 ) ) ( not ( = ?auto_463150 ?auto_463152 ) ) ( not ( = ?auto_463150 ?auto_463153 ) ) ( not ( = ?auto_463150 ?auto_463154 ) ) ( not ( = ?auto_463151 ?auto_463152 ) ) ( not ( = ?auto_463151 ?auto_463153 ) ) ( not ( = ?auto_463151 ?auto_463154 ) ) ( not ( = ?auto_463152 ?auto_463153 ) ) ( not ( = ?auto_463152 ?auto_463154 ) ) ( not ( = ?auto_463153 ?auto_463154 ) ) ( ON ?auto_463152 ?auto_463153 ) ( ON ?auto_463151 ?auto_463152 ) ( ON ?auto_463150 ?auto_463151 ) ( ON ?auto_463149 ?auto_463150 ) ( ON ?auto_463148 ?auto_463149 ) ( ON ?auto_463147 ?auto_463148 ) ( ON ?auto_463146 ?auto_463147 ) ( ON ?auto_463145 ?auto_463146 ) ( ON ?auto_463144 ?auto_463145 ) ( ON ?auto_463143 ?auto_463144 ) ( ON ?auto_463142 ?auto_463143 ) ( ON ?auto_463141 ?auto_463142 ) ( CLEAR ?auto_463141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_463141 )
      ( MAKE-13PILE ?auto_463141 ?auto_463142 ?auto_463143 ?auto_463144 ?auto_463145 ?auto_463146 ?auto_463147 ?auto_463148 ?auto_463149 ?auto_463150 ?auto_463151 ?auto_463152 ?auto_463153 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_463168 - BLOCK
      ?auto_463169 - BLOCK
      ?auto_463170 - BLOCK
      ?auto_463171 - BLOCK
      ?auto_463172 - BLOCK
      ?auto_463173 - BLOCK
      ?auto_463174 - BLOCK
      ?auto_463175 - BLOCK
      ?auto_463176 - BLOCK
      ?auto_463177 - BLOCK
      ?auto_463178 - BLOCK
      ?auto_463179 - BLOCK
      ?auto_463180 - BLOCK
    )
    :vars
    (
      ?auto_463181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463180 ?auto_463181 ) ( not ( = ?auto_463168 ?auto_463169 ) ) ( not ( = ?auto_463168 ?auto_463170 ) ) ( not ( = ?auto_463168 ?auto_463171 ) ) ( not ( = ?auto_463168 ?auto_463172 ) ) ( not ( = ?auto_463168 ?auto_463173 ) ) ( not ( = ?auto_463168 ?auto_463174 ) ) ( not ( = ?auto_463168 ?auto_463175 ) ) ( not ( = ?auto_463168 ?auto_463176 ) ) ( not ( = ?auto_463168 ?auto_463177 ) ) ( not ( = ?auto_463168 ?auto_463178 ) ) ( not ( = ?auto_463168 ?auto_463179 ) ) ( not ( = ?auto_463168 ?auto_463180 ) ) ( not ( = ?auto_463168 ?auto_463181 ) ) ( not ( = ?auto_463169 ?auto_463170 ) ) ( not ( = ?auto_463169 ?auto_463171 ) ) ( not ( = ?auto_463169 ?auto_463172 ) ) ( not ( = ?auto_463169 ?auto_463173 ) ) ( not ( = ?auto_463169 ?auto_463174 ) ) ( not ( = ?auto_463169 ?auto_463175 ) ) ( not ( = ?auto_463169 ?auto_463176 ) ) ( not ( = ?auto_463169 ?auto_463177 ) ) ( not ( = ?auto_463169 ?auto_463178 ) ) ( not ( = ?auto_463169 ?auto_463179 ) ) ( not ( = ?auto_463169 ?auto_463180 ) ) ( not ( = ?auto_463169 ?auto_463181 ) ) ( not ( = ?auto_463170 ?auto_463171 ) ) ( not ( = ?auto_463170 ?auto_463172 ) ) ( not ( = ?auto_463170 ?auto_463173 ) ) ( not ( = ?auto_463170 ?auto_463174 ) ) ( not ( = ?auto_463170 ?auto_463175 ) ) ( not ( = ?auto_463170 ?auto_463176 ) ) ( not ( = ?auto_463170 ?auto_463177 ) ) ( not ( = ?auto_463170 ?auto_463178 ) ) ( not ( = ?auto_463170 ?auto_463179 ) ) ( not ( = ?auto_463170 ?auto_463180 ) ) ( not ( = ?auto_463170 ?auto_463181 ) ) ( not ( = ?auto_463171 ?auto_463172 ) ) ( not ( = ?auto_463171 ?auto_463173 ) ) ( not ( = ?auto_463171 ?auto_463174 ) ) ( not ( = ?auto_463171 ?auto_463175 ) ) ( not ( = ?auto_463171 ?auto_463176 ) ) ( not ( = ?auto_463171 ?auto_463177 ) ) ( not ( = ?auto_463171 ?auto_463178 ) ) ( not ( = ?auto_463171 ?auto_463179 ) ) ( not ( = ?auto_463171 ?auto_463180 ) ) ( not ( = ?auto_463171 ?auto_463181 ) ) ( not ( = ?auto_463172 ?auto_463173 ) ) ( not ( = ?auto_463172 ?auto_463174 ) ) ( not ( = ?auto_463172 ?auto_463175 ) ) ( not ( = ?auto_463172 ?auto_463176 ) ) ( not ( = ?auto_463172 ?auto_463177 ) ) ( not ( = ?auto_463172 ?auto_463178 ) ) ( not ( = ?auto_463172 ?auto_463179 ) ) ( not ( = ?auto_463172 ?auto_463180 ) ) ( not ( = ?auto_463172 ?auto_463181 ) ) ( not ( = ?auto_463173 ?auto_463174 ) ) ( not ( = ?auto_463173 ?auto_463175 ) ) ( not ( = ?auto_463173 ?auto_463176 ) ) ( not ( = ?auto_463173 ?auto_463177 ) ) ( not ( = ?auto_463173 ?auto_463178 ) ) ( not ( = ?auto_463173 ?auto_463179 ) ) ( not ( = ?auto_463173 ?auto_463180 ) ) ( not ( = ?auto_463173 ?auto_463181 ) ) ( not ( = ?auto_463174 ?auto_463175 ) ) ( not ( = ?auto_463174 ?auto_463176 ) ) ( not ( = ?auto_463174 ?auto_463177 ) ) ( not ( = ?auto_463174 ?auto_463178 ) ) ( not ( = ?auto_463174 ?auto_463179 ) ) ( not ( = ?auto_463174 ?auto_463180 ) ) ( not ( = ?auto_463174 ?auto_463181 ) ) ( not ( = ?auto_463175 ?auto_463176 ) ) ( not ( = ?auto_463175 ?auto_463177 ) ) ( not ( = ?auto_463175 ?auto_463178 ) ) ( not ( = ?auto_463175 ?auto_463179 ) ) ( not ( = ?auto_463175 ?auto_463180 ) ) ( not ( = ?auto_463175 ?auto_463181 ) ) ( not ( = ?auto_463176 ?auto_463177 ) ) ( not ( = ?auto_463176 ?auto_463178 ) ) ( not ( = ?auto_463176 ?auto_463179 ) ) ( not ( = ?auto_463176 ?auto_463180 ) ) ( not ( = ?auto_463176 ?auto_463181 ) ) ( not ( = ?auto_463177 ?auto_463178 ) ) ( not ( = ?auto_463177 ?auto_463179 ) ) ( not ( = ?auto_463177 ?auto_463180 ) ) ( not ( = ?auto_463177 ?auto_463181 ) ) ( not ( = ?auto_463178 ?auto_463179 ) ) ( not ( = ?auto_463178 ?auto_463180 ) ) ( not ( = ?auto_463178 ?auto_463181 ) ) ( not ( = ?auto_463179 ?auto_463180 ) ) ( not ( = ?auto_463179 ?auto_463181 ) ) ( not ( = ?auto_463180 ?auto_463181 ) ) ( ON ?auto_463179 ?auto_463180 ) ( ON ?auto_463178 ?auto_463179 ) ( ON ?auto_463177 ?auto_463178 ) ( ON ?auto_463176 ?auto_463177 ) ( ON ?auto_463175 ?auto_463176 ) ( ON ?auto_463174 ?auto_463175 ) ( ON ?auto_463173 ?auto_463174 ) ( ON ?auto_463172 ?auto_463173 ) ( ON ?auto_463171 ?auto_463172 ) ( ON ?auto_463170 ?auto_463171 ) ( ON ?auto_463169 ?auto_463170 ) ( ON ?auto_463168 ?auto_463169 ) ( CLEAR ?auto_463168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_463168 )
      ( MAKE-13PILE ?auto_463168 ?auto_463169 ?auto_463170 ?auto_463171 ?auto_463172 ?auto_463173 ?auto_463174 ?auto_463175 ?auto_463176 ?auto_463177 ?auto_463178 ?auto_463179 ?auto_463180 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463196 - BLOCK
      ?auto_463197 - BLOCK
      ?auto_463198 - BLOCK
      ?auto_463199 - BLOCK
      ?auto_463200 - BLOCK
      ?auto_463201 - BLOCK
      ?auto_463202 - BLOCK
      ?auto_463203 - BLOCK
      ?auto_463204 - BLOCK
      ?auto_463205 - BLOCK
      ?auto_463206 - BLOCK
      ?auto_463207 - BLOCK
      ?auto_463208 - BLOCK
      ?auto_463209 - BLOCK
    )
    :vars
    (
      ?auto_463210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_463208 ) ( ON ?auto_463209 ?auto_463210 ) ( CLEAR ?auto_463209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_463196 ) ( ON ?auto_463197 ?auto_463196 ) ( ON ?auto_463198 ?auto_463197 ) ( ON ?auto_463199 ?auto_463198 ) ( ON ?auto_463200 ?auto_463199 ) ( ON ?auto_463201 ?auto_463200 ) ( ON ?auto_463202 ?auto_463201 ) ( ON ?auto_463203 ?auto_463202 ) ( ON ?auto_463204 ?auto_463203 ) ( ON ?auto_463205 ?auto_463204 ) ( ON ?auto_463206 ?auto_463205 ) ( ON ?auto_463207 ?auto_463206 ) ( ON ?auto_463208 ?auto_463207 ) ( not ( = ?auto_463196 ?auto_463197 ) ) ( not ( = ?auto_463196 ?auto_463198 ) ) ( not ( = ?auto_463196 ?auto_463199 ) ) ( not ( = ?auto_463196 ?auto_463200 ) ) ( not ( = ?auto_463196 ?auto_463201 ) ) ( not ( = ?auto_463196 ?auto_463202 ) ) ( not ( = ?auto_463196 ?auto_463203 ) ) ( not ( = ?auto_463196 ?auto_463204 ) ) ( not ( = ?auto_463196 ?auto_463205 ) ) ( not ( = ?auto_463196 ?auto_463206 ) ) ( not ( = ?auto_463196 ?auto_463207 ) ) ( not ( = ?auto_463196 ?auto_463208 ) ) ( not ( = ?auto_463196 ?auto_463209 ) ) ( not ( = ?auto_463196 ?auto_463210 ) ) ( not ( = ?auto_463197 ?auto_463198 ) ) ( not ( = ?auto_463197 ?auto_463199 ) ) ( not ( = ?auto_463197 ?auto_463200 ) ) ( not ( = ?auto_463197 ?auto_463201 ) ) ( not ( = ?auto_463197 ?auto_463202 ) ) ( not ( = ?auto_463197 ?auto_463203 ) ) ( not ( = ?auto_463197 ?auto_463204 ) ) ( not ( = ?auto_463197 ?auto_463205 ) ) ( not ( = ?auto_463197 ?auto_463206 ) ) ( not ( = ?auto_463197 ?auto_463207 ) ) ( not ( = ?auto_463197 ?auto_463208 ) ) ( not ( = ?auto_463197 ?auto_463209 ) ) ( not ( = ?auto_463197 ?auto_463210 ) ) ( not ( = ?auto_463198 ?auto_463199 ) ) ( not ( = ?auto_463198 ?auto_463200 ) ) ( not ( = ?auto_463198 ?auto_463201 ) ) ( not ( = ?auto_463198 ?auto_463202 ) ) ( not ( = ?auto_463198 ?auto_463203 ) ) ( not ( = ?auto_463198 ?auto_463204 ) ) ( not ( = ?auto_463198 ?auto_463205 ) ) ( not ( = ?auto_463198 ?auto_463206 ) ) ( not ( = ?auto_463198 ?auto_463207 ) ) ( not ( = ?auto_463198 ?auto_463208 ) ) ( not ( = ?auto_463198 ?auto_463209 ) ) ( not ( = ?auto_463198 ?auto_463210 ) ) ( not ( = ?auto_463199 ?auto_463200 ) ) ( not ( = ?auto_463199 ?auto_463201 ) ) ( not ( = ?auto_463199 ?auto_463202 ) ) ( not ( = ?auto_463199 ?auto_463203 ) ) ( not ( = ?auto_463199 ?auto_463204 ) ) ( not ( = ?auto_463199 ?auto_463205 ) ) ( not ( = ?auto_463199 ?auto_463206 ) ) ( not ( = ?auto_463199 ?auto_463207 ) ) ( not ( = ?auto_463199 ?auto_463208 ) ) ( not ( = ?auto_463199 ?auto_463209 ) ) ( not ( = ?auto_463199 ?auto_463210 ) ) ( not ( = ?auto_463200 ?auto_463201 ) ) ( not ( = ?auto_463200 ?auto_463202 ) ) ( not ( = ?auto_463200 ?auto_463203 ) ) ( not ( = ?auto_463200 ?auto_463204 ) ) ( not ( = ?auto_463200 ?auto_463205 ) ) ( not ( = ?auto_463200 ?auto_463206 ) ) ( not ( = ?auto_463200 ?auto_463207 ) ) ( not ( = ?auto_463200 ?auto_463208 ) ) ( not ( = ?auto_463200 ?auto_463209 ) ) ( not ( = ?auto_463200 ?auto_463210 ) ) ( not ( = ?auto_463201 ?auto_463202 ) ) ( not ( = ?auto_463201 ?auto_463203 ) ) ( not ( = ?auto_463201 ?auto_463204 ) ) ( not ( = ?auto_463201 ?auto_463205 ) ) ( not ( = ?auto_463201 ?auto_463206 ) ) ( not ( = ?auto_463201 ?auto_463207 ) ) ( not ( = ?auto_463201 ?auto_463208 ) ) ( not ( = ?auto_463201 ?auto_463209 ) ) ( not ( = ?auto_463201 ?auto_463210 ) ) ( not ( = ?auto_463202 ?auto_463203 ) ) ( not ( = ?auto_463202 ?auto_463204 ) ) ( not ( = ?auto_463202 ?auto_463205 ) ) ( not ( = ?auto_463202 ?auto_463206 ) ) ( not ( = ?auto_463202 ?auto_463207 ) ) ( not ( = ?auto_463202 ?auto_463208 ) ) ( not ( = ?auto_463202 ?auto_463209 ) ) ( not ( = ?auto_463202 ?auto_463210 ) ) ( not ( = ?auto_463203 ?auto_463204 ) ) ( not ( = ?auto_463203 ?auto_463205 ) ) ( not ( = ?auto_463203 ?auto_463206 ) ) ( not ( = ?auto_463203 ?auto_463207 ) ) ( not ( = ?auto_463203 ?auto_463208 ) ) ( not ( = ?auto_463203 ?auto_463209 ) ) ( not ( = ?auto_463203 ?auto_463210 ) ) ( not ( = ?auto_463204 ?auto_463205 ) ) ( not ( = ?auto_463204 ?auto_463206 ) ) ( not ( = ?auto_463204 ?auto_463207 ) ) ( not ( = ?auto_463204 ?auto_463208 ) ) ( not ( = ?auto_463204 ?auto_463209 ) ) ( not ( = ?auto_463204 ?auto_463210 ) ) ( not ( = ?auto_463205 ?auto_463206 ) ) ( not ( = ?auto_463205 ?auto_463207 ) ) ( not ( = ?auto_463205 ?auto_463208 ) ) ( not ( = ?auto_463205 ?auto_463209 ) ) ( not ( = ?auto_463205 ?auto_463210 ) ) ( not ( = ?auto_463206 ?auto_463207 ) ) ( not ( = ?auto_463206 ?auto_463208 ) ) ( not ( = ?auto_463206 ?auto_463209 ) ) ( not ( = ?auto_463206 ?auto_463210 ) ) ( not ( = ?auto_463207 ?auto_463208 ) ) ( not ( = ?auto_463207 ?auto_463209 ) ) ( not ( = ?auto_463207 ?auto_463210 ) ) ( not ( = ?auto_463208 ?auto_463209 ) ) ( not ( = ?auto_463208 ?auto_463210 ) ) ( not ( = ?auto_463209 ?auto_463210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_463209 ?auto_463210 )
      ( !STACK ?auto_463209 ?auto_463208 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463225 - BLOCK
      ?auto_463226 - BLOCK
      ?auto_463227 - BLOCK
      ?auto_463228 - BLOCK
      ?auto_463229 - BLOCK
      ?auto_463230 - BLOCK
      ?auto_463231 - BLOCK
      ?auto_463232 - BLOCK
      ?auto_463233 - BLOCK
      ?auto_463234 - BLOCK
      ?auto_463235 - BLOCK
      ?auto_463236 - BLOCK
      ?auto_463237 - BLOCK
      ?auto_463238 - BLOCK
    )
    :vars
    (
      ?auto_463239 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_463237 ) ( ON ?auto_463238 ?auto_463239 ) ( CLEAR ?auto_463238 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_463225 ) ( ON ?auto_463226 ?auto_463225 ) ( ON ?auto_463227 ?auto_463226 ) ( ON ?auto_463228 ?auto_463227 ) ( ON ?auto_463229 ?auto_463228 ) ( ON ?auto_463230 ?auto_463229 ) ( ON ?auto_463231 ?auto_463230 ) ( ON ?auto_463232 ?auto_463231 ) ( ON ?auto_463233 ?auto_463232 ) ( ON ?auto_463234 ?auto_463233 ) ( ON ?auto_463235 ?auto_463234 ) ( ON ?auto_463236 ?auto_463235 ) ( ON ?auto_463237 ?auto_463236 ) ( not ( = ?auto_463225 ?auto_463226 ) ) ( not ( = ?auto_463225 ?auto_463227 ) ) ( not ( = ?auto_463225 ?auto_463228 ) ) ( not ( = ?auto_463225 ?auto_463229 ) ) ( not ( = ?auto_463225 ?auto_463230 ) ) ( not ( = ?auto_463225 ?auto_463231 ) ) ( not ( = ?auto_463225 ?auto_463232 ) ) ( not ( = ?auto_463225 ?auto_463233 ) ) ( not ( = ?auto_463225 ?auto_463234 ) ) ( not ( = ?auto_463225 ?auto_463235 ) ) ( not ( = ?auto_463225 ?auto_463236 ) ) ( not ( = ?auto_463225 ?auto_463237 ) ) ( not ( = ?auto_463225 ?auto_463238 ) ) ( not ( = ?auto_463225 ?auto_463239 ) ) ( not ( = ?auto_463226 ?auto_463227 ) ) ( not ( = ?auto_463226 ?auto_463228 ) ) ( not ( = ?auto_463226 ?auto_463229 ) ) ( not ( = ?auto_463226 ?auto_463230 ) ) ( not ( = ?auto_463226 ?auto_463231 ) ) ( not ( = ?auto_463226 ?auto_463232 ) ) ( not ( = ?auto_463226 ?auto_463233 ) ) ( not ( = ?auto_463226 ?auto_463234 ) ) ( not ( = ?auto_463226 ?auto_463235 ) ) ( not ( = ?auto_463226 ?auto_463236 ) ) ( not ( = ?auto_463226 ?auto_463237 ) ) ( not ( = ?auto_463226 ?auto_463238 ) ) ( not ( = ?auto_463226 ?auto_463239 ) ) ( not ( = ?auto_463227 ?auto_463228 ) ) ( not ( = ?auto_463227 ?auto_463229 ) ) ( not ( = ?auto_463227 ?auto_463230 ) ) ( not ( = ?auto_463227 ?auto_463231 ) ) ( not ( = ?auto_463227 ?auto_463232 ) ) ( not ( = ?auto_463227 ?auto_463233 ) ) ( not ( = ?auto_463227 ?auto_463234 ) ) ( not ( = ?auto_463227 ?auto_463235 ) ) ( not ( = ?auto_463227 ?auto_463236 ) ) ( not ( = ?auto_463227 ?auto_463237 ) ) ( not ( = ?auto_463227 ?auto_463238 ) ) ( not ( = ?auto_463227 ?auto_463239 ) ) ( not ( = ?auto_463228 ?auto_463229 ) ) ( not ( = ?auto_463228 ?auto_463230 ) ) ( not ( = ?auto_463228 ?auto_463231 ) ) ( not ( = ?auto_463228 ?auto_463232 ) ) ( not ( = ?auto_463228 ?auto_463233 ) ) ( not ( = ?auto_463228 ?auto_463234 ) ) ( not ( = ?auto_463228 ?auto_463235 ) ) ( not ( = ?auto_463228 ?auto_463236 ) ) ( not ( = ?auto_463228 ?auto_463237 ) ) ( not ( = ?auto_463228 ?auto_463238 ) ) ( not ( = ?auto_463228 ?auto_463239 ) ) ( not ( = ?auto_463229 ?auto_463230 ) ) ( not ( = ?auto_463229 ?auto_463231 ) ) ( not ( = ?auto_463229 ?auto_463232 ) ) ( not ( = ?auto_463229 ?auto_463233 ) ) ( not ( = ?auto_463229 ?auto_463234 ) ) ( not ( = ?auto_463229 ?auto_463235 ) ) ( not ( = ?auto_463229 ?auto_463236 ) ) ( not ( = ?auto_463229 ?auto_463237 ) ) ( not ( = ?auto_463229 ?auto_463238 ) ) ( not ( = ?auto_463229 ?auto_463239 ) ) ( not ( = ?auto_463230 ?auto_463231 ) ) ( not ( = ?auto_463230 ?auto_463232 ) ) ( not ( = ?auto_463230 ?auto_463233 ) ) ( not ( = ?auto_463230 ?auto_463234 ) ) ( not ( = ?auto_463230 ?auto_463235 ) ) ( not ( = ?auto_463230 ?auto_463236 ) ) ( not ( = ?auto_463230 ?auto_463237 ) ) ( not ( = ?auto_463230 ?auto_463238 ) ) ( not ( = ?auto_463230 ?auto_463239 ) ) ( not ( = ?auto_463231 ?auto_463232 ) ) ( not ( = ?auto_463231 ?auto_463233 ) ) ( not ( = ?auto_463231 ?auto_463234 ) ) ( not ( = ?auto_463231 ?auto_463235 ) ) ( not ( = ?auto_463231 ?auto_463236 ) ) ( not ( = ?auto_463231 ?auto_463237 ) ) ( not ( = ?auto_463231 ?auto_463238 ) ) ( not ( = ?auto_463231 ?auto_463239 ) ) ( not ( = ?auto_463232 ?auto_463233 ) ) ( not ( = ?auto_463232 ?auto_463234 ) ) ( not ( = ?auto_463232 ?auto_463235 ) ) ( not ( = ?auto_463232 ?auto_463236 ) ) ( not ( = ?auto_463232 ?auto_463237 ) ) ( not ( = ?auto_463232 ?auto_463238 ) ) ( not ( = ?auto_463232 ?auto_463239 ) ) ( not ( = ?auto_463233 ?auto_463234 ) ) ( not ( = ?auto_463233 ?auto_463235 ) ) ( not ( = ?auto_463233 ?auto_463236 ) ) ( not ( = ?auto_463233 ?auto_463237 ) ) ( not ( = ?auto_463233 ?auto_463238 ) ) ( not ( = ?auto_463233 ?auto_463239 ) ) ( not ( = ?auto_463234 ?auto_463235 ) ) ( not ( = ?auto_463234 ?auto_463236 ) ) ( not ( = ?auto_463234 ?auto_463237 ) ) ( not ( = ?auto_463234 ?auto_463238 ) ) ( not ( = ?auto_463234 ?auto_463239 ) ) ( not ( = ?auto_463235 ?auto_463236 ) ) ( not ( = ?auto_463235 ?auto_463237 ) ) ( not ( = ?auto_463235 ?auto_463238 ) ) ( not ( = ?auto_463235 ?auto_463239 ) ) ( not ( = ?auto_463236 ?auto_463237 ) ) ( not ( = ?auto_463236 ?auto_463238 ) ) ( not ( = ?auto_463236 ?auto_463239 ) ) ( not ( = ?auto_463237 ?auto_463238 ) ) ( not ( = ?auto_463237 ?auto_463239 ) ) ( not ( = ?auto_463238 ?auto_463239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_463238 ?auto_463239 )
      ( !STACK ?auto_463238 ?auto_463237 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463254 - BLOCK
      ?auto_463255 - BLOCK
      ?auto_463256 - BLOCK
      ?auto_463257 - BLOCK
      ?auto_463258 - BLOCK
      ?auto_463259 - BLOCK
      ?auto_463260 - BLOCK
      ?auto_463261 - BLOCK
      ?auto_463262 - BLOCK
      ?auto_463263 - BLOCK
      ?auto_463264 - BLOCK
      ?auto_463265 - BLOCK
      ?auto_463266 - BLOCK
      ?auto_463267 - BLOCK
    )
    :vars
    (
      ?auto_463268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463267 ?auto_463268 ) ( ON-TABLE ?auto_463254 ) ( ON ?auto_463255 ?auto_463254 ) ( ON ?auto_463256 ?auto_463255 ) ( ON ?auto_463257 ?auto_463256 ) ( ON ?auto_463258 ?auto_463257 ) ( ON ?auto_463259 ?auto_463258 ) ( ON ?auto_463260 ?auto_463259 ) ( ON ?auto_463261 ?auto_463260 ) ( ON ?auto_463262 ?auto_463261 ) ( ON ?auto_463263 ?auto_463262 ) ( ON ?auto_463264 ?auto_463263 ) ( ON ?auto_463265 ?auto_463264 ) ( not ( = ?auto_463254 ?auto_463255 ) ) ( not ( = ?auto_463254 ?auto_463256 ) ) ( not ( = ?auto_463254 ?auto_463257 ) ) ( not ( = ?auto_463254 ?auto_463258 ) ) ( not ( = ?auto_463254 ?auto_463259 ) ) ( not ( = ?auto_463254 ?auto_463260 ) ) ( not ( = ?auto_463254 ?auto_463261 ) ) ( not ( = ?auto_463254 ?auto_463262 ) ) ( not ( = ?auto_463254 ?auto_463263 ) ) ( not ( = ?auto_463254 ?auto_463264 ) ) ( not ( = ?auto_463254 ?auto_463265 ) ) ( not ( = ?auto_463254 ?auto_463266 ) ) ( not ( = ?auto_463254 ?auto_463267 ) ) ( not ( = ?auto_463254 ?auto_463268 ) ) ( not ( = ?auto_463255 ?auto_463256 ) ) ( not ( = ?auto_463255 ?auto_463257 ) ) ( not ( = ?auto_463255 ?auto_463258 ) ) ( not ( = ?auto_463255 ?auto_463259 ) ) ( not ( = ?auto_463255 ?auto_463260 ) ) ( not ( = ?auto_463255 ?auto_463261 ) ) ( not ( = ?auto_463255 ?auto_463262 ) ) ( not ( = ?auto_463255 ?auto_463263 ) ) ( not ( = ?auto_463255 ?auto_463264 ) ) ( not ( = ?auto_463255 ?auto_463265 ) ) ( not ( = ?auto_463255 ?auto_463266 ) ) ( not ( = ?auto_463255 ?auto_463267 ) ) ( not ( = ?auto_463255 ?auto_463268 ) ) ( not ( = ?auto_463256 ?auto_463257 ) ) ( not ( = ?auto_463256 ?auto_463258 ) ) ( not ( = ?auto_463256 ?auto_463259 ) ) ( not ( = ?auto_463256 ?auto_463260 ) ) ( not ( = ?auto_463256 ?auto_463261 ) ) ( not ( = ?auto_463256 ?auto_463262 ) ) ( not ( = ?auto_463256 ?auto_463263 ) ) ( not ( = ?auto_463256 ?auto_463264 ) ) ( not ( = ?auto_463256 ?auto_463265 ) ) ( not ( = ?auto_463256 ?auto_463266 ) ) ( not ( = ?auto_463256 ?auto_463267 ) ) ( not ( = ?auto_463256 ?auto_463268 ) ) ( not ( = ?auto_463257 ?auto_463258 ) ) ( not ( = ?auto_463257 ?auto_463259 ) ) ( not ( = ?auto_463257 ?auto_463260 ) ) ( not ( = ?auto_463257 ?auto_463261 ) ) ( not ( = ?auto_463257 ?auto_463262 ) ) ( not ( = ?auto_463257 ?auto_463263 ) ) ( not ( = ?auto_463257 ?auto_463264 ) ) ( not ( = ?auto_463257 ?auto_463265 ) ) ( not ( = ?auto_463257 ?auto_463266 ) ) ( not ( = ?auto_463257 ?auto_463267 ) ) ( not ( = ?auto_463257 ?auto_463268 ) ) ( not ( = ?auto_463258 ?auto_463259 ) ) ( not ( = ?auto_463258 ?auto_463260 ) ) ( not ( = ?auto_463258 ?auto_463261 ) ) ( not ( = ?auto_463258 ?auto_463262 ) ) ( not ( = ?auto_463258 ?auto_463263 ) ) ( not ( = ?auto_463258 ?auto_463264 ) ) ( not ( = ?auto_463258 ?auto_463265 ) ) ( not ( = ?auto_463258 ?auto_463266 ) ) ( not ( = ?auto_463258 ?auto_463267 ) ) ( not ( = ?auto_463258 ?auto_463268 ) ) ( not ( = ?auto_463259 ?auto_463260 ) ) ( not ( = ?auto_463259 ?auto_463261 ) ) ( not ( = ?auto_463259 ?auto_463262 ) ) ( not ( = ?auto_463259 ?auto_463263 ) ) ( not ( = ?auto_463259 ?auto_463264 ) ) ( not ( = ?auto_463259 ?auto_463265 ) ) ( not ( = ?auto_463259 ?auto_463266 ) ) ( not ( = ?auto_463259 ?auto_463267 ) ) ( not ( = ?auto_463259 ?auto_463268 ) ) ( not ( = ?auto_463260 ?auto_463261 ) ) ( not ( = ?auto_463260 ?auto_463262 ) ) ( not ( = ?auto_463260 ?auto_463263 ) ) ( not ( = ?auto_463260 ?auto_463264 ) ) ( not ( = ?auto_463260 ?auto_463265 ) ) ( not ( = ?auto_463260 ?auto_463266 ) ) ( not ( = ?auto_463260 ?auto_463267 ) ) ( not ( = ?auto_463260 ?auto_463268 ) ) ( not ( = ?auto_463261 ?auto_463262 ) ) ( not ( = ?auto_463261 ?auto_463263 ) ) ( not ( = ?auto_463261 ?auto_463264 ) ) ( not ( = ?auto_463261 ?auto_463265 ) ) ( not ( = ?auto_463261 ?auto_463266 ) ) ( not ( = ?auto_463261 ?auto_463267 ) ) ( not ( = ?auto_463261 ?auto_463268 ) ) ( not ( = ?auto_463262 ?auto_463263 ) ) ( not ( = ?auto_463262 ?auto_463264 ) ) ( not ( = ?auto_463262 ?auto_463265 ) ) ( not ( = ?auto_463262 ?auto_463266 ) ) ( not ( = ?auto_463262 ?auto_463267 ) ) ( not ( = ?auto_463262 ?auto_463268 ) ) ( not ( = ?auto_463263 ?auto_463264 ) ) ( not ( = ?auto_463263 ?auto_463265 ) ) ( not ( = ?auto_463263 ?auto_463266 ) ) ( not ( = ?auto_463263 ?auto_463267 ) ) ( not ( = ?auto_463263 ?auto_463268 ) ) ( not ( = ?auto_463264 ?auto_463265 ) ) ( not ( = ?auto_463264 ?auto_463266 ) ) ( not ( = ?auto_463264 ?auto_463267 ) ) ( not ( = ?auto_463264 ?auto_463268 ) ) ( not ( = ?auto_463265 ?auto_463266 ) ) ( not ( = ?auto_463265 ?auto_463267 ) ) ( not ( = ?auto_463265 ?auto_463268 ) ) ( not ( = ?auto_463266 ?auto_463267 ) ) ( not ( = ?auto_463266 ?auto_463268 ) ) ( not ( = ?auto_463267 ?auto_463268 ) ) ( CLEAR ?auto_463265 ) ( ON ?auto_463266 ?auto_463267 ) ( CLEAR ?auto_463266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_463254 ?auto_463255 ?auto_463256 ?auto_463257 ?auto_463258 ?auto_463259 ?auto_463260 ?auto_463261 ?auto_463262 ?auto_463263 ?auto_463264 ?auto_463265 ?auto_463266 )
      ( MAKE-14PILE ?auto_463254 ?auto_463255 ?auto_463256 ?auto_463257 ?auto_463258 ?auto_463259 ?auto_463260 ?auto_463261 ?auto_463262 ?auto_463263 ?auto_463264 ?auto_463265 ?auto_463266 ?auto_463267 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463283 - BLOCK
      ?auto_463284 - BLOCK
      ?auto_463285 - BLOCK
      ?auto_463286 - BLOCK
      ?auto_463287 - BLOCK
      ?auto_463288 - BLOCK
      ?auto_463289 - BLOCK
      ?auto_463290 - BLOCK
      ?auto_463291 - BLOCK
      ?auto_463292 - BLOCK
      ?auto_463293 - BLOCK
      ?auto_463294 - BLOCK
      ?auto_463295 - BLOCK
      ?auto_463296 - BLOCK
    )
    :vars
    (
      ?auto_463297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463296 ?auto_463297 ) ( ON-TABLE ?auto_463283 ) ( ON ?auto_463284 ?auto_463283 ) ( ON ?auto_463285 ?auto_463284 ) ( ON ?auto_463286 ?auto_463285 ) ( ON ?auto_463287 ?auto_463286 ) ( ON ?auto_463288 ?auto_463287 ) ( ON ?auto_463289 ?auto_463288 ) ( ON ?auto_463290 ?auto_463289 ) ( ON ?auto_463291 ?auto_463290 ) ( ON ?auto_463292 ?auto_463291 ) ( ON ?auto_463293 ?auto_463292 ) ( ON ?auto_463294 ?auto_463293 ) ( not ( = ?auto_463283 ?auto_463284 ) ) ( not ( = ?auto_463283 ?auto_463285 ) ) ( not ( = ?auto_463283 ?auto_463286 ) ) ( not ( = ?auto_463283 ?auto_463287 ) ) ( not ( = ?auto_463283 ?auto_463288 ) ) ( not ( = ?auto_463283 ?auto_463289 ) ) ( not ( = ?auto_463283 ?auto_463290 ) ) ( not ( = ?auto_463283 ?auto_463291 ) ) ( not ( = ?auto_463283 ?auto_463292 ) ) ( not ( = ?auto_463283 ?auto_463293 ) ) ( not ( = ?auto_463283 ?auto_463294 ) ) ( not ( = ?auto_463283 ?auto_463295 ) ) ( not ( = ?auto_463283 ?auto_463296 ) ) ( not ( = ?auto_463283 ?auto_463297 ) ) ( not ( = ?auto_463284 ?auto_463285 ) ) ( not ( = ?auto_463284 ?auto_463286 ) ) ( not ( = ?auto_463284 ?auto_463287 ) ) ( not ( = ?auto_463284 ?auto_463288 ) ) ( not ( = ?auto_463284 ?auto_463289 ) ) ( not ( = ?auto_463284 ?auto_463290 ) ) ( not ( = ?auto_463284 ?auto_463291 ) ) ( not ( = ?auto_463284 ?auto_463292 ) ) ( not ( = ?auto_463284 ?auto_463293 ) ) ( not ( = ?auto_463284 ?auto_463294 ) ) ( not ( = ?auto_463284 ?auto_463295 ) ) ( not ( = ?auto_463284 ?auto_463296 ) ) ( not ( = ?auto_463284 ?auto_463297 ) ) ( not ( = ?auto_463285 ?auto_463286 ) ) ( not ( = ?auto_463285 ?auto_463287 ) ) ( not ( = ?auto_463285 ?auto_463288 ) ) ( not ( = ?auto_463285 ?auto_463289 ) ) ( not ( = ?auto_463285 ?auto_463290 ) ) ( not ( = ?auto_463285 ?auto_463291 ) ) ( not ( = ?auto_463285 ?auto_463292 ) ) ( not ( = ?auto_463285 ?auto_463293 ) ) ( not ( = ?auto_463285 ?auto_463294 ) ) ( not ( = ?auto_463285 ?auto_463295 ) ) ( not ( = ?auto_463285 ?auto_463296 ) ) ( not ( = ?auto_463285 ?auto_463297 ) ) ( not ( = ?auto_463286 ?auto_463287 ) ) ( not ( = ?auto_463286 ?auto_463288 ) ) ( not ( = ?auto_463286 ?auto_463289 ) ) ( not ( = ?auto_463286 ?auto_463290 ) ) ( not ( = ?auto_463286 ?auto_463291 ) ) ( not ( = ?auto_463286 ?auto_463292 ) ) ( not ( = ?auto_463286 ?auto_463293 ) ) ( not ( = ?auto_463286 ?auto_463294 ) ) ( not ( = ?auto_463286 ?auto_463295 ) ) ( not ( = ?auto_463286 ?auto_463296 ) ) ( not ( = ?auto_463286 ?auto_463297 ) ) ( not ( = ?auto_463287 ?auto_463288 ) ) ( not ( = ?auto_463287 ?auto_463289 ) ) ( not ( = ?auto_463287 ?auto_463290 ) ) ( not ( = ?auto_463287 ?auto_463291 ) ) ( not ( = ?auto_463287 ?auto_463292 ) ) ( not ( = ?auto_463287 ?auto_463293 ) ) ( not ( = ?auto_463287 ?auto_463294 ) ) ( not ( = ?auto_463287 ?auto_463295 ) ) ( not ( = ?auto_463287 ?auto_463296 ) ) ( not ( = ?auto_463287 ?auto_463297 ) ) ( not ( = ?auto_463288 ?auto_463289 ) ) ( not ( = ?auto_463288 ?auto_463290 ) ) ( not ( = ?auto_463288 ?auto_463291 ) ) ( not ( = ?auto_463288 ?auto_463292 ) ) ( not ( = ?auto_463288 ?auto_463293 ) ) ( not ( = ?auto_463288 ?auto_463294 ) ) ( not ( = ?auto_463288 ?auto_463295 ) ) ( not ( = ?auto_463288 ?auto_463296 ) ) ( not ( = ?auto_463288 ?auto_463297 ) ) ( not ( = ?auto_463289 ?auto_463290 ) ) ( not ( = ?auto_463289 ?auto_463291 ) ) ( not ( = ?auto_463289 ?auto_463292 ) ) ( not ( = ?auto_463289 ?auto_463293 ) ) ( not ( = ?auto_463289 ?auto_463294 ) ) ( not ( = ?auto_463289 ?auto_463295 ) ) ( not ( = ?auto_463289 ?auto_463296 ) ) ( not ( = ?auto_463289 ?auto_463297 ) ) ( not ( = ?auto_463290 ?auto_463291 ) ) ( not ( = ?auto_463290 ?auto_463292 ) ) ( not ( = ?auto_463290 ?auto_463293 ) ) ( not ( = ?auto_463290 ?auto_463294 ) ) ( not ( = ?auto_463290 ?auto_463295 ) ) ( not ( = ?auto_463290 ?auto_463296 ) ) ( not ( = ?auto_463290 ?auto_463297 ) ) ( not ( = ?auto_463291 ?auto_463292 ) ) ( not ( = ?auto_463291 ?auto_463293 ) ) ( not ( = ?auto_463291 ?auto_463294 ) ) ( not ( = ?auto_463291 ?auto_463295 ) ) ( not ( = ?auto_463291 ?auto_463296 ) ) ( not ( = ?auto_463291 ?auto_463297 ) ) ( not ( = ?auto_463292 ?auto_463293 ) ) ( not ( = ?auto_463292 ?auto_463294 ) ) ( not ( = ?auto_463292 ?auto_463295 ) ) ( not ( = ?auto_463292 ?auto_463296 ) ) ( not ( = ?auto_463292 ?auto_463297 ) ) ( not ( = ?auto_463293 ?auto_463294 ) ) ( not ( = ?auto_463293 ?auto_463295 ) ) ( not ( = ?auto_463293 ?auto_463296 ) ) ( not ( = ?auto_463293 ?auto_463297 ) ) ( not ( = ?auto_463294 ?auto_463295 ) ) ( not ( = ?auto_463294 ?auto_463296 ) ) ( not ( = ?auto_463294 ?auto_463297 ) ) ( not ( = ?auto_463295 ?auto_463296 ) ) ( not ( = ?auto_463295 ?auto_463297 ) ) ( not ( = ?auto_463296 ?auto_463297 ) ) ( CLEAR ?auto_463294 ) ( ON ?auto_463295 ?auto_463296 ) ( CLEAR ?auto_463295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_463283 ?auto_463284 ?auto_463285 ?auto_463286 ?auto_463287 ?auto_463288 ?auto_463289 ?auto_463290 ?auto_463291 ?auto_463292 ?auto_463293 ?auto_463294 ?auto_463295 )
      ( MAKE-14PILE ?auto_463283 ?auto_463284 ?auto_463285 ?auto_463286 ?auto_463287 ?auto_463288 ?auto_463289 ?auto_463290 ?auto_463291 ?auto_463292 ?auto_463293 ?auto_463294 ?auto_463295 ?auto_463296 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463312 - BLOCK
      ?auto_463313 - BLOCK
      ?auto_463314 - BLOCK
      ?auto_463315 - BLOCK
      ?auto_463316 - BLOCK
      ?auto_463317 - BLOCK
      ?auto_463318 - BLOCK
      ?auto_463319 - BLOCK
      ?auto_463320 - BLOCK
      ?auto_463321 - BLOCK
      ?auto_463322 - BLOCK
      ?auto_463323 - BLOCK
      ?auto_463324 - BLOCK
      ?auto_463325 - BLOCK
    )
    :vars
    (
      ?auto_463326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463325 ?auto_463326 ) ( ON-TABLE ?auto_463312 ) ( ON ?auto_463313 ?auto_463312 ) ( ON ?auto_463314 ?auto_463313 ) ( ON ?auto_463315 ?auto_463314 ) ( ON ?auto_463316 ?auto_463315 ) ( ON ?auto_463317 ?auto_463316 ) ( ON ?auto_463318 ?auto_463317 ) ( ON ?auto_463319 ?auto_463318 ) ( ON ?auto_463320 ?auto_463319 ) ( ON ?auto_463321 ?auto_463320 ) ( ON ?auto_463322 ?auto_463321 ) ( not ( = ?auto_463312 ?auto_463313 ) ) ( not ( = ?auto_463312 ?auto_463314 ) ) ( not ( = ?auto_463312 ?auto_463315 ) ) ( not ( = ?auto_463312 ?auto_463316 ) ) ( not ( = ?auto_463312 ?auto_463317 ) ) ( not ( = ?auto_463312 ?auto_463318 ) ) ( not ( = ?auto_463312 ?auto_463319 ) ) ( not ( = ?auto_463312 ?auto_463320 ) ) ( not ( = ?auto_463312 ?auto_463321 ) ) ( not ( = ?auto_463312 ?auto_463322 ) ) ( not ( = ?auto_463312 ?auto_463323 ) ) ( not ( = ?auto_463312 ?auto_463324 ) ) ( not ( = ?auto_463312 ?auto_463325 ) ) ( not ( = ?auto_463312 ?auto_463326 ) ) ( not ( = ?auto_463313 ?auto_463314 ) ) ( not ( = ?auto_463313 ?auto_463315 ) ) ( not ( = ?auto_463313 ?auto_463316 ) ) ( not ( = ?auto_463313 ?auto_463317 ) ) ( not ( = ?auto_463313 ?auto_463318 ) ) ( not ( = ?auto_463313 ?auto_463319 ) ) ( not ( = ?auto_463313 ?auto_463320 ) ) ( not ( = ?auto_463313 ?auto_463321 ) ) ( not ( = ?auto_463313 ?auto_463322 ) ) ( not ( = ?auto_463313 ?auto_463323 ) ) ( not ( = ?auto_463313 ?auto_463324 ) ) ( not ( = ?auto_463313 ?auto_463325 ) ) ( not ( = ?auto_463313 ?auto_463326 ) ) ( not ( = ?auto_463314 ?auto_463315 ) ) ( not ( = ?auto_463314 ?auto_463316 ) ) ( not ( = ?auto_463314 ?auto_463317 ) ) ( not ( = ?auto_463314 ?auto_463318 ) ) ( not ( = ?auto_463314 ?auto_463319 ) ) ( not ( = ?auto_463314 ?auto_463320 ) ) ( not ( = ?auto_463314 ?auto_463321 ) ) ( not ( = ?auto_463314 ?auto_463322 ) ) ( not ( = ?auto_463314 ?auto_463323 ) ) ( not ( = ?auto_463314 ?auto_463324 ) ) ( not ( = ?auto_463314 ?auto_463325 ) ) ( not ( = ?auto_463314 ?auto_463326 ) ) ( not ( = ?auto_463315 ?auto_463316 ) ) ( not ( = ?auto_463315 ?auto_463317 ) ) ( not ( = ?auto_463315 ?auto_463318 ) ) ( not ( = ?auto_463315 ?auto_463319 ) ) ( not ( = ?auto_463315 ?auto_463320 ) ) ( not ( = ?auto_463315 ?auto_463321 ) ) ( not ( = ?auto_463315 ?auto_463322 ) ) ( not ( = ?auto_463315 ?auto_463323 ) ) ( not ( = ?auto_463315 ?auto_463324 ) ) ( not ( = ?auto_463315 ?auto_463325 ) ) ( not ( = ?auto_463315 ?auto_463326 ) ) ( not ( = ?auto_463316 ?auto_463317 ) ) ( not ( = ?auto_463316 ?auto_463318 ) ) ( not ( = ?auto_463316 ?auto_463319 ) ) ( not ( = ?auto_463316 ?auto_463320 ) ) ( not ( = ?auto_463316 ?auto_463321 ) ) ( not ( = ?auto_463316 ?auto_463322 ) ) ( not ( = ?auto_463316 ?auto_463323 ) ) ( not ( = ?auto_463316 ?auto_463324 ) ) ( not ( = ?auto_463316 ?auto_463325 ) ) ( not ( = ?auto_463316 ?auto_463326 ) ) ( not ( = ?auto_463317 ?auto_463318 ) ) ( not ( = ?auto_463317 ?auto_463319 ) ) ( not ( = ?auto_463317 ?auto_463320 ) ) ( not ( = ?auto_463317 ?auto_463321 ) ) ( not ( = ?auto_463317 ?auto_463322 ) ) ( not ( = ?auto_463317 ?auto_463323 ) ) ( not ( = ?auto_463317 ?auto_463324 ) ) ( not ( = ?auto_463317 ?auto_463325 ) ) ( not ( = ?auto_463317 ?auto_463326 ) ) ( not ( = ?auto_463318 ?auto_463319 ) ) ( not ( = ?auto_463318 ?auto_463320 ) ) ( not ( = ?auto_463318 ?auto_463321 ) ) ( not ( = ?auto_463318 ?auto_463322 ) ) ( not ( = ?auto_463318 ?auto_463323 ) ) ( not ( = ?auto_463318 ?auto_463324 ) ) ( not ( = ?auto_463318 ?auto_463325 ) ) ( not ( = ?auto_463318 ?auto_463326 ) ) ( not ( = ?auto_463319 ?auto_463320 ) ) ( not ( = ?auto_463319 ?auto_463321 ) ) ( not ( = ?auto_463319 ?auto_463322 ) ) ( not ( = ?auto_463319 ?auto_463323 ) ) ( not ( = ?auto_463319 ?auto_463324 ) ) ( not ( = ?auto_463319 ?auto_463325 ) ) ( not ( = ?auto_463319 ?auto_463326 ) ) ( not ( = ?auto_463320 ?auto_463321 ) ) ( not ( = ?auto_463320 ?auto_463322 ) ) ( not ( = ?auto_463320 ?auto_463323 ) ) ( not ( = ?auto_463320 ?auto_463324 ) ) ( not ( = ?auto_463320 ?auto_463325 ) ) ( not ( = ?auto_463320 ?auto_463326 ) ) ( not ( = ?auto_463321 ?auto_463322 ) ) ( not ( = ?auto_463321 ?auto_463323 ) ) ( not ( = ?auto_463321 ?auto_463324 ) ) ( not ( = ?auto_463321 ?auto_463325 ) ) ( not ( = ?auto_463321 ?auto_463326 ) ) ( not ( = ?auto_463322 ?auto_463323 ) ) ( not ( = ?auto_463322 ?auto_463324 ) ) ( not ( = ?auto_463322 ?auto_463325 ) ) ( not ( = ?auto_463322 ?auto_463326 ) ) ( not ( = ?auto_463323 ?auto_463324 ) ) ( not ( = ?auto_463323 ?auto_463325 ) ) ( not ( = ?auto_463323 ?auto_463326 ) ) ( not ( = ?auto_463324 ?auto_463325 ) ) ( not ( = ?auto_463324 ?auto_463326 ) ) ( not ( = ?auto_463325 ?auto_463326 ) ) ( ON ?auto_463324 ?auto_463325 ) ( CLEAR ?auto_463322 ) ( ON ?auto_463323 ?auto_463324 ) ( CLEAR ?auto_463323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_463312 ?auto_463313 ?auto_463314 ?auto_463315 ?auto_463316 ?auto_463317 ?auto_463318 ?auto_463319 ?auto_463320 ?auto_463321 ?auto_463322 ?auto_463323 )
      ( MAKE-14PILE ?auto_463312 ?auto_463313 ?auto_463314 ?auto_463315 ?auto_463316 ?auto_463317 ?auto_463318 ?auto_463319 ?auto_463320 ?auto_463321 ?auto_463322 ?auto_463323 ?auto_463324 ?auto_463325 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463341 - BLOCK
      ?auto_463342 - BLOCK
      ?auto_463343 - BLOCK
      ?auto_463344 - BLOCK
      ?auto_463345 - BLOCK
      ?auto_463346 - BLOCK
      ?auto_463347 - BLOCK
      ?auto_463348 - BLOCK
      ?auto_463349 - BLOCK
      ?auto_463350 - BLOCK
      ?auto_463351 - BLOCK
      ?auto_463352 - BLOCK
      ?auto_463353 - BLOCK
      ?auto_463354 - BLOCK
    )
    :vars
    (
      ?auto_463355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463354 ?auto_463355 ) ( ON-TABLE ?auto_463341 ) ( ON ?auto_463342 ?auto_463341 ) ( ON ?auto_463343 ?auto_463342 ) ( ON ?auto_463344 ?auto_463343 ) ( ON ?auto_463345 ?auto_463344 ) ( ON ?auto_463346 ?auto_463345 ) ( ON ?auto_463347 ?auto_463346 ) ( ON ?auto_463348 ?auto_463347 ) ( ON ?auto_463349 ?auto_463348 ) ( ON ?auto_463350 ?auto_463349 ) ( ON ?auto_463351 ?auto_463350 ) ( not ( = ?auto_463341 ?auto_463342 ) ) ( not ( = ?auto_463341 ?auto_463343 ) ) ( not ( = ?auto_463341 ?auto_463344 ) ) ( not ( = ?auto_463341 ?auto_463345 ) ) ( not ( = ?auto_463341 ?auto_463346 ) ) ( not ( = ?auto_463341 ?auto_463347 ) ) ( not ( = ?auto_463341 ?auto_463348 ) ) ( not ( = ?auto_463341 ?auto_463349 ) ) ( not ( = ?auto_463341 ?auto_463350 ) ) ( not ( = ?auto_463341 ?auto_463351 ) ) ( not ( = ?auto_463341 ?auto_463352 ) ) ( not ( = ?auto_463341 ?auto_463353 ) ) ( not ( = ?auto_463341 ?auto_463354 ) ) ( not ( = ?auto_463341 ?auto_463355 ) ) ( not ( = ?auto_463342 ?auto_463343 ) ) ( not ( = ?auto_463342 ?auto_463344 ) ) ( not ( = ?auto_463342 ?auto_463345 ) ) ( not ( = ?auto_463342 ?auto_463346 ) ) ( not ( = ?auto_463342 ?auto_463347 ) ) ( not ( = ?auto_463342 ?auto_463348 ) ) ( not ( = ?auto_463342 ?auto_463349 ) ) ( not ( = ?auto_463342 ?auto_463350 ) ) ( not ( = ?auto_463342 ?auto_463351 ) ) ( not ( = ?auto_463342 ?auto_463352 ) ) ( not ( = ?auto_463342 ?auto_463353 ) ) ( not ( = ?auto_463342 ?auto_463354 ) ) ( not ( = ?auto_463342 ?auto_463355 ) ) ( not ( = ?auto_463343 ?auto_463344 ) ) ( not ( = ?auto_463343 ?auto_463345 ) ) ( not ( = ?auto_463343 ?auto_463346 ) ) ( not ( = ?auto_463343 ?auto_463347 ) ) ( not ( = ?auto_463343 ?auto_463348 ) ) ( not ( = ?auto_463343 ?auto_463349 ) ) ( not ( = ?auto_463343 ?auto_463350 ) ) ( not ( = ?auto_463343 ?auto_463351 ) ) ( not ( = ?auto_463343 ?auto_463352 ) ) ( not ( = ?auto_463343 ?auto_463353 ) ) ( not ( = ?auto_463343 ?auto_463354 ) ) ( not ( = ?auto_463343 ?auto_463355 ) ) ( not ( = ?auto_463344 ?auto_463345 ) ) ( not ( = ?auto_463344 ?auto_463346 ) ) ( not ( = ?auto_463344 ?auto_463347 ) ) ( not ( = ?auto_463344 ?auto_463348 ) ) ( not ( = ?auto_463344 ?auto_463349 ) ) ( not ( = ?auto_463344 ?auto_463350 ) ) ( not ( = ?auto_463344 ?auto_463351 ) ) ( not ( = ?auto_463344 ?auto_463352 ) ) ( not ( = ?auto_463344 ?auto_463353 ) ) ( not ( = ?auto_463344 ?auto_463354 ) ) ( not ( = ?auto_463344 ?auto_463355 ) ) ( not ( = ?auto_463345 ?auto_463346 ) ) ( not ( = ?auto_463345 ?auto_463347 ) ) ( not ( = ?auto_463345 ?auto_463348 ) ) ( not ( = ?auto_463345 ?auto_463349 ) ) ( not ( = ?auto_463345 ?auto_463350 ) ) ( not ( = ?auto_463345 ?auto_463351 ) ) ( not ( = ?auto_463345 ?auto_463352 ) ) ( not ( = ?auto_463345 ?auto_463353 ) ) ( not ( = ?auto_463345 ?auto_463354 ) ) ( not ( = ?auto_463345 ?auto_463355 ) ) ( not ( = ?auto_463346 ?auto_463347 ) ) ( not ( = ?auto_463346 ?auto_463348 ) ) ( not ( = ?auto_463346 ?auto_463349 ) ) ( not ( = ?auto_463346 ?auto_463350 ) ) ( not ( = ?auto_463346 ?auto_463351 ) ) ( not ( = ?auto_463346 ?auto_463352 ) ) ( not ( = ?auto_463346 ?auto_463353 ) ) ( not ( = ?auto_463346 ?auto_463354 ) ) ( not ( = ?auto_463346 ?auto_463355 ) ) ( not ( = ?auto_463347 ?auto_463348 ) ) ( not ( = ?auto_463347 ?auto_463349 ) ) ( not ( = ?auto_463347 ?auto_463350 ) ) ( not ( = ?auto_463347 ?auto_463351 ) ) ( not ( = ?auto_463347 ?auto_463352 ) ) ( not ( = ?auto_463347 ?auto_463353 ) ) ( not ( = ?auto_463347 ?auto_463354 ) ) ( not ( = ?auto_463347 ?auto_463355 ) ) ( not ( = ?auto_463348 ?auto_463349 ) ) ( not ( = ?auto_463348 ?auto_463350 ) ) ( not ( = ?auto_463348 ?auto_463351 ) ) ( not ( = ?auto_463348 ?auto_463352 ) ) ( not ( = ?auto_463348 ?auto_463353 ) ) ( not ( = ?auto_463348 ?auto_463354 ) ) ( not ( = ?auto_463348 ?auto_463355 ) ) ( not ( = ?auto_463349 ?auto_463350 ) ) ( not ( = ?auto_463349 ?auto_463351 ) ) ( not ( = ?auto_463349 ?auto_463352 ) ) ( not ( = ?auto_463349 ?auto_463353 ) ) ( not ( = ?auto_463349 ?auto_463354 ) ) ( not ( = ?auto_463349 ?auto_463355 ) ) ( not ( = ?auto_463350 ?auto_463351 ) ) ( not ( = ?auto_463350 ?auto_463352 ) ) ( not ( = ?auto_463350 ?auto_463353 ) ) ( not ( = ?auto_463350 ?auto_463354 ) ) ( not ( = ?auto_463350 ?auto_463355 ) ) ( not ( = ?auto_463351 ?auto_463352 ) ) ( not ( = ?auto_463351 ?auto_463353 ) ) ( not ( = ?auto_463351 ?auto_463354 ) ) ( not ( = ?auto_463351 ?auto_463355 ) ) ( not ( = ?auto_463352 ?auto_463353 ) ) ( not ( = ?auto_463352 ?auto_463354 ) ) ( not ( = ?auto_463352 ?auto_463355 ) ) ( not ( = ?auto_463353 ?auto_463354 ) ) ( not ( = ?auto_463353 ?auto_463355 ) ) ( not ( = ?auto_463354 ?auto_463355 ) ) ( ON ?auto_463353 ?auto_463354 ) ( CLEAR ?auto_463351 ) ( ON ?auto_463352 ?auto_463353 ) ( CLEAR ?auto_463352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_463341 ?auto_463342 ?auto_463343 ?auto_463344 ?auto_463345 ?auto_463346 ?auto_463347 ?auto_463348 ?auto_463349 ?auto_463350 ?auto_463351 ?auto_463352 )
      ( MAKE-14PILE ?auto_463341 ?auto_463342 ?auto_463343 ?auto_463344 ?auto_463345 ?auto_463346 ?auto_463347 ?auto_463348 ?auto_463349 ?auto_463350 ?auto_463351 ?auto_463352 ?auto_463353 ?auto_463354 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463370 - BLOCK
      ?auto_463371 - BLOCK
      ?auto_463372 - BLOCK
      ?auto_463373 - BLOCK
      ?auto_463374 - BLOCK
      ?auto_463375 - BLOCK
      ?auto_463376 - BLOCK
      ?auto_463377 - BLOCK
      ?auto_463378 - BLOCK
      ?auto_463379 - BLOCK
      ?auto_463380 - BLOCK
      ?auto_463381 - BLOCK
      ?auto_463382 - BLOCK
      ?auto_463383 - BLOCK
    )
    :vars
    (
      ?auto_463384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463383 ?auto_463384 ) ( ON-TABLE ?auto_463370 ) ( ON ?auto_463371 ?auto_463370 ) ( ON ?auto_463372 ?auto_463371 ) ( ON ?auto_463373 ?auto_463372 ) ( ON ?auto_463374 ?auto_463373 ) ( ON ?auto_463375 ?auto_463374 ) ( ON ?auto_463376 ?auto_463375 ) ( ON ?auto_463377 ?auto_463376 ) ( ON ?auto_463378 ?auto_463377 ) ( ON ?auto_463379 ?auto_463378 ) ( not ( = ?auto_463370 ?auto_463371 ) ) ( not ( = ?auto_463370 ?auto_463372 ) ) ( not ( = ?auto_463370 ?auto_463373 ) ) ( not ( = ?auto_463370 ?auto_463374 ) ) ( not ( = ?auto_463370 ?auto_463375 ) ) ( not ( = ?auto_463370 ?auto_463376 ) ) ( not ( = ?auto_463370 ?auto_463377 ) ) ( not ( = ?auto_463370 ?auto_463378 ) ) ( not ( = ?auto_463370 ?auto_463379 ) ) ( not ( = ?auto_463370 ?auto_463380 ) ) ( not ( = ?auto_463370 ?auto_463381 ) ) ( not ( = ?auto_463370 ?auto_463382 ) ) ( not ( = ?auto_463370 ?auto_463383 ) ) ( not ( = ?auto_463370 ?auto_463384 ) ) ( not ( = ?auto_463371 ?auto_463372 ) ) ( not ( = ?auto_463371 ?auto_463373 ) ) ( not ( = ?auto_463371 ?auto_463374 ) ) ( not ( = ?auto_463371 ?auto_463375 ) ) ( not ( = ?auto_463371 ?auto_463376 ) ) ( not ( = ?auto_463371 ?auto_463377 ) ) ( not ( = ?auto_463371 ?auto_463378 ) ) ( not ( = ?auto_463371 ?auto_463379 ) ) ( not ( = ?auto_463371 ?auto_463380 ) ) ( not ( = ?auto_463371 ?auto_463381 ) ) ( not ( = ?auto_463371 ?auto_463382 ) ) ( not ( = ?auto_463371 ?auto_463383 ) ) ( not ( = ?auto_463371 ?auto_463384 ) ) ( not ( = ?auto_463372 ?auto_463373 ) ) ( not ( = ?auto_463372 ?auto_463374 ) ) ( not ( = ?auto_463372 ?auto_463375 ) ) ( not ( = ?auto_463372 ?auto_463376 ) ) ( not ( = ?auto_463372 ?auto_463377 ) ) ( not ( = ?auto_463372 ?auto_463378 ) ) ( not ( = ?auto_463372 ?auto_463379 ) ) ( not ( = ?auto_463372 ?auto_463380 ) ) ( not ( = ?auto_463372 ?auto_463381 ) ) ( not ( = ?auto_463372 ?auto_463382 ) ) ( not ( = ?auto_463372 ?auto_463383 ) ) ( not ( = ?auto_463372 ?auto_463384 ) ) ( not ( = ?auto_463373 ?auto_463374 ) ) ( not ( = ?auto_463373 ?auto_463375 ) ) ( not ( = ?auto_463373 ?auto_463376 ) ) ( not ( = ?auto_463373 ?auto_463377 ) ) ( not ( = ?auto_463373 ?auto_463378 ) ) ( not ( = ?auto_463373 ?auto_463379 ) ) ( not ( = ?auto_463373 ?auto_463380 ) ) ( not ( = ?auto_463373 ?auto_463381 ) ) ( not ( = ?auto_463373 ?auto_463382 ) ) ( not ( = ?auto_463373 ?auto_463383 ) ) ( not ( = ?auto_463373 ?auto_463384 ) ) ( not ( = ?auto_463374 ?auto_463375 ) ) ( not ( = ?auto_463374 ?auto_463376 ) ) ( not ( = ?auto_463374 ?auto_463377 ) ) ( not ( = ?auto_463374 ?auto_463378 ) ) ( not ( = ?auto_463374 ?auto_463379 ) ) ( not ( = ?auto_463374 ?auto_463380 ) ) ( not ( = ?auto_463374 ?auto_463381 ) ) ( not ( = ?auto_463374 ?auto_463382 ) ) ( not ( = ?auto_463374 ?auto_463383 ) ) ( not ( = ?auto_463374 ?auto_463384 ) ) ( not ( = ?auto_463375 ?auto_463376 ) ) ( not ( = ?auto_463375 ?auto_463377 ) ) ( not ( = ?auto_463375 ?auto_463378 ) ) ( not ( = ?auto_463375 ?auto_463379 ) ) ( not ( = ?auto_463375 ?auto_463380 ) ) ( not ( = ?auto_463375 ?auto_463381 ) ) ( not ( = ?auto_463375 ?auto_463382 ) ) ( not ( = ?auto_463375 ?auto_463383 ) ) ( not ( = ?auto_463375 ?auto_463384 ) ) ( not ( = ?auto_463376 ?auto_463377 ) ) ( not ( = ?auto_463376 ?auto_463378 ) ) ( not ( = ?auto_463376 ?auto_463379 ) ) ( not ( = ?auto_463376 ?auto_463380 ) ) ( not ( = ?auto_463376 ?auto_463381 ) ) ( not ( = ?auto_463376 ?auto_463382 ) ) ( not ( = ?auto_463376 ?auto_463383 ) ) ( not ( = ?auto_463376 ?auto_463384 ) ) ( not ( = ?auto_463377 ?auto_463378 ) ) ( not ( = ?auto_463377 ?auto_463379 ) ) ( not ( = ?auto_463377 ?auto_463380 ) ) ( not ( = ?auto_463377 ?auto_463381 ) ) ( not ( = ?auto_463377 ?auto_463382 ) ) ( not ( = ?auto_463377 ?auto_463383 ) ) ( not ( = ?auto_463377 ?auto_463384 ) ) ( not ( = ?auto_463378 ?auto_463379 ) ) ( not ( = ?auto_463378 ?auto_463380 ) ) ( not ( = ?auto_463378 ?auto_463381 ) ) ( not ( = ?auto_463378 ?auto_463382 ) ) ( not ( = ?auto_463378 ?auto_463383 ) ) ( not ( = ?auto_463378 ?auto_463384 ) ) ( not ( = ?auto_463379 ?auto_463380 ) ) ( not ( = ?auto_463379 ?auto_463381 ) ) ( not ( = ?auto_463379 ?auto_463382 ) ) ( not ( = ?auto_463379 ?auto_463383 ) ) ( not ( = ?auto_463379 ?auto_463384 ) ) ( not ( = ?auto_463380 ?auto_463381 ) ) ( not ( = ?auto_463380 ?auto_463382 ) ) ( not ( = ?auto_463380 ?auto_463383 ) ) ( not ( = ?auto_463380 ?auto_463384 ) ) ( not ( = ?auto_463381 ?auto_463382 ) ) ( not ( = ?auto_463381 ?auto_463383 ) ) ( not ( = ?auto_463381 ?auto_463384 ) ) ( not ( = ?auto_463382 ?auto_463383 ) ) ( not ( = ?auto_463382 ?auto_463384 ) ) ( not ( = ?auto_463383 ?auto_463384 ) ) ( ON ?auto_463382 ?auto_463383 ) ( ON ?auto_463381 ?auto_463382 ) ( CLEAR ?auto_463379 ) ( ON ?auto_463380 ?auto_463381 ) ( CLEAR ?auto_463380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_463370 ?auto_463371 ?auto_463372 ?auto_463373 ?auto_463374 ?auto_463375 ?auto_463376 ?auto_463377 ?auto_463378 ?auto_463379 ?auto_463380 )
      ( MAKE-14PILE ?auto_463370 ?auto_463371 ?auto_463372 ?auto_463373 ?auto_463374 ?auto_463375 ?auto_463376 ?auto_463377 ?auto_463378 ?auto_463379 ?auto_463380 ?auto_463381 ?auto_463382 ?auto_463383 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463399 - BLOCK
      ?auto_463400 - BLOCK
      ?auto_463401 - BLOCK
      ?auto_463402 - BLOCK
      ?auto_463403 - BLOCK
      ?auto_463404 - BLOCK
      ?auto_463405 - BLOCK
      ?auto_463406 - BLOCK
      ?auto_463407 - BLOCK
      ?auto_463408 - BLOCK
      ?auto_463409 - BLOCK
      ?auto_463410 - BLOCK
      ?auto_463411 - BLOCK
      ?auto_463412 - BLOCK
    )
    :vars
    (
      ?auto_463413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463412 ?auto_463413 ) ( ON-TABLE ?auto_463399 ) ( ON ?auto_463400 ?auto_463399 ) ( ON ?auto_463401 ?auto_463400 ) ( ON ?auto_463402 ?auto_463401 ) ( ON ?auto_463403 ?auto_463402 ) ( ON ?auto_463404 ?auto_463403 ) ( ON ?auto_463405 ?auto_463404 ) ( ON ?auto_463406 ?auto_463405 ) ( ON ?auto_463407 ?auto_463406 ) ( ON ?auto_463408 ?auto_463407 ) ( not ( = ?auto_463399 ?auto_463400 ) ) ( not ( = ?auto_463399 ?auto_463401 ) ) ( not ( = ?auto_463399 ?auto_463402 ) ) ( not ( = ?auto_463399 ?auto_463403 ) ) ( not ( = ?auto_463399 ?auto_463404 ) ) ( not ( = ?auto_463399 ?auto_463405 ) ) ( not ( = ?auto_463399 ?auto_463406 ) ) ( not ( = ?auto_463399 ?auto_463407 ) ) ( not ( = ?auto_463399 ?auto_463408 ) ) ( not ( = ?auto_463399 ?auto_463409 ) ) ( not ( = ?auto_463399 ?auto_463410 ) ) ( not ( = ?auto_463399 ?auto_463411 ) ) ( not ( = ?auto_463399 ?auto_463412 ) ) ( not ( = ?auto_463399 ?auto_463413 ) ) ( not ( = ?auto_463400 ?auto_463401 ) ) ( not ( = ?auto_463400 ?auto_463402 ) ) ( not ( = ?auto_463400 ?auto_463403 ) ) ( not ( = ?auto_463400 ?auto_463404 ) ) ( not ( = ?auto_463400 ?auto_463405 ) ) ( not ( = ?auto_463400 ?auto_463406 ) ) ( not ( = ?auto_463400 ?auto_463407 ) ) ( not ( = ?auto_463400 ?auto_463408 ) ) ( not ( = ?auto_463400 ?auto_463409 ) ) ( not ( = ?auto_463400 ?auto_463410 ) ) ( not ( = ?auto_463400 ?auto_463411 ) ) ( not ( = ?auto_463400 ?auto_463412 ) ) ( not ( = ?auto_463400 ?auto_463413 ) ) ( not ( = ?auto_463401 ?auto_463402 ) ) ( not ( = ?auto_463401 ?auto_463403 ) ) ( not ( = ?auto_463401 ?auto_463404 ) ) ( not ( = ?auto_463401 ?auto_463405 ) ) ( not ( = ?auto_463401 ?auto_463406 ) ) ( not ( = ?auto_463401 ?auto_463407 ) ) ( not ( = ?auto_463401 ?auto_463408 ) ) ( not ( = ?auto_463401 ?auto_463409 ) ) ( not ( = ?auto_463401 ?auto_463410 ) ) ( not ( = ?auto_463401 ?auto_463411 ) ) ( not ( = ?auto_463401 ?auto_463412 ) ) ( not ( = ?auto_463401 ?auto_463413 ) ) ( not ( = ?auto_463402 ?auto_463403 ) ) ( not ( = ?auto_463402 ?auto_463404 ) ) ( not ( = ?auto_463402 ?auto_463405 ) ) ( not ( = ?auto_463402 ?auto_463406 ) ) ( not ( = ?auto_463402 ?auto_463407 ) ) ( not ( = ?auto_463402 ?auto_463408 ) ) ( not ( = ?auto_463402 ?auto_463409 ) ) ( not ( = ?auto_463402 ?auto_463410 ) ) ( not ( = ?auto_463402 ?auto_463411 ) ) ( not ( = ?auto_463402 ?auto_463412 ) ) ( not ( = ?auto_463402 ?auto_463413 ) ) ( not ( = ?auto_463403 ?auto_463404 ) ) ( not ( = ?auto_463403 ?auto_463405 ) ) ( not ( = ?auto_463403 ?auto_463406 ) ) ( not ( = ?auto_463403 ?auto_463407 ) ) ( not ( = ?auto_463403 ?auto_463408 ) ) ( not ( = ?auto_463403 ?auto_463409 ) ) ( not ( = ?auto_463403 ?auto_463410 ) ) ( not ( = ?auto_463403 ?auto_463411 ) ) ( not ( = ?auto_463403 ?auto_463412 ) ) ( not ( = ?auto_463403 ?auto_463413 ) ) ( not ( = ?auto_463404 ?auto_463405 ) ) ( not ( = ?auto_463404 ?auto_463406 ) ) ( not ( = ?auto_463404 ?auto_463407 ) ) ( not ( = ?auto_463404 ?auto_463408 ) ) ( not ( = ?auto_463404 ?auto_463409 ) ) ( not ( = ?auto_463404 ?auto_463410 ) ) ( not ( = ?auto_463404 ?auto_463411 ) ) ( not ( = ?auto_463404 ?auto_463412 ) ) ( not ( = ?auto_463404 ?auto_463413 ) ) ( not ( = ?auto_463405 ?auto_463406 ) ) ( not ( = ?auto_463405 ?auto_463407 ) ) ( not ( = ?auto_463405 ?auto_463408 ) ) ( not ( = ?auto_463405 ?auto_463409 ) ) ( not ( = ?auto_463405 ?auto_463410 ) ) ( not ( = ?auto_463405 ?auto_463411 ) ) ( not ( = ?auto_463405 ?auto_463412 ) ) ( not ( = ?auto_463405 ?auto_463413 ) ) ( not ( = ?auto_463406 ?auto_463407 ) ) ( not ( = ?auto_463406 ?auto_463408 ) ) ( not ( = ?auto_463406 ?auto_463409 ) ) ( not ( = ?auto_463406 ?auto_463410 ) ) ( not ( = ?auto_463406 ?auto_463411 ) ) ( not ( = ?auto_463406 ?auto_463412 ) ) ( not ( = ?auto_463406 ?auto_463413 ) ) ( not ( = ?auto_463407 ?auto_463408 ) ) ( not ( = ?auto_463407 ?auto_463409 ) ) ( not ( = ?auto_463407 ?auto_463410 ) ) ( not ( = ?auto_463407 ?auto_463411 ) ) ( not ( = ?auto_463407 ?auto_463412 ) ) ( not ( = ?auto_463407 ?auto_463413 ) ) ( not ( = ?auto_463408 ?auto_463409 ) ) ( not ( = ?auto_463408 ?auto_463410 ) ) ( not ( = ?auto_463408 ?auto_463411 ) ) ( not ( = ?auto_463408 ?auto_463412 ) ) ( not ( = ?auto_463408 ?auto_463413 ) ) ( not ( = ?auto_463409 ?auto_463410 ) ) ( not ( = ?auto_463409 ?auto_463411 ) ) ( not ( = ?auto_463409 ?auto_463412 ) ) ( not ( = ?auto_463409 ?auto_463413 ) ) ( not ( = ?auto_463410 ?auto_463411 ) ) ( not ( = ?auto_463410 ?auto_463412 ) ) ( not ( = ?auto_463410 ?auto_463413 ) ) ( not ( = ?auto_463411 ?auto_463412 ) ) ( not ( = ?auto_463411 ?auto_463413 ) ) ( not ( = ?auto_463412 ?auto_463413 ) ) ( ON ?auto_463411 ?auto_463412 ) ( ON ?auto_463410 ?auto_463411 ) ( CLEAR ?auto_463408 ) ( ON ?auto_463409 ?auto_463410 ) ( CLEAR ?auto_463409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_463399 ?auto_463400 ?auto_463401 ?auto_463402 ?auto_463403 ?auto_463404 ?auto_463405 ?auto_463406 ?auto_463407 ?auto_463408 ?auto_463409 )
      ( MAKE-14PILE ?auto_463399 ?auto_463400 ?auto_463401 ?auto_463402 ?auto_463403 ?auto_463404 ?auto_463405 ?auto_463406 ?auto_463407 ?auto_463408 ?auto_463409 ?auto_463410 ?auto_463411 ?auto_463412 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463428 - BLOCK
      ?auto_463429 - BLOCK
      ?auto_463430 - BLOCK
      ?auto_463431 - BLOCK
      ?auto_463432 - BLOCK
      ?auto_463433 - BLOCK
      ?auto_463434 - BLOCK
      ?auto_463435 - BLOCK
      ?auto_463436 - BLOCK
      ?auto_463437 - BLOCK
      ?auto_463438 - BLOCK
      ?auto_463439 - BLOCK
      ?auto_463440 - BLOCK
      ?auto_463441 - BLOCK
    )
    :vars
    (
      ?auto_463442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463441 ?auto_463442 ) ( ON-TABLE ?auto_463428 ) ( ON ?auto_463429 ?auto_463428 ) ( ON ?auto_463430 ?auto_463429 ) ( ON ?auto_463431 ?auto_463430 ) ( ON ?auto_463432 ?auto_463431 ) ( ON ?auto_463433 ?auto_463432 ) ( ON ?auto_463434 ?auto_463433 ) ( ON ?auto_463435 ?auto_463434 ) ( ON ?auto_463436 ?auto_463435 ) ( not ( = ?auto_463428 ?auto_463429 ) ) ( not ( = ?auto_463428 ?auto_463430 ) ) ( not ( = ?auto_463428 ?auto_463431 ) ) ( not ( = ?auto_463428 ?auto_463432 ) ) ( not ( = ?auto_463428 ?auto_463433 ) ) ( not ( = ?auto_463428 ?auto_463434 ) ) ( not ( = ?auto_463428 ?auto_463435 ) ) ( not ( = ?auto_463428 ?auto_463436 ) ) ( not ( = ?auto_463428 ?auto_463437 ) ) ( not ( = ?auto_463428 ?auto_463438 ) ) ( not ( = ?auto_463428 ?auto_463439 ) ) ( not ( = ?auto_463428 ?auto_463440 ) ) ( not ( = ?auto_463428 ?auto_463441 ) ) ( not ( = ?auto_463428 ?auto_463442 ) ) ( not ( = ?auto_463429 ?auto_463430 ) ) ( not ( = ?auto_463429 ?auto_463431 ) ) ( not ( = ?auto_463429 ?auto_463432 ) ) ( not ( = ?auto_463429 ?auto_463433 ) ) ( not ( = ?auto_463429 ?auto_463434 ) ) ( not ( = ?auto_463429 ?auto_463435 ) ) ( not ( = ?auto_463429 ?auto_463436 ) ) ( not ( = ?auto_463429 ?auto_463437 ) ) ( not ( = ?auto_463429 ?auto_463438 ) ) ( not ( = ?auto_463429 ?auto_463439 ) ) ( not ( = ?auto_463429 ?auto_463440 ) ) ( not ( = ?auto_463429 ?auto_463441 ) ) ( not ( = ?auto_463429 ?auto_463442 ) ) ( not ( = ?auto_463430 ?auto_463431 ) ) ( not ( = ?auto_463430 ?auto_463432 ) ) ( not ( = ?auto_463430 ?auto_463433 ) ) ( not ( = ?auto_463430 ?auto_463434 ) ) ( not ( = ?auto_463430 ?auto_463435 ) ) ( not ( = ?auto_463430 ?auto_463436 ) ) ( not ( = ?auto_463430 ?auto_463437 ) ) ( not ( = ?auto_463430 ?auto_463438 ) ) ( not ( = ?auto_463430 ?auto_463439 ) ) ( not ( = ?auto_463430 ?auto_463440 ) ) ( not ( = ?auto_463430 ?auto_463441 ) ) ( not ( = ?auto_463430 ?auto_463442 ) ) ( not ( = ?auto_463431 ?auto_463432 ) ) ( not ( = ?auto_463431 ?auto_463433 ) ) ( not ( = ?auto_463431 ?auto_463434 ) ) ( not ( = ?auto_463431 ?auto_463435 ) ) ( not ( = ?auto_463431 ?auto_463436 ) ) ( not ( = ?auto_463431 ?auto_463437 ) ) ( not ( = ?auto_463431 ?auto_463438 ) ) ( not ( = ?auto_463431 ?auto_463439 ) ) ( not ( = ?auto_463431 ?auto_463440 ) ) ( not ( = ?auto_463431 ?auto_463441 ) ) ( not ( = ?auto_463431 ?auto_463442 ) ) ( not ( = ?auto_463432 ?auto_463433 ) ) ( not ( = ?auto_463432 ?auto_463434 ) ) ( not ( = ?auto_463432 ?auto_463435 ) ) ( not ( = ?auto_463432 ?auto_463436 ) ) ( not ( = ?auto_463432 ?auto_463437 ) ) ( not ( = ?auto_463432 ?auto_463438 ) ) ( not ( = ?auto_463432 ?auto_463439 ) ) ( not ( = ?auto_463432 ?auto_463440 ) ) ( not ( = ?auto_463432 ?auto_463441 ) ) ( not ( = ?auto_463432 ?auto_463442 ) ) ( not ( = ?auto_463433 ?auto_463434 ) ) ( not ( = ?auto_463433 ?auto_463435 ) ) ( not ( = ?auto_463433 ?auto_463436 ) ) ( not ( = ?auto_463433 ?auto_463437 ) ) ( not ( = ?auto_463433 ?auto_463438 ) ) ( not ( = ?auto_463433 ?auto_463439 ) ) ( not ( = ?auto_463433 ?auto_463440 ) ) ( not ( = ?auto_463433 ?auto_463441 ) ) ( not ( = ?auto_463433 ?auto_463442 ) ) ( not ( = ?auto_463434 ?auto_463435 ) ) ( not ( = ?auto_463434 ?auto_463436 ) ) ( not ( = ?auto_463434 ?auto_463437 ) ) ( not ( = ?auto_463434 ?auto_463438 ) ) ( not ( = ?auto_463434 ?auto_463439 ) ) ( not ( = ?auto_463434 ?auto_463440 ) ) ( not ( = ?auto_463434 ?auto_463441 ) ) ( not ( = ?auto_463434 ?auto_463442 ) ) ( not ( = ?auto_463435 ?auto_463436 ) ) ( not ( = ?auto_463435 ?auto_463437 ) ) ( not ( = ?auto_463435 ?auto_463438 ) ) ( not ( = ?auto_463435 ?auto_463439 ) ) ( not ( = ?auto_463435 ?auto_463440 ) ) ( not ( = ?auto_463435 ?auto_463441 ) ) ( not ( = ?auto_463435 ?auto_463442 ) ) ( not ( = ?auto_463436 ?auto_463437 ) ) ( not ( = ?auto_463436 ?auto_463438 ) ) ( not ( = ?auto_463436 ?auto_463439 ) ) ( not ( = ?auto_463436 ?auto_463440 ) ) ( not ( = ?auto_463436 ?auto_463441 ) ) ( not ( = ?auto_463436 ?auto_463442 ) ) ( not ( = ?auto_463437 ?auto_463438 ) ) ( not ( = ?auto_463437 ?auto_463439 ) ) ( not ( = ?auto_463437 ?auto_463440 ) ) ( not ( = ?auto_463437 ?auto_463441 ) ) ( not ( = ?auto_463437 ?auto_463442 ) ) ( not ( = ?auto_463438 ?auto_463439 ) ) ( not ( = ?auto_463438 ?auto_463440 ) ) ( not ( = ?auto_463438 ?auto_463441 ) ) ( not ( = ?auto_463438 ?auto_463442 ) ) ( not ( = ?auto_463439 ?auto_463440 ) ) ( not ( = ?auto_463439 ?auto_463441 ) ) ( not ( = ?auto_463439 ?auto_463442 ) ) ( not ( = ?auto_463440 ?auto_463441 ) ) ( not ( = ?auto_463440 ?auto_463442 ) ) ( not ( = ?auto_463441 ?auto_463442 ) ) ( ON ?auto_463440 ?auto_463441 ) ( ON ?auto_463439 ?auto_463440 ) ( ON ?auto_463438 ?auto_463439 ) ( CLEAR ?auto_463436 ) ( ON ?auto_463437 ?auto_463438 ) ( CLEAR ?auto_463437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_463428 ?auto_463429 ?auto_463430 ?auto_463431 ?auto_463432 ?auto_463433 ?auto_463434 ?auto_463435 ?auto_463436 ?auto_463437 )
      ( MAKE-14PILE ?auto_463428 ?auto_463429 ?auto_463430 ?auto_463431 ?auto_463432 ?auto_463433 ?auto_463434 ?auto_463435 ?auto_463436 ?auto_463437 ?auto_463438 ?auto_463439 ?auto_463440 ?auto_463441 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463457 - BLOCK
      ?auto_463458 - BLOCK
      ?auto_463459 - BLOCK
      ?auto_463460 - BLOCK
      ?auto_463461 - BLOCK
      ?auto_463462 - BLOCK
      ?auto_463463 - BLOCK
      ?auto_463464 - BLOCK
      ?auto_463465 - BLOCK
      ?auto_463466 - BLOCK
      ?auto_463467 - BLOCK
      ?auto_463468 - BLOCK
      ?auto_463469 - BLOCK
      ?auto_463470 - BLOCK
    )
    :vars
    (
      ?auto_463471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463470 ?auto_463471 ) ( ON-TABLE ?auto_463457 ) ( ON ?auto_463458 ?auto_463457 ) ( ON ?auto_463459 ?auto_463458 ) ( ON ?auto_463460 ?auto_463459 ) ( ON ?auto_463461 ?auto_463460 ) ( ON ?auto_463462 ?auto_463461 ) ( ON ?auto_463463 ?auto_463462 ) ( ON ?auto_463464 ?auto_463463 ) ( ON ?auto_463465 ?auto_463464 ) ( not ( = ?auto_463457 ?auto_463458 ) ) ( not ( = ?auto_463457 ?auto_463459 ) ) ( not ( = ?auto_463457 ?auto_463460 ) ) ( not ( = ?auto_463457 ?auto_463461 ) ) ( not ( = ?auto_463457 ?auto_463462 ) ) ( not ( = ?auto_463457 ?auto_463463 ) ) ( not ( = ?auto_463457 ?auto_463464 ) ) ( not ( = ?auto_463457 ?auto_463465 ) ) ( not ( = ?auto_463457 ?auto_463466 ) ) ( not ( = ?auto_463457 ?auto_463467 ) ) ( not ( = ?auto_463457 ?auto_463468 ) ) ( not ( = ?auto_463457 ?auto_463469 ) ) ( not ( = ?auto_463457 ?auto_463470 ) ) ( not ( = ?auto_463457 ?auto_463471 ) ) ( not ( = ?auto_463458 ?auto_463459 ) ) ( not ( = ?auto_463458 ?auto_463460 ) ) ( not ( = ?auto_463458 ?auto_463461 ) ) ( not ( = ?auto_463458 ?auto_463462 ) ) ( not ( = ?auto_463458 ?auto_463463 ) ) ( not ( = ?auto_463458 ?auto_463464 ) ) ( not ( = ?auto_463458 ?auto_463465 ) ) ( not ( = ?auto_463458 ?auto_463466 ) ) ( not ( = ?auto_463458 ?auto_463467 ) ) ( not ( = ?auto_463458 ?auto_463468 ) ) ( not ( = ?auto_463458 ?auto_463469 ) ) ( not ( = ?auto_463458 ?auto_463470 ) ) ( not ( = ?auto_463458 ?auto_463471 ) ) ( not ( = ?auto_463459 ?auto_463460 ) ) ( not ( = ?auto_463459 ?auto_463461 ) ) ( not ( = ?auto_463459 ?auto_463462 ) ) ( not ( = ?auto_463459 ?auto_463463 ) ) ( not ( = ?auto_463459 ?auto_463464 ) ) ( not ( = ?auto_463459 ?auto_463465 ) ) ( not ( = ?auto_463459 ?auto_463466 ) ) ( not ( = ?auto_463459 ?auto_463467 ) ) ( not ( = ?auto_463459 ?auto_463468 ) ) ( not ( = ?auto_463459 ?auto_463469 ) ) ( not ( = ?auto_463459 ?auto_463470 ) ) ( not ( = ?auto_463459 ?auto_463471 ) ) ( not ( = ?auto_463460 ?auto_463461 ) ) ( not ( = ?auto_463460 ?auto_463462 ) ) ( not ( = ?auto_463460 ?auto_463463 ) ) ( not ( = ?auto_463460 ?auto_463464 ) ) ( not ( = ?auto_463460 ?auto_463465 ) ) ( not ( = ?auto_463460 ?auto_463466 ) ) ( not ( = ?auto_463460 ?auto_463467 ) ) ( not ( = ?auto_463460 ?auto_463468 ) ) ( not ( = ?auto_463460 ?auto_463469 ) ) ( not ( = ?auto_463460 ?auto_463470 ) ) ( not ( = ?auto_463460 ?auto_463471 ) ) ( not ( = ?auto_463461 ?auto_463462 ) ) ( not ( = ?auto_463461 ?auto_463463 ) ) ( not ( = ?auto_463461 ?auto_463464 ) ) ( not ( = ?auto_463461 ?auto_463465 ) ) ( not ( = ?auto_463461 ?auto_463466 ) ) ( not ( = ?auto_463461 ?auto_463467 ) ) ( not ( = ?auto_463461 ?auto_463468 ) ) ( not ( = ?auto_463461 ?auto_463469 ) ) ( not ( = ?auto_463461 ?auto_463470 ) ) ( not ( = ?auto_463461 ?auto_463471 ) ) ( not ( = ?auto_463462 ?auto_463463 ) ) ( not ( = ?auto_463462 ?auto_463464 ) ) ( not ( = ?auto_463462 ?auto_463465 ) ) ( not ( = ?auto_463462 ?auto_463466 ) ) ( not ( = ?auto_463462 ?auto_463467 ) ) ( not ( = ?auto_463462 ?auto_463468 ) ) ( not ( = ?auto_463462 ?auto_463469 ) ) ( not ( = ?auto_463462 ?auto_463470 ) ) ( not ( = ?auto_463462 ?auto_463471 ) ) ( not ( = ?auto_463463 ?auto_463464 ) ) ( not ( = ?auto_463463 ?auto_463465 ) ) ( not ( = ?auto_463463 ?auto_463466 ) ) ( not ( = ?auto_463463 ?auto_463467 ) ) ( not ( = ?auto_463463 ?auto_463468 ) ) ( not ( = ?auto_463463 ?auto_463469 ) ) ( not ( = ?auto_463463 ?auto_463470 ) ) ( not ( = ?auto_463463 ?auto_463471 ) ) ( not ( = ?auto_463464 ?auto_463465 ) ) ( not ( = ?auto_463464 ?auto_463466 ) ) ( not ( = ?auto_463464 ?auto_463467 ) ) ( not ( = ?auto_463464 ?auto_463468 ) ) ( not ( = ?auto_463464 ?auto_463469 ) ) ( not ( = ?auto_463464 ?auto_463470 ) ) ( not ( = ?auto_463464 ?auto_463471 ) ) ( not ( = ?auto_463465 ?auto_463466 ) ) ( not ( = ?auto_463465 ?auto_463467 ) ) ( not ( = ?auto_463465 ?auto_463468 ) ) ( not ( = ?auto_463465 ?auto_463469 ) ) ( not ( = ?auto_463465 ?auto_463470 ) ) ( not ( = ?auto_463465 ?auto_463471 ) ) ( not ( = ?auto_463466 ?auto_463467 ) ) ( not ( = ?auto_463466 ?auto_463468 ) ) ( not ( = ?auto_463466 ?auto_463469 ) ) ( not ( = ?auto_463466 ?auto_463470 ) ) ( not ( = ?auto_463466 ?auto_463471 ) ) ( not ( = ?auto_463467 ?auto_463468 ) ) ( not ( = ?auto_463467 ?auto_463469 ) ) ( not ( = ?auto_463467 ?auto_463470 ) ) ( not ( = ?auto_463467 ?auto_463471 ) ) ( not ( = ?auto_463468 ?auto_463469 ) ) ( not ( = ?auto_463468 ?auto_463470 ) ) ( not ( = ?auto_463468 ?auto_463471 ) ) ( not ( = ?auto_463469 ?auto_463470 ) ) ( not ( = ?auto_463469 ?auto_463471 ) ) ( not ( = ?auto_463470 ?auto_463471 ) ) ( ON ?auto_463469 ?auto_463470 ) ( ON ?auto_463468 ?auto_463469 ) ( ON ?auto_463467 ?auto_463468 ) ( CLEAR ?auto_463465 ) ( ON ?auto_463466 ?auto_463467 ) ( CLEAR ?auto_463466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_463457 ?auto_463458 ?auto_463459 ?auto_463460 ?auto_463461 ?auto_463462 ?auto_463463 ?auto_463464 ?auto_463465 ?auto_463466 )
      ( MAKE-14PILE ?auto_463457 ?auto_463458 ?auto_463459 ?auto_463460 ?auto_463461 ?auto_463462 ?auto_463463 ?auto_463464 ?auto_463465 ?auto_463466 ?auto_463467 ?auto_463468 ?auto_463469 ?auto_463470 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463486 - BLOCK
      ?auto_463487 - BLOCK
      ?auto_463488 - BLOCK
      ?auto_463489 - BLOCK
      ?auto_463490 - BLOCK
      ?auto_463491 - BLOCK
      ?auto_463492 - BLOCK
      ?auto_463493 - BLOCK
      ?auto_463494 - BLOCK
      ?auto_463495 - BLOCK
      ?auto_463496 - BLOCK
      ?auto_463497 - BLOCK
      ?auto_463498 - BLOCK
      ?auto_463499 - BLOCK
    )
    :vars
    (
      ?auto_463500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463499 ?auto_463500 ) ( ON-TABLE ?auto_463486 ) ( ON ?auto_463487 ?auto_463486 ) ( ON ?auto_463488 ?auto_463487 ) ( ON ?auto_463489 ?auto_463488 ) ( ON ?auto_463490 ?auto_463489 ) ( ON ?auto_463491 ?auto_463490 ) ( ON ?auto_463492 ?auto_463491 ) ( ON ?auto_463493 ?auto_463492 ) ( not ( = ?auto_463486 ?auto_463487 ) ) ( not ( = ?auto_463486 ?auto_463488 ) ) ( not ( = ?auto_463486 ?auto_463489 ) ) ( not ( = ?auto_463486 ?auto_463490 ) ) ( not ( = ?auto_463486 ?auto_463491 ) ) ( not ( = ?auto_463486 ?auto_463492 ) ) ( not ( = ?auto_463486 ?auto_463493 ) ) ( not ( = ?auto_463486 ?auto_463494 ) ) ( not ( = ?auto_463486 ?auto_463495 ) ) ( not ( = ?auto_463486 ?auto_463496 ) ) ( not ( = ?auto_463486 ?auto_463497 ) ) ( not ( = ?auto_463486 ?auto_463498 ) ) ( not ( = ?auto_463486 ?auto_463499 ) ) ( not ( = ?auto_463486 ?auto_463500 ) ) ( not ( = ?auto_463487 ?auto_463488 ) ) ( not ( = ?auto_463487 ?auto_463489 ) ) ( not ( = ?auto_463487 ?auto_463490 ) ) ( not ( = ?auto_463487 ?auto_463491 ) ) ( not ( = ?auto_463487 ?auto_463492 ) ) ( not ( = ?auto_463487 ?auto_463493 ) ) ( not ( = ?auto_463487 ?auto_463494 ) ) ( not ( = ?auto_463487 ?auto_463495 ) ) ( not ( = ?auto_463487 ?auto_463496 ) ) ( not ( = ?auto_463487 ?auto_463497 ) ) ( not ( = ?auto_463487 ?auto_463498 ) ) ( not ( = ?auto_463487 ?auto_463499 ) ) ( not ( = ?auto_463487 ?auto_463500 ) ) ( not ( = ?auto_463488 ?auto_463489 ) ) ( not ( = ?auto_463488 ?auto_463490 ) ) ( not ( = ?auto_463488 ?auto_463491 ) ) ( not ( = ?auto_463488 ?auto_463492 ) ) ( not ( = ?auto_463488 ?auto_463493 ) ) ( not ( = ?auto_463488 ?auto_463494 ) ) ( not ( = ?auto_463488 ?auto_463495 ) ) ( not ( = ?auto_463488 ?auto_463496 ) ) ( not ( = ?auto_463488 ?auto_463497 ) ) ( not ( = ?auto_463488 ?auto_463498 ) ) ( not ( = ?auto_463488 ?auto_463499 ) ) ( not ( = ?auto_463488 ?auto_463500 ) ) ( not ( = ?auto_463489 ?auto_463490 ) ) ( not ( = ?auto_463489 ?auto_463491 ) ) ( not ( = ?auto_463489 ?auto_463492 ) ) ( not ( = ?auto_463489 ?auto_463493 ) ) ( not ( = ?auto_463489 ?auto_463494 ) ) ( not ( = ?auto_463489 ?auto_463495 ) ) ( not ( = ?auto_463489 ?auto_463496 ) ) ( not ( = ?auto_463489 ?auto_463497 ) ) ( not ( = ?auto_463489 ?auto_463498 ) ) ( not ( = ?auto_463489 ?auto_463499 ) ) ( not ( = ?auto_463489 ?auto_463500 ) ) ( not ( = ?auto_463490 ?auto_463491 ) ) ( not ( = ?auto_463490 ?auto_463492 ) ) ( not ( = ?auto_463490 ?auto_463493 ) ) ( not ( = ?auto_463490 ?auto_463494 ) ) ( not ( = ?auto_463490 ?auto_463495 ) ) ( not ( = ?auto_463490 ?auto_463496 ) ) ( not ( = ?auto_463490 ?auto_463497 ) ) ( not ( = ?auto_463490 ?auto_463498 ) ) ( not ( = ?auto_463490 ?auto_463499 ) ) ( not ( = ?auto_463490 ?auto_463500 ) ) ( not ( = ?auto_463491 ?auto_463492 ) ) ( not ( = ?auto_463491 ?auto_463493 ) ) ( not ( = ?auto_463491 ?auto_463494 ) ) ( not ( = ?auto_463491 ?auto_463495 ) ) ( not ( = ?auto_463491 ?auto_463496 ) ) ( not ( = ?auto_463491 ?auto_463497 ) ) ( not ( = ?auto_463491 ?auto_463498 ) ) ( not ( = ?auto_463491 ?auto_463499 ) ) ( not ( = ?auto_463491 ?auto_463500 ) ) ( not ( = ?auto_463492 ?auto_463493 ) ) ( not ( = ?auto_463492 ?auto_463494 ) ) ( not ( = ?auto_463492 ?auto_463495 ) ) ( not ( = ?auto_463492 ?auto_463496 ) ) ( not ( = ?auto_463492 ?auto_463497 ) ) ( not ( = ?auto_463492 ?auto_463498 ) ) ( not ( = ?auto_463492 ?auto_463499 ) ) ( not ( = ?auto_463492 ?auto_463500 ) ) ( not ( = ?auto_463493 ?auto_463494 ) ) ( not ( = ?auto_463493 ?auto_463495 ) ) ( not ( = ?auto_463493 ?auto_463496 ) ) ( not ( = ?auto_463493 ?auto_463497 ) ) ( not ( = ?auto_463493 ?auto_463498 ) ) ( not ( = ?auto_463493 ?auto_463499 ) ) ( not ( = ?auto_463493 ?auto_463500 ) ) ( not ( = ?auto_463494 ?auto_463495 ) ) ( not ( = ?auto_463494 ?auto_463496 ) ) ( not ( = ?auto_463494 ?auto_463497 ) ) ( not ( = ?auto_463494 ?auto_463498 ) ) ( not ( = ?auto_463494 ?auto_463499 ) ) ( not ( = ?auto_463494 ?auto_463500 ) ) ( not ( = ?auto_463495 ?auto_463496 ) ) ( not ( = ?auto_463495 ?auto_463497 ) ) ( not ( = ?auto_463495 ?auto_463498 ) ) ( not ( = ?auto_463495 ?auto_463499 ) ) ( not ( = ?auto_463495 ?auto_463500 ) ) ( not ( = ?auto_463496 ?auto_463497 ) ) ( not ( = ?auto_463496 ?auto_463498 ) ) ( not ( = ?auto_463496 ?auto_463499 ) ) ( not ( = ?auto_463496 ?auto_463500 ) ) ( not ( = ?auto_463497 ?auto_463498 ) ) ( not ( = ?auto_463497 ?auto_463499 ) ) ( not ( = ?auto_463497 ?auto_463500 ) ) ( not ( = ?auto_463498 ?auto_463499 ) ) ( not ( = ?auto_463498 ?auto_463500 ) ) ( not ( = ?auto_463499 ?auto_463500 ) ) ( ON ?auto_463498 ?auto_463499 ) ( ON ?auto_463497 ?auto_463498 ) ( ON ?auto_463496 ?auto_463497 ) ( ON ?auto_463495 ?auto_463496 ) ( CLEAR ?auto_463493 ) ( ON ?auto_463494 ?auto_463495 ) ( CLEAR ?auto_463494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_463486 ?auto_463487 ?auto_463488 ?auto_463489 ?auto_463490 ?auto_463491 ?auto_463492 ?auto_463493 ?auto_463494 )
      ( MAKE-14PILE ?auto_463486 ?auto_463487 ?auto_463488 ?auto_463489 ?auto_463490 ?auto_463491 ?auto_463492 ?auto_463493 ?auto_463494 ?auto_463495 ?auto_463496 ?auto_463497 ?auto_463498 ?auto_463499 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463515 - BLOCK
      ?auto_463516 - BLOCK
      ?auto_463517 - BLOCK
      ?auto_463518 - BLOCK
      ?auto_463519 - BLOCK
      ?auto_463520 - BLOCK
      ?auto_463521 - BLOCK
      ?auto_463522 - BLOCK
      ?auto_463523 - BLOCK
      ?auto_463524 - BLOCK
      ?auto_463525 - BLOCK
      ?auto_463526 - BLOCK
      ?auto_463527 - BLOCK
      ?auto_463528 - BLOCK
    )
    :vars
    (
      ?auto_463529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463528 ?auto_463529 ) ( ON-TABLE ?auto_463515 ) ( ON ?auto_463516 ?auto_463515 ) ( ON ?auto_463517 ?auto_463516 ) ( ON ?auto_463518 ?auto_463517 ) ( ON ?auto_463519 ?auto_463518 ) ( ON ?auto_463520 ?auto_463519 ) ( ON ?auto_463521 ?auto_463520 ) ( ON ?auto_463522 ?auto_463521 ) ( not ( = ?auto_463515 ?auto_463516 ) ) ( not ( = ?auto_463515 ?auto_463517 ) ) ( not ( = ?auto_463515 ?auto_463518 ) ) ( not ( = ?auto_463515 ?auto_463519 ) ) ( not ( = ?auto_463515 ?auto_463520 ) ) ( not ( = ?auto_463515 ?auto_463521 ) ) ( not ( = ?auto_463515 ?auto_463522 ) ) ( not ( = ?auto_463515 ?auto_463523 ) ) ( not ( = ?auto_463515 ?auto_463524 ) ) ( not ( = ?auto_463515 ?auto_463525 ) ) ( not ( = ?auto_463515 ?auto_463526 ) ) ( not ( = ?auto_463515 ?auto_463527 ) ) ( not ( = ?auto_463515 ?auto_463528 ) ) ( not ( = ?auto_463515 ?auto_463529 ) ) ( not ( = ?auto_463516 ?auto_463517 ) ) ( not ( = ?auto_463516 ?auto_463518 ) ) ( not ( = ?auto_463516 ?auto_463519 ) ) ( not ( = ?auto_463516 ?auto_463520 ) ) ( not ( = ?auto_463516 ?auto_463521 ) ) ( not ( = ?auto_463516 ?auto_463522 ) ) ( not ( = ?auto_463516 ?auto_463523 ) ) ( not ( = ?auto_463516 ?auto_463524 ) ) ( not ( = ?auto_463516 ?auto_463525 ) ) ( not ( = ?auto_463516 ?auto_463526 ) ) ( not ( = ?auto_463516 ?auto_463527 ) ) ( not ( = ?auto_463516 ?auto_463528 ) ) ( not ( = ?auto_463516 ?auto_463529 ) ) ( not ( = ?auto_463517 ?auto_463518 ) ) ( not ( = ?auto_463517 ?auto_463519 ) ) ( not ( = ?auto_463517 ?auto_463520 ) ) ( not ( = ?auto_463517 ?auto_463521 ) ) ( not ( = ?auto_463517 ?auto_463522 ) ) ( not ( = ?auto_463517 ?auto_463523 ) ) ( not ( = ?auto_463517 ?auto_463524 ) ) ( not ( = ?auto_463517 ?auto_463525 ) ) ( not ( = ?auto_463517 ?auto_463526 ) ) ( not ( = ?auto_463517 ?auto_463527 ) ) ( not ( = ?auto_463517 ?auto_463528 ) ) ( not ( = ?auto_463517 ?auto_463529 ) ) ( not ( = ?auto_463518 ?auto_463519 ) ) ( not ( = ?auto_463518 ?auto_463520 ) ) ( not ( = ?auto_463518 ?auto_463521 ) ) ( not ( = ?auto_463518 ?auto_463522 ) ) ( not ( = ?auto_463518 ?auto_463523 ) ) ( not ( = ?auto_463518 ?auto_463524 ) ) ( not ( = ?auto_463518 ?auto_463525 ) ) ( not ( = ?auto_463518 ?auto_463526 ) ) ( not ( = ?auto_463518 ?auto_463527 ) ) ( not ( = ?auto_463518 ?auto_463528 ) ) ( not ( = ?auto_463518 ?auto_463529 ) ) ( not ( = ?auto_463519 ?auto_463520 ) ) ( not ( = ?auto_463519 ?auto_463521 ) ) ( not ( = ?auto_463519 ?auto_463522 ) ) ( not ( = ?auto_463519 ?auto_463523 ) ) ( not ( = ?auto_463519 ?auto_463524 ) ) ( not ( = ?auto_463519 ?auto_463525 ) ) ( not ( = ?auto_463519 ?auto_463526 ) ) ( not ( = ?auto_463519 ?auto_463527 ) ) ( not ( = ?auto_463519 ?auto_463528 ) ) ( not ( = ?auto_463519 ?auto_463529 ) ) ( not ( = ?auto_463520 ?auto_463521 ) ) ( not ( = ?auto_463520 ?auto_463522 ) ) ( not ( = ?auto_463520 ?auto_463523 ) ) ( not ( = ?auto_463520 ?auto_463524 ) ) ( not ( = ?auto_463520 ?auto_463525 ) ) ( not ( = ?auto_463520 ?auto_463526 ) ) ( not ( = ?auto_463520 ?auto_463527 ) ) ( not ( = ?auto_463520 ?auto_463528 ) ) ( not ( = ?auto_463520 ?auto_463529 ) ) ( not ( = ?auto_463521 ?auto_463522 ) ) ( not ( = ?auto_463521 ?auto_463523 ) ) ( not ( = ?auto_463521 ?auto_463524 ) ) ( not ( = ?auto_463521 ?auto_463525 ) ) ( not ( = ?auto_463521 ?auto_463526 ) ) ( not ( = ?auto_463521 ?auto_463527 ) ) ( not ( = ?auto_463521 ?auto_463528 ) ) ( not ( = ?auto_463521 ?auto_463529 ) ) ( not ( = ?auto_463522 ?auto_463523 ) ) ( not ( = ?auto_463522 ?auto_463524 ) ) ( not ( = ?auto_463522 ?auto_463525 ) ) ( not ( = ?auto_463522 ?auto_463526 ) ) ( not ( = ?auto_463522 ?auto_463527 ) ) ( not ( = ?auto_463522 ?auto_463528 ) ) ( not ( = ?auto_463522 ?auto_463529 ) ) ( not ( = ?auto_463523 ?auto_463524 ) ) ( not ( = ?auto_463523 ?auto_463525 ) ) ( not ( = ?auto_463523 ?auto_463526 ) ) ( not ( = ?auto_463523 ?auto_463527 ) ) ( not ( = ?auto_463523 ?auto_463528 ) ) ( not ( = ?auto_463523 ?auto_463529 ) ) ( not ( = ?auto_463524 ?auto_463525 ) ) ( not ( = ?auto_463524 ?auto_463526 ) ) ( not ( = ?auto_463524 ?auto_463527 ) ) ( not ( = ?auto_463524 ?auto_463528 ) ) ( not ( = ?auto_463524 ?auto_463529 ) ) ( not ( = ?auto_463525 ?auto_463526 ) ) ( not ( = ?auto_463525 ?auto_463527 ) ) ( not ( = ?auto_463525 ?auto_463528 ) ) ( not ( = ?auto_463525 ?auto_463529 ) ) ( not ( = ?auto_463526 ?auto_463527 ) ) ( not ( = ?auto_463526 ?auto_463528 ) ) ( not ( = ?auto_463526 ?auto_463529 ) ) ( not ( = ?auto_463527 ?auto_463528 ) ) ( not ( = ?auto_463527 ?auto_463529 ) ) ( not ( = ?auto_463528 ?auto_463529 ) ) ( ON ?auto_463527 ?auto_463528 ) ( ON ?auto_463526 ?auto_463527 ) ( ON ?auto_463525 ?auto_463526 ) ( ON ?auto_463524 ?auto_463525 ) ( CLEAR ?auto_463522 ) ( ON ?auto_463523 ?auto_463524 ) ( CLEAR ?auto_463523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_463515 ?auto_463516 ?auto_463517 ?auto_463518 ?auto_463519 ?auto_463520 ?auto_463521 ?auto_463522 ?auto_463523 )
      ( MAKE-14PILE ?auto_463515 ?auto_463516 ?auto_463517 ?auto_463518 ?auto_463519 ?auto_463520 ?auto_463521 ?auto_463522 ?auto_463523 ?auto_463524 ?auto_463525 ?auto_463526 ?auto_463527 ?auto_463528 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463544 - BLOCK
      ?auto_463545 - BLOCK
      ?auto_463546 - BLOCK
      ?auto_463547 - BLOCK
      ?auto_463548 - BLOCK
      ?auto_463549 - BLOCK
      ?auto_463550 - BLOCK
      ?auto_463551 - BLOCK
      ?auto_463552 - BLOCK
      ?auto_463553 - BLOCK
      ?auto_463554 - BLOCK
      ?auto_463555 - BLOCK
      ?auto_463556 - BLOCK
      ?auto_463557 - BLOCK
    )
    :vars
    (
      ?auto_463558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463557 ?auto_463558 ) ( ON-TABLE ?auto_463544 ) ( ON ?auto_463545 ?auto_463544 ) ( ON ?auto_463546 ?auto_463545 ) ( ON ?auto_463547 ?auto_463546 ) ( ON ?auto_463548 ?auto_463547 ) ( ON ?auto_463549 ?auto_463548 ) ( ON ?auto_463550 ?auto_463549 ) ( not ( = ?auto_463544 ?auto_463545 ) ) ( not ( = ?auto_463544 ?auto_463546 ) ) ( not ( = ?auto_463544 ?auto_463547 ) ) ( not ( = ?auto_463544 ?auto_463548 ) ) ( not ( = ?auto_463544 ?auto_463549 ) ) ( not ( = ?auto_463544 ?auto_463550 ) ) ( not ( = ?auto_463544 ?auto_463551 ) ) ( not ( = ?auto_463544 ?auto_463552 ) ) ( not ( = ?auto_463544 ?auto_463553 ) ) ( not ( = ?auto_463544 ?auto_463554 ) ) ( not ( = ?auto_463544 ?auto_463555 ) ) ( not ( = ?auto_463544 ?auto_463556 ) ) ( not ( = ?auto_463544 ?auto_463557 ) ) ( not ( = ?auto_463544 ?auto_463558 ) ) ( not ( = ?auto_463545 ?auto_463546 ) ) ( not ( = ?auto_463545 ?auto_463547 ) ) ( not ( = ?auto_463545 ?auto_463548 ) ) ( not ( = ?auto_463545 ?auto_463549 ) ) ( not ( = ?auto_463545 ?auto_463550 ) ) ( not ( = ?auto_463545 ?auto_463551 ) ) ( not ( = ?auto_463545 ?auto_463552 ) ) ( not ( = ?auto_463545 ?auto_463553 ) ) ( not ( = ?auto_463545 ?auto_463554 ) ) ( not ( = ?auto_463545 ?auto_463555 ) ) ( not ( = ?auto_463545 ?auto_463556 ) ) ( not ( = ?auto_463545 ?auto_463557 ) ) ( not ( = ?auto_463545 ?auto_463558 ) ) ( not ( = ?auto_463546 ?auto_463547 ) ) ( not ( = ?auto_463546 ?auto_463548 ) ) ( not ( = ?auto_463546 ?auto_463549 ) ) ( not ( = ?auto_463546 ?auto_463550 ) ) ( not ( = ?auto_463546 ?auto_463551 ) ) ( not ( = ?auto_463546 ?auto_463552 ) ) ( not ( = ?auto_463546 ?auto_463553 ) ) ( not ( = ?auto_463546 ?auto_463554 ) ) ( not ( = ?auto_463546 ?auto_463555 ) ) ( not ( = ?auto_463546 ?auto_463556 ) ) ( not ( = ?auto_463546 ?auto_463557 ) ) ( not ( = ?auto_463546 ?auto_463558 ) ) ( not ( = ?auto_463547 ?auto_463548 ) ) ( not ( = ?auto_463547 ?auto_463549 ) ) ( not ( = ?auto_463547 ?auto_463550 ) ) ( not ( = ?auto_463547 ?auto_463551 ) ) ( not ( = ?auto_463547 ?auto_463552 ) ) ( not ( = ?auto_463547 ?auto_463553 ) ) ( not ( = ?auto_463547 ?auto_463554 ) ) ( not ( = ?auto_463547 ?auto_463555 ) ) ( not ( = ?auto_463547 ?auto_463556 ) ) ( not ( = ?auto_463547 ?auto_463557 ) ) ( not ( = ?auto_463547 ?auto_463558 ) ) ( not ( = ?auto_463548 ?auto_463549 ) ) ( not ( = ?auto_463548 ?auto_463550 ) ) ( not ( = ?auto_463548 ?auto_463551 ) ) ( not ( = ?auto_463548 ?auto_463552 ) ) ( not ( = ?auto_463548 ?auto_463553 ) ) ( not ( = ?auto_463548 ?auto_463554 ) ) ( not ( = ?auto_463548 ?auto_463555 ) ) ( not ( = ?auto_463548 ?auto_463556 ) ) ( not ( = ?auto_463548 ?auto_463557 ) ) ( not ( = ?auto_463548 ?auto_463558 ) ) ( not ( = ?auto_463549 ?auto_463550 ) ) ( not ( = ?auto_463549 ?auto_463551 ) ) ( not ( = ?auto_463549 ?auto_463552 ) ) ( not ( = ?auto_463549 ?auto_463553 ) ) ( not ( = ?auto_463549 ?auto_463554 ) ) ( not ( = ?auto_463549 ?auto_463555 ) ) ( not ( = ?auto_463549 ?auto_463556 ) ) ( not ( = ?auto_463549 ?auto_463557 ) ) ( not ( = ?auto_463549 ?auto_463558 ) ) ( not ( = ?auto_463550 ?auto_463551 ) ) ( not ( = ?auto_463550 ?auto_463552 ) ) ( not ( = ?auto_463550 ?auto_463553 ) ) ( not ( = ?auto_463550 ?auto_463554 ) ) ( not ( = ?auto_463550 ?auto_463555 ) ) ( not ( = ?auto_463550 ?auto_463556 ) ) ( not ( = ?auto_463550 ?auto_463557 ) ) ( not ( = ?auto_463550 ?auto_463558 ) ) ( not ( = ?auto_463551 ?auto_463552 ) ) ( not ( = ?auto_463551 ?auto_463553 ) ) ( not ( = ?auto_463551 ?auto_463554 ) ) ( not ( = ?auto_463551 ?auto_463555 ) ) ( not ( = ?auto_463551 ?auto_463556 ) ) ( not ( = ?auto_463551 ?auto_463557 ) ) ( not ( = ?auto_463551 ?auto_463558 ) ) ( not ( = ?auto_463552 ?auto_463553 ) ) ( not ( = ?auto_463552 ?auto_463554 ) ) ( not ( = ?auto_463552 ?auto_463555 ) ) ( not ( = ?auto_463552 ?auto_463556 ) ) ( not ( = ?auto_463552 ?auto_463557 ) ) ( not ( = ?auto_463552 ?auto_463558 ) ) ( not ( = ?auto_463553 ?auto_463554 ) ) ( not ( = ?auto_463553 ?auto_463555 ) ) ( not ( = ?auto_463553 ?auto_463556 ) ) ( not ( = ?auto_463553 ?auto_463557 ) ) ( not ( = ?auto_463553 ?auto_463558 ) ) ( not ( = ?auto_463554 ?auto_463555 ) ) ( not ( = ?auto_463554 ?auto_463556 ) ) ( not ( = ?auto_463554 ?auto_463557 ) ) ( not ( = ?auto_463554 ?auto_463558 ) ) ( not ( = ?auto_463555 ?auto_463556 ) ) ( not ( = ?auto_463555 ?auto_463557 ) ) ( not ( = ?auto_463555 ?auto_463558 ) ) ( not ( = ?auto_463556 ?auto_463557 ) ) ( not ( = ?auto_463556 ?auto_463558 ) ) ( not ( = ?auto_463557 ?auto_463558 ) ) ( ON ?auto_463556 ?auto_463557 ) ( ON ?auto_463555 ?auto_463556 ) ( ON ?auto_463554 ?auto_463555 ) ( ON ?auto_463553 ?auto_463554 ) ( ON ?auto_463552 ?auto_463553 ) ( CLEAR ?auto_463550 ) ( ON ?auto_463551 ?auto_463552 ) ( CLEAR ?auto_463551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_463544 ?auto_463545 ?auto_463546 ?auto_463547 ?auto_463548 ?auto_463549 ?auto_463550 ?auto_463551 )
      ( MAKE-14PILE ?auto_463544 ?auto_463545 ?auto_463546 ?auto_463547 ?auto_463548 ?auto_463549 ?auto_463550 ?auto_463551 ?auto_463552 ?auto_463553 ?auto_463554 ?auto_463555 ?auto_463556 ?auto_463557 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463573 - BLOCK
      ?auto_463574 - BLOCK
      ?auto_463575 - BLOCK
      ?auto_463576 - BLOCK
      ?auto_463577 - BLOCK
      ?auto_463578 - BLOCK
      ?auto_463579 - BLOCK
      ?auto_463580 - BLOCK
      ?auto_463581 - BLOCK
      ?auto_463582 - BLOCK
      ?auto_463583 - BLOCK
      ?auto_463584 - BLOCK
      ?auto_463585 - BLOCK
      ?auto_463586 - BLOCK
    )
    :vars
    (
      ?auto_463587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463586 ?auto_463587 ) ( ON-TABLE ?auto_463573 ) ( ON ?auto_463574 ?auto_463573 ) ( ON ?auto_463575 ?auto_463574 ) ( ON ?auto_463576 ?auto_463575 ) ( ON ?auto_463577 ?auto_463576 ) ( ON ?auto_463578 ?auto_463577 ) ( ON ?auto_463579 ?auto_463578 ) ( not ( = ?auto_463573 ?auto_463574 ) ) ( not ( = ?auto_463573 ?auto_463575 ) ) ( not ( = ?auto_463573 ?auto_463576 ) ) ( not ( = ?auto_463573 ?auto_463577 ) ) ( not ( = ?auto_463573 ?auto_463578 ) ) ( not ( = ?auto_463573 ?auto_463579 ) ) ( not ( = ?auto_463573 ?auto_463580 ) ) ( not ( = ?auto_463573 ?auto_463581 ) ) ( not ( = ?auto_463573 ?auto_463582 ) ) ( not ( = ?auto_463573 ?auto_463583 ) ) ( not ( = ?auto_463573 ?auto_463584 ) ) ( not ( = ?auto_463573 ?auto_463585 ) ) ( not ( = ?auto_463573 ?auto_463586 ) ) ( not ( = ?auto_463573 ?auto_463587 ) ) ( not ( = ?auto_463574 ?auto_463575 ) ) ( not ( = ?auto_463574 ?auto_463576 ) ) ( not ( = ?auto_463574 ?auto_463577 ) ) ( not ( = ?auto_463574 ?auto_463578 ) ) ( not ( = ?auto_463574 ?auto_463579 ) ) ( not ( = ?auto_463574 ?auto_463580 ) ) ( not ( = ?auto_463574 ?auto_463581 ) ) ( not ( = ?auto_463574 ?auto_463582 ) ) ( not ( = ?auto_463574 ?auto_463583 ) ) ( not ( = ?auto_463574 ?auto_463584 ) ) ( not ( = ?auto_463574 ?auto_463585 ) ) ( not ( = ?auto_463574 ?auto_463586 ) ) ( not ( = ?auto_463574 ?auto_463587 ) ) ( not ( = ?auto_463575 ?auto_463576 ) ) ( not ( = ?auto_463575 ?auto_463577 ) ) ( not ( = ?auto_463575 ?auto_463578 ) ) ( not ( = ?auto_463575 ?auto_463579 ) ) ( not ( = ?auto_463575 ?auto_463580 ) ) ( not ( = ?auto_463575 ?auto_463581 ) ) ( not ( = ?auto_463575 ?auto_463582 ) ) ( not ( = ?auto_463575 ?auto_463583 ) ) ( not ( = ?auto_463575 ?auto_463584 ) ) ( not ( = ?auto_463575 ?auto_463585 ) ) ( not ( = ?auto_463575 ?auto_463586 ) ) ( not ( = ?auto_463575 ?auto_463587 ) ) ( not ( = ?auto_463576 ?auto_463577 ) ) ( not ( = ?auto_463576 ?auto_463578 ) ) ( not ( = ?auto_463576 ?auto_463579 ) ) ( not ( = ?auto_463576 ?auto_463580 ) ) ( not ( = ?auto_463576 ?auto_463581 ) ) ( not ( = ?auto_463576 ?auto_463582 ) ) ( not ( = ?auto_463576 ?auto_463583 ) ) ( not ( = ?auto_463576 ?auto_463584 ) ) ( not ( = ?auto_463576 ?auto_463585 ) ) ( not ( = ?auto_463576 ?auto_463586 ) ) ( not ( = ?auto_463576 ?auto_463587 ) ) ( not ( = ?auto_463577 ?auto_463578 ) ) ( not ( = ?auto_463577 ?auto_463579 ) ) ( not ( = ?auto_463577 ?auto_463580 ) ) ( not ( = ?auto_463577 ?auto_463581 ) ) ( not ( = ?auto_463577 ?auto_463582 ) ) ( not ( = ?auto_463577 ?auto_463583 ) ) ( not ( = ?auto_463577 ?auto_463584 ) ) ( not ( = ?auto_463577 ?auto_463585 ) ) ( not ( = ?auto_463577 ?auto_463586 ) ) ( not ( = ?auto_463577 ?auto_463587 ) ) ( not ( = ?auto_463578 ?auto_463579 ) ) ( not ( = ?auto_463578 ?auto_463580 ) ) ( not ( = ?auto_463578 ?auto_463581 ) ) ( not ( = ?auto_463578 ?auto_463582 ) ) ( not ( = ?auto_463578 ?auto_463583 ) ) ( not ( = ?auto_463578 ?auto_463584 ) ) ( not ( = ?auto_463578 ?auto_463585 ) ) ( not ( = ?auto_463578 ?auto_463586 ) ) ( not ( = ?auto_463578 ?auto_463587 ) ) ( not ( = ?auto_463579 ?auto_463580 ) ) ( not ( = ?auto_463579 ?auto_463581 ) ) ( not ( = ?auto_463579 ?auto_463582 ) ) ( not ( = ?auto_463579 ?auto_463583 ) ) ( not ( = ?auto_463579 ?auto_463584 ) ) ( not ( = ?auto_463579 ?auto_463585 ) ) ( not ( = ?auto_463579 ?auto_463586 ) ) ( not ( = ?auto_463579 ?auto_463587 ) ) ( not ( = ?auto_463580 ?auto_463581 ) ) ( not ( = ?auto_463580 ?auto_463582 ) ) ( not ( = ?auto_463580 ?auto_463583 ) ) ( not ( = ?auto_463580 ?auto_463584 ) ) ( not ( = ?auto_463580 ?auto_463585 ) ) ( not ( = ?auto_463580 ?auto_463586 ) ) ( not ( = ?auto_463580 ?auto_463587 ) ) ( not ( = ?auto_463581 ?auto_463582 ) ) ( not ( = ?auto_463581 ?auto_463583 ) ) ( not ( = ?auto_463581 ?auto_463584 ) ) ( not ( = ?auto_463581 ?auto_463585 ) ) ( not ( = ?auto_463581 ?auto_463586 ) ) ( not ( = ?auto_463581 ?auto_463587 ) ) ( not ( = ?auto_463582 ?auto_463583 ) ) ( not ( = ?auto_463582 ?auto_463584 ) ) ( not ( = ?auto_463582 ?auto_463585 ) ) ( not ( = ?auto_463582 ?auto_463586 ) ) ( not ( = ?auto_463582 ?auto_463587 ) ) ( not ( = ?auto_463583 ?auto_463584 ) ) ( not ( = ?auto_463583 ?auto_463585 ) ) ( not ( = ?auto_463583 ?auto_463586 ) ) ( not ( = ?auto_463583 ?auto_463587 ) ) ( not ( = ?auto_463584 ?auto_463585 ) ) ( not ( = ?auto_463584 ?auto_463586 ) ) ( not ( = ?auto_463584 ?auto_463587 ) ) ( not ( = ?auto_463585 ?auto_463586 ) ) ( not ( = ?auto_463585 ?auto_463587 ) ) ( not ( = ?auto_463586 ?auto_463587 ) ) ( ON ?auto_463585 ?auto_463586 ) ( ON ?auto_463584 ?auto_463585 ) ( ON ?auto_463583 ?auto_463584 ) ( ON ?auto_463582 ?auto_463583 ) ( ON ?auto_463581 ?auto_463582 ) ( CLEAR ?auto_463579 ) ( ON ?auto_463580 ?auto_463581 ) ( CLEAR ?auto_463580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_463573 ?auto_463574 ?auto_463575 ?auto_463576 ?auto_463577 ?auto_463578 ?auto_463579 ?auto_463580 )
      ( MAKE-14PILE ?auto_463573 ?auto_463574 ?auto_463575 ?auto_463576 ?auto_463577 ?auto_463578 ?auto_463579 ?auto_463580 ?auto_463581 ?auto_463582 ?auto_463583 ?auto_463584 ?auto_463585 ?auto_463586 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463602 - BLOCK
      ?auto_463603 - BLOCK
      ?auto_463604 - BLOCK
      ?auto_463605 - BLOCK
      ?auto_463606 - BLOCK
      ?auto_463607 - BLOCK
      ?auto_463608 - BLOCK
      ?auto_463609 - BLOCK
      ?auto_463610 - BLOCK
      ?auto_463611 - BLOCK
      ?auto_463612 - BLOCK
      ?auto_463613 - BLOCK
      ?auto_463614 - BLOCK
      ?auto_463615 - BLOCK
    )
    :vars
    (
      ?auto_463616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463615 ?auto_463616 ) ( ON-TABLE ?auto_463602 ) ( ON ?auto_463603 ?auto_463602 ) ( ON ?auto_463604 ?auto_463603 ) ( ON ?auto_463605 ?auto_463604 ) ( ON ?auto_463606 ?auto_463605 ) ( ON ?auto_463607 ?auto_463606 ) ( not ( = ?auto_463602 ?auto_463603 ) ) ( not ( = ?auto_463602 ?auto_463604 ) ) ( not ( = ?auto_463602 ?auto_463605 ) ) ( not ( = ?auto_463602 ?auto_463606 ) ) ( not ( = ?auto_463602 ?auto_463607 ) ) ( not ( = ?auto_463602 ?auto_463608 ) ) ( not ( = ?auto_463602 ?auto_463609 ) ) ( not ( = ?auto_463602 ?auto_463610 ) ) ( not ( = ?auto_463602 ?auto_463611 ) ) ( not ( = ?auto_463602 ?auto_463612 ) ) ( not ( = ?auto_463602 ?auto_463613 ) ) ( not ( = ?auto_463602 ?auto_463614 ) ) ( not ( = ?auto_463602 ?auto_463615 ) ) ( not ( = ?auto_463602 ?auto_463616 ) ) ( not ( = ?auto_463603 ?auto_463604 ) ) ( not ( = ?auto_463603 ?auto_463605 ) ) ( not ( = ?auto_463603 ?auto_463606 ) ) ( not ( = ?auto_463603 ?auto_463607 ) ) ( not ( = ?auto_463603 ?auto_463608 ) ) ( not ( = ?auto_463603 ?auto_463609 ) ) ( not ( = ?auto_463603 ?auto_463610 ) ) ( not ( = ?auto_463603 ?auto_463611 ) ) ( not ( = ?auto_463603 ?auto_463612 ) ) ( not ( = ?auto_463603 ?auto_463613 ) ) ( not ( = ?auto_463603 ?auto_463614 ) ) ( not ( = ?auto_463603 ?auto_463615 ) ) ( not ( = ?auto_463603 ?auto_463616 ) ) ( not ( = ?auto_463604 ?auto_463605 ) ) ( not ( = ?auto_463604 ?auto_463606 ) ) ( not ( = ?auto_463604 ?auto_463607 ) ) ( not ( = ?auto_463604 ?auto_463608 ) ) ( not ( = ?auto_463604 ?auto_463609 ) ) ( not ( = ?auto_463604 ?auto_463610 ) ) ( not ( = ?auto_463604 ?auto_463611 ) ) ( not ( = ?auto_463604 ?auto_463612 ) ) ( not ( = ?auto_463604 ?auto_463613 ) ) ( not ( = ?auto_463604 ?auto_463614 ) ) ( not ( = ?auto_463604 ?auto_463615 ) ) ( not ( = ?auto_463604 ?auto_463616 ) ) ( not ( = ?auto_463605 ?auto_463606 ) ) ( not ( = ?auto_463605 ?auto_463607 ) ) ( not ( = ?auto_463605 ?auto_463608 ) ) ( not ( = ?auto_463605 ?auto_463609 ) ) ( not ( = ?auto_463605 ?auto_463610 ) ) ( not ( = ?auto_463605 ?auto_463611 ) ) ( not ( = ?auto_463605 ?auto_463612 ) ) ( not ( = ?auto_463605 ?auto_463613 ) ) ( not ( = ?auto_463605 ?auto_463614 ) ) ( not ( = ?auto_463605 ?auto_463615 ) ) ( not ( = ?auto_463605 ?auto_463616 ) ) ( not ( = ?auto_463606 ?auto_463607 ) ) ( not ( = ?auto_463606 ?auto_463608 ) ) ( not ( = ?auto_463606 ?auto_463609 ) ) ( not ( = ?auto_463606 ?auto_463610 ) ) ( not ( = ?auto_463606 ?auto_463611 ) ) ( not ( = ?auto_463606 ?auto_463612 ) ) ( not ( = ?auto_463606 ?auto_463613 ) ) ( not ( = ?auto_463606 ?auto_463614 ) ) ( not ( = ?auto_463606 ?auto_463615 ) ) ( not ( = ?auto_463606 ?auto_463616 ) ) ( not ( = ?auto_463607 ?auto_463608 ) ) ( not ( = ?auto_463607 ?auto_463609 ) ) ( not ( = ?auto_463607 ?auto_463610 ) ) ( not ( = ?auto_463607 ?auto_463611 ) ) ( not ( = ?auto_463607 ?auto_463612 ) ) ( not ( = ?auto_463607 ?auto_463613 ) ) ( not ( = ?auto_463607 ?auto_463614 ) ) ( not ( = ?auto_463607 ?auto_463615 ) ) ( not ( = ?auto_463607 ?auto_463616 ) ) ( not ( = ?auto_463608 ?auto_463609 ) ) ( not ( = ?auto_463608 ?auto_463610 ) ) ( not ( = ?auto_463608 ?auto_463611 ) ) ( not ( = ?auto_463608 ?auto_463612 ) ) ( not ( = ?auto_463608 ?auto_463613 ) ) ( not ( = ?auto_463608 ?auto_463614 ) ) ( not ( = ?auto_463608 ?auto_463615 ) ) ( not ( = ?auto_463608 ?auto_463616 ) ) ( not ( = ?auto_463609 ?auto_463610 ) ) ( not ( = ?auto_463609 ?auto_463611 ) ) ( not ( = ?auto_463609 ?auto_463612 ) ) ( not ( = ?auto_463609 ?auto_463613 ) ) ( not ( = ?auto_463609 ?auto_463614 ) ) ( not ( = ?auto_463609 ?auto_463615 ) ) ( not ( = ?auto_463609 ?auto_463616 ) ) ( not ( = ?auto_463610 ?auto_463611 ) ) ( not ( = ?auto_463610 ?auto_463612 ) ) ( not ( = ?auto_463610 ?auto_463613 ) ) ( not ( = ?auto_463610 ?auto_463614 ) ) ( not ( = ?auto_463610 ?auto_463615 ) ) ( not ( = ?auto_463610 ?auto_463616 ) ) ( not ( = ?auto_463611 ?auto_463612 ) ) ( not ( = ?auto_463611 ?auto_463613 ) ) ( not ( = ?auto_463611 ?auto_463614 ) ) ( not ( = ?auto_463611 ?auto_463615 ) ) ( not ( = ?auto_463611 ?auto_463616 ) ) ( not ( = ?auto_463612 ?auto_463613 ) ) ( not ( = ?auto_463612 ?auto_463614 ) ) ( not ( = ?auto_463612 ?auto_463615 ) ) ( not ( = ?auto_463612 ?auto_463616 ) ) ( not ( = ?auto_463613 ?auto_463614 ) ) ( not ( = ?auto_463613 ?auto_463615 ) ) ( not ( = ?auto_463613 ?auto_463616 ) ) ( not ( = ?auto_463614 ?auto_463615 ) ) ( not ( = ?auto_463614 ?auto_463616 ) ) ( not ( = ?auto_463615 ?auto_463616 ) ) ( ON ?auto_463614 ?auto_463615 ) ( ON ?auto_463613 ?auto_463614 ) ( ON ?auto_463612 ?auto_463613 ) ( ON ?auto_463611 ?auto_463612 ) ( ON ?auto_463610 ?auto_463611 ) ( ON ?auto_463609 ?auto_463610 ) ( CLEAR ?auto_463607 ) ( ON ?auto_463608 ?auto_463609 ) ( CLEAR ?auto_463608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_463602 ?auto_463603 ?auto_463604 ?auto_463605 ?auto_463606 ?auto_463607 ?auto_463608 )
      ( MAKE-14PILE ?auto_463602 ?auto_463603 ?auto_463604 ?auto_463605 ?auto_463606 ?auto_463607 ?auto_463608 ?auto_463609 ?auto_463610 ?auto_463611 ?auto_463612 ?auto_463613 ?auto_463614 ?auto_463615 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463631 - BLOCK
      ?auto_463632 - BLOCK
      ?auto_463633 - BLOCK
      ?auto_463634 - BLOCK
      ?auto_463635 - BLOCK
      ?auto_463636 - BLOCK
      ?auto_463637 - BLOCK
      ?auto_463638 - BLOCK
      ?auto_463639 - BLOCK
      ?auto_463640 - BLOCK
      ?auto_463641 - BLOCK
      ?auto_463642 - BLOCK
      ?auto_463643 - BLOCK
      ?auto_463644 - BLOCK
    )
    :vars
    (
      ?auto_463645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463644 ?auto_463645 ) ( ON-TABLE ?auto_463631 ) ( ON ?auto_463632 ?auto_463631 ) ( ON ?auto_463633 ?auto_463632 ) ( ON ?auto_463634 ?auto_463633 ) ( ON ?auto_463635 ?auto_463634 ) ( ON ?auto_463636 ?auto_463635 ) ( not ( = ?auto_463631 ?auto_463632 ) ) ( not ( = ?auto_463631 ?auto_463633 ) ) ( not ( = ?auto_463631 ?auto_463634 ) ) ( not ( = ?auto_463631 ?auto_463635 ) ) ( not ( = ?auto_463631 ?auto_463636 ) ) ( not ( = ?auto_463631 ?auto_463637 ) ) ( not ( = ?auto_463631 ?auto_463638 ) ) ( not ( = ?auto_463631 ?auto_463639 ) ) ( not ( = ?auto_463631 ?auto_463640 ) ) ( not ( = ?auto_463631 ?auto_463641 ) ) ( not ( = ?auto_463631 ?auto_463642 ) ) ( not ( = ?auto_463631 ?auto_463643 ) ) ( not ( = ?auto_463631 ?auto_463644 ) ) ( not ( = ?auto_463631 ?auto_463645 ) ) ( not ( = ?auto_463632 ?auto_463633 ) ) ( not ( = ?auto_463632 ?auto_463634 ) ) ( not ( = ?auto_463632 ?auto_463635 ) ) ( not ( = ?auto_463632 ?auto_463636 ) ) ( not ( = ?auto_463632 ?auto_463637 ) ) ( not ( = ?auto_463632 ?auto_463638 ) ) ( not ( = ?auto_463632 ?auto_463639 ) ) ( not ( = ?auto_463632 ?auto_463640 ) ) ( not ( = ?auto_463632 ?auto_463641 ) ) ( not ( = ?auto_463632 ?auto_463642 ) ) ( not ( = ?auto_463632 ?auto_463643 ) ) ( not ( = ?auto_463632 ?auto_463644 ) ) ( not ( = ?auto_463632 ?auto_463645 ) ) ( not ( = ?auto_463633 ?auto_463634 ) ) ( not ( = ?auto_463633 ?auto_463635 ) ) ( not ( = ?auto_463633 ?auto_463636 ) ) ( not ( = ?auto_463633 ?auto_463637 ) ) ( not ( = ?auto_463633 ?auto_463638 ) ) ( not ( = ?auto_463633 ?auto_463639 ) ) ( not ( = ?auto_463633 ?auto_463640 ) ) ( not ( = ?auto_463633 ?auto_463641 ) ) ( not ( = ?auto_463633 ?auto_463642 ) ) ( not ( = ?auto_463633 ?auto_463643 ) ) ( not ( = ?auto_463633 ?auto_463644 ) ) ( not ( = ?auto_463633 ?auto_463645 ) ) ( not ( = ?auto_463634 ?auto_463635 ) ) ( not ( = ?auto_463634 ?auto_463636 ) ) ( not ( = ?auto_463634 ?auto_463637 ) ) ( not ( = ?auto_463634 ?auto_463638 ) ) ( not ( = ?auto_463634 ?auto_463639 ) ) ( not ( = ?auto_463634 ?auto_463640 ) ) ( not ( = ?auto_463634 ?auto_463641 ) ) ( not ( = ?auto_463634 ?auto_463642 ) ) ( not ( = ?auto_463634 ?auto_463643 ) ) ( not ( = ?auto_463634 ?auto_463644 ) ) ( not ( = ?auto_463634 ?auto_463645 ) ) ( not ( = ?auto_463635 ?auto_463636 ) ) ( not ( = ?auto_463635 ?auto_463637 ) ) ( not ( = ?auto_463635 ?auto_463638 ) ) ( not ( = ?auto_463635 ?auto_463639 ) ) ( not ( = ?auto_463635 ?auto_463640 ) ) ( not ( = ?auto_463635 ?auto_463641 ) ) ( not ( = ?auto_463635 ?auto_463642 ) ) ( not ( = ?auto_463635 ?auto_463643 ) ) ( not ( = ?auto_463635 ?auto_463644 ) ) ( not ( = ?auto_463635 ?auto_463645 ) ) ( not ( = ?auto_463636 ?auto_463637 ) ) ( not ( = ?auto_463636 ?auto_463638 ) ) ( not ( = ?auto_463636 ?auto_463639 ) ) ( not ( = ?auto_463636 ?auto_463640 ) ) ( not ( = ?auto_463636 ?auto_463641 ) ) ( not ( = ?auto_463636 ?auto_463642 ) ) ( not ( = ?auto_463636 ?auto_463643 ) ) ( not ( = ?auto_463636 ?auto_463644 ) ) ( not ( = ?auto_463636 ?auto_463645 ) ) ( not ( = ?auto_463637 ?auto_463638 ) ) ( not ( = ?auto_463637 ?auto_463639 ) ) ( not ( = ?auto_463637 ?auto_463640 ) ) ( not ( = ?auto_463637 ?auto_463641 ) ) ( not ( = ?auto_463637 ?auto_463642 ) ) ( not ( = ?auto_463637 ?auto_463643 ) ) ( not ( = ?auto_463637 ?auto_463644 ) ) ( not ( = ?auto_463637 ?auto_463645 ) ) ( not ( = ?auto_463638 ?auto_463639 ) ) ( not ( = ?auto_463638 ?auto_463640 ) ) ( not ( = ?auto_463638 ?auto_463641 ) ) ( not ( = ?auto_463638 ?auto_463642 ) ) ( not ( = ?auto_463638 ?auto_463643 ) ) ( not ( = ?auto_463638 ?auto_463644 ) ) ( not ( = ?auto_463638 ?auto_463645 ) ) ( not ( = ?auto_463639 ?auto_463640 ) ) ( not ( = ?auto_463639 ?auto_463641 ) ) ( not ( = ?auto_463639 ?auto_463642 ) ) ( not ( = ?auto_463639 ?auto_463643 ) ) ( not ( = ?auto_463639 ?auto_463644 ) ) ( not ( = ?auto_463639 ?auto_463645 ) ) ( not ( = ?auto_463640 ?auto_463641 ) ) ( not ( = ?auto_463640 ?auto_463642 ) ) ( not ( = ?auto_463640 ?auto_463643 ) ) ( not ( = ?auto_463640 ?auto_463644 ) ) ( not ( = ?auto_463640 ?auto_463645 ) ) ( not ( = ?auto_463641 ?auto_463642 ) ) ( not ( = ?auto_463641 ?auto_463643 ) ) ( not ( = ?auto_463641 ?auto_463644 ) ) ( not ( = ?auto_463641 ?auto_463645 ) ) ( not ( = ?auto_463642 ?auto_463643 ) ) ( not ( = ?auto_463642 ?auto_463644 ) ) ( not ( = ?auto_463642 ?auto_463645 ) ) ( not ( = ?auto_463643 ?auto_463644 ) ) ( not ( = ?auto_463643 ?auto_463645 ) ) ( not ( = ?auto_463644 ?auto_463645 ) ) ( ON ?auto_463643 ?auto_463644 ) ( ON ?auto_463642 ?auto_463643 ) ( ON ?auto_463641 ?auto_463642 ) ( ON ?auto_463640 ?auto_463641 ) ( ON ?auto_463639 ?auto_463640 ) ( ON ?auto_463638 ?auto_463639 ) ( CLEAR ?auto_463636 ) ( ON ?auto_463637 ?auto_463638 ) ( CLEAR ?auto_463637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_463631 ?auto_463632 ?auto_463633 ?auto_463634 ?auto_463635 ?auto_463636 ?auto_463637 )
      ( MAKE-14PILE ?auto_463631 ?auto_463632 ?auto_463633 ?auto_463634 ?auto_463635 ?auto_463636 ?auto_463637 ?auto_463638 ?auto_463639 ?auto_463640 ?auto_463641 ?auto_463642 ?auto_463643 ?auto_463644 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463660 - BLOCK
      ?auto_463661 - BLOCK
      ?auto_463662 - BLOCK
      ?auto_463663 - BLOCK
      ?auto_463664 - BLOCK
      ?auto_463665 - BLOCK
      ?auto_463666 - BLOCK
      ?auto_463667 - BLOCK
      ?auto_463668 - BLOCK
      ?auto_463669 - BLOCK
      ?auto_463670 - BLOCK
      ?auto_463671 - BLOCK
      ?auto_463672 - BLOCK
      ?auto_463673 - BLOCK
    )
    :vars
    (
      ?auto_463674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463673 ?auto_463674 ) ( ON-TABLE ?auto_463660 ) ( ON ?auto_463661 ?auto_463660 ) ( ON ?auto_463662 ?auto_463661 ) ( ON ?auto_463663 ?auto_463662 ) ( ON ?auto_463664 ?auto_463663 ) ( not ( = ?auto_463660 ?auto_463661 ) ) ( not ( = ?auto_463660 ?auto_463662 ) ) ( not ( = ?auto_463660 ?auto_463663 ) ) ( not ( = ?auto_463660 ?auto_463664 ) ) ( not ( = ?auto_463660 ?auto_463665 ) ) ( not ( = ?auto_463660 ?auto_463666 ) ) ( not ( = ?auto_463660 ?auto_463667 ) ) ( not ( = ?auto_463660 ?auto_463668 ) ) ( not ( = ?auto_463660 ?auto_463669 ) ) ( not ( = ?auto_463660 ?auto_463670 ) ) ( not ( = ?auto_463660 ?auto_463671 ) ) ( not ( = ?auto_463660 ?auto_463672 ) ) ( not ( = ?auto_463660 ?auto_463673 ) ) ( not ( = ?auto_463660 ?auto_463674 ) ) ( not ( = ?auto_463661 ?auto_463662 ) ) ( not ( = ?auto_463661 ?auto_463663 ) ) ( not ( = ?auto_463661 ?auto_463664 ) ) ( not ( = ?auto_463661 ?auto_463665 ) ) ( not ( = ?auto_463661 ?auto_463666 ) ) ( not ( = ?auto_463661 ?auto_463667 ) ) ( not ( = ?auto_463661 ?auto_463668 ) ) ( not ( = ?auto_463661 ?auto_463669 ) ) ( not ( = ?auto_463661 ?auto_463670 ) ) ( not ( = ?auto_463661 ?auto_463671 ) ) ( not ( = ?auto_463661 ?auto_463672 ) ) ( not ( = ?auto_463661 ?auto_463673 ) ) ( not ( = ?auto_463661 ?auto_463674 ) ) ( not ( = ?auto_463662 ?auto_463663 ) ) ( not ( = ?auto_463662 ?auto_463664 ) ) ( not ( = ?auto_463662 ?auto_463665 ) ) ( not ( = ?auto_463662 ?auto_463666 ) ) ( not ( = ?auto_463662 ?auto_463667 ) ) ( not ( = ?auto_463662 ?auto_463668 ) ) ( not ( = ?auto_463662 ?auto_463669 ) ) ( not ( = ?auto_463662 ?auto_463670 ) ) ( not ( = ?auto_463662 ?auto_463671 ) ) ( not ( = ?auto_463662 ?auto_463672 ) ) ( not ( = ?auto_463662 ?auto_463673 ) ) ( not ( = ?auto_463662 ?auto_463674 ) ) ( not ( = ?auto_463663 ?auto_463664 ) ) ( not ( = ?auto_463663 ?auto_463665 ) ) ( not ( = ?auto_463663 ?auto_463666 ) ) ( not ( = ?auto_463663 ?auto_463667 ) ) ( not ( = ?auto_463663 ?auto_463668 ) ) ( not ( = ?auto_463663 ?auto_463669 ) ) ( not ( = ?auto_463663 ?auto_463670 ) ) ( not ( = ?auto_463663 ?auto_463671 ) ) ( not ( = ?auto_463663 ?auto_463672 ) ) ( not ( = ?auto_463663 ?auto_463673 ) ) ( not ( = ?auto_463663 ?auto_463674 ) ) ( not ( = ?auto_463664 ?auto_463665 ) ) ( not ( = ?auto_463664 ?auto_463666 ) ) ( not ( = ?auto_463664 ?auto_463667 ) ) ( not ( = ?auto_463664 ?auto_463668 ) ) ( not ( = ?auto_463664 ?auto_463669 ) ) ( not ( = ?auto_463664 ?auto_463670 ) ) ( not ( = ?auto_463664 ?auto_463671 ) ) ( not ( = ?auto_463664 ?auto_463672 ) ) ( not ( = ?auto_463664 ?auto_463673 ) ) ( not ( = ?auto_463664 ?auto_463674 ) ) ( not ( = ?auto_463665 ?auto_463666 ) ) ( not ( = ?auto_463665 ?auto_463667 ) ) ( not ( = ?auto_463665 ?auto_463668 ) ) ( not ( = ?auto_463665 ?auto_463669 ) ) ( not ( = ?auto_463665 ?auto_463670 ) ) ( not ( = ?auto_463665 ?auto_463671 ) ) ( not ( = ?auto_463665 ?auto_463672 ) ) ( not ( = ?auto_463665 ?auto_463673 ) ) ( not ( = ?auto_463665 ?auto_463674 ) ) ( not ( = ?auto_463666 ?auto_463667 ) ) ( not ( = ?auto_463666 ?auto_463668 ) ) ( not ( = ?auto_463666 ?auto_463669 ) ) ( not ( = ?auto_463666 ?auto_463670 ) ) ( not ( = ?auto_463666 ?auto_463671 ) ) ( not ( = ?auto_463666 ?auto_463672 ) ) ( not ( = ?auto_463666 ?auto_463673 ) ) ( not ( = ?auto_463666 ?auto_463674 ) ) ( not ( = ?auto_463667 ?auto_463668 ) ) ( not ( = ?auto_463667 ?auto_463669 ) ) ( not ( = ?auto_463667 ?auto_463670 ) ) ( not ( = ?auto_463667 ?auto_463671 ) ) ( not ( = ?auto_463667 ?auto_463672 ) ) ( not ( = ?auto_463667 ?auto_463673 ) ) ( not ( = ?auto_463667 ?auto_463674 ) ) ( not ( = ?auto_463668 ?auto_463669 ) ) ( not ( = ?auto_463668 ?auto_463670 ) ) ( not ( = ?auto_463668 ?auto_463671 ) ) ( not ( = ?auto_463668 ?auto_463672 ) ) ( not ( = ?auto_463668 ?auto_463673 ) ) ( not ( = ?auto_463668 ?auto_463674 ) ) ( not ( = ?auto_463669 ?auto_463670 ) ) ( not ( = ?auto_463669 ?auto_463671 ) ) ( not ( = ?auto_463669 ?auto_463672 ) ) ( not ( = ?auto_463669 ?auto_463673 ) ) ( not ( = ?auto_463669 ?auto_463674 ) ) ( not ( = ?auto_463670 ?auto_463671 ) ) ( not ( = ?auto_463670 ?auto_463672 ) ) ( not ( = ?auto_463670 ?auto_463673 ) ) ( not ( = ?auto_463670 ?auto_463674 ) ) ( not ( = ?auto_463671 ?auto_463672 ) ) ( not ( = ?auto_463671 ?auto_463673 ) ) ( not ( = ?auto_463671 ?auto_463674 ) ) ( not ( = ?auto_463672 ?auto_463673 ) ) ( not ( = ?auto_463672 ?auto_463674 ) ) ( not ( = ?auto_463673 ?auto_463674 ) ) ( ON ?auto_463672 ?auto_463673 ) ( ON ?auto_463671 ?auto_463672 ) ( ON ?auto_463670 ?auto_463671 ) ( ON ?auto_463669 ?auto_463670 ) ( ON ?auto_463668 ?auto_463669 ) ( ON ?auto_463667 ?auto_463668 ) ( ON ?auto_463666 ?auto_463667 ) ( CLEAR ?auto_463664 ) ( ON ?auto_463665 ?auto_463666 ) ( CLEAR ?auto_463665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_463660 ?auto_463661 ?auto_463662 ?auto_463663 ?auto_463664 ?auto_463665 )
      ( MAKE-14PILE ?auto_463660 ?auto_463661 ?auto_463662 ?auto_463663 ?auto_463664 ?auto_463665 ?auto_463666 ?auto_463667 ?auto_463668 ?auto_463669 ?auto_463670 ?auto_463671 ?auto_463672 ?auto_463673 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463689 - BLOCK
      ?auto_463690 - BLOCK
      ?auto_463691 - BLOCK
      ?auto_463692 - BLOCK
      ?auto_463693 - BLOCK
      ?auto_463694 - BLOCK
      ?auto_463695 - BLOCK
      ?auto_463696 - BLOCK
      ?auto_463697 - BLOCK
      ?auto_463698 - BLOCK
      ?auto_463699 - BLOCK
      ?auto_463700 - BLOCK
      ?auto_463701 - BLOCK
      ?auto_463702 - BLOCK
    )
    :vars
    (
      ?auto_463703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463702 ?auto_463703 ) ( ON-TABLE ?auto_463689 ) ( ON ?auto_463690 ?auto_463689 ) ( ON ?auto_463691 ?auto_463690 ) ( ON ?auto_463692 ?auto_463691 ) ( ON ?auto_463693 ?auto_463692 ) ( not ( = ?auto_463689 ?auto_463690 ) ) ( not ( = ?auto_463689 ?auto_463691 ) ) ( not ( = ?auto_463689 ?auto_463692 ) ) ( not ( = ?auto_463689 ?auto_463693 ) ) ( not ( = ?auto_463689 ?auto_463694 ) ) ( not ( = ?auto_463689 ?auto_463695 ) ) ( not ( = ?auto_463689 ?auto_463696 ) ) ( not ( = ?auto_463689 ?auto_463697 ) ) ( not ( = ?auto_463689 ?auto_463698 ) ) ( not ( = ?auto_463689 ?auto_463699 ) ) ( not ( = ?auto_463689 ?auto_463700 ) ) ( not ( = ?auto_463689 ?auto_463701 ) ) ( not ( = ?auto_463689 ?auto_463702 ) ) ( not ( = ?auto_463689 ?auto_463703 ) ) ( not ( = ?auto_463690 ?auto_463691 ) ) ( not ( = ?auto_463690 ?auto_463692 ) ) ( not ( = ?auto_463690 ?auto_463693 ) ) ( not ( = ?auto_463690 ?auto_463694 ) ) ( not ( = ?auto_463690 ?auto_463695 ) ) ( not ( = ?auto_463690 ?auto_463696 ) ) ( not ( = ?auto_463690 ?auto_463697 ) ) ( not ( = ?auto_463690 ?auto_463698 ) ) ( not ( = ?auto_463690 ?auto_463699 ) ) ( not ( = ?auto_463690 ?auto_463700 ) ) ( not ( = ?auto_463690 ?auto_463701 ) ) ( not ( = ?auto_463690 ?auto_463702 ) ) ( not ( = ?auto_463690 ?auto_463703 ) ) ( not ( = ?auto_463691 ?auto_463692 ) ) ( not ( = ?auto_463691 ?auto_463693 ) ) ( not ( = ?auto_463691 ?auto_463694 ) ) ( not ( = ?auto_463691 ?auto_463695 ) ) ( not ( = ?auto_463691 ?auto_463696 ) ) ( not ( = ?auto_463691 ?auto_463697 ) ) ( not ( = ?auto_463691 ?auto_463698 ) ) ( not ( = ?auto_463691 ?auto_463699 ) ) ( not ( = ?auto_463691 ?auto_463700 ) ) ( not ( = ?auto_463691 ?auto_463701 ) ) ( not ( = ?auto_463691 ?auto_463702 ) ) ( not ( = ?auto_463691 ?auto_463703 ) ) ( not ( = ?auto_463692 ?auto_463693 ) ) ( not ( = ?auto_463692 ?auto_463694 ) ) ( not ( = ?auto_463692 ?auto_463695 ) ) ( not ( = ?auto_463692 ?auto_463696 ) ) ( not ( = ?auto_463692 ?auto_463697 ) ) ( not ( = ?auto_463692 ?auto_463698 ) ) ( not ( = ?auto_463692 ?auto_463699 ) ) ( not ( = ?auto_463692 ?auto_463700 ) ) ( not ( = ?auto_463692 ?auto_463701 ) ) ( not ( = ?auto_463692 ?auto_463702 ) ) ( not ( = ?auto_463692 ?auto_463703 ) ) ( not ( = ?auto_463693 ?auto_463694 ) ) ( not ( = ?auto_463693 ?auto_463695 ) ) ( not ( = ?auto_463693 ?auto_463696 ) ) ( not ( = ?auto_463693 ?auto_463697 ) ) ( not ( = ?auto_463693 ?auto_463698 ) ) ( not ( = ?auto_463693 ?auto_463699 ) ) ( not ( = ?auto_463693 ?auto_463700 ) ) ( not ( = ?auto_463693 ?auto_463701 ) ) ( not ( = ?auto_463693 ?auto_463702 ) ) ( not ( = ?auto_463693 ?auto_463703 ) ) ( not ( = ?auto_463694 ?auto_463695 ) ) ( not ( = ?auto_463694 ?auto_463696 ) ) ( not ( = ?auto_463694 ?auto_463697 ) ) ( not ( = ?auto_463694 ?auto_463698 ) ) ( not ( = ?auto_463694 ?auto_463699 ) ) ( not ( = ?auto_463694 ?auto_463700 ) ) ( not ( = ?auto_463694 ?auto_463701 ) ) ( not ( = ?auto_463694 ?auto_463702 ) ) ( not ( = ?auto_463694 ?auto_463703 ) ) ( not ( = ?auto_463695 ?auto_463696 ) ) ( not ( = ?auto_463695 ?auto_463697 ) ) ( not ( = ?auto_463695 ?auto_463698 ) ) ( not ( = ?auto_463695 ?auto_463699 ) ) ( not ( = ?auto_463695 ?auto_463700 ) ) ( not ( = ?auto_463695 ?auto_463701 ) ) ( not ( = ?auto_463695 ?auto_463702 ) ) ( not ( = ?auto_463695 ?auto_463703 ) ) ( not ( = ?auto_463696 ?auto_463697 ) ) ( not ( = ?auto_463696 ?auto_463698 ) ) ( not ( = ?auto_463696 ?auto_463699 ) ) ( not ( = ?auto_463696 ?auto_463700 ) ) ( not ( = ?auto_463696 ?auto_463701 ) ) ( not ( = ?auto_463696 ?auto_463702 ) ) ( not ( = ?auto_463696 ?auto_463703 ) ) ( not ( = ?auto_463697 ?auto_463698 ) ) ( not ( = ?auto_463697 ?auto_463699 ) ) ( not ( = ?auto_463697 ?auto_463700 ) ) ( not ( = ?auto_463697 ?auto_463701 ) ) ( not ( = ?auto_463697 ?auto_463702 ) ) ( not ( = ?auto_463697 ?auto_463703 ) ) ( not ( = ?auto_463698 ?auto_463699 ) ) ( not ( = ?auto_463698 ?auto_463700 ) ) ( not ( = ?auto_463698 ?auto_463701 ) ) ( not ( = ?auto_463698 ?auto_463702 ) ) ( not ( = ?auto_463698 ?auto_463703 ) ) ( not ( = ?auto_463699 ?auto_463700 ) ) ( not ( = ?auto_463699 ?auto_463701 ) ) ( not ( = ?auto_463699 ?auto_463702 ) ) ( not ( = ?auto_463699 ?auto_463703 ) ) ( not ( = ?auto_463700 ?auto_463701 ) ) ( not ( = ?auto_463700 ?auto_463702 ) ) ( not ( = ?auto_463700 ?auto_463703 ) ) ( not ( = ?auto_463701 ?auto_463702 ) ) ( not ( = ?auto_463701 ?auto_463703 ) ) ( not ( = ?auto_463702 ?auto_463703 ) ) ( ON ?auto_463701 ?auto_463702 ) ( ON ?auto_463700 ?auto_463701 ) ( ON ?auto_463699 ?auto_463700 ) ( ON ?auto_463698 ?auto_463699 ) ( ON ?auto_463697 ?auto_463698 ) ( ON ?auto_463696 ?auto_463697 ) ( ON ?auto_463695 ?auto_463696 ) ( CLEAR ?auto_463693 ) ( ON ?auto_463694 ?auto_463695 ) ( CLEAR ?auto_463694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_463689 ?auto_463690 ?auto_463691 ?auto_463692 ?auto_463693 ?auto_463694 )
      ( MAKE-14PILE ?auto_463689 ?auto_463690 ?auto_463691 ?auto_463692 ?auto_463693 ?auto_463694 ?auto_463695 ?auto_463696 ?auto_463697 ?auto_463698 ?auto_463699 ?auto_463700 ?auto_463701 ?auto_463702 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463718 - BLOCK
      ?auto_463719 - BLOCK
      ?auto_463720 - BLOCK
      ?auto_463721 - BLOCK
      ?auto_463722 - BLOCK
      ?auto_463723 - BLOCK
      ?auto_463724 - BLOCK
      ?auto_463725 - BLOCK
      ?auto_463726 - BLOCK
      ?auto_463727 - BLOCK
      ?auto_463728 - BLOCK
      ?auto_463729 - BLOCK
      ?auto_463730 - BLOCK
      ?auto_463731 - BLOCK
    )
    :vars
    (
      ?auto_463732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463731 ?auto_463732 ) ( ON-TABLE ?auto_463718 ) ( ON ?auto_463719 ?auto_463718 ) ( ON ?auto_463720 ?auto_463719 ) ( ON ?auto_463721 ?auto_463720 ) ( not ( = ?auto_463718 ?auto_463719 ) ) ( not ( = ?auto_463718 ?auto_463720 ) ) ( not ( = ?auto_463718 ?auto_463721 ) ) ( not ( = ?auto_463718 ?auto_463722 ) ) ( not ( = ?auto_463718 ?auto_463723 ) ) ( not ( = ?auto_463718 ?auto_463724 ) ) ( not ( = ?auto_463718 ?auto_463725 ) ) ( not ( = ?auto_463718 ?auto_463726 ) ) ( not ( = ?auto_463718 ?auto_463727 ) ) ( not ( = ?auto_463718 ?auto_463728 ) ) ( not ( = ?auto_463718 ?auto_463729 ) ) ( not ( = ?auto_463718 ?auto_463730 ) ) ( not ( = ?auto_463718 ?auto_463731 ) ) ( not ( = ?auto_463718 ?auto_463732 ) ) ( not ( = ?auto_463719 ?auto_463720 ) ) ( not ( = ?auto_463719 ?auto_463721 ) ) ( not ( = ?auto_463719 ?auto_463722 ) ) ( not ( = ?auto_463719 ?auto_463723 ) ) ( not ( = ?auto_463719 ?auto_463724 ) ) ( not ( = ?auto_463719 ?auto_463725 ) ) ( not ( = ?auto_463719 ?auto_463726 ) ) ( not ( = ?auto_463719 ?auto_463727 ) ) ( not ( = ?auto_463719 ?auto_463728 ) ) ( not ( = ?auto_463719 ?auto_463729 ) ) ( not ( = ?auto_463719 ?auto_463730 ) ) ( not ( = ?auto_463719 ?auto_463731 ) ) ( not ( = ?auto_463719 ?auto_463732 ) ) ( not ( = ?auto_463720 ?auto_463721 ) ) ( not ( = ?auto_463720 ?auto_463722 ) ) ( not ( = ?auto_463720 ?auto_463723 ) ) ( not ( = ?auto_463720 ?auto_463724 ) ) ( not ( = ?auto_463720 ?auto_463725 ) ) ( not ( = ?auto_463720 ?auto_463726 ) ) ( not ( = ?auto_463720 ?auto_463727 ) ) ( not ( = ?auto_463720 ?auto_463728 ) ) ( not ( = ?auto_463720 ?auto_463729 ) ) ( not ( = ?auto_463720 ?auto_463730 ) ) ( not ( = ?auto_463720 ?auto_463731 ) ) ( not ( = ?auto_463720 ?auto_463732 ) ) ( not ( = ?auto_463721 ?auto_463722 ) ) ( not ( = ?auto_463721 ?auto_463723 ) ) ( not ( = ?auto_463721 ?auto_463724 ) ) ( not ( = ?auto_463721 ?auto_463725 ) ) ( not ( = ?auto_463721 ?auto_463726 ) ) ( not ( = ?auto_463721 ?auto_463727 ) ) ( not ( = ?auto_463721 ?auto_463728 ) ) ( not ( = ?auto_463721 ?auto_463729 ) ) ( not ( = ?auto_463721 ?auto_463730 ) ) ( not ( = ?auto_463721 ?auto_463731 ) ) ( not ( = ?auto_463721 ?auto_463732 ) ) ( not ( = ?auto_463722 ?auto_463723 ) ) ( not ( = ?auto_463722 ?auto_463724 ) ) ( not ( = ?auto_463722 ?auto_463725 ) ) ( not ( = ?auto_463722 ?auto_463726 ) ) ( not ( = ?auto_463722 ?auto_463727 ) ) ( not ( = ?auto_463722 ?auto_463728 ) ) ( not ( = ?auto_463722 ?auto_463729 ) ) ( not ( = ?auto_463722 ?auto_463730 ) ) ( not ( = ?auto_463722 ?auto_463731 ) ) ( not ( = ?auto_463722 ?auto_463732 ) ) ( not ( = ?auto_463723 ?auto_463724 ) ) ( not ( = ?auto_463723 ?auto_463725 ) ) ( not ( = ?auto_463723 ?auto_463726 ) ) ( not ( = ?auto_463723 ?auto_463727 ) ) ( not ( = ?auto_463723 ?auto_463728 ) ) ( not ( = ?auto_463723 ?auto_463729 ) ) ( not ( = ?auto_463723 ?auto_463730 ) ) ( not ( = ?auto_463723 ?auto_463731 ) ) ( not ( = ?auto_463723 ?auto_463732 ) ) ( not ( = ?auto_463724 ?auto_463725 ) ) ( not ( = ?auto_463724 ?auto_463726 ) ) ( not ( = ?auto_463724 ?auto_463727 ) ) ( not ( = ?auto_463724 ?auto_463728 ) ) ( not ( = ?auto_463724 ?auto_463729 ) ) ( not ( = ?auto_463724 ?auto_463730 ) ) ( not ( = ?auto_463724 ?auto_463731 ) ) ( not ( = ?auto_463724 ?auto_463732 ) ) ( not ( = ?auto_463725 ?auto_463726 ) ) ( not ( = ?auto_463725 ?auto_463727 ) ) ( not ( = ?auto_463725 ?auto_463728 ) ) ( not ( = ?auto_463725 ?auto_463729 ) ) ( not ( = ?auto_463725 ?auto_463730 ) ) ( not ( = ?auto_463725 ?auto_463731 ) ) ( not ( = ?auto_463725 ?auto_463732 ) ) ( not ( = ?auto_463726 ?auto_463727 ) ) ( not ( = ?auto_463726 ?auto_463728 ) ) ( not ( = ?auto_463726 ?auto_463729 ) ) ( not ( = ?auto_463726 ?auto_463730 ) ) ( not ( = ?auto_463726 ?auto_463731 ) ) ( not ( = ?auto_463726 ?auto_463732 ) ) ( not ( = ?auto_463727 ?auto_463728 ) ) ( not ( = ?auto_463727 ?auto_463729 ) ) ( not ( = ?auto_463727 ?auto_463730 ) ) ( not ( = ?auto_463727 ?auto_463731 ) ) ( not ( = ?auto_463727 ?auto_463732 ) ) ( not ( = ?auto_463728 ?auto_463729 ) ) ( not ( = ?auto_463728 ?auto_463730 ) ) ( not ( = ?auto_463728 ?auto_463731 ) ) ( not ( = ?auto_463728 ?auto_463732 ) ) ( not ( = ?auto_463729 ?auto_463730 ) ) ( not ( = ?auto_463729 ?auto_463731 ) ) ( not ( = ?auto_463729 ?auto_463732 ) ) ( not ( = ?auto_463730 ?auto_463731 ) ) ( not ( = ?auto_463730 ?auto_463732 ) ) ( not ( = ?auto_463731 ?auto_463732 ) ) ( ON ?auto_463730 ?auto_463731 ) ( ON ?auto_463729 ?auto_463730 ) ( ON ?auto_463728 ?auto_463729 ) ( ON ?auto_463727 ?auto_463728 ) ( ON ?auto_463726 ?auto_463727 ) ( ON ?auto_463725 ?auto_463726 ) ( ON ?auto_463724 ?auto_463725 ) ( ON ?auto_463723 ?auto_463724 ) ( CLEAR ?auto_463721 ) ( ON ?auto_463722 ?auto_463723 ) ( CLEAR ?auto_463722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_463718 ?auto_463719 ?auto_463720 ?auto_463721 ?auto_463722 )
      ( MAKE-14PILE ?auto_463718 ?auto_463719 ?auto_463720 ?auto_463721 ?auto_463722 ?auto_463723 ?auto_463724 ?auto_463725 ?auto_463726 ?auto_463727 ?auto_463728 ?auto_463729 ?auto_463730 ?auto_463731 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463747 - BLOCK
      ?auto_463748 - BLOCK
      ?auto_463749 - BLOCK
      ?auto_463750 - BLOCK
      ?auto_463751 - BLOCK
      ?auto_463752 - BLOCK
      ?auto_463753 - BLOCK
      ?auto_463754 - BLOCK
      ?auto_463755 - BLOCK
      ?auto_463756 - BLOCK
      ?auto_463757 - BLOCK
      ?auto_463758 - BLOCK
      ?auto_463759 - BLOCK
      ?auto_463760 - BLOCK
    )
    :vars
    (
      ?auto_463761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463760 ?auto_463761 ) ( ON-TABLE ?auto_463747 ) ( ON ?auto_463748 ?auto_463747 ) ( ON ?auto_463749 ?auto_463748 ) ( ON ?auto_463750 ?auto_463749 ) ( not ( = ?auto_463747 ?auto_463748 ) ) ( not ( = ?auto_463747 ?auto_463749 ) ) ( not ( = ?auto_463747 ?auto_463750 ) ) ( not ( = ?auto_463747 ?auto_463751 ) ) ( not ( = ?auto_463747 ?auto_463752 ) ) ( not ( = ?auto_463747 ?auto_463753 ) ) ( not ( = ?auto_463747 ?auto_463754 ) ) ( not ( = ?auto_463747 ?auto_463755 ) ) ( not ( = ?auto_463747 ?auto_463756 ) ) ( not ( = ?auto_463747 ?auto_463757 ) ) ( not ( = ?auto_463747 ?auto_463758 ) ) ( not ( = ?auto_463747 ?auto_463759 ) ) ( not ( = ?auto_463747 ?auto_463760 ) ) ( not ( = ?auto_463747 ?auto_463761 ) ) ( not ( = ?auto_463748 ?auto_463749 ) ) ( not ( = ?auto_463748 ?auto_463750 ) ) ( not ( = ?auto_463748 ?auto_463751 ) ) ( not ( = ?auto_463748 ?auto_463752 ) ) ( not ( = ?auto_463748 ?auto_463753 ) ) ( not ( = ?auto_463748 ?auto_463754 ) ) ( not ( = ?auto_463748 ?auto_463755 ) ) ( not ( = ?auto_463748 ?auto_463756 ) ) ( not ( = ?auto_463748 ?auto_463757 ) ) ( not ( = ?auto_463748 ?auto_463758 ) ) ( not ( = ?auto_463748 ?auto_463759 ) ) ( not ( = ?auto_463748 ?auto_463760 ) ) ( not ( = ?auto_463748 ?auto_463761 ) ) ( not ( = ?auto_463749 ?auto_463750 ) ) ( not ( = ?auto_463749 ?auto_463751 ) ) ( not ( = ?auto_463749 ?auto_463752 ) ) ( not ( = ?auto_463749 ?auto_463753 ) ) ( not ( = ?auto_463749 ?auto_463754 ) ) ( not ( = ?auto_463749 ?auto_463755 ) ) ( not ( = ?auto_463749 ?auto_463756 ) ) ( not ( = ?auto_463749 ?auto_463757 ) ) ( not ( = ?auto_463749 ?auto_463758 ) ) ( not ( = ?auto_463749 ?auto_463759 ) ) ( not ( = ?auto_463749 ?auto_463760 ) ) ( not ( = ?auto_463749 ?auto_463761 ) ) ( not ( = ?auto_463750 ?auto_463751 ) ) ( not ( = ?auto_463750 ?auto_463752 ) ) ( not ( = ?auto_463750 ?auto_463753 ) ) ( not ( = ?auto_463750 ?auto_463754 ) ) ( not ( = ?auto_463750 ?auto_463755 ) ) ( not ( = ?auto_463750 ?auto_463756 ) ) ( not ( = ?auto_463750 ?auto_463757 ) ) ( not ( = ?auto_463750 ?auto_463758 ) ) ( not ( = ?auto_463750 ?auto_463759 ) ) ( not ( = ?auto_463750 ?auto_463760 ) ) ( not ( = ?auto_463750 ?auto_463761 ) ) ( not ( = ?auto_463751 ?auto_463752 ) ) ( not ( = ?auto_463751 ?auto_463753 ) ) ( not ( = ?auto_463751 ?auto_463754 ) ) ( not ( = ?auto_463751 ?auto_463755 ) ) ( not ( = ?auto_463751 ?auto_463756 ) ) ( not ( = ?auto_463751 ?auto_463757 ) ) ( not ( = ?auto_463751 ?auto_463758 ) ) ( not ( = ?auto_463751 ?auto_463759 ) ) ( not ( = ?auto_463751 ?auto_463760 ) ) ( not ( = ?auto_463751 ?auto_463761 ) ) ( not ( = ?auto_463752 ?auto_463753 ) ) ( not ( = ?auto_463752 ?auto_463754 ) ) ( not ( = ?auto_463752 ?auto_463755 ) ) ( not ( = ?auto_463752 ?auto_463756 ) ) ( not ( = ?auto_463752 ?auto_463757 ) ) ( not ( = ?auto_463752 ?auto_463758 ) ) ( not ( = ?auto_463752 ?auto_463759 ) ) ( not ( = ?auto_463752 ?auto_463760 ) ) ( not ( = ?auto_463752 ?auto_463761 ) ) ( not ( = ?auto_463753 ?auto_463754 ) ) ( not ( = ?auto_463753 ?auto_463755 ) ) ( not ( = ?auto_463753 ?auto_463756 ) ) ( not ( = ?auto_463753 ?auto_463757 ) ) ( not ( = ?auto_463753 ?auto_463758 ) ) ( not ( = ?auto_463753 ?auto_463759 ) ) ( not ( = ?auto_463753 ?auto_463760 ) ) ( not ( = ?auto_463753 ?auto_463761 ) ) ( not ( = ?auto_463754 ?auto_463755 ) ) ( not ( = ?auto_463754 ?auto_463756 ) ) ( not ( = ?auto_463754 ?auto_463757 ) ) ( not ( = ?auto_463754 ?auto_463758 ) ) ( not ( = ?auto_463754 ?auto_463759 ) ) ( not ( = ?auto_463754 ?auto_463760 ) ) ( not ( = ?auto_463754 ?auto_463761 ) ) ( not ( = ?auto_463755 ?auto_463756 ) ) ( not ( = ?auto_463755 ?auto_463757 ) ) ( not ( = ?auto_463755 ?auto_463758 ) ) ( not ( = ?auto_463755 ?auto_463759 ) ) ( not ( = ?auto_463755 ?auto_463760 ) ) ( not ( = ?auto_463755 ?auto_463761 ) ) ( not ( = ?auto_463756 ?auto_463757 ) ) ( not ( = ?auto_463756 ?auto_463758 ) ) ( not ( = ?auto_463756 ?auto_463759 ) ) ( not ( = ?auto_463756 ?auto_463760 ) ) ( not ( = ?auto_463756 ?auto_463761 ) ) ( not ( = ?auto_463757 ?auto_463758 ) ) ( not ( = ?auto_463757 ?auto_463759 ) ) ( not ( = ?auto_463757 ?auto_463760 ) ) ( not ( = ?auto_463757 ?auto_463761 ) ) ( not ( = ?auto_463758 ?auto_463759 ) ) ( not ( = ?auto_463758 ?auto_463760 ) ) ( not ( = ?auto_463758 ?auto_463761 ) ) ( not ( = ?auto_463759 ?auto_463760 ) ) ( not ( = ?auto_463759 ?auto_463761 ) ) ( not ( = ?auto_463760 ?auto_463761 ) ) ( ON ?auto_463759 ?auto_463760 ) ( ON ?auto_463758 ?auto_463759 ) ( ON ?auto_463757 ?auto_463758 ) ( ON ?auto_463756 ?auto_463757 ) ( ON ?auto_463755 ?auto_463756 ) ( ON ?auto_463754 ?auto_463755 ) ( ON ?auto_463753 ?auto_463754 ) ( ON ?auto_463752 ?auto_463753 ) ( CLEAR ?auto_463750 ) ( ON ?auto_463751 ?auto_463752 ) ( CLEAR ?auto_463751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_463747 ?auto_463748 ?auto_463749 ?auto_463750 ?auto_463751 )
      ( MAKE-14PILE ?auto_463747 ?auto_463748 ?auto_463749 ?auto_463750 ?auto_463751 ?auto_463752 ?auto_463753 ?auto_463754 ?auto_463755 ?auto_463756 ?auto_463757 ?auto_463758 ?auto_463759 ?auto_463760 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463776 - BLOCK
      ?auto_463777 - BLOCK
      ?auto_463778 - BLOCK
      ?auto_463779 - BLOCK
      ?auto_463780 - BLOCK
      ?auto_463781 - BLOCK
      ?auto_463782 - BLOCK
      ?auto_463783 - BLOCK
      ?auto_463784 - BLOCK
      ?auto_463785 - BLOCK
      ?auto_463786 - BLOCK
      ?auto_463787 - BLOCK
      ?auto_463788 - BLOCK
      ?auto_463789 - BLOCK
    )
    :vars
    (
      ?auto_463790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463789 ?auto_463790 ) ( ON-TABLE ?auto_463776 ) ( ON ?auto_463777 ?auto_463776 ) ( ON ?auto_463778 ?auto_463777 ) ( not ( = ?auto_463776 ?auto_463777 ) ) ( not ( = ?auto_463776 ?auto_463778 ) ) ( not ( = ?auto_463776 ?auto_463779 ) ) ( not ( = ?auto_463776 ?auto_463780 ) ) ( not ( = ?auto_463776 ?auto_463781 ) ) ( not ( = ?auto_463776 ?auto_463782 ) ) ( not ( = ?auto_463776 ?auto_463783 ) ) ( not ( = ?auto_463776 ?auto_463784 ) ) ( not ( = ?auto_463776 ?auto_463785 ) ) ( not ( = ?auto_463776 ?auto_463786 ) ) ( not ( = ?auto_463776 ?auto_463787 ) ) ( not ( = ?auto_463776 ?auto_463788 ) ) ( not ( = ?auto_463776 ?auto_463789 ) ) ( not ( = ?auto_463776 ?auto_463790 ) ) ( not ( = ?auto_463777 ?auto_463778 ) ) ( not ( = ?auto_463777 ?auto_463779 ) ) ( not ( = ?auto_463777 ?auto_463780 ) ) ( not ( = ?auto_463777 ?auto_463781 ) ) ( not ( = ?auto_463777 ?auto_463782 ) ) ( not ( = ?auto_463777 ?auto_463783 ) ) ( not ( = ?auto_463777 ?auto_463784 ) ) ( not ( = ?auto_463777 ?auto_463785 ) ) ( not ( = ?auto_463777 ?auto_463786 ) ) ( not ( = ?auto_463777 ?auto_463787 ) ) ( not ( = ?auto_463777 ?auto_463788 ) ) ( not ( = ?auto_463777 ?auto_463789 ) ) ( not ( = ?auto_463777 ?auto_463790 ) ) ( not ( = ?auto_463778 ?auto_463779 ) ) ( not ( = ?auto_463778 ?auto_463780 ) ) ( not ( = ?auto_463778 ?auto_463781 ) ) ( not ( = ?auto_463778 ?auto_463782 ) ) ( not ( = ?auto_463778 ?auto_463783 ) ) ( not ( = ?auto_463778 ?auto_463784 ) ) ( not ( = ?auto_463778 ?auto_463785 ) ) ( not ( = ?auto_463778 ?auto_463786 ) ) ( not ( = ?auto_463778 ?auto_463787 ) ) ( not ( = ?auto_463778 ?auto_463788 ) ) ( not ( = ?auto_463778 ?auto_463789 ) ) ( not ( = ?auto_463778 ?auto_463790 ) ) ( not ( = ?auto_463779 ?auto_463780 ) ) ( not ( = ?auto_463779 ?auto_463781 ) ) ( not ( = ?auto_463779 ?auto_463782 ) ) ( not ( = ?auto_463779 ?auto_463783 ) ) ( not ( = ?auto_463779 ?auto_463784 ) ) ( not ( = ?auto_463779 ?auto_463785 ) ) ( not ( = ?auto_463779 ?auto_463786 ) ) ( not ( = ?auto_463779 ?auto_463787 ) ) ( not ( = ?auto_463779 ?auto_463788 ) ) ( not ( = ?auto_463779 ?auto_463789 ) ) ( not ( = ?auto_463779 ?auto_463790 ) ) ( not ( = ?auto_463780 ?auto_463781 ) ) ( not ( = ?auto_463780 ?auto_463782 ) ) ( not ( = ?auto_463780 ?auto_463783 ) ) ( not ( = ?auto_463780 ?auto_463784 ) ) ( not ( = ?auto_463780 ?auto_463785 ) ) ( not ( = ?auto_463780 ?auto_463786 ) ) ( not ( = ?auto_463780 ?auto_463787 ) ) ( not ( = ?auto_463780 ?auto_463788 ) ) ( not ( = ?auto_463780 ?auto_463789 ) ) ( not ( = ?auto_463780 ?auto_463790 ) ) ( not ( = ?auto_463781 ?auto_463782 ) ) ( not ( = ?auto_463781 ?auto_463783 ) ) ( not ( = ?auto_463781 ?auto_463784 ) ) ( not ( = ?auto_463781 ?auto_463785 ) ) ( not ( = ?auto_463781 ?auto_463786 ) ) ( not ( = ?auto_463781 ?auto_463787 ) ) ( not ( = ?auto_463781 ?auto_463788 ) ) ( not ( = ?auto_463781 ?auto_463789 ) ) ( not ( = ?auto_463781 ?auto_463790 ) ) ( not ( = ?auto_463782 ?auto_463783 ) ) ( not ( = ?auto_463782 ?auto_463784 ) ) ( not ( = ?auto_463782 ?auto_463785 ) ) ( not ( = ?auto_463782 ?auto_463786 ) ) ( not ( = ?auto_463782 ?auto_463787 ) ) ( not ( = ?auto_463782 ?auto_463788 ) ) ( not ( = ?auto_463782 ?auto_463789 ) ) ( not ( = ?auto_463782 ?auto_463790 ) ) ( not ( = ?auto_463783 ?auto_463784 ) ) ( not ( = ?auto_463783 ?auto_463785 ) ) ( not ( = ?auto_463783 ?auto_463786 ) ) ( not ( = ?auto_463783 ?auto_463787 ) ) ( not ( = ?auto_463783 ?auto_463788 ) ) ( not ( = ?auto_463783 ?auto_463789 ) ) ( not ( = ?auto_463783 ?auto_463790 ) ) ( not ( = ?auto_463784 ?auto_463785 ) ) ( not ( = ?auto_463784 ?auto_463786 ) ) ( not ( = ?auto_463784 ?auto_463787 ) ) ( not ( = ?auto_463784 ?auto_463788 ) ) ( not ( = ?auto_463784 ?auto_463789 ) ) ( not ( = ?auto_463784 ?auto_463790 ) ) ( not ( = ?auto_463785 ?auto_463786 ) ) ( not ( = ?auto_463785 ?auto_463787 ) ) ( not ( = ?auto_463785 ?auto_463788 ) ) ( not ( = ?auto_463785 ?auto_463789 ) ) ( not ( = ?auto_463785 ?auto_463790 ) ) ( not ( = ?auto_463786 ?auto_463787 ) ) ( not ( = ?auto_463786 ?auto_463788 ) ) ( not ( = ?auto_463786 ?auto_463789 ) ) ( not ( = ?auto_463786 ?auto_463790 ) ) ( not ( = ?auto_463787 ?auto_463788 ) ) ( not ( = ?auto_463787 ?auto_463789 ) ) ( not ( = ?auto_463787 ?auto_463790 ) ) ( not ( = ?auto_463788 ?auto_463789 ) ) ( not ( = ?auto_463788 ?auto_463790 ) ) ( not ( = ?auto_463789 ?auto_463790 ) ) ( ON ?auto_463788 ?auto_463789 ) ( ON ?auto_463787 ?auto_463788 ) ( ON ?auto_463786 ?auto_463787 ) ( ON ?auto_463785 ?auto_463786 ) ( ON ?auto_463784 ?auto_463785 ) ( ON ?auto_463783 ?auto_463784 ) ( ON ?auto_463782 ?auto_463783 ) ( ON ?auto_463781 ?auto_463782 ) ( ON ?auto_463780 ?auto_463781 ) ( CLEAR ?auto_463778 ) ( ON ?auto_463779 ?auto_463780 ) ( CLEAR ?auto_463779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_463776 ?auto_463777 ?auto_463778 ?auto_463779 )
      ( MAKE-14PILE ?auto_463776 ?auto_463777 ?auto_463778 ?auto_463779 ?auto_463780 ?auto_463781 ?auto_463782 ?auto_463783 ?auto_463784 ?auto_463785 ?auto_463786 ?auto_463787 ?auto_463788 ?auto_463789 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463805 - BLOCK
      ?auto_463806 - BLOCK
      ?auto_463807 - BLOCK
      ?auto_463808 - BLOCK
      ?auto_463809 - BLOCK
      ?auto_463810 - BLOCK
      ?auto_463811 - BLOCK
      ?auto_463812 - BLOCK
      ?auto_463813 - BLOCK
      ?auto_463814 - BLOCK
      ?auto_463815 - BLOCK
      ?auto_463816 - BLOCK
      ?auto_463817 - BLOCK
      ?auto_463818 - BLOCK
    )
    :vars
    (
      ?auto_463819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463818 ?auto_463819 ) ( ON-TABLE ?auto_463805 ) ( ON ?auto_463806 ?auto_463805 ) ( ON ?auto_463807 ?auto_463806 ) ( not ( = ?auto_463805 ?auto_463806 ) ) ( not ( = ?auto_463805 ?auto_463807 ) ) ( not ( = ?auto_463805 ?auto_463808 ) ) ( not ( = ?auto_463805 ?auto_463809 ) ) ( not ( = ?auto_463805 ?auto_463810 ) ) ( not ( = ?auto_463805 ?auto_463811 ) ) ( not ( = ?auto_463805 ?auto_463812 ) ) ( not ( = ?auto_463805 ?auto_463813 ) ) ( not ( = ?auto_463805 ?auto_463814 ) ) ( not ( = ?auto_463805 ?auto_463815 ) ) ( not ( = ?auto_463805 ?auto_463816 ) ) ( not ( = ?auto_463805 ?auto_463817 ) ) ( not ( = ?auto_463805 ?auto_463818 ) ) ( not ( = ?auto_463805 ?auto_463819 ) ) ( not ( = ?auto_463806 ?auto_463807 ) ) ( not ( = ?auto_463806 ?auto_463808 ) ) ( not ( = ?auto_463806 ?auto_463809 ) ) ( not ( = ?auto_463806 ?auto_463810 ) ) ( not ( = ?auto_463806 ?auto_463811 ) ) ( not ( = ?auto_463806 ?auto_463812 ) ) ( not ( = ?auto_463806 ?auto_463813 ) ) ( not ( = ?auto_463806 ?auto_463814 ) ) ( not ( = ?auto_463806 ?auto_463815 ) ) ( not ( = ?auto_463806 ?auto_463816 ) ) ( not ( = ?auto_463806 ?auto_463817 ) ) ( not ( = ?auto_463806 ?auto_463818 ) ) ( not ( = ?auto_463806 ?auto_463819 ) ) ( not ( = ?auto_463807 ?auto_463808 ) ) ( not ( = ?auto_463807 ?auto_463809 ) ) ( not ( = ?auto_463807 ?auto_463810 ) ) ( not ( = ?auto_463807 ?auto_463811 ) ) ( not ( = ?auto_463807 ?auto_463812 ) ) ( not ( = ?auto_463807 ?auto_463813 ) ) ( not ( = ?auto_463807 ?auto_463814 ) ) ( not ( = ?auto_463807 ?auto_463815 ) ) ( not ( = ?auto_463807 ?auto_463816 ) ) ( not ( = ?auto_463807 ?auto_463817 ) ) ( not ( = ?auto_463807 ?auto_463818 ) ) ( not ( = ?auto_463807 ?auto_463819 ) ) ( not ( = ?auto_463808 ?auto_463809 ) ) ( not ( = ?auto_463808 ?auto_463810 ) ) ( not ( = ?auto_463808 ?auto_463811 ) ) ( not ( = ?auto_463808 ?auto_463812 ) ) ( not ( = ?auto_463808 ?auto_463813 ) ) ( not ( = ?auto_463808 ?auto_463814 ) ) ( not ( = ?auto_463808 ?auto_463815 ) ) ( not ( = ?auto_463808 ?auto_463816 ) ) ( not ( = ?auto_463808 ?auto_463817 ) ) ( not ( = ?auto_463808 ?auto_463818 ) ) ( not ( = ?auto_463808 ?auto_463819 ) ) ( not ( = ?auto_463809 ?auto_463810 ) ) ( not ( = ?auto_463809 ?auto_463811 ) ) ( not ( = ?auto_463809 ?auto_463812 ) ) ( not ( = ?auto_463809 ?auto_463813 ) ) ( not ( = ?auto_463809 ?auto_463814 ) ) ( not ( = ?auto_463809 ?auto_463815 ) ) ( not ( = ?auto_463809 ?auto_463816 ) ) ( not ( = ?auto_463809 ?auto_463817 ) ) ( not ( = ?auto_463809 ?auto_463818 ) ) ( not ( = ?auto_463809 ?auto_463819 ) ) ( not ( = ?auto_463810 ?auto_463811 ) ) ( not ( = ?auto_463810 ?auto_463812 ) ) ( not ( = ?auto_463810 ?auto_463813 ) ) ( not ( = ?auto_463810 ?auto_463814 ) ) ( not ( = ?auto_463810 ?auto_463815 ) ) ( not ( = ?auto_463810 ?auto_463816 ) ) ( not ( = ?auto_463810 ?auto_463817 ) ) ( not ( = ?auto_463810 ?auto_463818 ) ) ( not ( = ?auto_463810 ?auto_463819 ) ) ( not ( = ?auto_463811 ?auto_463812 ) ) ( not ( = ?auto_463811 ?auto_463813 ) ) ( not ( = ?auto_463811 ?auto_463814 ) ) ( not ( = ?auto_463811 ?auto_463815 ) ) ( not ( = ?auto_463811 ?auto_463816 ) ) ( not ( = ?auto_463811 ?auto_463817 ) ) ( not ( = ?auto_463811 ?auto_463818 ) ) ( not ( = ?auto_463811 ?auto_463819 ) ) ( not ( = ?auto_463812 ?auto_463813 ) ) ( not ( = ?auto_463812 ?auto_463814 ) ) ( not ( = ?auto_463812 ?auto_463815 ) ) ( not ( = ?auto_463812 ?auto_463816 ) ) ( not ( = ?auto_463812 ?auto_463817 ) ) ( not ( = ?auto_463812 ?auto_463818 ) ) ( not ( = ?auto_463812 ?auto_463819 ) ) ( not ( = ?auto_463813 ?auto_463814 ) ) ( not ( = ?auto_463813 ?auto_463815 ) ) ( not ( = ?auto_463813 ?auto_463816 ) ) ( not ( = ?auto_463813 ?auto_463817 ) ) ( not ( = ?auto_463813 ?auto_463818 ) ) ( not ( = ?auto_463813 ?auto_463819 ) ) ( not ( = ?auto_463814 ?auto_463815 ) ) ( not ( = ?auto_463814 ?auto_463816 ) ) ( not ( = ?auto_463814 ?auto_463817 ) ) ( not ( = ?auto_463814 ?auto_463818 ) ) ( not ( = ?auto_463814 ?auto_463819 ) ) ( not ( = ?auto_463815 ?auto_463816 ) ) ( not ( = ?auto_463815 ?auto_463817 ) ) ( not ( = ?auto_463815 ?auto_463818 ) ) ( not ( = ?auto_463815 ?auto_463819 ) ) ( not ( = ?auto_463816 ?auto_463817 ) ) ( not ( = ?auto_463816 ?auto_463818 ) ) ( not ( = ?auto_463816 ?auto_463819 ) ) ( not ( = ?auto_463817 ?auto_463818 ) ) ( not ( = ?auto_463817 ?auto_463819 ) ) ( not ( = ?auto_463818 ?auto_463819 ) ) ( ON ?auto_463817 ?auto_463818 ) ( ON ?auto_463816 ?auto_463817 ) ( ON ?auto_463815 ?auto_463816 ) ( ON ?auto_463814 ?auto_463815 ) ( ON ?auto_463813 ?auto_463814 ) ( ON ?auto_463812 ?auto_463813 ) ( ON ?auto_463811 ?auto_463812 ) ( ON ?auto_463810 ?auto_463811 ) ( ON ?auto_463809 ?auto_463810 ) ( CLEAR ?auto_463807 ) ( ON ?auto_463808 ?auto_463809 ) ( CLEAR ?auto_463808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_463805 ?auto_463806 ?auto_463807 ?auto_463808 )
      ( MAKE-14PILE ?auto_463805 ?auto_463806 ?auto_463807 ?auto_463808 ?auto_463809 ?auto_463810 ?auto_463811 ?auto_463812 ?auto_463813 ?auto_463814 ?auto_463815 ?auto_463816 ?auto_463817 ?auto_463818 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463834 - BLOCK
      ?auto_463835 - BLOCK
      ?auto_463836 - BLOCK
      ?auto_463837 - BLOCK
      ?auto_463838 - BLOCK
      ?auto_463839 - BLOCK
      ?auto_463840 - BLOCK
      ?auto_463841 - BLOCK
      ?auto_463842 - BLOCK
      ?auto_463843 - BLOCK
      ?auto_463844 - BLOCK
      ?auto_463845 - BLOCK
      ?auto_463846 - BLOCK
      ?auto_463847 - BLOCK
    )
    :vars
    (
      ?auto_463848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463847 ?auto_463848 ) ( ON-TABLE ?auto_463834 ) ( ON ?auto_463835 ?auto_463834 ) ( not ( = ?auto_463834 ?auto_463835 ) ) ( not ( = ?auto_463834 ?auto_463836 ) ) ( not ( = ?auto_463834 ?auto_463837 ) ) ( not ( = ?auto_463834 ?auto_463838 ) ) ( not ( = ?auto_463834 ?auto_463839 ) ) ( not ( = ?auto_463834 ?auto_463840 ) ) ( not ( = ?auto_463834 ?auto_463841 ) ) ( not ( = ?auto_463834 ?auto_463842 ) ) ( not ( = ?auto_463834 ?auto_463843 ) ) ( not ( = ?auto_463834 ?auto_463844 ) ) ( not ( = ?auto_463834 ?auto_463845 ) ) ( not ( = ?auto_463834 ?auto_463846 ) ) ( not ( = ?auto_463834 ?auto_463847 ) ) ( not ( = ?auto_463834 ?auto_463848 ) ) ( not ( = ?auto_463835 ?auto_463836 ) ) ( not ( = ?auto_463835 ?auto_463837 ) ) ( not ( = ?auto_463835 ?auto_463838 ) ) ( not ( = ?auto_463835 ?auto_463839 ) ) ( not ( = ?auto_463835 ?auto_463840 ) ) ( not ( = ?auto_463835 ?auto_463841 ) ) ( not ( = ?auto_463835 ?auto_463842 ) ) ( not ( = ?auto_463835 ?auto_463843 ) ) ( not ( = ?auto_463835 ?auto_463844 ) ) ( not ( = ?auto_463835 ?auto_463845 ) ) ( not ( = ?auto_463835 ?auto_463846 ) ) ( not ( = ?auto_463835 ?auto_463847 ) ) ( not ( = ?auto_463835 ?auto_463848 ) ) ( not ( = ?auto_463836 ?auto_463837 ) ) ( not ( = ?auto_463836 ?auto_463838 ) ) ( not ( = ?auto_463836 ?auto_463839 ) ) ( not ( = ?auto_463836 ?auto_463840 ) ) ( not ( = ?auto_463836 ?auto_463841 ) ) ( not ( = ?auto_463836 ?auto_463842 ) ) ( not ( = ?auto_463836 ?auto_463843 ) ) ( not ( = ?auto_463836 ?auto_463844 ) ) ( not ( = ?auto_463836 ?auto_463845 ) ) ( not ( = ?auto_463836 ?auto_463846 ) ) ( not ( = ?auto_463836 ?auto_463847 ) ) ( not ( = ?auto_463836 ?auto_463848 ) ) ( not ( = ?auto_463837 ?auto_463838 ) ) ( not ( = ?auto_463837 ?auto_463839 ) ) ( not ( = ?auto_463837 ?auto_463840 ) ) ( not ( = ?auto_463837 ?auto_463841 ) ) ( not ( = ?auto_463837 ?auto_463842 ) ) ( not ( = ?auto_463837 ?auto_463843 ) ) ( not ( = ?auto_463837 ?auto_463844 ) ) ( not ( = ?auto_463837 ?auto_463845 ) ) ( not ( = ?auto_463837 ?auto_463846 ) ) ( not ( = ?auto_463837 ?auto_463847 ) ) ( not ( = ?auto_463837 ?auto_463848 ) ) ( not ( = ?auto_463838 ?auto_463839 ) ) ( not ( = ?auto_463838 ?auto_463840 ) ) ( not ( = ?auto_463838 ?auto_463841 ) ) ( not ( = ?auto_463838 ?auto_463842 ) ) ( not ( = ?auto_463838 ?auto_463843 ) ) ( not ( = ?auto_463838 ?auto_463844 ) ) ( not ( = ?auto_463838 ?auto_463845 ) ) ( not ( = ?auto_463838 ?auto_463846 ) ) ( not ( = ?auto_463838 ?auto_463847 ) ) ( not ( = ?auto_463838 ?auto_463848 ) ) ( not ( = ?auto_463839 ?auto_463840 ) ) ( not ( = ?auto_463839 ?auto_463841 ) ) ( not ( = ?auto_463839 ?auto_463842 ) ) ( not ( = ?auto_463839 ?auto_463843 ) ) ( not ( = ?auto_463839 ?auto_463844 ) ) ( not ( = ?auto_463839 ?auto_463845 ) ) ( not ( = ?auto_463839 ?auto_463846 ) ) ( not ( = ?auto_463839 ?auto_463847 ) ) ( not ( = ?auto_463839 ?auto_463848 ) ) ( not ( = ?auto_463840 ?auto_463841 ) ) ( not ( = ?auto_463840 ?auto_463842 ) ) ( not ( = ?auto_463840 ?auto_463843 ) ) ( not ( = ?auto_463840 ?auto_463844 ) ) ( not ( = ?auto_463840 ?auto_463845 ) ) ( not ( = ?auto_463840 ?auto_463846 ) ) ( not ( = ?auto_463840 ?auto_463847 ) ) ( not ( = ?auto_463840 ?auto_463848 ) ) ( not ( = ?auto_463841 ?auto_463842 ) ) ( not ( = ?auto_463841 ?auto_463843 ) ) ( not ( = ?auto_463841 ?auto_463844 ) ) ( not ( = ?auto_463841 ?auto_463845 ) ) ( not ( = ?auto_463841 ?auto_463846 ) ) ( not ( = ?auto_463841 ?auto_463847 ) ) ( not ( = ?auto_463841 ?auto_463848 ) ) ( not ( = ?auto_463842 ?auto_463843 ) ) ( not ( = ?auto_463842 ?auto_463844 ) ) ( not ( = ?auto_463842 ?auto_463845 ) ) ( not ( = ?auto_463842 ?auto_463846 ) ) ( not ( = ?auto_463842 ?auto_463847 ) ) ( not ( = ?auto_463842 ?auto_463848 ) ) ( not ( = ?auto_463843 ?auto_463844 ) ) ( not ( = ?auto_463843 ?auto_463845 ) ) ( not ( = ?auto_463843 ?auto_463846 ) ) ( not ( = ?auto_463843 ?auto_463847 ) ) ( not ( = ?auto_463843 ?auto_463848 ) ) ( not ( = ?auto_463844 ?auto_463845 ) ) ( not ( = ?auto_463844 ?auto_463846 ) ) ( not ( = ?auto_463844 ?auto_463847 ) ) ( not ( = ?auto_463844 ?auto_463848 ) ) ( not ( = ?auto_463845 ?auto_463846 ) ) ( not ( = ?auto_463845 ?auto_463847 ) ) ( not ( = ?auto_463845 ?auto_463848 ) ) ( not ( = ?auto_463846 ?auto_463847 ) ) ( not ( = ?auto_463846 ?auto_463848 ) ) ( not ( = ?auto_463847 ?auto_463848 ) ) ( ON ?auto_463846 ?auto_463847 ) ( ON ?auto_463845 ?auto_463846 ) ( ON ?auto_463844 ?auto_463845 ) ( ON ?auto_463843 ?auto_463844 ) ( ON ?auto_463842 ?auto_463843 ) ( ON ?auto_463841 ?auto_463842 ) ( ON ?auto_463840 ?auto_463841 ) ( ON ?auto_463839 ?auto_463840 ) ( ON ?auto_463838 ?auto_463839 ) ( ON ?auto_463837 ?auto_463838 ) ( CLEAR ?auto_463835 ) ( ON ?auto_463836 ?auto_463837 ) ( CLEAR ?auto_463836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_463834 ?auto_463835 ?auto_463836 )
      ( MAKE-14PILE ?auto_463834 ?auto_463835 ?auto_463836 ?auto_463837 ?auto_463838 ?auto_463839 ?auto_463840 ?auto_463841 ?auto_463842 ?auto_463843 ?auto_463844 ?auto_463845 ?auto_463846 ?auto_463847 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463863 - BLOCK
      ?auto_463864 - BLOCK
      ?auto_463865 - BLOCK
      ?auto_463866 - BLOCK
      ?auto_463867 - BLOCK
      ?auto_463868 - BLOCK
      ?auto_463869 - BLOCK
      ?auto_463870 - BLOCK
      ?auto_463871 - BLOCK
      ?auto_463872 - BLOCK
      ?auto_463873 - BLOCK
      ?auto_463874 - BLOCK
      ?auto_463875 - BLOCK
      ?auto_463876 - BLOCK
    )
    :vars
    (
      ?auto_463877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463876 ?auto_463877 ) ( ON-TABLE ?auto_463863 ) ( ON ?auto_463864 ?auto_463863 ) ( not ( = ?auto_463863 ?auto_463864 ) ) ( not ( = ?auto_463863 ?auto_463865 ) ) ( not ( = ?auto_463863 ?auto_463866 ) ) ( not ( = ?auto_463863 ?auto_463867 ) ) ( not ( = ?auto_463863 ?auto_463868 ) ) ( not ( = ?auto_463863 ?auto_463869 ) ) ( not ( = ?auto_463863 ?auto_463870 ) ) ( not ( = ?auto_463863 ?auto_463871 ) ) ( not ( = ?auto_463863 ?auto_463872 ) ) ( not ( = ?auto_463863 ?auto_463873 ) ) ( not ( = ?auto_463863 ?auto_463874 ) ) ( not ( = ?auto_463863 ?auto_463875 ) ) ( not ( = ?auto_463863 ?auto_463876 ) ) ( not ( = ?auto_463863 ?auto_463877 ) ) ( not ( = ?auto_463864 ?auto_463865 ) ) ( not ( = ?auto_463864 ?auto_463866 ) ) ( not ( = ?auto_463864 ?auto_463867 ) ) ( not ( = ?auto_463864 ?auto_463868 ) ) ( not ( = ?auto_463864 ?auto_463869 ) ) ( not ( = ?auto_463864 ?auto_463870 ) ) ( not ( = ?auto_463864 ?auto_463871 ) ) ( not ( = ?auto_463864 ?auto_463872 ) ) ( not ( = ?auto_463864 ?auto_463873 ) ) ( not ( = ?auto_463864 ?auto_463874 ) ) ( not ( = ?auto_463864 ?auto_463875 ) ) ( not ( = ?auto_463864 ?auto_463876 ) ) ( not ( = ?auto_463864 ?auto_463877 ) ) ( not ( = ?auto_463865 ?auto_463866 ) ) ( not ( = ?auto_463865 ?auto_463867 ) ) ( not ( = ?auto_463865 ?auto_463868 ) ) ( not ( = ?auto_463865 ?auto_463869 ) ) ( not ( = ?auto_463865 ?auto_463870 ) ) ( not ( = ?auto_463865 ?auto_463871 ) ) ( not ( = ?auto_463865 ?auto_463872 ) ) ( not ( = ?auto_463865 ?auto_463873 ) ) ( not ( = ?auto_463865 ?auto_463874 ) ) ( not ( = ?auto_463865 ?auto_463875 ) ) ( not ( = ?auto_463865 ?auto_463876 ) ) ( not ( = ?auto_463865 ?auto_463877 ) ) ( not ( = ?auto_463866 ?auto_463867 ) ) ( not ( = ?auto_463866 ?auto_463868 ) ) ( not ( = ?auto_463866 ?auto_463869 ) ) ( not ( = ?auto_463866 ?auto_463870 ) ) ( not ( = ?auto_463866 ?auto_463871 ) ) ( not ( = ?auto_463866 ?auto_463872 ) ) ( not ( = ?auto_463866 ?auto_463873 ) ) ( not ( = ?auto_463866 ?auto_463874 ) ) ( not ( = ?auto_463866 ?auto_463875 ) ) ( not ( = ?auto_463866 ?auto_463876 ) ) ( not ( = ?auto_463866 ?auto_463877 ) ) ( not ( = ?auto_463867 ?auto_463868 ) ) ( not ( = ?auto_463867 ?auto_463869 ) ) ( not ( = ?auto_463867 ?auto_463870 ) ) ( not ( = ?auto_463867 ?auto_463871 ) ) ( not ( = ?auto_463867 ?auto_463872 ) ) ( not ( = ?auto_463867 ?auto_463873 ) ) ( not ( = ?auto_463867 ?auto_463874 ) ) ( not ( = ?auto_463867 ?auto_463875 ) ) ( not ( = ?auto_463867 ?auto_463876 ) ) ( not ( = ?auto_463867 ?auto_463877 ) ) ( not ( = ?auto_463868 ?auto_463869 ) ) ( not ( = ?auto_463868 ?auto_463870 ) ) ( not ( = ?auto_463868 ?auto_463871 ) ) ( not ( = ?auto_463868 ?auto_463872 ) ) ( not ( = ?auto_463868 ?auto_463873 ) ) ( not ( = ?auto_463868 ?auto_463874 ) ) ( not ( = ?auto_463868 ?auto_463875 ) ) ( not ( = ?auto_463868 ?auto_463876 ) ) ( not ( = ?auto_463868 ?auto_463877 ) ) ( not ( = ?auto_463869 ?auto_463870 ) ) ( not ( = ?auto_463869 ?auto_463871 ) ) ( not ( = ?auto_463869 ?auto_463872 ) ) ( not ( = ?auto_463869 ?auto_463873 ) ) ( not ( = ?auto_463869 ?auto_463874 ) ) ( not ( = ?auto_463869 ?auto_463875 ) ) ( not ( = ?auto_463869 ?auto_463876 ) ) ( not ( = ?auto_463869 ?auto_463877 ) ) ( not ( = ?auto_463870 ?auto_463871 ) ) ( not ( = ?auto_463870 ?auto_463872 ) ) ( not ( = ?auto_463870 ?auto_463873 ) ) ( not ( = ?auto_463870 ?auto_463874 ) ) ( not ( = ?auto_463870 ?auto_463875 ) ) ( not ( = ?auto_463870 ?auto_463876 ) ) ( not ( = ?auto_463870 ?auto_463877 ) ) ( not ( = ?auto_463871 ?auto_463872 ) ) ( not ( = ?auto_463871 ?auto_463873 ) ) ( not ( = ?auto_463871 ?auto_463874 ) ) ( not ( = ?auto_463871 ?auto_463875 ) ) ( not ( = ?auto_463871 ?auto_463876 ) ) ( not ( = ?auto_463871 ?auto_463877 ) ) ( not ( = ?auto_463872 ?auto_463873 ) ) ( not ( = ?auto_463872 ?auto_463874 ) ) ( not ( = ?auto_463872 ?auto_463875 ) ) ( not ( = ?auto_463872 ?auto_463876 ) ) ( not ( = ?auto_463872 ?auto_463877 ) ) ( not ( = ?auto_463873 ?auto_463874 ) ) ( not ( = ?auto_463873 ?auto_463875 ) ) ( not ( = ?auto_463873 ?auto_463876 ) ) ( not ( = ?auto_463873 ?auto_463877 ) ) ( not ( = ?auto_463874 ?auto_463875 ) ) ( not ( = ?auto_463874 ?auto_463876 ) ) ( not ( = ?auto_463874 ?auto_463877 ) ) ( not ( = ?auto_463875 ?auto_463876 ) ) ( not ( = ?auto_463875 ?auto_463877 ) ) ( not ( = ?auto_463876 ?auto_463877 ) ) ( ON ?auto_463875 ?auto_463876 ) ( ON ?auto_463874 ?auto_463875 ) ( ON ?auto_463873 ?auto_463874 ) ( ON ?auto_463872 ?auto_463873 ) ( ON ?auto_463871 ?auto_463872 ) ( ON ?auto_463870 ?auto_463871 ) ( ON ?auto_463869 ?auto_463870 ) ( ON ?auto_463868 ?auto_463869 ) ( ON ?auto_463867 ?auto_463868 ) ( ON ?auto_463866 ?auto_463867 ) ( CLEAR ?auto_463864 ) ( ON ?auto_463865 ?auto_463866 ) ( CLEAR ?auto_463865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_463863 ?auto_463864 ?auto_463865 )
      ( MAKE-14PILE ?auto_463863 ?auto_463864 ?auto_463865 ?auto_463866 ?auto_463867 ?auto_463868 ?auto_463869 ?auto_463870 ?auto_463871 ?auto_463872 ?auto_463873 ?auto_463874 ?auto_463875 ?auto_463876 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463892 - BLOCK
      ?auto_463893 - BLOCK
      ?auto_463894 - BLOCK
      ?auto_463895 - BLOCK
      ?auto_463896 - BLOCK
      ?auto_463897 - BLOCK
      ?auto_463898 - BLOCK
      ?auto_463899 - BLOCK
      ?auto_463900 - BLOCK
      ?auto_463901 - BLOCK
      ?auto_463902 - BLOCK
      ?auto_463903 - BLOCK
      ?auto_463904 - BLOCK
      ?auto_463905 - BLOCK
    )
    :vars
    (
      ?auto_463906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463905 ?auto_463906 ) ( ON-TABLE ?auto_463892 ) ( not ( = ?auto_463892 ?auto_463893 ) ) ( not ( = ?auto_463892 ?auto_463894 ) ) ( not ( = ?auto_463892 ?auto_463895 ) ) ( not ( = ?auto_463892 ?auto_463896 ) ) ( not ( = ?auto_463892 ?auto_463897 ) ) ( not ( = ?auto_463892 ?auto_463898 ) ) ( not ( = ?auto_463892 ?auto_463899 ) ) ( not ( = ?auto_463892 ?auto_463900 ) ) ( not ( = ?auto_463892 ?auto_463901 ) ) ( not ( = ?auto_463892 ?auto_463902 ) ) ( not ( = ?auto_463892 ?auto_463903 ) ) ( not ( = ?auto_463892 ?auto_463904 ) ) ( not ( = ?auto_463892 ?auto_463905 ) ) ( not ( = ?auto_463892 ?auto_463906 ) ) ( not ( = ?auto_463893 ?auto_463894 ) ) ( not ( = ?auto_463893 ?auto_463895 ) ) ( not ( = ?auto_463893 ?auto_463896 ) ) ( not ( = ?auto_463893 ?auto_463897 ) ) ( not ( = ?auto_463893 ?auto_463898 ) ) ( not ( = ?auto_463893 ?auto_463899 ) ) ( not ( = ?auto_463893 ?auto_463900 ) ) ( not ( = ?auto_463893 ?auto_463901 ) ) ( not ( = ?auto_463893 ?auto_463902 ) ) ( not ( = ?auto_463893 ?auto_463903 ) ) ( not ( = ?auto_463893 ?auto_463904 ) ) ( not ( = ?auto_463893 ?auto_463905 ) ) ( not ( = ?auto_463893 ?auto_463906 ) ) ( not ( = ?auto_463894 ?auto_463895 ) ) ( not ( = ?auto_463894 ?auto_463896 ) ) ( not ( = ?auto_463894 ?auto_463897 ) ) ( not ( = ?auto_463894 ?auto_463898 ) ) ( not ( = ?auto_463894 ?auto_463899 ) ) ( not ( = ?auto_463894 ?auto_463900 ) ) ( not ( = ?auto_463894 ?auto_463901 ) ) ( not ( = ?auto_463894 ?auto_463902 ) ) ( not ( = ?auto_463894 ?auto_463903 ) ) ( not ( = ?auto_463894 ?auto_463904 ) ) ( not ( = ?auto_463894 ?auto_463905 ) ) ( not ( = ?auto_463894 ?auto_463906 ) ) ( not ( = ?auto_463895 ?auto_463896 ) ) ( not ( = ?auto_463895 ?auto_463897 ) ) ( not ( = ?auto_463895 ?auto_463898 ) ) ( not ( = ?auto_463895 ?auto_463899 ) ) ( not ( = ?auto_463895 ?auto_463900 ) ) ( not ( = ?auto_463895 ?auto_463901 ) ) ( not ( = ?auto_463895 ?auto_463902 ) ) ( not ( = ?auto_463895 ?auto_463903 ) ) ( not ( = ?auto_463895 ?auto_463904 ) ) ( not ( = ?auto_463895 ?auto_463905 ) ) ( not ( = ?auto_463895 ?auto_463906 ) ) ( not ( = ?auto_463896 ?auto_463897 ) ) ( not ( = ?auto_463896 ?auto_463898 ) ) ( not ( = ?auto_463896 ?auto_463899 ) ) ( not ( = ?auto_463896 ?auto_463900 ) ) ( not ( = ?auto_463896 ?auto_463901 ) ) ( not ( = ?auto_463896 ?auto_463902 ) ) ( not ( = ?auto_463896 ?auto_463903 ) ) ( not ( = ?auto_463896 ?auto_463904 ) ) ( not ( = ?auto_463896 ?auto_463905 ) ) ( not ( = ?auto_463896 ?auto_463906 ) ) ( not ( = ?auto_463897 ?auto_463898 ) ) ( not ( = ?auto_463897 ?auto_463899 ) ) ( not ( = ?auto_463897 ?auto_463900 ) ) ( not ( = ?auto_463897 ?auto_463901 ) ) ( not ( = ?auto_463897 ?auto_463902 ) ) ( not ( = ?auto_463897 ?auto_463903 ) ) ( not ( = ?auto_463897 ?auto_463904 ) ) ( not ( = ?auto_463897 ?auto_463905 ) ) ( not ( = ?auto_463897 ?auto_463906 ) ) ( not ( = ?auto_463898 ?auto_463899 ) ) ( not ( = ?auto_463898 ?auto_463900 ) ) ( not ( = ?auto_463898 ?auto_463901 ) ) ( not ( = ?auto_463898 ?auto_463902 ) ) ( not ( = ?auto_463898 ?auto_463903 ) ) ( not ( = ?auto_463898 ?auto_463904 ) ) ( not ( = ?auto_463898 ?auto_463905 ) ) ( not ( = ?auto_463898 ?auto_463906 ) ) ( not ( = ?auto_463899 ?auto_463900 ) ) ( not ( = ?auto_463899 ?auto_463901 ) ) ( not ( = ?auto_463899 ?auto_463902 ) ) ( not ( = ?auto_463899 ?auto_463903 ) ) ( not ( = ?auto_463899 ?auto_463904 ) ) ( not ( = ?auto_463899 ?auto_463905 ) ) ( not ( = ?auto_463899 ?auto_463906 ) ) ( not ( = ?auto_463900 ?auto_463901 ) ) ( not ( = ?auto_463900 ?auto_463902 ) ) ( not ( = ?auto_463900 ?auto_463903 ) ) ( not ( = ?auto_463900 ?auto_463904 ) ) ( not ( = ?auto_463900 ?auto_463905 ) ) ( not ( = ?auto_463900 ?auto_463906 ) ) ( not ( = ?auto_463901 ?auto_463902 ) ) ( not ( = ?auto_463901 ?auto_463903 ) ) ( not ( = ?auto_463901 ?auto_463904 ) ) ( not ( = ?auto_463901 ?auto_463905 ) ) ( not ( = ?auto_463901 ?auto_463906 ) ) ( not ( = ?auto_463902 ?auto_463903 ) ) ( not ( = ?auto_463902 ?auto_463904 ) ) ( not ( = ?auto_463902 ?auto_463905 ) ) ( not ( = ?auto_463902 ?auto_463906 ) ) ( not ( = ?auto_463903 ?auto_463904 ) ) ( not ( = ?auto_463903 ?auto_463905 ) ) ( not ( = ?auto_463903 ?auto_463906 ) ) ( not ( = ?auto_463904 ?auto_463905 ) ) ( not ( = ?auto_463904 ?auto_463906 ) ) ( not ( = ?auto_463905 ?auto_463906 ) ) ( ON ?auto_463904 ?auto_463905 ) ( ON ?auto_463903 ?auto_463904 ) ( ON ?auto_463902 ?auto_463903 ) ( ON ?auto_463901 ?auto_463902 ) ( ON ?auto_463900 ?auto_463901 ) ( ON ?auto_463899 ?auto_463900 ) ( ON ?auto_463898 ?auto_463899 ) ( ON ?auto_463897 ?auto_463898 ) ( ON ?auto_463896 ?auto_463897 ) ( ON ?auto_463895 ?auto_463896 ) ( ON ?auto_463894 ?auto_463895 ) ( CLEAR ?auto_463892 ) ( ON ?auto_463893 ?auto_463894 ) ( CLEAR ?auto_463893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_463892 ?auto_463893 )
      ( MAKE-14PILE ?auto_463892 ?auto_463893 ?auto_463894 ?auto_463895 ?auto_463896 ?auto_463897 ?auto_463898 ?auto_463899 ?auto_463900 ?auto_463901 ?auto_463902 ?auto_463903 ?auto_463904 ?auto_463905 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463921 - BLOCK
      ?auto_463922 - BLOCK
      ?auto_463923 - BLOCK
      ?auto_463924 - BLOCK
      ?auto_463925 - BLOCK
      ?auto_463926 - BLOCK
      ?auto_463927 - BLOCK
      ?auto_463928 - BLOCK
      ?auto_463929 - BLOCK
      ?auto_463930 - BLOCK
      ?auto_463931 - BLOCK
      ?auto_463932 - BLOCK
      ?auto_463933 - BLOCK
      ?auto_463934 - BLOCK
    )
    :vars
    (
      ?auto_463935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463934 ?auto_463935 ) ( ON-TABLE ?auto_463921 ) ( not ( = ?auto_463921 ?auto_463922 ) ) ( not ( = ?auto_463921 ?auto_463923 ) ) ( not ( = ?auto_463921 ?auto_463924 ) ) ( not ( = ?auto_463921 ?auto_463925 ) ) ( not ( = ?auto_463921 ?auto_463926 ) ) ( not ( = ?auto_463921 ?auto_463927 ) ) ( not ( = ?auto_463921 ?auto_463928 ) ) ( not ( = ?auto_463921 ?auto_463929 ) ) ( not ( = ?auto_463921 ?auto_463930 ) ) ( not ( = ?auto_463921 ?auto_463931 ) ) ( not ( = ?auto_463921 ?auto_463932 ) ) ( not ( = ?auto_463921 ?auto_463933 ) ) ( not ( = ?auto_463921 ?auto_463934 ) ) ( not ( = ?auto_463921 ?auto_463935 ) ) ( not ( = ?auto_463922 ?auto_463923 ) ) ( not ( = ?auto_463922 ?auto_463924 ) ) ( not ( = ?auto_463922 ?auto_463925 ) ) ( not ( = ?auto_463922 ?auto_463926 ) ) ( not ( = ?auto_463922 ?auto_463927 ) ) ( not ( = ?auto_463922 ?auto_463928 ) ) ( not ( = ?auto_463922 ?auto_463929 ) ) ( not ( = ?auto_463922 ?auto_463930 ) ) ( not ( = ?auto_463922 ?auto_463931 ) ) ( not ( = ?auto_463922 ?auto_463932 ) ) ( not ( = ?auto_463922 ?auto_463933 ) ) ( not ( = ?auto_463922 ?auto_463934 ) ) ( not ( = ?auto_463922 ?auto_463935 ) ) ( not ( = ?auto_463923 ?auto_463924 ) ) ( not ( = ?auto_463923 ?auto_463925 ) ) ( not ( = ?auto_463923 ?auto_463926 ) ) ( not ( = ?auto_463923 ?auto_463927 ) ) ( not ( = ?auto_463923 ?auto_463928 ) ) ( not ( = ?auto_463923 ?auto_463929 ) ) ( not ( = ?auto_463923 ?auto_463930 ) ) ( not ( = ?auto_463923 ?auto_463931 ) ) ( not ( = ?auto_463923 ?auto_463932 ) ) ( not ( = ?auto_463923 ?auto_463933 ) ) ( not ( = ?auto_463923 ?auto_463934 ) ) ( not ( = ?auto_463923 ?auto_463935 ) ) ( not ( = ?auto_463924 ?auto_463925 ) ) ( not ( = ?auto_463924 ?auto_463926 ) ) ( not ( = ?auto_463924 ?auto_463927 ) ) ( not ( = ?auto_463924 ?auto_463928 ) ) ( not ( = ?auto_463924 ?auto_463929 ) ) ( not ( = ?auto_463924 ?auto_463930 ) ) ( not ( = ?auto_463924 ?auto_463931 ) ) ( not ( = ?auto_463924 ?auto_463932 ) ) ( not ( = ?auto_463924 ?auto_463933 ) ) ( not ( = ?auto_463924 ?auto_463934 ) ) ( not ( = ?auto_463924 ?auto_463935 ) ) ( not ( = ?auto_463925 ?auto_463926 ) ) ( not ( = ?auto_463925 ?auto_463927 ) ) ( not ( = ?auto_463925 ?auto_463928 ) ) ( not ( = ?auto_463925 ?auto_463929 ) ) ( not ( = ?auto_463925 ?auto_463930 ) ) ( not ( = ?auto_463925 ?auto_463931 ) ) ( not ( = ?auto_463925 ?auto_463932 ) ) ( not ( = ?auto_463925 ?auto_463933 ) ) ( not ( = ?auto_463925 ?auto_463934 ) ) ( not ( = ?auto_463925 ?auto_463935 ) ) ( not ( = ?auto_463926 ?auto_463927 ) ) ( not ( = ?auto_463926 ?auto_463928 ) ) ( not ( = ?auto_463926 ?auto_463929 ) ) ( not ( = ?auto_463926 ?auto_463930 ) ) ( not ( = ?auto_463926 ?auto_463931 ) ) ( not ( = ?auto_463926 ?auto_463932 ) ) ( not ( = ?auto_463926 ?auto_463933 ) ) ( not ( = ?auto_463926 ?auto_463934 ) ) ( not ( = ?auto_463926 ?auto_463935 ) ) ( not ( = ?auto_463927 ?auto_463928 ) ) ( not ( = ?auto_463927 ?auto_463929 ) ) ( not ( = ?auto_463927 ?auto_463930 ) ) ( not ( = ?auto_463927 ?auto_463931 ) ) ( not ( = ?auto_463927 ?auto_463932 ) ) ( not ( = ?auto_463927 ?auto_463933 ) ) ( not ( = ?auto_463927 ?auto_463934 ) ) ( not ( = ?auto_463927 ?auto_463935 ) ) ( not ( = ?auto_463928 ?auto_463929 ) ) ( not ( = ?auto_463928 ?auto_463930 ) ) ( not ( = ?auto_463928 ?auto_463931 ) ) ( not ( = ?auto_463928 ?auto_463932 ) ) ( not ( = ?auto_463928 ?auto_463933 ) ) ( not ( = ?auto_463928 ?auto_463934 ) ) ( not ( = ?auto_463928 ?auto_463935 ) ) ( not ( = ?auto_463929 ?auto_463930 ) ) ( not ( = ?auto_463929 ?auto_463931 ) ) ( not ( = ?auto_463929 ?auto_463932 ) ) ( not ( = ?auto_463929 ?auto_463933 ) ) ( not ( = ?auto_463929 ?auto_463934 ) ) ( not ( = ?auto_463929 ?auto_463935 ) ) ( not ( = ?auto_463930 ?auto_463931 ) ) ( not ( = ?auto_463930 ?auto_463932 ) ) ( not ( = ?auto_463930 ?auto_463933 ) ) ( not ( = ?auto_463930 ?auto_463934 ) ) ( not ( = ?auto_463930 ?auto_463935 ) ) ( not ( = ?auto_463931 ?auto_463932 ) ) ( not ( = ?auto_463931 ?auto_463933 ) ) ( not ( = ?auto_463931 ?auto_463934 ) ) ( not ( = ?auto_463931 ?auto_463935 ) ) ( not ( = ?auto_463932 ?auto_463933 ) ) ( not ( = ?auto_463932 ?auto_463934 ) ) ( not ( = ?auto_463932 ?auto_463935 ) ) ( not ( = ?auto_463933 ?auto_463934 ) ) ( not ( = ?auto_463933 ?auto_463935 ) ) ( not ( = ?auto_463934 ?auto_463935 ) ) ( ON ?auto_463933 ?auto_463934 ) ( ON ?auto_463932 ?auto_463933 ) ( ON ?auto_463931 ?auto_463932 ) ( ON ?auto_463930 ?auto_463931 ) ( ON ?auto_463929 ?auto_463930 ) ( ON ?auto_463928 ?auto_463929 ) ( ON ?auto_463927 ?auto_463928 ) ( ON ?auto_463926 ?auto_463927 ) ( ON ?auto_463925 ?auto_463926 ) ( ON ?auto_463924 ?auto_463925 ) ( ON ?auto_463923 ?auto_463924 ) ( CLEAR ?auto_463921 ) ( ON ?auto_463922 ?auto_463923 ) ( CLEAR ?auto_463922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_463921 ?auto_463922 )
      ( MAKE-14PILE ?auto_463921 ?auto_463922 ?auto_463923 ?auto_463924 ?auto_463925 ?auto_463926 ?auto_463927 ?auto_463928 ?auto_463929 ?auto_463930 ?auto_463931 ?auto_463932 ?auto_463933 ?auto_463934 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463950 - BLOCK
      ?auto_463951 - BLOCK
      ?auto_463952 - BLOCK
      ?auto_463953 - BLOCK
      ?auto_463954 - BLOCK
      ?auto_463955 - BLOCK
      ?auto_463956 - BLOCK
      ?auto_463957 - BLOCK
      ?auto_463958 - BLOCK
      ?auto_463959 - BLOCK
      ?auto_463960 - BLOCK
      ?auto_463961 - BLOCK
      ?auto_463962 - BLOCK
      ?auto_463963 - BLOCK
    )
    :vars
    (
      ?auto_463964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463963 ?auto_463964 ) ( not ( = ?auto_463950 ?auto_463951 ) ) ( not ( = ?auto_463950 ?auto_463952 ) ) ( not ( = ?auto_463950 ?auto_463953 ) ) ( not ( = ?auto_463950 ?auto_463954 ) ) ( not ( = ?auto_463950 ?auto_463955 ) ) ( not ( = ?auto_463950 ?auto_463956 ) ) ( not ( = ?auto_463950 ?auto_463957 ) ) ( not ( = ?auto_463950 ?auto_463958 ) ) ( not ( = ?auto_463950 ?auto_463959 ) ) ( not ( = ?auto_463950 ?auto_463960 ) ) ( not ( = ?auto_463950 ?auto_463961 ) ) ( not ( = ?auto_463950 ?auto_463962 ) ) ( not ( = ?auto_463950 ?auto_463963 ) ) ( not ( = ?auto_463950 ?auto_463964 ) ) ( not ( = ?auto_463951 ?auto_463952 ) ) ( not ( = ?auto_463951 ?auto_463953 ) ) ( not ( = ?auto_463951 ?auto_463954 ) ) ( not ( = ?auto_463951 ?auto_463955 ) ) ( not ( = ?auto_463951 ?auto_463956 ) ) ( not ( = ?auto_463951 ?auto_463957 ) ) ( not ( = ?auto_463951 ?auto_463958 ) ) ( not ( = ?auto_463951 ?auto_463959 ) ) ( not ( = ?auto_463951 ?auto_463960 ) ) ( not ( = ?auto_463951 ?auto_463961 ) ) ( not ( = ?auto_463951 ?auto_463962 ) ) ( not ( = ?auto_463951 ?auto_463963 ) ) ( not ( = ?auto_463951 ?auto_463964 ) ) ( not ( = ?auto_463952 ?auto_463953 ) ) ( not ( = ?auto_463952 ?auto_463954 ) ) ( not ( = ?auto_463952 ?auto_463955 ) ) ( not ( = ?auto_463952 ?auto_463956 ) ) ( not ( = ?auto_463952 ?auto_463957 ) ) ( not ( = ?auto_463952 ?auto_463958 ) ) ( not ( = ?auto_463952 ?auto_463959 ) ) ( not ( = ?auto_463952 ?auto_463960 ) ) ( not ( = ?auto_463952 ?auto_463961 ) ) ( not ( = ?auto_463952 ?auto_463962 ) ) ( not ( = ?auto_463952 ?auto_463963 ) ) ( not ( = ?auto_463952 ?auto_463964 ) ) ( not ( = ?auto_463953 ?auto_463954 ) ) ( not ( = ?auto_463953 ?auto_463955 ) ) ( not ( = ?auto_463953 ?auto_463956 ) ) ( not ( = ?auto_463953 ?auto_463957 ) ) ( not ( = ?auto_463953 ?auto_463958 ) ) ( not ( = ?auto_463953 ?auto_463959 ) ) ( not ( = ?auto_463953 ?auto_463960 ) ) ( not ( = ?auto_463953 ?auto_463961 ) ) ( not ( = ?auto_463953 ?auto_463962 ) ) ( not ( = ?auto_463953 ?auto_463963 ) ) ( not ( = ?auto_463953 ?auto_463964 ) ) ( not ( = ?auto_463954 ?auto_463955 ) ) ( not ( = ?auto_463954 ?auto_463956 ) ) ( not ( = ?auto_463954 ?auto_463957 ) ) ( not ( = ?auto_463954 ?auto_463958 ) ) ( not ( = ?auto_463954 ?auto_463959 ) ) ( not ( = ?auto_463954 ?auto_463960 ) ) ( not ( = ?auto_463954 ?auto_463961 ) ) ( not ( = ?auto_463954 ?auto_463962 ) ) ( not ( = ?auto_463954 ?auto_463963 ) ) ( not ( = ?auto_463954 ?auto_463964 ) ) ( not ( = ?auto_463955 ?auto_463956 ) ) ( not ( = ?auto_463955 ?auto_463957 ) ) ( not ( = ?auto_463955 ?auto_463958 ) ) ( not ( = ?auto_463955 ?auto_463959 ) ) ( not ( = ?auto_463955 ?auto_463960 ) ) ( not ( = ?auto_463955 ?auto_463961 ) ) ( not ( = ?auto_463955 ?auto_463962 ) ) ( not ( = ?auto_463955 ?auto_463963 ) ) ( not ( = ?auto_463955 ?auto_463964 ) ) ( not ( = ?auto_463956 ?auto_463957 ) ) ( not ( = ?auto_463956 ?auto_463958 ) ) ( not ( = ?auto_463956 ?auto_463959 ) ) ( not ( = ?auto_463956 ?auto_463960 ) ) ( not ( = ?auto_463956 ?auto_463961 ) ) ( not ( = ?auto_463956 ?auto_463962 ) ) ( not ( = ?auto_463956 ?auto_463963 ) ) ( not ( = ?auto_463956 ?auto_463964 ) ) ( not ( = ?auto_463957 ?auto_463958 ) ) ( not ( = ?auto_463957 ?auto_463959 ) ) ( not ( = ?auto_463957 ?auto_463960 ) ) ( not ( = ?auto_463957 ?auto_463961 ) ) ( not ( = ?auto_463957 ?auto_463962 ) ) ( not ( = ?auto_463957 ?auto_463963 ) ) ( not ( = ?auto_463957 ?auto_463964 ) ) ( not ( = ?auto_463958 ?auto_463959 ) ) ( not ( = ?auto_463958 ?auto_463960 ) ) ( not ( = ?auto_463958 ?auto_463961 ) ) ( not ( = ?auto_463958 ?auto_463962 ) ) ( not ( = ?auto_463958 ?auto_463963 ) ) ( not ( = ?auto_463958 ?auto_463964 ) ) ( not ( = ?auto_463959 ?auto_463960 ) ) ( not ( = ?auto_463959 ?auto_463961 ) ) ( not ( = ?auto_463959 ?auto_463962 ) ) ( not ( = ?auto_463959 ?auto_463963 ) ) ( not ( = ?auto_463959 ?auto_463964 ) ) ( not ( = ?auto_463960 ?auto_463961 ) ) ( not ( = ?auto_463960 ?auto_463962 ) ) ( not ( = ?auto_463960 ?auto_463963 ) ) ( not ( = ?auto_463960 ?auto_463964 ) ) ( not ( = ?auto_463961 ?auto_463962 ) ) ( not ( = ?auto_463961 ?auto_463963 ) ) ( not ( = ?auto_463961 ?auto_463964 ) ) ( not ( = ?auto_463962 ?auto_463963 ) ) ( not ( = ?auto_463962 ?auto_463964 ) ) ( not ( = ?auto_463963 ?auto_463964 ) ) ( ON ?auto_463962 ?auto_463963 ) ( ON ?auto_463961 ?auto_463962 ) ( ON ?auto_463960 ?auto_463961 ) ( ON ?auto_463959 ?auto_463960 ) ( ON ?auto_463958 ?auto_463959 ) ( ON ?auto_463957 ?auto_463958 ) ( ON ?auto_463956 ?auto_463957 ) ( ON ?auto_463955 ?auto_463956 ) ( ON ?auto_463954 ?auto_463955 ) ( ON ?auto_463953 ?auto_463954 ) ( ON ?auto_463952 ?auto_463953 ) ( ON ?auto_463951 ?auto_463952 ) ( ON ?auto_463950 ?auto_463951 ) ( CLEAR ?auto_463950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_463950 )
      ( MAKE-14PILE ?auto_463950 ?auto_463951 ?auto_463952 ?auto_463953 ?auto_463954 ?auto_463955 ?auto_463956 ?auto_463957 ?auto_463958 ?auto_463959 ?auto_463960 ?auto_463961 ?auto_463962 ?auto_463963 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_463979 - BLOCK
      ?auto_463980 - BLOCK
      ?auto_463981 - BLOCK
      ?auto_463982 - BLOCK
      ?auto_463983 - BLOCK
      ?auto_463984 - BLOCK
      ?auto_463985 - BLOCK
      ?auto_463986 - BLOCK
      ?auto_463987 - BLOCK
      ?auto_463988 - BLOCK
      ?auto_463989 - BLOCK
      ?auto_463990 - BLOCK
      ?auto_463991 - BLOCK
      ?auto_463992 - BLOCK
    )
    :vars
    (
      ?auto_463993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_463992 ?auto_463993 ) ( not ( = ?auto_463979 ?auto_463980 ) ) ( not ( = ?auto_463979 ?auto_463981 ) ) ( not ( = ?auto_463979 ?auto_463982 ) ) ( not ( = ?auto_463979 ?auto_463983 ) ) ( not ( = ?auto_463979 ?auto_463984 ) ) ( not ( = ?auto_463979 ?auto_463985 ) ) ( not ( = ?auto_463979 ?auto_463986 ) ) ( not ( = ?auto_463979 ?auto_463987 ) ) ( not ( = ?auto_463979 ?auto_463988 ) ) ( not ( = ?auto_463979 ?auto_463989 ) ) ( not ( = ?auto_463979 ?auto_463990 ) ) ( not ( = ?auto_463979 ?auto_463991 ) ) ( not ( = ?auto_463979 ?auto_463992 ) ) ( not ( = ?auto_463979 ?auto_463993 ) ) ( not ( = ?auto_463980 ?auto_463981 ) ) ( not ( = ?auto_463980 ?auto_463982 ) ) ( not ( = ?auto_463980 ?auto_463983 ) ) ( not ( = ?auto_463980 ?auto_463984 ) ) ( not ( = ?auto_463980 ?auto_463985 ) ) ( not ( = ?auto_463980 ?auto_463986 ) ) ( not ( = ?auto_463980 ?auto_463987 ) ) ( not ( = ?auto_463980 ?auto_463988 ) ) ( not ( = ?auto_463980 ?auto_463989 ) ) ( not ( = ?auto_463980 ?auto_463990 ) ) ( not ( = ?auto_463980 ?auto_463991 ) ) ( not ( = ?auto_463980 ?auto_463992 ) ) ( not ( = ?auto_463980 ?auto_463993 ) ) ( not ( = ?auto_463981 ?auto_463982 ) ) ( not ( = ?auto_463981 ?auto_463983 ) ) ( not ( = ?auto_463981 ?auto_463984 ) ) ( not ( = ?auto_463981 ?auto_463985 ) ) ( not ( = ?auto_463981 ?auto_463986 ) ) ( not ( = ?auto_463981 ?auto_463987 ) ) ( not ( = ?auto_463981 ?auto_463988 ) ) ( not ( = ?auto_463981 ?auto_463989 ) ) ( not ( = ?auto_463981 ?auto_463990 ) ) ( not ( = ?auto_463981 ?auto_463991 ) ) ( not ( = ?auto_463981 ?auto_463992 ) ) ( not ( = ?auto_463981 ?auto_463993 ) ) ( not ( = ?auto_463982 ?auto_463983 ) ) ( not ( = ?auto_463982 ?auto_463984 ) ) ( not ( = ?auto_463982 ?auto_463985 ) ) ( not ( = ?auto_463982 ?auto_463986 ) ) ( not ( = ?auto_463982 ?auto_463987 ) ) ( not ( = ?auto_463982 ?auto_463988 ) ) ( not ( = ?auto_463982 ?auto_463989 ) ) ( not ( = ?auto_463982 ?auto_463990 ) ) ( not ( = ?auto_463982 ?auto_463991 ) ) ( not ( = ?auto_463982 ?auto_463992 ) ) ( not ( = ?auto_463982 ?auto_463993 ) ) ( not ( = ?auto_463983 ?auto_463984 ) ) ( not ( = ?auto_463983 ?auto_463985 ) ) ( not ( = ?auto_463983 ?auto_463986 ) ) ( not ( = ?auto_463983 ?auto_463987 ) ) ( not ( = ?auto_463983 ?auto_463988 ) ) ( not ( = ?auto_463983 ?auto_463989 ) ) ( not ( = ?auto_463983 ?auto_463990 ) ) ( not ( = ?auto_463983 ?auto_463991 ) ) ( not ( = ?auto_463983 ?auto_463992 ) ) ( not ( = ?auto_463983 ?auto_463993 ) ) ( not ( = ?auto_463984 ?auto_463985 ) ) ( not ( = ?auto_463984 ?auto_463986 ) ) ( not ( = ?auto_463984 ?auto_463987 ) ) ( not ( = ?auto_463984 ?auto_463988 ) ) ( not ( = ?auto_463984 ?auto_463989 ) ) ( not ( = ?auto_463984 ?auto_463990 ) ) ( not ( = ?auto_463984 ?auto_463991 ) ) ( not ( = ?auto_463984 ?auto_463992 ) ) ( not ( = ?auto_463984 ?auto_463993 ) ) ( not ( = ?auto_463985 ?auto_463986 ) ) ( not ( = ?auto_463985 ?auto_463987 ) ) ( not ( = ?auto_463985 ?auto_463988 ) ) ( not ( = ?auto_463985 ?auto_463989 ) ) ( not ( = ?auto_463985 ?auto_463990 ) ) ( not ( = ?auto_463985 ?auto_463991 ) ) ( not ( = ?auto_463985 ?auto_463992 ) ) ( not ( = ?auto_463985 ?auto_463993 ) ) ( not ( = ?auto_463986 ?auto_463987 ) ) ( not ( = ?auto_463986 ?auto_463988 ) ) ( not ( = ?auto_463986 ?auto_463989 ) ) ( not ( = ?auto_463986 ?auto_463990 ) ) ( not ( = ?auto_463986 ?auto_463991 ) ) ( not ( = ?auto_463986 ?auto_463992 ) ) ( not ( = ?auto_463986 ?auto_463993 ) ) ( not ( = ?auto_463987 ?auto_463988 ) ) ( not ( = ?auto_463987 ?auto_463989 ) ) ( not ( = ?auto_463987 ?auto_463990 ) ) ( not ( = ?auto_463987 ?auto_463991 ) ) ( not ( = ?auto_463987 ?auto_463992 ) ) ( not ( = ?auto_463987 ?auto_463993 ) ) ( not ( = ?auto_463988 ?auto_463989 ) ) ( not ( = ?auto_463988 ?auto_463990 ) ) ( not ( = ?auto_463988 ?auto_463991 ) ) ( not ( = ?auto_463988 ?auto_463992 ) ) ( not ( = ?auto_463988 ?auto_463993 ) ) ( not ( = ?auto_463989 ?auto_463990 ) ) ( not ( = ?auto_463989 ?auto_463991 ) ) ( not ( = ?auto_463989 ?auto_463992 ) ) ( not ( = ?auto_463989 ?auto_463993 ) ) ( not ( = ?auto_463990 ?auto_463991 ) ) ( not ( = ?auto_463990 ?auto_463992 ) ) ( not ( = ?auto_463990 ?auto_463993 ) ) ( not ( = ?auto_463991 ?auto_463992 ) ) ( not ( = ?auto_463991 ?auto_463993 ) ) ( not ( = ?auto_463992 ?auto_463993 ) ) ( ON ?auto_463991 ?auto_463992 ) ( ON ?auto_463990 ?auto_463991 ) ( ON ?auto_463989 ?auto_463990 ) ( ON ?auto_463988 ?auto_463989 ) ( ON ?auto_463987 ?auto_463988 ) ( ON ?auto_463986 ?auto_463987 ) ( ON ?auto_463985 ?auto_463986 ) ( ON ?auto_463984 ?auto_463985 ) ( ON ?auto_463983 ?auto_463984 ) ( ON ?auto_463982 ?auto_463983 ) ( ON ?auto_463981 ?auto_463982 ) ( ON ?auto_463980 ?auto_463981 ) ( ON ?auto_463979 ?auto_463980 ) ( CLEAR ?auto_463979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_463979 )
      ( MAKE-14PILE ?auto_463979 ?auto_463980 ?auto_463981 ?auto_463982 ?auto_463983 ?auto_463984 ?auto_463985 ?auto_463986 ?auto_463987 ?auto_463988 ?auto_463989 ?auto_463990 ?auto_463991 ?auto_463992 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464009 - BLOCK
      ?auto_464010 - BLOCK
      ?auto_464011 - BLOCK
      ?auto_464012 - BLOCK
      ?auto_464013 - BLOCK
      ?auto_464014 - BLOCK
      ?auto_464015 - BLOCK
      ?auto_464016 - BLOCK
      ?auto_464017 - BLOCK
      ?auto_464018 - BLOCK
      ?auto_464019 - BLOCK
      ?auto_464020 - BLOCK
      ?auto_464021 - BLOCK
      ?auto_464022 - BLOCK
      ?auto_464023 - BLOCK
    )
    :vars
    (
      ?auto_464024 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_464022 ) ( ON ?auto_464023 ?auto_464024 ) ( CLEAR ?auto_464023 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_464009 ) ( ON ?auto_464010 ?auto_464009 ) ( ON ?auto_464011 ?auto_464010 ) ( ON ?auto_464012 ?auto_464011 ) ( ON ?auto_464013 ?auto_464012 ) ( ON ?auto_464014 ?auto_464013 ) ( ON ?auto_464015 ?auto_464014 ) ( ON ?auto_464016 ?auto_464015 ) ( ON ?auto_464017 ?auto_464016 ) ( ON ?auto_464018 ?auto_464017 ) ( ON ?auto_464019 ?auto_464018 ) ( ON ?auto_464020 ?auto_464019 ) ( ON ?auto_464021 ?auto_464020 ) ( ON ?auto_464022 ?auto_464021 ) ( not ( = ?auto_464009 ?auto_464010 ) ) ( not ( = ?auto_464009 ?auto_464011 ) ) ( not ( = ?auto_464009 ?auto_464012 ) ) ( not ( = ?auto_464009 ?auto_464013 ) ) ( not ( = ?auto_464009 ?auto_464014 ) ) ( not ( = ?auto_464009 ?auto_464015 ) ) ( not ( = ?auto_464009 ?auto_464016 ) ) ( not ( = ?auto_464009 ?auto_464017 ) ) ( not ( = ?auto_464009 ?auto_464018 ) ) ( not ( = ?auto_464009 ?auto_464019 ) ) ( not ( = ?auto_464009 ?auto_464020 ) ) ( not ( = ?auto_464009 ?auto_464021 ) ) ( not ( = ?auto_464009 ?auto_464022 ) ) ( not ( = ?auto_464009 ?auto_464023 ) ) ( not ( = ?auto_464009 ?auto_464024 ) ) ( not ( = ?auto_464010 ?auto_464011 ) ) ( not ( = ?auto_464010 ?auto_464012 ) ) ( not ( = ?auto_464010 ?auto_464013 ) ) ( not ( = ?auto_464010 ?auto_464014 ) ) ( not ( = ?auto_464010 ?auto_464015 ) ) ( not ( = ?auto_464010 ?auto_464016 ) ) ( not ( = ?auto_464010 ?auto_464017 ) ) ( not ( = ?auto_464010 ?auto_464018 ) ) ( not ( = ?auto_464010 ?auto_464019 ) ) ( not ( = ?auto_464010 ?auto_464020 ) ) ( not ( = ?auto_464010 ?auto_464021 ) ) ( not ( = ?auto_464010 ?auto_464022 ) ) ( not ( = ?auto_464010 ?auto_464023 ) ) ( not ( = ?auto_464010 ?auto_464024 ) ) ( not ( = ?auto_464011 ?auto_464012 ) ) ( not ( = ?auto_464011 ?auto_464013 ) ) ( not ( = ?auto_464011 ?auto_464014 ) ) ( not ( = ?auto_464011 ?auto_464015 ) ) ( not ( = ?auto_464011 ?auto_464016 ) ) ( not ( = ?auto_464011 ?auto_464017 ) ) ( not ( = ?auto_464011 ?auto_464018 ) ) ( not ( = ?auto_464011 ?auto_464019 ) ) ( not ( = ?auto_464011 ?auto_464020 ) ) ( not ( = ?auto_464011 ?auto_464021 ) ) ( not ( = ?auto_464011 ?auto_464022 ) ) ( not ( = ?auto_464011 ?auto_464023 ) ) ( not ( = ?auto_464011 ?auto_464024 ) ) ( not ( = ?auto_464012 ?auto_464013 ) ) ( not ( = ?auto_464012 ?auto_464014 ) ) ( not ( = ?auto_464012 ?auto_464015 ) ) ( not ( = ?auto_464012 ?auto_464016 ) ) ( not ( = ?auto_464012 ?auto_464017 ) ) ( not ( = ?auto_464012 ?auto_464018 ) ) ( not ( = ?auto_464012 ?auto_464019 ) ) ( not ( = ?auto_464012 ?auto_464020 ) ) ( not ( = ?auto_464012 ?auto_464021 ) ) ( not ( = ?auto_464012 ?auto_464022 ) ) ( not ( = ?auto_464012 ?auto_464023 ) ) ( not ( = ?auto_464012 ?auto_464024 ) ) ( not ( = ?auto_464013 ?auto_464014 ) ) ( not ( = ?auto_464013 ?auto_464015 ) ) ( not ( = ?auto_464013 ?auto_464016 ) ) ( not ( = ?auto_464013 ?auto_464017 ) ) ( not ( = ?auto_464013 ?auto_464018 ) ) ( not ( = ?auto_464013 ?auto_464019 ) ) ( not ( = ?auto_464013 ?auto_464020 ) ) ( not ( = ?auto_464013 ?auto_464021 ) ) ( not ( = ?auto_464013 ?auto_464022 ) ) ( not ( = ?auto_464013 ?auto_464023 ) ) ( not ( = ?auto_464013 ?auto_464024 ) ) ( not ( = ?auto_464014 ?auto_464015 ) ) ( not ( = ?auto_464014 ?auto_464016 ) ) ( not ( = ?auto_464014 ?auto_464017 ) ) ( not ( = ?auto_464014 ?auto_464018 ) ) ( not ( = ?auto_464014 ?auto_464019 ) ) ( not ( = ?auto_464014 ?auto_464020 ) ) ( not ( = ?auto_464014 ?auto_464021 ) ) ( not ( = ?auto_464014 ?auto_464022 ) ) ( not ( = ?auto_464014 ?auto_464023 ) ) ( not ( = ?auto_464014 ?auto_464024 ) ) ( not ( = ?auto_464015 ?auto_464016 ) ) ( not ( = ?auto_464015 ?auto_464017 ) ) ( not ( = ?auto_464015 ?auto_464018 ) ) ( not ( = ?auto_464015 ?auto_464019 ) ) ( not ( = ?auto_464015 ?auto_464020 ) ) ( not ( = ?auto_464015 ?auto_464021 ) ) ( not ( = ?auto_464015 ?auto_464022 ) ) ( not ( = ?auto_464015 ?auto_464023 ) ) ( not ( = ?auto_464015 ?auto_464024 ) ) ( not ( = ?auto_464016 ?auto_464017 ) ) ( not ( = ?auto_464016 ?auto_464018 ) ) ( not ( = ?auto_464016 ?auto_464019 ) ) ( not ( = ?auto_464016 ?auto_464020 ) ) ( not ( = ?auto_464016 ?auto_464021 ) ) ( not ( = ?auto_464016 ?auto_464022 ) ) ( not ( = ?auto_464016 ?auto_464023 ) ) ( not ( = ?auto_464016 ?auto_464024 ) ) ( not ( = ?auto_464017 ?auto_464018 ) ) ( not ( = ?auto_464017 ?auto_464019 ) ) ( not ( = ?auto_464017 ?auto_464020 ) ) ( not ( = ?auto_464017 ?auto_464021 ) ) ( not ( = ?auto_464017 ?auto_464022 ) ) ( not ( = ?auto_464017 ?auto_464023 ) ) ( not ( = ?auto_464017 ?auto_464024 ) ) ( not ( = ?auto_464018 ?auto_464019 ) ) ( not ( = ?auto_464018 ?auto_464020 ) ) ( not ( = ?auto_464018 ?auto_464021 ) ) ( not ( = ?auto_464018 ?auto_464022 ) ) ( not ( = ?auto_464018 ?auto_464023 ) ) ( not ( = ?auto_464018 ?auto_464024 ) ) ( not ( = ?auto_464019 ?auto_464020 ) ) ( not ( = ?auto_464019 ?auto_464021 ) ) ( not ( = ?auto_464019 ?auto_464022 ) ) ( not ( = ?auto_464019 ?auto_464023 ) ) ( not ( = ?auto_464019 ?auto_464024 ) ) ( not ( = ?auto_464020 ?auto_464021 ) ) ( not ( = ?auto_464020 ?auto_464022 ) ) ( not ( = ?auto_464020 ?auto_464023 ) ) ( not ( = ?auto_464020 ?auto_464024 ) ) ( not ( = ?auto_464021 ?auto_464022 ) ) ( not ( = ?auto_464021 ?auto_464023 ) ) ( not ( = ?auto_464021 ?auto_464024 ) ) ( not ( = ?auto_464022 ?auto_464023 ) ) ( not ( = ?auto_464022 ?auto_464024 ) ) ( not ( = ?auto_464023 ?auto_464024 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_464023 ?auto_464024 )
      ( !STACK ?auto_464023 ?auto_464022 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464040 - BLOCK
      ?auto_464041 - BLOCK
      ?auto_464042 - BLOCK
      ?auto_464043 - BLOCK
      ?auto_464044 - BLOCK
      ?auto_464045 - BLOCK
      ?auto_464046 - BLOCK
      ?auto_464047 - BLOCK
      ?auto_464048 - BLOCK
      ?auto_464049 - BLOCK
      ?auto_464050 - BLOCK
      ?auto_464051 - BLOCK
      ?auto_464052 - BLOCK
      ?auto_464053 - BLOCK
      ?auto_464054 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_464053 ) ( ON-TABLE ?auto_464054 ) ( CLEAR ?auto_464054 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_464040 ) ( ON ?auto_464041 ?auto_464040 ) ( ON ?auto_464042 ?auto_464041 ) ( ON ?auto_464043 ?auto_464042 ) ( ON ?auto_464044 ?auto_464043 ) ( ON ?auto_464045 ?auto_464044 ) ( ON ?auto_464046 ?auto_464045 ) ( ON ?auto_464047 ?auto_464046 ) ( ON ?auto_464048 ?auto_464047 ) ( ON ?auto_464049 ?auto_464048 ) ( ON ?auto_464050 ?auto_464049 ) ( ON ?auto_464051 ?auto_464050 ) ( ON ?auto_464052 ?auto_464051 ) ( ON ?auto_464053 ?auto_464052 ) ( not ( = ?auto_464040 ?auto_464041 ) ) ( not ( = ?auto_464040 ?auto_464042 ) ) ( not ( = ?auto_464040 ?auto_464043 ) ) ( not ( = ?auto_464040 ?auto_464044 ) ) ( not ( = ?auto_464040 ?auto_464045 ) ) ( not ( = ?auto_464040 ?auto_464046 ) ) ( not ( = ?auto_464040 ?auto_464047 ) ) ( not ( = ?auto_464040 ?auto_464048 ) ) ( not ( = ?auto_464040 ?auto_464049 ) ) ( not ( = ?auto_464040 ?auto_464050 ) ) ( not ( = ?auto_464040 ?auto_464051 ) ) ( not ( = ?auto_464040 ?auto_464052 ) ) ( not ( = ?auto_464040 ?auto_464053 ) ) ( not ( = ?auto_464040 ?auto_464054 ) ) ( not ( = ?auto_464041 ?auto_464042 ) ) ( not ( = ?auto_464041 ?auto_464043 ) ) ( not ( = ?auto_464041 ?auto_464044 ) ) ( not ( = ?auto_464041 ?auto_464045 ) ) ( not ( = ?auto_464041 ?auto_464046 ) ) ( not ( = ?auto_464041 ?auto_464047 ) ) ( not ( = ?auto_464041 ?auto_464048 ) ) ( not ( = ?auto_464041 ?auto_464049 ) ) ( not ( = ?auto_464041 ?auto_464050 ) ) ( not ( = ?auto_464041 ?auto_464051 ) ) ( not ( = ?auto_464041 ?auto_464052 ) ) ( not ( = ?auto_464041 ?auto_464053 ) ) ( not ( = ?auto_464041 ?auto_464054 ) ) ( not ( = ?auto_464042 ?auto_464043 ) ) ( not ( = ?auto_464042 ?auto_464044 ) ) ( not ( = ?auto_464042 ?auto_464045 ) ) ( not ( = ?auto_464042 ?auto_464046 ) ) ( not ( = ?auto_464042 ?auto_464047 ) ) ( not ( = ?auto_464042 ?auto_464048 ) ) ( not ( = ?auto_464042 ?auto_464049 ) ) ( not ( = ?auto_464042 ?auto_464050 ) ) ( not ( = ?auto_464042 ?auto_464051 ) ) ( not ( = ?auto_464042 ?auto_464052 ) ) ( not ( = ?auto_464042 ?auto_464053 ) ) ( not ( = ?auto_464042 ?auto_464054 ) ) ( not ( = ?auto_464043 ?auto_464044 ) ) ( not ( = ?auto_464043 ?auto_464045 ) ) ( not ( = ?auto_464043 ?auto_464046 ) ) ( not ( = ?auto_464043 ?auto_464047 ) ) ( not ( = ?auto_464043 ?auto_464048 ) ) ( not ( = ?auto_464043 ?auto_464049 ) ) ( not ( = ?auto_464043 ?auto_464050 ) ) ( not ( = ?auto_464043 ?auto_464051 ) ) ( not ( = ?auto_464043 ?auto_464052 ) ) ( not ( = ?auto_464043 ?auto_464053 ) ) ( not ( = ?auto_464043 ?auto_464054 ) ) ( not ( = ?auto_464044 ?auto_464045 ) ) ( not ( = ?auto_464044 ?auto_464046 ) ) ( not ( = ?auto_464044 ?auto_464047 ) ) ( not ( = ?auto_464044 ?auto_464048 ) ) ( not ( = ?auto_464044 ?auto_464049 ) ) ( not ( = ?auto_464044 ?auto_464050 ) ) ( not ( = ?auto_464044 ?auto_464051 ) ) ( not ( = ?auto_464044 ?auto_464052 ) ) ( not ( = ?auto_464044 ?auto_464053 ) ) ( not ( = ?auto_464044 ?auto_464054 ) ) ( not ( = ?auto_464045 ?auto_464046 ) ) ( not ( = ?auto_464045 ?auto_464047 ) ) ( not ( = ?auto_464045 ?auto_464048 ) ) ( not ( = ?auto_464045 ?auto_464049 ) ) ( not ( = ?auto_464045 ?auto_464050 ) ) ( not ( = ?auto_464045 ?auto_464051 ) ) ( not ( = ?auto_464045 ?auto_464052 ) ) ( not ( = ?auto_464045 ?auto_464053 ) ) ( not ( = ?auto_464045 ?auto_464054 ) ) ( not ( = ?auto_464046 ?auto_464047 ) ) ( not ( = ?auto_464046 ?auto_464048 ) ) ( not ( = ?auto_464046 ?auto_464049 ) ) ( not ( = ?auto_464046 ?auto_464050 ) ) ( not ( = ?auto_464046 ?auto_464051 ) ) ( not ( = ?auto_464046 ?auto_464052 ) ) ( not ( = ?auto_464046 ?auto_464053 ) ) ( not ( = ?auto_464046 ?auto_464054 ) ) ( not ( = ?auto_464047 ?auto_464048 ) ) ( not ( = ?auto_464047 ?auto_464049 ) ) ( not ( = ?auto_464047 ?auto_464050 ) ) ( not ( = ?auto_464047 ?auto_464051 ) ) ( not ( = ?auto_464047 ?auto_464052 ) ) ( not ( = ?auto_464047 ?auto_464053 ) ) ( not ( = ?auto_464047 ?auto_464054 ) ) ( not ( = ?auto_464048 ?auto_464049 ) ) ( not ( = ?auto_464048 ?auto_464050 ) ) ( not ( = ?auto_464048 ?auto_464051 ) ) ( not ( = ?auto_464048 ?auto_464052 ) ) ( not ( = ?auto_464048 ?auto_464053 ) ) ( not ( = ?auto_464048 ?auto_464054 ) ) ( not ( = ?auto_464049 ?auto_464050 ) ) ( not ( = ?auto_464049 ?auto_464051 ) ) ( not ( = ?auto_464049 ?auto_464052 ) ) ( not ( = ?auto_464049 ?auto_464053 ) ) ( not ( = ?auto_464049 ?auto_464054 ) ) ( not ( = ?auto_464050 ?auto_464051 ) ) ( not ( = ?auto_464050 ?auto_464052 ) ) ( not ( = ?auto_464050 ?auto_464053 ) ) ( not ( = ?auto_464050 ?auto_464054 ) ) ( not ( = ?auto_464051 ?auto_464052 ) ) ( not ( = ?auto_464051 ?auto_464053 ) ) ( not ( = ?auto_464051 ?auto_464054 ) ) ( not ( = ?auto_464052 ?auto_464053 ) ) ( not ( = ?auto_464052 ?auto_464054 ) ) ( not ( = ?auto_464053 ?auto_464054 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_464054 )
      ( !STACK ?auto_464054 ?auto_464053 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464070 - BLOCK
      ?auto_464071 - BLOCK
      ?auto_464072 - BLOCK
      ?auto_464073 - BLOCK
      ?auto_464074 - BLOCK
      ?auto_464075 - BLOCK
      ?auto_464076 - BLOCK
      ?auto_464077 - BLOCK
      ?auto_464078 - BLOCK
      ?auto_464079 - BLOCK
      ?auto_464080 - BLOCK
      ?auto_464081 - BLOCK
      ?auto_464082 - BLOCK
      ?auto_464083 - BLOCK
      ?auto_464084 - BLOCK
    )
    :vars
    (
      ?auto_464085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464084 ?auto_464085 ) ( ON-TABLE ?auto_464070 ) ( ON ?auto_464071 ?auto_464070 ) ( ON ?auto_464072 ?auto_464071 ) ( ON ?auto_464073 ?auto_464072 ) ( ON ?auto_464074 ?auto_464073 ) ( ON ?auto_464075 ?auto_464074 ) ( ON ?auto_464076 ?auto_464075 ) ( ON ?auto_464077 ?auto_464076 ) ( ON ?auto_464078 ?auto_464077 ) ( ON ?auto_464079 ?auto_464078 ) ( ON ?auto_464080 ?auto_464079 ) ( ON ?auto_464081 ?auto_464080 ) ( ON ?auto_464082 ?auto_464081 ) ( not ( = ?auto_464070 ?auto_464071 ) ) ( not ( = ?auto_464070 ?auto_464072 ) ) ( not ( = ?auto_464070 ?auto_464073 ) ) ( not ( = ?auto_464070 ?auto_464074 ) ) ( not ( = ?auto_464070 ?auto_464075 ) ) ( not ( = ?auto_464070 ?auto_464076 ) ) ( not ( = ?auto_464070 ?auto_464077 ) ) ( not ( = ?auto_464070 ?auto_464078 ) ) ( not ( = ?auto_464070 ?auto_464079 ) ) ( not ( = ?auto_464070 ?auto_464080 ) ) ( not ( = ?auto_464070 ?auto_464081 ) ) ( not ( = ?auto_464070 ?auto_464082 ) ) ( not ( = ?auto_464070 ?auto_464083 ) ) ( not ( = ?auto_464070 ?auto_464084 ) ) ( not ( = ?auto_464070 ?auto_464085 ) ) ( not ( = ?auto_464071 ?auto_464072 ) ) ( not ( = ?auto_464071 ?auto_464073 ) ) ( not ( = ?auto_464071 ?auto_464074 ) ) ( not ( = ?auto_464071 ?auto_464075 ) ) ( not ( = ?auto_464071 ?auto_464076 ) ) ( not ( = ?auto_464071 ?auto_464077 ) ) ( not ( = ?auto_464071 ?auto_464078 ) ) ( not ( = ?auto_464071 ?auto_464079 ) ) ( not ( = ?auto_464071 ?auto_464080 ) ) ( not ( = ?auto_464071 ?auto_464081 ) ) ( not ( = ?auto_464071 ?auto_464082 ) ) ( not ( = ?auto_464071 ?auto_464083 ) ) ( not ( = ?auto_464071 ?auto_464084 ) ) ( not ( = ?auto_464071 ?auto_464085 ) ) ( not ( = ?auto_464072 ?auto_464073 ) ) ( not ( = ?auto_464072 ?auto_464074 ) ) ( not ( = ?auto_464072 ?auto_464075 ) ) ( not ( = ?auto_464072 ?auto_464076 ) ) ( not ( = ?auto_464072 ?auto_464077 ) ) ( not ( = ?auto_464072 ?auto_464078 ) ) ( not ( = ?auto_464072 ?auto_464079 ) ) ( not ( = ?auto_464072 ?auto_464080 ) ) ( not ( = ?auto_464072 ?auto_464081 ) ) ( not ( = ?auto_464072 ?auto_464082 ) ) ( not ( = ?auto_464072 ?auto_464083 ) ) ( not ( = ?auto_464072 ?auto_464084 ) ) ( not ( = ?auto_464072 ?auto_464085 ) ) ( not ( = ?auto_464073 ?auto_464074 ) ) ( not ( = ?auto_464073 ?auto_464075 ) ) ( not ( = ?auto_464073 ?auto_464076 ) ) ( not ( = ?auto_464073 ?auto_464077 ) ) ( not ( = ?auto_464073 ?auto_464078 ) ) ( not ( = ?auto_464073 ?auto_464079 ) ) ( not ( = ?auto_464073 ?auto_464080 ) ) ( not ( = ?auto_464073 ?auto_464081 ) ) ( not ( = ?auto_464073 ?auto_464082 ) ) ( not ( = ?auto_464073 ?auto_464083 ) ) ( not ( = ?auto_464073 ?auto_464084 ) ) ( not ( = ?auto_464073 ?auto_464085 ) ) ( not ( = ?auto_464074 ?auto_464075 ) ) ( not ( = ?auto_464074 ?auto_464076 ) ) ( not ( = ?auto_464074 ?auto_464077 ) ) ( not ( = ?auto_464074 ?auto_464078 ) ) ( not ( = ?auto_464074 ?auto_464079 ) ) ( not ( = ?auto_464074 ?auto_464080 ) ) ( not ( = ?auto_464074 ?auto_464081 ) ) ( not ( = ?auto_464074 ?auto_464082 ) ) ( not ( = ?auto_464074 ?auto_464083 ) ) ( not ( = ?auto_464074 ?auto_464084 ) ) ( not ( = ?auto_464074 ?auto_464085 ) ) ( not ( = ?auto_464075 ?auto_464076 ) ) ( not ( = ?auto_464075 ?auto_464077 ) ) ( not ( = ?auto_464075 ?auto_464078 ) ) ( not ( = ?auto_464075 ?auto_464079 ) ) ( not ( = ?auto_464075 ?auto_464080 ) ) ( not ( = ?auto_464075 ?auto_464081 ) ) ( not ( = ?auto_464075 ?auto_464082 ) ) ( not ( = ?auto_464075 ?auto_464083 ) ) ( not ( = ?auto_464075 ?auto_464084 ) ) ( not ( = ?auto_464075 ?auto_464085 ) ) ( not ( = ?auto_464076 ?auto_464077 ) ) ( not ( = ?auto_464076 ?auto_464078 ) ) ( not ( = ?auto_464076 ?auto_464079 ) ) ( not ( = ?auto_464076 ?auto_464080 ) ) ( not ( = ?auto_464076 ?auto_464081 ) ) ( not ( = ?auto_464076 ?auto_464082 ) ) ( not ( = ?auto_464076 ?auto_464083 ) ) ( not ( = ?auto_464076 ?auto_464084 ) ) ( not ( = ?auto_464076 ?auto_464085 ) ) ( not ( = ?auto_464077 ?auto_464078 ) ) ( not ( = ?auto_464077 ?auto_464079 ) ) ( not ( = ?auto_464077 ?auto_464080 ) ) ( not ( = ?auto_464077 ?auto_464081 ) ) ( not ( = ?auto_464077 ?auto_464082 ) ) ( not ( = ?auto_464077 ?auto_464083 ) ) ( not ( = ?auto_464077 ?auto_464084 ) ) ( not ( = ?auto_464077 ?auto_464085 ) ) ( not ( = ?auto_464078 ?auto_464079 ) ) ( not ( = ?auto_464078 ?auto_464080 ) ) ( not ( = ?auto_464078 ?auto_464081 ) ) ( not ( = ?auto_464078 ?auto_464082 ) ) ( not ( = ?auto_464078 ?auto_464083 ) ) ( not ( = ?auto_464078 ?auto_464084 ) ) ( not ( = ?auto_464078 ?auto_464085 ) ) ( not ( = ?auto_464079 ?auto_464080 ) ) ( not ( = ?auto_464079 ?auto_464081 ) ) ( not ( = ?auto_464079 ?auto_464082 ) ) ( not ( = ?auto_464079 ?auto_464083 ) ) ( not ( = ?auto_464079 ?auto_464084 ) ) ( not ( = ?auto_464079 ?auto_464085 ) ) ( not ( = ?auto_464080 ?auto_464081 ) ) ( not ( = ?auto_464080 ?auto_464082 ) ) ( not ( = ?auto_464080 ?auto_464083 ) ) ( not ( = ?auto_464080 ?auto_464084 ) ) ( not ( = ?auto_464080 ?auto_464085 ) ) ( not ( = ?auto_464081 ?auto_464082 ) ) ( not ( = ?auto_464081 ?auto_464083 ) ) ( not ( = ?auto_464081 ?auto_464084 ) ) ( not ( = ?auto_464081 ?auto_464085 ) ) ( not ( = ?auto_464082 ?auto_464083 ) ) ( not ( = ?auto_464082 ?auto_464084 ) ) ( not ( = ?auto_464082 ?auto_464085 ) ) ( not ( = ?auto_464083 ?auto_464084 ) ) ( not ( = ?auto_464083 ?auto_464085 ) ) ( not ( = ?auto_464084 ?auto_464085 ) ) ( CLEAR ?auto_464082 ) ( ON ?auto_464083 ?auto_464084 ) ( CLEAR ?auto_464083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_464070 ?auto_464071 ?auto_464072 ?auto_464073 ?auto_464074 ?auto_464075 ?auto_464076 ?auto_464077 ?auto_464078 ?auto_464079 ?auto_464080 ?auto_464081 ?auto_464082 ?auto_464083 )
      ( MAKE-15PILE ?auto_464070 ?auto_464071 ?auto_464072 ?auto_464073 ?auto_464074 ?auto_464075 ?auto_464076 ?auto_464077 ?auto_464078 ?auto_464079 ?auto_464080 ?auto_464081 ?auto_464082 ?auto_464083 ?auto_464084 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464101 - BLOCK
      ?auto_464102 - BLOCK
      ?auto_464103 - BLOCK
      ?auto_464104 - BLOCK
      ?auto_464105 - BLOCK
      ?auto_464106 - BLOCK
      ?auto_464107 - BLOCK
      ?auto_464108 - BLOCK
      ?auto_464109 - BLOCK
      ?auto_464110 - BLOCK
      ?auto_464111 - BLOCK
      ?auto_464112 - BLOCK
      ?auto_464113 - BLOCK
      ?auto_464114 - BLOCK
      ?auto_464115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464115 ) ( ON-TABLE ?auto_464101 ) ( ON ?auto_464102 ?auto_464101 ) ( ON ?auto_464103 ?auto_464102 ) ( ON ?auto_464104 ?auto_464103 ) ( ON ?auto_464105 ?auto_464104 ) ( ON ?auto_464106 ?auto_464105 ) ( ON ?auto_464107 ?auto_464106 ) ( ON ?auto_464108 ?auto_464107 ) ( ON ?auto_464109 ?auto_464108 ) ( ON ?auto_464110 ?auto_464109 ) ( ON ?auto_464111 ?auto_464110 ) ( ON ?auto_464112 ?auto_464111 ) ( ON ?auto_464113 ?auto_464112 ) ( not ( = ?auto_464101 ?auto_464102 ) ) ( not ( = ?auto_464101 ?auto_464103 ) ) ( not ( = ?auto_464101 ?auto_464104 ) ) ( not ( = ?auto_464101 ?auto_464105 ) ) ( not ( = ?auto_464101 ?auto_464106 ) ) ( not ( = ?auto_464101 ?auto_464107 ) ) ( not ( = ?auto_464101 ?auto_464108 ) ) ( not ( = ?auto_464101 ?auto_464109 ) ) ( not ( = ?auto_464101 ?auto_464110 ) ) ( not ( = ?auto_464101 ?auto_464111 ) ) ( not ( = ?auto_464101 ?auto_464112 ) ) ( not ( = ?auto_464101 ?auto_464113 ) ) ( not ( = ?auto_464101 ?auto_464114 ) ) ( not ( = ?auto_464101 ?auto_464115 ) ) ( not ( = ?auto_464102 ?auto_464103 ) ) ( not ( = ?auto_464102 ?auto_464104 ) ) ( not ( = ?auto_464102 ?auto_464105 ) ) ( not ( = ?auto_464102 ?auto_464106 ) ) ( not ( = ?auto_464102 ?auto_464107 ) ) ( not ( = ?auto_464102 ?auto_464108 ) ) ( not ( = ?auto_464102 ?auto_464109 ) ) ( not ( = ?auto_464102 ?auto_464110 ) ) ( not ( = ?auto_464102 ?auto_464111 ) ) ( not ( = ?auto_464102 ?auto_464112 ) ) ( not ( = ?auto_464102 ?auto_464113 ) ) ( not ( = ?auto_464102 ?auto_464114 ) ) ( not ( = ?auto_464102 ?auto_464115 ) ) ( not ( = ?auto_464103 ?auto_464104 ) ) ( not ( = ?auto_464103 ?auto_464105 ) ) ( not ( = ?auto_464103 ?auto_464106 ) ) ( not ( = ?auto_464103 ?auto_464107 ) ) ( not ( = ?auto_464103 ?auto_464108 ) ) ( not ( = ?auto_464103 ?auto_464109 ) ) ( not ( = ?auto_464103 ?auto_464110 ) ) ( not ( = ?auto_464103 ?auto_464111 ) ) ( not ( = ?auto_464103 ?auto_464112 ) ) ( not ( = ?auto_464103 ?auto_464113 ) ) ( not ( = ?auto_464103 ?auto_464114 ) ) ( not ( = ?auto_464103 ?auto_464115 ) ) ( not ( = ?auto_464104 ?auto_464105 ) ) ( not ( = ?auto_464104 ?auto_464106 ) ) ( not ( = ?auto_464104 ?auto_464107 ) ) ( not ( = ?auto_464104 ?auto_464108 ) ) ( not ( = ?auto_464104 ?auto_464109 ) ) ( not ( = ?auto_464104 ?auto_464110 ) ) ( not ( = ?auto_464104 ?auto_464111 ) ) ( not ( = ?auto_464104 ?auto_464112 ) ) ( not ( = ?auto_464104 ?auto_464113 ) ) ( not ( = ?auto_464104 ?auto_464114 ) ) ( not ( = ?auto_464104 ?auto_464115 ) ) ( not ( = ?auto_464105 ?auto_464106 ) ) ( not ( = ?auto_464105 ?auto_464107 ) ) ( not ( = ?auto_464105 ?auto_464108 ) ) ( not ( = ?auto_464105 ?auto_464109 ) ) ( not ( = ?auto_464105 ?auto_464110 ) ) ( not ( = ?auto_464105 ?auto_464111 ) ) ( not ( = ?auto_464105 ?auto_464112 ) ) ( not ( = ?auto_464105 ?auto_464113 ) ) ( not ( = ?auto_464105 ?auto_464114 ) ) ( not ( = ?auto_464105 ?auto_464115 ) ) ( not ( = ?auto_464106 ?auto_464107 ) ) ( not ( = ?auto_464106 ?auto_464108 ) ) ( not ( = ?auto_464106 ?auto_464109 ) ) ( not ( = ?auto_464106 ?auto_464110 ) ) ( not ( = ?auto_464106 ?auto_464111 ) ) ( not ( = ?auto_464106 ?auto_464112 ) ) ( not ( = ?auto_464106 ?auto_464113 ) ) ( not ( = ?auto_464106 ?auto_464114 ) ) ( not ( = ?auto_464106 ?auto_464115 ) ) ( not ( = ?auto_464107 ?auto_464108 ) ) ( not ( = ?auto_464107 ?auto_464109 ) ) ( not ( = ?auto_464107 ?auto_464110 ) ) ( not ( = ?auto_464107 ?auto_464111 ) ) ( not ( = ?auto_464107 ?auto_464112 ) ) ( not ( = ?auto_464107 ?auto_464113 ) ) ( not ( = ?auto_464107 ?auto_464114 ) ) ( not ( = ?auto_464107 ?auto_464115 ) ) ( not ( = ?auto_464108 ?auto_464109 ) ) ( not ( = ?auto_464108 ?auto_464110 ) ) ( not ( = ?auto_464108 ?auto_464111 ) ) ( not ( = ?auto_464108 ?auto_464112 ) ) ( not ( = ?auto_464108 ?auto_464113 ) ) ( not ( = ?auto_464108 ?auto_464114 ) ) ( not ( = ?auto_464108 ?auto_464115 ) ) ( not ( = ?auto_464109 ?auto_464110 ) ) ( not ( = ?auto_464109 ?auto_464111 ) ) ( not ( = ?auto_464109 ?auto_464112 ) ) ( not ( = ?auto_464109 ?auto_464113 ) ) ( not ( = ?auto_464109 ?auto_464114 ) ) ( not ( = ?auto_464109 ?auto_464115 ) ) ( not ( = ?auto_464110 ?auto_464111 ) ) ( not ( = ?auto_464110 ?auto_464112 ) ) ( not ( = ?auto_464110 ?auto_464113 ) ) ( not ( = ?auto_464110 ?auto_464114 ) ) ( not ( = ?auto_464110 ?auto_464115 ) ) ( not ( = ?auto_464111 ?auto_464112 ) ) ( not ( = ?auto_464111 ?auto_464113 ) ) ( not ( = ?auto_464111 ?auto_464114 ) ) ( not ( = ?auto_464111 ?auto_464115 ) ) ( not ( = ?auto_464112 ?auto_464113 ) ) ( not ( = ?auto_464112 ?auto_464114 ) ) ( not ( = ?auto_464112 ?auto_464115 ) ) ( not ( = ?auto_464113 ?auto_464114 ) ) ( not ( = ?auto_464113 ?auto_464115 ) ) ( not ( = ?auto_464114 ?auto_464115 ) ) ( CLEAR ?auto_464113 ) ( ON ?auto_464114 ?auto_464115 ) ( CLEAR ?auto_464114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_464101 ?auto_464102 ?auto_464103 ?auto_464104 ?auto_464105 ?auto_464106 ?auto_464107 ?auto_464108 ?auto_464109 ?auto_464110 ?auto_464111 ?auto_464112 ?auto_464113 ?auto_464114 )
      ( MAKE-15PILE ?auto_464101 ?auto_464102 ?auto_464103 ?auto_464104 ?auto_464105 ?auto_464106 ?auto_464107 ?auto_464108 ?auto_464109 ?auto_464110 ?auto_464111 ?auto_464112 ?auto_464113 ?auto_464114 ?auto_464115 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464131 - BLOCK
      ?auto_464132 - BLOCK
      ?auto_464133 - BLOCK
      ?auto_464134 - BLOCK
      ?auto_464135 - BLOCK
      ?auto_464136 - BLOCK
      ?auto_464137 - BLOCK
      ?auto_464138 - BLOCK
      ?auto_464139 - BLOCK
      ?auto_464140 - BLOCK
      ?auto_464141 - BLOCK
      ?auto_464142 - BLOCK
      ?auto_464143 - BLOCK
      ?auto_464144 - BLOCK
      ?auto_464145 - BLOCK
    )
    :vars
    (
      ?auto_464146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464145 ?auto_464146 ) ( ON-TABLE ?auto_464131 ) ( ON ?auto_464132 ?auto_464131 ) ( ON ?auto_464133 ?auto_464132 ) ( ON ?auto_464134 ?auto_464133 ) ( ON ?auto_464135 ?auto_464134 ) ( ON ?auto_464136 ?auto_464135 ) ( ON ?auto_464137 ?auto_464136 ) ( ON ?auto_464138 ?auto_464137 ) ( ON ?auto_464139 ?auto_464138 ) ( ON ?auto_464140 ?auto_464139 ) ( ON ?auto_464141 ?auto_464140 ) ( ON ?auto_464142 ?auto_464141 ) ( not ( = ?auto_464131 ?auto_464132 ) ) ( not ( = ?auto_464131 ?auto_464133 ) ) ( not ( = ?auto_464131 ?auto_464134 ) ) ( not ( = ?auto_464131 ?auto_464135 ) ) ( not ( = ?auto_464131 ?auto_464136 ) ) ( not ( = ?auto_464131 ?auto_464137 ) ) ( not ( = ?auto_464131 ?auto_464138 ) ) ( not ( = ?auto_464131 ?auto_464139 ) ) ( not ( = ?auto_464131 ?auto_464140 ) ) ( not ( = ?auto_464131 ?auto_464141 ) ) ( not ( = ?auto_464131 ?auto_464142 ) ) ( not ( = ?auto_464131 ?auto_464143 ) ) ( not ( = ?auto_464131 ?auto_464144 ) ) ( not ( = ?auto_464131 ?auto_464145 ) ) ( not ( = ?auto_464131 ?auto_464146 ) ) ( not ( = ?auto_464132 ?auto_464133 ) ) ( not ( = ?auto_464132 ?auto_464134 ) ) ( not ( = ?auto_464132 ?auto_464135 ) ) ( not ( = ?auto_464132 ?auto_464136 ) ) ( not ( = ?auto_464132 ?auto_464137 ) ) ( not ( = ?auto_464132 ?auto_464138 ) ) ( not ( = ?auto_464132 ?auto_464139 ) ) ( not ( = ?auto_464132 ?auto_464140 ) ) ( not ( = ?auto_464132 ?auto_464141 ) ) ( not ( = ?auto_464132 ?auto_464142 ) ) ( not ( = ?auto_464132 ?auto_464143 ) ) ( not ( = ?auto_464132 ?auto_464144 ) ) ( not ( = ?auto_464132 ?auto_464145 ) ) ( not ( = ?auto_464132 ?auto_464146 ) ) ( not ( = ?auto_464133 ?auto_464134 ) ) ( not ( = ?auto_464133 ?auto_464135 ) ) ( not ( = ?auto_464133 ?auto_464136 ) ) ( not ( = ?auto_464133 ?auto_464137 ) ) ( not ( = ?auto_464133 ?auto_464138 ) ) ( not ( = ?auto_464133 ?auto_464139 ) ) ( not ( = ?auto_464133 ?auto_464140 ) ) ( not ( = ?auto_464133 ?auto_464141 ) ) ( not ( = ?auto_464133 ?auto_464142 ) ) ( not ( = ?auto_464133 ?auto_464143 ) ) ( not ( = ?auto_464133 ?auto_464144 ) ) ( not ( = ?auto_464133 ?auto_464145 ) ) ( not ( = ?auto_464133 ?auto_464146 ) ) ( not ( = ?auto_464134 ?auto_464135 ) ) ( not ( = ?auto_464134 ?auto_464136 ) ) ( not ( = ?auto_464134 ?auto_464137 ) ) ( not ( = ?auto_464134 ?auto_464138 ) ) ( not ( = ?auto_464134 ?auto_464139 ) ) ( not ( = ?auto_464134 ?auto_464140 ) ) ( not ( = ?auto_464134 ?auto_464141 ) ) ( not ( = ?auto_464134 ?auto_464142 ) ) ( not ( = ?auto_464134 ?auto_464143 ) ) ( not ( = ?auto_464134 ?auto_464144 ) ) ( not ( = ?auto_464134 ?auto_464145 ) ) ( not ( = ?auto_464134 ?auto_464146 ) ) ( not ( = ?auto_464135 ?auto_464136 ) ) ( not ( = ?auto_464135 ?auto_464137 ) ) ( not ( = ?auto_464135 ?auto_464138 ) ) ( not ( = ?auto_464135 ?auto_464139 ) ) ( not ( = ?auto_464135 ?auto_464140 ) ) ( not ( = ?auto_464135 ?auto_464141 ) ) ( not ( = ?auto_464135 ?auto_464142 ) ) ( not ( = ?auto_464135 ?auto_464143 ) ) ( not ( = ?auto_464135 ?auto_464144 ) ) ( not ( = ?auto_464135 ?auto_464145 ) ) ( not ( = ?auto_464135 ?auto_464146 ) ) ( not ( = ?auto_464136 ?auto_464137 ) ) ( not ( = ?auto_464136 ?auto_464138 ) ) ( not ( = ?auto_464136 ?auto_464139 ) ) ( not ( = ?auto_464136 ?auto_464140 ) ) ( not ( = ?auto_464136 ?auto_464141 ) ) ( not ( = ?auto_464136 ?auto_464142 ) ) ( not ( = ?auto_464136 ?auto_464143 ) ) ( not ( = ?auto_464136 ?auto_464144 ) ) ( not ( = ?auto_464136 ?auto_464145 ) ) ( not ( = ?auto_464136 ?auto_464146 ) ) ( not ( = ?auto_464137 ?auto_464138 ) ) ( not ( = ?auto_464137 ?auto_464139 ) ) ( not ( = ?auto_464137 ?auto_464140 ) ) ( not ( = ?auto_464137 ?auto_464141 ) ) ( not ( = ?auto_464137 ?auto_464142 ) ) ( not ( = ?auto_464137 ?auto_464143 ) ) ( not ( = ?auto_464137 ?auto_464144 ) ) ( not ( = ?auto_464137 ?auto_464145 ) ) ( not ( = ?auto_464137 ?auto_464146 ) ) ( not ( = ?auto_464138 ?auto_464139 ) ) ( not ( = ?auto_464138 ?auto_464140 ) ) ( not ( = ?auto_464138 ?auto_464141 ) ) ( not ( = ?auto_464138 ?auto_464142 ) ) ( not ( = ?auto_464138 ?auto_464143 ) ) ( not ( = ?auto_464138 ?auto_464144 ) ) ( not ( = ?auto_464138 ?auto_464145 ) ) ( not ( = ?auto_464138 ?auto_464146 ) ) ( not ( = ?auto_464139 ?auto_464140 ) ) ( not ( = ?auto_464139 ?auto_464141 ) ) ( not ( = ?auto_464139 ?auto_464142 ) ) ( not ( = ?auto_464139 ?auto_464143 ) ) ( not ( = ?auto_464139 ?auto_464144 ) ) ( not ( = ?auto_464139 ?auto_464145 ) ) ( not ( = ?auto_464139 ?auto_464146 ) ) ( not ( = ?auto_464140 ?auto_464141 ) ) ( not ( = ?auto_464140 ?auto_464142 ) ) ( not ( = ?auto_464140 ?auto_464143 ) ) ( not ( = ?auto_464140 ?auto_464144 ) ) ( not ( = ?auto_464140 ?auto_464145 ) ) ( not ( = ?auto_464140 ?auto_464146 ) ) ( not ( = ?auto_464141 ?auto_464142 ) ) ( not ( = ?auto_464141 ?auto_464143 ) ) ( not ( = ?auto_464141 ?auto_464144 ) ) ( not ( = ?auto_464141 ?auto_464145 ) ) ( not ( = ?auto_464141 ?auto_464146 ) ) ( not ( = ?auto_464142 ?auto_464143 ) ) ( not ( = ?auto_464142 ?auto_464144 ) ) ( not ( = ?auto_464142 ?auto_464145 ) ) ( not ( = ?auto_464142 ?auto_464146 ) ) ( not ( = ?auto_464143 ?auto_464144 ) ) ( not ( = ?auto_464143 ?auto_464145 ) ) ( not ( = ?auto_464143 ?auto_464146 ) ) ( not ( = ?auto_464144 ?auto_464145 ) ) ( not ( = ?auto_464144 ?auto_464146 ) ) ( not ( = ?auto_464145 ?auto_464146 ) ) ( ON ?auto_464144 ?auto_464145 ) ( CLEAR ?auto_464142 ) ( ON ?auto_464143 ?auto_464144 ) ( CLEAR ?auto_464143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_464131 ?auto_464132 ?auto_464133 ?auto_464134 ?auto_464135 ?auto_464136 ?auto_464137 ?auto_464138 ?auto_464139 ?auto_464140 ?auto_464141 ?auto_464142 ?auto_464143 )
      ( MAKE-15PILE ?auto_464131 ?auto_464132 ?auto_464133 ?auto_464134 ?auto_464135 ?auto_464136 ?auto_464137 ?auto_464138 ?auto_464139 ?auto_464140 ?auto_464141 ?auto_464142 ?auto_464143 ?auto_464144 ?auto_464145 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464162 - BLOCK
      ?auto_464163 - BLOCK
      ?auto_464164 - BLOCK
      ?auto_464165 - BLOCK
      ?auto_464166 - BLOCK
      ?auto_464167 - BLOCK
      ?auto_464168 - BLOCK
      ?auto_464169 - BLOCK
      ?auto_464170 - BLOCK
      ?auto_464171 - BLOCK
      ?auto_464172 - BLOCK
      ?auto_464173 - BLOCK
      ?auto_464174 - BLOCK
      ?auto_464175 - BLOCK
      ?auto_464176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464176 ) ( ON-TABLE ?auto_464162 ) ( ON ?auto_464163 ?auto_464162 ) ( ON ?auto_464164 ?auto_464163 ) ( ON ?auto_464165 ?auto_464164 ) ( ON ?auto_464166 ?auto_464165 ) ( ON ?auto_464167 ?auto_464166 ) ( ON ?auto_464168 ?auto_464167 ) ( ON ?auto_464169 ?auto_464168 ) ( ON ?auto_464170 ?auto_464169 ) ( ON ?auto_464171 ?auto_464170 ) ( ON ?auto_464172 ?auto_464171 ) ( ON ?auto_464173 ?auto_464172 ) ( not ( = ?auto_464162 ?auto_464163 ) ) ( not ( = ?auto_464162 ?auto_464164 ) ) ( not ( = ?auto_464162 ?auto_464165 ) ) ( not ( = ?auto_464162 ?auto_464166 ) ) ( not ( = ?auto_464162 ?auto_464167 ) ) ( not ( = ?auto_464162 ?auto_464168 ) ) ( not ( = ?auto_464162 ?auto_464169 ) ) ( not ( = ?auto_464162 ?auto_464170 ) ) ( not ( = ?auto_464162 ?auto_464171 ) ) ( not ( = ?auto_464162 ?auto_464172 ) ) ( not ( = ?auto_464162 ?auto_464173 ) ) ( not ( = ?auto_464162 ?auto_464174 ) ) ( not ( = ?auto_464162 ?auto_464175 ) ) ( not ( = ?auto_464162 ?auto_464176 ) ) ( not ( = ?auto_464163 ?auto_464164 ) ) ( not ( = ?auto_464163 ?auto_464165 ) ) ( not ( = ?auto_464163 ?auto_464166 ) ) ( not ( = ?auto_464163 ?auto_464167 ) ) ( not ( = ?auto_464163 ?auto_464168 ) ) ( not ( = ?auto_464163 ?auto_464169 ) ) ( not ( = ?auto_464163 ?auto_464170 ) ) ( not ( = ?auto_464163 ?auto_464171 ) ) ( not ( = ?auto_464163 ?auto_464172 ) ) ( not ( = ?auto_464163 ?auto_464173 ) ) ( not ( = ?auto_464163 ?auto_464174 ) ) ( not ( = ?auto_464163 ?auto_464175 ) ) ( not ( = ?auto_464163 ?auto_464176 ) ) ( not ( = ?auto_464164 ?auto_464165 ) ) ( not ( = ?auto_464164 ?auto_464166 ) ) ( not ( = ?auto_464164 ?auto_464167 ) ) ( not ( = ?auto_464164 ?auto_464168 ) ) ( not ( = ?auto_464164 ?auto_464169 ) ) ( not ( = ?auto_464164 ?auto_464170 ) ) ( not ( = ?auto_464164 ?auto_464171 ) ) ( not ( = ?auto_464164 ?auto_464172 ) ) ( not ( = ?auto_464164 ?auto_464173 ) ) ( not ( = ?auto_464164 ?auto_464174 ) ) ( not ( = ?auto_464164 ?auto_464175 ) ) ( not ( = ?auto_464164 ?auto_464176 ) ) ( not ( = ?auto_464165 ?auto_464166 ) ) ( not ( = ?auto_464165 ?auto_464167 ) ) ( not ( = ?auto_464165 ?auto_464168 ) ) ( not ( = ?auto_464165 ?auto_464169 ) ) ( not ( = ?auto_464165 ?auto_464170 ) ) ( not ( = ?auto_464165 ?auto_464171 ) ) ( not ( = ?auto_464165 ?auto_464172 ) ) ( not ( = ?auto_464165 ?auto_464173 ) ) ( not ( = ?auto_464165 ?auto_464174 ) ) ( not ( = ?auto_464165 ?auto_464175 ) ) ( not ( = ?auto_464165 ?auto_464176 ) ) ( not ( = ?auto_464166 ?auto_464167 ) ) ( not ( = ?auto_464166 ?auto_464168 ) ) ( not ( = ?auto_464166 ?auto_464169 ) ) ( not ( = ?auto_464166 ?auto_464170 ) ) ( not ( = ?auto_464166 ?auto_464171 ) ) ( not ( = ?auto_464166 ?auto_464172 ) ) ( not ( = ?auto_464166 ?auto_464173 ) ) ( not ( = ?auto_464166 ?auto_464174 ) ) ( not ( = ?auto_464166 ?auto_464175 ) ) ( not ( = ?auto_464166 ?auto_464176 ) ) ( not ( = ?auto_464167 ?auto_464168 ) ) ( not ( = ?auto_464167 ?auto_464169 ) ) ( not ( = ?auto_464167 ?auto_464170 ) ) ( not ( = ?auto_464167 ?auto_464171 ) ) ( not ( = ?auto_464167 ?auto_464172 ) ) ( not ( = ?auto_464167 ?auto_464173 ) ) ( not ( = ?auto_464167 ?auto_464174 ) ) ( not ( = ?auto_464167 ?auto_464175 ) ) ( not ( = ?auto_464167 ?auto_464176 ) ) ( not ( = ?auto_464168 ?auto_464169 ) ) ( not ( = ?auto_464168 ?auto_464170 ) ) ( not ( = ?auto_464168 ?auto_464171 ) ) ( not ( = ?auto_464168 ?auto_464172 ) ) ( not ( = ?auto_464168 ?auto_464173 ) ) ( not ( = ?auto_464168 ?auto_464174 ) ) ( not ( = ?auto_464168 ?auto_464175 ) ) ( not ( = ?auto_464168 ?auto_464176 ) ) ( not ( = ?auto_464169 ?auto_464170 ) ) ( not ( = ?auto_464169 ?auto_464171 ) ) ( not ( = ?auto_464169 ?auto_464172 ) ) ( not ( = ?auto_464169 ?auto_464173 ) ) ( not ( = ?auto_464169 ?auto_464174 ) ) ( not ( = ?auto_464169 ?auto_464175 ) ) ( not ( = ?auto_464169 ?auto_464176 ) ) ( not ( = ?auto_464170 ?auto_464171 ) ) ( not ( = ?auto_464170 ?auto_464172 ) ) ( not ( = ?auto_464170 ?auto_464173 ) ) ( not ( = ?auto_464170 ?auto_464174 ) ) ( not ( = ?auto_464170 ?auto_464175 ) ) ( not ( = ?auto_464170 ?auto_464176 ) ) ( not ( = ?auto_464171 ?auto_464172 ) ) ( not ( = ?auto_464171 ?auto_464173 ) ) ( not ( = ?auto_464171 ?auto_464174 ) ) ( not ( = ?auto_464171 ?auto_464175 ) ) ( not ( = ?auto_464171 ?auto_464176 ) ) ( not ( = ?auto_464172 ?auto_464173 ) ) ( not ( = ?auto_464172 ?auto_464174 ) ) ( not ( = ?auto_464172 ?auto_464175 ) ) ( not ( = ?auto_464172 ?auto_464176 ) ) ( not ( = ?auto_464173 ?auto_464174 ) ) ( not ( = ?auto_464173 ?auto_464175 ) ) ( not ( = ?auto_464173 ?auto_464176 ) ) ( not ( = ?auto_464174 ?auto_464175 ) ) ( not ( = ?auto_464174 ?auto_464176 ) ) ( not ( = ?auto_464175 ?auto_464176 ) ) ( ON ?auto_464175 ?auto_464176 ) ( CLEAR ?auto_464173 ) ( ON ?auto_464174 ?auto_464175 ) ( CLEAR ?auto_464174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_464162 ?auto_464163 ?auto_464164 ?auto_464165 ?auto_464166 ?auto_464167 ?auto_464168 ?auto_464169 ?auto_464170 ?auto_464171 ?auto_464172 ?auto_464173 ?auto_464174 )
      ( MAKE-15PILE ?auto_464162 ?auto_464163 ?auto_464164 ?auto_464165 ?auto_464166 ?auto_464167 ?auto_464168 ?auto_464169 ?auto_464170 ?auto_464171 ?auto_464172 ?auto_464173 ?auto_464174 ?auto_464175 ?auto_464176 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464192 - BLOCK
      ?auto_464193 - BLOCK
      ?auto_464194 - BLOCK
      ?auto_464195 - BLOCK
      ?auto_464196 - BLOCK
      ?auto_464197 - BLOCK
      ?auto_464198 - BLOCK
      ?auto_464199 - BLOCK
      ?auto_464200 - BLOCK
      ?auto_464201 - BLOCK
      ?auto_464202 - BLOCK
      ?auto_464203 - BLOCK
      ?auto_464204 - BLOCK
      ?auto_464205 - BLOCK
      ?auto_464206 - BLOCK
    )
    :vars
    (
      ?auto_464207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464206 ?auto_464207 ) ( ON-TABLE ?auto_464192 ) ( ON ?auto_464193 ?auto_464192 ) ( ON ?auto_464194 ?auto_464193 ) ( ON ?auto_464195 ?auto_464194 ) ( ON ?auto_464196 ?auto_464195 ) ( ON ?auto_464197 ?auto_464196 ) ( ON ?auto_464198 ?auto_464197 ) ( ON ?auto_464199 ?auto_464198 ) ( ON ?auto_464200 ?auto_464199 ) ( ON ?auto_464201 ?auto_464200 ) ( ON ?auto_464202 ?auto_464201 ) ( not ( = ?auto_464192 ?auto_464193 ) ) ( not ( = ?auto_464192 ?auto_464194 ) ) ( not ( = ?auto_464192 ?auto_464195 ) ) ( not ( = ?auto_464192 ?auto_464196 ) ) ( not ( = ?auto_464192 ?auto_464197 ) ) ( not ( = ?auto_464192 ?auto_464198 ) ) ( not ( = ?auto_464192 ?auto_464199 ) ) ( not ( = ?auto_464192 ?auto_464200 ) ) ( not ( = ?auto_464192 ?auto_464201 ) ) ( not ( = ?auto_464192 ?auto_464202 ) ) ( not ( = ?auto_464192 ?auto_464203 ) ) ( not ( = ?auto_464192 ?auto_464204 ) ) ( not ( = ?auto_464192 ?auto_464205 ) ) ( not ( = ?auto_464192 ?auto_464206 ) ) ( not ( = ?auto_464192 ?auto_464207 ) ) ( not ( = ?auto_464193 ?auto_464194 ) ) ( not ( = ?auto_464193 ?auto_464195 ) ) ( not ( = ?auto_464193 ?auto_464196 ) ) ( not ( = ?auto_464193 ?auto_464197 ) ) ( not ( = ?auto_464193 ?auto_464198 ) ) ( not ( = ?auto_464193 ?auto_464199 ) ) ( not ( = ?auto_464193 ?auto_464200 ) ) ( not ( = ?auto_464193 ?auto_464201 ) ) ( not ( = ?auto_464193 ?auto_464202 ) ) ( not ( = ?auto_464193 ?auto_464203 ) ) ( not ( = ?auto_464193 ?auto_464204 ) ) ( not ( = ?auto_464193 ?auto_464205 ) ) ( not ( = ?auto_464193 ?auto_464206 ) ) ( not ( = ?auto_464193 ?auto_464207 ) ) ( not ( = ?auto_464194 ?auto_464195 ) ) ( not ( = ?auto_464194 ?auto_464196 ) ) ( not ( = ?auto_464194 ?auto_464197 ) ) ( not ( = ?auto_464194 ?auto_464198 ) ) ( not ( = ?auto_464194 ?auto_464199 ) ) ( not ( = ?auto_464194 ?auto_464200 ) ) ( not ( = ?auto_464194 ?auto_464201 ) ) ( not ( = ?auto_464194 ?auto_464202 ) ) ( not ( = ?auto_464194 ?auto_464203 ) ) ( not ( = ?auto_464194 ?auto_464204 ) ) ( not ( = ?auto_464194 ?auto_464205 ) ) ( not ( = ?auto_464194 ?auto_464206 ) ) ( not ( = ?auto_464194 ?auto_464207 ) ) ( not ( = ?auto_464195 ?auto_464196 ) ) ( not ( = ?auto_464195 ?auto_464197 ) ) ( not ( = ?auto_464195 ?auto_464198 ) ) ( not ( = ?auto_464195 ?auto_464199 ) ) ( not ( = ?auto_464195 ?auto_464200 ) ) ( not ( = ?auto_464195 ?auto_464201 ) ) ( not ( = ?auto_464195 ?auto_464202 ) ) ( not ( = ?auto_464195 ?auto_464203 ) ) ( not ( = ?auto_464195 ?auto_464204 ) ) ( not ( = ?auto_464195 ?auto_464205 ) ) ( not ( = ?auto_464195 ?auto_464206 ) ) ( not ( = ?auto_464195 ?auto_464207 ) ) ( not ( = ?auto_464196 ?auto_464197 ) ) ( not ( = ?auto_464196 ?auto_464198 ) ) ( not ( = ?auto_464196 ?auto_464199 ) ) ( not ( = ?auto_464196 ?auto_464200 ) ) ( not ( = ?auto_464196 ?auto_464201 ) ) ( not ( = ?auto_464196 ?auto_464202 ) ) ( not ( = ?auto_464196 ?auto_464203 ) ) ( not ( = ?auto_464196 ?auto_464204 ) ) ( not ( = ?auto_464196 ?auto_464205 ) ) ( not ( = ?auto_464196 ?auto_464206 ) ) ( not ( = ?auto_464196 ?auto_464207 ) ) ( not ( = ?auto_464197 ?auto_464198 ) ) ( not ( = ?auto_464197 ?auto_464199 ) ) ( not ( = ?auto_464197 ?auto_464200 ) ) ( not ( = ?auto_464197 ?auto_464201 ) ) ( not ( = ?auto_464197 ?auto_464202 ) ) ( not ( = ?auto_464197 ?auto_464203 ) ) ( not ( = ?auto_464197 ?auto_464204 ) ) ( not ( = ?auto_464197 ?auto_464205 ) ) ( not ( = ?auto_464197 ?auto_464206 ) ) ( not ( = ?auto_464197 ?auto_464207 ) ) ( not ( = ?auto_464198 ?auto_464199 ) ) ( not ( = ?auto_464198 ?auto_464200 ) ) ( not ( = ?auto_464198 ?auto_464201 ) ) ( not ( = ?auto_464198 ?auto_464202 ) ) ( not ( = ?auto_464198 ?auto_464203 ) ) ( not ( = ?auto_464198 ?auto_464204 ) ) ( not ( = ?auto_464198 ?auto_464205 ) ) ( not ( = ?auto_464198 ?auto_464206 ) ) ( not ( = ?auto_464198 ?auto_464207 ) ) ( not ( = ?auto_464199 ?auto_464200 ) ) ( not ( = ?auto_464199 ?auto_464201 ) ) ( not ( = ?auto_464199 ?auto_464202 ) ) ( not ( = ?auto_464199 ?auto_464203 ) ) ( not ( = ?auto_464199 ?auto_464204 ) ) ( not ( = ?auto_464199 ?auto_464205 ) ) ( not ( = ?auto_464199 ?auto_464206 ) ) ( not ( = ?auto_464199 ?auto_464207 ) ) ( not ( = ?auto_464200 ?auto_464201 ) ) ( not ( = ?auto_464200 ?auto_464202 ) ) ( not ( = ?auto_464200 ?auto_464203 ) ) ( not ( = ?auto_464200 ?auto_464204 ) ) ( not ( = ?auto_464200 ?auto_464205 ) ) ( not ( = ?auto_464200 ?auto_464206 ) ) ( not ( = ?auto_464200 ?auto_464207 ) ) ( not ( = ?auto_464201 ?auto_464202 ) ) ( not ( = ?auto_464201 ?auto_464203 ) ) ( not ( = ?auto_464201 ?auto_464204 ) ) ( not ( = ?auto_464201 ?auto_464205 ) ) ( not ( = ?auto_464201 ?auto_464206 ) ) ( not ( = ?auto_464201 ?auto_464207 ) ) ( not ( = ?auto_464202 ?auto_464203 ) ) ( not ( = ?auto_464202 ?auto_464204 ) ) ( not ( = ?auto_464202 ?auto_464205 ) ) ( not ( = ?auto_464202 ?auto_464206 ) ) ( not ( = ?auto_464202 ?auto_464207 ) ) ( not ( = ?auto_464203 ?auto_464204 ) ) ( not ( = ?auto_464203 ?auto_464205 ) ) ( not ( = ?auto_464203 ?auto_464206 ) ) ( not ( = ?auto_464203 ?auto_464207 ) ) ( not ( = ?auto_464204 ?auto_464205 ) ) ( not ( = ?auto_464204 ?auto_464206 ) ) ( not ( = ?auto_464204 ?auto_464207 ) ) ( not ( = ?auto_464205 ?auto_464206 ) ) ( not ( = ?auto_464205 ?auto_464207 ) ) ( not ( = ?auto_464206 ?auto_464207 ) ) ( ON ?auto_464205 ?auto_464206 ) ( ON ?auto_464204 ?auto_464205 ) ( CLEAR ?auto_464202 ) ( ON ?auto_464203 ?auto_464204 ) ( CLEAR ?auto_464203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_464192 ?auto_464193 ?auto_464194 ?auto_464195 ?auto_464196 ?auto_464197 ?auto_464198 ?auto_464199 ?auto_464200 ?auto_464201 ?auto_464202 ?auto_464203 )
      ( MAKE-15PILE ?auto_464192 ?auto_464193 ?auto_464194 ?auto_464195 ?auto_464196 ?auto_464197 ?auto_464198 ?auto_464199 ?auto_464200 ?auto_464201 ?auto_464202 ?auto_464203 ?auto_464204 ?auto_464205 ?auto_464206 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464223 - BLOCK
      ?auto_464224 - BLOCK
      ?auto_464225 - BLOCK
      ?auto_464226 - BLOCK
      ?auto_464227 - BLOCK
      ?auto_464228 - BLOCK
      ?auto_464229 - BLOCK
      ?auto_464230 - BLOCK
      ?auto_464231 - BLOCK
      ?auto_464232 - BLOCK
      ?auto_464233 - BLOCK
      ?auto_464234 - BLOCK
      ?auto_464235 - BLOCK
      ?auto_464236 - BLOCK
      ?auto_464237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464237 ) ( ON-TABLE ?auto_464223 ) ( ON ?auto_464224 ?auto_464223 ) ( ON ?auto_464225 ?auto_464224 ) ( ON ?auto_464226 ?auto_464225 ) ( ON ?auto_464227 ?auto_464226 ) ( ON ?auto_464228 ?auto_464227 ) ( ON ?auto_464229 ?auto_464228 ) ( ON ?auto_464230 ?auto_464229 ) ( ON ?auto_464231 ?auto_464230 ) ( ON ?auto_464232 ?auto_464231 ) ( ON ?auto_464233 ?auto_464232 ) ( not ( = ?auto_464223 ?auto_464224 ) ) ( not ( = ?auto_464223 ?auto_464225 ) ) ( not ( = ?auto_464223 ?auto_464226 ) ) ( not ( = ?auto_464223 ?auto_464227 ) ) ( not ( = ?auto_464223 ?auto_464228 ) ) ( not ( = ?auto_464223 ?auto_464229 ) ) ( not ( = ?auto_464223 ?auto_464230 ) ) ( not ( = ?auto_464223 ?auto_464231 ) ) ( not ( = ?auto_464223 ?auto_464232 ) ) ( not ( = ?auto_464223 ?auto_464233 ) ) ( not ( = ?auto_464223 ?auto_464234 ) ) ( not ( = ?auto_464223 ?auto_464235 ) ) ( not ( = ?auto_464223 ?auto_464236 ) ) ( not ( = ?auto_464223 ?auto_464237 ) ) ( not ( = ?auto_464224 ?auto_464225 ) ) ( not ( = ?auto_464224 ?auto_464226 ) ) ( not ( = ?auto_464224 ?auto_464227 ) ) ( not ( = ?auto_464224 ?auto_464228 ) ) ( not ( = ?auto_464224 ?auto_464229 ) ) ( not ( = ?auto_464224 ?auto_464230 ) ) ( not ( = ?auto_464224 ?auto_464231 ) ) ( not ( = ?auto_464224 ?auto_464232 ) ) ( not ( = ?auto_464224 ?auto_464233 ) ) ( not ( = ?auto_464224 ?auto_464234 ) ) ( not ( = ?auto_464224 ?auto_464235 ) ) ( not ( = ?auto_464224 ?auto_464236 ) ) ( not ( = ?auto_464224 ?auto_464237 ) ) ( not ( = ?auto_464225 ?auto_464226 ) ) ( not ( = ?auto_464225 ?auto_464227 ) ) ( not ( = ?auto_464225 ?auto_464228 ) ) ( not ( = ?auto_464225 ?auto_464229 ) ) ( not ( = ?auto_464225 ?auto_464230 ) ) ( not ( = ?auto_464225 ?auto_464231 ) ) ( not ( = ?auto_464225 ?auto_464232 ) ) ( not ( = ?auto_464225 ?auto_464233 ) ) ( not ( = ?auto_464225 ?auto_464234 ) ) ( not ( = ?auto_464225 ?auto_464235 ) ) ( not ( = ?auto_464225 ?auto_464236 ) ) ( not ( = ?auto_464225 ?auto_464237 ) ) ( not ( = ?auto_464226 ?auto_464227 ) ) ( not ( = ?auto_464226 ?auto_464228 ) ) ( not ( = ?auto_464226 ?auto_464229 ) ) ( not ( = ?auto_464226 ?auto_464230 ) ) ( not ( = ?auto_464226 ?auto_464231 ) ) ( not ( = ?auto_464226 ?auto_464232 ) ) ( not ( = ?auto_464226 ?auto_464233 ) ) ( not ( = ?auto_464226 ?auto_464234 ) ) ( not ( = ?auto_464226 ?auto_464235 ) ) ( not ( = ?auto_464226 ?auto_464236 ) ) ( not ( = ?auto_464226 ?auto_464237 ) ) ( not ( = ?auto_464227 ?auto_464228 ) ) ( not ( = ?auto_464227 ?auto_464229 ) ) ( not ( = ?auto_464227 ?auto_464230 ) ) ( not ( = ?auto_464227 ?auto_464231 ) ) ( not ( = ?auto_464227 ?auto_464232 ) ) ( not ( = ?auto_464227 ?auto_464233 ) ) ( not ( = ?auto_464227 ?auto_464234 ) ) ( not ( = ?auto_464227 ?auto_464235 ) ) ( not ( = ?auto_464227 ?auto_464236 ) ) ( not ( = ?auto_464227 ?auto_464237 ) ) ( not ( = ?auto_464228 ?auto_464229 ) ) ( not ( = ?auto_464228 ?auto_464230 ) ) ( not ( = ?auto_464228 ?auto_464231 ) ) ( not ( = ?auto_464228 ?auto_464232 ) ) ( not ( = ?auto_464228 ?auto_464233 ) ) ( not ( = ?auto_464228 ?auto_464234 ) ) ( not ( = ?auto_464228 ?auto_464235 ) ) ( not ( = ?auto_464228 ?auto_464236 ) ) ( not ( = ?auto_464228 ?auto_464237 ) ) ( not ( = ?auto_464229 ?auto_464230 ) ) ( not ( = ?auto_464229 ?auto_464231 ) ) ( not ( = ?auto_464229 ?auto_464232 ) ) ( not ( = ?auto_464229 ?auto_464233 ) ) ( not ( = ?auto_464229 ?auto_464234 ) ) ( not ( = ?auto_464229 ?auto_464235 ) ) ( not ( = ?auto_464229 ?auto_464236 ) ) ( not ( = ?auto_464229 ?auto_464237 ) ) ( not ( = ?auto_464230 ?auto_464231 ) ) ( not ( = ?auto_464230 ?auto_464232 ) ) ( not ( = ?auto_464230 ?auto_464233 ) ) ( not ( = ?auto_464230 ?auto_464234 ) ) ( not ( = ?auto_464230 ?auto_464235 ) ) ( not ( = ?auto_464230 ?auto_464236 ) ) ( not ( = ?auto_464230 ?auto_464237 ) ) ( not ( = ?auto_464231 ?auto_464232 ) ) ( not ( = ?auto_464231 ?auto_464233 ) ) ( not ( = ?auto_464231 ?auto_464234 ) ) ( not ( = ?auto_464231 ?auto_464235 ) ) ( not ( = ?auto_464231 ?auto_464236 ) ) ( not ( = ?auto_464231 ?auto_464237 ) ) ( not ( = ?auto_464232 ?auto_464233 ) ) ( not ( = ?auto_464232 ?auto_464234 ) ) ( not ( = ?auto_464232 ?auto_464235 ) ) ( not ( = ?auto_464232 ?auto_464236 ) ) ( not ( = ?auto_464232 ?auto_464237 ) ) ( not ( = ?auto_464233 ?auto_464234 ) ) ( not ( = ?auto_464233 ?auto_464235 ) ) ( not ( = ?auto_464233 ?auto_464236 ) ) ( not ( = ?auto_464233 ?auto_464237 ) ) ( not ( = ?auto_464234 ?auto_464235 ) ) ( not ( = ?auto_464234 ?auto_464236 ) ) ( not ( = ?auto_464234 ?auto_464237 ) ) ( not ( = ?auto_464235 ?auto_464236 ) ) ( not ( = ?auto_464235 ?auto_464237 ) ) ( not ( = ?auto_464236 ?auto_464237 ) ) ( ON ?auto_464236 ?auto_464237 ) ( ON ?auto_464235 ?auto_464236 ) ( CLEAR ?auto_464233 ) ( ON ?auto_464234 ?auto_464235 ) ( CLEAR ?auto_464234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_464223 ?auto_464224 ?auto_464225 ?auto_464226 ?auto_464227 ?auto_464228 ?auto_464229 ?auto_464230 ?auto_464231 ?auto_464232 ?auto_464233 ?auto_464234 )
      ( MAKE-15PILE ?auto_464223 ?auto_464224 ?auto_464225 ?auto_464226 ?auto_464227 ?auto_464228 ?auto_464229 ?auto_464230 ?auto_464231 ?auto_464232 ?auto_464233 ?auto_464234 ?auto_464235 ?auto_464236 ?auto_464237 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464253 - BLOCK
      ?auto_464254 - BLOCK
      ?auto_464255 - BLOCK
      ?auto_464256 - BLOCK
      ?auto_464257 - BLOCK
      ?auto_464258 - BLOCK
      ?auto_464259 - BLOCK
      ?auto_464260 - BLOCK
      ?auto_464261 - BLOCK
      ?auto_464262 - BLOCK
      ?auto_464263 - BLOCK
      ?auto_464264 - BLOCK
      ?auto_464265 - BLOCK
      ?auto_464266 - BLOCK
      ?auto_464267 - BLOCK
    )
    :vars
    (
      ?auto_464268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464267 ?auto_464268 ) ( ON-TABLE ?auto_464253 ) ( ON ?auto_464254 ?auto_464253 ) ( ON ?auto_464255 ?auto_464254 ) ( ON ?auto_464256 ?auto_464255 ) ( ON ?auto_464257 ?auto_464256 ) ( ON ?auto_464258 ?auto_464257 ) ( ON ?auto_464259 ?auto_464258 ) ( ON ?auto_464260 ?auto_464259 ) ( ON ?auto_464261 ?auto_464260 ) ( ON ?auto_464262 ?auto_464261 ) ( not ( = ?auto_464253 ?auto_464254 ) ) ( not ( = ?auto_464253 ?auto_464255 ) ) ( not ( = ?auto_464253 ?auto_464256 ) ) ( not ( = ?auto_464253 ?auto_464257 ) ) ( not ( = ?auto_464253 ?auto_464258 ) ) ( not ( = ?auto_464253 ?auto_464259 ) ) ( not ( = ?auto_464253 ?auto_464260 ) ) ( not ( = ?auto_464253 ?auto_464261 ) ) ( not ( = ?auto_464253 ?auto_464262 ) ) ( not ( = ?auto_464253 ?auto_464263 ) ) ( not ( = ?auto_464253 ?auto_464264 ) ) ( not ( = ?auto_464253 ?auto_464265 ) ) ( not ( = ?auto_464253 ?auto_464266 ) ) ( not ( = ?auto_464253 ?auto_464267 ) ) ( not ( = ?auto_464253 ?auto_464268 ) ) ( not ( = ?auto_464254 ?auto_464255 ) ) ( not ( = ?auto_464254 ?auto_464256 ) ) ( not ( = ?auto_464254 ?auto_464257 ) ) ( not ( = ?auto_464254 ?auto_464258 ) ) ( not ( = ?auto_464254 ?auto_464259 ) ) ( not ( = ?auto_464254 ?auto_464260 ) ) ( not ( = ?auto_464254 ?auto_464261 ) ) ( not ( = ?auto_464254 ?auto_464262 ) ) ( not ( = ?auto_464254 ?auto_464263 ) ) ( not ( = ?auto_464254 ?auto_464264 ) ) ( not ( = ?auto_464254 ?auto_464265 ) ) ( not ( = ?auto_464254 ?auto_464266 ) ) ( not ( = ?auto_464254 ?auto_464267 ) ) ( not ( = ?auto_464254 ?auto_464268 ) ) ( not ( = ?auto_464255 ?auto_464256 ) ) ( not ( = ?auto_464255 ?auto_464257 ) ) ( not ( = ?auto_464255 ?auto_464258 ) ) ( not ( = ?auto_464255 ?auto_464259 ) ) ( not ( = ?auto_464255 ?auto_464260 ) ) ( not ( = ?auto_464255 ?auto_464261 ) ) ( not ( = ?auto_464255 ?auto_464262 ) ) ( not ( = ?auto_464255 ?auto_464263 ) ) ( not ( = ?auto_464255 ?auto_464264 ) ) ( not ( = ?auto_464255 ?auto_464265 ) ) ( not ( = ?auto_464255 ?auto_464266 ) ) ( not ( = ?auto_464255 ?auto_464267 ) ) ( not ( = ?auto_464255 ?auto_464268 ) ) ( not ( = ?auto_464256 ?auto_464257 ) ) ( not ( = ?auto_464256 ?auto_464258 ) ) ( not ( = ?auto_464256 ?auto_464259 ) ) ( not ( = ?auto_464256 ?auto_464260 ) ) ( not ( = ?auto_464256 ?auto_464261 ) ) ( not ( = ?auto_464256 ?auto_464262 ) ) ( not ( = ?auto_464256 ?auto_464263 ) ) ( not ( = ?auto_464256 ?auto_464264 ) ) ( not ( = ?auto_464256 ?auto_464265 ) ) ( not ( = ?auto_464256 ?auto_464266 ) ) ( not ( = ?auto_464256 ?auto_464267 ) ) ( not ( = ?auto_464256 ?auto_464268 ) ) ( not ( = ?auto_464257 ?auto_464258 ) ) ( not ( = ?auto_464257 ?auto_464259 ) ) ( not ( = ?auto_464257 ?auto_464260 ) ) ( not ( = ?auto_464257 ?auto_464261 ) ) ( not ( = ?auto_464257 ?auto_464262 ) ) ( not ( = ?auto_464257 ?auto_464263 ) ) ( not ( = ?auto_464257 ?auto_464264 ) ) ( not ( = ?auto_464257 ?auto_464265 ) ) ( not ( = ?auto_464257 ?auto_464266 ) ) ( not ( = ?auto_464257 ?auto_464267 ) ) ( not ( = ?auto_464257 ?auto_464268 ) ) ( not ( = ?auto_464258 ?auto_464259 ) ) ( not ( = ?auto_464258 ?auto_464260 ) ) ( not ( = ?auto_464258 ?auto_464261 ) ) ( not ( = ?auto_464258 ?auto_464262 ) ) ( not ( = ?auto_464258 ?auto_464263 ) ) ( not ( = ?auto_464258 ?auto_464264 ) ) ( not ( = ?auto_464258 ?auto_464265 ) ) ( not ( = ?auto_464258 ?auto_464266 ) ) ( not ( = ?auto_464258 ?auto_464267 ) ) ( not ( = ?auto_464258 ?auto_464268 ) ) ( not ( = ?auto_464259 ?auto_464260 ) ) ( not ( = ?auto_464259 ?auto_464261 ) ) ( not ( = ?auto_464259 ?auto_464262 ) ) ( not ( = ?auto_464259 ?auto_464263 ) ) ( not ( = ?auto_464259 ?auto_464264 ) ) ( not ( = ?auto_464259 ?auto_464265 ) ) ( not ( = ?auto_464259 ?auto_464266 ) ) ( not ( = ?auto_464259 ?auto_464267 ) ) ( not ( = ?auto_464259 ?auto_464268 ) ) ( not ( = ?auto_464260 ?auto_464261 ) ) ( not ( = ?auto_464260 ?auto_464262 ) ) ( not ( = ?auto_464260 ?auto_464263 ) ) ( not ( = ?auto_464260 ?auto_464264 ) ) ( not ( = ?auto_464260 ?auto_464265 ) ) ( not ( = ?auto_464260 ?auto_464266 ) ) ( not ( = ?auto_464260 ?auto_464267 ) ) ( not ( = ?auto_464260 ?auto_464268 ) ) ( not ( = ?auto_464261 ?auto_464262 ) ) ( not ( = ?auto_464261 ?auto_464263 ) ) ( not ( = ?auto_464261 ?auto_464264 ) ) ( not ( = ?auto_464261 ?auto_464265 ) ) ( not ( = ?auto_464261 ?auto_464266 ) ) ( not ( = ?auto_464261 ?auto_464267 ) ) ( not ( = ?auto_464261 ?auto_464268 ) ) ( not ( = ?auto_464262 ?auto_464263 ) ) ( not ( = ?auto_464262 ?auto_464264 ) ) ( not ( = ?auto_464262 ?auto_464265 ) ) ( not ( = ?auto_464262 ?auto_464266 ) ) ( not ( = ?auto_464262 ?auto_464267 ) ) ( not ( = ?auto_464262 ?auto_464268 ) ) ( not ( = ?auto_464263 ?auto_464264 ) ) ( not ( = ?auto_464263 ?auto_464265 ) ) ( not ( = ?auto_464263 ?auto_464266 ) ) ( not ( = ?auto_464263 ?auto_464267 ) ) ( not ( = ?auto_464263 ?auto_464268 ) ) ( not ( = ?auto_464264 ?auto_464265 ) ) ( not ( = ?auto_464264 ?auto_464266 ) ) ( not ( = ?auto_464264 ?auto_464267 ) ) ( not ( = ?auto_464264 ?auto_464268 ) ) ( not ( = ?auto_464265 ?auto_464266 ) ) ( not ( = ?auto_464265 ?auto_464267 ) ) ( not ( = ?auto_464265 ?auto_464268 ) ) ( not ( = ?auto_464266 ?auto_464267 ) ) ( not ( = ?auto_464266 ?auto_464268 ) ) ( not ( = ?auto_464267 ?auto_464268 ) ) ( ON ?auto_464266 ?auto_464267 ) ( ON ?auto_464265 ?auto_464266 ) ( ON ?auto_464264 ?auto_464265 ) ( CLEAR ?auto_464262 ) ( ON ?auto_464263 ?auto_464264 ) ( CLEAR ?auto_464263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_464253 ?auto_464254 ?auto_464255 ?auto_464256 ?auto_464257 ?auto_464258 ?auto_464259 ?auto_464260 ?auto_464261 ?auto_464262 ?auto_464263 )
      ( MAKE-15PILE ?auto_464253 ?auto_464254 ?auto_464255 ?auto_464256 ?auto_464257 ?auto_464258 ?auto_464259 ?auto_464260 ?auto_464261 ?auto_464262 ?auto_464263 ?auto_464264 ?auto_464265 ?auto_464266 ?auto_464267 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464284 - BLOCK
      ?auto_464285 - BLOCK
      ?auto_464286 - BLOCK
      ?auto_464287 - BLOCK
      ?auto_464288 - BLOCK
      ?auto_464289 - BLOCK
      ?auto_464290 - BLOCK
      ?auto_464291 - BLOCK
      ?auto_464292 - BLOCK
      ?auto_464293 - BLOCK
      ?auto_464294 - BLOCK
      ?auto_464295 - BLOCK
      ?auto_464296 - BLOCK
      ?auto_464297 - BLOCK
      ?auto_464298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464298 ) ( ON-TABLE ?auto_464284 ) ( ON ?auto_464285 ?auto_464284 ) ( ON ?auto_464286 ?auto_464285 ) ( ON ?auto_464287 ?auto_464286 ) ( ON ?auto_464288 ?auto_464287 ) ( ON ?auto_464289 ?auto_464288 ) ( ON ?auto_464290 ?auto_464289 ) ( ON ?auto_464291 ?auto_464290 ) ( ON ?auto_464292 ?auto_464291 ) ( ON ?auto_464293 ?auto_464292 ) ( not ( = ?auto_464284 ?auto_464285 ) ) ( not ( = ?auto_464284 ?auto_464286 ) ) ( not ( = ?auto_464284 ?auto_464287 ) ) ( not ( = ?auto_464284 ?auto_464288 ) ) ( not ( = ?auto_464284 ?auto_464289 ) ) ( not ( = ?auto_464284 ?auto_464290 ) ) ( not ( = ?auto_464284 ?auto_464291 ) ) ( not ( = ?auto_464284 ?auto_464292 ) ) ( not ( = ?auto_464284 ?auto_464293 ) ) ( not ( = ?auto_464284 ?auto_464294 ) ) ( not ( = ?auto_464284 ?auto_464295 ) ) ( not ( = ?auto_464284 ?auto_464296 ) ) ( not ( = ?auto_464284 ?auto_464297 ) ) ( not ( = ?auto_464284 ?auto_464298 ) ) ( not ( = ?auto_464285 ?auto_464286 ) ) ( not ( = ?auto_464285 ?auto_464287 ) ) ( not ( = ?auto_464285 ?auto_464288 ) ) ( not ( = ?auto_464285 ?auto_464289 ) ) ( not ( = ?auto_464285 ?auto_464290 ) ) ( not ( = ?auto_464285 ?auto_464291 ) ) ( not ( = ?auto_464285 ?auto_464292 ) ) ( not ( = ?auto_464285 ?auto_464293 ) ) ( not ( = ?auto_464285 ?auto_464294 ) ) ( not ( = ?auto_464285 ?auto_464295 ) ) ( not ( = ?auto_464285 ?auto_464296 ) ) ( not ( = ?auto_464285 ?auto_464297 ) ) ( not ( = ?auto_464285 ?auto_464298 ) ) ( not ( = ?auto_464286 ?auto_464287 ) ) ( not ( = ?auto_464286 ?auto_464288 ) ) ( not ( = ?auto_464286 ?auto_464289 ) ) ( not ( = ?auto_464286 ?auto_464290 ) ) ( not ( = ?auto_464286 ?auto_464291 ) ) ( not ( = ?auto_464286 ?auto_464292 ) ) ( not ( = ?auto_464286 ?auto_464293 ) ) ( not ( = ?auto_464286 ?auto_464294 ) ) ( not ( = ?auto_464286 ?auto_464295 ) ) ( not ( = ?auto_464286 ?auto_464296 ) ) ( not ( = ?auto_464286 ?auto_464297 ) ) ( not ( = ?auto_464286 ?auto_464298 ) ) ( not ( = ?auto_464287 ?auto_464288 ) ) ( not ( = ?auto_464287 ?auto_464289 ) ) ( not ( = ?auto_464287 ?auto_464290 ) ) ( not ( = ?auto_464287 ?auto_464291 ) ) ( not ( = ?auto_464287 ?auto_464292 ) ) ( not ( = ?auto_464287 ?auto_464293 ) ) ( not ( = ?auto_464287 ?auto_464294 ) ) ( not ( = ?auto_464287 ?auto_464295 ) ) ( not ( = ?auto_464287 ?auto_464296 ) ) ( not ( = ?auto_464287 ?auto_464297 ) ) ( not ( = ?auto_464287 ?auto_464298 ) ) ( not ( = ?auto_464288 ?auto_464289 ) ) ( not ( = ?auto_464288 ?auto_464290 ) ) ( not ( = ?auto_464288 ?auto_464291 ) ) ( not ( = ?auto_464288 ?auto_464292 ) ) ( not ( = ?auto_464288 ?auto_464293 ) ) ( not ( = ?auto_464288 ?auto_464294 ) ) ( not ( = ?auto_464288 ?auto_464295 ) ) ( not ( = ?auto_464288 ?auto_464296 ) ) ( not ( = ?auto_464288 ?auto_464297 ) ) ( not ( = ?auto_464288 ?auto_464298 ) ) ( not ( = ?auto_464289 ?auto_464290 ) ) ( not ( = ?auto_464289 ?auto_464291 ) ) ( not ( = ?auto_464289 ?auto_464292 ) ) ( not ( = ?auto_464289 ?auto_464293 ) ) ( not ( = ?auto_464289 ?auto_464294 ) ) ( not ( = ?auto_464289 ?auto_464295 ) ) ( not ( = ?auto_464289 ?auto_464296 ) ) ( not ( = ?auto_464289 ?auto_464297 ) ) ( not ( = ?auto_464289 ?auto_464298 ) ) ( not ( = ?auto_464290 ?auto_464291 ) ) ( not ( = ?auto_464290 ?auto_464292 ) ) ( not ( = ?auto_464290 ?auto_464293 ) ) ( not ( = ?auto_464290 ?auto_464294 ) ) ( not ( = ?auto_464290 ?auto_464295 ) ) ( not ( = ?auto_464290 ?auto_464296 ) ) ( not ( = ?auto_464290 ?auto_464297 ) ) ( not ( = ?auto_464290 ?auto_464298 ) ) ( not ( = ?auto_464291 ?auto_464292 ) ) ( not ( = ?auto_464291 ?auto_464293 ) ) ( not ( = ?auto_464291 ?auto_464294 ) ) ( not ( = ?auto_464291 ?auto_464295 ) ) ( not ( = ?auto_464291 ?auto_464296 ) ) ( not ( = ?auto_464291 ?auto_464297 ) ) ( not ( = ?auto_464291 ?auto_464298 ) ) ( not ( = ?auto_464292 ?auto_464293 ) ) ( not ( = ?auto_464292 ?auto_464294 ) ) ( not ( = ?auto_464292 ?auto_464295 ) ) ( not ( = ?auto_464292 ?auto_464296 ) ) ( not ( = ?auto_464292 ?auto_464297 ) ) ( not ( = ?auto_464292 ?auto_464298 ) ) ( not ( = ?auto_464293 ?auto_464294 ) ) ( not ( = ?auto_464293 ?auto_464295 ) ) ( not ( = ?auto_464293 ?auto_464296 ) ) ( not ( = ?auto_464293 ?auto_464297 ) ) ( not ( = ?auto_464293 ?auto_464298 ) ) ( not ( = ?auto_464294 ?auto_464295 ) ) ( not ( = ?auto_464294 ?auto_464296 ) ) ( not ( = ?auto_464294 ?auto_464297 ) ) ( not ( = ?auto_464294 ?auto_464298 ) ) ( not ( = ?auto_464295 ?auto_464296 ) ) ( not ( = ?auto_464295 ?auto_464297 ) ) ( not ( = ?auto_464295 ?auto_464298 ) ) ( not ( = ?auto_464296 ?auto_464297 ) ) ( not ( = ?auto_464296 ?auto_464298 ) ) ( not ( = ?auto_464297 ?auto_464298 ) ) ( ON ?auto_464297 ?auto_464298 ) ( ON ?auto_464296 ?auto_464297 ) ( ON ?auto_464295 ?auto_464296 ) ( CLEAR ?auto_464293 ) ( ON ?auto_464294 ?auto_464295 ) ( CLEAR ?auto_464294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_464284 ?auto_464285 ?auto_464286 ?auto_464287 ?auto_464288 ?auto_464289 ?auto_464290 ?auto_464291 ?auto_464292 ?auto_464293 ?auto_464294 )
      ( MAKE-15PILE ?auto_464284 ?auto_464285 ?auto_464286 ?auto_464287 ?auto_464288 ?auto_464289 ?auto_464290 ?auto_464291 ?auto_464292 ?auto_464293 ?auto_464294 ?auto_464295 ?auto_464296 ?auto_464297 ?auto_464298 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464314 - BLOCK
      ?auto_464315 - BLOCK
      ?auto_464316 - BLOCK
      ?auto_464317 - BLOCK
      ?auto_464318 - BLOCK
      ?auto_464319 - BLOCK
      ?auto_464320 - BLOCK
      ?auto_464321 - BLOCK
      ?auto_464322 - BLOCK
      ?auto_464323 - BLOCK
      ?auto_464324 - BLOCK
      ?auto_464325 - BLOCK
      ?auto_464326 - BLOCK
      ?auto_464327 - BLOCK
      ?auto_464328 - BLOCK
    )
    :vars
    (
      ?auto_464329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464328 ?auto_464329 ) ( ON-TABLE ?auto_464314 ) ( ON ?auto_464315 ?auto_464314 ) ( ON ?auto_464316 ?auto_464315 ) ( ON ?auto_464317 ?auto_464316 ) ( ON ?auto_464318 ?auto_464317 ) ( ON ?auto_464319 ?auto_464318 ) ( ON ?auto_464320 ?auto_464319 ) ( ON ?auto_464321 ?auto_464320 ) ( ON ?auto_464322 ?auto_464321 ) ( not ( = ?auto_464314 ?auto_464315 ) ) ( not ( = ?auto_464314 ?auto_464316 ) ) ( not ( = ?auto_464314 ?auto_464317 ) ) ( not ( = ?auto_464314 ?auto_464318 ) ) ( not ( = ?auto_464314 ?auto_464319 ) ) ( not ( = ?auto_464314 ?auto_464320 ) ) ( not ( = ?auto_464314 ?auto_464321 ) ) ( not ( = ?auto_464314 ?auto_464322 ) ) ( not ( = ?auto_464314 ?auto_464323 ) ) ( not ( = ?auto_464314 ?auto_464324 ) ) ( not ( = ?auto_464314 ?auto_464325 ) ) ( not ( = ?auto_464314 ?auto_464326 ) ) ( not ( = ?auto_464314 ?auto_464327 ) ) ( not ( = ?auto_464314 ?auto_464328 ) ) ( not ( = ?auto_464314 ?auto_464329 ) ) ( not ( = ?auto_464315 ?auto_464316 ) ) ( not ( = ?auto_464315 ?auto_464317 ) ) ( not ( = ?auto_464315 ?auto_464318 ) ) ( not ( = ?auto_464315 ?auto_464319 ) ) ( not ( = ?auto_464315 ?auto_464320 ) ) ( not ( = ?auto_464315 ?auto_464321 ) ) ( not ( = ?auto_464315 ?auto_464322 ) ) ( not ( = ?auto_464315 ?auto_464323 ) ) ( not ( = ?auto_464315 ?auto_464324 ) ) ( not ( = ?auto_464315 ?auto_464325 ) ) ( not ( = ?auto_464315 ?auto_464326 ) ) ( not ( = ?auto_464315 ?auto_464327 ) ) ( not ( = ?auto_464315 ?auto_464328 ) ) ( not ( = ?auto_464315 ?auto_464329 ) ) ( not ( = ?auto_464316 ?auto_464317 ) ) ( not ( = ?auto_464316 ?auto_464318 ) ) ( not ( = ?auto_464316 ?auto_464319 ) ) ( not ( = ?auto_464316 ?auto_464320 ) ) ( not ( = ?auto_464316 ?auto_464321 ) ) ( not ( = ?auto_464316 ?auto_464322 ) ) ( not ( = ?auto_464316 ?auto_464323 ) ) ( not ( = ?auto_464316 ?auto_464324 ) ) ( not ( = ?auto_464316 ?auto_464325 ) ) ( not ( = ?auto_464316 ?auto_464326 ) ) ( not ( = ?auto_464316 ?auto_464327 ) ) ( not ( = ?auto_464316 ?auto_464328 ) ) ( not ( = ?auto_464316 ?auto_464329 ) ) ( not ( = ?auto_464317 ?auto_464318 ) ) ( not ( = ?auto_464317 ?auto_464319 ) ) ( not ( = ?auto_464317 ?auto_464320 ) ) ( not ( = ?auto_464317 ?auto_464321 ) ) ( not ( = ?auto_464317 ?auto_464322 ) ) ( not ( = ?auto_464317 ?auto_464323 ) ) ( not ( = ?auto_464317 ?auto_464324 ) ) ( not ( = ?auto_464317 ?auto_464325 ) ) ( not ( = ?auto_464317 ?auto_464326 ) ) ( not ( = ?auto_464317 ?auto_464327 ) ) ( not ( = ?auto_464317 ?auto_464328 ) ) ( not ( = ?auto_464317 ?auto_464329 ) ) ( not ( = ?auto_464318 ?auto_464319 ) ) ( not ( = ?auto_464318 ?auto_464320 ) ) ( not ( = ?auto_464318 ?auto_464321 ) ) ( not ( = ?auto_464318 ?auto_464322 ) ) ( not ( = ?auto_464318 ?auto_464323 ) ) ( not ( = ?auto_464318 ?auto_464324 ) ) ( not ( = ?auto_464318 ?auto_464325 ) ) ( not ( = ?auto_464318 ?auto_464326 ) ) ( not ( = ?auto_464318 ?auto_464327 ) ) ( not ( = ?auto_464318 ?auto_464328 ) ) ( not ( = ?auto_464318 ?auto_464329 ) ) ( not ( = ?auto_464319 ?auto_464320 ) ) ( not ( = ?auto_464319 ?auto_464321 ) ) ( not ( = ?auto_464319 ?auto_464322 ) ) ( not ( = ?auto_464319 ?auto_464323 ) ) ( not ( = ?auto_464319 ?auto_464324 ) ) ( not ( = ?auto_464319 ?auto_464325 ) ) ( not ( = ?auto_464319 ?auto_464326 ) ) ( not ( = ?auto_464319 ?auto_464327 ) ) ( not ( = ?auto_464319 ?auto_464328 ) ) ( not ( = ?auto_464319 ?auto_464329 ) ) ( not ( = ?auto_464320 ?auto_464321 ) ) ( not ( = ?auto_464320 ?auto_464322 ) ) ( not ( = ?auto_464320 ?auto_464323 ) ) ( not ( = ?auto_464320 ?auto_464324 ) ) ( not ( = ?auto_464320 ?auto_464325 ) ) ( not ( = ?auto_464320 ?auto_464326 ) ) ( not ( = ?auto_464320 ?auto_464327 ) ) ( not ( = ?auto_464320 ?auto_464328 ) ) ( not ( = ?auto_464320 ?auto_464329 ) ) ( not ( = ?auto_464321 ?auto_464322 ) ) ( not ( = ?auto_464321 ?auto_464323 ) ) ( not ( = ?auto_464321 ?auto_464324 ) ) ( not ( = ?auto_464321 ?auto_464325 ) ) ( not ( = ?auto_464321 ?auto_464326 ) ) ( not ( = ?auto_464321 ?auto_464327 ) ) ( not ( = ?auto_464321 ?auto_464328 ) ) ( not ( = ?auto_464321 ?auto_464329 ) ) ( not ( = ?auto_464322 ?auto_464323 ) ) ( not ( = ?auto_464322 ?auto_464324 ) ) ( not ( = ?auto_464322 ?auto_464325 ) ) ( not ( = ?auto_464322 ?auto_464326 ) ) ( not ( = ?auto_464322 ?auto_464327 ) ) ( not ( = ?auto_464322 ?auto_464328 ) ) ( not ( = ?auto_464322 ?auto_464329 ) ) ( not ( = ?auto_464323 ?auto_464324 ) ) ( not ( = ?auto_464323 ?auto_464325 ) ) ( not ( = ?auto_464323 ?auto_464326 ) ) ( not ( = ?auto_464323 ?auto_464327 ) ) ( not ( = ?auto_464323 ?auto_464328 ) ) ( not ( = ?auto_464323 ?auto_464329 ) ) ( not ( = ?auto_464324 ?auto_464325 ) ) ( not ( = ?auto_464324 ?auto_464326 ) ) ( not ( = ?auto_464324 ?auto_464327 ) ) ( not ( = ?auto_464324 ?auto_464328 ) ) ( not ( = ?auto_464324 ?auto_464329 ) ) ( not ( = ?auto_464325 ?auto_464326 ) ) ( not ( = ?auto_464325 ?auto_464327 ) ) ( not ( = ?auto_464325 ?auto_464328 ) ) ( not ( = ?auto_464325 ?auto_464329 ) ) ( not ( = ?auto_464326 ?auto_464327 ) ) ( not ( = ?auto_464326 ?auto_464328 ) ) ( not ( = ?auto_464326 ?auto_464329 ) ) ( not ( = ?auto_464327 ?auto_464328 ) ) ( not ( = ?auto_464327 ?auto_464329 ) ) ( not ( = ?auto_464328 ?auto_464329 ) ) ( ON ?auto_464327 ?auto_464328 ) ( ON ?auto_464326 ?auto_464327 ) ( ON ?auto_464325 ?auto_464326 ) ( ON ?auto_464324 ?auto_464325 ) ( CLEAR ?auto_464322 ) ( ON ?auto_464323 ?auto_464324 ) ( CLEAR ?auto_464323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_464314 ?auto_464315 ?auto_464316 ?auto_464317 ?auto_464318 ?auto_464319 ?auto_464320 ?auto_464321 ?auto_464322 ?auto_464323 )
      ( MAKE-15PILE ?auto_464314 ?auto_464315 ?auto_464316 ?auto_464317 ?auto_464318 ?auto_464319 ?auto_464320 ?auto_464321 ?auto_464322 ?auto_464323 ?auto_464324 ?auto_464325 ?auto_464326 ?auto_464327 ?auto_464328 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464345 - BLOCK
      ?auto_464346 - BLOCK
      ?auto_464347 - BLOCK
      ?auto_464348 - BLOCK
      ?auto_464349 - BLOCK
      ?auto_464350 - BLOCK
      ?auto_464351 - BLOCK
      ?auto_464352 - BLOCK
      ?auto_464353 - BLOCK
      ?auto_464354 - BLOCK
      ?auto_464355 - BLOCK
      ?auto_464356 - BLOCK
      ?auto_464357 - BLOCK
      ?auto_464358 - BLOCK
      ?auto_464359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464359 ) ( ON-TABLE ?auto_464345 ) ( ON ?auto_464346 ?auto_464345 ) ( ON ?auto_464347 ?auto_464346 ) ( ON ?auto_464348 ?auto_464347 ) ( ON ?auto_464349 ?auto_464348 ) ( ON ?auto_464350 ?auto_464349 ) ( ON ?auto_464351 ?auto_464350 ) ( ON ?auto_464352 ?auto_464351 ) ( ON ?auto_464353 ?auto_464352 ) ( not ( = ?auto_464345 ?auto_464346 ) ) ( not ( = ?auto_464345 ?auto_464347 ) ) ( not ( = ?auto_464345 ?auto_464348 ) ) ( not ( = ?auto_464345 ?auto_464349 ) ) ( not ( = ?auto_464345 ?auto_464350 ) ) ( not ( = ?auto_464345 ?auto_464351 ) ) ( not ( = ?auto_464345 ?auto_464352 ) ) ( not ( = ?auto_464345 ?auto_464353 ) ) ( not ( = ?auto_464345 ?auto_464354 ) ) ( not ( = ?auto_464345 ?auto_464355 ) ) ( not ( = ?auto_464345 ?auto_464356 ) ) ( not ( = ?auto_464345 ?auto_464357 ) ) ( not ( = ?auto_464345 ?auto_464358 ) ) ( not ( = ?auto_464345 ?auto_464359 ) ) ( not ( = ?auto_464346 ?auto_464347 ) ) ( not ( = ?auto_464346 ?auto_464348 ) ) ( not ( = ?auto_464346 ?auto_464349 ) ) ( not ( = ?auto_464346 ?auto_464350 ) ) ( not ( = ?auto_464346 ?auto_464351 ) ) ( not ( = ?auto_464346 ?auto_464352 ) ) ( not ( = ?auto_464346 ?auto_464353 ) ) ( not ( = ?auto_464346 ?auto_464354 ) ) ( not ( = ?auto_464346 ?auto_464355 ) ) ( not ( = ?auto_464346 ?auto_464356 ) ) ( not ( = ?auto_464346 ?auto_464357 ) ) ( not ( = ?auto_464346 ?auto_464358 ) ) ( not ( = ?auto_464346 ?auto_464359 ) ) ( not ( = ?auto_464347 ?auto_464348 ) ) ( not ( = ?auto_464347 ?auto_464349 ) ) ( not ( = ?auto_464347 ?auto_464350 ) ) ( not ( = ?auto_464347 ?auto_464351 ) ) ( not ( = ?auto_464347 ?auto_464352 ) ) ( not ( = ?auto_464347 ?auto_464353 ) ) ( not ( = ?auto_464347 ?auto_464354 ) ) ( not ( = ?auto_464347 ?auto_464355 ) ) ( not ( = ?auto_464347 ?auto_464356 ) ) ( not ( = ?auto_464347 ?auto_464357 ) ) ( not ( = ?auto_464347 ?auto_464358 ) ) ( not ( = ?auto_464347 ?auto_464359 ) ) ( not ( = ?auto_464348 ?auto_464349 ) ) ( not ( = ?auto_464348 ?auto_464350 ) ) ( not ( = ?auto_464348 ?auto_464351 ) ) ( not ( = ?auto_464348 ?auto_464352 ) ) ( not ( = ?auto_464348 ?auto_464353 ) ) ( not ( = ?auto_464348 ?auto_464354 ) ) ( not ( = ?auto_464348 ?auto_464355 ) ) ( not ( = ?auto_464348 ?auto_464356 ) ) ( not ( = ?auto_464348 ?auto_464357 ) ) ( not ( = ?auto_464348 ?auto_464358 ) ) ( not ( = ?auto_464348 ?auto_464359 ) ) ( not ( = ?auto_464349 ?auto_464350 ) ) ( not ( = ?auto_464349 ?auto_464351 ) ) ( not ( = ?auto_464349 ?auto_464352 ) ) ( not ( = ?auto_464349 ?auto_464353 ) ) ( not ( = ?auto_464349 ?auto_464354 ) ) ( not ( = ?auto_464349 ?auto_464355 ) ) ( not ( = ?auto_464349 ?auto_464356 ) ) ( not ( = ?auto_464349 ?auto_464357 ) ) ( not ( = ?auto_464349 ?auto_464358 ) ) ( not ( = ?auto_464349 ?auto_464359 ) ) ( not ( = ?auto_464350 ?auto_464351 ) ) ( not ( = ?auto_464350 ?auto_464352 ) ) ( not ( = ?auto_464350 ?auto_464353 ) ) ( not ( = ?auto_464350 ?auto_464354 ) ) ( not ( = ?auto_464350 ?auto_464355 ) ) ( not ( = ?auto_464350 ?auto_464356 ) ) ( not ( = ?auto_464350 ?auto_464357 ) ) ( not ( = ?auto_464350 ?auto_464358 ) ) ( not ( = ?auto_464350 ?auto_464359 ) ) ( not ( = ?auto_464351 ?auto_464352 ) ) ( not ( = ?auto_464351 ?auto_464353 ) ) ( not ( = ?auto_464351 ?auto_464354 ) ) ( not ( = ?auto_464351 ?auto_464355 ) ) ( not ( = ?auto_464351 ?auto_464356 ) ) ( not ( = ?auto_464351 ?auto_464357 ) ) ( not ( = ?auto_464351 ?auto_464358 ) ) ( not ( = ?auto_464351 ?auto_464359 ) ) ( not ( = ?auto_464352 ?auto_464353 ) ) ( not ( = ?auto_464352 ?auto_464354 ) ) ( not ( = ?auto_464352 ?auto_464355 ) ) ( not ( = ?auto_464352 ?auto_464356 ) ) ( not ( = ?auto_464352 ?auto_464357 ) ) ( not ( = ?auto_464352 ?auto_464358 ) ) ( not ( = ?auto_464352 ?auto_464359 ) ) ( not ( = ?auto_464353 ?auto_464354 ) ) ( not ( = ?auto_464353 ?auto_464355 ) ) ( not ( = ?auto_464353 ?auto_464356 ) ) ( not ( = ?auto_464353 ?auto_464357 ) ) ( not ( = ?auto_464353 ?auto_464358 ) ) ( not ( = ?auto_464353 ?auto_464359 ) ) ( not ( = ?auto_464354 ?auto_464355 ) ) ( not ( = ?auto_464354 ?auto_464356 ) ) ( not ( = ?auto_464354 ?auto_464357 ) ) ( not ( = ?auto_464354 ?auto_464358 ) ) ( not ( = ?auto_464354 ?auto_464359 ) ) ( not ( = ?auto_464355 ?auto_464356 ) ) ( not ( = ?auto_464355 ?auto_464357 ) ) ( not ( = ?auto_464355 ?auto_464358 ) ) ( not ( = ?auto_464355 ?auto_464359 ) ) ( not ( = ?auto_464356 ?auto_464357 ) ) ( not ( = ?auto_464356 ?auto_464358 ) ) ( not ( = ?auto_464356 ?auto_464359 ) ) ( not ( = ?auto_464357 ?auto_464358 ) ) ( not ( = ?auto_464357 ?auto_464359 ) ) ( not ( = ?auto_464358 ?auto_464359 ) ) ( ON ?auto_464358 ?auto_464359 ) ( ON ?auto_464357 ?auto_464358 ) ( ON ?auto_464356 ?auto_464357 ) ( ON ?auto_464355 ?auto_464356 ) ( CLEAR ?auto_464353 ) ( ON ?auto_464354 ?auto_464355 ) ( CLEAR ?auto_464354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_464345 ?auto_464346 ?auto_464347 ?auto_464348 ?auto_464349 ?auto_464350 ?auto_464351 ?auto_464352 ?auto_464353 ?auto_464354 )
      ( MAKE-15PILE ?auto_464345 ?auto_464346 ?auto_464347 ?auto_464348 ?auto_464349 ?auto_464350 ?auto_464351 ?auto_464352 ?auto_464353 ?auto_464354 ?auto_464355 ?auto_464356 ?auto_464357 ?auto_464358 ?auto_464359 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464375 - BLOCK
      ?auto_464376 - BLOCK
      ?auto_464377 - BLOCK
      ?auto_464378 - BLOCK
      ?auto_464379 - BLOCK
      ?auto_464380 - BLOCK
      ?auto_464381 - BLOCK
      ?auto_464382 - BLOCK
      ?auto_464383 - BLOCK
      ?auto_464384 - BLOCK
      ?auto_464385 - BLOCK
      ?auto_464386 - BLOCK
      ?auto_464387 - BLOCK
      ?auto_464388 - BLOCK
      ?auto_464389 - BLOCK
    )
    :vars
    (
      ?auto_464390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464389 ?auto_464390 ) ( ON-TABLE ?auto_464375 ) ( ON ?auto_464376 ?auto_464375 ) ( ON ?auto_464377 ?auto_464376 ) ( ON ?auto_464378 ?auto_464377 ) ( ON ?auto_464379 ?auto_464378 ) ( ON ?auto_464380 ?auto_464379 ) ( ON ?auto_464381 ?auto_464380 ) ( ON ?auto_464382 ?auto_464381 ) ( not ( = ?auto_464375 ?auto_464376 ) ) ( not ( = ?auto_464375 ?auto_464377 ) ) ( not ( = ?auto_464375 ?auto_464378 ) ) ( not ( = ?auto_464375 ?auto_464379 ) ) ( not ( = ?auto_464375 ?auto_464380 ) ) ( not ( = ?auto_464375 ?auto_464381 ) ) ( not ( = ?auto_464375 ?auto_464382 ) ) ( not ( = ?auto_464375 ?auto_464383 ) ) ( not ( = ?auto_464375 ?auto_464384 ) ) ( not ( = ?auto_464375 ?auto_464385 ) ) ( not ( = ?auto_464375 ?auto_464386 ) ) ( not ( = ?auto_464375 ?auto_464387 ) ) ( not ( = ?auto_464375 ?auto_464388 ) ) ( not ( = ?auto_464375 ?auto_464389 ) ) ( not ( = ?auto_464375 ?auto_464390 ) ) ( not ( = ?auto_464376 ?auto_464377 ) ) ( not ( = ?auto_464376 ?auto_464378 ) ) ( not ( = ?auto_464376 ?auto_464379 ) ) ( not ( = ?auto_464376 ?auto_464380 ) ) ( not ( = ?auto_464376 ?auto_464381 ) ) ( not ( = ?auto_464376 ?auto_464382 ) ) ( not ( = ?auto_464376 ?auto_464383 ) ) ( not ( = ?auto_464376 ?auto_464384 ) ) ( not ( = ?auto_464376 ?auto_464385 ) ) ( not ( = ?auto_464376 ?auto_464386 ) ) ( not ( = ?auto_464376 ?auto_464387 ) ) ( not ( = ?auto_464376 ?auto_464388 ) ) ( not ( = ?auto_464376 ?auto_464389 ) ) ( not ( = ?auto_464376 ?auto_464390 ) ) ( not ( = ?auto_464377 ?auto_464378 ) ) ( not ( = ?auto_464377 ?auto_464379 ) ) ( not ( = ?auto_464377 ?auto_464380 ) ) ( not ( = ?auto_464377 ?auto_464381 ) ) ( not ( = ?auto_464377 ?auto_464382 ) ) ( not ( = ?auto_464377 ?auto_464383 ) ) ( not ( = ?auto_464377 ?auto_464384 ) ) ( not ( = ?auto_464377 ?auto_464385 ) ) ( not ( = ?auto_464377 ?auto_464386 ) ) ( not ( = ?auto_464377 ?auto_464387 ) ) ( not ( = ?auto_464377 ?auto_464388 ) ) ( not ( = ?auto_464377 ?auto_464389 ) ) ( not ( = ?auto_464377 ?auto_464390 ) ) ( not ( = ?auto_464378 ?auto_464379 ) ) ( not ( = ?auto_464378 ?auto_464380 ) ) ( not ( = ?auto_464378 ?auto_464381 ) ) ( not ( = ?auto_464378 ?auto_464382 ) ) ( not ( = ?auto_464378 ?auto_464383 ) ) ( not ( = ?auto_464378 ?auto_464384 ) ) ( not ( = ?auto_464378 ?auto_464385 ) ) ( not ( = ?auto_464378 ?auto_464386 ) ) ( not ( = ?auto_464378 ?auto_464387 ) ) ( not ( = ?auto_464378 ?auto_464388 ) ) ( not ( = ?auto_464378 ?auto_464389 ) ) ( not ( = ?auto_464378 ?auto_464390 ) ) ( not ( = ?auto_464379 ?auto_464380 ) ) ( not ( = ?auto_464379 ?auto_464381 ) ) ( not ( = ?auto_464379 ?auto_464382 ) ) ( not ( = ?auto_464379 ?auto_464383 ) ) ( not ( = ?auto_464379 ?auto_464384 ) ) ( not ( = ?auto_464379 ?auto_464385 ) ) ( not ( = ?auto_464379 ?auto_464386 ) ) ( not ( = ?auto_464379 ?auto_464387 ) ) ( not ( = ?auto_464379 ?auto_464388 ) ) ( not ( = ?auto_464379 ?auto_464389 ) ) ( not ( = ?auto_464379 ?auto_464390 ) ) ( not ( = ?auto_464380 ?auto_464381 ) ) ( not ( = ?auto_464380 ?auto_464382 ) ) ( not ( = ?auto_464380 ?auto_464383 ) ) ( not ( = ?auto_464380 ?auto_464384 ) ) ( not ( = ?auto_464380 ?auto_464385 ) ) ( not ( = ?auto_464380 ?auto_464386 ) ) ( not ( = ?auto_464380 ?auto_464387 ) ) ( not ( = ?auto_464380 ?auto_464388 ) ) ( not ( = ?auto_464380 ?auto_464389 ) ) ( not ( = ?auto_464380 ?auto_464390 ) ) ( not ( = ?auto_464381 ?auto_464382 ) ) ( not ( = ?auto_464381 ?auto_464383 ) ) ( not ( = ?auto_464381 ?auto_464384 ) ) ( not ( = ?auto_464381 ?auto_464385 ) ) ( not ( = ?auto_464381 ?auto_464386 ) ) ( not ( = ?auto_464381 ?auto_464387 ) ) ( not ( = ?auto_464381 ?auto_464388 ) ) ( not ( = ?auto_464381 ?auto_464389 ) ) ( not ( = ?auto_464381 ?auto_464390 ) ) ( not ( = ?auto_464382 ?auto_464383 ) ) ( not ( = ?auto_464382 ?auto_464384 ) ) ( not ( = ?auto_464382 ?auto_464385 ) ) ( not ( = ?auto_464382 ?auto_464386 ) ) ( not ( = ?auto_464382 ?auto_464387 ) ) ( not ( = ?auto_464382 ?auto_464388 ) ) ( not ( = ?auto_464382 ?auto_464389 ) ) ( not ( = ?auto_464382 ?auto_464390 ) ) ( not ( = ?auto_464383 ?auto_464384 ) ) ( not ( = ?auto_464383 ?auto_464385 ) ) ( not ( = ?auto_464383 ?auto_464386 ) ) ( not ( = ?auto_464383 ?auto_464387 ) ) ( not ( = ?auto_464383 ?auto_464388 ) ) ( not ( = ?auto_464383 ?auto_464389 ) ) ( not ( = ?auto_464383 ?auto_464390 ) ) ( not ( = ?auto_464384 ?auto_464385 ) ) ( not ( = ?auto_464384 ?auto_464386 ) ) ( not ( = ?auto_464384 ?auto_464387 ) ) ( not ( = ?auto_464384 ?auto_464388 ) ) ( not ( = ?auto_464384 ?auto_464389 ) ) ( not ( = ?auto_464384 ?auto_464390 ) ) ( not ( = ?auto_464385 ?auto_464386 ) ) ( not ( = ?auto_464385 ?auto_464387 ) ) ( not ( = ?auto_464385 ?auto_464388 ) ) ( not ( = ?auto_464385 ?auto_464389 ) ) ( not ( = ?auto_464385 ?auto_464390 ) ) ( not ( = ?auto_464386 ?auto_464387 ) ) ( not ( = ?auto_464386 ?auto_464388 ) ) ( not ( = ?auto_464386 ?auto_464389 ) ) ( not ( = ?auto_464386 ?auto_464390 ) ) ( not ( = ?auto_464387 ?auto_464388 ) ) ( not ( = ?auto_464387 ?auto_464389 ) ) ( not ( = ?auto_464387 ?auto_464390 ) ) ( not ( = ?auto_464388 ?auto_464389 ) ) ( not ( = ?auto_464388 ?auto_464390 ) ) ( not ( = ?auto_464389 ?auto_464390 ) ) ( ON ?auto_464388 ?auto_464389 ) ( ON ?auto_464387 ?auto_464388 ) ( ON ?auto_464386 ?auto_464387 ) ( ON ?auto_464385 ?auto_464386 ) ( ON ?auto_464384 ?auto_464385 ) ( CLEAR ?auto_464382 ) ( ON ?auto_464383 ?auto_464384 ) ( CLEAR ?auto_464383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_464375 ?auto_464376 ?auto_464377 ?auto_464378 ?auto_464379 ?auto_464380 ?auto_464381 ?auto_464382 ?auto_464383 )
      ( MAKE-15PILE ?auto_464375 ?auto_464376 ?auto_464377 ?auto_464378 ?auto_464379 ?auto_464380 ?auto_464381 ?auto_464382 ?auto_464383 ?auto_464384 ?auto_464385 ?auto_464386 ?auto_464387 ?auto_464388 ?auto_464389 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464406 - BLOCK
      ?auto_464407 - BLOCK
      ?auto_464408 - BLOCK
      ?auto_464409 - BLOCK
      ?auto_464410 - BLOCK
      ?auto_464411 - BLOCK
      ?auto_464412 - BLOCK
      ?auto_464413 - BLOCK
      ?auto_464414 - BLOCK
      ?auto_464415 - BLOCK
      ?auto_464416 - BLOCK
      ?auto_464417 - BLOCK
      ?auto_464418 - BLOCK
      ?auto_464419 - BLOCK
      ?auto_464420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464420 ) ( ON-TABLE ?auto_464406 ) ( ON ?auto_464407 ?auto_464406 ) ( ON ?auto_464408 ?auto_464407 ) ( ON ?auto_464409 ?auto_464408 ) ( ON ?auto_464410 ?auto_464409 ) ( ON ?auto_464411 ?auto_464410 ) ( ON ?auto_464412 ?auto_464411 ) ( ON ?auto_464413 ?auto_464412 ) ( not ( = ?auto_464406 ?auto_464407 ) ) ( not ( = ?auto_464406 ?auto_464408 ) ) ( not ( = ?auto_464406 ?auto_464409 ) ) ( not ( = ?auto_464406 ?auto_464410 ) ) ( not ( = ?auto_464406 ?auto_464411 ) ) ( not ( = ?auto_464406 ?auto_464412 ) ) ( not ( = ?auto_464406 ?auto_464413 ) ) ( not ( = ?auto_464406 ?auto_464414 ) ) ( not ( = ?auto_464406 ?auto_464415 ) ) ( not ( = ?auto_464406 ?auto_464416 ) ) ( not ( = ?auto_464406 ?auto_464417 ) ) ( not ( = ?auto_464406 ?auto_464418 ) ) ( not ( = ?auto_464406 ?auto_464419 ) ) ( not ( = ?auto_464406 ?auto_464420 ) ) ( not ( = ?auto_464407 ?auto_464408 ) ) ( not ( = ?auto_464407 ?auto_464409 ) ) ( not ( = ?auto_464407 ?auto_464410 ) ) ( not ( = ?auto_464407 ?auto_464411 ) ) ( not ( = ?auto_464407 ?auto_464412 ) ) ( not ( = ?auto_464407 ?auto_464413 ) ) ( not ( = ?auto_464407 ?auto_464414 ) ) ( not ( = ?auto_464407 ?auto_464415 ) ) ( not ( = ?auto_464407 ?auto_464416 ) ) ( not ( = ?auto_464407 ?auto_464417 ) ) ( not ( = ?auto_464407 ?auto_464418 ) ) ( not ( = ?auto_464407 ?auto_464419 ) ) ( not ( = ?auto_464407 ?auto_464420 ) ) ( not ( = ?auto_464408 ?auto_464409 ) ) ( not ( = ?auto_464408 ?auto_464410 ) ) ( not ( = ?auto_464408 ?auto_464411 ) ) ( not ( = ?auto_464408 ?auto_464412 ) ) ( not ( = ?auto_464408 ?auto_464413 ) ) ( not ( = ?auto_464408 ?auto_464414 ) ) ( not ( = ?auto_464408 ?auto_464415 ) ) ( not ( = ?auto_464408 ?auto_464416 ) ) ( not ( = ?auto_464408 ?auto_464417 ) ) ( not ( = ?auto_464408 ?auto_464418 ) ) ( not ( = ?auto_464408 ?auto_464419 ) ) ( not ( = ?auto_464408 ?auto_464420 ) ) ( not ( = ?auto_464409 ?auto_464410 ) ) ( not ( = ?auto_464409 ?auto_464411 ) ) ( not ( = ?auto_464409 ?auto_464412 ) ) ( not ( = ?auto_464409 ?auto_464413 ) ) ( not ( = ?auto_464409 ?auto_464414 ) ) ( not ( = ?auto_464409 ?auto_464415 ) ) ( not ( = ?auto_464409 ?auto_464416 ) ) ( not ( = ?auto_464409 ?auto_464417 ) ) ( not ( = ?auto_464409 ?auto_464418 ) ) ( not ( = ?auto_464409 ?auto_464419 ) ) ( not ( = ?auto_464409 ?auto_464420 ) ) ( not ( = ?auto_464410 ?auto_464411 ) ) ( not ( = ?auto_464410 ?auto_464412 ) ) ( not ( = ?auto_464410 ?auto_464413 ) ) ( not ( = ?auto_464410 ?auto_464414 ) ) ( not ( = ?auto_464410 ?auto_464415 ) ) ( not ( = ?auto_464410 ?auto_464416 ) ) ( not ( = ?auto_464410 ?auto_464417 ) ) ( not ( = ?auto_464410 ?auto_464418 ) ) ( not ( = ?auto_464410 ?auto_464419 ) ) ( not ( = ?auto_464410 ?auto_464420 ) ) ( not ( = ?auto_464411 ?auto_464412 ) ) ( not ( = ?auto_464411 ?auto_464413 ) ) ( not ( = ?auto_464411 ?auto_464414 ) ) ( not ( = ?auto_464411 ?auto_464415 ) ) ( not ( = ?auto_464411 ?auto_464416 ) ) ( not ( = ?auto_464411 ?auto_464417 ) ) ( not ( = ?auto_464411 ?auto_464418 ) ) ( not ( = ?auto_464411 ?auto_464419 ) ) ( not ( = ?auto_464411 ?auto_464420 ) ) ( not ( = ?auto_464412 ?auto_464413 ) ) ( not ( = ?auto_464412 ?auto_464414 ) ) ( not ( = ?auto_464412 ?auto_464415 ) ) ( not ( = ?auto_464412 ?auto_464416 ) ) ( not ( = ?auto_464412 ?auto_464417 ) ) ( not ( = ?auto_464412 ?auto_464418 ) ) ( not ( = ?auto_464412 ?auto_464419 ) ) ( not ( = ?auto_464412 ?auto_464420 ) ) ( not ( = ?auto_464413 ?auto_464414 ) ) ( not ( = ?auto_464413 ?auto_464415 ) ) ( not ( = ?auto_464413 ?auto_464416 ) ) ( not ( = ?auto_464413 ?auto_464417 ) ) ( not ( = ?auto_464413 ?auto_464418 ) ) ( not ( = ?auto_464413 ?auto_464419 ) ) ( not ( = ?auto_464413 ?auto_464420 ) ) ( not ( = ?auto_464414 ?auto_464415 ) ) ( not ( = ?auto_464414 ?auto_464416 ) ) ( not ( = ?auto_464414 ?auto_464417 ) ) ( not ( = ?auto_464414 ?auto_464418 ) ) ( not ( = ?auto_464414 ?auto_464419 ) ) ( not ( = ?auto_464414 ?auto_464420 ) ) ( not ( = ?auto_464415 ?auto_464416 ) ) ( not ( = ?auto_464415 ?auto_464417 ) ) ( not ( = ?auto_464415 ?auto_464418 ) ) ( not ( = ?auto_464415 ?auto_464419 ) ) ( not ( = ?auto_464415 ?auto_464420 ) ) ( not ( = ?auto_464416 ?auto_464417 ) ) ( not ( = ?auto_464416 ?auto_464418 ) ) ( not ( = ?auto_464416 ?auto_464419 ) ) ( not ( = ?auto_464416 ?auto_464420 ) ) ( not ( = ?auto_464417 ?auto_464418 ) ) ( not ( = ?auto_464417 ?auto_464419 ) ) ( not ( = ?auto_464417 ?auto_464420 ) ) ( not ( = ?auto_464418 ?auto_464419 ) ) ( not ( = ?auto_464418 ?auto_464420 ) ) ( not ( = ?auto_464419 ?auto_464420 ) ) ( ON ?auto_464419 ?auto_464420 ) ( ON ?auto_464418 ?auto_464419 ) ( ON ?auto_464417 ?auto_464418 ) ( ON ?auto_464416 ?auto_464417 ) ( ON ?auto_464415 ?auto_464416 ) ( CLEAR ?auto_464413 ) ( ON ?auto_464414 ?auto_464415 ) ( CLEAR ?auto_464414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_464406 ?auto_464407 ?auto_464408 ?auto_464409 ?auto_464410 ?auto_464411 ?auto_464412 ?auto_464413 ?auto_464414 )
      ( MAKE-15PILE ?auto_464406 ?auto_464407 ?auto_464408 ?auto_464409 ?auto_464410 ?auto_464411 ?auto_464412 ?auto_464413 ?auto_464414 ?auto_464415 ?auto_464416 ?auto_464417 ?auto_464418 ?auto_464419 ?auto_464420 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464436 - BLOCK
      ?auto_464437 - BLOCK
      ?auto_464438 - BLOCK
      ?auto_464439 - BLOCK
      ?auto_464440 - BLOCK
      ?auto_464441 - BLOCK
      ?auto_464442 - BLOCK
      ?auto_464443 - BLOCK
      ?auto_464444 - BLOCK
      ?auto_464445 - BLOCK
      ?auto_464446 - BLOCK
      ?auto_464447 - BLOCK
      ?auto_464448 - BLOCK
      ?auto_464449 - BLOCK
      ?auto_464450 - BLOCK
    )
    :vars
    (
      ?auto_464451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464450 ?auto_464451 ) ( ON-TABLE ?auto_464436 ) ( ON ?auto_464437 ?auto_464436 ) ( ON ?auto_464438 ?auto_464437 ) ( ON ?auto_464439 ?auto_464438 ) ( ON ?auto_464440 ?auto_464439 ) ( ON ?auto_464441 ?auto_464440 ) ( ON ?auto_464442 ?auto_464441 ) ( not ( = ?auto_464436 ?auto_464437 ) ) ( not ( = ?auto_464436 ?auto_464438 ) ) ( not ( = ?auto_464436 ?auto_464439 ) ) ( not ( = ?auto_464436 ?auto_464440 ) ) ( not ( = ?auto_464436 ?auto_464441 ) ) ( not ( = ?auto_464436 ?auto_464442 ) ) ( not ( = ?auto_464436 ?auto_464443 ) ) ( not ( = ?auto_464436 ?auto_464444 ) ) ( not ( = ?auto_464436 ?auto_464445 ) ) ( not ( = ?auto_464436 ?auto_464446 ) ) ( not ( = ?auto_464436 ?auto_464447 ) ) ( not ( = ?auto_464436 ?auto_464448 ) ) ( not ( = ?auto_464436 ?auto_464449 ) ) ( not ( = ?auto_464436 ?auto_464450 ) ) ( not ( = ?auto_464436 ?auto_464451 ) ) ( not ( = ?auto_464437 ?auto_464438 ) ) ( not ( = ?auto_464437 ?auto_464439 ) ) ( not ( = ?auto_464437 ?auto_464440 ) ) ( not ( = ?auto_464437 ?auto_464441 ) ) ( not ( = ?auto_464437 ?auto_464442 ) ) ( not ( = ?auto_464437 ?auto_464443 ) ) ( not ( = ?auto_464437 ?auto_464444 ) ) ( not ( = ?auto_464437 ?auto_464445 ) ) ( not ( = ?auto_464437 ?auto_464446 ) ) ( not ( = ?auto_464437 ?auto_464447 ) ) ( not ( = ?auto_464437 ?auto_464448 ) ) ( not ( = ?auto_464437 ?auto_464449 ) ) ( not ( = ?auto_464437 ?auto_464450 ) ) ( not ( = ?auto_464437 ?auto_464451 ) ) ( not ( = ?auto_464438 ?auto_464439 ) ) ( not ( = ?auto_464438 ?auto_464440 ) ) ( not ( = ?auto_464438 ?auto_464441 ) ) ( not ( = ?auto_464438 ?auto_464442 ) ) ( not ( = ?auto_464438 ?auto_464443 ) ) ( not ( = ?auto_464438 ?auto_464444 ) ) ( not ( = ?auto_464438 ?auto_464445 ) ) ( not ( = ?auto_464438 ?auto_464446 ) ) ( not ( = ?auto_464438 ?auto_464447 ) ) ( not ( = ?auto_464438 ?auto_464448 ) ) ( not ( = ?auto_464438 ?auto_464449 ) ) ( not ( = ?auto_464438 ?auto_464450 ) ) ( not ( = ?auto_464438 ?auto_464451 ) ) ( not ( = ?auto_464439 ?auto_464440 ) ) ( not ( = ?auto_464439 ?auto_464441 ) ) ( not ( = ?auto_464439 ?auto_464442 ) ) ( not ( = ?auto_464439 ?auto_464443 ) ) ( not ( = ?auto_464439 ?auto_464444 ) ) ( not ( = ?auto_464439 ?auto_464445 ) ) ( not ( = ?auto_464439 ?auto_464446 ) ) ( not ( = ?auto_464439 ?auto_464447 ) ) ( not ( = ?auto_464439 ?auto_464448 ) ) ( not ( = ?auto_464439 ?auto_464449 ) ) ( not ( = ?auto_464439 ?auto_464450 ) ) ( not ( = ?auto_464439 ?auto_464451 ) ) ( not ( = ?auto_464440 ?auto_464441 ) ) ( not ( = ?auto_464440 ?auto_464442 ) ) ( not ( = ?auto_464440 ?auto_464443 ) ) ( not ( = ?auto_464440 ?auto_464444 ) ) ( not ( = ?auto_464440 ?auto_464445 ) ) ( not ( = ?auto_464440 ?auto_464446 ) ) ( not ( = ?auto_464440 ?auto_464447 ) ) ( not ( = ?auto_464440 ?auto_464448 ) ) ( not ( = ?auto_464440 ?auto_464449 ) ) ( not ( = ?auto_464440 ?auto_464450 ) ) ( not ( = ?auto_464440 ?auto_464451 ) ) ( not ( = ?auto_464441 ?auto_464442 ) ) ( not ( = ?auto_464441 ?auto_464443 ) ) ( not ( = ?auto_464441 ?auto_464444 ) ) ( not ( = ?auto_464441 ?auto_464445 ) ) ( not ( = ?auto_464441 ?auto_464446 ) ) ( not ( = ?auto_464441 ?auto_464447 ) ) ( not ( = ?auto_464441 ?auto_464448 ) ) ( not ( = ?auto_464441 ?auto_464449 ) ) ( not ( = ?auto_464441 ?auto_464450 ) ) ( not ( = ?auto_464441 ?auto_464451 ) ) ( not ( = ?auto_464442 ?auto_464443 ) ) ( not ( = ?auto_464442 ?auto_464444 ) ) ( not ( = ?auto_464442 ?auto_464445 ) ) ( not ( = ?auto_464442 ?auto_464446 ) ) ( not ( = ?auto_464442 ?auto_464447 ) ) ( not ( = ?auto_464442 ?auto_464448 ) ) ( not ( = ?auto_464442 ?auto_464449 ) ) ( not ( = ?auto_464442 ?auto_464450 ) ) ( not ( = ?auto_464442 ?auto_464451 ) ) ( not ( = ?auto_464443 ?auto_464444 ) ) ( not ( = ?auto_464443 ?auto_464445 ) ) ( not ( = ?auto_464443 ?auto_464446 ) ) ( not ( = ?auto_464443 ?auto_464447 ) ) ( not ( = ?auto_464443 ?auto_464448 ) ) ( not ( = ?auto_464443 ?auto_464449 ) ) ( not ( = ?auto_464443 ?auto_464450 ) ) ( not ( = ?auto_464443 ?auto_464451 ) ) ( not ( = ?auto_464444 ?auto_464445 ) ) ( not ( = ?auto_464444 ?auto_464446 ) ) ( not ( = ?auto_464444 ?auto_464447 ) ) ( not ( = ?auto_464444 ?auto_464448 ) ) ( not ( = ?auto_464444 ?auto_464449 ) ) ( not ( = ?auto_464444 ?auto_464450 ) ) ( not ( = ?auto_464444 ?auto_464451 ) ) ( not ( = ?auto_464445 ?auto_464446 ) ) ( not ( = ?auto_464445 ?auto_464447 ) ) ( not ( = ?auto_464445 ?auto_464448 ) ) ( not ( = ?auto_464445 ?auto_464449 ) ) ( not ( = ?auto_464445 ?auto_464450 ) ) ( not ( = ?auto_464445 ?auto_464451 ) ) ( not ( = ?auto_464446 ?auto_464447 ) ) ( not ( = ?auto_464446 ?auto_464448 ) ) ( not ( = ?auto_464446 ?auto_464449 ) ) ( not ( = ?auto_464446 ?auto_464450 ) ) ( not ( = ?auto_464446 ?auto_464451 ) ) ( not ( = ?auto_464447 ?auto_464448 ) ) ( not ( = ?auto_464447 ?auto_464449 ) ) ( not ( = ?auto_464447 ?auto_464450 ) ) ( not ( = ?auto_464447 ?auto_464451 ) ) ( not ( = ?auto_464448 ?auto_464449 ) ) ( not ( = ?auto_464448 ?auto_464450 ) ) ( not ( = ?auto_464448 ?auto_464451 ) ) ( not ( = ?auto_464449 ?auto_464450 ) ) ( not ( = ?auto_464449 ?auto_464451 ) ) ( not ( = ?auto_464450 ?auto_464451 ) ) ( ON ?auto_464449 ?auto_464450 ) ( ON ?auto_464448 ?auto_464449 ) ( ON ?auto_464447 ?auto_464448 ) ( ON ?auto_464446 ?auto_464447 ) ( ON ?auto_464445 ?auto_464446 ) ( ON ?auto_464444 ?auto_464445 ) ( CLEAR ?auto_464442 ) ( ON ?auto_464443 ?auto_464444 ) ( CLEAR ?auto_464443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_464436 ?auto_464437 ?auto_464438 ?auto_464439 ?auto_464440 ?auto_464441 ?auto_464442 ?auto_464443 )
      ( MAKE-15PILE ?auto_464436 ?auto_464437 ?auto_464438 ?auto_464439 ?auto_464440 ?auto_464441 ?auto_464442 ?auto_464443 ?auto_464444 ?auto_464445 ?auto_464446 ?auto_464447 ?auto_464448 ?auto_464449 ?auto_464450 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464467 - BLOCK
      ?auto_464468 - BLOCK
      ?auto_464469 - BLOCK
      ?auto_464470 - BLOCK
      ?auto_464471 - BLOCK
      ?auto_464472 - BLOCK
      ?auto_464473 - BLOCK
      ?auto_464474 - BLOCK
      ?auto_464475 - BLOCK
      ?auto_464476 - BLOCK
      ?auto_464477 - BLOCK
      ?auto_464478 - BLOCK
      ?auto_464479 - BLOCK
      ?auto_464480 - BLOCK
      ?auto_464481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464481 ) ( ON-TABLE ?auto_464467 ) ( ON ?auto_464468 ?auto_464467 ) ( ON ?auto_464469 ?auto_464468 ) ( ON ?auto_464470 ?auto_464469 ) ( ON ?auto_464471 ?auto_464470 ) ( ON ?auto_464472 ?auto_464471 ) ( ON ?auto_464473 ?auto_464472 ) ( not ( = ?auto_464467 ?auto_464468 ) ) ( not ( = ?auto_464467 ?auto_464469 ) ) ( not ( = ?auto_464467 ?auto_464470 ) ) ( not ( = ?auto_464467 ?auto_464471 ) ) ( not ( = ?auto_464467 ?auto_464472 ) ) ( not ( = ?auto_464467 ?auto_464473 ) ) ( not ( = ?auto_464467 ?auto_464474 ) ) ( not ( = ?auto_464467 ?auto_464475 ) ) ( not ( = ?auto_464467 ?auto_464476 ) ) ( not ( = ?auto_464467 ?auto_464477 ) ) ( not ( = ?auto_464467 ?auto_464478 ) ) ( not ( = ?auto_464467 ?auto_464479 ) ) ( not ( = ?auto_464467 ?auto_464480 ) ) ( not ( = ?auto_464467 ?auto_464481 ) ) ( not ( = ?auto_464468 ?auto_464469 ) ) ( not ( = ?auto_464468 ?auto_464470 ) ) ( not ( = ?auto_464468 ?auto_464471 ) ) ( not ( = ?auto_464468 ?auto_464472 ) ) ( not ( = ?auto_464468 ?auto_464473 ) ) ( not ( = ?auto_464468 ?auto_464474 ) ) ( not ( = ?auto_464468 ?auto_464475 ) ) ( not ( = ?auto_464468 ?auto_464476 ) ) ( not ( = ?auto_464468 ?auto_464477 ) ) ( not ( = ?auto_464468 ?auto_464478 ) ) ( not ( = ?auto_464468 ?auto_464479 ) ) ( not ( = ?auto_464468 ?auto_464480 ) ) ( not ( = ?auto_464468 ?auto_464481 ) ) ( not ( = ?auto_464469 ?auto_464470 ) ) ( not ( = ?auto_464469 ?auto_464471 ) ) ( not ( = ?auto_464469 ?auto_464472 ) ) ( not ( = ?auto_464469 ?auto_464473 ) ) ( not ( = ?auto_464469 ?auto_464474 ) ) ( not ( = ?auto_464469 ?auto_464475 ) ) ( not ( = ?auto_464469 ?auto_464476 ) ) ( not ( = ?auto_464469 ?auto_464477 ) ) ( not ( = ?auto_464469 ?auto_464478 ) ) ( not ( = ?auto_464469 ?auto_464479 ) ) ( not ( = ?auto_464469 ?auto_464480 ) ) ( not ( = ?auto_464469 ?auto_464481 ) ) ( not ( = ?auto_464470 ?auto_464471 ) ) ( not ( = ?auto_464470 ?auto_464472 ) ) ( not ( = ?auto_464470 ?auto_464473 ) ) ( not ( = ?auto_464470 ?auto_464474 ) ) ( not ( = ?auto_464470 ?auto_464475 ) ) ( not ( = ?auto_464470 ?auto_464476 ) ) ( not ( = ?auto_464470 ?auto_464477 ) ) ( not ( = ?auto_464470 ?auto_464478 ) ) ( not ( = ?auto_464470 ?auto_464479 ) ) ( not ( = ?auto_464470 ?auto_464480 ) ) ( not ( = ?auto_464470 ?auto_464481 ) ) ( not ( = ?auto_464471 ?auto_464472 ) ) ( not ( = ?auto_464471 ?auto_464473 ) ) ( not ( = ?auto_464471 ?auto_464474 ) ) ( not ( = ?auto_464471 ?auto_464475 ) ) ( not ( = ?auto_464471 ?auto_464476 ) ) ( not ( = ?auto_464471 ?auto_464477 ) ) ( not ( = ?auto_464471 ?auto_464478 ) ) ( not ( = ?auto_464471 ?auto_464479 ) ) ( not ( = ?auto_464471 ?auto_464480 ) ) ( not ( = ?auto_464471 ?auto_464481 ) ) ( not ( = ?auto_464472 ?auto_464473 ) ) ( not ( = ?auto_464472 ?auto_464474 ) ) ( not ( = ?auto_464472 ?auto_464475 ) ) ( not ( = ?auto_464472 ?auto_464476 ) ) ( not ( = ?auto_464472 ?auto_464477 ) ) ( not ( = ?auto_464472 ?auto_464478 ) ) ( not ( = ?auto_464472 ?auto_464479 ) ) ( not ( = ?auto_464472 ?auto_464480 ) ) ( not ( = ?auto_464472 ?auto_464481 ) ) ( not ( = ?auto_464473 ?auto_464474 ) ) ( not ( = ?auto_464473 ?auto_464475 ) ) ( not ( = ?auto_464473 ?auto_464476 ) ) ( not ( = ?auto_464473 ?auto_464477 ) ) ( not ( = ?auto_464473 ?auto_464478 ) ) ( not ( = ?auto_464473 ?auto_464479 ) ) ( not ( = ?auto_464473 ?auto_464480 ) ) ( not ( = ?auto_464473 ?auto_464481 ) ) ( not ( = ?auto_464474 ?auto_464475 ) ) ( not ( = ?auto_464474 ?auto_464476 ) ) ( not ( = ?auto_464474 ?auto_464477 ) ) ( not ( = ?auto_464474 ?auto_464478 ) ) ( not ( = ?auto_464474 ?auto_464479 ) ) ( not ( = ?auto_464474 ?auto_464480 ) ) ( not ( = ?auto_464474 ?auto_464481 ) ) ( not ( = ?auto_464475 ?auto_464476 ) ) ( not ( = ?auto_464475 ?auto_464477 ) ) ( not ( = ?auto_464475 ?auto_464478 ) ) ( not ( = ?auto_464475 ?auto_464479 ) ) ( not ( = ?auto_464475 ?auto_464480 ) ) ( not ( = ?auto_464475 ?auto_464481 ) ) ( not ( = ?auto_464476 ?auto_464477 ) ) ( not ( = ?auto_464476 ?auto_464478 ) ) ( not ( = ?auto_464476 ?auto_464479 ) ) ( not ( = ?auto_464476 ?auto_464480 ) ) ( not ( = ?auto_464476 ?auto_464481 ) ) ( not ( = ?auto_464477 ?auto_464478 ) ) ( not ( = ?auto_464477 ?auto_464479 ) ) ( not ( = ?auto_464477 ?auto_464480 ) ) ( not ( = ?auto_464477 ?auto_464481 ) ) ( not ( = ?auto_464478 ?auto_464479 ) ) ( not ( = ?auto_464478 ?auto_464480 ) ) ( not ( = ?auto_464478 ?auto_464481 ) ) ( not ( = ?auto_464479 ?auto_464480 ) ) ( not ( = ?auto_464479 ?auto_464481 ) ) ( not ( = ?auto_464480 ?auto_464481 ) ) ( ON ?auto_464480 ?auto_464481 ) ( ON ?auto_464479 ?auto_464480 ) ( ON ?auto_464478 ?auto_464479 ) ( ON ?auto_464477 ?auto_464478 ) ( ON ?auto_464476 ?auto_464477 ) ( ON ?auto_464475 ?auto_464476 ) ( CLEAR ?auto_464473 ) ( ON ?auto_464474 ?auto_464475 ) ( CLEAR ?auto_464474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_464467 ?auto_464468 ?auto_464469 ?auto_464470 ?auto_464471 ?auto_464472 ?auto_464473 ?auto_464474 )
      ( MAKE-15PILE ?auto_464467 ?auto_464468 ?auto_464469 ?auto_464470 ?auto_464471 ?auto_464472 ?auto_464473 ?auto_464474 ?auto_464475 ?auto_464476 ?auto_464477 ?auto_464478 ?auto_464479 ?auto_464480 ?auto_464481 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464497 - BLOCK
      ?auto_464498 - BLOCK
      ?auto_464499 - BLOCK
      ?auto_464500 - BLOCK
      ?auto_464501 - BLOCK
      ?auto_464502 - BLOCK
      ?auto_464503 - BLOCK
      ?auto_464504 - BLOCK
      ?auto_464505 - BLOCK
      ?auto_464506 - BLOCK
      ?auto_464507 - BLOCK
      ?auto_464508 - BLOCK
      ?auto_464509 - BLOCK
      ?auto_464510 - BLOCK
      ?auto_464511 - BLOCK
    )
    :vars
    (
      ?auto_464512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464511 ?auto_464512 ) ( ON-TABLE ?auto_464497 ) ( ON ?auto_464498 ?auto_464497 ) ( ON ?auto_464499 ?auto_464498 ) ( ON ?auto_464500 ?auto_464499 ) ( ON ?auto_464501 ?auto_464500 ) ( ON ?auto_464502 ?auto_464501 ) ( not ( = ?auto_464497 ?auto_464498 ) ) ( not ( = ?auto_464497 ?auto_464499 ) ) ( not ( = ?auto_464497 ?auto_464500 ) ) ( not ( = ?auto_464497 ?auto_464501 ) ) ( not ( = ?auto_464497 ?auto_464502 ) ) ( not ( = ?auto_464497 ?auto_464503 ) ) ( not ( = ?auto_464497 ?auto_464504 ) ) ( not ( = ?auto_464497 ?auto_464505 ) ) ( not ( = ?auto_464497 ?auto_464506 ) ) ( not ( = ?auto_464497 ?auto_464507 ) ) ( not ( = ?auto_464497 ?auto_464508 ) ) ( not ( = ?auto_464497 ?auto_464509 ) ) ( not ( = ?auto_464497 ?auto_464510 ) ) ( not ( = ?auto_464497 ?auto_464511 ) ) ( not ( = ?auto_464497 ?auto_464512 ) ) ( not ( = ?auto_464498 ?auto_464499 ) ) ( not ( = ?auto_464498 ?auto_464500 ) ) ( not ( = ?auto_464498 ?auto_464501 ) ) ( not ( = ?auto_464498 ?auto_464502 ) ) ( not ( = ?auto_464498 ?auto_464503 ) ) ( not ( = ?auto_464498 ?auto_464504 ) ) ( not ( = ?auto_464498 ?auto_464505 ) ) ( not ( = ?auto_464498 ?auto_464506 ) ) ( not ( = ?auto_464498 ?auto_464507 ) ) ( not ( = ?auto_464498 ?auto_464508 ) ) ( not ( = ?auto_464498 ?auto_464509 ) ) ( not ( = ?auto_464498 ?auto_464510 ) ) ( not ( = ?auto_464498 ?auto_464511 ) ) ( not ( = ?auto_464498 ?auto_464512 ) ) ( not ( = ?auto_464499 ?auto_464500 ) ) ( not ( = ?auto_464499 ?auto_464501 ) ) ( not ( = ?auto_464499 ?auto_464502 ) ) ( not ( = ?auto_464499 ?auto_464503 ) ) ( not ( = ?auto_464499 ?auto_464504 ) ) ( not ( = ?auto_464499 ?auto_464505 ) ) ( not ( = ?auto_464499 ?auto_464506 ) ) ( not ( = ?auto_464499 ?auto_464507 ) ) ( not ( = ?auto_464499 ?auto_464508 ) ) ( not ( = ?auto_464499 ?auto_464509 ) ) ( not ( = ?auto_464499 ?auto_464510 ) ) ( not ( = ?auto_464499 ?auto_464511 ) ) ( not ( = ?auto_464499 ?auto_464512 ) ) ( not ( = ?auto_464500 ?auto_464501 ) ) ( not ( = ?auto_464500 ?auto_464502 ) ) ( not ( = ?auto_464500 ?auto_464503 ) ) ( not ( = ?auto_464500 ?auto_464504 ) ) ( not ( = ?auto_464500 ?auto_464505 ) ) ( not ( = ?auto_464500 ?auto_464506 ) ) ( not ( = ?auto_464500 ?auto_464507 ) ) ( not ( = ?auto_464500 ?auto_464508 ) ) ( not ( = ?auto_464500 ?auto_464509 ) ) ( not ( = ?auto_464500 ?auto_464510 ) ) ( not ( = ?auto_464500 ?auto_464511 ) ) ( not ( = ?auto_464500 ?auto_464512 ) ) ( not ( = ?auto_464501 ?auto_464502 ) ) ( not ( = ?auto_464501 ?auto_464503 ) ) ( not ( = ?auto_464501 ?auto_464504 ) ) ( not ( = ?auto_464501 ?auto_464505 ) ) ( not ( = ?auto_464501 ?auto_464506 ) ) ( not ( = ?auto_464501 ?auto_464507 ) ) ( not ( = ?auto_464501 ?auto_464508 ) ) ( not ( = ?auto_464501 ?auto_464509 ) ) ( not ( = ?auto_464501 ?auto_464510 ) ) ( not ( = ?auto_464501 ?auto_464511 ) ) ( not ( = ?auto_464501 ?auto_464512 ) ) ( not ( = ?auto_464502 ?auto_464503 ) ) ( not ( = ?auto_464502 ?auto_464504 ) ) ( not ( = ?auto_464502 ?auto_464505 ) ) ( not ( = ?auto_464502 ?auto_464506 ) ) ( not ( = ?auto_464502 ?auto_464507 ) ) ( not ( = ?auto_464502 ?auto_464508 ) ) ( not ( = ?auto_464502 ?auto_464509 ) ) ( not ( = ?auto_464502 ?auto_464510 ) ) ( not ( = ?auto_464502 ?auto_464511 ) ) ( not ( = ?auto_464502 ?auto_464512 ) ) ( not ( = ?auto_464503 ?auto_464504 ) ) ( not ( = ?auto_464503 ?auto_464505 ) ) ( not ( = ?auto_464503 ?auto_464506 ) ) ( not ( = ?auto_464503 ?auto_464507 ) ) ( not ( = ?auto_464503 ?auto_464508 ) ) ( not ( = ?auto_464503 ?auto_464509 ) ) ( not ( = ?auto_464503 ?auto_464510 ) ) ( not ( = ?auto_464503 ?auto_464511 ) ) ( not ( = ?auto_464503 ?auto_464512 ) ) ( not ( = ?auto_464504 ?auto_464505 ) ) ( not ( = ?auto_464504 ?auto_464506 ) ) ( not ( = ?auto_464504 ?auto_464507 ) ) ( not ( = ?auto_464504 ?auto_464508 ) ) ( not ( = ?auto_464504 ?auto_464509 ) ) ( not ( = ?auto_464504 ?auto_464510 ) ) ( not ( = ?auto_464504 ?auto_464511 ) ) ( not ( = ?auto_464504 ?auto_464512 ) ) ( not ( = ?auto_464505 ?auto_464506 ) ) ( not ( = ?auto_464505 ?auto_464507 ) ) ( not ( = ?auto_464505 ?auto_464508 ) ) ( not ( = ?auto_464505 ?auto_464509 ) ) ( not ( = ?auto_464505 ?auto_464510 ) ) ( not ( = ?auto_464505 ?auto_464511 ) ) ( not ( = ?auto_464505 ?auto_464512 ) ) ( not ( = ?auto_464506 ?auto_464507 ) ) ( not ( = ?auto_464506 ?auto_464508 ) ) ( not ( = ?auto_464506 ?auto_464509 ) ) ( not ( = ?auto_464506 ?auto_464510 ) ) ( not ( = ?auto_464506 ?auto_464511 ) ) ( not ( = ?auto_464506 ?auto_464512 ) ) ( not ( = ?auto_464507 ?auto_464508 ) ) ( not ( = ?auto_464507 ?auto_464509 ) ) ( not ( = ?auto_464507 ?auto_464510 ) ) ( not ( = ?auto_464507 ?auto_464511 ) ) ( not ( = ?auto_464507 ?auto_464512 ) ) ( not ( = ?auto_464508 ?auto_464509 ) ) ( not ( = ?auto_464508 ?auto_464510 ) ) ( not ( = ?auto_464508 ?auto_464511 ) ) ( not ( = ?auto_464508 ?auto_464512 ) ) ( not ( = ?auto_464509 ?auto_464510 ) ) ( not ( = ?auto_464509 ?auto_464511 ) ) ( not ( = ?auto_464509 ?auto_464512 ) ) ( not ( = ?auto_464510 ?auto_464511 ) ) ( not ( = ?auto_464510 ?auto_464512 ) ) ( not ( = ?auto_464511 ?auto_464512 ) ) ( ON ?auto_464510 ?auto_464511 ) ( ON ?auto_464509 ?auto_464510 ) ( ON ?auto_464508 ?auto_464509 ) ( ON ?auto_464507 ?auto_464508 ) ( ON ?auto_464506 ?auto_464507 ) ( ON ?auto_464505 ?auto_464506 ) ( ON ?auto_464504 ?auto_464505 ) ( CLEAR ?auto_464502 ) ( ON ?auto_464503 ?auto_464504 ) ( CLEAR ?auto_464503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_464497 ?auto_464498 ?auto_464499 ?auto_464500 ?auto_464501 ?auto_464502 ?auto_464503 )
      ( MAKE-15PILE ?auto_464497 ?auto_464498 ?auto_464499 ?auto_464500 ?auto_464501 ?auto_464502 ?auto_464503 ?auto_464504 ?auto_464505 ?auto_464506 ?auto_464507 ?auto_464508 ?auto_464509 ?auto_464510 ?auto_464511 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464528 - BLOCK
      ?auto_464529 - BLOCK
      ?auto_464530 - BLOCK
      ?auto_464531 - BLOCK
      ?auto_464532 - BLOCK
      ?auto_464533 - BLOCK
      ?auto_464534 - BLOCK
      ?auto_464535 - BLOCK
      ?auto_464536 - BLOCK
      ?auto_464537 - BLOCK
      ?auto_464538 - BLOCK
      ?auto_464539 - BLOCK
      ?auto_464540 - BLOCK
      ?auto_464541 - BLOCK
      ?auto_464542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464542 ) ( ON-TABLE ?auto_464528 ) ( ON ?auto_464529 ?auto_464528 ) ( ON ?auto_464530 ?auto_464529 ) ( ON ?auto_464531 ?auto_464530 ) ( ON ?auto_464532 ?auto_464531 ) ( ON ?auto_464533 ?auto_464532 ) ( not ( = ?auto_464528 ?auto_464529 ) ) ( not ( = ?auto_464528 ?auto_464530 ) ) ( not ( = ?auto_464528 ?auto_464531 ) ) ( not ( = ?auto_464528 ?auto_464532 ) ) ( not ( = ?auto_464528 ?auto_464533 ) ) ( not ( = ?auto_464528 ?auto_464534 ) ) ( not ( = ?auto_464528 ?auto_464535 ) ) ( not ( = ?auto_464528 ?auto_464536 ) ) ( not ( = ?auto_464528 ?auto_464537 ) ) ( not ( = ?auto_464528 ?auto_464538 ) ) ( not ( = ?auto_464528 ?auto_464539 ) ) ( not ( = ?auto_464528 ?auto_464540 ) ) ( not ( = ?auto_464528 ?auto_464541 ) ) ( not ( = ?auto_464528 ?auto_464542 ) ) ( not ( = ?auto_464529 ?auto_464530 ) ) ( not ( = ?auto_464529 ?auto_464531 ) ) ( not ( = ?auto_464529 ?auto_464532 ) ) ( not ( = ?auto_464529 ?auto_464533 ) ) ( not ( = ?auto_464529 ?auto_464534 ) ) ( not ( = ?auto_464529 ?auto_464535 ) ) ( not ( = ?auto_464529 ?auto_464536 ) ) ( not ( = ?auto_464529 ?auto_464537 ) ) ( not ( = ?auto_464529 ?auto_464538 ) ) ( not ( = ?auto_464529 ?auto_464539 ) ) ( not ( = ?auto_464529 ?auto_464540 ) ) ( not ( = ?auto_464529 ?auto_464541 ) ) ( not ( = ?auto_464529 ?auto_464542 ) ) ( not ( = ?auto_464530 ?auto_464531 ) ) ( not ( = ?auto_464530 ?auto_464532 ) ) ( not ( = ?auto_464530 ?auto_464533 ) ) ( not ( = ?auto_464530 ?auto_464534 ) ) ( not ( = ?auto_464530 ?auto_464535 ) ) ( not ( = ?auto_464530 ?auto_464536 ) ) ( not ( = ?auto_464530 ?auto_464537 ) ) ( not ( = ?auto_464530 ?auto_464538 ) ) ( not ( = ?auto_464530 ?auto_464539 ) ) ( not ( = ?auto_464530 ?auto_464540 ) ) ( not ( = ?auto_464530 ?auto_464541 ) ) ( not ( = ?auto_464530 ?auto_464542 ) ) ( not ( = ?auto_464531 ?auto_464532 ) ) ( not ( = ?auto_464531 ?auto_464533 ) ) ( not ( = ?auto_464531 ?auto_464534 ) ) ( not ( = ?auto_464531 ?auto_464535 ) ) ( not ( = ?auto_464531 ?auto_464536 ) ) ( not ( = ?auto_464531 ?auto_464537 ) ) ( not ( = ?auto_464531 ?auto_464538 ) ) ( not ( = ?auto_464531 ?auto_464539 ) ) ( not ( = ?auto_464531 ?auto_464540 ) ) ( not ( = ?auto_464531 ?auto_464541 ) ) ( not ( = ?auto_464531 ?auto_464542 ) ) ( not ( = ?auto_464532 ?auto_464533 ) ) ( not ( = ?auto_464532 ?auto_464534 ) ) ( not ( = ?auto_464532 ?auto_464535 ) ) ( not ( = ?auto_464532 ?auto_464536 ) ) ( not ( = ?auto_464532 ?auto_464537 ) ) ( not ( = ?auto_464532 ?auto_464538 ) ) ( not ( = ?auto_464532 ?auto_464539 ) ) ( not ( = ?auto_464532 ?auto_464540 ) ) ( not ( = ?auto_464532 ?auto_464541 ) ) ( not ( = ?auto_464532 ?auto_464542 ) ) ( not ( = ?auto_464533 ?auto_464534 ) ) ( not ( = ?auto_464533 ?auto_464535 ) ) ( not ( = ?auto_464533 ?auto_464536 ) ) ( not ( = ?auto_464533 ?auto_464537 ) ) ( not ( = ?auto_464533 ?auto_464538 ) ) ( not ( = ?auto_464533 ?auto_464539 ) ) ( not ( = ?auto_464533 ?auto_464540 ) ) ( not ( = ?auto_464533 ?auto_464541 ) ) ( not ( = ?auto_464533 ?auto_464542 ) ) ( not ( = ?auto_464534 ?auto_464535 ) ) ( not ( = ?auto_464534 ?auto_464536 ) ) ( not ( = ?auto_464534 ?auto_464537 ) ) ( not ( = ?auto_464534 ?auto_464538 ) ) ( not ( = ?auto_464534 ?auto_464539 ) ) ( not ( = ?auto_464534 ?auto_464540 ) ) ( not ( = ?auto_464534 ?auto_464541 ) ) ( not ( = ?auto_464534 ?auto_464542 ) ) ( not ( = ?auto_464535 ?auto_464536 ) ) ( not ( = ?auto_464535 ?auto_464537 ) ) ( not ( = ?auto_464535 ?auto_464538 ) ) ( not ( = ?auto_464535 ?auto_464539 ) ) ( not ( = ?auto_464535 ?auto_464540 ) ) ( not ( = ?auto_464535 ?auto_464541 ) ) ( not ( = ?auto_464535 ?auto_464542 ) ) ( not ( = ?auto_464536 ?auto_464537 ) ) ( not ( = ?auto_464536 ?auto_464538 ) ) ( not ( = ?auto_464536 ?auto_464539 ) ) ( not ( = ?auto_464536 ?auto_464540 ) ) ( not ( = ?auto_464536 ?auto_464541 ) ) ( not ( = ?auto_464536 ?auto_464542 ) ) ( not ( = ?auto_464537 ?auto_464538 ) ) ( not ( = ?auto_464537 ?auto_464539 ) ) ( not ( = ?auto_464537 ?auto_464540 ) ) ( not ( = ?auto_464537 ?auto_464541 ) ) ( not ( = ?auto_464537 ?auto_464542 ) ) ( not ( = ?auto_464538 ?auto_464539 ) ) ( not ( = ?auto_464538 ?auto_464540 ) ) ( not ( = ?auto_464538 ?auto_464541 ) ) ( not ( = ?auto_464538 ?auto_464542 ) ) ( not ( = ?auto_464539 ?auto_464540 ) ) ( not ( = ?auto_464539 ?auto_464541 ) ) ( not ( = ?auto_464539 ?auto_464542 ) ) ( not ( = ?auto_464540 ?auto_464541 ) ) ( not ( = ?auto_464540 ?auto_464542 ) ) ( not ( = ?auto_464541 ?auto_464542 ) ) ( ON ?auto_464541 ?auto_464542 ) ( ON ?auto_464540 ?auto_464541 ) ( ON ?auto_464539 ?auto_464540 ) ( ON ?auto_464538 ?auto_464539 ) ( ON ?auto_464537 ?auto_464538 ) ( ON ?auto_464536 ?auto_464537 ) ( ON ?auto_464535 ?auto_464536 ) ( CLEAR ?auto_464533 ) ( ON ?auto_464534 ?auto_464535 ) ( CLEAR ?auto_464534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_464528 ?auto_464529 ?auto_464530 ?auto_464531 ?auto_464532 ?auto_464533 ?auto_464534 )
      ( MAKE-15PILE ?auto_464528 ?auto_464529 ?auto_464530 ?auto_464531 ?auto_464532 ?auto_464533 ?auto_464534 ?auto_464535 ?auto_464536 ?auto_464537 ?auto_464538 ?auto_464539 ?auto_464540 ?auto_464541 ?auto_464542 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464558 - BLOCK
      ?auto_464559 - BLOCK
      ?auto_464560 - BLOCK
      ?auto_464561 - BLOCK
      ?auto_464562 - BLOCK
      ?auto_464563 - BLOCK
      ?auto_464564 - BLOCK
      ?auto_464565 - BLOCK
      ?auto_464566 - BLOCK
      ?auto_464567 - BLOCK
      ?auto_464568 - BLOCK
      ?auto_464569 - BLOCK
      ?auto_464570 - BLOCK
      ?auto_464571 - BLOCK
      ?auto_464572 - BLOCK
    )
    :vars
    (
      ?auto_464573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464572 ?auto_464573 ) ( ON-TABLE ?auto_464558 ) ( ON ?auto_464559 ?auto_464558 ) ( ON ?auto_464560 ?auto_464559 ) ( ON ?auto_464561 ?auto_464560 ) ( ON ?auto_464562 ?auto_464561 ) ( not ( = ?auto_464558 ?auto_464559 ) ) ( not ( = ?auto_464558 ?auto_464560 ) ) ( not ( = ?auto_464558 ?auto_464561 ) ) ( not ( = ?auto_464558 ?auto_464562 ) ) ( not ( = ?auto_464558 ?auto_464563 ) ) ( not ( = ?auto_464558 ?auto_464564 ) ) ( not ( = ?auto_464558 ?auto_464565 ) ) ( not ( = ?auto_464558 ?auto_464566 ) ) ( not ( = ?auto_464558 ?auto_464567 ) ) ( not ( = ?auto_464558 ?auto_464568 ) ) ( not ( = ?auto_464558 ?auto_464569 ) ) ( not ( = ?auto_464558 ?auto_464570 ) ) ( not ( = ?auto_464558 ?auto_464571 ) ) ( not ( = ?auto_464558 ?auto_464572 ) ) ( not ( = ?auto_464558 ?auto_464573 ) ) ( not ( = ?auto_464559 ?auto_464560 ) ) ( not ( = ?auto_464559 ?auto_464561 ) ) ( not ( = ?auto_464559 ?auto_464562 ) ) ( not ( = ?auto_464559 ?auto_464563 ) ) ( not ( = ?auto_464559 ?auto_464564 ) ) ( not ( = ?auto_464559 ?auto_464565 ) ) ( not ( = ?auto_464559 ?auto_464566 ) ) ( not ( = ?auto_464559 ?auto_464567 ) ) ( not ( = ?auto_464559 ?auto_464568 ) ) ( not ( = ?auto_464559 ?auto_464569 ) ) ( not ( = ?auto_464559 ?auto_464570 ) ) ( not ( = ?auto_464559 ?auto_464571 ) ) ( not ( = ?auto_464559 ?auto_464572 ) ) ( not ( = ?auto_464559 ?auto_464573 ) ) ( not ( = ?auto_464560 ?auto_464561 ) ) ( not ( = ?auto_464560 ?auto_464562 ) ) ( not ( = ?auto_464560 ?auto_464563 ) ) ( not ( = ?auto_464560 ?auto_464564 ) ) ( not ( = ?auto_464560 ?auto_464565 ) ) ( not ( = ?auto_464560 ?auto_464566 ) ) ( not ( = ?auto_464560 ?auto_464567 ) ) ( not ( = ?auto_464560 ?auto_464568 ) ) ( not ( = ?auto_464560 ?auto_464569 ) ) ( not ( = ?auto_464560 ?auto_464570 ) ) ( not ( = ?auto_464560 ?auto_464571 ) ) ( not ( = ?auto_464560 ?auto_464572 ) ) ( not ( = ?auto_464560 ?auto_464573 ) ) ( not ( = ?auto_464561 ?auto_464562 ) ) ( not ( = ?auto_464561 ?auto_464563 ) ) ( not ( = ?auto_464561 ?auto_464564 ) ) ( not ( = ?auto_464561 ?auto_464565 ) ) ( not ( = ?auto_464561 ?auto_464566 ) ) ( not ( = ?auto_464561 ?auto_464567 ) ) ( not ( = ?auto_464561 ?auto_464568 ) ) ( not ( = ?auto_464561 ?auto_464569 ) ) ( not ( = ?auto_464561 ?auto_464570 ) ) ( not ( = ?auto_464561 ?auto_464571 ) ) ( not ( = ?auto_464561 ?auto_464572 ) ) ( not ( = ?auto_464561 ?auto_464573 ) ) ( not ( = ?auto_464562 ?auto_464563 ) ) ( not ( = ?auto_464562 ?auto_464564 ) ) ( not ( = ?auto_464562 ?auto_464565 ) ) ( not ( = ?auto_464562 ?auto_464566 ) ) ( not ( = ?auto_464562 ?auto_464567 ) ) ( not ( = ?auto_464562 ?auto_464568 ) ) ( not ( = ?auto_464562 ?auto_464569 ) ) ( not ( = ?auto_464562 ?auto_464570 ) ) ( not ( = ?auto_464562 ?auto_464571 ) ) ( not ( = ?auto_464562 ?auto_464572 ) ) ( not ( = ?auto_464562 ?auto_464573 ) ) ( not ( = ?auto_464563 ?auto_464564 ) ) ( not ( = ?auto_464563 ?auto_464565 ) ) ( not ( = ?auto_464563 ?auto_464566 ) ) ( not ( = ?auto_464563 ?auto_464567 ) ) ( not ( = ?auto_464563 ?auto_464568 ) ) ( not ( = ?auto_464563 ?auto_464569 ) ) ( not ( = ?auto_464563 ?auto_464570 ) ) ( not ( = ?auto_464563 ?auto_464571 ) ) ( not ( = ?auto_464563 ?auto_464572 ) ) ( not ( = ?auto_464563 ?auto_464573 ) ) ( not ( = ?auto_464564 ?auto_464565 ) ) ( not ( = ?auto_464564 ?auto_464566 ) ) ( not ( = ?auto_464564 ?auto_464567 ) ) ( not ( = ?auto_464564 ?auto_464568 ) ) ( not ( = ?auto_464564 ?auto_464569 ) ) ( not ( = ?auto_464564 ?auto_464570 ) ) ( not ( = ?auto_464564 ?auto_464571 ) ) ( not ( = ?auto_464564 ?auto_464572 ) ) ( not ( = ?auto_464564 ?auto_464573 ) ) ( not ( = ?auto_464565 ?auto_464566 ) ) ( not ( = ?auto_464565 ?auto_464567 ) ) ( not ( = ?auto_464565 ?auto_464568 ) ) ( not ( = ?auto_464565 ?auto_464569 ) ) ( not ( = ?auto_464565 ?auto_464570 ) ) ( not ( = ?auto_464565 ?auto_464571 ) ) ( not ( = ?auto_464565 ?auto_464572 ) ) ( not ( = ?auto_464565 ?auto_464573 ) ) ( not ( = ?auto_464566 ?auto_464567 ) ) ( not ( = ?auto_464566 ?auto_464568 ) ) ( not ( = ?auto_464566 ?auto_464569 ) ) ( not ( = ?auto_464566 ?auto_464570 ) ) ( not ( = ?auto_464566 ?auto_464571 ) ) ( not ( = ?auto_464566 ?auto_464572 ) ) ( not ( = ?auto_464566 ?auto_464573 ) ) ( not ( = ?auto_464567 ?auto_464568 ) ) ( not ( = ?auto_464567 ?auto_464569 ) ) ( not ( = ?auto_464567 ?auto_464570 ) ) ( not ( = ?auto_464567 ?auto_464571 ) ) ( not ( = ?auto_464567 ?auto_464572 ) ) ( not ( = ?auto_464567 ?auto_464573 ) ) ( not ( = ?auto_464568 ?auto_464569 ) ) ( not ( = ?auto_464568 ?auto_464570 ) ) ( not ( = ?auto_464568 ?auto_464571 ) ) ( not ( = ?auto_464568 ?auto_464572 ) ) ( not ( = ?auto_464568 ?auto_464573 ) ) ( not ( = ?auto_464569 ?auto_464570 ) ) ( not ( = ?auto_464569 ?auto_464571 ) ) ( not ( = ?auto_464569 ?auto_464572 ) ) ( not ( = ?auto_464569 ?auto_464573 ) ) ( not ( = ?auto_464570 ?auto_464571 ) ) ( not ( = ?auto_464570 ?auto_464572 ) ) ( not ( = ?auto_464570 ?auto_464573 ) ) ( not ( = ?auto_464571 ?auto_464572 ) ) ( not ( = ?auto_464571 ?auto_464573 ) ) ( not ( = ?auto_464572 ?auto_464573 ) ) ( ON ?auto_464571 ?auto_464572 ) ( ON ?auto_464570 ?auto_464571 ) ( ON ?auto_464569 ?auto_464570 ) ( ON ?auto_464568 ?auto_464569 ) ( ON ?auto_464567 ?auto_464568 ) ( ON ?auto_464566 ?auto_464567 ) ( ON ?auto_464565 ?auto_464566 ) ( ON ?auto_464564 ?auto_464565 ) ( CLEAR ?auto_464562 ) ( ON ?auto_464563 ?auto_464564 ) ( CLEAR ?auto_464563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_464558 ?auto_464559 ?auto_464560 ?auto_464561 ?auto_464562 ?auto_464563 )
      ( MAKE-15PILE ?auto_464558 ?auto_464559 ?auto_464560 ?auto_464561 ?auto_464562 ?auto_464563 ?auto_464564 ?auto_464565 ?auto_464566 ?auto_464567 ?auto_464568 ?auto_464569 ?auto_464570 ?auto_464571 ?auto_464572 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464589 - BLOCK
      ?auto_464590 - BLOCK
      ?auto_464591 - BLOCK
      ?auto_464592 - BLOCK
      ?auto_464593 - BLOCK
      ?auto_464594 - BLOCK
      ?auto_464595 - BLOCK
      ?auto_464596 - BLOCK
      ?auto_464597 - BLOCK
      ?auto_464598 - BLOCK
      ?auto_464599 - BLOCK
      ?auto_464600 - BLOCK
      ?auto_464601 - BLOCK
      ?auto_464602 - BLOCK
      ?auto_464603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464603 ) ( ON-TABLE ?auto_464589 ) ( ON ?auto_464590 ?auto_464589 ) ( ON ?auto_464591 ?auto_464590 ) ( ON ?auto_464592 ?auto_464591 ) ( ON ?auto_464593 ?auto_464592 ) ( not ( = ?auto_464589 ?auto_464590 ) ) ( not ( = ?auto_464589 ?auto_464591 ) ) ( not ( = ?auto_464589 ?auto_464592 ) ) ( not ( = ?auto_464589 ?auto_464593 ) ) ( not ( = ?auto_464589 ?auto_464594 ) ) ( not ( = ?auto_464589 ?auto_464595 ) ) ( not ( = ?auto_464589 ?auto_464596 ) ) ( not ( = ?auto_464589 ?auto_464597 ) ) ( not ( = ?auto_464589 ?auto_464598 ) ) ( not ( = ?auto_464589 ?auto_464599 ) ) ( not ( = ?auto_464589 ?auto_464600 ) ) ( not ( = ?auto_464589 ?auto_464601 ) ) ( not ( = ?auto_464589 ?auto_464602 ) ) ( not ( = ?auto_464589 ?auto_464603 ) ) ( not ( = ?auto_464590 ?auto_464591 ) ) ( not ( = ?auto_464590 ?auto_464592 ) ) ( not ( = ?auto_464590 ?auto_464593 ) ) ( not ( = ?auto_464590 ?auto_464594 ) ) ( not ( = ?auto_464590 ?auto_464595 ) ) ( not ( = ?auto_464590 ?auto_464596 ) ) ( not ( = ?auto_464590 ?auto_464597 ) ) ( not ( = ?auto_464590 ?auto_464598 ) ) ( not ( = ?auto_464590 ?auto_464599 ) ) ( not ( = ?auto_464590 ?auto_464600 ) ) ( not ( = ?auto_464590 ?auto_464601 ) ) ( not ( = ?auto_464590 ?auto_464602 ) ) ( not ( = ?auto_464590 ?auto_464603 ) ) ( not ( = ?auto_464591 ?auto_464592 ) ) ( not ( = ?auto_464591 ?auto_464593 ) ) ( not ( = ?auto_464591 ?auto_464594 ) ) ( not ( = ?auto_464591 ?auto_464595 ) ) ( not ( = ?auto_464591 ?auto_464596 ) ) ( not ( = ?auto_464591 ?auto_464597 ) ) ( not ( = ?auto_464591 ?auto_464598 ) ) ( not ( = ?auto_464591 ?auto_464599 ) ) ( not ( = ?auto_464591 ?auto_464600 ) ) ( not ( = ?auto_464591 ?auto_464601 ) ) ( not ( = ?auto_464591 ?auto_464602 ) ) ( not ( = ?auto_464591 ?auto_464603 ) ) ( not ( = ?auto_464592 ?auto_464593 ) ) ( not ( = ?auto_464592 ?auto_464594 ) ) ( not ( = ?auto_464592 ?auto_464595 ) ) ( not ( = ?auto_464592 ?auto_464596 ) ) ( not ( = ?auto_464592 ?auto_464597 ) ) ( not ( = ?auto_464592 ?auto_464598 ) ) ( not ( = ?auto_464592 ?auto_464599 ) ) ( not ( = ?auto_464592 ?auto_464600 ) ) ( not ( = ?auto_464592 ?auto_464601 ) ) ( not ( = ?auto_464592 ?auto_464602 ) ) ( not ( = ?auto_464592 ?auto_464603 ) ) ( not ( = ?auto_464593 ?auto_464594 ) ) ( not ( = ?auto_464593 ?auto_464595 ) ) ( not ( = ?auto_464593 ?auto_464596 ) ) ( not ( = ?auto_464593 ?auto_464597 ) ) ( not ( = ?auto_464593 ?auto_464598 ) ) ( not ( = ?auto_464593 ?auto_464599 ) ) ( not ( = ?auto_464593 ?auto_464600 ) ) ( not ( = ?auto_464593 ?auto_464601 ) ) ( not ( = ?auto_464593 ?auto_464602 ) ) ( not ( = ?auto_464593 ?auto_464603 ) ) ( not ( = ?auto_464594 ?auto_464595 ) ) ( not ( = ?auto_464594 ?auto_464596 ) ) ( not ( = ?auto_464594 ?auto_464597 ) ) ( not ( = ?auto_464594 ?auto_464598 ) ) ( not ( = ?auto_464594 ?auto_464599 ) ) ( not ( = ?auto_464594 ?auto_464600 ) ) ( not ( = ?auto_464594 ?auto_464601 ) ) ( not ( = ?auto_464594 ?auto_464602 ) ) ( not ( = ?auto_464594 ?auto_464603 ) ) ( not ( = ?auto_464595 ?auto_464596 ) ) ( not ( = ?auto_464595 ?auto_464597 ) ) ( not ( = ?auto_464595 ?auto_464598 ) ) ( not ( = ?auto_464595 ?auto_464599 ) ) ( not ( = ?auto_464595 ?auto_464600 ) ) ( not ( = ?auto_464595 ?auto_464601 ) ) ( not ( = ?auto_464595 ?auto_464602 ) ) ( not ( = ?auto_464595 ?auto_464603 ) ) ( not ( = ?auto_464596 ?auto_464597 ) ) ( not ( = ?auto_464596 ?auto_464598 ) ) ( not ( = ?auto_464596 ?auto_464599 ) ) ( not ( = ?auto_464596 ?auto_464600 ) ) ( not ( = ?auto_464596 ?auto_464601 ) ) ( not ( = ?auto_464596 ?auto_464602 ) ) ( not ( = ?auto_464596 ?auto_464603 ) ) ( not ( = ?auto_464597 ?auto_464598 ) ) ( not ( = ?auto_464597 ?auto_464599 ) ) ( not ( = ?auto_464597 ?auto_464600 ) ) ( not ( = ?auto_464597 ?auto_464601 ) ) ( not ( = ?auto_464597 ?auto_464602 ) ) ( not ( = ?auto_464597 ?auto_464603 ) ) ( not ( = ?auto_464598 ?auto_464599 ) ) ( not ( = ?auto_464598 ?auto_464600 ) ) ( not ( = ?auto_464598 ?auto_464601 ) ) ( not ( = ?auto_464598 ?auto_464602 ) ) ( not ( = ?auto_464598 ?auto_464603 ) ) ( not ( = ?auto_464599 ?auto_464600 ) ) ( not ( = ?auto_464599 ?auto_464601 ) ) ( not ( = ?auto_464599 ?auto_464602 ) ) ( not ( = ?auto_464599 ?auto_464603 ) ) ( not ( = ?auto_464600 ?auto_464601 ) ) ( not ( = ?auto_464600 ?auto_464602 ) ) ( not ( = ?auto_464600 ?auto_464603 ) ) ( not ( = ?auto_464601 ?auto_464602 ) ) ( not ( = ?auto_464601 ?auto_464603 ) ) ( not ( = ?auto_464602 ?auto_464603 ) ) ( ON ?auto_464602 ?auto_464603 ) ( ON ?auto_464601 ?auto_464602 ) ( ON ?auto_464600 ?auto_464601 ) ( ON ?auto_464599 ?auto_464600 ) ( ON ?auto_464598 ?auto_464599 ) ( ON ?auto_464597 ?auto_464598 ) ( ON ?auto_464596 ?auto_464597 ) ( ON ?auto_464595 ?auto_464596 ) ( CLEAR ?auto_464593 ) ( ON ?auto_464594 ?auto_464595 ) ( CLEAR ?auto_464594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_464589 ?auto_464590 ?auto_464591 ?auto_464592 ?auto_464593 ?auto_464594 )
      ( MAKE-15PILE ?auto_464589 ?auto_464590 ?auto_464591 ?auto_464592 ?auto_464593 ?auto_464594 ?auto_464595 ?auto_464596 ?auto_464597 ?auto_464598 ?auto_464599 ?auto_464600 ?auto_464601 ?auto_464602 ?auto_464603 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464619 - BLOCK
      ?auto_464620 - BLOCK
      ?auto_464621 - BLOCK
      ?auto_464622 - BLOCK
      ?auto_464623 - BLOCK
      ?auto_464624 - BLOCK
      ?auto_464625 - BLOCK
      ?auto_464626 - BLOCK
      ?auto_464627 - BLOCK
      ?auto_464628 - BLOCK
      ?auto_464629 - BLOCK
      ?auto_464630 - BLOCK
      ?auto_464631 - BLOCK
      ?auto_464632 - BLOCK
      ?auto_464633 - BLOCK
    )
    :vars
    (
      ?auto_464634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464633 ?auto_464634 ) ( ON-TABLE ?auto_464619 ) ( ON ?auto_464620 ?auto_464619 ) ( ON ?auto_464621 ?auto_464620 ) ( ON ?auto_464622 ?auto_464621 ) ( not ( = ?auto_464619 ?auto_464620 ) ) ( not ( = ?auto_464619 ?auto_464621 ) ) ( not ( = ?auto_464619 ?auto_464622 ) ) ( not ( = ?auto_464619 ?auto_464623 ) ) ( not ( = ?auto_464619 ?auto_464624 ) ) ( not ( = ?auto_464619 ?auto_464625 ) ) ( not ( = ?auto_464619 ?auto_464626 ) ) ( not ( = ?auto_464619 ?auto_464627 ) ) ( not ( = ?auto_464619 ?auto_464628 ) ) ( not ( = ?auto_464619 ?auto_464629 ) ) ( not ( = ?auto_464619 ?auto_464630 ) ) ( not ( = ?auto_464619 ?auto_464631 ) ) ( not ( = ?auto_464619 ?auto_464632 ) ) ( not ( = ?auto_464619 ?auto_464633 ) ) ( not ( = ?auto_464619 ?auto_464634 ) ) ( not ( = ?auto_464620 ?auto_464621 ) ) ( not ( = ?auto_464620 ?auto_464622 ) ) ( not ( = ?auto_464620 ?auto_464623 ) ) ( not ( = ?auto_464620 ?auto_464624 ) ) ( not ( = ?auto_464620 ?auto_464625 ) ) ( not ( = ?auto_464620 ?auto_464626 ) ) ( not ( = ?auto_464620 ?auto_464627 ) ) ( not ( = ?auto_464620 ?auto_464628 ) ) ( not ( = ?auto_464620 ?auto_464629 ) ) ( not ( = ?auto_464620 ?auto_464630 ) ) ( not ( = ?auto_464620 ?auto_464631 ) ) ( not ( = ?auto_464620 ?auto_464632 ) ) ( not ( = ?auto_464620 ?auto_464633 ) ) ( not ( = ?auto_464620 ?auto_464634 ) ) ( not ( = ?auto_464621 ?auto_464622 ) ) ( not ( = ?auto_464621 ?auto_464623 ) ) ( not ( = ?auto_464621 ?auto_464624 ) ) ( not ( = ?auto_464621 ?auto_464625 ) ) ( not ( = ?auto_464621 ?auto_464626 ) ) ( not ( = ?auto_464621 ?auto_464627 ) ) ( not ( = ?auto_464621 ?auto_464628 ) ) ( not ( = ?auto_464621 ?auto_464629 ) ) ( not ( = ?auto_464621 ?auto_464630 ) ) ( not ( = ?auto_464621 ?auto_464631 ) ) ( not ( = ?auto_464621 ?auto_464632 ) ) ( not ( = ?auto_464621 ?auto_464633 ) ) ( not ( = ?auto_464621 ?auto_464634 ) ) ( not ( = ?auto_464622 ?auto_464623 ) ) ( not ( = ?auto_464622 ?auto_464624 ) ) ( not ( = ?auto_464622 ?auto_464625 ) ) ( not ( = ?auto_464622 ?auto_464626 ) ) ( not ( = ?auto_464622 ?auto_464627 ) ) ( not ( = ?auto_464622 ?auto_464628 ) ) ( not ( = ?auto_464622 ?auto_464629 ) ) ( not ( = ?auto_464622 ?auto_464630 ) ) ( not ( = ?auto_464622 ?auto_464631 ) ) ( not ( = ?auto_464622 ?auto_464632 ) ) ( not ( = ?auto_464622 ?auto_464633 ) ) ( not ( = ?auto_464622 ?auto_464634 ) ) ( not ( = ?auto_464623 ?auto_464624 ) ) ( not ( = ?auto_464623 ?auto_464625 ) ) ( not ( = ?auto_464623 ?auto_464626 ) ) ( not ( = ?auto_464623 ?auto_464627 ) ) ( not ( = ?auto_464623 ?auto_464628 ) ) ( not ( = ?auto_464623 ?auto_464629 ) ) ( not ( = ?auto_464623 ?auto_464630 ) ) ( not ( = ?auto_464623 ?auto_464631 ) ) ( not ( = ?auto_464623 ?auto_464632 ) ) ( not ( = ?auto_464623 ?auto_464633 ) ) ( not ( = ?auto_464623 ?auto_464634 ) ) ( not ( = ?auto_464624 ?auto_464625 ) ) ( not ( = ?auto_464624 ?auto_464626 ) ) ( not ( = ?auto_464624 ?auto_464627 ) ) ( not ( = ?auto_464624 ?auto_464628 ) ) ( not ( = ?auto_464624 ?auto_464629 ) ) ( not ( = ?auto_464624 ?auto_464630 ) ) ( not ( = ?auto_464624 ?auto_464631 ) ) ( not ( = ?auto_464624 ?auto_464632 ) ) ( not ( = ?auto_464624 ?auto_464633 ) ) ( not ( = ?auto_464624 ?auto_464634 ) ) ( not ( = ?auto_464625 ?auto_464626 ) ) ( not ( = ?auto_464625 ?auto_464627 ) ) ( not ( = ?auto_464625 ?auto_464628 ) ) ( not ( = ?auto_464625 ?auto_464629 ) ) ( not ( = ?auto_464625 ?auto_464630 ) ) ( not ( = ?auto_464625 ?auto_464631 ) ) ( not ( = ?auto_464625 ?auto_464632 ) ) ( not ( = ?auto_464625 ?auto_464633 ) ) ( not ( = ?auto_464625 ?auto_464634 ) ) ( not ( = ?auto_464626 ?auto_464627 ) ) ( not ( = ?auto_464626 ?auto_464628 ) ) ( not ( = ?auto_464626 ?auto_464629 ) ) ( not ( = ?auto_464626 ?auto_464630 ) ) ( not ( = ?auto_464626 ?auto_464631 ) ) ( not ( = ?auto_464626 ?auto_464632 ) ) ( not ( = ?auto_464626 ?auto_464633 ) ) ( not ( = ?auto_464626 ?auto_464634 ) ) ( not ( = ?auto_464627 ?auto_464628 ) ) ( not ( = ?auto_464627 ?auto_464629 ) ) ( not ( = ?auto_464627 ?auto_464630 ) ) ( not ( = ?auto_464627 ?auto_464631 ) ) ( not ( = ?auto_464627 ?auto_464632 ) ) ( not ( = ?auto_464627 ?auto_464633 ) ) ( not ( = ?auto_464627 ?auto_464634 ) ) ( not ( = ?auto_464628 ?auto_464629 ) ) ( not ( = ?auto_464628 ?auto_464630 ) ) ( not ( = ?auto_464628 ?auto_464631 ) ) ( not ( = ?auto_464628 ?auto_464632 ) ) ( not ( = ?auto_464628 ?auto_464633 ) ) ( not ( = ?auto_464628 ?auto_464634 ) ) ( not ( = ?auto_464629 ?auto_464630 ) ) ( not ( = ?auto_464629 ?auto_464631 ) ) ( not ( = ?auto_464629 ?auto_464632 ) ) ( not ( = ?auto_464629 ?auto_464633 ) ) ( not ( = ?auto_464629 ?auto_464634 ) ) ( not ( = ?auto_464630 ?auto_464631 ) ) ( not ( = ?auto_464630 ?auto_464632 ) ) ( not ( = ?auto_464630 ?auto_464633 ) ) ( not ( = ?auto_464630 ?auto_464634 ) ) ( not ( = ?auto_464631 ?auto_464632 ) ) ( not ( = ?auto_464631 ?auto_464633 ) ) ( not ( = ?auto_464631 ?auto_464634 ) ) ( not ( = ?auto_464632 ?auto_464633 ) ) ( not ( = ?auto_464632 ?auto_464634 ) ) ( not ( = ?auto_464633 ?auto_464634 ) ) ( ON ?auto_464632 ?auto_464633 ) ( ON ?auto_464631 ?auto_464632 ) ( ON ?auto_464630 ?auto_464631 ) ( ON ?auto_464629 ?auto_464630 ) ( ON ?auto_464628 ?auto_464629 ) ( ON ?auto_464627 ?auto_464628 ) ( ON ?auto_464626 ?auto_464627 ) ( ON ?auto_464625 ?auto_464626 ) ( ON ?auto_464624 ?auto_464625 ) ( CLEAR ?auto_464622 ) ( ON ?auto_464623 ?auto_464624 ) ( CLEAR ?auto_464623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_464619 ?auto_464620 ?auto_464621 ?auto_464622 ?auto_464623 )
      ( MAKE-15PILE ?auto_464619 ?auto_464620 ?auto_464621 ?auto_464622 ?auto_464623 ?auto_464624 ?auto_464625 ?auto_464626 ?auto_464627 ?auto_464628 ?auto_464629 ?auto_464630 ?auto_464631 ?auto_464632 ?auto_464633 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464650 - BLOCK
      ?auto_464651 - BLOCK
      ?auto_464652 - BLOCK
      ?auto_464653 - BLOCK
      ?auto_464654 - BLOCK
      ?auto_464655 - BLOCK
      ?auto_464656 - BLOCK
      ?auto_464657 - BLOCK
      ?auto_464658 - BLOCK
      ?auto_464659 - BLOCK
      ?auto_464660 - BLOCK
      ?auto_464661 - BLOCK
      ?auto_464662 - BLOCK
      ?auto_464663 - BLOCK
      ?auto_464664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464664 ) ( ON-TABLE ?auto_464650 ) ( ON ?auto_464651 ?auto_464650 ) ( ON ?auto_464652 ?auto_464651 ) ( ON ?auto_464653 ?auto_464652 ) ( not ( = ?auto_464650 ?auto_464651 ) ) ( not ( = ?auto_464650 ?auto_464652 ) ) ( not ( = ?auto_464650 ?auto_464653 ) ) ( not ( = ?auto_464650 ?auto_464654 ) ) ( not ( = ?auto_464650 ?auto_464655 ) ) ( not ( = ?auto_464650 ?auto_464656 ) ) ( not ( = ?auto_464650 ?auto_464657 ) ) ( not ( = ?auto_464650 ?auto_464658 ) ) ( not ( = ?auto_464650 ?auto_464659 ) ) ( not ( = ?auto_464650 ?auto_464660 ) ) ( not ( = ?auto_464650 ?auto_464661 ) ) ( not ( = ?auto_464650 ?auto_464662 ) ) ( not ( = ?auto_464650 ?auto_464663 ) ) ( not ( = ?auto_464650 ?auto_464664 ) ) ( not ( = ?auto_464651 ?auto_464652 ) ) ( not ( = ?auto_464651 ?auto_464653 ) ) ( not ( = ?auto_464651 ?auto_464654 ) ) ( not ( = ?auto_464651 ?auto_464655 ) ) ( not ( = ?auto_464651 ?auto_464656 ) ) ( not ( = ?auto_464651 ?auto_464657 ) ) ( not ( = ?auto_464651 ?auto_464658 ) ) ( not ( = ?auto_464651 ?auto_464659 ) ) ( not ( = ?auto_464651 ?auto_464660 ) ) ( not ( = ?auto_464651 ?auto_464661 ) ) ( not ( = ?auto_464651 ?auto_464662 ) ) ( not ( = ?auto_464651 ?auto_464663 ) ) ( not ( = ?auto_464651 ?auto_464664 ) ) ( not ( = ?auto_464652 ?auto_464653 ) ) ( not ( = ?auto_464652 ?auto_464654 ) ) ( not ( = ?auto_464652 ?auto_464655 ) ) ( not ( = ?auto_464652 ?auto_464656 ) ) ( not ( = ?auto_464652 ?auto_464657 ) ) ( not ( = ?auto_464652 ?auto_464658 ) ) ( not ( = ?auto_464652 ?auto_464659 ) ) ( not ( = ?auto_464652 ?auto_464660 ) ) ( not ( = ?auto_464652 ?auto_464661 ) ) ( not ( = ?auto_464652 ?auto_464662 ) ) ( not ( = ?auto_464652 ?auto_464663 ) ) ( not ( = ?auto_464652 ?auto_464664 ) ) ( not ( = ?auto_464653 ?auto_464654 ) ) ( not ( = ?auto_464653 ?auto_464655 ) ) ( not ( = ?auto_464653 ?auto_464656 ) ) ( not ( = ?auto_464653 ?auto_464657 ) ) ( not ( = ?auto_464653 ?auto_464658 ) ) ( not ( = ?auto_464653 ?auto_464659 ) ) ( not ( = ?auto_464653 ?auto_464660 ) ) ( not ( = ?auto_464653 ?auto_464661 ) ) ( not ( = ?auto_464653 ?auto_464662 ) ) ( not ( = ?auto_464653 ?auto_464663 ) ) ( not ( = ?auto_464653 ?auto_464664 ) ) ( not ( = ?auto_464654 ?auto_464655 ) ) ( not ( = ?auto_464654 ?auto_464656 ) ) ( not ( = ?auto_464654 ?auto_464657 ) ) ( not ( = ?auto_464654 ?auto_464658 ) ) ( not ( = ?auto_464654 ?auto_464659 ) ) ( not ( = ?auto_464654 ?auto_464660 ) ) ( not ( = ?auto_464654 ?auto_464661 ) ) ( not ( = ?auto_464654 ?auto_464662 ) ) ( not ( = ?auto_464654 ?auto_464663 ) ) ( not ( = ?auto_464654 ?auto_464664 ) ) ( not ( = ?auto_464655 ?auto_464656 ) ) ( not ( = ?auto_464655 ?auto_464657 ) ) ( not ( = ?auto_464655 ?auto_464658 ) ) ( not ( = ?auto_464655 ?auto_464659 ) ) ( not ( = ?auto_464655 ?auto_464660 ) ) ( not ( = ?auto_464655 ?auto_464661 ) ) ( not ( = ?auto_464655 ?auto_464662 ) ) ( not ( = ?auto_464655 ?auto_464663 ) ) ( not ( = ?auto_464655 ?auto_464664 ) ) ( not ( = ?auto_464656 ?auto_464657 ) ) ( not ( = ?auto_464656 ?auto_464658 ) ) ( not ( = ?auto_464656 ?auto_464659 ) ) ( not ( = ?auto_464656 ?auto_464660 ) ) ( not ( = ?auto_464656 ?auto_464661 ) ) ( not ( = ?auto_464656 ?auto_464662 ) ) ( not ( = ?auto_464656 ?auto_464663 ) ) ( not ( = ?auto_464656 ?auto_464664 ) ) ( not ( = ?auto_464657 ?auto_464658 ) ) ( not ( = ?auto_464657 ?auto_464659 ) ) ( not ( = ?auto_464657 ?auto_464660 ) ) ( not ( = ?auto_464657 ?auto_464661 ) ) ( not ( = ?auto_464657 ?auto_464662 ) ) ( not ( = ?auto_464657 ?auto_464663 ) ) ( not ( = ?auto_464657 ?auto_464664 ) ) ( not ( = ?auto_464658 ?auto_464659 ) ) ( not ( = ?auto_464658 ?auto_464660 ) ) ( not ( = ?auto_464658 ?auto_464661 ) ) ( not ( = ?auto_464658 ?auto_464662 ) ) ( not ( = ?auto_464658 ?auto_464663 ) ) ( not ( = ?auto_464658 ?auto_464664 ) ) ( not ( = ?auto_464659 ?auto_464660 ) ) ( not ( = ?auto_464659 ?auto_464661 ) ) ( not ( = ?auto_464659 ?auto_464662 ) ) ( not ( = ?auto_464659 ?auto_464663 ) ) ( not ( = ?auto_464659 ?auto_464664 ) ) ( not ( = ?auto_464660 ?auto_464661 ) ) ( not ( = ?auto_464660 ?auto_464662 ) ) ( not ( = ?auto_464660 ?auto_464663 ) ) ( not ( = ?auto_464660 ?auto_464664 ) ) ( not ( = ?auto_464661 ?auto_464662 ) ) ( not ( = ?auto_464661 ?auto_464663 ) ) ( not ( = ?auto_464661 ?auto_464664 ) ) ( not ( = ?auto_464662 ?auto_464663 ) ) ( not ( = ?auto_464662 ?auto_464664 ) ) ( not ( = ?auto_464663 ?auto_464664 ) ) ( ON ?auto_464663 ?auto_464664 ) ( ON ?auto_464662 ?auto_464663 ) ( ON ?auto_464661 ?auto_464662 ) ( ON ?auto_464660 ?auto_464661 ) ( ON ?auto_464659 ?auto_464660 ) ( ON ?auto_464658 ?auto_464659 ) ( ON ?auto_464657 ?auto_464658 ) ( ON ?auto_464656 ?auto_464657 ) ( ON ?auto_464655 ?auto_464656 ) ( CLEAR ?auto_464653 ) ( ON ?auto_464654 ?auto_464655 ) ( CLEAR ?auto_464654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_464650 ?auto_464651 ?auto_464652 ?auto_464653 ?auto_464654 )
      ( MAKE-15PILE ?auto_464650 ?auto_464651 ?auto_464652 ?auto_464653 ?auto_464654 ?auto_464655 ?auto_464656 ?auto_464657 ?auto_464658 ?auto_464659 ?auto_464660 ?auto_464661 ?auto_464662 ?auto_464663 ?auto_464664 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464680 - BLOCK
      ?auto_464681 - BLOCK
      ?auto_464682 - BLOCK
      ?auto_464683 - BLOCK
      ?auto_464684 - BLOCK
      ?auto_464685 - BLOCK
      ?auto_464686 - BLOCK
      ?auto_464687 - BLOCK
      ?auto_464688 - BLOCK
      ?auto_464689 - BLOCK
      ?auto_464690 - BLOCK
      ?auto_464691 - BLOCK
      ?auto_464692 - BLOCK
      ?auto_464693 - BLOCK
      ?auto_464694 - BLOCK
    )
    :vars
    (
      ?auto_464695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464694 ?auto_464695 ) ( ON-TABLE ?auto_464680 ) ( ON ?auto_464681 ?auto_464680 ) ( ON ?auto_464682 ?auto_464681 ) ( not ( = ?auto_464680 ?auto_464681 ) ) ( not ( = ?auto_464680 ?auto_464682 ) ) ( not ( = ?auto_464680 ?auto_464683 ) ) ( not ( = ?auto_464680 ?auto_464684 ) ) ( not ( = ?auto_464680 ?auto_464685 ) ) ( not ( = ?auto_464680 ?auto_464686 ) ) ( not ( = ?auto_464680 ?auto_464687 ) ) ( not ( = ?auto_464680 ?auto_464688 ) ) ( not ( = ?auto_464680 ?auto_464689 ) ) ( not ( = ?auto_464680 ?auto_464690 ) ) ( not ( = ?auto_464680 ?auto_464691 ) ) ( not ( = ?auto_464680 ?auto_464692 ) ) ( not ( = ?auto_464680 ?auto_464693 ) ) ( not ( = ?auto_464680 ?auto_464694 ) ) ( not ( = ?auto_464680 ?auto_464695 ) ) ( not ( = ?auto_464681 ?auto_464682 ) ) ( not ( = ?auto_464681 ?auto_464683 ) ) ( not ( = ?auto_464681 ?auto_464684 ) ) ( not ( = ?auto_464681 ?auto_464685 ) ) ( not ( = ?auto_464681 ?auto_464686 ) ) ( not ( = ?auto_464681 ?auto_464687 ) ) ( not ( = ?auto_464681 ?auto_464688 ) ) ( not ( = ?auto_464681 ?auto_464689 ) ) ( not ( = ?auto_464681 ?auto_464690 ) ) ( not ( = ?auto_464681 ?auto_464691 ) ) ( not ( = ?auto_464681 ?auto_464692 ) ) ( not ( = ?auto_464681 ?auto_464693 ) ) ( not ( = ?auto_464681 ?auto_464694 ) ) ( not ( = ?auto_464681 ?auto_464695 ) ) ( not ( = ?auto_464682 ?auto_464683 ) ) ( not ( = ?auto_464682 ?auto_464684 ) ) ( not ( = ?auto_464682 ?auto_464685 ) ) ( not ( = ?auto_464682 ?auto_464686 ) ) ( not ( = ?auto_464682 ?auto_464687 ) ) ( not ( = ?auto_464682 ?auto_464688 ) ) ( not ( = ?auto_464682 ?auto_464689 ) ) ( not ( = ?auto_464682 ?auto_464690 ) ) ( not ( = ?auto_464682 ?auto_464691 ) ) ( not ( = ?auto_464682 ?auto_464692 ) ) ( not ( = ?auto_464682 ?auto_464693 ) ) ( not ( = ?auto_464682 ?auto_464694 ) ) ( not ( = ?auto_464682 ?auto_464695 ) ) ( not ( = ?auto_464683 ?auto_464684 ) ) ( not ( = ?auto_464683 ?auto_464685 ) ) ( not ( = ?auto_464683 ?auto_464686 ) ) ( not ( = ?auto_464683 ?auto_464687 ) ) ( not ( = ?auto_464683 ?auto_464688 ) ) ( not ( = ?auto_464683 ?auto_464689 ) ) ( not ( = ?auto_464683 ?auto_464690 ) ) ( not ( = ?auto_464683 ?auto_464691 ) ) ( not ( = ?auto_464683 ?auto_464692 ) ) ( not ( = ?auto_464683 ?auto_464693 ) ) ( not ( = ?auto_464683 ?auto_464694 ) ) ( not ( = ?auto_464683 ?auto_464695 ) ) ( not ( = ?auto_464684 ?auto_464685 ) ) ( not ( = ?auto_464684 ?auto_464686 ) ) ( not ( = ?auto_464684 ?auto_464687 ) ) ( not ( = ?auto_464684 ?auto_464688 ) ) ( not ( = ?auto_464684 ?auto_464689 ) ) ( not ( = ?auto_464684 ?auto_464690 ) ) ( not ( = ?auto_464684 ?auto_464691 ) ) ( not ( = ?auto_464684 ?auto_464692 ) ) ( not ( = ?auto_464684 ?auto_464693 ) ) ( not ( = ?auto_464684 ?auto_464694 ) ) ( not ( = ?auto_464684 ?auto_464695 ) ) ( not ( = ?auto_464685 ?auto_464686 ) ) ( not ( = ?auto_464685 ?auto_464687 ) ) ( not ( = ?auto_464685 ?auto_464688 ) ) ( not ( = ?auto_464685 ?auto_464689 ) ) ( not ( = ?auto_464685 ?auto_464690 ) ) ( not ( = ?auto_464685 ?auto_464691 ) ) ( not ( = ?auto_464685 ?auto_464692 ) ) ( not ( = ?auto_464685 ?auto_464693 ) ) ( not ( = ?auto_464685 ?auto_464694 ) ) ( not ( = ?auto_464685 ?auto_464695 ) ) ( not ( = ?auto_464686 ?auto_464687 ) ) ( not ( = ?auto_464686 ?auto_464688 ) ) ( not ( = ?auto_464686 ?auto_464689 ) ) ( not ( = ?auto_464686 ?auto_464690 ) ) ( not ( = ?auto_464686 ?auto_464691 ) ) ( not ( = ?auto_464686 ?auto_464692 ) ) ( not ( = ?auto_464686 ?auto_464693 ) ) ( not ( = ?auto_464686 ?auto_464694 ) ) ( not ( = ?auto_464686 ?auto_464695 ) ) ( not ( = ?auto_464687 ?auto_464688 ) ) ( not ( = ?auto_464687 ?auto_464689 ) ) ( not ( = ?auto_464687 ?auto_464690 ) ) ( not ( = ?auto_464687 ?auto_464691 ) ) ( not ( = ?auto_464687 ?auto_464692 ) ) ( not ( = ?auto_464687 ?auto_464693 ) ) ( not ( = ?auto_464687 ?auto_464694 ) ) ( not ( = ?auto_464687 ?auto_464695 ) ) ( not ( = ?auto_464688 ?auto_464689 ) ) ( not ( = ?auto_464688 ?auto_464690 ) ) ( not ( = ?auto_464688 ?auto_464691 ) ) ( not ( = ?auto_464688 ?auto_464692 ) ) ( not ( = ?auto_464688 ?auto_464693 ) ) ( not ( = ?auto_464688 ?auto_464694 ) ) ( not ( = ?auto_464688 ?auto_464695 ) ) ( not ( = ?auto_464689 ?auto_464690 ) ) ( not ( = ?auto_464689 ?auto_464691 ) ) ( not ( = ?auto_464689 ?auto_464692 ) ) ( not ( = ?auto_464689 ?auto_464693 ) ) ( not ( = ?auto_464689 ?auto_464694 ) ) ( not ( = ?auto_464689 ?auto_464695 ) ) ( not ( = ?auto_464690 ?auto_464691 ) ) ( not ( = ?auto_464690 ?auto_464692 ) ) ( not ( = ?auto_464690 ?auto_464693 ) ) ( not ( = ?auto_464690 ?auto_464694 ) ) ( not ( = ?auto_464690 ?auto_464695 ) ) ( not ( = ?auto_464691 ?auto_464692 ) ) ( not ( = ?auto_464691 ?auto_464693 ) ) ( not ( = ?auto_464691 ?auto_464694 ) ) ( not ( = ?auto_464691 ?auto_464695 ) ) ( not ( = ?auto_464692 ?auto_464693 ) ) ( not ( = ?auto_464692 ?auto_464694 ) ) ( not ( = ?auto_464692 ?auto_464695 ) ) ( not ( = ?auto_464693 ?auto_464694 ) ) ( not ( = ?auto_464693 ?auto_464695 ) ) ( not ( = ?auto_464694 ?auto_464695 ) ) ( ON ?auto_464693 ?auto_464694 ) ( ON ?auto_464692 ?auto_464693 ) ( ON ?auto_464691 ?auto_464692 ) ( ON ?auto_464690 ?auto_464691 ) ( ON ?auto_464689 ?auto_464690 ) ( ON ?auto_464688 ?auto_464689 ) ( ON ?auto_464687 ?auto_464688 ) ( ON ?auto_464686 ?auto_464687 ) ( ON ?auto_464685 ?auto_464686 ) ( ON ?auto_464684 ?auto_464685 ) ( CLEAR ?auto_464682 ) ( ON ?auto_464683 ?auto_464684 ) ( CLEAR ?auto_464683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_464680 ?auto_464681 ?auto_464682 ?auto_464683 )
      ( MAKE-15PILE ?auto_464680 ?auto_464681 ?auto_464682 ?auto_464683 ?auto_464684 ?auto_464685 ?auto_464686 ?auto_464687 ?auto_464688 ?auto_464689 ?auto_464690 ?auto_464691 ?auto_464692 ?auto_464693 ?auto_464694 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464711 - BLOCK
      ?auto_464712 - BLOCK
      ?auto_464713 - BLOCK
      ?auto_464714 - BLOCK
      ?auto_464715 - BLOCK
      ?auto_464716 - BLOCK
      ?auto_464717 - BLOCK
      ?auto_464718 - BLOCK
      ?auto_464719 - BLOCK
      ?auto_464720 - BLOCK
      ?auto_464721 - BLOCK
      ?auto_464722 - BLOCK
      ?auto_464723 - BLOCK
      ?auto_464724 - BLOCK
      ?auto_464725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464725 ) ( ON-TABLE ?auto_464711 ) ( ON ?auto_464712 ?auto_464711 ) ( ON ?auto_464713 ?auto_464712 ) ( not ( = ?auto_464711 ?auto_464712 ) ) ( not ( = ?auto_464711 ?auto_464713 ) ) ( not ( = ?auto_464711 ?auto_464714 ) ) ( not ( = ?auto_464711 ?auto_464715 ) ) ( not ( = ?auto_464711 ?auto_464716 ) ) ( not ( = ?auto_464711 ?auto_464717 ) ) ( not ( = ?auto_464711 ?auto_464718 ) ) ( not ( = ?auto_464711 ?auto_464719 ) ) ( not ( = ?auto_464711 ?auto_464720 ) ) ( not ( = ?auto_464711 ?auto_464721 ) ) ( not ( = ?auto_464711 ?auto_464722 ) ) ( not ( = ?auto_464711 ?auto_464723 ) ) ( not ( = ?auto_464711 ?auto_464724 ) ) ( not ( = ?auto_464711 ?auto_464725 ) ) ( not ( = ?auto_464712 ?auto_464713 ) ) ( not ( = ?auto_464712 ?auto_464714 ) ) ( not ( = ?auto_464712 ?auto_464715 ) ) ( not ( = ?auto_464712 ?auto_464716 ) ) ( not ( = ?auto_464712 ?auto_464717 ) ) ( not ( = ?auto_464712 ?auto_464718 ) ) ( not ( = ?auto_464712 ?auto_464719 ) ) ( not ( = ?auto_464712 ?auto_464720 ) ) ( not ( = ?auto_464712 ?auto_464721 ) ) ( not ( = ?auto_464712 ?auto_464722 ) ) ( not ( = ?auto_464712 ?auto_464723 ) ) ( not ( = ?auto_464712 ?auto_464724 ) ) ( not ( = ?auto_464712 ?auto_464725 ) ) ( not ( = ?auto_464713 ?auto_464714 ) ) ( not ( = ?auto_464713 ?auto_464715 ) ) ( not ( = ?auto_464713 ?auto_464716 ) ) ( not ( = ?auto_464713 ?auto_464717 ) ) ( not ( = ?auto_464713 ?auto_464718 ) ) ( not ( = ?auto_464713 ?auto_464719 ) ) ( not ( = ?auto_464713 ?auto_464720 ) ) ( not ( = ?auto_464713 ?auto_464721 ) ) ( not ( = ?auto_464713 ?auto_464722 ) ) ( not ( = ?auto_464713 ?auto_464723 ) ) ( not ( = ?auto_464713 ?auto_464724 ) ) ( not ( = ?auto_464713 ?auto_464725 ) ) ( not ( = ?auto_464714 ?auto_464715 ) ) ( not ( = ?auto_464714 ?auto_464716 ) ) ( not ( = ?auto_464714 ?auto_464717 ) ) ( not ( = ?auto_464714 ?auto_464718 ) ) ( not ( = ?auto_464714 ?auto_464719 ) ) ( not ( = ?auto_464714 ?auto_464720 ) ) ( not ( = ?auto_464714 ?auto_464721 ) ) ( not ( = ?auto_464714 ?auto_464722 ) ) ( not ( = ?auto_464714 ?auto_464723 ) ) ( not ( = ?auto_464714 ?auto_464724 ) ) ( not ( = ?auto_464714 ?auto_464725 ) ) ( not ( = ?auto_464715 ?auto_464716 ) ) ( not ( = ?auto_464715 ?auto_464717 ) ) ( not ( = ?auto_464715 ?auto_464718 ) ) ( not ( = ?auto_464715 ?auto_464719 ) ) ( not ( = ?auto_464715 ?auto_464720 ) ) ( not ( = ?auto_464715 ?auto_464721 ) ) ( not ( = ?auto_464715 ?auto_464722 ) ) ( not ( = ?auto_464715 ?auto_464723 ) ) ( not ( = ?auto_464715 ?auto_464724 ) ) ( not ( = ?auto_464715 ?auto_464725 ) ) ( not ( = ?auto_464716 ?auto_464717 ) ) ( not ( = ?auto_464716 ?auto_464718 ) ) ( not ( = ?auto_464716 ?auto_464719 ) ) ( not ( = ?auto_464716 ?auto_464720 ) ) ( not ( = ?auto_464716 ?auto_464721 ) ) ( not ( = ?auto_464716 ?auto_464722 ) ) ( not ( = ?auto_464716 ?auto_464723 ) ) ( not ( = ?auto_464716 ?auto_464724 ) ) ( not ( = ?auto_464716 ?auto_464725 ) ) ( not ( = ?auto_464717 ?auto_464718 ) ) ( not ( = ?auto_464717 ?auto_464719 ) ) ( not ( = ?auto_464717 ?auto_464720 ) ) ( not ( = ?auto_464717 ?auto_464721 ) ) ( not ( = ?auto_464717 ?auto_464722 ) ) ( not ( = ?auto_464717 ?auto_464723 ) ) ( not ( = ?auto_464717 ?auto_464724 ) ) ( not ( = ?auto_464717 ?auto_464725 ) ) ( not ( = ?auto_464718 ?auto_464719 ) ) ( not ( = ?auto_464718 ?auto_464720 ) ) ( not ( = ?auto_464718 ?auto_464721 ) ) ( not ( = ?auto_464718 ?auto_464722 ) ) ( not ( = ?auto_464718 ?auto_464723 ) ) ( not ( = ?auto_464718 ?auto_464724 ) ) ( not ( = ?auto_464718 ?auto_464725 ) ) ( not ( = ?auto_464719 ?auto_464720 ) ) ( not ( = ?auto_464719 ?auto_464721 ) ) ( not ( = ?auto_464719 ?auto_464722 ) ) ( not ( = ?auto_464719 ?auto_464723 ) ) ( not ( = ?auto_464719 ?auto_464724 ) ) ( not ( = ?auto_464719 ?auto_464725 ) ) ( not ( = ?auto_464720 ?auto_464721 ) ) ( not ( = ?auto_464720 ?auto_464722 ) ) ( not ( = ?auto_464720 ?auto_464723 ) ) ( not ( = ?auto_464720 ?auto_464724 ) ) ( not ( = ?auto_464720 ?auto_464725 ) ) ( not ( = ?auto_464721 ?auto_464722 ) ) ( not ( = ?auto_464721 ?auto_464723 ) ) ( not ( = ?auto_464721 ?auto_464724 ) ) ( not ( = ?auto_464721 ?auto_464725 ) ) ( not ( = ?auto_464722 ?auto_464723 ) ) ( not ( = ?auto_464722 ?auto_464724 ) ) ( not ( = ?auto_464722 ?auto_464725 ) ) ( not ( = ?auto_464723 ?auto_464724 ) ) ( not ( = ?auto_464723 ?auto_464725 ) ) ( not ( = ?auto_464724 ?auto_464725 ) ) ( ON ?auto_464724 ?auto_464725 ) ( ON ?auto_464723 ?auto_464724 ) ( ON ?auto_464722 ?auto_464723 ) ( ON ?auto_464721 ?auto_464722 ) ( ON ?auto_464720 ?auto_464721 ) ( ON ?auto_464719 ?auto_464720 ) ( ON ?auto_464718 ?auto_464719 ) ( ON ?auto_464717 ?auto_464718 ) ( ON ?auto_464716 ?auto_464717 ) ( ON ?auto_464715 ?auto_464716 ) ( CLEAR ?auto_464713 ) ( ON ?auto_464714 ?auto_464715 ) ( CLEAR ?auto_464714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_464711 ?auto_464712 ?auto_464713 ?auto_464714 )
      ( MAKE-15PILE ?auto_464711 ?auto_464712 ?auto_464713 ?auto_464714 ?auto_464715 ?auto_464716 ?auto_464717 ?auto_464718 ?auto_464719 ?auto_464720 ?auto_464721 ?auto_464722 ?auto_464723 ?auto_464724 ?auto_464725 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464741 - BLOCK
      ?auto_464742 - BLOCK
      ?auto_464743 - BLOCK
      ?auto_464744 - BLOCK
      ?auto_464745 - BLOCK
      ?auto_464746 - BLOCK
      ?auto_464747 - BLOCK
      ?auto_464748 - BLOCK
      ?auto_464749 - BLOCK
      ?auto_464750 - BLOCK
      ?auto_464751 - BLOCK
      ?auto_464752 - BLOCK
      ?auto_464753 - BLOCK
      ?auto_464754 - BLOCK
      ?auto_464755 - BLOCK
    )
    :vars
    (
      ?auto_464756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464755 ?auto_464756 ) ( ON-TABLE ?auto_464741 ) ( ON ?auto_464742 ?auto_464741 ) ( not ( = ?auto_464741 ?auto_464742 ) ) ( not ( = ?auto_464741 ?auto_464743 ) ) ( not ( = ?auto_464741 ?auto_464744 ) ) ( not ( = ?auto_464741 ?auto_464745 ) ) ( not ( = ?auto_464741 ?auto_464746 ) ) ( not ( = ?auto_464741 ?auto_464747 ) ) ( not ( = ?auto_464741 ?auto_464748 ) ) ( not ( = ?auto_464741 ?auto_464749 ) ) ( not ( = ?auto_464741 ?auto_464750 ) ) ( not ( = ?auto_464741 ?auto_464751 ) ) ( not ( = ?auto_464741 ?auto_464752 ) ) ( not ( = ?auto_464741 ?auto_464753 ) ) ( not ( = ?auto_464741 ?auto_464754 ) ) ( not ( = ?auto_464741 ?auto_464755 ) ) ( not ( = ?auto_464741 ?auto_464756 ) ) ( not ( = ?auto_464742 ?auto_464743 ) ) ( not ( = ?auto_464742 ?auto_464744 ) ) ( not ( = ?auto_464742 ?auto_464745 ) ) ( not ( = ?auto_464742 ?auto_464746 ) ) ( not ( = ?auto_464742 ?auto_464747 ) ) ( not ( = ?auto_464742 ?auto_464748 ) ) ( not ( = ?auto_464742 ?auto_464749 ) ) ( not ( = ?auto_464742 ?auto_464750 ) ) ( not ( = ?auto_464742 ?auto_464751 ) ) ( not ( = ?auto_464742 ?auto_464752 ) ) ( not ( = ?auto_464742 ?auto_464753 ) ) ( not ( = ?auto_464742 ?auto_464754 ) ) ( not ( = ?auto_464742 ?auto_464755 ) ) ( not ( = ?auto_464742 ?auto_464756 ) ) ( not ( = ?auto_464743 ?auto_464744 ) ) ( not ( = ?auto_464743 ?auto_464745 ) ) ( not ( = ?auto_464743 ?auto_464746 ) ) ( not ( = ?auto_464743 ?auto_464747 ) ) ( not ( = ?auto_464743 ?auto_464748 ) ) ( not ( = ?auto_464743 ?auto_464749 ) ) ( not ( = ?auto_464743 ?auto_464750 ) ) ( not ( = ?auto_464743 ?auto_464751 ) ) ( not ( = ?auto_464743 ?auto_464752 ) ) ( not ( = ?auto_464743 ?auto_464753 ) ) ( not ( = ?auto_464743 ?auto_464754 ) ) ( not ( = ?auto_464743 ?auto_464755 ) ) ( not ( = ?auto_464743 ?auto_464756 ) ) ( not ( = ?auto_464744 ?auto_464745 ) ) ( not ( = ?auto_464744 ?auto_464746 ) ) ( not ( = ?auto_464744 ?auto_464747 ) ) ( not ( = ?auto_464744 ?auto_464748 ) ) ( not ( = ?auto_464744 ?auto_464749 ) ) ( not ( = ?auto_464744 ?auto_464750 ) ) ( not ( = ?auto_464744 ?auto_464751 ) ) ( not ( = ?auto_464744 ?auto_464752 ) ) ( not ( = ?auto_464744 ?auto_464753 ) ) ( not ( = ?auto_464744 ?auto_464754 ) ) ( not ( = ?auto_464744 ?auto_464755 ) ) ( not ( = ?auto_464744 ?auto_464756 ) ) ( not ( = ?auto_464745 ?auto_464746 ) ) ( not ( = ?auto_464745 ?auto_464747 ) ) ( not ( = ?auto_464745 ?auto_464748 ) ) ( not ( = ?auto_464745 ?auto_464749 ) ) ( not ( = ?auto_464745 ?auto_464750 ) ) ( not ( = ?auto_464745 ?auto_464751 ) ) ( not ( = ?auto_464745 ?auto_464752 ) ) ( not ( = ?auto_464745 ?auto_464753 ) ) ( not ( = ?auto_464745 ?auto_464754 ) ) ( not ( = ?auto_464745 ?auto_464755 ) ) ( not ( = ?auto_464745 ?auto_464756 ) ) ( not ( = ?auto_464746 ?auto_464747 ) ) ( not ( = ?auto_464746 ?auto_464748 ) ) ( not ( = ?auto_464746 ?auto_464749 ) ) ( not ( = ?auto_464746 ?auto_464750 ) ) ( not ( = ?auto_464746 ?auto_464751 ) ) ( not ( = ?auto_464746 ?auto_464752 ) ) ( not ( = ?auto_464746 ?auto_464753 ) ) ( not ( = ?auto_464746 ?auto_464754 ) ) ( not ( = ?auto_464746 ?auto_464755 ) ) ( not ( = ?auto_464746 ?auto_464756 ) ) ( not ( = ?auto_464747 ?auto_464748 ) ) ( not ( = ?auto_464747 ?auto_464749 ) ) ( not ( = ?auto_464747 ?auto_464750 ) ) ( not ( = ?auto_464747 ?auto_464751 ) ) ( not ( = ?auto_464747 ?auto_464752 ) ) ( not ( = ?auto_464747 ?auto_464753 ) ) ( not ( = ?auto_464747 ?auto_464754 ) ) ( not ( = ?auto_464747 ?auto_464755 ) ) ( not ( = ?auto_464747 ?auto_464756 ) ) ( not ( = ?auto_464748 ?auto_464749 ) ) ( not ( = ?auto_464748 ?auto_464750 ) ) ( not ( = ?auto_464748 ?auto_464751 ) ) ( not ( = ?auto_464748 ?auto_464752 ) ) ( not ( = ?auto_464748 ?auto_464753 ) ) ( not ( = ?auto_464748 ?auto_464754 ) ) ( not ( = ?auto_464748 ?auto_464755 ) ) ( not ( = ?auto_464748 ?auto_464756 ) ) ( not ( = ?auto_464749 ?auto_464750 ) ) ( not ( = ?auto_464749 ?auto_464751 ) ) ( not ( = ?auto_464749 ?auto_464752 ) ) ( not ( = ?auto_464749 ?auto_464753 ) ) ( not ( = ?auto_464749 ?auto_464754 ) ) ( not ( = ?auto_464749 ?auto_464755 ) ) ( not ( = ?auto_464749 ?auto_464756 ) ) ( not ( = ?auto_464750 ?auto_464751 ) ) ( not ( = ?auto_464750 ?auto_464752 ) ) ( not ( = ?auto_464750 ?auto_464753 ) ) ( not ( = ?auto_464750 ?auto_464754 ) ) ( not ( = ?auto_464750 ?auto_464755 ) ) ( not ( = ?auto_464750 ?auto_464756 ) ) ( not ( = ?auto_464751 ?auto_464752 ) ) ( not ( = ?auto_464751 ?auto_464753 ) ) ( not ( = ?auto_464751 ?auto_464754 ) ) ( not ( = ?auto_464751 ?auto_464755 ) ) ( not ( = ?auto_464751 ?auto_464756 ) ) ( not ( = ?auto_464752 ?auto_464753 ) ) ( not ( = ?auto_464752 ?auto_464754 ) ) ( not ( = ?auto_464752 ?auto_464755 ) ) ( not ( = ?auto_464752 ?auto_464756 ) ) ( not ( = ?auto_464753 ?auto_464754 ) ) ( not ( = ?auto_464753 ?auto_464755 ) ) ( not ( = ?auto_464753 ?auto_464756 ) ) ( not ( = ?auto_464754 ?auto_464755 ) ) ( not ( = ?auto_464754 ?auto_464756 ) ) ( not ( = ?auto_464755 ?auto_464756 ) ) ( ON ?auto_464754 ?auto_464755 ) ( ON ?auto_464753 ?auto_464754 ) ( ON ?auto_464752 ?auto_464753 ) ( ON ?auto_464751 ?auto_464752 ) ( ON ?auto_464750 ?auto_464751 ) ( ON ?auto_464749 ?auto_464750 ) ( ON ?auto_464748 ?auto_464749 ) ( ON ?auto_464747 ?auto_464748 ) ( ON ?auto_464746 ?auto_464747 ) ( ON ?auto_464745 ?auto_464746 ) ( ON ?auto_464744 ?auto_464745 ) ( CLEAR ?auto_464742 ) ( ON ?auto_464743 ?auto_464744 ) ( CLEAR ?auto_464743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_464741 ?auto_464742 ?auto_464743 )
      ( MAKE-15PILE ?auto_464741 ?auto_464742 ?auto_464743 ?auto_464744 ?auto_464745 ?auto_464746 ?auto_464747 ?auto_464748 ?auto_464749 ?auto_464750 ?auto_464751 ?auto_464752 ?auto_464753 ?auto_464754 ?auto_464755 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464772 - BLOCK
      ?auto_464773 - BLOCK
      ?auto_464774 - BLOCK
      ?auto_464775 - BLOCK
      ?auto_464776 - BLOCK
      ?auto_464777 - BLOCK
      ?auto_464778 - BLOCK
      ?auto_464779 - BLOCK
      ?auto_464780 - BLOCK
      ?auto_464781 - BLOCK
      ?auto_464782 - BLOCK
      ?auto_464783 - BLOCK
      ?auto_464784 - BLOCK
      ?auto_464785 - BLOCK
      ?auto_464786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464786 ) ( ON-TABLE ?auto_464772 ) ( ON ?auto_464773 ?auto_464772 ) ( not ( = ?auto_464772 ?auto_464773 ) ) ( not ( = ?auto_464772 ?auto_464774 ) ) ( not ( = ?auto_464772 ?auto_464775 ) ) ( not ( = ?auto_464772 ?auto_464776 ) ) ( not ( = ?auto_464772 ?auto_464777 ) ) ( not ( = ?auto_464772 ?auto_464778 ) ) ( not ( = ?auto_464772 ?auto_464779 ) ) ( not ( = ?auto_464772 ?auto_464780 ) ) ( not ( = ?auto_464772 ?auto_464781 ) ) ( not ( = ?auto_464772 ?auto_464782 ) ) ( not ( = ?auto_464772 ?auto_464783 ) ) ( not ( = ?auto_464772 ?auto_464784 ) ) ( not ( = ?auto_464772 ?auto_464785 ) ) ( not ( = ?auto_464772 ?auto_464786 ) ) ( not ( = ?auto_464773 ?auto_464774 ) ) ( not ( = ?auto_464773 ?auto_464775 ) ) ( not ( = ?auto_464773 ?auto_464776 ) ) ( not ( = ?auto_464773 ?auto_464777 ) ) ( not ( = ?auto_464773 ?auto_464778 ) ) ( not ( = ?auto_464773 ?auto_464779 ) ) ( not ( = ?auto_464773 ?auto_464780 ) ) ( not ( = ?auto_464773 ?auto_464781 ) ) ( not ( = ?auto_464773 ?auto_464782 ) ) ( not ( = ?auto_464773 ?auto_464783 ) ) ( not ( = ?auto_464773 ?auto_464784 ) ) ( not ( = ?auto_464773 ?auto_464785 ) ) ( not ( = ?auto_464773 ?auto_464786 ) ) ( not ( = ?auto_464774 ?auto_464775 ) ) ( not ( = ?auto_464774 ?auto_464776 ) ) ( not ( = ?auto_464774 ?auto_464777 ) ) ( not ( = ?auto_464774 ?auto_464778 ) ) ( not ( = ?auto_464774 ?auto_464779 ) ) ( not ( = ?auto_464774 ?auto_464780 ) ) ( not ( = ?auto_464774 ?auto_464781 ) ) ( not ( = ?auto_464774 ?auto_464782 ) ) ( not ( = ?auto_464774 ?auto_464783 ) ) ( not ( = ?auto_464774 ?auto_464784 ) ) ( not ( = ?auto_464774 ?auto_464785 ) ) ( not ( = ?auto_464774 ?auto_464786 ) ) ( not ( = ?auto_464775 ?auto_464776 ) ) ( not ( = ?auto_464775 ?auto_464777 ) ) ( not ( = ?auto_464775 ?auto_464778 ) ) ( not ( = ?auto_464775 ?auto_464779 ) ) ( not ( = ?auto_464775 ?auto_464780 ) ) ( not ( = ?auto_464775 ?auto_464781 ) ) ( not ( = ?auto_464775 ?auto_464782 ) ) ( not ( = ?auto_464775 ?auto_464783 ) ) ( not ( = ?auto_464775 ?auto_464784 ) ) ( not ( = ?auto_464775 ?auto_464785 ) ) ( not ( = ?auto_464775 ?auto_464786 ) ) ( not ( = ?auto_464776 ?auto_464777 ) ) ( not ( = ?auto_464776 ?auto_464778 ) ) ( not ( = ?auto_464776 ?auto_464779 ) ) ( not ( = ?auto_464776 ?auto_464780 ) ) ( not ( = ?auto_464776 ?auto_464781 ) ) ( not ( = ?auto_464776 ?auto_464782 ) ) ( not ( = ?auto_464776 ?auto_464783 ) ) ( not ( = ?auto_464776 ?auto_464784 ) ) ( not ( = ?auto_464776 ?auto_464785 ) ) ( not ( = ?auto_464776 ?auto_464786 ) ) ( not ( = ?auto_464777 ?auto_464778 ) ) ( not ( = ?auto_464777 ?auto_464779 ) ) ( not ( = ?auto_464777 ?auto_464780 ) ) ( not ( = ?auto_464777 ?auto_464781 ) ) ( not ( = ?auto_464777 ?auto_464782 ) ) ( not ( = ?auto_464777 ?auto_464783 ) ) ( not ( = ?auto_464777 ?auto_464784 ) ) ( not ( = ?auto_464777 ?auto_464785 ) ) ( not ( = ?auto_464777 ?auto_464786 ) ) ( not ( = ?auto_464778 ?auto_464779 ) ) ( not ( = ?auto_464778 ?auto_464780 ) ) ( not ( = ?auto_464778 ?auto_464781 ) ) ( not ( = ?auto_464778 ?auto_464782 ) ) ( not ( = ?auto_464778 ?auto_464783 ) ) ( not ( = ?auto_464778 ?auto_464784 ) ) ( not ( = ?auto_464778 ?auto_464785 ) ) ( not ( = ?auto_464778 ?auto_464786 ) ) ( not ( = ?auto_464779 ?auto_464780 ) ) ( not ( = ?auto_464779 ?auto_464781 ) ) ( not ( = ?auto_464779 ?auto_464782 ) ) ( not ( = ?auto_464779 ?auto_464783 ) ) ( not ( = ?auto_464779 ?auto_464784 ) ) ( not ( = ?auto_464779 ?auto_464785 ) ) ( not ( = ?auto_464779 ?auto_464786 ) ) ( not ( = ?auto_464780 ?auto_464781 ) ) ( not ( = ?auto_464780 ?auto_464782 ) ) ( not ( = ?auto_464780 ?auto_464783 ) ) ( not ( = ?auto_464780 ?auto_464784 ) ) ( not ( = ?auto_464780 ?auto_464785 ) ) ( not ( = ?auto_464780 ?auto_464786 ) ) ( not ( = ?auto_464781 ?auto_464782 ) ) ( not ( = ?auto_464781 ?auto_464783 ) ) ( not ( = ?auto_464781 ?auto_464784 ) ) ( not ( = ?auto_464781 ?auto_464785 ) ) ( not ( = ?auto_464781 ?auto_464786 ) ) ( not ( = ?auto_464782 ?auto_464783 ) ) ( not ( = ?auto_464782 ?auto_464784 ) ) ( not ( = ?auto_464782 ?auto_464785 ) ) ( not ( = ?auto_464782 ?auto_464786 ) ) ( not ( = ?auto_464783 ?auto_464784 ) ) ( not ( = ?auto_464783 ?auto_464785 ) ) ( not ( = ?auto_464783 ?auto_464786 ) ) ( not ( = ?auto_464784 ?auto_464785 ) ) ( not ( = ?auto_464784 ?auto_464786 ) ) ( not ( = ?auto_464785 ?auto_464786 ) ) ( ON ?auto_464785 ?auto_464786 ) ( ON ?auto_464784 ?auto_464785 ) ( ON ?auto_464783 ?auto_464784 ) ( ON ?auto_464782 ?auto_464783 ) ( ON ?auto_464781 ?auto_464782 ) ( ON ?auto_464780 ?auto_464781 ) ( ON ?auto_464779 ?auto_464780 ) ( ON ?auto_464778 ?auto_464779 ) ( ON ?auto_464777 ?auto_464778 ) ( ON ?auto_464776 ?auto_464777 ) ( ON ?auto_464775 ?auto_464776 ) ( CLEAR ?auto_464773 ) ( ON ?auto_464774 ?auto_464775 ) ( CLEAR ?auto_464774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_464772 ?auto_464773 ?auto_464774 )
      ( MAKE-15PILE ?auto_464772 ?auto_464773 ?auto_464774 ?auto_464775 ?auto_464776 ?auto_464777 ?auto_464778 ?auto_464779 ?auto_464780 ?auto_464781 ?auto_464782 ?auto_464783 ?auto_464784 ?auto_464785 ?auto_464786 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464802 - BLOCK
      ?auto_464803 - BLOCK
      ?auto_464804 - BLOCK
      ?auto_464805 - BLOCK
      ?auto_464806 - BLOCK
      ?auto_464807 - BLOCK
      ?auto_464808 - BLOCK
      ?auto_464809 - BLOCK
      ?auto_464810 - BLOCK
      ?auto_464811 - BLOCK
      ?auto_464812 - BLOCK
      ?auto_464813 - BLOCK
      ?auto_464814 - BLOCK
      ?auto_464815 - BLOCK
      ?auto_464816 - BLOCK
    )
    :vars
    (
      ?auto_464817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464816 ?auto_464817 ) ( ON-TABLE ?auto_464802 ) ( not ( = ?auto_464802 ?auto_464803 ) ) ( not ( = ?auto_464802 ?auto_464804 ) ) ( not ( = ?auto_464802 ?auto_464805 ) ) ( not ( = ?auto_464802 ?auto_464806 ) ) ( not ( = ?auto_464802 ?auto_464807 ) ) ( not ( = ?auto_464802 ?auto_464808 ) ) ( not ( = ?auto_464802 ?auto_464809 ) ) ( not ( = ?auto_464802 ?auto_464810 ) ) ( not ( = ?auto_464802 ?auto_464811 ) ) ( not ( = ?auto_464802 ?auto_464812 ) ) ( not ( = ?auto_464802 ?auto_464813 ) ) ( not ( = ?auto_464802 ?auto_464814 ) ) ( not ( = ?auto_464802 ?auto_464815 ) ) ( not ( = ?auto_464802 ?auto_464816 ) ) ( not ( = ?auto_464802 ?auto_464817 ) ) ( not ( = ?auto_464803 ?auto_464804 ) ) ( not ( = ?auto_464803 ?auto_464805 ) ) ( not ( = ?auto_464803 ?auto_464806 ) ) ( not ( = ?auto_464803 ?auto_464807 ) ) ( not ( = ?auto_464803 ?auto_464808 ) ) ( not ( = ?auto_464803 ?auto_464809 ) ) ( not ( = ?auto_464803 ?auto_464810 ) ) ( not ( = ?auto_464803 ?auto_464811 ) ) ( not ( = ?auto_464803 ?auto_464812 ) ) ( not ( = ?auto_464803 ?auto_464813 ) ) ( not ( = ?auto_464803 ?auto_464814 ) ) ( not ( = ?auto_464803 ?auto_464815 ) ) ( not ( = ?auto_464803 ?auto_464816 ) ) ( not ( = ?auto_464803 ?auto_464817 ) ) ( not ( = ?auto_464804 ?auto_464805 ) ) ( not ( = ?auto_464804 ?auto_464806 ) ) ( not ( = ?auto_464804 ?auto_464807 ) ) ( not ( = ?auto_464804 ?auto_464808 ) ) ( not ( = ?auto_464804 ?auto_464809 ) ) ( not ( = ?auto_464804 ?auto_464810 ) ) ( not ( = ?auto_464804 ?auto_464811 ) ) ( not ( = ?auto_464804 ?auto_464812 ) ) ( not ( = ?auto_464804 ?auto_464813 ) ) ( not ( = ?auto_464804 ?auto_464814 ) ) ( not ( = ?auto_464804 ?auto_464815 ) ) ( not ( = ?auto_464804 ?auto_464816 ) ) ( not ( = ?auto_464804 ?auto_464817 ) ) ( not ( = ?auto_464805 ?auto_464806 ) ) ( not ( = ?auto_464805 ?auto_464807 ) ) ( not ( = ?auto_464805 ?auto_464808 ) ) ( not ( = ?auto_464805 ?auto_464809 ) ) ( not ( = ?auto_464805 ?auto_464810 ) ) ( not ( = ?auto_464805 ?auto_464811 ) ) ( not ( = ?auto_464805 ?auto_464812 ) ) ( not ( = ?auto_464805 ?auto_464813 ) ) ( not ( = ?auto_464805 ?auto_464814 ) ) ( not ( = ?auto_464805 ?auto_464815 ) ) ( not ( = ?auto_464805 ?auto_464816 ) ) ( not ( = ?auto_464805 ?auto_464817 ) ) ( not ( = ?auto_464806 ?auto_464807 ) ) ( not ( = ?auto_464806 ?auto_464808 ) ) ( not ( = ?auto_464806 ?auto_464809 ) ) ( not ( = ?auto_464806 ?auto_464810 ) ) ( not ( = ?auto_464806 ?auto_464811 ) ) ( not ( = ?auto_464806 ?auto_464812 ) ) ( not ( = ?auto_464806 ?auto_464813 ) ) ( not ( = ?auto_464806 ?auto_464814 ) ) ( not ( = ?auto_464806 ?auto_464815 ) ) ( not ( = ?auto_464806 ?auto_464816 ) ) ( not ( = ?auto_464806 ?auto_464817 ) ) ( not ( = ?auto_464807 ?auto_464808 ) ) ( not ( = ?auto_464807 ?auto_464809 ) ) ( not ( = ?auto_464807 ?auto_464810 ) ) ( not ( = ?auto_464807 ?auto_464811 ) ) ( not ( = ?auto_464807 ?auto_464812 ) ) ( not ( = ?auto_464807 ?auto_464813 ) ) ( not ( = ?auto_464807 ?auto_464814 ) ) ( not ( = ?auto_464807 ?auto_464815 ) ) ( not ( = ?auto_464807 ?auto_464816 ) ) ( not ( = ?auto_464807 ?auto_464817 ) ) ( not ( = ?auto_464808 ?auto_464809 ) ) ( not ( = ?auto_464808 ?auto_464810 ) ) ( not ( = ?auto_464808 ?auto_464811 ) ) ( not ( = ?auto_464808 ?auto_464812 ) ) ( not ( = ?auto_464808 ?auto_464813 ) ) ( not ( = ?auto_464808 ?auto_464814 ) ) ( not ( = ?auto_464808 ?auto_464815 ) ) ( not ( = ?auto_464808 ?auto_464816 ) ) ( not ( = ?auto_464808 ?auto_464817 ) ) ( not ( = ?auto_464809 ?auto_464810 ) ) ( not ( = ?auto_464809 ?auto_464811 ) ) ( not ( = ?auto_464809 ?auto_464812 ) ) ( not ( = ?auto_464809 ?auto_464813 ) ) ( not ( = ?auto_464809 ?auto_464814 ) ) ( not ( = ?auto_464809 ?auto_464815 ) ) ( not ( = ?auto_464809 ?auto_464816 ) ) ( not ( = ?auto_464809 ?auto_464817 ) ) ( not ( = ?auto_464810 ?auto_464811 ) ) ( not ( = ?auto_464810 ?auto_464812 ) ) ( not ( = ?auto_464810 ?auto_464813 ) ) ( not ( = ?auto_464810 ?auto_464814 ) ) ( not ( = ?auto_464810 ?auto_464815 ) ) ( not ( = ?auto_464810 ?auto_464816 ) ) ( not ( = ?auto_464810 ?auto_464817 ) ) ( not ( = ?auto_464811 ?auto_464812 ) ) ( not ( = ?auto_464811 ?auto_464813 ) ) ( not ( = ?auto_464811 ?auto_464814 ) ) ( not ( = ?auto_464811 ?auto_464815 ) ) ( not ( = ?auto_464811 ?auto_464816 ) ) ( not ( = ?auto_464811 ?auto_464817 ) ) ( not ( = ?auto_464812 ?auto_464813 ) ) ( not ( = ?auto_464812 ?auto_464814 ) ) ( not ( = ?auto_464812 ?auto_464815 ) ) ( not ( = ?auto_464812 ?auto_464816 ) ) ( not ( = ?auto_464812 ?auto_464817 ) ) ( not ( = ?auto_464813 ?auto_464814 ) ) ( not ( = ?auto_464813 ?auto_464815 ) ) ( not ( = ?auto_464813 ?auto_464816 ) ) ( not ( = ?auto_464813 ?auto_464817 ) ) ( not ( = ?auto_464814 ?auto_464815 ) ) ( not ( = ?auto_464814 ?auto_464816 ) ) ( not ( = ?auto_464814 ?auto_464817 ) ) ( not ( = ?auto_464815 ?auto_464816 ) ) ( not ( = ?auto_464815 ?auto_464817 ) ) ( not ( = ?auto_464816 ?auto_464817 ) ) ( ON ?auto_464815 ?auto_464816 ) ( ON ?auto_464814 ?auto_464815 ) ( ON ?auto_464813 ?auto_464814 ) ( ON ?auto_464812 ?auto_464813 ) ( ON ?auto_464811 ?auto_464812 ) ( ON ?auto_464810 ?auto_464811 ) ( ON ?auto_464809 ?auto_464810 ) ( ON ?auto_464808 ?auto_464809 ) ( ON ?auto_464807 ?auto_464808 ) ( ON ?auto_464806 ?auto_464807 ) ( ON ?auto_464805 ?auto_464806 ) ( ON ?auto_464804 ?auto_464805 ) ( CLEAR ?auto_464802 ) ( ON ?auto_464803 ?auto_464804 ) ( CLEAR ?auto_464803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_464802 ?auto_464803 )
      ( MAKE-15PILE ?auto_464802 ?auto_464803 ?auto_464804 ?auto_464805 ?auto_464806 ?auto_464807 ?auto_464808 ?auto_464809 ?auto_464810 ?auto_464811 ?auto_464812 ?auto_464813 ?auto_464814 ?auto_464815 ?auto_464816 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464833 - BLOCK
      ?auto_464834 - BLOCK
      ?auto_464835 - BLOCK
      ?auto_464836 - BLOCK
      ?auto_464837 - BLOCK
      ?auto_464838 - BLOCK
      ?auto_464839 - BLOCK
      ?auto_464840 - BLOCK
      ?auto_464841 - BLOCK
      ?auto_464842 - BLOCK
      ?auto_464843 - BLOCK
      ?auto_464844 - BLOCK
      ?auto_464845 - BLOCK
      ?auto_464846 - BLOCK
      ?auto_464847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464847 ) ( ON-TABLE ?auto_464833 ) ( not ( = ?auto_464833 ?auto_464834 ) ) ( not ( = ?auto_464833 ?auto_464835 ) ) ( not ( = ?auto_464833 ?auto_464836 ) ) ( not ( = ?auto_464833 ?auto_464837 ) ) ( not ( = ?auto_464833 ?auto_464838 ) ) ( not ( = ?auto_464833 ?auto_464839 ) ) ( not ( = ?auto_464833 ?auto_464840 ) ) ( not ( = ?auto_464833 ?auto_464841 ) ) ( not ( = ?auto_464833 ?auto_464842 ) ) ( not ( = ?auto_464833 ?auto_464843 ) ) ( not ( = ?auto_464833 ?auto_464844 ) ) ( not ( = ?auto_464833 ?auto_464845 ) ) ( not ( = ?auto_464833 ?auto_464846 ) ) ( not ( = ?auto_464833 ?auto_464847 ) ) ( not ( = ?auto_464834 ?auto_464835 ) ) ( not ( = ?auto_464834 ?auto_464836 ) ) ( not ( = ?auto_464834 ?auto_464837 ) ) ( not ( = ?auto_464834 ?auto_464838 ) ) ( not ( = ?auto_464834 ?auto_464839 ) ) ( not ( = ?auto_464834 ?auto_464840 ) ) ( not ( = ?auto_464834 ?auto_464841 ) ) ( not ( = ?auto_464834 ?auto_464842 ) ) ( not ( = ?auto_464834 ?auto_464843 ) ) ( not ( = ?auto_464834 ?auto_464844 ) ) ( not ( = ?auto_464834 ?auto_464845 ) ) ( not ( = ?auto_464834 ?auto_464846 ) ) ( not ( = ?auto_464834 ?auto_464847 ) ) ( not ( = ?auto_464835 ?auto_464836 ) ) ( not ( = ?auto_464835 ?auto_464837 ) ) ( not ( = ?auto_464835 ?auto_464838 ) ) ( not ( = ?auto_464835 ?auto_464839 ) ) ( not ( = ?auto_464835 ?auto_464840 ) ) ( not ( = ?auto_464835 ?auto_464841 ) ) ( not ( = ?auto_464835 ?auto_464842 ) ) ( not ( = ?auto_464835 ?auto_464843 ) ) ( not ( = ?auto_464835 ?auto_464844 ) ) ( not ( = ?auto_464835 ?auto_464845 ) ) ( not ( = ?auto_464835 ?auto_464846 ) ) ( not ( = ?auto_464835 ?auto_464847 ) ) ( not ( = ?auto_464836 ?auto_464837 ) ) ( not ( = ?auto_464836 ?auto_464838 ) ) ( not ( = ?auto_464836 ?auto_464839 ) ) ( not ( = ?auto_464836 ?auto_464840 ) ) ( not ( = ?auto_464836 ?auto_464841 ) ) ( not ( = ?auto_464836 ?auto_464842 ) ) ( not ( = ?auto_464836 ?auto_464843 ) ) ( not ( = ?auto_464836 ?auto_464844 ) ) ( not ( = ?auto_464836 ?auto_464845 ) ) ( not ( = ?auto_464836 ?auto_464846 ) ) ( not ( = ?auto_464836 ?auto_464847 ) ) ( not ( = ?auto_464837 ?auto_464838 ) ) ( not ( = ?auto_464837 ?auto_464839 ) ) ( not ( = ?auto_464837 ?auto_464840 ) ) ( not ( = ?auto_464837 ?auto_464841 ) ) ( not ( = ?auto_464837 ?auto_464842 ) ) ( not ( = ?auto_464837 ?auto_464843 ) ) ( not ( = ?auto_464837 ?auto_464844 ) ) ( not ( = ?auto_464837 ?auto_464845 ) ) ( not ( = ?auto_464837 ?auto_464846 ) ) ( not ( = ?auto_464837 ?auto_464847 ) ) ( not ( = ?auto_464838 ?auto_464839 ) ) ( not ( = ?auto_464838 ?auto_464840 ) ) ( not ( = ?auto_464838 ?auto_464841 ) ) ( not ( = ?auto_464838 ?auto_464842 ) ) ( not ( = ?auto_464838 ?auto_464843 ) ) ( not ( = ?auto_464838 ?auto_464844 ) ) ( not ( = ?auto_464838 ?auto_464845 ) ) ( not ( = ?auto_464838 ?auto_464846 ) ) ( not ( = ?auto_464838 ?auto_464847 ) ) ( not ( = ?auto_464839 ?auto_464840 ) ) ( not ( = ?auto_464839 ?auto_464841 ) ) ( not ( = ?auto_464839 ?auto_464842 ) ) ( not ( = ?auto_464839 ?auto_464843 ) ) ( not ( = ?auto_464839 ?auto_464844 ) ) ( not ( = ?auto_464839 ?auto_464845 ) ) ( not ( = ?auto_464839 ?auto_464846 ) ) ( not ( = ?auto_464839 ?auto_464847 ) ) ( not ( = ?auto_464840 ?auto_464841 ) ) ( not ( = ?auto_464840 ?auto_464842 ) ) ( not ( = ?auto_464840 ?auto_464843 ) ) ( not ( = ?auto_464840 ?auto_464844 ) ) ( not ( = ?auto_464840 ?auto_464845 ) ) ( not ( = ?auto_464840 ?auto_464846 ) ) ( not ( = ?auto_464840 ?auto_464847 ) ) ( not ( = ?auto_464841 ?auto_464842 ) ) ( not ( = ?auto_464841 ?auto_464843 ) ) ( not ( = ?auto_464841 ?auto_464844 ) ) ( not ( = ?auto_464841 ?auto_464845 ) ) ( not ( = ?auto_464841 ?auto_464846 ) ) ( not ( = ?auto_464841 ?auto_464847 ) ) ( not ( = ?auto_464842 ?auto_464843 ) ) ( not ( = ?auto_464842 ?auto_464844 ) ) ( not ( = ?auto_464842 ?auto_464845 ) ) ( not ( = ?auto_464842 ?auto_464846 ) ) ( not ( = ?auto_464842 ?auto_464847 ) ) ( not ( = ?auto_464843 ?auto_464844 ) ) ( not ( = ?auto_464843 ?auto_464845 ) ) ( not ( = ?auto_464843 ?auto_464846 ) ) ( not ( = ?auto_464843 ?auto_464847 ) ) ( not ( = ?auto_464844 ?auto_464845 ) ) ( not ( = ?auto_464844 ?auto_464846 ) ) ( not ( = ?auto_464844 ?auto_464847 ) ) ( not ( = ?auto_464845 ?auto_464846 ) ) ( not ( = ?auto_464845 ?auto_464847 ) ) ( not ( = ?auto_464846 ?auto_464847 ) ) ( ON ?auto_464846 ?auto_464847 ) ( ON ?auto_464845 ?auto_464846 ) ( ON ?auto_464844 ?auto_464845 ) ( ON ?auto_464843 ?auto_464844 ) ( ON ?auto_464842 ?auto_464843 ) ( ON ?auto_464841 ?auto_464842 ) ( ON ?auto_464840 ?auto_464841 ) ( ON ?auto_464839 ?auto_464840 ) ( ON ?auto_464838 ?auto_464839 ) ( ON ?auto_464837 ?auto_464838 ) ( ON ?auto_464836 ?auto_464837 ) ( ON ?auto_464835 ?auto_464836 ) ( CLEAR ?auto_464833 ) ( ON ?auto_464834 ?auto_464835 ) ( CLEAR ?auto_464834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_464833 ?auto_464834 )
      ( MAKE-15PILE ?auto_464833 ?auto_464834 ?auto_464835 ?auto_464836 ?auto_464837 ?auto_464838 ?auto_464839 ?auto_464840 ?auto_464841 ?auto_464842 ?auto_464843 ?auto_464844 ?auto_464845 ?auto_464846 ?auto_464847 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464863 - BLOCK
      ?auto_464864 - BLOCK
      ?auto_464865 - BLOCK
      ?auto_464866 - BLOCK
      ?auto_464867 - BLOCK
      ?auto_464868 - BLOCK
      ?auto_464869 - BLOCK
      ?auto_464870 - BLOCK
      ?auto_464871 - BLOCK
      ?auto_464872 - BLOCK
      ?auto_464873 - BLOCK
      ?auto_464874 - BLOCK
      ?auto_464875 - BLOCK
      ?auto_464876 - BLOCK
      ?auto_464877 - BLOCK
    )
    :vars
    (
      ?auto_464878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464877 ?auto_464878 ) ( not ( = ?auto_464863 ?auto_464864 ) ) ( not ( = ?auto_464863 ?auto_464865 ) ) ( not ( = ?auto_464863 ?auto_464866 ) ) ( not ( = ?auto_464863 ?auto_464867 ) ) ( not ( = ?auto_464863 ?auto_464868 ) ) ( not ( = ?auto_464863 ?auto_464869 ) ) ( not ( = ?auto_464863 ?auto_464870 ) ) ( not ( = ?auto_464863 ?auto_464871 ) ) ( not ( = ?auto_464863 ?auto_464872 ) ) ( not ( = ?auto_464863 ?auto_464873 ) ) ( not ( = ?auto_464863 ?auto_464874 ) ) ( not ( = ?auto_464863 ?auto_464875 ) ) ( not ( = ?auto_464863 ?auto_464876 ) ) ( not ( = ?auto_464863 ?auto_464877 ) ) ( not ( = ?auto_464863 ?auto_464878 ) ) ( not ( = ?auto_464864 ?auto_464865 ) ) ( not ( = ?auto_464864 ?auto_464866 ) ) ( not ( = ?auto_464864 ?auto_464867 ) ) ( not ( = ?auto_464864 ?auto_464868 ) ) ( not ( = ?auto_464864 ?auto_464869 ) ) ( not ( = ?auto_464864 ?auto_464870 ) ) ( not ( = ?auto_464864 ?auto_464871 ) ) ( not ( = ?auto_464864 ?auto_464872 ) ) ( not ( = ?auto_464864 ?auto_464873 ) ) ( not ( = ?auto_464864 ?auto_464874 ) ) ( not ( = ?auto_464864 ?auto_464875 ) ) ( not ( = ?auto_464864 ?auto_464876 ) ) ( not ( = ?auto_464864 ?auto_464877 ) ) ( not ( = ?auto_464864 ?auto_464878 ) ) ( not ( = ?auto_464865 ?auto_464866 ) ) ( not ( = ?auto_464865 ?auto_464867 ) ) ( not ( = ?auto_464865 ?auto_464868 ) ) ( not ( = ?auto_464865 ?auto_464869 ) ) ( not ( = ?auto_464865 ?auto_464870 ) ) ( not ( = ?auto_464865 ?auto_464871 ) ) ( not ( = ?auto_464865 ?auto_464872 ) ) ( not ( = ?auto_464865 ?auto_464873 ) ) ( not ( = ?auto_464865 ?auto_464874 ) ) ( not ( = ?auto_464865 ?auto_464875 ) ) ( not ( = ?auto_464865 ?auto_464876 ) ) ( not ( = ?auto_464865 ?auto_464877 ) ) ( not ( = ?auto_464865 ?auto_464878 ) ) ( not ( = ?auto_464866 ?auto_464867 ) ) ( not ( = ?auto_464866 ?auto_464868 ) ) ( not ( = ?auto_464866 ?auto_464869 ) ) ( not ( = ?auto_464866 ?auto_464870 ) ) ( not ( = ?auto_464866 ?auto_464871 ) ) ( not ( = ?auto_464866 ?auto_464872 ) ) ( not ( = ?auto_464866 ?auto_464873 ) ) ( not ( = ?auto_464866 ?auto_464874 ) ) ( not ( = ?auto_464866 ?auto_464875 ) ) ( not ( = ?auto_464866 ?auto_464876 ) ) ( not ( = ?auto_464866 ?auto_464877 ) ) ( not ( = ?auto_464866 ?auto_464878 ) ) ( not ( = ?auto_464867 ?auto_464868 ) ) ( not ( = ?auto_464867 ?auto_464869 ) ) ( not ( = ?auto_464867 ?auto_464870 ) ) ( not ( = ?auto_464867 ?auto_464871 ) ) ( not ( = ?auto_464867 ?auto_464872 ) ) ( not ( = ?auto_464867 ?auto_464873 ) ) ( not ( = ?auto_464867 ?auto_464874 ) ) ( not ( = ?auto_464867 ?auto_464875 ) ) ( not ( = ?auto_464867 ?auto_464876 ) ) ( not ( = ?auto_464867 ?auto_464877 ) ) ( not ( = ?auto_464867 ?auto_464878 ) ) ( not ( = ?auto_464868 ?auto_464869 ) ) ( not ( = ?auto_464868 ?auto_464870 ) ) ( not ( = ?auto_464868 ?auto_464871 ) ) ( not ( = ?auto_464868 ?auto_464872 ) ) ( not ( = ?auto_464868 ?auto_464873 ) ) ( not ( = ?auto_464868 ?auto_464874 ) ) ( not ( = ?auto_464868 ?auto_464875 ) ) ( not ( = ?auto_464868 ?auto_464876 ) ) ( not ( = ?auto_464868 ?auto_464877 ) ) ( not ( = ?auto_464868 ?auto_464878 ) ) ( not ( = ?auto_464869 ?auto_464870 ) ) ( not ( = ?auto_464869 ?auto_464871 ) ) ( not ( = ?auto_464869 ?auto_464872 ) ) ( not ( = ?auto_464869 ?auto_464873 ) ) ( not ( = ?auto_464869 ?auto_464874 ) ) ( not ( = ?auto_464869 ?auto_464875 ) ) ( not ( = ?auto_464869 ?auto_464876 ) ) ( not ( = ?auto_464869 ?auto_464877 ) ) ( not ( = ?auto_464869 ?auto_464878 ) ) ( not ( = ?auto_464870 ?auto_464871 ) ) ( not ( = ?auto_464870 ?auto_464872 ) ) ( not ( = ?auto_464870 ?auto_464873 ) ) ( not ( = ?auto_464870 ?auto_464874 ) ) ( not ( = ?auto_464870 ?auto_464875 ) ) ( not ( = ?auto_464870 ?auto_464876 ) ) ( not ( = ?auto_464870 ?auto_464877 ) ) ( not ( = ?auto_464870 ?auto_464878 ) ) ( not ( = ?auto_464871 ?auto_464872 ) ) ( not ( = ?auto_464871 ?auto_464873 ) ) ( not ( = ?auto_464871 ?auto_464874 ) ) ( not ( = ?auto_464871 ?auto_464875 ) ) ( not ( = ?auto_464871 ?auto_464876 ) ) ( not ( = ?auto_464871 ?auto_464877 ) ) ( not ( = ?auto_464871 ?auto_464878 ) ) ( not ( = ?auto_464872 ?auto_464873 ) ) ( not ( = ?auto_464872 ?auto_464874 ) ) ( not ( = ?auto_464872 ?auto_464875 ) ) ( not ( = ?auto_464872 ?auto_464876 ) ) ( not ( = ?auto_464872 ?auto_464877 ) ) ( not ( = ?auto_464872 ?auto_464878 ) ) ( not ( = ?auto_464873 ?auto_464874 ) ) ( not ( = ?auto_464873 ?auto_464875 ) ) ( not ( = ?auto_464873 ?auto_464876 ) ) ( not ( = ?auto_464873 ?auto_464877 ) ) ( not ( = ?auto_464873 ?auto_464878 ) ) ( not ( = ?auto_464874 ?auto_464875 ) ) ( not ( = ?auto_464874 ?auto_464876 ) ) ( not ( = ?auto_464874 ?auto_464877 ) ) ( not ( = ?auto_464874 ?auto_464878 ) ) ( not ( = ?auto_464875 ?auto_464876 ) ) ( not ( = ?auto_464875 ?auto_464877 ) ) ( not ( = ?auto_464875 ?auto_464878 ) ) ( not ( = ?auto_464876 ?auto_464877 ) ) ( not ( = ?auto_464876 ?auto_464878 ) ) ( not ( = ?auto_464877 ?auto_464878 ) ) ( ON ?auto_464876 ?auto_464877 ) ( ON ?auto_464875 ?auto_464876 ) ( ON ?auto_464874 ?auto_464875 ) ( ON ?auto_464873 ?auto_464874 ) ( ON ?auto_464872 ?auto_464873 ) ( ON ?auto_464871 ?auto_464872 ) ( ON ?auto_464870 ?auto_464871 ) ( ON ?auto_464869 ?auto_464870 ) ( ON ?auto_464868 ?auto_464869 ) ( ON ?auto_464867 ?auto_464868 ) ( ON ?auto_464866 ?auto_464867 ) ( ON ?auto_464865 ?auto_464866 ) ( ON ?auto_464864 ?auto_464865 ) ( ON ?auto_464863 ?auto_464864 ) ( CLEAR ?auto_464863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_464863 )
      ( MAKE-15PILE ?auto_464863 ?auto_464864 ?auto_464865 ?auto_464866 ?auto_464867 ?auto_464868 ?auto_464869 ?auto_464870 ?auto_464871 ?auto_464872 ?auto_464873 ?auto_464874 ?auto_464875 ?auto_464876 ?auto_464877 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464894 - BLOCK
      ?auto_464895 - BLOCK
      ?auto_464896 - BLOCK
      ?auto_464897 - BLOCK
      ?auto_464898 - BLOCK
      ?auto_464899 - BLOCK
      ?auto_464900 - BLOCK
      ?auto_464901 - BLOCK
      ?auto_464902 - BLOCK
      ?auto_464903 - BLOCK
      ?auto_464904 - BLOCK
      ?auto_464905 - BLOCK
      ?auto_464906 - BLOCK
      ?auto_464907 - BLOCK
      ?auto_464908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_464908 ) ( not ( = ?auto_464894 ?auto_464895 ) ) ( not ( = ?auto_464894 ?auto_464896 ) ) ( not ( = ?auto_464894 ?auto_464897 ) ) ( not ( = ?auto_464894 ?auto_464898 ) ) ( not ( = ?auto_464894 ?auto_464899 ) ) ( not ( = ?auto_464894 ?auto_464900 ) ) ( not ( = ?auto_464894 ?auto_464901 ) ) ( not ( = ?auto_464894 ?auto_464902 ) ) ( not ( = ?auto_464894 ?auto_464903 ) ) ( not ( = ?auto_464894 ?auto_464904 ) ) ( not ( = ?auto_464894 ?auto_464905 ) ) ( not ( = ?auto_464894 ?auto_464906 ) ) ( not ( = ?auto_464894 ?auto_464907 ) ) ( not ( = ?auto_464894 ?auto_464908 ) ) ( not ( = ?auto_464895 ?auto_464896 ) ) ( not ( = ?auto_464895 ?auto_464897 ) ) ( not ( = ?auto_464895 ?auto_464898 ) ) ( not ( = ?auto_464895 ?auto_464899 ) ) ( not ( = ?auto_464895 ?auto_464900 ) ) ( not ( = ?auto_464895 ?auto_464901 ) ) ( not ( = ?auto_464895 ?auto_464902 ) ) ( not ( = ?auto_464895 ?auto_464903 ) ) ( not ( = ?auto_464895 ?auto_464904 ) ) ( not ( = ?auto_464895 ?auto_464905 ) ) ( not ( = ?auto_464895 ?auto_464906 ) ) ( not ( = ?auto_464895 ?auto_464907 ) ) ( not ( = ?auto_464895 ?auto_464908 ) ) ( not ( = ?auto_464896 ?auto_464897 ) ) ( not ( = ?auto_464896 ?auto_464898 ) ) ( not ( = ?auto_464896 ?auto_464899 ) ) ( not ( = ?auto_464896 ?auto_464900 ) ) ( not ( = ?auto_464896 ?auto_464901 ) ) ( not ( = ?auto_464896 ?auto_464902 ) ) ( not ( = ?auto_464896 ?auto_464903 ) ) ( not ( = ?auto_464896 ?auto_464904 ) ) ( not ( = ?auto_464896 ?auto_464905 ) ) ( not ( = ?auto_464896 ?auto_464906 ) ) ( not ( = ?auto_464896 ?auto_464907 ) ) ( not ( = ?auto_464896 ?auto_464908 ) ) ( not ( = ?auto_464897 ?auto_464898 ) ) ( not ( = ?auto_464897 ?auto_464899 ) ) ( not ( = ?auto_464897 ?auto_464900 ) ) ( not ( = ?auto_464897 ?auto_464901 ) ) ( not ( = ?auto_464897 ?auto_464902 ) ) ( not ( = ?auto_464897 ?auto_464903 ) ) ( not ( = ?auto_464897 ?auto_464904 ) ) ( not ( = ?auto_464897 ?auto_464905 ) ) ( not ( = ?auto_464897 ?auto_464906 ) ) ( not ( = ?auto_464897 ?auto_464907 ) ) ( not ( = ?auto_464897 ?auto_464908 ) ) ( not ( = ?auto_464898 ?auto_464899 ) ) ( not ( = ?auto_464898 ?auto_464900 ) ) ( not ( = ?auto_464898 ?auto_464901 ) ) ( not ( = ?auto_464898 ?auto_464902 ) ) ( not ( = ?auto_464898 ?auto_464903 ) ) ( not ( = ?auto_464898 ?auto_464904 ) ) ( not ( = ?auto_464898 ?auto_464905 ) ) ( not ( = ?auto_464898 ?auto_464906 ) ) ( not ( = ?auto_464898 ?auto_464907 ) ) ( not ( = ?auto_464898 ?auto_464908 ) ) ( not ( = ?auto_464899 ?auto_464900 ) ) ( not ( = ?auto_464899 ?auto_464901 ) ) ( not ( = ?auto_464899 ?auto_464902 ) ) ( not ( = ?auto_464899 ?auto_464903 ) ) ( not ( = ?auto_464899 ?auto_464904 ) ) ( not ( = ?auto_464899 ?auto_464905 ) ) ( not ( = ?auto_464899 ?auto_464906 ) ) ( not ( = ?auto_464899 ?auto_464907 ) ) ( not ( = ?auto_464899 ?auto_464908 ) ) ( not ( = ?auto_464900 ?auto_464901 ) ) ( not ( = ?auto_464900 ?auto_464902 ) ) ( not ( = ?auto_464900 ?auto_464903 ) ) ( not ( = ?auto_464900 ?auto_464904 ) ) ( not ( = ?auto_464900 ?auto_464905 ) ) ( not ( = ?auto_464900 ?auto_464906 ) ) ( not ( = ?auto_464900 ?auto_464907 ) ) ( not ( = ?auto_464900 ?auto_464908 ) ) ( not ( = ?auto_464901 ?auto_464902 ) ) ( not ( = ?auto_464901 ?auto_464903 ) ) ( not ( = ?auto_464901 ?auto_464904 ) ) ( not ( = ?auto_464901 ?auto_464905 ) ) ( not ( = ?auto_464901 ?auto_464906 ) ) ( not ( = ?auto_464901 ?auto_464907 ) ) ( not ( = ?auto_464901 ?auto_464908 ) ) ( not ( = ?auto_464902 ?auto_464903 ) ) ( not ( = ?auto_464902 ?auto_464904 ) ) ( not ( = ?auto_464902 ?auto_464905 ) ) ( not ( = ?auto_464902 ?auto_464906 ) ) ( not ( = ?auto_464902 ?auto_464907 ) ) ( not ( = ?auto_464902 ?auto_464908 ) ) ( not ( = ?auto_464903 ?auto_464904 ) ) ( not ( = ?auto_464903 ?auto_464905 ) ) ( not ( = ?auto_464903 ?auto_464906 ) ) ( not ( = ?auto_464903 ?auto_464907 ) ) ( not ( = ?auto_464903 ?auto_464908 ) ) ( not ( = ?auto_464904 ?auto_464905 ) ) ( not ( = ?auto_464904 ?auto_464906 ) ) ( not ( = ?auto_464904 ?auto_464907 ) ) ( not ( = ?auto_464904 ?auto_464908 ) ) ( not ( = ?auto_464905 ?auto_464906 ) ) ( not ( = ?auto_464905 ?auto_464907 ) ) ( not ( = ?auto_464905 ?auto_464908 ) ) ( not ( = ?auto_464906 ?auto_464907 ) ) ( not ( = ?auto_464906 ?auto_464908 ) ) ( not ( = ?auto_464907 ?auto_464908 ) ) ( ON ?auto_464907 ?auto_464908 ) ( ON ?auto_464906 ?auto_464907 ) ( ON ?auto_464905 ?auto_464906 ) ( ON ?auto_464904 ?auto_464905 ) ( ON ?auto_464903 ?auto_464904 ) ( ON ?auto_464902 ?auto_464903 ) ( ON ?auto_464901 ?auto_464902 ) ( ON ?auto_464900 ?auto_464901 ) ( ON ?auto_464899 ?auto_464900 ) ( ON ?auto_464898 ?auto_464899 ) ( ON ?auto_464897 ?auto_464898 ) ( ON ?auto_464896 ?auto_464897 ) ( ON ?auto_464895 ?auto_464896 ) ( ON ?auto_464894 ?auto_464895 ) ( CLEAR ?auto_464894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_464894 )
      ( MAKE-15PILE ?auto_464894 ?auto_464895 ?auto_464896 ?auto_464897 ?auto_464898 ?auto_464899 ?auto_464900 ?auto_464901 ?auto_464902 ?auto_464903 ?auto_464904 ?auto_464905 ?auto_464906 ?auto_464907 ?auto_464908 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_464924 - BLOCK
      ?auto_464925 - BLOCK
      ?auto_464926 - BLOCK
      ?auto_464927 - BLOCK
      ?auto_464928 - BLOCK
      ?auto_464929 - BLOCK
      ?auto_464930 - BLOCK
      ?auto_464931 - BLOCK
      ?auto_464932 - BLOCK
      ?auto_464933 - BLOCK
      ?auto_464934 - BLOCK
      ?auto_464935 - BLOCK
      ?auto_464936 - BLOCK
      ?auto_464937 - BLOCK
      ?auto_464938 - BLOCK
    )
    :vars
    (
      ?auto_464939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_464924 ?auto_464925 ) ) ( not ( = ?auto_464924 ?auto_464926 ) ) ( not ( = ?auto_464924 ?auto_464927 ) ) ( not ( = ?auto_464924 ?auto_464928 ) ) ( not ( = ?auto_464924 ?auto_464929 ) ) ( not ( = ?auto_464924 ?auto_464930 ) ) ( not ( = ?auto_464924 ?auto_464931 ) ) ( not ( = ?auto_464924 ?auto_464932 ) ) ( not ( = ?auto_464924 ?auto_464933 ) ) ( not ( = ?auto_464924 ?auto_464934 ) ) ( not ( = ?auto_464924 ?auto_464935 ) ) ( not ( = ?auto_464924 ?auto_464936 ) ) ( not ( = ?auto_464924 ?auto_464937 ) ) ( not ( = ?auto_464924 ?auto_464938 ) ) ( not ( = ?auto_464925 ?auto_464926 ) ) ( not ( = ?auto_464925 ?auto_464927 ) ) ( not ( = ?auto_464925 ?auto_464928 ) ) ( not ( = ?auto_464925 ?auto_464929 ) ) ( not ( = ?auto_464925 ?auto_464930 ) ) ( not ( = ?auto_464925 ?auto_464931 ) ) ( not ( = ?auto_464925 ?auto_464932 ) ) ( not ( = ?auto_464925 ?auto_464933 ) ) ( not ( = ?auto_464925 ?auto_464934 ) ) ( not ( = ?auto_464925 ?auto_464935 ) ) ( not ( = ?auto_464925 ?auto_464936 ) ) ( not ( = ?auto_464925 ?auto_464937 ) ) ( not ( = ?auto_464925 ?auto_464938 ) ) ( not ( = ?auto_464926 ?auto_464927 ) ) ( not ( = ?auto_464926 ?auto_464928 ) ) ( not ( = ?auto_464926 ?auto_464929 ) ) ( not ( = ?auto_464926 ?auto_464930 ) ) ( not ( = ?auto_464926 ?auto_464931 ) ) ( not ( = ?auto_464926 ?auto_464932 ) ) ( not ( = ?auto_464926 ?auto_464933 ) ) ( not ( = ?auto_464926 ?auto_464934 ) ) ( not ( = ?auto_464926 ?auto_464935 ) ) ( not ( = ?auto_464926 ?auto_464936 ) ) ( not ( = ?auto_464926 ?auto_464937 ) ) ( not ( = ?auto_464926 ?auto_464938 ) ) ( not ( = ?auto_464927 ?auto_464928 ) ) ( not ( = ?auto_464927 ?auto_464929 ) ) ( not ( = ?auto_464927 ?auto_464930 ) ) ( not ( = ?auto_464927 ?auto_464931 ) ) ( not ( = ?auto_464927 ?auto_464932 ) ) ( not ( = ?auto_464927 ?auto_464933 ) ) ( not ( = ?auto_464927 ?auto_464934 ) ) ( not ( = ?auto_464927 ?auto_464935 ) ) ( not ( = ?auto_464927 ?auto_464936 ) ) ( not ( = ?auto_464927 ?auto_464937 ) ) ( not ( = ?auto_464927 ?auto_464938 ) ) ( not ( = ?auto_464928 ?auto_464929 ) ) ( not ( = ?auto_464928 ?auto_464930 ) ) ( not ( = ?auto_464928 ?auto_464931 ) ) ( not ( = ?auto_464928 ?auto_464932 ) ) ( not ( = ?auto_464928 ?auto_464933 ) ) ( not ( = ?auto_464928 ?auto_464934 ) ) ( not ( = ?auto_464928 ?auto_464935 ) ) ( not ( = ?auto_464928 ?auto_464936 ) ) ( not ( = ?auto_464928 ?auto_464937 ) ) ( not ( = ?auto_464928 ?auto_464938 ) ) ( not ( = ?auto_464929 ?auto_464930 ) ) ( not ( = ?auto_464929 ?auto_464931 ) ) ( not ( = ?auto_464929 ?auto_464932 ) ) ( not ( = ?auto_464929 ?auto_464933 ) ) ( not ( = ?auto_464929 ?auto_464934 ) ) ( not ( = ?auto_464929 ?auto_464935 ) ) ( not ( = ?auto_464929 ?auto_464936 ) ) ( not ( = ?auto_464929 ?auto_464937 ) ) ( not ( = ?auto_464929 ?auto_464938 ) ) ( not ( = ?auto_464930 ?auto_464931 ) ) ( not ( = ?auto_464930 ?auto_464932 ) ) ( not ( = ?auto_464930 ?auto_464933 ) ) ( not ( = ?auto_464930 ?auto_464934 ) ) ( not ( = ?auto_464930 ?auto_464935 ) ) ( not ( = ?auto_464930 ?auto_464936 ) ) ( not ( = ?auto_464930 ?auto_464937 ) ) ( not ( = ?auto_464930 ?auto_464938 ) ) ( not ( = ?auto_464931 ?auto_464932 ) ) ( not ( = ?auto_464931 ?auto_464933 ) ) ( not ( = ?auto_464931 ?auto_464934 ) ) ( not ( = ?auto_464931 ?auto_464935 ) ) ( not ( = ?auto_464931 ?auto_464936 ) ) ( not ( = ?auto_464931 ?auto_464937 ) ) ( not ( = ?auto_464931 ?auto_464938 ) ) ( not ( = ?auto_464932 ?auto_464933 ) ) ( not ( = ?auto_464932 ?auto_464934 ) ) ( not ( = ?auto_464932 ?auto_464935 ) ) ( not ( = ?auto_464932 ?auto_464936 ) ) ( not ( = ?auto_464932 ?auto_464937 ) ) ( not ( = ?auto_464932 ?auto_464938 ) ) ( not ( = ?auto_464933 ?auto_464934 ) ) ( not ( = ?auto_464933 ?auto_464935 ) ) ( not ( = ?auto_464933 ?auto_464936 ) ) ( not ( = ?auto_464933 ?auto_464937 ) ) ( not ( = ?auto_464933 ?auto_464938 ) ) ( not ( = ?auto_464934 ?auto_464935 ) ) ( not ( = ?auto_464934 ?auto_464936 ) ) ( not ( = ?auto_464934 ?auto_464937 ) ) ( not ( = ?auto_464934 ?auto_464938 ) ) ( not ( = ?auto_464935 ?auto_464936 ) ) ( not ( = ?auto_464935 ?auto_464937 ) ) ( not ( = ?auto_464935 ?auto_464938 ) ) ( not ( = ?auto_464936 ?auto_464937 ) ) ( not ( = ?auto_464936 ?auto_464938 ) ) ( not ( = ?auto_464937 ?auto_464938 ) ) ( ON ?auto_464924 ?auto_464939 ) ( not ( = ?auto_464938 ?auto_464939 ) ) ( not ( = ?auto_464937 ?auto_464939 ) ) ( not ( = ?auto_464936 ?auto_464939 ) ) ( not ( = ?auto_464935 ?auto_464939 ) ) ( not ( = ?auto_464934 ?auto_464939 ) ) ( not ( = ?auto_464933 ?auto_464939 ) ) ( not ( = ?auto_464932 ?auto_464939 ) ) ( not ( = ?auto_464931 ?auto_464939 ) ) ( not ( = ?auto_464930 ?auto_464939 ) ) ( not ( = ?auto_464929 ?auto_464939 ) ) ( not ( = ?auto_464928 ?auto_464939 ) ) ( not ( = ?auto_464927 ?auto_464939 ) ) ( not ( = ?auto_464926 ?auto_464939 ) ) ( not ( = ?auto_464925 ?auto_464939 ) ) ( not ( = ?auto_464924 ?auto_464939 ) ) ( ON ?auto_464925 ?auto_464924 ) ( ON ?auto_464926 ?auto_464925 ) ( ON ?auto_464927 ?auto_464926 ) ( ON ?auto_464928 ?auto_464927 ) ( ON ?auto_464929 ?auto_464928 ) ( ON ?auto_464930 ?auto_464929 ) ( ON ?auto_464931 ?auto_464930 ) ( ON ?auto_464932 ?auto_464931 ) ( ON ?auto_464933 ?auto_464932 ) ( ON ?auto_464934 ?auto_464933 ) ( ON ?auto_464935 ?auto_464934 ) ( ON ?auto_464936 ?auto_464935 ) ( ON ?auto_464937 ?auto_464936 ) ( ON ?auto_464938 ?auto_464937 ) ( CLEAR ?auto_464938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_464938 ?auto_464937 ?auto_464936 ?auto_464935 ?auto_464934 ?auto_464933 ?auto_464932 ?auto_464931 ?auto_464930 ?auto_464929 ?auto_464928 ?auto_464927 ?auto_464926 ?auto_464925 ?auto_464924 )
      ( MAKE-15PILE ?auto_464924 ?auto_464925 ?auto_464926 ?auto_464927 ?auto_464928 ?auto_464929 ?auto_464930 ?auto_464931 ?auto_464932 ?auto_464933 ?auto_464934 ?auto_464935 ?auto_464936 ?auto_464937 ?auto_464938 ) )
  )

)

