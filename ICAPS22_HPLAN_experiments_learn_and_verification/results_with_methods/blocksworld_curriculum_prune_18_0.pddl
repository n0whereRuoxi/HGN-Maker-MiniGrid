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
      ?auto_739681 - BLOCK
    )
    :vars
    (
      ?auto_739682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739681 ?auto_739682 ) ( CLEAR ?auto_739681 ) ( HAND-EMPTY ) ( not ( = ?auto_739681 ?auto_739682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_739681 ?auto_739682 )
      ( !PUTDOWN ?auto_739681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_739688 - BLOCK
      ?auto_739689 - BLOCK
    )
    :vars
    (
      ?auto_739690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_739688 ) ( ON ?auto_739689 ?auto_739690 ) ( CLEAR ?auto_739689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_739688 ) ( not ( = ?auto_739688 ?auto_739689 ) ) ( not ( = ?auto_739688 ?auto_739690 ) ) ( not ( = ?auto_739689 ?auto_739690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_739689 ?auto_739690 )
      ( !STACK ?auto_739689 ?auto_739688 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_739698 - BLOCK
      ?auto_739699 - BLOCK
    )
    :vars
    (
      ?auto_739700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739699 ?auto_739700 ) ( not ( = ?auto_739698 ?auto_739699 ) ) ( not ( = ?auto_739698 ?auto_739700 ) ) ( not ( = ?auto_739699 ?auto_739700 ) ) ( ON ?auto_739698 ?auto_739699 ) ( CLEAR ?auto_739698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_739698 )
      ( MAKE-2PILE ?auto_739698 ?auto_739699 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_739709 - BLOCK
      ?auto_739710 - BLOCK
      ?auto_739711 - BLOCK
    )
    :vars
    (
      ?auto_739712 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_739710 ) ( ON ?auto_739711 ?auto_739712 ) ( CLEAR ?auto_739711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_739709 ) ( ON ?auto_739710 ?auto_739709 ) ( not ( = ?auto_739709 ?auto_739710 ) ) ( not ( = ?auto_739709 ?auto_739711 ) ) ( not ( = ?auto_739709 ?auto_739712 ) ) ( not ( = ?auto_739710 ?auto_739711 ) ) ( not ( = ?auto_739710 ?auto_739712 ) ) ( not ( = ?auto_739711 ?auto_739712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_739711 ?auto_739712 )
      ( !STACK ?auto_739711 ?auto_739710 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_739723 - BLOCK
      ?auto_739724 - BLOCK
      ?auto_739725 - BLOCK
    )
    :vars
    (
      ?auto_739726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739725 ?auto_739726 ) ( ON-TABLE ?auto_739723 ) ( not ( = ?auto_739723 ?auto_739724 ) ) ( not ( = ?auto_739723 ?auto_739725 ) ) ( not ( = ?auto_739723 ?auto_739726 ) ) ( not ( = ?auto_739724 ?auto_739725 ) ) ( not ( = ?auto_739724 ?auto_739726 ) ) ( not ( = ?auto_739725 ?auto_739726 ) ) ( CLEAR ?auto_739723 ) ( ON ?auto_739724 ?auto_739725 ) ( CLEAR ?auto_739724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_739723 ?auto_739724 )
      ( MAKE-3PILE ?auto_739723 ?auto_739724 ?auto_739725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_739737 - BLOCK
      ?auto_739738 - BLOCK
      ?auto_739739 - BLOCK
    )
    :vars
    (
      ?auto_739740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739739 ?auto_739740 ) ( not ( = ?auto_739737 ?auto_739738 ) ) ( not ( = ?auto_739737 ?auto_739739 ) ) ( not ( = ?auto_739737 ?auto_739740 ) ) ( not ( = ?auto_739738 ?auto_739739 ) ) ( not ( = ?auto_739738 ?auto_739740 ) ) ( not ( = ?auto_739739 ?auto_739740 ) ) ( ON ?auto_739738 ?auto_739739 ) ( ON ?auto_739737 ?auto_739738 ) ( CLEAR ?auto_739737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_739737 )
      ( MAKE-3PILE ?auto_739737 ?auto_739738 ?auto_739739 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_739752 - BLOCK
      ?auto_739753 - BLOCK
      ?auto_739754 - BLOCK
      ?auto_739755 - BLOCK
    )
    :vars
    (
      ?auto_739756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_739754 ) ( ON ?auto_739755 ?auto_739756 ) ( CLEAR ?auto_739755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_739752 ) ( ON ?auto_739753 ?auto_739752 ) ( ON ?auto_739754 ?auto_739753 ) ( not ( = ?auto_739752 ?auto_739753 ) ) ( not ( = ?auto_739752 ?auto_739754 ) ) ( not ( = ?auto_739752 ?auto_739755 ) ) ( not ( = ?auto_739752 ?auto_739756 ) ) ( not ( = ?auto_739753 ?auto_739754 ) ) ( not ( = ?auto_739753 ?auto_739755 ) ) ( not ( = ?auto_739753 ?auto_739756 ) ) ( not ( = ?auto_739754 ?auto_739755 ) ) ( not ( = ?auto_739754 ?auto_739756 ) ) ( not ( = ?auto_739755 ?auto_739756 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_739755 ?auto_739756 )
      ( !STACK ?auto_739755 ?auto_739754 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_739770 - BLOCK
      ?auto_739771 - BLOCK
      ?auto_739772 - BLOCK
      ?auto_739773 - BLOCK
    )
    :vars
    (
      ?auto_739774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739773 ?auto_739774 ) ( ON-TABLE ?auto_739770 ) ( ON ?auto_739771 ?auto_739770 ) ( not ( = ?auto_739770 ?auto_739771 ) ) ( not ( = ?auto_739770 ?auto_739772 ) ) ( not ( = ?auto_739770 ?auto_739773 ) ) ( not ( = ?auto_739770 ?auto_739774 ) ) ( not ( = ?auto_739771 ?auto_739772 ) ) ( not ( = ?auto_739771 ?auto_739773 ) ) ( not ( = ?auto_739771 ?auto_739774 ) ) ( not ( = ?auto_739772 ?auto_739773 ) ) ( not ( = ?auto_739772 ?auto_739774 ) ) ( not ( = ?auto_739773 ?auto_739774 ) ) ( CLEAR ?auto_739771 ) ( ON ?auto_739772 ?auto_739773 ) ( CLEAR ?auto_739772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_739770 ?auto_739771 ?auto_739772 )
      ( MAKE-4PILE ?auto_739770 ?auto_739771 ?auto_739772 ?auto_739773 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_739788 - BLOCK
      ?auto_739789 - BLOCK
      ?auto_739790 - BLOCK
      ?auto_739791 - BLOCK
    )
    :vars
    (
      ?auto_739792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739791 ?auto_739792 ) ( ON-TABLE ?auto_739788 ) ( not ( = ?auto_739788 ?auto_739789 ) ) ( not ( = ?auto_739788 ?auto_739790 ) ) ( not ( = ?auto_739788 ?auto_739791 ) ) ( not ( = ?auto_739788 ?auto_739792 ) ) ( not ( = ?auto_739789 ?auto_739790 ) ) ( not ( = ?auto_739789 ?auto_739791 ) ) ( not ( = ?auto_739789 ?auto_739792 ) ) ( not ( = ?auto_739790 ?auto_739791 ) ) ( not ( = ?auto_739790 ?auto_739792 ) ) ( not ( = ?auto_739791 ?auto_739792 ) ) ( ON ?auto_739790 ?auto_739791 ) ( CLEAR ?auto_739788 ) ( ON ?auto_739789 ?auto_739790 ) ( CLEAR ?auto_739789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_739788 ?auto_739789 )
      ( MAKE-4PILE ?auto_739788 ?auto_739789 ?auto_739790 ?auto_739791 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_739806 - BLOCK
      ?auto_739807 - BLOCK
      ?auto_739808 - BLOCK
      ?auto_739809 - BLOCK
    )
    :vars
    (
      ?auto_739810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739809 ?auto_739810 ) ( not ( = ?auto_739806 ?auto_739807 ) ) ( not ( = ?auto_739806 ?auto_739808 ) ) ( not ( = ?auto_739806 ?auto_739809 ) ) ( not ( = ?auto_739806 ?auto_739810 ) ) ( not ( = ?auto_739807 ?auto_739808 ) ) ( not ( = ?auto_739807 ?auto_739809 ) ) ( not ( = ?auto_739807 ?auto_739810 ) ) ( not ( = ?auto_739808 ?auto_739809 ) ) ( not ( = ?auto_739808 ?auto_739810 ) ) ( not ( = ?auto_739809 ?auto_739810 ) ) ( ON ?auto_739808 ?auto_739809 ) ( ON ?auto_739807 ?auto_739808 ) ( ON ?auto_739806 ?auto_739807 ) ( CLEAR ?auto_739806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_739806 )
      ( MAKE-4PILE ?auto_739806 ?auto_739807 ?auto_739808 ?auto_739809 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_739825 - BLOCK
      ?auto_739826 - BLOCK
      ?auto_739827 - BLOCK
      ?auto_739828 - BLOCK
      ?auto_739829 - BLOCK
    )
    :vars
    (
      ?auto_739830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_739828 ) ( ON ?auto_739829 ?auto_739830 ) ( CLEAR ?auto_739829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_739825 ) ( ON ?auto_739826 ?auto_739825 ) ( ON ?auto_739827 ?auto_739826 ) ( ON ?auto_739828 ?auto_739827 ) ( not ( = ?auto_739825 ?auto_739826 ) ) ( not ( = ?auto_739825 ?auto_739827 ) ) ( not ( = ?auto_739825 ?auto_739828 ) ) ( not ( = ?auto_739825 ?auto_739829 ) ) ( not ( = ?auto_739825 ?auto_739830 ) ) ( not ( = ?auto_739826 ?auto_739827 ) ) ( not ( = ?auto_739826 ?auto_739828 ) ) ( not ( = ?auto_739826 ?auto_739829 ) ) ( not ( = ?auto_739826 ?auto_739830 ) ) ( not ( = ?auto_739827 ?auto_739828 ) ) ( not ( = ?auto_739827 ?auto_739829 ) ) ( not ( = ?auto_739827 ?auto_739830 ) ) ( not ( = ?auto_739828 ?auto_739829 ) ) ( not ( = ?auto_739828 ?auto_739830 ) ) ( not ( = ?auto_739829 ?auto_739830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_739829 ?auto_739830 )
      ( !STACK ?auto_739829 ?auto_739828 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_739847 - BLOCK
      ?auto_739848 - BLOCK
      ?auto_739849 - BLOCK
      ?auto_739850 - BLOCK
      ?auto_739851 - BLOCK
    )
    :vars
    (
      ?auto_739852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739851 ?auto_739852 ) ( ON-TABLE ?auto_739847 ) ( ON ?auto_739848 ?auto_739847 ) ( ON ?auto_739849 ?auto_739848 ) ( not ( = ?auto_739847 ?auto_739848 ) ) ( not ( = ?auto_739847 ?auto_739849 ) ) ( not ( = ?auto_739847 ?auto_739850 ) ) ( not ( = ?auto_739847 ?auto_739851 ) ) ( not ( = ?auto_739847 ?auto_739852 ) ) ( not ( = ?auto_739848 ?auto_739849 ) ) ( not ( = ?auto_739848 ?auto_739850 ) ) ( not ( = ?auto_739848 ?auto_739851 ) ) ( not ( = ?auto_739848 ?auto_739852 ) ) ( not ( = ?auto_739849 ?auto_739850 ) ) ( not ( = ?auto_739849 ?auto_739851 ) ) ( not ( = ?auto_739849 ?auto_739852 ) ) ( not ( = ?auto_739850 ?auto_739851 ) ) ( not ( = ?auto_739850 ?auto_739852 ) ) ( not ( = ?auto_739851 ?auto_739852 ) ) ( CLEAR ?auto_739849 ) ( ON ?auto_739850 ?auto_739851 ) ( CLEAR ?auto_739850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_739847 ?auto_739848 ?auto_739849 ?auto_739850 )
      ( MAKE-5PILE ?auto_739847 ?auto_739848 ?auto_739849 ?auto_739850 ?auto_739851 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_739869 - BLOCK
      ?auto_739870 - BLOCK
      ?auto_739871 - BLOCK
      ?auto_739872 - BLOCK
      ?auto_739873 - BLOCK
    )
    :vars
    (
      ?auto_739874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739873 ?auto_739874 ) ( ON-TABLE ?auto_739869 ) ( ON ?auto_739870 ?auto_739869 ) ( not ( = ?auto_739869 ?auto_739870 ) ) ( not ( = ?auto_739869 ?auto_739871 ) ) ( not ( = ?auto_739869 ?auto_739872 ) ) ( not ( = ?auto_739869 ?auto_739873 ) ) ( not ( = ?auto_739869 ?auto_739874 ) ) ( not ( = ?auto_739870 ?auto_739871 ) ) ( not ( = ?auto_739870 ?auto_739872 ) ) ( not ( = ?auto_739870 ?auto_739873 ) ) ( not ( = ?auto_739870 ?auto_739874 ) ) ( not ( = ?auto_739871 ?auto_739872 ) ) ( not ( = ?auto_739871 ?auto_739873 ) ) ( not ( = ?auto_739871 ?auto_739874 ) ) ( not ( = ?auto_739872 ?auto_739873 ) ) ( not ( = ?auto_739872 ?auto_739874 ) ) ( not ( = ?auto_739873 ?auto_739874 ) ) ( ON ?auto_739872 ?auto_739873 ) ( CLEAR ?auto_739870 ) ( ON ?auto_739871 ?auto_739872 ) ( CLEAR ?auto_739871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_739869 ?auto_739870 ?auto_739871 )
      ( MAKE-5PILE ?auto_739869 ?auto_739870 ?auto_739871 ?auto_739872 ?auto_739873 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_739891 - BLOCK
      ?auto_739892 - BLOCK
      ?auto_739893 - BLOCK
      ?auto_739894 - BLOCK
      ?auto_739895 - BLOCK
    )
    :vars
    (
      ?auto_739896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739895 ?auto_739896 ) ( ON-TABLE ?auto_739891 ) ( not ( = ?auto_739891 ?auto_739892 ) ) ( not ( = ?auto_739891 ?auto_739893 ) ) ( not ( = ?auto_739891 ?auto_739894 ) ) ( not ( = ?auto_739891 ?auto_739895 ) ) ( not ( = ?auto_739891 ?auto_739896 ) ) ( not ( = ?auto_739892 ?auto_739893 ) ) ( not ( = ?auto_739892 ?auto_739894 ) ) ( not ( = ?auto_739892 ?auto_739895 ) ) ( not ( = ?auto_739892 ?auto_739896 ) ) ( not ( = ?auto_739893 ?auto_739894 ) ) ( not ( = ?auto_739893 ?auto_739895 ) ) ( not ( = ?auto_739893 ?auto_739896 ) ) ( not ( = ?auto_739894 ?auto_739895 ) ) ( not ( = ?auto_739894 ?auto_739896 ) ) ( not ( = ?auto_739895 ?auto_739896 ) ) ( ON ?auto_739894 ?auto_739895 ) ( ON ?auto_739893 ?auto_739894 ) ( CLEAR ?auto_739891 ) ( ON ?auto_739892 ?auto_739893 ) ( CLEAR ?auto_739892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_739891 ?auto_739892 )
      ( MAKE-5PILE ?auto_739891 ?auto_739892 ?auto_739893 ?auto_739894 ?auto_739895 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_739913 - BLOCK
      ?auto_739914 - BLOCK
      ?auto_739915 - BLOCK
      ?auto_739916 - BLOCK
      ?auto_739917 - BLOCK
    )
    :vars
    (
      ?auto_739918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739917 ?auto_739918 ) ( not ( = ?auto_739913 ?auto_739914 ) ) ( not ( = ?auto_739913 ?auto_739915 ) ) ( not ( = ?auto_739913 ?auto_739916 ) ) ( not ( = ?auto_739913 ?auto_739917 ) ) ( not ( = ?auto_739913 ?auto_739918 ) ) ( not ( = ?auto_739914 ?auto_739915 ) ) ( not ( = ?auto_739914 ?auto_739916 ) ) ( not ( = ?auto_739914 ?auto_739917 ) ) ( not ( = ?auto_739914 ?auto_739918 ) ) ( not ( = ?auto_739915 ?auto_739916 ) ) ( not ( = ?auto_739915 ?auto_739917 ) ) ( not ( = ?auto_739915 ?auto_739918 ) ) ( not ( = ?auto_739916 ?auto_739917 ) ) ( not ( = ?auto_739916 ?auto_739918 ) ) ( not ( = ?auto_739917 ?auto_739918 ) ) ( ON ?auto_739916 ?auto_739917 ) ( ON ?auto_739915 ?auto_739916 ) ( ON ?auto_739914 ?auto_739915 ) ( ON ?auto_739913 ?auto_739914 ) ( CLEAR ?auto_739913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_739913 )
      ( MAKE-5PILE ?auto_739913 ?auto_739914 ?auto_739915 ?auto_739916 ?auto_739917 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_739936 - BLOCK
      ?auto_739937 - BLOCK
      ?auto_739938 - BLOCK
      ?auto_739939 - BLOCK
      ?auto_739940 - BLOCK
      ?auto_739941 - BLOCK
    )
    :vars
    (
      ?auto_739942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_739940 ) ( ON ?auto_739941 ?auto_739942 ) ( CLEAR ?auto_739941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_739936 ) ( ON ?auto_739937 ?auto_739936 ) ( ON ?auto_739938 ?auto_739937 ) ( ON ?auto_739939 ?auto_739938 ) ( ON ?auto_739940 ?auto_739939 ) ( not ( = ?auto_739936 ?auto_739937 ) ) ( not ( = ?auto_739936 ?auto_739938 ) ) ( not ( = ?auto_739936 ?auto_739939 ) ) ( not ( = ?auto_739936 ?auto_739940 ) ) ( not ( = ?auto_739936 ?auto_739941 ) ) ( not ( = ?auto_739936 ?auto_739942 ) ) ( not ( = ?auto_739937 ?auto_739938 ) ) ( not ( = ?auto_739937 ?auto_739939 ) ) ( not ( = ?auto_739937 ?auto_739940 ) ) ( not ( = ?auto_739937 ?auto_739941 ) ) ( not ( = ?auto_739937 ?auto_739942 ) ) ( not ( = ?auto_739938 ?auto_739939 ) ) ( not ( = ?auto_739938 ?auto_739940 ) ) ( not ( = ?auto_739938 ?auto_739941 ) ) ( not ( = ?auto_739938 ?auto_739942 ) ) ( not ( = ?auto_739939 ?auto_739940 ) ) ( not ( = ?auto_739939 ?auto_739941 ) ) ( not ( = ?auto_739939 ?auto_739942 ) ) ( not ( = ?auto_739940 ?auto_739941 ) ) ( not ( = ?auto_739940 ?auto_739942 ) ) ( not ( = ?auto_739941 ?auto_739942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_739941 ?auto_739942 )
      ( !STACK ?auto_739941 ?auto_739940 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_739962 - BLOCK
      ?auto_739963 - BLOCK
      ?auto_739964 - BLOCK
      ?auto_739965 - BLOCK
      ?auto_739966 - BLOCK
      ?auto_739967 - BLOCK
    )
    :vars
    (
      ?auto_739968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739967 ?auto_739968 ) ( ON-TABLE ?auto_739962 ) ( ON ?auto_739963 ?auto_739962 ) ( ON ?auto_739964 ?auto_739963 ) ( ON ?auto_739965 ?auto_739964 ) ( not ( = ?auto_739962 ?auto_739963 ) ) ( not ( = ?auto_739962 ?auto_739964 ) ) ( not ( = ?auto_739962 ?auto_739965 ) ) ( not ( = ?auto_739962 ?auto_739966 ) ) ( not ( = ?auto_739962 ?auto_739967 ) ) ( not ( = ?auto_739962 ?auto_739968 ) ) ( not ( = ?auto_739963 ?auto_739964 ) ) ( not ( = ?auto_739963 ?auto_739965 ) ) ( not ( = ?auto_739963 ?auto_739966 ) ) ( not ( = ?auto_739963 ?auto_739967 ) ) ( not ( = ?auto_739963 ?auto_739968 ) ) ( not ( = ?auto_739964 ?auto_739965 ) ) ( not ( = ?auto_739964 ?auto_739966 ) ) ( not ( = ?auto_739964 ?auto_739967 ) ) ( not ( = ?auto_739964 ?auto_739968 ) ) ( not ( = ?auto_739965 ?auto_739966 ) ) ( not ( = ?auto_739965 ?auto_739967 ) ) ( not ( = ?auto_739965 ?auto_739968 ) ) ( not ( = ?auto_739966 ?auto_739967 ) ) ( not ( = ?auto_739966 ?auto_739968 ) ) ( not ( = ?auto_739967 ?auto_739968 ) ) ( CLEAR ?auto_739965 ) ( ON ?auto_739966 ?auto_739967 ) ( CLEAR ?auto_739966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_739962 ?auto_739963 ?auto_739964 ?auto_739965 ?auto_739966 )
      ( MAKE-6PILE ?auto_739962 ?auto_739963 ?auto_739964 ?auto_739965 ?auto_739966 ?auto_739967 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_739988 - BLOCK
      ?auto_739989 - BLOCK
      ?auto_739990 - BLOCK
      ?auto_739991 - BLOCK
      ?auto_739992 - BLOCK
      ?auto_739993 - BLOCK
    )
    :vars
    (
      ?auto_739994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739993 ?auto_739994 ) ( ON-TABLE ?auto_739988 ) ( ON ?auto_739989 ?auto_739988 ) ( ON ?auto_739990 ?auto_739989 ) ( not ( = ?auto_739988 ?auto_739989 ) ) ( not ( = ?auto_739988 ?auto_739990 ) ) ( not ( = ?auto_739988 ?auto_739991 ) ) ( not ( = ?auto_739988 ?auto_739992 ) ) ( not ( = ?auto_739988 ?auto_739993 ) ) ( not ( = ?auto_739988 ?auto_739994 ) ) ( not ( = ?auto_739989 ?auto_739990 ) ) ( not ( = ?auto_739989 ?auto_739991 ) ) ( not ( = ?auto_739989 ?auto_739992 ) ) ( not ( = ?auto_739989 ?auto_739993 ) ) ( not ( = ?auto_739989 ?auto_739994 ) ) ( not ( = ?auto_739990 ?auto_739991 ) ) ( not ( = ?auto_739990 ?auto_739992 ) ) ( not ( = ?auto_739990 ?auto_739993 ) ) ( not ( = ?auto_739990 ?auto_739994 ) ) ( not ( = ?auto_739991 ?auto_739992 ) ) ( not ( = ?auto_739991 ?auto_739993 ) ) ( not ( = ?auto_739991 ?auto_739994 ) ) ( not ( = ?auto_739992 ?auto_739993 ) ) ( not ( = ?auto_739992 ?auto_739994 ) ) ( not ( = ?auto_739993 ?auto_739994 ) ) ( ON ?auto_739992 ?auto_739993 ) ( CLEAR ?auto_739990 ) ( ON ?auto_739991 ?auto_739992 ) ( CLEAR ?auto_739991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_739988 ?auto_739989 ?auto_739990 ?auto_739991 )
      ( MAKE-6PILE ?auto_739988 ?auto_739989 ?auto_739990 ?auto_739991 ?auto_739992 ?auto_739993 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_740014 - BLOCK
      ?auto_740015 - BLOCK
      ?auto_740016 - BLOCK
      ?auto_740017 - BLOCK
      ?auto_740018 - BLOCK
      ?auto_740019 - BLOCK
    )
    :vars
    (
      ?auto_740020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740019 ?auto_740020 ) ( ON-TABLE ?auto_740014 ) ( ON ?auto_740015 ?auto_740014 ) ( not ( = ?auto_740014 ?auto_740015 ) ) ( not ( = ?auto_740014 ?auto_740016 ) ) ( not ( = ?auto_740014 ?auto_740017 ) ) ( not ( = ?auto_740014 ?auto_740018 ) ) ( not ( = ?auto_740014 ?auto_740019 ) ) ( not ( = ?auto_740014 ?auto_740020 ) ) ( not ( = ?auto_740015 ?auto_740016 ) ) ( not ( = ?auto_740015 ?auto_740017 ) ) ( not ( = ?auto_740015 ?auto_740018 ) ) ( not ( = ?auto_740015 ?auto_740019 ) ) ( not ( = ?auto_740015 ?auto_740020 ) ) ( not ( = ?auto_740016 ?auto_740017 ) ) ( not ( = ?auto_740016 ?auto_740018 ) ) ( not ( = ?auto_740016 ?auto_740019 ) ) ( not ( = ?auto_740016 ?auto_740020 ) ) ( not ( = ?auto_740017 ?auto_740018 ) ) ( not ( = ?auto_740017 ?auto_740019 ) ) ( not ( = ?auto_740017 ?auto_740020 ) ) ( not ( = ?auto_740018 ?auto_740019 ) ) ( not ( = ?auto_740018 ?auto_740020 ) ) ( not ( = ?auto_740019 ?auto_740020 ) ) ( ON ?auto_740018 ?auto_740019 ) ( ON ?auto_740017 ?auto_740018 ) ( CLEAR ?auto_740015 ) ( ON ?auto_740016 ?auto_740017 ) ( CLEAR ?auto_740016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_740014 ?auto_740015 ?auto_740016 )
      ( MAKE-6PILE ?auto_740014 ?auto_740015 ?auto_740016 ?auto_740017 ?auto_740018 ?auto_740019 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_740040 - BLOCK
      ?auto_740041 - BLOCK
      ?auto_740042 - BLOCK
      ?auto_740043 - BLOCK
      ?auto_740044 - BLOCK
      ?auto_740045 - BLOCK
    )
    :vars
    (
      ?auto_740046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740045 ?auto_740046 ) ( ON-TABLE ?auto_740040 ) ( not ( = ?auto_740040 ?auto_740041 ) ) ( not ( = ?auto_740040 ?auto_740042 ) ) ( not ( = ?auto_740040 ?auto_740043 ) ) ( not ( = ?auto_740040 ?auto_740044 ) ) ( not ( = ?auto_740040 ?auto_740045 ) ) ( not ( = ?auto_740040 ?auto_740046 ) ) ( not ( = ?auto_740041 ?auto_740042 ) ) ( not ( = ?auto_740041 ?auto_740043 ) ) ( not ( = ?auto_740041 ?auto_740044 ) ) ( not ( = ?auto_740041 ?auto_740045 ) ) ( not ( = ?auto_740041 ?auto_740046 ) ) ( not ( = ?auto_740042 ?auto_740043 ) ) ( not ( = ?auto_740042 ?auto_740044 ) ) ( not ( = ?auto_740042 ?auto_740045 ) ) ( not ( = ?auto_740042 ?auto_740046 ) ) ( not ( = ?auto_740043 ?auto_740044 ) ) ( not ( = ?auto_740043 ?auto_740045 ) ) ( not ( = ?auto_740043 ?auto_740046 ) ) ( not ( = ?auto_740044 ?auto_740045 ) ) ( not ( = ?auto_740044 ?auto_740046 ) ) ( not ( = ?auto_740045 ?auto_740046 ) ) ( ON ?auto_740044 ?auto_740045 ) ( ON ?auto_740043 ?auto_740044 ) ( ON ?auto_740042 ?auto_740043 ) ( CLEAR ?auto_740040 ) ( ON ?auto_740041 ?auto_740042 ) ( CLEAR ?auto_740041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_740040 ?auto_740041 )
      ( MAKE-6PILE ?auto_740040 ?auto_740041 ?auto_740042 ?auto_740043 ?auto_740044 ?auto_740045 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_740066 - BLOCK
      ?auto_740067 - BLOCK
      ?auto_740068 - BLOCK
      ?auto_740069 - BLOCK
      ?auto_740070 - BLOCK
      ?auto_740071 - BLOCK
    )
    :vars
    (
      ?auto_740072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740071 ?auto_740072 ) ( not ( = ?auto_740066 ?auto_740067 ) ) ( not ( = ?auto_740066 ?auto_740068 ) ) ( not ( = ?auto_740066 ?auto_740069 ) ) ( not ( = ?auto_740066 ?auto_740070 ) ) ( not ( = ?auto_740066 ?auto_740071 ) ) ( not ( = ?auto_740066 ?auto_740072 ) ) ( not ( = ?auto_740067 ?auto_740068 ) ) ( not ( = ?auto_740067 ?auto_740069 ) ) ( not ( = ?auto_740067 ?auto_740070 ) ) ( not ( = ?auto_740067 ?auto_740071 ) ) ( not ( = ?auto_740067 ?auto_740072 ) ) ( not ( = ?auto_740068 ?auto_740069 ) ) ( not ( = ?auto_740068 ?auto_740070 ) ) ( not ( = ?auto_740068 ?auto_740071 ) ) ( not ( = ?auto_740068 ?auto_740072 ) ) ( not ( = ?auto_740069 ?auto_740070 ) ) ( not ( = ?auto_740069 ?auto_740071 ) ) ( not ( = ?auto_740069 ?auto_740072 ) ) ( not ( = ?auto_740070 ?auto_740071 ) ) ( not ( = ?auto_740070 ?auto_740072 ) ) ( not ( = ?auto_740071 ?auto_740072 ) ) ( ON ?auto_740070 ?auto_740071 ) ( ON ?auto_740069 ?auto_740070 ) ( ON ?auto_740068 ?auto_740069 ) ( ON ?auto_740067 ?auto_740068 ) ( ON ?auto_740066 ?auto_740067 ) ( CLEAR ?auto_740066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_740066 )
      ( MAKE-6PILE ?auto_740066 ?auto_740067 ?auto_740068 ?auto_740069 ?auto_740070 ?auto_740071 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_740093 - BLOCK
      ?auto_740094 - BLOCK
      ?auto_740095 - BLOCK
      ?auto_740096 - BLOCK
      ?auto_740097 - BLOCK
      ?auto_740098 - BLOCK
      ?auto_740099 - BLOCK
    )
    :vars
    (
      ?auto_740100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_740098 ) ( ON ?auto_740099 ?auto_740100 ) ( CLEAR ?auto_740099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_740093 ) ( ON ?auto_740094 ?auto_740093 ) ( ON ?auto_740095 ?auto_740094 ) ( ON ?auto_740096 ?auto_740095 ) ( ON ?auto_740097 ?auto_740096 ) ( ON ?auto_740098 ?auto_740097 ) ( not ( = ?auto_740093 ?auto_740094 ) ) ( not ( = ?auto_740093 ?auto_740095 ) ) ( not ( = ?auto_740093 ?auto_740096 ) ) ( not ( = ?auto_740093 ?auto_740097 ) ) ( not ( = ?auto_740093 ?auto_740098 ) ) ( not ( = ?auto_740093 ?auto_740099 ) ) ( not ( = ?auto_740093 ?auto_740100 ) ) ( not ( = ?auto_740094 ?auto_740095 ) ) ( not ( = ?auto_740094 ?auto_740096 ) ) ( not ( = ?auto_740094 ?auto_740097 ) ) ( not ( = ?auto_740094 ?auto_740098 ) ) ( not ( = ?auto_740094 ?auto_740099 ) ) ( not ( = ?auto_740094 ?auto_740100 ) ) ( not ( = ?auto_740095 ?auto_740096 ) ) ( not ( = ?auto_740095 ?auto_740097 ) ) ( not ( = ?auto_740095 ?auto_740098 ) ) ( not ( = ?auto_740095 ?auto_740099 ) ) ( not ( = ?auto_740095 ?auto_740100 ) ) ( not ( = ?auto_740096 ?auto_740097 ) ) ( not ( = ?auto_740096 ?auto_740098 ) ) ( not ( = ?auto_740096 ?auto_740099 ) ) ( not ( = ?auto_740096 ?auto_740100 ) ) ( not ( = ?auto_740097 ?auto_740098 ) ) ( not ( = ?auto_740097 ?auto_740099 ) ) ( not ( = ?auto_740097 ?auto_740100 ) ) ( not ( = ?auto_740098 ?auto_740099 ) ) ( not ( = ?auto_740098 ?auto_740100 ) ) ( not ( = ?auto_740099 ?auto_740100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_740099 ?auto_740100 )
      ( !STACK ?auto_740099 ?auto_740098 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_740123 - BLOCK
      ?auto_740124 - BLOCK
      ?auto_740125 - BLOCK
      ?auto_740126 - BLOCK
      ?auto_740127 - BLOCK
      ?auto_740128 - BLOCK
      ?auto_740129 - BLOCK
    )
    :vars
    (
      ?auto_740130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740129 ?auto_740130 ) ( ON-TABLE ?auto_740123 ) ( ON ?auto_740124 ?auto_740123 ) ( ON ?auto_740125 ?auto_740124 ) ( ON ?auto_740126 ?auto_740125 ) ( ON ?auto_740127 ?auto_740126 ) ( not ( = ?auto_740123 ?auto_740124 ) ) ( not ( = ?auto_740123 ?auto_740125 ) ) ( not ( = ?auto_740123 ?auto_740126 ) ) ( not ( = ?auto_740123 ?auto_740127 ) ) ( not ( = ?auto_740123 ?auto_740128 ) ) ( not ( = ?auto_740123 ?auto_740129 ) ) ( not ( = ?auto_740123 ?auto_740130 ) ) ( not ( = ?auto_740124 ?auto_740125 ) ) ( not ( = ?auto_740124 ?auto_740126 ) ) ( not ( = ?auto_740124 ?auto_740127 ) ) ( not ( = ?auto_740124 ?auto_740128 ) ) ( not ( = ?auto_740124 ?auto_740129 ) ) ( not ( = ?auto_740124 ?auto_740130 ) ) ( not ( = ?auto_740125 ?auto_740126 ) ) ( not ( = ?auto_740125 ?auto_740127 ) ) ( not ( = ?auto_740125 ?auto_740128 ) ) ( not ( = ?auto_740125 ?auto_740129 ) ) ( not ( = ?auto_740125 ?auto_740130 ) ) ( not ( = ?auto_740126 ?auto_740127 ) ) ( not ( = ?auto_740126 ?auto_740128 ) ) ( not ( = ?auto_740126 ?auto_740129 ) ) ( not ( = ?auto_740126 ?auto_740130 ) ) ( not ( = ?auto_740127 ?auto_740128 ) ) ( not ( = ?auto_740127 ?auto_740129 ) ) ( not ( = ?auto_740127 ?auto_740130 ) ) ( not ( = ?auto_740128 ?auto_740129 ) ) ( not ( = ?auto_740128 ?auto_740130 ) ) ( not ( = ?auto_740129 ?auto_740130 ) ) ( CLEAR ?auto_740127 ) ( ON ?auto_740128 ?auto_740129 ) ( CLEAR ?auto_740128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_740123 ?auto_740124 ?auto_740125 ?auto_740126 ?auto_740127 ?auto_740128 )
      ( MAKE-7PILE ?auto_740123 ?auto_740124 ?auto_740125 ?auto_740126 ?auto_740127 ?auto_740128 ?auto_740129 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_740153 - BLOCK
      ?auto_740154 - BLOCK
      ?auto_740155 - BLOCK
      ?auto_740156 - BLOCK
      ?auto_740157 - BLOCK
      ?auto_740158 - BLOCK
      ?auto_740159 - BLOCK
    )
    :vars
    (
      ?auto_740160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740159 ?auto_740160 ) ( ON-TABLE ?auto_740153 ) ( ON ?auto_740154 ?auto_740153 ) ( ON ?auto_740155 ?auto_740154 ) ( ON ?auto_740156 ?auto_740155 ) ( not ( = ?auto_740153 ?auto_740154 ) ) ( not ( = ?auto_740153 ?auto_740155 ) ) ( not ( = ?auto_740153 ?auto_740156 ) ) ( not ( = ?auto_740153 ?auto_740157 ) ) ( not ( = ?auto_740153 ?auto_740158 ) ) ( not ( = ?auto_740153 ?auto_740159 ) ) ( not ( = ?auto_740153 ?auto_740160 ) ) ( not ( = ?auto_740154 ?auto_740155 ) ) ( not ( = ?auto_740154 ?auto_740156 ) ) ( not ( = ?auto_740154 ?auto_740157 ) ) ( not ( = ?auto_740154 ?auto_740158 ) ) ( not ( = ?auto_740154 ?auto_740159 ) ) ( not ( = ?auto_740154 ?auto_740160 ) ) ( not ( = ?auto_740155 ?auto_740156 ) ) ( not ( = ?auto_740155 ?auto_740157 ) ) ( not ( = ?auto_740155 ?auto_740158 ) ) ( not ( = ?auto_740155 ?auto_740159 ) ) ( not ( = ?auto_740155 ?auto_740160 ) ) ( not ( = ?auto_740156 ?auto_740157 ) ) ( not ( = ?auto_740156 ?auto_740158 ) ) ( not ( = ?auto_740156 ?auto_740159 ) ) ( not ( = ?auto_740156 ?auto_740160 ) ) ( not ( = ?auto_740157 ?auto_740158 ) ) ( not ( = ?auto_740157 ?auto_740159 ) ) ( not ( = ?auto_740157 ?auto_740160 ) ) ( not ( = ?auto_740158 ?auto_740159 ) ) ( not ( = ?auto_740158 ?auto_740160 ) ) ( not ( = ?auto_740159 ?auto_740160 ) ) ( ON ?auto_740158 ?auto_740159 ) ( CLEAR ?auto_740156 ) ( ON ?auto_740157 ?auto_740158 ) ( CLEAR ?auto_740157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_740153 ?auto_740154 ?auto_740155 ?auto_740156 ?auto_740157 )
      ( MAKE-7PILE ?auto_740153 ?auto_740154 ?auto_740155 ?auto_740156 ?auto_740157 ?auto_740158 ?auto_740159 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_740183 - BLOCK
      ?auto_740184 - BLOCK
      ?auto_740185 - BLOCK
      ?auto_740186 - BLOCK
      ?auto_740187 - BLOCK
      ?auto_740188 - BLOCK
      ?auto_740189 - BLOCK
    )
    :vars
    (
      ?auto_740190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740189 ?auto_740190 ) ( ON-TABLE ?auto_740183 ) ( ON ?auto_740184 ?auto_740183 ) ( ON ?auto_740185 ?auto_740184 ) ( not ( = ?auto_740183 ?auto_740184 ) ) ( not ( = ?auto_740183 ?auto_740185 ) ) ( not ( = ?auto_740183 ?auto_740186 ) ) ( not ( = ?auto_740183 ?auto_740187 ) ) ( not ( = ?auto_740183 ?auto_740188 ) ) ( not ( = ?auto_740183 ?auto_740189 ) ) ( not ( = ?auto_740183 ?auto_740190 ) ) ( not ( = ?auto_740184 ?auto_740185 ) ) ( not ( = ?auto_740184 ?auto_740186 ) ) ( not ( = ?auto_740184 ?auto_740187 ) ) ( not ( = ?auto_740184 ?auto_740188 ) ) ( not ( = ?auto_740184 ?auto_740189 ) ) ( not ( = ?auto_740184 ?auto_740190 ) ) ( not ( = ?auto_740185 ?auto_740186 ) ) ( not ( = ?auto_740185 ?auto_740187 ) ) ( not ( = ?auto_740185 ?auto_740188 ) ) ( not ( = ?auto_740185 ?auto_740189 ) ) ( not ( = ?auto_740185 ?auto_740190 ) ) ( not ( = ?auto_740186 ?auto_740187 ) ) ( not ( = ?auto_740186 ?auto_740188 ) ) ( not ( = ?auto_740186 ?auto_740189 ) ) ( not ( = ?auto_740186 ?auto_740190 ) ) ( not ( = ?auto_740187 ?auto_740188 ) ) ( not ( = ?auto_740187 ?auto_740189 ) ) ( not ( = ?auto_740187 ?auto_740190 ) ) ( not ( = ?auto_740188 ?auto_740189 ) ) ( not ( = ?auto_740188 ?auto_740190 ) ) ( not ( = ?auto_740189 ?auto_740190 ) ) ( ON ?auto_740188 ?auto_740189 ) ( ON ?auto_740187 ?auto_740188 ) ( CLEAR ?auto_740185 ) ( ON ?auto_740186 ?auto_740187 ) ( CLEAR ?auto_740186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_740183 ?auto_740184 ?auto_740185 ?auto_740186 )
      ( MAKE-7PILE ?auto_740183 ?auto_740184 ?auto_740185 ?auto_740186 ?auto_740187 ?auto_740188 ?auto_740189 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_740213 - BLOCK
      ?auto_740214 - BLOCK
      ?auto_740215 - BLOCK
      ?auto_740216 - BLOCK
      ?auto_740217 - BLOCK
      ?auto_740218 - BLOCK
      ?auto_740219 - BLOCK
    )
    :vars
    (
      ?auto_740220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740219 ?auto_740220 ) ( ON-TABLE ?auto_740213 ) ( ON ?auto_740214 ?auto_740213 ) ( not ( = ?auto_740213 ?auto_740214 ) ) ( not ( = ?auto_740213 ?auto_740215 ) ) ( not ( = ?auto_740213 ?auto_740216 ) ) ( not ( = ?auto_740213 ?auto_740217 ) ) ( not ( = ?auto_740213 ?auto_740218 ) ) ( not ( = ?auto_740213 ?auto_740219 ) ) ( not ( = ?auto_740213 ?auto_740220 ) ) ( not ( = ?auto_740214 ?auto_740215 ) ) ( not ( = ?auto_740214 ?auto_740216 ) ) ( not ( = ?auto_740214 ?auto_740217 ) ) ( not ( = ?auto_740214 ?auto_740218 ) ) ( not ( = ?auto_740214 ?auto_740219 ) ) ( not ( = ?auto_740214 ?auto_740220 ) ) ( not ( = ?auto_740215 ?auto_740216 ) ) ( not ( = ?auto_740215 ?auto_740217 ) ) ( not ( = ?auto_740215 ?auto_740218 ) ) ( not ( = ?auto_740215 ?auto_740219 ) ) ( not ( = ?auto_740215 ?auto_740220 ) ) ( not ( = ?auto_740216 ?auto_740217 ) ) ( not ( = ?auto_740216 ?auto_740218 ) ) ( not ( = ?auto_740216 ?auto_740219 ) ) ( not ( = ?auto_740216 ?auto_740220 ) ) ( not ( = ?auto_740217 ?auto_740218 ) ) ( not ( = ?auto_740217 ?auto_740219 ) ) ( not ( = ?auto_740217 ?auto_740220 ) ) ( not ( = ?auto_740218 ?auto_740219 ) ) ( not ( = ?auto_740218 ?auto_740220 ) ) ( not ( = ?auto_740219 ?auto_740220 ) ) ( ON ?auto_740218 ?auto_740219 ) ( ON ?auto_740217 ?auto_740218 ) ( ON ?auto_740216 ?auto_740217 ) ( CLEAR ?auto_740214 ) ( ON ?auto_740215 ?auto_740216 ) ( CLEAR ?auto_740215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_740213 ?auto_740214 ?auto_740215 )
      ( MAKE-7PILE ?auto_740213 ?auto_740214 ?auto_740215 ?auto_740216 ?auto_740217 ?auto_740218 ?auto_740219 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_740243 - BLOCK
      ?auto_740244 - BLOCK
      ?auto_740245 - BLOCK
      ?auto_740246 - BLOCK
      ?auto_740247 - BLOCK
      ?auto_740248 - BLOCK
      ?auto_740249 - BLOCK
    )
    :vars
    (
      ?auto_740250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740249 ?auto_740250 ) ( ON-TABLE ?auto_740243 ) ( not ( = ?auto_740243 ?auto_740244 ) ) ( not ( = ?auto_740243 ?auto_740245 ) ) ( not ( = ?auto_740243 ?auto_740246 ) ) ( not ( = ?auto_740243 ?auto_740247 ) ) ( not ( = ?auto_740243 ?auto_740248 ) ) ( not ( = ?auto_740243 ?auto_740249 ) ) ( not ( = ?auto_740243 ?auto_740250 ) ) ( not ( = ?auto_740244 ?auto_740245 ) ) ( not ( = ?auto_740244 ?auto_740246 ) ) ( not ( = ?auto_740244 ?auto_740247 ) ) ( not ( = ?auto_740244 ?auto_740248 ) ) ( not ( = ?auto_740244 ?auto_740249 ) ) ( not ( = ?auto_740244 ?auto_740250 ) ) ( not ( = ?auto_740245 ?auto_740246 ) ) ( not ( = ?auto_740245 ?auto_740247 ) ) ( not ( = ?auto_740245 ?auto_740248 ) ) ( not ( = ?auto_740245 ?auto_740249 ) ) ( not ( = ?auto_740245 ?auto_740250 ) ) ( not ( = ?auto_740246 ?auto_740247 ) ) ( not ( = ?auto_740246 ?auto_740248 ) ) ( not ( = ?auto_740246 ?auto_740249 ) ) ( not ( = ?auto_740246 ?auto_740250 ) ) ( not ( = ?auto_740247 ?auto_740248 ) ) ( not ( = ?auto_740247 ?auto_740249 ) ) ( not ( = ?auto_740247 ?auto_740250 ) ) ( not ( = ?auto_740248 ?auto_740249 ) ) ( not ( = ?auto_740248 ?auto_740250 ) ) ( not ( = ?auto_740249 ?auto_740250 ) ) ( ON ?auto_740248 ?auto_740249 ) ( ON ?auto_740247 ?auto_740248 ) ( ON ?auto_740246 ?auto_740247 ) ( ON ?auto_740245 ?auto_740246 ) ( CLEAR ?auto_740243 ) ( ON ?auto_740244 ?auto_740245 ) ( CLEAR ?auto_740244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_740243 ?auto_740244 )
      ( MAKE-7PILE ?auto_740243 ?auto_740244 ?auto_740245 ?auto_740246 ?auto_740247 ?auto_740248 ?auto_740249 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_740273 - BLOCK
      ?auto_740274 - BLOCK
      ?auto_740275 - BLOCK
      ?auto_740276 - BLOCK
      ?auto_740277 - BLOCK
      ?auto_740278 - BLOCK
      ?auto_740279 - BLOCK
    )
    :vars
    (
      ?auto_740280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740279 ?auto_740280 ) ( not ( = ?auto_740273 ?auto_740274 ) ) ( not ( = ?auto_740273 ?auto_740275 ) ) ( not ( = ?auto_740273 ?auto_740276 ) ) ( not ( = ?auto_740273 ?auto_740277 ) ) ( not ( = ?auto_740273 ?auto_740278 ) ) ( not ( = ?auto_740273 ?auto_740279 ) ) ( not ( = ?auto_740273 ?auto_740280 ) ) ( not ( = ?auto_740274 ?auto_740275 ) ) ( not ( = ?auto_740274 ?auto_740276 ) ) ( not ( = ?auto_740274 ?auto_740277 ) ) ( not ( = ?auto_740274 ?auto_740278 ) ) ( not ( = ?auto_740274 ?auto_740279 ) ) ( not ( = ?auto_740274 ?auto_740280 ) ) ( not ( = ?auto_740275 ?auto_740276 ) ) ( not ( = ?auto_740275 ?auto_740277 ) ) ( not ( = ?auto_740275 ?auto_740278 ) ) ( not ( = ?auto_740275 ?auto_740279 ) ) ( not ( = ?auto_740275 ?auto_740280 ) ) ( not ( = ?auto_740276 ?auto_740277 ) ) ( not ( = ?auto_740276 ?auto_740278 ) ) ( not ( = ?auto_740276 ?auto_740279 ) ) ( not ( = ?auto_740276 ?auto_740280 ) ) ( not ( = ?auto_740277 ?auto_740278 ) ) ( not ( = ?auto_740277 ?auto_740279 ) ) ( not ( = ?auto_740277 ?auto_740280 ) ) ( not ( = ?auto_740278 ?auto_740279 ) ) ( not ( = ?auto_740278 ?auto_740280 ) ) ( not ( = ?auto_740279 ?auto_740280 ) ) ( ON ?auto_740278 ?auto_740279 ) ( ON ?auto_740277 ?auto_740278 ) ( ON ?auto_740276 ?auto_740277 ) ( ON ?auto_740275 ?auto_740276 ) ( ON ?auto_740274 ?auto_740275 ) ( ON ?auto_740273 ?auto_740274 ) ( CLEAR ?auto_740273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_740273 )
      ( MAKE-7PILE ?auto_740273 ?auto_740274 ?auto_740275 ?auto_740276 ?auto_740277 ?auto_740278 ?auto_740279 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_740304 - BLOCK
      ?auto_740305 - BLOCK
      ?auto_740306 - BLOCK
      ?auto_740307 - BLOCK
      ?auto_740308 - BLOCK
      ?auto_740309 - BLOCK
      ?auto_740310 - BLOCK
      ?auto_740311 - BLOCK
    )
    :vars
    (
      ?auto_740312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_740310 ) ( ON ?auto_740311 ?auto_740312 ) ( CLEAR ?auto_740311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_740304 ) ( ON ?auto_740305 ?auto_740304 ) ( ON ?auto_740306 ?auto_740305 ) ( ON ?auto_740307 ?auto_740306 ) ( ON ?auto_740308 ?auto_740307 ) ( ON ?auto_740309 ?auto_740308 ) ( ON ?auto_740310 ?auto_740309 ) ( not ( = ?auto_740304 ?auto_740305 ) ) ( not ( = ?auto_740304 ?auto_740306 ) ) ( not ( = ?auto_740304 ?auto_740307 ) ) ( not ( = ?auto_740304 ?auto_740308 ) ) ( not ( = ?auto_740304 ?auto_740309 ) ) ( not ( = ?auto_740304 ?auto_740310 ) ) ( not ( = ?auto_740304 ?auto_740311 ) ) ( not ( = ?auto_740304 ?auto_740312 ) ) ( not ( = ?auto_740305 ?auto_740306 ) ) ( not ( = ?auto_740305 ?auto_740307 ) ) ( not ( = ?auto_740305 ?auto_740308 ) ) ( not ( = ?auto_740305 ?auto_740309 ) ) ( not ( = ?auto_740305 ?auto_740310 ) ) ( not ( = ?auto_740305 ?auto_740311 ) ) ( not ( = ?auto_740305 ?auto_740312 ) ) ( not ( = ?auto_740306 ?auto_740307 ) ) ( not ( = ?auto_740306 ?auto_740308 ) ) ( not ( = ?auto_740306 ?auto_740309 ) ) ( not ( = ?auto_740306 ?auto_740310 ) ) ( not ( = ?auto_740306 ?auto_740311 ) ) ( not ( = ?auto_740306 ?auto_740312 ) ) ( not ( = ?auto_740307 ?auto_740308 ) ) ( not ( = ?auto_740307 ?auto_740309 ) ) ( not ( = ?auto_740307 ?auto_740310 ) ) ( not ( = ?auto_740307 ?auto_740311 ) ) ( not ( = ?auto_740307 ?auto_740312 ) ) ( not ( = ?auto_740308 ?auto_740309 ) ) ( not ( = ?auto_740308 ?auto_740310 ) ) ( not ( = ?auto_740308 ?auto_740311 ) ) ( not ( = ?auto_740308 ?auto_740312 ) ) ( not ( = ?auto_740309 ?auto_740310 ) ) ( not ( = ?auto_740309 ?auto_740311 ) ) ( not ( = ?auto_740309 ?auto_740312 ) ) ( not ( = ?auto_740310 ?auto_740311 ) ) ( not ( = ?auto_740310 ?auto_740312 ) ) ( not ( = ?auto_740311 ?auto_740312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_740311 ?auto_740312 )
      ( !STACK ?auto_740311 ?auto_740310 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_740338 - BLOCK
      ?auto_740339 - BLOCK
      ?auto_740340 - BLOCK
      ?auto_740341 - BLOCK
      ?auto_740342 - BLOCK
      ?auto_740343 - BLOCK
      ?auto_740344 - BLOCK
      ?auto_740345 - BLOCK
    )
    :vars
    (
      ?auto_740346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740345 ?auto_740346 ) ( ON-TABLE ?auto_740338 ) ( ON ?auto_740339 ?auto_740338 ) ( ON ?auto_740340 ?auto_740339 ) ( ON ?auto_740341 ?auto_740340 ) ( ON ?auto_740342 ?auto_740341 ) ( ON ?auto_740343 ?auto_740342 ) ( not ( = ?auto_740338 ?auto_740339 ) ) ( not ( = ?auto_740338 ?auto_740340 ) ) ( not ( = ?auto_740338 ?auto_740341 ) ) ( not ( = ?auto_740338 ?auto_740342 ) ) ( not ( = ?auto_740338 ?auto_740343 ) ) ( not ( = ?auto_740338 ?auto_740344 ) ) ( not ( = ?auto_740338 ?auto_740345 ) ) ( not ( = ?auto_740338 ?auto_740346 ) ) ( not ( = ?auto_740339 ?auto_740340 ) ) ( not ( = ?auto_740339 ?auto_740341 ) ) ( not ( = ?auto_740339 ?auto_740342 ) ) ( not ( = ?auto_740339 ?auto_740343 ) ) ( not ( = ?auto_740339 ?auto_740344 ) ) ( not ( = ?auto_740339 ?auto_740345 ) ) ( not ( = ?auto_740339 ?auto_740346 ) ) ( not ( = ?auto_740340 ?auto_740341 ) ) ( not ( = ?auto_740340 ?auto_740342 ) ) ( not ( = ?auto_740340 ?auto_740343 ) ) ( not ( = ?auto_740340 ?auto_740344 ) ) ( not ( = ?auto_740340 ?auto_740345 ) ) ( not ( = ?auto_740340 ?auto_740346 ) ) ( not ( = ?auto_740341 ?auto_740342 ) ) ( not ( = ?auto_740341 ?auto_740343 ) ) ( not ( = ?auto_740341 ?auto_740344 ) ) ( not ( = ?auto_740341 ?auto_740345 ) ) ( not ( = ?auto_740341 ?auto_740346 ) ) ( not ( = ?auto_740342 ?auto_740343 ) ) ( not ( = ?auto_740342 ?auto_740344 ) ) ( not ( = ?auto_740342 ?auto_740345 ) ) ( not ( = ?auto_740342 ?auto_740346 ) ) ( not ( = ?auto_740343 ?auto_740344 ) ) ( not ( = ?auto_740343 ?auto_740345 ) ) ( not ( = ?auto_740343 ?auto_740346 ) ) ( not ( = ?auto_740344 ?auto_740345 ) ) ( not ( = ?auto_740344 ?auto_740346 ) ) ( not ( = ?auto_740345 ?auto_740346 ) ) ( CLEAR ?auto_740343 ) ( ON ?auto_740344 ?auto_740345 ) ( CLEAR ?auto_740344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_740338 ?auto_740339 ?auto_740340 ?auto_740341 ?auto_740342 ?auto_740343 ?auto_740344 )
      ( MAKE-8PILE ?auto_740338 ?auto_740339 ?auto_740340 ?auto_740341 ?auto_740342 ?auto_740343 ?auto_740344 ?auto_740345 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_740372 - BLOCK
      ?auto_740373 - BLOCK
      ?auto_740374 - BLOCK
      ?auto_740375 - BLOCK
      ?auto_740376 - BLOCK
      ?auto_740377 - BLOCK
      ?auto_740378 - BLOCK
      ?auto_740379 - BLOCK
    )
    :vars
    (
      ?auto_740380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740379 ?auto_740380 ) ( ON-TABLE ?auto_740372 ) ( ON ?auto_740373 ?auto_740372 ) ( ON ?auto_740374 ?auto_740373 ) ( ON ?auto_740375 ?auto_740374 ) ( ON ?auto_740376 ?auto_740375 ) ( not ( = ?auto_740372 ?auto_740373 ) ) ( not ( = ?auto_740372 ?auto_740374 ) ) ( not ( = ?auto_740372 ?auto_740375 ) ) ( not ( = ?auto_740372 ?auto_740376 ) ) ( not ( = ?auto_740372 ?auto_740377 ) ) ( not ( = ?auto_740372 ?auto_740378 ) ) ( not ( = ?auto_740372 ?auto_740379 ) ) ( not ( = ?auto_740372 ?auto_740380 ) ) ( not ( = ?auto_740373 ?auto_740374 ) ) ( not ( = ?auto_740373 ?auto_740375 ) ) ( not ( = ?auto_740373 ?auto_740376 ) ) ( not ( = ?auto_740373 ?auto_740377 ) ) ( not ( = ?auto_740373 ?auto_740378 ) ) ( not ( = ?auto_740373 ?auto_740379 ) ) ( not ( = ?auto_740373 ?auto_740380 ) ) ( not ( = ?auto_740374 ?auto_740375 ) ) ( not ( = ?auto_740374 ?auto_740376 ) ) ( not ( = ?auto_740374 ?auto_740377 ) ) ( not ( = ?auto_740374 ?auto_740378 ) ) ( not ( = ?auto_740374 ?auto_740379 ) ) ( not ( = ?auto_740374 ?auto_740380 ) ) ( not ( = ?auto_740375 ?auto_740376 ) ) ( not ( = ?auto_740375 ?auto_740377 ) ) ( not ( = ?auto_740375 ?auto_740378 ) ) ( not ( = ?auto_740375 ?auto_740379 ) ) ( not ( = ?auto_740375 ?auto_740380 ) ) ( not ( = ?auto_740376 ?auto_740377 ) ) ( not ( = ?auto_740376 ?auto_740378 ) ) ( not ( = ?auto_740376 ?auto_740379 ) ) ( not ( = ?auto_740376 ?auto_740380 ) ) ( not ( = ?auto_740377 ?auto_740378 ) ) ( not ( = ?auto_740377 ?auto_740379 ) ) ( not ( = ?auto_740377 ?auto_740380 ) ) ( not ( = ?auto_740378 ?auto_740379 ) ) ( not ( = ?auto_740378 ?auto_740380 ) ) ( not ( = ?auto_740379 ?auto_740380 ) ) ( ON ?auto_740378 ?auto_740379 ) ( CLEAR ?auto_740376 ) ( ON ?auto_740377 ?auto_740378 ) ( CLEAR ?auto_740377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_740372 ?auto_740373 ?auto_740374 ?auto_740375 ?auto_740376 ?auto_740377 )
      ( MAKE-8PILE ?auto_740372 ?auto_740373 ?auto_740374 ?auto_740375 ?auto_740376 ?auto_740377 ?auto_740378 ?auto_740379 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_740406 - BLOCK
      ?auto_740407 - BLOCK
      ?auto_740408 - BLOCK
      ?auto_740409 - BLOCK
      ?auto_740410 - BLOCK
      ?auto_740411 - BLOCK
      ?auto_740412 - BLOCK
      ?auto_740413 - BLOCK
    )
    :vars
    (
      ?auto_740414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740413 ?auto_740414 ) ( ON-TABLE ?auto_740406 ) ( ON ?auto_740407 ?auto_740406 ) ( ON ?auto_740408 ?auto_740407 ) ( ON ?auto_740409 ?auto_740408 ) ( not ( = ?auto_740406 ?auto_740407 ) ) ( not ( = ?auto_740406 ?auto_740408 ) ) ( not ( = ?auto_740406 ?auto_740409 ) ) ( not ( = ?auto_740406 ?auto_740410 ) ) ( not ( = ?auto_740406 ?auto_740411 ) ) ( not ( = ?auto_740406 ?auto_740412 ) ) ( not ( = ?auto_740406 ?auto_740413 ) ) ( not ( = ?auto_740406 ?auto_740414 ) ) ( not ( = ?auto_740407 ?auto_740408 ) ) ( not ( = ?auto_740407 ?auto_740409 ) ) ( not ( = ?auto_740407 ?auto_740410 ) ) ( not ( = ?auto_740407 ?auto_740411 ) ) ( not ( = ?auto_740407 ?auto_740412 ) ) ( not ( = ?auto_740407 ?auto_740413 ) ) ( not ( = ?auto_740407 ?auto_740414 ) ) ( not ( = ?auto_740408 ?auto_740409 ) ) ( not ( = ?auto_740408 ?auto_740410 ) ) ( not ( = ?auto_740408 ?auto_740411 ) ) ( not ( = ?auto_740408 ?auto_740412 ) ) ( not ( = ?auto_740408 ?auto_740413 ) ) ( not ( = ?auto_740408 ?auto_740414 ) ) ( not ( = ?auto_740409 ?auto_740410 ) ) ( not ( = ?auto_740409 ?auto_740411 ) ) ( not ( = ?auto_740409 ?auto_740412 ) ) ( not ( = ?auto_740409 ?auto_740413 ) ) ( not ( = ?auto_740409 ?auto_740414 ) ) ( not ( = ?auto_740410 ?auto_740411 ) ) ( not ( = ?auto_740410 ?auto_740412 ) ) ( not ( = ?auto_740410 ?auto_740413 ) ) ( not ( = ?auto_740410 ?auto_740414 ) ) ( not ( = ?auto_740411 ?auto_740412 ) ) ( not ( = ?auto_740411 ?auto_740413 ) ) ( not ( = ?auto_740411 ?auto_740414 ) ) ( not ( = ?auto_740412 ?auto_740413 ) ) ( not ( = ?auto_740412 ?auto_740414 ) ) ( not ( = ?auto_740413 ?auto_740414 ) ) ( ON ?auto_740412 ?auto_740413 ) ( ON ?auto_740411 ?auto_740412 ) ( CLEAR ?auto_740409 ) ( ON ?auto_740410 ?auto_740411 ) ( CLEAR ?auto_740410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_740406 ?auto_740407 ?auto_740408 ?auto_740409 ?auto_740410 )
      ( MAKE-8PILE ?auto_740406 ?auto_740407 ?auto_740408 ?auto_740409 ?auto_740410 ?auto_740411 ?auto_740412 ?auto_740413 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_740440 - BLOCK
      ?auto_740441 - BLOCK
      ?auto_740442 - BLOCK
      ?auto_740443 - BLOCK
      ?auto_740444 - BLOCK
      ?auto_740445 - BLOCK
      ?auto_740446 - BLOCK
      ?auto_740447 - BLOCK
    )
    :vars
    (
      ?auto_740448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740447 ?auto_740448 ) ( ON-TABLE ?auto_740440 ) ( ON ?auto_740441 ?auto_740440 ) ( ON ?auto_740442 ?auto_740441 ) ( not ( = ?auto_740440 ?auto_740441 ) ) ( not ( = ?auto_740440 ?auto_740442 ) ) ( not ( = ?auto_740440 ?auto_740443 ) ) ( not ( = ?auto_740440 ?auto_740444 ) ) ( not ( = ?auto_740440 ?auto_740445 ) ) ( not ( = ?auto_740440 ?auto_740446 ) ) ( not ( = ?auto_740440 ?auto_740447 ) ) ( not ( = ?auto_740440 ?auto_740448 ) ) ( not ( = ?auto_740441 ?auto_740442 ) ) ( not ( = ?auto_740441 ?auto_740443 ) ) ( not ( = ?auto_740441 ?auto_740444 ) ) ( not ( = ?auto_740441 ?auto_740445 ) ) ( not ( = ?auto_740441 ?auto_740446 ) ) ( not ( = ?auto_740441 ?auto_740447 ) ) ( not ( = ?auto_740441 ?auto_740448 ) ) ( not ( = ?auto_740442 ?auto_740443 ) ) ( not ( = ?auto_740442 ?auto_740444 ) ) ( not ( = ?auto_740442 ?auto_740445 ) ) ( not ( = ?auto_740442 ?auto_740446 ) ) ( not ( = ?auto_740442 ?auto_740447 ) ) ( not ( = ?auto_740442 ?auto_740448 ) ) ( not ( = ?auto_740443 ?auto_740444 ) ) ( not ( = ?auto_740443 ?auto_740445 ) ) ( not ( = ?auto_740443 ?auto_740446 ) ) ( not ( = ?auto_740443 ?auto_740447 ) ) ( not ( = ?auto_740443 ?auto_740448 ) ) ( not ( = ?auto_740444 ?auto_740445 ) ) ( not ( = ?auto_740444 ?auto_740446 ) ) ( not ( = ?auto_740444 ?auto_740447 ) ) ( not ( = ?auto_740444 ?auto_740448 ) ) ( not ( = ?auto_740445 ?auto_740446 ) ) ( not ( = ?auto_740445 ?auto_740447 ) ) ( not ( = ?auto_740445 ?auto_740448 ) ) ( not ( = ?auto_740446 ?auto_740447 ) ) ( not ( = ?auto_740446 ?auto_740448 ) ) ( not ( = ?auto_740447 ?auto_740448 ) ) ( ON ?auto_740446 ?auto_740447 ) ( ON ?auto_740445 ?auto_740446 ) ( ON ?auto_740444 ?auto_740445 ) ( CLEAR ?auto_740442 ) ( ON ?auto_740443 ?auto_740444 ) ( CLEAR ?auto_740443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_740440 ?auto_740441 ?auto_740442 ?auto_740443 )
      ( MAKE-8PILE ?auto_740440 ?auto_740441 ?auto_740442 ?auto_740443 ?auto_740444 ?auto_740445 ?auto_740446 ?auto_740447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_740474 - BLOCK
      ?auto_740475 - BLOCK
      ?auto_740476 - BLOCK
      ?auto_740477 - BLOCK
      ?auto_740478 - BLOCK
      ?auto_740479 - BLOCK
      ?auto_740480 - BLOCK
      ?auto_740481 - BLOCK
    )
    :vars
    (
      ?auto_740482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740481 ?auto_740482 ) ( ON-TABLE ?auto_740474 ) ( ON ?auto_740475 ?auto_740474 ) ( not ( = ?auto_740474 ?auto_740475 ) ) ( not ( = ?auto_740474 ?auto_740476 ) ) ( not ( = ?auto_740474 ?auto_740477 ) ) ( not ( = ?auto_740474 ?auto_740478 ) ) ( not ( = ?auto_740474 ?auto_740479 ) ) ( not ( = ?auto_740474 ?auto_740480 ) ) ( not ( = ?auto_740474 ?auto_740481 ) ) ( not ( = ?auto_740474 ?auto_740482 ) ) ( not ( = ?auto_740475 ?auto_740476 ) ) ( not ( = ?auto_740475 ?auto_740477 ) ) ( not ( = ?auto_740475 ?auto_740478 ) ) ( not ( = ?auto_740475 ?auto_740479 ) ) ( not ( = ?auto_740475 ?auto_740480 ) ) ( not ( = ?auto_740475 ?auto_740481 ) ) ( not ( = ?auto_740475 ?auto_740482 ) ) ( not ( = ?auto_740476 ?auto_740477 ) ) ( not ( = ?auto_740476 ?auto_740478 ) ) ( not ( = ?auto_740476 ?auto_740479 ) ) ( not ( = ?auto_740476 ?auto_740480 ) ) ( not ( = ?auto_740476 ?auto_740481 ) ) ( not ( = ?auto_740476 ?auto_740482 ) ) ( not ( = ?auto_740477 ?auto_740478 ) ) ( not ( = ?auto_740477 ?auto_740479 ) ) ( not ( = ?auto_740477 ?auto_740480 ) ) ( not ( = ?auto_740477 ?auto_740481 ) ) ( not ( = ?auto_740477 ?auto_740482 ) ) ( not ( = ?auto_740478 ?auto_740479 ) ) ( not ( = ?auto_740478 ?auto_740480 ) ) ( not ( = ?auto_740478 ?auto_740481 ) ) ( not ( = ?auto_740478 ?auto_740482 ) ) ( not ( = ?auto_740479 ?auto_740480 ) ) ( not ( = ?auto_740479 ?auto_740481 ) ) ( not ( = ?auto_740479 ?auto_740482 ) ) ( not ( = ?auto_740480 ?auto_740481 ) ) ( not ( = ?auto_740480 ?auto_740482 ) ) ( not ( = ?auto_740481 ?auto_740482 ) ) ( ON ?auto_740480 ?auto_740481 ) ( ON ?auto_740479 ?auto_740480 ) ( ON ?auto_740478 ?auto_740479 ) ( ON ?auto_740477 ?auto_740478 ) ( CLEAR ?auto_740475 ) ( ON ?auto_740476 ?auto_740477 ) ( CLEAR ?auto_740476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_740474 ?auto_740475 ?auto_740476 )
      ( MAKE-8PILE ?auto_740474 ?auto_740475 ?auto_740476 ?auto_740477 ?auto_740478 ?auto_740479 ?auto_740480 ?auto_740481 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_740508 - BLOCK
      ?auto_740509 - BLOCK
      ?auto_740510 - BLOCK
      ?auto_740511 - BLOCK
      ?auto_740512 - BLOCK
      ?auto_740513 - BLOCK
      ?auto_740514 - BLOCK
      ?auto_740515 - BLOCK
    )
    :vars
    (
      ?auto_740516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740515 ?auto_740516 ) ( ON-TABLE ?auto_740508 ) ( not ( = ?auto_740508 ?auto_740509 ) ) ( not ( = ?auto_740508 ?auto_740510 ) ) ( not ( = ?auto_740508 ?auto_740511 ) ) ( not ( = ?auto_740508 ?auto_740512 ) ) ( not ( = ?auto_740508 ?auto_740513 ) ) ( not ( = ?auto_740508 ?auto_740514 ) ) ( not ( = ?auto_740508 ?auto_740515 ) ) ( not ( = ?auto_740508 ?auto_740516 ) ) ( not ( = ?auto_740509 ?auto_740510 ) ) ( not ( = ?auto_740509 ?auto_740511 ) ) ( not ( = ?auto_740509 ?auto_740512 ) ) ( not ( = ?auto_740509 ?auto_740513 ) ) ( not ( = ?auto_740509 ?auto_740514 ) ) ( not ( = ?auto_740509 ?auto_740515 ) ) ( not ( = ?auto_740509 ?auto_740516 ) ) ( not ( = ?auto_740510 ?auto_740511 ) ) ( not ( = ?auto_740510 ?auto_740512 ) ) ( not ( = ?auto_740510 ?auto_740513 ) ) ( not ( = ?auto_740510 ?auto_740514 ) ) ( not ( = ?auto_740510 ?auto_740515 ) ) ( not ( = ?auto_740510 ?auto_740516 ) ) ( not ( = ?auto_740511 ?auto_740512 ) ) ( not ( = ?auto_740511 ?auto_740513 ) ) ( not ( = ?auto_740511 ?auto_740514 ) ) ( not ( = ?auto_740511 ?auto_740515 ) ) ( not ( = ?auto_740511 ?auto_740516 ) ) ( not ( = ?auto_740512 ?auto_740513 ) ) ( not ( = ?auto_740512 ?auto_740514 ) ) ( not ( = ?auto_740512 ?auto_740515 ) ) ( not ( = ?auto_740512 ?auto_740516 ) ) ( not ( = ?auto_740513 ?auto_740514 ) ) ( not ( = ?auto_740513 ?auto_740515 ) ) ( not ( = ?auto_740513 ?auto_740516 ) ) ( not ( = ?auto_740514 ?auto_740515 ) ) ( not ( = ?auto_740514 ?auto_740516 ) ) ( not ( = ?auto_740515 ?auto_740516 ) ) ( ON ?auto_740514 ?auto_740515 ) ( ON ?auto_740513 ?auto_740514 ) ( ON ?auto_740512 ?auto_740513 ) ( ON ?auto_740511 ?auto_740512 ) ( ON ?auto_740510 ?auto_740511 ) ( CLEAR ?auto_740508 ) ( ON ?auto_740509 ?auto_740510 ) ( CLEAR ?auto_740509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_740508 ?auto_740509 )
      ( MAKE-8PILE ?auto_740508 ?auto_740509 ?auto_740510 ?auto_740511 ?auto_740512 ?auto_740513 ?auto_740514 ?auto_740515 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_740542 - BLOCK
      ?auto_740543 - BLOCK
      ?auto_740544 - BLOCK
      ?auto_740545 - BLOCK
      ?auto_740546 - BLOCK
      ?auto_740547 - BLOCK
      ?auto_740548 - BLOCK
      ?auto_740549 - BLOCK
    )
    :vars
    (
      ?auto_740550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740549 ?auto_740550 ) ( not ( = ?auto_740542 ?auto_740543 ) ) ( not ( = ?auto_740542 ?auto_740544 ) ) ( not ( = ?auto_740542 ?auto_740545 ) ) ( not ( = ?auto_740542 ?auto_740546 ) ) ( not ( = ?auto_740542 ?auto_740547 ) ) ( not ( = ?auto_740542 ?auto_740548 ) ) ( not ( = ?auto_740542 ?auto_740549 ) ) ( not ( = ?auto_740542 ?auto_740550 ) ) ( not ( = ?auto_740543 ?auto_740544 ) ) ( not ( = ?auto_740543 ?auto_740545 ) ) ( not ( = ?auto_740543 ?auto_740546 ) ) ( not ( = ?auto_740543 ?auto_740547 ) ) ( not ( = ?auto_740543 ?auto_740548 ) ) ( not ( = ?auto_740543 ?auto_740549 ) ) ( not ( = ?auto_740543 ?auto_740550 ) ) ( not ( = ?auto_740544 ?auto_740545 ) ) ( not ( = ?auto_740544 ?auto_740546 ) ) ( not ( = ?auto_740544 ?auto_740547 ) ) ( not ( = ?auto_740544 ?auto_740548 ) ) ( not ( = ?auto_740544 ?auto_740549 ) ) ( not ( = ?auto_740544 ?auto_740550 ) ) ( not ( = ?auto_740545 ?auto_740546 ) ) ( not ( = ?auto_740545 ?auto_740547 ) ) ( not ( = ?auto_740545 ?auto_740548 ) ) ( not ( = ?auto_740545 ?auto_740549 ) ) ( not ( = ?auto_740545 ?auto_740550 ) ) ( not ( = ?auto_740546 ?auto_740547 ) ) ( not ( = ?auto_740546 ?auto_740548 ) ) ( not ( = ?auto_740546 ?auto_740549 ) ) ( not ( = ?auto_740546 ?auto_740550 ) ) ( not ( = ?auto_740547 ?auto_740548 ) ) ( not ( = ?auto_740547 ?auto_740549 ) ) ( not ( = ?auto_740547 ?auto_740550 ) ) ( not ( = ?auto_740548 ?auto_740549 ) ) ( not ( = ?auto_740548 ?auto_740550 ) ) ( not ( = ?auto_740549 ?auto_740550 ) ) ( ON ?auto_740548 ?auto_740549 ) ( ON ?auto_740547 ?auto_740548 ) ( ON ?auto_740546 ?auto_740547 ) ( ON ?auto_740545 ?auto_740546 ) ( ON ?auto_740544 ?auto_740545 ) ( ON ?auto_740543 ?auto_740544 ) ( ON ?auto_740542 ?auto_740543 ) ( CLEAR ?auto_740542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_740542 )
      ( MAKE-8PILE ?auto_740542 ?auto_740543 ?auto_740544 ?auto_740545 ?auto_740546 ?auto_740547 ?auto_740548 ?auto_740549 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_740577 - BLOCK
      ?auto_740578 - BLOCK
      ?auto_740579 - BLOCK
      ?auto_740580 - BLOCK
      ?auto_740581 - BLOCK
      ?auto_740582 - BLOCK
      ?auto_740583 - BLOCK
      ?auto_740584 - BLOCK
      ?auto_740585 - BLOCK
    )
    :vars
    (
      ?auto_740586 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_740584 ) ( ON ?auto_740585 ?auto_740586 ) ( CLEAR ?auto_740585 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_740577 ) ( ON ?auto_740578 ?auto_740577 ) ( ON ?auto_740579 ?auto_740578 ) ( ON ?auto_740580 ?auto_740579 ) ( ON ?auto_740581 ?auto_740580 ) ( ON ?auto_740582 ?auto_740581 ) ( ON ?auto_740583 ?auto_740582 ) ( ON ?auto_740584 ?auto_740583 ) ( not ( = ?auto_740577 ?auto_740578 ) ) ( not ( = ?auto_740577 ?auto_740579 ) ) ( not ( = ?auto_740577 ?auto_740580 ) ) ( not ( = ?auto_740577 ?auto_740581 ) ) ( not ( = ?auto_740577 ?auto_740582 ) ) ( not ( = ?auto_740577 ?auto_740583 ) ) ( not ( = ?auto_740577 ?auto_740584 ) ) ( not ( = ?auto_740577 ?auto_740585 ) ) ( not ( = ?auto_740577 ?auto_740586 ) ) ( not ( = ?auto_740578 ?auto_740579 ) ) ( not ( = ?auto_740578 ?auto_740580 ) ) ( not ( = ?auto_740578 ?auto_740581 ) ) ( not ( = ?auto_740578 ?auto_740582 ) ) ( not ( = ?auto_740578 ?auto_740583 ) ) ( not ( = ?auto_740578 ?auto_740584 ) ) ( not ( = ?auto_740578 ?auto_740585 ) ) ( not ( = ?auto_740578 ?auto_740586 ) ) ( not ( = ?auto_740579 ?auto_740580 ) ) ( not ( = ?auto_740579 ?auto_740581 ) ) ( not ( = ?auto_740579 ?auto_740582 ) ) ( not ( = ?auto_740579 ?auto_740583 ) ) ( not ( = ?auto_740579 ?auto_740584 ) ) ( not ( = ?auto_740579 ?auto_740585 ) ) ( not ( = ?auto_740579 ?auto_740586 ) ) ( not ( = ?auto_740580 ?auto_740581 ) ) ( not ( = ?auto_740580 ?auto_740582 ) ) ( not ( = ?auto_740580 ?auto_740583 ) ) ( not ( = ?auto_740580 ?auto_740584 ) ) ( not ( = ?auto_740580 ?auto_740585 ) ) ( not ( = ?auto_740580 ?auto_740586 ) ) ( not ( = ?auto_740581 ?auto_740582 ) ) ( not ( = ?auto_740581 ?auto_740583 ) ) ( not ( = ?auto_740581 ?auto_740584 ) ) ( not ( = ?auto_740581 ?auto_740585 ) ) ( not ( = ?auto_740581 ?auto_740586 ) ) ( not ( = ?auto_740582 ?auto_740583 ) ) ( not ( = ?auto_740582 ?auto_740584 ) ) ( not ( = ?auto_740582 ?auto_740585 ) ) ( not ( = ?auto_740582 ?auto_740586 ) ) ( not ( = ?auto_740583 ?auto_740584 ) ) ( not ( = ?auto_740583 ?auto_740585 ) ) ( not ( = ?auto_740583 ?auto_740586 ) ) ( not ( = ?auto_740584 ?auto_740585 ) ) ( not ( = ?auto_740584 ?auto_740586 ) ) ( not ( = ?auto_740585 ?auto_740586 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_740585 ?auto_740586 )
      ( !STACK ?auto_740585 ?auto_740584 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_740615 - BLOCK
      ?auto_740616 - BLOCK
      ?auto_740617 - BLOCK
      ?auto_740618 - BLOCK
      ?auto_740619 - BLOCK
      ?auto_740620 - BLOCK
      ?auto_740621 - BLOCK
      ?auto_740622 - BLOCK
      ?auto_740623 - BLOCK
    )
    :vars
    (
      ?auto_740624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740623 ?auto_740624 ) ( ON-TABLE ?auto_740615 ) ( ON ?auto_740616 ?auto_740615 ) ( ON ?auto_740617 ?auto_740616 ) ( ON ?auto_740618 ?auto_740617 ) ( ON ?auto_740619 ?auto_740618 ) ( ON ?auto_740620 ?auto_740619 ) ( ON ?auto_740621 ?auto_740620 ) ( not ( = ?auto_740615 ?auto_740616 ) ) ( not ( = ?auto_740615 ?auto_740617 ) ) ( not ( = ?auto_740615 ?auto_740618 ) ) ( not ( = ?auto_740615 ?auto_740619 ) ) ( not ( = ?auto_740615 ?auto_740620 ) ) ( not ( = ?auto_740615 ?auto_740621 ) ) ( not ( = ?auto_740615 ?auto_740622 ) ) ( not ( = ?auto_740615 ?auto_740623 ) ) ( not ( = ?auto_740615 ?auto_740624 ) ) ( not ( = ?auto_740616 ?auto_740617 ) ) ( not ( = ?auto_740616 ?auto_740618 ) ) ( not ( = ?auto_740616 ?auto_740619 ) ) ( not ( = ?auto_740616 ?auto_740620 ) ) ( not ( = ?auto_740616 ?auto_740621 ) ) ( not ( = ?auto_740616 ?auto_740622 ) ) ( not ( = ?auto_740616 ?auto_740623 ) ) ( not ( = ?auto_740616 ?auto_740624 ) ) ( not ( = ?auto_740617 ?auto_740618 ) ) ( not ( = ?auto_740617 ?auto_740619 ) ) ( not ( = ?auto_740617 ?auto_740620 ) ) ( not ( = ?auto_740617 ?auto_740621 ) ) ( not ( = ?auto_740617 ?auto_740622 ) ) ( not ( = ?auto_740617 ?auto_740623 ) ) ( not ( = ?auto_740617 ?auto_740624 ) ) ( not ( = ?auto_740618 ?auto_740619 ) ) ( not ( = ?auto_740618 ?auto_740620 ) ) ( not ( = ?auto_740618 ?auto_740621 ) ) ( not ( = ?auto_740618 ?auto_740622 ) ) ( not ( = ?auto_740618 ?auto_740623 ) ) ( not ( = ?auto_740618 ?auto_740624 ) ) ( not ( = ?auto_740619 ?auto_740620 ) ) ( not ( = ?auto_740619 ?auto_740621 ) ) ( not ( = ?auto_740619 ?auto_740622 ) ) ( not ( = ?auto_740619 ?auto_740623 ) ) ( not ( = ?auto_740619 ?auto_740624 ) ) ( not ( = ?auto_740620 ?auto_740621 ) ) ( not ( = ?auto_740620 ?auto_740622 ) ) ( not ( = ?auto_740620 ?auto_740623 ) ) ( not ( = ?auto_740620 ?auto_740624 ) ) ( not ( = ?auto_740621 ?auto_740622 ) ) ( not ( = ?auto_740621 ?auto_740623 ) ) ( not ( = ?auto_740621 ?auto_740624 ) ) ( not ( = ?auto_740622 ?auto_740623 ) ) ( not ( = ?auto_740622 ?auto_740624 ) ) ( not ( = ?auto_740623 ?auto_740624 ) ) ( CLEAR ?auto_740621 ) ( ON ?auto_740622 ?auto_740623 ) ( CLEAR ?auto_740622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_740615 ?auto_740616 ?auto_740617 ?auto_740618 ?auto_740619 ?auto_740620 ?auto_740621 ?auto_740622 )
      ( MAKE-9PILE ?auto_740615 ?auto_740616 ?auto_740617 ?auto_740618 ?auto_740619 ?auto_740620 ?auto_740621 ?auto_740622 ?auto_740623 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_740653 - BLOCK
      ?auto_740654 - BLOCK
      ?auto_740655 - BLOCK
      ?auto_740656 - BLOCK
      ?auto_740657 - BLOCK
      ?auto_740658 - BLOCK
      ?auto_740659 - BLOCK
      ?auto_740660 - BLOCK
      ?auto_740661 - BLOCK
    )
    :vars
    (
      ?auto_740662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740661 ?auto_740662 ) ( ON-TABLE ?auto_740653 ) ( ON ?auto_740654 ?auto_740653 ) ( ON ?auto_740655 ?auto_740654 ) ( ON ?auto_740656 ?auto_740655 ) ( ON ?auto_740657 ?auto_740656 ) ( ON ?auto_740658 ?auto_740657 ) ( not ( = ?auto_740653 ?auto_740654 ) ) ( not ( = ?auto_740653 ?auto_740655 ) ) ( not ( = ?auto_740653 ?auto_740656 ) ) ( not ( = ?auto_740653 ?auto_740657 ) ) ( not ( = ?auto_740653 ?auto_740658 ) ) ( not ( = ?auto_740653 ?auto_740659 ) ) ( not ( = ?auto_740653 ?auto_740660 ) ) ( not ( = ?auto_740653 ?auto_740661 ) ) ( not ( = ?auto_740653 ?auto_740662 ) ) ( not ( = ?auto_740654 ?auto_740655 ) ) ( not ( = ?auto_740654 ?auto_740656 ) ) ( not ( = ?auto_740654 ?auto_740657 ) ) ( not ( = ?auto_740654 ?auto_740658 ) ) ( not ( = ?auto_740654 ?auto_740659 ) ) ( not ( = ?auto_740654 ?auto_740660 ) ) ( not ( = ?auto_740654 ?auto_740661 ) ) ( not ( = ?auto_740654 ?auto_740662 ) ) ( not ( = ?auto_740655 ?auto_740656 ) ) ( not ( = ?auto_740655 ?auto_740657 ) ) ( not ( = ?auto_740655 ?auto_740658 ) ) ( not ( = ?auto_740655 ?auto_740659 ) ) ( not ( = ?auto_740655 ?auto_740660 ) ) ( not ( = ?auto_740655 ?auto_740661 ) ) ( not ( = ?auto_740655 ?auto_740662 ) ) ( not ( = ?auto_740656 ?auto_740657 ) ) ( not ( = ?auto_740656 ?auto_740658 ) ) ( not ( = ?auto_740656 ?auto_740659 ) ) ( not ( = ?auto_740656 ?auto_740660 ) ) ( not ( = ?auto_740656 ?auto_740661 ) ) ( not ( = ?auto_740656 ?auto_740662 ) ) ( not ( = ?auto_740657 ?auto_740658 ) ) ( not ( = ?auto_740657 ?auto_740659 ) ) ( not ( = ?auto_740657 ?auto_740660 ) ) ( not ( = ?auto_740657 ?auto_740661 ) ) ( not ( = ?auto_740657 ?auto_740662 ) ) ( not ( = ?auto_740658 ?auto_740659 ) ) ( not ( = ?auto_740658 ?auto_740660 ) ) ( not ( = ?auto_740658 ?auto_740661 ) ) ( not ( = ?auto_740658 ?auto_740662 ) ) ( not ( = ?auto_740659 ?auto_740660 ) ) ( not ( = ?auto_740659 ?auto_740661 ) ) ( not ( = ?auto_740659 ?auto_740662 ) ) ( not ( = ?auto_740660 ?auto_740661 ) ) ( not ( = ?auto_740660 ?auto_740662 ) ) ( not ( = ?auto_740661 ?auto_740662 ) ) ( ON ?auto_740660 ?auto_740661 ) ( CLEAR ?auto_740658 ) ( ON ?auto_740659 ?auto_740660 ) ( CLEAR ?auto_740659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_740653 ?auto_740654 ?auto_740655 ?auto_740656 ?auto_740657 ?auto_740658 ?auto_740659 )
      ( MAKE-9PILE ?auto_740653 ?auto_740654 ?auto_740655 ?auto_740656 ?auto_740657 ?auto_740658 ?auto_740659 ?auto_740660 ?auto_740661 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_740691 - BLOCK
      ?auto_740692 - BLOCK
      ?auto_740693 - BLOCK
      ?auto_740694 - BLOCK
      ?auto_740695 - BLOCK
      ?auto_740696 - BLOCK
      ?auto_740697 - BLOCK
      ?auto_740698 - BLOCK
      ?auto_740699 - BLOCK
    )
    :vars
    (
      ?auto_740700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740699 ?auto_740700 ) ( ON-TABLE ?auto_740691 ) ( ON ?auto_740692 ?auto_740691 ) ( ON ?auto_740693 ?auto_740692 ) ( ON ?auto_740694 ?auto_740693 ) ( ON ?auto_740695 ?auto_740694 ) ( not ( = ?auto_740691 ?auto_740692 ) ) ( not ( = ?auto_740691 ?auto_740693 ) ) ( not ( = ?auto_740691 ?auto_740694 ) ) ( not ( = ?auto_740691 ?auto_740695 ) ) ( not ( = ?auto_740691 ?auto_740696 ) ) ( not ( = ?auto_740691 ?auto_740697 ) ) ( not ( = ?auto_740691 ?auto_740698 ) ) ( not ( = ?auto_740691 ?auto_740699 ) ) ( not ( = ?auto_740691 ?auto_740700 ) ) ( not ( = ?auto_740692 ?auto_740693 ) ) ( not ( = ?auto_740692 ?auto_740694 ) ) ( not ( = ?auto_740692 ?auto_740695 ) ) ( not ( = ?auto_740692 ?auto_740696 ) ) ( not ( = ?auto_740692 ?auto_740697 ) ) ( not ( = ?auto_740692 ?auto_740698 ) ) ( not ( = ?auto_740692 ?auto_740699 ) ) ( not ( = ?auto_740692 ?auto_740700 ) ) ( not ( = ?auto_740693 ?auto_740694 ) ) ( not ( = ?auto_740693 ?auto_740695 ) ) ( not ( = ?auto_740693 ?auto_740696 ) ) ( not ( = ?auto_740693 ?auto_740697 ) ) ( not ( = ?auto_740693 ?auto_740698 ) ) ( not ( = ?auto_740693 ?auto_740699 ) ) ( not ( = ?auto_740693 ?auto_740700 ) ) ( not ( = ?auto_740694 ?auto_740695 ) ) ( not ( = ?auto_740694 ?auto_740696 ) ) ( not ( = ?auto_740694 ?auto_740697 ) ) ( not ( = ?auto_740694 ?auto_740698 ) ) ( not ( = ?auto_740694 ?auto_740699 ) ) ( not ( = ?auto_740694 ?auto_740700 ) ) ( not ( = ?auto_740695 ?auto_740696 ) ) ( not ( = ?auto_740695 ?auto_740697 ) ) ( not ( = ?auto_740695 ?auto_740698 ) ) ( not ( = ?auto_740695 ?auto_740699 ) ) ( not ( = ?auto_740695 ?auto_740700 ) ) ( not ( = ?auto_740696 ?auto_740697 ) ) ( not ( = ?auto_740696 ?auto_740698 ) ) ( not ( = ?auto_740696 ?auto_740699 ) ) ( not ( = ?auto_740696 ?auto_740700 ) ) ( not ( = ?auto_740697 ?auto_740698 ) ) ( not ( = ?auto_740697 ?auto_740699 ) ) ( not ( = ?auto_740697 ?auto_740700 ) ) ( not ( = ?auto_740698 ?auto_740699 ) ) ( not ( = ?auto_740698 ?auto_740700 ) ) ( not ( = ?auto_740699 ?auto_740700 ) ) ( ON ?auto_740698 ?auto_740699 ) ( ON ?auto_740697 ?auto_740698 ) ( CLEAR ?auto_740695 ) ( ON ?auto_740696 ?auto_740697 ) ( CLEAR ?auto_740696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_740691 ?auto_740692 ?auto_740693 ?auto_740694 ?auto_740695 ?auto_740696 )
      ( MAKE-9PILE ?auto_740691 ?auto_740692 ?auto_740693 ?auto_740694 ?auto_740695 ?auto_740696 ?auto_740697 ?auto_740698 ?auto_740699 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_740729 - BLOCK
      ?auto_740730 - BLOCK
      ?auto_740731 - BLOCK
      ?auto_740732 - BLOCK
      ?auto_740733 - BLOCK
      ?auto_740734 - BLOCK
      ?auto_740735 - BLOCK
      ?auto_740736 - BLOCK
      ?auto_740737 - BLOCK
    )
    :vars
    (
      ?auto_740738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740737 ?auto_740738 ) ( ON-TABLE ?auto_740729 ) ( ON ?auto_740730 ?auto_740729 ) ( ON ?auto_740731 ?auto_740730 ) ( ON ?auto_740732 ?auto_740731 ) ( not ( = ?auto_740729 ?auto_740730 ) ) ( not ( = ?auto_740729 ?auto_740731 ) ) ( not ( = ?auto_740729 ?auto_740732 ) ) ( not ( = ?auto_740729 ?auto_740733 ) ) ( not ( = ?auto_740729 ?auto_740734 ) ) ( not ( = ?auto_740729 ?auto_740735 ) ) ( not ( = ?auto_740729 ?auto_740736 ) ) ( not ( = ?auto_740729 ?auto_740737 ) ) ( not ( = ?auto_740729 ?auto_740738 ) ) ( not ( = ?auto_740730 ?auto_740731 ) ) ( not ( = ?auto_740730 ?auto_740732 ) ) ( not ( = ?auto_740730 ?auto_740733 ) ) ( not ( = ?auto_740730 ?auto_740734 ) ) ( not ( = ?auto_740730 ?auto_740735 ) ) ( not ( = ?auto_740730 ?auto_740736 ) ) ( not ( = ?auto_740730 ?auto_740737 ) ) ( not ( = ?auto_740730 ?auto_740738 ) ) ( not ( = ?auto_740731 ?auto_740732 ) ) ( not ( = ?auto_740731 ?auto_740733 ) ) ( not ( = ?auto_740731 ?auto_740734 ) ) ( not ( = ?auto_740731 ?auto_740735 ) ) ( not ( = ?auto_740731 ?auto_740736 ) ) ( not ( = ?auto_740731 ?auto_740737 ) ) ( not ( = ?auto_740731 ?auto_740738 ) ) ( not ( = ?auto_740732 ?auto_740733 ) ) ( not ( = ?auto_740732 ?auto_740734 ) ) ( not ( = ?auto_740732 ?auto_740735 ) ) ( not ( = ?auto_740732 ?auto_740736 ) ) ( not ( = ?auto_740732 ?auto_740737 ) ) ( not ( = ?auto_740732 ?auto_740738 ) ) ( not ( = ?auto_740733 ?auto_740734 ) ) ( not ( = ?auto_740733 ?auto_740735 ) ) ( not ( = ?auto_740733 ?auto_740736 ) ) ( not ( = ?auto_740733 ?auto_740737 ) ) ( not ( = ?auto_740733 ?auto_740738 ) ) ( not ( = ?auto_740734 ?auto_740735 ) ) ( not ( = ?auto_740734 ?auto_740736 ) ) ( not ( = ?auto_740734 ?auto_740737 ) ) ( not ( = ?auto_740734 ?auto_740738 ) ) ( not ( = ?auto_740735 ?auto_740736 ) ) ( not ( = ?auto_740735 ?auto_740737 ) ) ( not ( = ?auto_740735 ?auto_740738 ) ) ( not ( = ?auto_740736 ?auto_740737 ) ) ( not ( = ?auto_740736 ?auto_740738 ) ) ( not ( = ?auto_740737 ?auto_740738 ) ) ( ON ?auto_740736 ?auto_740737 ) ( ON ?auto_740735 ?auto_740736 ) ( ON ?auto_740734 ?auto_740735 ) ( CLEAR ?auto_740732 ) ( ON ?auto_740733 ?auto_740734 ) ( CLEAR ?auto_740733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_740729 ?auto_740730 ?auto_740731 ?auto_740732 ?auto_740733 )
      ( MAKE-9PILE ?auto_740729 ?auto_740730 ?auto_740731 ?auto_740732 ?auto_740733 ?auto_740734 ?auto_740735 ?auto_740736 ?auto_740737 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_740767 - BLOCK
      ?auto_740768 - BLOCK
      ?auto_740769 - BLOCK
      ?auto_740770 - BLOCK
      ?auto_740771 - BLOCK
      ?auto_740772 - BLOCK
      ?auto_740773 - BLOCK
      ?auto_740774 - BLOCK
      ?auto_740775 - BLOCK
    )
    :vars
    (
      ?auto_740776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740775 ?auto_740776 ) ( ON-TABLE ?auto_740767 ) ( ON ?auto_740768 ?auto_740767 ) ( ON ?auto_740769 ?auto_740768 ) ( not ( = ?auto_740767 ?auto_740768 ) ) ( not ( = ?auto_740767 ?auto_740769 ) ) ( not ( = ?auto_740767 ?auto_740770 ) ) ( not ( = ?auto_740767 ?auto_740771 ) ) ( not ( = ?auto_740767 ?auto_740772 ) ) ( not ( = ?auto_740767 ?auto_740773 ) ) ( not ( = ?auto_740767 ?auto_740774 ) ) ( not ( = ?auto_740767 ?auto_740775 ) ) ( not ( = ?auto_740767 ?auto_740776 ) ) ( not ( = ?auto_740768 ?auto_740769 ) ) ( not ( = ?auto_740768 ?auto_740770 ) ) ( not ( = ?auto_740768 ?auto_740771 ) ) ( not ( = ?auto_740768 ?auto_740772 ) ) ( not ( = ?auto_740768 ?auto_740773 ) ) ( not ( = ?auto_740768 ?auto_740774 ) ) ( not ( = ?auto_740768 ?auto_740775 ) ) ( not ( = ?auto_740768 ?auto_740776 ) ) ( not ( = ?auto_740769 ?auto_740770 ) ) ( not ( = ?auto_740769 ?auto_740771 ) ) ( not ( = ?auto_740769 ?auto_740772 ) ) ( not ( = ?auto_740769 ?auto_740773 ) ) ( not ( = ?auto_740769 ?auto_740774 ) ) ( not ( = ?auto_740769 ?auto_740775 ) ) ( not ( = ?auto_740769 ?auto_740776 ) ) ( not ( = ?auto_740770 ?auto_740771 ) ) ( not ( = ?auto_740770 ?auto_740772 ) ) ( not ( = ?auto_740770 ?auto_740773 ) ) ( not ( = ?auto_740770 ?auto_740774 ) ) ( not ( = ?auto_740770 ?auto_740775 ) ) ( not ( = ?auto_740770 ?auto_740776 ) ) ( not ( = ?auto_740771 ?auto_740772 ) ) ( not ( = ?auto_740771 ?auto_740773 ) ) ( not ( = ?auto_740771 ?auto_740774 ) ) ( not ( = ?auto_740771 ?auto_740775 ) ) ( not ( = ?auto_740771 ?auto_740776 ) ) ( not ( = ?auto_740772 ?auto_740773 ) ) ( not ( = ?auto_740772 ?auto_740774 ) ) ( not ( = ?auto_740772 ?auto_740775 ) ) ( not ( = ?auto_740772 ?auto_740776 ) ) ( not ( = ?auto_740773 ?auto_740774 ) ) ( not ( = ?auto_740773 ?auto_740775 ) ) ( not ( = ?auto_740773 ?auto_740776 ) ) ( not ( = ?auto_740774 ?auto_740775 ) ) ( not ( = ?auto_740774 ?auto_740776 ) ) ( not ( = ?auto_740775 ?auto_740776 ) ) ( ON ?auto_740774 ?auto_740775 ) ( ON ?auto_740773 ?auto_740774 ) ( ON ?auto_740772 ?auto_740773 ) ( ON ?auto_740771 ?auto_740772 ) ( CLEAR ?auto_740769 ) ( ON ?auto_740770 ?auto_740771 ) ( CLEAR ?auto_740770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_740767 ?auto_740768 ?auto_740769 ?auto_740770 )
      ( MAKE-9PILE ?auto_740767 ?auto_740768 ?auto_740769 ?auto_740770 ?auto_740771 ?auto_740772 ?auto_740773 ?auto_740774 ?auto_740775 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_740805 - BLOCK
      ?auto_740806 - BLOCK
      ?auto_740807 - BLOCK
      ?auto_740808 - BLOCK
      ?auto_740809 - BLOCK
      ?auto_740810 - BLOCK
      ?auto_740811 - BLOCK
      ?auto_740812 - BLOCK
      ?auto_740813 - BLOCK
    )
    :vars
    (
      ?auto_740814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740813 ?auto_740814 ) ( ON-TABLE ?auto_740805 ) ( ON ?auto_740806 ?auto_740805 ) ( not ( = ?auto_740805 ?auto_740806 ) ) ( not ( = ?auto_740805 ?auto_740807 ) ) ( not ( = ?auto_740805 ?auto_740808 ) ) ( not ( = ?auto_740805 ?auto_740809 ) ) ( not ( = ?auto_740805 ?auto_740810 ) ) ( not ( = ?auto_740805 ?auto_740811 ) ) ( not ( = ?auto_740805 ?auto_740812 ) ) ( not ( = ?auto_740805 ?auto_740813 ) ) ( not ( = ?auto_740805 ?auto_740814 ) ) ( not ( = ?auto_740806 ?auto_740807 ) ) ( not ( = ?auto_740806 ?auto_740808 ) ) ( not ( = ?auto_740806 ?auto_740809 ) ) ( not ( = ?auto_740806 ?auto_740810 ) ) ( not ( = ?auto_740806 ?auto_740811 ) ) ( not ( = ?auto_740806 ?auto_740812 ) ) ( not ( = ?auto_740806 ?auto_740813 ) ) ( not ( = ?auto_740806 ?auto_740814 ) ) ( not ( = ?auto_740807 ?auto_740808 ) ) ( not ( = ?auto_740807 ?auto_740809 ) ) ( not ( = ?auto_740807 ?auto_740810 ) ) ( not ( = ?auto_740807 ?auto_740811 ) ) ( not ( = ?auto_740807 ?auto_740812 ) ) ( not ( = ?auto_740807 ?auto_740813 ) ) ( not ( = ?auto_740807 ?auto_740814 ) ) ( not ( = ?auto_740808 ?auto_740809 ) ) ( not ( = ?auto_740808 ?auto_740810 ) ) ( not ( = ?auto_740808 ?auto_740811 ) ) ( not ( = ?auto_740808 ?auto_740812 ) ) ( not ( = ?auto_740808 ?auto_740813 ) ) ( not ( = ?auto_740808 ?auto_740814 ) ) ( not ( = ?auto_740809 ?auto_740810 ) ) ( not ( = ?auto_740809 ?auto_740811 ) ) ( not ( = ?auto_740809 ?auto_740812 ) ) ( not ( = ?auto_740809 ?auto_740813 ) ) ( not ( = ?auto_740809 ?auto_740814 ) ) ( not ( = ?auto_740810 ?auto_740811 ) ) ( not ( = ?auto_740810 ?auto_740812 ) ) ( not ( = ?auto_740810 ?auto_740813 ) ) ( not ( = ?auto_740810 ?auto_740814 ) ) ( not ( = ?auto_740811 ?auto_740812 ) ) ( not ( = ?auto_740811 ?auto_740813 ) ) ( not ( = ?auto_740811 ?auto_740814 ) ) ( not ( = ?auto_740812 ?auto_740813 ) ) ( not ( = ?auto_740812 ?auto_740814 ) ) ( not ( = ?auto_740813 ?auto_740814 ) ) ( ON ?auto_740812 ?auto_740813 ) ( ON ?auto_740811 ?auto_740812 ) ( ON ?auto_740810 ?auto_740811 ) ( ON ?auto_740809 ?auto_740810 ) ( ON ?auto_740808 ?auto_740809 ) ( CLEAR ?auto_740806 ) ( ON ?auto_740807 ?auto_740808 ) ( CLEAR ?auto_740807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_740805 ?auto_740806 ?auto_740807 )
      ( MAKE-9PILE ?auto_740805 ?auto_740806 ?auto_740807 ?auto_740808 ?auto_740809 ?auto_740810 ?auto_740811 ?auto_740812 ?auto_740813 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_740843 - BLOCK
      ?auto_740844 - BLOCK
      ?auto_740845 - BLOCK
      ?auto_740846 - BLOCK
      ?auto_740847 - BLOCK
      ?auto_740848 - BLOCK
      ?auto_740849 - BLOCK
      ?auto_740850 - BLOCK
      ?auto_740851 - BLOCK
    )
    :vars
    (
      ?auto_740852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740851 ?auto_740852 ) ( ON-TABLE ?auto_740843 ) ( not ( = ?auto_740843 ?auto_740844 ) ) ( not ( = ?auto_740843 ?auto_740845 ) ) ( not ( = ?auto_740843 ?auto_740846 ) ) ( not ( = ?auto_740843 ?auto_740847 ) ) ( not ( = ?auto_740843 ?auto_740848 ) ) ( not ( = ?auto_740843 ?auto_740849 ) ) ( not ( = ?auto_740843 ?auto_740850 ) ) ( not ( = ?auto_740843 ?auto_740851 ) ) ( not ( = ?auto_740843 ?auto_740852 ) ) ( not ( = ?auto_740844 ?auto_740845 ) ) ( not ( = ?auto_740844 ?auto_740846 ) ) ( not ( = ?auto_740844 ?auto_740847 ) ) ( not ( = ?auto_740844 ?auto_740848 ) ) ( not ( = ?auto_740844 ?auto_740849 ) ) ( not ( = ?auto_740844 ?auto_740850 ) ) ( not ( = ?auto_740844 ?auto_740851 ) ) ( not ( = ?auto_740844 ?auto_740852 ) ) ( not ( = ?auto_740845 ?auto_740846 ) ) ( not ( = ?auto_740845 ?auto_740847 ) ) ( not ( = ?auto_740845 ?auto_740848 ) ) ( not ( = ?auto_740845 ?auto_740849 ) ) ( not ( = ?auto_740845 ?auto_740850 ) ) ( not ( = ?auto_740845 ?auto_740851 ) ) ( not ( = ?auto_740845 ?auto_740852 ) ) ( not ( = ?auto_740846 ?auto_740847 ) ) ( not ( = ?auto_740846 ?auto_740848 ) ) ( not ( = ?auto_740846 ?auto_740849 ) ) ( not ( = ?auto_740846 ?auto_740850 ) ) ( not ( = ?auto_740846 ?auto_740851 ) ) ( not ( = ?auto_740846 ?auto_740852 ) ) ( not ( = ?auto_740847 ?auto_740848 ) ) ( not ( = ?auto_740847 ?auto_740849 ) ) ( not ( = ?auto_740847 ?auto_740850 ) ) ( not ( = ?auto_740847 ?auto_740851 ) ) ( not ( = ?auto_740847 ?auto_740852 ) ) ( not ( = ?auto_740848 ?auto_740849 ) ) ( not ( = ?auto_740848 ?auto_740850 ) ) ( not ( = ?auto_740848 ?auto_740851 ) ) ( not ( = ?auto_740848 ?auto_740852 ) ) ( not ( = ?auto_740849 ?auto_740850 ) ) ( not ( = ?auto_740849 ?auto_740851 ) ) ( not ( = ?auto_740849 ?auto_740852 ) ) ( not ( = ?auto_740850 ?auto_740851 ) ) ( not ( = ?auto_740850 ?auto_740852 ) ) ( not ( = ?auto_740851 ?auto_740852 ) ) ( ON ?auto_740850 ?auto_740851 ) ( ON ?auto_740849 ?auto_740850 ) ( ON ?auto_740848 ?auto_740849 ) ( ON ?auto_740847 ?auto_740848 ) ( ON ?auto_740846 ?auto_740847 ) ( ON ?auto_740845 ?auto_740846 ) ( CLEAR ?auto_740843 ) ( ON ?auto_740844 ?auto_740845 ) ( CLEAR ?auto_740844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_740843 ?auto_740844 )
      ( MAKE-9PILE ?auto_740843 ?auto_740844 ?auto_740845 ?auto_740846 ?auto_740847 ?auto_740848 ?auto_740849 ?auto_740850 ?auto_740851 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_740881 - BLOCK
      ?auto_740882 - BLOCK
      ?auto_740883 - BLOCK
      ?auto_740884 - BLOCK
      ?auto_740885 - BLOCK
      ?auto_740886 - BLOCK
      ?auto_740887 - BLOCK
      ?auto_740888 - BLOCK
      ?auto_740889 - BLOCK
    )
    :vars
    (
      ?auto_740890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740889 ?auto_740890 ) ( not ( = ?auto_740881 ?auto_740882 ) ) ( not ( = ?auto_740881 ?auto_740883 ) ) ( not ( = ?auto_740881 ?auto_740884 ) ) ( not ( = ?auto_740881 ?auto_740885 ) ) ( not ( = ?auto_740881 ?auto_740886 ) ) ( not ( = ?auto_740881 ?auto_740887 ) ) ( not ( = ?auto_740881 ?auto_740888 ) ) ( not ( = ?auto_740881 ?auto_740889 ) ) ( not ( = ?auto_740881 ?auto_740890 ) ) ( not ( = ?auto_740882 ?auto_740883 ) ) ( not ( = ?auto_740882 ?auto_740884 ) ) ( not ( = ?auto_740882 ?auto_740885 ) ) ( not ( = ?auto_740882 ?auto_740886 ) ) ( not ( = ?auto_740882 ?auto_740887 ) ) ( not ( = ?auto_740882 ?auto_740888 ) ) ( not ( = ?auto_740882 ?auto_740889 ) ) ( not ( = ?auto_740882 ?auto_740890 ) ) ( not ( = ?auto_740883 ?auto_740884 ) ) ( not ( = ?auto_740883 ?auto_740885 ) ) ( not ( = ?auto_740883 ?auto_740886 ) ) ( not ( = ?auto_740883 ?auto_740887 ) ) ( not ( = ?auto_740883 ?auto_740888 ) ) ( not ( = ?auto_740883 ?auto_740889 ) ) ( not ( = ?auto_740883 ?auto_740890 ) ) ( not ( = ?auto_740884 ?auto_740885 ) ) ( not ( = ?auto_740884 ?auto_740886 ) ) ( not ( = ?auto_740884 ?auto_740887 ) ) ( not ( = ?auto_740884 ?auto_740888 ) ) ( not ( = ?auto_740884 ?auto_740889 ) ) ( not ( = ?auto_740884 ?auto_740890 ) ) ( not ( = ?auto_740885 ?auto_740886 ) ) ( not ( = ?auto_740885 ?auto_740887 ) ) ( not ( = ?auto_740885 ?auto_740888 ) ) ( not ( = ?auto_740885 ?auto_740889 ) ) ( not ( = ?auto_740885 ?auto_740890 ) ) ( not ( = ?auto_740886 ?auto_740887 ) ) ( not ( = ?auto_740886 ?auto_740888 ) ) ( not ( = ?auto_740886 ?auto_740889 ) ) ( not ( = ?auto_740886 ?auto_740890 ) ) ( not ( = ?auto_740887 ?auto_740888 ) ) ( not ( = ?auto_740887 ?auto_740889 ) ) ( not ( = ?auto_740887 ?auto_740890 ) ) ( not ( = ?auto_740888 ?auto_740889 ) ) ( not ( = ?auto_740888 ?auto_740890 ) ) ( not ( = ?auto_740889 ?auto_740890 ) ) ( ON ?auto_740888 ?auto_740889 ) ( ON ?auto_740887 ?auto_740888 ) ( ON ?auto_740886 ?auto_740887 ) ( ON ?auto_740885 ?auto_740886 ) ( ON ?auto_740884 ?auto_740885 ) ( ON ?auto_740883 ?auto_740884 ) ( ON ?auto_740882 ?auto_740883 ) ( ON ?auto_740881 ?auto_740882 ) ( CLEAR ?auto_740881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_740881 )
      ( MAKE-9PILE ?auto_740881 ?auto_740882 ?auto_740883 ?auto_740884 ?auto_740885 ?auto_740886 ?auto_740887 ?auto_740888 ?auto_740889 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_740920 - BLOCK
      ?auto_740921 - BLOCK
      ?auto_740922 - BLOCK
      ?auto_740923 - BLOCK
      ?auto_740924 - BLOCK
      ?auto_740925 - BLOCK
      ?auto_740926 - BLOCK
      ?auto_740927 - BLOCK
      ?auto_740928 - BLOCK
      ?auto_740929 - BLOCK
    )
    :vars
    (
      ?auto_740930 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_740928 ) ( ON ?auto_740929 ?auto_740930 ) ( CLEAR ?auto_740929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_740920 ) ( ON ?auto_740921 ?auto_740920 ) ( ON ?auto_740922 ?auto_740921 ) ( ON ?auto_740923 ?auto_740922 ) ( ON ?auto_740924 ?auto_740923 ) ( ON ?auto_740925 ?auto_740924 ) ( ON ?auto_740926 ?auto_740925 ) ( ON ?auto_740927 ?auto_740926 ) ( ON ?auto_740928 ?auto_740927 ) ( not ( = ?auto_740920 ?auto_740921 ) ) ( not ( = ?auto_740920 ?auto_740922 ) ) ( not ( = ?auto_740920 ?auto_740923 ) ) ( not ( = ?auto_740920 ?auto_740924 ) ) ( not ( = ?auto_740920 ?auto_740925 ) ) ( not ( = ?auto_740920 ?auto_740926 ) ) ( not ( = ?auto_740920 ?auto_740927 ) ) ( not ( = ?auto_740920 ?auto_740928 ) ) ( not ( = ?auto_740920 ?auto_740929 ) ) ( not ( = ?auto_740920 ?auto_740930 ) ) ( not ( = ?auto_740921 ?auto_740922 ) ) ( not ( = ?auto_740921 ?auto_740923 ) ) ( not ( = ?auto_740921 ?auto_740924 ) ) ( not ( = ?auto_740921 ?auto_740925 ) ) ( not ( = ?auto_740921 ?auto_740926 ) ) ( not ( = ?auto_740921 ?auto_740927 ) ) ( not ( = ?auto_740921 ?auto_740928 ) ) ( not ( = ?auto_740921 ?auto_740929 ) ) ( not ( = ?auto_740921 ?auto_740930 ) ) ( not ( = ?auto_740922 ?auto_740923 ) ) ( not ( = ?auto_740922 ?auto_740924 ) ) ( not ( = ?auto_740922 ?auto_740925 ) ) ( not ( = ?auto_740922 ?auto_740926 ) ) ( not ( = ?auto_740922 ?auto_740927 ) ) ( not ( = ?auto_740922 ?auto_740928 ) ) ( not ( = ?auto_740922 ?auto_740929 ) ) ( not ( = ?auto_740922 ?auto_740930 ) ) ( not ( = ?auto_740923 ?auto_740924 ) ) ( not ( = ?auto_740923 ?auto_740925 ) ) ( not ( = ?auto_740923 ?auto_740926 ) ) ( not ( = ?auto_740923 ?auto_740927 ) ) ( not ( = ?auto_740923 ?auto_740928 ) ) ( not ( = ?auto_740923 ?auto_740929 ) ) ( not ( = ?auto_740923 ?auto_740930 ) ) ( not ( = ?auto_740924 ?auto_740925 ) ) ( not ( = ?auto_740924 ?auto_740926 ) ) ( not ( = ?auto_740924 ?auto_740927 ) ) ( not ( = ?auto_740924 ?auto_740928 ) ) ( not ( = ?auto_740924 ?auto_740929 ) ) ( not ( = ?auto_740924 ?auto_740930 ) ) ( not ( = ?auto_740925 ?auto_740926 ) ) ( not ( = ?auto_740925 ?auto_740927 ) ) ( not ( = ?auto_740925 ?auto_740928 ) ) ( not ( = ?auto_740925 ?auto_740929 ) ) ( not ( = ?auto_740925 ?auto_740930 ) ) ( not ( = ?auto_740926 ?auto_740927 ) ) ( not ( = ?auto_740926 ?auto_740928 ) ) ( not ( = ?auto_740926 ?auto_740929 ) ) ( not ( = ?auto_740926 ?auto_740930 ) ) ( not ( = ?auto_740927 ?auto_740928 ) ) ( not ( = ?auto_740927 ?auto_740929 ) ) ( not ( = ?auto_740927 ?auto_740930 ) ) ( not ( = ?auto_740928 ?auto_740929 ) ) ( not ( = ?auto_740928 ?auto_740930 ) ) ( not ( = ?auto_740929 ?auto_740930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_740929 ?auto_740930 )
      ( !STACK ?auto_740929 ?auto_740928 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_740962 - BLOCK
      ?auto_740963 - BLOCK
      ?auto_740964 - BLOCK
      ?auto_740965 - BLOCK
      ?auto_740966 - BLOCK
      ?auto_740967 - BLOCK
      ?auto_740968 - BLOCK
      ?auto_740969 - BLOCK
      ?auto_740970 - BLOCK
      ?auto_740971 - BLOCK
    )
    :vars
    (
      ?auto_740972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740971 ?auto_740972 ) ( ON-TABLE ?auto_740962 ) ( ON ?auto_740963 ?auto_740962 ) ( ON ?auto_740964 ?auto_740963 ) ( ON ?auto_740965 ?auto_740964 ) ( ON ?auto_740966 ?auto_740965 ) ( ON ?auto_740967 ?auto_740966 ) ( ON ?auto_740968 ?auto_740967 ) ( ON ?auto_740969 ?auto_740968 ) ( not ( = ?auto_740962 ?auto_740963 ) ) ( not ( = ?auto_740962 ?auto_740964 ) ) ( not ( = ?auto_740962 ?auto_740965 ) ) ( not ( = ?auto_740962 ?auto_740966 ) ) ( not ( = ?auto_740962 ?auto_740967 ) ) ( not ( = ?auto_740962 ?auto_740968 ) ) ( not ( = ?auto_740962 ?auto_740969 ) ) ( not ( = ?auto_740962 ?auto_740970 ) ) ( not ( = ?auto_740962 ?auto_740971 ) ) ( not ( = ?auto_740962 ?auto_740972 ) ) ( not ( = ?auto_740963 ?auto_740964 ) ) ( not ( = ?auto_740963 ?auto_740965 ) ) ( not ( = ?auto_740963 ?auto_740966 ) ) ( not ( = ?auto_740963 ?auto_740967 ) ) ( not ( = ?auto_740963 ?auto_740968 ) ) ( not ( = ?auto_740963 ?auto_740969 ) ) ( not ( = ?auto_740963 ?auto_740970 ) ) ( not ( = ?auto_740963 ?auto_740971 ) ) ( not ( = ?auto_740963 ?auto_740972 ) ) ( not ( = ?auto_740964 ?auto_740965 ) ) ( not ( = ?auto_740964 ?auto_740966 ) ) ( not ( = ?auto_740964 ?auto_740967 ) ) ( not ( = ?auto_740964 ?auto_740968 ) ) ( not ( = ?auto_740964 ?auto_740969 ) ) ( not ( = ?auto_740964 ?auto_740970 ) ) ( not ( = ?auto_740964 ?auto_740971 ) ) ( not ( = ?auto_740964 ?auto_740972 ) ) ( not ( = ?auto_740965 ?auto_740966 ) ) ( not ( = ?auto_740965 ?auto_740967 ) ) ( not ( = ?auto_740965 ?auto_740968 ) ) ( not ( = ?auto_740965 ?auto_740969 ) ) ( not ( = ?auto_740965 ?auto_740970 ) ) ( not ( = ?auto_740965 ?auto_740971 ) ) ( not ( = ?auto_740965 ?auto_740972 ) ) ( not ( = ?auto_740966 ?auto_740967 ) ) ( not ( = ?auto_740966 ?auto_740968 ) ) ( not ( = ?auto_740966 ?auto_740969 ) ) ( not ( = ?auto_740966 ?auto_740970 ) ) ( not ( = ?auto_740966 ?auto_740971 ) ) ( not ( = ?auto_740966 ?auto_740972 ) ) ( not ( = ?auto_740967 ?auto_740968 ) ) ( not ( = ?auto_740967 ?auto_740969 ) ) ( not ( = ?auto_740967 ?auto_740970 ) ) ( not ( = ?auto_740967 ?auto_740971 ) ) ( not ( = ?auto_740967 ?auto_740972 ) ) ( not ( = ?auto_740968 ?auto_740969 ) ) ( not ( = ?auto_740968 ?auto_740970 ) ) ( not ( = ?auto_740968 ?auto_740971 ) ) ( not ( = ?auto_740968 ?auto_740972 ) ) ( not ( = ?auto_740969 ?auto_740970 ) ) ( not ( = ?auto_740969 ?auto_740971 ) ) ( not ( = ?auto_740969 ?auto_740972 ) ) ( not ( = ?auto_740970 ?auto_740971 ) ) ( not ( = ?auto_740970 ?auto_740972 ) ) ( not ( = ?auto_740971 ?auto_740972 ) ) ( CLEAR ?auto_740969 ) ( ON ?auto_740970 ?auto_740971 ) ( CLEAR ?auto_740970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_740962 ?auto_740963 ?auto_740964 ?auto_740965 ?auto_740966 ?auto_740967 ?auto_740968 ?auto_740969 ?auto_740970 )
      ( MAKE-10PILE ?auto_740962 ?auto_740963 ?auto_740964 ?auto_740965 ?auto_740966 ?auto_740967 ?auto_740968 ?auto_740969 ?auto_740970 ?auto_740971 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_741004 - BLOCK
      ?auto_741005 - BLOCK
      ?auto_741006 - BLOCK
      ?auto_741007 - BLOCK
      ?auto_741008 - BLOCK
      ?auto_741009 - BLOCK
      ?auto_741010 - BLOCK
      ?auto_741011 - BLOCK
      ?auto_741012 - BLOCK
      ?auto_741013 - BLOCK
    )
    :vars
    (
      ?auto_741014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741013 ?auto_741014 ) ( ON-TABLE ?auto_741004 ) ( ON ?auto_741005 ?auto_741004 ) ( ON ?auto_741006 ?auto_741005 ) ( ON ?auto_741007 ?auto_741006 ) ( ON ?auto_741008 ?auto_741007 ) ( ON ?auto_741009 ?auto_741008 ) ( ON ?auto_741010 ?auto_741009 ) ( not ( = ?auto_741004 ?auto_741005 ) ) ( not ( = ?auto_741004 ?auto_741006 ) ) ( not ( = ?auto_741004 ?auto_741007 ) ) ( not ( = ?auto_741004 ?auto_741008 ) ) ( not ( = ?auto_741004 ?auto_741009 ) ) ( not ( = ?auto_741004 ?auto_741010 ) ) ( not ( = ?auto_741004 ?auto_741011 ) ) ( not ( = ?auto_741004 ?auto_741012 ) ) ( not ( = ?auto_741004 ?auto_741013 ) ) ( not ( = ?auto_741004 ?auto_741014 ) ) ( not ( = ?auto_741005 ?auto_741006 ) ) ( not ( = ?auto_741005 ?auto_741007 ) ) ( not ( = ?auto_741005 ?auto_741008 ) ) ( not ( = ?auto_741005 ?auto_741009 ) ) ( not ( = ?auto_741005 ?auto_741010 ) ) ( not ( = ?auto_741005 ?auto_741011 ) ) ( not ( = ?auto_741005 ?auto_741012 ) ) ( not ( = ?auto_741005 ?auto_741013 ) ) ( not ( = ?auto_741005 ?auto_741014 ) ) ( not ( = ?auto_741006 ?auto_741007 ) ) ( not ( = ?auto_741006 ?auto_741008 ) ) ( not ( = ?auto_741006 ?auto_741009 ) ) ( not ( = ?auto_741006 ?auto_741010 ) ) ( not ( = ?auto_741006 ?auto_741011 ) ) ( not ( = ?auto_741006 ?auto_741012 ) ) ( not ( = ?auto_741006 ?auto_741013 ) ) ( not ( = ?auto_741006 ?auto_741014 ) ) ( not ( = ?auto_741007 ?auto_741008 ) ) ( not ( = ?auto_741007 ?auto_741009 ) ) ( not ( = ?auto_741007 ?auto_741010 ) ) ( not ( = ?auto_741007 ?auto_741011 ) ) ( not ( = ?auto_741007 ?auto_741012 ) ) ( not ( = ?auto_741007 ?auto_741013 ) ) ( not ( = ?auto_741007 ?auto_741014 ) ) ( not ( = ?auto_741008 ?auto_741009 ) ) ( not ( = ?auto_741008 ?auto_741010 ) ) ( not ( = ?auto_741008 ?auto_741011 ) ) ( not ( = ?auto_741008 ?auto_741012 ) ) ( not ( = ?auto_741008 ?auto_741013 ) ) ( not ( = ?auto_741008 ?auto_741014 ) ) ( not ( = ?auto_741009 ?auto_741010 ) ) ( not ( = ?auto_741009 ?auto_741011 ) ) ( not ( = ?auto_741009 ?auto_741012 ) ) ( not ( = ?auto_741009 ?auto_741013 ) ) ( not ( = ?auto_741009 ?auto_741014 ) ) ( not ( = ?auto_741010 ?auto_741011 ) ) ( not ( = ?auto_741010 ?auto_741012 ) ) ( not ( = ?auto_741010 ?auto_741013 ) ) ( not ( = ?auto_741010 ?auto_741014 ) ) ( not ( = ?auto_741011 ?auto_741012 ) ) ( not ( = ?auto_741011 ?auto_741013 ) ) ( not ( = ?auto_741011 ?auto_741014 ) ) ( not ( = ?auto_741012 ?auto_741013 ) ) ( not ( = ?auto_741012 ?auto_741014 ) ) ( not ( = ?auto_741013 ?auto_741014 ) ) ( ON ?auto_741012 ?auto_741013 ) ( CLEAR ?auto_741010 ) ( ON ?auto_741011 ?auto_741012 ) ( CLEAR ?auto_741011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_741004 ?auto_741005 ?auto_741006 ?auto_741007 ?auto_741008 ?auto_741009 ?auto_741010 ?auto_741011 )
      ( MAKE-10PILE ?auto_741004 ?auto_741005 ?auto_741006 ?auto_741007 ?auto_741008 ?auto_741009 ?auto_741010 ?auto_741011 ?auto_741012 ?auto_741013 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_741046 - BLOCK
      ?auto_741047 - BLOCK
      ?auto_741048 - BLOCK
      ?auto_741049 - BLOCK
      ?auto_741050 - BLOCK
      ?auto_741051 - BLOCK
      ?auto_741052 - BLOCK
      ?auto_741053 - BLOCK
      ?auto_741054 - BLOCK
      ?auto_741055 - BLOCK
    )
    :vars
    (
      ?auto_741056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741055 ?auto_741056 ) ( ON-TABLE ?auto_741046 ) ( ON ?auto_741047 ?auto_741046 ) ( ON ?auto_741048 ?auto_741047 ) ( ON ?auto_741049 ?auto_741048 ) ( ON ?auto_741050 ?auto_741049 ) ( ON ?auto_741051 ?auto_741050 ) ( not ( = ?auto_741046 ?auto_741047 ) ) ( not ( = ?auto_741046 ?auto_741048 ) ) ( not ( = ?auto_741046 ?auto_741049 ) ) ( not ( = ?auto_741046 ?auto_741050 ) ) ( not ( = ?auto_741046 ?auto_741051 ) ) ( not ( = ?auto_741046 ?auto_741052 ) ) ( not ( = ?auto_741046 ?auto_741053 ) ) ( not ( = ?auto_741046 ?auto_741054 ) ) ( not ( = ?auto_741046 ?auto_741055 ) ) ( not ( = ?auto_741046 ?auto_741056 ) ) ( not ( = ?auto_741047 ?auto_741048 ) ) ( not ( = ?auto_741047 ?auto_741049 ) ) ( not ( = ?auto_741047 ?auto_741050 ) ) ( not ( = ?auto_741047 ?auto_741051 ) ) ( not ( = ?auto_741047 ?auto_741052 ) ) ( not ( = ?auto_741047 ?auto_741053 ) ) ( not ( = ?auto_741047 ?auto_741054 ) ) ( not ( = ?auto_741047 ?auto_741055 ) ) ( not ( = ?auto_741047 ?auto_741056 ) ) ( not ( = ?auto_741048 ?auto_741049 ) ) ( not ( = ?auto_741048 ?auto_741050 ) ) ( not ( = ?auto_741048 ?auto_741051 ) ) ( not ( = ?auto_741048 ?auto_741052 ) ) ( not ( = ?auto_741048 ?auto_741053 ) ) ( not ( = ?auto_741048 ?auto_741054 ) ) ( not ( = ?auto_741048 ?auto_741055 ) ) ( not ( = ?auto_741048 ?auto_741056 ) ) ( not ( = ?auto_741049 ?auto_741050 ) ) ( not ( = ?auto_741049 ?auto_741051 ) ) ( not ( = ?auto_741049 ?auto_741052 ) ) ( not ( = ?auto_741049 ?auto_741053 ) ) ( not ( = ?auto_741049 ?auto_741054 ) ) ( not ( = ?auto_741049 ?auto_741055 ) ) ( not ( = ?auto_741049 ?auto_741056 ) ) ( not ( = ?auto_741050 ?auto_741051 ) ) ( not ( = ?auto_741050 ?auto_741052 ) ) ( not ( = ?auto_741050 ?auto_741053 ) ) ( not ( = ?auto_741050 ?auto_741054 ) ) ( not ( = ?auto_741050 ?auto_741055 ) ) ( not ( = ?auto_741050 ?auto_741056 ) ) ( not ( = ?auto_741051 ?auto_741052 ) ) ( not ( = ?auto_741051 ?auto_741053 ) ) ( not ( = ?auto_741051 ?auto_741054 ) ) ( not ( = ?auto_741051 ?auto_741055 ) ) ( not ( = ?auto_741051 ?auto_741056 ) ) ( not ( = ?auto_741052 ?auto_741053 ) ) ( not ( = ?auto_741052 ?auto_741054 ) ) ( not ( = ?auto_741052 ?auto_741055 ) ) ( not ( = ?auto_741052 ?auto_741056 ) ) ( not ( = ?auto_741053 ?auto_741054 ) ) ( not ( = ?auto_741053 ?auto_741055 ) ) ( not ( = ?auto_741053 ?auto_741056 ) ) ( not ( = ?auto_741054 ?auto_741055 ) ) ( not ( = ?auto_741054 ?auto_741056 ) ) ( not ( = ?auto_741055 ?auto_741056 ) ) ( ON ?auto_741054 ?auto_741055 ) ( ON ?auto_741053 ?auto_741054 ) ( CLEAR ?auto_741051 ) ( ON ?auto_741052 ?auto_741053 ) ( CLEAR ?auto_741052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_741046 ?auto_741047 ?auto_741048 ?auto_741049 ?auto_741050 ?auto_741051 ?auto_741052 )
      ( MAKE-10PILE ?auto_741046 ?auto_741047 ?auto_741048 ?auto_741049 ?auto_741050 ?auto_741051 ?auto_741052 ?auto_741053 ?auto_741054 ?auto_741055 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_741088 - BLOCK
      ?auto_741089 - BLOCK
      ?auto_741090 - BLOCK
      ?auto_741091 - BLOCK
      ?auto_741092 - BLOCK
      ?auto_741093 - BLOCK
      ?auto_741094 - BLOCK
      ?auto_741095 - BLOCK
      ?auto_741096 - BLOCK
      ?auto_741097 - BLOCK
    )
    :vars
    (
      ?auto_741098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741097 ?auto_741098 ) ( ON-TABLE ?auto_741088 ) ( ON ?auto_741089 ?auto_741088 ) ( ON ?auto_741090 ?auto_741089 ) ( ON ?auto_741091 ?auto_741090 ) ( ON ?auto_741092 ?auto_741091 ) ( not ( = ?auto_741088 ?auto_741089 ) ) ( not ( = ?auto_741088 ?auto_741090 ) ) ( not ( = ?auto_741088 ?auto_741091 ) ) ( not ( = ?auto_741088 ?auto_741092 ) ) ( not ( = ?auto_741088 ?auto_741093 ) ) ( not ( = ?auto_741088 ?auto_741094 ) ) ( not ( = ?auto_741088 ?auto_741095 ) ) ( not ( = ?auto_741088 ?auto_741096 ) ) ( not ( = ?auto_741088 ?auto_741097 ) ) ( not ( = ?auto_741088 ?auto_741098 ) ) ( not ( = ?auto_741089 ?auto_741090 ) ) ( not ( = ?auto_741089 ?auto_741091 ) ) ( not ( = ?auto_741089 ?auto_741092 ) ) ( not ( = ?auto_741089 ?auto_741093 ) ) ( not ( = ?auto_741089 ?auto_741094 ) ) ( not ( = ?auto_741089 ?auto_741095 ) ) ( not ( = ?auto_741089 ?auto_741096 ) ) ( not ( = ?auto_741089 ?auto_741097 ) ) ( not ( = ?auto_741089 ?auto_741098 ) ) ( not ( = ?auto_741090 ?auto_741091 ) ) ( not ( = ?auto_741090 ?auto_741092 ) ) ( not ( = ?auto_741090 ?auto_741093 ) ) ( not ( = ?auto_741090 ?auto_741094 ) ) ( not ( = ?auto_741090 ?auto_741095 ) ) ( not ( = ?auto_741090 ?auto_741096 ) ) ( not ( = ?auto_741090 ?auto_741097 ) ) ( not ( = ?auto_741090 ?auto_741098 ) ) ( not ( = ?auto_741091 ?auto_741092 ) ) ( not ( = ?auto_741091 ?auto_741093 ) ) ( not ( = ?auto_741091 ?auto_741094 ) ) ( not ( = ?auto_741091 ?auto_741095 ) ) ( not ( = ?auto_741091 ?auto_741096 ) ) ( not ( = ?auto_741091 ?auto_741097 ) ) ( not ( = ?auto_741091 ?auto_741098 ) ) ( not ( = ?auto_741092 ?auto_741093 ) ) ( not ( = ?auto_741092 ?auto_741094 ) ) ( not ( = ?auto_741092 ?auto_741095 ) ) ( not ( = ?auto_741092 ?auto_741096 ) ) ( not ( = ?auto_741092 ?auto_741097 ) ) ( not ( = ?auto_741092 ?auto_741098 ) ) ( not ( = ?auto_741093 ?auto_741094 ) ) ( not ( = ?auto_741093 ?auto_741095 ) ) ( not ( = ?auto_741093 ?auto_741096 ) ) ( not ( = ?auto_741093 ?auto_741097 ) ) ( not ( = ?auto_741093 ?auto_741098 ) ) ( not ( = ?auto_741094 ?auto_741095 ) ) ( not ( = ?auto_741094 ?auto_741096 ) ) ( not ( = ?auto_741094 ?auto_741097 ) ) ( not ( = ?auto_741094 ?auto_741098 ) ) ( not ( = ?auto_741095 ?auto_741096 ) ) ( not ( = ?auto_741095 ?auto_741097 ) ) ( not ( = ?auto_741095 ?auto_741098 ) ) ( not ( = ?auto_741096 ?auto_741097 ) ) ( not ( = ?auto_741096 ?auto_741098 ) ) ( not ( = ?auto_741097 ?auto_741098 ) ) ( ON ?auto_741096 ?auto_741097 ) ( ON ?auto_741095 ?auto_741096 ) ( ON ?auto_741094 ?auto_741095 ) ( CLEAR ?auto_741092 ) ( ON ?auto_741093 ?auto_741094 ) ( CLEAR ?auto_741093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_741088 ?auto_741089 ?auto_741090 ?auto_741091 ?auto_741092 ?auto_741093 )
      ( MAKE-10PILE ?auto_741088 ?auto_741089 ?auto_741090 ?auto_741091 ?auto_741092 ?auto_741093 ?auto_741094 ?auto_741095 ?auto_741096 ?auto_741097 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_741130 - BLOCK
      ?auto_741131 - BLOCK
      ?auto_741132 - BLOCK
      ?auto_741133 - BLOCK
      ?auto_741134 - BLOCK
      ?auto_741135 - BLOCK
      ?auto_741136 - BLOCK
      ?auto_741137 - BLOCK
      ?auto_741138 - BLOCK
      ?auto_741139 - BLOCK
    )
    :vars
    (
      ?auto_741140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741139 ?auto_741140 ) ( ON-TABLE ?auto_741130 ) ( ON ?auto_741131 ?auto_741130 ) ( ON ?auto_741132 ?auto_741131 ) ( ON ?auto_741133 ?auto_741132 ) ( not ( = ?auto_741130 ?auto_741131 ) ) ( not ( = ?auto_741130 ?auto_741132 ) ) ( not ( = ?auto_741130 ?auto_741133 ) ) ( not ( = ?auto_741130 ?auto_741134 ) ) ( not ( = ?auto_741130 ?auto_741135 ) ) ( not ( = ?auto_741130 ?auto_741136 ) ) ( not ( = ?auto_741130 ?auto_741137 ) ) ( not ( = ?auto_741130 ?auto_741138 ) ) ( not ( = ?auto_741130 ?auto_741139 ) ) ( not ( = ?auto_741130 ?auto_741140 ) ) ( not ( = ?auto_741131 ?auto_741132 ) ) ( not ( = ?auto_741131 ?auto_741133 ) ) ( not ( = ?auto_741131 ?auto_741134 ) ) ( not ( = ?auto_741131 ?auto_741135 ) ) ( not ( = ?auto_741131 ?auto_741136 ) ) ( not ( = ?auto_741131 ?auto_741137 ) ) ( not ( = ?auto_741131 ?auto_741138 ) ) ( not ( = ?auto_741131 ?auto_741139 ) ) ( not ( = ?auto_741131 ?auto_741140 ) ) ( not ( = ?auto_741132 ?auto_741133 ) ) ( not ( = ?auto_741132 ?auto_741134 ) ) ( not ( = ?auto_741132 ?auto_741135 ) ) ( not ( = ?auto_741132 ?auto_741136 ) ) ( not ( = ?auto_741132 ?auto_741137 ) ) ( not ( = ?auto_741132 ?auto_741138 ) ) ( not ( = ?auto_741132 ?auto_741139 ) ) ( not ( = ?auto_741132 ?auto_741140 ) ) ( not ( = ?auto_741133 ?auto_741134 ) ) ( not ( = ?auto_741133 ?auto_741135 ) ) ( not ( = ?auto_741133 ?auto_741136 ) ) ( not ( = ?auto_741133 ?auto_741137 ) ) ( not ( = ?auto_741133 ?auto_741138 ) ) ( not ( = ?auto_741133 ?auto_741139 ) ) ( not ( = ?auto_741133 ?auto_741140 ) ) ( not ( = ?auto_741134 ?auto_741135 ) ) ( not ( = ?auto_741134 ?auto_741136 ) ) ( not ( = ?auto_741134 ?auto_741137 ) ) ( not ( = ?auto_741134 ?auto_741138 ) ) ( not ( = ?auto_741134 ?auto_741139 ) ) ( not ( = ?auto_741134 ?auto_741140 ) ) ( not ( = ?auto_741135 ?auto_741136 ) ) ( not ( = ?auto_741135 ?auto_741137 ) ) ( not ( = ?auto_741135 ?auto_741138 ) ) ( not ( = ?auto_741135 ?auto_741139 ) ) ( not ( = ?auto_741135 ?auto_741140 ) ) ( not ( = ?auto_741136 ?auto_741137 ) ) ( not ( = ?auto_741136 ?auto_741138 ) ) ( not ( = ?auto_741136 ?auto_741139 ) ) ( not ( = ?auto_741136 ?auto_741140 ) ) ( not ( = ?auto_741137 ?auto_741138 ) ) ( not ( = ?auto_741137 ?auto_741139 ) ) ( not ( = ?auto_741137 ?auto_741140 ) ) ( not ( = ?auto_741138 ?auto_741139 ) ) ( not ( = ?auto_741138 ?auto_741140 ) ) ( not ( = ?auto_741139 ?auto_741140 ) ) ( ON ?auto_741138 ?auto_741139 ) ( ON ?auto_741137 ?auto_741138 ) ( ON ?auto_741136 ?auto_741137 ) ( ON ?auto_741135 ?auto_741136 ) ( CLEAR ?auto_741133 ) ( ON ?auto_741134 ?auto_741135 ) ( CLEAR ?auto_741134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_741130 ?auto_741131 ?auto_741132 ?auto_741133 ?auto_741134 )
      ( MAKE-10PILE ?auto_741130 ?auto_741131 ?auto_741132 ?auto_741133 ?auto_741134 ?auto_741135 ?auto_741136 ?auto_741137 ?auto_741138 ?auto_741139 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_741172 - BLOCK
      ?auto_741173 - BLOCK
      ?auto_741174 - BLOCK
      ?auto_741175 - BLOCK
      ?auto_741176 - BLOCK
      ?auto_741177 - BLOCK
      ?auto_741178 - BLOCK
      ?auto_741179 - BLOCK
      ?auto_741180 - BLOCK
      ?auto_741181 - BLOCK
    )
    :vars
    (
      ?auto_741182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741181 ?auto_741182 ) ( ON-TABLE ?auto_741172 ) ( ON ?auto_741173 ?auto_741172 ) ( ON ?auto_741174 ?auto_741173 ) ( not ( = ?auto_741172 ?auto_741173 ) ) ( not ( = ?auto_741172 ?auto_741174 ) ) ( not ( = ?auto_741172 ?auto_741175 ) ) ( not ( = ?auto_741172 ?auto_741176 ) ) ( not ( = ?auto_741172 ?auto_741177 ) ) ( not ( = ?auto_741172 ?auto_741178 ) ) ( not ( = ?auto_741172 ?auto_741179 ) ) ( not ( = ?auto_741172 ?auto_741180 ) ) ( not ( = ?auto_741172 ?auto_741181 ) ) ( not ( = ?auto_741172 ?auto_741182 ) ) ( not ( = ?auto_741173 ?auto_741174 ) ) ( not ( = ?auto_741173 ?auto_741175 ) ) ( not ( = ?auto_741173 ?auto_741176 ) ) ( not ( = ?auto_741173 ?auto_741177 ) ) ( not ( = ?auto_741173 ?auto_741178 ) ) ( not ( = ?auto_741173 ?auto_741179 ) ) ( not ( = ?auto_741173 ?auto_741180 ) ) ( not ( = ?auto_741173 ?auto_741181 ) ) ( not ( = ?auto_741173 ?auto_741182 ) ) ( not ( = ?auto_741174 ?auto_741175 ) ) ( not ( = ?auto_741174 ?auto_741176 ) ) ( not ( = ?auto_741174 ?auto_741177 ) ) ( not ( = ?auto_741174 ?auto_741178 ) ) ( not ( = ?auto_741174 ?auto_741179 ) ) ( not ( = ?auto_741174 ?auto_741180 ) ) ( not ( = ?auto_741174 ?auto_741181 ) ) ( not ( = ?auto_741174 ?auto_741182 ) ) ( not ( = ?auto_741175 ?auto_741176 ) ) ( not ( = ?auto_741175 ?auto_741177 ) ) ( not ( = ?auto_741175 ?auto_741178 ) ) ( not ( = ?auto_741175 ?auto_741179 ) ) ( not ( = ?auto_741175 ?auto_741180 ) ) ( not ( = ?auto_741175 ?auto_741181 ) ) ( not ( = ?auto_741175 ?auto_741182 ) ) ( not ( = ?auto_741176 ?auto_741177 ) ) ( not ( = ?auto_741176 ?auto_741178 ) ) ( not ( = ?auto_741176 ?auto_741179 ) ) ( not ( = ?auto_741176 ?auto_741180 ) ) ( not ( = ?auto_741176 ?auto_741181 ) ) ( not ( = ?auto_741176 ?auto_741182 ) ) ( not ( = ?auto_741177 ?auto_741178 ) ) ( not ( = ?auto_741177 ?auto_741179 ) ) ( not ( = ?auto_741177 ?auto_741180 ) ) ( not ( = ?auto_741177 ?auto_741181 ) ) ( not ( = ?auto_741177 ?auto_741182 ) ) ( not ( = ?auto_741178 ?auto_741179 ) ) ( not ( = ?auto_741178 ?auto_741180 ) ) ( not ( = ?auto_741178 ?auto_741181 ) ) ( not ( = ?auto_741178 ?auto_741182 ) ) ( not ( = ?auto_741179 ?auto_741180 ) ) ( not ( = ?auto_741179 ?auto_741181 ) ) ( not ( = ?auto_741179 ?auto_741182 ) ) ( not ( = ?auto_741180 ?auto_741181 ) ) ( not ( = ?auto_741180 ?auto_741182 ) ) ( not ( = ?auto_741181 ?auto_741182 ) ) ( ON ?auto_741180 ?auto_741181 ) ( ON ?auto_741179 ?auto_741180 ) ( ON ?auto_741178 ?auto_741179 ) ( ON ?auto_741177 ?auto_741178 ) ( ON ?auto_741176 ?auto_741177 ) ( CLEAR ?auto_741174 ) ( ON ?auto_741175 ?auto_741176 ) ( CLEAR ?auto_741175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_741172 ?auto_741173 ?auto_741174 ?auto_741175 )
      ( MAKE-10PILE ?auto_741172 ?auto_741173 ?auto_741174 ?auto_741175 ?auto_741176 ?auto_741177 ?auto_741178 ?auto_741179 ?auto_741180 ?auto_741181 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_741214 - BLOCK
      ?auto_741215 - BLOCK
      ?auto_741216 - BLOCK
      ?auto_741217 - BLOCK
      ?auto_741218 - BLOCK
      ?auto_741219 - BLOCK
      ?auto_741220 - BLOCK
      ?auto_741221 - BLOCK
      ?auto_741222 - BLOCK
      ?auto_741223 - BLOCK
    )
    :vars
    (
      ?auto_741224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741223 ?auto_741224 ) ( ON-TABLE ?auto_741214 ) ( ON ?auto_741215 ?auto_741214 ) ( not ( = ?auto_741214 ?auto_741215 ) ) ( not ( = ?auto_741214 ?auto_741216 ) ) ( not ( = ?auto_741214 ?auto_741217 ) ) ( not ( = ?auto_741214 ?auto_741218 ) ) ( not ( = ?auto_741214 ?auto_741219 ) ) ( not ( = ?auto_741214 ?auto_741220 ) ) ( not ( = ?auto_741214 ?auto_741221 ) ) ( not ( = ?auto_741214 ?auto_741222 ) ) ( not ( = ?auto_741214 ?auto_741223 ) ) ( not ( = ?auto_741214 ?auto_741224 ) ) ( not ( = ?auto_741215 ?auto_741216 ) ) ( not ( = ?auto_741215 ?auto_741217 ) ) ( not ( = ?auto_741215 ?auto_741218 ) ) ( not ( = ?auto_741215 ?auto_741219 ) ) ( not ( = ?auto_741215 ?auto_741220 ) ) ( not ( = ?auto_741215 ?auto_741221 ) ) ( not ( = ?auto_741215 ?auto_741222 ) ) ( not ( = ?auto_741215 ?auto_741223 ) ) ( not ( = ?auto_741215 ?auto_741224 ) ) ( not ( = ?auto_741216 ?auto_741217 ) ) ( not ( = ?auto_741216 ?auto_741218 ) ) ( not ( = ?auto_741216 ?auto_741219 ) ) ( not ( = ?auto_741216 ?auto_741220 ) ) ( not ( = ?auto_741216 ?auto_741221 ) ) ( not ( = ?auto_741216 ?auto_741222 ) ) ( not ( = ?auto_741216 ?auto_741223 ) ) ( not ( = ?auto_741216 ?auto_741224 ) ) ( not ( = ?auto_741217 ?auto_741218 ) ) ( not ( = ?auto_741217 ?auto_741219 ) ) ( not ( = ?auto_741217 ?auto_741220 ) ) ( not ( = ?auto_741217 ?auto_741221 ) ) ( not ( = ?auto_741217 ?auto_741222 ) ) ( not ( = ?auto_741217 ?auto_741223 ) ) ( not ( = ?auto_741217 ?auto_741224 ) ) ( not ( = ?auto_741218 ?auto_741219 ) ) ( not ( = ?auto_741218 ?auto_741220 ) ) ( not ( = ?auto_741218 ?auto_741221 ) ) ( not ( = ?auto_741218 ?auto_741222 ) ) ( not ( = ?auto_741218 ?auto_741223 ) ) ( not ( = ?auto_741218 ?auto_741224 ) ) ( not ( = ?auto_741219 ?auto_741220 ) ) ( not ( = ?auto_741219 ?auto_741221 ) ) ( not ( = ?auto_741219 ?auto_741222 ) ) ( not ( = ?auto_741219 ?auto_741223 ) ) ( not ( = ?auto_741219 ?auto_741224 ) ) ( not ( = ?auto_741220 ?auto_741221 ) ) ( not ( = ?auto_741220 ?auto_741222 ) ) ( not ( = ?auto_741220 ?auto_741223 ) ) ( not ( = ?auto_741220 ?auto_741224 ) ) ( not ( = ?auto_741221 ?auto_741222 ) ) ( not ( = ?auto_741221 ?auto_741223 ) ) ( not ( = ?auto_741221 ?auto_741224 ) ) ( not ( = ?auto_741222 ?auto_741223 ) ) ( not ( = ?auto_741222 ?auto_741224 ) ) ( not ( = ?auto_741223 ?auto_741224 ) ) ( ON ?auto_741222 ?auto_741223 ) ( ON ?auto_741221 ?auto_741222 ) ( ON ?auto_741220 ?auto_741221 ) ( ON ?auto_741219 ?auto_741220 ) ( ON ?auto_741218 ?auto_741219 ) ( ON ?auto_741217 ?auto_741218 ) ( CLEAR ?auto_741215 ) ( ON ?auto_741216 ?auto_741217 ) ( CLEAR ?auto_741216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_741214 ?auto_741215 ?auto_741216 )
      ( MAKE-10PILE ?auto_741214 ?auto_741215 ?auto_741216 ?auto_741217 ?auto_741218 ?auto_741219 ?auto_741220 ?auto_741221 ?auto_741222 ?auto_741223 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_741256 - BLOCK
      ?auto_741257 - BLOCK
      ?auto_741258 - BLOCK
      ?auto_741259 - BLOCK
      ?auto_741260 - BLOCK
      ?auto_741261 - BLOCK
      ?auto_741262 - BLOCK
      ?auto_741263 - BLOCK
      ?auto_741264 - BLOCK
      ?auto_741265 - BLOCK
    )
    :vars
    (
      ?auto_741266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741265 ?auto_741266 ) ( ON-TABLE ?auto_741256 ) ( not ( = ?auto_741256 ?auto_741257 ) ) ( not ( = ?auto_741256 ?auto_741258 ) ) ( not ( = ?auto_741256 ?auto_741259 ) ) ( not ( = ?auto_741256 ?auto_741260 ) ) ( not ( = ?auto_741256 ?auto_741261 ) ) ( not ( = ?auto_741256 ?auto_741262 ) ) ( not ( = ?auto_741256 ?auto_741263 ) ) ( not ( = ?auto_741256 ?auto_741264 ) ) ( not ( = ?auto_741256 ?auto_741265 ) ) ( not ( = ?auto_741256 ?auto_741266 ) ) ( not ( = ?auto_741257 ?auto_741258 ) ) ( not ( = ?auto_741257 ?auto_741259 ) ) ( not ( = ?auto_741257 ?auto_741260 ) ) ( not ( = ?auto_741257 ?auto_741261 ) ) ( not ( = ?auto_741257 ?auto_741262 ) ) ( not ( = ?auto_741257 ?auto_741263 ) ) ( not ( = ?auto_741257 ?auto_741264 ) ) ( not ( = ?auto_741257 ?auto_741265 ) ) ( not ( = ?auto_741257 ?auto_741266 ) ) ( not ( = ?auto_741258 ?auto_741259 ) ) ( not ( = ?auto_741258 ?auto_741260 ) ) ( not ( = ?auto_741258 ?auto_741261 ) ) ( not ( = ?auto_741258 ?auto_741262 ) ) ( not ( = ?auto_741258 ?auto_741263 ) ) ( not ( = ?auto_741258 ?auto_741264 ) ) ( not ( = ?auto_741258 ?auto_741265 ) ) ( not ( = ?auto_741258 ?auto_741266 ) ) ( not ( = ?auto_741259 ?auto_741260 ) ) ( not ( = ?auto_741259 ?auto_741261 ) ) ( not ( = ?auto_741259 ?auto_741262 ) ) ( not ( = ?auto_741259 ?auto_741263 ) ) ( not ( = ?auto_741259 ?auto_741264 ) ) ( not ( = ?auto_741259 ?auto_741265 ) ) ( not ( = ?auto_741259 ?auto_741266 ) ) ( not ( = ?auto_741260 ?auto_741261 ) ) ( not ( = ?auto_741260 ?auto_741262 ) ) ( not ( = ?auto_741260 ?auto_741263 ) ) ( not ( = ?auto_741260 ?auto_741264 ) ) ( not ( = ?auto_741260 ?auto_741265 ) ) ( not ( = ?auto_741260 ?auto_741266 ) ) ( not ( = ?auto_741261 ?auto_741262 ) ) ( not ( = ?auto_741261 ?auto_741263 ) ) ( not ( = ?auto_741261 ?auto_741264 ) ) ( not ( = ?auto_741261 ?auto_741265 ) ) ( not ( = ?auto_741261 ?auto_741266 ) ) ( not ( = ?auto_741262 ?auto_741263 ) ) ( not ( = ?auto_741262 ?auto_741264 ) ) ( not ( = ?auto_741262 ?auto_741265 ) ) ( not ( = ?auto_741262 ?auto_741266 ) ) ( not ( = ?auto_741263 ?auto_741264 ) ) ( not ( = ?auto_741263 ?auto_741265 ) ) ( not ( = ?auto_741263 ?auto_741266 ) ) ( not ( = ?auto_741264 ?auto_741265 ) ) ( not ( = ?auto_741264 ?auto_741266 ) ) ( not ( = ?auto_741265 ?auto_741266 ) ) ( ON ?auto_741264 ?auto_741265 ) ( ON ?auto_741263 ?auto_741264 ) ( ON ?auto_741262 ?auto_741263 ) ( ON ?auto_741261 ?auto_741262 ) ( ON ?auto_741260 ?auto_741261 ) ( ON ?auto_741259 ?auto_741260 ) ( ON ?auto_741258 ?auto_741259 ) ( CLEAR ?auto_741256 ) ( ON ?auto_741257 ?auto_741258 ) ( CLEAR ?auto_741257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_741256 ?auto_741257 )
      ( MAKE-10PILE ?auto_741256 ?auto_741257 ?auto_741258 ?auto_741259 ?auto_741260 ?auto_741261 ?auto_741262 ?auto_741263 ?auto_741264 ?auto_741265 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_741298 - BLOCK
      ?auto_741299 - BLOCK
      ?auto_741300 - BLOCK
      ?auto_741301 - BLOCK
      ?auto_741302 - BLOCK
      ?auto_741303 - BLOCK
      ?auto_741304 - BLOCK
      ?auto_741305 - BLOCK
      ?auto_741306 - BLOCK
      ?auto_741307 - BLOCK
    )
    :vars
    (
      ?auto_741308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741307 ?auto_741308 ) ( not ( = ?auto_741298 ?auto_741299 ) ) ( not ( = ?auto_741298 ?auto_741300 ) ) ( not ( = ?auto_741298 ?auto_741301 ) ) ( not ( = ?auto_741298 ?auto_741302 ) ) ( not ( = ?auto_741298 ?auto_741303 ) ) ( not ( = ?auto_741298 ?auto_741304 ) ) ( not ( = ?auto_741298 ?auto_741305 ) ) ( not ( = ?auto_741298 ?auto_741306 ) ) ( not ( = ?auto_741298 ?auto_741307 ) ) ( not ( = ?auto_741298 ?auto_741308 ) ) ( not ( = ?auto_741299 ?auto_741300 ) ) ( not ( = ?auto_741299 ?auto_741301 ) ) ( not ( = ?auto_741299 ?auto_741302 ) ) ( not ( = ?auto_741299 ?auto_741303 ) ) ( not ( = ?auto_741299 ?auto_741304 ) ) ( not ( = ?auto_741299 ?auto_741305 ) ) ( not ( = ?auto_741299 ?auto_741306 ) ) ( not ( = ?auto_741299 ?auto_741307 ) ) ( not ( = ?auto_741299 ?auto_741308 ) ) ( not ( = ?auto_741300 ?auto_741301 ) ) ( not ( = ?auto_741300 ?auto_741302 ) ) ( not ( = ?auto_741300 ?auto_741303 ) ) ( not ( = ?auto_741300 ?auto_741304 ) ) ( not ( = ?auto_741300 ?auto_741305 ) ) ( not ( = ?auto_741300 ?auto_741306 ) ) ( not ( = ?auto_741300 ?auto_741307 ) ) ( not ( = ?auto_741300 ?auto_741308 ) ) ( not ( = ?auto_741301 ?auto_741302 ) ) ( not ( = ?auto_741301 ?auto_741303 ) ) ( not ( = ?auto_741301 ?auto_741304 ) ) ( not ( = ?auto_741301 ?auto_741305 ) ) ( not ( = ?auto_741301 ?auto_741306 ) ) ( not ( = ?auto_741301 ?auto_741307 ) ) ( not ( = ?auto_741301 ?auto_741308 ) ) ( not ( = ?auto_741302 ?auto_741303 ) ) ( not ( = ?auto_741302 ?auto_741304 ) ) ( not ( = ?auto_741302 ?auto_741305 ) ) ( not ( = ?auto_741302 ?auto_741306 ) ) ( not ( = ?auto_741302 ?auto_741307 ) ) ( not ( = ?auto_741302 ?auto_741308 ) ) ( not ( = ?auto_741303 ?auto_741304 ) ) ( not ( = ?auto_741303 ?auto_741305 ) ) ( not ( = ?auto_741303 ?auto_741306 ) ) ( not ( = ?auto_741303 ?auto_741307 ) ) ( not ( = ?auto_741303 ?auto_741308 ) ) ( not ( = ?auto_741304 ?auto_741305 ) ) ( not ( = ?auto_741304 ?auto_741306 ) ) ( not ( = ?auto_741304 ?auto_741307 ) ) ( not ( = ?auto_741304 ?auto_741308 ) ) ( not ( = ?auto_741305 ?auto_741306 ) ) ( not ( = ?auto_741305 ?auto_741307 ) ) ( not ( = ?auto_741305 ?auto_741308 ) ) ( not ( = ?auto_741306 ?auto_741307 ) ) ( not ( = ?auto_741306 ?auto_741308 ) ) ( not ( = ?auto_741307 ?auto_741308 ) ) ( ON ?auto_741306 ?auto_741307 ) ( ON ?auto_741305 ?auto_741306 ) ( ON ?auto_741304 ?auto_741305 ) ( ON ?auto_741303 ?auto_741304 ) ( ON ?auto_741302 ?auto_741303 ) ( ON ?auto_741301 ?auto_741302 ) ( ON ?auto_741300 ?auto_741301 ) ( ON ?auto_741299 ?auto_741300 ) ( ON ?auto_741298 ?auto_741299 ) ( CLEAR ?auto_741298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_741298 )
      ( MAKE-10PILE ?auto_741298 ?auto_741299 ?auto_741300 ?auto_741301 ?auto_741302 ?auto_741303 ?auto_741304 ?auto_741305 ?auto_741306 ?auto_741307 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_741341 - BLOCK
      ?auto_741342 - BLOCK
      ?auto_741343 - BLOCK
      ?auto_741344 - BLOCK
      ?auto_741345 - BLOCK
      ?auto_741346 - BLOCK
      ?auto_741347 - BLOCK
      ?auto_741348 - BLOCK
      ?auto_741349 - BLOCK
      ?auto_741350 - BLOCK
      ?auto_741351 - BLOCK
    )
    :vars
    (
      ?auto_741352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_741350 ) ( ON ?auto_741351 ?auto_741352 ) ( CLEAR ?auto_741351 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_741341 ) ( ON ?auto_741342 ?auto_741341 ) ( ON ?auto_741343 ?auto_741342 ) ( ON ?auto_741344 ?auto_741343 ) ( ON ?auto_741345 ?auto_741344 ) ( ON ?auto_741346 ?auto_741345 ) ( ON ?auto_741347 ?auto_741346 ) ( ON ?auto_741348 ?auto_741347 ) ( ON ?auto_741349 ?auto_741348 ) ( ON ?auto_741350 ?auto_741349 ) ( not ( = ?auto_741341 ?auto_741342 ) ) ( not ( = ?auto_741341 ?auto_741343 ) ) ( not ( = ?auto_741341 ?auto_741344 ) ) ( not ( = ?auto_741341 ?auto_741345 ) ) ( not ( = ?auto_741341 ?auto_741346 ) ) ( not ( = ?auto_741341 ?auto_741347 ) ) ( not ( = ?auto_741341 ?auto_741348 ) ) ( not ( = ?auto_741341 ?auto_741349 ) ) ( not ( = ?auto_741341 ?auto_741350 ) ) ( not ( = ?auto_741341 ?auto_741351 ) ) ( not ( = ?auto_741341 ?auto_741352 ) ) ( not ( = ?auto_741342 ?auto_741343 ) ) ( not ( = ?auto_741342 ?auto_741344 ) ) ( not ( = ?auto_741342 ?auto_741345 ) ) ( not ( = ?auto_741342 ?auto_741346 ) ) ( not ( = ?auto_741342 ?auto_741347 ) ) ( not ( = ?auto_741342 ?auto_741348 ) ) ( not ( = ?auto_741342 ?auto_741349 ) ) ( not ( = ?auto_741342 ?auto_741350 ) ) ( not ( = ?auto_741342 ?auto_741351 ) ) ( not ( = ?auto_741342 ?auto_741352 ) ) ( not ( = ?auto_741343 ?auto_741344 ) ) ( not ( = ?auto_741343 ?auto_741345 ) ) ( not ( = ?auto_741343 ?auto_741346 ) ) ( not ( = ?auto_741343 ?auto_741347 ) ) ( not ( = ?auto_741343 ?auto_741348 ) ) ( not ( = ?auto_741343 ?auto_741349 ) ) ( not ( = ?auto_741343 ?auto_741350 ) ) ( not ( = ?auto_741343 ?auto_741351 ) ) ( not ( = ?auto_741343 ?auto_741352 ) ) ( not ( = ?auto_741344 ?auto_741345 ) ) ( not ( = ?auto_741344 ?auto_741346 ) ) ( not ( = ?auto_741344 ?auto_741347 ) ) ( not ( = ?auto_741344 ?auto_741348 ) ) ( not ( = ?auto_741344 ?auto_741349 ) ) ( not ( = ?auto_741344 ?auto_741350 ) ) ( not ( = ?auto_741344 ?auto_741351 ) ) ( not ( = ?auto_741344 ?auto_741352 ) ) ( not ( = ?auto_741345 ?auto_741346 ) ) ( not ( = ?auto_741345 ?auto_741347 ) ) ( not ( = ?auto_741345 ?auto_741348 ) ) ( not ( = ?auto_741345 ?auto_741349 ) ) ( not ( = ?auto_741345 ?auto_741350 ) ) ( not ( = ?auto_741345 ?auto_741351 ) ) ( not ( = ?auto_741345 ?auto_741352 ) ) ( not ( = ?auto_741346 ?auto_741347 ) ) ( not ( = ?auto_741346 ?auto_741348 ) ) ( not ( = ?auto_741346 ?auto_741349 ) ) ( not ( = ?auto_741346 ?auto_741350 ) ) ( not ( = ?auto_741346 ?auto_741351 ) ) ( not ( = ?auto_741346 ?auto_741352 ) ) ( not ( = ?auto_741347 ?auto_741348 ) ) ( not ( = ?auto_741347 ?auto_741349 ) ) ( not ( = ?auto_741347 ?auto_741350 ) ) ( not ( = ?auto_741347 ?auto_741351 ) ) ( not ( = ?auto_741347 ?auto_741352 ) ) ( not ( = ?auto_741348 ?auto_741349 ) ) ( not ( = ?auto_741348 ?auto_741350 ) ) ( not ( = ?auto_741348 ?auto_741351 ) ) ( not ( = ?auto_741348 ?auto_741352 ) ) ( not ( = ?auto_741349 ?auto_741350 ) ) ( not ( = ?auto_741349 ?auto_741351 ) ) ( not ( = ?auto_741349 ?auto_741352 ) ) ( not ( = ?auto_741350 ?auto_741351 ) ) ( not ( = ?auto_741350 ?auto_741352 ) ) ( not ( = ?auto_741351 ?auto_741352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_741351 ?auto_741352 )
      ( !STACK ?auto_741351 ?auto_741350 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_741387 - BLOCK
      ?auto_741388 - BLOCK
      ?auto_741389 - BLOCK
      ?auto_741390 - BLOCK
      ?auto_741391 - BLOCK
      ?auto_741392 - BLOCK
      ?auto_741393 - BLOCK
      ?auto_741394 - BLOCK
      ?auto_741395 - BLOCK
      ?auto_741396 - BLOCK
      ?auto_741397 - BLOCK
    )
    :vars
    (
      ?auto_741398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741397 ?auto_741398 ) ( ON-TABLE ?auto_741387 ) ( ON ?auto_741388 ?auto_741387 ) ( ON ?auto_741389 ?auto_741388 ) ( ON ?auto_741390 ?auto_741389 ) ( ON ?auto_741391 ?auto_741390 ) ( ON ?auto_741392 ?auto_741391 ) ( ON ?auto_741393 ?auto_741392 ) ( ON ?auto_741394 ?auto_741393 ) ( ON ?auto_741395 ?auto_741394 ) ( not ( = ?auto_741387 ?auto_741388 ) ) ( not ( = ?auto_741387 ?auto_741389 ) ) ( not ( = ?auto_741387 ?auto_741390 ) ) ( not ( = ?auto_741387 ?auto_741391 ) ) ( not ( = ?auto_741387 ?auto_741392 ) ) ( not ( = ?auto_741387 ?auto_741393 ) ) ( not ( = ?auto_741387 ?auto_741394 ) ) ( not ( = ?auto_741387 ?auto_741395 ) ) ( not ( = ?auto_741387 ?auto_741396 ) ) ( not ( = ?auto_741387 ?auto_741397 ) ) ( not ( = ?auto_741387 ?auto_741398 ) ) ( not ( = ?auto_741388 ?auto_741389 ) ) ( not ( = ?auto_741388 ?auto_741390 ) ) ( not ( = ?auto_741388 ?auto_741391 ) ) ( not ( = ?auto_741388 ?auto_741392 ) ) ( not ( = ?auto_741388 ?auto_741393 ) ) ( not ( = ?auto_741388 ?auto_741394 ) ) ( not ( = ?auto_741388 ?auto_741395 ) ) ( not ( = ?auto_741388 ?auto_741396 ) ) ( not ( = ?auto_741388 ?auto_741397 ) ) ( not ( = ?auto_741388 ?auto_741398 ) ) ( not ( = ?auto_741389 ?auto_741390 ) ) ( not ( = ?auto_741389 ?auto_741391 ) ) ( not ( = ?auto_741389 ?auto_741392 ) ) ( not ( = ?auto_741389 ?auto_741393 ) ) ( not ( = ?auto_741389 ?auto_741394 ) ) ( not ( = ?auto_741389 ?auto_741395 ) ) ( not ( = ?auto_741389 ?auto_741396 ) ) ( not ( = ?auto_741389 ?auto_741397 ) ) ( not ( = ?auto_741389 ?auto_741398 ) ) ( not ( = ?auto_741390 ?auto_741391 ) ) ( not ( = ?auto_741390 ?auto_741392 ) ) ( not ( = ?auto_741390 ?auto_741393 ) ) ( not ( = ?auto_741390 ?auto_741394 ) ) ( not ( = ?auto_741390 ?auto_741395 ) ) ( not ( = ?auto_741390 ?auto_741396 ) ) ( not ( = ?auto_741390 ?auto_741397 ) ) ( not ( = ?auto_741390 ?auto_741398 ) ) ( not ( = ?auto_741391 ?auto_741392 ) ) ( not ( = ?auto_741391 ?auto_741393 ) ) ( not ( = ?auto_741391 ?auto_741394 ) ) ( not ( = ?auto_741391 ?auto_741395 ) ) ( not ( = ?auto_741391 ?auto_741396 ) ) ( not ( = ?auto_741391 ?auto_741397 ) ) ( not ( = ?auto_741391 ?auto_741398 ) ) ( not ( = ?auto_741392 ?auto_741393 ) ) ( not ( = ?auto_741392 ?auto_741394 ) ) ( not ( = ?auto_741392 ?auto_741395 ) ) ( not ( = ?auto_741392 ?auto_741396 ) ) ( not ( = ?auto_741392 ?auto_741397 ) ) ( not ( = ?auto_741392 ?auto_741398 ) ) ( not ( = ?auto_741393 ?auto_741394 ) ) ( not ( = ?auto_741393 ?auto_741395 ) ) ( not ( = ?auto_741393 ?auto_741396 ) ) ( not ( = ?auto_741393 ?auto_741397 ) ) ( not ( = ?auto_741393 ?auto_741398 ) ) ( not ( = ?auto_741394 ?auto_741395 ) ) ( not ( = ?auto_741394 ?auto_741396 ) ) ( not ( = ?auto_741394 ?auto_741397 ) ) ( not ( = ?auto_741394 ?auto_741398 ) ) ( not ( = ?auto_741395 ?auto_741396 ) ) ( not ( = ?auto_741395 ?auto_741397 ) ) ( not ( = ?auto_741395 ?auto_741398 ) ) ( not ( = ?auto_741396 ?auto_741397 ) ) ( not ( = ?auto_741396 ?auto_741398 ) ) ( not ( = ?auto_741397 ?auto_741398 ) ) ( CLEAR ?auto_741395 ) ( ON ?auto_741396 ?auto_741397 ) ( CLEAR ?auto_741396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_741387 ?auto_741388 ?auto_741389 ?auto_741390 ?auto_741391 ?auto_741392 ?auto_741393 ?auto_741394 ?auto_741395 ?auto_741396 )
      ( MAKE-11PILE ?auto_741387 ?auto_741388 ?auto_741389 ?auto_741390 ?auto_741391 ?auto_741392 ?auto_741393 ?auto_741394 ?auto_741395 ?auto_741396 ?auto_741397 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_741433 - BLOCK
      ?auto_741434 - BLOCK
      ?auto_741435 - BLOCK
      ?auto_741436 - BLOCK
      ?auto_741437 - BLOCK
      ?auto_741438 - BLOCK
      ?auto_741439 - BLOCK
      ?auto_741440 - BLOCK
      ?auto_741441 - BLOCK
      ?auto_741442 - BLOCK
      ?auto_741443 - BLOCK
    )
    :vars
    (
      ?auto_741444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741443 ?auto_741444 ) ( ON-TABLE ?auto_741433 ) ( ON ?auto_741434 ?auto_741433 ) ( ON ?auto_741435 ?auto_741434 ) ( ON ?auto_741436 ?auto_741435 ) ( ON ?auto_741437 ?auto_741436 ) ( ON ?auto_741438 ?auto_741437 ) ( ON ?auto_741439 ?auto_741438 ) ( ON ?auto_741440 ?auto_741439 ) ( not ( = ?auto_741433 ?auto_741434 ) ) ( not ( = ?auto_741433 ?auto_741435 ) ) ( not ( = ?auto_741433 ?auto_741436 ) ) ( not ( = ?auto_741433 ?auto_741437 ) ) ( not ( = ?auto_741433 ?auto_741438 ) ) ( not ( = ?auto_741433 ?auto_741439 ) ) ( not ( = ?auto_741433 ?auto_741440 ) ) ( not ( = ?auto_741433 ?auto_741441 ) ) ( not ( = ?auto_741433 ?auto_741442 ) ) ( not ( = ?auto_741433 ?auto_741443 ) ) ( not ( = ?auto_741433 ?auto_741444 ) ) ( not ( = ?auto_741434 ?auto_741435 ) ) ( not ( = ?auto_741434 ?auto_741436 ) ) ( not ( = ?auto_741434 ?auto_741437 ) ) ( not ( = ?auto_741434 ?auto_741438 ) ) ( not ( = ?auto_741434 ?auto_741439 ) ) ( not ( = ?auto_741434 ?auto_741440 ) ) ( not ( = ?auto_741434 ?auto_741441 ) ) ( not ( = ?auto_741434 ?auto_741442 ) ) ( not ( = ?auto_741434 ?auto_741443 ) ) ( not ( = ?auto_741434 ?auto_741444 ) ) ( not ( = ?auto_741435 ?auto_741436 ) ) ( not ( = ?auto_741435 ?auto_741437 ) ) ( not ( = ?auto_741435 ?auto_741438 ) ) ( not ( = ?auto_741435 ?auto_741439 ) ) ( not ( = ?auto_741435 ?auto_741440 ) ) ( not ( = ?auto_741435 ?auto_741441 ) ) ( not ( = ?auto_741435 ?auto_741442 ) ) ( not ( = ?auto_741435 ?auto_741443 ) ) ( not ( = ?auto_741435 ?auto_741444 ) ) ( not ( = ?auto_741436 ?auto_741437 ) ) ( not ( = ?auto_741436 ?auto_741438 ) ) ( not ( = ?auto_741436 ?auto_741439 ) ) ( not ( = ?auto_741436 ?auto_741440 ) ) ( not ( = ?auto_741436 ?auto_741441 ) ) ( not ( = ?auto_741436 ?auto_741442 ) ) ( not ( = ?auto_741436 ?auto_741443 ) ) ( not ( = ?auto_741436 ?auto_741444 ) ) ( not ( = ?auto_741437 ?auto_741438 ) ) ( not ( = ?auto_741437 ?auto_741439 ) ) ( not ( = ?auto_741437 ?auto_741440 ) ) ( not ( = ?auto_741437 ?auto_741441 ) ) ( not ( = ?auto_741437 ?auto_741442 ) ) ( not ( = ?auto_741437 ?auto_741443 ) ) ( not ( = ?auto_741437 ?auto_741444 ) ) ( not ( = ?auto_741438 ?auto_741439 ) ) ( not ( = ?auto_741438 ?auto_741440 ) ) ( not ( = ?auto_741438 ?auto_741441 ) ) ( not ( = ?auto_741438 ?auto_741442 ) ) ( not ( = ?auto_741438 ?auto_741443 ) ) ( not ( = ?auto_741438 ?auto_741444 ) ) ( not ( = ?auto_741439 ?auto_741440 ) ) ( not ( = ?auto_741439 ?auto_741441 ) ) ( not ( = ?auto_741439 ?auto_741442 ) ) ( not ( = ?auto_741439 ?auto_741443 ) ) ( not ( = ?auto_741439 ?auto_741444 ) ) ( not ( = ?auto_741440 ?auto_741441 ) ) ( not ( = ?auto_741440 ?auto_741442 ) ) ( not ( = ?auto_741440 ?auto_741443 ) ) ( not ( = ?auto_741440 ?auto_741444 ) ) ( not ( = ?auto_741441 ?auto_741442 ) ) ( not ( = ?auto_741441 ?auto_741443 ) ) ( not ( = ?auto_741441 ?auto_741444 ) ) ( not ( = ?auto_741442 ?auto_741443 ) ) ( not ( = ?auto_741442 ?auto_741444 ) ) ( not ( = ?auto_741443 ?auto_741444 ) ) ( ON ?auto_741442 ?auto_741443 ) ( CLEAR ?auto_741440 ) ( ON ?auto_741441 ?auto_741442 ) ( CLEAR ?auto_741441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_741433 ?auto_741434 ?auto_741435 ?auto_741436 ?auto_741437 ?auto_741438 ?auto_741439 ?auto_741440 ?auto_741441 )
      ( MAKE-11PILE ?auto_741433 ?auto_741434 ?auto_741435 ?auto_741436 ?auto_741437 ?auto_741438 ?auto_741439 ?auto_741440 ?auto_741441 ?auto_741442 ?auto_741443 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_741479 - BLOCK
      ?auto_741480 - BLOCK
      ?auto_741481 - BLOCK
      ?auto_741482 - BLOCK
      ?auto_741483 - BLOCK
      ?auto_741484 - BLOCK
      ?auto_741485 - BLOCK
      ?auto_741486 - BLOCK
      ?auto_741487 - BLOCK
      ?auto_741488 - BLOCK
      ?auto_741489 - BLOCK
    )
    :vars
    (
      ?auto_741490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741489 ?auto_741490 ) ( ON-TABLE ?auto_741479 ) ( ON ?auto_741480 ?auto_741479 ) ( ON ?auto_741481 ?auto_741480 ) ( ON ?auto_741482 ?auto_741481 ) ( ON ?auto_741483 ?auto_741482 ) ( ON ?auto_741484 ?auto_741483 ) ( ON ?auto_741485 ?auto_741484 ) ( not ( = ?auto_741479 ?auto_741480 ) ) ( not ( = ?auto_741479 ?auto_741481 ) ) ( not ( = ?auto_741479 ?auto_741482 ) ) ( not ( = ?auto_741479 ?auto_741483 ) ) ( not ( = ?auto_741479 ?auto_741484 ) ) ( not ( = ?auto_741479 ?auto_741485 ) ) ( not ( = ?auto_741479 ?auto_741486 ) ) ( not ( = ?auto_741479 ?auto_741487 ) ) ( not ( = ?auto_741479 ?auto_741488 ) ) ( not ( = ?auto_741479 ?auto_741489 ) ) ( not ( = ?auto_741479 ?auto_741490 ) ) ( not ( = ?auto_741480 ?auto_741481 ) ) ( not ( = ?auto_741480 ?auto_741482 ) ) ( not ( = ?auto_741480 ?auto_741483 ) ) ( not ( = ?auto_741480 ?auto_741484 ) ) ( not ( = ?auto_741480 ?auto_741485 ) ) ( not ( = ?auto_741480 ?auto_741486 ) ) ( not ( = ?auto_741480 ?auto_741487 ) ) ( not ( = ?auto_741480 ?auto_741488 ) ) ( not ( = ?auto_741480 ?auto_741489 ) ) ( not ( = ?auto_741480 ?auto_741490 ) ) ( not ( = ?auto_741481 ?auto_741482 ) ) ( not ( = ?auto_741481 ?auto_741483 ) ) ( not ( = ?auto_741481 ?auto_741484 ) ) ( not ( = ?auto_741481 ?auto_741485 ) ) ( not ( = ?auto_741481 ?auto_741486 ) ) ( not ( = ?auto_741481 ?auto_741487 ) ) ( not ( = ?auto_741481 ?auto_741488 ) ) ( not ( = ?auto_741481 ?auto_741489 ) ) ( not ( = ?auto_741481 ?auto_741490 ) ) ( not ( = ?auto_741482 ?auto_741483 ) ) ( not ( = ?auto_741482 ?auto_741484 ) ) ( not ( = ?auto_741482 ?auto_741485 ) ) ( not ( = ?auto_741482 ?auto_741486 ) ) ( not ( = ?auto_741482 ?auto_741487 ) ) ( not ( = ?auto_741482 ?auto_741488 ) ) ( not ( = ?auto_741482 ?auto_741489 ) ) ( not ( = ?auto_741482 ?auto_741490 ) ) ( not ( = ?auto_741483 ?auto_741484 ) ) ( not ( = ?auto_741483 ?auto_741485 ) ) ( not ( = ?auto_741483 ?auto_741486 ) ) ( not ( = ?auto_741483 ?auto_741487 ) ) ( not ( = ?auto_741483 ?auto_741488 ) ) ( not ( = ?auto_741483 ?auto_741489 ) ) ( not ( = ?auto_741483 ?auto_741490 ) ) ( not ( = ?auto_741484 ?auto_741485 ) ) ( not ( = ?auto_741484 ?auto_741486 ) ) ( not ( = ?auto_741484 ?auto_741487 ) ) ( not ( = ?auto_741484 ?auto_741488 ) ) ( not ( = ?auto_741484 ?auto_741489 ) ) ( not ( = ?auto_741484 ?auto_741490 ) ) ( not ( = ?auto_741485 ?auto_741486 ) ) ( not ( = ?auto_741485 ?auto_741487 ) ) ( not ( = ?auto_741485 ?auto_741488 ) ) ( not ( = ?auto_741485 ?auto_741489 ) ) ( not ( = ?auto_741485 ?auto_741490 ) ) ( not ( = ?auto_741486 ?auto_741487 ) ) ( not ( = ?auto_741486 ?auto_741488 ) ) ( not ( = ?auto_741486 ?auto_741489 ) ) ( not ( = ?auto_741486 ?auto_741490 ) ) ( not ( = ?auto_741487 ?auto_741488 ) ) ( not ( = ?auto_741487 ?auto_741489 ) ) ( not ( = ?auto_741487 ?auto_741490 ) ) ( not ( = ?auto_741488 ?auto_741489 ) ) ( not ( = ?auto_741488 ?auto_741490 ) ) ( not ( = ?auto_741489 ?auto_741490 ) ) ( ON ?auto_741488 ?auto_741489 ) ( ON ?auto_741487 ?auto_741488 ) ( CLEAR ?auto_741485 ) ( ON ?auto_741486 ?auto_741487 ) ( CLEAR ?auto_741486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_741479 ?auto_741480 ?auto_741481 ?auto_741482 ?auto_741483 ?auto_741484 ?auto_741485 ?auto_741486 )
      ( MAKE-11PILE ?auto_741479 ?auto_741480 ?auto_741481 ?auto_741482 ?auto_741483 ?auto_741484 ?auto_741485 ?auto_741486 ?auto_741487 ?auto_741488 ?auto_741489 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_741525 - BLOCK
      ?auto_741526 - BLOCK
      ?auto_741527 - BLOCK
      ?auto_741528 - BLOCK
      ?auto_741529 - BLOCK
      ?auto_741530 - BLOCK
      ?auto_741531 - BLOCK
      ?auto_741532 - BLOCK
      ?auto_741533 - BLOCK
      ?auto_741534 - BLOCK
      ?auto_741535 - BLOCK
    )
    :vars
    (
      ?auto_741536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741535 ?auto_741536 ) ( ON-TABLE ?auto_741525 ) ( ON ?auto_741526 ?auto_741525 ) ( ON ?auto_741527 ?auto_741526 ) ( ON ?auto_741528 ?auto_741527 ) ( ON ?auto_741529 ?auto_741528 ) ( ON ?auto_741530 ?auto_741529 ) ( not ( = ?auto_741525 ?auto_741526 ) ) ( not ( = ?auto_741525 ?auto_741527 ) ) ( not ( = ?auto_741525 ?auto_741528 ) ) ( not ( = ?auto_741525 ?auto_741529 ) ) ( not ( = ?auto_741525 ?auto_741530 ) ) ( not ( = ?auto_741525 ?auto_741531 ) ) ( not ( = ?auto_741525 ?auto_741532 ) ) ( not ( = ?auto_741525 ?auto_741533 ) ) ( not ( = ?auto_741525 ?auto_741534 ) ) ( not ( = ?auto_741525 ?auto_741535 ) ) ( not ( = ?auto_741525 ?auto_741536 ) ) ( not ( = ?auto_741526 ?auto_741527 ) ) ( not ( = ?auto_741526 ?auto_741528 ) ) ( not ( = ?auto_741526 ?auto_741529 ) ) ( not ( = ?auto_741526 ?auto_741530 ) ) ( not ( = ?auto_741526 ?auto_741531 ) ) ( not ( = ?auto_741526 ?auto_741532 ) ) ( not ( = ?auto_741526 ?auto_741533 ) ) ( not ( = ?auto_741526 ?auto_741534 ) ) ( not ( = ?auto_741526 ?auto_741535 ) ) ( not ( = ?auto_741526 ?auto_741536 ) ) ( not ( = ?auto_741527 ?auto_741528 ) ) ( not ( = ?auto_741527 ?auto_741529 ) ) ( not ( = ?auto_741527 ?auto_741530 ) ) ( not ( = ?auto_741527 ?auto_741531 ) ) ( not ( = ?auto_741527 ?auto_741532 ) ) ( not ( = ?auto_741527 ?auto_741533 ) ) ( not ( = ?auto_741527 ?auto_741534 ) ) ( not ( = ?auto_741527 ?auto_741535 ) ) ( not ( = ?auto_741527 ?auto_741536 ) ) ( not ( = ?auto_741528 ?auto_741529 ) ) ( not ( = ?auto_741528 ?auto_741530 ) ) ( not ( = ?auto_741528 ?auto_741531 ) ) ( not ( = ?auto_741528 ?auto_741532 ) ) ( not ( = ?auto_741528 ?auto_741533 ) ) ( not ( = ?auto_741528 ?auto_741534 ) ) ( not ( = ?auto_741528 ?auto_741535 ) ) ( not ( = ?auto_741528 ?auto_741536 ) ) ( not ( = ?auto_741529 ?auto_741530 ) ) ( not ( = ?auto_741529 ?auto_741531 ) ) ( not ( = ?auto_741529 ?auto_741532 ) ) ( not ( = ?auto_741529 ?auto_741533 ) ) ( not ( = ?auto_741529 ?auto_741534 ) ) ( not ( = ?auto_741529 ?auto_741535 ) ) ( not ( = ?auto_741529 ?auto_741536 ) ) ( not ( = ?auto_741530 ?auto_741531 ) ) ( not ( = ?auto_741530 ?auto_741532 ) ) ( not ( = ?auto_741530 ?auto_741533 ) ) ( not ( = ?auto_741530 ?auto_741534 ) ) ( not ( = ?auto_741530 ?auto_741535 ) ) ( not ( = ?auto_741530 ?auto_741536 ) ) ( not ( = ?auto_741531 ?auto_741532 ) ) ( not ( = ?auto_741531 ?auto_741533 ) ) ( not ( = ?auto_741531 ?auto_741534 ) ) ( not ( = ?auto_741531 ?auto_741535 ) ) ( not ( = ?auto_741531 ?auto_741536 ) ) ( not ( = ?auto_741532 ?auto_741533 ) ) ( not ( = ?auto_741532 ?auto_741534 ) ) ( not ( = ?auto_741532 ?auto_741535 ) ) ( not ( = ?auto_741532 ?auto_741536 ) ) ( not ( = ?auto_741533 ?auto_741534 ) ) ( not ( = ?auto_741533 ?auto_741535 ) ) ( not ( = ?auto_741533 ?auto_741536 ) ) ( not ( = ?auto_741534 ?auto_741535 ) ) ( not ( = ?auto_741534 ?auto_741536 ) ) ( not ( = ?auto_741535 ?auto_741536 ) ) ( ON ?auto_741534 ?auto_741535 ) ( ON ?auto_741533 ?auto_741534 ) ( ON ?auto_741532 ?auto_741533 ) ( CLEAR ?auto_741530 ) ( ON ?auto_741531 ?auto_741532 ) ( CLEAR ?auto_741531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_741525 ?auto_741526 ?auto_741527 ?auto_741528 ?auto_741529 ?auto_741530 ?auto_741531 )
      ( MAKE-11PILE ?auto_741525 ?auto_741526 ?auto_741527 ?auto_741528 ?auto_741529 ?auto_741530 ?auto_741531 ?auto_741532 ?auto_741533 ?auto_741534 ?auto_741535 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_741571 - BLOCK
      ?auto_741572 - BLOCK
      ?auto_741573 - BLOCK
      ?auto_741574 - BLOCK
      ?auto_741575 - BLOCK
      ?auto_741576 - BLOCK
      ?auto_741577 - BLOCK
      ?auto_741578 - BLOCK
      ?auto_741579 - BLOCK
      ?auto_741580 - BLOCK
      ?auto_741581 - BLOCK
    )
    :vars
    (
      ?auto_741582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741581 ?auto_741582 ) ( ON-TABLE ?auto_741571 ) ( ON ?auto_741572 ?auto_741571 ) ( ON ?auto_741573 ?auto_741572 ) ( ON ?auto_741574 ?auto_741573 ) ( ON ?auto_741575 ?auto_741574 ) ( not ( = ?auto_741571 ?auto_741572 ) ) ( not ( = ?auto_741571 ?auto_741573 ) ) ( not ( = ?auto_741571 ?auto_741574 ) ) ( not ( = ?auto_741571 ?auto_741575 ) ) ( not ( = ?auto_741571 ?auto_741576 ) ) ( not ( = ?auto_741571 ?auto_741577 ) ) ( not ( = ?auto_741571 ?auto_741578 ) ) ( not ( = ?auto_741571 ?auto_741579 ) ) ( not ( = ?auto_741571 ?auto_741580 ) ) ( not ( = ?auto_741571 ?auto_741581 ) ) ( not ( = ?auto_741571 ?auto_741582 ) ) ( not ( = ?auto_741572 ?auto_741573 ) ) ( not ( = ?auto_741572 ?auto_741574 ) ) ( not ( = ?auto_741572 ?auto_741575 ) ) ( not ( = ?auto_741572 ?auto_741576 ) ) ( not ( = ?auto_741572 ?auto_741577 ) ) ( not ( = ?auto_741572 ?auto_741578 ) ) ( not ( = ?auto_741572 ?auto_741579 ) ) ( not ( = ?auto_741572 ?auto_741580 ) ) ( not ( = ?auto_741572 ?auto_741581 ) ) ( not ( = ?auto_741572 ?auto_741582 ) ) ( not ( = ?auto_741573 ?auto_741574 ) ) ( not ( = ?auto_741573 ?auto_741575 ) ) ( not ( = ?auto_741573 ?auto_741576 ) ) ( not ( = ?auto_741573 ?auto_741577 ) ) ( not ( = ?auto_741573 ?auto_741578 ) ) ( not ( = ?auto_741573 ?auto_741579 ) ) ( not ( = ?auto_741573 ?auto_741580 ) ) ( not ( = ?auto_741573 ?auto_741581 ) ) ( not ( = ?auto_741573 ?auto_741582 ) ) ( not ( = ?auto_741574 ?auto_741575 ) ) ( not ( = ?auto_741574 ?auto_741576 ) ) ( not ( = ?auto_741574 ?auto_741577 ) ) ( not ( = ?auto_741574 ?auto_741578 ) ) ( not ( = ?auto_741574 ?auto_741579 ) ) ( not ( = ?auto_741574 ?auto_741580 ) ) ( not ( = ?auto_741574 ?auto_741581 ) ) ( not ( = ?auto_741574 ?auto_741582 ) ) ( not ( = ?auto_741575 ?auto_741576 ) ) ( not ( = ?auto_741575 ?auto_741577 ) ) ( not ( = ?auto_741575 ?auto_741578 ) ) ( not ( = ?auto_741575 ?auto_741579 ) ) ( not ( = ?auto_741575 ?auto_741580 ) ) ( not ( = ?auto_741575 ?auto_741581 ) ) ( not ( = ?auto_741575 ?auto_741582 ) ) ( not ( = ?auto_741576 ?auto_741577 ) ) ( not ( = ?auto_741576 ?auto_741578 ) ) ( not ( = ?auto_741576 ?auto_741579 ) ) ( not ( = ?auto_741576 ?auto_741580 ) ) ( not ( = ?auto_741576 ?auto_741581 ) ) ( not ( = ?auto_741576 ?auto_741582 ) ) ( not ( = ?auto_741577 ?auto_741578 ) ) ( not ( = ?auto_741577 ?auto_741579 ) ) ( not ( = ?auto_741577 ?auto_741580 ) ) ( not ( = ?auto_741577 ?auto_741581 ) ) ( not ( = ?auto_741577 ?auto_741582 ) ) ( not ( = ?auto_741578 ?auto_741579 ) ) ( not ( = ?auto_741578 ?auto_741580 ) ) ( not ( = ?auto_741578 ?auto_741581 ) ) ( not ( = ?auto_741578 ?auto_741582 ) ) ( not ( = ?auto_741579 ?auto_741580 ) ) ( not ( = ?auto_741579 ?auto_741581 ) ) ( not ( = ?auto_741579 ?auto_741582 ) ) ( not ( = ?auto_741580 ?auto_741581 ) ) ( not ( = ?auto_741580 ?auto_741582 ) ) ( not ( = ?auto_741581 ?auto_741582 ) ) ( ON ?auto_741580 ?auto_741581 ) ( ON ?auto_741579 ?auto_741580 ) ( ON ?auto_741578 ?auto_741579 ) ( ON ?auto_741577 ?auto_741578 ) ( CLEAR ?auto_741575 ) ( ON ?auto_741576 ?auto_741577 ) ( CLEAR ?auto_741576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_741571 ?auto_741572 ?auto_741573 ?auto_741574 ?auto_741575 ?auto_741576 )
      ( MAKE-11PILE ?auto_741571 ?auto_741572 ?auto_741573 ?auto_741574 ?auto_741575 ?auto_741576 ?auto_741577 ?auto_741578 ?auto_741579 ?auto_741580 ?auto_741581 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_741617 - BLOCK
      ?auto_741618 - BLOCK
      ?auto_741619 - BLOCK
      ?auto_741620 - BLOCK
      ?auto_741621 - BLOCK
      ?auto_741622 - BLOCK
      ?auto_741623 - BLOCK
      ?auto_741624 - BLOCK
      ?auto_741625 - BLOCK
      ?auto_741626 - BLOCK
      ?auto_741627 - BLOCK
    )
    :vars
    (
      ?auto_741628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741627 ?auto_741628 ) ( ON-TABLE ?auto_741617 ) ( ON ?auto_741618 ?auto_741617 ) ( ON ?auto_741619 ?auto_741618 ) ( ON ?auto_741620 ?auto_741619 ) ( not ( = ?auto_741617 ?auto_741618 ) ) ( not ( = ?auto_741617 ?auto_741619 ) ) ( not ( = ?auto_741617 ?auto_741620 ) ) ( not ( = ?auto_741617 ?auto_741621 ) ) ( not ( = ?auto_741617 ?auto_741622 ) ) ( not ( = ?auto_741617 ?auto_741623 ) ) ( not ( = ?auto_741617 ?auto_741624 ) ) ( not ( = ?auto_741617 ?auto_741625 ) ) ( not ( = ?auto_741617 ?auto_741626 ) ) ( not ( = ?auto_741617 ?auto_741627 ) ) ( not ( = ?auto_741617 ?auto_741628 ) ) ( not ( = ?auto_741618 ?auto_741619 ) ) ( not ( = ?auto_741618 ?auto_741620 ) ) ( not ( = ?auto_741618 ?auto_741621 ) ) ( not ( = ?auto_741618 ?auto_741622 ) ) ( not ( = ?auto_741618 ?auto_741623 ) ) ( not ( = ?auto_741618 ?auto_741624 ) ) ( not ( = ?auto_741618 ?auto_741625 ) ) ( not ( = ?auto_741618 ?auto_741626 ) ) ( not ( = ?auto_741618 ?auto_741627 ) ) ( not ( = ?auto_741618 ?auto_741628 ) ) ( not ( = ?auto_741619 ?auto_741620 ) ) ( not ( = ?auto_741619 ?auto_741621 ) ) ( not ( = ?auto_741619 ?auto_741622 ) ) ( not ( = ?auto_741619 ?auto_741623 ) ) ( not ( = ?auto_741619 ?auto_741624 ) ) ( not ( = ?auto_741619 ?auto_741625 ) ) ( not ( = ?auto_741619 ?auto_741626 ) ) ( not ( = ?auto_741619 ?auto_741627 ) ) ( not ( = ?auto_741619 ?auto_741628 ) ) ( not ( = ?auto_741620 ?auto_741621 ) ) ( not ( = ?auto_741620 ?auto_741622 ) ) ( not ( = ?auto_741620 ?auto_741623 ) ) ( not ( = ?auto_741620 ?auto_741624 ) ) ( not ( = ?auto_741620 ?auto_741625 ) ) ( not ( = ?auto_741620 ?auto_741626 ) ) ( not ( = ?auto_741620 ?auto_741627 ) ) ( not ( = ?auto_741620 ?auto_741628 ) ) ( not ( = ?auto_741621 ?auto_741622 ) ) ( not ( = ?auto_741621 ?auto_741623 ) ) ( not ( = ?auto_741621 ?auto_741624 ) ) ( not ( = ?auto_741621 ?auto_741625 ) ) ( not ( = ?auto_741621 ?auto_741626 ) ) ( not ( = ?auto_741621 ?auto_741627 ) ) ( not ( = ?auto_741621 ?auto_741628 ) ) ( not ( = ?auto_741622 ?auto_741623 ) ) ( not ( = ?auto_741622 ?auto_741624 ) ) ( not ( = ?auto_741622 ?auto_741625 ) ) ( not ( = ?auto_741622 ?auto_741626 ) ) ( not ( = ?auto_741622 ?auto_741627 ) ) ( not ( = ?auto_741622 ?auto_741628 ) ) ( not ( = ?auto_741623 ?auto_741624 ) ) ( not ( = ?auto_741623 ?auto_741625 ) ) ( not ( = ?auto_741623 ?auto_741626 ) ) ( not ( = ?auto_741623 ?auto_741627 ) ) ( not ( = ?auto_741623 ?auto_741628 ) ) ( not ( = ?auto_741624 ?auto_741625 ) ) ( not ( = ?auto_741624 ?auto_741626 ) ) ( not ( = ?auto_741624 ?auto_741627 ) ) ( not ( = ?auto_741624 ?auto_741628 ) ) ( not ( = ?auto_741625 ?auto_741626 ) ) ( not ( = ?auto_741625 ?auto_741627 ) ) ( not ( = ?auto_741625 ?auto_741628 ) ) ( not ( = ?auto_741626 ?auto_741627 ) ) ( not ( = ?auto_741626 ?auto_741628 ) ) ( not ( = ?auto_741627 ?auto_741628 ) ) ( ON ?auto_741626 ?auto_741627 ) ( ON ?auto_741625 ?auto_741626 ) ( ON ?auto_741624 ?auto_741625 ) ( ON ?auto_741623 ?auto_741624 ) ( ON ?auto_741622 ?auto_741623 ) ( CLEAR ?auto_741620 ) ( ON ?auto_741621 ?auto_741622 ) ( CLEAR ?auto_741621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_741617 ?auto_741618 ?auto_741619 ?auto_741620 ?auto_741621 )
      ( MAKE-11PILE ?auto_741617 ?auto_741618 ?auto_741619 ?auto_741620 ?auto_741621 ?auto_741622 ?auto_741623 ?auto_741624 ?auto_741625 ?auto_741626 ?auto_741627 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_741663 - BLOCK
      ?auto_741664 - BLOCK
      ?auto_741665 - BLOCK
      ?auto_741666 - BLOCK
      ?auto_741667 - BLOCK
      ?auto_741668 - BLOCK
      ?auto_741669 - BLOCK
      ?auto_741670 - BLOCK
      ?auto_741671 - BLOCK
      ?auto_741672 - BLOCK
      ?auto_741673 - BLOCK
    )
    :vars
    (
      ?auto_741674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741673 ?auto_741674 ) ( ON-TABLE ?auto_741663 ) ( ON ?auto_741664 ?auto_741663 ) ( ON ?auto_741665 ?auto_741664 ) ( not ( = ?auto_741663 ?auto_741664 ) ) ( not ( = ?auto_741663 ?auto_741665 ) ) ( not ( = ?auto_741663 ?auto_741666 ) ) ( not ( = ?auto_741663 ?auto_741667 ) ) ( not ( = ?auto_741663 ?auto_741668 ) ) ( not ( = ?auto_741663 ?auto_741669 ) ) ( not ( = ?auto_741663 ?auto_741670 ) ) ( not ( = ?auto_741663 ?auto_741671 ) ) ( not ( = ?auto_741663 ?auto_741672 ) ) ( not ( = ?auto_741663 ?auto_741673 ) ) ( not ( = ?auto_741663 ?auto_741674 ) ) ( not ( = ?auto_741664 ?auto_741665 ) ) ( not ( = ?auto_741664 ?auto_741666 ) ) ( not ( = ?auto_741664 ?auto_741667 ) ) ( not ( = ?auto_741664 ?auto_741668 ) ) ( not ( = ?auto_741664 ?auto_741669 ) ) ( not ( = ?auto_741664 ?auto_741670 ) ) ( not ( = ?auto_741664 ?auto_741671 ) ) ( not ( = ?auto_741664 ?auto_741672 ) ) ( not ( = ?auto_741664 ?auto_741673 ) ) ( not ( = ?auto_741664 ?auto_741674 ) ) ( not ( = ?auto_741665 ?auto_741666 ) ) ( not ( = ?auto_741665 ?auto_741667 ) ) ( not ( = ?auto_741665 ?auto_741668 ) ) ( not ( = ?auto_741665 ?auto_741669 ) ) ( not ( = ?auto_741665 ?auto_741670 ) ) ( not ( = ?auto_741665 ?auto_741671 ) ) ( not ( = ?auto_741665 ?auto_741672 ) ) ( not ( = ?auto_741665 ?auto_741673 ) ) ( not ( = ?auto_741665 ?auto_741674 ) ) ( not ( = ?auto_741666 ?auto_741667 ) ) ( not ( = ?auto_741666 ?auto_741668 ) ) ( not ( = ?auto_741666 ?auto_741669 ) ) ( not ( = ?auto_741666 ?auto_741670 ) ) ( not ( = ?auto_741666 ?auto_741671 ) ) ( not ( = ?auto_741666 ?auto_741672 ) ) ( not ( = ?auto_741666 ?auto_741673 ) ) ( not ( = ?auto_741666 ?auto_741674 ) ) ( not ( = ?auto_741667 ?auto_741668 ) ) ( not ( = ?auto_741667 ?auto_741669 ) ) ( not ( = ?auto_741667 ?auto_741670 ) ) ( not ( = ?auto_741667 ?auto_741671 ) ) ( not ( = ?auto_741667 ?auto_741672 ) ) ( not ( = ?auto_741667 ?auto_741673 ) ) ( not ( = ?auto_741667 ?auto_741674 ) ) ( not ( = ?auto_741668 ?auto_741669 ) ) ( not ( = ?auto_741668 ?auto_741670 ) ) ( not ( = ?auto_741668 ?auto_741671 ) ) ( not ( = ?auto_741668 ?auto_741672 ) ) ( not ( = ?auto_741668 ?auto_741673 ) ) ( not ( = ?auto_741668 ?auto_741674 ) ) ( not ( = ?auto_741669 ?auto_741670 ) ) ( not ( = ?auto_741669 ?auto_741671 ) ) ( not ( = ?auto_741669 ?auto_741672 ) ) ( not ( = ?auto_741669 ?auto_741673 ) ) ( not ( = ?auto_741669 ?auto_741674 ) ) ( not ( = ?auto_741670 ?auto_741671 ) ) ( not ( = ?auto_741670 ?auto_741672 ) ) ( not ( = ?auto_741670 ?auto_741673 ) ) ( not ( = ?auto_741670 ?auto_741674 ) ) ( not ( = ?auto_741671 ?auto_741672 ) ) ( not ( = ?auto_741671 ?auto_741673 ) ) ( not ( = ?auto_741671 ?auto_741674 ) ) ( not ( = ?auto_741672 ?auto_741673 ) ) ( not ( = ?auto_741672 ?auto_741674 ) ) ( not ( = ?auto_741673 ?auto_741674 ) ) ( ON ?auto_741672 ?auto_741673 ) ( ON ?auto_741671 ?auto_741672 ) ( ON ?auto_741670 ?auto_741671 ) ( ON ?auto_741669 ?auto_741670 ) ( ON ?auto_741668 ?auto_741669 ) ( ON ?auto_741667 ?auto_741668 ) ( CLEAR ?auto_741665 ) ( ON ?auto_741666 ?auto_741667 ) ( CLEAR ?auto_741666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_741663 ?auto_741664 ?auto_741665 ?auto_741666 )
      ( MAKE-11PILE ?auto_741663 ?auto_741664 ?auto_741665 ?auto_741666 ?auto_741667 ?auto_741668 ?auto_741669 ?auto_741670 ?auto_741671 ?auto_741672 ?auto_741673 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_741709 - BLOCK
      ?auto_741710 - BLOCK
      ?auto_741711 - BLOCK
      ?auto_741712 - BLOCK
      ?auto_741713 - BLOCK
      ?auto_741714 - BLOCK
      ?auto_741715 - BLOCK
      ?auto_741716 - BLOCK
      ?auto_741717 - BLOCK
      ?auto_741718 - BLOCK
      ?auto_741719 - BLOCK
    )
    :vars
    (
      ?auto_741720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741719 ?auto_741720 ) ( ON-TABLE ?auto_741709 ) ( ON ?auto_741710 ?auto_741709 ) ( not ( = ?auto_741709 ?auto_741710 ) ) ( not ( = ?auto_741709 ?auto_741711 ) ) ( not ( = ?auto_741709 ?auto_741712 ) ) ( not ( = ?auto_741709 ?auto_741713 ) ) ( not ( = ?auto_741709 ?auto_741714 ) ) ( not ( = ?auto_741709 ?auto_741715 ) ) ( not ( = ?auto_741709 ?auto_741716 ) ) ( not ( = ?auto_741709 ?auto_741717 ) ) ( not ( = ?auto_741709 ?auto_741718 ) ) ( not ( = ?auto_741709 ?auto_741719 ) ) ( not ( = ?auto_741709 ?auto_741720 ) ) ( not ( = ?auto_741710 ?auto_741711 ) ) ( not ( = ?auto_741710 ?auto_741712 ) ) ( not ( = ?auto_741710 ?auto_741713 ) ) ( not ( = ?auto_741710 ?auto_741714 ) ) ( not ( = ?auto_741710 ?auto_741715 ) ) ( not ( = ?auto_741710 ?auto_741716 ) ) ( not ( = ?auto_741710 ?auto_741717 ) ) ( not ( = ?auto_741710 ?auto_741718 ) ) ( not ( = ?auto_741710 ?auto_741719 ) ) ( not ( = ?auto_741710 ?auto_741720 ) ) ( not ( = ?auto_741711 ?auto_741712 ) ) ( not ( = ?auto_741711 ?auto_741713 ) ) ( not ( = ?auto_741711 ?auto_741714 ) ) ( not ( = ?auto_741711 ?auto_741715 ) ) ( not ( = ?auto_741711 ?auto_741716 ) ) ( not ( = ?auto_741711 ?auto_741717 ) ) ( not ( = ?auto_741711 ?auto_741718 ) ) ( not ( = ?auto_741711 ?auto_741719 ) ) ( not ( = ?auto_741711 ?auto_741720 ) ) ( not ( = ?auto_741712 ?auto_741713 ) ) ( not ( = ?auto_741712 ?auto_741714 ) ) ( not ( = ?auto_741712 ?auto_741715 ) ) ( not ( = ?auto_741712 ?auto_741716 ) ) ( not ( = ?auto_741712 ?auto_741717 ) ) ( not ( = ?auto_741712 ?auto_741718 ) ) ( not ( = ?auto_741712 ?auto_741719 ) ) ( not ( = ?auto_741712 ?auto_741720 ) ) ( not ( = ?auto_741713 ?auto_741714 ) ) ( not ( = ?auto_741713 ?auto_741715 ) ) ( not ( = ?auto_741713 ?auto_741716 ) ) ( not ( = ?auto_741713 ?auto_741717 ) ) ( not ( = ?auto_741713 ?auto_741718 ) ) ( not ( = ?auto_741713 ?auto_741719 ) ) ( not ( = ?auto_741713 ?auto_741720 ) ) ( not ( = ?auto_741714 ?auto_741715 ) ) ( not ( = ?auto_741714 ?auto_741716 ) ) ( not ( = ?auto_741714 ?auto_741717 ) ) ( not ( = ?auto_741714 ?auto_741718 ) ) ( not ( = ?auto_741714 ?auto_741719 ) ) ( not ( = ?auto_741714 ?auto_741720 ) ) ( not ( = ?auto_741715 ?auto_741716 ) ) ( not ( = ?auto_741715 ?auto_741717 ) ) ( not ( = ?auto_741715 ?auto_741718 ) ) ( not ( = ?auto_741715 ?auto_741719 ) ) ( not ( = ?auto_741715 ?auto_741720 ) ) ( not ( = ?auto_741716 ?auto_741717 ) ) ( not ( = ?auto_741716 ?auto_741718 ) ) ( not ( = ?auto_741716 ?auto_741719 ) ) ( not ( = ?auto_741716 ?auto_741720 ) ) ( not ( = ?auto_741717 ?auto_741718 ) ) ( not ( = ?auto_741717 ?auto_741719 ) ) ( not ( = ?auto_741717 ?auto_741720 ) ) ( not ( = ?auto_741718 ?auto_741719 ) ) ( not ( = ?auto_741718 ?auto_741720 ) ) ( not ( = ?auto_741719 ?auto_741720 ) ) ( ON ?auto_741718 ?auto_741719 ) ( ON ?auto_741717 ?auto_741718 ) ( ON ?auto_741716 ?auto_741717 ) ( ON ?auto_741715 ?auto_741716 ) ( ON ?auto_741714 ?auto_741715 ) ( ON ?auto_741713 ?auto_741714 ) ( ON ?auto_741712 ?auto_741713 ) ( CLEAR ?auto_741710 ) ( ON ?auto_741711 ?auto_741712 ) ( CLEAR ?auto_741711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_741709 ?auto_741710 ?auto_741711 )
      ( MAKE-11PILE ?auto_741709 ?auto_741710 ?auto_741711 ?auto_741712 ?auto_741713 ?auto_741714 ?auto_741715 ?auto_741716 ?auto_741717 ?auto_741718 ?auto_741719 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_741755 - BLOCK
      ?auto_741756 - BLOCK
      ?auto_741757 - BLOCK
      ?auto_741758 - BLOCK
      ?auto_741759 - BLOCK
      ?auto_741760 - BLOCK
      ?auto_741761 - BLOCK
      ?auto_741762 - BLOCK
      ?auto_741763 - BLOCK
      ?auto_741764 - BLOCK
      ?auto_741765 - BLOCK
    )
    :vars
    (
      ?auto_741766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741765 ?auto_741766 ) ( ON-TABLE ?auto_741755 ) ( not ( = ?auto_741755 ?auto_741756 ) ) ( not ( = ?auto_741755 ?auto_741757 ) ) ( not ( = ?auto_741755 ?auto_741758 ) ) ( not ( = ?auto_741755 ?auto_741759 ) ) ( not ( = ?auto_741755 ?auto_741760 ) ) ( not ( = ?auto_741755 ?auto_741761 ) ) ( not ( = ?auto_741755 ?auto_741762 ) ) ( not ( = ?auto_741755 ?auto_741763 ) ) ( not ( = ?auto_741755 ?auto_741764 ) ) ( not ( = ?auto_741755 ?auto_741765 ) ) ( not ( = ?auto_741755 ?auto_741766 ) ) ( not ( = ?auto_741756 ?auto_741757 ) ) ( not ( = ?auto_741756 ?auto_741758 ) ) ( not ( = ?auto_741756 ?auto_741759 ) ) ( not ( = ?auto_741756 ?auto_741760 ) ) ( not ( = ?auto_741756 ?auto_741761 ) ) ( not ( = ?auto_741756 ?auto_741762 ) ) ( not ( = ?auto_741756 ?auto_741763 ) ) ( not ( = ?auto_741756 ?auto_741764 ) ) ( not ( = ?auto_741756 ?auto_741765 ) ) ( not ( = ?auto_741756 ?auto_741766 ) ) ( not ( = ?auto_741757 ?auto_741758 ) ) ( not ( = ?auto_741757 ?auto_741759 ) ) ( not ( = ?auto_741757 ?auto_741760 ) ) ( not ( = ?auto_741757 ?auto_741761 ) ) ( not ( = ?auto_741757 ?auto_741762 ) ) ( not ( = ?auto_741757 ?auto_741763 ) ) ( not ( = ?auto_741757 ?auto_741764 ) ) ( not ( = ?auto_741757 ?auto_741765 ) ) ( not ( = ?auto_741757 ?auto_741766 ) ) ( not ( = ?auto_741758 ?auto_741759 ) ) ( not ( = ?auto_741758 ?auto_741760 ) ) ( not ( = ?auto_741758 ?auto_741761 ) ) ( not ( = ?auto_741758 ?auto_741762 ) ) ( not ( = ?auto_741758 ?auto_741763 ) ) ( not ( = ?auto_741758 ?auto_741764 ) ) ( not ( = ?auto_741758 ?auto_741765 ) ) ( not ( = ?auto_741758 ?auto_741766 ) ) ( not ( = ?auto_741759 ?auto_741760 ) ) ( not ( = ?auto_741759 ?auto_741761 ) ) ( not ( = ?auto_741759 ?auto_741762 ) ) ( not ( = ?auto_741759 ?auto_741763 ) ) ( not ( = ?auto_741759 ?auto_741764 ) ) ( not ( = ?auto_741759 ?auto_741765 ) ) ( not ( = ?auto_741759 ?auto_741766 ) ) ( not ( = ?auto_741760 ?auto_741761 ) ) ( not ( = ?auto_741760 ?auto_741762 ) ) ( not ( = ?auto_741760 ?auto_741763 ) ) ( not ( = ?auto_741760 ?auto_741764 ) ) ( not ( = ?auto_741760 ?auto_741765 ) ) ( not ( = ?auto_741760 ?auto_741766 ) ) ( not ( = ?auto_741761 ?auto_741762 ) ) ( not ( = ?auto_741761 ?auto_741763 ) ) ( not ( = ?auto_741761 ?auto_741764 ) ) ( not ( = ?auto_741761 ?auto_741765 ) ) ( not ( = ?auto_741761 ?auto_741766 ) ) ( not ( = ?auto_741762 ?auto_741763 ) ) ( not ( = ?auto_741762 ?auto_741764 ) ) ( not ( = ?auto_741762 ?auto_741765 ) ) ( not ( = ?auto_741762 ?auto_741766 ) ) ( not ( = ?auto_741763 ?auto_741764 ) ) ( not ( = ?auto_741763 ?auto_741765 ) ) ( not ( = ?auto_741763 ?auto_741766 ) ) ( not ( = ?auto_741764 ?auto_741765 ) ) ( not ( = ?auto_741764 ?auto_741766 ) ) ( not ( = ?auto_741765 ?auto_741766 ) ) ( ON ?auto_741764 ?auto_741765 ) ( ON ?auto_741763 ?auto_741764 ) ( ON ?auto_741762 ?auto_741763 ) ( ON ?auto_741761 ?auto_741762 ) ( ON ?auto_741760 ?auto_741761 ) ( ON ?auto_741759 ?auto_741760 ) ( ON ?auto_741758 ?auto_741759 ) ( ON ?auto_741757 ?auto_741758 ) ( CLEAR ?auto_741755 ) ( ON ?auto_741756 ?auto_741757 ) ( CLEAR ?auto_741756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_741755 ?auto_741756 )
      ( MAKE-11PILE ?auto_741755 ?auto_741756 ?auto_741757 ?auto_741758 ?auto_741759 ?auto_741760 ?auto_741761 ?auto_741762 ?auto_741763 ?auto_741764 ?auto_741765 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_741801 - BLOCK
      ?auto_741802 - BLOCK
      ?auto_741803 - BLOCK
      ?auto_741804 - BLOCK
      ?auto_741805 - BLOCK
      ?auto_741806 - BLOCK
      ?auto_741807 - BLOCK
      ?auto_741808 - BLOCK
      ?auto_741809 - BLOCK
      ?auto_741810 - BLOCK
      ?auto_741811 - BLOCK
    )
    :vars
    (
      ?auto_741812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741811 ?auto_741812 ) ( not ( = ?auto_741801 ?auto_741802 ) ) ( not ( = ?auto_741801 ?auto_741803 ) ) ( not ( = ?auto_741801 ?auto_741804 ) ) ( not ( = ?auto_741801 ?auto_741805 ) ) ( not ( = ?auto_741801 ?auto_741806 ) ) ( not ( = ?auto_741801 ?auto_741807 ) ) ( not ( = ?auto_741801 ?auto_741808 ) ) ( not ( = ?auto_741801 ?auto_741809 ) ) ( not ( = ?auto_741801 ?auto_741810 ) ) ( not ( = ?auto_741801 ?auto_741811 ) ) ( not ( = ?auto_741801 ?auto_741812 ) ) ( not ( = ?auto_741802 ?auto_741803 ) ) ( not ( = ?auto_741802 ?auto_741804 ) ) ( not ( = ?auto_741802 ?auto_741805 ) ) ( not ( = ?auto_741802 ?auto_741806 ) ) ( not ( = ?auto_741802 ?auto_741807 ) ) ( not ( = ?auto_741802 ?auto_741808 ) ) ( not ( = ?auto_741802 ?auto_741809 ) ) ( not ( = ?auto_741802 ?auto_741810 ) ) ( not ( = ?auto_741802 ?auto_741811 ) ) ( not ( = ?auto_741802 ?auto_741812 ) ) ( not ( = ?auto_741803 ?auto_741804 ) ) ( not ( = ?auto_741803 ?auto_741805 ) ) ( not ( = ?auto_741803 ?auto_741806 ) ) ( not ( = ?auto_741803 ?auto_741807 ) ) ( not ( = ?auto_741803 ?auto_741808 ) ) ( not ( = ?auto_741803 ?auto_741809 ) ) ( not ( = ?auto_741803 ?auto_741810 ) ) ( not ( = ?auto_741803 ?auto_741811 ) ) ( not ( = ?auto_741803 ?auto_741812 ) ) ( not ( = ?auto_741804 ?auto_741805 ) ) ( not ( = ?auto_741804 ?auto_741806 ) ) ( not ( = ?auto_741804 ?auto_741807 ) ) ( not ( = ?auto_741804 ?auto_741808 ) ) ( not ( = ?auto_741804 ?auto_741809 ) ) ( not ( = ?auto_741804 ?auto_741810 ) ) ( not ( = ?auto_741804 ?auto_741811 ) ) ( not ( = ?auto_741804 ?auto_741812 ) ) ( not ( = ?auto_741805 ?auto_741806 ) ) ( not ( = ?auto_741805 ?auto_741807 ) ) ( not ( = ?auto_741805 ?auto_741808 ) ) ( not ( = ?auto_741805 ?auto_741809 ) ) ( not ( = ?auto_741805 ?auto_741810 ) ) ( not ( = ?auto_741805 ?auto_741811 ) ) ( not ( = ?auto_741805 ?auto_741812 ) ) ( not ( = ?auto_741806 ?auto_741807 ) ) ( not ( = ?auto_741806 ?auto_741808 ) ) ( not ( = ?auto_741806 ?auto_741809 ) ) ( not ( = ?auto_741806 ?auto_741810 ) ) ( not ( = ?auto_741806 ?auto_741811 ) ) ( not ( = ?auto_741806 ?auto_741812 ) ) ( not ( = ?auto_741807 ?auto_741808 ) ) ( not ( = ?auto_741807 ?auto_741809 ) ) ( not ( = ?auto_741807 ?auto_741810 ) ) ( not ( = ?auto_741807 ?auto_741811 ) ) ( not ( = ?auto_741807 ?auto_741812 ) ) ( not ( = ?auto_741808 ?auto_741809 ) ) ( not ( = ?auto_741808 ?auto_741810 ) ) ( not ( = ?auto_741808 ?auto_741811 ) ) ( not ( = ?auto_741808 ?auto_741812 ) ) ( not ( = ?auto_741809 ?auto_741810 ) ) ( not ( = ?auto_741809 ?auto_741811 ) ) ( not ( = ?auto_741809 ?auto_741812 ) ) ( not ( = ?auto_741810 ?auto_741811 ) ) ( not ( = ?auto_741810 ?auto_741812 ) ) ( not ( = ?auto_741811 ?auto_741812 ) ) ( ON ?auto_741810 ?auto_741811 ) ( ON ?auto_741809 ?auto_741810 ) ( ON ?auto_741808 ?auto_741809 ) ( ON ?auto_741807 ?auto_741808 ) ( ON ?auto_741806 ?auto_741807 ) ( ON ?auto_741805 ?auto_741806 ) ( ON ?auto_741804 ?auto_741805 ) ( ON ?auto_741803 ?auto_741804 ) ( ON ?auto_741802 ?auto_741803 ) ( ON ?auto_741801 ?auto_741802 ) ( CLEAR ?auto_741801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_741801 )
      ( MAKE-11PILE ?auto_741801 ?auto_741802 ?auto_741803 ?auto_741804 ?auto_741805 ?auto_741806 ?auto_741807 ?auto_741808 ?auto_741809 ?auto_741810 ?auto_741811 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_741848 - BLOCK
      ?auto_741849 - BLOCK
      ?auto_741850 - BLOCK
      ?auto_741851 - BLOCK
      ?auto_741852 - BLOCK
      ?auto_741853 - BLOCK
      ?auto_741854 - BLOCK
      ?auto_741855 - BLOCK
      ?auto_741856 - BLOCK
      ?auto_741857 - BLOCK
      ?auto_741858 - BLOCK
      ?auto_741859 - BLOCK
    )
    :vars
    (
      ?auto_741860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_741858 ) ( ON ?auto_741859 ?auto_741860 ) ( CLEAR ?auto_741859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_741848 ) ( ON ?auto_741849 ?auto_741848 ) ( ON ?auto_741850 ?auto_741849 ) ( ON ?auto_741851 ?auto_741850 ) ( ON ?auto_741852 ?auto_741851 ) ( ON ?auto_741853 ?auto_741852 ) ( ON ?auto_741854 ?auto_741853 ) ( ON ?auto_741855 ?auto_741854 ) ( ON ?auto_741856 ?auto_741855 ) ( ON ?auto_741857 ?auto_741856 ) ( ON ?auto_741858 ?auto_741857 ) ( not ( = ?auto_741848 ?auto_741849 ) ) ( not ( = ?auto_741848 ?auto_741850 ) ) ( not ( = ?auto_741848 ?auto_741851 ) ) ( not ( = ?auto_741848 ?auto_741852 ) ) ( not ( = ?auto_741848 ?auto_741853 ) ) ( not ( = ?auto_741848 ?auto_741854 ) ) ( not ( = ?auto_741848 ?auto_741855 ) ) ( not ( = ?auto_741848 ?auto_741856 ) ) ( not ( = ?auto_741848 ?auto_741857 ) ) ( not ( = ?auto_741848 ?auto_741858 ) ) ( not ( = ?auto_741848 ?auto_741859 ) ) ( not ( = ?auto_741848 ?auto_741860 ) ) ( not ( = ?auto_741849 ?auto_741850 ) ) ( not ( = ?auto_741849 ?auto_741851 ) ) ( not ( = ?auto_741849 ?auto_741852 ) ) ( not ( = ?auto_741849 ?auto_741853 ) ) ( not ( = ?auto_741849 ?auto_741854 ) ) ( not ( = ?auto_741849 ?auto_741855 ) ) ( not ( = ?auto_741849 ?auto_741856 ) ) ( not ( = ?auto_741849 ?auto_741857 ) ) ( not ( = ?auto_741849 ?auto_741858 ) ) ( not ( = ?auto_741849 ?auto_741859 ) ) ( not ( = ?auto_741849 ?auto_741860 ) ) ( not ( = ?auto_741850 ?auto_741851 ) ) ( not ( = ?auto_741850 ?auto_741852 ) ) ( not ( = ?auto_741850 ?auto_741853 ) ) ( not ( = ?auto_741850 ?auto_741854 ) ) ( not ( = ?auto_741850 ?auto_741855 ) ) ( not ( = ?auto_741850 ?auto_741856 ) ) ( not ( = ?auto_741850 ?auto_741857 ) ) ( not ( = ?auto_741850 ?auto_741858 ) ) ( not ( = ?auto_741850 ?auto_741859 ) ) ( not ( = ?auto_741850 ?auto_741860 ) ) ( not ( = ?auto_741851 ?auto_741852 ) ) ( not ( = ?auto_741851 ?auto_741853 ) ) ( not ( = ?auto_741851 ?auto_741854 ) ) ( not ( = ?auto_741851 ?auto_741855 ) ) ( not ( = ?auto_741851 ?auto_741856 ) ) ( not ( = ?auto_741851 ?auto_741857 ) ) ( not ( = ?auto_741851 ?auto_741858 ) ) ( not ( = ?auto_741851 ?auto_741859 ) ) ( not ( = ?auto_741851 ?auto_741860 ) ) ( not ( = ?auto_741852 ?auto_741853 ) ) ( not ( = ?auto_741852 ?auto_741854 ) ) ( not ( = ?auto_741852 ?auto_741855 ) ) ( not ( = ?auto_741852 ?auto_741856 ) ) ( not ( = ?auto_741852 ?auto_741857 ) ) ( not ( = ?auto_741852 ?auto_741858 ) ) ( not ( = ?auto_741852 ?auto_741859 ) ) ( not ( = ?auto_741852 ?auto_741860 ) ) ( not ( = ?auto_741853 ?auto_741854 ) ) ( not ( = ?auto_741853 ?auto_741855 ) ) ( not ( = ?auto_741853 ?auto_741856 ) ) ( not ( = ?auto_741853 ?auto_741857 ) ) ( not ( = ?auto_741853 ?auto_741858 ) ) ( not ( = ?auto_741853 ?auto_741859 ) ) ( not ( = ?auto_741853 ?auto_741860 ) ) ( not ( = ?auto_741854 ?auto_741855 ) ) ( not ( = ?auto_741854 ?auto_741856 ) ) ( not ( = ?auto_741854 ?auto_741857 ) ) ( not ( = ?auto_741854 ?auto_741858 ) ) ( not ( = ?auto_741854 ?auto_741859 ) ) ( not ( = ?auto_741854 ?auto_741860 ) ) ( not ( = ?auto_741855 ?auto_741856 ) ) ( not ( = ?auto_741855 ?auto_741857 ) ) ( not ( = ?auto_741855 ?auto_741858 ) ) ( not ( = ?auto_741855 ?auto_741859 ) ) ( not ( = ?auto_741855 ?auto_741860 ) ) ( not ( = ?auto_741856 ?auto_741857 ) ) ( not ( = ?auto_741856 ?auto_741858 ) ) ( not ( = ?auto_741856 ?auto_741859 ) ) ( not ( = ?auto_741856 ?auto_741860 ) ) ( not ( = ?auto_741857 ?auto_741858 ) ) ( not ( = ?auto_741857 ?auto_741859 ) ) ( not ( = ?auto_741857 ?auto_741860 ) ) ( not ( = ?auto_741858 ?auto_741859 ) ) ( not ( = ?auto_741858 ?auto_741860 ) ) ( not ( = ?auto_741859 ?auto_741860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_741859 ?auto_741860 )
      ( !STACK ?auto_741859 ?auto_741858 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_741898 - BLOCK
      ?auto_741899 - BLOCK
      ?auto_741900 - BLOCK
      ?auto_741901 - BLOCK
      ?auto_741902 - BLOCK
      ?auto_741903 - BLOCK
      ?auto_741904 - BLOCK
      ?auto_741905 - BLOCK
      ?auto_741906 - BLOCK
      ?auto_741907 - BLOCK
      ?auto_741908 - BLOCK
      ?auto_741909 - BLOCK
    )
    :vars
    (
      ?auto_741910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741909 ?auto_741910 ) ( ON-TABLE ?auto_741898 ) ( ON ?auto_741899 ?auto_741898 ) ( ON ?auto_741900 ?auto_741899 ) ( ON ?auto_741901 ?auto_741900 ) ( ON ?auto_741902 ?auto_741901 ) ( ON ?auto_741903 ?auto_741902 ) ( ON ?auto_741904 ?auto_741903 ) ( ON ?auto_741905 ?auto_741904 ) ( ON ?auto_741906 ?auto_741905 ) ( ON ?auto_741907 ?auto_741906 ) ( not ( = ?auto_741898 ?auto_741899 ) ) ( not ( = ?auto_741898 ?auto_741900 ) ) ( not ( = ?auto_741898 ?auto_741901 ) ) ( not ( = ?auto_741898 ?auto_741902 ) ) ( not ( = ?auto_741898 ?auto_741903 ) ) ( not ( = ?auto_741898 ?auto_741904 ) ) ( not ( = ?auto_741898 ?auto_741905 ) ) ( not ( = ?auto_741898 ?auto_741906 ) ) ( not ( = ?auto_741898 ?auto_741907 ) ) ( not ( = ?auto_741898 ?auto_741908 ) ) ( not ( = ?auto_741898 ?auto_741909 ) ) ( not ( = ?auto_741898 ?auto_741910 ) ) ( not ( = ?auto_741899 ?auto_741900 ) ) ( not ( = ?auto_741899 ?auto_741901 ) ) ( not ( = ?auto_741899 ?auto_741902 ) ) ( not ( = ?auto_741899 ?auto_741903 ) ) ( not ( = ?auto_741899 ?auto_741904 ) ) ( not ( = ?auto_741899 ?auto_741905 ) ) ( not ( = ?auto_741899 ?auto_741906 ) ) ( not ( = ?auto_741899 ?auto_741907 ) ) ( not ( = ?auto_741899 ?auto_741908 ) ) ( not ( = ?auto_741899 ?auto_741909 ) ) ( not ( = ?auto_741899 ?auto_741910 ) ) ( not ( = ?auto_741900 ?auto_741901 ) ) ( not ( = ?auto_741900 ?auto_741902 ) ) ( not ( = ?auto_741900 ?auto_741903 ) ) ( not ( = ?auto_741900 ?auto_741904 ) ) ( not ( = ?auto_741900 ?auto_741905 ) ) ( not ( = ?auto_741900 ?auto_741906 ) ) ( not ( = ?auto_741900 ?auto_741907 ) ) ( not ( = ?auto_741900 ?auto_741908 ) ) ( not ( = ?auto_741900 ?auto_741909 ) ) ( not ( = ?auto_741900 ?auto_741910 ) ) ( not ( = ?auto_741901 ?auto_741902 ) ) ( not ( = ?auto_741901 ?auto_741903 ) ) ( not ( = ?auto_741901 ?auto_741904 ) ) ( not ( = ?auto_741901 ?auto_741905 ) ) ( not ( = ?auto_741901 ?auto_741906 ) ) ( not ( = ?auto_741901 ?auto_741907 ) ) ( not ( = ?auto_741901 ?auto_741908 ) ) ( not ( = ?auto_741901 ?auto_741909 ) ) ( not ( = ?auto_741901 ?auto_741910 ) ) ( not ( = ?auto_741902 ?auto_741903 ) ) ( not ( = ?auto_741902 ?auto_741904 ) ) ( not ( = ?auto_741902 ?auto_741905 ) ) ( not ( = ?auto_741902 ?auto_741906 ) ) ( not ( = ?auto_741902 ?auto_741907 ) ) ( not ( = ?auto_741902 ?auto_741908 ) ) ( not ( = ?auto_741902 ?auto_741909 ) ) ( not ( = ?auto_741902 ?auto_741910 ) ) ( not ( = ?auto_741903 ?auto_741904 ) ) ( not ( = ?auto_741903 ?auto_741905 ) ) ( not ( = ?auto_741903 ?auto_741906 ) ) ( not ( = ?auto_741903 ?auto_741907 ) ) ( not ( = ?auto_741903 ?auto_741908 ) ) ( not ( = ?auto_741903 ?auto_741909 ) ) ( not ( = ?auto_741903 ?auto_741910 ) ) ( not ( = ?auto_741904 ?auto_741905 ) ) ( not ( = ?auto_741904 ?auto_741906 ) ) ( not ( = ?auto_741904 ?auto_741907 ) ) ( not ( = ?auto_741904 ?auto_741908 ) ) ( not ( = ?auto_741904 ?auto_741909 ) ) ( not ( = ?auto_741904 ?auto_741910 ) ) ( not ( = ?auto_741905 ?auto_741906 ) ) ( not ( = ?auto_741905 ?auto_741907 ) ) ( not ( = ?auto_741905 ?auto_741908 ) ) ( not ( = ?auto_741905 ?auto_741909 ) ) ( not ( = ?auto_741905 ?auto_741910 ) ) ( not ( = ?auto_741906 ?auto_741907 ) ) ( not ( = ?auto_741906 ?auto_741908 ) ) ( not ( = ?auto_741906 ?auto_741909 ) ) ( not ( = ?auto_741906 ?auto_741910 ) ) ( not ( = ?auto_741907 ?auto_741908 ) ) ( not ( = ?auto_741907 ?auto_741909 ) ) ( not ( = ?auto_741907 ?auto_741910 ) ) ( not ( = ?auto_741908 ?auto_741909 ) ) ( not ( = ?auto_741908 ?auto_741910 ) ) ( not ( = ?auto_741909 ?auto_741910 ) ) ( CLEAR ?auto_741907 ) ( ON ?auto_741908 ?auto_741909 ) ( CLEAR ?auto_741908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_741898 ?auto_741899 ?auto_741900 ?auto_741901 ?auto_741902 ?auto_741903 ?auto_741904 ?auto_741905 ?auto_741906 ?auto_741907 ?auto_741908 )
      ( MAKE-12PILE ?auto_741898 ?auto_741899 ?auto_741900 ?auto_741901 ?auto_741902 ?auto_741903 ?auto_741904 ?auto_741905 ?auto_741906 ?auto_741907 ?auto_741908 ?auto_741909 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_741948 - BLOCK
      ?auto_741949 - BLOCK
      ?auto_741950 - BLOCK
      ?auto_741951 - BLOCK
      ?auto_741952 - BLOCK
      ?auto_741953 - BLOCK
      ?auto_741954 - BLOCK
      ?auto_741955 - BLOCK
      ?auto_741956 - BLOCK
      ?auto_741957 - BLOCK
      ?auto_741958 - BLOCK
      ?auto_741959 - BLOCK
    )
    :vars
    (
      ?auto_741960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_741959 ?auto_741960 ) ( ON-TABLE ?auto_741948 ) ( ON ?auto_741949 ?auto_741948 ) ( ON ?auto_741950 ?auto_741949 ) ( ON ?auto_741951 ?auto_741950 ) ( ON ?auto_741952 ?auto_741951 ) ( ON ?auto_741953 ?auto_741952 ) ( ON ?auto_741954 ?auto_741953 ) ( ON ?auto_741955 ?auto_741954 ) ( ON ?auto_741956 ?auto_741955 ) ( not ( = ?auto_741948 ?auto_741949 ) ) ( not ( = ?auto_741948 ?auto_741950 ) ) ( not ( = ?auto_741948 ?auto_741951 ) ) ( not ( = ?auto_741948 ?auto_741952 ) ) ( not ( = ?auto_741948 ?auto_741953 ) ) ( not ( = ?auto_741948 ?auto_741954 ) ) ( not ( = ?auto_741948 ?auto_741955 ) ) ( not ( = ?auto_741948 ?auto_741956 ) ) ( not ( = ?auto_741948 ?auto_741957 ) ) ( not ( = ?auto_741948 ?auto_741958 ) ) ( not ( = ?auto_741948 ?auto_741959 ) ) ( not ( = ?auto_741948 ?auto_741960 ) ) ( not ( = ?auto_741949 ?auto_741950 ) ) ( not ( = ?auto_741949 ?auto_741951 ) ) ( not ( = ?auto_741949 ?auto_741952 ) ) ( not ( = ?auto_741949 ?auto_741953 ) ) ( not ( = ?auto_741949 ?auto_741954 ) ) ( not ( = ?auto_741949 ?auto_741955 ) ) ( not ( = ?auto_741949 ?auto_741956 ) ) ( not ( = ?auto_741949 ?auto_741957 ) ) ( not ( = ?auto_741949 ?auto_741958 ) ) ( not ( = ?auto_741949 ?auto_741959 ) ) ( not ( = ?auto_741949 ?auto_741960 ) ) ( not ( = ?auto_741950 ?auto_741951 ) ) ( not ( = ?auto_741950 ?auto_741952 ) ) ( not ( = ?auto_741950 ?auto_741953 ) ) ( not ( = ?auto_741950 ?auto_741954 ) ) ( not ( = ?auto_741950 ?auto_741955 ) ) ( not ( = ?auto_741950 ?auto_741956 ) ) ( not ( = ?auto_741950 ?auto_741957 ) ) ( not ( = ?auto_741950 ?auto_741958 ) ) ( not ( = ?auto_741950 ?auto_741959 ) ) ( not ( = ?auto_741950 ?auto_741960 ) ) ( not ( = ?auto_741951 ?auto_741952 ) ) ( not ( = ?auto_741951 ?auto_741953 ) ) ( not ( = ?auto_741951 ?auto_741954 ) ) ( not ( = ?auto_741951 ?auto_741955 ) ) ( not ( = ?auto_741951 ?auto_741956 ) ) ( not ( = ?auto_741951 ?auto_741957 ) ) ( not ( = ?auto_741951 ?auto_741958 ) ) ( not ( = ?auto_741951 ?auto_741959 ) ) ( not ( = ?auto_741951 ?auto_741960 ) ) ( not ( = ?auto_741952 ?auto_741953 ) ) ( not ( = ?auto_741952 ?auto_741954 ) ) ( not ( = ?auto_741952 ?auto_741955 ) ) ( not ( = ?auto_741952 ?auto_741956 ) ) ( not ( = ?auto_741952 ?auto_741957 ) ) ( not ( = ?auto_741952 ?auto_741958 ) ) ( not ( = ?auto_741952 ?auto_741959 ) ) ( not ( = ?auto_741952 ?auto_741960 ) ) ( not ( = ?auto_741953 ?auto_741954 ) ) ( not ( = ?auto_741953 ?auto_741955 ) ) ( not ( = ?auto_741953 ?auto_741956 ) ) ( not ( = ?auto_741953 ?auto_741957 ) ) ( not ( = ?auto_741953 ?auto_741958 ) ) ( not ( = ?auto_741953 ?auto_741959 ) ) ( not ( = ?auto_741953 ?auto_741960 ) ) ( not ( = ?auto_741954 ?auto_741955 ) ) ( not ( = ?auto_741954 ?auto_741956 ) ) ( not ( = ?auto_741954 ?auto_741957 ) ) ( not ( = ?auto_741954 ?auto_741958 ) ) ( not ( = ?auto_741954 ?auto_741959 ) ) ( not ( = ?auto_741954 ?auto_741960 ) ) ( not ( = ?auto_741955 ?auto_741956 ) ) ( not ( = ?auto_741955 ?auto_741957 ) ) ( not ( = ?auto_741955 ?auto_741958 ) ) ( not ( = ?auto_741955 ?auto_741959 ) ) ( not ( = ?auto_741955 ?auto_741960 ) ) ( not ( = ?auto_741956 ?auto_741957 ) ) ( not ( = ?auto_741956 ?auto_741958 ) ) ( not ( = ?auto_741956 ?auto_741959 ) ) ( not ( = ?auto_741956 ?auto_741960 ) ) ( not ( = ?auto_741957 ?auto_741958 ) ) ( not ( = ?auto_741957 ?auto_741959 ) ) ( not ( = ?auto_741957 ?auto_741960 ) ) ( not ( = ?auto_741958 ?auto_741959 ) ) ( not ( = ?auto_741958 ?auto_741960 ) ) ( not ( = ?auto_741959 ?auto_741960 ) ) ( ON ?auto_741958 ?auto_741959 ) ( CLEAR ?auto_741956 ) ( ON ?auto_741957 ?auto_741958 ) ( CLEAR ?auto_741957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_741948 ?auto_741949 ?auto_741950 ?auto_741951 ?auto_741952 ?auto_741953 ?auto_741954 ?auto_741955 ?auto_741956 ?auto_741957 )
      ( MAKE-12PILE ?auto_741948 ?auto_741949 ?auto_741950 ?auto_741951 ?auto_741952 ?auto_741953 ?auto_741954 ?auto_741955 ?auto_741956 ?auto_741957 ?auto_741958 ?auto_741959 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_741998 - BLOCK
      ?auto_741999 - BLOCK
      ?auto_742000 - BLOCK
      ?auto_742001 - BLOCK
      ?auto_742002 - BLOCK
      ?auto_742003 - BLOCK
      ?auto_742004 - BLOCK
      ?auto_742005 - BLOCK
      ?auto_742006 - BLOCK
      ?auto_742007 - BLOCK
      ?auto_742008 - BLOCK
      ?auto_742009 - BLOCK
    )
    :vars
    (
      ?auto_742010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742009 ?auto_742010 ) ( ON-TABLE ?auto_741998 ) ( ON ?auto_741999 ?auto_741998 ) ( ON ?auto_742000 ?auto_741999 ) ( ON ?auto_742001 ?auto_742000 ) ( ON ?auto_742002 ?auto_742001 ) ( ON ?auto_742003 ?auto_742002 ) ( ON ?auto_742004 ?auto_742003 ) ( ON ?auto_742005 ?auto_742004 ) ( not ( = ?auto_741998 ?auto_741999 ) ) ( not ( = ?auto_741998 ?auto_742000 ) ) ( not ( = ?auto_741998 ?auto_742001 ) ) ( not ( = ?auto_741998 ?auto_742002 ) ) ( not ( = ?auto_741998 ?auto_742003 ) ) ( not ( = ?auto_741998 ?auto_742004 ) ) ( not ( = ?auto_741998 ?auto_742005 ) ) ( not ( = ?auto_741998 ?auto_742006 ) ) ( not ( = ?auto_741998 ?auto_742007 ) ) ( not ( = ?auto_741998 ?auto_742008 ) ) ( not ( = ?auto_741998 ?auto_742009 ) ) ( not ( = ?auto_741998 ?auto_742010 ) ) ( not ( = ?auto_741999 ?auto_742000 ) ) ( not ( = ?auto_741999 ?auto_742001 ) ) ( not ( = ?auto_741999 ?auto_742002 ) ) ( not ( = ?auto_741999 ?auto_742003 ) ) ( not ( = ?auto_741999 ?auto_742004 ) ) ( not ( = ?auto_741999 ?auto_742005 ) ) ( not ( = ?auto_741999 ?auto_742006 ) ) ( not ( = ?auto_741999 ?auto_742007 ) ) ( not ( = ?auto_741999 ?auto_742008 ) ) ( not ( = ?auto_741999 ?auto_742009 ) ) ( not ( = ?auto_741999 ?auto_742010 ) ) ( not ( = ?auto_742000 ?auto_742001 ) ) ( not ( = ?auto_742000 ?auto_742002 ) ) ( not ( = ?auto_742000 ?auto_742003 ) ) ( not ( = ?auto_742000 ?auto_742004 ) ) ( not ( = ?auto_742000 ?auto_742005 ) ) ( not ( = ?auto_742000 ?auto_742006 ) ) ( not ( = ?auto_742000 ?auto_742007 ) ) ( not ( = ?auto_742000 ?auto_742008 ) ) ( not ( = ?auto_742000 ?auto_742009 ) ) ( not ( = ?auto_742000 ?auto_742010 ) ) ( not ( = ?auto_742001 ?auto_742002 ) ) ( not ( = ?auto_742001 ?auto_742003 ) ) ( not ( = ?auto_742001 ?auto_742004 ) ) ( not ( = ?auto_742001 ?auto_742005 ) ) ( not ( = ?auto_742001 ?auto_742006 ) ) ( not ( = ?auto_742001 ?auto_742007 ) ) ( not ( = ?auto_742001 ?auto_742008 ) ) ( not ( = ?auto_742001 ?auto_742009 ) ) ( not ( = ?auto_742001 ?auto_742010 ) ) ( not ( = ?auto_742002 ?auto_742003 ) ) ( not ( = ?auto_742002 ?auto_742004 ) ) ( not ( = ?auto_742002 ?auto_742005 ) ) ( not ( = ?auto_742002 ?auto_742006 ) ) ( not ( = ?auto_742002 ?auto_742007 ) ) ( not ( = ?auto_742002 ?auto_742008 ) ) ( not ( = ?auto_742002 ?auto_742009 ) ) ( not ( = ?auto_742002 ?auto_742010 ) ) ( not ( = ?auto_742003 ?auto_742004 ) ) ( not ( = ?auto_742003 ?auto_742005 ) ) ( not ( = ?auto_742003 ?auto_742006 ) ) ( not ( = ?auto_742003 ?auto_742007 ) ) ( not ( = ?auto_742003 ?auto_742008 ) ) ( not ( = ?auto_742003 ?auto_742009 ) ) ( not ( = ?auto_742003 ?auto_742010 ) ) ( not ( = ?auto_742004 ?auto_742005 ) ) ( not ( = ?auto_742004 ?auto_742006 ) ) ( not ( = ?auto_742004 ?auto_742007 ) ) ( not ( = ?auto_742004 ?auto_742008 ) ) ( not ( = ?auto_742004 ?auto_742009 ) ) ( not ( = ?auto_742004 ?auto_742010 ) ) ( not ( = ?auto_742005 ?auto_742006 ) ) ( not ( = ?auto_742005 ?auto_742007 ) ) ( not ( = ?auto_742005 ?auto_742008 ) ) ( not ( = ?auto_742005 ?auto_742009 ) ) ( not ( = ?auto_742005 ?auto_742010 ) ) ( not ( = ?auto_742006 ?auto_742007 ) ) ( not ( = ?auto_742006 ?auto_742008 ) ) ( not ( = ?auto_742006 ?auto_742009 ) ) ( not ( = ?auto_742006 ?auto_742010 ) ) ( not ( = ?auto_742007 ?auto_742008 ) ) ( not ( = ?auto_742007 ?auto_742009 ) ) ( not ( = ?auto_742007 ?auto_742010 ) ) ( not ( = ?auto_742008 ?auto_742009 ) ) ( not ( = ?auto_742008 ?auto_742010 ) ) ( not ( = ?auto_742009 ?auto_742010 ) ) ( ON ?auto_742008 ?auto_742009 ) ( ON ?auto_742007 ?auto_742008 ) ( CLEAR ?auto_742005 ) ( ON ?auto_742006 ?auto_742007 ) ( CLEAR ?auto_742006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_741998 ?auto_741999 ?auto_742000 ?auto_742001 ?auto_742002 ?auto_742003 ?auto_742004 ?auto_742005 ?auto_742006 )
      ( MAKE-12PILE ?auto_741998 ?auto_741999 ?auto_742000 ?auto_742001 ?auto_742002 ?auto_742003 ?auto_742004 ?auto_742005 ?auto_742006 ?auto_742007 ?auto_742008 ?auto_742009 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_742048 - BLOCK
      ?auto_742049 - BLOCK
      ?auto_742050 - BLOCK
      ?auto_742051 - BLOCK
      ?auto_742052 - BLOCK
      ?auto_742053 - BLOCK
      ?auto_742054 - BLOCK
      ?auto_742055 - BLOCK
      ?auto_742056 - BLOCK
      ?auto_742057 - BLOCK
      ?auto_742058 - BLOCK
      ?auto_742059 - BLOCK
    )
    :vars
    (
      ?auto_742060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742059 ?auto_742060 ) ( ON-TABLE ?auto_742048 ) ( ON ?auto_742049 ?auto_742048 ) ( ON ?auto_742050 ?auto_742049 ) ( ON ?auto_742051 ?auto_742050 ) ( ON ?auto_742052 ?auto_742051 ) ( ON ?auto_742053 ?auto_742052 ) ( ON ?auto_742054 ?auto_742053 ) ( not ( = ?auto_742048 ?auto_742049 ) ) ( not ( = ?auto_742048 ?auto_742050 ) ) ( not ( = ?auto_742048 ?auto_742051 ) ) ( not ( = ?auto_742048 ?auto_742052 ) ) ( not ( = ?auto_742048 ?auto_742053 ) ) ( not ( = ?auto_742048 ?auto_742054 ) ) ( not ( = ?auto_742048 ?auto_742055 ) ) ( not ( = ?auto_742048 ?auto_742056 ) ) ( not ( = ?auto_742048 ?auto_742057 ) ) ( not ( = ?auto_742048 ?auto_742058 ) ) ( not ( = ?auto_742048 ?auto_742059 ) ) ( not ( = ?auto_742048 ?auto_742060 ) ) ( not ( = ?auto_742049 ?auto_742050 ) ) ( not ( = ?auto_742049 ?auto_742051 ) ) ( not ( = ?auto_742049 ?auto_742052 ) ) ( not ( = ?auto_742049 ?auto_742053 ) ) ( not ( = ?auto_742049 ?auto_742054 ) ) ( not ( = ?auto_742049 ?auto_742055 ) ) ( not ( = ?auto_742049 ?auto_742056 ) ) ( not ( = ?auto_742049 ?auto_742057 ) ) ( not ( = ?auto_742049 ?auto_742058 ) ) ( not ( = ?auto_742049 ?auto_742059 ) ) ( not ( = ?auto_742049 ?auto_742060 ) ) ( not ( = ?auto_742050 ?auto_742051 ) ) ( not ( = ?auto_742050 ?auto_742052 ) ) ( not ( = ?auto_742050 ?auto_742053 ) ) ( not ( = ?auto_742050 ?auto_742054 ) ) ( not ( = ?auto_742050 ?auto_742055 ) ) ( not ( = ?auto_742050 ?auto_742056 ) ) ( not ( = ?auto_742050 ?auto_742057 ) ) ( not ( = ?auto_742050 ?auto_742058 ) ) ( not ( = ?auto_742050 ?auto_742059 ) ) ( not ( = ?auto_742050 ?auto_742060 ) ) ( not ( = ?auto_742051 ?auto_742052 ) ) ( not ( = ?auto_742051 ?auto_742053 ) ) ( not ( = ?auto_742051 ?auto_742054 ) ) ( not ( = ?auto_742051 ?auto_742055 ) ) ( not ( = ?auto_742051 ?auto_742056 ) ) ( not ( = ?auto_742051 ?auto_742057 ) ) ( not ( = ?auto_742051 ?auto_742058 ) ) ( not ( = ?auto_742051 ?auto_742059 ) ) ( not ( = ?auto_742051 ?auto_742060 ) ) ( not ( = ?auto_742052 ?auto_742053 ) ) ( not ( = ?auto_742052 ?auto_742054 ) ) ( not ( = ?auto_742052 ?auto_742055 ) ) ( not ( = ?auto_742052 ?auto_742056 ) ) ( not ( = ?auto_742052 ?auto_742057 ) ) ( not ( = ?auto_742052 ?auto_742058 ) ) ( not ( = ?auto_742052 ?auto_742059 ) ) ( not ( = ?auto_742052 ?auto_742060 ) ) ( not ( = ?auto_742053 ?auto_742054 ) ) ( not ( = ?auto_742053 ?auto_742055 ) ) ( not ( = ?auto_742053 ?auto_742056 ) ) ( not ( = ?auto_742053 ?auto_742057 ) ) ( not ( = ?auto_742053 ?auto_742058 ) ) ( not ( = ?auto_742053 ?auto_742059 ) ) ( not ( = ?auto_742053 ?auto_742060 ) ) ( not ( = ?auto_742054 ?auto_742055 ) ) ( not ( = ?auto_742054 ?auto_742056 ) ) ( not ( = ?auto_742054 ?auto_742057 ) ) ( not ( = ?auto_742054 ?auto_742058 ) ) ( not ( = ?auto_742054 ?auto_742059 ) ) ( not ( = ?auto_742054 ?auto_742060 ) ) ( not ( = ?auto_742055 ?auto_742056 ) ) ( not ( = ?auto_742055 ?auto_742057 ) ) ( not ( = ?auto_742055 ?auto_742058 ) ) ( not ( = ?auto_742055 ?auto_742059 ) ) ( not ( = ?auto_742055 ?auto_742060 ) ) ( not ( = ?auto_742056 ?auto_742057 ) ) ( not ( = ?auto_742056 ?auto_742058 ) ) ( not ( = ?auto_742056 ?auto_742059 ) ) ( not ( = ?auto_742056 ?auto_742060 ) ) ( not ( = ?auto_742057 ?auto_742058 ) ) ( not ( = ?auto_742057 ?auto_742059 ) ) ( not ( = ?auto_742057 ?auto_742060 ) ) ( not ( = ?auto_742058 ?auto_742059 ) ) ( not ( = ?auto_742058 ?auto_742060 ) ) ( not ( = ?auto_742059 ?auto_742060 ) ) ( ON ?auto_742058 ?auto_742059 ) ( ON ?auto_742057 ?auto_742058 ) ( ON ?auto_742056 ?auto_742057 ) ( CLEAR ?auto_742054 ) ( ON ?auto_742055 ?auto_742056 ) ( CLEAR ?auto_742055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_742048 ?auto_742049 ?auto_742050 ?auto_742051 ?auto_742052 ?auto_742053 ?auto_742054 ?auto_742055 )
      ( MAKE-12PILE ?auto_742048 ?auto_742049 ?auto_742050 ?auto_742051 ?auto_742052 ?auto_742053 ?auto_742054 ?auto_742055 ?auto_742056 ?auto_742057 ?auto_742058 ?auto_742059 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_742098 - BLOCK
      ?auto_742099 - BLOCK
      ?auto_742100 - BLOCK
      ?auto_742101 - BLOCK
      ?auto_742102 - BLOCK
      ?auto_742103 - BLOCK
      ?auto_742104 - BLOCK
      ?auto_742105 - BLOCK
      ?auto_742106 - BLOCK
      ?auto_742107 - BLOCK
      ?auto_742108 - BLOCK
      ?auto_742109 - BLOCK
    )
    :vars
    (
      ?auto_742110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742109 ?auto_742110 ) ( ON-TABLE ?auto_742098 ) ( ON ?auto_742099 ?auto_742098 ) ( ON ?auto_742100 ?auto_742099 ) ( ON ?auto_742101 ?auto_742100 ) ( ON ?auto_742102 ?auto_742101 ) ( ON ?auto_742103 ?auto_742102 ) ( not ( = ?auto_742098 ?auto_742099 ) ) ( not ( = ?auto_742098 ?auto_742100 ) ) ( not ( = ?auto_742098 ?auto_742101 ) ) ( not ( = ?auto_742098 ?auto_742102 ) ) ( not ( = ?auto_742098 ?auto_742103 ) ) ( not ( = ?auto_742098 ?auto_742104 ) ) ( not ( = ?auto_742098 ?auto_742105 ) ) ( not ( = ?auto_742098 ?auto_742106 ) ) ( not ( = ?auto_742098 ?auto_742107 ) ) ( not ( = ?auto_742098 ?auto_742108 ) ) ( not ( = ?auto_742098 ?auto_742109 ) ) ( not ( = ?auto_742098 ?auto_742110 ) ) ( not ( = ?auto_742099 ?auto_742100 ) ) ( not ( = ?auto_742099 ?auto_742101 ) ) ( not ( = ?auto_742099 ?auto_742102 ) ) ( not ( = ?auto_742099 ?auto_742103 ) ) ( not ( = ?auto_742099 ?auto_742104 ) ) ( not ( = ?auto_742099 ?auto_742105 ) ) ( not ( = ?auto_742099 ?auto_742106 ) ) ( not ( = ?auto_742099 ?auto_742107 ) ) ( not ( = ?auto_742099 ?auto_742108 ) ) ( not ( = ?auto_742099 ?auto_742109 ) ) ( not ( = ?auto_742099 ?auto_742110 ) ) ( not ( = ?auto_742100 ?auto_742101 ) ) ( not ( = ?auto_742100 ?auto_742102 ) ) ( not ( = ?auto_742100 ?auto_742103 ) ) ( not ( = ?auto_742100 ?auto_742104 ) ) ( not ( = ?auto_742100 ?auto_742105 ) ) ( not ( = ?auto_742100 ?auto_742106 ) ) ( not ( = ?auto_742100 ?auto_742107 ) ) ( not ( = ?auto_742100 ?auto_742108 ) ) ( not ( = ?auto_742100 ?auto_742109 ) ) ( not ( = ?auto_742100 ?auto_742110 ) ) ( not ( = ?auto_742101 ?auto_742102 ) ) ( not ( = ?auto_742101 ?auto_742103 ) ) ( not ( = ?auto_742101 ?auto_742104 ) ) ( not ( = ?auto_742101 ?auto_742105 ) ) ( not ( = ?auto_742101 ?auto_742106 ) ) ( not ( = ?auto_742101 ?auto_742107 ) ) ( not ( = ?auto_742101 ?auto_742108 ) ) ( not ( = ?auto_742101 ?auto_742109 ) ) ( not ( = ?auto_742101 ?auto_742110 ) ) ( not ( = ?auto_742102 ?auto_742103 ) ) ( not ( = ?auto_742102 ?auto_742104 ) ) ( not ( = ?auto_742102 ?auto_742105 ) ) ( not ( = ?auto_742102 ?auto_742106 ) ) ( not ( = ?auto_742102 ?auto_742107 ) ) ( not ( = ?auto_742102 ?auto_742108 ) ) ( not ( = ?auto_742102 ?auto_742109 ) ) ( not ( = ?auto_742102 ?auto_742110 ) ) ( not ( = ?auto_742103 ?auto_742104 ) ) ( not ( = ?auto_742103 ?auto_742105 ) ) ( not ( = ?auto_742103 ?auto_742106 ) ) ( not ( = ?auto_742103 ?auto_742107 ) ) ( not ( = ?auto_742103 ?auto_742108 ) ) ( not ( = ?auto_742103 ?auto_742109 ) ) ( not ( = ?auto_742103 ?auto_742110 ) ) ( not ( = ?auto_742104 ?auto_742105 ) ) ( not ( = ?auto_742104 ?auto_742106 ) ) ( not ( = ?auto_742104 ?auto_742107 ) ) ( not ( = ?auto_742104 ?auto_742108 ) ) ( not ( = ?auto_742104 ?auto_742109 ) ) ( not ( = ?auto_742104 ?auto_742110 ) ) ( not ( = ?auto_742105 ?auto_742106 ) ) ( not ( = ?auto_742105 ?auto_742107 ) ) ( not ( = ?auto_742105 ?auto_742108 ) ) ( not ( = ?auto_742105 ?auto_742109 ) ) ( not ( = ?auto_742105 ?auto_742110 ) ) ( not ( = ?auto_742106 ?auto_742107 ) ) ( not ( = ?auto_742106 ?auto_742108 ) ) ( not ( = ?auto_742106 ?auto_742109 ) ) ( not ( = ?auto_742106 ?auto_742110 ) ) ( not ( = ?auto_742107 ?auto_742108 ) ) ( not ( = ?auto_742107 ?auto_742109 ) ) ( not ( = ?auto_742107 ?auto_742110 ) ) ( not ( = ?auto_742108 ?auto_742109 ) ) ( not ( = ?auto_742108 ?auto_742110 ) ) ( not ( = ?auto_742109 ?auto_742110 ) ) ( ON ?auto_742108 ?auto_742109 ) ( ON ?auto_742107 ?auto_742108 ) ( ON ?auto_742106 ?auto_742107 ) ( ON ?auto_742105 ?auto_742106 ) ( CLEAR ?auto_742103 ) ( ON ?auto_742104 ?auto_742105 ) ( CLEAR ?auto_742104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_742098 ?auto_742099 ?auto_742100 ?auto_742101 ?auto_742102 ?auto_742103 ?auto_742104 )
      ( MAKE-12PILE ?auto_742098 ?auto_742099 ?auto_742100 ?auto_742101 ?auto_742102 ?auto_742103 ?auto_742104 ?auto_742105 ?auto_742106 ?auto_742107 ?auto_742108 ?auto_742109 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_742148 - BLOCK
      ?auto_742149 - BLOCK
      ?auto_742150 - BLOCK
      ?auto_742151 - BLOCK
      ?auto_742152 - BLOCK
      ?auto_742153 - BLOCK
      ?auto_742154 - BLOCK
      ?auto_742155 - BLOCK
      ?auto_742156 - BLOCK
      ?auto_742157 - BLOCK
      ?auto_742158 - BLOCK
      ?auto_742159 - BLOCK
    )
    :vars
    (
      ?auto_742160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742159 ?auto_742160 ) ( ON-TABLE ?auto_742148 ) ( ON ?auto_742149 ?auto_742148 ) ( ON ?auto_742150 ?auto_742149 ) ( ON ?auto_742151 ?auto_742150 ) ( ON ?auto_742152 ?auto_742151 ) ( not ( = ?auto_742148 ?auto_742149 ) ) ( not ( = ?auto_742148 ?auto_742150 ) ) ( not ( = ?auto_742148 ?auto_742151 ) ) ( not ( = ?auto_742148 ?auto_742152 ) ) ( not ( = ?auto_742148 ?auto_742153 ) ) ( not ( = ?auto_742148 ?auto_742154 ) ) ( not ( = ?auto_742148 ?auto_742155 ) ) ( not ( = ?auto_742148 ?auto_742156 ) ) ( not ( = ?auto_742148 ?auto_742157 ) ) ( not ( = ?auto_742148 ?auto_742158 ) ) ( not ( = ?auto_742148 ?auto_742159 ) ) ( not ( = ?auto_742148 ?auto_742160 ) ) ( not ( = ?auto_742149 ?auto_742150 ) ) ( not ( = ?auto_742149 ?auto_742151 ) ) ( not ( = ?auto_742149 ?auto_742152 ) ) ( not ( = ?auto_742149 ?auto_742153 ) ) ( not ( = ?auto_742149 ?auto_742154 ) ) ( not ( = ?auto_742149 ?auto_742155 ) ) ( not ( = ?auto_742149 ?auto_742156 ) ) ( not ( = ?auto_742149 ?auto_742157 ) ) ( not ( = ?auto_742149 ?auto_742158 ) ) ( not ( = ?auto_742149 ?auto_742159 ) ) ( not ( = ?auto_742149 ?auto_742160 ) ) ( not ( = ?auto_742150 ?auto_742151 ) ) ( not ( = ?auto_742150 ?auto_742152 ) ) ( not ( = ?auto_742150 ?auto_742153 ) ) ( not ( = ?auto_742150 ?auto_742154 ) ) ( not ( = ?auto_742150 ?auto_742155 ) ) ( not ( = ?auto_742150 ?auto_742156 ) ) ( not ( = ?auto_742150 ?auto_742157 ) ) ( not ( = ?auto_742150 ?auto_742158 ) ) ( not ( = ?auto_742150 ?auto_742159 ) ) ( not ( = ?auto_742150 ?auto_742160 ) ) ( not ( = ?auto_742151 ?auto_742152 ) ) ( not ( = ?auto_742151 ?auto_742153 ) ) ( not ( = ?auto_742151 ?auto_742154 ) ) ( not ( = ?auto_742151 ?auto_742155 ) ) ( not ( = ?auto_742151 ?auto_742156 ) ) ( not ( = ?auto_742151 ?auto_742157 ) ) ( not ( = ?auto_742151 ?auto_742158 ) ) ( not ( = ?auto_742151 ?auto_742159 ) ) ( not ( = ?auto_742151 ?auto_742160 ) ) ( not ( = ?auto_742152 ?auto_742153 ) ) ( not ( = ?auto_742152 ?auto_742154 ) ) ( not ( = ?auto_742152 ?auto_742155 ) ) ( not ( = ?auto_742152 ?auto_742156 ) ) ( not ( = ?auto_742152 ?auto_742157 ) ) ( not ( = ?auto_742152 ?auto_742158 ) ) ( not ( = ?auto_742152 ?auto_742159 ) ) ( not ( = ?auto_742152 ?auto_742160 ) ) ( not ( = ?auto_742153 ?auto_742154 ) ) ( not ( = ?auto_742153 ?auto_742155 ) ) ( not ( = ?auto_742153 ?auto_742156 ) ) ( not ( = ?auto_742153 ?auto_742157 ) ) ( not ( = ?auto_742153 ?auto_742158 ) ) ( not ( = ?auto_742153 ?auto_742159 ) ) ( not ( = ?auto_742153 ?auto_742160 ) ) ( not ( = ?auto_742154 ?auto_742155 ) ) ( not ( = ?auto_742154 ?auto_742156 ) ) ( not ( = ?auto_742154 ?auto_742157 ) ) ( not ( = ?auto_742154 ?auto_742158 ) ) ( not ( = ?auto_742154 ?auto_742159 ) ) ( not ( = ?auto_742154 ?auto_742160 ) ) ( not ( = ?auto_742155 ?auto_742156 ) ) ( not ( = ?auto_742155 ?auto_742157 ) ) ( not ( = ?auto_742155 ?auto_742158 ) ) ( not ( = ?auto_742155 ?auto_742159 ) ) ( not ( = ?auto_742155 ?auto_742160 ) ) ( not ( = ?auto_742156 ?auto_742157 ) ) ( not ( = ?auto_742156 ?auto_742158 ) ) ( not ( = ?auto_742156 ?auto_742159 ) ) ( not ( = ?auto_742156 ?auto_742160 ) ) ( not ( = ?auto_742157 ?auto_742158 ) ) ( not ( = ?auto_742157 ?auto_742159 ) ) ( not ( = ?auto_742157 ?auto_742160 ) ) ( not ( = ?auto_742158 ?auto_742159 ) ) ( not ( = ?auto_742158 ?auto_742160 ) ) ( not ( = ?auto_742159 ?auto_742160 ) ) ( ON ?auto_742158 ?auto_742159 ) ( ON ?auto_742157 ?auto_742158 ) ( ON ?auto_742156 ?auto_742157 ) ( ON ?auto_742155 ?auto_742156 ) ( ON ?auto_742154 ?auto_742155 ) ( CLEAR ?auto_742152 ) ( ON ?auto_742153 ?auto_742154 ) ( CLEAR ?auto_742153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_742148 ?auto_742149 ?auto_742150 ?auto_742151 ?auto_742152 ?auto_742153 )
      ( MAKE-12PILE ?auto_742148 ?auto_742149 ?auto_742150 ?auto_742151 ?auto_742152 ?auto_742153 ?auto_742154 ?auto_742155 ?auto_742156 ?auto_742157 ?auto_742158 ?auto_742159 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_742198 - BLOCK
      ?auto_742199 - BLOCK
      ?auto_742200 - BLOCK
      ?auto_742201 - BLOCK
      ?auto_742202 - BLOCK
      ?auto_742203 - BLOCK
      ?auto_742204 - BLOCK
      ?auto_742205 - BLOCK
      ?auto_742206 - BLOCK
      ?auto_742207 - BLOCK
      ?auto_742208 - BLOCK
      ?auto_742209 - BLOCK
    )
    :vars
    (
      ?auto_742210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742209 ?auto_742210 ) ( ON-TABLE ?auto_742198 ) ( ON ?auto_742199 ?auto_742198 ) ( ON ?auto_742200 ?auto_742199 ) ( ON ?auto_742201 ?auto_742200 ) ( not ( = ?auto_742198 ?auto_742199 ) ) ( not ( = ?auto_742198 ?auto_742200 ) ) ( not ( = ?auto_742198 ?auto_742201 ) ) ( not ( = ?auto_742198 ?auto_742202 ) ) ( not ( = ?auto_742198 ?auto_742203 ) ) ( not ( = ?auto_742198 ?auto_742204 ) ) ( not ( = ?auto_742198 ?auto_742205 ) ) ( not ( = ?auto_742198 ?auto_742206 ) ) ( not ( = ?auto_742198 ?auto_742207 ) ) ( not ( = ?auto_742198 ?auto_742208 ) ) ( not ( = ?auto_742198 ?auto_742209 ) ) ( not ( = ?auto_742198 ?auto_742210 ) ) ( not ( = ?auto_742199 ?auto_742200 ) ) ( not ( = ?auto_742199 ?auto_742201 ) ) ( not ( = ?auto_742199 ?auto_742202 ) ) ( not ( = ?auto_742199 ?auto_742203 ) ) ( not ( = ?auto_742199 ?auto_742204 ) ) ( not ( = ?auto_742199 ?auto_742205 ) ) ( not ( = ?auto_742199 ?auto_742206 ) ) ( not ( = ?auto_742199 ?auto_742207 ) ) ( not ( = ?auto_742199 ?auto_742208 ) ) ( not ( = ?auto_742199 ?auto_742209 ) ) ( not ( = ?auto_742199 ?auto_742210 ) ) ( not ( = ?auto_742200 ?auto_742201 ) ) ( not ( = ?auto_742200 ?auto_742202 ) ) ( not ( = ?auto_742200 ?auto_742203 ) ) ( not ( = ?auto_742200 ?auto_742204 ) ) ( not ( = ?auto_742200 ?auto_742205 ) ) ( not ( = ?auto_742200 ?auto_742206 ) ) ( not ( = ?auto_742200 ?auto_742207 ) ) ( not ( = ?auto_742200 ?auto_742208 ) ) ( not ( = ?auto_742200 ?auto_742209 ) ) ( not ( = ?auto_742200 ?auto_742210 ) ) ( not ( = ?auto_742201 ?auto_742202 ) ) ( not ( = ?auto_742201 ?auto_742203 ) ) ( not ( = ?auto_742201 ?auto_742204 ) ) ( not ( = ?auto_742201 ?auto_742205 ) ) ( not ( = ?auto_742201 ?auto_742206 ) ) ( not ( = ?auto_742201 ?auto_742207 ) ) ( not ( = ?auto_742201 ?auto_742208 ) ) ( not ( = ?auto_742201 ?auto_742209 ) ) ( not ( = ?auto_742201 ?auto_742210 ) ) ( not ( = ?auto_742202 ?auto_742203 ) ) ( not ( = ?auto_742202 ?auto_742204 ) ) ( not ( = ?auto_742202 ?auto_742205 ) ) ( not ( = ?auto_742202 ?auto_742206 ) ) ( not ( = ?auto_742202 ?auto_742207 ) ) ( not ( = ?auto_742202 ?auto_742208 ) ) ( not ( = ?auto_742202 ?auto_742209 ) ) ( not ( = ?auto_742202 ?auto_742210 ) ) ( not ( = ?auto_742203 ?auto_742204 ) ) ( not ( = ?auto_742203 ?auto_742205 ) ) ( not ( = ?auto_742203 ?auto_742206 ) ) ( not ( = ?auto_742203 ?auto_742207 ) ) ( not ( = ?auto_742203 ?auto_742208 ) ) ( not ( = ?auto_742203 ?auto_742209 ) ) ( not ( = ?auto_742203 ?auto_742210 ) ) ( not ( = ?auto_742204 ?auto_742205 ) ) ( not ( = ?auto_742204 ?auto_742206 ) ) ( not ( = ?auto_742204 ?auto_742207 ) ) ( not ( = ?auto_742204 ?auto_742208 ) ) ( not ( = ?auto_742204 ?auto_742209 ) ) ( not ( = ?auto_742204 ?auto_742210 ) ) ( not ( = ?auto_742205 ?auto_742206 ) ) ( not ( = ?auto_742205 ?auto_742207 ) ) ( not ( = ?auto_742205 ?auto_742208 ) ) ( not ( = ?auto_742205 ?auto_742209 ) ) ( not ( = ?auto_742205 ?auto_742210 ) ) ( not ( = ?auto_742206 ?auto_742207 ) ) ( not ( = ?auto_742206 ?auto_742208 ) ) ( not ( = ?auto_742206 ?auto_742209 ) ) ( not ( = ?auto_742206 ?auto_742210 ) ) ( not ( = ?auto_742207 ?auto_742208 ) ) ( not ( = ?auto_742207 ?auto_742209 ) ) ( not ( = ?auto_742207 ?auto_742210 ) ) ( not ( = ?auto_742208 ?auto_742209 ) ) ( not ( = ?auto_742208 ?auto_742210 ) ) ( not ( = ?auto_742209 ?auto_742210 ) ) ( ON ?auto_742208 ?auto_742209 ) ( ON ?auto_742207 ?auto_742208 ) ( ON ?auto_742206 ?auto_742207 ) ( ON ?auto_742205 ?auto_742206 ) ( ON ?auto_742204 ?auto_742205 ) ( ON ?auto_742203 ?auto_742204 ) ( CLEAR ?auto_742201 ) ( ON ?auto_742202 ?auto_742203 ) ( CLEAR ?auto_742202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_742198 ?auto_742199 ?auto_742200 ?auto_742201 ?auto_742202 )
      ( MAKE-12PILE ?auto_742198 ?auto_742199 ?auto_742200 ?auto_742201 ?auto_742202 ?auto_742203 ?auto_742204 ?auto_742205 ?auto_742206 ?auto_742207 ?auto_742208 ?auto_742209 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_742248 - BLOCK
      ?auto_742249 - BLOCK
      ?auto_742250 - BLOCK
      ?auto_742251 - BLOCK
      ?auto_742252 - BLOCK
      ?auto_742253 - BLOCK
      ?auto_742254 - BLOCK
      ?auto_742255 - BLOCK
      ?auto_742256 - BLOCK
      ?auto_742257 - BLOCK
      ?auto_742258 - BLOCK
      ?auto_742259 - BLOCK
    )
    :vars
    (
      ?auto_742260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742259 ?auto_742260 ) ( ON-TABLE ?auto_742248 ) ( ON ?auto_742249 ?auto_742248 ) ( ON ?auto_742250 ?auto_742249 ) ( not ( = ?auto_742248 ?auto_742249 ) ) ( not ( = ?auto_742248 ?auto_742250 ) ) ( not ( = ?auto_742248 ?auto_742251 ) ) ( not ( = ?auto_742248 ?auto_742252 ) ) ( not ( = ?auto_742248 ?auto_742253 ) ) ( not ( = ?auto_742248 ?auto_742254 ) ) ( not ( = ?auto_742248 ?auto_742255 ) ) ( not ( = ?auto_742248 ?auto_742256 ) ) ( not ( = ?auto_742248 ?auto_742257 ) ) ( not ( = ?auto_742248 ?auto_742258 ) ) ( not ( = ?auto_742248 ?auto_742259 ) ) ( not ( = ?auto_742248 ?auto_742260 ) ) ( not ( = ?auto_742249 ?auto_742250 ) ) ( not ( = ?auto_742249 ?auto_742251 ) ) ( not ( = ?auto_742249 ?auto_742252 ) ) ( not ( = ?auto_742249 ?auto_742253 ) ) ( not ( = ?auto_742249 ?auto_742254 ) ) ( not ( = ?auto_742249 ?auto_742255 ) ) ( not ( = ?auto_742249 ?auto_742256 ) ) ( not ( = ?auto_742249 ?auto_742257 ) ) ( not ( = ?auto_742249 ?auto_742258 ) ) ( not ( = ?auto_742249 ?auto_742259 ) ) ( not ( = ?auto_742249 ?auto_742260 ) ) ( not ( = ?auto_742250 ?auto_742251 ) ) ( not ( = ?auto_742250 ?auto_742252 ) ) ( not ( = ?auto_742250 ?auto_742253 ) ) ( not ( = ?auto_742250 ?auto_742254 ) ) ( not ( = ?auto_742250 ?auto_742255 ) ) ( not ( = ?auto_742250 ?auto_742256 ) ) ( not ( = ?auto_742250 ?auto_742257 ) ) ( not ( = ?auto_742250 ?auto_742258 ) ) ( not ( = ?auto_742250 ?auto_742259 ) ) ( not ( = ?auto_742250 ?auto_742260 ) ) ( not ( = ?auto_742251 ?auto_742252 ) ) ( not ( = ?auto_742251 ?auto_742253 ) ) ( not ( = ?auto_742251 ?auto_742254 ) ) ( not ( = ?auto_742251 ?auto_742255 ) ) ( not ( = ?auto_742251 ?auto_742256 ) ) ( not ( = ?auto_742251 ?auto_742257 ) ) ( not ( = ?auto_742251 ?auto_742258 ) ) ( not ( = ?auto_742251 ?auto_742259 ) ) ( not ( = ?auto_742251 ?auto_742260 ) ) ( not ( = ?auto_742252 ?auto_742253 ) ) ( not ( = ?auto_742252 ?auto_742254 ) ) ( not ( = ?auto_742252 ?auto_742255 ) ) ( not ( = ?auto_742252 ?auto_742256 ) ) ( not ( = ?auto_742252 ?auto_742257 ) ) ( not ( = ?auto_742252 ?auto_742258 ) ) ( not ( = ?auto_742252 ?auto_742259 ) ) ( not ( = ?auto_742252 ?auto_742260 ) ) ( not ( = ?auto_742253 ?auto_742254 ) ) ( not ( = ?auto_742253 ?auto_742255 ) ) ( not ( = ?auto_742253 ?auto_742256 ) ) ( not ( = ?auto_742253 ?auto_742257 ) ) ( not ( = ?auto_742253 ?auto_742258 ) ) ( not ( = ?auto_742253 ?auto_742259 ) ) ( not ( = ?auto_742253 ?auto_742260 ) ) ( not ( = ?auto_742254 ?auto_742255 ) ) ( not ( = ?auto_742254 ?auto_742256 ) ) ( not ( = ?auto_742254 ?auto_742257 ) ) ( not ( = ?auto_742254 ?auto_742258 ) ) ( not ( = ?auto_742254 ?auto_742259 ) ) ( not ( = ?auto_742254 ?auto_742260 ) ) ( not ( = ?auto_742255 ?auto_742256 ) ) ( not ( = ?auto_742255 ?auto_742257 ) ) ( not ( = ?auto_742255 ?auto_742258 ) ) ( not ( = ?auto_742255 ?auto_742259 ) ) ( not ( = ?auto_742255 ?auto_742260 ) ) ( not ( = ?auto_742256 ?auto_742257 ) ) ( not ( = ?auto_742256 ?auto_742258 ) ) ( not ( = ?auto_742256 ?auto_742259 ) ) ( not ( = ?auto_742256 ?auto_742260 ) ) ( not ( = ?auto_742257 ?auto_742258 ) ) ( not ( = ?auto_742257 ?auto_742259 ) ) ( not ( = ?auto_742257 ?auto_742260 ) ) ( not ( = ?auto_742258 ?auto_742259 ) ) ( not ( = ?auto_742258 ?auto_742260 ) ) ( not ( = ?auto_742259 ?auto_742260 ) ) ( ON ?auto_742258 ?auto_742259 ) ( ON ?auto_742257 ?auto_742258 ) ( ON ?auto_742256 ?auto_742257 ) ( ON ?auto_742255 ?auto_742256 ) ( ON ?auto_742254 ?auto_742255 ) ( ON ?auto_742253 ?auto_742254 ) ( ON ?auto_742252 ?auto_742253 ) ( CLEAR ?auto_742250 ) ( ON ?auto_742251 ?auto_742252 ) ( CLEAR ?auto_742251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_742248 ?auto_742249 ?auto_742250 ?auto_742251 )
      ( MAKE-12PILE ?auto_742248 ?auto_742249 ?auto_742250 ?auto_742251 ?auto_742252 ?auto_742253 ?auto_742254 ?auto_742255 ?auto_742256 ?auto_742257 ?auto_742258 ?auto_742259 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_742298 - BLOCK
      ?auto_742299 - BLOCK
      ?auto_742300 - BLOCK
      ?auto_742301 - BLOCK
      ?auto_742302 - BLOCK
      ?auto_742303 - BLOCK
      ?auto_742304 - BLOCK
      ?auto_742305 - BLOCK
      ?auto_742306 - BLOCK
      ?auto_742307 - BLOCK
      ?auto_742308 - BLOCK
      ?auto_742309 - BLOCK
    )
    :vars
    (
      ?auto_742310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742309 ?auto_742310 ) ( ON-TABLE ?auto_742298 ) ( ON ?auto_742299 ?auto_742298 ) ( not ( = ?auto_742298 ?auto_742299 ) ) ( not ( = ?auto_742298 ?auto_742300 ) ) ( not ( = ?auto_742298 ?auto_742301 ) ) ( not ( = ?auto_742298 ?auto_742302 ) ) ( not ( = ?auto_742298 ?auto_742303 ) ) ( not ( = ?auto_742298 ?auto_742304 ) ) ( not ( = ?auto_742298 ?auto_742305 ) ) ( not ( = ?auto_742298 ?auto_742306 ) ) ( not ( = ?auto_742298 ?auto_742307 ) ) ( not ( = ?auto_742298 ?auto_742308 ) ) ( not ( = ?auto_742298 ?auto_742309 ) ) ( not ( = ?auto_742298 ?auto_742310 ) ) ( not ( = ?auto_742299 ?auto_742300 ) ) ( not ( = ?auto_742299 ?auto_742301 ) ) ( not ( = ?auto_742299 ?auto_742302 ) ) ( not ( = ?auto_742299 ?auto_742303 ) ) ( not ( = ?auto_742299 ?auto_742304 ) ) ( not ( = ?auto_742299 ?auto_742305 ) ) ( not ( = ?auto_742299 ?auto_742306 ) ) ( not ( = ?auto_742299 ?auto_742307 ) ) ( not ( = ?auto_742299 ?auto_742308 ) ) ( not ( = ?auto_742299 ?auto_742309 ) ) ( not ( = ?auto_742299 ?auto_742310 ) ) ( not ( = ?auto_742300 ?auto_742301 ) ) ( not ( = ?auto_742300 ?auto_742302 ) ) ( not ( = ?auto_742300 ?auto_742303 ) ) ( not ( = ?auto_742300 ?auto_742304 ) ) ( not ( = ?auto_742300 ?auto_742305 ) ) ( not ( = ?auto_742300 ?auto_742306 ) ) ( not ( = ?auto_742300 ?auto_742307 ) ) ( not ( = ?auto_742300 ?auto_742308 ) ) ( not ( = ?auto_742300 ?auto_742309 ) ) ( not ( = ?auto_742300 ?auto_742310 ) ) ( not ( = ?auto_742301 ?auto_742302 ) ) ( not ( = ?auto_742301 ?auto_742303 ) ) ( not ( = ?auto_742301 ?auto_742304 ) ) ( not ( = ?auto_742301 ?auto_742305 ) ) ( not ( = ?auto_742301 ?auto_742306 ) ) ( not ( = ?auto_742301 ?auto_742307 ) ) ( not ( = ?auto_742301 ?auto_742308 ) ) ( not ( = ?auto_742301 ?auto_742309 ) ) ( not ( = ?auto_742301 ?auto_742310 ) ) ( not ( = ?auto_742302 ?auto_742303 ) ) ( not ( = ?auto_742302 ?auto_742304 ) ) ( not ( = ?auto_742302 ?auto_742305 ) ) ( not ( = ?auto_742302 ?auto_742306 ) ) ( not ( = ?auto_742302 ?auto_742307 ) ) ( not ( = ?auto_742302 ?auto_742308 ) ) ( not ( = ?auto_742302 ?auto_742309 ) ) ( not ( = ?auto_742302 ?auto_742310 ) ) ( not ( = ?auto_742303 ?auto_742304 ) ) ( not ( = ?auto_742303 ?auto_742305 ) ) ( not ( = ?auto_742303 ?auto_742306 ) ) ( not ( = ?auto_742303 ?auto_742307 ) ) ( not ( = ?auto_742303 ?auto_742308 ) ) ( not ( = ?auto_742303 ?auto_742309 ) ) ( not ( = ?auto_742303 ?auto_742310 ) ) ( not ( = ?auto_742304 ?auto_742305 ) ) ( not ( = ?auto_742304 ?auto_742306 ) ) ( not ( = ?auto_742304 ?auto_742307 ) ) ( not ( = ?auto_742304 ?auto_742308 ) ) ( not ( = ?auto_742304 ?auto_742309 ) ) ( not ( = ?auto_742304 ?auto_742310 ) ) ( not ( = ?auto_742305 ?auto_742306 ) ) ( not ( = ?auto_742305 ?auto_742307 ) ) ( not ( = ?auto_742305 ?auto_742308 ) ) ( not ( = ?auto_742305 ?auto_742309 ) ) ( not ( = ?auto_742305 ?auto_742310 ) ) ( not ( = ?auto_742306 ?auto_742307 ) ) ( not ( = ?auto_742306 ?auto_742308 ) ) ( not ( = ?auto_742306 ?auto_742309 ) ) ( not ( = ?auto_742306 ?auto_742310 ) ) ( not ( = ?auto_742307 ?auto_742308 ) ) ( not ( = ?auto_742307 ?auto_742309 ) ) ( not ( = ?auto_742307 ?auto_742310 ) ) ( not ( = ?auto_742308 ?auto_742309 ) ) ( not ( = ?auto_742308 ?auto_742310 ) ) ( not ( = ?auto_742309 ?auto_742310 ) ) ( ON ?auto_742308 ?auto_742309 ) ( ON ?auto_742307 ?auto_742308 ) ( ON ?auto_742306 ?auto_742307 ) ( ON ?auto_742305 ?auto_742306 ) ( ON ?auto_742304 ?auto_742305 ) ( ON ?auto_742303 ?auto_742304 ) ( ON ?auto_742302 ?auto_742303 ) ( ON ?auto_742301 ?auto_742302 ) ( CLEAR ?auto_742299 ) ( ON ?auto_742300 ?auto_742301 ) ( CLEAR ?auto_742300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_742298 ?auto_742299 ?auto_742300 )
      ( MAKE-12PILE ?auto_742298 ?auto_742299 ?auto_742300 ?auto_742301 ?auto_742302 ?auto_742303 ?auto_742304 ?auto_742305 ?auto_742306 ?auto_742307 ?auto_742308 ?auto_742309 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_742348 - BLOCK
      ?auto_742349 - BLOCK
      ?auto_742350 - BLOCK
      ?auto_742351 - BLOCK
      ?auto_742352 - BLOCK
      ?auto_742353 - BLOCK
      ?auto_742354 - BLOCK
      ?auto_742355 - BLOCK
      ?auto_742356 - BLOCK
      ?auto_742357 - BLOCK
      ?auto_742358 - BLOCK
      ?auto_742359 - BLOCK
    )
    :vars
    (
      ?auto_742360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742359 ?auto_742360 ) ( ON-TABLE ?auto_742348 ) ( not ( = ?auto_742348 ?auto_742349 ) ) ( not ( = ?auto_742348 ?auto_742350 ) ) ( not ( = ?auto_742348 ?auto_742351 ) ) ( not ( = ?auto_742348 ?auto_742352 ) ) ( not ( = ?auto_742348 ?auto_742353 ) ) ( not ( = ?auto_742348 ?auto_742354 ) ) ( not ( = ?auto_742348 ?auto_742355 ) ) ( not ( = ?auto_742348 ?auto_742356 ) ) ( not ( = ?auto_742348 ?auto_742357 ) ) ( not ( = ?auto_742348 ?auto_742358 ) ) ( not ( = ?auto_742348 ?auto_742359 ) ) ( not ( = ?auto_742348 ?auto_742360 ) ) ( not ( = ?auto_742349 ?auto_742350 ) ) ( not ( = ?auto_742349 ?auto_742351 ) ) ( not ( = ?auto_742349 ?auto_742352 ) ) ( not ( = ?auto_742349 ?auto_742353 ) ) ( not ( = ?auto_742349 ?auto_742354 ) ) ( not ( = ?auto_742349 ?auto_742355 ) ) ( not ( = ?auto_742349 ?auto_742356 ) ) ( not ( = ?auto_742349 ?auto_742357 ) ) ( not ( = ?auto_742349 ?auto_742358 ) ) ( not ( = ?auto_742349 ?auto_742359 ) ) ( not ( = ?auto_742349 ?auto_742360 ) ) ( not ( = ?auto_742350 ?auto_742351 ) ) ( not ( = ?auto_742350 ?auto_742352 ) ) ( not ( = ?auto_742350 ?auto_742353 ) ) ( not ( = ?auto_742350 ?auto_742354 ) ) ( not ( = ?auto_742350 ?auto_742355 ) ) ( not ( = ?auto_742350 ?auto_742356 ) ) ( not ( = ?auto_742350 ?auto_742357 ) ) ( not ( = ?auto_742350 ?auto_742358 ) ) ( not ( = ?auto_742350 ?auto_742359 ) ) ( not ( = ?auto_742350 ?auto_742360 ) ) ( not ( = ?auto_742351 ?auto_742352 ) ) ( not ( = ?auto_742351 ?auto_742353 ) ) ( not ( = ?auto_742351 ?auto_742354 ) ) ( not ( = ?auto_742351 ?auto_742355 ) ) ( not ( = ?auto_742351 ?auto_742356 ) ) ( not ( = ?auto_742351 ?auto_742357 ) ) ( not ( = ?auto_742351 ?auto_742358 ) ) ( not ( = ?auto_742351 ?auto_742359 ) ) ( not ( = ?auto_742351 ?auto_742360 ) ) ( not ( = ?auto_742352 ?auto_742353 ) ) ( not ( = ?auto_742352 ?auto_742354 ) ) ( not ( = ?auto_742352 ?auto_742355 ) ) ( not ( = ?auto_742352 ?auto_742356 ) ) ( not ( = ?auto_742352 ?auto_742357 ) ) ( not ( = ?auto_742352 ?auto_742358 ) ) ( not ( = ?auto_742352 ?auto_742359 ) ) ( not ( = ?auto_742352 ?auto_742360 ) ) ( not ( = ?auto_742353 ?auto_742354 ) ) ( not ( = ?auto_742353 ?auto_742355 ) ) ( not ( = ?auto_742353 ?auto_742356 ) ) ( not ( = ?auto_742353 ?auto_742357 ) ) ( not ( = ?auto_742353 ?auto_742358 ) ) ( not ( = ?auto_742353 ?auto_742359 ) ) ( not ( = ?auto_742353 ?auto_742360 ) ) ( not ( = ?auto_742354 ?auto_742355 ) ) ( not ( = ?auto_742354 ?auto_742356 ) ) ( not ( = ?auto_742354 ?auto_742357 ) ) ( not ( = ?auto_742354 ?auto_742358 ) ) ( not ( = ?auto_742354 ?auto_742359 ) ) ( not ( = ?auto_742354 ?auto_742360 ) ) ( not ( = ?auto_742355 ?auto_742356 ) ) ( not ( = ?auto_742355 ?auto_742357 ) ) ( not ( = ?auto_742355 ?auto_742358 ) ) ( not ( = ?auto_742355 ?auto_742359 ) ) ( not ( = ?auto_742355 ?auto_742360 ) ) ( not ( = ?auto_742356 ?auto_742357 ) ) ( not ( = ?auto_742356 ?auto_742358 ) ) ( not ( = ?auto_742356 ?auto_742359 ) ) ( not ( = ?auto_742356 ?auto_742360 ) ) ( not ( = ?auto_742357 ?auto_742358 ) ) ( not ( = ?auto_742357 ?auto_742359 ) ) ( not ( = ?auto_742357 ?auto_742360 ) ) ( not ( = ?auto_742358 ?auto_742359 ) ) ( not ( = ?auto_742358 ?auto_742360 ) ) ( not ( = ?auto_742359 ?auto_742360 ) ) ( ON ?auto_742358 ?auto_742359 ) ( ON ?auto_742357 ?auto_742358 ) ( ON ?auto_742356 ?auto_742357 ) ( ON ?auto_742355 ?auto_742356 ) ( ON ?auto_742354 ?auto_742355 ) ( ON ?auto_742353 ?auto_742354 ) ( ON ?auto_742352 ?auto_742353 ) ( ON ?auto_742351 ?auto_742352 ) ( ON ?auto_742350 ?auto_742351 ) ( CLEAR ?auto_742348 ) ( ON ?auto_742349 ?auto_742350 ) ( CLEAR ?auto_742349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_742348 ?auto_742349 )
      ( MAKE-12PILE ?auto_742348 ?auto_742349 ?auto_742350 ?auto_742351 ?auto_742352 ?auto_742353 ?auto_742354 ?auto_742355 ?auto_742356 ?auto_742357 ?auto_742358 ?auto_742359 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_742398 - BLOCK
      ?auto_742399 - BLOCK
      ?auto_742400 - BLOCK
      ?auto_742401 - BLOCK
      ?auto_742402 - BLOCK
      ?auto_742403 - BLOCK
      ?auto_742404 - BLOCK
      ?auto_742405 - BLOCK
      ?auto_742406 - BLOCK
      ?auto_742407 - BLOCK
      ?auto_742408 - BLOCK
      ?auto_742409 - BLOCK
    )
    :vars
    (
      ?auto_742410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742409 ?auto_742410 ) ( not ( = ?auto_742398 ?auto_742399 ) ) ( not ( = ?auto_742398 ?auto_742400 ) ) ( not ( = ?auto_742398 ?auto_742401 ) ) ( not ( = ?auto_742398 ?auto_742402 ) ) ( not ( = ?auto_742398 ?auto_742403 ) ) ( not ( = ?auto_742398 ?auto_742404 ) ) ( not ( = ?auto_742398 ?auto_742405 ) ) ( not ( = ?auto_742398 ?auto_742406 ) ) ( not ( = ?auto_742398 ?auto_742407 ) ) ( not ( = ?auto_742398 ?auto_742408 ) ) ( not ( = ?auto_742398 ?auto_742409 ) ) ( not ( = ?auto_742398 ?auto_742410 ) ) ( not ( = ?auto_742399 ?auto_742400 ) ) ( not ( = ?auto_742399 ?auto_742401 ) ) ( not ( = ?auto_742399 ?auto_742402 ) ) ( not ( = ?auto_742399 ?auto_742403 ) ) ( not ( = ?auto_742399 ?auto_742404 ) ) ( not ( = ?auto_742399 ?auto_742405 ) ) ( not ( = ?auto_742399 ?auto_742406 ) ) ( not ( = ?auto_742399 ?auto_742407 ) ) ( not ( = ?auto_742399 ?auto_742408 ) ) ( not ( = ?auto_742399 ?auto_742409 ) ) ( not ( = ?auto_742399 ?auto_742410 ) ) ( not ( = ?auto_742400 ?auto_742401 ) ) ( not ( = ?auto_742400 ?auto_742402 ) ) ( not ( = ?auto_742400 ?auto_742403 ) ) ( not ( = ?auto_742400 ?auto_742404 ) ) ( not ( = ?auto_742400 ?auto_742405 ) ) ( not ( = ?auto_742400 ?auto_742406 ) ) ( not ( = ?auto_742400 ?auto_742407 ) ) ( not ( = ?auto_742400 ?auto_742408 ) ) ( not ( = ?auto_742400 ?auto_742409 ) ) ( not ( = ?auto_742400 ?auto_742410 ) ) ( not ( = ?auto_742401 ?auto_742402 ) ) ( not ( = ?auto_742401 ?auto_742403 ) ) ( not ( = ?auto_742401 ?auto_742404 ) ) ( not ( = ?auto_742401 ?auto_742405 ) ) ( not ( = ?auto_742401 ?auto_742406 ) ) ( not ( = ?auto_742401 ?auto_742407 ) ) ( not ( = ?auto_742401 ?auto_742408 ) ) ( not ( = ?auto_742401 ?auto_742409 ) ) ( not ( = ?auto_742401 ?auto_742410 ) ) ( not ( = ?auto_742402 ?auto_742403 ) ) ( not ( = ?auto_742402 ?auto_742404 ) ) ( not ( = ?auto_742402 ?auto_742405 ) ) ( not ( = ?auto_742402 ?auto_742406 ) ) ( not ( = ?auto_742402 ?auto_742407 ) ) ( not ( = ?auto_742402 ?auto_742408 ) ) ( not ( = ?auto_742402 ?auto_742409 ) ) ( not ( = ?auto_742402 ?auto_742410 ) ) ( not ( = ?auto_742403 ?auto_742404 ) ) ( not ( = ?auto_742403 ?auto_742405 ) ) ( not ( = ?auto_742403 ?auto_742406 ) ) ( not ( = ?auto_742403 ?auto_742407 ) ) ( not ( = ?auto_742403 ?auto_742408 ) ) ( not ( = ?auto_742403 ?auto_742409 ) ) ( not ( = ?auto_742403 ?auto_742410 ) ) ( not ( = ?auto_742404 ?auto_742405 ) ) ( not ( = ?auto_742404 ?auto_742406 ) ) ( not ( = ?auto_742404 ?auto_742407 ) ) ( not ( = ?auto_742404 ?auto_742408 ) ) ( not ( = ?auto_742404 ?auto_742409 ) ) ( not ( = ?auto_742404 ?auto_742410 ) ) ( not ( = ?auto_742405 ?auto_742406 ) ) ( not ( = ?auto_742405 ?auto_742407 ) ) ( not ( = ?auto_742405 ?auto_742408 ) ) ( not ( = ?auto_742405 ?auto_742409 ) ) ( not ( = ?auto_742405 ?auto_742410 ) ) ( not ( = ?auto_742406 ?auto_742407 ) ) ( not ( = ?auto_742406 ?auto_742408 ) ) ( not ( = ?auto_742406 ?auto_742409 ) ) ( not ( = ?auto_742406 ?auto_742410 ) ) ( not ( = ?auto_742407 ?auto_742408 ) ) ( not ( = ?auto_742407 ?auto_742409 ) ) ( not ( = ?auto_742407 ?auto_742410 ) ) ( not ( = ?auto_742408 ?auto_742409 ) ) ( not ( = ?auto_742408 ?auto_742410 ) ) ( not ( = ?auto_742409 ?auto_742410 ) ) ( ON ?auto_742408 ?auto_742409 ) ( ON ?auto_742407 ?auto_742408 ) ( ON ?auto_742406 ?auto_742407 ) ( ON ?auto_742405 ?auto_742406 ) ( ON ?auto_742404 ?auto_742405 ) ( ON ?auto_742403 ?auto_742404 ) ( ON ?auto_742402 ?auto_742403 ) ( ON ?auto_742401 ?auto_742402 ) ( ON ?auto_742400 ?auto_742401 ) ( ON ?auto_742399 ?auto_742400 ) ( ON ?auto_742398 ?auto_742399 ) ( CLEAR ?auto_742398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_742398 )
      ( MAKE-12PILE ?auto_742398 ?auto_742399 ?auto_742400 ?auto_742401 ?auto_742402 ?auto_742403 ?auto_742404 ?auto_742405 ?auto_742406 ?auto_742407 ?auto_742408 ?auto_742409 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_742449 - BLOCK
      ?auto_742450 - BLOCK
      ?auto_742451 - BLOCK
      ?auto_742452 - BLOCK
      ?auto_742453 - BLOCK
      ?auto_742454 - BLOCK
      ?auto_742455 - BLOCK
      ?auto_742456 - BLOCK
      ?auto_742457 - BLOCK
      ?auto_742458 - BLOCK
      ?auto_742459 - BLOCK
      ?auto_742460 - BLOCK
      ?auto_742461 - BLOCK
    )
    :vars
    (
      ?auto_742462 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_742460 ) ( ON ?auto_742461 ?auto_742462 ) ( CLEAR ?auto_742461 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_742449 ) ( ON ?auto_742450 ?auto_742449 ) ( ON ?auto_742451 ?auto_742450 ) ( ON ?auto_742452 ?auto_742451 ) ( ON ?auto_742453 ?auto_742452 ) ( ON ?auto_742454 ?auto_742453 ) ( ON ?auto_742455 ?auto_742454 ) ( ON ?auto_742456 ?auto_742455 ) ( ON ?auto_742457 ?auto_742456 ) ( ON ?auto_742458 ?auto_742457 ) ( ON ?auto_742459 ?auto_742458 ) ( ON ?auto_742460 ?auto_742459 ) ( not ( = ?auto_742449 ?auto_742450 ) ) ( not ( = ?auto_742449 ?auto_742451 ) ) ( not ( = ?auto_742449 ?auto_742452 ) ) ( not ( = ?auto_742449 ?auto_742453 ) ) ( not ( = ?auto_742449 ?auto_742454 ) ) ( not ( = ?auto_742449 ?auto_742455 ) ) ( not ( = ?auto_742449 ?auto_742456 ) ) ( not ( = ?auto_742449 ?auto_742457 ) ) ( not ( = ?auto_742449 ?auto_742458 ) ) ( not ( = ?auto_742449 ?auto_742459 ) ) ( not ( = ?auto_742449 ?auto_742460 ) ) ( not ( = ?auto_742449 ?auto_742461 ) ) ( not ( = ?auto_742449 ?auto_742462 ) ) ( not ( = ?auto_742450 ?auto_742451 ) ) ( not ( = ?auto_742450 ?auto_742452 ) ) ( not ( = ?auto_742450 ?auto_742453 ) ) ( not ( = ?auto_742450 ?auto_742454 ) ) ( not ( = ?auto_742450 ?auto_742455 ) ) ( not ( = ?auto_742450 ?auto_742456 ) ) ( not ( = ?auto_742450 ?auto_742457 ) ) ( not ( = ?auto_742450 ?auto_742458 ) ) ( not ( = ?auto_742450 ?auto_742459 ) ) ( not ( = ?auto_742450 ?auto_742460 ) ) ( not ( = ?auto_742450 ?auto_742461 ) ) ( not ( = ?auto_742450 ?auto_742462 ) ) ( not ( = ?auto_742451 ?auto_742452 ) ) ( not ( = ?auto_742451 ?auto_742453 ) ) ( not ( = ?auto_742451 ?auto_742454 ) ) ( not ( = ?auto_742451 ?auto_742455 ) ) ( not ( = ?auto_742451 ?auto_742456 ) ) ( not ( = ?auto_742451 ?auto_742457 ) ) ( not ( = ?auto_742451 ?auto_742458 ) ) ( not ( = ?auto_742451 ?auto_742459 ) ) ( not ( = ?auto_742451 ?auto_742460 ) ) ( not ( = ?auto_742451 ?auto_742461 ) ) ( not ( = ?auto_742451 ?auto_742462 ) ) ( not ( = ?auto_742452 ?auto_742453 ) ) ( not ( = ?auto_742452 ?auto_742454 ) ) ( not ( = ?auto_742452 ?auto_742455 ) ) ( not ( = ?auto_742452 ?auto_742456 ) ) ( not ( = ?auto_742452 ?auto_742457 ) ) ( not ( = ?auto_742452 ?auto_742458 ) ) ( not ( = ?auto_742452 ?auto_742459 ) ) ( not ( = ?auto_742452 ?auto_742460 ) ) ( not ( = ?auto_742452 ?auto_742461 ) ) ( not ( = ?auto_742452 ?auto_742462 ) ) ( not ( = ?auto_742453 ?auto_742454 ) ) ( not ( = ?auto_742453 ?auto_742455 ) ) ( not ( = ?auto_742453 ?auto_742456 ) ) ( not ( = ?auto_742453 ?auto_742457 ) ) ( not ( = ?auto_742453 ?auto_742458 ) ) ( not ( = ?auto_742453 ?auto_742459 ) ) ( not ( = ?auto_742453 ?auto_742460 ) ) ( not ( = ?auto_742453 ?auto_742461 ) ) ( not ( = ?auto_742453 ?auto_742462 ) ) ( not ( = ?auto_742454 ?auto_742455 ) ) ( not ( = ?auto_742454 ?auto_742456 ) ) ( not ( = ?auto_742454 ?auto_742457 ) ) ( not ( = ?auto_742454 ?auto_742458 ) ) ( not ( = ?auto_742454 ?auto_742459 ) ) ( not ( = ?auto_742454 ?auto_742460 ) ) ( not ( = ?auto_742454 ?auto_742461 ) ) ( not ( = ?auto_742454 ?auto_742462 ) ) ( not ( = ?auto_742455 ?auto_742456 ) ) ( not ( = ?auto_742455 ?auto_742457 ) ) ( not ( = ?auto_742455 ?auto_742458 ) ) ( not ( = ?auto_742455 ?auto_742459 ) ) ( not ( = ?auto_742455 ?auto_742460 ) ) ( not ( = ?auto_742455 ?auto_742461 ) ) ( not ( = ?auto_742455 ?auto_742462 ) ) ( not ( = ?auto_742456 ?auto_742457 ) ) ( not ( = ?auto_742456 ?auto_742458 ) ) ( not ( = ?auto_742456 ?auto_742459 ) ) ( not ( = ?auto_742456 ?auto_742460 ) ) ( not ( = ?auto_742456 ?auto_742461 ) ) ( not ( = ?auto_742456 ?auto_742462 ) ) ( not ( = ?auto_742457 ?auto_742458 ) ) ( not ( = ?auto_742457 ?auto_742459 ) ) ( not ( = ?auto_742457 ?auto_742460 ) ) ( not ( = ?auto_742457 ?auto_742461 ) ) ( not ( = ?auto_742457 ?auto_742462 ) ) ( not ( = ?auto_742458 ?auto_742459 ) ) ( not ( = ?auto_742458 ?auto_742460 ) ) ( not ( = ?auto_742458 ?auto_742461 ) ) ( not ( = ?auto_742458 ?auto_742462 ) ) ( not ( = ?auto_742459 ?auto_742460 ) ) ( not ( = ?auto_742459 ?auto_742461 ) ) ( not ( = ?auto_742459 ?auto_742462 ) ) ( not ( = ?auto_742460 ?auto_742461 ) ) ( not ( = ?auto_742460 ?auto_742462 ) ) ( not ( = ?auto_742461 ?auto_742462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_742461 ?auto_742462 )
      ( !STACK ?auto_742461 ?auto_742460 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_742503 - BLOCK
      ?auto_742504 - BLOCK
      ?auto_742505 - BLOCK
      ?auto_742506 - BLOCK
      ?auto_742507 - BLOCK
      ?auto_742508 - BLOCK
      ?auto_742509 - BLOCK
      ?auto_742510 - BLOCK
      ?auto_742511 - BLOCK
      ?auto_742512 - BLOCK
      ?auto_742513 - BLOCK
      ?auto_742514 - BLOCK
      ?auto_742515 - BLOCK
    )
    :vars
    (
      ?auto_742516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742515 ?auto_742516 ) ( ON-TABLE ?auto_742503 ) ( ON ?auto_742504 ?auto_742503 ) ( ON ?auto_742505 ?auto_742504 ) ( ON ?auto_742506 ?auto_742505 ) ( ON ?auto_742507 ?auto_742506 ) ( ON ?auto_742508 ?auto_742507 ) ( ON ?auto_742509 ?auto_742508 ) ( ON ?auto_742510 ?auto_742509 ) ( ON ?auto_742511 ?auto_742510 ) ( ON ?auto_742512 ?auto_742511 ) ( ON ?auto_742513 ?auto_742512 ) ( not ( = ?auto_742503 ?auto_742504 ) ) ( not ( = ?auto_742503 ?auto_742505 ) ) ( not ( = ?auto_742503 ?auto_742506 ) ) ( not ( = ?auto_742503 ?auto_742507 ) ) ( not ( = ?auto_742503 ?auto_742508 ) ) ( not ( = ?auto_742503 ?auto_742509 ) ) ( not ( = ?auto_742503 ?auto_742510 ) ) ( not ( = ?auto_742503 ?auto_742511 ) ) ( not ( = ?auto_742503 ?auto_742512 ) ) ( not ( = ?auto_742503 ?auto_742513 ) ) ( not ( = ?auto_742503 ?auto_742514 ) ) ( not ( = ?auto_742503 ?auto_742515 ) ) ( not ( = ?auto_742503 ?auto_742516 ) ) ( not ( = ?auto_742504 ?auto_742505 ) ) ( not ( = ?auto_742504 ?auto_742506 ) ) ( not ( = ?auto_742504 ?auto_742507 ) ) ( not ( = ?auto_742504 ?auto_742508 ) ) ( not ( = ?auto_742504 ?auto_742509 ) ) ( not ( = ?auto_742504 ?auto_742510 ) ) ( not ( = ?auto_742504 ?auto_742511 ) ) ( not ( = ?auto_742504 ?auto_742512 ) ) ( not ( = ?auto_742504 ?auto_742513 ) ) ( not ( = ?auto_742504 ?auto_742514 ) ) ( not ( = ?auto_742504 ?auto_742515 ) ) ( not ( = ?auto_742504 ?auto_742516 ) ) ( not ( = ?auto_742505 ?auto_742506 ) ) ( not ( = ?auto_742505 ?auto_742507 ) ) ( not ( = ?auto_742505 ?auto_742508 ) ) ( not ( = ?auto_742505 ?auto_742509 ) ) ( not ( = ?auto_742505 ?auto_742510 ) ) ( not ( = ?auto_742505 ?auto_742511 ) ) ( not ( = ?auto_742505 ?auto_742512 ) ) ( not ( = ?auto_742505 ?auto_742513 ) ) ( not ( = ?auto_742505 ?auto_742514 ) ) ( not ( = ?auto_742505 ?auto_742515 ) ) ( not ( = ?auto_742505 ?auto_742516 ) ) ( not ( = ?auto_742506 ?auto_742507 ) ) ( not ( = ?auto_742506 ?auto_742508 ) ) ( not ( = ?auto_742506 ?auto_742509 ) ) ( not ( = ?auto_742506 ?auto_742510 ) ) ( not ( = ?auto_742506 ?auto_742511 ) ) ( not ( = ?auto_742506 ?auto_742512 ) ) ( not ( = ?auto_742506 ?auto_742513 ) ) ( not ( = ?auto_742506 ?auto_742514 ) ) ( not ( = ?auto_742506 ?auto_742515 ) ) ( not ( = ?auto_742506 ?auto_742516 ) ) ( not ( = ?auto_742507 ?auto_742508 ) ) ( not ( = ?auto_742507 ?auto_742509 ) ) ( not ( = ?auto_742507 ?auto_742510 ) ) ( not ( = ?auto_742507 ?auto_742511 ) ) ( not ( = ?auto_742507 ?auto_742512 ) ) ( not ( = ?auto_742507 ?auto_742513 ) ) ( not ( = ?auto_742507 ?auto_742514 ) ) ( not ( = ?auto_742507 ?auto_742515 ) ) ( not ( = ?auto_742507 ?auto_742516 ) ) ( not ( = ?auto_742508 ?auto_742509 ) ) ( not ( = ?auto_742508 ?auto_742510 ) ) ( not ( = ?auto_742508 ?auto_742511 ) ) ( not ( = ?auto_742508 ?auto_742512 ) ) ( not ( = ?auto_742508 ?auto_742513 ) ) ( not ( = ?auto_742508 ?auto_742514 ) ) ( not ( = ?auto_742508 ?auto_742515 ) ) ( not ( = ?auto_742508 ?auto_742516 ) ) ( not ( = ?auto_742509 ?auto_742510 ) ) ( not ( = ?auto_742509 ?auto_742511 ) ) ( not ( = ?auto_742509 ?auto_742512 ) ) ( not ( = ?auto_742509 ?auto_742513 ) ) ( not ( = ?auto_742509 ?auto_742514 ) ) ( not ( = ?auto_742509 ?auto_742515 ) ) ( not ( = ?auto_742509 ?auto_742516 ) ) ( not ( = ?auto_742510 ?auto_742511 ) ) ( not ( = ?auto_742510 ?auto_742512 ) ) ( not ( = ?auto_742510 ?auto_742513 ) ) ( not ( = ?auto_742510 ?auto_742514 ) ) ( not ( = ?auto_742510 ?auto_742515 ) ) ( not ( = ?auto_742510 ?auto_742516 ) ) ( not ( = ?auto_742511 ?auto_742512 ) ) ( not ( = ?auto_742511 ?auto_742513 ) ) ( not ( = ?auto_742511 ?auto_742514 ) ) ( not ( = ?auto_742511 ?auto_742515 ) ) ( not ( = ?auto_742511 ?auto_742516 ) ) ( not ( = ?auto_742512 ?auto_742513 ) ) ( not ( = ?auto_742512 ?auto_742514 ) ) ( not ( = ?auto_742512 ?auto_742515 ) ) ( not ( = ?auto_742512 ?auto_742516 ) ) ( not ( = ?auto_742513 ?auto_742514 ) ) ( not ( = ?auto_742513 ?auto_742515 ) ) ( not ( = ?auto_742513 ?auto_742516 ) ) ( not ( = ?auto_742514 ?auto_742515 ) ) ( not ( = ?auto_742514 ?auto_742516 ) ) ( not ( = ?auto_742515 ?auto_742516 ) ) ( CLEAR ?auto_742513 ) ( ON ?auto_742514 ?auto_742515 ) ( CLEAR ?auto_742514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_742503 ?auto_742504 ?auto_742505 ?auto_742506 ?auto_742507 ?auto_742508 ?auto_742509 ?auto_742510 ?auto_742511 ?auto_742512 ?auto_742513 ?auto_742514 )
      ( MAKE-13PILE ?auto_742503 ?auto_742504 ?auto_742505 ?auto_742506 ?auto_742507 ?auto_742508 ?auto_742509 ?auto_742510 ?auto_742511 ?auto_742512 ?auto_742513 ?auto_742514 ?auto_742515 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_742557 - BLOCK
      ?auto_742558 - BLOCK
      ?auto_742559 - BLOCK
      ?auto_742560 - BLOCK
      ?auto_742561 - BLOCK
      ?auto_742562 - BLOCK
      ?auto_742563 - BLOCK
      ?auto_742564 - BLOCK
      ?auto_742565 - BLOCK
      ?auto_742566 - BLOCK
      ?auto_742567 - BLOCK
      ?auto_742568 - BLOCK
      ?auto_742569 - BLOCK
    )
    :vars
    (
      ?auto_742570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742569 ?auto_742570 ) ( ON-TABLE ?auto_742557 ) ( ON ?auto_742558 ?auto_742557 ) ( ON ?auto_742559 ?auto_742558 ) ( ON ?auto_742560 ?auto_742559 ) ( ON ?auto_742561 ?auto_742560 ) ( ON ?auto_742562 ?auto_742561 ) ( ON ?auto_742563 ?auto_742562 ) ( ON ?auto_742564 ?auto_742563 ) ( ON ?auto_742565 ?auto_742564 ) ( ON ?auto_742566 ?auto_742565 ) ( not ( = ?auto_742557 ?auto_742558 ) ) ( not ( = ?auto_742557 ?auto_742559 ) ) ( not ( = ?auto_742557 ?auto_742560 ) ) ( not ( = ?auto_742557 ?auto_742561 ) ) ( not ( = ?auto_742557 ?auto_742562 ) ) ( not ( = ?auto_742557 ?auto_742563 ) ) ( not ( = ?auto_742557 ?auto_742564 ) ) ( not ( = ?auto_742557 ?auto_742565 ) ) ( not ( = ?auto_742557 ?auto_742566 ) ) ( not ( = ?auto_742557 ?auto_742567 ) ) ( not ( = ?auto_742557 ?auto_742568 ) ) ( not ( = ?auto_742557 ?auto_742569 ) ) ( not ( = ?auto_742557 ?auto_742570 ) ) ( not ( = ?auto_742558 ?auto_742559 ) ) ( not ( = ?auto_742558 ?auto_742560 ) ) ( not ( = ?auto_742558 ?auto_742561 ) ) ( not ( = ?auto_742558 ?auto_742562 ) ) ( not ( = ?auto_742558 ?auto_742563 ) ) ( not ( = ?auto_742558 ?auto_742564 ) ) ( not ( = ?auto_742558 ?auto_742565 ) ) ( not ( = ?auto_742558 ?auto_742566 ) ) ( not ( = ?auto_742558 ?auto_742567 ) ) ( not ( = ?auto_742558 ?auto_742568 ) ) ( not ( = ?auto_742558 ?auto_742569 ) ) ( not ( = ?auto_742558 ?auto_742570 ) ) ( not ( = ?auto_742559 ?auto_742560 ) ) ( not ( = ?auto_742559 ?auto_742561 ) ) ( not ( = ?auto_742559 ?auto_742562 ) ) ( not ( = ?auto_742559 ?auto_742563 ) ) ( not ( = ?auto_742559 ?auto_742564 ) ) ( not ( = ?auto_742559 ?auto_742565 ) ) ( not ( = ?auto_742559 ?auto_742566 ) ) ( not ( = ?auto_742559 ?auto_742567 ) ) ( not ( = ?auto_742559 ?auto_742568 ) ) ( not ( = ?auto_742559 ?auto_742569 ) ) ( not ( = ?auto_742559 ?auto_742570 ) ) ( not ( = ?auto_742560 ?auto_742561 ) ) ( not ( = ?auto_742560 ?auto_742562 ) ) ( not ( = ?auto_742560 ?auto_742563 ) ) ( not ( = ?auto_742560 ?auto_742564 ) ) ( not ( = ?auto_742560 ?auto_742565 ) ) ( not ( = ?auto_742560 ?auto_742566 ) ) ( not ( = ?auto_742560 ?auto_742567 ) ) ( not ( = ?auto_742560 ?auto_742568 ) ) ( not ( = ?auto_742560 ?auto_742569 ) ) ( not ( = ?auto_742560 ?auto_742570 ) ) ( not ( = ?auto_742561 ?auto_742562 ) ) ( not ( = ?auto_742561 ?auto_742563 ) ) ( not ( = ?auto_742561 ?auto_742564 ) ) ( not ( = ?auto_742561 ?auto_742565 ) ) ( not ( = ?auto_742561 ?auto_742566 ) ) ( not ( = ?auto_742561 ?auto_742567 ) ) ( not ( = ?auto_742561 ?auto_742568 ) ) ( not ( = ?auto_742561 ?auto_742569 ) ) ( not ( = ?auto_742561 ?auto_742570 ) ) ( not ( = ?auto_742562 ?auto_742563 ) ) ( not ( = ?auto_742562 ?auto_742564 ) ) ( not ( = ?auto_742562 ?auto_742565 ) ) ( not ( = ?auto_742562 ?auto_742566 ) ) ( not ( = ?auto_742562 ?auto_742567 ) ) ( not ( = ?auto_742562 ?auto_742568 ) ) ( not ( = ?auto_742562 ?auto_742569 ) ) ( not ( = ?auto_742562 ?auto_742570 ) ) ( not ( = ?auto_742563 ?auto_742564 ) ) ( not ( = ?auto_742563 ?auto_742565 ) ) ( not ( = ?auto_742563 ?auto_742566 ) ) ( not ( = ?auto_742563 ?auto_742567 ) ) ( not ( = ?auto_742563 ?auto_742568 ) ) ( not ( = ?auto_742563 ?auto_742569 ) ) ( not ( = ?auto_742563 ?auto_742570 ) ) ( not ( = ?auto_742564 ?auto_742565 ) ) ( not ( = ?auto_742564 ?auto_742566 ) ) ( not ( = ?auto_742564 ?auto_742567 ) ) ( not ( = ?auto_742564 ?auto_742568 ) ) ( not ( = ?auto_742564 ?auto_742569 ) ) ( not ( = ?auto_742564 ?auto_742570 ) ) ( not ( = ?auto_742565 ?auto_742566 ) ) ( not ( = ?auto_742565 ?auto_742567 ) ) ( not ( = ?auto_742565 ?auto_742568 ) ) ( not ( = ?auto_742565 ?auto_742569 ) ) ( not ( = ?auto_742565 ?auto_742570 ) ) ( not ( = ?auto_742566 ?auto_742567 ) ) ( not ( = ?auto_742566 ?auto_742568 ) ) ( not ( = ?auto_742566 ?auto_742569 ) ) ( not ( = ?auto_742566 ?auto_742570 ) ) ( not ( = ?auto_742567 ?auto_742568 ) ) ( not ( = ?auto_742567 ?auto_742569 ) ) ( not ( = ?auto_742567 ?auto_742570 ) ) ( not ( = ?auto_742568 ?auto_742569 ) ) ( not ( = ?auto_742568 ?auto_742570 ) ) ( not ( = ?auto_742569 ?auto_742570 ) ) ( ON ?auto_742568 ?auto_742569 ) ( CLEAR ?auto_742566 ) ( ON ?auto_742567 ?auto_742568 ) ( CLEAR ?auto_742567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_742557 ?auto_742558 ?auto_742559 ?auto_742560 ?auto_742561 ?auto_742562 ?auto_742563 ?auto_742564 ?auto_742565 ?auto_742566 ?auto_742567 )
      ( MAKE-13PILE ?auto_742557 ?auto_742558 ?auto_742559 ?auto_742560 ?auto_742561 ?auto_742562 ?auto_742563 ?auto_742564 ?auto_742565 ?auto_742566 ?auto_742567 ?auto_742568 ?auto_742569 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_742611 - BLOCK
      ?auto_742612 - BLOCK
      ?auto_742613 - BLOCK
      ?auto_742614 - BLOCK
      ?auto_742615 - BLOCK
      ?auto_742616 - BLOCK
      ?auto_742617 - BLOCK
      ?auto_742618 - BLOCK
      ?auto_742619 - BLOCK
      ?auto_742620 - BLOCK
      ?auto_742621 - BLOCK
      ?auto_742622 - BLOCK
      ?auto_742623 - BLOCK
    )
    :vars
    (
      ?auto_742624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742623 ?auto_742624 ) ( ON-TABLE ?auto_742611 ) ( ON ?auto_742612 ?auto_742611 ) ( ON ?auto_742613 ?auto_742612 ) ( ON ?auto_742614 ?auto_742613 ) ( ON ?auto_742615 ?auto_742614 ) ( ON ?auto_742616 ?auto_742615 ) ( ON ?auto_742617 ?auto_742616 ) ( ON ?auto_742618 ?auto_742617 ) ( ON ?auto_742619 ?auto_742618 ) ( not ( = ?auto_742611 ?auto_742612 ) ) ( not ( = ?auto_742611 ?auto_742613 ) ) ( not ( = ?auto_742611 ?auto_742614 ) ) ( not ( = ?auto_742611 ?auto_742615 ) ) ( not ( = ?auto_742611 ?auto_742616 ) ) ( not ( = ?auto_742611 ?auto_742617 ) ) ( not ( = ?auto_742611 ?auto_742618 ) ) ( not ( = ?auto_742611 ?auto_742619 ) ) ( not ( = ?auto_742611 ?auto_742620 ) ) ( not ( = ?auto_742611 ?auto_742621 ) ) ( not ( = ?auto_742611 ?auto_742622 ) ) ( not ( = ?auto_742611 ?auto_742623 ) ) ( not ( = ?auto_742611 ?auto_742624 ) ) ( not ( = ?auto_742612 ?auto_742613 ) ) ( not ( = ?auto_742612 ?auto_742614 ) ) ( not ( = ?auto_742612 ?auto_742615 ) ) ( not ( = ?auto_742612 ?auto_742616 ) ) ( not ( = ?auto_742612 ?auto_742617 ) ) ( not ( = ?auto_742612 ?auto_742618 ) ) ( not ( = ?auto_742612 ?auto_742619 ) ) ( not ( = ?auto_742612 ?auto_742620 ) ) ( not ( = ?auto_742612 ?auto_742621 ) ) ( not ( = ?auto_742612 ?auto_742622 ) ) ( not ( = ?auto_742612 ?auto_742623 ) ) ( not ( = ?auto_742612 ?auto_742624 ) ) ( not ( = ?auto_742613 ?auto_742614 ) ) ( not ( = ?auto_742613 ?auto_742615 ) ) ( not ( = ?auto_742613 ?auto_742616 ) ) ( not ( = ?auto_742613 ?auto_742617 ) ) ( not ( = ?auto_742613 ?auto_742618 ) ) ( not ( = ?auto_742613 ?auto_742619 ) ) ( not ( = ?auto_742613 ?auto_742620 ) ) ( not ( = ?auto_742613 ?auto_742621 ) ) ( not ( = ?auto_742613 ?auto_742622 ) ) ( not ( = ?auto_742613 ?auto_742623 ) ) ( not ( = ?auto_742613 ?auto_742624 ) ) ( not ( = ?auto_742614 ?auto_742615 ) ) ( not ( = ?auto_742614 ?auto_742616 ) ) ( not ( = ?auto_742614 ?auto_742617 ) ) ( not ( = ?auto_742614 ?auto_742618 ) ) ( not ( = ?auto_742614 ?auto_742619 ) ) ( not ( = ?auto_742614 ?auto_742620 ) ) ( not ( = ?auto_742614 ?auto_742621 ) ) ( not ( = ?auto_742614 ?auto_742622 ) ) ( not ( = ?auto_742614 ?auto_742623 ) ) ( not ( = ?auto_742614 ?auto_742624 ) ) ( not ( = ?auto_742615 ?auto_742616 ) ) ( not ( = ?auto_742615 ?auto_742617 ) ) ( not ( = ?auto_742615 ?auto_742618 ) ) ( not ( = ?auto_742615 ?auto_742619 ) ) ( not ( = ?auto_742615 ?auto_742620 ) ) ( not ( = ?auto_742615 ?auto_742621 ) ) ( not ( = ?auto_742615 ?auto_742622 ) ) ( not ( = ?auto_742615 ?auto_742623 ) ) ( not ( = ?auto_742615 ?auto_742624 ) ) ( not ( = ?auto_742616 ?auto_742617 ) ) ( not ( = ?auto_742616 ?auto_742618 ) ) ( not ( = ?auto_742616 ?auto_742619 ) ) ( not ( = ?auto_742616 ?auto_742620 ) ) ( not ( = ?auto_742616 ?auto_742621 ) ) ( not ( = ?auto_742616 ?auto_742622 ) ) ( not ( = ?auto_742616 ?auto_742623 ) ) ( not ( = ?auto_742616 ?auto_742624 ) ) ( not ( = ?auto_742617 ?auto_742618 ) ) ( not ( = ?auto_742617 ?auto_742619 ) ) ( not ( = ?auto_742617 ?auto_742620 ) ) ( not ( = ?auto_742617 ?auto_742621 ) ) ( not ( = ?auto_742617 ?auto_742622 ) ) ( not ( = ?auto_742617 ?auto_742623 ) ) ( not ( = ?auto_742617 ?auto_742624 ) ) ( not ( = ?auto_742618 ?auto_742619 ) ) ( not ( = ?auto_742618 ?auto_742620 ) ) ( not ( = ?auto_742618 ?auto_742621 ) ) ( not ( = ?auto_742618 ?auto_742622 ) ) ( not ( = ?auto_742618 ?auto_742623 ) ) ( not ( = ?auto_742618 ?auto_742624 ) ) ( not ( = ?auto_742619 ?auto_742620 ) ) ( not ( = ?auto_742619 ?auto_742621 ) ) ( not ( = ?auto_742619 ?auto_742622 ) ) ( not ( = ?auto_742619 ?auto_742623 ) ) ( not ( = ?auto_742619 ?auto_742624 ) ) ( not ( = ?auto_742620 ?auto_742621 ) ) ( not ( = ?auto_742620 ?auto_742622 ) ) ( not ( = ?auto_742620 ?auto_742623 ) ) ( not ( = ?auto_742620 ?auto_742624 ) ) ( not ( = ?auto_742621 ?auto_742622 ) ) ( not ( = ?auto_742621 ?auto_742623 ) ) ( not ( = ?auto_742621 ?auto_742624 ) ) ( not ( = ?auto_742622 ?auto_742623 ) ) ( not ( = ?auto_742622 ?auto_742624 ) ) ( not ( = ?auto_742623 ?auto_742624 ) ) ( ON ?auto_742622 ?auto_742623 ) ( ON ?auto_742621 ?auto_742622 ) ( CLEAR ?auto_742619 ) ( ON ?auto_742620 ?auto_742621 ) ( CLEAR ?auto_742620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_742611 ?auto_742612 ?auto_742613 ?auto_742614 ?auto_742615 ?auto_742616 ?auto_742617 ?auto_742618 ?auto_742619 ?auto_742620 )
      ( MAKE-13PILE ?auto_742611 ?auto_742612 ?auto_742613 ?auto_742614 ?auto_742615 ?auto_742616 ?auto_742617 ?auto_742618 ?auto_742619 ?auto_742620 ?auto_742621 ?auto_742622 ?auto_742623 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_742665 - BLOCK
      ?auto_742666 - BLOCK
      ?auto_742667 - BLOCK
      ?auto_742668 - BLOCK
      ?auto_742669 - BLOCK
      ?auto_742670 - BLOCK
      ?auto_742671 - BLOCK
      ?auto_742672 - BLOCK
      ?auto_742673 - BLOCK
      ?auto_742674 - BLOCK
      ?auto_742675 - BLOCK
      ?auto_742676 - BLOCK
      ?auto_742677 - BLOCK
    )
    :vars
    (
      ?auto_742678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742677 ?auto_742678 ) ( ON-TABLE ?auto_742665 ) ( ON ?auto_742666 ?auto_742665 ) ( ON ?auto_742667 ?auto_742666 ) ( ON ?auto_742668 ?auto_742667 ) ( ON ?auto_742669 ?auto_742668 ) ( ON ?auto_742670 ?auto_742669 ) ( ON ?auto_742671 ?auto_742670 ) ( ON ?auto_742672 ?auto_742671 ) ( not ( = ?auto_742665 ?auto_742666 ) ) ( not ( = ?auto_742665 ?auto_742667 ) ) ( not ( = ?auto_742665 ?auto_742668 ) ) ( not ( = ?auto_742665 ?auto_742669 ) ) ( not ( = ?auto_742665 ?auto_742670 ) ) ( not ( = ?auto_742665 ?auto_742671 ) ) ( not ( = ?auto_742665 ?auto_742672 ) ) ( not ( = ?auto_742665 ?auto_742673 ) ) ( not ( = ?auto_742665 ?auto_742674 ) ) ( not ( = ?auto_742665 ?auto_742675 ) ) ( not ( = ?auto_742665 ?auto_742676 ) ) ( not ( = ?auto_742665 ?auto_742677 ) ) ( not ( = ?auto_742665 ?auto_742678 ) ) ( not ( = ?auto_742666 ?auto_742667 ) ) ( not ( = ?auto_742666 ?auto_742668 ) ) ( not ( = ?auto_742666 ?auto_742669 ) ) ( not ( = ?auto_742666 ?auto_742670 ) ) ( not ( = ?auto_742666 ?auto_742671 ) ) ( not ( = ?auto_742666 ?auto_742672 ) ) ( not ( = ?auto_742666 ?auto_742673 ) ) ( not ( = ?auto_742666 ?auto_742674 ) ) ( not ( = ?auto_742666 ?auto_742675 ) ) ( not ( = ?auto_742666 ?auto_742676 ) ) ( not ( = ?auto_742666 ?auto_742677 ) ) ( not ( = ?auto_742666 ?auto_742678 ) ) ( not ( = ?auto_742667 ?auto_742668 ) ) ( not ( = ?auto_742667 ?auto_742669 ) ) ( not ( = ?auto_742667 ?auto_742670 ) ) ( not ( = ?auto_742667 ?auto_742671 ) ) ( not ( = ?auto_742667 ?auto_742672 ) ) ( not ( = ?auto_742667 ?auto_742673 ) ) ( not ( = ?auto_742667 ?auto_742674 ) ) ( not ( = ?auto_742667 ?auto_742675 ) ) ( not ( = ?auto_742667 ?auto_742676 ) ) ( not ( = ?auto_742667 ?auto_742677 ) ) ( not ( = ?auto_742667 ?auto_742678 ) ) ( not ( = ?auto_742668 ?auto_742669 ) ) ( not ( = ?auto_742668 ?auto_742670 ) ) ( not ( = ?auto_742668 ?auto_742671 ) ) ( not ( = ?auto_742668 ?auto_742672 ) ) ( not ( = ?auto_742668 ?auto_742673 ) ) ( not ( = ?auto_742668 ?auto_742674 ) ) ( not ( = ?auto_742668 ?auto_742675 ) ) ( not ( = ?auto_742668 ?auto_742676 ) ) ( not ( = ?auto_742668 ?auto_742677 ) ) ( not ( = ?auto_742668 ?auto_742678 ) ) ( not ( = ?auto_742669 ?auto_742670 ) ) ( not ( = ?auto_742669 ?auto_742671 ) ) ( not ( = ?auto_742669 ?auto_742672 ) ) ( not ( = ?auto_742669 ?auto_742673 ) ) ( not ( = ?auto_742669 ?auto_742674 ) ) ( not ( = ?auto_742669 ?auto_742675 ) ) ( not ( = ?auto_742669 ?auto_742676 ) ) ( not ( = ?auto_742669 ?auto_742677 ) ) ( not ( = ?auto_742669 ?auto_742678 ) ) ( not ( = ?auto_742670 ?auto_742671 ) ) ( not ( = ?auto_742670 ?auto_742672 ) ) ( not ( = ?auto_742670 ?auto_742673 ) ) ( not ( = ?auto_742670 ?auto_742674 ) ) ( not ( = ?auto_742670 ?auto_742675 ) ) ( not ( = ?auto_742670 ?auto_742676 ) ) ( not ( = ?auto_742670 ?auto_742677 ) ) ( not ( = ?auto_742670 ?auto_742678 ) ) ( not ( = ?auto_742671 ?auto_742672 ) ) ( not ( = ?auto_742671 ?auto_742673 ) ) ( not ( = ?auto_742671 ?auto_742674 ) ) ( not ( = ?auto_742671 ?auto_742675 ) ) ( not ( = ?auto_742671 ?auto_742676 ) ) ( not ( = ?auto_742671 ?auto_742677 ) ) ( not ( = ?auto_742671 ?auto_742678 ) ) ( not ( = ?auto_742672 ?auto_742673 ) ) ( not ( = ?auto_742672 ?auto_742674 ) ) ( not ( = ?auto_742672 ?auto_742675 ) ) ( not ( = ?auto_742672 ?auto_742676 ) ) ( not ( = ?auto_742672 ?auto_742677 ) ) ( not ( = ?auto_742672 ?auto_742678 ) ) ( not ( = ?auto_742673 ?auto_742674 ) ) ( not ( = ?auto_742673 ?auto_742675 ) ) ( not ( = ?auto_742673 ?auto_742676 ) ) ( not ( = ?auto_742673 ?auto_742677 ) ) ( not ( = ?auto_742673 ?auto_742678 ) ) ( not ( = ?auto_742674 ?auto_742675 ) ) ( not ( = ?auto_742674 ?auto_742676 ) ) ( not ( = ?auto_742674 ?auto_742677 ) ) ( not ( = ?auto_742674 ?auto_742678 ) ) ( not ( = ?auto_742675 ?auto_742676 ) ) ( not ( = ?auto_742675 ?auto_742677 ) ) ( not ( = ?auto_742675 ?auto_742678 ) ) ( not ( = ?auto_742676 ?auto_742677 ) ) ( not ( = ?auto_742676 ?auto_742678 ) ) ( not ( = ?auto_742677 ?auto_742678 ) ) ( ON ?auto_742676 ?auto_742677 ) ( ON ?auto_742675 ?auto_742676 ) ( ON ?auto_742674 ?auto_742675 ) ( CLEAR ?auto_742672 ) ( ON ?auto_742673 ?auto_742674 ) ( CLEAR ?auto_742673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_742665 ?auto_742666 ?auto_742667 ?auto_742668 ?auto_742669 ?auto_742670 ?auto_742671 ?auto_742672 ?auto_742673 )
      ( MAKE-13PILE ?auto_742665 ?auto_742666 ?auto_742667 ?auto_742668 ?auto_742669 ?auto_742670 ?auto_742671 ?auto_742672 ?auto_742673 ?auto_742674 ?auto_742675 ?auto_742676 ?auto_742677 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_742719 - BLOCK
      ?auto_742720 - BLOCK
      ?auto_742721 - BLOCK
      ?auto_742722 - BLOCK
      ?auto_742723 - BLOCK
      ?auto_742724 - BLOCK
      ?auto_742725 - BLOCK
      ?auto_742726 - BLOCK
      ?auto_742727 - BLOCK
      ?auto_742728 - BLOCK
      ?auto_742729 - BLOCK
      ?auto_742730 - BLOCK
      ?auto_742731 - BLOCK
    )
    :vars
    (
      ?auto_742732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742731 ?auto_742732 ) ( ON-TABLE ?auto_742719 ) ( ON ?auto_742720 ?auto_742719 ) ( ON ?auto_742721 ?auto_742720 ) ( ON ?auto_742722 ?auto_742721 ) ( ON ?auto_742723 ?auto_742722 ) ( ON ?auto_742724 ?auto_742723 ) ( ON ?auto_742725 ?auto_742724 ) ( not ( = ?auto_742719 ?auto_742720 ) ) ( not ( = ?auto_742719 ?auto_742721 ) ) ( not ( = ?auto_742719 ?auto_742722 ) ) ( not ( = ?auto_742719 ?auto_742723 ) ) ( not ( = ?auto_742719 ?auto_742724 ) ) ( not ( = ?auto_742719 ?auto_742725 ) ) ( not ( = ?auto_742719 ?auto_742726 ) ) ( not ( = ?auto_742719 ?auto_742727 ) ) ( not ( = ?auto_742719 ?auto_742728 ) ) ( not ( = ?auto_742719 ?auto_742729 ) ) ( not ( = ?auto_742719 ?auto_742730 ) ) ( not ( = ?auto_742719 ?auto_742731 ) ) ( not ( = ?auto_742719 ?auto_742732 ) ) ( not ( = ?auto_742720 ?auto_742721 ) ) ( not ( = ?auto_742720 ?auto_742722 ) ) ( not ( = ?auto_742720 ?auto_742723 ) ) ( not ( = ?auto_742720 ?auto_742724 ) ) ( not ( = ?auto_742720 ?auto_742725 ) ) ( not ( = ?auto_742720 ?auto_742726 ) ) ( not ( = ?auto_742720 ?auto_742727 ) ) ( not ( = ?auto_742720 ?auto_742728 ) ) ( not ( = ?auto_742720 ?auto_742729 ) ) ( not ( = ?auto_742720 ?auto_742730 ) ) ( not ( = ?auto_742720 ?auto_742731 ) ) ( not ( = ?auto_742720 ?auto_742732 ) ) ( not ( = ?auto_742721 ?auto_742722 ) ) ( not ( = ?auto_742721 ?auto_742723 ) ) ( not ( = ?auto_742721 ?auto_742724 ) ) ( not ( = ?auto_742721 ?auto_742725 ) ) ( not ( = ?auto_742721 ?auto_742726 ) ) ( not ( = ?auto_742721 ?auto_742727 ) ) ( not ( = ?auto_742721 ?auto_742728 ) ) ( not ( = ?auto_742721 ?auto_742729 ) ) ( not ( = ?auto_742721 ?auto_742730 ) ) ( not ( = ?auto_742721 ?auto_742731 ) ) ( not ( = ?auto_742721 ?auto_742732 ) ) ( not ( = ?auto_742722 ?auto_742723 ) ) ( not ( = ?auto_742722 ?auto_742724 ) ) ( not ( = ?auto_742722 ?auto_742725 ) ) ( not ( = ?auto_742722 ?auto_742726 ) ) ( not ( = ?auto_742722 ?auto_742727 ) ) ( not ( = ?auto_742722 ?auto_742728 ) ) ( not ( = ?auto_742722 ?auto_742729 ) ) ( not ( = ?auto_742722 ?auto_742730 ) ) ( not ( = ?auto_742722 ?auto_742731 ) ) ( not ( = ?auto_742722 ?auto_742732 ) ) ( not ( = ?auto_742723 ?auto_742724 ) ) ( not ( = ?auto_742723 ?auto_742725 ) ) ( not ( = ?auto_742723 ?auto_742726 ) ) ( not ( = ?auto_742723 ?auto_742727 ) ) ( not ( = ?auto_742723 ?auto_742728 ) ) ( not ( = ?auto_742723 ?auto_742729 ) ) ( not ( = ?auto_742723 ?auto_742730 ) ) ( not ( = ?auto_742723 ?auto_742731 ) ) ( not ( = ?auto_742723 ?auto_742732 ) ) ( not ( = ?auto_742724 ?auto_742725 ) ) ( not ( = ?auto_742724 ?auto_742726 ) ) ( not ( = ?auto_742724 ?auto_742727 ) ) ( not ( = ?auto_742724 ?auto_742728 ) ) ( not ( = ?auto_742724 ?auto_742729 ) ) ( not ( = ?auto_742724 ?auto_742730 ) ) ( not ( = ?auto_742724 ?auto_742731 ) ) ( not ( = ?auto_742724 ?auto_742732 ) ) ( not ( = ?auto_742725 ?auto_742726 ) ) ( not ( = ?auto_742725 ?auto_742727 ) ) ( not ( = ?auto_742725 ?auto_742728 ) ) ( not ( = ?auto_742725 ?auto_742729 ) ) ( not ( = ?auto_742725 ?auto_742730 ) ) ( not ( = ?auto_742725 ?auto_742731 ) ) ( not ( = ?auto_742725 ?auto_742732 ) ) ( not ( = ?auto_742726 ?auto_742727 ) ) ( not ( = ?auto_742726 ?auto_742728 ) ) ( not ( = ?auto_742726 ?auto_742729 ) ) ( not ( = ?auto_742726 ?auto_742730 ) ) ( not ( = ?auto_742726 ?auto_742731 ) ) ( not ( = ?auto_742726 ?auto_742732 ) ) ( not ( = ?auto_742727 ?auto_742728 ) ) ( not ( = ?auto_742727 ?auto_742729 ) ) ( not ( = ?auto_742727 ?auto_742730 ) ) ( not ( = ?auto_742727 ?auto_742731 ) ) ( not ( = ?auto_742727 ?auto_742732 ) ) ( not ( = ?auto_742728 ?auto_742729 ) ) ( not ( = ?auto_742728 ?auto_742730 ) ) ( not ( = ?auto_742728 ?auto_742731 ) ) ( not ( = ?auto_742728 ?auto_742732 ) ) ( not ( = ?auto_742729 ?auto_742730 ) ) ( not ( = ?auto_742729 ?auto_742731 ) ) ( not ( = ?auto_742729 ?auto_742732 ) ) ( not ( = ?auto_742730 ?auto_742731 ) ) ( not ( = ?auto_742730 ?auto_742732 ) ) ( not ( = ?auto_742731 ?auto_742732 ) ) ( ON ?auto_742730 ?auto_742731 ) ( ON ?auto_742729 ?auto_742730 ) ( ON ?auto_742728 ?auto_742729 ) ( ON ?auto_742727 ?auto_742728 ) ( CLEAR ?auto_742725 ) ( ON ?auto_742726 ?auto_742727 ) ( CLEAR ?auto_742726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_742719 ?auto_742720 ?auto_742721 ?auto_742722 ?auto_742723 ?auto_742724 ?auto_742725 ?auto_742726 )
      ( MAKE-13PILE ?auto_742719 ?auto_742720 ?auto_742721 ?auto_742722 ?auto_742723 ?auto_742724 ?auto_742725 ?auto_742726 ?auto_742727 ?auto_742728 ?auto_742729 ?auto_742730 ?auto_742731 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_742773 - BLOCK
      ?auto_742774 - BLOCK
      ?auto_742775 - BLOCK
      ?auto_742776 - BLOCK
      ?auto_742777 - BLOCK
      ?auto_742778 - BLOCK
      ?auto_742779 - BLOCK
      ?auto_742780 - BLOCK
      ?auto_742781 - BLOCK
      ?auto_742782 - BLOCK
      ?auto_742783 - BLOCK
      ?auto_742784 - BLOCK
      ?auto_742785 - BLOCK
    )
    :vars
    (
      ?auto_742786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742785 ?auto_742786 ) ( ON-TABLE ?auto_742773 ) ( ON ?auto_742774 ?auto_742773 ) ( ON ?auto_742775 ?auto_742774 ) ( ON ?auto_742776 ?auto_742775 ) ( ON ?auto_742777 ?auto_742776 ) ( ON ?auto_742778 ?auto_742777 ) ( not ( = ?auto_742773 ?auto_742774 ) ) ( not ( = ?auto_742773 ?auto_742775 ) ) ( not ( = ?auto_742773 ?auto_742776 ) ) ( not ( = ?auto_742773 ?auto_742777 ) ) ( not ( = ?auto_742773 ?auto_742778 ) ) ( not ( = ?auto_742773 ?auto_742779 ) ) ( not ( = ?auto_742773 ?auto_742780 ) ) ( not ( = ?auto_742773 ?auto_742781 ) ) ( not ( = ?auto_742773 ?auto_742782 ) ) ( not ( = ?auto_742773 ?auto_742783 ) ) ( not ( = ?auto_742773 ?auto_742784 ) ) ( not ( = ?auto_742773 ?auto_742785 ) ) ( not ( = ?auto_742773 ?auto_742786 ) ) ( not ( = ?auto_742774 ?auto_742775 ) ) ( not ( = ?auto_742774 ?auto_742776 ) ) ( not ( = ?auto_742774 ?auto_742777 ) ) ( not ( = ?auto_742774 ?auto_742778 ) ) ( not ( = ?auto_742774 ?auto_742779 ) ) ( not ( = ?auto_742774 ?auto_742780 ) ) ( not ( = ?auto_742774 ?auto_742781 ) ) ( not ( = ?auto_742774 ?auto_742782 ) ) ( not ( = ?auto_742774 ?auto_742783 ) ) ( not ( = ?auto_742774 ?auto_742784 ) ) ( not ( = ?auto_742774 ?auto_742785 ) ) ( not ( = ?auto_742774 ?auto_742786 ) ) ( not ( = ?auto_742775 ?auto_742776 ) ) ( not ( = ?auto_742775 ?auto_742777 ) ) ( not ( = ?auto_742775 ?auto_742778 ) ) ( not ( = ?auto_742775 ?auto_742779 ) ) ( not ( = ?auto_742775 ?auto_742780 ) ) ( not ( = ?auto_742775 ?auto_742781 ) ) ( not ( = ?auto_742775 ?auto_742782 ) ) ( not ( = ?auto_742775 ?auto_742783 ) ) ( not ( = ?auto_742775 ?auto_742784 ) ) ( not ( = ?auto_742775 ?auto_742785 ) ) ( not ( = ?auto_742775 ?auto_742786 ) ) ( not ( = ?auto_742776 ?auto_742777 ) ) ( not ( = ?auto_742776 ?auto_742778 ) ) ( not ( = ?auto_742776 ?auto_742779 ) ) ( not ( = ?auto_742776 ?auto_742780 ) ) ( not ( = ?auto_742776 ?auto_742781 ) ) ( not ( = ?auto_742776 ?auto_742782 ) ) ( not ( = ?auto_742776 ?auto_742783 ) ) ( not ( = ?auto_742776 ?auto_742784 ) ) ( not ( = ?auto_742776 ?auto_742785 ) ) ( not ( = ?auto_742776 ?auto_742786 ) ) ( not ( = ?auto_742777 ?auto_742778 ) ) ( not ( = ?auto_742777 ?auto_742779 ) ) ( not ( = ?auto_742777 ?auto_742780 ) ) ( not ( = ?auto_742777 ?auto_742781 ) ) ( not ( = ?auto_742777 ?auto_742782 ) ) ( not ( = ?auto_742777 ?auto_742783 ) ) ( not ( = ?auto_742777 ?auto_742784 ) ) ( not ( = ?auto_742777 ?auto_742785 ) ) ( not ( = ?auto_742777 ?auto_742786 ) ) ( not ( = ?auto_742778 ?auto_742779 ) ) ( not ( = ?auto_742778 ?auto_742780 ) ) ( not ( = ?auto_742778 ?auto_742781 ) ) ( not ( = ?auto_742778 ?auto_742782 ) ) ( not ( = ?auto_742778 ?auto_742783 ) ) ( not ( = ?auto_742778 ?auto_742784 ) ) ( not ( = ?auto_742778 ?auto_742785 ) ) ( not ( = ?auto_742778 ?auto_742786 ) ) ( not ( = ?auto_742779 ?auto_742780 ) ) ( not ( = ?auto_742779 ?auto_742781 ) ) ( not ( = ?auto_742779 ?auto_742782 ) ) ( not ( = ?auto_742779 ?auto_742783 ) ) ( not ( = ?auto_742779 ?auto_742784 ) ) ( not ( = ?auto_742779 ?auto_742785 ) ) ( not ( = ?auto_742779 ?auto_742786 ) ) ( not ( = ?auto_742780 ?auto_742781 ) ) ( not ( = ?auto_742780 ?auto_742782 ) ) ( not ( = ?auto_742780 ?auto_742783 ) ) ( not ( = ?auto_742780 ?auto_742784 ) ) ( not ( = ?auto_742780 ?auto_742785 ) ) ( not ( = ?auto_742780 ?auto_742786 ) ) ( not ( = ?auto_742781 ?auto_742782 ) ) ( not ( = ?auto_742781 ?auto_742783 ) ) ( not ( = ?auto_742781 ?auto_742784 ) ) ( not ( = ?auto_742781 ?auto_742785 ) ) ( not ( = ?auto_742781 ?auto_742786 ) ) ( not ( = ?auto_742782 ?auto_742783 ) ) ( not ( = ?auto_742782 ?auto_742784 ) ) ( not ( = ?auto_742782 ?auto_742785 ) ) ( not ( = ?auto_742782 ?auto_742786 ) ) ( not ( = ?auto_742783 ?auto_742784 ) ) ( not ( = ?auto_742783 ?auto_742785 ) ) ( not ( = ?auto_742783 ?auto_742786 ) ) ( not ( = ?auto_742784 ?auto_742785 ) ) ( not ( = ?auto_742784 ?auto_742786 ) ) ( not ( = ?auto_742785 ?auto_742786 ) ) ( ON ?auto_742784 ?auto_742785 ) ( ON ?auto_742783 ?auto_742784 ) ( ON ?auto_742782 ?auto_742783 ) ( ON ?auto_742781 ?auto_742782 ) ( ON ?auto_742780 ?auto_742781 ) ( CLEAR ?auto_742778 ) ( ON ?auto_742779 ?auto_742780 ) ( CLEAR ?auto_742779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_742773 ?auto_742774 ?auto_742775 ?auto_742776 ?auto_742777 ?auto_742778 ?auto_742779 )
      ( MAKE-13PILE ?auto_742773 ?auto_742774 ?auto_742775 ?auto_742776 ?auto_742777 ?auto_742778 ?auto_742779 ?auto_742780 ?auto_742781 ?auto_742782 ?auto_742783 ?auto_742784 ?auto_742785 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_742827 - BLOCK
      ?auto_742828 - BLOCK
      ?auto_742829 - BLOCK
      ?auto_742830 - BLOCK
      ?auto_742831 - BLOCK
      ?auto_742832 - BLOCK
      ?auto_742833 - BLOCK
      ?auto_742834 - BLOCK
      ?auto_742835 - BLOCK
      ?auto_742836 - BLOCK
      ?auto_742837 - BLOCK
      ?auto_742838 - BLOCK
      ?auto_742839 - BLOCK
    )
    :vars
    (
      ?auto_742840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742839 ?auto_742840 ) ( ON-TABLE ?auto_742827 ) ( ON ?auto_742828 ?auto_742827 ) ( ON ?auto_742829 ?auto_742828 ) ( ON ?auto_742830 ?auto_742829 ) ( ON ?auto_742831 ?auto_742830 ) ( not ( = ?auto_742827 ?auto_742828 ) ) ( not ( = ?auto_742827 ?auto_742829 ) ) ( not ( = ?auto_742827 ?auto_742830 ) ) ( not ( = ?auto_742827 ?auto_742831 ) ) ( not ( = ?auto_742827 ?auto_742832 ) ) ( not ( = ?auto_742827 ?auto_742833 ) ) ( not ( = ?auto_742827 ?auto_742834 ) ) ( not ( = ?auto_742827 ?auto_742835 ) ) ( not ( = ?auto_742827 ?auto_742836 ) ) ( not ( = ?auto_742827 ?auto_742837 ) ) ( not ( = ?auto_742827 ?auto_742838 ) ) ( not ( = ?auto_742827 ?auto_742839 ) ) ( not ( = ?auto_742827 ?auto_742840 ) ) ( not ( = ?auto_742828 ?auto_742829 ) ) ( not ( = ?auto_742828 ?auto_742830 ) ) ( not ( = ?auto_742828 ?auto_742831 ) ) ( not ( = ?auto_742828 ?auto_742832 ) ) ( not ( = ?auto_742828 ?auto_742833 ) ) ( not ( = ?auto_742828 ?auto_742834 ) ) ( not ( = ?auto_742828 ?auto_742835 ) ) ( not ( = ?auto_742828 ?auto_742836 ) ) ( not ( = ?auto_742828 ?auto_742837 ) ) ( not ( = ?auto_742828 ?auto_742838 ) ) ( not ( = ?auto_742828 ?auto_742839 ) ) ( not ( = ?auto_742828 ?auto_742840 ) ) ( not ( = ?auto_742829 ?auto_742830 ) ) ( not ( = ?auto_742829 ?auto_742831 ) ) ( not ( = ?auto_742829 ?auto_742832 ) ) ( not ( = ?auto_742829 ?auto_742833 ) ) ( not ( = ?auto_742829 ?auto_742834 ) ) ( not ( = ?auto_742829 ?auto_742835 ) ) ( not ( = ?auto_742829 ?auto_742836 ) ) ( not ( = ?auto_742829 ?auto_742837 ) ) ( not ( = ?auto_742829 ?auto_742838 ) ) ( not ( = ?auto_742829 ?auto_742839 ) ) ( not ( = ?auto_742829 ?auto_742840 ) ) ( not ( = ?auto_742830 ?auto_742831 ) ) ( not ( = ?auto_742830 ?auto_742832 ) ) ( not ( = ?auto_742830 ?auto_742833 ) ) ( not ( = ?auto_742830 ?auto_742834 ) ) ( not ( = ?auto_742830 ?auto_742835 ) ) ( not ( = ?auto_742830 ?auto_742836 ) ) ( not ( = ?auto_742830 ?auto_742837 ) ) ( not ( = ?auto_742830 ?auto_742838 ) ) ( not ( = ?auto_742830 ?auto_742839 ) ) ( not ( = ?auto_742830 ?auto_742840 ) ) ( not ( = ?auto_742831 ?auto_742832 ) ) ( not ( = ?auto_742831 ?auto_742833 ) ) ( not ( = ?auto_742831 ?auto_742834 ) ) ( not ( = ?auto_742831 ?auto_742835 ) ) ( not ( = ?auto_742831 ?auto_742836 ) ) ( not ( = ?auto_742831 ?auto_742837 ) ) ( not ( = ?auto_742831 ?auto_742838 ) ) ( not ( = ?auto_742831 ?auto_742839 ) ) ( not ( = ?auto_742831 ?auto_742840 ) ) ( not ( = ?auto_742832 ?auto_742833 ) ) ( not ( = ?auto_742832 ?auto_742834 ) ) ( not ( = ?auto_742832 ?auto_742835 ) ) ( not ( = ?auto_742832 ?auto_742836 ) ) ( not ( = ?auto_742832 ?auto_742837 ) ) ( not ( = ?auto_742832 ?auto_742838 ) ) ( not ( = ?auto_742832 ?auto_742839 ) ) ( not ( = ?auto_742832 ?auto_742840 ) ) ( not ( = ?auto_742833 ?auto_742834 ) ) ( not ( = ?auto_742833 ?auto_742835 ) ) ( not ( = ?auto_742833 ?auto_742836 ) ) ( not ( = ?auto_742833 ?auto_742837 ) ) ( not ( = ?auto_742833 ?auto_742838 ) ) ( not ( = ?auto_742833 ?auto_742839 ) ) ( not ( = ?auto_742833 ?auto_742840 ) ) ( not ( = ?auto_742834 ?auto_742835 ) ) ( not ( = ?auto_742834 ?auto_742836 ) ) ( not ( = ?auto_742834 ?auto_742837 ) ) ( not ( = ?auto_742834 ?auto_742838 ) ) ( not ( = ?auto_742834 ?auto_742839 ) ) ( not ( = ?auto_742834 ?auto_742840 ) ) ( not ( = ?auto_742835 ?auto_742836 ) ) ( not ( = ?auto_742835 ?auto_742837 ) ) ( not ( = ?auto_742835 ?auto_742838 ) ) ( not ( = ?auto_742835 ?auto_742839 ) ) ( not ( = ?auto_742835 ?auto_742840 ) ) ( not ( = ?auto_742836 ?auto_742837 ) ) ( not ( = ?auto_742836 ?auto_742838 ) ) ( not ( = ?auto_742836 ?auto_742839 ) ) ( not ( = ?auto_742836 ?auto_742840 ) ) ( not ( = ?auto_742837 ?auto_742838 ) ) ( not ( = ?auto_742837 ?auto_742839 ) ) ( not ( = ?auto_742837 ?auto_742840 ) ) ( not ( = ?auto_742838 ?auto_742839 ) ) ( not ( = ?auto_742838 ?auto_742840 ) ) ( not ( = ?auto_742839 ?auto_742840 ) ) ( ON ?auto_742838 ?auto_742839 ) ( ON ?auto_742837 ?auto_742838 ) ( ON ?auto_742836 ?auto_742837 ) ( ON ?auto_742835 ?auto_742836 ) ( ON ?auto_742834 ?auto_742835 ) ( ON ?auto_742833 ?auto_742834 ) ( CLEAR ?auto_742831 ) ( ON ?auto_742832 ?auto_742833 ) ( CLEAR ?auto_742832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_742827 ?auto_742828 ?auto_742829 ?auto_742830 ?auto_742831 ?auto_742832 )
      ( MAKE-13PILE ?auto_742827 ?auto_742828 ?auto_742829 ?auto_742830 ?auto_742831 ?auto_742832 ?auto_742833 ?auto_742834 ?auto_742835 ?auto_742836 ?auto_742837 ?auto_742838 ?auto_742839 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_742881 - BLOCK
      ?auto_742882 - BLOCK
      ?auto_742883 - BLOCK
      ?auto_742884 - BLOCK
      ?auto_742885 - BLOCK
      ?auto_742886 - BLOCK
      ?auto_742887 - BLOCK
      ?auto_742888 - BLOCK
      ?auto_742889 - BLOCK
      ?auto_742890 - BLOCK
      ?auto_742891 - BLOCK
      ?auto_742892 - BLOCK
      ?auto_742893 - BLOCK
    )
    :vars
    (
      ?auto_742894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742893 ?auto_742894 ) ( ON-TABLE ?auto_742881 ) ( ON ?auto_742882 ?auto_742881 ) ( ON ?auto_742883 ?auto_742882 ) ( ON ?auto_742884 ?auto_742883 ) ( not ( = ?auto_742881 ?auto_742882 ) ) ( not ( = ?auto_742881 ?auto_742883 ) ) ( not ( = ?auto_742881 ?auto_742884 ) ) ( not ( = ?auto_742881 ?auto_742885 ) ) ( not ( = ?auto_742881 ?auto_742886 ) ) ( not ( = ?auto_742881 ?auto_742887 ) ) ( not ( = ?auto_742881 ?auto_742888 ) ) ( not ( = ?auto_742881 ?auto_742889 ) ) ( not ( = ?auto_742881 ?auto_742890 ) ) ( not ( = ?auto_742881 ?auto_742891 ) ) ( not ( = ?auto_742881 ?auto_742892 ) ) ( not ( = ?auto_742881 ?auto_742893 ) ) ( not ( = ?auto_742881 ?auto_742894 ) ) ( not ( = ?auto_742882 ?auto_742883 ) ) ( not ( = ?auto_742882 ?auto_742884 ) ) ( not ( = ?auto_742882 ?auto_742885 ) ) ( not ( = ?auto_742882 ?auto_742886 ) ) ( not ( = ?auto_742882 ?auto_742887 ) ) ( not ( = ?auto_742882 ?auto_742888 ) ) ( not ( = ?auto_742882 ?auto_742889 ) ) ( not ( = ?auto_742882 ?auto_742890 ) ) ( not ( = ?auto_742882 ?auto_742891 ) ) ( not ( = ?auto_742882 ?auto_742892 ) ) ( not ( = ?auto_742882 ?auto_742893 ) ) ( not ( = ?auto_742882 ?auto_742894 ) ) ( not ( = ?auto_742883 ?auto_742884 ) ) ( not ( = ?auto_742883 ?auto_742885 ) ) ( not ( = ?auto_742883 ?auto_742886 ) ) ( not ( = ?auto_742883 ?auto_742887 ) ) ( not ( = ?auto_742883 ?auto_742888 ) ) ( not ( = ?auto_742883 ?auto_742889 ) ) ( not ( = ?auto_742883 ?auto_742890 ) ) ( not ( = ?auto_742883 ?auto_742891 ) ) ( not ( = ?auto_742883 ?auto_742892 ) ) ( not ( = ?auto_742883 ?auto_742893 ) ) ( not ( = ?auto_742883 ?auto_742894 ) ) ( not ( = ?auto_742884 ?auto_742885 ) ) ( not ( = ?auto_742884 ?auto_742886 ) ) ( not ( = ?auto_742884 ?auto_742887 ) ) ( not ( = ?auto_742884 ?auto_742888 ) ) ( not ( = ?auto_742884 ?auto_742889 ) ) ( not ( = ?auto_742884 ?auto_742890 ) ) ( not ( = ?auto_742884 ?auto_742891 ) ) ( not ( = ?auto_742884 ?auto_742892 ) ) ( not ( = ?auto_742884 ?auto_742893 ) ) ( not ( = ?auto_742884 ?auto_742894 ) ) ( not ( = ?auto_742885 ?auto_742886 ) ) ( not ( = ?auto_742885 ?auto_742887 ) ) ( not ( = ?auto_742885 ?auto_742888 ) ) ( not ( = ?auto_742885 ?auto_742889 ) ) ( not ( = ?auto_742885 ?auto_742890 ) ) ( not ( = ?auto_742885 ?auto_742891 ) ) ( not ( = ?auto_742885 ?auto_742892 ) ) ( not ( = ?auto_742885 ?auto_742893 ) ) ( not ( = ?auto_742885 ?auto_742894 ) ) ( not ( = ?auto_742886 ?auto_742887 ) ) ( not ( = ?auto_742886 ?auto_742888 ) ) ( not ( = ?auto_742886 ?auto_742889 ) ) ( not ( = ?auto_742886 ?auto_742890 ) ) ( not ( = ?auto_742886 ?auto_742891 ) ) ( not ( = ?auto_742886 ?auto_742892 ) ) ( not ( = ?auto_742886 ?auto_742893 ) ) ( not ( = ?auto_742886 ?auto_742894 ) ) ( not ( = ?auto_742887 ?auto_742888 ) ) ( not ( = ?auto_742887 ?auto_742889 ) ) ( not ( = ?auto_742887 ?auto_742890 ) ) ( not ( = ?auto_742887 ?auto_742891 ) ) ( not ( = ?auto_742887 ?auto_742892 ) ) ( not ( = ?auto_742887 ?auto_742893 ) ) ( not ( = ?auto_742887 ?auto_742894 ) ) ( not ( = ?auto_742888 ?auto_742889 ) ) ( not ( = ?auto_742888 ?auto_742890 ) ) ( not ( = ?auto_742888 ?auto_742891 ) ) ( not ( = ?auto_742888 ?auto_742892 ) ) ( not ( = ?auto_742888 ?auto_742893 ) ) ( not ( = ?auto_742888 ?auto_742894 ) ) ( not ( = ?auto_742889 ?auto_742890 ) ) ( not ( = ?auto_742889 ?auto_742891 ) ) ( not ( = ?auto_742889 ?auto_742892 ) ) ( not ( = ?auto_742889 ?auto_742893 ) ) ( not ( = ?auto_742889 ?auto_742894 ) ) ( not ( = ?auto_742890 ?auto_742891 ) ) ( not ( = ?auto_742890 ?auto_742892 ) ) ( not ( = ?auto_742890 ?auto_742893 ) ) ( not ( = ?auto_742890 ?auto_742894 ) ) ( not ( = ?auto_742891 ?auto_742892 ) ) ( not ( = ?auto_742891 ?auto_742893 ) ) ( not ( = ?auto_742891 ?auto_742894 ) ) ( not ( = ?auto_742892 ?auto_742893 ) ) ( not ( = ?auto_742892 ?auto_742894 ) ) ( not ( = ?auto_742893 ?auto_742894 ) ) ( ON ?auto_742892 ?auto_742893 ) ( ON ?auto_742891 ?auto_742892 ) ( ON ?auto_742890 ?auto_742891 ) ( ON ?auto_742889 ?auto_742890 ) ( ON ?auto_742888 ?auto_742889 ) ( ON ?auto_742887 ?auto_742888 ) ( ON ?auto_742886 ?auto_742887 ) ( CLEAR ?auto_742884 ) ( ON ?auto_742885 ?auto_742886 ) ( CLEAR ?auto_742885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_742881 ?auto_742882 ?auto_742883 ?auto_742884 ?auto_742885 )
      ( MAKE-13PILE ?auto_742881 ?auto_742882 ?auto_742883 ?auto_742884 ?auto_742885 ?auto_742886 ?auto_742887 ?auto_742888 ?auto_742889 ?auto_742890 ?auto_742891 ?auto_742892 ?auto_742893 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_742935 - BLOCK
      ?auto_742936 - BLOCK
      ?auto_742937 - BLOCK
      ?auto_742938 - BLOCK
      ?auto_742939 - BLOCK
      ?auto_742940 - BLOCK
      ?auto_742941 - BLOCK
      ?auto_742942 - BLOCK
      ?auto_742943 - BLOCK
      ?auto_742944 - BLOCK
      ?auto_742945 - BLOCK
      ?auto_742946 - BLOCK
      ?auto_742947 - BLOCK
    )
    :vars
    (
      ?auto_742948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742947 ?auto_742948 ) ( ON-TABLE ?auto_742935 ) ( ON ?auto_742936 ?auto_742935 ) ( ON ?auto_742937 ?auto_742936 ) ( not ( = ?auto_742935 ?auto_742936 ) ) ( not ( = ?auto_742935 ?auto_742937 ) ) ( not ( = ?auto_742935 ?auto_742938 ) ) ( not ( = ?auto_742935 ?auto_742939 ) ) ( not ( = ?auto_742935 ?auto_742940 ) ) ( not ( = ?auto_742935 ?auto_742941 ) ) ( not ( = ?auto_742935 ?auto_742942 ) ) ( not ( = ?auto_742935 ?auto_742943 ) ) ( not ( = ?auto_742935 ?auto_742944 ) ) ( not ( = ?auto_742935 ?auto_742945 ) ) ( not ( = ?auto_742935 ?auto_742946 ) ) ( not ( = ?auto_742935 ?auto_742947 ) ) ( not ( = ?auto_742935 ?auto_742948 ) ) ( not ( = ?auto_742936 ?auto_742937 ) ) ( not ( = ?auto_742936 ?auto_742938 ) ) ( not ( = ?auto_742936 ?auto_742939 ) ) ( not ( = ?auto_742936 ?auto_742940 ) ) ( not ( = ?auto_742936 ?auto_742941 ) ) ( not ( = ?auto_742936 ?auto_742942 ) ) ( not ( = ?auto_742936 ?auto_742943 ) ) ( not ( = ?auto_742936 ?auto_742944 ) ) ( not ( = ?auto_742936 ?auto_742945 ) ) ( not ( = ?auto_742936 ?auto_742946 ) ) ( not ( = ?auto_742936 ?auto_742947 ) ) ( not ( = ?auto_742936 ?auto_742948 ) ) ( not ( = ?auto_742937 ?auto_742938 ) ) ( not ( = ?auto_742937 ?auto_742939 ) ) ( not ( = ?auto_742937 ?auto_742940 ) ) ( not ( = ?auto_742937 ?auto_742941 ) ) ( not ( = ?auto_742937 ?auto_742942 ) ) ( not ( = ?auto_742937 ?auto_742943 ) ) ( not ( = ?auto_742937 ?auto_742944 ) ) ( not ( = ?auto_742937 ?auto_742945 ) ) ( not ( = ?auto_742937 ?auto_742946 ) ) ( not ( = ?auto_742937 ?auto_742947 ) ) ( not ( = ?auto_742937 ?auto_742948 ) ) ( not ( = ?auto_742938 ?auto_742939 ) ) ( not ( = ?auto_742938 ?auto_742940 ) ) ( not ( = ?auto_742938 ?auto_742941 ) ) ( not ( = ?auto_742938 ?auto_742942 ) ) ( not ( = ?auto_742938 ?auto_742943 ) ) ( not ( = ?auto_742938 ?auto_742944 ) ) ( not ( = ?auto_742938 ?auto_742945 ) ) ( not ( = ?auto_742938 ?auto_742946 ) ) ( not ( = ?auto_742938 ?auto_742947 ) ) ( not ( = ?auto_742938 ?auto_742948 ) ) ( not ( = ?auto_742939 ?auto_742940 ) ) ( not ( = ?auto_742939 ?auto_742941 ) ) ( not ( = ?auto_742939 ?auto_742942 ) ) ( not ( = ?auto_742939 ?auto_742943 ) ) ( not ( = ?auto_742939 ?auto_742944 ) ) ( not ( = ?auto_742939 ?auto_742945 ) ) ( not ( = ?auto_742939 ?auto_742946 ) ) ( not ( = ?auto_742939 ?auto_742947 ) ) ( not ( = ?auto_742939 ?auto_742948 ) ) ( not ( = ?auto_742940 ?auto_742941 ) ) ( not ( = ?auto_742940 ?auto_742942 ) ) ( not ( = ?auto_742940 ?auto_742943 ) ) ( not ( = ?auto_742940 ?auto_742944 ) ) ( not ( = ?auto_742940 ?auto_742945 ) ) ( not ( = ?auto_742940 ?auto_742946 ) ) ( not ( = ?auto_742940 ?auto_742947 ) ) ( not ( = ?auto_742940 ?auto_742948 ) ) ( not ( = ?auto_742941 ?auto_742942 ) ) ( not ( = ?auto_742941 ?auto_742943 ) ) ( not ( = ?auto_742941 ?auto_742944 ) ) ( not ( = ?auto_742941 ?auto_742945 ) ) ( not ( = ?auto_742941 ?auto_742946 ) ) ( not ( = ?auto_742941 ?auto_742947 ) ) ( not ( = ?auto_742941 ?auto_742948 ) ) ( not ( = ?auto_742942 ?auto_742943 ) ) ( not ( = ?auto_742942 ?auto_742944 ) ) ( not ( = ?auto_742942 ?auto_742945 ) ) ( not ( = ?auto_742942 ?auto_742946 ) ) ( not ( = ?auto_742942 ?auto_742947 ) ) ( not ( = ?auto_742942 ?auto_742948 ) ) ( not ( = ?auto_742943 ?auto_742944 ) ) ( not ( = ?auto_742943 ?auto_742945 ) ) ( not ( = ?auto_742943 ?auto_742946 ) ) ( not ( = ?auto_742943 ?auto_742947 ) ) ( not ( = ?auto_742943 ?auto_742948 ) ) ( not ( = ?auto_742944 ?auto_742945 ) ) ( not ( = ?auto_742944 ?auto_742946 ) ) ( not ( = ?auto_742944 ?auto_742947 ) ) ( not ( = ?auto_742944 ?auto_742948 ) ) ( not ( = ?auto_742945 ?auto_742946 ) ) ( not ( = ?auto_742945 ?auto_742947 ) ) ( not ( = ?auto_742945 ?auto_742948 ) ) ( not ( = ?auto_742946 ?auto_742947 ) ) ( not ( = ?auto_742946 ?auto_742948 ) ) ( not ( = ?auto_742947 ?auto_742948 ) ) ( ON ?auto_742946 ?auto_742947 ) ( ON ?auto_742945 ?auto_742946 ) ( ON ?auto_742944 ?auto_742945 ) ( ON ?auto_742943 ?auto_742944 ) ( ON ?auto_742942 ?auto_742943 ) ( ON ?auto_742941 ?auto_742942 ) ( ON ?auto_742940 ?auto_742941 ) ( ON ?auto_742939 ?auto_742940 ) ( CLEAR ?auto_742937 ) ( ON ?auto_742938 ?auto_742939 ) ( CLEAR ?auto_742938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_742935 ?auto_742936 ?auto_742937 ?auto_742938 )
      ( MAKE-13PILE ?auto_742935 ?auto_742936 ?auto_742937 ?auto_742938 ?auto_742939 ?auto_742940 ?auto_742941 ?auto_742942 ?auto_742943 ?auto_742944 ?auto_742945 ?auto_742946 ?auto_742947 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_742989 - BLOCK
      ?auto_742990 - BLOCK
      ?auto_742991 - BLOCK
      ?auto_742992 - BLOCK
      ?auto_742993 - BLOCK
      ?auto_742994 - BLOCK
      ?auto_742995 - BLOCK
      ?auto_742996 - BLOCK
      ?auto_742997 - BLOCK
      ?auto_742998 - BLOCK
      ?auto_742999 - BLOCK
      ?auto_743000 - BLOCK
      ?auto_743001 - BLOCK
    )
    :vars
    (
      ?auto_743002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743001 ?auto_743002 ) ( ON-TABLE ?auto_742989 ) ( ON ?auto_742990 ?auto_742989 ) ( not ( = ?auto_742989 ?auto_742990 ) ) ( not ( = ?auto_742989 ?auto_742991 ) ) ( not ( = ?auto_742989 ?auto_742992 ) ) ( not ( = ?auto_742989 ?auto_742993 ) ) ( not ( = ?auto_742989 ?auto_742994 ) ) ( not ( = ?auto_742989 ?auto_742995 ) ) ( not ( = ?auto_742989 ?auto_742996 ) ) ( not ( = ?auto_742989 ?auto_742997 ) ) ( not ( = ?auto_742989 ?auto_742998 ) ) ( not ( = ?auto_742989 ?auto_742999 ) ) ( not ( = ?auto_742989 ?auto_743000 ) ) ( not ( = ?auto_742989 ?auto_743001 ) ) ( not ( = ?auto_742989 ?auto_743002 ) ) ( not ( = ?auto_742990 ?auto_742991 ) ) ( not ( = ?auto_742990 ?auto_742992 ) ) ( not ( = ?auto_742990 ?auto_742993 ) ) ( not ( = ?auto_742990 ?auto_742994 ) ) ( not ( = ?auto_742990 ?auto_742995 ) ) ( not ( = ?auto_742990 ?auto_742996 ) ) ( not ( = ?auto_742990 ?auto_742997 ) ) ( not ( = ?auto_742990 ?auto_742998 ) ) ( not ( = ?auto_742990 ?auto_742999 ) ) ( not ( = ?auto_742990 ?auto_743000 ) ) ( not ( = ?auto_742990 ?auto_743001 ) ) ( not ( = ?auto_742990 ?auto_743002 ) ) ( not ( = ?auto_742991 ?auto_742992 ) ) ( not ( = ?auto_742991 ?auto_742993 ) ) ( not ( = ?auto_742991 ?auto_742994 ) ) ( not ( = ?auto_742991 ?auto_742995 ) ) ( not ( = ?auto_742991 ?auto_742996 ) ) ( not ( = ?auto_742991 ?auto_742997 ) ) ( not ( = ?auto_742991 ?auto_742998 ) ) ( not ( = ?auto_742991 ?auto_742999 ) ) ( not ( = ?auto_742991 ?auto_743000 ) ) ( not ( = ?auto_742991 ?auto_743001 ) ) ( not ( = ?auto_742991 ?auto_743002 ) ) ( not ( = ?auto_742992 ?auto_742993 ) ) ( not ( = ?auto_742992 ?auto_742994 ) ) ( not ( = ?auto_742992 ?auto_742995 ) ) ( not ( = ?auto_742992 ?auto_742996 ) ) ( not ( = ?auto_742992 ?auto_742997 ) ) ( not ( = ?auto_742992 ?auto_742998 ) ) ( not ( = ?auto_742992 ?auto_742999 ) ) ( not ( = ?auto_742992 ?auto_743000 ) ) ( not ( = ?auto_742992 ?auto_743001 ) ) ( not ( = ?auto_742992 ?auto_743002 ) ) ( not ( = ?auto_742993 ?auto_742994 ) ) ( not ( = ?auto_742993 ?auto_742995 ) ) ( not ( = ?auto_742993 ?auto_742996 ) ) ( not ( = ?auto_742993 ?auto_742997 ) ) ( not ( = ?auto_742993 ?auto_742998 ) ) ( not ( = ?auto_742993 ?auto_742999 ) ) ( not ( = ?auto_742993 ?auto_743000 ) ) ( not ( = ?auto_742993 ?auto_743001 ) ) ( not ( = ?auto_742993 ?auto_743002 ) ) ( not ( = ?auto_742994 ?auto_742995 ) ) ( not ( = ?auto_742994 ?auto_742996 ) ) ( not ( = ?auto_742994 ?auto_742997 ) ) ( not ( = ?auto_742994 ?auto_742998 ) ) ( not ( = ?auto_742994 ?auto_742999 ) ) ( not ( = ?auto_742994 ?auto_743000 ) ) ( not ( = ?auto_742994 ?auto_743001 ) ) ( not ( = ?auto_742994 ?auto_743002 ) ) ( not ( = ?auto_742995 ?auto_742996 ) ) ( not ( = ?auto_742995 ?auto_742997 ) ) ( not ( = ?auto_742995 ?auto_742998 ) ) ( not ( = ?auto_742995 ?auto_742999 ) ) ( not ( = ?auto_742995 ?auto_743000 ) ) ( not ( = ?auto_742995 ?auto_743001 ) ) ( not ( = ?auto_742995 ?auto_743002 ) ) ( not ( = ?auto_742996 ?auto_742997 ) ) ( not ( = ?auto_742996 ?auto_742998 ) ) ( not ( = ?auto_742996 ?auto_742999 ) ) ( not ( = ?auto_742996 ?auto_743000 ) ) ( not ( = ?auto_742996 ?auto_743001 ) ) ( not ( = ?auto_742996 ?auto_743002 ) ) ( not ( = ?auto_742997 ?auto_742998 ) ) ( not ( = ?auto_742997 ?auto_742999 ) ) ( not ( = ?auto_742997 ?auto_743000 ) ) ( not ( = ?auto_742997 ?auto_743001 ) ) ( not ( = ?auto_742997 ?auto_743002 ) ) ( not ( = ?auto_742998 ?auto_742999 ) ) ( not ( = ?auto_742998 ?auto_743000 ) ) ( not ( = ?auto_742998 ?auto_743001 ) ) ( not ( = ?auto_742998 ?auto_743002 ) ) ( not ( = ?auto_742999 ?auto_743000 ) ) ( not ( = ?auto_742999 ?auto_743001 ) ) ( not ( = ?auto_742999 ?auto_743002 ) ) ( not ( = ?auto_743000 ?auto_743001 ) ) ( not ( = ?auto_743000 ?auto_743002 ) ) ( not ( = ?auto_743001 ?auto_743002 ) ) ( ON ?auto_743000 ?auto_743001 ) ( ON ?auto_742999 ?auto_743000 ) ( ON ?auto_742998 ?auto_742999 ) ( ON ?auto_742997 ?auto_742998 ) ( ON ?auto_742996 ?auto_742997 ) ( ON ?auto_742995 ?auto_742996 ) ( ON ?auto_742994 ?auto_742995 ) ( ON ?auto_742993 ?auto_742994 ) ( ON ?auto_742992 ?auto_742993 ) ( CLEAR ?auto_742990 ) ( ON ?auto_742991 ?auto_742992 ) ( CLEAR ?auto_742991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_742989 ?auto_742990 ?auto_742991 )
      ( MAKE-13PILE ?auto_742989 ?auto_742990 ?auto_742991 ?auto_742992 ?auto_742993 ?auto_742994 ?auto_742995 ?auto_742996 ?auto_742997 ?auto_742998 ?auto_742999 ?auto_743000 ?auto_743001 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_743043 - BLOCK
      ?auto_743044 - BLOCK
      ?auto_743045 - BLOCK
      ?auto_743046 - BLOCK
      ?auto_743047 - BLOCK
      ?auto_743048 - BLOCK
      ?auto_743049 - BLOCK
      ?auto_743050 - BLOCK
      ?auto_743051 - BLOCK
      ?auto_743052 - BLOCK
      ?auto_743053 - BLOCK
      ?auto_743054 - BLOCK
      ?auto_743055 - BLOCK
    )
    :vars
    (
      ?auto_743056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743055 ?auto_743056 ) ( ON-TABLE ?auto_743043 ) ( not ( = ?auto_743043 ?auto_743044 ) ) ( not ( = ?auto_743043 ?auto_743045 ) ) ( not ( = ?auto_743043 ?auto_743046 ) ) ( not ( = ?auto_743043 ?auto_743047 ) ) ( not ( = ?auto_743043 ?auto_743048 ) ) ( not ( = ?auto_743043 ?auto_743049 ) ) ( not ( = ?auto_743043 ?auto_743050 ) ) ( not ( = ?auto_743043 ?auto_743051 ) ) ( not ( = ?auto_743043 ?auto_743052 ) ) ( not ( = ?auto_743043 ?auto_743053 ) ) ( not ( = ?auto_743043 ?auto_743054 ) ) ( not ( = ?auto_743043 ?auto_743055 ) ) ( not ( = ?auto_743043 ?auto_743056 ) ) ( not ( = ?auto_743044 ?auto_743045 ) ) ( not ( = ?auto_743044 ?auto_743046 ) ) ( not ( = ?auto_743044 ?auto_743047 ) ) ( not ( = ?auto_743044 ?auto_743048 ) ) ( not ( = ?auto_743044 ?auto_743049 ) ) ( not ( = ?auto_743044 ?auto_743050 ) ) ( not ( = ?auto_743044 ?auto_743051 ) ) ( not ( = ?auto_743044 ?auto_743052 ) ) ( not ( = ?auto_743044 ?auto_743053 ) ) ( not ( = ?auto_743044 ?auto_743054 ) ) ( not ( = ?auto_743044 ?auto_743055 ) ) ( not ( = ?auto_743044 ?auto_743056 ) ) ( not ( = ?auto_743045 ?auto_743046 ) ) ( not ( = ?auto_743045 ?auto_743047 ) ) ( not ( = ?auto_743045 ?auto_743048 ) ) ( not ( = ?auto_743045 ?auto_743049 ) ) ( not ( = ?auto_743045 ?auto_743050 ) ) ( not ( = ?auto_743045 ?auto_743051 ) ) ( not ( = ?auto_743045 ?auto_743052 ) ) ( not ( = ?auto_743045 ?auto_743053 ) ) ( not ( = ?auto_743045 ?auto_743054 ) ) ( not ( = ?auto_743045 ?auto_743055 ) ) ( not ( = ?auto_743045 ?auto_743056 ) ) ( not ( = ?auto_743046 ?auto_743047 ) ) ( not ( = ?auto_743046 ?auto_743048 ) ) ( not ( = ?auto_743046 ?auto_743049 ) ) ( not ( = ?auto_743046 ?auto_743050 ) ) ( not ( = ?auto_743046 ?auto_743051 ) ) ( not ( = ?auto_743046 ?auto_743052 ) ) ( not ( = ?auto_743046 ?auto_743053 ) ) ( not ( = ?auto_743046 ?auto_743054 ) ) ( not ( = ?auto_743046 ?auto_743055 ) ) ( not ( = ?auto_743046 ?auto_743056 ) ) ( not ( = ?auto_743047 ?auto_743048 ) ) ( not ( = ?auto_743047 ?auto_743049 ) ) ( not ( = ?auto_743047 ?auto_743050 ) ) ( not ( = ?auto_743047 ?auto_743051 ) ) ( not ( = ?auto_743047 ?auto_743052 ) ) ( not ( = ?auto_743047 ?auto_743053 ) ) ( not ( = ?auto_743047 ?auto_743054 ) ) ( not ( = ?auto_743047 ?auto_743055 ) ) ( not ( = ?auto_743047 ?auto_743056 ) ) ( not ( = ?auto_743048 ?auto_743049 ) ) ( not ( = ?auto_743048 ?auto_743050 ) ) ( not ( = ?auto_743048 ?auto_743051 ) ) ( not ( = ?auto_743048 ?auto_743052 ) ) ( not ( = ?auto_743048 ?auto_743053 ) ) ( not ( = ?auto_743048 ?auto_743054 ) ) ( not ( = ?auto_743048 ?auto_743055 ) ) ( not ( = ?auto_743048 ?auto_743056 ) ) ( not ( = ?auto_743049 ?auto_743050 ) ) ( not ( = ?auto_743049 ?auto_743051 ) ) ( not ( = ?auto_743049 ?auto_743052 ) ) ( not ( = ?auto_743049 ?auto_743053 ) ) ( not ( = ?auto_743049 ?auto_743054 ) ) ( not ( = ?auto_743049 ?auto_743055 ) ) ( not ( = ?auto_743049 ?auto_743056 ) ) ( not ( = ?auto_743050 ?auto_743051 ) ) ( not ( = ?auto_743050 ?auto_743052 ) ) ( not ( = ?auto_743050 ?auto_743053 ) ) ( not ( = ?auto_743050 ?auto_743054 ) ) ( not ( = ?auto_743050 ?auto_743055 ) ) ( not ( = ?auto_743050 ?auto_743056 ) ) ( not ( = ?auto_743051 ?auto_743052 ) ) ( not ( = ?auto_743051 ?auto_743053 ) ) ( not ( = ?auto_743051 ?auto_743054 ) ) ( not ( = ?auto_743051 ?auto_743055 ) ) ( not ( = ?auto_743051 ?auto_743056 ) ) ( not ( = ?auto_743052 ?auto_743053 ) ) ( not ( = ?auto_743052 ?auto_743054 ) ) ( not ( = ?auto_743052 ?auto_743055 ) ) ( not ( = ?auto_743052 ?auto_743056 ) ) ( not ( = ?auto_743053 ?auto_743054 ) ) ( not ( = ?auto_743053 ?auto_743055 ) ) ( not ( = ?auto_743053 ?auto_743056 ) ) ( not ( = ?auto_743054 ?auto_743055 ) ) ( not ( = ?auto_743054 ?auto_743056 ) ) ( not ( = ?auto_743055 ?auto_743056 ) ) ( ON ?auto_743054 ?auto_743055 ) ( ON ?auto_743053 ?auto_743054 ) ( ON ?auto_743052 ?auto_743053 ) ( ON ?auto_743051 ?auto_743052 ) ( ON ?auto_743050 ?auto_743051 ) ( ON ?auto_743049 ?auto_743050 ) ( ON ?auto_743048 ?auto_743049 ) ( ON ?auto_743047 ?auto_743048 ) ( ON ?auto_743046 ?auto_743047 ) ( ON ?auto_743045 ?auto_743046 ) ( CLEAR ?auto_743043 ) ( ON ?auto_743044 ?auto_743045 ) ( CLEAR ?auto_743044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_743043 ?auto_743044 )
      ( MAKE-13PILE ?auto_743043 ?auto_743044 ?auto_743045 ?auto_743046 ?auto_743047 ?auto_743048 ?auto_743049 ?auto_743050 ?auto_743051 ?auto_743052 ?auto_743053 ?auto_743054 ?auto_743055 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_743097 - BLOCK
      ?auto_743098 - BLOCK
      ?auto_743099 - BLOCK
      ?auto_743100 - BLOCK
      ?auto_743101 - BLOCK
      ?auto_743102 - BLOCK
      ?auto_743103 - BLOCK
      ?auto_743104 - BLOCK
      ?auto_743105 - BLOCK
      ?auto_743106 - BLOCK
      ?auto_743107 - BLOCK
      ?auto_743108 - BLOCK
      ?auto_743109 - BLOCK
    )
    :vars
    (
      ?auto_743110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743109 ?auto_743110 ) ( not ( = ?auto_743097 ?auto_743098 ) ) ( not ( = ?auto_743097 ?auto_743099 ) ) ( not ( = ?auto_743097 ?auto_743100 ) ) ( not ( = ?auto_743097 ?auto_743101 ) ) ( not ( = ?auto_743097 ?auto_743102 ) ) ( not ( = ?auto_743097 ?auto_743103 ) ) ( not ( = ?auto_743097 ?auto_743104 ) ) ( not ( = ?auto_743097 ?auto_743105 ) ) ( not ( = ?auto_743097 ?auto_743106 ) ) ( not ( = ?auto_743097 ?auto_743107 ) ) ( not ( = ?auto_743097 ?auto_743108 ) ) ( not ( = ?auto_743097 ?auto_743109 ) ) ( not ( = ?auto_743097 ?auto_743110 ) ) ( not ( = ?auto_743098 ?auto_743099 ) ) ( not ( = ?auto_743098 ?auto_743100 ) ) ( not ( = ?auto_743098 ?auto_743101 ) ) ( not ( = ?auto_743098 ?auto_743102 ) ) ( not ( = ?auto_743098 ?auto_743103 ) ) ( not ( = ?auto_743098 ?auto_743104 ) ) ( not ( = ?auto_743098 ?auto_743105 ) ) ( not ( = ?auto_743098 ?auto_743106 ) ) ( not ( = ?auto_743098 ?auto_743107 ) ) ( not ( = ?auto_743098 ?auto_743108 ) ) ( not ( = ?auto_743098 ?auto_743109 ) ) ( not ( = ?auto_743098 ?auto_743110 ) ) ( not ( = ?auto_743099 ?auto_743100 ) ) ( not ( = ?auto_743099 ?auto_743101 ) ) ( not ( = ?auto_743099 ?auto_743102 ) ) ( not ( = ?auto_743099 ?auto_743103 ) ) ( not ( = ?auto_743099 ?auto_743104 ) ) ( not ( = ?auto_743099 ?auto_743105 ) ) ( not ( = ?auto_743099 ?auto_743106 ) ) ( not ( = ?auto_743099 ?auto_743107 ) ) ( not ( = ?auto_743099 ?auto_743108 ) ) ( not ( = ?auto_743099 ?auto_743109 ) ) ( not ( = ?auto_743099 ?auto_743110 ) ) ( not ( = ?auto_743100 ?auto_743101 ) ) ( not ( = ?auto_743100 ?auto_743102 ) ) ( not ( = ?auto_743100 ?auto_743103 ) ) ( not ( = ?auto_743100 ?auto_743104 ) ) ( not ( = ?auto_743100 ?auto_743105 ) ) ( not ( = ?auto_743100 ?auto_743106 ) ) ( not ( = ?auto_743100 ?auto_743107 ) ) ( not ( = ?auto_743100 ?auto_743108 ) ) ( not ( = ?auto_743100 ?auto_743109 ) ) ( not ( = ?auto_743100 ?auto_743110 ) ) ( not ( = ?auto_743101 ?auto_743102 ) ) ( not ( = ?auto_743101 ?auto_743103 ) ) ( not ( = ?auto_743101 ?auto_743104 ) ) ( not ( = ?auto_743101 ?auto_743105 ) ) ( not ( = ?auto_743101 ?auto_743106 ) ) ( not ( = ?auto_743101 ?auto_743107 ) ) ( not ( = ?auto_743101 ?auto_743108 ) ) ( not ( = ?auto_743101 ?auto_743109 ) ) ( not ( = ?auto_743101 ?auto_743110 ) ) ( not ( = ?auto_743102 ?auto_743103 ) ) ( not ( = ?auto_743102 ?auto_743104 ) ) ( not ( = ?auto_743102 ?auto_743105 ) ) ( not ( = ?auto_743102 ?auto_743106 ) ) ( not ( = ?auto_743102 ?auto_743107 ) ) ( not ( = ?auto_743102 ?auto_743108 ) ) ( not ( = ?auto_743102 ?auto_743109 ) ) ( not ( = ?auto_743102 ?auto_743110 ) ) ( not ( = ?auto_743103 ?auto_743104 ) ) ( not ( = ?auto_743103 ?auto_743105 ) ) ( not ( = ?auto_743103 ?auto_743106 ) ) ( not ( = ?auto_743103 ?auto_743107 ) ) ( not ( = ?auto_743103 ?auto_743108 ) ) ( not ( = ?auto_743103 ?auto_743109 ) ) ( not ( = ?auto_743103 ?auto_743110 ) ) ( not ( = ?auto_743104 ?auto_743105 ) ) ( not ( = ?auto_743104 ?auto_743106 ) ) ( not ( = ?auto_743104 ?auto_743107 ) ) ( not ( = ?auto_743104 ?auto_743108 ) ) ( not ( = ?auto_743104 ?auto_743109 ) ) ( not ( = ?auto_743104 ?auto_743110 ) ) ( not ( = ?auto_743105 ?auto_743106 ) ) ( not ( = ?auto_743105 ?auto_743107 ) ) ( not ( = ?auto_743105 ?auto_743108 ) ) ( not ( = ?auto_743105 ?auto_743109 ) ) ( not ( = ?auto_743105 ?auto_743110 ) ) ( not ( = ?auto_743106 ?auto_743107 ) ) ( not ( = ?auto_743106 ?auto_743108 ) ) ( not ( = ?auto_743106 ?auto_743109 ) ) ( not ( = ?auto_743106 ?auto_743110 ) ) ( not ( = ?auto_743107 ?auto_743108 ) ) ( not ( = ?auto_743107 ?auto_743109 ) ) ( not ( = ?auto_743107 ?auto_743110 ) ) ( not ( = ?auto_743108 ?auto_743109 ) ) ( not ( = ?auto_743108 ?auto_743110 ) ) ( not ( = ?auto_743109 ?auto_743110 ) ) ( ON ?auto_743108 ?auto_743109 ) ( ON ?auto_743107 ?auto_743108 ) ( ON ?auto_743106 ?auto_743107 ) ( ON ?auto_743105 ?auto_743106 ) ( ON ?auto_743104 ?auto_743105 ) ( ON ?auto_743103 ?auto_743104 ) ( ON ?auto_743102 ?auto_743103 ) ( ON ?auto_743101 ?auto_743102 ) ( ON ?auto_743100 ?auto_743101 ) ( ON ?auto_743099 ?auto_743100 ) ( ON ?auto_743098 ?auto_743099 ) ( ON ?auto_743097 ?auto_743098 ) ( CLEAR ?auto_743097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_743097 )
      ( MAKE-13PILE ?auto_743097 ?auto_743098 ?auto_743099 ?auto_743100 ?auto_743101 ?auto_743102 ?auto_743103 ?auto_743104 ?auto_743105 ?auto_743106 ?auto_743107 ?auto_743108 ?auto_743109 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743152 - BLOCK
      ?auto_743153 - BLOCK
      ?auto_743154 - BLOCK
      ?auto_743155 - BLOCK
      ?auto_743156 - BLOCK
      ?auto_743157 - BLOCK
      ?auto_743158 - BLOCK
      ?auto_743159 - BLOCK
      ?auto_743160 - BLOCK
      ?auto_743161 - BLOCK
      ?auto_743162 - BLOCK
      ?auto_743163 - BLOCK
      ?auto_743164 - BLOCK
      ?auto_743165 - BLOCK
    )
    :vars
    (
      ?auto_743166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_743164 ) ( ON ?auto_743165 ?auto_743166 ) ( CLEAR ?auto_743165 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_743152 ) ( ON ?auto_743153 ?auto_743152 ) ( ON ?auto_743154 ?auto_743153 ) ( ON ?auto_743155 ?auto_743154 ) ( ON ?auto_743156 ?auto_743155 ) ( ON ?auto_743157 ?auto_743156 ) ( ON ?auto_743158 ?auto_743157 ) ( ON ?auto_743159 ?auto_743158 ) ( ON ?auto_743160 ?auto_743159 ) ( ON ?auto_743161 ?auto_743160 ) ( ON ?auto_743162 ?auto_743161 ) ( ON ?auto_743163 ?auto_743162 ) ( ON ?auto_743164 ?auto_743163 ) ( not ( = ?auto_743152 ?auto_743153 ) ) ( not ( = ?auto_743152 ?auto_743154 ) ) ( not ( = ?auto_743152 ?auto_743155 ) ) ( not ( = ?auto_743152 ?auto_743156 ) ) ( not ( = ?auto_743152 ?auto_743157 ) ) ( not ( = ?auto_743152 ?auto_743158 ) ) ( not ( = ?auto_743152 ?auto_743159 ) ) ( not ( = ?auto_743152 ?auto_743160 ) ) ( not ( = ?auto_743152 ?auto_743161 ) ) ( not ( = ?auto_743152 ?auto_743162 ) ) ( not ( = ?auto_743152 ?auto_743163 ) ) ( not ( = ?auto_743152 ?auto_743164 ) ) ( not ( = ?auto_743152 ?auto_743165 ) ) ( not ( = ?auto_743152 ?auto_743166 ) ) ( not ( = ?auto_743153 ?auto_743154 ) ) ( not ( = ?auto_743153 ?auto_743155 ) ) ( not ( = ?auto_743153 ?auto_743156 ) ) ( not ( = ?auto_743153 ?auto_743157 ) ) ( not ( = ?auto_743153 ?auto_743158 ) ) ( not ( = ?auto_743153 ?auto_743159 ) ) ( not ( = ?auto_743153 ?auto_743160 ) ) ( not ( = ?auto_743153 ?auto_743161 ) ) ( not ( = ?auto_743153 ?auto_743162 ) ) ( not ( = ?auto_743153 ?auto_743163 ) ) ( not ( = ?auto_743153 ?auto_743164 ) ) ( not ( = ?auto_743153 ?auto_743165 ) ) ( not ( = ?auto_743153 ?auto_743166 ) ) ( not ( = ?auto_743154 ?auto_743155 ) ) ( not ( = ?auto_743154 ?auto_743156 ) ) ( not ( = ?auto_743154 ?auto_743157 ) ) ( not ( = ?auto_743154 ?auto_743158 ) ) ( not ( = ?auto_743154 ?auto_743159 ) ) ( not ( = ?auto_743154 ?auto_743160 ) ) ( not ( = ?auto_743154 ?auto_743161 ) ) ( not ( = ?auto_743154 ?auto_743162 ) ) ( not ( = ?auto_743154 ?auto_743163 ) ) ( not ( = ?auto_743154 ?auto_743164 ) ) ( not ( = ?auto_743154 ?auto_743165 ) ) ( not ( = ?auto_743154 ?auto_743166 ) ) ( not ( = ?auto_743155 ?auto_743156 ) ) ( not ( = ?auto_743155 ?auto_743157 ) ) ( not ( = ?auto_743155 ?auto_743158 ) ) ( not ( = ?auto_743155 ?auto_743159 ) ) ( not ( = ?auto_743155 ?auto_743160 ) ) ( not ( = ?auto_743155 ?auto_743161 ) ) ( not ( = ?auto_743155 ?auto_743162 ) ) ( not ( = ?auto_743155 ?auto_743163 ) ) ( not ( = ?auto_743155 ?auto_743164 ) ) ( not ( = ?auto_743155 ?auto_743165 ) ) ( not ( = ?auto_743155 ?auto_743166 ) ) ( not ( = ?auto_743156 ?auto_743157 ) ) ( not ( = ?auto_743156 ?auto_743158 ) ) ( not ( = ?auto_743156 ?auto_743159 ) ) ( not ( = ?auto_743156 ?auto_743160 ) ) ( not ( = ?auto_743156 ?auto_743161 ) ) ( not ( = ?auto_743156 ?auto_743162 ) ) ( not ( = ?auto_743156 ?auto_743163 ) ) ( not ( = ?auto_743156 ?auto_743164 ) ) ( not ( = ?auto_743156 ?auto_743165 ) ) ( not ( = ?auto_743156 ?auto_743166 ) ) ( not ( = ?auto_743157 ?auto_743158 ) ) ( not ( = ?auto_743157 ?auto_743159 ) ) ( not ( = ?auto_743157 ?auto_743160 ) ) ( not ( = ?auto_743157 ?auto_743161 ) ) ( not ( = ?auto_743157 ?auto_743162 ) ) ( not ( = ?auto_743157 ?auto_743163 ) ) ( not ( = ?auto_743157 ?auto_743164 ) ) ( not ( = ?auto_743157 ?auto_743165 ) ) ( not ( = ?auto_743157 ?auto_743166 ) ) ( not ( = ?auto_743158 ?auto_743159 ) ) ( not ( = ?auto_743158 ?auto_743160 ) ) ( not ( = ?auto_743158 ?auto_743161 ) ) ( not ( = ?auto_743158 ?auto_743162 ) ) ( not ( = ?auto_743158 ?auto_743163 ) ) ( not ( = ?auto_743158 ?auto_743164 ) ) ( not ( = ?auto_743158 ?auto_743165 ) ) ( not ( = ?auto_743158 ?auto_743166 ) ) ( not ( = ?auto_743159 ?auto_743160 ) ) ( not ( = ?auto_743159 ?auto_743161 ) ) ( not ( = ?auto_743159 ?auto_743162 ) ) ( not ( = ?auto_743159 ?auto_743163 ) ) ( not ( = ?auto_743159 ?auto_743164 ) ) ( not ( = ?auto_743159 ?auto_743165 ) ) ( not ( = ?auto_743159 ?auto_743166 ) ) ( not ( = ?auto_743160 ?auto_743161 ) ) ( not ( = ?auto_743160 ?auto_743162 ) ) ( not ( = ?auto_743160 ?auto_743163 ) ) ( not ( = ?auto_743160 ?auto_743164 ) ) ( not ( = ?auto_743160 ?auto_743165 ) ) ( not ( = ?auto_743160 ?auto_743166 ) ) ( not ( = ?auto_743161 ?auto_743162 ) ) ( not ( = ?auto_743161 ?auto_743163 ) ) ( not ( = ?auto_743161 ?auto_743164 ) ) ( not ( = ?auto_743161 ?auto_743165 ) ) ( not ( = ?auto_743161 ?auto_743166 ) ) ( not ( = ?auto_743162 ?auto_743163 ) ) ( not ( = ?auto_743162 ?auto_743164 ) ) ( not ( = ?auto_743162 ?auto_743165 ) ) ( not ( = ?auto_743162 ?auto_743166 ) ) ( not ( = ?auto_743163 ?auto_743164 ) ) ( not ( = ?auto_743163 ?auto_743165 ) ) ( not ( = ?auto_743163 ?auto_743166 ) ) ( not ( = ?auto_743164 ?auto_743165 ) ) ( not ( = ?auto_743164 ?auto_743166 ) ) ( not ( = ?auto_743165 ?auto_743166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_743165 ?auto_743166 )
      ( !STACK ?auto_743165 ?auto_743164 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743210 - BLOCK
      ?auto_743211 - BLOCK
      ?auto_743212 - BLOCK
      ?auto_743213 - BLOCK
      ?auto_743214 - BLOCK
      ?auto_743215 - BLOCK
      ?auto_743216 - BLOCK
      ?auto_743217 - BLOCK
      ?auto_743218 - BLOCK
      ?auto_743219 - BLOCK
      ?auto_743220 - BLOCK
      ?auto_743221 - BLOCK
      ?auto_743222 - BLOCK
      ?auto_743223 - BLOCK
    )
    :vars
    (
      ?auto_743224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743223 ?auto_743224 ) ( ON-TABLE ?auto_743210 ) ( ON ?auto_743211 ?auto_743210 ) ( ON ?auto_743212 ?auto_743211 ) ( ON ?auto_743213 ?auto_743212 ) ( ON ?auto_743214 ?auto_743213 ) ( ON ?auto_743215 ?auto_743214 ) ( ON ?auto_743216 ?auto_743215 ) ( ON ?auto_743217 ?auto_743216 ) ( ON ?auto_743218 ?auto_743217 ) ( ON ?auto_743219 ?auto_743218 ) ( ON ?auto_743220 ?auto_743219 ) ( ON ?auto_743221 ?auto_743220 ) ( not ( = ?auto_743210 ?auto_743211 ) ) ( not ( = ?auto_743210 ?auto_743212 ) ) ( not ( = ?auto_743210 ?auto_743213 ) ) ( not ( = ?auto_743210 ?auto_743214 ) ) ( not ( = ?auto_743210 ?auto_743215 ) ) ( not ( = ?auto_743210 ?auto_743216 ) ) ( not ( = ?auto_743210 ?auto_743217 ) ) ( not ( = ?auto_743210 ?auto_743218 ) ) ( not ( = ?auto_743210 ?auto_743219 ) ) ( not ( = ?auto_743210 ?auto_743220 ) ) ( not ( = ?auto_743210 ?auto_743221 ) ) ( not ( = ?auto_743210 ?auto_743222 ) ) ( not ( = ?auto_743210 ?auto_743223 ) ) ( not ( = ?auto_743210 ?auto_743224 ) ) ( not ( = ?auto_743211 ?auto_743212 ) ) ( not ( = ?auto_743211 ?auto_743213 ) ) ( not ( = ?auto_743211 ?auto_743214 ) ) ( not ( = ?auto_743211 ?auto_743215 ) ) ( not ( = ?auto_743211 ?auto_743216 ) ) ( not ( = ?auto_743211 ?auto_743217 ) ) ( not ( = ?auto_743211 ?auto_743218 ) ) ( not ( = ?auto_743211 ?auto_743219 ) ) ( not ( = ?auto_743211 ?auto_743220 ) ) ( not ( = ?auto_743211 ?auto_743221 ) ) ( not ( = ?auto_743211 ?auto_743222 ) ) ( not ( = ?auto_743211 ?auto_743223 ) ) ( not ( = ?auto_743211 ?auto_743224 ) ) ( not ( = ?auto_743212 ?auto_743213 ) ) ( not ( = ?auto_743212 ?auto_743214 ) ) ( not ( = ?auto_743212 ?auto_743215 ) ) ( not ( = ?auto_743212 ?auto_743216 ) ) ( not ( = ?auto_743212 ?auto_743217 ) ) ( not ( = ?auto_743212 ?auto_743218 ) ) ( not ( = ?auto_743212 ?auto_743219 ) ) ( not ( = ?auto_743212 ?auto_743220 ) ) ( not ( = ?auto_743212 ?auto_743221 ) ) ( not ( = ?auto_743212 ?auto_743222 ) ) ( not ( = ?auto_743212 ?auto_743223 ) ) ( not ( = ?auto_743212 ?auto_743224 ) ) ( not ( = ?auto_743213 ?auto_743214 ) ) ( not ( = ?auto_743213 ?auto_743215 ) ) ( not ( = ?auto_743213 ?auto_743216 ) ) ( not ( = ?auto_743213 ?auto_743217 ) ) ( not ( = ?auto_743213 ?auto_743218 ) ) ( not ( = ?auto_743213 ?auto_743219 ) ) ( not ( = ?auto_743213 ?auto_743220 ) ) ( not ( = ?auto_743213 ?auto_743221 ) ) ( not ( = ?auto_743213 ?auto_743222 ) ) ( not ( = ?auto_743213 ?auto_743223 ) ) ( not ( = ?auto_743213 ?auto_743224 ) ) ( not ( = ?auto_743214 ?auto_743215 ) ) ( not ( = ?auto_743214 ?auto_743216 ) ) ( not ( = ?auto_743214 ?auto_743217 ) ) ( not ( = ?auto_743214 ?auto_743218 ) ) ( not ( = ?auto_743214 ?auto_743219 ) ) ( not ( = ?auto_743214 ?auto_743220 ) ) ( not ( = ?auto_743214 ?auto_743221 ) ) ( not ( = ?auto_743214 ?auto_743222 ) ) ( not ( = ?auto_743214 ?auto_743223 ) ) ( not ( = ?auto_743214 ?auto_743224 ) ) ( not ( = ?auto_743215 ?auto_743216 ) ) ( not ( = ?auto_743215 ?auto_743217 ) ) ( not ( = ?auto_743215 ?auto_743218 ) ) ( not ( = ?auto_743215 ?auto_743219 ) ) ( not ( = ?auto_743215 ?auto_743220 ) ) ( not ( = ?auto_743215 ?auto_743221 ) ) ( not ( = ?auto_743215 ?auto_743222 ) ) ( not ( = ?auto_743215 ?auto_743223 ) ) ( not ( = ?auto_743215 ?auto_743224 ) ) ( not ( = ?auto_743216 ?auto_743217 ) ) ( not ( = ?auto_743216 ?auto_743218 ) ) ( not ( = ?auto_743216 ?auto_743219 ) ) ( not ( = ?auto_743216 ?auto_743220 ) ) ( not ( = ?auto_743216 ?auto_743221 ) ) ( not ( = ?auto_743216 ?auto_743222 ) ) ( not ( = ?auto_743216 ?auto_743223 ) ) ( not ( = ?auto_743216 ?auto_743224 ) ) ( not ( = ?auto_743217 ?auto_743218 ) ) ( not ( = ?auto_743217 ?auto_743219 ) ) ( not ( = ?auto_743217 ?auto_743220 ) ) ( not ( = ?auto_743217 ?auto_743221 ) ) ( not ( = ?auto_743217 ?auto_743222 ) ) ( not ( = ?auto_743217 ?auto_743223 ) ) ( not ( = ?auto_743217 ?auto_743224 ) ) ( not ( = ?auto_743218 ?auto_743219 ) ) ( not ( = ?auto_743218 ?auto_743220 ) ) ( not ( = ?auto_743218 ?auto_743221 ) ) ( not ( = ?auto_743218 ?auto_743222 ) ) ( not ( = ?auto_743218 ?auto_743223 ) ) ( not ( = ?auto_743218 ?auto_743224 ) ) ( not ( = ?auto_743219 ?auto_743220 ) ) ( not ( = ?auto_743219 ?auto_743221 ) ) ( not ( = ?auto_743219 ?auto_743222 ) ) ( not ( = ?auto_743219 ?auto_743223 ) ) ( not ( = ?auto_743219 ?auto_743224 ) ) ( not ( = ?auto_743220 ?auto_743221 ) ) ( not ( = ?auto_743220 ?auto_743222 ) ) ( not ( = ?auto_743220 ?auto_743223 ) ) ( not ( = ?auto_743220 ?auto_743224 ) ) ( not ( = ?auto_743221 ?auto_743222 ) ) ( not ( = ?auto_743221 ?auto_743223 ) ) ( not ( = ?auto_743221 ?auto_743224 ) ) ( not ( = ?auto_743222 ?auto_743223 ) ) ( not ( = ?auto_743222 ?auto_743224 ) ) ( not ( = ?auto_743223 ?auto_743224 ) ) ( CLEAR ?auto_743221 ) ( ON ?auto_743222 ?auto_743223 ) ( CLEAR ?auto_743222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_743210 ?auto_743211 ?auto_743212 ?auto_743213 ?auto_743214 ?auto_743215 ?auto_743216 ?auto_743217 ?auto_743218 ?auto_743219 ?auto_743220 ?auto_743221 ?auto_743222 )
      ( MAKE-14PILE ?auto_743210 ?auto_743211 ?auto_743212 ?auto_743213 ?auto_743214 ?auto_743215 ?auto_743216 ?auto_743217 ?auto_743218 ?auto_743219 ?auto_743220 ?auto_743221 ?auto_743222 ?auto_743223 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743268 - BLOCK
      ?auto_743269 - BLOCK
      ?auto_743270 - BLOCK
      ?auto_743271 - BLOCK
      ?auto_743272 - BLOCK
      ?auto_743273 - BLOCK
      ?auto_743274 - BLOCK
      ?auto_743275 - BLOCK
      ?auto_743276 - BLOCK
      ?auto_743277 - BLOCK
      ?auto_743278 - BLOCK
      ?auto_743279 - BLOCK
      ?auto_743280 - BLOCK
      ?auto_743281 - BLOCK
    )
    :vars
    (
      ?auto_743282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743281 ?auto_743282 ) ( ON-TABLE ?auto_743268 ) ( ON ?auto_743269 ?auto_743268 ) ( ON ?auto_743270 ?auto_743269 ) ( ON ?auto_743271 ?auto_743270 ) ( ON ?auto_743272 ?auto_743271 ) ( ON ?auto_743273 ?auto_743272 ) ( ON ?auto_743274 ?auto_743273 ) ( ON ?auto_743275 ?auto_743274 ) ( ON ?auto_743276 ?auto_743275 ) ( ON ?auto_743277 ?auto_743276 ) ( ON ?auto_743278 ?auto_743277 ) ( not ( = ?auto_743268 ?auto_743269 ) ) ( not ( = ?auto_743268 ?auto_743270 ) ) ( not ( = ?auto_743268 ?auto_743271 ) ) ( not ( = ?auto_743268 ?auto_743272 ) ) ( not ( = ?auto_743268 ?auto_743273 ) ) ( not ( = ?auto_743268 ?auto_743274 ) ) ( not ( = ?auto_743268 ?auto_743275 ) ) ( not ( = ?auto_743268 ?auto_743276 ) ) ( not ( = ?auto_743268 ?auto_743277 ) ) ( not ( = ?auto_743268 ?auto_743278 ) ) ( not ( = ?auto_743268 ?auto_743279 ) ) ( not ( = ?auto_743268 ?auto_743280 ) ) ( not ( = ?auto_743268 ?auto_743281 ) ) ( not ( = ?auto_743268 ?auto_743282 ) ) ( not ( = ?auto_743269 ?auto_743270 ) ) ( not ( = ?auto_743269 ?auto_743271 ) ) ( not ( = ?auto_743269 ?auto_743272 ) ) ( not ( = ?auto_743269 ?auto_743273 ) ) ( not ( = ?auto_743269 ?auto_743274 ) ) ( not ( = ?auto_743269 ?auto_743275 ) ) ( not ( = ?auto_743269 ?auto_743276 ) ) ( not ( = ?auto_743269 ?auto_743277 ) ) ( not ( = ?auto_743269 ?auto_743278 ) ) ( not ( = ?auto_743269 ?auto_743279 ) ) ( not ( = ?auto_743269 ?auto_743280 ) ) ( not ( = ?auto_743269 ?auto_743281 ) ) ( not ( = ?auto_743269 ?auto_743282 ) ) ( not ( = ?auto_743270 ?auto_743271 ) ) ( not ( = ?auto_743270 ?auto_743272 ) ) ( not ( = ?auto_743270 ?auto_743273 ) ) ( not ( = ?auto_743270 ?auto_743274 ) ) ( not ( = ?auto_743270 ?auto_743275 ) ) ( not ( = ?auto_743270 ?auto_743276 ) ) ( not ( = ?auto_743270 ?auto_743277 ) ) ( not ( = ?auto_743270 ?auto_743278 ) ) ( not ( = ?auto_743270 ?auto_743279 ) ) ( not ( = ?auto_743270 ?auto_743280 ) ) ( not ( = ?auto_743270 ?auto_743281 ) ) ( not ( = ?auto_743270 ?auto_743282 ) ) ( not ( = ?auto_743271 ?auto_743272 ) ) ( not ( = ?auto_743271 ?auto_743273 ) ) ( not ( = ?auto_743271 ?auto_743274 ) ) ( not ( = ?auto_743271 ?auto_743275 ) ) ( not ( = ?auto_743271 ?auto_743276 ) ) ( not ( = ?auto_743271 ?auto_743277 ) ) ( not ( = ?auto_743271 ?auto_743278 ) ) ( not ( = ?auto_743271 ?auto_743279 ) ) ( not ( = ?auto_743271 ?auto_743280 ) ) ( not ( = ?auto_743271 ?auto_743281 ) ) ( not ( = ?auto_743271 ?auto_743282 ) ) ( not ( = ?auto_743272 ?auto_743273 ) ) ( not ( = ?auto_743272 ?auto_743274 ) ) ( not ( = ?auto_743272 ?auto_743275 ) ) ( not ( = ?auto_743272 ?auto_743276 ) ) ( not ( = ?auto_743272 ?auto_743277 ) ) ( not ( = ?auto_743272 ?auto_743278 ) ) ( not ( = ?auto_743272 ?auto_743279 ) ) ( not ( = ?auto_743272 ?auto_743280 ) ) ( not ( = ?auto_743272 ?auto_743281 ) ) ( not ( = ?auto_743272 ?auto_743282 ) ) ( not ( = ?auto_743273 ?auto_743274 ) ) ( not ( = ?auto_743273 ?auto_743275 ) ) ( not ( = ?auto_743273 ?auto_743276 ) ) ( not ( = ?auto_743273 ?auto_743277 ) ) ( not ( = ?auto_743273 ?auto_743278 ) ) ( not ( = ?auto_743273 ?auto_743279 ) ) ( not ( = ?auto_743273 ?auto_743280 ) ) ( not ( = ?auto_743273 ?auto_743281 ) ) ( not ( = ?auto_743273 ?auto_743282 ) ) ( not ( = ?auto_743274 ?auto_743275 ) ) ( not ( = ?auto_743274 ?auto_743276 ) ) ( not ( = ?auto_743274 ?auto_743277 ) ) ( not ( = ?auto_743274 ?auto_743278 ) ) ( not ( = ?auto_743274 ?auto_743279 ) ) ( not ( = ?auto_743274 ?auto_743280 ) ) ( not ( = ?auto_743274 ?auto_743281 ) ) ( not ( = ?auto_743274 ?auto_743282 ) ) ( not ( = ?auto_743275 ?auto_743276 ) ) ( not ( = ?auto_743275 ?auto_743277 ) ) ( not ( = ?auto_743275 ?auto_743278 ) ) ( not ( = ?auto_743275 ?auto_743279 ) ) ( not ( = ?auto_743275 ?auto_743280 ) ) ( not ( = ?auto_743275 ?auto_743281 ) ) ( not ( = ?auto_743275 ?auto_743282 ) ) ( not ( = ?auto_743276 ?auto_743277 ) ) ( not ( = ?auto_743276 ?auto_743278 ) ) ( not ( = ?auto_743276 ?auto_743279 ) ) ( not ( = ?auto_743276 ?auto_743280 ) ) ( not ( = ?auto_743276 ?auto_743281 ) ) ( not ( = ?auto_743276 ?auto_743282 ) ) ( not ( = ?auto_743277 ?auto_743278 ) ) ( not ( = ?auto_743277 ?auto_743279 ) ) ( not ( = ?auto_743277 ?auto_743280 ) ) ( not ( = ?auto_743277 ?auto_743281 ) ) ( not ( = ?auto_743277 ?auto_743282 ) ) ( not ( = ?auto_743278 ?auto_743279 ) ) ( not ( = ?auto_743278 ?auto_743280 ) ) ( not ( = ?auto_743278 ?auto_743281 ) ) ( not ( = ?auto_743278 ?auto_743282 ) ) ( not ( = ?auto_743279 ?auto_743280 ) ) ( not ( = ?auto_743279 ?auto_743281 ) ) ( not ( = ?auto_743279 ?auto_743282 ) ) ( not ( = ?auto_743280 ?auto_743281 ) ) ( not ( = ?auto_743280 ?auto_743282 ) ) ( not ( = ?auto_743281 ?auto_743282 ) ) ( ON ?auto_743280 ?auto_743281 ) ( CLEAR ?auto_743278 ) ( ON ?auto_743279 ?auto_743280 ) ( CLEAR ?auto_743279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_743268 ?auto_743269 ?auto_743270 ?auto_743271 ?auto_743272 ?auto_743273 ?auto_743274 ?auto_743275 ?auto_743276 ?auto_743277 ?auto_743278 ?auto_743279 )
      ( MAKE-14PILE ?auto_743268 ?auto_743269 ?auto_743270 ?auto_743271 ?auto_743272 ?auto_743273 ?auto_743274 ?auto_743275 ?auto_743276 ?auto_743277 ?auto_743278 ?auto_743279 ?auto_743280 ?auto_743281 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743326 - BLOCK
      ?auto_743327 - BLOCK
      ?auto_743328 - BLOCK
      ?auto_743329 - BLOCK
      ?auto_743330 - BLOCK
      ?auto_743331 - BLOCK
      ?auto_743332 - BLOCK
      ?auto_743333 - BLOCK
      ?auto_743334 - BLOCK
      ?auto_743335 - BLOCK
      ?auto_743336 - BLOCK
      ?auto_743337 - BLOCK
      ?auto_743338 - BLOCK
      ?auto_743339 - BLOCK
    )
    :vars
    (
      ?auto_743340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743339 ?auto_743340 ) ( ON-TABLE ?auto_743326 ) ( ON ?auto_743327 ?auto_743326 ) ( ON ?auto_743328 ?auto_743327 ) ( ON ?auto_743329 ?auto_743328 ) ( ON ?auto_743330 ?auto_743329 ) ( ON ?auto_743331 ?auto_743330 ) ( ON ?auto_743332 ?auto_743331 ) ( ON ?auto_743333 ?auto_743332 ) ( ON ?auto_743334 ?auto_743333 ) ( ON ?auto_743335 ?auto_743334 ) ( not ( = ?auto_743326 ?auto_743327 ) ) ( not ( = ?auto_743326 ?auto_743328 ) ) ( not ( = ?auto_743326 ?auto_743329 ) ) ( not ( = ?auto_743326 ?auto_743330 ) ) ( not ( = ?auto_743326 ?auto_743331 ) ) ( not ( = ?auto_743326 ?auto_743332 ) ) ( not ( = ?auto_743326 ?auto_743333 ) ) ( not ( = ?auto_743326 ?auto_743334 ) ) ( not ( = ?auto_743326 ?auto_743335 ) ) ( not ( = ?auto_743326 ?auto_743336 ) ) ( not ( = ?auto_743326 ?auto_743337 ) ) ( not ( = ?auto_743326 ?auto_743338 ) ) ( not ( = ?auto_743326 ?auto_743339 ) ) ( not ( = ?auto_743326 ?auto_743340 ) ) ( not ( = ?auto_743327 ?auto_743328 ) ) ( not ( = ?auto_743327 ?auto_743329 ) ) ( not ( = ?auto_743327 ?auto_743330 ) ) ( not ( = ?auto_743327 ?auto_743331 ) ) ( not ( = ?auto_743327 ?auto_743332 ) ) ( not ( = ?auto_743327 ?auto_743333 ) ) ( not ( = ?auto_743327 ?auto_743334 ) ) ( not ( = ?auto_743327 ?auto_743335 ) ) ( not ( = ?auto_743327 ?auto_743336 ) ) ( not ( = ?auto_743327 ?auto_743337 ) ) ( not ( = ?auto_743327 ?auto_743338 ) ) ( not ( = ?auto_743327 ?auto_743339 ) ) ( not ( = ?auto_743327 ?auto_743340 ) ) ( not ( = ?auto_743328 ?auto_743329 ) ) ( not ( = ?auto_743328 ?auto_743330 ) ) ( not ( = ?auto_743328 ?auto_743331 ) ) ( not ( = ?auto_743328 ?auto_743332 ) ) ( not ( = ?auto_743328 ?auto_743333 ) ) ( not ( = ?auto_743328 ?auto_743334 ) ) ( not ( = ?auto_743328 ?auto_743335 ) ) ( not ( = ?auto_743328 ?auto_743336 ) ) ( not ( = ?auto_743328 ?auto_743337 ) ) ( not ( = ?auto_743328 ?auto_743338 ) ) ( not ( = ?auto_743328 ?auto_743339 ) ) ( not ( = ?auto_743328 ?auto_743340 ) ) ( not ( = ?auto_743329 ?auto_743330 ) ) ( not ( = ?auto_743329 ?auto_743331 ) ) ( not ( = ?auto_743329 ?auto_743332 ) ) ( not ( = ?auto_743329 ?auto_743333 ) ) ( not ( = ?auto_743329 ?auto_743334 ) ) ( not ( = ?auto_743329 ?auto_743335 ) ) ( not ( = ?auto_743329 ?auto_743336 ) ) ( not ( = ?auto_743329 ?auto_743337 ) ) ( not ( = ?auto_743329 ?auto_743338 ) ) ( not ( = ?auto_743329 ?auto_743339 ) ) ( not ( = ?auto_743329 ?auto_743340 ) ) ( not ( = ?auto_743330 ?auto_743331 ) ) ( not ( = ?auto_743330 ?auto_743332 ) ) ( not ( = ?auto_743330 ?auto_743333 ) ) ( not ( = ?auto_743330 ?auto_743334 ) ) ( not ( = ?auto_743330 ?auto_743335 ) ) ( not ( = ?auto_743330 ?auto_743336 ) ) ( not ( = ?auto_743330 ?auto_743337 ) ) ( not ( = ?auto_743330 ?auto_743338 ) ) ( not ( = ?auto_743330 ?auto_743339 ) ) ( not ( = ?auto_743330 ?auto_743340 ) ) ( not ( = ?auto_743331 ?auto_743332 ) ) ( not ( = ?auto_743331 ?auto_743333 ) ) ( not ( = ?auto_743331 ?auto_743334 ) ) ( not ( = ?auto_743331 ?auto_743335 ) ) ( not ( = ?auto_743331 ?auto_743336 ) ) ( not ( = ?auto_743331 ?auto_743337 ) ) ( not ( = ?auto_743331 ?auto_743338 ) ) ( not ( = ?auto_743331 ?auto_743339 ) ) ( not ( = ?auto_743331 ?auto_743340 ) ) ( not ( = ?auto_743332 ?auto_743333 ) ) ( not ( = ?auto_743332 ?auto_743334 ) ) ( not ( = ?auto_743332 ?auto_743335 ) ) ( not ( = ?auto_743332 ?auto_743336 ) ) ( not ( = ?auto_743332 ?auto_743337 ) ) ( not ( = ?auto_743332 ?auto_743338 ) ) ( not ( = ?auto_743332 ?auto_743339 ) ) ( not ( = ?auto_743332 ?auto_743340 ) ) ( not ( = ?auto_743333 ?auto_743334 ) ) ( not ( = ?auto_743333 ?auto_743335 ) ) ( not ( = ?auto_743333 ?auto_743336 ) ) ( not ( = ?auto_743333 ?auto_743337 ) ) ( not ( = ?auto_743333 ?auto_743338 ) ) ( not ( = ?auto_743333 ?auto_743339 ) ) ( not ( = ?auto_743333 ?auto_743340 ) ) ( not ( = ?auto_743334 ?auto_743335 ) ) ( not ( = ?auto_743334 ?auto_743336 ) ) ( not ( = ?auto_743334 ?auto_743337 ) ) ( not ( = ?auto_743334 ?auto_743338 ) ) ( not ( = ?auto_743334 ?auto_743339 ) ) ( not ( = ?auto_743334 ?auto_743340 ) ) ( not ( = ?auto_743335 ?auto_743336 ) ) ( not ( = ?auto_743335 ?auto_743337 ) ) ( not ( = ?auto_743335 ?auto_743338 ) ) ( not ( = ?auto_743335 ?auto_743339 ) ) ( not ( = ?auto_743335 ?auto_743340 ) ) ( not ( = ?auto_743336 ?auto_743337 ) ) ( not ( = ?auto_743336 ?auto_743338 ) ) ( not ( = ?auto_743336 ?auto_743339 ) ) ( not ( = ?auto_743336 ?auto_743340 ) ) ( not ( = ?auto_743337 ?auto_743338 ) ) ( not ( = ?auto_743337 ?auto_743339 ) ) ( not ( = ?auto_743337 ?auto_743340 ) ) ( not ( = ?auto_743338 ?auto_743339 ) ) ( not ( = ?auto_743338 ?auto_743340 ) ) ( not ( = ?auto_743339 ?auto_743340 ) ) ( ON ?auto_743338 ?auto_743339 ) ( ON ?auto_743337 ?auto_743338 ) ( CLEAR ?auto_743335 ) ( ON ?auto_743336 ?auto_743337 ) ( CLEAR ?auto_743336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_743326 ?auto_743327 ?auto_743328 ?auto_743329 ?auto_743330 ?auto_743331 ?auto_743332 ?auto_743333 ?auto_743334 ?auto_743335 ?auto_743336 )
      ( MAKE-14PILE ?auto_743326 ?auto_743327 ?auto_743328 ?auto_743329 ?auto_743330 ?auto_743331 ?auto_743332 ?auto_743333 ?auto_743334 ?auto_743335 ?auto_743336 ?auto_743337 ?auto_743338 ?auto_743339 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743384 - BLOCK
      ?auto_743385 - BLOCK
      ?auto_743386 - BLOCK
      ?auto_743387 - BLOCK
      ?auto_743388 - BLOCK
      ?auto_743389 - BLOCK
      ?auto_743390 - BLOCK
      ?auto_743391 - BLOCK
      ?auto_743392 - BLOCK
      ?auto_743393 - BLOCK
      ?auto_743394 - BLOCK
      ?auto_743395 - BLOCK
      ?auto_743396 - BLOCK
      ?auto_743397 - BLOCK
    )
    :vars
    (
      ?auto_743398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743397 ?auto_743398 ) ( ON-TABLE ?auto_743384 ) ( ON ?auto_743385 ?auto_743384 ) ( ON ?auto_743386 ?auto_743385 ) ( ON ?auto_743387 ?auto_743386 ) ( ON ?auto_743388 ?auto_743387 ) ( ON ?auto_743389 ?auto_743388 ) ( ON ?auto_743390 ?auto_743389 ) ( ON ?auto_743391 ?auto_743390 ) ( ON ?auto_743392 ?auto_743391 ) ( not ( = ?auto_743384 ?auto_743385 ) ) ( not ( = ?auto_743384 ?auto_743386 ) ) ( not ( = ?auto_743384 ?auto_743387 ) ) ( not ( = ?auto_743384 ?auto_743388 ) ) ( not ( = ?auto_743384 ?auto_743389 ) ) ( not ( = ?auto_743384 ?auto_743390 ) ) ( not ( = ?auto_743384 ?auto_743391 ) ) ( not ( = ?auto_743384 ?auto_743392 ) ) ( not ( = ?auto_743384 ?auto_743393 ) ) ( not ( = ?auto_743384 ?auto_743394 ) ) ( not ( = ?auto_743384 ?auto_743395 ) ) ( not ( = ?auto_743384 ?auto_743396 ) ) ( not ( = ?auto_743384 ?auto_743397 ) ) ( not ( = ?auto_743384 ?auto_743398 ) ) ( not ( = ?auto_743385 ?auto_743386 ) ) ( not ( = ?auto_743385 ?auto_743387 ) ) ( not ( = ?auto_743385 ?auto_743388 ) ) ( not ( = ?auto_743385 ?auto_743389 ) ) ( not ( = ?auto_743385 ?auto_743390 ) ) ( not ( = ?auto_743385 ?auto_743391 ) ) ( not ( = ?auto_743385 ?auto_743392 ) ) ( not ( = ?auto_743385 ?auto_743393 ) ) ( not ( = ?auto_743385 ?auto_743394 ) ) ( not ( = ?auto_743385 ?auto_743395 ) ) ( not ( = ?auto_743385 ?auto_743396 ) ) ( not ( = ?auto_743385 ?auto_743397 ) ) ( not ( = ?auto_743385 ?auto_743398 ) ) ( not ( = ?auto_743386 ?auto_743387 ) ) ( not ( = ?auto_743386 ?auto_743388 ) ) ( not ( = ?auto_743386 ?auto_743389 ) ) ( not ( = ?auto_743386 ?auto_743390 ) ) ( not ( = ?auto_743386 ?auto_743391 ) ) ( not ( = ?auto_743386 ?auto_743392 ) ) ( not ( = ?auto_743386 ?auto_743393 ) ) ( not ( = ?auto_743386 ?auto_743394 ) ) ( not ( = ?auto_743386 ?auto_743395 ) ) ( not ( = ?auto_743386 ?auto_743396 ) ) ( not ( = ?auto_743386 ?auto_743397 ) ) ( not ( = ?auto_743386 ?auto_743398 ) ) ( not ( = ?auto_743387 ?auto_743388 ) ) ( not ( = ?auto_743387 ?auto_743389 ) ) ( not ( = ?auto_743387 ?auto_743390 ) ) ( not ( = ?auto_743387 ?auto_743391 ) ) ( not ( = ?auto_743387 ?auto_743392 ) ) ( not ( = ?auto_743387 ?auto_743393 ) ) ( not ( = ?auto_743387 ?auto_743394 ) ) ( not ( = ?auto_743387 ?auto_743395 ) ) ( not ( = ?auto_743387 ?auto_743396 ) ) ( not ( = ?auto_743387 ?auto_743397 ) ) ( not ( = ?auto_743387 ?auto_743398 ) ) ( not ( = ?auto_743388 ?auto_743389 ) ) ( not ( = ?auto_743388 ?auto_743390 ) ) ( not ( = ?auto_743388 ?auto_743391 ) ) ( not ( = ?auto_743388 ?auto_743392 ) ) ( not ( = ?auto_743388 ?auto_743393 ) ) ( not ( = ?auto_743388 ?auto_743394 ) ) ( not ( = ?auto_743388 ?auto_743395 ) ) ( not ( = ?auto_743388 ?auto_743396 ) ) ( not ( = ?auto_743388 ?auto_743397 ) ) ( not ( = ?auto_743388 ?auto_743398 ) ) ( not ( = ?auto_743389 ?auto_743390 ) ) ( not ( = ?auto_743389 ?auto_743391 ) ) ( not ( = ?auto_743389 ?auto_743392 ) ) ( not ( = ?auto_743389 ?auto_743393 ) ) ( not ( = ?auto_743389 ?auto_743394 ) ) ( not ( = ?auto_743389 ?auto_743395 ) ) ( not ( = ?auto_743389 ?auto_743396 ) ) ( not ( = ?auto_743389 ?auto_743397 ) ) ( not ( = ?auto_743389 ?auto_743398 ) ) ( not ( = ?auto_743390 ?auto_743391 ) ) ( not ( = ?auto_743390 ?auto_743392 ) ) ( not ( = ?auto_743390 ?auto_743393 ) ) ( not ( = ?auto_743390 ?auto_743394 ) ) ( not ( = ?auto_743390 ?auto_743395 ) ) ( not ( = ?auto_743390 ?auto_743396 ) ) ( not ( = ?auto_743390 ?auto_743397 ) ) ( not ( = ?auto_743390 ?auto_743398 ) ) ( not ( = ?auto_743391 ?auto_743392 ) ) ( not ( = ?auto_743391 ?auto_743393 ) ) ( not ( = ?auto_743391 ?auto_743394 ) ) ( not ( = ?auto_743391 ?auto_743395 ) ) ( not ( = ?auto_743391 ?auto_743396 ) ) ( not ( = ?auto_743391 ?auto_743397 ) ) ( not ( = ?auto_743391 ?auto_743398 ) ) ( not ( = ?auto_743392 ?auto_743393 ) ) ( not ( = ?auto_743392 ?auto_743394 ) ) ( not ( = ?auto_743392 ?auto_743395 ) ) ( not ( = ?auto_743392 ?auto_743396 ) ) ( not ( = ?auto_743392 ?auto_743397 ) ) ( not ( = ?auto_743392 ?auto_743398 ) ) ( not ( = ?auto_743393 ?auto_743394 ) ) ( not ( = ?auto_743393 ?auto_743395 ) ) ( not ( = ?auto_743393 ?auto_743396 ) ) ( not ( = ?auto_743393 ?auto_743397 ) ) ( not ( = ?auto_743393 ?auto_743398 ) ) ( not ( = ?auto_743394 ?auto_743395 ) ) ( not ( = ?auto_743394 ?auto_743396 ) ) ( not ( = ?auto_743394 ?auto_743397 ) ) ( not ( = ?auto_743394 ?auto_743398 ) ) ( not ( = ?auto_743395 ?auto_743396 ) ) ( not ( = ?auto_743395 ?auto_743397 ) ) ( not ( = ?auto_743395 ?auto_743398 ) ) ( not ( = ?auto_743396 ?auto_743397 ) ) ( not ( = ?auto_743396 ?auto_743398 ) ) ( not ( = ?auto_743397 ?auto_743398 ) ) ( ON ?auto_743396 ?auto_743397 ) ( ON ?auto_743395 ?auto_743396 ) ( ON ?auto_743394 ?auto_743395 ) ( CLEAR ?auto_743392 ) ( ON ?auto_743393 ?auto_743394 ) ( CLEAR ?auto_743393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_743384 ?auto_743385 ?auto_743386 ?auto_743387 ?auto_743388 ?auto_743389 ?auto_743390 ?auto_743391 ?auto_743392 ?auto_743393 )
      ( MAKE-14PILE ?auto_743384 ?auto_743385 ?auto_743386 ?auto_743387 ?auto_743388 ?auto_743389 ?auto_743390 ?auto_743391 ?auto_743392 ?auto_743393 ?auto_743394 ?auto_743395 ?auto_743396 ?auto_743397 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743442 - BLOCK
      ?auto_743443 - BLOCK
      ?auto_743444 - BLOCK
      ?auto_743445 - BLOCK
      ?auto_743446 - BLOCK
      ?auto_743447 - BLOCK
      ?auto_743448 - BLOCK
      ?auto_743449 - BLOCK
      ?auto_743450 - BLOCK
      ?auto_743451 - BLOCK
      ?auto_743452 - BLOCK
      ?auto_743453 - BLOCK
      ?auto_743454 - BLOCK
      ?auto_743455 - BLOCK
    )
    :vars
    (
      ?auto_743456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743455 ?auto_743456 ) ( ON-TABLE ?auto_743442 ) ( ON ?auto_743443 ?auto_743442 ) ( ON ?auto_743444 ?auto_743443 ) ( ON ?auto_743445 ?auto_743444 ) ( ON ?auto_743446 ?auto_743445 ) ( ON ?auto_743447 ?auto_743446 ) ( ON ?auto_743448 ?auto_743447 ) ( ON ?auto_743449 ?auto_743448 ) ( not ( = ?auto_743442 ?auto_743443 ) ) ( not ( = ?auto_743442 ?auto_743444 ) ) ( not ( = ?auto_743442 ?auto_743445 ) ) ( not ( = ?auto_743442 ?auto_743446 ) ) ( not ( = ?auto_743442 ?auto_743447 ) ) ( not ( = ?auto_743442 ?auto_743448 ) ) ( not ( = ?auto_743442 ?auto_743449 ) ) ( not ( = ?auto_743442 ?auto_743450 ) ) ( not ( = ?auto_743442 ?auto_743451 ) ) ( not ( = ?auto_743442 ?auto_743452 ) ) ( not ( = ?auto_743442 ?auto_743453 ) ) ( not ( = ?auto_743442 ?auto_743454 ) ) ( not ( = ?auto_743442 ?auto_743455 ) ) ( not ( = ?auto_743442 ?auto_743456 ) ) ( not ( = ?auto_743443 ?auto_743444 ) ) ( not ( = ?auto_743443 ?auto_743445 ) ) ( not ( = ?auto_743443 ?auto_743446 ) ) ( not ( = ?auto_743443 ?auto_743447 ) ) ( not ( = ?auto_743443 ?auto_743448 ) ) ( not ( = ?auto_743443 ?auto_743449 ) ) ( not ( = ?auto_743443 ?auto_743450 ) ) ( not ( = ?auto_743443 ?auto_743451 ) ) ( not ( = ?auto_743443 ?auto_743452 ) ) ( not ( = ?auto_743443 ?auto_743453 ) ) ( not ( = ?auto_743443 ?auto_743454 ) ) ( not ( = ?auto_743443 ?auto_743455 ) ) ( not ( = ?auto_743443 ?auto_743456 ) ) ( not ( = ?auto_743444 ?auto_743445 ) ) ( not ( = ?auto_743444 ?auto_743446 ) ) ( not ( = ?auto_743444 ?auto_743447 ) ) ( not ( = ?auto_743444 ?auto_743448 ) ) ( not ( = ?auto_743444 ?auto_743449 ) ) ( not ( = ?auto_743444 ?auto_743450 ) ) ( not ( = ?auto_743444 ?auto_743451 ) ) ( not ( = ?auto_743444 ?auto_743452 ) ) ( not ( = ?auto_743444 ?auto_743453 ) ) ( not ( = ?auto_743444 ?auto_743454 ) ) ( not ( = ?auto_743444 ?auto_743455 ) ) ( not ( = ?auto_743444 ?auto_743456 ) ) ( not ( = ?auto_743445 ?auto_743446 ) ) ( not ( = ?auto_743445 ?auto_743447 ) ) ( not ( = ?auto_743445 ?auto_743448 ) ) ( not ( = ?auto_743445 ?auto_743449 ) ) ( not ( = ?auto_743445 ?auto_743450 ) ) ( not ( = ?auto_743445 ?auto_743451 ) ) ( not ( = ?auto_743445 ?auto_743452 ) ) ( not ( = ?auto_743445 ?auto_743453 ) ) ( not ( = ?auto_743445 ?auto_743454 ) ) ( not ( = ?auto_743445 ?auto_743455 ) ) ( not ( = ?auto_743445 ?auto_743456 ) ) ( not ( = ?auto_743446 ?auto_743447 ) ) ( not ( = ?auto_743446 ?auto_743448 ) ) ( not ( = ?auto_743446 ?auto_743449 ) ) ( not ( = ?auto_743446 ?auto_743450 ) ) ( not ( = ?auto_743446 ?auto_743451 ) ) ( not ( = ?auto_743446 ?auto_743452 ) ) ( not ( = ?auto_743446 ?auto_743453 ) ) ( not ( = ?auto_743446 ?auto_743454 ) ) ( not ( = ?auto_743446 ?auto_743455 ) ) ( not ( = ?auto_743446 ?auto_743456 ) ) ( not ( = ?auto_743447 ?auto_743448 ) ) ( not ( = ?auto_743447 ?auto_743449 ) ) ( not ( = ?auto_743447 ?auto_743450 ) ) ( not ( = ?auto_743447 ?auto_743451 ) ) ( not ( = ?auto_743447 ?auto_743452 ) ) ( not ( = ?auto_743447 ?auto_743453 ) ) ( not ( = ?auto_743447 ?auto_743454 ) ) ( not ( = ?auto_743447 ?auto_743455 ) ) ( not ( = ?auto_743447 ?auto_743456 ) ) ( not ( = ?auto_743448 ?auto_743449 ) ) ( not ( = ?auto_743448 ?auto_743450 ) ) ( not ( = ?auto_743448 ?auto_743451 ) ) ( not ( = ?auto_743448 ?auto_743452 ) ) ( not ( = ?auto_743448 ?auto_743453 ) ) ( not ( = ?auto_743448 ?auto_743454 ) ) ( not ( = ?auto_743448 ?auto_743455 ) ) ( not ( = ?auto_743448 ?auto_743456 ) ) ( not ( = ?auto_743449 ?auto_743450 ) ) ( not ( = ?auto_743449 ?auto_743451 ) ) ( not ( = ?auto_743449 ?auto_743452 ) ) ( not ( = ?auto_743449 ?auto_743453 ) ) ( not ( = ?auto_743449 ?auto_743454 ) ) ( not ( = ?auto_743449 ?auto_743455 ) ) ( not ( = ?auto_743449 ?auto_743456 ) ) ( not ( = ?auto_743450 ?auto_743451 ) ) ( not ( = ?auto_743450 ?auto_743452 ) ) ( not ( = ?auto_743450 ?auto_743453 ) ) ( not ( = ?auto_743450 ?auto_743454 ) ) ( not ( = ?auto_743450 ?auto_743455 ) ) ( not ( = ?auto_743450 ?auto_743456 ) ) ( not ( = ?auto_743451 ?auto_743452 ) ) ( not ( = ?auto_743451 ?auto_743453 ) ) ( not ( = ?auto_743451 ?auto_743454 ) ) ( not ( = ?auto_743451 ?auto_743455 ) ) ( not ( = ?auto_743451 ?auto_743456 ) ) ( not ( = ?auto_743452 ?auto_743453 ) ) ( not ( = ?auto_743452 ?auto_743454 ) ) ( not ( = ?auto_743452 ?auto_743455 ) ) ( not ( = ?auto_743452 ?auto_743456 ) ) ( not ( = ?auto_743453 ?auto_743454 ) ) ( not ( = ?auto_743453 ?auto_743455 ) ) ( not ( = ?auto_743453 ?auto_743456 ) ) ( not ( = ?auto_743454 ?auto_743455 ) ) ( not ( = ?auto_743454 ?auto_743456 ) ) ( not ( = ?auto_743455 ?auto_743456 ) ) ( ON ?auto_743454 ?auto_743455 ) ( ON ?auto_743453 ?auto_743454 ) ( ON ?auto_743452 ?auto_743453 ) ( ON ?auto_743451 ?auto_743452 ) ( CLEAR ?auto_743449 ) ( ON ?auto_743450 ?auto_743451 ) ( CLEAR ?auto_743450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_743442 ?auto_743443 ?auto_743444 ?auto_743445 ?auto_743446 ?auto_743447 ?auto_743448 ?auto_743449 ?auto_743450 )
      ( MAKE-14PILE ?auto_743442 ?auto_743443 ?auto_743444 ?auto_743445 ?auto_743446 ?auto_743447 ?auto_743448 ?auto_743449 ?auto_743450 ?auto_743451 ?auto_743452 ?auto_743453 ?auto_743454 ?auto_743455 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743500 - BLOCK
      ?auto_743501 - BLOCK
      ?auto_743502 - BLOCK
      ?auto_743503 - BLOCK
      ?auto_743504 - BLOCK
      ?auto_743505 - BLOCK
      ?auto_743506 - BLOCK
      ?auto_743507 - BLOCK
      ?auto_743508 - BLOCK
      ?auto_743509 - BLOCK
      ?auto_743510 - BLOCK
      ?auto_743511 - BLOCK
      ?auto_743512 - BLOCK
      ?auto_743513 - BLOCK
    )
    :vars
    (
      ?auto_743514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743513 ?auto_743514 ) ( ON-TABLE ?auto_743500 ) ( ON ?auto_743501 ?auto_743500 ) ( ON ?auto_743502 ?auto_743501 ) ( ON ?auto_743503 ?auto_743502 ) ( ON ?auto_743504 ?auto_743503 ) ( ON ?auto_743505 ?auto_743504 ) ( ON ?auto_743506 ?auto_743505 ) ( not ( = ?auto_743500 ?auto_743501 ) ) ( not ( = ?auto_743500 ?auto_743502 ) ) ( not ( = ?auto_743500 ?auto_743503 ) ) ( not ( = ?auto_743500 ?auto_743504 ) ) ( not ( = ?auto_743500 ?auto_743505 ) ) ( not ( = ?auto_743500 ?auto_743506 ) ) ( not ( = ?auto_743500 ?auto_743507 ) ) ( not ( = ?auto_743500 ?auto_743508 ) ) ( not ( = ?auto_743500 ?auto_743509 ) ) ( not ( = ?auto_743500 ?auto_743510 ) ) ( not ( = ?auto_743500 ?auto_743511 ) ) ( not ( = ?auto_743500 ?auto_743512 ) ) ( not ( = ?auto_743500 ?auto_743513 ) ) ( not ( = ?auto_743500 ?auto_743514 ) ) ( not ( = ?auto_743501 ?auto_743502 ) ) ( not ( = ?auto_743501 ?auto_743503 ) ) ( not ( = ?auto_743501 ?auto_743504 ) ) ( not ( = ?auto_743501 ?auto_743505 ) ) ( not ( = ?auto_743501 ?auto_743506 ) ) ( not ( = ?auto_743501 ?auto_743507 ) ) ( not ( = ?auto_743501 ?auto_743508 ) ) ( not ( = ?auto_743501 ?auto_743509 ) ) ( not ( = ?auto_743501 ?auto_743510 ) ) ( not ( = ?auto_743501 ?auto_743511 ) ) ( not ( = ?auto_743501 ?auto_743512 ) ) ( not ( = ?auto_743501 ?auto_743513 ) ) ( not ( = ?auto_743501 ?auto_743514 ) ) ( not ( = ?auto_743502 ?auto_743503 ) ) ( not ( = ?auto_743502 ?auto_743504 ) ) ( not ( = ?auto_743502 ?auto_743505 ) ) ( not ( = ?auto_743502 ?auto_743506 ) ) ( not ( = ?auto_743502 ?auto_743507 ) ) ( not ( = ?auto_743502 ?auto_743508 ) ) ( not ( = ?auto_743502 ?auto_743509 ) ) ( not ( = ?auto_743502 ?auto_743510 ) ) ( not ( = ?auto_743502 ?auto_743511 ) ) ( not ( = ?auto_743502 ?auto_743512 ) ) ( not ( = ?auto_743502 ?auto_743513 ) ) ( not ( = ?auto_743502 ?auto_743514 ) ) ( not ( = ?auto_743503 ?auto_743504 ) ) ( not ( = ?auto_743503 ?auto_743505 ) ) ( not ( = ?auto_743503 ?auto_743506 ) ) ( not ( = ?auto_743503 ?auto_743507 ) ) ( not ( = ?auto_743503 ?auto_743508 ) ) ( not ( = ?auto_743503 ?auto_743509 ) ) ( not ( = ?auto_743503 ?auto_743510 ) ) ( not ( = ?auto_743503 ?auto_743511 ) ) ( not ( = ?auto_743503 ?auto_743512 ) ) ( not ( = ?auto_743503 ?auto_743513 ) ) ( not ( = ?auto_743503 ?auto_743514 ) ) ( not ( = ?auto_743504 ?auto_743505 ) ) ( not ( = ?auto_743504 ?auto_743506 ) ) ( not ( = ?auto_743504 ?auto_743507 ) ) ( not ( = ?auto_743504 ?auto_743508 ) ) ( not ( = ?auto_743504 ?auto_743509 ) ) ( not ( = ?auto_743504 ?auto_743510 ) ) ( not ( = ?auto_743504 ?auto_743511 ) ) ( not ( = ?auto_743504 ?auto_743512 ) ) ( not ( = ?auto_743504 ?auto_743513 ) ) ( not ( = ?auto_743504 ?auto_743514 ) ) ( not ( = ?auto_743505 ?auto_743506 ) ) ( not ( = ?auto_743505 ?auto_743507 ) ) ( not ( = ?auto_743505 ?auto_743508 ) ) ( not ( = ?auto_743505 ?auto_743509 ) ) ( not ( = ?auto_743505 ?auto_743510 ) ) ( not ( = ?auto_743505 ?auto_743511 ) ) ( not ( = ?auto_743505 ?auto_743512 ) ) ( not ( = ?auto_743505 ?auto_743513 ) ) ( not ( = ?auto_743505 ?auto_743514 ) ) ( not ( = ?auto_743506 ?auto_743507 ) ) ( not ( = ?auto_743506 ?auto_743508 ) ) ( not ( = ?auto_743506 ?auto_743509 ) ) ( not ( = ?auto_743506 ?auto_743510 ) ) ( not ( = ?auto_743506 ?auto_743511 ) ) ( not ( = ?auto_743506 ?auto_743512 ) ) ( not ( = ?auto_743506 ?auto_743513 ) ) ( not ( = ?auto_743506 ?auto_743514 ) ) ( not ( = ?auto_743507 ?auto_743508 ) ) ( not ( = ?auto_743507 ?auto_743509 ) ) ( not ( = ?auto_743507 ?auto_743510 ) ) ( not ( = ?auto_743507 ?auto_743511 ) ) ( not ( = ?auto_743507 ?auto_743512 ) ) ( not ( = ?auto_743507 ?auto_743513 ) ) ( not ( = ?auto_743507 ?auto_743514 ) ) ( not ( = ?auto_743508 ?auto_743509 ) ) ( not ( = ?auto_743508 ?auto_743510 ) ) ( not ( = ?auto_743508 ?auto_743511 ) ) ( not ( = ?auto_743508 ?auto_743512 ) ) ( not ( = ?auto_743508 ?auto_743513 ) ) ( not ( = ?auto_743508 ?auto_743514 ) ) ( not ( = ?auto_743509 ?auto_743510 ) ) ( not ( = ?auto_743509 ?auto_743511 ) ) ( not ( = ?auto_743509 ?auto_743512 ) ) ( not ( = ?auto_743509 ?auto_743513 ) ) ( not ( = ?auto_743509 ?auto_743514 ) ) ( not ( = ?auto_743510 ?auto_743511 ) ) ( not ( = ?auto_743510 ?auto_743512 ) ) ( not ( = ?auto_743510 ?auto_743513 ) ) ( not ( = ?auto_743510 ?auto_743514 ) ) ( not ( = ?auto_743511 ?auto_743512 ) ) ( not ( = ?auto_743511 ?auto_743513 ) ) ( not ( = ?auto_743511 ?auto_743514 ) ) ( not ( = ?auto_743512 ?auto_743513 ) ) ( not ( = ?auto_743512 ?auto_743514 ) ) ( not ( = ?auto_743513 ?auto_743514 ) ) ( ON ?auto_743512 ?auto_743513 ) ( ON ?auto_743511 ?auto_743512 ) ( ON ?auto_743510 ?auto_743511 ) ( ON ?auto_743509 ?auto_743510 ) ( ON ?auto_743508 ?auto_743509 ) ( CLEAR ?auto_743506 ) ( ON ?auto_743507 ?auto_743508 ) ( CLEAR ?auto_743507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_743500 ?auto_743501 ?auto_743502 ?auto_743503 ?auto_743504 ?auto_743505 ?auto_743506 ?auto_743507 )
      ( MAKE-14PILE ?auto_743500 ?auto_743501 ?auto_743502 ?auto_743503 ?auto_743504 ?auto_743505 ?auto_743506 ?auto_743507 ?auto_743508 ?auto_743509 ?auto_743510 ?auto_743511 ?auto_743512 ?auto_743513 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743558 - BLOCK
      ?auto_743559 - BLOCK
      ?auto_743560 - BLOCK
      ?auto_743561 - BLOCK
      ?auto_743562 - BLOCK
      ?auto_743563 - BLOCK
      ?auto_743564 - BLOCK
      ?auto_743565 - BLOCK
      ?auto_743566 - BLOCK
      ?auto_743567 - BLOCK
      ?auto_743568 - BLOCK
      ?auto_743569 - BLOCK
      ?auto_743570 - BLOCK
      ?auto_743571 - BLOCK
    )
    :vars
    (
      ?auto_743572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743571 ?auto_743572 ) ( ON-TABLE ?auto_743558 ) ( ON ?auto_743559 ?auto_743558 ) ( ON ?auto_743560 ?auto_743559 ) ( ON ?auto_743561 ?auto_743560 ) ( ON ?auto_743562 ?auto_743561 ) ( ON ?auto_743563 ?auto_743562 ) ( not ( = ?auto_743558 ?auto_743559 ) ) ( not ( = ?auto_743558 ?auto_743560 ) ) ( not ( = ?auto_743558 ?auto_743561 ) ) ( not ( = ?auto_743558 ?auto_743562 ) ) ( not ( = ?auto_743558 ?auto_743563 ) ) ( not ( = ?auto_743558 ?auto_743564 ) ) ( not ( = ?auto_743558 ?auto_743565 ) ) ( not ( = ?auto_743558 ?auto_743566 ) ) ( not ( = ?auto_743558 ?auto_743567 ) ) ( not ( = ?auto_743558 ?auto_743568 ) ) ( not ( = ?auto_743558 ?auto_743569 ) ) ( not ( = ?auto_743558 ?auto_743570 ) ) ( not ( = ?auto_743558 ?auto_743571 ) ) ( not ( = ?auto_743558 ?auto_743572 ) ) ( not ( = ?auto_743559 ?auto_743560 ) ) ( not ( = ?auto_743559 ?auto_743561 ) ) ( not ( = ?auto_743559 ?auto_743562 ) ) ( not ( = ?auto_743559 ?auto_743563 ) ) ( not ( = ?auto_743559 ?auto_743564 ) ) ( not ( = ?auto_743559 ?auto_743565 ) ) ( not ( = ?auto_743559 ?auto_743566 ) ) ( not ( = ?auto_743559 ?auto_743567 ) ) ( not ( = ?auto_743559 ?auto_743568 ) ) ( not ( = ?auto_743559 ?auto_743569 ) ) ( not ( = ?auto_743559 ?auto_743570 ) ) ( not ( = ?auto_743559 ?auto_743571 ) ) ( not ( = ?auto_743559 ?auto_743572 ) ) ( not ( = ?auto_743560 ?auto_743561 ) ) ( not ( = ?auto_743560 ?auto_743562 ) ) ( not ( = ?auto_743560 ?auto_743563 ) ) ( not ( = ?auto_743560 ?auto_743564 ) ) ( not ( = ?auto_743560 ?auto_743565 ) ) ( not ( = ?auto_743560 ?auto_743566 ) ) ( not ( = ?auto_743560 ?auto_743567 ) ) ( not ( = ?auto_743560 ?auto_743568 ) ) ( not ( = ?auto_743560 ?auto_743569 ) ) ( not ( = ?auto_743560 ?auto_743570 ) ) ( not ( = ?auto_743560 ?auto_743571 ) ) ( not ( = ?auto_743560 ?auto_743572 ) ) ( not ( = ?auto_743561 ?auto_743562 ) ) ( not ( = ?auto_743561 ?auto_743563 ) ) ( not ( = ?auto_743561 ?auto_743564 ) ) ( not ( = ?auto_743561 ?auto_743565 ) ) ( not ( = ?auto_743561 ?auto_743566 ) ) ( not ( = ?auto_743561 ?auto_743567 ) ) ( not ( = ?auto_743561 ?auto_743568 ) ) ( not ( = ?auto_743561 ?auto_743569 ) ) ( not ( = ?auto_743561 ?auto_743570 ) ) ( not ( = ?auto_743561 ?auto_743571 ) ) ( not ( = ?auto_743561 ?auto_743572 ) ) ( not ( = ?auto_743562 ?auto_743563 ) ) ( not ( = ?auto_743562 ?auto_743564 ) ) ( not ( = ?auto_743562 ?auto_743565 ) ) ( not ( = ?auto_743562 ?auto_743566 ) ) ( not ( = ?auto_743562 ?auto_743567 ) ) ( not ( = ?auto_743562 ?auto_743568 ) ) ( not ( = ?auto_743562 ?auto_743569 ) ) ( not ( = ?auto_743562 ?auto_743570 ) ) ( not ( = ?auto_743562 ?auto_743571 ) ) ( not ( = ?auto_743562 ?auto_743572 ) ) ( not ( = ?auto_743563 ?auto_743564 ) ) ( not ( = ?auto_743563 ?auto_743565 ) ) ( not ( = ?auto_743563 ?auto_743566 ) ) ( not ( = ?auto_743563 ?auto_743567 ) ) ( not ( = ?auto_743563 ?auto_743568 ) ) ( not ( = ?auto_743563 ?auto_743569 ) ) ( not ( = ?auto_743563 ?auto_743570 ) ) ( not ( = ?auto_743563 ?auto_743571 ) ) ( not ( = ?auto_743563 ?auto_743572 ) ) ( not ( = ?auto_743564 ?auto_743565 ) ) ( not ( = ?auto_743564 ?auto_743566 ) ) ( not ( = ?auto_743564 ?auto_743567 ) ) ( not ( = ?auto_743564 ?auto_743568 ) ) ( not ( = ?auto_743564 ?auto_743569 ) ) ( not ( = ?auto_743564 ?auto_743570 ) ) ( not ( = ?auto_743564 ?auto_743571 ) ) ( not ( = ?auto_743564 ?auto_743572 ) ) ( not ( = ?auto_743565 ?auto_743566 ) ) ( not ( = ?auto_743565 ?auto_743567 ) ) ( not ( = ?auto_743565 ?auto_743568 ) ) ( not ( = ?auto_743565 ?auto_743569 ) ) ( not ( = ?auto_743565 ?auto_743570 ) ) ( not ( = ?auto_743565 ?auto_743571 ) ) ( not ( = ?auto_743565 ?auto_743572 ) ) ( not ( = ?auto_743566 ?auto_743567 ) ) ( not ( = ?auto_743566 ?auto_743568 ) ) ( not ( = ?auto_743566 ?auto_743569 ) ) ( not ( = ?auto_743566 ?auto_743570 ) ) ( not ( = ?auto_743566 ?auto_743571 ) ) ( not ( = ?auto_743566 ?auto_743572 ) ) ( not ( = ?auto_743567 ?auto_743568 ) ) ( not ( = ?auto_743567 ?auto_743569 ) ) ( not ( = ?auto_743567 ?auto_743570 ) ) ( not ( = ?auto_743567 ?auto_743571 ) ) ( not ( = ?auto_743567 ?auto_743572 ) ) ( not ( = ?auto_743568 ?auto_743569 ) ) ( not ( = ?auto_743568 ?auto_743570 ) ) ( not ( = ?auto_743568 ?auto_743571 ) ) ( not ( = ?auto_743568 ?auto_743572 ) ) ( not ( = ?auto_743569 ?auto_743570 ) ) ( not ( = ?auto_743569 ?auto_743571 ) ) ( not ( = ?auto_743569 ?auto_743572 ) ) ( not ( = ?auto_743570 ?auto_743571 ) ) ( not ( = ?auto_743570 ?auto_743572 ) ) ( not ( = ?auto_743571 ?auto_743572 ) ) ( ON ?auto_743570 ?auto_743571 ) ( ON ?auto_743569 ?auto_743570 ) ( ON ?auto_743568 ?auto_743569 ) ( ON ?auto_743567 ?auto_743568 ) ( ON ?auto_743566 ?auto_743567 ) ( ON ?auto_743565 ?auto_743566 ) ( CLEAR ?auto_743563 ) ( ON ?auto_743564 ?auto_743565 ) ( CLEAR ?auto_743564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_743558 ?auto_743559 ?auto_743560 ?auto_743561 ?auto_743562 ?auto_743563 ?auto_743564 )
      ( MAKE-14PILE ?auto_743558 ?auto_743559 ?auto_743560 ?auto_743561 ?auto_743562 ?auto_743563 ?auto_743564 ?auto_743565 ?auto_743566 ?auto_743567 ?auto_743568 ?auto_743569 ?auto_743570 ?auto_743571 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743616 - BLOCK
      ?auto_743617 - BLOCK
      ?auto_743618 - BLOCK
      ?auto_743619 - BLOCK
      ?auto_743620 - BLOCK
      ?auto_743621 - BLOCK
      ?auto_743622 - BLOCK
      ?auto_743623 - BLOCK
      ?auto_743624 - BLOCK
      ?auto_743625 - BLOCK
      ?auto_743626 - BLOCK
      ?auto_743627 - BLOCK
      ?auto_743628 - BLOCK
      ?auto_743629 - BLOCK
    )
    :vars
    (
      ?auto_743630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743629 ?auto_743630 ) ( ON-TABLE ?auto_743616 ) ( ON ?auto_743617 ?auto_743616 ) ( ON ?auto_743618 ?auto_743617 ) ( ON ?auto_743619 ?auto_743618 ) ( ON ?auto_743620 ?auto_743619 ) ( not ( = ?auto_743616 ?auto_743617 ) ) ( not ( = ?auto_743616 ?auto_743618 ) ) ( not ( = ?auto_743616 ?auto_743619 ) ) ( not ( = ?auto_743616 ?auto_743620 ) ) ( not ( = ?auto_743616 ?auto_743621 ) ) ( not ( = ?auto_743616 ?auto_743622 ) ) ( not ( = ?auto_743616 ?auto_743623 ) ) ( not ( = ?auto_743616 ?auto_743624 ) ) ( not ( = ?auto_743616 ?auto_743625 ) ) ( not ( = ?auto_743616 ?auto_743626 ) ) ( not ( = ?auto_743616 ?auto_743627 ) ) ( not ( = ?auto_743616 ?auto_743628 ) ) ( not ( = ?auto_743616 ?auto_743629 ) ) ( not ( = ?auto_743616 ?auto_743630 ) ) ( not ( = ?auto_743617 ?auto_743618 ) ) ( not ( = ?auto_743617 ?auto_743619 ) ) ( not ( = ?auto_743617 ?auto_743620 ) ) ( not ( = ?auto_743617 ?auto_743621 ) ) ( not ( = ?auto_743617 ?auto_743622 ) ) ( not ( = ?auto_743617 ?auto_743623 ) ) ( not ( = ?auto_743617 ?auto_743624 ) ) ( not ( = ?auto_743617 ?auto_743625 ) ) ( not ( = ?auto_743617 ?auto_743626 ) ) ( not ( = ?auto_743617 ?auto_743627 ) ) ( not ( = ?auto_743617 ?auto_743628 ) ) ( not ( = ?auto_743617 ?auto_743629 ) ) ( not ( = ?auto_743617 ?auto_743630 ) ) ( not ( = ?auto_743618 ?auto_743619 ) ) ( not ( = ?auto_743618 ?auto_743620 ) ) ( not ( = ?auto_743618 ?auto_743621 ) ) ( not ( = ?auto_743618 ?auto_743622 ) ) ( not ( = ?auto_743618 ?auto_743623 ) ) ( not ( = ?auto_743618 ?auto_743624 ) ) ( not ( = ?auto_743618 ?auto_743625 ) ) ( not ( = ?auto_743618 ?auto_743626 ) ) ( not ( = ?auto_743618 ?auto_743627 ) ) ( not ( = ?auto_743618 ?auto_743628 ) ) ( not ( = ?auto_743618 ?auto_743629 ) ) ( not ( = ?auto_743618 ?auto_743630 ) ) ( not ( = ?auto_743619 ?auto_743620 ) ) ( not ( = ?auto_743619 ?auto_743621 ) ) ( not ( = ?auto_743619 ?auto_743622 ) ) ( not ( = ?auto_743619 ?auto_743623 ) ) ( not ( = ?auto_743619 ?auto_743624 ) ) ( not ( = ?auto_743619 ?auto_743625 ) ) ( not ( = ?auto_743619 ?auto_743626 ) ) ( not ( = ?auto_743619 ?auto_743627 ) ) ( not ( = ?auto_743619 ?auto_743628 ) ) ( not ( = ?auto_743619 ?auto_743629 ) ) ( not ( = ?auto_743619 ?auto_743630 ) ) ( not ( = ?auto_743620 ?auto_743621 ) ) ( not ( = ?auto_743620 ?auto_743622 ) ) ( not ( = ?auto_743620 ?auto_743623 ) ) ( not ( = ?auto_743620 ?auto_743624 ) ) ( not ( = ?auto_743620 ?auto_743625 ) ) ( not ( = ?auto_743620 ?auto_743626 ) ) ( not ( = ?auto_743620 ?auto_743627 ) ) ( not ( = ?auto_743620 ?auto_743628 ) ) ( not ( = ?auto_743620 ?auto_743629 ) ) ( not ( = ?auto_743620 ?auto_743630 ) ) ( not ( = ?auto_743621 ?auto_743622 ) ) ( not ( = ?auto_743621 ?auto_743623 ) ) ( not ( = ?auto_743621 ?auto_743624 ) ) ( not ( = ?auto_743621 ?auto_743625 ) ) ( not ( = ?auto_743621 ?auto_743626 ) ) ( not ( = ?auto_743621 ?auto_743627 ) ) ( not ( = ?auto_743621 ?auto_743628 ) ) ( not ( = ?auto_743621 ?auto_743629 ) ) ( not ( = ?auto_743621 ?auto_743630 ) ) ( not ( = ?auto_743622 ?auto_743623 ) ) ( not ( = ?auto_743622 ?auto_743624 ) ) ( not ( = ?auto_743622 ?auto_743625 ) ) ( not ( = ?auto_743622 ?auto_743626 ) ) ( not ( = ?auto_743622 ?auto_743627 ) ) ( not ( = ?auto_743622 ?auto_743628 ) ) ( not ( = ?auto_743622 ?auto_743629 ) ) ( not ( = ?auto_743622 ?auto_743630 ) ) ( not ( = ?auto_743623 ?auto_743624 ) ) ( not ( = ?auto_743623 ?auto_743625 ) ) ( not ( = ?auto_743623 ?auto_743626 ) ) ( not ( = ?auto_743623 ?auto_743627 ) ) ( not ( = ?auto_743623 ?auto_743628 ) ) ( not ( = ?auto_743623 ?auto_743629 ) ) ( not ( = ?auto_743623 ?auto_743630 ) ) ( not ( = ?auto_743624 ?auto_743625 ) ) ( not ( = ?auto_743624 ?auto_743626 ) ) ( not ( = ?auto_743624 ?auto_743627 ) ) ( not ( = ?auto_743624 ?auto_743628 ) ) ( not ( = ?auto_743624 ?auto_743629 ) ) ( not ( = ?auto_743624 ?auto_743630 ) ) ( not ( = ?auto_743625 ?auto_743626 ) ) ( not ( = ?auto_743625 ?auto_743627 ) ) ( not ( = ?auto_743625 ?auto_743628 ) ) ( not ( = ?auto_743625 ?auto_743629 ) ) ( not ( = ?auto_743625 ?auto_743630 ) ) ( not ( = ?auto_743626 ?auto_743627 ) ) ( not ( = ?auto_743626 ?auto_743628 ) ) ( not ( = ?auto_743626 ?auto_743629 ) ) ( not ( = ?auto_743626 ?auto_743630 ) ) ( not ( = ?auto_743627 ?auto_743628 ) ) ( not ( = ?auto_743627 ?auto_743629 ) ) ( not ( = ?auto_743627 ?auto_743630 ) ) ( not ( = ?auto_743628 ?auto_743629 ) ) ( not ( = ?auto_743628 ?auto_743630 ) ) ( not ( = ?auto_743629 ?auto_743630 ) ) ( ON ?auto_743628 ?auto_743629 ) ( ON ?auto_743627 ?auto_743628 ) ( ON ?auto_743626 ?auto_743627 ) ( ON ?auto_743625 ?auto_743626 ) ( ON ?auto_743624 ?auto_743625 ) ( ON ?auto_743623 ?auto_743624 ) ( ON ?auto_743622 ?auto_743623 ) ( CLEAR ?auto_743620 ) ( ON ?auto_743621 ?auto_743622 ) ( CLEAR ?auto_743621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_743616 ?auto_743617 ?auto_743618 ?auto_743619 ?auto_743620 ?auto_743621 )
      ( MAKE-14PILE ?auto_743616 ?auto_743617 ?auto_743618 ?auto_743619 ?auto_743620 ?auto_743621 ?auto_743622 ?auto_743623 ?auto_743624 ?auto_743625 ?auto_743626 ?auto_743627 ?auto_743628 ?auto_743629 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743674 - BLOCK
      ?auto_743675 - BLOCK
      ?auto_743676 - BLOCK
      ?auto_743677 - BLOCK
      ?auto_743678 - BLOCK
      ?auto_743679 - BLOCK
      ?auto_743680 - BLOCK
      ?auto_743681 - BLOCK
      ?auto_743682 - BLOCK
      ?auto_743683 - BLOCK
      ?auto_743684 - BLOCK
      ?auto_743685 - BLOCK
      ?auto_743686 - BLOCK
      ?auto_743687 - BLOCK
    )
    :vars
    (
      ?auto_743688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743687 ?auto_743688 ) ( ON-TABLE ?auto_743674 ) ( ON ?auto_743675 ?auto_743674 ) ( ON ?auto_743676 ?auto_743675 ) ( ON ?auto_743677 ?auto_743676 ) ( not ( = ?auto_743674 ?auto_743675 ) ) ( not ( = ?auto_743674 ?auto_743676 ) ) ( not ( = ?auto_743674 ?auto_743677 ) ) ( not ( = ?auto_743674 ?auto_743678 ) ) ( not ( = ?auto_743674 ?auto_743679 ) ) ( not ( = ?auto_743674 ?auto_743680 ) ) ( not ( = ?auto_743674 ?auto_743681 ) ) ( not ( = ?auto_743674 ?auto_743682 ) ) ( not ( = ?auto_743674 ?auto_743683 ) ) ( not ( = ?auto_743674 ?auto_743684 ) ) ( not ( = ?auto_743674 ?auto_743685 ) ) ( not ( = ?auto_743674 ?auto_743686 ) ) ( not ( = ?auto_743674 ?auto_743687 ) ) ( not ( = ?auto_743674 ?auto_743688 ) ) ( not ( = ?auto_743675 ?auto_743676 ) ) ( not ( = ?auto_743675 ?auto_743677 ) ) ( not ( = ?auto_743675 ?auto_743678 ) ) ( not ( = ?auto_743675 ?auto_743679 ) ) ( not ( = ?auto_743675 ?auto_743680 ) ) ( not ( = ?auto_743675 ?auto_743681 ) ) ( not ( = ?auto_743675 ?auto_743682 ) ) ( not ( = ?auto_743675 ?auto_743683 ) ) ( not ( = ?auto_743675 ?auto_743684 ) ) ( not ( = ?auto_743675 ?auto_743685 ) ) ( not ( = ?auto_743675 ?auto_743686 ) ) ( not ( = ?auto_743675 ?auto_743687 ) ) ( not ( = ?auto_743675 ?auto_743688 ) ) ( not ( = ?auto_743676 ?auto_743677 ) ) ( not ( = ?auto_743676 ?auto_743678 ) ) ( not ( = ?auto_743676 ?auto_743679 ) ) ( not ( = ?auto_743676 ?auto_743680 ) ) ( not ( = ?auto_743676 ?auto_743681 ) ) ( not ( = ?auto_743676 ?auto_743682 ) ) ( not ( = ?auto_743676 ?auto_743683 ) ) ( not ( = ?auto_743676 ?auto_743684 ) ) ( not ( = ?auto_743676 ?auto_743685 ) ) ( not ( = ?auto_743676 ?auto_743686 ) ) ( not ( = ?auto_743676 ?auto_743687 ) ) ( not ( = ?auto_743676 ?auto_743688 ) ) ( not ( = ?auto_743677 ?auto_743678 ) ) ( not ( = ?auto_743677 ?auto_743679 ) ) ( not ( = ?auto_743677 ?auto_743680 ) ) ( not ( = ?auto_743677 ?auto_743681 ) ) ( not ( = ?auto_743677 ?auto_743682 ) ) ( not ( = ?auto_743677 ?auto_743683 ) ) ( not ( = ?auto_743677 ?auto_743684 ) ) ( not ( = ?auto_743677 ?auto_743685 ) ) ( not ( = ?auto_743677 ?auto_743686 ) ) ( not ( = ?auto_743677 ?auto_743687 ) ) ( not ( = ?auto_743677 ?auto_743688 ) ) ( not ( = ?auto_743678 ?auto_743679 ) ) ( not ( = ?auto_743678 ?auto_743680 ) ) ( not ( = ?auto_743678 ?auto_743681 ) ) ( not ( = ?auto_743678 ?auto_743682 ) ) ( not ( = ?auto_743678 ?auto_743683 ) ) ( not ( = ?auto_743678 ?auto_743684 ) ) ( not ( = ?auto_743678 ?auto_743685 ) ) ( not ( = ?auto_743678 ?auto_743686 ) ) ( not ( = ?auto_743678 ?auto_743687 ) ) ( not ( = ?auto_743678 ?auto_743688 ) ) ( not ( = ?auto_743679 ?auto_743680 ) ) ( not ( = ?auto_743679 ?auto_743681 ) ) ( not ( = ?auto_743679 ?auto_743682 ) ) ( not ( = ?auto_743679 ?auto_743683 ) ) ( not ( = ?auto_743679 ?auto_743684 ) ) ( not ( = ?auto_743679 ?auto_743685 ) ) ( not ( = ?auto_743679 ?auto_743686 ) ) ( not ( = ?auto_743679 ?auto_743687 ) ) ( not ( = ?auto_743679 ?auto_743688 ) ) ( not ( = ?auto_743680 ?auto_743681 ) ) ( not ( = ?auto_743680 ?auto_743682 ) ) ( not ( = ?auto_743680 ?auto_743683 ) ) ( not ( = ?auto_743680 ?auto_743684 ) ) ( not ( = ?auto_743680 ?auto_743685 ) ) ( not ( = ?auto_743680 ?auto_743686 ) ) ( not ( = ?auto_743680 ?auto_743687 ) ) ( not ( = ?auto_743680 ?auto_743688 ) ) ( not ( = ?auto_743681 ?auto_743682 ) ) ( not ( = ?auto_743681 ?auto_743683 ) ) ( not ( = ?auto_743681 ?auto_743684 ) ) ( not ( = ?auto_743681 ?auto_743685 ) ) ( not ( = ?auto_743681 ?auto_743686 ) ) ( not ( = ?auto_743681 ?auto_743687 ) ) ( not ( = ?auto_743681 ?auto_743688 ) ) ( not ( = ?auto_743682 ?auto_743683 ) ) ( not ( = ?auto_743682 ?auto_743684 ) ) ( not ( = ?auto_743682 ?auto_743685 ) ) ( not ( = ?auto_743682 ?auto_743686 ) ) ( not ( = ?auto_743682 ?auto_743687 ) ) ( not ( = ?auto_743682 ?auto_743688 ) ) ( not ( = ?auto_743683 ?auto_743684 ) ) ( not ( = ?auto_743683 ?auto_743685 ) ) ( not ( = ?auto_743683 ?auto_743686 ) ) ( not ( = ?auto_743683 ?auto_743687 ) ) ( not ( = ?auto_743683 ?auto_743688 ) ) ( not ( = ?auto_743684 ?auto_743685 ) ) ( not ( = ?auto_743684 ?auto_743686 ) ) ( not ( = ?auto_743684 ?auto_743687 ) ) ( not ( = ?auto_743684 ?auto_743688 ) ) ( not ( = ?auto_743685 ?auto_743686 ) ) ( not ( = ?auto_743685 ?auto_743687 ) ) ( not ( = ?auto_743685 ?auto_743688 ) ) ( not ( = ?auto_743686 ?auto_743687 ) ) ( not ( = ?auto_743686 ?auto_743688 ) ) ( not ( = ?auto_743687 ?auto_743688 ) ) ( ON ?auto_743686 ?auto_743687 ) ( ON ?auto_743685 ?auto_743686 ) ( ON ?auto_743684 ?auto_743685 ) ( ON ?auto_743683 ?auto_743684 ) ( ON ?auto_743682 ?auto_743683 ) ( ON ?auto_743681 ?auto_743682 ) ( ON ?auto_743680 ?auto_743681 ) ( ON ?auto_743679 ?auto_743680 ) ( CLEAR ?auto_743677 ) ( ON ?auto_743678 ?auto_743679 ) ( CLEAR ?auto_743678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_743674 ?auto_743675 ?auto_743676 ?auto_743677 ?auto_743678 )
      ( MAKE-14PILE ?auto_743674 ?auto_743675 ?auto_743676 ?auto_743677 ?auto_743678 ?auto_743679 ?auto_743680 ?auto_743681 ?auto_743682 ?auto_743683 ?auto_743684 ?auto_743685 ?auto_743686 ?auto_743687 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743732 - BLOCK
      ?auto_743733 - BLOCK
      ?auto_743734 - BLOCK
      ?auto_743735 - BLOCK
      ?auto_743736 - BLOCK
      ?auto_743737 - BLOCK
      ?auto_743738 - BLOCK
      ?auto_743739 - BLOCK
      ?auto_743740 - BLOCK
      ?auto_743741 - BLOCK
      ?auto_743742 - BLOCK
      ?auto_743743 - BLOCK
      ?auto_743744 - BLOCK
      ?auto_743745 - BLOCK
    )
    :vars
    (
      ?auto_743746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743745 ?auto_743746 ) ( ON-TABLE ?auto_743732 ) ( ON ?auto_743733 ?auto_743732 ) ( ON ?auto_743734 ?auto_743733 ) ( not ( = ?auto_743732 ?auto_743733 ) ) ( not ( = ?auto_743732 ?auto_743734 ) ) ( not ( = ?auto_743732 ?auto_743735 ) ) ( not ( = ?auto_743732 ?auto_743736 ) ) ( not ( = ?auto_743732 ?auto_743737 ) ) ( not ( = ?auto_743732 ?auto_743738 ) ) ( not ( = ?auto_743732 ?auto_743739 ) ) ( not ( = ?auto_743732 ?auto_743740 ) ) ( not ( = ?auto_743732 ?auto_743741 ) ) ( not ( = ?auto_743732 ?auto_743742 ) ) ( not ( = ?auto_743732 ?auto_743743 ) ) ( not ( = ?auto_743732 ?auto_743744 ) ) ( not ( = ?auto_743732 ?auto_743745 ) ) ( not ( = ?auto_743732 ?auto_743746 ) ) ( not ( = ?auto_743733 ?auto_743734 ) ) ( not ( = ?auto_743733 ?auto_743735 ) ) ( not ( = ?auto_743733 ?auto_743736 ) ) ( not ( = ?auto_743733 ?auto_743737 ) ) ( not ( = ?auto_743733 ?auto_743738 ) ) ( not ( = ?auto_743733 ?auto_743739 ) ) ( not ( = ?auto_743733 ?auto_743740 ) ) ( not ( = ?auto_743733 ?auto_743741 ) ) ( not ( = ?auto_743733 ?auto_743742 ) ) ( not ( = ?auto_743733 ?auto_743743 ) ) ( not ( = ?auto_743733 ?auto_743744 ) ) ( not ( = ?auto_743733 ?auto_743745 ) ) ( not ( = ?auto_743733 ?auto_743746 ) ) ( not ( = ?auto_743734 ?auto_743735 ) ) ( not ( = ?auto_743734 ?auto_743736 ) ) ( not ( = ?auto_743734 ?auto_743737 ) ) ( not ( = ?auto_743734 ?auto_743738 ) ) ( not ( = ?auto_743734 ?auto_743739 ) ) ( not ( = ?auto_743734 ?auto_743740 ) ) ( not ( = ?auto_743734 ?auto_743741 ) ) ( not ( = ?auto_743734 ?auto_743742 ) ) ( not ( = ?auto_743734 ?auto_743743 ) ) ( not ( = ?auto_743734 ?auto_743744 ) ) ( not ( = ?auto_743734 ?auto_743745 ) ) ( not ( = ?auto_743734 ?auto_743746 ) ) ( not ( = ?auto_743735 ?auto_743736 ) ) ( not ( = ?auto_743735 ?auto_743737 ) ) ( not ( = ?auto_743735 ?auto_743738 ) ) ( not ( = ?auto_743735 ?auto_743739 ) ) ( not ( = ?auto_743735 ?auto_743740 ) ) ( not ( = ?auto_743735 ?auto_743741 ) ) ( not ( = ?auto_743735 ?auto_743742 ) ) ( not ( = ?auto_743735 ?auto_743743 ) ) ( not ( = ?auto_743735 ?auto_743744 ) ) ( not ( = ?auto_743735 ?auto_743745 ) ) ( not ( = ?auto_743735 ?auto_743746 ) ) ( not ( = ?auto_743736 ?auto_743737 ) ) ( not ( = ?auto_743736 ?auto_743738 ) ) ( not ( = ?auto_743736 ?auto_743739 ) ) ( not ( = ?auto_743736 ?auto_743740 ) ) ( not ( = ?auto_743736 ?auto_743741 ) ) ( not ( = ?auto_743736 ?auto_743742 ) ) ( not ( = ?auto_743736 ?auto_743743 ) ) ( not ( = ?auto_743736 ?auto_743744 ) ) ( not ( = ?auto_743736 ?auto_743745 ) ) ( not ( = ?auto_743736 ?auto_743746 ) ) ( not ( = ?auto_743737 ?auto_743738 ) ) ( not ( = ?auto_743737 ?auto_743739 ) ) ( not ( = ?auto_743737 ?auto_743740 ) ) ( not ( = ?auto_743737 ?auto_743741 ) ) ( not ( = ?auto_743737 ?auto_743742 ) ) ( not ( = ?auto_743737 ?auto_743743 ) ) ( not ( = ?auto_743737 ?auto_743744 ) ) ( not ( = ?auto_743737 ?auto_743745 ) ) ( not ( = ?auto_743737 ?auto_743746 ) ) ( not ( = ?auto_743738 ?auto_743739 ) ) ( not ( = ?auto_743738 ?auto_743740 ) ) ( not ( = ?auto_743738 ?auto_743741 ) ) ( not ( = ?auto_743738 ?auto_743742 ) ) ( not ( = ?auto_743738 ?auto_743743 ) ) ( not ( = ?auto_743738 ?auto_743744 ) ) ( not ( = ?auto_743738 ?auto_743745 ) ) ( not ( = ?auto_743738 ?auto_743746 ) ) ( not ( = ?auto_743739 ?auto_743740 ) ) ( not ( = ?auto_743739 ?auto_743741 ) ) ( not ( = ?auto_743739 ?auto_743742 ) ) ( not ( = ?auto_743739 ?auto_743743 ) ) ( not ( = ?auto_743739 ?auto_743744 ) ) ( not ( = ?auto_743739 ?auto_743745 ) ) ( not ( = ?auto_743739 ?auto_743746 ) ) ( not ( = ?auto_743740 ?auto_743741 ) ) ( not ( = ?auto_743740 ?auto_743742 ) ) ( not ( = ?auto_743740 ?auto_743743 ) ) ( not ( = ?auto_743740 ?auto_743744 ) ) ( not ( = ?auto_743740 ?auto_743745 ) ) ( not ( = ?auto_743740 ?auto_743746 ) ) ( not ( = ?auto_743741 ?auto_743742 ) ) ( not ( = ?auto_743741 ?auto_743743 ) ) ( not ( = ?auto_743741 ?auto_743744 ) ) ( not ( = ?auto_743741 ?auto_743745 ) ) ( not ( = ?auto_743741 ?auto_743746 ) ) ( not ( = ?auto_743742 ?auto_743743 ) ) ( not ( = ?auto_743742 ?auto_743744 ) ) ( not ( = ?auto_743742 ?auto_743745 ) ) ( not ( = ?auto_743742 ?auto_743746 ) ) ( not ( = ?auto_743743 ?auto_743744 ) ) ( not ( = ?auto_743743 ?auto_743745 ) ) ( not ( = ?auto_743743 ?auto_743746 ) ) ( not ( = ?auto_743744 ?auto_743745 ) ) ( not ( = ?auto_743744 ?auto_743746 ) ) ( not ( = ?auto_743745 ?auto_743746 ) ) ( ON ?auto_743744 ?auto_743745 ) ( ON ?auto_743743 ?auto_743744 ) ( ON ?auto_743742 ?auto_743743 ) ( ON ?auto_743741 ?auto_743742 ) ( ON ?auto_743740 ?auto_743741 ) ( ON ?auto_743739 ?auto_743740 ) ( ON ?auto_743738 ?auto_743739 ) ( ON ?auto_743737 ?auto_743738 ) ( ON ?auto_743736 ?auto_743737 ) ( CLEAR ?auto_743734 ) ( ON ?auto_743735 ?auto_743736 ) ( CLEAR ?auto_743735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_743732 ?auto_743733 ?auto_743734 ?auto_743735 )
      ( MAKE-14PILE ?auto_743732 ?auto_743733 ?auto_743734 ?auto_743735 ?auto_743736 ?auto_743737 ?auto_743738 ?auto_743739 ?auto_743740 ?auto_743741 ?auto_743742 ?auto_743743 ?auto_743744 ?auto_743745 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743790 - BLOCK
      ?auto_743791 - BLOCK
      ?auto_743792 - BLOCK
      ?auto_743793 - BLOCK
      ?auto_743794 - BLOCK
      ?auto_743795 - BLOCK
      ?auto_743796 - BLOCK
      ?auto_743797 - BLOCK
      ?auto_743798 - BLOCK
      ?auto_743799 - BLOCK
      ?auto_743800 - BLOCK
      ?auto_743801 - BLOCK
      ?auto_743802 - BLOCK
      ?auto_743803 - BLOCK
    )
    :vars
    (
      ?auto_743804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743803 ?auto_743804 ) ( ON-TABLE ?auto_743790 ) ( ON ?auto_743791 ?auto_743790 ) ( not ( = ?auto_743790 ?auto_743791 ) ) ( not ( = ?auto_743790 ?auto_743792 ) ) ( not ( = ?auto_743790 ?auto_743793 ) ) ( not ( = ?auto_743790 ?auto_743794 ) ) ( not ( = ?auto_743790 ?auto_743795 ) ) ( not ( = ?auto_743790 ?auto_743796 ) ) ( not ( = ?auto_743790 ?auto_743797 ) ) ( not ( = ?auto_743790 ?auto_743798 ) ) ( not ( = ?auto_743790 ?auto_743799 ) ) ( not ( = ?auto_743790 ?auto_743800 ) ) ( not ( = ?auto_743790 ?auto_743801 ) ) ( not ( = ?auto_743790 ?auto_743802 ) ) ( not ( = ?auto_743790 ?auto_743803 ) ) ( not ( = ?auto_743790 ?auto_743804 ) ) ( not ( = ?auto_743791 ?auto_743792 ) ) ( not ( = ?auto_743791 ?auto_743793 ) ) ( not ( = ?auto_743791 ?auto_743794 ) ) ( not ( = ?auto_743791 ?auto_743795 ) ) ( not ( = ?auto_743791 ?auto_743796 ) ) ( not ( = ?auto_743791 ?auto_743797 ) ) ( not ( = ?auto_743791 ?auto_743798 ) ) ( not ( = ?auto_743791 ?auto_743799 ) ) ( not ( = ?auto_743791 ?auto_743800 ) ) ( not ( = ?auto_743791 ?auto_743801 ) ) ( not ( = ?auto_743791 ?auto_743802 ) ) ( not ( = ?auto_743791 ?auto_743803 ) ) ( not ( = ?auto_743791 ?auto_743804 ) ) ( not ( = ?auto_743792 ?auto_743793 ) ) ( not ( = ?auto_743792 ?auto_743794 ) ) ( not ( = ?auto_743792 ?auto_743795 ) ) ( not ( = ?auto_743792 ?auto_743796 ) ) ( not ( = ?auto_743792 ?auto_743797 ) ) ( not ( = ?auto_743792 ?auto_743798 ) ) ( not ( = ?auto_743792 ?auto_743799 ) ) ( not ( = ?auto_743792 ?auto_743800 ) ) ( not ( = ?auto_743792 ?auto_743801 ) ) ( not ( = ?auto_743792 ?auto_743802 ) ) ( not ( = ?auto_743792 ?auto_743803 ) ) ( not ( = ?auto_743792 ?auto_743804 ) ) ( not ( = ?auto_743793 ?auto_743794 ) ) ( not ( = ?auto_743793 ?auto_743795 ) ) ( not ( = ?auto_743793 ?auto_743796 ) ) ( not ( = ?auto_743793 ?auto_743797 ) ) ( not ( = ?auto_743793 ?auto_743798 ) ) ( not ( = ?auto_743793 ?auto_743799 ) ) ( not ( = ?auto_743793 ?auto_743800 ) ) ( not ( = ?auto_743793 ?auto_743801 ) ) ( not ( = ?auto_743793 ?auto_743802 ) ) ( not ( = ?auto_743793 ?auto_743803 ) ) ( not ( = ?auto_743793 ?auto_743804 ) ) ( not ( = ?auto_743794 ?auto_743795 ) ) ( not ( = ?auto_743794 ?auto_743796 ) ) ( not ( = ?auto_743794 ?auto_743797 ) ) ( not ( = ?auto_743794 ?auto_743798 ) ) ( not ( = ?auto_743794 ?auto_743799 ) ) ( not ( = ?auto_743794 ?auto_743800 ) ) ( not ( = ?auto_743794 ?auto_743801 ) ) ( not ( = ?auto_743794 ?auto_743802 ) ) ( not ( = ?auto_743794 ?auto_743803 ) ) ( not ( = ?auto_743794 ?auto_743804 ) ) ( not ( = ?auto_743795 ?auto_743796 ) ) ( not ( = ?auto_743795 ?auto_743797 ) ) ( not ( = ?auto_743795 ?auto_743798 ) ) ( not ( = ?auto_743795 ?auto_743799 ) ) ( not ( = ?auto_743795 ?auto_743800 ) ) ( not ( = ?auto_743795 ?auto_743801 ) ) ( not ( = ?auto_743795 ?auto_743802 ) ) ( not ( = ?auto_743795 ?auto_743803 ) ) ( not ( = ?auto_743795 ?auto_743804 ) ) ( not ( = ?auto_743796 ?auto_743797 ) ) ( not ( = ?auto_743796 ?auto_743798 ) ) ( not ( = ?auto_743796 ?auto_743799 ) ) ( not ( = ?auto_743796 ?auto_743800 ) ) ( not ( = ?auto_743796 ?auto_743801 ) ) ( not ( = ?auto_743796 ?auto_743802 ) ) ( not ( = ?auto_743796 ?auto_743803 ) ) ( not ( = ?auto_743796 ?auto_743804 ) ) ( not ( = ?auto_743797 ?auto_743798 ) ) ( not ( = ?auto_743797 ?auto_743799 ) ) ( not ( = ?auto_743797 ?auto_743800 ) ) ( not ( = ?auto_743797 ?auto_743801 ) ) ( not ( = ?auto_743797 ?auto_743802 ) ) ( not ( = ?auto_743797 ?auto_743803 ) ) ( not ( = ?auto_743797 ?auto_743804 ) ) ( not ( = ?auto_743798 ?auto_743799 ) ) ( not ( = ?auto_743798 ?auto_743800 ) ) ( not ( = ?auto_743798 ?auto_743801 ) ) ( not ( = ?auto_743798 ?auto_743802 ) ) ( not ( = ?auto_743798 ?auto_743803 ) ) ( not ( = ?auto_743798 ?auto_743804 ) ) ( not ( = ?auto_743799 ?auto_743800 ) ) ( not ( = ?auto_743799 ?auto_743801 ) ) ( not ( = ?auto_743799 ?auto_743802 ) ) ( not ( = ?auto_743799 ?auto_743803 ) ) ( not ( = ?auto_743799 ?auto_743804 ) ) ( not ( = ?auto_743800 ?auto_743801 ) ) ( not ( = ?auto_743800 ?auto_743802 ) ) ( not ( = ?auto_743800 ?auto_743803 ) ) ( not ( = ?auto_743800 ?auto_743804 ) ) ( not ( = ?auto_743801 ?auto_743802 ) ) ( not ( = ?auto_743801 ?auto_743803 ) ) ( not ( = ?auto_743801 ?auto_743804 ) ) ( not ( = ?auto_743802 ?auto_743803 ) ) ( not ( = ?auto_743802 ?auto_743804 ) ) ( not ( = ?auto_743803 ?auto_743804 ) ) ( ON ?auto_743802 ?auto_743803 ) ( ON ?auto_743801 ?auto_743802 ) ( ON ?auto_743800 ?auto_743801 ) ( ON ?auto_743799 ?auto_743800 ) ( ON ?auto_743798 ?auto_743799 ) ( ON ?auto_743797 ?auto_743798 ) ( ON ?auto_743796 ?auto_743797 ) ( ON ?auto_743795 ?auto_743796 ) ( ON ?auto_743794 ?auto_743795 ) ( ON ?auto_743793 ?auto_743794 ) ( CLEAR ?auto_743791 ) ( ON ?auto_743792 ?auto_743793 ) ( CLEAR ?auto_743792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_743790 ?auto_743791 ?auto_743792 )
      ( MAKE-14PILE ?auto_743790 ?auto_743791 ?auto_743792 ?auto_743793 ?auto_743794 ?auto_743795 ?auto_743796 ?auto_743797 ?auto_743798 ?auto_743799 ?auto_743800 ?auto_743801 ?auto_743802 ?auto_743803 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743848 - BLOCK
      ?auto_743849 - BLOCK
      ?auto_743850 - BLOCK
      ?auto_743851 - BLOCK
      ?auto_743852 - BLOCK
      ?auto_743853 - BLOCK
      ?auto_743854 - BLOCK
      ?auto_743855 - BLOCK
      ?auto_743856 - BLOCK
      ?auto_743857 - BLOCK
      ?auto_743858 - BLOCK
      ?auto_743859 - BLOCK
      ?auto_743860 - BLOCK
      ?auto_743861 - BLOCK
    )
    :vars
    (
      ?auto_743862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743861 ?auto_743862 ) ( ON-TABLE ?auto_743848 ) ( not ( = ?auto_743848 ?auto_743849 ) ) ( not ( = ?auto_743848 ?auto_743850 ) ) ( not ( = ?auto_743848 ?auto_743851 ) ) ( not ( = ?auto_743848 ?auto_743852 ) ) ( not ( = ?auto_743848 ?auto_743853 ) ) ( not ( = ?auto_743848 ?auto_743854 ) ) ( not ( = ?auto_743848 ?auto_743855 ) ) ( not ( = ?auto_743848 ?auto_743856 ) ) ( not ( = ?auto_743848 ?auto_743857 ) ) ( not ( = ?auto_743848 ?auto_743858 ) ) ( not ( = ?auto_743848 ?auto_743859 ) ) ( not ( = ?auto_743848 ?auto_743860 ) ) ( not ( = ?auto_743848 ?auto_743861 ) ) ( not ( = ?auto_743848 ?auto_743862 ) ) ( not ( = ?auto_743849 ?auto_743850 ) ) ( not ( = ?auto_743849 ?auto_743851 ) ) ( not ( = ?auto_743849 ?auto_743852 ) ) ( not ( = ?auto_743849 ?auto_743853 ) ) ( not ( = ?auto_743849 ?auto_743854 ) ) ( not ( = ?auto_743849 ?auto_743855 ) ) ( not ( = ?auto_743849 ?auto_743856 ) ) ( not ( = ?auto_743849 ?auto_743857 ) ) ( not ( = ?auto_743849 ?auto_743858 ) ) ( not ( = ?auto_743849 ?auto_743859 ) ) ( not ( = ?auto_743849 ?auto_743860 ) ) ( not ( = ?auto_743849 ?auto_743861 ) ) ( not ( = ?auto_743849 ?auto_743862 ) ) ( not ( = ?auto_743850 ?auto_743851 ) ) ( not ( = ?auto_743850 ?auto_743852 ) ) ( not ( = ?auto_743850 ?auto_743853 ) ) ( not ( = ?auto_743850 ?auto_743854 ) ) ( not ( = ?auto_743850 ?auto_743855 ) ) ( not ( = ?auto_743850 ?auto_743856 ) ) ( not ( = ?auto_743850 ?auto_743857 ) ) ( not ( = ?auto_743850 ?auto_743858 ) ) ( not ( = ?auto_743850 ?auto_743859 ) ) ( not ( = ?auto_743850 ?auto_743860 ) ) ( not ( = ?auto_743850 ?auto_743861 ) ) ( not ( = ?auto_743850 ?auto_743862 ) ) ( not ( = ?auto_743851 ?auto_743852 ) ) ( not ( = ?auto_743851 ?auto_743853 ) ) ( not ( = ?auto_743851 ?auto_743854 ) ) ( not ( = ?auto_743851 ?auto_743855 ) ) ( not ( = ?auto_743851 ?auto_743856 ) ) ( not ( = ?auto_743851 ?auto_743857 ) ) ( not ( = ?auto_743851 ?auto_743858 ) ) ( not ( = ?auto_743851 ?auto_743859 ) ) ( not ( = ?auto_743851 ?auto_743860 ) ) ( not ( = ?auto_743851 ?auto_743861 ) ) ( not ( = ?auto_743851 ?auto_743862 ) ) ( not ( = ?auto_743852 ?auto_743853 ) ) ( not ( = ?auto_743852 ?auto_743854 ) ) ( not ( = ?auto_743852 ?auto_743855 ) ) ( not ( = ?auto_743852 ?auto_743856 ) ) ( not ( = ?auto_743852 ?auto_743857 ) ) ( not ( = ?auto_743852 ?auto_743858 ) ) ( not ( = ?auto_743852 ?auto_743859 ) ) ( not ( = ?auto_743852 ?auto_743860 ) ) ( not ( = ?auto_743852 ?auto_743861 ) ) ( not ( = ?auto_743852 ?auto_743862 ) ) ( not ( = ?auto_743853 ?auto_743854 ) ) ( not ( = ?auto_743853 ?auto_743855 ) ) ( not ( = ?auto_743853 ?auto_743856 ) ) ( not ( = ?auto_743853 ?auto_743857 ) ) ( not ( = ?auto_743853 ?auto_743858 ) ) ( not ( = ?auto_743853 ?auto_743859 ) ) ( not ( = ?auto_743853 ?auto_743860 ) ) ( not ( = ?auto_743853 ?auto_743861 ) ) ( not ( = ?auto_743853 ?auto_743862 ) ) ( not ( = ?auto_743854 ?auto_743855 ) ) ( not ( = ?auto_743854 ?auto_743856 ) ) ( not ( = ?auto_743854 ?auto_743857 ) ) ( not ( = ?auto_743854 ?auto_743858 ) ) ( not ( = ?auto_743854 ?auto_743859 ) ) ( not ( = ?auto_743854 ?auto_743860 ) ) ( not ( = ?auto_743854 ?auto_743861 ) ) ( not ( = ?auto_743854 ?auto_743862 ) ) ( not ( = ?auto_743855 ?auto_743856 ) ) ( not ( = ?auto_743855 ?auto_743857 ) ) ( not ( = ?auto_743855 ?auto_743858 ) ) ( not ( = ?auto_743855 ?auto_743859 ) ) ( not ( = ?auto_743855 ?auto_743860 ) ) ( not ( = ?auto_743855 ?auto_743861 ) ) ( not ( = ?auto_743855 ?auto_743862 ) ) ( not ( = ?auto_743856 ?auto_743857 ) ) ( not ( = ?auto_743856 ?auto_743858 ) ) ( not ( = ?auto_743856 ?auto_743859 ) ) ( not ( = ?auto_743856 ?auto_743860 ) ) ( not ( = ?auto_743856 ?auto_743861 ) ) ( not ( = ?auto_743856 ?auto_743862 ) ) ( not ( = ?auto_743857 ?auto_743858 ) ) ( not ( = ?auto_743857 ?auto_743859 ) ) ( not ( = ?auto_743857 ?auto_743860 ) ) ( not ( = ?auto_743857 ?auto_743861 ) ) ( not ( = ?auto_743857 ?auto_743862 ) ) ( not ( = ?auto_743858 ?auto_743859 ) ) ( not ( = ?auto_743858 ?auto_743860 ) ) ( not ( = ?auto_743858 ?auto_743861 ) ) ( not ( = ?auto_743858 ?auto_743862 ) ) ( not ( = ?auto_743859 ?auto_743860 ) ) ( not ( = ?auto_743859 ?auto_743861 ) ) ( not ( = ?auto_743859 ?auto_743862 ) ) ( not ( = ?auto_743860 ?auto_743861 ) ) ( not ( = ?auto_743860 ?auto_743862 ) ) ( not ( = ?auto_743861 ?auto_743862 ) ) ( ON ?auto_743860 ?auto_743861 ) ( ON ?auto_743859 ?auto_743860 ) ( ON ?auto_743858 ?auto_743859 ) ( ON ?auto_743857 ?auto_743858 ) ( ON ?auto_743856 ?auto_743857 ) ( ON ?auto_743855 ?auto_743856 ) ( ON ?auto_743854 ?auto_743855 ) ( ON ?auto_743853 ?auto_743854 ) ( ON ?auto_743852 ?auto_743853 ) ( ON ?auto_743851 ?auto_743852 ) ( ON ?auto_743850 ?auto_743851 ) ( CLEAR ?auto_743848 ) ( ON ?auto_743849 ?auto_743850 ) ( CLEAR ?auto_743849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_743848 ?auto_743849 )
      ( MAKE-14PILE ?auto_743848 ?auto_743849 ?auto_743850 ?auto_743851 ?auto_743852 ?auto_743853 ?auto_743854 ?auto_743855 ?auto_743856 ?auto_743857 ?auto_743858 ?auto_743859 ?auto_743860 ?auto_743861 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_743906 - BLOCK
      ?auto_743907 - BLOCK
      ?auto_743908 - BLOCK
      ?auto_743909 - BLOCK
      ?auto_743910 - BLOCK
      ?auto_743911 - BLOCK
      ?auto_743912 - BLOCK
      ?auto_743913 - BLOCK
      ?auto_743914 - BLOCK
      ?auto_743915 - BLOCK
      ?auto_743916 - BLOCK
      ?auto_743917 - BLOCK
      ?auto_743918 - BLOCK
      ?auto_743919 - BLOCK
    )
    :vars
    (
      ?auto_743920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_743919 ?auto_743920 ) ( not ( = ?auto_743906 ?auto_743907 ) ) ( not ( = ?auto_743906 ?auto_743908 ) ) ( not ( = ?auto_743906 ?auto_743909 ) ) ( not ( = ?auto_743906 ?auto_743910 ) ) ( not ( = ?auto_743906 ?auto_743911 ) ) ( not ( = ?auto_743906 ?auto_743912 ) ) ( not ( = ?auto_743906 ?auto_743913 ) ) ( not ( = ?auto_743906 ?auto_743914 ) ) ( not ( = ?auto_743906 ?auto_743915 ) ) ( not ( = ?auto_743906 ?auto_743916 ) ) ( not ( = ?auto_743906 ?auto_743917 ) ) ( not ( = ?auto_743906 ?auto_743918 ) ) ( not ( = ?auto_743906 ?auto_743919 ) ) ( not ( = ?auto_743906 ?auto_743920 ) ) ( not ( = ?auto_743907 ?auto_743908 ) ) ( not ( = ?auto_743907 ?auto_743909 ) ) ( not ( = ?auto_743907 ?auto_743910 ) ) ( not ( = ?auto_743907 ?auto_743911 ) ) ( not ( = ?auto_743907 ?auto_743912 ) ) ( not ( = ?auto_743907 ?auto_743913 ) ) ( not ( = ?auto_743907 ?auto_743914 ) ) ( not ( = ?auto_743907 ?auto_743915 ) ) ( not ( = ?auto_743907 ?auto_743916 ) ) ( not ( = ?auto_743907 ?auto_743917 ) ) ( not ( = ?auto_743907 ?auto_743918 ) ) ( not ( = ?auto_743907 ?auto_743919 ) ) ( not ( = ?auto_743907 ?auto_743920 ) ) ( not ( = ?auto_743908 ?auto_743909 ) ) ( not ( = ?auto_743908 ?auto_743910 ) ) ( not ( = ?auto_743908 ?auto_743911 ) ) ( not ( = ?auto_743908 ?auto_743912 ) ) ( not ( = ?auto_743908 ?auto_743913 ) ) ( not ( = ?auto_743908 ?auto_743914 ) ) ( not ( = ?auto_743908 ?auto_743915 ) ) ( not ( = ?auto_743908 ?auto_743916 ) ) ( not ( = ?auto_743908 ?auto_743917 ) ) ( not ( = ?auto_743908 ?auto_743918 ) ) ( not ( = ?auto_743908 ?auto_743919 ) ) ( not ( = ?auto_743908 ?auto_743920 ) ) ( not ( = ?auto_743909 ?auto_743910 ) ) ( not ( = ?auto_743909 ?auto_743911 ) ) ( not ( = ?auto_743909 ?auto_743912 ) ) ( not ( = ?auto_743909 ?auto_743913 ) ) ( not ( = ?auto_743909 ?auto_743914 ) ) ( not ( = ?auto_743909 ?auto_743915 ) ) ( not ( = ?auto_743909 ?auto_743916 ) ) ( not ( = ?auto_743909 ?auto_743917 ) ) ( not ( = ?auto_743909 ?auto_743918 ) ) ( not ( = ?auto_743909 ?auto_743919 ) ) ( not ( = ?auto_743909 ?auto_743920 ) ) ( not ( = ?auto_743910 ?auto_743911 ) ) ( not ( = ?auto_743910 ?auto_743912 ) ) ( not ( = ?auto_743910 ?auto_743913 ) ) ( not ( = ?auto_743910 ?auto_743914 ) ) ( not ( = ?auto_743910 ?auto_743915 ) ) ( not ( = ?auto_743910 ?auto_743916 ) ) ( not ( = ?auto_743910 ?auto_743917 ) ) ( not ( = ?auto_743910 ?auto_743918 ) ) ( not ( = ?auto_743910 ?auto_743919 ) ) ( not ( = ?auto_743910 ?auto_743920 ) ) ( not ( = ?auto_743911 ?auto_743912 ) ) ( not ( = ?auto_743911 ?auto_743913 ) ) ( not ( = ?auto_743911 ?auto_743914 ) ) ( not ( = ?auto_743911 ?auto_743915 ) ) ( not ( = ?auto_743911 ?auto_743916 ) ) ( not ( = ?auto_743911 ?auto_743917 ) ) ( not ( = ?auto_743911 ?auto_743918 ) ) ( not ( = ?auto_743911 ?auto_743919 ) ) ( not ( = ?auto_743911 ?auto_743920 ) ) ( not ( = ?auto_743912 ?auto_743913 ) ) ( not ( = ?auto_743912 ?auto_743914 ) ) ( not ( = ?auto_743912 ?auto_743915 ) ) ( not ( = ?auto_743912 ?auto_743916 ) ) ( not ( = ?auto_743912 ?auto_743917 ) ) ( not ( = ?auto_743912 ?auto_743918 ) ) ( not ( = ?auto_743912 ?auto_743919 ) ) ( not ( = ?auto_743912 ?auto_743920 ) ) ( not ( = ?auto_743913 ?auto_743914 ) ) ( not ( = ?auto_743913 ?auto_743915 ) ) ( not ( = ?auto_743913 ?auto_743916 ) ) ( not ( = ?auto_743913 ?auto_743917 ) ) ( not ( = ?auto_743913 ?auto_743918 ) ) ( not ( = ?auto_743913 ?auto_743919 ) ) ( not ( = ?auto_743913 ?auto_743920 ) ) ( not ( = ?auto_743914 ?auto_743915 ) ) ( not ( = ?auto_743914 ?auto_743916 ) ) ( not ( = ?auto_743914 ?auto_743917 ) ) ( not ( = ?auto_743914 ?auto_743918 ) ) ( not ( = ?auto_743914 ?auto_743919 ) ) ( not ( = ?auto_743914 ?auto_743920 ) ) ( not ( = ?auto_743915 ?auto_743916 ) ) ( not ( = ?auto_743915 ?auto_743917 ) ) ( not ( = ?auto_743915 ?auto_743918 ) ) ( not ( = ?auto_743915 ?auto_743919 ) ) ( not ( = ?auto_743915 ?auto_743920 ) ) ( not ( = ?auto_743916 ?auto_743917 ) ) ( not ( = ?auto_743916 ?auto_743918 ) ) ( not ( = ?auto_743916 ?auto_743919 ) ) ( not ( = ?auto_743916 ?auto_743920 ) ) ( not ( = ?auto_743917 ?auto_743918 ) ) ( not ( = ?auto_743917 ?auto_743919 ) ) ( not ( = ?auto_743917 ?auto_743920 ) ) ( not ( = ?auto_743918 ?auto_743919 ) ) ( not ( = ?auto_743918 ?auto_743920 ) ) ( not ( = ?auto_743919 ?auto_743920 ) ) ( ON ?auto_743918 ?auto_743919 ) ( ON ?auto_743917 ?auto_743918 ) ( ON ?auto_743916 ?auto_743917 ) ( ON ?auto_743915 ?auto_743916 ) ( ON ?auto_743914 ?auto_743915 ) ( ON ?auto_743913 ?auto_743914 ) ( ON ?auto_743912 ?auto_743913 ) ( ON ?auto_743911 ?auto_743912 ) ( ON ?auto_743910 ?auto_743911 ) ( ON ?auto_743909 ?auto_743910 ) ( ON ?auto_743908 ?auto_743909 ) ( ON ?auto_743907 ?auto_743908 ) ( ON ?auto_743906 ?auto_743907 ) ( CLEAR ?auto_743906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_743906 )
      ( MAKE-14PILE ?auto_743906 ?auto_743907 ?auto_743908 ?auto_743909 ?auto_743910 ?auto_743911 ?auto_743912 ?auto_743913 ?auto_743914 ?auto_743915 ?auto_743916 ?auto_743917 ?auto_743918 ?auto_743919 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_743965 - BLOCK
      ?auto_743966 - BLOCK
      ?auto_743967 - BLOCK
      ?auto_743968 - BLOCK
      ?auto_743969 - BLOCK
      ?auto_743970 - BLOCK
      ?auto_743971 - BLOCK
      ?auto_743972 - BLOCK
      ?auto_743973 - BLOCK
      ?auto_743974 - BLOCK
      ?auto_743975 - BLOCK
      ?auto_743976 - BLOCK
      ?auto_743977 - BLOCK
      ?auto_743978 - BLOCK
      ?auto_743979 - BLOCK
    )
    :vars
    (
      ?auto_743980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_743978 ) ( ON ?auto_743979 ?auto_743980 ) ( CLEAR ?auto_743979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_743965 ) ( ON ?auto_743966 ?auto_743965 ) ( ON ?auto_743967 ?auto_743966 ) ( ON ?auto_743968 ?auto_743967 ) ( ON ?auto_743969 ?auto_743968 ) ( ON ?auto_743970 ?auto_743969 ) ( ON ?auto_743971 ?auto_743970 ) ( ON ?auto_743972 ?auto_743971 ) ( ON ?auto_743973 ?auto_743972 ) ( ON ?auto_743974 ?auto_743973 ) ( ON ?auto_743975 ?auto_743974 ) ( ON ?auto_743976 ?auto_743975 ) ( ON ?auto_743977 ?auto_743976 ) ( ON ?auto_743978 ?auto_743977 ) ( not ( = ?auto_743965 ?auto_743966 ) ) ( not ( = ?auto_743965 ?auto_743967 ) ) ( not ( = ?auto_743965 ?auto_743968 ) ) ( not ( = ?auto_743965 ?auto_743969 ) ) ( not ( = ?auto_743965 ?auto_743970 ) ) ( not ( = ?auto_743965 ?auto_743971 ) ) ( not ( = ?auto_743965 ?auto_743972 ) ) ( not ( = ?auto_743965 ?auto_743973 ) ) ( not ( = ?auto_743965 ?auto_743974 ) ) ( not ( = ?auto_743965 ?auto_743975 ) ) ( not ( = ?auto_743965 ?auto_743976 ) ) ( not ( = ?auto_743965 ?auto_743977 ) ) ( not ( = ?auto_743965 ?auto_743978 ) ) ( not ( = ?auto_743965 ?auto_743979 ) ) ( not ( = ?auto_743965 ?auto_743980 ) ) ( not ( = ?auto_743966 ?auto_743967 ) ) ( not ( = ?auto_743966 ?auto_743968 ) ) ( not ( = ?auto_743966 ?auto_743969 ) ) ( not ( = ?auto_743966 ?auto_743970 ) ) ( not ( = ?auto_743966 ?auto_743971 ) ) ( not ( = ?auto_743966 ?auto_743972 ) ) ( not ( = ?auto_743966 ?auto_743973 ) ) ( not ( = ?auto_743966 ?auto_743974 ) ) ( not ( = ?auto_743966 ?auto_743975 ) ) ( not ( = ?auto_743966 ?auto_743976 ) ) ( not ( = ?auto_743966 ?auto_743977 ) ) ( not ( = ?auto_743966 ?auto_743978 ) ) ( not ( = ?auto_743966 ?auto_743979 ) ) ( not ( = ?auto_743966 ?auto_743980 ) ) ( not ( = ?auto_743967 ?auto_743968 ) ) ( not ( = ?auto_743967 ?auto_743969 ) ) ( not ( = ?auto_743967 ?auto_743970 ) ) ( not ( = ?auto_743967 ?auto_743971 ) ) ( not ( = ?auto_743967 ?auto_743972 ) ) ( not ( = ?auto_743967 ?auto_743973 ) ) ( not ( = ?auto_743967 ?auto_743974 ) ) ( not ( = ?auto_743967 ?auto_743975 ) ) ( not ( = ?auto_743967 ?auto_743976 ) ) ( not ( = ?auto_743967 ?auto_743977 ) ) ( not ( = ?auto_743967 ?auto_743978 ) ) ( not ( = ?auto_743967 ?auto_743979 ) ) ( not ( = ?auto_743967 ?auto_743980 ) ) ( not ( = ?auto_743968 ?auto_743969 ) ) ( not ( = ?auto_743968 ?auto_743970 ) ) ( not ( = ?auto_743968 ?auto_743971 ) ) ( not ( = ?auto_743968 ?auto_743972 ) ) ( not ( = ?auto_743968 ?auto_743973 ) ) ( not ( = ?auto_743968 ?auto_743974 ) ) ( not ( = ?auto_743968 ?auto_743975 ) ) ( not ( = ?auto_743968 ?auto_743976 ) ) ( not ( = ?auto_743968 ?auto_743977 ) ) ( not ( = ?auto_743968 ?auto_743978 ) ) ( not ( = ?auto_743968 ?auto_743979 ) ) ( not ( = ?auto_743968 ?auto_743980 ) ) ( not ( = ?auto_743969 ?auto_743970 ) ) ( not ( = ?auto_743969 ?auto_743971 ) ) ( not ( = ?auto_743969 ?auto_743972 ) ) ( not ( = ?auto_743969 ?auto_743973 ) ) ( not ( = ?auto_743969 ?auto_743974 ) ) ( not ( = ?auto_743969 ?auto_743975 ) ) ( not ( = ?auto_743969 ?auto_743976 ) ) ( not ( = ?auto_743969 ?auto_743977 ) ) ( not ( = ?auto_743969 ?auto_743978 ) ) ( not ( = ?auto_743969 ?auto_743979 ) ) ( not ( = ?auto_743969 ?auto_743980 ) ) ( not ( = ?auto_743970 ?auto_743971 ) ) ( not ( = ?auto_743970 ?auto_743972 ) ) ( not ( = ?auto_743970 ?auto_743973 ) ) ( not ( = ?auto_743970 ?auto_743974 ) ) ( not ( = ?auto_743970 ?auto_743975 ) ) ( not ( = ?auto_743970 ?auto_743976 ) ) ( not ( = ?auto_743970 ?auto_743977 ) ) ( not ( = ?auto_743970 ?auto_743978 ) ) ( not ( = ?auto_743970 ?auto_743979 ) ) ( not ( = ?auto_743970 ?auto_743980 ) ) ( not ( = ?auto_743971 ?auto_743972 ) ) ( not ( = ?auto_743971 ?auto_743973 ) ) ( not ( = ?auto_743971 ?auto_743974 ) ) ( not ( = ?auto_743971 ?auto_743975 ) ) ( not ( = ?auto_743971 ?auto_743976 ) ) ( not ( = ?auto_743971 ?auto_743977 ) ) ( not ( = ?auto_743971 ?auto_743978 ) ) ( not ( = ?auto_743971 ?auto_743979 ) ) ( not ( = ?auto_743971 ?auto_743980 ) ) ( not ( = ?auto_743972 ?auto_743973 ) ) ( not ( = ?auto_743972 ?auto_743974 ) ) ( not ( = ?auto_743972 ?auto_743975 ) ) ( not ( = ?auto_743972 ?auto_743976 ) ) ( not ( = ?auto_743972 ?auto_743977 ) ) ( not ( = ?auto_743972 ?auto_743978 ) ) ( not ( = ?auto_743972 ?auto_743979 ) ) ( not ( = ?auto_743972 ?auto_743980 ) ) ( not ( = ?auto_743973 ?auto_743974 ) ) ( not ( = ?auto_743973 ?auto_743975 ) ) ( not ( = ?auto_743973 ?auto_743976 ) ) ( not ( = ?auto_743973 ?auto_743977 ) ) ( not ( = ?auto_743973 ?auto_743978 ) ) ( not ( = ?auto_743973 ?auto_743979 ) ) ( not ( = ?auto_743973 ?auto_743980 ) ) ( not ( = ?auto_743974 ?auto_743975 ) ) ( not ( = ?auto_743974 ?auto_743976 ) ) ( not ( = ?auto_743974 ?auto_743977 ) ) ( not ( = ?auto_743974 ?auto_743978 ) ) ( not ( = ?auto_743974 ?auto_743979 ) ) ( not ( = ?auto_743974 ?auto_743980 ) ) ( not ( = ?auto_743975 ?auto_743976 ) ) ( not ( = ?auto_743975 ?auto_743977 ) ) ( not ( = ?auto_743975 ?auto_743978 ) ) ( not ( = ?auto_743975 ?auto_743979 ) ) ( not ( = ?auto_743975 ?auto_743980 ) ) ( not ( = ?auto_743976 ?auto_743977 ) ) ( not ( = ?auto_743976 ?auto_743978 ) ) ( not ( = ?auto_743976 ?auto_743979 ) ) ( not ( = ?auto_743976 ?auto_743980 ) ) ( not ( = ?auto_743977 ?auto_743978 ) ) ( not ( = ?auto_743977 ?auto_743979 ) ) ( not ( = ?auto_743977 ?auto_743980 ) ) ( not ( = ?auto_743978 ?auto_743979 ) ) ( not ( = ?auto_743978 ?auto_743980 ) ) ( not ( = ?auto_743979 ?auto_743980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_743979 ?auto_743980 )
      ( !STACK ?auto_743979 ?auto_743978 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744027 - BLOCK
      ?auto_744028 - BLOCK
      ?auto_744029 - BLOCK
      ?auto_744030 - BLOCK
      ?auto_744031 - BLOCK
      ?auto_744032 - BLOCK
      ?auto_744033 - BLOCK
      ?auto_744034 - BLOCK
      ?auto_744035 - BLOCK
      ?auto_744036 - BLOCK
      ?auto_744037 - BLOCK
      ?auto_744038 - BLOCK
      ?auto_744039 - BLOCK
      ?auto_744040 - BLOCK
      ?auto_744041 - BLOCK
    )
    :vars
    (
      ?auto_744042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744041 ?auto_744042 ) ( ON-TABLE ?auto_744027 ) ( ON ?auto_744028 ?auto_744027 ) ( ON ?auto_744029 ?auto_744028 ) ( ON ?auto_744030 ?auto_744029 ) ( ON ?auto_744031 ?auto_744030 ) ( ON ?auto_744032 ?auto_744031 ) ( ON ?auto_744033 ?auto_744032 ) ( ON ?auto_744034 ?auto_744033 ) ( ON ?auto_744035 ?auto_744034 ) ( ON ?auto_744036 ?auto_744035 ) ( ON ?auto_744037 ?auto_744036 ) ( ON ?auto_744038 ?auto_744037 ) ( ON ?auto_744039 ?auto_744038 ) ( not ( = ?auto_744027 ?auto_744028 ) ) ( not ( = ?auto_744027 ?auto_744029 ) ) ( not ( = ?auto_744027 ?auto_744030 ) ) ( not ( = ?auto_744027 ?auto_744031 ) ) ( not ( = ?auto_744027 ?auto_744032 ) ) ( not ( = ?auto_744027 ?auto_744033 ) ) ( not ( = ?auto_744027 ?auto_744034 ) ) ( not ( = ?auto_744027 ?auto_744035 ) ) ( not ( = ?auto_744027 ?auto_744036 ) ) ( not ( = ?auto_744027 ?auto_744037 ) ) ( not ( = ?auto_744027 ?auto_744038 ) ) ( not ( = ?auto_744027 ?auto_744039 ) ) ( not ( = ?auto_744027 ?auto_744040 ) ) ( not ( = ?auto_744027 ?auto_744041 ) ) ( not ( = ?auto_744027 ?auto_744042 ) ) ( not ( = ?auto_744028 ?auto_744029 ) ) ( not ( = ?auto_744028 ?auto_744030 ) ) ( not ( = ?auto_744028 ?auto_744031 ) ) ( not ( = ?auto_744028 ?auto_744032 ) ) ( not ( = ?auto_744028 ?auto_744033 ) ) ( not ( = ?auto_744028 ?auto_744034 ) ) ( not ( = ?auto_744028 ?auto_744035 ) ) ( not ( = ?auto_744028 ?auto_744036 ) ) ( not ( = ?auto_744028 ?auto_744037 ) ) ( not ( = ?auto_744028 ?auto_744038 ) ) ( not ( = ?auto_744028 ?auto_744039 ) ) ( not ( = ?auto_744028 ?auto_744040 ) ) ( not ( = ?auto_744028 ?auto_744041 ) ) ( not ( = ?auto_744028 ?auto_744042 ) ) ( not ( = ?auto_744029 ?auto_744030 ) ) ( not ( = ?auto_744029 ?auto_744031 ) ) ( not ( = ?auto_744029 ?auto_744032 ) ) ( not ( = ?auto_744029 ?auto_744033 ) ) ( not ( = ?auto_744029 ?auto_744034 ) ) ( not ( = ?auto_744029 ?auto_744035 ) ) ( not ( = ?auto_744029 ?auto_744036 ) ) ( not ( = ?auto_744029 ?auto_744037 ) ) ( not ( = ?auto_744029 ?auto_744038 ) ) ( not ( = ?auto_744029 ?auto_744039 ) ) ( not ( = ?auto_744029 ?auto_744040 ) ) ( not ( = ?auto_744029 ?auto_744041 ) ) ( not ( = ?auto_744029 ?auto_744042 ) ) ( not ( = ?auto_744030 ?auto_744031 ) ) ( not ( = ?auto_744030 ?auto_744032 ) ) ( not ( = ?auto_744030 ?auto_744033 ) ) ( not ( = ?auto_744030 ?auto_744034 ) ) ( not ( = ?auto_744030 ?auto_744035 ) ) ( not ( = ?auto_744030 ?auto_744036 ) ) ( not ( = ?auto_744030 ?auto_744037 ) ) ( not ( = ?auto_744030 ?auto_744038 ) ) ( not ( = ?auto_744030 ?auto_744039 ) ) ( not ( = ?auto_744030 ?auto_744040 ) ) ( not ( = ?auto_744030 ?auto_744041 ) ) ( not ( = ?auto_744030 ?auto_744042 ) ) ( not ( = ?auto_744031 ?auto_744032 ) ) ( not ( = ?auto_744031 ?auto_744033 ) ) ( not ( = ?auto_744031 ?auto_744034 ) ) ( not ( = ?auto_744031 ?auto_744035 ) ) ( not ( = ?auto_744031 ?auto_744036 ) ) ( not ( = ?auto_744031 ?auto_744037 ) ) ( not ( = ?auto_744031 ?auto_744038 ) ) ( not ( = ?auto_744031 ?auto_744039 ) ) ( not ( = ?auto_744031 ?auto_744040 ) ) ( not ( = ?auto_744031 ?auto_744041 ) ) ( not ( = ?auto_744031 ?auto_744042 ) ) ( not ( = ?auto_744032 ?auto_744033 ) ) ( not ( = ?auto_744032 ?auto_744034 ) ) ( not ( = ?auto_744032 ?auto_744035 ) ) ( not ( = ?auto_744032 ?auto_744036 ) ) ( not ( = ?auto_744032 ?auto_744037 ) ) ( not ( = ?auto_744032 ?auto_744038 ) ) ( not ( = ?auto_744032 ?auto_744039 ) ) ( not ( = ?auto_744032 ?auto_744040 ) ) ( not ( = ?auto_744032 ?auto_744041 ) ) ( not ( = ?auto_744032 ?auto_744042 ) ) ( not ( = ?auto_744033 ?auto_744034 ) ) ( not ( = ?auto_744033 ?auto_744035 ) ) ( not ( = ?auto_744033 ?auto_744036 ) ) ( not ( = ?auto_744033 ?auto_744037 ) ) ( not ( = ?auto_744033 ?auto_744038 ) ) ( not ( = ?auto_744033 ?auto_744039 ) ) ( not ( = ?auto_744033 ?auto_744040 ) ) ( not ( = ?auto_744033 ?auto_744041 ) ) ( not ( = ?auto_744033 ?auto_744042 ) ) ( not ( = ?auto_744034 ?auto_744035 ) ) ( not ( = ?auto_744034 ?auto_744036 ) ) ( not ( = ?auto_744034 ?auto_744037 ) ) ( not ( = ?auto_744034 ?auto_744038 ) ) ( not ( = ?auto_744034 ?auto_744039 ) ) ( not ( = ?auto_744034 ?auto_744040 ) ) ( not ( = ?auto_744034 ?auto_744041 ) ) ( not ( = ?auto_744034 ?auto_744042 ) ) ( not ( = ?auto_744035 ?auto_744036 ) ) ( not ( = ?auto_744035 ?auto_744037 ) ) ( not ( = ?auto_744035 ?auto_744038 ) ) ( not ( = ?auto_744035 ?auto_744039 ) ) ( not ( = ?auto_744035 ?auto_744040 ) ) ( not ( = ?auto_744035 ?auto_744041 ) ) ( not ( = ?auto_744035 ?auto_744042 ) ) ( not ( = ?auto_744036 ?auto_744037 ) ) ( not ( = ?auto_744036 ?auto_744038 ) ) ( not ( = ?auto_744036 ?auto_744039 ) ) ( not ( = ?auto_744036 ?auto_744040 ) ) ( not ( = ?auto_744036 ?auto_744041 ) ) ( not ( = ?auto_744036 ?auto_744042 ) ) ( not ( = ?auto_744037 ?auto_744038 ) ) ( not ( = ?auto_744037 ?auto_744039 ) ) ( not ( = ?auto_744037 ?auto_744040 ) ) ( not ( = ?auto_744037 ?auto_744041 ) ) ( not ( = ?auto_744037 ?auto_744042 ) ) ( not ( = ?auto_744038 ?auto_744039 ) ) ( not ( = ?auto_744038 ?auto_744040 ) ) ( not ( = ?auto_744038 ?auto_744041 ) ) ( not ( = ?auto_744038 ?auto_744042 ) ) ( not ( = ?auto_744039 ?auto_744040 ) ) ( not ( = ?auto_744039 ?auto_744041 ) ) ( not ( = ?auto_744039 ?auto_744042 ) ) ( not ( = ?auto_744040 ?auto_744041 ) ) ( not ( = ?auto_744040 ?auto_744042 ) ) ( not ( = ?auto_744041 ?auto_744042 ) ) ( CLEAR ?auto_744039 ) ( ON ?auto_744040 ?auto_744041 ) ( CLEAR ?auto_744040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_744027 ?auto_744028 ?auto_744029 ?auto_744030 ?auto_744031 ?auto_744032 ?auto_744033 ?auto_744034 ?auto_744035 ?auto_744036 ?auto_744037 ?auto_744038 ?auto_744039 ?auto_744040 )
      ( MAKE-15PILE ?auto_744027 ?auto_744028 ?auto_744029 ?auto_744030 ?auto_744031 ?auto_744032 ?auto_744033 ?auto_744034 ?auto_744035 ?auto_744036 ?auto_744037 ?auto_744038 ?auto_744039 ?auto_744040 ?auto_744041 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744089 - BLOCK
      ?auto_744090 - BLOCK
      ?auto_744091 - BLOCK
      ?auto_744092 - BLOCK
      ?auto_744093 - BLOCK
      ?auto_744094 - BLOCK
      ?auto_744095 - BLOCK
      ?auto_744096 - BLOCK
      ?auto_744097 - BLOCK
      ?auto_744098 - BLOCK
      ?auto_744099 - BLOCK
      ?auto_744100 - BLOCK
      ?auto_744101 - BLOCK
      ?auto_744102 - BLOCK
      ?auto_744103 - BLOCK
    )
    :vars
    (
      ?auto_744104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744103 ?auto_744104 ) ( ON-TABLE ?auto_744089 ) ( ON ?auto_744090 ?auto_744089 ) ( ON ?auto_744091 ?auto_744090 ) ( ON ?auto_744092 ?auto_744091 ) ( ON ?auto_744093 ?auto_744092 ) ( ON ?auto_744094 ?auto_744093 ) ( ON ?auto_744095 ?auto_744094 ) ( ON ?auto_744096 ?auto_744095 ) ( ON ?auto_744097 ?auto_744096 ) ( ON ?auto_744098 ?auto_744097 ) ( ON ?auto_744099 ?auto_744098 ) ( ON ?auto_744100 ?auto_744099 ) ( not ( = ?auto_744089 ?auto_744090 ) ) ( not ( = ?auto_744089 ?auto_744091 ) ) ( not ( = ?auto_744089 ?auto_744092 ) ) ( not ( = ?auto_744089 ?auto_744093 ) ) ( not ( = ?auto_744089 ?auto_744094 ) ) ( not ( = ?auto_744089 ?auto_744095 ) ) ( not ( = ?auto_744089 ?auto_744096 ) ) ( not ( = ?auto_744089 ?auto_744097 ) ) ( not ( = ?auto_744089 ?auto_744098 ) ) ( not ( = ?auto_744089 ?auto_744099 ) ) ( not ( = ?auto_744089 ?auto_744100 ) ) ( not ( = ?auto_744089 ?auto_744101 ) ) ( not ( = ?auto_744089 ?auto_744102 ) ) ( not ( = ?auto_744089 ?auto_744103 ) ) ( not ( = ?auto_744089 ?auto_744104 ) ) ( not ( = ?auto_744090 ?auto_744091 ) ) ( not ( = ?auto_744090 ?auto_744092 ) ) ( not ( = ?auto_744090 ?auto_744093 ) ) ( not ( = ?auto_744090 ?auto_744094 ) ) ( not ( = ?auto_744090 ?auto_744095 ) ) ( not ( = ?auto_744090 ?auto_744096 ) ) ( not ( = ?auto_744090 ?auto_744097 ) ) ( not ( = ?auto_744090 ?auto_744098 ) ) ( not ( = ?auto_744090 ?auto_744099 ) ) ( not ( = ?auto_744090 ?auto_744100 ) ) ( not ( = ?auto_744090 ?auto_744101 ) ) ( not ( = ?auto_744090 ?auto_744102 ) ) ( not ( = ?auto_744090 ?auto_744103 ) ) ( not ( = ?auto_744090 ?auto_744104 ) ) ( not ( = ?auto_744091 ?auto_744092 ) ) ( not ( = ?auto_744091 ?auto_744093 ) ) ( not ( = ?auto_744091 ?auto_744094 ) ) ( not ( = ?auto_744091 ?auto_744095 ) ) ( not ( = ?auto_744091 ?auto_744096 ) ) ( not ( = ?auto_744091 ?auto_744097 ) ) ( not ( = ?auto_744091 ?auto_744098 ) ) ( not ( = ?auto_744091 ?auto_744099 ) ) ( not ( = ?auto_744091 ?auto_744100 ) ) ( not ( = ?auto_744091 ?auto_744101 ) ) ( not ( = ?auto_744091 ?auto_744102 ) ) ( not ( = ?auto_744091 ?auto_744103 ) ) ( not ( = ?auto_744091 ?auto_744104 ) ) ( not ( = ?auto_744092 ?auto_744093 ) ) ( not ( = ?auto_744092 ?auto_744094 ) ) ( not ( = ?auto_744092 ?auto_744095 ) ) ( not ( = ?auto_744092 ?auto_744096 ) ) ( not ( = ?auto_744092 ?auto_744097 ) ) ( not ( = ?auto_744092 ?auto_744098 ) ) ( not ( = ?auto_744092 ?auto_744099 ) ) ( not ( = ?auto_744092 ?auto_744100 ) ) ( not ( = ?auto_744092 ?auto_744101 ) ) ( not ( = ?auto_744092 ?auto_744102 ) ) ( not ( = ?auto_744092 ?auto_744103 ) ) ( not ( = ?auto_744092 ?auto_744104 ) ) ( not ( = ?auto_744093 ?auto_744094 ) ) ( not ( = ?auto_744093 ?auto_744095 ) ) ( not ( = ?auto_744093 ?auto_744096 ) ) ( not ( = ?auto_744093 ?auto_744097 ) ) ( not ( = ?auto_744093 ?auto_744098 ) ) ( not ( = ?auto_744093 ?auto_744099 ) ) ( not ( = ?auto_744093 ?auto_744100 ) ) ( not ( = ?auto_744093 ?auto_744101 ) ) ( not ( = ?auto_744093 ?auto_744102 ) ) ( not ( = ?auto_744093 ?auto_744103 ) ) ( not ( = ?auto_744093 ?auto_744104 ) ) ( not ( = ?auto_744094 ?auto_744095 ) ) ( not ( = ?auto_744094 ?auto_744096 ) ) ( not ( = ?auto_744094 ?auto_744097 ) ) ( not ( = ?auto_744094 ?auto_744098 ) ) ( not ( = ?auto_744094 ?auto_744099 ) ) ( not ( = ?auto_744094 ?auto_744100 ) ) ( not ( = ?auto_744094 ?auto_744101 ) ) ( not ( = ?auto_744094 ?auto_744102 ) ) ( not ( = ?auto_744094 ?auto_744103 ) ) ( not ( = ?auto_744094 ?auto_744104 ) ) ( not ( = ?auto_744095 ?auto_744096 ) ) ( not ( = ?auto_744095 ?auto_744097 ) ) ( not ( = ?auto_744095 ?auto_744098 ) ) ( not ( = ?auto_744095 ?auto_744099 ) ) ( not ( = ?auto_744095 ?auto_744100 ) ) ( not ( = ?auto_744095 ?auto_744101 ) ) ( not ( = ?auto_744095 ?auto_744102 ) ) ( not ( = ?auto_744095 ?auto_744103 ) ) ( not ( = ?auto_744095 ?auto_744104 ) ) ( not ( = ?auto_744096 ?auto_744097 ) ) ( not ( = ?auto_744096 ?auto_744098 ) ) ( not ( = ?auto_744096 ?auto_744099 ) ) ( not ( = ?auto_744096 ?auto_744100 ) ) ( not ( = ?auto_744096 ?auto_744101 ) ) ( not ( = ?auto_744096 ?auto_744102 ) ) ( not ( = ?auto_744096 ?auto_744103 ) ) ( not ( = ?auto_744096 ?auto_744104 ) ) ( not ( = ?auto_744097 ?auto_744098 ) ) ( not ( = ?auto_744097 ?auto_744099 ) ) ( not ( = ?auto_744097 ?auto_744100 ) ) ( not ( = ?auto_744097 ?auto_744101 ) ) ( not ( = ?auto_744097 ?auto_744102 ) ) ( not ( = ?auto_744097 ?auto_744103 ) ) ( not ( = ?auto_744097 ?auto_744104 ) ) ( not ( = ?auto_744098 ?auto_744099 ) ) ( not ( = ?auto_744098 ?auto_744100 ) ) ( not ( = ?auto_744098 ?auto_744101 ) ) ( not ( = ?auto_744098 ?auto_744102 ) ) ( not ( = ?auto_744098 ?auto_744103 ) ) ( not ( = ?auto_744098 ?auto_744104 ) ) ( not ( = ?auto_744099 ?auto_744100 ) ) ( not ( = ?auto_744099 ?auto_744101 ) ) ( not ( = ?auto_744099 ?auto_744102 ) ) ( not ( = ?auto_744099 ?auto_744103 ) ) ( not ( = ?auto_744099 ?auto_744104 ) ) ( not ( = ?auto_744100 ?auto_744101 ) ) ( not ( = ?auto_744100 ?auto_744102 ) ) ( not ( = ?auto_744100 ?auto_744103 ) ) ( not ( = ?auto_744100 ?auto_744104 ) ) ( not ( = ?auto_744101 ?auto_744102 ) ) ( not ( = ?auto_744101 ?auto_744103 ) ) ( not ( = ?auto_744101 ?auto_744104 ) ) ( not ( = ?auto_744102 ?auto_744103 ) ) ( not ( = ?auto_744102 ?auto_744104 ) ) ( not ( = ?auto_744103 ?auto_744104 ) ) ( ON ?auto_744102 ?auto_744103 ) ( CLEAR ?auto_744100 ) ( ON ?auto_744101 ?auto_744102 ) ( CLEAR ?auto_744101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_744089 ?auto_744090 ?auto_744091 ?auto_744092 ?auto_744093 ?auto_744094 ?auto_744095 ?auto_744096 ?auto_744097 ?auto_744098 ?auto_744099 ?auto_744100 ?auto_744101 )
      ( MAKE-15PILE ?auto_744089 ?auto_744090 ?auto_744091 ?auto_744092 ?auto_744093 ?auto_744094 ?auto_744095 ?auto_744096 ?auto_744097 ?auto_744098 ?auto_744099 ?auto_744100 ?auto_744101 ?auto_744102 ?auto_744103 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744151 - BLOCK
      ?auto_744152 - BLOCK
      ?auto_744153 - BLOCK
      ?auto_744154 - BLOCK
      ?auto_744155 - BLOCK
      ?auto_744156 - BLOCK
      ?auto_744157 - BLOCK
      ?auto_744158 - BLOCK
      ?auto_744159 - BLOCK
      ?auto_744160 - BLOCK
      ?auto_744161 - BLOCK
      ?auto_744162 - BLOCK
      ?auto_744163 - BLOCK
      ?auto_744164 - BLOCK
      ?auto_744165 - BLOCK
    )
    :vars
    (
      ?auto_744166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744165 ?auto_744166 ) ( ON-TABLE ?auto_744151 ) ( ON ?auto_744152 ?auto_744151 ) ( ON ?auto_744153 ?auto_744152 ) ( ON ?auto_744154 ?auto_744153 ) ( ON ?auto_744155 ?auto_744154 ) ( ON ?auto_744156 ?auto_744155 ) ( ON ?auto_744157 ?auto_744156 ) ( ON ?auto_744158 ?auto_744157 ) ( ON ?auto_744159 ?auto_744158 ) ( ON ?auto_744160 ?auto_744159 ) ( ON ?auto_744161 ?auto_744160 ) ( not ( = ?auto_744151 ?auto_744152 ) ) ( not ( = ?auto_744151 ?auto_744153 ) ) ( not ( = ?auto_744151 ?auto_744154 ) ) ( not ( = ?auto_744151 ?auto_744155 ) ) ( not ( = ?auto_744151 ?auto_744156 ) ) ( not ( = ?auto_744151 ?auto_744157 ) ) ( not ( = ?auto_744151 ?auto_744158 ) ) ( not ( = ?auto_744151 ?auto_744159 ) ) ( not ( = ?auto_744151 ?auto_744160 ) ) ( not ( = ?auto_744151 ?auto_744161 ) ) ( not ( = ?auto_744151 ?auto_744162 ) ) ( not ( = ?auto_744151 ?auto_744163 ) ) ( not ( = ?auto_744151 ?auto_744164 ) ) ( not ( = ?auto_744151 ?auto_744165 ) ) ( not ( = ?auto_744151 ?auto_744166 ) ) ( not ( = ?auto_744152 ?auto_744153 ) ) ( not ( = ?auto_744152 ?auto_744154 ) ) ( not ( = ?auto_744152 ?auto_744155 ) ) ( not ( = ?auto_744152 ?auto_744156 ) ) ( not ( = ?auto_744152 ?auto_744157 ) ) ( not ( = ?auto_744152 ?auto_744158 ) ) ( not ( = ?auto_744152 ?auto_744159 ) ) ( not ( = ?auto_744152 ?auto_744160 ) ) ( not ( = ?auto_744152 ?auto_744161 ) ) ( not ( = ?auto_744152 ?auto_744162 ) ) ( not ( = ?auto_744152 ?auto_744163 ) ) ( not ( = ?auto_744152 ?auto_744164 ) ) ( not ( = ?auto_744152 ?auto_744165 ) ) ( not ( = ?auto_744152 ?auto_744166 ) ) ( not ( = ?auto_744153 ?auto_744154 ) ) ( not ( = ?auto_744153 ?auto_744155 ) ) ( not ( = ?auto_744153 ?auto_744156 ) ) ( not ( = ?auto_744153 ?auto_744157 ) ) ( not ( = ?auto_744153 ?auto_744158 ) ) ( not ( = ?auto_744153 ?auto_744159 ) ) ( not ( = ?auto_744153 ?auto_744160 ) ) ( not ( = ?auto_744153 ?auto_744161 ) ) ( not ( = ?auto_744153 ?auto_744162 ) ) ( not ( = ?auto_744153 ?auto_744163 ) ) ( not ( = ?auto_744153 ?auto_744164 ) ) ( not ( = ?auto_744153 ?auto_744165 ) ) ( not ( = ?auto_744153 ?auto_744166 ) ) ( not ( = ?auto_744154 ?auto_744155 ) ) ( not ( = ?auto_744154 ?auto_744156 ) ) ( not ( = ?auto_744154 ?auto_744157 ) ) ( not ( = ?auto_744154 ?auto_744158 ) ) ( not ( = ?auto_744154 ?auto_744159 ) ) ( not ( = ?auto_744154 ?auto_744160 ) ) ( not ( = ?auto_744154 ?auto_744161 ) ) ( not ( = ?auto_744154 ?auto_744162 ) ) ( not ( = ?auto_744154 ?auto_744163 ) ) ( not ( = ?auto_744154 ?auto_744164 ) ) ( not ( = ?auto_744154 ?auto_744165 ) ) ( not ( = ?auto_744154 ?auto_744166 ) ) ( not ( = ?auto_744155 ?auto_744156 ) ) ( not ( = ?auto_744155 ?auto_744157 ) ) ( not ( = ?auto_744155 ?auto_744158 ) ) ( not ( = ?auto_744155 ?auto_744159 ) ) ( not ( = ?auto_744155 ?auto_744160 ) ) ( not ( = ?auto_744155 ?auto_744161 ) ) ( not ( = ?auto_744155 ?auto_744162 ) ) ( not ( = ?auto_744155 ?auto_744163 ) ) ( not ( = ?auto_744155 ?auto_744164 ) ) ( not ( = ?auto_744155 ?auto_744165 ) ) ( not ( = ?auto_744155 ?auto_744166 ) ) ( not ( = ?auto_744156 ?auto_744157 ) ) ( not ( = ?auto_744156 ?auto_744158 ) ) ( not ( = ?auto_744156 ?auto_744159 ) ) ( not ( = ?auto_744156 ?auto_744160 ) ) ( not ( = ?auto_744156 ?auto_744161 ) ) ( not ( = ?auto_744156 ?auto_744162 ) ) ( not ( = ?auto_744156 ?auto_744163 ) ) ( not ( = ?auto_744156 ?auto_744164 ) ) ( not ( = ?auto_744156 ?auto_744165 ) ) ( not ( = ?auto_744156 ?auto_744166 ) ) ( not ( = ?auto_744157 ?auto_744158 ) ) ( not ( = ?auto_744157 ?auto_744159 ) ) ( not ( = ?auto_744157 ?auto_744160 ) ) ( not ( = ?auto_744157 ?auto_744161 ) ) ( not ( = ?auto_744157 ?auto_744162 ) ) ( not ( = ?auto_744157 ?auto_744163 ) ) ( not ( = ?auto_744157 ?auto_744164 ) ) ( not ( = ?auto_744157 ?auto_744165 ) ) ( not ( = ?auto_744157 ?auto_744166 ) ) ( not ( = ?auto_744158 ?auto_744159 ) ) ( not ( = ?auto_744158 ?auto_744160 ) ) ( not ( = ?auto_744158 ?auto_744161 ) ) ( not ( = ?auto_744158 ?auto_744162 ) ) ( not ( = ?auto_744158 ?auto_744163 ) ) ( not ( = ?auto_744158 ?auto_744164 ) ) ( not ( = ?auto_744158 ?auto_744165 ) ) ( not ( = ?auto_744158 ?auto_744166 ) ) ( not ( = ?auto_744159 ?auto_744160 ) ) ( not ( = ?auto_744159 ?auto_744161 ) ) ( not ( = ?auto_744159 ?auto_744162 ) ) ( not ( = ?auto_744159 ?auto_744163 ) ) ( not ( = ?auto_744159 ?auto_744164 ) ) ( not ( = ?auto_744159 ?auto_744165 ) ) ( not ( = ?auto_744159 ?auto_744166 ) ) ( not ( = ?auto_744160 ?auto_744161 ) ) ( not ( = ?auto_744160 ?auto_744162 ) ) ( not ( = ?auto_744160 ?auto_744163 ) ) ( not ( = ?auto_744160 ?auto_744164 ) ) ( not ( = ?auto_744160 ?auto_744165 ) ) ( not ( = ?auto_744160 ?auto_744166 ) ) ( not ( = ?auto_744161 ?auto_744162 ) ) ( not ( = ?auto_744161 ?auto_744163 ) ) ( not ( = ?auto_744161 ?auto_744164 ) ) ( not ( = ?auto_744161 ?auto_744165 ) ) ( not ( = ?auto_744161 ?auto_744166 ) ) ( not ( = ?auto_744162 ?auto_744163 ) ) ( not ( = ?auto_744162 ?auto_744164 ) ) ( not ( = ?auto_744162 ?auto_744165 ) ) ( not ( = ?auto_744162 ?auto_744166 ) ) ( not ( = ?auto_744163 ?auto_744164 ) ) ( not ( = ?auto_744163 ?auto_744165 ) ) ( not ( = ?auto_744163 ?auto_744166 ) ) ( not ( = ?auto_744164 ?auto_744165 ) ) ( not ( = ?auto_744164 ?auto_744166 ) ) ( not ( = ?auto_744165 ?auto_744166 ) ) ( ON ?auto_744164 ?auto_744165 ) ( ON ?auto_744163 ?auto_744164 ) ( CLEAR ?auto_744161 ) ( ON ?auto_744162 ?auto_744163 ) ( CLEAR ?auto_744162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_744151 ?auto_744152 ?auto_744153 ?auto_744154 ?auto_744155 ?auto_744156 ?auto_744157 ?auto_744158 ?auto_744159 ?auto_744160 ?auto_744161 ?auto_744162 )
      ( MAKE-15PILE ?auto_744151 ?auto_744152 ?auto_744153 ?auto_744154 ?auto_744155 ?auto_744156 ?auto_744157 ?auto_744158 ?auto_744159 ?auto_744160 ?auto_744161 ?auto_744162 ?auto_744163 ?auto_744164 ?auto_744165 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744213 - BLOCK
      ?auto_744214 - BLOCK
      ?auto_744215 - BLOCK
      ?auto_744216 - BLOCK
      ?auto_744217 - BLOCK
      ?auto_744218 - BLOCK
      ?auto_744219 - BLOCK
      ?auto_744220 - BLOCK
      ?auto_744221 - BLOCK
      ?auto_744222 - BLOCK
      ?auto_744223 - BLOCK
      ?auto_744224 - BLOCK
      ?auto_744225 - BLOCK
      ?auto_744226 - BLOCK
      ?auto_744227 - BLOCK
    )
    :vars
    (
      ?auto_744228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744227 ?auto_744228 ) ( ON-TABLE ?auto_744213 ) ( ON ?auto_744214 ?auto_744213 ) ( ON ?auto_744215 ?auto_744214 ) ( ON ?auto_744216 ?auto_744215 ) ( ON ?auto_744217 ?auto_744216 ) ( ON ?auto_744218 ?auto_744217 ) ( ON ?auto_744219 ?auto_744218 ) ( ON ?auto_744220 ?auto_744219 ) ( ON ?auto_744221 ?auto_744220 ) ( ON ?auto_744222 ?auto_744221 ) ( not ( = ?auto_744213 ?auto_744214 ) ) ( not ( = ?auto_744213 ?auto_744215 ) ) ( not ( = ?auto_744213 ?auto_744216 ) ) ( not ( = ?auto_744213 ?auto_744217 ) ) ( not ( = ?auto_744213 ?auto_744218 ) ) ( not ( = ?auto_744213 ?auto_744219 ) ) ( not ( = ?auto_744213 ?auto_744220 ) ) ( not ( = ?auto_744213 ?auto_744221 ) ) ( not ( = ?auto_744213 ?auto_744222 ) ) ( not ( = ?auto_744213 ?auto_744223 ) ) ( not ( = ?auto_744213 ?auto_744224 ) ) ( not ( = ?auto_744213 ?auto_744225 ) ) ( not ( = ?auto_744213 ?auto_744226 ) ) ( not ( = ?auto_744213 ?auto_744227 ) ) ( not ( = ?auto_744213 ?auto_744228 ) ) ( not ( = ?auto_744214 ?auto_744215 ) ) ( not ( = ?auto_744214 ?auto_744216 ) ) ( not ( = ?auto_744214 ?auto_744217 ) ) ( not ( = ?auto_744214 ?auto_744218 ) ) ( not ( = ?auto_744214 ?auto_744219 ) ) ( not ( = ?auto_744214 ?auto_744220 ) ) ( not ( = ?auto_744214 ?auto_744221 ) ) ( not ( = ?auto_744214 ?auto_744222 ) ) ( not ( = ?auto_744214 ?auto_744223 ) ) ( not ( = ?auto_744214 ?auto_744224 ) ) ( not ( = ?auto_744214 ?auto_744225 ) ) ( not ( = ?auto_744214 ?auto_744226 ) ) ( not ( = ?auto_744214 ?auto_744227 ) ) ( not ( = ?auto_744214 ?auto_744228 ) ) ( not ( = ?auto_744215 ?auto_744216 ) ) ( not ( = ?auto_744215 ?auto_744217 ) ) ( not ( = ?auto_744215 ?auto_744218 ) ) ( not ( = ?auto_744215 ?auto_744219 ) ) ( not ( = ?auto_744215 ?auto_744220 ) ) ( not ( = ?auto_744215 ?auto_744221 ) ) ( not ( = ?auto_744215 ?auto_744222 ) ) ( not ( = ?auto_744215 ?auto_744223 ) ) ( not ( = ?auto_744215 ?auto_744224 ) ) ( not ( = ?auto_744215 ?auto_744225 ) ) ( not ( = ?auto_744215 ?auto_744226 ) ) ( not ( = ?auto_744215 ?auto_744227 ) ) ( not ( = ?auto_744215 ?auto_744228 ) ) ( not ( = ?auto_744216 ?auto_744217 ) ) ( not ( = ?auto_744216 ?auto_744218 ) ) ( not ( = ?auto_744216 ?auto_744219 ) ) ( not ( = ?auto_744216 ?auto_744220 ) ) ( not ( = ?auto_744216 ?auto_744221 ) ) ( not ( = ?auto_744216 ?auto_744222 ) ) ( not ( = ?auto_744216 ?auto_744223 ) ) ( not ( = ?auto_744216 ?auto_744224 ) ) ( not ( = ?auto_744216 ?auto_744225 ) ) ( not ( = ?auto_744216 ?auto_744226 ) ) ( not ( = ?auto_744216 ?auto_744227 ) ) ( not ( = ?auto_744216 ?auto_744228 ) ) ( not ( = ?auto_744217 ?auto_744218 ) ) ( not ( = ?auto_744217 ?auto_744219 ) ) ( not ( = ?auto_744217 ?auto_744220 ) ) ( not ( = ?auto_744217 ?auto_744221 ) ) ( not ( = ?auto_744217 ?auto_744222 ) ) ( not ( = ?auto_744217 ?auto_744223 ) ) ( not ( = ?auto_744217 ?auto_744224 ) ) ( not ( = ?auto_744217 ?auto_744225 ) ) ( not ( = ?auto_744217 ?auto_744226 ) ) ( not ( = ?auto_744217 ?auto_744227 ) ) ( not ( = ?auto_744217 ?auto_744228 ) ) ( not ( = ?auto_744218 ?auto_744219 ) ) ( not ( = ?auto_744218 ?auto_744220 ) ) ( not ( = ?auto_744218 ?auto_744221 ) ) ( not ( = ?auto_744218 ?auto_744222 ) ) ( not ( = ?auto_744218 ?auto_744223 ) ) ( not ( = ?auto_744218 ?auto_744224 ) ) ( not ( = ?auto_744218 ?auto_744225 ) ) ( not ( = ?auto_744218 ?auto_744226 ) ) ( not ( = ?auto_744218 ?auto_744227 ) ) ( not ( = ?auto_744218 ?auto_744228 ) ) ( not ( = ?auto_744219 ?auto_744220 ) ) ( not ( = ?auto_744219 ?auto_744221 ) ) ( not ( = ?auto_744219 ?auto_744222 ) ) ( not ( = ?auto_744219 ?auto_744223 ) ) ( not ( = ?auto_744219 ?auto_744224 ) ) ( not ( = ?auto_744219 ?auto_744225 ) ) ( not ( = ?auto_744219 ?auto_744226 ) ) ( not ( = ?auto_744219 ?auto_744227 ) ) ( not ( = ?auto_744219 ?auto_744228 ) ) ( not ( = ?auto_744220 ?auto_744221 ) ) ( not ( = ?auto_744220 ?auto_744222 ) ) ( not ( = ?auto_744220 ?auto_744223 ) ) ( not ( = ?auto_744220 ?auto_744224 ) ) ( not ( = ?auto_744220 ?auto_744225 ) ) ( not ( = ?auto_744220 ?auto_744226 ) ) ( not ( = ?auto_744220 ?auto_744227 ) ) ( not ( = ?auto_744220 ?auto_744228 ) ) ( not ( = ?auto_744221 ?auto_744222 ) ) ( not ( = ?auto_744221 ?auto_744223 ) ) ( not ( = ?auto_744221 ?auto_744224 ) ) ( not ( = ?auto_744221 ?auto_744225 ) ) ( not ( = ?auto_744221 ?auto_744226 ) ) ( not ( = ?auto_744221 ?auto_744227 ) ) ( not ( = ?auto_744221 ?auto_744228 ) ) ( not ( = ?auto_744222 ?auto_744223 ) ) ( not ( = ?auto_744222 ?auto_744224 ) ) ( not ( = ?auto_744222 ?auto_744225 ) ) ( not ( = ?auto_744222 ?auto_744226 ) ) ( not ( = ?auto_744222 ?auto_744227 ) ) ( not ( = ?auto_744222 ?auto_744228 ) ) ( not ( = ?auto_744223 ?auto_744224 ) ) ( not ( = ?auto_744223 ?auto_744225 ) ) ( not ( = ?auto_744223 ?auto_744226 ) ) ( not ( = ?auto_744223 ?auto_744227 ) ) ( not ( = ?auto_744223 ?auto_744228 ) ) ( not ( = ?auto_744224 ?auto_744225 ) ) ( not ( = ?auto_744224 ?auto_744226 ) ) ( not ( = ?auto_744224 ?auto_744227 ) ) ( not ( = ?auto_744224 ?auto_744228 ) ) ( not ( = ?auto_744225 ?auto_744226 ) ) ( not ( = ?auto_744225 ?auto_744227 ) ) ( not ( = ?auto_744225 ?auto_744228 ) ) ( not ( = ?auto_744226 ?auto_744227 ) ) ( not ( = ?auto_744226 ?auto_744228 ) ) ( not ( = ?auto_744227 ?auto_744228 ) ) ( ON ?auto_744226 ?auto_744227 ) ( ON ?auto_744225 ?auto_744226 ) ( ON ?auto_744224 ?auto_744225 ) ( CLEAR ?auto_744222 ) ( ON ?auto_744223 ?auto_744224 ) ( CLEAR ?auto_744223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_744213 ?auto_744214 ?auto_744215 ?auto_744216 ?auto_744217 ?auto_744218 ?auto_744219 ?auto_744220 ?auto_744221 ?auto_744222 ?auto_744223 )
      ( MAKE-15PILE ?auto_744213 ?auto_744214 ?auto_744215 ?auto_744216 ?auto_744217 ?auto_744218 ?auto_744219 ?auto_744220 ?auto_744221 ?auto_744222 ?auto_744223 ?auto_744224 ?auto_744225 ?auto_744226 ?auto_744227 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744275 - BLOCK
      ?auto_744276 - BLOCK
      ?auto_744277 - BLOCK
      ?auto_744278 - BLOCK
      ?auto_744279 - BLOCK
      ?auto_744280 - BLOCK
      ?auto_744281 - BLOCK
      ?auto_744282 - BLOCK
      ?auto_744283 - BLOCK
      ?auto_744284 - BLOCK
      ?auto_744285 - BLOCK
      ?auto_744286 - BLOCK
      ?auto_744287 - BLOCK
      ?auto_744288 - BLOCK
      ?auto_744289 - BLOCK
    )
    :vars
    (
      ?auto_744290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744289 ?auto_744290 ) ( ON-TABLE ?auto_744275 ) ( ON ?auto_744276 ?auto_744275 ) ( ON ?auto_744277 ?auto_744276 ) ( ON ?auto_744278 ?auto_744277 ) ( ON ?auto_744279 ?auto_744278 ) ( ON ?auto_744280 ?auto_744279 ) ( ON ?auto_744281 ?auto_744280 ) ( ON ?auto_744282 ?auto_744281 ) ( ON ?auto_744283 ?auto_744282 ) ( not ( = ?auto_744275 ?auto_744276 ) ) ( not ( = ?auto_744275 ?auto_744277 ) ) ( not ( = ?auto_744275 ?auto_744278 ) ) ( not ( = ?auto_744275 ?auto_744279 ) ) ( not ( = ?auto_744275 ?auto_744280 ) ) ( not ( = ?auto_744275 ?auto_744281 ) ) ( not ( = ?auto_744275 ?auto_744282 ) ) ( not ( = ?auto_744275 ?auto_744283 ) ) ( not ( = ?auto_744275 ?auto_744284 ) ) ( not ( = ?auto_744275 ?auto_744285 ) ) ( not ( = ?auto_744275 ?auto_744286 ) ) ( not ( = ?auto_744275 ?auto_744287 ) ) ( not ( = ?auto_744275 ?auto_744288 ) ) ( not ( = ?auto_744275 ?auto_744289 ) ) ( not ( = ?auto_744275 ?auto_744290 ) ) ( not ( = ?auto_744276 ?auto_744277 ) ) ( not ( = ?auto_744276 ?auto_744278 ) ) ( not ( = ?auto_744276 ?auto_744279 ) ) ( not ( = ?auto_744276 ?auto_744280 ) ) ( not ( = ?auto_744276 ?auto_744281 ) ) ( not ( = ?auto_744276 ?auto_744282 ) ) ( not ( = ?auto_744276 ?auto_744283 ) ) ( not ( = ?auto_744276 ?auto_744284 ) ) ( not ( = ?auto_744276 ?auto_744285 ) ) ( not ( = ?auto_744276 ?auto_744286 ) ) ( not ( = ?auto_744276 ?auto_744287 ) ) ( not ( = ?auto_744276 ?auto_744288 ) ) ( not ( = ?auto_744276 ?auto_744289 ) ) ( not ( = ?auto_744276 ?auto_744290 ) ) ( not ( = ?auto_744277 ?auto_744278 ) ) ( not ( = ?auto_744277 ?auto_744279 ) ) ( not ( = ?auto_744277 ?auto_744280 ) ) ( not ( = ?auto_744277 ?auto_744281 ) ) ( not ( = ?auto_744277 ?auto_744282 ) ) ( not ( = ?auto_744277 ?auto_744283 ) ) ( not ( = ?auto_744277 ?auto_744284 ) ) ( not ( = ?auto_744277 ?auto_744285 ) ) ( not ( = ?auto_744277 ?auto_744286 ) ) ( not ( = ?auto_744277 ?auto_744287 ) ) ( not ( = ?auto_744277 ?auto_744288 ) ) ( not ( = ?auto_744277 ?auto_744289 ) ) ( not ( = ?auto_744277 ?auto_744290 ) ) ( not ( = ?auto_744278 ?auto_744279 ) ) ( not ( = ?auto_744278 ?auto_744280 ) ) ( not ( = ?auto_744278 ?auto_744281 ) ) ( not ( = ?auto_744278 ?auto_744282 ) ) ( not ( = ?auto_744278 ?auto_744283 ) ) ( not ( = ?auto_744278 ?auto_744284 ) ) ( not ( = ?auto_744278 ?auto_744285 ) ) ( not ( = ?auto_744278 ?auto_744286 ) ) ( not ( = ?auto_744278 ?auto_744287 ) ) ( not ( = ?auto_744278 ?auto_744288 ) ) ( not ( = ?auto_744278 ?auto_744289 ) ) ( not ( = ?auto_744278 ?auto_744290 ) ) ( not ( = ?auto_744279 ?auto_744280 ) ) ( not ( = ?auto_744279 ?auto_744281 ) ) ( not ( = ?auto_744279 ?auto_744282 ) ) ( not ( = ?auto_744279 ?auto_744283 ) ) ( not ( = ?auto_744279 ?auto_744284 ) ) ( not ( = ?auto_744279 ?auto_744285 ) ) ( not ( = ?auto_744279 ?auto_744286 ) ) ( not ( = ?auto_744279 ?auto_744287 ) ) ( not ( = ?auto_744279 ?auto_744288 ) ) ( not ( = ?auto_744279 ?auto_744289 ) ) ( not ( = ?auto_744279 ?auto_744290 ) ) ( not ( = ?auto_744280 ?auto_744281 ) ) ( not ( = ?auto_744280 ?auto_744282 ) ) ( not ( = ?auto_744280 ?auto_744283 ) ) ( not ( = ?auto_744280 ?auto_744284 ) ) ( not ( = ?auto_744280 ?auto_744285 ) ) ( not ( = ?auto_744280 ?auto_744286 ) ) ( not ( = ?auto_744280 ?auto_744287 ) ) ( not ( = ?auto_744280 ?auto_744288 ) ) ( not ( = ?auto_744280 ?auto_744289 ) ) ( not ( = ?auto_744280 ?auto_744290 ) ) ( not ( = ?auto_744281 ?auto_744282 ) ) ( not ( = ?auto_744281 ?auto_744283 ) ) ( not ( = ?auto_744281 ?auto_744284 ) ) ( not ( = ?auto_744281 ?auto_744285 ) ) ( not ( = ?auto_744281 ?auto_744286 ) ) ( not ( = ?auto_744281 ?auto_744287 ) ) ( not ( = ?auto_744281 ?auto_744288 ) ) ( not ( = ?auto_744281 ?auto_744289 ) ) ( not ( = ?auto_744281 ?auto_744290 ) ) ( not ( = ?auto_744282 ?auto_744283 ) ) ( not ( = ?auto_744282 ?auto_744284 ) ) ( not ( = ?auto_744282 ?auto_744285 ) ) ( not ( = ?auto_744282 ?auto_744286 ) ) ( not ( = ?auto_744282 ?auto_744287 ) ) ( not ( = ?auto_744282 ?auto_744288 ) ) ( not ( = ?auto_744282 ?auto_744289 ) ) ( not ( = ?auto_744282 ?auto_744290 ) ) ( not ( = ?auto_744283 ?auto_744284 ) ) ( not ( = ?auto_744283 ?auto_744285 ) ) ( not ( = ?auto_744283 ?auto_744286 ) ) ( not ( = ?auto_744283 ?auto_744287 ) ) ( not ( = ?auto_744283 ?auto_744288 ) ) ( not ( = ?auto_744283 ?auto_744289 ) ) ( not ( = ?auto_744283 ?auto_744290 ) ) ( not ( = ?auto_744284 ?auto_744285 ) ) ( not ( = ?auto_744284 ?auto_744286 ) ) ( not ( = ?auto_744284 ?auto_744287 ) ) ( not ( = ?auto_744284 ?auto_744288 ) ) ( not ( = ?auto_744284 ?auto_744289 ) ) ( not ( = ?auto_744284 ?auto_744290 ) ) ( not ( = ?auto_744285 ?auto_744286 ) ) ( not ( = ?auto_744285 ?auto_744287 ) ) ( not ( = ?auto_744285 ?auto_744288 ) ) ( not ( = ?auto_744285 ?auto_744289 ) ) ( not ( = ?auto_744285 ?auto_744290 ) ) ( not ( = ?auto_744286 ?auto_744287 ) ) ( not ( = ?auto_744286 ?auto_744288 ) ) ( not ( = ?auto_744286 ?auto_744289 ) ) ( not ( = ?auto_744286 ?auto_744290 ) ) ( not ( = ?auto_744287 ?auto_744288 ) ) ( not ( = ?auto_744287 ?auto_744289 ) ) ( not ( = ?auto_744287 ?auto_744290 ) ) ( not ( = ?auto_744288 ?auto_744289 ) ) ( not ( = ?auto_744288 ?auto_744290 ) ) ( not ( = ?auto_744289 ?auto_744290 ) ) ( ON ?auto_744288 ?auto_744289 ) ( ON ?auto_744287 ?auto_744288 ) ( ON ?auto_744286 ?auto_744287 ) ( ON ?auto_744285 ?auto_744286 ) ( CLEAR ?auto_744283 ) ( ON ?auto_744284 ?auto_744285 ) ( CLEAR ?auto_744284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_744275 ?auto_744276 ?auto_744277 ?auto_744278 ?auto_744279 ?auto_744280 ?auto_744281 ?auto_744282 ?auto_744283 ?auto_744284 )
      ( MAKE-15PILE ?auto_744275 ?auto_744276 ?auto_744277 ?auto_744278 ?auto_744279 ?auto_744280 ?auto_744281 ?auto_744282 ?auto_744283 ?auto_744284 ?auto_744285 ?auto_744286 ?auto_744287 ?auto_744288 ?auto_744289 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744337 - BLOCK
      ?auto_744338 - BLOCK
      ?auto_744339 - BLOCK
      ?auto_744340 - BLOCK
      ?auto_744341 - BLOCK
      ?auto_744342 - BLOCK
      ?auto_744343 - BLOCK
      ?auto_744344 - BLOCK
      ?auto_744345 - BLOCK
      ?auto_744346 - BLOCK
      ?auto_744347 - BLOCK
      ?auto_744348 - BLOCK
      ?auto_744349 - BLOCK
      ?auto_744350 - BLOCK
      ?auto_744351 - BLOCK
    )
    :vars
    (
      ?auto_744352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744351 ?auto_744352 ) ( ON-TABLE ?auto_744337 ) ( ON ?auto_744338 ?auto_744337 ) ( ON ?auto_744339 ?auto_744338 ) ( ON ?auto_744340 ?auto_744339 ) ( ON ?auto_744341 ?auto_744340 ) ( ON ?auto_744342 ?auto_744341 ) ( ON ?auto_744343 ?auto_744342 ) ( ON ?auto_744344 ?auto_744343 ) ( not ( = ?auto_744337 ?auto_744338 ) ) ( not ( = ?auto_744337 ?auto_744339 ) ) ( not ( = ?auto_744337 ?auto_744340 ) ) ( not ( = ?auto_744337 ?auto_744341 ) ) ( not ( = ?auto_744337 ?auto_744342 ) ) ( not ( = ?auto_744337 ?auto_744343 ) ) ( not ( = ?auto_744337 ?auto_744344 ) ) ( not ( = ?auto_744337 ?auto_744345 ) ) ( not ( = ?auto_744337 ?auto_744346 ) ) ( not ( = ?auto_744337 ?auto_744347 ) ) ( not ( = ?auto_744337 ?auto_744348 ) ) ( not ( = ?auto_744337 ?auto_744349 ) ) ( not ( = ?auto_744337 ?auto_744350 ) ) ( not ( = ?auto_744337 ?auto_744351 ) ) ( not ( = ?auto_744337 ?auto_744352 ) ) ( not ( = ?auto_744338 ?auto_744339 ) ) ( not ( = ?auto_744338 ?auto_744340 ) ) ( not ( = ?auto_744338 ?auto_744341 ) ) ( not ( = ?auto_744338 ?auto_744342 ) ) ( not ( = ?auto_744338 ?auto_744343 ) ) ( not ( = ?auto_744338 ?auto_744344 ) ) ( not ( = ?auto_744338 ?auto_744345 ) ) ( not ( = ?auto_744338 ?auto_744346 ) ) ( not ( = ?auto_744338 ?auto_744347 ) ) ( not ( = ?auto_744338 ?auto_744348 ) ) ( not ( = ?auto_744338 ?auto_744349 ) ) ( not ( = ?auto_744338 ?auto_744350 ) ) ( not ( = ?auto_744338 ?auto_744351 ) ) ( not ( = ?auto_744338 ?auto_744352 ) ) ( not ( = ?auto_744339 ?auto_744340 ) ) ( not ( = ?auto_744339 ?auto_744341 ) ) ( not ( = ?auto_744339 ?auto_744342 ) ) ( not ( = ?auto_744339 ?auto_744343 ) ) ( not ( = ?auto_744339 ?auto_744344 ) ) ( not ( = ?auto_744339 ?auto_744345 ) ) ( not ( = ?auto_744339 ?auto_744346 ) ) ( not ( = ?auto_744339 ?auto_744347 ) ) ( not ( = ?auto_744339 ?auto_744348 ) ) ( not ( = ?auto_744339 ?auto_744349 ) ) ( not ( = ?auto_744339 ?auto_744350 ) ) ( not ( = ?auto_744339 ?auto_744351 ) ) ( not ( = ?auto_744339 ?auto_744352 ) ) ( not ( = ?auto_744340 ?auto_744341 ) ) ( not ( = ?auto_744340 ?auto_744342 ) ) ( not ( = ?auto_744340 ?auto_744343 ) ) ( not ( = ?auto_744340 ?auto_744344 ) ) ( not ( = ?auto_744340 ?auto_744345 ) ) ( not ( = ?auto_744340 ?auto_744346 ) ) ( not ( = ?auto_744340 ?auto_744347 ) ) ( not ( = ?auto_744340 ?auto_744348 ) ) ( not ( = ?auto_744340 ?auto_744349 ) ) ( not ( = ?auto_744340 ?auto_744350 ) ) ( not ( = ?auto_744340 ?auto_744351 ) ) ( not ( = ?auto_744340 ?auto_744352 ) ) ( not ( = ?auto_744341 ?auto_744342 ) ) ( not ( = ?auto_744341 ?auto_744343 ) ) ( not ( = ?auto_744341 ?auto_744344 ) ) ( not ( = ?auto_744341 ?auto_744345 ) ) ( not ( = ?auto_744341 ?auto_744346 ) ) ( not ( = ?auto_744341 ?auto_744347 ) ) ( not ( = ?auto_744341 ?auto_744348 ) ) ( not ( = ?auto_744341 ?auto_744349 ) ) ( not ( = ?auto_744341 ?auto_744350 ) ) ( not ( = ?auto_744341 ?auto_744351 ) ) ( not ( = ?auto_744341 ?auto_744352 ) ) ( not ( = ?auto_744342 ?auto_744343 ) ) ( not ( = ?auto_744342 ?auto_744344 ) ) ( not ( = ?auto_744342 ?auto_744345 ) ) ( not ( = ?auto_744342 ?auto_744346 ) ) ( not ( = ?auto_744342 ?auto_744347 ) ) ( not ( = ?auto_744342 ?auto_744348 ) ) ( not ( = ?auto_744342 ?auto_744349 ) ) ( not ( = ?auto_744342 ?auto_744350 ) ) ( not ( = ?auto_744342 ?auto_744351 ) ) ( not ( = ?auto_744342 ?auto_744352 ) ) ( not ( = ?auto_744343 ?auto_744344 ) ) ( not ( = ?auto_744343 ?auto_744345 ) ) ( not ( = ?auto_744343 ?auto_744346 ) ) ( not ( = ?auto_744343 ?auto_744347 ) ) ( not ( = ?auto_744343 ?auto_744348 ) ) ( not ( = ?auto_744343 ?auto_744349 ) ) ( not ( = ?auto_744343 ?auto_744350 ) ) ( not ( = ?auto_744343 ?auto_744351 ) ) ( not ( = ?auto_744343 ?auto_744352 ) ) ( not ( = ?auto_744344 ?auto_744345 ) ) ( not ( = ?auto_744344 ?auto_744346 ) ) ( not ( = ?auto_744344 ?auto_744347 ) ) ( not ( = ?auto_744344 ?auto_744348 ) ) ( not ( = ?auto_744344 ?auto_744349 ) ) ( not ( = ?auto_744344 ?auto_744350 ) ) ( not ( = ?auto_744344 ?auto_744351 ) ) ( not ( = ?auto_744344 ?auto_744352 ) ) ( not ( = ?auto_744345 ?auto_744346 ) ) ( not ( = ?auto_744345 ?auto_744347 ) ) ( not ( = ?auto_744345 ?auto_744348 ) ) ( not ( = ?auto_744345 ?auto_744349 ) ) ( not ( = ?auto_744345 ?auto_744350 ) ) ( not ( = ?auto_744345 ?auto_744351 ) ) ( not ( = ?auto_744345 ?auto_744352 ) ) ( not ( = ?auto_744346 ?auto_744347 ) ) ( not ( = ?auto_744346 ?auto_744348 ) ) ( not ( = ?auto_744346 ?auto_744349 ) ) ( not ( = ?auto_744346 ?auto_744350 ) ) ( not ( = ?auto_744346 ?auto_744351 ) ) ( not ( = ?auto_744346 ?auto_744352 ) ) ( not ( = ?auto_744347 ?auto_744348 ) ) ( not ( = ?auto_744347 ?auto_744349 ) ) ( not ( = ?auto_744347 ?auto_744350 ) ) ( not ( = ?auto_744347 ?auto_744351 ) ) ( not ( = ?auto_744347 ?auto_744352 ) ) ( not ( = ?auto_744348 ?auto_744349 ) ) ( not ( = ?auto_744348 ?auto_744350 ) ) ( not ( = ?auto_744348 ?auto_744351 ) ) ( not ( = ?auto_744348 ?auto_744352 ) ) ( not ( = ?auto_744349 ?auto_744350 ) ) ( not ( = ?auto_744349 ?auto_744351 ) ) ( not ( = ?auto_744349 ?auto_744352 ) ) ( not ( = ?auto_744350 ?auto_744351 ) ) ( not ( = ?auto_744350 ?auto_744352 ) ) ( not ( = ?auto_744351 ?auto_744352 ) ) ( ON ?auto_744350 ?auto_744351 ) ( ON ?auto_744349 ?auto_744350 ) ( ON ?auto_744348 ?auto_744349 ) ( ON ?auto_744347 ?auto_744348 ) ( ON ?auto_744346 ?auto_744347 ) ( CLEAR ?auto_744344 ) ( ON ?auto_744345 ?auto_744346 ) ( CLEAR ?auto_744345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_744337 ?auto_744338 ?auto_744339 ?auto_744340 ?auto_744341 ?auto_744342 ?auto_744343 ?auto_744344 ?auto_744345 )
      ( MAKE-15PILE ?auto_744337 ?auto_744338 ?auto_744339 ?auto_744340 ?auto_744341 ?auto_744342 ?auto_744343 ?auto_744344 ?auto_744345 ?auto_744346 ?auto_744347 ?auto_744348 ?auto_744349 ?auto_744350 ?auto_744351 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744399 - BLOCK
      ?auto_744400 - BLOCK
      ?auto_744401 - BLOCK
      ?auto_744402 - BLOCK
      ?auto_744403 - BLOCK
      ?auto_744404 - BLOCK
      ?auto_744405 - BLOCK
      ?auto_744406 - BLOCK
      ?auto_744407 - BLOCK
      ?auto_744408 - BLOCK
      ?auto_744409 - BLOCK
      ?auto_744410 - BLOCK
      ?auto_744411 - BLOCK
      ?auto_744412 - BLOCK
      ?auto_744413 - BLOCK
    )
    :vars
    (
      ?auto_744414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744413 ?auto_744414 ) ( ON-TABLE ?auto_744399 ) ( ON ?auto_744400 ?auto_744399 ) ( ON ?auto_744401 ?auto_744400 ) ( ON ?auto_744402 ?auto_744401 ) ( ON ?auto_744403 ?auto_744402 ) ( ON ?auto_744404 ?auto_744403 ) ( ON ?auto_744405 ?auto_744404 ) ( not ( = ?auto_744399 ?auto_744400 ) ) ( not ( = ?auto_744399 ?auto_744401 ) ) ( not ( = ?auto_744399 ?auto_744402 ) ) ( not ( = ?auto_744399 ?auto_744403 ) ) ( not ( = ?auto_744399 ?auto_744404 ) ) ( not ( = ?auto_744399 ?auto_744405 ) ) ( not ( = ?auto_744399 ?auto_744406 ) ) ( not ( = ?auto_744399 ?auto_744407 ) ) ( not ( = ?auto_744399 ?auto_744408 ) ) ( not ( = ?auto_744399 ?auto_744409 ) ) ( not ( = ?auto_744399 ?auto_744410 ) ) ( not ( = ?auto_744399 ?auto_744411 ) ) ( not ( = ?auto_744399 ?auto_744412 ) ) ( not ( = ?auto_744399 ?auto_744413 ) ) ( not ( = ?auto_744399 ?auto_744414 ) ) ( not ( = ?auto_744400 ?auto_744401 ) ) ( not ( = ?auto_744400 ?auto_744402 ) ) ( not ( = ?auto_744400 ?auto_744403 ) ) ( not ( = ?auto_744400 ?auto_744404 ) ) ( not ( = ?auto_744400 ?auto_744405 ) ) ( not ( = ?auto_744400 ?auto_744406 ) ) ( not ( = ?auto_744400 ?auto_744407 ) ) ( not ( = ?auto_744400 ?auto_744408 ) ) ( not ( = ?auto_744400 ?auto_744409 ) ) ( not ( = ?auto_744400 ?auto_744410 ) ) ( not ( = ?auto_744400 ?auto_744411 ) ) ( not ( = ?auto_744400 ?auto_744412 ) ) ( not ( = ?auto_744400 ?auto_744413 ) ) ( not ( = ?auto_744400 ?auto_744414 ) ) ( not ( = ?auto_744401 ?auto_744402 ) ) ( not ( = ?auto_744401 ?auto_744403 ) ) ( not ( = ?auto_744401 ?auto_744404 ) ) ( not ( = ?auto_744401 ?auto_744405 ) ) ( not ( = ?auto_744401 ?auto_744406 ) ) ( not ( = ?auto_744401 ?auto_744407 ) ) ( not ( = ?auto_744401 ?auto_744408 ) ) ( not ( = ?auto_744401 ?auto_744409 ) ) ( not ( = ?auto_744401 ?auto_744410 ) ) ( not ( = ?auto_744401 ?auto_744411 ) ) ( not ( = ?auto_744401 ?auto_744412 ) ) ( not ( = ?auto_744401 ?auto_744413 ) ) ( not ( = ?auto_744401 ?auto_744414 ) ) ( not ( = ?auto_744402 ?auto_744403 ) ) ( not ( = ?auto_744402 ?auto_744404 ) ) ( not ( = ?auto_744402 ?auto_744405 ) ) ( not ( = ?auto_744402 ?auto_744406 ) ) ( not ( = ?auto_744402 ?auto_744407 ) ) ( not ( = ?auto_744402 ?auto_744408 ) ) ( not ( = ?auto_744402 ?auto_744409 ) ) ( not ( = ?auto_744402 ?auto_744410 ) ) ( not ( = ?auto_744402 ?auto_744411 ) ) ( not ( = ?auto_744402 ?auto_744412 ) ) ( not ( = ?auto_744402 ?auto_744413 ) ) ( not ( = ?auto_744402 ?auto_744414 ) ) ( not ( = ?auto_744403 ?auto_744404 ) ) ( not ( = ?auto_744403 ?auto_744405 ) ) ( not ( = ?auto_744403 ?auto_744406 ) ) ( not ( = ?auto_744403 ?auto_744407 ) ) ( not ( = ?auto_744403 ?auto_744408 ) ) ( not ( = ?auto_744403 ?auto_744409 ) ) ( not ( = ?auto_744403 ?auto_744410 ) ) ( not ( = ?auto_744403 ?auto_744411 ) ) ( not ( = ?auto_744403 ?auto_744412 ) ) ( not ( = ?auto_744403 ?auto_744413 ) ) ( not ( = ?auto_744403 ?auto_744414 ) ) ( not ( = ?auto_744404 ?auto_744405 ) ) ( not ( = ?auto_744404 ?auto_744406 ) ) ( not ( = ?auto_744404 ?auto_744407 ) ) ( not ( = ?auto_744404 ?auto_744408 ) ) ( not ( = ?auto_744404 ?auto_744409 ) ) ( not ( = ?auto_744404 ?auto_744410 ) ) ( not ( = ?auto_744404 ?auto_744411 ) ) ( not ( = ?auto_744404 ?auto_744412 ) ) ( not ( = ?auto_744404 ?auto_744413 ) ) ( not ( = ?auto_744404 ?auto_744414 ) ) ( not ( = ?auto_744405 ?auto_744406 ) ) ( not ( = ?auto_744405 ?auto_744407 ) ) ( not ( = ?auto_744405 ?auto_744408 ) ) ( not ( = ?auto_744405 ?auto_744409 ) ) ( not ( = ?auto_744405 ?auto_744410 ) ) ( not ( = ?auto_744405 ?auto_744411 ) ) ( not ( = ?auto_744405 ?auto_744412 ) ) ( not ( = ?auto_744405 ?auto_744413 ) ) ( not ( = ?auto_744405 ?auto_744414 ) ) ( not ( = ?auto_744406 ?auto_744407 ) ) ( not ( = ?auto_744406 ?auto_744408 ) ) ( not ( = ?auto_744406 ?auto_744409 ) ) ( not ( = ?auto_744406 ?auto_744410 ) ) ( not ( = ?auto_744406 ?auto_744411 ) ) ( not ( = ?auto_744406 ?auto_744412 ) ) ( not ( = ?auto_744406 ?auto_744413 ) ) ( not ( = ?auto_744406 ?auto_744414 ) ) ( not ( = ?auto_744407 ?auto_744408 ) ) ( not ( = ?auto_744407 ?auto_744409 ) ) ( not ( = ?auto_744407 ?auto_744410 ) ) ( not ( = ?auto_744407 ?auto_744411 ) ) ( not ( = ?auto_744407 ?auto_744412 ) ) ( not ( = ?auto_744407 ?auto_744413 ) ) ( not ( = ?auto_744407 ?auto_744414 ) ) ( not ( = ?auto_744408 ?auto_744409 ) ) ( not ( = ?auto_744408 ?auto_744410 ) ) ( not ( = ?auto_744408 ?auto_744411 ) ) ( not ( = ?auto_744408 ?auto_744412 ) ) ( not ( = ?auto_744408 ?auto_744413 ) ) ( not ( = ?auto_744408 ?auto_744414 ) ) ( not ( = ?auto_744409 ?auto_744410 ) ) ( not ( = ?auto_744409 ?auto_744411 ) ) ( not ( = ?auto_744409 ?auto_744412 ) ) ( not ( = ?auto_744409 ?auto_744413 ) ) ( not ( = ?auto_744409 ?auto_744414 ) ) ( not ( = ?auto_744410 ?auto_744411 ) ) ( not ( = ?auto_744410 ?auto_744412 ) ) ( not ( = ?auto_744410 ?auto_744413 ) ) ( not ( = ?auto_744410 ?auto_744414 ) ) ( not ( = ?auto_744411 ?auto_744412 ) ) ( not ( = ?auto_744411 ?auto_744413 ) ) ( not ( = ?auto_744411 ?auto_744414 ) ) ( not ( = ?auto_744412 ?auto_744413 ) ) ( not ( = ?auto_744412 ?auto_744414 ) ) ( not ( = ?auto_744413 ?auto_744414 ) ) ( ON ?auto_744412 ?auto_744413 ) ( ON ?auto_744411 ?auto_744412 ) ( ON ?auto_744410 ?auto_744411 ) ( ON ?auto_744409 ?auto_744410 ) ( ON ?auto_744408 ?auto_744409 ) ( ON ?auto_744407 ?auto_744408 ) ( CLEAR ?auto_744405 ) ( ON ?auto_744406 ?auto_744407 ) ( CLEAR ?auto_744406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_744399 ?auto_744400 ?auto_744401 ?auto_744402 ?auto_744403 ?auto_744404 ?auto_744405 ?auto_744406 )
      ( MAKE-15PILE ?auto_744399 ?auto_744400 ?auto_744401 ?auto_744402 ?auto_744403 ?auto_744404 ?auto_744405 ?auto_744406 ?auto_744407 ?auto_744408 ?auto_744409 ?auto_744410 ?auto_744411 ?auto_744412 ?auto_744413 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744461 - BLOCK
      ?auto_744462 - BLOCK
      ?auto_744463 - BLOCK
      ?auto_744464 - BLOCK
      ?auto_744465 - BLOCK
      ?auto_744466 - BLOCK
      ?auto_744467 - BLOCK
      ?auto_744468 - BLOCK
      ?auto_744469 - BLOCK
      ?auto_744470 - BLOCK
      ?auto_744471 - BLOCK
      ?auto_744472 - BLOCK
      ?auto_744473 - BLOCK
      ?auto_744474 - BLOCK
      ?auto_744475 - BLOCK
    )
    :vars
    (
      ?auto_744476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744475 ?auto_744476 ) ( ON-TABLE ?auto_744461 ) ( ON ?auto_744462 ?auto_744461 ) ( ON ?auto_744463 ?auto_744462 ) ( ON ?auto_744464 ?auto_744463 ) ( ON ?auto_744465 ?auto_744464 ) ( ON ?auto_744466 ?auto_744465 ) ( not ( = ?auto_744461 ?auto_744462 ) ) ( not ( = ?auto_744461 ?auto_744463 ) ) ( not ( = ?auto_744461 ?auto_744464 ) ) ( not ( = ?auto_744461 ?auto_744465 ) ) ( not ( = ?auto_744461 ?auto_744466 ) ) ( not ( = ?auto_744461 ?auto_744467 ) ) ( not ( = ?auto_744461 ?auto_744468 ) ) ( not ( = ?auto_744461 ?auto_744469 ) ) ( not ( = ?auto_744461 ?auto_744470 ) ) ( not ( = ?auto_744461 ?auto_744471 ) ) ( not ( = ?auto_744461 ?auto_744472 ) ) ( not ( = ?auto_744461 ?auto_744473 ) ) ( not ( = ?auto_744461 ?auto_744474 ) ) ( not ( = ?auto_744461 ?auto_744475 ) ) ( not ( = ?auto_744461 ?auto_744476 ) ) ( not ( = ?auto_744462 ?auto_744463 ) ) ( not ( = ?auto_744462 ?auto_744464 ) ) ( not ( = ?auto_744462 ?auto_744465 ) ) ( not ( = ?auto_744462 ?auto_744466 ) ) ( not ( = ?auto_744462 ?auto_744467 ) ) ( not ( = ?auto_744462 ?auto_744468 ) ) ( not ( = ?auto_744462 ?auto_744469 ) ) ( not ( = ?auto_744462 ?auto_744470 ) ) ( not ( = ?auto_744462 ?auto_744471 ) ) ( not ( = ?auto_744462 ?auto_744472 ) ) ( not ( = ?auto_744462 ?auto_744473 ) ) ( not ( = ?auto_744462 ?auto_744474 ) ) ( not ( = ?auto_744462 ?auto_744475 ) ) ( not ( = ?auto_744462 ?auto_744476 ) ) ( not ( = ?auto_744463 ?auto_744464 ) ) ( not ( = ?auto_744463 ?auto_744465 ) ) ( not ( = ?auto_744463 ?auto_744466 ) ) ( not ( = ?auto_744463 ?auto_744467 ) ) ( not ( = ?auto_744463 ?auto_744468 ) ) ( not ( = ?auto_744463 ?auto_744469 ) ) ( not ( = ?auto_744463 ?auto_744470 ) ) ( not ( = ?auto_744463 ?auto_744471 ) ) ( not ( = ?auto_744463 ?auto_744472 ) ) ( not ( = ?auto_744463 ?auto_744473 ) ) ( not ( = ?auto_744463 ?auto_744474 ) ) ( not ( = ?auto_744463 ?auto_744475 ) ) ( not ( = ?auto_744463 ?auto_744476 ) ) ( not ( = ?auto_744464 ?auto_744465 ) ) ( not ( = ?auto_744464 ?auto_744466 ) ) ( not ( = ?auto_744464 ?auto_744467 ) ) ( not ( = ?auto_744464 ?auto_744468 ) ) ( not ( = ?auto_744464 ?auto_744469 ) ) ( not ( = ?auto_744464 ?auto_744470 ) ) ( not ( = ?auto_744464 ?auto_744471 ) ) ( not ( = ?auto_744464 ?auto_744472 ) ) ( not ( = ?auto_744464 ?auto_744473 ) ) ( not ( = ?auto_744464 ?auto_744474 ) ) ( not ( = ?auto_744464 ?auto_744475 ) ) ( not ( = ?auto_744464 ?auto_744476 ) ) ( not ( = ?auto_744465 ?auto_744466 ) ) ( not ( = ?auto_744465 ?auto_744467 ) ) ( not ( = ?auto_744465 ?auto_744468 ) ) ( not ( = ?auto_744465 ?auto_744469 ) ) ( not ( = ?auto_744465 ?auto_744470 ) ) ( not ( = ?auto_744465 ?auto_744471 ) ) ( not ( = ?auto_744465 ?auto_744472 ) ) ( not ( = ?auto_744465 ?auto_744473 ) ) ( not ( = ?auto_744465 ?auto_744474 ) ) ( not ( = ?auto_744465 ?auto_744475 ) ) ( not ( = ?auto_744465 ?auto_744476 ) ) ( not ( = ?auto_744466 ?auto_744467 ) ) ( not ( = ?auto_744466 ?auto_744468 ) ) ( not ( = ?auto_744466 ?auto_744469 ) ) ( not ( = ?auto_744466 ?auto_744470 ) ) ( not ( = ?auto_744466 ?auto_744471 ) ) ( not ( = ?auto_744466 ?auto_744472 ) ) ( not ( = ?auto_744466 ?auto_744473 ) ) ( not ( = ?auto_744466 ?auto_744474 ) ) ( not ( = ?auto_744466 ?auto_744475 ) ) ( not ( = ?auto_744466 ?auto_744476 ) ) ( not ( = ?auto_744467 ?auto_744468 ) ) ( not ( = ?auto_744467 ?auto_744469 ) ) ( not ( = ?auto_744467 ?auto_744470 ) ) ( not ( = ?auto_744467 ?auto_744471 ) ) ( not ( = ?auto_744467 ?auto_744472 ) ) ( not ( = ?auto_744467 ?auto_744473 ) ) ( not ( = ?auto_744467 ?auto_744474 ) ) ( not ( = ?auto_744467 ?auto_744475 ) ) ( not ( = ?auto_744467 ?auto_744476 ) ) ( not ( = ?auto_744468 ?auto_744469 ) ) ( not ( = ?auto_744468 ?auto_744470 ) ) ( not ( = ?auto_744468 ?auto_744471 ) ) ( not ( = ?auto_744468 ?auto_744472 ) ) ( not ( = ?auto_744468 ?auto_744473 ) ) ( not ( = ?auto_744468 ?auto_744474 ) ) ( not ( = ?auto_744468 ?auto_744475 ) ) ( not ( = ?auto_744468 ?auto_744476 ) ) ( not ( = ?auto_744469 ?auto_744470 ) ) ( not ( = ?auto_744469 ?auto_744471 ) ) ( not ( = ?auto_744469 ?auto_744472 ) ) ( not ( = ?auto_744469 ?auto_744473 ) ) ( not ( = ?auto_744469 ?auto_744474 ) ) ( not ( = ?auto_744469 ?auto_744475 ) ) ( not ( = ?auto_744469 ?auto_744476 ) ) ( not ( = ?auto_744470 ?auto_744471 ) ) ( not ( = ?auto_744470 ?auto_744472 ) ) ( not ( = ?auto_744470 ?auto_744473 ) ) ( not ( = ?auto_744470 ?auto_744474 ) ) ( not ( = ?auto_744470 ?auto_744475 ) ) ( not ( = ?auto_744470 ?auto_744476 ) ) ( not ( = ?auto_744471 ?auto_744472 ) ) ( not ( = ?auto_744471 ?auto_744473 ) ) ( not ( = ?auto_744471 ?auto_744474 ) ) ( not ( = ?auto_744471 ?auto_744475 ) ) ( not ( = ?auto_744471 ?auto_744476 ) ) ( not ( = ?auto_744472 ?auto_744473 ) ) ( not ( = ?auto_744472 ?auto_744474 ) ) ( not ( = ?auto_744472 ?auto_744475 ) ) ( not ( = ?auto_744472 ?auto_744476 ) ) ( not ( = ?auto_744473 ?auto_744474 ) ) ( not ( = ?auto_744473 ?auto_744475 ) ) ( not ( = ?auto_744473 ?auto_744476 ) ) ( not ( = ?auto_744474 ?auto_744475 ) ) ( not ( = ?auto_744474 ?auto_744476 ) ) ( not ( = ?auto_744475 ?auto_744476 ) ) ( ON ?auto_744474 ?auto_744475 ) ( ON ?auto_744473 ?auto_744474 ) ( ON ?auto_744472 ?auto_744473 ) ( ON ?auto_744471 ?auto_744472 ) ( ON ?auto_744470 ?auto_744471 ) ( ON ?auto_744469 ?auto_744470 ) ( ON ?auto_744468 ?auto_744469 ) ( CLEAR ?auto_744466 ) ( ON ?auto_744467 ?auto_744468 ) ( CLEAR ?auto_744467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_744461 ?auto_744462 ?auto_744463 ?auto_744464 ?auto_744465 ?auto_744466 ?auto_744467 )
      ( MAKE-15PILE ?auto_744461 ?auto_744462 ?auto_744463 ?auto_744464 ?auto_744465 ?auto_744466 ?auto_744467 ?auto_744468 ?auto_744469 ?auto_744470 ?auto_744471 ?auto_744472 ?auto_744473 ?auto_744474 ?auto_744475 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744523 - BLOCK
      ?auto_744524 - BLOCK
      ?auto_744525 - BLOCK
      ?auto_744526 - BLOCK
      ?auto_744527 - BLOCK
      ?auto_744528 - BLOCK
      ?auto_744529 - BLOCK
      ?auto_744530 - BLOCK
      ?auto_744531 - BLOCK
      ?auto_744532 - BLOCK
      ?auto_744533 - BLOCK
      ?auto_744534 - BLOCK
      ?auto_744535 - BLOCK
      ?auto_744536 - BLOCK
      ?auto_744537 - BLOCK
    )
    :vars
    (
      ?auto_744538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744537 ?auto_744538 ) ( ON-TABLE ?auto_744523 ) ( ON ?auto_744524 ?auto_744523 ) ( ON ?auto_744525 ?auto_744524 ) ( ON ?auto_744526 ?auto_744525 ) ( ON ?auto_744527 ?auto_744526 ) ( not ( = ?auto_744523 ?auto_744524 ) ) ( not ( = ?auto_744523 ?auto_744525 ) ) ( not ( = ?auto_744523 ?auto_744526 ) ) ( not ( = ?auto_744523 ?auto_744527 ) ) ( not ( = ?auto_744523 ?auto_744528 ) ) ( not ( = ?auto_744523 ?auto_744529 ) ) ( not ( = ?auto_744523 ?auto_744530 ) ) ( not ( = ?auto_744523 ?auto_744531 ) ) ( not ( = ?auto_744523 ?auto_744532 ) ) ( not ( = ?auto_744523 ?auto_744533 ) ) ( not ( = ?auto_744523 ?auto_744534 ) ) ( not ( = ?auto_744523 ?auto_744535 ) ) ( not ( = ?auto_744523 ?auto_744536 ) ) ( not ( = ?auto_744523 ?auto_744537 ) ) ( not ( = ?auto_744523 ?auto_744538 ) ) ( not ( = ?auto_744524 ?auto_744525 ) ) ( not ( = ?auto_744524 ?auto_744526 ) ) ( not ( = ?auto_744524 ?auto_744527 ) ) ( not ( = ?auto_744524 ?auto_744528 ) ) ( not ( = ?auto_744524 ?auto_744529 ) ) ( not ( = ?auto_744524 ?auto_744530 ) ) ( not ( = ?auto_744524 ?auto_744531 ) ) ( not ( = ?auto_744524 ?auto_744532 ) ) ( not ( = ?auto_744524 ?auto_744533 ) ) ( not ( = ?auto_744524 ?auto_744534 ) ) ( not ( = ?auto_744524 ?auto_744535 ) ) ( not ( = ?auto_744524 ?auto_744536 ) ) ( not ( = ?auto_744524 ?auto_744537 ) ) ( not ( = ?auto_744524 ?auto_744538 ) ) ( not ( = ?auto_744525 ?auto_744526 ) ) ( not ( = ?auto_744525 ?auto_744527 ) ) ( not ( = ?auto_744525 ?auto_744528 ) ) ( not ( = ?auto_744525 ?auto_744529 ) ) ( not ( = ?auto_744525 ?auto_744530 ) ) ( not ( = ?auto_744525 ?auto_744531 ) ) ( not ( = ?auto_744525 ?auto_744532 ) ) ( not ( = ?auto_744525 ?auto_744533 ) ) ( not ( = ?auto_744525 ?auto_744534 ) ) ( not ( = ?auto_744525 ?auto_744535 ) ) ( not ( = ?auto_744525 ?auto_744536 ) ) ( not ( = ?auto_744525 ?auto_744537 ) ) ( not ( = ?auto_744525 ?auto_744538 ) ) ( not ( = ?auto_744526 ?auto_744527 ) ) ( not ( = ?auto_744526 ?auto_744528 ) ) ( not ( = ?auto_744526 ?auto_744529 ) ) ( not ( = ?auto_744526 ?auto_744530 ) ) ( not ( = ?auto_744526 ?auto_744531 ) ) ( not ( = ?auto_744526 ?auto_744532 ) ) ( not ( = ?auto_744526 ?auto_744533 ) ) ( not ( = ?auto_744526 ?auto_744534 ) ) ( not ( = ?auto_744526 ?auto_744535 ) ) ( not ( = ?auto_744526 ?auto_744536 ) ) ( not ( = ?auto_744526 ?auto_744537 ) ) ( not ( = ?auto_744526 ?auto_744538 ) ) ( not ( = ?auto_744527 ?auto_744528 ) ) ( not ( = ?auto_744527 ?auto_744529 ) ) ( not ( = ?auto_744527 ?auto_744530 ) ) ( not ( = ?auto_744527 ?auto_744531 ) ) ( not ( = ?auto_744527 ?auto_744532 ) ) ( not ( = ?auto_744527 ?auto_744533 ) ) ( not ( = ?auto_744527 ?auto_744534 ) ) ( not ( = ?auto_744527 ?auto_744535 ) ) ( not ( = ?auto_744527 ?auto_744536 ) ) ( not ( = ?auto_744527 ?auto_744537 ) ) ( not ( = ?auto_744527 ?auto_744538 ) ) ( not ( = ?auto_744528 ?auto_744529 ) ) ( not ( = ?auto_744528 ?auto_744530 ) ) ( not ( = ?auto_744528 ?auto_744531 ) ) ( not ( = ?auto_744528 ?auto_744532 ) ) ( not ( = ?auto_744528 ?auto_744533 ) ) ( not ( = ?auto_744528 ?auto_744534 ) ) ( not ( = ?auto_744528 ?auto_744535 ) ) ( not ( = ?auto_744528 ?auto_744536 ) ) ( not ( = ?auto_744528 ?auto_744537 ) ) ( not ( = ?auto_744528 ?auto_744538 ) ) ( not ( = ?auto_744529 ?auto_744530 ) ) ( not ( = ?auto_744529 ?auto_744531 ) ) ( not ( = ?auto_744529 ?auto_744532 ) ) ( not ( = ?auto_744529 ?auto_744533 ) ) ( not ( = ?auto_744529 ?auto_744534 ) ) ( not ( = ?auto_744529 ?auto_744535 ) ) ( not ( = ?auto_744529 ?auto_744536 ) ) ( not ( = ?auto_744529 ?auto_744537 ) ) ( not ( = ?auto_744529 ?auto_744538 ) ) ( not ( = ?auto_744530 ?auto_744531 ) ) ( not ( = ?auto_744530 ?auto_744532 ) ) ( not ( = ?auto_744530 ?auto_744533 ) ) ( not ( = ?auto_744530 ?auto_744534 ) ) ( not ( = ?auto_744530 ?auto_744535 ) ) ( not ( = ?auto_744530 ?auto_744536 ) ) ( not ( = ?auto_744530 ?auto_744537 ) ) ( not ( = ?auto_744530 ?auto_744538 ) ) ( not ( = ?auto_744531 ?auto_744532 ) ) ( not ( = ?auto_744531 ?auto_744533 ) ) ( not ( = ?auto_744531 ?auto_744534 ) ) ( not ( = ?auto_744531 ?auto_744535 ) ) ( not ( = ?auto_744531 ?auto_744536 ) ) ( not ( = ?auto_744531 ?auto_744537 ) ) ( not ( = ?auto_744531 ?auto_744538 ) ) ( not ( = ?auto_744532 ?auto_744533 ) ) ( not ( = ?auto_744532 ?auto_744534 ) ) ( not ( = ?auto_744532 ?auto_744535 ) ) ( not ( = ?auto_744532 ?auto_744536 ) ) ( not ( = ?auto_744532 ?auto_744537 ) ) ( not ( = ?auto_744532 ?auto_744538 ) ) ( not ( = ?auto_744533 ?auto_744534 ) ) ( not ( = ?auto_744533 ?auto_744535 ) ) ( not ( = ?auto_744533 ?auto_744536 ) ) ( not ( = ?auto_744533 ?auto_744537 ) ) ( not ( = ?auto_744533 ?auto_744538 ) ) ( not ( = ?auto_744534 ?auto_744535 ) ) ( not ( = ?auto_744534 ?auto_744536 ) ) ( not ( = ?auto_744534 ?auto_744537 ) ) ( not ( = ?auto_744534 ?auto_744538 ) ) ( not ( = ?auto_744535 ?auto_744536 ) ) ( not ( = ?auto_744535 ?auto_744537 ) ) ( not ( = ?auto_744535 ?auto_744538 ) ) ( not ( = ?auto_744536 ?auto_744537 ) ) ( not ( = ?auto_744536 ?auto_744538 ) ) ( not ( = ?auto_744537 ?auto_744538 ) ) ( ON ?auto_744536 ?auto_744537 ) ( ON ?auto_744535 ?auto_744536 ) ( ON ?auto_744534 ?auto_744535 ) ( ON ?auto_744533 ?auto_744534 ) ( ON ?auto_744532 ?auto_744533 ) ( ON ?auto_744531 ?auto_744532 ) ( ON ?auto_744530 ?auto_744531 ) ( ON ?auto_744529 ?auto_744530 ) ( CLEAR ?auto_744527 ) ( ON ?auto_744528 ?auto_744529 ) ( CLEAR ?auto_744528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_744523 ?auto_744524 ?auto_744525 ?auto_744526 ?auto_744527 ?auto_744528 )
      ( MAKE-15PILE ?auto_744523 ?auto_744524 ?auto_744525 ?auto_744526 ?auto_744527 ?auto_744528 ?auto_744529 ?auto_744530 ?auto_744531 ?auto_744532 ?auto_744533 ?auto_744534 ?auto_744535 ?auto_744536 ?auto_744537 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744585 - BLOCK
      ?auto_744586 - BLOCK
      ?auto_744587 - BLOCK
      ?auto_744588 - BLOCK
      ?auto_744589 - BLOCK
      ?auto_744590 - BLOCK
      ?auto_744591 - BLOCK
      ?auto_744592 - BLOCK
      ?auto_744593 - BLOCK
      ?auto_744594 - BLOCK
      ?auto_744595 - BLOCK
      ?auto_744596 - BLOCK
      ?auto_744597 - BLOCK
      ?auto_744598 - BLOCK
      ?auto_744599 - BLOCK
    )
    :vars
    (
      ?auto_744600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744599 ?auto_744600 ) ( ON-TABLE ?auto_744585 ) ( ON ?auto_744586 ?auto_744585 ) ( ON ?auto_744587 ?auto_744586 ) ( ON ?auto_744588 ?auto_744587 ) ( not ( = ?auto_744585 ?auto_744586 ) ) ( not ( = ?auto_744585 ?auto_744587 ) ) ( not ( = ?auto_744585 ?auto_744588 ) ) ( not ( = ?auto_744585 ?auto_744589 ) ) ( not ( = ?auto_744585 ?auto_744590 ) ) ( not ( = ?auto_744585 ?auto_744591 ) ) ( not ( = ?auto_744585 ?auto_744592 ) ) ( not ( = ?auto_744585 ?auto_744593 ) ) ( not ( = ?auto_744585 ?auto_744594 ) ) ( not ( = ?auto_744585 ?auto_744595 ) ) ( not ( = ?auto_744585 ?auto_744596 ) ) ( not ( = ?auto_744585 ?auto_744597 ) ) ( not ( = ?auto_744585 ?auto_744598 ) ) ( not ( = ?auto_744585 ?auto_744599 ) ) ( not ( = ?auto_744585 ?auto_744600 ) ) ( not ( = ?auto_744586 ?auto_744587 ) ) ( not ( = ?auto_744586 ?auto_744588 ) ) ( not ( = ?auto_744586 ?auto_744589 ) ) ( not ( = ?auto_744586 ?auto_744590 ) ) ( not ( = ?auto_744586 ?auto_744591 ) ) ( not ( = ?auto_744586 ?auto_744592 ) ) ( not ( = ?auto_744586 ?auto_744593 ) ) ( not ( = ?auto_744586 ?auto_744594 ) ) ( not ( = ?auto_744586 ?auto_744595 ) ) ( not ( = ?auto_744586 ?auto_744596 ) ) ( not ( = ?auto_744586 ?auto_744597 ) ) ( not ( = ?auto_744586 ?auto_744598 ) ) ( not ( = ?auto_744586 ?auto_744599 ) ) ( not ( = ?auto_744586 ?auto_744600 ) ) ( not ( = ?auto_744587 ?auto_744588 ) ) ( not ( = ?auto_744587 ?auto_744589 ) ) ( not ( = ?auto_744587 ?auto_744590 ) ) ( not ( = ?auto_744587 ?auto_744591 ) ) ( not ( = ?auto_744587 ?auto_744592 ) ) ( not ( = ?auto_744587 ?auto_744593 ) ) ( not ( = ?auto_744587 ?auto_744594 ) ) ( not ( = ?auto_744587 ?auto_744595 ) ) ( not ( = ?auto_744587 ?auto_744596 ) ) ( not ( = ?auto_744587 ?auto_744597 ) ) ( not ( = ?auto_744587 ?auto_744598 ) ) ( not ( = ?auto_744587 ?auto_744599 ) ) ( not ( = ?auto_744587 ?auto_744600 ) ) ( not ( = ?auto_744588 ?auto_744589 ) ) ( not ( = ?auto_744588 ?auto_744590 ) ) ( not ( = ?auto_744588 ?auto_744591 ) ) ( not ( = ?auto_744588 ?auto_744592 ) ) ( not ( = ?auto_744588 ?auto_744593 ) ) ( not ( = ?auto_744588 ?auto_744594 ) ) ( not ( = ?auto_744588 ?auto_744595 ) ) ( not ( = ?auto_744588 ?auto_744596 ) ) ( not ( = ?auto_744588 ?auto_744597 ) ) ( not ( = ?auto_744588 ?auto_744598 ) ) ( not ( = ?auto_744588 ?auto_744599 ) ) ( not ( = ?auto_744588 ?auto_744600 ) ) ( not ( = ?auto_744589 ?auto_744590 ) ) ( not ( = ?auto_744589 ?auto_744591 ) ) ( not ( = ?auto_744589 ?auto_744592 ) ) ( not ( = ?auto_744589 ?auto_744593 ) ) ( not ( = ?auto_744589 ?auto_744594 ) ) ( not ( = ?auto_744589 ?auto_744595 ) ) ( not ( = ?auto_744589 ?auto_744596 ) ) ( not ( = ?auto_744589 ?auto_744597 ) ) ( not ( = ?auto_744589 ?auto_744598 ) ) ( not ( = ?auto_744589 ?auto_744599 ) ) ( not ( = ?auto_744589 ?auto_744600 ) ) ( not ( = ?auto_744590 ?auto_744591 ) ) ( not ( = ?auto_744590 ?auto_744592 ) ) ( not ( = ?auto_744590 ?auto_744593 ) ) ( not ( = ?auto_744590 ?auto_744594 ) ) ( not ( = ?auto_744590 ?auto_744595 ) ) ( not ( = ?auto_744590 ?auto_744596 ) ) ( not ( = ?auto_744590 ?auto_744597 ) ) ( not ( = ?auto_744590 ?auto_744598 ) ) ( not ( = ?auto_744590 ?auto_744599 ) ) ( not ( = ?auto_744590 ?auto_744600 ) ) ( not ( = ?auto_744591 ?auto_744592 ) ) ( not ( = ?auto_744591 ?auto_744593 ) ) ( not ( = ?auto_744591 ?auto_744594 ) ) ( not ( = ?auto_744591 ?auto_744595 ) ) ( not ( = ?auto_744591 ?auto_744596 ) ) ( not ( = ?auto_744591 ?auto_744597 ) ) ( not ( = ?auto_744591 ?auto_744598 ) ) ( not ( = ?auto_744591 ?auto_744599 ) ) ( not ( = ?auto_744591 ?auto_744600 ) ) ( not ( = ?auto_744592 ?auto_744593 ) ) ( not ( = ?auto_744592 ?auto_744594 ) ) ( not ( = ?auto_744592 ?auto_744595 ) ) ( not ( = ?auto_744592 ?auto_744596 ) ) ( not ( = ?auto_744592 ?auto_744597 ) ) ( not ( = ?auto_744592 ?auto_744598 ) ) ( not ( = ?auto_744592 ?auto_744599 ) ) ( not ( = ?auto_744592 ?auto_744600 ) ) ( not ( = ?auto_744593 ?auto_744594 ) ) ( not ( = ?auto_744593 ?auto_744595 ) ) ( not ( = ?auto_744593 ?auto_744596 ) ) ( not ( = ?auto_744593 ?auto_744597 ) ) ( not ( = ?auto_744593 ?auto_744598 ) ) ( not ( = ?auto_744593 ?auto_744599 ) ) ( not ( = ?auto_744593 ?auto_744600 ) ) ( not ( = ?auto_744594 ?auto_744595 ) ) ( not ( = ?auto_744594 ?auto_744596 ) ) ( not ( = ?auto_744594 ?auto_744597 ) ) ( not ( = ?auto_744594 ?auto_744598 ) ) ( not ( = ?auto_744594 ?auto_744599 ) ) ( not ( = ?auto_744594 ?auto_744600 ) ) ( not ( = ?auto_744595 ?auto_744596 ) ) ( not ( = ?auto_744595 ?auto_744597 ) ) ( not ( = ?auto_744595 ?auto_744598 ) ) ( not ( = ?auto_744595 ?auto_744599 ) ) ( not ( = ?auto_744595 ?auto_744600 ) ) ( not ( = ?auto_744596 ?auto_744597 ) ) ( not ( = ?auto_744596 ?auto_744598 ) ) ( not ( = ?auto_744596 ?auto_744599 ) ) ( not ( = ?auto_744596 ?auto_744600 ) ) ( not ( = ?auto_744597 ?auto_744598 ) ) ( not ( = ?auto_744597 ?auto_744599 ) ) ( not ( = ?auto_744597 ?auto_744600 ) ) ( not ( = ?auto_744598 ?auto_744599 ) ) ( not ( = ?auto_744598 ?auto_744600 ) ) ( not ( = ?auto_744599 ?auto_744600 ) ) ( ON ?auto_744598 ?auto_744599 ) ( ON ?auto_744597 ?auto_744598 ) ( ON ?auto_744596 ?auto_744597 ) ( ON ?auto_744595 ?auto_744596 ) ( ON ?auto_744594 ?auto_744595 ) ( ON ?auto_744593 ?auto_744594 ) ( ON ?auto_744592 ?auto_744593 ) ( ON ?auto_744591 ?auto_744592 ) ( ON ?auto_744590 ?auto_744591 ) ( CLEAR ?auto_744588 ) ( ON ?auto_744589 ?auto_744590 ) ( CLEAR ?auto_744589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_744585 ?auto_744586 ?auto_744587 ?auto_744588 ?auto_744589 )
      ( MAKE-15PILE ?auto_744585 ?auto_744586 ?auto_744587 ?auto_744588 ?auto_744589 ?auto_744590 ?auto_744591 ?auto_744592 ?auto_744593 ?auto_744594 ?auto_744595 ?auto_744596 ?auto_744597 ?auto_744598 ?auto_744599 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744647 - BLOCK
      ?auto_744648 - BLOCK
      ?auto_744649 - BLOCK
      ?auto_744650 - BLOCK
      ?auto_744651 - BLOCK
      ?auto_744652 - BLOCK
      ?auto_744653 - BLOCK
      ?auto_744654 - BLOCK
      ?auto_744655 - BLOCK
      ?auto_744656 - BLOCK
      ?auto_744657 - BLOCK
      ?auto_744658 - BLOCK
      ?auto_744659 - BLOCK
      ?auto_744660 - BLOCK
      ?auto_744661 - BLOCK
    )
    :vars
    (
      ?auto_744662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744661 ?auto_744662 ) ( ON-TABLE ?auto_744647 ) ( ON ?auto_744648 ?auto_744647 ) ( ON ?auto_744649 ?auto_744648 ) ( not ( = ?auto_744647 ?auto_744648 ) ) ( not ( = ?auto_744647 ?auto_744649 ) ) ( not ( = ?auto_744647 ?auto_744650 ) ) ( not ( = ?auto_744647 ?auto_744651 ) ) ( not ( = ?auto_744647 ?auto_744652 ) ) ( not ( = ?auto_744647 ?auto_744653 ) ) ( not ( = ?auto_744647 ?auto_744654 ) ) ( not ( = ?auto_744647 ?auto_744655 ) ) ( not ( = ?auto_744647 ?auto_744656 ) ) ( not ( = ?auto_744647 ?auto_744657 ) ) ( not ( = ?auto_744647 ?auto_744658 ) ) ( not ( = ?auto_744647 ?auto_744659 ) ) ( not ( = ?auto_744647 ?auto_744660 ) ) ( not ( = ?auto_744647 ?auto_744661 ) ) ( not ( = ?auto_744647 ?auto_744662 ) ) ( not ( = ?auto_744648 ?auto_744649 ) ) ( not ( = ?auto_744648 ?auto_744650 ) ) ( not ( = ?auto_744648 ?auto_744651 ) ) ( not ( = ?auto_744648 ?auto_744652 ) ) ( not ( = ?auto_744648 ?auto_744653 ) ) ( not ( = ?auto_744648 ?auto_744654 ) ) ( not ( = ?auto_744648 ?auto_744655 ) ) ( not ( = ?auto_744648 ?auto_744656 ) ) ( not ( = ?auto_744648 ?auto_744657 ) ) ( not ( = ?auto_744648 ?auto_744658 ) ) ( not ( = ?auto_744648 ?auto_744659 ) ) ( not ( = ?auto_744648 ?auto_744660 ) ) ( not ( = ?auto_744648 ?auto_744661 ) ) ( not ( = ?auto_744648 ?auto_744662 ) ) ( not ( = ?auto_744649 ?auto_744650 ) ) ( not ( = ?auto_744649 ?auto_744651 ) ) ( not ( = ?auto_744649 ?auto_744652 ) ) ( not ( = ?auto_744649 ?auto_744653 ) ) ( not ( = ?auto_744649 ?auto_744654 ) ) ( not ( = ?auto_744649 ?auto_744655 ) ) ( not ( = ?auto_744649 ?auto_744656 ) ) ( not ( = ?auto_744649 ?auto_744657 ) ) ( not ( = ?auto_744649 ?auto_744658 ) ) ( not ( = ?auto_744649 ?auto_744659 ) ) ( not ( = ?auto_744649 ?auto_744660 ) ) ( not ( = ?auto_744649 ?auto_744661 ) ) ( not ( = ?auto_744649 ?auto_744662 ) ) ( not ( = ?auto_744650 ?auto_744651 ) ) ( not ( = ?auto_744650 ?auto_744652 ) ) ( not ( = ?auto_744650 ?auto_744653 ) ) ( not ( = ?auto_744650 ?auto_744654 ) ) ( not ( = ?auto_744650 ?auto_744655 ) ) ( not ( = ?auto_744650 ?auto_744656 ) ) ( not ( = ?auto_744650 ?auto_744657 ) ) ( not ( = ?auto_744650 ?auto_744658 ) ) ( not ( = ?auto_744650 ?auto_744659 ) ) ( not ( = ?auto_744650 ?auto_744660 ) ) ( not ( = ?auto_744650 ?auto_744661 ) ) ( not ( = ?auto_744650 ?auto_744662 ) ) ( not ( = ?auto_744651 ?auto_744652 ) ) ( not ( = ?auto_744651 ?auto_744653 ) ) ( not ( = ?auto_744651 ?auto_744654 ) ) ( not ( = ?auto_744651 ?auto_744655 ) ) ( not ( = ?auto_744651 ?auto_744656 ) ) ( not ( = ?auto_744651 ?auto_744657 ) ) ( not ( = ?auto_744651 ?auto_744658 ) ) ( not ( = ?auto_744651 ?auto_744659 ) ) ( not ( = ?auto_744651 ?auto_744660 ) ) ( not ( = ?auto_744651 ?auto_744661 ) ) ( not ( = ?auto_744651 ?auto_744662 ) ) ( not ( = ?auto_744652 ?auto_744653 ) ) ( not ( = ?auto_744652 ?auto_744654 ) ) ( not ( = ?auto_744652 ?auto_744655 ) ) ( not ( = ?auto_744652 ?auto_744656 ) ) ( not ( = ?auto_744652 ?auto_744657 ) ) ( not ( = ?auto_744652 ?auto_744658 ) ) ( not ( = ?auto_744652 ?auto_744659 ) ) ( not ( = ?auto_744652 ?auto_744660 ) ) ( not ( = ?auto_744652 ?auto_744661 ) ) ( not ( = ?auto_744652 ?auto_744662 ) ) ( not ( = ?auto_744653 ?auto_744654 ) ) ( not ( = ?auto_744653 ?auto_744655 ) ) ( not ( = ?auto_744653 ?auto_744656 ) ) ( not ( = ?auto_744653 ?auto_744657 ) ) ( not ( = ?auto_744653 ?auto_744658 ) ) ( not ( = ?auto_744653 ?auto_744659 ) ) ( not ( = ?auto_744653 ?auto_744660 ) ) ( not ( = ?auto_744653 ?auto_744661 ) ) ( not ( = ?auto_744653 ?auto_744662 ) ) ( not ( = ?auto_744654 ?auto_744655 ) ) ( not ( = ?auto_744654 ?auto_744656 ) ) ( not ( = ?auto_744654 ?auto_744657 ) ) ( not ( = ?auto_744654 ?auto_744658 ) ) ( not ( = ?auto_744654 ?auto_744659 ) ) ( not ( = ?auto_744654 ?auto_744660 ) ) ( not ( = ?auto_744654 ?auto_744661 ) ) ( not ( = ?auto_744654 ?auto_744662 ) ) ( not ( = ?auto_744655 ?auto_744656 ) ) ( not ( = ?auto_744655 ?auto_744657 ) ) ( not ( = ?auto_744655 ?auto_744658 ) ) ( not ( = ?auto_744655 ?auto_744659 ) ) ( not ( = ?auto_744655 ?auto_744660 ) ) ( not ( = ?auto_744655 ?auto_744661 ) ) ( not ( = ?auto_744655 ?auto_744662 ) ) ( not ( = ?auto_744656 ?auto_744657 ) ) ( not ( = ?auto_744656 ?auto_744658 ) ) ( not ( = ?auto_744656 ?auto_744659 ) ) ( not ( = ?auto_744656 ?auto_744660 ) ) ( not ( = ?auto_744656 ?auto_744661 ) ) ( not ( = ?auto_744656 ?auto_744662 ) ) ( not ( = ?auto_744657 ?auto_744658 ) ) ( not ( = ?auto_744657 ?auto_744659 ) ) ( not ( = ?auto_744657 ?auto_744660 ) ) ( not ( = ?auto_744657 ?auto_744661 ) ) ( not ( = ?auto_744657 ?auto_744662 ) ) ( not ( = ?auto_744658 ?auto_744659 ) ) ( not ( = ?auto_744658 ?auto_744660 ) ) ( not ( = ?auto_744658 ?auto_744661 ) ) ( not ( = ?auto_744658 ?auto_744662 ) ) ( not ( = ?auto_744659 ?auto_744660 ) ) ( not ( = ?auto_744659 ?auto_744661 ) ) ( not ( = ?auto_744659 ?auto_744662 ) ) ( not ( = ?auto_744660 ?auto_744661 ) ) ( not ( = ?auto_744660 ?auto_744662 ) ) ( not ( = ?auto_744661 ?auto_744662 ) ) ( ON ?auto_744660 ?auto_744661 ) ( ON ?auto_744659 ?auto_744660 ) ( ON ?auto_744658 ?auto_744659 ) ( ON ?auto_744657 ?auto_744658 ) ( ON ?auto_744656 ?auto_744657 ) ( ON ?auto_744655 ?auto_744656 ) ( ON ?auto_744654 ?auto_744655 ) ( ON ?auto_744653 ?auto_744654 ) ( ON ?auto_744652 ?auto_744653 ) ( ON ?auto_744651 ?auto_744652 ) ( CLEAR ?auto_744649 ) ( ON ?auto_744650 ?auto_744651 ) ( CLEAR ?auto_744650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_744647 ?auto_744648 ?auto_744649 ?auto_744650 )
      ( MAKE-15PILE ?auto_744647 ?auto_744648 ?auto_744649 ?auto_744650 ?auto_744651 ?auto_744652 ?auto_744653 ?auto_744654 ?auto_744655 ?auto_744656 ?auto_744657 ?auto_744658 ?auto_744659 ?auto_744660 ?auto_744661 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744709 - BLOCK
      ?auto_744710 - BLOCK
      ?auto_744711 - BLOCK
      ?auto_744712 - BLOCK
      ?auto_744713 - BLOCK
      ?auto_744714 - BLOCK
      ?auto_744715 - BLOCK
      ?auto_744716 - BLOCK
      ?auto_744717 - BLOCK
      ?auto_744718 - BLOCK
      ?auto_744719 - BLOCK
      ?auto_744720 - BLOCK
      ?auto_744721 - BLOCK
      ?auto_744722 - BLOCK
      ?auto_744723 - BLOCK
    )
    :vars
    (
      ?auto_744724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744723 ?auto_744724 ) ( ON-TABLE ?auto_744709 ) ( ON ?auto_744710 ?auto_744709 ) ( not ( = ?auto_744709 ?auto_744710 ) ) ( not ( = ?auto_744709 ?auto_744711 ) ) ( not ( = ?auto_744709 ?auto_744712 ) ) ( not ( = ?auto_744709 ?auto_744713 ) ) ( not ( = ?auto_744709 ?auto_744714 ) ) ( not ( = ?auto_744709 ?auto_744715 ) ) ( not ( = ?auto_744709 ?auto_744716 ) ) ( not ( = ?auto_744709 ?auto_744717 ) ) ( not ( = ?auto_744709 ?auto_744718 ) ) ( not ( = ?auto_744709 ?auto_744719 ) ) ( not ( = ?auto_744709 ?auto_744720 ) ) ( not ( = ?auto_744709 ?auto_744721 ) ) ( not ( = ?auto_744709 ?auto_744722 ) ) ( not ( = ?auto_744709 ?auto_744723 ) ) ( not ( = ?auto_744709 ?auto_744724 ) ) ( not ( = ?auto_744710 ?auto_744711 ) ) ( not ( = ?auto_744710 ?auto_744712 ) ) ( not ( = ?auto_744710 ?auto_744713 ) ) ( not ( = ?auto_744710 ?auto_744714 ) ) ( not ( = ?auto_744710 ?auto_744715 ) ) ( not ( = ?auto_744710 ?auto_744716 ) ) ( not ( = ?auto_744710 ?auto_744717 ) ) ( not ( = ?auto_744710 ?auto_744718 ) ) ( not ( = ?auto_744710 ?auto_744719 ) ) ( not ( = ?auto_744710 ?auto_744720 ) ) ( not ( = ?auto_744710 ?auto_744721 ) ) ( not ( = ?auto_744710 ?auto_744722 ) ) ( not ( = ?auto_744710 ?auto_744723 ) ) ( not ( = ?auto_744710 ?auto_744724 ) ) ( not ( = ?auto_744711 ?auto_744712 ) ) ( not ( = ?auto_744711 ?auto_744713 ) ) ( not ( = ?auto_744711 ?auto_744714 ) ) ( not ( = ?auto_744711 ?auto_744715 ) ) ( not ( = ?auto_744711 ?auto_744716 ) ) ( not ( = ?auto_744711 ?auto_744717 ) ) ( not ( = ?auto_744711 ?auto_744718 ) ) ( not ( = ?auto_744711 ?auto_744719 ) ) ( not ( = ?auto_744711 ?auto_744720 ) ) ( not ( = ?auto_744711 ?auto_744721 ) ) ( not ( = ?auto_744711 ?auto_744722 ) ) ( not ( = ?auto_744711 ?auto_744723 ) ) ( not ( = ?auto_744711 ?auto_744724 ) ) ( not ( = ?auto_744712 ?auto_744713 ) ) ( not ( = ?auto_744712 ?auto_744714 ) ) ( not ( = ?auto_744712 ?auto_744715 ) ) ( not ( = ?auto_744712 ?auto_744716 ) ) ( not ( = ?auto_744712 ?auto_744717 ) ) ( not ( = ?auto_744712 ?auto_744718 ) ) ( not ( = ?auto_744712 ?auto_744719 ) ) ( not ( = ?auto_744712 ?auto_744720 ) ) ( not ( = ?auto_744712 ?auto_744721 ) ) ( not ( = ?auto_744712 ?auto_744722 ) ) ( not ( = ?auto_744712 ?auto_744723 ) ) ( not ( = ?auto_744712 ?auto_744724 ) ) ( not ( = ?auto_744713 ?auto_744714 ) ) ( not ( = ?auto_744713 ?auto_744715 ) ) ( not ( = ?auto_744713 ?auto_744716 ) ) ( not ( = ?auto_744713 ?auto_744717 ) ) ( not ( = ?auto_744713 ?auto_744718 ) ) ( not ( = ?auto_744713 ?auto_744719 ) ) ( not ( = ?auto_744713 ?auto_744720 ) ) ( not ( = ?auto_744713 ?auto_744721 ) ) ( not ( = ?auto_744713 ?auto_744722 ) ) ( not ( = ?auto_744713 ?auto_744723 ) ) ( not ( = ?auto_744713 ?auto_744724 ) ) ( not ( = ?auto_744714 ?auto_744715 ) ) ( not ( = ?auto_744714 ?auto_744716 ) ) ( not ( = ?auto_744714 ?auto_744717 ) ) ( not ( = ?auto_744714 ?auto_744718 ) ) ( not ( = ?auto_744714 ?auto_744719 ) ) ( not ( = ?auto_744714 ?auto_744720 ) ) ( not ( = ?auto_744714 ?auto_744721 ) ) ( not ( = ?auto_744714 ?auto_744722 ) ) ( not ( = ?auto_744714 ?auto_744723 ) ) ( not ( = ?auto_744714 ?auto_744724 ) ) ( not ( = ?auto_744715 ?auto_744716 ) ) ( not ( = ?auto_744715 ?auto_744717 ) ) ( not ( = ?auto_744715 ?auto_744718 ) ) ( not ( = ?auto_744715 ?auto_744719 ) ) ( not ( = ?auto_744715 ?auto_744720 ) ) ( not ( = ?auto_744715 ?auto_744721 ) ) ( not ( = ?auto_744715 ?auto_744722 ) ) ( not ( = ?auto_744715 ?auto_744723 ) ) ( not ( = ?auto_744715 ?auto_744724 ) ) ( not ( = ?auto_744716 ?auto_744717 ) ) ( not ( = ?auto_744716 ?auto_744718 ) ) ( not ( = ?auto_744716 ?auto_744719 ) ) ( not ( = ?auto_744716 ?auto_744720 ) ) ( not ( = ?auto_744716 ?auto_744721 ) ) ( not ( = ?auto_744716 ?auto_744722 ) ) ( not ( = ?auto_744716 ?auto_744723 ) ) ( not ( = ?auto_744716 ?auto_744724 ) ) ( not ( = ?auto_744717 ?auto_744718 ) ) ( not ( = ?auto_744717 ?auto_744719 ) ) ( not ( = ?auto_744717 ?auto_744720 ) ) ( not ( = ?auto_744717 ?auto_744721 ) ) ( not ( = ?auto_744717 ?auto_744722 ) ) ( not ( = ?auto_744717 ?auto_744723 ) ) ( not ( = ?auto_744717 ?auto_744724 ) ) ( not ( = ?auto_744718 ?auto_744719 ) ) ( not ( = ?auto_744718 ?auto_744720 ) ) ( not ( = ?auto_744718 ?auto_744721 ) ) ( not ( = ?auto_744718 ?auto_744722 ) ) ( not ( = ?auto_744718 ?auto_744723 ) ) ( not ( = ?auto_744718 ?auto_744724 ) ) ( not ( = ?auto_744719 ?auto_744720 ) ) ( not ( = ?auto_744719 ?auto_744721 ) ) ( not ( = ?auto_744719 ?auto_744722 ) ) ( not ( = ?auto_744719 ?auto_744723 ) ) ( not ( = ?auto_744719 ?auto_744724 ) ) ( not ( = ?auto_744720 ?auto_744721 ) ) ( not ( = ?auto_744720 ?auto_744722 ) ) ( not ( = ?auto_744720 ?auto_744723 ) ) ( not ( = ?auto_744720 ?auto_744724 ) ) ( not ( = ?auto_744721 ?auto_744722 ) ) ( not ( = ?auto_744721 ?auto_744723 ) ) ( not ( = ?auto_744721 ?auto_744724 ) ) ( not ( = ?auto_744722 ?auto_744723 ) ) ( not ( = ?auto_744722 ?auto_744724 ) ) ( not ( = ?auto_744723 ?auto_744724 ) ) ( ON ?auto_744722 ?auto_744723 ) ( ON ?auto_744721 ?auto_744722 ) ( ON ?auto_744720 ?auto_744721 ) ( ON ?auto_744719 ?auto_744720 ) ( ON ?auto_744718 ?auto_744719 ) ( ON ?auto_744717 ?auto_744718 ) ( ON ?auto_744716 ?auto_744717 ) ( ON ?auto_744715 ?auto_744716 ) ( ON ?auto_744714 ?auto_744715 ) ( ON ?auto_744713 ?auto_744714 ) ( ON ?auto_744712 ?auto_744713 ) ( CLEAR ?auto_744710 ) ( ON ?auto_744711 ?auto_744712 ) ( CLEAR ?auto_744711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_744709 ?auto_744710 ?auto_744711 )
      ( MAKE-15PILE ?auto_744709 ?auto_744710 ?auto_744711 ?auto_744712 ?auto_744713 ?auto_744714 ?auto_744715 ?auto_744716 ?auto_744717 ?auto_744718 ?auto_744719 ?auto_744720 ?auto_744721 ?auto_744722 ?auto_744723 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744771 - BLOCK
      ?auto_744772 - BLOCK
      ?auto_744773 - BLOCK
      ?auto_744774 - BLOCK
      ?auto_744775 - BLOCK
      ?auto_744776 - BLOCK
      ?auto_744777 - BLOCK
      ?auto_744778 - BLOCK
      ?auto_744779 - BLOCK
      ?auto_744780 - BLOCK
      ?auto_744781 - BLOCK
      ?auto_744782 - BLOCK
      ?auto_744783 - BLOCK
      ?auto_744784 - BLOCK
      ?auto_744785 - BLOCK
    )
    :vars
    (
      ?auto_744786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744785 ?auto_744786 ) ( ON-TABLE ?auto_744771 ) ( not ( = ?auto_744771 ?auto_744772 ) ) ( not ( = ?auto_744771 ?auto_744773 ) ) ( not ( = ?auto_744771 ?auto_744774 ) ) ( not ( = ?auto_744771 ?auto_744775 ) ) ( not ( = ?auto_744771 ?auto_744776 ) ) ( not ( = ?auto_744771 ?auto_744777 ) ) ( not ( = ?auto_744771 ?auto_744778 ) ) ( not ( = ?auto_744771 ?auto_744779 ) ) ( not ( = ?auto_744771 ?auto_744780 ) ) ( not ( = ?auto_744771 ?auto_744781 ) ) ( not ( = ?auto_744771 ?auto_744782 ) ) ( not ( = ?auto_744771 ?auto_744783 ) ) ( not ( = ?auto_744771 ?auto_744784 ) ) ( not ( = ?auto_744771 ?auto_744785 ) ) ( not ( = ?auto_744771 ?auto_744786 ) ) ( not ( = ?auto_744772 ?auto_744773 ) ) ( not ( = ?auto_744772 ?auto_744774 ) ) ( not ( = ?auto_744772 ?auto_744775 ) ) ( not ( = ?auto_744772 ?auto_744776 ) ) ( not ( = ?auto_744772 ?auto_744777 ) ) ( not ( = ?auto_744772 ?auto_744778 ) ) ( not ( = ?auto_744772 ?auto_744779 ) ) ( not ( = ?auto_744772 ?auto_744780 ) ) ( not ( = ?auto_744772 ?auto_744781 ) ) ( not ( = ?auto_744772 ?auto_744782 ) ) ( not ( = ?auto_744772 ?auto_744783 ) ) ( not ( = ?auto_744772 ?auto_744784 ) ) ( not ( = ?auto_744772 ?auto_744785 ) ) ( not ( = ?auto_744772 ?auto_744786 ) ) ( not ( = ?auto_744773 ?auto_744774 ) ) ( not ( = ?auto_744773 ?auto_744775 ) ) ( not ( = ?auto_744773 ?auto_744776 ) ) ( not ( = ?auto_744773 ?auto_744777 ) ) ( not ( = ?auto_744773 ?auto_744778 ) ) ( not ( = ?auto_744773 ?auto_744779 ) ) ( not ( = ?auto_744773 ?auto_744780 ) ) ( not ( = ?auto_744773 ?auto_744781 ) ) ( not ( = ?auto_744773 ?auto_744782 ) ) ( not ( = ?auto_744773 ?auto_744783 ) ) ( not ( = ?auto_744773 ?auto_744784 ) ) ( not ( = ?auto_744773 ?auto_744785 ) ) ( not ( = ?auto_744773 ?auto_744786 ) ) ( not ( = ?auto_744774 ?auto_744775 ) ) ( not ( = ?auto_744774 ?auto_744776 ) ) ( not ( = ?auto_744774 ?auto_744777 ) ) ( not ( = ?auto_744774 ?auto_744778 ) ) ( not ( = ?auto_744774 ?auto_744779 ) ) ( not ( = ?auto_744774 ?auto_744780 ) ) ( not ( = ?auto_744774 ?auto_744781 ) ) ( not ( = ?auto_744774 ?auto_744782 ) ) ( not ( = ?auto_744774 ?auto_744783 ) ) ( not ( = ?auto_744774 ?auto_744784 ) ) ( not ( = ?auto_744774 ?auto_744785 ) ) ( not ( = ?auto_744774 ?auto_744786 ) ) ( not ( = ?auto_744775 ?auto_744776 ) ) ( not ( = ?auto_744775 ?auto_744777 ) ) ( not ( = ?auto_744775 ?auto_744778 ) ) ( not ( = ?auto_744775 ?auto_744779 ) ) ( not ( = ?auto_744775 ?auto_744780 ) ) ( not ( = ?auto_744775 ?auto_744781 ) ) ( not ( = ?auto_744775 ?auto_744782 ) ) ( not ( = ?auto_744775 ?auto_744783 ) ) ( not ( = ?auto_744775 ?auto_744784 ) ) ( not ( = ?auto_744775 ?auto_744785 ) ) ( not ( = ?auto_744775 ?auto_744786 ) ) ( not ( = ?auto_744776 ?auto_744777 ) ) ( not ( = ?auto_744776 ?auto_744778 ) ) ( not ( = ?auto_744776 ?auto_744779 ) ) ( not ( = ?auto_744776 ?auto_744780 ) ) ( not ( = ?auto_744776 ?auto_744781 ) ) ( not ( = ?auto_744776 ?auto_744782 ) ) ( not ( = ?auto_744776 ?auto_744783 ) ) ( not ( = ?auto_744776 ?auto_744784 ) ) ( not ( = ?auto_744776 ?auto_744785 ) ) ( not ( = ?auto_744776 ?auto_744786 ) ) ( not ( = ?auto_744777 ?auto_744778 ) ) ( not ( = ?auto_744777 ?auto_744779 ) ) ( not ( = ?auto_744777 ?auto_744780 ) ) ( not ( = ?auto_744777 ?auto_744781 ) ) ( not ( = ?auto_744777 ?auto_744782 ) ) ( not ( = ?auto_744777 ?auto_744783 ) ) ( not ( = ?auto_744777 ?auto_744784 ) ) ( not ( = ?auto_744777 ?auto_744785 ) ) ( not ( = ?auto_744777 ?auto_744786 ) ) ( not ( = ?auto_744778 ?auto_744779 ) ) ( not ( = ?auto_744778 ?auto_744780 ) ) ( not ( = ?auto_744778 ?auto_744781 ) ) ( not ( = ?auto_744778 ?auto_744782 ) ) ( not ( = ?auto_744778 ?auto_744783 ) ) ( not ( = ?auto_744778 ?auto_744784 ) ) ( not ( = ?auto_744778 ?auto_744785 ) ) ( not ( = ?auto_744778 ?auto_744786 ) ) ( not ( = ?auto_744779 ?auto_744780 ) ) ( not ( = ?auto_744779 ?auto_744781 ) ) ( not ( = ?auto_744779 ?auto_744782 ) ) ( not ( = ?auto_744779 ?auto_744783 ) ) ( not ( = ?auto_744779 ?auto_744784 ) ) ( not ( = ?auto_744779 ?auto_744785 ) ) ( not ( = ?auto_744779 ?auto_744786 ) ) ( not ( = ?auto_744780 ?auto_744781 ) ) ( not ( = ?auto_744780 ?auto_744782 ) ) ( not ( = ?auto_744780 ?auto_744783 ) ) ( not ( = ?auto_744780 ?auto_744784 ) ) ( not ( = ?auto_744780 ?auto_744785 ) ) ( not ( = ?auto_744780 ?auto_744786 ) ) ( not ( = ?auto_744781 ?auto_744782 ) ) ( not ( = ?auto_744781 ?auto_744783 ) ) ( not ( = ?auto_744781 ?auto_744784 ) ) ( not ( = ?auto_744781 ?auto_744785 ) ) ( not ( = ?auto_744781 ?auto_744786 ) ) ( not ( = ?auto_744782 ?auto_744783 ) ) ( not ( = ?auto_744782 ?auto_744784 ) ) ( not ( = ?auto_744782 ?auto_744785 ) ) ( not ( = ?auto_744782 ?auto_744786 ) ) ( not ( = ?auto_744783 ?auto_744784 ) ) ( not ( = ?auto_744783 ?auto_744785 ) ) ( not ( = ?auto_744783 ?auto_744786 ) ) ( not ( = ?auto_744784 ?auto_744785 ) ) ( not ( = ?auto_744784 ?auto_744786 ) ) ( not ( = ?auto_744785 ?auto_744786 ) ) ( ON ?auto_744784 ?auto_744785 ) ( ON ?auto_744783 ?auto_744784 ) ( ON ?auto_744782 ?auto_744783 ) ( ON ?auto_744781 ?auto_744782 ) ( ON ?auto_744780 ?auto_744781 ) ( ON ?auto_744779 ?auto_744780 ) ( ON ?auto_744778 ?auto_744779 ) ( ON ?auto_744777 ?auto_744778 ) ( ON ?auto_744776 ?auto_744777 ) ( ON ?auto_744775 ?auto_744776 ) ( ON ?auto_744774 ?auto_744775 ) ( ON ?auto_744773 ?auto_744774 ) ( CLEAR ?auto_744771 ) ( ON ?auto_744772 ?auto_744773 ) ( CLEAR ?auto_744772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_744771 ?auto_744772 )
      ( MAKE-15PILE ?auto_744771 ?auto_744772 ?auto_744773 ?auto_744774 ?auto_744775 ?auto_744776 ?auto_744777 ?auto_744778 ?auto_744779 ?auto_744780 ?auto_744781 ?auto_744782 ?auto_744783 ?auto_744784 ?auto_744785 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_744833 - BLOCK
      ?auto_744834 - BLOCK
      ?auto_744835 - BLOCK
      ?auto_744836 - BLOCK
      ?auto_744837 - BLOCK
      ?auto_744838 - BLOCK
      ?auto_744839 - BLOCK
      ?auto_744840 - BLOCK
      ?auto_744841 - BLOCK
      ?auto_744842 - BLOCK
      ?auto_744843 - BLOCK
      ?auto_744844 - BLOCK
      ?auto_744845 - BLOCK
      ?auto_744846 - BLOCK
      ?auto_744847 - BLOCK
    )
    :vars
    (
      ?auto_744848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744847 ?auto_744848 ) ( not ( = ?auto_744833 ?auto_744834 ) ) ( not ( = ?auto_744833 ?auto_744835 ) ) ( not ( = ?auto_744833 ?auto_744836 ) ) ( not ( = ?auto_744833 ?auto_744837 ) ) ( not ( = ?auto_744833 ?auto_744838 ) ) ( not ( = ?auto_744833 ?auto_744839 ) ) ( not ( = ?auto_744833 ?auto_744840 ) ) ( not ( = ?auto_744833 ?auto_744841 ) ) ( not ( = ?auto_744833 ?auto_744842 ) ) ( not ( = ?auto_744833 ?auto_744843 ) ) ( not ( = ?auto_744833 ?auto_744844 ) ) ( not ( = ?auto_744833 ?auto_744845 ) ) ( not ( = ?auto_744833 ?auto_744846 ) ) ( not ( = ?auto_744833 ?auto_744847 ) ) ( not ( = ?auto_744833 ?auto_744848 ) ) ( not ( = ?auto_744834 ?auto_744835 ) ) ( not ( = ?auto_744834 ?auto_744836 ) ) ( not ( = ?auto_744834 ?auto_744837 ) ) ( not ( = ?auto_744834 ?auto_744838 ) ) ( not ( = ?auto_744834 ?auto_744839 ) ) ( not ( = ?auto_744834 ?auto_744840 ) ) ( not ( = ?auto_744834 ?auto_744841 ) ) ( not ( = ?auto_744834 ?auto_744842 ) ) ( not ( = ?auto_744834 ?auto_744843 ) ) ( not ( = ?auto_744834 ?auto_744844 ) ) ( not ( = ?auto_744834 ?auto_744845 ) ) ( not ( = ?auto_744834 ?auto_744846 ) ) ( not ( = ?auto_744834 ?auto_744847 ) ) ( not ( = ?auto_744834 ?auto_744848 ) ) ( not ( = ?auto_744835 ?auto_744836 ) ) ( not ( = ?auto_744835 ?auto_744837 ) ) ( not ( = ?auto_744835 ?auto_744838 ) ) ( not ( = ?auto_744835 ?auto_744839 ) ) ( not ( = ?auto_744835 ?auto_744840 ) ) ( not ( = ?auto_744835 ?auto_744841 ) ) ( not ( = ?auto_744835 ?auto_744842 ) ) ( not ( = ?auto_744835 ?auto_744843 ) ) ( not ( = ?auto_744835 ?auto_744844 ) ) ( not ( = ?auto_744835 ?auto_744845 ) ) ( not ( = ?auto_744835 ?auto_744846 ) ) ( not ( = ?auto_744835 ?auto_744847 ) ) ( not ( = ?auto_744835 ?auto_744848 ) ) ( not ( = ?auto_744836 ?auto_744837 ) ) ( not ( = ?auto_744836 ?auto_744838 ) ) ( not ( = ?auto_744836 ?auto_744839 ) ) ( not ( = ?auto_744836 ?auto_744840 ) ) ( not ( = ?auto_744836 ?auto_744841 ) ) ( not ( = ?auto_744836 ?auto_744842 ) ) ( not ( = ?auto_744836 ?auto_744843 ) ) ( not ( = ?auto_744836 ?auto_744844 ) ) ( not ( = ?auto_744836 ?auto_744845 ) ) ( not ( = ?auto_744836 ?auto_744846 ) ) ( not ( = ?auto_744836 ?auto_744847 ) ) ( not ( = ?auto_744836 ?auto_744848 ) ) ( not ( = ?auto_744837 ?auto_744838 ) ) ( not ( = ?auto_744837 ?auto_744839 ) ) ( not ( = ?auto_744837 ?auto_744840 ) ) ( not ( = ?auto_744837 ?auto_744841 ) ) ( not ( = ?auto_744837 ?auto_744842 ) ) ( not ( = ?auto_744837 ?auto_744843 ) ) ( not ( = ?auto_744837 ?auto_744844 ) ) ( not ( = ?auto_744837 ?auto_744845 ) ) ( not ( = ?auto_744837 ?auto_744846 ) ) ( not ( = ?auto_744837 ?auto_744847 ) ) ( not ( = ?auto_744837 ?auto_744848 ) ) ( not ( = ?auto_744838 ?auto_744839 ) ) ( not ( = ?auto_744838 ?auto_744840 ) ) ( not ( = ?auto_744838 ?auto_744841 ) ) ( not ( = ?auto_744838 ?auto_744842 ) ) ( not ( = ?auto_744838 ?auto_744843 ) ) ( not ( = ?auto_744838 ?auto_744844 ) ) ( not ( = ?auto_744838 ?auto_744845 ) ) ( not ( = ?auto_744838 ?auto_744846 ) ) ( not ( = ?auto_744838 ?auto_744847 ) ) ( not ( = ?auto_744838 ?auto_744848 ) ) ( not ( = ?auto_744839 ?auto_744840 ) ) ( not ( = ?auto_744839 ?auto_744841 ) ) ( not ( = ?auto_744839 ?auto_744842 ) ) ( not ( = ?auto_744839 ?auto_744843 ) ) ( not ( = ?auto_744839 ?auto_744844 ) ) ( not ( = ?auto_744839 ?auto_744845 ) ) ( not ( = ?auto_744839 ?auto_744846 ) ) ( not ( = ?auto_744839 ?auto_744847 ) ) ( not ( = ?auto_744839 ?auto_744848 ) ) ( not ( = ?auto_744840 ?auto_744841 ) ) ( not ( = ?auto_744840 ?auto_744842 ) ) ( not ( = ?auto_744840 ?auto_744843 ) ) ( not ( = ?auto_744840 ?auto_744844 ) ) ( not ( = ?auto_744840 ?auto_744845 ) ) ( not ( = ?auto_744840 ?auto_744846 ) ) ( not ( = ?auto_744840 ?auto_744847 ) ) ( not ( = ?auto_744840 ?auto_744848 ) ) ( not ( = ?auto_744841 ?auto_744842 ) ) ( not ( = ?auto_744841 ?auto_744843 ) ) ( not ( = ?auto_744841 ?auto_744844 ) ) ( not ( = ?auto_744841 ?auto_744845 ) ) ( not ( = ?auto_744841 ?auto_744846 ) ) ( not ( = ?auto_744841 ?auto_744847 ) ) ( not ( = ?auto_744841 ?auto_744848 ) ) ( not ( = ?auto_744842 ?auto_744843 ) ) ( not ( = ?auto_744842 ?auto_744844 ) ) ( not ( = ?auto_744842 ?auto_744845 ) ) ( not ( = ?auto_744842 ?auto_744846 ) ) ( not ( = ?auto_744842 ?auto_744847 ) ) ( not ( = ?auto_744842 ?auto_744848 ) ) ( not ( = ?auto_744843 ?auto_744844 ) ) ( not ( = ?auto_744843 ?auto_744845 ) ) ( not ( = ?auto_744843 ?auto_744846 ) ) ( not ( = ?auto_744843 ?auto_744847 ) ) ( not ( = ?auto_744843 ?auto_744848 ) ) ( not ( = ?auto_744844 ?auto_744845 ) ) ( not ( = ?auto_744844 ?auto_744846 ) ) ( not ( = ?auto_744844 ?auto_744847 ) ) ( not ( = ?auto_744844 ?auto_744848 ) ) ( not ( = ?auto_744845 ?auto_744846 ) ) ( not ( = ?auto_744845 ?auto_744847 ) ) ( not ( = ?auto_744845 ?auto_744848 ) ) ( not ( = ?auto_744846 ?auto_744847 ) ) ( not ( = ?auto_744846 ?auto_744848 ) ) ( not ( = ?auto_744847 ?auto_744848 ) ) ( ON ?auto_744846 ?auto_744847 ) ( ON ?auto_744845 ?auto_744846 ) ( ON ?auto_744844 ?auto_744845 ) ( ON ?auto_744843 ?auto_744844 ) ( ON ?auto_744842 ?auto_744843 ) ( ON ?auto_744841 ?auto_744842 ) ( ON ?auto_744840 ?auto_744841 ) ( ON ?auto_744839 ?auto_744840 ) ( ON ?auto_744838 ?auto_744839 ) ( ON ?auto_744837 ?auto_744838 ) ( ON ?auto_744836 ?auto_744837 ) ( ON ?auto_744835 ?auto_744836 ) ( ON ?auto_744834 ?auto_744835 ) ( ON ?auto_744833 ?auto_744834 ) ( CLEAR ?auto_744833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_744833 )
      ( MAKE-15PILE ?auto_744833 ?auto_744834 ?auto_744835 ?auto_744836 ?auto_744837 ?auto_744838 ?auto_744839 ?auto_744840 ?auto_744841 ?auto_744842 ?auto_744843 ?auto_744844 ?auto_744845 ?auto_744846 ?auto_744847 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_744896 - BLOCK
      ?auto_744897 - BLOCK
      ?auto_744898 - BLOCK
      ?auto_744899 - BLOCK
      ?auto_744900 - BLOCK
      ?auto_744901 - BLOCK
      ?auto_744902 - BLOCK
      ?auto_744903 - BLOCK
      ?auto_744904 - BLOCK
      ?auto_744905 - BLOCK
      ?auto_744906 - BLOCK
      ?auto_744907 - BLOCK
      ?auto_744908 - BLOCK
      ?auto_744909 - BLOCK
      ?auto_744910 - BLOCK
      ?auto_744911 - BLOCK
    )
    :vars
    (
      ?auto_744912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_744910 ) ( ON ?auto_744911 ?auto_744912 ) ( CLEAR ?auto_744911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_744896 ) ( ON ?auto_744897 ?auto_744896 ) ( ON ?auto_744898 ?auto_744897 ) ( ON ?auto_744899 ?auto_744898 ) ( ON ?auto_744900 ?auto_744899 ) ( ON ?auto_744901 ?auto_744900 ) ( ON ?auto_744902 ?auto_744901 ) ( ON ?auto_744903 ?auto_744902 ) ( ON ?auto_744904 ?auto_744903 ) ( ON ?auto_744905 ?auto_744904 ) ( ON ?auto_744906 ?auto_744905 ) ( ON ?auto_744907 ?auto_744906 ) ( ON ?auto_744908 ?auto_744907 ) ( ON ?auto_744909 ?auto_744908 ) ( ON ?auto_744910 ?auto_744909 ) ( not ( = ?auto_744896 ?auto_744897 ) ) ( not ( = ?auto_744896 ?auto_744898 ) ) ( not ( = ?auto_744896 ?auto_744899 ) ) ( not ( = ?auto_744896 ?auto_744900 ) ) ( not ( = ?auto_744896 ?auto_744901 ) ) ( not ( = ?auto_744896 ?auto_744902 ) ) ( not ( = ?auto_744896 ?auto_744903 ) ) ( not ( = ?auto_744896 ?auto_744904 ) ) ( not ( = ?auto_744896 ?auto_744905 ) ) ( not ( = ?auto_744896 ?auto_744906 ) ) ( not ( = ?auto_744896 ?auto_744907 ) ) ( not ( = ?auto_744896 ?auto_744908 ) ) ( not ( = ?auto_744896 ?auto_744909 ) ) ( not ( = ?auto_744896 ?auto_744910 ) ) ( not ( = ?auto_744896 ?auto_744911 ) ) ( not ( = ?auto_744896 ?auto_744912 ) ) ( not ( = ?auto_744897 ?auto_744898 ) ) ( not ( = ?auto_744897 ?auto_744899 ) ) ( not ( = ?auto_744897 ?auto_744900 ) ) ( not ( = ?auto_744897 ?auto_744901 ) ) ( not ( = ?auto_744897 ?auto_744902 ) ) ( not ( = ?auto_744897 ?auto_744903 ) ) ( not ( = ?auto_744897 ?auto_744904 ) ) ( not ( = ?auto_744897 ?auto_744905 ) ) ( not ( = ?auto_744897 ?auto_744906 ) ) ( not ( = ?auto_744897 ?auto_744907 ) ) ( not ( = ?auto_744897 ?auto_744908 ) ) ( not ( = ?auto_744897 ?auto_744909 ) ) ( not ( = ?auto_744897 ?auto_744910 ) ) ( not ( = ?auto_744897 ?auto_744911 ) ) ( not ( = ?auto_744897 ?auto_744912 ) ) ( not ( = ?auto_744898 ?auto_744899 ) ) ( not ( = ?auto_744898 ?auto_744900 ) ) ( not ( = ?auto_744898 ?auto_744901 ) ) ( not ( = ?auto_744898 ?auto_744902 ) ) ( not ( = ?auto_744898 ?auto_744903 ) ) ( not ( = ?auto_744898 ?auto_744904 ) ) ( not ( = ?auto_744898 ?auto_744905 ) ) ( not ( = ?auto_744898 ?auto_744906 ) ) ( not ( = ?auto_744898 ?auto_744907 ) ) ( not ( = ?auto_744898 ?auto_744908 ) ) ( not ( = ?auto_744898 ?auto_744909 ) ) ( not ( = ?auto_744898 ?auto_744910 ) ) ( not ( = ?auto_744898 ?auto_744911 ) ) ( not ( = ?auto_744898 ?auto_744912 ) ) ( not ( = ?auto_744899 ?auto_744900 ) ) ( not ( = ?auto_744899 ?auto_744901 ) ) ( not ( = ?auto_744899 ?auto_744902 ) ) ( not ( = ?auto_744899 ?auto_744903 ) ) ( not ( = ?auto_744899 ?auto_744904 ) ) ( not ( = ?auto_744899 ?auto_744905 ) ) ( not ( = ?auto_744899 ?auto_744906 ) ) ( not ( = ?auto_744899 ?auto_744907 ) ) ( not ( = ?auto_744899 ?auto_744908 ) ) ( not ( = ?auto_744899 ?auto_744909 ) ) ( not ( = ?auto_744899 ?auto_744910 ) ) ( not ( = ?auto_744899 ?auto_744911 ) ) ( not ( = ?auto_744899 ?auto_744912 ) ) ( not ( = ?auto_744900 ?auto_744901 ) ) ( not ( = ?auto_744900 ?auto_744902 ) ) ( not ( = ?auto_744900 ?auto_744903 ) ) ( not ( = ?auto_744900 ?auto_744904 ) ) ( not ( = ?auto_744900 ?auto_744905 ) ) ( not ( = ?auto_744900 ?auto_744906 ) ) ( not ( = ?auto_744900 ?auto_744907 ) ) ( not ( = ?auto_744900 ?auto_744908 ) ) ( not ( = ?auto_744900 ?auto_744909 ) ) ( not ( = ?auto_744900 ?auto_744910 ) ) ( not ( = ?auto_744900 ?auto_744911 ) ) ( not ( = ?auto_744900 ?auto_744912 ) ) ( not ( = ?auto_744901 ?auto_744902 ) ) ( not ( = ?auto_744901 ?auto_744903 ) ) ( not ( = ?auto_744901 ?auto_744904 ) ) ( not ( = ?auto_744901 ?auto_744905 ) ) ( not ( = ?auto_744901 ?auto_744906 ) ) ( not ( = ?auto_744901 ?auto_744907 ) ) ( not ( = ?auto_744901 ?auto_744908 ) ) ( not ( = ?auto_744901 ?auto_744909 ) ) ( not ( = ?auto_744901 ?auto_744910 ) ) ( not ( = ?auto_744901 ?auto_744911 ) ) ( not ( = ?auto_744901 ?auto_744912 ) ) ( not ( = ?auto_744902 ?auto_744903 ) ) ( not ( = ?auto_744902 ?auto_744904 ) ) ( not ( = ?auto_744902 ?auto_744905 ) ) ( not ( = ?auto_744902 ?auto_744906 ) ) ( not ( = ?auto_744902 ?auto_744907 ) ) ( not ( = ?auto_744902 ?auto_744908 ) ) ( not ( = ?auto_744902 ?auto_744909 ) ) ( not ( = ?auto_744902 ?auto_744910 ) ) ( not ( = ?auto_744902 ?auto_744911 ) ) ( not ( = ?auto_744902 ?auto_744912 ) ) ( not ( = ?auto_744903 ?auto_744904 ) ) ( not ( = ?auto_744903 ?auto_744905 ) ) ( not ( = ?auto_744903 ?auto_744906 ) ) ( not ( = ?auto_744903 ?auto_744907 ) ) ( not ( = ?auto_744903 ?auto_744908 ) ) ( not ( = ?auto_744903 ?auto_744909 ) ) ( not ( = ?auto_744903 ?auto_744910 ) ) ( not ( = ?auto_744903 ?auto_744911 ) ) ( not ( = ?auto_744903 ?auto_744912 ) ) ( not ( = ?auto_744904 ?auto_744905 ) ) ( not ( = ?auto_744904 ?auto_744906 ) ) ( not ( = ?auto_744904 ?auto_744907 ) ) ( not ( = ?auto_744904 ?auto_744908 ) ) ( not ( = ?auto_744904 ?auto_744909 ) ) ( not ( = ?auto_744904 ?auto_744910 ) ) ( not ( = ?auto_744904 ?auto_744911 ) ) ( not ( = ?auto_744904 ?auto_744912 ) ) ( not ( = ?auto_744905 ?auto_744906 ) ) ( not ( = ?auto_744905 ?auto_744907 ) ) ( not ( = ?auto_744905 ?auto_744908 ) ) ( not ( = ?auto_744905 ?auto_744909 ) ) ( not ( = ?auto_744905 ?auto_744910 ) ) ( not ( = ?auto_744905 ?auto_744911 ) ) ( not ( = ?auto_744905 ?auto_744912 ) ) ( not ( = ?auto_744906 ?auto_744907 ) ) ( not ( = ?auto_744906 ?auto_744908 ) ) ( not ( = ?auto_744906 ?auto_744909 ) ) ( not ( = ?auto_744906 ?auto_744910 ) ) ( not ( = ?auto_744906 ?auto_744911 ) ) ( not ( = ?auto_744906 ?auto_744912 ) ) ( not ( = ?auto_744907 ?auto_744908 ) ) ( not ( = ?auto_744907 ?auto_744909 ) ) ( not ( = ?auto_744907 ?auto_744910 ) ) ( not ( = ?auto_744907 ?auto_744911 ) ) ( not ( = ?auto_744907 ?auto_744912 ) ) ( not ( = ?auto_744908 ?auto_744909 ) ) ( not ( = ?auto_744908 ?auto_744910 ) ) ( not ( = ?auto_744908 ?auto_744911 ) ) ( not ( = ?auto_744908 ?auto_744912 ) ) ( not ( = ?auto_744909 ?auto_744910 ) ) ( not ( = ?auto_744909 ?auto_744911 ) ) ( not ( = ?auto_744909 ?auto_744912 ) ) ( not ( = ?auto_744910 ?auto_744911 ) ) ( not ( = ?auto_744910 ?auto_744912 ) ) ( not ( = ?auto_744911 ?auto_744912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_744911 ?auto_744912 )
      ( !STACK ?auto_744911 ?auto_744910 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_744962 - BLOCK
      ?auto_744963 - BLOCK
      ?auto_744964 - BLOCK
      ?auto_744965 - BLOCK
      ?auto_744966 - BLOCK
      ?auto_744967 - BLOCK
      ?auto_744968 - BLOCK
      ?auto_744969 - BLOCK
      ?auto_744970 - BLOCK
      ?auto_744971 - BLOCK
      ?auto_744972 - BLOCK
      ?auto_744973 - BLOCK
      ?auto_744974 - BLOCK
      ?auto_744975 - BLOCK
      ?auto_744976 - BLOCK
      ?auto_744977 - BLOCK
    )
    :vars
    (
      ?auto_744978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744977 ?auto_744978 ) ( ON-TABLE ?auto_744962 ) ( ON ?auto_744963 ?auto_744962 ) ( ON ?auto_744964 ?auto_744963 ) ( ON ?auto_744965 ?auto_744964 ) ( ON ?auto_744966 ?auto_744965 ) ( ON ?auto_744967 ?auto_744966 ) ( ON ?auto_744968 ?auto_744967 ) ( ON ?auto_744969 ?auto_744968 ) ( ON ?auto_744970 ?auto_744969 ) ( ON ?auto_744971 ?auto_744970 ) ( ON ?auto_744972 ?auto_744971 ) ( ON ?auto_744973 ?auto_744972 ) ( ON ?auto_744974 ?auto_744973 ) ( ON ?auto_744975 ?auto_744974 ) ( not ( = ?auto_744962 ?auto_744963 ) ) ( not ( = ?auto_744962 ?auto_744964 ) ) ( not ( = ?auto_744962 ?auto_744965 ) ) ( not ( = ?auto_744962 ?auto_744966 ) ) ( not ( = ?auto_744962 ?auto_744967 ) ) ( not ( = ?auto_744962 ?auto_744968 ) ) ( not ( = ?auto_744962 ?auto_744969 ) ) ( not ( = ?auto_744962 ?auto_744970 ) ) ( not ( = ?auto_744962 ?auto_744971 ) ) ( not ( = ?auto_744962 ?auto_744972 ) ) ( not ( = ?auto_744962 ?auto_744973 ) ) ( not ( = ?auto_744962 ?auto_744974 ) ) ( not ( = ?auto_744962 ?auto_744975 ) ) ( not ( = ?auto_744962 ?auto_744976 ) ) ( not ( = ?auto_744962 ?auto_744977 ) ) ( not ( = ?auto_744962 ?auto_744978 ) ) ( not ( = ?auto_744963 ?auto_744964 ) ) ( not ( = ?auto_744963 ?auto_744965 ) ) ( not ( = ?auto_744963 ?auto_744966 ) ) ( not ( = ?auto_744963 ?auto_744967 ) ) ( not ( = ?auto_744963 ?auto_744968 ) ) ( not ( = ?auto_744963 ?auto_744969 ) ) ( not ( = ?auto_744963 ?auto_744970 ) ) ( not ( = ?auto_744963 ?auto_744971 ) ) ( not ( = ?auto_744963 ?auto_744972 ) ) ( not ( = ?auto_744963 ?auto_744973 ) ) ( not ( = ?auto_744963 ?auto_744974 ) ) ( not ( = ?auto_744963 ?auto_744975 ) ) ( not ( = ?auto_744963 ?auto_744976 ) ) ( not ( = ?auto_744963 ?auto_744977 ) ) ( not ( = ?auto_744963 ?auto_744978 ) ) ( not ( = ?auto_744964 ?auto_744965 ) ) ( not ( = ?auto_744964 ?auto_744966 ) ) ( not ( = ?auto_744964 ?auto_744967 ) ) ( not ( = ?auto_744964 ?auto_744968 ) ) ( not ( = ?auto_744964 ?auto_744969 ) ) ( not ( = ?auto_744964 ?auto_744970 ) ) ( not ( = ?auto_744964 ?auto_744971 ) ) ( not ( = ?auto_744964 ?auto_744972 ) ) ( not ( = ?auto_744964 ?auto_744973 ) ) ( not ( = ?auto_744964 ?auto_744974 ) ) ( not ( = ?auto_744964 ?auto_744975 ) ) ( not ( = ?auto_744964 ?auto_744976 ) ) ( not ( = ?auto_744964 ?auto_744977 ) ) ( not ( = ?auto_744964 ?auto_744978 ) ) ( not ( = ?auto_744965 ?auto_744966 ) ) ( not ( = ?auto_744965 ?auto_744967 ) ) ( not ( = ?auto_744965 ?auto_744968 ) ) ( not ( = ?auto_744965 ?auto_744969 ) ) ( not ( = ?auto_744965 ?auto_744970 ) ) ( not ( = ?auto_744965 ?auto_744971 ) ) ( not ( = ?auto_744965 ?auto_744972 ) ) ( not ( = ?auto_744965 ?auto_744973 ) ) ( not ( = ?auto_744965 ?auto_744974 ) ) ( not ( = ?auto_744965 ?auto_744975 ) ) ( not ( = ?auto_744965 ?auto_744976 ) ) ( not ( = ?auto_744965 ?auto_744977 ) ) ( not ( = ?auto_744965 ?auto_744978 ) ) ( not ( = ?auto_744966 ?auto_744967 ) ) ( not ( = ?auto_744966 ?auto_744968 ) ) ( not ( = ?auto_744966 ?auto_744969 ) ) ( not ( = ?auto_744966 ?auto_744970 ) ) ( not ( = ?auto_744966 ?auto_744971 ) ) ( not ( = ?auto_744966 ?auto_744972 ) ) ( not ( = ?auto_744966 ?auto_744973 ) ) ( not ( = ?auto_744966 ?auto_744974 ) ) ( not ( = ?auto_744966 ?auto_744975 ) ) ( not ( = ?auto_744966 ?auto_744976 ) ) ( not ( = ?auto_744966 ?auto_744977 ) ) ( not ( = ?auto_744966 ?auto_744978 ) ) ( not ( = ?auto_744967 ?auto_744968 ) ) ( not ( = ?auto_744967 ?auto_744969 ) ) ( not ( = ?auto_744967 ?auto_744970 ) ) ( not ( = ?auto_744967 ?auto_744971 ) ) ( not ( = ?auto_744967 ?auto_744972 ) ) ( not ( = ?auto_744967 ?auto_744973 ) ) ( not ( = ?auto_744967 ?auto_744974 ) ) ( not ( = ?auto_744967 ?auto_744975 ) ) ( not ( = ?auto_744967 ?auto_744976 ) ) ( not ( = ?auto_744967 ?auto_744977 ) ) ( not ( = ?auto_744967 ?auto_744978 ) ) ( not ( = ?auto_744968 ?auto_744969 ) ) ( not ( = ?auto_744968 ?auto_744970 ) ) ( not ( = ?auto_744968 ?auto_744971 ) ) ( not ( = ?auto_744968 ?auto_744972 ) ) ( not ( = ?auto_744968 ?auto_744973 ) ) ( not ( = ?auto_744968 ?auto_744974 ) ) ( not ( = ?auto_744968 ?auto_744975 ) ) ( not ( = ?auto_744968 ?auto_744976 ) ) ( not ( = ?auto_744968 ?auto_744977 ) ) ( not ( = ?auto_744968 ?auto_744978 ) ) ( not ( = ?auto_744969 ?auto_744970 ) ) ( not ( = ?auto_744969 ?auto_744971 ) ) ( not ( = ?auto_744969 ?auto_744972 ) ) ( not ( = ?auto_744969 ?auto_744973 ) ) ( not ( = ?auto_744969 ?auto_744974 ) ) ( not ( = ?auto_744969 ?auto_744975 ) ) ( not ( = ?auto_744969 ?auto_744976 ) ) ( not ( = ?auto_744969 ?auto_744977 ) ) ( not ( = ?auto_744969 ?auto_744978 ) ) ( not ( = ?auto_744970 ?auto_744971 ) ) ( not ( = ?auto_744970 ?auto_744972 ) ) ( not ( = ?auto_744970 ?auto_744973 ) ) ( not ( = ?auto_744970 ?auto_744974 ) ) ( not ( = ?auto_744970 ?auto_744975 ) ) ( not ( = ?auto_744970 ?auto_744976 ) ) ( not ( = ?auto_744970 ?auto_744977 ) ) ( not ( = ?auto_744970 ?auto_744978 ) ) ( not ( = ?auto_744971 ?auto_744972 ) ) ( not ( = ?auto_744971 ?auto_744973 ) ) ( not ( = ?auto_744971 ?auto_744974 ) ) ( not ( = ?auto_744971 ?auto_744975 ) ) ( not ( = ?auto_744971 ?auto_744976 ) ) ( not ( = ?auto_744971 ?auto_744977 ) ) ( not ( = ?auto_744971 ?auto_744978 ) ) ( not ( = ?auto_744972 ?auto_744973 ) ) ( not ( = ?auto_744972 ?auto_744974 ) ) ( not ( = ?auto_744972 ?auto_744975 ) ) ( not ( = ?auto_744972 ?auto_744976 ) ) ( not ( = ?auto_744972 ?auto_744977 ) ) ( not ( = ?auto_744972 ?auto_744978 ) ) ( not ( = ?auto_744973 ?auto_744974 ) ) ( not ( = ?auto_744973 ?auto_744975 ) ) ( not ( = ?auto_744973 ?auto_744976 ) ) ( not ( = ?auto_744973 ?auto_744977 ) ) ( not ( = ?auto_744973 ?auto_744978 ) ) ( not ( = ?auto_744974 ?auto_744975 ) ) ( not ( = ?auto_744974 ?auto_744976 ) ) ( not ( = ?auto_744974 ?auto_744977 ) ) ( not ( = ?auto_744974 ?auto_744978 ) ) ( not ( = ?auto_744975 ?auto_744976 ) ) ( not ( = ?auto_744975 ?auto_744977 ) ) ( not ( = ?auto_744975 ?auto_744978 ) ) ( not ( = ?auto_744976 ?auto_744977 ) ) ( not ( = ?auto_744976 ?auto_744978 ) ) ( not ( = ?auto_744977 ?auto_744978 ) ) ( CLEAR ?auto_744975 ) ( ON ?auto_744976 ?auto_744977 ) ( CLEAR ?auto_744976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_744962 ?auto_744963 ?auto_744964 ?auto_744965 ?auto_744966 ?auto_744967 ?auto_744968 ?auto_744969 ?auto_744970 ?auto_744971 ?auto_744972 ?auto_744973 ?auto_744974 ?auto_744975 ?auto_744976 )
      ( MAKE-16PILE ?auto_744962 ?auto_744963 ?auto_744964 ?auto_744965 ?auto_744966 ?auto_744967 ?auto_744968 ?auto_744969 ?auto_744970 ?auto_744971 ?auto_744972 ?auto_744973 ?auto_744974 ?auto_744975 ?auto_744976 ?auto_744977 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745028 - BLOCK
      ?auto_745029 - BLOCK
      ?auto_745030 - BLOCK
      ?auto_745031 - BLOCK
      ?auto_745032 - BLOCK
      ?auto_745033 - BLOCK
      ?auto_745034 - BLOCK
      ?auto_745035 - BLOCK
      ?auto_745036 - BLOCK
      ?auto_745037 - BLOCK
      ?auto_745038 - BLOCK
      ?auto_745039 - BLOCK
      ?auto_745040 - BLOCK
      ?auto_745041 - BLOCK
      ?auto_745042 - BLOCK
      ?auto_745043 - BLOCK
    )
    :vars
    (
      ?auto_745044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745043 ?auto_745044 ) ( ON-TABLE ?auto_745028 ) ( ON ?auto_745029 ?auto_745028 ) ( ON ?auto_745030 ?auto_745029 ) ( ON ?auto_745031 ?auto_745030 ) ( ON ?auto_745032 ?auto_745031 ) ( ON ?auto_745033 ?auto_745032 ) ( ON ?auto_745034 ?auto_745033 ) ( ON ?auto_745035 ?auto_745034 ) ( ON ?auto_745036 ?auto_745035 ) ( ON ?auto_745037 ?auto_745036 ) ( ON ?auto_745038 ?auto_745037 ) ( ON ?auto_745039 ?auto_745038 ) ( ON ?auto_745040 ?auto_745039 ) ( not ( = ?auto_745028 ?auto_745029 ) ) ( not ( = ?auto_745028 ?auto_745030 ) ) ( not ( = ?auto_745028 ?auto_745031 ) ) ( not ( = ?auto_745028 ?auto_745032 ) ) ( not ( = ?auto_745028 ?auto_745033 ) ) ( not ( = ?auto_745028 ?auto_745034 ) ) ( not ( = ?auto_745028 ?auto_745035 ) ) ( not ( = ?auto_745028 ?auto_745036 ) ) ( not ( = ?auto_745028 ?auto_745037 ) ) ( not ( = ?auto_745028 ?auto_745038 ) ) ( not ( = ?auto_745028 ?auto_745039 ) ) ( not ( = ?auto_745028 ?auto_745040 ) ) ( not ( = ?auto_745028 ?auto_745041 ) ) ( not ( = ?auto_745028 ?auto_745042 ) ) ( not ( = ?auto_745028 ?auto_745043 ) ) ( not ( = ?auto_745028 ?auto_745044 ) ) ( not ( = ?auto_745029 ?auto_745030 ) ) ( not ( = ?auto_745029 ?auto_745031 ) ) ( not ( = ?auto_745029 ?auto_745032 ) ) ( not ( = ?auto_745029 ?auto_745033 ) ) ( not ( = ?auto_745029 ?auto_745034 ) ) ( not ( = ?auto_745029 ?auto_745035 ) ) ( not ( = ?auto_745029 ?auto_745036 ) ) ( not ( = ?auto_745029 ?auto_745037 ) ) ( not ( = ?auto_745029 ?auto_745038 ) ) ( not ( = ?auto_745029 ?auto_745039 ) ) ( not ( = ?auto_745029 ?auto_745040 ) ) ( not ( = ?auto_745029 ?auto_745041 ) ) ( not ( = ?auto_745029 ?auto_745042 ) ) ( not ( = ?auto_745029 ?auto_745043 ) ) ( not ( = ?auto_745029 ?auto_745044 ) ) ( not ( = ?auto_745030 ?auto_745031 ) ) ( not ( = ?auto_745030 ?auto_745032 ) ) ( not ( = ?auto_745030 ?auto_745033 ) ) ( not ( = ?auto_745030 ?auto_745034 ) ) ( not ( = ?auto_745030 ?auto_745035 ) ) ( not ( = ?auto_745030 ?auto_745036 ) ) ( not ( = ?auto_745030 ?auto_745037 ) ) ( not ( = ?auto_745030 ?auto_745038 ) ) ( not ( = ?auto_745030 ?auto_745039 ) ) ( not ( = ?auto_745030 ?auto_745040 ) ) ( not ( = ?auto_745030 ?auto_745041 ) ) ( not ( = ?auto_745030 ?auto_745042 ) ) ( not ( = ?auto_745030 ?auto_745043 ) ) ( not ( = ?auto_745030 ?auto_745044 ) ) ( not ( = ?auto_745031 ?auto_745032 ) ) ( not ( = ?auto_745031 ?auto_745033 ) ) ( not ( = ?auto_745031 ?auto_745034 ) ) ( not ( = ?auto_745031 ?auto_745035 ) ) ( not ( = ?auto_745031 ?auto_745036 ) ) ( not ( = ?auto_745031 ?auto_745037 ) ) ( not ( = ?auto_745031 ?auto_745038 ) ) ( not ( = ?auto_745031 ?auto_745039 ) ) ( not ( = ?auto_745031 ?auto_745040 ) ) ( not ( = ?auto_745031 ?auto_745041 ) ) ( not ( = ?auto_745031 ?auto_745042 ) ) ( not ( = ?auto_745031 ?auto_745043 ) ) ( not ( = ?auto_745031 ?auto_745044 ) ) ( not ( = ?auto_745032 ?auto_745033 ) ) ( not ( = ?auto_745032 ?auto_745034 ) ) ( not ( = ?auto_745032 ?auto_745035 ) ) ( not ( = ?auto_745032 ?auto_745036 ) ) ( not ( = ?auto_745032 ?auto_745037 ) ) ( not ( = ?auto_745032 ?auto_745038 ) ) ( not ( = ?auto_745032 ?auto_745039 ) ) ( not ( = ?auto_745032 ?auto_745040 ) ) ( not ( = ?auto_745032 ?auto_745041 ) ) ( not ( = ?auto_745032 ?auto_745042 ) ) ( not ( = ?auto_745032 ?auto_745043 ) ) ( not ( = ?auto_745032 ?auto_745044 ) ) ( not ( = ?auto_745033 ?auto_745034 ) ) ( not ( = ?auto_745033 ?auto_745035 ) ) ( not ( = ?auto_745033 ?auto_745036 ) ) ( not ( = ?auto_745033 ?auto_745037 ) ) ( not ( = ?auto_745033 ?auto_745038 ) ) ( not ( = ?auto_745033 ?auto_745039 ) ) ( not ( = ?auto_745033 ?auto_745040 ) ) ( not ( = ?auto_745033 ?auto_745041 ) ) ( not ( = ?auto_745033 ?auto_745042 ) ) ( not ( = ?auto_745033 ?auto_745043 ) ) ( not ( = ?auto_745033 ?auto_745044 ) ) ( not ( = ?auto_745034 ?auto_745035 ) ) ( not ( = ?auto_745034 ?auto_745036 ) ) ( not ( = ?auto_745034 ?auto_745037 ) ) ( not ( = ?auto_745034 ?auto_745038 ) ) ( not ( = ?auto_745034 ?auto_745039 ) ) ( not ( = ?auto_745034 ?auto_745040 ) ) ( not ( = ?auto_745034 ?auto_745041 ) ) ( not ( = ?auto_745034 ?auto_745042 ) ) ( not ( = ?auto_745034 ?auto_745043 ) ) ( not ( = ?auto_745034 ?auto_745044 ) ) ( not ( = ?auto_745035 ?auto_745036 ) ) ( not ( = ?auto_745035 ?auto_745037 ) ) ( not ( = ?auto_745035 ?auto_745038 ) ) ( not ( = ?auto_745035 ?auto_745039 ) ) ( not ( = ?auto_745035 ?auto_745040 ) ) ( not ( = ?auto_745035 ?auto_745041 ) ) ( not ( = ?auto_745035 ?auto_745042 ) ) ( not ( = ?auto_745035 ?auto_745043 ) ) ( not ( = ?auto_745035 ?auto_745044 ) ) ( not ( = ?auto_745036 ?auto_745037 ) ) ( not ( = ?auto_745036 ?auto_745038 ) ) ( not ( = ?auto_745036 ?auto_745039 ) ) ( not ( = ?auto_745036 ?auto_745040 ) ) ( not ( = ?auto_745036 ?auto_745041 ) ) ( not ( = ?auto_745036 ?auto_745042 ) ) ( not ( = ?auto_745036 ?auto_745043 ) ) ( not ( = ?auto_745036 ?auto_745044 ) ) ( not ( = ?auto_745037 ?auto_745038 ) ) ( not ( = ?auto_745037 ?auto_745039 ) ) ( not ( = ?auto_745037 ?auto_745040 ) ) ( not ( = ?auto_745037 ?auto_745041 ) ) ( not ( = ?auto_745037 ?auto_745042 ) ) ( not ( = ?auto_745037 ?auto_745043 ) ) ( not ( = ?auto_745037 ?auto_745044 ) ) ( not ( = ?auto_745038 ?auto_745039 ) ) ( not ( = ?auto_745038 ?auto_745040 ) ) ( not ( = ?auto_745038 ?auto_745041 ) ) ( not ( = ?auto_745038 ?auto_745042 ) ) ( not ( = ?auto_745038 ?auto_745043 ) ) ( not ( = ?auto_745038 ?auto_745044 ) ) ( not ( = ?auto_745039 ?auto_745040 ) ) ( not ( = ?auto_745039 ?auto_745041 ) ) ( not ( = ?auto_745039 ?auto_745042 ) ) ( not ( = ?auto_745039 ?auto_745043 ) ) ( not ( = ?auto_745039 ?auto_745044 ) ) ( not ( = ?auto_745040 ?auto_745041 ) ) ( not ( = ?auto_745040 ?auto_745042 ) ) ( not ( = ?auto_745040 ?auto_745043 ) ) ( not ( = ?auto_745040 ?auto_745044 ) ) ( not ( = ?auto_745041 ?auto_745042 ) ) ( not ( = ?auto_745041 ?auto_745043 ) ) ( not ( = ?auto_745041 ?auto_745044 ) ) ( not ( = ?auto_745042 ?auto_745043 ) ) ( not ( = ?auto_745042 ?auto_745044 ) ) ( not ( = ?auto_745043 ?auto_745044 ) ) ( ON ?auto_745042 ?auto_745043 ) ( CLEAR ?auto_745040 ) ( ON ?auto_745041 ?auto_745042 ) ( CLEAR ?auto_745041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_745028 ?auto_745029 ?auto_745030 ?auto_745031 ?auto_745032 ?auto_745033 ?auto_745034 ?auto_745035 ?auto_745036 ?auto_745037 ?auto_745038 ?auto_745039 ?auto_745040 ?auto_745041 )
      ( MAKE-16PILE ?auto_745028 ?auto_745029 ?auto_745030 ?auto_745031 ?auto_745032 ?auto_745033 ?auto_745034 ?auto_745035 ?auto_745036 ?auto_745037 ?auto_745038 ?auto_745039 ?auto_745040 ?auto_745041 ?auto_745042 ?auto_745043 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745094 - BLOCK
      ?auto_745095 - BLOCK
      ?auto_745096 - BLOCK
      ?auto_745097 - BLOCK
      ?auto_745098 - BLOCK
      ?auto_745099 - BLOCK
      ?auto_745100 - BLOCK
      ?auto_745101 - BLOCK
      ?auto_745102 - BLOCK
      ?auto_745103 - BLOCK
      ?auto_745104 - BLOCK
      ?auto_745105 - BLOCK
      ?auto_745106 - BLOCK
      ?auto_745107 - BLOCK
      ?auto_745108 - BLOCK
      ?auto_745109 - BLOCK
    )
    :vars
    (
      ?auto_745110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745109 ?auto_745110 ) ( ON-TABLE ?auto_745094 ) ( ON ?auto_745095 ?auto_745094 ) ( ON ?auto_745096 ?auto_745095 ) ( ON ?auto_745097 ?auto_745096 ) ( ON ?auto_745098 ?auto_745097 ) ( ON ?auto_745099 ?auto_745098 ) ( ON ?auto_745100 ?auto_745099 ) ( ON ?auto_745101 ?auto_745100 ) ( ON ?auto_745102 ?auto_745101 ) ( ON ?auto_745103 ?auto_745102 ) ( ON ?auto_745104 ?auto_745103 ) ( ON ?auto_745105 ?auto_745104 ) ( not ( = ?auto_745094 ?auto_745095 ) ) ( not ( = ?auto_745094 ?auto_745096 ) ) ( not ( = ?auto_745094 ?auto_745097 ) ) ( not ( = ?auto_745094 ?auto_745098 ) ) ( not ( = ?auto_745094 ?auto_745099 ) ) ( not ( = ?auto_745094 ?auto_745100 ) ) ( not ( = ?auto_745094 ?auto_745101 ) ) ( not ( = ?auto_745094 ?auto_745102 ) ) ( not ( = ?auto_745094 ?auto_745103 ) ) ( not ( = ?auto_745094 ?auto_745104 ) ) ( not ( = ?auto_745094 ?auto_745105 ) ) ( not ( = ?auto_745094 ?auto_745106 ) ) ( not ( = ?auto_745094 ?auto_745107 ) ) ( not ( = ?auto_745094 ?auto_745108 ) ) ( not ( = ?auto_745094 ?auto_745109 ) ) ( not ( = ?auto_745094 ?auto_745110 ) ) ( not ( = ?auto_745095 ?auto_745096 ) ) ( not ( = ?auto_745095 ?auto_745097 ) ) ( not ( = ?auto_745095 ?auto_745098 ) ) ( not ( = ?auto_745095 ?auto_745099 ) ) ( not ( = ?auto_745095 ?auto_745100 ) ) ( not ( = ?auto_745095 ?auto_745101 ) ) ( not ( = ?auto_745095 ?auto_745102 ) ) ( not ( = ?auto_745095 ?auto_745103 ) ) ( not ( = ?auto_745095 ?auto_745104 ) ) ( not ( = ?auto_745095 ?auto_745105 ) ) ( not ( = ?auto_745095 ?auto_745106 ) ) ( not ( = ?auto_745095 ?auto_745107 ) ) ( not ( = ?auto_745095 ?auto_745108 ) ) ( not ( = ?auto_745095 ?auto_745109 ) ) ( not ( = ?auto_745095 ?auto_745110 ) ) ( not ( = ?auto_745096 ?auto_745097 ) ) ( not ( = ?auto_745096 ?auto_745098 ) ) ( not ( = ?auto_745096 ?auto_745099 ) ) ( not ( = ?auto_745096 ?auto_745100 ) ) ( not ( = ?auto_745096 ?auto_745101 ) ) ( not ( = ?auto_745096 ?auto_745102 ) ) ( not ( = ?auto_745096 ?auto_745103 ) ) ( not ( = ?auto_745096 ?auto_745104 ) ) ( not ( = ?auto_745096 ?auto_745105 ) ) ( not ( = ?auto_745096 ?auto_745106 ) ) ( not ( = ?auto_745096 ?auto_745107 ) ) ( not ( = ?auto_745096 ?auto_745108 ) ) ( not ( = ?auto_745096 ?auto_745109 ) ) ( not ( = ?auto_745096 ?auto_745110 ) ) ( not ( = ?auto_745097 ?auto_745098 ) ) ( not ( = ?auto_745097 ?auto_745099 ) ) ( not ( = ?auto_745097 ?auto_745100 ) ) ( not ( = ?auto_745097 ?auto_745101 ) ) ( not ( = ?auto_745097 ?auto_745102 ) ) ( not ( = ?auto_745097 ?auto_745103 ) ) ( not ( = ?auto_745097 ?auto_745104 ) ) ( not ( = ?auto_745097 ?auto_745105 ) ) ( not ( = ?auto_745097 ?auto_745106 ) ) ( not ( = ?auto_745097 ?auto_745107 ) ) ( not ( = ?auto_745097 ?auto_745108 ) ) ( not ( = ?auto_745097 ?auto_745109 ) ) ( not ( = ?auto_745097 ?auto_745110 ) ) ( not ( = ?auto_745098 ?auto_745099 ) ) ( not ( = ?auto_745098 ?auto_745100 ) ) ( not ( = ?auto_745098 ?auto_745101 ) ) ( not ( = ?auto_745098 ?auto_745102 ) ) ( not ( = ?auto_745098 ?auto_745103 ) ) ( not ( = ?auto_745098 ?auto_745104 ) ) ( not ( = ?auto_745098 ?auto_745105 ) ) ( not ( = ?auto_745098 ?auto_745106 ) ) ( not ( = ?auto_745098 ?auto_745107 ) ) ( not ( = ?auto_745098 ?auto_745108 ) ) ( not ( = ?auto_745098 ?auto_745109 ) ) ( not ( = ?auto_745098 ?auto_745110 ) ) ( not ( = ?auto_745099 ?auto_745100 ) ) ( not ( = ?auto_745099 ?auto_745101 ) ) ( not ( = ?auto_745099 ?auto_745102 ) ) ( not ( = ?auto_745099 ?auto_745103 ) ) ( not ( = ?auto_745099 ?auto_745104 ) ) ( not ( = ?auto_745099 ?auto_745105 ) ) ( not ( = ?auto_745099 ?auto_745106 ) ) ( not ( = ?auto_745099 ?auto_745107 ) ) ( not ( = ?auto_745099 ?auto_745108 ) ) ( not ( = ?auto_745099 ?auto_745109 ) ) ( not ( = ?auto_745099 ?auto_745110 ) ) ( not ( = ?auto_745100 ?auto_745101 ) ) ( not ( = ?auto_745100 ?auto_745102 ) ) ( not ( = ?auto_745100 ?auto_745103 ) ) ( not ( = ?auto_745100 ?auto_745104 ) ) ( not ( = ?auto_745100 ?auto_745105 ) ) ( not ( = ?auto_745100 ?auto_745106 ) ) ( not ( = ?auto_745100 ?auto_745107 ) ) ( not ( = ?auto_745100 ?auto_745108 ) ) ( not ( = ?auto_745100 ?auto_745109 ) ) ( not ( = ?auto_745100 ?auto_745110 ) ) ( not ( = ?auto_745101 ?auto_745102 ) ) ( not ( = ?auto_745101 ?auto_745103 ) ) ( not ( = ?auto_745101 ?auto_745104 ) ) ( not ( = ?auto_745101 ?auto_745105 ) ) ( not ( = ?auto_745101 ?auto_745106 ) ) ( not ( = ?auto_745101 ?auto_745107 ) ) ( not ( = ?auto_745101 ?auto_745108 ) ) ( not ( = ?auto_745101 ?auto_745109 ) ) ( not ( = ?auto_745101 ?auto_745110 ) ) ( not ( = ?auto_745102 ?auto_745103 ) ) ( not ( = ?auto_745102 ?auto_745104 ) ) ( not ( = ?auto_745102 ?auto_745105 ) ) ( not ( = ?auto_745102 ?auto_745106 ) ) ( not ( = ?auto_745102 ?auto_745107 ) ) ( not ( = ?auto_745102 ?auto_745108 ) ) ( not ( = ?auto_745102 ?auto_745109 ) ) ( not ( = ?auto_745102 ?auto_745110 ) ) ( not ( = ?auto_745103 ?auto_745104 ) ) ( not ( = ?auto_745103 ?auto_745105 ) ) ( not ( = ?auto_745103 ?auto_745106 ) ) ( not ( = ?auto_745103 ?auto_745107 ) ) ( not ( = ?auto_745103 ?auto_745108 ) ) ( not ( = ?auto_745103 ?auto_745109 ) ) ( not ( = ?auto_745103 ?auto_745110 ) ) ( not ( = ?auto_745104 ?auto_745105 ) ) ( not ( = ?auto_745104 ?auto_745106 ) ) ( not ( = ?auto_745104 ?auto_745107 ) ) ( not ( = ?auto_745104 ?auto_745108 ) ) ( not ( = ?auto_745104 ?auto_745109 ) ) ( not ( = ?auto_745104 ?auto_745110 ) ) ( not ( = ?auto_745105 ?auto_745106 ) ) ( not ( = ?auto_745105 ?auto_745107 ) ) ( not ( = ?auto_745105 ?auto_745108 ) ) ( not ( = ?auto_745105 ?auto_745109 ) ) ( not ( = ?auto_745105 ?auto_745110 ) ) ( not ( = ?auto_745106 ?auto_745107 ) ) ( not ( = ?auto_745106 ?auto_745108 ) ) ( not ( = ?auto_745106 ?auto_745109 ) ) ( not ( = ?auto_745106 ?auto_745110 ) ) ( not ( = ?auto_745107 ?auto_745108 ) ) ( not ( = ?auto_745107 ?auto_745109 ) ) ( not ( = ?auto_745107 ?auto_745110 ) ) ( not ( = ?auto_745108 ?auto_745109 ) ) ( not ( = ?auto_745108 ?auto_745110 ) ) ( not ( = ?auto_745109 ?auto_745110 ) ) ( ON ?auto_745108 ?auto_745109 ) ( ON ?auto_745107 ?auto_745108 ) ( CLEAR ?auto_745105 ) ( ON ?auto_745106 ?auto_745107 ) ( CLEAR ?auto_745106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_745094 ?auto_745095 ?auto_745096 ?auto_745097 ?auto_745098 ?auto_745099 ?auto_745100 ?auto_745101 ?auto_745102 ?auto_745103 ?auto_745104 ?auto_745105 ?auto_745106 )
      ( MAKE-16PILE ?auto_745094 ?auto_745095 ?auto_745096 ?auto_745097 ?auto_745098 ?auto_745099 ?auto_745100 ?auto_745101 ?auto_745102 ?auto_745103 ?auto_745104 ?auto_745105 ?auto_745106 ?auto_745107 ?auto_745108 ?auto_745109 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745160 - BLOCK
      ?auto_745161 - BLOCK
      ?auto_745162 - BLOCK
      ?auto_745163 - BLOCK
      ?auto_745164 - BLOCK
      ?auto_745165 - BLOCK
      ?auto_745166 - BLOCK
      ?auto_745167 - BLOCK
      ?auto_745168 - BLOCK
      ?auto_745169 - BLOCK
      ?auto_745170 - BLOCK
      ?auto_745171 - BLOCK
      ?auto_745172 - BLOCK
      ?auto_745173 - BLOCK
      ?auto_745174 - BLOCK
      ?auto_745175 - BLOCK
    )
    :vars
    (
      ?auto_745176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745175 ?auto_745176 ) ( ON-TABLE ?auto_745160 ) ( ON ?auto_745161 ?auto_745160 ) ( ON ?auto_745162 ?auto_745161 ) ( ON ?auto_745163 ?auto_745162 ) ( ON ?auto_745164 ?auto_745163 ) ( ON ?auto_745165 ?auto_745164 ) ( ON ?auto_745166 ?auto_745165 ) ( ON ?auto_745167 ?auto_745166 ) ( ON ?auto_745168 ?auto_745167 ) ( ON ?auto_745169 ?auto_745168 ) ( ON ?auto_745170 ?auto_745169 ) ( not ( = ?auto_745160 ?auto_745161 ) ) ( not ( = ?auto_745160 ?auto_745162 ) ) ( not ( = ?auto_745160 ?auto_745163 ) ) ( not ( = ?auto_745160 ?auto_745164 ) ) ( not ( = ?auto_745160 ?auto_745165 ) ) ( not ( = ?auto_745160 ?auto_745166 ) ) ( not ( = ?auto_745160 ?auto_745167 ) ) ( not ( = ?auto_745160 ?auto_745168 ) ) ( not ( = ?auto_745160 ?auto_745169 ) ) ( not ( = ?auto_745160 ?auto_745170 ) ) ( not ( = ?auto_745160 ?auto_745171 ) ) ( not ( = ?auto_745160 ?auto_745172 ) ) ( not ( = ?auto_745160 ?auto_745173 ) ) ( not ( = ?auto_745160 ?auto_745174 ) ) ( not ( = ?auto_745160 ?auto_745175 ) ) ( not ( = ?auto_745160 ?auto_745176 ) ) ( not ( = ?auto_745161 ?auto_745162 ) ) ( not ( = ?auto_745161 ?auto_745163 ) ) ( not ( = ?auto_745161 ?auto_745164 ) ) ( not ( = ?auto_745161 ?auto_745165 ) ) ( not ( = ?auto_745161 ?auto_745166 ) ) ( not ( = ?auto_745161 ?auto_745167 ) ) ( not ( = ?auto_745161 ?auto_745168 ) ) ( not ( = ?auto_745161 ?auto_745169 ) ) ( not ( = ?auto_745161 ?auto_745170 ) ) ( not ( = ?auto_745161 ?auto_745171 ) ) ( not ( = ?auto_745161 ?auto_745172 ) ) ( not ( = ?auto_745161 ?auto_745173 ) ) ( not ( = ?auto_745161 ?auto_745174 ) ) ( not ( = ?auto_745161 ?auto_745175 ) ) ( not ( = ?auto_745161 ?auto_745176 ) ) ( not ( = ?auto_745162 ?auto_745163 ) ) ( not ( = ?auto_745162 ?auto_745164 ) ) ( not ( = ?auto_745162 ?auto_745165 ) ) ( not ( = ?auto_745162 ?auto_745166 ) ) ( not ( = ?auto_745162 ?auto_745167 ) ) ( not ( = ?auto_745162 ?auto_745168 ) ) ( not ( = ?auto_745162 ?auto_745169 ) ) ( not ( = ?auto_745162 ?auto_745170 ) ) ( not ( = ?auto_745162 ?auto_745171 ) ) ( not ( = ?auto_745162 ?auto_745172 ) ) ( not ( = ?auto_745162 ?auto_745173 ) ) ( not ( = ?auto_745162 ?auto_745174 ) ) ( not ( = ?auto_745162 ?auto_745175 ) ) ( not ( = ?auto_745162 ?auto_745176 ) ) ( not ( = ?auto_745163 ?auto_745164 ) ) ( not ( = ?auto_745163 ?auto_745165 ) ) ( not ( = ?auto_745163 ?auto_745166 ) ) ( not ( = ?auto_745163 ?auto_745167 ) ) ( not ( = ?auto_745163 ?auto_745168 ) ) ( not ( = ?auto_745163 ?auto_745169 ) ) ( not ( = ?auto_745163 ?auto_745170 ) ) ( not ( = ?auto_745163 ?auto_745171 ) ) ( not ( = ?auto_745163 ?auto_745172 ) ) ( not ( = ?auto_745163 ?auto_745173 ) ) ( not ( = ?auto_745163 ?auto_745174 ) ) ( not ( = ?auto_745163 ?auto_745175 ) ) ( not ( = ?auto_745163 ?auto_745176 ) ) ( not ( = ?auto_745164 ?auto_745165 ) ) ( not ( = ?auto_745164 ?auto_745166 ) ) ( not ( = ?auto_745164 ?auto_745167 ) ) ( not ( = ?auto_745164 ?auto_745168 ) ) ( not ( = ?auto_745164 ?auto_745169 ) ) ( not ( = ?auto_745164 ?auto_745170 ) ) ( not ( = ?auto_745164 ?auto_745171 ) ) ( not ( = ?auto_745164 ?auto_745172 ) ) ( not ( = ?auto_745164 ?auto_745173 ) ) ( not ( = ?auto_745164 ?auto_745174 ) ) ( not ( = ?auto_745164 ?auto_745175 ) ) ( not ( = ?auto_745164 ?auto_745176 ) ) ( not ( = ?auto_745165 ?auto_745166 ) ) ( not ( = ?auto_745165 ?auto_745167 ) ) ( not ( = ?auto_745165 ?auto_745168 ) ) ( not ( = ?auto_745165 ?auto_745169 ) ) ( not ( = ?auto_745165 ?auto_745170 ) ) ( not ( = ?auto_745165 ?auto_745171 ) ) ( not ( = ?auto_745165 ?auto_745172 ) ) ( not ( = ?auto_745165 ?auto_745173 ) ) ( not ( = ?auto_745165 ?auto_745174 ) ) ( not ( = ?auto_745165 ?auto_745175 ) ) ( not ( = ?auto_745165 ?auto_745176 ) ) ( not ( = ?auto_745166 ?auto_745167 ) ) ( not ( = ?auto_745166 ?auto_745168 ) ) ( not ( = ?auto_745166 ?auto_745169 ) ) ( not ( = ?auto_745166 ?auto_745170 ) ) ( not ( = ?auto_745166 ?auto_745171 ) ) ( not ( = ?auto_745166 ?auto_745172 ) ) ( not ( = ?auto_745166 ?auto_745173 ) ) ( not ( = ?auto_745166 ?auto_745174 ) ) ( not ( = ?auto_745166 ?auto_745175 ) ) ( not ( = ?auto_745166 ?auto_745176 ) ) ( not ( = ?auto_745167 ?auto_745168 ) ) ( not ( = ?auto_745167 ?auto_745169 ) ) ( not ( = ?auto_745167 ?auto_745170 ) ) ( not ( = ?auto_745167 ?auto_745171 ) ) ( not ( = ?auto_745167 ?auto_745172 ) ) ( not ( = ?auto_745167 ?auto_745173 ) ) ( not ( = ?auto_745167 ?auto_745174 ) ) ( not ( = ?auto_745167 ?auto_745175 ) ) ( not ( = ?auto_745167 ?auto_745176 ) ) ( not ( = ?auto_745168 ?auto_745169 ) ) ( not ( = ?auto_745168 ?auto_745170 ) ) ( not ( = ?auto_745168 ?auto_745171 ) ) ( not ( = ?auto_745168 ?auto_745172 ) ) ( not ( = ?auto_745168 ?auto_745173 ) ) ( not ( = ?auto_745168 ?auto_745174 ) ) ( not ( = ?auto_745168 ?auto_745175 ) ) ( not ( = ?auto_745168 ?auto_745176 ) ) ( not ( = ?auto_745169 ?auto_745170 ) ) ( not ( = ?auto_745169 ?auto_745171 ) ) ( not ( = ?auto_745169 ?auto_745172 ) ) ( not ( = ?auto_745169 ?auto_745173 ) ) ( not ( = ?auto_745169 ?auto_745174 ) ) ( not ( = ?auto_745169 ?auto_745175 ) ) ( not ( = ?auto_745169 ?auto_745176 ) ) ( not ( = ?auto_745170 ?auto_745171 ) ) ( not ( = ?auto_745170 ?auto_745172 ) ) ( not ( = ?auto_745170 ?auto_745173 ) ) ( not ( = ?auto_745170 ?auto_745174 ) ) ( not ( = ?auto_745170 ?auto_745175 ) ) ( not ( = ?auto_745170 ?auto_745176 ) ) ( not ( = ?auto_745171 ?auto_745172 ) ) ( not ( = ?auto_745171 ?auto_745173 ) ) ( not ( = ?auto_745171 ?auto_745174 ) ) ( not ( = ?auto_745171 ?auto_745175 ) ) ( not ( = ?auto_745171 ?auto_745176 ) ) ( not ( = ?auto_745172 ?auto_745173 ) ) ( not ( = ?auto_745172 ?auto_745174 ) ) ( not ( = ?auto_745172 ?auto_745175 ) ) ( not ( = ?auto_745172 ?auto_745176 ) ) ( not ( = ?auto_745173 ?auto_745174 ) ) ( not ( = ?auto_745173 ?auto_745175 ) ) ( not ( = ?auto_745173 ?auto_745176 ) ) ( not ( = ?auto_745174 ?auto_745175 ) ) ( not ( = ?auto_745174 ?auto_745176 ) ) ( not ( = ?auto_745175 ?auto_745176 ) ) ( ON ?auto_745174 ?auto_745175 ) ( ON ?auto_745173 ?auto_745174 ) ( ON ?auto_745172 ?auto_745173 ) ( CLEAR ?auto_745170 ) ( ON ?auto_745171 ?auto_745172 ) ( CLEAR ?auto_745171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_745160 ?auto_745161 ?auto_745162 ?auto_745163 ?auto_745164 ?auto_745165 ?auto_745166 ?auto_745167 ?auto_745168 ?auto_745169 ?auto_745170 ?auto_745171 )
      ( MAKE-16PILE ?auto_745160 ?auto_745161 ?auto_745162 ?auto_745163 ?auto_745164 ?auto_745165 ?auto_745166 ?auto_745167 ?auto_745168 ?auto_745169 ?auto_745170 ?auto_745171 ?auto_745172 ?auto_745173 ?auto_745174 ?auto_745175 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745226 - BLOCK
      ?auto_745227 - BLOCK
      ?auto_745228 - BLOCK
      ?auto_745229 - BLOCK
      ?auto_745230 - BLOCK
      ?auto_745231 - BLOCK
      ?auto_745232 - BLOCK
      ?auto_745233 - BLOCK
      ?auto_745234 - BLOCK
      ?auto_745235 - BLOCK
      ?auto_745236 - BLOCK
      ?auto_745237 - BLOCK
      ?auto_745238 - BLOCK
      ?auto_745239 - BLOCK
      ?auto_745240 - BLOCK
      ?auto_745241 - BLOCK
    )
    :vars
    (
      ?auto_745242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745241 ?auto_745242 ) ( ON-TABLE ?auto_745226 ) ( ON ?auto_745227 ?auto_745226 ) ( ON ?auto_745228 ?auto_745227 ) ( ON ?auto_745229 ?auto_745228 ) ( ON ?auto_745230 ?auto_745229 ) ( ON ?auto_745231 ?auto_745230 ) ( ON ?auto_745232 ?auto_745231 ) ( ON ?auto_745233 ?auto_745232 ) ( ON ?auto_745234 ?auto_745233 ) ( ON ?auto_745235 ?auto_745234 ) ( not ( = ?auto_745226 ?auto_745227 ) ) ( not ( = ?auto_745226 ?auto_745228 ) ) ( not ( = ?auto_745226 ?auto_745229 ) ) ( not ( = ?auto_745226 ?auto_745230 ) ) ( not ( = ?auto_745226 ?auto_745231 ) ) ( not ( = ?auto_745226 ?auto_745232 ) ) ( not ( = ?auto_745226 ?auto_745233 ) ) ( not ( = ?auto_745226 ?auto_745234 ) ) ( not ( = ?auto_745226 ?auto_745235 ) ) ( not ( = ?auto_745226 ?auto_745236 ) ) ( not ( = ?auto_745226 ?auto_745237 ) ) ( not ( = ?auto_745226 ?auto_745238 ) ) ( not ( = ?auto_745226 ?auto_745239 ) ) ( not ( = ?auto_745226 ?auto_745240 ) ) ( not ( = ?auto_745226 ?auto_745241 ) ) ( not ( = ?auto_745226 ?auto_745242 ) ) ( not ( = ?auto_745227 ?auto_745228 ) ) ( not ( = ?auto_745227 ?auto_745229 ) ) ( not ( = ?auto_745227 ?auto_745230 ) ) ( not ( = ?auto_745227 ?auto_745231 ) ) ( not ( = ?auto_745227 ?auto_745232 ) ) ( not ( = ?auto_745227 ?auto_745233 ) ) ( not ( = ?auto_745227 ?auto_745234 ) ) ( not ( = ?auto_745227 ?auto_745235 ) ) ( not ( = ?auto_745227 ?auto_745236 ) ) ( not ( = ?auto_745227 ?auto_745237 ) ) ( not ( = ?auto_745227 ?auto_745238 ) ) ( not ( = ?auto_745227 ?auto_745239 ) ) ( not ( = ?auto_745227 ?auto_745240 ) ) ( not ( = ?auto_745227 ?auto_745241 ) ) ( not ( = ?auto_745227 ?auto_745242 ) ) ( not ( = ?auto_745228 ?auto_745229 ) ) ( not ( = ?auto_745228 ?auto_745230 ) ) ( not ( = ?auto_745228 ?auto_745231 ) ) ( not ( = ?auto_745228 ?auto_745232 ) ) ( not ( = ?auto_745228 ?auto_745233 ) ) ( not ( = ?auto_745228 ?auto_745234 ) ) ( not ( = ?auto_745228 ?auto_745235 ) ) ( not ( = ?auto_745228 ?auto_745236 ) ) ( not ( = ?auto_745228 ?auto_745237 ) ) ( not ( = ?auto_745228 ?auto_745238 ) ) ( not ( = ?auto_745228 ?auto_745239 ) ) ( not ( = ?auto_745228 ?auto_745240 ) ) ( not ( = ?auto_745228 ?auto_745241 ) ) ( not ( = ?auto_745228 ?auto_745242 ) ) ( not ( = ?auto_745229 ?auto_745230 ) ) ( not ( = ?auto_745229 ?auto_745231 ) ) ( not ( = ?auto_745229 ?auto_745232 ) ) ( not ( = ?auto_745229 ?auto_745233 ) ) ( not ( = ?auto_745229 ?auto_745234 ) ) ( not ( = ?auto_745229 ?auto_745235 ) ) ( not ( = ?auto_745229 ?auto_745236 ) ) ( not ( = ?auto_745229 ?auto_745237 ) ) ( not ( = ?auto_745229 ?auto_745238 ) ) ( not ( = ?auto_745229 ?auto_745239 ) ) ( not ( = ?auto_745229 ?auto_745240 ) ) ( not ( = ?auto_745229 ?auto_745241 ) ) ( not ( = ?auto_745229 ?auto_745242 ) ) ( not ( = ?auto_745230 ?auto_745231 ) ) ( not ( = ?auto_745230 ?auto_745232 ) ) ( not ( = ?auto_745230 ?auto_745233 ) ) ( not ( = ?auto_745230 ?auto_745234 ) ) ( not ( = ?auto_745230 ?auto_745235 ) ) ( not ( = ?auto_745230 ?auto_745236 ) ) ( not ( = ?auto_745230 ?auto_745237 ) ) ( not ( = ?auto_745230 ?auto_745238 ) ) ( not ( = ?auto_745230 ?auto_745239 ) ) ( not ( = ?auto_745230 ?auto_745240 ) ) ( not ( = ?auto_745230 ?auto_745241 ) ) ( not ( = ?auto_745230 ?auto_745242 ) ) ( not ( = ?auto_745231 ?auto_745232 ) ) ( not ( = ?auto_745231 ?auto_745233 ) ) ( not ( = ?auto_745231 ?auto_745234 ) ) ( not ( = ?auto_745231 ?auto_745235 ) ) ( not ( = ?auto_745231 ?auto_745236 ) ) ( not ( = ?auto_745231 ?auto_745237 ) ) ( not ( = ?auto_745231 ?auto_745238 ) ) ( not ( = ?auto_745231 ?auto_745239 ) ) ( not ( = ?auto_745231 ?auto_745240 ) ) ( not ( = ?auto_745231 ?auto_745241 ) ) ( not ( = ?auto_745231 ?auto_745242 ) ) ( not ( = ?auto_745232 ?auto_745233 ) ) ( not ( = ?auto_745232 ?auto_745234 ) ) ( not ( = ?auto_745232 ?auto_745235 ) ) ( not ( = ?auto_745232 ?auto_745236 ) ) ( not ( = ?auto_745232 ?auto_745237 ) ) ( not ( = ?auto_745232 ?auto_745238 ) ) ( not ( = ?auto_745232 ?auto_745239 ) ) ( not ( = ?auto_745232 ?auto_745240 ) ) ( not ( = ?auto_745232 ?auto_745241 ) ) ( not ( = ?auto_745232 ?auto_745242 ) ) ( not ( = ?auto_745233 ?auto_745234 ) ) ( not ( = ?auto_745233 ?auto_745235 ) ) ( not ( = ?auto_745233 ?auto_745236 ) ) ( not ( = ?auto_745233 ?auto_745237 ) ) ( not ( = ?auto_745233 ?auto_745238 ) ) ( not ( = ?auto_745233 ?auto_745239 ) ) ( not ( = ?auto_745233 ?auto_745240 ) ) ( not ( = ?auto_745233 ?auto_745241 ) ) ( not ( = ?auto_745233 ?auto_745242 ) ) ( not ( = ?auto_745234 ?auto_745235 ) ) ( not ( = ?auto_745234 ?auto_745236 ) ) ( not ( = ?auto_745234 ?auto_745237 ) ) ( not ( = ?auto_745234 ?auto_745238 ) ) ( not ( = ?auto_745234 ?auto_745239 ) ) ( not ( = ?auto_745234 ?auto_745240 ) ) ( not ( = ?auto_745234 ?auto_745241 ) ) ( not ( = ?auto_745234 ?auto_745242 ) ) ( not ( = ?auto_745235 ?auto_745236 ) ) ( not ( = ?auto_745235 ?auto_745237 ) ) ( not ( = ?auto_745235 ?auto_745238 ) ) ( not ( = ?auto_745235 ?auto_745239 ) ) ( not ( = ?auto_745235 ?auto_745240 ) ) ( not ( = ?auto_745235 ?auto_745241 ) ) ( not ( = ?auto_745235 ?auto_745242 ) ) ( not ( = ?auto_745236 ?auto_745237 ) ) ( not ( = ?auto_745236 ?auto_745238 ) ) ( not ( = ?auto_745236 ?auto_745239 ) ) ( not ( = ?auto_745236 ?auto_745240 ) ) ( not ( = ?auto_745236 ?auto_745241 ) ) ( not ( = ?auto_745236 ?auto_745242 ) ) ( not ( = ?auto_745237 ?auto_745238 ) ) ( not ( = ?auto_745237 ?auto_745239 ) ) ( not ( = ?auto_745237 ?auto_745240 ) ) ( not ( = ?auto_745237 ?auto_745241 ) ) ( not ( = ?auto_745237 ?auto_745242 ) ) ( not ( = ?auto_745238 ?auto_745239 ) ) ( not ( = ?auto_745238 ?auto_745240 ) ) ( not ( = ?auto_745238 ?auto_745241 ) ) ( not ( = ?auto_745238 ?auto_745242 ) ) ( not ( = ?auto_745239 ?auto_745240 ) ) ( not ( = ?auto_745239 ?auto_745241 ) ) ( not ( = ?auto_745239 ?auto_745242 ) ) ( not ( = ?auto_745240 ?auto_745241 ) ) ( not ( = ?auto_745240 ?auto_745242 ) ) ( not ( = ?auto_745241 ?auto_745242 ) ) ( ON ?auto_745240 ?auto_745241 ) ( ON ?auto_745239 ?auto_745240 ) ( ON ?auto_745238 ?auto_745239 ) ( ON ?auto_745237 ?auto_745238 ) ( CLEAR ?auto_745235 ) ( ON ?auto_745236 ?auto_745237 ) ( CLEAR ?auto_745236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_745226 ?auto_745227 ?auto_745228 ?auto_745229 ?auto_745230 ?auto_745231 ?auto_745232 ?auto_745233 ?auto_745234 ?auto_745235 ?auto_745236 )
      ( MAKE-16PILE ?auto_745226 ?auto_745227 ?auto_745228 ?auto_745229 ?auto_745230 ?auto_745231 ?auto_745232 ?auto_745233 ?auto_745234 ?auto_745235 ?auto_745236 ?auto_745237 ?auto_745238 ?auto_745239 ?auto_745240 ?auto_745241 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745292 - BLOCK
      ?auto_745293 - BLOCK
      ?auto_745294 - BLOCK
      ?auto_745295 - BLOCK
      ?auto_745296 - BLOCK
      ?auto_745297 - BLOCK
      ?auto_745298 - BLOCK
      ?auto_745299 - BLOCK
      ?auto_745300 - BLOCK
      ?auto_745301 - BLOCK
      ?auto_745302 - BLOCK
      ?auto_745303 - BLOCK
      ?auto_745304 - BLOCK
      ?auto_745305 - BLOCK
      ?auto_745306 - BLOCK
      ?auto_745307 - BLOCK
    )
    :vars
    (
      ?auto_745308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745307 ?auto_745308 ) ( ON-TABLE ?auto_745292 ) ( ON ?auto_745293 ?auto_745292 ) ( ON ?auto_745294 ?auto_745293 ) ( ON ?auto_745295 ?auto_745294 ) ( ON ?auto_745296 ?auto_745295 ) ( ON ?auto_745297 ?auto_745296 ) ( ON ?auto_745298 ?auto_745297 ) ( ON ?auto_745299 ?auto_745298 ) ( ON ?auto_745300 ?auto_745299 ) ( not ( = ?auto_745292 ?auto_745293 ) ) ( not ( = ?auto_745292 ?auto_745294 ) ) ( not ( = ?auto_745292 ?auto_745295 ) ) ( not ( = ?auto_745292 ?auto_745296 ) ) ( not ( = ?auto_745292 ?auto_745297 ) ) ( not ( = ?auto_745292 ?auto_745298 ) ) ( not ( = ?auto_745292 ?auto_745299 ) ) ( not ( = ?auto_745292 ?auto_745300 ) ) ( not ( = ?auto_745292 ?auto_745301 ) ) ( not ( = ?auto_745292 ?auto_745302 ) ) ( not ( = ?auto_745292 ?auto_745303 ) ) ( not ( = ?auto_745292 ?auto_745304 ) ) ( not ( = ?auto_745292 ?auto_745305 ) ) ( not ( = ?auto_745292 ?auto_745306 ) ) ( not ( = ?auto_745292 ?auto_745307 ) ) ( not ( = ?auto_745292 ?auto_745308 ) ) ( not ( = ?auto_745293 ?auto_745294 ) ) ( not ( = ?auto_745293 ?auto_745295 ) ) ( not ( = ?auto_745293 ?auto_745296 ) ) ( not ( = ?auto_745293 ?auto_745297 ) ) ( not ( = ?auto_745293 ?auto_745298 ) ) ( not ( = ?auto_745293 ?auto_745299 ) ) ( not ( = ?auto_745293 ?auto_745300 ) ) ( not ( = ?auto_745293 ?auto_745301 ) ) ( not ( = ?auto_745293 ?auto_745302 ) ) ( not ( = ?auto_745293 ?auto_745303 ) ) ( not ( = ?auto_745293 ?auto_745304 ) ) ( not ( = ?auto_745293 ?auto_745305 ) ) ( not ( = ?auto_745293 ?auto_745306 ) ) ( not ( = ?auto_745293 ?auto_745307 ) ) ( not ( = ?auto_745293 ?auto_745308 ) ) ( not ( = ?auto_745294 ?auto_745295 ) ) ( not ( = ?auto_745294 ?auto_745296 ) ) ( not ( = ?auto_745294 ?auto_745297 ) ) ( not ( = ?auto_745294 ?auto_745298 ) ) ( not ( = ?auto_745294 ?auto_745299 ) ) ( not ( = ?auto_745294 ?auto_745300 ) ) ( not ( = ?auto_745294 ?auto_745301 ) ) ( not ( = ?auto_745294 ?auto_745302 ) ) ( not ( = ?auto_745294 ?auto_745303 ) ) ( not ( = ?auto_745294 ?auto_745304 ) ) ( not ( = ?auto_745294 ?auto_745305 ) ) ( not ( = ?auto_745294 ?auto_745306 ) ) ( not ( = ?auto_745294 ?auto_745307 ) ) ( not ( = ?auto_745294 ?auto_745308 ) ) ( not ( = ?auto_745295 ?auto_745296 ) ) ( not ( = ?auto_745295 ?auto_745297 ) ) ( not ( = ?auto_745295 ?auto_745298 ) ) ( not ( = ?auto_745295 ?auto_745299 ) ) ( not ( = ?auto_745295 ?auto_745300 ) ) ( not ( = ?auto_745295 ?auto_745301 ) ) ( not ( = ?auto_745295 ?auto_745302 ) ) ( not ( = ?auto_745295 ?auto_745303 ) ) ( not ( = ?auto_745295 ?auto_745304 ) ) ( not ( = ?auto_745295 ?auto_745305 ) ) ( not ( = ?auto_745295 ?auto_745306 ) ) ( not ( = ?auto_745295 ?auto_745307 ) ) ( not ( = ?auto_745295 ?auto_745308 ) ) ( not ( = ?auto_745296 ?auto_745297 ) ) ( not ( = ?auto_745296 ?auto_745298 ) ) ( not ( = ?auto_745296 ?auto_745299 ) ) ( not ( = ?auto_745296 ?auto_745300 ) ) ( not ( = ?auto_745296 ?auto_745301 ) ) ( not ( = ?auto_745296 ?auto_745302 ) ) ( not ( = ?auto_745296 ?auto_745303 ) ) ( not ( = ?auto_745296 ?auto_745304 ) ) ( not ( = ?auto_745296 ?auto_745305 ) ) ( not ( = ?auto_745296 ?auto_745306 ) ) ( not ( = ?auto_745296 ?auto_745307 ) ) ( not ( = ?auto_745296 ?auto_745308 ) ) ( not ( = ?auto_745297 ?auto_745298 ) ) ( not ( = ?auto_745297 ?auto_745299 ) ) ( not ( = ?auto_745297 ?auto_745300 ) ) ( not ( = ?auto_745297 ?auto_745301 ) ) ( not ( = ?auto_745297 ?auto_745302 ) ) ( not ( = ?auto_745297 ?auto_745303 ) ) ( not ( = ?auto_745297 ?auto_745304 ) ) ( not ( = ?auto_745297 ?auto_745305 ) ) ( not ( = ?auto_745297 ?auto_745306 ) ) ( not ( = ?auto_745297 ?auto_745307 ) ) ( not ( = ?auto_745297 ?auto_745308 ) ) ( not ( = ?auto_745298 ?auto_745299 ) ) ( not ( = ?auto_745298 ?auto_745300 ) ) ( not ( = ?auto_745298 ?auto_745301 ) ) ( not ( = ?auto_745298 ?auto_745302 ) ) ( not ( = ?auto_745298 ?auto_745303 ) ) ( not ( = ?auto_745298 ?auto_745304 ) ) ( not ( = ?auto_745298 ?auto_745305 ) ) ( not ( = ?auto_745298 ?auto_745306 ) ) ( not ( = ?auto_745298 ?auto_745307 ) ) ( not ( = ?auto_745298 ?auto_745308 ) ) ( not ( = ?auto_745299 ?auto_745300 ) ) ( not ( = ?auto_745299 ?auto_745301 ) ) ( not ( = ?auto_745299 ?auto_745302 ) ) ( not ( = ?auto_745299 ?auto_745303 ) ) ( not ( = ?auto_745299 ?auto_745304 ) ) ( not ( = ?auto_745299 ?auto_745305 ) ) ( not ( = ?auto_745299 ?auto_745306 ) ) ( not ( = ?auto_745299 ?auto_745307 ) ) ( not ( = ?auto_745299 ?auto_745308 ) ) ( not ( = ?auto_745300 ?auto_745301 ) ) ( not ( = ?auto_745300 ?auto_745302 ) ) ( not ( = ?auto_745300 ?auto_745303 ) ) ( not ( = ?auto_745300 ?auto_745304 ) ) ( not ( = ?auto_745300 ?auto_745305 ) ) ( not ( = ?auto_745300 ?auto_745306 ) ) ( not ( = ?auto_745300 ?auto_745307 ) ) ( not ( = ?auto_745300 ?auto_745308 ) ) ( not ( = ?auto_745301 ?auto_745302 ) ) ( not ( = ?auto_745301 ?auto_745303 ) ) ( not ( = ?auto_745301 ?auto_745304 ) ) ( not ( = ?auto_745301 ?auto_745305 ) ) ( not ( = ?auto_745301 ?auto_745306 ) ) ( not ( = ?auto_745301 ?auto_745307 ) ) ( not ( = ?auto_745301 ?auto_745308 ) ) ( not ( = ?auto_745302 ?auto_745303 ) ) ( not ( = ?auto_745302 ?auto_745304 ) ) ( not ( = ?auto_745302 ?auto_745305 ) ) ( not ( = ?auto_745302 ?auto_745306 ) ) ( not ( = ?auto_745302 ?auto_745307 ) ) ( not ( = ?auto_745302 ?auto_745308 ) ) ( not ( = ?auto_745303 ?auto_745304 ) ) ( not ( = ?auto_745303 ?auto_745305 ) ) ( not ( = ?auto_745303 ?auto_745306 ) ) ( not ( = ?auto_745303 ?auto_745307 ) ) ( not ( = ?auto_745303 ?auto_745308 ) ) ( not ( = ?auto_745304 ?auto_745305 ) ) ( not ( = ?auto_745304 ?auto_745306 ) ) ( not ( = ?auto_745304 ?auto_745307 ) ) ( not ( = ?auto_745304 ?auto_745308 ) ) ( not ( = ?auto_745305 ?auto_745306 ) ) ( not ( = ?auto_745305 ?auto_745307 ) ) ( not ( = ?auto_745305 ?auto_745308 ) ) ( not ( = ?auto_745306 ?auto_745307 ) ) ( not ( = ?auto_745306 ?auto_745308 ) ) ( not ( = ?auto_745307 ?auto_745308 ) ) ( ON ?auto_745306 ?auto_745307 ) ( ON ?auto_745305 ?auto_745306 ) ( ON ?auto_745304 ?auto_745305 ) ( ON ?auto_745303 ?auto_745304 ) ( ON ?auto_745302 ?auto_745303 ) ( CLEAR ?auto_745300 ) ( ON ?auto_745301 ?auto_745302 ) ( CLEAR ?auto_745301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_745292 ?auto_745293 ?auto_745294 ?auto_745295 ?auto_745296 ?auto_745297 ?auto_745298 ?auto_745299 ?auto_745300 ?auto_745301 )
      ( MAKE-16PILE ?auto_745292 ?auto_745293 ?auto_745294 ?auto_745295 ?auto_745296 ?auto_745297 ?auto_745298 ?auto_745299 ?auto_745300 ?auto_745301 ?auto_745302 ?auto_745303 ?auto_745304 ?auto_745305 ?auto_745306 ?auto_745307 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745358 - BLOCK
      ?auto_745359 - BLOCK
      ?auto_745360 - BLOCK
      ?auto_745361 - BLOCK
      ?auto_745362 - BLOCK
      ?auto_745363 - BLOCK
      ?auto_745364 - BLOCK
      ?auto_745365 - BLOCK
      ?auto_745366 - BLOCK
      ?auto_745367 - BLOCK
      ?auto_745368 - BLOCK
      ?auto_745369 - BLOCK
      ?auto_745370 - BLOCK
      ?auto_745371 - BLOCK
      ?auto_745372 - BLOCK
      ?auto_745373 - BLOCK
    )
    :vars
    (
      ?auto_745374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745373 ?auto_745374 ) ( ON-TABLE ?auto_745358 ) ( ON ?auto_745359 ?auto_745358 ) ( ON ?auto_745360 ?auto_745359 ) ( ON ?auto_745361 ?auto_745360 ) ( ON ?auto_745362 ?auto_745361 ) ( ON ?auto_745363 ?auto_745362 ) ( ON ?auto_745364 ?auto_745363 ) ( ON ?auto_745365 ?auto_745364 ) ( not ( = ?auto_745358 ?auto_745359 ) ) ( not ( = ?auto_745358 ?auto_745360 ) ) ( not ( = ?auto_745358 ?auto_745361 ) ) ( not ( = ?auto_745358 ?auto_745362 ) ) ( not ( = ?auto_745358 ?auto_745363 ) ) ( not ( = ?auto_745358 ?auto_745364 ) ) ( not ( = ?auto_745358 ?auto_745365 ) ) ( not ( = ?auto_745358 ?auto_745366 ) ) ( not ( = ?auto_745358 ?auto_745367 ) ) ( not ( = ?auto_745358 ?auto_745368 ) ) ( not ( = ?auto_745358 ?auto_745369 ) ) ( not ( = ?auto_745358 ?auto_745370 ) ) ( not ( = ?auto_745358 ?auto_745371 ) ) ( not ( = ?auto_745358 ?auto_745372 ) ) ( not ( = ?auto_745358 ?auto_745373 ) ) ( not ( = ?auto_745358 ?auto_745374 ) ) ( not ( = ?auto_745359 ?auto_745360 ) ) ( not ( = ?auto_745359 ?auto_745361 ) ) ( not ( = ?auto_745359 ?auto_745362 ) ) ( not ( = ?auto_745359 ?auto_745363 ) ) ( not ( = ?auto_745359 ?auto_745364 ) ) ( not ( = ?auto_745359 ?auto_745365 ) ) ( not ( = ?auto_745359 ?auto_745366 ) ) ( not ( = ?auto_745359 ?auto_745367 ) ) ( not ( = ?auto_745359 ?auto_745368 ) ) ( not ( = ?auto_745359 ?auto_745369 ) ) ( not ( = ?auto_745359 ?auto_745370 ) ) ( not ( = ?auto_745359 ?auto_745371 ) ) ( not ( = ?auto_745359 ?auto_745372 ) ) ( not ( = ?auto_745359 ?auto_745373 ) ) ( not ( = ?auto_745359 ?auto_745374 ) ) ( not ( = ?auto_745360 ?auto_745361 ) ) ( not ( = ?auto_745360 ?auto_745362 ) ) ( not ( = ?auto_745360 ?auto_745363 ) ) ( not ( = ?auto_745360 ?auto_745364 ) ) ( not ( = ?auto_745360 ?auto_745365 ) ) ( not ( = ?auto_745360 ?auto_745366 ) ) ( not ( = ?auto_745360 ?auto_745367 ) ) ( not ( = ?auto_745360 ?auto_745368 ) ) ( not ( = ?auto_745360 ?auto_745369 ) ) ( not ( = ?auto_745360 ?auto_745370 ) ) ( not ( = ?auto_745360 ?auto_745371 ) ) ( not ( = ?auto_745360 ?auto_745372 ) ) ( not ( = ?auto_745360 ?auto_745373 ) ) ( not ( = ?auto_745360 ?auto_745374 ) ) ( not ( = ?auto_745361 ?auto_745362 ) ) ( not ( = ?auto_745361 ?auto_745363 ) ) ( not ( = ?auto_745361 ?auto_745364 ) ) ( not ( = ?auto_745361 ?auto_745365 ) ) ( not ( = ?auto_745361 ?auto_745366 ) ) ( not ( = ?auto_745361 ?auto_745367 ) ) ( not ( = ?auto_745361 ?auto_745368 ) ) ( not ( = ?auto_745361 ?auto_745369 ) ) ( not ( = ?auto_745361 ?auto_745370 ) ) ( not ( = ?auto_745361 ?auto_745371 ) ) ( not ( = ?auto_745361 ?auto_745372 ) ) ( not ( = ?auto_745361 ?auto_745373 ) ) ( not ( = ?auto_745361 ?auto_745374 ) ) ( not ( = ?auto_745362 ?auto_745363 ) ) ( not ( = ?auto_745362 ?auto_745364 ) ) ( not ( = ?auto_745362 ?auto_745365 ) ) ( not ( = ?auto_745362 ?auto_745366 ) ) ( not ( = ?auto_745362 ?auto_745367 ) ) ( not ( = ?auto_745362 ?auto_745368 ) ) ( not ( = ?auto_745362 ?auto_745369 ) ) ( not ( = ?auto_745362 ?auto_745370 ) ) ( not ( = ?auto_745362 ?auto_745371 ) ) ( not ( = ?auto_745362 ?auto_745372 ) ) ( not ( = ?auto_745362 ?auto_745373 ) ) ( not ( = ?auto_745362 ?auto_745374 ) ) ( not ( = ?auto_745363 ?auto_745364 ) ) ( not ( = ?auto_745363 ?auto_745365 ) ) ( not ( = ?auto_745363 ?auto_745366 ) ) ( not ( = ?auto_745363 ?auto_745367 ) ) ( not ( = ?auto_745363 ?auto_745368 ) ) ( not ( = ?auto_745363 ?auto_745369 ) ) ( not ( = ?auto_745363 ?auto_745370 ) ) ( not ( = ?auto_745363 ?auto_745371 ) ) ( not ( = ?auto_745363 ?auto_745372 ) ) ( not ( = ?auto_745363 ?auto_745373 ) ) ( not ( = ?auto_745363 ?auto_745374 ) ) ( not ( = ?auto_745364 ?auto_745365 ) ) ( not ( = ?auto_745364 ?auto_745366 ) ) ( not ( = ?auto_745364 ?auto_745367 ) ) ( not ( = ?auto_745364 ?auto_745368 ) ) ( not ( = ?auto_745364 ?auto_745369 ) ) ( not ( = ?auto_745364 ?auto_745370 ) ) ( not ( = ?auto_745364 ?auto_745371 ) ) ( not ( = ?auto_745364 ?auto_745372 ) ) ( not ( = ?auto_745364 ?auto_745373 ) ) ( not ( = ?auto_745364 ?auto_745374 ) ) ( not ( = ?auto_745365 ?auto_745366 ) ) ( not ( = ?auto_745365 ?auto_745367 ) ) ( not ( = ?auto_745365 ?auto_745368 ) ) ( not ( = ?auto_745365 ?auto_745369 ) ) ( not ( = ?auto_745365 ?auto_745370 ) ) ( not ( = ?auto_745365 ?auto_745371 ) ) ( not ( = ?auto_745365 ?auto_745372 ) ) ( not ( = ?auto_745365 ?auto_745373 ) ) ( not ( = ?auto_745365 ?auto_745374 ) ) ( not ( = ?auto_745366 ?auto_745367 ) ) ( not ( = ?auto_745366 ?auto_745368 ) ) ( not ( = ?auto_745366 ?auto_745369 ) ) ( not ( = ?auto_745366 ?auto_745370 ) ) ( not ( = ?auto_745366 ?auto_745371 ) ) ( not ( = ?auto_745366 ?auto_745372 ) ) ( not ( = ?auto_745366 ?auto_745373 ) ) ( not ( = ?auto_745366 ?auto_745374 ) ) ( not ( = ?auto_745367 ?auto_745368 ) ) ( not ( = ?auto_745367 ?auto_745369 ) ) ( not ( = ?auto_745367 ?auto_745370 ) ) ( not ( = ?auto_745367 ?auto_745371 ) ) ( not ( = ?auto_745367 ?auto_745372 ) ) ( not ( = ?auto_745367 ?auto_745373 ) ) ( not ( = ?auto_745367 ?auto_745374 ) ) ( not ( = ?auto_745368 ?auto_745369 ) ) ( not ( = ?auto_745368 ?auto_745370 ) ) ( not ( = ?auto_745368 ?auto_745371 ) ) ( not ( = ?auto_745368 ?auto_745372 ) ) ( not ( = ?auto_745368 ?auto_745373 ) ) ( not ( = ?auto_745368 ?auto_745374 ) ) ( not ( = ?auto_745369 ?auto_745370 ) ) ( not ( = ?auto_745369 ?auto_745371 ) ) ( not ( = ?auto_745369 ?auto_745372 ) ) ( not ( = ?auto_745369 ?auto_745373 ) ) ( not ( = ?auto_745369 ?auto_745374 ) ) ( not ( = ?auto_745370 ?auto_745371 ) ) ( not ( = ?auto_745370 ?auto_745372 ) ) ( not ( = ?auto_745370 ?auto_745373 ) ) ( not ( = ?auto_745370 ?auto_745374 ) ) ( not ( = ?auto_745371 ?auto_745372 ) ) ( not ( = ?auto_745371 ?auto_745373 ) ) ( not ( = ?auto_745371 ?auto_745374 ) ) ( not ( = ?auto_745372 ?auto_745373 ) ) ( not ( = ?auto_745372 ?auto_745374 ) ) ( not ( = ?auto_745373 ?auto_745374 ) ) ( ON ?auto_745372 ?auto_745373 ) ( ON ?auto_745371 ?auto_745372 ) ( ON ?auto_745370 ?auto_745371 ) ( ON ?auto_745369 ?auto_745370 ) ( ON ?auto_745368 ?auto_745369 ) ( ON ?auto_745367 ?auto_745368 ) ( CLEAR ?auto_745365 ) ( ON ?auto_745366 ?auto_745367 ) ( CLEAR ?auto_745366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_745358 ?auto_745359 ?auto_745360 ?auto_745361 ?auto_745362 ?auto_745363 ?auto_745364 ?auto_745365 ?auto_745366 )
      ( MAKE-16PILE ?auto_745358 ?auto_745359 ?auto_745360 ?auto_745361 ?auto_745362 ?auto_745363 ?auto_745364 ?auto_745365 ?auto_745366 ?auto_745367 ?auto_745368 ?auto_745369 ?auto_745370 ?auto_745371 ?auto_745372 ?auto_745373 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745424 - BLOCK
      ?auto_745425 - BLOCK
      ?auto_745426 - BLOCK
      ?auto_745427 - BLOCK
      ?auto_745428 - BLOCK
      ?auto_745429 - BLOCK
      ?auto_745430 - BLOCK
      ?auto_745431 - BLOCK
      ?auto_745432 - BLOCK
      ?auto_745433 - BLOCK
      ?auto_745434 - BLOCK
      ?auto_745435 - BLOCK
      ?auto_745436 - BLOCK
      ?auto_745437 - BLOCK
      ?auto_745438 - BLOCK
      ?auto_745439 - BLOCK
    )
    :vars
    (
      ?auto_745440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745439 ?auto_745440 ) ( ON-TABLE ?auto_745424 ) ( ON ?auto_745425 ?auto_745424 ) ( ON ?auto_745426 ?auto_745425 ) ( ON ?auto_745427 ?auto_745426 ) ( ON ?auto_745428 ?auto_745427 ) ( ON ?auto_745429 ?auto_745428 ) ( ON ?auto_745430 ?auto_745429 ) ( not ( = ?auto_745424 ?auto_745425 ) ) ( not ( = ?auto_745424 ?auto_745426 ) ) ( not ( = ?auto_745424 ?auto_745427 ) ) ( not ( = ?auto_745424 ?auto_745428 ) ) ( not ( = ?auto_745424 ?auto_745429 ) ) ( not ( = ?auto_745424 ?auto_745430 ) ) ( not ( = ?auto_745424 ?auto_745431 ) ) ( not ( = ?auto_745424 ?auto_745432 ) ) ( not ( = ?auto_745424 ?auto_745433 ) ) ( not ( = ?auto_745424 ?auto_745434 ) ) ( not ( = ?auto_745424 ?auto_745435 ) ) ( not ( = ?auto_745424 ?auto_745436 ) ) ( not ( = ?auto_745424 ?auto_745437 ) ) ( not ( = ?auto_745424 ?auto_745438 ) ) ( not ( = ?auto_745424 ?auto_745439 ) ) ( not ( = ?auto_745424 ?auto_745440 ) ) ( not ( = ?auto_745425 ?auto_745426 ) ) ( not ( = ?auto_745425 ?auto_745427 ) ) ( not ( = ?auto_745425 ?auto_745428 ) ) ( not ( = ?auto_745425 ?auto_745429 ) ) ( not ( = ?auto_745425 ?auto_745430 ) ) ( not ( = ?auto_745425 ?auto_745431 ) ) ( not ( = ?auto_745425 ?auto_745432 ) ) ( not ( = ?auto_745425 ?auto_745433 ) ) ( not ( = ?auto_745425 ?auto_745434 ) ) ( not ( = ?auto_745425 ?auto_745435 ) ) ( not ( = ?auto_745425 ?auto_745436 ) ) ( not ( = ?auto_745425 ?auto_745437 ) ) ( not ( = ?auto_745425 ?auto_745438 ) ) ( not ( = ?auto_745425 ?auto_745439 ) ) ( not ( = ?auto_745425 ?auto_745440 ) ) ( not ( = ?auto_745426 ?auto_745427 ) ) ( not ( = ?auto_745426 ?auto_745428 ) ) ( not ( = ?auto_745426 ?auto_745429 ) ) ( not ( = ?auto_745426 ?auto_745430 ) ) ( not ( = ?auto_745426 ?auto_745431 ) ) ( not ( = ?auto_745426 ?auto_745432 ) ) ( not ( = ?auto_745426 ?auto_745433 ) ) ( not ( = ?auto_745426 ?auto_745434 ) ) ( not ( = ?auto_745426 ?auto_745435 ) ) ( not ( = ?auto_745426 ?auto_745436 ) ) ( not ( = ?auto_745426 ?auto_745437 ) ) ( not ( = ?auto_745426 ?auto_745438 ) ) ( not ( = ?auto_745426 ?auto_745439 ) ) ( not ( = ?auto_745426 ?auto_745440 ) ) ( not ( = ?auto_745427 ?auto_745428 ) ) ( not ( = ?auto_745427 ?auto_745429 ) ) ( not ( = ?auto_745427 ?auto_745430 ) ) ( not ( = ?auto_745427 ?auto_745431 ) ) ( not ( = ?auto_745427 ?auto_745432 ) ) ( not ( = ?auto_745427 ?auto_745433 ) ) ( not ( = ?auto_745427 ?auto_745434 ) ) ( not ( = ?auto_745427 ?auto_745435 ) ) ( not ( = ?auto_745427 ?auto_745436 ) ) ( not ( = ?auto_745427 ?auto_745437 ) ) ( not ( = ?auto_745427 ?auto_745438 ) ) ( not ( = ?auto_745427 ?auto_745439 ) ) ( not ( = ?auto_745427 ?auto_745440 ) ) ( not ( = ?auto_745428 ?auto_745429 ) ) ( not ( = ?auto_745428 ?auto_745430 ) ) ( not ( = ?auto_745428 ?auto_745431 ) ) ( not ( = ?auto_745428 ?auto_745432 ) ) ( not ( = ?auto_745428 ?auto_745433 ) ) ( not ( = ?auto_745428 ?auto_745434 ) ) ( not ( = ?auto_745428 ?auto_745435 ) ) ( not ( = ?auto_745428 ?auto_745436 ) ) ( not ( = ?auto_745428 ?auto_745437 ) ) ( not ( = ?auto_745428 ?auto_745438 ) ) ( not ( = ?auto_745428 ?auto_745439 ) ) ( not ( = ?auto_745428 ?auto_745440 ) ) ( not ( = ?auto_745429 ?auto_745430 ) ) ( not ( = ?auto_745429 ?auto_745431 ) ) ( not ( = ?auto_745429 ?auto_745432 ) ) ( not ( = ?auto_745429 ?auto_745433 ) ) ( not ( = ?auto_745429 ?auto_745434 ) ) ( not ( = ?auto_745429 ?auto_745435 ) ) ( not ( = ?auto_745429 ?auto_745436 ) ) ( not ( = ?auto_745429 ?auto_745437 ) ) ( not ( = ?auto_745429 ?auto_745438 ) ) ( not ( = ?auto_745429 ?auto_745439 ) ) ( not ( = ?auto_745429 ?auto_745440 ) ) ( not ( = ?auto_745430 ?auto_745431 ) ) ( not ( = ?auto_745430 ?auto_745432 ) ) ( not ( = ?auto_745430 ?auto_745433 ) ) ( not ( = ?auto_745430 ?auto_745434 ) ) ( not ( = ?auto_745430 ?auto_745435 ) ) ( not ( = ?auto_745430 ?auto_745436 ) ) ( not ( = ?auto_745430 ?auto_745437 ) ) ( not ( = ?auto_745430 ?auto_745438 ) ) ( not ( = ?auto_745430 ?auto_745439 ) ) ( not ( = ?auto_745430 ?auto_745440 ) ) ( not ( = ?auto_745431 ?auto_745432 ) ) ( not ( = ?auto_745431 ?auto_745433 ) ) ( not ( = ?auto_745431 ?auto_745434 ) ) ( not ( = ?auto_745431 ?auto_745435 ) ) ( not ( = ?auto_745431 ?auto_745436 ) ) ( not ( = ?auto_745431 ?auto_745437 ) ) ( not ( = ?auto_745431 ?auto_745438 ) ) ( not ( = ?auto_745431 ?auto_745439 ) ) ( not ( = ?auto_745431 ?auto_745440 ) ) ( not ( = ?auto_745432 ?auto_745433 ) ) ( not ( = ?auto_745432 ?auto_745434 ) ) ( not ( = ?auto_745432 ?auto_745435 ) ) ( not ( = ?auto_745432 ?auto_745436 ) ) ( not ( = ?auto_745432 ?auto_745437 ) ) ( not ( = ?auto_745432 ?auto_745438 ) ) ( not ( = ?auto_745432 ?auto_745439 ) ) ( not ( = ?auto_745432 ?auto_745440 ) ) ( not ( = ?auto_745433 ?auto_745434 ) ) ( not ( = ?auto_745433 ?auto_745435 ) ) ( not ( = ?auto_745433 ?auto_745436 ) ) ( not ( = ?auto_745433 ?auto_745437 ) ) ( not ( = ?auto_745433 ?auto_745438 ) ) ( not ( = ?auto_745433 ?auto_745439 ) ) ( not ( = ?auto_745433 ?auto_745440 ) ) ( not ( = ?auto_745434 ?auto_745435 ) ) ( not ( = ?auto_745434 ?auto_745436 ) ) ( not ( = ?auto_745434 ?auto_745437 ) ) ( not ( = ?auto_745434 ?auto_745438 ) ) ( not ( = ?auto_745434 ?auto_745439 ) ) ( not ( = ?auto_745434 ?auto_745440 ) ) ( not ( = ?auto_745435 ?auto_745436 ) ) ( not ( = ?auto_745435 ?auto_745437 ) ) ( not ( = ?auto_745435 ?auto_745438 ) ) ( not ( = ?auto_745435 ?auto_745439 ) ) ( not ( = ?auto_745435 ?auto_745440 ) ) ( not ( = ?auto_745436 ?auto_745437 ) ) ( not ( = ?auto_745436 ?auto_745438 ) ) ( not ( = ?auto_745436 ?auto_745439 ) ) ( not ( = ?auto_745436 ?auto_745440 ) ) ( not ( = ?auto_745437 ?auto_745438 ) ) ( not ( = ?auto_745437 ?auto_745439 ) ) ( not ( = ?auto_745437 ?auto_745440 ) ) ( not ( = ?auto_745438 ?auto_745439 ) ) ( not ( = ?auto_745438 ?auto_745440 ) ) ( not ( = ?auto_745439 ?auto_745440 ) ) ( ON ?auto_745438 ?auto_745439 ) ( ON ?auto_745437 ?auto_745438 ) ( ON ?auto_745436 ?auto_745437 ) ( ON ?auto_745435 ?auto_745436 ) ( ON ?auto_745434 ?auto_745435 ) ( ON ?auto_745433 ?auto_745434 ) ( ON ?auto_745432 ?auto_745433 ) ( CLEAR ?auto_745430 ) ( ON ?auto_745431 ?auto_745432 ) ( CLEAR ?auto_745431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_745424 ?auto_745425 ?auto_745426 ?auto_745427 ?auto_745428 ?auto_745429 ?auto_745430 ?auto_745431 )
      ( MAKE-16PILE ?auto_745424 ?auto_745425 ?auto_745426 ?auto_745427 ?auto_745428 ?auto_745429 ?auto_745430 ?auto_745431 ?auto_745432 ?auto_745433 ?auto_745434 ?auto_745435 ?auto_745436 ?auto_745437 ?auto_745438 ?auto_745439 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745490 - BLOCK
      ?auto_745491 - BLOCK
      ?auto_745492 - BLOCK
      ?auto_745493 - BLOCK
      ?auto_745494 - BLOCK
      ?auto_745495 - BLOCK
      ?auto_745496 - BLOCK
      ?auto_745497 - BLOCK
      ?auto_745498 - BLOCK
      ?auto_745499 - BLOCK
      ?auto_745500 - BLOCK
      ?auto_745501 - BLOCK
      ?auto_745502 - BLOCK
      ?auto_745503 - BLOCK
      ?auto_745504 - BLOCK
      ?auto_745505 - BLOCK
    )
    :vars
    (
      ?auto_745506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745505 ?auto_745506 ) ( ON-TABLE ?auto_745490 ) ( ON ?auto_745491 ?auto_745490 ) ( ON ?auto_745492 ?auto_745491 ) ( ON ?auto_745493 ?auto_745492 ) ( ON ?auto_745494 ?auto_745493 ) ( ON ?auto_745495 ?auto_745494 ) ( not ( = ?auto_745490 ?auto_745491 ) ) ( not ( = ?auto_745490 ?auto_745492 ) ) ( not ( = ?auto_745490 ?auto_745493 ) ) ( not ( = ?auto_745490 ?auto_745494 ) ) ( not ( = ?auto_745490 ?auto_745495 ) ) ( not ( = ?auto_745490 ?auto_745496 ) ) ( not ( = ?auto_745490 ?auto_745497 ) ) ( not ( = ?auto_745490 ?auto_745498 ) ) ( not ( = ?auto_745490 ?auto_745499 ) ) ( not ( = ?auto_745490 ?auto_745500 ) ) ( not ( = ?auto_745490 ?auto_745501 ) ) ( not ( = ?auto_745490 ?auto_745502 ) ) ( not ( = ?auto_745490 ?auto_745503 ) ) ( not ( = ?auto_745490 ?auto_745504 ) ) ( not ( = ?auto_745490 ?auto_745505 ) ) ( not ( = ?auto_745490 ?auto_745506 ) ) ( not ( = ?auto_745491 ?auto_745492 ) ) ( not ( = ?auto_745491 ?auto_745493 ) ) ( not ( = ?auto_745491 ?auto_745494 ) ) ( not ( = ?auto_745491 ?auto_745495 ) ) ( not ( = ?auto_745491 ?auto_745496 ) ) ( not ( = ?auto_745491 ?auto_745497 ) ) ( not ( = ?auto_745491 ?auto_745498 ) ) ( not ( = ?auto_745491 ?auto_745499 ) ) ( not ( = ?auto_745491 ?auto_745500 ) ) ( not ( = ?auto_745491 ?auto_745501 ) ) ( not ( = ?auto_745491 ?auto_745502 ) ) ( not ( = ?auto_745491 ?auto_745503 ) ) ( not ( = ?auto_745491 ?auto_745504 ) ) ( not ( = ?auto_745491 ?auto_745505 ) ) ( not ( = ?auto_745491 ?auto_745506 ) ) ( not ( = ?auto_745492 ?auto_745493 ) ) ( not ( = ?auto_745492 ?auto_745494 ) ) ( not ( = ?auto_745492 ?auto_745495 ) ) ( not ( = ?auto_745492 ?auto_745496 ) ) ( not ( = ?auto_745492 ?auto_745497 ) ) ( not ( = ?auto_745492 ?auto_745498 ) ) ( not ( = ?auto_745492 ?auto_745499 ) ) ( not ( = ?auto_745492 ?auto_745500 ) ) ( not ( = ?auto_745492 ?auto_745501 ) ) ( not ( = ?auto_745492 ?auto_745502 ) ) ( not ( = ?auto_745492 ?auto_745503 ) ) ( not ( = ?auto_745492 ?auto_745504 ) ) ( not ( = ?auto_745492 ?auto_745505 ) ) ( not ( = ?auto_745492 ?auto_745506 ) ) ( not ( = ?auto_745493 ?auto_745494 ) ) ( not ( = ?auto_745493 ?auto_745495 ) ) ( not ( = ?auto_745493 ?auto_745496 ) ) ( not ( = ?auto_745493 ?auto_745497 ) ) ( not ( = ?auto_745493 ?auto_745498 ) ) ( not ( = ?auto_745493 ?auto_745499 ) ) ( not ( = ?auto_745493 ?auto_745500 ) ) ( not ( = ?auto_745493 ?auto_745501 ) ) ( not ( = ?auto_745493 ?auto_745502 ) ) ( not ( = ?auto_745493 ?auto_745503 ) ) ( not ( = ?auto_745493 ?auto_745504 ) ) ( not ( = ?auto_745493 ?auto_745505 ) ) ( not ( = ?auto_745493 ?auto_745506 ) ) ( not ( = ?auto_745494 ?auto_745495 ) ) ( not ( = ?auto_745494 ?auto_745496 ) ) ( not ( = ?auto_745494 ?auto_745497 ) ) ( not ( = ?auto_745494 ?auto_745498 ) ) ( not ( = ?auto_745494 ?auto_745499 ) ) ( not ( = ?auto_745494 ?auto_745500 ) ) ( not ( = ?auto_745494 ?auto_745501 ) ) ( not ( = ?auto_745494 ?auto_745502 ) ) ( not ( = ?auto_745494 ?auto_745503 ) ) ( not ( = ?auto_745494 ?auto_745504 ) ) ( not ( = ?auto_745494 ?auto_745505 ) ) ( not ( = ?auto_745494 ?auto_745506 ) ) ( not ( = ?auto_745495 ?auto_745496 ) ) ( not ( = ?auto_745495 ?auto_745497 ) ) ( not ( = ?auto_745495 ?auto_745498 ) ) ( not ( = ?auto_745495 ?auto_745499 ) ) ( not ( = ?auto_745495 ?auto_745500 ) ) ( not ( = ?auto_745495 ?auto_745501 ) ) ( not ( = ?auto_745495 ?auto_745502 ) ) ( not ( = ?auto_745495 ?auto_745503 ) ) ( not ( = ?auto_745495 ?auto_745504 ) ) ( not ( = ?auto_745495 ?auto_745505 ) ) ( not ( = ?auto_745495 ?auto_745506 ) ) ( not ( = ?auto_745496 ?auto_745497 ) ) ( not ( = ?auto_745496 ?auto_745498 ) ) ( not ( = ?auto_745496 ?auto_745499 ) ) ( not ( = ?auto_745496 ?auto_745500 ) ) ( not ( = ?auto_745496 ?auto_745501 ) ) ( not ( = ?auto_745496 ?auto_745502 ) ) ( not ( = ?auto_745496 ?auto_745503 ) ) ( not ( = ?auto_745496 ?auto_745504 ) ) ( not ( = ?auto_745496 ?auto_745505 ) ) ( not ( = ?auto_745496 ?auto_745506 ) ) ( not ( = ?auto_745497 ?auto_745498 ) ) ( not ( = ?auto_745497 ?auto_745499 ) ) ( not ( = ?auto_745497 ?auto_745500 ) ) ( not ( = ?auto_745497 ?auto_745501 ) ) ( not ( = ?auto_745497 ?auto_745502 ) ) ( not ( = ?auto_745497 ?auto_745503 ) ) ( not ( = ?auto_745497 ?auto_745504 ) ) ( not ( = ?auto_745497 ?auto_745505 ) ) ( not ( = ?auto_745497 ?auto_745506 ) ) ( not ( = ?auto_745498 ?auto_745499 ) ) ( not ( = ?auto_745498 ?auto_745500 ) ) ( not ( = ?auto_745498 ?auto_745501 ) ) ( not ( = ?auto_745498 ?auto_745502 ) ) ( not ( = ?auto_745498 ?auto_745503 ) ) ( not ( = ?auto_745498 ?auto_745504 ) ) ( not ( = ?auto_745498 ?auto_745505 ) ) ( not ( = ?auto_745498 ?auto_745506 ) ) ( not ( = ?auto_745499 ?auto_745500 ) ) ( not ( = ?auto_745499 ?auto_745501 ) ) ( not ( = ?auto_745499 ?auto_745502 ) ) ( not ( = ?auto_745499 ?auto_745503 ) ) ( not ( = ?auto_745499 ?auto_745504 ) ) ( not ( = ?auto_745499 ?auto_745505 ) ) ( not ( = ?auto_745499 ?auto_745506 ) ) ( not ( = ?auto_745500 ?auto_745501 ) ) ( not ( = ?auto_745500 ?auto_745502 ) ) ( not ( = ?auto_745500 ?auto_745503 ) ) ( not ( = ?auto_745500 ?auto_745504 ) ) ( not ( = ?auto_745500 ?auto_745505 ) ) ( not ( = ?auto_745500 ?auto_745506 ) ) ( not ( = ?auto_745501 ?auto_745502 ) ) ( not ( = ?auto_745501 ?auto_745503 ) ) ( not ( = ?auto_745501 ?auto_745504 ) ) ( not ( = ?auto_745501 ?auto_745505 ) ) ( not ( = ?auto_745501 ?auto_745506 ) ) ( not ( = ?auto_745502 ?auto_745503 ) ) ( not ( = ?auto_745502 ?auto_745504 ) ) ( not ( = ?auto_745502 ?auto_745505 ) ) ( not ( = ?auto_745502 ?auto_745506 ) ) ( not ( = ?auto_745503 ?auto_745504 ) ) ( not ( = ?auto_745503 ?auto_745505 ) ) ( not ( = ?auto_745503 ?auto_745506 ) ) ( not ( = ?auto_745504 ?auto_745505 ) ) ( not ( = ?auto_745504 ?auto_745506 ) ) ( not ( = ?auto_745505 ?auto_745506 ) ) ( ON ?auto_745504 ?auto_745505 ) ( ON ?auto_745503 ?auto_745504 ) ( ON ?auto_745502 ?auto_745503 ) ( ON ?auto_745501 ?auto_745502 ) ( ON ?auto_745500 ?auto_745501 ) ( ON ?auto_745499 ?auto_745500 ) ( ON ?auto_745498 ?auto_745499 ) ( ON ?auto_745497 ?auto_745498 ) ( CLEAR ?auto_745495 ) ( ON ?auto_745496 ?auto_745497 ) ( CLEAR ?auto_745496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_745490 ?auto_745491 ?auto_745492 ?auto_745493 ?auto_745494 ?auto_745495 ?auto_745496 )
      ( MAKE-16PILE ?auto_745490 ?auto_745491 ?auto_745492 ?auto_745493 ?auto_745494 ?auto_745495 ?auto_745496 ?auto_745497 ?auto_745498 ?auto_745499 ?auto_745500 ?auto_745501 ?auto_745502 ?auto_745503 ?auto_745504 ?auto_745505 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745556 - BLOCK
      ?auto_745557 - BLOCK
      ?auto_745558 - BLOCK
      ?auto_745559 - BLOCK
      ?auto_745560 - BLOCK
      ?auto_745561 - BLOCK
      ?auto_745562 - BLOCK
      ?auto_745563 - BLOCK
      ?auto_745564 - BLOCK
      ?auto_745565 - BLOCK
      ?auto_745566 - BLOCK
      ?auto_745567 - BLOCK
      ?auto_745568 - BLOCK
      ?auto_745569 - BLOCK
      ?auto_745570 - BLOCK
      ?auto_745571 - BLOCK
    )
    :vars
    (
      ?auto_745572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745571 ?auto_745572 ) ( ON-TABLE ?auto_745556 ) ( ON ?auto_745557 ?auto_745556 ) ( ON ?auto_745558 ?auto_745557 ) ( ON ?auto_745559 ?auto_745558 ) ( ON ?auto_745560 ?auto_745559 ) ( not ( = ?auto_745556 ?auto_745557 ) ) ( not ( = ?auto_745556 ?auto_745558 ) ) ( not ( = ?auto_745556 ?auto_745559 ) ) ( not ( = ?auto_745556 ?auto_745560 ) ) ( not ( = ?auto_745556 ?auto_745561 ) ) ( not ( = ?auto_745556 ?auto_745562 ) ) ( not ( = ?auto_745556 ?auto_745563 ) ) ( not ( = ?auto_745556 ?auto_745564 ) ) ( not ( = ?auto_745556 ?auto_745565 ) ) ( not ( = ?auto_745556 ?auto_745566 ) ) ( not ( = ?auto_745556 ?auto_745567 ) ) ( not ( = ?auto_745556 ?auto_745568 ) ) ( not ( = ?auto_745556 ?auto_745569 ) ) ( not ( = ?auto_745556 ?auto_745570 ) ) ( not ( = ?auto_745556 ?auto_745571 ) ) ( not ( = ?auto_745556 ?auto_745572 ) ) ( not ( = ?auto_745557 ?auto_745558 ) ) ( not ( = ?auto_745557 ?auto_745559 ) ) ( not ( = ?auto_745557 ?auto_745560 ) ) ( not ( = ?auto_745557 ?auto_745561 ) ) ( not ( = ?auto_745557 ?auto_745562 ) ) ( not ( = ?auto_745557 ?auto_745563 ) ) ( not ( = ?auto_745557 ?auto_745564 ) ) ( not ( = ?auto_745557 ?auto_745565 ) ) ( not ( = ?auto_745557 ?auto_745566 ) ) ( not ( = ?auto_745557 ?auto_745567 ) ) ( not ( = ?auto_745557 ?auto_745568 ) ) ( not ( = ?auto_745557 ?auto_745569 ) ) ( not ( = ?auto_745557 ?auto_745570 ) ) ( not ( = ?auto_745557 ?auto_745571 ) ) ( not ( = ?auto_745557 ?auto_745572 ) ) ( not ( = ?auto_745558 ?auto_745559 ) ) ( not ( = ?auto_745558 ?auto_745560 ) ) ( not ( = ?auto_745558 ?auto_745561 ) ) ( not ( = ?auto_745558 ?auto_745562 ) ) ( not ( = ?auto_745558 ?auto_745563 ) ) ( not ( = ?auto_745558 ?auto_745564 ) ) ( not ( = ?auto_745558 ?auto_745565 ) ) ( not ( = ?auto_745558 ?auto_745566 ) ) ( not ( = ?auto_745558 ?auto_745567 ) ) ( not ( = ?auto_745558 ?auto_745568 ) ) ( not ( = ?auto_745558 ?auto_745569 ) ) ( not ( = ?auto_745558 ?auto_745570 ) ) ( not ( = ?auto_745558 ?auto_745571 ) ) ( not ( = ?auto_745558 ?auto_745572 ) ) ( not ( = ?auto_745559 ?auto_745560 ) ) ( not ( = ?auto_745559 ?auto_745561 ) ) ( not ( = ?auto_745559 ?auto_745562 ) ) ( not ( = ?auto_745559 ?auto_745563 ) ) ( not ( = ?auto_745559 ?auto_745564 ) ) ( not ( = ?auto_745559 ?auto_745565 ) ) ( not ( = ?auto_745559 ?auto_745566 ) ) ( not ( = ?auto_745559 ?auto_745567 ) ) ( not ( = ?auto_745559 ?auto_745568 ) ) ( not ( = ?auto_745559 ?auto_745569 ) ) ( not ( = ?auto_745559 ?auto_745570 ) ) ( not ( = ?auto_745559 ?auto_745571 ) ) ( not ( = ?auto_745559 ?auto_745572 ) ) ( not ( = ?auto_745560 ?auto_745561 ) ) ( not ( = ?auto_745560 ?auto_745562 ) ) ( not ( = ?auto_745560 ?auto_745563 ) ) ( not ( = ?auto_745560 ?auto_745564 ) ) ( not ( = ?auto_745560 ?auto_745565 ) ) ( not ( = ?auto_745560 ?auto_745566 ) ) ( not ( = ?auto_745560 ?auto_745567 ) ) ( not ( = ?auto_745560 ?auto_745568 ) ) ( not ( = ?auto_745560 ?auto_745569 ) ) ( not ( = ?auto_745560 ?auto_745570 ) ) ( not ( = ?auto_745560 ?auto_745571 ) ) ( not ( = ?auto_745560 ?auto_745572 ) ) ( not ( = ?auto_745561 ?auto_745562 ) ) ( not ( = ?auto_745561 ?auto_745563 ) ) ( not ( = ?auto_745561 ?auto_745564 ) ) ( not ( = ?auto_745561 ?auto_745565 ) ) ( not ( = ?auto_745561 ?auto_745566 ) ) ( not ( = ?auto_745561 ?auto_745567 ) ) ( not ( = ?auto_745561 ?auto_745568 ) ) ( not ( = ?auto_745561 ?auto_745569 ) ) ( not ( = ?auto_745561 ?auto_745570 ) ) ( not ( = ?auto_745561 ?auto_745571 ) ) ( not ( = ?auto_745561 ?auto_745572 ) ) ( not ( = ?auto_745562 ?auto_745563 ) ) ( not ( = ?auto_745562 ?auto_745564 ) ) ( not ( = ?auto_745562 ?auto_745565 ) ) ( not ( = ?auto_745562 ?auto_745566 ) ) ( not ( = ?auto_745562 ?auto_745567 ) ) ( not ( = ?auto_745562 ?auto_745568 ) ) ( not ( = ?auto_745562 ?auto_745569 ) ) ( not ( = ?auto_745562 ?auto_745570 ) ) ( not ( = ?auto_745562 ?auto_745571 ) ) ( not ( = ?auto_745562 ?auto_745572 ) ) ( not ( = ?auto_745563 ?auto_745564 ) ) ( not ( = ?auto_745563 ?auto_745565 ) ) ( not ( = ?auto_745563 ?auto_745566 ) ) ( not ( = ?auto_745563 ?auto_745567 ) ) ( not ( = ?auto_745563 ?auto_745568 ) ) ( not ( = ?auto_745563 ?auto_745569 ) ) ( not ( = ?auto_745563 ?auto_745570 ) ) ( not ( = ?auto_745563 ?auto_745571 ) ) ( not ( = ?auto_745563 ?auto_745572 ) ) ( not ( = ?auto_745564 ?auto_745565 ) ) ( not ( = ?auto_745564 ?auto_745566 ) ) ( not ( = ?auto_745564 ?auto_745567 ) ) ( not ( = ?auto_745564 ?auto_745568 ) ) ( not ( = ?auto_745564 ?auto_745569 ) ) ( not ( = ?auto_745564 ?auto_745570 ) ) ( not ( = ?auto_745564 ?auto_745571 ) ) ( not ( = ?auto_745564 ?auto_745572 ) ) ( not ( = ?auto_745565 ?auto_745566 ) ) ( not ( = ?auto_745565 ?auto_745567 ) ) ( not ( = ?auto_745565 ?auto_745568 ) ) ( not ( = ?auto_745565 ?auto_745569 ) ) ( not ( = ?auto_745565 ?auto_745570 ) ) ( not ( = ?auto_745565 ?auto_745571 ) ) ( not ( = ?auto_745565 ?auto_745572 ) ) ( not ( = ?auto_745566 ?auto_745567 ) ) ( not ( = ?auto_745566 ?auto_745568 ) ) ( not ( = ?auto_745566 ?auto_745569 ) ) ( not ( = ?auto_745566 ?auto_745570 ) ) ( not ( = ?auto_745566 ?auto_745571 ) ) ( not ( = ?auto_745566 ?auto_745572 ) ) ( not ( = ?auto_745567 ?auto_745568 ) ) ( not ( = ?auto_745567 ?auto_745569 ) ) ( not ( = ?auto_745567 ?auto_745570 ) ) ( not ( = ?auto_745567 ?auto_745571 ) ) ( not ( = ?auto_745567 ?auto_745572 ) ) ( not ( = ?auto_745568 ?auto_745569 ) ) ( not ( = ?auto_745568 ?auto_745570 ) ) ( not ( = ?auto_745568 ?auto_745571 ) ) ( not ( = ?auto_745568 ?auto_745572 ) ) ( not ( = ?auto_745569 ?auto_745570 ) ) ( not ( = ?auto_745569 ?auto_745571 ) ) ( not ( = ?auto_745569 ?auto_745572 ) ) ( not ( = ?auto_745570 ?auto_745571 ) ) ( not ( = ?auto_745570 ?auto_745572 ) ) ( not ( = ?auto_745571 ?auto_745572 ) ) ( ON ?auto_745570 ?auto_745571 ) ( ON ?auto_745569 ?auto_745570 ) ( ON ?auto_745568 ?auto_745569 ) ( ON ?auto_745567 ?auto_745568 ) ( ON ?auto_745566 ?auto_745567 ) ( ON ?auto_745565 ?auto_745566 ) ( ON ?auto_745564 ?auto_745565 ) ( ON ?auto_745563 ?auto_745564 ) ( ON ?auto_745562 ?auto_745563 ) ( CLEAR ?auto_745560 ) ( ON ?auto_745561 ?auto_745562 ) ( CLEAR ?auto_745561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_745556 ?auto_745557 ?auto_745558 ?auto_745559 ?auto_745560 ?auto_745561 )
      ( MAKE-16PILE ?auto_745556 ?auto_745557 ?auto_745558 ?auto_745559 ?auto_745560 ?auto_745561 ?auto_745562 ?auto_745563 ?auto_745564 ?auto_745565 ?auto_745566 ?auto_745567 ?auto_745568 ?auto_745569 ?auto_745570 ?auto_745571 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745622 - BLOCK
      ?auto_745623 - BLOCK
      ?auto_745624 - BLOCK
      ?auto_745625 - BLOCK
      ?auto_745626 - BLOCK
      ?auto_745627 - BLOCK
      ?auto_745628 - BLOCK
      ?auto_745629 - BLOCK
      ?auto_745630 - BLOCK
      ?auto_745631 - BLOCK
      ?auto_745632 - BLOCK
      ?auto_745633 - BLOCK
      ?auto_745634 - BLOCK
      ?auto_745635 - BLOCK
      ?auto_745636 - BLOCK
      ?auto_745637 - BLOCK
    )
    :vars
    (
      ?auto_745638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745637 ?auto_745638 ) ( ON-TABLE ?auto_745622 ) ( ON ?auto_745623 ?auto_745622 ) ( ON ?auto_745624 ?auto_745623 ) ( ON ?auto_745625 ?auto_745624 ) ( not ( = ?auto_745622 ?auto_745623 ) ) ( not ( = ?auto_745622 ?auto_745624 ) ) ( not ( = ?auto_745622 ?auto_745625 ) ) ( not ( = ?auto_745622 ?auto_745626 ) ) ( not ( = ?auto_745622 ?auto_745627 ) ) ( not ( = ?auto_745622 ?auto_745628 ) ) ( not ( = ?auto_745622 ?auto_745629 ) ) ( not ( = ?auto_745622 ?auto_745630 ) ) ( not ( = ?auto_745622 ?auto_745631 ) ) ( not ( = ?auto_745622 ?auto_745632 ) ) ( not ( = ?auto_745622 ?auto_745633 ) ) ( not ( = ?auto_745622 ?auto_745634 ) ) ( not ( = ?auto_745622 ?auto_745635 ) ) ( not ( = ?auto_745622 ?auto_745636 ) ) ( not ( = ?auto_745622 ?auto_745637 ) ) ( not ( = ?auto_745622 ?auto_745638 ) ) ( not ( = ?auto_745623 ?auto_745624 ) ) ( not ( = ?auto_745623 ?auto_745625 ) ) ( not ( = ?auto_745623 ?auto_745626 ) ) ( not ( = ?auto_745623 ?auto_745627 ) ) ( not ( = ?auto_745623 ?auto_745628 ) ) ( not ( = ?auto_745623 ?auto_745629 ) ) ( not ( = ?auto_745623 ?auto_745630 ) ) ( not ( = ?auto_745623 ?auto_745631 ) ) ( not ( = ?auto_745623 ?auto_745632 ) ) ( not ( = ?auto_745623 ?auto_745633 ) ) ( not ( = ?auto_745623 ?auto_745634 ) ) ( not ( = ?auto_745623 ?auto_745635 ) ) ( not ( = ?auto_745623 ?auto_745636 ) ) ( not ( = ?auto_745623 ?auto_745637 ) ) ( not ( = ?auto_745623 ?auto_745638 ) ) ( not ( = ?auto_745624 ?auto_745625 ) ) ( not ( = ?auto_745624 ?auto_745626 ) ) ( not ( = ?auto_745624 ?auto_745627 ) ) ( not ( = ?auto_745624 ?auto_745628 ) ) ( not ( = ?auto_745624 ?auto_745629 ) ) ( not ( = ?auto_745624 ?auto_745630 ) ) ( not ( = ?auto_745624 ?auto_745631 ) ) ( not ( = ?auto_745624 ?auto_745632 ) ) ( not ( = ?auto_745624 ?auto_745633 ) ) ( not ( = ?auto_745624 ?auto_745634 ) ) ( not ( = ?auto_745624 ?auto_745635 ) ) ( not ( = ?auto_745624 ?auto_745636 ) ) ( not ( = ?auto_745624 ?auto_745637 ) ) ( not ( = ?auto_745624 ?auto_745638 ) ) ( not ( = ?auto_745625 ?auto_745626 ) ) ( not ( = ?auto_745625 ?auto_745627 ) ) ( not ( = ?auto_745625 ?auto_745628 ) ) ( not ( = ?auto_745625 ?auto_745629 ) ) ( not ( = ?auto_745625 ?auto_745630 ) ) ( not ( = ?auto_745625 ?auto_745631 ) ) ( not ( = ?auto_745625 ?auto_745632 ) ) ( not ( = ?auto_745625 ?auto_745633 ) ) ( not ( = ?auto_745625 ?auto_745634 ) ) ( not ( = ?auto_745625 ?auto_745635 ) ) ( not ( = ?auto_745625 ?auto_745636 ) ) ( not ( = ?auto_745625 ?auto_745637 ) ) ( not ( = ?auto_745625 ?auto_745638 ) ) ( not ( = ?auto_745626 ?auto_745627 ) ) ( not ( = ?auto_745626 ?auto_745628 ) ) ( not ( = ?auto_745626 ?auto_745629 ) ) ( not ( = ?auto_745626 ?auto_745630 ) ) ( not ( = ?auto_745626 ?auto_745631 ) ) ( not ( = ?auto_745626 ?auto_745632 ) ) ( not ( = ?auto_745626 ?auto_745633 ) ) ( not ( = ?auto_745626 ?auto_745634 ) ) ( not ( = ?auto_745626 ?auto_745635 ) ) ( not ( = ?auto_745626 ?auto_745636 ) ) ( not ( = ?auto_745626 ?auto_745637 ) ) ( not ( = ?auto_745626 ?auto_745638 ) ) ( not ( = ?auto_745627 ?auto_745628 ) ) ( not ( = ?auto_745627 ?auto_745629 ) ) ( not ( = ?auto_745627 ?auto_745630 ) ) ( not ( = ?auto_745627 ?auto_745631 ) ) ( not ( = ?auto_745627 ?auto_745632 ) ) ( not ( = ?auto_745627 ?auto_745633 ) ) ( not ( = ?auto_745627 ?auto_745634 ) ) ( not ( = ?auto_745627 ?auto_745635 ) ) ( not ( = ?auto_745627 ?auto_745636 ) ) ( not ( = ?auto_745627 ?auto_745637 ) ) ( not ( = ?auto_745627 ?auto_745638 ) ) ( not ( = ?auto_745628 ?auto_745629 ) ) ( not ( = ?auto_745628 ?auto_745630 ) ) ( not ( = ?auto_745628 ?auto_745631 ) ) ( not ( = ?auto_745628 ?auto_745632 ) ) ( not ( = ?auto_745628 ?auto_745633 ) ) ( not ( = ?auto_745628 ?auto_745634 ) ) ( not ( = ?auto_745628 ?auto_745635 ) ) ( not ( = ?auto_745628 ?auto_745636 ) ) ( not ( = ?auto_745628 ?auto_745637 ) ) ( not ( = ?auto_745628 ?auto_745638 ) ) ( not ( = ?auto_745629 ?auto_745630 ) ) ( not ( = ?auto_745629 ?auto_745631 ) ) ( not ( = ?auto_745629 ?auto_745632 ) ) ( not ( = ?auto_745629 ?auto_745633 ) ) ( not ( = ?auto_745629 ?auto_745634 ) ) ( not ( = ?auto_745629 ?auto_745635 ) ) ( not ( = ?auto_745629 ?auto_745636 ) ) ( not ( = ?auto_745629 ?auto_745637 ) ) ( not ( = ?auto_745629 ?auto_745638 ) ) ( not ( = ?auto_745630 ?auto_745631 ) ) ( not ( = ?auto_745630 ?auto_745632 ) ) ( not ( = ?auto_745630 ?auto_745633 ) ) ( not ( = ?auto_745630 ?auto_745634 ) ) ( not ( = ?auto_745630 ?auto_745635 ) ) ( not ( = ?auto_745630 ?auto_745636 ) ) ( not ( = ?auto_745630 ?auto_745637 ) ) ( not ( = ?auto_745630 ?auto_745638 ) ) ( not ( = ?auto_745631 ?auto_745632 ) ) ( not ( = ?auto_745631 ?auto_745633 ) ) ( not ( = ?auto_745631 ?auto_745634 ) ) ( not ( = ?auto_745631 ?auto_745635 ) ) ( not ( = ?auto_745631 ?auto_745636 ) ) ( not ( = ?auto_745631 ?auto_745637 ) ) ( not ( = ?auto_745631 ?auto_745638 ) ) ( not ( = ?auto_745632 ?auto_745633 ) ) ( not ( = ?auto_745632 ?auto_745634 ) ) ( not ( = ?auto_745632 ?auto_745635 ) ) ( not ( = ?auto_745632 ?auto_745636 ) ) ( not ( = ?auto_745632 ?auto_745637 ) ) ( not ( = ?auto_745632 ?auto_745638 ) ) ( not ( = ?auto_745633 ?auto_745634 ) ) ( not ( = ?auto_745633 ?auto_745635 ) ) ( not ( = ?auto_745633 ?auto_745636 ) ) ( not ( = ?auto_745633 ?auto_745637 ) ) ( not ( = ?auto_745633 ?auto_745638 ) ) ( not ( = ?auto_745634 ?auto_745635 ) ) ( not ( = ?auto_745634 ?auto_745636 ) ) ( not ( = ?auto_745634 ?auto_745637 ) ) ( not ( = ?auto_745634 ?auto_745638 ) ) ( not ( = ?auto_745635 ?auto_745636 ) ) ( not ( = ?auto_745635 ?auto_745637 ) ) ( not ( = ?auto_745635 ?auto_745638 ) ) ( not ( = ?auto_745636 ?auto_745637 ) ) ( not ( = ?auto_745636 ?auto_745638 ) ) ( not ( = ?auto_745637 ?auto_745638 ) ) ( ON ?auto_745636 ?auto_745637 ) ( ON ?auto_745635 ?auto_745636 ) ( ON ?auto_745634 ?auto_745635 ) ( ON ?auto_745633 ?auto_745634 ) ( ON ?auto_745632 ?auto_745633 ) ( ON ?auto_745631 ?auto_745632 ) ( ON ?auto_745630 ?auto_745631 ) ( ON ?auto_745629 ?auto_745630 ) ( ON ?auto_745628 ?auto_745629 ) ( ON ?auto_745627 ?auto_745628 ) ( CLEAR ?auto_745625 ) ( ON ?auto_745626 ?auto_745627 ) ( CLEAR ?auto_745626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_745622 ?auto_745623 ?auto_745624 ?auto_745625 ?auto_745626 )
      ( MAKE-16PILE ?auto_745622 ?auto_745623 ?auto_745624 ?auto_745625 ?auto_745626 ?auto_745627 ?auto_745628 ?auto_745629 ?auto_745630 ?auto_745631 ?auto_745632 ?auto_745633 ?auto_745634 ?auto_745635 ?auto_745636 ?auto_745637 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745688 - BLOCK
      ?auto_745689 - BLOCK
      ?auto_745690 - BLOCK
      ?auto_745691 - BLOCK
      ?auto_745692 - BLOCK
      ?auto_745693 - BLOCK
      ?auto_745694 - BLOCK
      ?auto_745695 - BLOCK
      ?auto_745696 - BLOCK
      ?auto_745697 - BLOCK
      ?auto_745698 - BLOCK
      ?auto_745699 - BLOCK
      ?auto_745700 - BLOCK
      ?auto_745701 - BLOCK
      ?auto_745702 - BLOCK
      ?auto_745703 - BLOCK
    )
    :vars
    (
      ?auto_745704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745703 ?auto_745704 ) ( ON-TABLE ?auto_745688 ) ( ON ?auto_745689 ?auto_745688 ) ( ON ?auto_745690 ?auto_745689 ) ( not ( = ?auto_745688 ?auto_745689 ) ) ( not ( = ?auto_745688 ?auto_745690 ) ) ( not ( = ?auto_745688 ?auto_745691 ) ) ( not ( = ?auto_745688 ?auto_745692 ) ) ( not ( = ?auto_745688 ?auto_745693 ) ) ( not ( = ?auto_745688 ?auto_745694 ) ) ( not ( = ?auto_745688 ?auto_745695 ) ) ( not ( = ?auto_745688 ?auto_745696 ) ) ( not ( = ?auto_745688 ?auto_745697 ) ) ( not ( = ?auto_745688 ?auto_745698 ) ) ( not ( = ?auto_745688 ?auto_745699 ) ) ( not ( = ?auto_745688 ?auto_745700 ) ) ( not ( = ?auto_745688 ?auto_745701 ) ) ( not ( = ?auto_745688 ?auto_745702 ) ) ( not ( = ?auto_745688 ?auto_745703 ) ) ( not ( = ?auto_745688 ?auto_745704 ) ) ( not ( = ?auto_745689 ?auto_745690 ) ) ( not ( = ?auto_745689 ?auto_745691 ) ) ( not ( = ?auto_745689 ?auto_745692 ) ) ( not ( = ?auto_745689 ?auto_745693 ) ) ( not ( = ?auto_745689 ?auto_745694 ) ) ( not ( = ?auto_745689 ?auto_745695 ) ) ( not ( = ?auto_745689 ?auto_745696 ) ) ( not ( = ?auto_745689 ?auto_745697 ) ) ( not ( = ?auto_745689 ?auto_745698 ) ) ( not ( = ?auto_745689 ?auto_745699 ) ) ( not ( = ?auto_745689 ?auto_745700 ) ) ( not ( = ?auto_745689 ?auto_745701 ) ) ( not ( = ?auto_745689 ?auto_745702 ) ) ( not ( = ?auto_745689 ?auto_745703 ) ) ( not ( = ?auto_745689 ?auto_745704 ) ) ( not ( = ?auto_745690 ?auto_745691 ) ) ( not ( = ?auto_745690 ?auto_745692 ) ) ( not ( = ?auto_745690 ?auto_745693 ) ) ( not ( = ?auto_745690 ?auto_745694 ) ) ( not ( = ?auto_745690 ?auto_745695 ) ) ( not ( = ?auto_745690 ?auto_745696 ) ) ( not ( = ?auto_745690 ?auto_745697 ) ) ( not ( = ?auto_745690 ?auto_745698 ) ) ( not ( = ?auto_745690 ?auto_745699 ) ) ( not ( = ?auto_745690 ?auto_745700 ) ) ( not ( = ?auto_745690 ?auto_745701 ) ) ( not ( = ?auto_745690 ?auto_745702 ) ) ( not ( = ?auto_745690 ?auto_745703 ) ) ( not ( = ?auto_745690 ?auto_745704 ) ) ( not ( = ?auto_745691 ?auto_745692 ) ) ( not ( = ?auto_745691 ?auto_745693 ) ) ( not ( = ?auto_745691 ?auto_745694 ) ) ( not ( = ?auto_745691 ?auto_745695 ) ) ( not ( = ?auto_745691 ?auto_745696 ) ) ( not ( = ?auto_745691 ?auto_745697 ) ) ( not ( = ?auto_745691 ?auto_745698 ) ) ( not ( = ?auto_745691 ?auto_745699 ) ) ( not ( = ?auto_745691 ?auto_745700 ) ) ( not ( = ?auto_745691 ?auto_745701 ) ) ( not ( = ?auto_745691 ?auto_745702 ) ) ( not ( = ?auto_745691 ?auto_745703 ) ) ( not ( = ?auto_745691 ?auto_745704 ) ) ( not ( = ?auto_745692 ?auto_745693 ) ) ( not ( = ?auto_745692 ?auto_745694 ) ) ( not ( = ?auto_745692 ?auto_745695 ) ) ( not ( = ?auto_745692 ?auto_745696 ) ) ( not ( = ?auto_745692 ?auto_745697 ) ) ( not ( = ?auto_745692 ?auto_745698 ) ) ( not ( = ?auto_745692 ?auto_745699 ) ) ( not ( = ?auto_745692 ?auto_745700 ) ) ( not ( = ?auto_745692 ?auto_745701 ) ) ( not ( = ?auto_745692 ?auto_745702 ) ) ( not ( = ?auto_745692 ?auto_745703 ) ) ( not ( = ?auto_745692 ?auto_745704 ) ) ( not ( = ?auto_745693 ?auto_745694 ) ) ( not ( = ?auto_745693 ?auto_745695 ) ) ( not ( = ?auto_745693 ?auto_745696 ) ) ( not ( = ?auto_745693 ?auto_745697 ) ) ( not ( = ?auto_745693 ?auto_745698 ) ) ( not ( = ?auto_745693 ?auto_745699 ) ) ( not ( = ?auto_745693 ?auto_745700 ) ) ( not ( = ?auto_745693 ?auto_745701 ) ) ( not ( = ?auto_745693 ?auto_745702 ) ) ( not ( = ?auto_745693 ?auto_745703 ) ) ( not ( = ?auto_745693 ?auto_745704 ) ) ( not ( = ?auto_745694 ?auto_745695 ) ) ( not ( = ?auto_745694 ?auto_745696 ) ) ( not ( = ?auto_745694 ?auto_745697 ) ) ( not ( = ?auto_745694 ?auto_745698 ) ) ( not ( = ?auto_745694 ?auto_745699 ) ) ( not ( = ?auto_745694 ?auto_745700 ) ) ( not ( = ?auto_745694 ?auto_745701 ) ) ( not ( = ?auto_745694 ?auto_745702 ) ) ( not ( = ?auto_745694 ?auto_745703 ) ) ( not ( = ?auto_745694 ?auto_745704 ) ) ( not ( = ?auto_745695 ?auto_745696 ) ) ( not ( = ?auto_745695 ?auto_745697 ) ) ( not ( = ?auto_745695 ?auto_745698 ) ) ( not ( = ?auto_745695 ?auto_745699 ) ) ( not ( = ?auto_745695 ?auto_745700 ) ) ( not ( = ?auto_745695 ?auto_745701 ) ) ( not ( = ?auto_745695 ?auto_745702 ) ) ( not ( = ?auto_745695 ?auto_745703 ) ) ( not ( = ?auto_745695 ?auto_745704 ) ) ( not ( = ?auto_745696 ?auto_745697 ) ) ( not ( = ?auto_745696 ?auto_745698 ) ) ( not ( = ?auto_745696 ?auto_745699 ) ) ( not ( = ?auto_745696 ?auto_745700 ) ) ( not ( = ?auto_745696 ?auto_745701 ) ) ( not ( = ?auto_745696 ?auto_745702 ) ) ( not ( = ?auto_745696 ?auto_745703 ) ) ( not ( = ?auto_745696 ?auto_745704 ) ) ( not ( = ?auto_745697 ?auto_745698 ) ) ( not ( = ?auto_745697 ?auto_745699 ) ) ( not ( = ?auto_745697 ?auto_745700 ) ) ( not ( = ?auto_745697 ?auto_745701 ) ) ( not ( = ?auto_745697 ?auto_745702 ) ) ( not ( = ?auto_745697 ?auto_745703 ) ) ( not ( = ?auto_745697 ?auto_745704 ) ) ( not ( = ?auto_745698 ?auto_745699 ) ) ( not ( = ?auto_745698 ?auto_745700 ) ) ( not ( = ?auto_745698 ?auto_745701 ) ) ( not ( = ?auto_745698 ?auto_745702 ) ) ( not ( = ?auto_745698 ?auto_745703 ) ) ( not ( = ?auto_745698 ?auto_745704 ) ) ( not ( = ?auto_745699 ?auto_745700 ) ) ( not ( = ?auto_745699 ?auto_745701 ) ) ( not ( = ?auto_745699 ?auto_745702 ) ) ( not ( = ?auto_745699 ?auto_745703 ) ) ( not ( = ?auto_745699 ?auto_745704 ) ) ( not ( = ?auto_745700 ?auto_745701 ) ) ( not ( = ?auto_745700 ?auto_745702 ) ) ( not ( = ?auto_745700 ?auto_745703 ) ) ( not ( = ?auto_745700 ?auto_745704 ) ) ( not ( = ?auto_745701 ?auto_745702 ) ) ( not ( = ?auto_745701 ?auto_745703 ) ) ( not ( = ?auto_745701 ?auto_745704 ) ) ( not ( = ?auto_745702 ?auto_745703 ) ) ( not ( = ?auto_745702 ?auto_745704 ) ) ( not ( = ?auto_745703 ?auto_745704 ) ) ( ON ?auto_745702 ?auto_745703 ) ( ON ?auto_745701 ?auto_745702 ) ( ON ?auto_745700 ?auto_745701 ) ( ON ?auto_745699 ?auto_745700 ) ( ON ?auto_745698 ?auto_745699 ) ( ON ?auto_745697 ?auto_745698 ) ( ON ?auto_745696 ?auto_745697 ) ( ON ?auto_745695 ?auto_745696 ) ( ON ?auto_745694 ?auto_745695 ) ( ON ?auto_745693 ?auto_745694 ) ( ON ?auto_745692 ?auto_745693 ) ( CLEAR ?auto_745690 ) ( ON ?auto_745691 ?auto_745692 ) ( CLEAR ?auto_745691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_745688 ?auto_745689 ?auto_745690 ?auto_745691 )
      ( MAKE-16PILE ?auto_745688 ?auto_745689 ?auto_745690 ?auto_745691 ?auto_745692 ?auto_745693 ?auto_745694 ?auto_745695 ?auto_745696 ?auto_745697 ?auto_745698 ?auto_745699 ?auto_745700 ?auto_745701 ?auto_745702 ?auto_745703 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745754 - BLOCK
      ?auto_745755 - BLOCK
      ?auto_745756 - BLOCK
      ?auto_745757 - BLOCK
      ?auto_745758 - BLOCK
      ?auto_745759 - BLOCK
      ?auto_745760 - BLOCK
      ?auto_745761 - BLOCK
      ?auto_745762 - BLOCK
      ?auto_745763 - BLOCK
      ?auto_745764 - BLOCK
      ?auto_745765 - BLOCK
      ?auto_745766 - BLOCK
      ?auto_745767 - BLOCK
      ?auto_745768 - BLOCK
      ?auto_745769 - BLOCK
    )
    :vars
    (
      ?auto_745770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745769 ?auto_745770 ) ( ON-TABLE ?auto_745754 ) ( ON ?auto_745755 ?auto_745754 ) ( not ( = ?auto_745754 ?auto_745755 ) ) ( not ( = ?auto_745754 ?auto_745756 ) ) ( not ( = ?auto_745754 ?auto_745757 ) ) ( not ( = ?auto_745754 ?auto_745758 ) ) ( not ( = ?auto_745754 ?auto_745759 ) ) ( not ( = ?auto_745754 ?auto_745760 ) ) ( not ( = ?auto_745754 ?auto_745761 ) ) ( not ( = ?auto_745754 ?auto_745762 ) ) ( not ( = ?auto_745754 ?auto_745763 ) ) ( not ( = ?auto_745754 ?auto_745764 ) ) ( not ( = ?auto_745754 ?auto_745765 ) ) ( not ( = ?auto_745754 ?auto_745766 ) ) ( not ( = ?auto_745754 ?auto_745767 ) ) ( not ( = ?auto_745754 ?auto_745768 ) ) ( not ( = ?auto_745754 ?auto_745769 ) ) ( not ( = ?auto_745754 ?auto_745770 ) ) ( not ( = ?auto_745755 ?auto_745756 ) ) ( not ( = ?auto_745755 ?auto_745757 ) ) ( not ( = ?auto_745755 ?auto_745758 ) ) ( not ( = ?auto_745755 ?auto_745759 ) ) ( not ( = ?auto_745755 ?auto_745760 ) ) ( not ( = ?auto_745755 ?auto_745761 ) ) ( not ( = ?auto_745755 ?auto_745762 ) ) ( not ( = ?auto_745755 ?auto_745763 ) ) ( not ( = ?auto_745755 ?auto_745764 ) ) ( not ( = ?auto_745755 ?auto_745765 ) ) ( not ( = ?auto_745755 ?auto_745766 ) ) ( not ( = ?auto_745755 ?auto_745767 ) ) ( not ( = ?auto_745755 ?auto_745768 ) ) ( not ( = ?auto_745755 ?auto_745769 ) ) ( not ( = ?auto_745755 ?auto_745770 ) ) ( not ( = ?auto_745756 ?auto_745757 ) ) ( not ( = ?auto_745756 ?auto_745758 ) ) ( not ( = ?auto_745756 ?auto_745759 ) ) ( not ( = ?auto_745756 ?auto_745760 ) ) ( not ( = ?auto_745756 ?auto_745761 ) ) ( not ( = ?auto_745756 ?auto_745762 ) ) ( not ( = ?auto_745756 ?auto_745763 ) ) ( not ( = ?auto_745756 ?auto_745764 ) ) ( not ( = ?auto_745756 ?auto_745765 ) ) ( not ( = ?auto_745756 ?auto_745766 ) ) ( not ( = ?auto_745756 ?auto_745767 ) ) ( not ( = ?auto_745756 ?auto_745768 ) ) ( not ( = ?auto_745756 ?auto_745769 ) ) ( not ( = ?auto_745756 ?auto_745770 ) ) ( not ( = ?auto_745757 ?auto_745758 ) ) ( not ( = ?auto_745757 ?auto_745759 ) ) ( not ( = ?auto_745757 ?auto_745760 ) ) ( not ( = ?auto_745757 ?auto_745761 ) ) ( not ( = ?auto_745757 ?auto_745762 ) ) ( not ( = ?auto_745757 ?auto_745763 ) ) ( not ( = ?auto_745757 ?auto_745764 ) ) ( not ( = ?auto_745757 ?auto_745765 ) ) ( not ( = ?auto_745757 ?auto_745766 ) ) ( not ( = ?auto_745757 ?auto_745767 ) ) ( not ( = ?auto_745757 ?auto_745768 ) ) ( not ( = ?auto_745757 ?auto_745769 ) ) ( not ( = ?auto_745757 ?auto_745770 ) ) ( not ( = ?auto_745758 ?auto_745759 ) ) ( not ( = ?auto_745758 ?auto_745760 ) ) ( not ( = ?auto_745758 ?auto_745761 ) ) ( not ( = ?auto_745758 ?auto_745762 ) ) ( not ( = ?auto_745758 ?auto_745763 ) ) ( not ( = ?auto_745758 ?auto_745764 ) ) ( not ( = ?auto_745758 ?auto_745765 ) ) ( not ( = ?auto_745758 ?auto_745766 ) ) ( not ( = ?auto_745758 ?auto_745767 ) ) ( not ( = ?auto_745758 ?auto_745768 ) ) ( not ( = ?auto_745758 ?auto_745769 ) ) ( not ( = ?auto_745758 ?auto_745770 ) ) ( not ( = ?auto_745759 ?auto_745760 ) ) ( not ( = ?auto_745759 ?auto_745761 ) ) ( not ( = ?auto_745759 ?auto_745762 ) ) ( not ( = ?auto_745759 ?auto_745763 ) ) ( not ( = ?auto_745759 ?auto_745764 ) ) ( not ( = ?auto_745759 ?auto_745765 ) ) ( not ( = ?auto_745759 ?auto_745766 ) ) ( not ( = ?auto_745759 ?auto_745767 ) ) ( not ( = ?auto_745759 ?auto_745768 ) ) ( not ( = ?auto_745759 ?auto_745769 ) ) ( not ( = ?auto_745759 ?auto_745770 ) ) ( not ( = ?auto_745760 ?auto_745761 ) ) ( not ( = ?auto_745760 ?auto_745762 ) ) ( not ( = ?auto_745760 ?auto_745763 ) ) ( not ( = ?auto_745760 ?auto_745764 ) ) ( not ( = ?auto_745760 ?auto_745765 ) ) ( not ( = ?auto_745760 ?auto_745766 ) ) ( not ( = ?auto_745760 ?auto_745767 ) ) ( not ( = ?auto_745760 ?auto_745768 ) ) ( not ( = ?auto_745760 ?auto_745769 ) ) ( not ( = ?auto_745760 ?auto_745770 ) ) ( not ( = ?auto_745761 ?auto_745762 ) ) ( not ( = ?auto_745761 ?auto_745763 ) ) ( not ( = ?auto_745761 ?auto_745764 ) ) ( not ( = ?auto_745761 ?auto_745765 ) ) ( not ( = ?auto_745761 ?auto_745766 ) ) ( not ( = ?auto_745761 ?auto_745767 ) ) ( not ( = ?auto_745761 ?auto_745768 ) ) ( not ( = ?auto_745761 ?auto_745769 ) ) ( not ( = ?auto_745761 ?auto_745770 ) ) ( not ( = ?auto_745762 ?auto_745763 ) ) ( not ( = ?auto_745762 ?auto_745764 ) ) ( not ( = ?auto_745762 ?auto_745765 ) ) ( not ( = ?auto_745762 ?auto_745766 ) ) ( not ( = ?auto_745762 ?auto_745767 ) ) ( not ( = ?auto_745762 ?auto_745768 ) ) ( not ( = ?auto_745762 ?auto_745769 ) ) ( not ( = ?auto_745762 ?auto_745770 ) ) ( not ( = ?auto_745763 ?auto_745764 ) ) ( not ( = ?auto_745763 ?auto_745765 ) ) ( not ( = ?auto_745763 ?auto_745766 ) ) ( not ( = ?auto_745763 ?auto_745767 ) ) ( not ( = ?auto_745763 ?auto_745768 ) ) ( not ( = ?auto_745763 ?auto_745769 ) ) ( not ( = ?auto_745763 ?auto_745770 ) ) ( not ( = ?auto_745764 ?auto_745765 ) ) ( not ( = ?auto_745764 ?auto_745766 ) ) ( not ( = ?auto_745764 ?auto_745767 ) ) ( not ( = ?auto_745764 ?auto_745768 ) ) ( not ( = ?auto_745764 ?auto_745769 ) ) ( not ( = ?auto_745764 ?auto_745770 ) ) ( not ( = ?auto_745765 ?auto_745766 ) ) ( not ( = ?auto_745765 ?auto_745767 ) ) ( not ( = ?auto_745765 ?auto_745768 ) ) ( not ( = ?auto_745765 ?auto_745769 ) ) ( not ( = ?auto_745765 ?auto_745770 ) ) ( not ( = ?auto_745766 ?auto_745767 ) ) ( not ( = ?auto_745766 ?auto_745768 ) ) ( not ( = ?auto_745766 ?auto_745769 ) ) ( not ( = ?auto_745766 ?auto_745770 ) ) ( not ( = ?auto_745767 ?auto_745768 ) ) ( not ( = ?auto_745767 ?auto_745769 ) ) ( not ( = ?auto_745767 ?auto_745770 ) ) ( not ( = ?auto_745768 ?auto_745769 ) ) ( not ( = ?auto_745768 ?auto_745770 ) ) ( not ( = ?auto_745769 ?auto_745770 ) ) ( ON ?auto_745768 ?auto_745769 ) ( ON ?auto_745767 ?auto_745768 ) ( ON ?auto_745766 ?auto_745767 ) ( ON ?auto_745765 ?auto_745766 ) ( ON ?auto_745764 ?auto_745765 ) ( ON ?auto_745763 ?auto_745764 ) ( ON ?auto_745762 ?auto_745763 ) ( ON ?auto_745761 ?auto_745762 ) ( ON ?auto_745760 ?auto_745761 ) ( ON ?auto_745759 ?auto_745760 ) ( ON ?auto_745758 ?auto_745759 ) ( ON ?auto_745757 ?auto_745758 ) ( CLEAR ?auto_745755 ) ( ON ?auto_745756 ?auto_745757 ) ( CLEAR ?auto_745756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_745754 ?auto_745755 ?auto_745756 )
      ( MAKE-16PILE ?auto_745754 ?auto_745755 ?auto_745756 ?auto_745757 ?auto_745758 ?auto_745759 ?auto_745760 ?auto_745761 ?auto_745762 ?auto_745763 ?auto_745764 ?auto_745765 ?auto_745766 ?auto_745767 ?auto_745768 ?auto_745769 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745820 - BLOCK
      ?auto_745821 - BLOCK
      ?auto_745822 - BLOCK
      ?auto_745823 - BLOCK
      ?auto_745824 - BLOCK
      ?auto_745825 - BLOCK
      ?auto_745826 - BLOCK
      ?auto_745827 - BLOCK
      ?auto_745828 - BLOCK
      ?auto_745829 - BLOCK
      ?auto_745830 - BLOCK
      ?auto_745831 - BLOCK
      ?auto_745832 - BLOCK
      ?auto_745833 - BLOCK
      ?auto_745834 - BLOCK
      ?auto_745835 - BLOCK
    )
    :vars
    (
      ?auto_745836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745835 ?auto_745836 ) ( ON-TABLE ?auto_745820 ) ( not ( = ?auto_745820 ?auto_745821 ) ) ( not ( = ?auto_745820 ?auto_745822 ) ) ( not ( = ?auto_745820 ?auto_745823 ) ) ( not ( = ?auto_745820 ?auto_745824 ) ) ( not ( = ?auto_745820 ?auto_745825 ) ) ( not ( = ?auto_745820 ?auto_745826 ) ) ( not ( = ?auto_745820 ?auto_745827 ) ) ( not ( = ?auto_745820 ?auto_745828 ) ) ( not ( = ?auto_745820 ?auto_745829 ) ) ( not ( = ?auto_745820 ?auto_745830 ) ) ( not ( = ?auto_745820 ?auto_745831 ) ) ( not ( = ?auto_745820 ?auto_745832 ) ) ( not ( = ?auto_745820 ?auto_745833 ) ) ( not ( = ?auto_745820 ?auto_745834 ) ) ( not ( = ?auto_745820 ?auto_745835 ) ) ( not ( = ?auto_745820 ?auto_745836 ) ) ( not ( = ?auto_745821 ?auto_745822 ) ) ( not ( = ?auto_745821 ?auto_745823 ) ) ( not ( = ?auto_745821 ?auto_745824 ) ) ( not ( = ?auto_745821 ?auto_745825 ) ) ( not ( = ?auto_745821 ?auto_745826 ) ) ( not ( = ?auto_745821 ?auto_745827 ) ) ( not ( = ?auto_745821 ?auto_745828 ) ) ( not ( = ?auto_745821 ?auto_745829 ) ) ( not ( = ?auto_745821 ?auto_745830 ) ) ( not ( = ?auto_745821 ?auto_745831 ) ) ( not ( = ?auto_745821 ?auto_745832 ) ) ( not ( = ?auto_745821 ?auto_745833 ) ) ( not ( = ?auto_745821 ?auto_745834 ) ) ( not ( = ?auto_745821 ?auto_745835 ) ) ( not ( = ?auto_745821 ?auto_745836 ) ) ( not ( = ?auto_745822 ?auto_745823 ) ) ( not ( = ?auto_745822 ?auto_745824 ) ) ( not ( = ?auto_745822 ?auto_745825 ) ) ( not ( = ?auto_745822 ?auto_745826 ) ) ( not ( = ?auto_745822 ?auto_745827 ) ) ( not ( = ?auto_745822 ?auto_745828 ) ) ( not ( = ?auto_745822 ?auto_745829 ) ) ( not ( = ?auto_745822 ?auto_745830 ) ) ( not ( = ?auto_745822 ?auto_745831 ) ) ( not ( = ?auto_745822 ?auto_745832 ) ) ( not ( = ?auto_745822 ?auto_745833 ) ) ( not ( = ?auto_745822 ?auto_745834 ) ) ( not ( = ?auto_745822 ?auto_745835 ) ) ( not ( = ?auto_745822 ?auto_745836 ) ) ( not ( = ?auto_745823 ?auto_745824 ) ) ( not ( = ?auto_745823 ?auto_745825 ) ) ( not ( = ?auto_745823 ?auto_745826 ) ) ( not ( = ?auto_745823 ?auto_745827 ) ) ( not ( = ?auto_745823 ?auto_745828 ) ) ( not ( = ?auto_745823 ?auto_745829 ) ) ( not ( = ?auto_745823 ?auto_745830 ) ) ( not ( = ?auto_745823 ?auto_745831 ) ) ( not ( = ?auto_745823 ?auto_745832 ) ) ( not ( = ?auto_745823 ?auto_745833 ) ) ( not ( = ?auto_745823 ?auto_745834 ) ) ( not ( = ?auto_745823 ?auto_745835 ) ) ( not ( = ?auto_745823 ?auto_745836 ) ) ( not ( = ?auto_745824 ?auto_745825 ) ) ( not ( = ?auto_745824 ?auto_745826 ) ) ( not ( = ?auto_745824 ?auto_745827 ) ) ( not ( = ?auto_745824 ?auto_745828 ) ) ( not ( = ?auto_745824 ?auto_745829 ) ) ( not ( = ?auto_745824 ?auto_745830 ) ) ( not ( = ?auto_745824 ?auto_745831 ) ) ( not ( = ?auto_745824 ?auto_745832 ) ) ( not ( = ?auto_745824 ?auto_745833 ) ) ( not ( = ?auto_745824 ?auto_745834 ) ) ( not ( = ?auto_745824 ?auto_745835 ) ) ( not ( = ?auto_745824 ?auto_745836 ) ) ( not ( = ?auto_745825 ?auto_745826 ) ) ( not ( = ?auto_745825 ?auto_745827 ) ) ( not ( = ?auto_745825 ?auto_745828 ) ) ( not ( = ?auto_745825 ?auto_745829 ) ) ( not ( = ?auto_745825 ?auto_745830 ) ) ( not ( = ?auto_745825 ?auto_745831 ) ) ( not ( = ?auto_745825 ?auto_745832 ) ) ( not ( = ?auto_745825 ?auto_745833 ) ) ( not ( = ?auto_745825 ?auto_745834 ) ) ( not ( = ?auto_745825 ?auto_745835 ) ) ( not ( = ?auto_745825 ?auto_745836 ) ) ( not ( = ?auto_745826 ?auto_745827 ) ) ( not ( = ?auto_745826 ?auto_745828 ) ) ( not ( = ?auto_745826 ?auto_745829 ) ) ( not ( = ?auto_745826 ?auto_745830 ) ) ( not ( = ?auto_745826 ?auto_745831 ) ) ( not ( = ?auto_745826 ?auto_745832 ) ) ( not ( = ?auto_745826 ?auto_745833 ) ) ( not ( = ?auto_745826 ?auto_745834 ) ) ( not ( = ?auto_745826 ?auto_745835 ) ) ( not ( = ?auto_745826 ?auto_745836 ) ) ( not ( = ?auto_745827 ?auto_745828 ) ) ( not ( = ?auto_745827 ?auto_745829 ) ) ( not ( = ?auto_745827 ?auto_745830 ) ) ( not ( = ?auto_745827 ?auto_745831 ) ) ( not ( = ?auto_745827 ?auto_745832 ) ) ( not ( = ?auto_745827 ?auto_745833 ) ) ( not ( = ?auto_745827 ?auto_745834 ) ) ( not ( = ?auto_745827 ?auto_745835 ) ) ( not ( = ?auto_745827 ?auto_745836 ) ) ( not ( = ?auto_745828 ?auto_745829 ) ) ( not ( = ?auto_745828 ?auto_745830 ) ) ( not ( = ?auto_745828 ?auto_745831 ) ) ( not ( = ?auto_745828 ?auto_745832 ) ) ( not ( = ?auto_745828 ?auto_745833 ) ) ( not ( = ?auto_745828 ?auto_745834 ) ) ( not ( = ?auto_745828 ?auto_745835 ) ) ( not ( = ?auto_745828 ?auto_745836 ) ) ( not ( = ?auto_745829 ?auto_745830 ) ) ( not ( = ?auto_745829 ?auto_745831 ) ) ( not ( = ?auto_745829 ?auto_745832 ) ) ( not ( = ?auto_745829 ?auto_745833 ) ) ( not ( = ?auto_745829 ?auto_745834 ) ) ( not ( = ?auto_745829 ?auto_745835 ) ) ( not ( = ?auto_745829 ?auto_745836 ) ) ( not ( = ?auto_745830 ?auto_745831 ) ) ( not ( = ?auto_745830 ?auto_745832 ) ) ( not ( = ?auto_745830 ?auto_745833 ) ) ( not ( = ?auto_745830 ?auto_745834 ) ) ( not ( = ?auto_745830 ?auto_745835 ) ) ( not ( = ?auto_745830 ?auto_745836 ) ) ( not ( = ?auto_745831 ?auto_745832 ) ) ( not ( = ?auto_745831 ?auto_745833 ) ) ( not ( = ?auto_745831 ?auto_745834 ) ) ( not ( = ?auto_745831 ?auto_745835 ) ) ( not ( = ?auto_745831 ?auto_745836 ) ) ( not ( = ?auto_745832 ?auto_745833 ) ) ( not ( = ?auto_745832 ?auto_745834 ) ) ( not ( = ?auto_745832 ?auto_745835 ) ) ( not ( = ?auto_745832 ?auto_745836 ) ) ( not ( = ?auto_745833 ?auto_745834 ) ) ( not ( = ?auto_745833 ?auto_745835 ) ) ( not ( = ?auto_745833 ?auto_745836 ) ) ( not ( = ?auto_745834 ?auto_745835 ) ) ( not ( = ?auto_745834 ?auto_745836 ) ) ( not ( = ?auto_745835 ?auto_745836 ) ) ( ON ?auto_745834 ?auto_745835 ) ( ON ?auto_745833 ?auto_745834 ) ( ON ?auto_745832 ?auto_745833 ) ( ON ?auto_745831 ?auto_745832 ) ( ON ?auto_745830 ?auto_745831 ) ( ON ?auto_745829 ?auto_745830 ) ( ON ?auto_745828 ?auto_745829 ) ( ON ?auto_745827 ?auto_745828 ) ( ON ?auto_745826 ?auto_745827 ) ( ON ?auto_745825 ?auto_745826 ) ( ON ?auto_745824 ?auto_745825 ) ( ON ?auto_745823 ?auto_745824 ) ( ON ?auto_745822 ?auto_745823 ) ( CLEAR ?auto_745820 ) ( ON ?auto_745821 ?auto_745822 ) ( CLEAR ?auto_745821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_745820 ?auto_745821 )
      ( MAKE-16PILE ?auto_745820 ?auto_745821 ?auto_745822 ?auto_745823 ?auto_745824 ?auto_745825 ?auto_745826 ?auto_745827 ?auto_745828 ?auto_745829 ?auto_745830 ?auto_745831 ?auto_745832 ?auto_745833 ?auto_745834 ?auto_745835 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_745886 - BLOCK
      ?auto_745887 - BLOCK
      ?auto_745888 - BLOCK
      ?auto_745889 - BLOCK
      ?auto_745890 - BLOCK
      ?auto_745891 - BLOCK
      ?auto_745892 - BLOCK
      ?auto_745893 - BLOCK
      ?auto_745894 - BLOCK
      ?auto_745895 - BLOCK
      ?auto_745896 - BLOCK
      ?auto_745897 - BLOCK
      ?auto_745898 - BLOCK
      ?auto_745899 - BLOCK
      ?auto_745900 - BLOCK
      ?auto_745901 - BLOCK
    )
    :vars
    (
      ?auto_745902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_745901 ?auto_745902 ) ( not ( = ?auto_745886 ?auto_745887 ) ) ( not ( = ?auto_745886 ?auto_745888 ) ) ( not ( = ?auto_745886 ?auto_745889 ) ) ( not ( = ?auto_745886 ?auto_745890 ) ) ( not ( = ?auto_745886 ?auto_745891 ) ) ( not ( = ?auto_745886 ?auto_745892 ) ) ( not ( = ?auto_745886 ?auto_745893 ) ) ( not ( = ?auto_745886 ?auto_745894 ) ) ( not ( = ?auto_745886 ?auto_745895 ) ) ( not ( = ?auto_745886 ?auto_745896 ) ) ( not ( = ?auto_745886 ?auto_745897 ) ) ( not ( = ?auto_745886 ?auto_745898 ) ) ( not ( = ?auto_745886 ?auto_745899 ) ) ( not ( = ?auto_745886 ?auto_745900 ) ) ( not ( = ?auto_745886 ?auto_745901 ) ) ( not ( = ?auto_745886 ?auto_745902 ) ) ( not ( = ?auto_745887 ?auto_745888 ) ) ( not ( = ?auto_745887 ?auto_745889 ) ) ( not ( = ?auto_745887 ?auto_745890 ) ) ( not ( = ?auto_745887 ?auto_745891 ) ) ( not ( = ?auto_745887 ?auto_745892 ) ) ( not ( = ?auto_745887 ?auto_745893 ) ) ( not ( = ?auto_745887 ?auto_745894 ) ) ( not ( = ?auto_745887 ?auto_745895 ) ) ( not ( = ?auto_745887 ?auto_745896 ) ) ( not ( = ?auto_745887 ?auto_745897 ) ) ( not ( = ?auto_745887 ?auto_745898 ) ) ( not ( = ?auto_745887 ?auto_745899 ) ) ( not ( = ?auto_745887 ?auto_745900 ) ) ( not ( = ?auto_745887 ?auto_745901 ) ) ( not ( = ?auto_745887 ?auto_745902 ) ) ( not ( = ?auto_745888 ?auto_745889 ) ) ( not ( = ?auto_745888 ?auto_745890 ) ) ( not ( = ?auto_745888 ?auto_745891 ) ) ( not ( = ?auto_745888 ?auto_745892 ) ) ( not ( = ?auto_745888 ?auto_745893 ) ) ( not ( = ?auto_745888 ?auto_745894 ) ) ( not ( = ?auto_745888 ?auto_745895 ) ) ( not ( = ?auto_745888 ?auto_745896 ) ) ( not ( = ?auto_745888 ?auto_745897 ) ) ( not ( = ?auto_745888 ?auto_745898 ) ) ( not ( = ?auto_745888 ?auto_745899 ) ) ( not ( = ?auto_745888 ?auto_745900 ) ) ( not ( = ?auto_745888 ?auto_745901 ) ) ( not ( = ?auto_745888 ?auto_745902 ) ) ( not ( = ?auto_745889 ?auto_745890 ) ) ( not ( = ?auto_745889 ?auto_745891 ) ) ( not ( = ?auto_745889 ?auto_745892 ) ) ( not ( = ?auto_745889 ?auto_745893 ) ) ( not ( = ?auto_745889 ?auto_745894 ) ) ( not ( = ?auto_745889 ?auto_745895 ) ) ( not ( = ?auto_745889 ?auto_745896 ) ) ( not ( = ?auto_745889 ?auto_745897 ) ) ( not ( = ?auto_745889 ?auto_745898 ) ) ( not ( = ?auto_745889 ?auto_745899 ) ) ( not ( = ?auto_745889 ?auto_745900 ) ) ( not ( = ?auto_745889 ?auto_745901 ) ) ( not ( = ?auto_745889 ?auto_745902 ) ) ( not ( = ?auto_745890 ?auto_745891 ) ) ( not ( = ?auto_745890 ?auto_745892 ) ) ( not ( = ?auto_745890 ?auto_745893 ) ) ( not ( = ?auto_745890 ?auto_745894 ) ) ( not ( = ?auto_745890 ?auto_745895 ) ) ( not ( = ?auto_745890 ?auto_745896 ) ) ( not ( = ?auto_745890 ?auto_745897 ) ) ( not ( = ?auto_745890 ?auto_745898 ) ) ( not ( = ?auto_745890 ?auto_745899 ) ) ( not ( = ?auto_745890 ?auto_745900 ) ) ( not ( = ?auto_745890 ?auto_745901 ) ) ( not ( = ?auto_745890 ?auto_745902 ) ) ( not ( = ?auto_745891 ?auto_745892 ) ) ( not ( = ?auto_745891 ?auto_745893 ) ) ( not ( = ?auto_745891 ?auto_745894 ) ) ( not ( = ?auto_745891 ?auto_745895 ) ) ( not ( = ?auto_745891 ?auto_745896 ) ) ( not ( = ?auto_745891 ?auto_745897 ) ) ( not ( = ?auto_745891 ?auto_745898 ) ) ( not ( = ?auto_745891 ?auto_745899 ) ) ( not ( = ?auto_745891 ?auto_745900 ) ) ( not ( = ?auto_745891 ?auto_745901 ) ) ( not ( = ?auto_745891 ?auto_745902 ) ) ( not ( = ?auto_745892 ?auto_745893 ) ) ( not ( = ?auto_745892 ?auto_745894 ) ) ( not ( = ?auto_745892 ?auto_745895 ) ) ( not ( = ?auto_745892 ?auto_745896 ) ) ( not ( = ?auto_745892 ?auto_745897 ) ) ( not ( = ?auto_745892 ?auto_745898 ) ) ( not ( = ?auto_745892 ?auto_745899 ) ) ( not ( = ?auto_745892 ?auto_745900 ) ) ( not ( = ?auto_745892 ?auto_745901 ) ) ( not ( = ?auto_745892 ?auto_745902 ) ) ( not ( = ?auto_745893 ?auto_745894 ) ) ( not ( = ?auto_745893 ?auto_745895 ) ) ( not ( = ?auto_745893 ?auto_745896 ) ) ( not ( = ?auto_745893 ?auto_745897 ) ) ( not ( = ?auto_745893 ?auto_745898 ) ) ( not ( = ?auto_745893 ?auto_745899 ) ) ( not ( = ?auto_745893 ?auto_745900 ) ) ( not ( = ?auto_745893 ?auto_745901 ) ) ( not ( = ?auto_745893 ?auto_745902 ) ) ( not ( = ?auto_745894 ?auto_745895 ) ) ( not ( = ?auto_745894 ?auto_745896 ) ) ( not ( = ?auto_745894 ?auto_745897 ) ) ( not ( = ?auto_745894 ?auto_745898 ) ) ( not ( = ?auto_745894 ?auto_745899 ) ) ( not ( = ?auto_745894 ?auto_745900 ) ) ( not ( = ?auto_745894 ?auto_745901 ) ) ( not ( = ?auto_745894 ?auto_745902 ) ) ( not ( = ?auto_745895 ?auto_745896 ) ) ( not ( = ?auto_745895 ?auto_745897 ) ) ( not ( = ?auto_745895 ?auto_745898 ) ) ( not ( = ?auto_745895 ?auto_745899 ) ) ( not ( = ?auto_745895 ?auto_745900 ) ) ( not ( = ?auto_745895 ?auto_745901 ) ) ( not ( = ?auto_745895 ?auto_745902 ) ) ( not ( = ?auto_745896 ?auto_745897 ) ) ( not ( = ?auto_745896 ?auto_745898 ) ) ( not ( = ?auto_745896 ?auto_745899 ) ) ( not ( = ?auto_745896 ?auto_745900 ) ) ( not ( = ?auto_745896 ?auto_745901 ) ) ( not ( = ?auto_745896 ?auto_745902 ) ) ( not ( = ?auto_745897 ?auto_745898 ) ) ( not ( = ?auto_745897 ?auto_745899 ) ) ( not ( = ?auto_745897 ?auto_745900 ) ) ( not ( = ?auto_745897 ?auto_745901 ) ) ( not ( = ?auto_745897 ?auto_745902 ) ) ( not ( = ?auto_745898 ?auto_745899 ) ) ( not ( = ?auto_745898 ?auto_745900 ) ) ( not ( = ?auto_745898 ?auto_745901 ) ) ( not ( = ?auto_745898 ?auto_745902 ) ) ( not ( = ?auto_745899 ?auto_745900 ) ) ( not ( = ?auto_745899 ?auto_745901 ) ) ( not ( = ?auto_745899 ?auto_745902 ) ) ( not ( = ?auto_745900 ?auto_745901 ) ) ( not ( = ?auto_745900 ?auto_745902 ) ) ( not ( = ?auto_745901 ?auto_745902 ) ) ( ON ?auto_745900 ?auto_745901 ) ( ON ?auto_745899 ?auto_745900 ) ( ON ?auto_745898 ?auto_745899 ) ( ON ?auto_745897 ?auto_745898 ) ( ON ?auto_745896 ?auto_745897 ) ( ON ?auto_745895 ?auto_745896 ) ( ON ?auto_745894 ?auto_745895 ) ( ON ?auto_745893 ?auto_745894 ) ( ON ?auto_745892 ?auto_745893 ) ( ON ?auto_745891 ?auto_745892 ) ( ON ?auto_745890 ?auto_745891 ) ( ON ?auto_745889 ?auto_745890 ) ( ON ?auto_745888 ?auto_745889 ) ( ON ?auto_745887 ?auto_745888 ) ( ON ?auto_745886 ?auto_745887 ) ( CLEAR ?auto_745886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_745886 )
      ( MAKE-16PILE ?auto_745886 ?auto_745887 ?auto_745888 ?auto_745889 ?auto_745890 ?auto_745891 ?auto_745892 ?auto_745893 ?auto_745894 ?auto_745895 ?auto_745896 ?auto_745897 ?auto_745898 ?auto_745899 ?auto_745900 ?auto_745901 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_745953 - BLOCK
      ?auto_745954 - BLOCK
      ?auto_745955 - BLOCK
      ?auto_745956 - BLOCK
      ?auto_745957 - BLOCK
      ?auto_745958 - BLOCK
      ?auto_745959 - BLOCK
      ?auto_745960 - BLOCK
      ?auto_745961 - BLOCK
      ?auto_745962 - BLOCK
      ?auto_745963 - BLOCK
      ?auto_745964 - BLOCK
      ?auto_745965 - BLOCK
      ?auto_745966 - BLOCK
      ?auto_745967 - BLOCK
      ?auto_745968 - BLOCK
      ?auto_745969 - BLOCK
    )
    :vars
    (
      ?auto_745970 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_745968 ) ( ON ?auto_745969 ?auto_745970 ) ( CLEAR ?auto_745969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_745953 ) ( ON ?auto_745954 ?auto_745953 ) ( ON ?auto_745955 ?auto_745954 ) ( ON ?auto_745956 ?auto_745955 ) ( ON ?auto_745957 ?auto_745956 ) ( ON ?auto_745958 ?auto_745957 ) ( ON ?auto_745959 ?auto_745958 ) ( ON ?auto_745960 ?auto_745959 ) ( ON ?auto_745961 ?auto_745960 ) ( ON ?auto_745962 ?auto_745961 ) ( ON ?auto_745963 ?auto_745962 ) ( ON ?auto_745964 ?auto_745963 ) ( ON ?auto_745965 ?auto_745964 ) ( ON ?auto_745966 ?auto_745965 ) ( ON ?auto_745967 ?auto_745966 ) ( ON ?auto_745968 ?auto_745967 ) ( not ( = ?auto_745953 ?auto_745954 ) ) ( not ( = ?auto_745953 ?auto_745955 ) ) ( not ( = ?auto_745953 ?auto_745956 ) ) ( not ( = ?auto_745953 ?auto_745957 ) ) ( not ( = ?auto_745953 ?auto_745958 ) ) ( not ( = ?auto_745953 ?auto_745959 ) ) ( not ( = ?auto_745953 ?auto_745960 ) ) ( not ( = ?auto_745953 ?auto_745961 ) ) ( not ( = ?auto_745953 ?auto_745962 ) ) ( not ( = ?auto_745953 ?auto_745963 ) ) ( not ( = ?auto_745953 ?auto_745964 ) ) ( not ( = ?auto_745953 ?auto_745965 ) ) ( not ( = ?auto_745953 ?auto_745966 ) ) ( not ( = ?auto_745953 ?auto_745967 ) ) ( not ( = ?auto_745953 ?auto_745968 ) ) ( not ( = ?auto_745953 ?auto_745969 ) ) ( not ( = ?auto_745953 ?auto_745970 ) ) ( not ( = ?auto_745954 ?auto_745955 ) ) ( not ( = ?auto_745954 ?auto_745956 ) ) ( not ( = ?auto_745954 ?auto_745957 ) ) ( not ( = ?auto_745954 ?auto_745958 ) ) ( not ( = ?auto_745954 ?auto_745959 ) ) ( not ( = ?auto_745954 ?auto_745960 ) ) ( not ( = ?auto_745954 ?auto_745961 ) ) ( not ( = ?auto_745954 ?auto_745962 ) ) ( not ( = ?auto_745954 ?auto_745963 ) ) ( not ( = ?auto_745954 ?auto_745964 ) ) ( not ( = ?auto_745954 ?auto_745965 ) ) ( not ( = ?auto_745954 ?auto_745966 ) ) ( not ( = ?auto_745954 ?auto_745967 ) ) ( not ( = ?auto_745954 ?auto_745968 ) ) ( not ( = ?auto_745954 ?auto_745969 ) ) ( not ( = ?auto_745954 ?auto_745970 ) ) ( not ( = ?auto_745955 ?auto_745956 ) ) ( not ( = ?auto_745955 ?auto_745957 ) ) ( not ( = ?auto_745955 ?auto_745958 ) ) ( not ( = ?auto_745955 ?auto_745959 ) ) ( not ( = ?auto_745955 ?auto_745960 ) ) ( not ( = ?auto_745955 ?auto_745961 ) ) ( not ( = ?auto_745955 ?auto_745962 ) ) ( not ( = ?auto_745955 ?auto_745963 ) ) ( not ( = ?auto_745955 ?auto_745964 ) ) ( not ( = ?auto_745955 ?auto_745965 ) ) ( not ( = ?auto_745955 ?auto_745966 ) ) ( not ( = ?auto_745955 ?auto_745967 ) ) ( not ( = ?auto_745955 ?auto_745968 ) ) ( not ( = ?auto_745955 ?auto_745969 ) ) ( not ( = ?auto_745955 ?auto_745970 ) ) ( not ( = ?auto_745956 ?auto_745957 ) ) ( not ( = ?auto_745956 ?auto_745958 ) ) ( not ( = ?auto_745956 ?auto_745959 ) ) ( not ( = ?auto_745956 ?auto_745960 ) ) ( not ( = ?auto_745956 ?auto_745961 ) ) ( not ( = ?auto_745956 ?auto_745962 ) ) ( not ( = ?auto_745956 ?auto_745963 ) ) ( not ( = ?auto_745956 ?auto_745964 ) ) ( not ( = ?auto_745956 ?auto_745965 ) ) ( not ( = ?auto_745956 ?auto_745966 ) ) ( not ( = ?auto_745956 ?auto_745967 ) ) ( not ( = ?auto_745956 ?auto_745968 ) ) ( not ( = ?auto_745956 ?auto_745969 ) ) ( not ( = ?auto_745956 ?auto_745970 ) ) ( not ( = ?auto_745957 ?auto_745958 ) ) ( not ( = ?auto_745957 ?auto_745959 ) ) ( not ( = ?auto_745957 ?auto_745960 ) ) ( not ( = ?auto_745957 ?auto_745961 ) ) ( not ( = ?auto_745957 ?auto_745962 ) ) ( not ( = ?auto_745957 ?auto_745963 ) ) ( not ( = ?auto_745957 ?auto_745964 ) ) ( not ( = ?auto_745957 ?auto_745965 ) ) ( not ( = ?auto_745957 ?auto_745966 ) ) ( not ( = ?auto_745957 ?auto_745967 ) ) ( not ( = ?auto_745957 ?auto_745968 ) ) ( not ( = ?auto_745957 ?auto_745969 ) ) ( not ( = ?auto_745957 ?auto_745970 ) ) ( not ( = ?auto_745958 ?auto_745959 ) ) ( not ( = ?auto_745958 ?auto_745960 ) ) ( not ( = ?auto_745958 ?auto_745961 ) ) ( not ( = ?auto_745958 ?auto_745962 ) ) ( not ( = ?auto_745958 ?auto_745963 ) ) ( not ( = ?auto_745958 ?auto_745964 ) ) ( not ( = ?auto_745958 ?auto_745965 ) ) ( not ( = ?auto_745958 ?auto_745966 ) ) ( not ( = ?auto_745958 ?auto_745967 ) ) ( not ( = ?auto_745958 ?auto_745968 ) ) ( not ( = ?auto_745958 ?auto_745969 ) ) ( not ( = ?auto_745958 ?auto_745970 ) ) ( not ( = ?auto_745959 ?auto_745960 ) ) ( not ( = ?auto_745959 ?auto_745961 ) ) ( not ( = ?auto_745959 ?auto_745962 ) ) ( not ( = ?auto_745959 ?auto_745963 ) ) ( not ( = ?auto_745959 ?auto_745964 ) ) ( not ( = ?auto_745959 ?auto_745965 ) ) ( not ( = ?auto_745959 ?auto_745966 ) ) ( not ( = ?auto_745959 ?auto_745967 ) ) ( not ( = ?auto_745959 ?auto_745968 ) ) ( not ( = ?auto_745959 ?auto_745969 ) ) ( not ( = ?auto_745959 ?auto_745970 ) ) ( not ( = ?auto_745960 ?auto_745961 ) ) ( not ( = ?auto_745960 ?auto_745962 ) ) ( not ( = ?auto_745960 ?auto_745963 ) ) ( not ( = ?auto_745960 ?auto_745964 ) ) ( not ( = ?auto_745960 ?auto_745965 ) ) ( not ( = ?auto_745960 ?auto_745966 ) ) ( not ( = ?auto_745960 ?auto_745967 ) ) ( not ( = ?auto_745960 ?auto_745968 ) ) ( not ( = ?auto_745960 ?auto_745969 ) ) ( not ( = ?auto_745960 ?auto_745970 ) ) ( not ( = ?auto_745961 ?auto_745962 ) ) ( not ( = ?auto_745961 ?auto_745963 ) ) ( not ( = ?auto_745961 ?auto_745964 ) ) ( not ( = ?auto_745961 ?auto_745965 ) ) ( not ( = ?auto_745961 ?auto_745966 ) ) ( not ( = ?auto_745961 ?auto_745967 ) ) ( not ( = ?auto_745961 ?auto_745968 ) ) ( not ( = ?auto_745961 ?auto_745969 ) ) ( not ( = ?auto_745961 ?auto_745970 ) ) ( not ( = ?auto_745962 ?auto_745963 ) ) ( not ( = ?auto_745962 ?auto_745964 ) ) ( not ( = ?auto_745962 ?auto_745965 ) ) ( not ( = ?auto_745962 ?auto_745966 ) ) ( not ( = ?auto_745962 ?auto_745967 ) ) ( not ( = ?auto_745962 ?auto_745968 ) ) ( not ( = ?auto_745962 ?auto_745969 ) ) ( not ( = ?auto_745962 ?auto_745970 ) ) ( not ( = ?auto_745963 ?auto_745964 ) ) ( not ( = ?auto_745963 ?auto_745965 ) ) ( not ( = ?auto_745963 ?auto_745966 ) ) ( not ( = ?auto_745963 ?auto_745967 ) ) ( not ( = ?auto_745963 ?auto_745968 ) ) ( not ( = ?auto_745963 ?auto_745969 ) ) ( not ( = ?auto_745963 ?auto_745970 ) ) ( not ( = ?auto_745964 ?auto_745965 ) ) ( not ( = ?auto_745964 ?auto_745966 ) ) ( not ( = ?auto_745964 ?auto_745967 ) ) ( not ( = ?auto_745964 ?auto_745968 ) ) ( not ( = ?auto_745964 ?auto_745969 ) ) ( not ( = ?auto_745964 ?auto_745970 ) ) ( not ( = ?auto_745965 ?auto_745966 ) ) ( not ( = ?auto_745965 ?auto_745967 ) ) ( not ( = ?auto_745965 ?auto_745968 ) ) ( not ( = ?auto_745965 ?auto_745969 ) ) ( not ( = ?auto_745965 ?auto_745970 ) ) ( not ( = ?auto_745966 ?auto_745967 ) ) ( not ( = ?auto_745966 ?auto_745968 ) ) ( not ( = ?auto_745966 ?auto_745969 ) ) ( not ( = ?auto_745966 ?auto_745970 ) ) ( not ( = ?auto_745967 ?auto_745968 ) ) ( not ( = ?auto_745967 ?auto_745969 ) ) ( not ( = ?auto_745967 ?auto_745970 ) ) ( not ( = ?auto_745968 ?auto_745969 ) ) ( not ( = ?auto_745968 ?auto_745970 ) ) ( not ( = ?auto_745969 ?auto_745970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_745969 ?auto_745970 )
      ( !STACK ?auto_745969 ?auto_745968 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746023 - BLOCK
      ?auto_746024 - BLOCK
      ?auto_746025 - BLOCK
      ?auto_746026 - BLOCK
      ?auto_746027 - BLOCK
      ?auto_746028 - BLOCK
      ?auto_746029 - BLOCK
      ?auto_746030 - BLOCK
      ?auto_746031 - BLOCK
      ?auto_746032 - BLOCK
      ?auto_746033 - BLOCK
      ?auto_746034 - BLOCK
      ?auto_746035 - BLOCK
      ?auto_746036 - BLOCK
      ?auto_746037 - BLOCK
      ?auto_746038 - BLOCK
      ?auto_746039 - BLOCK
    )
    :vars
    (
      ?auto_746040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746039 ?auto_746040 ) ( ON-TABLE ?auto_746023 ) ( ON ?auto_746024 ?auto_746023 ) ( ON ?auto_746025 ?auto_746024 ) ( ON ?auto_746026 ?auto_746025 ) ( ON ?auto_746027 ?auto_746026 ) ( ON ?auto_746028 ?auto_746027 ) ( ON ?auto_746029 ?auto_746028 ) ( ON ?auto_746030 ?auto_746029 ) ( ON ?auto_746031 ?auto_746030 ) ( ON ?auto_746032 ?auto_746031 ) ( ON ?auto_746033 ?auto_746032 ) ( ON ?auto_746034 ?auto_746033 ) ( ON ?auto_746035 ?auto_746034 ) ( ON ?auto_746036 ?auto_746035 ) ( ON ?auto_746037 ?auto_746036 ) ( not ( = ?auto_746023 ?auto_746024 ) ) ( not ( = ?auto_746023 ?auto_746025 ) ) ( not ( = ?auto_746023 ?auto_746026 ) ) ( not ( = ?auto_746023 ?auto_746027 ) ) ( not ( = ?auto_746023 ?auto_746028 ) ) ( not ( = ?auto_746023 ?auto_746029 ) ) ( not ( = ?auto_746023 ?auto_746030 ) ) ( not ( = ?auto_746023 ?auto_746031 ) ) ( not ( = ?auto_746023 ?auto_746032 ) ) ( not ( = ?auto_746023 ?auto_746033 ) ) ( not ( = ?auto_746023 ?auto_746034 ) ) ( not ( = ?auto_746023 ?auto_746035 ) ) ( not ( = ?auto_746023 ?auto_746036 ) ) ( not ( = ?auto_746023 ?auto_746037 ) ) ( not ( = ?auto_746023 ?auto_746038 ) ) ( not ( = ?auto_746023 ?auto_746039 ) ) ( not ( = ?auto_746023 ?auto_746040 ) ) ( not ( = ?auto_746024 ?auto_746025 ) ) ( not ( = ?auto_746024 ?auto_746026 ) ) ( not ( = ?auto_746024 ?auto_746027 ) ) ( not ( = ?auto_746024 ?auto_746028 ) ) ( not ( = ?auto_746024 ?auto_746029 ) ) ( not ( = ?auto_746024 ?auto_746030 ) ) ( not ( = ?auto_746024 ?auto_746031 ) ) ( not ( = ?auto_746024 ?auto_746032 ) ) ( not ( = ?auto_746024 ?auto_746033 ) ) ( not ( = ?auto_746024 ?auto_746034 ) ) ( not ( = ?auto_746024 ?auto_746035 ) ) ( not ( = ?auto_746024 ?auto_746036 ) ) ( not ( = ?auto_746024 ?auto_746037 ) ) ( not ( = ?auto_746024 ?auto_746038 ) ) ( not ( = ?auto_746024 ?auto_746039 ) ) ( not ( = ?auto_746024 ?auto_746040 ) ) ( not ( = ?auto_746025 ?auto_746026 ) ) ( not ( = ?auto_746025 ?auto_746027 ) ) ( not ( = ?auto_746025 ?auto_746028 ) ) ( not ( = ?auto_746025 ?auto_746029 ) ) ( not ( = ?auto_746025 ?auto_746030 ) ) ( not ( = ?auto_746025 ?auto_746031 ) ) ( not ( = ?auto_746025 ?auto_746032 ) ) ( not ( = ?auto_746025 ?auto_746033 ) ) ( not ( = ?auto_746025 ?auto_746034 ) ) ( not ( = ?auto_746025 ?auto_746035 ) ) ( not ( = ?auto_746025 ?auto_746036 ) ) ( not ( = ?auto_746025 ?auto_746037 ) ) ( not ( = ?auto_746025 ?auto_746038 ) ) ( not ( = ?auto_746025 ?auto_746039 ) ) ( not ( = ?auto_746025 ?auto_746040 ) ) ( not ( = ?auto_746026 ?auto_746027 ) ) ( not ( = ?auto_746026 ?auto_746028 ) ) ( not ( = ?auto_746026 ?auto_746029 ) ) ( not ( = ?auto_746026 ?auto_746030 ) ) ( not ( = ?auto_746026 ?auto_746031 ) ) ( not ( = ?auto_746026 ?auto_746032 ) ) ( not ( = ?auto_746026 ?auto_746033 ) ) ( not ( = ?auto_746026 ?auto_746034 ) ) ( not ( = ?auto_746026 ?auto_746035 ) ) ( not ( = ?auto_746026 ?auto_746036 ) ) ( not ( = ?auto_746026 ?auto_746037 ) ) ( not ( = ?auto_746026 ?auto_746038 ) ) ( not ( = ?auto_746026 ?auto_746039 ) ) ( not ( = ?auto_746026 ?auto_746040 ) ) ( not ( = ?auto_746027 ?auto_746028 ) ) ( not ( = ?auto_746027 ?auto_746029 ) ) ( not ( = ?auto_746027 ?auto_746030 ) ) ( not ( = ?auto_746027 ?auto_746031 ) ) ( not ( = ?auto_746027 ?auto_746032 ) ) ( not ( = ?auto_746027 ?auto_746033 ) ) ( not ( = ?auto_746027 ?auto_746034 ) ) ( not ( = ?auto_746027 ?auto_746035 ) ) ( not ( = ?auto_746027 ?auto_746036 ) ) ( not ( = ?auto_746027 ?auto_746037 ) ) ( not ( = ?auto_746027 ?auto_746038 ) ) ( not ( = ?auto_746027 ?auto_746039 ) ) ( not ( = ?auto_746027 ?auto_746040 ) ) ( not ( = ?auto_746028 ?auto_746029 ) ) ( not ( = ?auto_746028 ?auto_746030 ) ) ( not ( = ?auto_746028 ?auto_746031 ) ) ( not ( = ?auto_746028 ?auto_746032 ) ) ( not ( = ?auto_746028 ?auto_746033 ) ) ( not ( = ?auto_746028 ?auto_746034 ) ) ( not ( = ?auto_746028 ?auto_746035 ) ) ( not ( = ?auto_746028 ?auto_746036 ) ) ( not ( = ?auto_746028 ?auto_746037 ) ) ( not ( = ?auto_746028 ?auto_746038 ) ) ( not ( = ?auto_746028 ?auto_746039 ) ) ( not ( = ?auto_746028 ?auto_746040 ) ) ( not ( = ?auto_746029 ?auto_746030 ) ) ( not ( = ?auto_746029 ?auto_746031 ) ) ( not ( = ?auto_746029 ?auto_746032 ) ) ( not ( = ?auto_746029 ?auto_746033 ) ) ( not ( = ?auto_746029 ?auto_746034 ) ) ( not ( = ?auto_746029 ?auto_746035 ) ) ( not ( = ?auto_746029 ?auto_746036 ) ) ( not ( = ?auto_746029 ?auto_746037 ) ) ( not ( = ?auto_746029 ?auto_746038 ) ) ( not ( = ?auto_746029 ?auto_746039 ) ) ( not ( = ?auto_746029 ?auto_746040 ) ) ( not ( = ?auto_746030 ?auto_746031 ) ) ( not ( = ?auto_746030 ?auto_746032 ) ) ( not ( = ?auto_746030 ?auto_746033 ) ) ( not ( = ?auto_746030 ?auto_746034 ) ) ( not ( = ?auto_746030 ?auto_746035 ) ) ( not ( = ?auto_746030 ?auto_746036 ) ) ( not ( = ?auto_746030 ?auto_746037 ) ) ( not ( = ?auto_746030 ?auto_746038 ) ) ( not ( = ?auto_746030 ?auto_746039 ) ) ( not ( = ?auto_746030 ?auto_746040 ) ) ( not ( = ?auto_746031 ?auto_746032 ) ) ( not ( = ?auto_746031 ?auto_746033 ) ) ( not ( = ?auto_746031 ?auto_746034 ) ) ( not ( = ?auto_746031 ?auto_746035 ) ) ( not ( = ?auto_746031 ?auto_746036 ) ) ( not ( = ?auto_746031 ?auto_746037 ) ) ( not ( = ?auto_746031 ?auto_746038 ) ) ( not ( = ?auto_746031 ?auto_746039 ) ) ( not ( = ?auto_746031 ?auto_746040 ) ) ( not ( = ?auto_746032 ?auto_746033 ) ) ( not ( = ?auto_746032 ?auto_746034 ) ) ( not ( = ?auto_746032 ?auto_746035 ) ) ( not ( = ?auto_746032 ?auto_746036 ) ) ( not ( = ?auto_746032 ?auto_746037 ) ) ( not ( = ?auto_746032 ?auto_746038 ) ) ( not ( = ?auto_746032 ?auto_746039 ) ) ( not ( = ?auto_746032 ?auto_746040 ) ) ( not ( = ?auto_746033 ?auto_746034 ) ) ( not ( = ?auto_746033 ?auto_746035 ) ) ( not ( = ?auto_746033 ?auto_746036 ) ) ( not ( = ?auto_746033 ?auto_746037 ) ) ( not ( = ?auto_746033 ?auto_746038 ) ) ( not ( = ?auto_746033 ?auto_746039 ) ) ( not ( = ?auto_746033 ?auto_746040 ) ) ( not ( = ?auto_746034 ?auto_746035 ) ) ( not ( = ?auto_746034 ?auto_746036 ) ) ( not ( = ?auto_746034 ?auto_746037 ) ) ( not ( = ?auto_746034 ?auto_746038 ) ) ( not ( = ?auto_746034 ?auto_746039 ) ) ( not ( = ?auto_746034 ?auto_746040 ) ) ( not ( = ?auto_746035 ?auto_746036 ) ) ( not ( = ?auto_746035 ?auto_746037 ) ) ( not ( = ?auto_746035 ?auto_746038 ) ) ( not ( = ?auto_746035 ?auto_746039 ) ) ( not ( = ?auto_746035 ?auto_746040 ) ) ( not ( = ?auto_746036 ?auto_746037 ) ) ( not ( = ?auto_746036 ?auto_746038 ) ) ( not ( = ?auto_746036 ?auto_746039 ) ) ( not ( = ?auto_746036 ?auto_746040 ) ) ( not ( = ?auto_746037 ?auto_746038 ) ) ( not ( = ?auto_746037 ?auto_746039 ) ) ( not ( = ?auto_746037 ?auto_746040 ) ) ( not ( = ?auto_746038 ?auto_746039 ) ) ( not ( = ?auto_746038 ?auto_746040 ) ) ( not ( = ?auto_746039 ?auto_746040 ) ) ( CLEAR ?auto_746037 ) ( ON ?auto_746038 ?auto_746039 ) ( CLEAR ?auto_746038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_746023 ?auto_746024 ?auto_746025 ?auto_746026 ?auto_746027 ?auto_746028 ?auto_746029 ?auto_746030 ?auto_746031 ?auto_746032 ?auto_746033 ?auto_746034 ?auto_746035 ?auto_746036 ?auto_746037 ?auto_746038 )
      ( MAKE-17PILE ?auto_746023 ?auto_746024 ?auto_746025 ?auto_746026 ?auto_746027 ?auto_746028 ?auto_746029 ?auto_746030 ?auto_746031 ?auto_746032 ?auto_746033 ?auto_746034 ?auto_746035 ?auto_746036 ?auto_746037 ?auto_746038 ?auto_746039 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746093 - BLOCK
      ?auto_746094 - BLOCK
      ?auto_746095 - BLOCK
      ?auto_746096 - BLOCK
      ?auto_746097 - BLOCK
      ?auto_746098 - BLOCK
      ?auto_746099 - BLOCK
      ?auto_746100 - BLOCK
      ?auto_746101 - BLOCK
      ?auto_746102 - BLOCK
      ?auto_746103 - BLOCK
      ?auto_746104 - BLOCK
      ?auto_746105 - BLOCK
      ?auto_746106 - BLOCK
      ?auto_746107 - BLOCK
      ?auto_746108 - BLOCK
      ?auto_746109 - BLOCK
    )
    :vars
    (
      ?auto_746110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746109 ?auto_746110 ) ( ON-TABLE ?auto_746093 ) ( ON ?auto_746094 ?auto_746093 ) ( ON ?auto_746095 ?auto_746094 ) ( ON ?auto_746096 ?auto_746095 ) ( ON ?auto_746097 ?auto_746096 ) ( ON ?auto_746098 ?auto_746097 ) ( ON ?auto_746099 ?auto_746098 ) ( ON ?auto_746100 ?auto_746099 ) ( ON ?auto_746101 ?auto_746100 ) ( ON ?auto_746102 ?auto_746101 ) ( ON ?auto_746103 ?auto_746102 ) ( ON ?auto_746104 ?auto_746103 ) ( ON ?auto_746105 ?auto_746104 ) ( ON ?auto_746106 ?auto_746105 ) ( not ( = ?auto_746093 ?auto_746094 ) ) ( not ( = ?auto_746093 ?auto_746095 ) ) ( not ( = ?auto_746093 ?auto_746096 ) ) ( not ( = ?auto_746093 ?auto_746097 ) ) ( not ( = ?auto_746093 ?auto_746098 ) ) ( not ( = ?auto_746093 ?auto_746099 ) ) ( not ( = ?auto_746093 ?auto_746100 ) ) ( not ( = ?auto_746093 ?auto_746101 ) ) ( not ( = ?auto_746093 ?auto_746102 ) ) ( not ( = ?auto_746093 ?auto_746103 ) ) ( not ( = ?auto_746093 ?auto_746104 ) ) ( not ( = ?auto_746093 ?auto_746105 ) ) ( not ( = ?auto_746093 ?auto_746106 ) ) ( not ( = ?auto_746093 ?auto_746107 ) ) ( not ( = ?auto_746093 ?auto_746108 ) ) ( not ( = ?auto_746093 ?auto_746109 ) ) ( not ( = ?auto_746093 ?auto_746110 ) ) ( not ( = ?auto_746094 ?auto_746095 ) ) ( not ( = ?auto_746094 ?auto_746096 ) ) ( not ( = ?auto_746094 ?auto_746097 ) ) ( not ( = ?auto_746094 ?auto_746098 ) ) ( not ( = ?auto_746094 ?auto_746099 ) ) ( not ( = ?auto_746094 ?auto_746100 ) ) ( not ( = ?auto_746094 ?auto_746101 ) ) ( not ( = ?auto_746094 ?auto_746102 ) ) ( not ( = ?auto_746094 ?auto_746103 ) ) ( not ( = ?auto_746094 ?auto_746104 ) ) ( not ( = ?auto_746094 ?auto_746105 ) ) ( not ( = ?auto_746094 ?auto_746106 ) ) ( not ( = ?auto_746094 ?auto_746107 ) ) ( not ( = ?auto_746094 ?auto_746108 ) ) ( not ( = ?auto_746094 ?auto_746109 ) ) ( not ( = ?auto_746094 ?auto_746110 ) ) ( not ( = ?auto_746095 ?auto_746096 ) ) ( not ( = ?auto_746095 ?auto_746097 ) ) ( not ( = ?auto_746095 ?auto_746098 ) ) ( not ( = ?auto_746095 ?auto_746099 ) ) ( not ( = ?auto_746095 ?auto_746100 ) ) ( not ( = ?auto_746095 ?auto_746101 ) ) ( not ( = ?auto_746095 ?auto_746102 ) ) ( not ( = ?auto_746095 ?auto_746103 ) ) ( not ( = ?auto_746095 ?auto_746104 ) ) ( not ( = ?auto_746095 ?auto_746105 ) ) ( not ( = ?auto_746095 ?auto_746106 ) ) ( not ( = ?auto_746095 ?auto_746107 ) ) ( not ( = ?auto_746095 ?auto_746108 ) ) ( not ( = ?auto_746095 ?auto_746109 ) ) ( not ( = ?auto_746095 ?auto_746110 ) ) ( not ( = ?auto_746096 ?auto_746097 ) ) ( not ( = ?auto_746096 ?auto_746098 ) ) ( not ( = ?auto_746096 ?auto_746099 ) ) ( not ( = ?auto_746096 ?auto_746100 ) ) ( not ( = ?auto_746096 ?auto_746101 ) ) ( not ( = ?auto_746096 ?auto_746102 ) ) ( not ( = ?auto_746096 ?auto_746103 ) ) ( not ( = ?auto_746096 ?auto_746104 ) ) ( not ( = ?auto_746096 ?auto_746105 ) ) ( not ( = ?auto_746096 ?auto_746106 ) ) ( not ( = ?auto_746096 ?auto_746107 ) ) ( not ( = ?auto_746096 ?auto_746108 ) ) ( not ( = ?auto_746096 ?auto_746109 ) ) ( not ( = ?auto_746096 ?auto_746110 ) ) ( not ( = ?auto_746097 ?auto_746098 ) ) ( not ( = ?auto_746097 ?auto_746099 ) ) ( not ( = ?auto_746097 ?auto_746100 ) ) ( not ( = ?auto_746097 ?auto_746101 ) ) ( not ( = ?auto_746097 ?auto_746102 ) ) ( not ( = ?auto_746097 ?auto_746103 ) ) ( not ( = ?auto_746097 ?auto_746104 ) ) ( not ( = ?auto_746097 ?auto_746105 ) ) ( not ( = ?auto_746097 ?auto_746106 ) ) ( not ( = ?auto_746097 ?auto_746107 ) ) ( not ( = ?auto_746097 ?auto_746108 ) ) ( not ( = ?auto_746097 ?auto_746109 ) ) ( not ( = ?auto_746097 ?auto_746110 ) ) ( not ( = ?auto_746098 ?auto_746099 ) ) ( not ( = ?auto_746098 ?auto_746100 ) ) ( not ( = ?auto_746098 ?auto_746101 ) ) ( not ( = ?auto_746098 ?auto_746102 ) ) ( not ( = ?auto_746098 ?auto_746103 ) ) ( not ( = ?auto_746098 ?auto_746104 ) ) ( not ( = ?auto_746098 ?auto_746105 ) ) ( not ( = ?auto_746098 ?auto_746106 ) ) ( not ( = ?auto_746098 ?auto_746107 ) ) ( not ( = ?auto_746098 ?auto_746108 ) ) ( not ( = ?auto_746098 ?auto_746109 ) ) ( not ( = ?auto_746098 ?auto_746110 ) ) ( not ( = ?auto_746099 ?auto_746100 ) ) ( not ( = ?auto_746099 ?auto_746101 ) ) ( not ( = ?auto_746099 ?auto_746102 ) ) ( not ( = ?auto_746099 ?auto_746103 ) ) ( not ( = ?auto_746099 ?auto_746104 ) ) ( not ( = ?auto_746099 ?auto_746105 ) ) ( not ( = ?auto_746099 ?auto_746106 ) ) ( not ( = ?auto_746099 ?auto_746107 ) ) ( not ( = ?auto_746099 ?auto_746108 ) ) ( not ( = ?auto_746099 ?auto_746109 ) ) ( not ( = ?auto_746099 ?auto_746110 ) ) ( not ( = ?auto_746100 ?auto_746101 ) ) ( not ( = ?auto_746100 ?auto_746102 ) ) ( not ( = ?auto_746100 ?auto_746103 ) ) ( not ( = ?auto_746100 ?auto_746104 ) ) ( not ( = ?auto_746100 ?auto_746105 ) ) ( not ( = ?auto_746100 ?auto_746106 ) ) ( not ( = ?auto_746100 ?auto_746107 ) ) ( not ( = ?auto_746100 ?auto_746108 ) ) ( not ( = ?auto_746100 ?auto_746109 ) ) ( not ( = ?auto_746100 ?auto_746110 ) ) ( not ( = ?auto_746101 ?auto_746102 ) ) ( not ( = ?auto_746101 ?auto_746103 ) ) ( not ( = ?auto_746101 ?auto_746104 ) ) ( not ( = ?auto_746101 ?auto_746105 ) ) ( not ( = ?auto_746101 ?auto_746106 ) ) ( not ( = ?auto_746101 ?auto_746107 ) ) ( not ( = ?auto_746101 ?auto_746108 ) ) ( not ( = ?auto_746101 ?auto_746109 ) ) ( not ( = ?auto_746101 ?auto_746110 ) ) ( not ( = ?auto_746102 ?auto_746103 ) ) ( not ( = ?auto_746102 ?auto_746104 ) ) ( not ( = ?auto_746102 ?auto_746105 ) ) ( not ( = ?auto_746102 ?auto_746106 ) ) ( not ( = ?auto_746102 ?auto_746107 ) ) ( not ( = ?auto_746102 ?auto_746108 ) ) ( not ( = ?auto_746102 ?auto_746109 ) ) ( not ( = ?auto_746102 ?auto_746110 ) ) ( not ( = ?auto_746103 ?auto_746104 ) ) ( not ( = ?auto_746103 ?auto_746105 ) ) ( not ( = ?auto_746103 ?auto_746106 ) ) ( not ( = ?auto_746103 ?auto_746107 ) ) ( not ( = ?auto_746103 ?auto_746108 ) ) ( not ( = ?auto_746103 ?auto_746109 ) ) ( not ( = ?auto_746103 ?auto_746110 ) ) ( not ( = ?auto_746104 ?auto_746105 ) ) ( not ( = ?auto_746104 ?auto_746106 ) ) ( not ( = ?auto_746104 ?auto_746107 ) ) ( not ( = ?auto_746104 ?auto_746108 ) ) ( not ( = ?auto_746104 ?auto_746109 ) ) ( not ( = ?auto_746104 ?auto_746110 ) ) ( not ( = ?auto_746105 ?auto_746106 ) ) ( not ( = ?auto_746105 ?auto_746107 ) ) ( not ( = ?auto_746105 ?auto_746108 ) ) ( not ( = ?auto_746105 ?auto_746109 ) ) ( not ( = ?auto_746105 ?auto_746110 ) ) ( not ( = ?auto_746106 ?auto_746107 ) ) ( not ( = ?auto_746106 ?auto_746108 ) ) ( not ( = ?auto_746106 ?auto_746109 ) ) ( not ( = ?auto_746106 ?auto_746110 ) ) ( not ( = ?auto_746107 ?auto_746108 ) ) ( not ( = ?auto_746107 ?auto_746109 ) ) ( not ( = ?auto_746107 ?auto_746110 ) ) ( not ( = ?auto_746108 ?auto_746109 ) ) ( not ( = ?auto_746108 ?auto_746110 ) ) ( not ( = ?auto_746109 ?auto_746110 ) ) ( ON ?auto_746108 ?auto_746109 ) ( CLEAR ?auto_746106 ) ( ON ?auto_746107 ?auto_746108 ) ( CLEAR ?auto_746107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_746093 ?auto_746094 ?auto_746095 ?auto_746096 ?auto_746097 ?auto_746098 ?auto_746099 ?auto_746100 ?auto_746101 ?auto_746102 ?auto_746103 ?auto_746104 ?auto_746105 ?auto_746106 ?auto_746107 )
      ( MAKE-17PILE ?auto_746093 ?auto_746094 ?auto_746095 ?auto_746096 ?auto_746097 ?auto_746098 ?auto_746099 ?auto_746100 ?auto_746101 ?auto_746102 ?auto_746103 ?auto_746104 ?auto_746105 ?auto_746106 ?auto_746107 ?auto_746108 ?auto_746109 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746163 - BLOCK
      ?auto_746164 - BLOCK
      ?auto_746165 - BLOCK
      ?auto_746166 - BLOCK
      ?auto_746167 - BLOCK
      ?auto_746168 - BLOCK
      ?auto_746169 - BLOCK
      ?auto_746170 - BLOCK
      ?auto_746171 - BLOCK
      ?auto_746172 - BLOCK
      ?auto_746173 - BLOCK
      ?auto_746174 - BLOCK
      ?auto_746175 - BLOCK
      ?auto_746176 - BLOCK
      ?auto_746177 - BLOCK
      ?auto_746178 - BLOCK
      ?auto_746179 - BLOCK
    )
    :vars
    (
      ?auto_746180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746179 ?auto_746180 ) ( ON-TABLE ?auto_746163 ) ( ON ?auto_746164 ?auto_746163 ) ( ON ?auto_746165 ?auto_746164 ) ( ON ?auto_746166 ?auto_746165 ) ( ON ?auto_746167 ?auto_746166 ) ( ON ?auto_746168 ?auto_746167 ) ( ON ?auto_746169 ?auto_746168 ) ( ON ?auto_746170 ?auto_746169 ) ( ON ?auto_746171 ?auto_746170 ) ( ON ?auto_746172 ?auto_746171 ) ( ON ?auto_746173 ?auto_746172 ) ( ON ?auto_746174 ?auto_746173 ) ( ON ?auto_746175 ?auto_746174 ) ( not ( = ?auto_746163 ?auto_746164 ) ) ( not ( = ?auto_746163 ?auto_746165 ) ) ( not ( = ?auto_746163 ?auto_746166 ) ) ( not ( = ?auto_746163 ?auto_746167 ) ) ( not ( = ?auto_746163 ?auto_746168 ) ) ( not ( = ?auto_746163 ?auto_746169 ) ) ( not ( = ?auto_746163 ?auto_746170 ) ) ( not ( = ?auto_746163 ?auto_746171 ) ) ( not ( = ?auto_746163 ?auto_746172 ) ) ( not ( = ?auto_746163 ?auto_746173 ) ) ( not ( = ?auto_746163 ?auto_746174 ) ) ( not ( = ?auto_746163 ?auto_746175 ) ) ( not ( = ?auto_746163 ?auto_746176 ) ) ( not ( = ?auto_746163 ?auto_746177 ) ) ( not ( = ?auto_746163 ?auto_746178 ) ) ( not ( = ?auto_746163 ?auto_746179 ) ) ( not ( = ?auto_746163 ?auto_746180 ) ) ( not ( = ?auto_746164 ?auto_746165 ) ) ( not ( = ?auto_746164 ?auto_746166 ) ) ( not ( = ?auto_746164 ?auto_746167 ) ) ( not ( = ?auto_746164 ?auto_746168 ) ) ( not ( = ?auto_746164 ?auto_746169 ) ) ( not ( = ?auto_746164 ?auto_746170 ) ) ( not ( = ?auto_746164 ?auto_746171 ) ) ( not ( = ?auto_746164 ?auto_746172 ) ) ( not ( = ?auto_746164 ?auto_746173 ) ) ( not ( = ?auto_746164 ?auto_746174 ) ) ( not ( = ?auto_746164 ?auto_746175 ) ) ( not ( = ?auto_746164 ?auto_746176 ) ) ( not ( = ?auto_746164 ?auto_746177 ) ) ( not ( = ?auto_746164 ?auto_746178 ) ) ( not ( = ?auto_746164 ?auto_746179 ) ) ( not ( = ?auto_746164 ?auto_746180 ) ) ( not ( = ?auto_746165 ?auto_746166 ) ) ( not ( = ?auto_746165 ?auto_746167 ) ) ( not ( = ?auto_746165 ?auto_746168 ) ) ( not ( = ?auto_746165 ?auto_746169 ) ) ( not ( = ?auto_746165 ?auto_746170 ) ) ( not ( = ?auto_746165 ?auto_746171 ) ) ( not ( = ?auto_746165 ?auto_746172 ) ) ( not ( = ?auto_746165 ?auto_746173 ) ) ( not ( = ?auto_746165 ?auto_746174 ) ) ( not ( = ?auto_746165 ?auto_746175 ) ) ( not ( = ?auto_746165 ?auto_746176 ) ) ( not ( = ?auto_746165 ?auto_746177 ) ) ( not ( = ?auto_746165 ?auto_746178 ) ) ( not ( = ?auto_746165 ?auto_746179 ) ) ( not ( = ?auto_746165 ?auto_746180 ) ) ( not ( = ?auto_746166 ?auto_746167 ) ) ( not ( = ?auto_746166 ?auto_746168 ) ) ( not ( = ?auto_746166 ?auto_746169 ) ) ( not ( = ?auto_746166 ?auto_746170 ) ) ( not ( = ?auto_746166 ?auto_746171 ) ) ( not ( = ?auto_746166 ?auto_746172 ) ) ( not ( = ?auto_746166 ?auto_746173 ) ) ( not ( = ?auto_746166 ?auto_746174 ) ) ( not ( = ?auto_746166 ?auto_746175 ) ) ( not ( = ?auto_746166 ?auto_746176 ) ) ( not ( = ?auto_746166 ?auto_746177 ) ) ( not ( = ?auto_746166 ?auto_746178 ) ) ( not ( = ?auto_746166 ?auto_746179 ) ) ( not ( = ?auto_746166 ?auto_746180 ) ) ( not ( = ?auto_746167 ?auto_746168 ) ) ( not ( = ?auto_746167 ?auto_746169 ) ) ( not ( = ?auto_746167 ?auto_746170 ) ) ( not ( = ?auto_746167 ?auto_746171 ) ) ( not ( = ?auto_746167 ?auto_746172 ) ) ( not ( = ?auto_746167 ?auto_746173 ) ) ( not ( = ?auto_746167 ?auto_746174 ) ) ( not ( = ?auto_746167 ?auto_746175 ) ) ( not ( = ?auto_746167 ?auto_746176 ) ) ( not ( = ?auto_746167 ?auto_746177 ) ) ( not ( = ?auto_746167 ?auto_746178 ) ) ( not ( = ?auto_746167 ?auto_746179 ) ) ( not ( = ?auto_746167 ?auto_746180 ) ) ( not ( = ?auto_746168 ?auto_746169 ) ) ( not ( = ?auto_746168 ?auto_746170 ) ) ( not ( = ?auto_746168 ?auto_746171 ) ) ( not ( = ?auto_746168 ?auto_746172 ) ) ( not ( = ?auto_746168 ?auto_746173 ) ) ( not ( = ?auto_746168 ?auto_746174 ) ) ( not ( = ?auto_746168 ?auto_746175 ) ) ( not ( = ?auto_746168 ?auto_746176 ) ) ( not ( = ?auto_746168 ?auto_746177 ) ) ( not ( = ?auto_746168 ?auto_746178 ) ) ( not ( = ?auto_746168 ?auto_746179 ) ) ( not ( = ?auto_746168 ?auto_746180 ) ) ( not ( = ?auto_746169 ?auto_746170 ) ) ( not ( = ?auto_746169 ?auto_746171 ) ) ( not ( = ?auto_746169 ?auto_746172 ) ) ( not ( = ?auto_746169 ?auto_746173 ) ) ( not ( = ?auto_746169 ?auto_746174 ) ) ( not ( = ?auto_746169 ?auto_746175 ) ) ( not ( = ?auto_746169 ?auto_746176 ) ) ( not ( = ?auto_746169 ?auto_746177 ) ) ( not ( = ?auto_746169 ?auto_746178 ) ) ( not ( = ?auto_746169 ?auto_746179 ) ) ( not ( = ?auto_746169 ?auto_746180 ) ) ( not ( = ?auto_746170 ?auto_746171 ) ) ( not ( = ?auto_746170 ?auto_746172 ) ) ( not ( = ?auto_746170 ?auto_746173 ) ) ( not ( = ?auto_746170 ?auto_746174 ) ) ( not ( = ?auto_746170 ?auto_746175 ) ) ( not ( = ?auto_746170 ?auto_746176 ) ) ( not ( = ?auto_746170 ?auto_746177 ) ) ( not ( = ?auto_746170 ?auto_746178 ) ) ( not ( = ?auto_746170 ?auto_746179 ) ) ( not ( = ?auto_746170 ?auto_746180 ) ) ( not ( = ?auto_746171 ?auto_746172 ) ) ( not ( = ?auto_746171 ?auto_746173 ) ) ( not ( = ?auto_746171 ?auto_746174 ) ) ( not ( = ?auto_746171 ?auto_746175 ) ) ( not ( = ?auto_746171 ?auto_746176 ) ) ( not ( = ?auto_746171 ?auto_746177 ) ) ( not ( = ?auto_746171 ?auto_746178 ) ) ( not ( = ?auto_746171 ?auto_746179 ) ) ( not ( = ?auto_746171 ?auto_746180 ) ) ( not ( = ?auto_746172 ?auto_746173 ) ) ( not ( = ?auto_746172 ?auto_746174 ) ) ( not ( = ?auto_746172 ?auto_746175 ) ) ( not ( = ?auto_746172 ?auto_746176 ) ) ( not ( = ?auto_746172 ?auto_746177 ) ) ( not ( = ?auto_746172 ?auto_746178 ) ) ( not ( = ?auto_746172 ?auto_746179 ) ) ( not ( = ?auto_746172 ?auto_746180 ) ) ( not ( = ?auto_746173 ?auto_746174 ) ) ( not ( = ?auto_746173 ?auto_746175 ) ) ( not ( = ?auto_746173 ?auto_746176 ) ) ( not ( = ?auto_746173 ?auto_746177 ) ) ( not ( = ?auto_746173 ?auto_746178 ) ) ( not ( = ?auto_746173 ?auto_746179 ) ) ( not ( = ?auto_746173 ?auto_746180 ) ) ( not ( = ?auto_746174 ?auto_746175 ) ) ( not ( = ?auto_746174 ?auto_746176 ) ) ( not ( = ?auto_746174 ?auto_746177 ) ) ( not ( = ?auto_746174 ?auto_746178 ) ) ( not ( = ?auto_746174 ?auto_746179 ) ) ( not ( = ?auto_746174 ?auto_746180 ) ) ( not ( = ?auto_746175 ?auto_746176 ) ) ( not ( = ?auto_746175 ?auto_746177 ) ) ( not ( = ?auto_746175 ?auto_746178 ) ) ( not ( = ?auto_746175 ?auto_746179 ) ) ( not ( = ?auto_746175 ?auto_746180 ) ) ( not ( = ?auto_746176 ?auto_746177 ) ) ( not ( = ?auto_746176 ?auto_746178 ) ) ( not ( = ?auto_746176 ?auto_746179 ) ) ( not ( = ?auto_746176 ?auto_746180 ) ) ( not ( = ?auto_746177 ?auto_746178 ) ) ( not ( = ?auto_746177 ?auto_746179 ) ) ( not ( = ?auto_746177 ?auto_746180 ) ) ( not ( = ?auto_746178 ?auto_746179 ) ) ( not ( = ?auto_746178 ?auto_746180 ) ) ( not ( = ?auto_746179 ?auto_746180 ) ) ( ON ?auto_746178 ?auto_746179 ) ( ON ?auto_746177 ?auto_746178 ) ( CLEAR ?auto_746175 ) ( ON ?auto_746176 ?auto_746177 ) ( CLEAR ?auto_746176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_746163 ?auto_746164 ?auto_746165 ?auto_746166 ?auto_746167 ?auto_746168 ?auto_746169 ?auto_746170 ?auto_746171 ?auto_746172 ?auto_746173 ?auto_746174 ?auto_746175 ?auto_746176 )
      ( MAKE-17PILE ?auto_746163 ?auto_746164 ?auto_746165 ?auto_746166 ?auto_746167 ?auto_746168 ?auto_746169 ?auto_746170 ?auto_746171 ?auto_746172 ?auto_746173 ?auto_746174 ?auto_746175 ?auto_746176 ?auto_746177 ?auto_746178 ?auto_746179 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746233 - BLOCK
      ?auto_746234 - BLOCK
      ?auto_746235 - BLOCK
      ?auto_746236 - BLOCK
      ?auto_746237 - BLOCK
      ?auto_746238 - BLOCK
      ?auto_746239 - BLOCK
      ?auto_746240 - BLOCK
      ?auto_746241 - BLOCK
      ?auto_746242 - BLOCK
      ?auto_746243 - BLOCK
      ?auto_746244 - BLOCK
      ?auto_746245 - BLOCK
      ?auto_746246 - BLOCK
      ?auto_746247 - BLOCK
      ?auto_746248 - BLOCK
      ?auto_746249 - BLOCK
    )
    :vars
    (
      ?auto_746250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746249 ?auto_746250 ) ( ON-TABLE ?auto_746233 ) ( ON ?auto_746234 ?auto_746233 ) ( ON ?auto_746235 ?auto_746234 ) ( ON ?auto_746236 ?auto_746235 ) ( ON ?auto_746237 ?auto_746236 ) ( ON ?auto_746238 ?auto_746237 ) ( ON ?auto_746239 ?auto_746238 ) ( ON ?auto_746240 ?auto_746239 ) ( ON ?auto_746241 ?auto_746240 ) ( ON ?auto_746242 ?auto_746241 ) ( ON ?auto_746243 ?auto_746242 ) ( ON ?auto_746244 ?auto_746243 ) ( not ( = ?auto_746233 ?auto_746234 ) ) ( not ( = ?auto_746233 ?auto_746235 ) ) ( not ( = ?auto_746233 ?auto_746236 ) ) ( not ( = ?auto_746233 ?auto_746237 ) ) ( not ( = ?auto_746233 ?auto_746238 ) ) ( not ( = ?auto_746233 ?auto_746239 ) ) ( not ( = ?auto_746233 ?auto_746240 ) ) ( not ( = ?auto_746233 ?auto_746241 ) ) ( not ( = ?auto_746233 ?auto_746242 ) ) ( not ( = ?auto_746233 ?auto_746243 ) ) ( not ( = ?auto_746233 ?auto_746244 ) ) ( not ( = ?auto_746233 ?auto_746245 ) ) ( not ( = ?auto_746233 ?auto_746246 ) ) ( not ( = ?auto_746233 ?auto_746247 ) ) ( not ( = ?auto_746233 ?auto_746248 ) ) ( not ( = ?auto_746233 ?auto_746249 ) ) ( not ( = ?auto_746233 ?auto_746250 ) ) ( not ( = ?auto_746234 ?auto_746235 ) ) ( not ( = ?auto_746234 ?auto_746236 ) ) ( not ( = ?auto_746234 ?auto_746237 ) ) ( not ( = ?auto_746234 ?auto_746238 ) ) ( not ( = ?auto_746234 ?auto_746239 ) ) ( not ( = ?auto_746234 ?auto_746240 ) ) ( not ( = ?auto_746234 ?auto_746241 ) ) ( not ( = ?auto_746234 ?auto_746242 ) ) ( not ( = ?auto_746234 ?auto_746243 ) ) ( not ( = ?auto_746234 ?auto_746244 ) ) ( not ( = ?auto_746234 ?auto_746245 ) ) ( not ( = ?auto_746234 ?auto_746246 ) ) ( not ( = ?auto_746234 ?auto_746247 ) ) ( not ( = ?auto_746234 ?auto_746248 ) ) ( not ( = ?auto_746234 ?auto_746249 ) ) ( not ( = ?auto_746234 ?auto_746250 ) ) ( not ( = ?auto_746235 ?auto_746236 ) ) ( not ( = ?auto_746235 ?auto_746237 ) ) ( not ( = ?auto_746235 ?auto_746238 ) ) ( not ( = ?auto_746235 ?auto_746239 ) ) ( not ( = ?auto_746235 ?auto_746240 ) ) ( not ( = ?auto_746235 ?auto_746241 ) ) ( not ( = ?auto_746235 ?auto_746242 ) ) ( not ( = ?auto_746235 ?auto_746243 ) ) ( not ( = ?auto_746235 ?auto_746244 ) ) ( not ( = ?auto_746235 ?auto_746245 ) ) ( not ( = ?auto_746235 ?auto_746246 ) ) ( not ( = ?auto_746235 ?auto_746247 ) ) ( not ( = ?auto_746235 ?auto_746248 ) ) ( not ( = ?auto_746235 ?auto_746249 ) ) ( not ( = ?auto_746235 ?auto_746250 ) ) ( not ( = ?auto_746236 ?auto_746237 ) ) ( not ( = ?auto_746236 ?auto_746238 ) ) ( not ( = ?auto_746236 ?auto_746239 ) ) ( not ( = ?auto_746236 ?auto_746240 ) ) ( not ( = ?auto_746236 ?auto_746241 ) ) ( not ( = ?auto_746236 ?auto_746242 ) ) ( not ( = ?auto_746236 ?auto_746243 ) ) ( not ( = ?auto_746236 ?auto_746244 ) ) ( not ( = ?auto_746236 ?auto_746245 ) ) ( not ( = ?auto_746236 ?auto_746246 ) ) ( not ( = ?auto_746236 ?auto_746247 ) ) ( not ( = ?auto_746236 ?auto_746248 ) ) ( not ( = ?auto_746236 ?auto_746249 ) ) ( not ( = ?auto_746236 ?auto_746250 ) ) ( not ( = ?auto_746237 ?auto_746238 ) ) ( not ( = ?auto_746237 ?auto_746239 ) ) ( not ( = ?auto_746237 ?auto_746240 ) ) ( not ( = ?auto_746237 ?auto_746241 ) ) ( not ( = ?auto_746237 ?auto_746242 ) ) ( not ( = ?auto_746237 ?auto_746243 ) ) ( not ( = ?auto_746237 ?auto_746244 ) ) ( not ( = ?auto_746237 ?auto_746245 ) ) ( not ( = ?auto_746237 ?auto_746246 ) ) ( not ( = ?auto_746237 ?auto_746247 ) ) ( not ( = ?auto_746237 ?auto_746248 ) ) ( not ( = ?auto_746237 ?auto_746249 ) ) ( not ( = ?auto_746237 ?auto_746250 ) ) ( not ( = ?auto_746238 ?auto_746239 ) ) ( not ( = ?auto_746238 ?auto_746240 ) ) ( not ( = ?auto_746238 ?auto_746241 ) ) ( not ( = ?auto_746238 ?auto_746242 ) ) ( not ( = ?auto_746238 ?auto_746243 ) ) ( not ( = ?auto_746238 ?auto_746244 ) ) ( not ( = ?auto_746238 ?auto_746245 ) ) ( not ( = ?auto_746238 ?auto_746246 ) ) ( not ( = ?auto_746238 ?auto_746247 ) ) ( not ( = ?auto_746238 ?auto_746248 ) ) ( not ( = ?auto_746238 ?auto_746249 ) ) ( not ( = ?auto_746238 ?auto_746250 ) ) ( not ( = ?auto_746239 ?auto_746240 ) ) ( not ( = ?auto_746239 ?auto_746241 ) ) ( not ( = ?auto_746239 ?auto_746242 ) ) ( not ( = ?auto_746239 ?auto_746243 ) ) ( not ( = ?auto_746239 ?auto_746244 ) ) ( not ( = ?auto_746239 ?auto_746245 ) ) ( not ( = ?auto_746239 ?auto_746246 ) ) ( not ( = ?auto_746239 ?auto_746247 ) ) ( not ( = ?auto_746239 ?auto_746248 ) ) ( not ( = ?auto_746239 ?auto_746249 ) ) ( not ( = ?auto_746239 ?auto_746250 ) ) ( not ( = ?auto_746240 ?auto_746241 ) ) ( not ( = ?auto_746240 ?auto_746242 ) ) ( not ( = ?auto_746240 ?auto_746243 ) ) ( not ( = ?auto_746240 ?auto_746244 ) ) ( not ( = ?auto_746240 ?auto_746245 ) ) ( not ( = ?auto_746240 ?auto_746246 ) ) ( not ( = ?auto_746240 ?auto_746247 ) ) ( not ( = ?auto_746240 ?auto_746248 ) ) ( not ( = ?auto_746240 ?auto_746249 ) ) ( not ( = ?auto_746240 ?auto_746250 ) ) ( not ( = ?auto_746241 ?auto_746242 ) ) ( not ( = ?auto_746241 ?auto_746243 ) ) ( not ( = ?auto_746241 ?auto_746244 ) ) ( not ( = ?auto_746241 ?auto_746245 ) ) ( not ( = ?auto_746241 ?auto_746246 ) ) ( not ( = ?auto_746241 ?auto_746247 ) ) ( not ( = ?auto_746241 ?auto_746248 ) ) ( not ( = ?auto_746241 ?auto_746249 ) ) ( not ( = ?auto_746241 ?auto_746250 ) ) ( not ( = ?auto_746242 ?auto_746243 ) ) ( not ( = ?auto_746242 ?auto_746244 ) ) ( not ( = ?auto_746242 ?auto_746245 ) ) ( not ( = ?auto_746242 ?auto_746246 ) ) ( not ( = ?auto_746242 ?auto_746247 ) ) ( not ( = ?auto_746242 ?auto_746248 ) ) ( not ( = ?auto_746242 ?auto_746249 ) ) ( not ( = ?auto_746242 ?auto_746250 ) ) ( not ( = ?auto_746243 ?auto_746244 ) ) ( not ( = ?auto_746243 ?auto_746245 ) ) ( not ( = ?auto_746243 ?auto_746246 ) ) ( not ( = ?auto_746243 ?auto_746247 ) ) ( not ( = ?auto_746243 ?auto_746248 ) ) ( not ( = ?auto_746243 ?auto_746249 ) ) ( not ( = ?auto_746243 ?auto_746250 ) ) ( not ( = ?auto_746244 ?auto_746245 ) ) ( not ( = ?auto_746244 ?auto_746246 ) ) ( not ( = ?auto_746244 ?auto_746247 ) ) ( not ( = ?auto_746244 ?auto_746248 ) ) ( not ( = ?auto_746244 ?auto_746249 ) ) ( not ( = ?auto_746244 ?auto_746250 ) ) ( not ( = ?auto_746245 ?auto_746246 ) ) ( not ( = ?auto_746245 ?auto_746247 ) ) ( not ( = ?auto_746245 ?auto_746248 ) ) ( not ( = ?auto_746245 ?auto_746249 ) ) ( not ( = ?auto_746245 ?auto_746250 ) ) ( not ( = ?auto_746246 ?auto_746247 ) ) ( not ( = ?auto_746246 ?auto_746248 ) ) ( not ( = ?auto_746246 ?auto_746249 ) ) ( not ( = ?auto_746246 ?auto_746250 ) ) ( not ( = ?auto_746247 ?auto_746248 ) ) ( not ( = ?auto_746247 ?auto_746249 ) ) ( not ( = ?auto_746247 ?auto_746250 ) ) ( not ( = ?auto_746248 ?auto_746249 ) ) ( not ( = ?auto_746248 ?auto_746250 ) ) ( not ( = ?auto_746249 ?auto_746250 ) ) ( ON ?auto_746248 ?auto_746249 ) ( ON ?auto_746247 ?auto_746248 ) ( ON ?auto_746246 ?auto_746247 ) ( CLEAR ?auto_746244 ) ( ON ?auto_746245 ?auto_746246 ) ( CLEAR ?auto_746245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_746233 ?auto_746234 ?auto_746235 ?auto_746236 ?auto_746237 ?auto_746238 ?auto_746239 ?auto_746240 ?auto_746241 ?auto_746242 ?auto_746243 ?auto_746244 ?auto_746245 )
      ( MAKE-17PILE ?auto_746233 ?auto_746234 ?auto_746235 ?auto_746236 ?auto_746237 ?auto_746238 ?auto_746239 ?auto_746240 ?auto_746241 ?auto_746242 ?auto_746243 ?auto_746244 ?auto_746245 ?auto_746246 ?auto_746247 ?auto_746248 ?auto_746249 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746303 - BLOCK
      ?auto_746304 - BLOCK
      ?auto_746305 - BLOCK
      ?auto_746306 - BLOCK
      ?auto_746307 - BLOCK
      ?auto_746308 - BLOCK
      ?auto_746309 - BLOCK
      ?auto_746310 - BLOCK
      ?auto_746311 - BLOCK
      ?auto_746312 - BLOCK
      ?auto_746313 - BLOCK
      ?auto_746314 - BLOCK
      ?auto_746315 - BLOCK
      ?auto_746316 - BLOCK
      ?auto_746317 - BLOCK
      ?auto_746318 - BLOCK
      ?auto_746319 - BLOCK
    )
    :vars
    (
      ?auto_746320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746319 ?auto_746320 ) ( ON-TABLE ?auto_746303 ) ( ON ?auto_746304 ?auto_746303 ) ( ON ?auto_746305 ?auto_746304 ) ( ON ?auto_746306 ?auto_746305 ) ( ON ?auto_746307 ?auto_746306 ) ( ON ?auto_746308 ?auto_746307 ) ( ON ?auto_746309 ?auto_746308 ) ( ON ?auto_746310 ?auto_746309 ) ( ON ?auto_746311 ?auto_746310 ) ( ON ?auto_746312 ?auto_746311 ) ( ON ?auto_746313 ?auto_746312 ) ( not ( = ?auto_746303 ?auto_746304 ) ) ( not ( = ?auto_746303 ?auto_746305 ) ) ( not ( = ?auto_746303 ?auto_746306 ) ) ( not ( = ?auto_746303 ?auto_746307 ) ) ( not ( = ?auto_746303 ?auto_746308 ) ) ( not ( = ?auto_746303 ?auto_746309 ) ) ( not ( = ?auto_746303 ?auto_746310 ) ) ( not ( = ?auto_746303 ?auto_746311 ) ) ( not ( = ?auto_746303 ?auto_746312 ) ) ( not ( = ?auto_746303 ?auto_746313 ) ) ( not ( = ?auto_746303 ?auto_746314 ) ) ( not ( = ?auto_746303 ?auto_746315 ) ) ( not ( = ?auto_746303 ?auto_746316 ) ) ( not ( = ?auto_746303 ?auto_746317 ) ) ( not ( = ?auto_746303 ?auto_746318 ) ) ( not ( = ?auto_746303 ?auto_746319 ) ) ( not ( = ?auto_746303 ?auto_746320 ) ) ( not ( = ?auto_746304 ?auto_746305 ) ) ( not ( = ?auto_746304 ?auto_746306 ) ) ( not ( = ?auto_746304 ?auto_746307 ) ) ( not ( = ?auto_746304 ?auto_746308 ) ) ( not ( = ?auto_746304 ?auto_746309 ) ) ( not ( = ?auto_746304 ?auto_746310 ) ) ( not ( = ?auto_746304 ?auto_746311 ) ) ( not ( = ?auto_746304 ?auto_746312 ) ) ( not ( = ?auto_746304 ?auto_746313 ) ) ( not ( = ?auto_746304 ?auto_746314 ) ) ( not ( = ?auto_746304 ?auto_746315 ) ) ( not ( = ?auto_746304 ?auto_746316 ) ) ( not ( = ?auto_746304 ?auto_746317 ) ) ( not ( = ?auto_746304 ?auto_746318 ) ) ( not ( = ?auto_746304 ?auto_746319 ) ) ( not ( = ?auto_746304 ?auto_746320 ) ) ( not ( = ?auto_746305 ?auto_746306 ) ) ( not ( = ?auto_746305 ?auto_746307 ) ) ( not ( = ?auto_746305 ?auto_746308 ) ) ( not ( = ?auto_746305 ?auto_746309 ) ) ( not ( = ?auto_746305 ?auto_746310 ) ) ( not ( = ?auto_746305 ?auto_746311 ) ) ( not ( = ?auto_746305 ?auto_746312 ) ) ( not ( = ?auto_746305 ?auto_746313 ) ) ( not ( = ?auto_746305 ?auto_746314 ) ) ( not ( = ?auto_746305 ?auto_746315 ) ) ( not ( = ?auto_746305 ?auto_746316 ) ) ( not ( = ?auto_746305 ?auto_746317 ) ) ( not ( = ?auto_746305 ?auto_746318 ) ) ( not ( = ?auto_746305 ?auto_746319 ) ) ( not ( = ?auto_746305 ?auto_746320 ) ) ( not ( = ?auto_746306 ?auto_746307 ) ) ( not ( = ?auto_746306 ?auto_746308 ) ) ( not ( = ?auto_746306 ?auto_746309 ) ) ( not ( = ?auto_746306 ?auto_746310 ) ) ( not ( = ?auto_746306 ?auto_746311 ) ) ( not ( = ?auto_746306 ?auto_746312 ) ) ( not ( = ?auto_746306 ?auto_746313 ) ) ( not ( = ?auto_746306 ?auto_746314 ) ) ( not ( = ?auto_746306 ?auto_746315 ) ) ( not ( = ?auto_746306 ?auto_746316 ) ) ( not ( = ?auto_746306 ?auto_746317 ) ) ( not ( = ?auto_746306 ?auto_746318 ) ) ( not ( = ?auto_746306 ?auto_746319 ) ) ( not ( = ?auto_746306 ?auto_746320 ) ) ( not ( = ?auto_746307 ?auto_746308 ) ) ( not ( = ?auto_746307 ?auto_746309 ) ) ( not ( = ?auto_746307 ?auto_746310 ) ) ( not ( = ?auto_746307 ?auto_746311 ) ) ( not ( = ?auto_746307 ?auto_746312 ) ) ( not ( = ?auto_746307 ?auto_746313 ) ) ( not ( = ?auto_746307 ?auto_746314 ) ) ( not ( = ?auto_746307 ?auto_746315 ) ) ( not ( = ?auto_746307 ?auto_746316 ) ) ( not ( = ?auto_746307 ?auto_746317 ) ) ( not ( = ?auto_746307 ?auto_746318 ) ) ( not ( = ?auto_746307 ?auto_746319 ) ) ( not ( = ?auto_746307 ?auto_746320 ) ) ( not ( = ?auto_746308 ?auto_746309 ) ) ( not ( = ?auto_746308 ?auto_746310 ) ) ( not ( = ?auto_746308 ?auto_746311 ) ) ( not ( = ?auto_746308 ?auto_746312 ) ) ( not ( = ?auto_746308 ?auto_746313 ) ) ( not ( = ?auto_746308 ?auto_746314 ) ) ( not ( = ?auto_746308 ?auto_746315 ) ) ( not ( = ?auto_746308 ?auto_746316 ) ) ( not ( = ?auto_746308 ?auto_746317 ) ) ( not ( = ?auto_746308 ?auto_746318 ) ) ( not ( = ?auto_746308 ?auto_746319 ) ) ( not ( = ?auto_746308 ?auto_746320 ) ) ( not ( = ?auto_746309 ?auto_746310 ) ) ( not ( = ?auto_746309 ?auto_746311 ) ) ( not ( = ?auto_746309 ?auto_746312 ) ) ( not ( = ?auto_746309 ?auto_746313 ) ) ( not ( = ?auto_746309 ?auto_746314 ) ) ( not ( = ?auto_746309 ?auto_746315 ) ) ( not ( = ?auto_746309 ?auto_746316 ) ) ( not ( = ?auto_746309 ?auto_746317 ) ) ( not ( = ?auto_746309 ?auto_746318 ) ) ( not ( = ?auto_746309 ?auto_746319 ) ) ( not ( = ?auto_746309 ?auto_746320 ) ) ( not ( = ?auto_746310 ?auto_746311 ) ) ( not ( = ?auto_746310 ?auto_746312 ) ) ( not ( = ?auto_746310 ?auto_746313 ) ) ( not ( = ?auto_746310 ?auto_746314 ) ) ( not ( = ?auto_746310 ?auto_746315 ) ) ( not ( = ?auto_746310 ?auto_746316 ) ) ( not ( = ?auto_746310 ?auto_746317 ) ) ( not ( = ?auto_746310 ?auto_746318 ) ) ( not ( = ?auto_746310 ?auto_746319 ) ) ( not ( = ?auto_746310 ?auto_746320 ) ) ( not ( = ?auto_746311 ?auto_746312 ) ) ( not ( = ?auto_746311 ?auto_746313 ) ) ( not ( = ?auto_746311 ?auto_746314 ) ) ( not ( = ?auto_746311 ?auto_746315 ) ) ( not ( = ?auto_746311 ?auto_746316 ) ) ( not ( = ?auto_746311 ?auto_746317 ) ) ( not ( = ?auto_746311 ?auto_746318 ) ) ( not ( = ?auto_746311 ?auto_746319 ) ) ( not ( = ?auto_746311 ?auto_746320 ) ) ( not ( = ?auto_746312 ?auto_746313 ) ) ( not ( = ?auto_746312 ?auto_746314 ) ) ( not ( = ?auto_746312 ?auto_746315 ) ) ( not ( = ?auto_746312 ?auto_746316 ) ) ( not ( = ?auto_746312 ?auto_746317 ) ) ( not ( = ?auto_746312 ?auto_746318 ) ) ( not ( = ?auto_746312 ?auto_746319 ) ) ( not ( = ?auto_746312 ?auto_746320 ) ) ( not ( = ?auto_746313 ?auto_746314 ) ) ( not ( = ?auto_746313 ?auto_746315 ) ) ( not ( = ?auto_746313 ?auto_746316 ) ) ( not ( = ?auto_746313 ?auto_746317 ) ) ( not ( = ?auto_746313 ?auto_746318 ) ) ( not ( = ?auto_746313 ?auto_746319 ) ) ( not ( = ?auto_746313 ?auto_746320 ) ) ( not ( = ?auto_746314 ?auto_746315 ) ) ( not ( = ?auto_746314 ?auto_746316 ) ) ( not ( = ?auto_746314 ?auto_746317 ) ) ( not ( = ?auto_746314 ?auto_746318 ) ) ( not ( = ?auto_746314 ?auto_746319 ) ) ( not ( = ?auto_746314 ?auto_746320 ) ) ( not ( = ?auto_746315 ?auto_746316 ) ) ( not ( = ?auto_746315 ?auto_746317 ) ) ( not ( = ?auto_746315 ?auto_746318 ) ) ( not ( = ?auto_746315 ?auto_746319 ) ) ( not ( = ?auto_746315 ?auto_746320 ) ) ( not ( = ?auto_746316 ?auto_746317 ) ) ( not ( = ?auto_746316 ?auto_746318 ) ) ( not ( = ?auto_746316 ?auto_746319 ) ) ( not ( = ?auto_746316 ?auto_746320 ) ) ( not ( = ?auto_746317 ?auto_746318 ) ) ( not ( = ?auto_746317 ?auto_746319 ) ) ( not ( = ?auto_746317 ?auto_746320 ) ) ( not ( = ?auto_746318 ?auto_746319 ) ) ( not ( = ?auto_746318 ?auto_746320 ) ) ( not ( = ?auto_746319 ?auto_746320 ) ) ( ON ?auto_746318 ?auto_746319 ) ( ON ?auto_746317 ?auto_746318 ) ( ON ?auto_746316 ?auto_746317 ) ( ON ?auto_746315 ?auto_746316 ) ( CLEAR ?auto_746313 ) ( ON ?auto_746314 ?auto_746315 ) ( CLEAR ?auto_746314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_746303 ?auto_746304 ?auto_746305 ?auto_746306 ?auto_746307 ?auto_746308 ?auto_746309 ?auto_746310 ?auto_746311 ?auto_746312 ?auto_746313 ?auto_746314 )
      ( MAKE-17PILE ?auto_746303 ?auto_746304 ?auto_746305 ?auto_746306 ?auto_746307 ?auto_746308 ?auto_746309 ?auto_746310 ?auto_746311 ?auto_746312 ?auto_746313 ?auto_746314 ?auto_746315 ?auto_746316 ?auto_746317 ?auto_746318 ?auto_746319 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746373 - BLOCK
      ?auto_746374 - BLOCK
      ?auto_746375 - BLOCK
      ?auto_746376 - BLOCK
      ?auto_746377 - BLOCK
      ?auto_746378 - BLOCK
      ?auto_746379 - BLOCK
      ?auto_746380 - BLOCK
      ?auto_746381 - BLOCK
      ?auto_746382 - BLOCK
      ?auto_746383 - BLOCK
      ?auto_746384 - BLOCK
      ?auto_746385 - BLOCK
      ?auto_746386 - BLOCK
      ?auto_746387 - BLOCK
      ?auto_746388 - BLOCK
      ?auto_746389 - BLOCK
    )
    :vars
    (
      ?auto_746390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746389 ?auto_746390 ) ( ON-TABLE ?auto_746373 ) ( ON ?auto_746374 ?auto_746373 ) ( ON ?auto_746375 ?auto_746374 ) ( ON ?auto_746376 ?auto_746375 ) ( ON ?auto_746377 ?auto_746376 ) ( ON ?auto_746378 ?auto_746377 ) ( ON ?auto_746379 ?auto_746378 ) ( ON ?auto_746380 ?auto_746379 ) ( ON ?auto_746381 ?auto_746380 ) ( ON ?auto_746382 ?auto_746381 ) ( not ( = ?auto_746373 ?auto_746374 ) ) ( not ( = ?auto_746373 ?auto_746375 ) ) ( not ( = ?auto_746373 ?auto_746376 ) ) ( not ( = ?auto_746373 ?auto_746377 ) ) ( not ( = ?auto_746373 ?auto_746378 ) ) ( not ( = ?auto_746373 ?auto_746379 ) ) ( not ( = ?auto_746373 ?auto_746380 ) ) ( not ( = ?auto_746373 ?auto_746381 ) ) ( not ( = ?auto_746373 ?auto_746382 ) ) ( not ( = ?auto_746373 ?auto_746383 ) ) ( not ( = ?auto_746373 ?auto_746384 ) ) ( not ( = ?auto_746373 ?auto_746385 ) ) ( not ( = ?auto_746373 ?auto_746386 ) ) ( not ( = ?auto_746373 ?auto_746387 ) ) ( not ( = ?auto_746373 ?auto_746388 ) ) ( not ( = ?auto_746373 ?auto_746389 ) ) ( not ( = ?auto_746373 ?auto_746390 ) ) ( not ( = ?auto_746374 ?auto_746375 ) ) ( not ( = ?auto_746374 ?auto_746376 ) ) ( not ( = ?auto_746374 ?auto_746377 ) ) ( not ( = ?auto_746374 ?auto_746378 ) ) ( not ( = ?auto_746374 ?auto_746379 ) ) ( not ( = ?auto_746374 ?auto_746380 ) ) ( not ( = ?auto_746374 ?auto_746381 ) ) ( not ( = ?auto_746374 ?auto_746382 ) ) ( not ( = ?auto_746374 ?auto_746383 ) ) ( not ( = ?auto_746374 ?auto_746384 ) ) ( not ( = ?auto_746374 ?auto_746385 ) ) ( not ( = ?auto_746374 ?auto_746386 ) ) ( not ( = ?auto_746374 ?auto_746387 ) ) ( not ( = ?auto_746374 ?auto_746388 ) ) ( not ( = ?auto_746374 ?auto_746389 ) ) ( not ( = ?auto_746374 ?auto_746390 ) ) ( not ( = ?auto_746375 ?auto_746376 ) ) ( not ( = ?auto_746375 ?auto_746377 ) ) ( not ( = ?auto_746375 ?auto_746378 ) ) ( not ( = ?auto_746375 ?auto_746379 ) ) ( not ( = ?auto_746375 ?auto_746380 ) ) ( not ( = ?auto_746375 ?auto_746381 ) ) ( not ( = ?auto_746375 ?auto_746382 ) ) ( not ( = ?auto_746375 ?auto_746383 ) ) ( not ( = ?auto_746375 ?auto_746384 ) ) ( not ( = ?auto_746375 ?auto_746385 ) ) ( not ( = ?auto_746375 ?auto_746386 ) ) ( not ( = ?auto_746375 ?auto_746387 ) ) ( not ( = ?auto_746375 ?auto_746388 ) ) ( not ( = ?auto_746375 ?auto_746389 ) ) ( not ( = ?auto_746375 ?auto_746390 ) ) ( not ( = ?auto_746376 ?auto_746377 ) ) ( not ( = ?auto_746376 ?auto_746378 ) ) ( not ( = ?auto_746376 ?auto_746379 ) ) ( not ( = ?auto_746376 ?auto_746380 ) ) ( not ( = ?auto_746376 ?auto_746381 ) ) ( not ( = ?auto_746376 ?auto_746382 ) ) ( not ( = ?auto_746376 ?auto_746383 ) ) ( not ( = ?auto_746376 ?auto_746384 ) ) ( not ( = ?auto_746376 ?auto_746385 ) ) ( not ( = ?auto_746376 ?auto_746386 ) ) ( not ( = ?auto_746376 ?auto_746387 ) ) ( not ( = ?auto_746376 ?auto_746388 ) ) ( not ( = ?auto_746376 ?auto_746389 ) ) ( not ( = ?auto_746376 ?auto_746390 ) ) ( not ( = ?auto_746377 ?auto_746378 ) ) ( not ( = ?auto_746377 ?auto_746379 ) ) ( not ( = ?auto_746377 ?auto_746380 ) ) ( not ( = ?auto_746377 ?auto_746381 ) ) ( not ( = ?auto_746377 ?auto_746382 ) ) ( not ( = ?auto_746377 ?auto_746383 ) ) ( not ( = ?auto_746377 ?auto_746384 ) ) ( not ( = ?auto_746377 ?auto_746385 ) ) ( not ( = ?auto_746377 ?auto_746386 ) ) ( not ( = ?auto_746377 ?auto_746387 ) ) ( not ( = ?auto_746377 ?auto_746388 ) ) ( not ( = ?auto_746377 ?auto_746389 ) ) ( not ( = ?auto_746377 ?auto_746390 ) ) ( not ( = ?auto_746378 ?auto_746379 ) ) ( not ( = ?auto_746378 ?auto_746380 ) ) ( not ( = ?auto_746378 ?auto_746381 ) ) ( not ( = ?auto_746378 ?auto_746382 ) ) ( not ( = ?auto_746378 ?auto_746383 ) ) ( not ( = ?auto_746378 ?auto_746384 ) ) ( not ( = ?auto_746378 ?auto_746385 ) ) ( not ( = ?auto_746378 ?auto_746386 ) ) ( not ( = ?auto_746378 ?auto_746387 ) ) ( not ( = ?auto_746378 ?auto_746388 ) ) ( not ( = ?auto_746378 ?auto_746389 ) ) ( not ( = ?auto_746378 ?auto_746390 ) ) ( not ( = ?auto_746379 ?auto_746380 ) ) ( not ( = ?auto_746379 ?auto_746381 ) ) ( not ( = ?auto_746379 ?auto_746382 ) ) ( not ( = ?auto_746379 ?auto_746383 ) ) ( not ( = ?auto_746379 ?auto_746384 ) ) ( not ( = ?auto_746379 ?auto_746385 ) ) ( not ( = ?auto_746379 ?auto_746386 ) ) ( not ( = ?auto_746379 ?auto_746387 ) ) ( not ( = ?auto_746379 ?auto_746388 ) ) ( not ( = ?auto_746379 ?auto_746389 ) ) ( not ( = ?auto_746379 ?auto_746390 ) ) ( not ( = ?auto_746380 ?auto_746381 ) ) ( not ( = ?auto_746380 ?auto_746382 ) ) ( not ( = ?auto_746380 ?auto_746383 ) ) ( not ( = ?auto_746380 ?auto_746384 ) ) ( not ( = ?auto_746380 ?auto_746385 ) ) ( not ( = ?auto_746380 ?auto_746386 ) ) ( not ( = ?auto_746380 ?auto_746387 ) ) ( not ( = ?auto_746380 ?auto_746388 ) ) ( not ( = ?auto_746380 ?auto_746389 ) ) ( not ( = ?auto_746380 ?auto_746390 ) ) ( not ( = ?auto_746381 ?auto_746382 ) ) ( not ( = ?auto_746381 ?auto_746383 ) ) ( not ( = ?auto_746381 ?auto_746384 ) ) ( not ( = ?auto_746381 ?auto_746385 ) ) ( not ( = ?auto_746381 ?auto_746386 ) ) ( not ( = ?auto_746381 ?auto_746387 ) ) ( not ( = ?auto_746381 ?auto_746388 ) ) ( not ( = ?auto_746381 ?auto_746389 ) ) ( not ( = ?auto_746381 ?auto_746390 ) ) ( not ( = ?auto_746382 ?auto_746383 ) ) ( not ( = ?auto_746382 ?auto_746384 ) ) ( not ( = ?auto_746382 ?auto_746385 ) ) ( not ( = ?auto_746382 ?auto_746386 ) ) ( not ( = ?auto_746382 ?auto_746387 ) ) ( not ( = ?auto_746382 ?auto_746388 ) ) ( not ( = ?auto_746382 ?auto_746389 ) ) ( not ( = ?auto_746382 ?auto_746390 ) ) ( not ( = ?auto_746383 ?auto_746384 ) ) ( not ( = ?auto_746383 ?auto_746385 ) ) ( not ( = ?auto_746383 ?auto_746386 ) ) ( not ( = ?auto_746383 ?auto_746387 ) ) ( not ( = ?auto_746383 ?auto_746388 ) ) ( not ( = ?auto_746383 ?auto_746389 ) ) ( not ( = ?auto_746383 ?auto_746390 ) ) ( not ( = ?auto_746384 ?auto_746385 ) ) ( not ( = ?auto_746384 ?auto_746386 ) ) ( not ( = ?auto_746384 ?auto_746387 ) ) ( not ( = ?auto_746384 ?auto_746388 ) ) ( not ( = ?auto_746384 ?auto_746389 ) ) ( not ( = ?auto_746384 ?auto_746390 ) ) ( not ( = ?auto_746385 ?auto_746386 ) ) ( not ( = ?auto_746385 ?auto_746387 ) ) ( not ( = ?auto_746385 ?auto_746388 ) ) ( not ( = ?auto_746385 ?auto_746389 ) ) ( not ( = ?auto_746385 ?auto_746390 ) ) ( not ( = ?auto_746386 ?auto_746387 ) ) ( not ( = ?auto_746386 ?auto_746388 ) ) ( not ( = ?auto_746386 ?auto_746389 ) ) ( not ( = ?auto_746386 ?auto_746390 ) ) ( not ( = ?auto_746387 ?auto_746388 ) ) ( not ( = ?auto_746387 ?auto_746389 ) ) ( not ( = ?auto_746387 ?auto_746390 ) ) ( not ( = ?auto_746388 ?auto_746389 ) ) ( not ( = ?auto_746388 ?auto_746390 ) ) ( not ( = ?auto_746389 ?auto_746390 ) ) ( ON ?auto_746388 ?auto_746389 ) ( ON ?auto_746387 ?auto_746388 ) ( ON ?auto_746386 ?auto_746387 ) ( ON ?auto_746385 ?auto_746386 ) ( ON ?auto_746384 ?auto_746385 ) ( CLEAR ?auto_746382 ) ( ON ?auto_746383 ?auto_746384 ) ( CLEAR ?auto_746383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_746373 ?auto_746374 ?auto_746375 ?auto_746376 ?auto_746377 ?auto_746378 ?auto_746379 ?auto_746380 ?auto_746381 ?auto_746382 ?auto_746383 )
      ( MAKE-17PILE ?auto_746373 ?auto_746374 ?auto_746375 ?auto_746376 ?auto_746377 ?auto_746378 ?auto_746379 ?auto_746380 ?auto_746381 ?auto_746382 ?auto_746383 ?auto_746384 ?auto_746385 ?auto_746386 ?auto_746387 ?auto_746388 ?auto_746389 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746443 - BLOCK
      ?auto_746444 - BLOCK
      ?auto_746445 - BLOCK
      ?auto_746446 - BLOCK
      ?auto_746447 - BLOCK
      ?auto_746448 - BLOCK
      ?auto_746449 - BLOCK
      ?auto_746450 - BLOCK
      ?auto_746451 - BLOCK
      ?auto_746452 - BLOCK
      ?auto_746453 - BLOCK
      ?auto_746454 - BLOCK
      ?auto_746455 - BLOCK
      ?auto_746456 - BLOCK
      ?auto_746457 - BLOCK
      ?auto_746458 - BLOCK
      ?auto_746459 - BLOCK
    )
    :vars
    (
      ?auto_746460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746459 ?auto_746460 ) ( ON-TABLE ?auto_746443 ) ( ON ?auto_746444 ?auto_746443 ) ( ON ?auto_746445 ?auto_746444 ) ( ON ?auto_746446 ?auto_746445 ) ( ON ?auto_746447 ?auto_746446 ) ( ON ?auto_746448 ?auto_746447 ) ( ON ?auto_746449 ?auto_746448 ) ( ON ?auto_746450 ?auto_746449 ) ( ON ?auto_746451 ?auto_746450 ) ( not ( = ?auto_746443 ?auto_746444 ) ) ( not ( = ?auto_746443 ?auto_746445 ) ) ( not ( = ?auto_746443 ?auto_746446 ) ) ( not ( = ?auto_746443 ?auto_746447 ) ) ( not ( = ?auto_746443 ?auto_746448 ) ) ( not ( = ?auto_746443 ?auto_746449 ) ) ( not ( = ?auto_746443 ?auto_746450 ) ) ( not ( = ?auto_746443 ?auto_746451 ) ) ( not ( = ?auto_746443 ?auto_746452 ) ) ( not ( = ?auto_746443 ?auto_746453 ) ) ( not ( = ?auto_746443 ?auto_746454 ) ) ( not ( = ?auto_746443 ?auto_746455 ) ) ( not ( = ?auto_746443 ?auto_746456 ) ) ( not ( = ?auto_746443 ?auto_746457 ) ) ( not ( = ?auto_746443 ?auto_746458 ) ) ( not ( = ?auto_746443 ?auto_746459 ) ) ( not ( = ?auto_746443 ?auto_746460 ) ) ( not ( = ?auto_746444 ?auto_746445 ) ) ( not ( = ?auto_746444 ?auto_746446 ) ) ( not ( = ?auto_746444 ?auto_746447 ) ) ( not ( = ?auto_746444 ?auto_746448 ) ) ( not ( = ?auto_746444 ?auto_746449 ) ) ( not ( = ?auto_746444 ?auto_746450 ) ) ( not ( = ?auto_746444 ?auto_746451 ) ) ( not ( = ?auto_746444 ?auto_746452 ) ) ( not ( = ?auto_746444 ?auto_746453 ) ) ( not ( = ?auto_746444 ?auto_746454 ) ) ( not ( = ?auto_746444 ?auto_746455 ) ) ( not ( = ?auto_746444 ?auto_746456 ) ) ( not ( = ?auto_746444 ?auto_746457 ) ) ( not ( = ?auto_746444 ?auto_746458 ) ) ( not ( = ?auto_746444 ?auto_746459 ) ) ( not ( = ?auto_746444 ?auto_746460 ) ) ( not ( = ?auto_746445 ?auto_746446 ) ) ( not ( = ?auto_746445 ?auto_746447 ) ) ( not ( = ?auto_746445 ?auto_746448 ) ) ( not ( = ?auto_746445 ?auto_746449 ) ) ( not ( = ?auto_746445 ?auto_746450 ) ) ( not ( = ?auto_746445 ?auto_746451 ) ) ( not ( = ?auto_746445 ?auto_746452 ) ) ( not ( = ?auto_746445 ?auto_746453 ) ) ( not ( = ?auto_746445 ?auto_746454 ) ) ( not ( = ?auto_746445 ?auto_746455 ) ) ( not ( = ?auto_746445 ?auto_746456 ) ) ( not ( = ?auto_746445 ?auto_746457 ) ) ( not ( = ?auto_746445 ?auto_746458 ) ) ( not ( = ?auto_746445 ?auto_746459 ) ) ( not ( = ?auto_746445 ?auto_746460 ) ) ( not ( = ?auto_746446 ?auto_746447 ) ) ( not ( = ?auto_746446 ?auto_746448 ) ) ( not ( = ?auto_746446 ?auto_746449 ) ) ( not ( = ?auto_746446 ?auto_746450 ) ) ( not ( = ?auto_746446 ?auto_746451 ) ) ( not ( = ?auto_746446 ?auto_746452 ) ) ( not ( = ?auto_746446 ?auto_746453 ) ) ( not ( = ?auto_746446 ?auto_746454 ) ) ( not ( = ?auto_746446 ?auto_746455 ) ) ( not ( = ?auto_746446 ?auto_746456 ) ) ( not ( = ?auto_746446 ?auto_746457 ) ) ( not ( = ?auto_746446 ?auto_746458 ) ) ( not ( = ?auto_746446 ?auto_746459 ) ) ( not ( = ?auto_746446 ?auto_746460 ) ) ( not ( = ?auto_746447 ?auto_746448 ) ) ( not ( = ?auto_746447 ?auto_746449 ) ) ( not ( = ?auto_746447 ?auto_746450 ) ) ( not ( = ?auto_746447 ?auto_746451 ) ) ( not ( = ?auto_746447 ?auto_746452 ) ) ( not ( = ?auto_746447 ?auto_746453 ) ) ( not ( = ?auto_746447 ?auto_746454 ) ) ( not ( = ?auto_746447 ?auto_746455 ) ) ( not ( = ?auto_746447 ?auto_746456 ) ) ( not ( = ?auto_746447 ?auto_746457 ) ) ( not ( = ?auto_746447 ?auto_746458 ) ) ( not ( = ?auto_746447 ?auto_746459 ) ) ( not ( = ?auto_746447 ?auto_746460 ) ) ( not ( = ?auto_746448 ?auto_746449 ) ) ( not ( = ?auto_746448 ?auto_746450 ) ) ( not ( = ?auto_746448 ?auto_746451 ) ) ( not ( = ?auto_746448 ?auto_746452 ) ) ( not ( = ?auto_746448 ?auto_746453 ) ) ( not ( = ?auto_746448 ?auto_746454 ) ) ( not ( = ?auto_746448 ?auto_746455 ) ) ( not ( = ?auto_746448 ?auto_746456 ) ) ( not ( = ?auto_746448 ?auto_746457 ) ) ( not ( = ?auto_746448 ?auto_746458 ) ) ( not ( = ?auto_746448 ?auto_746459 ) ) ( not ( = ?auto_746448 ?auto_746460 ) ) ( not ( = ?auto_746449 ?auto_746450 ) ) ( not ( = ?auto_746449 ?auto_746451 ) ) ( not ( = ?auto_746449 ?auto_746452 ) ) ( not ( = ?auto_746449 ?auto_746453 ) ) ( not ( = ?auto_746449 ?auto_746454 ) ) ( not ( = ?auto_746449 ?auto_746455 ) ) ( not ( = ?auto_746449 ?auto_746456 ) ) ( not ( = ?auto_746449 ?auto_746457 ) ) ( not ( = ?auto_746449 ?auto_746458 ) ) ( not ( = ?auto_746449 ?auto_746459 ) ) ( not ( = ?auto_746449 ?auto_746460 ) ) ( not ( = ?auto_746450 ?auto_746451 ) ) ( not ( = ?auto_746450 ?auto_746452 ) ) ( not ( = ?auto_746450 ?auto_746453 ) ) ( not ( = ?auto_746450 ?auto_746454 ) ) ( not ( = ?auto_746450 ?auto_746455 ) ) ( not ( = ?auto_746450 ?auto_746456 ) ) ( not ( = ?auto_746450 ?auto_746457 ) ) ( not ( = ?auto_746450 ?auto_746458 ) ) ( not ( = ?auto_746450 ?auto_746459 ) ) ( not ( = ?auto_746450 ?auto_746460 ) ) ( not ( = ?auto_746451 ?auto_746452 ) ) ( not ( = ?auto_746451 ?auto_746453 ) ) ( not ( = ?auto_746451 ?auto_746454 ) ) ( not ( = ?auto_746451 ?auto_746455 ) ) ( not ( = ?auto_746451 ?auto_746456 ) ) ( not ( = ?auto_746451 ?auto_746457 ) ) ( not ( = ?auto_746451 ?auto_746458 ) ) ( not ( = ?auto_746451 ?auto_746459 ) ) ( not ( = ?auto_746451 ?auto_746460 ) ) ( not ( = ?auto_746452 ?auto_746453 ) ) ( not ( = ?auto_746452 ?auto_746454 ) ) ( not ( = ?auto_746452 ?auto_746455 ) ) ( not ( = ?auto_746452 ?auto_746456 ) ) ( not ( = ?auto_746452 ?auto_746457 ) ) ( not ( = ?auto_746452 ?auto_746458 ) ) ( not ( = ?auto_746452 ?auto_746459 ) ) ( not ( = ?auto_746452 ?auto_746460 ) ) ( not ( = ?auto_746453 ?auto_746454 ) ) ( not ( = ?auto_746453 ?auto_746455 ) ) ( not ( = ?auto_746453 ?auto_746456 ) ) ( not ( = ?auto_746453 ?auto_746457 ) ) ( not ( = ?auto_746453 ?auto_746458 ) ) ( not ( = ?auto_746453 ?auto_746459 ) ) ( not ( = ?auto_746453 ?auto_746460 ) ) ( not ( = ?auto_746454 ?auto_746455 ) ) ( not ( = ?auto_746454 ?auto_746456 ) ) ( not ( = ?auto_746454 ?auto_746457 ) ) ( not ( = ?auto_746454 ?auto_746458 ) ) ( not ( = ?auto_746454 ?auto_746459 ) ) ( not ( = ?auto_746454 ?auto_746460 ) ) ( not ( = ?auto_746455 ?auto_746456 ) ) ( not ( = ?auto_746455 ?auto_746457 ) ) ( not ( = ?auto_746455 ?auto_746458 ) ) ( not ( = ?auto_746455 ?auto_746459 ) ) ( not ( = ?auto_746455 ?auto_746460 ) ) ( not ( = ?auto_746456 ?auto_746457 ) ) ( not ( = ?auto_746456 ?auto_746458 ) ) ( not ( = ?auto_746456 ?auto_746459 ) ) ( not ( = ?auto_746456 ?auto_746460 ) ) ( not ( = ?auto_746457 ?auto_746458 ) ) ( not ( = ?auto_746457 ?auto_746459 ) ) ( not ( = ?auto_746457 ?auto_746460 ) ) ( not ( = ?auto_746458 ?auto_746459 ) ) ( not ( = ?auto_746458 ?auto_746460 ) ) ( not ( = ?auto_746459 ?auto_746460 ) ) ( ON ?auto_746458 ?auto_746459 ) ( ON ?auto_746457 ?auto_746458 ) ( ON ?auto_746456 ?auto_746457 ) ( ON ?auto_746455 ?auto_746456 ) ( ON ?auto_746454 ?auto_746455 ) ( ON ?auto_746453 ?auto_746454 ) ( CLEAR ?auto_746451 ) ( ON ?auto_746452 ?auto_746453 ) ( CLEAR ?auto_746452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_746443 ?auto_746444 ?auto_746445 ?auto_746446 ?auto_746447 ?auto_746448 ?auto_746449 ?auto_746450 ?auto_746451 ?auto_746452 )
      ( MAKE-17PILE ?auto_746443 ?auto_746444 ?auto_746445 ?auto_746446 ?auto_746447 ?auto_746448 ?auto_746449 ?auto_746450 ?auto_746451 ?auto_746452 ?auto_746453 ?auto_746454 ?auto_746455 ?auto_746456 ?auto_746457 ?auto_746458 ?auto_746459 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746513 - BLOCK
      ?auto_746514 - BLOCK
      ?auto_746515 - BLOCK
      ?auto_746516 - BLOCK
      ?auto_746517 - BLOCK
      ?auto_746518 - BLOCK
      ?auto_746519 - BLOCK
      ?auto_746520 - BLOCK
      ?auto_746521 - BLOCK
      ?auto_746522 - BLOCK
      ?auto_746523 - BLOCK
      ?auto_746524 - BLOCK
      ?auto_746525 - BLOCK
      ?auto_746526 - BLOCK
      ?auto_746527 - BLOCK
      ?auto_746528 - BLOCK
      ?auto_746529 - BLOCK
    )
    :vars
    (
      ?auto_746530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746529 ?auto_746530 ) ( ON-TABLE ?auto_746513 ) ( ON ?auto_746514 ?auto_746513 ) ( ON ?auto_746515 ?auto_746514 ) ( ON ?auto_746516 ?auto_746515 ) ( ON ?auto_746517 ?auto_746516 ) ( ON ?auto_746518 ?auto_746517 ) ( ON ?auto_746519 ?auto_746518 ) ( ON ?auto_746520 ?auto_746519 ) ( not ( = ?auto_746513 ?auto_746514 ) ) ( not ( = ?auto_746513 ?auto_746515 ) ) ( not ( = ?auto_746513 ?auto_746516 ) ) ( not ( = ?auto_746513 ?auto_746517 ) ) ( not ( = ?auto_746513 ?auto_746518 ) ) ( not ( = ?auto_746513 ?auto_746519 ) ) ( not ( = ?auto_746513 ?auto_746520 ) ) ( not ( = ?auto_746513 ?auto_746521 ) ) ( not ( = ?auto_746513 ?auto_746522 ) ) ( not ( = ?auto_746513 ?auto_746523 ) ) ( not ( = ?auto_746513 ?auto_746524 ) ) ( not ( = ?auto_746513 ?auto_746525 ) ) ( not ( = ?auto_746513 ?auto_746526 ) ) ( not ( = ?auto_746513 ?auto_746527 ) ) ( not ( = ?auto_746513 ?auto_746528 ) ) ( not ( = ?auto_746513 ?auto_746529 ) ) ( not ( = ?auto_746513 ?auto_746530 ) ) ( not ( = ?auto_746514 ?auto_746515 ) ) ( not ( = ?auto_746514 ?auto_746516 ) ) ( not ( = ?auto_746514 ?auto_746517 ) ) ( not ( = ?auto_746514 ?auto_746518 ) ) ( not ( = ?auto_746514 ?auto_746519 ) ) ( not ( = ?auto_746514 ?auto_746520 ) ) ( not ( = ?auto_746514 ?auto_746521 ) ) ( not ( = ?auto_746514 ?auto_746522 ) ) ( not ( = ?auto_746514 ?auto_746523 ) ) ( not ( = ?auto_746514 ?auto_746524 ) ) ( not ( = ?auto_746514 ?auto_746525 ) ) ( not ( = ?auto_746514 ?auto_746526 ) ) ( not ( = ?auto_746514 ?auto_746527 ) ) ( not ( = ?auto_746514 ?auto_746528 ) ) ( not ( = ?auto_746514 ?auto_746529 ) ) ( not ( = ?auto_746514 ?auto_746530 ) ) ( not ( = ?auto_746515 ?auto_746516 ) ) ( not ( = ?auto_746515 ?auto_746517 ) ) ( not ( = ?auto_746515 ?auto_746518 ) ) ( not ( = ?auto_746515 ?auto_746519 ) ) ( not ( = ?auto_746515 ?auto_746520 ) ) ( not ( = ?auto_746515 ?auto_746521 ) ) ( not ( = ?auto_746515 ?auto_746522 ) ) ( not ( = ?auto_746515 ?auto_746523 ) ) ( not ( = ?auto_746515 ?auto_746524 ) ) ( not ( = ?auto_746515 ?auto_746525 ) ) ( not ( = ?auto_746515 ?auto_746526 ) ) ( not ( = ?auto_746515 ?auto_746527 ) ) ( not ( = ?auto_746515 ?auto_746528 ) ) ( not ( = ?auto_746515 ?auto_746529 ) ) ( not ( = ?auto_746515 ?auto_746530 ) ) ( not ( = ?auto_746516 ?auto_746517 ) ) ( not ( = ?auto_746516 ?auto_746518 ) ) ( not ( = ?auto_746516 ?auto_746519 ) ) ( not ( = ?auto_746516 ?auto_746520 ) ) ( not ( = ?auto_746516 ?auto_746521 ) ) ( not ( = ?auto_746516 ?auto_746522 ) ) ( not ( = ?auto_746516 ?auto_746523 ) ) ( not ( = ?auto_746516 ?auto_746524 ) ) ( not ( = ?auto_746516 ?auto_746525 ) ) ( not ( = ?auto_746516 ?auto_746526 ) ) ( not ( = ?auto_746516 ?auto_746527 ) ) ( not ( = ?auto_746516 ?auto_746528 ) ) ( not ( = ?auto_746516 ?auto_746529 ) ) ( not ( = ?auto_746516 ?auto_746530 ) ) ( not ( = ?auto_746517 ?auto_746518 ) ) ( not ( = ?auto_746517 ?auto_746519 ) ) ( not ( = ?auto_746517 ?auto_746520 ) ) ( not ( = ?auto_746517 ?auto_746521 ) ) ( not ( = ?auto_746517 ?auto_746522 ) ) ( not ( = ?auto_746517 ?auto_746523 ) ) ( not ( = ?auto_746517 ?auto_746524 ) ) ( not ( = ?auto_746517 ?auto_746525 ) ) ( not ( = ?auto_746517 ?auto_746526 ) ) ( not ( = ?auto_746517 ?auto_746527 ) ) ( not ( = ?auto_746517 ?auto_746528 ) ) ( not ( = ?auto_746517 ?auto_746529 ) ) ( not ( = ?auto_746517 ?auto_746530 ) ) ( not ( = ?auto_746518 ?auto_746519 ) ) ( not ( = ?auto_746518 ?auto_746520 ) ) ( not ( = ?auto_746518 ?auto_746521 ) ) ( not ( = ?auto_746518 ?auto_746522 ) ) ( not ( = ?auto_746518 ?auto_746523 ) ) ( not ( = ?auto_746518 ?auto_746524 ) ) ( not ( = ?auto_746518 ?auto_746525 ) ) ( not ( = ?auto_746518 ?auto_746526 ) ) ( not ( = ?auto_746518 ?auto_746527 ) ) ( not ( = ?auto_746518 ?auto_746528 ) ) ( not ( = ?auto_746518 ?auto_746529 ) ) ( not ( = ?auto_746518 ?auto_746530 ) ) ( not ( = ?auto_746519 ?auto_746520 ) ) ( not ( = ?auto_746519 ?auto_746521 ) ) ( not ( = ?auto_746519 ?auto_746522 ) ) ( not ( = ?auto_746519 ?auto_746523 ) ) ( not ( = ?auto_746519 ?auto_746524 ) ) ( not ( = ?auto_746519 ?auto_746525 ) ) ( not ( = ?auto_746519 ?auto_746526 ) ) ( not ( = ?auto_746519 ?auto_746527 ) ) ( not ( = ?auto_746519 ?auto_746528 ) ) ( not ( = ?auto_746519 ?auto_746529 ) ) ( not ( = ?auto_746519 ?auto_746530 ) ) ( not ( = ?auto_746520 ?auto_746521 ) ) ( not ( = ?auto_746520 ?auto_746522 ) ) ( not ( = ?auto_746520 ?auto_746523 ) ) ( not ( = ?auto_746520 ?auto_746524 ) ) ( not ( = ?auto_746520 ?auto_746525 ) ) ( not ( = ?auto_746520 ?auto_746526 ) ) ( not ( = ?auto_746520 ?auto_746527 ) ) ( not ( = ?auto_746520 ?auto_746528 ) ) ( not ( = ?auto_746520 ?auto_746529 ) ) ( not ( = ?auto_746520 ?auto_746530 ) ) ( not ( = ?auto_746521 ?auto_746522 ) ) ( not ( = ?auto_746521 ?auto_746523 ) ) ( not ( = ?auto_746521 ?auto_746524 ) ) ( not ( = ?auto_746521 ?auto_746525 ) ) ( not ( = ?auto_746521 ?auto_746526 ) ) ( not ( = ?auto_746521 ?auto_746527 ) ) ( not ( = ?auto_746521 ?auto_746528 ) ) ( not ( = ?auto_746521 ?auto_746529 ) ) ( not ( = ?auto_746521 ?auto_746530 ) ) ( not ( = ?auto_746522 ?auto_746523 ) ) ( not ( = ?auto_746522 ?auto_746524 ) ) ( not ( = ?auto_746522 ?auto_746525 ) ) ( not ( = ?auto_746522 ?auto_746526 ) ) ( not ( = ?auto_746522 ?auto_746527 ) ) ( not ( = ?auto_746522 ?auto_746528 ) ) ( not ( = ?auto_746522 ?auto_746529 ) ) ( not ( = ?auto_746522 ?auto_746530 ) ) ( not ( = ?auto_746523 ?auto_746524 ) ) ( not ( = ?auto_746523 ?auto_746525 ) ) ( not ( = ?auto_746523 ?auto_746526 ) ) ( not ( = ?auto_746523 ?auto_746527 ) ) ( not ( = ?auto_746523 ?auto_746528 ) ) ( not ( = ?auto_746523 ?auto_746529 ) ) ( not ( = ?auto_746523 ?auto_746530 ) ) ( not ( = ?auto_746524 ?auto_746525 ) ) ( not ( = ?auto_746524 ?auto_746526 ) ) ( not ( = ?auto_746524 ?auto_746527 ) ) ( not ( = ?auto_746524 ?auto_746528 ) ) ( not ( = ?auto_746524 ?auto_746529 ) ) ( not ( = ?auto_746524 ?auto_746530 ) ) ( not ( = ?auto_746525 ?auto_746526 ) ) ( not ( = ?auto_746525 ?auto_746527 ) ) ( not ( = ?auto_746525 ?auto_746528 ) ) ( not ( = ?auto_746525 ?auto_746529 ) ) ( not ( = ?auto_746525 ?auto_746530 ) ) ( not ( = ?auto_746526 ?auto_746527 ) ) ( not ( = ?auto_746526 ?auto_746528 ) ) ( not ( = ?auto_746526 ?auto_746529 ) ) ( not ( = ?auto_746526 ?auto_746530 ) ) ( not ( = ?auto_746527 ?auto_746528 ) ) ( not ( = ?auto_746527 ?auto_746529 ) ) ( not ( = ?auto_746527 ?auto_746530 ) ) ( not ( = ?auto_746528 ?auto_746529 ) ) ( not ( = ?auto_746528 ?auto_746530 ) ) ( not ( = ?auto_746529 ?auto_746530 ) ) ( ON ?auto_746528 ?auto_746529 ) ( ON ?auto_746527 ?auto_746528 ) ( ON ?auto_746526 ?auto_746527 ) ( ON ?auto_746525 ?auto_746526 ) ( ON ?auto_746524 ?auto_746525 ) ( ON ?auto_746523 ?auto_746524 ) ( ON ?auto_746522 ?auto_746523 ) ( CLEAR ?auto_746520 ) ( ON ?auto_746521 ?auto_746522 ) ( CLEAR ?auto_746521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_746513 ?auto_746514 ?auto_746515 ?auto_746516 ?auto_746517 ?auto_746518 ?auto_746519 ?auto_746520 ?auto_746521 )
      ( MAKE-17PILE ?auto_746513 ?auto_746514 ?auto_746515 ?auto_746516 ?auto_746517 ?auto_746518 ?auto_746519 ?auto_746520 ?auto_746521 ?auto_746522 ?auto_746523 ?auto_746524 ?auto_746525 ?auto_746526 ?auto_746527 ?auto_746528 ?auto_746529 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746583 - BLOCK
      ?auto_746584 - BLOCK
      ?auto_746585 - BLOCK
      ?auto_746586 - BLOCK
      ?auto_746587 - BLOCK
      ?auto_746588 - BLOCK
      ?auto_746589 - BLOCK
      ?auto_746590 - BLOCK
      ?auto_746591 - BLOCK
      ?auto_746592 - BLOCK
      ?auto_746593 - BLOCK
      ?auto_746594 - BLOCK
      ?auto_746595 - BLOCK
      ?auto_746596 - BLOCK
      ?auto_746597 - BLOCK
      ?auto_746598 - BLOCK
      ?auto_746599 - BLOCK
    )
    :vars
    (
      ?auto_746600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746599 ?auto_746600 ) ( ON-TABLE ?auto_746583 ) ( ON ?auto_746584 ?auto_746583 ) ( ON ?auto_746585 ?auto_746584 ) ( ON ?auto_746586 ?auto_746585 ) ( ON ?auto_746587 ?auto_746586 ) ( ON ?auto_746588 ?auto_746587 ) ( ON ?auto_746589 ?auto_746588 ) ( not ( = ?auto_746583 ?auto_746584 ) ) ( not ( = ?auto_746583 ?auto_746585 ) ) ( not ( = ?auto_746583 ?auto_746586 ) ) ( not ( = ?auto_746583 ?auto_746587 ) ) ( not ( = ?auto_746583 ?auto_746588 ) ) ( not ( = ?auto_746583 ?auto_746589 ) ) ( not ( = ?auto_746583 ?auto_746590 ) ) ( not ( = ?auto_746583 ?auto_746591 ) ) ( not ( = ?auto_746583 ?auto_746592 ) ) ( not ( = ?auto_746583 ?auto_746593 ) ) ( not ( = ?auto_746583 ?auto_746594 ) ) ( not ( = ?auto_746583 ?auto_746595 ) ) ( not ( = ?auto_746583 ?auto_746596 ) ) ( not ( = ?auto_746583 ?auto_746597 ) ) ( not ( = ?auto_746583 ?auto_746598 ) ) ( not ( = ?auto_746583 ?auto_746599 ) ) ( not ( = ?auto_746583 ?auto_746600 ) ) ( not ( = ?auto_746584 ?auto_746585 ) ) ( not ( = ?auto_746584 ?auto_746586 ) ) ( not ( = ?auto_746584 ?auto_746587 ) ) ( not ( = ?auto_746584 ?auto_746588 ) ) ( not ( = ?auto_746584 ?auto_746589 ) ) ( not ( = ?auto_746584 ?auto_746590 ) ) ( not ( = ?auto_746584 ?auto_746591 ) ) ( not ( = ?auto_746584 ?auto_746592 ) ) ( not ( = ?auto_746584 ?auto_746593 ) ) ( not ( = ?auto_746584 ?auto_746594 ) ) ( not ( = ?auto_746584 ?auto_746595 ) ) ( not ( = ?auto_746584 ?auto_746596 ) ) ( not ( = ?auto_746584 ?auto_746597 ) ) ( not ( = ?auto_746584 ?auto_746598 ) ) ( not ( = ?auto_746584 ?auto_746599 ) ) ( not ( = ?auto_746584 ?auto_746600 ) ) ( not ( = ?auto_746585 ?auto_746586 ) ) ( not ( = ?auto_746585 ?auto_746587 ) ) ( not ( = ?auto_746585 ?auto_746588 ) ) ( not ( = ?auto_746585 ?auto_746589 ) ) ( not ( = ?auto_746585 ?auto_746590 ) ) ( not ( = ?auto_746585 ?auto_746591 ) ) ( not ( = ?auto_746585 ?auto_746592 ) ) ( not ( = ?auto_746585 ?auto_746593 ) ) ( not ( = ?auto_746585 ?auto_746594 ) ) ( not ( = ?auto_746585 ?auto_746595 ) ) ( not ( = ?auto_746585 ?auto_746596 ) ) ( not ( = ?auto_746585 ?auto_746597 ) ) ( not ( = ?auto_746585 ?auto_746598 ) ) ( not ( = ?auto_746585 ?auto_746599 ) ) ( not ( = ?auto_746585 ?auto_746600 ) ) ( not ( = ?auto_746586 ?auto_746587 ) ) ( not ( = ?auto_746586 ?auto_746588 ) ) ( not ( = ?auto_746586 ?auto_746589 ) ) ( not ( = ?auto_746586 ?auto_746590 ) ) ( not ( = ?auto_746586 ?auto_746591 ) ) ( not ( = ?auto_746586 ?auto_746592 ) ) ( not ( = ?auto_746586 ?auto_746593 ) ) ( not ( = ?auto_746586 ?auto_746594 ) ) ( not ( = ?auto_746586 ?auto_746595 ) ) ( not ( = ?auto_746586 ?auto_746596 ) ) ( not ( = ?auto_746586 ?auto_746597 ) ) ( not ( = ?auto_746586 ?auto_746598 ) ) ( not ( = ?auto_746586 ?auto_746599 ) ) ( not ( = ?auto_746586 ?auto_746600 ) ) ( not ( = ?auto_746587 ?auto_746588 ) ) ( not ( = ?auto_746587 ?auto_746589 ) ) ( not ( = ?auto_746587 ?auto_746590 ) ) ( not ( = ?auto_746587 ?auto_746591 ) ) ( not ( = ?auto_746587 ?auto_746592 ) ) ( not ( = ?auto_746587 ?auto_746593 ) ) ( not ( = ?auto_746587 ?auto_746594 ) ) ( not ( = ?auto_746587 ?auto_746595 ) ) ( not ( = ?auto_746587 ?auto_746596 ) ) ( not ( = ?auto_746587 ?auto_746597 ) ) ( not ( = ?auto_746587 ?auto_746598 ) ) ( not ( = ?auto_746587 ?auto_746599 ) ) ( not ( = ?auto_746587 ?auto_746600 ) ) ( not ( = ?auto_746588 ?auto_746589 ) ) ( not ( = ?auto_746588 ?auto_746590 ) ) ( not ( = ?auto_746588 ?auto_746591 ) ) ( not ( = ?auto_746588 ?auto_746592 ) ) ( not ( = ?auto_746588 ?auto_746593 ) ) ( not ( = ?auto_746588 ?auto_746594 ) ) ( not ( = ?auto_746588 ?auto_746595 ) ) ( not ( = ?auto_746588 ?auto_746596 ) ) ( not ( = ?auto_746588 ?auto_746597 ) ) ( not ( = ?auto_746588 ?auto_746598 ) ) ( not ( = ?auto_746588 ?auto_746599 ) ) ( not ( = ?auto_746588 ?auto_746600 ) ) ( not ( = ?auto_746589 ?auto_746590 ) ) ( not ( = ?auto_746589 ?auto_746591 ) ) ( not ( = ?auto_746589 ?auto_746592 ) ) ( not ( = ?auto_746589 ?auto_746593 ) ) ( not ( = ?auto_746589 ?auto_746594 ) ) ( not ( = ?auto_746589 ?auto_746595 ) ) ( not ( = ?auto_746589 ?auto_746596 ) ) ( not ( = ?auto_746589 ?auto_746597 ) ) ( not ( = ?auto_746589 ?auto_746598 ) ) ( not ( = ?auto_746589 ?auto_746599 ) ) ( not ( = ?auto_746589 ?auto_746600 ) ) ( not ( = ?auto_746590 ?auto_746591 ) ) ( not ( = ?auto_746590 ?auto_746592 ) ) ( not ( = ?auto_746590 ?auto_746593 ) ) ( not ( = ?auto_746590 ?auto_746594 ) ) ( not ( = ?auto_746590 ?auto_746595 ) ) ( not ( = ?auto_746590 ?auto_746596 ) ) ( not ( = ?auto_746590 ?auto_746597 ) ) ( not ( = ?auto_746590 ?auto_746598 ) ) ( not ( = ?auto_746590 ?auto_746599 ) ) ( not ( = ?auto_746590 ?auto_746600 ) ) ( not ( = ?auto_746591 ?auto_746592 ) ) ( not ( = ?auto_746591 ?auto_746593 ) ) ( not ( = ?auto_746591 ?auto_746594 ) ) ( not ( = ?auto_746591 ?auto_746595 ) ) ( not ( = ?auto_746591 ?auto_746596 ) ) ( not ( = ?auto_746591 ?auto_746597 ) ) ( not ( = ?auto_746591 ?auto_746598 ) ) ( not ( = ?auto_746591 ?auto_746599 ) ) ( not ( = ?auto_746591 ?auto_746600 ) ) ( not ( = ?auto_746592 ?auto_746593 ) ) ( not ( = ?auto_746592 ?auto_746594 ) ) ( not ( = ?auto_746592 ?auto_746595 ) ) ( not ( = ?auto_746592 ?auto_746596 ) ) ( not ( = ?auto_746592 ?auto_746597 ) ) ( not ( = ?auto_746592 ?auto_746598 ) ) ( not ( = ?auto_746592 ?auto_746599 ) ) ( not ( = ?auto_746592 ?auto_746600 ) ) ( not ( = ?auto_746593 ?auto_746594 ) ) ( not ( = ?auto_746593 ?auto_746595 ) ) ( not ( = ?auto_746593 ?auto_746596 ) ) ( not ( = ?auto_746593 ?auto_746597 ) ) ( not ( = ?auto_746593 ?auto_746598 ) ) ( not ( = ?auto_746593 ?auto_746599 ) ) ( not ( = ?auto_746593 ?auto_746600 ) ) ( not ( = ?auto_746594 ?auto_746595 ) ) ( not ( = ?auto_746594 ?auto_746596 ) ) ( not ( = ?auto_746594 ?auto_746597 ) ) ( not ( = ?auto_746594 ?auto_746598 ) ) ( not ( = ?auto_746594 ?auto_746599 ) ) ( not ( = ?auto_746594 ?auto_746600 ) ) ( not ( = ?auto_746595 ?auto_746596 ) ) ( not ( = ?auto_746595 ?auto_746597 ) ) ( not ( = ?auto_746595 ?auto_746598 ) ) ( not ( = ?auto_746595 ?auto_746599 ) ) ( not ( = ?auto_746595 ?auto_746600 ) ) ( not ( = ?auto_746596 ?auto_746597 ) ) ( not ( = ?auto_746596 ?auto_746598 ) ) ( not ( = ?auto_746596 ?auto_746599 ) ) ( not ( = ?auto_746596 ?auto_746600 ) ) ( not ( = ?auto_746597 ?auto_746598 ) ) ( not ( = ?auto_746597 ?auto_746599 ) ) ( not ( = ?auto_746597 ?auto_746600 ) ) ( not ( = ?auto_746598 ?auto_746599 ) ) ( not ( = ?auto_746598 ?auto_746600 ) ) ( not ( = ?auto_746599 ?auto_746600 ) ) ( ON ?auto_746598 ?auto_746599 ) ( ON ?auto_746597 ?auto_746598 ) ( ON ?auto_746596 ?auto_746597 ) ( ON ?auto_746595 ?auto_746596 ) ( ON ?auto_746594 ?auto_746595 ) ( ON ?auto_746593 ?auto_746594 ) ( ON ?auto_746592 ?auto_746593 ) ( ON ?auto_746591 ?auto_746592 ) ( CLEAR ?auto_746589 ) ( ON ?auto_746590 ?auto_746591 ) ( CLEAR ?auto_746590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_746583 ?auto_746584 ?auto_746585 ?auto_746586 ?auto_746587 ?auto_746588 ?auto_746589 ?auto_746590 )
      ( MAKE-17PILE ?auto_746583 ?auto_746584 ?auto_746585 ?auto_746586 ?auto_746587 ?auto_746588 ?auto_746589 ?auto_746590 ?auto_746591 ?auto_746592 ?auto_746593 ?auto_746594 ?auto_746595 ?auto_746596 ?auto_746597 ?auto_746598 ?auto_746599 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746653 - BLOCK
      ?auto_746654 - BLOCK
      ?auto_746655 - BLOCK
      ?auto_746656 - BLOCK
      ?auto_746657 - BLOCK
      ?auto_746658 - BLOCK
      ?auto_746659 - BLOCK
      ?auto_746660 - BLOCK
      ?auto_746661 - BLOCK
      ?auto_746662 - BLOCK
      ?auto_746663 - BLOCK
      ?auto_746664 - BLOCK
      ?auto_746665 - BLOCK
      ?auto_746666 - BLOCK
      ?auto_746667 - BLOCK
      ?auto_746668 - BLOCK
      ?auto_746669 - BLOCK
    )
    :vars
    (
      ?auto_746670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746669 ?auto_746670 ) ( ON-TABLE ?auto_746653 ) ( ON ?auto_746654 ?auto_746653 ) ( ON ?auto_746655 ?auto_746654 ) ( ON ?auto_746656 ?auto_746655 ) ( ON ?auto_746657 ?auto_746656 ) ( ON ?auto_746658 ?auto_746657 ) ( not ( = ?auto_746653 ?auto_746654 ) ) ( not ( = ?auto_746653 ?auto_746655 ) ) ( not ( = ?auto_746653 ?auto_746656 ) ) ( not ( = ?auto_746653 ?auto_746657 ) ) ( not ( = ?auto_746653 ?auto_746658 ) ) ( not ( = ?auto_746653 ?auto_746659 ) ) ( not ( = ?auto_746653 ?auto_746660 ) ) ( not ( = ?auto_746653 ?auto_746661 ) ) ( not ( = ?auto_746653 ?auto_746662 ) ) ( not ( = ?auto_746653 ?auto_746663 ) ) ( not ( = ?auto_746653 ?auto_746664 ) ) ( not ( = ?auto_746653 ?auto_746665 ) ) ( not ( = ?auto_746653 ?auto_746666 ) ) ( not ( = ?auto_746653 ?auto_746667 ) ) ( not ( = ?auto_746653 ?auto_746668 ) ) ( not ( = ?auto_746653 ?auto_746669 ) ) ( not ( = ?auto_746653 ?auto_746670 ) ) ( not ( = ?auto_746654 ?auto_746655 ) ) ( not ( = ?auto_746654 ?auto_746656 ) ) ( not ( = ?auto_746654 ?auto_746657 ) ) ( not ( = ?auto_746654 ?auto_746658 ) ) ( not ( = ?auto_746654 ?auto_746659 ) ) ( not ( = ?auto_746654 ?auto_746660 ) ) ( not ( = ?auto_746654 ?auto_746661 ) ) ( not ( = ?auto_746654 ?auto_746662 ) ) ( not ( = ?auto_746654 ?auto_746663 ) ) ( not ( = ?auto_746654 ?auto_746664 ) ) ( not ( = ?auto_746654 ?auto_746665 ) ) ( not ( = ?auto_746654 ?auto_746666 ) ) ( not ( = ?auto_746654 ?auto_746667 ) ) ( not ( = ?auto_746654 ?auto_746668 ) ) ( not ( = ?auto_746654 ?auto_746669 ) ) ( not ( = ?auto_746654 ?auto_746670 ) ) ( not ( = ?auto_746655 ?auto_746656 ) ) ( not ( = ?auto_746655 ?auto_746657 ) ) ( not ( = ?auto_746655 ?auto_746658 ) ) ( not ( = ?auto_746655 ?auto_746659 ) ) ( not ( = ?auto_746655 ?auto_746660 ) ) ( not ( = ?auto_746655 ?auto_746661 ) ) ( not ( = ?auto_746655 ?auto_746662 ) ) ( not ( = ?auto_746655 ?auto_746663 ) ) ( not ( = ?auto_746655 ?auto_746664 ) ) ( not ( = ?auto_746655 ?auto_746665 ) ) ( not ( = ?auto_746655 ?auto_746666 ) ) ( not ( = ?auto_746655 ?auto_746667 ) ) ( not ( = ?auto_746655 ?auto_746668 ) ) ( not ( = ?auto_746655 ?auto_746669 ) ) ( not ( = ?auto_746655 ?auto_746670 ) ) ( not ( = ?auto_746656 ?auto_746657 ) ) ( not ( = ?auto_746656 ?auto_746658 ) ) ( not ( = ?auto_746656 ?auto_746659 ) ) ( not ( = ?auto_746656 ?auto_746660 ) ) ( not ( = ?auto_746656 ?auto_746661 ) ) ( not ( = ?auto_746656 ?auto_746662 ) ) ( not ( = ?auto_746656 ?auto_746663 ) ) ( not ( = ?auto_746656 ?auto_746664 ) ) ( not ( = ?auto_746656 ?auto_746665 ) ) ( not ( = ?auto_746656 ?auto_746666 ) ) ( not ( = ?auto_746656 ?auto_746667 ) ) ( not ( = ?auto_746656 ?auto_746668 ) ) ( not ( = ?auto_746656 ?auto_746669 ) ) ( not ( = ?auto_746656 ?auto_746670 ) ) ( not ( = ?auto_746657 ?auto_746658 ) ) ( not ( = ?auto_746657 ?auto_746659 ) ) ( not ( = ?auto_746657 ?auto_746660 ) ) ( not ( = ?auto_746657 ?auto_746661 ) ) ( not ( = ?auto_746657 ?auto_746662 ) ) ( not ( = ?auto_746657 ?auto_746663 ) ) ( not ( = ?auto_746657 ?auto_746664 ) ) ( not ( = ?auto_746657 ?auto_746665 ) ) ( not ( = ?auto_746657 ?auto_746666 ) ) ( not ( = ?auto_746657 ?auto_746667 ) ) ( not ( = ?auto_746657 ?auto_746668 ) ) ( not ( = ?auto_746657 ?auto_746669 ) ) ( not ( = ?auto_746657 ?auto_746670 ) ) ( not ( = ?auto_746658 ?auto_746659 ) ) ( not ( = ?auto_746658 ?auto_746660 ) ) ( not ( = ?auto_746658 ?auto_746661 ) ) ( not ( = ?auto_746658 ?auto_746662 ) ) ( not ( = ?auto_746658 ?auto_746663 ) ) ( not ( = ?auto_746658 ?auto_746664 ) ) ( not ( = ?auto_746658 ?auto_746665 ) ) ( not ( = ?auto_746658 ?auto_746666 ) ) ( not ( = ?auto_746658 ?auto_746667 ) ) ( not ( = ?auto_746658 ?auto_746668 ) ) ( not ( = ?auto_746658 ?auto_746669 ) ) ( not ( = ?auto_746658 ?auto_746670 ) ) ( not ( = ?auto_746659 ?auto_746660 ) ) ( not ( = ?auto_746659 ?auto_746661 ) ) ( not ( = ?auto_746659 ?auto_746662 ) ) ( not ( = ?auto_746659 ?auto_746663 ) ) ( not ( = ?auto_746659 ?auto_746664 ) ) ( not ( = ?auto_746659 ?auto_746665 ) ) ( not ( = ?auto_746659 ?auto_746666 ) ) ( not ( = ?auto_746659 ?auto_746667 ) ) ( not ( = ?auto_746659 ?auto_746668 ) ) ( not ( = ?auto_746659 ?auto_746669 ) ) ( not ( = ?auto_746659 ?auto_746670 ) ) ( not ( = ?auto_746660 ?auto_746661 ) ) ( not ( = ?auto_746660 ?auto_746662 ) ) ( not ( = ?auto_746660 ?auto_746663 ) ) ( not ( = ?auto_746660 ?auto_746664 ) ) ( not ( = ?auto_746660 ?auto_746665 ) ) ( not ( = ?auto_746660 ?auto_746666 ) ) ( not ( = ?auto_746660 ?auto_746667 ) ) ( not ( = ?auto_746660 ?auto_746668 ) ) ( not ( = ?auto_746660 ?auto_746669 ) ) ( not ( = ?auto_746660 ?auto_746670 ) ) ( not ( = ?auto_746661 ?auto_746662 ) ) ( not ( = ?auto_746661 ?auto_746663 ) ) ( not ( = ?auto_746661 ?auto_746664 ) ) ( not ( = ?auto_746661 ?auto_746665 ) ) ( not ( = ?auto_746661 ?auto_746666 ) ) ( not ( = ?auto_746661 ?auto_746667 ) ) ( not ( = ?auto_746661 ?auto_746668 ) ) ( not ( = ?auto_746661 ?auto_746669 ) ) ( not ( = ?auto_746661 ?auto_746670 ) ) ( not ( = ?auto_746662 ?auto_746663 ) ) ( not ( = ?auto_746662 ?auto_746664 ) ) ( not ( = ?auto_746662 ?auto_746665 ) ) ( not ( = ?auto_746662 ?auto_746666 ) ) ( not ( = ?auto_746662 ?auto_746667 ) ) ( not ( = ?auto_746662 ?auto_746668 ) ) ( not ( = ?auto_746662 ?auto_746669 ) ) ( not ( = ?auto_746662 ?auto_746670 ) ) ( not ( = ?auto_746663 ?auto_746664 ) ) ( not ( = ?auto_746663 ?auto_746665 ) ) ( not ( = ?auto_746663 ?auto_746666 ) ) ( not ( = ?auto_746663 ?auto_746667 ) ) ( not ( = ?auto_746663 ?auto_746668 ) ) ( not ( = ?auto_746663 ?auto_746669 ) ) ( not ( = ?auto_746663 ?auto_746670 ) ) ( not ( = ?auto_746664 ?auto_746665 ) ) ( not ( = ?auto_746664 ?auto_746666 ) ) ( not ( = ?auto_746664 ?auto_746667 ) ) ( not ( = ?auto_746664 ?auto_746668 ) ) ( not ( = ?auto_746664 ?auto_746669 ) ) ( not ( = ?auto_746664 ?auto_746670 ) ) ( not ( = ?auto_746665 ?auto_746666 ) ) ( not ( = ?auto_746665 ?auto_746667 ) ) ( not ( = ?auto_746665 ?auto_746668 ) ) ( not ( = ?auto_746665 ?auto_746669 ) ) ( not ( = ?auto_746665 ?auto_746670 ) ) ( not ( = ?auto_746666 ?auto_746667 ) ) ( not ( = ?auto_746666 ?auto_746668 ) ) ( not ( = ?auto_746666 ?auto_746669 ) ) ( not ( = ?auto_746666 ?auto_746670 ) ) ( not ( = ?auto_746667 ?auto_746668 ) ) ( not ( = ?auto_746667 ?auto_746669 ) ) ( not ( = ?auto_746667 ?auto_746670 ) ) ( not ( = ?auto_746668 ?auto_746669 ) ) ( not ( = ?auto_746668 ?auto_746670 ) ) ( not ( = ?auto_746669 ?auto_746670 ) ) ( ON ?auto_746668 ?auto_746669 ) ( ON ?auto_746667 ?auto_746668 ) ( ON ?auto_746666 ?auto_746667 ) ( ON ?auto_746665 ?auto_746666 ) ( ON ?auto_746664 ?auto_746665 ) ( ON ?auto_746663 ?auto_746664 ) ( ON ?auto_746662 ?auto_746663 ) ( ON ?auto_746661 ?auto_746662 ) ( ON ?auto_746660 ?auto_746661 ) ( CLEAR ?auto_746658 ) ( ON ?auto_746659 ?auto_746660 ) ( CLEAR ?auto_746659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_746653 ?auto_746654 ?auto_746655 ?auto_746656 ?auto_746657 ?auto_746658 ?auto_746659 )
      ( MAKE-17PILE ?auto_746653 ?auto_746654 ?auto_746655 ?auto_746656 ?auto_746657 ?auto_746658 ?auto_746659 ?auto_746660 ?auto_746661 ?auto_746662 ?auto_746663 ?auto_746664 ?auto_746665 ?auto_746666 ?auto_746667 ?auto_746668 ?auto_746669 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746723 - BLOCK
      ?auto_746724 - BLOCK
      ?auto_746725 - BLOCK
      ?auto_746726 - BLOCK
      ?auto_746727 - BLOCK
      ?auto_746728 - BLOCK
      ?auto_746729 - BLOCK
      ?auto_746730 - BLOCK
      ?auto_746731 - BLOCK
      ?auto_746732 - BLOCK
      ?auto_746733 - BLOCK
      ?auto_746734 - BLOCK
      ?auto_746735 - BLOCK
      ?auto_746736 - BLOCK
      ?auto_746737 - BLOCK
      ?auto_746738 - BLOCK
      ?auto_746739 - BLOCK
    )
    :vars
    (
      ?auto_746740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746739 ?auto_746740 ) ( ON-TABLE ?auto_746723 ) ( ON ?auto_746724 ?auto_746723 ) ( ON ?auto_746725 ?auto_746724 ) ( ON ?auto_746726 ?auto_746725 ) ( ON ?auto_746727 ?auto_746726 ) ( not ( = ?auto_746723 ?auto_746724 ) ) ( not ( = ?auto_746723 ?auto_746725 ) ) ( not ( = ?auto_746723 ?auto_746726 ) ) ( not ( = ?auto_746723 ?auto_746727 ) ) ( not ( = ?auto_746723 ?auto_746728 ) ) ( not ( = ?auto_746723 ?auto_746729 ) ) ( not ( = ?auto_746723 ?auto_746730 ) ) ( not ( = ?auto_746723 ?auto_746731 ) ) ( not ( = ?auto_746723 ?auto_746732 ) ) ( not ( = ?auto_746723 ?auto_746733 ) ) ( not ( = ?auto_746723 ?auto_746734 ) ) ( not ( = ?auto_746723 ?auto_746735 ) ) ( not ( = ?auto_746723 ?auto_746736 ) ) ( not ( = ?auto_746723 ?auto_746737 ) ) ( not ( = ?auto_746723 ?auto_746738 ) ) ( not ( = ?auto_746723 ?auto_746739 ) ) ( not ( = ?auto_746723 ?auto_746740 ) ) ( not ( = ?auto_746724 ?auto_746725 ) ) ( not ( = ?auto_746724 ?auto_746726 ) ) ( not ( = ?auto_746724 ?auto_746727 ) ) ( not ( = ?auto_746724 ?auto_746728 ) ) ( not ( = ?auto_746724 ?auto_746729 ) ) ( not ( = ?auto_746724 ?auto_746730 ) ) ( not ( = ?auto_746724 ?auto_746731 ) ) ( not ( = ?auto_746724 ?auto_746732 ) ) ( not ( = ?auto_746724 ?auto_746733 ) ) ( not ( = ?auto_746724 ?auto_746734 ) ) ( not ( = ?auto_746724 ?auto_746735 ) ) ( not ( = ?auto_746724 ?auto_746736 ) ) ( not ( = ?auto_746724 ?auto_746737 ) ) ( not ( = ?auto_746724 ?auto_746738 ) ) ( not ( = ?auto_746724 ?auto_746739 ) ) ( not ( = ?auto_746724 ?auto_746740 ) ) ( not ( = ?auto_746725 ?auto_746726 ) ) ( not ( = ?auto_746725 ?auto_746727 ) ) ( not ( = ?auto_746725 ?auto_746728 ) ) ( not ( = ?auto_746725 ?auto_746729 ) ) ( not ( = ?auto_746725 ?auto_746730 ) ) ( not ( = ?auto_746725 ?auto_746731 ) ) ( not ( = ?auto_746725 ?auto_746732 ) ) ( not ( = ?auto_746725 ?auto_746733 ) ) ( not ( = ?auto_746725 ?auto_746734 ) ) ( not ( = ?auto_746725 ?auto_746735 ) ) ( not ( = ?auto_746725 ?auto_746736 ) ) ( not ( = ?auto_746725 ?auto_746737 ) ) ( not ( = ?auto_746725 ?auto_746738 ) ) ( not ( = ?auto_746725 ?auto_746739 ) ) ( not ( = ?auto_746725 ?auto_746740 ) ) ( not ( = ?auto_746726 ?auto_746727 ) ) ( not ( = ?auto_746726 ?auto_746728 ) ) ( not ( = ?auto_746726 ?auto_746729 ) ) ( not ( = ?auto_746726 ?auto_746730 ) ) ( not ( = ?auto_746726 ?auto_746731 ) ) ( not ( = ?auto_746726 ?auto_746732 ) ) ( not ( = ?auto_746726 ?auto_746733 ) ) ( not ( = ?auto_746726 ?auto_746734 ) ) ( not ( = ?auto_746726 ?auto_746735 ) ) ( not ( = ?auto_746726 ?auto_746736 ) ) ( not ( = ?auto_746726 ?auto_746737 ) ) ( not ( = ?auto_746726 ?auto_746738 ) ) ( not ( = ?auto_746726 ?auto_746739 ) ) ( not ( = ?auto_746726 ?auto_746740 ) ) ( not ( = ?auto_746727 ?auto_746728 ) ) ( not ( = ?auto_746727 ?auto_746729 ) ) ( not ( = ?auto_746727 ?auto_746730 ) ) ( not ( = ?auto_746727 ?auto_746731 ) ) ( not ( = ?auto_746727 ?auto_746732 ) ) ( not ( = ?auto_746727 ?auto_746733 ) ) ( not ( = ?auto_746727 ?auto_746734 ) ) ( not ( = ?auto_746727 ?auto_746735 ) ) ( not ( = ?auto_746727 ?auto_746736 ) ) ( not ( = ?auto_746727 ?auto_746737 ) ) ( not ( = ?auto_746727 ?auto_746738 ) ) ( not ( = ?auto_746727 ?auto_746739 ) ) ( not ( = ?auto_746727 ?auto_746740 ) ) ( not ( = ?auto_746728 ?auto_746729 ) ) ( not ( = ?auto_746728 ?auto_746730 ) ) ( not ( = ?auto_746728 ?auto_746731 ) ) ( not ( = ?auto_746728 ?auto_746732 ) ) ( not ( = ?auto_746728 ?auto_746733 ) ) ( not ( = ?auto_746728 ?auto_746734 ) ) ( not ( = ?auto_746728 ?auto_746735 ) ) ( not ( = ?auto_746728 ?auto_746736 ) ) ( not ( = ?auto_746728 ?auto_746737 ) ) ( not ( = ?auto_746728 ?auto_746738 ) ) ( not ( = ?auto_746728 ?auto_746739 ) ) ( not ( = ?auto_746728 ?auto_746740 ) ) ( not ( = ?auto_746729 ?auto_746730 ) ) ( not ( = ?auto_746729 ?auto_746731 ) ) ( not ( = ?auto_746729 ?auto_746732 ) ) ( not ( = ?auto_746729 ?auto_746733 ) ) ( not ( = ?auto_746729 ?auto_746734 ) ) ( not ( = ?auto_746729 ?auto_746735 ) ) ( not ( = ?auto_746729 ?auto_746736 ) ) ( not ( = ?auto_746729 ?auto_746737 ) ) ( not ( = ?auto_746729 ?auto_746738 ) ) ( not ( = ?auto_746729 ?auto_746739 ) ) ( not ( = ?auto_746729 ?auto_746740 ) ) ( not ( = ?auto_746730 ?auto_746731 ) ) ( not ( = ?auto_746730 ?auto_746732 ) ) ( not ( = ?auto_746730 ?auto_746733 ) ) ( not ( = ?auto_746730 ?auto_746734 ) ) ( not ( = ?auto_746730 ?auto_746735 ) ) ( not ( = ?auto_746730 ?auto_746736 ) ) ( not ( = ?auto_746730 ?auto_746737 ) ) ( not ( = ?auto_746730 ?auto_746738 ) ) ( not ( = ?auto_746730 ?auto_746739 ) ) ( not ( = ?auto_746730 ?auto_746740 ) ) ( not ( = ?auto_746731 ?auto_746732 ) ) ( not ( = ?auto_746731 ?auto_746733 ) ) ( not ( = ?auto_746731 ?auto_746734 ) ) ( not ( = ?auto_746731 ?auto_746735 ) ) ( not ( = ?auto_746731 ?auto_746736 ) ) ( not ( = ?auto_746731 ?auto_746737 ) ) ( not ( = ?auto_746731 ?auto_746738 ) ) ( not ( = ?auto_746731 ?auto_746739 ) ) ( not ( = ?auto_746731 ?auto_746740 ) ) ( not ( = ?auto_746732 ?auto_746733 ) ) ( not ( = ?auto_746732 ?auto_746734 ) ) ( not ( = ?auto_746732 ?auto_746735 ) ) ( not ( = ?auto_746732 ?auto_746736 ) ) ( not ( = ?auto_746732 ?auto_746737 ) ) ( not ( = ?auto_746732 ?auto_746738 ) ) ( not ( = ?auto_746732 ?auto_746739 ) ) ( not ( = ?auto_746732 ?auto_746740 ) ) ( not ( = ?auto_746733 ?auto_746734 ) ) ( not ( = ?auto_746733 ?auto_746735 ) ) ( not ( = ?auto_746733 ?auto_746736 ) ) ( not ( = ?auto_746733 ?auto_746737 ) ) ( not ( = ?auto_746733 ?auto_746738 ) ) ( not ( = ?auto_746733 ?auto_746739 ) ) ( not ( = ?auto_746733 ?auto_746740 ) ) ( not ( = ?auto_746734 ?auto_746735 ) ) ( not ( = ?auto_746734 ?auto_746736 ) ) ( not ( = ?auto_746734 ?auto_746737 ) ) ( not ( = ?auto_746734 ?auto_746738 ) ) ( not ( = ?auto_746734 ?auto_746739 ) ) ( not ( = ?auto_746734 ?auto_746740 ) ) ( not ( = ?auto_746735 ?auto_746736 ) ) ( not ( = ?auto_746735 ?auto_746737 ) ) ( not ( = ?auto_746735 ?auto_746738 ) ) ( not ( = ?auto_746735 ?auto_746739 ) ) ( not ( = ?auto_746735 ?auto_746740 ) ) ( not ( = ?auto_746736 ?auto_746737 ) ) ( not ( = ?auto_746736 ?auto_746738 ) ) ( not ( = ?auto_746736 ?auto_746739 ) ) ( not ( = ?auto_746736 ?auto_746740 ) ) ( not ( = ?auto_746737 ?auto_746738 ) ) ( not ( = ?auto_746737 ?auto_746739 ) ) ( not ( = ?auto_746737 ?auto_746740 ) ) ( not ( = ?auto_746738 ?auto_746739 ) ) ( not ( = ?auto_746738 ?auto_746740 ) ) ( not ( = ?auto_746739 ?auto_746740 ) ) ( ON ?auto_746738 ?auto_746739 ) ( ON ?auto_746737 ?auto_746738 ) ( ON ?auto_746736 ?auto_746737 ) ( ON ?auto_746735 ?auto_746736 ) ( ON ?auto_746734 ?auto_746735 ) ( ON ?auto_746733 ?auto_746734 ) ( ON ?auto_746732 ?auto_746733 ) ( ON ?auto_746731 ?auto_746732 ) ( ON ?auto_746730 ?auto_746731 ) ( ON ?auto_746729 ?auto_746730 ) ( CLEAR ?auto_746727 ) ( ON ?auto_746728 ?auto_746729 ) ( CLEAR ?auto_746728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_746723 ?auto_746724 ?auto_746725 ?auto_746726 ?auto_746727 ?auto_746728 )
      ( MAKE-17PILE ?auto_746723 ?auto_746724 ?auto_746725 ?auto_746726 ?auto_746727 ?auto_746728 ?auto_746729 ?auto_746730 ?auto_746731 ?auto_746732 ?auto_746733 ?auto_746734 ?auto_746735 ?auto_746736 ?auto_746737 ?auto_746738 ?auto_746739 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746793 - BLOCK
      ?auto_746794 - BLOCK
      ?auto_746795 - BLOCK
      ?auto_746796 - BLOCK
      ?auto_746797 - BLOCK
      ?auto_746798 - BLOCK
      ?auto_746799 - BLOCK
      ?auto_746800 - BLOCK
      ?auto_746801 - BLOCK
      ?auto_746802 - BLOCK
      ?auto_746803 - BLOCK
      ?auto_746804 - BLOCK
      ?auto_746805 - BLOCK
      ?auto_746806 - BLOCK
      ?auto_746807 - BLOCK
      ?auto_746808 - BLOCK
      ?auto_746809 - BLOCK
    )
    :vars
    (
      ?auto_746810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746809 ?auto_746810 ) ( ON-TABLE ?auto_746793 ) ( ON ?auto_746794 ?auto_746793 ) ( ON ?auto_746795 ?auto_746794 ) ( ON ?auto_746796 ?auto_746795 ) ( not ( = ?auto_746793 ?auto_746794 ) ) ( not ( = ?auto_746793 ?auto_746795 ) ) ( not ( = ?auto_746793 ?auto_746796 ) ) ( not ( = ?auto_746793 ?auto_746797 ) ) ( not ( = ?auto_746793 ?auto_746798 ) ) ( not ( = ?auto_746793 ?auto_746799 ) ) ( not ( = ?auto_746793 ?auto_746800 ) ) ( not ( = ?auto_746793 ?auto_746801 ) ) ( not ( = ?auto_746793 ?auto_746802 ) ) ( not ( = ?auto_746793 ?auto_746803 ) ) ( not ( = ?auto_746793 ?auto_746804 ) ) ( not ( = ?auto_746793 ?auto_746805 ) ) ( not ( = ?auto_746793 ?auto_746806 ) ) ( not ( = ?auto_746793 ?auto_746807 ) ) ( not ( = ?auto_746793 ?auto_746808 ) ) ( not ( = ?auto_746793 ?auto_746809 ) ) ( not ( = ?auto_746793 ?auto_746810 ) ) ( not ( = ?auto_746794 ?auto_746795 ) ) ( not ( = ?auto_746794 ?auto_746796 ) ) ( not ( = ?auto_746794 ?auto_746797 ) ) ( not ( = ?auto_746794 ?auto_746798 ) ) ( not ( = ?auto_746794 ?auto_746799 ) ) ( not ( = ?auto_746794 ?auto_746800 ) ) ( not ( = ?auto_746794 ?auto_746801 ) ) ( not ( = ?auto_746794 ?auto_746802 ) ) ( not ( = ?auto_746794 ?auto_746803 ) ) ( not ( = ?auto_746794 ?auto_746804 ) ) ( not ( = ?auto_746794 ?auto_746805 ) ) ( not ( = ?auto_746794 ?auto_746806 ) ) ( not ( = ?auto_746794 ?auto_746807 ) ) ( not ( = ?auto_746794 ?auto_746808 ) ) ( not ( = ?auto_746794 ?auto_746809 ) ) ( not ( = ?auto_746794 ?auto_746810 ) ) ( not ( = ?auto_746795 ?auto_746796 ) ) ( not ( = ?auto_746795 ?auto_746797 ) ) ( not ( = ?auto_746795 ?auto_746798 ) ) ( not ( = ?auto_746795 ?auto_746799 ) ) ( not ( = ?auto_746795 ?auto_746800 ) ) ( not ( = ?auto_746795 ?auto_746801 ) ) ( not ( = ?auto_746795 ?auto_746802 ) ) ( not ( = ?auto_746795 ?auto_746803 ) ) ( not ( = ?auto_746795 ?auto_746804 ) ) ( not ( = ?auto_746795 ?auto_746805 ) ) ( not ( = ?auto_746795 ?auto_746806 ) ) ( not ( = ?auto_746795 ?auto_746807 ) ) ( not ( = ?auto_746795 ?auto_746808 ) ) ( not ( = ?auto_746795 ?auto_746809 ) ) ( not ( = ?auto_746795 ?auto_746810 ) ) ( not ( = ?auto_746796 ?auto_746797 ) ) ( not ( = ?auto_746796 ?auto_746798 ) ) ( not ( = ?auto_746796 ?auto_746799 ) ) ( not ( = ?auto_746796 ?auto_746800 ) ) ( not ( = ?auto_746796 ?auto_746801 ) ) ( not ( = ?auto_746796 ?auto_746802 ) ) ( not ( = ?auto_746796 ?auto_746803 ) ) ( not ( = ?auto_746796 ?auto_746804 ) ) ( not ( = ?auto_746796 ?auto_746805 ) ) ( not ( = ?auto_746796 ?auto_746806 ) ) ( not ( = ?auto_746796 ?auto_746807 ) ) ( not ( = ?auto_746796 ?auto_746808 ) ) ( not ( = ?auto_746796 ?auto_746809 ) ) ( not ( = ?auto_746796 ?auto_746810 ) ) ( not ( = ?auto_746797 ?auto_746798 ) ) ( not ( = ?auto_746797 ?auto_746799 ) ) ( not ( = ?auto_746797 ?auto_746800 ) ) ( not ( = ?auto_746797 ?auto_746801 ) ) ( not ( = ?auto_746797 ?auto_746802 ) ) ( not ( = ?auto_746797 ?auto_746803 ) ) ( not ( = ?auto_746797 ?auto_746804 ) ) ( not ( = ?auto_746797 ?auto_746805 ) ) ( not ( = ?auto_746797 ?auto_746806 ) ) ( not ( = ?auto_746797 ?auto_746807 ) ) ( not ( = ?auto_746797 ?auto_746808 ) ) ( not ( = ?auto_746797 ?auto_746809 ) ) ( not ( = ?auto_746797 ?auto_746810 ) ) ( not ( = ?auto_746798 ?auto_746799 ) ) ( not ( = ?auto_746798 ?auto_746800 ) ) ( not ( = ?auto_746798 ?auto_746801 ) ) ( not ( = ?auto_746798 ?auto_746802 ) ) ( not ( = ?auto_746798 ?auto_746803 ) ) ( not ( = ?auto_746798 ?auto_746804 ) ) ( not ( = ?auto_746798 ?auto_746805 ) ) ( not ( = ?auto_746798 ?auto_746806 ) ) ( not ( = ?auto_746798 ?auto_746807 ) ) ( not ( = ?auto_746798 ?auto_746808 ) ) ( not ( = ?auto_746798 ?auto_746809 ) ) ( not ( = ?auto_746798 ?auto_746810 ) ) ( not ( = ?auto_746799 ?auto_746800 ) ) ( not ( = ?auto_746799 ?auto_746801 ) ) ( not ( = ?auto_746799 ?auto_746802 ) ) ( not ( = ?auto_746799 ?auto_746803 ) ) ( not ( = ?auto_746799 ?auto_746804 ) ) ( not ( = ?auto_746799 ?auto_746805 ) ) ( not ( = ?auto_746799 ?auto_746806 ) ) ( not ( = ?auto_746799 ?auto_746807 ) ) ( not ( = ?auto_746799 ?auto_746808 ) ) ( not ( = ?auto_746799 ?auto_746809 ) ) ( not ( = ?auto_746799 ?auto_746810 ) ) ( not ( = ?auto_746800 ?auto_746801 ) ) ( not ( = ?auto_746800 ?auto_746802 ) ) ( not ( = ?auto_746800 ?auto_746803 ) ) ( not ( = ?auto_746800 ?auto_746804 ) ) ( not ( = ?auto_746800 ?auto_746805 ) ) ( not ( = ?auto_746800 ?auto_746806 ) ) ( not ( = ?auto_746800 ?auto_746807 ) ) ( not ( = ?auto_746800 ?auto_746808 ) ) ( not ( = ?auto_746800 ?auto_746809 ) ) ( not ( = ?auto_746800 ?auto_746810 ) ) ( not ( = ?auto_746801 ?auto_746802 ) ) ( not ( = ?auto_746801 ?auto_746803 ) ) ( not ( = ?auto_746801 ?auto_746804 ) ) ( not ( = ?auto_746801 ?auto_746805 ) ) ( not ( = ?auto_746801 ?auto_746806 ) ) ( not ( = ?auto_746801 ?auto_746807 ) ) ( not ( = ?auto_746801 ?auto_746808 ) ) ( not ( = ?auto_746801 ?auto_746809 ) ) ( not ( = ?auto_746801 ?auto_746810 ) ) ( not ( = ?auto_746802 ?auto_746803 ) ) ( not ( = ?auto_746802 ?auto_746804 ) ) ( not ( = ?auto_746802 ?auto_746805 ) ) ( not ( = ?auto_746802 ?auto_746806 ) ) ( not ( = ?auto_746802 ?auto_746807 ) ) ( not ( = ?auto_746802 ?auto_746808 ) ) ( not ( = ?auto_746802 ?auto_746809 ) ) ( not ( = ?auto_746802 ?auto_746810 ) ) ( not ( = ?auto_746803 ?auto_746804 ) ) ( not ( = ?auto_746803 ?auto_746805 ) ) ( not ( = ?auto_746803 ?auto_746806 ) ) ( not ( = ?auto_746803 ?auto_746807 ) ) ( not ( = ?auto_746803 ?auto_746808 ) ) ( not ( = ?auto_746803 ?auto_746809 ) ) ( not ( = ?auto_746803 ?auto_746810 ) ) ( not ( = ?auto_746804 ?auto_746805 ) ) ( not ( = ?auto_746804 ?auto_746806 ) ) ( not ( = ?auto_746804 ?auto_746807 ) ) ( not ( = ?auto_746804 ?auto_746808 ) ) ( not ( = ?auto_746804 ?auto_746809 ) ) ( not ( = ?auto_746804 ?auto_746810 ) ) ( not ( = ?auto_746805 ?auto_746806 ) ) ( not ( = ?auto_746805 ?auto_746807 ) ) ( not ( = ?auto_746805 ?auto_746808 ) ) ( not ( = ?auto_746805 ?auto_746809 ) ) ( not ( = ?auto_746805 ?auto_746810 ) ) ( not ( = ?auto_746806 ?auto_746807 ) ) ( not ( = ?auto_746806 ?auto_746808 ) ) ( not ( = ?auto_746806 ?auto_746809 ) ) ( not ( = ?auto_746806 ?auto_746810 ) ) ( not ( = ?auto_746807 ?auto_746808 ) ) ( not ( = ?auto_746807 ?auto_746809 ) ) ( not ( = ?auto_746807 ?auto_746810 ) ) ( not ( = ?auto_746808 ?auto_746809 ) ) ( not ( = ?auto_746808 ?auto_746810 ) ) ( not ( = ?auto_746809 ?auto_746810 ) ) ( ON ?auto_746808 ?auto_746809 ) ( ON ?auto_746807 ?auto_746808 ) ( ON ?auto_746806 ?auto_746807 ) ( ON ?auto_746805 ?auto_746806 ) ( ON ?auto_746804 ?auto_746805 ) ( ON ?auto_746803 ?auto_746804 ) ( ON ?auto_746802 ?auto_746803 ) ( ON ?auto_746801 ?auto_746802 ) ( ON ?auto_746800 ?auto_746801 ) ( ON ?auto_746799 ?auto_746800 ) ( ON ?auto_746798 ?auto_746799 ) ( CLEAR ?auto_746796 ) ( ON ?auto_746797 ?auto_746798 ) ( CLEAR ?auto_746797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_746793 ?auto_746794 ?auto_746795 ?auto_746796 ?auto_746797 )
      ( MAKE-17PILE ?auto_746793 ?auto_746794 ?auto_746795 ?auto_746796 ?auto_746797 ?auto_746798 ?auto_746799 ?auto_746800 ?auto_746801 ?auto_746802 ?auto_746803 ?auto_746804 ?auto_746805 ?auto_746806 ?auto_746807 ?auto_746808 ?auto_746809 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746863 - BLOCK
      ?auto_746864 - BLOCK
      ?auto_746865 - BLOCK
      ?auto_746866 - BLOCK
      ?auto_746867 - BLOCK
      ?auto_746868 - BLOCK
      ?auto_746869 - BLOCK
      ?auto_746870 - BLOCK
      ?auto_746871 - BLOCK
      ?auto_746872 - BLOCK
      ?auto_746873 - BLOCK
      ?auto_746874 - BLOCK
      ?auto_746875 - BLOCK
      ?auto_746876 - BLOCK
      ?auto_746877 - BLOCK
      ?auto_746878 - BLOCK
      ?auto_746879 - BLOCK
    )
    :vars
    (
      ?auto_746880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746879 ?auto_746880 ) ( ON-TABLE ?auto_746863 ) ( ON ?auto_746864 ?auto_746863 ) ( ON ?auto_746865 ?auto_746864 ) ( not ( = ?auto_746863 ?auto_746864 ) ) ( not ( = ?auto_746863 ?auto_746865 ) ) ( not ( = ?auto_746863 ?auto_746866 ) ) ( not ( = ?auto_746863 ?auto_746867 ) ) ( not ( = ?auto_746863 ?auto_746868 ) ) ( not ( = ?auto_746863 ?auto_746869 ) ) ( not ( = ?auto_746863 ?auto_746870 ) ) ( not ( = ?auto_746863 ?auto_746871 ) ) ( not ( = ?auto_746863 ?auto_746872 ) ) ( not ( = ?auto_746863 ?auto_746873 ) ) ( not ( = ?auto_746863 ?auto_746874 ) ) ( not ( = ?auto_746863 ?auto_746875 ) ) ( not ( = ?auto_746863 ?auto_746876 ) ) ( not ( = ?auto_746863 ?auto_746877 ) ) ( not ( = ?auto_746863 ?auto_746878 ) ) ( not ( = ?auto_746863 ?auto_746879 ) ) ( not ( = ?auto_746863 ?auto_746880 ) ) ( not ( = ?auto_746864 ?auto_746865 ) ) ( not ( = ?auto_746864 ?auto_746866 ) ) ( not ( = ?auto_746864 ?auto_746867 ) ) ( not ( = ?auto_746864 ?auto_746868 ) ) ( not ( = ?auto_746864 ?auto_746869 ) ) ( not ( = ?auto_746864 ?auto_746870 ) ) ( not ( = ?auto_746864 ?auto_746871 ) ) ( not ( = ?auto_746864 ?auto_746872 ) ) ( not ( = ?auto_746864 ?auto_746873 ) ) ( not ( = ?auto_746864 ?auto_746874 ) ) ( not ( = ?auto_746864 ?auto_746875 ) ) ( not ( = ?auto_746864 ?auto_746876 ) ) ( not ( = ?auto_746864 ?auto_746877 ) ) ( not ( = ?auto_746864 ?auto_746878 ) ) ( not ( = ?auto_746864 ?auto_746879 ) ) ( not ( = ?auto_746864 ?auto_746880 ) ) ( not ( = ?auto_746865 ?auto_746866 ) ) ( not ( = ?auto_746865 ?auto_746867 ) ) ( not ( = ?auto_746865 ?auto_746868 ) ) ( not ( = ?auto_746865 ?auto_746869 ) ) ( not ( = ?auto_746865 ?auto_746870 ) ) ( not ( = ?auto_746865 ?auto_746871 ) ) ( not ( = ?auto_746865 ?auto_746872 ) ) ( not ( = ?auto_746865 ?auto_746873 ) ) ( not ( = ?auto_746865 ?auto_746874 ) ) ( not ( = ?auto_746865 ?auto_746875 ) ) ( not ( = ?auto_746865 ?auto_746876 ) ) ( not ( = ?auto_746865 ?auto_746877 ) ) ( not ( = ?auto_746865 ?auto_746878 ) ) ( not ( = ?auto_746865 ?auto_746879 ) ) ( not ( = ?auto_746865 ?auto_746880 ) ) ( not ( = ?auto_746866 ?auto_746867 ) ) ( not ( = ?auto_746866 ?auto_746868 ) ) ( not ( = ?auto_746866 ?auto_746869 ) ) ( not ( = ?auto_746866 ?auto_746870 ) ) ( not ( = ?auto_746866 ?auto_746871 ) ) ( not ( = ?auto_746866 ?auto_746872 ) ) ( not ( = ?auto_746866 ?auto_746873 ) ) ( not ( = ?auto_746866 ?auto_746874 ) ) ( not ( = ?auto_746866 ?auto_746875 ) ) ( not ( = ?auto_746866 ?auto_746876 ) ) ( not ( = ?auto_746866 ?auto_746877 ) ) ( not ( = ?auto_746866 ?auto_746878 ) ) ( not ( = ?auto_746866 ?auto_746879 ) ) ( not ( = ?auto_746866 ?auto_746880 ) ) ( not ( = ?auto_746867 ?auto_746868 ) ) ( not ( = ?auto_746867 ?auto_746869 ) ) ( not ( = ?auto_746867 ?auto_746870 ) ) ( not ( = ?auto_746867 ?auto_746871 ) ) ( not ( = ?auto_746867 ?auto_746872 ) ) ( not ( = ?auto_746867 ?auto_746873 ) ) ( not ( = ?auto_746867 ?auto_746874 ) ) ( not ( = ?auto_746867 ?auto_746875 ) ) ( not ( = ?auto_746867 ?auto_746876 ) ) ( not ( = ?auto_746867 ?auto_746877 ) ) ( not ( = ?auto_746867 ?auto_746878 ) ) ( not ( = ?auto_746867 ?auto_746879 ) ) ( not ( = ?auto_746867 ?auto_746880 ) ) ( not ( = ?auto_746868 ?auto_746869 ) ) ( not ( = ?auto_746868 ?auto_746870 ) ) ( not ( = ?auto_746868 ?auto_746871 ) ) ( not ( = ?auto_746868 ?auto_746872 ) ) ( not ( = ?auto_746868 ?auto_746873 ) ) ( not ( = ?auto_746868 ?auto_746874 ) ) ( not ( = ?auto_746868 ?auto_746875 ) ) ( not ( = ?auto_746868 ?auto_746876 ) ) ( not ( = ?auto_746868 ?auto_746877 ) ) ( not ( = ?auto_746868 ?auto_746878 ) ) ( not ( = ?auto_746868 ?auto_746879 ) ) ( not ( = ?auto_746868 ?auto_746880 ) ) ( not ( = ?auto_746869 ?auto_746870 ) ) ( not ( = ?auto_746869 ?auto_746871 ) ) ( not ( = ?auto_746869 ?auto_746872 ) ) ( not ( = ?auto_746869 ?auto_746873 ) ) ( not ( = ?auto_746869 ?auto_746874 ) ) ( not ( = ?auto_746869 ?auto_746875 ) ) ( not ( = ?auto_746869 ?auto_746876 ) ) ( not ( = ?auto_746869 ?auto_746877 ) ) ( not ( = ?auto_746869 ?auto_746878 ) ) ( not ( = ?auto_746869 ?auto_746879 ) ) ( not ( = ?auto_746869 ?auto_746880 ) ) ( not ( = ?auto_746870 ?auto_746871 ) ) ( not ( = ?auto_746870 ?auto_746872 ) ) ( not ( = ?auto_746870 ?auto_746873 ) ) ( not ( = ?auto_746870 ?auto_746874 ) ) ( not ( = ?auto_746870 ?auto_746875 ) ) ( not ( = ?auto_746870 ?auto_746876 ) ) ( not ( = ?auto_746870 ?auto_746877 ) ) ( not ( = ?auto_746870 ?auto_746878 ) ) ( not ( = ?auto_746870 ?auto_746879 ) ) ( not ( = ?auto_746870 ?auto_746880 ) ) ( not ( = ?auto_746871 ?auto_746872 ) ) ( not ( = ?auto_746871 ?auto_746873 ) ) ( not ( = ?auto_746871 ?auto_746874 ) ) ( not ( = ?auto_746871 ?auto_746875 ) ) ( not ( = ?auto_746871 ?auto_746876 ) ) ( not ( = ?auto_746871 ?auto_746877 ) ) ( not ( = ?auto_746871 ?auto_746878 ) ) ( not ( = ?auto_746871 ?auto_746879 ) ) ( not ( = ?auto_746871 ?auto_746880 ) ) ( not ( = ?auto_746872 ?auto_746873 ) ) ( not ( = ?auto_746872 ?auto_746874 ) ) ( not ( = ?auto_746872 ?auto_746875 ) ) ( not ( = ?auto_746872 ?auto_746876 ) ) ( not ( = ?auto_746872 ?auto_746877 ) ) ( not ( = ?auto_746872 ?auto_746878 ) ) ( not ( = ?auto_746872 ?auto_746879 ) ) ( not ( = ?auto_746872 ?auto_746880 ) ) ( not ( = ?auto_746873 ?auto_746874 ) ) ( not ( = ?auto_746873 ?auto_746875 ) ) ( not ( = ?auto_746873 ?auto_746876 ) ) ( not ( = ?auto_746873 ?auto_746877 ) ) ( not ( = ?auto_746873 ?auto_746878 ) ) ( not ( = ?auto_746873 ?auto_746879 ) ) ( not ( = ?auto_746873 ?auto_746880 ) ) ( not ( = ?auto_746874 ?auto_746875 ) ) ( not ( = ?auto_746874 ?auto_746876 ) ) ( not ( = ?auto_746874 ?auto_746877 ) ) ( not ( = ?auto_746874 ?auto_746878 ) ) ( not ( = ?auto_746874 ?auto_746879 ) ) ( not ( = ?auto_746874 ?auto_746880 ) ) ( not ( = ?auto_746875 ?auto_746876 ) ) ( not ( = ?auto_746875 ?auto_746877 ) ) ( not ( = ?auto_746875 ?auto_746878 ) ) ( not ( = ?auto_746875 ?auto_746879 ) ) ( not ( = ?auto_746875 ?auto_746880 ) ) ( not ( = ?auto_746876 ?auto_746877 ) ) ( not ( = ?auto_746876 ?auto_746878 ) ) ( not ( = ?auto_746876 ?auto_746879 ) ) ( not ( = ?auto_746876 ?auto_746880 ) ) ( not ( = ?auto_746877 ?auto_746878 ) ) ( not ( = ?auto_746877 ?auto_746879 ) ) ( not ( = ?auto_746877 ?auto_746880 ) ) ( not ( = ?auto_746878 ?auto_746879 ) ) ( not ( = ?auto_746878 ?auto_746880 ) ) ( not ( = ?auto_746879 ?auto_746880 ) ) ( ON ?auto_746878 ?auto_746879 ) ( ON ?auto_746877 ?auto_746878 ) ( ON ?auto_746876 ?auto_746877 ) ( ON ?auto_746875 ?auto_746876 ) ( ON ?auto_746874 ?auto_746875 ) ( ON ?auto_746873 ?auto_746874 ) ( ON ?auto_746872 ?auto_746873 ) ( ON ?auto_746871 ?auto_746872 ) ( ON ?auto_746870 ?auto_746871 ) ( ON ?auto_746869 ?auto_746870 ) ( ON ?auto_746868 ?auto_746869 ) ( ON ?auto_746867 ?auto_746868 ) ( CLEAR ?auto_746865 ) ( ON ?auto_746866 ?auto_746867 ) ( CLEAR ?auto_746866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_746863 ?auto_746864 ?auto_746865 ?auto_746866 )
      ( MAKE-17PILE ?auto_746863 ?auto_746864 ?auto_746865 ?auto_746866 ?auto_746867 ?auto_746868 ?auto_746869 ?auto_746870 ?auto_746871 ?auto_746872 ?auto_746873 ?auto_746874 ?auto_746875 ?auto_746876 ?auto_746877 ?auto_746878 ?auto_746879 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_746933 - BLOCK
      ?auto_746934 - BLOCK
      ?auto_746935 - BLOCK
      ?auto_746936 - BLOCK
      ?auto_746937 - BLOCK
      ?auto_746938 - BLOCK
      ?auto_746939 - BLOCK
      ?auto_746940 - BLOCK
      ?auto_746941 - BLOCK
      ?auto_746942 - BLOCK
      ?auto_746943 - BLOCK
      ?auto_746944 - BLOCK
      ?auto_746945 - BLOCK
      ?auto_746946 - BLOCK
      ?auto_746947 - BLOCK
      ?auto_746948 - BLOCK
      ?auto_746949 - BLOCK
    )
    :vars
    (
      ?auto_746950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746949 ?auto_746950 ) ( ON-TABLE ?auto_746933 ) ( ON ?auto_746934 ?auto_746933 ) ( not ( = ?auto_746933 ?auto_746934 ) ) ( not ( = ?auto_746933 ?auto_746935 ) ) ( not ( = ?auto_746933 ?auto_746936 ) ) ( not ( = ?auto_746933 ?auto_746937 ) ) ( not ( = ?auto_746933 ?auto_746938 ) ) ( not ( = ?auto_746933 ?auto_746939 ) ) ( not ( = ?auto_746933 ?auto_746940 ) ) ( not ( = ?auto_746933 ?auto_746941 ) ) ( not ( = ?auto_746933 ?auto_746942 ) ) ( not ( = ?auto_746933 ?auto_746943 ) ) ( not ( = ?auto_746933 ?auto_746944 ) ) ( not ( = ?auto_746933 ?auto_746945 ) ) ( not ( = ?auto_746933 ?auto_746946 ) ) ( not ( = ?auto_746933 ?auto_746947 ) ) ( not ( = ?auto_746933 ?auto_746948 ) ) ( not ( = ?auto_746933 ?auto_746949 ) ) ( not ( = ?auto_746933 ?auto_746950 ) ) ( not ( = ?auto_746934 ?auto_746935 ) ) ( not ( = ?auto_746934 ?auto_746936 ) ) ( not ( = ?auto_746934 ?auto_746937 ) ) ( not ( = ?auto_746934 ?auto_746938 ) ) ( not ( = ?auto_746934 ?auto_746939 ) ) ( not ( = ?auto_746934 ?auto_746940 ) ) ( not ( = ?auto_746934 ?auto_746941 ) ) ( not ( = ?auto_746934 ?auto_746942 ) ) ( not ( = ?auto_746934 ?auto_746943 ) ) ( not ( = ?auto_746934 ?auto_746944 ) ) ( not ( = ?auto_746934 ?auto_746945 ) ) ( not ( = ?auto_746934 ?auto_746946 ) ) ( not ( = ?auto_746934 ?auto_746947 ) ) ( not ( = ?auto_746934 ?auto_746948 ) ) ( not ( = ?auto_746934 ?auto_746949 ) ) ( not ( = ?auto_746934 ?auto_746950 ) ) ( not ( = ?auto_746935 ?auto_746936 ) ) ( not ( = ?auto_746935 ?auto_746937 ) ) ( not ( = ?auto_746935 ?auto_746938 ) ) ( not ( = ?auto_746935 ?auto_746939 ) ) ( not ( = ?auto_746935 ?auto_746940 ) ) ( not ( = ?auto_746935 ?auto_746941 ) ) ( not ( = ?auto_746935 ?auto_746942 ) ) ( not ( = ?auto_746935 ?auto_746943 ) ) ( not ( = ?auto_746935 ?auto_746944 ) ) ( not ( = ?auto_746935 ?auto_746945 ) ) ( not ( = ?auto_746935 ?auto_746946 ) ) ( not ( = ?auto_746935 ?auto_746947 ) ) ( not ( = ?auto_746935 ?auto_746948 ) ) ( not ( = ?auto_746935 ?auto_746949 ) ) ( not ( = ?auto_746935 ?auto_746950 ) ) ( not ( = ?auto_746936 ?auto_746937 ) ) ( not ( = ?auto_746936 ?auto_746938 ) ) ( not ( = ?auto_746936 ?auto_746939 ) ) ( not ( = ?auto_746936 ?auto_746940 ) ) ( not ( = ?auto_746936 ?auto_746941 ) ) ( not ( = ?auto_746936 ?auto_746942 ) ) ( not ( = ?auto_746936 ?auto_746943 ) ) ( not ( = ?auto_746936 ?auto_746944 ) ) ( not ( = ?auto_746936 ?auto_746945 ) ) ( not ( = ?auto_746936 ?auto_746946 ) ) ( not ( = ?auto_746936 ?auto_746947 ) ) ( not ( = ?auto_746936 ?auto_746948 ) ) ( not ( = ?auto_746936 ?auto_746949 ) ) ( not ( = ?auto_746936 ?auto_746950 ) ) ( not ( = ?auto_746937 ?auto_746938 ) ) ( not ( = ?auto_746937 ?auto_746939 ) ) ( not ( = ?auto_746937 ?auto_746940 ) ) ( not ( = ?auto_746937 ?auto_746941 ) ) ( not ( = ?auto_746937 ?auto_746942 ) ) ( not ( = ?auto_746937 ?auto_746943 ) ) ( not ( = ?auto_746937 ?auto_746944 ) ) ( not ( = ?auto_746937 ?auto_746945 ) ) ( not ( = ?auto_746937 ?auto_746946 ) ) ( not ( = ?auto_746937 ?auto_746947 ) ) ( not ( = ?auto_746937 ?auto_746948 ) ) ( not ( = ?auto_746937 ?auto_746949 ) ) ( not ( = ?auto_746937 ?auto_746950 ) ) ( not ( = ?auto_746938 ?auto_746939 ) ) ( not ( = ?auto_746938 ?auto_746940 ) ) ( not ( = ?auto_746938 ?auto_746941 ) ) ( not ( = ?auto_746938 ?auto_746942 ) ) ( not ( = ?auto_746938 ?auto_746943 ) ) ( not ( = ?auto_746938 ?auto_746944 ) ) ( not ( = ?auto_746938 ?auto_746945 ) ) ( not ( = ?auto_746938 ?auto_746946 ) ) ( not ( = ?auto_746938 ?auto_746947 ) ) ( not ( = ?auto_746938 ?auto_746948 ) ) ( not ( = ?auto_746938 ?auto_746949 ) ) ( not ( = ?auto_746938 ?auto_746950 ) ) ( not ( = ?auto_746939 ?auto_746940 ) ) ( not ( = ?auto_746939 ?auto_746941 ) ) ( not ( = ?auto_746939 ?auto_746942 ) ) ( not ( = ?auto_746939 ?auto_746943 ) ) ( not ( = ?auto_746939 ?auto_746944 ) ) ( not ( = ?auto_746939 ?auto_746945 ) ) ( not ( = ?auto_746939 ?auto_746946 ) ) ( not ( = ?auto_746939 ?auto_746947 ) ) ( not ( = ?auto_746939 ?auto_746948 ) ) ( not ( = ?auto_746939 ?auto_746949 ) ) ( not ( = ?auto_746939 ?auto_746950 ) ) ( not ( = ?auto_746940 ?auto_746941 ) ) ( not ( = ?auto_746940 ?auto_746942 ) ) ( not ( = ?auto_746940 ?auto_746943 ) ) ( not ( = ?auto_746940 ?auto_746944 ) ) ( not ( = ?auto_746940 ?auto_746945 ) ) ( not ( = ?auto_746940 ?auto_746946 ) ) ( not ( = ?auto_746940 ?auto_746947 ) ) ( not ( = ?auto_746940 ?auto_746948 ) ) ( not ( = ?auto_746940 ?auto_746949 ) ) ( not ( = ?auto_746940 ?auto_746950 ) ) ( not ( = ?auto_746941 ?auto_746942 ) ) ( not ( = ?auto_746941 ?auto_746943 ) ) ( not ( = ?auto_746941 ?auto_746944 ) ) ( not ( = ?auto_746941 ?auto_746945 ) ) ( not ( = ?auto_746941 ?auto_746946 ) ) ( not ( = ?auto_746941 ?auto_746947 ) ) ( not ( = ?auto_746941 ?auto_746948 ) ) ( not ( = ?auto_746941 ?auto_746949 ) ) ( not ( = ?auto_746941 ?auto_746950 ) ) ( not ( = ?auto_746942 ?auto_746943 ) ) ( not ( = ?auto_746942 ?auto_746944 ) ) ( not ( = ?auto_746942 ?auto_746945 ) ) ( not ( = ?auto_746942 ?auto_746946 ) ) ( not ( = ?auto_746942 ?auto_746947 ) ) ( not ( = ?auto_746942 ?auto_746948 ) ) ( not ( = ?auto_746942 ?auto_746949 ) ) ( not ( = ?auto_746942 ?auto_746950 ) ) ( not ( = ?auto_746943 ?auto_746944 ) ) ( not ( = ?auto_746943 ?auto_746945 ) ) ( not ( = ?auto_746943 ?auto_746946 ) ) ( not ( = ?auto_746943 ?auto_746947 ) ) ( not ( = ?auto_746943 ?auto_746948 ) ) ( not ( = ?auto_746943 ?auto_746949 ) ) ( not ( = ?auto_746943 ?auto_746950 ) ) ( not ( = ?auto_746944 ?auto_746945 ) ) ( not ( = ?auto_746944 ?auto_746946 ) ) ( not ( = ?auto_746944 ?auto_746947 ) ) ( not ( = ?auto_746944 ?auto_746948 ) ) ( not ( = ?auto_746944 ?auto_746949 ) ) ( not ( = ?auto_746944 ?auto_746950 ) ) ( not ( = ?auto_746945 ?auto_746946 ) ) ( not ( = ?auto_746945 ?auto_746947 ) ) ( not ( = ?auto_746945 ?auto_746948 ) ) ( not ( = ?auto_746945 ?auto_746949 ) ) ( not ( = ?auto_746945 ?auto_746950 ) ) ( not ( = ?auto_746946 ?auto_746947 ) ) ( not ( = ?auto_746946 ?auto_746948 ) ) ( not ( = ?auto_746946 ?auto_746949 ) ) ( not ( = ?auto_746946 ?auto_746950 ) ) ( not ( = ?auto_746947 ?auto_746948 ) ) ( not ( = ?auto_746947 ?auto_746949 ) ) ( not ( = ?auto_746947 ?auto_746950 ) ) ( not ( = ?auto_746948 ?auto_746949 ) ) ( not ( = ?auto_746948 ?auto_746950 ) ) ( not ( = ?auto_746949 ?auto_746950 ) ) ( ON ?auto_746948 ?auto_746949 ) ( ON ?auto_746947 ?auto_746948 ) ( ON ?auto_746946 ?auto_746947 ) ( ON ?auto_746945 ?auto_746946 ) ( ON ?auto_746944 ?auto_746945 ) ( ON ?auto_746943 ?auto_746944 ) ( ON ?auto_746942 ?auto_746943 ) ( ON ?auto_746941 ?auto_746942 ) ( ON ?auto_746940 ?auto_746941 ) ( ON ?auto_746939 ?auto_746940 ) ( ON ?auto_746938 ?auto_746939 ) ( ON ?auto_746937 ?auto_746938 ) ( ON ?auto_746936 ?auto_746937 ) ( CLEAR ?auto_746934 ) ( ON ?auto_746935 ?auto_746936 ) ( CLEAR ?auto_746935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_746933 ?auto_746934 ?auto_746935 )
      ( MAKE-17PILE ?auto_746933 ?auto_746934 ?auto_746935 ?auto_746936 ?auto_746937 ?auto_746938 ?auto_746939 ?auto_746940 ?auto_746941 ?auto_746942 ?auto_746943 ?auto_746944 ?auto_746945 ?auto_746946 ?auto_746947 ?auto_746948 ?auto_746949 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_747003 - BLOCK
      ?auto_747004 - BLOCK
      ?auto_747005 - BLOCK
      ?auto_747006 - BLOCK
      ?auto_747007 - BLOCK
      ?auto_747008 - BLOCK
      ?auto_747009 - BLOCK
      ?auto_747010 - BLOCK
      ?auto_747011 - BLOCK
      ?auto_747012 - BLOCK
      ?auto_747013 - BLOCK
      ?auto_747014 - BLOCK
      ?auto_747015 - BLOCK
      ?auto_747016 - BLOCK
      ?auto_747017 - BLOCK
      ?auto_747018 - BLOCK
      ?auto_747019 - BLOCK
    )
    :vars
    (
      ?auto_747020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747019 ?auto_747020 ) ( ON-TABLE ?auto_747003 ) ( not ( = ?auto_747003 ?auto_747004 ) ) ( not ( = ?auto_747003 ?auto_747005 ) ) ( not ( = ?auto_747003 ?auto_747006 ) ) ( not ( = ?auto_747003 ?auto_747007 ) ) ( not ( = ?auto_747003 ?auto_747008 ) ) ( not ( = ?auto_747003 ?auto_747009 ) ) ( not ( = ?auto_747003 ?auto_747010 ) ) ( not ( = ?auto_747003 ?auto_747011 ) ) ( not ( = ?auto_747003 ?auto_747012 ) ) ( not ( = ?auto_747003 ?auto_747013 ) ) ( not ( = ?auto_747003 ?auto_747014 ) ) ( not ( = ?auto_747003 ?auto_747015 ) ) ( not ( = ?auto_747003 ?auto_747016 ) ) ( not ( = ?auto_747003 ?auto_747017 ) ) ( not ( = ?auto_747003 ?auto_747018 ) ) ( not ( = ?auto_747003 ?auto_747019 ) ) ( not ( = ?auto_747003 ?auto_747020 ) ) ( not ( = ?auto_747004 ?auto_747005 ) ) ( not ( = ?auto_747004 ?auto_747006 ) ) ( not ( = ?auto_747004 ?auto_747007 ) ) ( not ( = ?auto_747004 ?auto_747008 ) ) ( not ( = ?auto_747004 ?auto_747009 ) ) ( not ( = ?auto_747004 ?auto_747010 ) ) ( not ( = ?auto_747004 ?auto_747011 ) ) ( not ( = ?auto_747004 ?auto_747012 ) ) ( not ( = ?auto_747004 ?auto_747013 ) ) ( not ( = ?auto_747004 ?auto_747014 ) ) ( not ( = ?auto_747004 ?auto_747015 ) ) ( not ( = ?auto_747004 ?auto_747016 ) ) ( not ( = ?auto_747004 ?auto_747017 ) ) ( not ( = ?auto_747004 ?auto_747018 ) ) ( not ( = ?auto_747004 ?auto_747019 ) ) ( not ( = ?auto_747004 ?auto_747020 ) ) ( not ( = ?auto_747005 ?auto_747006 ) ) ( not ( = ?auto_747005 ?auto_747007 ) ) ( not ( = ?auto_747005 ?auto_747008 ) ) ( not ( = ?auto_747005 ?auto_747009 ) ) ( not ( = ?auto_747005 ?auto_747010 ) ) ( not ( = ?auto_747005 ?auto_747011 ) ) ( not ( = ?auto_747005 ?auto_747012 ) ) ( not ( = ?auto_747005 ?auto_747013 ) ) ( not ( = ?auto_747005 ?auto_747014 ) ) ( not ( = ?auto_747005 ?auto_747015 ) ) ( not ( = ?auto_747005 ?auto_747016 ) ) ( not ( = ?auto_747005 ?auto_747017 ) ) ( not ( = ?auto_747005 ?auto_747018 ) ) ( not ( = ?auto_747005 ?auto_747019 ) ) ( not ( = ?auto_747005 ?auto_747020 ) ) ( not ( = ?auto_747006 ?auto_747007 ) ) ( not ( = ?auto_747006 ?auto_747008 ) ) ( not ( = ?auto_747006 ?auto_747009 ) ) ( not ( = ?auto_747006 ?auto_747010 ) ) ( not ( = ?auto_747006 ?auto_747011 ) ) ( not ( = ?auto_747006 ?auto_747012 ) ) ( not ( = ?auto_747006 ?auto_747013 ) ) ( not ( = ?auto_747006 ?auto_747014 ) ) ( not ( = ?auto_747006 ?auto_747015 ) ) ( not ( = ?auto_747006 ?auto_747016 ) ) ( not ( = ?auto_747006 ?auto_747017 ) ) ( not ( = ?auto_747006 ?auto_747018 ) ) ( not ( = ?auto_747006 ?auto_747019 ) ) ( not ( = ?auto_747006 ?auto_747020 ) ) ( not ( = ?auto_747007 ?auto_747008 ) ) ( not ( = ?auto_747007 ?auto_747009 ) ) ( not ( = ?auto_747007 ?auto_747010 ) ) ( not ( = ?auto_747007 ?auto_747011 ) ) ( not ( = ?auto_747007 ?auto_747012 ) ) ( not ( = ?auto_747007 ?auto_747013 ) ) ( not ( = ?auto_747007 ?auto_747014 ) ) ( not ( = ?auto_747007 ?auto_747015 ) ) ( not ( = ?auto_747007 ?auto_747016 ) ) ( not ( = ?auto_747007 ?auto_747017 ) ) ( not ( = ?auto_747007 ?auto_747018 ) ) ( not ( = ?auto_747007 ?auto_747019 ) ) ( not ( = ?auto_747007 ?auto_747020 ) ) ( not ( = ?auto_747008 ?auto_747009 ) ) ( not ( = ?auto_747008 ?auto_747010 ) ) ( not ( = ?auto_747008 ?auto_747011 ) ) ( not ( = ?auto_747008 ?auto_747012 ) ) ( not ( = ?auto_747008 ?auto_747013 ) ) ( not ( = ?auto_747008 ?auto_747014 ) ) ( not ( = ?auto_747008 ?auto_747015 ) ) ( not ( = ?auto_747008 ?auto_747016 ) ) ( not ( = ?auto_747008 ?auto_747017 ) ) ( not ( = ?auto_747008 ?auto_747018 ) ) ( not ( = ?auto_747008 ?auto_747019 ) ) ( not ( = ?auto_747008 ?auto_747020 ) ) ( not ( = ?auto_747009 ?auto_747010 ) ) ( not ( = ?auto_747009 ?auto_747011 ) ) ( not ( = ?auto_747009 ?auto_747012 ) ) ( not ( = ?auto_747009 ?auto_747013 ) ) ( not ( = ?auto_747009 ?auto_747014 ) ) ( not ( = ?auto_747009 ?auto_747015 ) ) ( not ( = ?auto_747009 ?auto_747016 ) ) ( not ( = ?auto_747009 ?auto_747017 ) ) ( not ( = ?auto_747009 ?auto_747018 ) ) ( not ( = ?auto_747009 ?auto_747019 ) ) ( not ( = ?auto_747009 ?auto_747020 ) ) ( not ( = ?auto_747010 ?auto_747011 ) ) ( not ( = ?auto_747010 ?auto_747012 ) ) ( not ( = ?auto_747010 ?auto_747013 ) ) ( not ( = ?auto_747010 ?auto_747014 ) ) ( not ( = ?auto_747010 ?auto_747015 ) ) ( not ( = ?auto_747010 ?auto_747016 ) ) ( not ( = ?auto_747010 ?auto_747017 ) ) ( not ( = ?auto_747010 ?auto_747018 ) ) ( not ( = ?auto_747010 ?auto_747019 ) ) ( not ( = ?auto_747010 ?auto_747020 ) ) ( not ( = ?auto_747011 ?auto_747012 ) ) ( not ( = ?auto_747011 ?auto_747013 ) ) ( not ( = ?auto_747011 ?auto_747014 ) ) ( not ( = ?auto_747011 ?auto_747015 ) ) ( not ( = ?auto_747011 ?auto_747016 ) ) ( not ( = ?auto_747011 ?auto_747017 ) ) ( not ( = ?auto_747011 ?auto_747018 ) ) ( not ( = ?auto_747011 ?auto_747019 ) ) ( not ( = ?auto_747011 ?auto_747020 ) ) ( not ( = ?auto_747012 ?auto_747013 ) ) ( not ( = ?auto_747012 ?auto_747014 ) ) ( not ( = ?auto_747012 ?auto_747015 ) ) ( not ( = ?auto_747012 ?auto_747016 ) ) ( not ( = ?auto_747012 ?auto_747017 ) ) ( not ( = ?auto_747012 ?auto_747018 ) ) ( not ( = ?auto_747012 ?auto_747019 ) ) ( not ( = ?auto_747012 ?auto_747020 ) ) ( not ( = ?auto_747013 ?auto_747014 ) ) ( not ( = ?auto_747013 ?auto_747015 ) ) ( not ( = ?auto_747013 ?auto_747016 ) ) ( not ( = ?auto_747013 ?auto_747017 ) ) ( not ( = ?auto_747013 ?auto_747018 ) ) ( not ( = ?auto_747013 ?auto_747019 ) ) ( not ( = ?auto_747013 ?auto_747020 ) ) ( not ( = ?auto_747014 ?auto_747015 ) ) ( not ( = ?auto_747014 ?auto_747016 ) ) ( not ( = ?auto_747014 ?auto_747017 ) ) ( not ( = ?auto_747014 ?auto_747018 ) ) ( not ( = ?auto_747014 ?auto_747019 ) ) ( not ( = ?auto_747014 ?auto_747020 ) ) ( not ( = ?auto_747015 ?auto_747016 ) ) ( not ( = ?auto_747015 ?auto_747017 ) ) ( not ( = ?auto_747015 ?auto_747018 ) ) ( not ( = ?auto_747015 ?auto_747019 ) ) ( not ( = ?auto_747015 ?auto_747020 ) ) ( not ( = ?auto_747016 ?auto_747017 ) ) ( not ( = ?auto_747016 ?auto_747018 ) ) ( not ( = ?auto_747016 ?auto_747019 ) ) ( not ( = ?auto_747016 ?auto_747020 ) ) ( not ( = ?auto_747017 ?auto_747018 ) ) ( not ( = ?auto_747017 ?auto_747019 ) ) ( not ( = ?auto_747017 ?auto_747020 ) ) ( not ( = ?auto_747018 ?auto_747019 ) ) ( not ( = ?auto_747018 ?auto_747020 ) ) ( not ( = ?auto_747019 ?auto_747020 ) ) ( ON ?auto_747018 ?auto_747019 ) ( ON ?auto_747017 ?auto_747018 ) ( ON ?auto_747016 ?auto_747017 ) ( ON ?auto_747015 ?auto_747016 ) ( ON ?auto_747014 ?auto_747015 ) ( ON ?auto_747013 ?auto_747014 ) ( ON ?auto_747012 ?auto_747013 ) ( ON ?auto_747011 ?auto_747012 ) ( ON ?auto_747010 ?auto_747011 ) ( ON ?auto_747009 ?auto_747010 ) ( ON ?auto_747008 ?auto_747009 ) ( ON ?auto_747007 ?auto_747008 ) ( ON ?auto_747006 ?auto_747007 ) ( ON ?auto_747005 ?auto_747006 ) ( CLEAR ?auto_747003 ) ( ON ?auto_747004 ?auto_747005 ) ( CLEAR ?auto_747004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_747003 ?auto_747004 )
      ( MAKE-17PILE ?auto_747003 ?auto_747004 ?auto_747005 ?auto_747006 ?auto_747007 ?auto_747008 ?auto_747009 ?auto_747010 ?auto_747011 ?auto_747012 ?auto_747013 ?auto_747014 ?auto_747015 ?auto_747016 ?auto_747017 ?auto_747018 ?auto_747019 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_747073 - BLOCK
      ?auto_747074 - BLOCK
      ?auto_747075 - BLOCK
      ?auto_747076 - BLOCK
      ?auto_747077 - BLOCK
      ?auto_747078 - BLOCK
      ?auto_747079 - BLOCK
      ?auto_747080 - BLOCK
      ?auto_747081 - BLOCK
      ?auto_747082 - BLOCK
      ?auto_747083 - BLOCK
      ?auto_747084 - BLOCK
      ?auto_747085 - BLOCK
      ?auto_747086 - BLOCK
      ?auto_747087 - BLOCK
      ?auto_747088 - BLOCK
      ?auto_747089 - BLOCK
    )
    :vars
    (
      ?auto_747090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747089 ?auto_747090 ) ( not ( = ?auto_747073 ?auto_747074 ) ) ( not ( = ?auto_747073 ?auto_747075 ) ) ( not ( = ?auto_747073 ?auto_747076 ) ) ( not ( = ?auto_747073 ?auto_747077 ) ) ( not ( = ?auto_747073 ?auto_747078 ) ) ( not ( = ?auto_747073 ?auto_747079 ) ) ( not ( = ?auto_747073 ?auto_747080 ) ) ( not ( = ?auto_747073 ?auto_747081 ) ) ( not ( = ?auto_747073 ?auto_747082 ) ) ( not ( = ?auto_747073 ?auto_747083 ) ) ( not ( = ?auto_747073 ?auto_747084 ) ) ( not ( = ?auto_747073 ?auto_747085 ) ) ( not ( = ?auto_747073 ?auto_747086 ) ) ( not ( = ?auto_747073 ?auto_747087 ) ) ( not ( = ?auto_747073 ?auto_747088 ) ) ( not ( = ?auto_747073 ?auto_747089 ) ) ( not ( = ?auto_747073 ?auto_747090 ) ) ( not ( = ?auto_747074 ?auto_747075 ) ) ( not ( = ?auto_747074 ?auto_747076 ) ) ( not ( = ?auto_747074 ?auto_747077 ) ) ( not ( = ?auto_747074 ?auto_747078 ) ) ( not ( = ?auto_747074 ?auto_747079 ) ) ( not ( = ?auto_747074 ?auto_747080 ) ) ( not ( = ?auto_747074 ?auto_747081 ) ) ( not ( = ?auto_747074 ?auto_747082 ) ) ( not ( = ?auto_747074 ?auto_747083 ) ) ( not ( = ?auto_747074 ?auto_747084 ) ) ( not ( = ?auto_747074 ?auto_747085 ) ) ( not ( = ?auto_747074 ?auto_747086 ) ) ( not ( = ?auto_747074 ?auto_747087 ) ) ( not ( = ?auto_747074 ?auto_747088 ) ) ( not ( = ?auto_747074 ?auto_747089 ) ) ( not ( = ?auto_747074 ?auto_747090 ) ) ( not ( = ?auto_747075 ?auto_747076 ) ) ( not ( = ?auto_747075 ?auto_747077 ) ) ( not ( = ?auto_747075 ?auto_747078 ) ) ( not ( = ?auto_747075 ?auto_747079 ) ) ( not ( = ?auto_747075 ?auto_747080 ) ) ( not ( = ?auto_747075 ?auto_747081 ) ) ( not ( = ?auto_747075 ?auto_747082 ) ) ( not ( = ?auto_747075 ?auto_747083 ) ) ( not ( = ?auto_747075 ?auto_747084 ) ) ( not ( = ?auto_747075 ?auto_747085 ) ) ( not ( = ?auto_747075 ?auto_747086 ) ) ( not ( = ?auto_747075 ?auto_747087 ) ) ( not ( = ?auto_747075 ?auto_747088 ) ) ( not ( = ?auto_747075 ?auto_747089 ) ) ( not ( = ?auto_747075 ?auto_747090 ) ) ( not ( = ?auto_747076 ?auto_747077 ) ) ( not ( = ?auto_747076 ?auto_747078 ) ) ( not ( = ?auto_747076 ?auto_747079 ) ) ( not ( = ?auto_747076 ?auto_747080 ) ) ( not ( = ?auto_747076 ?auto_747081 ) ) ( not ( = ?auto_747076 ?auto_747082 ) ) ( not ( = ?auto_747076 ?auto_747083 ) ) ( not ( = ?auto_747076 ?auto_747084 ) ) ( not ( = ?auto_747076 ?auto_747085 ) ) ( not ( = ?auto_747076 ?auto_747086 ) ) ( not ( = ?auto_747076 ?auto_747087 ) ) ( not ( = ?auto_747076 ?auto_747088 ) ) ( not ( = ?auto_747076 ?auto_747089 ) ) ( not ( = ?auto_747076 ?auto_747090 ) ) ( not ( = ?auto_747077 ?auto_747078 ) ) ( not ( = ?auto_747077 ?auto_747079 ) ) ( not ( = ?auto_747077 ?auto_747080 ) ) ( not ( = ?auto_747077 ?auto_747081 ) ) ( not ( = ?auto_747077 ?auto_747082 ) ) ( not ( = ?auto_747077 ?auto_747083 ) ) ( not ( = ?auto_747077 ?auto_747084 ) ) ( not ( = ?auto_747077 ?auto_747085 ) ) ( not ( = ?auto_747077 ?auto_747086 ) ) ( not ( = ?auto_747077 ?auto_747087 ) ) ( not ( = ?auto_747077 ?auto_747088 ) ) ( not ( = ?auto_747077 ?auto_747089 ) ) ( not ( = ?auto_747077 ?auto_747090 ) ) ( not ( = ?auto_747078 ?auto_747079 ) ) ( not ( = ?auto_747078 ?auto_747080 ) ) ( not ( = ?auto_747078 ?auto_747081 ) ) ( not ( = ?auto_747078 ?auto_747082 ) ) ( not ( = ?auto_747078 ?auto_747083 ) ) ( not ( = ?auto_747078 ?auto_747084 ) ) ( not ( = ?auto_747078 ?auto_747085 ) ) ( not ( = ?auto_747078 ?auto_747086 ) ) ( not ( = ?auto_747078 ?auto_747087 ) ) ( not ( = ?auto_747078 ?auto_747088 ) ) ( not ( = ?auto_747078 ?auto_747089 ) ) ( not ( = ?auto_747078 ?auto_747090 ) ) ( not ( = ?auto_747079 ?auto_747080 ) ) ( not ( = ?auto_747079 ?auto_747081 ) ) ( not ( = ?auto_747079 ?auto_747082 ) ) ( not ( = ?auto_747079 ?auto_747083 ) ) ( not ( = ?auto_747079 ?auto_747084 ) ) ( not ( = ?auto_747079 ?auto_747085 ) ) ( not ( = ?auto_747079 ?auto_747086 ) ) ( not ( = ?auto_747079 ?auto_747087 ) ) ( not ( = ?auto_747079 ?auto_747088 ) ) ( not ( = ?auto_747079 ?auto_747089 ) ) ( not ( = ?auto_747079 ?auto_747090 ) ) ( not ( = ?auto_747080 ?auto_747081 ) ) ( not ( = ?auto_747080 ?auto_747082 ) ) ( not ( = ?auto_747080 ?auto_747083 ) ) ( not ( = ?auto_747080 ?auto_747084 ) ) ( not ( = ?auto_747080 ?auto_747085 ) ) ( not ( = ?auto_747080 ?auto_747086 ) ) ( not ( = ?auto_747080 ?auto_747087 ) ) ( not ( = ?auto_747080 ?auto_747088 ) ) ( not ( = ?auto_747080 ?auto_747089 ) ) ( not ( = ?auto_747080 ?auto_747090 ) ) ( not ( = ?auto_747081 ?auto_747082 ) ) ( not ( = ?auto_747081 ?auto_747083 ) ) ( not ( = ?auto_747081 ?auto_747084 ) ) ( not ( = ?auto_747081 ?auto_747085 ) ) ( not ( = ?auto_747081 ?auto_747086 ) ) ( not ( = ?auto_747081 ?auto_747087 ) ) ( not ( = ?auto_747081 ?auto_747088 ) ) ( not ( = ?auto_747081 ?auto_747089 ) ) ( not ( = ?auto_747081 ?auto_747090 ) ) ( not ( = ?auto_747082 ?auto_747083 ) ) ( not ( = ?auto_747082 ?auto_747084 ) ) ( not ( = ?auto_747082 ?auto_747085 ) ) ( not ( = ?auto_747082 ?auto_747086 ) ) ( not ( = ?auto_747082 ?auto_747087 ) ) ( not ( = ?auto_747082 ?auto_747088 ) ) ( not ( = ?auto_747082 ?auto_747089 ) ) ( not ( = ?auto_747082 ?auto_747090 ) ) ( not ( = ?auto_747083 ?auto_747084 ) ) ( not ( = ?auto_747083 ?auto_747085 ) ) ( not ( = ?auto_747083 ?auto_747086 ) ) ( not ( = ?auto_747083 ?auto_747087 ) ) ( not ( = ?auto_747083 ?auto_747088 ) ) ( not ( = ?auto_747083 ?auto_747089 ) ) ( not ( = ?auto_747083 ?auto_747090 ) ) ( not ( = ?auto_747084 ?auto_747085 ) ) ( not ( = ?auto_747084 ?auto_747086 ) ) ( not ( = ?auto_747084 ?auto_747087 ) ) ( not ( = ?auto_747084 ?auto_747088 ) ) ( not ( = ?auto_747084 ?auto_747089 ) ) ( not ( = ?auto_747084 ?auto_747090 ) ) ( not ( = ?auto_747085 ?auto_747086 ) ) ( not ( = ?auto_747085 ?auto_747087 ) ) ( not ( = ?auto_747085 ?auto_747088 ) ) ( not ( = ?auto_747085 ?auto_747089 ) ) ( not ( = ?auto_747085 ?auto_747090 ) ) ( not ( = ?auto_747086 ?auto_747087 ) ) ( not ( = ?auto_747086 ?auto_747088 ) ) ( not ( = ?auto_747086 ?auto_747089 ) ) ( not ( = ?auto_747086 ?auto_747090 ) ) ( not ( = ?auto_747087 ?auto_747088 ) ) ( not ( = ?auto_747087 ?auto_747089 ) ) ( not ( = ?auto_747087 ?auto_747090 ) ) ( not ( = ?auto_747088 ?auto_747089 ) ) ( not ( = ?auto_747088 ?auto_747090 ) ) ( not ( = ?auto_747089 ?auto_747090 ) ) ( ON ?auto_747088 ?auto_747089 ) ( ON ?auto_747087 ?auto_747088 ) ( ON ?auto_747086 ?auto_747087 ) ( ON ?auto_747085 ?auto_747086 ) ( ON ?auto_747084 ?auto_747085 ) ( ON ?auto_747083 ?auto_747084 ) ( ON ?auto_747082 ?auto_747083 ) ( ON ?auto_747081 ?auto_747082 ) ( ON ?auto_747080 ?auto_747081 ) ( ON ?auto_747079 ?auto_747080 ) ( ON ?auto_747078 ?auto_747079 ) ( ON ?auto_747077 ?auto_747078 ) ( ON ?auto_747076 ?auto_747077 ) ( ON ?auto_747075 ?auto_747076 ) ( ON ?auto_747074 ?auto_747075 ) ( ON ?auto_747073 ?auto_747074 ) ( CLEAR ?auto_747073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_747073 )
      ( MAKE-17PILE ?auto_747073 ?auto_747074 ?auto_747075 ?auto_747076 ?auto_747077 ?auto_747078 ?auto_747079 ?auto_747080 ?auto_747081 ?auto_747082 ?auto_747083 ?auto_747084 ?auto_747085 ?auto_747086 ?auto_747087 ?auto_747088 ?auto_747089 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747144 - BLOCK
      ?auto_747145 - BLOCK
      ?auto_747146 - BLOCK
      ?auto_747147 - BLOCK
      ?auto_747148 - BLOCK
      ?auto_747149 - BLOCK
      ?auto_747150 - BLOCK
      ?auto_747151 - BLOCK
      ?auto_747152 - BLOCK
      ?auto_747153 - BLOCK
      ?auto_747154 - BLOCK
      ?auto_747155 - BLOCK
      ?auto_747156 - BLOCK
      ?auto_747157 - BLOCK
      ?auto_747158 - BLOCK
      ?auto_747159 - BLOCK
      ?auto_747160 - BLOCK
      ?auto_747161 - BLOCK
    )
    :vars
    (
      ?auto_747162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_747160 ) ( ON ?auto_747161 ?auto_747162 ) ( CLEAR ?auto_747161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_747144 ) ( ON ?auto_747145 ?auto_747144 ) ( ON ?auto_747146 ?auto_747145 ) ( ON ?auto_747147 ?auto_747146 ) ( ON ?auto_747148 ?auto_747147 ) ( ON ?auto_747149 ?auto_747148 ) ( ON ?auto_747150 ?auto_747149 ) ( ON ?auto_747151 ?auto_747150 ) ( ON ?auto_747152 ?auto_747151 ) ( ON ?auto_747153 ?auto_747152 ) ( ON ?auto_747154 ?auto_747153 ) ( ON ?auto_747155 ?auto_747154 ) ( ON ?auto_747156 ?auto_747155 ) ( ON ?auto_747157 ?auto_747156 ) ( ON ?auto_747158 ?auto_747157 ) ( ON ?auto_747159 ?auto_747158 ) ( ON ?auto_747160 ?auto_747159 ) ( not ( = ?auto_747144 ?auto_747145 ) ) ( not ( = ?auto_747144 ?auto_747146 ) ) ( not ( = ?auto_747144 ?auto_747147 ) ) ( not ( = ?auto_747144 ?auto_747148 ) ) ( not ( = ?auto_747144 ?auto_747149 ) ) ( not ( = ?auto_747144 ?auto_747150 ) ) ( not ( = ?auto_747144 ?auto_747151 ) ) ( not ( = ?auto_747144 ?auto_747152 ) ) ( not ( = ?auto_747144 ?auto_747153 ) ) ( not ( = ?auto_747144 ?auto_747154 ) ) ( not ( = ?auto_747144 ?auto_747155 ) ) ( not ( = ?auto_747144 ?auto_747156 ) ) ( not ( = ?auto_747144 ?auto_747157 ) ) ( not ( = ?auto_747144 ?auto_747158 ) ) ( not ( = ?auto_747144 ?auto_747159 ) ) ( not ( = ?auto_747144 ?auto_747160 ) ) ( not ( = ?auto_747144 ?auto_747161 ) ) ( not ( = ?auto_747144 ?auto_747162 ) ) ( not ( = ?auto_747145 ?auto_747146 ) ) ( not ( = ?auto_747145 ?auto_747147 ) ) ( not ( = ?auto_747145 ?auto_747148 ) ) ( not ( = ?auto_747145 ?auto_747149 ) ) ( not ( = ?auto_747145 ?auto_747150 ) ) ( not ( = ?auto_747145 ?auto_747151 ) ) ( not ( = ?auto_747145 ?auto_747152 ) ) ( not ( = ?auto_747145 ?auto_747153 ) ) ( not ( = ?auto_747145 ?auto_747154 ) ) ( not ( = ?auto_747145 ?auto_747155 ) ) ( not ( = ?auto_747145 ?auto_747156 ) ) ( not ( = ?auto_747145 ?auto_747157 ) ) ( not ( = ?auto_747145 ?auto_747158 ) ) ( not ( = ?auto_747145 ?auto_747159 ) ) ( not ( = ?auto_747145 ?auto_747160 ) ) ( not ( = ?auto_747145 ?auto_747161 ) ) ( not ( = ?auto_747145 ?auto_747162 ) ) ( not ( = ?auto_747146 ?auto_747147 ) ) ( not ( = ?auto_747146 ?auto_747148 ) ) ( not ( = ?auto_747146 ?auto_747149 ) ) ( not ( = ?auto_747146 ?auto_747150 ) ) ( not ( = ?auto_747146 ?auto_747151 ) ) ( not ( = ?auto_747146 ?auto_747152 ) ) ( not ( = ?auto_747146 ?auto_747153 ) ) ( not ( = ?auto_747146 ?auto_747154 ) ) ( not ( = ?auto_747146 ?auto_747155 ) ) ( not ( = ?auto_747146 ?auto_747156 ) ) ( not ( = ?auto_747146 ?auto_747157 ) ) ( not ( = ?auto_747146 ?auto_747158 ) ) ( not ( = ?auto_747146 ?auto_747159 ) ) ( not ( = ?auto_747146 ?auto_747160 ) ) ( not ( = ?auto_747146 ?auto_747161 ) ) ( not ( = ?auto_747146 ?auto_747162 ) ) ( not ( = ?auto_747147 ?auto_747148 ) ) ( not ( = ?auto_747147 ?auto_747149 ) ) ( not ( = ?auto_747147 ?auto_747150 ) ) ( not ( = ?auto_747147 ?auto_747151 ) ) ( not ( = ?auto_747147 ?auto_747152 ) ) ( not ( = ?auto_747147 ?auto_747153 ) ) ( not ( = ?auto_747147 ?auto_747154 ) ) ( not ( = ?auto_747147 ?auto_747155 ) ) ( not ( = ?auto_747147 ?auto_747156 ) ) ( not ( = ?auto_747147 ?auto_747157 ) ) ( not ( = ?auto_747147 ?auto_747158 ) ) ( not ( = ?auto_747147 ?auto_747159 ) ) ( not ( = ?auto_747147 ?auto_747160 ) ) ( not ( = ?auto_747147 ?auto_747161 ) ) ( not ( = ?auto_747147 ?auto_747162 ) ) ( not ( = ?auto_747148 ?auto_747149 ) ) ( not ( = ?auto_747148 ?auto_747150 ) ) ( not ( = ?auto_747148 ?auto_747151 ) ) ( not ( = ?auto_747148 ?auto_747152 ) ) ( not ( = ?auto_747148 ?auto_747153 ) ) ( not ( = ?auto_747148 ?auto_747154 ) ) ( not ( = ?auto_747148 ?auto_747155 ) ) ( not ( = ?auto_747148 ?auto_747156 ) ) ( not ( = ?auto_747148 ?auto_747157 ) ) ( not ( = ?auto_747148 ?auto_747158 ) ) ( not ( = ?auto_747148 ?auto_747159 ) ) ( not ( = ?auto_747148 ?auto_747160 ) ) ( not ( = ?auto_747148 ?auto_747161 ) ) ( not ( = ?auto_747148 ?auto_747162 ) ) ( not ( = ?auto_747149 ?auto_747150 ) ) ( not ( = ?auto_747149 ?auto_747151 ) ) ( not ( = ?auto_747149 ?auto_747152 ) ) ( not ( = ?auto_747149 ?auto_747153 ) ) ( not ( = ?auto_747149 ?auto_747154 ) ) ( not ( = ?auto_747149 ?auto_747155 ) ) ( not ( = ?auto_747149 ?auto_747156 ) ) ( not ( = ?auto_747149 ?auto_747157 ) ) ( not ( = ?auto_747149 ?auto_747158 ) ) ( not ( = ?auto_747149 ?auto_747159 ) ) ( not ( = ?auto_747149 ?auto_747160 ) ) ( not ( = ?auto_747149 ?auto_747161 ) ) ( not ( = ?auto_747149 ?auto_747162 ) ) ( not ( = ?auto_747150 ?auto_747151 ) ) ( not ( = ?auto_747150 ?auto_747152 ) ) ( not ( = ?auto_747150 ?auto_747153 ) ) ( not ( = ?auto_747150 ?auto_747154 ) ) ( not ( = ?auto_747150 ?auto_747155 ) ) ( not ( = ?auto_747150 ?auto_747156 ) ) ( not ( = ?auto_747150 ?auto_747157 ) ) ( not ( = ?auto_747150 ?auto_747158 ) ) ( not ( = ?auto_747150 ?auto_747159 ) ) ( not ( = ?auto_747150 ?auto_747160 ) ) ( not ( = ?auto_747150 ?auto_747161 ) ) ( not ( = ?auto_747150 ?auto_747162 ) ) ( not ( = ?auto_747151 ?auto_747152 ) ) ( not ( = ?auto_747151 ?auto_747153 ) ) ( not ( = ?auto_747151 ?auto_747154 ) ) ( not ( = ?auto_747151 ?auto_747155 ) ) ( not ( = ?auto_747151 ?auto_747156 ) ) ( not ( = ?auto_747151 ?auto_747157 ) ) ( not ( = ?auto_747151 ?auto_747158 ) ) ( not ( = ?auto_747151 ?auto_747159 ) ) ( not ( = ?auto_747151 ?auto_747160 ) ) ( not ( = ?auto_747151 ?auto_747161 ) ) ( not ( = ?auto_747151 ?auto_747162 ) ) ( not ( = ?auto_747152 ?auto_747153 ) ) ( not ( = ?auto_747152 ?auto_747154 ) ) ( not ( = ?auto_747152 ?auto_747155 ) ) ( not ( = ?auto_747152 ?auto_747156 ) ) ( not ( = ?auto_747152 ?auto_747157 ) ) ( not ( = ?auto_747152 ?auto_747158 ) ) ( not ( = ?auto_747152 ?auto_747159 ) ) ( not ( = ?auto_747152 ?auto_747160 ) ) ( not ( = ?auto_747152 ?auto_747161 ) ) ( not ( = ?auto_747152 ?auto_747162 ) ) ( not ( = ?auto_747153 ?auto_747154 ) ) ( not ( = ?auto_747153 ?auto_747155 ) ) ( not ( = ?auto_747153 ?auto_747156 ) ) ( not ( = ?auto_747153 ?auto_747157 ) ) ( not ( = ?auto_747153 ?auto_747158 ) ) ( not ( = ?auto_747153 ?auto_747159 ) ) ( not ( = ?auto_747153 ?auto_747160 ) ) ( not ( = ?auto_747153 ?auto_747161 ) ) ( not ( = ?auto_747153 ?auto_747162 ) ) ( not ( = ?auto_747154 ?auto_747155 ) ) ( not ( = ?auto_747154 ?auto_747156 ) ) ( not ( = ?auto_747154 ?auto_747157 ) ) ( not ( = ?auto_747154 ?auto_747158 ) ) ( not ( = ?auto_747154 ?auto_747159 ) ) ( not ( = ?auto_747154 ?auto_747160 ) ) ( not ( = ?auto_747154 ?auto_747161 ) ) ( not ( = ?auto_747154 ?auto_747162 ) ) ( not ( = ?auto_747155 ?auto_747156 ) ) ( not ( = ?auto_747155 ?auto_747157 ) ) ( not ( = ?auto_747155 ?auto_747158 ) ) ( not ( = ?auto_747155 ?auto_747159 ) ) ( not ( = ?auto_747155 ?auto_747160 ) ) ( not ( = ?auto_747155 ?auto_747161 ) ) ( not ( = ?auto_747155 ?auto_747162 ) ) ( not ( = ?auto_747156 ?auto_747157 ) ) ( not ( = ?auto_747156 ?auto_747158 ) ) ( not ( = ?auto_747156 ?auto_747159 ) ) ( not ( = ?auto_747156 ?auto_747160 ) ) ( not ( = ?auto_747156 ?auto_747161 ) ) ( not ( = ?auto_747156 ?auto_747162 ) ) ( not ( = ?auto_747157 ?auto_747158 ) ) ( not ( = ?auto_747157 ?auto_747159 ) ) ( not ( = ?auto_747157 ?auto_747160 ) ) ( not ( = ?auto_747157 ?auto_747161 ) ) ( not ( = ?auto_747157 ?auto_747162 ) ) ( not ( = ?auto_747158 ?auto_747159 ) ) ( not ( = ?auto_747158 ?auto_747160 ) ) ( not ( = ?auto_747158 ?auto_747161 ) ) ( not ( = ?auto_747158 ?auto_747162 ) ) ( not ( = ?auto_747159 ?auto_747160 ) ) ( not ( = ?auto_747159 ?auto_747161 ) ) ( not ( = ?auto_747159 ?auto_747162 ) ) ( not ( = ?auto_747160 ?auto_747161 ) ) ( not ( = ?auto_747160 ?auto_747162 ) ) ( not ( = ?auto_747161 ?auto_747162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_747161 ?auto_747162 )
      ( !STACK ?auto_747161 ?auto_747160 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747181 - BLOCK
      ?auto_747182 - BLOCK
      ?auto_747183 - BLOCK
      ?auto_747184 - BLOCK
      ?auto_747185 - BLOCK
      ?auto_747186 - BLOCK
      ?auto_747187 - BLOCK
      ?auto_747188 - BLOCK
      ?auto_747189 - BLOCK
      ?auto_747190 - BLOCK
      ?auto_747191 - BLOCK
      ?auto_747192 - BLOCK
      ?auto_747193 - BLOCK
      ?auto_747194 - BLOCK
      ?auto_747195 - BLOCK
      ?auto_747196 - BLOCK
      ?auto_747197 - BLOCK
      ?auto_747198 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_747197 ) ( ON-TABLE ?auto_747198 ) ( CLEAR ?auto_747198 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_747181 ) ( ON ?auto_747182 ?auto_747181 ) ( ON ?auto_747183 ?auto_747182 ) ( ON ?auto_747184 ?auto_747183 ) ( ON ?auto_747185 ?auto_747184 ) ( ON ?auto_747186 ?auto_747185 ) ( ON ?auto_747187 ?auto_747186 ) ( ON ?auto_747188 ?auto_747187 ) ( ON ?auto_747189 ?auto_747188 ) ( ON ?auto_747190 ?auto_747189 ) ( ON ?auto_747191 ?auto_747190 ) ( ON ?auto_747192 ?auto_747191 ) ( ON ?auto_747193 ?auto_747192 ) ( ON ?auto_747194 ?auto_747193 ) ( ON ?auto_747195 ?auto_747194 ) ( ON ?auto_747196 ?auto_747195 ) ( ON ?auto_747197 ?auto_747196 ) ( not ( = ?auto_747181 ?auto_747182 ) ) ( not ( = ?auto_747181 ?auto_747183 ) ) ( not ( = ?auto_747181 ?auto_747184 ) ) ( not ( = ?auto_747181 ?auto_747185 ) ) ( not ( = ?auto_747181 ?auto_747186 ) ) ( not ( = ?auto_747181 ?auto_747187 ) ) ( not ( = ?auto_747181 ?auto_747188 ) ) ( not ( = ?auto_747181 ?auto_747189 ) ) ( not ( = ?auto_747181 ?auto_747190 ) ) ( not ( = ?auto_747181 ?auto_747191 ) ) ( not ( = ?auto_747181 ?auto_747192 ) ) ( not ( = ?auto_747181 ?auto_747193 ) ) ( not ( = ?auto_747181 ?auto_747194 ) ) ( not ( = ?auto_747181 ?auto_747195 ) ) ( not ( = ?auto_747181 ?auto_747196 ) ) ( not ( = ?auto_747181 ?auto_747197 ) ) ( not ( = ?auto_747181 ?auto_747198 ) ) ( not ( = ?auto_747182 ?auto_747183 ) ) ( not ( = ?auto_747182 ?auto_747184 ) ) ( not ( = ?auto_747182 ?auto_747185 ) ) ( not ( = ?auto_747182 ?auto_747186 ) ) ( not ( = ?auto_747182 ?auto_747187 ) ) ( not ( = ?auto_747182 ?auto_747188 ) ) ( not ( = ?auto_747182 ?auto_747189 ) ) ( not ( = ?auto_747182 ?auto_747190 ) ) ( not ( = ?auto_747182 ?auto_747191 ) ) ( not ( = ?auto_747182 ?auto_747192 ) ) ( not ( = ?auto_747182 ?auto_747193 ) ) ( not ( = ?auto_747182 ?auto_747194 ) ) ( not ( = ?auto_747182 ?auto_747195 ) ) ( not ( = ?auto_747182 ?auto_747196 ) ) ( not ( = ?auto_747182 ?auto_747197 ) ) ( not ( = ?auto_747182 ?auto_747198 ) ) ( not ( = ?auto_747183 ?auto_747184 ) ) ( not ( = ?auto_747183 ?auto_747185 ) ) ( not ( = ?auto_747183 ?auto_747186 ) ) ( not ( = ?auto_747183 ?auto_747187 ) ) ( not ( = ?auto_747183 ?auto_747188 ) ) ( not ( = ?auto_747183 ?auto_747189 ) ) ( not ( = ?auto_747183 ?auto_747190 ) ) ( not ( = ?auto_747183 ?auto_747191 ) ) ( not ( = ?auto_747183 ?auto_747192 ) ) ( not ( = ?auto_747183 ?auto_747193 ) ) ( not ( = ?auto_747183 ?auto_747194 ) ) ( not ( = ?auto_747183 ?auto_747195 ) ) ( not ( = ?auto_747183 ?auto_747196 ) ) ( not ( = ?auto_747183 ?auto_747197 ) ) ( not ( = ?auto_747183 ?auto_747198 ) ) ( not ( = ?auto_747184 ?auto_747185 ) ) ( not ( = ?auto_747184 ?auto_747186 ) ) ( not ( = ?auto_747184 ?auto_747187 ) ) ( not ( = ?auto_747184 ?auto_747188 ) ) ( not ( = ?auto_747184 ?auto_747189 ) ) ( not ( = ?auto_747184 ?auto_747190 ) ) ( not ( = ?auto_747184 ?auto_747191 ) ) ( not ( = ?auto_747184 ?auto_747192 ) ) ( not ( = ?auto_747184 ?auto_747193 ) ) ( not ( = ?auto_747184 ?auto_747194 ) ) ( not ( = ?auto_747184 ?auto_747195 ) ) ( not ( = ?auto_747184 ?auto_747196 ) ) ( not ( = ?auto_747184 ?auto_747197 ) ) ( not ( = ?auto_747184 ?auto_747198 ) ) ( not ( = ?auto_747185 ?auto_747186 ) ) ( not ( = ?auto_747185 ?auto_747187 ) ) ( not ( = ?auto_747185 ?auto_747188 ) ) ( not ( = ?auto_747185 ?auto_747189 ) ) ( not ( = ?auto_747185 ?auto_747190 ) ) ( not ( = ?auto_747185 ?auto_747191 ) ) ( not ( = ?auto_747185 ?auto_747192 ) ) ( not ( = ?auto_747185 ?auto_747193 ) ) ( not ( = ?auto_747185 ?auto_747194 ) ) ( not ( = ?auto_747185 ?auto_747195 ) ) ( not ( = ?auto_747185 ?auto_747196 ) ) ( not ( = ?auto_747185 ?auto_747197 ) ) ( not ( = ?auto_747185 ?auto_747198 ) ) ( not ( = ?auto_747186 ?auto_747187 ) ) ( not ( = ?auto_747186 ?auto_747188 ) ) ( not ( = ?auto_747186 ?auto_747189 ) ) ( not ( = ?auto_747186 ?auto_747190 ) ) ( not ( = ?auto_747186 ?auto_747191 ) ) ( not ( = ?auto_747186 ?auto_747192 ) ) ( not ( = ?auto_747186 ?auto_747193 ) ) ( not ( = ?auto_747186 ?auto_747194 ) ) ( not ( = ?auto_747186 ?auto_747195 ) ) ( not ( = ?auto_747186 ?auto_747196 ) ) ( not ( = ?auto_747186 ?auto_747197 ) ) ( not ( = ?auto_747186 ?auto_747198 ) ) ( not ( = ?auto_747187 ?auto_747188 ) ) ( not ( = ?auto_747187 ?auto_747189 ) ) ( not ( = ?auto_747187 ?auto_747190 ) ) ( not ( = ?auto_747187 ?auto_747191 ) ) ( not ( = ?auto_747187 ?auto_747192 ) ) ( not ( = ?auto_747187 ?auto_747193 ) ) ( not ( = ?auto_747187 ?auto_747194 ) ) ( not ( = ?auto_747187 ?auto_747195 ) ) ( not ( = ?auto_747187 ?auto_747196 ) ) ( not ( = ?auto_747187 ?auto_747197 ) ) ( not ( = ?auto_747187 ?auto_747198 ) ) ( not ( = ?auto_747188 ?auto_747189 ) ) ( not ( = ?auto_747188 ?auto_747190 ) ) ( not ( = ?auto_747188 ?auto_747191 ) ) ( not ( = ?auto_747188 ?auto_747192 ) ) ( not ( = ?auto_747188 ?auto_747193 ) ) ( not ( = ?auto_747188 ?auto_747194 ) ) ( not ( = ?auto_747188 ?auto_747195 ) ) ( not ( = ?auto_747188 ?auto_747196 ) ) ( not ( = ?auto_747188 ?auto_747197 ) ) ( not ( = ?auto_747188 ?auto_747198 ) ) ( not ( = ?auto_747189 ?auto_747190 ) ) ( not ( = ?auto_747189 ?auto_747191 ) ) ( not ( = ?auto_747189 ?auto_747192 ) ) ( not ( = ?auto_747189 ?auto_747193 ) ) ( not ( = ?auto_747189 ?auto_747194 ) ) ( not ( = ?auto_747189 ?auto_747195 ) ) ( not ( = ?auto_747189 ?auto_747196 ) ) ( not ( = ?auto_747189 ?auto_747197 ) ) ( not ( = ?auto_747189 ?auto_747198 ) ) ( not ( = ?auto_747190 ?auto_747191 ) ) ( not ( = ?auto_747190 ?auto_747192 ) ) ( not ( = ?auto_747190 ?auto_747193 ) ) ( not ( = ?auto_747190 ?auto_747194 ) ) ( not ( = ?auto_747190 ?auto_747195 ) ) ( not ( = ?auto_747190 ?auto_747196 ) ) ( not ( = ?auto_747190 ?auto_747197 ) ) ( not ( = ?auto_747190 ?auto_747198 ) ) ( not ( = ?auto_747191 ?auto_747192 ) ) ( not ( = ?auto_747191 ?auto_747193 ) ) ( not ( = ?auto_747191 ?auto_747194 ) ) ( not ( = ?auto_747191 ?auto_747195 ) ) ( not ( = ?auto_747191 ?auto_747196 ) ) ( not ( = ?auto_747191 ?auto_747197 ) ) ( not ( = ?auto_747191 ?auto_747198 ) ) ( not ( = ?auto_747192 ?auto_747193 ) ) ( not ( = ?auto_747192 ?auto_747194 ) ) ( not ( = ?auto_747192 ?auto_747195 ) ) ( not ( = ?auto_747192 ?auto_747196 ) ) ( not ( = ?auto_747192 ?auto_747197 ) ) ( not ( = ?auto_747192 ?auto_747198 ) ) ( not ( = ?auto_747193 ?auto_747194 ) ) ( not ( = ?auto_747193 ?auto_747195 ) ) ( not ( = ?auto_747193 ?auto_747196 ) ) ( not ( = ?auto_747193 ?auto_747197 ) ) ( not ( = ?auto_747193 ?auto_747198 ) ) ( not ( = ?auto_747194 ?auto_747195 ) ) ( not ( = ?auto_747194 ?auto_747196 ) ) ( not ( = ?auto_747194 ?auto_747197 ) ) ( not ( = ?auto_747194 ?auto_747198 ) ) ( not ( = ?auto_747195 ?auto_747196 ) ) ( not ( = ?auto_747195 ?auto_747197 ) ) ( not ( = ?auto_747195 ?auto_747198 ) ) ( not ( = ?auto_747196 ?auto_747197 ) ) ( not ( = ?auto_747196 ?auto_747198 ) ) ( not ( = ?auto_747197 ?auto_747198 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_747198 )
      ( !STACK ?auto_747198 ?auto_747197 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747217 - BLOCK
      ?auto_747218 - BLOCK
      ?auto_747219 - BLOCK
      ?auto_747220 - BLOCK
      ?auto_747221 - BLOCK
      ?auto_747222 - BLOCK
      ?auto_747223 - BLOCK
      ?auto_747224 - BLOCK
      ?auto_747225 - BLOCK
      ?auto_747226 - BLOCK
      ?auto_747227 - BLOCK
      ?auto_747228 - BLOCK
      ?auto_747229 - BLOCK
      ?auto_747230 - BLOCK
      ?auto_747231 - BLOCK
      ?auto_747232 - BLOCK
      ?auto_747233 - BLOCK
      ?auto_747234 - BLOCK
    )
    :vars
    (
      ?auto_747235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747234 ?auto_747235 ) ( ON-TABLE ?auto_747217 ) ( ON ?auto_747218 ?auto_747217 ) ( ON ?auto_747219 ?auto_747218 ) ( ON ?auto_747220 ?auto_747219 ) ( ON ?auto_747221 ?auto_747220 ) ( ON ?auto_747222 ?auto_747221 ) ( ON ?auto_747223 ?auto_747222 ) ( ON ?auto_747224 ?auto_747223 ) ( ON ?auto_747225 ?auto_747224 ) ( ON ?auto_747226 ?auto_747225 ) ( ON ?auto_747227 ?auto_747226 ) ( ON ?auto_747228 ?auto_747227 ) ( ON ?auto_747229 ?auto_747228 ) ( ON ?auto_747230 ?auto_747229 ) ( ON ?auto_747231 ?auto_747230 ) ( ON ?auto_747232 ?auto_747231 ) ( not ( = ?auto_747217 ?auto_747218 ) ) ( not ( = ?auto_747217 ?auto_747219 ) ) ( not ( = ?auto_747217 ?auto_747220 ) ) ( not ( = ?auto_747217 ?auto_747221 ) ) ( not ( = ?auto_747217 ?auto_747222 ) ) ( not ( = ?auto_747217 ?auto_747223 ) ) ( not ( = ?auto_747217 ?auto_747224 ) ) ( not ( = ?auto_747217 ?auto_747225 ) ) ( not ( = ?auto_747217 ?auto_747226 ) ) ( not ( = ?auto_747217 ?auto_747227 ) ) ( not ( = ?auto_747217 ?auto_747228 ) ) ( not ( = ?auto_747217 ?auto_747229 ) ) ( not ( = ?auto_747217 ?auto_747230 ) ) ( not ( = ?auto_747217 ?auto_747231 ) ) ( not ( = ?auto_747217 ?auto_747232 ) ) ( not ( = ?auto_747217 ?auto_747233 ) ) ( not ( = ?auto_747217 ?auto_747234 ) ) ( not ( = ?auto_747217 ?auto_747235 ) ) ( not ( = ?auto_747218 ?auto_747219 ) ) ( not ( = ?auto_747218 ?auto_747220 ) ) ( not ( = ?auto_747218 ?auto_747221 ) ) ( not ( = ?auto_747218 ?auto_747222 ) ) ( not ( = ?auto_747218 ?auto_747223 ) ) ( not ( = ?auto_747218 ?auto_747224 ) ) ( not ( = ?auto_747218 ?auto_747225 ) ) ( not ( = ?auto_747218 ?auto_747226 ) ) ( not ( = ?auto_747218 ?auto_747227 ) ) ( not ( = ?auto_747218 ?auto_747228 ) ) ( not ( = ?auto_747218 ?auto_747229 ) ) ( not ( = ?auto_747218 ?auto_747230 ) ) ( not ( = ?auto_747218 ?auto_747231 ) ) ( not ( = ?auto_747218 ?auto_747232 ) ) ( not ( = ?auto_747218 ?auto_747233 ) ) ( not ( = ?auto_747218 ?auto_747234 ) ) ( not ( = ?auto_747218 ?auto_747235 ) ) ( not ( = ?auto_747219 ?auto_747220 ) ) ( not ( = ?auto_747219 ?auto_747221 ) ) ( not ( = ?auto_747219 ?auto_747222 ) ) ( not ( = ?auto_747219 ?auto_747223 ) ) ( not ( = ?auto_747219 ?auto_747224 ) ) ( not ( = ?auto_747219 ?auto_747225 ) ) ( not ( = ?auto_747219 ?auto_747226 ) ) ( not ( = ?auto_747219 ?auto_747227 ) ) ( not ( = ?auto_747219 ?auto_747228 ) ) ( not ( = ?auto_747219 ?auto_747229 ) ) ( not ( = ?auto_747219 ?auto_747230 ) ) ( not ( = ?auto_747219 ?auto_747231 ) ) ( not ( = ?auto_747219 ?auto_747232 ) ) ( not ( = ?auto_747219 ?auto_747233 ) ) ( not ( = ?auto_747219 ?auto_747234 ) ) ( not ( = ?auto_747219 ?auto_747235 ) ) ( not ( = ?auto_747220 ?auto_747221 ) ) ( not ( = ?auto_747220 ?auto_747222 ) ) ( not ( = ?auto_747220 ?auto_747223 ) ) ( not ( = ?auto_747220 ?auto_747224 ) ) ( not ( = ?auto_747220 ?auto_747225 ) ) ( not ( = ?auto_747220 ?auto_747226 ) ) ( not ( = ?auto_747220 ?auto_747227 ) ) ( not ( = ?auto_747220 ?auto_747228 ) ) ( not ( = ?auto_747220 ?auto_747229 ) ) ( not ( = ?auto_747220 ?auto_747230 ) ) ( not ( = ?auto_747220 ?auto_747231 ) ) ( not ( = ?auto_747220 ?auto_747232 ) ) ( not ( = ?auto_747220 ?auto_747233 ) ) ( not ( = ?auto_747220 ?auto_747234 ) ) ( not ( = ?auto_747220 ?auto_747235 ) ) ( not ( = ?auto_747221 ?auto_747222 ) ) ( not ( = ?auto_747221 ?auto_747223 ) ) ( not ( = ?auto_747221 ?auto_747224 ) ) ( not ( = ?auto_747221 ?auto_747225 ) ) ( not ( = ?auto_747221 ?auto_747226 ) ) ( not ( = ?auto_747221 ?auto_747227 ) ) ( not ( = ?auto_747221 ?auto_747228 ) ) ( not ( = ?auto_747221 ?auto_747229 ) ) ( not ( = ?auto_747221 ?auto_747230 ) ) ( not ( = ?auto_747221 ?auto_747231 ) ) ( not ( = ?auto_747221 ?auto_747232 ) ) ( not ( = ?auto_747221 ?auto_747233 ) ) ( not ( = ?auto_747221 ?auto_747234 ) ) ( not ( = ?auto_747221 ?auto_747235 ) ) ( not ( = ?auto_747222 ?auto_747223 ) ) ( not ( = ?auto_747222 ?auto_747224 ) ) ( not ( = ?auto_747222 ?auto_747225 ) ) ( not ( = ?auto_747222 ?auto_747226 ) ) ( not ( = ?auto_747222 ?auto_747227 ) ) ( not ( = ?auto_747222 ?auto_747228 ) ) ( not ( = ?auto_747222 ?auto_747229 ) ) ( not ( = ?auto_747222 ?auto_747230 ) ) ( not ( = ?auto_747222 ?auto_747231 ) ) ( not ( = ?auto_747222 ?auto_747232 ) ) ( not ( = ?auto_747222 ?auto_747233 ) ) ( not ( = ?auto_747222 ?auto_747234 ) ) ( not ( = ?auto_747222 ?auto_747235 ) ) ( not ( = ?auto_747223 ?auto_747224 ) ) ( not ( = ?auto_747223 ?auto_747225 ) ) ( not ( = ?auto_747223 ?auto_747226 ) ) ( not ( = ?auto_747223 ?auto_747227 ) ) ( not ( = ?auto_747223 ?auto_747228 ) ) ( not ( = ?auto_747223 ?auto_747229 ) ) ( not ( = ?auto_747223 ?auto_747230 ) ) ( not ( = ?auto_747223 ?auto_747231 ) ) ( not ( = ?auto_747223 ?auto_747232 ) ) ( not ( = ?auto_747223 ?auto_747233 ) ) ( not ( = ?auto_747223 ?auto_747234 ) ) ( not ( = ?auto_747223 ?auto_747235 ) ) ( not ( = ?auto_747224 ?auto_747225 ) ) ( not ( = ?auto_747224 ?auto_747226 ) ) ( not ( = ?auto_747224 ?auto_747227 ) ) ( not ( = ?auto_747224 ?auto_747228 ) ) ( not ( = ?auto_747224 ?auto_747229 ) ) ( not ( = ?auto_747224 ?auto_747230 ) ) ( not ( = ?auto_747224 ?auto_747231 ) ) ( not ( = ?auto_747224 ?auto_747232 ) ) ( not ( = ?auto_747224 ?auto_747233 ) ) ( not ( = ?auto_747224 ?auto_747234 ) ) ( not ( = ?auto_747224 ?auto_747235 ) ) ( not ( = ?auto_747225 ?auto_747226 ) ) ( not ( = ?auto_747225 ?auto_747227 ) ) ( not ( = ?auto_747225 ?auto_747228 ) ) ( not ( = ?auto_747225 ?auto_747229 ) ) ( not ( = ?auto_747225 ?auto_747230 ) ) ( not ( = ?auto_747225 ?auto_747231 ) ) ( not ( = ?auto_747225 ?auto_747232 ) ) ( not ( = ?auto_747225 ?auto_747233 ) ) ( not ( = ?auto_747225 ?auto_747234 ) ) ( not ( = ?auto_747225 ?auto_747235 ) ) ( not ( = ?auto_747226 ?auto_747227 ) ) ( not ( = ?auto_747226 ?auto_747228 ) ) ( not ( = ?auto_747226 ?auto_747229 ) ) ( not ( = ?auto_747226 ?auto_747230 ) ) ( not ( = ?auto_747226 ?auto_747231 ) ) ( not ( = ?auto_747226 ?auto_747232 ) ) ( not ( = ?auto_747226 ?auto_747233 ) ) ( not ( = ?auto_747226 ?auto_747234 ) ) ( not ( = ?auto_747226 ?auto_747235 ) ) ( not ( = ?auto_747227 ?auto_747228 ) ) ( not ( = ?auto_747227 ?auto_747229 ) ) ( not ( = ?auto_747227 ?auto_747230 ) ) ( not ( = ?auto_747227 ?auto_747231 ) ) ( not ( = ?auto_747227 ?auto_747232 ) ) ( not ( = ?auto_747227 ?auto_747233 ) ) ( not ( = ?auto_747227 ?auto_747234 ) ) ( not ( = ?auto_747227 ?auto_747235 ) ) ( not ( = ?auto_747228 ?auto_747229 ) ) ( not ( = ?auto_747228 ?auto_747230 ) ) ( not ( = ?auto_747228 ?auto_747231 ) ) ( not ( = ?auto_747228 ?auto_747232 ) ) ( not ( = ?auto_747228 ?auto_747233 ) ) ( not ( = ?auto_747228 ?auto_747234 ) ) ( not ( = ?auto_747228 ?auto_747235 ) ) ( not ( = ?auto_747229 ?auto_747230 ) ) ( not ( = ?auto_747229 ?auto_747231 ) ) ( not ( = ?auto_747229 ?auto_747232 ) ) ( not ( = ?auto_747229 ?auto_747233 ) ) ( not ( = ?auto_747229 ?auto_747234 ) ) ( not ( = ?auto_747229 ?auto_747235 ) ) ( not ( = ?auto_747230 ?auto_747231 ) ) ( not ( = ?auto_747230 ?auto_747232 ) ) ( not ( = ?auto_747230 ?auto_747233 ) ) ( not ( = ?auto_747230 ?auto_747234 ) ) ( not ( = ?auto_747230 ?auto_747235 ) ) ( not ( = ?auto_747231 ?auto_747232 ) ) ( not ( = ?auto_747231 ?auto_747233 ) ) ( not ( = ?auto_747231 ?auto_747234 ) ) ( not ( = ?auto_747231 ?auto_747235 ) ) ( not ( = ?auto_747232 ?auto_747233 ) ) ( not ( = ?auto_747232 ?auto_747234 ) ) ( not ( = ?auto_747232 ?auto_747235 ) ) ( not ( = ?auto_747233 ?auto_747234 ) ) ( not ( = ?auto_747233 ?auto_747235 ) ) ( not ( = ?auto_747234 ?auto_747235 ) ) ( CLEAR ?auto_747232 ) ( ON ?auto_747233 ?auto_747234 ) ( CLEAR ?auto_747233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_747217 ?auto_747218 ?auto_747219 ?auto_747220 ?auto_747221 ?auto_747222 ?auto_747223 ?auto_747224 ?auto_747225 ?auto_747226 ?auto_747227 ?auto_747228 ?auto_747229 ?auto_747230 ?auto_747231 ?auto_747232 ?auto_747233 )
      ( MAKE-18PILE ?auto_747217 ?auto_747218 ?auto_747219 ?auto_747220 ?auto_747221 ?auto_747222 ?auto_747223 ?auto_747224 ?auto_747225 ?auto_747226 ?auto_747227 ?auto_747228 ?auto_747229 ?auto_747230 ?auto_747231 ?auto_747232 ?auto_747233 ?auto_747234 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747254 - BLOCK
      ?auto_747255 - BLOCK
      ?auto_747256 - BLOCK
      ?auto_747257 - BLOCK
      ?auto_747258 - BLOCK
      ?auto_747259 - BLOCK
      ?auto_747260 - BLOCK
      ?auto_747261 - BLOCK
      ?auto_747262 - BLOCK
      ?auto_747263 - BLOCK
      ?auto_747264 - BLOCK
      ?auto_747265 - BLOCK
      ?auto_747266 - BLOCK
      ?auto_747267 - BLOCK
      ?auto_747268 - BLOCK
      ?auto_747269 - BLOCK
      ?auto_747270 - BLOCK
      ?auto_747271 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_747271 ) ( ON-TABLE ?auto_747254 ) ( ON ?auto_747255 ?auto_747254 ) ( ON ?auto_747256 ?auto_747255 ) ( ON ?auto_747257 ?auto_747256 ) ( ON ?auto_747258 ?auto_747257 ) ( ON ?auto_747259 ?auto_747258 ) ( ON ?auto_747260 ?auto_747259 ) ( ON ?auto_747261 ?auto_747260 ) ( ON ?auto_747262 ?auto_747261 ) ( ON ?auto_747263 ?auto_747262 ) ( ON ?auto_747264 ?auto_747263 ) ( ON ?auto_747265 ?auto_747264 ) ( ON ?auto_747266 ?auto_747265 ) ( ON ?auto_747267 ?auto_747266 ) ( ON ?auto_747268 ?auto_747267 ) ( ON ?auto_747269 ?auto_747268 ) ( not ( = ?auto_747254 ?auto_747255 ) ) ( not ( = ?auto_747254 ?auto_747256 ) ) ( not ( = ?auto_747254 ?auto_747257 ) ) ( not ( = ?auto_747254 ?auto_747258 ) ) ( not ( = ?auto_747254 ?auto_747259 ) ) ( not ( = ?auto_747254 ?auto_747260 ) ) ( not ( = ?auto_747254 ?auto_747261 ) ) ( not ( = ?auto_747254 ?auto_747262 ) ) ( not ( = ?auto_747254 ?auto_747263 ) ) ( not ( = ?auto_747254 ?auto_747264 ) ) ( not ( = ?auto_747254 ?auto_747265 ) ) ( not ( = ?auto_747254 ?auto_747266 ) ) ( not ( = ?auto_747254 ?auto_747267 ) ) ( not ( = ?auto_747254 ?auto_747268 ) ) ( not ( = ?auto_747254 ?auto_747269 ) ) ( not ( = ?auto_747254 ?auto_747270 ) ) ( not ( = ?auto_747254 ?auto_747271 ) ) ( not ( = ?auto_747255 ?auto_747256 ) ) ( not ( = ?auto_747255 ?auto_747257 ) ) ( not ( = ?auto_747255 ?auto_747258 ) ) ( not ( = ?auto_747255 ?auto_747259 ) ) ( not ( = ?auto_747255 ?auto_747260 ) ) ( not ( = ?auto_747255 ?auto_747261 ) ) ( not ( = ?auto_747255 ?auto_747262 ) ) ( not ( = ?auto_747255 ?auto_747263 ) ) ( not ( = ?auto_747255 ?auto_747264 ) ) ( not ( = ?auto_747255 ?auto_747265 ) ) ( not ( = ?auto_747255 ?auto_747266 ) ) ( not ( = ?auto_747255 ?auto_747267 ) ) ( not ( = ?auto_747255 ?auto_747268 ) ) ( not ( = ?auto_747255 ?auto_747269 ) ) ( not ( = ?auto_747255 ?auto_747270 ) ) ( not ( = ?auto_747255 ?auto_747271 ) ) ( not ( = ?auto_747256 ?auto_747257 ) ) ( not ( = ?auto_747256 ?auto_747258 ) ) ( not ( = ?auto_747256 ?auto_747259 ) ) ( not ( = ?auto_747256 ?auto_747260 ) ) ( not ( = ?auto_747256 ?auto_747261 ) ) ( not ( = ?auto_747256 ?auto_747262 ) ) ( not ( = ?auto_747256 ?auto_747263 ) ) ( not ( = ?auto_747256 ?auto_747264 ) ) ( not ( = ?auto_747256 ?auto_747265 ) ) ( not ( = ?auto_747256 ?auto_747266 ) ) ( not ( = ?auto_747256 ?auto_747267 ) ) ( not ( = ?auto_747256 ?auto_747268 ) ) ( not ( = ?auto_747256 ?auto_747269 ) ) ( not ( = ?auto_747256 ?auto_747270 ) ) ( not ( = ?auto_747256 ?auto_747271 ) ) ( not ( = ?auto_747257 ?auto_747258 ) ) ( not ( = ?auto_747257 ?auto_747259 ) ) ( not ( = ?auto_747257 ?auto_747260 ) ) ( not ( = ?auto_747257 ?auto_747261 ) ) ( not ( = ?auto_747257 ?auto_747262 ) ) ( not ( = ?auto_747257 ?auto_747263 ) ) ( not ( = ?auto_747257 ?auto_747264 ) ) ( not ( = ?auto_747257 ?auto_747265 ) ) ( not ( = ?auto_747257 ?auto_747266 ) ) ( not ( = ?auto_747257 ?auto_747267 ) ) ( not ( = ?auto_747257 ?auto_747268 ) ) ( not ( = ?auto_747257 ?auto_747269 ) ) ( not ( = ?auto_747257 ?auto_747270 ) ) ( not ( = ?auto_747257 ?auto_747271 ) ) ( not ( = ?auto_747258 ?auto_747259 ) ) ( not ( = ?auto_747258 ?auto_747260 ) ) ( not ( = ?auto_747258 ?auto_747261 ) ) ( not ( = ?auto_747258 ?auto_747262 ) ) ( not ( = ?auto_747258 ?auto_747263 ) ) ( not ( = ?auto_747258 ?auto_747264 ) ) ( not ( = ?auto_747258 ?auto_747265 ) ) ( not ( = ?auto_747258 ?auto_747266 ) ) ( not ( = ?auto_747258 ?auto_747267 ) ) ( not ( = ?auto_747258 ?auto_747268 ) ) ( not ( = ?auto_747258 ?auto_747269 ) ) ( not ( = ?auto_747258 ?auto_747270 ) ) ( not ( = ?auto_747258 ?auto_747271 ) ) ( not ( = ?auto_747259 ?auto_747260 ) ) ( not ( = ?auto_747259 ?auto_747261 ) ) ( not ( = ?auto_747259 ?auto_747262 ) ) ( not ( = ?auto_747259 ?auto_747263 ) ) ( not ( = ?auto_747259 ?auto_747264 ) ) ( not ( = ?auto_747259 ?auto_747265 ) ) ( not ( = ?auto_747259 ?auto_747266 ) ) ( not ( = ?auto_747259 ?auto_747267 ) ) ( not ( = ?auto_747259 ?auto_747268 ) ) ( not ( = ?auto_747259 ?auto_747269 ) ) ( not ( = ?auto_747259 ?auto_747270 ) ) ( not ( = ?auto_747259 ?auto_747271 ) ) ( not ( = ?auto_747260 ?auto_747261 ) ) ( not ( = ?auto_747260 ?auto_747262 ) ) ( not ( = ?auto_747260 ?auto_747263 ) ) ( not ( = ?auto_747260 ?auto_747264 ) ) ( not ( = ?auto_747260 ?auto_747265 ) ) ( not ( = ?auto_747260 ?auto_747266 ) ) ( not ( = ?auto_747260 ?auto_747267 ) ) ( not ( = ?auto_747260 ?auto_747268 ) ) ( not ( = ?auto_747260 ?auto_747269 ) ) ( not ( = ?auto_747260 ?auto_747270 ) ) ( not ( = ?auto_747260 ?auto_747271 ) ) ( not ( = ?auto_747261 ?auto_747262 ) ) ( not ( = ?auto_747261 ?auto_747263 ) ) ( not ( = ?auto_747261 ?auto_747264 ) ) ( not ( = ?auto_747261 ?auto_747265 ) ) ( not ( = ?auto_747261 ?auto_747266 ) ) ( not ( = ?auto_747261 ?auto_747267 ) ) ( not ( = ?auto_747261 ?auto_747268 ) ) ( not ( = ?auto_747261 ?auto_747269 ) ) ( not ( = ?auto_747261 ?auto_747270 ) ) ( not ( = ?auto_747261 ?auto_747271 ) ) ( not ( = ?auto_747262 ?auto_747263 ) ) ( not ( = ?auto_747262 ?auto_747264 ) ) ( not ( = ?auto_747262 ?auto_747265 ) ) ( not ( = ?auto_747262 ?auto_747266 ) ) ( not ( = ?auto_747262 ?auto_747267 ) ) ( not ( = ?auto_747262 ?auto_747268 ) ) ( not ( = ?auto_747262 ?auto_747269 ) ) ( not ( = ?auto_747262 ?auto_747270 ) ) ( not ( = ?auto_747262 ?auto_747271 ) ) ( not ( = ?auto_747263 ?auto_747264 ) ) ( not ( = ?auto_747263 ?auto_747265 ) ) ( not ( = ?auto_747263 ?auto_747266 ) ) ( not ( = ?auto_747263 ?auto_747267 ) ) ( not ( = ?auto_747263 ?auto_747268 ) ) ( not ( = ?auto_747263 ?auto_747269 ) ) ( not ( = ?auto_747263 ?auto_747270 ) ) ( not ( = ?auto_747263 ?auto_747271 ) ) ( not ( = ?auto_747264 ?auto_747265 ) ) ( not ( = ?auto_747264 ?auto_747266 ) ) ( not ( = ?auto_747264 ?auto_747267 ) ) ( not ( = ?auto_747264 ?auto_747268 ) ) ( not ( = ?auto_747264 ?auto_747269 ) ) ( not ( = ?auto_747264 ?auto_747270 ) ) ( not ( = ?auto_747264 ?auto_747271 ) ) ( not ( = ?auto_747265 ?auto_747266 ) ) ( not ( = ?auto_747265 ?auto_747267 ) ) ( not ( = ?auto_747265 ?auto_747268 ) ) ( not ( = ?auto_747265 ?auto_747269 ) ) ( not ( = ?auto_747265 ?auto_747270 ) ) ( not ( = ?auto_747265 ?auto_747271 ) ) ( not ( = ?auto_747266 ?auto_747267 ) ) ( not ( = ?auto_747266 ?auto_747268 ) ) ( not ( = ?auto_747266 ?auto_747269 ) ) ( not ( = ?auto_747266 ?auto_747270 ) ) ( not ( = ?auto_747266 ?auto_747271 ) ) ( not ( = ?auto_747267 ?auto_747268 ) ) ( not ( = ?auto_747267 ?auto_747269 ) ) ( not ( = ?auto_747267 ?auto_747270 ) ) ( not ( = ?auto_747267 ?auto_747271 ) ) ( not ( = ?auto_747268 ?auto_747269 ) ) ( not ( = ?auto_747268 ?auto_747270 ) ) ( not ( = ?auto_747268 ?auto_747271 ) ) ( not ( = ?auto_747269 ?auto_747270 ) ) ( not ( = ?auto_747269 ?auto_747271 ) ) ( not ( = ?auto_747270 ?auto_747271 ) ) ( CLEAR ?auto_747269 ) ( ON ?auto_747270 ?auto_747271 ) ( CLEAR ?auto_747270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_747254 ?auto_747255 ?auto_747256 ?auto_747257 ?auto_747258 ?auto_747259 ?auto_747260 ?auto_747261 ?auto_747262 ?auto_747263 ?auto_747264 ?auto_747265 ?auto_747266 ?auto_747267 ?auto_747268 ?auto_747269 ?auto_747270 )
      ( MAKE-18PILE ?auto_747254 ?auto_747255 ?auto_747256 ?auto_747257 ?auto_747258 ?auto_747259 ?auto_747260 ?auto_747261 ?auto_747262 ?auto_747263 ?auto_747264 ?auto_747265 ?auto_747266 ?auto_747267 ?auto_747268 ?auto_747269 ?auto_747270 ?auto_747271 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747290 - BLOCK
      ?auto_747291 - BLOCK
      ?auto_747292 - BLOCK
      ?auto_747293 - BLOCK
      ?auto_747294 - BLOCK
      ?auto_747295 - BLOCK
      ?auto_747296 - BLOCK
      ?auto_747297 - BLOCK
      ?auto_747298 - BLOCK
      ?auto_747299 - BLOCK
      ?auto_747300 - BLOCK
      ?auto_747301 - BLOCK
      ?auto_747302 - BLOCK
      ?auto_747303 - BLOCK
      ?auto_747304 - BLOCK
      ?auto_747305 - BLOCK
      ?auto_747306 - BLOCK
      ?auto_747307 - BLOCK
    )
    :vars
    (
      ?auto_747308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747307 ?auto_747308 ) ( ON-TABLE ?auto_747290 ) ( ON ?auto_747291 ?auto_747290 ) ( ON ?auto_747292 ?auto_747291 ) ( ON ?auto_747293 ?auto_747292 ) ( ON ?auto_747294 ?auto_747293 ) ( ON ?auto_747295 ?auto_747294 ) ( ON ?auto_747296 ?auto_747295 ) ( ON ?auto_747297 ?auto_747296 ) ( ON ?auto_747298 ?auto_747297 ) ( ON ?auto_747299 ?auto_747298 ) ( ON ?auto_747300 ?auto_747299 ) ( ON ?auto_747301 ?auto_747300 ) ( ON ?auto_747302 ?auto_747301 ) ( ON ?auto_747303 ?auto_747302 ) ( ON ?auto_747304 ?auto_747303 ) ( not ( = ?auto_747290 ?auto_747291 ) ) ( not ( = ?auto_747290 ?auto_747292 ) ) ( not ( = ?auto_747290 ?auto_747293 ) ) ( not ( = ?auto_747290 ?auto_747294 ) ) ( not ( = ?auto_747290 ?auto_747295 ) ) ( not ( = ?auto_747290 ?auto_747296 ) ) ( not ( = ?auto_747290 ?auto_747297 ) ) ( not ( = ?auto_747290 ?auto_747298 ) ) ( not ( = ?auto_747290 ?auto_747299 ) ) ( not ( = ?auto_747290 ?auto_747300 ) ) ( not ( = ?auto_747290 ?auto_747301 ) ) ( not ( = ?auto_747290 ?auto_747302 ) ) ( not ( = ?auto_747290 ?auto_747303 ) ) ( not ( = ?auto_747290 ?auto_747304 ) ) ( not ( = ?auto_747290 ?auto_747305 ) ) ( not ( = ?auto_747290 ?auto_747306 ) ) ( not ( = ?auto_747290 ?auto_747307 ) ) ( not ( = ?auto_747290 ?auto_747308 ) ) ( not ( = ?auto_747291 ?auto_747292 ) ) ( not ( = ?auto_747291 ?auto_747293 ) ) ( not ( = ?auto_747291 ?auto_747294 ) ) ( not ( = ?auto_747291 ?auto_747295 ) ) ( not ( = ?auto_747291 ?auto_747296 ) ) ( not ( = ?auto_747291 ?auto_747297 ) ) ( not ( = ?auto_747291 ?auto_747298 ) ) ( not ( = ?auto_747291 ?auto_747299 ) ) ( not ( = ?auto_747291 ?auto_747300 ) ) ( not ( = ?auto_747291 ?auto_747301 ) ) ( not ( = ?auto_747291 ?auto_747302 ) ) ( not ( = ?auto_747291 ?auto_747303 ) ) ( not ( = ?auto_747291 ?auto_747304 ) ) ( not ( = ?auto_747291 ?auto_747305 ) ) ( not ( = ?auto_747291 ?auto_747306 ) ) ( not ( = ?auto_747291 ?auto_747307 ) ) ( not ( = ?auto_747291 ?auto_747308 ) ) ( not ( = ?auto_747292 ?auto_747293 ) ) ( not ( = ?auto_747292 ?auto_747294 ) ) ( not ( = ?auto_747292 ?auto_747295 ) ) ( not ( = ?auto_747292 ?auto_747296 ) ) ( not ( = ?auto_747292 ?auto_747297 ) ) ( not ( = ?auto_747292 ?auto_747298 ) ) ( not ( = ?auto_747292 ?auto_747299 ) ) ( not ( = ?auto_747292 ?auto_747300 ) ) ( not ( = ?auto_747292 ?auto_747301 ) ) ( not ( = ?auto_747292 ?auto_747302 ) ) ( not ( = ?auto_747292 ?auto_747303 ) ) ( not ( = ?auto_747292 ?auto_747304 ) ) ( not ( = ?auto_747292 ?auto_747305 ) ) ( not ( = ?auto_747292 ?auto_747306 ) ) ( not ( = ?auto_747292 ?auto_747307 ) ) ( not ( = ?auto_747292 ?auto_747308 ) ) ( not ( = ?auto_747293 ?auto_747294 ) ) ( not ( = ?auto_747293 ?auto_747295 ) ) ( not ( = ?auto_747293 ?auto_747296 ) ) ( not ( = ?auto_747293 ?auto_747297 ) ) ( not ( = ?auto_747293 ?auto_747298 ) ) ( not ( = ?auto_747293 ?auto_747299 ) ) ( not ( = ?auto_747293 ?auto_747300 ) ) ( not ( = ?auto_747293 ?auto_747301 ) ) ( not ( = ?auto_747293 ?auto_747302 ) ) ( not ( = ?auto_747293 ?auto_747303 ) ) ( not ( = ?auto_747293 ?auto_747304 ) ) ( not ( = ?auto_747293 ?auto_747305 ) ) ( not ( = ?auto_747293 ?auto_747306 ) ) ( not ( = ?auto_747293 ?auto_747307 ) ) ( not ( = ?auto_747293 ?auto_747308 ) ) ( not ( = ?auto_747294 ?auto_747295 ) ) ( not ( = ?auto_747294 ?auto_747296 ) ) ( not ( = ?auto_747294 ?auto_747297 ) ) ( not ( = ?auto_747294 ?auto_747298 ) ) ( not ( = ?auto_747294 ?auto_747299 ) ) ( not ( = ?auto_747294 ?auto_747300 ) ) ( not ( = ?auto_747294 ?auto_747301 ) ) ( not ( = ?auto_747294 ?auto_747302 ) ) ( not ( = ?auto_747294 ?auto_747303 ) ) ( not ( = ?auto_747294 ?auto_747304 ) ) ( not ( = ?auto_747294 ?auto_747305 ) ) ( not ( = ?auto_747294 ?auto_747306 ) ) ( not ( = ?auto_747294 ?auto_747307 ) ) ( not ( = ?auto_747294 ?auto_747308 ) ) ( not ( = ?auto_747295 ?auto_747296 ) ) ( not ( = ?auto_747295 ?auto_747297 ) ) ( not ( = ?auto_747295 ?auto_747298 ) ) ( not ( = ?auto_747295 ?auto_747299 ) ) ( not ( = ?auto_747295 ?auto_747300 ) ) ( not ( = ?auto_747295 ?auto_747301 ) ) ( not ( = ?auto_747295 ?auto_747302 ) ) ( not ( = ?auto_747295 ?auto_747303 ) ) ( not ( = ?auto_747295 ?auto_747304 ) ) ( not ( = ?auto_747295 ?auto_747305 ) ) ( not ( = ?auto_747295 ?auto_747306 ) ) ( not ( = ?auto_747295 ?auto_747307 ) ) ( not ( = ?auto_747295 ?auto_747308 ) ) ( not ( = ?auto_747296 ?auto_747297 ) ) ( not ( = ?auto_747296 ?auto_747298 ) ) ( not ( = ?auto_747296 ?auto_747299 ) ) ( not ( = ?auto_747296 ?auto_747300 ) ) ( not ( = ?auto_747296 ?auto_747301 ) ) ( not ( = ?auto_747296 ?auto_747302 ) ) ( not ( = ?auto_747296 ?auto_747303 ) ) ( not ( = ?auto_747296 ?auto_747304 ) ) ( not ( = ?auto_747296 ?auto_747305 ) ) ( not ( = ?auto_747296 ?auto_747306 ) ) ( not ( = ?auto_747296 ?auto_747307 ) ) ( not ( = ?auto_747296 ?auto_747308 ) ) ( not ( = ?auto_747297 ?auto_747298 ) ) ( not ( = ?auto_747297 ?auto_747299 ) ) ( not ( = ?auto_747297 ?auto_747300 ) ) ( not ( = ?auto_747297 ?auto_747301 ) ) ( not ( = ?auto_747297 ?auto_747302 ) ) ( not ( = ?auto_747297 ?auto_747303 ) ) ( not ( = ?auto_747297 ?auto_747304 ) ) ( not ( = ?auto_747297 ?auto_747305 ) ) ( not ( = ?auto_747297 ?auto_747306 ) ) ( not ( = ?auto_747297 ?auto_747307 ) ) ( not ( = ?auto_747297 ?auto_747308 ) ) ( not ( = ?auto_747298 ?auto_747299 ) ) ( not ( = ?auto_747298 ?auto_747300 ) ) ( not ( = ?auto_747298 ?auto_747301 ) ) ( not ( = ?auto_747298 ?auto_747302 ) ) ( not ( = ?auto_747298 ?auto_747303 ) ) ( not ( = ?auto_747298 ?auto_747304 ) ) ( not ( = ?auto_747298 ?auto_747305 ) ) ( not ( = ?auto_747298 ?auto_747306 ) ) ( not ( = ?auto_747298 ?auto_747307 ) ) ( not ( = ?auto_747298 ?auto_747308 ) ) ( not ( = ?auto_747299 ?auto_747300 ) ) ( not ( = ?auto_747299 ?auto_747301 ) ) ( not ( = ?auto_747299 ?auto_747302 ) ) ( not ( = ?auto_747299 ?auto_747303 ) ) ( not ( = ?auto_747299 ?auto_747304 ) ) ( not ( = ?auto_747299 ?auto_747305 ) ) ( not ( = ?auto_747299 ?auto_747306 ) ) ( not ( = ?auto_747299 ?auto_747307 ) ) ( not ( = ?auto_747299 ?auto_747308 ) ) ( not ( = ?auto_747300 ?auto_747301 ) ) ( not ( = ?auto_747300 ?auto_747302 ) ) ( not ( = ?auto_747300 ?auto_747303 ) ) ( not ( = ?auto_747300 ?auto_747304 ) ) ( not ( = ?auto_747300 ?auto_747305 ) ) ( not ( = ?auto_747300 ?auto_747306 ) ) ( not ( = ?auto_747300 ?auto_747307 ) ) ( not ( = ?auto_747300 ?auto_747308 ) ) ( not ( = ?auto_747301 ?auto_747302 ) ) ( not ( = ?auto_747301 ?auto_747303 ) ) ( not ( = ?auto_747301 ?auto_747304 ) ) ( not ( = ?auto_747301 ?auto_747305 ) ) ( not ( = ?auto_747301 ?auto_747306 ) ) ( not ( = ?auto_747301 ?auto_747307 ) ) ( not ( = ?auto_747301 ?auto_747308 ) ) ( not ( = ?auto_747302 ?auto_747303 ) ) ( not ( = ?auto_747302 ?auto_747304 ) ) ( not ( = ?auto_747302 ?auto_747305 ) ) ( not ( = ?auto_747302 ?auto_747306 ) ) ( not ( = ?auto_747302 ?auto_747307 ) ) ( not ( = ?auto_747302 ?auto_747308 ) ) ( not ( = ?auto_747303 ?auto_747304 ) ) ( not ( = ?auto_747303 ?auto_747305 ) ) ( not ( = ?auto_747303 ?auto_747306 ) ) ( not ( = ?auto_747303 ?auto_747307 ) ) ( not ( = ?auto_747303 ?auto_747308 ) ) ( not ( = ?auto_747304 ?auto_747305 ) ) ( not ( = ?auto_747304 ?auto_747306 ) ) ( not ( = ?auto_747304 ?auto_747307 ) ) ( not ( = ?auto_747304 ?auto_747308 ) ) ( not ( = ?auto_747305 ?auto_747306 ) ) ( not ( = ?auto_747305 ?auto_747307 ) ) ( not ( = ?auto_747305 ?auto_747308 ) ) ( not ( = ?auto_747306 ?auto_747307 ) ) ( not ( = ?auto_747306 ?auto_747308 ) ) ( not ( = ?auto_747307 ?auto_747308 ) ) ( ON ?auto_747306 ?auto_747307 ) ( CLEAR ?auto_747304 ) ( ON ?auto_747305 ?auto_747306 ) ( CLEAR ?auto_747305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_747290 ?auto_747291 ?auto_747292 ?auto_747293 ?auto_747294 ?auto_747295 ?auto_747296 ?auto_747297 ?auto_747298 ?auto_747299 ?auto_747300 ?auto_747301 ?auto_747302 ?auto_747303 ?auto_747304 ?auto_747305 )
      ( MAKE-18PILE ?auto_747290 ?auto_747291 ?auto_747292 ?auto_747293 ?auto_747294 ?auto_747295 ?auto_747296 ?auto_747297 ?auto_747298 ?auto_747299 ?auto_747300 ?auto_747301 ?auto_747302 ?auto_747303 ?auto_747304 ?auto_747305 ?auto_747306 ?auto_747307 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747327 - BLOCK
      ?auto_747328 - BLOCK
      ?auto_747329 - BLOCK
      ?auto_747330 - BLOCK
      ?auto_747331 - BLOCK
      ?auto_747332 - BLOCK
      ?auto_747333 - BLOCK
      ?auto_747334 - BLOCK
      ?auto_747335 - BLOCK
      ?auto_747336 - BLOCK
      ?auto_747337 - BLOCK
      ?auto_747338 - BLOCK
      ?auto_747339 - BLOCK
      ?auto_747340 - BLOCK
      ?auto_747341 - BLOCK
      ?auto_747342 - BLOCK
      ?auto_747343 - BLOCK
      ?auto_747344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_747344 ) ( ON-TABLE ?auto_747327 ) ( ON ?auto_747328 ?auto_747327 ) ( ON ?auto_747329 ?auto_747328 ) ( ON ?auto_747330 ?auto_747329 ) ( ON ?auto_747331 ?auto_747330 ) ( ON ?auto_747332 ?auto_747331 ) ( ON ?auto_747333 ?auto_747332 ) ( ON ?auto_747334 ?auto_747333 ) ( ON ?auto_747335 ?auto_747334 ) ( ON ?auto_747336 ?auto_747335 ) ( ON ?auto_747337 ?auto_747336 ) ( ON ?auto_747338 ?auto_747337 ) ( ON ?auto_747339 ?auto_747338 ) ( ON ?auto_747340 ?auto_747339 ) ( ON ?auto_747341 ?auto_747340 ) ( not ( = ?auto_747327 ?auto_747328 ) ) ( not ( = ?auto_747327 ?auto_747329 ) ) ( not ( = ?auto_747327 ?auto_747330 ) ) ( not ( = ?auto_747327 ?auto_747331 ) ) ( not ( = ?auto_747327 ?auto_747332 ) ) ( not ( = ?auto_747327 ?auto_747333 ) ) ( not ( = ?auto_747327 ?auto_747334 ) ) ( not ( = ?auto_747327 ?auto_747335 ) ) ( not ( = ?auto_747327 ?auto_747336 ) ) ( not ( = ?auto_747327 ?auto_747337 ) ) ( not ( = ?auto_747327 ?auto_747338 ) ) ( not ( = ?auto_747327 ?auto_747339 ) ) ( not ( = ?auto_747327 ?auto_747340 ) ) ( not ( = ?auto_747327 ?auto_747341 ) ) ( not ( = ?auto_747327 ?auto_747342 ) ) ( not ( = ?auto_747327 ?auto_747343 ) ) ( not ( = ?auto_747327 ?auto_747344 ) ) ( not ( = ?auto_747328 ?auto_747329 ) ) ( not ( = ?auto_747328 ?auto_747330 ) ) ( not ( = ?auto_747328 ?auto_747331 ) ) ( not ( = ?auto_747328 ?auto_747332 ) ) ( not ( = ?auto_747328 ?auto_747333 ) ) ( not ( = ?auto_747328 ?auto_747334 ) ) ( not ( = ?auto_747328 ?auto_747335 ) ) ( not ( = ?auto_747328 ?auto_747336 ) ) ( not ( = ?auto_747328 ?auto_747337 ) ) ( not ( = ?auto_747328 ?auto_747338 ) ) ( not ( = ?auto_747328 ?auto_747339 ) ) ( not ( = ?auto_747328 ?auto_747340 ) ) ( not ( = ?auto_747328 ?auto_747341 ) ) ( not ( = ?auto_747328 ?auto_747342 ) ) ( not ( = ?auto_747328 ?auto_747343 ) ) ( not ( = ?auto_747328 ?auto_747344 ) ) ( not ( = ?auto_747329 ?auto_747330 ) ) ( not ( = ?auto_747329 ?auto_747331 ) ) ( not ( = ?auto_747329 ?auto_747332 ) ) ( not ( = ?auto_747329 ?auto_747333 ) ) ( not ( = ?auto_747329 ?auto_747334 ) ) ( not ( = ?auto_747329 ?auto_747335 ) ) ( not ( = ?auto_747329 ?auto_747336 ) ) ( not ( = ?auto_747329 ?auto_747337 ) ) ( not ( = ?auto_747329 ?auto_747338 ) ) ( not ( = ?auto_747329 ?auto_747339 ) ) ( not ( = ?auto_747329 ?auto_747340 ) ) ( not ( = ?auto_747329 ?auto_747341 ) ) ( not ( = ?auto_747329 ?auto_747342 ) ) ( not ( = ?auto_747329 ?auto_747343 ) ) ( not ( = ?auto_747329 ?auto_747344 ) ) ( not ( = ?auto_747330 ?auto_747331 ) ) ( not ( = ?auto_747330 ?auto_747332 ) ) ( not ( = ?auto_747330 ?auto_747333 ) ) ( not ( = ?auto_747330 ?auto_747334 ) ) ( not ( = ?auto_747330 ?auto_747335 ) ) ( not ( = ?auto_747330 ?auto_747336 ) ) ( not ( = ?auto_747330 ?auto_747337 ) ) ( not ( = ?auto_747330 ?auto_747338 ) ) ( not ( = ?auto_747330 ?auto_747339 ) ) ( not ( = ?auto_747330 ?auto_747340 ) ) ( not ( = ?auto_747330 ?auto_747341 ) ) ( not ( = ?auto_747330 ?auto_747342 ) ) ( not ( = ?auto_747330 ?auto_747343 ) ) ( not ( = ?auto_747330 ?auto_747344 ) ) ( not ( = ?auto_747331 ?auto_747332 ) ) ( not ( = ?auto_747331 ?auto_747333 ) ) ( not ( = ?auto_747331 ?auto_747334 ) ) ( not ( = ?auto_747331 ?auto_747335 ) ) ( not ( = ?auto_747331 ?auto_747336 ) ) ( not ( = ?auto_747331 ?auto_747337 ) ) ( not ( = ?auto_747331 ?auto_747338 ) ) ( not ( = ?auto_747331 ?auto_747339 ) ) ( not ( = ?auto_747331 ?auto_747340 ) ) ( not ( = ?auto_747331 ?auto_747341 ) ) ( not ( = ?auto_747331 ?auto_747342 ) ) ( not ( = ?auto_747331 ?auto_747343 ) ) ( not ( = ?auto_747331 ?auto_747344 ) ) ( not ( = ?auto_747332 ?auto_747333 ) ) ( not ( = ?auto_747332 ?auto_747334 ) ) ( not ( = ?auto_747332 ?auto_747335 ) ) ( not ( = ?auto_747332 ?auto_747336 ) ) ( not ( = ?auto_747332 ?auto_747337 ) ) ( not ( = ?auto_747332 ?auto_747338 ) ) ( not ( = ?auto_747332 ?auto_747339 ) ) ( not ( = ?auto_747332 ?auto_747340 ) ) ( not ( = ?auto_747332 ?auto_747341 ) ) ( not ( = ?auto_747332 ?auto_747342 ) ) ( not ( = ?auto_747332 ?auto_747343 ) ) ( not ( = ?auto_747332 ?auto_747344 ) ) ( not ( = ?auto_747333 ?auto_747334 ) ) ( not ( = ?auto_747333 ?auto_747335 ) ) ( not ( = ?auto_747333 ?auto_747336 ) ) ( not ( = ?auto_747333 ?auto_747337 ) ) ( not ( = ?auto_747333 ?auto_747338 ) ) ( not ( = ?auto_747333 ?auto_747339 ) ) ( not ( = ?auto_747333 ?auto_747340 ) ) ( not ( = ?auto_747333 ?auto_747341 ) ) ( not ( = ?auto_747333 ?auto_747342 ) ) ( not ( = ?auto_747333 ?auto_747343 ) ) ( not ( = ?auto_747333 ?auto_747344 ) ) ( not ( = ?auto_747334 ?auto_747335 ) ) ( not ( = ?auto_747334 ?auto_747336 ) ) ( not ( = ?auto_747334 ?auto_747337 ) ) ( not ( = ?auto_747334 ?auto_747338 ) ) ( not ( = ?auto_747334 ?auto_747339 ) ) ( not ( = ?auto_747334 ?auto_747340 ) ) ( not ( = ?auto_747334 ?auto_747341 ) ) ( not ( = ?auto_747334 ?auto_747342 ) ) ( not ( = ?auto_747334 ?auto_747343 ) ) ( not ( = ?auto_747334 ?auto_747344 ) ) ( not ( = ?auto_747335 ?auto_747336 ) ) ( not ( = ?auto_747335 ?auto_747337 ) ) ( not ( = ?auto_747335 ?auto_747338 ) ) ( not ( = ?auto_747335 ?auto_747339 ) ) ( not ( = ?auto_747335 ?auto_747340 ) ) ( not ( = ?auto_747335 ?auto_747341 ) ) ( not ( = ?auto_747335 ?auto_747342 ) ) ( not ( = ?auto_747335 ?auto_747343 ) ) ( not ( = ?auto_747335 ?auto_747344 ) ) ( not ( = ?auto_747336 ?auto_747337 ) ) ( not ( = ?auto_747336 ?auto_747338 ) ) ( not ( = ?auto_747336 ?auto_747339 ) ) ( not ( = ?auto_747336 ?auto_747340 ) ) ( not ( = ?auto_747336 ?auto_747341 ) ) ( not ( = ?auto_747336 ?auto_747342 ) ) ( not ( = ?auto_747336 ?auto_747343 ) ) ( not ( = ?auto_747336 ?auto_747344 ) ) ( not ( = ?auto_747337 ?auto_747338 ) ) ( not ( = ?auto_747337 ?auto_747339 ) ) ( not ( = ?auto_747337 ?auto_747340 ) ) ( not ( = ?auto_747337 ?auto_747341 ) ) ( not ( = ?auto_747337 ?auto_747342 ) ) ( not ( = ?auto_747337 ?auto_747343 ) ) ( not ( = ?auto_747337 ?auto_747344 ) ) ( not ( = ?auto_747338 ?auto_747339 ) ) ( not ( = ?auto_747338 ?auto_747340 ) ) ( not ( = ?auto_747338 ?auto_747341 ) ) ( not ( = ?auto_747338 ?auto_747342 ) ) ( not ( = ?auto_747338 ?auto_747343 ) ) ( not ( = ?auto_747338 ?auto_747344 ) ) ( not ( = ?auto_747339 ?auto_747340 ) ) ( not ( = ?auto_747339 ?auto_747341 ) ) ( not ( = ?auto_747339 ?auto_747342 ) ) ( not ( = ?auto_747339 ?auto_747343 ) ) ( not ( = ?auto_747339 ?auto_747344 ) ) ( not ( = ?auto_747340 ?auto_747341 ) ) ( not ( = ?auto_747340 ?auto_747342 ) ) ( not ( = ?auto_747340 ?auto_747343 ) ) ( not ( = ?auto_747340 ?auto_747344 ) ) ( not ( = ?auto_747341 ?auto_747342 ) ) ( not ( = ?auto_747341 ?auto_747343 ) ) ( not ( = ?auto_747341 ?auto_747344 ) ) ( not ( = ?auto_747342 ?auto_747343 ) ) ( not ( = ?auto_747342 ?auto_747344 ) ) ( not ( = ?auto_747343 ?auto_747344 ) ) ( ON ?auto_747343 ?auto_747344 ) ( CLEAR ?auto_747341 ) ( ON ?auto_747342 ?auto_747343 ) ( CLEAR ?auto_747342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_747327 ?auto_747328 ?auto_747329 ?auto_747330 ?auto_747331 ?auto_747332 ?auto_747333 ?auto_747334 ?auto_747335 ?auto_747336 ?auto_747337 ?auto_747338 ?auto_747339 ?auto_747340 ?auto_747341 ?auto_747342 )
      ( MAKE-18PILE ?auto_747327 ?auto_747328 ?auto_747329 ?auto_747330 ?auto_747331 ?auto_747332 ?auto_747333 ?auto_747334 ?auto_747335 ?auto_747336 ?auto_747337 ?auto_747338 ?auto_747339 ?auto_747340 ?auto_747341 ?auto_747342 ?auto_747343 ?auto_747344 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747363 - BLOCK
      ?auto_747364 - BLOCK
      ?auto_747365 - BLOCK
      ?auto_747366 - BLOCK
      ?auto_747367 - BLOCK
      ?auto_747368 - BLOCK
      ?auto_747369 - BLOCK
      ?auto_747370 - BLOCK
      ?auto_747371 - BLOCK
      ?auto_747372 - BLOCK
      ?auto_747373 - BLOCK
      ?auto_747374 - BLOCK
      ?auto_747375 - BLOCK
      ?auto_747376 - BLOCK
      ?auto_747377 - BLOCK
      ?auto_747378 - BLOCK
      ?auto_747379 - BLOCK
      ?auto_747380 - BLOCK
    )
    :vars
    (
      ?auto_747381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747380 ?auto_747381 ) ( ON-TABLE ?auto_747363 ) ( ON ?auto_747364 ?auto_747363 ) ( ON ?auto_747365 ?auto_747364 ) ( ON ?auto_747366 ?auto_747365 ) ( ON ?auto_747367 ?auto_747366 ) ( ON ?auto_747368 ?auto_747367 ) ( ON ?auto_747369 ?auto_747368 ) ( ON ?auto_747370 ?auto_747369 ) ( ON ?auto_747371 ?auto_747370 ) ( ON ?auto_747372 ?auto_747371 ) ( ON ?auto_747373 ?auto_747372 ) ( ON ?auto_747374 ?auto_747373 ) ( ON ?auto_747375 ?auto_747374 ) ( ON ?auto_747376 ?auto_747375 ) ( not ( = ?auto_747363 ?auto_747364 ) ) ( not ( = ?auto_747363 ?auto_747365 ) ) ( not ( = ?auto_747363 ?auto_747366 ) ) ( not ( = ?auto_747363 ?auto_747367 ) ) ( not ( = ?auto_747363 ?auto_747368 ) ) ( not ( = ?auto_747363 ?auto_747369 ) ) ( not ( = ?auto_747363 ?auto_747370 ) ) ( not ( = ?auto_747363 ?auto_747371 ) ) ( not ( = ?auto_747363 ?auto_747372 ) ) ( not ( = ?auto_747363 ?auto_747373 ) ) ( not ( = ?auto_747363 ?auto_747374 ) ) ( not ( = ?auto_747363 ?auto_747375 ) ) ( not ( = ?auto_747363 ?auto_747376 ) ) ( not ( = ?auto_747363 ?auto_747377 ) ) ( not ( = ?auto_747363 ?auto_747378 ) ) ( not ( = ?auto_747363 ?auto_747379 ) ) ( not ( = ?auto_747363 ?auto_747380 ) ) ( not ( = ?auto_747363 ?auto_747381 ) ) ( not ( = ?auto_747364 ?auto_747365 ) ) ( not ( = ?auto_747364 ?auto_747366 ) ) ( not ( = ?auto_747364 ?auto_747367 ) ) ( not ( = ?auto_747364 ?auto_747368 ) ) ( not ( = ?auto_747364 ?auto_747369 ) ) ( not ( = ?auto_747364 ?auto_747370 ) ) ( not ( = ?auto_747364 ?auto_747371 ) ) ( not ( = ?auto_747364 ?auto_747372 ) ) ( not ( = ?auto_747364 ?auto_747373 ) ) ( not ( = ?auto_747364 ?auto_747374 ) ) ( not ( = ?auto_747364 ?auto_747375 ) ) ( not ( = ?auto_747364 ?auto_747376 ) ) ( not ( = ?auto_747364 ?auto_747377 ) ) ( not ( = ?auto_747364 ?auto_747378 ) ) ( not ( = ?auto_747364 ?auto_747379 ) ) ( not ( = ?auto_747364 ?auto_747380 ) ) ( not ( = ?auto_747364 ?auto_747381 ) ) ( not ( = ?auto_747365 ?auto_747366 ) ) ( not ( = ?auto_747365 ?auto_747367 ) ) ( not ( = ?auto_747365 ?auto_747368 ) ) ( not ( = ?auto_747365 ?auto_747369 ) ) ( not ( = ?auto_747365 ?auto_747370 ) ) ( not ( = ?auto_747365 ?auto_747371 ) ) ( not ( = ?auto_747365 ?auto_747372 ) ) ( not ( = ?auto_747365 ?auto_747373 ) ) ( not ( = ?auto_747365 ?auto_747374 ) ) ( not ( = ?auto_747365 ?auto_747375 ) ) ( not ( = ?auto_747365 ?auto_747376 ) ) ( not ( = ?auto_747365 ?auto_747377 ) ) ( not ( = ?auto_747365 ?auto_747378 ) ) ( not ( = ?auto_747365 ?auto_747379 ) ) ( not ( = ?auto_747365 ?auto_747380 ) ) ( not ( = ?auto_747365 ?auto_747381 ) ) ( not ( = ?auto_747366 ?auto_747367 ) ) ( not ( = ?auto_747366 ?auto_747368 ) ) ( not ( = ?auto_747366 ?auto_747369 ) ) ( not ( = ?auto_747366 ?auto_747370 ) ) ( not ( = ?auto_747366 ?auto_747371 ) ) ( not ( = ?auto_747366 ?auto_747372 ) ) ( not ( = ?auto_747366 ?auto_747373 ) ) ( not ( = ?auto_747366 ?auto_747374 ) ) ( not ( = ?auto_747366 ?auto_747375 ) ) ( not ( = ?auto_747366 ?auto_747376 ) ) ( not ( = ?auto_747366 ?auto_747377 ) ) ( not ( = ?auto_747366 ?auto_747378 ) ) ( not ( = ?auto_747366 ?auto_747379 ) ) ( not ( = ?auto_747366 ?auto_747380 ) ) ( not ( = ?auto_747366 ?auto_747381 ) ) ( not ( = ?auto_747367 ?auto_747368 ) ) ( not ( = ?auto_747367 ?auto_747369 ) ) ( not ( = ?auto_747367 ?auto_747370 ) ) ( not ( = ?auto_747367 ?auto_747371 ) ) ( not ( = ?auto_747367 ?auto_747372 ) ) ( not ( = ?auto_747367 ?auto_747373 ) ) ( not ( = ?auto_747367 ?auto_747374 ) ) ( not ( = ?auto_747367 ?auto_747375 ) ) ( not ( = ?auto_747367 ?auto_747376 ) ) ( not ( = ?auto_747367 ?auto_747377 ) ) ( not ( = ?auto_747367 ?auto_747378 ) ) ( not ( = ?auto_747367 ?auto_747379 ) ) ( not ( = ?auto_747367 ?auto_747380 ) ) ( not ( = ?auto_747367 ?auto_747381 ) ) ( not ( = ?auto_747368 ?auto_747369 ) ) ( not ( = ?auto_747368 ?auto_747370 ) ) ( not ( = ?auto_747368 ?auto_747371 ) ) ( not ( = ?auto_747368 ?auto_747372 ) ) ( not ( = ?auto_747368 ?auto_747373 ) ) ( not ( = ?auto_747368 ?auto_747374 ) ) ( not ( = ?auto_747368 ?auto_747375 ) ) ( not ( = ?auto_747368 ?auto_747376 ) ) ( not ( = ?auto_747368 ?auto_747377 ) ) ( not ( = ?auto_747368 ?auto_747378 ) ) ( not ( = ?auto_747368 ?auto_747379 ) ) ( not ( = ?auto_747368 ?auto_747380 ) ) ( not ( = ?auto_747368 ?auto_747381 ) ) ( not ( = ?auto_747369 ?auto_747370 ) ) ( not ( = ?auto_747369 ?auto_747371 ) ) ( not ( = ?auto_747369 ?auto_747372 ) ) ( not ( = ?auto_747369 ?auto_747373 ) ) ( not ( = ?auto_747369 ?auto_747374 ) ) ( not ( = ?auto_747369 ?auto_747375 ) ) ( not ( = ?auto_747369 ?auto_747376 ) ) ( not ( = ?auto_747369 ?auto_747377 ) ) ( not ( = ?auto_747369 ?auto_747378 ) ) ( not ( = ?auto_747369 ?auto_747379 ) ) ( not ( = ?auto_747369 ?auto_747380 ) ) ( not ( = ?auto_747369 ?auto_747381 ) ) ( not ( = ?auto_747370 ?auto_747371 ) ) ( not ( = ?auto_747370 ?auto_747372 ) ) ( not ( = ?auto_747370 ?auto_747373 ) ) ( not ( = ?auto_747370 ?auto_747374 ) ) ( not ( = ?auto_747370 ?auto_747375 ) ) ( not ( = ?auto_747370 ?auto_747376 ) ) ( not ( = ?auto_747370 ?auto_747377 ) ) ( not ( = ?auto_747370 ?auto_747378 ) ) ( not ( = ?auto_747370 ?auto_747379 ) ) ( not ( = ?auto_747370 ?auto_747380 ) ) ( not ( = ?auto_747370 ?auto_747381 ) ) ( not ( = ?auto_747371 ?auto_747372 ) ) ( not ( = ?auto_747371 ?auto_747373 ) ) ( not ( = ?auto_747371 ?auto_747374 ) ) ( not ( = ?auto_747371 ?auto_747375 ) ) ( not ( = ?auto_747371 ?auto_747376 ) ) ( not ( = ?auto_747371 ?auto_747377 ) ) ( not ( = ?auto_747371 ?auto_747378 ) ) ( not ( = ?auto_747371 ?auto_747379 ) ) ( not ( = ?auto_747371 ?auto_747380 ) ) ( not ( = ?auto_747371 ?auto_747381 ) ) ( not ( = ?auto_747372 ?auto_747373 ) ) ( not ( = ?auto_747372 ?auto_747374 ) ) ( not ( = ?auto_747372 ?auto_747375 ) ) ( not ( = ?auto_747372 ?auto_747376 ) ) ( not ( = ?auto_747372 ?auto_747377 ) ) ( not ( = ?auto_747372 ?auto_747378 ) ) ( not ( = ?auto_747372 ?auto_747379 ) ) ( not ( = ?auto_747372 ?auto_747380 ) ) ( not ( = ?auto_747372 ?auto_747381 ) ) ( not ( = ?auto_747373 ?auto_747374 ) ) ( not ( = ?auto_747373 ?auto_747375 ) ) ( not ( = ?auto_747373 ?auto_747376 ) ) ( not ( = ?auto_747373 ?auto_747377 ) ) ( not ( = ?auto_747373 ?auto_747378 ) ) ( not ( = ?auto_747373 ?auto_747379 ) ) ( not ( = ?auto_747373 ?auto_747380 ) ) ( not ( = ?auto_747373 ?auto_747381 ) ) ( not ( = ?auto_747374 ?auto_747375 ) ) ( not ( = ?auto_747374 ?auto_747376 ) ) ( not ( = ?auto_747374 ?auto_747377 ) ) ( not ( = ?auto_747374 ?auto_747378 ) ) ( not ( = ?auto_747374 ?auto_747379 ) ) ( not ( = ?auto_747374 ?auto_747380 ) ) ( not ( = ?auto_747374 ?auto_747381 ) ) ( not ( = ?auto_747375 ?auto_747376 ) ) ( not ( = ?auto_747375 ?auto_747377 ) ) ( not ( = ?auto_747375 ?auto_747378 ) ) ( not ( = ?auto_747375 ?auto_747379 ) ) ( not ( = ?auto_747375 ?auto_747380 ) ) ( not ( = ?auto_747375 ?auto_747381 ) ) ( not ( = ?auto_747376 ?auto_747377 ) ) ( not ( = ?auto_747376 ?auto_747378 ) ) ( not ( = ?auto_747376 ?auto_747379 ) ) ( not ( = ?auto_747376 ?auto_747380 ) ) ( not ( = ?auto_747376 ?auto_747381 ) ) ( not ( = ?auto_747377 ?auto_747378 ) ) ( not ( = ?auto_747377 ?auto_747379 ) ) ( not ( = ?auto_747377 ?auto_747380 ) ) ( not ( = ?auto_747377 ?auto_747381 ) ) ( not ( = ?auto_747378 ?auto_747379 ) ) ( not ( = ?auto_747378 ?auto_747380 ) ) ( not ( = ?auto_747378 ?auto_747381 ) ) ( not ( = ?auto_747379 ?auto_747380 ) ) ( not ( = ?auto_747379 ?auto_747381 ) ) ( not ( = ?auto_747380 ?auto_747381 ) ) ( ON ?auto_747379 ?auto_747380 ) ( ON ?auto_747378 ?auto_747379 ) ( CLEAR ?auto_747376 ) ( ON ?auto_747377 ?auto_747378 ) ( CLEAR ?auto_747377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_747363 ?auto_747364 ?auto_747365 ?auto_747366 ?auto_747367 ?auto_747368 ?auto_747369 ?auto_747370 ?auto_747371 ?auto_747372 ?auto_747373 ?auto_747374 ?auto_747375 ?auto_747376 ?auto_747377 )
      ( MAKE-18PILE ?auto_747363 ?auto_747364 ?auto_747365 ?auto_747366 ?auto_747367 ?auto_747368 ?auto_747369 ?auto_747370 ?auto_747371 ?auto_747372 ?auto_747373 ?auto_747374 ?auto_747375 ?auto_747376 ?auto_747377 ?auto_747378 ?auto_747379 ?auto_747380 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747400 - BLOCK
      ?auto_747401 - BLOCK
      ?auto_747402 - BLOCK
      ?auto_747403 - BLOCK
      ?auto_747404 - BLOCK
      ?auto_747405 - BLOCK
      ?auto_747406 - BLOCK
      ?auto_747407 - BLOCK
      ?auto_747408 - BLOCK
      ?auto_747409 - BLOCK
      ?auto_747410 - BLOCK
      ?auto_747411 - BLOCK
      ?auto_747412 - BLOCK
      ?auto_747413 - BLOCK
      ?auto_747414 - BLOCK
      ?auto_747415 - BLOCK
      ?auto_747416 - BLOCK
      ?auto_747417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_747417 ) ( ON-TABLE ?auto_747400 ) ( ON ?auto_747401 ?auto_747400 ) ( ON ?auto_747402 ?auto_747401 ) ( ON ?auto_747403 ?auto_747402 ) ( ON ?auto_747404 ?auto_747403 ) ( ON ?auto_747405 ?auto_747404 ) ( ON ?auto_747406 ?auto_747405 ) ( ON ?auto_747407 ?auto_747406 ) ( ON ?auto_747408 ?auto_747407 ) ( ON ?auto_747409 ?auto_747408 ) ( ON ?auto_747410 ?auto_747409 ) ( ON ?auto_747411 ?auto_747410 ) ( ON ?auto_747412 ?auto_747411 ) ( ON ?auto_747413 ?auto_747412 ) ( not ( = ?auto_747400 ?auto_747401 ) ) ( not ( = ?auto_747400 ?auto_747402 ) ) ( not ( = ?auto_747400 ?auto_747403 ) ) ( not ( = ?auto_747400 ?auto_747404 ) ) ( not ( = ?auto_747400 ?auto_747405 ) ) ( not ( = ?auto_747400 ?auto_747406 ) ) ( not ( = ?auto_747400 ?auto_747407 ) ) ( not ( = ?auto_747400 ?auto_747408 ) ) ( not ( = ?auto_747400 ?auto_747409 ) ) ( not ( = ?auto_747400 ?auto_747410 ) ) ( not ( = ?auto_747400 ?auto_747411 ) ) ( not ( = ?auto_747400 ?auto_747412 ) ) ( not ( = ?auto_747400 ?auto_747413 ) ) ( not ( = ?auto_747400 ?auto_747414 ) ) ( not ( = ?auto_747400 ?auto_747415 ) ) ( not ( = ?auto_747400 ?auto_747416 ) ) ( not ( = ?auto_747400 ?auto_747417 ) ) ( not ( = ?auto_747401 ?auto_747402 ) ) ( not ( = ?auto_747401 ?auto_747403 ) ) ( not ( = ?auto_747401 ?auto_747404 ) ) ( not ( = ?auto_747401 ?auto_747405 ) ) ( not ( = ?auto_747401 ?auto_747406 ) ) ( not ( = ?auto_747401 ?auto_747407 ) ) ( not ( = ?auto_747401 ?auto_747408 ) ) ( not ( = ?auto_747401 ?auto_747409 ) ) ( not ( = ?auto_747401 ?auto_747410 ) ) ( not ( = ?auto_747401 ?auto_747411 ) ) ( not ( = ?auto_747401 ?auto_747412 ) ) ( not ( = ?auto_747401 ?auto_747413 ) ) ( not ( = ?auto_747401 ?auto_747414 ) ) ( not ( = ?auto_747401 ?auto_747415 ) ) ( not ( = ?auto_747401 ?auto_747416 ) ) ( not ( = ?auto_747401 ?auto_747417 ) ) ( not ( = ?auto_747402 ?auto_747403 ) ) ( not ( = ?auto_747402 ?auto_747404 ) ) ( not ( = ?auto_747402 ?auto_747405 ) ) ( not ( = ?auto_747402 ?auto_747406 ) ) ( not ( = ?auto_747402 ?auto_747407 ) ) ( not ( = ?auto_747402 ?auto_747408 ) ) ( not ( = ?auto_747402 ?auto_747409 ) ) ( not ( = ?auto_747402 ?auto_747410 ) ) ( not ( = ?auto_747402 ?auto_747411 ) ) ( not ( = ?auto_747402 ?auto_747412 ) ) ( not ( = ?auto_747402 ?auto_747413 ) ) ( not ( = ?auto_747402 ?auto_747414 ) ) ( not ( = ?auto_747402 ?auto_747415 ) ) ( not ( = ?auto_747402 ?auto_747416 ) ) ( not ( = ?auto_747402 ?auto_747417 ) ) ( not ( = ?auto_747403 ?auto_747404 ) ) ( not ( = ?auto_747403 ?auto_747405 ) ) ( not ( = ?auto_747403 ?auto_747406 ) ) ( not ( = ?auto_747403 ?auto_747407 ) ) ( not ( = ?auto_747403 ?auto_747408 ) ) ( not ( = ?auto_747403 ?auto_747409 ) ) ( not ( = ?auto_747403 ?auto_747410 ) ) ( not ( = ?auto_747403 ?auto_747411 ) ) ( not ( = ?auto_747403 ?auto_747412 ) ) ( not ( = ?auto_747403 ?auto_747413 ) ) ( not ( = ?auto_747403 ?auto_747414 ) ) ( not ( = ?auto_747403 ?auto_747415 ) ) ( not ( = ?auto_747403 ?auto_747416 ) ) ( not ( = ?auto_747403 ?auto_747417 ) ) ( not ( = ?auto_747404 ?auto_747405 ) ) ( not ( = ?auto_747404 ?auto_747406 ) ) ( not ( = ?auto_747404 ?auto_747407 ) ) ( not ( = ?auto_747404 ?auto_747408 ) ) ( not ( = ?auto_747404 ?auto_747409 ) ) ( not ( = ?auto_747404 ?auto_747410 ) ) ( not ( = ?auto_747404 ?auto_747411 ) ) ( not ( = ?auto_747404 ?auto_747412 ) ) ( not ( = ?auto_747404 ?auto_747413 ) ) ( not ( = ?auto_747404 ?auto_747414 ) ) ( not ( = ?auto_747404 ?auto_747415 ) ) ( not ( = ?auto_747404 ?auto_747416 ) ) ( not ( = ?auto_747404 ?auto_747417 ) ) ( not ( = ?auto_747405 ?auto_747406 ) ) ( not ( = ?auto_747405 ?auto_747407 ) ) ( not ( = ?auto_747405 ?auto_747408 ) ) ( not ( = ?auto_747405 ?auto_747409 ) ) ( not ( = ?auto_747405 ?auto_747410 ) ) ( not ( = ?auto_747405 ?auto_747411 ) ) ( not ( = ?auto_747405 ?auto_747412 ) ) ( not ( = ?auto_747405 ?auto_747413 ) ) ( not ( = ?auto_747405 ?auto_747414 ) ) ( not ( = ?auto_747405 ?auto_747415 ) ) ( not ( = ?auto_747405 ?auto_747416 ) ) ( not ( = ?auto_747405 ?auto_747417 ) ) ( not ( = ?auto_747406 ?auto_747407 ) ) ( not ( = ?auto_747406 ?auto_747408 ) ) ( not ( = ?auto_747406 ?auto_747409 ) ) ( not ( = ?auto_747406 ?auto_747410 ) ) ( not ( = ?auto_747406 ?auto_747411 ) ) ( not ( = ?auto_747406 ?auto_747412 ) ) ( not ( = ?auto_747406 ?auto_747413 ) ) ( not ( = ?auto_747406 ?auto_747414 ) ) ( not ( = ?auto_747406 ?auto_747415 ) ) ( not ( = ?auto_747406 ?auto_747416 ) ) ( not ( = ?auto_747406 ?auto_747417 ) ) ( not ( = ?auto_747407 ?auto_747408 ) ) ( not ( = ?auto_747407 ?auto_747409 ) ) ( not ( = ?auto_747407 ?auto_747410 ) ) ( not ( = ?auto_747407 ?auto_747411 ) ) ( not ( = ?auto_747407 ?auto_747412 ) ) ( not ( = ?auto_747407 ?auto_747413 ) ) ( not ( = ?auto_747407 ?auto_747414 ) ) ( not ( = ?auto_747407 ?auto_747415 ) ) ( not ( = ?auto_747407 ?auto_747416 ) ) ( not ( = ?auto_747407 ?auto_747417 ) ) ( not ( = ?auto_747408 ?auto_747409 ) ) ( not ( = ?auto_747408 ?auto_747410 ) ) ( not ( = ?auto_747408 ?auto_747411 ) ) ( not ( = ?auto_747408 ?auto_747412 ) ) ( not ( = ?auto_747408 ?auto_747413 ) ) ( not ( = ?auto_747408 ?auto_747414 ) ) ( not ( = ?auto_747408 ?auto_747415 ) ) ( not ( = ?auto_747408 ?auto_747416 ) ) ( not ( = ?auto_747408 ?auto_747417 ) ) ( not ( = ?auto_747409 ?auto_747410 ) ) ( not ( = ?auto_747409 ?auto_747411 ) ) ( not ( = ?auto_747409 ?auto_747412 ) ) ( not ( = ?auto_747409 ?auto_747413 ) ) ( not ( = ?auto_747409 ?auto_747414 ) ) ( not ( = ?auto_747409 ?auto_747415 ) ) ( not ( = ?auto_747409 ?auto_747416 ) ) ( not ( = ?auto_747409 ?auto_747417 ) ) ( not ( = ?auto_747410 ?auto_747411 ) ) ( not ( = ?auto_747410 ?auto_747412 ) ) ( not ( = ?auto_747410 ?auto_747413 ) ) ( not ( = ?auto_747410 ?auto_747414 ) ) ( not ( = ?auto_747410 ?auto_747415 ) ) ( not ( = ?auto_747410 ?auto_747416 ) ) ( not ( = ?auto_747410 ?auto_747417 ) ) ( not ( = ?auto_747411 ?auto_747412 ) ) ( not ( = ?auto_747411 ?auto_747413 ) ) ( not ( = ?auto_747411 ?auto_747414 ) ) ( not ( = ?auto_747411 ?auto_747415 ) ) ( not ( = ?auto_747411 ?auto_747416 ) ) ( not ( = ?auto_747411 ?auto_747417 ) ) ( not ( = ?auto_747412 ?auto_747413 ) ) ( not ( = ?auto_747412 ?auto_747414 ) ) ( not ( = ?auto_747412 ?auto_747415 ) ) ( not ( = ?auto_747412 ?auto_747416 ) ) ( not ( = ?auto_747412 ?auto_747417 ) ) ( not ( = ?auto_747413 ?auto_747414 ) ) ( not ( = ?auto_747413 ?auto_747415 ) ) ( not ( = ?auto_747413 ?auto_747416 ) ) ( not ( = ?auto_747413 ?auto_747417 ) ) ( not ( = ?auto_747414 ?auto_747415 ) ) ( not ( = ?auto_747414 ?auto_747416 ) ) ( not ( = ?auto_747414 ?auto_747417 ) ) ( not ( = ?auto_747415 ?auto_747416 ) ) ( not ( = ?auto_747415 ?auto_747417 ) ) ( not ( = ?auto_747416 ?auto_747417 ) ) ( ON ?auto_747416 ?auto_747417 ) ( ON ?auto_747415 ?auto_747416 ) ( CLEAR ?auto_747413 ) ( ON ?auto_747414 ?auto_747415 ) ( CLEAR ?auto_747414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_747400 ?auto_747401 ?auto_747402 ?auto_747403 ?auto_747404 ?auto_747405 ?auto_747406 ?auto_747407 ?auto_747408 ?auto_747409 ?auto_747410 ?auto_747411 ?auto_747412 ?auto_747413 ?auto_747414 )
      ( MAKE-18PILE ?auto_747400 ?auto_747401 ?auto_747402 ?auto_747403 ?auto_747404 ?auto_747405 ?auto_747406 ?auto_747407 ?auto_747408 ?auto_747409 ?auto_747410 ?auto_747411 ?auto_747412 ?auto_747413 ?auto_747414 ?auto_747415 ?auto_747416 ?auto_747417 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747436 - BLOCK
      ?auto_747437 - BLOCK
      ?auto_747438 - BLOCK
      ?auto_747439 - BLOCK
      ?auto_747440 - BLOCK
      ?auto_747441 - BLOCK
      ?auto_747442 - BLOCK
      ?auto_747443 - BLOCK
      ?auto_747444 - BLOCK
      ?auto_747445 - BLOCK
      ?auto_747446 - BLOCK
      ?auto_747447 - BLOCK
      ?auto_747448 - BLOCK
      ?auto_747449 - BLOCK
      ?auto_747450 - BLOCK
      ?auto_747451 - BLOCK
      ?auto_747452 - BLOCK
      ?auto_747453 - BLOCK
    )
    :vars
    (
      ?auto_747454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747453 ?auto_747454 ) ( ON-TABLE ?auto_747436 ) ( ON ?auto_747437 ?auto_747436 ) ( ON ?auto_747438 ?auto_747437 ) ( ON ?auto_747439 ?auto_747438 ) ( ON ?auto_747440 ?auto_747439 ) ( ON ?auto_747441 ?auto_747440 ) ( ON ?auto_747442 ?auto_747441 ) ( ON ?auto_747443 ?auto_747442 ) ( ON ?auto_747444 ?auto_747443 ) ( ON ?auto_747445 ?auto_747444 ) ( ON ?auto_747446 ?auto_747445 ) ( ON ?auto_747447 ?auto_747446 ) ( ON ?auto_747448 ?auto_747447 ) ( not ( = ?auto_747436 ?auto_747437 ) ) ( not ( = ?auto_747436 ?auto_747438 ) ) ( not ( = ?auto_747436 ?auto_747439 ) ) ( not ( = ?auto_747436 ?auto_747440 ) ) ( not ( = ?auto_747436 ?auto_747441 ) ) ( not ( = ?auto_747436 ?auto_747442 ) ) ( not ( = ?auto_747436 ?auto_747443 ) ) ( not ( = ?auto_747436 ?auto_747444 ) ) ( not ( = ?auto_747436 ?auto_747445 ) ) ( not ( = ?auto_747436 ?auto_747446 ) ) ( not ( = ?auto_747436 ?auto_747447 ) ) ( not ( = ?auto_747436 ?auto_747448 ) ) ( not ( = ?auto_747436 ?auto_747449 ) ) ( not ( = ?auto_747436 ?auto_747450 ) ) ( not ( = ?auto_747436 ?auto_747451 ) ) ( not ( = ?auto_747436 ?auto_747452 ) ) ( not ( = ?auto_747436 ?auto_747453 ) ) ( not ( = ?auto_747436 ?auto_747454 ) ) ( not ( = ?auto_747437 ?auto_747438 ) ) ( not ( = ?auto_747437 ?auto_747439 ) ) ( not ( = ?auto_747437 ?auto_747440 ) ) ( not ( = ?auto_747437 ?auto_747441 ) ) ( not ( = ?auto_747437 ?auto_747442 ) ) ( not ( = ?auto_747437 ?auto_747443 ) ) ( not ( = ?auto_747437 ?auto_747444 ) ) ( not ( = ?auto_747437 ?auto_747445 ) ) ( not ( = ?auto_747437 ?auto_747446 ) ) ( not ( = ?auto_747437 ?auto_747447 ) ) ( not ( = ?auto_747437 ?auto_747448 ) ) ( not ( = ?auto_747437 ?auto_747449 ) ) ( not ( = ?auto_747437 ?auto_747450 ) ) ( not ( = ?auto_747437 ?auto_747451 ) ) ( not ( = ?auto_747437 ?auto_747452 ) ) ( not ( = ?auto_747437 ?auto_747453 ) ) ( not ( = ?auto_747437 ?auto_747454 ) ) ( not ( = ?auto_747438 ?auto_747439 ) ) ( not ( = ?auto_747438 ?auto_747440 ) ) ( not ( = ?auto_747438 ?auto_747441 ) ) ( not ( = ?auto_747438 ?auto_747442 ) ) ( not ( = ?auto_747438 ?auto_747443 ) ) ( not ( = ?auto_747438 ?auto_747444 ) ) ( not ( = ?auto_747438 ?auto_747445 ) ) ( not ( = ?auto_747438 ?auto_747446 ) ) ( not ( = ?auto_747438 ?auto_747447 ) ) ( not ( = ?auto_747438 ?auto_747448 ) ) ( not ( = ?auto_747438 ?auto_747449 ) ) ( not ( = ?auto_747438 ?auto_747450 ) ) ( not ( = ?auto_747438 ?auto_747451 ) ) ( not ( = ?auto_747438 ?auto_747452 ) ) ( not ( = ?auto_747438 ?auto_747453 ) ) ( not ( = ?auto_747438 ?auto_747454 ) ) ( not ( = ?auto_747439 ?auto_747440 ) ) ( not ( = ?auto_747439 ?auto_747441 ) ) ( not ( = ?auto_747439 ?auto_747442 ) ) ( not ( = ?auto_747439 ?auto_747443 ) ) ( not ( = ?auto_747439 ?auto_747444 ) ) ( not ( = ?auto_747439 ?auto_747445 ) ) ( not ( = ?auto_747439 ?auto_747446 ) ) ( not ( = ?auto_747439 ?auto_747447 ) ) ( not ( = ?auto_747439 ?auto_747448 ) ) ( not ( = ?auto_747439 ?auto_747449 ) ) ( not ( = ?auto_747439 ?auto_747450 ) ) ( not ( = ?auto_747439 ?auto_747451 ) ) ( not ( = ?auto_747439 ?auto_747452 ) ) ( not ( = ?auto_747439 ?auto_747453 ) ) ( not ( = ?auto_747439 ?auto_747454 ) ) ( not ( = ?auto_747440 ?auto_747441 ) ) ( not ( = ?auto_747440 ?auto_747442 ) ) ( not ( = ?auto_747440 ?auto_747443 ) ) ( not ( = ?auto_747440 ?auto_747444 ) ) ( not ( = ?auto_747440 ?auto_747445 ) ) ( not ( = ?auto_747440 ?auto_747446 ) ) ( not ( = ?auto_747440 ?auto_747447 ) ) ( not ( = ?auto_747440 ?auto_747448 ) ) ( not ( = ?auto_747440 ?auto_747449 ) ) ( not ( = ?auto_747440 ?auto_747450 ) ) ( not ( = ?auto_747440 ?auto_747451 ) ) ( not ( = ?auto_747440 ?auto_747452 ) ) ( not ( = ?auto_747440 ?auto_747453 ) ) ( not ( = ?auto_747440 ?auto_747454 ) ) ( not ( = ?auto_747441 ?auto_747442 ) ) ( not ( = ?auto_747441 ?auto_747443 ) ) ( not ( = ?auto_747441 ?auto_747444 ) ) ( not ( = ?auto_747441 ?auto_747445 ) ) ( not ( = ?auto_747441 ?auto_747446 ) ) ( not ( = ?auto_747441 ?auto_747447 ) ) ( not ( = ?auto_747441 ?auto_747448 ) ) ( not ( = ?auto_747441 ?auto_747449 ) ) ( not ( = ?auto_747441 ?auto_747450 ) ) ( not ( = ?auto_747441 ?auto_747451 ) ) ( not ( = ?auto_747441 ?auto_747452 ) ) ( not ( = ?auto_747441 ?auto_747453 ) ) ( not ( = ?auto_747441 ?auto_747454 ) ) ( not ( = ?auto_747442 ?auto_747443 ) ) ( not ( = ?auto_747442 ?auto_747444 ) ) ( not ( = ?auto_747442 ?auto_747445 ) ) ( not ( = ?auto_747442 ?auto_747446 ) ) ( not ( = ?auto_747442 ?auto_747447 ) ) ( not ( = ?auto_747442 ?auto_747448 ) ) ( not ( = ?auto_747442 ?auto_747449 ) ) ( not ( = ?auto_747442 ?auto_747450 ) ) ( not ( = ?auto_747442 ?auto_747451 ) ) ( not ( = ?auto_747442 ?auto_747452 ) ) ( not ( = ?auto_747442 ?auto_747453 ) ) ( not ( = ?auto_747442 ?auto_747454 ) ) ( not ( = ?auto_747443 ?auto_747444 ) ) ( not ( = ?auto_747443 ?auto_747445 ) ) ( not ( = ?auto_747443 ?auto_747446 ) ) ( not ( = ?auto_747443 ?auto_747447 ) ) ( not ( = ?auto_747443 ?auto_747448 ) ) ( not ( = ?auto_747443 ?auto_747449 ) ) ( not ( = ?auto_747443 ?auto_747450 ) ) ( not ( = ?auto_747443 ?auto_747451 ) ) ( not ( = ?auto_747443 ?auto_747452 ) ) ( not ( = ?auto_747443 ?auto_747453 ) ) ( not ( = ?auto_747443 ?auto_747454 ) ) ( not ( = ?auto_747444 ?auto_747445 ) ) ( not ( = ?auto_747444 ?auto_747446 ) ) ( not ( = ?auto_747444 ?auto_747447 ) ) ( not ( = ?auto_747444 ?auto_747448 ) ) ( not ( = ?auto_747444 ?auto_747449 ) ) ( not ( = ?auto_747444 ?auto_747450 ) ) ( not ( = ?auto_747444 ?auto_747451 ) ) ( not ( = ?auto_747444 ?auto_747452 ) ) ( not ( = ?auto_747444 ?auto_747453 ) ) ( not ( = ?auto_747444 ?auto_747454 ) ) ( not ( = ?auto_747445 ?auto_747446 ) ) ( not ( = ?auto_747445 ?auto_747447 ) ) ( not ( = ?auto_747445 ?auto_747448 ) ) ( not ( = ?auto_747445 ?auto_747449 ) ) ( not ( = ?auto_747445 ?auto_747450 ) ) ( not ( = ?auto_747445 ?auto_747451 ) ) ( not ( = ?auto_747445 ?auto_747452 ) ) ( not ( = ?auto_747445 ?auto_747453 ) ) ( not ( = ?auto_747445 ?auto_747454 ) ) ( not ( = ?auto_747446 ?auto_747447 ) ) ( not ( = ?auto_747446 ?auto_747448 ) ) ( not ( = ?auto_747446 ?auto_747449 ) ) ( not ( = ?auto_747446 ?auto_747450 ) ) ( not ( = ?auto_747446 ?auto_747451 ) ) ( not ( = ?auto_747446 ?auto_747452 ) ) ( not ( = ?auto_747446 ?auto_747453 ) ) ( not ( = ?auto_747446 ?auto_747454 ) ) ( not ( = ?auto_747447 ?auto_747448 ) ) ( not ( = ?auto_747447 ?auto_747449 ) ) ( not ( = ?auto_747447 ?auto_747450 ) ) ( not ( = ?auto_747447 ?auto_747451 ) ) ( not ( = ?auto_747447 ?auto_747452 ) ) ( not ( = ?auto_747447 ?auto_747453 ) ) ( not ( = ?auto_747447 ?auto_747454 ) ) ( not ( = ?auto_747448 ?auto_747449 ) ) ( not ( = ?auto_747448 ?auto_747450 ) ) ( not ( = ?auto_747448 ?auto_747451 ) ) ( not ( = ?auto_747448 ?auto_747452 ) ) ( not ( = ?auto_747448 ?auto_747453 ) ) ( not ( = ?auto_747448 ?auto_747454 ) ) ( not ( = ?auto_747449 ?auto_747450 ) ) ( not ( = ?auto_747449 ?auto_747451 ) ) ( not ( = ?auto_747449 ?auto_747452 ) ) ( not ( = ?auto_747449 ?auto_747453 ) ) ( not ( = ?auto_747449 ?auto_747454 ) ) ( not ( = ?auto_747450 ?auto_747451 ) ) ( not ( = ?auto_747450 ?auto_747452 ) ) ( not ( = ?auto_747450 ?auto_747453 ) ) ( not ( = ?auto_747450 ?auto_747454 ) ) ( not ( = ?auto_747451 ?auto_747452 ) ) ( not ( = ?auto_747451 ?auto_747453 ) ) ( not ( = ?auto_747451 ?auto_747454 ) ) ( not ( = ?auto_747452 ?auto_747453 ) ) ( not ( = ?auto_747452 ?auto_747454 ) ) ( not ( = ?auto_747453 ?auto_747454 ) ) ( ON ?auto_747452 ?auto_747453 ) ( ON ?auto_747451 ?auto_747452 ) ( ON ?auto_747450 ?auto_747451 ) ( CLEAR ?auto_747448 ) ( ON ?auto_747449 ?auto_747450 ) ( CLEAR ?auto_747449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_747436 ?auto_747437 ?auto_747438 ?auto_747439 ?auto_747440 ?auto_747441 ?auto_747442 ?auto_747443 ?auto_747444 ?auto_747445 ?auto_747446 ?auto_747447 ?auto_747448 ?auto_747449 )
      ( MAKE-18PILE ?auto_747436 ?auto_747437 ?auto_747438 ?auto_747439 ?auto_747440 ?auto_747441 ?auto_747442 ?auto_747443 ?auto_747444 ?auto_747445 ?auto_747446 ?auto_747447 ?auto_747448 ?auto_747449 ?auto_747450 ?auto_747451 ?auto_747452 ?auto_747453 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747473 - BLOCK
      ?auto_747474 - BLOCK
      ?auto_747475 - BLOCK
      ?auto_747476 - BLOCK
      ?auto_747477 - BLOCK
      ?auto_747478 - BLOCK
      ?auto_747479 - BLOCK
      ?auto_747480 - BLOCK
      ?auto_747481 - BLOCK
      ?auto_747482 - BLOCK
      ?auto_747483 - BLOCK
      ?auto_747484 - BLOCK
      ?auto_747485 - BLOCK
      ?auto_747486 - BLOCK
      ?auto_747487 - BLOCK
      ?auto_747488 - BLOCK
      ?auto_747489 - BLOCK
      ?auto_747490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_747490 ) ( ON-TABLE ?auto_747473 ) ( ON ?auto_747474 ?auto_747473 ) ( ON ?auto_747475 ?auto_747474 ) ( ON ?auto_747476 ?auto_747475 ) ( ON ?auto_747477 ?auto_747476 ) ( ON ?auto_747478 ?auto_747477 ) ( ON ?auto_747479 ?auto_747478 ) ( ON ?auto_747480 ?auto_747479 ) ( ON ?auto_747481 ?auto_747480 ) ( ON ?auto_747482 ?auto_747481 ) ( ON ?auto_747483 ?auto_747482 ) ( ON ?auto_747484 ?auto_747483 ) ( ON ?auto_747485 ?auto_747484 ) ( not ( = ?auto_747473 ?auto_747474 ) ) ( not ( = ?auto_747473 ?auto_747475 ) ) ( not ( = ?auto_747473 ?auto_747476 ) ) ( not ( = ?auto_747473 ?auto_747477 ) ) ( not ( = ?auto_747473 ?auto_747478 ) ) ( not ( = ?auto_747473 ?auto_747479 ) ) ( not ( = ?auto_747473 ?auto_747480 ) ) ( not ( = ?auto_747473 ?auto_747481 ) ) ( not ( = ?auto_747473 ?auto_747482 ) ) ( not ( = ?auto_747473 ?auto_747483 ) ) ( not ( = ?auto_747473 ?auto_747484 ) ) ( not ( = ?auto_747473 ?auto_747485 ) ) ( not ( = ?auto_747473 ?auto_747486 ) ) ( not ( = ?auto_747473 ?auto_747487 ) ) ( not ( = ?auto_747473 ?auto_747488 ) ) ( not ( = ?auto_747473 ?auto_747489 ) ) ( not ( = ?auto_747473 ?auto_747490 ) ) ( not ( = ?auto_747474 ?auto_747475 ) ) ( not ( = ?auto_747474 ?auto_747476 ) ) ( not ( = ?auto_747474 ?auto_747477 ) ) ( not ( = ?auto_747474 ?auto_747478 ) ) ( not ( = ?auto_747474 ?auto_747479 ) ) ( not ( = ?auto_747474 ?auto_747480 ) ) ( not ( = ?auto_747474 ?auto_747481 ) ) ( not ( = ?auto_747474 ?auto_747482 ) ) ( not ( = ?auto_747474 ?auto_747483 ) ) ( not ( = ?auto_747474 ?auto_747484 ) ) ( not ( = ?auto_747474 ?auto_747485 ) ) ( not ( = ?auto_747474 ?auto_747486 ) ) ( not ( = ?auto_747474 ?auto_747487 ) ) ( not ( = ?auto_747474 ?auto_747488 ) ) ( not ( = ?auto_747474 ?auto_747489 ) ) ( not ( = ?auto_747474 ?auto_747490 ) ) ( not ( = ?auto_747475 ?auto_747476 ) ) ( not ( = ?auto_747475 ?auto_747477 ) ) ( not ( = ?auto_747475 ?auto_747478 ) ) ( not ( = ?auto_747475 ?auto_747479 ) ) ( not ( = ?auto_747475 ?auto_747480 ) ) ( not ( = ?auto_747475 ?auto_747481 ) ) ( not ( = ?auto_747475 ?auto_747482 ) ) ( not ( = ?auto_747475 ?auto_747483 ) ) ( not ( = ?auto_747475 ?auto_747484 ) ) ( not ( = ?auto_747475 ?auto_747485 ) ) ( not ( = ?auto_747475 ?auto_747486 ) ) ( not ( = ?auto_747475 ?auto_747487 ) ) ( not ( = ?auto_747475 ?auto_747488 ) ) ( not ( = ?auto_747475 ?auto_747489 ) ) ( not ( = ?auto_747475 ?auto_747490 ) ) ( not ( = ?auto_747476 ?auto_747477 ) ) ( not ( = ?auto_747476 ?auto_747478 ) ) ( not ( = ?auto_747476 ?auto_747479 ) ) ( not ( = ?auto_747476 ?auto_747480 ) ) ( not ( = ?auto_747476 ?auto_747481 ) ) ( not ( = ?auto_747476 ?auto_747482 ) ) ( not ( = ?auto_747476 ?auto_747483 ) ) ( not ( = ?auto_747476 ?auto_747484 ) ) ( not ( = ?auto_747476 ?auto_747485 ) ) ( not ( = ?auto_747476 ?auto_747486 ) ) ( not ( = ?auto_747476 ?auto_747487 ) ) ( not ( = ?auto_747476 ?auto_747488 ) ) ( not ( = ?auto_747476 ?auto_747489 ) ) ( not ( = ?auto_747476 ?auto_747490 ) ) ( not ( = ?auto_747477 ?auto_747478 ) ) ( not ( = ?auto_747477 ?auto_747479 ) ) ( not ( = ?auto_747477 ?auto_747480 ) ) ( not ( = ?auto_747477 ?auto_747481 ) ) ( not ( = ?auto_747477 ?auto_747482 ) ) ( not ( = ?auto_747477 ?auto_747483 ) ) ( not ( = ?auto_747477 ?auto_747484 ) ) ( not ( = ?auto_747477 ?auto_747485 ) ) ( not ( = ?auto_747477 ?auto_747486 ) ) ( not ( = ?auto_747477 ?auto_747487 ) ) ( not ( = ?auto_747477 ?auto_747488 ) ) ( not ( = ?auto_747477 ?auto_747489 ) ) ( not ( = ?auto_747477 ?auto_747490 ) ) ( not ( = ?auto_747478 ?auto_747479 ) ) ( not ( = ?auto_747478 ?auto_747480 ) ) ( not ( = ?auto_747478 ?auto_747481 ) ) ( not ( = ?auto_747478 ?auto_747482 ) ) ( not ( = ?auto_747478 ?auto_747483 ) ) ( not ( = ?auto_747478 ?auto_747484 ) ) ( not ( = ?auto_747478 ?auto_747485 ) ) ( not ( = ?auto_747478 ?auto_747486 ) ) ( not ( = ?auto_747478 ?auto_747487 ) ) ( not ( = ?auto_747478 ?auto_747488 ) ) ( not ( = ?auto_747478 ?auto_747489 ) ) ( not ( = ?auto_747478 ?auto_747490 ) ) ( not ( = ?auto_747479 ?auto_747480 ) ) ( not ( = ?auto_747479 ?auto_747481 ) ) ( not ( = ?auto_747479 ?auto_747482 ) ) ( not ( = ?auto_747479 ?auto_747483 ) ) ( not ( = ?auto_747479 ?auto_747484 ) ) ( not ( = ?auto_747479 ?auto_747485 ) ) ( not ( = ?auto_747479 ?auto_747486 ) ) ( not ( = ?auto_747479 ?auto_747487 ) ) ( not ( = ?auto_747479 ?auto_747488 ) ) ( not ( = ?auto_747479 ?auto_747489 ) ) ( not ( = ?auto_747479 ?auto_747490 ) ) ( not ( = ?auto_747480 ?auto_747481 ) ) ( not ( = ?auto_747480 ?auto_747482 ) ) ( not ( = ?auto_747480 ?auto_747483 ) ) ( not ( = ?auto_747480 ?auto_747484 ) ) ( not ( = ?auto_747480 ?auto_747485 ) ) ( not ( = ?auto_747480 ?auto_747486 ) ) ( not ( = ?auto_747480 ?auto_747487 ) ) ( not ( = ?auto_747480 ?auto_747488 ) ) ( not ( = ?auto_747480 ?auto_747489 ) ) ( not ( = ?auto_747480 ?auto_747490 ) ) ( not ( = ?auto_747481 ?auto_747482 ) ) ( not ( = ?auto_747481 ?auto_747483 ) ) ( not ( = ?auto_747481 ?auto_747484 ) ) ( not ( = ?auto_747481 ?auto_747485 ) ) ( not ( = ?auto_747481 ?auto_747486 ) ) ( not ( = ?auto_747481 ?auto_747487 ) ) ( not ( = ?auto_747481 ?auto_747488 ) ) ( not ( = ?auto_747481 ?auto_747489 ) ) ( not ( = ?auto_747481 ?auto_747490 ) ) ( not ( = ?auto_747482 ?auto_747483 ) ) ( not ( = ?auto_747482 ?auto_747484 ) ) ( not ( = ?auto_747482 ?auto_747485 ) ) ( not ( = ?auto_747482 ?auto_747486 ) ) ( not ( = ?auto_747482 ?auto_747487 ) ) ( not ( = ?auto_747482 ?auto_747488 ) ) ( not ( = ?auto_747482 ?auto_747489 ) ) ( not ( = ?auto_747482 ?auto_747490 ) ) ( not ( = ?auto_747483 ?auto_747484 ) ) ( not ( = ?auto_747483 ?auto_747485 ) ) ( not ( = ?auto_747483 ?auto_747486 ) ) ( not ( = ?auto_747483 ?auto_747487 ) ) ( not ( = ?auto_747483 ?auto_747488 ) ) ( not ( = ?auto_747483 ?auto_747489 ) ) ( not ( = ?auto_747483 ?auto_747490 ) ) ( not ( = ?auto_747484 ?auto_747485 ) ) ( not ( = ?auto_747484 ?auto_747486 ) ) ( not ( = ?auto_747484 ?auto_747487 ) ) ( not ( = ?auto_747484 ?auto_747488 ) ) ( not ( = ?auto_747484 ?auto_747489 ) ) ( not ( = ?auto_747484 ?auto_747490 ) ) ( not ( = ?auto_747485 ?auto_747486 ) ) ( not ( = ?auto_747485 ?auto_747487 ) ) ( not ( = ?auto_747485 ?auto_747488 ) ) ( not ( = ?auto_747485 ?auto_747489 ) ) ( not ( = ?auto_747485 ?auto_747490 ) ) ( not ( = ?auto_747486 ?auto_747487 ) ) ( not ( = ?auto_747486 ?auto_747488 ) ) ( not ( = ?auto_747486 ?auto_747489 ) ) ( not ( = ?auto_747486 ?auto_747490 ) ) ( not ( = ?auto_747487 ?auto_747488 ) ) ( not ( = ?auto_747487 ?auto_747489 ) ) ( not ( = ?auto_747487 ?auto_747490 ) ) ( not ( = ?auto_747488 ?auto_747489 ) ) ( not ( = ?auto_747488 ?auto_747490 ) ) ( not ( = ?auto_747489 ?auto_747490 ) ) ( ON ?auto_747489 ?auto_747490 ) ( ON ?auto_747488 ?auto_747489 ) ( ON ?auto_747487 ?auto_747488 ) ( CLEAR ?auto_747485 ) ( ON ?auto_747486 ?auto_747487 ) ( CLEAR ?auto_747486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_747473 ?auto_747474 ?auto_747475 ?auto_747476 ?auto_747477 ?auto_747478 ?auto_747479 ?auto_747480 ?auto_747481 ?auto_747482 ?auto_747483 ?auto_747484 ?auto_747485 ?auto_747486 )
      ( MAKE-18PILE ?auto_747473 ?auto_747474 ?auto_747475 ?auto_747476 ?auto_747477 ?auto_747478 ?auto_747479 ?auto_747480 ?auto_747481 ?auto_747482 ?auto_747483 ?auto_747484 ?auto_747485 ?auto_747486 ?auto_747487 ?auto_747488 ?auto_747489 ?auto_747490 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747509 - BLOCK
      ?auto_747510 - BLOCK
      ?auto_747511 - BLOCK
      ?auto_747512 - BLOCK
      ?auto_747513 - BLOCK
      ?auto_747514 - BLOCK
      ?auto_747515 - BLOCK
      ?auto_747516 - BLOCK
      ?auto_747517 - BLOCK
      ?auto_747518 - BLOCK
      ?auto_747519 - BLOCK
      ?auto_747520 - BLOCK
      ?auto_747521 - BLOCK
      ?auto_747522 - BLOCK
      ?auto_747523 - BLOCK
      ?auto_747524 - BLOCK
      ?auto_747525 - BLOCK
      ?auto_747526 - BLOCK
    )
    :vars
    (
      ?auto_747527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747526 ?auto_747527 ) ( ON-TABLE ?auto_747509 ) ( ON ?auto_747510 ?auto_747509 ) ( ON ?auto_747511 ?auto_747510 ) ( ON ?auto_747512 ?auto_747511 ) ( ON ?auto_747513 ?auto_747512 ) ( ON ?auto_747514 ?auto_747513 ) ( ON ?auto_747515 ?auto_747514 ) ( ON ?auto_747516 ?auto_747515 ) ( ON ?auto_747517 ?auto_747516 ) ( ON ?auto_747518 ?auto_747517 ) ( ON ?auto_747519 ?auto_747518 ) ( ON ?auto_747520 ?auto_747519 ) ( not ( = ?auto_747509 ?auto_747510 ) ) ( not ( = ?auto_747509 ?auto_747511 ) ) ( not ( = ?auto_747509 ?auto_747512 ) ) ( not ( = ?auto_747509 ?auto_747513 ) ) ( not ( = ?auto_747509 ?auto_747514 ) ) ( not ( = ?auto_747509 ?auto_747515 ) ) ( not ( = ?auto_747509 ?auto_747516 ) ) ( not ( = ?auto_747509 ?auto_747517 ) ) ( not ( = ?auto_747509 ?auto_747518 ) ) ( not ( = ?auto_747509 ?auto_747519 ) ) ( not ( = ?auto_747509 ?auto_747520 ) ) ( not ( = ?auto_747509 ?auto_747521 ) ) ( not ( = ?auto_747509 ?auto_747522 ) ) ( not ( = ?auto_747509 ?auto_747523 ) ) ( not ( = ?auto_747509 ?auto_747524 ) ) ( not ( = ?auto_747509 ?auto_747525 ) ) ( not ( = ?auto_747509 ?auto_747526 ) ) ( not ( = ?auto_747509 ?auto_747527 ) ) ( not ( = ?auto_747510 ?auto_747511 ) ) ( not ( = ?auto_747510 ?auto_747512 ) ) ( not ( = ?auto_747510 ?auto_747513 ) ) ( not ( = ?auto_747510 ?auto_747514 ) ) ( not ( = ?auto_747510 ?auto_747515 ) ) ( not ( = ?auto_747510 ?auto_747516 ) ) ( not ( = ?auto_747510 ?auto_747517 ) ) ( not ( = ?auto_747510 ?auto_747518 ) ) ( not ( = ?auto_747510 ?auto_747519 ) ) ( not ( = ?auto_747510 ?auto_747520 ) ) ( not ( = ?auto_747510 ?auto_747521 ) ) ( not ( = ?auto_747510 ?auto_747522 ) ) ( not ( = ?auto_747510 ?auto_747523 ) ) ( not ( = ?auto_747510 ?auto_747524 ) ) ( not ( = ?auto_747510 ?auto_747525 ) ) ( not ( = ?auto_747510 ?auto_747526 ) ) ( not ( = ?auto_747510 ?auto_747527 ) ) ( not ( = ?auto_747511 ?auto_747512 ) ) ( not ( = ?auto_747511 ?auto_747513 ) ) ( not ( = ?auto_747511 ?auto_747514 ) ) ( not ( = ?auto_747511 ?auto_747515 ) ) ( not ( = ?auto_747511 ?auto_747516 ) ) ( not ( = ?auto_747511 ?auto_747517 ) ) ( not ( = ?auto_747511 ?auto_747518 ) ) ( not ( = ?auto_747511 ?auto_747519 ) ) ( not ( = ?auto_747511 ?auto_747520 ) ) ( not ( = ?auto_747511 ?auto_747521 ) ) ( not ( = ?auto_747511 ?auto_747522 ) ) ( not ( = ?auto_747511 ?auto_747523 ) ) ( not ( = ?auto_747511 ?auto_747524 ) ) ( not ( = ?auto_747511 ?auto_747525 ) ) ( not ( = ?auto_747511 ?auto_747526 ) ) ( not ( = ?auto_747511 ?auto_747527 ) ) ( not ( = ?auto_747512 ?auto_747513 ) ) ( not ( = ?auto_747512 ?auto_747514 ) ) ( not ( = ?auto_747512 ?auto_747515 ) ) ( not ( = ?auto_747512 ?auto_747516 ) ) ( not ( = ?auto_747512 ?auto_747517 ) ) ( not ( = ?auto_747512 ?auto_747518 ) ) ( not ( = ?auto_747512 ?auto_747519 ) ) ( not ( = ?auto_747512 ?auto_747520 ) ) ( not ( = ?auto_747512 ?auto_747521 ) ) ( not ( = ?auto_747512 ?auto_747522 ) ) ( not ( = ?auto_747512 ?auto_747523 ) ) ( not ( = ?auto_747512 ?auto_747524 ) ) ( not ( = ?auto_747512 ?auto_747525 ) ) ( not ( = ?auto_747512 ?auto_747526 ) ) ( not ( = ?auto_747512 ?auto_747527 ) ) ( not ( = ?auto_747513 ?auto_747514 ) ) ( not ( = ?auto_747513 ?auto_747515 ) ) ( not ( = ?auto_747513 ?auto_747516 ) ) ( not ( = ?auto_747513 ?auto_747517 ) ) ( not ( = ?auto_747513 ?auto_747518 ) ) ( not ( = ?auto_747513 ?auto_747519 ) ) ( not ( = ?auto_747513 ?auto_747520 ) ) ( not ( = ?auto_747513 ?auto_747521 ) ) ( not ( = ?auto_747513 ?auto_747522 ) ) ( not ( = ?auto_747513 ?auto_747523 ) ) ( not ( = ?auto_747513 ?auto_747524 ) ) ( not ( = ?auto_747513 ?auto_747525 ) ) ( not ( = ?auto_747513 ?auto_747526 ) ) ( not ( = ?auto_747513 ?auto_747527 ) ) ( not ( = ?auto_747514 ?auto_747515 ) ) ( not ( = ?auto_747514 ?auto_747516 ) ) ( not ( = ?auto_747514 ?auto_747517 ) ) ( not ( = ?auto_747514 ?auto_747518 ) ) ( not ( = ?auto_747514 ?auto_747519 ) ) ( not ( = ?auto_747514 ?auto_747520 ) ) ( not ( = ?auto_747514 ?auto_747521 ) ) ( not ( = ?auto_747514 ?auto_747522 ) ) ( not ( = ?auto_747514 ?auto_747523 ) ) ( not ( = ?auto_747514 ?auto_747524 ) ) ( not ( = ?auto_747514 ?auto_747525 ) ) ( not ( = ?auto_747514 ?auto_747526 ) ) ( not ( = ?auto_747514 ?auto_747527 ) ) ( not ( = ?auto_747515 ?auto_747516 ) ) ( not ( = ?auto_747515 ?auto_747517 ) ) ( not ( = ?auto_747515 ?auto_747518 ) ) ( not ( = ?auto_747515 ?auto_747519 ) ) ( not ( = ?auto_747515 ?auto_747520 ) ) ( not ( = ?auto_747515 ?auto_747521 ) ) ( not ( = ?auto_747515 ?auto_747522 ) ) ( not ( = ?auto_747515 ?auto_747523 ) ) ( not ( = ?auto_747515 ?auto_747524 ) ) ( not ( = ?auto_747515 ?auto_747525 ) ) ( not ( = ?auto_747515 ?auto_747526 ) ) ( not ( = ?auto_747515 ?auto_747527 ) ) ( not ( = ?auto_747516 ?auto_747517 ) ) ( not ( = ?auto_747516 ?auto_747518 ) ) ( not ( = ?auto_747516 ?auto_747519 ) ) ( not ( = ?auto_747516 ?auto_747520 ) ) ( not ( = ?auto_747516 ?auto_747521 ) ) ( not ( = ?auto_747516 ?auto_747522 ) ) ( not ( = ?auto_747516 ?auto_747523 ) ) ( not ( = ?auto_747516 ?auto_747524 ) ) ( not ( = ?auto_747516 ?auto_747525 ) ) ( not ( = ?auto_747516 ?auto_747526 ) ) ( not ( = ?auto_747516 ?auto_747527 ) ) ( not ( = ?auto_747517 ?auto_747518 ) ) ( not ( = ?auto_747517 ?auto_747519 ) ) ( not ( = ?auto_747517 ?auto_747520 ) ) ( not ( = ?auto_747517 ?auto_747521 ) ) ( not ( = ?auto_747517 ?auto_747522 ) ) ( not ( = ?auto_747517 ?auto_747523 ) ) ( not ( = ?auto_747517 ?auto_747524 ) ) ( not ( = ?auto_747517 ?auto_747525 ) ) ( not ( = ?auto_747517 ?auto_747526 ) ) ( not ( = ?auto_747517 ?auto_747527 ) ) ( not ( = ?auto_747518 ?auto_747519 ) ) ( not ( = ?auto_747518 ?auto_747520 ) ) ( not ( = ?auto_747518 ?auto_747521 ) ) ( not ( = ?auto_747518 ?auto_747522 ) ) ( not ( = ?auto_747518 ?auto_747523 ) ) ( not ( = ?auto_747518 ?auto_747524 ) ) ( not ( = ?auto_747518 ?auto_747525 ) ) ( not ( = ?auto_747518 ?auto_747526 ) ) ( not ( = ?auto_747518 ?auto_747527 ) ) ( not ( = ?auto_747519 ?auto_747520 ) ) ( not ( = ?auto_747519 ?auto_747521 ) ) ( not ( = ?auto_747519 ?auto_747522 ) ) ( not ( = ?auto_747519 ?auto_747523 ) ) ( not ( = ?auto_747519 ?auto_747524 ) ) ( not ( = ?auto_747519 ?auto_747525 ) ) ( not ( = ?auto_747519 ?auto_747526 ) ) ( not ( = ?auto_747519 ?auto_747527 ) ) ( not ( = ?auto_747520 ?auto_747521 ) ) ( not ( = ?auto_747520 ?auto_747522 ) ) ( not ( = ?auto_747520 ?auto_747523 ) ) ( not ( = ?auto_747520 ?auto_747524 ) ) ( not ( = ?auto_747520 ?auto_747525 ) ) ( not ( = ?auto_747520 ?auto_747526 ) ) ( not ( = ?auto_747520 ?auto_747527 ) ) ( not ( = ?auto_747521 ?auto_747522 ) ) ( not ( = ?auto_747521 ?auto_747523 ) ) ( not ( = ?auto_747521 ?auto_747524 ) ) ( not ( = ?auto_747521 ?auto_747525 ) ) ( not ( = ?auto_747521 ?auto_747526 ) ) ( not ( = ?auto_747521 ?auto_747527 ) ) ( not ( = ?auto_747522 ?auto_747523 ) ) ( not ( = ?auto_747522 ?auto_747524 ) ) ( not ( = ?auto_747522 ?auto_747525 ) ) ( not ( = ?auto_747522 ?auto_747526 ) ) ( not ( = ?auto_747522 ?auto_747527 ) ) ( not ( = ?auto_747523 ?auto_747524 ) ) ( not ( = ?auto_747523 ?auto_747525 ) ) ( not ( = ?auto_747523 ?auto_747526 ) ) ( not ( = ?auto_747523 ?auto_747527 ) ) ( not ( = ?auto_747524 ?auto_747525 ) ) ( not ( = ?auto_747524 ?auto_747526 ) ) ( not ( = ?auto_747524 ?auto_747527 ) ) ( not ( = ?auto_747525 ?auto_747526 ) ) ( not ( = ?auto_747525 ?auto_747527 ) ) ( not ( = ?auto_747526 ?auto_747527 ) ) ( ON ?auto_747525 ?auto_747526 ) ( ON ?auto_747524 ?auto_747525 ) ( ON ?auto_747523 ?auto_747524 ) ( ON ?auto_747522 ?auto_747523 ) ( CLEAR ?auto_747520 ) ( ON ?auto_747521 ?auto_747522 ) ( CLEAR ?auto_747521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_747509 ?auto_747510 ?auto_747511 ?auto_747512 ?auto_747513 ?auto_747514 ?auto_747515 ?auto_747516 ?auto_747517 ?auto_747518 ?auto_747519 ?auto_747520 ?auto_747521 )
      ( MAKE-18PILE ?auto_747509 ?auto_747510 ?auto_747511 ?auto_747512 ?auto_747513 ?auto_747514 ?auto_747515 ?auto_747516 ?auto_747517 ?auto_747518 ?auto_747519 ?auto_747520 ?auto_747521 ?auto_747522 ?auto_747523 ?auto_747524 ?auto_747525 ?auto_747526 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747546 - BLOCK
      ?auto_747547 - BLOCK
      ?auto_747548 - BLOCK
      ?auto_747549 - BLOCK
      ?auto_747550 - BLOCK
      ?auto_747551 - BLOCK
      ?auto_747552 - BLOCK
      ?auto_747553 - BLOCK
      ?auto_747554 - BLOCK
      ?auto_747555 - BLOCK
      ?auto_747556 - BLOCK
      ?auto_747557 - BLOCK
      ?auto_747558 - BLOCK
      ?auto_747559 - BLOCK
      ?auto_747560 - BLOCK
      ?auto_747561 - BLOCK
      ?auto_747562 - BLOCK
      ?auto_747563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_747563 ) ( ON-TABLE ?auto_747546 ) ( ON ?auto_747547 ?auto_747546 ) ( ON ?auto_747548 ?auto_747547 ) ( ON ?auto_747549 ?auto_747548 ) ( ON ?auto_747550 ?auto_747549 ) ( ON ?auto_747551 ?auto_747550 ) ( ON ?auto_747552 ?auto_747551 ) ( ON ?auto_747553 ?auto_747552 ) ( ON ?auto_747554 ?auto_747553 ) ( ON ?auto_747555 ?auto_747554 ) ( ON ?auto_747556 ?auto_747555 ) ( ON ?auto_747557 ?auto_747556 ) ( not ( = ?auto_747546 ?auto_747547 ) ) ( not ( = ?auto_747546 ?auto_747548 ) ) ( not ( = ?auto_747546 ?auto_747549 ) ) ( not ( = ?auto_747546 ?auto_747550 ) ) ( not ( = ?auto_747546 ?auto_747551 ) ) ( not ( = ?auto_747546 ?auto_747552 ) ) ( not ( = ?auto_747546 ?auto_747553 ) ) ( not ( = ?auto_747546 ?auto_747554 ) ) ( not ( = ?auto_747546 ?auto_747555 ) ) ( not ( = ?auto_747546 ?auto_747556 ) ) ( not ( = ?auto_747546 ?auto_747557 ) ) ( not ( = ?auto_747546 ?auto_747558 ) ) ( not ( = ?auto_747546 ?auto_747559 ) ) ( not ( = ?auto_747546 ?auto_747560 ) ) ( not ( = ?auto_747546 ?auto_747561 ) ) ( not ( = ?auto_747546 ?auto_747562 ) ) ( not ( = ?auto_747546 ?auto_747563 ) ) ( not ( = ?auto_747547 ?auto_747548 ) ) ( not ( = ?auto_747547 ?auto_747549 ) ) ( not ( = ?auto_747547 ?auto_747550 ) ) ( not ( = ?auto_747547 ?auto_747551 ) ) ( not ( = ?auto_747547 ?auto_747552 ) ) ( not ( = ?auto_747547 ?auto_747553 ) ) ( not ( = ?auto_747547 ?auto_747554 ) ) ( not ( = ?auto_747547 ?auto_747555 ) ) ( not ( = ?auto_747547 ?auto_747556 ) ) ( not ( = ?auto_747547 ?auto_747557 ) ) ( not ( = ?auto_747547 ?auto_747558 ) ) ( not ( = ?auto_747547 ?auto_747559 ) ) ( not ( = ?auto_747547 ?auto_747560 ) ) ( not ( = ?auto_747547 ?auto_747561 ) ) ( not ( = ?auto_747547 ?auto_747562 ) ) ( not ( = ?auto_747547 ?auto_747563 ) ) ( not ( = ?auto_747548 ?auto_747549 ) ) ( not ( = ?auto_747548 ?auto_747550 ) ) ( not ( = ?auto_747548 ?auto_747551 ) ) ( not ( = ?auto_747548 ?auto_747552 ) ) ( not ( = ?auto_747548 ?auto_747553 ) ) ( not ( = ?auto_747548 ?auto_747554 ) ) ( not ( = ?auto_747548 ?auto_747555 ) ) ( not ( = ?auto_747548 ?auto_747556 ) ) ( not ( = ?auto_747548 ?auto_747557 ) ) ( not ( = ?auto_747548 ?auto_747558 ) ) ( not ( = ?auto_747548 ?auto_747559 ) ) ( not ( = ?auto_747548 ?auto_747560 ) ) ( not ( = ?auto_747548 ?auto_747561 ) ) ( not ( = ?auto_747548 ?auto_747562 ) ) ( not ( = ?auto_747548 ?auto_747563 ) ) ( not ( = ?auto_747549 ?auto_747550 ) ) ( not ( = ?auto_747549 ?auto_747551 ) ) ( not ( = ?auto_747549 ?auto_747552 ) ) ( not ( = ?auto_747549 ?auto_747553 ) ) ( not ( = ?auto_747549 ?auto_747554 ) ) ( not ( = ?auto_747549 ?auto_747555 ) ) ( not ( = ?auto_747549 ?auto_747556 ) ) ( not ( = ?auto_747549 ?auto_747557 ) ) ( not ( = ?auto_747549 ?auto_747558 ) ) ( not ( = ?auto_747549 ?auto_747559 ) ) ( not ( = ?auto_747549 ?auto_747560 ) ) ( not ( = ?auto_747549 ?auto_747561 ) ) ( not ( = ?auto_747549 ?auto_747562 ) ) ( not ( = ?auto_747549 ?auto_747563 ) ) ( not ( = ?auto_747550 ?auto_747551 ) ) ( not ( = ?auto_747550 ?auto_747552 ) ) ( not ( = ?auto_747550 ?auto_747553 ) ) ( not ( = ?auto_747550 ?auto_747554 ) ) ( not ( = ?auto_747550 ?auto_747555 ) ) ( not ( = ?auto_747550 ?auto_747556 ) ) ( not ( = ?auto_747550 ?auto_747557 ) ) ( not ( = ?auto_747550 ?auto_747558 ) ) ( not ( = ?auto_747550 ?auto_747559 ) ) ( not ( = ?auto_747550 ?auto_747560 ) ) ( not ( = ?auto_747550 ?auto_747561 ) ) ( not ( = ?auto_747550 ?auto_747562 ) ) ( not ( = ?auto_747550 ?auto_747563 ) ) ( not ( = ?auto_747551 ?auto_747552 ) ) ( not ( = ?auto_747551 ?auto_747553 ) ) ( not ( = ?auto_747551 ?auto_747554 ) ) ( not ( = ?auto_747551 ?auto_747555 ) ) ( not ( = ?auto_747551 ?auto_747556 ) ) ( not ( = ?auto_747551 ?auto_747557 ) ) ( not ( = ?auto_747551 ?auto_747558 ) ) ( not ( = ?auto_747551 ?auto_747559 ) ) ( not ( = ?auto_747551 ?auto_747560 ) ) ( not ( = ?auto_747551 ?auto_747561 ) ) ( not ( = ?auto_747551 ?auto_747562 ) ) ( not ( = ?auto_747551 ?auto_747563 ) ) ( not ( = ?auto_747552 ?auto_747553 ) ) ( not ( = ?auto_747552 ?auto_747554 ) ) ( not ( = ?auto_747552 ?auto_747555 ) ) ( not ( = ?auto_747552 ?auto_747556 ) ) ( not ( = ?auto_747552 ?auto_747557 ) ) ( not ( = ?auto_747552 ?auto_747558 ) ) ( not ( = ?auto_747552 ?auto_747559 ) ) ( not ( = ?auto_747552 ?auto_747560 ) ) ( not ( = ?auto_747552 ?auto_747561 ) ) ( not ( = ?auto_747552 ?auto_747562 ) ) ( not ( = ?auto_747552 ?auto_747563 ) ) ( not ( = ?auto_747553 ?auto_747554 ) ) ( not ( = ?auto_747553 ?auto_747555 ) ) ( not ( = ?auto_747553 ?auto_747556 ) ) ( not ( = ?auto_747553 ?auto_747557 ) ) ( not ( = ?auto_747553 ?auto_747558 ) ) ( not ( = ?auto_747553 ?auto_747559 ) ) ( not ( = ?auto_747553 ?auto_747560 ) ) ( not ( = ?auto_747553 ?auto_747561 ) ) ( not ( = ?auto_747553 ?auto_747562 ) ) ( not ( = ?auto_747553 ?auto_747563 ) ) ( not ( = ?auto_747554 ?auto_747555 ) ) ( not ( = ?auto_747554 ?auto_747556 ) ) ( not ( = ?auto_747554 ?auto_747557 ) ) ( not ( = ?auto_747554 ?auto_747558 ) ) ( not ( = ?auto_747554 ?auto_747559 ) ) ( not ( = ?auto_747554 ?auto_747560 ) ) ( not ( = ?auto_747554 ?auto_747561 ) ) ( not ( = ?auto_747554 ?auto_747562 ) ) ( not ( = ?auto_747554 ?auto_747563 ) ) ( not ( = ?auto_747555 ?auto_747556 ) ) ( not ( = ?auto_747555 ?auto_747557 ) ) ( not ( = ?auto_747555 ?auto_747558 ) ) ( not ( = ?auto_747555 ?auto_747559 ) ) ( not ( = ?auto_747555 ?auto_747560 ) ) ( not ( = ?auto_747555 ?auto_747561 ) ) ( not ( = ?auto_747555 ?auto_747562 ) ) ( not ( = ?auto_747555 ?auto_747563 ) ) ( not ( = ?auto_747556 ?auto_747557 ) ) ( not ( = ?auto_747556 ?auto_747558 ) ) ( not ( = ?auto_747556 ?auto_747559 ) ) ( not ( = ?auto_747556 ?auto_747560 ) ) ( not ( = ?auto_747556 ?auto_747561 ) ) ( not ( = ?auto_747556 ?auto_747562 ) ) ( not ( = ?auto_747556 ?auto_747563 ) ) ( not ( = ?auto_747557 ?auto_747558 ) ) ( not ( = ?auto_747557 ?auto_747559 ) ) ( not ( = ?auto_747557 ?auto_747560 ) ) ( not ( = ?auto_747557 ?auto_747561 ) ) ( not ( = ?auto_747557 ?auto_747562 ) ) ( not ( = ?auto_747557 ?auto_747563 ) ) ( not ( = ?auto_747558 ?auto_747559 ) ) ( not ( = ?auto_747558 ?auto_747560 ) ) ( not ( = ?auto_747558 ?auto_747561 ) ) ( not ( = ?auto_747558 ?auto_747562 ) ) ( not ( = ?auto_747558 ?auto_747563 ) ) ( not ( = ?auto_747559 ?auto_747560 ) ) ( not ( = ?auto_747559 ?auto_747561 ) ) ( not ( = ?auto_747559 ?auto_747562 ) ) ( not ( = ?auto_747559 ?auto_747563 ) ) ( not ( = ?auto_747560 ?auto_747561 ) ) ( not ( = ?auto_747560 ?auto_747562 ) ) ( not ( = ?auto_747560 ?auto_747563 ) ) ( not ( = ?auto_747561 ?auto_747562 ) ) ( not ( = ?auto_747561 ?auto_747563 ) ) ( not ( = ?auto_747562 ?auto_747563 ) ) ( ON ?auto_747562 ?auto_747563 ) ( ON ?auto_747561 ?auto_747562 ) ( ON ?auto_747560 ?auto_747561 ) ( ON ?auto_747559 ?auto_747560 ) ( CLEAR ?auto_747557 ) ( ON ?auto_747558 ?auto_747559 ) ( CLEAR ?auto_747558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_747546 ?auto_747547 ?auto_747548 ?auto_747549 ?auto_747550 ?auto_747551 ?auto_747552 ?auto_747553 ?auto_747554 ?auto_747555 ?auto_747556 ?auto_747557 ?auto_747558 )
      ( MAKE-18PILE ?auto_747546 ?auto_747547 ?auto_747548 ?auto_747549 ?auto_747550 ?auto_747551 ?auto_747552 ?auto_747553 ?auto_747554 ?auto_747555 ?auto_747556 ?auto_747557 ?auto_747558 ?auto_747559 ?auto_747560 ?auto_747561 ?auto_747562 ?auto_747563 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747582 - BLOCK
      ?auto_747583 - BLOCK
      ?auto_747584 - BLOCK
      ?auto_747585 - BLOCK
      ?auto_747586 - BLOCK
      ?auto_747587 - BLOCK
      ?auto_747588 - BLOCK
      ?auto_747589 - BLOCK
      ?auto_747590 - BLOCK
      ?auto_747591 - BLOCK
      ?auto_747592 - BLOCK
      ?auto_747593 - BLOCK
      ?auto_747594 - BLOCK
      ?auto_747595 - BLOCK
      ?auto_747596 - BLOCK
      ?auto_747597 - BLOCK
      ?auto_747598 - BLOCK
      ?auto_747599 - BLOCK
    )
    :vars
    (
      ?auto_747600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747599 ?auto_747600 ) ( ON-TABLE ?auto_747582 ) ( ON ?auto_747583 ?auto_747582 ) ( ON ?auto_747584 ?auto_747583 ) ( ON ?auto_747585 ?auto_747584 ) ( ON ?auto_747586 ?auto_747585 ) ( ON ?auto_747587 ?auto_747586 ) ( ON ?auto_747588 ?auto_747587 ) ( ON ?auto_747589 ?auto_747588 ) ( ON ?auto_747590 ?auto_747589 ) ( ON ?auto_747591 ?auto_747590 ) ( ON ?auto_747592 ?auto_747591 ) ( not ( = ?auto_747582 ?auto_747583 ) ) ( not ( = ?auto_747582 ?auto_747584 ) ) ( not ( = ?auto_747582 ?auto_747585 ) ) ( not ( = ?auto_747582 ?auto_747586 ) ) ( not ( = ?auto_747582 ?auto_747587 ) ) ( not ( = ?auto_747582 ?auto_747588 ) ) ( not ( = ?auto_747582 ?auto_747589 ) ) ( not ( = ?auto_747582 ?auto_747590 ) ) ( not ( = ?auto_747582 ?auto_747591 ) ) ( not ( = ?auto_747582 ?auto_747592 ) ) ( not ( = ?auto_747582 ?auto_747593 ) ) ( not ( = ?auto_747582 ?auto_747594 ) ) ( not ( = ?auto_747582 ?auto_747595 ) ) ( not ( = ?auto_747582 ?auto_747596 ) ) ( not ( = ?auto_747582 ?auto_747597 ) ) ( not ( = ?auto_747582 ?auto_747598 ) ) ( not ( = ?auto_747582 ?auto_747599 ) ) ( not ( = ?auto_747582 ?auto_747600 ) ) ( not ( = ?auto_747583 ?auto_747584 ) ) ( not ( = ?auto_747583 ?auto_747585 ) ) ( not ( = ?auto_747583 ?auto_747586 ) ) ( not ( = ?auto_747583 ?auto_747587 ) ) ( not ( = ?auto_747583 ?auto_747588 ) ) ( not ( = ?auto_747583 ?auto_747589 ) ) ( not ( = ?auto_747583 ?auto_747590 ) ) ( not ( = ?auto_747583 ?auto_747591 ) ) ( not ( = ?auto_747583 ?auto_747592 ) ) ( not ( = ?auto_747583 ?auto_747593 ) ) ( not ( = ?auto_747583 ?auto_747594 ) ) ( not ( = ?auto_747583 ?auto_747595 ) ) ( not ( = ?auto_747583 ?auto_747596 ) ) ( not ( = ?auto_747583 ?auto_747597 ) ) ( not ( = ?auto_747583 ?auto_747598 ) ) ( not ( = ?auto_747583 ?auto_747599 ) ) ( not ( = ?auto_747583 ?auto_747600 ) ) ( not ( = ?auto_747584 ?auto_747585 ) ) ( not ( = ?auto_747584 ?auto_747586 ) ) ( not ( = ?auto_747584 ?auto_747587 ) ) ( not ( = ?auto_747584 ?auto_747588 ) ) ( not ( = ?auto_747584 ?auto_747589 ) ) ( not ( = ?auto_747584 ?auto_747590 ) ) ( not ( = ?auto_747584 ?auto_747591 ) ) ( not ( = ?auto_747584 ?auto_747592 ) ) ( not ( = ?auto_747584 ?auto_747593 ) ) ( not ( = ?auto_747584 ?auto_747594 ) ) ( not ( = ?auto_747584 ?auto_747595 ) ) ( not ( = ?auto_747584 ?auto_747596 ) ) ( not ( = ?auto_747584 ?auto_747597 ) ) ( not ( = ?auto_747584 ?auto_747598 ) ) ( not ( = ?auto_747584 ?auto_747599 ) ) ( not ( = ?auto_747584 ?auto_747600 ) ) ( not ( = ?auto_747585 ?auto_747586 ) ) ( not ( = ?auto_747585 ?auto_747587 ) ) ( not ( = ?auto_747585 ?auto_747588 ) ) ( not ( = ?auto_747585 ?auto_747589 ) ) ( not ( = ?auto_747585 ?auto_747590 ) ) ( not ( = ?auto_747585 ?auto_747591 ) ) ( not ( = ?auto_747585 ?auto_747592 ) ) ( not ( = ?auto_747585 ?auto_747593 ) ) ( not ( = ?auto_747585 ?auto_747594 ) ) ( not ( = ?auto_747585 ?auto_747595 ) ) ( not ( = ?auto_747585 ?auto_747596 ) ) ( not ( = ?auto_747585 ?auto_747597 ) ) ( not ( = ?auto_747585 ?auto_747598 ) ) ( not ( = ?auto_747585 ?auto_747599 ) ) ( not ( = ?auto_747585 ?auto_747600 ) ) ( not ( = ?auto_747586 ?auto_747587 ) ) ( not ( = ?auto_747586 ?auto_747588 ) ) ( not ( = ?auto_747586 ?auto_747589 ) ) ( not ( = ?auto_747586 ?auto_747590 ) ) ( not ( = ?auto_747586 ?auto_747591 ) ) ( not ( = ?auto_747586 ?auto_747592 ) ) ( not ( = ?auto_747586 ?auto_747593 ) ) ( not ( = ?auto_747586 ?auto_747594 ) ) ( not ( = ?auto_747586 ?auto_747595 ) ) ( not ( = ?auto_747586 ?auto_747596 ) ) ( not ( = ?auto_747586 ?auto_747597 ) ) ( not ( = ?auto_747586 ?auto_747598 ) ) ( not ( = ?auto_747586 ?auto_747599 ) ) ( not ( = ?auto_747586 ?auto_747600 ) ) ( not ( = ?auto_747587 ?auto_747588 ) ) ( not ( = ?auto_747587 ?auto_747589 ) ) ( not ( = ?auto_747587 ?auto_747590 ) ) ( not ( = ?auto_747587 ?auto_747591 ) ) ( not ( = ?auto_747587 ?auto_747592 ) ) ( not ( = ?auto_747587 ?auto_747593 ) ) ( not ( = ?auto_747587 ?auto_747594 ) ) ( not ( = ?auto_747587 ?auto_747595 ) ) ( not ( = ?auto_747587 ?auto_747596 ) ) ( not ( = ?auto_747587 ?auto_747597 ) ) ( not ( = ?auto_747587 ?auto_747598 ) ) ( not ( = ?auto_747587 ?auto_747599 ) ) ( not ( = ?auto_747587 ?auto_747600 ) ) ( not ( = ?auto_747588 ?auto_747589 ) ) ( not ( = ?auto_747588 ?auto_747590 ) ) ( not ( = ?auto_747588 ?auto_747591 ) ) ( not ( = ?auto_747588 ?auto_747592 ) ) ( not ( = ?auto_747588 ?auto_747593 ) ) ( not ( = ?auto_747588 ?auto_747594 ) ) ( not ( = ?auto_747588 ?auto_747595 ) ) ( not ( = ?auto_747588 ?auto_747596 ) ) ( not ( = ?auto_747588 ?auto_747597 ) ) ( not ( = ?auto_747588 ?auto_747598 ) ) ( not ( = ?auto_747588 ?auto_747599 ) ) ( not ( = ?auto_747588 ?auto_747600 ) ) ( not ( = ?auto_747589 ?auto_747590 ) ) ( not ( = ?auto_747589 ?auto_747591 ) ) ( not ( = ?auto_747589 ?auto_747592 ) ) ( not ( = ?auto_747589 ?auto_747593 ) ) ( not ( = ?auto_747589 ?auto_747594 ) ) ( not ( = ?auto_747589 ?auto_747595 ) ) ( not ( = ?auto_747589 ?auto_747596 ) ) ( not ( = ?auto_747589 ?auto_747597 ) ) ( not ( = ?auto_747589 ?auto_747598 ) ) ( not ( = ?auto_747589 ?auto_747599 ) ) ( not ( = ?auto_747589 ?auto_747600 ) ) ( not ( = ?auto_747590 ?auto_747591 ) ) ( not ( = ?auto_747590 ?auto_747592 ) ) ( not ( = ?auto_747590 ?auto_747593 ) ) ( not ( = ?auto_747590 ?auto_747594 ) ) ( not ( = ?auto_747590 ?auto_747595 ) ) ( not ( = ?auto_747590 ?auto_747596 ) ) ( not ( = ?auto_747590 ?auto_747597 ) ) ( not ( = ?auto_747590 ?auto_747598 ) ) ( not ( = ?auto_747590 ?auto_747599 ) ) ( not ( = ?auto_747590 ?auto_747600 ) ) ( not ( = ?auto_747591 ?auto_747592 ) ) ( not ( = ?auto_747591 ?auto_747593 ) ) ( not ( = ?auto_747591 ?auto_747594 ) ) ( not ( = ?auto_747591 ?auto_747595 ) ) ( not ( = ?auto_747591 ?auto_747596 ) ) ( not ( = ?auto_747591 ?auto_747597 ) ) ( not ( = ?auto_747591 ?auto_747598 ) ) ( not ( = ?auto_747591 ?auto_747599 ) ) ( not ( = ?auto_747591 ?auto_747600 ) ) ( not ( = ?auto_747592 ?auto_747593 ) ) ( not ( = ?auto_747592 ?auto_747594 ) ) ( not ( = ?auto_747592 ?auto_747595 ) ) ( not ( = ?auto_747592 ?auto_747596 ) ) ( not ( = ?auto_747592 ?auto_747597 ) ) ( not ( = ?auto_747592 ?auto_747598 ) ) ( not ( = ?auto_747592 ?auto_747599 ) ) ( not ( = ?auto_747592 ?auto_747600 ) ) ( not ( = ?auto_747593 ?auto_747594 ) ) ( not ( = ?auto_747593 ?auto_747595 ) ) ( not ( = ?auto_747593 ?auto_747596 ) ) ( not ( = ?auto_747593 ?auto_747597 ) ) ( not ( = ?auto_747593 ?auto_747598 ) ) ( not ( = ?auto_747593 ?auto_747599 ) ) ( not ( = ?auto_747593 ?auto_747600 ) ) ( not ( = ?auto_747594 ?auto_747595 ) ) ( not ( = ?auto_747594 ?auto_747596 ) ) ( not ( = ?auto_747594 ?auto_747597 ) ) ( not ( = ?auto_747594 ?auto_747598 ) ) ( not ( = ?auto_747594 ?auto_747599 ) ) ( not ( = ?auto_747594 ?auto_747600 ) ) ( not ( = ?auto_747595 ?auto_747596 ) ) ( not ( = ?auto_747595 ?auto_747597 ) ) ( not ( = ?auto_747595 ?auto_747598 ) ) ( not ( = ?auto_747595 ?auto_747599 ) ) ( not ( = ?auto_747595 ?auto_747600 ) ) ( not ( = ?auto_747596 ?auto_747597 ) ) ( not ( = ?auto_747596 ?auto_747598 ) ) ( not ( = ?auto_747596 ?auto_747599 ) ) ( not ( = ?auto_747596 ?auto_747600 ) ) ( not ( = ?auto_747597 ?auto_747598 ) ) ( not ( = ?auto_747597 ?auto_747599 ) ) ( not ( = ?auto_747597 ?auto_747600 ) ) ( not ( = ?auto_747598 ?auto_747599 ) ) ( not ( = ?auto_747598 ?auto_747600 ) ) ( not ( = ?auto_747599 ?auto_747600 ) ) ( ON ?auto_747598 ?auto_747599 ) ( ON ?auto_747597 ?auto_747598 ) ( ON ?auto_747596 ?auto_747597 ) ( ON ?auto_747595 ?auto_747596 ) ( ON ?auto_747594 ?auto_747595 ) ( CLEAR ?auto_747592 ) ( ON ?auto_747593 ?auto_747594 ) ( CLEAR ?auto_747593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_747582 ?auto_747583 ?auto_747584 ?auto_747585 ?auto_747586 ?auto_747587 ?auto_747588 ?auto_747589 ?auto_747590 ?auto_747591 ?auto_747592 ?auto_747593 )
      ( MAKE-18PILE ?auto_747582 ?auto_747583 ?auto_747584 ?auto_747585 ?auto_747586 ?auto_747587 ?auto_747588 ?auto_747589 ?auto_747590 ?auto_747591 ?auto_747592 ?auto_747593 ?auto_747594 ?auto_747595 ?auto_747596 ?auto_747597 ?auto_747598 ?auto_747599 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747619 - BLOCK
      ?auto_747620 - BLOCK
      ?auto_747621 - BLOCK
      ?auto_747622 - BLOCK
      ?auto_747623 - BLOCK
      ?auto_747624 - BLOCK
      ?auto_747625 - BLOCK
      ?auto_747626 - BLOCK
      ?auto_747627 - BLOCK
      ?auto_747628 - BLOCK
      ?auto_747629 - BLOCK
      ?auto_747630 - BLOCK
      ?auto_747631 - BLOCK
      ?auto_747632 - BLOCK
      ?auto_747633 - BLOCK
      ?auto_747634 - BLOCK
      ?auto_747635 - BLOCK
      ?auto_747636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_747636 ) ( ON-TABLE ?auto_747619 ) ( ON ?auto_747620 ?auto_747619 ) ( ON ?auto_747621 ?auto_747620 ) ( ON ?auto_747622 ?auto_747621 ) ( ON ?auto_747623 ?auto_747622 ) ( ON ?auto_747624 ?auto_747623 ) ( ON ?auto_747625 ?auto_747624 ) ( ON ?auto_747626 ?auto_747625 ) ( ON ?auto_747627 ?auto_747626 ) ( ON ?auto_747628 ?auto_747627 ) ( ON ?auto_747629 ?auto_747628 ) ( not ( = ?auto_747619 ?auto_747620 ) ) ( not ( = ?auto_747619 ?auto_747621 ) ) ( not ( = ?auto_747619 ?auto_747622 ) ) ( not ( = ?auto_747619 ?auto_747623 ) ) ( not ( = ?auto_747619 ?auto_747624 ) ) ( not ( = ?auto_747619 ?auto_747625 ) ) ( not ( = ?auto_747619 ?auto_747626 ) ) ( not ( = ?auto_747619 ?auto_747627 ) ) ( not ( = ?auto_747619 ?auto_747628 ) ) ( not ( = ?auto_747619 ?auto_747629 ) ) ( not ( = ?auto_747619 ?auto_747630 ) ) ( not ( = ?auto_747619 ?auto_747631 ) ) ( not ( = ?auto_747619 ?auto_747632 ) ) ( not ( = ?auto_747619 ?auto_747633 ) ) ( not ( = ?auto_747619 ?auto_747634 ) ) ( not ( = ?auto_747619 ?auto_747635 ) ) ( not ( = ?auto_747619 ?auto_747636 ) ) ( not ( = ?auto_747620 ?auto_747621 ) ) ( not ( = ?auto_747620 ?auto_747622 ) ) ( not ( = ?auto_747620 ?auto_747623 ) ) ( not ( = ?auto_747620 ?auto_747624 ) ) ( not ( = ?auto_747620 ?auto_747625 ) ) ( not ( = ?auto_747620 ?auto_747626 ) ) ( not ( = ?auto_747620 ?auto_747627 ) ) ( not ( = ?auto_747620 ?auto_747628 ) ) ( not ( = ?auto_747620 ?auto_747629 ) ) ( not ( = ?auto_747620 ?auto_747630 ) ) ( not ( = ?auto_747620 ?auto_747631 ) ) ( not ( = ?auto_747620 ?auto_747632 ) ) ( not ( = ?auto_747620 ?auto_747633 ) ) ( not ( = ?auto_747620 ?auto_747634 ) ) ( not ( = ?auto_747620 ?auto_747635 ) ) ( not ( = ?auto_747620 ?auto_747636 ) ) ( not ( = ?auto_747621 ?auto_747622 ) ) ( not ( = ?auto_747621 ?auto_747623 ) ) ( not ( = ?auto_747621 ?auto_747624 ) ) ( not ( = ?auto_747621 ?auto_747625 ) ) ( not ( = ?auto_747621 ?auto_747626 ) ) ( not ( = ?auto_747621 ?auto_747627 ) ) ( not ( = ?auto_747621 ?auto_747628 ) ) ( not ( = ?auto_747621 ?auto_747629 ) ) ( not ( = ?auto_747621 ?auto_747630 ) ) ( not ( = ?auto_747621 ?auto_747631 ) ) ( not ( = ?auto_747621 ?auto_747632 ) ) ( not ( = ?auto_747621 ?auto_747633 ) ) ( not ( = ?auto_747621 ?auto_747634 ) ) ( not ( = ?auto_747621 ?auto_747635 ) ) ( not ( = ?auto_747621 ?auto_747636 ) ) ( not ( = ?auto_747622 ?auto_747623 ) ) ( not ( = ?auto_747622 ?auto_747624 ) ) ( not ( = ?auto_747622 ?auto_747625 ) ) ( not ( = ?auto_747622 ?auto_747626 ) ) ( not ( = ?auto_747622 ?auto_747627 ) ) ( not ( = ?auto_747622 ?auto_747628 ) ) ( not ( = ?auto_747622 ?auto_747629 ) ) ( not ( = ?auto_747622 ?auto_747630 ) ) ( not ( = ?auto_747622 ?auto_747631 ) ) ( not ( = ?auto_747622 ?auto_747632 ) ) ( not ( = ?auto_747622 ?auto_747633 ) ) ( not ( = ?auto_747622 ?auto_747634 ) ) ( not ( = ?auto_747622 ?auto_747635 ) ) ( not ( = ?auto_747622 ?auto_747636 ) ) ( not ( = ?auto_747623 ?auto_747624 ) ) ( not ( = ?auto_747623 ?auto_747625 ) ) ( not ( = ?auto_747623 ?auto_747626 ) ) ( not ( = ?auto_747623 ?auto_747627 ) ) ( not ( = ?auto_747623 ?auto_747628 ) ) ( not ( = ?auto_747623 ?auto_747629 ) ) ( not ( = ?auto_747623 ?auto_747630 ) ) ( not ( = ?auto_747623 ?auto_747631 ) ) ( not ( = ?auto_747623 ?auto_747632 ) ) ( not ( = ?auto_747623 ?auto_747633 ) ) ( not ( = ?auto_747623 ?auto_747634 ) ) ( not ( = ?auto_747623 ?auto_747635 ) ) ( not ( = ?auto_747623 ?auto_747636 ) ) ( not ( = ?auto_747624 ?auto_747625 ) ) ( not ( = ?auto_747624 ?auto_747626 ) ) ( not ( = ?auto_747624 ?auto_747627 ) ) ( not ( = ?auto_747624 ?auto_747628 ) ) ( not ( = ?auto_747624 ?auto_747629 ) ) ( not ( = ?auto_747624 ?auto_747630 ) ) ( not ( = ?auto_747624 ?auto_747631 ) ) ( not ( = ?auto_747624 ?auto_747632 ) ) ( not ( = ?auto_747624 ?auto_747633 ) ) ( not ( = ?auto_747624 ?auto_747634 ) ) ( not ( = ?auto_747624 ?auto_747635 ) ) ( not ( = ?auto_747624 ?auto_747636 ) ) ( not ( = ?auto_747625 ?auto_747626 ) ) ( not ( = ?auto_747625 ?auto_747627 ) ) ( not ( = ?auto_747625 ?auto_747628 ) ) ( not ( = ?auto_747625 ?auto_747629 ) ) ( not ( = ?auto_747625 ?auto_747630 ) ) ( not ( = ?auto_747625 ?auto_747631 ) ) ( not ( = ?auto_747625 ?auto_747632 ) ) ( not ( = ?auto_747625 ?auto_747633 ) ) ( not ( = ?auto_747625 ?auto_747634 ) ) ( not ( = ?auto_747625 ?auto_747635 ) ) ( not ( = ?auto_747625 ?auto_747636 ) ) ( not ( = ?auto_747626 ?auto_747627 ) ) ( not ( = ?auto_747626 ?auto_747628 ) ) ( not ( = ?auto_747626 ?auto_747629 ) ) ( not ( = ?auto_747626 ?auto_747630 ) ) ( not ( = ?auto_747626 ?auto_747631 ) ) ( not ( = ?auto_747626 ?auto_747632 ) ) ( not ( = ?auto_747626 ?auto_747633 ) ) ( not ( = ?auto_747626 ?auto_747634 ) ) ( not ( = ?auto_747626 ?auto_747635 ) ) ( not ( = ?auto_747626 ?auto_747636 ) ) ( not ( = ?auto_747627 ?auto_747628 ) ) ( not ( = ?auto_747627 ?auto_747629 ) ) ( not ( = ?auto_747627 ?auto_747630 ) ) ( not ( = ?auto_747627 ?auto_747631 ) ) ( not ( = ?auto_747627 ?auto_747632 ) ) ( not ( = ?auto_747627 ?auto_747633 ) ) ( not ( = ?auto_747627 ?auto_747634 ) ) ( not ( = ?auto_747627 ?auto_747635 ) ) ( not ( = ?auto_747627 ?auto_747636 ) ) ( not ( = ?auto_747628 ?auto_747629 ) ) ( not ( = ?auto_747628 ?auto_747630 ) ) ( not ( = ?auto_747628 ?auto_747631 ) ) ( not ( = ?auto_747628 ?auto_747632 ) ) ( not ( = ?auto_747628 ?auto_747633 ) ) ( not ( = ?auto_747628 ?auto_747634 ) ) ( not ( = ?auto_747628 ?auto_747635 ) ) ( not ( = ?auto_747628 ?auto_747636 ) ) ( not ( = ?auto_747629 ?auto_747630 ) ) ( not ( = ?auto_747629 ?auto_747631 ) ) ( not ( = ?auto_747629 ?auto_747632 ) ) ( not ( = ?auto_747629 ?auto_747633 ) ) ( not ( = ?auto_747629 ?auto_747634 ) ) ( not ( = ?auto_747629 ?auto_747635 ) ) ( not ( = ?auto_747629 ?auto_747636 ) ) ( not ( = ?auto_747630 ?auto_747631 ) ) ( not ( = ?auto_747630 ?auto_747632 ) ) ( not ( = ?auto_747630 ?auto_747633 ) ) ( not ( = ?auto_747630 ?auto_747634 ) ) ( not ( = ?auto_747630 ?auto_747635 ) ) ( not ( = ?auto_747630 ?auto_747636 ) ) ( not ( = ?auto_747631 ?auto_747632 ) ) ( not ( = ?auto_747631 ?auto_747633 ) ) ( not ( = ?auto_747631 ?auto_747634 ) ) ( not ( = ?auto_747631 ?auto_747635 ) ) ( not ( = ?auto_747631 ?auto_747636 ) ) ( not ( = ?auto_747632 ?auto_747633 ) ) ( not ( = ?auto_747632 ?auto_747634 ) ) ( not ( = ?auto_747632 ?auto_747635 ) ) ( not ( = ?auto_747632 ?auto_747636 ) ) ( not ( = ?auto_747633 ?auto_747634 ) ) ( not ( = ?auto_747633 ?auto_747635 ) ) ( not ( = ?auto_747633 ?auto_747636 ) ) ( not ( = ?auto_747634 ?auto_747635 ) ) ( not ( = ?auto_747634 ?auto_747636 ) ) ( not ( = ?auto_747635 ?auto_747636 ) ) ( ON ?auto_747635 ?auto_747636 ) ( ON ?auto_747634 ?auto_747635 ) ( ON ?auto_747633 ?auto_747634 ) ( ON ?auto_747632 ?auto_747633 ) ( ON ?auto_747631 ?auto_747632 ) ( CLEAR ?auto_747629 ) ( ON ?auto_747630 ?auto_747631 ) ( CLEAR ?auto_747630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_747619 ?auto_747620 ?auto_747621 ?auto_747622 ?auto_747623 ?auto_747624 ?auto_747625 ?auto_747626 ?auto_747627 ?auto_747628 ?auto_747629 ?auto_747630 )
      ( MAKE-18PILE ?auto_747619 ?auto_747620 ?auto_747621 ?auto_747622 ?auto_747623 ?auto_747624 ?auto_747625 ?auto_747626 ?auto_747627 ?auto_747628 ?auto_747629 ?auto_747630 ?auto_747631 ?auto_747632 ?auto_747633 ?auto_747634 ?auto_747635 ?auto_747636 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747655 - BLOCK
      ?auto_747656 - BLOCK
      ?auto_747657 - BLOCK
      ?auto_747658 - BLOCK
      ?auto_747659 - BLOCK
      ?auto_747660 - BLOCK
      ?auto_747661 - BLOCK
      ?auto_747662 - BLOCK
      ?auto_747663 - BLOCK
      ?auto_747664 - BLOCK
      ?auto_747665 - BLOCK
      ?auto_747666 - BLOCK
      ?auto_747667 - BLOCK
      ?auto_747668 - BLOCK
      ?auto_747669 - BLOCK
      ?auto_747670 - BLOCK
      ?auto_747671 - BLOCK
      ?auto_747672 - BLOCK
    )
    :vars
    (
      ?auto_747673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747672 ?auto_747673 ) ( ON-TABLE ?auto_747655 ) ( ON ?auto_747656 ?auto_747655 ) ( ON ?auto_747657 ?auto_747656 ) ( ON ?auto_747658 ?auto_747657 ) ( ON ?auto_747659 ?auto_747658 ) ( ON ?auto_747660 ?auto_747659 ) ( ON ?auto_747661 ?auto_747660 ) ( ON ?auto_747662 ?auto_747661 ) ( ON ?auto_747663 ?auto_747662 ) ( ON ?auto_747664 ?auto_747663 ) ( not ( = ?auto_747655 ?auto_747656 ) ) ( not ( = ?auto_747655 ?auto_747657 ) ) ( not ( = ?auto_747655 ?auto_747658 ) ) ( not ( = ?auto_747655 ?auto_747659 ) ) ( not ( = ?auto_747655 ?auto_747660 ) ) ( not ( = ?auto_747655 ?auto_747661 ) ) ( not ( = ?auto_747655 ?auto_747662 ) ) ( not ( = ?auto_747655 ?auto_747663 ) ) ( not ( = ?auto_747655 ?auto_747664 ) ) ( not ( = ?auto_747655 ?auto_747665 ) ) ( not ( = ?auto_747655 ?auto_747666 ) ) ( not ( = ?auto_747655 ?auto_747667 ) ) ( not ( = ?auto_747655 ?auto_747668 ) ) ( not ( = ?auto_747655 ?auto_747669 ) ) ( not ( = ?auto_747655 ?auto_747670 ) ) ( not ( = ?auto_747655 ?auto_747671 ) ) ( not ( = ?auto_747655 ?auto_747672 ) ) ( not ( = ?auto_747655 ?auto_747673 ) ) ( not ( = ?auto_747656 ?auto_747657 ) ) ( not ( = ?auto_747656 ?auto_747658 ) ) ( not ( = ?auto_747656 ?auto_747659 ) ) ( not ( = ?auto_747656 ?auto_747660 ) ) ( not ( = ?auto_747656 ?auto_747661 ) ) ( not ( = ?auto_747656 ?auto_747662 ) ) ( not ( = ?auto_747656 ?auto_747663 ) ) ( not ( = ?auto_747656 ?auto_747664 ) ) ( not ( = ?auto_747656 ?auto_747665 ) ) ( not ( = ?auto_747656 ?auto_747666 ) ) ( not ( = ?auto_747656 ?auto_747667 ) ) ( not ( = ?auto_747656 ?auto_747668 ) ) ( not ( = ?auto_747656 ?auto_747669 ) ) ( not ( = ?auto_747656 ?auto_747670 ) ) ( not ( = ?auto_747656 ?auto_747671 ) ) ( not ( = ?auto_747656 ?auto_747672 ) ) ( not ( = ?auto_747656 ?auto_747673 ) ) ( not ( = ?auto_747657 ?auto_747658 ) ) ( not ( = ?auto_747657 ?auto_747659 ) ) ( not ( = ?auto_747657 ?auto_747660 ) ) ( not ( = ?auto_747657 ?auto_747661 ) ) ( not ( = ?auto_747657 ?auto_747662 ) ) ( not ( = ?auto_747657 ?auto_747663 ) ) ( not ( = ?auto_747657 ?auto_747664 ) ) ( not ( = ?auto_747657 ?auto_747665 ) ) ( not ( = ?auto_747657 ?auto_747666 ) ) ( not ( = ?auto_747657 ?auto_747667 ) ) ( not ( = ?auto_747657 ?auto_747668 ) ) ( not ( = ?auto_747657 ?auto_747669 ) ) ( not ( = ?auto_747657 ?auto_747670 ) ) ( not ( = ?auto_747657 ?auto_747671 ) ) ( not ( = ?auto_747657 ?auto_747672 ) ) ( not ( = ?auto_747657 ?auto_747673 ) ) ( not ( = ?auto_747658 ?auto_747659 ) ) ( not ( = ?auto_747658 ?auto_747660 ) ) ( not ( = ?auto_747658 ?auto_747661 ) ) ( not ( = ?auto_747658 ?auto_747662 ) ) ( not ( = ?auto_747658 ?auto_747663 ) ) ( not ( = ?auto_747658 ?auto_747664 ) ) ( not ( = ?auto_747658 ?auto_747665 ) ) ( not ( = ?auto_747658 ?auto_747666 ) ) ( not ( = ?auto_747658 ?auto_747667 ) ) ( not ( = ?auto_747658 ?auto_747668 ) ) ( not ( = ?auto_747658 ?auto_747669 ) ) ( not ( = ?auto_747658 ?auto_747670 ) ) ( not ( = ?auto_747658 ?auto_747671 ) ) ( not ( = ?auto_747658 ?auto_747672 ) ) ( not ( = ?auto_747658 ?auto_747673 ) ) ( not ( = ?auto_747659 ?auto_747660 ) ) ( not ( = ?auto_747659 ?auto_747661 ) ) ( not ( = ?auto_747659 ?auto_747662 ) ) ( not ( = ?auto_747659 ?auto_747663 ) ) ( not ( = ?auto_747659 ?auto_747664 ) ) ( not ( = ?auto_747659 ?auto_747665 ) ) ( not ( = ?auto_747659 ?auto_747666 ) ) ( not ( = ?auto_747659 ?auto_747667 ) ) ( not ( = ?auto_747659 ?auto_747668 ) ) ( not ( = ?auto_747659 ?auto_747669 ) ) ( not ( = ?auto_747659 ?auto_747670 ) ) ( not ( = ?auto_747659 ?auto_747671 ) ) ( not ( = ?auto_747659 ?auto_747672 ) ) ( not ( = ?auto_747659 ?auto_747673 ) ) ( not ( = ?auto_747660 ?auto_747661 ) ) ( not ( = ?auto_747660 ?auto_747662 ) ) ( not ( = ?auto_747660 ?auto_747663 ) ) ( not ( = ?auto_747660 ?auto_747664 ) ) ( not ( = ?auto_747660 ?auto_747665 ) ) ( not ( = ?auto_747660 ?auto_747666 ) ) ( not ( = ?auto_747660 ?auto_747667 ) ) ( not ( = ?auto_747660 ?auto_747668 ) ) ( not ( = ?auto_747660 ?auto_747669 ) ) ( not ( = ?auto_747660 ?auto_747670 ) ) ( not ( = ?auto_747660 ?auto_747671 ) ) ( not ( = ?auto_747660 ?auto_747672 ) ) ( not ( = ?auto_747660 ?auto_747673 ) ) ( not ( = ?auto_747661 ?auto_747662 ) ) ( not ( = ?auto_747661 ?auto_747663 ) ) ( not ( = ?auto_747661 ?auto_747664 ) ) ( not ( = ?auto_747661 ?auto_747665 ) ) ( not ( = ?auto_747661 ?auto_747666 ) ) ( not ( = ?auto_747661 ?auto_747667 ) ) ( not ( = ?auto_747661 ?auto_747668 ) ) ( not ( = ?auto_747661 ?auto_747669 ) ) ( not ( = ?auto_747661 ?auto_747670 ) ) ( not ( = ?auto_747661 ?auto_747671 ) ) ( not ( = ?auto_747661 ?auto_747672 ) ) ( not ( = ?auto_747661 ?auto_747673 ) ) ( not ( = ?auto_747662 ?auto_747663 ) ) ( not ( = ?auto_747662 ?auto_747664 ) ) ( not ( = ?auto_747662 ?auto_747665 ) ) ( not ( = ?auto_747662 ?auto_747666 ) ) ( not ( = ?auto_747662 ?auto_747667 ) ) ( not ( = ?auto_747662 ?auto_747668 ) ) ( not ( = ?auto_747662 ?auto_747669 ) ) ( not ( = ?auto_747662 ?auto_747670 ) ) ( not ( = ?auto_747662 ?auto_747671 ) ) ( not ( = ?auto_747662 ?auto_747672 ) ) ( not ( = ?auto_747662 ?auto_747673 ) ) ( not ( = ?auto_747663 ?auto_747664 ) ) ( not ( = ?auto_747663 ?auto_747665 ) ) ( not ( = ?auto_747663 ?auto_747666 ) ) ( not ( = ?auto_747663 ?auto_747667 ) ) ( not ( = ?auto_747663 ?auto_747668 ) ) ( not ( = ?auto_747663 ?auto_747669 ) ) ( not ( = ?auto_747663 ?auto_747670 ) ) ( not ( = ?auto_747663 ?auto_747671 ) ) ( not ( = ?auto_747663 ?auto_747672 ) ) ( not ( = ?auto_747663 ?auto_747673 ) ) ( not ( = ?auto_747664 ?auto_747665 ) ) ( not ( = ?auto_747664 ?auto_747666 ) ) ( not ( = ?auto_747664 ?auto_747667 ) ) ( not ( = ?auto_747664 ?auto_747668 ) ) ( not ( = ?auto_747664 ?auto_747669 ) ) ( not ( = ?auto_747664 ?auto_747670 ) ) ( not ( = ?auto_747664 ?auto_747671 ) ) ( not ( = ?auto_747664 ?auto_747672 ) ) ( not ( = ?auto_747664 ?auto_747673 ) ) ( not ( = ?auto_747665 ?auto_747666 ) ) ( not ( = ?auto_747665 ?auto_747667 ) ) ( not ( = ?auto_747665 ?auto_747668 ) ) ( not ( = ?auto_747665 ?auto_747669 ) ) ( not ( = ?auto_747665 ?auto_747670 ) ) ( not ( = ?auto_747665 ?auto_747671 ) ) ( not ( = ?auto_747665 ?auto_747672 ) ) ( not ( = ?auto_747665 ?auto_747673 ) ) ( not ( = ?auto_747666 ?auto_747667 ) ) ( not ( = ?auto_747666 ?auto_747668 ) ) ( not ( = ?auto_747666 ?auto_747669 ) ) ( not ( = ?auto_747666 ?auto_747670 ) ) ( not ( = ?auto_747666 ?auto_747671 ) ) ( not ( = ?auto_747666 ?auto_747672 ) ) ( not ( = ?auto_747666 ?auto_747673 ) ) ( not ( = ?auto_747667 ?auto_747668 ) ) ( not ( = ?auto_747667 ?auto_747669 ) ) ( not ( = ?auto_747667 ?auto_747670 ) ) ( not ( = ?auto_747667 ?auto_747671 ) ) ( not ( = ?auto_747667 ?auto_747672 ) ) ( not ( = ?auto_747667 ?auto_747673 ) ) ( not ( = ?auto_747668 ?auto_747669 ) ) ( not ( = ?auto_747668 ?auto_747670 ) ) ( not ( = ?auto_747668 ?auto_747671 ) ) ( not ( = ?auto_747668 ?auto_747672 ) ) ( not ( = ?auto_747668 ?auto_747673 ) ) ( not ( = ?auto_747669 ?auto_747670 ) ) ( not ( = ?auto_747669 ?auto_747671 ) ) ( not ( = ?auto_747669 ?auto_747672 ) ) ( not ( = ?auto_747669 ?auto_747673 ) ) ( not ( = ?auto_747670 ?auto_747671 ) ) ( not ( = ?auto_747670 ?auto_747672 ) ) ( not ( = ?auto_747670 ?auto_747673 ) ) ( not ( = ?auto_747671 ?auto_747672 ) ) ( not ( = ?auto_747671 ?auto_747673 ) ) ( not ( = ?auto_747672 ?auto_747673 ) ) ( ON ?auto_747671 ?auto_747672 ) ( ON ?auto_747670 ?auto_747671 ) ( ON ?auto_747669 ?auto_747670 ) ( ON ?auto_747668 ?auto_747669 ) ( ON ?auto_747667 ?auto_747668 ) ( ON ?auto_747666 ?auto_747667 ) ( CLEAR ?auto_747664 ) ( ON ?auto_747665 ?auto_747666 ) ( CLEAR ?auto_747665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_747655 ?auto_747656 ?auto_747657 ?auto_747658 ?auto_747659 ?auto_747660 ?auto_747661 ?auto_747662 ?auto_747663 ?auto_747664 ?auto_747665 )
      ( MAKE-18PILE ?auto_747655 ?auto_747656 ?auto_747657 ?auto_747658 ?auto_747659 ?auto_747660 ?auto_747661 ?auto_747662 ?auto_747663 ?auto_747664 ?auto_747665 ?auto_747666 ?auto_747667 ?auto_747668 ?auto_747669 ?auto_747670 ?auto_747671 ?auto_747672 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747692 - BLOCK
      ?auto_747693 - BLOCK
      ?auto_747694 - BLOCK
      ?auto_747695 - BLOCK
      ?auto_747696 - BLOCK
      ?auto_747697 - BLOCK
      ?auto_747698 - BLOCK
      ?auto_747699 - BLOCK
      ?auto_747700 - BLOCK
      ?auto_747701 - BLOCK
      ?auto_747702 - BLOCK
      ?auto_747703 - BLOCK
      ?auto_747704 - BLOCK
      ?auto_747705 - BLOCK
      ?auto_747706 - BLOCK
      ?auto_747707 - BLOCK
      ?auto_747708 - BLOCK
      ?auto_747709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_747709 ) ( ON-TABLE ?auto_747692 ) ( ON ?auto_747693 ?auto_747692 ) ( ON ?auto_747694 ?auto_747693 ) ( ON ?auto_747695 ?auto_747694 ) ( ON ?auto_747696 ?auto_747695 ) ( ON ?auto_747697 ?auto_747696 ) ( ON ?auto_747698 ?auto_747697 ) ( ON ?auto_747699 ?auto_747698 ) ( ON ?auto_747700 ?auto_747699 ) ( ON ?auto_747701 ?auto_747700 ) ( not ( = ?auto_747692 ?auto_747693 ) ) ( not ( = ?auto_747692 ?auto_747694 ) ) ( not ( = ?auto_747692 ?auto_747695 ) ) ( not ( = ?auto_747692 ?auto_747696 ) ) ( not ( = ?auto_747692 ?auto_747697 ) ) ( not ( = ?auto_747692 ?auto_747698 ) ) ( not ( = ?auto_747692 ?auto_747699 ) ) ( not ( = ?auto_747692 ?auto_747700 ) ) ( not ( = ?auto_747692 ?auto_747701 ) ) ( not ( = ?auto_747692 ?auto_747702 ) ) ( not ( = ?auto_747692 ?auto_747703 ) ) ( not ( = ?auto_747692 ?auto_747704 ) ) ( not ( = ?auto_747692 ?auto_747705 ) ) ( not ( = ?auto_747692 ?auto_747706 ) ) ( not ( = ?auto_747692 ?auto_747707 ) ) ( not ( = ?auto_747692 ?auto_747708 ) ) ( not ( = ?auto_747692 ?auto_747709 ) ) ( not ( = ?auto_747693 ?auto_747694 ) ) ( not ( = ?auto_747693 ?auto_747695 ) ) ( not ( = ?auto_747693 ?auto_747696 ) ) ( not ( = ?auto_747693 ?auto_747697 ) ) ( not ( = ?auto_747693 ?auto_747698 ) ) ( not ( = ?auto_747693 ?auto_747699 ) ) ( not ( = ?auto_747693 ?auto_747700 ) ) ( not ( = ?auto_747693 ?auto_747701 ) ) ( not ( = ?auto_747693 ?auto_747702 ) ) ( not ( = ?auto_747693 ?auto_747703 ) ) ( not ( = ?auto_747693 ?auto_747704 ) ) ( not ( = ?auto_747693 ?auto_747705 ) ) ( not ( = ?auto_747693 ?auto_747706 ) ) ( not ( = ?auto_747693 ?auto_747707 ) ) ( not ( = ?auto_747693 ?auto_747708 ) ) ( not ( = ?auto_747693 ?auto_747709 ) ) ( not ( = ?auto_747694 ?auto_747695 ) ) ( not ( = ?auto_747694 ?auto_747696 ) ) ( not ( = ?auto_747694 ?auto_747697 ) ) ( not ( = ?auto_747694 ?auto_747698 ) ) ( not ( = ?auto_747694 ?auto_747699 ) ) ( not ( = ?auto_747694 ?auto_747700 ) ) ( not ( = ?auto_747694 ?auto_747701 ) ) ( not ( = ?auto_747694 ?auto_747702 ) ) ( not ( = ?auto_747694 ?auto_747703 ) ) ( not ( = ?auto_747694 ?auto_747704 ) ) ( not ( = ?auto_747694 ?auto_747705 ) ) ( not ( = ?auto_747694 ?auto_747706 ) ) ( not ( = ?auto_747694 ?auto_747707 ) ) ( not ( = ?auto_747694 ?auto_747708 ) ) ( not ( = ?auto_747694 ?auto_747709 ) ) ( not ( = ?auto_747695 ?auto_747696 ) ) ( not ( = ?auto_747695 ?auto_747697 ) ) ( not ( = ?auto_747695 ?auto_747698 ) ) ( not ( = ?auto_747695 ?auto_747699 ) ) ( not ( = ?auto_747695 ?auto_747700 ) ) ( not ( = ?auto_747695 ?auto_747701 ) ) ( not ( = ?auto_747695 ?auto_747702 ) ) ( not ( = ?auto_747695 ?auto_747703 ) ) ( not ( = ?auto_747695 ?auto_747704 ) ) ( not ( = ?auto_747695 ?auto_747705 ) ) ( not ( = ?auto_747695 ?auto_747706 ) ) ( not ( = ?auto_747695 ?auto_747707 ) ) ( not ( = ?auto_747695 ?auto_747708 ) ) ( not ( = ?auto_747695 ?auto_747709 ) ) ( not ( = ?auto_747696 ?auto_747697 ) ) ( not ( = ?auto_747696 ?auto_747698 ) ) ( not ( = ?auto_747696 ?auto_747699 ) ) ( not ( = ?auto_747696 ?auto_747700 ) ) ( not ( = ?auto_747696 ?auto_747701 ) ) ( not ( = ?auto_747696 ?auto_747702 ) ) ( not ( = ?auto_747696 ?auto_747703 ) ) ( not ( = ?auto_747696 ?auto_747704 ) ) ( not ( = ?auto_747696 ?auto_747705 ) ) ( not ( = ?auto_747696 ?auto_747706 ) ) ( not ( = ?auto_747696 ?auto_747707 ) ) ( not ( = ?auto_747696 ?auto_747708 ) ) ( not ( = ?auto_747696 ?auto_747709 ) ) ( not ( = ?auto_747697 ?auto_747698 ) ) ( not ( = ?auto_747697 ?auto_747699 ) ) ( not ( = ?auto_747697 ?auto_747700 ) ) ( not ( = ?auto_747697 ?auto_747701 ) ) ( not ( = ?auto_747697 ?auto_747702 ) ) ( not ( = ?auto_747697 ?auto_747703 ) ) ( not ( = ?auto_747697 ?auto_747704 ) ) ( not ( = ?auto_747697 ?auto_747705 ) ) ( not ( = ?auto_747697 ?auto_747706 ) ) ( not ( = ?auto_747697 ?auto_747707 ) ) ( not ( = ?auto_747697 ?auto_747708 ) ) ( not ( = ?auto_747697 ?auto_747709 ) ) ( not ( = ?auto_747698 ?auto_747699 ) ) ( not ( = ?auto_747698 ?auto_747700 ) ) ( not ( = ?auto_747698 ?auto_747701 ) ) ( not ( = ?auto_747698 ?auto_747702 ) ) ( not ( = ?auto_747698 ?auto_747703 ) ) ( not ( = ?auto_747698 ?auto_747704 ) ) ( not ( = ?auto_747698 ?auto_747705 ) ) ( not ( = ?auto_747698 ?auto_747706 ) ) ( not ( = ?auto_747698 ?auto_747707 ) ) ( not ( = ?auto_747698 ?auto_747708 ) ) ( not ( = ?auto_747698 ?auto_747709 ) ) ( not ( = ?auto_747699 ?auto_747700 ) ) ( not ( = ?auto_747699 ?auto_747701 ) ) ( not ( = ?auto_747699 ?auto_747702 ) ) ( not ( = ?auto_747699 ?auto_747703 ) ) ( not ( = ?auto_747699 ?auto_747704 ) ) ( not ( = ?auto_747699 ?auto_747705 ) ) ( not ( = ?auto_747699 ?auto_747706 ) ) ( not ( = ?auto_747699 ?auto_747707 ) ) ( not ( = ?auto_747699 ?auto_747708 ) ) ( not ( = ?auto_747699 ?auto_747709 ) ) ( not ( = ?auto_747700 ?auto_747701 ) ) ( not ( = ?auto_747700 ?auto_747702 ) ) ( not ( = ?auto_747700 ?auto_747703 ) ) ( not ( = ?auto_747700 ?auto_747704 ) ) ( not ( = ?auto_747700 ?auto_747705 ) ) ( not ( = ?auto_747700 ?auto_747706 ) ) ( not ( = ?auto_747700 ?auto_747707 ) ) ( not ( = ?auto_747700 ?auto_747708 ) ) ( not ( = ?auto_747700 ?auto_747709 ) ) ( not ( = ?auto_747701 ?auto_747702 ) ) ( not ( = ?auto_747701 ?auto_747703 ) ) ( not ( = ?auto_747701 ?auto_747704 ) ) ( not ( = ?auto_747701 ?auto_747705 ) ) ( not ( = ?auto_747701 ?auto_747706 ) ) ( not ( = ?auto_747701 ?auto_747707 ) ) ( not ( = ?auto_747701 ?auto_747708 ) ) ( not ( = ?auto_747701 ?auto_747709 ) ) ( not ( = ?auto_747702 ?auto_747703 ) ) ( not ( = ?auto_747702 ?auto_747704 ) ) ( not ( = ?auto_747702 ?auto_747705 ) ) ( not ( = ?auto_747702 ?auto_747706 ) ) ( not ( = ?auto_747702 ?auto_747707 ) ) ( not ( = ?auto_747702 ?auto_747708 ) ) ( not ( = ?auto_747702 ?auto_747709 ) ) ( not ( = ?auto_747703 ?auto_747704 ) ) ( not ( = ?auto_747703 ?auto_747705 ) ) ( not ( = ?auto_747703 ?auto_747706 ) ) ( not ( = ?auto_747703 ?auto_747707 ) ) ( not ( = ?auto_747703 ?auto_747708 ) ) ( not ( = ?auto_747703 ?auto_747709 ) ) ( not ( = ?auto_747704 ?auto_747705 ) ) ( not ( = ?auto_747704 ?auto_747706 ) ) ( not ( = ?auto_747704 ?auto_747707 ) ) ( not ( = ?auto_747704 ?auto_747708 ) ) ( not ( = ?auto_747704 ?auto_747709 ) ) ( not ( = ?auto_747705 ?auto_747706 ) ) ( not ( = ?auto_747705 ?auto_747707 ) ) ( not ( = ?auto_747705 ?auto_747708 ) ) ( not ( = ?auto_747705 ?auto_747709 ) ) ( not ( = ?auto_747706 ?auto_747707 ) ) ( not ( = ?auto_747706 ?auto_747708 ) ) ( not ( = ?auto_747706 ?auto_747709 ) ) ( not ( = ?auto_747707 ?auto_747708 ) ) ( not ( = ?auto_747707 ?auto_747709 ) ) ( not ( = ?auto_747708 ?auto_747709 ) ) ( ON ?auto_747708 ?auto_747709 ) ( ON ?auto_747707 ?auto_747708 ) ( ON ?auto_747706 ?auto_747707 ) ( ON ?auto_747705 ?auto_747706 ) ( ON ?auto_747704 ?auto_747705 ) ( ON ?auto_747703 ?auto_747704 ) ( CLEAR ?auto_747701 ) ( ON ?auto_747702 ?auto_747703 ) ( CLEAR ?auto_747702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_747692 ?auto_747693 ?auto_747694 ?auto_747695 ?auto_747696 ?auto_747697 ?auto_747698 ?auto_747699 ?auto_747700 ?auto_747701 ?auto_747702 )
      ( MAKE-18PILE ?auto_747692 ?auto_747693 ?auto_747694 ?auto_747695 ?auto_747696 ?auto_747697 ?auto_747698 ?auto_747699 ?auto_747700 ?auto_747701 ?auto_747702 ?auto_747703 ?auto_747704 ?auto_747705 ?auto_747706 ?auto_747707 ?auto_747708 ?auto_747709 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747728 - BLOCK
      ?auto_747729 - BLOCK
      ?auto_747730 - BLOCK
      ?auto_747731 - BLOCK
      ?auto_747732 - BLOCK
      ?auto_747733 - BLOCK
      ?auto_747734 - BLOCK
      ?auto_747735 - BLOCK
      ?auto_747736 - BLOCK
      ?auto_747737 - BLOCK
      ?auto_747738 - BLOCK
      ?auto_747739 - BLOCK
      ?auto_747740 - BLOCK
      ?auto_747741 - BLOCK
      ?auto_747742 - BLOCK
      ?auto_747743 - BLOCK
      ?auto_747744 - BLOCK
      ?auto_747745 - BLOCK
    )
    :vars
    (
      ?auto_747746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747745 ?auto_747746 ) ( ON-TABLE ?auto_747728 ) ( ON ?auto_747729 ?auto_747728 ) ( ON ?auto_747730 ?auto_747729 ) ( ON ?auto_747731 ?auto_747730 ) ( ON ?auto_747732 ?auto_747731 ) ( ON ?auto_747733 ?auto_747732 ) ( ON ?auto_747734 ?auto_747733 ) ( ON ?auto_747735 ?auto_747734 ) ( ON ?auto_747736 ?auto_747735 ) ( not ( = ?auto_747728 ?auto_747729 ) ) ( not ( = ?auto_747728 ?auto_747730 ) ) ( not ( = ?auto_747728 ?auto_747731 ) ) ( not ( = ?auto_747728 ?auto_747732 ) ) ( not ( = ?auto_747728 ?auto_747733 ) ) ( not ( = ?auto_747728 ?auto_747734 ) ) ( not ( = ?auto_747728 ?auto_747735 ) ) ( not ( = ?auto_747728 ?auto_747736 ) ) ( not ( = ?auto_747728 ?auto_747737 ) ) ( not ( = ?auto_747728 ?auto_747738 ) ) ( not ( = ?auto_747728 ?auto_747739 ) ) ( not ( = ?auto_747728 ?auto_747740 ) ) ( not ( = ?auto_747728 ?auto_747741 ) ) ( not ( = ?auto_747728 ?auto_747742 ) ) ( not ( = ?auto_747728 ?auto_747743 ) ) ( not ( = ?auto_747728 ?auto_747744 ) ) ( not ( = ?auto_747728 ?auto_747745 ) ) ( not ( = ?auto_747728 ?auto_747746 ) ) ( not ( = ?auto_747729 ?auto_747730 ) ) ( not ( = ?auto_747729 ?auto_747731 ) ) ( not ( = ?auto_747729 ?auto_747732 ) ) ( not ( = ?auto_747729 ?auto_747733 ) ) ( not ( = ?auto_747729 ?auto_747734 ) ) ( not ( = ?auto_747729 ?auto_747735 ) ) ( not ( = ?auto_747729 ?auto_747736 ) ) ( not ( = ?auto_747729 ?auto_747737 ) ) ( not ( = ?auto_747729 ?auto_747738 ) ) ( not ( = ?auto_747729 ?auto_747739 ) ) ( not ( = ?auto_747729 ?auto_747740 ) ) ( not ( = ?auto_747729 ?auto_747741 ) ) ( not ( = ?auto_747729 ?auto_747742 ) ) ( not ( = ?auto_747729 ?auto_747743 ) ) ( not ( = ?auto_747729 ?auto_747744 ) ) ( not ( = ?auto_747729 ?auto_747745 ) ) ( not ( = ?auto_747729 ?auto_747746 ) ) ( not ( = ?auto_747730 ?auto_747731 ) ) ( not ( = ?auto_747730 ?auto_747732 ) ) ( not ( = ?auto_747730 ?auto_747733 ) ) ( not ( = ?auto_747730 ?auto_747734 ) ) ( not ( = ?auto_747730 ?auto_747735 ) ) ( not ( = ?auto_747730 ?auto_747736 ) ) ( not ( = ?auto_747730 ?auto_747737 ) ) ( not ( = ?auto_747730 ?auto_747738 ) ) ( not ( = ?auto_747730 ?auto_747739 ) ) ( not ( = ?auto_747730 ?auto_747740 ) ) ( not ( = ?auto_747730 ?auto_747741 ) ) ( not ( = ?auto_747730 ?auto_747742 ) ) ( not ( = ?auto_747730 ?auto_747743 ) ) ( not ( = ?auto_747730 ?auto_747744 ) ) ( not ( = ?auto_747730 ?auto_747745 ) ) ( not ( = ?auto_747730 ?auto_747746 ) ) ( not ( = ?auto_747731 ?auto_747732 ) ) ( not ( = ?auto_747731 ?auto_747733 ) ) ( not ( = ?auto_747731 ?auto_747734 ) ) ( not ( = ?auto_747731 ?auto_747735 ) ) ( not ( = ?auto_747731 ?auto_747736 ) ) ( not ( = ?auto_747731 ?auto_747737 ) ) ( not ( = ?auto_747731 ?auto_747738 ) ) ( not ( = ?auto_747731 ?auto_747739 ) ) ( not ( = ?auto_747731 ?auto_747740 ) ) ( not ( = ?auto_747731 ?auto_747741 ) ) ( not ( = ?auto_747731 ?auto_747742 ) ) ( not ( = ?auto_747731 ?auto_747743 ) ) ( not ( = ?auto_747731 ?auto_747744 ) ) ( not ( = ?auto_747731 ?auto_747745 ) ) ( not ( = ?auto_747731 ?auto_747746 ) ) ( not ( = ?auto_747732 ?auto_747733 ) ) ( not ( = ?auto_747732 ?auto_747734 ) ) ( not ( = ?auto_747732 ?auto_747735 ) ) ( not ( = ?auto_747732 ?auto_747736 ) ) ( not ( = ?auto_747732 ?auto_747737 ) ) ( not ( = ?auto_747732 ?auto_747738 ) ) ( not ( = ?auto_747732 ?auto_747739 ) ) ( not ( = ?auto_747732 ?auto_747740 ) ) ( not ( = ?auto_747732 ?auto_747741 ) ) ( not ( = ?auto_747732 ?auto_747742 ) ) ( not ( = ?auto_747732 ?auto_747743 ) ) ( not ( = ?auto_747732 ?auto_747744 ) ) ( not ( = ?auto_747732 ?auto_747745 ) ) ( not ( = ?auto_747732 ?auto_747746 ) ) ( not ( = ?auto_747733 ?auto_747734 ) ) ( not ( = ?auto_747733 ?auto_747735 ) ) ( not ( = ?auto_747733 ?auto_747736 ) ) ( not ( = ?auto_747733 ?auto_747737 ) ) ( not ( = ?auto_747733 ?auto_747738 ) ) ( not ( = ?auto_747733 ?auto_747739 ) ) ( not ( = ?auto_747733 ?auto_747740 ) ) ( not ( = ?auto_747733 ?auto_747741 ) ) ( not ( = ?auto_747733 ?auto_747742 ) ) ( not ( = ?auto_747733 ?auto_747743 ) ) ( not ( = ?auto_747733 ?auto_747744 ) ) ( not ( = ?auto_747733 ?auto_747745 ) ) ( not ( = ?auto_747733 ?auto_747746 ) ) ( not ( = ?auto_747734 ?auto_747735 ) ) ( not ( = ?auto_747734 ?auto_747736 ) ) ( not ( = ?auto_747734 ?auto_747737 ) ) ( not ( = ?auto_747734 ?auto_747738 ) ) ( not ( = ?auto_747734 ?auto_747739 ) ) ( not ( = ?auto_747734 ?auto_747740 ) ) ( not ( = ?auto_747734 ?auto_747741 ) ) ( not ( = ?auto_747734 ?auto_747742 ) ) ( not ( = ?auto_747734 ?auto_747743 ) ) ( not ( = ?auto_747734 ?auto_747744 ) ) ( not ( = ?auto_747734 ?auto_747745 ) ) ( not ( = ?auto_747734 ?auto_747746 ) ) ( not ( = ?auto_747735 ?auto_747736 ) ) ( not ( = ?auto_747735 ?auto_747737 ) ) ( not ( = ?auto_747735 ?auto_747738 ) ) ( not ( = ?auto_747735 ?auto_747739 ) ) ( not ( = ?auto_747735 ?auto_747740 ) ) ( not ( = ?auto_747735 ?auto_747741 ) ) ( not ( = ?auto_747735 ?auto_747742 ) ) ( not ( = ?auto_747735 ?auto_747743 ) ) ( not ( = ?auto_747735 ?auto_747744 ) ) ( not ( = ?auto_747735 ?auto_747745 ) ) ( not ( = ?auto_747735 ?auto_747746 ) ) ( not ( = ?auto_747736 ?auto_747737 ) ) ( not ( = ?auto_747736 ?auto_747738 ) ) ( not ( = ?auto_747736 ?auto_747739 ) ) ( not ( = ?auto_747736 ?auto_747740 ) ) ( not ( = ?auto_747736 ?auto_747741 ) ) ( not ( = ?auto_747736 ?auto_747742 ) ) ( not ( = ?auto_747736 ?auto_747743 ) ) ( not ( = ?auto_747736 ?auto_747744 ) ) ( not ( = ?auto_747736 ?auto_747745 ) ) ( not ( = ?auto_747736 ?auto_747746 ) ) ( not ( = ?auto_747737 ?auto_747738 ) ) ( not ( = ?auto_747737 ?auto_747739 ) ) ( not ( = ?auto_747737 ?auto_747740 ) ) ( not ( = ?auto_747737 ?auto_747741 ) ) ( not ( = ?auto_747737 ?auto_747742 ) ) ( not ( = ?auto_747737 ?auto_747743 ) ) ( not ( = ?auto_747737 ?auto_747744 ) ) ( not ( = ?auto_747737 ?auto_747745 ) ) ( not ( = ?auto_747737 ?auto_747746 ) ) ( not ( = ?auto_747738 ?auto_747739 ) ) ( not ( = ?auto_747738 ?auto_747740 ) ) ( not ( = ?auto_747738 ?auto_747741 ) ) ( not ( = ?auto_747738 ?auto_747742 ) ) ( not ( = ?auto_747738 ?auto_747743 ) ) ( not ( = ?auto_747738 ?auto_747744 ) ) ( not ( = ?auto_747738 ?auto_747745 ) ) ( not ( = ?auto_747738 ?auto_747746 ) ) ( not ( = ?auto_747739 ?auto_747740 ) ) ( not ( = ?auto_747739 ?auto_747741 ) ) ( not ( = ?auto_747739 ?auto_747742 ) ) ( not ( = ?auto_747739 ?auto_747743 ) ) ( not ( = ?auto_747739 ?auto_747744 ) ) ( not ( = ?auto_747739 ?auto_747745 ) ) ( not ( = ?auto_747739 ?auto_747746 ) ) ( not ( = ?auto_747740 ?auto_747741 ) ) ( not ( = ?auto_747740 ?auto_747742 ) ) ( not ( = ?auto_747740 ?auto_747743 ) ) ( not ( = ?auto_747740 ?auto_747744 ) ) ( not ( = ?auto_747740 ?auto_747745 ) ) ( not ( = ?auto_747740 ?auto_747746 ) ) ( not ( = ?auto_747741 ?auto_747742 ) ) ( not ( = ?auto_747741 ?auto_747743 ) ) ( not ( = ?auto_747741 ?auto_747744 ) ) ( not ( = ?auto_747741 ?auto_747745 ) ) ( not ( = ?auto_747741 ?auto_747746 ) ) ( not ( = ?auto_747742 ?auto_747743 ) ) ( not ( = ?auto_747742 ?auto_747744 ) ) ( not ( = ?auto_747742 ?auto_747745 ) ) ( not ( = ?auto_747742 ?auto_747746 ) ) ( not ( = ?auto_747743 ?auto_747744 ) ) ( not ( = ?auto_747743 ?auto_747745 ) ) ( not ( = ?auto_747743 ?auto_747746 ) ) ( not ( = ?auto_747744 ?auto_747745 ) ) ( not ( = ?auto_747744 ?auto_747746 ) ) ( not ( = ?auto_747745 ?auto_747746 ) ) ( ON ?auto_747744 ?auto_747745 ) ( ON ?auto_747743 ?auto_747744 ) ( ON ?auto_747742 ?auto_747743 ) ( ON ?auto_747741 ?auto_747742 ) ( ON ?auto_747740 ?auto_747741 ) ( ON ?auto_747739 ?auto_747740 ) ( ON ?auto_747738 ?auto_747739 ) ( CLEAR ?auto_747736 ) ( ON ?auto_747737 ?auto_747738 ) ( CLEAR ?auto_747737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_747728 ?auto_747729 ?auto_747730 ?auto_747731 ?auto_747732 ?auto_747733 ?auto_747734 ?auto_747735 ?auto_747736 ?auto_747737 )
      ( MAKE-18PILE ?auto_747728 ?auto_747729 ?auto_747730 ?auto_747731 ?auto_747732 ?auto_747733 ?auto_747734 ?auto_747735 ?auto_747736 ?auto_747737 ?auto_747738 ?auto_747739 ?auto_747740 ?auto_747741 ?auto_747742 ?auto_747743 ?auto_747744 ?auto_747745 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747765 - BLOCK
      ?auto_747766 - BLOCK
      ?auto_747767 - BLOCK
      ?auto_747768 - BLOCK
      ?auto_747769 - BLOCK
      ?auto_747770 - BLOCK
      ?auto_747771 - BLOCK
      ?auto_747772 - BLOCK
      ?auto_747773 - BLOCK
      ?auto_747774 - BLOCK
      ?auto_747775 - BLOCK
      ?auto_747776 - BLOCK
      ?auto_747777 - BLOCK
      ?auto_747778 - BLOCK
      ?auto_747779 - BLOCK
      ?auto_747780 - BLOCK
      ?auto_747781 - BLOCK
      ?auto_747782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_747782 ) ( ON-TABLE ?auto_747765 ) ( ON ?auto_747766 ?auto_747765 ) ( ON ?auto_747767 ?auto_747766 ) ( ON ?auto_747768 ?auto_747767 ) ( ON ?auto_747769 ?auto_747768 ) ( ON ?auto_747770 ?auto_747769 ) ( ON ?auto_747771 ?auto_747770 ) ( ON ?auto_747772 ?auto_747771 ) ( ON ?auto_747773 ?auto_747772 ) ( not ( = ?auto_747765 ?auto_747766 ) ) ( not ( = ?auto_747765 ?auto_747767 ) ) ( not ( = ?auto_747765 ?auto_747768 ) ) ( not ( = ?auto_747765 ?auto_747769 ) ) ( not ( = ?auto_747765 ?auto_747770 ) ) ( not ( = ?auto_747765 ?auto_747771 ) ) ( not ( = ?auto_747765 ?auto_747772 ) ) ( not ( = ?auto_747765 ?auto_747773 ) ) ( not ( = ?auto_747765 ?auto_747774 ) ) ( not ( = ?auto_747765 ?auto_747775 ) ) ( not ( = ?auto_747765 ?auto_747776 ) ) ( not ( = ?auto_747765 ?auto_747777 ) ) ( not ( = ?auto_747765 ?auto_747778 ) ) ( not ( = ?auto_747765 ?auto_747779 ) ) ( not ( = ?auto_747765 ?auto_747780 ) ) ( not ( = ?auto_747765 ?auto_747781 ) ) ( not ( = ?auto_747765 ?auto_747782 ) ) ( not ( = ?auto_747766 ?auto_747767 ) ) ( not ( = ?auto_747766 ?auto_747768 ) ) ( not ( = ?auto_747766 ?auto_747769 ) ) ( not ( = ?auto_747766 ?auto_747770 ) ) ( not ( = ?auto_747766 ?auto_747771 ) ) ( not ( = ?auto_747766 ?auto_747772 ) ) ( not ( = ?auto_747766 ?auto_747773 ) ) ( not ( = ?auto_747766 ?auto_747774 ) ) ( not ( = ?auto_747766 ?auto_747775 ) ) ( not ( = ?auto_747766 ?auto_747776 ) ) ( not ( = ?auto_747766 ?auto_747777 ) ) ( not ( = ?auto_747766 ?auto_747778 ) ) ( not ( = ?auto_747766 ?auto_747779 ) ) ( not ( = ?auto_747766 ?auto_747780 ) ) ( not ( = ?auto_747766 ?auto_747781 ) ) ( not ( = ?auto_747766 ?auto_747782 ) ) ( not ( = ?auto_747767 ?auto_747768 ) ) ( not ( = ?auto_747767 ?auto_747769 ) ) ( not ( = ?auto_747767 ?auto_747770 ) ) ( not ( = ?auto_747767 ?auto_747771 ) ) ( not ( = ?auto_747767 ?auto_747772 ) ) ( not ( = ?auto_747767 ?auto_747773 ) ) ( not ( = ?auto_747767 ?auto_747774 ) ) ( not ( = ?auto_747767 ?auto_747775 ) ) ( not ( = ?auto_747767 ?auto_747776 ) ) ( not ( = ?auto_747767 ?auto_747777 ) ) ( not ( = ?auto_747767 ?auto_747778 ) ) ( not ( = ?auto_747767 ?auto_747779 ) ) ( not ( = ?auto_747767 ?auto_747780 ) ) ( not ( = ?auto_747767 ?auto_747781 ) ) ( not ( = ?auto_747767 ?auto_747782 ) ) ( not ( = ?auto_747768 ?auto_747769 ) ) ( not ( = ?auto_747768 ?auto_747770 ) ) ( not ( = ?auto_747768 ?auto_747771 ) ) ( not ( = ?auto_747768 ?auto_747772 ) ) ( not ( = ?auto_747768 ?auto_747773 ) ) ( not ( = ?auto_747768 ?auto_747774 ) ) ( not ( = ?auto_747768 ?auto_747775 ) ) ( not ( = ?auto_747768 ?auto_747776 ) ) ( not ( = ?auto_747768 ?auto_747777 ) ) ( not ( = ?auto_747768 ?auto_747778 ) ) ( not ( = ?auto_747768 ?auto_747779 ) ) ( not ( = ?auto_747768 ?auto_747780 ) ) ( not ( = ?auto_747768 ?auto_747781 ) ) ( not ( = ?auto_747768 ?auto_747782 ) ) ( not ( = ?auto_747769 ?auto_747770 ) ) ( not ( = ?auto_747769 ?auto_747771 ) ) ( not ( = ?auto_747769 ?auto_747772 ) ) ( not ( = ?auto_747769 ?auto_747773 ) ) ( not ( = ?auto_747769 ?auto_747774 ) ) ( not ( = ?auto_747769 ?auto_747775 ) ) ( not ( = ?auto_747769 ?auto_747776 ) ) ( not ( = ?auto_747769 ?auto_747777 ) ) ( not ( = ?auto_747769 ?auto_747778 ) ) ( not ( = ?auto_747769 ?auto_747779 ) ) ( not ( = ?auto_747769 ?auto_747780 ) ) ( not ( = ?auto_747769 ?auto_747781 ) ) ( not ( = ?auto_747769 ?auto_747782 ) ) ( not ( = ?auto_747770 ?auto_747771 ) ) ( not ( = ?auto_747770 ?auto_747772 ) ) ( not ( = ?auto_747770 ?auto_747773 ) ) ( not ( = ?auto_747770 ?auto_747774 ) ) ( not ( = ?auto_747770 ?auto_747775 ) ) ( not ( = ?auto_747770 ?auto_747776 ) ) ( not ( = ?auto_747770 ?auto_747777 ) ) ( not ( = ?auto_747770 ?auto_747778 ) ) ( not ( = ?auto_747770 ?auto_747779 ) ) ( not ( = ?auto_747770 ?auto_747780 ) ) ( not ( = ?auto_747770 ?auto_747781 ) ) ( not ( = ?auto_747770 ?auto_747782 ) ) ( not ( = ?auto_747771 ?auto_747772 ) ) ( not ( = ?auto_747771 ?auto_747773 ) ) ( not ( = ?auto_747771 ?auto_747774 ) ) ( not ( = ?auto_747771 ?auto_747775 ) ) ( not ( = ?auto_747771 ?auto_747776 ) ) ( not ( = ?auto_747771 ?auto_747777 ) ) ( not ( = ?auto_747771 ?auto_747778 ) ) ( not ( = ?auto_747771 ?auto_747779 ) ) ( not ( = ?auto_747771 ?auto_747780 ) ) ( not ( = ?auto_747771 ?auto_747781 ) ) ( not ( = ?auto_747771 ?auto_747782 ) ) ( not ( = ?auto_747772 ?auto_747773 ) ) ( not ( = ?auto_747772 ?auto_747774 ) ) ( not ( = ?auto_747772 ?auto_747775 ) ) ( not ( = ?auto_747772 ?auto_747776 ) ) ( not ( = ?auto_747772 ?auto_747777 ) ) ( not ( = ?auto_747772 ?auto_747778 ) ) ( not ( = ?auto_747772 ?auto_747779 ) ) ( not ( = ?auto_747772 ?auto_747780 ) ) ( not ( = ?auto_747772 ?auto_747781 ) ) ( not ( = ?auto_747772 ?auto_747782 ) ) ( not ( = ?auto_747773 ?auto_747774 ) ) ( not ( = ?auto_747773 ?auto_747775 ) ) ( not ( = ?auto_747773 ?auto_747776 ) ) ( not ( = ?auto_747773 ?auto_747777 ) ) ( not ( = ?auto_747773 ?auto_747778 ) ) ( not ( = ?auto_747773 ?auto_747779 ) ) ( not ( = ?auto_747773 ?auto_747780 ) ) ( not ( = ?auto_747773 ?auto_747781 ) ) ( not ( = ?auto_747773 ?auto_747782 ) ) ( not ( = ?auto_747774 ?auto_747775 ) ) ( not ( = ?auto_747774 ?auto_747776 ) ) ( not ( = ?auto_747774 ?auto_747777 ) ) ( not ( = ?auto_747774 ?auto_747778 ) ) ( not ( = ?auto_747774 ?auto_747779 ) ) ( not ( = ?auto_747774 ?auto_747780 ) ) ( not ( = ?auto_747774 ?auto_747781 ) ) ( not ( = ?auto_747774 ?auto_747782 ) ) ( not ( = ?auto_747775 ?auto_747776 ) ) ( not ( = ?auto_747775 ?auto_747777 ) ) ( not ( = ?auto_747775 ?auto_747778 ) ) ( not ( = ?auto_747775 ?auto_747779 ) ) ( not ( = ?auto_747775 ?auto_747780 ) ) ( not ( = ?auto_747775 ?auto_747781 ) ) ( not ( = ?auto_747775 ?auto_747782 ) ) ( not ( = ?auto_747776 ?auto_747777 ) ) ( not ( = ?auto_747776 ?auto_747778 ) ) ( not ( = ?auto_747776 ?auto_747779 ) ) ( not ( = ?auto_747776 ?auto_747780 ) ) ( not ( = ?auto_747776 ?auto_747781 ) ) ( not ( = ?auto_747776 ?auto_747782 ) ) ( not ( = ?auto_747777 ?auto_747778 ) ) ( not ( = ?auto_747777 ?auto_747779 ) ) ( not ( = ?auto_747777 ?auto_747780 ) ) ( not ( = ?auto_747777 ?auto_747781 ) ) ( not ( = ?auto_747777 ?auto_747782 ) ) ( not ( = ?auto_747778 ?auto_747779 ) ) ( not ( = ?auto_747778 ?auto_747780 ) ) ( not ( = ?auto_747778 ?auto_747781 ) ) ( not ( = ?auto_747778 ?auto_747782 ) ) ( not ( = ?auto_747779 ?auto_747780 ) ) ( not ( = ?auto_747779 ?auto_747781 ) ) ( not ( = ?auto_747779 ?auto_747782 ) ) ( not ( = ?auto_747780 ?auto_747781 ) ) ( not ( = ?auto_747780 ?auto_747782 ) ) ( not ( = ?auto_747781 ?auto_747782 ) ) ( ON ?auto_747781 ?auto_747782 ) ( ON ?auto_747780 ?auto_747781 ) ( ON ?auto_747779 ?auto_747780 ) ( ON ?auto_747778 ?auto_747779 ) ( ON ?auto_747777 ?auto_747778 ) ( ON ?auto_747776 ?auto_747777 ) ( ON ?auto_747775 ?auto_747776 ) ( CLEAR ?auto_747773 ) ( ON ?auto_747774 ?auto_747775 ) ( CLEAR ?auto_747774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_747765 ?auto_747766 ?auto_747767 ?auto_747768 ?auto_747769 ?auto_747770 ?auto_747771 ?auto_747772 ?auto_747773 ?auto_747774 )
      ( MAKE-18PILE ?auto_747765 ?auto_747766 ?auto_747767 ?auto_747768 ?auto_747769 ?auto_747770 ?auto_747771 ?auto_747772 ?auto_747773 ?auto_747774 ?auto_747775 ?auto_747776 ?auto_747777 ?auto_747778 ?auto_747779 ?auto_747780 ?auto_747781 ?auto_747782 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747801 - BLOCK
      ?auto_747802 - BLOCK
      ?auto_747803 - BLOCK
      ?auto_747804 - BLOCK
      ?auto_747805 - BLOCK
      ?auto_747806 - BLOCK
      ?auto_747807 - BLOCK
      ?auto_747808 - BLOCK
      ?auto_747809 - BLOCK
      ?auto_747810 - BLOCK
      ?auto_747811 - BLOCK
      ?auto_747812 - BLOCK
      ?auto_747813 - BLOCK
      ?auto_747814 - BLOCK
      ?auto_747815 - BLOCK
      ?auto_747816 - BLOCK
      ?auto_747817 - BLOCK
      ?auto_747818 - BLOCK
    )
    :vars
    (
      ?auto_747819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747818 ?auto_747819 ) ( ON-TABLE ?auto_747801 ) ( ON ?auto_747802 ?auto_747801 ) ( ON ?auto_747803 ?auto_747802 ) ( ON ?auto_747804 ?auto_747803 ) ( ON ?auto_747805 ?auto_747804 ) ( ON ?auto_747806 ?auto_747805 ) ( ON ?auto_747807 ?auto_747806 ) ( ON ?auto_747808 ?auto_747807 ) ( not ( = ?auto_747801 ?auto_747802 ) ) ( not ( = ?auto_747801 ?auto_747803 ) ) ( not ( = ?auto_747801 ?auto_747804 ) ) ( not ( = ?auto_747801 ?auto_747805 ) ) ( not ( = ?auto_747801 ?auto_747806 ) ) ( not ( = ?auto_747801 ?auto_747807 ) ) ( not ( = ?auto_747801 ?auto_747808 ) ) ( not ( = ?auto_747801 ?auto_747809 ) ) ( not ( = ?auto_747801 ?auto_747810 ) ) ( not ( = ?auto_747801 ?auto_747811 ) ) ( not ( = ?auto_747801 ?auto_747812 ) ) ( not ( = ?auto_747801 ?auto_747813 ) ) ( not ( = ?auto_747801 ?auto_747814 ) ) ( not ( = ?auto_747801 ?auto_747815 ) ) ( not ( = ?auto_747801 ?auto_747816 ) ) ( not ( = ?auto_747801 ?auto_747817 ) ) ( not ( = ?auto_747801 ?auto_747818 ) ) ( not ( = ?auto_747801 ?auto_747819 ) ) ( not ( = ?auto_747802 ?auto_747803 ) ) ( not ( = ?auto_747802 ?auto_747804 ) ) ( not ( = ?auto_747802 ?auto_747805 ) ) ( not ( = ?auto_747802 ?auto_747806 ) ) ( not ( = ?auto_747802 ?auto_747807 ) ) ( not ( = ?auto_747802 ?auto_747808 ) ) ( not ( = ?auto_747802 ?auto_747809 ) ) ( not ( = ?auto_747802 ?auto_747810 ) ) ( not ( = ?auto_747802 ?auto_747811 ) ) ( not ( = ?auto_747802 ?auto_747812 ) ) ( not ( = ?auto_747802 ?auto_747813 ) ) ( not ( = ?auto_747802 ?auto_747814 ) ) ( not ( = ?auto_747802 ?auto_747815 ) ) ( not ( = ?auto_747802 ?auto_747816 ) ) ( not ( = ?auto_747802 ?auto_747817 ) ) ( not ( = ?auto_747802 ?auto_747818 ) ) ( not ( = ?auto_747802 ?auto_747819 ) ) ( not ( = ?auto_747803 ?auto_747804 ) ) ( not ( = ?auto_747803 ?auto_747805 ) ) ( not ( = ?auto_747803 ?auto_747806 ) ) ( not ( = ?auto_747803 ?auto_747807 ) ) ( not ( = ?auto_747803 ?auto_747808 ) ) ( not ( = ?auto_747803 ?auto_747809 ) ) ( not ( = ?auto_747803 ?auto_747810 ) ) ( not ( = ?auto_747803 ?auto_747811 ) ) ( not ( = ?auto_747803 ?auto_747812 ) ) ( not ( = ?auto_747803 ?auto_747813 ) ) ( not ( = ?auto_747803 ?auto_747814 ) ) ( not ( = ?auto_747803 ?auto_747815 ) ) ( not ( = ?auto_747803 ?auto_747816 ) ) ( not ( = ?auto_747803 ?auto_747817 ) ) ( not ( = ?auto_747803 ?auto_747818 ) ) ( not ( = ?auto_747803 ?auto_747819 ) ) ( not ( = ?auto_747804 ?auto_747805 ) ) ( not ( = ?auto_747804 ?auto_747806 ) ) ( not ( = ?auto_747804 ?auto_747807 ) ) ( not ( = ?auto_747804 ?auto_747808 ) ) ( not ( = ?auto_747804 ?auto_747809 ) ) ( not ( = ?auto_747804 ?auto_747810 ) ) ( not ( = ?auto_747804 ?auto_747811 ) ) ( not ( = ?auto_747804 ?auto_747812 ) ) ( not ( = ?auto_747804 ?auto_747813 ) ) ( not ( = ?auto_747804 ?auto_747814 ) ) ( not ( = ?auto_747804 ?auto_747815 ) ) ( not ( = ?auto_747804 ?auto_747816 ) ) ( not ( = ?auto_747804 ?auto_747817 ) ) ( not ( = ?auto_747804 ?auto_747818 ) ) ( not ( = ?auto_747804 ?auto_747819 ) ) ( not ( = ?auto_747805 ?auto_747806 ) ) ( not ( = ?auto_747805 ?auto_747807 ) ) ( not ( = ?auto_747805 ?auto_747808 ) ) ( not ( = ?auto_747805 ?auto_747809 ) ) ( not ( = ?auto_747805 ?auto_747810 ) ) ( not ( = ?auto_747805 ?auto_747811 ) ) ( not ( = ?auto_747805 ?auto_747812 ) ) ( not ( = ?auto_747805 ?auto_747813 ) ) ( not ( = ?auto_747805 ?auto_747814 ) ) ( not ( = ?auto_747805 ?auto_747815 ) ) ( not ( = ?auto_747805 ?auto_747816 ) ) ( not ( = ?auto_747805 ?auto_747817 ) ) ( not ( = ?auto_747805 ?auto_747818 ) ) ( not ( = ?auto_747805 ?auto_747819 ) ) ( not ( = ?auto_747806 ?auto_747807 ) ) ( not ( = ?auto_747806 ?auto_747808 ) ) ( not ( = ?auto_747806 ?auto_747809 ) ) ( not ( = ?auto_747806 ?auto_747810 ) ) ( not ( = ?auto_747806 ?auto_747811 ) ) ( not ( = ?auto_747806 ?auto_747812 ) ) ( not ( = ?auto_747806 ?auto_747813 ) ) ( not ( = ?auto_747806 ?auto_747814 ) ) ( not ( = ?auto_747806 ?auto_747815 ) ) ( not ( = ?auto_747806 ?auto_747816 ) ) ( not ( = ?auto_747806 ?auto_747817 ) ) ( not ( = ?auto_747806 ?auto_747818 ) ) ( not ( = ?auto_747806 ?auto_747819 ) ) ( not ( = ?auto_747807 ?auto_747808 ) ) ( not ( = ?auto_747807 ?auto_747809 ) ) ( not ( = ?auto_747807 ?auto_747810 ) ) ( not ( = ?auto_747807 ?auto_747811 ) ) ( not ( = ?auto_747807 ?auto_747812 ) ) ( not ( = ?auto_747807 ?auto_747813 ) ) ( not ( = ?auto_747807 ?auto_747814 ) ) ( not ( = ?auto_747807 ?auto_747815 ) ) ( not ( = ?auto_747807 ?auto_747816 ) ) ( not ( = ?auto_747807 ?auto_747817 ) ) ( not ( = ?auto_747807 ?auto_747818 ) ) ( not ( = ?auto_747807 ?auto_747819 ) ) ( not ( = ?auto_747808 ?auto_747809 ) ) ( not ( = ?auto_747808 ?auto_747810 ) ) ( not ( = ?auto_747808 ?auto_747811 ) ) ( not ( = ?auto_747808 ?auto_747812 ) ) ( not ( = ?auto_747808 ?auto_747813 ) ) ( not ( = ?auto_747808 ?auto_747814 ) ) ( not ( = ?auto_747808 ?auto_747815 ) ) ( not ( = ?auto_747808 ?auto_747816 ) ) ( not ( = ?auto_747808 ?auto_747817 ) ) ( not ( = ?auto_747808 ?auto_747818 ) ) ( not ( = ?auto_747808 ?auto_747819 ) ) ( not ( = ?auto_747809 ?auto_747810 ) ) ( not ( = ?auto_747809 ?auto_747811 ) ) ( not ( = ?auto_747809 ?auto_747812 ) ) ( not ( = ?auto_747809 ?auto_747813 ) ) ( not ( = ?auto_747809 ?auto_747814 ) ) ( not ( = ?auto_747809 ?auto_747815 ) ) ( not ( = ?auto_747809 ?auto_747816 ) ) ( not ( = ?auto_747809 ?auto_747817 ) ) ( not ( = ?auto_747809 ?auto_747818 ) ) ( not ( = ?auto_747809 ?auto_747819 ) ) ( not ( = ?auto_747810 ?auto_747811 ) ) ( not ( = ?auto_747810 ?auto_747812 ) ) ( not ( = ?auto_747810 ?auto_747813 ) ) ( not ( = ?auto_747810 ?auto_747814 ) ) ( not ( = ?auto_747810 ?auto_747815 ) ) ( not ( = ?auto_747810 ?auto_747816 ) ) ( not ( = ?auto_747810 ?auto_747817 ) ) ( not ( = ?auto_747810 ?auto_747818 ) ) ( not ( = ?auto_747810 ?auto_747819 ) ) ( not ( = ?auto_747811 ?auto_747812 ) ) ( not ( = ?auto_747811 ?auto_747813 ) ) ( not ( = ?auto_747811 ?auto_747814 ) ) ( not ( = ?auto_747811 ?auto_747815 ) ) ( not ( = ?auto_747811 ?auto_747816 ) ) ( not ( = ?auto_747811 ?auto_747817 ) ) ( not ( = ?auto_747811 ?auto_747818 ) ) ( not ( = ?auto_747811 ?auto_747819 ) ) ( not ( = ?auto_747812 ?auto_747813 ) ) ( not ( = ?auto_747812 ?auto_747814 ) ) ( not ( = ?auto_747812 ?auto_747815 ) ) ( not ( = ?auto_747812 ?auto_747816 ) ) ( not ( = ?auto_747812 ?auto_747817 ) ) ( not ( = ?auto_747812 ?auto_747818 ) ) ( not ( = ?auto_747812 ?auto_747819 ) ) ( not ( = ?auto_747813 ?auto_747814 ) ) ( not ( = ?auto_747813 ?auto_747815 ) ) ( not ( = ?auto_747813 ?auto_747816 ) ) ( not ( = ?auto_747813 ?auto_747817 ) ) ( not ( = ?auto_747813 ?auto_747818 ) ) ( not ( = ?auto_747813 ?auto_747819 ) ) ( not ( = ?auto_747814 ?auto_747815 ) ) ( not ( = ?auto_747814 ?auto_747816 ) ) ( not ( = ?auto_747814 ?auto_747817 ) ) ( not ( = ?auto_747814 ?auto_747818 ) ) ( not ( = ?auto_747814 ?auto_747819 ) ) ( not ( = ?auto_747815 ?auto_747816 ) ) ( not ( = ?auto_747815 ?auto_747817 ) ) ( not ( = ?auto_747815 ?auto_747818 ) ) ( not ( = ?auto_747815 ?auto_747819 ) ) ( not ( = ?auto_747816 ?auto_747817 ) ) ( not ( = ?auto_747816 ?auto_747818 ) ) ( not ( = ?auto_747816 ?auto_747819 ) ) ( not ( = ?auto_747817 ?auto_747818 ) ) ( not ( = ?auto_747817 ?auto_747819 ) ) ( not ( = ?auto_747818 ?auto_747819 ) ) ( ON ?auto_747817 ?auto_747818 ) ( ON ?auto_747816 ?auto_747817 ) ( ON ?auto_747815 ?auto_747816 ) ( ON ?auto_747814 ?auto_747815 ) ( ON ?auto_747813 ?auto_747814 ) ( ON ?auto_747812 ?auto_747813 ) ( ON ?auto_747811 ?auto_747812 ) ( ON ?auto_747810 ?auto_747811 ) ( CLEAR ?auto_747808 ) ( ON ?auto_747809 ?auto_747810 ) ( CLEAR ?auto_747809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_747801 ?auto_747802 ?auto_747803 ?auto_747804 ?auto_747805 ?auto_747806 ?auto_747807 ?auto_747808 ?auto_747809 )
      ( MAKE-18PILE ?auto_747801 ?auto_747802 ?auto_747803 ?auto_747804 ?auto_747805 ?auto_747806 ?auto_747807 ?auto_747808 ?auto_747809 ?auto_747810 ?auto_747811 ?auto_747812 ?auto_747813 ?auto_747814 ?auto_747815 ?auto_747816 ?auto_747817 ?auto_747818 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747838 - BLOCK
      ?auto_747839 - BLOCK
      ?auto_747840 - BLOCK
      ?auto_747841 - BLOCK
      ?auto_747842 - BLOCK
      ?auto_747843 - BLOCK
      ?auto_747844 - BLOCK
      ?auto_747845 - BLOCK
      ?auto_747846 - BLOCK
      ?auto_747847 - BLOCK
      ?auto_747848 - BLOCK
      ?auto_747849 - BLOCK
      ?auto_747850 - BLOCK
      ?auto_747851 - BLOCK
      ?auto_747852 - BLOCK
      ?auto_747853 - BLOCK
      ?auto_747854 - BLOCK
      ?auto_747855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_747855 ) ( ON-TABLE ?auto_747838 ) ( ON ?auto_747839 ?auto_747838 ) ( ON ?auto_747840 ?auto_747839 ) ( ON ?auto_747841 ?auto_747840 ) ( ON ?auto_747842 ?auto_747841 ) ( ON ?auto_747843 ?auto_747842 ) ( ON ?auto_747844 ?auto_747843 ) ( ON ?auto_747845 ?auto_747844 ) ( not ( = ?auto_747838 ?auto_747839 ) ) ( not ( = ?auto_747838 ?auto_747840 ) ) ( not ( = ?auto_747838 ?auto_747841 ) ) ( not ( = ?auto_747838 ?auto_747842 ) ) ( not ( = ?auto_747838 ?auto_747843 ) ) ( not ( = ?auto_747838 ?auto_747844 ) ) ( not ( = ?auto_747838 ?auto_747845 ) ) ( not ( = ?auto_747838 ?auto_747846 ) ) ( not ( = ?auto_747838 ?auto_747847 ) ) ( not ( = ?auto_747838 ?auto_747848 ) ) ( not ( = ?auto_747838 ?auto_747849 ) ) ( not ( = ?auto_747838 ?auto_747850 ) ) ( not ( = ?auto_747838 ?auto_747851 ) ) ( not ( = ?auto_747838 ?auto_747852 ) ) ( not ( = ?auto_747838 ?auto_747853 ) ) ( not ( = ?auto_747838 ?auto_747854 ) ) ( not ( = ?auto_747838 ?auto_747855 ) ) ( not ( = ?auto_747839 ?auto_747840 ) ) ( not ( = ?auto_747839 ?auto_747841 ) ) ( not ( = ?auto_747839 ?auto_747842 ) ) ( not ( = ?auto_747839 ?auto_747843 ) ) ( not ( = ?auto_747839 ?auto_747844 ) ) ( not ( = ?auto_747839 ?auto_747845 ) ) ( not ( = ?auto_747839 ?auto_747846 ) ) ( not ( = ?auto_747839 ?auto_747847 ) ) ( not ( = ?auto_747839 ?auto_747848 ) ) ( not ( = ?auto_747839 ?auto_747849 ) ) ( not ( = ?auto_747839 ?auto_747850 ) ) ( not ( = ?auto_747839 ?auto_747851 ) ) ( not ( = ?auto_747839 ?auto_747852 ) ) ( not ( = ?auto_747839 ?auto_747853 ) ) ( not ( = ?auto_747839 ?auto_747854 ) ) ( not ( = ?auto_747839 ?auto_747855 ) ) ( not ( = ?auto_747840 ?auto_747841 ) ) ( not ( = ?auto_747840 ?auto_747842 ) ) ( not ( = ?auto_747840 ?auto_747843 ) ) ( not ( = ?auto_747840 ?auto_747844 ) ) ( not ( = ?auto_747840 ?auto_747845 ) ) ( not ( = ?auto_747840 ?auto_747846 ) ) ( not ( = ?auto_747840 ?auto_747847 ) ) ( not ( = ?auto_747840 ?auto_747848 ) ) ( not ( = ?auto_747840 ?auto_747849 ) ) ( not ( = ?auto_747840 ?auto_747850 ) ) ( not ( = ?auto_747840 ?auto_747851 ) ) ( not ( = ?auto_747840 ?auto_747852 ) ) ( not ( = ?auto_747840 ?auto_747853 ) ) ( not ( = ?auto_747840 ?auto_747854 ) ) ( not ( = ?auto_747840 ?auto_747855 ) ) ( not ( = ?auto_747841 ?auto_747842 ) ) ( not ( = ?auto_747841 ?auto_747843 ) ) ( not ( = ?auto_747841 ?auto_747844 ) ) ( not ( = ?auto_747841 ?auto_747845 ) ) ( not ( = ?auto_747841 ?auto_747846 ) ) ( not ( = ?auto_747841 ?auto_747847 ) ) ( not ( = ?auto_747841 ?auto_747848 ) ) ( not ( = ?auto_747841 ?auto_747849 ) ) ( not ( = ?auto_747841 ?auto_747850 ) ) ( not ( = ?auto_747841 ?auto_747851 ) ) ( not ( = ?auto_747841 ?auto_747852 ) ) ( not ( = ?auto_747841 ?auto_747853 ) ) ( not ( = ?auto_747841 ?auto_747854 ) ) ( not ( = ?auto_747841 ?auto_747855 ) ) ( not ( = ?auto_747842 ?auto_747843 ) ) ( not ( = ?auto_747842 ?auto_747844 ) ) ( not ( = ?auto_747842 ?auto_747845 ) ) ( not ( = ?auto_747842 ?auto_747846 ) ) ( not ( = ?auto_747842 ?auto_747847 ) ) ( not ( = ?auto_747842 ?auto_747848 ) ) ( not ( = ?auto_747842 ?auto_747849 ) ) ( not ( = ?auto_747842 ?auto_747850 ) ) ( not ( = ?auto_747842 ?auto_747851 ) ) ( not ( = ?auto_747842 ?auto_747852 ) ) ( not ( = ?auto_747842 ?auto_747853 ) ) ( not ( = ?auto_747842 ?auto_747854 ) ) ( not ( = ?auto_747842 ?auto_747855 ) ) ( not ( = ?auto_747843 ?auto_747844 ) ) ( not ( = ?auto_747843 ?auto_747845 ) ) ( not ( = ?auto_747843 ?auto_747846 ) ) ( not ( = ?auto_747843 ?auto_747847 ) ) ( not ( = ?auto_747843 ?auto_747848 ) ) ( not ( = ?auto_747843 ?auto_747849 ) ) ( not ( = ?auto_747843 ?auto_747850 ) ) ( not ( = ?auto_747843 ?auto_747851 ) ) ( not ( = ?auto_747843 ?auto_747852 ) ) ( not ( = ?auto_747843 ?auto_747853 ) ) ( not ( = ?auto_747843 ?auto_747854 ) ) ( not ( = ?auto_747843 ?auto_747855 ) ) ( not ( = ?auto_747844 ?auto_747845 ) ) ( not ( = ?auto_747844 ?auto_747846 ) ) ( not ( = ?auto_747844 ?auto_747847 ) ) ( not ( = ?auto_747844 ?auto_747848 ) ) ( not ( = ?auto_747844 ?auto_747849 ) ) ( not ( = ?auto_747844 ?auto_747850 ) ) ( not ( = ?auto_747844 ?auto_747851 ) ) ( not ( = ?auto_747844 ?auto_747852 ) ) ( not ( = ?auto_747844 ?auto_747853 ) ) ( not ( = ?auto_747844 ?auto_747854 ) ) ( not ( = ?auto_747844 ?auto_747855 ) ) ( not ( = ?auto_747845 ?auto_747846 ) ) ( not ( = ?auto_747845 ?auto_747847 ) ) ( not ( = ?auto_747845 ?auto_747848 ) ) ( not ( = ?auto_747845 ?auto_747849 ) ) ( not ( = ?auto_747845 ?auto_747850 ) ) ( not ( = ?auto_747845 ?auto_747851 ) ) ( not ( = ?auto_747845 ?auto_747852 ) ) ( not ( = ?auto_747845 ?auto_747853 ) ) ( not ( = ?auto_747845 ?auto_747854 ) ) ( not ( = ?auto_747845 ?auto_747855 ) ) ( not ( = ?auto_747846 ?auto_747847 ) ) ( not ( = ?auto_747846 ?auto_747848 ) ) ( not ( = ?auto_747846 ?auto_747849 ) ) ( not ( = ?auto_747846 ?auto_747850 ) ) ( not ( = ?auto_747846 ?auto_747851 ) ) ( not ( = ?auto_747846 ?auto_747852 ) ) ( not ( = ?auto_747846 ?auto_747853 ) ) ( not ( = ?auto_747846 ?auto_747854 ) ) ( not ( = ?auto_747846 ?auto_747855 ) ) ( not ( = ?auto_747847 ?auto_747848 ) ) ( not ( = ?auto_747847 ?auto_747849 ) ) ( not ( = ?auto_747847 ?auto_747850 ) ) ( not ( = ?auto_747847 ?auto_747851 ) ) ( not ( = ?auto_747847 ?auto_747852 ) ) ( not ( = ?auto_747847 ?auto_747853 ) ) ( not ( = ?auto_747847 ?auto_747854 ) ) ( not ( = ?auto_747847 ?auto_747855 ) ) ( not ( = ?auto_747848 ?auto_747849 ) ) ( not ( = ?auto_747848 ?auto_747850 ) ) ( not ( = ?auto_747848 ?auto_747851 ) ) ( not ( = ?auto_747848 ?auto_747852 ) ) ( not ( = ?auto_747848 ?auto_747853 ) ) ( not ( = ?auto_747848 ?auto_747854 ) ) ( not ( = ?auto_747848 ?auto_747855 ) ) ( not ( = ?auto_747849 ?auto_747850 ) ) ( not ( = ?auto_747849 ?auto_747851 ) ) ( not ( = ?auto_747849 ?auto_747852 ) ) ( not ( = ?auto_747849 ?auto_747853 ) ) ( not ( = ?auto_747849 ?auto_747854 ) ) ( not ( = ?auto_747849 ?auto_747855 ) ) ( not ( = ?auto_747850 ?auto_747851 ) ) ( not ( = ?auto_747850 ?auto_747852 ) ) ( not ( = ?auto_747850 ?auto_747853 ) ) ( not ( = ?auto_747850 ?auto_747854 ) ) ( not ( = ?auto_747850 ?auto_747855 ) ) ( not ( = ?auto_747851 ?auto_747852 ) ) ( not ( = ?auto_747851 ?auto_747853 ) ) ( not ( = ?auto_747851 ?auto_747854 ) ) ( not ( = ?auto_747851 ?auto_747855 ) ) ( not ( = ?auto_747852 ?auto_747853 ) ) ( not ( = ?auto_747852 ?auto_747854 ) ) ( not ( = ?auto_747852 ?auto_747855 ) ) ( not ( = ?auto_747853 ?auto_747854 ) ) ( not ( = ?auto_747853 ?auto_747855 ) ) ( not ( = ?auto_747854 ?auto_747855 ) ) ( ON ?auto_747854 ?auto_747855 ) ( ON ?auto_747853 ?auto_747854 ) ( ON ?auto_747852 ?auto_747853 ) ( ON ?auto_747851 ?auto_747852 ) ( ON ?auto_747850 ?auto_747851 ) ( ON ?auto_747849 ?auto_747850 ) ( ON ?auto_747848 ?auto_747849 ) ( ON ?auto_747847 ?auto_747848 ) ( CLEAR ?auto_747845 ) ( ON ?auto_747846 ?auto_747847 ) ( CLEAR ?auto_747846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_747838 ?auto_747839 ?auto_747840 ?auto_747841 ?auto_747842 ?auto_747843 ?auto_747844 ?auto_747845 ?auto_747846 )
      ( MAKE-18PILE ?auto_747838 ?auto_747839 ?auto_747840 ?auto_747841 ?auto_747842 ?auto_747843 ?auto_747844 ?auto_747845 ?auto_747846 ?auto_747847 ?auto_747848 ?auto_747849 ?auto_747850 ?auto_747851 ?auto_747852 ?auto_747853 ?auto_747854 ?auto_747855 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747874 - BLOCK
      ?auto_747875 - BLOCK
      ?auto_747876 - BLOCK
      ?auto_747877 - BLOCK
      ?auto_747878 - BLOCK
      ?auto_747879 - BLOCK
      ?auto_747880 - BLOCK
      ?auto_747881 - BLOCK
      ?auto_747882 - BLOCK
      ?auto_747883 - BLOCK
      ?auto_747884 - BLOCK
      ?auto_747885 - BLOCK
      ?auto_747886 - BLOCK
      ?auto_747887 - BLOCK
      ?auto_747888 - BLOCK
      ?auto_747889 - BLOCK
      ?auto_747890 - BLOCK
      ?auto_747891 - BLOCK
    )
    :vars
    (
      ?auto_747892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747891 ?auto_747892 ) ( ON-TABLE ?auto_747874 ) ( ON ?auto_747875 ?auto_747874 ) ( ON ?auto_747876 ?auto_747875 ) ( ON ?auto_747877 ?auto_747876 ) ( ON ?auto_747878 ?auto_747877 ) ( ON ?auto_747879 ?auto_747878 ) ( ON ?auto_747880 ?auto_747879 ) ( not ( = ?auto_747874 ?auto_747875 ) ) ( not ( = ?auto_747874 ?auto_747876 ) ) ( not ( = ?auto_747874 ?auto_747877 ) ) ( not ( = ?auto_747874 ?auto_747878 ) ) ( not ( = ?auto_747874 ?auto_747879 ) ) ( not ( = ?auto_747874 ?auto_747880 ) ) ( not ( = ?auto_747874 ?auto_747881 ) ) ( not ( = ?auto_747874 ?auto_747882 ) ) ( not ( = ?auto_747874 ?auto_747883 ) ) ( not ( = ?auto_747874 ?auto_747884 ) ) ( not ( = ?auto_747874 ?auto_747885 ) ) ( not ( = ?auto_747874 ?auto_747886 ) ) ( not ( = ?auto_747874 ?auto_747887 ) ) ( not ( = ?auto_747874 ?auto_747888 ) ) ( not ( = ?auto_747874 ?auto_747889 ) ) ( not ( = ?auto_747874 ?auto_747890 ) ) ( not ( = ?auto_747874 ?auto_747891 ) ) ( not ( = ?auto_747874 ?auto_747892 ) ) ( not ( = ?auto_747875 ?auto_747876 ) ) ( not ( = ?auto_747875 ?auto_747877 ) ) ( not ( = ?auto_747875 ?auto_747878 ) ) ( not ( = ?auto_747875 ?auto_747879 ) ) ( not ( = ?auto_747875 ?auto_747880 ) ) ( not ( = ?auto_747875 ?auto_747881 ) ) ( not ( = ?auto_747875 ?auto_747882 ) ) ( not ( = ?auto_747875 ?auto_747883 ) ) ( not ( = ?auto_747875 ?auto_747884 ) ) ( not ( = ?auto_747875 ?auto_747885 ) ) ( not ( = ?auto_747875 ?auto_747886 ) ) ( not ( = ?auto_747875 ?auto_747887 ) ) ( not ( = ?auto_747875 ?auto_747888 ) ) ( not ( = ?auto_747875 ?auto_747889 ) ) ( not ( = ?auto_747875 ?auto_747890 ) ) ( not ( = ?auto_747875 ?auto_747891 ) ) ( not ( = ?auto_747875 ?auto_747892 ) ) ( not ( = ?auto_747876 ?auto_747877 ) ) ( not ( = ?auto_747876 ?auto_747878 ) ) ( not ( = ?auto_747876 ?auto_747879 ) ) ( not ( = ?auto_747876 ?auto_747880 ) ) ( not ( = ?auto_747876 ?auto_747881 ) ) ( not ( = ?auto_747876 ?auto_747882 ) ) ( not ( = ?auto_747876 ?auto_747883 ) ) ( not ( = ?auto_747876 ?auto_747884 ) ) ( not ( = ?auto_747876 ?auto_747885 ) ) ( not ( = ?auto_747876 ?auto_747886 ) ) ( not ( = ?auto_747876 ?auto_747887 ) ) ( not ( = ?auto_747876 ?auto_747888 ) ) ( not ( = ?auto_747876 ?auto_747889 ) ) ( not ( = ?auto_747876 ?auto_747890 ) ) ( not ( = ?auto_747876 ?auto_747891 ) ) ( not ( = ?auto_747876 ?auto_747892 ) ) ( not ( = ?auto_747877 ?auto_747878 ) ) ( not ( = ?auto_747877 ?auto_747879 ) ) ( not ( = ?auto_747877 ?auto_747880 ) ) ( not ( = ?auto_747877 ?auto_747881 ) ) ( not ( = ?auto_747877 ?auto_747882 ) ) ( not ( = ?auto_747877 ?auto_747883 ) ) ( not ( = ?auto_747877 ?auto_747884 ) ) ( not ( = ?auto_747877 ?auto_747885 ) ) ( not ( = ?auto_747877 ?auto_747886 ) ) ( not ( = ?auto_747877 ?auto_747887 ) ) ( not ( = ?auto_747877 ?auto_747888 ) ) ( not ( = ?auto_747877 ?auto_747889 ) ) ( not ( = ?auto_747877 ?auto_747890 ) ) ( not ( = ?auto_747877 ?auto_747891 ) ) ( not ( = ?auto_747877 ?auto_747892 ) ) ( not ( = ?auto_747878 ?auto_747879 ) ) ( not ( = ?auto_747878 ?auto_747880 ) ) ( not ( = ?auto_747878 ?auto_747881 ) ) ( not ( = ?auto_747878 ?auto_747882 ) ) ( not ( = ?auto_747878 ?auto_747883 ) ) ( not ( = ?auto_747878 ?auto_747884 ) ) ( not ( = ?auto_747878 ?auto_747885 ) ) ( not ( = ?auto_747878 ?auto_747886 ) ) ( not ( = ?auto_747878 ?auto_747887 ) ) ( not ( = ?auto_747878 ?auto_747888 ) ) ( not ( = ?auto_747878 ?auto_747889 ) ) ( not ( = ?auto_747878 ?auto_747890 ) ) ( not ( = ?auto_747878 ?auto_747891 ) ) ( not ( = ?auto_747878 ?auto_747892 ) ) ( not ( = ?auto_747879 ?auto_747880 ) ) ( not ( = ?auto_747879 ?auto_747881 ) ) ( not ( = ?auto_747879 ?auto_747882 ) ) ( not ( = ?auto_747879 ?auto_747883 ) ) ( not ( = ?auto_747879 ?auto_747884 ) ) ( not ( = ?auto_747879 ?auto_747885 ) ) ( not ( = ?auto_747879 ?auto_747886 ) ) ( not ( = ?auto_747879 ?auto_747887 ) ) ( not ( = ?auto_747879 ?auto_747888 ) ) ( not ( = ?auto_747879 ?auto_747889 ) ) ( not ( = ?auto_747879 ?auto_747890 ) ) ( not ( = ?auto_747879 ?auto_747891 ) ) ( not ( = ?auto_747879 ?auto_747892 ) ) ( not ( = ?auto_747880 ?auto_747881 ) ) ( not ( = ?auto_747880 ?auto_747882 ) ) ( not ( = ?auto_747880 ?auto_747883 ) ) ( not ( = ?auto_747880 ?auto_747884 ) ) ( not ( = ?auto_747880 ?auto_747885 ) ) ( not ( = ?auto_747880 ?auto_747886 ) ) ( not ( = ?auto_747880 ?auto_747887 ) ) ( not ( = ?auto_747880 ?auto_747888 ) ) ( not ( = ?auto_747880 ?auto_747889 ) ) ( not ( = ?auto_747880 ?auto_747890 ) ) ( not ( = ?auto_747880 ?auto_747891 ) ) ( not ( = ?auto_747880 ?auto_747892 ) ) ( not ( = ?auto_747881 ?auto_747882 ) ) ( not ( = ?auto_747881 ?auto_747883 ) ) ( not ( = ?auto_747881 ?auto_747884 ) ) ( not ( = ?auto_747881 ?auto_747885 ) ) ( not ( = ?auto_747881 ?auto_747886 ) ) ( not ( = ?auto_747881 ?auto_747887 ) ) ( not ( = ?auto_747881 ?auto_747888 ) ) ( not ( = ?auto_747881 ?auto_747889 ) ) ( not ( = ?auto_747881 ?auto_747890 ) ) ( not ( = ?auto_747881 ?auto_747891 ) ) ( not ( = ?auto_747881 ?auto_747892 ) ) ( not ( = ?auto_747882 ?auto_747883 ) ) ( not ( = ?auto_747882 ?auto_747884 ) ) ( not ( = ?auto_747882 ?auto_747885 ) ) ( not ( = ?auto_747882 ?auto_747886 ) ) ( not ( = ?auto_747882 ?auto_747887 ) ) ( not ( = ?auto_747882 ?auto_747888 ) ) ( not ( = ?auto_747882 ?auto_747889 ) ) ( not ( = ?auto_747882 ?auto_747890 ) ) ( not ( = ?auto_747882 ?auto_747891 ) ) ( not ( = ?auto_747882 ?auto_747892 ) ) ( not ( = ?auto_747883 ?auto_747884 ) ) ( not ( = ?auto_747883 ?auto_747885 ) ) ( not ( = ?auto_747883 ?auto_747886 ) ) ( not ( = ?auto_747883 ?auto_747887 ) ) ( not ( = ?auto_747883 ?auto_747888 ) ) ( not ( = ?auto_747883 ?auto_747889 ) ) ( not ( = ?auto_747883 ?auto_747890 ) ) ( not ( = ?auto_747883 ?auto_747891 ) ) ( not ( = ?auto_747883 ?auto_747892 ) ) ( not ( = ?auto_747884 ?auto_747885 ) ) ( not ( = ?auto_747884 ?auto_747886 ) ) ( not ( = ?auto_747884 ?auto_747887 ) ) ( not ( = ?auto_747884 ?auto_747888 ) ) ( not ( = ?auto_747884 ?auto_747889 ) ) ( not ( = ?auto_747884 ?auto_747890 ) ) ( not ( = ?auto_747884 ?auto_747891 ) ) ( not ( = ?auto_747884 ?auto_747892 ) ) ( not ( = ?auto_747885 ?auto_747886 ) ) ( not ( = ?auto_747885 ?auto_747887 ) ) ( not ( = ?auto_747885 ?auto_747888 ) ) ( not ( = ?auto_747885 ?auto_747889 ) ) ( not ( = ?auto_747885 ?auto_747890 ) ) ( not ( = ?auto_747885 ?auto_747891 ) ) ( not ( = ?auto_747885 ?auto_747892 ) ) ( not ( = ?auto_747886 ?auto_747887 ) ) ( not ( = ?auto_747886 ?auto_747888 ) ) ( not ( = ?auto_747886 ?auto_747889 ) ) ( not ( = ?auto_747886 ?auto_747890 ) ) ( not ( = ?auto_747886 ?auto_747891 ) ) ( not ( = ?auto_747886 ?auto_747892 ) ) ( not ( = ?auto_747887 ?auto_747888 ) ) ( not ( = ?auto_747887 ?auto_747889 ) ) ( not ( = ?auto_747887 ?auto_747890 ) ) ( not ( = ?auto_747887 ?auto_747891 ) ) ( not ( = ?auto_747887 ?auto_747892 ) ) ( not ( = ?auto_747888 ?auto_747889 ) ) ( not ( = ?auto_747888 ?auto_747890 ) ) ( not ( = ?auto_747888 ?auto_747891 ) ) ( not ( = ?auto_747888 ?auto_747892 ) ) ( not ( = ?auto_747889 ?auto_747890 ) ) ( not ( = ?auto_747889 ?auto_747891 ) ) ( not ( = ?auto_747889 ?auto_747892 ) ) ( not ( = ?auto_747890 ?auto_747891 ) ) ( not ( = ?auto_747890 ?auto_747892 ) ) ( not ( = ?auto_747891 ?auto_747892 ) ) ( ON ?auto_747890 ?auto_747891 ) ( ON ?auto_747889 ?auto_747890 ) ( ON ?auto_747888 ?auto_747889 ) ( ON ?auto_747887 ?auto_747888 ) ( ON ?auto_747886 ?auto_747887 ) ( ON ?auto_747885 ?auto_747886 ) ( ON ?auto_747884 ?auto_747885 ) ( ON ?auto_747883 ?auto_747884 ) ( ON ?auto_747882 ?auto_747883 ) ( CLEAR ?auto_747880 ) ( ON ?auto_747881 ?auto_747882 ) ( CLEAR ?auto_747881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_747874 ?auto_747875 ?auto_747876 ?auto_747877 ?auto_747878 ?auto_747879 ?auto_747880 ?auto_747881 )
      ( MAKE-18PILE ?auto_747874 ?auto_747875 ?auto_747876 ?auto_747877 ?auto_747878 ?auto_747879 ?auto_747880 ?auto_747881 ?auto_747882 ?auto_747883 ?auto_747884 ?auto_747885 ?auto_747886 ?auto_747887 ?auto_747888 ?auto_747889 ?auto_747890 ?auto_747891 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747911 - BLOCK
      ?auto_747912 - BLOCK
      ?auto_747913 - BLOCK
      ?auto_747914 - BLOCK
      ?auto_747915 - BLOCK
      ?auto_747916 - BLOCK
      ?auto_747917 - BLOCK
      ?auto_747918 - BLOCK
      ?auto_747919 - BLOCK
      ?auto_747920 - BLOCK
      ?auto_747921 - BLOCK
      ?auto_747922 - BLOCK
      ?auto_747923 - BLOCK
      ?auto_747924 - BLOCK
      ?auto_747925 - BLOCK
      ?auto_747926 - BLOCK
      ?auto_747927 - BLOCK
      ?auto_747928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_747928 ) ( ON-TABLE ?auto_747911 ) ( ON ?auto_747912 ?auto_747911 ) ( ON ?auto_747913 ?auto_747912 ) ( ON ?auto_747914 ?auto_747913 ) ( ON ?auto_747915 ?auto_747914 ) ( ON ?auto_747916 ?auto_747915 ) ( ON ?auto_747917 ?auto_747916 ) ( not ( = ?auto_747911 ?auto_747912 ) ) ( not ( = ?auto_747911 ?auto_747913 ) ) ( not ( = ?auto_747911 ?auto_747914 ) ) ( not ( = ?auto_747911 ?auto_747915 ) ) ( not ( = ?auto_747911 ?auto_747916 ) ) ( not ( = ?auto_747911 ?auto_747917 ) ) ( not ( = ?auto_747911 ?auto_747918 ) ) ( not ( = ?auto_747911 ?auto_747919 ) ) ( not ( = ?auto_747911 ?auto_747920 ) ) ( not ( = ?auto_747911 ?auto_747921 ) ) ( not ( = ?auto_747911 ?auto_747922 ) ) ( not ( = ?auto_747911 ?auto_747923 ) ) ( not ( = ?auto_747911 ?auto_747924 ) ) ( not ( = ?auto_747911 ?auto_747925 ) ) ( not ( = ?auto_747911 ?auto_747926 ) ) ( not ( = ?auto_747911 ?auto_747927 ) ) ( not ( = ?auto_747911 ?auto_747928 ) ) ( not ( = ?auto_747912 ?auto_747913 ) ) ( not ( = ?auto_747912 ?auto_747914 ) ) ( not ( = ?auto_747912 ?auto_747915 ) ) ( not ( = ?auto_747912 ?auto_747916 ) ) ( not ( = ?auto_747912 ?auto_747917 ) ) ( not ( = ?auto_747912 ?auto_747918 ) ) ( not ( = ?auto_747912 ?auto_747919 ) ) ( not ( = ?auto_747912 ?auto_747920 ) ) ( not ( = ?auto_747912 ?auto_747921 ) ) ( not ( = ?auto_747912 ?auto_747922 ) ) ( not ( = ?auto_747912 ?auto_747923 ) ) ( not ( = ?auto_747912 ?auto_747924 ) ) ( not ( = ?auto_747912 ?auto_747925 ) ) ( not ( = ?auto_747912 ?auto_747926 ) ) ( not ( = ?auto_747912 ?auto_747927 ) ) ( not ( = ?auto_747912 ?auto_747928 ) ) ( not ( = ?auto_747913 ?auto_747914 ) ) ( not ( = ?auto_747913 ?auto_747915 ) ) ( not ( = ?auto_747913 ?auto_747916 ) ) ( not ( = ?auto_747913 ?auto_747917 ) ) ( not ( = ?auto_747913 ?auto_747918 ) ) ( not ( = ?auto_747913 ?auto_747919 ) ) ( not ( = ?auto_747913 ?auto_747920 ) ) ( not ( = ?auto_747913 ?auto_747921 ) ) ( not ( = ?auto_747913 ?auto_747922 ) ) ( not ( = ?auto_747913 ?auto_747923 ) ) ( not ( = ?auto_747913 ?auto_747924 ) ) ( not ( = ?auto_747913 ?auto_747925 ) ) ( not ( = ?auto_747913 ?auto_747926 ) ) ( not ( = ?auto_747913 ?auto_747927 ) ) ( not ( = ?auto_747913 ?auto_747928 ) ) ( not ( = ?auto_747914 ?auto_747915 ) ) ( not ( = ?auto_747914 ?auto_747916 ) ) ( not ( = ?auto_747914 ?auto_747917 ) ) ( not ( = ?auto_747914 ?auto_747918 ) ) ( not ( = ?auto_747914 ?auto_747919 ) ) ( not ( = ?auto_747914 ?auto_747920 ) ) ( not ( = ?auto_747914 ?auto_747921 ) ) ( not ( = ?auto_747914 ?auto_747922 ) ) ( not ( = ?auto_747914 ?auto_747923 ) ) ( not ( = ?auto_747914 ?auto_747924 ) ) ( not ( = ?auto_747914 ?auto_747925 ) ) ( not ( = ?auto_747914 ?auto_747926 ) ) ( not ( = ?auto_747914 ?auto_747927 ) ) ( not ( = ?auto_747914 ?auto_747928 ) ) ( not ( = ?auto_747915 ?auto_747916 ) ) ( not ( = ?auto_747915 ?auto_747917 ) ) ( not ( = ?auto_747915 ?auto_747918 ) ) ( not ( = ?auto_747915 ?auto_747919 ) ) ( not ( = ?auto_747915 ?auto_747920 ) ) ( not ( = ?auto_747915 ?auto_747921 ) ) ( not ( = ?auto_747915 ?auto_747922 ) ) ( not ( = ?auto_747915 ?auto_747923 ) ) ( not ( = ?auto_747915 ?auto_747924 ) ) ( not ( = ?auto_747915 ?auto_747925 ) ) ( not ( = ?auto_747915 ?auto_747926 ) ) ( not ( = ?auto_747915 ?auto_747927 ) ) ( not ( = ?auto_747915 ?auto_747928 ) ) ( not ( = ?auto_747916 ?auto_747917 ) ) ( not ( = ?auto_747916 ?auto_747918 ) ) ( not ( = ?auto_747916 ?auto_747919 ) ) ( not ( = ?auto_747916 ?auto_747920 ) ) ( not ( = ?auto_747916 ?auto_747921 ) ) ( not ( = ?auto_747916 ?auto_747922 ) ) ( not ( = ?auto_747916 ?auto_747923 ) ) ( not ( = ?auto_747916 ?auto_747924 ) ) ( not ( = ?auto_747916 ?auto_747925 ) ) ( not ( = ?auto_747916 ?auto_747926 ) ) ( not ( = ?auto_747916 ?auto_747927 ) ) ( not ( = ?auto_747916 ?auto_747928 ) ) ( not ( = ?auto_747917 ?auto_747918 ) ) ( not ( = ?auto_747917 ?auto_747919 ) ) ( not ( = ?auto_747917 ?auto_747920 ) ) ( not ( = ?auto_747917 ?auto_747921 ) ) ( not ( = ?auto_747917 ?auto_747922 ) ) ( not ( = ?auto_747917 ?auto_747923 ) ) ( not ( = ?auto_747917 ?auto_747924 ) ) ( not ( = ?auto_747917 ?auto_747925 ) ) ( not ( = ?auto_747917 ?auto_747926 ) ) ( not ( = ?auto_747917 ?auto_747927 ) ) ( not ( = ?auto_747917 ?auto_747928 ) ) ( not ( = ?auto_747918 ?auto_747919 ) ) ( not ( = ?auto_747918 ?auto_747920 ) ) ( not ( = ?auto_747918 ?auto_747921 ) ) ( not ( = ?auto_747918 ?auto_747922 ) ) ( not ( = ?auto_747918 ?auto_747923 ) ) ( not ( = ?auto_747918 ?auto_747924 ) ) ( not ( = ?auto_747918 ?auto_747925 ) ) ( not ( = ?auto_747918 ?auto_747926 ) ) ( not ( = ?auto_747918 ?auto_747927 ) ) ( not ( = ?auto_747918 ?auto_747928 ) ) ( not ( = ?auto_747919 ?auto_747920 ) ) ( not ( = ?auto_747919 ?auto_747921 ) ) ( not ( = ?auto_747919 ?auto_747922 ) ) ( not ( = ?auto_747919 ?auto_747923 ) ) ( not ( = ?auto_747919 ?auto_747924 ) ) ( not ( = ?auto_747919 ?auto_747925 ) ) ( not ( = ?auto_747919 ?auto_747926 ) ) ( not ( = ?auto_747919 ?auto_747927 ) ) ( not ( = ?auto_747919 ?auto_747928 ) ) ( not ( = ?auto_747920 ?auto_747921 ) ) ( not ( = ?auto_747920 ?auto_747922 ) ) ( not ( = ?auto_747920 ?auto_747923 ) ) ( not ( = ?auto_747920 ?auto_747924 ) ) ( not ( = ?auto_747920 ?auto_747925 ) ) ( not ( = ?auto_747920 ?auto_747926 ) ) ( not ( = ?auto_747920 ?auto_747927 ) ) ( not ( = ?auto_747920 ?auto_747928 ) ) ( not ( = ?auto_747921 ?auto_747922 ) ) ( not ( = ?auto_747921 ?auto_747923 ) ) ( not ( = ?auto_747921 ?auto_747924 ) ) ( not ( = ?auto_747921 ?auto_747925 ) ) ( not ( = ?auto_747921 ?auto_747926 ) ) ( not ( = ?auto_747921 ?auto_747927 ) ) ( not ( = ?auto_747921 ?auto_747928 ) ) ( not ( = ?auto_747922 ?auto_747923 ) ) ( not ( = ?auto_747922 ?auto_747924 ) ) ( not ( = ?auto_747922 ?auto_747925 ) ) ( not ( = ?auto_747922 ?auto_747926 ) ) ( not ( = ?auto_747922 ?auto_747927 ) ) ( not ( = ?auto_747922 ?auto_747928 ) ) ( not ( = ?auto_747923 ?auto_747924 ) ) ( not ( = ?auto_747923 ?auto_747925 ) ) ( not ( = ?auto_747923 ?auto_747926 ) ) ( not ( = ?auto_747923 ?auto_747927 ) ) ( not ( = ?auto_747923 ?auto_747928 ) ) ( not ( = ?auto_747924 ?auto_747925 ) ) ( not ( = ?auto_747924 ?auto_747926 ) ) ( not ( = ?auto_747924 ?auto_747927 ) ) ( not ( = ?auto_747924 ?auto_747928 ) ) ( not ( = ?auto_747925 ?auto_747926 ) ) ( not ( = ?auto_747925 ?auto_747927 ) ) ( not ( = ?auto_747925 ?auto_747928 ) ) ( not ( = ?auto_747926 ?auto_747927 ) ) ( not ( = ?auto_747926 ?auto_747928 ) ) ( not ( = ?auto_747927 ?auto_747928 ) ) ( ON ?auto_747927 ?auto_747928 ) ( ON ?auto_747926 ?auto_747927 ) ( ON ?auto_747925 ?auto_747926 ) ( ON ?auto_747924 ?auto_747925 ) ( ON ?auto_747923 ?auto_747924 ) ( ON ?auto_747922 ?auto_747923 ) ( ON ?auto_747921 ?auto_747922 ) ( ON ?auto_747920 ?auto_747921 ) ( ON ?auto_747919 ?auto_747920 ) ( CLEAR ?auto_747917 ) ( ON ?auto_747918 ?auto_747919 ) ( CLEAR ?auto_747918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_747911 ?auto_747912 ?auto_747913 ?auto_747914 ?auto_747915 ?auto_747916 ?auto_747917 ?auto_747918 )
      ( MAKE-18PILE ?auto_747911 ?auto_747912 ?auto_747913 ?auto_747914 ?auto_747915 ?auto_747916 ?auto_747917 ?auto_747918 ?auto_747919 ?auto_747920 ?auto_747921 ?auto_747922 ?auto_747923 ?auto_747924 ?auto_747925 ?auto_747926 ?auto_747927 ?auto_747928 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747947 - BLOCK
      ?auto_747948 - BLOCK
      ?auto_747949 - BLOCK
      ?auto_747950 - BLOCK
      ?auto_747951 - BLOCK
      ?auto_747952 - BLOCK
      ?auto_747953 - BLOCK
      ?auto_747954 - BLOCK
      ?auto_747955 - BLOCK
      ?auto_747956 - BLOCK
      ?auto_747957 - BLOCK
      ?auto_747958 - BLOCK
      ?auto_747959 - BLOCK
      ?auto_747960 - BLOCK
      ?auto_747961 - BLOCK
      ?auto_747962 - BLOCK
      ?auto_747963 - BLOCK
      ?auto_747964 - BLOCK
    )
    :vars
    (
      ?auto_747965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747964 ?auto_747965 ) ( ON-TABLE ?auto_747947 ) ( ON ?auto_747948 ?auto_747947 ) ( ON ?auto_747949 ?auto_747948 ) ( ON ?auto_747950 ?auto_747949 ) ( ON ?auto_747951 ?auto_747950 ) ( ON ?auto_747952 ?auto_747951 ) ( not ( = ?auto_747947 ?auto_747948 ) ) ( not ( = ?auto_747947 ?auto_747949 ) ) ( not ( = ?auto_747947 ?auto_747950 ) ) ( not ( = ?auto_747947 ?auto_747951 ) ) ( not ( = ?auto_747947 ?auto_747952 ) ) ( not ( = ?auto_747947 ?auto_747953 ) ) ( not ( = ?auto_747947 ?auto_747954 ) ) ( not ( = ?auto_747947 ?auto_747955 ) ) ( not ( = ?auto_747947 ?auto_747956 ) ) ( not ( = ?auto_747947 ?auto_747957 ) ) ( not ( = ?auto_747947 ?auto_747958 ) ) ( not ( = ?auto_747947 ?auto_747959 ) ) ( not ( = ?auto_747947 ?auto_747960 ) ) ( not ( = ?auto_747947 ?auto_747961 ) ) ( not ( = ?auto_747947 ?auto_747962 ) ) ( not ( = ?auto_747947 ?auto_747963 ) ) ( not ( = ?auto_747947 ?auto_747964 ) ) ( not ( = ?auto_747947 ?auto_747965 ) ) ( not ( = ?auto_747948 ?auto_747949 ) ) ( not ( = ?auto_747948 ?auto_747950 ) ) ( not ( = ?auto_747948 ?auto_747951 ) ) ( not ( = ?auto_747948 ?auto_747952 ) ) ( not ( = ?auto_747948 ?auto_747953 ) ) ( not ( = ?auto_747948 ?auto_747954 ) ) ( not ( = ?auto_747948 ?auto_747955 ) ) ( not ( = ?auto_747948 ?auto_747956 ) ) ( not ( = ?auto_747948 ?auto_747957 ) ) ( not ( = ?auto_747948 ?auto_747958 ) ) ( not ( = ?auto_747948 ?auto_747959 ) ) ( not ( = ?auto_747948 ?auto_747960 ) ) ( not ( = ?auto_747948 ?auto_747961 ) ) ( not ( = ?auto_747948 ?auto_747962 ) ) ( not ( = ?auto_747948 ?auto_747963 ) ) ( not ( = ?auto_747948 ?auto_747964 ) ) ( not ( = ?auto_747948 ?auto_747965 ) ) ( not ( = ?auto_747949 ?auto_747950 ) ) ( not ( = ?auto_747949 ?auto_747951 ) ) ( not ( = ?auto_747949 ?auto_747952 ) ) ( not ( = ?auto_747949 ?auto_747953 ) ) ( not ( = ?auto_747949 ?auto_747954 ) ) ( not ( = ?auto_747949 ?auto_747955 ) ) ( not ( = ?auto_747949 ?auto_747956 ) ) ( not ( = ?auto_747949 ?auto_747957 ) ) ( not ( = ?auto_747949 ?auto_747958 ) ) ( not ( = ?auto_747949 ?auto_747959 ) ) ( not ( = ?auto_747949 ?auto_747960 ) ) ( not ( = ?auto_747949 ?auto_747961 ) ) ( not ( = ?auto_747949 ?auto_747962 ) ) ( not ( = ?auto_747949 ?auto_747963 ) ) ( not ( = ?auto_747949 ?auto_747964 ) ) ( not ( = ?auto_747949 ?auto_747965 ) ) ( not ( = ?auto_747950 ?auto_747951 ) ) ( not ( = ?auto_747950 ?auto_747952 ) ) ( not ( = ?auto_747950 ?auto_747953 ) ) ( not ( = ?auto_747950 ?auto_747954 ) ) ( not ( = ?auto_747950 ?auto_747955 ) ) ( not ( = ?auto_747950 ?auto_747956 ) ) ( not ( = ?auto_747950 ?auto_747957 ) ) ( not ( = ?auto_747950 ?auto_747958 ) ) ( not ( = ?auto_747950 ?auto_747959 ) ) ( not ( = ?auto_747950 ?auto_747960 ) ) ( not ( = ?auto_747950 ?auto_747961 ) ) ( not ( = ?auto_747950 ?auto_747962 ) ) ( not ( = ?auto_747950 ?auto_747963 ) ) ( not ( = ?auto_747950 ?auto_747964 ) ) ( not ( = ?auto_747950 ?auto_747965 ) ) ( not ( = ?auto_747951 ?auto_747952 ) ) ( not ( = ?auto_747951 ?auto_747953 ) ) ( not ( = ?auto_747951 ?auto_747954 ) ) ( not ( = ?auto_747951 ?auto_747955 ) ) ( not ( = ?auto_747951 ?auto_747956 ) ) ( not ( = ?auto_747951 ?auto_747957 ) ) ( not ( = ?auto_747951 ?auto_747958 ) ) ( not ( = ?auto_747951 ?auto_747959 ) ) ( not ( = ?auto_747951 ?auto_747960 ) ) ( not ( = ?auto_747951 ?auto_747961 ) ) ( not ( = ?auto_747951 ?auto_747962 ) ) ( not ( = ?auto_747951 ?auto_747963 ) ) ( not ( = ?auto_747951 ?auto_747964 ) ) ( not ( = ?auto_747951 ?auto_747965 ) ) ( not ( = ?auto_747952 ?auto_747953 ) ) ( not ( = ?auto_747952 ?auto_747954 ) ) ( not ( = ?auto_747952 ?auto_747955 ) ) ( not ( = ?auto_747952 ?auto_747956 ) ) ( not ( = ?auto_747952 ?auto_747957 ) ) ( not ( = ?auto_747952 ?auto_747958 ) ) ( not ( = ?auto_747952 ?auto_747959 ) ) ( not ( = ?auto_747952 ?auto_747960 ) ) ( not ( = ?auto_747952 ?auto_747961 ) ) ( not ( = ?auto_747952 ?auto_747962 ) ) ( not ( = ?auto_747952 ?auto_747963 ) ) ( not ( = ?auto_747952 ?auto_747964 ) ) ( not ( = ?auto_747952 ?auto_747965 ) ) ( not ( = ?auto_747953 ?auto_747954 ) ) ( not ( = ?auto_747953 ?auto_747955 ) ) ( not ( = ?auto_747953 ?auto_747956 ) ) ( not ( = ?auto_747953 ?auto_747957 ) ) ( not ( = ?auto_747953 ?auto_747958 ) ) ( not ( = ?auto_747953 ?auto_747959 ) ) ( not ( = ?auto_747953 ?auto_747960 ) ) ( not ( = ?auto_747953 ?auto_747961 ) ) ( not ( = ?auto_747953 ?auto_747962 ) ) ( not ( = ?auto_747953 ?auto_747963 ) ) ( not ( = ?auto_747953 ?auto_747964 ) ) ( not ( = ?auto_747953 ?auto_747965 ) ) ( not ( = ?auto_747954 ?auto_747955 ) ) ( not ( = ?auto_747954 ?auto_747956 ) ) ( not ( = ?auto_747954 ?auto_747957 ) ) ( not ( = ?auto_747954 ?auto_747958 ) ) ( not ( = ?auto_747954 ?auto_747959 ) ) ( not ( = ?auto_747954 ?auto_747960 ) ) ( not ( = ?auto_747954 ?auto_747961 ) ) ( not ( = ?auto_747954 ?auto_747962 ) ) ( not ( = ?auto_747954 ?auto_747963 ) ) ( not ( = ?auto_747954 ?auto_747964 ) ) ( not ( = ?auto_747954 ?auto_747965 ) ) ( not ( = ?auto_747955 ?auto_747956 ) ) ( not ( = ?auto_747955 ?auto_747957 ) ) ( not ( = ?auto_747955 ?auto_747958 ) ) ( not ( = ?auto_747955 ?auto_747959 ) ) ( not ( = ?auto_747955 ?auto_747960 ) ) ( not ( = ?auto_747955 ?auto_747961 ) ) ( not ( = ?auto_747955 ?auto_747962 ) ) ( not ( = ?auto_747955 ?auto_747963 ) ) ( not ( = ?auto_747955 ?auto_747964 ) ) ( not ( = ?auto_747955 ?auto_747965 ) ) ( not ( = ?auto_747956 ?auto_747957 ) ) ( not ( = ?auto_747956 ?auto_747958 ) ) ( not ( = ?auto_747956 ?auto_747959 ) ) ( not ( = ?auto_747956 ?auto_747960 ) ) ( not ( = ?auto_747956 ?auto_747961 ) ) ( not ( = ?auto_747956 ?auto_747962 ) ) ( not ( = ?auto_747956 ?auto_747963 ) ) ( not ( = ?auto_747956 ?auto_747964 ) ) ( not ( = ?auto_747956 ?auto_747965 ) ) ( not ( = ?auto_747957 ?auto_747958 ) ) ( not ( = ?auto_747957 ?auto_747959 ) ) ( not ( = ?auto_747957 ?auto_747960 ) ) ( not ( = ?auto_747957 ?auto_747961 ) ) ( not ( = ?auto_747957 ?auto_747962 ) ) ( not ( = ?auto_747957 ?auto_747963 ) ) ( not ( = ?auto_747957 ?auto_747964 ) ) ( not ( = ?auto_747957 ?auto_747965 ) ) ( not ( = ?auto_747958 ?auto_747959 ) ) ( not ( = ?auto_747958 ?auto_747960 ) ) ( not ( = ?auto_747958 ?auto_747961 ) ) ( not ( = ?auto_747958 ?auto_747962 ) ) ( not ( = ?auto_747958 ?auto_747963 ) ) ( not ( = ?auto_747958 ?auto_747964 ) ) ( not ( = ?auto_747958 ?auto_747965 ) ) ( not ( = ?auto_747959 ?auto_747960 ) ) ( not ( = ?auto_747959 ?auto_747961 ) ) ( not ( = ?auto_747959 ?auto_747962 ) ) ( not ( = ?auto_747959 ?auto_747963 ) ) ( not ( = ?auto_747959 ?auto_747964 ) ) ( not ( = ?auto_747959 ?auto_747965 ) ) ( not ( = ?auto_747960 ?auto_747961 ) ) ( not ( = ?auto_747960 ?auto_747962 ) ) ( not ( = ?auto_747960 ?auto_747963 ) ) ( not ( = ?auto_747960 ?auto_747964 ) ) ( not ( = ?auto_747960 ?auto_747965 ) ) ( not ( = ?auto_747961 ?auto_747962 ) ) ( not ( = ?auto_747961 ?auto_747963 ) ) ( not ( = ?auto_747961 ?auto_747964 ) ) ( not ( = ?auto_747961 ?auto_747965 ) ) ( not ( = ?auto_747962 ?auto_747963 ) ) ( not ( = ?auto_747962 ?auto_747964 ) ) ( not ( = ?auto_747962 ?auto_747965 ) ) ( not ( = ?auto_747963 ?auto_747964 ) ) ( not ( = ?auto_747963 ?auto_747965 ) ) ( not ( = ?auto_747964 ?auto_747965 ) ) ( ON ?auto_747963 ?auto_747964 ) ( ON ?auto_747962 ?auto_747963 ) ( ON ?auto_747961 ?auto_747962 ) ( ON ?auto_747960 ?auto_747961 ) ( ON ?auto_747959 ?auto_747960 ) ( ON ?auto_747958 ?auto_747959 ) ( ON ?auto_747957 ?auto_747958 ) ( ON ?auto_747956 ?auto_747957 ) ( ON ?auto_747955 ?auto_747956 ) ( ON ?auto_747954 ?auto_747955 ) ( CLEAR ?auto_747952 ) ( ON ?auto_747953 ?auto_747954 ) ( CLEAR ?auto_747953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_747947 ?auto_747948 ?auto_747949 ?auto_747950 ?auto_747951 ?auto_747952 ?auto_747953 )
      ( MAKE-18PILE ?auto_747947 ?auto_747948 ?auto_747949 ?auto_747950 ?auto_747951 ?auto_747952 ?auto_747953 ?auto_747954 ?auto_747955 ?auto_747956 ?auto_747957 ?auto_747958 ?auto_747959 ?auto_747960 ?auto_747961 ?auto_747962 ?auto_747963 ?auto_747964 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_747984 - BLOCK
      ?auto_747985 - BLOCK
      ?auto_747986 - BLOCK
      ?auto_747987 - BLOCK
      ?auto_747988 - BLOCK
      ?auto_747989 - BLOCK
      ?auto_747990 - BLOCK
      ?auto_747991 - BLOCK
      ?auto_747992 - BLOCK
      ?auto_747993 - BLOCK
      ?auto_747994 - BLOCK
      ?auto_747995 - BLOCK
      ?auto_747996 - BLOCK
      ?auto_747997 - BLOCK
      ?auto_747998 - BLOCK
      ?auto_747999 - BLOCK
      ?auto_748000 - BLOCK
      ?auto_748001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_748001 ) ( ON-TABLE ?auto_747984 ) ( ON ?auto_747985 ?auto_747984 ) ( ON ?auto_747986 ?auto_747985 ) ( ON ?auto_747987 ?auto_747986 ) ( ON ?auto_747988 ?auto_747987 ) ( ON ?auto_747989 ?auto_747988 ) ( not ( = ?auto_747984 ?auto_747985 ) ) ( not ( = ?auto_747984 ?auto_747986 ) ) ( not ( = ?auto_747984 ?auto_747987 ) ) ( not ( = ?auto_747984 ?auto_747988 ) ) ( not ( = ?auto_747984 ?auto_747989 ) ) ( not ( = ?auto_747984 ?auto_747990 ) ) ( not ( = ?auto_747984 ?auto_747991 ) ) ( not ( = ?auto_747984 ?auto_747992 ) ) ( not ( = ?auto_747984 ?auto_747993 ) ) ( not ( = ?auto_747984 ?auto_747994 ) ) ( not ( = ?auto_747984 ?auto_747995 ) ) ( not ( = ?auto_747984 ?auto_747996 ) ) ( not ( = ?auto_747984 ?auto_747997 ) ) ( not ( = ?auto_747984 ?auto_747998 ) ) ( not ( = ?auto_747984 ?auto_747999 ) ) ( not ( = ?auto_747984 ?auto_748000 ) ) ( not ( = ?auto_747984 ?auto_748001 ) ) ( not ( = ?auto_747985 ?auto_747986 ) ) ( not ( = ?auto_747985 ?auto_747987 ) ) ( not ( = ?auto_747985 ?auto_747988 ) ) ( not ( = ?auto_747985 ?auto_747989 ) ) ( not ( = ?auto_747985 ?auto_747990 ) ) ( not ( = ?auto_747985 ?auto_747991 ) ) ( not ( = ?auto_747985 ?auto_747992 ) ) ( not ( = ?auto_747985 ?auto_747993 ) ) ( not ( = ?auto_747985 ?auto_747994 ) ) ( not ( = ?auto_747985 ?auto_747995 ) ) ( not ( = ?auto_747985 ?auto_747996 ) ) ( not ( = ?auto_747985 ?auto_747997 ) ) ( not ( = ?auto_747985 ?auto_747998 ) ) ( not ( = ?auto_747985 ?auto_747999 ) ) ( not ( = ?auto_747985 ?auto_748000 ) ) ( not ( = ?auto_747985 ?auto_748001 ) ) ( not ( = ?auto_747986 ?auto_747987 ) ) ( not ( = ?auto_747986 ?auto_747988 ) ) ( not ( = ?auto_747986 ?auto_747989 ) ) ( not ( = ?auto_747986 ?auto_747990 ) ) ( not ( = ?auto_747986 ?auto_747991 ) ) ( not ( = ?auto_747986 ?auto_747992 ) ) ( not ( = ?auto_747986 ?auto_747993 ) ) ( not ( = ?auto_747986 ?auto_747994 ) ) ( not ( = ?auto_747986 ?auto_747995 ) ) ( not ( = ?auto_747986 ?auto_747996 ) ) ( not ( = ?auto_747986 ?auto_747997 ) ) ( not ( = ?auto_747986 ?auto_747998 ) ) ( not ( = ?auto_747986 ?auto_747999 ) ) ( not ( = ?auto_747986 ?auto_748000 ) ) ( not ( = ?auto_747986 ?auto_748001 ) ) ( not ( = ?auto_747987 ?auto_747988 ) ) ( not ( = ?auto_747987 ?auto_747989 ) ) ( not ( = ?auto_747987 ?auto_747990 ) ) ( not ( = ?auto_747987 ?auto_747991 ) ) ( not ( = ?auto_747987 ?auto_747992 ) ) ( not ( = ?auto_747987 ?auto_747993 ) ) ( not ( = ?auto_747987 ?auto_747994 ) ) ( not ( = ?auto_747987 ?auto_747995 ) ) ( not ( = ?auto_747987 ?auto_747996 ) ) ( not ( = ?auto_747987 ?auto_747997 ) ) ( not ( = ?auto_747987 ?auto_747998 ) ) ( not ( = ?auto_747987 ?auto_747999 ) ) ( not ( = ?auto_747987 ?auto_748000 ) ) ( not ( = ?auto_747987 ?auto_748001 ) ) ( not ( = ?auto_747988 ?auto_747989 ) ) ( not ( = ?auto_747988 ?auto_747990 ) ) ( not ( = ?auto_747988 ?auto_747991 ) ) ( not ( = ?auto_747988 ?auto_747992 ) ) ( not ( = ?auto_747988 ?auto_747993 ) ) ( not ( = ?auto_747988 ?auto_747994 ) ) ( not ( = ?auto_747988 ?auto_747995 ) ) ( not ( = ?auto_747988 ?auto_747996 ) ) ( not ( = ?auto_747988 ?auto_747997 ) ) ( not ( = ?auto_747988 ?auto_747998 ) ) ( not ( = ?auto_747988 ?auto_747999 ) ) ( not ( = ?auto_747988 ?auto_748000 ) ) ( not ( = ?auto_747988 ?auto_748001 ) ) ( not ( = ?auto_747989 ?auto_747990 ) ) ( not ( = ?auto_747989 ?auto_747991 ) ) ( not ( = ?auto_747989 ?auto_747992 ) ) ( not ( = ?auto_747989 ?auto_747993 ) ) ( not ( = ?auto_747989 ?auto_747994 ) ) ( not ( = ?auto_747989 ?auto_747995 ) ) ( not ( = ?auto_747989 ?auto_747996 ) ) ( not ( = ?auto_747989 ?auto_747997 ) ) ( not ( = ?auto_747989 ?auto_747998 ) ) ( not ( = ?auto_747989 ?auto_747999 ) ) ( not ( = ?auto_747989 ?auto_748000 ) ) ( not ( = ?auto_747989 ?auto_748001 ) ) ( not ( = ?auto_747990 ?auto_747991 ) ) ( not ( = ?auto_747990 ?auto_747992 ) ) ( not ( = ?auto_747990 ?auto_747993 ) ) ( not ( = ?auto_747990 ?auto_747994 ) ) ( not ( = ?auto_747990 ?auto_747995 ) ) ( not ( = ?auto_747990 ?auto_747996 ) ) ( not ( = ?auto_747990 ?auto_747997 ) ) ( not ( = ?auto_747990 ?auto_747998 ) ) ( not ( = ?auto_747990 ?auto_747999 ) ) ( not ( = ?auto_747990 ?auto_748000 ) ) ( not ( = ?auto_747990 ?auto_748001 ) ) ( not ( = ?auto_747991 ?auto_747992 ) ) ( not ( = ?auto_747991 ?auto_747993 ) ) ( not ( = ?auto_747991 ?auto_747994 ) ) ( not ( = ?auto_747991 ?auto_747995 ) ) ( not ( = ?auto_747991 ?auto_747996 ) ) ( not ( = ?auto_747991 ?auto_747997 ) ) ( not ( = ?auto_747991 ?auto_747998 ) ) ( not ( = ?auto_747991 ?auto_747999 ) ) ( not ( = ?auto_747991 ?auto_748000 ) ) ( not ( = ?auto_747991 ?auto_748001 ) ) ( not ( = ?auto_747992 ?auto_747993 ) ) ( not ( = ?auto_747992 ?auto_747994 ) ) ( not ( = ?auto_747992 ?auto_747995 ) ) ( not ( = ?auto_747992 ?auto_747996 ) ) ( not ( = ?auto_747992 ?auto_747997 ) ) ( not ( = ?auto_747992 ?auto_747998 ) ) ( not ( = ?auto_747992 ?auto_747999 ) ) ( not ( = ?auto_747992 ?auto_748000 ) ) ( not ( = ?auto_747992 ?auto_748001 ) ) ( not ( = ?auto_747993 ?auto_747994 ) ) ( not ( = ?auto_747993 ?auto_747995 ) ) ( not ( = ?auto_747993 ?auto_747996 ) ) ( not ( = ?auto_747993 ?auto_747997 ) ) ( not ( = ?auto_747993 ?auto_747998 ) ) ( not ( = ?auto_747993 ?auto_747999 ) ) ( not ( = ?auto_747993 ?auto_748000 ) ) ( not ( = ?auto_747993 ?auto_748001 ) ) ( not ( = ?auto_747994 ?auto_747995 ) ) ( not ( = ?auto_747994 ?auto_747996 ) ) ( not ( = ?auto_747994 ?auto_747997 ) ) ( not ( = ?auto_747994 ?auto_747998 ) ) ( not ( = ?auto_747994 ?auto_747999 ) ) ( not ( = ?auto_747994 ?auto_748000 ) ) ( not ( = ?auto_747994 ?auto_748001 ) ) ( not ( = ?auto_747995 ?auto_747996 ) ) ( not ( = ?auto_747995 ?auto_747997 ) ) ( not ( = ?auto_747995 ?auto_747998 ) ) ( not ( = ?auto_747995 ?auto_747999 ) ) ( not ( = ?auto_747995 ?auto_748000 ) ) ( not ( = ?auto_747995 ?auto_748001 ) ) ( not ( = ?auto_747996 ?auto_747997 ) ) ( not ( = ?auto_747996 ?auto_747998 ) ) ( not ( = ?auto_747996 ?auto_747999 ) ) ( not ( = ?auto_747996 ?auto_748000 ) ) ( not ( = ?auto_747996 ?auto_748001 ) ) ( not ( = ?auto_747997 ?auto_747998 ) ) ( not ( = ?auto_747997 ?auto_747999 ) ) ( not ( = ?auto_747997 ?auto_748000 ) ) ( not ( = ?auto_747997 ?auto_748001 ) ) ( not ( = ?auto_747998 ?auto_747999 ) ) ( not ( = ?auto_747998 ?auto_748000 ) ) ( not ( = ?auto_747998 ?auto_748001 ) ) ( not ( = ?auto_747999 ?auto_748000 ) ) ( not ( = ?auto_747999 ?auto_748001 ) ) ( not ( = ?auto_748000 ?auto_748001 ) ) ( ON ?auto_748000 ?auto_748001 ) ( ON ?auto_747999 ?auto_748000 ) ( ON ?auto_747998 ?auto_747999 ) ( ON ?auto_747997 ?auto_747998 ) ( ON ?auto_747996 ?auto_747997 ) ( ON ?auto_747995 ?auto_747996 ) ( ON ?auto_747994 ?auto_747995 ) ( ON ?auto_747993 ?auto_747994 ) ( ON ?auto_747992 ?auto_747993 ) ( ON ?auto_747991 ?auto_747992 ) ( CLEAR ?auto_747989 ) ( ON ?auto_747990 ?auto_747991 ) ( CLEAR ?auto_747990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_747984 ?auto_747985 ?auto_747986 ?auto_747987 ?auto_747988 ?auto_747989 ?auto_747990 )
      ( MAKE-18PILE ?auto_747984 ?auto_747985 ?auto_747986 ?auto_747987 ?auto_747988 ?auto_747989 ?auto_747990 ?auto_747991 ?auto_747992 ?auto_747993 ?auto_747994 ?auto_747995 ?auto_747996 ?auto_747997 ?auto_747998 ?auto_747999 ?auto_748000 ?auto_748001 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748020 - BLOCK
      ?auto_748021 - BLOCK
      ?auto_748022 - BLOCK
      ?auto_748023 - BLOCK
      ?auto_748024 - BLOCK
      ?auto_748025 - BLOCK
      ?auto_748026 - BLOCK
      ?auto_748027 - BLOCK
      ?auto_748028 - BLOCK
      ?auto_748029 - BLOCK
      ?auto_748030 - BLOCK
      ?auto_748031 - BLOCK
      ?auto_748032 - BLOCK
      ?auto_748033 - BLOCK
      ?auto_748034 - BLOCK
      ?auto_748035 - BLOCK
      ?auto_748036 - BLOCK
      ?auto_748037 - BLOCK
    )
    :vars
    (
      ?auto_748038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748037 ?auto_748038 ) ( ON-TABLE ?auto_748020 ) ( ON ?auto_748021 ?auto_748020 ) ( ON ?auto_748022 ?auto_748021 ) ( ON ?auto_748023 ?auto_748022 ) ( ON ?auto_748024 ?auto_748023 ) ( not ( = ?auto_748020 ?auto_748021 ) ) ( not ( = ?auto_748020 ?auto_748022 ) ) ( not ( = ?auto_748020 ?auto_748023 ) ) ( not ( = ?auto_748020 ?auto_748024 ) ) ( not ( = ?auto_748020 ?auto_748025 ) ) ( not ( = ?auto_748020 ?auto_748026 ) ) ( not ( = ?auto_748020 ?auto_748027 ) ) ( not ( = ?auto_748020 ?auto_748028 ) ) ( not ( = ?auto_748020 ?auto_748029 ) ) ( not ( = ?auto_748020 ?auto_748030 ) ) ( not ( = ?auto_748020 ?auto_748031 ) ) ( not ( = ?auto_748020 ?auto_748032 ) ) ( not ( = ?auto_748020 ?auto_748033 ) ) ( not ( = ?auto_748020 ?auto_748034 ) ) ( not ( = ?auto_748020 ?auto_748035 ) ) ( not ( = ?auto_748020 ?auto_748036 ) ) ( not ( = ?auto_748020 ?auto_748037 ) ) ( not ( = ?auto_748020 ?auto_748038 ) ) ( not ( = ?auto_748021 ?auto_748022 ) ) ( not ( = ?auto_748021 ?auto_748023 ) ) ( not ( = ?auto_748021 ?auto_748024 ) ) ( not ( = ?auto_748021 ?auto_748025 ) ) ( not ( = ?auto_748021 ?auto_748026 ) ) ( not ( = ?auto_748021 ?auto_748027 ) ) ( not ( = ?auto_748021 ?auto_748028 ) ) ( not ( = ?auto_748021 ?auto_748029 ) ) ( not ( = ?auto_748021 ?auto_748030 ) ) ( not ( = ?auto_748021 ?auto_748031 ) ) ( not ( = ?auto_748021 ?auto_748032 ) ) ( not ( = ?auto_748021 ?auto_748033 ) ) ( not ( = ?auto_748021 ?auto_748034 ) ) ( not ( = ?auto_748021 ?auto_748035 ) ) ( not ( = ?auto_748021 ?auto_748036 ) ) ( not ( = ?auto_748021 ?auto_748037 ) ) ( not ( = ?auto_748021 ?auto_748038 ) ) ( not ( = ?auto_748022 ?auto_748023 ) ) ( not ( = ?auto_748022 ?auto_748024 ) ) ( not ( = ?auto_748022 ?auto_748025 ) ) ( not ( = ?auto_748022 ?auto_748026 ) ) ( not ( = ?auto_748022 ?auto_748027 ) ) ( not ( = ?auto_748022 ?auto_748028 ) ) ( not ( = ?auto_748022 ?auto_748029 ) ) ( not ( = ?auto_748022 ?auto_748030 ) ) ( not ( = ?auto_748022 ?auto_748031 ) ) ( not ( = ?auto_748022 ?auto_748032 ) ) ( not ( = ?auto_748022 ?auto_748033 ) ) ( not ( = ?auto_748022 ?auto_748034 ) ) ( not ( = ?auto_748022 ?auto_748035 ) ) ( not ( = ?auto_748022 ?auto_748036 ) ) ( not ( = ?auto_748022 ?auto_748037 ) ) ( not ( = ?auto_748022 ?auto_748038 ) ) ( not ( = ?auto_748023 ?auto_748024 ) ) ( not ( = ?auto_748023 ?auto_748025 ) ) ( not ( = ?auto_748023 ?auto_748026 ) ) ( not ( = ?auto_748023 ?auto_748027 ) ) ( not ( = ?auto_748023 ?auto_748028 ) ) ( not ( = ?auto_748023 ?auto_748029 ) ) ( not ( = ?auto_748023 ?auto_748030 ) ) ( not ( = ?auto_748023 ?auto_748031 ) ) ( not ( = ?auto_748023 ?auto_748032 ) ) ( not ( = ?auto_748023 ?auto_748033 ) ) ( not ( = ?auto_748023 ?auto_748034 ) ) ( not ( = ?auto_748023 ?auto_748035 ) ) ( not ( = ?auto_748023 ?auto_748036 ) ) ( not ( = ?auto_748023 ?auto_748037 ) ) ( not ( = ?auto_748023 ?auto_748038 ) ) ( not ( = ?auto_748024 ?auto_748025 ) ) ( not ( = ?auto_748024 ?auto_748026 ) ) ( not ( = ?auto_748024 ?auto_748027 ) ) ( not ( = ?auto_748024 ?auto_748028 ) ) ( not ( = ?auto_748024 ?auto_748029 ) ) ( not ( = ?auto_748024 ?auto_748030 ) ) ( not ( = ?auto_748024 ?auto_748031 ) ) ( not ( = ?auto_748024 ?auto_748032 ) ) ( not ( = ?auto_748024 ?auto_748033 ) ) ( not ( = ?auto_748024 ?auto_748034 ) ) ( not ( = ?auto_748024 ?auto_748035 ) ) ( not ( = ?auto_748024 ?auto_748036 ) ) ( not ( = ?auto_748024 ?auto_748037 ) ) ( not ( = ?auto_748024 ?auto_748038 ) ) ( not ( = ?auto_748025 ?auto_748026 ) ) ( not ( = ?auto_748025 ?auto_748027 ) ) ( not ( = ?auto_748025 ?auto_748028 ) ) ( not ( = ?auto_748025 ?auto_748029 ) ) ( not ( = ?auto_748025 ?auto_748030 ) ) ( not ( = ?auto_748025 ?auto_748031 ) ) ( not ( = ?auto_748025 ?auto_748032 ) ) ( not ( = ?auto_748025 ?auto_748033 ) ) ( not ( = ?auto_748025 ?auto_748034 ) ) ( not ( = ?auto_748025 ?auto_748035 ) ) ( not ( = ?auto_748025 ?auto_748036 ) ) ( not ( = ?auto_748025 ?auto_748037 ) ) ( not ( = ?auto_748025 ?auto_748038 ) ) ( not ( = ?auto_748026 ?auto_748027 ) ) ( not ( = ?auto_748026 ?auto_748028 ) ) ( not ( = ?auto_748026 ?auto_748029 ) ) ( not ( = ?auto_748026 ?auto_748030 ) ) ( not ( = ?auto_748026 ?auto_748031 ) ) ( not ( = ?auto_748026 ?auto_748032 ) ) ( not ( = ?auto_748026 ?auto_748033 ) ) ( not ( = ?auto_748026 ?auto_748034 ) ) ( not ( = ?auto_748026 ?auto_748035 ) ) ( not ( = ?auto_748026 ?auto_748036 ) ) ( not ( = ?auto_748026 ?auto_748037 ) ) ( not ( = ?auto_748026 ?auto_748038 ) ) ( not ( = ?auto_748027 ?auto_748028 ) ) ( not ( = ?auto_748027 ?auto_748029 ) ) ( not ( = ?auto_748027 ?auto_748030 ) ) ( not ( = ?auto_748027 ?auto_748031 ) ) ( not ( = ?auto_748027 ?auto_748032 ) ) ( not ( = ?auto_748027 ?auto_748033 ) ) ( not ( = ?auto_748027 ?auto_748034 ) ) ( not ( = ?auto_748027 ?auto_748035 ) ) ( not ( = ?auto_748027 ?auto_748036 ) ) ( not ( = ?auto_748027 ?auto_748037 ) ) ( not ( = ?auto_748027 ?auto_748038 ) ) ( not ( = ?auto_748028 ?auto_748029 ) ) ( not ( = ?auto_748028 ?auto_748030 ) ) ( not ( = ?auto_748028 ?auto_748031 ) ) ( not ( = ?auto_748028 ?auto_748032 ) ) ( not ( = ?auto_748028 ?auto_748033 ) ) ( not ( = ?auto_748028 ?auto_748034 ) ) ( not ( = ?auto_748028 ?auto_748035 ) ) ( not ( = ?auto_748028 ?auto_748036 ) ) ( not ( = ?auto_748028 ?auto_748037 ) ) ( not ( = ?auto_748028 ?auto_748038 ) ) ( not ( = ?auto_748029 ?auto_748030 ) ) ( not ( = ?auto_748029 ?auto_748031 ) ) ( not ( = ?auto_748029 ?auto_748032 ) ) ( not ( = ?auto_748029 ?auto_748033 ) ) ( not ( = ?auto_748029 ?auto_748034 ) ) ( not ( = ?auto_748029 ?auto_748035 ) ) ( not ( = ?auto_748029 ?auto_748036 ) ) ( not ( = ?auto_748029 ?auto_748037 ) ) ( not ( = ?auto_748029 ?auto_748038 ) ) ( not ( = ?auto_748030 ?auto_748031 ) ) ( not ( = ?auto_748030 ?auto_748032 ) ) ( not ( = ?auto_748030 ?auto_748033 ) ) ( not ( = ?auto_748030 ?auto_748034 ) ) ( not ( = ?auto_748030 ?auto_748035 ) ) ( not ( = ?auto_748030 ?auto_748036 ) ) ( not ( = ?auto_748030 ?auto_748037 ) ) ( not ( = ?auto_748030 ?auto_748038 ) ) ( not ( = ?auto_748031 ?auto_748032 ) ) ( not ( = ?auto_748031 ?auto_748033 ) ) ( not ( = ?auto_748031 ?auto_748034 ) ) ( not ( = ?auto_748031 ?auto_748035 ) ) ( not ( = ?auto_748031 ?auto_748036 ) ) ( not ( = ?auto_748031 ?auto_748037 ) ) ( not ( = ?auto_748031 ?auto_748038 ) ) ( not ( = ?auto_748032 ?auto_748033 ) ) ( not ( = ?auto_748032 ?auto_748034 ) ) ( not ( = ?auto_748032 ?auto_748035 ) ) ( not ( = ?auto_748032 ?auto_748036 ) ) ( not ( = ?auto_748032 ?auto_748037 ) ) ( not ( = ?auto_748032 ?auto_748038 ) ) ( not ( = ?auto_748033 ?auto_748034 ) ) ( not ( = ?auto_748033 ?auto_748035 ) ) ( not ( = ?auto_748033 ?auto_748036 ) ) ( not ( = ?auto_748033 ?auto_748037 ) ) ( not ( = ?auto_748033 ?auto_748038 ) ) ( not ( = ?auto_748034 ?auto_748035 ) ) ( not ( = ?auto_748034 ?auto_748036 ) ) ( not ( = ?auto_748034 ?auto_748037 ) ) ( not ( = ?auto_748034 ?auto_748038 ) ) ( not ( = ?auto_748035 ?auto_748036 ) ) ( not ( = ?auto_748035 ?auto_748037 ) ) ( not ( = ?auto_748035 ?auto_748038 ) ) ( not ( = ?auto_748036 ?auto_748037 ) ) ( not ( = ?auto_748036 ?auto_748038 ) ) ( not ( = ?auto_748037 ?auto_748038 ) ) ( ON ?auto_748036 ?auto_748037 ) ( ON ?auto_748035 ?auto_748036 ) ( ON ?auto_748034 ?auto_748035 ) ( ON ?auto_748033 ?auto_748034 ) ( ON ?auto_748032 ?auto_748033 ) ( ON ?auto_748031 ?auto_748032 ) ( ON ?auto_748030 ?auto_748031 ) ( ON ?auto_748029 ?auto_748030 ) ( ON ?auto_748028 ?auto_748029 ) ( ON ?auto_748027 ?auto_748028 ) ( ON ?auto_748026 ?auto_748027 ) ( CLEAR ?auto_748024 ) ( ON ?auto_748025 ?auto_748026 ) ( CLEAR ?auto_748025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_748020 ?auto_748021 ?auto_748022 ?auto_748023 ?auto_748024 ?auto_748025 )
      ( MAKE-18PILE ?auto_748020 ?auto_748021 ?auto_748022 ?auto_748023 ?auto_748024 ?auto_748025 ?auto_748026 ?auto_748027 ?auto_748028 ?auto_748029 ?auto_748030 ?auto_748031 ?auto_748032 ?auto_748033 ?auto_748034 ?auto_748035 ?auto_748036 ?auto_748037 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748057 - BLOCK
      ?auto_748058 - BLOCK
      ?auto_748059 - BLOCK
      ?auto_748060 - BLOCK
      ?auto_748061 - BLOCK
      ?auto_748062 - BLOCK
      ?auto_748063 - BLOCK
      ?auto_748064 - BLOCK
      ?auto_748065 - BLOCK
      ?auto_748066 - BLOCK
      ?auto_748067 - BLOCK
      ?auto_748068 - BLOCK
      ?auto_748069 - BLOCK
      ?auto_748070 - BLOCK
      ?auto_748071 - BLOCK
      ?auto_748072 - BLOCK
      ?auto_748073 - BLOCK
      ?auto_748074 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_748074 ) ( ON-TABLE ?auto_748057 ) ( ON ?auto_748058 ?auto_748057 ) ( ON ?auto_748059 ?auto_748058 ) ( ON ?auto_748060 ?auto_748059 ) ( ON ?auto_748061 ?auto_748060 ) ( not ( = ?auto_748057 ?auto_748058 ) ) ( not ( = ?auto_748057 ?auto_748059 ) ) ( not ( = ?auto_748057 ?auto_748060 ) ) ( not ( = ?auto_748057 ?auto_748061 ) ) ( not ( = ?auto_748057 ?auto_748062 ) ) ( not ( = ?auto_748057 ?auto_748063 ) ) ( not ( = ?auto_748057 ?auto_748064 ) ) ( not ( = ?auto_748057 ?auto_748065 ) ) ( not ( = ?auto_748057 ?auto_748066 ) ) ( not ( = ?auto_748057 ?auto_748067 ) ) ( not ( = ?auto_748057 ?auto_748068 ) ) ( not ( = ?auto_748057 ?auto_748069 ) ) ( not ( = ?auto_748057 ?auto_748070 ) ) ( not ( = ?auto_748057 ?auto_748071 ) ) ( not ( = ?auto_748057 ?auto_748072 ) ) ( not ( = ?auto_748057 ?auto_748073 ) ) ( not ( = ?auto_748057 ?auto_748074 ) ) ( not ( = ?auto_748058 ?auto_748059 ) ) ( not ( = ?auto_748058 ?auto_748060 ) ) ( not ( = ?auto_748058 ?auto_748061 ) ) ( not ( = ?auto_748058 ?auto_748062 ) ) ( not ( = ?auto_748058 ?auto_748063 ) ) ( not ( = ?auto_748058 ?auto_748064 ) ) ( not ( = ?auto_748058 ?auto_748065 ) ) ( not ( = ?auto_748058 ?auto_748066 ) ) ( not ( = ?auto_748058 ?auto_748067 ) ) ( not ( = ?auto_748058 ?auto_748068 ) ) ( not ( = ?auto_748058 ?auto_748069 ) ) ( not ( = ?auto_748058 ?auto_748070 ) ) ( not ( = ?auto_748058 ?auto_748071 ) ) ( not ( = ?auto_748058 ?auto_748072 ) ) ( not ( = ?auto_748058 ?auto_748073 ) ) ( not ( = ?auto_748058 ?auto_748074 ) ) ( not ( = ?auto_748059 ?auto_748060 ) ) ( not ( = ?auto_748059 ?auto_748061 ) ) ( not ( = ?auto_748059 ?auto_748062 ) ) ( not ( = ?auto_748059 ?auto_748063 ) ) ( not ( = ?auto_748059 ?auto_748064 ) ) ( not ( = ?auto_748059 ?auto_748065 ) ) ( not ( = ?auto_748059 ?auto_748066 ) ) ( not ( = ?auto_748059 ?auto_748067 ) ) ( not ( = ?auto_748059 ?auto_748068 ) ) ( not ( = ?auto_748059 ?auto_748069 ) ) ( not ( = ?auto_748059 ?auto_748070 ) ) ( not ( = ?auto_748059 ?auto_748071 ) ) ( not ( = ?auto_748059 ?auto_748072 ) ) ( not ( = ?auto_748059 ?auto_748073 ) ) ( not ( = ?auto_748059 ?auto_748074 ) ) ( not ( = ?auto_748060 ?auto_748061 ) ) ( not ( = ?auto_748060 ?auto_748062 ) ) ( not ( = ?auto_748060 ?auto_748063 ) ) ( not ( = ?auto_748060 ?auto_748064 ) ) ( not ( = ?auto_748060 ?auto_748065 ) ) ( not ( = ?auto_748060 ?auto_748066 ) ) ( not ( = ?auto_748060 ?auto_748067 ) ) ( not ( = ?auto_748060 ?auto_748068 ) ) ( not ( = ?auto_748060 ?auto_748069 ) ) ( not ( = ?auto_748060 ?auto_748070 ) ) ( not ( = ?auto_748060 ?auto_748071 ) ) ( not ( = ?auto_748060 ?auto_748072 ) ) ( not ( = ?auto_748060 ?auto_748073 ) ) ( not ( = ?auto_748060 ?auto_748074 ) ) ( not ( = ?auto_748061 ?auto_748062 ) ) ( not ( = ?auto_748061 ?auto_748063 ) ) ( not ( = ?auto_748061 ?auto_748064 ) ) ( not ( = ?auto_748061 ?auto_748065 ) ) ( not ( = ?auto_748061 ?auto_748066 ) ) ( not ( = ?auto_748061 ?auto_748067 ) ) ( not ( = ?auto_748061 ?auto_748068 ) ) ( not ( = ?auto_748061 ?auto_748069 ) ) ( not ( = ?auto_748061 ?auto_748070 ) ) ( not ( = ?auto_748061 ?auto_748071 ) ) ( not ( = ?auto_748061 ?auto_748072 ) ) ( not ( = ?auto_748061 ?auto_748073 ) ) ( not ( = ?auto_748061 ?auto_748074 ) ) ( not ( = ?auto_748062 ?auto_748063 ) ) ( not ( = ?auto_748062 ?auto_748064 ) ) ( not ( = ?auto_748062 ?auto_748065 ) ) ( not ( = ?auto_748062 ?auto_748066 ) ) ( not ( = ?auto_748062 ?auto_748067 ) ) ( not ( = ?auto_748062 ?auto_748068 ) ) ( not ( = ?auto_748062 ?auto_748069 ) ) ( not ( = ?auto_748062 ?auto_748070 ) ) ( not ( = ?auto_748062 ?auto_748071 ) ) ( not ( = ?auto_748062 ?auto_748072 ) ) ( not ( = ?auto_748062 ?auto_748073 ) ) ( not ( = ?auto_748062 ?auto_748074 ) ) ( not ( = ?auto_748063 ?auto_748064 ) ) ( not ( = ?auto_748063 ?auto_748065 ) ) ( not ( = ?auto_748063 ?auto_748066 ) ) ( not ( = ?auto_748063 ?auto_748067 ) ) ( not ( = ?auto_748063 ?auto_748068 ) ) ( not ( = ?auto_748063 ?auto_748069 ) ) ( not ( = ?auto_748063 ?auto_748070 ) ) ( not ( = ?auto_748063 ?auto_748071 ) ) ( not ( = ?auto_748063 ?auto_748072 ) ) ( not ( = ?auto_748063 ?auto_748073 ) ) ( not ( = ?auto_748063 ?auto_748074 ) ) ( not ( = ?auto_748064 ?auto_748065 ) ) ( not ( = ?auto_748064 ?auto_748066 ) ) ( not ( = ?auto_748064 ?auto_748067 ) ) ( not ( = ?auto_748064 ?auto_748068 ) ) ( not ( = ?auto_748064 ?auto_748069 ) ) ( not ( = ?auto_748064 ?auto_748070 ) ) ( not ( = ?auto_748064 ?auto_748071 ) ) ( not ( = ?auto_748064 ?auto_748072 ) ) ( not ( = ?auto_748064 ?auto_748073 ) ) ( not ( = ?auto_748064 ?auto_748074 ) ) ( not ( = ?auto_748065 ?auto_748066 ) ) ( not ( = ?auto_748065 ?auto_748067 ) ) ( not ( = ?auto_748065 ?auto_748068 ) ) ( not ( = ?auto_748065 ?auto_748069 ) ) ( not ( = ?auto_748065 ?auto_748070 ) ) ( not ( = ?auto_748065 ?auto_748071 ) ) ( not ( = ?auto_748065 ?auto_748072 ) ) ( not ( = ?auto_748065 ?auto_748073 ) ) ( not ( = ?auto_748065 ?auto_748074 ) ) ( not ( = ?auto_748066 ?auto_748067 ) ) ( not ( = ?auto_748066 ?auto_748068 ) ) ( not ( = ?auto_748066 ?auto_748069 ) ) ( not ( = ?auto_748066 ?auto_748070 ) ) ( not ( = ?auto_748066 ?auto_748071 ) ) ( not ( = ?auto_748066 ?auto_748072 ) ) ( not ( = ?auto_748066 ?auto_748073 ) ) ( not ( = ?auto_748066 ?auto_748074 ) ) ( not ( = ?auto_748067 ?auto_748068 ) ) ( not ( = ?auto_748067 ?auto_748069 ) ) ( not ( = ?auto_748067 ?auto_748070 ) ) ( not ( = ?auto_748067 ?auto_748071 ) ) ( not ( = ?auto_748067 ?auto_748072 ) ) ( not ( = ?auto_748067 ?auto_748073 ) ) ( not ( = ?auto_748067 ?auto_748074 ) ) ( not ( = ?auto_748068 ?auto_748069 ) ) ( not ( = ?auto_748068 ?auto_748070 ) ) ( not ( = ?auto_748068 ?auto_748071 ) ) ( not ( = ?auto_748068 ?auto_748072 ) ) ( not ( = ?auto_748068 ?auto_748073 ) ) ( not ( = ?auto_748068 ?auto_748074 ) ) ( not ( = ?auto_748069 ?auto_748070 ) ) ( not ( = ?auto_748069 ?auto_748071 ) ) ( not ( = ?auto_748069 ?auto_748072 ) ) ( not ( = ?auto_748069 ?auto_748073 ) ) ( not ( = ?auto_748069 ?auto_748074 ) ) ( not ( = ?auto_748070 ?auto_748071 ) ) ( not ( = ?auto_748070 ?auto_748072 ) ) ( not ( = ?auto_748070 ?auto_748073 ) ) ( not ( = ?auto_748070 ?auto_748074 ) ) ( not ( = ?auto_748071 ?auto_748072 ) ) ( not ( = ?auto_748071 ?auto_748073 ) ) ( not ( = ?auto_748071 ?auto_748074 ) ) ( not ( = ?auto_748072 ?auto_748073 ) ) ( not ( = ?auto_748072 ?auto_748074 ) ) ( not ( = ?auto_748073 ?auto_748074 ) ) ( ON ?auto_748073 ?auto_748074 ) ( ON ?auto_748072 ?auto_748073 ) ( ON ?auto_748071 ?auto_748072 ) ( ON ?auto_748070 ?auto_748071 ) ( ON ?auto_748069 ?auto_748070 ) ( ON ?auto_748068 ?auto_748069 ) ( ON ?auto_748067 ?auto_748068 ) ( ON ?auto_748066 ?auto_748067 ) ( ON ?auto_748065 ?auto_748066 ) ( ON ?auto_748064 ?auto_748065 ) ( ON ?auto_748063 ?auto_748064 ) ( CLEAR ?auto_748061 ) ( ON ?auto_748062 ?auto_748063 ) ( CLEAR ?auto_748062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_748057 ?auto_748058 ?auto_748059 ?auto_748060 ?auto_748061 ?auto_748062 )
      ( MAKE-18PILE ?auto_748057 ?auto_748058 ?auto_748059 ?auto_748060 ?auto_748061 ?auto_748062 ?auto_748063 ?auto_748064 ?auto_748065 ?auto_748066 ?auto_748067 ?auto_748068 ?auto_748069 ?auto_748070 ?auto_748071 ?auto_748072 ?auto_748073 ?auto_748074 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748093 - BLOCK
      ?auto_748094 - BLOCK
      ?auto_748095 - BLOCK
      ?auto_748096 - BLOCK
      ?auto_748097 - BLOCK
      ?auto_748098 - BLOCK
      ?auto_748099 - BLOCK
      ?auto_748100 - BLOCK
      ?auto_748101 - BLOCK
      ?auto_748102 - BLOCK
      ?auto_748103 - BLOCK
      ?auto_748104 - BLOCK
      ?auto_748105 - BLOCK
      ?auto_748106 - BLOCK
      ?auto_748107 - BLOCK
      ?auto_748108 - BLOCK
      ?auto_748109 - BLOCK
      ?auto_748110 - BLOCK
    )
    :vars
    (
      ?auto_748111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748110 ?auto_748111 ) ( ON-TABLE ?auto_748093 ) ( ON ?auto_748094 ?auto_748093 ) ( ON ?auto_748095 ?auto_748094 ) ( ON ?auto_748096 ?auto_748095 ) ( not ( = ?auto_748093 ?auto_748094 ) ) ( not ( = ?auto_748093 ?auto_748095 ) ) ( not ( = ?auto_748093 ?auto_748096 ) ) ( not ( = ?auto_748093 ?auto_748097 ) ) ( not ( = ?auto_748093 ?auto_748098 ) ) ( not ( = ?auto_748093 ?auto_748099 ) ) ( not ( = ?auto_748093 ?auto_748100 ) ) ( not ( = ?auto_748093 ?auto_748101 ) ) ( not ( = ?auto_748093 ?auto_748102 ) ) ( not ( = ?auto_748093 ?auto_748103 ) ) ( not ( = ?auto_748093 ?auto_748104 ) ) ( not ( = ?auto_748093 ?auto_748105 ) ) ( not ( = ?auto_748093 ?auto_748106 ) ) ( not ( = ?auto_748093 ?auto_748107 ) ) ( not ( = ?auto_748093 ?auto_748108 ) ) ( not ( = ?auto_748093 ?auto_748109 ) ) ( not ( = ?auto_748093 ?auto_748110 ) ) ( not ( = ?auto_748093 ?auto_748111 ) ) ( not ( = ?auto_748094 ?auto_748095 ) ) ( not ( = ?auto_748094 ?auto_748096 ) ) ( not ( = ?auto_748094 ?auto_748097 ) ) ( not ( = ?auto_748094 ?auto_748098 ) ) ( not ( = ?auto_748094 ?auto_748099 ) ) ( not ( = ?auto_748094 ?auto_748100 ) ) ( not ( = ?auto_748094 ?auto_748101 ) ) ( not ( = ?auto_748094 ?auto_748102 ) ) ( not ( = ?auto_748094 ?auto_748103 ) ) ( not ( = ?auto_748094 ?auto_748104 ) ) ( not ( = ?auto_748094 ?auto_748105 ) ) ( not ( = ?auto_748094 ?auto_748106 ) ) ( not ( = ?auto_748094 ?auto_748107 ) ) ( not ( = ?auto_748094 ?auto_748108 ) ) ( not ( = ?auto_748094 ?auto_748109 ) ) ( not ( = ?auto_748094 ?auto_748110 ) ) ( not ( = ?auto_748094 ?auto_748111 ) ) ( not ( = ?auto_748095 ?auto_748096 ) ) ( not ( = ?auto_748095 ?auto_748097 ) ) ( not ( = ?auto_748095 ?auto_748098 ) ) ( not ( = ?auto_748095 ?auto_748099 ) ) ( not ( = ?auto_748095 ?auto_748100 ) ) ( not ( = ?auto_748095 ?auto_748101 ) ) ( not ( = ?auto_748095 ?auto_748102 ) ) ( not ( = ?auto_748095 ?auto_748103 ) ) ( not ( = ?auto_748095 ?auto_748104 ) ) ( not ( = ?auto_748095 ?auto_748105 ) ) ( not ( = ?auto_748095 ?auto_748106 ) ) ( not ( = ?auto_748095 ?auto_748107 ) ) ( not ( = ?auto_748095 ?auto_748108 ) ) ( not ( = ?auto_748095 ?auto_748109 ) ) ( not ( = ?auto_748095 ?auto_748110 ) ) ( not ( = ?auto_748095 ?auto_748111 ) ) ( not ( = ?auto_748096 ?auto_748097 ) ) ( not ( = ?auto_748096 ?auto_748098 ) ) ( not ( = ?auto_748096 ?auto_748099 ) ) ( not ( = ?auto_748096 ?auto_748100 ) ) ( not ( = ?auto_748096 ?auto_748101 ) ) ( not ( = ?auto_748096 ?auto_748102 ) ) ( not ( = ?auto_748096 ?auto_748103 ) ) ( not ( = ?auto_748096 ?auto_748104 ) ) ( not ( = ?auto_748096 ?auto_748105 ) ) ( not ( = ?auto_748096 ?auto_748106 ) ) ( not ( = ?auto_748096 ?auto_748107 ) ) ( not ( = ?auto_748096 ?auto_748108 ) ) ( not ( = ?auto_748096 ?auto_748109 ) ) ( not ( = ?auto_748096 ?auto_748110 ) ) ( not ( = ?auto_748096 ?auto_748111 ) ) ( not ( = ?auto_748097 ?auto_748098 ) ) ( not ( = ?auto_748097 ?auto_748099 ) ) ( not ( = ?auto_748097 ?auto_748100 ) ) ( not ( = ?auto_748097 ?auto_748101 ) ) ( not ( = ?auto_748097 ?auto_748102 ) ) ( not ( = ?auto_748097 ?auto_748103 ) ) ( not ( = ?auto_748097 ?auto_748104 ) ) ( not ( = ?auto_748097 ?auto_748105 ) ) ( not ( = ?auto_748097 ?auto_748106 ) ) ( not ( = ?auto_748097 ?auto_748107 ) ) ( not ( = ?auto_748097 ?auto_748108 ) ) ( not ( = ?auto_748097 ?auto_748109 ) ) ( not ( = ?auto_748097 ?auto_748110 ) ) ( not ( = ?auto_748097 ?auto_748111 ) ) ( not ( = ?auto_748098 ?auto_748099 ) ) ( not ( = ?auto_748098 ?auto_748100 ) ) ( not ( = ?auto_748098 ?auto_748101 ) ) ( not ( = ?auto_748098 ?auto_748102 ) ) ( not ( = ?auto_748098 ?auto_748103 ) ) ( not ( = ?auto_748098 ?auto_748104 ) ) ( not ( = ?auto_748098 ?auto_748105 ) ) ( not ( = ?auto_748098 ?auto_748106 ) ) ( not ( = ?auto_748098 ?auto_748107 ) ) ( not ( = ?auto_748098 ?auto_748108 ) ) ( not ( = ?auto_748098 ?auto_748109 ) ) ( not ( = ?auto_748098 ?auto_748110 ) ) ( not ( = ?auto_748098 ?auto_748111 ) ) ( not ( = ?auto_748099 ?auto_748100 ) ) ( not ( = ?auto_748099 ?auto_748101 ) ) ( not ( = ?auto_748099 ?auto_748102 ) ) ( not ( = ?auto_748099 ?auto_748103 ) ) ( not ( = ?auto_748099 ?auto_748104 ) ) ( not ( = ?auto_748099 ?auto_748105 ) ) ( not ( = ?auto_748099 ?auto_748106 ) ) ( not ( = ?auto_748099 ?auto_748107 ) ) ( not ( = ?auto_748099 ?auto_748108 ) ) ( not ( = ?auto_748099 ?auto_748109 ) ) ( not ( = ?auto_748099 ?auto_748110 ) ) ( not ( = ?auto_748099 ?auto_748111 ) ) ( not ( = ?auto_748100 ?auto_748101 ) ) ( not ( = ?auto_748100 ?auto_748102 ) ) ( not ( = ?auto_748100 ?auto_748103 ) ) ( not ( = ?auto_748100 ?auto_748104 ) ) ( not ( = ?auto_748100 ?auto_748105 ) ) ( not ( = ?auto_748100 ?auto_748106 ) ) ( not ( = ?auto_748100 ?auto_748107 ) ) ( not ( = ?auto_748100 ?auto_748108 ) ) ( not ( = ?auto_748100 ?auto_748109 ) ) ( not ( = ?auto_748100 ?auto_748110 ) ) ( not ( = ?auto_748100 ?auto_748111 ) ) ( not ( = ?auto_748101 ?auto_748102 ) ) ( not ( = ?auto_748101 ?auto_748103 ) ) ( not ( = ?auto_748101 ?auto_748104 ) ) ( not ( = ?auto_748101 ?auto_748105 ) ) ( not ( = ?auto_748101 ?auto_748106 ) ) ( not ( = ?auto_748101 ?auto_748107 ) ) ( not ( = ?auto_748101 ?auto_748108 ) ) ( not ( = ?auto_748101 ?auto_748109 ) ) ( not ( = ?auto_748101 ?auto_748110 ) ) ( not ( = ?auto_748101 ?auto_748111 ) ) ( not ( = ?auto_748102 ?auto_748103 ) ) ( not ( = ?auto_748102 ?auto_748104 ) ) ( not ( = ?auto_748102 ?auto_748105 ) ) ( not ( = ?auto_748102 ?auto_748106 ) ) ( not ( = ?auto_748102 ?auto_748107 ) ) ( not ( = ?auto_748102 ?auto_748108 ) ) ( not ( = ?auto_748102 ?auto_748109 ) ) ( not ( = ?auto_748102 ?auto_748110 ) ) ( not ( = ?auto_748102 ?auto_748111 ) ) ( not ( = ?auto_748103 ?auto_748104 ) ) ( not ( = ?auto_748103 ?auto_748105 ) ) ( not ( = ?auto_748103 ?auto_748106 ) ) ( not ( = ?auto_748103 ?auto_748107 ) ) ( not ( = ?auto_748103 ?auto_748108 ) ) ( not ( = ?auto_748103 ?auto_748109 ) ) ( not ( = ?auto_748103 ?auto_748110 ) ) ( not ( = ?auto_748103 ?auto_748111 ) ) ( not ( = ?auto_748104 ?auto_748105 ) ) ( not ( = ?auto_748104 ?auto_748106 ) ) ( not ( = ?auto_748104 ?auto_748107 ) ) ( not ( = ?auto_748104 ?auto_748108 ) ) ( not ( = ?auto_748104 ?auto_748109 ) ) ( not ( = ?auto_748104 ?auto_748110 ) ) ( not ( = ?auto_748104 ?auto_748111 ) ) ( not ( = ?auto_748105 ?auto_748106 ) ) ( not ( = ?auto_748105 ?auto_748107 ) ) ( not ( = ?auto_748105 ?auto_748108 ) ) ( not ( = ?auto_748105 ?auto_748109 ) ) ( not ( = ?auto_748105 ?auto_748110 ) ) ( not ( = ?auto_748105 ?auto_748111 ) ) ( not ( = ?auto_748106 ?auto_748107 ) ) ( not ( = ?auto_748106 ?auto_748108 ) ) ( not ( = ?auto_748106 ?auto_748109 ) ) ( not ( = ?auto_748106 ?auto_748110 ) ) ( not ( = ?auto_748106 ?auto_748111 ) ) ( not ( = ?auto_748107 ?auto_748108 ) ) ( not ( = ?auto_748107 ?auto_748109 ) ) ( not ( = ?auto_748107 ?auto_748110 ) ) ( not ( = ?auto_748107 ?auto_748111 ) ) ( not ( = ?auto_748108 ?auto_748109 ) ) ( not ( = ?auto_748108 ?auto_748110 ) ) ( not ( = ?auto_748108 ?auto_748111 ) ) ( not ( = ?auto_748109 ?auto_748110 ) ) ( not ( = ?auto_748109 ?auto_748111 ) ) ( not ( = ?auto_748110 ?auto_748111 ) ) ( ON ?auto_748109 ?auto_748110 ) ( ON ?auto_748108 ?auto_748109 ) ( ON ?auto_748107 ?auto_748108 ) ( ON ?auto_748106 ?auto_748107 ) ( ON ?auto_748105 ?auto_748106 ) ( ON ?auto_748104 ?auto_748105 ) ( ON ?auto_748103 ?auto_748104 ) ( ON ?auto_748102 ?auto_748103 ) ( ON ?auto_748101 ?auto_748102 ) ( ON ?auto_748100 ?auto_748101 ) ( ON ?auto_748099 ?auto_748100 ) ( ON ?auto_748098 ?auto_748099 ) ( CLEAR ?auto_748096 ) ( ON ?auto_748097 ?auto_748098 ) ( CLEAR ?auto_748097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_748093 ?auto_748094 ?auto_748095 ?auto_748096 ?auto_748097 )
      ( MAKE-18PILE ?auto_748093 ?auto_748094 ?auto_748095 ?auto_748096 ?auto_748097 ?auto_748098 ?auto_748099 ?auto_748100 ?auto_748101 ?auto_748102 ?auto_748103 ?auto_748104 ?auto_748105 ?auto_748106 ?auto_748107 ?auto_748108 ?auto_748109 ?auto_748110 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748130 - BLOCK
      ?auto_748131 - BLOCK
      ?auto_748132 - BLOCK
      ?auto_748133 - BLOCK
      ?auto_748134 - BLOCK
      ?auto_748135 - BLOCK
      ?auto_748136 - BLOCK
      ?auto_748137 - BLOCK
      ?auto_748138 - BLOCK
      ?auto_748139 - BLOCK
      ?auto_748140 - BLOCK
      ?auto_748141 - BLOCK
      ?auto_748142 - BLOCK
      ?auto_748143 - BLOCK
      ?auto_748144 - BLOCK
      ?auto_748145 - BLOCK
      ?auto_748146 - BLOCK
      ?auto_748147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_748147 ) ( ON-TABLE ?auto_748130 ) ( ON ?auto_748131 ?auto_748130 ) ( ON ?auto_748132 ?auto_748131 ) ( ON ?auto_748133 ?auto_748132 ) ( not ( = ?auto_748130 ?auto_748131 ) ) ( not ( = ?auto_748130 ?auto_748132 ) ) ( not ( = ?auto_748130 ?auto_748133 ) ) ( not ( = ?auto_748130 ?auto_748134 ) ) ( not ( = ?auto_748130 ?auto_748135 ) ) ( not ( = ?auto_748130 ?auto_748136 ) ) ( not ( = ?auto_748130 ?auto_748137 ) ) ( not ( = ?auto_748130 ?auto_748138 ) ) ( not ( = ?auto_748130 ?auto_748139 ) ) ( not ( = ?auto_748130 ?auto_748140 ) ) ( not ( = ?auto_748130 ?auto_748141 ) ) ( not ( = ?auto_748130 ?auto_748142 ) ) ( not ( = ?auto_748130 ?auto_748143 ) ) ( not ( = ?auto_748130 ?auto_748144 ) ) ( not ( = ?auto_748130 ?auto_748145 ) ) ( not ( = ?auto_748130 ?auto_748146 ) ) ( not ( = ?auto_748130 ?auto_748147 ) ) ( not ( = ?auto_748131 ?auto_748132 ) ) ( not ( = ?auto_748131 ?auto_748133 ) ) ( not ( = ?auto_748131 ?auto_748134 ) ) ( not ( = ?auto_748131 ?auto_748135 ) ) ( not ( = ?auto_748131 ?auto_748136 ) ) ( not ( = ?auto_748131 ?auto_748137 ) ) ( not ( = ?auto_748131 ?auto_748138 ) ) ( not ( = ?auto_748131 ?auto_748139 ) ) ( not ( = ?auto_748131 ?auto_748140 ) ) ( not ( = ?auto_748131 ?auto_748141 ) ) ( not ( = ?auto_748131 ?auto_748142 ) ) ( not ( = ?auto_748131 ?auto_748143 ) ) ( not ( = ?auto_748131 ?auto_748144 ) ) ( not ( = ?auto_748131 ?auto_748145 ) ) ( not ( = ?auto_748131 ?auto_748146 ) ) ( not ( = ?auto_748131 ?auto_748147 ) ) ( not ( = ?auto_748132 ?auto_748133 ) ) ( not ( = ?auto_748132 ?auto_748134 ) ) ( not ( = ?auto_748132 ?auto_748135 ) ) ( not ( = ?auto_748132 ?auto_748136 ) ) ( not ( = ?auto_748132 ?auto_748137 ) ) ( not ( = ?auto_748132 ?auto_748138 ) ) ( not ( = ?auto_748132 ?auto_748139 ) ) ( not ( = ?auto_748132 ?auto_748140 ) ) ( not ( = ?auto_748132 ?auto_748141 ) ) ( not ( = ?auto_748132 ?auto_748142 ) ) ( not ( = ?auto_748132 ?auto_748143 ) ) ( not ( = ?auto_748132 ?auto_748144 ) ) ( not ( = ?auto_748132 ?auto_748145 ) ) ( not ( = ?auto_748132 ?auto_748146 ) ) ( not ( = ?auto_748132 ?auto_748147 ) ) ( not ( = ?auto_748133 ?auto_748134 ) ) ( not ( = ?auto_748133 ?auto_748135 ) ) ( not ( = ?auto_748133 ?auto_748136 ) ) ( not ( = ?auto_748133 ?auto_748137 ) ) ( not ( = ?auto_748133 ?auto_748138 ) ) ( not ( = ?auto_748133 ?auto_748139 ) ) ( not ( = ?auto_748133 ?auto_748140 ) ) ( not ( = ?auto_748133 ?auto_748141 ) ) ( not ( = ?auto_748133 ?auto_748142 ) ) ( not ( = ?auto_748133 ?auto_748143 ) ) ( not ( = ?auto_748133 ?auto_748144 ) ) ( not ( = ?auto_748133 ?auto_748145 ) ) ( not ( = ?auto_748133 ?auto_748146 ) ) ( not ( = ?auto_748133 ?auto_748147 ) ) ( not ( = ?auto_748134 ?auto_748135 ) ) ( not ( = ?auto_748134 ?auto_748136 ) ) ( not ( = ?auto_748134 ?auto_748137 ) ) ( not ( = ?auto_748134 ?auto_748138 ) ) ( not ( = ?auto_748134 ?auto_748139 ) ) ( not ( = ?auto_748134 ?auto_748140 ) ) ( not ( = ?auto_748134 ?auto_748141 ) ) ( not ( = ?auto_748134 ?auto_748142 ) ) ( not ( = ?auto_748134 ?auto_748143 ) ) ( not ( = ?auto_748134 ?auto_748144 ) ) ( not ( = ?auto_748134 ?auto_748145 ) ) ( not ( = ?auto_748134 ?auto_748146 ) ) ( not ( = ?auto_748134 ?auto_748147 ) ) ( not ( = ?auto_748135 ?auto_748136 ) ) ( not ( = ?auto_748135 ?auto_748137 ) ) ( not ( = ?auto_748135 ?auto_748138 ) ) ( not ( = ?auto_748135 ?auto_748139 ) ) ( not ( = ?auto_748135 ?auto_748140 ) ) ( not ( = ?auto_748135 ?auto_748141 ) ) ( not ( = ?auto_748135 ?auto_748142 ) ) ( not ( = ?auto_748135 ?auto_748143 ) ) ( not ( = ?auto_748135 ?auto_748144 ) ) ( not ( = ?auto_748135 ?auto_748145 ) ) ( not ( = ?auto_748135 ?auto_748146 ) ) ( not ( = ?auto_748135 ?auto_748147 ) ) ( not ( = ?auto_748136 ?auto_748137 ) ) ( not ( = ?auto_748136 ?auto_748138 ) ) ( not ( = ?auto_748136 ?auto_748139 ) ) ( not ( = ?auto_748136 ?auto_748140 ) ) ( not ( = ?auto_748136 ?auto_748141 ) ) ( not ( = ?auto_748136 ?auto_748142 ) ) ( not ( = ?auto_748136 ?auto_748143 ) ) ( not ( = ?auto_748136 ?auto_748144 ) ) ( not ( = ?auto_748136 ?auto_748145 ) ) ( not ( = ?auto_748136 ?auto_748146 ) ) ( not ( = ?auto_748136 ?auto_748147 ) ) ( not ( = ?auto_748137 ?auto_748138 ) ) ( not ( = ?auto_748137 ?auto_748139 ) ) ( not ( = ?auto_748137 ?auto_748140 ) ) ( not ( = ?auto_748137 ?auto_748141 ) ) ( not ( = ?auto_748137 ?auto_748142 ) ) ( not ( = ?auto_748137 ?auto_748143 ) ) ( not ( = ?auto_748137 ?auto_748144 ) ) ( not ( = ?auto_748137 ?auto_748145 ) ) ( not ( = ?auto_748137 ?auto_748146 ) ) ( not ( = ?auto_748137 ?auto_748147 ) ) ( not ( = ?auto_748138 ?auto_748139 ) ) ( not ( = ?auto_748138 ?auto_748140 ) ) ( not ( = ?auto_748138 ?auto_748141 ) ) ( not ( = ?auto_748138 ?auto_748142 ) ) ( not ( = ?auto_748138 ?auto_748143 ) ) ( not ( = ?auto_748138 ?auto_748144 ) ) ( not ( = ?auto_748138 ?auto_748145 ) ) ( not ( = ?auto_748138 ?auto_748146 ) ) ( not ( = ?auto_748138 ?auto_748147 ) ) ( not ( = ?auto_748139 ?auto_748140 ) ) ( not ( = ?auto_748139 ?auto_748141 ) ) ( not ( = ?auto_748139 ?auto_748142 ) ) ( not ( = ?auto_748139 ?auto_748143 ) ) ( not ( = ?auto_748139 ?auto_748144 ) ) ( not ( = ?auto_748139 ?auto_748145 ) ) ( not ( = ?auto_748139 ?auto_748146 ) ) ( not ( = ?auto_748139 ?auto_748147 ) ) ( not ( = ?auto_748140 ?auto_748141 ) ) ( not ( = ?auto_748140 ?auto_748142 ) ) ( not ( = ?auto_748140 ?auto_748143 ) ) ( not ( = ?auto_748140 ?auto_748144 ) ) ( not ( = ?auto_748140 ?auto_748145 ) ) ( not ( = ?auto_748140 ?auto_748146 ) ) ( not ( = ?auto_748140 ?auto_748147 ) ) ( not ( = ?auto_748141 ?auto_748142 ) ) ( not ( = ?auto_748141 ?auto_748143 ) ) ( not ( = ?auto_748141 ?auto_748144 ) ) ( not ( = ?auto_748141 ?auto_748145 ) ) ( not ( = ?auto_748141 ?auto_748146 ) ) ( not ( = ?auto_748141 ?auto_748147 ) ) ( not ( = ?auto_748142 ?auto_748143 ) ) ( not ( = ?auto_748142 ?auto_748144 ) ) ( not ( = ?auto_748142 ?auto_748145 ) ) ( not ( = ?auto_748142 ?auto_748146 ) ) ( not ( = ?auto_748142 ?auto_748147 ) ) ( not ( = ?auto_748143 ?auto_748144 ) ) ( not ( = ?auto_748143 ?auto_748145 ) ) ( not ( = ?auto_748143 ?auto_748146 ) ) ( not ( = ?auto_748143 ?auto_748147 ) ) ( not ( = ?auto_748144 ?auto_748145 ) ) ( not ( = ?auto_748144 ?auto_748146 ) ) ( not ( = ?auto_748144 ?auto_748147 ) ) ( not ( = ?auto_748145 ?auto_748146 ) ) ( not ( = ?auto_748145 ?auto_748147 ) ) ( not ( = ?auto_748146 ?auto_748147 ) ) ( ON ?auto_748146 ?auto_748147 ) ( ON ?auto_748145 ?auto_748146 ) ( ON ?auto_748144 ?auto_748145 ) ( ON ?auto_748143 ?auto_748144 ) ( ON ?auto_748142 ?auto_748143 ) ( ON ?auto_748141 ?auto_748142 ) ( ON ?auto_748140 ?auto_748141 ) ( ON ?auto_748139 ?auto_748140 ) ( ON ?auto_748138 ?auto_748139 ) ( ON ?auto_748137 ?auto_748138 ) ( ON ?auto_748136 ?auto_748137 ) ( ON ?auto_748135 ?auto_748136 ) ( CLEAR ?auto_748133 ) ( ON ?auto_748134 ?auto_748135 ) ( CLEAR ?auto_748134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_748130 ?auto_748131 ?auto_748132 ?auto_748133 ?auto_748134 )
      ( MAKE-18PILE ?auto_748130 ?auto_748131 ?auto_748132 ?auto_748133 ?auto_748134 ?auto_748135 ?auto_748136 ?auto_748137 ?auto_748138 ?auto_748139 ?auto_748140 ?auto_748141 ?auto_748142 ?auto_748143 ?auto_748144 ?auto_748145 ?auto_748146 ?auto_748147 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748166 - BLOCK
      ?auto_748167 - BLOCK
      ?auto_748168 - BLOCK
      ?auto_748169 - BLOCK
      ?auto_748170 - BLOCK
      ?auto_748171 - BLOCK
      ?auto_748172 - BLOCK
      ?auto_748173 - BLOCK
      ?auto_748174 - BLOCK
      ?auto_748175 - BLOCK
      ?auto_748176 - BLOCK
      ?auto_748177 - BLOCK
      ?auto_748178 - BLOCK
      ?auto_748179 - BLOCK
      ?auto_748180 - BLOCK
      ?auto_748181 - BLOCK
      ?auto_748182 - BLOCK
      ?auto_748183 - BLOCK
    )
    :vars
    (
      ?auto_748184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748183 ?auto_748184 ) ( ON-TABLE ?auto_748166 ) ( ON ?auto_748167 ?auto_748166 ) ( ON ?auto_748168 ?auto_748167 ) ( not ( = ?auto_748166 ?auto_748167 ) ) ( not ( = ?auto_748166 ?auto_748168 ) ) ( not ( = ?auto_748166 ?auto_748169 ) ) ( not ( = ?auto_748166 ?auto_748170 ) ) ( not ( = ?auto_748166 ?auto_748171 ) ) ( not ( = ?auto_748166 ?auto_748172 ) ) ( not ( = ?auto_748166 ?auto_748173 ) ) ( not ( = ?auto_748166 ?auto_748174 ) ) ( not ( = ?auto_748166 ?auto_748175 ) ) ( not ( = ?auto_748166 ?auto_748176 ) ) ( not ( = ?auto_748166 ?auto_748177 ) ) ( not ( = ?auto_748166 ?auto_748178 ) ) ( not ( = ?auto_748166 ?auto_748179 ) ) ( not ( = ?auto_748166 ?auto_748180 ) ) ( not ( = ?auto_748166 ?auto_748181 ) ) ( not ( = ?auto_748166 ?auto_748182 ) ) ( not ( = ?auto_748166 ?auto_748183 ) ) ( not ( = ?auto_748166 ?auto_748184 ) ) ( not ( = ?auto_748167 ?auto_748168 ) ) ( not ( = ?auto_748167 ?auto_748169 ) ) ( not ( = ?auto_748167 ?auto_748170 ) ) ( not ( = ?auto_748167 ?auto_748171 ) ) ( not ( = ?auto_748167 ?auto_748172 ) ) ( not ( = ?auto_748167 ?auto_748173 ) ) ( not ( = ?auto_748167 ?auto_748174 ) ) ( not ( = ?auto_748167 ?auto_748175 ) ) ( not ( = ?auto_748167 ?auto_748176 ) ) ( not ( = ?auto_748167 ?auto_748177 ) ) ( not ( = ?auto_748167 ?auto_748178 ) ) ( not ( = ?auto_748167 ?auto_748179 ) ) ( not ( = ?auto_748167 ?auto_748180 ) ) ( not ( = ?auto_748167 ?auto_748181 ) ) ( not ( = ?auto_748167 ?auto_748182 ) ) ( not ( = ?auto_748167 ?auto_748183 ) ) ( not ( = ?auto_748167 ?auto_748184 ) ) ( not ( = ?auto_748168 ?auto_748169 ) ) ( not ( = ?auto_748168 ?auto_748170 ) ) ( not ( = ?auto_748168 ?auto_748171 ) ) ( not ( = ?auto_748168 ?auto_748172 ) ) ( not ( = ?auto_748168 ?auto_748173 ) ) ( not ( = ?auto_748168 ?auto_748174 ) ) ( not ( = ?auto_748168 ?auto_748175 ) ) ( not ( = ?auto_748168 ?auto_748176 ) ) ( not ( = ?auto_748168 ?auto_748177 ) ) ( not ( = ?auto_748168 ?auto_748178 ) ) ( not ( = ?auto_748168 ?auto_748179 ) ) ( not ( = ?auto_748168 ?auto_748180 ) ) ( not ( = ?auto_748168 ?auto_748181 ) ) ( not ( = ?auto_748168 ?auto_748182 ) ) ( not ( = ?auto_748168 ?auto_748183 ) ) ( not ( = ?auto_748168 ?auto_748184 ) ) ( not ( = ?auto_748169 ?auto_748170 ) ) ( not ( = ?auto_748169 ?auto_748171 ) ) ( not ( = ?auto_748169 ?auto_748172 ) ) ( not ( = ?auto_748169 ?auto_748173 ) ) ( not ( = ?auto_748169 ?auto_748174 ) ) ( not ( = ?auto_748169 ?auto_748175 ) ) ( not ( = ?auto_748169 ?auto_748176 ) ) ( not ( = ?auto_748169 ?auto_748177 ) ) ( not ( = ?auto_748169 ?auto_748178 ) ) ( not ( = ?auto_748169 ?auto_748179 ) ) ( not ( = ?auto_748169 ?auto_748180 ) ) ( not ( = ?auto_748169 ?auto_748181 ) ) ( not ( = ?auto_748169 ?auto_748182 ) ) ( not ( = ?auto_748169 ?auto_748183 ) ) ( not ( = ?auto_748169 ?auto_748184 ) ) ( not ( = ?auto_748170 ?auto_748171 ) ) ( not ( = ?auto_748170 ?auto_748172 ) ) ( not ( = ?auto_748170 ?auto_748173 ) ) ( not ( = ?auto_748170 ?auto_748174 ) ) ( not ( = ?auto_748170 ?auto_748175 ) ) ( not ( = ?auto_748170 ?auto_748176 ) ) ( not ( = ?auto_748170 ?auto_748177 ) ) ( not ( = ?auto_748170 ?auto_748178 ) ) ( not ( = ?auto_748170 ?auto_748179 ) ) ( not ( = ?auto_748170 ?auto_748180 ) ) ( not ( = ?auto_748170 ?auto_748181 ) ) ( not ( = ?auto_748170 ?auto_748182 ) ) ( not ( = ?auto_748170 ?auto_748183 ) ) ( not ( = ?auto_748170 ?auto_748184 ) ) ( not ( = ?auto_748171 ?auto_748172 ) ) ( not ( = ?auto_748171 ?auto_748173 ) ) ( not ( = ?auto_748171 ?auto_748174 ) ) ( not ( = ?auto_748171 ?auto_748175 ) ) ( not ( = ?auto_748171 ?auto_748176 ) ) ( not ( = ?auto_748171 ?auto_748177 ) ) ( not ( = ?auto_748171 ?auto_748178 ) ) ( not ( = ?auto_748171 ?auto_748179 ) ) ( not ( = ?auto_748171 ?auto_748180 ) ) ( not ( = ?auto_748171 ?auto_748181 ) ) ( not ( = ?auto_748171 ?auto_748182 ) ) ( not ( = ?auto_748171 ?auto_748183 ) ) ( not ( = ?auto_748171 ?auto_748184 ) ) ( not ( = ?auto_748172 ?auto_748173 ) ) ( not ( = ?auto_748172 ?auto_748174 ) ) ( not ( = ?auto_748172 ?auto_748175 ) ) ( not ( = ?auto_748172 ?auto_748176 ) ) ( not ( = ?auto_748172 ?auto_748177 ) ) ( not ( = ?auto_748172 ?auto_748178 ) ) ( not ( = ?auto_748172 ?auto_748179 ) ) ( not ( = ?auto_748172 ?auto_748180 ) ) ( not ( = ?auto_748172 ?auto_748181 ) ) ( not ( = ?auto_748172 ?auto_748182 ) ) ( not ( = ?auto_748172 ?auto_748183 ) ) ( not ( = ?auto_748172 ?auto_748184 ) ) ( not ( = ?auto_748173 ?auto_748174 ) ) ( not ( = ?auto_748173 ?auto_748175 ) ) ( not ( = ?auto_748173 ?auto_748176 ) ) ( not ( = ?auto_748173 ?auto_748177 ) ) ( not ( = ?auto_748173 ?auto_748178 ) ) ( not ( = ?auto_748173 ?auto_748179 ) ) ( not ( = ?auto_748173 ?auto_748180 ) ) ( not ( = ?auto_748173 ?auto_748181 ) ) ( not ( = ?auto_748173 ?auto_748182 ) ) ( not ( = ?auto_748173 ?auto_748183 ) ) ( not ( = ?auto_748173 ?auto_748184 ) ) ( not ( = ?auto_748174 ?auto_748175 ) ) ( not ( = ?auto_748174 ?auto_748176 ) ) ( not ( = ?auto_748174 ?auto_748177 ) ) ( not ( = ?auto_748174 ?auto_748178 ) ) ( not ( = ?auto_748174 ?auto_748179 ) ) ( not ( = ?auto_748174 ?auto_748180 ) ) ( not ( = ?auto_748174 ?auto_748181 ) ) ( not ( = ?auto_748174 ?auto_748182 ) ) ( not ( = ?auto_748174 ?auto_748183 ) ) ( not ( = ?auto_748174 ?auto_748184 ) ) ( not ( = ?auto_748175 ?auto_748176 ) ) ( not ( = ?auto_748175 ?auto_748177 ) ) ( not ( = ?auto_748175 ?auto_748178 ) ) ( not ( = ?auto_748175 ?auto_748179 ) ) ( not ( = ?auto_748175 ?auto_748180 ) ) ( not ( = ?auto_748175 ?auto_748181 ) ) ( not ( = ?auto_748175 ?auto_748182 ) ) ( not ( = ?auto_748175 ?auto_748183 ) ) ( not ( = ?auto_748175 ?auto_748184 ) ) ( not ( = ?auto_748176 ?auto_748177 ) ) ( not ( = ?auto_748176 ?auto_748178 ) ) ( not ( = ?auto_748176 ?auto_748179 ) ) ( not ( = ?auto_748176 ?auto_748180 ) ) ( not ( = ?auto_748176 ?auto_748181 ) ) ( not ( = ?auto_748176 ?auto_748182 ) ) ( not ( = ?auto_748176 ?auto_748183 ) ) ( not ( = ?auto_748176 ?auto_748184 ) ) ( not ( = ?auto_748177 ?auto_748178 ) ) ( not ( = ?auto_748177 ?auto_748179 ) ) ( not ( = ?auto_748177 ?auto_748180 ) ) ( not ( = ?auto_748177 ?auto_748181 ) ) ( not ( = ?auto_748177 ?auto_748182 ) ) ( not ( = ?auto_748177 ?auto_748183 ) ) ( not ( = ?auto_748177 ?auto_748184 ) ) ( not ( = ?auto_748178 ?auto_748179 ) ) ( not ( = ?auto_748178 ?auto_748180 ) ) ( not ( = ?auto_748178 ?auto_748181 ) ) ( not ( = ?auto_748178 ?auto_748182 ) ) ( not ( = ?auto_748178 ?auto_748183 ) ) ( not ( = ?auto_748178 ?auto_748184 ) ) ( not ( = ?auto_748179 ?auto_748180 ) ) ( not ( = ?auto_748179 ?auto_748181 ) ) ( not ( = ?auto_748179 ?auto_748182 ) ) ( not ( = ?auto_748179 ?auto_748183 ) ) ( not ( = ?auto_748179 ?auto_748184 ) ) ( not ( = ?auto_748180 ?auto_748181 ) ) ( not ( = ?auto_748180 ?auto_748182 ) ) ( not ( = ?auto_748180 ?auto_748183 ) ) ( not ( = ?auto_748180 ?auto_748184 ) ) ( not ( = ?auto_748181 ?auto_748182 ) ) ( not ( = ?auto_748181 ?auto_748183 ) ) ( not ( = ?auto_748181 ?auto_748184 ) ) ( not ( = ?auto_748182 ?auto_748183 ) ) ( not ( = ?auto_748182 ?auto_748184 ) ) ( not ( = ?auto_748183 ?auto_748184 ) ) ( ON ?auto_748182 ?auto_748183 ) ( ON ?auto_748181 ?auto_748182 ) ( ON ?auto_748180 ?auto_748181 ) ( ON ?auto_748179 ?auto_748180 ) ( ON ?auto_748178 ?auto_748179 ) ( ON ?auto_748177 ?auto_748178 ) ( ON ?auto_748176 ?auto_748177 ) ( ON ?auto_748175 ?auto_748176 ) ( ON ?auto_748174 ?auto_748175 ) ( ON ?auto_748173 ?auto_748174 ) ( ON ?auto_748172 ?auto_748173 ) ( ON ?auto_748171 ?auto_748172 ) ( ON ?auto_748170 ?auto_748171 ) ( CLEAR ?auto_748168 ) ( ON ?auto_748169 ?auto_748170 ) ( CLEAR ?auto_748169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_748166 ?auto_748167 ?auto_748168 ?auto_748169 )
      ( MAKE-18PILE ?auto_748166 ?auto_748167 ?auto_748168 ?auto_748169 ?auto_748170 ?auto_748171 ?auto_748172 ?auto_748173 ?auto_748174 ?auto_748175 ?auto_748176 ?auto_748177 ?auto_748178 ?auto_748179 ?auto_748180 ?auto_748181 ?auto_748182 ?auto_748183 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748203 - BLOCK
      ?auto_748204 - BLOCK
      ?auto_748205 - BLOCK
      ?auto_748206 - BLOCK
      ?auto_748207 - BLOCK
      ?auto_748208 - BLOCK
      ?auto_748209 - BLOCK
      ?auto_748210 - BLOCK
      ?auto_748211 - BLOCK
      ?auto_748212 - BLOCK
      ?auto_748213 - BLOCK
      ?auto_748214 - BLOCK
      ?auto_748215 - BLOCK
      ?auto_748216 - BLOCK
      ?auto_748217 - BLOCK
      ?auto_748218 - BLOCK
      ?auto_748219 - BLOCK
      ?auto_748220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_748220 ) ( ON-TABLE ?auto_748203 ) ( ON ?auto_748204 ?auto_748203 ) ( ON ?auto_748205 ?auto_748204 ) ( not ( = ?auto_748203 ?auto_748204 ) ) ( not ( = ?auto_748203 ?auto_748205 ) ) ( not ( = ?auto_748203 ?auto_748206 ) ) ( not ( = ?auto_748203 ?auto_748207 ) ) ( not ( = ?auto_748203 ?auto_748208 ) ) ( not ( = ?auto_748203 ?auto_748209 ) ) ( not ( = ?auto_748203 ?auto_748210 ) ) ( not ( = ?auto_748203 ?auto_748211 ) ) ( not ( = ?auto_748203 ?auto_748212 ) ) ( not ( = ?auto_748203 ?auto_748213 ) ) ( not ( = ?auto_748203 ?auto_748214 ) ) ( not ( = ?auto_748203 ?auto_748215 ) ) ( not ( = ?auto_748203 ?auto_748216 ) ) ( not ( = ?auto_748203 ?auto_748217 ) ) ( not ( = ?auto_748203 ?auto_748218 ) ) ( not ( = ?auto_748203 ?auto_748219 ) ) ( not ( = ?auto_748203 ?auto_748220 ) ) ( not ( = ?auto_748204 ?auto_748205 ) ) ( not ( = ?auto_748204 ?auto_748206 ) ) ( not ( = ?auto_748204 ?auto_748207 ) ) ( not ( = ?auto_748204 ?auto_748208 ) ) ( not ( = ?auto_748204 ?auto_748209 ) ) ( not ( = ?auto_748204 ?auto_748210 ) ) ( not ( = ?auto_748204 ?auto_748211 ) ) ( not ( = ?auto_748204 ?auto_748212 ) ) ( not ( = ?auto_748204 ?auto_748213 ) ) ( not ( = ?auto_748204 ?auto_748214 ) ) ( not ( = ?auto_748204 ?auto_748215 ) ) ( not ( = ?auto_748204 ?auto_748216 ) ) ( not ( = ?auto_748204 ?auto_748217 ) ) ( not ( = ?auto_748204 ?auto_748218 ) ) ( not ( = ?auto_748204 ?auto_748219 ) ) ( not ( = ?auto_748204 ?auto_748220 ) ) ( not ( = ?auto_748205 ?auto_748206 ) ) ( not ( = ?auto_748205 ?auto_748207 ) ) ( not ( = ?auto_748205 ?auto_748208 ) ) ( not ( = ?auto_748205 ?auto_748209 ) ) ( not ( = ?auto_748205 ?auto_748210 ) ) ( not ( = ?auto_748205 ?auto_748211 ) ) ( not ( = ?auto_748205 ?auto_748212 ) ) ( not ( = ?auto_748205 ?auto_748213 ) ) ( not ( = ?auto_748205 ?auto_748214 ) ) ( not ( = ?auto_748205 ?auto_748215 ) ) ( not ( = ?auto_748205 ?auto_748216 ) ) ( not ( = ?auto_748205 ?auto_748217 ) ) ( not ( = ?auto_748205 ?auto_748218 ) ) ( not ( = ?auto_748205 ?auto_748219 ) ) ( not ( = ?auto_748205 ?auto_748220 ) ) ( not ( = ?auto_748206 ?auto_748207 ) ) ( not ( = ?auto_748206 ?auto_748208 ) ) ( not ( = ?auto_748206 ?auto_748209 ) ) ( not ( = ?auto_748206 ?auto_748210 ) ) ( not ( = ?auto_748206 ?auto_748211 ) ) ( not ( = ?auto_748206 ?auto_748212 ) ) ( not ( = ?auto_748206 ?auto_748213 ) ) ( not ( = ?auto_748206 ?auto_748214 ) ) ( not ( = ?auto_748206 ?auto_748215 ) ) ( not ( = ?auto_748206 ?auto_748216 ) ) ( not ( = ?auto_748206 ?auto_748217 ) ) ( not ( = ?auto_748206 ?auto_748218 ) ) ( not ( = ?auto_748206 ?auto_748219 ) ) ( not ( = ?auto_748206 ?auto_748220 ) ) ( not ( = ?auto_748207 ?auto_748208 ) ) ( not ( = ?auto_748207 ?auto_748209 ) ) ( not ( = ?auto_748207 ?auto_748210 ) ) ( not ( = ?auto_748207 ?auto_748211 ) ) ( not ( = ?auto_748207 ?auto_748212 ) ) ( not ( = ?auto_748207 ?auto_748213 ) ) ( not ( = ?auto_748207 ?auto_748214 ) ) ( not ( = ?auto_748207 ?auto_748215 ) ) ( not ( = ?auto_748207 ?auto_748216 ) ) ( not ( = ?auto_748207 ?auto_748217 ) ) ( not ( = ?auto_748207 ?auto_748218 ) ) ( not ( = ?auto_748207 ?auto_748219 ) ) ( not ( = ?auto_748207 ?auto_748220 ) ) ( not ( = ?auto_748208 ?auto_748209 ) ) ( not ( = ?auto_748208 ?auto_748210 ) ) ( not ( = ?auto_748208 ?auto_748211 ) ) ( not ( = ?auto_748208 ?auto_748212 ) ) ( not ( = ?auto_748208 ?auto_748213 ) ) ( not ( = ?auto_748208 ?auto_748214 ) ) ( not ( = ?auto_748208 ?auto_748215 ) ) ( not ( = ?auto_748208 ?auto_748216 ) ) ( not ( = ?auto_748208 ?auto_748217 ) ) ( not ( = ?auto_748208 ?auto_748218 ) ) ( not ( = ?auto_748208 ?auto_748219 ) ) ( not ( = ?auto_748208 ?auto_748220 ) ) ( not ( = ?auto_748209 ?auto_748210 ) ) ( not ( = ?auto_748209 ?auto_748211 ) ) ( not ( = ?auto_748209 ?auto_748212 ) ) ( not ( = ?auto_748209 ?auto_748213 ) ) ( not ( = ?auto_748209 ?auto_748214 ) ) ( not ( = ?auto_748209 ?auto_748215 ) ) ( not ( = ?auto_748209 ?auto_748216 ) ) ( not ( = ?auto_748209 ?auto_748217 ) ) ( not ( = ?auto_748209 ?auto_748218 ) ) ( not ( = ?auto_748209 ?auto_748219 ) ) ( not ( = ?auto_748209 ?auto_748220 ) ) ( not ( = ?auto_748210 ?auto_748211 ) ) ( not ( = ?auto_748210 ?auto_748212 ) ) ( not ( = ?auto_748210 ?auto_748213 ) ) ( not ( = ?auto_748210 ?auto_748214 ) ) ( not ( = ?auto_748210 ?auto_748215 ) ) ( not ( = ?auto_748210 ?auto_748216 ) ) ( not ( = ?auto_748210 ?auto_748217 ) ) ( not ( = ?auto_748210 ?auto_748218 ) ) ( not ( = ?auto_748210 ?auto_748219 ) ) ( not ( = ?auto_748210 ?auto_748220 ) ) ( not ( = ?auto_748211 ?auto_748212 ) ) ( not ( = ?auto_748211 ?auto_748213 ) ) ( not ( = ?auto_748211 ?auto_748214 ) ) ( not ( = ?auto_748211 ?auto_748215 ) ) ( not ( = ?auto_748211 ?auto_748216 ) ) ( not ( = ?auto_748211 ?auto_748217 ) ) ( not ( = ?auto_748211 ?auto_748218 ) ) ( not ( = ?auto_748211 ?auto_748219 ) ) ( not ( = ?auto_748211 ?auto_748220 ) ) ( not ( = ?auto_748212 ?auto_748213 ) ) ( not ( = ?auto_748212 ?auto_748214 ) ) ( not ( = ?auto_748212 ?auto_748215 ) ) ( not ( = ?auto_748212 ?auto_748216 ) ) ( not ( = ?auto_748212 ?auto_748217 ) ) ( not ( = ?auto_748212 ?auto_748218 ) ) ( not ( = ?auto_748212 ?auto_748219 ) ) ( not ( = ?auto_748212 ?auto_748220 ) ) ( not ( = ?auto_748213 ?auto_748214 ) ) ( not ( = ?auto_748213 ?auto_748215 ) ) ( not ( = ?auto_748213 ?auto_748216 ) ) ( not ( = ?auto_748213 ?auto_748217 ) ) ( not ( = ?auto_748213 ?auto_748218 ) ) ( not ( = ?auto_748213 ?auto_748219 ) ) ( not ( = ?auto_748213 ?auto_748220 ) ) ( not ( = ?auto_748214 ?auto_748215 ) ) ( not ( = ?auto_748214 ?auto_748216 ) ) ( not ( = ?auto_748214 ?auto_748217 ) ) ( not ( = ?auto_748214 ?auto_748218 ) ) ( not ( = ?auto_748214 ?auto_748219 ) ) ( not ( = ?auto_748214 ?auto_748220 ) ) ( not ( = ?auto_748215 ?auto_748216 ) ) ( not ( = ?auto_748215 ?auto_748217 ) ) ( not ( = ?auto_748215 ?auto_748218 ) ) ( not ( = ?auto_748215 ?auto_748219 ) ) ( not ( = ?auto_748215 ?auto_748220 ) ) ( not ( = ?auto_748216 ?auto_748217 ) ) ( not ( = ?auto_748216 ?auto_748218 ) ) ( not ( = ?auto_748216 ?auto_748219 ) ) ( not ( = ?auto_748216 ?auto_748220 ) ) ( not ( = ?auto_748217 ?auto_748218 ) ) ( not ( = ?auto_748217 ?auto_748219 ) ) ( not ( = ?auto_748217 ?auto_748220 ) ) ( not ( = ?auto_748218 ?auto_748219 ) ) ( not ( = ?auto_748218 ?auto_748220 ) ) ( not ( = ?auto_748219 ?auto_748220 ) ) ( ON ?auto_748219 ?auto_748220 ) ( ON ?auto_748218 ?auto_748219 ) ( ON ?auto_748217 ?auto_748218 ) ( ON ?auto_748216 ?auto_748217 ) ( ON ?auto_748215 ?auto_748216 ) ( ON ?auto_748214 ?auto_748215 ) ( ON ?auto_748213 ?auto_748214 ) ( ON ?auto_748212 ?auto_748213 ) ( ON ?auto_748211 ?auto_748212 ) ( ON ?auto_748210 ?auto_748211 ) ( ON ?auto_748209 ?auto_748210 ) ( ON ?auto_748208 ?auto_748209 ) ( ON ?auto_748207 ?auto_748208 ) ( CLEAR ?auto_748205 ) ( ON ?auto_748206 ?auto_748207 ) ( CLEAR ?auto_748206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_748203 ?auto_748204 ?auto_748205 ?auto_748206 )
      ( MAKE-18PILE ?auto_748203 ?auto_748204 ?auto_748205 ?auto_748206 ?auto_748207 ?auto_748208 ?auto_748209 ?auto_748210 ?auto_748211 ?auto_748212 ?auto_748213 ?auto_748214 ?auto_748215 ?auto_748216 ?auto_748217 ?auto_748218 ?auto_748219 ?auto_748220 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748239 - BLOCK
      ?auto_748240 - BLOCK
      ?auto_748241 - BLOCK
      ?auto_748242 - BLOCK
      ?auto_748243 - BLOCK
      ?auto_748244 - BLOCK
      ?auto_748245 - BLOCK
      ?auto_748246 - BLOCK
      ?auto_748247 - BLOCK
      ?auto_748248 - BLOCK
      ?auto_748249 - BLOCK
      ?auto_748250 - BLOCK
      ?auto_748251 - BLOCK
      ?auto_748252 - BLOCK
      ?auto_748253 - BLOCK
      ?auto_748254 - BLOCK
      ?auto_748255 - BLOCK
      ?auto_748256 - BLOCK
    )
    :vars
    (
      ?auto_748257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748256 ?auto_748257 ) ( ON-TABLE ?auto_748239 ) ( ON ?auto_748240 ?auto_748239 ) ( not ( = ?auto_748239 ?auto_748240 ) ) ( not ( = ?auto_748239 ?auto_748241 ) ) ( not ( = ?auto_748239 ?auto_748242 ) ) ( not ( = ?auto_748239 ?auto_748243 ) ) ( not ( = ?auto_748239 ?auto_748244 ) ) ( not ( = ?auto_748239 ?auto_748245 ) ) ( not ( = ?auto_748239 ?auto_748246 ) ) ( not ( = ?auto_748239 ?auto_748247 ) ) ( not ( = ?auto_748239 ?auto_748248 ) ) ( not ( = ?auto_748239 ?auto_748249 ) ) ( not ( = ?auto_748239 ?auto_748250 ) ) ( not ( = ?auto_748239 ?auto_748251 ) ) ( not ( = ?auto_748239 ?auto_748252 ) ) ( not ( = ?auto_748239 ?auto_748253 ) ) ( not ( = ?auto_748239 ?auto_748254 ) ) ( not ( = ?auto_748239 ?auto_748255 ) ) ( not ( = ?auto_748239 ?auto_748256 ) ) ( not ( = ?auto_748239 ?auto_748257 ) ) ( not ( = ?auto_748240 ?auto_748241 ) ) ( not ( = ?auto_748240 ?auto_748242 ) ) ( not ( = ?auto_748240 ?auto_748243 ) ) ( not ( = ?auto_748240 ?auto_748244 ) ) ( not ( = ?auto_748240 ?auto_748245 ) ) ( not ( = ?auto_748240 ?auto_748246 ) ) ( not ( = ?auto_748240 ?auto_748247 ) ) ( not ( = ?auto_748240 ?auto_748248 ) ) ( not ( = ?auto_748240 ?auto_748249 ) ) ( not ( = ?auto_748240 ?auto_748250 ) ) ( not ( = ?auto_748240 ?auto_748251 ) ) ( not ( = ?auto_748240 ?auto_748252 ) ) ( not ( = ?auto_748240 ?auto_748253 ) ) ( not ( = ?auto_748240 ?auto_748254 ) ) ( not ( = ?auto_748240 ?auto_748255 ) ) ( not ( = ?auto_748240 ?auto_748256 ) ) ( not ( = ?auto_748240 ?auto_748257 ) ) ( not ( = ?auto_748241 ?auto_748242 ) ) ( not ( = ?auto_748241 ?auto_748243 ) ) ( not ( = ?auto_748241 ?auto_748244 ) ) ( not ( = ?auto_748241 ?auto_748245 ) ) ( not ( = ?auto_748241 ?auto_748246 ) ) ( not ( = ?auto_748241 ?auto_748247 ) ) ( not ( = ?auto_748241 ?auto_748248 ) ) ( not ( = ?auto_748241 ?auto_748249 ) ) ( not ( = ?auto_748241 ?auto_748250 ) ) ( not ( = ?auto_748241 ?auto_748251 ) ) ( not ( = ?auto_748241 ?auto_748252 ) ) ( not ( = ?auto_748241 ?auto_748253 ) ) ( not ( = ?auto_748241 ?auto_748254 ) ) ( not ( = ?auto_748241 ?auto_748255 ) ) ( not ( = ?auto_748241 ?auto_748256 ) ) ( not ( = ?auto_748241 ?auto_748257 ) ) ( not ( = ?auto_748242 ?auto_748243 ) ) ( not ( = ?auto_748242 ?auto_748244 ) ) ( not ( = ?auto_748242 ?auto_748245 ) ) ( not ( = ?auto_748242 ?auto_748246 ) ) ( not ( = ?auto_748242 ?auto_748247 ) ) ( not ( = ?auto_748242 ?auto_748248 ) ) ( not ( = ?auto_748242 ?auto_748249 ) ) ( not ( = ?auto_748242 ?auto_748250 ) ) ( not ( = ?auto_748242 ?auto_748251 ) ) ( not ( = ?auto_748242 ?auto_748252 ) ) ( not ( = ?auto_748242 ?auto_748253 ) ) ( not ( = ?auto_748242 ?auto_748254 ) ) ( not ( = ?auto_748242 ?auto_748255 ) ) ( not ( = ?auto_748242 ?auto_748256 ) ) ( not ( = ?auto_748242 ?auto_748257 ) ) ( not ( = ?auto_748243 ?auto_748244 ) ) ( not ( = ?auto_748243 ?auto_748245 ) ) ( not ( = ?auto_748243 ?auto_748246 ) ) ( not ( = ?auto_748243 ?auto_748247 ) ) ( not ( = ?auto_748243 ?auto_748248 ) ) ( not ( = ?auto_748243 ?auto_748249 ) ) ( not ( = ?auto_748243 ?auto_748250 ) ) ( not ( = ?auto_748243 ?auto_748251 ) ) ( not ( = ?auto_748243 ?auto_748252 ) ) ( not ( = ?auto_748243 ?auto_748253 ) ) ( not ( = ?auto_748243 ?auto_748254 ) ) ( not ( = ?auto_748243 ?auto_748255 ) ) ( not ( = ?auto_748243 ?auto_748256 ) ) ( not ( = ?auto_748243 ?auto_748257 ) ) ( not ( = ?auto_748244 ?auto_748245 ) ) ( not ( = ?auto_748244 ?auto_748246 ) ) ( not ( = ?auto_748244 ?auto_748247 ) ) ( not ( = ?auto_748244 ?auto_748248 ) ) ( not ( = ?auto_748244 ?auto_748249 ) ) ( not ( = ?auto_748244 ?auto_748250 ) ) ( not ( = ?auto_748244 ?auto_748251 ) ) ( not ( = ?auto_748244 ?auto_748252 ) ) ( not ( = ?auto_748244 ?auto_748253 ) ) ( not ( = ?auto_748244 ?auto_748254 ) ) ( not ( = ?auto_748244 ?auto_748255 ) ) ( not ( = ?auto_748244 ?auto_748256 ) ) ( not ( = ?auto_748244 ?auto_748257 ) ) ( not ( = ?auto_748245 ?auto_748246 ) ) ( not ( = ?auto_748245 ?auto_748247 ) ) ( not ( = ?auto_748245 ?auto_748248 ) ) ( not ( = ?auto_748245 ?auto_748249 ) ) ( not ( = ?auto_748245 ?auto_748250 ) ) ( not ( = ?auto_748245 ?auto_748251 ) ) ( not ( = ?auto_748245 ?auto_748252 ) ) ( not ( = ?auto_748245 ?auto_748253 ) ) ( not ( = ?auto_748245 ?auto_748254 ) ) ( not ( = ?auto_748245 ?auto_748255 ) ) ( not ( = ?auto_748245 ?auto_748256 ) ) ( not ( = ?auto_748245 ?auto_748257 ) ) ( not ( = ?auto_748246 ?auto_748247 ) ) ( not ( = ?auto_748246 ?auto_748248 ) ) ( not ( = ?auto_748246 ?auto_748249 ) ) ( not ( = ?auto_748246 ?auto_748250 ) ) ( not ( = ?auto_748246 ?auto_748251 ) ) ( not ( = ?auto_748246 ?auto_748252 ) ) ( not ( = ?auto_748246 ?auto_748253 ) ) ( not ( = ?auto_748246 ?auto_748254 ) ) ( not ( = ?auto_748246 ?auto_748255 ) ) ( not ( = ?auto_748246 ?auto_748256 ) ) ( not ( = ?auto_748246 ?auto_748257 ) ) ( not ( = ?auto_748247 ?auto_748248 ) ) ( not ( = ?auto_748247 ?auto_748249 ) ) ( not ( = ?auto_748247 ?auto_748250 ) ) ( not ( = ?auto_748247 ?auto_748251 ) ) ( not ( = ?auto_748247 ?auto_748252 ) ) ( not ( = ?auto_748247 ?auto_748253 ) ) ( not ( = ?auto_748247 ?auto_748254 ) ) ( not ( = ?auto_748247 ?auto_748255 ) ) ( not ( = ?auto_748247 ?auto_748256 ) ) ( not ( = ?auto_748247 ?auto_748257 ) ) ( not ( = ?auto_748248 ?auto_748249 ) ) ( not ( = ?auto_748248 ?auto_748250 ) ) ( not ( = ?auto_748248 ?auto_748251 ) ) ( not ( = ?auto_748248 ?auto_748252 ) ) ( not ( = ?auto_748248 ?auto_748253 ) ) ( not ( = ?auto_748248 ?auto_748254 ) ) ( not ( = ?auto_748248 ?auto_748255 ) ) ( not ( = ?auto_748248 ?auto_748256 ) ) ( not ( = ?auto_748248 ?auto_748257 ) ) ( not ( = ?auto_748249 ?auto_748250 ) ) ( not ( = ?auto_748249 ?auto_748251 ) ) ( not ( = ?auto_748249 ?auto_748252 ) ) ( not ( = ?auto_748249 ?auto_748253 ) ) ( not ( = ?auto_748249 ?auto_748254 ) ) ( not ( = ?auto_748249 ?auto_748255 ) ) ( not ( = ?auto_748249 ?auto_748256 ) ) ( not ( = ?auto_748249 ?auto_748257 ) ) ( not ( = ?auto_748250 ?auto_748251 ) ) ( not ( = ?auto_748250 ?auto_748252 ) ) ( not ( = ?auto_748250 ?auto_748253 ) ) ( not ( = ?auto_748250 ?auto_748254 ) ) ( not ( = ?auto_748250 ?auto_748255 ) ) ( not ( = ?auto_748250 ?auto_748256 ) ) ( not ( = ?auto_748250 ?auto_748257 ) ) ( not ( = ?auto_748251 ?auto_748252 ) ) ( not ( = ?auto_748251 ?auto_748253 ) ) ( not ( = ?auto_748251 ?auto_748254 ) ) ( not ( = ?auto_748251 ?auto_748255 ) ) ( not ( = ?auto_748251 ?auto_748256 ) ) ( not ( = ?auto_748251 ?auto_748257 ) ) ( not ( = ?auto_748252 ?auto_748253 ) ) ( not ( = ?auto_748252 ?auto_748254 ) ) ( not ( = ?auto_748252 ?auto_748255 ) ) ( not ( = ?auto_748252 ?auto_748256 ) ) ( not ( = ?auto_748252 ?auto_748257 ) ) ( not ( = ?auto_748253 ?auto_748254 ) ) ( not ( = ?auto_748253 ?auto_748255 ) ) ( not ( = ?auto_748253 ?auto_748256 ) ) ( not ( = ?auto_748253 ?auto_748257 ) ) ( not ( = ?auto_748254 ?auto_748255 ) ) ( not ( = ?auto_748254 ?auto_748256 ) ) ( not ( = ?auto_748254 ?auto_748257 ) ) ( not ( = ?auto_748255 ?auto_748256 ) ) ( not ( = ?auto_748255 ?auto_748257 ) ) ( not ( = ?auto_748256 ?auto_748257 ) ) ( ON ?auto_748255 ?auto_748256 ) ( ON ?auto_748254 ?auto_748255 ) ( ON ?auto_748253 ?auto_748254 ) ( ON ?auto_748252 ?auto_748253 ) ( ON ?auto_748251 ?auto_748252 ) ( ON ?auto_748250 ?auto_748251 ) ( ON ?auto_748249 ?auto_748250 ) ( ON ?auto_748248 ?auto_748249 ) ( ON ?auto_748247 ?auto_748248 ) ( ON ?auto_748246 ?auto_748247 ) ( ON ?auto_748245 ?auto_748246 ) ( ON ?auto_748244 ?auto_748245 ) ( ON ?auto_748243 ?auto_748244 ) ( ON ?auto_748242 ?auto_748243 ) ( CLEAR ?auto_748240 ) ( ON ?auto_748241 ?auto_748242 ) ( CLEAR ?auto_748241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_748239 ?auto_748240 ?auto_748241 )
      ( MAKE-18PILE ?auto_748239 ?auto_748240 ?auto_748241 ?auto_748242 ?auto_748243 ?auto_748244 ?auto_748245 ?auto_748246 ?auto_748247 ?auto_748248 ?auto_748249 ?auto_748250 ?auto_748251 ?auto_748252 ?auto_748253 ?auto_748254 ?auto_748255 ?auto_748256 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748276 - BLOCK
      ?auto_748277 - BLOCK
      ?auto_748278 - BLOCK
      ?auto_748279 - BLOCK
      ?auto_748280 - BLOCK
      ?auto_748281 - BLOCK
      ?auto_748282 - BLOCK
      ?auto_748283 - BLOCK
      ?auto_748284 - BLOCK
      ?auto_748285 - BLOCK
      ?auto_748286 - BLOCK
      ?auto_748287 - BLOCK
      ?auto_748288 - BLOCK
      ?auto_748289 - BLOCK
      ?auto_748290 - BLOCK
      ?auto_748291 - BLOCK
      ?auto_748292 - BLOCK
      ?auto_748293 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_748293 ) ( ON-TABLE ?auto_748276 ) ( ON ?auto_748277 ?auto_748276 ) ( not ( = ?auto_748276 ?auto_748277 ) ) ( not ( = ?auto_748276 ?auto_748278 ) ) ( not ( = ?auto_748276 ?auto_748279 ) ) ( not ( = ?auto_748276 ?auto_748280 ) ) ( not ( = ?auto_748276 ?auto_748281 ) ) ( not ( = ?auto_748276 ?auto_748282 ) ) ( not ( = ?auto_748276 ?auto_748283 ) ) ( not ( = ?auto_748276 ?auto_748284 ) ) ( not ( = ?auto_748276 ?auto_748285 ) ) ( not ( = ?auto_748276 ?auto_748286 ) ) ( not ( = ?auto_748276 ?auto_748287 ) ) ( not ( = ?auto_748276 ?auto_748288 ) ) ( not ( = ?auto_748276 ?auto_748289 ) ) ( not ( = ?auto_748276 ?auto_748290 ) ) ( not ( = ?auto_748276 ?auto_748291 ) ) ( not ( = ?auto_748276 ?auto_748292 ) ) ( not ( = ?auto_748276 ?auto_748293 ) ) ( not ( = ?auto_748277 ?auto_748278 ) ) ( not ( = ?auto_748277 ?auto_748279 ) ) ( not ( = ?auto_748277 ?auto_748280 ) ) ( not ( = ?auto_748277 ?auto_748281 ) ) ( not ( = ?auto_748277 ?auto_748282 ) ) ( not ( = ?auto_748277 ?auto_748283 ) ) ( not ( = ?auto_748277 ?auto_748284 ) ) ( not ( = ?auto_748277 ?auto_748285 ) ) ( not ( = ?auto_748277 ?auto_748286 ) ) ( not ( = ?auto_748277 ?auto_748287 ) ) ( not ( = ?auto_748277 ?auto_748288 ) ) ( not ( = ?auto_748277 ?auto_748289 ) ) ( not ( = ?auto_748277 ?auto_748290 ) ) ( not ( = ?auto_748277 ?auto_748291 ) ) ( not ( = ?auto_748277 ?auto_748292 ) ) ( not ( = ?auto_748277 ?auto_748293 ) ) ( not ( = ?auto_748278 ?auto_748279 ) ) ( not ( = ?auto_748278 ?auto_748280 ) ) ( not ( = ?auto_748278 ?auto_748281 ) ) ( not ( = ?auto_748278 ?auto_748282 ) ) ( not ( = ?auto_748278 ?auto_748283 ) ) ( not ( = ?auto_748278 ?auto_748284 ) ) ( not ( = ?auto_748278 ?auto_748285 ) ) ( not ( = ?auto_748278 ?auto_748286 ) ) ( not ( = ?auto_748278 ?auto_748287 ) ) ( not ( = ?auto_748278 ?auto_748288 ) ) ( not ( = ?auto_748278 ?auto_748289 ) ) ( not ( = ?auto_748278 ?auto_748290 ) ) ( not ( = ?auto_748278 ?auto_748291 ) ) ( not ( = ?auto_748278 ?auto_748292 ) ) ( not ( = ?auto_748278 ?auto_748293 ) ) ( not ( = ?auto_748279 ?auto_748280 ) ) ( not ( = ?auto_748279 ?auto_748281 ) ) ( not ( = ?auto_748279 ?auto_748282 ) ) ( not ( = ?auto_748279 ?auto_748283 ) ) ( not ( = ?auto_748279 ?auto_748284 ) ) ( not ( = ?auto_748279 ?auto_748285 ) ) ( not ( = ?auto_748279 ?auto_748286 ) ) ( not ( = ?auto_748279 ?auto_748287 ) ) ( not ( = ?auto_748279 ?auto_748288 ) ) ( not ( = ?auto_748279 ?auto_748289 ) ) ( not ( = ?auto_748279 ?auto_748290 ) ) ( not ( = ?auto_748279 ?auto_748291 ) ) ( not ( = ?auto_748279 ?auto_748292 ) ) ( not ( = ?auto_748279 ?auto_748293 ) ) ( not ( = ?auto_748280 ?auto_748281 ) ) ( not ( = ?auto_748280 ?auto_748282 ) ) ( not ( = ?auto_748280 ?auto_748283 ) ) ( not ( = ?auto_748280 ?auto_748284 ) ) ( not ( = ?auto_748280 ?auto_748285 ) ) ( not ( = ?auto_748280 ?auto_748286 ) ) ( not ( = ?auto_748280 ?auto_748287 ) ) ( not ( = ?auto_748280 ?auto_748288 ) ) ( not ( = ?auto_748280 ?auto_748289 ) ) ( not ( = ?auto_748280 ?auto_748290 ) ) ( not ( = ?auto_748280 ?auto_748291 ) ) ( not ( = ?auto_748280 ?auto_748292 ) ) ( not ( = ?auto_748280 ?auto_748293 ) ) ( not ( = ?auto_748281 ?auto_748282 ) ) ( not ( = ?auto_748281 ?auto_748283 ) ) ( not ( = ?auto_748281 ?auto_748284 ) ) ( not ( = ?auto_748281 ?auto_748285 ) ) ( not ( = ?auto_748281 ?auto_748286 ) ) ( not ( = ?auto_748281 ?auto_748287 ) ) ( not ( = ?auto_748281 ?auto_748288 ) ) ( not ( = ?auto_748281 ?auto_748289 ) ) ( not ( = ?auto_748281 ?auto_748290 ) ) ( not ( = ?auto_748281 ?auto_748291 ) ) ( not ( = ?auto_748281 ?auto_748292 ) ) ( not ( = ?auto_748281 ?auto_748293 ) ) ( not ( = ?auto_748282 ?auto_748283 ) ) ( not ( = ?auto_748282 ?auto_748284 ) ) ( not ( = ?auto_748282 ?auto_748285 ) ) ( not ( = ?auto_748282 ?auto_748286 ) ) ( not ( = ?auto_748282 ?auto_748287 ) ) ( not ( = ?auto_748282 ?auto_748288 ) ) ( not ( = ?auto_748282 ?auto_748289 ) ) ( not ( = ?auto_748282 ?auto_748290 ) ) ( not ( = ?auto_748282 ?auto_748291 ) ) ( not ( = ?auto_748282 ?auto_748292 ) ) ( not ( = ?auto_748282 ?auto_748293 ) ) ( not ( = ?auto_748283 ?auto_748284 ) ) ( not ( = ?auto_748283 ?auto_748285 ) ) ( not ( = ?auto_748283 ?auto_748286 ) ) ( not ( = ?auto_748283 ?auto_748287 ) ) ( not ( = ?auto_748283 ?auto_748288 ) ) ( not ( = ?auto_748283 ?auto_748289 ) ) ( not ( = ?auto_748283 ?auto_748290 ) ) ( not ( = ?auto_748283 ?auto_748291 ) ) ( not ( = ?auto_748283 ?auto_748292 ) ) ( not ( = ?auto_748283 ?auto_748293 ) ) ( not ( = ?auto_748284 ?auto_748285 ) ) ( not ( = ?auto_748284 ?auto_748286 ) ) ( not ( = ?auto_748284 ?auto_748287 ) ) ( not ( = ?auto_748284 ?auto_748288 ) ) ( not ( = ?auto_748284 ?auto_748289 ) ) ( not ( = ?auto_748284 ?auto_748290 ) ) ( not ( = ?auto_748284 ?auto_748291 ) ) ( not ( = ?auto_748284 ?auto_748292 ) ) ( not ( = ?auto_748284 ?auto_748293 ) ) ( not ( = ?auto_748285 ?auto_748286 ) ) ( not ( = ?auto_748285 ?auto_748287 ) ) ( not ( = ?auto_748285 ?auto_748288 ) ) ( not ( = ?auto_748285 ?auto_748289 ) ) ( not ( = ?auto_748285 ?auto_748290 ) ) ( not ( = ?auto_748285 ?auto_748291 ) ) ( not ( = ?auto_748285 ?auto_748292 ) ) ( not ( = ?auto_748285 ?auto_748293 ) ) ( not ( = ?auto_748286 ?auto_748287 ) ) ( not ( = ?auto_748286 ?auto_748288 ) ) ( not ( = ?auto_748286 ?auto_748289 ) ) ( not ( = ?auto_748286 ?auto_748290 ) ) ( not ( = ?auto_748286 ?auto_748291 ) ) ( not ( = ?auto_748286 ?auto_748292 ) ) ( not ( = ?auto_748286 ?auto_748293 ) ) ( not ( = ?auto_748287 ?auto_748288 ) ) ( not ( = ?auto_748287 ?auto_748289 ) ) ( not ( = ?auto_748287 ?auto_748290 ) ) ( not ( = ?auto_748287 ?auto_748291 ) ) ( not ( = ?auto_748287 ?auto_748292 ) ) ( not ( = ?auto_748287 ?auto_748293 ) ) ( not ( = ?auto_748288 ?auto_748289 ) ) ( not ( = ?auto_748288 ?auto_748290 ) ) ( not ( = ?auto_748288 ?auto_748291 ) ) ( not ( = ?auto_748288 ?auto_748292 ) ) ( not ( = ?auto_748288 ?auto_748293 ) ) ( not ( = ?auto_748289 ?auto_748290 ) ) ( not ( = ?auto_748289 ?auto_748291 ) ) ( not ( = ?auto_748289 ?auto_748292 ) ) ( not ( = ?auto_748289 ?auto_748293 ) ) ( not ( = ?auto_748290 ?auto_748291 ) ) ( not ( = ?auto_748290 ?auto_748292 ) ) ( not ( = ?auto_748290 ?auto_748293 ) ) ( not ( = ?auto_748291 ?auto_748292 ) ) ( not ( = ?auto_748291 ?auto_748293 ) ) ( not ( = ?auto_748292 ?auto_748293 ) ) ( ON ?auto_748292 ?auto_748293 ) ( ON ?auto_748291 ?auto_748292 ) ( ON ?auto_748290 ?auto_748291 ) ( ON ?auto_748289 ?auto_748290 ) ( ON ?auto_748288 ?auto_748289 ) ( ON ?auto_748287 ?auto_748288 ) ( ON ?auto_748286 ?auto_748287 ) ( ON ?auto_748285 ?auto_748286 ) ( ON ?auto_748284 ?auto_748285 ) ( ON ?auto_748283 ?auto_748284 ) ( ON ?auto_748282 ?auto_748283 ) ( ON ?auto_748281 ?auto_748282 ) ( ON ?auto_748280 ?auto_748281 ) ( ON ?auto_748279 ?auto_748280 ) ( CLEAR ?auto_748277 ) ( ON ?auto_748278 ?auto_748279 ) ( CLEAR ?auto_748278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_748276 ?auto_748277 ?auto_748278 )
      ( MAKE-18PILE ?auto_748276 ?auto_748277 ?auto_748278 ?auto_748279 ?auto_748280 ?auto_748281 ?auto_748282 ?auto_748283 ?auto_748284 ?auto_748285 ?auto_748286 ?auto_748287 ?auto_748288 ?auto_748289 ?auto_748290 ?auto_748291 ?auto_748292 ?auto_748293 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748312 - BLOCK
      ?auto_748313 - BLOCK
      ?auto_748314 - BLOCK
      ?auto_748315 - BLOCK
      ?auto_748316 - BLOCK
      ?auto_748317 - BLOCK
      ?auto_748318 - BLOCK
      ?auto_748319 - BLOCK
      ?auto_748320 - BLOCK
      ?auto_748321 - BLOCK
      ?auto_748322 - BLOCK
      ?auto_748323 - BLOCK
      ?auto_748324 - BLOCK
      ?auto_748325 - BLOCK
      ?auto_748326 - BLOCK
      ?auto_748327 - BLOCK
      ?auto_748328 - BLOCK
      ?auto_748329 - BLOCK
    )
    :vars
    (
      ?auto_748330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748329 ?auto_748330 ) ( ON-TABLE ?auto_748312 ) ( not ( = ?auto_748312 ?auto_748313 ) ) ( not ( = ?auto_748312 ?auto_748314 ) ) ( not ( = ?auto_748312 ?auto_748315 ) ) ( not ( = ?auto_748312 ?auto_748316 ) ) ( not ( = ?auto_748312 ?auto_748317 ) ) ( not ( = ?auto_748312 ?auto_748318 ) ) ( not ( = ?auto_748312 ?auto_748319 ) ) ( not ( = ?auto_748312 ?auto_748320 ) ) ( not ( = ?auto_748312 ?auto_748321 ) ) ( not ( = ?auto_748312 ?auto_748322 ) ) ( not ( = ?auto_748312 ?auto_748323 ) ) ( not ( = ?auto_748312 ?auto_748324 ) ) ( not ( = ?auto_748312 ?auto_748325 ) ) ( not ( = ?auto_748312 ?auto_748326 ) ) ( not ( = ?auto_748312 ?auto_748327 ) ) ( not ( = ?auto_748312 ?auto_748328 ) ) ( not ( = ?auto_748312 ?auto_748329 ) ) ( not ( = ?auto_748312 ?auto_748330 ) ) ( not ( = ?auto_748313 ?auto_748314 ) ) ( not ( = ?auto_748313 ?auto_748315 ) ) ( not ( = ?auto_748313 ?auto_748316 ) ) ( not ( = ?auto_748313 ?auto_748317 ) ) ( not ( = ?auto_748313 ?auto_748318 ) ) ( not ( = ?auto_748313 ?auto_748319 ) ) ( not ( = ?auto_748313 ?auto_748320 ) ) ( not ( = ?auto_748313 ?auto_748321 ) ) ( not ( = ?auto_748313 ?auto_748322 ) ) ( not ( = ?auto_748313 ?auto_748323 ) ) ( not ( = ?auto_748313 ?auto_748324 ) ) ( not ( = ?auto_748313 ?auto_748325 ) ) ( not ( = ?auto_748313 ?auto_748326 ) ) ( not ( = ?auto_748313 ?auto_748327 ) ) ( not ( = ?auto_748313 ?auto_748328 ) ) ( not ( = ?auto_748313 ?auto_748329 ) ) ( not ( = ?auto_748313 ?auto_748330 ) ) ( not ( = ?auto_748314 ?auto_748315 ) ) ( not ( = ?auto_748314 ?auto_748316 ) ) ( not ( = ?auto_748314 ?auto_748317 ) ) ( not ( = ?auto_748314 ?auto_748318 ) ) ( not ( = ?auto_748314 ?auto_748319 ) ) ( not ( = ?auto_748314 ?auto_748320 ) ) ( not ( = ?auto_748314 ?auto_748321 ) ) ( not ( = ?auto_748314 ?auto_748322 ) ) ( not ( = ?auto_748314 ?auto_748323 ) ) ( not ( = ?auto_748314 ?auto_748324 ) ) ( not ( = ?auto_748314 ?auto_748325 ) ) ( not ( = ?auto_748314 ?auto_748326 ) ) ( not ( = ?auto_748314 ?auto_748327 ) ) ( not ( = ?auto_748314 ?auto_748328 ) ) ( not ( = ?auto_748314 ?auto_748329 ) ) ( not ( = ?auto_748314 ?auto_748330 ) ) ( not ( = ?auto_748315 ?auto_748316 ) ) ( not ( = ?auto_748315 ?auto_748317 ) ) ( not ( = ?auto_748315 ?auto_748318 ) ) ( not ( = ?auto_748315 ?auto_748319 ) ) ( not ( = ?auto_748315 ?auto_748320 ) ) ( not ( = ?auto_748315 ?auto_748321 ) ) ( not ( = ?auto_748315 ?auto_748322 ) ) ( not ( = ?auto_748315 ?auto_748323 ) ) ( not ( = ?auto_748315 ?auto_748324 ) ) ( not ( = ?auto_748315 ?auto_748325 ) ) ( not ( = ?auto_748315 ?auto_748326 ) ) ( not ( = ?auto_748315 ?auto_748327 ) ) ( not ( = ?auto_748315 ?auto_748328 ) ) ( not ( = ?auto_748315 ?auto_748329 ) ) ( not ( = ?auto_748315 ?auto_748330 ) ) ( not ( = ?auto_748316 ?auto_748317 ) ) ( not ( = ?auto_748316 ?auto_748318 ) ) ( not ( = ?auto_748316 ?auto_748319 ) ) ( not ( = ?auto_748316 ?auto_748320 ) ) ( not ( = ?auto_748316 ?auto_748321 ) ) ( not ( = ?auto_748316 ?auto_748322 ) ) ( not ( = ?auto_748316 ?auto_748323 ) ) ( not ( = ?auto_748316 ?auto_748324 ) ) ( not ( = ?auto_748316 ?auto_748325 ) ) ( not ( = ?auto_748316 ?auto_748326 ) ) ( not ( = ?auto_748316 ?auto_748327 ) ) ( not ( = ?auto_748316 ?auto_748328 ) ) ( not ( = ?auto_748316 ?auto_748329 ) ) ( not ( = ?auto_748316 ?auto_748330 ) ) ( not ( = ?auto_748317 ?auto_748318 ) ) ( not ( = ?auto_748317 ?auto_748319 ) ) ( not ( = ?auto_748317 ?auto_748320 ) ) ( not ( = ?auto_748317 ?auto_748321 ) ) ( not ( = ?auto_748317 ?auto_748322 ) ) ( not ( = ?auto_748317 ?auto_748323 ) ) ( not ( = ?auto_748317 ?auto_748324 ) ) ( not ( = ?auto_748317 ?auto_748325 ) ) ( not ( = ?auto_748317 ?auto_748326 ) ) ( not ( = ?auto_748317 ?auto_748327 ) ) ( not ( = ?auto_748317 ?auto_748328 ) ) ( not ( = ?auto_748317 ?auto_748329 ) ) ( not ( = ?auto_748317 ?auto_748330 ) ) ( not ( = ?auto_748318 ?auto_748319 ) ) ( not ( = ?auto_748318 ?auto_748320 ) ) ( not ( = ?auto_748318 ?auto_748321 ) ) ( not ( = ?auto_748318 ?auto_748322 ) ) ( not ( = ?auto_748318 ?auto_748323 ) ) ( not ( = ?auto_748318 ?auto_748324 ) ) ( not ( = ?auto_748318 ?auto_748325 ) ) ( not ( = ?auto_748318 ?auto_748326 ) ) ( not ( = ?auto_748318 ?auto_748327 ) ) ( not ( = ?auto_748318 ?auto_748328 ) ) ( not ( = ?auto_748318 ?auto_748329 ) ) ( not ( = ?auto_748318 ?auto_748330 ) ) ( not ( = ?auto_748319 ?auto_748320 ) ) ( not ( = ?auto_748319 ?auto_748321 ) ) ( not ( = ?auto_748319 ?auto_748322 ) ) ( not ( = ?auto_748319 ?auto_748323 ) ) ( not ( = ?auto_748319 ?auto_748324 ) ) ( not ( = ?auto_748319 ?auto_748325 ) ) ( not ( = ?auto_748319 ?auto_748326 ) ) ( not ( = ?auto_748319 ?auto_748327 ) ) ( not ( = ?auto_748319 ?auto_748328 ) ) ( not ( = ?auto_748319 ?auto_748329 ) ) ( not ( = ?auto_748319 ?auto_748330 ) ) ( not ( = ?auto_748320 ?auto_748321 ) ) ( not ( = ?auto_748320 ?auto_748322 ) ) ( not ( = ?auto_748320 ?auto_748323 ) ) ( not ( = ?auto_748320 ?auto_748324 ) ) ( not ( = ?auto_748320 ?auto_748325 ) ) ( not ( = ?auto_748320 ?auto_748326 ) ) ( not ( = ?auto_748320 ?auto_748327 ) ) ( not ( = ?auto_748320 ?auto_748328 ) ) ( not ( = ?auto_748320 ?auto_748329 ) ) ( not ( = ?auto_748320 ?auto_748330 ) ) ( not ( = ?auto_748321 ?auto_748322 ) ) ( not ( = ?auto_748321 ?auto_748323 ) ) ( not ( = ?auto_748321 ?auto_748324 ) ) ( not ( = ?auto_748321 ?auto_748325 ) ) ( not ( = ?auto_748321 ?auto_748326 ) ) ( not ( = ?auto_748321 ?auto_748327 ) ) ( not ( = ?auto_748321 ?auto_748328 ) ) ( not ( = ?auto_748321 ?auto_748329 ) ) ( not ( = ?auto_748321 ?auto_748330 ) ) ( not ( = ?auto_748322 ?auto_748323 ) ) ( not ( = ?auto_748322 ?auto_748324 ) ) ( not ( = ?auto_748322 ?auto_748325 ) ) ( not ( = ?auto_748322 ?auto_748326 ) ) ( not ( = ?auto_748322 ?auto_748327 ) ) ( not ( = ?auto_748322 ?auto_748328 ) ) ( not ( = ?auto_748322 ?auto_748329 ) ) ( not ( = ?auto_748322 ?auto_748330 ) ) ( not ( = ?auto_748323 ?auto_748324 ) ) ( not ( = ?auto_748323 ?auto_748325 ) ) ( not ( = ?auto_748323 ?auto_748326 ) ) ( not ( = ?auto_748323 ?auto_748327 ) ) ( not ( = ?auto_748323 ?auto_748328 ) ) ( not ( = ?auto_748323 ?auto_748329 ) ) ( not ( = ?auto_748323 ?auto_748330 ) ) ( not ( = ?auto_748324 ?auto_748325 ) ) ( not ( = ?auto_748324 ?auto_748326 ) ) ( not ( = ?auto_748324 ?auto_748327 ) ) ( not ( = ?auto_748324 ?auto_748328 ) ) ( not ( = ?auto_748324 ?auto_748329 ) ) ( not ( = ?auto_748324 ?auto_748330 ) ) ( not ( = ?auto_748325 ?auto_748326 ) ) ( not ( = ?auto_748325 ?auto_748327 ) ) ( not ( = ?auto_748325 ?auto_748328 ) ) ( not ( = ?auto_748325 ?auto_748329 ) ) ( not ( = ?auto_748325 ?auto_748330 ) ) ( not ( = ?auto_748326 ?auto_748327 ) ) ( not ( = ?auto_748326 ?auto_748328 ) ) ( not ( = ?auto_748326 ?auto_748329 ) ) ( not ( = ?auto_748326 ?auto_748330 ) ) ( not ( = ?auto_748327 ?auto_748328 ) ) ( not ( = ?auto_748327 ?auto_748329 ) ) ( not ( = ?auto_748327 ?auto_748330 ) ) ( not ( = ?auto_748328 ?auto_748329 ) ) ( not ( = ?auto_748328 ?auto_748330 ) ) ( not ( = ?auto_748329 ?auto_748330 ) ) ( ON ?auto_748328 ?auto_748329 ) ( ON ?auto_748327 ?auto_748328 ) ( ON ?auto_748326 ?auto_748327 ) ( ON ?auto_748325 ?auto_748326 ) ( ON ?auto_748324 ?auto_748325 ) ( ON ?auto_748323 ?auto_748324 ) ( ON ?auto_748322 ?auto_748323 ) ( ON ?auto_748321 ?auto_748322 ) ( ON ?auto_748320 ?auto_748321 ) ( ON ?auto_748319 ?auto_748320 ) ( ON ?auto_748318 ?auto_748319 ) ( ON ?auto_748317 ?auto_748318 ) ( ON ?auto_748316 ?auto_748317 ) ( ON ?auto_748315 ?auto_748316 ) ( ON ?auto_748314 ?auto_748315 ) ( CLEAR ?auto_748312 ) ( ON ?auto_748313 ?auto_748314 ) ( CLEAR ?auto_748313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_748312 ?auto_748313 )
      ( MAKE-18PILE ?auto_748312 ?auto_748313 ?auto_748314 ?auto_748315 ?auto_748316 ?auto_748317 ?auto_748318 ?auto_748319 ?auto_748320 ?auto_748321 ?auto_748322 ?auto_748323 ?auto_748324 ?auto_748325 ?auto_748326 ?auto_748327 ?auto_748328 ?auto_748329 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748349 - BLOCK
      ?auto_748350 - BLOCK
      ?auto_748351 - BLOCK
      ?auto_748352 - BLOCK
      ?auto_748353 - BLOCK
      ?auto_748354 - BLOCK
      ?auto_748355 - BLOCK
      ?auto_748356 - BLOCK
      ?auto_748357 - BLOCK
      ?auto_748358 - BLOCK
      ?auto_748359 - BLOCK
      ?auto_748360 - BLOCK
      ?auto_748361 - BLOCK
      ?auto_748362 - BLOCK
      ?auto_748363 - BLOCK
      ?auto_748364 - BLOCK
      ?auto_748365 - BLOCK
      ?auto_748366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_748366 ) ( ON-TABLE ?auto_748349 ) ( not ( = ?auto_748349 ?auto_748350 ) ) ( not ( = ?auto_748349 ?auto_748351 ) ) ( not ( = ?auto_748349 ?auto_748352 ) ) ( not ( = ?auto_748349 ?auto_748353 ) ) ( not ( = ?auto_748349 ?auto_748354 ) ) ( not ( = ?auto_748349 ?auto_748355 ) ) ( not ( = ?auto_748349 ?auto_748356 ) ) ( not ( = ?auto_748349 ?auto_748357 ) ) ( not ( = ?auto_748349 ?auto_748358 ) ) ( not ( = ?auto_748349 ?auto_748359 ) ) ( not ( = ?auto_748349 ?auto_748360 ) ) ( not ( = ?auto_748349 ?auto_748361 ) ) ( not ( = ?auto_748349 ?auto_748362 ) ) ( not ( = ?auto_748349 ?auto_748363 ) ) ( not ( = ?auto_748349 ?auto_748364 ) ) ( not ( = ?auto_748349 ?auto_748365 ) ) ( not ( = ?auto_748349 ?auto_748366 ) ) ( not ( = ?auto_748350 ?auto_748351 ) ) ( not ( = ?auto_748350 ?auto_748352 ) ) ( not ( = ?auto_748350 ?auto_748353 ) ) ( not ( = ?auto_748350 ?auto_748354 ) ) ( not ( = ?auto_748350 ?auto_748355 ) ) ( not ( = ?auto_748350 ?auto_748356 ) ) ( not ( = ?auto_748350 ?auto_748357 ) ) ( not ( = ?auto_748350 ?auto_748358 ) ) ( not ( = ?auto_748350 ?auto_748359 ) ) ( not ( = ?auto_748350 ?auto_748360 ) ) ( not ( = ?auto_748350 ?auto_748361 ) ) ( not ( = ?auto_748350 ?auto_748362 ) ) ( not ( = ?auto_748350 ?auto_748363 ) ) ( not ( = ?auto_748350 ?auto_748364 ) ) ( not ( = ?auto_748350 ?auto_748365 ) ) ( not ( = ?auto_748350 ?auto_748366 ) ) ( not ( = ?auto_748351 ?auto_748352 ) ) ( not ( = ?auto_748351 ?auto_748353 ) ) ( not ( = ?auto_748351 ?auto_748354 ) ) ( not ( = ?auto_748351 ?auto_748355 ) ) ( not ( = ?auto_748351 ?auto_748356 ) ) ( not ( = ?auto_748351 ?auto_748357 ) ) ( not ( = ?auto_748351 ?auto_748358 ) ) ( not ( = ?auto_748351 ?auto_748359 ) ) ( not ( = ?auto_748351 ?auto_748360 ) ) ( not ( = ?auto_748351 ?auto_748361 ) ) ( not ( = ?auto_748351 ?auto_748362 ) ) ( not ( = ?auto_748351 ?auto_748363 ) ) ( not ( = ?auto_748351 ?auto_748364 ) ) ( not ( = ?auto_748351 ?auto_748365 ) ) ( not ( = ?auto_748351 ?auto_748366 ) ) ( not ( = ?auto_748352 ?auto_748353 ) ) ( not ( = ?auto_748352 ?auto_748354 ) ) ( not ( = ?auto_748352 ?auto_748355 ) ) ( not ( = ?auto_748352 ?auto_748356 ) ) ( not ( = ?auto_748352 ?auto_748357 ) ) ( not ( = ?auto_748352 ?auto_748358 ) ) ( not ( = ?auto_748352 ?auto_748359 ) ) ( not ( = ?auto_748352 ?auto_748360 ) ) ( not ( = ?auto_748352 ?auto_748361 ) ) ( not ( = ?auto_748352 ?auto_748362 ) ) ( not ( = ?auto_748352 ?auto_748363 ) ) ( not ( = ?auto_748352 ?auto_748364 ) ) ( not ( = ?auto_748352 ?auto_748365 ) ) ( not ( = ?auto_748352 ?auto_748366 ) ) ( not ( = ?auto_748353 ?auto_748354 ) ) ( not ( = ?auto_748353 ?auto_748355 ) ) ( not ( = ?auto_748353 ?auto_748356 ) ) ( not ( = ?auto_748353 ?auto_748357 ) ) ( not ( = ?auto_748353 ?auto_748358 ) ) ( not ( = ?auto_748353 ?auto_748359 ) ) ( not ( = ?auto_748353 ?auto_748360 ) ) ( not ( = ?auto_748353 ?auto_748361 ) ) ( not ( = ?auto_748353 ?auto_748362 ) ) ( not ( = ?auto_748353 ?auto_748363 ) ) ( not ( = ?auto_748353 ?auto_748364 ) ) ( not ( = ?auto_748353 ?auto_748365 ) ) ( not ( = ?auto_748353 ?auto_748366 ) ) ( not ( = ?auto_748354 ?auto_748355 ) ) ( not ( = ?auto_748354 ?auto_748356 ) ) ( not ( = ?auto_748354 ?auto_748357 ) ) ( not ( = ?auto_748354 ?auto_748358 ) ) ( not ( = ?auto_748354 ?auto_748359 ) ) ( not ( = ?auto_748354 ?auto_748360 ) ) ( not ( = ?auto_748354 ?auto_748361 ) ) ( not ( = ?auto_748354 ?auto_748362 ) ) ( not ( = ?auto_748354 ?auto_748363 ) ) ( not ( = ?auto_748354 ?auto_748364 ) ) ( not ( = ?auto_748354 ?auto_748365 ) ) ( not ( = ?auto_748354 ?auto_748366 ) ) ( not ( = ?auto_748355 ?auto_748356 ) ) ( not ( = ?auto_748355 ?auto_748357 ) ) ( not ( = ?auto_748355 ?auto_748358 ) ) ( not ( = ?auto_748355 ?auto_748359 ) ) ( not ( = ?auto_748355 ?auto_748360 ) ) ( not ( = ?auto_748355 ?auto_748361 ) ) ( not ( = ?auto_748355 ?auto_748362 ) ) ( not ( = ?auto_748355 ?auto_748363 ) ) ( not ( = ?auto_748355 ?auto_748364 ) ) ( not ( = ?auto_748355 ?auto_748365 ) ) ( not ( = ?auto_748355 ?auto_748366 ) ) ( not ( = ?auto_748356 ?auto_748357 ) ) ( not ( = ?auto_748356 ?auto_748358 ) ) ( not ( = ?auto_748356 ?auto_748359 ) ) ( not ( = ?auto_748356 ?auto_748360 ) ) ( not ( = ?auto_748356 ?auto_748361 ) ) ( not ( = ?auto_748356 ?auto_748362 ) ) ( not ( = ?auto_748356 ?auto_748363 ) ) ( not ( = ?auto_748356 ?auto_748364 ) ) ( not ( = ?auto_748356 ?auto_748365 ) ) ( not ( = ?auto_748356 ?auto_748366 ) ) ( not ( = ?auto_748357 ?auto_748358 ) ) ( not ( = ?auto_748357 ?auto_748359 ) ) ( not ( = ?auto_748357 ?auto_748360 ) ) ( not ( = ?auto_748357 ?auto_748361 ) ) ( not ( = ?auto_748357 ?auto_748362 ) ) ( not ( = ?auto_748357 ?auto_748363 ) ) ( not ( = ?auto_748357 ?auto_748364 ) ) ( not ( = ?auto_748357 ?auto_748365 ) ) ( not ( = ?auto_748357 ?auto_748366 ) ) ( not ( = ?auto_748358 ?auto_748359 ) ) ( not ( = ?auto_748358 ?auto_748360 ) ) ( not ( = ?auto_748358 ?auto_748361 ) ) ( not ( = ?auto_748358 ?auto_748362 ) ) ( not ( = ?auto_748358 ?auto_748363 ) ) ( not ( = ?auto_748358 ?auto_748364 ) ) ( not ( = ?auto_748358 ?auto_748365 ) ) ( not ( = ?auto_748358 ?auto_748366 ) ) ( not ( = ?auto_748359 ?auto_748360 ) ) ( not ( = ?auto_748359 ?auto_748361 ) ) ( not ( = ?auto_748359 ?auto_748362 ) ) ( not ( = ?auto_748359 ?auto_748363 ) ) ( not ( = ?auto_748359 ?auto_748364 ) ) ( not ( = ?auto_748359 ?auto_748365 ) ) ( not ( = ?auto_748359 ?auto_748366 ) ) ( not ( = ?auto_748360 ?auto_748361 ) ) ( not ( = ?auto_748360 ?auto_748362 ) ) ( not ( = ?auto_748360 ?auto_748363 ) ) ( not ( = ?auto_748360 ?auto_748364 ) ) ( not ( = ?auto_748360 ?auto_748365 ) ) ( not ( = ?auto_748360 ?auto_748366 ) ) ( not ( = ?auto_748361 ?auto_748362 ) ) ( not ( = ?auto_748361 ?auto_748363 ) ) ( not ( = ?auto_748361 ?auto_748364 ) ) ( not ( = ?auto_748361 ?auto_748365 ) ) ( not ( = ?auto_748361 ?auto_748366 ) ) ( not ( = ?auto_748362 ?auto_748363 ) ) ( not ( = ?auto_748362 ?auto_748364 ) ) ( not ( = ?auto_748362 ?auto_748365 ) ) ( not ( = ?auto_748362 ?auto_748366 ) ) ( not ( = ?auto_748363 ?auto_748364 ) ) ( not ( = ?auto_748363 ?auto_748365 ) ) ( not ( = ?auto_748363 ?auto_748366 ) ) ( not ( = ?auto_748364 ?auto_748365 ) ) ( not ( = ?auto_748364 ?auto_748366 ) ) ( not ( = ?auto_748365 ?auto_748366 ) ) ( ON ?auto_748365 ?auto_748366 ) ( ON ?auto_748364 ?auto_748365 ) ( ON ?auto_748363 ?auto_748364 ) ( ON ?auto_748362 ?auto_748363 ) ( ON ?auto_748361 ?auto_748362 ) ( ON ?auto_748360 ?auto_748361 ) ( ON ?auto_748359 ?auto_748360 ) ( ON ?auto_748358 ?auto_748359 ) ( ON ?auto_748357 ?auto_748358 ) ( ON ?auto_748356 ?auto_748357 ) ( ON ?auto_748355 ?auto_748356 ) ( ON ?auto_748354 ?auto_748355 ) ( ON ?auto_748353 ?auto_748354 ) ( ON ?auto_748352 ?auto_748353 ) ( ON ?auto_748351 ?auto_748352 ) ( CLEAR ?auto_748349 ) ( ON ?auto_748350 ?auto_748351 ) ( CLEAR ?auto_748350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_748349 ?auto_748350 )
      ( MAKE-18PILE ?auto_748349 ?auto_748350 ?auto_748351 ?auto_748352 ?auto_748353 ?auto_748354 ?auto_748355 ?auto_748356 ?auto_748357 ?auto_748358 ?auto_748359 ?auto_748360 ?auto_748361 ?auto_748362 ?auto_748363 ?auto_748364 ?auto_748365 ?auto_748366 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748385 - BLOCK
      ?auto_748386 - BLOCK
      ?auto_748387 - BLOCK
      ?auto_748388 - BLOCK
      ?auto_748389 - BLOCK
      ?auto_748390 - BLOCK
      ?auto_748391 - BLOCK
      ?auto_748392 - BLOCK
      ?auto_748393 - BLOCK
      ?auto_748394 - BLOCK
      ?auto_748395 - BLOCK
      ?auto_748396 - BLOCK
      ?auto_748397 - BLOCK
      ?auto_748398 - BLOCK
      ?auto_748399 - BLOCK
      ?auto_748400 - BLOCK
      ?auto_748401 - BLOCK
      ?auto_748402 - BLOCK
    )
    :vars
    (
      ?auto_748403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748402 ?auto_748403 ) ( not ( = ?auto_748385 ?auto_748386 ) ) ( not ( = ?auto_748385 ?auto_748387 ) ) ( not ( = ?auto_748385 ?auto_748388 ) ) ( not ( = ?auto_748385 ?auto_748389 ) ) ( not ( = ?auto_748385 ?auto_748390 ) ) ( not ( = ?auto_748385 ?auto_748391 ) ) ( not ( = ?auto_748385 ?auto_748392 ) ) ( not ( = ?auto_748385 ?auto_748393 ) ) ( not ( = ?auto_748385 ?auto_748394 ) ) ( not ( = ?auto_748385 ?auto_748395 ) ) ( not ( = ?auto_748385 ?auto_748396 ) ) ( not ( = ?auto_748385 ?auto_748397 ) ) ( not ( = ?auto_748385 ?auto_748398 ) ) ( not ( = ?auto_748385 ?auto_748399 ) ) ( not ( = ?auto_748385 ?auto_748400 ) ) ( not ( = ?auto_748385 ?auto_748401 ) ) ( not ( = ?auto_748385 ?auto_748402 ) ) ( not ( = ?auto_748385 ?auto_748403 ) ) ( not ( = ?auto_748386 ?auto_748387 ) ) ( not ( = ?auto_748386 ?auto_748388 ) ) ( not ( = ?auto_748386 ?auto_748389 ) ) ( not ( = ?auto_748386 ?auto_748390 ) ) ( not ( = ?auto_748386 ?auto_748391 ) ) ( not ( = ?auto_748386 ?auto_748392 ) ) ( not ( = ?auto_748386 ?auto_748393 ) ) ( not ( = ?auto_748386 ?auto_748394 ) ) ( not ( = ?auto_748386 ?auto_748395 ) ) ( not ( = ?auto_748386 ?auto_748396 ) ) ( not ( = ?auto_748386 ?auto_748397 ) ) ( not ( = ?auto_748386 ?auto_748398 ) ) ( not ( = ?auto_748386 ?auto_748399 ) ) ( not ( = ?auto_748386 ?auto_748400 ) ) ( not ( = ?auto_748386 ?auto_748401 ) ) ( not ( = ?auto_748386 ?auto_748402 ) ) ( not ( = ?auto_748386 ?auto_748403 ) ) ( not ( = ?auto_748387 ?auto_748388 ) ) ( not ( = ?auto_748387 ?auto_748389 ) ) ( not ( = ?auto_748387 ?auto_748390 ) ) ( not ( = ?auto_748387 ?auto_748391 ) ) ( not ( = ?auto_748387 ?auto_748392 ) ) ( not ( = ?auto_748387 ?auto_748393 ) ) ( not ( = ?auto_748387 ?auto_748394 ) ) ( not ( = ?auto_748387 ?auto_748395 ) ) ( not ( = ?auto_748387 ?auto_748396 ) ) ( not ( = ?auto_748387 ?auto_748397 ) ) ( not ( = ?auto_748387 ?auto_748398 ) ) ( not ( = ?auto_748387 ?auto_748399 ) ) ( not ( = ?auto_748387 ?auto_748400 ) ) ( not ( = ?auto_748387 ?auto_748401 ) ) ( not ( = ?auto_748387 ?auto_748402 ) ) ( not ( = ?auto_748387 ?auto_748403 ) ) ( not ( = ?auto_748388 ?auto_748389 ) ) ( not ( = ?auto_748388 ?auto_748390 ) ) ( not ( = ?auto_748388 ?auto_748391 ) ) ( not ( = ?auto_748388 ?auto_748392 ) ) ( not ( = ?auto_748388 ?auto_748393 ) ) ( not ( = ?auto_748388 ?auto_748394 ) ) ( not ( = ?auto_748388 ?auto_748395 ) ) ( not ( = ?auto_748388 ?auto_748396 ) ) ( not ( = ?auto_748388 ?auto_748397 ) ) ( not ( = ?auto_748388 ?auto_748398 ) ) ( not ( = ?auto_748388 ?auto_748399 ) ) ( not ( = ?auto_748388 ?auto_748400 ) ) ( not ( = ?auto_748388 ?auto_748401 ) ) ( not ( = ?auto_748388 ?auto_748402 ) ) ( not ( = ?auto_748388 ?auto_748403 ) ) ( not ( = ?auto_748389 ?auto_748390 ) ) ( not ( = ?auto_748389 ?auto_748391 ) ) ( not ( = ?auto_748389 ?auto_748392 ) ) ( not ( = ?auto_748389 ?auto_748393 ) ) ( not ( = ?auto_748389 ?auto_748394 ) ) ( not ( = ?auto_748389 ?auto_748395 ) ) ( not ( = ?auto_748389 ?auto_748396 ) ) ( not ( = ?auto_748389 ?auto_748397 ) ) ( not ( = ?auto_748389 ?auto_748398 ) ) ( not ( = ?auto_748389 ?auto_748399 ) ) ( not ( = ?auto_748389 ?auto_748400 ) ) ( not ( = ?auto_748389 ?auto_748401 ) ) ( not ( = ?auto_748389 ?auto_748402 ) ) ( not ( = ?auto_748389 ?auto_748403 ) ) ( not ( = ?auto_748390 ?auto_748391 ) ) ( not ( = ?auto_748390 ?auto_748392 ) ) ( not ( = ?auto_748390 ?auto_748393 ) ) ( not ( = ?auto_748390 ?auto_748394 ) ) ( not ( = ?auto_748390 ?auto_748395 ) ) ( not ( = ?auto_748390 ?auto_748396 ) ) ( not ( = ?auto_748390 ?auto_748397 ) ) ( not ( = ?auto_748390 ?auto_748398 ) ) ( not ( = ?auto_748390 ?auto_748399 ) ) ( not ( = ?auto_748390 ?auto_748400 ) ) ( not ( = ?auto_748390 ?auto_748401 ) ) ( not ( = ?auto_748390 ?auto_748402 ) ) ( not ( = ?auto_748390 ?auto_748403 ) ) ( not ( = ?auto_748391 ?auto_748392 ) ) ( not ( = ?auto_748391 ?auto_748393 ) ) ( not ( = ?auto_748391 ?auto_748394 ) ) ( not ( = ?auto_748391 ?auto_748395 ) ) ( not ( = ?auto_748391 ?auto_748396 ) ) ( not ( = ?auto_748391 ?auto_748397 ) ) ( not ( = ?auto_748391 ?auto_748398 ) ) ( not ( = ?auto_748391 ?auto_748399 ) ) ( not ( = ?auto_748391 ?auto_748400 ) ) ( not ( = ?auto_748391 ?auto_748401 ) ) ( not ( = ?auto_748391 ?auto_748402 ) ) ( not ( = ?auto_748391 ?auto_748403 ) ) ( not ( = ?auto_748392 ?auto_748393 ) ) ( not ( = ?auto_748392 ?auto_748394 ) ) ( not ( = ?auto_748392 ?auto_748395 ) ) ( not ( = ?auto_748392 ?auto_748396 ) ) ( not ( = ?auto_748392 ?auto_748397 ) ) ( not ( = ?auto_748392 ?auto_748398 ) ) ( not ( = ?auto_748392 ?auto_748399 ) ) ( not ( = ?auto_748392 ?auto_748400 ) ) ( not ( = ?auto_748392 ?auto_748401 ) ) ( not ( = ?auto_748392 ?auto_748402 ) ) ( not ( = ?auto_748392 ?auto_748403 ) ) ( not ( = ?auto_748393 ?auto_748394 ) ) ( not ( = ?auto_748393 ?auto_748395 ) ) ( not ( = ?auto_748393 ?auto_748396 ) ) ( not ( = ?auto_748393 ?auto_748397 ) ) ( not ( = ?auto_748393 ?auto_748398 ) ) ( not ( = ?auto_748393 ?auto_748399 ) ) ( not ( = ?auto_748393 ?auto_748400 ) ) ( not ( = ?auto_748393 ?auto_748401 ) ) ( not ( = ?auto_748393 ?auto_748402 ) ) ( not ( = ?auto_748393 ?auto_748403 ) ) ( not ( = ?auto_748394 ?auto_748395 ) ) ( not ( = ?auto_748394 ?auto_748396 ) ) ( not ( = ?auto_748394 ?auto_748397 ) ) ( not ( = ?auto_748394 ?auto_748398 ) ) ( not ( = ?auto_748394 ?auto_748399 ) ) ( not ( = ?auto_748394 ?auto_748400 ) ) ( not ( = ?auto_748394 ?auto_748401 ) ) ( not ( = ?auto_748394 ?auto_748402 ) ) ( not ( = ?auto_748394 ?auto_748403 ) ) ( not ( = ?auto_748395 ?auto_748396 ) ) ( not ( = ?auto_748395 ?auto_748397 ) ) ( not ( = ?auto_748395 ?auto_748398 ) ) ( not ( = ?auto_748395 ?auto_748399 ) ) ( not ( = ?auto_748395 ?auto_748400 ) ) ( not ( = ?auto_748395 ?auto_748401 ) ) ( not ( = ?auto_748395 ?auto_748402 ) ) ( not ( = ?auto_748395 ?auto_748403 ) ) ( not ( = ?auto_748396 ?auto_748397 ) ) ( not ( = ?auto_748396 ?auto_748398 ) ) ( not ( = ?auto_748396 ?auto_748399 ) ) ( not ( = ?auto_748396 ?auto_748400 ) ) ( not ( = ?auto_748396 ?auto_748401 ) ) ( not ( = ?auto_748396 ?auto_748402 ) ) ( not ( = ?auto_748396 ?auto_748403 ) ) ( not ( = ?auto_748397 ?auto_748398 ) ) ( not ( = ?auto_748397 ?auto_748399 ) ) ( not ( = ?auto_748397 ?auto_748400 ) ) ( not ( = ?auto_748397 ?auto_748401 ) ) ( not ( = ?auto_748397 ?auto_748402 ) ) ( not ( = ?auto_748397 ?auto_748403 ) ) ( not ( = ?auto_748398 ?auto_748399 ) ) ( not ( = ?auto_748398 ?auto_748400 ) ) ( not ( = ?auto_748398 ?auto_748401 ) ) ( not ( = ?auto_748398 ?auto_748402 ) ) ( not ( = ?auto_748398 ?auto_748403 ) ) ( not ( = ?auto_748399 ?auto_748400 ) ) ( not ( = ?auto_748399 ?auto_748401 ) ) ( not ( = ?auto_748399 ?auto_748402 ) ) ( not ( = ?auto_748399 ?auto_748403 ) ) ( not ( = ?auto_748400 ?auto_748401 ) ) ( not ( = ?auto_748400 ?auto_748402 ) ) ( not ( = ?auto_748400 ?auto_748403 ) ) ( not ( = ?auto_748401 ?auto_748402 ) ) ( not ( = ?auto_748401 ?auto_748403 ) ) ( not ( = ?auto_748402 ?auto_748403 ) ) ( ON ?auto_748401 ?auto_748402 ) ( ON ?auto_748400 ?auto_748401 ) ( ON ?auto_748399 ?auto_748400 ) ( ON ?auto_748398 ?auto_748399 ) ( ON ?auto_748397 ?auto_748398 ) ( ON ?auto_748396 ?auto_748397 ) ( ON ?auto_748395 ?auto_748396 ) ( ON ?auto_748394 ?auto_748395 ) ( ON ?auto_748393 ?auto_748394 ) ( ON ?auto_748392 ?auto_748393 ) ( ON ?auto_748391 ?auto_748392 ) ( ON ?auto_748390 ?auto_748391 ) ( ON ?auto_748389 ?auto_748390 ) ( ON ?auto_748388 ?auto_748389 ) ( ON ?auto_748387 ?auto_748388 ) ( ON ?auto_748386 ?auto_748387 ) ( ON ?auto_748385 ?auto_748386 ) ( CLEAR ?auto_748385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_748385 )
      ( MAKE-18PILE ?auto_748385 ?auto_748386 ?auto_748387 ?auto_748388 ?auto_748389 ?auto_748390 ?auto_748391 ?auto_748392 ?auto_748393 ?auto_748394 ?auto_748395 ?auto_748396 ?auto_748397 ?auto_748398 ?auto_748399 ?auto_748400 ?auto_748401 ?auto_748402 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748422 - BLOCK
      ?auto_748423 - BLOCK
      ?auto_748424 - BLOCK
      ?auto_748425 - BLOCK
      ?auto_748426 - BLOCK
      ?auto_748427 - BLOCK
      ?auto_748428 - BLOCK
      ?auto_748429 - BLOCK
      ?auto_748430 - BLOCK
      ?auto_748431 - BLOCK
      ?auto_748432 - BLOCK
      ?auto_748433 - BLOCK
      ?auto_748434 - BLOCK
      ?auto_748435 - BLOCK
      ?auto_748436 - BLOCK
      ?auto_748437 - BLOCK
      ?auto_748438 - BLOCK
      ?auto_748439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_748439 ) ( not ( = ?auto_748422 ?auto_748423 ) ) ( not ( = ?auto_748422 ?auto_748424 ) ) ( not ( = ?auto_748422 ?auto_748425 ) ) ( not ( = ?auto_748422 ?auto_748426 ) ) ( not ( = ?auto_748422 ?auto_748427 ) ) ( not ( = ?auto_748422 ?auto_748428 ) ) ( not ( = ?auto_748422 ?auto_748429 ) ) ( not ( = ?auto_748422 ?auto_748430 ) ) ( not ( = ?auto_748422 ?auto_748431 ) ) ( not ( = ?auto_748422 ?auto_748432 ) ) ( not ( = ?auto_748422 ?auto_748433 ) ) ( not ( = ?auto_748422 ?auto_748434 ) ) ( not ( = ?auto_748422 ?auto_748435 ) ) ( not ( = ?auto_748422 ?auto_748436 ) ) ( not ( = ?auto_748422 ?auto_748437 ) ) ( not ( = ?auto_748422 ?auto_748438 ) ) ( not ( = ?auto_748422 ?auto_748439 ) ) ( not ( = ?auto_748423 ?auto_748424 ) ) ( not ( = ?auto_748423 ?auto_748425 ) ) ( not ( = ?auto_748423 ?auto_748426 ) ) ( not ( = ?auto_748423 ?auto_748427 ) ) ( not ( = ?auto_748423 ?auto_748428 ) ) ( not ( = ?auto_748423 ?auto_748429 ) ) ( not ( = ?auto_748423 ?auto_748430 ) ) ( not ( = ?auto_748423 ?auto_748431 ) ) ( not ( = ?auto_748423 ?auto_748432 ) ) ( not ( = ?auto_748423 ?auto_748433 ) ) ( not ( = ?auto_748423 ?auto_748434 ) ) ( not ( = ?auto_748423 ?auto_748435 ) ) ( not ( = ?auto_748423 ?auto_748436 ) ) ( not ( = ?auto_748423 ?auto_748437 ) ) ( not ( = ?auto_748423 ?auto_748438 ) ) ( not ( = ?auto_748423 ?auto_748439 ) ) ( not ( = ?auto_748424 ?auto_748425 ) ) ( not ( = ?auto_748424 ?auto_748426 ) ) ( not ( = ?auto_748424 ?auto_748427 ) ) ( not ( = ?auto_748424 ?auto_748428 ) ) ( not ( = ?auto_748424 ?auto_748429 ) ) ( not ( = ?auto_748424 ?auto_748430 ) ) ( not ( = ?auto_748424 ?auto_748431 ) ) ( not ( = ?auto_748424 ?auto_748432 ) ) ( not ( = ?auto_748424 ?auto_748433 ) ) ( not ( = ?auto_748424 ?auto_748434 ) ) ( not ( = ?auto_748424 ?auto_748435 ) ) ( not ( = ?auto_748424 ?auto_748436 ) ) ( not ( = ?auto_748424 ?auto_748437 ) ) ( not ( = ?auto_748424 ?auto_748438 ) ) ( not ( = ?auto_748424 ?auto_748439 ) ) ( not ( = ?auto_748425 ?auto_748426 ) ) ( not ( = ?auto_748425 ?auto_748427 ) ) ( not ( = ?auto_748425 ?auto_748428 ) ) ( not ( = ?auto_748425 ?auto_748429 ) ) ( not ( = ?auto_748425 ?auto_748430 ) ) ( not ( = ?auto_748425 ?auto_748431 ) ) ( not ( = ?auto_748425 ?auto_748432 ) ) ( not ( = ?auto_748425 ?auto_748433 ) ) ( not ( = ?auto_748425 ?auto_748434 ) ) ( not ( = ?auto_748425 ?auto_748435 ) ) ( not ( = ?auto_748425 ?auto_748436 ) ) ( not ( = ?auto_748425 ?auto_748437 ) ) ( not ( = ?auto_748425 ?auto_748438 ) ) ( not ( = ?auto_748425 ?auto_748439 ) ) ( not ( = ?auto_748426 ?auto_748427 ) ) ( not ( = ?auto_748426 ?auto_748428 ) ) ( not ( = ?auto_748426 ?auto_748429 ) ) ( not ( = ?auto_748426 ?auto_748430 ) ) ( not ( = ?auto_748426 ?auto_748431 ) ) ( not ( = ?auto_748426 ?auto_748432 ) ) ( not ( = ?auto_748426 ?auto_748433 ) ) ( not ( = ?auto_748426 ?auto_748434 ) ) ( not ( = ?auto_748426 ?auto_748435 ) ) ( not ( = ?auto_748426 ?auto_748436 ) ) ( not ( = ?auto_748426 ?auto_748437 ) ) ( not ( = ?auto_748426 ?auto_748438 ) ) ( not ( = ?auto_748426 ?auto_748439 ) ) ( not ( = ?auto_748427 ?auto_748428 ) ) ( not ( = ?auto_748427 ?auto_748429 ) ) ( not ( = ?auto_748427 ?auto_748430 ) ) ( not ( = ?auto_748427 ?auto_748431 ) ) ( not ( = ?auto_748427 ?auto_748432 ) ) ( not ( = ?auto_748427 ?auto_748433 ) ) ( not ( = ?auto_748427 ?auto_748434 ) ) ( not ( = ?auto_748427 ?auto_748435 ) ) ( not ( = ?auto_748427 ?auto_748436 ) ) ( not ( = ?auto_748427 ?auto_748437 ) ) ( not ( = ?auto_748427 ?auto_748438 ) ) ( not ( = ?auto_748427 ?auto_748439 ) ) ( not ( = ?auto_748428 ?auto_748429 ) ) ( not ( = ?auto_748428 ?auto_748430 ) ) ( not ( = ?auto_748428 ?auto_748431 ) ) ( not ( = ?auto_748428 ?auto_748432 ) ) ( not ( = ?auto_748428 ?auto_748433 ) ) ( not ( = ?auto_748428 ?auto_748434 ) ) ( not ( = ?auto_748428 ?auto_748435 ) ) ( not ( = ?auto_748428 ?auto_748436 ) ) ( not ( = ?auto_748428 ?auto_748437 ) ) ( not ( = ?auto_748428 ?auto_748438 ) ) ( not ( = ?auto_748428 ?auto_748439 ) ) ( not ( = ?auto_748429 ?auto_748430 ) ) ( not ( = ?auto_748429 ?auto_748431 ) ) ( not ( = ?auto_748429 ?auto_748432 ) ) ( not ( = ?auto_748429 ?auto_748433 ) ) ( not ( = ?auto_748429 ?auto_748434 ) ) ( not ( = ?auto_748429 ?auto_748435 ) ) ( not ( = ?auto_748429 ?auto_748436 ) ) ( not ( = ?auto_748429 ?auto_748437 ) ) ( not ( = ?auto_748429 ?auto_748438 ) ) ( not ( = ?auto_748429 ?auto_748439 ) ) ( not ( = ?auto_748430 ?auto_748431 ) ) ( not ( = ?auto_748430 ?auto_748432 ) ) ( not ( = ?auto_748430 ?auto_748433 ) ) ( not ( = ?auto_748430 ?auto_748434 ) ) ( not ( = ?auto_748430 ?auto_748435 ) ) ( not ( = ?auto_748430 ?auto_748436 ) ) ( not ( = ?auto_748430 ?auto_748437 ) ) ( not ( = ?auto_748430 ?auto_748438 ) ) ( not ( = ?auto_748430 ?auto_748439 ) ) ( not ( = ?auto_748431 ?auto_748432 ) ) ( not ( = ?auto_748431 ?auto_748433 ) ) ( not ( = ?auto_748431 ?auto_748434 ) ) ( not ( = ?auto_748431 ?auto_748435 ) ) ( not ( = ?auto_748431 ?auto_748436 ) ) ( not ( = ?auto_748431 ?auto_748437 ) ) ( not ( = ?auto_748431 ?auto_748438 ) ) ( not ( = ?auto_748431 ?auto_748439 ) ) ( not ( = ?auto_748432 ?auto_748433 ) ) ( not ( = ?auto_748432 ?auto_748434 ) ) ( not ( = ?auto_748432 ?auto_748435 ) ) ( not ( = ?auto_748432 ?auto_748436 ) ) ( not ( = ?auto_748432 ?auto_748437 ) ) ( not ( = ?auto_748432 ?auto_748438 ) ) ( not ( = ?auto_748432 ?auto_748439 ) ) ( not ( = ?auto_748433 ?auto_748434 ) ) ( not ( = ?auto_748433 ?auto_748435 ) ) ( not ( = ?auto_748433 ?auto_748436 ) ) ( not ( = ?auto_748433 ?auto_748437 ) ) ( not ( = ?auto_748433 ?auto_748438 ) ) ( not ( = ?auto_748433 ?auto_748439 ) ) ( not ( = ?auto_748434 ?auto_748435 ) ) ( not ( = ?auto_748434 ?auto_748436 ) ) ( not ( = ?auto_748434 ?auto_748437 ) ) ( not ( = ?auto_748434 ?auto_748438 ) ) ( not ( = ?auto_748434 ?auto_748439 ) ) ( not ( = ?auto_748435 ?auto_748436 ) ) ( not ( = ?auto_748435 ?auto_748437 ) ) ( not ( = ?auto_748435 ?auto_748438 ) ) ( not ( = ?auto_748435 ?auto_748439 ) ) ( not ( = ?auto_748436 ?auto_748437 ) ) ( not ( = ?auto_748436 ?auto_748438 ) ) ( not ( = ?auto_748436 ?auto_748439 ) ) ( not ( = ?auto_748437 ?auto_748438 ) ) ( not ( = ?auto_748437 ?auto_748439 ) ) ( not ( = ?auto_748438 ?auto_748439 ) ) ( ON ?auto_748438 ?auto_748439 ) ( ON ?auto_748437 ?auto_748438 ) ( ON ?auto_748436 ?auto_748437 ) ( ON ?auto_748435 ?auto_748436 ) ( ON ?auto_748434 ?auto_748435 ) ( ON ?auto_748433 ?auto_748434 ) ( ON ?auto_748432 ?auto_748433 ) ( ON ?auto_748431 ?auto_748432 ) ( ON ?auto_748430 ?auto_748431 ) ( ON ?auto_748429 ?auto_748430 ) ( ON ?auto_748428 ?auto_748429 ) ( ON ?auto_748427 ?auto_748428 ) ( ON ?auto_748426 ?auto_748427 ) ( ON ?auto_748425 ?auto_748426 ) ( ON ?auto_748424 ?auto_748425 ) ( ON ?auto_748423 ?auto_748424 ) ( ON ?auto_748422 ?auto_748423 ) ( CLEAR ?auto_748422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_748422 )
      ( MAKE-18PILE ?auto_748422 ?auto_748423 ?auto_748424 ?auto_748425 ?auto_748426 ?auto_748427 ?auto_748428 ?auto_748429 ?auto_748430 ?auto_748431 ?auto_748432 ?auto_748433 ?auto_748434 ?auto_748435 ?auto_748436 ?auto_748437 ?auto_748438 ?auto_748439 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_748458 - BLOCK
      ?auto_748459 - BLOCK
      ?auto_748460 - BLOCK
      ?auto_748461 - BLOCK
      ?auto_748462 - BLOCK
      ?auto_748463 - BLOCK
      ?auto_748464 - BLOCK
      ?auto_748465 - BLOCK
      ?auto_748466 - BLOCK
      ?auto_748467 - BLOCK
      ?auto_748468 - BLOCK
      ?auto_748469 - BLOCK
      ?auto_748470 - BLOCK
      ?auto_748471 - BLOCK
      ?auto_748472 - BLOCK
      ?auto_748473 - BLOCK
      ?auto_748474 - BLOCK
      ?auto_748475 - BLOCK
    )
    :vars
    (
      ?auto_748476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_748458 ?auto_748459 ) ) ( not ( = ?auto_748458 ?auto_748460 ) ) ( not ( = ?auto_748458 ?auto_748461 ) ) ( not ( = ?auto_748458 ?auto_748462 ) ) ( not ( = ?auto_748458 ?auto_748463 ) ) ( not ( = ?auto_748458 ?auto_748464 ) ) ( not ( = ?auto_748458 ?auto_748465 ) ) ( not ( = ?auto_748458 ?auto_748466 ) ) ( not ( = ?auto_748458 ?auto_748467 ) ) ( not ( = ?auto_748458 ?auto_748468 ) ) ( not ( = ?auto_748458 ?auto_748469 ) ) ( not ( = ?auto_748458 ?auto_748470 ) ) ( not ( = ?auto_748458 ?auto_748471 ) ) ( not ( = ?auto_748458 ?auto_748472 ) ) ( not ( = ?auto_748458 ?auto_748473 ) ) ( not ( = ?auto_748458 ?auto_748474 ) ) ( not ( = ?auto_748458 ?auto_748475 ) ) ( not ( = ?auto_748459 ?auto_748460 ) ) ( not ( = ?auto_748459 ?auto_748461 ) ) ( not ( = ?auto_748459 ?auto_748462 ) ) ( not ( = ?auto_748459 ?auto_748463 ) ) ( not ( = ?auto_748459 ?auto_748464 ) ) ( not ( = ?auto_748459 ?auto_748465 ) ) ( not ( = ?auto_748459 ?auto_748466 ) ) ( not ( = ?auto_748459 ?auto_748467 ) ) ( not ( = ?auto_748459 ?auto_748468 ) ) ( not ( = ?auto_748459 ?auto_748469 ) ) ( not ( = ?auto_748459 ?auto_748470 ) ) ( not ( = ?auto_748459 ?auto_748471 ) ) ( not ( = ?auto_748459 ?auto_748472 ) ) ( not ( = ?auto_748459 ?auto_748473 ) ) ( not ( = ?auto_748459 ?auto_748474 ) ) ( not ( = ?auto_748459 ?auto_748475 ) ) ( not ( = ?auto_748460 ?auto_748461 ) ) ( not ( = ?auto_748460 ?auto_748462 ) ) ( not ( = ?auto_748460 ?auto_748463 ) ) ( not ( = ?auto_748460 ?auto_748464 ) ) ( not ( = ?auto_748460 ?auto_748465 ) ) ( not ( = ?auto_748460 ?auto_748466 ) ) ( not ( = ?auto_748460 ?auto_748467 ) ) ( not ( = ?auto_748460 ?auto_748468 ) ) ( not ( = ?auto_748460 ?auto_748469 ) ) ( not ( = ?auto_748460 ?auto_748470 ) ) ( not ( = ?auto_748460 ?auto_748471 ) ) ( not ( = ?auto_748460 ?auto_748472 ) ) ( not ( = ?auto_748460 ?auto_748473 ) ) ( not ( = ?auto_748460 ?auto_748474 ) ) ( not ( = ?auto_748460 ?auto_748475 ) ) ( not ( = ?auto_748461 ?auto_748462 ) ) ( not ( = ?auto_748461 ?auto_748463 ) ) ( not ( = ?auto_748461 ?auto_748464 ) ) ( not ( = ?auto_748461 ?auto_748465 ) ) ( not ( = ?auto_748461 ?auto_748466 ) ) ( not ( = ?auto_748461 ?auto_748467 ) ) ( not ( = ?auto_748461 ?auto_748468 ) ) ( not ( = ?auto_748461 ?auto_748469 ) ) ( not ( = ?auto_748461 ?auto_748470 ) ) ( not ( = ?auto_748461 ?auto_748471 ) ) ( not ( = ?auto_748461 ?auto_748472 ) ) ( not ( = ?auto_748461 ?auto_748473 ) ) ( not ( = ?auto_748461 ?auto_748474 ) ) ( not ( = ?auto_748461 ?auto_748475 ) ) ( not ( = ?auto_748462 ?auto_748463 ) ) ( not ( = ?auto_748462 ?auto_748464 ) ) ( not ( = ?auto_748462 ?auto_748465 ) ) ( not ( = ?auto_748462 ?auto_748466 ) ) ( not ( = ?auto_748462 ?auto_748467 ) ) ( not ( = ?auto_748462 ?auto_748468 ) ) ( not ( = ?auto_748462 ?auto_748469 ) ) ( not ( = ?auto_748462 ?auto_748470 ) ) ( not ( = ?auto_748462 ?auto_748471 ) ) ( not ( = ?auto_748462 ?auto_748472 ) ) ( not ( = ?auto_748462 ?auto_748473 ) ) ( not ( = ?auto_748462 ?auto_748474 ) ) ( not ( = ?auto_748462 ?auto_748475 ) ) ( not ( = ?auto_748463 ?auto_748464 ) ) ( not ( = ?auto_748463 ?auto_748465 ) ) ( not ( = ?auto_748463 ?auto_748466 ) ) ( not ( = ?auto_748463 ?auto_748467 ) ) ( not ( = ?auto_748463 ?auto_748468 ) ) ( not ( = ?auto_748463 ?auto_748469 ) ) ( not ( = ?auto_748463 ?auto_748470 ) ) ( not ( = ?auto_748463 ?auto_748471 ) ) ( not ( = ?auto_748463 ?auto_748472 ) ) ( not ( = ?auto_748463 ?auto_748473 ) ) ( not ( = ?auto_748463 ?auto_748474 ) ) ( not ( = ?auto_748463 ?auto_748475 ) ) ( not ( = ?auto_748464 ?auto_748465 ) ) ( not ( = ?auto_748464 ?auto_748466 ) ) ( not ( = ?auto_748464 ?auto_748467 ) ) ( not ( = ?auto_748464 ?auto_748468 ) ) ( not ( = ?auto_748464 ?auto_748469 ) ) ( not ( = ?auto_748464 ?auto_748470 ) ) ( not ( = ?auto_748464 ?auto_748471 ) ) ( not ( = ?auto_748464 ?auto_748472 ) ) ( not ( = ?auto_748464 ?auto_748473 ) ) ( not ( = ?auto_748464 ?auto_748474 ) ) ( not ( = ?auto_748464 ?auto_748475 ) ) ( not ( = ?auto_748465 ?auto_748466 ) ) ( not ( = ?auto_748465 ?auto_748467 ) ) ( not ( = ?auto_748465 ?auto_748468 ) ) ( not ( = ?auto_748465 ?auto_748469 ) ) ( not ( = ?auto_748465 ?auto_748470 ) ) ( not ( = ?auto_748465 ?auto_748471 ) ) ( not ( = ?auto_748465 ?auto_748472 ) ) ( not ( = ?auto_748465 ?auto_748473 ) ) ( not ( = ?auto_748465 ?auto_748474 ) ) ( not ( = ?auto_748465 ?auto_748475 ) ) ( not ( = ?auto_748466 ?auto_748467 ) ) ( not ( = ?auto_748466 ?auto_748468 ) ) ( not ( = ?auto_748466 ?auto_748469 ) ) ( not ( = ?auto_748466 ?auto_748470 ) ) ( not ( = ?auto_748466 ?auto_748471 ) ) ( not ( = ?auto_748466 ?auto_748472 ) ) ( not ( = ?auto_748466 ?auto_748473 ) ) ( not ( = ?auto_748466 ?auto_748474 ) ) ( not ( = ?auto_748466 ?auto_748475 ) ) ( not ( = ?auto_748467 ?auto_748468 ) ) ( not ( = ?auto_748467 ?auto_748469 ) ) ( not ( = ?auto_748467 ?auto_748470 ) ) ( not ( = ?auto_748467 ?auto_748471 ) ) ( not ( = ?auto_748467 ?auto_748472 ) ) ( not ( = ?auto_748467 ?auto_748473 ) ) ( not ( = ?auto_748467 ?auto_748474 ) ) ( not ( = ?auto_748467 ?auto_748475 ) ) ( not ( = ?auto_748468 ?auto_748469 ) ) ( not ( = ?auto_748468 ?auto_748470 ) ) ( not ( = ?auto_748468 ?auto_748471 ) ) ( not ( = ?auto_748468 ?auto_748472 ) ) ( not ( = ?auto_748468 ?auto_748473 ) ) ( not ( = ?auto_748468 ?auto_748474 ) ) ( not ( = ?auto_748468 ?auto_748475 ) ) ( not ( = ?auto_748469 ?auto_748470 ) ) ( not ( = ?auto_748469 ?auto_748471 ) ) ( not ( = ?auto_748469 ?auto_748472 ) ) ( not ( = ?auto_748469 ?auto_748473 ) ) ( not ( = ?auto_748469 ?auto_748474 ) ) ( not ( = ?auto_748469 ?auto_748475 ) ) ( not ( = ?auto_748470 ?auto_748471 ) ) ( not ( = ?auto_748470 ?auto_748472 ) ) ( not ( = ?auto_748470 ?auto_748473 ) ) ( not ( = ?auto_748470 ?auto_748474 ) ) ( not ( = ?auto_748470 ?auto_748475 ) ) ( not ( = ?auto_748471 ?auto_748472 ) ) ( not ( = ?auto_748471 ?auto_748473 ) ) ( not ( = ?auto_748471 ?auto_748474 ) ) ( not ( = ?auto_748471 ?auto_748475 ) ) ( not ( = ?auto_748472 ?auto_748473 ) ) ( not ( = ?auto_748472 ?auto_748474 ) ) ( not ( = ?auto_748472 ?auto_748475 ) ) ( not ( = ?auto_748473 ?auto_748474 ) ) ( not ( = ?auto_748473 ?auto_748475 ) ) ( not ( = ?auto_748474 ?auto_748475 ) ) ( ON ?auto_748458 ?auto_748476 ) ( not ( = ?auto_748475 ?auto_748476 ) ) ( not ( = ?auto_748474 ?auto_748476 ) ) ( not ( = ?auto_748473 ?auto_748476 ) ) ( not ( = ?auto_748472 ?auto_748476 ) ) ( not ( = ?auto_748471 ?auto_748476 ) ) ( not ( = ?auto_748470 ?auto_748476 ) ) ( not ( = ?auto_748469 ?auto_748476 ) ) ( not ( = ?auto_748468 ?auto_748476 ) ) ( not ( = ?auto_748467 ?auto_748476 ) ) ( not ( = ?auto_748466 ?auto_748476 ) ) ( not ( = ?auto_748465 ?auto_748476 ) ) ( not ( = ?auto_748464 ?auto_748476 ) ) ( not ( = ?auto_748463 ?auto_748476 ) ) ( not ( = ?auto_748462 ?auto_748476 ) ) ( not ( = ?auto_748461 ?auto_748476 ) ) ( not ( = ?auto_748460 ?auto_748476 ) ) ( not ( = ?auto_748459 ?auto_748476 ) ) ( not ( = ?auto_748458 ?auto_748476 ) ) ( ON ?auto_748459 ?auto_748458 ) ( ON ?auto_748460 ?auto_748459 ) ( ON ?auto_748461 ?auto_748460 ) ( ON ?auto_748462 ?auto_748461 ) ( ON ?auto_748463 ?auto_748462 ) ( ON ?auto_748464 ?auto_748463 ) ( ON ?auto_748465 ?auto_748464 ) ( ON ?auto_748466 ?auto_748465 ) ( ON ?auto_748467 ?auto_748466 ) ( ON ?auto_748468 ?auto_748467 ) ( ON ?auto_748469 ?auto_748468 ) ( ON ?auto_748470 ?auto_748469 ) ( ON ?auto_748471 ?auto_748470 ) ( ON ?auto_748472 ?auto_748471 ) ( ON ?auto_748473 ?auto_748472 ) ( ON ?auto_748474 ?auto_748473 ) ( ON ?auto_748475 ?auto_748474 ) ( CLEAR ?auto_748475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_748475 ?auto_748474 ?auto_748473 ?auto_748472 ?auto_748471 ?auto_748470 ?auto_748469 ?auto_748468 ?auto_748467 ?auto_748466 ?auto_748465 ?auto_748464 ?auto_748463 ?auto_748462 ?auto_748461 ?auto_748460 ?auto_748459 ?auto_748458 )
      ( MAKE-18PILE ?auto_748458 ?auto_748459 ?auto_748460 ?auto_748461 ?auto_748462 ?auto_748463 ?auto_748464 ?auto_748465 ?auto_748466 ?auto_748467 ?auto_748468 ?auto_748469 ?auto_748470 ?auto_748471 ?auto_748472 ?auto_748473 ?auto_748474 ?auto_748475 ) )
  )

)

