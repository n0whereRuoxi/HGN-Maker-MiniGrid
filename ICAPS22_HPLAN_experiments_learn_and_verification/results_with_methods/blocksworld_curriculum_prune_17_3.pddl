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
      ?auto_612793 - BLOCK
    )
    :vars
    (
      ?auto_612794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612793 ?auto_612794 ) ( CLEAR ?auto_612793 ) ( HAND-EMPTY ) ( not ( = ?auto_612793 ?auto_612794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_612793 ?auto_612794 )
      ( !PUTDOWN ?auto_612793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_612800 - BLOCK
      ?auto_612801 - BLOCK
    )
    :vars
    (
      ?auto_612802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_612800 ) ( ON ?auto_612801 ?auto_612802 ) ( CLEAR ?auto_612801 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_612800 ) ( not ( = ?auto_612800 ?auto_612801 ) ) ( not ( = ?auto_612800 ?auto_612802 ) ) ( not ( = ?auto_612801 ?auto_612802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_612801 ?auto_612802 )
      ( !STACK ?auto_612801 ?auto_612800 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_612810 - BLOCK
      ?auto_612811 - BLOCK
    )
    :vars
    (
      ?auto_612812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612811 ?auto_612812 ) ( not ( = ?auto_612810 ?auto_612811 ) ) ( not ( = ?auto_612810 ?auto_612812 ) ) ( not ( = ?auto_612811 ?auto_612812 ) ) ( ON ?auto_612810 ?auto_612811 ) ( CLEAR ?auto_612810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_612810 )
      ( MAKE-2PILE ?auto_612810 ?auto_612811 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_612821 - BLOCK
      ?auto_612822 - BLOCK
      ?auto_612823 - BLOCK
    )
    :vars
    (
      ?auto_612824 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_612822 ) ( ON ?auto_612823 ?auto_612824 ) ( CLEAR ?auto_612823 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_612821 ) ( ON ?auto_612822 ?auto_612821 ) ( not ( = ?auto_612821 ?auto_612822 ) ) ( not ( = ?auto_612821 ?auto_612823 ) ) ( not ( = ?auto_612821 ?auto_612824 ) ) ( not ( = ?auto_612822 ?auto_612823 ) ) ( not ( = ?auto_612822 ?auto_612824 ) ) ( not ( = ?auto_612823 ?auto_612824 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_612823 ?auto_612824 )
      ( !STACK ?auto_612823 ?auto_612822 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_612835 - BLOCK
      ?auto_612836 - BLOCK
      ?auto_612837 - BLOCK
    )
    :vars
    (
      ?auto_612838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612837 ?auto_612838 ) ( ON-TABLE ?auto_612835 ) ( not ( = ?auto_612835 ?auto_612836 ) ) ( not ( = ?auto_612835 ?auto_612837 ) ) ( not ( = ?auto_612835 ?auto_612838 ) ) ( not ( = ?auto_612836 ?auto_612837 ) ) ( not ( = ?auto_612836 ?auto_612838 ) ) ( not ( = ?auto_612837 ?auto_612838 ) ) ( CLEAR ?auto_612835 ) ( ON ?auto_612836 ?auto_612837 ) ( CLEAR ?auto_612836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_612835 ?auto_612836 )
      ( MAKE-3PILE ?auto_612835 ?auto_612836 ?auto_612837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_612849 - BLOCK
      ?auto_612850 - BLOCK
      ?auto_612851 - BLOCK
    )
    :vars
    (
      ?auto_612852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612851 ?auto_612852 ) ( not ( = ?auto_612849 ?auto_612850 ) ) ( not ( = ?auto_612849 ?auto_612851 ) ) ( not ( = ?auto_612849 ?auto_612852 ) ) ( not ( = ?auto_612850 ?auto_612851 ) ) ( not ( = ?auto_612850 ?auto_612852 ) ) ( not ( = ?auto_612851 ?auto_612852 ) ) ( ON ?auto_612850 ?auto_612851 ) ( ON ?auto_612849 ?auto_612850 ) ( CLEAR ?auto_612849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_612849 )
      ( MAKE-3PILE ?auto_612849 ?auto_612850 ?auto_612851 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_612864 - BLOCK
      ?auto_612865 - BLOCK
      ?auto_612866 - BLOCK
      ?auto_612867 - BLOCK
    )
    :vars
    (
      ?auto_612868 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_612866 ) ( ON ?auto_612867 ?auto_612868 ) ( CLEAR ?auto_612867 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_612864 ) ( ON ?auto_612865 ?auto_612864 ) ( ON ?auto_612866 ?auto_612865 ) ( not ( = ?auto_612864 ?auto_612865 ) ) ( not ( = ?auto_612864 ?auto_612866 ) ) ( not ( = ?auto_612864 ?auto_612867 ) ) ( not ( = ?auto_612864 ?auto_612868 ) ) ( not ( = ?auto_612865 ?auto_612866 ) ) ( not ( = ?auto_612865 ?auto_612867 ) ) ( not ( = ?auto_612865 ?auto_612868 ) ) ( not ( = ?auto_612866 ?auto_612867 ) ) ( not ( = ?auto_612866 ?auto_612868 ) ) ( not ( = ?auto_612867 ?auto_612868 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_612867 ?auto_612868 )
      ( !STACK ?auto_612867 ?auto_612866 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_612882 - BLOCK
      ?auto_612883 - BLOCK
      ?auto_612884 - BLOCK
      ?auto_612885 - BLOCK
    )
    :vars
    (
      ?auto_612886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612885 ?auto_612886 ) ( ON-TABLE ?auto_612882 ) ( ON ?auto_612883 ?auto_612882 ) ( not ( = ?auto_612882 ?auto_612883 ) ) ( not ( = ?auto_612882 ?auto_612884 ) ) ( not ( = ?auto_612882 ?auto_612885 ) ) ( not ( = ?auto_612882 ?auto_612886 ) ) ( not ( = ?auto_612883 ?auto_612884 ) ) ( not ( = ?auto_612883 ?auto_612885 ) ) ( not ( = ?auto_612883 ?auto_612886 ) ) ( not ( = ?auto_612884 ?auto_612885 ) ) ( not ( = ?auto_612884 ?auto_612886 ) ) ( not ( = ?auto_612885 ?auto_612886 ) ) ( CLEAR ?auto_612883 ) ( ON ?auto_612884 ?auto_612885 ) ( CLEAR ?auto_612884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_612882 ?auto_612883 ?auto_612884 )
      ( MAKE-4PILE ?auto_612882 ?auto_612883 ?auto_612884 ?auto_612885 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_612900 - BLOCK
      ?auto_612901 - BLOCK
      ?auto_612902 - BLOCK
      ?auto_612903 - BLOCK
    )
    :vars
    (
      ?auto_612904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612903 ?auto_612904 ) ( ON-TABLE ?auto_612900 ) ( not ( = ?auto_612900 ?auto_612901 ) ) ( not ( = ?auto_612900 ?auto_612902 ) ) ( not ( = ?auto_612900 ?auto_612903 ) ) ( not ( = ?auto_612900 ?auto_612904 ) ) ( not ( = ?auto_612901 ?auto_612902 ) ) ( not ( = ?auto_612901 ?auto_612903 ) ) ( not ( = ?auto_612901 ?auto_612904 ) ) ( not ( = ?auto_612902 ?auto_612903 ) ) ( not ( = ?auto_612902 ?auto_612904 ) ) ( not ( = ?auto_612903 ?auto_612904 ) ) ( ON ?auto_612902 ?auto_612903 ) ( CLEAR ?auto_612900 ) ( ON ?auto_612901 ?auto_612902 ) ( CLEAR ?auto_612901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_612900 ?auto_612901 )
      ( MAKE-4PILE ?auto_612900 ?auto_612901 ?auto_612902 ?auto_612903 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_612918 - BLOCK
      ?auto_612919 - BLOCK
      ?auto_612920 - BLOCK
      ?auto_612921 - BLOCK
    )
    :vars
    (
      ?auto_612922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612921 ?auto_612922 ) ( not ( = ?auto_612918 ?auto_612919 ) ) ( not ( = ?auto_612918 ?auto_612920 ) ) ( not ( = ?auto_612918 ?auto_612921 ) ) ( not ( = ?auto_612918 ?auto_612922 ) ) ( not ( = ?auto_612919 ?auto_612920 ) ) ( not ( = ?auto_612919 ?auto_612921 ) ) ( not ( = ?auto_612919 ?auto_612922 ) ) ( not ( = ?auto_612920 ?auto_612921 ) ) ( not ( = ?auto_612920 ?auto_612922 ) ) ( not ( = ?auto_612921 ?auto_612922 ) ) ( ON ?auto_612920 ?auto_612921 ) ( ON ?auto_612919 ?auto_612920 ) ( ON ?auto_612918 ?auto_612919 ) ( CLEAR ?auto_612918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_612918 )
      ( MAKE-4PILE ?auto_612918 ?auto_612919 ?auto_612920 ?auto_612921 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_612937 - BLOCK
      ?auto_612938 - BLOCK
      ?auto_612939 - BLOCK
      ?auto_612940 - BLOCK
      ?auto_612941 - BLOCK
    )
    :vars
    (
      ?auto_612942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_612940 ) ( ON ?auto_612941 ?auto_612942 ) ( CLEAR ?auto_612941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_612937 ) ( ON ?auto_612938 ?auto_612937 ) ( ON ?auto_612939 ?auto_612938 ) ( ON ?auto_612940 ?auto_612939 ) ( not ( = ?auto_612937 ?auto_612938 ) ) ( not ( = ?auto_612937 ?auto_612939 ) ) ( not ( = ?auto_612937 ?auto_612940 ) ) ( not ( = ?auto_612937 ?auto_612941 ) ) ( not ( = ?auto_612937 ?auto_612942 ) ) ( not ( = ?auto_612938 ?auto_612939 ) ) ( not ( = ?auto_612938 ?auto_612940 ) ) ( not ( = ?auto_612938 ?auto_612941 ) ) ( not ( = ?auto_612938 ?auto_612942 ) ) ( not ( = ?auto_612939 ?auto_612940 ) ) ( not ( = ?auto_612939 ?auto_612941 ) ) ( not ( = ?auto_612939 ?auto_612942 ) ) ( not ( = ?auto_612940 ?auto_612941 ) ) ( not ( = ?auto_612940 ?auto_612942 ) ) ( not ( = ?auto_612941 ?auto_612942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_612941 ?auto_612942 )
      ( !STACK ?auto_612941 ?auto_612940 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_612959 - BLOCK
      ?auto_612960 - BLOCK
      ?auto_612961 - BLOCK
      ?auto_612962 - BLOCK
      ?auto_612963 - BLOCK
    )
    :vars
    (
      ?auto_612964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612963 ?auto_612964 ) ( ON-TABLE ?auto_612959 ) ( ON ?auto_612960 ?auto_612959 ) ( ON ?auto_612961 ?auto_612960 ) ( not ( = ?auto_612959 ?auto_612960 ) ) ( not ( = ?auto_612959 ?auto_612961 ) ) ( not ( = ?auto_612959 ?auto_612962 ) ) ( not ( = ?auto_612959 ?auto_612963 ) ) ( not ( = ?auto_612959 ?auto_612964 ) ) ( not ( = ?auto_612960 ?auto_612961 ) ) ( not ( = ?auto_612960 ?auto_612962 ) ) ( not ( = ?auto_612960 ?auto_612963 ) ) ( not ( = ?auto_612960 ?auto_612964 ) ) ( not ( = ?auto_612961 ?auto_612962 ) ) ( not ( = ?auto_612961 ?auto_612963 ) ) ( not ( = ?auto_612961 ?auto_612964 ) ) ( not ( = ?auto_612962 ?auto_612963 ) ) ( not ( = ?auto_612962 ?auto_612964 ) ) ( not ( = ?auto_612963 ?auto_612964 ) ) ( CLEAR ?auto_612961 ) ( ON ?auto_612962 ?auto_612963 ) ( CLEAR ?auto_612962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_612959 ?auto_612960 ?auto_612961 ?auto_612962 )
      ( MAKE-5PILE ?auto_612959 ?auto_612960 ?auto_612961 ?auto_612962 ?auto_612963 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_612981 - BLOCK
      ?auto_612982 - BLOCK
      ?auto_612983 - BLOCK
      ?auto_612984 - BLOCK
      ?auto_612985 - BLOCK
    )
    :vars
    (
      ?auto_612986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612985 ?auto_612986 ) ( ON-TABLE ?auto_612981 ) ( ON ?auto_612982 ?auto_612981 ) ( not ( = ?auto_612981 ?auto_612982 ) ) ( not ( = ?auto_612981 ?auto_612983 ) ) ( not ( = ?auto_612981 ?auto_612984 ) ) ( not ( = ?auto_612981 ?auto_612985 ) ) ( not ( = ?auto_612981 ?auto_612986 ) ) ( not ( = ?auto_612982 ?auto_612983 ) ) ( not ( = ?auto_612982 ?auto_612984 ) ) ( not ( = ?auto_612982 ?auto_612985 ) ) ( not ( = ?auto_612982 ?auto_612986 ) ) ( not ( = ?auto_612983 ?auto_612984 ) ) ( not ( = ?auto_612983 ?auto_612985 ) ) ( not ( = ?auto_612983 ?auto_612986 ) ) ( not ( = ?auto_612984 ?auto_612985 ) ) ( not ( = ?auto_612984 ?auto_612986 ) ) ( not ( = ?auto_612985 ?auto_612986 ) ) ( ON ?auto_612984 ?auto_612985 ) ( CLEAR ?auto_612982 ) ( ON ?auto_612983 ?auto_612984 ) ( CLEAR ?auto_612983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_612981 ?auto_612982 ?auto_612983 )
      ( MAKE-5PILE ?auto_612981 ?auto_612982 ?auto_612983 ?auto_612984 ?auto_612985 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_613003 - BLOCK
      ?auto_613004 - BLOCK
      ?auto_613005 - BLOCK
      ?auto_613006 - BLOCK
      ?auto_613007 - BLOCK
    )
    :vars
    (
      ?auto_613008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613007 ?auto_613008 ) ( ON-TABLE ?auto_613003 ) ( not ( = ?auto_613003 ?auto_613004 ) ) ( not ( = ?auto_613003 ?auto_613005 ) ) ( not ( = ?auto_613003 ?auto_613006 ) ) ( not ( = ?auto_613003 ?auto_613007 ) ) ( not ( = ?auto_613003 ?auto_613008 ) ) ( not ( = ?auto_613004 ?auto_613005 ) ) ( not ( = ?auto_613004 ?auto_613006 ) ) ( not ( = ?auto_613004 ?auto_613007 ) ) ( not ( = ?auto_613004 ?auto_613008 ) ) ( not ( = ?auto_613005 ?auto_613006 ) ) ( not ( = ?auto_613005 ?auto_613007 ) ) ( not ( = ?auto_613005 ?auto_613008 ) ) ( not ( = ?auto_613006 ?auto_613007 ) ) ( not ( = ?auto_613006 ?auto_613008 ) ) ( not ( = ?auto_613007 ?auto_613008 ) ) ( ON ?auto_613006 ?auto_613007 ) ( ON ?auto_613005 ?auto_613006 ) ( CLEAR ?auto_613003 ) ( ON ?auto_613004 ?auto_613005 ) ( CLEAR ?auto_613004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_613003 ?auto_613004 )
      ( MAKE-5PILE ?auto_613003 ?auto_613004 ?auto_613005 ?auto_613006 ?auto_613007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_613025 - BLOCK
      ?auto_613026 - BLOCK
      ?auto_613027 - BLOCK
      ?auto_613028 - BLOCK
      ?auto_613029 - BLOCK
    )
    :vars
    (
      ?auto_613030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613029 ?auto_613030 ) ( not ( = ?auto_613025 ?auto_613026 ) ) ( not ( = ?auto_613025 ?auto_613027 ) ) ( not ( = ?auto_613025 ?auto_613028 ) ) ( not ( = ?auto_613025 ?auto_613029 ) ) ( not ( = ?auto_613025 ?auto_613030 ) ) ( not ( = ?auto_613026 ?auto_613027 ) ) ( not ( = ?auto_613026 ?auto_613028 ) ) ( not ( = ?auto_613026 ?auto_613029 ) ) ( not ( = ?auto_613026 ?auto_613030 ) ) ( not ( = ?auto_613027 ?auto_613028 ) ) ( not ( = ?auto_613027 ?auto_613029 ) ) ( not ( = ?auto_613027 ?auto_613030 ) ) ( not ( = ?auto_613028 ?auto_613029 ) ) ( not ( = ?auto_613028 ?auto_613030 ) ) ( not ( = ?auto_613029 ?auto_613030 ) ) ( ON ?auto_613028 ?auto_613029 ) ( ON ?auto_613027 ?auto_613028 ) ( ON ?auto_613026 ?auto_613027 ) ( ON ?auto_613025 ?auto_613026 ) ( CLEAR ?auto_613025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_613025 )
      ( MAKE-5PILE ?auto_613025 ?auto_613026 ?auto_613027 ?auto_613028 ?auto_613029 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_613048 - BLOCK
      ?auto_613049 - BLOCK
      ?auto_613050 - BLOCK
      ?auto_613051 - BLOCK
      ?auto_613052 - BLOCK
      ?auto_613053 - BLOCK
    )
    :vars
    (
      ?auto_613054 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_613052 ) ( ON ?auto_613053 ?auto_613054 ) ( CLEAR ?auto_613053 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_613048 ) ( ON ?auto_613049 ?auto_613048 ) ( ON ?auto_613050 ?auto_613049 ) ( ON ?auto_613051 ?auto_613050 ) ( ON ?auto_613052 ?auto_613051 ) ( not ( = ?auto_613048 ?auto_613049 ) ) ( not ( = ?auto_613048 ?auto_613050 ) ) ( not ( = ?auto_613048 ?auto_613051 ) ) ( not ( = ?auto_613048 ?auto_613052 ) ) ( not ( = ?auto_613048 ?auto_613053 ) ) ( not ( = ?auto_613048 ?auto_613054 ) ) ( not ( = ?auto_613049 ?auto_613050 ) ) ( not ( = ?auto_613049 ?auto_613051 ) ) ( not ( = ?auto_613049 ?auto_613052 ) ) ( not ( = ?auto_613049 ?auto_613053 ) ) ( not ( = ?auto_613049 ?auto_613054 ) ) ( not ( = ?auto_613050 ?auto_613051 ) ) ( not ( = ?auto_613050 ?auto_613052 ) ) ( not ( = ?auto_613050 ?auto_613053 ) ) ( not ( = ?auto_613050 ?auto_613054 ) ) ( not ( = ?auto_613051 ?auto_613052 ) ) ( not ( = ?auto_613051 ?auto_613053 ) ) ( not ( = ?auto_613051 ?auto_613054 ) ) ( not ( = ?auto_613052 ?auto_613053 ) ) ( not ( = ?auto_613052 ?auto_613054 ) ) ( not ( = ?auto_613053 ?auto_613054 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_613053 ?auto_613054 )
      ( !STACK ?auto_613053 ?auto_613052 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_613074 - BLOCK
      ?auto_613075 - BLOCK
      ?auto_613076 - BLOCK
      ?auto_613077 - BLOCK
      ?auto_613078 - BLOCK
      ?auto_613079 - BLOCK
    )
    :vars
    (
      ?auto_613080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613079 ?auto_613080 ) ( ON-TABLE ?auto_613074 ) ( ON ?auto_613075 ?auto_613074 ) ( ON ?auto_613076 ?auto_613075 ) ( ON ?auto_613077 ?auto_613076 ) ( not ( = ?auto_613074 ?auto_613075 ) ) ( not ( = ?auto_613074 ?auto_613076 ) ) ( not ( = ?auto_613074 ?auto_613077 ) ) ( not ( = ?auto_613074 ?auto_613078 ) ) ( not ( = ?auto_613074 ?auto_613079 ) ) ( not ( = ?auto_613074 ?auto_613080 ) ) ( not ( = ?auto_613075 ?auto_613076 ) ) ( not ( = ?auto_613075 ?auto_613077 ) ) ( not ( = ?auto_613075 ?auto_613078 ) ) ( not ( = ?auto_613075 ?auto_613079 ) ) ( not ( = ?auto_613075 ?auto_613080 ) ) ( not ( = ?auto_613076 ?auto_613077 ) ) ( not ( = ?auto_613076 ?auto_613078 ) ) ( not ( = ?auto_613076 ?auto_613079 ) ) ( not ( = ?auto_613076 ?auto_613080 ) ) ( not ( = ?auto_613077 ?auto_613078 ) ) ( not ( = ?auto_613077 ?auto_613079 ) ) ( not ( = ?auto_613077 ?auto_613080 ) ) ( not ( = ?auto_613078 ?auto_613079 ) ) ( not ( = ?auto_613078 ?auto_613080 ) ) ( not ( = ?auto_613079 ?auto_613080 ) ) ( CLEAR ?auto_613077 ) ( ON ?auto_613078 ?auto_613079 ) ( CLEAR ?auto_613078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_613074 ?auto_613075 ?auto_613076 ?auto_613077 ?auto_613078 )
      ( MAKE-6PILE ?auto_613074 ?auto_613075 ?auto_613076 ?auto_613077 ?auto_613078 ?auto_613079 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_613100 - BLOCK
      ?auto_613101 - BLOCK
      ?auto_613102 - BLOCK
      ?auto_613103 - BLOCK
      ?auto_613104 - BLOCK
      ?auto_613105 - BLOCK
    )
    :vars
    (
      ?auto_613106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613105 ?auto_613106 ) ( ON-TABLE ?auto_613100 ) ( ON ?auto_613101 ?auto_613100 ) ( ON ?auto_613102 ?auto_613101 ) ( not ( = ?auto_613100 ?auto_613101 ) ) ( not ( = ?auto_613100 ?auto_613102 ) ) ( not ( = ?auto_613100 ?auto_613103 ) ) ( not ( = ?auto_613100 ?auto_613104 ) ) ( not ( = ?auto_613100 ?auto_613105 ) ) ( not ( = ?auto_613100 ?auto_613106 ) ) ( not ( = ?auto_613101 ?auto_613102 ) ) ( not ( = ?auto_613101 ?auto_613103 ) ) ( not ( = ?auto_613101 ?auto_613104 ) ) ( not ( = ?auto_613101 ?auto_613105 ) ) ( not ( = ?auto_613101 ?auto_613106 ) ) ( not ( = ?auto_613102 ?auto_613103 ) ) ( not ( = ?auto_613102 ?auto_613104 ) ) ( not ( = ?auto_613102 ?auto_613105 ) ) ( not ( = ?auto_613102 ?auto_613106 ) ) ( not ( = ?auto_613103 ?auto_613104 ) ) ( not ( = ?auto_613103 ?auto_613105 ) ) ( not ( = ?auto_613103 ?auto_613106 ) ) ( not ( = ?auto_613104 ?auto_613105 ) ) ( not ( = ?auto_613104 ?auto_613106 ) ) ( not ( = ?auto_613105 ?auto_613106 ) ) ( ON ?auto_613104 ?auto_613105 ) ( CLEAR ?auto_613102 ) ( ON ?auto_613103 ?auto_613104 ) ( CLEAR ?auto_613103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_613100 ?auto_613101 ?auto_613102 ?auto_613103 )
      ( MAKE-6PILE ?auto_613100 ?auto_613101 ?auto_613102 ?auto_613103 ?auto_613104 ?auto_613105 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_613126 - BLOCK
      ?auto_613127 - BLOCK
      ?auto_613128 - BLOCK
      ?auto_613129 - BLOCK
      ?auto_613130 - BLOCK
      ?auto_613131 - BLOCK
    )
    :vars
    (
      ?auto_613132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613131 ?auto_613132 ) ( ON-TABLE ?auto_613126 ) ( ON ?auto_613127 ?auto_613126 ) ( not ( = ?auto_613126 ?auto_613127 ) ) ( not ( = ?auto_613126 ?auto_613128 ) ) ( not ( = ?auto_613126 ?auto_613129 ) ) ( not ( = ?auto_613126 ?auto_613130 ) ) ( not ( = ?auto_613126 ?auto_613131 ) ) ( not ( = ?auto_613126 ?auto_613132 ) ) ( not ( = ?auto_613127 ?auto_613128 ) ) ( not ( = ?auto_613127 ?auto_613129 ) ) ( not ( = ?auto_613127 ?auto_613130 ) ) ( not ( = ?auto_613127 ?auto_613131 ) ) ( not ( = ?auto_613127 ?auto_613132 ) ) ( not ( = ?auto_613128 ?auto_613129 ) ) ( not ( = ?auto_613128 ?auto_613130 ) ) ( not ( = ?auto_613128 ?auto_613131 ) ) ( not ( = ?auto_613128 ?auto_613132 ) ) ( not ( = ?auto_613129 ?auto_613130 ) ) ( not ( = ?auto_613129 ?auto_613131 ) ) ( not ( = ?auto_613129 ?auto_613132 ) ) ( not ( = ?auto_613130 ?auto_613131 ) ) ( not ( = ?auto_613130 ?auto_613132 ) ) ( not ( = ?auto_613131 ?auto_613132 ) ) ( ON ?auto_613130 ?auto_613131 ) ( ON ?auto_613129 ?auto_613130 ) ( CLEAR ?auto_613127 ) ( ON ?auto_613128 ?auto_613129 ) ( CLEAR ?auto_613128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_613126 ?auto_613127 ?auto_613128 )
      ( MAKE-6PILE ?auto_613126 ?auto_613127 ?auto_613128 ?auto_613129 ?auto_613130 ?auto_613131 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_613152 - BLOCK
      ?auto_613153 - BLOCK
      ?auto_613154 - BLOCK
      ?auto_613155 - BLOCK
      ?auto_613156 - BLOCK
      ?auto_613157 - BLOCK
    )
    :vars
    (
      ?auto_613158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613157 ?auto_613158 ) ( ON-TABLE ?auto_613152 ) ( not ( = ?auto_613152 ?auto_613153 ) ) ( not ( = ?auto_613152 ?auto_613154 ) ) ( not ( = ?auto_613152 ?auto_613155 ) ) ( not ( = ?auto_613152 ?auto_613156 ) ) ( not ( = ?auto_613152 ?auto_613157 ) ) ( not ( = ?auto_613152 ?auto_613158 ) ) ( not ( = ?auto_613153 ?auto_613154 ) ) ( not ( = ?auto_613153 ?auto_613155 ) ) ( not ( = ?auto_613153 ?auto_613156 ) ) ( not ( = ?auto_613153 ?auto_613157 ) ) ( not ( = ?auto_613153 ?auto_613158 ) ) ( not ( = ?auto_613154 ?auto_613155 ) ) ( not ( = ?auto_613154 ?auto_613156 ) ) ( not ( = ?auto_613154 ?auto_613157 ) ) ( not ( = ?auto_613154 ?auto_613158 ) ) ( not ( = ?auto_613155 ?auto_613156 ) ) ( not ( = ?auto_613155 ?auto_613157 ) ) ( not ( = ?auto_613155 ?auto_613158 ) ) ( not ( = ?auto_613156 ?auto_613157 ) ) ( not ( = ?auto_613156 ?auto_613158 ) ) ( not ( = ?auto_613157 ?auto_613158 ) ) ( ON ?auto_613156 ?auto_613157 ) ( ON ?auto_613155 ?auto_613156 ) ( ON ?auto_613154 ?auto_613155 ) ( CLEAR ?auto_613152 ) ( ON ?auto_613153 ?auto_613154 ) ( CLEAR ?auto_613153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_613152 ?auto_613153 )
      ( MAKE-6PILE ?auto_613152 ?auto_613153 ?auto_613154 ?auto_613155 ?auto_613156 ?auto_613157 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_613178 - BLOCK
      ?auto_613179 - BLOCK
      ?auto_613180 - BLOCK
      ?auto_613181 - BLOCK
      ?auto_613182 - BLOCK
      ?auto_613183 - BLOCK
    )
    :vars
    (
      ?auto_613184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613183 ?auto_613184 ) ( not ( = ?auto_613178 ?auto_613179 ) ) ( not ( = ?auto_613178 ?auto_613180 ) ) ( not ( = ?auto_613178 ?auto_613181 ) ) ( not ( = ?auto_613178 ?auto_613182 ) ) ( not ( = ?auto_613178 ?auto_613183 ) ) ( not ( = ?auto_613178 ?auto_613184 ) ) ( not ( = ?auto_613179 ?auto_613180 ) ) ( not ( = ?auto_613179 ?auto_613181 ) ) ( not ( = ?auto_613179 ?auto_613182 ) ) ( not ( = ?auto_613179 ?auto_613183 ) ) ( not ( = ?auto_613179 ?auto_613184 ) ) ( not ( = ?auto_613180 ?auto_613181 ) ) ( not ( = ?auto_613180 ?auto_613182 ) ) ( not ( = ?auto_613180 ?auto_613183 ) ) ( not ( = ?auto_613180 ?auto_613184 ) ) ( not ( = ?auto_613181 ?auto_613182 ) ) ( not ( = ?auto_613181 ?auto_613183 ) ) ( not ( = ?auto_613181 ?auto_613184 ) ) ( not ( = ?auto_613182 ?auto_613183 ) ) ( not ( = ?auto_613182 ?auto_613184 ) ) ( not ( = ?auto_613183 ?auto_613184 ) ) ( ON ?auto_613182 ?auto_613183 ) ( ON ?auto_613181 ?auto_613182 ) ( ON ?auto_613180 ?auto_613181 ) ( ON ?auto_613179 ?auto_613180 ) ( ON ?auto_613178 ?auto_613179 ) ( CLEAR ?auto_613178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_613178 )
      ( MAKE-6PILE ?auto_613178 ?auto_613179 ?auto_613180 ?auto_613181 ?auto_613182 ?auto_613183 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_613205 - BLOCK
      ?auto_613206 - BLOCK
      ?auto_613207 - BLOCK
      ?auto_613208 - BLOCK
      ?auto_613209 - BLOCK
      ?auto_613210 - BLOCK
      ?auto_613211 - BLOCK
    )
    :vars
    (
      ?auto_613212 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_613210 ) ( ON ?auto_613211 ?auto_613212 ) ( CLEAR ?auto_613211 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_613205 ) ( ON ?auto_613206 ?auto_613205 ) ( ON ?auto_613207 ?auto_613206 ) ( ON ?auto_613208 ?auto_613207 ) ( ON ?auto_613209 ?auto_613208 ) ( ON ?auto_613210 ?auto_613209 ) ( not ( = ?auto_613205 ?auto_613206 ) ) ( not ( = ?auto_613205 ?auto_613207 ) ) ( not ( = ?auto_613205 ?auto_613208 ) ) ( not ( = ?auto_613205 ?auto_613209 ) ) ( not ( = ?auto_613205 ?auto_613210 ) ) ( not ( = ?auto_613205 ?auto_613211 ) ) ( not ( = ?auto_613205 ?auto_613212 ) ) ( not ( = ?auto_613206 ?auto_613207 ) ) ( not ( = ?auto_613206 ?auto_613208 ) ) ( not ( = ?auto_613206 ?auto_613209 ) ) ( not ( = ?auto_613206 ?auto_613210 ) ) ( not ( = ?auto_613206 ?auto_613211 ) ) ( not ( = ?auto_613206 ?auto_613212 ) ) ( not ( = ?auto_613207 ?auto_613208 ) ) ( not ( = ?auto_613207 ?auto_613209 ) ) ( not ( = ?auto_613207 ?auto_613210 ) ) ( not ( = ?auto_613207 ?auto_613211 ) ) ( not ( = ?auto_613207 ?auto_613212 ) ) ( not ( = ?auto_613208 ?auto_613209 ) ) ( not ( = ?auto_613208 ?auto_613210 ) ) ( not ( = ?auto_613208 ?auto_613211 ) ) ( not ( = ?auto_613208 ?auto_613212 ) ) ( not ( = ?auto_613209 ?auto_613210 ) ) ( not ( = ?auto_613209 ?auto_613211 ) ) ( not ( = ?auto_613209 ?auto_613212 ) ) ( not ( = ?auto_613210 ?auto_613211 ) ) ( not ( = ?auto_613210 ?auto_613212 ) ) ( not ( = ?auto_613211 ?auto_613212 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_613211 ?auto_613212 )
      ( !STACK ?auto_613211 ?auto_613210 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_613235 - BLOCK
      ?auto_613236 - BLOCK
      ?auto_613237 - BLOCK
      ?auto_613238 - BLOCK
      ?auto_613239 - BLOCK
      ?auto_613240 - BLOCK
      ?auto_613241 - BLOCK
    )
    :vars
    (
      ?auto_613242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613241 ?auto_613242 ) ( ON-TABLE ?auto_613235 ) ( ON ?auto_613236 ?auto_613235 ) ( ON ?auto_613237 ?auto_613236 ) ( ON ?auto_613238 ?auto_613237 ) ( ON ?auto_613239 ?auto_613238 ) ( not ( = ?auto_613235 ?auto_613236 ) ) ( not ( = ?auto_613235 ?auto_613237 ) ) ( not ( = ?auto_613235 ?auto_613238 ) ) ( not ( = ?auto_613235 ?auto_613239 ) ) ( not ( = ?auto_613235 ?auto_613240 ) ) ( not ( = ?auto_613235 ?auto_613241 ) ) ( not ( = ?auto_613235 ?auto_613242 ) ) ( not ( = ?auto_613236 ?auto_613237 ) ) ( not ( = ?auto_613236 ?auto_613238 ) ) ( not ( = ?auto_613236 ?auto_613239 ) ) ( not ( = ?auto_613236 ?auto_613240 ) ) ( not ( = ?auto_613236 ?auto_613241 ) ) ( not ( = ?auto_613236 ?auto_613242 ) ) ( not ( = ?auto_613237 ?auto_613238 ) ) ( not ( = ?auto_613237 ?auto_613239 ) ) ( not ( = ?auto_613237 ?auto_613240 ) ) ( not ( = ?auto_613237 ?auto_613241 ) ) ( not ( = ?auto_613237 ?auto_613242 ) ) ( not ( = ?auto_613238 ?auto_613239 ) ) ( not ( = ?auto_613238 ?auto_613240 ) ) ( not ( = ?auto_613238 ?auto_613241 ) ) ( not ( = ?auto_613238 ?auto_613242 ) ) ( not ( = ?auto_613239 ?auto_613240 ) ) ( not ( = ?auto_613239 ?auto_613241 ) ) ( not ( = ?auto_613239 ?auto_613242 ) ) ( not ( = ?auto_613240 ?auto_613241 ) ) ( not ( = ?auto_613240 ?auto_613242 ) ) ( not ( = ?auto_613241 ?auto_613242 ) ) ( CLEAR ?auto_613239 ) ( ON ?auto_613240 ?auto_613241 ) ( CLEAR ?auto_613240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_613235 ?auto_613236 ?auto_613237 ?auto_613238 ?auto_613239 ?auto_613240 )
      ( MAKE-7PILE ?auto_613235 ?auto_613236 ?auto_613237 ?auto_613238 ?auto_613239 ?auto_613240 ?auto_613241 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_613265 - BLOCK
      ?auto_613266 - BLOCK
      ?auto_613267 - BLOCK
      ?auto_613268 - BLOCK
      ?auto_613269 - BLOCK
      ?auto_613270 - BLOCK
      ?auto_613271 - BLOCK
    )
    :vars
    (
      ?auto_613272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613271 ?auto_613272 ) ( ON-TABLE ?auto_613265 ) ( ON ?auto_613266 ?auto_613265 ) ( ON ?auto_613267 ?auto_613266 ) ( ON ?auto_613268 ?auto_613267 ) ( not ( = ?auto_613265 ?auto_613266 ) ) ( not ( = ?auto_613265 ?auto_613267 ) ) ( not ( = ?auto_613265 ?auto_613268 ) ) ( not ( = ?auto_613265 ?auto_613269 ) ) ( not ( = ?auto_613265 ?auto_613270 ) ) ( not ( = ?auto_613265 ?auto_613271 ) ) ( not ( = ?auto_613265 ?auto_613272 ) ) ( not ( = ?auto_613266 ?auto_613267 ) ) ( not ( = ?auto_613266 ?auto_613268 ) ) ( not ( = ?auto_613266 ?auto_613269 ) ) ( not ( = ?auto_613266 ?auto_613270 ) ) ( not ( = ?auto_613266 ?auto_613271 ) ) ( not ( = ?auto_613266 ?auto_613272 ) ) ( not ( = ?auto_613267 ?auto_613268 ) ) ( not ( = ?auto_613267 ?auto_613269 ) ) ( not ( = ?auto_613267 ?auto_613270 ) ) ( not ( = ?auto_613267 ?auto_613271 ) ) ( not ( = ?auto_613267 ?auto_613272 ) ) ( not ( = ?auto_613268 ?auto_613269 ) ) ( not ( = ?auto_613268 ?auto_613270 ) ) ( not ( = ?auto_613268 ?auto_613271 ) ) ( not ( = ?auto_613268 ?auto_613272 ) ) ( not ( = ?auto_613269 ?auto_613270 ) ) ( not ( = ?auto_613269 ?auto_613271 ) ) ( not ( = ?auto_613269 ?auto_613272 ) ) ( not ( = ?auto_613270 ?auto_613271 ) ) ( not ( = ?auto_613270 ?auto_613272 ) ) ( not ( = ?auto_613271 ?auto_613272 ) ) ( ON ?auto_613270 ?auto_613271 ) ( CLEAR ?auto_613268 ) ( ON ?auto_613269 ?auto_613270 ) ( CLEAR ?auto_613269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_613265 ?auto_613266 ?auto_613267 ?auto_613268 ?auto_613269 )
      ( MAKE-7PILE ?auto_613265 ?auto_613266 ?auto_613267 ?auto_613268 ?auto_613269 ?auto_613270 ?auto_613271 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_613295 - BLOCK
      ?auto_613296 - BLOCK
      ?auto_613297 - BLOCK
      ?auto_613298 - BLOCK
      ?auto_613299 - BLOCK
      ?auto_613300 - BLOCK
      ?auto_613301 - BLOCK
    )
    :vars
    (
      ?auto_613302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613301 ?auto_613302 ) ( ON-TABLE ?auto_613295 ) ( ON ?auto_613296 ?auto_613295 ) ( ON ?auto_613297 ?auto_613296 ) ( not ( = ?auto_613295 ?auto_613296 ) ) ( not ( = ?auto_613295 ?auto_613297 ) ) ( not ( = ?auto_613295 ?auto_613298 ) ) ( not ( = ?auto_613295 ?auto_613299 ) ) ( not ( = ?auto_613295 ?auto_613300 ) ) ( not ( = ?auto_613295 ?auto_613301 ) ) ( not ( = ?auto_613295 ?auto_613302 ) ) ( not ( = ?auto_613296 ?auto_613297 ) ) ( not ( = ?auto_613296 ?auto_613298 ) ) ( not ( = ?auto_613296 ?auto_613299 ) ) ( not ( = ?auto_613296 ?auto_613300 ) ) ( not ( = ?auto_613296 ?auto_613301 ) ) ( not ( = ?auto_613296 ?auto_613302 ) ) ( not ( = ?auto_613297 ?auto_613298 ) ) ( not ( = ?auto_613297 ?auto_613299 ) ) ( not ( = ?auto_613297 ?auto_613300 ) ) ( not ( = ?auto_613297 ?auto_613301 ) ) ( not ( = ?auto_613297 ?auto_613302 ) ) ( not ( = ?auto_613298 ?auto_613299 ) ) ( not ( = ?auto_613298 ?auto_613300 ) ) ( not ( = ?auto_613298 ?auto_613301 ) ) ( not ( = ?auto_613298 ?auto_613302 ) ) ( not ( = ?auto_613299 ?auto_613300 ) ) ( not ( = ?auto_613299 ?auto_613301 ) ) ( not ( = ?auto_613299 ?auto_613302 ) ) ( not ( = ?auto_613300 ?auto_613301 ) ) ( not ( = ?auto_613300 ?auto_613302 ) ) ( not ( = ?auto_613301 ?auto_613302 ) ) ( ON ?auto_613300 ?auto_613301 ) ( ON ?auto_613299 ?auto_613300 ) ( CLEAR ?auto_613297 ) ( ON ?auto_613298 ?auto_613299 ) ( CLEAR ?auto_613298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_613295 ?auto_613296 ?auto_613297 ?auto_613298 )
      ( MAKE-7PILE ?auto_613295 ?auto_613296 ?auto_613297 ?auto_613298 ?auto_613299 ?auto_613300 ?auto_613301 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_613325 - BLOCK
      ?auto_613326 - BLOCK
      ?auto_613327 - BLOCK
      ?auto_613328 - BLOCK
      ?auto_613329 - BLOCK
      ?auto_613330 - BLOCK
      ?auto_613331 - BLOCK
    )
    :vars
    (
      ?auto_613332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613331 ?auto_613332 ) ( ON-TABLE ?auto_613325 ) ( ON ?auto_613326 ?auto_613325 ) ( not ( = ?auto_613325 ?auto_613326 ) ) ( not ( = ?auto_613325 ?auto_613327 ) ) ( not ( = ?auto_613325 ?auto_613328 ) ) ( not ( = ?auto_613325 ?auto_613329 ) ) ( not ( = ?auto_613325 ?auto_613330 ) ) ( not ( = ?auto_613325 ?auto_613331 ) ) ( not ( = ?auto_613325 ?auto_613332 ) ) ( not ( = ?auto_613326 ?auto_613327 ) ) ( not ( = ?auto_613326 ?auto_613328 ) ) ( not ( = ?auto_613326 ?auto_613329 ) ) ( not ( = ?auto_613326 ?auto_613330 ) ) ( not ( = ?auto_613326 ?auto_613331 ) ) ( not ( = ?auto_613326 ?auto_613332 ) ) ( not ( = ?auto_613327 ?auto_613328 ) ) ( not ( = ?auto_613327 ?auto_613329 ) ) ( not ( = ?auto_613327 ?auto_613330 ) ) ( not ( = ?auto_613327 ?auto_613331 ) ) ( not ( = ?auto_613327 ?auto_613332 ) ) ( not ( = ?auto_613328 ?auto_613329 ) ) ( not ( = ?auto_613328 ?auto_613330 ) ) ( not ( = ?auto_613328 ?auto_613331 ) ) ( not ( = ?auto_613328 ?auto_613332 ) ) ( not ( = ?auto_613329 ?auto_613330 ) ) ( not ( = ?auto_613329 ?auto_613331 ) ) ( not ( = ?auto_613329 ?auto_613332 ) ) ( not ( = ?auto_613330 ?auto_613331 ) ) ( not ( = ?auto_613330 ?auto_613332 ) ) ( not ( = ?auto_613331 ?auto_613332 ) ) ( ON ?auto_613330 ?auto_613331 ) ( ON ?auto_613329 ?auto_613330 ) ( ON ?auto_613328 ?auto_613329 ) ( CLEAR ?auto_613326 ) ( ON ?auto_613327 ?auto_613328 ) ( CLEAR ?auto_613327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_613325 ?auto_613326 ?auto_613327 )
      ( MAKE-7PILE ?auto_613325 ?auto_613326 ?auto_613327 ?auto_613328 ?auto_613329 ?auto_613330 ?auto_613331 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_613355 - BLOCK
      ?auto_613356 - BLOCK
      ?auto_613357 - BLOCK
      ?auto_613358 - BLOCK
      ?auto_613359 - BLOCK
      ?auto_613360 - BLOCK
      ?auto_613361 - BLOCK
    )
    :vars
    (
      ?auto_613362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613361 ?auto_613362 ) ( ON-TABLE ?auto_613355 ) ( not ( = ?auto_613355 ?auto_613356 ) ) ( not ( = ?auto_613355 ?auto_613357 ) ) ( not ( = ?auto_613355 ?auto_613358 ) ) ( not ( = ?auto_613355 ?auto_613359 ) ) ( not ( = ?auto_613355 ?auto_613360 ) ) ( not ( = ?auto_613355 ?auto_613361 ) ) ( not ( = ?auto_613355 ?auto_613362 ) ) ( not ( = ?auto_613356 ?auto_613357 ) ) ( not ( = ?auto_613356 ?auto_613358 ) ) ( not ( = ?auto_613356 ?auto_613359 ) ) ( not ( = ?auto_613356 ?auto_613360 ) ) ( not ( = ?auto_613356 ?auto_613361 ) ) ( not ( = ?auto_613356 ?auto_613362 ) ) ( not ( = ?auto_613357 ?auto_613358 ) ) ( not ( = ?auto_613357 ?auto_613359 ) ) ( not ( = ?auto_613357 ?auto_613360 ) ) ( not ( = ?auto_613357 ?auto_613361 ) ) ( not ( = ?auto_613357 ?auto_613362 ) ) ( not ( = ?auto_613358 ?auto_613359 ) ) ( not ( = ?auto_613358 ?auto_613360 ) ) ( not ( = ?auto_613358 ?auto_613361 ) ) ( not ( = ?auto_613358 ?auto_613362 ) ) ( not ( = ?auto_613359 ?auto_613360 ) ) ( not ( = ?auto_613359 ?auto_613361 ) ) ( not ( = ?auto_613359 ?auto_613362 ) ) ( not ( = ?auto_613360 ?auto_613361 ) ) ( not ( = ?auto_613360 ?auto_613362 ) ) ( not ( = ?auto_613361 ?auto_613362 ) ) ( ON ?auto_613360 ?auto_613361 ) ( ON ?auto_613359 ?auto_613360 ) ( ON ?auto_613358 ?auto_613359 ) ( ON ?auto_613357 ?auto_613358 ) ( CLEAR ?auto_613355 ) ( ON ?auto_613356 ?auto_613357 ) ( CLEAR ?auto_613356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_613355 ?auto_613356 )
      ( MAKE-7PILE ?auto_613355 ?auto_613356 ?auto_613357 ?auto_613358 ?auto_613359 ?auto_613360 ?auto_613361 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_613385 - BLOCK
      ?auto_613386 - BLOCK
      ?auto_613387 - BLOCK
      ?auto_613388 - BLOCK
      ?auto_613389 - BLOCK
      ?auto_613390 - BLOCK
      ?auto_613391 - BLOCK
    )
    :vars
    (
      ?auto_613392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613391 ?auto_613392 ) ( not ( = ?auto_613385 ?auto_613386 ) ) ( not ( = ?auto_613385 ?auto_613387 ) ) ( not ( = ?auto_613385 ?auto_613388 ) ) ( not ( = ?auto_613385 ?auto_613389 ) ) ( not ( = ?auto_613385 ?auto_613390 ) ) ( not ( = ?auto_613385 ?auto_613391 ) ) ( not ( = ?auto_613385 ?auto_613392 ) ) ( not ( = ?auto_613386 ?auto_613387 ) ) ( not ( = ?auto_613386 ?auto_613388 ) ) ( not ( = ?auto_613386 ?auto_613389 ) ) ( not ( = ?auto_613386 ?auto_613390 ) ) ( not ( = ?auto_613386 ?auto_613391 ) ) ( not ( = ?auto_613386 ?auto_613392 ) ) ( not ( = ?auto_613387 ?auto_613388 ) ) ( not ( = ?auto_613387 ?auto_613389 ) ) ( not ( = ?auto_613387 ?auto_613390 ) ) ( not ( = ?auto_613387 ?auto_613391 ) ) ( not ( = ?auto_613387 ?auto_613392 ) ) ( not ( = ?auto_613388 ?auto_613389 ) ) ( not ( = ?auto_613388 ?auto_613390 ) ) ( not ( = ?auto_613388 ?auto_613391 ) ) ( not ( = ?auto_613388 ?auto_613392 ) ) ( not ( = ?auto_613389 ?auto_613390 ) ) ( not ( = ?auto_613389 ?auto_613391 ) ) ( not ( = ?auto_613389 ?auto_613392 ) ) ( not ( = ?auto_613390 ?auto_613391 ) ) ( not ( = ?auto_613390 ?auto_613392 ) ) ( not ( = ?auto_613391 ?auto_613392 ) ) ( ON ?auto_613390 ?auto_613391 ) ( ON ?auto_613389 ?auto_613390 ) ( ON ?auto_613388 ?auto_613389 ) ( ON ?auto_613387 ?auto_613388 ) ( ON ?auto_613386 ?auto_613387 ) ( ON ?auto_613385 ?auto_613386 ) ( CLEAR ?auto_613385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_613385 )
      ( MAKE-7PILE ?auto_613385 ?auto_613386 ?auto_613387 ?auto_613388 ?auto_613389 ?auto_613390 ?auto_613391 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_613416 - BLOCK
      ?auto_613417 - BLOCK
      ?auto_613418 - BLOCK
      ?auto_613419 - BLOCK
      ?auto_613420 - BLOCK
      ?auto_613421 - BLOCK
      ?auto_613422 - BLOCK
      ?auto_613423 - BLOCK
    )
    :vars
    (
      ?auto_613424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_613422 ) ( ON ?auto_613423 ?auto_613424 ) ( CLEAR ?auto_613423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_613416 ) ( ON ?auto_613417 ?auto_613416 ) ( ON ?auto_613418 ?auto_613417 ) ( ON ?auto_613419 ?auto_613418 ) ( ON ?auto_613420 ?auto_613419 ) ( ON ?auto_613421 ?auto_613420 ) ( ON ?auto_613422 ?auto_613421 ) ( not ( = ?auto_613416 ?auto_613417 ) ) ( not ( = ?auto_613416 ?auto_613418 ) ) ( not ( = ?auto_613416 ?auto_613419 ) ) ( not ( = ?auto_613416 ?auto_613420 ) ) ( not ( = ?auto_613416 ?auto_613421 ) ) ( not ( = ?auto_613416 ?auto_613422 ) ) ( not ( = ?auto_613416 ?auto_613423 ) ) ( not ( = ?auto_613416 ?auto_613424 ) ) ( not ( = ?auto_613417 ?auto_613418 ) ) ( not ( = ?auto_613417 ?auto_613419 ) ) ( not ( = ?auto_613417 ?auto_613420 ) ) ( not ( = ?auto_613417 ?auto_613421 ) ) ( not ( = ?auto_613417 ?auto_613422 ) ) ( not ( = ?auto_613417 ?auto_613423 ) ) ( not ( = ?auto_613417 ?auto_613424 ) ) ( not ( = ?auto_613418 ?auto_613419 ) ) ( not ( = ?auto_613418 ?auto_613420 ) ) ( not ( = ?auto_613418 ?auto_613421 ) ) ( not ( = ?auto_613418 ?auto_613422 ) ) ( not ( = ?auto_613418 ?auto_613423 ) ) ( not ( = ?auto_613418 ?auto_613424 ) ) ( not ( = ?auto_613419 ?auto_613420 ) ) ( not ( = ?auto_613419 ?auto_613421 ) ) ( not ( = ?auto_613419 ?auto_613422 ) ) ( not ( = ?auto_613419 ?auto_613423 ) ) ( not ( = ?auto_613419 ?auto_613424 ) ) ( not ( = ?auto_613420 ?auto_613421 ) ) ( not ( = ?auto_613420 ?auto_613422 ) ) ( not ( = ?auto_613420 ?auto_613423 ) ) ( not ( = ?auto_613420 ?auto_613424 ) ) ( not ( = ?auto_613421 ?auto_613422 ) ) ( not ( = ?auto_613421 ?auto_613423 ) ) ( not ( = ?auto_613421 ?auto_613424 ) ) ( not ( = ?auto_613422 ?auto_613423 ) ) ( not ( = ?auto_613422 ?auto_613424 ) ) ( not ( = ?auto_613423 ?auto_613424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_613423 ?auto_613424 )
      ( !STACK ?auto_613423 ?auto_613422 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_613450 - BLOCK
      ?auto_613451 - BLOCK
      ?auto_613452 - BLOCK
      ?auto_613453 - BLOCK
      ?auto_613454 - BLOCK
      ?auto_613455 - BLOCK
      ?auto_613456 - BLOCK
      ?auto_613457 - BLOCK
    )
    :vars
    (
      ?auto_613458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613457 ?auto_613458 ) ( ON-TABLE ?auto_613450 ) ( ON ?auto_613451 ?auto_613450 ) ( ON ?auto_613452 ?auto_613451 ) ( ON ?auto_613453 ?auto_613452 ) ( ON ?auto_613454 ?auto_613453 ) ( ON ?auto_613455 ?auto_613454 ) ( not ( = ?auto_613450 ?auto_613451 ) ) ( not ( = ?auto_613450 ?auto_613452 ) ) ( not ( = ?auto_613450 ?auto_613453 ) ) ( not ( = ?auto_613450 ?auto_613454 ) ) ( not ( = ?auto_613450 ?auto_613455 ) ) ( not ( = ?auto_613450 ?auto_613456 ) ) ( not ( = ?auto_613450 ?auto_613457 ) ) ( not ( = ?auto_613450 ?auto_613458 ) ) ( not ( = ?auto_613451 ?auto_613452 ) ) ( not ( = ?auto_613451 ?auto_613453 ) ) ( not ( = ?auto_613451 ?auto_613454 ) ) ( not ( = ?auto_613451 ?auto_613455 ) ) ( not ( = ?auto_613451 ?auto_613456 ) ) ( not ( = ?auto_613451 ?auto_613457 ) ) ( not ( = ?auto_613451 ?auto_613458 ) ) ( not ( = ?auto_613452 ?auto_613453 ) ) ( not ( = ?auto_613452 ?auto_613454 ) ) ( not ( = ?auto_613452 ?auto_613455 ) ) ( not ( = ?auto_613452 ?auto_613456 ) ) ( not ( = ?auto_613452 ?auto_613457 ) ) ( not ( = ?auto_613452 ?auto_613458 ) ) ( not ( = ?auto_613453 ?auto_613454 ) ) ( not ( = ?auto_613453 ?auto_613455 ) ) ( not ( = ?auto_613453 ?auto_613456 ) ) ( not ( = ?auto_613453 ?auto_613457 ) ) ( not ( = ?auto_613453 ?auto_613458 ) ) ( not ( = ?auto_613454 ?auto_613455 ) ) ( not ( = ?auto_613454 ?auto_613456 ) ) ( not ( = ?auto_613454 ?auto_613457 ) ) ( not ( = ?auto_613454 ?auto_613458 ) ) ( not ( = ?auto_613455 ?auto_613456 ) ) ( not ( = ?auto_613455 ?auto_613457 ) ) ( not ( = ?auto_613455 ?auto_613458 ) ) ( not ( = ?auto_613456 ?auto_613457 ) ) ( not ( = ?auto_613456 ?auto_613458 ) ) ( not ( = ?auto_613457 ?auto_613458 ) ) ( CLEAR ?auto_613455 ) ( ON ?auto_613456 ?auto_613457 ) ( CLEAR ?auto_613456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_613450 ?auto_613451 ?auto_613452 ?auto_613453 ?auto_613454 ?auto_613455 ?auto_613456 )
      ( MAKE-8PILE ?auto_613450 ?auto_613451 ?auto_613452 ?auto_613453 ?auto_613454 ?auto_613455 ?auto_613456 ?auto_613457 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_613484 - BLOCK
      ?auto_613485 - BLOCK
      ?auto_613486 - BLOCK
      ?auto_613487 - BLOCK
      ?auto_613488 - BLOCK
      ?auto_613489 - BLOCK
      ?auto_613490 - BLOCK
      ?auto_613491 - BLOCK
    )
    :vars
    (
      ?auto_613492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613491 ?auto_613492 ) ( ON-TABLE ?auto_613484 ) ( ON ?auto_613485 ?auto_613484 ) ( ON ?auto_613486 ?auto_613485 ) ( ON ?auto_613487 ?auto_613486 ) ( ON ?auto_613488 ?auto_613487 ) ( not ( = ?auto_613484 ?auto_613485 ) ) ( not ( = ?auto_613484 ?auto_613486 ) ) ( not ( = ?auto_613484 ?auto_613487 ) ) ( not ( = ?auto_613484 ?auto_613488 ) ) ( not ( = ?auto_613484 ?auto_613489 ) ) ( not ( = ?auto_613484 ?auto_613490 ) ) ( not ( = ?auto_613484 ?auto_613491 ) ) ( not ( = ?auto_613484 ?auto_613492 ) ) ( not ( = ?auto_613485 ?auto_613486 ) ) ( not ( = ?auto_613485 ?auto_613487 ) ) ( not ( = ?auto_613485 ?auto_613488 ) ) ( not ( = ?auto_613485 ?auto_613489 ) ) ( not ( = ?auto_613485 ?auto_613490 ) ) ( not ( = ?auto_613485 ?auto_613491 ) ) ( not ( = ?auto_613485 ?auto_613492 ) ) ( not ( = ?auto_613486 ?auto_613487 ) ) ( not ( = ?auto_613486 ?auto_613488 ) ) ( not ( = ?auto_613486 ?auto_613489 ) ) ( not ( = ?auto_613486 ?auto_613490 ) ) ( not ( = ?auto_613486 ?auto_613491 ) ) ( not ( = ?auto_613486 ?auto_613492 ) ) ( not ( = ?auto_613487 ?auto_613488 ) ) ( not ( = ?auto_613487 ?auto_613489 ) ) ( not ( = ?auto_613487 ?auto_613490 ) ) ( not ( = ?auto_613487 ?auto_613491 ) ) ( not ( = ?auto_613487 ?auto_613492 ) ) ( not ( = ?auto_613488 ?auto_613489 ) ) ( not ( = ?auto_613488 ?auto_613490 ) ) ( not ( = ?auto_613488 ?auto_613491 ) ) ( not ( = ?auto_613488 ?auto_613492 ) ) ( not ( = ?auto_613489 ?auto_613490 ) ) ( not ( = ?auto_613489 ?auto_613491 ) ) ( not ( = ?auto_613489 ?auto_613492 ) ) ( not ( = ?auto_613490 ?auto_613491 ) ) ( not ( = ?auto_613490 ?auto_613492 ) ) ( not ( = ?auto_613491 ?auto_613492 ) ) ( ON ?auto_613490 ?auto_613491 ) ( CLEAR ?auto_613488 ) ( ON ?auto_613489 ?auto_613490 ) ( CLEAR ?auto_613489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_613484 ?auto_613485 ?auto_613486 ?auto_613487 ?auto_613488 ?auto_613489 )
      ( MAKE-8PILE ?auto_613484 ?auto_613485 ?auto_613486 ?auto_613487 ?auto_613488 ?auto_613489 ?auto_613490 ?auto_613491 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_613518 - BLOCK
      ?auto_613519 - BLOCK
      ?auto_613520 - BLOCK
      ?auto_613521 - BLOCK
      ?auto_613522 - BLOCK
      ?auto_613523 - BLOCK
      ?auto_613524 - BLOCK
      ?auto_613525 - BLOCK
    )
    :vars
    (
      ?auto_613526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613525 ?auto_613526 ) ( ON-TABLE ?auto_613518 ) ( ON ?auto_613519 ?auto_613518 ) ( ON ?auto_613520 ?auto_613519 ) ( ON ?auto_613521 ?auto_613520 ) ( not ( = ?auto_613518 ?auto_613519 ) ) ( not ( = ?auto_613518 ?auto_613520 ) ) ( not ( = ?auto_613518 ?auto_613521 ) ) ( not ( = ?auto_613518 ?auto_613522 ) ) ( not ( = ?auto_613518 ?auto_613523 ) ) ( not ( = ?auto_613518 ?auto_613524 ) ) ( not ( = ?auto_613518 ?auto_613525 ) ) ( not ( = ?auto_613518 ?auto_613526 ) ) ( not ( = ?auto_613519 ?auto_613520 ) ) ( not ( = ?auto_613519 ?auto_613521 ) ) ( not ( = ?auto_613519 ?auto_613522 ) ) ( not ( = ?auto_613519 ?auto_613523 ) ) ( not ( = ?auto_613519 ?auto_613524 ) ) ( not ( = ?auto_613519 ?auto_613525 ) ) ( not ( = ?auto_613519 ?auto_613526 ) ) ( not ( = ?auto_613520 ?auto_613521 ) ) ( not ( = ?auto_613520 ?auto_613522 ) ) ( not ( = ?auto_613520 ?auto_613523 ) ) ( not ( = ?auto_613520 ?auto_613524 ) ) ( not ( = ?auto_613520 ?auto_613525 ) ) ( not ( = ?auto_613520 ?auto_613526 ) ) ( not ( = ?auto_613521 ?auto_613522 ) ) ( not ( = ?auto_613521 ?auto_613523 ) ) ( not ( = ?auto_613521 ?auto_613524 ) ) ( not ( = ?auto_613521 ?auto_613525 ) ) ( not ( = ?auto_613521 ?auto_613526 ) ) ( not ( = ?auto_613522 ?auto_613523 ) ) ( not ( = ?auto_613522 ?auto_613524 ) ) ( not ( = ?auto_613522 ?auto_613525 ) ) ( not ( = ?auto_613522 ?auto_613526 ) ) ( not ( = ?auto_613523 ?auto_613524 ) ) ( not ( = ?auto_613523 ?auto_613525 ) ) ( not ( = ?auto_613523 ?auto_613526 ) ) ( not ( = ?auto_613524 ?auto_613525 ) ) ( not ( = ?auto_613524 ?auto_613526 ) ) ( not ( = ?auto_613525 ?auto_613526 ) ) ( ON ?auto_613524 ?auto_613525 ) ( ON ?auto_613523 ?auto_613524 ) ( CLEAR ?auto_613521 ) ( ON ?auto_613522 ?auto_613523 ) ( CLEAR ?auto_613522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_613518 ?auto_613519 ?auto_613520 ?auto_613521 ?auto_613522 )
      ( MAKE-8PILE ?auto_613518 ?auto_613519 ?auto_613520 ?auto_613521 ?auto_613522 ?auto_613523 ?auto_613524 ?auto_613525 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_613552 - BLOCK
      ?auto_613553 - BLOCK
      ?auto_613554 - BLOCK
      ?auto_613555 - BLOCK
      ?auto_613556 - BLOCK
      ?auto_613557 - BLOCK
      ?auto_613558 - BLOCK
      ?auto_613559 - BLOCK
    )
    :vars
    (
      ?auto_613560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613559 ?auto_613560 ) ( ON-TABLE ?auto_613552 ) ( ON ?auto_613553 ?auto_613552 ) ( ON ?auto_613554 ?auto_613553 ) ( not ( = ?auto_613552 ?auto_613553 ) ) ( not ( = ?auto_613552 ?auto_613554 ) ) ( not ( = ?auto_613552 ?auto_613555 ) ) ( not ( = ?auto_613552 ?auto_613556 ) ) ( not ( = ?auto_613552 ?auto_613557 ) ) ( not ( = ?auto_613552 ?auto_613558 ) ) ( not ( = ?auto_613552 ?auto_613559 ) ) ( not ( = ?auto_613552 ?auto_613560 ) ) ( not ( = ?auto_613553 ?auto_613554 ) ) ( not ( = ?auto_613553 ?auto_613555 ) ) ( not ( = ?auto_613553 ?auto_613556 ) ) ( not ( = ?auto_613553 ?auto_613557 ) ) ( not ( = ?auto_613553 ?auto_613558 ) ) ( not ( = ?auto_613553 ?auto_613559 ) ) ( not ( = ?auto_613553 ?auto_613560 ) ) ( not ( = ?auto_613554 ?auto_613555 ) ) ( not ( = ?auto_613554 ?auto_613556 ) ) ( not ( = ?auto_613554 ?auto_613557 ) ) ( not ( = ?auto_613554 ?auto_613558 ) ) ( not ( = ?auto_613554 ?auto_613559 ) ) ( not ( = ?auto_613554 ?auto_613560 ) ) ( not ( = ?auto_613555 ?auto_613556 ) ) ( not ( = ?auto_613555 ?auto_613557 ) ) ( not ( = ?auto_613555 ?auto_613558 ) ) ( not ( = ?auto_613555 ?auto_613559 ) ) ( not ( = ?auto_613555 ?auto_613560 ) ) ( not ( = ?auto_613556 ?auto_613557 ) ) ( not ( = ?auto_613556 ?auto_613558 ) ) ( not ( = ?auto_613556 ?auto_613559 ) ) ( not ( = ?auto_613556 ?auto_613560 ) ) ( not ( = ?auto_613557 ?auto_613558 ) ) ( not ( = ?auto_613557 ?auto_613559 ) ) ( not ( = ?auto_613557 ?auto_613560 ) ) ( not ( = ?auto_613558 ?auto_613559 ) ) ( not ( = ?auto_613558 ?auto_613560 ) ) ( not ( = ?auto_613559 ?auto_613560 ) ) ( ON ?auto_613558 ?auto_613559 ) ( ON ?auto_613557 ?auto_613558 ) ( ON ?auto_613556 ?auto_613557 ) ( CLEAR ?auto_613554 ) ( ON ?auto_613555 ?auto_613556 ) ( CLEAR ?auto_613555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_613552 ?auto_613553 ?auto_613554 ?auto_613555 )
      ( MAKE-8PILE ?auto_613552 ?auto_613553 ?auto_613554 ?auto_613555 ?auto_613556 ?auto_613557 ?auto_613558 ?auto_613559 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_613586 - BLOCK
      ?auto_613587 - BLOCK
      ?auto_613588 - BLOCK
      ?auto_613589 - BLOCK
      ?auto_613590 - BLOCK
      ?auto_613591 - BLOCK
      ?auto_613592 - BLOCK
      ?auto_613593 - BLOCK
    )
    :vars
    (
      ?auto_613594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613593 ?auto_613594 ) ( ON-TABLE ?auto_613586 ) ( ON ?auto_613587 ?auto_613586 ) ( not ( = ?auto_613586 ?auto_613587 ) ) ( not ( = ?auto_613586 ?auto_613588 ) ) ( not ( = ?auto_613586 ?auto_613589 ) ) ( not ( = ?auto_613586 ?auto_613590 ) ) ( not ( = ?auto_613586 ?auto_613591 ) ) ( not ( = ?auto_613586 ?auto_613592 ) ) ( not ( = ?auto_613586 ?auto_613593 ) ) ( not ( = ?auto_613586 ?auto_613594 ) ) ( not ( = ?auto_613587 ?auto_613588 ) ) ( not ( = ?auto_613587 ?auto_613589 ) ) ( not ( = ?auto_613587 ?auto_613590 ) ) ( not ( = ?auto_613587 ?auto_613591 ) ) ( not ( = ?auto_613587 ?auto_613592 ) ) ( not ( = ?auto_613587 ?auto_613593 ) ) ( not ( = ?auto_613587 ?auto_613594 ) ) ( not ( = ?auto_613588 ?auto_613589 ) ) ( not ( = ?auto_613588 ?auto_613590 ) ) ( not ( = ?auto_613588 ?auto_613591 ) ) ( not ( = ?auto_613588 ?auto_613592 ) ) ( not ( = ?auto_613588 ?auto_613593 ) ) ( not ( = ?auto_613588 ?auto_613594 ) ) ( not ( = ?auto_613589 ?auto_613590 ) ) ( not ( = ?auto_613589 ?auto_613591 ) ) ( not ( = ?auto_613589 ?auto_613592 ) ) ( not ( = ?auto_613589 ?auto_613593 ) ) ( not ( = ?auto_613589 ?auto_613594 ) ) ( not ( = ?auto_613590 ?auto_613591 ) ) ( not ( = ?auto_613590 ?auto_613592 ) ) ( not ( = ?auto_613590 ?auto_613593 ) ) ( not ( = ?auto_613590 ?auto_613594 ) ) ( not ( = ?auto_613591 ?auto_613592 ) ) ( not ( = ?auto_613591 ?auto_613593 ) ) ( not ( = ?auto_613591 ?auto_613594 ) ) ( not ( = ?auto_613592 ?auto_613593 ) ) ( not ( = ?auto_613592 ?auto_613594 ) ) ( not ( = ?auto_613593 ?auto_613594 ) ) ( ON ?auto_613592 ?auto_613593 ) ( ON ?auto_613591 ?auto_613592 ) ( ON ?auto_613590 ?auto_613591 ) ( ON ?auto_613589 ?auto_613590 ) ( CLEAR ?auto_613587 ) ( ON ?auto_613588 ?auto_613589 ) ( CLEAR ?auto_613588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_613586 ?auto_613587 ?auto_613588 )
      ( MAKE-8PILE ?auto_613586 ?auto_613587 ?auto_613588 ?auto_613589 ?auto_613590 ?auto_613591 ?auto_613592 ?auto_613593 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_613620 - BLOCK
      ?auto_613621 - BLOCK
      ?auto_613622 - BLOCK
      ?auto_613623 - BLOCK
      ?auto_613624 - BLOCK
      ?auto_613625 - BLOCK
      ?auto_613626 - BLOCK
      ?auto_613627 - BLOCK
    )
    :vars
    (
      ?auto_613628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613627 ?auto_613628 ) ( ON-TABLE ?auto_613620 ) ( not ( = ?auto_613620 ?auto_613621 ) ) ( not ( = ?auto_613620 ?auto_613622 ) ) ( not ( = ?auto_613620 ?auto_613623 ) ) ( not ( = ?auto_613620 ?auto_613624 ) ) ( not ( = ?auto_613620 ?auto_613625 ) ) ( not ( = ?auto_613620 ?auto_613626 ) ) ( not ( = ?auto_613620 ?auto_613627 ) ) ( not ( = ?auto_613620 ?auto_613628 ) ) ( not ( = ?auto_613621 ?auto_613622 ) ) ( not ( = ?auto_613621 ?auto_613623 ) ) ( not ( = ?auto_613621 ?auto_613624 ) ) ( not ( = ?auto_613621 ?auto_613625 ) ) ( not ( = ?auto_613621 ?auto_613626 ) ) ( not ( = ?auto_613621 ?auto_613627 ) ) ( not ( = ?auto_613621 ?auto_613628 ) ) ( not ( = ?auto_613622 ?auto_613623 ) ) ( not ( = ?auto_613622 ?auto_613624 ) ) ( not ( = ?auto_613622 ?auto_613625 ) ) ( not ( = ?auto_613622 ?auto_613626 ) ) ( not ( = ?auto_613622 ?auto_613627 ) ) ( not ( = ?auto_613622 ?auto_613628 ) ) ( not ( = ?auto_613623 ?auto_613624 ) ) ( not ( = ?auto_613623 ?auto_613625 ) ) ( not ( = ?auto_613623 ?auto_613626 ) ) ( not ( = ?auto_613623 ?auto_613627 ) ) ( not ( = ?auto_613623 ?auto_613628 ) ) ( not ( = ?auto_613624 ?auto_613625 ) ) ( not ( = ?auto_613624 ?auto_613626 ) ) ( not ( = ?auto_613624 ?auto_613627 ) ) ( not ( = ?auto_613624 ?auto_613628 ) ) ( not ( = ?auto_613625 ?auto_613626 ) ) ( not ( = ?auto_613625 ?auto_613627 ) ) ( not ( = ?auto_613625 ?auto_613628 ) ) ( not ( = ?auto_613626 ?auto_613627 ) ) ( not ( = ?auto_613626 ?auto_613628 ) ) ( not ( = ?auto_613627 ?auto_613628 ) ) ( ON ?auto_613626 ?auto_613627 ) ( ON ?auto_613625 ?auto_613626 ) ( ON ?auto_613624 ?auto_613625 ) ( ON ?auto_613623 ?auto_613624 ) ( ON ?auto_613622 ?auto_613623 ) ( CLEAR ?auto_613620 ) ( ON ?auto_613621 ?auto_613622 ) ( CLEAR ?auto_613621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_613620 ?auto_613621 )
      ( MAKE-8PILE ?auto_613620 ?auto_613621 ?auto_613622 ?auto_613623 ?auto_613624 ?auto_613625 ?auto_613626 ?auto_613627 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_613654 - BLOCK
      ?auto_613655 - BLOCK
      ?auto_613656 - BLOCK
      ?auto_613657 - BLOCK
      ?auto_613658 - BLOCK
      ?auto_613659 - BLOCK
      ?auto_613660 - BLOCK
      ?auto_613661 - BLOCK
    )
    :vars
    (
      ?auto_613662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613661 ?auto_613662 ) ( not ( = ?auto_613654 ?auto_613655 ) ) ( not ( = ?auto_613654 ?auto_613656 ) ) ( not ( = ?auto_613654 ?auto_613657 ) ) ( not ( = ?auto_613654 ?auto_613658 ) ) ( not ( = ?auto_613654 ?auto_613659 ) ) ( not ( = ?auto_613654 ?auto_613660 ) ) ( not ( = ?auto_613654 ?auto_613661 ) ) ( not ( = ?auto_613654 ?auto_613662 ) ) ( not ( = ?auto_613655 ?auto_613656 ) ) ( not ( = ?auto_613655 ?auto_613657 ) ) ( not ( = ?auto_613655 ?auto_613658 ) ) ( not ( = ?auto_613655 ?auto_613659 ) ) ( not ( = ?auto_613655 ?auto_613660 ) ) ( not ( = ?auto_613655 ?auto_613661 ) ) ( not ( = ?auto_613655 ?auto_613662 ) ) ( not ( = ?auto_613656 ?auto_613657 ) ) ( not ( = ?auto_613656 ?auto_613658 ) ) ( not ( = ?auto_613656 ?auto_613659 ) ) ( not ( = ?auto_613656 ?auto_613660 ) ) ( not ( = ?auto_613656 ?auto_613661 ) ) ( not ( = ?auto_613656 ?auto_613662 ) ) ( not ( = ?auto_613657 ?auto_613658 ) ) ( not ( = ?auto_613657 ?auto_613659 ) ) ( not ( = ?auto_613657 ?auto_613660 ) ) ( not ( = ?auto_613657 ?auto_613661 ) ) ( not ( = ?auto_613657 ?auto_613662 ) ) ( not ( = ?auto_613658 ?auto_613659 ) ) ( not ( = ?auto_613658 ?auto_613660 ) ) ( not ( = ?auto_613658 ?auto_613661 ) ) ( not ( = ?auto_613658 ?auto_613662 ) ) ( not ( = ?auto_613659 ?auto_613660 ) ) ( not ( = ?auto_613659 ?auto_613661 ) ) ( not ( = ?auto_613659 ?auto_613662 ) ) ( not ( = ?auto_613660 ?auto_613661 ) ) ( not ( = ?auto_613660 ?auto_613662 ) ) ( not ( = ?auto_613661 ?auto_613662 ) ) ( ON ?auto_613660 ?auto_613661 ) ( ON ?auto_613659 ?auto_613660 ) ( ON ?auto_613658 ?auto_613659 ) ( ON ?auto_613657 ?auto_613658 ) ( ON ?auto_613656 ?auto_613657 ) ( ON ?auto_613655 ?auto_613656 ) ( ON ?auto_613654 ?auto_613655 ) ( CLEAR ?auto_613654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_613654 )
      ( MAKE-8PILE ?auto_613654 ?auto_613655 ?auto_613656 ?auto_613657 ?auto_613658 ?auto_613659 ?auto_613660 ?auto_613661 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_613689 - BLOCK
      ?auto_613690 - BLOCK
      ?auto_613691 - BLOCK
      ?auto_613692 - BLOCK
      ?auto_613693 - BLOCK
      ?auto_613694 - BLOCK
      ?auto_613695 - BLOCK
      ?auto_613696 - BLOCK
      ?auto_613697 - BLOCK
    )
    :vars
    (
      ?auto_613698 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_613696 ) ( ON ?auto_613697 ?auto_613698 ) ( CLEAR ?auto_613697 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_613689 ) ( ON ?auto_613690 ?auto_613689 ) ( ON ?auto_613691 ?auto_613690 ) ( ON ?auto_613692 ?auto_613691 ) ( ON ?auto_613693 ?auto_613692 ) ( ON ?auto_613694 ?auto_613693 ) ( ON ?auto_613695 ?auto_613694 ) ( ON ?auto_613696 ?auto_613695 ) ( not ( = ?auto_613689 ?auto_613690 ) ) ( not ( = ?auto_613689 ?auto_613691 ) ) ( not ( = ?auto_613689 ?auto_613692 ) ) ( not ( = ?auto_613689 ?auto_613693 ) ) ( not ( = ?auto_613689 ?auto_613694 ) ) ( not ( = ?auto_613689 ?auto_613695 ) ) ( not ( = ?auto_613689 ?auto_613696 ) ) ( not ( = ?auto_613689 ?auto_613697 ) ) ( not ( = ?auto_613689 ?auto_613698 ) ) ( not ( = ?auto_613690 ?auto_613691 ) ) ( not ( = ?auto_613690 ?auto_613692 ) ) ( not ( = ?auto_613690 ?auto_613693 ) ) ( not ( = ?auto_613690 ?auto_613694 ) ) ( not ( = ?auto_613690 ?auto_613695 ) ) ( not ( = ?auto_613690 ?auto_613696 ) ) ( not ( = ?auto_613690 ?auto_613697 ) ) ( not ( = ?auto_613690 ?auto_613698 ) ) ( not ( = ?auto_613691 ?auto_613692 ) ) ( not ( = ?auto_613691 ?auto_613693 ) ) ( not ( = ?auto_613691 ?auto_613694 ) ) ( not ( = ?auto_613691 ?auto_613695 ) ) ( not ( = ?auto_613691 ?auto_613696 ) ) ( not ( = ?auto_613691 ?auto_613697 ) ) ( not ( = ?auto_613691 ?auto_613698 ) ) ( not ( = ?auto_613692 ?auto_613693 ) ) ( not ( = ?auto_613692 ?auto_613694 ) ) ( not ( = ?auto_613692 ?auto_613695 ) ) ( not ( = ?auto_613692 ?auto_613696 ) ) ( not ( = ?auto_613692 ?auto_613697 ) ) ( not ( = ?auto_613692 ?auto_613698 ) ) ( not ( = ?auto_613693 ?auto_613694 ) ) ( not ( = ?auto_613693 ?auto_613695 ) ) ( not ( = ?auto_613693 ?auto_613696 ) ) ( not ( = ?auto_613693 ?auto_613697 ) ) ( not ( = ?auto_613693 ?auto_613698 ) ) ( not ( = ?auto_613694 ?auto_613695 ) ) ( not ( = ?auto_613694 ?auto_613696 ) ) ( not ( = ?auto_613694 ?auto_613697 ) ) ( not ( = ?auto_613694 ?auto_613698 ) ) ( not ( = ?auto_613695 ?auto_613696 ) ) ( not ( = ?auto_613695 ?auto_613697 ) ) ( not ( = ?auto_613695 ?auto_613698 ) ) ( not ( = ?auto_613696 ?auto_613697 ) ) ( not ( = ?auto_613696 ?auto_613698 ) ) ( not ( = ?auto_613697 ?auto_613698 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_613697 ?auto_613698 )
      ( !STACK ?auto_613697 ?auto_613696 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_613727 - BLOCK
      ?auto_613728 - BLOCK
      ?auto_613729 - BLOCK
      ?auto_613730 - BLOCK
      ?auto_613731 - BLOCK
      ?auto_613732 - BLOCK
      ?auto_613733 - BLOCK
      ?auto_613734 - BLOCK
      ?auto_613735 - BLOCK
    )
    :vars
    (
      ?auto_613736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613735 ?auto_613736 ) ( ON-TABLE ?auto_613727 ) ( ON ?auto_613728 ?auto_613727 ) ( ON ?auto_613729 ?auto_613728 ) ( ON ?auto_613730 ?auto_613729 ) ( ON ?auto_613731 ?auto_613730 ) ( ON ?auto_613732 ?auto_613731 ) ( ON ?auto_613733 ?auto_613732 ) ( not ( = ?auto_613727 ?auto_613728 ) ) ( not ( = ?auto_613727 ?auto_613729 ) ) ( not ( = ?auto_613727 ?auto_613730 ) ) ( not ( = ?auto_613727 ?auto_613731 ) ) ( not ( = ?auto_613727 ?auto_613732 ) ) ( not ( = ?auto_613727 ?auto_613733 ) ) ( not ( = ?auto_613727 ?auto_613734 ) ) ( not ( = ?auto_613727 ?auto_613735 ) ) ( not ( = ?auto_613727 ?auto_613736 ) ) ( not ( = ?auto_613728 ?auto_613729 ) ) ( not ( = ?auto_613728 ?auto_613730 ) ) ( not ( = ?auto_613728 ?auto_613731 ) ) ( not ( = ?auto_613728 ?auto_613732 ) ) ( not ( = ?auto_613728 ?auto_613733 ) ) ( not ( = ?auto_613728 ?auto_613734 ) ) ( not ( = ?auto_613728 ?auto_613735 ) ) ( not ( = ?auto_613728 ?auto_613736 ) ) ( not ( = ?auto_613729 ?auto_613730 ) ) ( not ( = ?auto_613729 ?auto_613731 ) ) ( not ( = ?auto_613729 ?auto_613732 ) ) ( not ( = ?auto_613729 ?auto_613733 ) ) ( not ( = ?auto_613729 ?auto_613734 ) ) ( not ( = ?auto_613729 ?auto_613735 ) ) ( not ( = ?auto_613729 ?auto_613736 ) ) ( not ( = ?auto_613730 ?auto_613731 ) ) ( not ( = ?auto_613730 ?auto_613732 ) ) ( not ( = ?auto_613730 ?auto_613733 ) ) ( not ( = ?auto_613730 ?auto_613734 ) ) ( not ( = ?auto_613730 ?auto_613735 ) ) ( not ( = ?auto_613730 ?auto_613736 ) ) ( not ( = ?auto_613731 ?auto_613732 ) ) ( not ( = ?auto_613731 ?auto_613733 ) ) ( not ( = ?auto_613731 ?auto_613734 ) ) ( not ( = ?auto_613731 ?auto_613735 ) ) ( not ( = ?auto_613731 ?auto_613736 ) ) ( not ( = ?auto_613732 ?auto_613733 ) ) ( not ( = ?auto_613732 ?auto_613734 ) ) ( not ( = ?auto_613732 ?auto_613735 ) ) ( not ( = ?auto_613732 ?auto_613736 ) ) ( not ( = ?auto_613733 ?auto_613734 ) ) ( not ( = ?auto_613733 ?auto_613735 ) ) ( not ( = ?auto_613733 ?auto_613736 ) ) ( not ( = ?auto_613734 ?auto_613735 ) ) ( not ( = ?auto_613734 ?auto_613736 ) ) ( not ( = ?auto_613735 ?auto_613736 ) ) ( CLEAR ?auto_613733 ) ( ON ?auto_613734 ?auto_613735 ) ( CLEAR ?auto_613734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_613727 ?auto_613728 ?auto_613729 ?auto_613730 ?auto_613731 ?auto_613732 ?auto_613733 ?auto_613734 )
      ( MAKE-9PILE ?auto_613727 ?auto_613728 ?auto_613729 ?auto_613730 ?auto_613731 ?auto_613732 ?auto_613733 ?auto_613734 ?auto_613735 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_613765 - BLOCK
      ?auto_613766 - BLOCK
      ?auto_613767 - BLOCK
      ?auto_613768 - BLOCK
      ?auto_613769 - BLOCK
      ?auto_613770 - BLOCK
      ?auto_613771 - BLOCK
      ?auto_613772 - BLOCK
      ?auto_613773 - BLOCK
    )
    :vars
    (
      ?auto_613774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613773 ?auto_613774 ) ( ON-TABLE ?auto_613765 ) ( ON ?auto_613766 ?auto_613765 ) ( ON ?auto_613767 ?auto_613766 ) ( ON ?auto_613768 ?auto_613767 ) ( ON ?auto_613769 ?auto_613768 ) ( ON ?auto_613770 ?auto_613769 ) ( not ( = ?auto_613765 ?auto_613766 ) ) ( not ( = ?auto_613765 ?auto_613767 ) ) ( not ( = ?auto_613765 ?auto_613768 ) ) ( not ( = ?auto_613765 ?auto_613769 ) ) ( not ( = ?auto_613765 ?auto_613770 ) ) ( not ( = ?auto_613765 ?auto_613771 ) ) ( not ( = ?auto_613765 ?auto_613772 ) ) ( not ( = ?auto_613765 ?auto_613773 ) ) ( not ( = ?auto_613765 ?auto_613774 ) ) ( not ( = ?auto_613766 ?auto_613767 ) ) ( not ( = ?auto_613766 ?auto_613768 ) ) ( not ( = ?auto_613766 ?auto_613769 ) ) ( not ( = ?auto_613766 ?auto_613770 ) ) ( not ( = ?auto_613766 ?auto_613771 ) ) ( not ( = ?auto_613766 ?auto_613772 ) ) ( not ( = ?auto_613766 ?auto_613773 ) ) ( not ( = ?auto_613766 ?auto_613774 ) ) ( not ( = ?auto_613767 ?auto_613768 ) ) ( not ( = ?auto_613767 ?auto_613769 ) ) ( not ( = ?auto_613767 ?auto_613770 ) ) ( not ( = ?auto_613767 ?auto_613771 ) ) ( not ( = ?auto_613767 ?auto_613772 ) ) ( not ( = ?auto_613767 ?auto_613773 ) ) ( not ( = ?auto_613767 ?auto_613774 ) ) ( not ( = ?auto_613768 ?auto_613769 ) ) ( not ( = ?auto_613768 ?auto_613770 ) ) ( not ( = ?auto_613768 ?auto_613771 ) ) ( not ( = ?auto_613768 ?auto_613772 ) ) ( not ( = ?auto_613768 ?auto_613773 ) ) ( not ( = ?auto_613768 ?auto_613774 ) ) ( not ( = ?auto_613769 ?auto_613770 ) ) ( not ( = ?auto_613769 ?auto_613771 ) ) ( not ( = ?auto_613769 ?auto_613772 ) ) ( not ( = ?auto_613769 ?auto_613773 ) ) ( not ( = ?auto_613769 ?auto_613774 ) ) ( not ( = ?auto_613770 ?auto_613771 ) ) ( not ( = ?auto_613770 ?auto_613772 ) ) ( not ( = ?auto_613770 ?auto_613773 ) ) ( not ( = ?auto_613770 ?auto_613774 ) ) ( not ( = ?auto_613771 ?auto_613772 ) ) ( not ( = ?auto_613771 ?auto_613773 ) ) ( not ( = ?auto_613771 ?auto_613774 ) ) ( not ( = ?auto_613772 ?auto_613773 ) ) ( not ( = ?auto_613772 ?auto_613774 ) ) ( not ( = ?auto_613773 ?auto_613774 ) ) ( ON ?auto_613772 ?auto_613773 ) ( CLEAR ?auto_613770 ) ( ON ?auto_613771 ?auto_613772 ) ( CLEAR ?auto_613771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_613765 ?auto_613766 ?auto_613767 ?auto_613768 ?auto_613769 ?auto_613770 ?auto_613771 )
      ( MAKE-9PILE ?auto_613765 ?auto_613766 ?auto_613767 ?auto_613768 ?auto_613769 ?auto_613770 ?auto_613771 ?auto_613772 ?auto_613773 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_613803 - BLOCK
      ?auto_613804 - BLOCK
      ?auto_613805 - BLOCK
      ?auto_613806 - BLOCK
      ?auto_613807 - BLOCK
      ?auto_613808 - BLOCK
      ?auto_613809 - BLOCK
      ?auto_613810 - BLOCK
      ?auto_613811 - BLOCK
    )
    :vars
    (
      ?auto_613812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613811 ?auto_613812 ) ( ON-TABLE ?auto_613803 ) ( ON ?auto_613804 ?auto_613803 ) ( ON ?auto_613805 ?auto_613804 ) ( ON ?auto_613806 ?auto_613805 ) ( ON ?auto_613807 ?auto_613806 ) ( not ( = ?auto_613803 ?auto_613804 ) ) ( not ( = ?auto_613803 ?auto_613805 ) ) ( not ( = ?auto_613803 ?auto_613806 ) ) ( not ( = ?auto_613803 ?auto_613807 ) ) ( not ( = ?auto_613803 ?auto_613808 ) ) ( not ( = ?auto_613803 ?auto_613809 ) ) ( not ( = ?auto_613803 ?auto_613810 ) ) ( not ( = ?auto_613803 ?auto_613811 ) ) ( not ( = ?auto_613803 ?auto_613812 ) ) ( not ( = ?auto_613804 ?auto_613805 ) ) ( not ( = ?auto_613804 ?auto_613806 ) ) ( not ( = ?auto_613804 ?auto_613807 ) ) ( not ( = ?auto_613804 ?auto_613808 ) ) ( not ( = ?auto_613804 ?auto_613809 ) ) ( not ( = ?auto_613804 ?auto_613810 ) ) ( not ( = ?auto_613804 ?auto_613811 ) ) ( not ( = ?auto_613804 ?auto_613812 ) ) ( not ( = ?auto_613805 ?auto_613806 ) ) ( not ( = ?auto_613805 ?auto_613807 ) ) ( not ( = ?auto_613805 ?auto_613808 ) ) ( not ( = ?auto_613805 ?auto_613809 ) ) ( not ( = ?auto_613805 ?auto_613810 ) ) ( not ( = ?auto_613805 ?auto_613811 ) ) ( not ( = ?auto_613805 ?auto_613812 ) ) ( not ( = ?auto_613806 ?auto_613807 ) ) ( not ( = ?auto_613806 ?auto_613808 ) ) ( not ( = ?auto_613806 ?auto_613809 ) ) ( not ( = ?auto_613806 ?auto_613810 ) ) ( not ( = ?auto_613806 ?auto_613811 ) ) ( not ( = ?auto_613806 ?auto_613812 ) ) ( not ( = ?auto_613807 ?auto_613808 ) ) ( not ( = ?auto_613807 ?auto_613809 ) ) ( not ( = ?auto_613807 ?auto_613810 ) ) ( not ( = ?auto_613807 ?auto_613811 ) ) ( not ( = ?auto_613807 ?auto_613812 ) ) ( not ( = ?auto_613808 ?auto_613809 ) ) ( not ( = ?auto_613808 ?auto_613810 ) ) ( not ( = ?auto_613808 ?auto_613811 ) ) ( not ( = ?auto_613808 ?auto_613812 ) ) ( not ( = ?auto_613809 ?auto_613810 ) ) ( not ( = ?auto_613809 ?auto_613811 ) ) ( not ( = ?auto_613809 ?auto_613812 ) ) ( not ( = ?auto_613810 ?auto_613811 ) ) ( not ( = ?auto_613810 ?auto_613812 ) ) ( not ( = ?auto_613811 ?auto_613812 ) ) ( ON ?auto_613810 ?auto_613811 ) ( ON ?auto_613809 ?auto_613810 ) ( CLEAR ?auto_613807 ) ( ON ?auto_613808 ?auto_613809 ) ( CLEAR ?auto_613808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_613803 ?auto_613804 ?auto_613805 ?auto_613806 ?auto_613807 ?auto_613808 )
      ( MAKE-9PILE ?auto_613803 ?auto_613804 ?auto_613805 ?auto_613806 ?auto_613807 ?auto_613808 ?auto_613809 ?auto_613810 ?auto_613811 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_613841 - BLOCK
      ?auto_613842 - BLOCK
      ?auto_613843 - BLOCK
      ?auto_613844 - BLOCK
      ?auto_613845 - BLOCK
      ?auto_613846 - BLOCK
      ?auto_613847 - BLOCK
      ?auto_613848 - BLOCK
      ?auto_613849 - BLOCK
    )
    :vars
    (
      ?auto_613850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613849 ?auto_613850 ) ( ON-TABLE ?auto_613841 ) ( ON ?auto_613842 ?auto_613841 ) ( ON ?auto_613843 ?auto_613842 ) ( ON ?auto_613844 ?auto_613843 ) ( not ( = ?auto_613841 ?auto_613842 ) ) ( not ( = ?auto_613841 ?auto_613843 ) ) ( not ( = ?auto_613841 ?auto_613844 ) ) ( not ( = ?auto_613841 ?auto_613845 ) ) ( not ( = ?auto_613841 ?auto_613846 ) ) ( not ( = ?auto_613841 ?auto_613847 ) ) ( not ( = ?auto_613841 ?auto_613848 ) ) ( not ( = ?auto_613841 ?auto_613849 ) ) ( not ( = ?auto_613841 ?auto_613850 ) ) ( not ( = ?auto_613842 ?auto_613843 ) ) ( not ( = ?auto_613842 ?auto_613844 ) ) ( not ( = ?auto_613842 ?auto_613845 ) ) ( not ( = ?auto_613842 ?auto_613846 ) ) ( not ( = ?auto_613842 ?auto_613847 ) ) ( not ( = ?auto_613842 ?auto_613848 ) ) ( not ( = ?auto_613842 ?auto_613849 ) ) ( not ( = ?auto_613842 ?auto_613850 ) ) ( not ( = ?auto_613843 ?auto_613844 ) ) ( not ( = ?auto_613843 ?auto_613845 ) ) ( not ( = ?auto_613843 ?auto_613846 ) ) ( not ( = ?auto_613843 ?auto_613847 ) ) ( not ( = ?auto_613843 ?auto_613848 ) ) ( not ( = ?auto_613843 ?auto_613849 ) ) ( not ( = ?auto_613843 ?auto_613850 ) ) ( not ( = ?auto_613844 ?auto_613845 ) ) ( not ( = ?auto_613844 ?auto_613846 ) ) ( not ( = ?auto_613844 ?auto_613847 ) ) ( not ( = ?auto_613844 ?auto_613848 ) ) ( not ( = ?auto_613844 ?auto_613849 ) ) ( not ( = ?auto_613844 ?auto_613850 ) ) ( not ( = ?auto_613845 ?auto_613846 ) ) ( not ( = ?auto_613845 ?auto_613847 ) ) ( not ( = ?auto_613845 ?auto_613848 ) ) ( not ( = ?auto_613845 ?auto_613849 ) ) ( not ( = ?auto_613845 ?auto_613850 ) ) ( not ( = ?auto_613846 ?auto_613847 ) ) ( not ( = ?auto_613846 ?auto_613848 ) ) ( not ( = ?auto_613846 ?auto_613849 ) ) ( not ( = ?auto_613846 ?auto_613850 ) ) ( not ( = ?auto_613847 ?auto_613848 ) ) ( not ( = ?auto_613847 ?auto_613849 ) ) ( not ( = ?auto_613847 ?auto_613850 ) ) ( not ( = ?auto_613848 ?auto_613849 ) ) ( not ( = ?auto_613848 ?auto_613850 ) ) ( not ( = ?auto_613849 ?auto_613850 ) ) ( ON ?auto_613848 ?auto_613849 ) ( ON ?auto_613847 ?auto_613848 ) ( ON ?auto_613846 ?auto_613847 ) ( CLEAR ?auto_613844 ) ( ON ?auto_613845 ?auto_613846 ) ( CLEAR ?auto_613845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_613841 ?auto_613842 ?auto_613843 ?auto_613844 ?auto_613845 )
      ( MAKE-9PILE ?auto_613841 ?auto_613842 ?auto_613843 ?auto_613844 ?auto_613845 ?auto_613846 ?auto_613847 ?auto_613848 ?auto_613849 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_613879 - BLOCK
      ?auto_613880 - BLOCK
      ?auto_613881 - BLOCK
      ?auto_613882 - BLOCK
      ?auto_613883 - BLOCK
      ?auto_613884 - BLOCK
      ?auto_613885 - BLOCK
      ?auto_613886 - BLOCK
      ?auto_613887 - BLOCK
    )
    :vars
    (
      ?auto_613888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613887 ?auto_613888 ) ( ON-TABLE ?auto_613879 ) ( ON ?auto_613880 ?auto_613879 ) ( ON ?auto_613881 ?auto_613880 ) ( not ( = ?auto_613879 ?auto_613880 ) ) ( not ( = ?auto_613879 ?auto_613881 ) ) ( not ( = ?auto_613879 ?auto_613882 ) ) ( not ( = ?auto_613879 ?auto_613883 ) ) ( not ( = ?auto_613879 ?auto_613884 ) ) ( not ( = ?auto_613879 ?auto_613885 ) ) ( not ( = ?auto_613879 ?auto_613886 ) ) ( not ( = ?auto_613879 ?auto_613887 ) ) ( not ( = ?auto_613879 ?auto_613888 ) ) ( not ( = ?auto_613880 ?auto_613881 ) ) ( not ( = ?auto_613880 ?auto_613882 ) ) ( not ( = ?auto_613880 ?auto_613883 ) ) ( not ( = ?auto_613880 ?auto_613884 ) ) ( not ( = ?auto_613880 ?auto_613885 ) ) ( not ( = ?auto_613880 ?auto_613886 ) ) ( not ( = ?auto_613880 ?auto_613887 ) ) ( not ( = ?auto_613880 ?auto_613888 ) ) ( not ( = ?auto_613881 ?auto_613882 ) ) ( not ( = ?auto_613881 ?auto_613883 ) ) ( not ( = ?auto_613881 ?auto_613884 ) ) ( not ( = ?auto_613881 ?auto_613885 ) ) ( not ( = ?auto_613881 ?auto_613886 ) ) ( not ( = ?auto_613881 ?auto_613887 ) ) ( not ( = ?auto_613881 ?auto_613888 ) ) ( not ( = ?auto_613882 ?auto_613883 ) ) ( not ( = ?auto_613882 ?auto_613884 ) ) ( not ( = ?auto_613882 ?auto_613885 ) ) ( not ( = ?auto_613882 ?auto_613886 ) ) ( not ( = ?auto_613882 ?auto_613887 ) ) ( not ( = ?auto_613882 ?auto_613888 ) ) ( not ( = ?auto_613883 ?auto_613884 ) ) ( not ( = ?auto_613883 ?auto_613885 ) ) ( not ( = ?auto_613883 ?auto_613886 ) ) ( not ( = ?auto_613883 ?auto_613887 ) ) ( not ( = ?auto_613883 ?auto_613888 ) ) ( not ( = ?auto_613884 ?auto_613885 ) ) ( not ( = ?auto_613884 ?auto_613886 ) ) ( not ( = ?auto_613884 ?auto_613887 ) ) ( not ( = ?auto_613884 ?auto_613888 ) ) ( not ( = ?auto_613885 ?auto_613886 ) ) ( not ( = ?auto_613885 ?auto_613887 ) ) ( not ( = ?auto_613885 ?auto_613888 ) ) ( not ( = ?auto_613886 ?auto_613887 ) ) ( not ( = ?auto_613886 ?auto_613888 ) ) ( not ( = ?auto_613887 ?auto_613888 ) ) ( ON ?auto_613886 ?auto_613887 ) ( ON ?auto_613885 ?auto_613886 ) ( ON ?auto_613884 ?auto_613885 ) ( ON ?auto_613883 ?auto_613884 ) ( CLEAR ?auto_613881 ) ( ON ?auto_613882 ?auto_613883 ) ( CLEAR ?auto_613882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_613879 ?auto_613880 ?auto_613881 ?auto_613882 )
      ( MAKE-9PILE ?auto_613879 ?auto_613880 ?auto_613881 ?auto_613882 ?auto_613883 ?auto_613884 ?auto_613885 ?auto_613886 ?auto_613887 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_613917 - BLOCK
      ?auto_613918 - BLOCK
      ?auto_613919 - BLOCK
      ?auto_613920 - BLOCK
      ?auto_613921 - BLOCK
      ?auto_613922 - BLOCK
      ?auto_613923 - BLOCK
      ?auto_613924 - BLOCK
      ?auto_613925 - BLOCK
    )
    :vars
    (
      ?auto_613926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613925 ?auto_613926 ) ( ON-TABLE ?auto_613917 ) ( ON ?auto_613918 ?auto_613917 ) ( not ( = ?auto_613917 ?auto_613918 ) ) ( not ( = ?auto_613917 ?auto_613919 ) ) ( not ( = ?auto_613917 ?auto_613920 ) ) ( not ( = ?auto_613917 ?auto_613921 ) ) ( not ( = ?auto_613917 ?auto_613922 ) ) ( not ( = ?auto_613917 ?auto_613923 ) ) ( not ( = ?auto_613917 ?auto_613924 ) ) ( not ( = ?auto_613917 ?auto_613925 ) ) ( not ( = ?auto_613917 ?auto_613926 ) ) ( not ( = ?auto_613918 ?auto_613919 ) ) ( not ( = ?auto_613918 ?auto_613920 ) ) ( not ( = ?auto_613918 ?auto_613921 ) ) ( not ( = ?auto_613918 ?auto_613922 ) ) ( not ( = ?auto_613918 ?auto_613923 ) ) ( not ( = ?auto_613918 ?auto_613924 ) ) ( not ( = ?auto_613918 ?auto_613925 ) ) ( not ( = ?auto_613918 ?auto_613926 ) ) ( not ( = ?auto_613919 ?auto_613920 ) ) ( not ( = ?auto_613919 ?auto_613921 ) ) ( not ( = ?auto_613919 ?auto_613922 ) ) ( not ( = ?auto_613919 ?auto_613923 ) ) ( not ( = ?auto_613919 ?auto_613924 ) ) ( not ( = ?auto_613919 ?auto_613925 ) ) ( not ( = ?auto_613919 ?auto_613926 ) ) ( not ( = ?auto_613920 ?auto_613921 ) ) ( not ( = ?auto_613920 ?auto_613922 ) ) ( not ( = ?auto_613920 ?auto_613923 ) ) ( not ( = ?auto_613920 ?auto_613924 ) ) ( not ( = ?auto_613920 ?auto_613925 ) ) ( not ( = ?auto_613920 ?auto_613926 ) ) ( not ( = ?auto_613921 ?auto_613922 ) ) ( not ( = ?auto_613921 ?auto_613923 ) ) ( not ( = ?auto_613921 ?auto_613924 ) ) ( not ( = ?auto_613921 ?auto_613925 ) ) ( not ( = ?auto_613921 ?auto_613926 ) ) ( not ( = ?auto_613922 ?auto_613923 ) ) ( not ( = ?auto_613922 ?auto_613924 ) ) ( not ( = ?auto_613922 ?auto_613925 ) ) ( not ( = ?auto_613922 ?auto_613926 ) ) ( not ( = ?auto_613923 ?auto_613924 ) ) ( not ( = ?auto_613923 ?auto_613925 ) ) ( not ( = ?auto_613923 ?auto_613926 ) ) ( not ( = ?auto_613924 ?auto_613925 ) ) ( not ( = ?auto_613924 ?auto_613926 ) ) ( not ( = ?auto_613925 ?auto_613926 ) ) ( ON ?auto_613924 ?auto_613925 ) ( ON ?auto_613923 ?auto_613924 ) ( ON ?auto_613922 ?auto_613923 ) ( ON ?auto_613921 ?auto_613922 ) ( ON ?auto_613920 ?auto_613921 ) ( CLEAR ?auto_613918 ) ( ON ?auto_613919 ?auto_613920 ) ( CLEAR ?auto_613919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_613917 ?auto_613918 ?auto_613919 )
      ( MAKE-9PILE ?auto_613917 ?auto_613918 ?auto_613919 ?auto_613920 ?auto_613921 ?auto_613922 ?auto_613923 ?auto_613924 ?auto_613925 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_613955 - BLOCK
      ?auto_613956 - BLOCK
      ?auto_613957 - BLOCK
      ?auto_613958 - BLOCK
      ?auto_613959 - BLOCK
      ?auto_613960 - BLOCK
      ?auto_613961 - BLOCK
      ?auto_613962 - BLOCK
      ?auto_613963 - BLOCK
    )
    :vars
    (
      ?auto_613964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_613963 ?auto_613964 ) ( ON-TABLE ?auto_613955 ) ( not ( = ?auto_613955 ?auto_613956 ) ) ( not ( = ?auto_613955 ?auto_613957 ) ) ( not ( = ?auto_613955 ?auto_613958 ) ) ( not ( = ?auto_613955 ?auto_613959 ) ) ( not ( = ?auto_613955 ?auto_613960 ) ) ( not ( = ?auto_613955 ?auto_613961 ) ) ( not ( = ?auto_613955 ?auto_613962 ) ) ( not ( = ?auto_613955 ?auto_613963 ) ) ( not ( = ?auto_613955 ?auto_613964 ) ) ( not ( = ?auto_613956 ?auto_613957 ) ) ( not ( = ?auto_613956 ?auto_613958 ) ) ( not ( = ?auto_613956 ?auto_613959 ) ) ( not ( = ?auto_613956 ?auto_613960 ) ) ( not ( = ?auto_613956 ?auto_613961 ) ) ( not ( = ?auto_613956 ?auto_613962 ) ) ( not ( = ?auto_613956 ?auto_613963 ) ) ( not ( = ?auto_613956 ?auto_613964 ) ) ( not ( = ?auto_613957 ?auto_613958 ) ) ( not ( = ?auto_613957 ?auto_613959 ) ) ( not ( = ?auto_613957 ?auto_613960 ) ) ( not ( = ?auto_613957 ?auto_613961 ) ) ( not ( = ?auto_613957 ?auto_613962 ) ) ( not ( = ?auto_613957 ?auto_613963 ) ) ( not ( = ?auto_613957 ?auto_613964 ) ) ( not ( = ?auto_613958 ?auto_613959 ) ) ( not ( = ?auto_613958 ?auto_613960 ) ) ( not ( = ?auto_613958 ?auto_613961 ) ) ( not ( = ?auto_613958 ?auto_613962 ) ) ( not ( = ?auto_613958 ?auto_613963 ) ) ( not ( = ?auto_613958 ?auto_613964 ) ) ( not ( = ?auto_613959 ?auto_613960 ) ) ( not ( = ?auto_613959 ?auto_613961 ) ) ( not ( = ?auto_613959 ?auto_613962 ) ) ( not ( = ?auto_613959 ?auto_613963 ) ) ( not ( = ?auto_613959 ?auto_613964 ) ) ( not ( = ?auto_613960 ?auto_613961 ) ) ( not ( = ?auto_613960 ?auto_613962 ) ) ( not ( = ?auto_613960 ?auto_613963 ) ) ( not ( = ?auto_613960 ?auto_613964 ) ) ( not ( = ?auto_613961 ?auto_613962 ) ) ( not ( = ?auto_613961 ?auto_613963 ) ) ( not ( = ?auto_613961 ?auto_613964 ) ) ( not ( = ?auto_613962 ?auto_613963 ) ) ( not ( = ?auto_613962 ?auto_613964 ) ) ( not ( = ?auto_613963 ?auto_613964 ) ) ( ON ?auto_613962 ?auto_613963 ) ( ON ?auto_613961 ?auto_613962 ) ( ON ?auto_613960 ?auto_613961 ) ( ON ?auto_613959 ?auto_613960 ) ( ON ?auto_613958 ?auto_613959 ) ( ON ?auto_613957 ?auto_613958 ) ( CLEAR ?auto_613955 ) ( ON ?auto_613956 ?auto_613957 ) ( CLEAR ?auto_613956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_613955 ?auto_613956 )
      ( MAKE-9PILE ?auto_613955 ?auto_613956 ?auto_613957 ?auto_613958 ?auto_613959 ?auto_613960 ?auto_613961 ?auto_613962 ?auto_613963 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_613993 - BLOCK
      ?auto_613994 - BLOCK
      ?auto_613995 - BLOCK
      ?auto_613996 - BLOCK
      ?auto_613997 - BLOCK
      ?auto_613998 - BLOCK
      ?auto_613999 - BLOCK
      ?auto_614000 - BLOCK
      ?auto_614001 - BLOCK
    )
    :vars
    (
      ?auto_614002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614001 ?auto_614002 ) ( not ( = ?auto_613993 ?auto_613994 ) ) ( not ( = ?auto_613993 ?auto_613995 ) ) ( not ( = ?auto_613993 ?auto_613996 ) ) ( not ( = ?auto_613993 ?auto_613997 ) ) ( not ( = ?auto_613993 ?auto_613998 ) ) ( not ( = ?auto_613993 ?auto_613999 ) ) ( not ( = ?auto_613993 ?auto_614000 ) ) ( not ( = ?auto_613993 ?auto_614001 ) ) ( not ( = ?auto_613993 ?auto_614002 ) ) ( not ( = ?auto_613994 ?auto_613995 ) ) ( not ( = ?auto_613994 ?auto_613996 ) ) ( not ( = ?auto_613994 ?auto_613997 ) ) ( not ( = ?auto_613994 ?auto_613998 ) ) ( not ( = ?auto_613994 ?auto_613999 ) ) ( not ( = ?auto_613994 ?auto_614000 ) ) ( not ( = ?auto_613994 ?auto_614001 ) ) ( not ( = ?auto_613994 ?auto_614002 ) ) ( not ( = ?auto_613995 ?auto_613996 ) ) ( not ( = ?auto_613995 ?auto_613997 ) ) ( not ( = ?auto_613995 ?auto_613998 ) ) ( not ( = ?auto_613995 ?auto_613999 ) ) ( not ( = ?auto_613995 ?auto_614000 ) ) ( not ( = ?auto_613995 ?auto_614001 ) ) ( not ( = ?auto_613995 ?auto_614002 ) ) ( not ( = ?auto_613996 ?auto_613997 ) ) ( not ( = ?auto_613996 ?auto_613998 ) ) ( not ( = ?auto_613996 ?auto_613999 ) ) ( not ( = ?auto_613996 ?auto_614000 ) ) ( not ( = ?auto_613996 ?auto_614001 ) ) ( not ( = ?auto_613996 ?auto_614002 ) ) ( not ( = ?auto_613997 ?auto_613998 ) ) ( not ( = ?auto_613997 ?auto_613999 ) ) ( not ( = ?auto_613997 ?auto_614000 ) ) ( not ( = ?auto_613997 ?auto_614001 ) ) ( not ( = ?auto_613997 ?auto_614002 ) ) ( not ( = ?auto_613998 ?auto_613999 ) ) ( not ( = ?auto_613998 ?auto_614000 ) ) ( not ( = ?auto_613998 ?auto_614001 ) ) ( not ( = ?auto_613998 ?auto_614002 ) ) ( not ( = ?auto_613999 ?auto_614000 ) ) ( not ( = ?auto_613999 ?auto_614001 ) ) ( not ( = ?auto_613999 ?auto_614002 ) ) ( not ( = ?auto_614000 ?auto_614001 ) ) ( not ( = ?auto_614000 ?auto_614002 ) ) ( not ( = ?auto_614001 ?auto_614002 ) ) ( ON ?auto_614000 ?auto_614001 ) ( ON ?auto_613999 ?auto_614000 ) ( ON ?auto_613998 ?auto_613999 ) ( ON ?auto_613997 ?auto_613998 ) ( ON ?auto_613996 ?auto_613997 ) ( ON ?auto_613995 ?auto_613996 ) ( ON ?auto_613994 ?auto_613995 ) ( ON ?auto_613993 ?auto_613994 ) ( CLEAR ?auto_613993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_613993 )
      ( MAKE-9PILE ?auto_613993 ?auto_613994 ?auto_613995 ?auto_613996 ?auto_613997 ?auto_613998 ?auto_613999 ?auto_614000 ?auto_614001 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_614032 - BLOCK
      ?auto_614033 - BLOCK
      ?auto_614034 - BLOCK
      ?auto_614035 - BLOCK
      ?auto_614036 - BLOCK
      ?auto_614037 - BLOCK
      ?auto_614038 - BLOCK
      ?auto_614039 - BLOCK
      ?auto_614040 - BLOCK
      ?auto_614041 - BLOCK
    )
    :vars
    (
      ?auto_614042 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_614040 ) ( ON ?auto_614041 ?auto_614042 ) ( CLEAR ?auto_614041 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_614032 ) ( ON ?auto_614033 ?auto_614032 ) ( ON ?auto_614034 ?auto_614033 ) ( ON ?auto_614035 ?auto_614034 ) ( ON ?auto_614036 ?auto_614035 ) ( ON ?auto_614037 ?auto_614036 ) ( ON ?auto_614038 ?auto_614037 ) ( ON ?auto_614039 ?auto_614038 ) ( ON ?auto_614040 ?auto_614039 ) ( not ( = ?auto_614032 ?auto_614033 ) ) ( not ( = ?auto_614032 ?auto_614034 ) ) ( not ( = ?auto_614032 ?auto_614035 ) ) ( not ( = ?auto_614032 ?auto_614036 ) ) ( not ( = ?auto_614032 ?auto_614037 ) ) ( not ( = ?auto_614032 ?auto_614038 ) ) ( not ( = ?auto_614032 ?auto_614039 ) ) ( not ( = ?auto_614032 ?auto_614040 ) ) ( not ( = ?auto_614032 ?auto_614041 ) ) ( not ( = ?auto_614032 ?auto_614042 ) ) ( not ( = ?auto_614033 ?auto_614034 ) ) ( not ( = ?auto_614033 ?auto_614035 ) ) ( not ( = ?auto_614033 ?auto_614036 ) ) ( not ( = ?auto_614033 ?auto_614037 ) ) ( not ( = ?auto_614033 ?auto_614038 ) ) ( not ( = ?auto_614033 ?auto_614039 ) ) ( not ( = ?auto_614033 ?auto_614040 ) ) ( not ( = ?auto_614033 ?auto_614041 ) ) ( not ( = ?auto_614033 ?auto_614042 ) ) ( not ( = ?auto_614034 ?auto_614035 ) ) ( not ( = ?auto_614034 ?auto_614036 ) ) ( not ( = ?auto_614034 ?auto_614037 ) ) ( not ( = ?auto_614034 ?auto_614038 ) ) ( not ( = ?auto_614034 ?auto_614039 ) ) ( not ( = ?auto_614034 ?auto_614040 ) ) ( not ( = ?auto_614034 ?auto_614041 ) ) ( not ( = ?auto_614034 ?auto_614042 ) ) ( not ( = ?auto_614035 ?auto_614036 ) ) ( not ( = ?auto_614035 ?auto_614037 ) ) ( not ( = ?auto_614035 ?auto_614038 ) ) ( not ( = ?auto_614035 ?auto_614039 ) ) ( not ( = ?auto_614035 ?auto_614040 ) ) ( not ( = ?auto_614035 ?auto_614041 ) ) ( not ( = ?auto_614035 ?auto_614042 ) ) ( not ( = ?auto_614036 ?auto_614037 ) ) ( not ( = ?auto_614036 ?auto_614038 ) ) ( not ( = ?auto_614036 ?auto_614039 ) ) ( not ( = ?auto_614036 ?auto_614040 ) ) ( not ( = ?auto_614036 ?auto_614041 ) ) ( not ( = ?auto_614036 ?auto_614042 ) ) ( not ( = ?auto_614037 ?auto_614038 ) ) ( not ( = ?auto_614037 ?auto_614039 ) ) ( not ( = ?auto_614037 ?auto_614040 ) ) ( not ( = ?auto_614037 ?auto_614041 ) ) ( not ( = ?auto_614037 ?auto_614042 ) ) ( not ( = ?auto_614038 ?auto_614039 ) ) ( not ( = ?auto_614038 ?auto_614040 ) ) ( not ( = ?auto_614038 ?auto_614041 ) ) ( not ( = ?auto_614038 ?auto_614042 ) ) ( not ( = ?auto_614039 ?auto_614040 ) ) ( not ( = ?auto_614039 ?auto_614041 ) ) ( not ( = ?auto_614039 ?auto_614042 ) ) ( not ( = ?auto_614040 ?auto_614041 ) ) ( not ( = ?auto_614040 ?auto_614042 ) ) ( not ( = ?auto_614041 ?auto_614042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_614041 ?auto_614042 )
      ( !STACK ?auto_614041 ?auto_614040 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_614074 - BLOCK
      ?auto_614075 - BLOCK
      ?auto_614076 - BLOCK
      ?auto_614077 - BLOCK
      ?auto_614078 - BLOCK
      ?auto_614079 - BLOCK
      ?auto_614080 - BLOCK
      ?auto_614081 - BLOCK
      ?auto_614082 - BLOCK
      ?auto_614083 - BLOCK
    )
    :vars
    (
      ?auto_614084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614083 ?auto_614084 ) ( ON-TABLE ?auto_614074 ) ( ON ?auto_614075 ?auto_614074 ) ( ON ?auto_614076 ?auto_614075 ) ( ON ?auto_614077 ?auto_614076 ) ( ON ?auto_614078 ?auto_614077 ) ( ON ?auto_614079 ?auto_614078 ) ( ON ?auto_614080 ?auto_614079 ) ( ON ?auto_614081 ?auto_614080 ) ( not ( = ?auto_614074 ?auto_614075 ) ) ( not ( = ?auto_614074 ?auto_614076 ) ) ( not ( = ?auto_614074 ?auto_614077 ) ) ( not ( = ?auto_614074 ?auto_614078 ) ) ( not ( = ?auto_614074 ?auto_614079 ) ) ( not ( = ?auto_614074 ?auto_614080 ) ) ( not ( = ?auto_614074 ?auto_614081 ) ) ( not ( = ?auto_614074 ?auto_614082 ) ) ( not ( = ?auto_614074 ?auto_614083 ) ) ( not ( = ?auto_614074 ?auto_614084 ) ) ( not ( = ?auto_614075 ?auto_614076 ) ) ( not ( = ?auto_614075 ?auto_614077 ) ) ( not ( = ?auto_614075 ?auto_614078 ) ) ( not ( = ?auto_614075 ?auto_614079 ) ) ( not ( = ?auto_614075 ?auto_614080 ) ) ( not ( = ?auto_614075 ?auto_614081 ) ) ( not ( = ?auto_614075 ?auto_614082 ) ) ( not ( = ?auto_614075 ?auto_614083 ) ) ( not ( = ?auto_614075 ?auto_614084 ) ) ( not ( = ?auto_614076 ?auto_614077 ) ) ( not ( = ?auto_614076 ?auto_614078 ) ) ( not ( = ?auto_614076 ?auto_614079 ) ) ( not ( = ?auto_614076 ?auto_614080 ) ) ( not ( = ?auto_614076 ?auto_614081 ) ) ( not ( = ?auto_614076 ?auto_614082 ) ) ( not ( = ?auto_614076 ?auto_614083 ) ) ( not ( = ?auto_614076 ?auto_614084 ) ) ( not ( = ?auto_614077 ?auto_614078 ) ) ( not ( = ?auto_614077 ?auto_614079 ) ) ( not ( = ?auto_614077 ?auto_614080 ) ) ( not ( = ?auto_614077 ?auto_614081 ) ) ( not ( = ?auto_614077 ?auto_614082 ) ) ( not ( = ?auto_614077 ?auto_614083 ) ) ( not ( = ?auto_614077 ?auto_614084 ) ) ( not ( = ?auto_614078 ?auto_614079 ) ) ( not ( = ?auto_614078 ?auto_614080 ) ) ( not ( = ?auto_614078 ?auto_614081 ) ) ( not ( = ?auto_614078 ?auto_614082 ) ) ( not ( = ?auto_614078 ?auto_614083 ) ) ( not ( = ?auto_614078 ?auto_614084 ) ) ( not ( = ?auto_614079 ?auto_614080 ) ) ( not ( = ?auto_614079 ?auto_614081 ) ) ( not ( = ?auto_614079 ?auto_614082 ) ) ( not ( = ?auto_614079 ?auto_614083 ) ) ( not ( = ?auto_614079 ?auto_614084 ) ) ( not ( = ?auto_614080 ?auto_614081 ) ) ( not ( = ?auto_614080 ?auto_614082 ) ) ( not ( = ?auto_614080 ?auto_614083 ) ) ( not ( = ?auto_614080 ?auto_614084 ) ) ( not ( = ?auto_614081 ?auto_614082 ) ) ( not ( = ?auto_614081 ?auto_614083 ) ) ( not ( = ?auto_614081 ?auto_614084 ) ) ( not ( = ?auto_614082 ?auto_614083 ) ) ( not ( = ?auto_614082 ?auto_614084 ) ) ( not ( = ?auto_614083 ?auto_614084 ) ) ( CLEAR ?auto_614081 ) ( ON ?auto_614082 ?auto_614083 ) ( CLEAR ?auto_614082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_614074 ?auto_614075 ?auto_614076 ?auto_614077 ?auto_614078 ?auto_614079 ?auto_614080 ?auto_614081 ?auto_614082 )
      ( MAKE-10PILE ?auto_614074 ?auto_614075 ?auto_614076 ?auto_614077 ?auto_614078 ?auto_614079 ?auto_614080 ?auto_614081 ?auto_614082 ?auto_614083 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_614116 - BLOCK
      ?auto_614117 - BLOCK
      ?auto_614118 - BLOCK
      ?auto_614119 - BLOCK
      ?auto_614120 - BLOCK
      ?auto_614121 - BLOCK
      ?auto_614122 - BLOCK
      ?auto_614123 - BLOCK
      ?auto_614124 - BLOCK
      ?auto_614125 - BLOCK
    )
    :vars
    (
      ?auto_614126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614125 ?auto_614126 ) ( ON-TABLE ?auto_614116 ) ( ON ?auto_614117 ?auto_614116 ) ( ON ?auto_614118 ?auto_614117 ) ( ON ?auto_614119 ?auto_614118 ) ( ON ?auto_614120 ?auto_614119 ) ( ON ?auto_614121 ?auto_614120 ) ( ON ?auto_614122 ?auto_614121 ) ( not ( = ?auto_614116 ?auto_614117 ) ) ( not ( = ?auto_614116 ?auto_614118 ) ) ( not ( = ?auto_614116 ?auto_614119 ) ) ( not ( = ?auto_614116 ?auto_614120 ) ) ( not ( = ?auto_614116 ?auto_614121 ) ) ( not ( = ?auto_614116 ?auto_614122 ) ) ( not ( = ?auto_614116 ?auto_614123 ) ) ( not ( = ?auto_614116 ?auto_614124 ) ) ( not ( = ?auto_614116 ?auto_614125 ) ) ( not ( = ?auto_614116 ?auto_614126 ) ) ( not ( = ?auto_614117 ?auto_614118 ) ) ( not ( = ?auto_614117 ?auto_614119 ) ) ( not ( = ?auto_614117 ?auto_614120 ) ) ( not ( = ?auto_614117 ?auto_614121 ) ) ( not ( = ?auto_614117 ?auto_614122 ) ) ( not ( = ?auto_614117 ?auto_614123 ) ) ( not ( = ?auto_614117 ?auto_614124 ) ) ( not ( = ?auto_614117 ?auto_614125 ) ) ( not ( = ?auto_614117 ?auto_614126 ) ) ( not ( = ?auto_614118 ?auto_614119 ) ) ( not ( = ?auto_614118 ?auto_614120 ) ) ( not ( = ?auto_614118 ?auto_614121 ) ) ( not ( = ?auto_614118 ?auto_614122 ) ) ( not ( = ?auto_614118 ?auto_614123 ) ) ( not ( = ?auto_614118 ?auto_614124 ) ) ( not ( = ?auto_614118 ?auto_614125 ) ) ( not ( = ?auto_614118 ?auto_614126 ) ) ( not ( = ?auto_614119 ?auto_614120 ) ) ( not ( = ?auto_614119 ?auto_614121 ) ) ( not ( = ?auto_614119 ?auto_614122 ) ) ( not ( = ?auto_614119 ?auto_614123 ) ) ( not ( = ?auto_614119 ?auto_614124 ) ) ( not ( = ?auto_614119 ?auto_614125 ) ) ( not ( = ?auto_614119 ?auto_614126 ) ) ( not ( = ?auto_614120 ?auto_614121 ) ) ( not ( = ?auto_614120 ?auto_614122 ) ) ( not ( = ?auto_614120 ?auto_614123 ) ) ( not ( = ?auto_614120 ?auto_614124 ) ) ( not ( = ?auto_614120 ?auto_614125 ) ) ( not ( = ?auto_614120 ?auto_614126 ) ) ( not ( = ?auto_614121 ?auto_614122 ) ) ( not ( = ?auto_614121 ?auto_614123 ) ) ( not ( = ?auto_614121 ?auto_614124 ) ) ( not ( = ?auto_614121 ?auto_614125 ) ) ( not ( = ?auto_614121 ?auto_614126 ) ) ( not ( = ?auto_614122 ?auto_614123 ) ) ( not ( = ?auto_614122 ?auto_614124 ) ) ( not ( = ?auto_614122 ?auto_614125 ) ) ( not ( = ?auto_614122 ?auto_614126 ) ) ( not ( = ?auto_614123 ?auto_614124 ) ) ( not ( = ?auto_614123 ?auto_614125 ) ) ( not ( = ?auto_614123 ?auto_614126 ) ) ( not ( = ?auto_614124 ?auto_614125 ) ) ( not ( = ?auto_614124 ?auto_614126 ) ) ( not ( = ?auto_614125 ?auto_614126 ) ) ( ON ?auto_614124 ?auto_614125 ) ( CLEAR ?auto_614122 ) ( ON ?auto_614123 ?auto_614124 ) ( CLEAR ?auto_614123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_614116 ?auto_614117 ?auto_614118 ?auto_614119 ?auto_614120 ?auto_614121 ?auto_614122 ?auto_614123 )
      ( MAKE-10PILE ?auto_614116 ?auto_614117 ?auto_614118 ?auto_614119 ?auto_614120 ?auto_614121 ?auto_614122 ?auto_614123 ?auto_614124 ?auto_614125 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_614158 - BLOCK
      ?auto_614159 - BLOCK
      ?auto_614160 - BLOCK
      ?auto_614161 - BLOCK
      ?auto_614162 - BLOCK
      ?auto_614163 - BLOCK
      ?auto_614164 - BLOCK
      ?auto_614165 - BLOCK
      ?auto_614166 - BLOCK
      ?auto_614167 - BLOCK
    )
    :vars
    (
      ?auto_614168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614167 ?auto_614168 ) ( ON-TABLE ?auto_614158 ) ( ON ?auto_614159 ?auto_614158 ) ( ON ?auto_614160 ?auto_614159 ) ( ON ?auto_614161 ?auto_614160 ) ( ON ?auto_614162 ?auto_614161 ) ( ON ?auto_614163 ?auto_614162 ) ( not ( = ?auto_614158 ?auto_614159 ) ) ( not ( = ?auto_614158 ?auto_614160 ) ) ( not ( = ?auto_614158 ?auto_614161 ) ) ( not ( = ?auto_614158 ?auto_614162 ) ) ( not ( = ?auto_614158 ?auto_614163 ) ) ( not ( = ?auto_614158 ?auto_614164 ) ) ( not ( = ?auto_614158 ?auto_614165 ) ) ( not ( = ?auto_614158 ?auto_614166 ) ) ( not ( = ?auto_614158 ?auto_614167 ) ) ( not ( = ?auto_614158 ?auto_614168 ) ) ( not ( = ?auto_614159 ?auto_614160 ) ) ( not ( = ?auto_614159 ?auto_614161 ) ) ( not ( = ?auto_614159 ?auto_614162 ) ) ( not ( = ?auto_614159 ?auto_614163 ) ) ( not ( = ?auto_614159 ?auto_614164 ) ) ( not ( = ?auto_614159 ?auto_614165 ) ) ( not ( = ?auto_614159 ?auto_614166 ) ) ( not ( = ?auto_614159 ?auto_614167 ) ) ( not ( = ?auto_614159 ?auto_614168 ) ) ( not ( = ?auto_614160 ?auto_614161 ) ) ( not ( = ?auto_614160 ?auto_614162 ) ) ( not ( = ?auto_614160 ?auto_614163 ) ) ( not ( = ?auto_614160 ?auto_614164 ) ) ( not ( = ?auto_614160 ?auto_614165 ) ) ( not ( = ?auto_614160 ?auto_614166 ) ) ( not ( = ?auto_614160 ?auto_614167 ) ) ( not ( = ?auto_614160 ?auto_614168 ) ) ( not ( = ?auto_614161 ?auto_614162 ) ) ( not ( = ?auto_614161 ?auto_614163 ) ) ( not ( = ?auto_614161 ?auto_614164 ) ) ( not ( = ?auto_614161 ?auto_614165 ) ) ( not ( = ?auto_614161 ?auto_614166 ) ) ( not ( = ?auto_614161 ?auto_614167 ) ) ( not ( = ?auto_614161 ?auto_614168 ) ) ( not ( = ?auto_614162 ?auto_614163 ) ) ( not ( = ?auto_614162 ?auto_614164 ) ) ( not ( = ?auto_614162 ?auto_614165 ) ) ( not ( = ?auto_614162 ?auto_614166 ) ) ( not ( = ?auto_614162 ?auto_614167 ) ) ( not ( = ?auto_614162 ?auto_614168 ) ) ( not ( = ?auto_614163 ?auto_614164 ) ) ( not ( = ?auto_614163 ?auto_614165 ) ) ( not ( = ?auto_614163 ?auto_614166 ) ) ( not ( = ?auto_614163 ?auto_614167 ) ) ( not ( = ?auto_614163 ?auto_614168 ) ) ( not ( = ?auto_614164 ?auto_614165 ) ) ( not ( = ?auto_614164 ?auto_614166 ) ) ( not ( = ?auto_614164 ?auto_614167 ) ) ( not ( = ?auto_614164 ?auto_614168 ) ) ( not ( = ?auto_614165 ?auto_614166 ) ) ( not ( = ?auto_614165 ?auto_614167 ) ) ( not ( = ?auto_614165 ?auto_614168 ) ) ( not ( = ?auto_614166 ?auto_614167 ) ) ( not ( = ?auto_614166 ?auto_614168 ) ) ( not ( = ?auto_614167 ?auto_614168 ) ) ( ON ?auto_614166 ?auto_614167 ) ( ON ?auto_614165 ?auto_614166 ) ( CLEAR ?auto_614163 ) ( ON ?auto_614164 ?auto_614165 ) ( CLEAR ?auto_614164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_614158 ?auto_614159 ?auto_614160 ?auto_614161 ?auto_614162 ?auto_614163 ?auto_614164 )
      ( MAKE-10PILE ?auto_614158 ?auto_614159 ?auto_614160 ?auto_614161 ?auto_614162 ?auto_614163 ?auto_614164 ?auto_614165 ?auto_614166 ?auto_614167 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_614200 - BLOCK
      ?auto_614201 - BLOCK
      ?auto_614202 - BLOCK
      ?auto_614203 - BLOCK
      ?auto_614204 - BLOCK
      ?auto_614205 - BLOCK
      ?auto_614206 - BLOCK
      ?auto_614207 - BLOCK
      ?auto_614208 - BLOCK
      ?auto_614209 - BLOCK
    )
    :vars
    (
      ?auto_614210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614209 ?auto_614210 ) ( ON-TABLE ?auto_614200 ) ( ON ?auto_614201 ?auto_614200 ) ( ON ?auto_614202 ?auto_614201 ) ( ON ?auto_614203 ?auto_614202 ) ( ON ?auto_614204 ?auto_614203 ) ( not ( = ?auto_614200 ?auto_614201 ) ) ( not ( = ?auto_614200 ?auto_614202 ) ) ( not ( = ?auto_614200 ?auto_614203 ) ) ( not ( = ?auto_614200 ?auto_614204 ) ) ( not ( = ?auto_614200 ?auto_614205 ) ) ( not ( = ?auto_614200 ?auto_614206 ) ) ( not ( = ?auto_614200 ?auto_614207 ) ) ( not ( = ?auto_614200 ?auto_614208 ) ) ( not ( = ?auto_614200 ?auto_614209 ) ) ( not ( = ?auto_614200 ?auto_614210 ) ) ( not ( = ?auto_614201 ?auto_614202 ) ) ( not ( = ?auto_614201 ?auto_614203 ) ) ( not ( = ?auto_614201 ?auto_614204 ) ) ( not ( = ?auto_614201 ?auto_614205 ) ) ( not ( = ?auto_614201 ?auto_614206 ) ) ( not ( = ?auto_614201 ?auto_614207 ) ) ( not ( = ?auto_614201 ?auto_614208 ) ) ( not ( = ?auto_614201 ?auto_614209 ) ) ( not ( = ?auto_614201 ?auto_614210 ) ) ( not ( = ?auto_614202 ?auto_614203 ) ) ( not ( = ?auto_614202 ?auto_614204 ) ) ( not ( = ?auto_614202 ?auto_614205 ) ) ( not ( = ?auto_614202 ?auto_614206 ) ) ( not ( = ?auto_614202 ?auto_614207 ) ) ( not ( = ?auto_614202 ?auto_614208 ) ) ( not ( = ?auto_614202 ?auto_614209 ) ) ( not ( = ?auto_614202 ?auto_614210 ) ) ( not ( = ?auto_614203 ?auto_614204 ) ) ( not ( = ?auto_614203 ?auto_614205 ) ) ( not ( = ?auto_614203 ?auto_614206 ) ) ( not ( = ?auto_614203 ?auto_614207 ) ) ( not ( = ?auto_614203 ?auto_614208 ) ) ( not ( = ?auto_614203 ?auto_614209 ) ) ( not ( = ?auto_614203 ?auto_614210 ) ) ( not ( = ?auto_614204 ?auto_614205 ) ) ( not ( = ?auto_614204 ?auto_614206 ) ) ( not ( = ?auto_614204 ?auto_614207 ) ) ( not ( = ?auto_614204 ?auto_614208 ) ) ( not ( = ?auto_614204 ?auto_614209 ) ) ( not ( = ?auto_614204 ?auto_614210 ) ) ( not ( = ?auto_614205 ?auto_614206 ) ) ( not ( = ?auto_614205 ?auto_614207 ) ) ( not ( = ?auto_614205 ?auto_614208 ) ) ( not ( = ?auto_614205 ?auto_614209 ) ) ( not ( = ?auto_614205 ?auto_614210 ) ) ( not ( = ?auto_614206 ?auto_614207 ) ) ( not ( = ?auto_614206 ?auto_614208 ) ) ( not ( = ?auto_614206 ?auto_614209 ) ) ( not ( = ?auto_614206 ?auto_614210 ) ) ( not ( = ?auto_614207 ?auto_614208 ) ) ( not ( = ?auto_614207 ?auto_614209 ) ) ( not ( = ?auto_614207 ?auto_614210 ) ) ( not ( = ?auto_614208 ?auto_614209 ) ) ( not ( = ?auto_614208 ?auto_614210 ) ) ( not ( = ?auto_614209 ?auto_614210 ) ) ( ON ?auto_614208 ?auto_614209 ) ( ON ?auto_614207 ?auto_614208 ) ( ON ?auto_614206 ?auto_614207 ) ( CLEAR ?auto_614204 ) ( ON ?auto_614205 ?auto_614206 ) ( CLEAR ?auto_614205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_614200 ?auto_614201 ?auto_614202 ?auto_614203 ?auto_614204 ?auto_614205 )
      ( MAKE-10PILE ?auto_614200 ?auto_614201 ?auto_614202 ?auto_614203 ?auto_614204 ?auto_614205 ?auto_614206 ?auto_614207 ?auto_614208 ?auto_614209 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_614242 - BLOCK
      ?auto_614243 - BLOCK
      ?auto_614244 - BLOCK
      ?auto_614245 - BLOCK
      ?auto_614246 - BLOCK
      ?auto_614247 - BLOCK
      ?auto_614248 - BLOCK
      ?auto_614249 - BLOCK
      ?auto_614250 - BLOCK
      ?auto_614251 - BLOCK
    )
    :vars
    (
      ?auto_614252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614251 ?auto_614252 ) ( ON-TABLE ?auto_614242 ) ( ON ?auto_614243 ?auto_614242 ) ( ON ?auto_614244 ?auto_614243 ) ( ON ?auto_614245 ?auto_614244 ) ( not ( = ?auto_614242 ?auto_614243 ) ) ( not ( = ?auto_614242 ?auto_614244 ) ) ( not ( = ?auto_614242 ?auto_614245 ) ) ( not ( = ?auto_614242 ?auto_614246 ) ) ( not ( = ?auto_614242 ?auto_614247 ) ) ( not ( = ?auto_614242 ?auto_614248 ) ) ( not ( = ?auto_614242 ?auto_614249 ) ) ( not ( = ?auto_614242 ?auto_614250 ) ) ( not ( = ?auto_614242 ?auto_614251 ) ) ( not ( = ?auto_614242 ?auto_614252 ) ) ( not ( = ?auto_614243 ?auto_614244 ) ) ( not ( = ?auto_614243 ?auto_614245 ) ) ( not ( = ?auto_614243 ?auto_614246 ) ) ( not ( = ?auto_614243 ?auto_614247 ) ) ( not ( = ?auto_614243 ?auto_614248 ) ) ( not ( = ?auto_614243 ?auto_614249 ) ) ( not ( = ?auto_614243 ?auto_614250 ) ) ( not ( = ?auto_614243 ?auto_614251 ) ) ( not ( = ?auto_614243 ?auto_614252 ) ) ( not ( = ?auto_614244 ?auto_614245 ) ) ( not ( = ?auto_614244 ?auto_614246 ) ) ( not ( = ?auto_614244 ?auto_614247 ) ) ( not ( = ?auto_614244 ?auto_614248 ) ) ( not ( = ?auto_614244 ?auto_614249 ) ) ( not ( = ?auto_614244 ?auto_614250 ) ) ( not ( = ?auto_614244 ?auto_614251 ) ) ( not ( = ?auto_614244 ?auto_614252 ) ) ( not ( = ?auto_614245 ?auto_614246 ) ) ( not ( = ?auto_614245 ?auto_614247 ) ) ( not ( = ?auto_614245 ?auto_614248 ) ) ( not ( = ?auto_614245 ?auto_614249 ) ) ( not ( = ?auto_614245 ?auto_614250 ) ) ( not ( = ?auto_614245 ?auto_614251 ) ) ( not ( = ?auto_614245 ?auto_614252 ) ) ( not ( = ?auto_614246 ?auto_614247 ) ) ( not ( = ?auto_614246 ?auto_614248 ) ) ( not ( = ?auto_614246 ?auto_614249 ) ) ( not ( = ?auto_614246 ?auto_614250 ) ) ( not ( = ?auto_614246 ?auto_614251 ) ) ( not ( = ?auto_614246 ?auto_614252 ) ) ( not ( = ?auto_614247 ?auto_614248 ) ) ( not ( = ?auto_614247 ?auto_614249 ) ) ( not ( = ?auto_614247 ?auto_614250 ) ) ( not ( = ?auto_614247 ?auto_614251 ) ) ( not ( = ?auto_614247 ?auto_614252 ) ) ( not ( = ?auto_614248 ?auto_614249 ) ) ( not ( = ?auto_614248 ?auto_614250 ) ) ( not ( = ?auto_614248 ?auto_614251 ) ) ( not ( = ?auto_614248 ?auto_614252 ) ) ( not ( = ?auto_614249 ?auto_614250 ) ) ( not ( = ?auto_614249 ?auto_614251 ) ) ( not ( = ?auto_614249 ?auto_614252 ) ) ( not ( = ?auto_614250 ?auto_614251 ) ) ( not ( = ?auto_614250 ?auto_614252 ) ) ( not ( = ?auto_614251 ?auto_614252 ) ) ( ON ?auto_614250 ?auto_614251 ) ( ON ?auto_614249 ?auto_614250 ) ( ON ?auto_614248 ?auto_614249 ) ( ON ?auto_614247 ?auto_614248 ) ( CLEAR ?auto_614245 ) ( ON ?auto_614246 ?auto_614247 ) ( CLEAR ?auto_614246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_614242 ?auto_614243 ?auto_614244 ?auto_614245 ?auto_614246 )
      ( MAKE-10PILE ?auto_614242 ?auto_614243 ?auto_614244 ?auto_614245 ?auto_614246 ?auto_614247 ?auto_614248 ?auto_614249 ?auto_614250 ?auto_614251 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_614284 - BLOCK
      ?auto_614285 - BLOCK
      ?auto_614286 - BLOCK
      ?auto_614287 - BLOCK
      ?auto_614288 - BLOCK
      ?auto_614289 - BLOCK
      ?auto_614290 - BLOCK
      ?auto_614291 - BLOCK
      ?auto_614292 - BLOCK
      ?auto_614293 - BLOCK
    )
    :vars
    (
      ?auto_614294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614293 ?auto_614294 ) ( ON-TABLE ?auto_614284 ) ( ON ?auto_614285 ?auto_614284 ) ( ON ?auto_614286 ?auto_614285 ) ( not ( = ?auto_614284 ?auto_614285 ) ) ( not ( = ?auto_614284 ?auto_614286 ) ) ( not ( = ?auto_614284 ?auto_614287 ) ) ( not ( = ?auto_614284 ?auto_614288 ) ) ( not ( = ?auto_614284 ?auto_614289 ) ) ( not ( = ?auto_614284 ?auto_614290 ) ) ( not ( = ?auto_614284 ?auto_614291 ) ) ( not ( = ?auto_614284 ?auto_614292 ) ) ( not ( = ?auto_614284 ?auto_614293 ) ) ( not ( = ?auto_614284 ?auto_614294 ) ) ( not ( = ?auto_614285 ?auto_614286 ) ) ( not ( = ?auto_614285 ?auto_614287 ) ) ( not ( = ?auto_614285 ?auto_614288 ) ) ( not ( = ?auto_614285 ?auto_614289 ) ) ( not ( = ?auto_614285 ?auto_614290 ) ) ( not ( = ?auto_614285 ?auto_614291 ) ) ( not ( = ?auto_614285 ?auto_614292 ) ) ( not ( = ?auto_614285 ?auto_614293 ) ) ( not ( = ?auto_614285 ?auto_614294 ) ) ( not ( = ?auto_614286 ?auto_614287 ) ) ( not ( = ?auto_614286 ?auto_614288 ) ) ( not ( = ?auto_614286 ?auto_614289 ) ) ( not ( = ?auto_614286 ?auto_614290 ) ) ( not ( = ?auto_614286 ?auto_614291 ) ) ( not ( = ?auto_614286 ?auto_614292 ) ) ( not ( = ?auto_614286 ?auto_614293 ) ) ( not ( = ?auto_614286 ?auto_614294 ) ) ( not ( = ?auto_614287 ?auto_614288 ) ) ( not ( = ?auto_614287 ?auto_614289 ) ) ( not ( = ?auto_614287 ?auto_614290 ) ) ( not ( = ?auto_614287 ?auto_614291 ) ) ( not ( = ?auto_614287 ?auto_614292 ) ) ( not ( = ?auto_614287 ?auto_614293 ) ) ( not ( = ?auto_614287 ?auto_614294 ) ) ( not ( = ?auto_614288 ?auto_614289 ) ) ( not ( = ?auto_614288 ?auto_614290 ) ) ( not ( = ?auto_614288 ?auto_614291 ) ) ( not ( = ?auto_614288 ?auto_614292 ) ) ( not ( = ?auto_614288 ?auto_614293 ) ) ( not ( = ?auto_614288 ?auto_614294 ) ) ( not ( = ?auto_614289 ?auto_614290 ) ) ( not ( = ?auto_614289 ?auto_614291 ) ) ( not ( = ?auto_614289 ?auto_614292 ) ) ( not ( = ?auto_614289 ?auto_614293 ) ) ( not ( = ?auto_614289 ?auto_614294 ) ) ( not ( = ?auto_614290 ?auto_614291 ) ) ( not ( = ?auto_614290 ?auto_614292 ) ) ( not ( = ?auto_614290 ?auto_614293 ) ) ( not ( = ?auto_614290 ?auto_614294 ) ) ( not ( = ?auto_614291 ?auto_614292 ) ) ( not ( = ?auto_614291 ?auto_614293 ) ) ( not ( = ?auto_614291 ?auto_614294 ) ) ( not ( = ?auto_614292 ?auto_614293 ) ) ( not ( = ?auto_614292 ?auto_614294 ) ) ( not ( = ?auto_614293 ?auto_614294 ) ) ( ON ?auto_614292 ?auto_614293 ) ( ON ?auto_614291 ?auto_614292 ) ( ON ?auto_614290 ?auto_614291 ) ( ON ?auto_614289 ?auto_614290 ) ( ON ?auto_614288 ?auto_614289 ) ( CLEAR ?auto_614286 ) ( ON ?auto_614287 ?auto_614288 ) ( CLEAR ?auto_614287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_614284 ?auto_614285 ?auto_614286 ?auto_614287 )
      ( MAKE-10PILE ?auto_614284 ?auto_614285 ?auto_614286 ?auto_614287 ?auto_614288 ?auto_614289 ?auto_614290 ?auto_614291 ?auto_614292 ?auto_614293 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_614326 - BLOCK
      ?auto_614327 - BLOCK
      ?auto_614328 - BLOCK
      ?auto_614329 - BLOCK
      ?auto_614330 - BLOCK
      ?auto_614331 - BLOCK
      ?auto_614332 - BLOCK
      ?auto_614333 - BLOCK
      ?auto_614334 - BLOCK
      ?auto_614335 - BLOCK
    )
    :vars
    (
      ?auto_614336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614335 ?auto_614336 ) ( ON-TABLE ?auto_614326 ) ( ON ?auto_614327 ?auto_614326 ) ( not ( = ?auto_614326 ?auto_614327 ) ) ( not ( = ?auto_614326 ?auto_614328 ) ) ( not ( = ?auto_614326 ?auto_614329 ) ) ( not ( = ?auto_614326 ?auto_614330 ) ) ( not ( = ?auto_614326 ?auto_614331 ) ) ( not ( = ?auto_614326 ?auto_614332 ) ) ( not ( = ?auto_614326 ?auto_614333 ) ) ( not ( = ?auto_614326 ?auto_614334 ) ) ( not ( = ?auto_614326 ?auto_614335 ) ) ( not ( = ?auto_614326 ?auto_614336 ) ) ( not ( = ?auto_614327 ?auto_614328 ) ) ( not ( = ?auto_614327 ?auto_614329 ) ) ( not ( = ?auto_614327 ?auto_614330 ) ) ( not ( = ?auto_614327 ?auto_614331 ) ) ( not ( = ?auto_614327 ?auto_614332 ) ) ( not ( = ?auto_614327 ?auto_614333 ) ) ( not ( = ?auto_614327 ?auto_614334 ) ) ( not ( = ?auto_614327 ?auto_614335 ) ) ( not ( = ?auto_614327 ?auto_614336 ) ) ( not ( = ?auto_614328 ?auto_614329 ) ) ( not ( = ?auto_614328 ?auto_614330 ) ) ( not ( = ?auto_614328 ?auto_614331 ) ) ( not ( = ?auto_614328 ?auto_614332 ) ) ( not ( = ?auto_614328 ?auto_614333 ) ) ( not ( = ?auto_614328 ?auto_614334 ) ) ( not ( = ?auto_614328 ?auto_614335 ) ) ( not ( = ?auto_614328 ?auto_614336 ) ) ( not ( = ?auto_614329 ?auto_614330 ) ) ( not ( = ?auto_614329 ?auto_614331 ) ) ( not ( = ?auto_614329 ?auto_614332 ) ) ( not ( = ?auto_614329 ?auto_614333 ) ) ( not ( = ?auto_614329 ?auto_614334 ) ) ( not ( = ?auto_614329 ?auto_614335 ) ) ( not ( = ?auto_614329 ?auto_614336 ) ) ( not ( = ?auto_614330 ?auto_614331 ) ) ( not ( = ?auto_614330 ?auto_614332 ) ) ( not ( = ?auto_614330 ?auto_614333 ) ) ( not ( = ?auto_614330 ?auto_614334 ) ) ( not ( = ?auto_614330 ?auto_614335 ) ) ( not ( = ?auto_614330 ?auto_614336 ) ) ( not ( = ?auto_614331 ?auto_614332 ) ) ( not ( = ?auto_614331 ?auto_614333 ) ) ( not ( = ?auto_614331 ?auto_614334 ) ) ( not ( = ?auto_614331 ?auto_614335 ) ) ( not ( = ?auto_614331 ?auto_614336 ) ) ( not ( = ?auto_614332 ?auto_614333 ) ) ( not ( = ?auto_614332 ?auto_614334 ) ) ( not ( = ?auto_614332 ?auto_614335 ) ) ( not ( = ?auto_614332 ?auto_614336 ) ) ( not ( = ?auto_614333 ?auto_614334 ) ) ( not ( = ?auto_614333 ?auto_614335 ) ) ( not ( = ?auto_614333 ?auto_614336 ) ) ( not ( = ?auto_614334 ?auto_614335 ) ) ( not ( = ?auto_614334 ?auto_614336 ) ) ( not ( = ?auto_614335 ?auto_614336 ) ) ( ON ?auto_614334 ?auto_614335 ) ( ON ?auto_614333 ?auto_614334 ) ( ON ?auto_614332 ?auto_614333 ) ( ON ?auto_614331 ?auto_614332 ) ( ON ?auto_614330 ?auto_614331 ) ( ON ?auto_614329 ?auto_614330 ) ( CLEAR ?auto_614327 ) ( ON ?auto_614328 ?auto_614329 ) ( CLEAR ?auto_614328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_614326 ?auto_614327 ?auto_614328 )
      ( MAKE-10PILE ?auto_614326 ?auto_614327 ?auto_614328 ?auto_614329 ?auto_614330 ?auto_614331 ?auto_614332 ?auto_614333 ?auto_614334 ?auto_614335 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_614368 - BLOCK
      ?auto_614369 - BLOCK
      ?auto_614370 - BLOCK
      ?auto_614371 - BLOCK
      ?auto_614372 - BLOCK
      ?auto_614373 - BLOCK
      ?auto_614374 - BLOCK
      ?auto_614375 - BLOCK
      ?auto_614376 - BLOCK
      ?auto_614377 - BLOCK
    )
    :vars
    (
      ?auto_614378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614377 ?auto_614378 ) ( ON-TABLE ?auto_614368 ) ( not ( = ?auto_614368 ?auto_614369 ) ) ( not ( = ?auto_614368 ?auto_614370 ) ) ( not ( = ?auto_614368 ?auto_614371 ) ) ( not ( = ?auto_614368 ?auto_614372 ) ) ( not ( = ?auto_614368 ?auto_614373 ) ) ( not ( = ?auto_614368 ?auto_614374 ) ) ( not ( = ?auto_614368 ?auto_614375 ) ) ( not ( = ?auto_614368 ?auto_614376 ) ) ( not ( = ?auto_614368 ?auto_614377 ) ) ( not ( = ?auto_614368 ?auto_614378 ) ) ( not ( = ?auto_614369 ?auto_614370 ) ) ( not ( = ?auto_614369 ?auto_614371 ) ) ( not ( = ?auto_614369 ?auto_614372 ) ) ( not ( = ?auto_614369 ?auto_614373 ) ) ( not ( = ?auto_614369 ?auto_614374 ) ) ( not ( = ?auto_614369 ?auto_614375 ) ) ( not ( = ?auto_614369 ?auto_614376 ) ) ( not ( = ?auto_614369 ?auto_614377 ) ) ( not ( = ?auto_614369 ?auto_614378 ) ) ( not ( = ?auto_614370 ?auto_614371 ) ) ( not ( = ?auto_614370 ?auto_614372 ) ) ( not ( = ?auto_614370 ?auto_614373 ) ) ( not ( = ?auto_614370 ?auto_614374 ) ) ( not ( = ?auto_614370 ?auto_614375 ) ) ( not ( = ?auto_614370 ?auto_614376 ) ) ( not ( = ?auto_614370 ?auto_614377 ) ) ( not ( = ?auto_614370 ?auto_614378 ) ) ( not ( = ?auto_614371 ?auto_614372 ) ) ( not ( = ?auto_614371 ?auto_614373 ) ) ( not ( = ?auto_614371 ?auto_614374 ) ) ( not ( = ?auto_614371 ?auto_614375 ) ) ( not ( = ?auto_614371 ?auto_614376 ) ) ( not ( = ?auto_614371 ?auto_614377 ) ) ( not ( = ?auto_614371 ?auto_614378 ) ) ( not ( = ?auto_614372 ?auto_614373 ) ) ( not ( = ?auto_614372 ?auto_614374 ) ) ( not ( = ?auto_614372 ?auto_614375 ) ) ( not ( = ?auto_614372 ?auto_614376 ) ) ( not ( = ?auto_614372 ?auto_614377 ) ) ( not ( = ?auto_614372 ?auto_614378 ) ) ( not ( = ?auto_614373 ?auto_614374 ) ) ( not ( = ?auto_614373 ?auto_614375 ) ) ( not ( = ?auto_614373 ?auto_614376 ) ) ( not ( = ?auto_614373 ?auto_614377 ) ) ( not ( = ?auto_614373 ?auto_614378 ) ) ( not ( = ?auto_614374 ?auto_614375 ) ) ( not ( = ?auto_614374 ?auto_614376 ) ) ( not ( = ?auto_614374 ?auto_614377 ) ) ( not ( = ?auto_614374 ?auto_614378 ) ) ( not ( = ?auto_614375 ?auto_614376 ) ) ( not ( = ?auto_614375 ?auto_614377 ) ) ( not ( = ?auto_614375 ?auto_614378 ) ) ( not ( = ?auto_614376 ?auto_614377 ) ) ( not ( = ?auto_614376 ?auto_614378 ) ) ( not ( = ?auto_614377 ?auto_614378 ) ) ( ON ?auto_614376 ?auto_614377 ) ( ON ?auto_614375 ?auto_614376 ) ( ON ?auto_614374 ?auto_614375 ) ( ON ?auto_614373 ?auto_614374 ) ( ON ?auto_614372 ?auto_614373 ) ( ON ?auto_614371 ?auto_614372 ) ( ON ?auto_614370 ?auto_614371 ) ( CLEAR ?auto_614368 ) ( ON ?auto_614369 ?auto_614370 ) ( CLEAR ?auto_614369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_614368 ?auto_614369 )
      ( MAKE-10PILE ?auto_614368 ?auto_614369 ?auto_614370 ?auto_614371 ?auto_614372 ?auto_614373 ?auto_614374 ?auto_614375 ?auto_614376 ?auto_614377 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_614410 - BLOCK
      ?auto_614411 - BLOCK
      ?auto_614412 - BLOCK
      ?auto_614413 - BLOCK
      ?auto_614414 - BLOCK
      ?auto_614415 - BLOCK
      ?auto_614416 - BLOCK
      ?auto_614417 - BLOCK
      ?auto_614418 - BLOCK
      ?auto_614419 - BLOCK
    )
    :vars
    (
      ?auto_614420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614419 ?auto_614420 ) ( not ( = ?auto_614410 ?auto_614411 ) ) ( not ( = ?auto_614410 ?auto_614412 ) ) ( not ( = ?auto_614410 ?auto_614413 ) ) ( not ( = ?auto_614410 ?auto_614414 ) ) ( not ( = ?auto_614410 ?auto_614415 ) ) ( not ( = ?auto_614410 ?auto_614416 ) ) ( not ( = ?auto_614410 ?auto_614417 ) ) ( not ( = ?auto_614410 ?auto_614418 ) ) ( not ( = ?auto_614410 ?auto_614419 ) ) ( not ( = ?auto_614410 ?auto_614420 ) ) ( not ( = ?auto_614411 ?auto_614412 ) ) ( not ( = ?auto_614411 ?auto_614413 ) ) ( not ( = ?auto_614411 ?auto_614414 ) ) ( not ( = ?auto_614411 ?auto_614415 ) ) ( not ( = ?auto_614411 ?auto_614416 ) ) ( not ( = ?auto_614411 ?auto_614417 ) ) ( not ( = ?auto_614411 ?auto_614418 ) ) ( not ( = ?auto_614411 ?auto_614419 ) ) ( not ( = ?auto_614411 ?auto_614420 ) ) ( not ( = ?auto_614412 ?auto_614413 ) ) ( not ( = ?auto_614412 ?auto_614414 ) ) ( not ( = ?auto_614412 ?auto_614415 ) ) ( not ( = ?auto_614412 ?auto_614416 ) ) ( not ( = ?auto_614412 ?auto_614417 ) ) ( not ( = ?auto_614412 ?auto_614418 ) ) ( not ( = ?auto_614412 ?auto_614419 ) ) ( not ( = ?auto_614412 ?auto_614420 ) ) ( not ( = ?auto_614413 ?auto_614414 ) ) ( not ( = ?auto_614413 ?auto_614415 ) ) ( not ( = ?auto_614413 ?auto_614416 ) ) ( not ( = ?auto_614413 ?auto_614417 ) ) ( not ( = ?auto_614413 ?auto_614418 ) ) ( not ( = ?auto_614413 ?auto_614419 ) ) ( not ( = ?auto_614413 ?auto_614420 ) ) ( not ( = ?auto_614414 ?auto_614415 ) ) ( not ( = ?auto_614414 ?auto_614416 ) ) ( not ( = ?auto_614414 ?auto_614417 ) ) ( not ( = ?auto_614414 ?auto_614418 ) ) ( not ( = ?auto_614414 ?auto_614419 ) ) ( not ( = ?auto_614414 ?auto_614420 ) ) ( not ( = ?auto_614415 ?auto_614416 ) ) ( not ( = ?auto_614415 ?auto_614417 ) ) ( not ( = ?auto_614415 ?auto_614418 ) ) ( not ( = ?auto_614415 ?auto_614419 ) ) ( not ( = ?auto_614415 ?auto_614420 ) ) ( not ( = ?auto_614416 ?auto_614417 ) ) ( not ( = ?auto_614416 ?auto_614418 ) ) ( not ( = ?auto_614416 ?auto_614419 ) ) ( not ( = ?auto_614416 ?auto_614420 ) ) ( not ( = ?auto_614417 ?auto_614418 ) ) ( not ( = ?auto_614417 ?auto_614419 ) ) ( not ( = ?auto_614417 ?auto_614420 ) ) ( not ( = ?auto_614418 ?auto_614419 ) ) ( not ( = ?auto_614418 ?auto_614420 ) ) ( not ( = ?auto_614419 ?auto_614420 ) ) ( ON ?auto_614418 ?auto_614419 ) ( ON ?auto_614417 ?auto_614418 ) ( ON ?auto_614416 ?auto_614417 ) ( ON ?auto_614415 ?auto_614416 ) ( ON ?auto_614414 ?auto_614415 ) ( ON ?auto_614413 ?auto_614414 ) ( ON ?auto_614412 ?auto_614413 ) ( ON ?auto_614411 ?auto_614412 ) ( ON ?auto_614410 ?auto_614411 ) ( CLEAR ?auto_614410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_614410 )
      ( MAKE-10PILE ?auto_614410 ?auto_614411 ?auto_614412 ?auto_614413 ?auto_614414 ?auto_614415 ?auto_614416 ?auto_614417 ?auto_614418 ?auto_614419 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_614453 - BLOCK
      ?auto_614454 - BLOCK
      ?auto_614455 - BLOCK
      ?auto_614456 - BLOCK
      ?auto_614457 - BLOCK
      ?auto_614458 - BLOCK
      ?auto_614459 - BLOCK
      ?auto_614460 - BLOCK
      ?auto_614461 - BLOCK
      ?auto_614462 - BLOCK
      ?auto_614463 - BLOCK
    )
    :vars
    (
      ?auto_614464 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_614462 ) ( ON ?auto_614463 ?auto_614464 ) ( CLEAR ?auto_614463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_614453 ) ( ON ?auto_614454 ?auto_614453 ) ( ON ?auto_614455 ?auto_614454 ) ( ON ?auto_614456 ?auto_614455 ) ( ON ?auto_614457 ?auto_614456 ) ( ON ?auto_614458 ?auto_614457 ) ( ON ?auto_614459 ?auto_614458 ) ( ON ?auto_614460 ?auto_614459 ) ( ON ?auto_614461 ?auto_614460 ) ( ON ?auto_614462 ?auto_614461 ) ( not ( = ?auto_614453 ?auto_614454 ) ) ( not ( = ?auto_614453 ?auto_614455 ) ) ( not ( = ?auto_614453 ?auto_614456 ) ) ( not ( = ?auto_614453 ?auto_614457 ) ) ( not ( = ?auto_614453 ?auto_614458 ) ) ( not ( = ?auto_614453 ?auto_614459 ) ) ( not ( = ?auto_614453 ?auto_614460 ) ) ( not ( = ?auto_614453 ?auto_614461 ) ) ( not ( = ?auto_614453 ?auto_614462 ) ) ( not ( = ?auto_614453 ?auto_614463 ) ) ( not ( = ?auto_614453 ?auto_614464 ) ) ( not ( = ?auto_614454 ?auto_614455 ) ) ( not ( = ?auto_614454 ?auto_614456 ) ) ( not ( = ?auto_614454 ?auto_614457 ) ) ( not ( = ?auto_614454 ?auto_614458 ) ) ( not ( = ?auto_614454 ?auto_614459 ) ) ( not ( = ?auto_614454 ?auto_614460 ) ) ( not ( = ?auto_614454 ?auto_614461 ) ) ( not ( = ?auto_614454 ?auto_614462 ) ) ( not ( = ?auto_614454 ?auto_614463 ) ) ( not ( = ?auto_614454 ?auto_614464 ) ) ( not ( = ?auto_614455 ?auto_614456 ) ) ( not ( = ?auto_614455 ?auto_614457 ) ) ( not ( = ?auto_614455 ?auto_614458 ) ) ( not ( = ?auto_614455 ?auto_614459 ) ) ( not ( = ?auto_614455 ?auto_614460 ) ) ( not ( = ?auto_614455 ?auto_614461 ) ) ( not ( = ?auto_614455 ?auto_614462 ) ) ( not ( = ?auto_614455 ?auto_614463 ) ) ( not ( = ?auto_614455 ?auto_614464 ) ) ( not ( = ?auto_614456 ?auto_614457 ) ) ( not ( = ?auto_614456 ?auto_614458 ) ) ( not ( = ?auto_614456 ?auto_614459 ) ) ( not ( = ?auto_614456 ?auto_614460 ) ) ( not ( = ?auto_614456 ?auto_614461 ) ) ( not ( = ?auto_614456 ?auto_614462 ) ) ( not ( = ?auto_614456 ?auto_614463 ) ) ( not ( = ?auto_614456 ?auto_614464 ) ) ( not ( = ?auto_614457 ?auto_614458 ) ) ( not ( = ?auto_614457 ?auto_614459 ) ) ( not ( = ?auto_614457 ?auto_614460 ) ) ( not ( = ?auto_614457 ?auto_614461 ) ) ( not ( = ?auto_614457 ?auto_614462 ) ) ( not ( = ?auto_614457 ?auto_614463 ) ) ( not ( = ?auto_614457 ?auto_614464 ) ) ( not ( = ?auto_614458 ?auto_614459 ) ) ( not ( = ?auto_614458 ?auto_614460 ) ) ( not ( = ?auto_614458 ?auto_614461 ) ) ( not ( = ?auto_614458 ?auto_614462 ) ) ( not ( = ?auto_614458 ?auto_614463 ) ) ( not ( = ?auto_614458 ?auto_614464 ) ) ( not ( = ?auto_614459 ?auto_614460 ) ) ( not ( = ?auto_614459 ?auto_614461 ) ) ( not ( = ?auto_614459 ?auto_614462 ) ) ( not ( = ?auto_614459 ?auto_614463 ) ) ( not ( = ?auto_614459 ?auto_614464 ) ) ( not ( = ?auto_614460 ?auto_614461 ) ) ( not ( = ?auto_614460 ?auto_614462 ) ) ( not ( = ?auto_614460 ?auto_614463 ) ) ( not ( = ?auto_614460 ?auto_614464 ) ) ( not ( = ?auto_614461 ?auto_614462 ) ) ( not ( = ?auto_614461 ?auto_614463 ) ) ( not ( = ?auto_614461 ?auto_614464 ) ) ( not ( = ?auto_614462 ?auto_614463 ) ) ( not ( = ?auto_614462 ?auto_614464 ) ) ( not ( = ?auto_614463 ?auto_614464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_614463 ?auto_614464 )
      ( !STACK ?auto_614463 ?auto_614462 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_614499 - BLOCK
      ?auto_614500 - BLOCK
      ?auto_614501 - BLOCK
      ?auto_614502 - BLOCK
      ?auto_614503 - BLOCK
      ?auto_614504 - BLOCK
      ?auto_614505 - BLOCK
      ?auto_614506 - BLOCK
      ?auto_614507 - BLOCK
      ?auto_614508 - BLOCK
      ?auto_614509 - BLOCK
    )
    :vars
    (
      ?auto_614510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614509 ?auto_614510 ) ( ON-TABLE ?auto_614499 ) ( ON ?auto_614500 ?auto_614499 ) ( ON ?auto_614501 ?auto_614500 ) ( ON ?auto_614502 ?auto_614501 ) ( ON ?auto_614503 ?auto_614502 ) ( ON ?auto_614504 ?auto_614503 ) ( ON ?auto_614505 ?auto_614504 ) ( ON ?auto_614506 ?auto_614505 ) ( ON ?auto_614507 ?auto_614506 ) ( not ( = ?auto_614499 ?auto_614500 ) ) ( not ( = ?auto_614499 ?auto_614501 ) ) ( not ( = ?auto_614499 ?auto_614502 ) ) ( not ( = ?auto_614499 ?auto_614503 ) ) ( not ( = ?auto_614499 ?auto_614504 ) ) ( not ( = ?auto_614499 ?auto_614505 ) ) ( not ( = ?auto_614499 ?auto_614506 ) ) ( not ( = ?auto_614499 ?auto_614507 ) ) ( not ( = ?auto_614499 ?auto_614508 ) ) ( not ( = ?auto_614499 ?auto_614509 ) ) ( not ( = ?auto_614499 ?auto_614510 ) ) ( not ( = ?auto_614500 ?auto_614501 ) ) ( not ( = ?auto_614500 ?auto_614502 ) ) ( not ( = ?auto_614500 ?auto_614503 ) ) ( not ( = ?auto_614500 ?auto_614504 ) ) ( not ( = ?auto_614500 ?auto_614505 ) ) ( not ( = ?auto_614500 ?auto_614506 ) ) ( not ( = ?auto_614500 ?auto_614507 ) ) ( not ( = ?auto_614500 ?auto_614508 ) ) ( not ( = ?auto_614500 ?auto_614509 ) ) ( not ( = ?auto_614500 ?auto_614510 ) ) ( not ( = ?auto_614501 ?auto_614502 ) ) ( not ( = ?auto_614501 ?auto_614503 ) ) ( not ( = ?auto_614501 ?auto_614504 ) ) ( not ( = ?auto_614501 ?auto_614505 ) ) ( not ( = ?auto_614501 ?auto_614506 ) ) ( not ( = ?auto_614501 ?auto_614507 ) ) ( not ( = ?auto_614501 ?auto_614508 ) ) ( not ( = ?auto_614501 ?auto_614509 ) ) ( not ( = ?auto_614501 ?auto_614510 ) ) ( not ( = ?auto_614502 ?auto_614503 ) ) ( not ( = ?auto_614502 ?auto_614504 ) ) ( not ( = ?auto_614502 ?auto_614505 ) ) ( not ( = ?auto_614502 ?auto_614506 ) ) ( not ( = ?auto_614502 ?auto_614507 ) ) ( not ( = ?auto_614502 ?auto_614508 ) ) ( not ( = ?auto_614502 ?auto_614509 ) ) ( not ( = ?auto_614502 ?auto_614510 ) ) ( not ( = ?auto_614503 ?auto_614504 ) ) ( not ( = ?auto_614503 ?auto_614505 ) ) ( not ( = ?auto_614503 ?auto_614506 ) ) ( not ( = ?auto_614503 ?auto_614507 ) ) ( not ( = ?auto_614503 ?auto_614508 ) ) ( not ( = ?auto_614503 ?auto_614509 ) ) ( not ( = ?auto_614503 ?auto_614510 ) ) ( not ( = ?auto_614504 ?auto_614505 ) ) ( not ( = ?auto_614504 ?auto_614506 ) ) ( not ( = ?auto_614504 ?auto_614507 ) ) ( not ( = ?auto_614504 ?auto_614508 ) ) ( not ( = ?auto_614504 ?auto_614509 ) ) ( not ( = ?auto_614504 ?auto_614510 ) ) ( not ( = ?auto_614505 ?auto_614506 ) ) ( not ( = ?auto_614505 ?auto_614507 ) ) ( not ( = ?auto_614505 ?auto_614508 ) ) ( not ( = ?auto_614505 ?auto_614509 ) ) ( not ( = ?auto_614505 ?auto_614510 ) ) ( not ( = ?auto_614506 ?auto_614507 ) ) ( not ( = ?auto_614506 ?auto_614508 ) ) ( not ( = ?auto_614506 ?auto_614509 ) ) ( not ( = ?auto_614506 ?auto_614510 ) ) ( not ( = ?auto_614507 ?auto_614508 ) ) ( not ( = ?auto_614507 ?auto_614509 ) ) ( not ( = ?auto_614507 ?auto_614510 ) ) ( not ( = ?auto_614508 ?auto_614509 ) ) ( not ( = ?auto_614508 ?auto_614510 ) ) ( not ( = ?auto_614509 ?auto_614510 ) ) ( CLEAR ?auto_614507 ) ( ON ?auto_614508 ?auto_614509 ) ( CLEAR ?auto_614508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_614499 ?auto_614500 ?auto_614501 ?auto_614502 ?auto_614503 ?auto_614504 ?auto_614505 ?auto_614506 ?auto_614507 ?auto_614508 )
      ( MAKE-11PILE ?auto_614499 ?auto_614500 ?auto_614501 ?auto_614502 ?auto_614503 ?auto_614504 ?auto_614505 ?auto_614506 ?auto_614507 ?auto_614508 ?auto_614509 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_614545 - BLOCK
      ?auto_614546 - BLOCK
      ?auto_614547 - BLOCK
      ?auto_614548 - BLOCK
      ?auto_614549 - BLOCK
      ?auto_614550 - BLOCK
      ?auto_614551 - BLOCK
      ?auto_614552 - BLOCK
      ?auto_614553 - BLOCK
      ?auto_614554 - BLOCK
      ?auto_614555 - BLOCK
    )
    :vars
    (
      ?auto_614556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614555 ?auto_614556 ) ( ON-TABLE ?auto_614545 ) ( ON ?auto_614546 ?auto_614545 ) ( ON ?auto_614547 ?auto_614546 ) ( ON ?auto_614548 ?auto_614547 ) ( ON ?auto_614549 ?auto_614548 ) ( ON ?auto_614550 ?auto_614549 ) ( ON ?auto_614551 ?auto_614550 ) ( ON ?auto_614552 ?auto_614551 ) ( not ( = ?auto_614545 ?auto_614546 ) ) ( not ( = ?auto_614545 ?auto_614547 ) ) ( not ( = ?auto_614545 ?auto_614548 ) ) ( not ( = ?auto_614545 ?auto_614549 ) ) ( not ( = ?auto_614545 ?auto_614550 ) ) ( not ( = ?auto_614545 ?auto_614551 ) ) ( not ( = ?auto_614545 ?auto_614552 ) ) ( not ( = ?auto_614545 ?auto_614553 ) ) ( not ( = ?auto_614545 ?auto_614554 ) ) ( not ( = ?auto_614545 ?auto_614555 ) ) ( not ( = ?auto_614545 ?auto_614556 ) ) ( not ( = ?auto_614546 ?auto_614547 ) ) ( not ( = ?auto_614546 ?auto_614548 ) ) ( not ( = ?auto_614546 ?auto_614549 ) ) ( not ( = ?auto_614546 ?auto_614550 ) ) ( not ( = ?auto_614546 ?auto_614551 ) ) ( not ( = ?auto_614546 ?auto_614552 ) ) ( not ( = ?auto_614546 ?auto_614553 ) ) ( not ( = ?auto_614546 ?auto_614554 ) ) ( not ( = ?auto_614546 ?auto_614555 ) ) ( not ( = ?auto_614546 ?auto_614556 ) ) ( not ( = ?auto_614547 ?auto_614548 ) ) ( not ( = ?auto_614547 ?auto_614549 ) ) ( not ( = ?auto_614547 ?auto_614550 ) ) ( not ( = ?auto_614547 ?auto_614551 ) ) ( not ( = ?auto_614547 ?auto_614552 ) ) ( not ( = ?auto_614547 ?auto_614553 ) ) ( not ( = ?auto_614547 ?auto_614554 ) ) ( not ( = ?auto_614547 ?auto_614555 ) ) ( not ( = ?auto_614547 ?auto_614556 ) ) ( not ( = ?auto_614548 ?auto_614549 ) ) ( not ( = ?auto_614548 ?auto_614550 ) ) ( not ( = ?auto_614548 ?auto_614551 ) ) ( not ( = ?auto_614548 ?auto_614552 ) ) ( not ( = ?auto_614548 ?auto_614553 ) ) ( not ( = ?auto_614548 ?auto_614554 ) ) ( not ( = ?auto_614548 ?auto_614555 ) ) ( not ( = ?auto_614548 ?auto_614556 ) ) ( not ( = ?auto_614549 ?auto_614550 ) ) ( not ( = ?auto_614549 ?auto_614551 ) ) ( not ( = ?auto_614549 ?auto_614552 ) ) ( not ( = ?auto_614549 ?auto_614553 ) ) ( not ( = ?auto_614549 ?auto_614554 ) ) ( not ( = ?auto_614549 ?auto_614555 ) ) ( not ( = ?auto_614549 ?auto_614556 ) ) ( not ( = ?auto_614550 ?auto_614551 ) ) ( not ( = ?auto_614550 ?auto_614552 ) ) ( not ( = ?auto_614550 ?auto_614553 ) ) ( not ( = ?auto_614550 ?auto_614554 ) ) ( not ( = ?auto_614550 ?auto_614555 ) ) ( not ( = ?auto_614550 ?auto_614556 ) ) ( not ( = ?auto_614551 ?auto_614552 ) ) ( not ( = ?auto_614551 ?auto_614553 ) ) ( not ( = ?auto_614551 ?auto_614554 ) ) ( not ( = ?auto_614551 ?auto_614555 ) ) ( not ( = ?auto_614551 ?auto_614556 ) ) ( not ( = ?auto_614552 ?auto_614553 ) ) ( not ( = ?auto_614552 ?auto_614554 ) ) ( not ( = ?auto_614552 ?auto_614555 ) ) ( not ( = ?auto_614552 ?auto_614556 ) ) ( not ( = ?auto_614553 ?auto_614554 ) ) ( not ( = ?auto_614553 ?auto_614555 ) ) ( not ( = ?auto_614553 ?auto_614556 ) ) ( not ( = ?auto_614554 ?auto_614555 ) ) ( not ( = ?auto_614554 ?auto_614556 ) ) ( not ( = ?auto_614555 ?auto_614556 ) ) ( ON ?auto_614554 ?auto_614555 ) ( CLEAR ?auto_614552 ) ( ON ?auto_614553 ?auto_614554 ) ( CLEAR ?auto_614553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_614545 ?auto_614546 ?auto_614547 ?auto_614548 ?auto_614549 ?auto_614550 ?auto_614551 ?auto_614552 ?auto_614553 )
      ( MAKE-11PILE ?auto_614545 ?auto_614546 ?auto_614547 ?auto_614548 ?auto_614549 ?auto_614550 ?auto_614551 ?auto_614552 ?auto_614553 ?auto_614554 ?auto_614555 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_614591 - BLOCK
      ?auto_614592 - BLOCK
      ?auto_614593 - BLOCK
      ?auto_614594 - BLOCK
      ?auto_614595 - BLOCK
      ?auto_614596 - BLOCK
      ?auto_614597 - BLOCK
      ?auto_614598 - BLOCK
      ?auto_614599 - BLOCK
      ?auto_614600 - BLOCK
      ?auto_614601 - BLOCK
    )
    :vars
    (
      ?auto_614602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614601 ?auto_614602 ) ( ON-TABLE ?auto_614591 ) ( ON ?auto_614592 ?auto_614591 ) ( ON ?auto_614593 ?auto_614592 ) ( ON ?auto_614594 ?auto_614593 ) ( ON ?auto_614595 ?auto_614594 ) ( ON ?auto_614596 ?auto_614595 ) ( ON ?auto_614597 ?auto_614596 ) ( not ( = ?auto_614591 ?auto_614592 ) ) ( not ( = ?auto_614591 ?auto_614593 ) ) ( not ( = ?auto_614591 ?auto_614594 ) ) ( not ( = ?auto_614591 ?auto_614595 ) ) ( not ( = ?auto_614591 ?auto_614596 ) ) ( not ( = ?auto_614591 ?auto_614597 ) ) ( not ( = ?auto_614591 ?auto_614598 ) ) ( not ( = ?auto_614591 ?auto_614599 ) ) ( not ( = ?auto_614591 ?auto_614600 ) ) ( not ( = ?auto_614591 ?auto_614601 ) ) ( not ( = ?auto_614591 ?auto_614602 ) ) ( not ( = ?auto_614592 ?auto_614593 ) ) ( not ( = ?auto_614592 ?auto_614594 ) ) ( not ( = ?auto_614592 ?auto_614595 ) ) ( not ( = ?auto_614592 ?auto_614596 ) ) ( not ( = ?auto_614592 ?auto_614597 ) ) ( not ( = ?auto_614592 ?auto_614598 ) ) ( not ( = ?auto_614592 ?auto_614599 ) ) ( not ( = ?auto_614592 ?auto_614600 ) ) ( not ( = ?auto_614592 ?auto_614601 ) ) ( not ( = ?auto_614592 ?auto_614602 ) ) ( not ( = ?auto_614593 ?auto_614594 ) ) ( not ( = ?auto_614593 ?auto_614595 ) ) ( not ( = ?auto_614593 ?auto_614596 ) ) ( not ( = ?auto_614593 ?auto_614597 ) ) ( not ( = ?auto_614593 ?auto_614598 ) ) ( not ( = ?auto_614593 ?auto_614599 ) ) ( not ( = ?auto_614593 ?auto_614600 ) ) ( not ( = ?auto_614593 ?auto_614601 ) ) ( not ( = ?auto_614593 ?auto_614602 ) ) ( not ( = ?auto_614594 ?auto_614595 ) ) ( not ( = ?auto_614594 ?auto_614596 ) ) ( not ( = ?auto_614594 ?auto_614597 ) ) ( not ( = ?auto_614594 ?auto_614598 ) ) ( not ( = ?auto_614594 ?auto_614599 ) ) ( not ( = ?auto_614594 ?auto_614600 ) ) ( not ( = ?auto_614594 ?auto_614601 ) ) ( not ( = ?auto_614594 ?auto_614602 ) ) ( not ( = ?auto_614595 ?auto_614596 ) ) ( not ( = ?auto_614595 ?auto_614597 ) ) ( not ( = ?auto_614595 ?auto_614598 ) ) ( not ( = ?auto_614595 ?auto_614599 ) ) ( not ( = ?auto_614595 ?auto_614600 ) ) ( not ( = ?auto_614595 ?auto_614601 ) ) ( not ( = ?auto_614595 ?auto_614602 ) ) ( not ( = ?auto_614596 ?auto_614597 ) ) ( not ( = ?auto_614596 ?auto_614598 ) ) ( not ( = ?auto_614596 ?auto_614599 ) ) ( not ( = ?auto_614596 ?auto_614600 ) ) ( not ( = ?auto_614596 ?auto_614601 ) ) ( not ( = ?auto_614596 ?auto_614602 ) ) ( not ( = ?auto_614597 ?auto_614598 ) ) ( not ( = ?auto_614597 ?auto_614599 ) ) ( not ( = ?auto_614597 ?auto_614600 ) ) ( not ( = ?auto_614597 ?auto_614601 ) ) ( not ( = ?auto_614597 ?auto_614602 ) ) ( not ( = ?auto_614598 ?auto_614599 ) ) ( not ( = ?auto_614598 ?auto_614600 ) ) ( not ( = ?auto_614598 ?auto_614601 ) ) ( not ( = ?auto_614598 ?auto_614602 ) ) ( not ( = ?auto_614599 ?auto_614600 ) ) ( not ( = ?auto_614599 ?auto_614601 ) ) ( not ( = ?auto_614599 ?auto_614602 ) ) ( not ( = ?auto_614600 ?auto_614601 ) ) ( not ( = ?auto_614600 ?auto_614602 ) ) ( not ( = ?auto_614601 ?auto_614602 ) ) ( ON ?auto_614600 ?auto_614601 ) ( ON ?auto_614599 ?auto_614600 ) ( CLEAR ?auto_614597 ) ( ON ?auto_614598 ?auto_614599 ) ( CLEAR ?auto_614598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_614591 ?auto_614592 ?auto_614593 ?auto_614594 ?auto_614595 ?auto_614596 ?auto_614597 ?auto_614598 )
      ( MAKE-11PILE ?auto_614591 ?auto_614592 ?auto_614593 ?auto_614594 ?auto_614595 ?auto_614596 ?auto_614597 ?auto_614598 ?auto_614599 ?auto_614600 ?auto_614601 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_614637 - BLOCK
      ?auto_614638 - BLOCK
      ?auto_614639 - BLOCK
      ?auto_614640 - BLOCK
      ?auto_614641 - BLOCK
      ?auto_614642 - BLOCK
      ?auto_614643 - BLOCK
      ?auto_614644 - BLOCK
      ?auto_614645 - BLOCK
      ?auto_614646 - BLOCK
      ?auto_614647 - BLOCK
    )
    :vars
    (
      ?auto_614648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614647 ?auto_614648 ) ( ON-TABLE ?auto_614637 ) ( ON ?auto_614638 ?auto_614637 ) ( ON ?auto_614639 ?auto_614638 ) ( ON ?auto_614640 ?auto_614639 ) ( ON ?auto_614641 ?auto_614640 ) ( ON ?auto_614642 ?auto_614641 ) ( not ( = ?auto_614637 ?auto_614638 ) ) ( not ( = ?auto_614637 ?auto_614639 ) ) ( not ( = ?auto_614637 ?auto_614640 ) ) ( not ( = ?auto_614637 ?auto_614641 ) ) ( not ( = ?auto_614637 ?auto_614642 ) ) ( not ( = ?auto_614637 ?auto_614643 ) ) ( not ( = ?auto_614637 ?auto_614644 ) ) ( not ( = ?auto_614637 ?auto_614645 ) ) ( not ( = ?auto_614637 ?auto_614646 ) ) ( not ( = ?auto_614637 ?auto_614647 ) ) ( not ( = ?auto_614637 ?auto_614648 ) ) ( not ( = ?auto_614638 ?auto_614639 ) ) ( not ( = ?auto_614638 ?auto_614640 ) ) ( not ( = ?auto_614638 ?auto_614641 ) ) ( not ( = ?auto_614638 ?auto_614642 ) ) ( not ( = ?auto_614638 ?auto_614643 ) ) ( not ( = ?auto_614638 ?auto_614644 ) ) ( not ( = ?auto_614638 ?auto_614645 ) ) ( not ( = ?auto_614638 ?auto_614646 ) ) ( not ( = ?auto_614638 ?auto_614647 ) ) ( not ( = ?auto_614638 ?auto_614648 ) ) ( not ( = ?auto_614639 ?auto_614640 ) ) ( not ( = ?auto_614639 ?auto_614641 ) ) ( not ( = ?auto_614639 ?auto_614642 ) ) ( not ( = ?auto_614639 ?auto_614643 ) ) ( not ( = ?auto_614639 ?auto_614644 ) ) ( not ( = ?auto_614639 ?auto_614645 ) ) ( not ( = ?auto_614639 ?auto_614646 ) ) ( not ( = ?auto_614639 ?auto_614647 ) ) ( not ( = ?auto_614639 ?auto_614648 ) ) ( not ( = ?auto_614640 ?auto_614641 ) ) ( not ( = ?auto_614640 ?auto_614642 ) ) ( not ( = ?auto_614640 ?auto_614643 ) ) ( not ( = ?auto_614640 ?auto_614644 ) ) ( not ( = ?auto_614640 ?auto_614645 ) ) ( not ( = ?auto_614640 ?auto_614646 ) ) ( not ( = ?auto_614640 ?auto_614647 ) ) ( not ( = ?auto_614640 ?auto_614648 ) ) ( not ( = ?auto_614641 ?auto_614642 ) ) ( not ( = ?auto_614641 ?auto_614643 ) ) ( not ( = ?auto_614641 ?auto_614644 ) ) ( not ( = ?auto_614641 ?auto_614645 ) ) ( not ( = ?auto_614641 ?auto_614646 ) ) ( not ( = ?auto_614641 ?auto_614647 ) ) ( not ( = ?auto_614641 ?auto_614648 ) ) ( not ( = ?auto_614642 ?auto_614643 ) ) ( not ( = ?auto_614642 ?auto_614644 ) ) ( not ( = ?auto_614642 ?auto_614645 ) ) ( not ( = ?auto_614642 ?auto_614646 ) ) ( not ( = ?auto_614642 ?auto_614647 ) ) ( not ( = ?auto_614642 ?auto_614648 ) ) ( not ( = ?auto_614643 ?auto_614644 ) ) ( not ( = ?auto_614643 ?auto_614645 ) ) ( not ( = ?auto_614643 ?auto_614646 ) ) ( not ( = ?auto_614643 ?auto_614647 ) ) ( not ( = ?auto_614643 ?auto_614648 ) ) ( not ( = ?auto_614644 ?auto_614645 ) ) ( not ( = ?auto_614644 ?auto_614646 ) ) ( not ( = ?auto_614644 ?auto_614647 ) ) ( not ( = ?auto_614644 ?auto_614648 ) ) ( not ( = ?auto_614645 ?auto_614646 ) ) ( not ( = ?auto_614645 ?auto_614647 ) ) ( not ( = ?auto_614645 ?auto_614648 ) ) ( not ( = ?auto_614646 ?auto_614647 ) ) ( not ( = ?auto_614646 ?auto_614648 ) ) ( not ( = ?auto_614647 ?auto_614648 ) ) ( ON ?auto_614646 ?auto_614647 ) ( ON ?auto_614645 ?auto_614646 ) ( ON ?auto_614644 ?auto_614645 ) ( CLEAR ?auto_614642 ) ( ON ?auto_614643 ?auto_614644 ) ( CLEAR ?auto_614643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_614637 ?auto_614638 ?auto_614639 ?auto_614640 ?auto_614641 ?auto_614642 ?auto_614643 )
      ( MAKE-11PILE ?auto_614637 ?auto_614638 ?auto_614639 ?auto_614640 ?auto_614641 ?auto_614642 ?auto_614643 ?auto_614644 ?auto_614645 ?auto_614646 ?auto_614647 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_614683 - BLOCK
      ?auto_614684 - BLOCK
      ?auto_614685 - BLOCK
      ?auto_614686 - BLOCK
      ?auto_614687 - BLOCK
      ?auto_614688 - BLOCK
      ?auto_614689 - BLOCK
      ?auto_614690 - BLOCK
      ?auto_614691 - BLOCK
      ?auto_614692 - BLOCK
      ?auto_614693 - BLOCK
    )
    :vars
    (
      ?auto_614694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614693 ?auto_614694 ) ( ON-TABLE ?auto_614683 ) ( ON ?auto_614684 ?auto_614683 ) ( ON ?auto_614685 ?auto_614684 ) ( ON ?auto_614686 ?auto_614685 ) ( ON ?auto_614687 ?auto_614686 ) ( not ( = ?auto_614683 ?auto_614684 ) ) ( not ( = ?auto_614683 ?auto_614685 ) ) ( not ( = ?auto_614683 ?auto_614686 ) ) ( not ( = ?auto_614683 ?auto_614687 ) ) ( not ( = ?auto_614683 ?auto_614688 ) ) ( not ( = ?auto_614683 ?auto_614689 ) ) ( not ( = ?auto_614683 ?auto_614690 ) ) ( not ( = ?auto_614683 ?auto_614691 ) ) ( not ( = ?auto_614683 ?auto_614692 ) ) ( not ( = ?auto_614683 ?auto_614693 ) ) ( not ( = ?auto_614683 ?auto_614694 ) ) ( not ( = ?auto_614684 ?auto_614685 ) ) ( not ( = ?auto_614684 ?auto_614686 ) ) ( not ( = ?auto_614684 ?auto_614687 ) ) ( not ( = ?auto_614684 ?auto_614688 ) ) ( not ( = ?auto_614684 ?auto_614689 ) ) ( not ( = ?auto_614684 ?auto_614690 ) ) ( not ( = ?auto_614684 ?auto_614691 ) ) ( not ( = ?auto_614684 ?auto_614692 ) ) ( not ( = ?auto_614684 ?auto_614693 ) ) ( not ( = ?auto_614684 ?auto_614694 ) ) ( not ( = ?auto_614685 ?auto_614686 ) ) ( not ( = ?auto_614685 ?auto_614687 ) ) ( not ( = ?auto_614685 ?auto_614688 ) ) ( not ( = ?auto_614685 ?auto_614689 ) ) ( not ( = ?auto_614685 ?auto_614690 ) ) ( not ( = ?auto_614685 ?auto_614691 ) ) ( not ( = ?auto_614685 ?auto_614692 ) ) ( not ( = ?auto_614685 ?auto_614693 ) ) ( not ( = ?auto_614685 ?auto_614694 ) ) ( not ( = ?auto_614686 ?auto_614687 ) ) ( not ( = ?auto_614686 ?auto_614688 ) ) ( not ( = ?auto_614686 ?auto_614689 ) ) ( not ( = ?auto_614686 ?auto_614690 ) ) ( not ( = ?auto_614686 ?auto_614691 ) ) ( not ( = ?auto_614686 ?auto_614692 ) ) ( not ( = ?auto_614686 ?auto_614693 ) ) ( not ( = ?auto_614686 ?auto_614694 ) ) ( not ( = ?auto_614687 ?auto_614688 ) ) ( not ( = ?auto_614687 ?auto_614689 ) ) ( not ( = ?auto_614687 ?auto_614690 ) ) ( not ( = ?auto_614687 ?auto_614691 ) ) ( not ( = ?auto_614687 ?auto_614692 ) ) ( not ( = ?auto_614687 ?auto_614693 ) ) ( not ( = ?auto_614687 ?auto_614694 ) ) ( not ( = ?auto_614688 ?auto_614689 ) ) ( not ( = ?auto_614688 ?auto_614690 ) ) ( not ( = ?auto_614688 ?auto_614691 ) ) ( not ( = ?auto_614688 ?auto_614692 ) ) ( not ( = ?auto_614688 ?auto_614693 ) ) ( not ( = ?auto_614688 ?auto_614694 ) ) ( not ( = ?auto_614689 ?auto_614690 ) ) ( not ( = ?auto_614689 ?auto_614691 ) ) ( not ( = ?auto_614689 ?auto_614692 ) ) ( not ( = ?auto_614689 ?auto_614693 ) ) ( not ( = ?auto_614689 ?auto_614694 ) ) ( not ( = ?auto_614690 ?auto_614691 ) ) ( not ( = ?auto_614690 ?auto_614692 ) ) ( not ( = ?auto_614690 ?auto_614693 ) ) ( not ( = ?auto_614690 ?auto_614694 ) ) ( not ( = ?auto_614691 ?auto_614692 ) ) ( not ( = ?auto_614691 ?auto_614693 ) ) ( not ( = ?auto_614691 ?auto_614694 ) ) ( not ( = ?auto_614692 ?auto_614693 ) ) ( not ( = ?auto_614692 ?auto_614694 ) ) ( not ( = ?auto_614693 ?auto_614694 ) ) ( ON ?auto_614692 ?auto_614693 ) ( ON ?auto_614691 ?auto_614692 ) ( ON ?auto_614690 ?auto_614691 ) ( ON ?auto_614689 ?auto_614690 ) ( CLEAR ?auto_614687 ) ( ON ?auto_614688 ?auto_614689 ) ( CLEAR ?auto_614688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_614683 ?auto_614684 ?auto_614685 ?auto_614686 ?auto_614687 ?auto_614688 )
      ( MAKE-11PILE ?auto_614683 ?auto_614684 ?auto_614685 ?auto_614686 ?auto_614687 ?auto_614688 ?auto_614689 ?auto_614690 ?auto_614691 ?auto_614692 ?auto_614693 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_614729 - BLOCK
      ?auto_614730 - BLOCK
      ?auto_614731 - BLOCK
      ?auto_614732 - BLOCK
      ?auto_614733 - BLOCK
      ?auto_614734 - BLOCK
      ?auto_614735 - BLOCK
      ?auto_614736 - BLOCK
      ?auto_614737 - BLOCK
      ?auto_614738 - BLOCK
      ?auto_614739 - BLOCK
    )
    :vars
    (
      ?auto_614740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614739 ?auto_614740 ) ( ON-TABLE ?auto_614729 ) ( ON ?auto_614730 ?auto_614729 ) ( ON ?auto_614731 ?auto_614730 ) ( ON ?auto_614732 ?auto_614731 ) ( not ( = ?auto_614729 ?auto_614730 ) ) ( not ( = ?auto_614729 ?auto_614731 ) ) ( not ( = ?auto_614729 ?auto_614732 ) ) ( not ( = ?auto_614729 ?auto_614733 ) ) ( not ( = ?auto_614729 ?auto_614734 ) ) ( not ( = ?auto_614729 ?auto_614735 ) ) ( not ( = ?auto_614729 ?auto_614736 ) ) ( not ( = ?auto_614729 ?auto_614737 ) ) ( not ( = ?auto_614729 ?auto_614738 ) ) ( not ( = ?auto_614729 ?auto_614739 ) ) ( not ( = ?auto_614729 ?auto_614740 ) ) ( not ( = ?auto_614730 ?auto_614731 ) ) ( not ( = ?auto_614730 ?auto_614732 ) ) ( not ( = ?auto_614730 ?auto_614733 ) ) ( not ( = ?auto_614730 ?auto_614734 ) ) ( not ( = ?auto_614730 ?auto_614735 ) ) ( not ( = ?auto_614730 ?auto_614736 ) ) ( not ( = ?auto_614730 ?auto_614737 ) ) ( not ( = ?auto_614730 ?auto_614738 ) ) ( not ( = ?auto_614730 ?auto_614739 ) ) ( not ( = ?auto_614730 ?auto_614740 ) ) ( not ( = ?auto_614731 ?auto_614732 ) ) ( not ( = ?auto_614731 ?auto_614733 ) ) ( not ( = ?auto_614731 ?auto_614734 ) ) ( not ( = ?auto_614731 ?auto_614735 ) ) ( not ( = ?auto_614731 ?auto_614736 ) ) ( not ( = ?auto_614731 ?auto_614737 ) ) ( not ( = ?auto_614731 ?auto_614738 ) ) ( not ( = ?auto_614731 ?auto_614739 ) ) ( not ( = ?auto_614731 ?auto_614740 ) ) ( not ( = ?auto_614732 ?auto_614733 ) ) ( not ( = ?auto_614732 ?auto_614734 ) ) ( not ( = ?auto_614732 ?auto_614735 ) ) ( not ( = ?auto_614732 ?auto_614736 ) ) ( not ( = ?auto_614732 ?auto_614737 ) ) ( not ( = ?auto_614732 ?auto_614738 ) ) ( not ( = ?auto_614732 ?auto_614739 ) ) ( not ( = ?auto_614732 ?auto_614740 ) ) ( not ( = ?auto_614733 ?auto_614734 ) ) ( not ( = ?auto_614733 ?auto_614735 ) ) ( not ( = ?auto_614733 ?auto_614736 ) ) ( not ( = ?auto_614733 ?auto_614737 ) ) ( not ( = ?auto_614733 ?auto_614738 ) ) ( not ( = ?auto_614733 ?auto_614739 ) ) ( not ( = ?auto_614733 ?auto_614740 ) ) ( not ( = ?auto_614734 ?auto_614735 ) ) ( not ( = ?auto_614734 ?auto_614736 ) ) ( not ( = ?auto_614734 ?auto_614737 ) ) ( not ( = ?auto_614734 ?auto_614738 ) ) ( not ( = ?auto_614734 ?auto_614739 ) ) ( not ( = ?auto_614734 ?auto_614740 ) ) ( not ( = ?auto_614735 ?auto_614736 ) ) ( not ( = ?auto_614735 ?auto_614737 ) ) ( not ( = ?auto_614735 ?auto_614738 ) ) ( not ( = ?auto_614735 ?auto_614739 ) ) ( not ( = ?auto_614735 ?auto_614740 ) ) ( not ( = ?auto_614736 ?auto_614737 ) ) ( not ( = ?auto_614736 ?auto_614738 ) ) ( not ( = ?auto_614736 ?auto_614739 ) ) ( not ( = ?auto_614736 ?auto_614740 ) ) ( not ( = ?auto_614737 ?auto_614738 ) ) ( not ( = ?auto_614737 ?auto_614739 ) ) ( not ( = ?auto_614737 ?auto_614740 ) ) ( not ( = ?auto_614738 ?auto_614739 ) ) ( not ( = ?auto_614738 ?auto_614740 ) ) ( not ( = ?auto_614739 ?auto_614740 ) ) ( ON ?auto_614738 ?auto_614739 ) ( ON ?auto_614737 ?auto_614738 ) ( ON ?auto_614736 ?auto_614737 ) ( ON ?auto_614735 ?auto_614736 ) ( ON ?auto_614734 ?auto_614735 ) ( CLEAR ?auto_614732 ) ( ON ?auto_614733 ?auto_614734 ) ( CLEAR ?auto_614733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_614729 ?auto_614730 ?auto_614731 ?auto_614732 ?auto_614733 )
      ( MAKE-11PILE ?auto_614729 ?auto_614730 ?auto_614731 ?auto_614732 ?auto_614733 ?auto_614734 ?auto_614735 ?auto_614736 ?auto_614737 ?auto_614738 ?auto_614739 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_614775 - BLOCK
      ?auto_614776 - BLOCK
      ?auto_614777 - BLOCK
      ?auto_614778 - BLOCK
      ?auto_614779 - BLOCK
      ?auto_614780 - BLOCK
      ?auto_614781 - BLOCK
      ?auto_614782 - BLOCK
      ?auto_614783 - BLOCK
      ?auto_614784 - BLOCK
      ?auto_614785 - BLOCK
    )
    :vars
    (
      ?auto_614786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614785 ?auto_614786 ) ( ON-TABLE ?auto_614775 ) ( ON ?auto_614776 ?auto_614775 ) ( ON ?auto_614777 ?auto_614776 ) ( not ( = ?auto_614775 ?auto_614776 ) ) ( not ( = ?auto_614775 ?auto_614777 ) ) ( not ( = ?auto_614775 ?auto_614778 ) ) ( not ( = ?auto_614775 ?auto_614779 ) ) ( not ( = ?auto_614775 ?auto_614780 ) ) ( not ( = ?auto_614775 ?auto_614781 ) ) ( not ( = ?auto_614775 ?auto_614782 ) ) ( not ( = ?auto_614775 ?auto_614783 ) ) ( not ( = ?auto_614775 ?auto_614784 ) ) ( not ( = ?auto_614775 ?auto_614785 ) ) ( not ( = ?auto_614775 ?auto_614786 ) ) ( not ( = ?auto_614776 ?auto_614777 ) ) ( not ( = ?auto_614776 ?auto_614778 ) ) ( not ( = ?auto_614776 ?auto_614779 ) ) ( not ( = ?auto_614776 ?auto_614780 ) ) ( not ( = ?auto_614776 ?auto_614781 ) ) ( not ( = ?auto_614776 ?auto_614782 ) ) ( not ( = ?auto_614776 ?auto_614783 ) ) ( not ( = ?auto_614776 ?auto_614784 ) ) ( not ( = ?auto_614776 ?auto_614785 ) ) ( not ( = ?auto_614776 ?auto_614786 ) ) ( not ( = ?auto_614777 ?auto_614778 ) ) ( not ( = ?auto_614777 ?auto_614779 ) ) ( not ( = ?auto_614777 ?auto_614780 ) ) ( not ( = ?auto_614777 ?auto_614781 ) ) ( not ( = ?auto_614777 ?auto_614782 ) ) ( not ( = ?auto_614777 ?auto_614783 ) ) ( not ( = ?auto_614777 ?auto_614784 ) ) ( not ( = ?auto_614777 ?auto_614785 ) ) ( not ( = ?auto_614777 ?auto_614786 ) ) ( not ( = ?auto_614778 ?auto_614779 ) ) ( not ( = ?auto_614778 ?auto_614780 ) ) ( not ( = ?auto_614778 ?auto_614781 ) ) ( not ( = ?auto_614778 ?auto_614782 ) ) ( not ( = ?auto_614778 ?auto_614783 ) ) ( not ( = ?auto_614778 ?auto_614784 ) ) ( not ( = ?auto_614778 ?auto_614785 ) ) ( not ( = ?auto_614778 ?auto_614786 ) ) ( not ( = ?auto_614779 ?auto_614780 ) ) ( not ( = ?auto_614779 ?auto_614781 ) ) ( not ( = ?auto_614779 ?auto_614782 ) ) ( not ( = ?auto_614779 ?auto_614783 ) ) ( not ( = ?auto_614779 ?auto_614784 ) ) ( not ( = ?auto_614779 ?auto_614785 ) ) ( not ( = ?auto_614779 ?auto_614786 ) ) ( not ( = ?auto_614780 ?auto_614781 ) ) ( not ( = ?auto_614780 ?auto_614782 ) ) ( not ( = ?auto_614780 ?auto_614783 ) ) ( not ( = ?auto_614780 ?auto_614784 ) ) ( not ( = ?auto_614780 ?auto_614785 ) ) ( not ( = ?auto_614780 ?auto_614786 ) ) ( not ( = ?auto_614781 ?auto_614782 ) ) ( not ( = ?auto_614781 ?auto_614783 ) ) ( not ( = ?auto_614781 ?auto_614784 ) ) ( not ( = ?auto_614781 ?auto_614785 ) ) ( not ( = ?auto_614781 ?auto_614786 ) ) ( not ( = ?auto_614782 ?auto_614783 ) ) ( not ( = ?auto_614782 ?auto_614784 ) ) ( not ( = ?auto_614782 ?auto_614785 ) ) ( not ( = ?auto_614782 ?auto_614786 ) ) ( not ( = ?auto_614783 ?auto_614784 ) ) ( not ( = ?auto_614783 ?auto_614785 ) ) ( not ( = ?auto_614783 ?auto_614786 ) ) ( not ( = ?auto_614784 ?auto_614785 ) ) ( not ( = ?auto_614784 ?auto_614786 ) ) ( not ( = ?auto_614785 ?auto_614786 ) ) ( ON ?auto_614784 ?auto_614785 ) ( ON ?auto_614783 ?auto_614784 ) ( ON ?auto_614782 ?auto_614783 ) ( ON ?auto_614781 ?auto_614782 ) ( ON ?auto_614780 ?auto_614781 ) ( ON ?auto_614779 ?auto_614780 ) ( CLEAR ?auto_614777 ) ( ON ?auto_614778 ?auto_614779 ) ( CLEAR ?auto_614778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_614775 ?auto_614776 ?auto_614777 ?auto_614778 )
      ( MAKE-11PILE ?auto_614775 ?auto_614776 ?auto_614777 ?auto_614778 ?auto_614779 ?auto_614780 ?auto_614781 ?auto_614782 ?auto_614783 ?auto_614784 ?auto_614785 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_614821 - BLOCK
      ?auto_614822 - BLOCK
      ?auto_614823 - BLOCK
      ?auto_614824 - BLOCK
      ?auto_614825 - BLOCK
      ?auto_614826 - BLOCK
      ?auto_614827 - BLOCK
      ?auto_614828 - BLOCK
      ?auto_614829 - BLOCK
      ?auto_614830 - BLOCK
      ?auto_614831 - BLOCK
    )
    :vars
    (
      ?auto_614832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614831 ?auto_614832 ) ( ON-TABLE ?auto_614821 ) ( ON ?auto_614822 ?auto_614821 ) ( not ( = ?auto_614821 ?auto_614822 ) ) ( not ( = ?auto_614821 ?auto_614823 ) ) ( not ( = ?auto_614821 ?auto_614824 ) ) ( not ( = ?auto_614821 ?auto_614825 ) ) ( not ( = ?auto_614821 ?auto_614826 ) ) ( not ( = ?auto_614821 ?auto_614827 ) ) ( not ( = ?auto_614821 ?auto_614828 ) ) ( not ( = ?auto_614821 ?auto_614829 ) ) ( not ( = ?auto_614821 ?auto_614830 ) ) ( not ( = ?auto_614821 ?auto_614831 ) ) ( not ( = ?auto_614821 ?auto_614832 ) ) ( not ( = ?auto_614822 ?auto_614823 ) ) ( not ( = ?auto_614822 ?auto_614824 ) ) ( not ( = ?auto_614822 ?auto_614825 ) ) ( not ( = ?auto_614822 ?auto_614826 ) ) ( not ( = ?auto_614822 ?auto_614827 ) ) ( not ( = ?auto_614822 ?auto_614828 ) ) ( not ( = ?auto_614822 ?auto_614829 ) ) ( not ( = ?auto_614822 ?auto_614830 ) ) ( not ( = ?auto_614822 ?auto_614831 ) ) ( not ( = ?auto_614822 ?auto_614832 ) ) ( not ( = ?auto_614823 ?auto_614824 ) ) ( not ( = ?auto_614823 ?auto_614825 ) ) ( not ( = ?auto_614823 ?auto_614826 ) ) ( not ( = ?auto_614823 ?auto_614827 ) ) ( not ( = ?auto_614823 ?auto_614828 ) ) ( not ( = ?auto_614823 ?auto_614829 ) ) ( not ( = ?auto_614823 ?auto_614830 ) ) ( not ( = ?auto_614823 ?auto_614831 ) ) ( not ( = ?auto_614823 ?auto_614832 ) ) ( not ( = ?auto_614824 ?auto_614825 ) ) ( not ( = ?auto_614824 ?auto_614826 ) ) ( not ( = ?auto_614824 ?auto_614827 ) ) ( not ( = ?auto_614824 ?auto_614828 ) ) ( not ( = ?auto_614824 ?auto_614829 ) ) ( not ( = ?auto_614824 ?auto_614830 ) ) ( not ( = ?auto_614824 ?auto_614831 ) ) ( not ( = ?auto_614824 ?auto_614832 ) ) ( not ( = ?auto_614825 ?auto_614826 ) ) ( not ( = ?auto_614825 ?auto_614827 ) ) ( not ( = ?auto_614825 ?auto_614828 ) ) ( not ( = ?auto_614825 ?auto_614829 ) ) ( not ( = ?auto_614825 ?auto_614830 ) ) ( not ( = ?auto_614825 ?auto_614831 ) ) ( not ( = ?auto_614825 ?auto_614832 ) ) ( not ( = ?auto_614826 ?auto_614827 ) ) ( not ( = ?auto_614826 ?auto_614828 ) ) ( not ( = ?auto_614826 ?auto_614829 ) ) ( not ( = ?auto_614826 ?auto_614830 ) ) ( not ( = ?auto_614826 ?auto_614831 ) ) ( not ( = ?auto_614826 ?auto_614832 ) ) ( not ( = ?auto_614827 ?auto_614828 ) ) ( not ( = ?auto_614827 ?auto_614829 ) ) ( not ( = ?auto_614827 ?auto_614830 ) ) ( not ( = ?auto_614827 ?auto_614831 ) ) ( not ( = ?auto_614827 ?auto_614832 ) ) ( not ( = ?auto_614828 ?auto_614829 ) ) ( not ( = ?auto_614828 ?auto_614830 ) ) ( not ( = ?auto_614828 ?auto_614831 ) ) ( not ( = ?auto_614828 ?auto_614832 ) ) ( not ( = ?auto_614829 ?auto_614830 ) ) ( not ( = ?auto_614829 ?auto_614831 ) ) ( not ( = ?auto_614829 ?auto_614832 ) ) ( not ( = ?auto_614830 ?auto_614831 ) ) ( not ( = ?auto_614830 ?auto_614832 ) ) ( not ( = ?auto_614831 ?auto_614832 ) ) ( ON ?auto_614830 ?auto_614831 ) ( ON ?auto_614829 ?auto_614830 ) ( ON ?auto_614828 ?auto_614829 ) ( ON ?auto_614827 ?auto_614828 ) ( ON ?auto_614826 ?auto_614827 ) ( ON ?auto_614825 ?auto_614826 ) ( ON ?auto_614824 ?auto_614825 ) ( CLEAR ?auto_614822 ) ( ON ?auto_614823 ?auto_614824 ) ( CLEAR ?auto_614823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_614821 ?auto_614822 ?auto_614823 )
      ( MAKE-11PILE ?auto_614821 ?auto_614822 ?auto_614823 ?auto_614824 ?auto_614825 ?auto_614826 ?auto_614827 ?auto_614828 ?auto_614829 ?auto_614830 ?auto_614831 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_614867 - BLOCK
      ?auto_614868 - BLOCK
      ?auto_614869 - BLOCK
      ?auto_614870 - BLOCK
      ?auto_614871 - BLOCK
      ?auto_614872 - BLOCK
      ?auto_614873 - BLOCK
      ?auto_614874 - BLOCK
      ?auto_614875 - BLOCK
      ?auto_614876 - BLOCK
      ?auto_614877 - BLOCK
    )
    :vars
    (
      ?auto_614878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614877 ?auto_614878 ) ( ON-TABLE ?auto_614867 ) ( not ( = ?auto_614867 ?auto_614868 ) ) ( not ( = ?auto_614867 ?auto_614869 ) ) ( not ( = ?auto_614867 ?auto_614870 ) ) ( not ( = ?auto_614867 ?auto_614871 ) ) ( not ( = ?auto_614867 ?auto_614872 ) ) ( not ( = ?auto_614867 ?auto_614873 ) ) ( not ( = ?auto_614867 ?auto_614874 ) ) ( not ( = ?auto_614867 ?auto_614875 ) ) ( not ( = ?auto_614867 ?auto_614876 ) ) ( not ( = ?auto_614867 ?auto_614877 ) ) ( not ( = ?auto_614867 ?auto_614878 ) ) ( not ( = ?auto_614868 ?auto_614869 ) ) ( not ( = ?auto_614868 ?auto_614870 ) ) ( not ( = ?auto_614868 ?auto_614871 ) ) ( not ( = ?auto_614868 ?auto_614872 ) ) ( not ( = ?auto_614868 ?auto_614873 ) ) ( not ( = ?auto_614868 ?auto_614874 ) ) ( not ( = ?auto_614868 ?auto_614875 ) ) ( not ( = ?auto_614868 ?auto_614876 ) ) ( not ( = ?auto_614868 ?auto_614877 ) ) ( not ( = ?auto_614868 ?auto_614878 ) ) ( not ( = ?auto_614869 ?auto_614870 ) ) ( not ( = ?auto_614869 ?auto_614871 ) ) ( not ( = ?auto_614869 ?auto_614872 ) ) ( not ( = ?auto_614869 ?auto_614873 ) ) ( not ( = ?auto_614869 ?auto_614874 ) ) ( not ( = ?auto_614869 ?auto_614875 ) ) ( not ( = ?auto_614869 ?auto_614876 ) ) ( not ( = ?auto_614869 ?auto_614877 ) ) ( not ( = ?auto_614869 ?auto_614878 ) ) ( not ( = ?auto_614870 ?auto_614871 ) ) ( not ( = ?auto_614870 ?auto_614872 ) ) ( not ( = ?auto_614870 ?auto_614873 ) ) ( not ( = ?auto_614870 ?auto_614874 ) ) ( not ( = ?auto_614870 ?auto_614875 ) ) ( not ( = ?auto_614870 ?auto_614876 ) ) ( not ( = ?auto_614870 ?auto_614877 ) ) ( not ( = ?auto_614870 ?auto_614878 ) ) ( not ( = ?auto_614871 ?auto_614872 ) ) ( not ( = ?auto_614871 ?auto_614873 ) ) ( not ( = ?auto_614871 ?auto_614874 ) ) ( not ( = ?auto_614871 ?auto_614875 ) ) ( not ( = ?auto_614871 ?auto_614876 ) ) ( not ( = ?auto_614871 ?auto_614877 ) ) ( not ( = ?auto_614871 ?auto_614878 ) ) ( not ( = ?auto_614872 ?auto_614873 ) ) ( not ( = ?auto_614872 ?auto_614874 ) ) ( not ( = ?auto_614872 ?auto_614875 ) ) ( not ( = ?auto_614872 ?auto_614876 ) ) ( not ( = ?auto_614872 ?auto_614877 ) ) ( not ( = ?auto_614872 ?auto_614878 ) ) ( not ( = ?auto_614873 ?auto_614874 ) ) ( not ( = ?auto_614873 ?auto_614875 ) ) ( not ( = ?auto_614873 ?auto_614876 ) ) ( not ( = ?auto_614873 ?auto_614877 ) ) ( not ( = ?auto_614873 ?auto_614878 ) ) ( not ( = ?auto_614874 ?auto_614875 ) ) ( not ( = ?auto_614874 ?auto_614876 ) ) ( not ( = ?auto_614874 ?auto_614877 ) ) ( not ( = ?auto_614874 ?auto_614878 ) ) ( not ( = ?auto_614875 ?auto_614876 ) ) ( not ( = ?auto_614875 ?auto_614877 ) ) ( not ( = ?auto_614875 ?auto_614878 ) ) ( not ( = ?auto_614876 ?auto_614877 ) ) ( not ( = ?auto_614876 ?auto_614878 ) ) ( not ( = ?auto_614877 ?auto_614878 ) ) ( ON ?auto_614876 ?auto_614877 ) ( ON ?auto_614875 ?auto_614876 ) ( ON ?auto_614874 ?auto_614875 ) ( ON ?auto_614873 ?auto_614874 ) ( ON ?auto_614872 ?auto_614873 ) ( ON ?auto_614871 ?auto_614872 ) ( ON ?auto_614870 ?auto_614871 ) ( ON ?auto_614869 ?auto_614870 ) ( CLEAR ?auto_614867 ) ( ON ?auto_614868 ?auto_614869 ) ( CLEAR ?auto_614868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_614867 ?auto_614868 )
      ( MAKE-11PILE ?auto_614867 ?auto_614868 ?auto_614869 ?auto_614870 ?auto_614871 ?auto_614872 ?auto_614873 ?auto_614874 ?auto_614875 ?auto_614876 ?auto_614877 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_614913 - BLOCK
      ?auto_614914 - BLOCK
      ?auto_614915 - BLOCK
      ?auto_614916 - BLOCK
      ?auto_614917 - BLOCK
      ?auto_614918 - BLOCK
      ?auto_614919 - BLOCK
      ?auto_614920 - BLOCK
      ?auto_614921 - BLOCK
      ?auto_614922 - BLOCK
      ?auto_614923 - BLOCK
    )
    :vars
    (
      ?auto_614924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614923 ?auto_614924 ) ( not ( = ?auto_614913 ?auto_614914 ) ) ( not ( = ?auto_614913 ?auto_614915 ) ) ( not ( = ?auto_614913 ?auto_614916 ) ) ( not ( = ?auto_614913 ?auto_614917 ) ) ( not ( = ?auto_614913 ?auto_614918 ) ) ( not ( = ?auto_614913 ?auto_614919 ) ) ( not ( = ?auto_614913 ?auto_614920 ) ) ( not ( = ?auto_614913 ?auto_614921 ) ) ( not ( = ?auto_614913 ?auto_614922 ) ) ( not ( = ?auto_614913 ?auto_614923 ) ) ( not ( = ?auto_614913 ?auto_614924 ) ) ( not ( = ?auto_614914 ?auto_614915 ) ) ( not ( = ?auto_614914 ?auto_614916 ) ) ( not ( = ?auto_614914 ?auto_614917 ) ) ( not ( = ?auto_614914 ?auto_614918 ) ) ( not ( = ?auto_614914 ?auto_614919 ) ) ( not ( = ?auto_614914 ?auto_614920 ) ) ( not ( = ?auto_614914 ?auto_614921 ) ) ( not ( = ?auto_614914 ?auto_614922 ) ) ( not ( = ?auto_614914 ?auto_614923 ) ) ( not ( = ?auto_614914 ?auto_614924 ) ) ( not ( = ?auto_614915 ?auto_614916 ) ) ( not ( = ?auto_614915 ?auto_614917 ) ) ( not ( = ?auto_614915 ?auto_614918 ) ) ( not ( = ?auto_614915 ?auto_614919 ) ) ( not ( = ?auto_614915 ?auto_614920 ) ) ( not ( = ?auto_614915 ?auto_614921 ) ) ( not ( = ?auto_614915 ?auto_614922 ) ) ( not ( = ?auto_614915 ?auto_614923 ) ) ( not ( = ?auto_614915 ?auto_614924 ) ) ( not ( = ?auto_614916 ?auto_614917 ) ) ( not ( = ?auto_614916 ?auto_614918 ) ) ( not ( = ?auto_614916 ?auto_614919 ) ) ( not ( = ?auto_614916 ?auto_614920 ) ) ( not ( = ?auto_614916 ?auto_614921 ) ) ( not ( = ?auto_614916 ?auto_614922 ) ) ( not ( = ?auto_614916 ?auto_614923 ) ) ( not ( = ?auto_614916 ?auto_614924 ) ) ( not ( = ?auto_614917 ?auto_614918 ) ) ( not ( = ?auto_614917 ?auto_614919 ) ) ( not ( = ?auto_614917 ?auto_614920 ) ) ( not ( = ?auto_614917 ?auto_614921 ) ) ( not ( = ?auto_614917 ?auto_614922 ) ) ( not ( = ?auto_614917 ?auto_614923 ) ) ( not ( = ?auto_614917 ?auto_614924 ) ) ( not ( = ?auto_614918 ?auto_614919 ) ) ( not ( = ?auto_614918 ?auto_614920 ) ) ( not ( = ?auto_614918 ?auto_614921 ) ) ( not ( = ?auto_614918 ?auto_614922 ) ) ( not ( = ?auto_614918 ?auto_614923 ) ) ( not ( = ?auto_614918 ?auto_614924 ) ) ( not ( = ?auto_614919 ?auto_614920 ) ) ( not ( = ?auto_614919 ?auto_614921 ) ) ( not ( = ?auto_614919 ?auto_614922 ) ) ( not ( = ?auto_614919 ?auto_614923 ) ) ( not ( = ?auto_614919 ?auto_614924 ) ) ( not ( = ?auto_614920 ?auto_614921 ) ) ( not ( = ?auto_614920 ?auto_614922 ) ) ( not ( = ?auto_614920 ?auto_614923 ) ) ( not ( = ?auto_614920 ?auto_614924 ) ) ( not ( = ?auto_614921 ?auto_614922 ) ) ( not ( = ?auto_614921 ?auto_614923 ) ) ( not ( = ?auto_614921 ?auto_614924 ) ) ( not ( = ?auto_614922 ?auto_614923 ) ) ( not ( = ?auto_614922 ?auto_614924 ) ) ( not ( = ?auto_614923 ?auto_614924 ) ) ( ON ?auto_614922 ?auto_614923 ) ( ON ?auto_614921 ?auto_614922 ) ( ON ?auto_614920 ?auto_614921 ) ( ON ?auto_614919 ?auto_614920 ) ( ON ?auto_614918 ?auto_614919 ) ( ON ?auto_614917 ?auto_614918 ) ( ON ?auto_614916 ?auto_614917 ) ( ON ?auto_614915 ?auto_614916 ) ( ON ?auto_614914 ?auto_614915 ) ( ON ?auto_614913 ?auto_614914 ) ( CLEAR ?auto_614913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_614913 )
      ( MAKE-11PILE ?auto_614913 ?auto_614914 ?auto_614915 ?auto_614916 ?auto_614917 ?auto_614918 ?auto_614919 ?auto_614920 ?auto_614921 ?auto_614922 ?auto_614923 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_614960 - BLOCK
      ?auto_614961 - BLOCK
      ?auto_614962 - BLOCK
      ?auto_614963 - BLOCK
      ?auto_614964 - BLOCK
      ?auto_614965 - BLOCK
      ?auto_614966 - BLOCK
      ?auto_614967 - BLOCK
      ?auto_614968 - BLOCK
      ?auto_614969 - BLOCK
      ?auto_614970 - BLOCK
      ?auto_614971 - BLOCK
    )
    :vars
    (
      ?auto_614972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_614970 ) ( ON ?auto_614971 ?auto_614972 ) ( CLEAR ?auto_614971 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_614960 ) ( ON ?auto_614961 ?auto_614960 ) ( ON ?auto_614962 ?auto_614961 ) ( ON ?auto_614963 ?auto_614962 ) ( ON ?auto_614964 ?auto_614963 ) ( ON ?auto_614965 ?auto_614964 ) ( ON ?auto_614966 ?auto_614965 ) ( ON ?auto_614967 ?auto_614966 ) ( ON ?auto_614968 ?auto_614967 ) ( ON ?auto_614969 ?auto_614968 ) ( ON ?auto_614970 ?auto_614969 ) ( not ( = ?auto_614960 ?auto_614961 ) ) ( not ( = ?auto_614960 ?auto_614962 ) ) ( not ( = ?auto_614960 ?auto_614963 ) ) ( not ( = ?auto_614960 ?auto_614964 ) ) ( not ( = ?auto_614960 ?auto_614965 ) ) ( not ( = ?auto_614960 ?auto_614966 ) ) ( not ( = ?auto_614960 ?auto_614967 ) ) ( not ( = ?auto_614960 ?auto_614968 ) ) ( not ( = ?auto_614960 ?auto_614969 ) ) ( not ( = ?auto_614960 ?auto_614970 ) ) ( not ( = ?auto_614960 ?auto_614971 ) ) ( not ( = ?auto_614960 ?auto_614972 ) ) ( not ( = ?auto_614961 ?auto_614962 ) ) ( not ( = ?auto_614961 ?auto_614963 ) ) ( not ( = ?auto_614961 ?auto_614964 ) ) ( not ( = ?auto_614961 ?auto_614965 ) ) ( not ( = ?auto_614961 ?auto_614966 ) ) ( not ( = ?auto_614961 ?auto_614967 ) ) ( not ( = ?auto_614961 ?auto_614968 ) ) ( not ( = ?auto_614961 ?auto_614969 ) ) ( not ( = ?auto_614961 ?auto_614970 ) ) ( not ( = ?auto_614961 ?auto_614971 ) ) ( not ( = ?auto_614961 ?auto_614972 ) ) ( not ( = ?auto_614962 ?auto_614963 ) ) ( not ( = ?auto_614962 ?auto_614964 ) ) ( not ( = ?auto_614962 ?auto_614965 ) ) ( not ( = ?auto_614962 ?auto_614966 ) ) ( not ( = ?auto_614962 ?auto_614967 ) ) ( not ( = ?auto_614962 ?auto_614968 ) ) ( not ( = ?auto_614962 ?auto_614969 ) ) ( not ( = ?auto_614962 ?auto_614970 ) ) ( not ( = ?auto_614962 ?auto_614971 ) ) ( not ( = ?auto_614962 ?auto_614972 ) ) ( not ( = ?auto_614963 ?auto_614964 ) ) ( not ( = ?auto_614963 ?auto_614965 ) ) ( not ( = ?auto_614963 ?auto_614966 ) ) ( not ( = ?auto_614963 ?auto_614967 ) ) ( not ( = ?auto_614963 ?auto_614968 ) ) ( not ( = ?auto_614963 ?auto_614969 ) ) ( not ( = ?auto_614963 ?auto_614970 ) ) ( not ( = ?auto_614963 ?auto_614971 ) ) ( not ( = ?auto_614963 ?auto_614972 ) ) ( not ( = ?auto_614964 ?auto_614965 ) ) ( not ( = ?auto_614964 ?auto_614966 ) ) ( not ( = ?auto_614964 ?auto_614967 ) ) ( not ( = ?auto_614964 ?auto_614968 ) ) ( not ( = ?auto_614964 ?auto_614969 ) ) ( not ( = ?auto_614964 ?auto_614970 ) ) ( not ( = ?auto_614964 ?auto_614971 ) ) ( not ( = ?auto_614964 ?auto_614972 ) ) ( not ( = ?auto_614965 ?auto_614966 ) ) ( not ( = ?auto_614965 ?auto_614967 ) ) ( not ( = ?auto_614965 ?auto_614968 ) ) ( not ( = ?auto_614965 ?auto_614969 ) ) ( not ( = ?auto_614965 ?auto_614970 ) ) ( not ( = ?auto_614965 ?auto_614971 ) ) ( not ( = ?auto_614965 ?auto_614972 ) ) ( not ( = ?auto_614966 ?auto_614967 ) ) ( not ( = ?auto_614966 ?auto_614968 ) ) ( not ( = ?auto_614966 ?auto_614969 ) ) ( not ( = ?auto_614966 ?auto_614970 ) ) ( not ( = ?auto_614966 ?auto_614971 ) ) ( not ( = ?auto_614966 ?auto_614972 ) ) ( not ( = ?auto_614967 ?auto_614968 ) ) ( not ( = ?auto_614967 ?auto_614969 ) ) ( not ( = ?auto_614967 ?auto_614970 ) ) ( not ( = ?auto_614967 ?auto_614971 ) ) ( not ( = ?auto_614967 ?auto_614972 ) ) ( not ( = ?auto_614968 ?auto_614969 ) ) ( not ( = ?auto_614968 ?auto_614970 ) ) ( not ( = ?auto_614968 ?auto_614971 ) ) ( not ( = ?auto_614968 ?auto_614972 ) ) ( not ( = ?auto_614969 ?auto_614970 ) ) ( not ( = ?auto_614969 ?auto_614971 ) ) ( not ( = ?auto_614969 ?auto_614972 ) ) ( not ( = ?auto_614970 ?auto_614971 ) ) ( not ( = ?auto_614970 ?auto_614972 ) ) ( not ( = ?auto_614971 ?auto_614972 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_614971 ?auto_614972 )
      ( !STACK ?auto_614971 ?auto_614970 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_615010 - BLOCK
      ?auto_615011 - BLOCK
      ?auto_615012 - BLOCK
      ?auto_615013 - BLOCK
      ?auto_615014 - BLOCK
      ?auto_615015 - BLOCK
      ?auto_615016 - BLOCK
      ?auto_615017 - BLOCK
      ?auto_615018 - BLOCK
      ?auto_615019 - BLOCK
      ?auto_615020 - BLOCK
      ?auto_615021 - BLOCK
    )
    :vars
    (
      ?auto_615022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615021 ?auto_615022 ) ( ON-TABLE ?auto_615010 ) ( ON ?auto_615011 ?auto_615010 ) ( ON ?auto_615012 ?auto_615011 ) ( ON ?auto_615013 ?auto_615012 ) ( ON ?auto_615014 ?auto_615013 ) ( ON ?auto_615015 ?auto_615014 ) ( ON ?auto_615016 ?auto_615015 ) ( ON ?auto_615017 ?auto_615016 ) ( ON ?auto_615018 ?auto_615017 ) ( ON ?auto_615019 ?auto_615018 ) ( not ( = ?auto_615010 ?auto_615011 ) ) ( not ( = ?auto_615010 ?auto_615012 ) ) ( not ( = ?auto_615010 ?auto_615013 ) ) ( not ( = ?auto_615010 ?auto_615014 ) ) ( not ( = ?auto_615010 ?auto_615015 ) ) ( not ( = ?auto_615010 ?auto_615016 ) ) ( not ( = ?auto_615010 ?auto_615017 ) ) ( not ( = ?auto_615010 ?auto_615018 ) ) ( not ( = ?auto_615010 ?auto_615019 ) ) ( not ( = ?auto_615010 ?auto_615020 ) ) ( not ( = ?auto_615010 ?auto_615021 ) ) ( not ( = ?auto_615010 ?auto_615022 ) ) ( not ( = ?auto_615011 ?auto_615012 ) ) ( not ( = ?auto_615011 ?auto_615013 ) ) ( not ( = ?auto_615011 ?auto_615014 ) ) ( not ( = ?auto_615011 ?auto_615015 ) ) ( not ( = ?auto_615011 ?auto_615016 ) ) ( not ( = ?auto_615011 ?auto_615017 ) ) ( not ( = ?auto_615011 ?auto_615018 ) ) ( not ( = ?auto_615011 ?auto_615019 ) ) ( not ( = ?auto_615011 ?auto_615020 ) ) ( not ( = ?auto_615011 ?auto_615021 ) ) ( not ( = ?auto_615011 ?auto_615022 ) ) ( not ( = ?auto_615012 ?auto_615013 ) ) ( not ( = ?auto_615012 ?auto_615014 ) ) ( not ( = ?auto_615012 ?auto_615015 ) ) ( not ( = ?auto_615012 ?auto_615016 ) ) ( not ( = ?auto_615012 ?auto_615017 ) ) ( not ( = ?auto_615012 ?auto_615018 ) ) ( not ( = ?auto_615012 ?auto_615019 ) ) ( not ( = ?auto_615012 ?auto_615020 ) ) ( not ( = ?auto_615012 ?auto_615021 ) ) ( not ( = ?auto_615012 ?auto_615022 ) ) ( not ( = ?auto_615013 ?auto_615014 ) ) ( not ( = ?auto_615013 ?auto_615015 ) ) ( not ( = ?auto_615013 ?auto_615016 ) ) ( not ( = ?auto_615013 ?auto_615017 ) ) ( not ( = ?auto_615013 ?auto_615018 ) ) ( not ( = ?auto_615013 ?auto_615019 ) ) ( not ( = ?auto_615013 ?auto_615020 ) ) ( not ( = ?auto_615013 ?auto_615021 ) ) ( not ( = ?auto_615013 ?auto_615022 ) ) ( not ( = ?auto_615014 ?auto_615015 ) ) ( not ( = ?auto_615014 ?auto_615016 ) ) ( not ( = ?auto_615014 ?auto_615017 ) ) ( not ( = ?auto_615014 ?auto_615018 ) ) ( not ( = ?auto_615014 ?auto_615019 ) ) ( not ( = ?auto_615014 ?auto_615020 ) ) ( not ( = ?auto_615014 ?auto_615021 ) ) ( not ( = ?auto_615014 ?auto_615022 ) ) ( not ( = ?auto_615015 ?auto_615016 ) ) ( not ( = ?auto_615015 ?auto_615017 ) ) ( not ( = ?auto_615015 ?auto_615018 ) ) ( not ( = ?auto_615015 ?auto_615019 ) ) ( not ( = ?auto_615015 ?auto_615020 ) ) ( not ( = ?auto_615015 ?auto_615021 ) ) ( not ( = ?auto_615015 ?auto_615022 ) ) ( not ( = ?auto_615016 ?auto_615017 ) ) ( not ( = ?auto_615016 ?auto_615018 ) ) ( not ( = ?auto_615016 ?auto_615019 ) ) ( not ( = ?auto_615016 ?auto_615020 ) ) ( not ( = ?auto_615016 ?auto_615021 ) ) ( not ( = ?auto_615016 ?auto_615022 ) ) ( not ( = ?auto_615017 ?auto_615018 ) ) ( not ( = ?auto_615017 ?auto_615019 ) ) ( not ( = ?auto_615017 ?auto_615020 ) ) ( not ( = ?auto_615017 ?auto_615021 ) ) ( not ( = ?auto_615017 ?auto_615022 ) ) ( not ( = ?auto_615018 ?auto_615019 ) ) ( not ( = ?auto_615018 ?auto_615020 ) ) ( not ( = ?auto_615018 ?auto_615021 ) ) ( not ( = ?auto_615018 ?auto_615022 ) ) ( not ( = ?auto_615019 ?auto_615020 ) ) ( not ( = ?auto_615019 ?auto_615021 ) ) ( not ( = ?auto_615019 ?auto_615022 ) ) ( not ( = ?auto_615020 ?auto_615021 ) ) ( not ( = ?auto_615020 ?auto_615022 ) ) ( not ( = ?auto_615021 ?auto_615022 ) ) ( CLEAR ?auto_615019 ) ( ON ?auto_615020 ?auto_615021 ) ( CLEAR ?auto_615020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_615010 ?auto_615011 ?auto_615012 ?auto_615013 ?auto_615014 ?auto_615015 ?auto_615016 ?auto_615017 ?auto_615018 ?auto_615019 ?auto_615020 )
      ( MAKE-12PILE ?auto_615010 ?auto_615011 ?auto_615012 ?auto_615013 ?auto_615014 ?auto_615015 ?auto_615016 ?auto_615017 ?auto_615018 ?auto_615019 ?auto_615020 ?auto_615021 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_615060 - BLOCK
      ?auto_615061 - BLOCK
      ?auto_615062 - BLOCK
      ?auto_615063 - BLOCK
      ?auto_615064 - BLOCK
      ?auto_615065 - BLOCK
      ?auto_615066 - BLOCK
      ?auto_615067 - BLOCK
      ?auto_615068 - BLOCK
      ?auto_615069 - BLOCK
      ?auto_615070 - BLOCK
      ?auto_615071 - BLOCK
    )
    :vars
    (
      ?auto_615072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615071 ?auto_615072 ) ( ON-TABLE ?auto_615060 ) ( ON ?auto_615061 ?auto_615060 ) ( ON ?auto_615062 ?auto_615061 ) ( ON ?auto_615063 ?auto_615062 ) ( ON ?auto_615064 ?auto_615063 ) ( ON ?auto_615065 ?auto_615064 ) ( ON ?auto_615066 ?auto_615065 ) ( ON ?auto_615067 ?auto_615066 ) ( ON ?auto_615068 ?auto_615067 ) ( not ( = ?auto_615060 ?auto_615061 ) ) ( not ( = ?auto_615060 ?auto_615062 ) ) ( not ( = ?auto_615060 ?auto_615063 ) ) ( not ( = ?auto_615060 ?auto_615064 ) ) ( not ( = ?auto_615060 ?auto_615065 ) ) ( not ( = ?auto_615060 ?auto_615066 ) ) ( not ( = ?auto_615060 ?auto_615067 ) ) ( not ( = ?auto_615060 ?auto_615068 ) ) ( not ( = ?auto_615060 ?auto_615069 ) ) ( not ( = ?auto_615060 ?auto_615070 ) ) ( not ( = ?auto_615060 ?auto_615071 ) ) ( not ( = ?auto_615060 ?auto_615072 ) ) ( not ( = ?auto_615061 ?auto_615062 ) ) ( not ( = ?auto_615061 ?auto_615063 ) ) ( not ( = ?auto_615061 ?auto_615064 ) ) ( not ( = ?auto_615061 ?auto_615065 ) ) ( not ( = ?auto_615061 ?auto_615066 ) ) ( not ( = ?auto_615061 ?auto_615067 ) ) ( not ( = ?auto_615061 ?auto_615068 ) ) ( not ( = ?auto_615061 ?auto_615069 ) ) ( not ( = ?auto_615061 ?auto_615070 ) ) ( not ( = ?auto_615061 ?auto_615071 ) ) ( not ( = ?auto_615061 ?auto_615072 ) ) ( not ( = ?auto_615062 ?auto_615063 ) ) ( not ( = ?auto_615062 ?auto_615064 ) ) ( not ( = ?auto_615062 ?auto_615065 ) ) ( not ( = ?auto_615062 ?auto_615066 ) ) ( not ( = ?auto_615062 ?auto_615067 ) ) ( not ( = ?auto_615062 ?auto_615068 ) ) ( not ( = ?auto_615062 ?auto_615069 ) ) ( not ( = ?auto_615062 ?auto_615070 ) ) ( not ( = ?auto_615062 ?auto_615071 ) ) ( not ( = ?auto_615062 ?auto_615072 ) ) ( not ( = ?auto_615063 ?auto_615064 ) ) ( not ( = ?auto_615063 ?auto_615065 ) ) ( not ( = ?auto_615063 ?auto_615066 ) ) ( not ( = ?auto_615063 ?auto_615067 ) ) ( not ( = ?auto_615063 ?auto_615068 ) ) ( not ( = ?auto_615063 ?auto_615069 ) ) ( not ( = ?auto_615063 ?auto_615070 ) ) ( not ( = ?auto_615063 ?auto_615071 ) ) ( not ( = ?auto_615063 ?auto_615072 ) ) ( not ( = ?auto_615064 ?auto_615065 ) ) ( not ( = ?auto_615064 ?auto_615066 ) ) ( not ( = ?auto_615064 ?auto_615067 ) ) ( not ( = ?auto_615064 ?auto_615068 ) ) ( not ( = ?auto_615064 ?auto_615069 ) ) ( not ( = ?auto_615064 ?auto_615070 ) ) ( not ( = ?auto_615064 ?auto_615071 ) ) ( not ( = ?auto_615064 ?auto_615072 ) ) ( not ( = ?auto_615065 ?auto_615066 ) ) ( not ( = ?auto_615065 ?auto_615067 ) ) ( not ( = ?auto_615065 ?auto_615068 ) ) ( not ( = ?auto_615065 ?auto_615069 ) ) ( not ( = ?auto_615065 ?auto_615070 ) ) ( not ( = ?auto_615065 ?auto_615071 ) ) ( not ( = ?auto_615065 ?auto_615072 ) ) ( not ( = ?auto_615066 ?auto_615067 ) ) ( not ( = ?auto_615066 ?auto_615068 ) ) ( not ( = ?auto_615066 ?auto_615069 ) ) ( not ( = ?auto_615066 ?auto_615070 ) ) ( not ( = ?auto_615066 ?auto_615071 ) ) ( not ( = ?auto_615066 ?auto_615072 ) ) ( not ( = ?auto_615067 ?auto_615068 ) ) ( not ( = ?auto_615067 ?auto_615069 ) ) ( not ( = ?auto_615067 ?auto_615070 ) ) ( not ( = ?auto_615067 ?auto_615071 ) ) ( not ( = ?auto_615067 ?auto_615072 ) ) ( not ( = ?auto_615068 ?auto_615069 ) ) ( not ( = ?auto_615068 ?auto_615070 ) ) ( not ( = ?auto_615068 ?auto_615071 ) ) ( not ( = ?auto_615068 ?auto_615072 ) ) ( not ( = ?auto_615069 ?auto_615070 ) ) ( not ( = ?auto_615069 ?auto_615071 ) ) ( not ( = ?auto_615069 ?auto_615072 ) ) ( not ( = ?auto_615070 ?auto_615071 ) ) ( not ( = ?auto_615070 ?auto_615072 ) ) ( not ( = ?auto_615071 ?auto_615072 ) ) ( ON ?auto_615070 ?auto_615071 ) ( CLEAR ?auto_615068 ) ( ON ?auto_615069 ?auto_615070 ) ( CLEAR ?auto_615069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_615060 ?auto_615061 ?auto_615062 ?auto_615063 ?auto_615064 ?auto_615065 ?auto_615066 ?auto_615067 ?auto_615068 ?auto_615069 )
      ( MAKE-12PILE ?auto_615060 ?auto_615061 ?auto_615062 ?auto_615063 ?auto_615064 ?auto_615065 ?auto_615066 ?auto_615067 ?auto_615068 ?auto_615069 ?auto_615070 ?auto_615071 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_615110 - BLOCK
      ?auto_615111 - BLOCK
      ?auto_615112 - BLOCK
      ?auto_615113 - BLOCK
      ?auto_615114 - BLOCK
      ?auto_615115 - BLOCK
      ?auto_615116 - BLOCK
      ?auto_615117 - BLOCK
      ?auto_615118 - BLOCK
      ?auto_615119 - BLOCK
      ?auto_615120 - BLOCK
      ?auto_615121 - BLOCK
    )
    :vars
    (
      ?auto_615122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615121 ?auto_615122 ) ( ON-TABLE ?auto_615110 ) ( ON ?auto_615111 ?auto_615110 ) ( ON ?auto_615112 ?auto_615111 ) ( ON ?auto_615113 ?auto_615112 ) ( ON ?auto_615114 ?auto_615113 ) ( ON ?auto_615115 ?auto_615114 ) ( ON ?auto_615116 ?auto_615115 ) ( ON ?auto_615117 ?auto_615116 ) ( not ( = ?auto_615110 ?auto_615111 ) ) ( not ( = ?auto_615110 ?auto_615112 ) ) ( not ( = ?auto_615110 ?auto_615113 ) ) ( not ( = ?auto_615110 ?auto_615114 ) ) ( not ( = ?auto_615110 ?auto_615115 ) ) ( not ( = ?auto_615110 ?auto_615116 ) ) ( not ( = ?auto_615110 ?auto_615117 ) ) ( not ( = ?auto_615110 ?auto_615118 ) ) ( not ( = ?auto_615110 ?auto_615119 ) ) ( not ( = ?auto_615110 ?auto_615120 ) ) ( not ( = ?auto_615110 ?auto_615121 ) ) ( not ( = ?auto_615110 ?auto_615122 ) ) ( not ( = ?auto_615111 ?auto_615112 ) ) ( not ( = ?auto_615111 ?auto_615113 ) ) ( not ( = ?auto_615111 ?auto_615114 ) ) ( not ( = ?auto_615111 ?auto_615115 ) ) ( not ( = ?auto_615111 ?auto_615116 ) ) ( not ( = ?auto_615111 ?auto_615117 ) ) ( not ( = ?auto_615111 ?auto_615118 ) ) ( not ( = ?auto_615111 ?auto_615119 ) ) ( not ( = ?auto_615111 ?auto_615120 ) ) ( not ( = ?auto_615111 ?auto_615121 ) ) ( not ( = ?auto_615111 ?auto_615122 ) ) ( not ( = ?auto_615112 ?auto_615113 ) ) ( not ( = ?auto_615112 ?auto_615114 ) ) ( not ( = ?auto_615112 ?auto_615115 ) ) ( not ( = ?auto_615112 ?auto_615116 ) ) ( not ( = ?auto_615112 ?auto_615117 ) ) ( not ( = ?auto_615112 ?auto_615118 ) ) ( not ( = ?auto_615112 ?auto_615119 ) ) ( not ( = ?auto_615112 ?auto_615120 ) ) ( not ( = ?auto_615112 ?auto_615121 ) ) ( not ( = ?auto_615112 ?auto_615122 ) ) ( not ( = ?auto_615113 ?auto_615114 ) ) ( not ( = ?auto_615113 ?auto_615115 ) ) ( not ( = ?auto_615113 ?auto_615116 ) ) ( not ( = ?auto_615113 ?auto_615117 ) ) ( not ( = ?auto_615113 ?auto_615118 ) ) ( not ( = ?auto_615113 ?auto_615119 ) ) ( not ( = ?auto_615113 ?auto_615120 ) ) ( not ( = ?auto_615113 ?auto_615121 ) ) ( not ( = ?auto_615113 ?auto_615122 ) ) ( not ( = ?auto_615114 ?auto_615115 ) ) ( not ( = ?auto_615114 ?auto_615116 ) ) ( not ( = ?auto_615114 ?auto_615117 ) ) ( not ( = ?auto_615114 ?auto_615118 ) ) ( not ( = ?auto_615114 ?auto_615119 ) ) ( not ( = ?auto_615114 ?auto_615120 ) ) ( not ( = ?auto_615114 ?auto_615121 ) ) ( not ( = ?auto_615114 ?auto_615122 ) ) ( not ( = ?auto_615115 ?auto_615116 ) ) ( not ( = ?auto_615115 ?auto_615117 ) ) ( not ( = ?auto_615115 ?auto_615118 ) ) ( not ( = ?auto_615115 ?auto_615119 ) ) ( not ( = ?auto_615115 ?auto_615120 ) ) ( not ( = ?auto_615115 ?auto_615121 ) ) ( not ( = ?auto_615115 ?auto_615122 ) ) ( not ( = ?auto_615116 ?auto_615117 ) ) ( not ( = ?auto_615116 ?auto_615118 ) ) ( not ( = ?auto_615116 ?auto_615119 ) ) ( not ( = ?auto_615116 ?auto_615120 ) ) ( not ( = ?auto_615116 ?auto_615121 ) ) ( not ( = ?auto_615116 ?auto_615122 ) ) ( not ( = ?auto_615117 ?auto_615118 ) ) ( not ( = ?auto_615117 ?auto_615119 ) ) ( not ( = ?auto_615117 ?auto_615120 ) ) ( not ( = ?auto_615117 ?auto_615121 ) ) ( not ( = ?auto_615117 ?auto_615122 ) ) ( not ( = ?auto_615118 ?auto_615119 ) ) ( not ( = ?auto_615118 ?auto_615120 ) ) ( not ( = ?auto_615118 ?auto_615121 ) ) ( not ( = ?auto_615118 ?auto_615122 ) ) ( not ( = ?auto_615119 ?auto_615120 ) ) ( not ( = ?auto_615119 ?auto_615121 ) ) ( not ( = ?auto_615119 ?auto_615122 ) ) ( not ( = ?auto_615120 ?auto_615121 ) ) ( not ( = ?auto_615120 ?auto_615122 ) ) ( not ( = ?auto_615121 ?auto_615122 ) ) ( ON ?auto_615120 ?auto_615121 ) ( ON ?auto_615119 ?auto_615120 ) ( CLEAR ?auto_615117 ) ( ON ?auto_615118 ?auto_615119 ) ( CLEAR ?auto_615118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_615110 ?auto_615111 ?auto_615112 ?auto_615113 ?auto_615114 ?auto_615115 ?auto_615116 ?auto_615117 ?auto_615118 )
      ( MAKE-12PILE ?auto_615110 ?auto_615111 ?auto_615112 ?auto_615113 ?auto_615114 ?auto_615115 ?auto_615116 ?auto_615117 ?auto_615118 ?auto_615119 ?auto_615120 ?auto_615121 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_615160 - BLOCK
      ?auto_615161 - BLOCK
      ?auto_615162 - BLOCK
      ?auto_615163 - BLOCK
      ?auto_615164 - BLOCK
      ?auto_615165 - BLOCK
      ?auto_615166 - BLOCK
      ?auto_615167 - BLOCK
      ?auto_615168 - BLOCK
      ?auto_615169 - BLOCK
      ?auto_615170 - BLOCK
      ?auto_615171 - BLOCK
    )
    :vars
    (
      ?auto_615172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615171 ?auto_615172 ) ( ON-TABLE ?auto_615160 ) ( ON ?auto_615161 ?auto_615160 ) ( ON ?auto_615162 ?auto_615161 ) ( ON ?auto_615163 ?auto_615162 ) ( ON ?auto_615164 ?auto_615163 ) ( ON ?auto_615165 ?auto_615164 ) ( ON ?auto_615166 ?auto_615165 ) ( not ( = ?auto_615160 ?auto_615161 ) ) ( not ( = ?auto_615160 ?auto_615162 ) ) ( not ( = ?auto_615160 ?auto_615163 ) ) ( not ( = ?auto_615160 ?auto_615164 ) ) ( not ( = ?auto_615160 ?auto_615165 ) ) ( not ( = ?auto_615160 ?auto_615166 ) ) ( not ( = ?auto_615160 ?auto_615167 ) ) ( not ( = ?auto_615160 ?auto_615168 ) ) ( not ( = ?auto_615160 ?auto_615169 ) ) ( not ( = ?auto_615160 ?auto_615170 ) ) ( not ( = ?auto_615160 ?auto_615171 ) ) ( not ( = ?auto_615160 ?auto_615172 ) ) ( not ( = ?auto_615161 ?auto_615162 ) ) ( not ( = ?auto_615161 ?auto_615163 ) ) ( not ( = ?auto_615161 ?auto_615164 ) ) ( not ( = ?auto_615161 ?auto_615165 ) ) ( not ( = ?auto_615161 ?auto_615166 ) ) ( not ( = ?auto_615161 ?auto_615167 ) ) ( not ( = ?auto_615161 ?auto_615168 ) ) ( not ( = ?auto_615161 ?auto_615169 ) ) ( not ( = ?auto_615161 ?auto_615170 ) ) ( not ( = ?auto_615161 ?auto_615171 ) ) ( not ( = ?auto_615161 ?auto_615172 ) ) ( not ( = ?auto_615162 ?auto_615163 ) ) ( not ( = ?auto_615162 ?auto_615164 ) ) ( not ( = ?auto_615162 ?auto_615165 ) ) ( not ( = ?auto_615162 ?auto_615166 ) ) ( not ( = ?auto_615162 ?auto_615167 ) ) ( not ( = ?auto_615162 ?auto_615168 ) ) ( not ( = ?auto_615162 ?auto_615169 ) ) ( not ( = ?auto_615162 ?auto_615170 ) ) ( not ( = ?auto_615162 ?auto_615171 ) ) ( not ( = ?auto_615162 ?auto_615172 ) ) ( not ( = ?auto_615163 ?auto_615164 ) ) ( not ( = ?auto_615163 ?auto_615165 ) ) ( not ( = ?auto_615163 ?auto_615166 ) ) ( not ( = ?auto_615163 ?auto_615167 ) ) ( not ( = ?auto_615163 ?auto_615168 ) ) ( not ( = ?auto_615163 ?auto_615169 ) ) ( not ( = ?auto_615163 ?auto_615170 ) ) ( not ( = ?auto_615163 ?auto_615171 ) ) ( not ( = ?auto_615163 ?auto_615172 ) ) ( not ( = ?auto_615164 ?auto_615165 ) ) ( not ( = ?auto_615164 ?auto_615166 ) ) ( not ( = ?auto_615164 ?auto_615167 ) ) ( not ( = ?auto_615164 ?auto_615168 ) ) ( not ( = ?auto_615164 ?auto_615169 ) ) ( not ( = ?auto_615164 ?auto_615170 ) ) ( not ( = ?auto_615164 ?auto_615171 ) ) ( not ( = ?auto_615164 ?auto_615172 ) ) ( not ( = ?auto_615165 ?auto_615166 ) ) ( not ( = ?auto_615165 ?auto_615167 ) ) ( not ( = ?auto_615165 ?auto_615168 ) ) ( not ( = ?auto_615165 ?auto_615169 ) ) ( not ( = ?auto_615165 ?auto_615170 ) ) ( not ( = ?auto_615165 ?auto_615171 ) ) ( not ( = ?auto_615165 ?auto_615172 ) ) ( not ( = ?auto_615166 ?auto_615167 ) ) ( not ( = ?auto_615166 ?auto_615168 ) ) ( not ( = ?auto_615166 ?auto_615169 ) ) ( not ( = ?auto_615166 ?auto_615170 ) ) ( not ( = ?auto_615166 ?auto_615171 ) ) ( not ( = ?auto_615166 ?auto_615172 ) ) ( not ( = ?auto_615167 ?auto_615168 ) ) ( not ( = ?auto_615167 ?auto_615169 ) ) ( not ( = ?auto_615167 ?auto_615170 ) ) ( not ( = ?auto_615167 ?auto_615171 ) ) ( not ( = ?auto_615167 ?auto_615172 ) ) ( not ( = ?auto_615168 ?auto_615169 ) ) ( not ( = ?auto_615168 ?auto_615170 ) ) ( not ( = ?auto_615168 ?auto_615171 ) ) ( not ( = ?auto_615168 ?auto_615172 ) ) ( not ( = ?auto_615169 ?auto_615170 ) ) ( not ( = ?auto_615169 ?auto_615171 ) ) ( not ( = ?auto_615169 ?auto_615172 ) ) ( not ( = ?auto_615170 ?auto_615171 ) ) ( not ( = ?auto_615170 ?auto_615172 ) ) ( not ( = ?auto_615171 ?auto_615172 ) ) ( ON ?auto_615170 ?auto_615171 ) ( ON ?auto_615169 ?auto_615170 ) ( ON ?auto_615168 ?auto_615169 ) ( CLEAR ?auto_615166 ) ( ON ?auto_615167 ?auto_615168 ) ( CLEAR ?auto_615167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_615160 ?auto_615161 ?auto_615162 ?auto_615163 ?auto_615164 ?auto_615165 ?auto_615166 ?auto_615167 )
      ( MAKE-12PILE ?auto_615160 ?auto_615161 ?auto_615162 ?auto_615163 ?auto_615164 ?auto_615165 ?auto_615166 ?auto_615167 ?auto_615168 ?auto_615169 ?auto_615170 ?auto_615171 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_615210 - BLOCK
      ?auto_615211 - BLOCK
      ?auto_615212 - BLOCK
      ?auto_615213 - BLOCK
      ?auto_615214 - BLOCK
      ?auto_615215 - BLOCK
      ?auto_615216 - BLOCK
      ?auto_615217 - BLOCK
      ?auto_615218 - BLOCK
      ?auto_615219 - BLOCK
      ?auto_615220 - BLOCK
      ?auto_615221 - BLOCK
    )
    :vars
    (
      ?auto_615222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615221 ?auto_615222 ) ( ON-TABLE ?auto_615210 ) ( ON ?auto_615211 ?auto_615210 ) ( ON ?auto_615212 ?auto_615211 ) ( ON ?auto_615213 ?auto_615212 ) ( ON ?auto_615214 ?auto_615213 ) ( ON ?auto_615215 ?auto_615214 ) ( not ( = ?auto_615210 ?auto_615211 ) ) ( not ( = ?auto_615210 ?auto_615212 ) ) ( not ( = ?auto_615210 ?auto_615213 ) ) ( not ( = ?auto_615210 ?auto_615214 ) ) ( not ( = ?auto_615210 ?auto_615215 ) ) ( not ( = ?auto_615210 ?auto_615216 ) ) ( not ( = ?auto_615210 ?auto_615217 ) ) ( not ( = ?auto_615210 ?auto_615218 ) ) ( not ( = ?auto_615210 ?auto_615219 ) ) ( not ( = ?auto_615210 ?auto_615220 ) ) ( not ( = ?auto_615210 ?auto_615221 ) ) ( not ( = ?auto_615210 ?auto_615222 ) ) ( not ( = ?auto_615211 ?auto_615212 ) ) ( not ( = ?auto_615211 ?auto_615213 ) ) ( not ( = ?auto_615211 ?auto_615214 ) ) ( not ( = ?auto_615211 ?auto_615215 ) ) ( not ( = ?auto_615211 ?auto_615216 ) ) ( not ( = ?auto_615211 ?auto_615217 ) ) ( not ( = ?auto_615211 ?auto_615218 ) ) ( not ( = ?auto_615211 ?auto_615219 ) ) ( not ( = ?auto_615211 ?auto_615220 ) ) ( not ( = ?auto_615211 ?auto_615221 ) ) ( not ( = ?auto_615211 ?auto_615222 ) ) ( not ( = ?auto_615212 ?auto_615213 ) ) ( not ( = ?auto_615212 ?auto_615214 ) ) ( not ( = ?auto_615212 ?auto_615215 ) ) ( not ( = ?auto_615212 ?auto_615216 ) ) ( not ( = ?auto_615212 ?auto_615217 ) ) ( not ( = ?auto_615212 ?auto_615218 ) ) ( not ( = ?auto_615212 ?auto_615219 ) ) ( not ( = ?auto_615212 ?auto_615220 ) ) ( not ( = ?auto_615212 ?auto_615221 ) ) ( not ( = ?auto_615212 ?auto_615222 ) ) ( not ( = ?auto_615213 ?auto_615214 ) ) ( not ( = ?auto_615213 ?auto_615215 ) ) ( not ( = ?auto_615213 ?auto_615216 ) ) ( not ( = ?auto_615213 ?auto_615217 ) ) ( not ( = ?auto_615213 ?auto_615218 ) ) ( not ( = ?auto_615213 ?auto_615219 ) ) ( not ( = ?auto_615213 ?auto_615220 ) ) ( not ( = ?auto_615213 ?auto_615221 ) ) ( not ( = ?auto_615213 ?auto_615222 ) ) ( not ( = ?auto_615214 ?auto_615215 ) ) ( not ( = ?auto_615214 ?auto_615216 ) ) ( not ( = ?auto_615214 ?auto_615217 ) ) ( not ( = ?auto_615214 ?auto_615218 ) ) ( not ( = ?auto_615214 ?auto_615219 ) ) ( not ( = ?auto_615214 ?auto_615220 ) ) ( not ( = ?auto_615214 ?auto_615221 ) ) ( not ( = ?auto_615214 ?auto_615222 ) ) ( not ( = ?auto_615215 ?auto_615216 ) ) ( not ( = ?auto_615215 ?auto_615217 ) ) ( not ( = ?auto_615215 ?auto_615218 ) ) ( not ( = ?auto_615215 ?auto_615219 ) ) ( not ( = ?auto_615215 ?auto_615220 ) ) ( not ( = ?auto_615215 ?auto_615221 ) ) ( not ( = ?auto_615215 ?auto_615222 ) ) ( not ( = ?auto_615216 ?auto_615217 ) ) ( not ( = ?auto_615216 ?auto_615218 ) ) ( not ( = ?auto_615216 ?auto_615219 ) ) ( not ( = ?auto_615216 ?auto_615220 ) ) ( not ( = ?auto_615216 ?auto_615221 ) ) ( not ( = ?auto_615216 ?auto_615222 ) ) ( not ( = ?auto_615217 ?auto_615218 ) ) ( not ( = ?auto_615217 ?auto_615219 ) ) ( not ( = ?auto_615217 ?auto_615220 ) ) ( not ( = ?auto_615217 ?auto_615221 ) ) ( not ( = ?auto_615217 ?auto_615222 ) ) ( not ( = ?auto_615218 ?auto_615219 ) ) ( not ( = ?auto_615218 ?auto_615220 ) ) ( not ( = ?auto_615218 ?auto_615221 ) ) ( not ( = ?auto_615218 ?auto_615222 ) ) ( not ( = ?auto_615219 ?auto_615220 ) ) ( not ( = ?auto_615219 ?auto_615221 ) ) ( not ( = ?auto_615219 ?auto_615222 ) ) ( not ( = ?auto_615220 ?auto_615221 ) ) ( not ( = ?auto_615220 ?auto_615222 ) ) ( not ( = ?auto_615221 ?auto_615222 ) ) ( ON ?auto_615220 ?auto_615221 ) ( ON ?auto_615219 ?auto_615220 ) ( ON ?auto_615218 ?auto_615219 ) ( ON ?auto_615217 ?auto_615218 ) ( CLEAR ?auto_615215 ) ( ON ?auto_615216 ?auto_615217 ) ( CLEAR ?auto_615216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_615210 ?auto_615211 ?auto_615212 ?auto_615213 ?auto_615214 ?auto_615215 ?auto_615216 )
      ( MAKE-12PILE ?auto_615210 ?auto_615211 ?auto_615212 ?auto_615213 ?auto_615214 ?auto_615215 ?auto_615216 ?auto_615217 ?auto_615218 ?auto_615219 ?auto_615220 ?auto_615221 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_615260 - BLOCK
      ?auto_615261 - BLOCK
      ?auto_615262 - BLOCK
      ?auto_615263 - BLOCK
      ?auto_615264 - BLOCK
      ?auto_615265 - BLOCK
      ?auto_615266 - BLOCK
      ?auto_615267 - BLOCK
      ?auto_615268 - BLOCK
      ?auto_615269 - BLOCK
      ?auto_615270 - BLOCK
      ?auto_615271 - BLOCK
    )
    :vars
    (
      ?auto_615272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615271 ?auto_615272 ) ( ON-TABLE ?auto_615260 ) ( ON ?auto_615261 ?auto_615260 ) ( ON ?auto_615262 ?auto_615261 ) ( ON ?auto_615263 ?auto_615262 ) ( ON ?auto_615264 ?auto_615263 ) ( not ( = ?auto_615260 ?auto_615261 ) ) ( not ( = ?auto_615260 ?auto_615262 ) ) ( not ( = ?auto_615260 ?auto_615263 ) ) ( not ( = ?auto_615260 ?auto_615264 ) ) ( not ( = ?auto_615260 ?auto_615265 ) ) ( not ( = ?auto_615260 ?auto_615266 ) ) ( not ( = ?auto_615260 ?auto_615267 ) ) ( not ( = ?auto_615260 ?auto_615268 ) ) ( not ( = ?auto_615260 ?auto_615269 ) ) ( not ( = ?auto_615260 ?auto_615270 ) ) ( not ( = ?auto_615260 ?auto_615271 ) ) ( not ( = ?auto_615260 ?auto_615272 ) ) ( not ( = ?auto_615261 ?auto_615262 ) ) ( not ( = ?auto_615261 ?auto_615263 ) ) ( not ( = ?auto_615261 ?auto_615264 ) ) ( not ( = ?auto_615261 ?auto_615265 ) ) ( not ( = ?auto_615261 ?auto_615266 ) ) ( not ( = ?auto_615261 ?auto_615267 ) ) ( not ( = ?auto_615261 ?auto_615268 ) ) ( not ( = ?auto_615261 ?auto_615269 ) ) ( not ( = ?auto_615261 ?auto_615270 ) ) ( not ( = ?auto_615261 ?auto_615271 ) ) ( not ( = ?auto_615261 ?auto_615272 ) ) ( not ( = ?auto_615262 ?auto_615263 ) ) ( not ( = ?auto_615262 ?auto_615264 ) ) ( not ( = ?auto_615262 ?auto_615265 ) ) ( not ( = ?auto_615262 ?auto_615266 ) ) ( not ( = ?auto_615262 ?auto_615267 ) ) ( not ( = ?auto_615262 ?auto_615268 ) ) ( not ( = ?auto_615262 ?auto_615269 ) ) ( not ( = ?auto_615262 ?auto_615270 ) ) ( not ( = ?auto_615262 ?auto_615271 ) ) ( not ( = ?auto_615262 ?auto_615272 ) ) ( not ( = ?auto_615263 ?auto_615264 ) ) ( not ( = ?auto_615263 ?auto_615265 ) ) ( not ( = ?auto_615263 ?auto_615266 ) ) ( not ( = ?auto_615263 ?auto_615267 ) ) ( not ( = ?auto_615263 ?auto_615268 ) ) ( not ( = ?auto_615263 ?auto_615269 ) ) ( not ( = ?auto_615263 ?auto_615270 ) ) ( not ( = ?auto_615263 ?auto_615271 ) ) ( not ( = ?auto_615263 ?auto_615272 ) ) ( not ( = ?auto_615264 ?auto_615265 ) ) ( not ( = ?auto_615264 ?auto_615266 ) ) ( not ( = ?auto_615264 ?auto_615267 ) ) ( not ( = ?auto_615264 ?auto_615268 ) ) ( not ( = ?auto_615264 ?auto_615269 ) ) ( not ( = ?auto_615264 ?auto_615270 ) ) ( not ( = ?auto_615264 ?auto_615271 ) ) ( not ( = ?auto_615264 ?auto_615272 ) ) ( not ( = ?auto_615265 ?auto_615266 ) ) ( not ( = ?auto_615265 ?auto_615267 ) ) ( not ( = ?auto_615265 ?auto_615268 ) ) ( not ( = ?auto_615265 ?auto_615269 ) ) ( not ( = ?auto_615265 ?auto_615270 ) ) ( not ( = ?auto_615265 ?auto_615271 ) ) ( not ( = ?auto_615265 ?auto_615272 ) ) ( not ( = ?auto_615266 ?auto_615267 ) ) ( not ( = ?auto_615266 ?auto_615268 ) ) ( not ( = ?auto_615266 ?auto_615269 ) ) ( not ( = ?auto_615266 ?auto_615270 ) ) ( not ( = ?auto_615266 ?auto_615271 ) ) ( not ( = ?auto_615266 ?auto_615272 ) ) ( not ( = ?auto_615267 ?auto_615268 ) ) ( not ( = ?auto_615267 ?auto_615269 ) ) ( not ( = ?auto_615267 ?auto_615270 ) ) ( not ( = ?auto_615267 ?auto_615271 ) ) ( not ( = ?auto_615267 ?auto_615272 ) ) ( not ( = ?auto_615268 ?auto_615269 ) ) ( not ( = ?auto_615268 ?auto_615270 ) ) ( not ( = ?auto_615268 ?auto_615271 ) ) ( not ( = ?auto_615268 ?auto_615272 ) ) ( not ( = ?auto_615269 ?auto_615270 ) ) ( not ( = ?auto_615269 ?auto_615271 ) ) ( not ( = ?auto_615269 ?auto_615272 ) ) ( not ( = ?auto_615270 ?auto_615271 ) ) ( not ( = ?auto_615270 ?auto_615272 ) ) ( not ( = ?auto_615271 ?auto_615272 ) ) ( ON ?auto_615270 ?auto_615271 ) ( ON ?auto_615269 ?auto_615270 ) ( ON ?auto_615268 ?auto_615269 ) ( ON ?auto_615267 ?auto_615268 ) ( ON ?auto_615266 ?auto_615267 ) ( CLEAR ?auto_615264 ) ( ON ?auto_615265 ?auto_615266 ) ( CLEAR ?auto_615265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_615260 ?auto_615261 ?auto_615262 ?auto_615263 ?auto_615264 ?auto_615265 )
      ( MAKE-12PILE ?auto_615260 ?auto_615261 ?auto_615262 ?auto_615263 ?auto_615264 ?auto_615265 ?auto_615266 ?auto_615267 ?auto_615268 ?auto_615269 ?auto_615270 ?auto_615271 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_615310 - BLOCK
      ?auto_615311 - BLOCK
      ?auto_615312 - BLOCK
      ?auto_615313 - BLOCK
      ?auto_615314 - BLOCK
      ?auto_615315 - BLOCK
      ?auto_615316 - BLOCK
      ?auto_615317 - BLOCK
      ?auto_615318 - BLOCK
      ?auto_615319 - BLOCK
      ?auto_615320 - BLOCK
      ?auto_615321 - BLOCK
    )
    :vars
    (
      ?auto_615322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615321 ?auto_615322 ) ( ON-TABLE ?auto_615310 ) ( ON ?auto_615311 ?auto_615310 ) ( ON ?auto_615312 ?auto_615311 ) ( ON ?auto_615313 ?auto_615312 ) ( not ( = ?auto_615310 ?auto_615311 ) ) ( not ( = ?auto_615310 ?auto_615312 ) ) ( not ( = ?auto_615310 ?auto_615313 ) ) ( not ( = ?auto_615310 ?auto_615314 ) ) ( not ( = ?auto_615310 ?auto_615315 ) ) ( not ( = ?auto_615310 ?auto_615316 ) ) ( not ( = ?auto_615310 ?auto_615317 ) ) ( not ( = ?auto_615310 ?auto_615318 ) ) ( not ( = ?auto_615310 ?auto_615319 ) ) ( not ( = ?auto_615310 ?auto_615320 ) ) ( not ( = ?auto_615310 ?auto_615321 ) ) ( not ( = ?auto_615310 ?auto_615322 ) ) ( not ( = ?auto_615311 ?auto_615312 ) ) ( not ( = ?auto_615311 ?auto_615313 ) ) ( not ( = ?auto_615311 ?auto_615314 ) ) ( not ( = ?auto_615311 ?auto_615315 ) ) ( not ( = ?auto_615311 ?auto_615316 ) ) ( not ( = ?auto_615311 ?auto_615317 ) ) ( not ( = ?auto_615311 ?auto_615318 ) ) ( not ( = ?auto_615311 ?auto_615319 ) ) ( not ( = ?auto_615311 ?auto_615320 ) ) ( not ( = ?auto_615311 ?auto_615321 ) ) ( not ( = ?auto_615311 ?auto_615322 ) ) ( not ( = ?auto_615312 ?auto_615313 ) ) ( not ( = ?auto_615312 ?auto_615314 ) ) ( not ( = ?auto_615312 ?auto_615315 ) ) ( not ( = ?auto_615312 ?auto_615316 ) ) ( not ( = ?auto_615312 ?auto_615317 ) ) ( not ( = ?auto_615312 ?auto_615318 ) ) ( not ( = ?auto_615312 ?auto_615319 ) ) ( not ( = ?auto_615312 ?auto_615320 ) ) ( not ( = ?auto_615312 ?auto_615321 ) ) ( not ( = ?auto_615312 ?auto_615322 ) ) ( not ( = ?auto_615313 ?auto_615314 ) ) ( not ( = ?auto_615313 ?auto_615315 ) ) ( not ( = ?auto_615313 ?auto_615316 ) ) ( not ( = ?auto_615313 ?auto_615317 ) ) ( not ( = ?auto_615313 ?auto_615318 ) ) ( not ( = ?auto_615313 ?auto_615319 ) ) ( not ( = ?auto_615313 ?auto_615320 ) ) ( not ( = ?auto_615313 ?auto_615321 ) ) ( not ( = ?auto_615313 ?auto_615322 ) ) ( not ( = ?auto_615314 ?auto_615315 ) ) ( not ( = ?auto_615314 ?auto_615316 ) ) ( not ( = ?auto_615314 ?auto_615317 ) ) ( not ( = ?auto_615314 ?auto_615318 ) ) ( not ( = ?auto_615314 ?auto_615319 ) ) ( not ( = ?auto_615314 ?auto_615320 ) ) ( not ( = ?auto_615314 ?auto_615321 ) ) ( not ( = ?auto_615314 ?auto_615322 ) ) ( not ( = ?auto_615315 ?auto_615316 ) ) ( not ( = ?auto_615315 ?auto_615317 ) ) ( not ( = ?auto_615315 ?auto_615318 ) ) ( not ( = ?auto_615315 ?auto_615319 ) ) ( not ( = ?auto_615315 ?auto_615320 ) ) ( not ( = ?auto_615315 ?auto_615321 ) ) ( not ( = ?auto_615315 ?auto_615322 ) ) ( not ( = ?auto_615316 ?auto_615317 ) ) ( not ( = ?auto_615316 ?auto_615318 ) ) ( not ( = ?auto_615316 ?auto_615319 ) ) ( not ( = ?auto_615316 ?auto_615320 ) ) ( not ( = ?auto_615316 ?auto_615321 ) ) ( not ( = ?auto_615316 ?auto_615322 ) ) ( not ( = ?auto_615317 ?auto_615318 ) ) ( not ( = ?auto_615317 ?auto_615319 ) ) ( not ( = ?auto_615317 ?auto_615320 ) ) ( not ( = ?auto_615317 ?auto_615321 ) ) ( not ( = ?auto_615317 ?auto_615322 ) ) ( not ( = ?auto_615318 ?auto_615319 ) ) ( not ( = ?auto_615318 ?auto_615320 ) ) ( not ( = ?auto_615318 ?auto_615321 ) ) ( not ( = ?auto_615318 ?auto_615322 ) ) ( not ( = ?auto_615319 ?auto_615320 ) ) ( not ( = ?auto_615319 ?auto_615321 ) ) ( not ( = ?auto_615319 ?auto_615322 ) ) ( not ( = ?auto_615320 ?auto_615321 ) ) ( not ( = ?auto_615320 ?auto_615322 ) ) ( not ( = ?auto_615321 ?auto_615322 ) ) ( ON ?auto_615320 ?auto_615321 ) ( ON ?auto_615319 ?auto_615320 ) ( ON ?auto_615318 ?auto_615319 ) ( ON ?auto_615317 ?auto_615318 ) ( ON ?auto_615316 ?auto_615317 ) ( ON ?auto_615315 ?auto_615316 ) ( CLEAR ?auto_615313 ) ( ON ?auto_615314 ?auto_615315 ) ( CLEAR ?auto_615314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_615310 ?auto_615311 ?auto_615312 ?auto_615313 ?auto_615314 )
      ( MAKE-12PILE ?auto_615310 ?auto_615311 ?auto_615312 ?auto_615313 ?auto_615314 ?auto_615315 ?auto_615316 ?auto_615317 ?auto_615318 ?auto_615319 ?auto_615320 ?auto_615321 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_615360 - BLOCK
      ?auto_615361 - BLOCK
      ?auto_615362 - BLOCK
      ?auto_615363 - BLOCK
      ?auto_615364 - BLOCK
      ?auto_615365 - BLOCK
      ?auto_615366 - BLOCK
      ?auto_615367 - BLOCK
      ?auto_615368 - BLOCK
      ?auto_615369 - BLOCK
      ?auto_615370 - BLOCK
      ?auto_615371 - BLOCK
    )
    :vars
    (
      ?auto_615372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615371 ?auto_615372 ) ( ON-TABLE ?auto_615360 ) ( ON ?auto_615361 ?auto_615360 ) ( ON ?auto_615362 ?auto_615361 ) ( not ( = ?auto_615360 ?auto_615361 ) ) ( not ( = ?auto_615360 ?auto_615362 ) ) ( not ( = ?auto_615360 ?auto_615363 ) ) ( not ( = ?auto_615360 ?auto_615364 ) ) ( not ( = ?auto_615360 ?auto_615365 ) ) ( not ( = ?auto_615360 ?auto_615366 ) ) ( not ( = ?auto_615360 ?auto_615367 ) ) ( not ( = ?auto_615360 ?auto_615368 ) ) ( not ( = ?auto_615360 ?auto_615369 ) ) ( not ( = ?auto_615360 ?auto_615370 ) ) ( not ( = ?auto_615360 ?auto_615371 ) ) ( not ( = ?auto_615360 ?auto_615372 ) ) ( not ( = ?auto_615361 ?auto_615362 ) ) ( not ( = ?auto_615361 ?auto_615363 ) ) ( not ( = ?auto_615361 ?auto_615364 ) ) ( not ( = ?auto_615361 ?auto_615365 ) ) ( not ( = ?auto_615361 ?auto_615366 ) ) ( not ( = ?auto_615361 ?auto_615367 ) ) ( not ( = ?auto_615361 ?auto_615368 ) ) ( not ( = ?auto_615361 ?auto_615369 ) ) ( not ( = ?auto_615361 ?auto_615370 ) ) ( not ( = ?auto_615361 ?auto_615371 ) ) ( not ( = ?auto_615361 ?auto_615372 ) ) ( not ( = ?auto_615362 ?auto_615363 ) ) ( not ( = ?auto_615362 ?auto_615364 ) ) ( not ( = ?auto_615362 ?auto_615365 ) ) ( not ( = ?auto_615362 ?auto_615366 ) ) ( not ( = ?auto_615362 ?auto_615367 ) ) ( not ( = ?auto_615362 ?auto_615368 ) ) ( not ( = ?auto_615362 ?auto_615369 ) ) ( not ( = ?auto_615362 ?auto_615370 ) ) ( not ( = ?auto_615362 ?auto_615371 ) ) ( not ( = ?auto_615362 ?auto_615372 ) ) ( not ( = ?auto_615363 ?auto_615364 ) ) ( not ( = ?auto_615363 ?auto_615365 ) ) ( not ( = ?auto_615363 ?auto_615366 ) ) ( not ( = ?auto_615363 ?auto_615367 ) ) ( not ( = ?auto_615363 ?auto_615368 ) ) ( not ( = ?auto_615363 ?auto_615369 ) ) ( not ( = ?auto_615363 ?auto_615370 ) ) ( not ( = ?auto_615363 ?auto_615371 ) ) ( not ( = ?auto_615363 ?auto_615372 ) ) ( not ( = ?auto_615364 ?auto_615365 ) ) ( not ( = ?auto_615364 ?auto_615366 ) ) ( not ( = ?auto_615364 ?auto_615367 ) ) ( not ( = ?auto_615364 ?auto_615368 ) ) ( not ( = ?auto_615364 ?auto_615369 ) ) ( not ( = ?auto_615364 ?auto_615370 ) ) ( not ( = ?auto_615364 ?auto_615371 ) ) ( not ( = ?auto_615364 ?auto_615372 ) ) ( not ( = ?auto_615365 ?auto_615366 ) ) ( not ( = ?auto_615365 ?auto_615367 ) ) ( not ( = ?auto_615365 ?auto_615368 ) ) ( not ( = ?auto_615365 ?auto_615369 ) ) ( not ( = ?auto_615365 ?auto_615370 ) ) ( not ( = ?auto_615365 ?auto_615371 ) ) ( not ( = ?auto_615365 ?auto_615372 ) ) ( not ( = ?auto_615366 ?auto_615367 ) ) ( not ( = ?auto_615366 ?auto_615368 ) ) ( not ( = ?auto_615366 ?auto_615369 ) ) ( not ( = ?auto_615366 ?auto_615370 ) ) ( not ( = ?auto_615366 ?auto_615371 ) ) ( not ( = ?auto_615366 ?auto_615372 ) ) ( not ( = ?auto_615367 ?auto_615368 ) ) ( not ( = ?auto_615367 ?auto_615369 ) ) ( not ( = ?auto_615367 ?auto_615370 ) ) ( not ( = ?auto_615367 ?auto_615371 ) ) ( not ( = ?auto_615367 ?auto_615372 ) ) ( not ( = ?auto_615368 ?auto_615369 ) ) ( not ( = ?auto_615368 ?auto_615370 ) ) ( not ( = ?auto_615368 ?auto_615371 ) ) ( not ( = ?auto_615368 ?auto_615372 ) ) ( not ( = ?auto_615369 ?auto_615370 ) ) ( not ( = ?auto_615369 ?auto_615371 ) ) ( not ( = ?auto_615369 ?auto_615372 ) ) ( not ( = ?auto_615370 ?auto_615371 ) ) ( not ( = ?auto_615370 ?auto_615372 ) ) ( not ( = ?auto_615371 ?auto_615372 ) ) ( ON ?auto_615370 ?auto_615371 ) ( ON ?auto_615369 ?auto_615370 ) ( ON ?auto_615368 ?auto_615369 ) ( ON ?auto_615367 ?auto_615368 ) ( ON ?auto_615366 ?auto_615367 ) ( ON ?auto_615365 ?auto_615366 ) ( ON ?auto_615364 ?auto_615365 ) ( CLEAR ?auto_615362 ) ( ON ?auto_615363 ?auto_615364 ) ( CLEAR ?auto_615363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_615360 ?auto_615361 ?auto_615362 ?auto_615363 )
      ( MAKE-12PILE ?auto_615360 ?auto_615361 ?auto_615362 ?auto_615363 ?auto_615364 ?auto_615365 ?auto_615366 ?auto_615367 ?auto_615368 ?auto_615369 ?auto_615370 ?auto_615371 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_615410 - BLOCK
      ?auto_615411 - BLOCK
      ?auto_615412 - BLOCK
      ?auto_615413 - BLOCK
      ?auto_615414 - BLOCK
      ?auto_615415 - BLOCK
      ?auto_615416 - BLOCK
      ?auto_615417 - BLOCK
      ?auto_615418 - BLOCK
      ?auto_615419 - BLOCK
      ?auto_615420 - BLOCK
      ?auto_615421 - BLOCK
    )
    :vars
    (
      ?auto_615422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615421 ?auto_615422 ) ( ON-TABLE ?auto_615410 ) ( ON ?auto_615411 ?auto_615410 ) ( not ( = ?auto_615410 ?auto_615411 ) ) ( not ( = ?auto_615410 ?auto_615412 ) ) ( not ( = ?auto_615410 ?auto_615413 ) ) ( not ( = ?auto_615410 ?auto_615414 ) ) ( not ( = ?auto_615410 ?auto_615415 ) ) ( not ( = ?auto_615410 ?auto_615416 ) ) ( not ( = ?auto_615410 ?auto_615417 ) ) ( not ( = ?auto_615410 ?auto_615418 ) ) ( not ( = ?auto_615410 ?auto_615419 ) ) ( not ( = ?auto_615410 ?auto_615420 ) ) ( not ( = ?auto_615410 ?auto_615421 ) ) ( not ( = ?auto_615410 ?auto_615422 ) ) ( not ( = ?auto_615411 ?auto_615412 ) ) ( not ( = ?auto_615411 ?auto_615413 ) ) ( not ( = ?auto_615411 ?auto_615414 ) ) ( not ( = ?auto_615411 ?auto_615415 ) ) ( not ( = ?auto_615411 ?auto_615416 ) ) ( not ( = ?auto_615411 ?auto_615417 ) ) ( not ( = ?auto_615411 ?auto_615418 ) ) ( not ( = ?auto_615411 ?auto_615419 ) ) ( not ( = ?auto_615411 ?auto_615420 ) ) ( not ( = ?auto_615411 ?auto_615421 ) ) ( not ( = ?auto_615411 ?auto_615422 ) ) ( not ( = ?auto_615412 ?auto_615413 ) ) ( not ( = ?auto_615412 ?auto_615414 ) ) ( not ( = ?auto_615412 ?auto_615415 ) ) ( not ( = ?auto_615412 ?auto_615416 ) ) ( not ( = ?auto_615412 ?auto_615417 ) ) ( not ( = ?auto_615412 ?auto_615418 ) ) ( not ( = ?auto_615412 ?auto_615419 ) ) ( not ( = ?auto_615412 ?auto_615420 ) ) ( not ( = ?auto_615412 ?auto_615421 ) ) ( not ( = ?auto_615412 ?auto_615422 ) ) ( not ( = ?auto_615413 ?auto_615414 ) ) ( not ( = ?auto_615413 ?auto_615415 ) ) ( not ( = ?auto_615413 ?auto_615416 ) ) ( not ( = ?auto_615413 ?auto_615417 ) ) ( not ( = ?auto_615413 ?auto_615418 ) ) ( not ( = ?auto_615413 ?auto_615419 ) ) ( not ( = ?auto_615413 ?auto_615420 ) ) ( not ( = ?auto_615413 ?auto_615421 ) ) ( not ( = ?auto_615413 ?auto_615422 ) ) ( not ( = ?auto_615414 ?auto_615415 ) ) ( not ( = ?auto_615414 ?auto_615416 ) ) ( not ( = ?auto_615414 ?auto_615417 ) ) ( not ( = ?auto_615414 ?auto_615418 ) ) ( not ( = ?auto_615414 ?auto_615419 ) ) ( not ( = ?auto_615414 ?auto_615420 ) ) ( not ( = ?auto_615414 ?auto_615421 ) ) ( not ( = ?auto_615414 ?auto_615422 ) ) ( not ( = ?auto_615415 ?auto_615416 ) ) ( not ( = ?auto_615415 ?auto_615417 ) ) ( not ( = ?auto_615415 ?auto_615418 ) ) ( not ( = ?auto_615415 ?auto_615419 ) ) ( not ( = ?auto_615415 ?auto_615420 ) ) ( not ( = ?auto_615415 ?auto_615421 ) ) ( not ( = ?auto_615415 ?auto_615422 ) ) ( not ( = ?auto_615416 ?auto_615417 ) ) ( not ( = ?auto_615416 ?auto_615418 ) ) ( not ( = ?auto_615416 ?auto_615419 ) ) ( not ( = ?auto_615416 ?auto_615420 ) ) ( not ( = ?auto_615416 ?auto_615421 ) ) ( not ( = ?auto_615416 ?auto_615422 ) ) ( not ( = ?auto_615417 ?auto_615418 ) ) ( not ( = ?auto_615417 ?auto_615419 ) ) ( not ( = ?auto_615417 ?auto_615420 ) ) ( not ( = ?auto_615417 ?auto_615421 ) ) ( not ( = ?auto_615417 ?auto_615422 ) ) ( not ( = ?auto_615418 ?auto_615419 ) ) ( not ( = ?auto_615418 ?auto_615420 ) ) ( not ( = ?auto_615418 ?auto_615421 ) ) ( not ( = ?auto_615418 ?auto_615422 ) ) ( not ( = ?auto_615419 ?auto_615420 ) ) ( not ( = ?auto_615419 ?auto_615421 ) ) ( not ( = ?auto_615419 ?auto_615422 ) ) ( not ( = ?auto_615420 ?auto_615421 ) ) ( not ( = ?auto_615420 ?auto_615422 ) ) ( not ( = ?auto_615421 ?auto_615422 ) ) ( ON ?auto_615420 ?auto_615421 ) ( ON ?auto_615419 ?auto_615420 ) ( ON ?auto_615418 ?auto_615419 ) ( ON ?auto_615417 ?auto_615418 ) ( ON ?auto_615416 ?auto_615417 ) ( ON ?auto_615415 ?auto_615416 ) ( ON ?auto_615414 ?auto_615415 ) ( ON ?auto_615413 ?auto_615414 ) ( CLEAR ?auto_615411 ) ( ON ?auto_615412 ?auto_615413 ) ( CLEAR ?auto_615412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_615410 ?auto_615411 ?auto_615412 )
      ( MAKE-12PILE ?auto_615410 ?auto_615411 ?auto_615412 ?auto_615413 ?auto_615414 ?auto_615415 ?auto_615416 ?auto_615417 ?auto_615418 ?auto_615419 ?auto_615420 ?auto_615421 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_615460 - BLOCK
      ?auto_615461 - BLOCK
      ?auto_615462 - BLOCK
      ?auto_615463 - BLOCK
      ?auto_615464 - BLOCK
      ?auto_615465 - BLOCK
      ?auto_615466 - BLOCK
      ?auto_615467 - BLOCK
      ?auto_615468 - BLOCK
      ?auto_615469 - BLOCK
      ?auto_615470 - BLOCK
      ?auto_615471 - BLOCK
    )
    :vars
    (
      ?auto_615472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615471 ?auto_615472 ) ( ON-TABLE ?auto_615460 ) ( not ( = ?auto_615460 ?auto_615461 ) ) ( not ( = ?auto_615460 ?auto_615462 ) ) ( not ( = ?auto_615460 ?auto_615463 ) ) ( not ( = ?auto_615460 ?auto_615464 ) ) ( not ( = ?auto_615460 ?auto_615465 ) ) ( not ( = ?auto_615460 ?auto_615466 ) ) ( not ( = ?auto_615460 ?auto_615467 ) ) ( not ( = ?auto_615460 ?auto_615468 ) ) ( not ( = ?auto_615460 ?auto_615469 ) ) ( not ( = ?auto_615460 ?auto_615470 ) ) ( not ( = ?auto_615460 ?auto_615471 ) ) ( not ( = ?auto_615460 ?auto_615472 ) ) ( not ( = ?auto_615461 ?auto_615462 ) ) ( not ( = ?auto_615461 ?auto_615463 ) ) ( not ( = ?auto_615461 ?auto_615464 ) ) ( not ( = ?auto_615461 ?auto_615465 ) ) ( not ( = ?auto_615461 ?auto_615466 ) ) ( not ( = ?auto_615461 ?auto_615467 ) ) ( not ( = ?auto_615461 ?auto_615468 ) ) ( not ( = ?auto_615461 ?auto_615469 ) ) ( not ( = ?auto_615461 ?auto_615470 ) ) ( not ( = ?auto_615461 ?auto_615471 ) ) ( not ( = ?auto_615461 ?auto_615472 ) ) ( not ( = ?auto_615462 ?auto_615463 ) ) ( not ( = ?auto_615462 ?auto_615464 ) ) ( not ( = ?auto_615462 ?auto_615465 ) ) ( not ( = ?auto_615462 ?auto_615466 ) ) ( not ( = ?auto_615462 ?auto_615467 ) ) ( not ( = ?auto_615462 ?auto_615468 ) ) ( not ( = ?auto_615462 ?auto_615469 ) ) ( not ( = ?auto_615462 ?auto_615470 ) ) ( not ( = ?auto_615462 ?auto_615471 ) ) ( not ( = ?auto_615462 ?auto_615472 ) ) ( not ( = ?auto_615463 ?auto_615464 ) ) ( not ( = ?auto_615463 ?auto_615465 ) ) ( not ( = ?auto_615463 ?auto_615466 ) ) ( not ( = ?auto_615463 ?auto_615467 ) ) ( not ( = ?auto_615463 ?auto_615468 ) ) ( not ( = ?auto_615463 ?auto_615469 ) ) ( not ( = ?auto_615463 ?auto_615470 ) ) ( not ( = ?auto_615463 ?auto_615471 ) ) ( not ( = ?auto_615463 ?auto_615472 ) ) ( not ( = ?auto_615464 ?auto_615465 ) ) ( not ( = ?auto_615464 ?auto_615466 ) ) ( not ( = ?auto_615464 ?auto_615467 ) ) ( not ( = ?auto_615464 ?auto_615468 ) ) ( not ( = ?auto_615464 ?auto_615469 ) ) ( not ( = ?auto_615464 ?auto_615470 ) ) ( not ( = ?auto_615464 ?auto_615471 ) ) ( not ( = ?auto_615464 ?auto_615472 ) ) ( not ( = ?auto_615465 ?auto_615466 ) ) ( not ( = ?auto_615465 ?auto_615467 ) ) ( not ( = ?auto_615465 ?auto_615468 ) ) ( not ( = ?auto_615465 ?auto_615469 ) ) ( not ( = ?auto_615465 ?auto_615470 ) ) ( not ( = ?auto_615465 ?auto_615471 ) ) ( not ( = ?auto_615465 ?auto_615472 ) ) ( not ( = ?auto_615466 ?auto_615467 ) ) ( not ( = ?auto_615466 ?auto_615468 ) ) ( not ( = ?auto_615466 ?auto_615469 ) ) ( not ( = ?auto_615466 ?auto_615470 ) ) ( not ( = ?auto_615466 ?auto_615471 ) ) ( not ( = ?auto_615466 ?auto_615472 ) ) ( not ( = ?auto_615467 ?auto_615468 ) ) ( not ( = ?auto_615467 ?auto_615469 ) ) ( not ( = ?auto_615467 ?auto_615470 ) ) ( not ( = ?auto_615467 ?auto_615471 ) ) ( not ( = ?auto_615467 ?auto_615472 ) ) ( not ( = ?auto_615468 ?auto_615469 ) ) ( not ( = ?auto_615468 ?auto_615470 ) ) ( not ( = ?auto_615468 ?auto_615471 ) ) ( not ( = ?auto_615468 ?auto_615472 ) ) ( not ( = ?auto_615469 ?auto_615470 ) ) ( not ( = ?auto_615469 ?auto_615471 ) ) ( not ( = ?auto_615469 ?auto_615472 ) ) ( not ( = ?auto_615470 ?auto_615471 ) ) ( not ( = ?auto_615470 ?auto_615472 ) ) ( not ( = ?auto_615471 ?auto_615472 ) ) ( ON ?auto_615470 ?auto_615471 ) ( ON ?auto_615469 ?auto_615470 ) ( ON ?auto_615468 ?auto_615469 ) ( ON ?auto_615467 ?auto_615468 ) ( ON ?auto_615466 ?auto_615467 ) ( ON ?auto_615465 ?auto_615466 ) ( ON ?auto_615464 ?auto_615465 ) ( ON ?auto_615463 ?auto_615464 ) ( ON ?auto_615462 ?auto_615463 ) ( CLEAR ?auto_615460 ) ( ON ?auto_615461 ?auto_615462 ) ( CLEAR ?auto_615461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_615460 ?auto_615461 )
      ( MAKE-12PILE ?auto_615460 ?auto_615461 ?auto_615462 ?auto_615463 ?auto_615464 ?auto_615465 ?auto_615466 ?auto_615467 ?auto_615468 ?auto_615469 ?auto_615470 ?auto_615471 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_615510 - BLOCK
      ?auto_615511 - BLOCK
      ?auto_615512 - BLOCK
      ?auto_615513 - BLOCK
      ?auto_615514 - BLOCK
      ?auto_615515 - BLOCK
      ?auto_615516 - BLOCK
      ?auto_615517 - BLOCK
      ?auto_615518 - BLOCK
      ?auto_615519 - BLOCK
      ?auto_615520 - BLOCK
      ?auto_615521 - BLOCK
    )
    :vars
    (
      ?auto_615522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615521 ?auto_615522 ) ( not ( = ?auto_615510 ?auto_615511 ) ) ( not ( = ?auto_615510 ?auto_615512 ) ) ( not ( = ?auto_615510 ?auto_615513 ) ) ( not ( = ?auto_615510 ?auto_615514 ) ) ( not ( = ?auto_615510 ?auto_615515 ) ) ( not ( = ?auto_615510 ?auto_615516 ) ) ( not ( = ?auto_615510 ?auto_615517 ) ) ( not ( = ?auto_615510 ?auto_615518 ) ) ( not ( = ?auto_615510 ?auto_615519 ) ) ( not ( = ?auto_615510 ?auto_615520 ) ) ( not ( = ?auto_615510 ?auto_615521 ) ) ( not ( = ?auto_615510 ?auto_615522 ) ) ( not ( = ?auto_615511 ?auto_615512 ) ) ( not ( = ?auto_615511 ?auto_615513 ) ) ( not ( = ?auto_615511 ?auto_615514 ) ) ( not ( = ?auto_615511 ?auto_615515 ) ) ( not ( = ?auto_615511 ?auto_615516 ) ) ( not ( = ?auto_615511 ?auto_615517 ) ) ( not ( = ?auto_615511 ?auto_615518 ) ) ( not ( = ?auto_615511 ?auto_615519 ) ) ( not ( = ?auto_615511 ?auto_615520 ) ) ( not ( = ?auto_615511 ?auto_615521 ) ) ( not ( = ?auto_615511 ?auto_615522 ) ) ( not ( = ?auto_615512 ?auto_615513 ) ) ( not ( = ?auto_615512 ?auto_615514 ) ) ( not ( = ?auto_615512 ?auto_615515 ) ) ( not ( = ?auto_615512 ?auto_615516 ) ) ( not ( = ?auto_615512 ?auto_615517 ) ) ( not ( = ?auto_615512 ?auto_615518 ) ) ( not ( = ?auto_615512 ?auto_615519 ) ) ( not ( = ?auto_615512 ?auto_615520 ) ) ( not ( = ?auto_615512 ?auto_615521 ) ) ( not ( = ?auto_615512 ?auto_615522 ) ) ( not ( = ?auto_615513 ?auto_615514 ) ) ( not ( = ?auto_615513 ?auto_615515 ) ) ( not ( = ?auto_615513 ?auto_615516 ) ) ( not ( = ?auto_615513 ?auto_615517 ) ) ( not ( = ?auto_615513 ?auto_615518 ) ) ( not ( = ?auto_615513 ?auto_615519 ) ) ( not ( = ?auto_615513 ?auto_615520 ) ) ( not ( = ?auto_615513 ?auto_615521 ) ) ( not ( = ?auto_615513 ?auto_615522 ) ) ( not ( = ?auto_615514 ?auto_615515 ) ) ( not ( = ?auto_615514 ?auto_615516 ) ) ( not ( = ?auto_615514 ?auto_615517 ) ) ( not ( = ?auto_615514 ?auto_615518 ) ) ( not ( = ?auto_615514 ?auto_615519 ) ) ( not ( = ?auto_615514 ?auto_615520 ) ) ( not ( = ?auto_615514 ?auto_615521 ) ) ( not ( = ?auto_615514 ?auto_615522 ) ) ( not ( = ?auto_615515 ?auto_615516 ) ) ( not ( = ?auto_615515 ?auto_615517 ) ) ( not ( = ?auto_615515 ?auto_615518 ) ) ( not ( = ?auto_615515 ?auto_615519 ) ) ( not ( = ?auto_615515 ?auto_615520 ) ) ( not ( = ?auto_615515 ?auto_615521 ) ) ( not ( = ?auto_615515 ?auto_615522 ) ) ( not ( = ?auto_615516 ?auto_615517 ) ) ( not ( = ?auto_615516 ?auto_615518 ) ) ( not ( = ?auto_615516 ?auto_615519 ) ) ( not ( = ?auto_615516 ?auto_615520 ) ) ( not ( = ?auto_615516 ?auto_615521 ) ) ( not ( = ?auto_615516 ?auto_615522 ) ) ( not ( = ?auto_615517 ?auto_615518 ) ) ( not ( = ?auto_615517 ?auto_615519 ) ) ( not ( = ?auto_615517 ?auto_615520 ) ) ( not ( = ?auto_615517 ?auto_615521 ) ) ( not ( = ?auto_615517 ?auto_615522 ) ) ( not ( = ?auto_615518 ?auto_615519 ) ) ( not ( = ?auto_615518 ?auto_615520 ) ) ( not ( = ?auto_615518 ?auto_615521 ) ) ( not ( = ?auto_615518 ?auto_615522 ) ) ( not ( = ?auto_615519 ?auto_615520 ) ) ( not ( = ?auto_615519 ?auto_615521 ) ) ( not ( = ?auto_615519 ?auto_615522 ) ) ( not ( = ?auto_615520 ?auto_615521 ) ) ( not ( = ?auto_615520 ?auto_615522 ) ) ( not ( = ?auto_615521 ?auto_615522 ) ) ( ON ?auto_615520 ?auto_615521 ) ( ON ?auto_615519 ?auto_615520 ) ( ON ?auto_615518 ?auto_615519 ) ( ON ?auto_615517 ?auto_615518 ) ( ON ?auto_615516 ?auto_615517 ) ( ON ?auto_615515 ?auto_615516 ) ( ON ?auto_615514 ?auto_615515 ) ( ON ?auto_615513 ?auto_615514 ) ( ON ?auto_615512 ?auto_615513 ) ( ON ?auto_615511 ?auto_615512 ) ( ON ?auto_615510 ?auto_615511 ) ( CLEAR ?auto_615510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_615510 )
      ( MAKE-12PILE ?auto_615510 ?auto_615511 ?auto_615512 ?auto_615513 ?auto_615514 ?auto_615515 ?auto_615516 ?auto_615517 ?auto_615518 ?auto_615519 ?auto_615520 ?auto_615521 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_615561 - BLOCK
      ?auto_615562 - BLOCK
      ?auto_615563 - BLOCK
      ?auto_615564 - BLOCK
      ?auto_615565 - BLOCK
      ?auto_615566 - BLOCK
      ?auto_615567 - BLOCK
      ?auto_615568 - BLOCK
      ?auto_615569 - BLOCK
      ?auto_615570 - BLOCK
      ?auto_615571 - BLOCK
      ?auto_615572 - BLOCK
      ?auto_615573 - BLOCK
    )
    :vars
    (
      ?auto_615574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_615572 ) ( ON ?auto_615573 ?auto_615574 ) ( CLEAR ?auto_615573 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_615561 ) ( ON ?auto_615562 ?auto_615561 ) ( ON ?auto_615563 ?auto_615562 ) ( ON ?auto_615564 ?auto_615563 ) ( ON ?auto_615565 ?auto_615564 ) ( ON ?auto_615566 ?auto_615565 ) ( ON ?auto_615567 ?auto_615566 ) ( ON ?auto_615568 ?auto_615567 ) ( ON ?auto_615569 ?auto_615568 ) ( ON ?auto_615570 ?auto_615569 ) ( ON ?auto_615571 ?auto_615570 ) ( ON ?auto_615572 ?auto_615571 ) ( not ( = ?auto_615561 ?auto_615562 ) ) ( not ( = ?auto_615561 ?auto_615563 ) ) ( not ( = ?auto_615561 ?auto_615564 ) ) ( not ( = ?auto_615561 ?auto_615565 ) ) ( not ( = ?auto_615561 ?auto_615566 ) ) ( not ( = ?auto_615561 ?auto_615567 ) ) ( not ( = ?auto_615561 ?auto_615568 ) ) ( not ( = ?auto_615561 ?auto_615569 ) ) ( not ( = ?auto_615561 ?auto_615570 ) ) ( not ( = ?auto_615561 ?auto_615571 ) ) ( not ( = ?auto_615561 ?auto_615572 ) ) ( not ( = ?auto_615561 ?auto_615573 ) ) ( not ( = ?auto_615561 ?auto_615574 ) ) ( not ( = ?auto_615562 ?auto_615563 ) ) ( not ( = ?auto_615562 ?auto_615564 ) ) ( not ( = ?auto_615562 ?auto_615565 ) ) ( not ( = ?auto_615562 ?auto_615566 ) ) ( not ( = ?auto_615562 ?auto_615567 ) ) ( not ( = ?auto_615562 ?auto_615568 ) ) ( not ( = ?auto_615562 ?auto_615569 ) ) ( not ( = ?auto_615562 ?auto_615570 ) ) ( not ( = ?auto_615562 ?auto_615571 ) ) ( not ( = ?auto_615562 ?auto_615572 ) ) ( not ( = ?auto_615562 ?auto_615573 ) ) ( not ( = ?auto_615562 ?auto_615574 ) ) ( not ( = ?auto_615563 ?auto_615564 ) ) ( not ( = ?auto_615563 ?auto_615565 ) ) ( not ( = ?auto_615563 ?auto_615566 ) ) ( not ( = ?auto_615563 ?auto_615567 ) ) ( not ( = ?auto_615563 ?auto_615568 ) ) ( not ( = ?auto_615563 ?auto_615569 ) ) ( not ( = ?auto_615563 ?auto_615570 ) ) ( not ( = ?auto_615563 ?auto_615571 ) ) ( not ( = ?auto_615563 ?auto_615572 ) ) ( not ( = ?auto_615563 ?auto_615573 ) ) ( not ( = ?auto_615563 ?auto_615574 ) ) ( not ( = ?auto_615564 ?auto_615565 ) ) ( not ( = ?auto_615564 ?auto_615566 ) ) ( not ( = ?auto_615564 ?auto_615567 ) ) ( not ( = ?auto_615564 ?auto_615568 ) ) ( not ( = ?auto_615564 ?auto_615569 ) ) ( not ( = ?auto_615564 ?auto_615570 ) ) ( not ( = ?auto_615564 ?auto_615571 ) ) ( not ( = ?auto_615564 ?auto_615572 ) ) ( not ( = ?auto_615564 ?auto_615573 ) ) ( not ( = ?auto_615564 ?auto_615574 ) ) ( not ( = ?auto_615565 ?auto_615566 ) ) ( not ( = ?auto_615565 ?auto_615567 ) ) ( not ( = ?auto_615565 ?auto_615568 ) ) ( not ( = ?auto_615565 ?auto_615569 ) ) ( not ( = ?auto_615565 ?auto_615570 ) ) ( not ( = ?auto_615565 ?auto_615571 ) ) ( not ( = ?auto_615565 ?auto_615572 ) ) ( not ( = ?auto_615565 ?auto_615573 ) ) ( not ( = ?auto_615565 ?auto_615574 ) ) ( not ( = ?auto_615566 ?auto_615567 ) ) ( not ( = ?auto_615566 ?auto_615568 ) ) ( not ( = ?auto_615566 ?auto_615569 ) ) ( not ( = ?auto_615566 ?auto_615570 ) ) ( not ( = ?auto_615566 ?auto_615571 ) ) ( not ( = ?auto_615566 ?auto_615572 ) ) ( not ( = ?auto_615566 ?auto_615573 ) ) ( not ( = ?auto_615566 ?auto_615574 ) ) ( not ( = ?auto_615567 ?auto_615568 ) ) ( not ( = ?auto_615567 ?auto_615569 ) ) ( not ( = ?auto_615567 ?auto_615570 ) ) ( not ( = ?auto_615567 ?auto_615571 ) ) ( not ( = ?auto_615567 ?auto_615572 ) ) ( not ( = ?auto_615567 ?auto_615573 ) ) ( not ( = ?auto_615567 ?auto_615574 ) ) ( not ( = ?auto_615568 ?auto_615569 ) ) ( not ( = ?auto_615568 ?auto_615570 ) ) ( not ( = ?auto_615568 ?auto_615571 ) ) ( not ( = ?auto_615568 ?auto_615572 ) ) ( not ( = ?auto_615568 ?auto_615573 ) ) ( not ( = ?auto_615568 ?auto_615574 ) ) ( not ( = ?auto_615569 ?auto_615570 ) ) ( not ( = ?auto_615569 ?auto_615571 ) ) ( not ( = ?auto_615569 ?auto_615572 ) ) ( not ( = ?auto_615569 ?auto_615573 ) ) ( not ( = ?auto_615569 ?auto_615574 ) ) ( not ( = ?auto_615570 ?auto_615571 ) ) ( not ( = ?auto_615570 ?auto_615572 ) ) ( not ( = ?auto_615570 ?auto_615573 ) ) ( not ( = ?auto_615570 ?auto_615574 ) ) ( not ( = ?auto_615571 ?auto_615572 ) ) ( not ( = ?auto_615571 ?auto_615573 ) ) ( not ( = ?auto_615571 ?auto_615574 ) ) ( not ( = ?auto_615572 ?auto_615573 ) ) ( not ( = ?auto_615572 ?auto_615574 ) ) ( not ( = ?auto_615573 ?auto_615574 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_615573 ?auto_615574 )
      ( !STACK ?auto_615573 ?auto_615572 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_615615 - BLOCK
      ?auto_615616 - BLOCK
      ?auto_615617 - BLOCK
      ?auto_615618 - BLOCK
      ?auto_615619 - BLOCK
      ?auto_615620 - BLOCK
      ?auto_615621 - BLOCK
      ?auto_615622 - BLOCK
      ?auto_615623 - BLOCK
      ?auto_615624 - BLOCK
      ?auto_615625 - BLOCK
      ?auto_615626 - BLOCK
      ?auto_615627 - BLOCK
    )
    :vars
    (
      ?auto_615628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615627 ?auto_615628 ) ( ON-TABLE ?auto_615615 ) ( ON ?auto_615616 ?auto_615615 ) ( ON ?auto_615617 ?auto_615616 ) ( ON ?auto_615618 ?auto_615617 ) ( ON ?auto_615619 ?auto_615618 ) ( ON ?auto_615620 ?auto_615619 ) ( ON ?auto_615621 ?auto_615620 ) ( ON ?auto_615622 ?auto_615621 ) ( ON ?auto_615623 ?auto_615622 ) ( ON ?auto_615624 ?auto_615623 ) ( ON ?auto_615625 ?auto_615624 ) ( not ( = ?auto_615615 ?auto_615616 ) ) ( not ( = ?auto_615615 ?auto_615617 ) ) ( not ( = ?auto_615615 ?auto_615618 ) ) ( not ( = ?auto_615615 ?auto_615619 ) ) ( not ( = ?auto_615615 ?auto_615620 ) ) ( not ( = ?auto_615615 ?auto_615621 ) ) ( not ( = ?auto_615615 ?auto_615622 ) ) ( not ( = ?auto_615615 ?auto_615623 ) ) ( not ( = ?auto_615615 ?auto_615624 ) ) ( not ( = ?auto_615615 ?auto_615625 ) ) ( not ( = ?auto_615615 ?auto_615626 ) ) ( not ( = ?auto_615615 ?auto_615627 ) ) ( not ( = ?auto_615615 ?auto_615628 ) ) ( not ( = ?auto_615616 ?auto_615617 ) ) ( not ( = ?auto_615616 ?auto_615618 ) ) ( not ( = ?auto_615616 ?auto_615619 ) ) ( not ( = ?auto_615616 ?auto_615620 ) ) ( not ( = ?auto_615616 ?auto_615621 ) ) ( not ( = ?auto_615616 ?auto_615622 ) ) ( not ( = ?auto_615616 ?auto_615623 ) ) ( not ( = ?auto_615616 ?auto_615624 ) ) ( not ( = ?auto_615616 ?auto_615625 ) ) ( not ( = ?auto_615616 ?auto_615626 ) ) ( not ( = ?auto_615616 ?auto_615627 ) ) ( not ( = ?auto_615616 ?auto_615628 ) ) ( not ( = ?auto_615617 ?auto_615618 ) ) ( not ( = ?auto_615617 ?auto_615619 ) ) ( not ( = ?auto_615617 ?auto_615620 ) ) ( not ( = ?auto_615617 ?auto_615621 ) ) ( not ( = ?auto_615617 ?auto_615622 ) ) ( not ( = ?auto_615617 ?auto_615623 ) ) ( not ( = ?auto_615617 ?auto_615624 ) ) ( not ( = ?auto_615617 ?auto_615625 ) ) ( not ( = ?auto_615617 ?auto_615626 ) ) ( not ( = ?auto_615617 ?auto_615627 ) ) ( not ( = ?auto_615617 ?auto_615628 ) ) ( not ( = ?auto_615618 ?auto_615619 ) ) ( not ( = ?auto_615618 ?auto_615620 ) ) ( not ( = ?auto_615618 ?auto_615621 ) ) ( not ( = ?auto_615618 ?auto_615622 ) ) ( not ( = ?auto_615618 ?auto_615623 ) ) ( not ( = ?auto_615618 ?auto_615624 ) ) ( not ( = ?auto_615618 ?auto_615625 ) ) ( not ( = ?auto_615618 ?auto_615626 ) ) ( not ( = ?auto_615618 ?auto_615627 ) ) ( not ( = ?auto_615618 ?auto_615628 ) ) ( not ( = ?auto_615619 ?auto_615620 ) ) ( not ( = ?auto_615619 ?auto_615621 ) ) ( not ( = ?auto_615619 ?auto_615622 ) ) ( not ( = ?auto_615619 ?auto_615623 ) ) ( not ( = ?auto_615619 ?auto_615624 ) ) ( not ( = ?auto_615619 ?auto_615625 ) ) ( not ( = ?auto_615619 ?auto_615626 ) ) ( not ( = ?auto_615619 ?auto_615627 ) ) ( not ( = ?auto_615619 ?auto_615628 ) ) ( not ( = ?auto_615620 ?auto_615621 ) ) ( not ( = ?auto_615620 ?auto_615622 ) ) ( not ( = ?auto_615620 ?auto_615623 ) ) ( not ( = ?auto_615620 ?auto_615624 ) ) ( not ( = ?auto_615620 ?auto_615625 ) ) ( not ( = ?auto_615620 ?auto_615626 ) ) ( not ( = ?auto_615620 ?auto_615627 ) ) ( not ( = ?auto_615620 ?auto_615628 ) ) ( not ( = ?auto_615621 ?auto_615622 ) ) ( not ( = ?auto_615621 ?auto_615623 ) ) ( not ( = ?auto_615621 ?auto_615624 ) ) ( not ( = ?auto_615621 ?auto_615625 ) ) ( not ( = ?auto_615621 ?auto_615626 ) ) ( not ( = ?auto_615621 ?auto_615627 ) ) ( not ( = ?auto_615621 ?auto_615628 ) ) ( not ( = ?auto_615622 ?auto_615623 ) ) ( not ( = ?auto_615622 ?auto_615624 ) ) ( not ( = ?auto_615622 ?auto_615625 ) ) ( not ( = ?auto_615622 ?auto_615626 ) ) ( not ( = ?auto_615622 ?auto_615627 ) ) ( not ( = ?auto_615622 ?auto_615628 ) ) ( not ( = ?auto_615623 ?auto_615624 ) ) ( not ( = ?auto_615623 ?auto_615625 ) ) ( not ( = ?auto_615623 ?auto_615626 ) ) ( not ( = ?auto_615623 ?auto_615627 ) ) ( not ( = ?auto_615623 ?auto_615628 ) ) ( not ( = ?auto_615624 ?auto_615625 ) ) ( not ( = ?auto_615624 ?auto_615626 ) ) ( not ( = ?auto_615624 ?auto_615627 ) ) ( not ( = ?auto_615624 ?auto_615628 ) ) ( not ( = ?auto_615625 ?auto_615626 ) ) ( not ( = ?auto_615625 ?auto_615627 ) ) ( not ( = ?auto_615625 ?auto_615628 ) ) ( not ( = ?auto_615626 ?auto_615627 ) ) ( not ( = ?auto_615626 ?auto_615628 ) ) ( not ( = ?auto_615627 ?auto_615628 ) ) ( CLEAR ?auto_615625 ) ( ON ?auto_615626 ?auto_615627 ) ( CLEAR ?auto_615626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_615615 ?auto_615616 ?auto_615617 ?auto_615618 ?auto_615619 ?auto_615620 ?auto_615621 ?auto_615622 ?auto_615623 ?auto_615624 ?auto_615625 ?auto_615626 )
      ( MAKE-13PILE ?auto_615615 ?auto_615616 ?auto_615617 ?auto_615618 ?auto_615619 ?auto_615620 ?auto_615621 ?auto_615622 ?auto_615623 ?auto_615624 ?auto_615625 ?auto_615626 ?auto_615627 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_615669 - BLOCK
      ?auto_615670 - BLOCK
      ?auto_615671 - BLOCK
      ?auto_615672 - BLOCK
      ?auto_615673 - BLOCK
      ?auto_615674 - BLOCK
      ?auto_615675 - BLOCK
      ?auto_615676 - BLOCK
      ?auto_615677 - BLOCK
      ?auto_615678 - BLOCK
      ?auto_615679 - BLOCK
      ?auto_615680 - BLOCK
      ?auto_615681 - BLOCK
    )
    :vars
    (
      ?auto_615682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615681 ?auto_615682 ) ( ON-TABLE ?auto_615669 ) ( ON ?auto_615670 ?auto_615669 ) ( ON ?auto_615671 ?auto_615670 ) ( ON ?auto_615672 ?auto_615671 ) ( ON ?auto_615673 ?auto_615672 ) ( ON ?auto_615674 ?auto_615673 ) ( ON ?auto_615675 ?auto_615674 ) ( ON ?auto_615676 ?auto_615675 ) ( ON ?auto_615677 ?auto_615676 ) ( ON ?auto_615678 ?auto_615677 ) ( not ( = ?auto_615669 ?auto_615670 ) ) ( not ( = ?auto_615669 ?auto_615671 ) ) ( not ( = ?auto_615669 ?auto_615672 ) ) ( not ( = ?auto_615669 ?auto_615673 ) ) ( not ( = ?auto_615669 ?auto_615674 ) ) ( not ( = ?auto_615669 ?auto_615675 ) ) ( not ( = ?auto_615669 ?auto_615676 ) ) ( not ( = ?auto_615669 ?auto_615677 ) ) ( not ( = ?auto_615669 ?auto_615678 ) ) ( not ( = ?auto_615669 ?auto_615679 ) ) ( not ( = ?auto_615669 ?auto_615680 ) ) ( not ( = ?auto_615669 ?auto_615681 ) ) ( not ( = ?auto_615669 ?auto_615682 ) ) ( not ( = ?auto_615670 ?auto_615671 ) ) ( not ( = ?auto_615670 ?auto_615672 ) ) ( not ( = ?auto_615670 ?auto_615673 ) ) ( not ( = ?auto_615670 ?auto_615674 ) ) ( not ( = ?auto_615670 ?auto_615675 ) ) ( not ( = ?auto_615670 ?auto_615676 ) ) ( not ( = ?auto_615670 ?auto_615677 ) ) ( not ( = ?auto_615670 ?auto_615678 ) ) ( not ( = ?auto_615670 ?auto_615679 ) ) ( not ( = ?auto_615670 ?auto_615680 ) ) ( not ( = ?auto_615670 ?auto_615681 ) ) ( not ( = ?auto_615670 ?auto_615682 ) ) ( not ( = ?auto_615671 ?auto_615672 ) ) ( not ( = ?auto_615671 ?auto_615673 ) ) ( not ( = ?auto_615671 ?auto_615674 ) ) ( not ( = ?auto_615671 ?auto_615675 ) ) ( not ( = ?auto_615671 ?auto_615676 ) ) ( not ( = ?auto_615671 ?auto_615677 ) ) ( not ( = ?auto_615671 ?auto_615678 ) ) ( not ( = ?auto_615671 ?auto_615679 ) ) ( not ( = ?auto_615671 ?auto_615680 ) ) ( not ( = ?auto_615671 ?auto_615681 ) ) ( not ( = ?auto_615671 ?auto_615682 ) ) ( not ( = ?auto_615672 ?auto_615673 ) ) ( not ( = ?auto_615672 ?auto_615674 ) ) ( not ( = ?auto_615672 ?auto_615675 ) ) ( not ( = ?auto_615672 ?auto_615676 ) ) ( not ( = ?auto_615672 ?auto_615677 ) ) ( not ( = ?auto_615672 ?auto_615678 ) ) ( not ( = ?auto_615672 ?auto_615679 ) ) ( not ( = ?auto_615672 ?auto_615680 ) ) ( not ( = ?auto_615672 ?auto_615681 ) ) ( not ( = ?auto_615672 ?auto_615682 ) ) ( not ( = ?auto_615673 ?auto_615674 ) ) ( not ( = ?auto_615673 ?auto_615675 ) ) ( not ( = ?auto_615673 ?auto_615676 ) ) ( not ( = ?auto_615673 ?auto_615677 ) ) ( not ( = ?auto_615673 ?auto_615678 ) ) ( not ( = ?auto_615673 ?auto_615679 ) ) ( not ( = ?auto_615673 ?auto_615680 ) ) ( not ( = ?auto_615673 ?auto_615681 ) ) ( not ( = ?auto_615673 ?auto_615682 ) ) ( not ( = ?auto_615674 ?auto_615675 ) ) ( not ( = ?auto_615674 ?auto_615676 ) ) ( not ( = ?auto_615674 ?auto_615677 ) ) ( not ( = ?auto_615674 ?auto_615678 ) ) ( not ( = ?auto_615674 ?auto_615679 ) ) ( not ( = ?auto_615674 ?auto_615680 ) ) ( not ( = ?auto_615674 ?auto_615681 ) ) ( not ( = ?auto_615674 ?auto_615682 ) ) ( not ( = ?auto_615675 ?auto_615676 ) ) ( not ( = ?auto_615675 ?auto_615677 ) ) ( not ( = ?auto_615675 ?auto_615678 ) ) ( not ( = ?auto_615675 ?auto_615679 ) ) ( not ( = ?auto_615675 ?auto_615680 ) ) ( not ( = ?auto_615675 ?auto_615681 ) ) ( not ( = ?auto_615675 ?auto_615682 ) ) ( not ( = ?auto_615676 ?auto_615677 ) ) ( not ( = ?auto_615676 ?auto_615678 ) ) ( not ( = ?auto_615676 ?auto_615679 ) ) ( not ( = ?auto_615676 ?auto_615680 ) ) ( not ( = ?auto_615676 ?auto_615681 ) ) ( not ( = ?auto_615676 ?auto_615682 ) ) ( not ( = ?auto_615677 ?auto_615678 ) ) ( not ( = ?auto_615677 ?auto_615679 ) ) ( not ( = ?auto_615677 ?auto_615680 ) ) ( not ( = ?auto_615677 ?auto_615681 ) ) ( not ( = ?auto_615677 ?auto_615682 ) ) ( not ( = ?auto_615678 ?auto_615679 ) ) ( not ( = ?auto_615678 ?auto_615680 ) ) ( not ( = ?auto_615678 ?auto_615681 ) ) ( not ( = ?auto_615678 ?auto_615682 ) ) ( not ( = ?auto_615679 ?auto_615680 ) ) ( not ( = ?auto_615679 ?auto_615681 ) ) ( not ( = ?auto_615679 ?auto_615682 ) ) ( not ( = ?auto_615680 ?auto_615681 ) ) ( not ( = ?auto_615680 ?auto_615682 ) ) ( not ( = ?auto_615681 ?auto_615682 ) ) ( ON ?auto_615680 ?auto_615681 ) ( CLEAR ?auto_615678 ) ( ON ?auto_615679 ?auto_615680 ) ( CLEAR ?auto_615679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_615669 ?auto_615670 ?auto_615671 ?auto_615672 ?auto_615673 ?auto_615674 ?auto_615675 ?auto_615676 ?auto_615677 ?auto_615678 ?auto_615679 )
      ( MAKE-13PILE ?auto_615669 ?auto_615670 ?auto_615671 ?auto_615672 ?auto_615673 ?auto_615674 ?auto_615675 ?auto_615676 ?auto_615677 ?auto_615678 ?auto_615679 ?auto_615680 ?auto_615681 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_615723 - BLOCK
      ?auto_615724 - BLOCK
      ?auto_615725 - BLOCK
      ?auto_615726 - BLOCK
      ?auto_615727 - BLOCK
      ?auto_615728 - BLOCK
      ?auto_615729 - BLOCK
      ?auto_615730 - BLOCK
      ?auto_615731 - BLOCK
      ?auto_615732 - BLOCK
      ?auto_615733 - BLOCK
      ?auto_615734 - BLOCK
      ?auto_615735 - BLOCK
    )
    :vars
    (
      ?auto_615736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615735 ?auto_615736 ) ( ON-TABLE ?auto_615723 ) ( ON ?auto_615724 ?auto_615723 ) ( ON ?auto_615725 ?auto_615724 ) ( ON ?auto_615726 ?auto_615725 ) ( ON ?auto_615727 ?auto_615726 ) ( ON ?auto_615728 ?auto_615727 ) ( ON ?auto_615729 ?auto_615728 ) ( ON ?auto_615730 ?auto_615729 ) ( ON ?auto_615731 ?auto_615730 ) ( not ( = ?auto_615723 ?auto_615724 ) ) ( not ( = ?auto_615723 ?auto_615725 ) ) ( not ( = ?auto_615723 ?auto_615726 ) ) ( not ( = ?auto_615723 ?auto_615727 ) ) ( not ( = ?auto_615723 ?auto_615728 ) ) ( not ( = ?auto_615723 ?auto_615729 ) ) ( not ( = ?auto_615723 ?auto_615730 ) ) ( not ( = ?auto_615723 ?auto_615731 ) ) ( not ( = ?auto_615723 ?auto_615732 ) ) ( not ( = ?auto_615723 ?auto_615733 ) ) ( not ( = ?auto_615723 ?auto_615734 ) ) ( not ( = ?auto_615723 ?auto_615735 ) ) ( not ( = ?auto_615723 ?auto_615736 ) ) ( not ( = ?auto_615724 ?auto_615725 ) ) ( not ( = ?auto_615724 ?auto_615726 ) ) ( not ( = ?auto_615724 ?auto_615727 ) ) ( not ( = ?auto_615724 ?auto_615728 ) ) ( not ( = ?auto_615724 ?auto_615729 ) ) ( not ( = ?auto_615724 ?auto_615730 ) ) ( not ( = ?auto_615724 ?auto_615731 ) ) ( not ( = ?auto_615724 ?auto_615732 ) ) ( not ( = ?auto_615724 ?auto_615733 ) ) ( not ( = ?auto_615724 ?auto_615734 ) ) ( not ( = ?auto_615724 ?auto_615735 ) ) ( not ( = ?auto_615724 ?auto_615736 ) ) ( not ( = ?auto_615725 ?auto_615726 ) ) ( not ( = ?auto_615725 ?auto_615727 ) ) ( not ( = ?auto_615725 ?auto_615728 ) ) ( not ( = ?auto_615725 ?auto_615729 ) ) ( not ( = ?auto_615725 ?auto_615730 ) ) ( not ( = ?auto_615725 ?auto_615731 ) ) ( not ( = ?auto_615725 ?auto_615732 ) ) ( not ( = ?auto_615725 ?auto_615733 ) ) ( not ( = ?auto_615725 ?auto_615734 ) ) ( not ( = ?auto_615725 ?auto_615735 ) ) ( not ( = ?auto_615725 ?auto_615736 ) ) ( not ( = ?auto_615726 ?auto_615727 ) ) ( not ( = ?auto_615726 ?auto_615728 ) ) ( not ( = ?auto_615726 ?auto_615729 ) ) ( not ( = ?auto_615726 ?auto_615730 ) ) ( not ( = ?auto_615726 ?auto_615731 ) ) ( not ( = ?auto_615726 ?auto_615732 ) ) ( not ( = ?auto_615726 ?auto_615733 ) ) ( not ( = ?auto_615726 ?auto_615734 ) ) ( not ( = ?auto_615726 ?auto_615735 ) ) ( not ( = ?auto_615726 ?auto_615736 ) ) ( not ( = ?auto_615727 ?auto_615728 ) ) ( not ( = ?auto_615727 ?auto_615729 ) ) ( not ( = ?auto_615727 ?auto_615730 ) ) ( not ( = ?auto_615727 ?auto_615731 ) ) ( not ( = ?auto_615727 ?auto_615732 ) ) ( not ( = ?auto_615727 ?auto_615733 ) ) ( not ( = ?auto_615727 ?auto_615734 ) ) ( not ( = ?auto_615727 ?auto_615735 ) ) ( not ( = ?auto_615727 ?auto_615736 ) ) ( not ( = ?auto_615728 ?auto_615729 ) ) ( not ( = ?auto_615728 ?auto_615730 ) ) ( not ( = ?auto_615728 ?auto_615731 ) ) ( not ( = ?auto_615728 ?auto_615732 ) ) ( not ( = ?auto_615728 ?auto_615733 ) ) ( not ( = ?auto_615728 ?auto_615734 ) ) ( not ( = ?auto_615728 ?auto_615735 ) ) ( not ( = ?auto_615728 ?auto_615736 ) ) ( not ( = ?auto_615729 ?auto_615730 ) ) ( not ( = ?auto_615729 ?auto_615731 ) ) ( not ( = ?auto_615729 ?auto_615732 ) ) ( not ( = ?auto_615729 ?auto_615733 ) ) ( not ( = ?auto_615729 ?auto_615734 ) ) ( not ( = ?auto_615729 ?auto_615735 ) ) ( not ( = ?auto_615729 ?auto_615736 ) ) ( not ( = ?auto_615730 ?auto_615731 ) ) ( not ( = ?auto_615730 ?auto_615732 ) ) ( not ( = ?auto_615730 ?auto_615733 ) ) ( not ( = ?auto_615730 ?auto_615734 ) ) ( not ( = ?auto_615730 ?auto_615735 ) ) ( not ( = ?auto_615730 ?auto_615736 ) ) ( not ( = ?auto_615731 ?auto_615732 ) ) ( not ( = ?auto_615731 ?auto_615733 ) ) ( not ( = ?auto_615731 ?auto_615734 ) ) ( not ( = ?auto_615731 ?auto_615735 ) ) ( not ( = ?auto_615731 ?auto_615736 ) ) ( not ( = ?auto_615732 ?auto_615733 ) ) ( not ( = ?auto_615732 ?auto_615734 ) ) ( not ( = ?auto_615732 ?auto_615735 ) ) ( not ( = ?auto_615732 ?auto_615736 ) ) ( not ( = ?auto_615733 ?auto_615734 ) ) ( not ( = ?auto_615733 ?auto_615735 ) ) ( not ( = ?auto_615733 ?auto_615736 ) ) ( not ( = ?auto_615734 ?auto_615735 ) ) ( not ( = ?auto_615734 ?auto_615736 ) ) ( not ( = ?auto_615735 ?auto_615736 ) ) ( ON ?auto_615734 ?auto_615735 ) ( ON ?auto_615733 ?auto_615734 ) ( CLEAR ?auto_615731 ) ( ON ?auto_615732 ?auto_615733 ) ( CLEAR ?auto_615732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_615723 ?auto_615724 ?auto_615725 ?auto_615726 ?auto_615727 ?auto_615728 ?auto_615729 ?auto_615730 ?auto_615731 ?auto_615732 )
      ( MAKE-13PILE ?auto_615723 ?auto_615724 ?auto_615725 ?auto_615726 ?auto_615727 ?auto_615728 ?auto_615729 ?auto_615730 ?auto_615731 ?auto_615732 ?auto_615733 ?auto_615734 ?auto_615735 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_615777 - BLOCK
      ?auto_615778 - BLOCK
      ?auto_615779 - BLOCK
      ?auto_615780 - BLOCK
      ?auto_615781 - BLOCK
      ?auto_615782 - BLOCK
      ?auto_615783 - BLOCK
      ?auto_615784 - BLOCK
      ?auto_615785 - BLOCK
      ?auto_615786 - BLOCK
      ?auto_615787 - BLOCK
      ?auto_615788 - BLOCK
      ?auto_615789 - BLOCK
    )
    :vars
    (
      ?auto_615790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615789 ?auto_615790 ) ( ON-TABLE ?auto_615777 ) ( ON ?auto_615778 ?auto_615777 ) ( ON ?auto_615779 ?auto_615778 ) ( ON ?auto_615780 ?auto_615779 ) ( ON ?auto_615781 ?auto_615780 ) ( ON ?auto_615782 ?auto_615781 ) ( ON ?auto_615783 ?auto_615782 ) ( ON ?auto_615784 ?auto_615783 ) ( not ( = ?auto_615777 ?auto_615778 ) ) ( not ( = ?auto_615777 ?auto_615779 ) ) ( not ( = ?auto_615777 ?auto_615780 ) ) ( not ( = ?auto_615777 ?auto_615781 ) ) ( not ( = ?auto_615777 ?auto_615782 ) ) ( not ( = ?auto_615777 ?auto_615783 ) ) ( not ( = ?auto_615777 ?auto_615784 ) ) ( not ( = ?auto_615777 ?auto_615785 ) ) ( not ( = ?auto_615777 ?auto_615786 ) ) ( not ( = ?auto_615777 ?auto_615787 ) ) ( not ( = ?auto_615777 ?auto_615788 ) ) ( not ( = ?auto_615777 ?auto_615789 ) ) ( not ( = ?auto_615777 ?auto_615790 ) ) ( not ( = ?auto_615778 ?auto_615779 ) ) ( not ( = ?auto_615778 ?auto_615780 ) ) ( not ( = ?auto_615778 ?auto_615781 ) ) ( not ( = ?auto_615778 ?auto_615782 ) ) ( not ( = ?auto_615778 ?auto_615783 ) ) ( not ( = ?auto_615778 ?auto_615784 ) ) ( not ( = ?auto_615778 ?auto_615785 ) ) ( not ( = ?auto_615778 ?auto_615786 ) ) ( not ( = ?auto_615778 ?auto_615787 ) ) ( not ( = ?auto_615778 ?auto_615788 ) ) ( not ( = ?auto_615778 ?auto_615789 ) ) ( not ( = ?auto_615778 ?auto_615790 ) ) ( not ( = ?auto_615779 ?auto_615780 ) ) ( not ( = ?auto_615779 ?auto_615781 ) ) ( not ( = ?auto_615779 ?auto_615782 ) ) ( not ( = ?auto_615779 ?auto_615783 ) ) ( not ( = ?auto_615779 ?auto_615784 ) ) ( not ( = ?auto_615779 ?auto_615785 ) ) ( not ( = ?auto_615779 ?auto_615786 ) ) ( not ( = ?auto_615779 ?auto_615787 ) ) ( not ( = ?auto_615779 ?auto_615788 ) ) ( not ( = ?auto_615779 ?auto_615789 ) ) ( not ( = ?auto_615779 ?auto_615790 ) ) ( not ( = ?auto_615780 ?auto_615781 ) ) ( not ( = ?auto_615780 ?auto_615782 ) ) ( not ( = ?auto_615780 ?auto_615783 ) ) ( not ( = ?auto_615780 ?auto_615784 ) ) ( not ( = ?auto_615780 ?auto_615785 ) ) ( not ( = ?auto_615780 ?auto_615786 ) ) ( not ( = ?auto_615780 ?auto_615787 ) ) ( not ( = ?auto_615780 ?auto_615788 ) ) ( not ( = ?auto_615780 ?auto_615789 ) ) ( not ( = ?auto_615780 ?auto_615790 ) ) ( not ( = ?auto_615781 ?auto_615782 ) ) ( not ( = ?auto_615781 ?auto_615783 ) ) ( not ( = ?auto_615781 ?auto_615784 ) ) ( not ( = ?auto_615781 ?auto_615785 ) ) ( not ( = ?auto_615781 ?auto_615786 ) ) ( not ( = ?auto_615781 ?auto_615787 ) ) ( not ( = ?auto_615781 ?auto_615788 ) ) ( not ( = ?auto_615781 ?auto_615789 ) ) ( not ( = ?auto_615781 ?auto_615790 ) ) ( not ( = ?auto_615782 ?auto_615783 ) ) ( not ( = ?auto_615782 ?auto_615784 ) ) ( not ( = ?auto_615782 ?auto_615785 ) ) ( not ( = ?auto_615782 ?auto_615786 ) ) ( not ( = ?auto_615782 ?auto_615787 ) ) ( not ( = ?auto_615782 ?auto_615788 ) ) ( not ( = ?auto_615782 ?auto_615789 ) ) ( not ( = ?auto_615782 ?auto_615790 ) ) ( not ( = ?auto_615783 ?auto_615784 ) ) ( not ( = ?auto_615783 ?auto_615785 ) ) ( not ( = ?auto_615783 ?auto_615786 ) ) ( not ( = ?auto_615783 ?auto_615787 ) ) ( not ( = ?auto_615783 ?auto_615788 ) ) ( not ( = ?auto_615783 ?auto_615789 ) ) ( not ( = ?auto_615783 ?auto_615790 ) ) ( not ( = ?auto_615784 ?auto_615785 ) ) ( not ( = ?auto_615784 ?auto_615786 ) ) ( not ( = ?auto_615784 ?auto_615787 ) ) ( not ( = ?auto_615784 ?auto_615788 ) ) ( not ( = ?auto_615784 ?auto_615789 ) ) ( not ( = ?auto_615784 ?auto_615790 ) ) ( not ( = ?auto_615785 ?auto_615786 ) ) ( not ( = ?auto_615785 ?auto_615787 ) ) ( not ( = ?auto_615785 ?auto_615788 ) ) ( not ( = ?auto_615785 ?auto_615789 ) ) ( not ( = ?auto_615785 ?auto_615790 ) ) ( not ( = ?auto_615786 ?auto_615787 ) ) ( not ( = ?auto_615786 ?auto_615788 ) ) ( not ( = ?auto_615786 ?auto_615789 ) ) ( not ( = ?auto_615786 ?auto_615790 ) ) ( not ( = ?auto_615787 ?auto_615788 ) ) ( not ( = ?auto_615787 ?auto_615789 ) ) ( not ( = ?auto_615787 ?auto_615790 ) ) ( not ( = ?auto_615788 ?auto_615789 ) ) ( not ( = ?auto_615788 ?auto_615790 ) ) ( not ( = ?auto_615789 ?auto_615790 ) ) ( ON ?auto_615788 ?auto_615789 ) ( ON ?auto_615787 ?auto_615788 ) ( ON ?auto_615786 ?auto_615787 ) ( CLEAR ?auto_615784 ) ( ON ?auto_615785 ?auto_615786 ) ( CLEAR ?auto_615785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_615777 ?auto_615778 ?auto_615779 ?auto_615780 ?auto_615781 ?auto_615782 ?auto_615783 ?auto_615784 ?auto_615785 )
      ( MAKE-13PILE ?auto_615777 ?auto_615778 ?auto_615779 ?auto_615780 ?auto_615781 ?auto_615782 ?auto_615783 ?auto_615784 ?auto_615785 ?auto_615786 ?auto_615787 ?auto_615788 ?auto_615789 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_615831 - BLOCK
      ?auto_615832 - BLOCK
      ?auto_615833 - BLOCK
      ?auto_615834 - BLOCK
      ?auto_615835 - BLOCK
      ?auto_615836 - BLOCK
      ?auto_615837 - BLOCK
      ?auto_615838 - BLOCK
      ?auto_615839 - BLOCK
      ?auto_615840 - BLOCK
      ?auto_615841 - BLOCK
      ?auto_615842 - BLOCK
      ?auto_615843 - BLOCK
    )
    :vars
    (
      ?auto_615844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615843 ?auto_615844 ) ( ON-TABLE ?auto_615831 ) ( ON ?auto_615832 ?auto_615831 ) ( ON ?auto_615833 ?auto_615832 ) ( ON ?auto_615834 ?auto_615833 ) ( ON ?auto_615835 ?auto_615834 ) ( ON ?auto_615836 ?auto_615835 ) ( ON ?auto_615837 ?auto_615836 ) ( not ( = ?auto_615831 ?auto_615832 ) ) ( not ( = ?auto_615831 ?auto_615833 ) ) ( not ( = ?auto_615831 ?auto_615834 ) ) ( not ( = ?auto_615831 ?auto_615835 ) ) ( not ( = ?auto_615831 ?auto_615836 ) ) ( not ( = ?auto_615831 ?auto_615837 ) ) ( not ( = ?auto_615831 ?auto_615838 ) ) ( not ( = ?auto_615831 ?auto_615839 ) ) ( not ( = ?auto_615831 ?auto_615840 ) ) ( not ( = ?auto_615831 ?auto_615841 ) ) ( not ( = ?auto_615831 ?auto_615842 ) ) ( not ( = ?auto_615831 ?auto_615843 ) ) ( not ( = ?auto_615831 ?auto_615844 ) ) ( not ( = ?auto_615832 ?auto_615833 ) ) ( not ( = ?auto_615832 ?auto_615834 ) ) ( not ( = ?auto_615832 ?auto_615835 ) ) ( not ( = ?auto_615832 ?auto_615836 ) ) ( not ( = ?auto_615832 ?auto_615837 ) ) ( not ( = ?auto_615832 ?auto_615838 ) ) ( not ( = ?auto_615832 ?auto_615839 ) ) ( not ( = ?auto_615832 ?auto_615840 ) ) ( not ( = ?auto_615832 ?auto_615841 ) ) ( not ( = ?auto_615832 ?auto_615842 ) ) ( not ( = ?auto_615832 ?auto_615843 ) ) ( not ( = ?auto_615832 ?auto_615844 ) ) ( not ( = ?auto_615833 ?auto_615834 ) ) ( not ( = ?auto_615833 ?auto_615835 ) ) ( not ( = ?auto_615833 ?auto_615836 ) ) ( not ( = ?auto_615833 ?auto_615837 ) ) ( not ( = ?auto_615833 ?auto_615838 ) ) ( not ( = ?auto_615833 ?auto_615839 ) ) ( not ( = ?auto_615833 ?auto_615840 ) ) ( not ( = ?auto_615833 ?auto_615841 ) ) ( not ( = ?auto_615833 ?auto_615842 ) ) ( not ( = ?auto_615833 ?auto_615843 ) ) ( not ( = ?auto_615833 ?auto_615844 ) ) ( not ( = ?auto_615834 ?auto_615835 ) ) ( not ( = ?auto_615834 ?auto_615836 ) ) ( not ( = ?auto_615834 ?auto_615837 ) ) ( not ( = ?auto_615834 ?auto_615838 ) ) ( not ( = ?auto_615834 ?auto_615839 ) ) ( not ( = ?auto_615834 ?auto_615840 ) ) ( not ( = ?auto_615834 ?auto_615841 ) ) ( not ( = ?auto_615834 ?auto_615842 ) ) ( not ( = ?auto_615834 ?auto_615843 ) ) ( not ( = ?auto_615834 ?auto_615844 ) ) ( not ( = ?auto_615835 ?auto_615836 ) ) ( not ( = ?auto_615835 ?auto_615837 ) ) ( not ( = ?auto_615835 ?auto_615838 ) ) ( not ( = ?auto_615835 ?auto_615839 ) ) ( not ( = ?auto_615835 ?auto_615840 ) ) ( not ( = ?auto_615835 ?auto_615841 ) ) ( not ( = ?auto_615835 ?auto_615842 ) ) ( not ( = ?auto_615835 ?auto_615843 ) ) ( not ( = ?auto_615835 ?auto_615844 ) ) ( not ( = ?auto_615836 ?auto_615837 ) ) ( not ( = ?auto_615836 ?auto_615838 ) ) ( not ( = ?auto_615836 ?auto_615839 ) ) ( not ( = ?auto_615836 ?auto_615840 ) ) ( not ( = ?auto_615836 ?auto_615841 ) ) ( not ( = ?auto_615836 ?auto_615842 ) ) ( not ( = ?auto_615836 ?auto_615843 ) ) ( not ( = ?auto_615836 ?auto_615844 ) ) ( not ( = ?auto_615837 ?auto_615838 ) ) ( not ( = ?auto_615837 ?auto_615839 ) ) ( not ( = ?auto_615837 ?auto_615840 ) ) ( not ( = ?auto_615837 ?auto_615841 ) ) ( not ( = ?auto_615837 ?auto_615842 ) ) ( not ( = ?auto_615837 ?auto_615843 ) ) ( not ( = ?auto_615837 ?auto_615844 ) ) ( not ( = ?auto_615838 ?auto_615839 ) ) ( not ( = ?auto_615838 ?auto_615840 ) ) ( not ( = ?auto_615838 ?auto_615841 ) ) ( not ( = ?auto_615838 ?auto_615842 ) ) ( not ( = ?auto_615838 ?auto_615843 ) ) ( not ( = ?auto_615838 ?auto_615844 ) ) ( not ( = ?auto_615839 ?auto_615840 ) ) ( not ( = ?auto_615839 ?auto_615841 ) ) ( not ( = ?auto_615839 ?auto_615842 ) ) ( not ( = ?auto_615839 ?auto_615843 ) ) ( not ( = ?auto_615839 ?auto_615844 ) ) ( not ( = ?auto_615840 ?auto_615841 ) ) ( not ( = ?auto_615840 ?auto_615842 ) ) ( not ( = ?auto_615840 ?auto_615843 ) ) ( not ( = ?auto_615840 ?auto_615844 ) ) ( not ( = ?auto_615841 ?auto_615842 ) ) ( not ( = ?auto_615841 ?auto_615843 ) ) ( not ( = ?auto_615841 ?auto_615844 ) ) ( not ( = ?auto_615842 ?auto_615843 ) ) ( not ( = ?auto_615842 ?auto_615844 ) ) ( not ( = ?auto_615843 ?auto_615844 ) ) ( ON ?auto_615842 ?auto_615843 ) ( ON ?auto_615841 ?auto_615842 ) ( ON ?auto_615840 ?auto_615841 ) ( ON ?auto_615839 ?auto_615840 ) ( CLEAR ?auto_615837 ) ( ON ?auto_615838 ?auto_615839 ) ( CLEAR ?auto_615838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_615831 ?auto_615832 ?auto_615833 ?auto_615834 ?auto_615835 ?auto_615836 ?auto_615837 ?auto_615838 )
      ( MAKE-13PILE ?auto_615831 ?auto_615832 ?auto_615833 ?auto_615834 ?auto_615835 ?auto_615836 ?auto_615837 ?auto_615838 ?auto_615839 ?auto_615840 ?auto_615841 ?auto_615842 ?auto_615843 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_615885 - BLOCK
      ?auto_615886 - BLOCK
      ?auto_615887 - BLOCK
      ?auto_615888 - BLOCK
      ?auto_615889 - BLOCK
      ?auto_615890 - BLOCK
      ?auto_615891 - BLOCK
      ?auto_615892 - BLOCK
      ?auto_615893 - BLOCK
      ?auto_615894 - BLOCK
      ?auto_615895 - BLOCK
      ?auto_615896 - BLOCK
      ?auto_615897 - BLOCK
    )
    :vars
    (
      ?auto_615898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615897 ?auto_615898 ) ( ON-TABLE ?auto_615885 ) ( ON ?auto_615886 ?auto_615885 ) ( ON ?auto_615887 ?auto_615886 ) ( ON ?auto_615888 ?auto_615887 ) ( ON ?auto_615889 ?auto_615888 ) ( ON ?auto_615890 ?auto_615889 ) ( not ( = ?auto_615885 ?auto_615886 ) ) ( not ( = ?auto_615885 ?auto_615887 ) ) ( not ( = ?auto_615885 ?auto_615888 ) ) ( not ( = ?auto_615885 ?auto_615889 ) ) ( not ( = ?auto_615885 ?auto_615890 ) ) ( not ( = ?auto_615885 ?auto_615891 ) ) ( not ( = ?auto_615885 ?auto_615892 ) ) ( not ( = ?auto_615885 ?auto_615893 ) ) ( not ( = ?auto_615885 ?auto_615894 ) ) ( not ( = ?auto_615885 ?auto_615895 ) ) ( not ( = ?auto_615885 ?auto_615896 ) ) ( not ( = ?auto_615885 ?auto_615897 ) ) ( not ( = ?auto_615885 ?auto_615898 ) ) ( not ( = ?auto_615886 ?auto_615887 ) ) ( not ( = ?auto_615886 ?auto_615888 ) ) ( not ( = ?auto_615886 ?auto_615889 ) ) ( not ( = ?auto_615886 ?auto_615890 ) ) ( not ( = ?auto_615886 ?auto_615891 ) ) ( not ( = ?auto_615886 ?auto_615892 ) ) ( not ( = ?auto_615886 ?auto_615893 ) ) ( not ( = ?auto_615886 ?auto_615894 ) ) ( not ( = ?auto_615886 ?auto_615895 ) ) ( not ( = ?auto_615886 ?auto_615896 ) ) ( not ( = ?auto_615886 ?auto_615897 ) ) ( not ( = ?auto_615886 ?auto_615898 ) ) ( not ( = ?auto_615887 ?auto_615888 ) ) ( not ( = ?auto_615887 ?auto_615889 ) ) ( not ( = ?auto_615887 ?auto_615890 ) ) ( not ( = ?auto_615887 ?auto_615891 ) ) ( not ( = ?auto_615887 ?auto_615892 ) ) ( not ( = ?auto_615887 ?auto_615893 ) ) ( not ( = ?auto_615887 ?auto_615894 ) ) ( not ( = ?auto_615887 ?auto_615895 ) ) ( not ( = ?auto_615887 ?auto_615896 ) ) ( not ( = ?auto_615887 ?auto_615897 ) ) ( not ( = ?auto_615887 ?auto_615898 ) ) ( not ( = ?auto_615888 ?auto_615889 ) ) ( not ( = ?auto_615888 ?auto_615890 ) ) ( not ( = ?auto_615888 ?auto_615891 ) ) ( not ( = ?auto_615888 ?auto_615892 ) ) ( not ( = ?auto_615888 ?auto_615893 ) ) ( not ( = ?auto_615888 ?auto_615894 ) ) ( not ( = ?auto_615888 ?auto_615895 ) ) ( not ( = ?auto_615888 ?auto_615896 ) ) ( not ( = ?auto_615888 ?auto_615897 ) ) ( not ( = ?auto_615888 ?auto_615898 ) ) ( not ( = ?auto_615889 ?auto_615890 ) ) ( not ( = ?auto_615889 ?auto_615891 ) ) ( not ( = ?auto_615889 ?auto_615892 ) ) ( not ( = ?auto_615889 ?auto_615893 ) ) ( not ( = ?auto_615889 ?auto_615894 ) ) ( not ( = ?auto_615889 ?auto_615895 ) ) ( not ( = ?auto_615889 ?auto_615896 ) ) ( not ( = ?auto_615889 ?auto_615897 ) ) ( not ( = ?auto_615889 ?auto_615898 ) ) ( not ( = ?auto_615890 ?auto_615891 ) ) ( not ( = ?auto_615890 ?auto_615892 ) ) ( not ( = ?auto_615890 ?auto_615893 ) ) ( not ( = ?auto_615890 ?auto_615894 ) ) ( not ( = ?auto_615890 ?auto_615895 ) ) ( not ( = ?auto_615890 ?auto_615896 ) ) ( not ( = ?auto_615890 ?auto_615897 ) ) ( not ( = ?auto_615890 ?auto_615898 ) ) ( not ( = ?auto_615891 ?auto_615892 ) ) ( not ( = ?auto_615891 ?auto_615893 ) ) ( not ( = ?auto_615891 ?auto_615894 ) ) ( not ( = ?auto_615891 ?auto_615895 ) ) ( not ( = ?auto_615891 ?auto_615896 ) ) ( not ( = ?auto_615891 ?auto_615897 ) ) ( not ( = ?auto_615891 ?auto_615898 ) ) ( not ( = ?auto_615892 ?auto_615893 ) ) ( not ( = ?auto_615892 ?auto_615894 ) ) ( not ( = ?auto_615892 ?auto_615895 ) ) ( not ( = ?auto_615892 ?auto_615896 ) ) ( not ( = ?auto_615892 ?auto_615897 ) ) ( not ( = ?auto_615892 ?auto_615898 ) ) ( not ( = ?auto_615893 ?auto_615894 ) ) ( not ( = ?auto_615893 ?auto_615895 ) ) ( not ( = ?auto_615893 ?auto_615896 ) ) ( not ( = ?auto_615893 ?auto_615897 ) ) ( not ( = ?auto_615893 ?auto_615898 ) ) ( not ( = ?auto_615894 ?auto_615895 ) ) ( not ( = ?auto_615894 ?auto_615896 ) ) ( not ( = ?auto_615894 ?auto_615897 ) ) ( not ( = ?auto_615894 ?auto_615898 ) ) ( not ( = ?auto_615895 ?auto_615896 ) ) ( not ( = ?auto_615895 ?auto_615897 ) ) ( not ( = ?auto_615895 ?auto_615898 ) ) ( not ( = ?auto_615896 ?auto_615897 ) ) ( not ( = ?auto_615896 ?auto_615898 ) ) ( not ( = ?auto_615897 ?auto_615898 ) ) ( ON ?auto_615896 ?auto_615897 ) ( ON ?auto_615895 ?auto_615896 ) ( ON ?auto_615894 ?auto_615895 ) ( ON ?auto_615893 ?auto_615894 ) ( ON ?auto_615892 ?auto_615893 ) ( CLEAR ?auto_615890 ) ( ON ?auto_615891 ?auto_615892 ) ( CLEAR ?auto_615891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_615885 ?auto_615886 ?auto_615887 ?auto_615888 ?auto_615889 ?auto_615890 ?auto_615891 )
      ( MAKE-13PILE ?auto_615885 ?auto_615886 ?auto_615887 ?auto_615888 ?auto_615889 ?auto_615890 ?auto_615891 ?auto_615892 ?auto_615893 ?auto_615894 ?auto_615895 ?auto_615896 ?auto_615897 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_615939 - BLOCK
      ?auto_615940 - BLOCK
      ?auto_615941 - BLOCK
      ?auto_615942 - BLOCK
      ?auto_615943 - BLOCK
      ?auto_615944 - BLOCK
      ?auto_615945 - BLOCK
      ?auto_615946 - BLOCK
      ?auto_615947 - BLOCK
      ?auto_615948 - BLOCK
      ?auto_615949 - BLOCK
      ?auto_615950 - BLOCK
      ?auto_615951 - BLOCK
    )
    :vars
    (
      ?auto_615952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_615951 ?auto_615952 ) ( ON-TABLE ?auto_615939 ) ( ON ?auto_615940 ?auto_615939 ) ( ON ?auto_615941 ?auto_615940 ) ( ON ?auto_615942 ?auto_615941 ) ( ON ?auto_615943 ?auto_615942 ) ( not ( = ?auto_615939 ?auto_615940 ) ) ( not ( = ?auto_615939 ?auto_615941 ) ) ( not ( = ?auto_615939 ?auto_615942 ) ) ( not ( = ?auto_615939 ?auto_615943 ) ) ( not ( = ?auto_615939 ?auto_615944 ) ) ( not ( = ?auto_615939 ?auto_615945 ) ) ( not ( = ?auto_615939 ?auto_615946 ) ) ( not ( = ?auto_615939 ?auto_615947 ) ) ( not ( = ?auto_615939 ?auto_615948 ) ) ( not ( = ?auto_615939 ?auto_615949 ) ) ( not ( = ?auto_615939 ?auto_615950 ) ) ( not ( = ?auto_615939 ?auto_615951 ) ) ( not ( = ?auto_615939 ?auto_615952 ) ) ( not ( = ?auto_615940 ?auto_615941 ) ) ( not ( = ?auto_615940 ?auto_615942 ) ) ( not ( = ?auto_615940 ?auto_615943 ) ) ( not ( = ?auto_615940 ?auto_615944 ) ) ( not ( = ?auto_615940 ?auto_615945 ) ) ( not ( = ?auto_615940 ?auto_615946 ) ) ( not ( = ?auto_615940 ?auto_615947 ) ) ( not ( = ?auto_615940 ?auto_615948 ) ) ( not ( = ?auto_615940 ?auto_615949 ) ) ( not ( = ?auto_615940 ?auto_615950 ) ) ( not ( = ?auto_615940 ?auto_615951 ) ) ( not ( = ?auto_615940 ?auto_615952 ) ) ( not ( = ?auto_615941 ?auto_615942 ) ) ( not ( = ?auto_615941 ?auto_615943 ) ) ( not ( = ?auto_615941 ?auto_615944 ) ) ( not ( = ?auto_615941 ?auto_615945 ) ) ( not ( = ?auto_615941 ?auto_615946 ) ) ( not ( = ?auto_615941 ?auto_615947 ) ) ( not ( = ?auto_615941 ?auto_615948 ) ) ( not ( = ?auto_615941 ?auto_615949 ) ) ( not ( = ?auto_615941 ?auto_615950 ) ) ( not ( = ?auto_615941 ?auto_615951 ) ) ( not ( = ?auto_615941 ?auto_615952 ) ) ( not ( = ?auto_615942 ?auto_615943 ) ) ( not ( = ?auto_615942 ?auto_615944 ) ) ( not ( = ?auto_615942 ?auto_615945 ) ) ( not ( = ?auto_615942 ?auto_615946 ) ) ( not ( = ?auto_615942 ?auto_615947 ) ) ( not ( = ?auto_615942 ?auto_615948 ) ) ( not ( = ?auto_615942 ?auto_615949 ) ) ( not ( = ?auto_615942 ?auto_615950 ) ) ( not ( = ?auto_615942 ?auto_615951 ) ) ( not ( = ?auto_615942 ?auto_615952 ) ) ( not ( = ?auto_615943 ?auto_615944 ) ) ( not ( = ?auto_615943 ?auto_615945 ) ) ( not ( = ?auto_615943 ?auto_615946 ) ) ( not ( = ?auto_615943 ?auto_615947 ) ) ( not ( = ?auto_615943 ?auto_615948 ) ) ( not ( = ?auto_615943 ?auto_615949 ) ) ( not ( = ?auto_615943 ?auto_615950 ) ) ( not ( = ?auto_615943 ?auto_615951 ) ) ( not ( = ?auto_615943 ?auto_615952 ) ) ( not ( = ?auto_615944 ?auto_615945 ) ) ( not ( = ?auto_615944 ?auto_615946 ) ) ( not ( = ?auto_615944 ?auto_615947 ) ) ( not ( = ?auto_615944 ?auto_615948 ) ) ( not ( = ?auto_615944 ?auto_615949 ) ) ( not ( = ?auto_615944 ?auto_615950 ) ) ( not ( = ?auto_615944 ?auto_615951 ) ) ( not ( = ?auto_615944 ?auto_615952 ) ) ( not ( = ?auto_615945 ?auto_615946 ) ) ( not ( = ?auto_615945 ?auto_615947 ) ) ( not ( = ?auto_615945 ?auto_615948 ) ) ( not ( = ?auto_615945 ?auto_615949 ) ) ( not ( = ?auto_615945 ?auto_615950 ) ) ( not ( = ?auto_615945 ?auto_615951 ) ) ( not ( = ?auto_615945 ?auto_615952 ) ) ( not ( = ?auto_615946 ?auto_615947 ) ) ( not ( = ?auto_615946 ?auto_615948 ) ) ( not ( = ?auto_615946 ?auto_615949 ) ) ( not ( = ?auto_615946 ?auto_615950 ) ) ( not ( = ?auto_615946 ?auto_615951 ) ) ( not ( = ?auto_615946 ?auto_615952 ) ) ( not ( = ?auto_615947 ?auto_615948 ) ) ( not ( = ?auto_615947 ?auto_615949 ) ) ( not ( = ?auto_615947 ?auto_615950 ) ) ( not ( = ?auto_615947 ?auto_615951 ) ) ( not ( = ?auto_615947 ?auto_615952 ) ) ( not ( = ?auto_615948 ?auto_615949 ) ) ( not ( = ?auto_615948 ?auto_615950 ) ) ( not ( = ?auto_615948 ?auto_615951 ) ) ( not ( = ?auto_615948 ?auto_615952 ) ) ( not ( = ?auto_615949 ?auto_615950 ) ) ( not ( = ?auto_615949 ?auto_615951 ) ) ( not ( = ?auto_615949 ?auto_615952 ) ) ( not ( = ?auto_615950 ?auto_615951 ) ) ( not ( = ?auto_615950 ?auto_615952 ) ) ( not ( = ?auto_615951 ?auto_615952 ) ) ( ON ?auto_615950 ?auto_615951 ) ( ON ?auto_615949 ?auto_615950 ) ( ON ?auto_615948 ?auto_615949 ) ( ON ?auto_615947 ?auto_615948 ) ( ON ?auto_615946 ?auto_615947 ) ( ON ?auto_615945 ?auto_615946 ) ( CLEAR ?auto_615943 ) ( ON ?auto_615944 ?auto_615945 ) ( CLEAR ?auto_615944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_615939 ?auto_615940 ?auto_615941 ?auto_615942 ?auto_615943 ?auto_615944 )
      ( MAKE-13PILE ?auto_615939 ?auto_615940 ?auto_615941 ?auto_615942 ?auto_615943 ?auto_615944 ?auto_615945 ?auto_615946 ?auto_615947 ?auto_615948 ?auto_615949 ?auto_615950 ?auto_615951 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_615993 - BLOCK
      ?auto_615994 - BLOCK
      ?auto_615995 - BLOCK
      ?auto_615996 - BLOCK
      ?auto_615997 - BLOCK
      ?auto_615998 - BLOCK
      ?auto_615999 - BLOCK
      ?auto_616000 - BLOCK
      ?auto_616001 - BLOCK
      ?auto_616002 - BLOCK
      ?auto_616003 - BLOCK
      ?auto_616004 - BLOCK
      ?auto_616005 - BLOCK
    )
    :vars
    (
      ?auto_616006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616005 ?auto_616006 ) ( ON-TABLE ?auto_615993 ) ( ON ?auto_615994 ?auto_615993 ) ( ON ?auto_615995 ?auto_615994 ) ( ON ?auto_615996 ?auto_615995 ) ( not ( = ?auto_615993 ?auto_615994 ) ) ( not ( = ?auto_615993 ?auto_615995 ) ) ( not ( = ?auto_615993 ?auto_615996 ) ) ( not ( = ?auto_615993 ?auto_615997 ) ) ( not ( = ?auto_615993 ?auto_615998 ) ) ( not ( = ?auto_615993 ?auto_615999 ) ) ( not ( = ?auto_615993 ?auto_616000 ) ) ( not ( = ?auto_615993 ?auto_616001 ) ) ( not ( = ?auto_615993 ?auto_616002 ) ) ( not ( = ?auto_615993 ?auto_616003 ) ) ( not ( = ?auto_615993 ?auto_616004 ) ) ( not ( = ?auto_615993 ?auto_616005 ) ) ( not ( = ?auto_615993 ?auto_616006 ) ) ( not ( = ?auto_615994 ?auto_615995 ) ) ( not ( = ?auto_615994 ?auto_615996 ) ) ( not ( = ?auto_615994 ?auto_615997 ) ) ( not ( = ?auto_615994 ?auto_615998 ) ) ( not ( = ?auto_615994 ?auto_615999 ) ) ( not ( = ?auto_615994 ?auto_616000 ) ) ( not ( = ?auto_615994 ?auto_616001 ) ) ( not ( = ?auto_615994 ?auto_616002 ) ) ( not ( = ?auto_615994 ?auto_616003 ) ) ( not ( = ?auto_615994 ?auto_616004 ) ) ( not ( = ?auto_615994 ?auto_616005 ) ) ( not ( = ?auto_615994 ?auto_616006 ) ) ( not ( = ?auto_615995 ?auto_615996 ) ) ( not ( = ?auto_615995 ?auto_615997 ) ) ( not ( = ?auto_615995 ?auto_615998 ) ) ( not ( = ?auto_615995 ?auto_615999 ) ) ( not ( = ?auto_615995 ?auto_616000 ) ) ( not ( = ?auto_615995 ?auto_616001 ) ) ( not ( = ?auto_615995 ?auto_616002 ) ) ( not ( = ?auto_615995 ?auto_616003 ) ) ( not ( = ?auto_615995 ?auto_616004 ) ) ( not ( = ?auto_615995 ?auto_616005 ) ) ( not ( = ?auto_615995 ?auto_616006 ) ) ( not ( = ?auto_615996 ?auto_615997 ) ) ( not ( = ?auto_615996 ?auto_615998 ) ) ( not ( = ?auto_615996 ?auto_615999 ) ) ( not ( = ?auto_615996 ?auto_616000 ) ) ( not ( = ?auto_615996 ?auto_616001 ) ) ( not ( = ?auto_615996 ?auto_616002 ) ) ( not ( = ?auto_615996 ?auto_616003 ) ) ( not ( = ?auto_615996 ?auto_616004 ) ) ( not ( = ?auto_615996 ?auto_616005 ) ) ( not ( = ?auto_615996 ?auto_616006 ) ) ( not ( = ?auto_615997 ?auto_615998 ) ) ( not ( = ?auto_615997 ?auto_615999 ) ) ( not ( = ?auto_615997 ?auto_616000 ) ) ( not ( = ?auto_615997 ?auto_616001 ) ) ( not ( = ?auto_615997 ?auto_616002 ) ) ( not ( = ?auto_615997 ?auto_616003 ) ) ( not ( = ?auto_615997 ?auto_616004 ) ) ( not ( = ?auto_615997 ?auto_616005 ) ) ( not ( = ?auto_615997 ?auto_616006 ) ) ( not ( = ?auto_615998 ?auto_615999 ) ) ( not ( = ?auto_615998 ?auto_616000 ) ) ( not ( = ?auto_615998 ?auto_616001 ) ) ( not ( = ?auto_615998 ?auto_616002 ) ) ( not ( = ?auto_615998 ?auto_616003 ) ) ( not ( = ?auto_615998 ?auto_616004 ) ) ( not ( = ?auto_615998 ?auto_616005 ) ) ( not ( = ?auto_615998 ?auto_616006 ) ) ( not ( = ?auto_615999 ?auto_616000 ) ) ( not ( = ?auto_615999 ?auto_616001 ) ) ( not ( = ?auto_615999 ?auto_616002 ) ) ( not ( = ?auto_615999 ?auto_616003 ) ) ( not ( = ?auto_615999 ?auto_616004 ) ) ( not ( = ?auto_615999 ?auto_616005 ) ) ( not ( = ?auto_615999 ?auto_616006 ) ) ( not ( = ?auto_616000 ?auto_616001 ) ) ( not ( = ?auto_616000 ?auto_616002 ) ) ( not ( = ?auto_616000 ?auto_616003 ) ) ( not ( = ?auto_616000 ?auto_616004 ) ) ( not ( = ?auto_616000 ?auto_616005 ) ) ( not ( = ?auto_616000 ?auto_616006 ) ) ( not ( = ?auto_616001 ?auto_616002 ) ) ( not ( = ?auto_616001 ?auto_616003 ) ) ( not ( = ?auto_616001 ?auto_616004 ) ) ( not ( = ?auto_616001 ?auto_616005 ) ) ( not ( = ?auto_616001 ?auto_616006 ) ) ( not ( = ?auto_616002 ?auto_616003 ) ) ( not ( = ?auto_616002 ?auto_616004 ) ) ( not ( = ?auto_616002 ?auto_616005 ) ) ( not ( = ?auto_616002 ?auto_616006 ) ) ( not ( = ?auto_616003 ?auto_616004 ) ) ( not ( = ?auto_616003 ?auto_616005 ) ) ( not ( = ?auto_616003 ?auto_616006 ) ) ( not ( = ?auto_616004 ?auto_616005 ) ) ( not ( = ?auto_616004 ?auto_616006 ) ) ( not ( = ?auto_616005 ?auto_616006 ) ) ( ON ?auto_616004 ?auto_616005 ) ( ON ?auto_616003 ?auto_616004 ) ( ON ?auto_616002 ?auto_616003 ) ( ON ?auto_616001 ?auto_616002 ) ( ON ?auto_616000 ?auto_616001 ) ( ON ?auto_615999 ?auto_616000 ) ( ON ?auto_615998 ?auto_615999 ) ( CLEAR ?auto_615996 ) ( ON ?auto_615997 ?auto_615998 ) ( CLEAR ?auto_615997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_615993 ?auto_615994 ?auto_615995 ?auto_615996 ?auto_615997 )
      ( MAKE-13PILE ?auto_615993 ?auto_615994 ?auto_615995 ?auto_615996 ?auto_615997 ?auto_615998 ?auto_615999 ?auto_616000 ?auto_616001 ?auto_616002 ?auto_616003 ?auto_616004 ?auto_616005 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_616047 - BLOCK
      ?auto_616048 - BLOCK
      ?auto_616049 - BLOCK
      ?auto_616050 - BLOCK
      ?auto_616051 - BLOCK
      ?auto_616052 - BLOCK
      ?auto_616053 - BLOCK
      ?auto_616054 - BLOCK
      ?auto_616055 - BLOCK
      ?auto_616056 - BLOCK
      ?auto_616057 - BLOCK
      ?auto_616058 - BLOCK
      ?auto_616059 - BLOCK
    )
    :vars
    (
      ?auto_616060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616059 ?auto_616060 ) ( ON-TABLE ?auto_616047 ) ( ON ?auto_616048 ?auto_616047 ) ( ON ?auto_616049 ?auto_616048 ) ( not ( = ?auto_616047 ?auto_616048 ) ) ( not ( = ?auto_616047 ?auto_616049 ) ) ( not ( = ?auto_616047 ?auto_616050 ) ) ( not ( = ?auto_616047 ?auto_616051 ) ) ( not ( = ?auto_616047 ?auto_616052 ) ) ( not ( = ?auto_616047 ?auto_616053 ) ) ( not ( = ?auto_616047 ?auto_616054 ) ) ( not ( = ?auto_616047 ?auto_616055 ) ) ( not ( = ?auto_616047 ?auto_616056 ) ) ( not ( = ?auto_616047 ?auto_616057 ) ) ( not ( = ?auto_616047 ?auto_616058 ) ) ( not ( = ?auto_616047 ?auto_616059 ) ) ( not ( = ?auto_616047 ?auto_616060 ) ) ( not ( = ?auto_616048 ?auto_616049 ) ) ( not ( = ?auto_616048 ?auto_616050 ) ) ( not ( = ?auto_616048 ?auto_616051 ) ) ( not ( = ?auto_616048 ?auto_616052 ) ) ( not ( = ?auto_616048 ?auto_616053 ) ) ( not ( = ?auto_616048 ?auto_616054 ) ) ( not ( = ?auto_616048 ?auto_616055 ) ) ( not ( = ?auto_616048 ?auto_616056 ) ) ( not ( = ?auto_616048 ?auto_616057 ) ) ( not ( = ?auto_616048 ?auto_616058 ) ) ( not ( = ?auto_616048 ?auto_616059 ) ) ( not ( = ?auto_616048 ?auto_616060 ) ) ( not ( = ?auto_616049 ?auto_616050 ) ) ( not ( = ?auto_616049 ?auto_616051 ) ) ( not ( = ?auto_616049 ?auto_616052 ) ) ( not ( = ?auto_616049 ?auto_616053 ) ) ( not ( = ?auto_616049 ?auto_616054 ) ) ( not ( = ?auto_616049 ?auto_616055 ) ) ( not ( = ?auto_616049 ?auto_616056 ) ) ( not ( = ?auto_616049 ?auto_616057 ) ) ( not ( = ?auto_616049 ?auto_616058 ) ) ( not ( = ?auto_616049 ?auto_616059 ) ) ( not ( = ?auto_616049 ?auto_616060 ) ) ( not ( = ?auto_616050 ?auto_616051 ) ) ( not ( = ?auto_616050 ?auto_616052 ) ) ( not ( = ?auto_616050 ?auto_616053 ) ) ( not ( = ?auto_616050 ?auto_616054 ) ) ( not ( = ?auto_616050 ?auto_616055 ) ) ( not ( = ?auto_616050 ?auto_616056 ) ) ( not ( = ?auto_616050 ?auto_616057 ) ) ( not ( = ?auto_616050 ?auto_616058 ) ) ( not ( = ?auto_616050 ?auto_616059 ) ) ( not ( = ?auto_616050 ?auto_616060 ) ) ( not ( = ?auto_616051 ?auto_616052 ) ) ( not ( = ?auto_616051 ?auto_616053 ) ) ( not ( = ?auto_616051 ?auto_616054 ) ) ( not ( = ?auto_616051 ?auto_616055 ) ) ( not ( = ?auto_616051 ?auto_616056 ) ) ( not ( = ?auto_616051 ?auto_616057 ) ) ( not ( = ?auto_616051 ?auto_616058 ) ) ( not ( = ?auto_616051 ?auto_616059 ) ) ( not ( = ?auto_616051 ?auto_616060 ) ) ( not ( = ?auto_616052 ?auto_616053 ) ) ( not ( = ?auto_616052 ?auto_616054 ) ) ( not ( = ?auto_616052 ?auto_616055 ) ) ( not ( = ?auto_616052 ?auto_616056 ) ) ( not ( = ?auto_616052 ?auto_616057 ) ) ( not ( = ?auto_616052 ?auto_616058 ) ) ( not ( = ?auto_616052 ?auto_616059 ) ) ( not ( = ?auto_616052 ?auto_616060 ) ) ( not ( = ?auto_616053 ?auto_616054 ) ) ( not ( = ?auto_616053 ?auto_616055 ) ) ( not ( = ?auto_616053 ?auto_616056 ) ) ( not ( = ?auto_616053 ?auto_616057 ) ) ( not ( = ?auto_616053 ?auto_616058 ) ) ( not ( = ?auto_616053 ?auto_616059 ) ) ( not ( = ?auto_616053 ?auto_616060 ) ) ( not ( = ?auto_616054 ?auto_616055 ) ) ( not ( = ?auto_616054 ?auto_616056 ) ) ( not ( = ?auto_616054 ?auto_616057 ) ) ( not ( = ?auto_616054 ?auto_616058 ) ) ( not ( = ?auto_616054 ?auto_616059 ) ) ( not ( = ?auto_616054 ?auto_616060 ) ) ( not ( = ?auto_616055 ?auto_616056 ) ) ( not ( = ?auto_616055 ?auto_616057 ) ) ( not ( = ?auto_616055 ?auto_616058 ) ) ( not ( = ?auto_616055 ?auto_616059 ) ) ( not ( = ?auto_616055 ?auto_616060 ) ) ( not ( = ?auto_616056 ?auto_616057 ) ) ( not ( = ?auto_616056 ?auto_616058 ) ) ( not ( = ?auto_616056 ?auto_616059 ) ) ( not ( = ?auto_616056 ?auto_616060 ) ) ( not ( = ?auto_616057 ?auto_616058 ) ) ( not ( = ?auto_616057 ?auto_616059 ) ) ( not ( = ?auto_616057 ?auto_616060 ) ) ( not ( = ?auto_616058 ?auto_616059 ) ) ( not ( = ?auto_616058 ?auto_616060 ) ) ( not ( = ?auto_616059 ?auto_616060 ) ) ( ON ?auto_616058 ?auto_616059 ) ( ON ?auto_616057 ?auto_616058 ) ( ON ?auto_616056 ?auto_616057 ) ( ON ?auto_616055 ?auto_616056 ) ( ON ?auto_616054 ?auto_616055 ) ( ON ?auto_616053 ?auto_616054 ) ( ON ?auto_616052 ?auto_616053 ) ( ON ?auto_616051 ?auto_616052 ) ( CLEAR ?auto_616049 ) ( ON ?auto_616050 ?auto_616051 ) ( CLEAR ?auto_616050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_616047 ?auto_616048 ?auto_616049 ?auto_616050 )
      ( MAKE-13PILE ?auto_616047 ?auto_616048 ?auto_616049 ?auto_616050 ?auto_616051 ?auto_616052 ?auto_616053 ?auto_616054 ?auto_616055 ?auto_616056 ?auto_616057 ?auto_616058 ?auto_616059 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_616101 - BLOCK
      ?auto_616102 - BLOCK
      ?auto_616103 - BLOCK
      ?auto_616104 - BLOCK
      ?auto_616105 - BLOCK
      ?auto_616106 - BLOCK
      ?auto_616107 - BLOCK
      ?auto_616108 - BLOCK
      ?auto_616109 - BLOCK
      ?auto_616110 - BLOCK
      ?auto_616111 - BLOCK
      ?auto_616112 - BLOCK
      ?auto_616113 - BLOCK
    )
    :vars
    (
      ?auto_616114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616113 ?auto_616114 ) ( ON-TABLE ?auto_616101 ) ( ON ?auto_616102 ?auto_616101 ) ( not ( = ?auto_616101 ?auto_616102 ) ) ( not ( = ?auto_616101 ?auto_616103 ) ) ( not ( = ?auto_616101 ?auto_616104 ) ) ( not ( = ?auto_616101 ?auto_616105 ) ) ( not ( = ?auto_616101 ?auto_616106 ) ) ( not ( = ?auto_616101 ?auto_616107 ) ) ( not ( = ?auto_616101 ?auto_616108 ) ) ( not ( = ?auto_616101 ?auto_616109 ) ) ( not ( = ?auto_616101 ?auto_616110 ) ) ( not ( = ?auto_616101 ?auto_616111 ) ) ( not ( = ?auto_616101 ?auto_616112 ) ) ( not ( = ?auto_616101 ?auto_616113 ) ) ( not ( = ?auto_616101 ?auto_616114 ) ) ( not ( = ?auto_616102 ?auto_616103 ) ) ( not ( = ?auto_616102 ?auto_616104 ) ) ( not ( = ?auto_616102 ?auto_616105 ) ) ( not ( = ?auto_616102 ?auto_616106 ) ) ( not ( = ?auto_616102 ?auto_616107 ) ) ( not ( = ?auto_616102 ?auto_616108 ) ) ( not ( = ?auto_616102 ?auto_616109 ) ) ( not ( = ?auto_616102 ?auto_616110 ) ) ( not ( = ?auto_616102 ?auto_616111 ) ) ( not ( = ?auto_616102 ?auto_616112 ) ) ( not ( = ?auto_616102 ?auto_616113 ) ) ( not ( = ?auto_616102 ?auto_616114 ) ) ( not ( = ?auto_616103 ?auto_616104 ) ) ( not ( = ?auto_616103 ?auto_616105 ) ) ( not ( = ?auto_616103 ?auto_616106 ) ) ( not ( = ?auto_616103 ?auto_616107 ) ) ( not ( = ?auto_616103 ?auto_616108 ) ) ( not ( = ?auto_616103 ?auto_616109 ) ) ( not ( = ?auto_616103 ?auto_616110 ) ) ( not ( = ?auto_616103 ?auto_616111 ) ) ( not ( = ?auto_616103 ?auto_616112 ) ) ( not ( = ?auto_616103 ?auto_616113 ) ) ( not ( = ?auto_616103 ?auto_616114 ) ) ( not ( = ?auto_616104 ?auto_616105 ) ) ( not ( = ?auto_616104 ?auto_616106 ) ) ( not ( = ?auto_616104 ?auto_616107 ) ) ( not ( = ?auto_616104 ?auto_616108 ) ) ( not ( = ?auto_616104 ?auto_616109 ) ) ( not ( = ?auto_616104 ?auto_616110 ) ) ( not ( = ?auto_616104 ?auto_616111 ) ) ( not ( = ?auto_616104 ?auto_616112 ) ) ( not ( = ?auto_616104 ?auto_616113 ) ) ( not ( = ?auto_616104 ?auto_616114 ) ) ( not ( = ?auto_616105 ?auto_616106 ) ) ( not ( = ?auto_616105 ?auto_616107 ) ) ( not ( = ?auto_616105 ?auto_616108 ) ) ( not ( = ?auto_616105 ?auto_616109 ) ) ( not ( = ?auto_616105 ?auto_616110 ) ) ( not ( = ?auto_616105 ?auto_616111 ) ) ( not ( = ?auto_616105 ?auto_616112 ) ) ( not ( = ?auto_616105 ?auto_616113 ) ) ( not ( = ?auto_616105 ?auto_616114 ) ) ( not ( = ?auto_616106 ?auto_616107 ) ) ( not ( = ?auto_616106 ?auto_616108 ) ) ( not ( = ?auto_616106 ?auto_616109 ) ) ( not ( = ?auto_616106 ?auto_616110 ) ) ( not ( = ?auto_616106 ?auto_616111 ) ) ( not ( = ?auto_616106 ?auto_616112 ) ) ( not ( = ?auto_616106 ?auto_616113 ) ) ( not ( = ?auto_616106 ?auto_616114 ) ) ( not ( = ?auto_616107 ?auto_616108 ) ) ( not ( = ?auto_616107 ?auto_616109 ) ) ( not ( = ?auto_616107 ?auto_616110 ) ) ( not ( = ?auto_616107 ?auto_616111 ) ) ( not ( = ?auto_616107 ?auto_616112 ) ) ( not ( = ?auto_616107 ?auto_616113 ) ) ( not ( = ?auto_616107 ?auto_616114 ) ) ( not ( = ?auto_616108 ?auto_616109 ) ) ( not ( = ?auto_616108 ?auto_616110 ) ) ( not ( = ?auto_616108 ?auto_616111 ) ) ( not ( = ?auto_616108 ?auto_616112 ) ) ( not ( = ?auto_616108 ?auto_616113 ) ) ( not ( = ?auto_616108 ?auto_616114 ) ) ( not ( = ?auto_616109 ?auto_616110 ) ) ( not ( = ?auto_616109 ?auto_616111 ) ) ( not ( = ?auto_616109 ?auto_616112 ) ) ( not ( = ?auto_616109 ?auto_616113 ) ) ( not ( = ?auto_616109 ?auto_616114 ) ) ( not ( = ?auto_616110 ?auto_616111 ) ) ( not ( = ?auto_616110 ?auto_616112 ) ) ( not ( = ?auto_616110 ?auto_616113 ) ) ( not ( = ?auto_616110 ?auto_616114 ) ) ( not ( = ?auto_616111 ?auto_616112 ) ) ( not ( = ?auto_616111 ?auto_616113 ) ) ( not ( = ?auto_616111 ?auto_616114 ) ) ( not ( = ?auto_616112 ?auto_616113 ) ) ( not ( = ?auto_616112 ?auto_616114 ) ) ( not ( = ?auto_616113 ?auto_616114 ) ) ( ON ?auto_616112 ?auto_616113 ) ( ON ?auto_616111 ?auto_616112 ) ( ON ?auto_616110 ?auto_616111 ) ( ON ?auto_616109 ?auto_616110 ) ( ON ?auto_616108 ?auto_616109 ) ( ON ?auto_616107 ?auto_616108 ) ( ON ?auto_616106 ?auto_616107 ) ( ON ?auto_616105 ?auto_616106 ) ( ON ?auto_616104 ?auto_616105 ) ( CLEAR ?auto_616102 ) ( ON ?auto_616103 ?auto_616104 ) ( CLEAR ?auto_616103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_616101 ?auto_616102 ?auto_616103 )
      ( MAKE-13PILE ?auto_616101 ?auto_616102 ?auto_616103 ?auto_616104 ?auto_616105 ?auto_616106 ?auto_616107 ?auto_616108 ?auto_616109 ?auto_616110 ?auto_616111 ?auto_616112 ?auto_616113 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_616155 - BLOCK
      ?auto_616156 - BLOCK
      ?auto_616157 - BLOCK
      ?auto_616158 - BLOCK
      ?auto_616159 - BLOCK
      ?auto_616160 - BLOCK
      ?auto_616161 - BLOCK
      ?auto_616162 - BLOCK
      ?auto_616163 - BLOCK
      ?auto_616164 - BLOCK
      ?auto_616165 - BLOCK
      ?auto_616166 - BLOCK
      ?auto_616167 - BLOCK
    )
    :vars
    (
      ?auto_616168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616167 ?auto_616168 ) ( ON-TABLE ?auto_616155 ) ( not ( = ?auto_616155 ?auto_616156 ) ) ( not ( = ?auto_616155 ?auto_616157 ) ) ( not ( = ?auto_616155 ?auto_616158 ) ) ( not ( = ?auto_616155 ?auto_616159 ) ) ( not ( = ?auto_616155 ?auto_616160 ) ) ( not ( = ?auto_616155 ?auto_616161 ) ) ( not ( = ?auto_616155 ?auto_616162 ) ) ( not ( = ?auto_616155 ?auto_616163 ) ) ( not ( = ?auto_616155 ?auto_616164 ) ) ( not ( = ?auto_616155 ?auto_616165 ) ) ( not ( = ?auto_616155 ?auto_616166 ) ) ( not ( = ?auto_616155 ?auto_616167 ) ) ( not ( = ?auto_616155 ?auto_616168 ) ) ( not ( = ?auto_616156 ?auto_616157 ) ) ( not ( = ?auto_616156 ?auto_616158 ) ) ( not ( = ?auto_616156 ?auto_616159 ) ) ( not ( = ?auto_616156 ?auto_616160 ) ) ( not ( = ?auto_616156 ?auto_616161 ) ) ( not ( = ?auto_616156 ?auto_616162 ) ) ( not ( = ?auto_616156 ?auto_616163 ) ) ( not ( = ?auto_616156 ?auto_616164 ) ) ( not ( = ?auto_616156 ?auto_616165 ) ) ( not ( = ?auto_616156 ?auto_616166 ) ) ( not ( = ?auto_616156 ?auto_616167 ) ) ( not ( = ?auto_616156 ?auto_616168 ) ) ( not ( = ?auto_616157 ?auto_616158 ) ) ( not ( = ?auto_616157 ?auto_616159 ) ) ( not ( = ?auto_616157 ?auto_616160 ) ) ( not ( = ?auto_616157 ?auto_616161 ) ) ( not ( = ?auto_616157 ?auto_616162 ) ) ( not ( = ?auto_616157 ?auto_616163 ) ) ( not ( = ?auto_616157 ?auto_616164 ) ) ( not ( = ?auto_616157 ?auto_616165 ) ) ( not ( = ?auto_616157 ?auto_616166 ) ) ( not ( = ?auto_616157 ?auto_616167 ) ) ( not ( = ?auto_616157 ?auto_616168 ) ) ( not ( = ?auto_616158 ?auto_616159 ) ) ( not ( = ?auto_616158 ?auto_616160 ) ) ( not ( = ?auto_616158 ?auto_616161 ) ) ( not ( = ?auto_616158 ?auto_616162 ) ) ( not ( = ?auto_616158 ?auto_616163 ) ) ( not ( = ?auto_616158 ?auto_616164 ) ) ( not ( = ?auto_616158 ?auto_616165 ) ) ( not ( = ?auto_616158 ?auto_616166 ) ) ( not ( = ?auto_616158 ?auto_616167 ) ) ( not ( = ?auto_616158 ?auto_616168 ) ) ( not ( = ?auto_616159 ?auto_616160 ) ) ( not ( = ?auto_616159 ?auto_616161 ) ) ( not ( = ?auto_616159 ?auto_616162 ) ) ( not ( = ?auto_616159 ?auto_616163 ) ) ( not ( = ?auto_616159 ?auto_616164 ) ) ( not ( = ?auto_616159 ?auto_616165 ) ) ( not ( = ?auto_616159 ?auto_616166 ) ) ( not ( = ?auto_616159 ?auto_616167 ) ) ( not ( = ?auto_616159 ?auto_616168 ) ) ( not ( = ?auto_616160 ?auto_616161 ) ) ( not ( = ?auto_616160 ?auto_616162 ) ) ( not ( = ?auto_616160 ?auto_616163 ) ) ( not ( = ?auto_616160 ?auto_616164 ) ) ( not ( = ?auto_616160 ?auto_616165 ) ) ( not ( = ?auto_616160 ?auto_616166 ) ) ( not ( = ?auto_616160 ?auto_616167 ) ) ( not ( = ?auto_616160 ?auto_616168 ) ) ( not ( = ?auto_616161 ?auto_616162 ) ) ( not ( = ?auto_616161 ?auto_616163 ) ) ( not ( = ?auto_616161 ?auto_616164 ) ) ( not ( = ?auto_616161 ?auto_616165 ) ) ( not ( = ?auto_616161 ?auto_616166 ) ) ( not ( = ?auto_616161 ?auto_616167 ) ) ( not ( = ?auto_616161 ?auto_616168 ) ) ( not ( = ?auto_616162 ?auto_616163 ) ) ( not ( = ?auto_616162 ?auto_616164 ) ) ( not ( = ?auto_616162 ?auto_616165 ) ) ( not ( = ?auto_616162 ?auto_616166 ) ) ( not ( = ?auto_616162 ?auto_616167 ) ) ( not ( = ?auto_616162 ?auto_616168 ) ) ( not ( = ?auto_616163 ?auto_616164 ) ) ( not ( = ?auto_616163 ?auto_616165 ) ) ( not ( = ?auto_616163 ?auto_616166 ) ) ( not ( = ?auto_616163 ?auto_616167 ) ) ( not ( = ?auto_616163 ?auto_616168 ) ) ( not ( = ?auto_616164 ?auto_616165 ) ) ( not ( = ?auto_616164 ?auto_616166 ) ) ( not ( = ?auto_616164 ?auto_616167 ) ) ( not ( = ?auto_616164 ?auto_616168 ) ) ( not ( = ?auto_616165 ?auto_616166 ) ) ( not ( = ?auto_616165 ?auto_616167 ) ) ( not ( = ?auto_616165 ?auto_616168 ) ) ( not ( = ?auto_616166 ?auto_616167 ) ) ( not ( = ?auto_616166 ?auto_616168 ) ) ( not ( = ?auto_616167 ?auto_616168 ) ) ( ON ?auto_616166 ?auto_616167 ) ( ON ?auto_616165 ?auto_616166 ) ( ON ?auto_616164 ?auto_616165 ) ( ON ?auto_616163 ?auto_616164 ) ( ON ?auto_616162 ?auto_616163 ) ( ON ?auto_616161 ?auto_616162 ) ( ON ?auto_616160 ?auto_616161 ) ( ON ?auto_616159 ?auto_616160 ) ( ON ?auto_616158 ?auto_616159 ) ( ON ?auto_616157 ?auto_616158 ) ( CLEAR ?auto_616155 ) ( ON ?auto_616156 ?auto_616157 ) ( CLEAR ?auto_616156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_616155 ?auto_616156 )
      ( MAKE-13PILE ?auto_616155 ?auto_616156 ?auto_616157 ?auto_616158 ?auto_616159 ?auto_616160 ?auto_616161 ?auto_616162 ?auto_616163 ?auto_616164 ?auto_616165 ?auto_616166 ?auto_616167 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_616209 - BLOCK
      ?auto_616210 - BLOCK
      ?auto_616211 - BLOCK
      ?auto_616212 - BLOCK
      ?auto_616213 - BLOCK
      ?auto_616214 - BLOCK
      ?auto_616215 - BLOCK
      ?auto_616216 - BLOCK
      ?auto_616217 - BLOCK
      ?auto_616218 - BLOCK
      ?auto_616219 - BLOCK
      ?auto_616220 - BLOCK
      ?auto_616221 - BLOCK
    )
    :vars
    (
      ?auto_616222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616221 ?auto_616222 ) ( not ( = ?auto_616209 ?auto_616210 ) ) ( not ( = ?auto_616209 ?auto_616211 ) ) ( not ( = ?auto_616209 ?auto_616212 ) ) ( not ( = ?auto_616209 ?auto_616213 ) ) ( not ( = ?auto_616209 ?auto_616214 ) ) ( not ( = ?auto_616209 ?auto_616215 ) ) ( not ( = ?auto_616209 ?auto_616216 ) ) ( not ( = ?auto_616209 ?auto_616217 ) ) ( not ( = ?auto_616209 ?auto_616218 ) ) ( not ( = ?auto_616209 ?auto_616219 ) ) ( not ( = ?auto_616209 ?auto_616220 ) ) ( not ( = ?auto_616209 ?auto_616221 ) ) ( not ( = ?auto_616209 ?auto_616222 ) ) ( not ( = ?auto_616210 ?auto_616211 ) ) ( not ( = ?auto_616210 ?auto_616212 ) ) ( not ( = ?auto_616210 ?auto_616213 ) ) ( not ( = ?auto_616210 ?auto_616214 ) ) ( not ( = ?auto_616210 ?auto_616215 ) ) ( not ( = ?auto_616210 ?auto_616216 ) ) ( not ( = ?auto_616210 ?auto_616217 ) ) ( not ( = ?auto_616210 ?auto_616218 ) ) ( not ( = ?auto_616210 ?auto_616219 ) ) ( not ( = ?auto_616210 ?auto_616220 ) ) ( not ( = ?auto_616210 ?auto_616221 ) ) ( not ( = ?auto_616210 ?auto_616222 ) ) ( not ( = ?auto_616211 ?auto_616212 ) ) ( not ( = ?auto_616211 ?auto_616213 ) ) ( not ( = ?auto_616211 ?auto_616214 ) ) ( not ( = ?auto_616211 ?auto_616215 ) ) ( not ( = ?auto_616211 ?auto_616216 ) ) ( not ( = ?auto_616211 ?auto_616217 ) ) ( not ( = ?auto_616211 ?auto_616218 ) ) ( not ( = ?auto_616211 ?auto_616219 ) ) ( not ( = ?auto_616211 ?auto_616220 ) ) ( not ( = ?auto_616211 ?auto_616221 ) ) ( not ( = ?auto_616211 ?auto_616222 ) ) ( not ( = ?auto_616212 ?auto_616213 ) ) ( not ( = ?auto_616212 ?auto_616214 ) ) ( not ( = ?auto_616212 ?auto_616215 ) ) ( not ( = ?auto_616212 ?auto_616216 ) ) ( not ( = ?auto_616212 ?auto_616217 ) ) ( not ( = ?auto_616212 ?auto_616218 ) ) ( not ( = ?auto_616212 ?auto_616219 ) ) ( not ( = ?auto_616212 ?auto_616220 ) ) ( not ( = ?auto_616212 ?auto_616221 ) ) ( not ( = ?auto_616212 ?auto_616222 ) ) ( not ( = ?auto_616213 ?auto_616214 ) ) ( not ( = ?auto_616213 ?auto_616215 ) ) ( not ( = ?auto_616213 ?auto_616216 ) ) ( not ( = ?auto_616213 ?auto_616217 ) ) ( not ( = ?auto_616213 ?auto_616218 ) ) ( not ( = ?auto_616213 ?auto_616219 ) ) ( not ( = ?auto_616213 ?auto_616220 ) ) ( not ( = ?auto_616213 ?auto_616221 ) ) ( not ( = ?auto_616213 ?auto_616222 ) ) ( not ( = ?auto_616214 ?auto_616215 ) ) ( not ( = ?auto_616214 ?auto_616216 ) ) ( not ( = ?auto_616214 ?auto_616217 ) ) ( not ( = ?auto_616214 ?auto_616218 ) ) ( not ( = ?auto_616214 ?auto_616219 ) ) ( not ( = ?auto_616214 ?auto_616220 ) ) ( not ( = ?auto_616214 ?auto_616221 ) ) ( not ( = ?auto_616214 ?auto_616222 ) ) ( not ( = ?auto_616215 ?auto_616216 ) ) ( not ( = ?auto_616215 ?auto_616217 ) ) ( not ( = ?auto_616215 ?auto_616218 ) ) ( not ( = ?auto_616215 ?auto_616219 ) ) ( not ( = ?auto_616215 ?auto_616220 ) ) ( not ( = ?auto_616215 ?auto_616221 ) ) ( not ( = ?auto_616215 ?auto_616222 ) ) ( not ( = ?auto_616216 ?auto_616217 ) ) ( not ( = ?auto_616216 ?auto_616218 ) ) ( not ( = ?auto_616216 ?auto_616219 ) ) ( not ( = ?auto_616216 ?auto_616220 ) ) ( not ( = ?auto_616216 ?auto_616221 ) ) ( not ( = ?auto_616216 ?auto_616222 ) ) ( not ( = ?auto_616217 ?auto_616218 ) ) ( not ( = ?auto_616217 ?auto_616219 ) ) ( not ( = ?auto_616217 ?auto_616220 ) ) ( not ( = ?auto_616217 ?auto_616221 ) ) ( not ( = ?auto_616217 ?auto_616222 ) ) ( not ( = ?auto_616218 ?auto_616219 ) ) ( not ( = ?auto_616218 ?auto_616220 ) ) ( not ( = ?auto_616218 ?auto_616221 ) ) ( not ( = ?auto_616218 ?auto_616222 ) ) ( not ( = ?auto_616219 ?auto_616220 ) ) ( not ( = ?auto_616219 ?auto_616221 ) ) ( not ( = ?auto_616219 ?auto_616222 ) ) ( not ( = ?auto_616220 ?auto_616221 ) ) ( not ( = ?auto_616220 ?auto_616222 ) ) ( not ( = ?auto_616221 ?auto_616222 ) ) ( ON ?auto_616220 ?auto_616221 ) ( ON ?auto_616219 ?auto_616220 ) ( ON ?auto_616218 ?auto_616219 ) ( ON ?auto_616217 ?auto_616218 ) ( ON ?auto_616216 ?auto_616217 ) ( ON ?auto_616215 ?auto_616216 ) ( ON ?auto_616214 ?auto_616215 ) ( ON ?auto_616213 ?auto_616214 ) ( ON ?auto_616212 ?auto_616213 ) ( ON ?auto_616211 ?auto_616212 ) ( ON ?auto_616210 ?auto_616211 ) ( ON ?auto_616209 ?auto_616210 ) ( CLEAR ?auto_616209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_616209 )
      ( MAKE-13PILE ?auto_616209 ?auto_616210 ?auto_616211 ?auto_616212 ?auto_616213 ?auto_616214 ?auto_616215 ?auto_616216 ?auto_616217 ?auto_616218 ?auto_616219 ?auto_616220 ?auto_616221 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616264 - BLOCK
      ?auto_616265 - BLOCK
      ?auto_616266 - BLOCK
      ?auto_616267 - BLOCK
      ?auto_616268 - BLOCK
      ?auto_616269 - BLOCK
      ?auto_616270 - BLOCK
      ?auto_616271 - BLOCK
      ?auto_616272 - BLOCK
      ?auto_616273 - BLOCK
      ?auto_616274 - BLOCK
      ?auto_616275 - BLOCK
      ?auto_616276 - BLOCK
      ?auto_616277 - BLOCK
    )
    :vars
    (
      ?auto_616278 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_616276 ) ( ON ?auto_616277 ?auto_616278 ) ( CLEAR ?auto_616277 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_616264 ) ( ON ?auto_616265 ?auto_616264 ) ( ON ?auto_616266 ?auto_616265 ) ( ON ?auto_616267 ?auto_616266 ) ( ON ?auto_616268 ?auto_616267 ) ( ON ?auto_616269 ?auto_616268 ) ( ON ?auto_616270 ?auto_616269 ) ( ON ?auto_616271 ?auto_616270 ) ( ON ?auto_616272 ?auto_616271 ) ( ON ?auto_616273 ?auto_616272 ) ( ON ?auto_616274 ?auto_616273 ) ( ON ?auto_616275 ?auto_616274 ) ( ON ?auto_616276 ?auto_616275 ) ( not ( = ?auto_616264 ?auto_616265 ) ) ( not ( = ?auto_616264 ?auto_616266 ) ) ( not ( = ?auto_616264 ?auto_616267 ) ) ( not ( = ?auto_616264 ?auto_616268 ) ) ( not ( = ?auto_616264 ?auto_616269 ) ) ( not ( = ?auto_616264 ?auto_616270 ) ) ( not ( = ?auto_616264 ?auto_616271 ) ) ( not ( = ?auto_616264 ?auto_616272 ) ) ( not ( = ?auto_616264 ?auto_616273 ) ) ( not ( = ?auto_616264 ?auto_616274 ) ) ( not ( = ?auto_616264 ?auto_616275 ) ) ( not ( = ?auto_616264 ?auto_616276 ) ) ( not ( = ?auto_616264 ?auto_616277 ) ) ( not ( = ?auto_616264 ?auto_616278 ) ) ( not ( = ?auto_616265 ?auto_616266 ) ) ( not ( = ?auto_616265 ?auto_616267 ) ) ( not ( = ?auto_616265 ?auto_616268 ) ) ( not ( = ?auto_616265 ?auto_616269 ) ) ( not ( = ?auto_616265 ?auto_616270 ) ) ( not ( = ?auto_616265 ?auto_616271 ) ) ( not ( = ?auto_616265 ?auto_616272 ) ) ( not ( = ?auto_616265 ?auto_616273 ) ) ( not ( = ?auto_616265 ?auto_616274 ) ) ( not ( = ?auto_616265 ?auto_616275 ) ) ( not ( = ?auto_616265 ?auto_616276 ) ) ( not ( = ?auto_616265 ?auto_616277 ) ) ( not ( = ?auto_616265 ?auto_616278 ) ) ( not ( = ?auto_616266 ?auto_616267 ) ) ( not ( = ?auto_616266 ?auto_616268 ) ) ( not ( = ?auto_616266 ?auto_616269 ) ) ( not ( = ?auto_616266 ?auto_616270 ) ) ( not ( = ?auto_616266 ?auto_616271 ) ) ( not ( = ?auto_616266 ?auto_616272 ) ) ( not ( = ?auto_616266 ?auto_616273 ) ) ( not ( = ?auto_616266 ?auto_616274 ) ) ( not ( = ?auto_616266 ?auto_616275 ) ) ( not ( = ?auto_616266 ?auto_616276 ) ) ( not ( = ?auto_616266 ?auto_616277 ) ) ( not ( = ?auto_616266 ?auto_616278 ) ) ( not ( = ?auto_616267 ?auto_616268 ) ) ( not ( = ?auto_616267 ?auto_616269 ) ) ( not ( = ?auto_616267 ?auto_616270 ) ) ( not ( = ?auto_616267 ?auto_616271 ) ) ( not ( = ?auto_616267 ?auto_616272 ) ) ( not ( = ?auto_616267 ?auto_616273 ) ) ( not ( = ?auto_616267 ?auto_616274 ) ) ( not ( = ?auto_616267 ?auto_616275 ) ) ( not ( = ?auto_616267 ?auto_616276 ) ) ( not ( = ?auto_616267 ?auto_616277 ) ) ( not ( = ?auto_616267 ?auto_616278 ) ) ( not ( = ?auto_616268 ?auto_616269 ) ) ( not ( = ?auto_616268 ?auto_616270 ) ) ( not ( = ?auto_616268 ?auto_616271 ) ) ( not ( = ?auto_616268 ?auto_616272 ) ) ( not ( = ?auto_616268 ?auto_616273 ) ) ( not ( = ?auto_616268 ?auto_616274 ) ) ( not ( = ?auto_616268 ?auto_616275 ) ) ( not ( = ?auto_616268 ?auto_616276 ) ) ( not ( = ?auto_616268 ?auto_616277 ) ) ( not ( = ?auto_616268 ?auto_616278 ) ) ( not ( = ?auto_616269 ?auto_616270 ) ) ( not ( = ?auto_616269 ?auto_616271 ) ) ( not ( = ?auto_616269 ?auto_616272 ) ) ( not ( = ?auto_616269 ?auto_616273 ) ) ( not ( = ?auto_616269 ?auto_616274 ) ) ( not ( = ?auto_616269 ?auto_616275 ) ) ( not ( = ?auto_616269 ?auto_616276 ) ) ( not ( = ?auto_616269 ?auto_616277 ) ) ( not ( = ?auto_616269 ?auto_616278 ) ) ( not ( = ?auto_616270 ?auto_616271 ) ) ( not ( = ?auto_616270 ?auto_616272 ) ) ( not ( = ?auto_616270 ?auto_616273 ) ) ( not ( = ?auto_616270 ?auto_616274 ) ) ( not ( = ?auto_616270 ?auto_616275 ) ) ( not ( = ?auto_616270 ?auto_616276 ) ) ( not ( = ?auto_616270 ?auto_616277 ) ) ( not ( = ?auto_616270 ?auto_616278 ) ) ( not ( = ?auto_616271 ?auto_616272 ) ) ( not ( = ?auto_616271 ?auto_616273 ) ) ( not ( = ?auto_616271 ?auto_616274 ) ) ( not ( = ?auto_616271 ?auto_616275 ) ) ( not ( = ?auto_616271 ?auto_616276 ) ) ( not ( = ?auto_616271 ?auto_616277 ) ) ( not ( = ?auto_616271 ?auto_616278 ) ) ( not ( = ?auto_616272 ?auto_616273 ) ) ( not ( = ?auto_616272 ?auto_616274 ) ) ( not ( = ?auto_616272 ?auto_616275 ) ) ( not ( = ?auto_616272 ?auto_616276 ) ) ( not ( = ?auto_616272 ?auto_616277 ) ) ( not ( = ?auto_616272 ?auto_616278 ) ) ( not ( = ?auto_616273 ?auto_616274 ) ) ( not ( = ?auto_616273 ?auto_616275 ) ) ( not ( = ?auto_616273 ?auto_616276 ) ) ( not ( = ?auto_616273 ?auto_616277 ) ) ( not ( = ?auto_616273 ?auto_616278 ) ) ( not ( = ?auto_616274 ?auto_616275 ) ) ( not ( = ?auto_616274 ?auto_616276 ) ) ( not ( = ?auto_616274 ?auto_616277 ) ) ( not ( = ?auto_616274 ?auto_616278 ) ) ( not ( = ?auto_616275 ?auto_616276 ) ) ( not ( = ?auto_616275 ?auto_616277 ) ) ( not ( = ?auto_616275 ?auto_616278 ) ) ( not ( = ?auto_616276 ?auto_616277 ) ) ( not ( = ?auto_616276 ?auto_616278 ) ) ( not ( = ?auto_616277 ?auto_616278 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_616277 ?auto_616278 )
      ( !STACK ?auto_616277 ?auto_616276 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616322 - BLOCK
      ?auto_616323 - BLOCK
      ?auto_616324 - BLOCK
      ?auto_616325 - BLOCK
      ?auto_616326 - BLOCK
      ?auto_616327 - BLOCK
      ?auto_616328 - BLOCK
      ?auto_616329 - BLOCK
      ?auto_616330 - BLOCK
      ?auto_616331 - BLOCK
      ?auto_616332 - BLOCK
      ?auto_616333 - BLOCK
      ?auto_616334 - BLOCK
      ?auto_616335 - BLOCK
    )
    :vars
    (
      ?auto_616336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616335 ?auto_616336 ) ( ON-TABLE ?auto_616322 ) ( ON ?auto_616323 ?auto_616322 ) ( ON ?auto_616324 ?auto_616323 ) ( ON ?auto_616325 ?auto_616324 ) ( ON ?auto_616326 ?auto_616325 ) ( ON ?auto_616327 ?auto_616326 ) ( ON ?auto_616328 ?auto_616327 ) ( ON ?auto_616329 ?auto_616328 ) ( ON ?auto_616330 ?auto_616329 ) ( ON ?auto_616331 ?auto_616330 ) ( ON ?auto_616332 ?auto_616331 ) ( ON ?auto_616333 ?auto_616332 ) ( not ( = ?auto_616322 ?auto_616323 ) ) ( not ( = ?auto_616322 ?auto_616324 ) ) ( not ( = ?auto_616322 ?auto_616325 ) ) ( not ( = ?auto_616322 ?auto_616326 ) ) ( not ( = ?auto_616322 ?auto_616327 ) ) ( not ( = ?auto_616322 ?auto_616328 ) ) ( not ( = ?auto_616322 ?auto_616329 ) ) ( not ( = ?auto_616322 ?auto_616330 ) ) ( not ( = ?auto_616322 ?auto_616331 ) ) ( not ( = ?auto_616322 ?auto_616332 ) ) ( not ( = ?auto_616322 ?auto_616333 ) ) ( not ( = ?auto_616322 ?auto_616334 ) ) ( not ( = ?auto_616322 ?auto_616335 ) ) ( not ( = ?auto_616322 ?auto_616336 ) ) ( not ( = ?auto_616323 ?auto_616324 ) ) ( not ( = ?auto_616323 ?auto_616325 ) ) ( not ( = ?auto_616323 ?auto_616326 ) ) ( not ( = ?auto_616323 ?auto_616327 ) ) ( not ( = ?auto_616323 ?auto_616328 ) ) ( not ( = ?auto_616323 ?auto_616329 ) ) ( not ( = ?auto_616323 ?auto_616330 ) ) ( not ( = ?auto_616323 ?auto_616331 ) ) ( not ( = ?auto_616323 ?auto_616332 ) ) ( not ( = ?auto_616323 ?auto_616333 ) ) ( not ( = ?auto_616323 ?auto_616334 ) ) ( not ( = ?auto_616323 ?auto_616335 ) ) ( not ( = ?auto_616323 ?auto_616336 ) ) ( not ( = ?auto_616324 ?auto_616325 ) ) ( not ( = ?auto_616324 ?auto_616326 ) ) ( not ( = ?auto_616324 ?auto_616327 ) ) ( not ( = ?auto_616324 ?auto_616328 ) ) ( not ( = ?auto_616324 ?auto_616329 ) ) ( not ( = ?auto_616324 ?auto_616330 ) ) ( not ( = ?auto_616324 ?auto_616331 ) ) ( not ( = ?auto_616324 ?auto_616332 ) ) ( not ( = ?auto_616324 ?auto_616333 ) ) ( not ( = ?auto_616324 ?auto_616334 ) ) ( not ( = ?auto_616324 ?auto_616335 ) ) ( not ( = ?auto_616324 ?auto_616336 ) ) ( not ( = ?auto_616325 ?auto_616326 ) ) ( not ( = ?auto_616325 ?auto_616327 ) ) ( not ( = ?auto_616325 ?auto_616328 ) ) ( not ( = ?auto_616325 ?auto_616329 ) ) ( not ( = ?auto_616325 ?auto_616330 ) ) ( not ( = ?auto_616325 ?auto_616331 ) ) ( not ( = ?auto_616325 ?auto_616332 ) ) ( not ( = ?auto_616325 ?auto_616333 ) ) ( not ( = ?auto_616325 ?auto_616334 ) ) ( not ( = ?auto_616325 ?auto_616335 ) ) ( not ( = ?auto_616325 ?auto_616336 ) ) ( not ( = ?auto_616326 ?auto_616327 ) ) ( not ( = ?auto_616326 ?auto_616328 ) ) ( not ( = ?auto_616326 ?auto_616329 ) ) ( not ( = ?auto_616326 ?auto_616330 ) ) ( not ( = ?auto_616326 ?auto_616331 ) ) ( not ( = ?auto_616326 ?auto_616332 ) ) ( not ( = ?auto_616326 ?auto_616333 ) ) ( not ( = ?auto_616326 ?auto_616334 ) ) ( not ( = ?auto_616326 ?auto_616335 ) ) ( not ( = ?auto_616326 ?auto_616336 ) ) ( not ( = ?auto_616327 ?auto_616328 ) ) ( not ( = ?auto_616327 ?auto_616329 ) ) ( not ( = ?auto_616327 ?auto_616330 ) ) ( not ( = ?auto_616327 ?auto_616331 ) ) ( not ( = ?auto_616327 ?auto_616332 ) ) ( not ( = ?auto_616327 ?auto_616333 ) ) ( not ( = ?auto_616327 ?auto_616334 ) ) ( not ( = ?auto_616327 ?auto_616335 ) ) ( not ( = ?auto_616327 ?auto_616336 ) ) ( not ( = ?auto_616328 ?auto_616329 ) ) ( not ( = ?auto_616328 ?auto_616330 ) ) ( not ( = ?auto_616328 ?auto_616331 ) ) ( not ( = ?auto_616328 ?auto_616332 ) ) ( not ( = ?auto_616328 ?auto_616333 ) ) ( not ( = ?auto_616328 ?auto_616334 ) ) ( not ( = ?auto_616328 ?auto_616335 ) ) ( not ( = ?auto_616328 ?auto_616336 ) ) ( not ( = ?auto_616329 ?auto_616330 ) ) ( not ( = ?auto_616329 ?auto_616331 ) ) ( not ( = ?auto_616329 ?auto_616332 ) ) ( not ( = ?auto_616329 ?auto_616333 ) ) ( not ( = ?auto_616329 ?auto_616334 ) ) ( not ( = ?auto_616329 ?auto_616335 ) ) ( not ( = ?auto_616329 ?auto_616336 ) ) ( not ( = ?auto_616330 ?auto_616331 ) ) ( not ( = ?auto_616330 ?auto_616332 ) ) ( not ( = ?auto_616330 ?auto_616333 ) ) ( not ( = ?auto_616330 ?auto_616334 ) ) ( not ( = ?auto_616330 ?auto_616335 ) ) ( not ( = ?auto_616330 ?auto_616336 ) ) ( not ( = ?auto_616331 ?auto_616332 ) ) ( not ( = ?auto_616331 ?auto_616333 ) ) ( not ( = ?auto_616331 ?auto_616334 ) ) ( not ( = ?auto_616331 ?auto_616335 ) ) ( not ( = ?auto_616331 ?auto_616336 ) ) ( not ( = ?auto_616332 ?auto_616333 ) ) ( not ( = ?auto_616332 ?auto_616334 ) ) ( not ( = ?auto_616332 ?auto_616335 ) ) ( not ( = ?auto_616332 ?auto_616336 ) ) ( not ( = ?auto_616333 ?auto_616334 ) ) ( not ( = ?auto_616333 ?auto_616335 ) ) ( not ( = ?auto_616333 ?auto_616336 ) ) ( not ( = ?auto_616334 ?auto_616335 ) ) ( not ( = ?auto_616334 ?auto_616336 ) ) ( not ( = ?auto_616335 ?auto_616336 ) ) ( CLEAR ?auto_616333 ) ( ON ?auto_616334 ?auto_616335 ) ( CLEAR ?auto_616334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_616322 ?auto_616323 ?auto_616324 ?auto_616325 ?auto_616326 ?auto_616327 ?auto_616328 ?auto_616329 ?auto_616330 ?auto_616331 ?auto_616332 ?auto_616333 ?auto_616334 )
      ( MAKE-14PILE ?auto_616322 ?auto_616323 ?auto_616324 ?auto_616325 ?auto_616326 ?auto_616327 ?auto_616328 ?auto_616329 ?auto_616330 ?auto_616331 ?auto_616332 ?auto_616333 ?auto_616334 ?auto_616335 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616380 - BLOCK
      ?auto_616381 - BLOCK
      ?auto_616382 - BLOCK
      ?auto_616383 - BLOCK
      ?auto_616384 - BLOCK
      ?auto_616385 - BLOCK
      ?auto_616386 - BLOCK
      ?auto_616387 - BLOCK
      ?auto_616388 - BLOCK
      ?auto_616389 - BLOCK
      ?auto_616390 - BLOCK
      ?auto_616391 - BLOCK
      ?auto_616392 - BLOCK
      ?auto_616393 - BLOCK
    )
    :vars
    (
      ?auto_616394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616393 ?auto_616394 ) ( ON-TABLE ?auto_616380 ) ( ON ?auto_616381 ?auto_616380 ) ( ON ?auto_616382 ?auto_616381 ) ( ON ?auto_616383 ?auto_616382 ) ( ON ?auto_616384 ?auto_616383 ) ( ON ?auto_616385 ?auto_616384 ) ( ON ?auto_616386 ?auto_616385 ) ( ON ?auto_616387 ?auto_616386 ) ( ON ?auto_616388 ?auto_616387 ) ( ON ?auto_616389 ?auto_616388 ) ( ON ?auto_616390 ?auto_616389 ) ( not ( = ?auto_616380 ?auto_616381 ) ) ( not ( = ?auto_616380 ?auto_616382 ) ) ( not ( = ?auto_616380 ?auto_616383 ) ) ( not ( = ?auto_616380 ?auto_616384 ) ) ( not ( = ?auto_616380 ?auto_616385 ) ) ( not ( = ?auto_616380 ?auto_616386 ) ) ( not ( = ?auto_616380 ?auto_616387 ) ) ( not ( = ?auto_616380 ?auto_616388 ) ) ( not ( = ?auto_616380 ?auto_616389 ) ) ( not ( = ?auto_616380 ?auto_616390 ) ) ( not ( = ?auto_616380 ?auto_616391 ) ) ( not ( = ?auto_616380 ?auto_616392 ) ) ( not ( = ?auto_616380 ?auto_616393 ) ) ( not ( = ?auto_616380 ?auto_616394 ) ) ( not ( = ?auto_616381 ?auto_616382 ) ) ( not ( = ?auto_616381 ?auto_616383 ) ) ( not ( = ?auto_616381 ?auto_616384 ) ) ( not ( = ?auto_616381 ?auto_616385 ) ) ( not ( = ?auto_616381 ?auto_616386 ) ) ( not ( = ?auto_616381 ?auto_616387 ) ) ( not ( = ?auto_616381 ?auto_616388 ) ) ( not ( = ?auto_616381 ?auto_616389 ) ) ( not ( = ?auto_616381 ?auto_616390 ) ) ( not ( = ?auto_616381 ?auto_616391 ) ) ( not ( = ?auto_616381 ?auto_616392 ) ) ( not ( = ?auto_616381 ?auto_616393 ) ) ( not ( = ?auto_616381 ?auto_616394 ) ) ( not ( = ?auto_616382 ?auto_616383 ) ) ( not ( = ?auto_616382 ?auto_616384 ) ) ( not ( = ?auto_616382 ?auto_616385 ) ) ( not ( = ?auto_616382 ?auto_616386 ) ) ( not ( = ?auto_616382 ?auto_616387 ) ) ( not ( = ?auto_616382 ?auto_616388 ) ) ( not ( = ?auto_616382 ?auto_616389 ) ) ( not ( = ?auto_616382 ?auto_616390 ) ) ( not ( = ?auto_616382 ?auto_616391 ) ) ( not ( = ?auto_616382 ?auto_616392 ) ) ( not ( = ?auto_616382 ?auto_616393 ) ) ( not ( = ?auto_616382 ?auto_616394 ) ) ( not ( = ?auto_616383 ?auto_616384 ) ) ( not ( = ?auto_616383 ?auto_616385 ) ) ( not ( = ?auto_616383 ?auto_616386 ) ) ( not ( = ?auto_616383 ?auto_616387 ) ) ( not ( = ?auto_616383 ?auto_616388 ) ) ( not ( = ?auto_616383 ?auto_616389 ) ) ( not ( = ?auto_616383 ?auto_616390 ) ) ( not ( = ?auto_616383 ?auto_616391 ) ) ( not ( = ?auto_616383 ?auto_616392 ) ) ( not ( = ?auto_616383 ?auto_616393 ) ) ( not ( = ?auto_616383 ?auto_616394 ) ) ( not ( = ?auto_616384 ?auto_616385 ) ) ( not ( = ?auto_616384 ?auto_616386 ) ) ( not ( = ?auto_616384 ?auto_616387 ) ) ( not ( = ?auto_616384 ?auto_616388 ) ) ( not ( = ?auto_616384 ?auto_616389 ) ) ( not ( = ?auto_616384 ?auto_616390 ) ) ( not ( = ?auto_616384 ?auto_616391 ) ) ( not ( = ?auto_616384 ?auto_616392 ) ) ( not ( = ?auto_616384 ?auto_616393 ) ) ( not ( = ?auto_616384 ?auto_616394 ) ) ( not ( = ?auto_616385 ?auto_616386 ) ) ( not ( = ?auto_616385 ?auto_616387 ) ) ( not ( = ?auto_616385 ?auto_616388 ) ) ( not ( = ?auto_616385 ?auto_616389 ) ) ( not ( = ?auto_616385 ?auto_616390 ) ) ( not ( = ?auto_616385 ?auto_616391 ) ) ( not ( = ?auto_616385 ?auto_616392 ) ) ( not ( = ?auto_616385 ?auto_616393 ) ) ( not ( = ?auto_616385 ?auto_616394 ) ) ( not ( = ?auto_616386 ?auto_616387 ) ) ( not ( = ?auto_616386 ?auto_616388 ) ) ( not ( = ?auto_616386 ?auto_616389 ) ) ( not ( = ?auto_616386 ?auto_616390 ) ) ( not ( = ?auto_616386 ?auto_616391 ) ) ( not ( = ?auto_616386 ?auto_616392 ) ) ( not ( = ?auto_616386 ?auto_616393 ) ) ( not ( = ?auto_616386 ?auto_616394 ) ) ( not ( = ?auto_616387 ?auto_616388 ) ) ( not ( = ?auto_616387 ?auto_616389 ) ) ( not ( = ?auto_616387 ?auto_616390 ) ) ( not ( = ?auto_616387 ?auto_616391 ) ) ( not ( = ?auto_616387 ?auto_616392 ) ) ( not ( = ?auto_616387 ?auto_616393 ) ) ( not ( = ?auto_616387 ?auto_616394 ) ) ( not ( = ?auto_616388 ?auto_616389 ) ) ( not ( = ?auto_616388 ?auto_616390 ) ) ( not ( = ?auto_616388 ?auto_616391 ) ) ( not ( = ?auto_616388 ?auto_616392 ) ) ( not ( = ?auto_616388 ?auto_616393 ) ) ( not ( = ?auto_616388 ?auto_616394 ) ) ( not ( = ?auto_616389 ?auto_616390 ) ) ( not ( = ?auto_616389 ?auto_616391 ) ) ( not ( = ?auto_616389 ?auto_616392 ) ) ( not ( = ?auto_616389 ?auto_616393 ) ) ( not ( = ?auto_616389 ?auto_616394 ) ) ( not ( = ?auto_616390 ?auto_616391 ) ) ( not ( = ?auto_616390 ?auto_616392 ) ) ( not ( = ?auto_616390 ?auto_616393 ) ) ( not ( = ?auto_616390 ?auto_616394 ) ) ( not ( = ?auto_616391 ?auto_616392 ) ) ( not ( = ?auto_616391 ?auto_616393 ) ) ( not ( = ?auto_616391 ?auto_616394 ) ) ( not ( = ?auto_616392 ?auto_616393 ) ) ( not ( = ?auto_616392 ?auto_616394 ) ) ( not ( = ?auto_616393 ?auto_616394 ) ) ( ON ?auto_616392 ?auto_616393 ) ( CLEAR ?auto_616390 ) ( ON ?auto_616391 ?auto_616392 ) ( CLEAR ?auto_616391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_616380 ?auto_616381 ?auto_616382 ?auto_616383 ?auto_616384 ?auto_616385 ?auto_616386 ?auto_616387 ?auto_616388 ?auto_616389 ?auto_616390 ?auto_616391 )
      ( MAKE-14PILE ?auto_616380 ?auto_616381 ?auto_616382 ?auto_616383 ?auto_616384 ?auto_616385 ?auto_616386 ?auto_616387 ?auto_616388 ?auto_616389 ?auto_616390 ?auto_616391 ?auto_616392 ?auto_616393 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616438 - BLOCK
      ?auto_616439 - BLOCK
      ?auto_616440 - BLOCK
      ?auto_616441 - BLOCK
      ?auto_616442 - BLOCK
      ?auto_616443 - BLOCK
      ?auto_616444 - BLOCK
      ?auto_616445 - BLOCK
      ?auto_616446 - BLOCK
      ?auto_616447 - BLOCK
      ?auto_616448 - BLOCK
      ?auto_616449 - BLOCK
      ?auto_616450 - BLOCK
      ?auto_616451 - BLOCK
    )
    :vars
    (
      ?auto_616452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616451 ?auto_616452 ) ( ON-TABLE ?auto_616438 ) ( ON ?auto_616439 ?auto_616438 ) ( ON ?auto_616440 ?auto_616439 ) ( ON ?auto_616441 ?auto_616440 ) ( ON ?auto_616442 ?auto_616441 ) ( ON ?auto_616443 ?auto_616442 ) ( ON ?auto_616444 ?auto_616443 ) ( ON ?auto_616445 ?auto_616444 ) ( ON ?auto_616446 ?auto_616445 ) ( ON ?auto_616447 ?auto_616446 ) ( not ( = ?auto_616438 ?auto_616439 ) ) ( not ( = ?auto_616438 ?auto_616440 ) ) ( not ( = ?auto_616438 ?auto_616441 ) ) ( not ( = ?auto_616438 ?auto_616442 ) ) ( not ( = ?auto_616438 ?auto_616443 ) ) ( not ( = ?auto_616438 ?auto_616444 ) ) ( not ( = ?auto_616438 ?auto_616445 ) ) ( not ( = ?auto_616438 ?auto_616446 ) ) ( not ( = ?auto_616438 ?auto_616447 ) ) ( not ( = ?auto_616438 ?auto_616448 ) ) ( not ( = ?auto_616438 ?auto_616449 ) ) ( not ( = ?auto_616438 ?auto_616450 ) ) ( not ( = ?auto_616438 ?auto_616451 ) ) ( not ( = ?auto_616438 ?auto_616452 ) ) ( not ( = ?auto_616439 ?auto_616440 ) ) ( not ( = ?auto_616439 ?auto_616441 ) ) ( not ( = ?auto_616439 ?auto_616442 ) ) ( not ( = ?auto_616439 ?auto_616443 ) ) ( not ( = ?auto_616439 ?auto_616444 ) ) ( not ( = ?auto_616439 ?auto_616445 ) ) ( not ( = ?auto_616439 ?auto_616446 ) ) ( not ( = ?auto_616439 ?auto_616447 ) ) ( not ( = ?auto_616439 ?auto_616448 ) ) ( not ( = ?auto_616439 ?auto_616449 ) ) ( not ( = ?auto_616439 ?auto_616450 ) ) ( not ( = ?auto_616439 ?auto_616451 ) ) ( not ( = ?auto_616439 ?auto_616452 ) ) ( not ( = ?auto_616440 ?auto_616441 ) ) ( not ( = ?auto_616440 ?auto_616442 ) ) ( not ( = ?auto_616440 ?auto_616443 ) ) ( not ( = ?auto_616440 ?auto_616444 ) ) ( not ( = ?auto_616440 ?auto_616445 ) ) ( not ( = ?auto_616440 ?auto_616446 ) ) ( not ( = ?auto_616440 ?auto_616447 ) ) ( not ( = ?auto_616440 ?auto_616448 ) ) ( not ( = ?auto_616440 ?auto_616449 ) ) ( not ( = ?auto_616440 ?auto_616450 ) ) ( not ( = ?auto_616440 ?auto_616451 ) ) ( not ( = ?auto_616440 ?auto_616452 ) ) ( not ( = ?auto_616441 ?auto_616442 ) ) ( not ( = ?auto_616441 ?auto_616443 ) ) ( not ( = ?auto_616441 ?auto_616444 ) ) ( not ( = ?auto_616441 ?auto_616445 ) ) ( not ( = ?auto_616441 ?auto_616446 ) ) ( not ( = ?auto_616441 ?auto_616447 ) ) ( not ( = ?auto_616441 ?auto_616448 ) ) ( not ( = ?auto_616441 ?auto_616449 ) ) ( not ( = ?auto_616441 ?auto_616450 ) ) ( not ( = ?auto_616441 ?auto_616451 ) ) ( not ( = ?auto_616441 ?auto_616452 ) ) ( not ( = ?auto_616442 ?auto_616443 ) ) ( not ( = ?auto_616442 ?auto_616444 ) ) ( not ( = ?auto_616442 ?auto_616445 ) ) ( not ( = ?auto_616442 ?auto_616446 ) ) ( not ( = ?auto_616442 ?auto_616447 ) ) ( not ( = ?auto_616442 ?auto_616448 ) ) ( not ( = ?auto_616442 ?auto_616449 ) ) ( not ( = ?auto_616442 ?auto_616450 ) ) ( not ( = ?auto_616442 ?auto_616451 ) ) ( not ( = ?auto_616442 ?auto_616452 ) ) ( not ( = ?auto_616443 ?auto_616444 ) ) ( not ( = ?auto_616443 ?auto_616445 ) ) ( not ( = ?auto_616443 ?auto_616446 ) ) ( not ( = ?auto_616443 ?auto_616447 ) ) ( not ( = ?auto_616443 ?auto_616448 ) ) ( not ( = ?auto_616443 ?auto_616449 ) ) ( not ( = ?auto_616443 ?auto_616450 ) ) ( not ( = ?auto_616443 ?auto_616451 ) ) ( not ( = ?auto_616443 ?auto_616452 ) ) ( not ( = ?auto_616444 ?auto_616445 ) ) ( not ( = ?auto_616444 ?auto_616446 ) ) ( not ( = ?auto_616444 ?auto_616447 ) ) ( not ( = ?auto_616444 ?auto_616448 ) ) ( not ( = ?auto_616444 ?auto_616449 ) ) ( not ( = ?auto_616444 ?auto_616450 ) ) ( not ( = ?auto_616444 ?auto_616451 ) ) ( not ( = ?auto_616444 ?auto_616452 ) ) ( not ( = ?auto_616445 ?auto_616446 ) ) ( not ( = ?auto_616445 ?auto_616447 ) ) ( not ( = ?auto_616445 ?auto_616448 ) ) ( not ( = ?auto_616445 ?auto_616449 ) ) ( not ( = ?auto_616445 ?auto_616450 ) ) ( not ( = ?auto_616445 ?auto_616451 ) ) ( not ( = ?auto_616445 ?auto_616452 ) ) ( not ( = ?auto_616446 ?auto_616447 ) ) ( not ( = ?auto_616446 ?auto_616448 ) ) ( not ( = ?auto_616446 ?auto_616449 ) ) ( not ( = ?auto_616446 ?auto_616450 ) ) ( not ( = ?auto_616446 ?auto_616451 ) ) ( not ( = ?auto_616446 ?auto_616452 ) ) ( not ( = ?auto_616447 ?auto_616448 ) ) ( not ( = ?auto_616447 ?auto_616449 ) ) ( not ( = ?auto_616447 ?auto_616450 ) ) ( not ( = ?auto_616447 ?auto_616451 ) ) ( not ( = ?auto_616447 ?auto_616452 ) ) ( not ( = ?auto_616448 ?auto_616449 ) ) ( not ( = ?auto_616448 ?auto_616450 ) ) ( not ( = ?auto_616448 ?auto_616451 ) ) ( not ( = ?auto_616448 ?auto_616452 ) ) ( not ( = ?auto_616449 ?auto_616450 ) ) ( not ( = ?auto_616449 ?auto_616451 ) ) ( not ( = ?auto_616449 ?auto_616452 ) ) ( not ( = ?auto_616450 ?auto_616451 ) ) ( not ( = ?auto_616450 ?auto_616452 ) ) ( not ( = ?auto_616451 ?auto_616452 ) ) ( ON ?auto_616450 ?auto_616451 ) ( ON ?auto_616449 ?auto_616450 ) ( CLEAR ?auto_616447 ) ( ON ?auto_616448 ?auto_616449 ) ( CLEAR ?auto_616448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_616438 ?auto_616439 ?auto_616440 ?auto_616441 ?auto_616442 ?auto_616443 ?auto_616444 ?auto_616445 ?auto_616446 ?auto_616447 ?auto_616448 )
      ( MAKE-14PILE ?auto_616438 ?auto_616439 ?auto_616440 ?auto_616441 ?auto_616442 ?auto_616443 ?auto_616444 ?auto_616445 ?auto_616446 ?auto_616447 ?auto_616448 ?auto_616449 ?auto_616450 ?auto_616451 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616496 - BLOCK
      ?auto_616497 - BLOCK
      ?auto_616498 - BLOCK
      ?auto_616499 - BLOCK
      ?auto_616500 - BLOCK
      ?auto_616501 - BLOCK
      ?auto_616502 - BLOCK
      ?auto_616503 - BLOCK
      ?auto_616504 - BLOCK
      ?auto_616505 - BLOCK
      ?auto_616506 - BLOCK
      ?auto_616507 - BLOCK
      ?auto_616508 - BLOCK
      ?auto_616509 - BLOCK
    )
    :vars
    (
      ?auto_616510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616509 ?auto_616510 ) ( ON-TABLE ?auto_616496 ) ( ON ?auto_616497 ?auto_616496 ) ( ON ?auto_616498 ?auto_616497 ) ( ON ?auto_616499 ?auto_616498 ) ( ON ?auto_616500 ?auto_616499 ) ( ON ?auto_616501 ?auto_616500 ) ( ON ?auto_616502 ?auto_616501 ) ( ON ?auto_616503 ?auto_616502 ) ( ON ?auto_616504 ?auto_616503 ) ( not ( = ?auto_616496 ?auto_616497 ) ) ( not ( = ?auto_616496 ?auto_616498 ) ) ( not ( = ?auto_616496 ?auto_616499 ) ) ( not ( = ?auto_616496 ?auto_616500 ) ) ( not ( = ?auto_616496 ?auto_616501 ) ) ( not ( = ?auto_616496 ?auto_616502 ) ) ( not ( = ?auto_616496 ?auto_616503 ) ) ( not ( = ?auto_616496 ?auto_616504 ) ) ( not ( = ?auto_616496 ?auto_616505 ) ) ( not ( = ?auto_616496 ?auto_616506 ) ) ( not ( = ?auto_616496 ?auto_616507 ) ) ( not ( = ?auto_616496 ?auto_616508 ) ) ( not ( = ?auto_616496 ?auto_616509 ) ) ( not ( = ?auto_616496 ?auto_616510 ) ) ( not ( = ?auto_616497 ?auto_616498 ) ) ( not ( = ?auto_616497 ?auto_616499 ) ) ( not ( = ?auto_616497 ?auto_616500 ) ) ( not ( = ?auto_616497 ?auto_616501 ) ) ( not ( = ?auto_616497 ?auto_616502 ) ) ( not ( = ?auto_616497 ?auto_616503 ) ) ( not ( = ?auto_616497 ?auto_616504 ) ) ( not ( = ?auto_616497 ?auto_616505 ) ) ( not ( = ?auto_616497 ?auto_616506 ) ) ( not ( = ?auto_616497 ?auto_616507 ) ) ( not ( = ?auto_616497 ?auto_616508 ) ) ( not ( = ?auto_616497 ?auto_616509 ) ) ( not ( = ?auto_616497 ?auto_616510 ) ) ( not ( = ?auto_616498 ?auto_616499 ) ) ( not ( = ?auto_616498 ?auto_616500 ) ) ( not ( = ?auto_616498 ?auto_616501 ) ) ( not ( = ?auto_616498 ?auto_616502 ) ) ( not ( = ?auto_616498 ?auto_616503 ) ) ( not ( = ?auto_616498 ?auto_616504 ) ) ( not ( = ?auto_616498 ?auto_616505 ) ) ( not ( = ?auto_616498 ?auto_616506 ) ) ( not ( = ?auto_616498 ?auto_616507 ) ) ( not ( = ?auto_616498 ?auto_616508 ) ) ( not ( = ?auto_616498 ?auto_616509 ) ) ( not ( = ?auto_616498 ?auto_616510 ) ) ( not ( = ?auto_616499 ?auto_616500 ) ) ( not ( = ?auto_616499 ?auto_616501 ) ) ( not ( = ?auto_616499 ?auto_616502 ) ) ( not ( = ?auto_616499 ?auto_616503 ) ) ( not ( = ?auto_616499 ?auto_616504 ) ) ( not ( = ?auto_616499 ?auto_616505 ) ) ( not ( = ?auto_616499 ?auto_616506 ) ) ( not ( = ?auto_616499 ?auto_616507 ) ) ( not ( = ?auto_616499 ?auto_616508 ) ) ( not ( = ?auto_616499 ?auto_616509 ) ) ( not ( = ?auto_616499 ?auto_616510 ) ) ( not ( = ?auto_616500 ?auto_616501 ) ) ( not ( = ?auto_616500 ?auto_616502 ) ) ( not ( = ?auto_616500 ?auto_616503 ) ) ( not ( = ?auto_616500 ?auto_616504 ) ) ( not ( = ?auto_616500 ?auto_616505 ) ) ( not ( = ?auto_616500 ?auto_616506 ) ) ( not ( = ?auto_616500 ?auto_616507 ) ) ( not ( = ?auto_616500 ?auto_616508 ) ) ( not ( = ?auto_616500 ?auto_616509 ) ) ( not ( = ?auto_616500 ?auto_616510 ) ) ( not ( = ?auto_616501 ?auto_616502 ) ) ( not ( = ?auto_616501 ?auto_616503 ) ) ( not ( = ?auto_616501 ?auto_616504 ) ) ( not ( = ?auto_616501 ?auto_616505 ) ) ( not ( = ?auto_616501 ?auto_616506 ) ) ( not ( = ?auto_616501 ?auto_616507 ) ) ( not ( = ?auto_616501 ?auto_616508 ) ) ( not ( = ?auto_616501 ?auto_616509 ) ) ( not ( = ?auto_616501 ?auto_616510 ) ) ( not ( = ?auto_616502 ?auto_616503 ) ) ( not ( = ?auto_616502 ?auto_616504 ) ) ( not ( = ?auto_616502 ?auto_616505 ) ) ( not ( = ?auto_616502 ?auto_616506 ) ) ( not ( = ?auto_616502 ?auto_616507 ) ) ( not ( = ?auto_616502 ?auto_616508 ) ) ( not ( = ?auto_616502 ?auto_616509 ) ) ( not ( = ?auto_616502 ?auto_616510 ) ) ( not ( = ?auto_616503 ?auto_616504 ) ) ( not ( = ?auto_616503 ?auto_616505 ) ) ( not ( = ?auto_616503 ?auto_616506 ) ) ( not ( = ?auto_616503 ?auto_616507 ) ) ( not ( = ?auto_616503 ?auto_616508 ) ) ( not ( = ?auto_616503 ?auto_616509 ) ) ( not ( = ?auto_616503 ?auto_616510 ) ) ( not ( = ?auto_616504 ?auto_616505 ) ) ( not ( = ?auto_616504 ?auto_616506 ) ) ( not ( = ?auto_616504 ?auto_616507 ) ) ( not ( = ?auto_616504 ?auto_616508 ) ) ( not ( = ?auto_616504 ?auto_616509 ) ) ( not ( = ?auto_616504 ?auto_616510 ) ) ( not ( = ?auto_616505 ?auto_616506 ) ) ( not ( = ?auto_616505 ?auto_616507 ) ) ( not ( = ?auto_616505 ?auto_616508 ) ) ( not ( = ?auto_616505 ?auto_616509 ) ) ( not ( = ?auto_616505 ?auto_616510 ) ) ( not ( = ?auto_616506 ?auto_616507 ) ) ( not ( = ?auto_616506 ?auto_616508 ) ) ( not ( = ?auto_616506 ?auto_616509 ) ) ( not ( = ?auto_616506 ?auto_616510 ) ) ( not ( = ?auto_616507 ?auto_616508 ) ) ( not ( = ?auto_616507 ?auto_616509 ) ) ( not ( = ?auto_616507 ?auto_616510 ) ) ( not ( = ?auto_616508 ?auto_616509 ) ) ( not ( = ?auto_616508 ?auto_616510 ) ) ( not ( = ?auto_616509 ?auto_616510 ) ) ( ON ?auto_616508 ?auto_616509 ) ( ON ?auto_616507 ?auto_616508 ) ( ON ?auto_616506 ?auto_616507 ) ( CLEAR ?auto_616504 ) ( ON ?auto_616505 ?auto_616506 ) ( CLEAR ?auto_616505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_616496 ?auto_616497 ?auto_616498 ?auto_616499 ?auto_616500 ?auto_616501 ?auto_616502 ?auto_616503 ?auto_616504 ?auto_616505 )
      ( MAKE-14PILE ?auto_616496 ?auto_616497 ?auto_616498 ?auto_616499 ?auto_616500 ?auto_616501 ?auto_616502 ?auto_616503 ?auto_616504 ?auto_616505 ?auto_616506 ?auto_616507 ?auto_616508 ?auto_616509 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616554 - BLOCK
      ?auto_616555 - BLOCK
      ?auto_616556 - BLOCK
      ?auto_616557 - BLOCK
      ?auto_616558 - BLOCK
      ?auto_616559 - BLOCK
      ?auto_616560 - BLOCK
      ?auto_616561 - BLOCK
      ?auto_616562 - BLOCK
      ?auto_616563 - BLOCK
      ?auto_616564 - BLOCK
      ?auto_616565 - BLOCK
      ?auto_616566 - BLOCK
      ?auto_616567 - BLOCK
    )
    :vars
    (
      ?auto_616568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616567 ?auto_616568 ) ( ON-TABLE ?auto_616554 ) ( ON ?auto_616555 ?auto_616554 ) ( ON ?auto_616556 ?auto_616555 ) ( ON ?auto_616557 ?auto_616556 ) ( ON ?auto_616558 ?auto_616557 ) ( ON ?auto_616559 ?auto_616558 ) ( ON ?auto_616560 ?auto_616559 ) ( ON ?auto_616561 ?auto_616560 ) ( not ( = ?auto_616554 ?auto_616555 ) ) ( not ( = ?auto_616554 ?auto_616556 ) ) ( not ( = ?auto_616554 ?auto_616557 ) ) ( not ( = ?auto_616554 ?auto_616558 ) ) ( not ( = ?auto_616554 ?auto_616559 ) ) ( not ( = ?auto_616554 ?auto_616560 ) ) ( not ( = ?auto_616554 ?auto_616561 ) ) ( not ( = ?auto_616554 ?auto_616562 ) ) ( not ( = ?auto_616554 ?auto_616563 ) ) ( not ( = ?auto_616554 ?auto_616564 ) ) ( not ( = ?auto_616554 ?auto_616565 ) ) ( not ( = ?auto_616554 ?auto_616566 ) ) ( not ( = ?auto_616554 ?auto_616567 ) ) ( not ( = ?auto_616554 ?auto_616568 ) ) ( not ( = ?auto_616555 ?auto_616556 ) ) ( not ( = ?auto_616555 ?auto_616557 ) ) ( not ( = ?auto_616555 ?auto_616558 ) ) ( not ( = ?auto_616555 ?auto_616559 ) ) ( not ( = ?auto_616555 ?auto_616560 ) ) ( not ( = ?auto_616555 ?auto_616561 ) ) ( not ( = ?auto_616555 ?auto_616562 ) ) ( not ( = ?auto_616555 ?auto_616563 ) ) ( not ( = ?auto_616555 ?auto_616564 ) ) ( not ( = ?auto_616555 ?auto_616565 ) ) ( not ( = ?auto_616555 ?auto_616566 ) ) ( not ( = ?auto_616555 ?auto_616567 ) ) ( not ( = ?auto_616555 ?auto_616568 ) ) ( not ( = ?auto_616556 ?auto_616557 ) ) ( not ( = ?auto_616556 ?auto_616558 ) ) ( not ( = ?auto_616556 ?auto_616559 ) ) ( not ( = ?auto_616556 ?auto_616560 ) ) ( not ( = ?auto_616556 ?auto_616561 ) ) ( not ( = ?auto_616556 ?auto_616562 ) ) ( not ( = ?auto_616556 ?auto_616563 ) ) ( not ( = ?auto_616556 ?auto_616564 ) ) ( not ( = ?auto_616556 ?auto_616565 ) ) ( not ( = ?auto_616556 ?auto_616566 ) ) ( not ( = ?auto_616556 ?auto_616567 ) ) ( not ( = ?auto_616556 ?auto_616568 ) ) ( not ( = ?auto_616557 ?auto_616558 ) ) ( not ( = ?auto_616557 ?auto_616559 ) ) ( not ( = ?auto_616557 ?auto_616560 ) ) ( not ( = ?auto_616557 ?auto_616561 ) ) ( not ( = ?auto_616557 ?auto_616562 ) ) ( not ( = ?auto_616557 ?auto_616563 ) ) ( not ( = ?auto_616557 ?auto_616564 ) ) ( not ( = ?auto_616557 ?auto_616565 ) ) ( not ( = ?auto_616557 ?auto_616566 ) ) ( not ( = ?auto_616557 ?auto_616567 ) ) ( not ( = ?auto_616557 ?auto_616568 ) ) ( not ( = ?auto_616558 ?auto_616559 ) ) ( not ( = ?auto_616558 ?auto_616560 ) ) ( not ( = ?auto_616558 ?auto_616561 ) ) ( not ( = ?auto_616558 ?auto_616562 ) ) ( not ( = ?auto_616558 ?auto_616563 ) ) ( not ( = ?auto_616558 ?auto_616564 ) ) ( not ( = ?auto_616558 ?auto_616565 ) ) ( not ( = ?auto_616558 ?auto_616566 ) ) ( not ( = ?auto_616558 ?auto_616567 ) ) ( not ( = ?auto_616558 ?auto_616568 ) ) ( not ( = ?auto_616559 ?auto_616560 ) ) ( not ( = ?auto_616559 ?auto_616561 ) ) ( not ( = ?auto_616559 ?auto_616562 ) ) ( not ( = ?auto_616559 ?auto_616563 ) ) ( not ( = ?auto_616559 ?auto_616564 ) ) ( not ( = ?auto_616559 ?auto_616565 ) ) ( not ( = ?auto_616559 ?auto_616566 ) ) ( not ( = ?auto_616559 ?auto_616567 ) ) ( not ( = ?auto_616559 ?auto_616568 ) ) ( not ( = ?auto_616560 ?auto_616561 ) ) ( not ( = ?auto_616560 ?auto_616562 ) ) ( not ( = ?auto_616560 ?auto_616563 ) ) ( not ( = ?auto_616560 ?auto_616564 ) ) ( not ( = ?auto_616560 ?auto_616565 ) ) ( not ( = ?auto_616560 ?auto_616566 ) ) ( not ( = ?auto_616560 ?auto_616567 ) ) ( not ( = ?auto_616560 ?auto_616568 ) ) ( not ( = ?auto_616561 ?auto_616562 ) ) ( not ( = ?auto_616561 ?auto_616563 ) ) ( not ( = ?auto_616561 ?auto_616564 ) ) ( not ( = ?auto_616561 ?auto_616565 ) ) ( not ( = ?auto_616561 ?auto_616566 ) ) ( not ( = ?auto_616561 ?auto_616567 ) ) ( not ( = ?auto_616561 ?auto_616568 ) ) ( not ( = ?auto_616562 ?auto_616563 ) ) ( not ( = ?auto_616562 ?auto_616564 ) ) ( not ( = ?auto_616562 ?auto_616565 ) ) ( not ( = ?auto_616562 ?auto_616566 ) ) ( not ( = ?auto_616562 ?auto_616567 ) ) ( not ( = ?auto_616562 ?auto_616568 ) ) ( not ( = ?auto_616563 ?auto_616564 ) ) ( not ( = ?auto_616563 ?auto_616565 ) ) ( not ( = ?auto_616563 ?auto_616566 ) ) ( not ( = ?auto_616563 ?auto_616567 ) ) ( not ( = ?auto_616563 ?auto_616568 ) ) ( not ( = ?auto_616564 ?auto_616565 ) ) ( not ( = ?auto_616564 ?auto_616566 ) ) ( not ( = ?auto_616564 ?auto_616567 ) ) ( not ( = ?auto_616564 ?auto_616568 ) ) ( not ( = ?auto_616565 ?auto_616566 ) ) ( not ( = ?auto_616565 ?auto_616567 ) ) ( not ( = ?auto_616565 ?auto_616568 ) ) ( not ( = ?auto_616566 ?auto_616567 ) ) ( not ( = ?auto_616566 ?auto_616568 ) ) ( not ( = ?auto_616567 ?auto_616568 ) ) ( ON ?auto_616566 ?auto_616567 ) ( ON ?auto_616565 ?auto_616566 ) ( ON ?auto_616564 ?auto_616565 ) ( ON ?auto_616563 ?auto_616564 ) ( CLEAR ?auto_616561 ) ( ON ?auto_616562 ?auto_616563 ) ( CLEAR ?auto_616562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_616554 ?auto_616555 ?auto_616556 ?auto_616557 ?auto_616558 ?auto_616559 ?auto_616560 ?auto_616561 ?auto_616562 )
      ( MAKE-14PILE ?auto_616554 ?auto_616555 ?auto_616556 ?auto_616557 ?auto_616558 ?auto_616559 ?auto_616560 ?auto_616561 ?auto_616562 ?auto_616563 ?auto_616564 ?auto_616565 ?auto_616566 ?auto_616567 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616612 - BLOCK
      ?auto_616613 - BLOCK
      ?auto_616614 - BLOCK
      ?auto_616615 - BLOCK
      ?auto_616616 - BLOCK
      ?auto_616617 - BLOCK
      ?auto_616618 - BLOCK
      ?auto_616619 - BLOCK
      ?auto_616620 - BLOCK
      ?auto_616621 - BLOCK
      ?auto_616622 - BLOCK
      ?auto_616623 - BLOCK
      ?auto_616624 - BLOCK
      ?auto_616625 - BLOCK
    )
    :vars
    (
      ?auto_616626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616625 ?auto_616626 ) ( ON-TABLE ?auto_616612 ) ( ON ?auto_616613 ?auto_616612 ) ( ON ?auto_616614 ?auto_616613 ) ( ON ?auto_616615 ?auto_616614 ) ( ON ?auto_616616 ?auto_616615 ) ( ON ?auto_616617 ?auto_616616 ) ( ON ?auto_616618 ?auto_616617 ) ( not ( = ?auto_616612 ?auto_616613 ) ) ( not ( = ?auto_616612 ?auto_616614 ) ) ( not ( = ?auto_616612 ?auto_616615 ) ) ( not ( = ?auto_616612 ?auto_616616 ) ) ( not ( = ?auto_616612 ?auto_616617 ) ) ( not ( = ?auto_616612 ?auto_616618 ) ) ( not ( = ?auto_616612 ?auto_616619 ) ) ( not ( = ?auto_616612 ?auto_616620 ) ) ( not ( = ?auto_616612 ?auto_616621 ) ) ( not ( = ?auto_616612 ?auto_616622 ) ) ( not ( = ?auto_616612 ?auto_616623 ) ) ( not ( = ?auto_616612 ?auto_616624 ) ) ( not ( = ?auto_616612 ?auto_616625 ) ) ( not ( = ?auto_616612 ?auto_616626 ) ) ( not ( = ?auto_616613 ?auto_616614 ) ) ( not ( = ?auto_616613 ?auto_616615 ) ) ( not ( = ?auto_616613 ?auto_616616 ) ) ( not ( = ?auto_616613 ?auto_616617 ) ) ( not ( = ?auto_616613 ?auto_616618 ) ) ( not ( = ?auto_616613 ?auto_616619 ) ) ( not ( = ?auto_616613 ?auto_616620 ) ) ( not ( = ?auto_616613 ?auto_616621 ) ) ( not ( = ?auto_616613 ?auto_616622 ) ) ( not ( = ?auto_616613 ?auto_616623 ) ) ( not ( = ?auto_616613 ?auto_616624 ) ) ( not ( = ?auto_616613 ?auto_616625 ) ) ( not ( = ?auto_616613 ?auto_616626 ) ) ( not ( = ?auto_616614 ?auto_616615 ) ) ( not ( = ?auto_616614 ?auto_616616 ) ) ( not ( = ?auto_616614 ?auto_616617 ) ) ( not ( = ?auto_616614 ?auto_616618 ) ) ( not ( = ?auto_616614 ?auto_616619 ) ) ( not ( = ?auto_616614 ?auto_616620 ) ) ( not ( = ?auto_616614 ?auto_616621 ) ) ( not ( = ?auto_616614 ?auto_616622 ) ) ( not ( = ?auto_616614 ?auto_616623 ) ) ( not ( = ?auto_616614 ?auto_616624 ) ) ( not ( = ?auto_616614 ?auto_616625 ) ) ( not ( = ?auto_616614 ?auto_616626 ) ) ( not ( = ?auto_616615 ?auto_616616 ) ) ( not ( = ?auto_616615 ?auto_616617 ) ) ( not ( = ?auto_616615 ?auto_616618 ) ) ( not ( = ?auto_616615 ?auto_616619 ) ) ( not ( = ?auto_616615 ?auto_616620 ) ) ( not ( = ?auto_616615 ?auto_616621 ) ) ( not ( = ?auto_616615 ?auto_616622 ) ) ( not ( = ?auto_616615 ?auto_616623 ) ) ( not ( = ?auto_616615 ?auto_616624 ) ) ( not ( = ?auto_616615 ?auto_616625 ) ) ( not ( = ?auto_616615 ?auto_616626 ) ) ( not ( = ?auto_616616 ?auto_616617 ) ) ( not ( = ?auto_616616 ?auto_616618 ) ) ( not ( = ?auto_616616 ?auto_616619 ) ) ( not ( = ?auto_616616 ?auto_616620 ) ) ( not ( = ?auto_616616 ?auto_616621 ) ) ( not ( = ?auto_616616 ?auto_616622 ) ) ( not ( = ?auto_616616 ?auto_616623 ) ) ( not ( = ?auto_616616 ?auto_616624 ) ) ( not ( = ?auto_616616 ?auto_616625 ) ) ( not ( = ?auto_616616 ?auto_616626 ) ) ( not ( = ?auto_616617 ?auto_616618 ) ) ( not ( = ?auto_616617 ?auto_616619 ) ) ( not ( = ?auto_616617 ?auto_616620 ) ) ( not ( = ?auto_616617 ?auto_616621 ) ) ( not ( = ?auto_616617 ?auto_616622 ) ) ( not ( = ?auto_616617 ?auto_616623 ) ) ( not ( = ?auto_616617 ?auto_616624 ) ) ( not ( = ?auto_616617 ?auto_616625 ) ) ( not ( = ?auto_616617 ?auto_616626 ) ) ( not ( = ?auto_616618 ?auto_616619 ) ) ( not ( = ?auto_616618 ?auto_616620 ) ) ( not ( = ?auto_616618 ?auto_616621 ) ) ( not ( = ?auto_616618 ?auto_616622 ) ) ( not ( = ?auto_616618 ?auto_616623 ) ) ( not ( = ?auto_616618 ?auto_616624 ) ) ( not ( = ?auto_616618 ?auto_616625 ) ) ( not ( = ?auto_616618 ?auto_616626 ) ) ( not ( = ?auto_616619 ?auto_616620 ) ) ( not ( = ?auto_616619 ?auto_616621 ) ) ( not ( = ?auto_616619 ?auto_616622 ) ) ( not ( = ?auto_616619 ?auto_616623 ) ) ( not ( = ?auto_616619 ?auto_616624 ) ) ( not ( = ?auto_616619 ?auto_616625 ) ) ( not ( = ?auto_616619 ?auto_616626 ) ) ( not ( = ?auto_616620 ?auto_616621 ) ) ( not ( = ?auto_616620 ?auto_616622 ) ) ( not ( = ?auto_616620 ?auto_616623 ) ) ( not ( = ?auto_616620 ?auto_616624 ) ) ( not ( = ?auto_616620 ?auto_616625 ) ) ( not ( = ?auto_616620 ?auto_616626 ) ) ( not ( = ?auto_616621 ?auto_616622 ) ) ( not ( = ?auto_616621 ?auto_616623 ) ) ( not ( = ?auto_616621 ?auto_616624 ) ) ( not ( = ?auto_616621 ?auto_616625 ) ) ( not ( = ?auto_616621 ?auto_616626 ) ) ( not ( = ?auto_616622 ?auto_616623 ) ) ( not ( = ?auto_616622 ?auto_616624 ) ) ( not ( = ?auto_616622 ?auto_616625 ) ) ( not ( = ?auto_616622 ?auto_616626 ) ) ( not ( = ?auto_616623 ?auto_616624 ) ) ( not ( = ?auto_616623 ?auto_616625 ) ) ( not ( = ?auto_616623 ?auto_616626 ) ) ( not ( = ?auto_616624 ?auto_616625 ) ) ( not ( = ?auto_616624 ?auto_616626 ) ) ( not ( = ?auto_616625 ?auto_616626 ) ) ( ON ?auto_616624 ?auto_616625 ) ( ON ?auto_616623 ?auto_616624 ) ( ON ?auto_616622 ?auto_616623 ) ( ON ?auto_616621 ?auto_616622 ) ( ON ?auto_616620 ?auto_616621 ) ( CLEAR ?auto_616618 ) ( ON ?auto_616619 ?auto_616620 ) ( CLEAR ?auto_616619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_616612 ?auto_616613 ?auto_616614 ?auto_616615 ?auto_616616 ?auto_616617 ?auto_616618 ?auto_616619 )
      ( MAKE-14PILE ?auto_616612 ?auto_616613 ?auto_616614 ?auto_616615 ?auto_616616 ?auto_616617 ?auto_616618 ?auto_616619 ?auto_616620 ?auto_616621 ?auto_616622 ?auto_616623 ?auto_616624 ?auto_616625 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616670 - BLOCK
      ?auto_616671 - BLOCK
      ?auto_616672 - BLOCK
      ?auto_616673 - BLOCK
      ?auto_616674 - BLOCK
      ?auto_616675 - BLOCK
      ?auto_616676 - BLOCK
      ?auto_616677 - BLOCK
      ?auto_616678 - BLOCK
      ?auto_616679 - BLOCK
      ?auto_616680 - BLOCK
      ?auto_616681 - BLOCK
      ?auto_616682 - BLOCK
      ?auto_616683 - BLOCK
    )
    :vars
    (
      ?auto_616684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616683 ?auto_616684 ) ( ON-TABLE ?auto_616670 ) ( ON ?auto_616671 ?auto_616670 ) ( ON ?auto_616672 ?auto_616671 ) ( ON ?auto_616673 ?auto_616672 ) ( ON ?auto_616674 ?auto_616673 ) ( ON ?auto_616675 ?auto_616674 ) ( not ( = ?auto_616670 ?auto_616671 ) ) ( not ( = ?auto_616670 ?auto_616672 ) ) ( not ( = ?auto_616670 ?auto_616673 ) ) ( not ( = ?auto_616670 ?auto_616674 ) ) ( not ( = ?auto_616670 ?auto_616675 ) ) ( not ( = ?auto_616670 ?auto_616676 ) ) ( not ( = ?auto_616670 ?auto_616677 ) ) ( not ( = ?auto_616670 ?auto_616678 ) ) ( not ( = ?auto_616670 ?auto_616679 ) ) ( not ( = ?auto_616670 ?auto_616680 ) ) ( not ( = ?auto_616670 ?auto_616681 ) ) ( not ( = ?auto_616670 ?auto_616682 ) ) ( not ( = ?auto_616670 ?auto_616683 ) ) ( not ( = ?auto_616670 ?auto_616684 ) ) ( not ( = ?auto_616671 ?auto_616672 ) ) ( not ( = ?auto_616671 ?auto_616673 ) ) ( not ( = ?auto_616671 ?auto_616674 ) ) ( not ( = ?auto_616671 ?auto_616675 ) ) ( not ( = ?auto_616671 ?auto_616676 ) ) ( not ( = ?auto_616671 ?auto_616677 ) ) ( not ( = ?auto_616671 ?auto_616678 ) ) ( not ( = ?auto_616671 ?auto_616679 ) ) ( not ( = ?auto_616671 ?auto_616680 ) ) ( not ( = ?auto_616671 ?auto_616681 ) ) ( not ( = ?auto_616671 ?auto_616682 ) ) ( not ( = ?auto_616671 ?auto_616683 ) ) ( not ( = ?auto_616671 ?auto_616684 ) ) ( not ( = ?auto_616672 ?auto_616673 ) ) ( not ( = ?auto_616672 ?auto_616674 ) ) ( not ( = ?auto_616672 ?auto_616675 ) ) ( not ( = ?auto_616672 ?auto_616676 ) ) ( not ( = ?auto_616672 ?auto_616677 ) ) ( not ( = ?auto_616672 ?auto_616678 ) ) ( not ( = ?auto_616672 ?auto_616679 ) ) ( not ( = ?auto_616672 ?auto_616680 ) ) ( not ( = ?auto_616672 ?auto_616681 ) ) ( not ( = ?auto_616672 ?auto_616682 ) ) ( not ( = ?auto_616672 ?auto_616683 ) ) ( not ( = ?auto_616672 ?auto_616684 ) ) ( not ( = ?auto_616673 ?auto_616674 ) ) ( not ( = ?auto_616673 ?auto_616675 ) ) ( not ( = ?auto_616673 ?auto_616676 ) ) ( not ( = ?auto_616673 ?auto_616677 ) ) ( not ( = ?auto_616673 ?auto_616678 ) ) ( not ( = ?auto_616673 ?auto_616679 ) ) ( not ( = ?auto_616673 ?auto_616680 ) ) ( not ( = ?auto_616673 ?auto_616681 ) ) ( not ( = ?auto_616673 ?auto_616682 ) ) ( not ( = ?auto_616673 ?auto_616683 ) ) ( not ( = ?auto_616673 ?auto_616684 ) ) ( not ( = ?auto_616674 ?auto_616675 ) ) ( not ( = ?auto_616674 ?auto_616676 ) ) ( not ( = ?auto_616674 ?auto_616677 ) ) ( not ( = ?auto_616674 ?auto_616678 ) ) ( not ( = ?auto_616674 ?auto_616679 ) ) ( not ( = ?auto_616674 ?auto_616680 ) ) ( not ( = ?auto_616674 ?auto_616681 ) ) ( not ( = ?auto_616674 ?auto_616682 ) ) ( not ( = ?auto_616674 ?auto_616683 ) ) ( not ( = ?auto_616674 ?auto_616684 ) ) ( not ( = ?auto_616675 ?auto_616676 ) ) ( not ( = ?auto_616675 ?auto_616677 ) ) ( not ( = ?auto_616675 ?auto_616678 ) ) ( not ( = ?auto_616675 ?auto_616679 ) ) ( not ( = ?auto_616675 ?auto_616680 ) ) ( not ( = ?auto_616675 ?auto_616681 ) ) ( not ( = ?auto_616675 ?auto_616682 ) ) ( not ( = ?auto_616675 ?auto_616683 ) ) ( not ( = ?auto_616675 ?auto_616684 ) ) ( not ( = ?auto_616676 ?auto_616677 ) ) ( not ( = ?auto_616676 ?auto_616678 ) ) ( not ( = ?auto_616676 ?auto_616679 ) ) ( not ( = ?auto_616676 ?auto_616680 ) ) ( not ( = ?auto_616676 ?auto_616681 ) ) ( not ( = ?auto_616676 ?auto_616682 ) ) ( not ( = ?auto_616676 ?auto_616683 ) ) ( not ( = ?auto_616676 ?auto_616684 ) ) ( not ( = ?auto_616677 ?auto_616678 ) ) ( not ( = ?auto_616677 ?auto_616679 ) ) ( not ( = ?auto_616677 ?auto_616680 ) ) ( not ( = ?auto_616677 ?auto_616681 ) ) ( not ( = ?auto_616677 ?auto_616682 ) ) ( not ( = ?auto_616677 ?auto_616683 ) ) ( not ( = ?auto_616677 ?auto_616684 ) ) ( not ( = ?auto_616678 ?auto_616679 ) ) ( not ( = ?auto_616678 ?auto_616680 ) ) ( not ( = ?auto_616678 ?auto_616681 ) ) ( not ( = ?auto_616678 ?auto_616682 ) ) ( not ( = ?auto_616678 ?auto_616683 ) ) ( not ( = ?auto_616678 ?auto_616684 ) ) ( not ( = ?auto_616679 ?auto_616680 ) ) ( not ( = ?auto_616679 ?auto_616681 ) ) ( not ( = ?auto_616679 ?auto_616682 ) ) ( not ( = ?auto_616679 ?auto_616683 ) ) ( not ( = ?auto_616679 ?auto_616684 ) ) ( not ( = ?auto_616680 ?auto_616681 ) ) ( not ( = ?auto_616680 ?auto_616682 ) ) ( not ( = ?auto_616680 ?auto_616683 ) ) ( not ( = ?auto_616680 ?auto_616684 ) ) ( not ( = ?auto_616681 ?auto_616682 ) ) ( not ( = ?auto_616681 ?auto_616683 ) ) ( not ( = ?auto_616681 ?auto_616684 ) ) ( not ( = ?auto_616682 ?auto_616683 ) ) ( not ( = ?auto_616682 ?auto_616684 ) ) ( not ( = ?auto_616683 ?auto_616684 ) ) ( ON ?auto_616682 ?auto_616683 ) ( ON ?auto_616681 ?auto_616682 ) ( ON ?auto_616680 ?auto_616681 ) ( ON ?auto_616679 ?auto_616680 ) ( ON ?auto_616678 ?auto_616679 ) ( ON ?auto_616677 ?auto_616678 ) ( CLEAR ?auto_616675 ) ( ON ?auto_616676 ?auto_616677 ) ( CLEAR ?auto_616676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_616670 ?auto_616671 ?auto_616672 ?auto_616673 ?auto_616674 ?auto_616675 ?auto_616676 )
      ( MAKE-14PILE ?auto_616670 ?auto_616671 ?auto_616672 ?auto_616673 ?auto_616674 ?auto_616675 ?auto_616676 ?auto_616677 ?auto_616678 ?auto_616679 ?auto_616680 ?auto_616681 ?auto_616682 ?auto_616683 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616728 - BLOCK
      ?auto_616729 - BLOCK
      ?auto_616730 - BLOCK
      ?auto_616731 - BLOCK
      ?auto_616732 - BLOCK
      ?auto_616733 - BLOCK
      ?auto_616734 - BLOCK
      ?auto_616735 - BLOCK
      ?auto_616736 - BLOCK
      ?auto_616737 - BLOCK
      ?auto_616738 - BLOCK
      ?auto_616739 - BLOCK
      ?auto_616740 - BLOCK
      ?auto_616741 - BLOCK
    )
    :vars
    (
      ?auto_616742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616741 ?auto_616742 ) ( ON-TABLE ?auto_616728 ) ( ON ?auto_616729 ?auto_616728 ) ( ON ?auto_616730 ?auto_616729 ) ( ON ?auto_616731 ?auto_616730 ) ( ON ?auto_616732 ?auto_616731 ) ( not ( = ?auto_616728 ?auto_616729 ) ) ( not ( = ?auto_616728 ?auto_616730 ) ) ( not ( = ?auto_616728 ?auto_616731 ) ) ( not ( = ?auto_616728 ?auto_616732 ) ) ( not ( = ?auto_616728 ?auto_616733 ) ) ( not ( = ?auto_616728 ?auto_616734 ) ) ( not ( = ?auto_616728 ?auto_616735 ) ) ( not ( = ?auto_616728 ?auto_616736 ) ) ( not ( = ?auto_616728 ?auto_616737 ) ) ( not ( = ?auto_616728 ?auto_616738 ) ) ( not ( = ?auto_616728 ?auto_616739 ) ) ( not ( = ?auto_616728 ?auto_616740 ) ) ( not ( = ?auto_616728 ?auto_616741 ) ) ( not ( = ?auto_616728 ?auto_616742 ) ) ( not ( = ?auto_616729 ?auto_616730 ) ) ( not ( = ?auto_616729 ?auto_616731 ) ) ( not ( = ?auto_616729 ?auto_616732 ) ) ( not ( = ?auto_616729 ?auto_616733 ) ) ( not ( = ?auto_616729 ?auto_616734 ) ) ( not ( = ?auto_616729 ?auto_616735 ) ) ( not ( = ?auto_616729 ?auto_616736 ) ) ( not ( = ?auto_616729 ?auto_616737 ) ) ( not ( = ?auto_616729 ?auto_616738 ) ) ( not ( = ?auto_616729 ?auto_616739 ) ) ( not ( = ?auto_616729 ?auto_616740 ) ) ( not ( = ?auto_616729 ?auto_616741 ) ) ( not ( = ?auto_616729 ?auto_616742 ) ) ( not ( = ?auto_616730 ?auto_616731 ) ) ( not ( = ?auto_616730 ?auto_616732 ) ) ( not ( = ?auto_616730 ?auto_616733 ) ) ( not ( = ?auto_616730 ?auto_616734 ) ) ( not ( = ?auto_616730 ?auto_616735 ) ) ( not ( = ?auto_616730 ?auto_616736 ) ) ( not ( = ?auto_616730 ?auto_616737 ) ) ( not ( = ?auto_616730 ?auto_616738 ) ) ( not ( = ?auto_616730 ?auto_616739 ) ) ( not ( = ?auto_616730 ?auto_616740 ) ) ( not ( = ?auto_616730 ?auto_616741 ) ) ( not ( = ?auto_616730 ?auto_616742 ) ) ( not ( = ?auto_616731 ?auto_616732 ) ) ( not ( = ?auto_616731 ?auto_616733 ) ) ( not ( = ?auto_616731 ?auto_616734 ) ) ( not ( = ?auto_616731 ?auto_616735 ) ) ( not ( = ?auto_616731 ?auto_616736 ) ) ( not ( = ?auto_616731 ?auto_616737 ) ) ( not ( = ?auto_616731 ?auto_616738 ) ) ( not ( = ?auto_616731 ?auto_616739 ) ) ( not ( = ?auto_616731 ?auto_616740 ) ) ( not ( = ?auto_616731 ?auto_616741 ) ) ( not ( = ?auto_616731 ?auto_616742 ) ) ( not ( = ?auto_616732 ?auto_616733 ) ) ( not ( = ?auto_616732 ?auto_616734 ) ) ( not ( = ?auto_616732 ?auto_616735 ) ) ( not ( = ?auto_616732 ?auto_616736 ) ) ( not ( = ?auto_616732 ?auto_616737 ) ) ( not ( = ?auto_616732 ?auto_616738 ) ) ( not ( = ?auto_616732 ?auto_616739 ) ) ( not ( = ?auto_616732 ?auto_616740 ) ) ( not ( = ?auto_616732 ?auto_616741 ) ) ( not ( = ?auto_616732 ?auto_616742 ) ) ( not ( = ?auto_616733 ?auto_616734 ) ) ( not ( = ?auto_616733 ?auto_616735 ) ) ( not ( = ?auto_616733 ?auto_616736 ) ) ( not ( = ?auto_616733 ?auto_616737 ) ) ( not ( = ?auto_616733 ?auto_616738 ) ) ( not ( = ?auto_616733 ?auto_616739 ) ) ( not ( = ?auto_616733 ?auto_616740 ) ) ( not ( = ?auto_616733 ?auto_616741 ) ) ( not ( = ?auto_616733 ?auto_616742 ) ) ( not ( = ?auto_616734 ?auto_616735 ) ) ( not ( = ?auto_616734 ?auto_616736 ) ) ( not ( = ?auto_616734 ?auto_616737 ) ) ( not ( = ?auto_616734 ?auto_616738 ) ) ( not ( = ?auto_616734 ?auto_616739 ) ) ( not ( = ?auto_616734 ?auto_616740 ) ) ( not ( = ?auto_616734 ?auto_616741 ) ) ( not ( = ?auto_616734 ?auto_616742 ) ) ( not ( = ?auto_616735 ?auto_616736 ) ) ( not ( = ?auto_616735 ?auto_616737 ) ) ( not ( = ?auto_616735 ?auto_616738 ) ) ( not ( = ?auto_616735 ?auto_616739 ) ) ( not ( = ?auto_616735 ?auto_616740 ) ) ( not ( = ?auto_616735 ?auto_616741 ) ) ( not ( = ?auto_616735 ?auto_616742 ) ) ( not ( = ?auto_616736 ?auto_616737 ) ) ( not ( = ?auto_616736 ?auto_616738 ) ) ( not ( = ?auto_616736 ?auto_616739 ) ) ( not ( = ?auto_616736 ?auto_616740 ) ) ( not ( = ?auto_616736 ?auto_616741 ) ) ( not ( = ?auto_616736 ?auto_616742 ) ) ( not ( = ?auto_616737 ?auto_616738 ) ) ( not ( = ?auto_616737 ?auto_616739 ) ) ( not ( = ?auto_616737 ?auto_616740 ) ) ( not ( = ?auto_616737 ?auto_616741 ) ) ( not ( = ?auto_616737 ?auto_616742 ) ) ( not ( = ?auto_616738 ?auto_616739 ) ) ( not ( = ?auto_616738 ?auto_616740 ) ) ( not ( = ?auto_616738 ?auto_616741 ) ) ( not ( = ?auto_616738 ?auto_616742 ) ) ( not ( = ?auto_616739 ?auto_616740 ) ) ( not ( = ?auto_616739 ?auto_616741 ) ) ( not ( = ?auto_616739 ?auto_616742 ) ) ( not ( = ?auto_616740 ?auto_616741 ) ) ( not ( = ?auto_616740 ?auto_616742 ) ) ( not ( = ?auto_616741 ?auto_616742 ) ) ( ON ?auto_616740 ?auto_616741 ) ( ON ?auto_616739 ?auto_616740 ) ( ON ?auto_616738 ?auto_616739 ) ( ON ?auto_616737 ?auto_616738 ) ( ON ?auto_616736 ?auto_616737 ) ( ON ?auto_616735 ?auto_616736 ) ( ON ?auto_616734 ?auto_616735 ) ( CLEAR ?auto_616732 ) ( ON ?auto_616733 ?auto_616734 ) ( CLEAR ?auto_616733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_616728 ?auto_616729 ?auto_616730 ?auto_616731 ?auto_616732 ?auto_616733 )
      ( MAKE-14PILE ?auto_616728 ?auto_616729 ?auto_616730 ?auto_616731 ?auto_616732 ?auto_616733 ?auto_616734 ?auto_616735 ?auto_616736 ?auto_616737 ?auto_616738 ?auto_616739 ?auto_616740 ?auto_616741 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616786 - BLOCK
      ?auto_616787 - BLOCK
      ?auto_616788 - BLOCK
      ?auto_616789 - BLOCK
      ?auto_616790 - BLOCK
      ?auto_616791 - BLOCK
      ?auto_616792 - BLOCK
      ?auto_616793 - BLOCK
      ?auto_616794 - BLOCK
      ?auto_616795 - BLOCK
      ?auto_616796 - BLOCK
      ?auto_616797 - BLOCK
      ?auto_616798 - BLOCK
      ?auto_616799 - BLOCK
    )
    :vars
    (
      ?auto_616800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616799 ?auto_616800 ) ( ON-TABLE ?auto_616786 ) ( ON ?auto_616787 ?auto_616786 ) ( ON ?auto_616788 ?auto_616787 ) ( ON ?auto_616789 ?auto_616788 ) ( not ( = ?auto_616786 ?auto_616787 ) ) ( not ( = ?auto_616786 ?auto_616788 ) ) ( not ( = ?auto_616786 ?auto_616789 ) ) ( not ( = ?auto_616786 ?auto_616790 ) ) ( not ( = ?auto_616786 ?auto_616791 ) ) ( not ( = ?auto_616786 ?auto_616792 ) ) ( not ( = ?auto_616786 ?auto_616793 ) ) ( not ( = ?auto_616786 ?auto_616794 ) ) ( not ( = ?auto_616786 ?auto_616795 ) ) ( not ( = ?auto_616786 ?auto_616796 ) ) ( not ( = ?auto_616786 ?auto_616797 ) ) ( not ( = ?auto_616786 ?auto_616798 ) ) ( not ( = ?auto_616786 ?auto_616799 ) ) ( not ( = ?auto_616786 ?auto_616800 ) ) ( not ( = ?auto_616787 ?auto_616788 ) ) ( not ( = ?auto_616787 ?auto_616789 ) ) ( not ( = ?auto_616787 ?auto_616790 ) ) ( not ( = ?auto_616787 ?auto_616791 ) ) ( not ( = ?auto_616787 ?auto_616792 ) ) ( not ( = ?auto_616787 ?auto_616793 ) ) ( not ( = ?auto_616787 ?auto_616794 ) ) ( not ( = ?auto_616787 ?auto_616795 ) ) ( not ( = ?auto_616787 ?auto_616796 ) ) ( not ( = ?auto_616787 ?auto_616797 ) ) ( not ( = ?auto_616787 ?auto_616798 ) ) ( not ( = ?auto_616787 ?auto_616799 ) ) ( not ( = ?auto_616787 ?auto_616800 ) ) ( not ( = ?auto_616788 ?auto_616789 ) ) ( not ( = ?auto_616788 ?auto_616790 ) ) ( not ( = ?auto_616788 ?auto_616791 ) ) ( not ( = ?auto_616788 ?auto_616792 ) ) ( not ( = ?auto_616788 ?auto_616793 ) ) ( not ( = ?auto_616788 ?auto_616794 ) ) ( not ( = ?auto_616788 ?auto_616795 ) ) ( not ( = ?auto_616788 ?auto_616796 ) ) ( not ( = ?auto_616788 ?auto_616797 ) ) ( not ( = ?auto_616788 ?auto_616798 ) ) ( not ( = ?auto_616788 ?auto_616799 ) ) ( not ( = ?auto_616788 ?auto_616800 ) ) ( not ( = ?auto_616789 ?auto_616790 ) ) ( not ( = ?auto_616789 ?auto_616791 ) ) ( not ( = ?auto_616789 ?auto_616792 ) ) ( not ( = ?auto_616789 ?auto_616793 ) ) ( not ( = ?auto_616789 ?auto_616794 ) ) ( not ( = ?auto_616789 ?auto_616795 ) ) ( not ( = ?auto_616789 ?auto_616796 ) ) ( not ( = ?auto_616789 ?auto_616797 ) ) ( not ( = ?auto_616789 ?auto_616798 ) ) ( not ( = ?auto_616789 ?auto_616799 ) ) ( not ( = ?auto_616789 ?auto_616800 ) ) ( not ( = ?auto_616790 ?auto_616791 ) ) ( not ( = ?auto_616790 ?auto_616792 ) ) ( not ( = ?auto_616790 ?auto_616793 ) ) ( not ( = ?auto_616790 ?auto_616794 ) ) ( not ( = ?auto_616790 ?auto_616795 ) ) ( not ( = ?auto_616790 ?auto_616796 ) ) ( not ( = ?auto_616790 ?auto_616797 ) ) ( not ( = ?auto_616790 ?auto_616798 ) ) ( not ( = ?auto_616790 ?auto_616799 ) ) ( not ( = ?auto_616790 ?auto_616800 ) ) ( not ( = ?auto_616791 ?auto_616792 ) ) ( not ( = ?auto_616791 ?auto_616793 ) ) ( not ( = ?auto_616791 ?auto_616794 ) ) ( not ( = ?auto_616791 ?auto_616795 ) ) ( not ( = ?auto_616791 ?auto_616796 ) ) ( not ( = ?auto_616791 ?auto_616797 ) ) ( not ( = ?auto_616791 ?auto_616798 ) ) ( not ( = ?auto_616791 ?auto_616799 ) ) ( not ( = ?auto_616791 ?auto_616800 ) ) ( not ( = ?auto_616792 ?auto_616793 ) ) ( not ( = ?auto_616792 ?auto_616794 ) ) ( not ( = ?auto_616792 ?auto_616795 ) ) ( not ( = ?auto_616792 ?auto_616796 ) ) ( not ( = ?auto_616792 ?auto_616797 ) ) ( not ( = ?auto_616792 ?auto_616798 ) ) ( not ( = ?auto_616792 ?auto_616799 ) ) ( not ( = ?auto_616792 ?auto_616800 ) ) ( not ( = ?auto_616793 ?auto_616794 ) ) ( not ( = ?auto_616793 ?auto_616795 ) ) ( not ( = ?auto_616793 ?auto_616796 ) ) ( not ( = ?auto_616793 ?auto_616797 ) ) ( not ( = ?auto_616793 ?auto_616798 ) ) ( not ( = ?auto_616793 ?auto_616799 ) ) ( not ( = ?auto_616793 ?auto_616800 ) ) ( not ( = ?auto_616794 ?auto_616795 ) ) ( not ( = ?auto_616794 ?auto_616796 ) ) ( not ( = ?auto_616794 ?auto_616797 ) ) ( not ( = ?auto_616794 ?auto_616798 ) ) ( not ( = ?auto_616794 ?auto_616799 ) ) ( not ( = ?auto_616794 ?auto_616800 ) ) ( not ( = ?auto_616795 ?auto_616796 ) ) ( not ( = ?auto_616795 ?auto_616797 ) ) ( not ( = ?auto_616795 ?auto_616798 ) ) ( not ( = ?auto_616795 ?auto_616799 ) ) ( not ( = ?auto_616795 ?auto_616800 ) ) ( not ( = ?auto_616796 ?auto_616797 ) ) ( not ( = ?auto_616796 ?auto_616798 ) ) ( not ( = ?auto_616796 ?auto_616799 ) ) ( not ( = ?auto_616796 ?auto_616800 ) ) ( not ( = ?auto_616797 ?auto_616798 ) ) ( not ( = ?auto_616797 ?auto_616799 ) ) ( not ( = ?auto_616797 ?auto_616800 ) ) ( not ( = ?auto_616798 ?auto_616799 ) ) ( not ( = ?auto_616798 ?auto_616800 ) ) ( not ( = ?auto_616799 ?auto_616800 ) ) ( ON ?auto_616798 ?auto_616799 ) ( ON ?auto_616797 ?auto_616798 ) ( ON ?auto_616796 ?auto_616797 ) ( ON ?auto_616795 ?auto_616796 ) ( ON ?auto_616794 ?auto_616795 ) ( ON ?auto_616793 ?auto_616794 ) ( ON ?auto_616792 ?auto_616793 ) ( ON ?auto_616791 ?auto_616792 ) ( CLEAR ?auto_616789 ) ( ON ?auto_616790 ?auto_616791 ) ( CLEAR ?auto_616790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_616786 ?auto_616787 ?auto_616788 ?auto_616789 ?auto_616790 )
      ( MAKE-14PILE ?auto_616786 ?auto_616787 ?auto_616788 ?auto_616789 ?auto_616790 ?auto_616791 ?auto_616792 ?auto_616793 ?auto_616794 ?auto_616795 ?auto_616796 ?auto_616797 ?auto_616798 ?auto_616799 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616844 - BLOCK
      ?auto_616845 - BLOCK
      ?auto_616846 - BLOCK
      ?auto_616847 - BLOCK
      ?auto_616848 - BLOCK
      ?auto_616849 - BLOCK
      ?auto_616850 - BLOCK
      ?auto_616851 - BLOCK
      ?auto_616852 - BLOCK
      ?auto_616853 - BLOCK
      ?auto_616854 - BLOCK
      ?auto_616855 - BLOCK
      ?auto_616856 - BLOCK
      ?auto_616857 - BLOCK
    )
    :vars
    (
      ?auto_616858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616857 ?auto_616858 ) ( ON-TABLE ?auto_616844 ) ( ON ?auto_616845 ?auto_616844 ) ( ON ?auto_616846 ?auto_616845 ) ( not ( = ?auto_616844 ?auto_616845 ) ) ( not ( = ?auto_616844 ?auto_616846 ) ) ( not ( = ?auto_616844 ?auto_616847 ) ) ( not ( = ?auto_616844 ?auto_616848 ) ) ( not ( = ?auto_616844 ?auto_616849 ) ) ( not ( = ?auto_616844 ?auto_616850 ) ) ( not ( = ?auto_616844 ?auto_616851 ) ) ( not ( = ?auto_616844 ?auto_616852 ) ) ( not ( = ?auto_616844 ?auto_616853 ) ) ( not ( = ?auto_616844 ?auto_616854 ) ) ( not ( = ?auto_616844 ?auto_616855 ) ) ( not ( = ?auto_616844 ?auto_616856 ) ) ( not ( = ?auto_616844 ?auto_616857 ) ) ( not ( = ?auto_616844 ?auto_616858 ) ) ( not ( = ?auto_616845 ?auto_616846 ) ) ( not ( = ?auto_616845 ?auto_616847 ) ) ( not ( = ?auto_616845 ?auto_616848 ) ) ( not ( = ?auto_616845 ?auto_616849 ) ) ( not ( = ?auto_616845 ?auto_616850 ) ) ( not ( = ?auto_616845 ?auto_616851 ) ) ( not ( = ?auto_616845 ?auto_616852 ) ) ( not ( = ?auto_616845 ?auto_616853 ) ) ( not ( = ?auto_616845 ?auto_616854 ) ) ( not ( = ?auto_616845 ?auto_616855 ) ) ( not ( = ?auto_616845 ?auto_616856 ) ) ( not ( = ?auto_616845 ?auto_616857 ) ) ( not ( = ?auto_616845 ?auto_616858 ) ) ( not ( = ?auto_616846 ?auto_616847 ) ) ( not ( = ?auto_616846 ?auto_616848 ) ) ( not ( = ?auto_616846 ?auto_616849 ) ) ( not ( = ?auto_616846 ?auto_616850 ) ) ( not ( = ?auto_616846 ?auto_616851 ) ) ( not ( = ?auto_616846 ?auto_616852 ) ) ( not ( = ?auto_616846 ?auto_616853 ) ) ( not ( = ?auto_616846 ?auto_616854 ) ) ( not ( = ?auto_616846 ?auto_616855 ) ) ( not ( = ?auto_616846 ?auto_616856 ) ) ( not ( = ?auto_616846 ?auto_616857 ) ) ( not ( = ?auto_616846 ?auto_616858 ) ) ( not ( = ?auto_616847 ?auto_616848 ) ) ( not ( = ?auto_616847 ?auto_616849 ) ) ( not ( = ?auto_616847 ?auto_616850 ) ) ( not ( = ?auto_616847 ?auto_616851 ) ) ( not ( = ?auto_616847 ?auto_616852 ) ) ( not ( = ?auto_616847 ?auto_616853 ) ) ( not ( = ?auto_616847 ?auto_616854 ) ) ( not ( = ?auto_616847 ?auto_616855 ) ) ( not ( = ?auto_616847 ?auto_616856 ) ) ( not ( = ?auto_616847 ?auto_616857 ) ) ( not ( = ?auto_616847 ?auto_616858 ) ) ( not ( = ?auto_616848 ?auto_616849 ) ) ( not ( = ?auto_616848 ?auto_616850 ) ) ( not ( = ?auto_616848 ?auto_616851 ) ) ( not ( = ?auto_616848 ?auto_616852 ) ) ( not ( = ?auto_616848 ?auto_616853 ) ) ( not ( = ?auto_616848 ?auto_616854 ) ) ( not ( = ?auto_616848 ?auto_616855 ) ) ( not ( = ?auto_616848 ?auto_616856 ) ) ( not ( = ?auto_616848 ?auto_616857 ) ) ( not ( = ?auto_616848 ?auto_616858 ) ) ( not ( = ?auto_616849 ?auto_616850 ) ) ( not ( = ?auto_616849 ?auto_616851 ) ) ( not ( = ?auto_616849 ?auto_616852 ) ) ( not ( = ?auto_616849 ?auto_616853 ) ) ( not ( = ?auto_616849 ?auto_616854 ) ) ( not ( = ?auto_616849 ?auto_616855 ) ) ( not ( = ?auto_616849 ?auto_616856 ) ) ( not ( = ?auto_616849 ?auto_616857 ) ) ( not ( = ?auto_616849 ?auto_616858 ) ) ( not ( = ?auto_616850 ?auto_616851 ) ) ( not ( = ?auto_616850 ?auto_616852 ) ) ( not ( = ?auto_616850 ?auto_616853 ) ) ( not ( = ?auto_616850 ?auto_616854 ) ) ( not ( = ?auto_616850 ?auto_616855 ) ) ( not ( = ?auto_616850 ?auto_616856 ) ) ( not ( = ?auto_616850 ?auto_616857 ) ) ( not ( = ?auto_616850 ?auto_616858 ) ) ( not ( = ?auto_616851 ?auto_616852 ) ) ( not ( = ?auto_616851 ?auto_616853 ) ) ( not ( = ?auto_616851 ?auto_616854 ) ) ( not ( = ?auto_616851 ?auto_616855 ) ) ( not ( = ?auto_616851 ?auto_616856 ) ) ( not ( = ?auto_616851 ?auto_616857 ) ) ( not ( = ?auto_616851 ?auto_616858 ) ) ( not ( = ?auto_616852 ?auto_616853 ) ) ( not ( = ?auto_616852 ?auto_616854 ) ) ( not ( = ?auto_616852 ?auto_616855 ) ) ( not ( = ?auto_616852 ?auto_616856 ) ) ( not ( = ?auto_616852 ?auto_616857 ) ) ( not ( = ?auto_616852 ?auto_616858 ) ) ( not ( = ?auto_616853 ?auto_616854 ) ) ( not ( = ?auto_616853 ?auto_616855 ) ) ( not ( = ?auto_616853 ?auto_616856 ) ) ( not ( = ?auto_616853 ?auto_616857 ) ) ( not ( = ?auto_616853 ?auto_616858 ) ) ( not ( = ?auto_616854 ?auto_616855 ) ) ( not ( = ?auto_616854 ?auto_616856 ) ) ( not ( = ?auto_616854 ?auto_616857 ) ) ( not ( = ?auto_616854 ?auto_616858 ) ) ( not ( = ?auto_616855 ?auto_616856 ) ) ( not ( = ?auto_616855 ?auto_616857 ) ) ( not ( = ?auto_616855 ?auto_616858 ) ) ( not ( = ?auto_616856 ?auto_616857 ) ) ( not ( = ?auto_616856 ?auto_616858 ) ) ( not ( = ?auto_616857 ?auto_616858 ) ) ( ON ?auto_616856 ?auto_616857 ) ( ON ?auto_616855 ?auto_616856 ) ( ON ?auto_616854 ?auto_616855 ) ( ON ?auto_616853 ?auto_616854 ) ( ON ?auto_616852 ?auto_616853 ) ( ON ?auto_616851 ?auto_616852 ) ( ON ?auto_616850 ?auto_616851 ) ( ON ?auto_616849 ?auto_616850 ) ( ON ?auto_616848 ?auto_616849 ) ( CLEAR ?auto_616846 ) ( ON ?auto_616847 ?auto_616848 ) ( CLEAR ?auto_616847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_616844 ?auto_616845 ?auto_616846 ?auto_616847 )
      ( MAKE-14PILE ?auto_616844 ?auto_616845 ?auto_616846 ?auto_616847 ?auto_616848 ?auto_616849 ?auto_616850 ?auto_616851 ?auto_616852 ?auto_616853 ?auto_616854 ?auto_616855 ?auto_616856 ?auto_616857 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616902 - BLOCK
      ?auto_616903 - BLOCK
      ?auto_616904 - BLOCK
      ?auto_616905 - BLOCK
      ?auto_616906 - BLOCK
      ?auto_616907 - BLOCK
      ?auto_616908 - BLOCK
      ?auto_616909 - BLOCK
      ?auto_616910 - BLOCK
      ?auto_616911 - BLOCK
      ?auto_616912 - BLOCK
      ?auto_616913 - BLOCK
      ?auto_616914 - BLOCK
      ?auto_616915 - BLOCK
    )
    :vars
    (
      ?auto_616916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616915 ?auto_616916 ) ( ON-TABLE ?auto_616902 ) ( ON ?auto_616903 ?auto_616902 ) ( not ( = ?auto_616902 ?auto_616903 ) ) ( not ( = ?auto_616902 ?auto_616904 ) ) ( not ( = ?auto_616902 ?auto_616905 ) ) ( not ( = ?auto_616902 ?auto_616906 ) ) ( not ( = ?auto_616902 ?auto_616907 ) ) ( not ( = ?auto_616902 ?auto_616908 ) ) ( not ( = ?auto_616902 ?auto_616909 ) ) ( not ( = ?auto_616902 ?auto_616910 ) ) ( not ( = ?auto_616902 ?auto_616911 ) ) ( not ( = ?auto_616902 ?auto_616912 ) ) ( not ( = ?auto_616902 ?auto_616913 ) ) ( not ( = ?auto_616902 ?auto_616914 ) ) ( not ( = ?auto_616902 ?auto_616915 ) ) ( not ( = ?auto_616902 ?auto_616916 ) ) ( not ( = ?auto_616903 ?auto_616904 ) ) ( not ( = ?auto_616903 ?auto_616905 ) ) ( not ( = ?auto_616903 ?auto_616906 ) ) ( not ( = ?auto_616903 ?auto_616907 ) ) ( not ( = ?auto_616903 ?auto_616908 ) ) ( not ( = ?auto_616903 ?auto_616909 ) ) ( not ( = ?auto_616903 ?auto_616910 ) ) ( not ( = ?auto_616903 ?auto_616911 ) ) ( not ( = ?auto_616903 ?auto_616912 ) ) ( not ( = ?auto_616903 ?auto_616913 ) ) ( not ( = ?auto_616903 ?auto_616914 ) ) ( not ( = ?auto_616903 ?auto_616915 ) ) ( not ( = ?auto_616903 ?auto_616916 ) ) ( not ( = ?auto_616904 ?auto_616905 ) ) ( not ( = ?auto_616904 ?auto_616906 ) ) ( not ( = ?auto_616904 ?auto_616907 ) ) ( not ( = ?auto_616904 ?auto_616908 ) ) ( not ( = ?auto_616904 ?auto_616909 ) ) ( not ( = ?auto_616904 ?auto_616910 ) ) ( not ( = ?auto_616904 ?auto_616911 ) ) ( not ( = ?auto_616904 ?auto_616912 ) ) ( not ( = ?auto_616904 ?auto_616913 ) ) ( not ( = ?auto_616904 ?auto_616914 ) ) ( not ( = ?auto_616904 ?auto_616915 ) ) ( not ( = ?auto_616904 ?auto_616916 ) ) ( not ( = ?auto_616905 ?auto_616906 ) ) ( not ( = ?auto_616905 ?auto_616907 ) ) ( not ( = ?auto_616905 ?auto_616908 ) ) ( not ( = ?auto_616905 ?auto_616909 ) ) ( not ( = ?auto_616905 ?auto_616910 ) ) ( not ( = ?auto_616905 ?auto_616911 ) ) ( not ( = ?auto_616905 ?auto_616912 ) ) ( not ( = ?auto_616905 ?auto_616913 ) ) ( not ( = ?auto_616905 ?auto_616914 ) ) ( not ( = ?auto_616905 ?auto_616915 ) ) ( not ( = ?auto_616905 ?auto_616916 ) ) ( not ( = ?auto_616906 ?auto_616907 ) ) ( not ( = ?auto_616906 ?auto_616908 ) ) ( not ( = ?auto_616906 ?auto_616909 ) ) ( not ( = ?auto_616906 ?auto_616910 ) ) ( not ( = ?auto_616906 ?auto_616911 ) ) ( not ( = ?auto_616906 ?auto_616912 ) ) ( not ( = ?auto_616906 ?auto_616913 ) ) ( not ( = ?auto_616906 ?auto_616914 ) ) ( not ( = ?auto_616906 ?auto_616915 ) ) ( not ( = ?auto_616906 ?auto_616916 ) ) ( not ( = ?auto_616907 ?auto_616908 ) ) ( not ( = ?auto_616907 ?auto_616909 ) ) ( not ( = ?auto_616907 ?auto_616910 ) ) ( not ( = ?auto_616907 ?auto_616911 ) ) ( not ( = ?auto_616907 ?auto_616912 ) ) ( not ( = ?auto_616907 ?auto_616913 ) ) ( not ( = ?auto_616907 ?auto_616914 ) ) ( not ( = ?auto_616907 ?auto_616915 ) ) ( not ( = ?auto_616907 ?auto_616916 ) ) ( not ( = ?auto_616908 ?auto_616909 ) ) ( not ( = ?auto_616908 ?auto_616910 ) ) ( not ( = ?auto_616908 ?auto_616911 ) ) ( not ( = ?auto_616908 ?auto_616912 ) ) ( not ( = ?auto_616908 ?auto_616913 ) ) ( not ( = ?auto_616908 ?auto_616914 ) ) ( not ( = ?auto_616908 ?auto_616915 ) ) ( not ( = ?auto_616908 ?auto_616916 ) ) ( not ( = ?auto_616909 ?auto_616910 ) ) ( not ( = ?auto_616909 ?auto_616911 ) ) ( not ( = ?auto_616909 ?auto_616912 ) ) ( not ( = ?auto_616909 ?auto_616913 ) ) ( not ( = ?auto_616909 ?auto_616914 ) ) ( not ( = ?auto_616909 ?auto_616915 ) ) ( not ( = ?auto_616909 ?auto_616916 ) ) ( not ( = ?auto_616910 ?auto_616911 ) ) ( not ( = ?auto_616910 ?auto_616912 ) ) ( not ( = ?auto_616910 ?auto_616913 ) ) ( not ( = ?auto_616910 ?auto_616914 ) ) ( not ( = ?auto_616910 ?auto_616915 ) ) ( not ( = ?auto_616910 ?auto_616916 ) ) ( not ( = ?auto_616911 ?auto_616912 ) ) ( not ( = ?auto_616911 ?auto_616913 ) ) ( not ( = ?auto_616911 ?auto_616914 ) ) ( not ( = ?auto_616911 ?auto_616915 ) ) ( not ( = ?auto_616911 ?auto_616916 ) ) ( not ( = ?auto_616912 ?auto_616913 ) ) ( not ( = ?auto_616912 ?auto_616914 ) ) ( not ( = ?auto_616912 ?auto_616915 ) ) ( not ( = ?auto_616912 ?auto_616916 ) ) ( not ( = ?auto_616913 ?auto_616914 ) ) ( not ( = ?auto_616913 ?auto_616915 ) ) ( not ( = ?auto_616913 ?auto_616916 ) ) ( not ( = ?auto_616914 ?auto_616915 ) ) ( not ( = ?auto_616914 ?auto_616916 ) ) ( not ( = ?auto_616915 ?auto_616916 ) ) ( ON ?auto_616914 ?auto_616915 ) ( ON ?auto_616913 ?auto_616914 ) ( ON ?auto_616912 ?auto_616913 ) ( ON ?auto_616911 ?auto_616912 ) ( ON ?auto_616910 ?auto_616911 ) ( ON ?auto_616909 ?auto_616910 ) ( ON ?auto_616908 ?auto_616909 ) ( ON ?auto_616907 ?auto_616908 ) ( ON ?auto_616906 ?auto_616907 ) ( ON ?auto_616905 ?auto_616906 ) ( CLEAR ?auto_616903 ) ( ON ?auto_616904 ?auto_616905 ) ( CLEAR ?auto_616904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_616902 ?auto_616903 ?auto_616904 )
      ( MAKE-14PILE ?auto_616902 ?auto_616903 ?auto_616904 ?auto_616905 ?auto_616906 ?auto_616907 ?auto_616908 ?auto_616909 ?auto_616910 ?auto_616911 ?auto_616912 ?auto_616913 ?auto_616914 ?auto_616915 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_616960 - BLOCK
      ?auto_616961 - BLOCK
      ?auto_616962 - BLOCK
      ?auto_616963 - BLOCK
      ?auto_616964 - BLOCK
      ?auto_616965 - BLOCK
      ?auto_616966 - BLOCK
      ?auto_616967 - BLOCK
      ?auto_616968 - BLOCK
      ?auto_616969 - BLOCK
      ?auto_616970 - BLOCK
      ?auto_616971 - BLOCK
      ?auto_616972 - BLOCK
      ?auto_616973 - BLOCK
    )
    :vars
    (
      ?auto_616974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_616973 ?auto_616974 ) ( ON-TABLE ?auto_616960 ) ( not ( = ?auto_616960 ?auto_616961 ) ) ( not ( = ?auto_616960 ?auto_616962 ) ) ( not ( = ?auto_616960 ?auto_616963 ) ) ( not ( = ?auto_616960 ?auto_616964 ) ) ( not ( = ?auto_616960 ?auto_616965 ) ) ( not ( = ?auto_616960 ?auto_616966 ) ) ( not ( = ?auto_616960 ?auto_616967 ) ) ( not ( = ?auto_616960 ?auto_616968 ) ) ( not ( = ?auto_616960 ?auto_616969 ) ) ( not ( = ?auto_616960 ?auto_616970 ) ) ( not ( = ?auto_616960 ?auto_616971 ) ) ( not ( = ?auto_616960 ?auto_616972 ) ) ( not ( = ?auto_616960 ?auto_616973 ) ) ( not ( = ?auto_616960 ?auto_616974 ) ) ( not ( = ?auto_616961 ?auto_616962 ) ) ( not ( = ?auto_616961 ?auto_616963 ) ) ( not ( = ?auto_616961 ?auto_616964 ) ) ( not ( = ?auto_616961 ?auto_616965 ) ) ( not ( = ?auto_616961 ?auto_616966 ) ) ( not ( = ?auto_616961 ?auto_616967 ) ) ( not ( = ?auto_616961 ?auto_616968 ) ) ( not ( = ?auto_616961 ?auto_616969 ) ) ( not ( = ?auto_616961 ?auto_616970 ) ) ( not ( = ?auto_616961 ?auto_616971 ) ) ( not ( = ?auto_616961 ?auto_616972 ) ) ( not ( = ?auto_616961 ?auto_616973 ) ) ( not ( = ?auto_616961 ?auto_616974 ) ) ( not ( = ?auto_616962 ?auto_616963 ) ) ( not ( = ?auto_616962 ?auto_616964 ) ) ( not ( = ?auto_616962 ?auto_616965 ) ) ( not ( = ?auto_616962 ?auto_616966 ) ) ( not ( = ?auto_616962 ?auto_616967 ) ) ( not ( = ?auto_616962 ?auto_616968 ) ) ( not ( = ?auto_616962 ?auto_616969 ) ) ( not ( = ?auto_616962 ?auto_616970 ) ) ( not ( = ?auto_616962 ?auto_616971 ) ) ( not ( = ?auto_616962 ?auto_616972 ) ) ( not ( = ?auto_616962 ?auto_616973 ) ) ( not ( = ?auto_616962 ?auto_616974 ) ) ( not ( = ?auto_616963 ?auto_616964 ) ) ( not ( = ?auto_616963 ?auto_616965 ) ) ( not ( = ?auto_616963 ?auto_616966 ) ) ( not ( = ?auto_616963 ?auto_616967 ) ) ( not ( = ?auto_616963 ?auto_616968 ) ) ( not ( = ?auto_616963 ?auto_616969 ) ) ( not ( = ?auto_616963 ?auto_616970 ) ) ( not ( = ?auto_616963 ?auto_616971 ) ) ( not ( = ?auto_616963 ?auto_616972 ) ) ( not ( = ?auto_616963 ?auto_616973 ) ) ( not ( = ?auto_616963 ?auto_616974 ) ) ( not ( = ?auto_616964 ?auto_616965 ) ) ( not ( = ?auto_616964 ?auto_616966 ) ) ( not ( = ?auto_616964 ?auto_616967 ) ) ( not ( = ?auto_616964 ?auto_616968 ) ) ( not ( = ?auto_616964 ?auto_616969 ) ) ( not ( = ?auto_616964 ?auto_616970 ) ) ( not ( = ?auto_616964 ?auto_616971 ) ) ( not ( = ?auto_616964 ?auto_616972 ) ) ( not ( = ?auto_616964 ?auto_616973 ) ) ( not ( = ?auto_616964 ?auto_616974 ) ) ( not ( = ?auto_616965 ?auto_616966 ) ) ( not ( = ?auto_616965 ?auto_616967 ) ) ( not ( = ?auto_616965 ?auto_616968 ) ) ( not ( = ?auto_616965 ?auto_616969 ) ) ( not ( = ?auto_616965 ?auto_616970 ) ) ( not ( = ?auto_616965 ?auto_616971 ) ) ( not ( = ?auto_616965 ?auto_616972 ) ) ( not ( = ?auto_616965 ?auto_616973 ) ) ( not ( = ?auto_616965 ?auto_616974 ) ) ( not ( = ?auto_616966 ?auto_616967 ) ) ( not ( = ?auto_616966 ?auto_616968 ) ) ( not ( = ?auto_616966 ?auto_616969 ) ) ( not ( = ?auto_616966 ?auto_616970 ) ) ( not ( = ?auto_616966 ?auto_616971 ) ) ( not ( = ?auto_616966 ?auto_616972 ) ) ( not ( = ?auto_616966 ?auto_616973 ) ) ( not ( = ?auto_616966 ?auto_616974 ) ) ( not ( = ?auto_616967 ?auto_616968 ) ) ( not ( = ?auto_616967 ?auto_616969 ) ) ( not ( = ?auto_616967 ?auto_616970 ) ) ( not ( = ?auto_616967 ?auto_616971 ) ) ( not ( = ?auto_616967 ?auto_616972 ) ) ( not ( = ?auto_616967 ?auto_616973 ) ) ( not ( = ?auto_616967 ?auto_616974 ) ) ( not ( = ?auto_616968 ?auto_616969 ) ) ( not ( = ?auto_616968 ?auto_616970 ) ) ( not ( = ?auto_616968 ?auto_616971 ) ) ( not ( = ?auto_616968 ?auto_616972 ) ) ( not ( = ?auto_616968 ?auto_616973 ) ) ( not ( = ?auto_616968 ?auto_616974 ) ) ( not ( = ?auto_616969 ?auto_616970 ) ) ( not ( = ?auto_616969 ?auto_616971 ) ) ( not ( = ?auto_616969 ?auto_616972 ) ) ( not ( = ?auto_616969 ?auto_616973 ) ) ( not ( = ?auto_616969 ?auto_616974 ) ) ( not ( = ?auto_616970 ?auto_616971 ) ) ( not ( = ?auto_616970 ?auto_616972 ) ) ( not ( = ?auto_616970 ?auto_616973 ) ) ( not ( = ?auto_616970 ?auto_616974 ) ) ( not ( = ?auto_616971 ?auto_616972 ) ) ( not ( = ?auto_616971 ?auto_616973 ) ) ( not ( = ?auto_616971 ?auto_616974 ) ) ( not ( = ?auto_616972 ?auto_616973 ) ) ( not ( = ?auto_616972 ?auto_616974 ) ) ( not ( = ?auto_616973 ?auto_616974 ) ) ( ON ?auto_616972 ?auto_616973 ) ( ON ?auto_616971 ?auto_616972 ) ( ON ?auto_616970 ?auto_616971 ) ( ON ?auto_616969 ?auto_616970 ) ( ON ?auto_616968 ?auto_616969 ) ( ON ?auto_616967 ?auto_616968 ) ( ON ?auto_616966 ?auto_616967 ) ( ON ?auto_616965 ?auto_616966 ) ( ON ?auto_616964 ?auto_616965 ) ( ON ?auto_616963 ?auto_616964 ) ( ON ?auto_616962 ?auto_616963 ) ( CLEAR ?auto_616960 ) ( ON ?auto_616961 ?auto_616962 ) ( CLEAR ?auto_616961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_616960 ?auto_616961 )
      ( MAKE-14PILE ?auto_616960 ?auto_616961 ?auto_616962 ?auto_616963 ?auto_616964 ?auto_616965 ?auto_616966 ?auto_616967 ?auto_616968 ?auto_616969 ?auto_616970 ?auto_616971 ?auto_616972 ?auto_616973 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_617018 - BLOCK
      ?auto_617019 - BLOCK
      ?auto_617020 - BLOCK
      ?auto_617021 - BLOCK
      ?auto_617022 - BLOCK
      ?auto_617023 - BLOCK
      ?auto_617024 - BLOCK
      ?auto_617025 - BLOCK
      ?auto_617026 - BLOCK
      ?auto_617027 - BLOCK
      ?auto_617028 - BLOCK
      ?auto_617029 - BLOCK
      ?auto_617030 - BLOCK
      ?auto_617031 - BLOCK
    )
    :vars
    (
      ?auto_617032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617031 ?auto_617032 ) ( not ( = ?auto_617018 ?auto_617019 ) ) ( not ( = ?auto_617018 ?auto_617020 ) ) ( not ( = ?auto_617018 ?auto_617021 ) ) ( not ( = ?auto_617018 ?auto_617022 ) ) ( not ( = ?auto_617018 ?auto_617023 ) ) ( not ( = ?auto_617018 ?auto_617024 ) ) ( not ( = ?auto_617018 ?auto_617025 ) ) ( not ( = ?auto_617018 ?auto_617026 ) ) ( not ( = ?auto_617018 ?auto_617027 ) ) ( not ( = ?auto_617018 ?auto_617028 ) ) ( not ( = ?auto_617018 ?auto_617029 ) ) ( not ( = ?auto_617018 ?auto_617030 ) ) ( not ( = ?auto_617018 ?auto_617031 ) ) ( not ( = ?auto_617018 ?auto_617032 ) ) ( not ( = ?auto_617019 ?auto_617020 ) ) ( not ( = ?auto_617019 ?auto_617021 ) ) ( not ( = ?auto_617019 ?auto_617022 ) ) ( not ( = ?auto_617019 ?auto_617023 ) ) ( not ( = ?auto_617019 ?auto_617024 ) ) ( not ( = ?auto_617019 ?auto_617025 ) ) ( not ( = ?auto_617019 ?auto_617026 ) ) ( not ( = ?auto_617019 ?auto_617027 ) ) ( not ( = ?auto_617019 ?auto_617028 ) ) ( not ( = ?auto_617019 ?auto_617029 ) ) ( not ( = ?auto_617019 ?auto_617030 ) ) ( not ( = ?auto_617019 ?auto_617031 ) ) ( not ( = ?auto_617019 ?auto_617032 ) ) ( not ( = ?auto_617020 ?auto_617021 ) ) ( not ( = ?auto_617020 ?auto_617022 ) ) ( not ( = ?auto_617020 ?auto_617023 ) ) ( not ( = ?auto_617020 ?auto_617024 ) ) ( not ( = ?auto_617020 ?auto_617025 ) ) ( not ( = ?auto_617020 ?auto_617026 ) ) ( not ( = ?auto_617020 ?auto_617027 ) ) ( not ( = ?auto_617020 ?auto_617028 ) ) ( not ( = ?auto_617020 ?auto_617029 ) ) ( not ( = ?auto_617020 ?auto_617030 ) ) ( not ( = ?auto_617020 ?auto_617031 ) ) ( not ( = ?auto_617020 ?auto_617032 ) ) ( not ( = ?auto_617021 ?auto_617022 ) ) ( not ( = ?auto_617021 ?auto_617023 ) ) ( not ( = ?auto_617021 ?auto_617024 ) ) ( not ( = ?auto_617021 ?auto_617025 ) ) ( not ( = ?auto_617021 ?auto_617026 ) ) ( not ( = ?auto_617021 ?auto_617027 ) ) ( not ( = ?auto_617021 ?auto_617028 ) ) ( not ( = ?auto_617021 ?auto_617029 ) ) ( not ( = ?auto_617021 ?auto_617030 ) ) ( not ( = ?auto_617021 ?auto_617031 ) ) ( not ( = ?auto_617021 ?auto_617032 ) ) ( not ( = ?auto_617022 ?auto_617023 ) ) ( not ( = ?auto_617022 ?auto_617024 ) ) ( not ( = ?auto_617022 ?auto_617025 ) ) ( not ( = ?auto_617022 ?auto_617026 ) ) ( not ( = ?auto_617022 ?auto_617027 ) ) ( not ( = ?auto_617022 ?auto_617028 ) ) ( not ( = ?auto_617022 ?auto_617029 ) ) ( not ( = ?auto_617022 ?auto_617030 ) ) ( not ( = ?auto_617022 ?auto_617031 ) ) ( not ( = ?auto_617022 ?auto_617032 ) ) ( not ( = ?auto_617023 ?auto_617024 ) ) ( not ( = ?auto_617023 ?auto_617025 ) ) ( not ( = ?auto_617023 ?auto_617026 ) ) ( not ( = ?auto_617023 ?auto_617027 ) ) ( not ( = ?auto_617023 ?auto_617028 ) ) ( not ( = ?auto_617023 ?auto_617029 ) ) ( not ( = ?auto_617023 ?auto_617030 ) ) ( not ( = ?auto_617023 ?auto_617031 ) ) ( not ( = ?auto_617023 ?auto_617032 ) ) ( not ( = ?auto_617024 ?auto_617025 ) ) ( not ( = ?auto_617024 ?auto_617026 ) ) ( not ( = ?auto_617024 ?auto_617027 ) ) ( not ( = ?auto_617024 ?auto_617028 ) ) ( not ( = ?auto_617024 ?auto_617029 ) ) ( not ( = ?auto_617024 ?auto_617030 ) ) ( not ( = ?auto_617024 ?auto_617031 ) ) ( not ( = ?auto_617024 ?auto_617032 ) ) ( not ( = ?auto_617025 ?auto_617026 ) ) ( not ( = ?auto_617025 ?auto_617027 ) ) ( not ( = ?auto_617025 ?auto_617028 ) ) ( not ( = ?auto_617025 ?auto_617029 ) ) ( not ( = ?auto_617025 ?auto_617030 ) ) ( not ( = ?auto_617025 ?auto_617031 ) ) ( not ( = ?auto_617025 ?auto_617032 ) ) ( not ( = ?auto_617026 ?auto_617027 ) ) ( not ( = ?auto_617026 ?auto_617028 ) ) ( not ( = ?auto_617026 ?auto_617029 ) ) ( not ( = ?auto_617026 ?auto_617030 ) ) ( not ( = ?auto_617026 ?auto_617031 ) ) ( not ( = ?auto_617026 ?auto_617032 ) ) ( not ( = ?auto_617027 ?auto_617028 ) ) ( not ( = ?auto_617027 ?auto_617029 ) ) ( not ( = ?auto_617027 ?auto_617030 ) ) ( not ( = ?auto_617027 ?auto_617031 ) ) ( not ( = ?auto_617027 ?auto_617032 ) ) ( not ( = ?auto_617028 ?auto_617029 ) ) ( not ( = ?auto_617028 ?auto_617030 ) ) ( not ( = ?auto_617028 ?auto_617031 ) ) ( not ( = ?auto_617028 ?auto_617032 ) ) ( not ( = ?auto_617029 ?auto_617030 ) ) ( not ( = ?auto_617029 ?auto_617031 ) ) ( not ( = ?auto_617029 ?auto_617032 ) ) ( not ( = ?auto_617030 ?auto_617031 ) ) ( not ( = ?auto_617030 ?auto_617032 ) ) ( not ( = ?auto_617031 ?auto_617032 ) ) ( ON ?auto_617030 ?auto_617031 ) ( ON ?auto_617029 ?auto_617030 ) ( ON ?auto_617028 ?auto_617029 ) ( ON ?auto_617027 ?auto_617028 ) ( ON ?auto_617026 ?auto_617027 ) ( ON ?auto_617025 ?auto_617026 ) ( ON ?auto_617024 ?auto_617025 ) ( ON ?auto_617023 ?auto_617024 ) ( ON ?auto_617022 ?auto_617023 ) ( ON ?auto_617021 ?auto_617022 ) ( ON ?auto_617020 ?auto_617021 ) ( ON ?auto_617019 ?auto_617020 ) ( ON ?auto_617018 ?auto_617019 ) ( CLEAR ?auto_617018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_617018 )
      ( MAKE-14PILE ?auto_617018 ?auto_617019 ?auto_617020 ?auto_617021 ?auto_617022 ?auto_617023 ?auto_617024 ?auto_617025 ?auto_617026 ?auto_617027 ?auto_617028 ?auto_617029 ?auto_617030 ?auto_617031 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617077 - BLOCK
      ?auto_617078 - BLOCK
      ?auto_617079 - BLOCK
      ?auto_617080 - BLOCK
      ?auto_617081 - BLOCK
      ?auto_617082 - BLOCK
      ?auto_617083 - BLOCK
      ?auto_617084 - BLOCK
      ?auto_617085 - BLOCK
      ?auto_617086 - BLOCK
      ?auto_617087 - BLOCK
      ?auto_617088 - BLOCK
      ?auto_617089 - BLOCK
      ?auto_617090 - BLOCK
      ?auto_617091 - BLOCK
    )
    :vars
    (
      ?auto_617092 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_617090 ) ( ON ?auto_617091 ?auto_617092 ) ( CLEAR ?auto_617091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_617077 ) ( ON ?auto_617078 ?auto_617077 ) ( ON ?auto_617079 ?auto_617078 ) ( ON ?auto_617080 ?auto_617079 ) ( ON ?auto_617081 ?auto_617080 ) ( ON ?auto_617082 ?auto_617081 ) ( ON ?auto_617083 ?auto_617082 ) ( ON ?auto_617084 ?auto_617083 ) ( ON ?auto_617085 ?auto_617084 ) ( ON ?auto_617086 ?auto_617085 ) ( ON ?auto_617087 ?auto_617086 ) ( ON ?auto_617088 ?auto_617087 ) ( ON ?auto_617089 ?auto_617088 ) ( ON ?auto_617090 ?auto_617089 ) ( not ( = ?auto_617077 ?auto_617078 ) ) ( not ( = ?auto_617077 ?auto_617079 ) ) ( not ( = ?auto_617077 ?auto_617080 ) ) ( not ( = ?auto_617077 ?auto_617081 ) ) ( not ( = ?auto_617077 ?auto_617082 ) ) ( not ( = ?auto_617077 ?auto_617083 ) ) ( not ( = ?auto_617077 ?auto_617084 ) ) ( not ( = ?auto_617077 ?auto_617085 ) ) ( not ( = ?auto_617077 ?auto_617086 ) ) ( not ( = ?auto_617077 ?auto_617087 ) ) ( not ( = ?auto_617077 ?auto_617088 ) ) ( not ( = ?auto_617077 ?auto_617089 ) ) ( not ( = ?auto_617077 ?auto_617090 ) ) ( not ( = ?auto_617077 ?auto_617091 ) ) ( not ( = ?auto_617077 ?auto_617092 ) ) ( not ( = ?auto_617078 ?auto_617079 ) ) ( not ( = ?auto_617078 ?auto_617080 ) ) ( not ( = ?auto_617078 ?auto_617081 ) ) ( not ( = ?auto_617078 ?auto_617082 ) ) ( not ( = ?auto_617078 ?auto_617083 ) ) ( not ( = ?auto_617078 ?auto_617084 ) ) ( not ( = ?auto_617078 ?auto_617085 ) ) ( not ( = ?auto_617078 ?auto_617086 ) ) ( not ( = ?auto_617078 ?auto_617087 ) ) ( not ( = ?auto_617078 ?auto_617088 ) ) ( not ( = ?auto_617078 ?auto_617089 ) ) ( not ( = ?auto_617078 ?auto_617090 ) ) ( not ( = ?auto_617078 ?auto_617091 ) ) ( not ( = ?auto_617078 ?auto_617092 ) ) ( not ( = ?auto_617079 ?auto_617080 ) ) ( not ( = ?auto_617079 ?auto_617081 ) ) ( not ( = ?auto_617079 ?auto_617082 ) ) ( not ( = ?auto_617079 ?auto_617083 ) ) ( not ( = ?auto_617079 ?auto_617084 ) ) ( not ( = ?auto_617079 ?auto_617085 ) ) ( not ( = ?auto_617079 ?auto_617086 ) ) ( not ( = ?auto_617079 ?auto_617087 ) ) ( not ( = ?auto_617079 ?auto_617088 ) ) ( not ( = ?auto_617079 ?auto_617089 ) ) ( not ( = ?auto_617079 ?auto_617090 ) ) ( not ( = ?auto_617079 ?auto_617091 ) ) ( not ( = ?auto_617079 ?auto_617092 ) ) ( not ( = ?auto_617080 ?auto_617081 ) ) ( not ( = ?auto_617080 ?auto_617082 ) ) ( not ( = ?auto_617080 ?auto_617083 ) ) ( not ( = ?auto_617080 ?auto_617084 ) ) ( not ( = ?auto_617080 ?auto_617085 ) ) ( not ( = ?auto_617080 ?auto_617086 ) ) ( not ( = ?auto_617080 ?auto_617087 ) ) ( not ( = ?auto_617080 ?auto_617088 ) ) ( not ( = ?auto_617080 ?auto_617089 ) ) ( not ( = ?auto_617080 ?auto_617090 ) ) ( not ( = ?auto_617080 ?auto_617091 ) ) ( not ( = ?auto_617080 ?auto_617092 ) ) ( not ( = ?auto_617081 ?auto_617082 ) ) ( not ( = ?auto_617081 ?auto_617083 ) ) ( not ( = ?auto_617081 ?auto_617084 ) ) ( not ( = ?auto_617081 ?auto_617085 ) ) ( not ( = ?auto_617081 ?auto_617086 ) ) ( not ( = ?auto_617081 ?auto_617087 ) ) ( not ( = ?auto_617081 ?auto_617088 ) ) ( not ( = ?auto_617081 ?auto_617089 ) ) ( not ( = ?auto_617081 ?auto_617090 ) ) ( not ( = ?auto_617081 ?auto_617091 ) ) ( not ( = ?auto_617081 ?auto_617092 ) ) ( not ( = ?auto_617082 ?auto_617083 ) ) ( not ( = ?auto_617082 ?auto_617084 ) ) ( not ( = ?auto_617082 ?auto_617085 ) ) ( not ( = ?auto_617082 ?auto_617086 ) ) ( not ( = ?auto_617082 ?auto_617087 ) ) ( not ( = ?auto_617082 ?auto_617088 ) ) ( not ( = ?auto_617082 ?auto_617089 ) ) ( not ( = ?auto_617082 ?auto_617090 ) ) ( not ( = ?auto_617082 ?auto_617091 ) ) ( not ( = ?auto_617082 ?auto_617092 ) ) ( not ( = ?auto_617083 ?auto_617084 ) ) ( not ( = ?auto_617083 ?auto_617085 ) ) ( not ( = ?auto_617083 ?auto_617086 ) ) ( not ( = ?auto_617083 ?auto_617087 ) ) ( not ( = ?auto_617083 ?auto_617088 ) ) ( not ( = ?auto_617083 ?auto_617089 ) ) ( not ( = ?auto_617083 ?auto_617090 ) ) ( not ( = ?auto_617083 ?auto_617091 ) ) ( not ( = ?auto_617083 ?auto_617092 ) ) ( not ( = ?auto_617084 ?auto_617085 ) ) ( not ( = ?auto_617084 ?auto_617086 ) ) ( not ( = ?auto_617084 ?auto_617087 ) ) ( not ( = ?auto_617084 ?auto_617088 ) ) ( not ( = ?auto_617084 ?auto_617089 ) ) ( not ( = ?auto_617084 ?auto_617090 ) ) ( not ( = ?auto_617084 ?auto_617091 ) ) ( not ( = ?auto_617084 ?auto_617092 ) ) ( not ( = ?auto_617085 ?auto_617086 ) ) ( not ( = ?auto_617085 ?auto_617087 ) ) ( not ( = ?auto_617085 ?auto_617088 ) ) ( not ( = ?auto_617085 ?auto_617089 ) ) ( not ( = ?auto_617085 ?auto_617090 ) ) ( not ( = ?auto_617085 ?auto_617091 ) ) ( not ( = ?auto_617085 ?auto_617092 ) ) ( not ( = ?auto_617086 ?auto_617087 ) ) ( not ( = ?auto_617086 ?auto_617088 ) ) ( not ( = ?auto_617086 ?auto_617089 ) ) ( not ( = ?auto_617086 ?auto_617090 ) ) ( not ( = ?auto_617086 ?auto_617091 ) ) ( not ( = ?auto_617086 ?auto_617092 ) ) ( not ( = ?auto_617087 ?auto_617088 ) ) ( not ( = ?auto_617087 ?auto_617089 ) ) ( not ( = ?auto_617087 ?auto_617090 ) ) ( not ( = ?auto_617087 ?auto_617091 ) ) ( not ( = ?auto_617087 ?auto_617092 ) ) ( not ( = ?auto_617088 ?auto_617089 ) ) ( not ( = ?auto_617088 ?auto_617090 ) ) ( not ( = ?auto_617088 ?auto_617091 ) ) ( not ( = ?auto_617088 ?auto_617092 ) ) ( not ( = ?auto_617089 ?auto_617090 ) ) ( not ( = ?auto_617089 ?auto_617091 ) ) ( not ( = ?auto_617089 ?auto_617092 ) ) ( not ( = ?auto_617090 ?auto_617091 ) ) ( not ( = ?auto_617090 ?auto_617092 ) ) ( not ( = ?auto_617091 ?auto_617092 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_617091 ?auto_617092 )
      ( !STACK ?auto_617091 ?auto_617090 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617139 - BLOCK
      ?auto_617140 - BLOCK
      ?auto_617141 - BLOCK
      ?auto_617142 - BLOCK
      ?auto_617143 - BLOCK
      ?auto_617144 - BLOCK
      ?auto_617145 - BLOCK
      ?auto_617146 - BLOCK
      ?auto_617147 - BLOCK
      ?auto_617148 - BLOCK
      ?auto_617149 - BLOCK
      ?auto_617150 - BLOCK
      ?auto_617151 - BLOCK
      ?auto_617152 - BLOCK
      ?auto_617153 - BLOCK
    )
    :vars
    (
      ?auto_617154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617153 ?auto_617154 ) ( ON-TABLE ?auto_617139 ) ( ON ?auto_617140 ?auto_617139 ) ( ON ?auto_617141 ?auto_617140 ) ( ON ?auto_617142 ?auto_617141 ) ( ON ?auto_617143 ?auto_617142 ) ( ON ?auto_617144 ?auto_617143 ) ( ON ?auto_617145 ?auto_617144 ) ( ON ?auto_617146 ?auto_617145 ) ( ON ?auto_617147 ?auto_617146 ) ( ON ?auto_617148 ?auto_617147 ) ( ON ?auto_617149 ?auto_617148 ) ( ON ?auto_617150 ?auto_617149 ) ( ON ?auto_617151 ?auto_617150 ) ( not ( = ?auto_617139 ?auto_617140 ) ) ( not ( = ?auto_617139 ?auto_617141 ) ) ( not ( = ?auto_617139 ?auto_617142 ) ) ( not ( = ?auto_617139 ?auto_617143 ) ) ( not ( = ?auto_617139 ?auto_617144 ) ) ( not ( = ?auto_617139 ?auto_617145 ) ) ( not ( = ?auto_617139 ?auto_617146 ) ) ( not ( = ?auto_617139 ?auto_617147 ) ) ( not ( = ?auto_617139 ?auto_617148 ) ) ( not ( = ?auto_617139 ?auto_617149 ) ) ( not ( = ?auto_617139 ?auto_617150 ) ) ( not ( = ?auto_617139 ?auto_617151 ) ) ( not ( = ?auto_617139 ?auto_617152 ) ) ( not ( = ?auto_617139 ?auto_617153 ) ) ( not ( = ?auto_617139 ?auto_617154 ) ) ( not ( = ?auto_617140 ?auto_617141 ) ) ( not ( = ?auto_617140 ?auto_617142 ) ) ( not ( = ?auto_617140 ?auto_617143 ) ) ( not ( = ?auto_617140 ?auto_617144 ) ) ( not ( = ?auto_617140 ?auto_617145 ) ) ( not ( = ?auto_617140 ?auto_617146 ) ) ( not ( = ?auto_617140 ?auto_617147 ) ) ( not ( = ?auto_617140 ?auto_617148 ) ) ( not ( = ?auto_617140 ?auto_617149 ) ) ( not ( = ?auto_617140 ?auto_617150 ) ) ( not ( = ?auto_617140 ?auto_617151 ) ) ( not ( = ?auto_617140 ?auto_617152 ) ) ( not ( = ?auto_617140 ?auto_617153 ) ) ( not ( = ?auto_617140 ?auto_617154 ) ) ( not ( = ?auto_617141 ?auto_617142 ) ) ( not ( = ?auto_617141 ?auto_617143 ) ) ( not ( = ?auto_617141 ?auto_617144 ) ) ( not ( = ?auto_617141 ?auto_617145 ) ) ( not ( = ?auto_617141 ?auto_617146 ) ) ( not ( = ?auto_617141 ?auto_617147 ) ) ( not ( = ?auto_617141 ?auto_617148 ) ) ( not ( = ?auto_617141 ?auto_617149 ) ) ( not ( = ?auto_617141 ?auto_617150 ) ) ( not ( = ?auto_617141 ?auto_617151 ) ) ( not ( = ?auto_617141 ?auto_617152 ) ) ( not ( = ?auto_617141 ?auto_617153 ) ) ( not ( = ?auto_617141 ?auto_617154 ) ) ( not ( = ?auto_617142 ?auto_617143 ) ) ( not ( = ?auto_617142 ?auto_617144 ) ) ( not ( = ?auto_617142 ?auto_617145 ) ) ( not ( = ?auto_617142 ?auto_617146 ) ) ( not ( = ?auto_617142 ?auto_617147 ) ) ( not ( = ?auto_617142 ?auto_617148 ) ) ( not ( = ?auto_617142 ?auto_617149 ) ) ( not ( = ?auto_617142 ?auto_617150 ) ) ( not ( = ?auto_617142 ?auto_617151 ) ) ( not ( = ?auto_617142 ?auto_617152 ) ) ( not ( = ?auto_617142 ?auto_617153 ) ) ( not ( = ?auto_617142 ?auto_617154 ) ) ( not ( = ?auto_617143 ?auto_617144 ) ) ( not ( = ?auto_617143 ?auto_617145 ) ) ( not ( = ?auto_617143 ?auto_617146 ) ) ( not ( = ?auto_617143 ?auto_617147 ) ) ( not ( = ?auto_617143 ?auto_617148 ) ) ( not ( = ?auto_617143 ?auto_617149 ) ) ( not ( = ?auto_617143 ?auto_617150 ) ) ( not ( = ?auto_617143 ?auto_617151 ) ) ( not ( = ?auto_617143 ?auto_617152 ) ) ( not ( = ?auto_617143 ?auto_617153 ) ) ( not ( = ?auto_617143 ?auto_617154 ) ) ( not ( = ?auto_617144 ?auto_617145 ) ) ( not ( = ?auto_617144 ?auto_617146 ) ) ( not ( = ?auto_617144 ?auto_617147 ) ) ( not ( = ?auto_617144 ?auto_617148 ) ) ( not ( = ?auto_617144 ?auto_617149 ) ) ( not ( = ?auto_617144 ?auto_617150 ) ) ( not ( = ?auto_617144 ?auto_617151 ) ) ( not ( = ?auto_617144 ?auto_617152 ) ) ( not ( = ?auto_617144 ?auto_617153 ) ) ( not ( = ?auto_617144 ?auto_617154 ) ) ( not ( = ?auto_617145 ?auto_617146 ) ) ( not ( = ?auto_617145 ?auto_617147 ) ) ( not ( = ?auto_617145 ?auto_617148 ) ) ( not ( = ?auto_617145 ?auto_617149 ) ) ( not ( = ?auto_617145 ?auto_617150 ) ) ( not ( = ?auto_617145 ?auto_617151 ) ) ( not ( = ?auto_617145 ?auto_617152 ) ) ( not ( = ?auto_617145 ?auto_617153 ) ) ( not ( = ?auto_617145 ?auto_617154 ) ) ( not ( = ?auto_617146 ?auto_617147 ) ) ( not ( = ?auto_617146 ?auto_617148 ) ) ( not ( = ?auto_617146 ?auto_617149 ) ) ( not ( = ?auto_617146 ?auto_617150 ) ) ( not ( = ?auto_617146 ?auto_617151 ) ) ( not ( = ?auto_617146 ?auto_617152 ) ) ( not ( = ?auto_617146 ?auto_617153 ) ) ( not ( = ?auto_617146 ?auto_617154 ) ) ( not ( = ?auto_617147 ?auto_617148 ) ) ( not ( = ?auto_617147 ?auto_617149 ) ) ( not ( = ?auto_617147 ?auto_617150 ) ) ( not ( = ?auto_617147 ?auto_617151 ) ) ( not ( = ?auto_617147 ?auto_617152 ) ) ( not ( = ?auto_617147 ?auto_617153 ) ) ( not ( = ?auto_617147 ?auto_617154 ) ) ( not ( = ?auto_617148 ?auto_617149 ) ) ( not ( = ?auto_617148 ?auto_617150 ) ) ( not ( = ?auto_617148 ?auto_617151 ) ) ( not ( = ?auto_617148 ?auto_617152 ) ) ( not ( = ?auto_617148 ?auto_617153 ) ) ( not ( = ?auto_617148 ?auto_617154 ) ) ( not ( = ?auto_617149 ?auto_617150 ) ) ( not ( = ?auto_617149 ?auto_617151 ) ) ( not ( = ?auto_617149 ?auto_617152 ) ) ( not ( = ?auto_617149 ?auto_617153 ) ) ( not ( = ?auto_617149 ?auto_617154 ) ) ( not ( = ?auto_617150 ?auto_617151 ) ) ( not ( = ?auto_617150 ?auto_617152 ) ) ( not ( = ?auto_617150 ?auto_617153 ) ) ( not ( = ?auto_617150 ?auto_617154 ) ) ( not ( = ?auto_617151 ?auto_617152 ) ) ( not ( = ?auto_617151 ?auto_617153 ) ) ( not ( = ?auto_617151 ?auto_617154 ) ) ( not ( = ?auto_617152 ?auto_617153 ) ) ( not ( = ?auto_617152 ?auto_617154 ) ) ( not ( = ?auto_617153 ?auto_617154 ) ) ( CLEAR ?auto_617151 ) ( ON ?auto_617152 ?auto_617153 ) ( CLEAR ?auto_617152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_617139 ?auto_617140 ?auto_617141 ?auto_617142 ?auto_617143 ?auto_617144 ?auto_617145 ?auto_617146 ?auto_617147 ?auto_617148 ?auto_617149 ?auto_617150 ?auto_617151 ?auto_617152 )
      ( MAKE-15PILE ?auto_617139 ?auto_617140 ?auto_617141 ?auto_617142 ?auto_617143 ?auto_617144 ?auto_617145 ?auto_617146 ?auto_617147 ?auto_617148 ?auto_617149 ?auto_617150 ?auto_617151 ?auto_617152 ?auto_617153 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617201 - BLOCK
      ?auto_617202 - BLOCK
      ?auto_617203 - BLOCK
      ?auto_617204 - BLOCK
      ?auto_617205 - BLOCK
      ?auto_617206 - BLOCK
      ?auto_617207 - BLOCK
      ?auto_617208 - BLOCK
      ?auto_617209 - BLOCK
      ?auto_617210 - BLOCK
      ?auto_617211 - BLOCK
      ?auto_617212 - BLOCK
      ?auto_617213 - BLOCK
      ?auto_617214 - BLOCK
      ?auto_617215 - BLOCK
    )
    :vars
    (
      ?auto_617216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617215 ?auto_617216 ) ( ON-TABLE ?auto_617201 ) ( ON ?auto_617202 ?auto_617201 ) ( ON ?auto_617203 ?auto_617202 ) ( ON ?auto_617204 ?auto_617203 ) ( ON ?auto_617205 ?auto_617204 ) ( ON ?auto_617206 ?auto_617205 ) ( ON ?auto_617207 ?auto_617206 ) ( ON ?auto_617208 ?auto_617207 ) ( ON ?auto_617209 ?auto_617208 ) ( ON ?auto_617210 ?auto_617209 ) ( ON ?auto_617211 ?auto_617210 ) ( ON ?auto_617212 ?auto_617211 ) ( not ( = ?auto_617201 ?auto_617202 ) ) ( not ( = ?auto_617201 ?auto_617203 ) ) ( not ( = ?auto_617201 ?auto_617204 ) ) ( not ( = ?auto_617201 ?auto_617205 ) ) ( not ( = ?auto_617201 ?auto_617206 ) ) ( not ( = ?auto_617201 ?auto_617207 ) ) ( not ( = ?auto_617201 ?auto_617208 ) ) ( not ( = ?auto_617201 ?auto_617209 ) ) ( not ( = ?auto_617201 ?auto_617210 ) ) ( not ( = ?auto_617201 ?auto_617211 ) ) ( not ( = ?auto_617201 ?auto_617212 ) ) ( not ( = ?auto_617201 ?auto_617213 ) ) ( not ( = ?auto_617201 ?auto_617214 ) ) ( not ( = ?auto_617201 ?auto_617215 ) ) ( not ( = ?auto_617201 ?auto_617216 ) ) ( not ( = ?auto_617202 ?auto_617203 ) ) ( not ( = ?auto_617202 ?auto_617204 ) ) ( not ( = ?auto_617202 ?auto_617205 ) ) ( not ( = ?auto_617202 ?auto_617206 ) ) ( not ( = ?auto_617202 ?auto_617207 ) ) ( not ( = ?auto_617202 ?auto_617208 ) ) ( not ( = ?auto_617202 ?auto_617209 ) ) ( not ( = ?auto_617202 ?auto_617210 ) ) ( not ( = ?auto_617202 ?auto_617211 ) ) ( not ( = ?auto_617202 ?auto_617212 ) ) ( not ( = ?auto_617202 ?auto_617213 ) ) ( not ( = ?auto_617202 ?auto_617214 ) ) ( not ( = ?auto_617202 ?auto_617215 ) ) ( not ( = ?auto_617202 ?auto_617216 ) ) ( not ( = ?auto_617203 ?auto_617204 ) ) ( not ( = ?auto_617203 ?auto_617205 ) ) ( not ( = ?auto_617203 ?auto_617206 ) ) ( not ( = ?auto_617203 ?auto_617207 ) ) ( not ( = ?auto_617203 ?auto_617208 ) ) ( not ( = ?auto_617203 ?auto_617209 ) ) ( not ( = ?auto_617203 ?auto_617210 ) ) ( not ( = ?auto_617203 ?auto_617211 ) ) ( not ( = ?auto_617203 ?auto_617212 ) ) ( not ( = ?auto_617203 ?auto_617213 ) ) ( not ( = ?auto_617203 ?auto_617214 ) ) ( not ( = ?auto_617203 ?auto_617215 ) ) ( not ( = ?auto_617203 ?auto_617216 ) ) ( not ( = ?auto_617204 ?auto_617205 ) ) ( not ( = ?auto_617204 ?auto_617206 ) ) ( not ( = ?auto_617204 ?auto_617207 ) ) ( not ( = ?auto_617204 ?auto_617208 ) ) ( not ( = ?auto_617204 ?auto_617209 ) ) ( not ( = ?auto_617204 ?auto_617210 ) ) ( not ( = ?auto_617204 ?auto_617211 ) ) ( not ( = ?auto_617204 ?auto_617212 ) ) ( not ( = ?auto_617204 ?auto_617213 ) ) ( not ( = ?auto_617204 ?auto_617214 ) ) ( not ( = ?auto_617204 ?auto_617215 ) ) ( not ( = ?auto_617204 ?auto_617216 ) ) ( not ( = ?auto_617205 ?auto_617206 ) ) ( not ( = ?auto_617205 ?auto_617207 ) ) ( not ( = ?auto_617205 ?auto_617208 ) ) ( not ( = ?auto_617205 ?auto_617209 ) ) ( not ( = ?auto_617205 ?auto_617210 ) ) ( not ( = ?auto_617205 ?auto_617211 ) ) ( not ( = ?auto_617205 ?auto_617212 ) ) ( not ( = ?auto_617205 ?auto_617213 ) ) ( not ( = ?auto_617205 ?auto_617214 ) ) ( not ( = ?auto_617205 ?auto_617215 ) ) ( not ( = ?auto_617205 ?auto_617216 ) ) ( not ( = ?auto_617206 ?auto_617207 ) ) ( not ( = ?auto_617206 ?auto_617208 ) ) ( not ( = ?auto_617206 ?auto_617209 ) ) ( not ( = ?auto_617206 ?auto_617210 ) ) ( not ( = ?auto_617206 ?auto_617211 ) ) ( not ( = ?auto_617206 ?auto_617212 ) ) ( not ( = ?auto_617206 ?auto_617213 ) ) ( not ( = ?auto_617206 ?auto_617214 ) ) ( not ( = ?auto_617206 ?auto_617215 ) ) ( not ( = ?auto_617206 ?auto_617216 ) ) ( not ( = ?auto_617207 ?auto_617208 ) ) ( not ( = ?auto_617207 ?auto_617209 ) ) ( not ( = ?auto_617207 ?auto_617210 ) ) ( not ( = ?auto_617207 ?auto_617211 ) ) ( not ( = ?auto_617207 ?auto_617212 ) ) ( not ( = ?auto_617207 ?auto_617213 ) ) ( not ( = ?auto_617207 ?auto_617214 ) ) ( not ( = ?auto_617207 ?auto_617215 ) ) ( not ( = ?auto_617207 ?auto_617216 ) ) ( not ( = ?auto_617208 ?auto_617209 ) ) ( not ( = ?auto_617208 ?auto_617210 ) ) ( not ( = ?auto_617208 ?auto_617211 ) ) ( not ( = ?auto_617208 ?auto_617212 ) ) ( not ( = ?auto_617208 ?auto_617213 ) ) ( not ( = ?auto_617208 ?auto_617214 ) ) ( not ( = ?auto_617208 ?auto_617215 ) ) ( not ( = ?auto_617208 ?auto_617216 ) ) ( not ( = ?auto_617209 ?auto_617210 ) ) ( not ( = ?auto_617209 ?auto_617211 ) ) ( not ( = ?auto_617209 ?auto_617212 ) ) ( not ( = ?auto_617209 ?auto_617213 ) ) ( not ( = ?auto_617209 ?auto_617214 ) ) ( not ( = ?auto_617209 ?auto_617215 ) ) ( not ( = ?auto_617209 ?auto_617216 ) ) ( not ( = ?auto_617210 ?auto_617211 ) ) ( not ( = ?auto_617210 ?auto_617212 ) ) ( not ( = ?auto_617210 ?auto_617213 ) ) ( not ( = ?auto_617210 ?auto_617214 ) ) ( not ( = ?auto_617210 ?auto_617215 ) ) ( not ( = ?auto_617210 ?auto_617216 ) ) ( not ( = ?auto_617211 ?auto_617212 ) ) ( not ( = ?auto_617211 ?auto_617213 ) ) ( not ( = ?auto_617211 ?auto_617214 ) ) ( not ( = ?auto_617211 ?auto_617215 ) ) ( not ( = ?auto_617211 ?auto_617216 ) ) ( not ( = ?auto_617212 ?auto_617213 ) ) ( not ( = ?auto_617212 ?auto_617214 ) ) ( not ( = ?auto_617212 ?auto_617215 ) ) ( not ( = ?auto_617212 ?auto_617216 ) ) ( not ( = ?auto_617213 ?auto_617214 ) ) ( not ( = ?auto_617213 ?auto_617215 ) ) ( not ( = ?auto_617213 ?auto_617216 ) ) ( not ( = ?auto_617214 ?auto_617215 ) ) ( not ( = ?auto_617214 ?auto_617216 ) ) ( not ( = ?auto_617215 ?auto_617216 ) ) ( ON ?auto_617214 ?auto_617215 ) ( CLEAR ?auto_617212 ) ( ON ?auto_617213 ?auto_617214 ) ( CLEAR ?auto_617213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_617201 ?auto_617202 ?auto_617203 ?auto_617204 ?auto_617205 ?auto_617206 ?auto_617207 ?auto_617208 ?auto_617209 ?auto_617210 ?auto_617211 ?auto_617212 ?auto_617213 )
      ( MAKE-15PILE ?auto_617201 ?auto_617202 ?auto_617203 ?auto_617204 ?auto_617205 ?auto_617206 ?auto_617207 ?auto_617208 ?auto_617209 ?auto_617210 ?auto_617211 ?auto_617212 ?auto_617213 ?auto_617214 ?auto_617215 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617263 - BLOCK
      ?auto_617264 - BLOCK
      ?auto_617265 - BLOCK
      ?auto_617266 - BLOCK
      ?auto_617267 - BLOCK
      ?auto_617268 - BLOCK
      ?auto_617269 - BLOCK
      ?auto_617270 - BLOCK
      ?auto_617271 - BLOCK
      ?auto_617272 - BLOCK
      ?auto_617273 - BLOCK
      ?auto_617274 - BLOCK
      ?auto_617275 - BLOCK
      ?auto_617276 - BLOCK
      ?auto_617277 - BLOCK
    )
    :vars
    (
      ?auto_617278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617277 ?auto_617278 ) ( ON-TABLE ?auto_617263 ) ( ON ?auto_617264 ?auto_617263 ) ( ON ?auto_617265 ?auto_617264 ) ( ON ?auto_617266 ?auto_617265 ) ( ON ?auto_617267 ?auto_617266 ) ( ON ?auto_617268 ?auto_617267 ) ( ON ?auto_617269 ?auto_617268 ) ( ON ?auto_617270 ?auto_617269 ) ( ON ?auto_617271 ?auto_617270 ) ( ON ?auto_617272 ?auto_617271 ) ( ON ?auto_617273 ?auto_617272 ) ( not ( = ?auto_617263 ?auto_617264 ) ) ( not ( = ?auto_617263 ?auto_617265 ) ) ( not ( = ?auto_617263 ?auto_617266 ) ) ( not ( = ?auto_617263 ?auto_617267 ) ) ( not ( = ?auto_617263 ?auto_617268 ) ) ( not ( = ?auto_617263 ?auto_617269 ) ) ( not ( = ?auto_617263 ?auto_617270 ) ) ( not ( = ?auto_617263 ?auto_617271 ) ) ( not ( = ?auto_617263 ?auto_617272 ) ) ( not ( = ?auto_617263 ?auto_617273 ) ) ( not ( = ?auto_617263 ?auto_617274 ) ) ( not ( = ?auto_617263 ?auto_617275 ) ) ( not ( = ?auto_617263 ?auto_617276 ) ) ( not ( = ?auto_617263 ?auto_617277 ) ) ( not ( = ?auto_617263 ?auto_617278 ) ) ( not ( = ?auto_617264 ?auto_617265 ) ) ( not ( = ?auto_617264 ?auto_617266 ) ) ( not ( = ?auto_617264 ?auto_617267 ) ) ( not ( = ?auto_617264 ?auto_617268 ) ) ( not ( = ?auto_617264 ?auto_617269 ) ) ( not ( = ?auto_617264 ?auto_617270 ) ) ( not ( = ?auto_617264 ?auto_617271 ) ) ( not ( = ?auto_617264 ?auto_617272 ) ) ( not ( = ?auto_617264 ?auto_617273 ) ) ( not ( = ?auto_617264 ?auto_617274 ) ) ( not ( = ?auto_617264 ?auto_617275 ) ) ( not ( = ?auto_617264 ?auto_617276 ) ) ( not ( = ?auto_617264 ?auto_617277 ) ) ( not ( = ?auto_617264 ?auto_617278 ) ) ( not ( = ?auto_617265 ?auto_617266 ) ) ( not ( = ?auto_617265 ?auto_617267 ) ) ( not ( = ?auto_617265 ?auto_617268 ) ) ( not ( = ?auto_617265 ?auto_617269 ) ) ( not ( = ?auto_617265 ?auto_617270 ) ) ( not ( = ?auto_617265 ?auto_617271 ) ) ( not ( = ?auto_617265 ?auto_617272 ) ) ( not ( = ?auto_617265 ?auto_617273 ) ) ( not ( = ?auto_617265 ?auto_617274 ) ) ( not ( = ?auto_617265 ?auto_617275 ) ) ( not ( = ?auto_617265 ?auto_617276 ) ) ( not ( = ?auto_617265 ?auto_617277 ) ) ( not ( = ?auto_617265 ?auto_617278 ) ) ( not ( = ?auto_617266 ?auto_617267 ) ) ( not ( = ?auto_617266 ?auto_617268 ) ) ( not ( = ?auto_617266 ?auto_617269 ) ) ( not ( = ?auto_617266 ?auto_617270 ) ) ( not ( = ?auto_617266 ?auto_617271 ) ) ( not ( = ?auto_617266 ?auto_617272 ) ) ( not ( = ?auto_617266 ?auto_617273 ) ) ( not ( = ?auto_617266 ?auto_617274 ) ) ( not ( = ?auto_617266 ?auto_617275 ) ) ( not ( = ?auto_617266 ?auto_617276 ) ) ( not ( = ?auto_617266 ?auto_617277 ) ) ( not ( = ?auto_617266 ?auto_617278 ) ) ( not ( = ?auto_617267 ?auto_617268 ) ) ( not ( = ?auto_617267 ?auto_617269 ) ) ( not ( = ?auto_617267 ?auto_617270 ) ) ( not ( = ?auto_617267 ?auto_617271 ) ) ( not ( = ?auto_617267 ?auto_617272 ) ) ( not ( = ?auto_617267 ?auto_617273 ) ) ( not ( = ?auto_617267 ?auto_617274 ) ) ( not ( = ?auto_617267 ?auto_617275 ) ) ( not ( = ?auto_617267 ?auto_617276 ) ) ( not ( = ?auto_617267 ?auto_617277 ) ) ( not ( = ?auto_617267 ?auto_617278 ) ) ( not ( = ?auto_617268 ?auto_617269 ) ) ( not ( = ?auto_617268 ?auto_617270 ) ) ( not ( = ?auto_617268 ?auto_617271 ) ) ( not ( = ?auto_617268 ?auto_617272 ) ) ( not ( = ?auto_617268 ?auto_617273 ) ) ( not ( = ?auto_617268 ?auto_617274 ) ) ( not ( = ?auto_617268 ?auto_617275 ) ) ( not ( = ?auto_617268 ?auto_617276 ) ) ( not ( = ?auto_617268 ?auto_617277 ) ) ( not ( = ?auto_617268 ?auto_617278 ) ) ( not ( = ?auto_617269 ?auto_617270 ) ) ( not ( = ?auto_617269 ?auto_617271 ) ) ( not ( = ?auto_617269 ?auto_617272 ) ) ( not ( = ?auto_617269 ?auto_617273 ) ) ( not ( = ?auto_617269 ?auto_617274 ) ) ( not ( = ?auto_617269 ?auto_617275 ) ) ( not ( = ?auto_617269 ?auto_617276 ) ) ( not ( = ?auto_617269 ?auto_617277 ) ) ( not ( = ?auto_617269 ?auto_617278 ) ) ( not ( = ?auto_617270 ?auto_617271 ) ) ( not ( = ?auto_617270 ?auto_617272 ) ) ( not ( = ?auto_617270 ?auto_617273 ) ) ( not ( = ?auto_617270 ?auto_617274 ) ) ( not ( = ?auto_617270 ?auto_617275 ) ) ( not ( = ?auto_617270 ?auto_617276 ) ) ( not ( = ?auto_617270 ?auto_617277 ) ) ( not ( = ?auto_617270 ?auto_617278 ) ) ( not ( = ?auto_617271 ?auto_617272 ) ) ( not ( = ?auto_617271 ?auto_617273 ) ) ( not ( = ?auto_617271 ?auto_617274 ) ) ( not ( = ?auto_617271 ?auto_617275 ) ) ( not ( = ?auto_617271 ?auto_617276 ) ) ( not ( = ?auto_617271 ?auto_617277 ) ) ( not ( = ?auto_617271 ?auto_617278 ) ) ( not ( = ?auto_617272 ?auto_617273 ) ) ( not ( = ?auto_617272 ?auto_617274 ) ) ( not ( = ?auto_617272 ?auto_617275 ) ) ( not ( = ?auto_617272 ?auto_617276 ) ) ( not ( = ?auto_617272 ?auto_617277 ) ) ( not ( = ?auto_617272 ?auto_617278 ) ) ( not ( = ?auto_617273 ?auto_617274 ) ) ( not ( = ?auto_617273 ?auto_617275 ) ) ( not ( = ?auto_617273 ?auto_617276 ) ) ( not ( = ?auto_617273 ?auto_617277 ) ) ( not ( = ?auto_617273 ?auto_617278 ) ) ( not ( = ?auto_617274 ?auto_617275 ) ) ( not ( = ?auto_617274 ?auto_617276 ) ) ( not ( = ?auto_617274 ?auto_617277 ) ) ( not ( = ?auto_617274 ?auto_617278 ) ) ( not ( = ?auto_617275 ?auto_617276 ) ) ( not ( = ?auto_617275 ?auto_617277 ) ) ( not ( = ?auto_617275 ?auto_617278 ) ) ( not ( = ?auto_617276 ?auto_617277 ) ) ( not ( = ?auto_617276 ?auto_617278 ) ) ( not ( = ?auto_617277 ?auto_617278 ) ) ( ON ?auto_617276 ?auto_617277 ) ( ON ?auto_617275 ?auto_617276 ) ( CLEAR ?auto_617273 ) ( ON ?auto_617274 ?auto_617275 ) ( CLEAR ?auto_617274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_617263 ?auto_617264 ?auto_617265 ?auto_617266 ?auto_617267 ?auto_617268 ?auto_617269 ?auto_617270 ?auto_617271 ?auto_617272 ?auto_617273 ?auto_617274 )
      ( MAKE-15PILE ?auto_617263 ?auto_617264 ?auto_617265 ?auto_617266 ?auto_617267 ?auto_617268 ?auto_617269 ?auto_617270 ?auto_617271 ?auto_617272 ?auto_617273 ?auto_617274 ?auto_617275 ?auto_617276 ?auto_617277 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617325 - BLOCK
      ?auto_617326 - BLOCK
      ?auto_617327 - BLOCK
      ?auto_617328 - BLOCK
      ?auto_617329 - BLOCK
      ?auto_617330 - BLOCK
      ?auto_617331 - BLOCK
      ?auto_617332 - BLOCK
      ?auto_617333 - BLOCK
      ?auto_617334 - BLOCK
      ?auto_617335 - BLOCK
      ?auto_617336 - BLOCK
      ?auto_617337 - BLOCK
      ?auto_617338 - BLOCK
      ?auto_617339 - BLOCK
    )
    :vars
    (
      ?auto_617340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617339 ?auto_617340 ) ( ON-TABLE ?auto_617325 ) ( ON ?auto_617326 ?auto_617325 ) ( ON ?auto_617327 ?auto_617326 ) ( ON ?auto_617328 ?auto_617327 ) ( ON ?auto_617329 ?auto_617328 ) ( ON ?auto_617330 ?auto_617329 ) ( ON ?auto_617331 ?auto_617330 ) ( ON ?auto_617332 ?auto_617331 ) ( ON ?auto_617333 ?auto_617332 ) ( ON ?auto_617334 ?auto_617333 ) ( not ( = ?auto_617325 ?auto_617326 ) ) ( not ( = ?auto_617325 ?auto_617327 ) ) ( not ( = ?auto_617325 ?auto_617328 ) ) ( not ( = ?auto_617325 ?auto_617329 ) ) ( not ( = ?auto_617325 ?auto_617330 ) ) ( not ( = ?auto_617325 ?auto_617331 ) ) ( not ( = ?auto_617325 ?auto_617332 ) ) ( not ( = ?auto_617325 ?auto_617333 ) ) ( not ( = ?auto_617325 ?auto_617334 ) ) ( not ( = ?auto_617325 ?auto_617335 ) ) ( not ( = ?auto_617325 ?auto_617336 ) ) ( not ( = ?auto_617325 ?auto_617337 ) ) ( not ( = ?auto_617325 ?auto_617338 ) ) ( not ( = ?auto_617325 ?auto_617339 ) ) ( not ( = ?auto_617325 ?auto_617340 ) ) ( not ( = ?auto_617326 ?auto_617327 ) ) ( not ( = ?auto_617326 ?auto_617328 ) ) ( not ( = ?auto_617326 ?auto_617329 ) ) ( not ( = ?auto_617326 ?auto_617330 ) ) ( not ( = ?auto_617326 ?auto_617331 ) ) ( not ( = ?auto_617326 ?auto_617332 ) ) ( not ( = ?auto_617326 ?auto_617333 ) ) ( not ( = ?auto_617326 ?auto_617334 ) ) ( not ( = ?auto_617326 ?auto_617335 ) ) ( not ( = ?auto_617326 ?auto_617336 ) ) ( not ( = ?auto_617326 ?auto_617337 ) ) ( not ( = ?auto_617326 ?auto_617338 ) ) ( not ( = ?auto_617326 ?auto_617339 ) ) ( not ( = ?auto_617326 ?auto_617340 ) ) ( not ( = ?auto_617327 ?auto_617328 ) ) ( not ( = ?auto_617327 ?auto_617329 ) ) ( not ( = ?auto_617327 ?auto_617330 ) ) ( not ( = ?auto_617327 ?auto_617331 ) ) ( not ( = ?auto_617327 ?auto_617332 ) ) ( not ( = ?auto_617327 ?auto_617333 ) ) ( not ( = ?auto_617327 ?auto_617334 ) ) ( not ( = ?auto_617327 ?auto_617335 ) ) ( not ( = ?auto_617327 ?auto_617336 ) ) ( not ( = ?auto_617327 ?auto_617337 ) ) ( not ( = ?auto_617327 ?auto_617338 ) ) ( not ( = ?auto_617327 ?auto_617339 ) ) ( not ( = ?auto_617327 ?auto_617340 ) ) ( not ( = ?auto_617328 ?auto_617329 ) ) ( not ( = ?auto_617328 ?auto_617330 ) ) ( not ( = ?auto_617328 ?auto_617331 ) ) ( not ( = ?auto_617328 ?auto_617332 ) ) ( not ( = ?auto_617328 ?auto_617333 ) ) ( not ( = ?auto_617328 ?auto_617334 ) ) ( not ( = ?auto_617328 ?auto_617335 ) ) ( not ( = ?auto_617328 ?auto_617336 ) ) ( not ( = ?auto_617328 ?auto_617337 ) ) ( not ( = ?auto_617328 ?auto_617338 ) ) ( not ( = ?auto_617328 ?auto_617339 ) ) ( not ( = ?auto_617328 ?auto_617340 ) ) ( not ( = ?auto_617329 ?auto_617330 ) ) ( not ( = ?auto_617329 ?auto_617331 ) ) ( not ( = ?auto_617329 ?auto_617332 ) ) ( not ( = ?auto_617329 ?auto_617333 ) ) ( not ( = ?auto_617329 ?auto_617334 ) ) ( not ( = ?auto_617329 ?auto_617335 ) ) ( not ( = ?auto_617329 ?auto_617336 ) ) ( not ( = ?auto_617329 ?auto_617337 ) ) ( not ( = ?auto_617329 ?auto_617338 ) ) ( not ( = ?auto_617329 ?auto_617339 ) ) ( not ( = ?auto_617329 ?auto_617340 ) ) ( not ( = ?auto_617330 ?auto_617331 ) ) ( not ( = ?auto_617330 ?auto_617332 ) ) ( not ( = ?auto_617330 ?auto_617333 ) ) ( not ( = ?auto_617330 ?auto_617334 ) ) ( not ( = ?auto_617330 ?auto_617335 ) ) ( not ( = ?auto_617330 ?auto_617336 ) ) ( not ( = ?auto_617330 ?auto_617337 ) ) ( not ( = ?auto_617330 ?auto_617338 ) ) ( not ( = ?auto_617330 ?auto_617339 ) ) ( not ( = ?auto_617330 ?auto_617340 ) ) ( not ( = ?auto_617331 ?auto_617332 ) ) ( not ( = ?auto_617331 ?auto_617333 ) ) ( not ( = ?auto_617331 ?auto_617334 ) ) ( not ( = ?auto_617331 ?auto_617335 ) ) ( not ( = ?auto_617331 ?auto_617336 ) ) ( not ( = ?auto_617331 ?auto_617337 ) ) ( not ( = ?auto_617331 ?auto_617338 ) ) ( not ( = ?auto_617331 ?auto_617339 ) ) ( not ( = ?auto_617331 ?auto_617340 ) ) ( not ( = ?auto_617332 ?auto_617333 ) ) ( not ( = ?auto_617332 ?auto_617334 ) ) ( not ( = ?auto_617332 ?auto_617335 ) ) ( not ( = ?auto_617332 ?auto_617336 ) ) ( not ( = ?auto_617332 ?auto_617337 ) ) ( not ( = ?auto_617332 ?auto_617338 ) ) ( not ( = ?auto_617332 ?auto_617339 ) ) ( not ( = ?auto_617332 ?auto_617340 ) ) ( not ( = ?auto_617333 ?auto_617334 ) ) ( not ( = ?auto_617333 ?auto_617335 ) ) ( not ( = ?auto_617333 ?auto_617336 ) ) ( not ( = ?auto_617333 ?auto_617337 ) ) ( not ( = ?auto_617333 ?auto_617338 ) ) ( not ( = ?auto_617333 ?auto_617339 ) ) ( not ( = ?auto_617333 ?auto_617340 ) ) ( not ( = ?auto_617334 ?auto_617335 ) ) ( not ( = ?auto_617334 ?auto_617336 ) ) ( not ( = ?auto_617334 ?auto_617337 ) ) ( not ( = ?auto_617334 ?auto_617338 ) ) ( not ( = ?auto_617334 ?auto_617339 ) ) ( not ( = ?auto_617334 ?auto_617340 ) ) ( not ( = ?auto_617335 ?auto_617336 ) ) ( not ( = ?auto_617335 ?auto_617337 ) ) ( not ( = ?auto_617335 ?auto_617338 ) ) ( not ( = ?auto_617335 ?auto_617339 ) ) ( not ( = ?auto_617335 ?auto_617340 ) ) ( not ( = ?auto_617336 ?auto_617337 ) ) ( not ( = ?auto_617336 ?auto_617338 ) ) ( not ( = ?auto_617336 ?auto_617339 ) ) ( not ( = ?auto_617336 ?auto_617340 ) ) ( not ( = ?auto_617337 ?auto_617338 ) ) ( not ( = ?auto_617337 ?auto_617339 ) ) ( not ( = ?auto_617337 ?auto_617340 ) ) ( not ( = ?auto_617338 ?auto_617339 ) ) ( not ( = ?auto_617338 ?auto_617340 ) ) ( not ( = ?auto_617339 ?auto_617340 ) ) ( ON ?auto_617338 ?auto_617339 ) ( ON ?auto_617337 ?auto_617338 ) ( ON ?auto_617336 ?auto_617337 ) ( CLEAR ?auto_617334 ) ( ON ?auto_617335 ?auto_617336 ) ( CLEAR ?auto_617335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_617325 ?auto_617326 ?auto_617327 ?auto_617328 ?auto_617329 ?auto_617330 ?auto_617331 ?auto_617332 ?auto_617333 ?auto_617334 ?auto_617335 )
      ( MAKE-15PILE ?auto_617325 ?auto_617326 ?auto_617327 ?auto_617328 ?auto_617329 ?auto_617330 ?auto_617331 ?auto_617332 ?auto_617333 ?auto_617334 ?auto_617335 ?auto_617336 ?auto_617337 ?auto_617338 ?auto_617339 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617387 - BLOCK
      ?auto_617388 - BLOCK
      ?auto_617389 - BLOCK
      ?auto_617390 - BLOCK
      ?auto_617391 - BLOCK
      ?auto_617392 - BLOCK
      ?auto_617393 - BLOCK
      ?auto_617394 - BLOCK
      ?auto_617395 - BLOCK
      ?auto_617396 - BLOCK
      ?auto_617397 - BLOCK
      ?auto_617398 - BLOCK
      ?auto_617399 - BLOCK
      ?auto_617400 - BLOCK
      ?auto_617401 - BLOCK
    )
    :vars
    (
      ?auto_617402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617401 ?auto_617402 ) ( ON-TABLE ?auto_617387 ) ( ON ?auto_617388 ?auto_617387 ) ( ON ?auto_617389 ?auto_617388 ) ( ON ?auto_617390 ?auto_617389 ) ( ON ?auto_617391 ?auto_617390 ) ( ON ?auto_617392 ?auto_617391 ) ( ON ?auto_617393 ?auto_617392 ) ( ON ?auto_617394 ?auto_617393 ) ( ON ?auto_617395 ?auto_617394 ) ( not ( = ?auto_617387 ?auto_617388 ) ) ( not ( = ?auto_617387 ?auto_617389 ) ) ( not ( = ?auto_617387 ?auto_617390 ) ) ( not ( = ?auto_617387 ?auto_617391 ) ) ( not ( = ?auto_617387 ?auto_617392 ) ) ( not ( = ?auto_617387 ?auto_617393 ) ) ( not ( = ?auto_617387 ?auto_617394 ) ) ( not ( = ?auto_617387 ?auto_617395 ) ) ( not ( = ?auto_617387 ?auto_617396 ) ) ( not ( = ?auto_617387 ?auto_617397 ) ) ( not ( = ?auto_617387 ?auto_617398 ) ) ( not ( = ?auto_617387 ?auto_617399 ) ) ( not ( = ?auto_617387 ?auto_617400 ) ) ( not ( = ?auto_617387 ?auto_617401 ) ) ( not ( = ?auto_617387 ?auto_617402 ) ) ( not ( = ?auto_617388 ?auto_617389 ) ) ( not ( = ?auto_617388 ?auto_617390 ) ) ( not ( = ?auto_617388 ?auto_617391 ) ) ( not ( = ?auto_617388 ?auto_617392 ) ) ( not ( = ?auto_617388 ?auto_617393 ) ) ( not ( = ?auto_617388 ?auto_617394 ) ) ( not ( = ?auto_617388 ?auto_617395 ) ) ( not ( = ?auto_617388 ?auto_617396 ) ) ( not ( = ?auto_617388 ?auto_617397 ) ) ( not ( = ?auto_617388 ?auto_617398 ) ) ( not ( = ?auto_617388 ?auto_617399 ) ) ( not ( = ?auto_617388 ?auto_617400 ) ) ( not ( = ?auto_617388 ?auto_617401 ) ) ( not ( = ?auto_617388 ?auto_617402 ) ) ( not ( = ?auto_617389 ?auto_617390 ) ) ( not ( = ?auto_617389 ?auto_617391 ) ) ( not ( = ?auto_617389 ?auto_617392 ) ) ( not ( = ?auto_617389 ?auto_617393 ) ) ( not ( = ?auto_617389 ?auto_617394 ) ) ( not ( = ?auto_617389 ?auto_617395 ) ) ( not ( = ?auto_617389 ?auto_617396 ) ) ( not ( = ?auto_617389 ?auto_617397 ) ) ( not ( = ?auto_617389 ?auto_617398 ) ) ( not ( = ?auto_617389 ?auto_617399 ) ) ( not ( = ?auto_617389 ?auto_617400 ) ) ( not ( = ?auto_617389 ?auto_617401 ) ) ( not ( = ?auto_617389 ?auto_617402 ) ) ( not ( = ?auto_617390 ?auto_617391 ) ) ( not ( = ?auto_617390 ?auto_617392 ) ) ( not ( = ?auto_617390 ?auto_617393 ) ) ( not ( = ?auto_617390 ?auto_617394 ) ) ( not ( = ?auto_617390 ?auto_617395 ) ) ( not ( = ?auto_617390 ?auto_617396 ) ) ( not ( = ?auto_617390 ?auto_617397 ) ) ( not ( = ?auto_617390 ?auto_617398 ) ) ( not ( = ?auto_617390 ?auto_617399 ) ) ( not ( = ?auto_617390 ?auto_617400 ) ) ( not ( = ?auto_617390 ?auto_617401 ) ) ( not ( = ?auto_617390 ?auto_617402 ) ) ( not ( = ?auto_617391 ?auto_617392 ) ) ( not ( = ?auto_617391 ?auto_617393 ) ) ( not ( = ?auto_617391 ?auto_617394 ) ) ( not ( = ?auto_617391 ?auto_617395 ) ) ( not ( = ?auto_617391 ?auto_617396 ) ) ( not ( = ?auto_617391 ?auto_617397 ) ) ( not ( = ?auto_617391 ?auto_617398 ) ) ( not ( = ?auto_617391 ?auto_617399 ) ) ( not ( = ?auto_617391 ?auto_617400 ) ) ( not ( = ?auto_617391 ?auto_617401 ) ) ( not ( = ?auto_617391 ?auto_617402 ) ) ( not ( = ?auto_617392 ?auto_617393 ) ) ( not ( = ?auto_617392 ?auto_617394 ) ) ( not ( = ?auto_617392 ?auto_617395 ) ) ( not ( = ?auto_617392 ?auto_617396 ) ) ( not ( = ?auto_617392 ?auto_617397 ) ) ( not ( = ?auto_617392 ?auto_617398 ) ) ( not ( = ?auto_617392 ?auto_617399 ) ) ( not ( = ?auto_617392 ?auto_617400 ) ) ( not ( = ?auto_617392 ?auto_617401 ) ) ( not ( = ?auto_617392 ?auto_617402 ) ) ( not ( = ?auto_617393 ?auto_617394 ) ) ( not ( = ?auto_617393 ?auto_617395 ) ) ( not ( = ?auto_617393 ?auto_617396 ) ) ( not ( = ?auto_617393 ?auto_617397 ) ) ( not ( = ?auto_617393 ?auto_617398 ) ) ( not ( = ?auto_617393 ?auto_617399 ) ) ( not ( = ?auto_617393 ?auto_617400 ) ) ( not ( = ?auto_617393 ?auto_617401 ) ) ( not ( = ?auto_617393 ?auto_617402 ) ) ( not ( = ?auto_617394 ?auto_617395 ) ) ( not ( = ?auto_617394 ?auto_617396 ) ) ( not ( = ?auto_617394 ?auto_617397 ) ) ( not ( = ?auto_617394 ?auto_617398 ) ) ( not ( = ?auto_617394 ?auto_617399 ) ) ( not ( = ?auto_617394 ?auto_617400 ) ) ( not ( = ?auto_617394 ?auto_617401 ) ) ( not ( = ?auto_617394 ?auto_617402 ) ) ( not ( = ?auto_617395 ?auto_617396 ) ) ( not ( = ?auto_617395 ?auto_617397 ) ) ( not ( = ?auto_617395 ?auto_617398 ) ) ( not ( = ?auto_617395 ?auto_617399 ) ) ( not ( = ?auto_617395 ?auto_617400 ) ) ( not ( = ?auto_617395 ?auto_617401 ) ) ( not ( = ?auto_617395 ?auto_617402 ) ) ( not ( = ?auto_617396 ?auto_617397 ) ) ( not ( = ?auto_617396 ?auto_617398 ) ) ( not ( = ?auto_617396 ?auto_617399 ) ) ( not ( = ?auto_617396 ?auto_617400 ) ) ( not ( = ?auto_617396 ?auto_617401 ) ) ( not ( = ?auto_617396 ?auto_617402 ) ) ( not ( = ?auto_617397 ?auto_617398 ) ) ( not ( = ?auto_617397 ?auto_617399 ) ) ( not ( = ?auto_617397 ?auto_617400 ) ) ( not ( = ?auto_617397 ?auto_617401 ) ) ( not ( = ?auto_617397 ?auto_617402 ) ) ( not ( = ?auto_617398 ?auto_617399 ) ) ( not ( = ?auto_617398 ?auto_617400 ) ) ( not ( = ?auto_617398 ?auto_617401 ) ) ( not ( = ?auto_617398 ?auto_617402 ) ) ( not ( = ?auto_617399 ?auto_617400 ) ) ( not ( = ?auto_617399 ?auto_617401 ) ) ( not ( = ?auto_617399 ?auto_617402 ) ) ( not ( = ?auto_617400 ?auto_617401 ) ) ( not ( = ?auto_617400 ?auto_617402 ) ) ( not ( = ?auto_617401 ?auto_617402 ) ) ( ON ?auto_617400 ?auto_617401 ) ( ON ?auto_617399 ?auto_617400 ) ( ON ?auto_617398 ?auto_617399 ) ( ON ?auto_617397 ?auto_617398 ) ( CLEAR ?auto_617395 ) ( ON ?auto_617396 ?auto_617397 ) ( CLEAR ?auto_617396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_617387 ?auto_617388 ?auto_617389 ?auto_617390 ?auto_617391 ?auto_617392 ?auto_617393 ?auto_617394 ?auto_617395 ?auto_617396 )
      ( MAKE-15PILE ?auto_617387 ?auto_617388 ?auto_617389 ?auto_617390 ?auto_617391 ?auto_617392 ?auto_617393 ?auto_617394 ?auto_617395 ?auto_617396 ?auto_617397 ?auto_617398 ?auto_617399 ?auto_617400 ?auto_617401 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617449 - BLOCK
      ?auto_617450 - BLOCK
      ?auto_617451 - BLOCK
      ?auto_617452 - BLOCK
      ?auto_617453 - BLOCK
      ?auto_617454 - BLOCK
      ?auto_617455 - BLOCK
      ?auto_617456 - BLOCK
      ?auto_617457 - BLOCK
      ?auto_617458 - BLOCK
      ?auto_617459 - BLOCK
      ?auto_617460 - BLOCK
      ?auto_617461 - BLOCK
      ?auto_617462 - BLOCK
      ?auto_617463 - BLOCK
    )
    :vars
    (
      ?auto_617464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617463 ?auto_617464 ) ( ON-TABLE ?auto_617449 ) ( ON ?auto_617450 ?auto_617449 ) ( ON ?auto_617451 ?auto_617450 ) ( ON ?auto_617452 ?auto_617451 ) ( ON ?auto_617453 ?auto_617452 ) ( ON ?auto_617454 ?auto_617453 ) ( ON ?auto_617455 ?auto_617454 ) ( ON ?auto_617456 ?auto_617455 ) ( not ( = ?auto_617449 ?auto_617450 ) ) ( not ( = ?auto_617449 ?auto_617451 ) ) ( not ( = ?auto_617449 ?auto_617452 ) ) ( not ( = ?auto_617449 ?auto_617453 ) ) ( not ( = ?auto_617449 ?auto_617454 ) ) ( not ( = ?auto_617449 ?auto_617455 ) ) ( not ( = ?auto_617449 ?auto_617456 ) ) ( not ( = ?auto_617449 ?auto_617457 ) ) ( not ( = ?auto_617449 ?auto_617458 ) ) ( not ( = ?auto_617449 ?auto_617459 ) ) ( not ( = ?auto_617449 ?auto_617460 ) ) ( not ( = ?auto_617449 ?auto_617461 ) ) ( not ( = ?auto_617449 ?auto_617462 ) ) ( not ( = ?auto_617449 ?auto_617463 ) ) ( not ( = ?auto_617449 ?auto_617464 ) ) ( not ( = ?auto_617450 ?auto_617451 ) ) ( not ( = ?auto_617450 ?auto_617452 ) ) ( not ( = ?auto_617450 ?auto_617453 ) ) ( not ( = ?auto_617450 ?auto_617454 ) ) ( not ( = ?auto_617450 ?auto_617455 ) ) ( not ( = ?auto_617450 ?auto_617456 ) ) ( not ( = ?auto_617450 ?auto_617457 ) ) ( not ( = ?auto_617450 ?auto_617458 ) ) ( not ( = ?auto_617450 ?auto_617459 ) ) ( not ( = ?auto_617450 ?auto_617460 ) ) ( not ( = ?auto_617450 ?auto_617461 ) ) ( not ( = ?auto_617450 ?auto_617462 ) ) ( not ( = ?auto_617450 ?auto_617463 ) ) ( not ( = ?auto_617450 ?auto_617464 ) ) ( not ( = ?auto_617451 ?auto_617452 ) ) ( not ( = ?auto_617451 ?auto_617453 ) ) ( not ( = ?auto_617451 ?auto_617454 ) ) ( not ( = ?auto_617451 ?auto_617455 ) ) ( not ( = ?auto_617451 ?auto_617456 ) ) ( not ( = ?auto_617451 ?auto_617457 ) ) ( not ( = ?auto_617451 ?auto_617458 ) ) ( not ( = ?auto_617451 ?auto_617459 ) ) ( not ( = ?auto_617451 ?auto_617460 ) ) ( not ( = ?auto_617451 ?auto_617461 ) ) ( not ( = ?auto_617451 ?auto_617462 ) ) ( not ( = ?auto_617451 ?auto_617463 ) ) ( not ( = ?auto_617451 ?auto_617464 ) ) ( not ( = ?auto_617452 ?auto_617453 ) ) ( not ( = ?auto_617452 ?auto_617454 ) ) ( not ( = ?auto_617452 ?auto_617455 ) ) ( not ( = ?auto_617452 ?auto_617456 ) ) ( not ( = ?auto_617452 ?auto_617457 ) ) ( not ( = ?auto_617452 ?auto_617458 ) ) ( not ( = ?auto_617452 ?auto_617459 ) ) ( not ( = ?auto_617452 ?auto_617460 ) ) ( not ( = ?auto_617452 ?auto_617461 ) ) ( not ( = ?auto_617452 ?auto_617462 ) ) ( not ( = ?auto_617452 ?auto_617463 ) ) ( not ( = ?auto_617452 ?auto_617464 ) ) ( not ( = ?auto_617453 ?auto_617454 ) ) ( not ( = ?auto_617453 ?auto_617455 ) ) ( not ( = ?auto_617453 ?auto_617456 ) ) ( not ( = ?auto_617453 ?auto_617457 ) ) ( not ( = ?auto_617453 ?auto_617458 ) ) ( not ( = ?auto_617453 ?auto_617459 ) ) ( not ( = ?auto_617453 ?auto_617460 ) ) ( not ( = ?auto_617453 ?auto_617461 ) ) ( not ( = ?auto_617453 ?auto_617462 ) ) ( not ( = ?auto_617453 ?auto_617463 ) ) ( not ( = ?auto_617453 ?auto_617464 ) ) ( not ( = ?auto_617454 ?auto_617455 ) ) ( not ( = ?auto_617454 ?auto_617456 ) ) ( not ( = ?auto_617454 ?auto_617457 ) ) ( not ( = ?auto_617454 ?auto_617458 ) ) ( not ( = ?auto_617454 ?auto_617459 ) ) ( not ( = ?auto_617454 ?auto_617460 ) ) ( not ( = ?auto_617454 ?auto_617461 ) ) ( not ( = ?auto_617454 ?auto_617462 ) ) ( not ( = ?auto_617454 ?auto_617463 ) ) ( not ( = ?auto_617454 ?auto_617464 ) ) ( not ( = ?auto_617455 ?auto_617456 ) ) ( not ( = ?auto_617455 ?auto_617457 ) ) ( not ( = ?auto_617455 ?auto_617458 ) ) ( not ( = ?auto_617455 ?auto_617459 ) ) ( not ( = ?auto_617455 ?auto_617460 ) ) ( not ( = ?auto_617455 ?auto_617461 ) ) ( not ( = ?auto_617455 ?auto_617462 ) ) ( not ( = ?auto_617455 ?auto_617463 ) ) ( not ( = ?auto_617455 ?auto_617464 ) ) ( not ( = ?auto_617456 ?auto_617457 ) ) ( not ( = ?auto_617456 ?auto_617458 ) ) ( not ( = ?auto_617456 ?auto_617459 ) ) ( not ( = ?auto_617456 ?auto_617460 ) ) ( not ( = ?auto_617456 ?auto_617461 ) ) ( not ( = ?auto_617456 ?auto_617462 ) ) ( not ( = ?auto_617456 ?auto_617463 ) ) ( not ( = ?auto_617456 ?auto_617464 ) ) ( not ( = ?auto_617457 ?auto_617458 ) ) ( not ( = ?auto_617457 ?auto_617459 ) ) ( not ( = ?auto_617457 ?auto_617460 ) ) ( not ( = ?auto_617457 ?auto_617461 ) ) ( not ( = ?auto_617457 ?auto_617462 ) ) ( not ( = ?auto_617457 ?auto_617463 ) ) ( not ( = ?auto_617457 ?auto_617464 ) ) ( not ( = ?auto_617458 ?auto_617459 ) ) ( not ( = ?auto_617458 ?auto_617460 ) ) ( not ( = ?auto_617458 ?auto_617461 ) ) ( not ( = ?auto_617458 ?auto_617462 ) ) ( not ( = ?auto_617458 ?auto_617463 ) ) ( not ( = ?auto_617458 ?auto_617464 ) ) ( not ( = ?auto_617459 ?auto_617460 ) ) ( not ( = ?auto_617459 ?auto_617461 ) ) ( not ( = ?auto_617459 ?auto_617462 ) ) ( not ( = ?auto_617459 ?auto_617463 ) ) ( not ( = ?auto_617459 ?auto_617464 ) ) ( not ( = ?auto_617460 ?auto_617461 ) ) ( not ( = ?auto_617460 ?auto_617462 ) ) ( not ( = ?auto_617460 ?auto_617463 ) ) ( not ( = ?auto_617460 ?auto_617464 ) ) ( not ( = ?auto_617461 ?auto_617462 ) ) ( not ( = ?auto_617461 ?auto_617463 ) ) ( not ( = ?auto_617461 ?auto_617464 ) ) ( not ( = ?auto_617462 ?auto_617463 ) ) ( not ( = ?auto_617462 ?auto_617464 ) ) ( not ( = ?auto_617463 ?auto_617464 ) ) ( ON ?auto_617462 ?auto_617463 ) ( ON ?auto_617461 ?auto_617462 ) ( ON ?auto_617460 ?auto_617461 ) ( ON ?auto_617459 ?auto_617460 ) ( ON ?auto_617458 ?auto_617459 ) ( CLEAR ?auto_617456 ) ( ON ?auto_617457 ?auto_617458 ) ( CLEAR ?auto_617457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_617449 ?auto_617450 ?auto_617451 ?auto_617452 ?auto_617453 ?auto_617454 ?auto_617455 ?auto_617456 ?auto_617457 )
      ( MAKE-15PILE ?auto_617449 ?auto_617450 ?auto_617451 ?auto_617452 ?auto_617453 ?auto_617454 ?auto_617455 ?auto_617456 ?auto_617457 ?auto_617458 ?auto_617459 ?auto_617460 ?auto_617461 ?auto_617462 ?auto_617463 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617511 - BLOCK
      ?auto_617512 - BLOCK
      ?auto_617513 - BLOCK
      ?auto_617514 - BLOCK
      ?auto_617515 - BLOCK
      ?auto_617516 - BLOCK
      ?auto_617517 - BLOCK
      ?auto_617518 - BLOCK
      ?auto_617519 - BLOCK
      ?auto_617520 - BLOCK
      ?auto_617521 - BLOCK
      ?auto_617522 - BLOCK
      ?auto_617523 - BLOCK
      ?auto_617524 - BLOCK
      ?auto_617525 - BLOCK
    )
    :vars
    (
      ?auto_617526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617525 ?auto_617526 ) ( ON-TABLE ?auto_617511 ) ( ON ?auto_617512 ?auto_617511 ) ( ON ?auto_617513 ?auto_617512 ) ( ON ?auto_617514 ?auto_617513 ) ( ON ?auto_617515 ?auto_617514 ) ( ON ?auto_617516 ?auto_617515 ) ( ON ?auto_617517 ?auto_617516 ) ( not ( = ?auto_617511 ?auto_617512 ) ) ( not ( = ?auto_617511 ?auto_617513 ) ) ( not ( = ?auto_617511 ?auto_617514 ) ) ( not ( = ?auto_617511 ?auto_617515 ) ) ( not ( = ?auto_617511 ?auto_617516 ) ) ( not ( = ?auto_617511 ?auto_617517 ) ) ( not ( = ?auto_617511 ?auto_617518 ) ) ( not ( = ?auto_617511 ?auto_617519 ) ) ( not ( = ?auto_617511 ?auto_617520 ) ) ( not ( = ?auto_617511 ?auto_617521 ) ) ( not ( = ?auto_617511 ?auto_617522 ) ) ( not ( = ?auto_617511 ?auto_617523 ) ) ( not ( = ?auto_617511 ?auto_617524 ) ) ( not ( = ?auto_617511 ?auto_617525 ) ) ( not ( = ?auto_617511 ?auto_617526 ) ) ( not ( = ?auto_617512 ?auto_617513 ) ) ( not ( = ?auto_617512 ?auto_617514 ) ) ( not ( = ?auto_617512 ?auto_617515 ) ) ( not ( = ?auto_617512 ?auto_617516 ) ) ( not ( = ?auto_617512 ?auto_617517 ) ) ( not ( = ?auto_617512 ?auto_617518 ) ) ( not ( = ?auto_617512 ?auto_617519 ) ) ( not ( = ?auto_617512 ?auto_617520 ) ) ( not ( = ?auto_617512 ?auto_617521 ) ) ( not ( = ?auto_617512 ?auto_617522 ) ) ( not ( = ?auto_617512 ?auto_617523 ) ) ( not ( = ?auto_617512 ?auto_617524 ) ) ( not ( = ?auto_617512 ?auto_617525 ) ) ( not ( = ?auto_617512 ?auto_617526 ) ) ( not ( = ?auto_617513 ?auto_617514 ) ) ( not ( = ?auto_617513 ?auto_617515 ) ) ( not ( = ?auto_617513 ?auto_617516 ) ) ( not ( = ?auto_617513 ?auto_617517 ) ) ( not ( = ?auto_617513 ?auto_617518 ) ) ( not ( = ?auto_617513 ?auto_617519 ) ) ( not ( = ?auto_617513 ?auto_617520 ) ) ( not ( = ?auto_617513 ?auto_617521 ) ) ( not ( = ?auto_617513 ?auto_617522 ) ) ( not ( = ?auto_617513 ?auto_617523 ) ) ( not ( = ?auto_617513 ?auto_617524 ) ) ( not ( = ?auto_617513 ?auto_617525 ) ) ( not ( = ?auto_617513 ?auto_617526 ) ) ( not ( = ?auto_617514 ?auto_617515 ) ) ( not ( = ?auto_617514 ?auto_617516 ) ) ( not ( = ?auto_617514 ?auto_617517 ) ) ( not ( = ?auto_617514 ?auto_617518 ) ) ( not ( = ?auto_617514 ?auto_617519 ) ) ( not ( = ?auto_617514 ?auto_617520 ) ) ( not ( = ?auto_617514 ?auto_617521 ) ) ( not ( = ?auto_617514 ?auto_617522 ) ) ( not ( = ?auto_617514 ?auto_617523 ) ) ( not ( = ?auto_617514 ?auto_617524 ) ) ( not ( = ?auto_617514 ?auto_617525 ) ) ( not ( = ?auto_617514 ?auto_617526 ) ) ( not ( = ?auto_617515 ?auto_617516 ) ) ( not ( = ?auto_617515 ?auto_617517 ) ) ( not ( = ?auto_617515 ?auto_617518 ) ) ( not ( = ?auto_617515 ?auto_617519 ) ) ( not ( = ?auto_617515 ?auto_617520 ) ) ( not ( = ?auto_617515 ?auto_617521 ) ) ( not ( = ?auto_617515 ?auto_617522 ) ) ( not ( = ?auto_617515 ?auto_617523 ) ) ( not ( = ?auto_617515 ?auto_617524 ) ) ( not ( = ?auto_617515 ?auto_617525 ) ) ( not ( = ?auto_617515 ?auto_617526 ) ) ( not ( = ?auto_617516 ?auto_617517 ) ) ( not ( = ?auto_617516 ?auto_617518 ) ) ( not ( = ?auto_617516 ?auto_617519 ) ) ( not ( = ?auto_617516 ?auto_617520 ) ) ( not ( = ?auto_617516 ?auto_617521 ) ) ( not ( = ?auto_617516 ?auto_617522 ) ) ( not ( = ?auto_617516 ?auto_617523 ) ) ( not ( = ?auto_617516 ?auto_617524 ) ) ( not ( = ?auto_617516 ?auto_617525 ) ) ( not ( = ?auto_617516 ?auto_617526 ) ) ( not ( = ?auto_617517 ?auto_617518 ) ) ( not ( = ?auto_617517 ?auto_617519 ) ) ( not ( = ?auto_617517 ?auto_617520 ) ) ( not ( = ?auto_617517 ?auto_617521 ) ) ( not ( = ?auto_617517 ?auto_617522 ) ) ( not ( = ?auto_617517 ?auto_617523 ) ) ( not ( = ?auto_617517 ?auto_617524 ) ) ( not ( = ?auto_617517 ?auto_617525 ) ) ( not ( = ?auto_617517 ?auto_617526 ) ) ( not ( = ?auto_617518 ?auto_617519 ) ) ( not ( = ?auto_617518 ?auto_617520 ) ) ( not ( = ?auto_617518 ?auto_617521 ) ) ( not ( = ?auto_617518 ?auto_617522 ) ) ( not ( = ?auto_617518 ?auto_617523 ) ) ( not ( = ?auto_617518 ?auto_617524 ) ) ( not ( = ?auto_617518 ?auto_617525 ) ) ( not ( = ?auto_617518 ?auto_617526 ) ) ( not ( = ?auto_617519 ?auto_617520 ) ) ( not ( = ?auto_617519 ?auto_617521 ) ) ( not ( = ?auto_617519 ?auto_617522 ) ) ( not ( = ?auto_617519 ?auto_617523 ) ) ( not ( = ?auto_617519 ?auto_617524 ) ) ( not ( = ?auto_617519 ?auto_617525 ) ) ( not ( = ?auto_617519 ?auto_617526 ) ) ( not ( = ?auto_617520 ?auto_617521 ) ) ( not ( = ?auto_617520 ?auto_617522 ) ) ( not ( = ?auto_617520 ?auto_617523 ) ) ( not ( = ?auto_617520 ?auto_617524 ) ) ( not ( = ?auto_617520 ?auto_617525 ) ) ( not ( = ?auto_617520 ?auto_617526 ) ) ( not ( = ?auto_617521 ?auto_617522 ) ) ( not ( = ?auto_617521 ?auto_617523 ) ) ( not ( = ?auto_617521 ?auto_617524 ) ) ( not ( = ?auto_617521 ?auto_617525 ) ) ( not ( = ?auto_617521 ?auto_617526 ) ) ( not ( = ?auto_617522 ?auto_617523 ) ) ( not ( = ?auto_617522 ?auto_617524 ) ) ( not ( = ?auto_617522 ?auto_617525 ) ) ( not ( = ?auto_617522 ?auto_617526 ) ) ( not ( = ?auto_617523 ?auto_617524 ) ) ( not ( = ?auto_617523 ?auto_617525 ) ) ( not ( = ?auto_617523 ?auto_617526 ) ) ( not ( = ?auto_617524 ?auto_617525 ) ) ( not ( = ?auto_617524 ?auto_617526 ) ) ( not ( = ?auto_617525 ?auto_617526 ) ) ( ON ?auto_617524 ?auto_617525 ) ( ON ?auto_617523 ?auto_617524 ) ( ON ?auto_617522 ?auto_617523 ) ( ON ?auto_617521 ?auto_617522 ) ( ON ?auto_617520 ?auto_617521 ) ( ON ?auto_617519 ?auto_617520 ) ( CLEAR ?auto_617517 ) ( ON ?auto_617518 ?auto_617519 ) ( CLEAR ?auto_617518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_617511 ?auto_617512 ?auto_617513 ?auto_617514 ?auto_617515 ?auto_617516 ?auto_617517 ?auto_617518 )
      ( MAKE-15PILE ?auto_617511 ?auto_617512 ?auto_617513 ?auto_617514 ?auto_617515 ?auto_617516 ?auto_617517 ?auto_617518 ?auto_617519 ?auto_617520 ?auto_617521 ?auto_617522 ?auto_617523 ?auto_617524 ?auto_617525 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617573 - BLOCK
      ?auto_617574 - BLOCK
      ?auto_617575 - BLOCK
      ?auto_617576 - BLOCK
      ?auto_617577 - BLOCK
      ?auto_617578 - BLOCK
      ?auto_617579 - BLOCK
      ?auto_617580 - BLOCK
      ?auto_617581 - BLOCK
      ?auto_617582 - BLOCK
      ?auto_617583 - BLOCK
      ?auto_617584 - BLOCK
      ?auto_617585 - BLOCK
      ?auto_617586 - BLOCK
      ?auto_617587 - BLOCK
    )
    :vars
    (
      ?auto_617588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617587 ?auto_617588 ) ( ON-TABLE ?auto_617573 ) ( ON ?auto_617574 ?auto_617573 ) ( ON ?auto_617575 ?auto_617574 ) ( ON ?auto_617576 ?auto_617575 ) ( ON ?auto_617577 ?auto_617576 ) ( ON ?auto_617578 ?auto_617577 ) ( not ( = ?auto_617573 ?auto_617574 ) ) ( not ( = ?auto_617573 ?auto_617575 ) ) ( not ( = ?auto_617573 ?auto_617576 ) ) ( not ( = ?auto_617573 ?auto_617577 ) ) ( not ( = ?auto_617573 ?auto_617578 ) ) ( not ( = ?auto_617573 ?auto_617579 ) ) ( not ( = ?auto_617573 ?auto_617580 ) ) ( not ( = ?auto_617573 ?auto_617581 ) ) ( not ( = ?auto_617573 ?auto_617582 ) ) ( not ( = ?auto_617573 ?auto_617583 ) ) ( not ( = ?auto_617573 ?auto_617584 ) ) ( not ( = ?auto_617573 ?auto_617585 ) ) ( not ( = ?auto_617573 ?auto_617586 ) ) ( not ( = ?auto_617573 ?auto_617587 ) ) ( not ( = ?auto_617573 ?auto_617588 ) ) ( not ( = ?auto_617574 ?auto_617575 ) ) ( not ( = ?auto_617574 ?auto_617576 ) ) ( not ( = ?auto_617574 ?auto_617577 ) ) ( not ( = ?auto_617574 ?auto_617578 ) ) ( not ( = ?auto_617574 ?auto_617579 ) ) ( not ( = ?auto_617574 ?auto_617580 ) ) ( not ( = ?auto_617574 ?auto_617581 ) ) ( not ( = ?auto_617574 ?auto_617582 ) ) ( not ( = ?auto_617574 ?auto_617583 ) ) ( not ( = ?auto_617574 ?auto_617584 ) ) ( not ( = ?auto_617574 ?auto_617585 ) ) ( not ( = ?auto_617574 ?auto_617586 ) ) ( not ( = ?auto_617574 ?auto_617587 ) ) ( not ( = ?auto_617574 ?auto_617588 ) ) ( not ( = ?auto_617575 ?auto_617576 ) ) ( not ( = ?auto_617575 ?auto_617577 ) ) ( not ( = ?auto_617575 ?auto_617578 ) ) ( not ( = ?auto_617575 ?auto_617579 ) ) ( not ( = ?auto_617575 ?auto_617580 ) ) ( not ( = ?auto_617575 ?auto_617581 ) ) ( not ( = ?auto_617575 ?auto_617582 ) ) ( not ( = ?auto_617575 ?auto_617583 ) ) ( not ( = ?auto_617575 ?auto_617584 ) ) ( not ( = ?auto_617575 ?auto_617585 ) ) ( not ( = ?auto_617575 ?auto_617586 ) ) ( not ( = ?auto_617575 ?auto_617587 ) ) ( not ( = ?auto_617575 ?auto_617588 ) ) ( not ( = ?auto_617576 ?auto_617577 ) ) ( not ( = ?auto_617576 ?auto_617578 ) ) ( not ( = ?auto_617576 ?auto_617579 ) ) ( not ( = ?auto_617576 ?auto_617580 ) ) ( not ( = ?auto_617576 ?auto_617581 ) ) ( not ( = ?auto_617576 ?auto_617582 ) ) ( not ( = ?auto_617576 ?auto_617583 ) ) ( not ( = ?auto_617576 ?auto_617584 ) ) ( not ( = ?auto_617576 ?auto_617585 ) ) ( not ( = ?auto_617576 ?auto_617586 ) ) ( not ( = ?auto_617576 ?auto_617587 ) ) ( not ( = ?auto_617576 ?auto_617588 ) ) ( not ( = ?auto_617577 ?auto_617578 ) ) ( not ( = ?auto_617577 ?auto_617579 ) ) ( not ( = ?auto_617577 ?auto_617580 ) ) ( not ( = ?auto_617577 ?auto_617581 ) ) ( not ( = ?auto_617577 ?auto_617582 ) ) ( not ( = ?auto_617577 ?auto_617583 ) ) ( not ( = ?auto_617577 ?auto_617584 ) ) ( not ( = ?auto_617577 ?auto_617585 ) ) ( not ( = ?auto_617577 ?auto_617586 ) ) ( not ( = ?auto_617577 ?auto_617587 ) ) ( not ( = ?auto_617577 ?auto_617588 ) ) ( not ( = ?auto_617578 ?auto_617579 ) ) ( not ( = ?auto_617578 ?auto_617580 ) ) ( not ( = ?auto_617578 ?auto_617581 ) ) ( not ( = ?auto_617578 ?auto_617582 ) ) ( not ( = ?auto_617578 ?auto_617583 ) ) ( not ( = ?auto_617578 ?auto_617584 ) ) ( not ( = ?auto_617578 ?auto_617585 ) ) ( not ( = ?auto_617578 ?auto_617586 ) ) ( not ( = ?auto_617578 ?auto_617587 ) ) ( not ( = ?auto_617578 ?auto_617588 ) ) ( not ( = ?auto_617579 ?auto_617580 ) ) ( not ( = ?auto_617579 ?auto_617581 ) ) ( not ( = ?auto_617579 ?auto_617582 ) ) ( not ( = ?auto_617579 ?auto_617583 ) ) ( not ( = ?auto_617579 ?auto_617584 ) ) ( not ( = ?auto_617579 ?auto_617585 ) ) ( not ( = ?auto_617579 ?auto_617586 ) ) ( not ( = ?auto_617579 ?auto_617587 ) ) ( not ( = ?auto_617579 ?auto_617588 ) ) ( not ( = ?auto_617580 ?auto_617581 ) ) ( not ( = ?auto_617580 ?auto_617582 ) ) ( not ( = ?auto_617580 ?auto_617583 ) ) ( not ( = ?auto_617580 ?auto_617584 ) ) ( not ( = ?auto_617580 ?auto_617585 ) ) ( not ( = ?auto_617580 ?auto_617586 ) ) ( not ( = ?auto_617580 ?auto_617587 ) ) ( not ( = ?auto_617580 ?auto_617588 ) ) ( not ( = ?auto_617581 ?auto_617582 ) ) ( not ( = ?auto_617581 ?auto_617583 ) ) ( not ( = ?auto_617581 ?auto_617584 ) ) ( not ( = ?auto_617581 ?auto_617585 ) ) ( not ( = ?auto_617581 ?auto_617586 ) ) ( not ( = ?auto_617581 ?auto_617587 ) ) ( not ( = ?auto_617581 ?auto_617588 ) ) ( not ( = ?auto_617582 ?auto_617583 ) ) ( not ( = ?auto_617582 ?auto_617584 ) ) ( not ( = ?auto_617582 ?auto_617585 ) ) ( not ( = ?auto_617582 ?auto_617586 ) ) ( not ( = ?auto_617582 ?auto_617587 ) ) ( not ( = ?auto_617582 ?auto_617588 ) ) ( not ( = ?auto_617583 ?auto_617584 ) ) ( not ( = ?auto_617583 ?auto_617585 ) ) ( not ( = ?auto_617583 ?auto_617586 ) ) ( not ( = ?auto_617583 ?auto_617587 ) ) ( not ( = ?auto_617583 ?auto_617588 ) ) ( not ( = ?auto_617584 ?auto_617585 ) ) ( not ( = ?auto_617584 ?auto_617586 ) ) ( not ( = ?auto_617584 ?auto_617587 ) ) ( not ( = ?auto_617584 ?auto_617588 ) ) ( not ( = ?auto_617585 ?auto_617586 ) ) ( not ( = ?auto_617585 ?auto_617587 ) ) ( not ( = ?auto_617585 ?auto_617588 ) ) ( not ( = ?auto_617586 ?auto_617587 ) ) ( not ( = ?auto_617586 ?auto_617588 ) ) ( not ( = ?auto_617587 ?auto_617588 ) ) ( ON ?auto_617586 ?auto_617587 ) ( ON ?auto_617585 ?auto_617586 ) ( ON ?auto_617584 ?auto_617585 ) ( ON ?auto_617583 ?auto_617584 ) ( ON ?auto_617582 ?auto_617583 ) ( ON ?auto_617581 ?auto_617582 ) ( ON ?auto_617580 ?auto_617581 ) ( CLEAR ?auto_617578 ) ( ON ?auto_617579 ?auto_617580 ) ( CLEAR ?auto_617579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_617573 ?auto_617574 ?auto_617575 ?auto_617576 ?auto_617577 ?auto_617578 ?auto_617579 )
      ( MAKE-15PILE ?auto_617573 ?auto_617574 ?auto_617575 ?auto_617576 ?auto_617577 ?auto_617578 ?auto_617579 ?auto_617580 ?auto_617581 ?auto_617582 ?auto_617583 ?auto_617584 ?auto_617585 ?auto_617586 ?auto_617587 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617635 - BLOCK
      ?auto_617636 - BLOCK
      ?auto_617637 - BLOCK
      ?auto_617638 - BLOCK
      ?auto_617639 - BLOCK
      ?auto_617640 - BLOCK
      ?auto_617641 - BLOCK
      ?auto_617642 - BLOCK
      ?auto_617643 - BLOCK
      ?auto_617644 - BLOCK
      ?auto_617645 - BLOCK
      ?auto_617646 - BLOCK
      ?auto_617647 - BLOCK
      ?auto_617648 - BLOCK
      ?auto_617649 - BLOCK
    )
    :vars
    (
      ?auto_617650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617649 ?auto_617650 ) ( ON-TABLE ?auto_617635 ) ( ON ?auto_617636 ?auto_617635 ) ( ON ?auto_617637 ?auto_617636 ) ( ON ?auto_617638 ?auto_617637 ) ( ON ?auto_617639 ?auto_617638 ) ( not ( = ?auto_617635 ?auto_617636 ) ) ( not ( = ?auto_617635 ?auto_617637 ) ) ( not ( = ?auto_617635 ?auto_617638 ) ) ( not ( = ?auto_617635 ?auto_617639 ) ) ( not ( = ?auto_617635 ?auto_617640 ) ) ( not ( = ?auto_617635 ?auto_617641 ) ) ( not ( = ?auto_617635 ?auto_617642 ) ) ( not ( = ?auto_617635 ?auto_617643 ) ) ( not ( = ?auto_617635 ?auto_617644 ) ) ( not ( = ?auto_617635 ?auto_617645 ) ) ( not ( = ?auto_617635 ?auto_617646 ) ) ( not ( = ?auto_617635 ?auto_617647 ) ) ( not ( = ?auto_617635 ?auto_617648 ) ) ( not ( = ?auto_617635 ?auto_617649 ) ) ( not ( = ?auto_617635 ?auto_617650 ) ) ( not ( = ?auto_617636 ?auto_617637 ) ) ( not ( = ?auto_617636 ?auto_617638 ) ) ( not ( = ?auto_617636 ?auto_617639 ) ) ( not ( = ?auto_617636 ?auto_617640 ) ) ( not ( = ?auto_617636 ?auto_617641 ) ) ( not ( = ?auto_617636 ?auto_617642 ) ) ( not ( = ?auto_617636 ?auto_617643 ) ) ( not ( = ?auto_617636 ?auto_617644 ) ) ( not ( = ?auto_617636 ?auto_617645 ) ) ( not ( = ?auto_617636 ?auto_617646 ) ) ( not ( = ?auto_617636 ?auto_617647 ) ) ( not ( = ?auto_617636 ?auto_617648 ) ) ( not ( = ?auto_617636 ?auto_617649 ) ) ( not ( = ?auto_617636 ?auto_617650 ) ) ( not ( = ?auto_617637 ?auto_617638 ) ) ( not ( = ?auto_617637 ?auto_617639 ) ) ( not ( = ?auto_617637 ?auto_617640 ) ) ( not ( = ?auto_617637 ?auto_617641 ) ) ( not ( = ?auto_617637 ?auto_617642 ) ) ( not ( = ?auto_617637 ?auto_617643 ) ) ( not ( = ?auto_617637 ?auto_617644 ) ) ( not ( = ?auto_617637 ?auto_617645 ) ) ( not ( = ?auto_617637 ?auto_617646 ) ) ( not ( = ?auto_617637 ?auto_617647 ) ) ( not ( = ?auto_617637 ?auto_617648 ) ) ( not ( = ?auto_617637 ?auto_617649 ) ) ( not ( = ?auto_617637 ?auto_617650 ) ) ( not ( = ?auto_617638 ?auto_617639 ) ) ( not ( = ?auto_617638 ?auto_617640 ) ) ( not ( = ?auto_617638 ?auto_617641 ) ) ( not ( = ?auto_617638 ?auto_617642 ) ) ( not ( = ?auto_617638 ?auto_617643 ) ) ( not ( = ?auto_617638 ?auto_617644 ) ) ( not ( = ?auto_617638 ?auto_617645 ) ) ( not ( = ?auto_617638 ?auto_617646 ) ) ( not ( = ?auto_617638 ?auto_617647 ) ) ( not ( = ?auto_617638 ?auto_617648 ) ) ( not ( = ?auto_617638 ?auto_617649 ) ) ( not ( = ?auto_617638 ?auto_617650 ) ) ( not ( = ?auto_617639 ?auto_617640 ) ) ( not ( = ?auto_617639 ?auto_617641 ) ) ( not ( = ?auto_617639 ?auto_617642 ) ) ( not ( = ?auto_617639 ?auto_617643 ) ) ( not ( = ?auto_617639 ?auto_617644 ) ) ( not ( = ?auto_617639 ?auto_617645 ) ) ( not ( = ?auto_617639 ?auto_617646 ) ) ( not ( = ?auto_617639 ?auto_617647 ) ) ( not ( = ?auto_617639 ?auto_617648 ) ) ( not ( = ?auto_617639 ?auto_617649 ) ) ( not ( = ?auto_617639 ?auto_617650 ) ) ( not ( = ?auto_617640 ?auto_617641 ) ) ( not ( = ?auto_617640 ?auto_617642 ) ) ( not ( = ?auto_617640 ?auto_617643 ) ) ( not ( = ?auto_617640 ?auto_617644 ) ) ( not ( = ?auto_617640 ?auto_617645 ) ) ( not ( = ?auto_617640 ?auto_617646 ) ) ( not ( = ?auto_617640 ?auto_617647 ) ) ( not ( = ?auto_617640 ?auto_617648 ) ) ( not ( = ?auto_617640 ?auto_617649 ) ) ( not ( = ?auto_617640 ?auto_617650 ) ) ( not ( = ?auto_617641 ?auto_617642 ) ) ( not ( = ?auto_617641 ?auto_617643 ) ) ( not ( = ?auto_617641 ?auto_617644 ) ) ( not ( = ?auto_617641 ?auto_617645 ) ) ( not ( = ?auto_617641 ?auto_617646 ) ) ( not ( = ?auto_617641 ?auto_617647 ) ) ( not ( = ?auto_617641 ?auto_617648 ) ) ( not ( = ?auto_617641 ?auto_617649 ) ) ( not ( = ?auto_617641 ?auto_617650 ) ) ( not ( = ?auto_617642 ?auto_617643 ) ) ( not ( = ?auto_617642 ?auto_617644 ) ) ( not ( = ?auto_617642 ?auto_617645 ) ) ( not ( = ?auto_617642 ?auto_617646 ) ) ( not ( = ?auto_617642 ?auto_617647 ) ) ( not ( = ?auto_617642 ?auto_617648 ) ) ( not ( = ?auto_617642 ?auto_617649 ) ) ( not ( = ?auto_617642 ?auto_617650 ) ) ( not ( = ?auto_617643 ?auto_617644 ) ) ( not ( = ?auto_617643 ?auto_617645 ) ) ( not ( = ?auto_617643 ?auto_617646 ) ) ( not ( = ?auto_617643 ?auto_617647 ) ) ( not ( = ?auto_617643 ?auto_617648 ) ) ( not ( = ?auto_617643 ?auto_617649 ) ) ( not ( = ?auto_617643 ?auto_617650 ) ) ( not ( = ?auto_617644 ?auto_617645 ) ) ( not ( = ?auto_617644 ?auto_617646 ) ) ( not ( = ?auto_617644 ?auto_617647 ) ) ( not ( = ?auto_617644 ?auto_617648 ) ) ( not ( = ?auto_617644 ?auto_617649 ) ) ( not ( = ?auto_617644 ?auto_617650 ) ) ( not ( = ?auto_617645 ?auto_617646 ) ) ( not ( = ?auto_617645 ?auto_617647 ) ) ( not ( = ?auto_617645 ?auto_617648 ) ) ( not ( = ?auto_617645 ?auto_617649 ) ) ( not ( = ?auto_617645 ?auto_617650 ) ) ( not ( = ?auto_617646 ?auto_617647 ) ) ( not ( = ?auto_617646 ?auto_617648 ) ) ( not ( = ?auto_617646 ?auto_617649 ) ) ( not ( = ?auto_617646 ?auto_617650 ) ) ( not ( = ?auto_617647 ?auto_617648 ) ) ( not ( = ?auto_617647 ?auto_617649 ) ) ( not ( = ?auto_617647 ?auto_617650 ) ) ( not ( = ?auto_617648 ?auto_617649 ) ) ( not ( = ?auto_617648 ?auto_617650 ) ) ( not ( = ?auto_617649 ?auto_617650 ) ) ( ON ?auto_617648 ?auto_617649 ) ( ON ?auto_617647 ?auto_617648 ) ( ON ?auto_617646 ?auto_617647 ) ( ON ?auto_617645 ?auto_617646 ) ( ON ?auto_617644 ?auto_617645 ) ( ON ?auto_617643 ?auto_617644 ) ( ON ?auto_617642 ?auto_617643 ) ( ON ?auto_617641 ?auto_617642 ) ( CLEAR ?auto_617639 ) ( ON ?auto_617640 ?auto_617641 ) ( CLEAR ?auto_617640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_617635 ?auto_617636 ?auto_617637 ?auto_617638 ?auto_617639 ?auto_617640 )
      ( MAKE-15PILE ?auto_617635 ?auto_617636 ?auto_617637 ?auto_617638 ?auto_617639 ?auto_617640 ?auto_617641 ?auto_617642 ?auto_617643 ?auto_617644 ?auto_617645 ?auto_617646 ?auto_617647 ?auto_617648 ?auto_617649 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617697 - BLOCK
      ?auto_617698 - BLOCK
      ?auto_617699 - BLOCK
      ?auto_617700 - BLOCK
      ?auto_617701 - BLOCK
      ?auto_617702 - BLOCK
      ?auto_617703 - BLOCK
      ?auto_617704 - BLOCK
      ?auto_617705 - BLOCK
      ?auto_617706 - BLOCK
      ?auto_617707 - BLOCK
      ?auto_617708 - BLOCK
      ?auto_617709 - BLOCK
      ?auto_617710 - BLOCK
      ?auto_617711 - BLOCK
    )
    :vars
    (
      ?auto_617712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617711 ?auto_617712 ) ( ON-TABLE ?auto_617697 ) ( ON ?auto_617698 ?auto_617697 ) ( ON ?auto_617699 ?auto_617698 ) ( ON ?auto_617700 ?auto_617699 ) ( not ( = ?auto_617697 ?auto_617698 ) ) ( not ( = ?auto_617697 ?auto_617699 ) ) ( not ( = ?auto_617697 ?auto_617700 ) ) ( not ( = ?auto_617697 ?auto_617701 ) ) ( not ( = ?auto_617697 ?auto_617702 ) ) ( not ( = ?auto_617697 ?auto_617703 ) ) ( not ( = ?auto_617697 ?auto_617704 ) ) ( not ( = ?auto_617697 ?auto_617705 ) ) ( not ( = ?auto_617697 ?auto_617706 ) ) ( not ( = ?auto_617697 ?auto_617707 ) ) ( not ( = ?auto_617697 ?auto_617708 ) ) ( not ( = ?auto_617697 ?auto_617709 ) ) ( not ( = ?auto_617697 ?auto_617710 ) ) ( not ( = ?auto_617697 ?auto_617711 ) ) ( not ( = ?auto_617697 ?auto_617712 ) ) ( not ( = ?auto_617698 ?auto_617699 ) ) ( not ( = ?auto_617698 ?auto_617700 ) ) ( not ( = ?auto_617698 ?auto_617701 ) ) ( not ( = ?auto_617698 ?auto_617702 ) ) ( not ( = ?auto_617698 ?auto_617703 ) ) ( not ( = ?auto_617698 ?auto_617704 ) ) ( not ( = ?auto_617698 ?auto_617705 ) ) ( not ( = ?auto_617698 ?auto_617706 ) ) ( not ( = ?auto_617698 ?auto_617707 ) ) ( not ( = ?auto_617698 ?auto_617708 ) ) ( not ( = ?auto_617698 ?auto_617709 ) ) ( not ( = ?auto_617698 ?auto_617710 ) ) ( not ( = ?auto_617698 ?auto_617711 ) ) ( not ( = ?auto_617698 ?auto_617712 ) ) ( not ( = ?auto_617699 ?auto_617700 ) ) ( not ( = ?auto_617699 ?auto_617701 ) ) ( not ( = ?auto_617699 ?auto_617702 ) ) ( not ( = ?auto_617699 ?auto_617703 ) ) ( not ( = ?auto_617699 ?auto_617704 ) ) ( not ( = ?auto_617699 ?auto_617705 ) ) ( not ( = ?auto_617699 ?auto_617706 ) ) ( not ( = ?auto_617699 ?auto_617707 ) ) ( not ( = ?auto_617699 ?auto_617708 ) ) ( not ( = ?auto_617699 ?auto_617709 ) ) ( not ( = ?auto_617699 ?auto_617710 ) ) ( not ( = ?auto_617699 ?auto_617711 ) ) ( not ( = ?auto_617699 ?auto_617712 ) ) ( not ( = ?auto_617700 ?auto_617701 ) ) ( not ( = ?auto_617700 ?auto_617702 ) ) ( not ( = ?auto_617700 ?auto_617703 ) ) ( not ( = ?auto_617700 ?auto_617704 ) ) ( not ( = ?auto_617700 ?auto_617705 ) ) ( not ( = ?auto_617700 ?auto_617706 ) ) ( not ( = ?auto_617700 ?auto_617707 ) ) ( not ( = ?auto_617700 ?auto_617708 ) ) ( not ( = ?auto_617700 ?auto_617709 ) ) ( not ( = ?auto_617700 ?auto_617710 ) ) ( not ( = ?auto_617700 ?auto_617711 ) ) ( not ( = ?auto_617700 ?auto_617712 ) ) ( not ( = ?auto_617701 ?auto_617702 ) ) ( not ( = ?auto_617701 ?auto_617703 ) ) ( not ( = ?auto_617701 ?auto_617704 ) ) ( not ( = ?auto_617701 ?auto_617705 ) ) ( not ( = ?auto_617701 ?auto_617706 ) ) ( not ( = ?auto_617701 ?auto_617707 ) ) ( not ( = ?auto_617701 ?auto_617708 ) ) ( not ( = ?auto_617701 ?auto_617709 ) ) ( not ( = ?auto_617701 ?auto_617710 ) ) ( not ( = ?auto_617701 ?auto_617711 ) ) ( not ( = ?auto_617701 ?auto_617712 ) ) ( not ( = ?auto_617702 ?auto_617703 ) ) ( not ( = ?auto_617702 ?auto_617704 ) ) ( not ( = ?auto_617702 ?auto_617705 ) ) ( not ( = ?auto_617702 ?auto_617706 ) ) ( not ( = ?auto_617702 ?auto_617707 ) ) ( not ( = ?auto_617702 ?auto_617708 ) ) ( not ( = ?auto_617702 ?auto_617709 ) ) ( not ( = ?auto_617702 ?auto_617710 ) ) ( not ( = ?auto_617702 ?auto_617711 ) ) ( not ( = ?auto_617702 ?auto_617712 ) ) ( not ( = ?auto_617703 ?auto_617704 ) ) ( not ( = ?auto_617703 ?auto_617705 ) ) ( not ( = ?auto_617703 ?auto_617706 ) ) ( not ( = ?auto_617703 ?auto_617707 ) ) ( not ( = ?auto_617703 ?auto_617708 ) ) ( not ( = ?auto_617703 ?auto_617709 ) ) ( not ( = ?auto_617703 ?auto_617710 ) ) ( not ( = ?auto_617703 ?auto_617711 ) ) ( not ( = ?auto_617703 ?auto_617712 ) ) ( not ( = ?auto_617704 ?auto_617705 ) ) ( not ( = ?auto_617704 ?auto_617706 ) ) ( not ( = ?auto_617704 ?auto_617707 ) ) ( not ( = ?auto_617704 ?auto_617708 ) ) ( not ( = ?auto_617704 ?auto_617709 ) ) ( not ( = ?auto_617704 ?auto_617710 ) ) ( not ( = ?auto_617704 ?auto_617711 ) ) ( not ( = ?auto_617704 ?auto_617712 ) ) ( not ( = ?auto_617705 ?auto_617706 ) ) ( not ( = ?auto_617705 ?auto_617707 ) ) ( not ( = ?auto_617705 ?auto_617708 ) ) ( not ( = ?auto_617705 ?auto_617709 ) ) ( not ( = ?auto_617705 ?auto_617710 ) ) ( not ( = ?auto_617705 ?auto_617711 ) ) ( not ( = ?auto_617705 ?auto_617712 ) ) ( not ( = ?auto_617706 ?auto_617707 ) ) ( not ( = ?auto_617706 ?auto_617708 ) ) ( not ( = ?auto_617706 ?auto_617709 ) ) ( not ( = ?auto_617706 ?auto_617710 ) ) ( not ( = ?auto_617706 ?auto_617711 ) ) ( not ( = ?auto_617706 ?auto_617712 ) ) ( not ( = ?auto_617707 ?auto_617708 ) ) ( not ( = ?auto_617707 ?auto_617709 ) ) ( not ( = ?auto_617707 ?auto_617710 ) ) ( not ( = ?auto_617707 ?auto_617711 ) ) ( not ( = ?auto_617707 ?auto_617712 ) ) ( not ( = ?auto_617708 ?auto_617709 ) ) ( not ( = ?auto_617708 ?auto_617710 ) ) ( not ( = ?auto_617708 ?auto_617711 ) ) ( not ( = ?auto_617708 ?auto_617712 ) ) ( not ( = ?auto_617709 ?auto_617710 ) ) ( not ( = ?auto_617709 ?auto_617711 ) ) ( not ( = ?auto_617709 ?auto_617712 ) ) ( not ( = ?auto_617710 ?auto_617711 ) ) ( not ( = ?auto_617710 ?auto_617712 ) ) ( not ( = ?auto_617711 ?auto_617712 ) ) ( ON ?auto_617710 ?auto_617711 ) ( ON ?auto_617709 ?auto_617710 ) ( ON ?auto_617708 ?auto_617709 ) ( ON ?auto_617707 ?auto_617708 ) ( ON ?auto_617706 ?auto_617707 ) ( ON ?auto_617705 ?auto_617706 ) ( ON ?auto_617704 ?auto_617705 ) ( ON ?auto_617703 ?auto_617704 ) ( ON ?auto_617702 ?auto_617703 ) ( CLEAR ?auto_617700 ) ( ON ?auto_617701 ?auto_617702 ) ( CLEAR ?auto_617701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_617697 ?auto_617698 ?auto_617699 ?auto_617700 ?auto_617701 )
      ( MAKE-15PILE ?auto_617697 ?auto_617698 ?auto_617699 ?auto_617700 ?auto_617701 ?auto_617702 ?auto_617703 ?auto_617704 ?auto_617705 ?auto_617706 ?auto_617707 ?auto_617708 ?auto_617709 ?auto_617710 ?auto_617711 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617759 - BLOCK
      ?auto_617760 - BLOCK
      ?auto_617761 - BLOCK
      ?auto_617762 - BLOCK
      ?auto_617763 - BLOCK
      ?auto_617764 - BLOCK
      ?auto_617765 - BLOCK
      ?auto_617766 - BLOCK
      ?auto_617767 - BLOCK
      ?auto_617768 - BLOCK
      ?auto_617769 - BLOCK
      ?auto_617770 - BLOCK
      ?auto_617771 - BLOCK
      ?auto_617772 - BLOCK
      ?auto_617773 - BLOCK
    )
    :vars
    (
      ?auto_617774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617773 ?auto_617774 ) ( ON-TABLE ?auto_617759 ) ( ON ?auto_617760 ?auto_617759 ) ( ON ?auto_617761 ?auto_617760 ) ( not ( = ?auto_617759 ?auto_617760 ) ) ( not ( = ?auto_617759 ?auto_617761 ) ) ( not ( = ?auto_617759 ?auto_617762 ) ) ( not ( = ?auto_617759 ?auto_617763 ) ) ( not ( = ?auto_617759 ?auto_617764 ) ) ( not ( = ?auto_617759 ?auto_617765 ) ) ( not ( = ?auto_617759 ?auto_617766 ) ) ( not ( = ?auto_617759 ?auto_617767 ) ) ( not ( = ?auto_617759 ?auto_617768 ) ) ( not ( = ?auto_617759 ?auto_617769 ) ) ( not ( = ?auto_617759 ?auto_617770 ) ) ( not ( = ?auto_617759 ?auto_617771 ) ) ( not ( = ?auto_617759 ?auto_617772 ) ) ( not ( = ?auto_617759 ?auto_617773 ) ) ( not ( = ?auto_617759 ?auto_617774 ) ) ( not ( = ?auto_617760 ?auto_617761 ) ) ( not ( = ?auto_617760 ?auto_617762 ) ) ( not ( = ?auto_617760 ?auto_617763 ) ) ( not ( = ?auto_617760 ?auto_617764 ) ) ( not ( = ?auto_617760 ?auto_617765 ) ) ( not ( = ?auto_617760 ?auto_617766 ) ) ( not ( = ?auto_617760 ?auto_617767 ) ) ( not ( = ?auto_617760 ?auto_617768 ) ) ( not ( = ?auto_617760 ?auto_617769 ) ) ( not ( = ?auto_617760 ?auto_617770 ) ) ( not ( = ?auto_617760 ?auto_617771 ) ) ( not ( = ?auto_617760 ?auto_617772 ) ) ( not ( = ?auto_617760 ?auto_617773 ) ) ( not ( = ?auto_617760 ?auto_617774 ) ) ( not ( = ?auto_617761 ?auto_617762 ) ) ( not ( = ?auto_617761 ?auto_617763 ) ) ( not ( = ?auto_617761 ?auto_617764 ) ) ( not ( = ?auto_617761 ?auto_617765 ) ) ( not ( = ?auto_617761 ?auto_617766 ) ) ( not ( = ?auto_617761 ?auto_617767 ) ) ( not ( = ?auto_617761 ?auto_617768 ) ) ( not ( = ?auto_617761 ?auto_617769 ) ) ( not ( = ?auto_617761 ?auto_617770 ) ) ( not ( = ?auto_617761 ?auto_617771 ) ) ( not ( = ?auto_617761 ?auto_617772 ) ) ( not ( = ?auto_617761 ?auto_617773 ) ) ( not ( = ?auto_617761 ?auto_617774 ) ) ( not ( = ?auto_617762 ?auto_617763 ) ) ( not ( = ?auto_617762 ?auto_617764 ) ) ( not ( = ?auto_617762 ?auto_617765 ) ) ( not ( = ?auto_617762 ?auto_617766 ) ) ( not ( = ?auto_617762 ?auto_617767 ) ) ( not ( = ?auto_617762 ?auto_617768 ) ) ( not ( = ?auto_617762 ?auto_617769 ) ) ( not ( = ?auto_617762 ?auto_617770 ) ) ( not ( = ?auto_617762 ?auto_617771 ) ) ( not ( = ?auto_617762 ?auto_617772 ) ) ( not ( = ?auto_617762 ?auto_617773 ) ) ( not ( = ?auto_617762 ?auto_617774 ) ) ( not ( = ?auto_617763 ?auto_617764 ) ) ( not ( = ?auto_617763 ?auto_617765 ) ) ( not ( = ?auto_617763 ?auto_617766 ) ) ( not ( = ?auto_617763 ?auto_617767 ) ) ( not ( = ?auto_617763 ?auto_617768 ) ) ( not ( = ?auto_617763 ?auto_617769 ) ) ( not ( = ?auto_617763 ?auto_617770 ) ) ( not ( = ?auto_617763 ?auto_617771 ) ) ( not ( = ?auto_617763 ?auto_617772 ) ) ( not ( = ?auto_617763 ?auto_617773 ) ) ( not ( = ?auto_617763 ?auto_617774 ) ) ( not ( = ?auto_617764 ?auto_617765 ) ) ( not ( = ?auto_617764 ?auto_617766 ) ) ( not ( = ?auto_617764 ?auto_617767 ) ) ( not ( = ?auto_617764 ?auto_617768 ) ) ( not ( = ?auto_617764 ?auto_617769 ) ) ( not ( = ?auto_617764 ?auto_617770 ) ) ( not ( = ?auto_617764 ?auto_617771 ) ) ( not ( = ?auto_617764 ?auto_617772 ) ) ( not ( = ?auto_617764 ?auto_617773 ) ) ( not ( = ?auto_617764 ?auto_617774 ) ) ( not ( = ?auto_617765 ?auto_617766 ) ) ( not ( = ?auto_617765 ?auto_617767 ) ) ( not ( = ?auto_617765 ?auto_617768 ) ) ( not ( = ?auto_617765 ?auto_617769 ) ) ( not ( = ?auto_617765 ?auto_617770 ) ) ( not ( = ?auto_617765 ?auto_617771 ) ) ( not ( = ?auto_617765 ?auto_617772 ) ) ( not ( = ?auto_617765 ?auto_617773 ) ) ( not ( = ?auto_617765 ?auto_617774 ) ) ( not ( = ?auto_617766 ?auto_617767 ) ) ( not ( = ?auto_617766 ?auto_617768 ) ) ( not ( = ?auto_617766 ?auto_617769 ) ) ( not ( = ?auto_617766 ?auto_617770 ) ) ( not ( = ?auto_617766 ?auto_617771 ) ) ( not ( = ?auto_617766 ?auto_617772 ) ) ( not ( = ?auto_617766 ?auto_617773 ) ) ( not ( = ?auto_617766 ?auto_617774 ) ) ( not ( = ?auto_617767 ?auto_617768 ) ) ( not ( = ?auto_617767 ?auto_617769 ) ) ( not ( = ?auto_617767 ?auto_617770 ) ) ( not ( = ?auto_617767 ?auto_617771 ) ) ( not ( = ?auto_617767 ?auto_617772 ) ) ( not ( = ?auto_617767 ?auto_617773 ) ) ( not ( = ?auto_617767 ?auto_617774 ) ) ( not ( = ?auto_617768 ?auto_617769 ) ) ( not ( = ?auto_617768 ?auto_617770 ) ) ( not ( = ?auto_617768 ?auto_617771 ) ) ( not ( = ?auto_617768 ?auto_617772 ) ) ( not ( = ?auto_617768 ?auto_617773 ) ) ( not ( = ?auto_617768 ?auto_617774 ) ) ( not ( = ?auto_617769 ?auto_617770 ) ) ( not ( = ?auto_617769 ?auto_617771 ) ) ( not ( = ?auto_617769 ?auto_617772 ) ) ( not ( = ?auto_617769 ?auto_617773 ) ) ( not ( = ?auto_617769 ?auto_617774 ) ) ( not ( = ?auto_617770 ?auto_617771 ) ) ( not ( = ?auto_617770 ?auto_617772 ) ) ( not ( = ?auto_617770 ?auto_617773 ) ) ( not ( = ?auto_617770 ?auto_617774 ) ) ( not ( = ?auto_617771 ?auto_617772 ) ) ( not ( = ?auto_617771 ?auto_617773 ) ) ( not ( = ?auto_617771 ?auto_617774 ) ) ( not ( = ?auto_617772 ?auto_617773 ) ) ( not ( = ?auto_617772 ?auto_617774 ) ) ( not ( = ?auto_617773 ?auto_617774 ) ) ( ON ?auto_617772 ?auto_617773 ) ( ON ?auto_617771 ?auto_617772 ) ( ON ?auto_617770 ?auto_617771 ) ( ON ?auto_617769 ?auto_617770 ) ( ON ?auto_617768 ?auto_617769 ) ( ON ?auto_617767 ?auto_617768 ) ( ON ?auto_617766 ?auto_617767 ) ( ON ?auto_617765 ?auto_617766 ) ( ON ?auto_617764 ?auto_617765 ) ( ON ?auto_617763 ?auto_617764 ) ( CLEAR ?auto_617761 ) ( ON ?auto_617762 ?auto_617763 ) ( CLEAR ?auto_617762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_617759 ?auto_617760 ?auto_617761 ?auto_617762 )
      ( MAKE-15PILE ?auto_617759 ?auto_617760 ?auto_617761 ?auto_617762 ?auto_617763 ?auto_617764 ?auto_617765 ?auto_617766 ?auto_617767 ?auto_617768 ?auto_617769 ?auto_617770 ?auto_617771 ?auto_617772 ?auto_617773 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617821 - BLOCK
      ?auto_617822 - BLOCK
      ?auto_617823 - BLOCK
      ?auto_617824 - BLOCK
      ?auto_617825 - BLOCK
      ?auto_617826 - BLOCK
      ?auto_617827 - BLOCK
      ?auto_617828 - BLOCK
      ?auto_617829 - BLOCK
      ?auto_617830 - BLOCK
      ?auto_617831 - BLOCK
      ?auto_617832 - BLOCK
      ?auto_617833 - BLOCK
      ?auto_617834 - BLOCK
      ?auto_617835 - BLOCK
    )
    :vars
    (
      ?auto_617836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617835 ?auto_617836 ) ( ON-TABLE ?auto_617821 ) ( ON ?auto_617822 ?auto_617821 ) ( not ( = ?auto_617821 ?auto_617822 ) ) ( not ( = ?auto_617821 ?auto_617823 ) ) ( not ( = ?auto_617821 ?auto_617824 ) ) ( not ( = ?auto_617821 ?auto_617825 ) ) ( not ( = ?auto_617821 ?auto_617826 ) ) ( not ( = ?auto_617821 ?auto_617827 ) ) ( not ( = ?auto_617821 ?auto_617828 ) ) ( not ( = ?auto_617821 ?auto_617829 ) ) ( not ( = ?auto_617821 ?auto_617830 ) ) ( not ( = ?auto_617821 ?auto_617831 ) ) ( not ( = ?auto_617821 ?auto_617832 ) ) ( not ( = ?auto_617821 ?auto_617833 ) ) ( not ( = ?auto_617821 ?auto_617834 ) ) ( not ( = ?auto_617821 ?auto_617835 ) ) ( not ( = ?auto_617821 ?auto_617836 ) ) ( not ( = ?auto_617822 ?auto_617823 ) ) ( not ( = ?auto_617822 ?auto_617824 ) ) ( not ( = ?auto_617822 ?auto_617825 ) ) ( not ( = ?auto_617822 ?auto_617826 ) ) ( not ( = ?auto_617822 ?auto_617827 ) ) ( not ( = ?auto_617822 ?auto_617828 ) ) ( not ( = ?auto_617822 ?auto_617829 ) ) ( not ( = ?auto_617822 ?auto_617830 ) ) ( not ( = ?auto_617822 ?auto_617831 ) ) ( not ( = ?auto_617822 ?auto_617832 ) ) ( not ( = ?auto_617822 ?auto_617833 ) ) ( not ( = ?auto_617822 ?auto_617834 ) ) ( not ( = ?auto_617822 ?auto_617835 ) ) ( not ( = ?auto_617822 ?auto_617836 ) ) ( not ( = ?auto_617823 ?auto_617824 ) ) ( not ( = ?auto_617823 ?auto_617825 ) ) ( not ( = ?auto_617823 ?auto_617826 ) ) ( not ( = ?auto_617823 ?auto_617827 ) ) ( not ( = ?auto_617823 ?auto_617828 ) ) ( not ( = ?auto_617823 ?auto_617829 ) ) ( not ( = ?auto_617823 ?auto_617830 ) ) ( not ( = ?auto_617823 ?auto_617831 ) ) ( not ( = ?auto_617823 ?auto_617832 ) ) ( not ( = ?auto_617823 ?auto_617833 ) ) ( not ( = ?auto_617823 ?auto_617834 ) ) ( not ( = ?auto_617823 ?auto_617835 ) ) ( not ( = ?auto_617823 ?auto_617836 ) ) ( not ( = ?auto_617824 ?auto_617825 ) ) ( not ( = ?auto_617824 ?auto_617826 ) ) ( not ( = ?auto_617824 ?auto_617827 ) ) ( not ( = ?auto_617824 ?auto_617828 ) ) ( not ( = ?auto_617824 ?auto_617829 ) ) ( not ( = ?auto_617824 ?auto_617830 ) ) ( not ( = ?auto_617824 ?auto_617831 ) ) ( not ( = ?auto_617824 ?auto_617832 ) ) ( not ( = ?auto_617824 ?auto_617833 ) ) ( not ( = ?auto_617824 ?auto_617834 ) ) ( not ( = ?auto_617824 ?auto_617835 ) ) ( not ( = ?auto_617824 ?auto_617836 ) ) ( not ( = ?auto_617825 ?auto_617826 ) ) ( not ( = ?auto_617825 ?auto_617827 ) ) ( not ( = ?auto_617825 ?auto_617828 ) ) ( not ( = ?auto_617825 ?auto_617829 ) ) ( not ( = ?auto_617825 ?auto_617830 ) ) ( not ( = ?auto_617825 ?auto_617831 ) ) ( not ( = ?auto_617825 ?auto_617832 ) ) ( not ( = ?auto_617825 ?auto_617833 ) ) ( not ( = ?auto_617825 ?auto_617834 ) ) ( not ( = ?auto_617825 ?auto_617835 ) ) ( not ( = ?auto_617825 ?auto_617836 ) ) ( not ( = ?auto_617826 ?auto_617827 ) ) ( not ( = ?auto_617826 ?auto_617828 ) ) ( not ( = ?auto_617826 ?auto_617829 ) ) ( not ( = ?auto_617826 ?auto_617830 ) ) ( not ( = ?auto_617826 ?auto_617831 ) ) ( not ( = ?auto_617826 ?auto_617832 ) ) ( not ( = ?auto_617826 ?auto_617833 ) ) ( not ( = ?auto_617826 ?auto_617834 ) ) ( not ( = ?auto_617826 ?auto_617835 ) ) ( not ( = ?auto_617826 ?auto_617836 ) ) ( not ( = ?auto_617827 ?auto_617828 ) ) ( not ( = ?auto_617827 ?auto_617829 ) ) ( not ( = ?auto_617827 ?auto_617830 ) ) ( not ( = ?auto_617827 ?auto_617831 ) ) ( not ( = ?auto_617827 ?auto_617832 ) ) ( not ( = ?auto_617827 ?auto_617833 ) ) ( not ( = ?auto_617827 ?auto_617834 ) ) ( not ( = ?auto_617827 ?auto_617835 ) ) ( not ( = ?auto_617827 ?auto_617836 ) ) ( not ( = ?auto_617828 ?auto_617829 ) ) ( not ( = ?auto_617828 ?auto_617830 ) ) ( not ( = ?auto_617828 ?auto_617831 ) ) ( not ( = ?auto_617828 ?auto_617832 ) ) ( not ( = ?auto_617828 ?auto_617833 ) ) ( not ( = ?auto_617828 ?auto_617834 ) ) ( not ( = ?auto_617828 ?auto_617835 ) ) ( not ( = ?auto_617828 ?auto_617836 ) ) ( not ( = ?auto_617829 ?auto_617830 ) ) ( not ( = ?auto_617829 ?auto_617831 ) ) ( not ( = ?auto_617829 ?auto_617832 ) ) ( not ( = ?auto_617829 ?auto_617833 ) ) ( not ( = ?auto_617829 ?auto_617834 ) ) ( not ( = ?auto_617829 ?auto_617835 ) ) ( not ( = ?auto_617829 ?auto_617836 ) ) ( not ( = ?auto_617830 ?auto_617831 ) ) ( not ( = ?auto_617830 ?auto_617832 ) ) ( not ( = ?auto_617830 ?auto_617833 ) ) ( not ( = ?auto_617830 ?auto_617834 ) ) ( not ( = ?auto_617830 ?auto_617835 ) ) ( not ( = ?auto_617830 ?auto_617836 ) ) ( not ( = ?auto_617831 ?auto_617832 ) ) ( not ( = ?auto_617831 ?auto_617833 ) ) ( not ( = ?auto_617831 ?auto_617834 ) ) ( not ( = ?auto_617831 ?auto_617835 ) ) ( not ( = ?auto_617831 ?auto_617836 ) ) ( not ( = ?auto_617832 ?auto_617833 ) ) ( not ( = ?auto_617832 ?auto_617834 ) ) ( not ( = ?auto_617832 ?auto_617835 ) ) ( not ( = ?auto_617832 ?auto_617836 ) ) ( not ( = ?auto_617833 ?auto_617834 ) ) ( not ( = ?auto_617833 ?auto_617835 ) ) ( not ( = ?auto_617833 ?auto_617836 ) ) ( not ( = ?auto_617834 ?auto_617835 ) ) ( not ( = ?auto_617834 ?auto_617836 ) ) ( not ( = ?auto_617835 ?auto_617836 ) ) ( ON ?auto_617834 ?auto_617835 ) ( ON ?auto_617833 ?auto_617834 ) ( ON ?auto_617832 ?auto_617833 ) ( ON ?auto_617831 ?auto_617832 ) ( ON ?auto_617830 ?auto_617831 ) ( ON ?auto_617829 ?auto_617830 ) ( ON ?auto_617828 ?auto_617829 ) ( ON ?auto_617827 ?auto_617828 ) ( ON ?auto_617826 ?auto_617827 ) ( ON ?auto_617825 ?auto_617826 ) ( ON ?auto_617824 ?auto_617825 ) ( CLEAR ?auto_617822 ) ( ON ?auto_617823 ?auto_617824 ) ( CLEAR ?auto_617823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_617821 ?auto_617822 ?auto_617823 )
      ( MAKE-15PILE ?auto_617821 ?auto_617822 ?auto_617823 ?auto_617824 ?auto_617825 ?auto_617826 ?auto_617827 ?auto_617828 ?auto_617829 ?auto_617830 ?auto_617831 ?auto_617832 ?auto_617833 ?auto_617834 ?auto_617835 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617883 - BLOCK
      ?auto_617884 - BLOCK
      ?auto_617885 - BLOCK
      ?auto_617886 - BLOCK
      ?auto_617887 - BLOCK
      ?auto_617888 - BLOCK
      ?auto_617889 - BLOCK
      ?auto_617890 - BLOCK
      ?auto_617891 - BLOCK
      ?auto_617892 - BLOCK
      ?auto_617893 - BLOCK
      ?auto_617894 - BLOCK
      ?auto_617895 - BLOCK
      ?auto_617896 - BLOCK
      ?auto_617897 - BLOCK
    )
    :vars
    (
      ?auto_617898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617897 ?auto_617898 ) ( ON-TABLE ?auto_617883 ) ( not ( = ?auto_617883 ?auto_617884 ) ) ( not ( = ?auto_617883 ?auto_617885 ) ) ( not ( = ?auto_617883 ?auto_617886 ) ) ( not ( = ?auto_617883 ?auto_617887 ) ) ( not ( = ?auto_617883 ?auto_617888 ) ) ( not ( = ?auto_617883 ?auto_617889 ) ) ( not ( = ?auto_617883 ?auto_617890 ) ) ( not ( = ?auto_617883 ?auto_617891 ) ) ( not ( = ?auto_617883 ?auto_617892 ) ) ( not ( = ?auto_617883 ?auto_617893 ) ) ( not ( = ?auto_617883 ?auto_617894 ) ) ( not ( = ?auto_617883 ?auto_617895 ) ) ( not ( = ?auto_617883 ?auto_617896 ) ) ( not ( = ?auto_617883 ?auto_617897 ) ) ( not ( = ?auto_617883 ?auto_617898 ) ) ( not ( = ?auto_617884 ?auto_617885 ) ) ( not ( = ?auto_617884 ?auto_617886 ) ) ( not ( = ?auto_617884 ?auto_617887 ) ) ( not ( = ?auto_617884 ?auto_617888 ) ) ( not ( = ?auto_617884 ?auto_617889 ) ) ( not ( = ?auto_617884 ?auto_617890 ) ) ( not ( = ?auto_617884 ?auto_617891 ) ) ( not ( = ?auto_617884 ?auto_617892 ) ) ( not ( = ?auto_617884 ?auto_617893 ) ) ( not ( = ?auto_617884 ?auto_617894 ) ) ( not ( = ?auto_617884 ?auto_617895 ) ) ( not ( = ?auto_617884 ?auto_617896 ) ) ( not ( = ?auto_617884 ?auto_617897 ) ) ( not ( = ?auto_617884 ?auto_617898 ) ) ( not ( = ?auto_617885 ?auto_617886 ) ) ( not ( = ?auto_617885 ?auto_617887 ) ) ( not ( = ?auto_617885 ?auto_617888 ) ) ( not ( = ?auto_617885 ?auto_617889 ) ) ( not ( = ?auto_617885 ?auto_617890 ) ) ( not ( = ?auto_617885 ?auto_617891 ) ) ( not ( = ?auto_617885 ?auto_617892 ) ) ( not ( = ?auto_617885 ?auto_617893 ) ) ( not ( = ?auto_617885 ?auto_617894 ) ) ( not ( = ?auto_617885 ?auto_617895 ) ) ( not ( = ?auto_617885 ?auto_617896 ) ) ( not ( = ?auto_617885 ?auto_617897 ) ) ( not ( = ?auto_617885 ?auto_617898 ) ) ( not ( = ?auto_617886 ?auto_617887 ) ) ( not ( = ?auto_617886 ?auto_617888 ) ) ( not ( = ?auto_617886 ?auto_617889 ) ) ( not ( = ?auto_617886 ?auto_617890 ) ) ( not ( = ?auto_617886 ?auto_617891 ) ) ( not ( = ?auto_617886 ?auto_617892 ) ) ( not ( = ?auto_617886 ?auto_617893 ) ) ( not ( = ?auto_617886 ?auto_617894 ) ) ( not ( = ?auto_617886 ?auto_617895 ) ) ( not ( = ?auto_617886 ?auto_617896 ) ) ( not ( = ?auto_617886 ?auto_617897 ) ) ( not ( = ?auto_617886 ?auto_617898 ) ) ( not ( = ?auto_617887 ?auto_617888 ) ) ( not ( = ?auto_617887 ?auto_617889 ) ) ( not ( = ?auto_617887 ?auto_617890 ) ) ( not ( = ?auto_617887 ?auto_617891 ) ) ( not ( = ?auto_617887 ?auto_617892 ) ) ( not ( = ?auto_617887 ?auto_617893 ) ) ( not ( = ?auto_617887 ?auto_617894 ) ) ( not ( = ?auto_617887 ?auto_617895 ) ) ( not ( = ?auto_617887 ?auto_617896 ) ) ( not ( = ?auto_617887 ?auto_617897 ) ) ( not ( = ?auto_617887 ?auto_617898 ) ) ( not ( = ?auto_617888 ?auto_617889 ) ) ( not ( = ?auto_617888 ?auto_617890 ) ) ( not ( = ?auto_617888 ?auto_617891 ) ) ( not ( = ?auto_617888 ?auto_617892 ) ) ( not ( = ?auto_617888 ?auto_617893 ) ) ( not ( = ?auto_617888 ?auto_617894 ) ) ( not ( = ?auto_617888 ?auto_617895 ) ) ( not ( = ?auto_617888 ?auto_617896 ) ) ( not ( = ?auto_617888 ?auto_617897 ) ) ( not ( = ?auto_617888 ?auto_617898 ) ) ( not ( = ?auto_617889 ?auto_617890 ) ) ( not ( = ?auto_617889 ?auto_617891 ) ) ( not ( = ?auto_617889 ?auto_617892 ) ) ( not ( = ?auto_617889 ?auto_617893 ) ) ( not ( = ?auto_617889 ?auto_617894 ) ) ( not ( = ?auto_617889 ?auto_617895 ) ) ( not ( = ?auto_617889 ?auto_617896 ) ) ( not ( = ?auto_617889 ?auto_617897 ) ) ( not ( = ?auto_617889 ?auto_617898 ) ) ( not ( = ?auto_617890 ?auto_617891 ) ) ( not ( = ?auto_617890 ?auto_617892 ) ) ( not ( = ?auto_617890 ?auto_617893 ) ) ( not ( = ?auto_617890 ?auto_617894 ) ) ( not ( = ?auto_617890 ?auto_617895 ) ) ( not ( = ?auto_617890 ?auto_617896 ) ) ( not ( = ?auto_617890 ?auto_617897 ) ) ( not ( = ?auto_617890 ?auto_617898 ) ) ( not ( = ?auto_617891 ?auto_617892 ) ) ( not ( = ?auto_617891 ?auto_617893 ) ) ( not ( = ?auto_617891 ?auto_617894 ) ) ( not ( = ?auto_617891 ?auto_617895 ) ) ( not ( = ?auto_617891 ?auto_617896 ) ) ( not ( = ?auto_617891 ?auto_617897 ) ) ( not ( = ?auto_617891 ?auto_617898 ) ) ( not ( = ?auto_617892 ?auto_617893 ) ) ( not ( = ?auto_617892 ?auto_617894 ) ) ( not ( = ?auto_617892 ?auto_617895 ) ) ( not ( = ?auto_617892 ?auto_617896 ) ) ( not ( = ?auto_617892 ?auto_617897 ) ) ( not ( = ?auto_617892 ?auto_617898 ) ) ( not ( = ?auto_617893 ?auto_617894 ) ) ( not ( = ?auto_617893 ?auto_617895 ) ) ( not ( = ?auto_617893 ?auto_617896 ) ) ( not ( = ?auto_617893 ?auto_617897 ) ) ( not ( = ?auto_617893 ?auto_617898 ) ) ( not ( = ?auto_617894 ?auto_617895 ) ) ( not ( = ?auto_617894 ?auto_617896 ) ) ( not ( = ?auto_617894 ?auto_617897 ) ) ( not ( = ?auto_617894 ?auto_617898 ) ) ( not ( = ?auto_617895 ?auto_617896 ) ) ( not ( = ?auto_617895 ?auto_617897 ) ) ( not ( = ?auto_617895 ?auto_617898 ) ) ( not ( = ?auto_617896 ?auto_617897 ) ) ( not ( = ?auto_617896 ?auto_617898 ) ) ( not ( = ?auto_617897 ?auto_617898 ) ) ( ON ?auto_617896 ?auto_617897 ) ( ON ?auto_617895 ?auto_617896 ) ( ON ?auto_617894 ?auto_617895 ) ( ON ?auto_617893 ?auto_617894 ) ( ON ?auto_617892 ?auto_617893 ) ( ON ?auto_617891 ?auto_617892 ) ( ON ?auto_617890 ?auto_617891 ) ( ON ?auto_617889 ?auto_617890 ) ( ON ?auto_617888 ?auto_617889 ) ( ON ?auto_617887 ?auto_617888 ) ( ON ?auto_617886 ?auto_617887 ) ( ON ?auto_617885 ?auto_617886 ) ( CLEAR ?auto_617883 ) ( ON ?auto_617884 ?auto_617885 ) ( CLEAR ?auto_617884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_617883 ?auto_617884 )
      ( MAKE-15PILE ?auto_617883 ?auto_617884 ?auto_617885 ?auto_617886 ?auto_617887 ?auto_617888 ?auto_617889 ?auto_617890 ?auto_617891 ?auto_617892 ?auto_617893 ?auto_617894 ?auto_617895 ?auto_617896 ?auto_617897 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_617945 - BLOCK
      ?auto_617946 - BLOCK
      ?auto_617947 - BLOCK
      ?auto_617948 - BLOCK
      ?auto_617949 - BLOCK
      ?auto_617950 - BLOCK
      ?auto_617951 - BLOCK
      ?auto_617952 - BLOCK
      ?auto_617953 - BLOCK
      ?auto_617954 - BLOCK
      ?auto_617955 - BLOCK
      ?auto_617956 - BLOCK
      ?auto_617957 - BLOCK
      ?auto_617958 - BLOCK
      ?auto_617959 - BLOCK
    )
    :vars
    (
      ?auto_617960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_617959 ?auto_617960 ) ( not ( = ?auto_617945 ?auto_617946 ) ) ( not ( = ?auto_617945 ?auto_617947 ) ) ( not ( = ?auto_617945 ?auto_617948 ) ) ( not ( = ?auto_617945 ?auto_617949 ) ) ( not ( = ?auto_617945 ?auto_617950 ) ) ( not ( = ?auto_617945 ?auto_617951 ) ) ( not ( = ?auto_617945 ?auto_617952 ) ) ( not ( = ?auto_617945 ?auto_617953 ) ) ( not ( = ?auto_617945 ?auto_617954 ) ) ( not ( = ?auto_617945 ?auto_617955 ) ) ( not ( = ?auto_617945 ?auto_617956 ) ) ( not ( = ?auto_617945 ?auto_617957 ) ) ( not ( = ?auto_617945 ?auto_617958 ) ) ( not ( = ?auto_617945 ?auto_617959 ) ) ( not ( = ?auto_617945 ?auto_617960 ) ) ( not ( = ?auto_617946 ?auto_617947 ) ) ( not ( = ?auto_617946 ?auto_617948 ) ) ( not ( = ?auto_617946 ?auto_617949 ) ) ( not ( = ?auto_617946 ?auto_617950 ) ) ( not ( = ?auto_617946 ?auto_617951 ) ) ( not ( = ?auto_617946 ?auto_617952 ) ) ( not ( = ?auto_617946 ?auto_617953 ) ) ( not ( = ?auto_617946 ?auto_617954 ) ) ( not ( = ?auto_617946 ?auto_617955 ) ) ( not ( = ?auto_617946 ?auto_617956 ) ) ( not ( = ?auto_617946 ?auto_617957 ) ) ( not ( = ?auto_617946 ?auto_617958 ) ) ( not ( = ?auto_617946 ?auto_617959 ) ) ( not ( = ?auto_617946 ?auto_617960 ) ) ( not ( = ?auto_617947 ?auto_617948 ) ) ( not ( = ?auto_617947 ?auto_617949 ) ) ( not ( = ?auto_617947 ?auto_617950 ) ) ( not ( = ?auto_617947 ?auto_617951 ) ) ( not ( = ?auto_617947 ?auto_617952 ) ) ( not ( = ?auto_617947 ?auto_617953 ) ) ( not ( = ?auto_617947 ?auto_617954 ) ) ( not ( = ?auto_617947 ?auto_617955 ) ) ( not ( = ?auto_617947 ?auto_617956 ) ) ( not ( = ?auto_617947 ?auto_617957 ) ) ( not ( = ?auto_617947 ?auto_617958 ) ) ( not ( = ?auto_617947 ?auto_617959 ) ) ( not ( = ?auto_617947 ?auto_617960 ) ) ( not ( = ?auto_617948 ?auto_617949 ) ) ( not ( = ?auto_617948 ?auto_617950 ) ) ( not ( = ?auto_617948 ?auto_617951 ) ) ( not ( = ?auto_617948 ?auto_617952 ) ) ( not ( = ?auto_617948 ?auto_617953 ) ) ( not ( = ?auto_617948 ?auto_617954 ) ) ( not ( = ?auto_617948 ?auto_617955 ) ) ( not ( = ?auto_617948 ?auto_617956 ) ) ( not ( = ?auto_617948 ?auto_617957 ) ) ( not ( = ?auto_617948 ?auto_617958 ) ) ( not ( = ?auto_617948 ?auto_617959 ) ) ( not ( = ?auto_617948 ?auto_617960 ) ) ( not ( = ?auto_617949 ?auto_617950 ) ) ( not ( = ?auto_617949 ?auto_617951 ) ) ( not ( = ?auto_617949 ?auto_617952 ) ) ( not ( = ?auto_617949 ?auto_617953 ) ) ( not ( = ?auto_617949 ?auto_617954 ) ) ( not ( = ?auto_617949 ?auto_617955 ) ) ( not ( = ?auto_617949 ?auto_617956 ) ) ( not ( = ?auto_617949 ?auto_617957 ) ) ( not ( = ?auto_617949 ?auto_617958 ) ) ( not ( = ?auto_617949 ?auto_617959 ) ) ( not ( = ?auto_617949 ?auto_617960 ) ) ( not ( = ?auto_617950 ?auto_617951 ) ) ( not ( = ?auto_617950 ?auto_617952 ) ) ( not ( = ?auto_617950 ?auto_617953 ) ) ( not ( = ?auto_617950 ?auto_617954 ) ) ( not ( = ?auto_617950 ?auto_617955 ) ) ( not ( = ?auto_617950 ?auto_617956 ) ) ( not ( = ?auto_617950 ?auto_617957 ) ) ( not ( = ?auto_617950 ?auto_617958 ) ) ( not ( = ?auto_617950 ?auto_617959 ) ) ( not ( = ?auto_617950 ?auto_617960 ) ) ( not ( = ?auto_617951 ?auto_617952 ) ) ( not ( = ?auto_617951 ?auto_617953 ) ) ( not ( = ?auto_617951 ?auto_617954 ) ) ( not ( = ?auto_617951 ?auto_617955 ) ) ( not ( = ?auto_617951 ?auto_617956 ) ) ( not ( = ?auto_617951 ?auto_617957 ) ) ( not ( = ?auto_617951 ?auto_617958 ) ) ( not ( = ?auto_617951 ?auto_617959 ) ) ( not ( = ?auto_617951 ?auto_617960 ) ) ( not ( = ?auto_617952 ?auto_617953 ) ) ( not ( = ?auto_617952 ?auto_617954 ) ) ( not ( = ?auto_617952 ?auto_617955 ) ) ( not ( = ?auto_617952 ?auto_617956 ) ) ( not ( = ?auto_617952 ?auto_617957 ) ) ( not ( = ?auto_617952 ?auto_617958 ) ) ( not ( = ?auto_617952 ?auto_617959 ) ) ( not ( = ?auto_617952 ?auto_617960 ) ) ( not ( = ?auto_617953 ?auto_617954 ) ) ( not ( = ?auto_617953 ?auto_617955 ) ) ( not ( = ?auto_617953 ?auto_617956 ) ) ( not ( = ?auto_617953 ?auto_617957 ) ) ( not ( = ?auto_617953 ?auto_617958 ) ) ( not ( = ?auto_617953 ?auto_617959 ) ) ( not ( = ?auto_617953 ?auto_617960 ) ) ( not ( = ?auto_617954 ?auto_617955 ) ) ( not ( = ?auto_617954 ?auto_617956 ) ) ( not ( = ?auto_617954 ?auto_617957 ) ) ( not ( = ?auto_617954 ?auto_617958 ) ) ( not ( = ?auto_617954 ?auto_617959 ) ) ( not ( = ?auto_617954 ?auto_617960 ) ) ( not ( = ?auto_617955 ?auto_617956 ) ) ( not ( = ?auto_617955 ?auto_617957 ) ) ( not ( = ?auto_617955 ?auto_617958 ) ) ( not ( = ?auto_617955 ?auto_617959 ) ) ( not ( = ?auto_617955 ?auto_617960 ) ) ( not ( = ?auto_617956 ?auto_617957 ) ) ( not ( = ?auto_617956 ?auto_617958 ) ) ( not ( = ?auto_617956 ?auto_617959 ) ) ( not ( = ?auto_617956 ?auto_617960 ) ) ( not ( = ?auto_617957 ?auto_617958 ) ) ( not ( = ?auto_617957 ?auto_617959 ) ) ( not ( = ?auto_617957 ?auto_617960 ) ) ( not ( = ?auto_617958 ?auto_617959 ) ) ( not ( = ?auto_617958 ?auto_617960 ) ) ( not ( = ?auto_617959 ?auto_617960 ) ) ( ON ?auto_617958 ?auto_617959 ) ( ON ?auto_617957 ?auto_617958 ) ( ON ?auto_617956 ?auto_617957 ) ( ON ?auto_617955 ?auto_617956 ) ( ON ?auto_617954 ?auto_617955 ) ( ON ?auto_617953 ?auto_617954 ) ( ON ?auto_617952 ?auto_617953 ) ( ON ?auto_617951 ?auto_617952 ) ( ON ?auto_617950 ?auto_617951 ) ( ON ?auto_617949 ?auto_617950 ) ( ON ?auto_617948 ?auto_617949 ) ( ON ?auto_617947 ?auto_617948 ) ( ON ?auto_617946 ?auto_617947 ) ( ON ?auto_617945 ?auto_617946 ) ( CLEAR ?auto_617945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_617945 )
      ( MAKE-15PILE ?auto_617945 ?auto_617946 ?auto_617947 ?auto_617948 ?auto_617949 ?auto_617950 ?auto_617951 ?auto_617952 ?auto_617953 ?auto_617954 ?auto_617955 ?auto_617956 ?auto_617957 ?auto_617958 ?auto_617959 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618008 - BLOCK
      ?auto_618009 - BLOCK
      ?auto_618010 - BLOCK
      ?auto_618011 - BLOCK
      ?auto_618012 - BLOCK
      ?auto_618013 - BLOCK
      ?auto_618014 - BLOCK
      ?auto_618015 - BLOCK
      ?auto_618016 - BLOCK
      ?auto_618017 - BLOCK
      ?auto_618018 - BLOCK
      ?auto_618019 - BLOCK
      ?auto_618020 - BLOCK
      ?auto_618021 - BLOCK
      ?auto_618022 - BLOCK
      ?auto_618023 - BLOCK
    )
    :vars
    (
      ?auto_618024 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_618022 ) ( ON ?auto_618023 ?auto_618024 ) ( CLEAR ?auto_618023 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_618008 ) ( ON ?auto_618009 ?auto_618008 ) ( ON ?auto_618010 ?auto_618009 ) ( ON ?auto_618011 ?auto_618010 ) ( ON ?auto_618012 ?auto_618011 ) ( ON ?auto_618013 ?auto_618012 ) ( ON ?auto_618014 ?auto_618013 ) ( ON ?auto_618015 ?auto_618014 ) ( ON ?auto_618016 ?auto_618015 ) ( ON ?auto_618017 ?auto_618016 ) ( ON ?auto_618018 ?auto_618017 ) ( ON ?auto_618019 ?auto_618018 ) ( ON ?auto_618020 ?auto_618019 ) ( ON ?auto_618021 ?auto_618020 ) ( ON ?auto_618022 ?auto_618021 ) ( not ( = ?auto_618008 ?auto_618009 ) ) ( not ( = ?auto_618008 ?auto_618010 ) ) ( not ( = ?auto_618008 ?auto_618011 ) ) ( not ( = ?auto_618008 ?auto_618012 ) ) ( not ( = ?auto_618008 ?auto_618013 ) ) ( not ( = ?auto_618008 ?auto_618014 ) ) ( not ( = ?auto_618008 ?auto_618015 ) ) ( not ( = ?auto_618008 ?auto_618016 ) ) ( not ( = ?auto_618008 ?auto_618017 ) ) ( not ( = ?auto_618008 ?auto_618018 ) ) ( not ( = ?auto_618008 ?auto_618019 ) ) ( not ( = ?auto_618008 ?auto_618020 ) ) ( not ( = ?auto_618008 ?auto_618021 ) ) ( not ( = ?auto_618008 ?auto_618022 ) ) ( not ( = ?auto_618008 ?auto_618023 ) ) ( not ( = ?auto_618008 ?auto_618024 ) ) ( not ( = ?auto_618009 ?auto_618010 ) ) ( not ( = ?auto_618009 ?auto_618011 ) ) ( not ( = ?auto_618009 ?auto_618012 ) ) ( not ( = ?auto_618009 ?auto_618013 ) ) ( not ( = ?auto_618009 ?auto_618014 ) ) ( not ( = ?auto_618009 ?auto_618015 ) ) ( not ( = ?auto_618009 ?auto_618016 ) ) ( not ( = ?auto_618009 ?auto_618017 ) ) ( not ( = ?auto_618009 ?auto_618018 ) ) ( not ( = ?auto_618009 ?auto_618019 ) ) ( not ( = ?auto_618009 ?auto_618020 ) ) ( not ( = ?auto_618009 ?auto_618021 ) ) ( not ( = ?auto_618009 ?auto_618022 ) ) ( not ( = ?auto_618009 ?auto_618023 ) ) ( not ( = ?auto_618009 ?auto_618024 ) ) ( not ( = ?auto_618010 ?auto_618011 ) ) ( not ( = ?auto_618010 ?auto_618012 ) ) ( not ( = ?auto_618010 ?auto_618013 ) ) ( not ( = ?auto_618010 ?auto_618014 ) ) ( not ( = ?auto_618010 ?auto_618015 ) ) ( not ( = ?auto_618010 ?auto_618016 ) ) ( not ( = ?auto_618010 ?auto_618017 ) ) ( not ( = ?auto_618010 ?auto_618018 ) ) ( not ( = ?auto_618010 ?auto_618019 ) ) ( not ( = ?auto_618010 ?auto_618020 ) ) ( not ( = ?auto_618010 ?auto_618021 ) ) ( not ( = ?auto_618010 ?auto_618022 ) ) ( not ( = ?auto_618010 ?auto_618023 ) ) ( not ( = ?auto_618010 ?auto_618024 ) ) ( not ( = ?auto_618011 ?auto_618012 ) ) ( not ( = ?auto_618011 ?auto_618013 ) ) ( not ( = ?auto_618011 ?auto_618014 ) ) ( not ( = ?auto_618011 ?auto_618015 ) ) ( not ( = ?auto_618011 ?auto_618016 ) ) ( not ( = ?auto_618011 ?auto_618017 ) ) ( not ( = ?auto_618011 ?auto_618018 ) ) ( not ( = ?auto_618011 ?auto_618019 ) ) ( not ( = ?auto_618011 ?auto_618020 ) ) ( not ( = ?auto_618011 ?auto_618021 ) ) ( not ( = ?auto_618011 ?auto_618022 ) ) ( not ( = ?auto_618011 ?auto_618023 ) ) ( not ( = ?auto_618011 ?auto_618024 ) ) ( not ( = ?auto_618012 ?auto_618013 ) ) ( not ( = ?auto_618012 ?auto_618014 ) ) ( not ( = ?auto_618012 ?auto_618015 ) ) ( not ( = ?auto_618012 ?auto_618016 ) ) ( not ( = ?auto_618012 ?auto_618017 ) ) ( not ( = ?auto_618012 ?auto_618018 ) ) ( not ( = ?auto_618012 ?auto_618019 ) ) ( not ( = ?auto_618012 ?auto_618020 ) ) ( not ( = ?auto_618012 ?auto_618021 ) ) ( not ( = ?auto_618012 ?auto_618022 ) ) ( not ( = ?auto_618012 ?auto_618023 ) ) ( not ( = ?auto_618012 ?auto_618024 ) ) ( not ( = ?auto_618013 ?auto_618014 ) ) ( not ( = ?auto_618013 ?auto_618015 ) ) ( not ( = ?auto_618013 ?auto_618016 ) ) ( not ( = ?auto_618013 ?auto_618017 ) ) ( not ( = ?auto_618013 ?auto_618018 ) ) ( not ( = ?auto_618013 ?auto_618019 ) ) ( not ( = ?auto_618013 ?auto_618020 ) ) ( not ( = ?auto_618013 ?auto_618021 ) ) ( not ( = ?auto_618013 ?auto_618022 ) ) ( not ( = ?auto_618013 ?auto_618023 ) ) ( not ( = ?auto_618013 ?auto_618024 ) ) ( not ( = ?auto_618014 ?auto_618015 ) ) ( not ( = ?auto_618014 ?auto_618016 ) ) ( not ( = ?auto_618014 ?auto_618017 ) ) ( not ( = ?auto_618014 ?auto_618018 ) ) ( not ( = ?auto_618014 ?auto_618019 ) ) ( not ( = ?auto_618014 ?auto_618020 ) ) ( not ( = ?auto_618014 ?auto_618021 ) ) ( not ( = ?auto_618014 ?auto_618022 ) ) ( not ( = ?auto_618014 ?auto_618023 ) ) ( not ( = ?auto_618014 ?auto_618024 ) ) ( not ( = ?auto_618015 ?auto_618016 ) ) ( not ( = ?auto_618015 ?auto_618017 ) ) ( not ( = ?auto_618015 ?auto_618018 ) ) ( not ( = ?auto_618015 ?auto_618019 ) ) ( not ( = ?auto_618015 ?auto_618020 ) ) ( not ( = ?auto_618015 ?auto_618021 ) ) ( not ( = ?auto_618015 ?auto_618022 ) ) ( not ( = ?auto_618015 ?auto_618023 ) ) ( not ( = ?auto_618015 ?auto_618024 ) ) ( not ( = ?auto_618016 ?auto_618017 ) ) ( not ( = ?auto_618016 ?auto_618018 ) ) ( not ( = ?auto_618016 ?auto_618019 ) ) ( not ( = ?auto_618016 ?auto_618020 ) ) ( not ( = ?auto_618016 ?auto_618021 ) ) ( not ( = ?auto_618016 ?auto_618022 ) ) ( not ( = ?auto_618016 ?auto_618023 ) ) ( not ( = ?auto_618016 ?auto_618024 ) ) ( not ( = ?auto_618017 ?auto_618018 ) ) ( not ( = ?auto_618017 ?auto_618019 ) ) ( not ( = ?auto_618017 ?auto_618020 ) ) ( not ( = ?auto_618017 ?auto_618021 ) ) ( not ( = ?auto_618017 ?auto_618022 ) ) ( not ( = ?auto_618017 ?auto_618023 ) ) ( not ( = ?auto_618017 ?auto_618024 ) ) ( not ( = ?auto_618018 ?auto_618019 ) ) ( not ( = ?auto_618018 ?auto_618020 ) ) ( not ( = ?auto_618018 ?auto_618021 ) ) ( not ( = ?auto_618018 ?auto_618022 ) ) ( not ( = ?auto_618018 ?auto_618023 ) ) ( not ( = ?auto_618018 ?auto_618024 ) ) ( not ( = ?auto_618019 ?auto_618020 ) ) ( not ( = ?auto_618019 ?auto_618021 ) ) ( not ( = ?auto_618019 ?auto_618022 ) ) ( not ( = ?auto_618019 ?auto_618023 ) ) ( not ( = ?auto_618019 ?auto_618024 ) ) ( not ( = ?auto_618020 ?auto_618021 ) ) ( not ( = ?auto_618020 ?auto_618022 ) ) ( not ( = ?auto_618020 ?auto_618023 ) ) ( not ( = ?auto_618020 ?auto_618024 ) ) ( not ( = ?auto_618021 ?auto_618022 ) ) ( not ( = ?auto_618021 ?auto_618023 ) ) ( not ( = ?auto_618021 ?auto_618024 ) ) ( not ( = ?auto_618022 ?auto_618023 ) ) ( not ( = ?auto_618022 ?auto_618024 ) ) ( not ( = ?auto_618023 ?auto_618024 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_618023 ?auto_618024 )
      ( !STACK ?auto_618023 ?auto_618022 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618074 - BLOCK
      ?auto_618075 - BLOCK
      ?auto_618076 - BLOCK
      ?auto_618077 - BLOCK
      ?auto_618078 - BLOCK
      ?auto_618079 - BLOCK
      ?auto_618080 - BLOCK
      ?auto_618081 - BLOCK
      ?auto_618082 - BLOCK
      ?auto_618083 - BLOCK
      ?auto_618084 - BLOCK
      ?auto_618085 - BLOCK
      ?auto_618086 - BLOCK
      ?auto_618087 - BLOCK
      ?auto_618088 - BLOCK
      ?auto_618089 - BLOCK
    )
    :vars
    (
      ?auto_618090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618089 ?auto_618090 ) ( ON-TABLE ?auto_618074 ) ( ON ?auto_618075 ?auto_618074 ) ( ON ?auto_618076 ?auto_618075 ) ( ON ?auto_618077 ?auto_618076 ) ( ON ?auto_618078 ?auto_618077 ) ( ON ?auto_618079 ?auto_618078 ) ( ON ?auto_618080 ?auto_618079 ) ( ON ?auto_618081 ?auto_618080 ) ( ON ?auto_618082 ?auto_618081 ) ( ON ?auto_618083 ?auto_618082 ) ( ON ?auto_618084 ?auto_618083 ) ( ON ?auto_618085 ?auto_618084 ) ( ON ?auto_618086 ?auto_618085 ) ( ON ?auto_618087 ?auto_618086 ) ( not ( = ?auto_618074 ?auto_618075 ) ) ( not ( = ?auto_618074 ?auto_618076 ) ) ( not ( = ?auto_618074 ?auto_618077 ) ) ( not ( = ?auto_618074 ?auto_618078 ) ) ( not ( = ?auto_618074 ?auto_618079 ) ) ( not ( = ?auto_618074 ?auto_618080 ) ) ( not ( = ?auto_618074 ?auto_618081 ) ) ( not ( = ?auto_618074 ?auto_618082 ) ) ( not ( = ?auto_618074 ?auto_618083 ) ) ( not ( = ?auto_618074 ?auto_618084 ) ) ( not ( = ?auto_618074 ?auto_618085 ) ) ( not ( = ?auto_618074 ?auto_618086 ) ) ( not ( = ?auto_618074 ?auto_618087 ) ) ( not ( = ?auto_618074 ?auto_618088 ) ) ( not ( = ?auto_618074 ?auto_618089 ) ) ( not ( = ?auto_618074 ?auto_618090 ) ) ( not ( = ?auto_618075 ?auto_618076 ) ) ( not ( = ?auto_618075 ?auto_618077 ) ) ( not ( = ?auto_618075 ?auto_618078 ) ) ( not ( = ?auto_618075 ?auto_618079 ) ) ( not ( = ?auto_618075 ?auto_618080 ) ) ( not ( = ?auto_618075 ?auto_618081 ) ) ( not ( = ?auto_618075 ?auto_618082 ) ) ( not ( = ?auto_618075 ?auto_618083 ) ) ( not ( = ?auto_618075 ?auto_618084 ) ) ( not ( = ?auto_618075 ?auto_618085 ) ) ( not ( = ?auto_618075 ?auto_618086 ) ) ( not ( = ?auto_618075 ?auto_618087 ) ) ( not ( = ?auto_618075 ?auto_618088 ) ) ( not ( = ?auto_618075 ?auto_618089 ) ) ( not ( = ?auto_618075 ?auto_618090 ) ) ( not ( = ?auto_618076 ?auto_618077 ) ) ( not ( = ?auto_618076 ?auto_618078 ) ) ( not ( = ?auto_618076 ?auto_618079 ) ) ( not ( = ?auto_618076 ?auto_618080 ) ) ( not ( = ?auto_618076 ?auto_618081 ) ) ( not ( = ?auto_618076 ?auto_618082 ) ) ( not ( = ?auto_618076 ?auto_618083 ) ) ( not ( = ?auto_618076 ?auto_618084 ) ) ( not ( = ?auto_618076 ?auto_618085 ) ) ( not ( = ?auto_618076 ?auto_618086 ) ) ( not ( = ?auto_618076 ?auto_618087 ) ) ( not ( = ?auto_618076 ?auto_618088 ) ) ( not ( = ?auto_618076 ?auto_618089 ) ) ( not ( = ?auto_618076 ?auto_618090 ) ) ( not ( = ?auto_618077 ?auto_618078 ) ) ( not ( = ?auto_618077 ?auto_618079 ) ) ( not ( = ?auto_618077 ?auto_618080 ) ) ( not ( = ?auto_618077 ?auto_618081 ) ) ( not ( = ?auto_618077 ?auto_618082 ) ) ( not ( = ?auto_618077 ?auto_618083 ) ) ( not ( = ?auto_618077 ?auto_618084 ) ) ( not ( = ?auto_618077 ?auto_618085 ) ) ( not ( = ?auto_618077 ?auto_618086 ) ) ( not ( = ?auto_618077 ?auto_618087 ) ) ( not ( = ?auto_618077 ?auto_618088 ) ) ( not ( = ?auto_618077 ?auto_618089 ) ) ( not ( = ?auto_618077 ?auto_618090 ) ) ( not ( = ?auto_618078 ?auto_618079 ) ) ( not ( = ?auto_618078 ?auto_618080 ) ) ( not ( = ?auto_618078 ?auto_618081 ) ) ( not ( = ?auto_618078 ?auto_618082 ) ) ( not ( = ?auto_618078 ?auto_618083 ) ) ( not ( = ?auto_618078 ?auto_618084 ) ) ( not ( = ?auto_618078 ?auto_618085 ) ) ( not ( = ?auto_618078 ?auto_618086 ) ) ( not ( = ?auto_618078 ?auto_618087 ) ) ( not ( = ?auto_618078 ?auto_618088 ) ) ( not ( = ?auto_618078 ?auto_618089 ) ) ( not ( = ?auto_618078 ?auto_618090 ) ) ( not ( = ?auto_618079 ?auto_618080 ) ) ( not ( = ?auto_618079 ?auto_618081 ) ) ( not ( = ?auto_618079 ?auto_618082 ) ) ( not ( = ?auto_618079 ?auto_618083 ) ) ( not ( = ?auto_618079 ?auto_618084 ) ) ( not ( = ?auto_618079 ?auto_618085 ) ) ( not ( = ?auto_618079 ?auto_618086 ) ) ( not ( = ?auto_618079 ?auto_618087 ) ) ( not ( = ?auto_618079 ?auto_618088 ) ) ( not ( = ?auto_618079 ?auto_618089 ) ) ( not ( = ?auto_618079 ?auto_618090 ) ) ( not ( = ?auto_618080 ?auto_618081 ) ) ( not ( = ?auto_618080 ?auto_618082 ) ) ( not ( = ?auto_618080 ?auto_618083 ) ) ( not ( = ?auto_618080 ?auto_618084 ) ) ( not ( = ?auto_618080 ?auto_618085 ) ) ( not ( = ?auto_618080 ?auto_618086 ) ) ( not ( = ?auto_618080 ?auto_618087 ) ) ( not ( = ?auto_618080 ?auto_618088 ) ) ( not ( = ?auto_618080 ?auto_618089 ) ) ( not ( = ?auto_618080 ?auto_618090 ) ) ( not ( = ?auto_618081 ?auto_618082 ) ) ( not ( = ?auto_618081 ?auto_618083 ) ) ( not ( = ?auto_618081 ?auto_618084 ) ) ( not ( = ?auto_618081 ?auto_618085 ) ) ( not ( = ?auto_618081 ?auto_618086 ) ) ( not ( = ?auto_618081 ?auto_618087 ) ) ( not ( = ?auto_618081 ?auto_618088 ) ) ( not ( = ?auto_618081 ?auto_618089 ) ) ( not ( = ?auto_618081 ?auto_618090 ) ) ( not ( = ?auto_618082 ?auto_618083 ) ) ( not ( = ?auto_618082 ?auto_618084 ) ) ( not ( = ?auto_618082 ?auto_618085 ) ) ( not ( = ?auto_618082 ?auto_618086 ) ) ( not ( = ?auto_618082 ?auto_618087 ) ) ( not ( = ?auto_618082 ?auto_618088 ) ) ( not ( = ?auto_618082 ?auto_618089 ) ) ( not ( = ?auto_618082 ?auto_618090 ) ) ( not ( = ?auto_618083 ?auto_618084 ) ) ( not ( = ?auto_618083 ?auto_618085 ) ) ( not ( = ?auto_618083 ?auto_618086 ) ) ( not ( = ?auto_618083 ?auto_618087 ) ) ( not ( = ?auto_618083 ?auto_618088 ) ) ( not ( = ?auto_618083 ?auto_618089 ) ) ( not ( = ?auto_618083 ?auto_618090 ) ) ( not ( = ?auto_618084 ?auto_618085 ) ) ( not ( = ?auto_618084 ?auto_618086 ) ) ( not ( = ?auto_618084 ?auto_618087 ) ) ( not ( = ?auto_618084 ?auto_618088 ) ) ( not ( = ?auto_618084 ?auto_618089 ) ) ( not ( = ?auto_618084 ?auto_618090 ) ) ( not ( = ?auto_618085 ?auto_618086 ) ) ( not ( = ?auto_618085 ?auto_618087 ) ) ( not ( = ?auto_618085 ?auto_618088 ) ) ( not ( = ?auto_618085 ?auto_618089 ) ) ( not ( = ?auto_618085 ?auto_618090 ) ) ( not ( = ?auto_618086 ?auto_618087 ) ) ( not ( = ?auto_618086 ?auto_618088 ) ) ( not ( = ?auto_618086 ?auto_618089 ) ) ( not ( = ?auto_618086 ?auto_618090 ) ) ( not ( = ?auto_618087 ?auto_618088 ) ) ( not ( = ?auto_618087 ?auto_618089 ) ) ( not ( = ?auto_618087 ?auto_618090 ) ) ( not ( = ?auto_618088 ?auto_618089 ) ) ( not ( = ?auto_618088 ?auto_618090 ) ) ( not ( = ?auto_618089 ?auto_618090 ) ) ( CLEAR ?auto_618087 ) ( ON ?auto_618088 ?auto_618089 ) ( CLEAR ?auto_618088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_618074 ?auto_618075 ?auto_618076 ?auto_618077 ?auto_618078 ?auto_618079 ?auto_618080 ?auto_618081 ?auto_618082 ?auto_618083 ?auto_618084 ?auto_618085 ?auto_618086 ?auto_618087 ?auto_618088 )
      ( MAKE-16PILE ?auto_618074 ?auto_618075 ?auto_618076 ?auto_618077 ?auto_618078 ?auto_618079 ?auto_618080 ?auto_618081 ?auto_618082 ?auto_618083 ?auto_618084 ?auto_618085 ?auto_618086 ?auto_618087 ?auto_618088 ?auto_618089 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618140 - BLOCK
      ?auto_618141 - BLOCK
      ?auto_618142 - BLOCK
      ?auto_618143 - BLOCK
      ?auto_618144 - BLOCK
      ?auto_618145 - BLOCK
      ?auto_618146 - BLOCK
      ?auto_618147 - BLOCK
      ?auto_618148 - BLOCK
      ?auto_618149 - BLOCK
      ?auto_618150 - BLOCK
      ?auto_618151 - BLOCK
      ?auto_618152 - BLOCK
      ?auto_618153 - BLOCK
      ?auto_618154 - BLOCK
      ?auto_618155 - BLOCK
    )
    :vars
    (
      ?auto_618156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618155 ?auto_618156 ) ( ON-TABLE ?auto_618140 ) ( ON ?auto_618141 ?auto_618140 ) ( ON ?auto_618142 ?auto_618141 ) ( ON ?auto_618143 ?auto_618142 ) ( ON ?auto_618144 ?auto_618143 ) ( ON ?auto_618145 ?auto_618144 ) ( ON ?auto_618146 ?auto_618145 ) ( ON ?auto_618147 ?auto_618146 ) ( ON ?auto_618148 ?auto_618147 ) ( ON ?auto_618149 ?auto_618148 ) ( ON ?auto_618150 ?auto_618149 ) ( ON ?auto_618151 ?auto_618150 ) ( ON ?auto_618152 ?auto_618151 ) ( not ( = ?auto_618140 ?auto_618141 ) ) ( not ( = ?auto_618140 ?auto_618142 ) ) ( not ( = ?auto_618140 ?auto_618143 ) ) ( not ( = ?auto_618140 ?auto_618144 ) ) ( not ( = ?auto_618140 ?auto_618145 ) ) ( not ( = ?auto_618140 ?auto_618146 ) ) ( not ( = ?auto_618140 ?auto_618147 ) ) ( not ( = ?auto_618140 ?auto_618148 ) ) ( not ( = ?auto_618140 ?auto_618149 ) ) ( not ( = ?auto_618140 ?auto_618150 ) ) ( not ( = ?auto_618140 ?auto_618151 ) ) ( not ( = ?auto_618140 ?auto_618152 ) ) ( not ( = ?auto_618140 ?auto_618153 ) ) ( not ( = ?auto_618140 ?auto_618154 ) ) ( not ( = ?auto_618140 ?auto_618155 ) ) ( not ( = ?auto_618140 ?auto_618156 ) ) ( not ( = ?auto_618141 ?auto_618142 ) ) ( not ( = ?auto_618141 ?auto_618143 ) ) ( not ( = ?auto_618141 ?auto_618144 ) ) ( not ( = ?auto_618141 ?auto_618145 ) ) ( not ( = ?auto_618141 ?auto_618146 ) ) ( not ( = ?auto_618141 ?auto_618147 ) ) ( not ( = ?auto_618141 ?auto_618148 ) ) ( not ( = ?auto_618141 ?auto_618149 ) ) ( not ( = ?auto_618141 ?auto_618150 ) ) ( not ( = ?auto_618141 ?auto_618151 ) ) ( not ( = ?auto_618141 ?auto_618152 ) ) ( not ( = ?auto_618141 ?auto_618153 ) ) ( not ( = ?auto_618141 ?auto_618154 ) ) ( not ( = ?auto_618141 ?auto_618155 ) ) ( not ( = ?auto_618141 ?auto_618156 ) ) ( not ( = ?auto_618142 ?auto_618143 ) ) ( not ( = ?auto_618142 ?auto_618144 ) ) ( not ( = ?auto_618142 ?auto_618145 ) ) ( not ( = ?auto_618142 ?auto_618146 ) ) ( not ( = ?auto_618142 ?auto_618147 ) ) ( not ( = ?auto_618142 ?auto_618148 ) ) ( not ( = ?auto_618142 ?auto_618149 ) ) ( not ( = ?auto_618142 ?auto_618150 ) ) ( not ( = ?auto_618142 ?auto_618151 ) ) ( not ( = ?auto_618142 ?auto_618152 ) ) ( not ( = ?auto_618142 ?auto_618153 ) ) ( not ( = ?auto_618142 ?auto_618154 ) ) ( not ( = ?auto_618142 ?auto_618155 ) ) ( not ( = ?auto_618142 ?auto_618156 ) ) ( not ( = ?auto_618143 ?auto_618144 ) ) ( not ( = ?auto_618143 ?auto_618145 ) ) ( not ( = ?auto_618143 ?auto_618146 ) ) ( not ( = ?auto_618143 ?auto_618147 ) ) ( not ( = ?auto_618143 ?auto_618148 ) ) ( not ( = ?auto_618143 ?auto_618149 ) ) ( not ( = ?auto_618143 ?auto_618150 ) ) ( not ( = ?auto_618143 ?auto_618151 ) ) ( not ( = ?auto_618143 ?auto_618152 ) ) ( not ( = ?auto_618143 ?auto_618153 ) ) ( not ( = ?auto_618143 ?auto_618154 ) ) ( not ( = ?auto_618143 ?auto_618155 ) ) ( not ( = ?auto_618143 ?auto_618156 ) ) ( not ( = ?auto_618144 ?auto_618145 ) ) ( not ( = ?auto_618144 ?auto_618146 ) ) ( not ( = ?auto_618144 ?auto_618147 ) ) ( not ( = ?auto_618144 ?auto_618148 ) ) ( not ( = ?auto_618144 ?auto_618149 ) ) ( not ( = ?auto_618144 ?auto_618150 ) ) ( not ( = ?auto_618144 ?auto_618151 ) ) ( not ( = ?auto_618144 ?auto_618152 ) ) ( not ( = ?auto_618144 ?auto_618153 ) ) ( not ( = ?auto_618144 ?auto_618154 ) ) ( not ( = ?auto_618144 ?auto_618155 ) ) ( not ( = ?auto_618144 ?auto_618156 ) ) ( not ( = ?auto_618145 ?auto_618146 ) ) ( not ( = ?auto_618145 ?auto_618147 ) ) ( not ( = ?auto_618145 ?auto_618148 ) ) ( not ( = ?auto_618145 ?auto_618149 ) ) ( not ( = ?auto_618145 ?auto_618150 ) ) ( not ( = ?auto_618145 ?auto_618151 ) ) ( not ( = ?auto_618145 ?auto_618152 ) ) ( not ( = ?auto_618145 ?auto_618153 ) ) ( not ( = ?auto_618145 ?auto_618154 ) ) ( not ( = ?auto_618145 ?auto_618155 ) ) ( not ( = ?auto_618145 ?auto_618156 ) ) ( not ( = ?auto_618146 ?auto_618147 ) ) ( not ( = ?auto_618146 ?auto_618148 ) ) ( not ( = ?auto_618146 ?auto_618149 ) ) ( not ( = ?auto_618146 ?auto_618150 ) ) ( not ( = ?auto_618146 ?auto_618151 ) ) ( not ( = ?auto_618146 ?auto_618152 ) ) ( not ( = ?auto_618146 ?auto_618153 ) ) ( not ( = ?auto_618146 ?auto_618154 ) ) ( not ( = ?auto_618146 ?auto_618155 ) ) ( not ( = ?auto_618146 ?auto_618156 ) ) ( not ( = ?auto_618147 ?auto_618148 ) ) ( not ( = ?auto_618147 ?auto_618149 ) ) ( not ( = ?auto_618147 ?auto_618150 ) ) ( not ( = ?auto_618147 ?auto_618151 ) ) ( not ( = ?auto_618147 ?auto_618152 ) ) ( not ( = ?auto_618147 ?auto_618153 ) ) ( not ( = ?auto_618147 ?auto_618154 ) ) ( not ( = ?auto_618147 ?auto_618155 ) ) ( not ( = ?auto_618147 ?auto_618156 ) ) ( not ( = ?auto_618148 ?auto_618149 ) ) ( not ( = ?auto_618148 ?auto_618150 ) ) ( not ( = ?auto_618148 ?auto_618151 ) ) ( not ( = ?auto_618148 ?auto_618152 ) ) ( not ( = ?auto_618148 ?auto_618153 ) ) ( not ( = ?auto_618148 ?auto_618154 ) ) ( not ( = ?auto_618148 ?auto_618155 ) ) ( not ( = ?auto_618148 ?auto_618156 ) ) ( not ( = ?auto_618149 ?auto_618150 ) ) ( not ( = ?auto_618149 ?auto_618151 ) ) ( not ( = ?auto_618149 ?auto_618152 ) ) ( not ( = ?auto_618149 ?auto_618153 ) ) ( not ( = ?auto_618149 ?auto_618154 ) ) ( not ( = ?auto_618149 ?auto_618155 ) ) ( not ( = ?auto_618149 ?auto_618156 ) ) ( not ( = ?auto_618150 ?auto_618151 ) ) ( not ( = ?auto_618150 ?auto_618152 ) ) ( not ( = ?auto_618150 ?auto_618153 ) ) ( not ( = ?auto_618150 ?auto_618154 ) ) ( not ( = ?auto_618150 ?auto_618155 ) ) ( not ( = ?auto_618150 ?auto_618156 ) ) ( not ( = ?auto_618151 ?auto_618152 ) ) ( not ( = ?auto_618151 ?auto_618153 ) ) ( not ( = ?auto_618151 ?auto_618154 ) ) ( not ( = ?auto_618151 ?auto_618155 ) ) ( not ( = ?auto_618151 ?auto_618156 ) ) ( not ( = ?auto_618152 ?auto_618153 ) ) ( not ( = ?auto_618152 ?auto_618154 ) ) ( not ( = ?auto_618152 ?auto_618155 ) ) ( not ( = ?auto_618152 ?auto_618156 ) ) ( not ( = ?auto_618153 ?auto_618154 ) ) ( not ( = ?auto_618153 ?auto_618155 ) ) ( not ( = ?auto_618153 ?auto_618156 ) ) ( not ( = ?auto_618154 ?auto_618155 ) ) ( not ( = ?auto_618154 ?auto_618156 ) ) ( not ( = ?auto_618155 ?auto_618156 ) ) ( ON ?auto_618154 ?auto_618155 ) ( CLEAR ?auto_618152 ) ( ON ?auto_618153 ?auto_618154 ) ( CLEAR ?auto_618153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_618140 ?auto_618141 ?auto_618142 ?auto_618143 ?auto_618144 ?auto_618145 ?auto_618146 ?auto_618147 ?auto_618148 ?auto_618149 ?auto_618150 ?auto_618151 ?auto_618152 ?auto_618153 )
      ( MAKE-16PILE ?auto_618140 ?auto_618141 ?auto_618142 ?auto_618143 ?auto_618144 ?auto_618145 ?auto_618146 ?auto_618147 ?auto_618148 ?auto_618149 ?auto_618150 ?auto_618151 ?auto_618152 ?auto_618153 ?auto_618154 ?auto_618155 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618206 - BLOCK
      ?auto_618207 - BLOCK
      ?auto_618208 - BLOCK
      ?auto_618209 - BLOCK
      ?auto_618210 - BLOCK
      ?auto_618211 - BLOCK
      ?auto_618212 - BLOCK
      ?auto_618213 - BLOCK
      ?auto_618214 - BLOCK
      ?auto_618215 - BLOCK
      ?auto_618216 - BLOCK
      ?auto_618217 - BLOCK
      ?auto_618218 - BLOCK
      ?auto_618219 - BLOCK
      ?auto_618220 - BLOCK
      ?auto_618221 - BLOCK
    )
    :vars
    (
      ?auto_618222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618221 ?auto_618222 ) ( ON-TABLE ?auto_618206 ) ( ON ?auto_618207 ?auto_618206 ) ( ON ?auto_618208 ?auto_618207 ) ( ON ?auto_618209 ?auto_618208 ) ( ON ?auto_618210 ?auto_618209 ) ( ON ?auto_618211 ?auto_618210 ) ( ON ?auto_618212 ?auto_618211 ) ( ON ?auto_618213 ?auto_618212 ) ( ON ?auto_618214 ?auto_618213 ) ( ON ?auto_618215 ?auto_618214 ) ( ON ?auto_618216 ?auto_618215 ) ( ON ?auto_618217 ?auto_618216 ) ( not ( = ?auto_618206 ?auto_618207 ) ) ( not ( = ?auto_618206 ?auto_618208 ) ) ( not ( = ?auto_618206 ?auto_618209 ) ) ( not ( = ?auto_618206 ?auto_618210 ) ) ( not ( = ?auto_618206 ?auto_618211 ) ) ( not ( = ?auto_618206 ?auto_618212 ) ) ( not ( = ?auto_618206 ?auto_618213 ) ) ( not ( = ?auto_618206 ?auto_618214 ) ) ( not ( = ?auto_618206 ?auto_618215 ) ) ( not ( = ?auto_618206 ?auto_618216 ) ) ( not ( = ?auto_618206 ?auto_618217 ) ) ( not ( = ?auto_618206 ?auto_618218 ) ) ( not ( = ?auto_618206 ?auto_618219 ) ) ( not ( = ?auto_618206 ?auto_618220 ) ) ( not ( = ?auto_618206 ?auto_618221 ) ) ( not ( = ?auto_618206 ?auto_618222 ) ) ( not ( = ?auto_618207 ?auto_618208 ) ) ( not ( = ?auto_618207 ?auto_618209 ) ) ( not ( = ?auto_618207 ?auto_618210 ) ) ( not ( = ?auto_618207 ?auto_618211 ) ) ( not ( = ?auto_618207 ?auto_618212 ) ) ( not ( = ?auto_618207 ?auto_618213 ) ) ( not ( = ?auto_618207 ?auto_618214 ) ) ( not ( = ?auto_618207 ?auto_618215 ) ) ( not ( = ?auto_618207 ?auto_618216 ) ) ( not ( = ?auto_618207 ?auto_618217 ) ) ( not ( = ?auto_618207 ?auto_618218 ) ) ( not ( = ?auto_618207 ?auto_618219 ) ) ( not ( = ?auto_618207 ?auto_618220 ) ) ( not ( = ?auto_618207 ?auto_618221 ) ) ( not ( = ?auto_618207 ?auto_618222 ) ) ( not ( = ?auto_618208 ?auto_618209 ) ) ( not ( = ?auto_618208 ?auto_618210 ) ) ( not ( = ?auto_618208 ?auto_618211 ) ) ( not ( = ?auto_618208 ?auto_618212 ) ) ( not ( = ?auto_618208 ?auto_618213 ) ) ( not ( = ?auto_618208 ?auto_618214 ) ) ( not ( = ?auto_618208 ?auto_618215 ) ) ( not ( = ?auto_618208 ?auto_618216 ) ) ( not ( = ?auto_618208 ?auto_618217 ) ) ( not ( = ?auto_618208 ?auto_618218 ) ) ( not ( = ?auto_618208 ?auto_618219 ) ) ( not ( = ?auto_618208 ?auto_618220 ) ) ( not ( = ?auto_618208 ?auto_618221 ) ) ( not ( = ?auto_618208 ?auto_618222 ) ) ( not ( = ?auto_618209 ?auto_618210 ) ) ( not ( = ?auto_618209 ?auto_618211 ) ) ( not ( = ?auto_618209 ?auto_618212 ) ) ( not ( = ?auto_618209 ?auto_618213 ) ) ( not ( = ?auto_618209 ?auto_618214 ) ) ( not ( = ?auto_618209 ?auto_618215 ) ) ( not ( = ?auto_618209 ?auto_618216 ) ) ( not ( = ?auto_618209 ?auto_618217 ) ) ( not ( = ?auto_618209 ?auto_618218 ) ) ( not ( = ?auto_618209 ?auto_618219 ) ) ( not ( = ?auto_618209 ?auto_618220 ) ) ( not ( = ?auto_618209 ?auto_618221 ) ) ( not ( = ?auto_618209 ?auto_618222 ) ) ( not ( = ?auto_618210 ?auto_618211 ) ) ( not ( = ?auto_618210 ?auto_618212 ) ) ( not ( = ?auto_618210 ?auto_618213 ) ) ( not ( = ?auto_618210 ?auto_618214 ) ) ( not ( = ?auto_618210 ?auto_618215 ) ) ( not ( = ?auto_618210 ?auto_618216 ) ) ( not ( = ?auto_618210 ?auto_618217 ) ) ( not ( = ?auto_618210 ?auto_618218 ) ) ( not ( = ?auto_618210 ?auto_618219 ) ) ( not ( = ?auto_618210 ?auto_618220 ) ) ( not ( = ?auto_618210 ?auto_618221 ) ) ( not ( = ?auto_618210 ?auto_618222 ) ) ( not ( = ?auto_618211 ?auto_618212 ) ) ( not ( = ?auto_618211 ?auto_618213 ) ) ( not ( = ?auto_618211 ?auto_618214 ) ) ( not ( = ?auto_618211 ?auto_618215 ) ) ( not ( = ?auto_618211 ?auto_618216 ) ) ( not ( = ?auto_618211 ?auto_618217 ) ) ( not ( = ?auto_618211 ?auto_618218 ) ) ( not ( = ?auto_618211 ?auto_618219 ) ) ( not ( = ?auto_618211 ?auto_618220 ) ) ( not ( = ?auto_618211 ?auto_618221 ) ) ( not ( = ?auto_618211 ?auto_618222 ) ) ( not ( = ?auto_618212 ?auto_618213 ) ) ( not ( = ?auto_618212 ?auto_618214 ) ) ( not ( = ?auto_618212 ?auto_618215 ) ) ( not ( = ?auto_618212 ?auto_618216 ) ) ( not ( = ?auto_618212 ?auto_618217 ) ) ( not ( = ?auto_618212 ?auto_618218 ) ) ( not ( = ?auto_618212 ?auto_618219 ) ) ( not ( = ?auto_618212 ?auto_618220 ) ) ( not ( = ?auto_618212 ?auto_618221 ) ) ( not ( = ?auto_618212 ?auto_618222 ) ) ( not ( = ?auto_618213 ?auto_618214 ) ) ( not ( = ?auto_618213 ?auto_618215 ) ) ( not ( = ?auto_618213 ?auto_618216 ) ) ( not ( = ?auto_618213 ?auto_618217 ) ) ( not ( = ?auto_618213 ?auto_618218 ) ) ( not ( = ?auto_618213 ?auto_618219 ) ) ( not ( = ?auto_618213 ?auto_618220 ) ) ( not ( = ?auto_618213 ?auto_618221 ) ) ( not ( = ?auto_618213 ?auto_618222 ) ) ( not ( = ?auto_618214 ?auto_618215 ) ) ( not ( = ?auto_618214 ?auto_618216 ) ) ( not ( = ?auto_618214 ?auto_618217 ) ) ( not ( = ?auto_618214 ?auto_618218 ) ) ( not ( = ?auto_618214 ?auto_618219 ) ) ( not ( = ?auto_618214 ?auto_618220 ) ) ( not ( = ?auto_618214 ?auto_618221 ) ) ( not ( = ?auto_618214 ?auto_618222 ) ) ( not ( = ?auto_618215 ?auto_618216 ) ) ( not ( = ?auto_618215 ?auto_618217 ) ) ( not ( = ?auto_618215 ?auto_618218 ) ) ( not ( = ?auto_618215 ?auto_618219 ) ) ( not ( = ?auto_618215 ?auto_618220 ) ) ( not ( = ?auto_618215 ?auto_618221 ) ) ( not ( = ?auto_618215 ?auto_618222 ) ) ( not ( = ?auto_618216 ?auto_618217 ) ) ( not ( = ?auto_618216 ?auto_618218 ) ) ( not ( = ?auto_618216 ?auto_618219 ) ) ( not ( = ?auto_618216 ?auto_618220 ) ) ( not ( = ?auto_618216 ?auto_618221 ) ) ( not ( = ?auto_618216 ?auto_618222 ) ) ( not ( = ?auto_618217 ?auto_618218 ) ) ( not ( = ?auto_618217 ?auto_618219 ) ) ( not ( = ?auto_618217 ?auto_618220 ) ) ( not ( = ?auto_618217 ?auto_618221 ) ) ( not ( = ?auto_618217 ?auto_618222 ) ) ( not ( = ?auto_618218 ?auto_618219 ) ) ( not ( = ?auto_618218 ?auto_618220 ) ) ( not ( = ?auto_618218 ?auto_618221 ) ) ( not ( = ?auto_618218 ?auto_618222 ) ) ( not ( = ?auto_618219 ?auto_618220 ) ) ( not ( = ?auto_618219 ?auto_618221 ) ) ( not ( = ?auto_618219 ?auto_618222 ) ) ( not ( = ?auto_618220 ?auto_618221 ) ) ( not ( = ?auto_618220 ?auto_618222 ) ) ( not ( = ?auto_618221 ?auto_618222 ) ) ( ON ?auto_618220 ?auto_618221 ) ( ON ?auto_618219 ?auto_618220 ) ( CLEAR ?auto_618217 ) ( ON ?auto_618218 ?auto_618219 ) ( CLEAR ?auto_618218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_618206 ?auto_618207 ?auto_618208 ?auto_618209 ?auto_618210 ?auto_618211 ?auto_618212 ?auto_618213 ?auto_618214 ?auto_618215 ?auto_618216 ?auto_618217 ?auto_618218 )
      ( MAKE-16PILE ?auto_618206 ?auto_618207 ?auto_618208 ?auto_618209 ?auto_618210 ?auto_618211 ?auto_618212 ?auto_618213 ?auto_618214 ?auto_618215 ?auto_618216 ?auto_618217 ?auto_618218 ?auto_618219 ?auto_618220 ?auto_618221 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618272 - BLOCK
      ?auto_618273 - BLOCK
      ?auto_618274 - BLOCK
      ?auto_618275 - BLOCK
      ?auto_618276 - BLOCK
      ?auto_618277 - BLOCK
      ?auto_618278 - BLOCK
      ?auto_618279 - BLOCK
      ?auto_618280 - BLOCK
      ?auto_618281 - BLOCK
      ?auto_618282 - BLOCK
      ?auto_618283 - BLOCK
      ?auto_618284 - BLOCK
      ?auto_618285 - BLOCK
      ?auto_618286 - BLOCK
      ?auto_618287 - BLOCK
    )
    :vars
    (
      ?auto_618288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618287 ?auto_618288 ) ( ON-TABLE ?auto_618272 ) ( ON ?auto_618273 ?auto_618272 ) ( ON ?auto_618274 ?auto_618273 ) ( ON ?auto_618275 ?auto_618274 ) ( ON ?auto_618276 ?auto_618275 ) ( ON ?auto_618277 ?auto_618276 ) ( ON ?auto_618278 ?auto_618277 ) ( ON ?auto_618279 ?auto_618278 ) ( ON ?auto_618280 ?auto_618279 ) ( ON ?auto_618281 ?auto_618280 ) ( ON ?auto_618282 ?auto_618281 ) ( not ( = ?auto_618272 ?auto_618273 ) ) ( not ( = ?auto_618272 ?auto_618274 ) ) ( not ( = ?auto_618272 ?auto_618275 ) ) ( not ( = ?auto_618272 ?auto_618276 ) ) ( not ( = ?auto_618272 ?auto_618277 ) ) ( not ( = ?auto_618272 ?auto_618278 ) ) ( not ( = ?auto_618272 ?auto_618279 ) ) ( not ( = ?auto_618272 ?auto_618280 ) ) ( not ( = ?auto_618272 ?auto_618281 ) ) ( not ( = ?auto_618272 ?auto_618282 ) ) ( not ( = ?auto_618272 ?auto_618283 ) ) ( not ( = ?auto_618272 ?auto_618284 ) ) ( not ( = ?auto_618272 ?auto_618285 ) ) ( not ( = ?auto_618272 ?auto_618286 ) ) ( not ( = ?auto_618272 ?auto_618287 ) ) ( not ( = ?auto_618272 ?auto_618288 ) ) ( not ( = ?auto_618273 ?auto_618274 ) ) ( not ( = ?auto_618273 ?auto_618275 ) ) ( not ( = ?auto_618273 ?auto_618276 ) ) ( not ( = ?auto_618273 ?auto_618277 ) ) ( not ( = ?auto_618273 ?auto_618278 ) ) ( not ( = ?auto_618273 ?auto_618279 ) ) ( not ( = ?auto_618273 ?auto_618280 ) ) ( not ( = ?auto_618273 ?auto_618281 ) ) ( not ( = ?auto_618273 ?auto_618282 ) ) ( not ( = ?auto_618273 ?auto_618283 ) ) ( not ( = ?auto_618273 ?auto_618284 ) ) ( not ( = ?auto_618273 ?auto_618285 ) ) ( not ( = ?auto_618273 ?auto_618286 ) ) ( not ( = ?auto_618273 ?auto_618287 ) ) ( not ( = ?auto_618273 ?auto_618288 ) ) ( not ( = ?auto_618274 ?auto_618275 ) ) ( not ( = ?auto_618274 ?auto_618276 ) ) ( not ( = ?auto_618274 ?auto_618277 ) ) ( not ( = ?auto_618274 ?auto_618278 ) ) ( not ( = ?auto_618274 ?auto_618279 ) ) ( not ( = ?auto_618274 ?auto_618280 ) ) ( not ( = ?auto_618274 ?auto_618281 ) ) ( not ( = ?auto_618274 ?auto_618282 ) ) ( not ( = ?auto_618274 ?auto_618283 ) ) ( not ( = ?auto_618274 ?auto_618284 ) ) ( not ( = ?auto_618274 ?auto_618285 ) ) ( not ( = ?auto_618274 ?auto_618286 ) ) ( not ( = ?auto_618274 ?auto_618287 ) ) ( not ( = ?auto_618274 ?auto_618288 ) ) ( not ( = ?auto_618275 ?auto_618276 ) ) ( not ( = ?auto_618275 ?auto_618277 ) ) ( not ( = ?auto_618275 ?auto_618278 ) ) ( not ( = ?auto_618275 ?auto_618279 ) ) ( not ( = ?auto_618275 ?auto_618280 ) ) ( not ( = ?auto_618275 ?auto_618281 ) ) ( not ( = ?auto_618275 ?auto_618282 ) ) ( not ( = ?auto_618275 ?auto_618283 ) ) ( not ( = ?auto_618275 ?auto_618284 ) ) ( not ( = ?auto_618275 ?auto_618285 ) ) ( not ( = ?auto_618275 ?auto_618286 ) ) ( not ( = ?auto_618275 ?auto_618287 ) ) ( not ( = ?auto_618275 ?auto_618288 ) ) ( not ( = ?auto_618276 ?auto_618277 ) ) ( not ( = ?auto_618276 ?auto_618278 ) ) ( not ( = ?auto_618276 ?auto_618279 ) ) ( not ( = ?auto_618276 ?auto_618280 ) ) ( not ( = ?auto_618276 ?auto_618281 ) ) ( not ( = ?auto_618276 ?auto_618282 ) ) ( not ( = ?auto_618276 ?auto_618283 ) ) ( not ( = ?auto_618276 ?auto_618284 ) ) ( not ( = ?auto_618276 ?auto_618285 ) ) ( not ( = ?auto_618276 ?auto_618286 ) ) ( not ( = ?auto_618276 ?auto_618287 ) ) ( not ( = ?auto_618276 ?auto_618288 ) ) ( not ( = ?auto_618277 ?auto_618278 ) ) ( not ( = ?auto_618277 ?auto_618279 ) ) ( not ( = ?auto_618277 ?auto_618280 ) ) ( not ( = ?auto_618277 ?auto_618281 ) ) ( not ( = ?auto_618277 ?auto_618282 ) ) ( not ( = ?auto_618277 ?auto_618283 ) ) ( not ( = ?auto_618277 ?auto_618284 ) ) ( not ( = ?auto_618277 ?auto_618285 ) ) ( not ( = ?auto_618277 ?auto_618286 ) ) ( not ( = ?auto_618277 ?auto_618287 ) ) ( not ( = ?auto_618277 ?auto_618288 ) ) ( not ( = ?auto_618278 ?auto_618279 ) ) ( not ( = ?auto_618278 ?auto_618280 ) ) ( not ( = ?auto_618278 ?auto_618281 ) ) ( not ( = ?auto_618278 ?auto_618282 ) ) ( not ( = ?auto_618278 ?auto_618283 ) ) ( not ( = ?auto_618278 ?auto_618284 ) ) ( not ( = ?auto_618278 ?auto_618285 ) ) ( not ( = ?auto_618278 ?auto_618286 ) ) ( not ( = ?auto_618278 ?auto_618287 ) ) ( not ( = ?auto_618278 ?auto_618288 ) ) ( not ( = ?auto_618279 ?auto_618280 ) ) ( not ( = ?auto_618279 ?auto_618281 ) ) ( not ( = ?auto_618279 ?auto_618282 ) ) ( not ( = ?auto_618279 ?auto_618283 ) ) ( not ( = ?auto_618279 ?auto_618284 ) ) ( not ( = ?auto_618279 ?auto_618285 ) ) ( not ( = ?auto_618279 ?auto_618286 ) ) ( not ( = ?auto_618279 ?auto_618287 ) ) ( not ( = ?auto_618279 ?auto_618288 ) ) ( not ( = ?auto_618280 ?auto_618281 ) ) ( not ( = ?auto_618280 ?auto_618282 ) ) ( not ( = ?auto_618280 ?auto_618283 ) ) ( not ( = ?auto_618280 ?auto_618284 ) ) ( not ( = ?auto_618280 ?auto_618285 ) ) ( not ( = ?auto_618280 ?auto_618286 ) ) ( not ( = ?auto_618280 ?auto_618287 ) ) ( not ( = ?auto_618280 ?auto_618288 ) ) ( not ( = ?auto_618281 ?auto_618282 ) ) ( not ( = ?auto_618281 ?auto_618283 ) ) ( not ( = ?auto_618281 ?auto_618284 ) ) ( not ( = ?auto_618281 ?auto_618285 ) ) ( not ( = ?auto_618281 ?auto_618286 ) ) ( not ( = ?auto_618281 ?auto_618287 ) ) ( not ( = ?auto_618281 ?auto_618288 ) ) ( not ( = ?auto_618282 ?auto_618283 ) ) ( not ( = ?auto_618282 ?auto_618284 ) ) ( not ( = ?auto_618282 ?auto_618285 ) ) ( not ( = ?auto_618282 ?auto_618286 ) ) ( not ( = ?auto_618282 ?auto_618287 ) ) ( not ( = ?auto_618282 ?auto_618288 ) ) ( not ( = ?auto_618283 ?auto_618284 ) ) ( not ( = ?auto_618283 ?auto_618285 ) ) ( not ( = ?auto_618283 ?auto_618286 ) ) ( not ( = ?auto_618283 ?auto_618287 ) ) ( not ( = ?auto_618283 ?auto_618288 ) ) ( not ( = ?auto_618284 ?auto_618285 ) ) ( not ( = ?auto_618284 ?auto_618286 ) ) ( not ( = ?auto_618284 ?auto_618287 ) ) ( not ( = ?auto_618284 ?auto_618288 ) ) ( not ( = ?auto_618285 ?auto_618286 ) ) ( not ( = ?auto_618285 ?auto_618287 ) ) ( not ( = ?auto_618285 ?auto_618288 ) ) ( not ( = ?auto_618286 ?auto_618287 ) ) ( not ( = ?auto_618286 ?auto_618288 ) ) ( not ( = ?auto_618287 ?auto_618288 ) ) ( ON ?auto_618286 ?auto_618287 ) ( ON ?auto_618285 ?auto_618286 ) ( ON ?auto_618284 ?auto_618285 ) ( CLEAR ?auto_618282 ) ( ON ?auto_618283 ?auto_618284 ) ( CLEAR ?auto_618283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_618272 ?auto_618273 ?auto_618274 ?auto_618275 ?auto_618276 ?auto_618277 ?auto_618278 ?auto_618279 ?auto_618280 ?auto_618281 ?auto_618282 ?auto_618283 )
      ( MAKE-16PILE ?auto_618272 ?auto_618273 ?auto_618274 ?auto_618275 ?auto_618276 ?auto_618277 ?auto_618278 ?auto_618279 ?auto_618280 ?auto_618281 ?auto_618282 ?auto_618283 ?auto_618284 ?auto_618285 ?auto_618286 ?auto_618287 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618338 - BLOCK
      ?auto_618339 - BLOCK
      ?auto_618340 - BLOCK
      ?auto_618341 - BLOCK
      ?auto_618342 - BLOCK
      ?auto_618343 - BLOCK
      ?auto_618344 - BLOCK
      ?auto_618345 - BLOCK
      ?auto_618346 - BLOCK
      ?auto_618347 - BLOCK
      ?auto_618348 - BLOCK
      ?auto_618349 - BLOCK
      ?auto_618350 - BLOCK
      ?auto_618351 - BLOCK
      ?auto_618352 - BLOCK
      ?auto_618353 - BLOCK
    )
    :vars
    (
      ?auto_618354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618353 ?auto_618354 ) ( ON-TABLE ?auto_618338 ) ( ON ?auto_618339 ?auto_618338 ) ( ON ?auto_618340 ?auto_618339 ) ( ON ?auto_618341 ?auto_618340 ) ( ON ?auto_618342 ?auto_618341 ) ( ON ?auto_618343 ?auto_618342 ) ( ON ?auto_618344 ?auto_618343 ) ( ON ?auto_618345 ?auto_618344 ) ( ON ?auto_618346 ?auto_618345 ) ( ON ?auto_618347 ?auto_618346 ) ( not ( = ?auto_618338 ?auto_618339 ) ) ( not ( = ?auto_618338 ?auto_618340 ) ) ( not ( = ?auto_618338 ?auto_618341 ) ) ( not ( = ?auto_618338 ?auto_618342 ) ) ( not ( = ?auto_618338 ?auto_618343 ) ) ( not ( = ?auto_618338 ?auto_618344 ) ) ( not ( = ?auto_618338 ?auto_618345 ) ) ( not ( = ?auto_618338 ?auto_618346 ) ) ( not ( = ?auto_618338 ?auto_618347 ) ) ( not ( = ?auto_618338 ?auto_618348 ) ) ( not ( = ?auto_618338 ?auto_618349 ) ) ( not ( = ?auto_618338 ?auto_618350 ) ) ( not ( = ?auto_618338 ?auto_618351 ) ) ( not ( = ?auto_618338 ?auto_618352 ) ) ( not ( = ?auto_618338 ?auto_618353 ) ) ( not ( = ?auto_618338 ?auto_618354 ) ) ( not ( = ?auto_618339 ?auto_618340 ) ) ( not ( = ?auto_618339 ?auto_618341 ) ) ( not ( = ?auto_618339 ?auto_618342 ) ) ( not ( = ?auto_618339 ?auto_618343 ) ) ( not ( = ?auto_618339 ?auto_618344 ) ) ( not ( = ?auto_618339 ?auto_618345 ) ) ( not ( = ?auto_618339 ?auto_618346 ) ) ( not ( = ?auto_618339 ?auto_618347 ) ) ( not ( = ?auto_618339 ?auto_618348 ) ) ( not ( = ?auto_618339 ?auto_618349 ) ) ( not ( = ?auto_618339 ?auto_618350 ) ) ( not ( = ?auto_618339 ?auto_618351 ) ) ( not ( = ?auto_618339 ?auto_618352 ) ) ( not ( = ?auto_618339 ?auto_618353 ) ) ( not ( = ?auto_618339 ?auto_618354 ) ) ( not ( = ?auto_618340 ?auto_618341 ) ) ( not ( = ?auto_618340 ?auto_618342 ) ) ( not ( = ?auto_618340 ?auto_618343 ) ) ( not ( = ?auto_618340 ?auto_618344 ) ) ( not ( = ?auto_618340 ?auto_618345 ) ) ( not ( = ?auto_618340 ?auto_618346 ) ) ( not ( = ?auto_618340 ?auto_618347 ) ) ( not ( = ?auto_618340 ?auto_618348 ) ) ( not ( = ?auto_618340 ?auto_618349 ) ) ( not ( = ?auto_618340 ?auto_618350 ) ) ( not ( = ?auto_618340 ?auto_618351 ) ) ( not ( = ?auto_618340 ?auto_618352 ) ) ( not ( = ?auto_618340 ?auto_618353 ) ) ( not ( = ?auto_618340 ?auto_618354 ) ) ( not ( = ?auto_618341 ?auto_618342 ) ) ( not ( = ?auto_618341 ?auto_618343 ) ) ( not ( = ?auto_618341 ?auto_618344 ) ) ( not ( = ?auto_618341 ?auto_618345 ) ) ( not ( = ?auto_618341 ?auto_618346 ) ) ( not ( = ?auto_618341 ?auto_618347 ) ) ( not ( = ?auto_618341 ?auto_618348 ) ) ( not ( = ?auto_618341 ?auto_618349 ) ) ( not ( = ?auto_618341 ?auto_618350 ) ) ( not ( = ?auto_618341 ?auto_618351 ) ) ( not ( = ?auto_618341 ?auto_618352 ) ) ( not ( = ?auto_618341 ?auto_618353 ) ) ( not ( = ?auto_618341 ?auto_618354 ) ) ( not ( = ?auto_618342 ?auto_618343 ) ) ( not ( = ?auto_618342 ?auto_618344 ) ) ( not ( = ?auto_618342 ?auto_618345 ) ) ( not ( = ?auto_618342 ?auto_618346 ) ) ( not ( = ?auto_618342 ?auto_618347 ) ) ( not ( = ?auto_618342 ?auto_618348 ) ) ( not ( = ?auto_618342 ?auto_618349 ) ) ( not ( = ?auto_618342 ?auto_618350 ) ) ( not ( = ?auto_618342 ?auto_618351 ) ) ( not ( = ?auto_618342 ?auto_618352 ) ) ( not ( = ?auto_618342 ?auto_618353 ) ) ( not ( = ?auto_618342 ?auto_618354 ) ) ( not ( = ?auto_618343 ?auto_618344 ) ) ( not ( = ?auto_618343 ?auto_618345 ) ) ( not ( = ?auto_618343 ?auto_618346 ) ) ( not ( = ?auto_618343 ?auto_618347 ) ) ( not ( = ?auto_618343 ?auto_618348 ) ) ( not ( = ?auto_618343 ?auto_618349 ) ) ( not ( = ?auto_618343 ?auto_618350 ) ) ( not ( = ?auto_618343 ?auto_618351 ) ) ( not ( = ?auto_618343 ?auto_618352 ) ) ( not ( = ?auto_618343 ?auto_618353 ) ) ( not ( = ?auto_618343 ?auto_618354 ) ) ( not ( = ?auto_618344 ?auto_618345 ) ) ( not ( = ?auto_618344 ?auto_618346 ) ) ( not ( = ?auto_618344 ?auto_618347 ) ) ( not ( = ?auto_618344 ?auto_618348 ) ) ( not ( = ?auto_618344 ?auto_618349 ) ) ( not ( = ?auto_618344 ?auto_618350 ) ) ( not ( = ?auto_618344 ?auto_618351 ) ) ( not ( = ?auto_618344 ?auto_618352 ) ) ( not ( = ?auto_618344 ?auto_618353 ) ) ( not ( = ?auto_618344 ?auto_618354 ) ) ( not ( = ?auto_618345 ?auto_618346 ) ) ( not ( = ?auto_618345 ?auto_618347 ) ) ( not ( = ?auto_618345 ?auto_618348 ) ) ( not ( = ?auto_618345 ?auto_618349 ) ) ( not ( = ?auto_618345 ?auto_618350 ) ) ( not ( = ?auto_618345 ?auto_618351 ) ) ( not ( = ?auto_618345 ?auto_618352 ) ) ( not ( = ?auto_618345 ?auto_618353 ) ) ( not ( = ?auto_618345 ?auto_618354 ) ) ( not ( = ?auto_618346 ?auto_618347 ) ) ( not ( = ?auto_618346 ?auto_618348 ) ) ( not ( = ?auto_618346 ?auto_618349 ) ) ( not ( = ?auto_618346 ?auto_618350 ) ) ( not ( = ?auto_618346 ?auto_618351 ) ) ( not ( = ?auto_618346 ?auto_618352 ) ) ( not ( = ?auto_618346 ?auto_618353 ) ) ( not ( = ?auto_618346 ?auto_618354 ) ) ( not ( = ?auto_618347 ?auto_618348 ) ) ( not ( = ?auto_618347 ?auto_618349 ) ) ( not ( = ?auto_618347 ?auto_618350 ) ) ( not ( = ?auto_618347 ?auto_618351 ) ) ( not ( = ?auto_618347 ?auto_618352 ) ) ( not ( = ?auto_618347 ?auto_618353 ) ) ( not ( = ?auto_618347 ?auto_618354 ) ) ( not ( = ?auto_618348 ?auto_618349 ) ) ( not ( = ?auto_618348 ?auto_618350 ) ) ( not ( = ?auto_618348 ?auto_618351 ) ) ( not ( = ?auto_618348 ?auto_618352 ) ) ( not ( = ?auto_618348 ?auto_618353 ) ) ( not ( = ?auto_618348 ?auto_618354 ) ) ( not ( = ?auto_618349 ?auto_618350 ) ) ( not ( = ?auto_618349 ?auto_618351 ) ) ( not ( = ?auto_618349 ?auto_618352 ) ) ( not ( = ?auto_618349 ?auto_618353 ) ) ( not ( = ?auto_618349 ?auto_618354 ) ) ( not ( = ?auto_618350 ?auto_618351 ) ) ( not ( = ?auto_618350 ?auto_618352 ) ) ( not ( = ?auto_618350 ?auto_618353 ) ) ( not ( = ?auto_618350 ?auto_618354 ) ) ( not ( = ?auto_618351 ?auto_618352 ) ) ( not ( = ?auto_618351 ?auto_618353 ) ) ( not ( = ?auto_618351 ?auto_618354 ) ) ( not ( = ?auto_618352 ?auto_618353 ) ) ( not ( = ?auto_618352 ?auto_618354 ) ) ( not ( = ?auto_618353 ?auto_618354 ) ) ( ON ?auto_618352 ?auto_618353 ) ( ON ?auto_618351 ?auto_618352 ) ( ON ?auto_618350 ?auto_618351 ) ( ON ?auto_618349 ?auto_618350 ) ( CLEAR ?auto_618347 ) ( ON ?auto_618348 ?auto_618349 ) ( CLEAR ?auto_618348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_618338 ?auto_618339 ?auto_618340 ?auto_618341 ?auto_618342 ?auto_618343 ?auto_618344 ?auto_618345 ?auto_618346 ?auto_618347 ?auto_618348 )
      ( MAKE-16PILE ?auto_618338 ?auto_618339 ?auto_618340 ?auto_618341 ?auto_618342 ?auto_618343 ?auto_618344 ?auto_618345 ?auto_618346 ?auto_618347 ?auto_618348 ?auto_618349 ?auto_618350 ?auto_618351 ?auto_618352 ?auto_618353 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618404 - BLOCK
      ?auto_618405 - BLOCK
      ?auto_618406 - BLOCK
      ?auto_618407 - BLOCK
      ?auto_618408 - BLOCK
      ?auto_618409 - BLOCK
      ?auto_618410 - BLOCK
      ?auto_618411 - BLOCK
      ?auto_618412 - BLOCK
      ?auto_618413 - BLOCK
      ?auto_618414 - BLOCK
      ?auto_618415 - BLOCK
      ?auto_618416 - BLOCK
      ?auto_618417 - BLOCK
      ?auto_618418 - BLOCK
      ?auto_618419 - BLOCK
    )
    :vars
    (
      ?auto_618420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618419 ?auto_618420 ) ( ON-TABLE ?auto_618404 ) ( ON ?auto_618405 ?auto_618404 ) ( ON ?auto_618406 ?auto_618405 ) ( ON ?auto_618407 ?auto_618406 ) ( ON ?auto_618408 ?auto_618407 ) ( ON ?auto_618409 ?auto_618408 ) ( ON ?auto_618410 ?auto_618409 ) ( ON ?auto_618411 ?auto_618410 ) ( ON ?auto_618412 ?auto_618411 ) ( not ( = ?auto_618404 ?auto_618405 ) ) ( not ( = ?auto_618404 ?auto_618406 ) ) ( not ( = ?auto_618404 ?auto_618407 ) ) ( not ( = ?auto_618404 ?auto_618408 ) ) ( not ( = ?auto_618404 ?auto_618409 ) ) ( not ( = ?auto_618404 ?auto_618410 ) ) ( not ( = ?auto_618404 ?auto_618411 ) ) ( not ( = ?auto_618404 ?auto_618412 ) ) ( not ( = ?auto_618404 ?auto_618413 ) ) ( not ( = ?auto_618404 ?auto_618414 ) ) ( not ( = ?auto_618404 ?auto_618415 ) ) ( not ( = ?auto_618404 ?auto_618416 ) ) ( not ( = ?auto_618404 ?auto_618417 ) ) ( not ( = ?auto_618404 ?auto_618418 ) ) ( not ( = ?auto_618404 ?auto_618419 ) ) ( not ( = ?auto_618404 ?auto_618420 ) ) ( not ( = ?auto_618405 ?auto_618406 ) ) ( not ( = ?auto_618405 ?auto_618407 ) ) ( not ( = ?auto_618405 ?auto_618408 ) ) ( not ( = ?auto_618405 ?auto_618409 ) ) ( not ( = ?auto_618405 ?auto_618410 ) ) ( not ( = ?auto_618405 ?auto_618411 ) ) ( not ( = ?auto_618405 ?auto_618412 ) ) ( not ( = ?auto_618405 ?auto_618413 ) ) ( not ( = ?auto_618405 ?auto_618414 ) ) ( not ( = ?auto_618405 ?auto_618415 ) ) ( not ( = ?auto_618405 ?auto_618416 ) ) ( not ( = ?auto_618405 ?auto_618417 ) ) ( not ( = ?auto_618405 ?auto_618418 ) ) ( not ( = ?auto_618405 ?auto_618419 ) ) ( not ( = ?auto_618405 ?auto_618420 ) ) ( not ( = ?auto_618406 ?auto_618407 ) ) ( not ( = ?auto_618406 ?auto_618408 ) ) ( not ( = ?auto_618406 ?auto_618409 ) ) ( not ( = ?auto_618406 ?auto_618410 ) ) ( not ( = ?auto_618406 ?auto_618411 ) ) ( not ( = ?auto_618406 ?auto_618412 ) ) ( not ( = ?auto_618406 ?auto_618413 ) ) ( not ( = ?auto_618406 ?auto_618414 ) ) ( not ( = ?auto_618406 ?auto_618415 ) ) ( not ( = ?auto_618406 ?auto_618416 ) ) ( not ( = ?auto_618406 ?auto_618417 ) ) ( not ( = ?auto_618406 ?auto_618418 ) ) ( not ( = ?auto_618406 ?auto_618419 ) ) ( not ( = ?auto_618406 ?auto_618420 ) ) ( not ( = ?auto_618407 ?auto_618408 ) ) ( not ( = ?auto_618407 ?auto_618409 ) ) ( not ( = ?auto_618407 ?auto_618410 ) ) ( not ( = ?auto_618407 ?auto_618411 ) ) ( not ( = ?auto_618407 ?auto_618412 ) ) ( not ( = ?auto_618407 ?auto_618413 ) ) ( not ( = ?auto_618407 ?auto_618414 ) ) ( not ( = ?auto_618407 ?auto_618415 ) ) ( not ( = ?auto_618407 ?auto_618416 ) ) ( not ( = ?auto_618407 ?auto_618417 ) ) ( not ( = ?auto_618407 ?auto_618418 ) ) ( not ( = ?auto_618407 ?auto_618419 ) ) ( not ( = ?auto_618407 ?auto_618420 ) ) ( not ( = ?auto_618408 ?auto_618409 ) ) ( not ( = ?auto_618408 ?auto_618410 ) ) ( not ( = ?auto_618408 ?auto_618411 ) ) ( not ( = ?auto_618408 ?auto_618412 ) ) ( not ( = ?auto_618408 ?auto_618413 ) ) ( not ( = ?auto_618408 ?auto_618414 ) ) ( not ( = ?auto_618408 ?auto_618415 ) ) ( not ( = ?auto_618408 ?auto_618416 ) ) ( not ( = ?auto_618408 ?auto_618417 ) ) ( not ( = ?auto_618408 ?auto_618418 ) ) ( not ( = ?auto_618408 ?auto_618419 ) ) ( not ( = ?auto_618408 ?auto_618420 ) ) ( not ( = ?auto_618409 ?auto_618410 ) ) ( not ( = ?auto_618409 ?auto_618411 ) ) ( not ( = ?auto_618409 ?auto_618412 ) ) ( not ( = ?auto_618409 ?auto_618413 ) ) ( not ( = ?auto_618409 ?auto_618414 ) ) ( not ( = ?auto_618409 ?auto_618415 ) ) ( not ( = ?auto_618409 ?auto_618416 ) ) ( not ( = ?auto_618409 ?auto_618417 ) ) ( not ( = ?auto_618409 ?auto_618418 ) ) ( not ( = ?auto_618409 ?auto_618419 ) ) ( not ( = ?auto_618409 ?auto_618420 ) ) ( not ( = ?auto_618410 ?auto_618411 ) ) ( not ( = ?auto_618410 ?auto_618412 ) ) ( not ( = ?auto_618410 ?auto_618413 ) ) ( not ( = ?auto_618410 ?auto_618414 ) ) ( not ( = ?auto_618410 ?auto_618415 ) ) ( not ( = ?auto_618410 ?auto_618416 ) ) ( not ( = ?auto_618410 ?auto_618417 ) ) ( not ( = ?auto_618410 ?auto_618418 ) ) ( not ( = ?auto_618410 ?auto_618419 ) ) ( not ( = ?auto_618410 ?auto_618420 ) ) ( not ( = ?auto_618411 ?auto_618412 ) ) ( not ( = ?auto_618411 ?auto_618413 ) ) ( not ( = ?auto_618411 ?auto_618414 ) ) ( not ( = ?auto_618411 ?auto_618415 ) ) ( not ( = ?auto_618411 ?auto_618416 ) ) ( not ( = ?auto_618411 ?auto_618417 ) ) ( not ( = ?auto_618411 ?auto_618418 ) ) ( not ( = ?auto_618411 ?auto_618419 ) ) ( not ( = ?auto_618411 ?auto_618420 ) ) ( not ( = ?auto_618412 ?auto_618413 ) ) ( not ( = ?auto_618412 ?auto_618414 ) ) ( not ( = ?auto_618412 ?auto_618415 ) ) ( not ( = ?auto_618412 ?auto_618416 ) ) ( not ( = ?auto_618412 ?auto_618417 ) ) ( not ( = ?auto_618412 ?auto_618418 ) ) ( not ( = ?auto_618412 ?auto_618419 ) ) ( not ( = ?auto_618412 ?auto_618420 ) ) ( not ( = ?auto_618413 ?auto_618414 ) ) ( not ( = ?auto_618413 ?auto_618415 ) ) ( not ( = ?auto_618413 ?auto_618416 ) ) ( not ( = ?auto_618413 ?auto_618417 ) ) ( not ( = ?auto_618413 ?auto_618418 ) ) ( not ( = ?auto_618413 ?auto_618419 ) ) ( not ( = ?auto_618413 ?auto_618420 ) ) ( not ( = ?auto_618414 ?auto_618415 ) ) ( not ( = ?auto_618414 ?auto_618416 ) ) ( not ( = ?auto_618414 ?auto_618417 ) ) ( not ( = ?auto_618414 ?auto_618418 ) ) ( not ( = ?auto_618414 ?auto_618419 ) ) ( not ( = ?auto_618414 ?auto_618420 ) ) ( not ( = ?auto_618415 ?auto_618416 ) ) ( not ( = ?auto_618415 ?auto_618417 ) ) ( not ( = ?auto_618415 ?auto_618418 ) ) ( not ( = ?auto_618415 ?auto_618419 ) ) ( not ( = ?auto_618415 ?auto_618420 ) ) ( not ( = ?auto_618416 ?auto_618417 ) ) ( not ( = ?auto_618416 ?auto_618418 ) ) ( not ( = ?auto_618416 ?auto_618419 ) ) ( not ( = ?auto_618416 ?auto_618420 ) ) ( not ( = ?auto_618417 ?auto_618418 ) ) ( not ( = ?auto_618417 ?auto_618419 ) ) ( not ( = ?auto_618417 ?auto_618420 ) ) ( not ( = ?auto_618418 ?auto_618419 ) ) ( not ( = ?auto_618418 ?auto_618420 ) ) ( not ( = ?auto_618419 ?auto_618420 ) ) ( ON ?auto_618418 ?auto_618419 ) ( ON ?auto_618417 ?auto_618418 ) ( ON ?auto_618416 ?auto_618417 ) ( ON ?auto_618415 ?auto_618416 ) ( ON ?auto_618414 ?auto_618415 ) ( CLEAR ?auto_618412 ) ( ON ?auto_618413 ?auto_618414 ) ( CLEAR ?auto_618413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_618404 ?auto_618405 ?auto_618406 ?auto_618407 ?auto_618408 ?auto_618409 ?auto_618410 ?auto_618411 ?auto_618412 ?auto_618413 )
      ( MAKE-16PILE ?auto_618404 ?auto_618405 ?auto_618406 ?auto_618407 ?auto_618408 ?auto_618409 ?auto_618410 ?auto_618411 ?auto_618412 ?auto_618413 ?auto_618414 ?auto_618415 ?auto_618416 ?auto_618417 ?auto_618418 ?auto_618419 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618470 - BLOCK
      ?auto_618471 - BLOCK
      ?auto_618472 - BLOCK
      ?auto_618473 - BLOCK
      ?auto_618474 - BLOCK
      ?auto_618475 - BLOCK
      ?auto_618476 - BLOCK
      ?auto_618477 - BLOCK
      ?auto_618478 - BLOCK
      ?auto_618479 - BLOCK
      ?auto_618480 - BLOCK
      ?auto_618481 - BLOCK
      ?auto_618482 - BLOCK
      ?auto_618483 - BLOCK
      ?auto_618484 - BLOCK
      ?auto_618485 - BLOCK
    )
    :vars
    (
      ?auto_618486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618485 ?auto_618486 ) ( ON-TABLE ?auto_618470 ) ( ON ?auto_618471 ?auto_618470 ) ( ON ?auto_618472 ?auto_618471 ) ( ON ?auto_618473 ?auto_618472 ) ( ON ?auto_618474 ?auto_618473 ) ( ON ?auto_618475 ?auto_618474 ) ( ON ?auto_618476 ?auto_618475 ) ( ON ?auto_618477 ?auto_618476 ) ( not ( = ?auto_618470 ?auto_618471 ) ) ( not ( = ?auto_618470 ?auto_618472 ) ) ( not ( = ?auto_618470 ?auto_618473 ) ) ( not ( = ?auto_618470 ?auto_618474 ) ) ( not ( = ?auto_618470 ?auto_618475 ) ) ( not ( = ?auto_618470 ?auto_618476 ) ) ( not ( = ?auto_618470 ?auto_618477 ) ) ( not ( = ?auto_618470 ?auto_618478 ) ) ( not ( = ?auto_618470 ?auto_618479 ) ) ( not ( = ?auto_618470 ?auto_618480 ) ) ( not ( = ?auto_618470 ?auto_618481 ) ) ( not ( = ?auto_618470 ?auto_618482 ) ) ( not ( = ?auto_618470 ?auto_618483 ) ) ( not ( = ?auto_618470 ?auto_618484 ) ) ( not ( = ?auto_618470 ?auto_618485 ) ) ( not ( = ?auto_618470 ?auto_618486 ) ) ( not ( = ?auto_618471 ?auto_618472 ) ) ( not ( = ?auto_618471 ?auto_618473 ) ) ( not ( = ?auto_618471 ?auto_618474 ) ) ( not ( = ?auto_618471 ?auto_618475 ) ) ( not ( = ?auto_618471 ?auto_618476 ) ) ( not ( = ?auto_618471 ?auto_618477 ) ) ( not ( = ?auto_618471 ?auto_618478 ) ) ( not ( = ?auto_618471 ?auto_618479 ) ) ( not ( = ?auto_618471 ?auto_618480 ) ) ( not ( = ?auto_618471 ?auto_618481 ) ) ( not ( = ?auto_618471 ?auto_618482 ) ) ( not ( = ?auto_618471 ?auto_618483 ) ) ( not ( = ?auto_618471 ?auto_618484 ) ) ( not ( = ?auto_618471 ?auto_618485 ) ) ( not ( = ?auto_618471 ?auto_618486 ) ) ( not ( = ?auto_618472 ?auto_618473 ) ) ( not ( = ?auto_618472 ?auto_618474 ) ) ( not ( = ?auto_618472 ?auto_618475 ) ) ( not ( = ?auto_618472 ?auto_618476 ) ) ( not ( = ?auto_618472 ?auto_618477 ) ) ( not ( = ?auto_618472 ?auto_618478 ) ) ( not ( = ?auto_618472 ?auto_618479 ) ) ( not ( = ?auto_618472 ?auto_618480 ) ) ( not ( = ?auto_618472 ?auto_618481 ) ) ( not ( = ?auto_618472 ?auto_618482 ) ) ( not ( = ?auto_618472 ?auto_618483 ) ) ( not ( = ?auto_618472 ?auto_618484 ) ) ( not ( = ?auto_618472 ?auto_618485 ) ) ( not ( = ?auto_618472 ?auto_618486 ) ) ( not ( = ?auto_618473 ?auto_618474 ) ) ( not ( = ?auto_618473 ?auto_618475 ) ) ( not ( = ?auto_618473 ?auto_618476 ) ) ( not ( = ?auto_618473 ?auto_618477 ) ) ( not ( = ?auto_618473 ?auto_618478 ) ) ( not ( = ?auto_618473 ?auto_618479 ) ) ( not ( = ?auto_618473 ?auto_618480 ) ) ( not ( = ?auto_618473 ?auto_618481 ) ) ( not ( = ?auto_618473 ?auto_618482 ) ) ( not ( = ?auto_618473 ?auto_618483 ) ) ( not ( = ?auto_618473 ?auto_618484 ) ) ( not ( = ?auto_618473 ?auto_618485 ) ) ( not ( = ?auto_618473 ?auto_618486 ) ) ( not ( = ?auto_618474 ?auto_618475 ) ) ( not ( = ?auto_618474 ?auto_618476 ) ) ( not ( = ?auto_618474 ?auto_618477 ) ) ( not ( = ?auto_618474 ?auto_618478 ) ) ( not ( = ?auto_618474 ?auto_618479 ) ) ( not ( = ?auto_618474 ?auto_618480 ) ) ( not ( = ?auto_618474 ?auto_618481 ) ) ( not ( = ?auto_618474 ?auto_618482 ) ) ( not ( = ?auto_618474 ?auto_618483 ) ) ( not ( = ?auto_618474 ?auto_618484 ) ) ( not ( = ?auto_618474 ?auto_618485 ) ) ( not ( = ?auto_618474 ?auto_618486 ) ) ( not ( = ?auto_618475 ?auto_618476 ) ) ( not ( = ?auto_618475 ?auto_618477 ) ) ( not ( = ?auto_618475 ?auto_618478 ) ) ( not ( = ?auto_618475 ?auto_618479 ) ) ( not ( = ?auto_618475 ?auto_618480 ) ) ( not ( = ?auto_618475 ?auto_618481 ) ) ( not ( = ?auto_618475 ?auto_618482 ) ) ( not ( = ?auto_618475 ?auto_618483 ) ) ( not ( = ?auto_618475 ?auto_618484 ) ) ( not ( = ?auto_618475 ?auto_618485 ) ) ( not ( = ?auto_618475 ?auto_618486 ) ) ( not ( = ?auto_618476 ?auto_618477 ) ) ( not ( = ?auto_618476 ?auto_618478 ) ) ( not ( = ?auto_618476 ?auto_618479 ) ) ( not ( = ?auto_618476 ?auto_618480 ) ) ( not ( = ?auto_618476 ?auto_618481 ) ) ( not ( = ?auto_618476 ?auto_618482 ) ) ( not ( = ?auto_618476 ?auto_618483 ) ) ( not ( = ?auto_618476 ?auto_618484 ) ) ( not ( = ?auto_618476 ?auto_618485 ) ) ( not ( = ?auto_618476 ?auto_618486 ) ) ( not ( = ?auto_618477 ?auto_618478 ) ) ( not ( = ?auto_618477 ?auto_618479 ) ) ( not ( = ?auto_618477 ?auto_618480 ) ) ( not ( = ?auto_618477 ?auto_618481 ) ) ( not ( = ?auto_618477 ?auto_618482 ) ) ( not ( = ?auto_618477 ?auto_618483 ) ) ( not ( = ?auto_618477 ?auto_618484 ) ) ( not ( = ?auto_618477 ?auto_618485 ) ) ( not ( = ?auto_618477 ?auto_618486 ) ) ( not ( = ?auto_618478 ?auto_618479 ) ) ( not ( = ?auto_618478 ?auto_618480 ) ) ( not ( = ?auto_618478 ?auto_618481 ) ) ( not ( = ?auto_618478 ?auto_618482 ) ) ( not ( = ?auto_618478 ?auto_618483 ) ) ( not ( = ?auto_618478 ?auto_618484 ) ) ( not ( = ?auto_618478 ?auto_618485 ) ) ( not ( = ?auto_618478 ?auto_618486 ) ) ( not ( = ?auto_618479 ?auto_618480 ) ) ( not ( = ?auto_618479 ?auto_618481 ) ) ( not ( = ?auto_618479 ?auto_618482 ) ) ( not ( = ?auto_618479 ?auto_618483 ) ) ( not ( = ?auto_618479 ?auto_618484 ) ) ( not ( = ?auto_618479 ?auto_618485 ) ) ( not ( = ?auto_618479 ?auto_618486 ) ) ( not ( = ?auto_618480 ?auto_618481 ) ) ( not ( = ?auto_618480 ?auto_618482 ) ) ( not ( = ?auto_618480 ?auto_618483 ) ) ( not ( = ?auto_618480 ?auto_618484 ) ) ( not ( = ?auto_618480 ?auto_618485 ) ) ( not ( = ?auto_618480 ?auto_618486 ) ) ( not ( = ?auto_618481 ?auto_618482 ) ) ( not ( = ?auto_618481 ?auto_618483 ) ) ( not ( = ?auto_618481 ?auto_618484 ) ) ( not ( = ?auto_618481 ?auto_618485 ) ) ( not ( = ?auto_618481 ?auto_618486 ) ) ( not ( = ?auto_618482 ?auto_618483 ) ) ( not ( = ?auto_618482 ?auto_618484 ) ) ( not ( = ?auto_618482 ?auto_618485 ) ) ( not ( = ?auto_618482 ?auto_618486 ) ) ( not ( = ?auto_618483 ?auto_618484 ) ) ( not ( = ?auto_618483 ?auto_618485 ) ) ( not ( = ?auto_618483 ?auto_618486 ) ) ( not ( = ?auto_618484 ?auto_618485 ) ) ( not ( = ?auto_618484 ?auto_618486 ) ) ( not ( = ?auto_618485 ?auto_618486 ) ) ( ON ?auto_618484 ?auto_618485 ) ( ON ?auto_618483 ?auto_618484 ) ( ON ?auto_618482 ?auto_618483 ) ( ON ?auto_618481 ?auto_618482 ) ( ON ?auto_618480 ?auto_618481 ) ( ON ?auto_618479 ?auto_618480 ) ( CLEAR ?auto_618477 ) ( ON ?auto_618478 ?auto_618479 ) ( CLEAR ?auto_618478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_618470 ?auto_618471 ?auto_618472 ?auto_618473 ?auto_618474 ?auto_618475 ?auto_618476 ?auto_618477 ?auto_618478 )
      ( MAKE-16PILE ?auto_618470 ?auto_618471 ?auto_618472 ?auto_618473 ?auto_618474 ?auto_618475 ?auto_618476 ?auto_618477 ?auto_618478 ?auto_618479 ?auto_618480 ?auto_618481 ?auto_618482 ?auto_618483 ?auto_618484 ?auto_618485 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618536 - BLOCK
      ?auto_618537 - BLOCK
      ?auto_618538 - BLOCK
      ?auto_618539 - BLOCK
      ?auto_618540 - BLOCK
      ?auto_618541 - BLOCK
      ?auto_618542 - BLOCK
      ?auto_618543 - BLOCK
      ?auto_618544 - BLOCK
      ?auto_618545 - BLOCK
      ?auto_618546 - BLOCK
      ?auto_618547 - BLOCK
      ?auto_618548 - BLOCK
      ?auto_618549 - BLOCK
      ?auto_618550 - BLOCK
      ?auto_618551 - BLOCK
    )
    :vars
    (
      ?auto_618552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618551 ?auto_618552 ) ( ON-TABLE ?auto_618536 ) ( ON ?auto_618537 ?auto_618536 ) ( ON ?auto_618538 ?auto_618537 ) ( ON ?auto_618539 ?auto_618538 ) ( ON ?auto_618540 ?auto_618539 ) ( ON ?auto_618541 ?auto_618540 ) ( ON ?auto_618542 ?auto_618541 ) ( not ( = ?auto_618536 ?auto_618537 ) ) ( not ( = ?auto_618536 ?auto_618538 ) ) ( not ( = ?auto_618536 ?auto_618539 ) ) ( not ( = ?auto_618536 ?auto_618540 ) ) ( not ( = ?auto_618536 ?auto_618541 ) ) ( not ( = ?auto_618536 ?auto_618542 ) ) ( not ( = ?auto_618536 ?auto_618543 ) ) ( not ( = ?auto_618536 ?auto_618544 ) ) ( not ( = ?auto_618536 ?auto_618545 ) ) ( not ( = ?auto_618536 ?auto_618546 ) ) ( not ( = ?auto_618536 ?auto_618547 ) ) ( not ( = ?auto_618536 ?auto_618548 ) ) ( not ( = ?auto_618536 ?auto_618549 ) ) ( not ( = ?auto_618536 ?auto_618550 ) ) ( not ( = ?auto_618536 ?auto_618551 ) ) ( not ( = ?auto_618536 ?auto_618552 ) ) ( not ( = ?auto_618537 ?auto_618538 ) ) ( not ( = ?auto_618537 ?auto_618539 ) ) ( not ( = ?auto_618537 ?auto_618540 ) ) ( not ( = ?auto_618537 ?auto_618541 ) ) ( not ( = ?auto_618537 ?auto_618542 ) ) ( not ( = ?auto_618537 ?auto_618543 ) ) ( not ( = ?auto_618537 ?auto_618544 ) ) ( not ( = ?auto_618537 ?auto_618545 ) ) ( not ( = ?auto_618537 ?auto_618546 ) ) ( not ( = ?auto_618537 ?auto_618547 ) ) ( not ( = ?auto_618537 ?auto_618548 ) ) ( not ( = ?auto_618537 ?auto_618549 ) ) ( not ( = ?auto_618537 ?auto_618550 ) ) ( not ( = ?auto_618537 ?auto_618551 ) ) ( not ( = ?auto_618537 ?auto_618552 ) ) ( not ( = ?auto_618538 ?auto_618539 ) ) ( not ( = ?auto_618538 ?auto_618540 ) ) ( not ( = ?auto_618538 ?auto_618541 ) ) ( not ( = ?auto_618538 ?auto_618542 ) ) ( not ( = ?auto_618538 ?auto_618543 ) ) ( not ( = ?auto_618538 ?auto_618544 ) ) ( not ( = ?auto_618538 ?auto_618545 ) ) ( not ( = ?auto_618538 ?auto_618546 ) ) ( not ( = ?auto_618538 ?auto_618547 ) ) ( not ( = ?auto_618538 ?auto_618548 ) ) ( not ( = ?auto_618538 ?auto_618549 ) ) ( not ( = ?auto_618538 ?auto_618550 ) ) ( not ( = ?auto_618538 ?auto_618551 ) ) ( not ( = ?auto_618538 ?auto_618552 ) ) ( not ( = ?auto_618539 ?auto_618540 ) ) ( not ( = ?auto_618539 ?auto_618541 ) ) ( not ( = ?auto_618539 ?auto_618542 ) ) ( not ( = ?auto_618539 ?auto_618543 ) ) ( not ( = ?auto_618539 ?auto_618544 ) ) ( not ( = ?auto_618539 ?auto_618545 ) ) ( not ( = ?auto_618539 ?auto_618546 ) ) ( not ( = ?auto_618539 ?auto_618547 ) ) ( not ( = ?auto_618539 ?auto_618548 ) ) ( not ( = ?auto_618539 ?auto_618549 ) ) ( not ( = ?auto_618539 ?auto_618550 ) ) ( not ( = ?auto_618539 ?auto_618551 ) ) ( not ( = ?auto_618539 ?auto_618552 ) ) ( not ( = ?auto_618540 ?auto_618541 ) ) ( not ( = ?auto_618540 ?auto_618542 ) ) ( not ( = ?auto_618540 ?auto_618543 ) ) ( not ( = ?auto_618540 ?auto_618544 ) ) ( not ( = ?auto_618540 ?auto_618545 ) ) ( not ( = ?auto_618540 ?auto_618546 ) ) ( not ( = ?auto_618540 ?auto_618547 ) ) ( not ( = ?auto_618540 ?auto_618548 ) ) ( not ( = ?auto_618540 ?auto_618549 ) ) ( not ( = ?auto_618540 ?auto_618550 ) ) ( not ( = ?auto_618540 ?auto_618551 ) ) ( not ( = ?auto_618540 ?auto_618552 ) ) ( not ( = ?auto_618541 ?auto_618542 ) ) ( not ( = ?auto_618541 ?auto_618543 ) ) ( not ( = ?auto_618541 ?auto_618544 ) ) ( not ( = ?auto_618541 ?auto_618545 ) ) ( not ( = ?auto_618541 ?auto_618546 ) ) ( not ( = ?auto_618541 ?auto_618547 ) ) ( not ( = ?auto_618541 ?auto_618548 ) ) ( not ( = ?auto_618541 ?auto_618549 ) ) ( not ( = ?auto_618541 ?auto_618550 ) ) ( not ( = ?auto_618541 ?auto_618551 ) ) ( not ( = ?auto_618541 ?auto_618552 ) ) ( not ( = ?auto_618542 ?auto_618543 ) ) ( not ( = ?auto_618542 ?auto_618544 ) ) ( not ( = ?auto_618542 ?auto_618545 ) ) ( not ( = ?auto_618542 ?auto_618546 ) ) ( not ( = ?auto_618542 ?auto_618547 ) ) ( not ( = ?auto_618542 ?auto_618548 ) ) ( not ( = ?auto_618542 ?auto_618549 ) ) ( not ( = ?auto_618542 ?auto_618550 ) ) ( not ( = ?auto_618542 ?auto_618551 ) ) ( not ( = ?auto_618542 ?auto_618552 ) ) ( not ( = ?auto_618543 ?auto_618544 ) ) ( not ( = ?auto_618543 ?auto_618545 ) ) ( not ( = ?auto_618543 ?auto_618546 ) ) ( not ( = ?auto_618543 ?auto_618547 ) ) ( not ( = ?auto_618543 ?auto_618548 ) ) ( not ( = ?auto_618543 ?auto_618549 ) ) ( not ( = ?auto_618543 ?auto_618550 ) ) ( not ( = ?auto_618543 ?auto_618551 ) ) ( not ( = ?auto_618543 ?auto_618552 ) ) ( not ( = ?auto_618544 ?auto_618545 ) ) ( not ( = ?auto_618544 ?auto_618546 ) ) ( not ( = ?auto_618544 ?auto_618547 ) ) ( not ( = ?auto_618544 ?auto_618548 ) ) ( not ( = ?auto_618544 ?auto_618549 ) ) ( not ( = ?auto_618544 ?auto_618550 ) ) ( not ( = ?auto_618544 ?auto_618551 ) ) ( not ( = ?auto_618544 ?auto_618552 ) ) ( not ( = ?auto_618545 ?auto_618546 ) ) ( not ( = ?auto_618545 ?auto_618547 ) ) ( not ( = ?auto_618545 ?auto_618548 ) ) ( not ( = ?auto_618545 ?auto_618549 ) ) ( not ( = ?auto_618545 ?auto_618550 ) ) ( not ( = ?auto_618545 ?auto_618551 ) ) ( not ( = ?auto_618545 ?auto_618552 ) ) ( not ( = ?auto_618546 ?auto_618547 ) ) ( not ( = ?auto_618546 ?auto_618548 ) ) ( not ( = ?auto_618546 ?auto_618549 ) ) ( not ( = ?auto_618546 ?auto_618550 ) ) ( not ( = ?auto_618546 ?auto_618551 ) ) ( not ( = ?auto_618546 ?auto_618552 ) ) ( not ( = ?auto_618547 ?auto_618548 ) ) ( not ( = ?auto_618547 ?auto_618549 ) ) ( not ( = ?auto_618547 ?auto_618550 ) ) ( not ( = ?auto_618547 ?auto_618551 ) ) ( not ( = ?auto_618547 ?auto_618552 ) ) ( not ( = ?auto_618548 ?auto_618549 ) ) ( not ( = ?auto_618548 ?auto_618550 ) ) ( not ( = ?auto_618548 ?auto_618551 ) ) ( not ( = ?auto_618548 ?auto_618552 ) ) ( not ( = ?auto_618549 ?auto_618550 ) ) ( not ( = ?auto_618549 ?auto_618551 ) ) ( not ( = ?auto_618549 ?auto_618552 ) ) ( not ( = ?auto_618550 ?auto_618551 ) ) ( not ( = ?auto_618550 ?auto_618552 ) ) ( not ( = ?auto_618551 ?auto_618552 ) ) ( ON ?auto_618550 ?auto_618551 ) ( ON ?auto_618549 ?auto_618550 ) ( ON ?auto_618548 ?auto_618549 ) ( ON ?auto_618547 ?auto_618548 ) ( ON ?auto_618546 ?auto_618547 ) ( ON ?auto_618545 ?auto_618546 ) ( ON ?auto_618544 ?auto_618545 ) ( CLEAR ?auto_618542 ) ( ON ?auto_618543 ?auto_618544 ) ( CLEAR ?auto_618543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_618536 ?auto_618537 ?auto_618538 ?auto_618539 ?auto_618540 ?auto_618541 ?auto_618542 ?auto_618543 )
      ( MAKE-16PILE ?auto_618536 ?auto_618537 ?auto_618538 ?auto_618539 ?auto_618540 ?auto_618541 ?auto_618542 ?auto_618543 ?auto_618544 ?auto_618545 ?auto_618546 ?auto_618547 ?auto_618548 ?auto_618549 ?auto_618550 ?auto_618551 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618602 - BLOCK
      ?auto_618603 - BLOCK
      ?auto_618604 - BLOCK
      ?auto_618605 - BLOCK
      ?auto_618606 - BLOCK
      ?auto_618607 - BLOCK
      ?auto_618608 - BLOCK
      ?auto_618609 - BLOCK
      ?auto_618610 - BLOCK
      ?auto_618611 - BLOCK
      ?auto_618612 - BLOCK
      ?auto_618613 - BLOCK
      ?auto_618614 - BLOCK
      ?auto_618615 - BLOCK
      ?auto_618616 - BLOCK
      ?auto_618617 - BLOCK
    )
    :vars
    (
      ?auto_618618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618617 ?auto_618618 ) ( ON-TABLE ?auto_618602 ) ( ON ?auto_618603 ?auto_618602 ) ( ON ?auto_618604 ?auto_618603 ) ( ON ?auto_618605 ?auto_618604 ) ( ON ?auto_618606 ?auto_618605 ) ( ON ?auto_618607 ?auto_618606 ) ( not ( = ?auto_618602 ?auto_618603 ) ) ( not ( = ?auto_618602 ?auto_618604 ) ) ( not ( = ?auto_618602 ?auto_618605 ) ) ( not ( = ?auto_618602 ?auto_618606 ) ) ( not ( = ?auto_618602 ?auto_618607 ) ) ( not ( = ?auto_618602 ?auto_618608 ) ) ( not ( = ?auto_618602 ?auto_618609 ) ) ( not ( = ?auto_618602 ?auto_618610 ) ) ( not ( = ?auto_618602 ?auto_618611 ) ) ( not ( = ?auto_618602 ?auto_618612 ) ) ( not ( = ?auto_618602 ?auto_618613 ) ) ( not ( = ?auto_618602 ?auto_618614 ) ) ( not ( = ?auto_618602 ?auto_618615 ) ) ( not ( = ?auto_618602 ?auto_618616 ) ) ( not ( = ?auto_618602 ?auto_618617 ) ) ( not ( = ?auto_618602 ?auto_618618 ) ) ( not ( = ?auto_618603 ?auto_618604 ) ) ( not ( = ?auto_618603 ?auto_618605 ) ) ( not ( = ?auto_618603 ?auto_618606 ) ) ( not ( = ?auto_618603 ?auto_618607 ) ) ( not ( = ?auto_618603 ?auto_618608 ) ) ( not ( = ?auto_618603 ?auto_618609 ) ) ( not ( = ?auto_618603 ?auto_618610 ) ) ( not ( = ?auto_618603 ?auto_618611 ) ) ( not ( = ?auto_618603 ?auto_618612 ) ) ( not ( = ?auto_618603 ?auto_618613 ) ) ( not ( = ?auto_618603 ?auto_618614 ) ) ( not ( = ?auto_618603 ?auto_618615 ) ) ( not ( = ?auto_618603 ?auto_618616 ) ) ( not ( = ?auto_618603 ?auto_618617 ) ) ( not ( = ?auto_618603 ?auto_618618 ) ) ( not ( = ?auto_618604 ?auto_618605 ) ) ( not ( = ?auto_618604 ?auto_618606 ) ) ( not ( = ?auto_618604 ?auto_618607 ) ) ( not ( = ?auto_618604 ?auto_618608 ) ) ( not ( = ?auto_618604 ?auto_618609 ) ) ( not ( = ?auto_618604 ?auto_618610 ) ) ( not ( = ?auto_618604 ?auto_618611 ) ) ( not ( = ?auto_618604 ?auto_618612 ) ) ( not ( = ?auto_618604 ?auto_618613 ) ) ( not ( = ?auto_618604 ?auto_618614 ) ) ( not ( = ?auto_618604 ?auto_618615 ) ) ( not ( = ?auto_618604 ?auto_618616 ) ) ( not ( = ?auto_618604 ?auto_618617 ) ) ( not ( = ?auto_618604 ?auto_618618 ) ) ( not ( = ?auto_618605 ?auto_618606 ) ) ( not ( = ?auto_618605 ?auto_618607 ) ) ( not ( = ?auto_618605 ?auto_618608 ) ) ( not ( = ?auto_618605 ?auto_618609 ) ) ( not ( = ?auto_618605 ?auto_618610 ) ) ( not ( = ?auto_618605 ?auto_618611 ) ) ( not ( = ?auto_618605 ?auto_618612 ) ) ( not ( = ?auto_618605 ?auto_618613 ) ) ( not ( = ?auto_618605 ?auto_618614 ) ) ( not ( = ?auto_618605 ?auto_618615 ) ) ( not ( = ?auto_618605 ?auto_618616 ) ) ( not ( = ?auto_618605 ?auto_618617 ) ) ( not ( = ?auto_618605 ?auto_618618 ) ) ( not ( = ?auto_618606 ?auto_618607 ) ) ( not ( = ?auto_618606 ?auto_618608 ) ) ( not ( = ?auto_618606 ?auto_618609 ) ) ( not ( = ?auto_618606 ?auto_618610 ) ) ( not ( = ?auto_618606 ?auto_618611 ) ) ( not ( = ?auto_618606 ?auto_618612 ) ) ( not ( = ?auto_618606 ?auto_618613 ) ) ( not ( = ?auto_618606 ?auto_618614 ) ) ( not ( = ?auto_618606 ?auto_618615 ) ) ( not ( = ?auto_618606 ?auto_618616 ) ) ( not ( = ?auto_618606 ?auto_618617 ) ) ( not ( = ?auto_618606 ?auto_618618 ) ) ( not ( = ?auto_618607 ?auto_618608 ) ) ( not ( = ?auto_618607 ?auto_618609 ) ) ( not ( = ?auto_618607 ?auto_618610 ) ) ( not ( = ?auto_618607 ?auto_618611 ) ) ( not ( = ?auto_618607 ?auto_618612 ) ) ( not ( = ?auto_618607 ?auto_618613 ) ) ( not ( = ?auto_618607 ?auto_618614 ) ) ( not ( = ?auto_618607 ?auto_618615 ) ) ( not ( = ?auto_618607 ?auto_618616 ) ) ( not ( = ?auto_618607 ?auto_618617 ) ) ( not ( = ?auto_618607 ?auto_618618 ) ) ( not ( = ?auto_618608 ?auto_618609 ) ) ( not ( = ?auto_618608 ?auto_618610 ) ) ( not ( = ?auto_618608 ?auto_618611 ) ) ( not ( = ?auto_618608 ?auto_618612 ) ) ( not ( = ?auto_618608 ?auto_618613 ) ) ( not ( = ?auto_618608 ?auto_618614 ) ) ( not ( = ?auto_618608 ?auto_618615 ) ) ( not ( = ?auto_618608 ?auto_618616 ) ) ( not ( = ?auto_618608 ?auto_618617 ) ) ( not ( = ?auto_618608 ?auto_618618 ) ) ( not ( = ?auto_618609 ?auto_618610 ) ) ( not ( = ?auto_618609 ?auto_618611 ) ) ( not ( = ?auto_618609 ?auto_618612 ) ) ( not ( = ?auto_618609 ?auto_618613 ) ) ( not ( = ?auto_618609 ?auto_618614 ) ) ( not ( = ?auto_618609 ?auto_618615 ) ) ( not ( = ?auto_618609 ?auto_618616 ) ) ( not ( = ?auto_618609 ?auto_618617 ) ) ( not ( = ?auto_618609 ?auto_618618 ) ) ( not ( = ?auto_618610 ?auto_618611 ) ) ( not ( = ?auto_618610 ?auto_618612 ) ) ( not ( = ?auto_618610 ?auto_618613 ) ) ( not ( = ?auto_618610 ?auto_618614 ) ) ( not ( = ?auto_618610 ?auto_618615 ) ) ( not ( = ?auto_618610 ?auto_618616 ) ) ( not ( = ?auto_618610 ?auto_618617 ) ) ( not ( = ?auto_618610 ?auto_618618 ) ) ( not ( = ?auto_618611 ?auto_618612 ) ) ( not ( = ?auto_618611 ?auto_618613 ) ) ( not ( = ?auto_618611 ?auto_618614 ) ) ( not ( = ?auto_618611 ?auto_618615 ) ) ( not ( = ?auto_618611 ?auto_618616 ) ) ( not ( = ?auto_618611 ?auto_618617 ) ) ( not ( = ?auto_618611 ?auto_618618 ) ) ( not ( = ?auto_618612 ?auto_618613 ) ) ( not ( = ?auto_618612 ?auto_618614 ) ) ( not ( = ?auto_618612 ?auto_618615 ) ) ( not ( = ?auto_618612 ?auto_618616 ) ) ( not ( = ?auto_618612 ?auto_618617 ) ) ( not ( = ?auto_618612 ?auto_618618 ) ) ( not ( = ?auto_618613 ?auto_618614 ) ) ( not ( = ?auto_618613 ?auto_618615 ) ) ( not ( = ?auto_618613 ?auto_618616 ) ) ( not ( = ?auto_618613 ?auto_618617 ) ) ( not ( = ?auto_618613 ?auto_618618 ) ) ( not ( = ?auto_618614 ?auto_618615 ) ) ( not ( = ?auto_618614 ?auto_618616 ) ) ( not ( = ?auto_618614 ?auto_618617 ) ) ( not ( = ?auto_618614 ?auto_618618 ) ) ( not ( = ?auto_618615 ?auto_618616 ) ) ( not ( = ?auto_618615 ?auto_618617 ) ) ( not ( = ?auto_618615 ?auto_618618 ) ) ( not ( = ?auto_618616 ?auto_618617 ) ) ( not ( = ?auto_618616 ?auto_618618 ) ) ( not ( = ?auto_618617 ?auto_618618 ) ) ( ON ?auto_618616 ?auto_618617 ) ( ON ?auto_618615 ?auto_618616 ) ( ON ?auto_618614 ?auto_618615 ) ( ON ?auto_618613 ?auto_618614 ) ( ON ?auto_618612 ?auto_618613 ) ( ON ?auto_618611 ?auto_618612 ) ( ON ?auto_618610 ?auto_618611 ) ( ON ?auto_618609 ?auto_618610 ) ( CLEAR ?auto_618607 ) ( ON ?auto_618608 ?auto_618609 ) ( CLEAR ?auto_618608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_618602 ?auto_618603 ?auto_618604 ?auto_618605 ?auto_618606 ?auto_618607 ?auto_618608 )
      ( MAKE-16PILE ?auto_618602 ?auto_618603 ?auto_618604 ?auto_618605 ?auto_618606 ?auto_618607 ?auto_618608 ?auto_618609 ?auto_618610 ?auto_618611 ?auto_618612 ?auto_618613 ?auto_618614 ?auto_618615 ?auto_618616 ?auto_618617 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618668 - BLOCK
      ?auto_618669 - BLOCK
      ?auto_618670 - BLOCK
      ?auto_618671 - BLOCK
      ?auto_618672 - BLOCK
      ?auto_618673 - BLOCK
      ?auto_618674 - BLOCK
      ?auto_618675 - BLOCK
      ?auto_618676 - BLOCK
      ?auto_618677 - BLOCK
      ?auto_618678 - BLOCK
      ?auto_618679 - BLOCK
      ?auto_618680 - BLOCK
      ?auto_618681 - BLOCK
      ?auto_618682 - BLOCK
      ?auto_618683 - BLOCK
    )
    :vars
    (
      ?auto_618684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618683 ?auto_618684 ) ( ON-TABLE ?auto_618668 ) ( ON ?auto_618669 ?auto_618668 ) ( ON ?auto_618670 ?auto_618669 ) ( ON ?auto_618671 ?auto_618670 ) ( ON ?auto_618672 ?auto_618671 ) ( not ( = ?auto_618668 ?auto_618669 ) ) ( not ( = ?auto_618668 ?auto_618670 ) ) ( not ( = ?auto_618668 ?auto_618671 ) ) ( not ( = ?auto_618668 ?auto_618672 ) ) ( not ( = ?auto_618668 ?auto_618673 ) ) ( not ( = ?auto_618668 ?auto_618674 ) ) ( not ( = ?auto_618668 ?auto_618675 ) ) ( not ( = ?auto_618668 ?auto_618676 ) ) ( not ( = ?auto_618668 ?auto_618677 ) ) ( not ( = ?auto_618668 ?auto_618678 ) ) ( not ( = ?auto_618668 ?auto_618679 ) ) ( not ( = ?auto_618668 ?auto_618680 ) ) ( not ( = ?auto_618668 ?auto_618681 ) ) ( not ( = ?auto_618668 ?auto_618682 ) ) ( not ( = ?auto_618668 ?auto_618683 ) ) ( not ( = ?auto_618668 ?auto_618684 ) ) ( not ( = ?auto_618669 ?auto_618670 ) ) ( not ( = ?auto_618669 ?auto_618671 ) ) ( not ( = ?auto_618669 ?auto_618672 ) ) ( not ( = ?auto_618669 ?auto_618673 ) ) ( not ( = ?auto_618669 ?auto_618674 ) ) ( not ( = ?auto_618669 ?auto_618675 ) ) ( not ( = ?auto_618669 ?auto_618676 ) ) ( not ( = ?auto_618669 ?auto_618677 ) ) ( not ( = ?auto_618669 ?auto_618678 ) ) ( not ( = ?auto_618669 ?auto_618679 ) ) ( not ( = ?auto_618669 ?auto_618680 ) ) ( not ( = ?auto_618669 ?auto_618681 ) ) ( not ( = ?auto_618669 ?auto_618682 ) ) ( not ( = ?auto_618669 ?auto_618683 ) ) ( not ( = ?auto_618669 ?auto_618684 ) ) ( not ( = ?auto_618670 ?auto_618671 ) ) ( not ( = ?auto_618670 ?auto_618672 ) ) ( not ( = ?auto_618670 ?auto_618673 ) ) ( not ( = ?auto_618670 ?auto_618674 ) ) ( not ( = ?auto_618670 ?auto_618675 ) ) ( not ( = ?auto_618670 ?auto_618676 ) ) ( not ( = ?auto_618670 ?auto_618677 ) ) ( not ( = ?auto_618670 ?auto_618678 ) ) ( not ( = ?auto_618670 ?auto_618679 ) ) ( not ( = ?auto_618670 ?auto_618680 ) ) ( not ( = ?auto_618670 ?auto_618681 ) ) ( not ( = ?auto_618670 ?auto_618682 ) ) ( not ( = ?auto_618670 ?auto_618683 ) ) ( not ( = ?auto_618670 ?auto_618684 ) ) ( not ( = ?auto_618671 ?auto_618672 ) ) ( not ( = ?auto_618671 ?auto_618673 ) ) ( not ( = ?auto_618671 ?auto_618674 ) ) ( not ( = ?auto_618671 ?auto_618675 ) ) ( not ( = ?auto_618671 ?auto_618676 ) ) ( not ( = ?auto_618671 ?auto_618677 ) ) ( not ( = ?auto_618671 ?auto_618678 ) ) ( not ( = ?auto_618671 ?auto_618679 ) ) ( not ( = ?auto_618671 ?auto_618680 ) ) ( not ( = ?auto_618671 ?auto_618681 ) ) ( not ( = ?auto_618671 ?auto_618682 ) ) ( not ( = ?auto_618671 ?auto_618683 ) ) ( not ( = ?auto_618671 ?auto_618684 ) ) ( not ( = ?auto_618672 ?auto_618673 ) ) ( not ( = ?auto_618672 ?auto_618674 ) ) ( not ( = ?auto_618672 ?auto_618675 ) ) ( not ( = ?auto_618672 ?auto_618676 ) ) ( not ( = ?auto_618672 ?auto_618677 ) ) ( not ( = ?auto_618672 ?auto_618678 ) ) ( not ( = ?auto_618672 ?auto_618679 ) ) ( not ( = ?auto_618672 ?auto_618680 ) ) ( not ( = ?auto_618672 ?auto_618681 ) ) ( not ( = ?auto_618672 ?auto_618682 ) ) ( not ( = ?auto_618672 ?auto_618683 ) ) ( not ( = ?auto_618672 ?auto_618684 ) ) ( not ( = ?auto_618673 ?auto_618674 ) ) ( not ( = ?auto_618673 ?auto_618675 ) ) ( not ( = ?auto_618673 ?auto_618676 ) ) ( not ( = ?auto_618673 ?auto_618677 ) ) ( not ( = ?auto_618673 ?auto_618678 ) ) ( not ( = ?auto_618673 ?auto_618679 ) ) ( not ( = ?auto_618673 ?auto_618680 ) ) ( not ( = ?auto_618673 ?auto_618681 ) ) ( not ( = ?auto_618673 ?auto_618682 ) ) ( not ( = ?auto_618673 ?auto_618683 ) ) ( not ( = ?auto_618673 ?auto_618684 ) ) ( not ( = ?auto_618674 ?auto_618675 ) ) ( not ( = ?auto_618674 ?auto_618676 ) ) ( not ( = ?auto_618674 ?auto_618677 ) ) ( not ( = ?auto_618674 ?auto_618678 ) ) ( not ( = ?auto_618674 ?auto_618679 ) ) ( not ( = ?auto_618674 ?auto_618680 ) ) ( not ( = ?auto_618674 ?auto_618681 ) ) ( not ( = ?auto_618674 ?auto_618682 ) ) ( not ( = ?auto_618674 ?auto_618683 ) ) ( not ( = ?auto_618674 ?auto_618684 ) ) ( not ( = ?auto_618675 ?auto_618676 ) ) ( not ( = ?auto_618675 ?auto_618677 ) ) ( not ( = ?auto_618675 ?auto_618678 ) ) ( not ( = ?auto_618675 ?auto_618679 ) ) ( not ( = ?auto_618675 ?auto_618680 ) ) ( not ( = ?auto_618675 ?auto_618681 ) ) ( not ( = ?auto_618675 ?auto_618682 ) ) ( not ( = ?auto_618675 ?auto_618683 ) ) ( not ( = ?auto_618675 ?auto_618684 ) ) ( not ( = ?auto_618676 ?auto_618677 ) ) ( not ( = ?auto_618676 ?auto_618678 ) ) ( not ( = ?auto_618676 ?auto_618679 ) ) ( not ( = ?auto_618676 ?auto_618680 ) ) ( not ( = ?auto_618676 ?auto_618681 ) ) ( not ( = ?auto_618676 ?auto_618682 ) ) ( not ( = ?auto_618676 ?auto_618683 ) ) ( not ( = ?auto_618676 ?auto_618684 ) ) ( not ( = ?auto_618677 ?auto_618678 ) ) ( not ( = ?auto_618677 ?auto_618679 ) ) ( not ( = ?auto_618677 ?auto_618680 ) ) ( not ( = ?auto_618677 ?auto_618681 ) ) ( not ( = ?auto_618677 ?auto_618682 ) ) ( not ( = ?auto_618677 ?auto_618683 ) ) ( not ( = ?auto_618677 ?auto_618684 ) ) ( not ( = ?auto_618678 ?auto_618679 ) ) ( not ( = ?auto_618678 ?auto_618680 ) ) ( not ( = ?auto_618678 ?auto_618681 ) ) ( not ( = ?auto_618678 ?auto_618682 ) ) ( not ( = ?auto_618678 ?auto_618683 ) ) ( not ( = ?auto_618678 ?auto_618684 ) ) ( not ( = ?auto_618679 ?auto_618680 ) ) ( not ( = ?auto_618679 ?auto_618681 ) ) ( not ( = ?auto_618679 ?auto_618682 ) ) ( not ( = ?auto_618679 ?auto_618683 ) ) ( not ( = ?auto_618679 ?auto_618684 ) ) ( not ( = ?auto_618680 ?auto_618681 ) ) ( not ( = ?auto_618680 ?auto_618682 ) ) ( not ( = ?auto_618680 ?auto_618683 ) ) ( not ( = ?auto_618680 ?auto_618684 ) ) ( not ( = ?auto_618681 ?auto_618682 ) ) ( not ( = ?auto_618681 ?auto_618683 ) ) ( not ( = ?auto_618681 ?auto_618684 ) ) ( not ( = ?auto_618682 ?auto_618683 ) ) ( not ( = ?auto_618682 ?auto_618684 ) ) ( not ( = ?auto_618683 ?auto_618684 ) ) ( ON ?auto_618682 ?auto_618683 ) ( ON ?auto_618681 ?auto_618682 ) ( ON ?auto_618680 ?auto_618681 ) ( ON ?auto_618679 ?auto_618680 ) ( ON ?auto_618678 ?auto_618679 ) ( ON ?auto_618677 ?auto_618678 ) ( ON ?auto_618676 ?auto_618677 ) ( ON ?auto_618675 ?auto_618676 ) ( ON ?auto_618674 ?auto_618675 ) ( CLEAR ?auto_618672 ) ( ON ?auto_618673 ?auto_618674 ) ( CLEAR ?auto_618673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_618668 ?auto_618669 ?auto_618670 ?auto_618671 ?auto_618672 ?auto_618673 )
      ( MAKE-16PILE ?auto_618668 ?auto_618669 ?auto_618670 ?auto_618671 ?auto_618672 ?auto_618673 ?auto_618674 ?auto_618675 ?auto_618676 ?auto_618677 ?auto_618678 ?auto_618679 ?auto_618680 ?auto_618681 ?auto_618682 ?auto_618683 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618734 - BLOCK
      ?auto_618735 - BLOCK
      ?auto_618736 - BLOCK
      ?auto_618737 - BLOCK
      ?auto_618738 - BLOCK
      ?auto_618739 - BLOCK
      ?auto_618740 - BLOCK
      ?auto_618741 - BLOCK
      ?auto_618742 - BLOCK
      ?auto_618743 - BLOCK
      ?auto_618744 - BLOCK
      ?auto_618745 - BLOCK
      ?auto_618746 - BLOCK
      ?auto_618747 - BLOCK
      ?auto_618748 - BLOCK
      ?auto_618749 - BLOCK
    )
    :vars
    (
      ?auto_618750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618749 ?auto_618750 ) ( ON-TABLE ?auto_618734 ) ( ON ?auto_618735 ?auto_618734 ) ( ON ?auto_618736 ?auto_618735 ) ( ON ?auto_618737 ?auto_618736 ) ( not ( = ?auto_618734 ?auto_618735 ) ) ( not ( = ?auto_618734 ?auto_618736 ) ) ( not ( = ?auto_618734 ?auto_618737 ) ) ( not ( = ?auto_618734 ?auto_618738 ) ) ( not ( = ?auto_618734 ?auto_618739 ) ) ( not ( = ?auto_618734 ?auto_618740 ) ) ( not ( = ?auto_618734 ?auto_618741 ) ) ( not ( = ?auto_618734 ?auto_618742 ) ) ( not ( = ?auto_618734 ?auto_618743 ) ) ( not ( = ?auto_618734 ?auto_618744 ) ) ( not ( = ?auto_618734 ?auto_618745 ) ) ( not ( = ?auto_618734 ?auto_618746 ) ) ( not ( = ?auto_618734 ?auto_618747 ) ) ( not ( = ?auto_618734 ?auto_618748 ) ) ( not ( = ?auto_618734 ?auto_618749 ) ) ( not ( = ?auto_618734 ?auto_618750 ) ) ( not ( = ?auto_618735 ?auto_618736 ) ) ( not ( = ?auto_618735 ?auto_618737 ) ) ( not ( = ?auto_618735 ?auto_618738 ) ) ( not ( = ?auto_618735 ?auto_618739 ) ) ( not ( = ?auto_618735 ?auto_618740 ) ) ( not ( = ?auto_618735 ?auto_618741 ) ) ( not ( = ?auto_618735 ?auto_618742 ) ) ( not ( = ?auto_618735 ?auto_618743 ) ) ( not ( = ?auto_618735 ?auto_618744 ) ) ( not ( = ?auto_618735 ?auto_618745 ) ) ( not ( = ?auto_618735 ?auto_618746 ) ) ( not ( = ?auto_618735 ?auto_618747 ) ) ( not ( = ?auto_618735 ?auto_618748 ) ) ( not ( = ?auto_618735 ?auto_618749 ) ) ( not ( = ?auto_618735 ?auto_618750 ) ) ( not ( = ?auto_618736 ?auto_618737 ) ) ( not ( = ?auto_618736 ?auto_618738 ) ) ( not ( = ?auto_618736 ?auto_618739 ) ) ( not ( = ?auto_618736 ?auto_618740 ) ) ( not ( = ?auto_618736 ?auto_618741 ) ) ( not ( = ?auto_618736 ?auto_618742 ) ) ( not ( = ?auto_618736 ?auto_618743 ) ) ( not ( = ?auto_618736 ?auto_618744 ) ) ( not ( = ?auto_618736 ?auto_618745 ) ) ( not ( = ?auto_618736 ?auto_618746 ) ) ( not ( = ?auto_618736 ?auto_618747 ) ) ( not ( = ?auto_618736 ?auto_618748 ) ) ( not ( = ?auto_618736 ?auto_618749 ) ) ( not ( = ?auto_618736 ?auto_618750 ) ) ( not ( = ?auto_618737 ?auto_618738 ) ) ( not ( = ?auto_618737 ?auto_618739 ) ) ( not ( = ?auto_618737 ?auto_618740 ) ) ( not ( = ?auto_618737 ?auto_618741 ) ) ( not ( = ?auto_618737 ?auto_618742 ) ) ( not ( = ?auto_618737 ?auto_618743 ) ) ( not ( = ?auto_618737 ?auto_618744 ) ) ( not ( = ?auto_618737 ?auto_618745 ) ) ( not ( = ?auto_618737 ?auto_618746 ) ) ( not ( = ?auto_618737 ?auto_618747 ) ) ( not ( = ?auto_618737 ?auto_618748 ) ) ( not ( = ?auto_618737 ?auto_618749 ) ) ( not ( = ?auto_618737 ?auto_618750 ) ) ( not ( = ?auto_618738 ?auto_618739 ) ) ( not ( = ?auto_618738 ?auto_618740 ) ) ( not ( = ?auto_618738 ?auto_618741 ) ) ( not ( = ?auto_618738 ?auto_618742 ) ) ( not ( = ?auto_618738 ?auto_618743 ) ) ( not ( = ?auto_618738 ?auto_618744 ) ) ( not ( = ?auto_618738 ?auto_618745 ) ) ( not ( = ?auto_618738 ?auto_618746 ) ) ( not ( = ?auto_618738 ?auto_618747 ) ) ( not ( = ?auto_618738 ?auto_618748 ) ) ( not ( = ?auto_618738 ?auto_618749 ) ) ( not ( = ?auto_618738 ?auto_618750 ) ) ( not ( = ?auto_618739 ?auto_618740 ) ) ( not ( = ?auto_618739 ?auto_618741 ) ) ( not ( = ?auto_618739 ?auto_618742 ) ) ( not ( = ?auto_618739 ?auto_618743 ) ) ( not ( = ?auto_618739 ?auto_618744 ) ) ( not ( = ?auto_618739 ?auto_618745 ) ) ( not ( = ?auto_618739 ?auto_618746 ) ) ( not ( = ?auto_618739 ?auto_618747 ) ) ( not ( = ?auto_618739 ?auto_618748 ) ) ( not ( = ?auto_618739 ?auto_618749 ) ) ( not ( = ?auto_618739 ?auto_618750 ) ) ( not ( = ?auto_618740 ?auto_618741 ) ) ( not ( = ?auto_618740 ?auto_618742 ) ) ( not ( = ?auto_618740 ?auto_618743 ) ) ( not ( = ?auto_618740 ?auto_618744 ) ) ( not ( = ?auto_618740 ?auto_618745 ) ) ( not ( = ?auto_618740 ?auto_618746 ) ) ( not ( = ?auto_618740 ?auto_618747 ) ) ( not ( = ?auto_618740 ?auto_618748 ) ) ( not ( = ?auto_618740 ?auto_618749 ) ) ( not ( = ?auto_618740 ?auto_618750 ) ) ( not ( = ?auto_618741 ?auto_618742 ) ) ( not ( = ?auto_618741 ?auto_618743 ) ) ( not ( = ?auto_618741 ?auto_618744 ) ) ( not ( = ?auto_618741 ?auto_618745 ) ) ( not ( = ?auto_618741 ?auto_618746 ) ) ( not ( = ?auto_618741 ?auto_618747 ) ) ( not ( = ?auto_618741 ?auto_618748 ) ) ( not ( = ?auto_618741 ?auto_618749 ) ) ( not ( = ?auto_618741 ?auto_618750 ) ) ( not ( = ?auto_618742 ?auto_618743 ) ) ( not ( = ?auto_618742 ?auto_618744 ) ) ( not ( = ?auto_618742 ?auto_618745 ) ) ( not ( = ?auto_618742 ?auto_618746 ) ) ( not ( = ?auto_618742 ?auto_618747 ) ) ( not ( = ?auto_618742 ?auto_618748 ) ) ( not ( = ?auto_618742 ?auto_618749 ) ) ( not ( = ?auto_618742 ?auto_618750 ) ) ( not ( = ?auto_618743 ?auto_618744 ) ) ( not ( = ?auto_618743 ?auto_618745 ) ) ( not ( = ?auto_618743 ?auto_618746 ) ) ( not ( = ?auto_618743 ?auto_618747 ) ) ( not ( = ?auto_618743 ?auto_618748 ) ) ( not ( = ?auto_618743 ?auto_618749 ) ) ( not ( = ?auto_618743 ?auto_618750 ) ) ( not ( = ?auto_618744 ?auto_618745 ) ) ( not ( = ?auto_618744 ?auto_618746 ) ) ( not ( = ?auto_618744 ?auto_618747 ) ) ( not ( = ?auto_618744 ?auto_618748 ) ) ( not ( = ?auto_618744 ?auto_618749 ) ) ( not ( = ?auto_618744 ?auto_618750 ) ) ( not ( = ?auto_618745 ?auto_618746 ) ) ( not ( = ?auto_618745 ?auto_618747 ) ) ( not ( = ?auto_618745 ?auto_618748 ) ) ( not ( = ?auto_618745 ?auto_618749 ) ) ( not ( = ?auto_618745 ?auto_618750 ) ) ( not ( = ?auto_618746 ?auto_618747 ) ) ( not ( = ?auto_618746 ?auto_618748 ) ) ( not ( = ?auto_618746 ?auto_618749 ) ) ( not ( = ?auto_618746 ?auto_618750 ) ) ( not ( = ?auto_618747 ?auto_618748 ) ) ( not ( = ?auto_618747 ?auto_618749 ) ) ( not ( = ?auto_618747 ?auto_618750 ) ) ( not ( = ?auto_618748 ?auto_618749 ) ) ( not ( = ?auto_618748 ?auto_618750 ) ) ( not ( = ?auto_618749 ?auto_618750 ) ) ( ON ?auto_618748 ?auto_618749 ) ( ON ?auto_618747 ?auto_618748 ) ( ON ?auto_618746 ?auto_618747 ) ( ON ?auto_618745 ?auto_618746 ) ( ON ?auto_618744 ?auto_618745 ) ( ON ?auto_618743 ?auto_618744 ) ( ON ?auto_618742 ?auto_618743 ) ( ON ?auto_618741 ?auto_618742 ) ( ON ?auto_618740 ?auto_618741 ) ( ON ?auto_618739 ?auto_618740 ) ( CLEAR ?auto_618737 ) ( ON ?auto_618738 ?auto_618739 ) ( CLEAR ?auto_618738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_618734 ?auto_618735 ?auto_618736 ?auto_618737 ?auto_618738 )
      ( MAKE-16PILE ?auto_618734 ?auto_618735 ?auto_618736 ?auto_618737 ?auto_618738 ?auto_618739 ?auto_618740 ?auto_618741 ?auto_618742 ?auto_618743 ?auto_618744 ?auto_618745 ?auto_618746 ?auto_618747 ?auto_618748 ?auto_618749 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618800 - BLOCK
      ?auto_618801 - BLOCK
      ?auto_618802 - BLOCK
      ?auto_618803 - BLOCK
      ?auto_618804 - BLOCK
      ?auto_618805 - BLOCK
      ?auto_618806 - BLOCK
      ?auto_618807 - BLOCK
      ?auto_618808 - BLOCK
      ?auto_618809 - BLOCK
      ?auto_618810 - BLOCK
      ?auto_618811 - BLOCK
      ?auto_618812 - BLOCK
      ?auto_618813 - BLOCK
      ?auto_618814 - BLOCK
      ?auto_618815 - BLOCK
    )
    :vars
    (
      ?auto_618816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618815 ?auto_618816 ) ( ON-TABLE ?auto_618800 ) ( ON ?auto_618801 ?auto_618800 ) ( ON ?auto_618802 ?auto_618801 ) ( not ( = ?auto_618800 ?auto_618801 ) ) ( not ( = ?auto_618800 ?auto_618802 ) ) ( not ( = ?auto_618800 ?auto_618803 ) ) ( not ( = ?auto_618800 ?auto_618804 ) ) ( not ( = ?auto_618800 ?auto_618805 ) ) ( not ( = ?auto_618800 ?auto_618806 ) ) ( not ( = ?auto_618800 ?auto_618807 ) ) ( not ( = ?auto_618800 ?auto_618808 ) ) ( not ( = ?auto_618800 ?auto_618809 ) ) ( not ( = ?auto_618800 ?auto_618810 ) ) ( not ( = ?auto_618800 ?auto_618811 ) ) ( not ( = ?auto_618800 ?auto_618812 ) ) ( not ( = ?auto_618800 ?auto_618813 ) ) ( not ( = ?auto_618800 ?auto_618814 ) ) ( not ( = ?auto_618800 ?auto_618815 ) ) ( not ( = ?auto_618800 ?auto_618816 ) ) ( not ( = ?auto_618801 ?auto_618802 ) ) ( not ( = ?auto_618801 ?auto_618803 ) ) ( not ( = ?auto_618801 ?auto_618804 ) ) ( not ( = ?auto_618801 ?auto_618805 ) ) ( not ( = ?auto_618801 ?auto_618806 ) ) ( not ( = ?auto_618801 ?auto_618807 ) ) ( not ( = ?auto_618801 ?auto_618808 ) ) ( not ( = ?auto_618801 ?auto_618809 ) ) ( not ( = ?auto_618801 ?auto_618810 ) ) ( not ( = ?auto_618801 ?auto_618811 ) ) ( not ( = ?auto_618801 ?auto_618812 ) ) ( not ( = ?auto_618801 ?auto_618813 ) ) ( not ( = ?auto_618801 ?auto_618814 ) ) ( not ( = ?auto_618801 ?auto_618815 ) ) ( not ( = ?auto_618801 ?auto_618816 ) ) ( not ( = ?auto_618802 ?auto_618803 ) ) ( not ( = ?auto_618802 ?auto_618804 ) ) ( not ( = ?auto_618802 ?auto_618805 ) ) ( not ( = ?auto_618802 ?auto_618806 ) ) ( not ( = ?auto_618802 ?auto_618807 ) ) ( not ( = ?auto_618802 ?auto_618808 ) ) ( not ( = ?auto_618802 ?auto_618809 ) ) ( not ( = ?auto_618802 ?auto_618810 ) ) ( not ( = ?auto_618802 ?auto_618811 ) ) ( not ( = ?auto_618802 ?auto_618812 ) ) ( not ( = ?auto_618802 ?auto_618813 ) ) ( not ( = ?auto_618802 ?auto_618814 ) ) ( not ( = ?auto_618802 ?auto_618815 ) ) ( not ( = ?auto_618802 ?auto_618816 ) ) ( not ( = ?auto_618803 ?auto_618804 ) ) ( not ( = ?auto_618803 ?auto_618805 ) ) ( not ( = ?auto_618803 ?auto_618806 ) ) ( not ( = ?auto_618803 ?auto_618807 ) ) ( not ( = ?auto_618803 ?auto_618808 ) ) ( not ( = ?auto_618803 ?auto_618809 ) ) ( not ( = ?auto_618803 ?auto_618810 ) ) ( not ( = ?auto_618803 ?auto_618811 ) ) ( not ( = ?auto_618803 ?auto_618812 ) ) ( not ( = ?auto_618803 ?auto_618813 ) ) ( not ( = ?auto_618803 ?auto_618814 ) ) ( not ( = ?auto_618803 ?auto_618815 ) ) ( not ( = ?auto_618803 ?auto_618816 ) ) ( not ( = ?auto_618804 ?auto_618805 ) ) ( not ( = ?auto_618804 ?auto_618806 ) ) ( not ( = ?auto_618804 ?auto_618807 ) ) ( not ( = ?auto_618804 ?auto_618808 ) ) ( not ( = ?auto_618804 ?auto_618809 ) ) ( not ( = ?auto_618804 ?auto_618810 ) ) ( not ( = ?auto_618804 ?auto_618811 ) ) ( not ( = ?auto_618804 ?auto_618812 ) ) ( not ( = ?auto_618804 ?auto_618813 ) ) ( not ( = ?auto_618804 ?auto_618814 ) ) ( not ( = ?auto_618804 ?auto_618815 ) ) ( not ( = ?auto_618804 ?auto_618816 ) ) ( not ( = ?auto_618805 ?auto_618806 ) ) ( not ( = ?auto_618805 ?auto_618807 ) ) ( not ( = ?auto_618805 ?auto_618808 ) ) ( not ( = ?auto_618805 ?auto_618809 ) ) ( not ( = ?auto_618805 ?auto_618810 ) ) ( not ( = ?auto_618805 ?auto_618811 ) ) ( not ( = ?auto_618805 ?auto_618812 ) ) ( not ( = ?auto_618805 ?auto_618813 ) ) ( not ( = ?auto_618805 ?auto_618814 ) ) ( not ( = ?auto_618805 ?auto_618815 ) ) ( not ( = ?auto_618805 ?auto_618816 ) ) ( not ( = ?auto_618806 ?auto_618807 ) ) ( not ( = ?auto_618806 ?auto_618808 ) ) ( not ( = ?auto_618806 ?auto_618809 ) ) ( not ( = ?auto_618806 ?auto_618810 ) ) ( not ( = ?auto_618806 ?auto_618811 ) ) ( not ( = ?auto_618806 ?auto_618812 ) ) ( not ( = ?auto_618806 ?auto_618813 ) ) ( not ( = ?auto_618806 ?auto_618814 ) ) ( not ( = ?auto_618806 ?auto_618815 ) ) ( not ( = ?auto_618806 ?auto_618816 ) ) ( not ( = ?auto_618807 ?auto_618808 ) ) ( not ( = ?auto_618807 ?auto_618809 ) ) ( not ( = ?auto_618807 ?auto_618810 ) ) ( not ( = ?auto_618807 ?auto_618811 ) ) ( not ( = ?auto_618807 ?auto_618812 ) ) ( not ( = ?auto_618807 ?auto_618813 ) ) ( not ( = ?auto_618807 ?auto_618814 ) ) ( not ( = ?auto_618807 ?auto_618815 ) ) ( not ( = ?auto_618807 ?auto_618816 ) ) ( not ( = ?auto_618808 ?auto_618809 ) ) ( not ( = ?auto_618808 ?auto_618810 ) ) ( not ( = ?auto_618808 ?auto_618811 ) ) ( not ( = ?auto_618808 ?auto_618812 ) ) ( not ( = ?auto_618808 ?auto_618813 ) ) ( not ( = ?auto_618808 ?auto_618814 ) ) ( not ( = ?auto_618808 ?auto_618815 ) ) ( not ( = ?auto_618808 ?auto_618816 ) ) ( not ( = ?auto_618809 ?auto_618810 ) ) ( not ( = ?auto_618809 ?auto_618811 ) ) ( not ( = ?auto_618809 ?auto_618812 ) ) ( not ( = ?auto_618809 ?auto_618813 ) ) ( not ( = ?auto_618809 ?auto_618814 ) ) ( not ( = ?auto_618809 ?auto_618815 ) ) ( not ( = ?auto_618809 ?auto_618816 ) ) ( not ( = ?auto_618810 ?auto_618811 ) ) ( not ( = ?auto_618810 ?auto_618812 ) ) ( not ( = ?auto_618810 ?auto_618813 ) ) ( not ( = ?auto_618810 ?auto_618814 ) ) ( not ( = ?auto_618810 ?auto_618815 ) ) ( not ( = ?auto_618810 ?auto_618816 ) ) ( not ( = ?auto_618811 ?auto_618812 ) ) ( not ( = ?auto_618811 ?auto_618813 ) ) ( not ( = ?auto_618811 ?auto_618814 ) ) ( not ( = ?auto_618811 ?auto_618815 ) ) ( not ( = ?auto_618811 ?auto_618816 ) ) ( not ( = ?auto_618812 ?auto_618813 ) ) ( not ( = ?auto_618812 ?auto_618814 ) ) ( not ( = ?auto_618812 ?auto_618815 ) ) ( not ( = ?auto_618812 ?auto_618816 ) ) ( not ( = ?auto_618813 ?auto_618814 ) ) ( not ( = ?auto_618813 ?auto_618815 ) ) ( not ( = ?auto_618813 ?auto_618816 ) ) ( not ( = ?auto_618814 ?auto_618815 ) ) ( not ( = ?auto_618814 ?auto_618816 ) ) ( not ( = ?auto_618815 ?auto_618816 ) ) ( ON ?auto_618814 ?auto_618815 ) ( ON ?auto_618813 ?auto_618814 ) ( ON ?auto_618812 ?auto_618813 ) ( ON ?auto_618811 ?auto_618812 ) ( ON ?auto_618810 ?auto_618811 ) ( ON ?auto_618809 ?auto_618810 ) ( ON ?auto_618808 ?auto_618809 ) ( ON ?auto_618807 ?auto_618808 ) ( ON ?auto_618806 ?auto_618807 ) ( ON ?auto_618805 ?auto_618806 ) ( ON ?auto_618804 ?auto_618805 ) ( CLEAR ?auto_618802 ) ( ON ?auto_618803 ?auto_618804 ) ( CLEAR ?auto_618803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_618800 ?auto_618801 ?auto_618802 ?auto_618803 )
      ( MAKE-16PILE ?auto_618800 ?auto_618801 ?auto_618802 ?auto_618803 ?auto_618804 ?auto_618805 ?auto_618806 ?auto_618807 ?auto_618808 ?auto_618809 ?auto_618810 ?auto_618811 ?auto_618812 ?auto_618813 ?auto_618814 ?auto_618815 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618866 - BLOCK
      ?auto_618867 - BLOCK
      ?auto_618868 - BLOCK
      ?auto_618869 - BLOCK
      ?auto_618870 - BLOCK
      ?auto_618871 - BLOCK
      ?auto_618872 - BLOCK
      ?auto_618873 - BLOCK
      ?auto_618874 - BLOCK
      ?auto_618875 - BLOCK
      ?auto_618876 - BLOCK
      ?auto_618877 - BLOCK
      ?auto_618878 - BLOCK
      ?auto_618879 - BLOCK
      ?auto_618880 - BLOCK
      ?auto_618881 - BLOCK
    )
    :vars
    (
      ?auto_618882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618881 ?auto_618882 ) ( ON-TABLE ?auto_618866 ) ( ON ?auto_618867 ?auto_618866 ) ( not ( = ?auto_618866 ?auto_618867 ) ) ( not ( = ?auto_618866 ?auto_618868 ) ) ( not ( = ?auto_618866 ?auto_618869 ) ) ( not ( = ?auto_618866 ?auto_618870 ) ) ( not ( = ?auto_618866 ?auto_618871 ) ) ( not ( = ?auto_618866 ?auto_618872 ) ) ( not ( = ?auto_618866 ?auto_618873 ) ) ( not ( = ?auto_618866 ?auto_618874 ) ) ( not ( = ?auto_618866 ?auto_618875 ) ) ( not ( = ?auto_618866 ?auto_618876 ) ) ( not ( = ?auto_618866 ?auto_618877 ) ) ( not ( = ?auto_618866 ?auto_618878 ) ) ( not ( = ?auto_618866 ?auto_618879 ) ) ( not ( = ?auto_618866 ?auto_618880 ) ) ( not ( = ?auto_618866 ?auto_618881 ) ) ( not ( = ?auto_618866 ?auto_618882 ) ) ( not ( = ?auto_618867 ?auto_618868 ) ) ( not ( = ?auto_618867 ?auto_618869 ) ) ( not ( = ?auto_618867 ?auto_618870 ) ) ( not ( = ?auto_618867 ?auto_618871 ) ) ( not ( = ?auto_618867 ?auto_618872 ) ) ( not ( = ?auto_618867 ?auto_618873 ) ) ( not ( = ?auto_618867 ?auto_618874 ) ) ( not ( = ?auto_618867 ?auto_618875 ) ) ( not ( = ?auto_618867 ?auto_618876 ) ) ( not ( = ?auto_618867 ?auto_618877 ) ) ( not ( = ?auto_618867 ?auto_618878 ) ) ( not ( = ?auto_618867 ?auto_618879 ) ) ( not ( = ?auto_618867 ?auto_618880 ) ) ( not ( = ?auto_618867 ?auto_618881 ) ) ( not ( = ?auto_618867 ?auto_618882 ) ) ( not ( = ?auto_618868 ?auto_618869 ) ) ( not ( = ?auto_618868 ?auto_618870 ) ) ( not ( = ?auto_618868 ?auto_618871 ) ) ( not ( = ?auto_618868 ?auto_618872 ) ) ( not ( = ?auto_618868 ?auto_618873 ) ) ( not ( = ?auto_618868 ?auto_618874 ) ) ( not ( = ?auto_618868 ?auto_618875 ) ) ( not ( = ?auto_618868 ?auto_618876 ) ) ( not ( = ?auto_618868 ?auto_618877 ) ) ( not ( = ?auto_618868 ?auto_618878 ) ) ( not ( = ?auto_618868 ?auto_618879 ) ) ( not ( = ?auto_618868 ?auto_618880 ) ) ( not ( = ?auto_618868 ?auto_618881 ) ) ( not ( = ?auto_618868 ?auto_618882 ) ) ( not ( = ?auto_618869 ?auto_618870 ) ) ( not ( = ?auto_618869 ?auto_618871 ) ) ( not ( = ?auto_618869 ?auto_618872 ) ) ( not ( = ?auto_618869 ?auto_618873 ) ) ( not ( = ?auto_618869 ?auto_618874 ) ) ( not ( = ?auto_618869 ?auto_618875 ) ) ( not ( = ?auto_618869 ?auto_618876 ) ) ( not ( = ?auto_618869 ?auto_618877 ) ) ( not ( = ?auto_618869 ?auto_618878 ) ) ( not ( = ?auto_618869 ?auto_618879 ) ) ( not ( = ?auto_618869 ?auto_618880 ) ) ( not ( = ?auto_618869 ?auto_618881 ) ) ( not ( = ?auto_618869 ?auto_618882 ) ) ( not ( = ?auto_618870 ?auto_618871 ) ) ( not ( = ?auto_618870 ?auto_618872 ) ) ( not ( = ?auto_618870 ?auto_618873 ) ) ( not ( = ?auto_618870 ?auto_618874 ) ) ( not ( = ?auto_618870 ?auto_618875 ) ) ( not ( = ?auto_618870 ?auto_618876 ) ) ( not ( = ?auto_618870 ?auto_618877 ) ) ( not ( = ?auto_618870 ?auto_618878 ) ) ( not ( = ?auto_618870 ?auto_618879 ) ) ( not ( = ?auto_618870 ?auto_618880 ) ) ( not ( = ?auto_618870 ?auto_618881 ) ) ( not ( = ?auto_618870 ?auto_618882 ) ) ( not ( = ?auto_618871 ?auto_618872 ) ) ( not ( = ?auto_618871 ?auto_618873 ) ) ( not ( = ?auto_618871 ?auto_618874 ) ) ( not ( = ?auto_618871 ?auto_618875 ) ) ( not ( = ?auto_618871 ?auto_618876 ) ) ( not ( = ?auto_618871 ?auto_618877 ) ) ( not ( = ?auto_618871 ?auto_618878 ) ) ( not ( = ?auto_618871 ?auto_618879 ) ) ( not ( = ?auto_618871 ?auto_618880 ) ) ( not ( = ?auto_618871 ?auto_618881 ) ) ( not ( = ?auto_618871 ?auto_618882 ) ) ( not ( = ?auto_618872 ?auto_618873 ) ) ( not ( = ?auto_618872 ?auto_618874 ) ) ( not ( = ?auto_618872 ?auto_618875 ) ) ( not ( = ?auto_618872 ?auto_618876 ) ) ( not ( = ?auto_618872 ?auto_618877 ) ) ( not ( = ?auto_618872 ?auto_618878 ) ) ( not ( = ?auto_618872 ?auto_618879 ) ) ( not ( = ?auto_618872 ?auto_618880 ) ) ( not ( = ?auto_618872 ?auto_618881 ) ) ( not ( = ?auto_618872 ?auto_618882 ) ) ( not ( = ?auto_618873 ?auto_618874 ) ) ( not ( = ?auto_618873 ?auto_618875 ) ) ( not ( = ?auto_618873 ?auto_618876 ) ) ( not ( = ?auto_618873 ?auto_618877 ) ) ( not ( = ?auto_618873 ?auto_618878 ) ) ( not ( = ?auto_618873 ?auto_618879 ) ) ( not ( = ?auto_618873 ?auto_618880 ) ) ( not ( = ?auto_618873 ?auto_618881 ) ) ( not ( = ?auto_618873 ?auto_618882 ) ) ( not ( = ?auto_618874 ?auto_618875 ) ) ( not ( = ?auto_618874 ?auto_618876 ) ) ( not ( = ?auto_618874 ?auto_618877 ) ) ( not ( = ?auto_618874 ?auto_618878 ) ) ( not ( = ?auto_618874 ?auto_618879 ) ) ( not ( = ?auto_618874 ?auto_618880 ) ) ( not ( = ?auto_618874 ?auto_618881 ) ) ( not ( = ?auto_618874 ?auto_618882 ) ) ( not ( = ?auto_618875 ?auto_618876 ) ) ( not ( = ?auto_618875 ?auto_618877 ) ) ( not ( = ?auto_618875 ?auto_618878 ) ) ( not ( = ?auto_618875 ?auto_618879 ) ) ( not ( = ?auto_618875 ?auto_618880 ) ) ( not ( = ?auto_618875 ?auto_618881 ) ) ( not ( = ?auto_618875 ?auto_618882 ) ) ( not ( = ?auto_618876 ?auto_618877 ) ) ( not ( = ?auto_618876 ?auto_618878 ) ) ( not ( = ?auto_618876 ?auto_618879 ) ) ( not ( = ?auto_618876 ?auto_618880 ) ) ( not ( = ?auto_618876 ?auto_618881 ) ) ( not ( = ?auto_618876 ?auto_618882 ) ) ( not ( = ?auto_618877 ?auto_618878 ) ) ( not ( = ?auto_618877 ?auto_618879 ) ) ( not ( = ?auto_618877 ?auto_618880 ) ) ( not ( = ?auto_618877 ?auto_618881 ) ) ( not ( = ?auto_618877 ?auto_618882 ) ) ( not ( = ?auto_618878 ?auto_618879 ) ) ( not ( = ?auto_618878 ?auto_618880 ) ) ( not ( = ?auto_618878 ?auto_618881 ) ) ( not ( = ?auto_618878 ?auto_618882 ) ) ( not ( = ?auto_618879 ?auto_618880 ) ) ( not ( = ?auto_618879 ?auto_618881 ) ) ( not ( = ?auto_618879 ?auto_618882 ) ) ( not ( = ?auto_618880 ?auto_618881 ) ) ( not ( = ?auto_618880 ?auto_618882 ) ) ( not ( = ?auto_618881 ?auto_618882 ) ) ( ON ?auto_618880 ?auto_618881 ) ( ON ?auto_618879 ?auto_618880 ) ( ON ?auto_618878 ?auto_618879 ) ( ON ?auto_618877 ?auto_618878 ) ( ON ?auto_618876 ?auto_618877 ) ( ON ?auto_618875 ?auto_618876 ) ( ON ?auto_618874 ?auto_618875 ) ( ON ?auto_618873 ?auto_618874 ) ( ON ?auto_618872 ?auto_618873 ) ( ON ?auto_618871 ?auto_618872 ) ( ON ?auto_618870 ?auto_618871 ) ( ON ?auto_618869 ?auto_618870 ) ( CLEAR ?auto_618867 ) ( ON ?auto_618868 ?auto_618869 ) ( CLEAR ?auto_618868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_618866 ?auto_618867 ?auto_618868 )
      ( MAKE-16PILE ?auto_618866 ?auto_618867 ?auto_618868 ?auto_618869 ?auto_618870 ?auto_618871 ?auto_618872 ?auto_618873 ?auto_618874 ?auto_618875 ?auto_618876 ?auto_618877 ?auto_618878 ?auto_618879 ?auto_618880 ?auto_618881 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618932 - BLOCK
      ?auto_618933 - BLOCK
      ?auto_618934 - BLOCK
      ?auto_618935 - BLOCK
      ?auto_618936 - BLOCK
      ?auto_618937 - BLOCK
      ?auto_618938 - BLOCK
      ?auto_618939 - BLOCK
      ?auto_618940 - BLOCK
      ?auto_618941 - BLOCK
      ?auto_618942 - BLOCK
      ?auto_618943 - BLOCK
      ?auto_618944 - BLOCK
      ?auto_618945 - BLOCK
      ?auto_618946 - BLOCK
      ?auto_618947 - BLOCK
    )
    :vars
    (
      ?auto_618948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_618947 ?auto_618948 ) ( ON-TABLE ?auto_618932 ) ( not ( = ?auto_618932 ?auto_618933 ) ) ( not ( = ?auto_618932 ?auto_618934 ) ) ( not ( = ?auto_618932 ?auto_618935 ) ) ( not ( = ?auto_618932 ?auto_618936 ) ) ( not ( = ?auto_618932 ?auto_618937 ) ) ( not ( = ?auto_618932 ?auto_618938 ) ) ( not ( = ?auto_618932 ?auto_618939 ) ) ( not ( = ?auto_618932 ?auto_618940 ) ) ( not ( = ?auto_618932 ?auto_618941 ) ) ( not ( = ?auto_618932 ?auto_618942 ) ) ( not ( = ?auto_618932 ?auto_618943 ) ) ( not ( = ?auto_618932 ?auto_618944 ) ) ( not ( = ?auto_618932 ?auto_618945 ) ) ( not ( = ?auto_618932 ?auto_618946 ) ) ( not ( = ?auto_618932 ?auto_618947 ) ) ( not ( = ?auto_618932 ?auto_618948 ) ) ( not ( = ?auto_618933 ?auto_618934 ) ) ( not ( = ?auto_618933 ?auto_618935 ) ) ( not ( = ?auto_618933 ?auto_618936 ) ) ( not ( = ?auto_618933 ?auto_618937 ) ) ( not ( = ?auto_618933 ?auto_618938 ) ) ( not ( = ?auto_618933 ?auto_618939 ) ) ( not ( = ?auto_618933 ?auto_618940 ) ) ( not ( = ?auto_618933 ?auto_618941 ) ) ( not ( = ?auto_618933 ?auto_618942 ) ) ( not ( = ?auto_618933 ?auto_618943 ) ) ( not ( = ?auto_618933 ?auto_618944 ) ) ( not ( = ?auto_618933 ?auto_618945 ) ) ( not ( = ?auto_618933 ?auto_618946 ) ) ( not ( = ?auto_618933 ?auto_618947 ) ) ( not ( = ?auto_618933 ?auto_618948 ) ) ( not ( = ?auto_618934 ?auto_618935 ) ) ( not ( = ?auto_618934 ?auto_618936 ) ) ( not ( = ?auto_618934 ?auto_618937 ) ) ( not ( = ?auto_618934 ?auto_618938 ) ) ( not ( = ?auto_618934 ?auto_618939 ) ) ( not ( = ?auto_618934 ?auto_618940 ) ) ( not ( = ?auto_618934 ?auto_618941 ) ) ( not ( = ?auto_618934 ?auto_618942 ) ) ( not ( = ?auto_618934 ?auto_618943 ) ) ( not ( = ?auto_618934 ?auto_618944 ) ) ( not ( = ?auto_618934 ?auto_618945 ) ) ( not ( = ?auto_618934 ?auto_618946 ) ) ( not ( = ?auto_618934 ?auto_618947 ) ) ( not ( = ?auto_618934 ?auto_618948 ) ) ( not ( = ?auto_618935 ?auto_618936 ) ) ( not ( = ?auto_618935 ?auto_618937 ) ) ( not ( = ?auto_618935 ?auto_618938 ) ) ( not ( = ?auto_618935 ?auto_618939 ) ) ( not ( = ?auto_618935 ?auto_618940 ) ) ( not ( = ?auto_618935 ?auto_618941 ) ) ( not ( = ?auto_618935 ?auto_618942 ) ) ( not ( = ?auto_618935 ?auto_618943 ) ) ( not ( = ?auto_618935 ?auto_618944 ) ) ( not ( = ?auto_618935 ?auto_618945 ) ) ( not ( = ?auto_618935 ?auto_618946 ) ) ( not ( = ?auto_618935 ?auto_618947 ) ) ( not ( = ?auto_618935 ?auto_618948 ) ) ( not ( = ?auto_618936 ?auto_618937 ) ) ( not ( = ?auto_618936 ?auto_618938 ) ) ( not ( = ?auto_618936 ?auto_618939 ) ) ( not ( = ?auto_618936 ?auto_618940 ) ) ( not ( = ?auto_618936 ?auto_618941 ) ) ( not ( = ?auto_618936 ?auto_618942 ) ) ( not ( = ?auto_618936 ?auto_618943 ) ) ( not ( = ?auto_618936 ?auto_618944 ) ) ( not ( = ?auto_618936 ?auto_618945 ) ) ( not ( = ?auto_618936 ?auto_618946 ) ) ( not ( = ?auto_618936 ?auto_618947 ) ) ( not ( = ?auto_618936 ?auto_618948 ) ) ( not ( = ?auto_618937 ?auto_618938 ) ) ( not ( = ?auto_618937 ?auto_618939 ) ) ( not ( = ?auto_618937 ?auto_618940 ) ) ( not ( = ?auto_618937 ?auto_618941 ) ) ( not ( = ?auto_618937 ?auto_618942 ) ) ( not ( = ?auto_618937 ?auto_618943 ) ) ( not ( = ?auto_618937 ?auto_618944 ) ) ( not ( = ?auto_618937 ?auto_618945 ) ) ( not ( = ?auto_618937 ?auto_618946 ) ) ( not ( = ?auto_618937 ?auto_618947 ) ) ( not ( = ?auto_618937 ?auto_618948 ) ) ( not ( = ?auto_618938 ?auto_618939 ) ) ( not ( = ?auto_618938 ?auto_618940 ) ) ( not ( = ?auto_618938 ?auto_618941 ) ) ( not ( = ?auto_618938 ?auto_618942 ) ) ( not ( = ?auto_618938 ?auto_618943 ) ) ( not ( = ?auto_618938 ?auto_618944 ) ) ( not ( = ?auto_618938 ?auto_618945 ) ) ( not ( = ?auto_618938 ?auto_618946 ) ) ( not ( = ?auto_618938 ?auto_618947 ) ) ( not ( = ?auto_618938 ?auto_618948 ) ) ( not ( = ?auto_618939 ?auto_618940 ) ) ( not ( = ?auto_618939 ?auto_618941 ) ) ( not ( = ?auto_618939 ?auto_618942 ) ) ( not ( = ?auto_618939 ?auto_618943 ) ) ( not ( = ?auto_618939 ?auto_618944 ) ) ( not ( = ?auto_618939 ?auto_618945 ) ) ( not ( = ?auto_618939 ?auto_618946 ) ) ( not ( = ?auto_618939 ?auto_618947 ) ) ( not ( = ?auto_618939 ?auto_618948 ) ) ( not ( = ?auto_618940 ?auto_618941 ) ) ( not ( = ?auto_618940 ?auto_618942 ) ) ( not ( = ?auto_618940 ?auto_618943 ) ) ( not ( = ?auto_618940 ?auto_618944 ) ) ( not ( = ?auto_618940 ?auto_618945 ) ) ( not ( = ?auto_618940 ?auto_618946 ) ) ( not ( = ?auto_618940 ?auto_618947 ) ) ( not ( = ?auto_618940 ?auto_618948 ) ) ( not ( = ?auto_618941 ?auto_618942 ) ) ( not ( = ?auto_618941 ?auto_618943 ) ) ( not ( = ?auto_618941 ?auto_618944 ) ) ( not ( = ?auto_618941 ?auto_618945 ) ) ( not ( = ?auto_618941 ?auto_618946 ) ) ( not ( = ?auto_618941 ?auto_618947 ) ) ( not ( = ?auto_618941 ?auto_618948 ) ) ( not ( = ?auto_618942 ?auto_618943 ) ) ( not ( = ?auto_618942 ?auto_618944 ) ) ( not ( = ?auto_618942 ?auto_618945 ) ) ( not ( = ?auto_618942 ?auto_618946 ) ) ( not ( = ?auto_618942 ?auto_618947 ) ) ( not ( = ?auto_618942 ?auto_618948 ) ) ( not ( = ?auto_618943 ?auto_618944 ) ) ( not ( = ?auto_618943 ?auto_618945 ) ) ( not ( = ?auto_618943 ?auto_618946 ) ) ( not ( = ?auto_618943 ?auto_618947 ) ) ( not ( = ?auto_618943 ?auto_618948 ) ) ( not ( = ?auto_618944 ?auto_618945 ) ) ( not ( = ?auto_618944 ?auto_618946 ) ) ( not ( = ?auto_618944 ?auto_618947 ) ) ( not ( = ?auto_618944 ?auto_618948 ) ) ( not ( = ?auto_618945 ?auto_618946 ) ) ( not ( = ?auto_618945 ?auto_618947 ) ) ( not ( = ?auto_618945 ?auto_618948 ) ) ( not ( = ?auto_618946 ?auto_618947 ) ) ( not ( = ?auto_618946 ?auto_618948 ) ) ( not ( = ?auto_618947 ?auto_618948 ) ) ( ON ?auto_618946 ?auto_618947 ) ( ON ?auto_618945 ?auto_618946 ) ( ON ?auto_618944 ?auto_618945 ) ( ON ?auto_618943 ?auto_618944 ) ( ON ?auto_618942 ?auto_618943 ) ( ON ?auto_618941 ?auto_618942 ) ( ON ?auto_618940 ?auto_618941 ) ( ON ?auto_618939 ?auto_618940 ) ( ON ?auto_618938 ?auto_618939 ) ( ON ?auto_618937 ?auto_618938 ) ( ON ?auto_618936 ?auto_618937 ) ( ON ?auto_618935 ?auto_618936 ) ( ON ?auto_618934 ?auto_618935 ) ( CLEAR ?auto_618932 ) ( ON ?auto_618933 ?auto_618934 ) ( CLEAR ?auto_618933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_618932 ?auto_618933 )
      ( MAKE-16PILE ?auto_618932 ?auto_618933 ?auto_618934 ?auto_618935 ?auto_618936 ?auto_618937 ?auto_618938 ?auto_618939 ?auto_618940 ?auto_618941 ?auto_618942 ?auto_618943 ?auto_618944 ?auto_618945 ?auto_618946 ?auto_618947 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_618998 - BLOCK
      ?auto_618999 - BLOCK
      ?auto_619000 - BLOCK
      ?auto_619001 - BLOCK
      ?auto_619002 - BLOCK
      ?auto_619003 - BLOCK
      ?auto_619004 - BLOCK
      ?auto_619005 - BLOCK
      ?auto_619006 - BLOCK
      ?auto_619007 - BLOCK
      ?auto_619008 - BLOCK
      ?auto_619009 - BLOCK
      ?auto_619010 - BLOCK
      ?auto_619011 - BLOCK
      ?auto_619012 - BLOCK
      ?auto_619013 - BLOCK
    )
    :vars
    (
      ?auto_619014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619013 ?auto_619014 ) ( not ( = ?auto_618998 ?auto_618999 ) ) ( not ( = ?auto_618998 ?auto_619000 ) ) ( not ( = ?auto_618998 ?auto_619001 ) ) ( not ( = ?auto_618998 ?auto_619002 ) ) ( not ( = ?auto_618998 ?auto_619003 ) ) ( not ( = ?auto_618998 ?auto_619004 ) ) ( not ( = ?auto_618998 ?auto_619005 ) ) ( not ( = ?auto_618998 ?auto_619006 ) ) ( not ( = ?auto_618998 ?auto_619007 ) ) ( not ( = ?auto_618998 ?auto_619008 ) ) ( not ( = ?auto_618998 ?auto_619009 ) ) ( not ( = ?auto_618998 ?auto_619010 ) ) ( not ( = ?auto_618998 ?auto_619011 ) ) ( not ( = ?auto_618998 ?auto_619012 ) ) ( not ( = ?auto_618998 ?auto_619013 ) ) ( not ( = ?auto_618998 ?auto_619014 ) ) ( not ( = ?auto_618999 ?auto_619000 ) ) ( not ( = ?auto_618999 ?auto_619001 ) ) ( not ( = ?auto_618999 ?auto_619002 ) ) ( not ( = ?auto_618999 ?auto_619003 ) ) ( not ( = ?auto_618999 ?auto_619004 ) ) ( not ( = ?auto_618999 ?auto_619005 ) ) ( not ( = ?auto_618999 ?auto_619006 ) ) ( not ( = ?auto_618999 ?auto_619007 ) ) ( not ( = ?auto_618999 ?auto_619008 ) ) ( not ( = ?auto_618999 ?auto_619009 ) ) ( not ( = ?auto_618999 ?auto_619010 ) ) ( not ( = ?auto_618999 ?auto_619011 ) ) ( not ( = ?auto_618999 ?auto_619012 ) ) ( not ( = ?auto_618999 ?auto_619013 ) ) ( not ( = ?auto_618999 ?auto_619014 ) ) ( not ( = ?auto_619000 ?auto_619001 ) ) ( not ( = ?auto_619000 ?auto_619002 ) ) ( not ( = ?auto_619000 ?auto_619003 ) ) ( not ( = ?auto_619000 ?auto_619004 ) ) ( not ( = ?auto_619000 ?auto_619005 ) ) ( not ( = ?auto_619000 ?auto_619006 ) ) ( not ( = ?auto_619000 ?auto_619007 ) ) ( not ( = ?auto_619000 ?auto_619008 ) ) ( not ( = ?auto_619000 ?auto_619009 ) ) ( not ( = ?auto_619000 ?auto_619010 ) ) ( not ( = ?auto_619000 ?auto_619011 ) ) ( not ( = ?auto_619000 ?auto_619012 ) ) ( not ( = ?auto_619000 ?auto_619013 ) ) ( not ( = ?auto_619000 ?auto_619014 ) ) ( not ( = ?auto_619001 ?auto_619002 ) ) ( not ( = ?auto_619001 ?auto_619003 ) ) ( not ( = ?auto_619001 ?auto_619004 ) ) ( not ( = ?auto_619001 ?auto_619005 ) ) ( not ( = ?auto_619001 ?auto_619006 ) ) ( not ( = ?auto_619001 ?auto_619007 ) ) ( not ( = ?auto_619001 ?auto_619008 ) ) ( not ( = ?auto_619001 ?auto_619009 ) ) ( not ( = ?auto_619001 ?auto_619010 ) ) ( not ( = ?auto_619001 ?auto_619011 ) ) ( not ( = ?auto_619001 ?auto_619012 ) ) ( not ( = ?auto_619001 ?auto_619013 ) ) ( not ( = ?auto_619001 ?auto_619014 ) ) ( not ( = ?auto_619002 ?auto_619003 ) ) ( not ( = ?auto_619002 ?auto_619004 ) ) ( not ( = ?auto_619002 ?auto_619005 ) ) ( not ( = ?auto_619002 ?auto_619006 ) ) ( not ( = ?auto_619002 ?auto_619007 ) ) ( not ( = ?auto_619002 ?auto_619008 ) ) ( not ( = ?auto_619002 ?auto_619009 ) ) ( not ( = ?auto_619002 ?auto_619010 ) ) ( not ( = ?auto_619002 ?auto_619011 ) ) ( not ( = ?auto_619002 ?auto_619012 ) ) ( not ( = ?auto_619002 ?auto_619013 ) ) ( not ( = ?auto_619002 ?auto_619014 ) ) ( not ( = ?auto_619003 ?auto_619004 ) ) ( not ( = ?auto_619003 ?auto_619005 ) ) ( not ( = ?auto_619003 ?auto_619006 ) ) ( not ( = ?auto_619003 ?auto_619007 ) ) ( not ( = ?auto_619003 ?auto_619008 ) ) ( not ( = ?auto_619003 ?auto_619009 ) ) ( not ( = ?auto_619003 ?auto_619010 ) ) ( not ( = ?auto_619003 ?auto_619011 ) ) ( not ( = ?auto_619003 ?auto_619012 ) ) ( not ( = ?auto_619003 ?auto_619013 ) ) ( not ( = ?auto_619003 ?auto_619014 ) ) ( not ( = ?auto_619004 ?auto_619005 ) ) ( not ( = ?auto_619004 ?auto_619006 ) ) ( not ( = ?auto_619004 ?auto_619007 ) ) ( not ( = ?auto_619004 ?auto_619008 ) ) ( not ( = ?auto_619004 ?auto_619009 ) ) ( not ( = ?auto_619004 ?auto_619010 ) ) ( not ( = ?auto_619004 ?auto_619011 ) ) ( not ( = ?auto_619004 ?auto_619012 ) ) ( not ( = ?auto_619004 ?auto_619013 ) ) ( not ( = ?auto_619004 ?auto_619014 ) ) ( not ( = ?auto_619005 ?auto_619006 ) ) ( not ( = ?auto_619005 ?auto_619007 ) ) ( not ( = ?auto_619005 ?auto_619008 ) ) ( not ( = ?auto_619005 ?auto_619009 ) ) ( not ( = ?auto_619005 ?auto_619010 ) ) ( not ( = ?auto_619005 ?auto_619011 ) ) ( not ( = ?auto_619005 ?auto_619012 ) ) ( not ( = ?auto_619005 ?auto_619013 ) ) ( not ( = ?auto_619005 ?auto_619014 ) ) ( not ( = ?auto_619006 ?auto_619007 ) ) ( not ( = ?auto_619006 ?auto_619008 ) ) ( not ( = ?auto_619006 ?auto_619009 ) ) ( not ( = ?auto_619006 ?auto_619010 ) ) ( not ( = ?auto_619006 ?auto_619011 ) ) ( not ( = ?auto_619006 ?auto_619012 ) ) ( not ( = ?auto_619006 ?auto_619013 ) ) ( not ( = ?auto_619006 ?auto_619014 ) ) ( not ( = ?auto_619007 ?auto_619008 ) ) ( not ( = ?auto_619007 ?auto_619009 ) ) ( not ( = ?auto_619007 ?auto_619010 ) ) ( not ( = ?auto_619007 ?auto_619011 ) ) ( not ( = ?auto_619007 ?auto_619012 ) ) ( not ( = ?auto_619007 ?auto_619013 ) ) ( not ( = ?auto_619007 ?auto_619014 ) ) ( not ( = ?auto_619008 ?auto_619009 ) ) ( not ( = ?auto_619008 ?auto_619010 ) ) ( not ( = ?auto_619008 ?auto_619011 ) ) ( not ( = ?auto_619008 ?auto_619012 ) ) ( not ( = ?auto_619008 ?auto_619013 ) ) ( not ( = ?auto_619008 ?auto_619014 ) ) ( not ( = ?auto_619009 ?auto_619010 ) ) ( not ( = ?auto_619009 ?auto_619011 ) ) ( not ( = ?auto_619009 ?auto_619012 ) ) ( not ( = ?auto_619009 ?auto_619013 ) ) ( not ( = ?auto_619009 ?auto_619014 ) ) ( not ( = ?auto_619010 ?auto_619011 ) ) ( not ( = ?auto_619010 ?auto_619012 ) ) ( not ( = ?auto_619010 ?auto_619013 ) ) ( not ( = ?auto_619010 ?auto_619014 ) ) ( not ( = ?auto_619011 ?auto_619012 ) ) ( not ( = ?auto_619011 ?auto_619013 ) ) ( not ( = ?auto_619011 ?auto_619014 ) ) ( not ( = ?auto_619012 ?auto_619013 ) ) ( not ( = ?auto_619012 ?auto_619014 ) ) ( not ( = ?auto_619013 ?auto_619014 ) ) ( ON ?auto_619012 ?auto_619013 ) ( ON ?auto_619011 ?auto_619012 ) ( ON ?auto_619010 ?auto_619011 ) ( ON ?auto_619009 ?auto_619010 ) ( ON ?auto_619008 ?auto_619009 ) ( ON ?auto_619007 ?auto_619008 ) ( ON ?auto_619006 ?auto_619007 ) ( ON ?auto_619005 ?auto_619006 ) ( ON ?auto_619004 ?auto_619005 ) ( ON ?auto_619003 ?auto_619004 ) ( ON ?auto_619002 ?auto_619003 ) ( ON ?auto_619001 ?auto_619002 ) ( ON ?auto_619000 ?auto_619001 ) ( ON ?auto_618999 ?auto_619000 ) ( ON ?auto_618998 ?auto_618999 ) ( CLEAR ?auto_618998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_618998 )
      ( MAKE-16PILE ?auto_618998 ?auto_618999 ?auto_619000 ?auto_619001 ?auto_619002 ?auto_619003 ?auto_619004 ?auto_619005 ?auto_619006 ?auto_619007 ?auto_619008 ?auto_619009 ?auto_619010 ?auto_619011 ?auto_619012 ?auto_619013 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619065 - BLOCK
      ?auto_619066 - BLOCK
      ?auto_619067 - BLOCK
      ?auto_619068 - BLOCK
      ?auto_619069 - BLOCK
      ?auto_619070 - BLOCK
      ?auto_619071 - BLOCK
      ?auto_619072 - BLOCK
      ?auto_619073 - BLOCK
      ?auto_619074 - BLOCK
      ?auto_619075 - BLOCK
      ?auto_619076 - BLOCK
      ?auto_619077 - BLOCK
      ?auto_619078 - BLOCK
      ?auto_619079 - BLOCK
      ?auto_619080 - BLOCK
      ?auto_619081 - BLOCK
    )
    :vars
    (
      ?auto_619082 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_619080 ) ( ON ?auto_619081 ?auto_619082 ) ( CLEAR ?auto_619081 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_619065 ) ( ON ?auto_619066 ?auto_619065 ) ( ON ?auto_619067 ?auto_619066 ) ( ON ?auto_619068 ?auto_619067 ) ( ON ?auto_619069 ?auto_619068 ) ( ON ?auto_619070 ?auto_619069 ) ( ON ?auto_619071 ?auto_619070 ) ( ON ?auto_619072 ?auto_619071 ) ( ON ?auto_619073 ?auto_619072 ) ( ON ?auto_619074 ?auto_619073 ) ( ON ?auto_619075 ?auto_619074 ) ( ON ?auto_619076 ?auto_619075 ) ( ON ?auto_619077 ?auto_619076 ) ( ON ?auto_619078 ?auto_619077 ) ( ON ?auto_619079 ?auto_619078 ) ( ON ?auto_619080 ?auto_619079 ) ( not ( = ?auto_619065 ?auto_619066 ) ) ( not ( = ?auto_619065 ?auto_619067 ) ) ( not ( = ?auto_619065 ?auto_619068 ) ) ( not ( = ?auto_619065 ?auto_619069 ) ) ( not ( = ?auto_619065 ?auto_619070 ) ) ( not ( = ?auto_619065 ?auto_619071 ) ) ( not ( = ?auto_619065 ?auto_619072 ) ) ( not ( = ?auto_619065 ?auto_619073 ) ) ( not ( = ?auto_619065 ?auto_619074 ) ) ( not ( = ?auto_619065 ?auto_619075 ) ) ( not ( = ?auto_619065 ?auto_619076 ) ) ( not ( = ?auto_619065 ?auto_619077 ) ) ( not ( = ?auto_619065 ?auto_619078 ) ) ( not ( = ?auto_619065 ?auto_619079 ) ) ( not ( = ?auto_619065 ?auto_619080 ) ) ( not ( = ?auto_619065 ?auto_619081 ) ) ( not ( = ?auto_619065 ?auto_619082 ) ) ( not ( = ?auto_619066 ?auto_619067 ) ) ( not ( = ?auto_619066 ?auto_619068 ) ) ( not ( = ?auto_619066 ?auto_619069 ) ) ( not ( = ?auto_619066 ?auto_619070 ) ) ( not ( = ?auto_619066 ?auto_619071 ) ) ( not ( = ?auto_619066 ?auto_619072 ) ) ( not ( = ?auto_619066 ?auto_619073 ) ) ( not ( = ?auto_619066 ?auto_619074 ) ) ( not ( = ?auto_619066 ?auto_619075 ) ) ( not ( = ?auto_619066 ?auto_619076 ) ) ( not ( = ?auto_619066 ?auto_619077 ) ) ( not ( = ?auto_619066 ?auto_619078 ) ) ( not ( = ?auto_619066 ?auto_619079 ) ) ( not ( = ?auto_619066 ?auto_619080 ) ) ( not ( = ?auto_619066 ?auto_619081 ) ) ( not ( = ?auto_619066 ?auto_619082 ) ) ( not ( = ?auto_619067 ?auto_619068 ) ) ( not ( = ?auto_619067 ?auto_619069 ) ) ( not ( = ?auto_619067 ?auto_619070 ) ) ( not ( = ?auto_619067 ?auto_619071 ) ) ( not ( = ?auto_619067 ?auto_619072 ) ) ( not ( = ?auto_619067 ?auto_619073 ) ) ( not ( = ?auto_619067 ?auto_619074 ) ) ( not ( = ?auto_619067 ?auto_619075 ) ) ( not ( = ?auto_619067 ?auto_619076 ) ) ( not ( = ?auto_619067 ?auto_619077 ) ) ( not ( = ?auto_619067 ?auto_619078 ) ) ( not ( = ?auto_619067 ?auto_619079 ) ) ( not ( = ?auto_619067 ?auto_619080 ) ) ( not ( = ?auto_619067 ?auto_619081 ) ) ( not ( = ?auto_619067 ?auto_619082 ) ) ( not ( = ?auto_619068 ?auto_619069 ) ) ( not ( = ?auto_619068 ?auto_619070 ) ) ( not ( = ?auto_619068 ?auto_619071 ) ) ( not ( = ?auto_619068 ?auto_619072 ) ) ( not ( = ?auto_619068 ?auto_619073 ) ) ( not ( = ?auto_619068 ?auto_619074 ) ) ( not ( = ?auto_619068 ?auto_619075 ) ) ( not ( = ?auto_619068 ?auto_619076 ) ) ( not ( = ?auto_619068 ?auto_619077 ) ) ( not ( = ?auto_619068 ?auto_619078 ) ) ( not ( = ?auto_619068 ?auto_619079 ) ) ( not ( = ?auto_619068 ?auto_619080 ) ) ( not ( = ?auto_619068 ?auto_619081 ) ) ( not ( = ?auto_619068 ?auto_619082 ) ) ( not ( = ?auto_619069 ?auto_619070 ) ) ( not ( = ?auto_619069 ?auto_619071 ) ) ( not ( = ?auto_619069 ?auto_619072 ) ) ( not ( = ?auto_619069 ?auto_619073 ) ) ( not ( = ?auto_619069 ?auto_619074 ) ) ( not ( = ?auto_619069 ?auto_619075 ) ) ( not ( = ?auto_619069 ?auto_619076 ) ) ( not ( = ?auto_619069 ?auto_619077 ) ) ( not ( = ?auto_619069 ?auto_619078 ) ) ( not ( = ?auto_619069 ?auto_619079 ) ) ( not ( = ?auto_619069 ?auto_619080 ) ) ( not ( = ?auto_619069 ?auto_619081 ) ) ( not ( = ?auto_619069 ?auto_619082 ) ) ( not ( = ?auto_619070 ?auto_619071 ) ) ( not ( = ?auto_619070 ?auto_619072 ) ) ( not ( = ?auto_619070 ?auto_619073 ) ) ( not ( = ?auto_619070 ?auto_619074 ) ) ( not ( = ?auto_619070 ?auto_619075 ) ) ( not ( = ?auto_619070 ?auto_619076 ) ) ( not ( = ?auto_619070 ?auto_619077 ) ) ( not ( = ?auto_619070 ?auto_619078 ) ) ( not ( = ?auto_619070 ?auto_619079 ) ) ( not ( = ?auto_619070 ?auto_619080 ) ) ( not ( = ?auto_619070 ?auto_619081 ) ) ( not ( = ?auto_619070 ?auto_619082 ) ) ( not ( = ?auto_619071 ?auto_619072 ) ) ( not ( = ?auto_619071 ?auto_619073 ) ) ( not ( = ?auto_619071 ?auto_619074 ) ) ( not ( = ?auto_619071 ?auto_619075 ) ) ( not ( = ?auto_619071 ?auto_619076 ) ) ( not ( = ?auto_619071 ?auto_619077 ) ) ( not ( = ?auto_619071 ?auto_619078 ) ) ( not ( = ?auto_619071 ?auto_619079 ) ) ( not ( = ?auto_619071 ?auto_619080 ) ) ( not ( = ?auto_619071 ?auto_619081 ) ) ( not ( = ?auto_619071 ?auto_619082 ) ) ( not ( = ?auto_619072 ?auto_619073 ) ) ( not ( = ?auto_619072 ?auto_619074 ) ) ( not ( = ?auto_619072 ?auto_619075 ) ) ( not ( = ?auto_619072 ?auto_619076 ) ) ( not ( = ?auto_619072 ?auto_619077 ) ) ( not ( = ?auto_619072 ?auto_619078 ) ) ( not ( = ?auto_619072 ?auto_619079 ) ) ( not ( = ?auto_619072 ?auto_619080 ) ) ( not ( = ?auto_619072 ?auto_619081 ) ) ( not ( = ?auto_619072 ?auto_619082 ) ) ( not ( = ?auto_619073 ?auto_619074 ) ) ( not ( = ?auto_619073 ?auto_619075 ) ) ( not ( = ?auto_619073 ?auto_619076 ) ) ( not ( = ?auto_619073 ?auto_619077 ) ) ( not ( = ?auto_619073 ?auto_619078 ) ) ( not ( = ?auto_619073 ?auto_619079 ) ) ( not ( = ?auto_619073 ?auto_619080 ) ) ( not ( = ?auto_619073 ?auto_619081 ) ) ( not ( = ?auto_619073 ?auto_619082 ) ) ( not ( = ?auto_619074 ?auto_619075 ) ) ( not ( = ?auto_619074 ?auto_619076 ) ) ( not ( = ?auto_619074 ?auto_619077 ) ) ( not ( = ?auto_619074 ?auto_619078 ) ) ( not ( = ?auto_619074 ?auto_619079 ) ) ( not ( = ?auto_619074 ?auto_619080 ) ) ( not ( = ?auto_619074 ?auto_619081 ) ) ( not ( = ?auto_619074 ?auto_619082 ) ) ( not ( = ?auto_619075 ?auto_619076 ) ) ( not ( = ?auto_619075 ?auto_619077 ) ) ( not ( = ?auto_619075 ?auto_619078 ) ) ( not ( = ?auto_619075 ?auto_619079 ) ) ( not ( = ?auto_619075 ?auto_619080 ) ) ( not ( = ?auto_619075 ?auto_619081 ) ) ( not ( = ?auto_619075 ?auto_619082 ) ) ( not ( = ?auto_619076 ?auto_619077 ) ) ( not ( = ?auto_619076 ?auto_619078 ) ) ( not ( = ?auto_619076 ?auto_619079 ) ) ( not ( = ?auto_619076 ?auto_619080 ) ) ( not ( = ?auto_619076 ?auto_619081 ) ) ( not ( = ?auto_619076 ?auto_619082 ) ) ( not ( = ?auto_619077 ?auto_619078 ) ) ( not ( = ?auto_619077 ?auto_619079 ) ) ( not ( = ?auto_619077 ?auto_619080 ) ) ( not ( = ?auto_619077 ?auto_619081 ) ) ( not ( = ?auto_619077 ?auto_619082 ) ) ( not ( = ?auto_619078 ?auto_619079 ) ) ( not ( = ?auto_619078 ?auto_619080 ) ) ( not ( = ?auto_619078 ?auto_619081 ) ) ( not ( = ?auto_619078 ?auto_619082 ) ) ( not ( = ?auto_619079 ?auto_619080 ) ) ( not ( = ?auto_619079 ?auto_619081 ) ) ( not ( = ?auto_619079 ?auto_619082 ) ) ( not ( = ?auto_619080 ?auto_619081 ) ) ( not ( = ?auto_619080 ?auto_619082 ) ) ( not ( = ?auto_619081 ?auto_619082 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_619081 ?auto_619082 )
      ( !STACK ?auto_619081 ?auto_619080 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619100 - BLOCK
      ?auto_619101 - BLOCK
      ?auto_619102 - BLOCK
      ?auto_619103 - BLOCK
      ?auto_619104 - BLOCK
      ?auto_619105 - BLOCK
      ?auto_619106 - BLOCK
      ?auto_619107 - BLOCK
      ?auto_619108 - BLOCK
      ?auto_619109 - BLOCK
      ?auto_619110 - BLOCK
      ?auto_619111 - BLOCK
      ?auto_619112 - BLOCK
      ?auto_619113 - BLOCK
      ?auto_619114 - BLOCK
      ?auto_619115 - BLOCK
      ?auto_619116 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_619115 ) ( ON-TABLE ?auto_619116 ) ( CLEAR ?auto_619116 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_619100 ) ( ON ?auto_619101 ?auto_619100 ) ( ON ?auto_619102 ?auto_619101 ) ( ON ?auto_619103 ?auto_619102 ) ( ON ?auto_619104 ?auto_619103 ) ( ON ?auto_619105 ?auto_619104 ) ( ON ?auto_619106 ?auto_619105 ) ( ON ?auto_619107 ?auto_619106 ) ( ON ?auto_619108 ?auto_619107 ) ( ON ?auto_619109 ?auto_619108 ) ( ON ?auto_619110 ?auto_619109 ) ( ON ?auto_619111 ?auto_619110 ) ( ON ?auto_619112 ?auto_619111 ) ( ON ?auto_619113 ?auto_619112 ) ( ON ?auto_619114 ?auto_619113 ) ( ON ?auto_619115 ?auto_619114 ) ( not ( = ?auto_619100 ?auto_619101 ) ) ( not ( = ?auto_619100 ?auto_619102 ) ) ( not ( = ?auto_619100 ?auto_619103 ) ) ( not ( = ?auto_619100 ?auto_619104 ) ) ( not ( = ?auto_619100 ?auto_619105 ) ) ( not ( = ?auto_619100 ?auto_619106 ) ) ( not ( = ?auto_619100 ?auto_619107 ) ) ( not ( = ?auto_619100 ?auto_619108 ) ) ( not ( = ?auto_619100 ?auto_619109 ) ) ( not ( = ?auto_619100 ?auto_619110 ) ) ( not ( = ?auto_619100 ?auto_619111 ) ) ( not ( = ?auto_619100 ?auto_619112 ) ) ( not ( = ?auto_619100 ?auto_619113 ) ) ( not ( = ?auto_619100 ?auto_619114 ) ) ( not ( = ?auto_619100 ?auto_619115 ) ) ( not ( = ?auto_619100 ?auto_619116 ) ) ( not ( = ?auto_619101 ?auto_619102 ) ) ( not ( = ?auto_619101 ?auto_619103 ) ) ( not ( = ?auto_619101 ?auto_619104 ) ) ( not ( = ?auto_619101 ?auto_619105 ) ) ( not ( = ?auto_619101 ?auto_619106 ) ) ( not ( = ?auto_619101 ?auto_619107 ) ) ( not ( = ?auto_619101 ?auto_619108 ) ) ( not ( = ?auto_619101 ?auto_619109 ) ) ( not ( = ?auto_619101 ?auto_619110 ) ) ( not ( = ?auto_619101 ?auto_619111 ) ) ( not ( = ?auto_619101 ?auto_619112 ) ) ( not ( = ?auto_619101 ?auto_619113 ) ) ( not ( = ?auto_619101 ?auto_619114 ) ) ( not ( = ?auto_619101 ?auto_619115 ) ) ( not ( = ?auto_619101 ?auto_619116 ) ) ( not ( = ?auto_619102 ?auto_619103 ) ) ( not ( = ?auto_619102 ?auto_619104 ) ) ( not ( = ?auto_619102 ?auto_619105 ) ) ( not ( = ?auto_619102 ?auto_619106 ) ) ( not ( = ?auto_619102 ?auto_619107 ) ) ( not ( = ?auto_619102 ?auto_619108 ) ) ( not ( = ?auto_619102 ?auto_619109 ) ) ( not ( = ?auto_619102 ?auto_619110 ) ) ( not ( = ?auto_619102 ?auto_619111 ) ) ( not ( = ?auto_619102 ?auto_619112 ) ) ( not ( = ?auto_619102 ?auto_619113 ) ) ( not ( = ?auto_619102 ?auto_619114 ) ) ( not ( = ?auto_619102 ?auto_619115 ) ) ( not ( = ?auto_619102 ?auto_619116 ) ) ( not ( = ?auto_619103 ?auto_619104 ) ) ( not ( = ?auto_619103 ?auto_619105 ) ) ( not ( = ?auto_619103 ?auto_619106 ) ) ( not ( = ?auto_619103 ?auto_619107 ) ) ( not ( = ?auto_619103 ?auto_619108 ) ) ( not ( = ?auto_619103 ?auto_619109 ) ) ( not ( = ?auto_619103 ?auto_619110 ) ) ( not ( = ?auto_619103 ?auto_619111 ) ) ( not ( = ?auto_619103 ?auto_619112 ) ) ( not ( = ?auto_619103 ?auto_619113 ) ) ( not ( = ?auto_619103 ?auto_619114 ) ) ( not ( = ?auto_619103 ?auto_619115 ) ) ( not ( = ?auto_619103 ?auto_619116 ) ) ( not ( = ?auto_619104 ?auto_619105 ) ) ( not ( = ?auto_619104 ?auto_619106 ) ) ( not ( = ?auto_619104 ?auto_619107 ) ) ( not ( = ?auto_619104 ?auto_619108 ) ) ( not ( = ?auto_619104 ?auto_619109 ) ) ( not ( = ?auto_619104 ?auto_619110 ) ) ( not ( = ?auto_619104 ?auto_619111 ) ) ( not ( = ?auto_619104 ?auto_619112 ) ) ( not ( = ?auto_619104 ?auto_619113 ) ) ( not ( = ?auto_619104 ?auto_619114 ) ) ( not ( = ?auto_619104 ?auto_619115 ) ) ( not ( = ?auto_619104 ?auto_619116 ) ) ( not ( = ?auto_619105 ?auto_619106 ) ) ( not ( = ?auto_619105 ?auto_619107 ) ) ( not ( = ?auto_619105 ?auto_619108 ) ) ( not ( = ?auto_619105 ?auto_619109 ) ) ( not ( = ?auto_619105 ?auto_619110 ) ) ( not ( = ?auto_619105 ?auto_619111 ) ) ( not ( = ?auto_619105 ?auto_619112 ) ) ( not ( = ?auto_619105 ?auto_619113 ) ) ( not ( = ?auto_619105 ?auto_619114 ) ) ( not ( = ?auto_619105 ?auto_619115 ) ) ( not ( = ?auto_619105 ?auto_619116 ) ) ( not ( = ?auto_619106 ?auto_619107 ) ) ( not ( = ?auto_619106 ?auto_619108 ) ) ( not ( = ?auto_619106 ?auto_619109 ) ) ( not ( = ?auto_619106 ?auto_619110 ) ) ( not ( = ?auto_619106 ?auto_619111 ) ) ( not ( = ?auto_619106 ?auto_619112 ) ) ( not ( = ?auto_619106 ?auto_619113 ) ) ( not ( = ?auto_619106 ?auto_619114 ) ) ( not ( = ?auto_619106 ?auto_619115 ) ) ( not ( = ?auto_619106 ?auto_619116 ) ) ( not ( = ?auto_619107 ?auto_619108 ) ) ( not ( = ?auto_619107 ?auto_619109 ) ) ( not ( = ?auto_619107 ?auto_619110 ) ) ( not ( = ?auto_619107 ?auto_619111 ) ) ( not ( = ?auto_619107 ?auto_619112 ) ) ( not ( = ?auto_619107 ?auto_619113 ) ) ( not ( = ?auto_619107 ?auto_619114 ) ) ( not ( = ?auto_619107 ?auto_619115 ) ) ( not ( = ?auto_619107 ?auto_619116 ) ) ( not ( = ?auto_619108 ?auto_619109 ) ) ( not ( = ?auto_619108 ?auto_619110 ) ) ( not ( = ?auto_619108 ?auto_619111 ) ) ( not ( = ?auto_619108 ?auto_619112 ) ) ( not ( = ?auto_619108 ?auto_619113 ) ) ( not ( = ?auto_619108 ?auto_619114 ) ) ( not ( = ?auto_619108 ?auto_619115 ) ) ( not ( = ?auto_619108 ?auto_619116 ) ) ( not ( = ?auto_619109 ?auto_619110 ) ) ( not ( = ?auto_619109 ?auto_619111 ) ) ( not ( = ?auto_619109 ?auto_619112 ) ) ( not ( = ?auto_619109 ?auto_619113 ) ) ( not ( = ?auto_619109 ?auto_619114 ) ) ( not ( = ?auto_619109 ?auto_619115 ) ) ( not ( = ?auto_619109 ?auto_619116 ) ) ( not ( = ?auto_619110 ?auto_619111 ) ) ( not ( = ?auto_619110 ?auto_619112 ) ) ( not ( = ?auto_619110 ?auto_619113 ) ) ( not ( = ?auto_619110 ?auto_619114 ) ) ( not ( = ?auto_619110 ?auto_619115 ) ) ( not ( = ?auto_619110 ?auto_619116 ) ) ( not ( = ?auto_619111 ?auto_619112 ) ) ( not ( = ?auto_619111 ?auto_619113 ) ) ( not ( = ?auto_619111 ?auto_619114 ) ) ( not ( = ?auto_619111 ?auto_619115 ) ) ( not ( = ?auto_619111 ?auto_619116 ) ) ( not ( = ?auto_619112 ?auto_619113 ) ) ( not ( = ?auto_619112 ?auto_619114 ) ) ( not ( = ?auto_619112 ?auto_619115 ) ) ( not ( = ?auto_619112 ?auto_619116 ) ) ( not ( = ?auto_619113 ?auto_619114 ) ) ( not ( = ?auto_619113 ?auto_619115 ) ) ( not ( = ?auto_619113 ?auto_619116 ) ) ( not ( = ?auto_619114 ?auto_619115 ) ) ( not ( = ?auto_619114 ?auto_619116 ) ) ( not ( = ?auto_619115 ?auto_619116 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_619116 )
      ( !STACK ?auto_619116 ?auto_619115 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619134 - BLOCK
      ?auto_619135 - BLOCK
      ?auto_619136 - BLOCK
      ?auto_619137 - BLOCK
      ?auto_619138 - BLOCK
      ?auto_619139 - BLOCK
      ?auto_619140 - BLOCK
      ?auto_619141 - BLOCK
      ?auto_619142 - BLOCK
      ?auto_619143 - BLOCK
      ?auto_619144 - BLOCK
      ?auto_619145 - BLOCK
      ?auto_619146 - BLOCK
      ?auto_619147 - BLOCK
      ?auto_619148 - BLOCK
      ?auto_619149 - BLOCK
      ?auto_619150 - BLOCK
    )
    :vars
    (
      ?auto_619151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619150 ?auto_619151 ) ( ON-TABLE ?auto_619134 ) ( ON ?auto_619135 ?auto_619134 ) ( ON ?auto_619136 ?auto_619135 ) ( ON ?auto_619137 ?auto_619136 ) ( ON ?auto_619138 ?auto_619137 ) ( ON ?auto_619139 ?auto_619138 ) ( ON ?auto_619140 ?auto_619139 ) ( ON ?auto_619141 ?auto_619140 ) ( ON ?auto_619142 ?auto_619141 ) ( ON ?auto_619143 ?auto_619142 ) ( ON ?auto_619144 ?auto_619143 ) ( ON ?auto_619145 ?auto_619144 ) ( ON ?auto_619146 ?auto_619145 ) ( ON ?auto_619147 ?auto_619146 ) ( ON ?auto_619148 ?auto_619147 ) ( not ( = ?auto_619134 ?auto_619135 ) ) ( not ( = ?auto_619134 ?auto_619136 ) ) ( not ( = ?auto_619134 ?auto_619137 ) ) ( not ( = ?auto_619134 ?auto_619138 ) ) ( not ( = ?auto_619134 ?auto_619139 ) ) ( not ( = ?auto_619134 ?auto_619140 ) ) ( not ( = ?auto_619134 ?auto_619141 ) ) ( not ( = ?auto_619134 ?auto_619142 ) ) ( not ( = ?auto_619134 ?auto_619143 ) ) ( not ( = ?auto_619134 ?auto_619144 ) ) ( not ( = ?auto_619134 ?auto_619145 ) ) ( not ( = ?auto_619134 ?auto_619146 ) ) ( not ( = ?auto_619134 ?auto_619147 ) ) ( not ( = ?auto_619134 ?auto_619148 ) ) ( not ( = ?auto_619134 ?auto_619149 ) ) ( not ( = ?auto_619134 ?auto_619150 ) ) ( not ( = ?auto_619134 ?auto_619151 ) ) ( not ( = ?auto_619135 ?auto_619136 ) ) ( not ( = ?auto_619135 ?auto_619137 ) ) ( not ( = ?auto_619135 ?auto_619138 ) ) ( not ( = ?auto_619135 ?auto_619139 ) ) ( not ( = ?auto_619135 ?auto_619140 ) ) ( not ( = ?auto_619135 ?auto_619141 ) ) ( not ( = ?auto_619135 ?auto_619142 ) ) ( not ( = ?auto_619135 ?auto_619143 ) ) ( not ( = ?auto_619135 ?auto_619144 ) ) ( not ( = ?auto_619135 ?auto_619145 ) ) ( not ( = ?auto_619135 ?auto_619146 ) ) ( not ( = ?auto_619135 ?auto_619147 ) ) ( not ( = ?auto_619135 ?auto_619148 ) ) ( not ( = ?auto_619135 ?auto_619149 ) ) ( not ( = ?auto_619135 ?auto_619150 ) ) ( not ( = ?auto_619135 ?auto_619151 ) ) ( not ( = ?auto_619136 ?auto_619137 ) ) ( not ( = ?auto_619136 ?auto_619138 ) ) ( not ( = ?auto_619136 ?auto_619139 ) ) ( not ( = ?auto_619136 ?auto_619140 ) ) ( not ( = ?auto_619136 ?auto_619141 ) ) ( not ( = ?auto_619136 ?auto_619142 ) ) ( not ( = ?auto_619136 ?auto_619143 ) ) ( not ( = ?auto_619136 ?auto_619144 ) ) ( not ( = ?auto_619136 ?auto_619145 ) ) ( not ( = ?auto_619136 ?auto_619146 ) ) ( not ( = ?auto_619136 ?auto_619147 ) ) ( not ( = ?auto_619136 ?auto_619148 ) ) ( not ( = ?auto_619136 ?auto_619149 ) ) ( not ( = ?auto_619136 ?auto_619150 ) ) ( not ( = ?auto_619136 ?auto_619151 ) ) ( not ( = ?auto_619137 ?auto_619138 ) ) ( not ( = ?auto_619137 ?auto_619139 ) ) ( not ( = ?auto_619137 ?auto_619140 ) ) ( not ( = ?auto_619137 ?auto_619141 ) ) ( not ( = ?auto_619137 ?auto_619142 ) ) ( not ( = ?auto_619137 ?auto_619143 ) ) ( not ( = ?auto_619137 ?auto_619144 ) ) ( not ( = ?auto_619137 ?auto_619145 ) ) ( not ( = ?auto_619137 ?auto_619146 ) ) ( not ( = ?auto_619137 ?auto_619147 ) ) ( not ( = ?auto_619137 ?auto_619148 ) ) ( not ( = ?auto_619137 ?auto_619149 ) ) ( not ( = ?auto_619137 ?auto_619150 ) ) ( not ( = ?auto_619137 ?auto_619151 ) ) ( not ( = ?auto_619138 ?auto_619139 ) ) ( not ( = ?auto_619138 ?auto_619140 ) ) ( not ( = ?auto_619138 ?auto_619141 ) ) ( not ( = ?auto_619138 ?auto_619142 ) ) ( not ( = ?auto_619138 ?auto_619143 ) ) ( not ( = ?auto_619138 ?auto_619144 ) ) ( not ( = ?auto_619138 ?auto_619145 ) ) ( not ( = ?auto_619138 ?auto_619146 ) ) ( not ( = ?auto_619138 ?auto_619147 ) ) ( not ( = ?auto_619138 ?auto_619148 ) ) ( not ( = ?auto_619138 ?auto_619149 ) ) ( not ( = ?auto_619138 ?auto_619150 ) ) ( not ( = ?auto_619138 ?auto_619151 ) ) ( not ( = ?auto_619139 ?auto_619140 ) ) ( not ( = ?auto_619139 ?auto_619141 ) ) ( not ( = ?auto_619139 ?auto_619142 ) ) ( not ( = ?auto_619139 ?auto_619143 ) ) ( not ( = ?auto_619139 ?auto_619144 ) ) ( not ( = ?auto_619139 ?auto_619145 ) ) ( not ( = ?auto_619139 ?auto_619146 ) ) ( not ( = ?auto_619139 ?auto_619147 ) ) ( not ( = ?auto_619139 ?auto_619148 ) ) ( not ( = ?auto_619139 ?auto_619149 ) ) ( not ( = ?auto_619139 ?auto_619150 ) ) ( not ( = ?auto_619139 ?auto_619151 ) ) ( not ( = ?auto_619140 ?auto_619141 ) ) ( not ( = ?auto_619140 ?auto_619142 ) ) ( not ( = ?auto_619140 ?auto_619143 ) ) ( not ( = ?auto_619140 ?auto_619144 ) ) ( not ( = ?auto_619140 ?auto_619145 ) ) ( not ( = ?auto_619140 ?auto_619146 ) ) ( not ( = ?auto_619140 ?auto_619147 ) ) ( not ( = ?auto_619140 ?auto_619148 ) ) ( not ( = ?auto_619140 ?auto_619149 ) ) ( not ( = ?auto_619140 ?auto_619150 ) ) ( not ( = ?auto_619140 ?auto_619151 ) ) ( not ( = ?auto_619141 ?auto_619142 ) ) ( not ( = ?auto_619141 ?auto_619143 ) ) ( not ( = ?auto_619141 ?auto_619144 ) ) ( not ( = ?auto_619141 ?auto_619145 ) ) ( not ( = ?auto_619141 ?auto_619146 ) ) ( not ( = ?auto_619141 ?auto_619147 ) ) ( not ( = ?auto_619141 ?auto_619148 ) ) ( not ( = ?auto_619141 ?auto_619149 ) ) ( not ( = ?auto_619141 ?auto_619150 ) ) ( not ( = ?auto_619141 ?auto_619151 ) ) ( not ( = ?auto_619142 ?auto_619143 ) ) ( not ( = ?auto_619142 ?auto_619144 ) ) ( not ( = ?auto_619142 ?auto_619145 ) ) ( not ( = ?auto_619142 ?auto_619146 ) ) ( not ( = ?auto_619142 ?auto_619147 ) ) ( not ( = ?auto_619142 ?auto_619148 ) ) ( not ( = ?auto_619142 ?auto_619149 ) ) ( not ( = ?auto_619142 ?auto_619150 ) ) ( not ( = ?auto_619142 ?auto_619151 ) ) ( not ( = ?auto_619143 ?auto_619144 ) ) ( not ( = ?auto_619143 ?auto_619145 ) ) ( not ( = ?auto_619143 ?auto_619146 ) ) ( not ( = ?auto_619143 ?auto_619147 ) ) ( not ( = ?auto_619143 ?auto_619148 ) ) ( not ( = ?auto_619143 ?auto_619149 ) ) ( not ( = ?auto_619143 ?auto_619150 ) ) ( not ( = ?auto_619143 ?auto_619151 ) ) ( not ( = ?auto_619144 ?auto_619145 ) ) ( not ( = ?auto_619144 ?auto_619146 ) ) ( not ( = ?auto_619144 ?auto_619147 ) ) ( not ( = ?auto_619144 ?auto_619148 ) ) ( not ( = ?auto_619144 ?auto_619149 ) ) ( not ( = ?auto_619144 ?auto_619150 ) ) ( not ( = ?auto_619144 ?auto_619151 ) ) ( not ( = ?auto_619145 ?auto_619146 ) ) ( not ( = ?auto_619145 ?auto_619147 ) ) ( not ( = ?auto_619145 ?auto_619148 ) ) ( not ( = ?auto_619145 ?auto_619149 ) ) ( not ( = ?auto_619145 ?auto_619150 ) ) ( not ( = ?auto_619145 ?auto_619151 ) ) ( not ( = ?auto_619146 ?auto_619147 ) ) ( not ( = ?auto_619146 ?auto_619148 ) ) ( not ( = ?auto_619146 ?auto_619149 ) ) ( not ( = ?auto_619146 ?auto_619150 ) ) ( not ( = ?auto_619146 ?auto_619151 ) ) ( not ( = ?auto_619147 ?auto_619148 ) ) ( not ( = ?auto_619147 ?auto_619149 ) ) ( not ( = ?auto_619147 ?auto_619150 ) ) ( not ( = ?auto_619147 ?auto_619151 ) ) ( not ( = ?auto_619148 ?auto_619149 ) ) ( not ( = ?auto_619148 ?auto_619150 ) ) ( not ( = ?auto_619148 ?auto_619151 ) ) ( not ( = ?auto_619149 ?auto_619150 ) ) ( not ( = ?auto_619149 ?auto_619151 ) ) ( not ( = ?auto_619150 ?auto_619151 ) ) ( CLEAR ?auto_619148 ) ( ON ?auto_619149 ?auto_619150 ) ( CLEAR ?auto_619149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_619134 ?auto_619135 ?auto_619136 ?auto_619137 ?auto_619138 ?auto_619139 ?auto_619140 ?auto_619141 ?auto_619142 ?auto_619143 ?auto_619144 ?auto_619145 ?auto_619146 ?auto_619147 ?auto_619148 ?auto_619149 )
      ( MAKE-17PILE ?auto_619134 ?auto_619135 ?auto_619136 ?auto_619137 ?auto_619138 ?auto_619139 ?auto_619140 ?auto_619141 ?auto_619142 ?auto_619143 ?auto_619144 ?auto_619145 ?auto_619146 ?auto_619147 ?auto_619148 ?auto_619149 ?auto_619150 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619169 - BLOCK
      ?auto_619170 - BLOCK
      ?auto_619171 - BLOCK
      ?auto_619172 - BLOCK
      ?auto_619173 - BLOCK
      ?auto_619174 - BLOCK
      ?auto_619175 - BLOCK
      ?auto_619176 - BLOCK
      ?auto_619177 - BLOCK
      ?auto_619178 - BLOCK
      ?auto_619179 - BLOCK
      ?auto_619180 - BLOCK
      ?auto_619181 - BLOCK
      ?auto_619182 - BLOCK
      ?auto_619183 - BLOCK
      ?auto_619184 - BLOCK
      ?auto_619185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_619185 ) ( ON-TABLE ?auto_619169 ) ( ON ?auto_619170 ?auto_619169 ) ( ON ?auto_619171 ?auto_619170 ) ( ON ?auto_619172 ?auto_619171 ) ( ON ?auto_619173 ?auto_619172 ) ( ON ?auto_619174 ?auto_619173 ) ( ON ?auto_619175 ?auto_619174 ) ( ON ?auto_619176 ?auto_619175 ) ( ON ?auto_619177 ?auto_619176 ) ( ON ?auto_619178 ?auto_619177 ) ( ON ?auto_619179 ?auto_619178 ) ( ON ?auto_619180 ?auto_619179 ) ( ON ?auto_619181 ?auto_619180 ) ( ON ?auto_619182 ?auto_619181 ) ( ON ?auto_619183 ?auto_619182 ) ( not ( = ?auto_619169 ?auto_619170 ) ) ( not ( = ?auto_619169 ?auto_619171 ) ) ( not ( = ?auto_619169 ?auto_619172 ) ) ( not ( = ?auto_619169 ?auto_619173 ) ) ( not ( = ?auto_619169 ?auto_619174 ) ) ( not ( = ?auto_619169 ?auto_619175 ) ) ( not ( = ?auto_619169 ?auto_619176 ) ) ( not ( = ?auto_619169 ?auto_619177 ) ) ( not ( = ?auto_619169 ?auto_619178 ) ) ( not ( = ?auto_619169 ?auto_619179 ) ) ( not ( = ?auto_619169 ?auto_619180 ) ) ( not ( = ?auto_619169 ?auto_619181 ) ) ( not ( = ?auto_619169 ?auto_619182 ) ) ( not ( = ?auto_619169 ?auto_619183 ) ) ( not ( = ?auto_619169 ?auto_619184 ) ) ( not ( = ?auto_619169 ?auto_619185 ) ) ( not ( = ?auto_619170 ?auto_619171 ) ) ( not ( = ?auto_619170 ?auto_619172 ) ) ( not ( = ?auto_619170 ?auto_619173 ) ) ( not ( = ?auto_619170 ?auto_619174 ) ) ( not ( = ?auto_619170 ?auto_619175 ) ) ( not ( = ?auto_619170 ?auto_619176 ) ) ( not ( = ?auto_619170 ?auto_619177 ) ) ( not ( = ?auto_619170 ?auto_619178 ) ) ( not ( = ?auto_619170 ?auto_619179 ) ) ( not ( = ?auto_619170 ?auto_619180 ) ) ( not ( = ?auto_619170 ?auto_619181 ) ) ( not ( = ?auto_619170 ?auto_619182 ) ) ( not ( = ?auto_619170 ?auto_619183 ) ) ( not ( = ?auto_619170 ?auto_619184 ) ) ( not ( = ?auto_619170 ?auto_619185 ) ) ( not ( = ?auto_619171 ?auto_619172 ) ) ( not ( = ?auto_619171 ?auto_619173 ) ) ( not ( = ?auto_619171 ?auto_619174 ) ) ( not ( = ?auto_619171 ?auto_619175 ) ) ( not ( = ?auto_619171 ?auto_619176 ) ) ( not ( = ?auto_619171 ?auto_619177 ) ) ( not ( = ?auto_619171 ?auto_619178 ) ) ( not ( = ?auto_619171 ?auto_619179 ) ) ( not ( = ?auto_619171 ?auto_619180 ) ) ( not ( = ?auto_619171 ?auto_619181 ) ) ( not ( = ?auto_619171 ?auto_619182 ) ) ( not ( = ?auto_619171 ?auto_619183 ) ) ( not ( = ?auto_619171 ?auto_619184 ) ) ( not ( = ?auto_619171 ?auto_619185 ) ) ( not ( = ?auto_619172 ?auto_619173 ) ) ( not ( = ?auto_619172 ?auto_619174 ) ) ( not ( = ?auto_619172 ?auto_619175 ) ) ( not ( = ?auto_619172 ?auto_619176 ) ) ( not ( = ?auto_619172 ?auto_619177 ) ) ( not ( = ?auto_619172 ?auto_619178 ) ) ( not ( = ?auto_619172 ?auto_619179 ) ) ( not ( = ?auto_619172 ?auto_619180 ) ) ( not ( = ?auto_619172 ?auto_619181 ) ) ( not ( = ?auto_619172 ?auto_619182 ) ) ( not ( = ?auto_619172 ?auto_619183 ) ) ( not ( = ?auto_619172 ?auto_619184 ) ) ( not ( = ?auto_619172 ?auto_619185 ) ) ( not ( = ?auto_619173 ?auto_619174 ) ) ( not ( = ?auto_619173 ?auto_619175 ) ) ( not ( = ?auto_619173 ?auto_619176 ) ) ( not ( = ?auto_619173 ?auto_619177 ) ) ( not ( = ?auto_619173 ?auto_619178 ) ) ( not ( = ?auto_619173 ?auto_619179 ) ) ( not ( = ?auto_619173 ?auto_619180 ) ) ( not ( = ?auto_619173 ?auto_619181 ) ) ( not ( = ?auto_619173 ?auto_619182 ) ) ( not ( = ?auto_619173 ?auto_619183 ) ) ( not ( = ?auto_619173 ?auto_619184 ) ) ( not ( = ?auto_619173 ?auto_619185 ) ) ( not ( = ?auto_619174 ?auto_619175 ) ) ( not ( = ?auto_619174 ?auto_619176 ) ) ( not ( = ?auto_619174 ?auto_619177 ) ) ( not ( = ?auto_619174 ?auto_619178 ) ) ( not ( = ?auto_619174 ?auto_619179 ) ) ( not ( = ?auto_619174 ?auto_619180 ) ) ( not ( = ?auto_619174 ?auto_619181 ) ) ( not ( = ?auto_619174 ?auto_619182 ) ) ( not ( = ?auto_619174 ?auto_619183 ) ) ( not ( = ?auto_619174 ?auto_619184 ) ) ( not ( = ?auto_619174 ?auto_619185 ) ) ( not ( = ?auto_619175 ?auto_619176 ) ) ( not ( = ?auto_619175 ?auto_619177 ) ) ( not ( = ?auto_619175 ?auto_619178 ) ) ( not ( = ?auto_619175 ?auto_619179 ) ) ( not ( = ?auto_619175 ?auto_619180 ) ) ( not ( = ?auto_619175 ?auto_619181 ) ) ( not ( = ?auto_619175 ?auto_619182 ) ) ( not ( = ?auto_619175 ?auto_619183 ) ) ( not ( = ?auto_619175 ?auto_619184 ) ) ( not ( = ?auto_619175 ?auto_619185 ) ) ( not ( = ?auto_619176 ?auto_619177 ) ) ( not ( = ?auto_619176 ?auto_619178 ) ) ( not ( = ?auto_619176 ?auto_619179 ) ) ( not ( = ?auto_619176 ?auto_619180 ) ) ( not ( = ?auto_619176 ?auto_619181 ) ) ( not ( = ?auto_619176 ?auto_619182 ) ) ( not ( = ?auto_619176 ?auto_619183 ) ) ( not ( = ?auto_619176 ?auto_619184 ) ) ( not ( = ?auto_619176 ?auto_619185 ) ) ( not ( = ?auto_619177 ?auto_619178 ) ) ( not ( = ?auto_619177 ?auto_619179 ) ) ( not ( = ?auto_619177 ?auto_619180 ) ) ( not ( = ?auto_619177 ?auto_619181 ) ) ( not ( = ?auto_619177 ?auto_619182 ) ) ( not ( = ?auto_619177 ?auto_619183 ) ) ( not ( = ?auto_619177 ?auto_619184 ) ) ( not ( = ?auto_619177 ?auto_619185 ) ) ( not ( = ?auto_619178 ?auto_619179 ) ) ( not ( = ?auto_619178 ?auto_619180 ) ) ( not ( = ?auto_619178 ?auto_619181 ) ) ( not ( = ?auto_619178 ?auto_619182 ) ) ( not ( = ?auto_619178 ?auto_619183 ) ) ( not ( = ?auto_619178 ?auto_619184 ) ) ( not ( = ?auto_619178 ?auto_619185 ) ) ( not ( = ?auto_619179 ?auto_619180 ) ) ( not ( = ?auto_619179 ?auto_619181 ) ) ( not ( = ?auto_619179 ?auto_619182 ) ) ( not ( = ?auto_619179 ?auto_619183 ) ) ( not ( = ?auto_619179 ?auto_619184 ) ) ( not ( = ?auto_619179 ?auto_619185 ) ) ( not ( = ?auto_619180 ?auto_619181 ) ) ( not ( = ?auto_619180 ?auto_619182 ) ) ( not ( = ?auto_619180 ?auto_619183 ) ) ( not ( = ?auto_619180 ?auto_619184 ) ) ( not ( = ?auto_619180 ?auto_619185 ) ) ( not ( = ?auto_619181 ?auto_619182 ) ) ( not ( = ?auto_619181 ?auto_619183 ) ) ( not ( = ?auto_619181 ?auto_619184 ) ) ( not ( = ?auto_619181 ?auto_619185 ) ) ( not ( = ?auto_619182 ?auto_619183 ) ) ( not ( = ?auto_619182 ?auto_619184 ) ) ( not ( = ?auto_619182 ?auto_619185 ) ) ( not ( = ?auto_619183 ?auto_619184 ) ) ( not ( = ?auto_619183 ?auto_619185 ) ) ( not ( = ?auto_619184 ?auto_619185 ) ) ( CLEAR ?auto_619183 ) ( ON ?auto_619184 ?auto_619185 ) ( CLEAR ?auto_619184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_619169 ?auto_619170 ?auto_619171 ?auto_619172 ?auto_619173 ?auto_619174 ?auto_619175 ?auto_619176 ?auto_619177 ?auto_619178 ?auto_619179 ?auto_619180 ?auto_619181 ?auto_619182 ?auto_619183 ?auto_619184 )
      ( MAKE-17PILE ?auto_619169 ?auto_619170 ?auto_619171 ?auto_619172 ?auto_619173 ?auto_619174 ?auto_619175 ?auto_619176 ?auto_619177 ?auto_619178 ?auto_619179 ?auto_619180 ?auto_619181 ?auto_619182 ?auto_619183 ?auto_619184 ?auto_619185 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619203 - BLOCK
      ?auto_619204 - BLOCK
      ?auto_619205 - BLOCK
      ?auto_619206 - BLOCK
      ?auto_619207 - BLOCK
      ?auto_619208 - BLOCK
      ?auto_619209 - BLOCK
      ?auto_619210 - BLOCK
      ?auto_619211 - BLOCK
      ?auto_619212 - BLOCK
      ?auto_619213 - BLOCK
      ?auto_619214 - BLOCK
      ?auto_619215 - BLOCK
      ?auto_619216 - BLOCK
      ?auto_619217 - BLOCK
      ?auto_619218 - BLOCK
      ?auto_619219 - BLOCK
    )
    :vars
    (
      ?auto_619220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619219 ?auto_619220 ) ( ON-TABLE ?auto_619203 ) ( ON ?auto_619204 ?auto_619203 ) ( ON ?auto_619205 ?auto_619204 ) ( ON ?auto_619206 ?auto_619205 ) ( ON ?auto_619207 ?auto_619206 ) ( ON ?auto_619208 ?auto_619207 ) ( ON ?auto_619209 ?auto_619208 ) ( ON ?auto_619210 ?auto_619209 ) ( ON ?auto_619211 ?auto_619210 ) ( ON ?auto_619212 ?auto_619211 ) ( ON ?auto_619213 ?auto_619212 ) ( ON ?auto_619214 ?auto_619213 ) ( ON ?auto_619215 ?auto_619214 ) ( ON ?auto_619216 ?auto_619215 ) ( not ( = ?auto_619203 ?auto_619204 ) ) ( not ( = ?auto_619203 ?auto_619205 ) ) ( not ( = ?auto_619203 ?auto_619206 ) ) ( not ( = ?auto_619203 ?auto_619207 ) ) ( not ( = ?auto_619203 ?auto_619208 ) ) ( not ( = ?auto_619203 ?auto_619209 ) ) ( not ( = ?auto_619203 ?auto_619210 ) ) ( not ( = ?auto_619203 ?auto_619211 ) ) ( not ( = ?auto_619203 ?auto_619212 ) ) ( not ( = ?auto_619203 ?auto_619213 ) ) ( not ( = ?auto_619203 ?auto_619214 ) ) ( not ( = ?auto_619203 ?auto_619215 ) ) ( not ( = ?auto_619203 ?auto_619216 ) ) ( not ( = ?auto_619203 ?auto_619217 ) ) ( not ( = ?auto_619203 ?auto_619218 ) ) ( not ( = ?auto_619203 ?auto_619219 ) ) ( not ( = ?auto_619203 ?auto_619220 ) ) ( not ( = ?auto_619204 ?auto_619205 ) ) ( not ( = ?auto_619204 ?auto_619206 ) ) ( not ( = ?auto_619204 ?auto_619207 ) ) ( not ( = ?auto_619204 ?auto_619208 ) ) ( not ( = ?auto_619204 ?auto_619209 ) ) ( not ( = ?auto_619204 ?auto_619210 ) ) ( not ( = ?auto_619204 ?auto_619211 ) ) ( not ( = ?auto_619204 ?auto_619212 ) ) ( not ( = ?auto_619204 ?auto_619213 ) ) ( not ( = ?auto_619204 ?auto_619214 ) ) ( not ( = ?auto_619204 ?auto_619215 ) ) ( not ( = ?auto_619204 ?auto_619216 ) ) ( not ( = ?auto_619204 ?auto_619217 ) ) ( not ( = ?auto_619204 ?auto_619218 ) ) ( not ( = ?auto_619204 ?auto_619219 ) ) ( not ( = ?auto_619204 ?auto_619220 ) ) ( not ( = ?auto_619205 ?auto_619206 ) ) ( not ( = ?auto_619205 ?auto_619207 ) ) ( not ( = ?auto_619205 ?auto_619208 ) ) ( not ( = ?auto_619205 ?auto_619209 ) ) ( not ( = ?auto_619205 ?auto_619210 ) ) ( not ( = ?auto_619205 ?auto_619211 ) ) ( not ( = ?auto_619205 ?auto_619212 ) ) ( not ( = ?auto_619205 ?auto_619213 ) ) ( not ( = ?auto_619205 ?auto_619214 ) ) ( not ( = ?auto_619205 ?auto_619215 ) ) ( not ( = ?auto_619205 ?auto_619216 ) ) ( not ( = ?auto_619205 ?auto_619217 ) ) ( not ( = ?auto_619205 ?auto_619218 ) ) ( not ( = ?auto_619205 ?auto_619219 ) ) ( not ( = ?auto_619205 ?auto_619220 ) ) ( not ( = ?auto_619206 ?auto_619207 ) ) ( not ( = ?auto_619206 ?auto_619208 ) ) ( not ( = ?auto_619206 ?auto_619209 ) ) ( not ( = ?auto_619206 ?auto_619210 ) ) ( not ( = ?auto_619206 ?auto_619211 ) ) ( not ( = ?auto_619206 ?auto_619212 ) ) ( not ( = ?auto_619206 ?auto_619213 ) ) ( not ( = ?auto_619206 ?auto_619214 ) ) ( not ( = ?auto_619206 ?auto_619215 ) ) ( not ( = ?auto_619206 ?auto_619216 ) ) ( not ( = ?auto_619206 ?auto_619217 ) ) ( not ( = ?auto_619206 ?auto_619218 ) ) ( not ( = ?auto_619206 ?auto_619219 ) ) ( not ( = ?auto_619206 ?auto_619220 ) ) ( not ( = ?auto_619207 ?auto_619208 ) ) ( not ( = ?auto_619207 ?auto_619209 ) ) ( not ( = ?auto_619207 ?auto_619210 ) ) ( not ( = ?auto_619207 ?auto_619211 ) ) ( not ( = ?auto_619207 ?auto_619212 ) ) ( not ( = ?auto_619207 ?auto_619213 ) ) ( not ( = ?auto_619207 ?auto_619214 ) ) ( not ( = ?auto_619207 ?auto_619215 ) ) ( not ( = ?auto_619207 ?auto_619216 ) ) ( not ( = ?auto_619207 ?auto_619217 ) ) ( not ( = ?auto_619207 ?auto_619218 ) ) ( not ( = ?auto_619207 ?auto_619219 ) ) ( not ( = ?auto_619207 ?auto_619220 ) ) ( not ( = ?auto_619208 ?auto_619209 ) ) ( not ( = ?auto_619208 ?auto_619210 ) ) ( not ( = ?auto_619208 ?auto_619211 ) ) ( not ( = ?auto_619208 ?auto_619212 ) ) ( not ( = ?auto_619208 ?auto_619213 ) ) ( not ( = ?auto_619208 ?auto_619214 ) ) ( not ( = ?auto_619208 ?auto_619215 ) ) ( not ( = ?auto_619208 ?auto_619216 ) ) ( not ( = ?auto_619208 ?auto_619217 ) ) ( not ( = ?auto_619208 ?auto_619218 ) ) ( not ( = ?auto_619208 ?auto_619219 ) ) ( not ( = ?auto_619208 ?auto_619220 ) ) ( not ( = ?auto_619209 ?auto_619210 ) ) ( not ( = ?auto_619209 ?auto_619211 ) ) ( not ( = ?auto_619209 ?auto_619212 ) ) ( not ( = ?auto_619209 ?auto_619213 ) ) ( not ( = ?auto_619209 ?auto_619214 ) ) ( not ( = ?auto_619209 ?auto_619215 ) ) ( not ( = ?auto_619209 ?auto_619216 ) ) ( not ( = ?auto_619209 ?auto_619217 ) ) ( not ( = ?auto_619209 ?auto_619218 ) ) ( not ( = ?auto_619209 ?auto_619219 ) ) ( not ( = ?auto_619209 ?auto_619220 ) ) ( not ( = ?auto_619210 ?auto_619211 ) ) ( not ( = ?auto_619210 ?auto_619212 ) ) ( not ( = ?auto_619210 ?auto_619213 ) ) ( not ( = ?auto_619210 ?auto_619214 ) ) ( not ( = ?auto_619210 ?auto_619215 ) ) ( not ( = ?auto_619210 ?auto_619216 ) ) ( not ( = ?auto_619210 ?auto_619217 ) ) ( not ( = ?auto_619210 ?auto_619218 ) ) ( not ( = ?auto_619210 ?auto_619219 ) ) ( not ( = ?auto_619210 ?auto_619220 ) ) ( not ( = ?auto_619211 ?auto_619212 ) ) ( not ( = ?auto_619211 ?auto_619213 ) ) ( not ( = ?auto_619211 ?auto_619214 ) ) ( not ( = ?auto_619211 ?auto_619215 ) ) ( not ( = ?auto_619211 ?auto_619216 ) ) ( not ( = ?auto_619211 ?auto_619217 ) ) ( not ( = ?auto_619211 ?auto_619218 ) ) ( not ( = ?auto_619211 ?auto_619219 ) ) ( not ( = ?auto_619211 ?auto_619220 ) ) ( not ( = ?auto_619212 ?auto_619213 ) ) ( not ( = ?auto_619212 ?auto_619214 ) ) ( not ( = ?auto_619212 ?auto_619215 ) ) ( not ( = ?auto_619212 ?auto_619216 ) ) ( not ( = ?auto_619212 ?auto_619217 ) ) ( not ( = ?auto_619212 ?auto_619218 ) ) ( not ( = ?auto_619212 ?auto_619219 ) ) ( not ( = ?auto_619212 ?auto_619220 ) ) ( not ( = ?auto_619213 ?auto_619214 ) ) ( not ( = ?auto_619213 ?auto_619215 ) ) ( not ( = ?auto_619213 ?auto_619216 ) ) ( not ( = ?auto_619213 ?auto_619217 ) ) ( not ( = ?auto_619213 ?auto_619218 ) ) ( not ( = ?auto_619213 ?auto_619219 ) ) ( not ( = ?auto_619213 ?auto_619220 ) ) ( not ( = ?auto_619214 ?auto_619215 ) ) ( not ( = ?auto_619214 ?auto_619216 ) ) ( not ( = ?auto_619214 ?auto_619217 ) ) ( not ( = ?auto_619214 ?auto_619218 ) ) ( not ( = ?auto_619214 ?auto_619219 ) ) ( not ( = ?auto_619214 ?auto_619220 ) ) ( not ( = ?auto_619215 ?auto_619216 ) ) ( not ( = ?auto_619215 ?auto_619217 ) ) ( not ( = ?auto_619215 ?auto_619218 ) ) ( not ( = ?auto_619215 ?auto_619219 ) ) ( not ( = ?auto_619215 ?auto_619220 ) ) ( not ( = ?auto_619216 ?auto_619217 ) ) ( not ( = ?auto_619216 ?auto_619218 ) ) ( not ( = ?auto_619216 ?auto_619219 ) ) ( not ( = ?auto_619216 ?auto_619220 ) ) ( not ( = ?auto_619217 ?auto_619218 ) ) ( not ( = ?auto_619217 ?auto_619219 ) ) ( not ( = ?auto_619217 ?auto_619220 ) ) ( not ( = ?auto_619218 ?auto_619219 ) ) ( not ( = ?auto_619218 ?auto_619220 ) ) ( not ( = ?auto_619219 ?auto_619220 ) ) ( ON ?auto_619218 ?auto_619219 ) ( CLEAR ?auto_619216 ) ( ON ?auto_619217 ?auto_619218 ) ( CLEAR ?auto_619217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_619203 ?auto_619204 ?auto_619205 ?auto_619206 ?auto_619207 ?auto_619208 ?auto_619209 ?auto_619210 ?auto_619211 ?auto_619212 ?auto_619213 ?auto_619214 ?auto_619215 ?auto_619216 ?auto_619217 )
      ( MAKE-17PILE ?auto_619203 ?auto_619204 ?auto_619205 ?auto_619206 ?auto_619207 ?auto_619208 ?auto_619209 ?auto_619210 ?auto_619211 ?auto_619212 ?auto_619213 ?auto_619214 ?auto_619215 ?auto_619216 ?auto_619217 ?auto_619218 ?auto_619219 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619238 - BLOCK
      ?auto_619239 - BLOCK
      ?auto_619240 - BLOCK
      ?auto_619241 - BLOCK
      ?auto_619242 - BLOCK
      ?auto_619243 - BLOCK
      ?auto_619244 - BLOCK
      ?auto_619245 - BLOCK
      ?auto_619246 - BLOCK
      ?auto_619247 - BLOCK
      ?auto_619248 - BLOCK
      ?auto_619249 - BLOCK
      ?auto_619250 - BLOCK
      ?auto_619251 - BLOCK
      ?auto_619252 - BLOCK
      ?auto_619253 - BLOCK
      ?auto_619254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_619254 ) ( ON-TABLE ?auto_619238 ) ( ON ?auto_619239 ?auto_619238 ) ( ON ?auto_619240 ?auto_619239 ) ( ON ?auto_619241 ?auto_619240 ) ( ON ?auto_619242 ?auto_619241 ) ( ON ?auto_619243 ?auto_619242 ) ( ON ?auto_619244 ?auto_619243 ) ( ON ?auto_619245 ?auto_619244 ) ( ON ?auto_619246 ?auto_619245 ) ( ON ?auto_619247 ?auto_619246 ) ( ON ?auto_619248 ?auto_619247 ) ( ON ?auto_619249 ?auto_619248 ) ( ON ?auto_619250 ?auto_619249 ) ( ON ?auto_619251 ?auto_619250 ) ( not ( = ?auto_619238 ?auto_619239 ) ) ( not ( = ?auto_619238 ?auto_619240 ) ) ( not ( = ?auto_619238 ?auto_619241 ) ) ( not ( = ?auto_619238 ?auto_619242 ) ) ( not ( = ?auto_619238 ?auto_619243 ) ) ( not ( = ?auto_619238 ?auto_619244 ) ) ( not ( = ?auto_619238 ?auto_619245 ) ) ( not ( = ?auto_619238 ?auto_619246 ) ) ( not ( = ?auto_619238 ?auto_619247 ) ) ( not ( = ?auto_619238 ?auto_619248 ) ) ( not ( = ?auto_619238 ?auto_619249 ) ) ( not ( = ?auto_619238 ?auto_619250 ) ) ( not ( = ?auto_619238 ?auto_619251 ) ) ( not ( = ?auto_619238 ?auto_619252 ) ) ( not ( = ?auto_619238 ?auto_619253 ) ) ( not ( = ?auto_619238 ?auto_619254 ) ) ( not ( = ?auto_619239 ?auto_619240 ) ) ( not ( = ?auto_619239 ?auto_619241 ) ) ( not ( = ?auto_619239 ?auto_619242 ) ) ( not ( = ?auto_619239 ?auto_619243 ) ) ( not ( = ?auto_619239 ?auto_619244 ) ) ( not ( = ?auto_619239 ?auto_619245 ) ) ( not ( = ?auto_619239 ?auto_619246 ) ) ( not ( = ?auto_619239 ?auto_619247 ) ) ( not ( = ?auto_619239 ?auto_619248 ) ) ( not ( = ?auto_619239 ?auto_619249 ) ) ( not ( = ?auto_619239 ?auto_619250 ) ) ( not ( = ?auto_619239 ?auto_619251 ) ) ( not ( = ?auto_619239 ?auto_619252 ) ) ( not ( = ?auto_619239 ?auto_619253 ) ) ( not ( = ?auto_619239 ?auto_619254 ) ) ( not ( = ?auto_619240 ?auto_619241 ) ) ( not ( = ?auto_619240 ?auto_619242 ) ) ( not ( = ?auto_619240 ?auto_619243 ) ) ( not ( = ?auto_619240 ?auto_619244 ) ) ( not ( = ?auto_619240 ?auto_619245 ) ) ( not ( = ?auto_619240 ?auto_619246 ) ) ( not ( = ?auto_619240 ?auto_619247 ) ) ( not ( = ?auto_619240 ?auto_619248 ) ) ( not ( = ?auto_619240 ?auto_619249 ) ) ( not ( = ?auto_619240 ?auto_619250 ) ) ( not ( = ?auto_619240 ?auto_619251 ) ) ( not ( = ?auto_619240 ?auto_619252 ) ) ( not ( = ?auto_619240 ?auto_619253 ) ) ( not ( = ?auto_619240 ?auto_619254 ) ) ( not ( = ?auto_619241 ?auto_619242 ) ) ( not ( = ?auto_619241 ?auto_619243 ) ) ( not ( = ?auto_619241 ?auto_619244 ) ) ( not ( = ?auto_619241 ?auto_619245 ) ) ( not ( = ?auto_619241 ?auto_619246 ) ) ( not ( = ?auto_619241 ?auto_619247 ) ) ( not ( = ?auto_619241 ?auto_619248 ) ) ( not ( = ?auto_619241 ?auto_619249 ) ) ( not ( = ?auto_619241 ?auto_619250 ) ) ( not ( = ?auto_619241 ?auto_619251 ) ) ( not ( = ?auto_619241 ?auto_619252 ) ) ( not ( = ?auto_619241 ?auto_619253 ) ) ( not ( = ?auto_619241 ?auto_619254 ) ) ( not ( = ?auto_619242 ?auto_619243 ) ) ( not ( = ?auto_619242 ?auto_619244 ) ) ( not ( = ?auto_619242 ?auto_619245 ) ) ( not ( = ?auto_619242 ?auto_619246 ) ) ( not ( = ?auto_619242 ?auto_619247 ) ) ( not ( = ?auto_619242 ?auto_619248 ) ) ( not ( = ?auto_619242 ?auto_619249 ) ) ( not ( = ?auto_619242 ?auto_619250 ) ) ( not ( = ?auto_619242 ?auto_619251 ) ) ( not ( = ?auto_619242 ?auto_619252 ) ) ( not ( = ?auto_619242 ?auto_619253 ) ) ( not ( = ?auto_619242 ?auto_619254 ) ) ( not ( = ?auto_619243 ?auto_619244 ) ) ( not ( = ?auto_619243 ?auto_619245 ) ) ( not ( = ?auto_619243 ?auto_619246 ) ) ( not ( = ?auto_619243 ?auto_619247 ) ) ( not ( = ?auto_619243 ?auto_619248 ) ) ( not ( = ?auto_619243 ?auto_619249 ) ) ( not ( = ?auto_619243 ?auto_619250 ) ) ( not ( = ?auto_619243 ?auto_619251 ) ) ( not ( = ?auto_619243 ?auto_619252 ) ) ( not ( = ?auto_619243 ?auto_619253 ) ) ( not ( = ?auto_619243 ?auto_619254 ) ) ( not ( = ?auto_619244 ?auto_619245 ) ) ( not ( = ?auto_619244 ?auto_619246 ) ) ( not ( = ?auto_619244 ?auto_619247 ) ) ( not ( = ?auto_619244 ?auto_619248 ) ) ( not ( = ?auto_619244 ?auto_619249 ) ) ( not ( = ?auto_619244 ?auto_619250 ) ) ( not ( = ?auto_619244 ?auto_619251 ) ) ( not ( = ?auto_619244 ?auto_619252 ) ) ( not ( = ?auto_619244 ?auto_619253 ) ) ( not ( = ?auto_619244 ?auto_619254 ) ) ( not ( = ?auto_619245 ?auto_619246 ) ) ( not ( = ?auto_619245 ?auto_619247 ) ) ( not ( = ?auto_619245 ?auto_619248 ) ) ( not ( = ?auto_619245 ?auto_619249 ) ) ( not ( = ?auto_619245 ?auto_619250 ) ) ( not ( = ?auto_619245 ?auto_619251 ) ) ( not ( = ?auto_619245 ?auto_619252 ) ) ( not ( = ?auto_619245 ?auto_619253 ) ) ( not ( = ?auto_619245 ?auto_619254 ) ) ( not ( = ?auto_619246 ?auto_619247 ) ) ( not ( = ?auto_619246 ?auto_619248 ) ) ( not ( = ?auto_619246 ?auto_619249 ) ) ( not ( = ?auto_619246 ?auto_619250 ) ) ( not ( = ?auto_619246 ?auto_619251 ) ) ( not ( = ?auto_619246 ?auto_619252 ) ) ( not ( = ?auto_619246 ?auto_619253 ) ) ( not ( = ?auto_619246 ?auto_619254 ) ) ( not ( = ?auto_619247 ?auto_619248 ) ) ( not ( = ?auto_619247 ?auto_619249 ) ) ( not ( = ?auto_619247 ?auto_619250 ) ) ( not ( = ?auto_619247 ?auto_619251 ) ) ( not ( = ?auto_619247 ?auto_619252 ) ) ( not ( = ?auto_619247 ?auto_619253 ) ) ( not ( = ?auto_619247 ?auto_619254 ) ) ( not ( = ?auto_619248 ?auto_619249 ) ) ( not ( = ?auto_619248 ?auto_619250 ) ) ( not ( = ?auto_619248 ?auto_619251 ) ) ( not ( = ?auto_619248 ?auto_619252 ) ) ( not ( = ?auto_619248 ?auto_619253 ) ) ( not ( = ?auto_619248 ?auto_619254 ) ) ( not ( = ?auto_619249 ?auto_619250 ) ) ( not ( = ?auto_619249 ?auto_619251 ) ) ( not ( = ?auto_619249 ?auto_619252 ) ) ( not ( = ?auto_619249 ?auto_619253 ) ) ( not ( = ?auto_619249 ?auto_619254 ) ) ( not ( = ?auto_619250 ?auto_619251 ) ) ( not ( = ?auto_619250 ?auto_619252 ) ) ( not ( = ?auto_619250 ?auto_619253 ) ) ( not ( = ?auto_619250 ?auto_619254 ) ) ( not ( = ?auto_619251 ?auto_619252 ) ) ( not ( = ?auto_619251 ?auto_619253 ) ) ( not ( = ?auto_619251 ?auto_619254 ) ) ( not ( = ?auto_619252 ?auto_619253 ) ) ( not ( = ?auto_619252 ?auto_619254 ) ) ( not ( = ?auto_619253 ?auto_619254 ) ) ( ON ?auto_619253 ?auto_619254 ) ( CLEAR ?auto_619251 ) ( ON ?auto_619252 ?auto_619253 ) ( CLEAR ?auto_619252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_619238 ?auto_619239 ?auto_619240 ?auto_619241 ?auto_619242 ?auto_619243 ?auto_619244 ?auto_619245 ?auto_619246 ?auto_619247 ?auto_619248 ?auto_619249 ?auto_619250 ?auto_619251 ?auto_619252 )
      ( MAKE-17PILE ?auto_619238 ?auto_619239 ?auto_619240 ?auto_619241 ?auto_619242 ?auto_619243 ?auto_619244 ?auto_619245 ?auto_619246 ?auto_619247 ?auto_619248 ?auto_619249 ?auto_619250 ?auto_619251 ?auto_619252 ?auto_619253 ?auto_619254 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619272 - BLOCK
      ?auto_619273 - BLOCK
      ?auto_619274 - BLOCK
      ?auto_619275 - BLOCK
      ?auto_619276 - BLOCK
      ?auto_619277 - BLOCK
      ?auto_619278 - BLOCK
      ?auto_619279 - BLOCK
      ?auto_619280 - BLOCK
      ?auto_619281 - BLOCK
      ?auto_619282 - BLOCK
      ?auto_619283 - BLOCK
      ?auto_619284 - BLOCK
      ?auto_619285 - BLOCK
      ?auto_619286 - BLOCK
      ?auto_619287 - BLOCK
      ?auto_619288 - BLOCK
    )
    :vars
    (
      ?auto_619289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619288 ?auto_619289 ) ( ON-TABLE ?auto_619272 ) ( ON ?auto_619273 ?auto_619272 ) ( ON ?auto_619274 ?auto_619273 ) ( ON ?auto_619275 ?auto_619274 ) ( ON ?auto_619276 ?auto_619275 ) ( ON ?auto_619277 ?auto_619276 ) ( ON ?auto_619278 ?auto_619277 ) ( ON ?auto_619279 ?auto_619278 ) ( ON ?auto_619280 ?auto_619279 ) ( ON ?auto_619281 ?auto_619280 ) ( ON ?auto_619282 ?auto_619281 ) ( ON ?auto_619283 ?auto_619282 ) ( ON ?auto_619284 ?auto_619283 ) ( not ( = ?auto_619272 ?auto_619273 ) ) ( not ( = ?auto_619272 ?auto_619274 ) ) ( not ( = ?auto_619272 ?auto_619275 ) ) ( not ( = ?auto_619272 ?auto_619276 ) ) ( not ( = ?auto_619272 ?auto_619277 ) ) ( not ( = ?auto_619272 ?auto_619278 ) ) ( not ( = ?auto_619272 ?auto_619279 ) ) ( not ( = ?auto_619272 ?auto_619280 ) ) ( not ( = ?auto_619272 ?auto_619281 ) ) ( not ( = ?auto_619272 ?auto_619282 ) ) ( not ( = ?auto_619272 ?auto_619283 ) ) ( not ( = ?auto_619272 ?auto_619284 ) ) ( not ( = ?auto_619272 ?auto_619285 ) ) ( not ( = ?auto_619272 ?auto_619286 ) ) ( not ( = ?auto_619272 ?auto_619287 ) ) ( not ( = ?auto_619272 ?auto_619288 ) ) ( not ( = ?auto_619272 ?auto_619289 ) ) ( not ( = ?auto_619273 ?auto_619274 ) ) ( not ( = ?auto_619273 ?auto_619275 ) ) ( not ( = ?auto_619273 ?auto_619276 ) ) ( not ( = ?auto_619273 ?auto_619277 ) ) ( not ( = ?auto_619273 ?auto_619278 ) ) ( not ( = ?auto_619273 ?auto_619279 ) ) ( not ( = ?auto_619273 ?auto_619280 ) ) ( not ( = ?auto_619273 ?auto_619281 ) ) ( not ( = ?auto_619273 ?auto_619282 ) ) ( not ( = ?auto_619273 ?auto_619283 ) ) ( not ( = ?auto_619273 ?auto_619284 ) ) ( not ( = ?auto_619273 ?auto_619285 ) ) ( not ( = ?auto_619273 ?auto_619286 ) ) ( not ( = ?auto_619273 ?auto_619287 ) ) ( not ( = ?auto_619273 ?auto_619288 ) ) ( not ( = ?auto_619273 ?auto_619289 ) ) ( not ( = ?auto_619274 ?auto_619275 ) ) ( not ( = ?auto_619274 ?auto_619276 ) ) ( not ( = ?auto_619274 ?auto_619277 ) ) ( not ( = ?auto_619274 ?auto_619278 ) ) ( not ( = ?auto_619274 ?auto_619279 ) ) ( not ( = ?auto_619274 ?auto_619280 ) ) ( not ( = ?auto_619274 ?auto_619281 ) ) ( not ( = ?auto_619274 ?auto_619282 ) ) ( not ( = ?auto_619274 ?auto_619283 ) ) ( not ( = ?auto_619274 ?auto_619284 ) ) ( not ( = ?auto_619274 ?auto_619285 ) ) ( not ( = ?auto_619274 ?auto_619286 ) ) ( not ( = ?auto_619274 ?auto_619287 ) ) ( not ( = ?auto_619274 ?auto_619288 ) ) ( not ( = ?auto_619274 ?auto_619289 ) ) ( not ( = ?auto_619275 ?auto_619276 ) ) ( not ( = ?auto_619275 ?auto_619277 ) ) ( not ( = ?auto_619275 ?auto_619278 ) ) ( not ( = ?auto_619275 ?auto_619279 ) ) ( not ( = ?auto_619275 ?auto_619280 ) ) ( not ( = ?auto_619275 ?auto_619281 ) ) ( not ( = ?auto_619275 ?auto_619282 ) ) ( not ( = ?auto_619275 ?auto_619283 ) ) ( not ( = ?auto_619275 ?auto_619284 ) ) ( not ( = ?auto_619275 ?auto_619285 ) ) ( not ( = ?auto_619275 ?auto_619286 ) ) ( not ( = ?auto_619275 ?auto_619287 ) ) ( not ( = ?auto_619275 ?auto_619288 ) ) ( not ( = ?auto_619275 ?auto_619289 ) ) ( not ( = ?auto_619276 ?auto_619277 ) ) ( not ( = ?auto_619276 ?auto_619278 ) ) ( not ( = ?auto_619276 ?auto_619279 ) ) ( not ( = ?auto_619276 ?auto_619280 ) ) ( not ( = ?auto_619276 ?auto_619281 ) ) ( not ( = ?auto_619276 ?auto_619282 ) ) ( not ( = ?auto_619276 ?auto_619283 ) ) ( not ( = ?auto_619276 ?auto_619284 ) ) ( not ( = ?auto_619276 ?auto_619285 ) ) ( not ( = ?auto_619276 ?auto_619286 ) ) ( not ( = ?auto_619276 ?auto_619287 ) ) ( not ( = ?auto_619276 ?auto_619288 ) ) ( not ( = ?auto_619276 ?auto_619289 ) ) ( not ( = ?auto_619277 ?auto_619278 ) ) ( not ( = ?auto_619277 ?auto_619279 ) ) ( not ( = ?auto_619277 ?auto_619280 ) ) ( not ( = ?auto_619277 ?auto_619281 ) ) ( not ( = ?auto_619277 ?auto_619282 ) ) ( not ( = ?auto_619277 ?auto_619283 ) ) ( not ( = ?auto_619277 ?auto_619284 ) ) ( not ( = ?auto_619277 ?auto_619285 ) ) ( not ( = ?auto_619277 ?auto_619286 ) ) ( not ( = ?auto_619277 ?auto_619287 ) ) ( not ( = ?auto_619277 ?auto_619288 ) ) ( not ( = ?auto_619277 ?auto_619289 ) ) ( not ( = ?auto_619278 ?auto_619279 ) ) ( not ( = ?auto_619278 ?auto_619280 ) ) ( not ( = ?auto_619278 ?auto_619281 ) ) ( not ( = ?auto_619278 ?auto_619282 ) ) ( not ( = ?auto_619278 ?auto_619283 ) ) ( not ( = ?auto_619278 ?auto_619284 ) ) ( not ( = ?auto_619278 ?auto_619285 ) ) ( not ( = ?auto_619278 ?auto_619286 ) ) ( not ( = ?auto_619278 ?auto_619287 ) ) ( not ( = ?auto_619278 ?auto_619288 ) ) ( not ( = ?auto_619278 ?auto_619289 ) ) ( not ( = ?auto_619279 ?auto_619280 ) ) ( not ( = ?auto_619279 ?auto_619281 ) ) ( not ( = ?auto_619279 ?auto_619282 ) ) ( not ( = ?auto_619279 ?auto_619283 ) ) ( not ( = ?auto_619279 ?auto_619284 ) ) ( not ( = ?auto_619279 ?auto_619285 ) ) ( not ( = ?auto_619279 ?auto_619286 ) ) ( not ( = ?auto_619279 ?auto_619287 ) ) ( not ( = ?auto_619279 ?auto_619288 ) ) ( not ( = ?auto_619279 ?auto_619289 ) ) ( not ( = ?auto_619280 ?auto_619281 ) ) ( not ( = ?auto_619280 ?auto_619282 ) ) ( not ( = ?auto_619280 ?auto_619283 ) ) ( not ( = ?auto_619280 ?auto_619284 ) ) ( not ( = ?auto_619280 ?auto_619285 ) ) ( not ( = ?auto_619280 ?auto_619286 ) ) ( not ( = ?auto_619280 ?auto_619287 ) ) ( not ( = ?auto_619280 ?auto_619288 ) ) ( not ( = ?auto_619280 ?auto_619289 ) ) ( not ( = ?auto_619281 ?auto_619282 ) ) ( not ( = ?auto_619281 ?auto_619283 ) ) ( not ( = ?auto_619281 ?auto_619284 ) ) ( not ( = ?auto_619281 ?auto_619285 ) ) ( not ( = ?auto_619281 ?auto_619286 ) ) ( not ( = ?auto_619281 ?auto_619287 ) ) ( not ( = ?auto_619281 ?auto_619288 ) ) ( not ( = ?auto_619281 ?auto_619289 ) ) ( not ( = ?auto_619282 ?auto_619283 ) ) ( not ( = ?auto_619282 ?auto_619284 ) ) ( not ( = ?auto_619282 ?auto_619285 ) ) ( not ( = ?auto_619282 ?auto_619286 ) ) ( not ( = ?auto_619282 ?auto_619287 ) ) ( not ( = ?auto_619282 ?auto_619288 ) ) ( not ( = ?auto_619282 ?auto_619289 ) ) ( not ( = ?auto_619283 ?auto_619284 ) ) ( not ( = ?auto_619283 ?auto_619285 ) ) ( not ( = ?auto_619283 ?auto_619286 ) ) ( not ( = ?auto_619283 ?auto_619287 ) ) ( not ( = ?auto_619283 ?auto_619288 ) ) ( not ( = ?auto_619283 ?auto_619289 ) ) ( not ( = ?auto_619284 ?auto_619285 ) ) ( not ( = ?auto_619284 ?auto_619286 ) ) ( not ( = ?auto_619284 ?auto_619287 ) ) ( not ( = ?auto_619284 ?auto_619288 ) ) ( not ( = ?auto_619284 ?auto_619289 ) ) ( not ( = ?auto_619285 ?auto_619286 ) ) ( not ( = ?auto_619285 ?auto_619287 ) ) ( not ( = ?auto_619285 ?auto_619288 ) ) ( not ( = ?auto_619285 ?auto_619289 ) ) ( not ( = ?auto_619286 ?auto_619287 ) ) ( not ( = ?auto_619286 ?auto_619288 ) ) ( not ( = ?auto_619286 ?auto_619289 ) ) ( not ( = ?auto_619287 ?auto_619288 ) ) ( not ( = ?auto_619287 ?auto_619289 ) ) ( not ( = ?auto_619288 ?auto_619289 ) ) ( ON ?auto_619287 ?auto_619288 ) ( ON ?auto_619286 ?auto_619287 ) ( CLEAR ?auto_619284 ) ( ON ?auto_619285 ?auto_619286 ) ( CLEAR ?auto_619285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_619272 ?auto_619273 ?auto_619274 ?auto_619275 ?auto_619276 ?auto_619277 ?auto_619278 ?auto_619279 ?auto_619280 ?auto_619281 ?auto_619282 ?auto_619283 ?auto_619284 ?auto_619285 )
      ( MAKE-17PILE ?auto_619272 ?auto_619273 ?auto_619274 ?auto_619275 ?auto_619276 ?auto_619277 ?auto_619278 ?auto_619279 ?auto_619280 ?auto_619281 ?auto_619282 ?auto_619283 ?auto_619284 ?auto_619285 ?auto_619286 ?auto_619287 ?auto_619288 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619307 - BLOCK
      ?auto_619308 - BLOCK
      ?auto_619309 - BLOCK
      ?auto_619310 - BLOCK
      ?auto_619311 - BLOCK
      ?auto_619312 - BLOCK
      ?auto_619313 - BLOCK
      ?auto_619314 - BLOCK
      ?auto_619315 - BLOCK
      ?auto_619316 - BLOCK
      ?auto_619317 - BLOCK
      ?auto_619318 - BLOCK
      ?auto_619319 - BLOCK
      ?auto_619320 - BLOCK
      ?auto_619321 - BLOCK
      ?auto_619322 - BLOCK
      ?auto_619323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_619323 ) ( ON-TABLE ?auto_619307 ) ( ON ?auto_619308 ?auto_619307 ) ( ON ?auto_619309 ?auto_619308 ) ( ON ?auto_619310 ?auto_619309 ) ( ON ?auto_619311 ?auto_619310 ) ( ON ?auto_619312 ?auto_619311 ) ( ON ?auto_619313 ?auto_619312 ) ( ON ?auto_619314 ?auto_619313 ) ( ON ?auto_619315 ?auto_619314 ) ( ON ?auto_619316 ?auto_619315 ) ( ON ?auto_619317 ?auto_619316 ) ( ON ?auto_619318 ?auto_619317 ) ( ON ?auto_619319 ?auto_619318 ) ( not ( = ?auto_619307 ?auto_619308 ) ) ( not ( = ?auto_619307 ?auto_619309 ) ) ( not ( = ?auto_619307 ?auto_619310 ) ) ( not ( = ?auto_619307 ?auto_619311 ) ) ( not ( = ?auto_619307 ?auto_619312 ) ) ( not ( = ?auto_619307 ?auto_619313 ) ) ( not ( = ?auto_619307 ?auto_619314 ) ) ( not ( = ?auto_619307 ?auto_619315 ) ) ( not ( = ?auto_619307 ?auto_619316 ) ) ( not ( = ?auto_619307 ?auto_619317 ) ) ( not ( = ?auto_619307 ?auto_619318 ) ) ( not ( = ?auto_619307 ?auto_619319 ) ) ( not ( = ?auto_619307 ?auto_619320 ) ) ( not ( = ?auto_619307 ?auto_619321 ) ) ( not ( = ?auto_619307 ?auto_619322 ) ) ( not ( = ?auto_619307 ?auto_619323 ) ) ( not ( = ?auto_619308 ?auto_619309 ) ) ( not ( = ?auto_619308 ?auto_619310 ) ) ( not ( = ?auto_619308 ?auto_619311 ) ) ( not ( = ?auto_619308 ?auto_619312 ) ) ( not ( = ?auto_619308 ?auto_619313 ) ) ( not ( = ?auto_619308 ?auto_619314 ) ) ( not ( = ?auto_619308 ?auto_619315 ) ) ( not ( = ?auto_619308 ?auto_619316 ) ) ( not ( = ?auto_619308 ?auto_619317 ) ) ( not ( = ?auto_619308 ?auto_619318 ) ) ( not ( = ?auto_619308 ?auto_619319 ) ) ( not ( = ?auto_619308 ?auto_619320 ) ) ( not ( = ?auto_619308 ?auto_619321 ) ) ( not ( = ?auto_619308 ?auto_619322 ) ) ( not ( = ?auto_619308 ?auto_619323 ) ) ( not ( = ?auto_619309 ?auto_619310 ) ) ( not ( = ?auto_619309 ?auto_619311 ) ) ( not ( = ?auto_619309 ?auto_619312 ) ) ( not ( = ?auto_619309 ?auto_619313 ) ) ( not ( = ?auto_619309 ?auto_619314 ) ) ( not ( = ?auto_619309 ?auto_619315 ) ) ( not ( = ?auto_619309 ?auto_619316 ) ) ( not ( = ?auto_619309 ?auto_619317 ) ) ( not ( = ?auto_619309 ?auto_619318 ) ) ( not ( = ?auto_619309 ?auto_619319 ) ) ( not ( = ?auto_619309 ?auto_619320 ) ) ( not ( = ?auto_619309 ?auto_619321 ) ) ( not ( = ?auto_619309 ?auto_619322 ) ) ( not ( = ?auto_619309 ?auto_619323 ) ) ( not ( = ?auto_619310 ?auto_619311 ) ) ( not ( = ?auto_619310 ?auto_619312 ) ) ( not ( = ?auto_619310 ?auto_619313 ) ) ( not ( = ?auto_619310 ?auto_619314 ) ) ( not ( = ?auto_619310 ?auto_619315 ) ) ( not ( = ?auto_619310 ?auto_619316 ) ) ( not ( = ?auto_619310 ?auto_619317 ) ) ( not ( = ?auto_619310 ?auto_619318 ) ) ( not ( = ?auto_619310 ?auto_619319 ) ) ( not ( = ?auto_619310 ?auto_619320 ) ) ( not ( = ?auto_619310 ?auto_619321 ) ) ( not ( = ?auto_619310 ?auto_619322 ) ) ( not ( = ?auto_619310 ?auto_619323 ) ) ( not ( = ?auto_619311 ?auto_619312 ) ) ( not ( = ?auto_619311 ?auto_619313 ) ) ( not ( = ?auto_619311 ?auto_619314 ) ) ( not ( = ?auto_619311 ?auto_619315 ) ) ( not ( = ?auto_619311 ?auto_619316 ) ) ( not ( = ?auto_619311 ?auto_619317 ) ) ( not ( = ?auto_619311 ?auto_619318 ) ) ( not ( = ?auto_619311 ?auto_619319 ) ) ( not ( = ?auto_619311 ?auto_619320 ) ) ( not ( = ?auto_619311 ?auto_619321 ) ) ( not ( = ?auto_619311 ?auto_619322 ) ) ( not ( = ?auto_619311 ?auto_619323 ) ) ( not ( = ?auto_619312 ?auto_619313 ) ) ( not ( = ?auto_619312 ?auto_619314 ) ) ( not ( = ?auto_619312 ?auto_619315 ) ) ( not ( = ?auto_619312 ?auto_619316 ) ) ( not ( = ?auto_619312 ?auto_619317 ) ) ( not ( = ?auto_619312 ?auto_619318 ) ) ( not ( = ?auto_619312 ?auto_619319 ) ) ( not ( = ?auto_619312 ?auto_619320 ) ) ( not ( = ?auto_619312 ?auto_619321 ) ) ( not ( = ?auto_619312 ?auto_619322 ) ) ( not ( = ?auto_619312 ?auto_619323 ) ) ( not ( = ?auto_619313 ?auto_619314 ) ) ( not ( = ?auto_619313 ?auto_619315 ) ) ( not ( = ?auto_619313 ?auto_619316 ) ) ( not ( = ?auto_619313 ?auto_619317 ) ) ( not ( = ?auto_619313 ?auto_619318 ) ) ( not ( = ?auto_619313 ?auto_619319 ) ) ( not ( = ?auto_619313 ?auto_619320 ) ) ( not ( = ?auto_619313 ?auto_619321 ) ) ( not ( = ?auto_619313 ?auto_619322 ) ) ( not ( = ?auto_619313 ?auto_619323 ) ) ( not ( = ?auto_619314 ?auto_619315 ) ) ( not ( = ?auto_619314 ?auto_619316 ) ) ( not ( = ?auto_619314 ?auto_619317 ) ) ( not ( = ?auto_619314 ?auto_619318 ) ) ( not ( = ?auto_619314 ?auto_619319 ) ) ( not ( = ?auto_619314 ?auto_619320 ) ) ( not ( = ?auto_619314 ?auto_619321 ) ) ( not ( = ?auto_619314 ?auto_619322 ) ) ( not ( = ?auto_619314 ?auto_619323 ) ) ( not ( = ?auto_619315 ?auto_619316 ) ) ( not ( = ?auto_619315 ?auto_619317 ) ) ( not ( = ?auto_619315 ?auto_619318 ) ) ( not ( = ?auto_619315 ?auto_619319 ) ) ( not ( = ?auto_619315 ?auto_619320 ) ) ( not ( = ?auto_619315 ?auto_619321 ) ) ( not ( = ?auto_619315 ?auto_619322 ) ) ( not ( = ?auto_619315 ?auto_619323 ) ) ( not ( = ?auto_619316 ?auto_619317 ) ) ( not ( = ?auto_619316 ?auto_619318 ) ) ( not ( = ?auto_619316 ?auto_619319 ) ) ( not ( = ?auto_619316 ?auto_619320 ) ) ( not ( = ?auto_619316 ?auto_619321 ) ) ( not ( = ?auto_619316 ?auto_619322 ) ) ( not ( = ?auto_619316 ?auto_619323 ) ) ( not ( = ?auto_619317 ?auto_619318 ) ) ( not ( = ?auto_619317 ?auto_619319 ) ) ( not ( = ?auto_619317 ?auto_619320 ) ) ( not ( = ?auto_619317 ?auto_619321 ) ) ( not ( = ?auto_619317 ?auto_619322 ) ) ( not ( = ?auto_619317 ?auto_619323 ) ) ( not ( = ?auto_619318 ?auto_619319 ) ) ( not ( = ?auto_619318 ?auto_619320 ) ) ( not ( = ?auto_619318 ?auto_619321 ) ) ( not ( = ?auto_619318 ?auto_619322 ) ) ( not ( = ?auto_619318 ?auto_619323 ) ) ( not ( = ?auto_619319 ?auto_619320 ) ) ( not ( = ?auto_619319 ?auto_619321 ) ) ( not ( = ?auto_619319 ?auto_619322 ) ) ( not ( = ?auto_619319 ?auto_619323 ) ) ( not ( = ?auto_619320 ?auto_619321 ) ) ( not ( = ?auto_619320 ?auto_619322 ) ) ( not ( = ?auto_619320 ?auto_619323 ) ) ( not ( = ?auto_619321 ?auto_619322 ) ) ( not ( = ?auto_619321 ?auto_619323 ) ) ( not ( = ?auto_619322 ?auto_619323 ) ) ( ON ?auto_619322 ?auto_619323 ) ( ON ?auto_619321 ?auto_619322 ) ( CLEAR ?auto_619319 ) ( ON ?auto_619320 ?auto_619321 ) ( CLEAR ?auto_619320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_619307 ?auto_619308 ?auto_619309 ?auto_619310 ?auto_619311 ?auto_619312 ?auto_619313 ?auto_619314 ?auto_619315 ?auto_619316 ?auto_619317 ?auto_619318 ?auto_619319 ?auto_619320 )
      ( MAKE-17PILE ?auto_619307 ?auto_619308 ?auto_619309 ?auto_619310 ?auto_619311 ?auto_619312 ?auto_619313 ?auto_619314 ?auto_619315 ?auto_619316 ?auto_619317 ?auto_619318 ?auto_619319 ?auto_619320 ?auto_619321 ?auto_619322 ?auto_619323 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619341 - BLOCK
      ?auto_619342 - BLOCK
      ?auto_619343 - BLOCK
      ?auto_619344 - BLOCK
      ?auto_619345 - BLOCK
      ?auto_619346 - BLOCK
      ?auto_619347 - BLOCK
      ?auto_619348 - BLOCK
      ?auto_619349 - BLOCK
      ?auto_619350 - BLOCK
      ?auto_619351 - BLOCK
      ?auto_619352 - BLOCK
      ?auto_619353 - BLOCK
      ?auto_619354 - BLOCK
      ?auto_619355 - BLOCK
      ?auto_619356 - BLOCK
      ?auto_619357 - BLOCK
    )
    :vars
    (
      ?auto_619358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619357 ?auto_619358 ) ( ON-TABLE ?auto_619341 ) ( ON ?auto_619342 ?auto_619341 ) ( ON ?auto_619343 ?auto_619342 ) ( ON ?auto_619344 ?auto_619343 ) ( ON ?auto_619345 ?auto_619344 ) ( ON ?auto_619346 ?auto_619345 ) ( ON ?auto_619347 ?auto_619346 ) ( ON ?auto_619348 ?auto_619347 ) ( ON ?auto_619349 ?auto_619348 ) ( ON ?auto_619350 ?auto_619349 ) ( ON ?auto_619351 ?auto_619350 ) ( ON ?auto_619352 ?auto_619351 ) ( not ( = ?auto_619341 ?auto_619342 ) ) ( not ( = ?auto_619341 ?auto_619343 ) ) ( not ( = ?auto_619341 ?auto_619344 ) ) ( not ( = ?auto_619341 ?auto_619345 ) ) ( not ( = ?auto_619341 ?auto_619346 ) ) ( not ( = ?auto_619341 ?auto_619347 ) ) ( not ( = ?auto_619341 ?auto_619348 ) ) ( not ( = ?auto_619341 ?auto_619349 ) ) ( not ( = ?auto_619341 ?auto_619350 ) ) ( not ( = ?auto_619341 ?auto_619351 ) ) ( not ( = ?auto_619341 ?auto_619352 ) ) ( not ( = ?auto_619341 ?auto_619353 ) ) ( not ( = ?auto_619341 ?auto_619354 ) ) ( not ( = ?auto_619341 ?auto_619355 ) ) ( not ( = ?auto_619341 ?auto_619356 ) ) ( not ( = ?auto_619341 ?auto_619357 ) ) ( not ( = ?auto_619341 ?auto_619358 ) ) ( not ( = ?auto_619342 ?auto_619343 ) ) ( not ( = ?auto_619342 ?auto_619344 ) ) ( not ( = ?auto_619342 ?auto_619345 ) ) ( not ( = ?auto_619342 ?auto_619346 ) ) ( not ( = ?auto_619342 ?auto_619347 ) ) ( not ( = ?auto_619342 ?auto_619348 ) ) ( not ( = ?auto_619342 ?auto_619349 ) ) ( not ( = ?auto_619342 ?auto_619350 ) ) ( not ( = ?auto_619342 ?auto_619351 ) ) ( not ( = ?auto_619342 ?auto_619352 ) ) ( not ( = ?auto_619342 ?auto_619353 ) ) ( not ( = ?auto_619342 ?auto_619354 ) ) ( not ( = ?auto_619342 ?auto_619355 ) ) ( not ( = ?auto_619342 ?auto_619356 ) ) ( not ( = ?auto_619342 ?auto_619357 ) ) ( not ( = ?auto_619342 ?auto_619358 ) ) ( not ( = ?auto_619343 ?auto_619344 ) ) ( not ( = ?auto_619343 ?auto_619345 ) ) ( not ( = ?auto_619343 ?auto_619346 ) ) ( not ( = ?auto_619343 ?auto_619347 ) ) ( not ( = ?auto_619343 ?auto_619348 ) ) ( not ( = ?auto_619343 ?auto_619349 ) ) ( not ( = ?auto_619343 ?auto_619350 ) ) ( not ( = ?auto_619343 ?auto_619351 ) ) ( not ( = ?auto_619343 ?auto_619352 ) ) ( not ( = ?auto_619343 ?auto_619353 ) ) ( not ( = ?auto_619343 ?auto_619354 ) ) ( not ( = ?auto_619343 ?auto_619355 ) ) ( not ( = ?auto_619343 ?auto_619356 ) ) ( not ( = ?auto_619343 ?auto_619357 ) ) ( not ( = ?auto_619343 ?auto_619358 ) ) ( not ( = ?auto_619344 ?auto_619345 ) ) ( not ( = ?auto_619344 ?auto_619346 ) ) ( not ( = ?auto_619344 ?auto_619347 ) ) ( not ( = ?auto_619344 ?auto_619348 ) ) ( not ( = ?auto_619344 ?auto_619349 ) ) ( not ( = ?auto_619344 ?auto_619350 ) ) ( not ( = ?auto_619344 ?auto_619351 ) ) ( not ( = ?auto_619344 ?auto_619352 ) ) ( not ( = ?auto_619344 ?auto_619353 ) ) ( not ( = ?auto_619344 ?auto_619354 ) ) ( not ( = ?auto_619344 ?auto_619355 ) ) ( not ( = ?auto_619344 ?auto_619356 ) ) ( not ( = ?auto_619344 ?auto_619357 ) ) ( not ( = ?auto_619344 ?auto_619358 ) ) ( not ( = ?auto_619345 ?auto_619346 ) ) ( not ( = ?auto_619345 ?auto_619347 ) ) ( not ( = ?auto_619345 ?auto_619348 ) ) ( not ( = ?auto_619345 ?auto_619349 ) ) ( not ( = ?auto_619345 ?auto_619350 ) ) ( not ( = ?auto_619345 ?auto_619351 ) ) ( not ( = ?auto_619345 ?auto_619352 ) ) ( not ( = ?auto_619345 ?auto_619353 ) ) ( not ( = ?auto_619345 ?auto_619354 ) ) ( not ( = ?auto_619345 ?auto_619355 ) ) ( not ( = ?auto_619345 ?auto_619356 ) ) ( not ( = ?auto_619345 ?auto_619357 ) ) ( not ( = ?auto_619345 ?auto_619358 ) ) ( not ( = ?auto_619346 ?auto_619347 ) ) ( not ( = ?auto_619346 ?auto_619348 ) ) ( not ( = ?auto_619346 ?auto_619349 ) ) ( not ( = ?auto_619346 ?auto_619350 ) ) ( not ( = ?auto_619346 ?auto_619351 ) ) ( not ( = ?auto_619346 ?auto_619352 ) ) ( not ( = ?auto_619346 ?auto_619353 ) ) ( not ( = ?auto_619346 ?auto_619354 ) ) ( not ( = ?auto_619346 ?auto_619355 ) ) ( not ( = ?auto_619346 ?auto_619356 ) ) ( not ( = ?auto_619346 ?auto_619357 ) ) ( not ( = ?auto_619346 ?auto_619358 ) ) ( not ( = ?auto_619347 ?auto_619348 ) ) ( not ( = ?auto_619347 ?auto_619349 ) ) ( not ( = ?auto_619347 ?auto_619350 ) ) ( not ( = ?auto_619347 ?auto_619351 ) ) ( not ( = ?auto_619347 ?auto_619352 ) ) ( not ( = ?auto_619347 ?auto_619353 ) ) ( not ( = ?auto_619347 ?auto_619354 ) ) ( not ( = ?auto_619347 ?auto_619355 ) ) ( not ( = ?auto_619347 ?auto_619356 ) ) ( not ( = ?auto_619347 ?auto_619357 ) ) ( not ( = ?auto_619347 ?auto_619358 ) ) ( not ( = ?auto_619348 ?auto_619349 ) ) ( not ( = ?auto_619348 ?auto_619350 ) ) ( not ( = ?auto_619348 ?auto_619351 ) ) ( not ( = ?auto_619348 ?auto_619352 ) ) ( not ( = ?auto_619348 ?auto_619353 ) ) ( not ( = ?auto_619348 ?auto_619354 ) ) ( not ( = ?auto_619348 ?auto_619355 ) ) ( not ( = ?auto_619348 ?auto_619356 ) ) ( not ( = ?auto_619348 ?auto_619357 ) ) ( not ( = ?auto_619348 ?auto_619358 ) ) ( not ( = ?auto_619349 ?auto_619350 ) ) ( not ( = ?auto_619349 ?auto_619351 ) ) ( not ( = ?auto_619349 ?auto_619352 ) ) ( not ( = ?auto_619349 ?auto_619353 ) ) ( not ( = ?auto_619349 ?auto_619354 ) ) ( not ( = ?auto_619349 ?auto_619355 ) ) ( not ( = ?auto_619349 ?auto_619356 ) ) ( not ( = ?auto_619349 ?auto_619357 ) ) ( not ( = ?auto_619349 ?auto_619358 ) ) ( not ( = ?auto_619350 ?auto_619351 ) ) ( not ( = ?auto_619350 ?auto_619352 ) ) ( not ( = ?auto_619350 ?auto_619353 ) ) ( not ( = ?auto_619350 ?auto_619354 ) ) ( not ( = ?auto_619350 ?auto_619355 ) ) ( not ( = ?auto_619350 ?auto_619356 ) ) ( not ( = ?auto_619350 ?auto_619357 ) ) ( not ( = ?auto_619350 ?auto_619358 ) ) ( not ( = ?auto_619351 ?auto_619352 ) ) ( not ( = ?auto_619351 ?auto_619353 ) ) ( not ( = ?auto_619351 ?auto_619354 ) ) ( not ( = ?auto_619351 ?auto_619355 ) ) ( not ( = ?auto_619351 ?auto_619356 ) ) ( not ( = ?auto_619351 ?auto_619357 ) ) ( not ( = ?auto_619351 ?auto_619358 ) ) ( not ( = ?auto_619352 ?auto_619353 ) ) ( not ( = ?auto_619352 ?auto_619354 ) ) ( not ( = ?auto_619352 ?auto_619355 ) ) ( not ( = ?auto_619352 ?auto_619356 ) ) ( not ( = ?auto_619352 ?auto_619357 ) ) ( not ( = ?auto_619352 ?auto_619358 ) ) ( not ( = ?auto_619353 ?auto_619354 ) ) ( not ( = ?auto_619353 ?auto_619355 ) ) ( not ( = ?auto_619353 ?auto_619356 ) ) ( not ( = ?auto_619353 ?auto_619357 ) ) ( not ( = ?auto_619353 ?auto_619358 ) ) ( not ( = ?auto_619354 ?auto_619355 ) ) ( not ( = ?auto_619354 ?auto_619356 ) ) ( not ( = ?auto_619354 ?auto_619357 ) ) ( not ( = ?auto_619354 ?auto_619358 ) ) ( not ( = ?auto_619355 ?auto_619356 ) ) ( not ( = ?auto_619355 ?auto_619357 ) ) ( not ( = ?auto_619355 ?auto_619358 ) ) ( not ( = ?auto_619356 ?auto_619357 ) ) ( not ( = ?auto_619356 ?auto_619358 ) ) ( not ( = ?auto_619357 ?auto_619358 ) ) ( ON ?auto_619356 ?auto_619357 ) ( ON ?auto_619355 ?auto_619356 ) ( ON ?auto_619354 ?auto_619355 ) ( CLEAR ?auto_619352 ) ( ON ?auto_619353 ?auto_619354 ) ( CLEAR ?auto_619353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_619341 ?auto_619342 ?auto_619343 ?auto_619344 ?auto_619345 ?auto_619346 ?auto_619347 ?auto_619348 ?auto_619349 ?auto_619350 ?auto_619351 ?auto_619352 ?auto_619353 )
      ( MAKE-17PILE ?auto_619341 ?auto_619342 ?auto_619343 ?auto_619344 ?auto_619345 ?auto_619346 ?auto_619347 ?auto_619348 ?auto_619349 ?auto_619350 ?auto_619351 ?auto_619352 ?auto_619353 ?auto_619354 ?auto_619355 ?auto_619356 ?auto_619357 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619376 - BLOCK
      ?auto_619377 - BLOCK
      ?auto_619378 - BLOCK
      ?auto_619379 - BLOCK
      ?auto_619380 - BLOCK
      ?auto_619381 - BLOCK
      ?auto_619382 - BLOCK
      ?auto_619383 - BLOCK
      ?auto_619384 - BLOCK
      ?auto_619385 - BLOCK
      ?auto_619386 - BLOCK
      ?auto_619387 - BLOCK
      ?auto_619388 - BLOCK
      ?auto_619389 - BLOCK
      ?auto_619390 - BLOCK
      ?auto_619391 - BLOCK
      ?auto_619392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_619392 ) ( ON-TABLE ?auto_619376 ) ( ON ?auto_619377 ?auto_619376 ) ( ON ?auto_619378 ?auto_619377 ) ( ON ?auto_619379 ?auto_619378 ) ( ON ?auto_619380 ?auto_619379 ) ( ON ?auto_619381 ?auto_619380 ) ( ON ?auto_619382 ?auto_619381 ) ( ON ?auto_619383 ?auto_619382 ) ( ON ?auto_619384 ?auto_619383 ) ( ON ?auto_619385 ?auto_619384 ) ( ON ?auto_619386 ?auto_619385 ) ( ON ?auto_619387 ?auto_619386 ) ( not ( = ?auto_619376 ?auto_619377 ) ) ( not ( = ?auto_619376 ?auto_619378 ) ) ( not ( = ?auto_619376 ?auto_619379 ) ) ( not ( = ?auto_619376 ?auto_619380 ) ) ( not ( = ?auto_619376 ?auto_619381 ) ) ( not ( = ?auto_619376 ?auto_619382 ) ) ( not ( = ?auto_619376 ?auto_619383 ) ) ( not ( = ?auto_619376 ?auto_619384 ) ) ( not ( = ?auto_619376 ?auto_619385 ) ) ( not ( = ?auto_619376 ?auto_619386 ) ) ( not ( = ?auto_619376 ?auto_619387 ) ) ( not ( = ?auto_619376 ?auto_619388 ) ) ( not ( = ?auto_619376 ?auto_619389 ) ) ( not ( = ?auto_619376 ?auto_619390 ) ) ( not ( = ?auto_619376 ?auto_619391 ) ) ( not ( = ?auto_619376 ?auto_619392 ) ) ( not ( = ?auto_619377 ?auto_619378 ) ) ( not ( = ?auto_619377 ?auto_619379 ) ) ( not ( = ?auto_619377 ?auto_619380 ) ) ( not ( = ?auto_619377 ?auto_619381 ) ) ( not ( = ?auto_619377 ?auto_619382 ) ) ( not ( = ?auto_619377 ?auto_619383 ) ) ( not ( = ?auto_619377 ?auto_619384 ) ) ( not ( = ?auto_619377 ?auto_619385 ) ) ( not ( = ?auto_619377 ?auto_619386 ) ) ( not ( = ?auto_619377 ?auto_619387 ) ) ( not ( = ?auto_619377 ?auto_619388 ) ) ( not ( = ?auto_619377 ?auto_619389 ) ) ( not ( = ?auto_619377 ?auto_619390 ) ) ( not ( = ?auto_619377 ?auto_619391 ) ) ( not ( = ?auto_619377 ?auto_619392 ) ) ( not ( = ?auto_619378 ?auto_619379 ) ) ( not ( = ?auto_619378 ?auto_619380 ) ) ( not ( = ?auto_619378 ?auto_619381 ) ) ( not ( = ?auto_619378 ?auto_619382 ) ) ( not ( = ?auto_619378 ?auto_619383 ) ) ( not ( = ?auto_619378 ?auto_619384 ) ) ( not ( = ?auto_619378 ?auto_619385 ) ) ( not ( = ?auto_619378 ?auto_619386 ) ) ( not ( = ?auto_619378 ?auto_619387 ) ) ( not ( = ?auto_619378 ?auto_619388 ) ) ( not ( = ?auto_619378 ?auto_619389 ) ) ( not ( = ?auto_619378 ?auto_619390 ) ) ( not ( = ?auto_619378 ?auto_619391 ) ) ( not ( = ?auto_619378 ?auto_619392 ) ) ( not ( = ?auto_619379 ?auto_619380 ) ) ( not ( = ?auto_619379 ?auto_619381 ) ) ( not ( = ?auto_619379 ?auto_619382 ) ) ( not ( = ?auto_619379 ?auto_619383 ) ) ( not ( = ?auto_619379 ?auto_619384 ) ) ( not ( = ?auto_619379 ?auto_619385 ) ) ( not ( = ?auto_619379 ?auto_619386 ) ) ( not ( = ?auto_619379 ?auto_619387 ) ) ( not ( = ?auto_619379 ?auto_619388 ) ) ( not ( = ?auto_619379 ?auto_619389 ) ) ( not ( = ?auto_619379 ?auto_619390 ) ) ( not ( = ?auto_619379 ?auto_619391 ) ) ( not ( = ?auto_619379 ?auto_619392 ) ) ( not ( = ?auto_619380 ?auto_619381 ) ) ( not ( = ?auto_619380 ?auto_619382 ) ) ( not ( = ?auto_619380 ?auto_619383 ) ) ( not ( = ?auto_619380 ?auto_619384 ) ) ( not ( = ?auto_619380 ?auto_619385 ) ) ( not ( = ?auto_619380 ?auto_619386 ) ) ( not ( = ?auto_619380 ?auto_619387 ) ) ( not ( = ?auto_619380 ?auto_619388 ) ) ( not ( = ?auto_619380 ?auto_619389 ) ) ( not ( = ?auto_619380 ?auto_619390 ) ) ( not ( = ?auto_619380 ?auto_619391 ) ) ( not ( = ?auto_619380 ?auto_619392 ) ) ( not ( = ?auto_619381 ?auto_619382 ) ) ( not ( = ?auto_619381 ?auto_619383 ) ) ( not ( = ?auto_619381 ?auto_619384 ) ) ( not ( = ?auto_619381 ?auto_619385 ) ) ( not ( = ?auto_619381 ?auto_619386 ) ) ( not ( = ?auto_619381 ?auto_619387 ) ) ( not ( = ?auto_619381 ?auto_619388 ) ) ( not ( = ?auto_619381 ?auto_619389 ) ) ( not ( = ?auto_619381 ?auto_619390 ) ) ( not ( = ?auto_619381 ?auto_619391 ) ) ( not ( = ?auto_619381 ?auto_619392 ) ) ( not ( = ?auto_619382 ?auto_619383 ) ) ( not ( = ?auto_619382 ?auto_619384 ) ) ( not ( = ?auto_619382 ?auto_619385 ) ) ( not ( = ?auto_619382 ?auto_619386 ) ) ( not ( = ?auto_619382 ?auto_619387 ) ) ( not ( = ?auto_619382 ?auto_619388 ) ) ( not ( = ?auto_619382 ?auto_619389 ) ) ( not ( = ?auto_619382 ?auto_619390 ) ) ( not ( = ?auto_619382 ?auto_619391 ) ) ( not ( = ?auto_619382 ?auto_619392 ) ) ( not ( = ?auto_619383 ?auto_619384 ) ) ( not ( = ?auto_619383 ?auto_619385 ) ) ( not ( = ?auto_619383 ?auto_619386 ) ) ( not ( = ?auto_619383 ?auto_619387 ) ) ( not ( = ?auto_619383 ?auto_619388 ) ) ( not ( = ?auto_619383 ?auto_619389 ) ) ( not ( = ?auto_619383 ?auto_619390 ) ) ( not ( = ?auto_619383 ?auto_619391 ) ) ( not ( = ?auto_619383 ?auto_619392 ) ) ( not ( = ?auto_619384 ?auto_619385 ) ) ( not ( = ?auto_619384 ?auto_619386 ) ) ( not ( = ?auto_619384 ?auto_619387 ) ) ( not ( = ?auto_619384 ?auto_619388 ) ) ( not ( = ?auto_619384 ?auto_619389 ) ) ( not ( = ?auto_619384 ?auto_619390 ) ) ( not ( = ?auto_619384 ?auto_619391 ) ) ( not ( = ?auto_619384 ?auto_619392 ) ) ( not ( = ?auto_619385 ?auto_619386 ) ) ( not ( = ?auto_619385 ?auto_619387 ) ) ( not ( = ?auto_619385 ?auto_619388 ) ) ( not ( = ?auto_619385 ?auto_619389 ) ) ( not ( = ?auto_619385 ?auto_619390 ) ) ( not ( = ?auto_619385 ?auto_619391 ) ) ( not ( = ?auto_619385 ?auto_619392 ) ) ( not ( = ?auto_619386 ?auto_619387 ) ) ( not ( = ?auto_619386 ?auto_619388 ) ) ( not ( = ?auto_619386 ?auto_619389 ) ) ( not ( = ?auto_619386 ?auto_619390 ) ) ( not ( = ?auto_619386 ?auto_619391 ) ) ( not ( = ?auto_619386 ?auto_619392 ) ) ( not ( = ?auto_619387 ?auto_619388 ) ) ( not ( = ?auto_619387 ?auto_619389 ) ) ( not ( = ?auto_619387 ?auto_619390 ) ) ( not ( = ?auto_619387 ?auto_619391 ) ) ( not ( = ?auto_619387 ?auto_619392 ) ) ( not ( = ?auto_619388 ?auto_619389 ) ) ( not ( = ?auto_619388 ?auto_619390 ) ) ( not ( = ?auto_619388 ?auto_619391 ) ) ( not ( = ?auto_619388 ?auto_619392 ) ) ( not ( = ?auto_619389 ?auto_619390 ) ) ( not ( = ?auto_619389 ?auto_619391 ) ) ( not ( = ?auto_619389 ?auto_619392 ) ) ( not ( = ?auto_619390 ?auto_619391 ) ) ( not ( = ?auto_619390 ?auto_619392 ) ) ( not ( = ?auto_619391 ?auto_619392 ) ) ( ON ?auto_619391 ?auto_619392 ) ( ON ?auto_619390 ?auto_619391 ) ( ON ?auto_619389 ?auto_619390 ) ( CLEAR ?auto_619387 ) ( ON ?auto_619388 ?auto_619389 ) ( CLEAR ?auto_619388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_619376 ?auto_619377 ?auto_619378 ?auto_619379 ?auto_619380 ?auto_619381 ?auto_619382 ?auto_619383 ?auto_619384 ?auto_619385 ?auto_619386 ?auto_619387 ?auto_619388 )
      ( MAKE-17PILE ?auto_619376 ?auto_619377 ?auto_619378 ?auto_619379 ?auto_619380 ?auto_619381 ?auto_619382 ?auto_619383 ?auto_619384 ?auto_619385 ?auto_619386 ?auto_619387 ?auto_619388 ?auto_619389 ?auto_619390 ?auto_619391 ?auto_619392 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619410 - BLOCK
      ?auto_619411 - BLOCK
      ?auto_619412 - BLOCK
      ?auto_619413 - BLOCK
      ?auto_619414 - BLOCK
      ?auto_619415 - BLOCK
      ?auto_619416 - BLOCK
      ?auto_619417 - BLOCK
      ?auto_619418 - BLOCK
      ?auto_619419 - BLOCK
      ?auto_619420 - BLOCK
      ?auto_619421 - BLOCK
      ?auto_619422 - BLOCK
      ?auto_619423 - BLOCK
      ?auto_619424 - BLOCK
      ?auto_619425 - BLOCK
      ?auto_619426 - BLOCK
    )
    :vars
    (
      ?auto_619427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619426 ?auto_619427 ) ( ON-TABLE ?auto_619410 ) ( ON ?auto_619411 ?auto_619410 ) ( ON ?auto_619412 ?auto_619411 ) ( ON ?auto_619413 ?auto_619412 ) ( ON ?auto_619414 ?auto_619413 ) ( ON ?auto_619415 ?auto_619414 ) ( ON ?auto_619416 ?auto_619415 ) ( ON ?auto_619417 ?auto_619416 ) ( ON ?auto_619418 ?auto_619417 ) ( ON ?auto_619419 ?auto_619418 ) ( ON ?auto_619420 ?auto_619419 ) ( not ( = ?auto_619410 ?auto_619411 ) ) ( not ( = ?auto_619410 ?auto_619412 ) ) ( not ( = ?auto_619410 ?auto_619413 ) ) ( not ( = ?auto_619410 ?auto_619414 ) ) ( not ( = ?auto_619410 ?auto_619415 ) ) ( not ( = ?auto_619410 ?auto_619416 ) ) ( not ( = ?auto_619410 ?auto_619417 ) ) ( not ( = ?auto_619410 ?auto_619418 ) ) ( not ( = ?auto_619410 ?auto_619419 ) ) ( not ( = ?auto_619410 ?auto_619420 ) ) ( not ( = ?auto_619410 ?auto_619421 ) ) ( not ( = ?auto_619410 ?auto_619422 ) ) ( not ( = ?auto_619410 ?auto_619423 ) ) ( not ( = ?auto_619410 ?auto_619424 ) ) ( not ( = ?auto_619410 ?auto_619425 ) ) ( not ( = ?auto_619410 ?auto_619426 ) ) ( not ( = ?auto_619410 ?auto_619427 ) ) ( not ( = ?auto_619411 ?auto_619412 ) ) ( not ( = ?auto_619411 ?auto_619413 ) ) ( not ( = ?auto_619411 ?auto_619414 ) ) ( not ( = ?auto_619411 ?auto_619415 ) ) ( not ( = ?auto_619411 ?auto_619416 ) ) ( not ( = ?auto_619411 ?auto_619417 ) ) ( not ( = ?auto_619411 ?auto_619418 ) ) ( not ( = ?auto_619411 ?auto_619419 ) ) ( not ( = ?auto_619411 ?auto_619420 ) ) ( not ( = ?auto_619411 ?auto_619421 ) ) ( not ( = ?auto_619411 ?auto_619422 ) ) ( not ( = ?auto_619411 ?auto_619423 ) ) ( not ( = ?auto_619411 ?auto_619424 ) ) ( not ( = ?auto_619411 ?auto_619425 ) ) ( not ( = ?auto_619411 ?auto_619426 ) ) ( not ( = ?auto_619411 ?auto_619427 ) ) ( not ( = ?auto_619412 ?auto_619413 ) ) ( not ( = ?auto_619412 ?auto_619414 ) ) ( not ( = ?auto_619412 ?auto_619415 ) ) ( not ( = ?auto_619412 ?auto_619416 ) ) ( not ( = ?auto_619412 ?auto_619417 ) ) ( not ( = ?auto_619412 ?auto_619418 ) ) ( not ( = ?auto_619412 ?auto_619419 ) ) ( not ( = ?auto_619412 ?auto_619420 ) ) ( not ( = ?auto_619412 ?auto_619421 ) ) ( not ( = ?auto_619412 ?auto_619422 ) ) ( not ( = ?auto_619412 ?auto_619423 ) ) ( not ( = ?auto_619412 ?auto_619424 ) ) ( not ( = ?auto_619412 ?auto_619425 ) ) ( not ( = ?auto_619412 ?auto_619426 ) ) ( not ( = ?auto_619412 ?auto_619427 ) ) ( not ( = ?auto_619413 ?auto_619414 ) ) ( not ( = ?auto_619413 ?auto_619415 ) ) ( not ( = ?auto_619413 ?auto_619416 ) ) ( not ( = ?auto_619413 ?auto_619417 ) ) ( not ( = ?auto_619413 ?auto_619418 ) ) ( not ( = ?auto_619413 ?auto_619419 ) ) ( not ( = ?auto_619413 ?auto_619420 ) ) ( not ( = ?auto_619413 ?auto_619421 ) ) ( not ( = ?auto_619413 ?auto_619422 ) ) ( not ( = ?auto_619413 ?auto_619423 ) ) ( not ( = ?auto_619413 ?auto_619424 ) ) ( not ( = ?auto_619413 ?auto_619425 ) ) ( not ( = ?auto_619413 ?auto_619426 ) ) ( not ( = ?auto_619413 ?auto_619427 ) ) ( not ( = ?auto_619414 ?auto_619415 ) ) ( not ( = ?auto_619414 ?auto_619416 ) ) ( not ( = ?auto_619414 ?auto_619417 ) ) ( not ( = ?auto_619414 ?auto_619418 ) ) ( not ( = ?auto_619414 ?auto_619419 ) ) ( not ( = ?auto_619414 ?auto_619420 ) ) ( not ( = ?auto_619414 ?auto_619421 ) ) ( not ( = ?auto_619414 ?auto_619422 ) ) ( not ( = ?auto_619414 ?auto_619423 ) ) ( not ( = ?auto_619414 ?auto_619424 ) ) ( not ( = ?auto_619414 ?auto_619425 ) ) ( not ( = ?auto_619414 ?auto_619426 ) ) ( not ( = ?auto_619414 ?auto_619427 ) ) ( not ( = ?auto_619415 ?auto_619416 ) ) ( not ( = ?auto_619415 ?auto_619417 ) ) ( not ( = ?auto_619415 ?auto_619418 ) ) ( not ( = ?auto_619415 ?auto_619419 ) ) ( not ( = ?auto_619415 ?auto_619420 ) ) ( not ( = ?auto_619415 ?auto_619421 ) ) ( not ( = ?auto_619415 ?auto_619422 ) ) ( not ( = ?auto_619415 ?auto_619423 ) ) ( not ( = ?auto_619415 ?auto_619424 ) ) ( not ( = ?auto_619415 ?auto_619425 ) ) ( not ( = ?auto_619415 ?auto_619426 ) ) ( not ( = ?auto_619415 ?auto_619427 ) ) ( not ( = ?auto_619416 ?auto_619417 ) ) ( not ( = ?auto_619416 ?auto_619418 ) ) ( not ( = ?auto_619416 ?auto_619419 ) ) ( not ( = ?auto_619416 ?auto_619420 ) ) ( not ( = ?auto_619416 ?auto_619421 ) ) ( not ( = ?auto_619416 ?auto_619422 ) ) ( not ( = ?auto_619416 ?auto_619423 ) ) ( not ( = ?auto_619416 ?auto_619424 ) ) ( not ( = ?auto_619416 ?auto_619425 ) ) ( not ( = ?auto_619416 ?auto_619426 ) ) ( not ( = ?auto_619416 ?auto_619427 ) ) ( not ( = ?auto_619417 ?auto_619418 ) ) ( not ( = ?auto_619417 ?auto_619419 ) ) ( not ( = ?auto_619417 ?auto_619420 ) ) ( not ( = ?auto_619417 ?auto_619421 ) ) ( not ( = ?auto_619417 ?auto_619422 ) ) ( not ( = ?auto_619417 ?auto_619423 ) ) ( not ( = ?auto_619417 ?auto_619424 ) ) ( not ( = ?auto_619417 ?auto_619425 ) ) ( not ( = ?auto_619417 ?auto_619426 ) ) ( not ( = ?auto_619417 ?auto_619427 ) ) ( not ( = ?auto_619418 ?auto_619419 ) ) ( not ( = ?auto_619418 ?auto_619420 ) ) ( not ( = ?auto_619418 ?auto_619421 ) ) ( not ( = ?auto_619418 ?auto_619422 ) ) ( not ( = ?auto_619418 ?auto_619423 ) ) ( not ( = ?auto_619418 ?auto_619424 ) ) ( not ( = ?auto_619418 ?auto_619425 ) ) ( not ( = ?auto_619418 ?auto_619426 ) ) ( not ( = ?auto_619418 ?auto_619427 ) ) ( not ( = ?auto_619419 ?auto_619420 ) ) ( not ( = ?auto_619419 ?auto_619421 ) ) ( not ( = ?auto_619419 ?auto_619422 ) ) ( not ( = ?auto_619419 ?auto_619423 ) ) ( not ( = ?auto_619419 ?auto_619424 ) ) ( not ( = ?auto_619419 ?auto_619425 ) ) ( not ( = ?auto_619419 ?auto_619426 ) ) ( not ( = ?auto_619419 ?auto_619427 ) ) ( not ( = ?auto_619420 ?auto_619421 ) ) ( not ( = ?auto_619420 ?auto_619422 ) ) ( not ( = ?auto_619420 ?auto_619423 ) ) ( not ( = ?auto_619420 ?auto_619424 ) ) ( not ( = ?auto_619420 ?auto_619425 ) ) ( not ( = ?auto_619420 ?auto_619426 ) ) ( not ( = ?auto_619420 ?auto_619427 ) ) ( not ( = ?auto_619421 ?auto_619422 ) ) ( not ( = ?auto_619421 ?auto_619423 ) ) ( not ( = ?auto_619421 ?auto_619424 ) ) ( not ( = ?auto_619421 ?auto_619425 ) ) ( not ( = ?auto_619421 ?auto_619426 ) ) ( not ( = ?auto_619421 ?auto_619427 ) ) ( not ( = ?auto_619422 ?auto_619423 ) ) ( not ( = ?auto_619422 ?auto_619424 ) ) ( not ( = ?auto_619422 ?auto_619425 ) ) ( not ( = ?auto_619422 ?auto_619426 ) ) ( not ( = ?auto_619422 ?auto_619427 ) ) ( not ( = ?auto_619423 ?auto_619424 ) ) ( not ( = ?auto_619423 ?auto_619425 ) ) ( not ( = ?auto_619423 ?auto_619426 ) ) ( not ( = ?auto_619423 ?auto_619427 ) ) ( not ( = ?auto_619424 ?auto_619425 ) ) ( not ( = ?auto_619424 ?auto_619426 ) ) ( not ( = ?auto_619424 ?auto_619427 ) ) ( not ( = ?auto_619425 ?auto_619426 ) ) ( not ( = ?auto_619425 ?auto_619427 ) ) ( not ( = ?auto_619426 ?auto_619427 ) ) ( ON ?auto_619425 ?auto_619426 ) ( ON ?auto_619424 ?auto_619425 ) ( ON ?auto_619423 ?auto_619424 ) ( ON ?auto_619422 ?auto_619423 ) ( CLEAR ?auto_619420 ) ( ON ?auto_619421 ?auto_619422 ) ( CLEAR ?auto_619421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_619410 ?auto_619411 ?auto_619412 ?auto_619413 ?auto_619414 ?auto_619415 ?auto_619416 ?auto_619417 ?auto_619418 ?auto_619419 ?auto_619420 ?auto_619421 )
      ( MAKE-17PILE ?auto_619410 ?auto_619411 ?auto_619412 ?auto_619413 ?auto_619414 ?auto_619415 ?auto_619416 ?auto_619417 ?auto_619418 ?auto_619419 ?auto_619420 ?auto_619421 ?auto_619422 ?auto_619423 ?auto_619424 ?auto_619425 ?auto_619426 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619445 - BLOCK
      ?auto_619446 - BLOCK
      ?auto_619447 - BLOCK
      ?auto_619448 - BLOCK
      ?auto_619449 - BLOCK
      ?auto_619450 - BLOCK
      ?auto_619451 - BLOCK
      ?auto_619452 - BLOCK
      ?auto_619453 - BLOCK
      ?auto_619454 - BLOCK
      ?auto_619455 - BLOCK
      ?auto_619456 - BLOCK
      ?auto_619457 - BLOCK
      ?auto_619458 - BLOCK
      ?auto_619459 - BLOCK
      ?auto_619460 - BLOCK
      ?auto_619461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_619461 ) ( ON-TABLE ?auto_619445 ) ( ON ?auto_619446 ?auto_619445 ) ( ON ?auto_619447 ?auto_619446 ) ( ON ?auto_619448 ?auto_619447 ) ( ON ?auto_619449 ?auto_619448 ) ( ON ?auto_619450 ?auto_619449 ) ( ON ?auto_619451 ?auto_619450 ) ( ON ?auto_619452 ?auto_619451 ) ( ON ?auto_619453 ?auto_619452 ) ( ON ?auto_619454 ?auto_619453 ) ( ON ?auto_619455 ?auto_619454 ) ( not ( = ?auto_619445 ?auto_619446 ) ) ( not ( = ?auto_619445 ?auto_619447 ) ) ( not ( = ?auto_619445 ?auto_619448 ) ) ( not ( = ?auto_619445 ?auto_619449 ) ) ( not ( = ?auto_619445 ?auto_619450 ) ) ( not ( = ?auto_619445 ?auto_619451 ) ) ( not ( = ?auto_619445 ?auto_619452 ) ) ( not ( = ?auto_619445 ?auto_619453 ) ) ( not ( = ?auto_619445 ?auto_619454 ) ) ( not ( = ?auto_619445 ?auto_619455 ) ) ( not ( = ?auto_619445 ?auto_619456 ) ) ( not ( = ?auto_619445 ?auto_619457 ) ) ( not ( = ?auto_619445 ?auto_619458 ) ) ( not ( = ?auto_619445 ?auto_619459 ) ) ( not ( = ?auto_619445 ?auto_619460 ) ) ( not ( = ?auto_619445 ?auto_619461 ) ) ( not ( = ?auto_619446 ?auto_619447 ) ) ( not ( = ?auto_619446 ?auto_619448 ) ) ( not ( = ?auto_619446 ?auto_619449 ) ) ( not ( = ?auto_619446 ?auto_619450 ) ) ( not ( = ?auto_619446 ?auto_619451 ) ) ( not ( = ?auto_619446 ?auto_619452 ) ) ( not ( = ?auto_619446 ?auto_619453 ) ) ( not ( = ?auto_619446 ?auto_619454 ) ) ( not ( = ?auto_619446 ?auto_619455 ) ) ( not ( = ?auto_619446 ?auto_619456 ) ) ( not ( = ?auto_619446 ?auto_619457 ) ) ( not ( = ?auto_619446 ?auto_619458 ) ) ( not ( = ?auto_619446 ?auto_619459 ) ) ( not ( = ?auto_619446 ?auto_619460 ) ) ( not ( = ?auto_619446 ?auto_619461 ) ) ( not ( = ?auto_619447 ?auto_619448 ) ) ( not ( = ?auto_619447 ?auto_619449 ) ) ( not ( = ?auto_619447 ?auto_619450 ) ) ( not ( = ?auto_619447 ?auto_619451 ) ) ( not ( = ?auto_619447 ?auto_619452 ) ) ( not ( = ?auto_619447 ?auto_619453 ) ) ( not ( = ?auto_619447 ?auto_619454 ) ) ( not ( = ?auto_619447 ?auto_619455 ) ) ( not ( = ?auto_619447 ?auto_619456 ) ) ( not ( = ?auto_619447 ?auto_619457 ) ) ( not ( = ?auto_619447 ?auto_619458 ) ) ( not ( = ?auto_619447 ?auto_619459 ) ) ( not ( = ?auto_619447 ?auto_619460 ) ) ( not ( = ?auto_619447 ?auto_619461 ) ) ( not ( = ?auto_619448 ?auto_619449 ) ) ( not ( = ?auto_619448 ?auto_619450 ) ) ( not ( = ?auto_619448 ?auto_619451 ) ) ( not ( = ?auto_619448 ?auto_619452 ) ) ( not ( = ?auto_619448 ?auto_619453 ) ) ( not ( = ?auto_619448 ?auto_619454 ) ) ( not ( = ?auto_619448 ?auto_619455 ) ) ( not ( = ?auto_619448 ?auto_619456 ) ) ( not ( = ?auto_619448 ?auto_619457 ) ) ( not ( = ?auto_619448 ?auto_619458 ) ) ( not ( = ?auto_619448 ?auto_619459 ) ) ( not ( = ?auto_619448 ?auto_619460 ) ) ( not ( = ?auto_619448 ?auto_619461 ) ) ( not ( = ?auto_619449 ?auto_619450 ) ) ( not ( = ?auto_619449 ?auto_619451 ) ) ( not ( = ?auto_619449 ?auto_619452 ) ) ( not ( = ?auto_619449 ?auto_619453 ) ) ( not ( = ?auto_619449 ?auto_619454 ) ) ( not ( = ?auto_619449 ?auto_619455 ) ) ( not ( = ?auto_619449 ?auto_619456 ) ) ( not ( = ?auto_619449 ?auto_619457 ) ) ( not ( = ?auto_619449 ?auto_619458 ) ) ( not ( = ?auto_619449 ?auto_619459 ) ) ( not ( = ?auto_619449 ?auto_619460 ) ) ( not ( = ?auto_619449 ?auto_619461 ) ) ( not ( = ?auto_619450 ?auto_619451 ) ) ( not ( = ?auto_619450 ?auto_619452 ) ) ( not ( = ?auto_619450 ?auto_619453 ) ) ( not ( = ?auto_619450 ?auto_619454 ) ) ( not ( = ?auto_619450 ?auto_619455 ) ) ( not ( = ?auto_619450 ?auto_619456 ) ) ( not ( = ?auto_619450 ?auto_619457 ) ) ( not ( = ?auto_619450 ?auto_619458 ) ) ( not ( = ?auto_619450 ?auto_619459 ) ) ( not ( = ?auto_619450 ?auto_619460 ) ) ( not ( = ?auto_619450 ?auto_619461 ) ) ( not ( = ?auto_619451 ?auto_619452 ) ) ( not ( = ?auto_619451 ?auto_619453 ) ) ( not ( = ?auto_619451 ?auto_619454 ) ) ( not ( = ?auto_619451 ?auto_619455 ) ) ( not ( = ?auto_619451 ?auto_619456 ) ) ( not ( = ?auto_619451 ?auto_619457 ) ) ( not ( = ?auto_619451 ?auto_619458 ) ) ( not ( = ?auto_619451 ?auto_619459 ) ) ( not ( = ?auto_619451 ?auto_619460 ) ) ( not ( = ?auto_619451 ?auto_619461 ) ) ( not ( = ?auto_619452 ?auto_619453 ) ) ( not ( = ?auto_619452 ?auto_619454 ) ) ( not ( = ?auto_619452 ?auto_619455 ) ) ( not ( = ?auto_619452 ?auto_619456 ) ) ( not ( = ?auto_619452 ?auto_619457 ) ) ( not ( = ?auto_619452 ?auto_619458 ) ) ( not ( = ?auto_619452 ?auto_619459 ) ) ( not ( = ?auto_619452 ?auto_619460 ) ) ( not ( = ?auto_619452 ?auto_619461 ) ) ( not ( = ?auto_619453 ?auto_619454 ) ) ( not ( = ?auto_619453 ?auto_619455 ) ) ( not ( = ?auto_619453 ?auto_619456 ) ) ( not ( = ?auto_619453 ?auto_619457 ) ) ( not ( = ?auto_619453 ?auto_619458 ) ) ( not ( = ?auto_619453 ?auto_619459 ) ) ( not ( = ?auto_619453 ?auto_619460 ) ) ( not ( = ?auto_619453 ?auto_619461 ) ) ( not ( = ?auto_619454 ?auto_619455 ) ) ( not ( = ?auto_619454 ?auto_619456 ) ) ( not ( = ?auto_619454 ?auto_619457 ) ) ( not ( = ?auto_619454 ?auto_619458 ) ) ( not ( = ?auto_619454 ?auto_619459 ) ) ( not ( = ?auto_619454 ?auto_619460 ) ) ( not ( = ?auto_619454 ?auto_619461 ) ) ( not ( = ?auto_619455 ?auto_619456 ) ) ( not ( = ?auto_619455 ?auto_619457 ) ) ( not ( = ?auto_619455 ?auto_619458 ) ) ( not ( = ?auto_619455 ?auto_619459 ) ) ( not ( = ?auto_619455 ?auto_619460 ) ) ( not ( = ?auto_619455 ?auto_619461 ) ) ( not ( = ?auto_619456 ?auto_619457 ) ) ( not ( = ?auto_619456 ?auto_619458 ) ) ( not ( = ?auto_619456 ?auto_619459 ) ) ( not ( = ?auto_619456 ?auto_619460 ) ) ( not ( = ?auto_619456 ?auto_619461 ) ) ( not ( = ?auto_619457 ?auto_619458 ) ) ( not ( = ?auto_619457 ?auto_619459 ) ) ( not ( = ?auto_619457 ?auto_619460 ) ) ( not ( = ?auto_619457 ?auto_619461 ) ) ( not ( = ?auto_619458 ?auto_619459 ) ) ( not ( = ?auto_619458 ?auto_619460 ) ) ( not ( = ?auto_619458 ?auto_619461 ) ) ( not ( = ?auto_619459 ?auto_619460 ) ) ( not ( = ?auto_619459 ?auto_619461 ) ) ( not ( = ?auto_619460 ?auto_619461 ) ) ( ON ?auto_619460 ?auto_619461 ) ( ON ?auto_619459 ?auto_619460 ) ( ON ?auto_619458 ?auto_619459 ) ( ON ?auto_619457 ?auto_619458 ) ( CLEAR ?auto_619455 ) ( ON ?auto_619456 ?auto_619457 ) ( CLEAR ?auto_619456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_619445 ?auto_619446 ?auto_619447 ?auto_619448 ?auto_619449 ?auto_619450 ?auto_619451 ?auto_619452 ?auto_619453 ?auto_619454 ?auto_619455 ?auto_619456 )
      ( MAKE-17PILE ?auto_619445 ?auto_619446 ?auto_619447 ?auto_619448 ?auto_619449 ?auto_619450 ?auto_619451 ?auto_619452 ?auto_619453 ?auto_619454 ?auto_619455 ?auto_619456 ?auto_619457 ?auto_619458 ?auto_619459 ?auto_619460 ?auto_619461 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619479 - BLOCK
      ?auto_619480 - BLOCK
      ?auto_619481 - BLOCK
      ?auto_619482 - BLOCK
      ?auto_619483 - BLOCK
      ?auto_619484 - BLOCK
      ?auto_619485 - BLOCK
      ?auto_619486 - BLOCK
      ?auto_619487 - BLOCK
      ?auto_619488 - BLOCK
      ?auto_619489 - BLOCK
      ?auto_619490 - BLOCK
      ?auto_619491 - BLOCK
      ?auto_619492 - BLOCK
      ?auto_619493 - BLOCK
      ?auto_619494 - BLOCK
      ?auto_619495 - BLOCK
    )
    :vars
    (
      ?auto_619496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619495 ?auto_619496 ) ( ON-TABLE ?auto_619479 ) ( ON ?auto_619480 ?auto_619479 ) ( ON ?auto_619481 ?auto_619480 ) ( ON ?auto_619482 ?auto_619481 ) ( ON ?auto_619483 ?auto_619482 ) ( ON ?auto_619484 ?auto_619483 ) ( ON ?auto_619485 ?auto_619484 ) ( ON ?auto_619486 ?auto_619485 ) ( ON ?auto_619487 ?auto_619486 ) ( ON ?auto_619488 ?auto_619487 ) ( not ( = ?auto_619479 ?auto_619480 ) ) ( not ( = ?auto_619479 ?auto_619481 ) ) ( not ( = ?auto_619479 ?auto_619482 ) ) ( not ( = ?auto_619479 ?auto_619483 ) ) ( not ( = ?auto_619479 ?auto_619484 ) ) ( not ( = ?auto_619479 ?auto_619485 ) ) ( not ( = ?auto_619479 ?auto_619486 ) ) ( not ( = ?auto_619479 ?auto_619487 ) ) ( not ( = ?auto_619479 ?auto_619488 ) ) ( not ( = ?auto_619479 ?auto_619489 ) ) ( not ( = ?auto_619479 ?auto_619490 ) ) ( not ( = ?auto_619479 ?auto_619491 ) ) ( not ( = ?auto_619479 ?auto_619492 ) ) ( not ( = ?auto_619479 ?auto_619493 ) ) ( not ( = ?auto_619479 ?auto_619494 ) ) ( not ( = ?auto_619479 ?auto_619495 ) ) ( not ( = ?auto_619479 ?auto_619496 ) ) ( not ( = ?auto_619480 ?auto_619481 ) ) ( not ( = ?auto_619480 ?auto_619482 ) ) ( not ( = ?auto_619480 ?auto_619483 ) ) ( not ( = ?auto_619480 ?auto_619484 ) ) ( not ( = ?auto_619480 ?auto_619485 ) ) ( not ( = ?auto_619480 ?auto_619486 ) ) ( not ( = ?auto_619480 ?auto_619487 ) ) ( not ( = ?auto_619480 ?auto_619488 ) ) ( not ( = ?auto_619480 ?auto_619489 ) ) ( not ( = ?auto_619480 ?auto_619490 ) ) ( not ( = ?auto_619480 ?auto_619491 ) ) ( not ( = ?auto_619480 ?auto_619492 ) ) ( not ( = ?auto_619480 ?auto_619493 ) ) ( not ( = ?auto_619480 ?auto_619494 ) ) ( not ( = ?auto_619480 ?auto_619495 ) ) ( not ( = ?auto_619480 ?auto_619496 ) ) ( not ( = ?auto_619481 ?auto_619482 ) ) ( not ( = ?auto_619481 ?auto_619483 ) ) ( not ( = ?auto_619481 ?auto_619484 ) ) ( not ( = ?auto_619481 ?auto_619485 ) ) ( not ( = ?auto_619481 ?auto_619486 ) ) ( not ( = ?auto_619481 ?auto_619487 ) ) ( not ( = ?auto_619481 ?auto_619488 ) ) ( not ( = ?auto_619481 ?auto_619489 ) ) ( not ( = ?auto_619481 ?auto_619490 ) ) ( not ( = ?auto_619481 ?auto_619491 ) ) ( not ( = ?auto_619481 ?auto_619492 ) ) ( not ( = ?auto_619481 ?auto_619493 ) ) ( not ( = ?auto_619481 ?auto_619494 ) ) ( not ( = ?auto_619481 ?auto_619495 ) ) ( not ( = ?auto_619481 ?auto_619496 ) ) ( not ( = ?auto_619482 ?auto_619483 ) ) ( not ( = ?auto_619482 ?auto_619484 ) ) ( not ( = ?auto_619482 ?auto_619485 ) ) ( not ( = ?auto_619482 ?auto_619486 ) ) ( not ( = ?auto_619482 ?auto_619487 ) ) ( not ( = ?auto_619482 ?auto_619488 ) ) ( not ( = ?auto_619482 ?auto_619489 ) ) ( not ( = ?auto_619482 ?auto_619490 ) ) ( not ( = ?auto_619482 ?auto_619491 ) ) ( not ( = ?auto_619482 ?auto_619492 ) ) ( not ( = ?auto_619482 ?auto_619493 ) ) ( not ( = ?auto_619482 ?auto_619494 ) ) ( not ( = ?auto_619482 ?auto_619495 ) ) ( not ( = ?auto_619482 ?auto_619496 ) ) ( not ( = ?auto_619483 ?auto_619484 ) ) ( not ( = ?auto_619483 ?auto_619485 ) ) ( not ( = ?auto_619483 ?auto_619486 ) ) ( not ( = ?auto_619483 ?auto_619487 ) ) ( not ( = ?auto_619483 ?auto_619488 ) ) ( not ( = ?auto_619483 ?auto_619489 ) ) ( not ( = ?auto_619483 ?auto_619490 ) ) ( not ( = ?auto_619483 ?auto_619491 ) ) ( not ( = ?auto_619483 ?auto_619492 ) ) ( not ( = ?auto_619483 ?auto_619493 ) ) ( not ( = ?auto_619483 ?auto_619494 ) ) ( not ( = ?auto_619483 ?auto_619495 ) ) ( not ( = ?auto_619483 ?auto_619496 ) ) ( not ( = ?auto_619484 ?auto_619485 ) ) ( not ( = ?auto_619484 ?auto_619486 ) ) ( not ( = ?auto_619484 ?auto_619487 ) ) ( not ( = ?auto_619484 ?auto_619488 ) ) ( not ( = ?auto_619484 ?auto_619489 ) ) ( not ( = ?auto_619484 ?auto_619490 ) ) ( not ( = ?auto_619484 ?auto_619491 ) ) ( not ( = ?auto_619484 ?auto_619492 ) ) ( not ( = ?auto_619484 ?auto_619493 ) ) ( not ( = ?auto_619484 ?auto_619494 ) ) ( not ( = ?auto_619484 ?auto_619495 ) ) ( not ( = ?auto_619484 ?auto_619496 ) ) ( not ( = ?auto_619485 ?auto_619486 ) ) ( not ( = ?auto_619485 ?auto_619487 ) ) ( not ( = ?auto_619485 ?auto_619488 ) ) ( not ( = ?auto_619485 ?auto_619489 ) ) ( not ( = ?auto_619485 ?auto_619490 ) ) ( not ( = ?auto_619485 ?auto_619491 ) ) ( not ( = ?auto_619485 ?auto_619492 ) ) ( not ( = ?auto_619485 ?auto_619493 ) ) ( not ( = ?auto_619485 ?auto_619494 ) ) ( not ( = ?auto_619485 ?auto_619495 ) ) ( not ( = ?auto_619485 ?auto_619496 ) ) ( not ( = ?auto_619486 ?auto_619487 ) ) ( not ( = ?auto_619486 ?auto_619488 ) ) ( not ( = ?auto_619486 ?auto_619489 ) ) ( not ( = ?auto_619486 ?auto_619490 ) ) ( not ( = ?auto_619486 ?auto_619491 ) ) ( not ( = ?auto_619486 ?auto_619492 ) ) ( not ( = ?auto_619486 ?auto_619493 ) ) ( not ( = ?auto_619486 ?auto_619494 ) ) ( not ( = ?auto_619486 ?auto_619495 ) ) ( not ( = ?auto_619486 ?auto_619496 ) ) ( not ( = ?auto_619487 ?auto_619488 ) ) ( not ( = ?auto_619487 ?auto_619489 ) ) ( not ( = ?auto_619487 ?auto_619490 ) ) ( not ( = ?auto_619487 ?auto_619491 ) ) ( not ( = ?auto_619487 ?auto_619492 ) ) ( not ( = ?auto_619487 ?auto_619493 ) ) ( not ( = ?auto_619487 ?auto_619494 ) ) ( not ( = ?auto_619487 ?auto_619495 ) ) ( not ( = ?auto_619487 ?auto_619496 ) ) ( not ( = ?auto_619488 ?auto_619489 ) ) ( not ( = ?auto_619488 ?auto_619490 ) ) ( not ( = ?auto_619488 ?auto_619491 ) ) ( not ( = ?auto_619488 ?auto_619492 ) ) ( not ( = ?auto_619488 ?auto_619493 ) ) ( not ( = ?auto_619488 ?auto_619494 ) ) ( not ( = ?auto_619488 ?auto_619495 ) ) ( not ( = ?auto_619488 ?auto_619496 ) ) ( not ( = ?auto_619489 ?auto_619490 ) ) ( not ( = ?auto_619489 ?auto_619491 ) ) ( not ( = ?auto_619489 ?auto_619492 ) ) ( not ( = ?auto_619489 ?auto_619493 ) ) ( not ( = ?auto_619489 ?auto_619494 ) ) ( not ( = ?auto_619489 ?auto_619495 ) ) ( not ( = ?auto_619489 ?auto_619496 ) ) ( not ( = ?auto_619490 ?auto_619491 ) ) ( not ( = ?auto_619490 ?auto_619492 ) ) ( not ( = ?auto_619490 ?auto_619493 ) ) ( not ( = ?auto_619490 ?auto_619494 ) ) ( not ( = ?auto_619490 ?auto_619495 ) ) ( not ( = ?auto_619490 ?auto_619496 ) ) ( not ( = ?auto_619491 ?auto_619492 ) ) ( not ( = ?auto_619491 ?auto_619493 ) ) ( not ( = ?auto_619491 ?auto_619494 ) ) ( not ( = ?auto_619491 ?auto_619495 ) ) ( not ( = ?auto_619491 ?auto_619496 ) ) ( not ( = ?auto_619492 ?auto_619493 ) ) ( not ( = ?auto_619492 ?auto_619494 ) ) ( not ( = ?auto_619492 ?auto_619495 ) ) ( not ( = ?auto_619492 ?auto_619496 ) ) ( not ( = ?auto_619493 ?auto_619494 ) ) ( not ( = ?auto_619493 ?auto_619495 ) ) ( not ( = ?auto_619493 ?auto_619496 ) ) ( not ( = ?auto_619494 ?auto_619495 ) ) ( not ( = ?auto_619494 ?auto_619496 ) ) ( not ( = ?auto_619495 ?auto_619496 ) ) ( ON ?auto_619494 ?auto_619495 ) ( ON ?auto_619493 ?auto_619494 ) ( ON ?auto_619492 ?auto_619493 ) ( ON ?auto_619491 ?auto_619492 ) ( ON ?auto_619490 ?auto_619491 ) ( CLEAR ?auto_619488 ) ( ON ?auto_619489 ?auto_619490 ) ( CLEAR ?auto_619489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_619479 ?auto_619480 ?auto_619481 ?auto_619482 ?auto_619483 ?auto_619484 ?auto_619485 ?auto_619486 ?auto_619487 ?auto_619488 ?auto_619489 )
      ( MAKE-17PILE ?auto_619479 ?auto_619480 ?auto_619481 ?auto_619482 ?auto_619483 ?auto_619484 ?auto_619485 ?auto_619486 ?auto_619487 ?auto_619488 ?auto_619489 ?auto_619490 ?auto_619491 ?auto_619492 ?auto_619493 ?auto_619494 ?auto_619495 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619514 - BLOCK
      ?auto_619515 - BLOCK
      ?auto_619516 - BLOCK
      ?auto_619517 - BLOCK
      ?auto_619518 - BLOCK
      ?auto_619519 - BLOCK
      ?auto_619520 - BLOCK
      ?auto_619521 - BLOCK
      ?auto_619522 - BLOCK
      ?auto_619523 - BLOCK
      ?auto_619524 - BLOCK
      ?auto_619525 - BLOCK
      ?auto_619526 - BLOCK
      ?auto_619527 - BLOCK
      ?auto_619528 - BLOCK
      ?auto_619529 - BLOCK
      ?auto_619530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_619530 ) ( ON-TABLE ?auto_619514 ) ( ON ?auto_619515 ?auto_619514 ) ( ON ?auto_619516 ?auto_619515 ) ( ON ?auto_619517 ?auto_619516 ) ( ON ?auto_619518 ?auto_619517 ) ( ON ?auto_619519 ?auto_619518 ) ( ON ?auto_619520 ?auto_619519 ) ( ON ?auto_619521 ?auto_619520 ) ( ON ?auto_619522 ?auto_619521 ) ( ON ?auto_619523 ?auto_619522 ) ( not ( = ?auto_619514 ?auto_619515 ) ) ( not ( = ?auto_619514 ?auto_619516 ) ) ( not ( = ?auto_619514 ?auto_619517 ) ) ( not ( = ?auto_619514 ?auto_619518 ) ) ( not ( = ?auto_619514 ?auto_619519 ) ) ( not ( = ?auto_619514 ?auto_619520 ) ) ( not ( = ?auto_619514 ?auto_619521 ) ) ( not ( = ?auto_619514 ?auto_619522 ) ) ( not ( = ?auto_619514 ?auto_619523 ) ) ( not ( = ?auto_619514 ?auto_619524 ) ) ( not ( = ?auto_619514 ?auto_619525 ) ) ( not ( = ?auto_619514 ?auto_619526 ) ) ( not ( = ?auto_619514 ?auto_619527 ) ) ( not ( = ?auto_619514 ?auto_619528 ) ) ( not ( = ?auto_619514 ?auto_619529 ) ) ( not ( = ?auto_619514 ?auto_619530 ) ) ( not ( = ?auto_619515 ?auto_619516 ) ) ( not ( = ?auto_619515 ?auto_619517 ) ) ( not ( = ?auto_619515 ?auto_619518 ) ) ( not ( = ?auto_619515 ?auto_619519 ) ) ( not ( = ?auto_619515 ?auto_619520 ) ) ( not ( = ?auto_619515 ?auto_619521 ) ) ( not ( = ?auto_619515 ?auto_619522 ) ) ( not ( = ?auto_619515 ?auto_619523 ) ) ( not ( = ?auto_619515 ?auto_619524 ) ) ( not ( = ?auto_619515 ?auto_619525 ) ) ( not ( = ?auto_619515 ?auto_619526 ) ) ( not ( = ?auto_619515 ?auto_619527 ) ) ( not ( = ?auto_619515 ?auto_619528 ) ) ( not ( = ?auto_619515 ?auto_619529 ) ) ( not ( = ?auto_619515 ?auto_619530 ) ) ( not ( = ?auto_619516 ?auto_619517 ) ) ( not ( = ?auto_619516 ?auto_619518 ) ) ( not ( = ?auto_619516 ?auto_619519 ) ) ( not ( = ?auto_619516 ?auto_619520 ) ) ( not ( = ?auto_619516 ?auto_619521 ) ) ( not ( = ?auto_619516 ?auto_619522 ) ) ( not ( = ?auto_619516 ?auto_619523 ) ) ( not ( = ?auto_619516 ?auto_619524 ) ) ( not ( = ?auto_619516 ?auto_619525 ) ) ( not ( = ?auto_619516 ?auto_619526 ) ) ( not ( = ?auto_619516 ?auto_619527 ) ) ( not ( = ?auto_619516 ?auto_619528 ) ) ( not ( = ?auto_619516 ?auto_619529 ) ) ( not ( = ?auto_619516 ?auto_619530 ) ) ( not ( = ?auto_619517 ?auto_619518 ) ) ( not ( = ?auto_619517 ?auto_619519 ) ) ( not ( = ?auto_619517 ?auto_619520 ) ) ( not ( = ?auto_619517 ?auto_619521 ) ) ( not ( = ?auto_619517 ?auto_619522 ) ) ( not ( = ?auto_619517 ?auto_619523 ) ) ( not ( = ?auto_619517 ?auto_619524 ) ) ( not ( = ?auto_619517 ?auto_619525 ) ) ( not ( = ?auto_619517 ?auto_619526 ) ) ( not ( = ?auto_619517 ?auto_619527 ) ) ( not ( = ?auto_619517 ?auto_619528 ) ) ( not ( = ?auto_619517 ?auto_619529 ) ) ( not ( = ?auto_619517 ?auto_619530 ) ) ( not ( = ?auto_619518 ?auto_619519 ) ) ( not ( = ?auto_619518 ?auto_619520 ) ) ( not ( = ?auto_619518 ?auto_619521 ) ) ( not ( = ?auto_619518 ?auto_619522 ) ) ( not ( = ?auto_619518 ?auto_619523 ) ) ( not ( = ?auto_619518 ?auto_619524 ) ) ( not ( = ?auto_619518 ?auto_619525 ) ) ( not ( = ?auto_619518 ?auto_619526 ) ) ( not ( = ?auto_619518 ?auto_619527 ) ) ( not ( = ?auto_619518 ?auto_619528 ) ) ( not ( = ?auto_619518 ?auto_619529 ) ) ( not ( = ?auto_619518 ?auto_619530 ) ) ( not ( = ?auto_619519 ?auto_619520 ) ) ( not ( = ?auto_619519 ?auto_619521 ) ) ( not ( = ?auto_619519 ?auto_619522 ) ) ( not ( = ?auto_619519 ?auto_619523 ) ) ( not ( = ?auto_619519 ?auto_619524 ) ) ( not ( = ?auto_619519 ?auto_619525 ) ) ( not ( = ?auto_619519 ?auto_619526 ) ) ( not ( = ?auto_619519 ?auto_619527 ) ) ( not ( = ?auto_619519 ?auto_619528 ) ) ( not ( = ?auto_619519 ?auto_619529 ) ) ( not ( = ?auto_619519 ?auto_619530 ) ) ( not ( = ?auto_619520 ?auto_619521 ) ) ( not ( = ?auto_619520 ?auto_619522 ) ) ( not ( = ?auto_619520 ?auto_619523 ) ) ( not ( = ?auto_619520 ?auto_619524 ) ) ( not ( = ?auto_619520 ?auto_619525 ) ) ( not ( = ?auto_619520 ?auto_619526 ) ) ( not ( = ?auto_619520 ?auto_619527 ) ) ( not ( = ?auto_619520 ?auto_619528 ) ) ( not ( = ?auto_619520 ?auto_619529 ) ) ( not ( = ?auto_619520 ?auto_619530 ) ) ( not ( = ?auto_619521 ?auto_619522 ) ) ( not ( = ?auto_619521 ?auto_619523 ) ) ( not ( = ?auto_619521 ?auto_619524 ) ) ( not ( = ?auto_619521 ?auto_619525 ) ) ( not ( = ?auto_619521 ?auto_619526 ) ) ( not ( = ?auto_619521 ?auto_619527 ) ) ( not ( = ?auto_619521 ?auto_619528 ) ) ( not ( = ?auto_619521 ?auto_619529 ) ) ( not ( = ?auto_619521 ?auto_619530 ) ) ( not ( = ?auto_619522 ?auto_619523 ) ) ( not ( = ?auto_619522 ?auto_619524 ) ) ( not ( = ?auto_619522 ?auto_619525 ) ) ( not ( = ?auto_619522 ?auto_619526 ) ) ( not ( = ?auto_619522 ?auto_619527 ) ) ( not ( = ?auto_619522 ?auto_619528 ) ) ( not ( = ?auto_619522 ?auto_619529 ) ) ( not ( = ?auto_619522 ?auto_619530 ) ) ( not ( = ?auto_619523 ?auto_619524 ) ) ( not ( = ?auto_619523 ?auto_619525 ) ) ( not ( = ?auto_619523 ?auto_619526 ) ) ( not ( = ?auto_619523 ?auto_619527 ) ) ( not ( = ?auto_619523 ?auto_619528 ) ) ( not ( = ?auto_619523 ?auto_619529 ) ) ( not ( = ?auto_619523 ?auto_619530 ) ) ( not ( = ?auto_619524 ?auto_619525 ) ) ( not ( = ?auto_619524 ?auto_619526 ) ) ( not ( = ?auto_619524 ?auto_619527 ) ) ( not ( = ?auto_619524 ?auto_619528 ) ) ( not ( = ?auto_619524 ?auto_619529 ) ) ( not ( = ?auto_619524 ?auto_619530 ) ) ( not ( = ?auto_619525 ?auto_619526 ) ) ( not ( = ?auto_619525 ?auto_619527 ) ) ( not ( = ?auto_619525 ?auto_619528 ) ) ( not ( = ?auto_619525 ?auto_619529 ) ) ( not ( = ?auto_619525 ?auto_619530 ) ) ( not ( = ?auto_619526 ?auto_619527 ) ) ( not ( = ?auto_619526 ?auto_619528 ) ) ( not ( = ?auto_619526 ?auto_619529 ) ) ( not ( = ?auto_619526 ?auto_619530 ) ) ( not ( = ?auto_619527 ?auto_619528 ) ) ( not ( = ?auto_619527 ?auto_619529 ) ) ( not ( = ?auto_619527 ?auto_619530 ) ) ( not ( = ?auto_619528 ?auto_619529 ) ) ( not ( = ?auto_619528 ?auto_619530 ) ) ( not ( = ?auto_619529 ?auto_619530 ) ) ( ON ?auto_619529 ?auto_619530 ) ( ON ?auto_619528 ?auto_619529 ) ( ON ?auto_619527 ?auto_619528 ) ( ON ?auto_619526 ?auto_619527 ) ( ON ?auto_619525 ?auto_619526 ) ( CLEAR ?auto_619523 ) ( ON ?auto_619524 ?auto_619525 ) ( CLEAR ?auto_619524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_619514 ?auto_619515 ?auto_619516 ?auto_619517 ?auto_619518 ?auto_619519 ?auto_619520 ?auto_619521 ?auto_619522 ?auto_619523 ?auto_619524 )
      ( MAKE-17PILE ?auto_619514 ?auto_619515 ?auto_619516 ?auto_619517 ?auto_619518 ?auto_619519 ?auto_619520 ?auto_619521 ?auto_619522 ?auto_619523 ?auto_619524 ?auto_619525 ?auto_619526 ?auto_619527 ?auto_619528 ?auto_619529 ?auto_619530 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619548 - BLOCK
      ?auto_619549 - BLOCK
      ?auto_619550 - BLOCK
      ?auto_619551 - BLOCK
      ?auto_619552 - BLOCK
      ?auto_619553 - BLOCK
      ?auto_619554 - BLOCK
      ?auto_619555 - BLOCK
      ?auto_619556 - BLOCK
      ?auto_619557 - BLOCK
      ?auto_619558 - BLOCK
      ?auto_619559 - BLOCK
      ?auto_619560 - BLOCK
      ?auto_619561 - BLOCK
      ?auto_619562 - BLOCK
      ?auto_619563 - BLOCK
      ?auto_619564 - BLOCK
    )
    :vars
    (
      ?auto_619565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619564 ?auto_619565 ) ( ON-TABLE ?auto_619548 ) ( ON ?auto_619549 ?auto_619548 ) ( ON ?auto_619550 ?auto_619549 ) ( ON ?auto_619551 ?auto_619550 ) ( ON ?auto_619552 ?auto_619551 ) ( ON ?auto_619553 ?auto_619552 ) ( ON ?auto_619554 ?auto_619553 ) ( ON ?auto_619555 ?auto_619554 ) ( ON ?auto_619556 ?auto_619555 ) ( not ( = ?auto_619548 ?auto_619549 ) ) ( not ( = ?auto_619548 ?auto_619550 ) ) ( not ( = ?auto_619548 ?auto_619551 ) ) ( not ( = ?auto_619548 ?auto_619552 ) ) ( not ( = ?auto_619548 ?auto_619553 ) ) ( not ( = ?auto_619548 ?auto_619554 ) ) ( not ( = ?auto_619548 ?auto_619555 ) ) ( not ( = ?auto_619548 ?auto_619556 ) ) ( not ( = ?auto_619548 ?auto_619557 ) ) ( not ( = ?auto_619548 ?auto_619558 ) ) ( not ( = ?auto_619548 ?auto_619559 ) ) ( not ( = ?auto_619548 ?auto_619560 ) ) ( not ( = ?auto_619548 ?auto_619561 ) ) ( not ( = ?auto_619548 ?auto_619562 ) ) ( not ( = ?auto_619548 ?auto_619563 ) ) ( not ( = ?auto_619548 ?auto_619564 ) ) ( not ( = ?auto_619548 ?auto_619565 ) ) ( not ( = ?auto_619549 ?auto_619550 ) ) ( not ( = ?auto_619549 ?auto_619551 ) ) ( not ( = ?auto_619549 ?auto_619552 ) ) ( not ( = ?auto_619549 ?auto_619553 ) ) ( not ( = ?auto_619549 ?auto_619554 ) ) ( not ( = ?auto_619549 ?auto_619555 ) ) ( not ( = ?auto_619549 ?auto_619556 ) ) ( not ( = ?auto_619549 ?auto_619557 ) ) ( not ( = ?auto_619549 ?auto_619558 ) ) ( not ( = ?auto_619549 ?auto_619559 ) ) ( not ( = ?auto_619549 ?auto_619560 ) ) ( not ( = ?auto_619549 ?auto_619561 ) ) ( not ( = ?auto_619549 ?auto_619562 ) ) ( not ( = ?auto_619549 ?auto_619563 ) ) ( not ( = ?auto_619549 ?auto_619564 ) ) ( not ( = ?auto_619549 ?auto_619565 ) ) ( not ( = ?auto_619550 ?auto_619551 ) ) ( not ( = ?auto_619550 ?auto_619552 ) ) ( not ( = ?auto_619550 ?auto_619553 ) ) ( not ( = ?auto_619550 ?auto_619554 ) ) ( not ( = ?auto_619550 ?auto_619555 ) ) ( not ( = ?auto_619550 ?auto_619556 ) ) ( not ( = ?auto_619550 ?auto_619557 ) ) ( not ( = ?auto_619550 ?auto_619558 ) ) ( not ( = ?auto_619550 ?auto_619559 ) ) ( not ( = ?auto_619550 ?auto_619560 ) ) ( not ( = ?auto_619550 ?auto_619561 ) ) ( not ( = ?auto_619550 ?auto_619562 ) ) ( not ( = ?auto_619550 ?auto_619563 ) ) ( not ( = ?auto_619550 ?auto_619564 ) ) ( not ( = ?auto_619550 ?auto_619565 ) ) ( not ( = ?auto_619551 ?auto_619552 ) ) ( not ( = ?auto_619551 ?auto_619553 ) ) ( not ( = ?auto_619551 ?auto_619554 ) ) ( not ( = ?auto_619551 ?auto_619555 ) ) ( not ( = ?auto_619551 ?auto_619556 ) ) ( not ( = ?auto_619551 ?auto_619557 ) ) ( not ( = ?auto_619551 ?auto_619558 ) ) ( not ( = ?auto_619551 ?auto_619559 ) ) ( not ( = ?auto_619551 ?auto_619560 ) ) ( not ( = ?auto_619551 ?auto_619561 ) ) ( not ( = ?auto_619551 ?auto_619562 ) ) ( not ( = ?auto_619551 ?auto_619563 ) ) ( not ( = ?auto_619551 ?auto_619564 ) ) ( not ( = ?auto_619551 ?auto_619565 ) ) ( not ( = ?auto_619552 ?auto_619553 ) ) ( not ( = ?auto_619552 ?auto_619554 ) ) ( not ( = ?auto_619552 ?auto_619555 ) ) ( not ( = ?auto_619552 ?auto_619556 ) ) ( not ( = ?auto_619552 ?auto_619557 ) ) ( not ( = ?auto_619552 ?auto_619558 ) ) ( not ( = ?auto_619552 ?auto_619559 ) ) ( not ( = ?auto_619552 ?auto_619560 ) ) ( not ( = ?auto_619552 ?auto_619561 ) ) ( not ( = ?auto_619552 ?auto_619562 ) ) ( not ( = ?auto_619552 ?auto_619563 ) ) ( not ( = ?auto_619552 ?auto_619564 ) ) ( not ( = ?auto_619552 ?auto_619565 ) ) ( not ( = ?auto_619553 ?auto_619554 ) ) ( not ( = ?auto_619553 ?auto_619555 ) ) ( not ( = ?auto_619553 ?auto_619556 ) ) ( not ( = ?auto_619553 ?auto_619557 ) ) ( not ( = ?auto_619553 ?auto_619558 ) ) ( not ( = ?auto_619553 ?auto_619559 ) ) ( not ( = ?auto_619553 ?auto_619560 ) ) ( not ( = ?auto_619553 ?auto_619561 ) ) ( not ( = ?auto_619553 ?auto_619562 ) ) ( not ( = ?auto_619553 ?auto_619563 ) ) ( not ( = ?auto_619553 ?auto_619564 ) ) ( not ( = ?auto_619553 ?auto_619565 ) ) ( not ( = ?auto_619554 ?auto_619555 ) ) ( not ( = ?auto_619554 ?auto_619556 ) ) ( not ( = ?auto_619554 ?auto_619557 ) ) ( not ( = ?auto_619554 ?auto_619558 ) ) ( not ( = ?auto_619554 ?auto_619559 ) ) ( not ( = ?auto_619554 ?auto_619560 ) ) ( not ( = ?auto_619554 ?auto_619561 ) ) ( not ( = ?auto_619554 ?auto_619562 ) ) ( not ( = ?auto_619554 ?auto_619563 ) ) ( not ( = ?auto_619554 ?auto_619564 ) ) ( not ( = ?auto_619554 ?auto_619565 ) ) ( not ( = ?auto_619555 ?auto_619556 ) ) ( not ( = ?auto_619555 ?auto_619557 ) ) ( not ( = ?auto_619555 ?auto_619558 ) ) ( not ( = ?auto_619555 ?auto_619559 ) ) ( not ( = ?auto_619555 ?auto_619560 ) ) ( not ( = ?auto_619555 ?auto_619561 ) ) ( not ( = ?auto_619555 ?auto_619562 ) ) ( not ( = ?auto_619555 ?auto_619563 ) ) ( not ( = ?auto_619555 ?auto_619564 ) ) ( not ( = ?auto_619555 ?auto_619565 ) ) ( not ( = ?auto_619556 ?auto_619557 ) ) ( not ( = ?auto_619556 ?auto_619558 ) ) ( not ( = ?auto_619556 ?auto_619559 ) ) ( not ( = ?auto_619556 ?auto_619560 ) ) ( not ( = ?auto_619556 ?auto_619561 ) ) ( not ( = ?auto_619556 ?auto_619562 ) ) ( not ( = ?auto_619556 ?auto_619563 ) ) ( not ( = ?auto_619556 ?auto_619564 ) ) ( not ( = ?auto_619556 ?auto_619565 ) ) ( not ( = ?auto_619557 ?auto_619558 ) ) ( not ( = ?auto_619557 ?auto_619559 ) ) ( not ( = ?auto_619557 ?auto_619560 ) ) ( not ( = ?auto_619557 ?auto_619561 ) ) ( not ( = ?auto_619557 ?auto_619562 ) ) ( not ( = ?auto_619557 ?auto_619563 ) ) ( not ( = ?auto_619557 ?auto_619564 ) ) ( not ( = ?auto_619557 ?auto_619565 ) ) ( not ( = ?auto_619558 ?auto_619559 ) ) ( not ( = ?auto_619558 ?auto_619560 ) ) ( not ( = ?auto_619558 ?auto_619561 ) ) ( not ( = ?auto_619558 ?auto_619562 ) ) ( not ( = ?auto_619558 ?auto_619563 ) ) ( not ( = ?auto_619558 ?auto_619564 ) ) ( not ( = ?auto_619558 ?auto_619565 ) ) ( not ( = ?auto_619559 ?auto_619560 ) ) ( not ( = ?auto_619559 ?auto_619561 ) ) ( not ( = ?auto_619559 ?auto_619562 ) ) ( not ( = ?auto_619559 ?auto_619563 ) ) ( not ( = ?auto_619559 ?auto_619564 ) ) ( not ( = ?auto_619559 ?auto_619565 ) ) ( not ( = ?auto_619560 ?auto_619561 ) ) ( not ( = ?auto_619560 ?auto_619562 ) ) ( not ( = ?auto_619560 ?auto_619563 ) ) ( not ( = ?auto_619560 ?auto_619564 ) ) ( not ( = ?auto_619560 ?auto_619565 ) ) ( not ( = ?auto_619561 ?auto_619562 ) ) ( not ( = ?auto_619561 ?auto_619563 ) ) ( not ( = ?auto_619561 ?auto_619564 ) ) ( not ( = ?auto_619561 ?auto_619565 ) ) ( not ( = ?auto_619562 ?auto_619563 ) ) ( not ( = ?auto_619562 ?auto_619564 ) ) ( not ( = ?auto_619562 ?auto_619565 ) ) ( not ( = ?auto_619563 ?auto_619564 ) ) ( not ( = ?auto_619563 ?auto_619565 ) ) ( not ( = ?auto_619564 ?auto_619565 ) ) ( ON ?auto_619563 ?auto_619564 ) ( ON ?auto_619562 ?auto_619563 ) ( ON ?auto_619561 ?auto_619562 ) ( ON ?auto_619560 ?auto_619561 ) ( ON ?auto_619559 ?auto_619560 ) ( ON ?auto_619558 ?auto_619559 ) ( CLEAR ?auto_619556 ) ( ON ?auto_619557 ?auto_619558 ) ( CLEAR ?auto_619557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_619548 ?auto_619549 ?auto_619550 ?auto_619551 ?auto_619552 ?auto_619553 ?auto_619554 ?auto_619555 ?auto_619556 ?auto_619557 )
      ( MAKE-17PILE ?auto_619548 ?auto_619549 ?auto_619550 ?auto_619551 ?auto_619552 ?auto_619553 ?auto_619554 ?auto_619555 ?auto_619556 ?auto_619557 ?auto_619558 ?auto_619559 ?auto_619560 ?auto_619561 ?auto_619562 ?auto_619563 ?auto_619564 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619583 - BLOCK
      ?auto_619584 - BLOCK
      ?auto_619585 - BLOCK
      ?auto_619586 - BLOCK
      ?auto_619587 - BLOCK
      ?auto_619588 - BLOCK
      ?auto_619589 - BLOCK
      ?auto_619590 - BLOCK
      ?auto_619591 - BLOCK
      ?auto_619592 - BLOCK
      ?auto_619593 - BLOCK
      ?auto_619594 - BLOCK
      ?auto_619595 - BLOCK
      ?auto_619596 - BLOCK
      ?auto_619597 - BLOCK
      ?auto_619598 - BLOCK
      ?auto_619599 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_619599 ) ( ON-TABLE ?auto_619583 ) ( ON ?auto_619584 ?auto_619583 ) ( ON ?auto_619585 ?auto_619584 ) ( ON ?auto_619586 ?auto_619585 ) ( ON ?auto_619587 ?auto_619586 ) ( ON ?auto_619588 ?auto_619587 ) ( ON ?auto_619589 ?auto_619588 ) ( ON ?auto_619590 ?auto_619589 ) ( ON ?auto_619591 ?auto_619590 ) ( not ( = ?auto_619583 ?auto_619584 ) ) ( not ( = ?auto_619583 ?auto_619585 ) ) ( not ( = ?auto_619583 ?auto_619586 ) ) ( not ( = ?auto_619583 ?auto_619587 ) ) ( not ( = ?auto_619583 ?auto_619588 ) ) ( not ( = ?auto_619583 ?auto_619589 ) ) ( not ( = ?auto_619583 ?auto_619590 ) ) ( not ( = ?auto_619583 ?auto_619591 ) ) ( not ( = ?auto_619583 ?auto_619592 ) ) ( not ( = ?auto_619583 ?auto_619593 ) ) ( not ( = ?auto_619583 ?auto_619594 ) ) ( not ( = ?auto_619583 ?auto_619595 ) ) ( not ( = ?auto_619583 ?auto_619596 ) ) ( not ( = ?auto_619583 ?auto_619597 ) ) ( not ( = ?auto_619583 ?auto_619598 ) ) ( not ( = ?auto_619583 ?auto_619599 ) ) ( not ( = ?auto_619584 ?auto_619585 ) ) ( not ( = ?auto_619584 ?auto_619586 ) ) ( not ( = ?auto_619584 ?auto_619587 ) ) ( not ( = ?auto_619584 ?auto_619588 ) ) ( not ( = ?auto_619584 ?auto_619589 ) ) ( not ( = ?auto_619584 ?auto_619590 ) ) ( not ( = ?auto_619584 ?auto_619591 ) ) ( not ( = ?auto_619584 ?auto_619592 ) ) ( not ( = ?auto_619584 ?auto_619593 ) ) ( not ( = ?auto_619584 ?auto_619594 ) ) ( not ( = ?auto_619584 ?auto_619595 ) ) ( not ( = ?auto_619584 ?auto_619596 ) ) ( not ( = ?auto_619584 ?auto_619597 ) ) ( not ( = ?auto_619584 ?auto_619598 ) ) ( not ( = ?auto_619584 ?auto_619599 ) ) ( not ( = ?auto_619585 ?auto_619586 ) ) ( not ( = ?auto_619585 ?auto_619587 ) ) ( not ( = ?auto_619585 ?auto_619588 ) ) ( not ( = ?auto_619585 ?auto_619589 ) ) ( not ( = ?auto_619585 ?auto_619590 ) ) ( not ( = ?auto_619585 ?auto_619591 ) ) ( not ( = ?auto_619585 ?auto_619592 ) ) ( not ( = ?auto_619585 ?auto_619593 ) ) ( not ( = ?auto_619585 ?auto_619594 ) ) ( not ( = ?auto_619585 ?auto_619595 ) ) ( not ( = ?auto_619585 ?auto_619596 ) ) ( not ( = ?auto_619585 ?auto_619597 ) ) ( not ( = ?auto_619585 ?auto_619598 ) ) ( not ( = ?auto_619585 ?auto_619599 ) ) ( not ( = ?auto_619586 ?auto_619587 ) ) ( not ( = ?auto_619586 ?auto_619588 ) ) ( not ( = ?auto_619586 ?auto_619589 ) ) ( not ( = ?auto_619586 ?auto_619590 ) ) ( not ( = ?auto_619586 ?auto_619591 ) ) ( not ( = ?auto_619586 ?auto_619592 ) ) ( not ( = ?auto_619586 ?auto_619593 ) ) ( not ( = ?auto_619586 ?auto_619594 ) ) ( not ( = ?auto_619586 ?auto_619595 ) ) ( not ( = ?auto_619586 ?auto_619596 ) ) ( not ( = ?auto_619586 ?auto_619597 ) ) ( not ( = ?auto_619586 ?auto_619598 ) ) ( not ( = ?auto_619586 ?auto_619599 ) ) ( not ( = ?auto_619587 ?auto_619588 ) ) ( not ( = ?auto_619587 ?auto_619589 ) ) ( not ( = ?auto_619587 ?auto_619590 ) ) ( not ( = ?auto_619587 ?auto_619591 ) ) ( not ( = ?auto_619587 ?auto_619592 ) ) ( not ( = ?auto_619587 ?auto_619593 ) ) ( not ( = ?auto_619587 ?auto_619594 ) ) ( not ( = ?auto_619587 ?auto_619595 ) ) ( not ( = ?auto_619587 ?auto_619596 ) ) ( not ( = ?auto_619587 ?auto_619597 ) ) ( not ( = ?auto_619587 ?auto_619598 ) ) ( not ( = ?auto_619587 ?auto_619599 ) ) ( not ( = ?auto_619588 ?auto_619589 ) ) ( not ( = ?auto_619588 ?auto_619590 ) ) ( not ( = ?auto_619588 ?auto_619591 ) ) ( not ( = ?auto_619588 ?auto_619592 ) ) ( not ( = ?auto_619588 ?auto_619593 ) ) ( not ( = ?auto_619588 ?auto_619594 ) ) ( not ( = ?auto_619588 ?auto_619595 ) ) ( not ( = ?auto_619588 ?auto_619596 ) ) ( not ( = ?auto_619588 ?auto_619597 ) ) ( not ( = ?auto_619588 ?auto_619598 ) ) ( not ( = ?auto_619588 ?auto_619599 ) ) ( not ( = ?auto_619589 ?auto_619590 ) ) ( not ( = ?auto_619589 ?auto_619591 ) ) ( not ( = ?auto_619589 ?auto_619592 ) ) ( not ( = ?auto_619589 ?auto_619593 ) ) ( not ( = ?auto_619589 ?auto_619594 ) ) ( not ( = ?auto_619589 ?auto_619595 ) ) ( not ( = ?auto_619589 ?auto_619596 ) ) ( not ( = ?auto_619589 ?auto_619597 ) ) ( not ( = ?auto_619589 ?auto_619598 ) ) ( not ( = ?auto_619589 ?auto_619599 ) ) ( not ( = ?auto_619590 ?auto_619591 ) ) ( not ( = ?auto_619590 ?auto_619592 ) ) ( not ( = ?auto_619590 ?auto_619593 ) ) ( not ( = ?auto_619590 ?auto_619594 ) ) ( not ( = ?auto_619590 ?auto_619595 ) ) ( not ( = ?auto_619590 ?auto_619596 ) ) ( not ( = ?auto_619590 ?auto_619597 ) ) ( not ( = ?auto_619590 ?auto_619598 ) ) ( not ( = ?auto_619590 ?auto_619599 ) ) ( not ( = ?auto_619591 ?auto_619592 ) ) ( not ( = ?auto_619591 ?auto_619593 ) ) ( not ( = ?auto_619591 ?auto_619594 ) ) ( not ( = ?auto_619591 ?auto_619595 ) ) ( not ( = ?auto_619591 ?auto_619596 ) ) ( not ( = ?auto_619591 ?auto_619597 ) ) ( not ( = ?auto_619591 ?auto_619598 ) ) ( not ( = ?auto_619591 ?auto_619599 ) ) ( not ( = ?auto_619592 ?auto_619593 ) ) ( not ( = ?auto_619592 ?auto_619594 ) ) ( not ( = ?auto_619592 ?auto_619595 ) ) ( not ( = ?auto_619592 ?auto_619596 ) ) ( not ( = ?auto_619592 ?auto_619597 ) ) ( not ( = ?auto_619592 ?auto_619598 ) ) ( not ( = ?auto_619592 ?auto_619599 ) ) ( not ( = ?auto_619593 ?auto_619594 ) ) ( not ( = ?auto_619593 ?auto_619595 ) ) ( not ( = ?auto_619593 ?auto_619596 ) ) ( not ( = ?auto_619593 ?auto_619597 ) ) ( not ( = ?auto_619593 ?auto_619598 ) ) ( not ( = ?auto_619593 ?auto_619599 ) ) ( not ( = ?auto_619594 ?auto_619595 ) ) ( not ( = ?auto_619594 ?auto_619596 ) ) ( not ( = ?auto_619594 ?auto_619597 ) ) ( not ( = ?auto_619594 ?auto_619598 ) ) ( not ( = ?auto_619594 ?auto_619599 ) ) ( not ( = ?auto_619595 ?auto_619596 ) ) ( not ( = ?auto_619595 ?auto_619597 ) ) ( not ( = ?auto_619595 ?auto_619598 ) ) ( not ( = ?auto_619595 ?auto_619599 ) ) ( not ( = ?auto_619596 ?auto_619597 ) ) ( not ( = ?auto_619596 ?auto_619598 ) ) ( not ( = ?auto_619596 ?auto_619599 ) ) ( not ( = ?auto_619597 ?auto_619598 ) ) ( not ( = ?auto_619597 ?auto_619599 ) ) ( not ( = ?auto_619598 ?auto_619599 ) ) ( ON ?auto_619598 ?auto_619599 ) ( ON ?auto_619597 ?auto_619598 ) ( ON ?auto_619596 ?auto_619597 ) ( ON ?auto_619595 ?auto_619596 ) ( ON ?auto_619594 ?auto_619595 ) ( ON ?auto_619593 ?auto_619594 ) ( CLEAR ?auto_619591 ) ( ON ?auto_619592 ?auto_619593 ) ( CLEAR ?auto_619592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_619583 ?auto_619584 ?auto_619585 ?auto_619586 ?auto_619587 ?auto_619588 ?auto_619589 ?auto_619590 ?auto_619591 ?auto_619592 )
      ( MAKE-17PILE ?auto_619583 ?auto_619584 ?auto_619585 ?auto_619586 ?auto_619587 ?auto_619588 ?auto_619589 ?auto_619590 ?auto_619591 ?auto_619592 ?auto_619593 ?auto_619594 ?auto_619595 ?auto_619596 ?auto_619597 ?auto_619598 ?auto_619599 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619617 - BLOCK
      ?auto_619618 - BLOCK
      ?auto_619619 - BLOCK
      ?auto_619620 - BLOCK
      ?auto_619621 - BLOCK
      ?auto_619622 - BLOCK
      ?auto_619623 - BLOCK
      ?auto_619624 - BLOCK
      ?auto_619625 - BLOCK
      ?auto_619626 - BLOCK
      ?auto_619627 - BLOCK
      ?auto_619628 - BLOCK
      ?auto_619629 - BLOCK
      ?auto_619630 - BLOCK
      ?auto_619631 - BLOCK
      ?auto_619632 - BLOCK
      ?auto_619633 - BLOCK
    )
    :vars
    (
      ?auto_619634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619633 ?auto_619634 ) ( ON-TABLE ?auto_619617 ) ( ON ?auto_619618 ?auto_619617 ) ( ON ?auto_619619 ?auto_619618 ) ( ON ?auto_619620 ?auto_619619 ) ( ON ?auto_619621 ?auto_619620 ) ( ON ?auto_619622 ?auto_619621 ) ( ON ?auto_619623 ?auto_619622 ) ( ON ?auto_619624 ?auto_619623 ) ( not ( = ?auto_619617 ?auto_619618 ) ) ( not ( = ?auto_619617 ?auto_619619 ) ) ( not ( = ?auto_619617 ?auto_619620 ) ) ( not ( = ?auto_619617 ?auto_619621 ) ) ( not ( = ?auto_619617 ?auto_619622 ) ) ( not ( = ?auto_619617 ?auto_619623 ) ) ( not ( = ?auto_619617 ?auto_619624 ) ) ( not ( = ?auto_619617 ?auto_619625 ) ) ( not ( = ?auto_619617 ?auto_619626 ) ) ( not ( = ?auto_619617 ?auto_619627 ) ) ( not ( = ?auto_619617 ?auto_619628 ) ) ( not ( = ?auto_619617 ?auto_619629 ) ) ( not ( = ?auto_619617 ?auto_619630 ) ) ( not ( = ?auto_619617 ?auto_619631 ) ) ( not ( = ?auto_619617 ?auto_619632 ) ) ( not ( = ?auto_619617 ?auto_619633 ) ) ( not ( = ?auto_619617 ?auto_619634 ) ) ( not ( = ?auto_619618 ?auto_619619 ) ) ( not ( = ?auto_619618 ?auto_619620 ) ) ( not ( = ?auto_619618 ?auto_619621 ) ) ( not ( = ?auto_619618 ?auto_619622 ) ) ( not ( = ?auto_619618 ?auto_619623 ) ) ( not ( = ?auto_619618 ?auto_619624 ) ) ( not ( = ?auto_619618 ?auto_619625 ) ) ( not ( = ?auto_619618 ?auto_619626 ) ) ( not ( = ?auto_619618 ?auto_619627 ) ) ( not ( = ?auto_619618 ?auto_619628 ) ) ( not ( = ?auto_619618 ?auto_619629 ) ) ( not ( = ?auto_619618 ?auto_619630 ) ) ( not ( = ?auto_619618 ?auto_619631 ) ) ( not ( = ?auto_619618 ?auto_619632 ) ) ( not ( = ?auto_619618 ?auto_619633 ) ) ( not ( = ?auto_619618 ?auto_619634 ) ) ( not ( = ?auto_619619 ?auto_619620 ) ) ( not ( = ?auto_619619 ?auto_619621 ) ) ( not ( = ?auto_619619 ?auto_619622 ) ) ( not ( = ?auto_619619 ?auto_619623 ) ) ( not ( = ?auto_619619 ?auto_619624 ) ) ( not ( = ?auto_619619 ?auto_619625 ) ) ( not ( = ?auto_619619 ?auto_619626 ) ) ( not ( = ?auto_619619 ?auto_619627 ) ) ( not ( = ?auto_619619 ?auto_619628 ) ) ( not ( = ?auto_619619 ?auto_619629 ) ) ( not ( = ?auto_619619 ?auto_619630 ) ) ( not ( = ?auto_619619 ?auto_619631 ) ) ( not ( = ?auto_619619 ?auto_619632 ) ) ( not ( = ?auto_619619 ?auto_619633 ) ) ( not ( = ?auto_619619 ?auto_619634 ) ) ( not ( = ?auto_619620 ?auto_619621 ) ) ( not ( = ?auto_619620 ?auto_619622 ) ) ( not ( = ?auto_619620 ?auto_619623 ) ) ( not ( = ?auto_619620 ?auto_619624 ) ) ( not ( = ?auto_619620 ?auto_619625 ) ) ( not ( = ?auto_619620 ?auto_619626 ) ) ( not ( = ?auto_619620 ?auto_619627 ) ) ( not ( = ?auto_619620 ?auto_619628 ) ) ( not ( = ?auto_619620 ?auto_619629 ) ) ( not ( = ?auto_619620 ?auto_619630 ) ) ( not ( = ?auto_619620 ?auto_619631 ) ) ( not ( = ?auto_619620 ?auto_619632 ) ) ( not ( = ?auto_619620 ?auto_619633 ) ) ( not ( = ?auto_619620 ?auto_619634 ) ) ( not ( = ?auto_619621 ?auto_619622 ) ) ( not ( = ?auto_619621 ?auto_619623 ) ) ( not ( = ?auto_619621 ?auto_619624 ) ) ( not ( = ?auto_619621 ?auto_619625 ) ) ( not ( = ?auto_619621 ?auto_619626 ) ) ( not ( = ?auto_619621 ?auto_619627 ) ) ( not ( = ?auto_619621 ?auto_619628 ) ) ( not ( = ?auto_619621 ?auto_619629 ) ) ( not ( = ?auto_619621 ?auto_619630 ) ) ( not ( = ?auto_619621 ?auto_619631 ) ) ( not ( = ?auto_619621 ?auto_619632 ) ) ( not ( = ?auto_619621 ?auto_619633 ) ) ( not ( = ?auto_619621 ?auto_619634 ) ) ( not ( = ?auto_619622 ?auto_619623 ) ) ( not ( = ?auto_619622 ?auto_619624 ) ) ( not ( = ?auto_619622 ?auto_619625 ) ) ( not ( = ?auto_619622 ?auto_619626 ) ) ( not ( = ?auto_619622 ?auto_619627 ) ) ( not ( = ?auto_619622 ?auto_619628 ) ) ( not ( = ?auto_619622 ?auto_619629 ) ) ( not ( = ?auto_619622 ?auto_619630 ) ) ( not ( = ?auto_619622 ?auto_619631 ) ) ( not ( = ?auto_619622 ?auto_619632 ) ) ( not ( = ?auto_619622 ?auto_619633 ) ) ( not ( = ?auto_619622 ?auto_619634 ) ) ( not ( = ?auto_619623 ?auto_619624 ) ) ( not ( = ?auto_619623 ?auto_619625 ) ) ( not ( = ?auto_619623 ?auto_619626 ) ) ( not ( = ?auto_619623 ?auto_619627 ) ) ( not ( = ?auto_619623 ?auto_619628 ) ) ( not ( = ?auto_619623 ?auto_619629 ) ) ( not ( = ?auto_619623 ?auto_619630 ) ) ( not ( = ?auto_619623 ?auto_619631 ) ) ( not ( = ?auto_619623 ?auto_619632 ) ) ( not ( = ?auto_619623 ?auto_619633 ) ) ( not ( = ?auto_619623 ?auto_619634 ) ) ( not ( = ?auto_619624 ?auto_619625 ) ) ( not ( = ?auto_619624 ?auto_619626 ) ) ( not ( = ?auto_619624 ?auto_619627 ) ) ( not ( = ?auto_619624 ?auto_619628 ) ) ( not ( = ?auto_619624 ?auto_619629 ) ) ( not ( = ?auto_619624 ?auto_619630 ) ) ( not ( = ?auto_619624 ?auto_619631 ) ) ( not ( = ?auto_619624 ?auto_619632 ) ) ( not ( = ?auto_619624 ?auto_619633 ) ) ( not ( = ?auto_619624 ?auto_619634 ) ) ( not ( = ?auto_619625 ?auto_619626 ) ) ( not ( = ?auto_619625 ?auto_619627 ) ) ( not ( = ?auto_619625 ?auto_619628 ) ) ( not ( = ?auto_619625 ?auto_619629 ) ) ( not ( = ?auto_619625 ?auto_619630 ) ) ( not ( = ?auto_619625 ?auto_619631 ) ) ( not ( = ?auto_619625 ?auto_619632 ) ) ( not ( = ?auto_619625 ?auto_619633 ) ) ( not ( = ?auto_619625 ?auto_619634 ) ) ( not ( = ?auto_619626 ?auto_619627 ) ) ( not ( = ?auto_619626 ?auto_619628 ) ) ( not ( = ?auto_619626 ?auto_619629 ) ) ( not ( = ?auto_619626 ?auto_619630 ) ) ( not ( = ?auto_619626 ?auto_619631 ) ) ( not ( = ?auto_619626 ?auto_619632 ) ) ( not ( = ?auto_619626 ?auto_619633 ) ) ( not ( = ?auto_619626 ?auto_619634 ) ) ( not ( = ?auto_619627 ?auto_619628 ) ) ( not ( = ?auto_619627 ?auto_619629 ) ) ( not ( = ?auto_619627 ?auto_619630 ) ) ( not ( = ?auto_619627 ?auto_619631 ) ) ( not ( = ?auto_619627 ?auto_619632 ) ) ( not ( = ?auto_619627 ?auto_619633 ) ) ( not ( = ?auto_619627 ?auto_619634 ) ) ( not ( = ?auto_619628 ?auto_619629 ) ) ( not ( = ?auto_619628 ?auto_619630 ) ) ( not ( = ?auto_619628 ?auto_619631 ) ) ( not ( = ?auto_619628 ?auto_619632 ) ) ( not ( = ?auto_619628 ?auto_619633 ) ) ( not ( = ?auto_619628 ?auto_619634 ) ) ( not ( = ?auto_619629 ?auto_619630 ) ) ( not ( = ?auto_619629 ?auto_619631 ) ) ( not ( = ?auto_619629 ?auto_619632 ) ) ( not ( = ?auto_619629 ?auto_619633 ) ) ( not ( = ?auto_619629 ?auto_619634 ) ) ( not ( = ?auto_619630 ?auto_619631 ) ) ( not ( = ?auto_619630 ?auto_619632 ) ) ( not ( = ?auto_619630 ?auto_619633 ) ) ( not ( = ?auto_619630 ?auto_619634 ) ) ( not ( = ?auto_619631 ?auto_619632 ) ) ( not ( = ?auto_619631 ?auto_619633 ) ) ( not ( = ?auto_619631 ?auto_619634 ) ) ( not ( = ?auto_619632 ?auto_619633 ) ) ( not ( = ?auto_619632 ?auto_619634 ) ) ( not ( = ?auto_619633 ?auto_619634 ) ) ( ON ?auto_619632 ?auto_619633 ) ( ON ?auto_619631 ?auto_619632 ) ( ON ?auto_619630 ?auto_619631 ) ( ON ?auto_619629 ?auto_619630 ) ( ON ?auto_619628 ?auto_619629 ) ( ON ?auto_619627 ?auto_619628 ) ( ON ?auto_619626 ?auto_619627 ) ( CLEAR ?auto_619624 ) ( ON ?auto_619625 ?auto_619626 ) ( CLEAR ?auto_619625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_619617 ?auto_619618 ?auto_619619 ?auto_619620 ?auto_619621 ?auto_619622 ?auto_619623 ?auto_619624 ?auto_619625 )
      ( MAKE-17PILE ?auto_619617 ?auto_619618 ?auto_619619 ?auto_619620 ?auto_619621 ?auto_619622 ?auto_619623 ?auto_619624 ?auto_619625 ?auto_619626 ?auto_619627 ?auto_619628 ?auto_619629 ?auto_619630 ?auto_619631 ?auto_619632 ?auto_619633 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619652 - BLOCK
      ?auto_619653 - BLOCK
      ?auto_619654 - BLOCK
      ?auto_619655 - BLOCK
      ?auto_619656 - BLOCK
      ?auto_619657 - BLOCK
      ?auto_619658 - BLOCK
      ?auto_619659 - BLOCK
      ?auto_619660 - BLOCK
      ?auto_619661 - BLOCK
      ?auto_619662 - BLOCK
      ?auto_619663 - BLOCK
      ?auto_619664 - BLOCK
      ?auto_619665 - BLOCK
      ?auto_619666 - BLOCK
      ?auto_619667 - BLOCK
      ?auto_619668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_619668 ) ( ON-TABLE ?auto_619652 ) ( ON ?auto_619653 ?auto_619652 ) ( ON ?auto_619654 ?auto_619653 ) ( ON ?auto_619655 ?auto_619654 ) ( ON ?auto_619656 ?auto_619655 ) ( ON ?auto_619657 ?auto_619656 ) ( ON ?auto_619658 ?auto_619657 ) ( ON ?auto_619659 ?auto_619658 ) ( not ( = ?auto_619652 ?auto_619653 ) ) ( not ( = ?auto_619652 ?auto_619654 ) ) ( not ( = ?auto_619652 ?auto_619655 ) ) ( not ( = ?auto_619652 ?auto_619656 ) ) ( not ( = ?auto_619652 ?auto_619657 ) ) ( not ( = ?auto_619652 ?auto_619658 ) ) ( not ( = ?auto_619652 ?auto_619659 ) ) ( not ( = ?auto_619652 ?auto_619660 ) ) ( not ( = ?auto_619652 ?auto_619661 ) ) ( not ( = ?auto_619652 ?auto_619662 ) ) ( not ( = ?auto_619652 ?auto_619663 ) ) ( not ( = ?auto_619652 ?auto_619664 ) ) ( not ( = ?auto_619652 ?auto_619665 ) ) ( not ( = ?auto_619652 ?auto_619666 ) ) ( not ( = ?auto_619652 ?auto_619667 ) ) ( not ( = ?auto_619652 ?auto_619668 ) ) ( not ( = ?auto_619653 ?auto_619654 ) ) ( not ( = ?auto_619653 ?auto_619655 ) ) ( not ( = ?auto_619653 ?auto_619656 ) ) ( not ( = ?auto_619653 ?auto_619657 ) ) ( not ( = ?auto_619653 ?auto_619658 ) ) ( not ( = ?auto_619653 ?auto_619659 ) ) ( not ( = ?auto_619653 ?auto_619660 ) ) ( not ( = ?auto_619653 ?auto_619661 ) ) ( not ( = ?auto_619653 ?auto_619662 ) ) ( not ( = ?auto_619653 ?auto_619663 ) ) ( not ( = ?auto_619653 ?auto_619664 ) ) ( not ( = ?auto_619653 ?auto_619665 ) ) ( not ( = ?auto_619653 ?auto_619666 ) ) ( not ( = ?auto_619653 ?auto_619667 ) ) ( not ( = ?auto_619653 ?auto_619668 ) ) ( not ( = ?auto_619654 ?auto_619655 ) ) ( not ( = ?auto_619654 ?auto_619656 ) ) ( not ( = ?auto_619654 ?auto_619657 ) ) ( not ( = ?auto_619654 ?auto_619658 ) ) ( not ( = ?auto_619654 ?auto_619659 ) ) ( not ( = ?auto_619654 ?auto_619660 ) ) ( not ( = ?auto_619654 ?auto_619661 ) ) ( not ( = ?auto_619654 ?auto_619662 ) ) ( not ( = ?auto_619654 ?auto_619663 ) ) ( not ( = ?auto_619654 ?auto_619664 ) ) ( not ( = ?auto_619654 ?auto_619665 ) ) ( not ( = ?auto_619654 ?auto_619666 ) ) ( not ( = ?auto_619654 ?auto_619667 ) ) ( not ( = ?auto_619654 ?auto_619668 ) ) ( not ( = ?auto_619655 ?auto_619656 ) ) ( not ( = ?auto_619655 ?auto_619657 ) ) ( not ( = ?auto_619655 ?auto_619658 ) ) ( not ( = ?auto_619655 ?auto_619659 ) ) ( not ( = ?auto_619655 ?auto_619660 ) ) ( not ( = ?auto_619655 ?auto_619661 ) ) ( not ( = ?auto_619655 ?auto_619662 ) ) ( not ( = ?auto_619655 ?auto_619663 ) ) ( not ( = ?auto_619655 ?auto_619664 ) ) ( not ( = ?auto_619655 ?auto_619665 ) ) ( not ( = ?auto_619655 ?auto_619666 ) ) ( not ( = ?auto_619655 ?auto_619667 ) ) ( not ( = ?auto_619655 ?auto_619668 ) ) ( not ( = ?auto_619656 ?auto_619657 ) ) ( not ( = ?auto_619656 ?auto_619658 ) ) ( not ( = ?auto_619656 ?auto_619659 ) ) ( not ( = ?auto_619656 ?auto_619660 ) ) ( not ( = ?auto_619656 ?auto_619661 ) ) ( not ( = ?auto_619656 ?auto_619662 ) ) ( not ( = ?auto_619656 ?auto_619663 ) ) ( not ( = ?auto_619656 ?auto_619664 ) ) ( not ( = ?auto_619656 ?auto_619665 ) ) ( not ( = ?auto_619656 ?auto_619666 ) ) ( not ( = ?auto_619656 ?auto_619667 ) ) ( not ( = ?auto_619656 ?auto_619668 ) ) ( not ( = ?auto_619657 ?auto_619658 ) ) ( not ( = ?auto_619657 ?auto_619659 ) ) ( not ( = ?auto_619657 ?auto_619660 ) ) ( not ( = ?auto_619657 ?auto_619661 ) ) ( not ( = ?auto_619657 ?auto_619662 ) ) ( not ( = ?auto_619657 ?auto_619663 ) ) ( not ( = ?auto_619657 ?auto_619664 ) ) ( not ( = ?auto_619657 ?auto_619665 ) ) ( not ( = ?auto_619657 ?auto_619666 ) ) ( not ( = ?auto_619657 ?auto_619667 ) ) ( not ( = ?auto_619657 ?auto_619668 ) ) ( not ( = ?auto_619658 ?auto_619659 ) ) ( not ( = ?auto_619658 ?auto_619660 ) ) ( not ( = ?auto_619658 ?auto_619661 ) ) ( not ( = ?auto_619658 ?auto_619662 ) ) ( not ( = ?auto_619658 ?auto_619663 ) ) ( not ( = ?auto_619658 ?auto_619664 ) ) ( not ( = ?auto_619658 ?auto_619665 ) ) ( not ( = ?auto_619658 ?auto_619666 ) ) ( not ( = ?auto_619658 ?auto_619667 ) ) ( not ( = ?auto_619658 ?auto_619668 ) ) ( not ( = ?auto_619659 ?auto_619660 ) ) ( not ( = ?auto_619659 ?auto_619661 ) ) ( not ( = ?auto_619659 ?auto_619662 ) ) ( not ( = ?auto_619659 ?auto_619663 ) ) ( not ( = ?auto_619659 ?auto_619664 ) ) ( not ( = ?auto_619659 ?auto_619665 ) ) ( not ( = ?auto_619659 ?auto_619666 ) ) ( not ( = ?auto_619659 ?auto_619667 ) ) ( not ( = ?auto_619659 ?auto_619668 ) ) ( not ( = ?auto_619660 ?auto_619661 ) ) ( not ( = ?auto_619660 ?auto_619662 ) ) ( not ( = ?auto_619660 ?auto_619663 ) ) ( not ( = ?auto_619660 ?auto_619664 ) ) ( not ( = ?auto_619660 ?auto_619665 ) ) ( not ( = ?auto_619660 ?auto_619666 ) ) ( not ( = ?auto_619660 ?auto_619667 ) ) ( not ( = ?auto_619660 ?auto_619668 ) ) ( not ( = ?auto_619661 ?auto_619662 ) ) ( not ( = ?auto_619661 ?auto_619663 ) ) ( not ( = ?auto_619661 ?auto_619664 ) ) ( not ( = ?auto_619661 ?auto_619665 ) ) ( not ( = ?auto_619661 ?auto_619666 ) ) ( not ( = ?auto_619661 ?auto_619667 ) ) ( not ( = ?auto_619661 ?auto_619668 ) ) ( not ( = ?auto_619662 ?auto_619663 ) ) ( not ( = ?auto_619662 ?auto_619664 ) ) ( not ( = ?auto_619662 ?auto_619665 ) ) ( not ( = ?auto_619662 ?auto_619666 ) ) ( not ( = ?auto_619662 ?auto_619667 ) ) ( not ( = ?auto_619662 ?auto_619668 ) ) ( not ( = ?auto_619663 ?auto_619664 ) ) ( not ( = ?auto_619663 ?auto_619665 ) ) ( not ( = ?auto_619663 ?auto_619666 ) ) ( not ( = ?auto_619663 ?auto_619667 ) ) ( not ( = ?auto_619663 ?auto_619668 ) ) ( not ( = ?auto_619664 ?auto_619665 ) ) ( not ( = ?auto_619664 ?auto_619666 ) ) ( not ( = ?auto_619664 ?auto_619667 ) ) ( not ( = ?auto_619664 ?auto_619668 ) ) ( not ( = ?auto_619665 ?auto_619666 ) ) ( not ( = ?auto_619665 ?auto_619667 ) ) ( not ( = ?auto_619665 ?auto_619668 ) ) ( not ( = ?auto_619666 ?auto_619667 ) ) ( not ( = ?auto_619666 ?auto_619668 ) ) ( not ( = ?auto_619667 ?auto_619668 ) ) ( ON ?auto_619667 ?auto_619668 ) ( ON ?auto_619666 ?auto_619667 ) ( ON ?auto_619665 ?auto_619666 ) ( ON ?auto_619664 ?auto_619665 ) ( ON ?auto_619663 ?auto_619664 ) ( ON ?auto_619662 ?auto_619663 ) ( ON ?auto_619661 ?auto_619662 ) ( CLEAR ?auto_619659 ) ( ON ?auto_619660 ?auto_619661 ) ( CLEAR ?auto_619660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_619652 ?auto_619653 ?auto_619654 ?auto_619655 ?auto_619656 ?auto_619657 ?auto_619658 ?auto_619659 ?auto_619660 )
      ( MAKE-17PILE ?auto_619652 ?auto_619653 ?auto_619654 ?auto_619655 ?auto_619656 ?auto_619657 ?auto_619658 ?auto_619659 ?auto_619660 ?auto_619661 ?auto_619662 ?auto_619663 ?auto_619664 ?auto_619665 ?auto_619666 ?auto_619667 ?auto_619668 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619686 - BLOCK
      ?auto_619687 - BLOCK
      ?auto_619688 - BLOCK
      ?auto_619689 - BLOCK
      ?auto_619690 - BLOCK
      ?auto_619691 - BLOCK
      ?auto_619692 - BLOCK
      ?auto_619693 - BLOCK
      ?auto_619694 - BLOCK
      ?auto_619695 - BLOCK
      ?auto_619696 - BLOCK
      ?auto_619697 - BLOCK
      ?auto_619698 - BLOCK
      ?auto_619699 - BLOCK
      ?auto_619700 - BLOCK
      ?auto_619701 - BLOCK
      ?auto_619702 - BLOCK
    )
    :vars
    (
      ?auto_619703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619702 ?auto_619703 ) ( ON-TABLE ?auto_619686 ) ( ON ?auto_619687 ?auto_619686 ) ( ON ?auto_619688 ?auto_619687 ) ( ON ?auto_619689 ?auto_619688 ) ( ON ?auto_619690 ?auto_619689 ) ( ON ?auto_619691 ?auto_619690 ) ( ON ?auto_619692 ?auto_619691 ) ( not ( = ?auto_619686 ?auto_619687 ) ) ( not ( = ?auto_619686 ?auto_619688 ) ) ( not ( = ?auto_619686 ?auto_619689 ) ) ( not ( = ?auto_619686 ?auto_619690 ) ) ( not ( = ?auto_619686 ?auto_619691 ) ) ( not ( = ?auto_619686 ?auto_619692 ) ) ( not ( = ?auto_619686 ?auto_619693 ) ) ( not ( = ?auto_619686 ?auto_619694 ) ) ( not ( = ?auto_619686 ?auto_619695 ) ) ( not ( = ?auto_619686 ?auto_619696 ) ) ( not ( = ?auto_619686 ?auto_619697 ) ) ( not ( = ?auto_619686 ?auto_619698 ) ) ( not ( = ?auto_619686 ?auto_619699 ) ) ( not ( = ?auto_619686 ?auto_619700 ) ) ( not ( = ?auto_619686 ?auto_619701 ) ) ( not ( = ?auto_619686 ?auto_619702 ) ) ( not ( = ?auto_619686 ?auto_619703 ) ) ( not ( = ?auto_619687 ?auto_619688 ) ) ( not ( = ?auto_619687 ?auto_619689 ) ) ( not ( = ?auto_619687 ?auto_619690 ) ) ( not ( = ?auto_619687 ?auto_619691 ) ) ( not ( = ?auto_619687 ?auto_619692 ) ) ( not ( = ?auto_619687 ?auto_619693 ) ) ( not ( = ?auto_619687 ?auto_619694 ) ) ( not ( = ?auto_619687 ?auto_619695 ) ) ( not ( = ?auto_619687 ?auto_619696 ) ) ( not ( = ?auto_619687 ?auto_619697 ) ) ( not ( = ?auto_619687 ?auto_619698 ) ) ( not ( = ?auto_619687 ?auto_619699 ) ) ( not ( = ?auto_619687 ?auto_619700 ) ) ( not ( = ?auto_619687 ?auto_619701 ) ) ( not ( = ?auto_619687 ?auto_619702 ) ) ( not ( = ?auto_619687 ?auto_619703 ) ) ( not ( = ?auto_619688 ?auto_619689 ) ) ( not ( = ?auto_619688 ?auto_619690 ) ) ( not ( = ?auto_619688 ?auto_619691 ) ) ( not ( = ?auto_619688 ?auto_619692 ) ) ( not ( = ?auto_619688 ?auto_619693 ) ) ( not ( = ?auto_619688 ?auto_619694 ) ) ( not ( = ?auto_619688 ?auto_619695 ) ) ( not ( = ?auto_619688 ?auto_619696 ) ) ( not ( = ?auto_619688 ?auto_619697 ) ) ( not ( = ?auto_619688 ?auto_619698 ) ) ( not ( = ?auto_619688 ?auto_619699 ) ) ( not ( = ?auto_619688 ?auto_619700 ) ) ( not ( = ?auto_619688 ?auto_619701 ) ) ( not ( = ?auto_619688 ?auto_619702 ) ) ( not ( = ?auto_619688 ?auto_619703 ) ) ( not ( = ?auto_619689 ?auto_619690 ) ) ( not ( = ?auto_619689 ?auto_619691 ) ) ( not ( = ?auto_619689 ?auto_619692 ) ) ( not ( = ?auto_619689 ?auto_619693 ) ) ( not ( = ?auto_619689 ?auto_619694 ) ) ( not ( = ?auto_619689 ?auto_619695 ) ) ( not ( = ?auto_619689 ?auto_619696 ) ) ( not ( = ?auto_619689 ?auto_619697 ) ) ( not ( = ?auto_619689 ?auto_619698 ) ) ( not ( = ?auto_619689 ?auto_619699 ) ) ( not ( = ?auto_619689 ?auto_619700 ) ) ( not ( = ?auto_619689 ?auto_619701 ) ) ( not ( = ?auto_619689 ?auto_619702 ) ) ( not ( = ?auto_619689 ?auto_619703 ) ) ( not ( = ?auto_619690 ?auto_619691 ) ) ( not ( = ?auto_619690 ?auto_619692 ) ) ( not ( = ?auto_619690 ?auto_619693 ) ) ( not ( = ?auto_619690 ?auto_619694 ) ) ( not ( = ?auto_619690 ?auto_619695 ) ) ( not ( = ?auto_619690 ?auto_619696 ) ) ( not ( = ?auto_619690 ?auto_619697 ) ) ( not ( = ?auto_619690 ?auto_619698 ) ) ( not ( = ?auto_619690 ?auto_619699 ) ) ( not ( = ?auto_619690 ?auto_619700 ) ) ( not ( = ?auto_619690 ?auto_619701 ) ) ( not ( = ?auto_619690 ?auto_619702 ) ) ( not ( = ?auto_619690 ?auto_619703 ) ) ( not ( = ?auto_619691 ?auto_619692 ) ) ( not ( = ?auto_619691 ?auto_619693 ) ) ( not ( = ?auto_619691 ?auto_619694 ) ) ( not ( = ?auto_619691 ?auto_619695 ) ) ( not ( = ?auto_619691 ?auto_619696 ) ) ( not ( = ?auto_619691 ?auto_619697 ) ) ( not ( = ?auto_619691 ?auto_619698 ) ) ( not ( = ?auto_619691 ?auto_619699 ) ) ( not ( = ?auto_619691 ?auto_619700 ) ) ( not ( = ?auto_619691 ?auto_619701 ) ) ( not ( = ?auto_619691 ?auto_619702 ) ) ( not ( = ?auto_619691 ?auto_619703 ) ) ( not ( = ?auto_619692 ?auto_619693 ) ) ( not ( = ?auto_619692 ?auto_619694 ) ) ( not ( = ?auto_619692 ?auto_619695 ) ) ( not ( = ?auto_619692 ?auto_619696 ) ) ( not ( = ?auto_619692 ?auto_619697 ) ) ( not ( = ?auto_619692 ?auto_619698 ) ) ( not ( = ?auto_619692 ?auto_619699 ) ) ( not ( = ?auto_619692 ?auto_619700 ) ) ( not ( = ?auto_619692 ?auto_619701 ) ) ( not ( = ?auto_619692 ?auto_619702 ) ) ( not ( = ?auto_619692 ?auto_619703 ) ) ( not ( = ?auto_619693 ?auto_619694 ) ) ( not ( = ?auto_619693 ?auto_619695 ) ) ( not ( = ?auto_619693 ?auto_619696 ) ) ( not ( = ?auto_619693 ?auto_619697 ) ) ( not ( = ?auto_619693 ?auto_619698 ) ) ( not ( = ?auto_619693 ?auto_619699 ) ) ( not ( = ?auto_619693 ?auto_619700 ) ) ( not ( = ?auto_619693 ?auto_619701 ) ) ( not ( = ?auto_619693 ?auto_619702 ) ) ( not ( = ?auto_619693 ?auto_619703 ) ) ( not ( = ?auto_619694 ?auto_619695 ) ) ( not ( = ?auto_619694 ?auto_619696 ) ) ( not ( = ?auto_619694 ?auto_619697 ) ) ( not ( = ?auto_619694 ?auto_619698 ) ) ( not ( = ?auto_619694 ?auto_619699 ) ) ( not ( = ?auto_619694 ?auto_619700 ) ) ( not ( = ?auto_619694 ?auto_619701 ) ) ( not ( = ?auto_619694 ?auto_619702 ) ) ( not ( = ?auto_619694 ?auto_619703 ) ) ( not ( = ?auto_619695 ?auto_619696 ) ) ( not ( = ?auto_619695 ?auto_619697 ) ) ( not ( = ?auto_619695 ?auto_619698 ) ) ( not ( = ?auto_619695 ?auto_619699 ) ) ( not ( = ?auto_619695 ?auto_619700 ) ) ( not ( = ?auto_619695 ?auto_619701 ) ) ( not ( = ?auto_619695 ?auto_619702 ) ) ( not ( = ?auto_619695 ?auto_619703 ) ) ( not ( = ?auto_619696 ?auto_619697 ) ) ( not ( = ?auto_619696 ?auto_619698 ) ) ( not ( = ?auto_619696 ?auto_619699 ) ) ( not ( = ?auto_619696 ?auto_619700 ) ) ( not ( = ?auto_619696 ?auto_619701 ) ) ( not ( = ?auto_619696 ?auto_619702 ) ) ( not ( = ?auto_619696 ?auto_619703 ) ) ( not ( = ?auto_619697 ?auto_619698 ) ) ( not ( = ?auto_619697 ?auto_619699 ) ) ( not ( = ?auto_619697 ?auto_619700 ) ) ( not ( = ?auto_619697 ?auto_619701 ) ) ( not ( = ?auto_619697 ?auto_619702 ) ) ( not ( = ?auto_619697 ?auto_619703 ) ) ( not ( = ?auto_619698 ?auto_619699 ) ) ( not ( = ?auto_619698 ?auto_619700 ) ) ( not ( = ?auto_619698 ?auto_619701 ) ) ( not ( = ?auto_619698 ?auto_619702 ) ) ( not ( = ?auto_619698 ?auto_619703 ) ) ( not ( = ?auto_619699 ?auto_619700 ) ) ( not ( = ?auto_619699 ?auto_619701 ) ) ( not ( = ?auto_619699 ?auto_619702 ) ) ( not ( = ?auto_619699 ?auto_619703 ) ) ( not ( = ?auto_619700 ?auto_619701 ) ) ( not ( = ?auto_619700 ?auto_619702 ) ) ( not ( = ?auto_619700 ?auto_619703 ) ) ( not ( = ?auto_619701 ?auto_619702 ) ) ( not ( = ?auto_619701 ?auto_619703 ) ) ( not ( = ?auto_619702 ?auto_619703 ) ) ( ON ?auto_619701 ?auto_619702 ) ( ON ?auto_619700 ?auto_619701 ) ( ON ?auto_619699 ?auto_619700 ) ( ON ?auto_619698 ?auto_619699 ) ( ON ?auto_619697 ?auto_619698 ) ( ON ?auto_619696 ?auto_619697 ) ( ON ?auto_619695 ?auto_619696 ) ( ON ?auto_619694 ?auto_619695 ) ( CLEAR ?auto_619692 ) ( ON ?auto_619693 ?auto_619694 ) ( CLEAR ?auto_619693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_619686 ?auto_619687 ?auto_619688 ?auto_619689 ?auto_619690 ?auto_619691 ?auto_619692 ?auto_619693 )
      ( MAKE-17PILE ?auto_619686 ?auto_619687 ?auto_619688 ?auto_619689 ?auto_619690 ?auto_619691 ?auto_619692 ?auto_619693 ?auto_619694 ?auto_619695 ?auto_619696 ?auto_619697 ?auto_619698 ?auto_619699 ?auto_619700 ?auto_619701 ?auto_619702 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619721 - BLOCK
      ?auto_619722 - BLOCK
      ?auto_619723 - BLOCK
      ?auto_619724 - BLOCK
      ?auto_619725 - BLOCK
      ?auto_619726 - BLOCK
      ?auto_619727 - BLOCK
      ?auto_619728 - BLOCK
      ?auto_619729 - BLOCK
      ?auto_619730 - BLOCK
      ?auto_619731 - BLOCK
      ?auto_619732 - BLOCK
      ?auto_619733 - BLOCK
      ?auto_619734 - BLOCK
      ?auto_619735 - BLOCK
      ?auto_619736 - BLOCK
      ?auto_619737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_619737 ) ( ON-TABLE ?auto_619721 ) ( ON ?auto_619722 ?auto_619721 ) ( ON ?auto_619723 ?auto_619722 ) ( ON ?auto_619724 ?auto_619723 ) ( ON ?auto_619725 ?auto_619724 ) ( ON ?auto_619726 ?auto_619725 ) ( ON ?auto_619727 ?auto_619726 ) ( not ( = ?auto_619721 ?auto_619722 ) ) ( not ( = ?auto_619721 ?auto_619723 ) ) ( not ( = ?auto_619721 ?auto_619724 ) ) ( not ( = ?auto_619721 ?auto_619725 ) ) ( not ( = ?auto_619721 ?auto_619726 ) ) ( not ( = ?auto_619721 ?auto_619727 ) ) ( not ( = ?auto_619721 ?auto_619728 ) ) ( not ( = ?auto_619721 ?auto_619729 ) ) ( not ( = ?auto_619721 ?auto_619730 ) ) ( not ( = ?auto_619721 ?auto_619731 ) ) ( not ( = ?auto_619721 ?auto_619732 ) ) ( not ( = ?auto_619721 ?auto_619733 ) ) ( not ( = ?auto_619721 ?auto_619734 ) ) ( not ( = ?auto_619721 ?auto_619735 ) ) ( not ( = ?auto_619721 ?auto_619736 ) ) ( not ( = ?auto_619721 ?auto_619737 ) ) ( not ( = ?auto_619722 ?auto_619723 ) ) ( not ( = ?auto_619722 ?auto_619724 ) ) ( not ( = ?auto_619722 ?auto_619725 ) ) ( not ( = ?auto_619722 ?auto_619726 ) ) ( not ( = ?auto_619722 ?auto_619727 ) ) ( not ( = ?auto_619722 ?auto_619728 ) ) ( not ( = ?auto_619722 ?auto_619729 ) ) ( not ( = ?auto_619722 ?auto_619730 ) ) ( not ( = ?auto_619722 ?auto_619731 ) ) ( not ( = ?auto_619722 ?auto_619732 ) ) ( not ( = ?auto_619722 ?auto_619733 ) ) ( not ( = ?auto_619722 ?auto_619734 ) ) ( not ( = ?auto_619722 ?auto_619735 ) ) ( not ( = ?auto_619722 ?auto_619736 ) ) ( not ( = ?auto_619722 ?auto_619737 ) ) ( not ( = ?auto_619723 ?auto_619724 ) ) ( not ( = ?auto_619723 ?auto_619725 ) ) ( not ( = ?auto_619723 ?auto_619726 ) ) ( not ( = ?auto_619723 ?auto_619727 ) ) ( not ( = ?auto_619723 ?auto_619728 ) ) ( not ( = ?auto_619723 ?auto_619729 ) ) ( not ( = ?auto_619723 ?auto_619730 ) ) ( not ( = ?auto_619723 ?auto_619731 ) ) ( not ( = ?auto_619723 ?auto_619732 ) ) ( not ( = ?auto_619723 ?auto_619733 ) ) ( not ( = ?auto_619723 ?auto_619734 ) ) ( not ( = ?auto_619723 ?auto_619735 ) ) ( not ( = ?auto_619723 ?auto_619736 ) ) ( not ( = ?auto_619723 ?auto_619737 ) ) ( not ( = ?auto_619724 ?auto_619725 ) ) ( not ( = ?auto_619724 ?auto_619726 ) ) ( not ( = ?auto_619724 ?auto_619727 ) ) ( not ( = ?auto_619724 ?auto_619728 ) ) ( not ( = ?auto_619724 ?auto_619729 ) ) ( not ( = ?auto_619724 ?auto_619730 ) ) ( not ( = ?auto_619724 ?auto_619731 ) ) ( not ( = ?auto_619724 ?auto_619732 ) ) ( not ( = ?auto_619724 ?auto_619733 ) ) ( not ( = ?auto_619724 ?auto_619734 ) ) ( not ( = ?auto_619724 ?auto_619735 ) ) ( not ( = ?auto_619724 ?auto_619736 ) ) ( not ( = ?auto_619724 ?auto_619737 ) ) ( not ( = ?auto_619725 ?auto_619726 ) ) ( not ( = ?auto_619725 ?auto_619727 ) ) ( not ( = ?auto_619725 ?auto_619728 ) ) ( not ( = ?auto_619725 ?auto_619729 ) ) ( not ( = ?auto_619725 ?auto_619730 ) ) ( not ( = ?auto_619725 ?auto_619731 ) ) ( not ( = ?auto_619725 ?auto_619732 ) ) ( not ( = ?auto_619725 ?auto_619733 ) ) ( not ( = ?auto_619725 ?auto_619734 ) ) ( not ( = ?auto_619725 ?auto_619735 ) ) ( not ( = ?auto_619725 ?auto_619736 ) ) ( not ( = ?auto_619725 ?auto_619737 ) ) ( not ( = ?auto_619726 ?auto_619727 ) ) ( not ( = ?auto_619726 ?auto_619728 ) ) ( not ( = ?auto_619726 ?auto_619729 ) ) ( not ( = ?auto_619726 ?auto_619730 ) ) ( not ( = ?auto_619726 ?auto_619731 ) ) ( not ( = ?auto_619726 ?auto_619732 ) ) ( not ( = ?auto_619726 ?auto_619733 ) ) ( not ( = ?auto_619726 ?auto_619734 ) ) ( not ( = ?auto_619726 ?auto_619735 ) ) ( not ( = ?auto_619726 ?auto_619736 ) ) ( not ( = ?auto_619726 ?auto_619737 ) ) ( not ( = ?auto_619727 ?auto_619728 ) ) ( not ( = ?auto_619727 ?auto_619729 ) ) ( not ( = ?auto_619727 ?auto_619730 ) ) ( not ( = ?auto_619727 ?auto_619731 ) ) ( not ( = ?auto_619727 ?auto_619732 ) ) ( not ( = ?auto_619727 ?auto_619733 ) ) ( not ( = ?auto_619727 ?auto_619734 ) ) ( not ( = ?auto_619727 ?auto_619735 ) ) ( not ( = ?auto_619727 ?auto_619736 ) ) ( not ( = ?auto_619727 ?auto_619737 ) ) ( not ( = ?auto_619728 ?auto_619729 ) ) ( not ( = ?auto_619728 ?auto_619730 ) ) ( not ( = ?auto_619728 ?auto_619731 ) ) ( not ( = ?auto_619728 ?auto_619732 ) ) ( not ( = ?auto_619728 ?auto_619733 ) ) ( not ( = ?auto_619728 ?auto_619734 ) ) ( not ( = ?auto_619728 ?auto_619735 ) ) ( not ( = ?auto_619728 ?auto_619736 ) ) ( not ( = ?auto_619728 ?auto_619737 ) ) ( not ( = ?auto_619729 ?auto_619730 ) ) ( not ( = ?auto_619729 ?auto_619731 ) ) ( not ( = ?auto_619729 ?auto_619732 ) ) ( not ( = ?auto_619729 ?auto_619733 ) ) ( not ( = ?auto_619729 ?auto_619734 ) ) ( not ( = ?auto_619729 ?auto_619735 ) ) ( not ( = ?auto_619729 ?auto_619736 ) ) ( not ( = ?auto_619729 ?auto_619737 ) ) ( not ( = ?auto_619730 ?auto_619731 ) ) ( not ( = ?auto_619730 ?auto_619732 ) ) ( not ( = ?auto_619730 ?auto_619733 ) ) ( not ( = ?auto_619730 ?auto_619734 ) ) ( not ( = ?auto_619730 ?auto_619735 ) ) ( not ( = ?auto_619730 ?auto_619736 ) ) ( not ( = ?auto_619730 ?auto_619737 ) ) ( not ( = ?auto_619731 ?auto_619732 ) ) ( not ( = ?auto_619731 ?auto_619733 ) ) ( not ( = ?auto_619731 ?auto_619734 ) ) ( not ( = ?auto_619731 ?auto_619735 ) ) ( not ( = ?auto_619731 ?auto_619736 ) ) ( not ( = ?auto_619731 ?auto_619737 ) ) ( not ( = ?auto_619732 ?auto_619733 ) ) ( not ( = ?auto_619732 ?auto_619734 ) ) ( not ( = ?auto_619732 ?auto_619735 ) ) ( not ( = ?auto_619732 ?auto_619736 ) ) ( not ( = ?auto_619732 ?auto_619737 ) ) ( not ( = ?auto_619733 ?auto_619734 ) ) ( not ( = ?auto_619733 ?auto_619735 ) ) ( not ( = ?auto_619733 ?auto_619736 ) ) ( not ( = ?auto_619733 ?auto_619737 ) ) ( not ( = ?auto_619734 ?auto_619735 ) ) ( not ( = ?auto_619734 ?auto_619736 ) ) ( not ( = ?auto_619734 ?auto_619737 ) ) ( not ( = ?auto_619735 ?auto_619736 ) ) ( not ( = ?auto_619735 ?auto_619737 ) ) ( not ( = ?auto_619736 ?auto_619737 ) ) ( ON ?auto_619736 ?auto_619737 ) ( ON ?auto_619735 ?auto_619736 ) ( ON ?auto_619734 ?auto_619735 ) ( ON ?auto_619733 ?auto_619734 ) ( ON ?auto_619732 ?auto_619733 ) ( ON ?auto_619731 ?auto_619732 ) ( ON ?auto_619730 ?auto_619731 ) ( ON ?auto_619729 ?auto_619730 ) ( CLEAR ?auto_619727 ) ( ON ?auto_619728 ?auto_619729 ) ( CLEAR ?auto_619728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_619721 ?auto_619722 ?auto_619723 ?auto_619724 ?auto_619725 ?auto_619726 ?auto_619727 ?auto_619728 )
      ( MAKE-17PILE ?auto_619721 ?auto_619722 ?auto_619723 ?auto_619724 ?auto_619725 ?auto_619726 ?auto_619727 ?auto_619728 ?auto_619729 ?auto_619730 ?auto_619731 ?auto_619732 ?auto_619733 ?auto_619734 ?auto_619735 ?auto_619736 ?auto_619737 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619755 - BLOCK
      ?auto_619756 - BLOCK
      ?auto_619757 - BLOCK
      ?auto_619758 - BLOCK
      ?auto_619759 - BLOCK
      ?auto_619760 - BLOCK
      ?auto_619761 - BLOCK
      ?auto_619762 - BLOCK
      ?auto_619763 - BLOCK
      ?auto_619764 - BLOCK
      ?auto_619765 - BLOCK
      ?auto_619766 - BLOCK
      ?auto_619767 - BLOCK
      ?auto_619768 - BLOCK
      ?auto_619769 - BLOCK
      ?auto_619770 - BLOCK
      ?auto_619771 - BLOCK
    )
    :vars
    (
      ?auto_619772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619771 ?auto_619772 ) ( ON-TABLE ?auto_619755 ) ( ON ?auto_619756 ?auto_619755 ) ( ON ?auto_619757 ?auto_619756 ) ( ON ?auto_619758 ?auto_619757 ) ( ON ?auto_619759 ?auto_619758 ) ( ON ?auto_619760 ?auto_619759 ) ( not ( = ?auto_619755 ?auto_619756 ) ) ( not ( = ?auto_619755 ?auto_619757 ) ) ( not ( = ?auto_619755 ?auto_619758 ) ) ( not ( = ?auto_619755 ?auto_619759 ) ) ( not ( = ?auto_619755 ?auto_619760 ) ) ( not ( = ?auto_619755 ?auto_619761 ) ) ( not ( = ?auto_619755 ?auto_619762 ) ) ( not ( = ?auto_619755 ?auto_619763 ) ) ( not ( = ?auto_619755 ?auto_619764 ) ) ( not ( = ?auto_619755 ?auto_619765 ) ) ( not ( = ?auto_619755 ?auto_619766 ) ) ( not ( = ?auto_619755 ?auto_619767 ) ) ( not ( = ?auto_619755 ?auto_619768 ) ) ( not ( = ?auto_619755 ?auto_619769 ) ) ( not ( = ?auto_619755 ?auto_619770 ) ) ( not ( = ?auto_619755 ?auto_619771 ) ) ( not ( = ?auto_619755 ?auto_619772 ) ) ( not ( = ?auto_619756 ?auto_619757 ) ) ( not ( = ?auto_619756 ?auto_619758 ) ) ( not ( = ?auto_619756 ?auto_619759 ) ) ( not ( = ?auto_619756 ?auto_619760 ) ) ( not ( = ?auto_619756 ?auto_619761 ) ) ( not ( = ?auto_619756 ?auto_619762 ) ) ( not ( = ?auto_619756 ?auto_619763 ) ) ( not ( = ?auto_619756 ?auto_619764 ) ) ( not ( = ?auto_619756 ?auto_619765 ) ) ( not ( = ?auto_619756 ?auto_619766 ) ) ( not ( = ?auto_619756 ?auto_619767 ) ) ( not ( = ?auto_619756 ?auto_619768 ) ) ( not ( = ?auto_619756 ?auto_619769 ) ) ( not ( = ?auto_619756 ?auto_619770 ) ) ( not ( = ?auto_619756 ?auto_619771 ) ) ( not ( = ?auto_619756 ?auto_619772 ) ) ( not ( = ?auto_619757 ?auto_619758 ) ) ( not ( = ?auto_619757 ?auto_619759 ) ) ( not ( = ?auto_619757 ?auto_619760 ) ) ( not ( = ?auto_619757 ?auto_619761 ) ) ( not ( = ?auto_619757 ?auto_619762 ) ) ( not ( = ?auto_619757 ?auto_619763 ) ) ( not ( = ?auto_619757 ?auto_619764 ) ) ( not ( = ?auto_619757 ?auto_619765 ) ) ( not ( = ?auto_619757 ?auto_619766 ) ) ( not ( = ?auto_619757 ?auto_619767 ) ) ( not ( = ?auto_619757 ?auto_619768 ) ) ( not ( = ?auto_619757 ?auto_619769 ) ) ( not ( = ?auto_619757 ?auto_619770 ) ) ( not ( = ?auto_619757 ?auto_619771 ) ) ( not ( = ?auto_619757 ?auto_619772 ) ) ( not ( = ?auto_619758 ?auto_619759 ) ) ( not ( = ?auto_619758 ?auto_619760 ) ) ( not ( = ?auto_619758 ?auto_619761 ) ) ( not ( = ?auto_619758 ?auto_619762 ) ) ( not ( = ?auto_619758 ?auto_619763 ) ) ( not ( = ?auto_619758 ?auto_619764 ) ) ( not ( = ?auto_619758 ?auto_619765 ) ) ( not ( = ?auto_619758 ?auto_619766 ) ) ( not ( = ?auto_619758 ?auto_619767 ) ) ( not ( = ?auto_619758 ?auto_619768 ) ) ( not ( = ?auto_619758 ?auto_619769 ) ) ( not ( = ?auto_619758 ?auto_619770 ) ) ( not ( = ?auto_619758 ?auto_619771 ) ) ( not ( = ?auto_619758 ?auto_619772 ) ) ( not ( = ?auto_619759 ?auto_619760 ) ) ( not ( = ?auto_619759 ?auto_619761 ) ) ( not ( = ?auto_619759 ?auto_619762 ) ) ( not ( = ?auto_619759 ?auto_619763 ) ) ( not ( = ?auto_619759 ?auto_619764 ) ) ( not ( = ?auto_619759 ?auto_619765 ) ) ( not ( = ?auto_619759 ?auto_619766 ) ) ( not ( = ?auto_619759 ?auto_619767 ) ) ( not ( = ?auto_619759 ?auto_619768 ) ) ( not ( = ?auto_619759 ?auto_619769 ) ) ( not ( = ?auto_619759 ?auto_619770 ) ) ( not ( = ?auto_619759 ?auto_619771 ) ) ( not ( = ?auto_619759 ?auto_619772 ) ) ( not ( = ?auto_619760 ?auto_619761 ) ) ( not ( = ?auto_619760 ?auto_619762 ) ) ( not ( = ?auto_619760 ?auto_619763 ) ) ( not ( = ?auto_619760 ?auto_619764 ) ) ( not ( = ?auto_619760 ?auto_619765 ) ) ( not ( = ?auto_619760 ?auto_619766 ) ) ( not ( = ?auto_619760 ?auto_619767 ) ) ( not ( = ?auto_619760 ?auto_619768 ) ) ( not ( = ?auto_619760 ?auto_619769 ) ) ( not ( = ?auto_619760 ?auto_619770 ) ) ( not ( = ?auto_619760 ?auto_619771 ) ) ( not ( = ?auto_619760 ?auto_619772 ) ) ( not ( = ?auto_619761 ?auto_619762 ) ) ( not ( = ?auto_619761 ?auto_619763 ) ) ( not ( = ?auto_619761 ?auto_619764 ) ) ( not ( = ?auto_619761 ?auto_619765 ) ) ( not ( = ?auto_619761 ?auto_619766 ) ) ( not ( = ?auto_619761 ?auto_619767 ) ) ( not ( = ?auto_619761 ?auto_619768 ) ) ( not ( = ?auto_619761 ?auto_619769 ) ) ( not ( = ?auto_619761 ?auto_619770 ) ) ( not ( = ?auto_619761 ?auto_619771 ) ) ( not ( = ?auto_619761 ?auto_619772 ) ) ( not ( = ?auto_619762 ?auto_619763 ) ) ( not ( = ?auto_619762 ?auto_619764 ) ) ( not ( = ?auto_619762 ?auto_619765 ) ) ( not ( = ?auto_619762 ?auto_619766 ) ) ( not ( = ?auto_619762 ?auto_619767 ) ) ( not ( = ?auto_619762 ?auto_619768 ) ) ( not ( = ?auto_619762 ?auto_619769 ) ) ( not ( = ?auto_619762 ?auto_619770 ) ) ( not ( = ?auto_619762 ?auto_619771 ) ) ( not ( = ?auto_619762 ?auto_619772 ) ) ( not ( = ?auto_619763 ?auto_619764 ) ) ( not ( = ?auto_619763 ?auto_619765 ) ) ( not ( = ?auto_619763 ?auto_619766 ) ) ( not ( = ?auto_619763 ?auto_619767 ) ) ( not ( = ?auto_619763 ?auto_619768 ) ) ( not ( = ?auto_619763 ?auto_619769 ) ) ( not ( = ?auto_619763 ?auto_619770 ) ) ( not ( = ?auto_619763 ?auto_619771 ) ) ( not ( = ?auto_619763 ?auto_619772 ) ) ( not ( = ?auto_619764 ?auto_619765 ) ) ( not ( = ?auto_619764 ?auto_619766 ) ) ( not ( = ?auto_619764 ?auto_619767 ) ) ( not ( = ?auto_619764 ?auto_619768 ) ) ( not ( = ?auto_619764 ?auto_619769 ) ) ( not ( = ?auto_619764 ?auto_619770 ) ) ( not ( = ?auto_619764 ?auto_619771 ) ) ( not ( = ?auto_619764 ?auto_619772 ) ) ( not ( = ?auto_619765 ?auto_619766 ) ) ( not ( = ?auto_619765 ?auto_619767 ) ) ( not ( = ?auto_619765 ?auto_619768 ) ) ( not ( = ?auto_619765 ?auto_619769 ) ) ( not ( = ?auto_619765 ?auto_619770 ) ) ( not ( = ?auto_619765 ?auto_619771 ) ) ( not ( = ?auto_619765 ?auto_619772 ) ) ( not ( = ?auto_619766 ?auto_619767 ) ) ( not ( = ?auto_619766 ?auto_619768 ) ) ( not ( = ?auto_619766 ?auto_619769 ) ) ( not ( = ?auto_619766 ?auto_619770 ) ) ( not ( = ?auto_619766 ?auto_619771 ) ) ( not ( = ?auto_619766 ?auto_619772 ) ) ( not ( = ?auto_619767 ?auto_619768 ) ) ( not ( = ?auto_619767 ?auto_619769 ) ) ( not ( = ?auto_619767 ?auto_619770 ) ) ( not ( = ?auto_619767 ?auto_619771 ) ) ( not ( = ?auto_619767 ?auto_619772 ) ) ( not ( = ?auto_619768 ?auto_619769 ) ) ( not ( = ?auto_619768 ?auto_619770 ) ) ( not ( = ?auto_619768 ?auto_619771 ) ) ( not ( = ?auto_619768 ?auto_619772 ) ) ( not ( = ?auto_619769 ?auto_619770 ) ) ( not ( = ?auto_619769 ?auto_619771 ) ) ( not ( = ?auto_619769 ?auto_619772 ) ) ( not ( = ?auto_619770 ?auto_619771 ) ) ( not ( = ?auto_619770 ?auto_619772 ) ) ( not ( = ?auto_619771 ?auto_619772 ) ) ( ON ?auto_619770 ?auto_619771 ) ( ON ?auto_619769 ?auto_619770 ) ( ON ?auto_619768 ?auto_619769 ) ( ON ?auto_619767 ?auto_619768 ) ( ON ?auto_619766 ?auto_619767 ) ( ON ?auto_619765 ?auto_619766 ) ( ON ?auto_619764 ?auto_619765 ) ( ON ?auto_619763 ?auto_619764 ) ( ON ?auto_619762 ?auto_619763 ) ( CLEAR ?auto_619760 ) ( ON ?auto_619761 ?auto_619762 ) ( CLEAR ?auto_619761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_619755 ?auto_619756 ?auto_619757 ?auto_619758 ?auto_619759 ?auto_619760 ?auto_619761 )
      ( MAKE-17PILE ?auto_619755 ?auto_619756 ?auto_619757 ?auto_619758 ?auto_619759 ?auto_619760 ?auto_619761 ?auto_619762 ?auto_619763 ?auto_619764 ?auto_619765 ?auto_619766 ?auto_619767 ?auto_619768 ?auto_619769 ?auto_619770 ?auto_619771 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619790 - BLOCK
      ?auto_619791 - BLOCK
      ?auto_619792 - BLOCK
      ?auto_619793 - BLOCK
      ?auto_619794 - BLOCK
      ?auto_619795 - BLOCK
      ?auto_619796 - BLOCK
      ?auto_619797 - BLOCK
      ?auto_619798 - BLOCK
      ?auto_619799 - BLOCK
      ?auto_619800 - BLOCK
      ?auto_619801 - BLOCK
      ?auto_619802 - BLOCK
      ?auto_619803 - BLOCK
      ?auto_619804 - BLOCK
      ?auto_619805 - BLOCK
      ?auto_619806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_619806 ) ( ON-TABLE ?auto_619790 ) ( ON ?auto_619791 ?auto_619790 ) ( ON ?auto_619792 ?auto_619791 ) ( ON ?auto_619793 ?auto_619792 ) ( ON ?auto_619794 ?auto_619793 ) ( ON ?auto_619795 ?auto_619794 ) ( not ( = ?auto_619790 ?auto_619791 ) ) ( not ( = ?auto_619790 ?auto_619792 ) ) ( not ( = ?auto_619790 ?auto_619793 ) ) ( not ( = ?auto_619790 ?auto_619794 ) ) ( not ( = ?auto_619790 ?auto_619795 ) ) ( not ( = ?auto_619790 ?auto_619796 ) ) ( not ( = ?auto_619790 ?auto_619797 ) ) ( not ( = ?auto_619790 ?auto_619798 ) ) ( not ( = ?auto_619790 ?auto_619799 ) ) ( not ( = ?auto_619790 ?auto_619800 ) ) ( not ( = ?auto_619790 ?auto_619801 ) ) ( not ( = ?auto_619790 ?auto_619802 ) ) ( not ( = ?auto_619790 ?auto_619803 ) ) ( not ( = ?auto_619790 ?auto_619804 ) ) ( not ( = ?auto_619790 ?auto_619805 ) ) ( not ( = ?auto_619790 ?auto_619806 ) ) ( not ( = ?auto_619791 ?auto_619792 ) ) ( not ( = ?auto_619791 ?auto_619793 ) ) ( not ( = ?auto_619791 ?auto_619794 ) ) ( not ( = ?auto_619791 ?auto_619795 ) ) ( not ( = ?auto_619791 ?auto_619796 ) ) ( not ( = ?auto_619791 ?auto_619797 ) ) ( not ( = ?auto_619791 ?auto_619798 ) ) ( not ( = ?auto_619791 ?auto_619799 ) ) ( not ( = ?auto_619791 ?auto_619800 ) ) ( not ( = ?auto_619791 ?auto_619801 ) ) ( not ( = ?auto_619791 ?auto_619802 ) ) ( not ( = ?auto_619791 ?auto_619803 ) ) ( not ( = ?auto_619791 ?auto_619804 ) ) ( not ( = ?auto_619791 ?auto_619805 ) ) ( not ( = ?auto_619791 ?auto_619806 ) ) ( not ( = ?auto_619792 ?auto_619793 ) ) ( not ( = ?auto_619792 ?auto_619794 ) ) ( not ( = ?auto_619792 ?auto_619795 ) ) ( not ( = ?auto_619792 ?auto_619796 ) ) ( not ( = ?auto_619792 ?auto_619797 ) ) ( not ( = ?auto_619792 ?auto_619798 ) ) ( not ( = ?auto_619792 ?auto_619799 ) ) ( not ( = ?auto_619792 ?auto_619800 ) ) ( not ( = ?auto_619792 ?auto_619801 ) ) ( not ( = ?auto_619792 ?auto_619802 ) ) ( not ( = ?auto_619792 ?auto_619803 ) ) ( not ( = ?auto_619792 ?auto_619804 ) ) ( not ( = ?auto_619792 ?auto_619805 ) ) ( not ( = ?auto_619792 ?auto_619806 ) ) ( not ( = ?auto_619793 ?auto_619794 ) ) ( not ( = ?auto_619793 ?auto_619795 ) ) ( not ( = ?auto_619793 ?auto_619796 ) ) ( not ( = ?auto_619793 ?auto_619797 ) ) ( not ( = ?auto_619793 ?auto_619798 ) ) ( not ( = ?auto_619793 ?auto_619799 ) ) ( not ( = ?auto_619793 ?auto_619800 ) ) ( not ( = ?auto_619793 ?auto_619801 ) ) ( not ( = ?auto_619793 ?auto_619802 ) ) ( not ( = ?auto_619793 ?auto_619803 ) ) ( not ( = ?auto_619793 ?auto_619804 ) ) ( not ( = ?auto_619793 ?auto_619805 ) ) ( not ( = ?auto_619793 ?auto_619806 ) ) ( not ( = ?auto_619794 ?auto_619795 ) ) ( not ( = ?auto_619794 ?auto_619796 ) ) ( not ( = ?auto_619794 ?auto_619797 ) ) ( not ( = ?auto_619794 ?auto_619798 ) ) ( not ( = ?auto_619794 ?auto_619799 ) ) ( not ( = ?auto_619794 ?auto_619800 ) ) ( not ( = ?auto_619794 ?auto_619801 ) ) ( not ( = ?auto_619794 ?auto_619802 ) ) ( not ( = ?auto_619794 ?auto_619803 ) ) ( not ( = ?auto_619794 ?auto_619804 ) ) ( not ( = ?auto_619794 ?auto_619805 ) ) ( not ( = ?auto_619794 ?auto_619806 ) ) ( not ( = ?auto_619795 ?auto_619796 ) ) ( not ( = ?auto_619795 ?auto_619797 ) ) ( not ( = ?auto_619795 ?auto_619798 ) ) ( not ( = ?auto_619795 ?auto_619799 ) ) ( not ( = ?auto_619795 ?auto_619800 ) ) ( not ( = ?auto_619795 ?auto_619801 ) ) ( not ( = ?auto_619795 ?auto_619802 ) ) ( not ( = ?auto_619795 ?auto_619803 ) ) ( not ( = ?auto_619795 ?auto_619804 ) ) ( not ( = ?auto_619795 ?auto_619805 ) ) ( not ( = ?auto_619795 ?auto_619806 ) ) ( not ( = ?auto_619796 ?auto_619797 ) ) ( not ( = ?auto_619796 ?auto_619798 ) ) ( not ( = ?auto_619796 ?auto_619799 ) ) ( not ( = ?auto_619796 ?auto_619800 ) ) ( not ( = ?auto_619796 ?auto_619801 ) ) ( not ( = ?auto_619796 ?auto_619802 ) ) ( not ( = ?auto_619796 ?auto_619803 ) ) ( not ( = ?auto_619796 ?auto_619804 ) ) ( not ( = ?auto_619796 ?auto_619805 ) ) ( not ( = ?auto_619796 ?auto_619806 ) ) ( not ( = ?auto_619797 ?auto_619798 ) ) ( not ( = ?auto_619797 ?auto_619799 ) ) ( not ( = ?auto_619797 ?auto_619800 ) ) ( not ( = ?auto_619797 ?auto_619801 ) ) ( not ( = ?auto_619797 ?auto_619802 ) ) ( not ( = ?auto_619797 ?auto_619803 ) ) ( not ( = ?auto_619797 ?auto_619804 ) ) ( not ( = ?auto_619797 ?auto_619805 ) ) ( not ( = ?auto_619797 ?auto_619806 ) ) ( not ( = ?auto_619798 ?auto_619799 ) ) ( not ( = ?auto_619798 ?auto_619800 ) ) ( not ( = ?auto_619798 ?auto_619801 ) ) ( not ( = ?auto_619798 ?auto_619802 ) ) ( not ( = ?auto_619798 ?auto_619803 ) ) ( not ( = ?auto_619798 ?auto_619804 ) ) ( not ( = ?auto_619798 ?auto_619805 ) ) ( not ( = ?auto_619798 ?auto_619806 ) ) ( not ( = ?auto_619799 ?auto_619800 ) ) ( not ( = ?auto_619799 ?auto_619801 ) ) ( not ( = ?auto_619799 ?auto_619802 ) ) ( not ( = ?auto_619799 ?auto_619803 ) ) ( not ( = ?auto_619799 ?auto_619804 ) ) ( not ( = ?auto_619799 ?auto_619805 ) ) ( not ( = ?auto_619799 ?auto_619806 ) ) ( not ( = ?auto_619800 ?auto_619801 ) ) ( not ( = ?auto_619800 ?auto_619802 ) ) ( not ( = ?auto_619800 ?auto_619803 ) ) ( not ( = ?auto_619800 ?auto_619804 ) ) ( not ( = ?auto_619800 ?auto_619805 ) ) ( not ( = ?auto_619800 ?auto_619806 ) ) ( not ( = ?auto_619801 ?auto_619802 ) ) ( not ( = ?auto_619801 ?auto_619803 ) ) ( not ( = ?auto_619801 ?auto_619804 ) ) ( not ( = ?auto_619801 ?auto_619805 ) ) ( not ( = ?auto_619801 ?auto_619806 ) ) ( not ( = ?auto_619802 ?auto_619803 ) ) ( not ( = ?auto_619802 ?auto_619804 ) ) ( not ( = ?auto_619802 ?auto_619805 ) ) ( not ( = ?auto_619802 ?auto_619806 ) ) ( not ( = ?auto_619803 ?auto_619804 ) ) ( not ( = ?auto_619803 ?auto_619805 ) ) ( not ( = ?auto_619803 ?auto_619806 ) ) ( not ( = ?auto_619804 ?auto_619805 ) ) ( not ( = ?auto_619804 ?auto_619806 ) ) ( not ( = ?auto_619805 ?auto_619806 ) ) ( ON ?auto_619805 ?auto_619806 ) ( ON ?auto_619804 ?auto_619805 ) ( ON ?auto_619803 ?auto_619804 ) ( ON ?auto_619802 ?auto_619803 ) ( ON ?auto_619801 ?auto_619802 ) ( ON ?auto_619800 ?auto_619801 ) ( ON ?auto_619799 ?auto_619800 ) ( ON ?auto_619798 ?auto_619799 ) ( ON ?auto_619797 ?auto_619798 ) ( CLEAR ?auto_619795 ) ( ON ?auto_619796 ?auto_619797 ) ( CLEAR ?auto_619796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_619790 ?auto_619791 ?auto_619792 ?auto_619793 ?auto_619794 ?auto_619795 ?auto_619796 )
      ( MAKE-17PILE ?auto_619790 ?auto_619791 ?auto_619792 ?auto_619793 ?auto_619794 ?auto_619795 ?auto_619796 ?auto_619797 ?auto_619798 ?auto_619799 ?auto_619800 ?auto_619801 ?auto_619802 ?auto_619803 ?auto_619804 ?auto_619805 ?auto_619806 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619824 - BLOCK
      ?auto_619825 - BLOCK
      ?auto_619826 - BLOCK
      ?auto_619827 - BLOCK
      ?auto_619828 - BLOCK
      ?auto_619829 - BLOCK
      ?auto_619830 - BLOCK
      ?auto_619831 - BLOCK
      ?auto_619832 - BLOCK
      ?auto_619833 - BLOCK
      ?auto_619834 - BLOCK
      ?auto_619835 - BLOCK
      ?auto_619836 - BLOCK
      ?auto_619837 - BLOCK
      ?auto_619838 - BLOCK
      ?auto_619839 - BLOCK
      ?auto_619840 - BLOCK
    )
    :vars
    (
      ?auto_619841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619840 ?auto_619841 ) ( ON-TABLE ?auto_619824 ) ( ON ?auto_619825 ?auto_619824 ) ( ON ?auto_619826 ?auto_619825 ) ( ON ?auto_619827 ?auto_619826 ) ( ON ?auto_619828 ?auto_619827 ) ( not ( = ?auto_619824 ?auto_619825 ) ) ( not ( = ?auto_619824 ?auto_619826 ) ) ( not ( = ?auto_619824 ?auto_619827 ) ) ( not ( = ?auto_619824 ?auto_619828 ) ) ( not ( = ?auto_619824 ?auto_619829 ) ) ( not ( = ?auto_619824 ?auto_619830 ) ) ( not ( = ?auto_619824 ?auto_619831 ) ) ( not ( = ?auto_619824 ?auto_619832 ) ) ( not ( = ?auto_619824 ?auto_619833 ) ) ( not ( = ?auto_619824 ?auto_619834 ) ) ( not ( = ?auto_619824 ?auto_619835 ) ) ( not ( = ?auto_619824 ?auto_619836 ) ) ( not ( = ?auto_619824 ?auto_619837 ) ) ( not ( = ?auto_619824 ?auto_619838 ) ) ( not ( = ?auto_619824 ?auto_619839 ) ) ( not ( = ?auto_619824 ?auto_619840 ) ) ( not ( = ?auto_619824 ?auto_619841 ) ) ( not ( = ?auto_619825 ?auto_619826 ) ) ( not ( = ?auto_619825 ?auto_619827 ) ) ( not ( = ?auto_619825 ?auto_619828 ) ) ( not ( = ?auto_619825 ?auto_619829 ) ) ( not ( = ?auto_619825 ?auto_619830 ) ) ( not ( = ?auto_619825 ?auto_619831 ) ) ( not ( = ?auto_619825 ?auto_619832 ) ) ( not ( = ?auto_619825 ?auto_619833 ) ) ( not ( = ?auto_619825 ?auto_619834 ) ) ( not ( = ?auto_619825 ?auto_619835 ) ) ( not ( = ?auto_619825 ?auto_619836 ) ) ( not ( = ?auto_619825 ?auto_619837 ) ) ( not ( = ?auto_619825 ?auto_619838 ) ) ( not ( = ?auto_619825 ?auto_619839 ) ) ( not ( = ?auto_619825 ?auto_619840 ) ) ( not ( = ?auto_619825 ?auto_619841 ) ) ( not ( = ?auto_619826 ?auto_619827 ) ) ( not ( = ?auto_619826 ?auto_619828 ) ) ( not ( = ?auto_619826 ?auto_619829 ) ) ( not ( = ?auto_619826 ?auto_619830 ) ) ( not ( = ?auto_619826 ?auto_619831 ) ) ( not ( = ?auto_619826 ?auto_619832 ) ) ( not ( = ?auto_619826 ?auto_619833 ) ) ( not ( = ?auto_619826 ?auto_619834 ) ) ( not ( = ?auto_619826 ?auto_619835 ) ) ( not ( = ?auto_619826 ?auto_619836 ) ) ( not ( = ?auto_619826 ?auto_619837 ) ) ( not ( = ?auto_619826 ?auto_619838 ) ) ( not ( = ?auto_619826 ?auto_619839 ) ) ( not ( = ?auto_619826 ?auto_619840 ) ) ( not ( = ?auto_619826 ?auto_619841 ) ) ( not ( = ?auto_619827 ?auto_619828 ) ) ( not ( = ?auto_619827 ?auto_619829 ) ) ( not ( = ?auto_619827 ?auto_619830 ) ) ( not ( = ?auto_619827 ?auto_619831 ) ) ( not ( = ?auto_619827 ?auto_619832 ) ) ( not ( = ?auto_619827 ?auto_619833 ) ) ( not ( = ?auto_619827 ?auto_619834 ) ) ( not ( = ?auto_619827 ?auto_619835 ) ) ( not ( = ?auto_619827 ?auto_619836 ) ) ( not ( = ?auto_619827 ?auto_619837 ) ) ( not ( = ?auto_619827 ?auto_619838 ) ) ( not ( = ?auto_619827 ?auto_619839 ) ) ( not ( = ?auto_619827 ?auto_619840 ) ) ( not ( = ?auto_619827 ?auto_619841 ) ) ( not ( = ?auto_619828 ?auto_619829 ) ) ( not ( = ?auto_619828 ?auto_619830 ) ) ( not ( = ?auto_619828 ?auto_619831 ) ) ( not ( = ?auto_619828 ?auto_619832 ) ) ( not ( = ?auto_619828 ?auto_619833 ) ) ( not ( = ?auto_619828 ?auto_619834 ) ) ( not ( = ?auto_619828 ?auto_619835 ) ) ( not ( = ?auto_619828 ?auto_619836 ) ) ( not ( = ?auto_619828 ?auto_619837 ) ) ( not ( = ?auto_619828 ?auto_619838 ) ) ( not ( = ?auto_619828 ?auto_619839 ) ) ( not ( = ?auto_619828 ?auto_619840 ) ) ( not ( = ?auto_619828 ?auto_619841 ) ) ( not ( = ?auto_619829 ?auto_619830 ) ) ( not ( = ?auto_619829 ?auto_619831 ) ) ( not ( = ?auto_619829 ?auto_619832 ) ) ( not ( = ?auto_619829 ?auto_619833 ) ) ( not ( = ?auto_619829 ?auto_619834 ) ) ( not ( = ?auto_619829 ?auto_619835 ) ) ( not ( = ?auto_619829 ?auto_619836 ) ) ( not ( = ?auto_619829 ?auto_619837 ) ) ( not ( = ?auto_619829 ?auto_619838 ) ) ( not ( = ?auto_619829 ?auto_619839 ) ) ( not ( = ?auto_619829 ?auto_619840 ) ) ( not ( = ?auto_619829 ?auto_619841 ) ) ( not ( = ?auto_619830 ?auto_619831 ) ) ( not ( = ?auto_619830 ?auto_619832 ) ) ( not ( = ?auto_619830 ?auto_619833 ) ) ( not ( = ?auto_619830 ?auto_619834 ) ) ( not ( = ?auto_619830 ?auto_619835 ) ) ( not ( = ?auto_619830 ?auto_619836 ) ) ( not ( = ?auto_619830 ?auto_619837 ) ) ( not ( = ?auto_619830 ?auto_619838 ) ) ( not ( = ?auto_619830 ?auto_619839 ) ) ( not ( = ?auto_619830 ?auto_619840 ) ) ( not ( = ?auto_619830 ?auto_619841 ) ) ( not ( = ?auto_619831 ?auto_619832 ) ) ( not ( = ?auto_619831 ?auto_619833 ) ) ( not ( = ?auto_619831 ?auto_619834 ) ) ( not ( = ?auto_619831 ?auto_619835 ) ) ( not ( = ?auto_619831 ?auto_619836 ) ) ( not ( = ?auto_619831 ?auto_619837 ) ) ( not ( = ?auto_619831 ?auto_619838 ) ) ( not ( = ?auto_619831 ?auto_619839 ) ) ( not ( = ?auto_619831 ?auto_619840 ) ) ( not ( = ?auto_619831 ?auto_619841 ) ) ( not ( = ?auto_619832 ?auto_619833 ) ) ( not ( = ?auto_619832 ?auto_619834 ) ) ( not ( = ?auto_619832 ?auto_619835 ) ) ( not ( = ?auto_619832 ?auto_619836 ) ) ( not ( = ?auto_619832 ?auto_619837 ) ) ( not ( = ?auto_619832 ?auto_619838 ) ) ( not ( = ?auto_619832 ?auto_619839 ) ) ( not ( = ?auto_619832 ?auto_619840 ) ) ( not ( = ?auto_619832 ?auto_619841 ) ) ( not ( = ?auto_619833 ?auto_619834 ) ) ( not ( = ?auto_619833 ?auto_619835 ) ) ( not ( = ?auto_619833 ?auto_619836 ) ) ( not ( = ?auto_619833 ?auto_619837 ) ) ( not ( = ?auto_619833 ?auto_619838 ) ) ( not ( = ?auto_619833 ?auto_619839 ) ) ( not ( = ?auto_619833 ?auto_619840 ) ) ( not ( = ?auto_619833 ?auto_619841 ) ) ( not ( = ?auto_619834 ?auto_619835 ) ) ( not ( = ?auto_619834 ?auto_619836 ) ) ( not ( = ?auto_619834 ?auto_619837 ) ) ( not ( = ?auto_619834 ?auto_619838 ) ) ( not ( = ?auto_619834 ?auto_619839 ) ) ( not ( = ?auto_619834 ?auto_619840 ) ) ( not ( = ?auto_619834 ?auto_619841 ) ) ( not ( = ?auto_619835 ?auto_619836 ) ) ( not ( = ?auto_619835 ?auto_619837 ) ) ( not ( = ?auto_619835 ?auto_619838 ) ) ( not ( = ?auto_619835 ?auto_619839 ) ) ( not ( = ?auto_619835 ?auto_619840 ) ) ( not ( = ?auto_619835 ?auto_619841 ) ) ( not ( = ?auto_619836 ?auto_619837 ) ) ( not ( = ?auto_619836 ?auto_619838 ) ) ( not ( = ?auto_619836 ?auto_619839 ) ) ( not ( = ?auto_619836 ?auto_619840 ) ) ( not ( = ?auto_619836 ?auto_619841 ) ) ( not ( = ?auto_619837 ?auto_619838 ) ) ( not ( = ?auto_619837 ?auto_619839 ) ) ( not ( = ?auto_619837 ?auto_619840 ) ) ( not ( = ?auto_619837 ?auto_619841 ) ) ( not ( = ?auto_619838 ?auto_619839 ) ) ( not ( = ?auto_619838 ?auto_619840 ) ) ( not ( = ?auto_619838 ?auto_619841 ) ) ( not ( = ?auto_619839 ?auto_619840 ) ) ( not ( = ?auto_619839 ?auto_619841 ) ) ( not ( = ?auto_619840 ?auto_619841 ) ) ( ON ?auto_619839 ?auto_619840 ) ( ON ?auto_619838 ?auto_619839 ) ( ON ?auto_619837 ?auto_619838 ) ( ON ?auto_619836 ?auto_619837 ) ( ON ?auto_619835 ?auto_619836 ) ( ON ?auto_619834 ?auto_619835 ) ( ON ?auto_619833 ?auto_619834 ) ( ON ?auto_619832 ?auto_619833 ) ( ON ?auto_619831 ?auto_619832 ) ( ON ?auto_619830 ?auto_619831 ) ( CLEAR ?auto_619828 ) ( ON ?auto_619829 ?auto_619830 ) ( CLEAR ?auto_619829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_619824 ?auto_619825 ?auto_619826 ?auto_619827 ?auto_619828 ?auto_619829 )
      ( MAKE-17PILE ?auto_619824 ?auto_619825 ?auto_619826 ?auto_619827 ?auto_619828 ?auto_619829 ?auto_619830 ?auto_619831 ?auto_619832 ?auto_619833 ?auto_619834 ?auto_619835 ?auto_619836 ?auto_619837 ?auto_619838 ?auto_619839 ?auto_619840 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619859 - BLOCK
      ?auto_619860 - BLOCK
      ?auto_619861 - BLOCK
      ?auto_619862 - BLOCK
      ?auto_619863 - BLOCK
      ?auto_619864 - BLOCK
      ?auto_619865 - BLOCK
      ?auto_619866 - BLOCK
      ?auto_619867 - BLOCK
      ?auto_619868 - BLOCK
      ?auto_619869 - BLOCK
      ?auto_619870 - BLOCK
      ?auto_619871 - BLOCK
      ?auto_619872 - BLOCK
      ?auto_619873 - BLOCK
      ?auto_619874 - BLOCK
      ?auto_619875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_619875 ) ( ON-TABLE ?auto_619859 ) ( ON ?auto_619860 ?auto_619859 ) ( ON ?auto_619861 ?auto_619860 ) ( ON ?auto_619862 ?auto_619861 ) ( ON ?auto_619863 ?auto_619862 ) ( not ( = ?auto_619859 ?auto_619860 ) ) ( not ( = ?auto_619859 ?auto_619861 ) ) ( not ( = ?auto_619859 ?auto_619862 ) ) ( not ( = ?auto_619859 ?auto_619863 ) ) ( not ( = ?auto_619859 ?auto_619864 ) ) ( not ( = ?auto_619859 ?auto_619865 ) ) ( not ( = ?auto_619859 ?auto_619866 ) ) ( not ( = ?auto_619859 ?auto_619867 ) ) ( not ( = ?auto_619859 ?auto_619868 ) ) ( not ( = ?auto_619859 ?auto_619869 ) ) ( not ( = ?auto_619859 ?auto_619870 ) ) ( not ( = ?auto_619859 ?auto_619871 ) ) ( not ( = ?auto_619859 ?auto_619872 ) ) ( not ( = ?auto_619859 ?auto_619873 ) ) ( not ( = ?auto_619859 ?auto_619874 ) ) ( not ( = ?auto_619859 ?auto_619875 ) ) ( not ( = ?auto_619860 ?auto_619861 ) ) ( not ( = ?auto_619860 ?auto_619862 ) ) ( not ( = ?auto_619860 ?auto_619863 ) ) ( not ( = ?auto_619860 ?auto_619864 ) ) ( not ( = ?auto_619860 ?auto_619865 ) ) ( not ( = ?auto_619860 ?auto_619866 ) ) ( not ( = ?auto_619860 ?auto_619867 ) ) ( not ( = ?auto_619860 ?auto_619868 ) ) ( not ( = ?auto_619860 ?auto_619869 ) ) ( not ( = ?auto_619860 ?auto_619870 ) ) ( not ( = ?auto_619860 ?auto_619871 ) ) ( not ( = ?auto_619860 ?auto_619872 ) ) ( not ( = ?auto_619860 ?auto_619873 ) ) ( not ( = ?auto_619860 ?auto_619874 ) ) ( not ( = ?auto_619860 ?auto_619875 ) ) ( not ( = ?auto_619861 ?auto_619862 ) ) ( not ( = ?auto_619861 ?auto_619863 ) ) ( not ( = ?auto_619861 ?auto_619864 ) ) ( not ( = ?auto_619861 ?auto_619865 ) ) ( not ( = ?auto_619861 ?auto_619866 ) ) ( not ( = ?auto_619861 ?auto_619867 ) ) ( not ( = ?auto_619861 ?auto_619868 ) ) ( not ( = ?auto_619861 ?auto_619869 ) ) ( not ( = ?auto_619861 ?auto_619870 ) ) ( not ( = ?auto_619861 ?auto_619871 ) ) ( not ( = ?auto_619861 ?auto_619872 ) ) ( not ( = ?auto_619861 ?auto_619873 ) ) ( not ( = ?auto_619861 ?auto_619874 ) ) ( not ( = ?auto_619861 ?auto_619875 ) ) ( not ( = ?auto_619862 ?auto_619863 ) ) ( not ( = ?auto_619862 ?auto_619864 ) ) ( not ( = ?auto_619862 ?auto_619865 ) ) ( not ( = ?auto_619862 ?auto_619866 ) ) ( not ( = ?auto_619862 ?auto_619867 ) ) ( not ( = ?auto_619862 ?auto_619868 ) ) ( not ( = ?auto_619862 ?auto_619869 ) ) ( not ( = ?auto_619862 ?auto_619870 ) ) ( not ( = ?auto_619862 ?auto_619871 ) ) ( not ( = ?auto_619862 ?auto_619872 ) ) ( not ( = ?auto_619862 ?auto_619873 ) ) ( not ( = ?auto_619862 ?auto_619874 ) ) ( not ( = ?auto_619862 ?auto_619875 ) ) ( not ( = ?auto_619863 ?auto_619864 ) ) ( not ( = ?auto_619863 ?auto_619865 ) ) ( not ( = ?auto_619863 ?auto_619866 ) ) ( not ( = ?auto_619863 ?auto_619867 ) ) ( not ( = ?auto_619863 ?auto_619868 ) ) ( not ( = ?auto_619863 ?auto_619869 ) ) ( not ( = ?auto_619863 ?auto_619870 ) ) ( not ( = ?auto_619863 ?auto_619871 ) ) ( not ( = ?auto_619863 ?auto_619872 ) ) ( not ( = ?auto_619863 ?auto_619873 ) ) ( not ( = ?auto_619863 ?auto_619874 ) ) ( not ( = ?auto_619863 ?auto_619875 ) ) ( not ( = ?auto_619864 ?auto_619865 ) ) ( not ( = ?auto_619864 ?auto_619866 ) ) ( not ( = ?auto_619864 ?auto_619867 ) ) ( not ( = ?auto_619864 ?auto_619868 ) ) ( not ( = ?auto_619864 ?auto_619869 ) ) ( not ( = ?auto_619864 ?auto_619870 ) ) ( not ( = ?auto_619864 ?auto_619871 ) ) ( not ( = ?auto_619864 ?auto_619872 ) ) ( not ( = ?auto_619864 ?auto_619873 ) ) ( not ( = ?auto_619864 ?auto_619874 ) ) ( not ( = ?auto_619864 ?auto_619875 ) ) ( not ( = ?auto_619865 ?auto_619866 ) ) ( not ( = ?auto_619865 ?auto_619867 ) ) ( not ( = ?auto_619865 ?auto_619868 ) ) ( not ( = ?auto_619865 ?auto_619869 ) ) ( not ( = ?auto_619865 ?auto_619870 ) ) ( not ( = ?auto_619865 ?auto_619871 ) ) ( not ( = ?auto_619865 ?auto_619872 ) ) ( not ( = ?auto_619865 ?auto_619873 ) ) ( not ( = ?auto_619865 ?auto_619874 ) ) ( not ( = ?auto_619865 ?auto_619875 ) ) ( not ( = ?auto_619866 ?auto_619867 ) ) ( not ( = ?auto_619866 ?auto_619868 ) ) ( not ( = ?auto_619866 ?auto_619869 ) ) ( not ( = ?auto_619866 ?auto_619870 ) ) ( not ( = ?auto_619866 ?auto_619871 ) ) ( not ( = ?auto_619866 ?auto_619872 ) ) ( not ( = ?auto_619866 ?auto_619873 ) ) ( not ( = ?auto_619866 ?auto_619874 ) ) ( not ( = ?auto_619866 ?auto_619875 ) ) ( not ( = ?auto_619867 ?auto_619868 ) ) ( not ( = ?auto_619867 ?auto_619869 ) ) ( not ( = ?auto_619867 ?auto_619870 ) ) ( not ( = ?auto_619867 ?auto_619871 ) ) ( not ( = ?auto_619867 ?auto_619872 ) ) ( not ( = ?auto_619867 ?auto_619873 ) ) ( not ( = ?auto_619867 ?auto_619874 ) ) ( not ( = ?auto_619867 ?auto_619875 ) ) ( not ( = ?auto_619868 ?auto_619869 ) ) ( not ( = ?auto_619868 ?auto_619870 ) ) ( not ( = ?auto_619868 ?auto_619871 ) ) ( not ( = ?auto_619868 ?auto_619872 ) ) ( not ( = ?auto_619868 ?auto_619873 ) ) ( not ( = ?auto_619868 ?auto_619874 ) ) ( not ( = ?auto_619868 ?auto_619875 ) ) ( not ( = ?auto_619869 ?auto_619870 ) ) ( not ( = ?auto_619869 ?auto_619871 ) ) ( not ( = ?auto_619869 ?auto_619872 ) ) ( not ( = ?auto_619869 ?auto_619873 ) ) ( not ( = ?auto_619869 ?auto_619874 ) ) ( not ( = ?auto_619869 ?auto_619875 ) ) ( not ( = ?auto_619870 ?auto_619871 ) ) ( not ( = ?auto_619870 ?auto_619872 ) ) ( not ( = ?auto_619870 ?auto_619873 ) ) ( not ( = ?auto_619870 ?auto_619874 ) ) ( not ( = ?auto_619870 ?auto_619875 ) ) ( not ( = ?auto_619871 ?auto_619872 ) ) ( not ( = ?auto_619871 ?auto_619873 ) ) ( not ( = ?auto_619871 ?auto_619874 ) ) ( not ( = ?auto_619871 ?auto_619875 ) ) ( not ( = ?auto_619872 ?auto_619873 ) ) ( not ( = ?auto_619872 ?auto_619874 ) ) ( not ( = ?auto_619872 ?auto_619875 ) ) ( not ( = ?auto_619873 ?auto_619874 ) ) ( not ( = ?auto_619873 ?auto_619875 ) ) ( not ( = ?auto_619874 ?auto_619875 ) ) ( ON ?auto_619874 ?auto_619875 ) ( ON ?auto_619873 ?auto_619874 ) ( ON ?auto_619872 ?auto_619873 ) ( ON ?auto_619871 ?auto_619872 ) ( ON ?auto_619870 ?auto_619871 ) ( ON ?auto_619869 ?auto_619870 ) ( ON ?auto_619868 ?auto_619869 ) ( ON ?auto_619867 ?auto_619868 ) ( ON ?auto_619866 ?auto_619867 ) ( ON ?auto_619865 ?auto_619866 ) ( CLEAR ?auto_619863 ) ( ON ?auto_619864 ?auto_619865 ) ( CLEAR ?auto_619864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_619859 ?auto_619860 ?auto_619861 ?auto_619862 ?auto_619863 ?auto_619864 )
      ( MAKE-17PILE ?auto_619859 ?auto_619860 ?auto_619861 ?auto_619862 ?auto_619863 ?auto_619864 ?auto_619865 ?auto_619866 ?auto_619867 ?auto_619868 ?auto_619869 ?auto_619870 ?auto_619871 ?auto_619872 ?auto_619873 ?auto_619874 ?auto_619875 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619893 - BLOCK
      ?auto_619894 - BLOCK
      ?auto_619895 - BLOCK
      ?auto_619896 - BLOCK
      ?auto_619897 - BLOCK
      ?auto_619898 - BLOCK
      ?auto_619899 - BLOCK
      ?auto_619900 - BLOCK
      ?auto_619901 - BLOCK
      ?auto_619902 - BLOCK
      ?auto_619903 - BLOCK
      ?auto_619904 - BLOCK
      ?auto_619905 - BLOCK
      ?auto_619906 - BLOCK
      ?auto_619907 - BLOCK
      ?auto_619908 - BLOCK
      ?auto_619909 - BLOCK
    )
    :vars
    (
      ?auto_619910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619909 ?auto_619910 ) ( ON-TABLE ?auto_619893 ) ( ON ?auto_619894 ?auto_619893 ) ( ON ?auto_619895 ?auto_619894 ) ( ON ?auto_619896 ?auto_619895 ) ( not ( = ?auto_619893 ?auto_619894 ) ) ( not ( = ?auto_619893 ?auto_619895 ) ) ( not ( = ?auto_619893 ?auto_619896 ) ) ( not ( = ?auto_619893 ?auto_619897 ) ) ( not ( = ?auto_619893 ?auto_619898 ) ) ( not ( = ?auto_619893 ?auto_619899 ) ) ( not ( = ?auto_619893 ?auto_619900 ) ) ( not ( = ?auto_619893 ?auto_619901 ) ) ( not ( = ?auto_619893 ?auto_619902 ) ) ( not ( = ?auto_619893 ?auto_619903 ) ) ( not ( = ?auto_619893 ?auto_619904 ) ) ( not ( = ?auto_619893 ?auto_619905 ) ) ( not ( = ?auto_619893 ?auto_619906 ) ) ( not ( = ?auto_619893 ?auto_619907 ) ) ( not ( = ?auto_619893 ?auto_619908 ) ) ( not ( = ?auto_619893 ?auto_619909 ) ) ( not ( = ?auto_619893 ?auto_619910 ) ) ( not ( = ?auto_619894 ?auto_619895 ) ) ( not ( = ?auto_619894 ?auto_619896 ) ) ( not ( = ?auto_619894 ?auto_619897 ) ) ( not ( = ?auto_619894 ?auto_619898 ) ) ( not ( = ?auto_619894 ?auto_619899 ) ) ( not ( = ?auto_619894 ?auto_619900 ) ) ( not ( = ?auto_619894 ?auto_619901 ) ) ( not ( = ?auto_619894 ?auto_619902 ) ) ( not ( = ?auto_619894 ?auto_619903 ) ) ( not ( = ?auto_619894 ?auto_619904 ) ) ( not ( = ?auto_619894 ?auto_619905 ) ) ( not ( = ?auto_619894 ?auto_619906 ) ) ( not ( = ?auto_619894 ?auto_619907 ) ) ( not ( = ?auto_619894 ?auto_619908 ) ) ( not ( = ?auto_619894 ?auto_619909 ) ) ( not ( = ?auto_619894 ?auto_619910 ) ) ( not ( = ?auto_619895 ?auto_619896 ) ) ( not ( = ?auto_619895 ?auto_619897 ) ) ( not ( = ?auto_619895 ?auto_619898 ) ) ( not ( = ?auto_619895 ?auto_619899 ) ) ( not ( = ?auto_619895 ?auto_619900 ) ) ( not ( = ?auto_619895 ?auto_619901 ) ) ( not ( = ?auto_619895 ?auto_619902 ) ) ( not ( = ?auto_619895 ?auto_619903 ) ) ( not ( = ?auto_619895 ?auto_619904 ) ) ( not ( = ?auto_619895 ?auto_619905 ) ) ( not ( = ?auto_619895 ?auto_619906 ) ) ( not ( = ?auto_619895 ?auto_619907 ) ) ( not ( = ?auto_619895 ?auto_619908 ) ) ( not ( = ?auto_619895 ?auto_619909 ) ) ( not ( = ?auto_619895 ?auto_619910 ) ) ( not ( = ?auto_619896 ?auto_619897 ) ) ( not ( = ?auto_619896 ?auto_619898 ) ) ( not ( = ?auto_619896 ?auto_619899 ) ) ( not ( = ?auto_619896 ?auto_619900 ) ) ( not ( = ?auto_619896 ?auto_619901 ) ) ( not ( = ?auto_619896 ?auto_619902 ) ) ( not ( = ?auto_619896 ?auto_619903 ) ) ( not ( = ?auto_619896 ?auto_619904 ) ) ( not ( = ?auto_619896 ?auto_619905 ) ) ( not ( = ?auto_619896 ?auto_619906 ) ) ( not ( = ?auto_619896 ?auto_619907 ) ) ( not ( = ?auto_619896 ?auto_619908 ) ) ( not ( = ?auto_619896 ?auto_619909 ) ) ( not ( = ?auto_619896 ?auto_619910 ) ) ( not ( = ?auto_619897 ?auto_619898 ) ) ( not ( = ?auto_619897 ?auto_619899 ) ) ( not ( = ?auto_619897 ?auto_619900 ) ) ( not ( = ?auto_619897 ?auto_619901 ) ) ( not ( = ?auto_619897 ?auto_619902 ) ) ( not ( = ?auto_619897 ?auto_619903 ) ) ( not ( = ?auto_619897 ?auto_619904 ) ) ( not ( = ?auto_619897 ?auto_619905 ) ) ( not ( = ?auto_619897 ?auto_619906 ) ) ( not ( = ?auto_619897 ?auto_619907 ) ) ( not ( = ?auto_619897 ?auto_619908 ) ) ( not ( = ?auto_619897 ?auto_619909 ) ) ( not ( = ?auto_619897 ?auto_619910 ) ) ( not ( = ?auto_619898 ?auto_619899 ) ) ( not ( = ?auto_619898 ?auto_619900 ) ) ( not ( = ?auto_619898 ?auto_619901 ) ) ( not ( = ?auto_619898 ?auto_619902 ) ) ( not ( = ?auto_619898 ?auto_619903 ) ) ( not ( = ?auto_619898 ?auto_619904 ) ) ( not ( = ?auto_619898 ?auto_619905 ) ) ( not ( = ?auto_619898 ?auto_619906 ) ) ( not ( = ?auto_619898 ?auto_619907 ) ) ( not ( = ?auto_619898 ?auto_619908 ) ) ( not ( = ?auto_619898 ?auto_619909 ) ) ( not ( = ?auto_619898 ?auto_619910 ) ) ( not ( = ?auto_619899 ?auto_619900 ) ) ( not ( = ?auto_619899 ?auto_619901 ) ) ( not ( = ?auto_619899 ?auto_619902 ) ) ( not ( = ?auto_619899 ?auto_619903 ) ) ( not ( = ?auto_619899 ?auto_619904 ) ) ( not ( = ?auto_619899 ?auto_619905 ) ) ( not ( = ?auto_619899 ?auto_619906 ) ) ( not ( = ?auto_619899 ?auto_619907 ) ) ( not ( = ?auto_619899 ?auto_619908 ) ) ( not ( = ?auto_619899 ?auto_619909 ) ) ( not ( = ?auto_619899 ?auto_619910 ) ) ( not ( = ?auto_619900 ?auto_619901 ) ) ( not ( = ?auto_619900 ?auto_619902 ) ) ( not ( = ?auto_619900 ?auto_619903 ) ) ( not ( = ?auto_619900 ?auto_619904 ) ) ( not ( = ?auto_619900 ?auto_619905 ) ) ( not ( = ?auto_619900 ?auto_619906 ) ) ( not ( = ?auto_619900 ?auto_619907 ) ) ( not ( = ?auto_619900 ?auto_619908 ) ) ( not ( = ?auto_619900 ?auto_619909 ) ) ( not ( = ?auto_619900 ?auto_619910 ) ) ( not ( = ?auto_619901 ?auto_619902 ) ) ( not ( = ?auto_619901 ?auto_619903 ) ) ( not ( = ?auto_619901 ?auto_619904 ) ) ( not ( = ?auto_619901 ?auto_619905 ) ) ( not ( = ?auto_619901 ?auto_619906 ) ) ( not ( = ?auto_619901 ?auto_619907 ) ) ( not ( = ?auto_619901 ?auto_619908 ) ) ( not ( = ?auto_619901 ?auto_619909 ) ) ( not ( = ?auto_619901 ?auto_619910 ) ) ( not ( = ?auto_619902 ?auto_619903 ) ) ( not ( = ?auto_619902 ?auto_619904 ) ) ( not ( = ?auto_619902 ?auto_619905 ) ) ( not ( = ?auto_619902 ?auto_619906 ) ) ( not ( = ?auto_619902 ?auto_619907 ) ) ( not ( = ?auto_619902 ?auto_619908 ) ) ( not ( = ?auto_619902 ?auto_619909 ) ) ( not ( = ?auto_619902 ?auto_619910 ) ) ( not ( = ?auto_619903 ?auto_619904 ) ) ( not ( = ?auto_619903 ?auto_619905 ) ) ( not ( = ?auto_619903 ?auto_619906 ) ) ( not ( = ?auto_619903 ?auto_619907 ) ) ( not ( = ?auto_619903 ?auto_619908 ) ) ( not ( = ?auto_619903 ?auto_619909 ) ) ( not ( = ?auto_619903 ?auto_619910 ) ) ( not ( = ?auto_619904 ?auto_619905 ) ) ( not ( = ?auto_619904 ?auto_619906 ) ) ( not ( = ?auto_619904 ?auto_619907 ) ) ( not ( = ?auto_619904 ?auto_619908 ) ) ( not ( = ?auto_619904 ?auto_619909 ) ) ( not ( = ?auto_619904 ?auto_619910 ) ) ( not ( = ?auto_619905 ?auto_619906 ) ) ( not ( = ?auto_619905 ?auto_619907 ) ) ( not ( = ?auto_619905 ?auto_619908 ) ) ( not ( = ?auto_619905 ?auto_619909 ) ) ( not ( = ?auto_619905 ?auto_619910 ) ) ( not ( = ?auto_619906 ?auto_619907 ) ) ( not ( = ?auto_619906 ?auto_619908 ) ) ( not ( = ?auto_619906 ?auto_619909 ) ) ( not ( = ?auto_619906 ?auto_619910 ) ) ( not ( = ?auto_619907 ?auto_619908 ) ) ( not ( = ?auto_619907 ?auto_619909 ) ) ( not ( = ?auto_619907 ?auto_619910 ) ) ( not ( = ?auto_619908 ?auto_619909 ) ) ( not ( = ?auto_619908 ?auto_619910 ) ) ( not ( = ?auto_619909 ?auto_619910 ) ) ( ON ?auto_619908 ?auto_619909 ) ( ON ?auto_619907 ?auto_619908 ) ( ON ?auto_619906 ?auto_619907 ) ( ON ?auto_619905 ?auto_619906 ) ( ON ?auto_619904 ?auto_619905 ) ( ON ?auto_619903 ?auto_619904 ) ( ON ?auto_619902 ?auto_619903 ) ( ON ?auto_619901 ?auto_619902 ) ( ON ?auto_619900 ?auto_619901 ) ( ON ?auto_619899 ?auto_619900 ) ( ON ?auto_619898 ?auto_619899 ) ( CLEAR ?auto_619896 ) ( ON ?auto_619897 ?auto_619898 ) ( CLEAR ?auto_619897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_619893 ?auto_619894 ?auto_619895 ?auto_619896 ?auto_619897 )
      ( MAKE-17PILE ?auto_619893 ?auto_619894 ?auto_619895 ?auto_619896 ?auto_619897 ?auto_619898 ?auto_619899 ?auto_619900 ?auto_619901 ?auto_619902 ?auto_619903 ?auto_619904 ?auto_619905 ?auto_619906 ?auto_619907 ?auto_619908 ?auto_619909 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619928 - BLOCK
      ?auto_619929 - BLOCK
      ?auto_619930 - BLOCK
      ?auto_619931 - BLOCK
      ?auto_619932 - BLOCK
      ?auto_619933 - BLOCK
      ?auto_619934 - BLOCK
      ?auto_619935 - BLOCK
      ?auto_619936 - BLOCK
      ?auto_619937 - BLOCK
      ?auto_619938 - BLOCK
      ?auto_619939 - BLOCK
      ?auto_619940 - BLOCK
      ?auto_619941 - BLOCK
      ?auto_619942 - BLOCK
      ?auto_619943 - BLOCK
      ?auto_619944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_619944 ) ( ON-TABLE ?auto_619928 ) ( ON ?auto_619929 ?auto_619928 ) ( ON ?auto_619930 ?auto_619929 ) ( ON ?auto_619931 ?auto_619930 ) ( not ( = ?auto_619928 ?auto_619929 ) ) ( not ( = ?auto_619928 ?auto_619930 ) ) ( not ( = ?auto_619928 ?auto_619931 ) ) ( not ( = ?auto_619928 ?auto_619932 ) ) ( not ( = ?auto_619928 ?auto_619933 ) ) ( not ( = ?auto_619928 ?auto_619934 ) ) ( not ( = ?auto_619928 ?auto_619935 ) ) ( not ( = ?auto_619928 ?auto_619936 ) ) ( not ( = ?auto_619928 ?auto_619937 ) ) ( not ( = ?auto_619928 ?auto_619938 ) ) ( not ( = ?auto_619928 ?auto_619939 ) ) ( not ( = ?auto_619928 ?auto_619940 ) ) ( not ( = ?auto_619928 ?auto_619941 ) ) ( not ( = ?auto_619928 ?auto_619942 ) ) ( not ( = ?auto_619928 ?auto_619943 ) ) ( not ( = ?auto_619928 ?auto_619944 ) ) ( not ( = ?auto_619929 ?auto_619930 ) ) ( not ( = ?auto_619929 ?auto_619931 ) ) ( not ( = ?auto_619929 ?auto_619932 ) ) ( not ( = ?auto_619929 ?auto_619933 ) ) ( not ( = ?auto_619929 ?auto_619934 ) ) ( not ( = ?auto_619929 ?auto_619935 ) ) ( not ( = ?auto_619929 ?auto_619936 ) ) ( not ( = ?auto_619929 ?auto_619937 ) ) ( not ( = ?auto_619929 ?auto_619938 ) ) ( not ( = ?auto_619929 ?auto_619939 ) ) ( not ( = ?auto_619929 ?auto_619940 ) ) ( not ( = ?auto_619929 ?auto_619941 ) ) ( not ( = ?auto_619929 ?auto_619942 ) ) ( not ( = ?auto_619929 ?auto_619943 ) ) ( not ( = ?auto_619929 ?auto_619944 ) ) ( not ( = ?auto_619930 ?auto_619931 ) ) ( not ( = ?auto_619930 ?auto_619932 ) ) ( not ( = ?auto_619930 ?auto_619933 ) ) ( not ( = ?auto_619930 ?auto_619934 ) ) ( not ( = ?auto_619930 ?auto_619935 ) ) ( not ( = ?auto_619930 ?auto_619936 ) ) ( not ( = ?auto_619930 ?auto_619937 ) ) ( not ( = ?auto_619930 ?auto_619938 ) ) ( not ( = ?auto_619930 ?auto_619939 ) ) ( not ( = ?auto_619930 ?auto_619940 ) ) ( not ( = ?auto_619930 ?auto_619941 ) ) ( not ( = ?auto_619930 ?auto_619942 ) ) ( not ( = ?auto_619930 ?auto_619943 ) ) ( not ( = ?auto_619930 ?auto_619944 ) ) ( not ( = ?auto_619931 ?auto_619932 ) ) ( not ( = ?auto_619931 ?auto_619933 ) ) ( not ( = ?auto_619931 ?auto_619934 ) ) ( not ( = ?auto_619931 ?auto_619935 ) ) ( not ( = ?auto_619931 ?auto_619936 ) ) ( not ( = ?auto_619931 ?auto_619937 ) ) ( not ( = ?auto_619931 ?auto_619938 ) ) ( not ( = ?auto_619931 ?auto_619939 ) ) ( not ( = ?auto_619931 ?auto_619940 ) ) ( not ( = ?auto_619931 ?auto_619941 ) ) ( not ( = ?auto_619931 ?auto_619942 ) ) ( not ( = ?auto_619931 ?auto_619943 ) ) ( not ( = ?auto_619931 ?auto_619944 ) ) ( not ( = ?auto_619932 ?auto_619933 ) ) ( not ( = ?auto_619932 ?auto_619934 ) ) ( not ( = ?auto_619932 ?auto_619935 ) ) ( not ( = ?auto_619932 ?auto_619936 ) ) ( not ( = ?auto_619932 ?auto_619937 ) ) ( not ( = ?auto_619932 ?auto_619938 ) ) ( not ( = ?auto_619932 ?auto_619939 ) ) ( not ( = ?auto_619932 ?auto_619940 ) ) ( not ( = ?auto_619932 ?auto_619941 ) ) ( not ( = ?auto_619932 ?auto_619942 ) ) ( not ( = ?auto_619932 ?auto_619943 ) ) ( not ( = ?auto_619932 ?auto_619944 ) ) ( not ( = ?auto_619933 ?auto_619934 ) ) ( not ( = ?auto_619933 ?auto_619935 ) ) ( not ( = ?auto_619933 ?auto_619936 ) ) ( not ( = ?auto_619933 ?auto_619937 ) ) ( not ( = ?auto_619933 ?auto_619938 ) ) ( not ( = ?auto_619933 ?auto_619939 ) ) ( not ( = ?auto_619933 ?auto_619940 ) ) ( not ( = ?auto_619933 ?auto_619941 ) ) ( not ( = ?auto_619933 ?auto_619942 ) ) ( not ( = ?auto_619933 ?auto_619943 ) ) ( not ( = ?auto_619933 ?auto_619944 ) ) ( not ( = ?auto_619934 ?auto_619935 ) ) ( not ( = ?auto_619934 ?auto_619936 ) ) ( not ( = ?auto_619934 ?auto_619937 ) ) ( not ( = ?auto_619934 ?auto_619938 ) ) ( not ( = ?auto_619934 ?auto_619939 ) ) ( not ( = ?auto_619934 ?auto_619940 ) ) ( not ( = ?auto_619934 ?auto_619941 ) ) ( not ( = ?auto_619934 ?auto_619942 ) ) ( not ( = ?auto_619934 ?auto_619943 ) ) ( not ( = ?auto_619934 ?auto_619944 ) ) ( not ( = ?auto_619935 ?auto_619936 ) ) ( not ( = ?auto_619935 ?auto_619937 ) ) ( not ( = ?auto_619935 ?auto_619938 ) ) ( not ( = ?auto_619935 ?auto_619939 ) ) ( not ( = ?auto_619935 ?auto_619940 ) ) ( not ( = ?auto_619935 ?auto_619941 ) ) ( not ( = ?auto_619935 ?auto_619942 ) ) ( not ( = ?auto_619935 ?auto_619943 ) ) ( not ( = ?auto_619935 ?auto_619944 ) ) ( not ( = ?auto_619936 ?auto_619937 ) ) ( not ( = ?auto_619936 ?auto_619938 ) ) ( not ( = ?auto_619936 ?auto_619939 ) ) ( not ( = ?auto_619936 ?auto_619940 ) ) ( not ( = ?auto_619936 ?auto_619941 ) ) ( not ( = ?auto_619936 ?auto_619942 ) ) ( not ( = ?auto_619936 ?auto_619943 ) ) ( not ( = ?auto_619936 ?auto_619944 ) ) ( not ( = ?auto_619937 ?auto_619938 ) ) ( not ( = ?auto_619937 ?auto_619939 ) ) ( not ( = ?auto_619937 ?auto_619940 ) ) ( not ( = ?auto_619937 ?auto_619941 ) ) ( not ( = ?auto_619937 ?auto_619942 ) ) ( not ( = ?auto_619937 ?auto_619943 ) ) ( not ( = ?auto_619937 ?auto_619944 ) ) ( not ( = ?auto_619938 ?auto_619939 ) ) ( not ( = ?auto_619938 ?auto_619940 ) ) ( not ( = ?auto_619938 ?auto_619941 ) ) ( not ( = ?auto_619938 ?auto_619942 ) ) ( not ( = ?auto_619938 ?auto_619943 ) ) ( not ( = ?auto_619938 ?auto_619944 ) ) ( not ( = ?auto_619939 ?auto_619940 ) ) ( not ( = ?auto_619939 ?auto_619941 ) ) ( not ( = ?auto_619939 ?auto_619942 ) ) ( not ( = ?auto_619939 ?auto_619943 ) ) ( not ( = ?auto_619939 ?auto_619944 ) ) ( not ( = ?auto_619940 ?auto_619941 ) ) ( not ( = ?auto_619940 ?auto_619942 ) ) ( not ( = ?auto_619940 ?auto_619943 ) ) ( not ( = ?auto_619940 ?auto_619944 ) ) ( not ( = ?auto_619941 ?auto_619942 ) ) ( not ( = ?auto_619941 ?auto_619943 ) ) ( not ( = ?auto_619941 ?auto_619944 ) ) ( not ( = ?auto_619942 ?auto_619943 ) ) ( not ( = ?auto_619942 ?auto_619944 ) ) ( not ( = ?auto_619943 ?auto_619944 ) ) ( ON ?auto_619943 ?auto_619944 ) ( ON ?auto_619942 ?auto_619943 ) ( ON ?auto_619941 ?auto_619942 ) ( ON ?auto_619940 ?auto_619941 ) ( ON ?auto_619939 ?auto_619940 ) ( ON ?auto_619938 ?auto_619939 ) ( ON ?auto_619937 ?auto_619938 ) ( ON ?auto_619936 ?auto_619937 ) ( ON ?auto_619935 ?auto_619936 ) ( ON ?auto_619934 ?auto_619935 ) ( ON ?auto_619933 ?auto_619934 ) ( CLEAR ?auto_619931 ) ( ON ?auto_619932 ?auto_619933 ) ( CLEAR ?auto_619932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_619928 ?auto_619929 ?auto_619930 ?auto_619931 ?auto_619932 )
      ( MAKE-17PILE ?auto_619928 ?auto_619929 ?auto_619930 ?auto_619931 ?auto_619932 ?auto_619933 ?auto_619934 ?auto_619935 ?auto_619936 ?auto_619937 ?auto_619938 ?auto_619939 ?auto_619940 ?auto_619941 ?auto_619942 ?auto_619943 ?auto_619944 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619962 - BLOCK
      ?auto_619963 - BLOCK
      ?auto_619964 - BLOCK
      ?auto_619965 - BLOCK
      ?auto_619966 - BLOCK
      ?auto_619967 - BLOCK
      ?auto_619968 - BLOCK
      ?auto_619969 - BLOCK
      ?auto_619970 - BLOCK
      ?auto_619971 - BLOCK
      ?auto_619972 - BLOCK
      ?auto_619973 - BLOCK
      ?auto_619974 - BLOCK
      ?auto_619975 - BLOCK
      ?auto_619976 - BLOCK
      ?auto_619977 - BLOCK
      ?auto_619978 - BLOCK
    )
    :vars
    (
      ?auto_619979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_619978 ?auto_619979 ) ( ON-TABLE ?auto_619962 ) ( ON ?auto_619963 ?auto_619962 ) ( ON ?auto_619964 ?auto_619963 ) ( not ( = ?auto_619962 ?auto_619963 ) ) ( not ( = ?auto_619962 ?auto_619964 ) ) ( not ( = ?auto_619962 ?auto_619965 ) ) ( not ( = ?auto_619962 ?auto_619966 ) ) ( not ( = ?auto_619962 ?auto_619967 ) ) ( not ( = ?auto_619962 ?auto_619968 ) ) ( not ( = ?auto_619962 ?auto_619969 ) ) ( not ( = ?auto_619962 ?auto_619970 ) ) ( not ( = ?auto_619962 ?auto_619971 ) ) ( not ( = ?auto_619962 ?auto_619972 ) ) ( not ( = ?auto_619962 ?auto_619973 ) ) ( not ( = ?auto_619962 ?auto_619974 ) ) ( not ( = ?auto_619962 ?auto_619975 ) ) ( not ( = ?auto_619962 ?auto_619976 ) ) ( not ( = ?auto_619962 ?auto_619977 ) ) ( not ( = ?auto_619962 ?auto_619978 ) ) ( not ( = ?auto_619962 ?auto_619979 ) ) ( not ( = ?auto_619963 ?auto_619964 ) ) ( not ( = ?auto_619963 ?auto_619965 ) ) ( not ( = ?auto_619963 ?auto_619966 ) ) ( not ( = ?auto_619963 ?auto_619967 ) ) ( not ( = ?auto_619963 ?auto_619968 ) ) ( not ( = ?auto_619963 ?auto_619969 ) ) ( not ( = ?auto_619963 ?auto_619970 ) ) ( not ( = ?auto_619963 ?auto_619971 ) ) ( not ( = ?auto_619963 ?auto_619972 ) ) ( not ( = ?auto_619963 ?auto_619973 ) ) ( not ( = ?auto_619963 ?auto_619974 ) ) ( not ( = ?auto_619963 ?auto_619975 ) ) ( not ( = ?auto_619963 ?auto_619976 ) ) ( not ( = ?auto_619963 ?auto_619977 ) ) ( not ( = ?auto_619963 ?auto_619978 ) ) ( not ( = ?auto_619963 ?auto_619979 ) ) ( not ( = ?auto_619964 ?auto_619965 ) ) ( not ( = ?auto_619964 ?auto_619966 ) ) ( not ( = ?auto_619964 ?auto_619967 ) ) ( not ( = ?auto_619964 ?auto_619968 ) ) ( not ( = ?auto_619964 ?auto_619969 ) ) ( not ( = ?auto_619964 ?auto_619970 ) ) ( not ( = ?auto_619964 ?auto_619971 ) ) ( not ( = ?auto_619964 ?auto_619972 ) ) ( not ( = ?auto_619964 ?auto_619973 ) ) ( not ( = ?auto_619964 ?auto_619974 ) ) ( not ( = ?auto_619964 ?auto_619975 ) ) ( not ( = ?auto_619964 ?auto_619976 ) ) ( not ( = ?auto_619964 ?auto_619977 ) ) ( not ( = ?auto_619964 ?auto_619978 ) ) ( not ( = ?auto_619964 ?auto_619979 ) ) ( not ( = ?auto_619965 ?auto_619966 ) ) ( not ( = ?auto_619965 ?auto_619967 ) ) ( not ( = ?auto_619965 ?auto_619968 ) ) ( not ( = ?auto_619965 ?auto_619969 ) ) ( not ( = ?auto_619965 ?auto_619970 ) ) ( not ( = ?auto_619965 ?auto_619971 ) ) ( not ( = ?auto_619965 ?auto_619972 ) ) ( not ( = ?auto_619965 ?auto_619973 ) ) ( not ( = ?auto_619965 ?auto_619974 ) ) ( not ( = ?auto_619965 ?auto_619975 ) ) ( not ( = ?auto_619965 ?auto_619976 ) ) ( not ( = ?auto_619965 ?auto_619977 ) ) ( not ( = ?auto_619965 ?auto_619978 ) ) ( not ( = ?auto_619965 ?auto_619979 ) ) ( not ( = ?auto_619966 ?auto_619967 ) ) ( not ( = ?auto_619966 ?auto_619968 ) ) ( not ( = ?auto_619966 ?auto_619969 ) ) ( not ( = ?auto_619966 ?auto_619970 ) ) ( not ( = ?auto_619966 ?auto_619971 ) ) ( not ( = ?auto_619966 ?auto_619972 ) ) ( not ( = ?auto_619966 ?auto_619973 ) ) ( not ( = ?auto_619966 ?auto_619974 ) ) ( not ( = ?auto_619966 ?auto_619975 ) ) ( not ( = ?auto_619966 ?auto_619976 ) ) ( not ( = ?auto_619966 ?auto_619977 ) ) ( not ( = ?auto_619966 ?auto_619978 ) ) ( not ( = ?auto_619966 ?auto_619979 ) ) ( not ( = ?auto_619967 ?auto_619968 ) ) ( not ( = ?auto_619967 ?auto_619969 ) ) ( not ( = ?auto_619967 ?auto_619970 ) ) ( not ( = ?auto_619967 ?auto_619971 ) ) ( not ( = ?auto_619967 ?auto_619972 ) ) ( not ( = ?auto_619967 ?auto_619973 ) ) ( not ( = ?auto_619967 ?auto_619974 ) ) ( not ( = ?auto_619967 ?auto_619975 ) ) ( not ( = ?auto_619967 ?auto_619976 ) ) ( not ( = ?auto_619967 ?auto_619977 ) ) ( not ( = ?auto_619967 ?auto_619978 ) ) ( not ( = ?auto_619967 ?auto_619979 ) ) ( not ( = ?auto_619968 ?auto_619969 ) ) ( not ( = ?auto_619968 ?auto_619970 ) ) ( not ( = ?auto_619968 ?auto_619971 ) ) ( not ( = ?auto_619968 ?auto_619972 ) ) ( not ( = ?auto_619968 ?auto_619973 ) ) ( not ( = ?auto_619968 ?auto_619974 ) ) ( not ( = ?auto_619968 ?auto_619975 ) ) ( not ( = ?auto_619968 ?auto_619976 ) ) ( not ( = ?auto_619968 ?auto_619977 ) ) ( not ( = ?auto_619968 ?auto_619978 ) ) ( not ( = ?auto_619968 ?auto_619979 ) ) ( not ( = ?auto_619969 ?auto_619970 ) ) ( not ( = ?auto_619969 ?auto_619971 ) ) ( not ( = ?auto_619969 ?auto_619972 ) ) ( not ( = ?auto_619969 ?auto_619973 ) ) ( not ( = ?auto_619969 ?auto_619974 ) ) ( not ( = ?auto_619969 ?auto_619975 ) ) ( not ( = ?auto_619969 ?auto_619976 ) ) ( not ( = ?auto_619969 ?auto_619977 ) ) ( not ( = ?auto_619969 ?auto_619978 ) ) ( not ( = ?auto_619969 ?auto_619979 ) ) ( not ( = ?auto_619970 ?auto_619971 ) ) ( not ( = ?auto_619970 ?auto_619972 ) ) ( not ( = ?auto_619970 ?auto_619973 ) ) ( not ( = ?auto_619970 ?auto_619974 ) ) ( not ( = ?auto_619970 ?auto_619975 ) ) ( not ( = ?auto_619970 ?auto_619976 ) ) ( not ( = ?auto_619970 ?auto_619977 ) ) ( not ( = ?auto_619970 ?auto_619978 ) ) ( not ( = ?auto_619970 ?auto_619979 ) ) ( not ( = ?auto_619971 ?auto_619972 ) ) ( not ( = ?auto_619971 ?auto_619973 ) ) ( not ( = ?auto_619971 ?auto_619974 ) ) ( not ( = ?auto_619971 ?auto_619975 ) ) ( not ( = ?auto_619971 ?auto_619976 ) ) ( not ( = ?auto_619971 ?auto_619977 ) ) ( not ( = ?auto_619971 ?auto_619978 ) ) ( not ( = ?auto_619971 ?auto_619979 ) ) ( not ( = ?auto_619972 ?auto_619973 ) ) ( not ( = ?auto_619972 ?auto_619974 ) ) ( not ( = ?auto_619972 ?auto_619975 ) ) ( not ( = ?auto_619972 ?auto_619976 ) ) ( not ( = ?auto_619972 ?auto_619977 ) ) ( not ( = ?auto_619972 ?auto_619978 ) ) ( not ( = ?auto_619972 ?auto_619979 ) ) ( not ( = ?auto_619973 ?auto_619974 ) ) ( not ( = ?auto_619973 ?auto_619975 ) ) ( not ( = ?auto_619973 ?auto_619976 ) ) ( not ( = ?auto_619973 ?auto_619977 ) ) ( not ( = ?auto_619973 ?auto_619978 ) ) ( not ( = ?auto_619973 ?auto_619979 ) ) ( not ( = ?auto_619974 ?auto_619975 ) ) ( not ( = ?auto_619974 ?auto_619976 ) ) ( not ( = ?auto_619974 ?auto_619977 ) ) ( not ( = ?auto_619974 ?auto_619978 ) ) ( not ( = ?auto_619974 ?auto_619979 ) ) ( not ( = ?auto_619975 ?auto_619976 ) ) ( not ( = ?auto_619975 ?auto_619977 ) ) ( not ( = ?auto_619975 ?auto_619978 ) ) ( not ( = ?auto_619975 ?auto_619979 ) ) ( not ( = ?auto_619976 ?auto_619977 ) ) ( not ( = ?auto_619976 ?auto_619978 ) ) ( not ( = ?auto_619976 ?auto_619979 ) ) ( not ( = ?auto_619977 ?auto_619978 ) ) ( not ( = ?auto_619977 ?auto_619979 ) ) ( not ( = ?auto_619978 ?auto_619979 ) ) ( ON ?auto_619977 ?auto_619978 ) ( ON ?auto_619976 ?auto_619977 ) ( ON ?auto_619975 ?auto_619976 ) ( ON ?auto_619974 ?auto_619975 ) ( ON ?auto_619973 ?auto_619974 ) ( ON ?auto_619972 ?auto_619973 ) ( ON ?auto_619971 ?auto_619972 ) ( ON ?auto_619970 ?auto_619971 ) ( ON ?auto_619969 ?auto_619970 ) ( ON ?auto_619968 ?auto_619969 ) ( ON ?auto_619967 ?auto_619968 ) ( ON ?auto_619966 ?auto_619967 ) ( CLEAR ?auto_619964 ) ( ON ?auto_619965 ?auto_619966 ) ( CLEAR ?auto_619965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_619962 ?auto_619963 ?auto_619964 ?auto_619965 )
      ( MAKE-17PILE ?auto_619962 ?auto_619963 ?auto_619964 ?auto_619965 ?auto_619966 ?auto_619967 ?auto_619968 ?auto_619969 ?auto_619970 ?auto_619971 ?auto_619972 ?auto_619973 ?auto_619974 ?auto_619975 ?auto_619976 ?auto_619977 ?auto_619978 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_619997 - BLOCK
      ?auto_619998 - BLOCK
      ?auto_619999 - BLOCK
      ?auto_620000 - BLOCK
      ?auto_620001 - BLOCK
      ?auto_620002 - BLOCK
      ?auto_620003 - BLOCK
      ?auto_620004 - BLOCK
      ?auto_620005 - BLOCK
      ?auto_620006 - BLOCK
      ?auto_620007 - BLOCK
      ?auto_620008 - BLOCK
      ?auto_620009 - BLOCK
      ?auto_620010 - BLOCK
      ?auto_620011 - BLOCK
      ?auto_620012 - BLOCK
      ?auto_620013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_620013 ) ( ON-TABLE ?auto_619997 ) ( ON ?auto_619998 ?auto_619997 ) ( ON ?auto_619999 ?auto_619998 ) ( not ( = ?auto_619997 ?auto_619998 ) ) ( not ( = ?auto_619997 ?auto_619999 ) ) ( not ( = ?auto_619997 ?auto_620000 ) ) ( not ( = ?auto_619997 ?auto_620001 ) ) ( not ( = ?auto_619997 ?auto_620002 ) ) ( not ( = ?auto_619997 ?auto_620003 ) ) ( not ( = ?auto_619997 ?auto_620004 ) ) ( not ( = ?auto_619997 ?auto_620005 ) ) ( not ( = ?auto_619997 ?auto_620006 ) ) ( not ( = ?auto_619997 ?auto_620007 ) ) ( not ( = ?auto_619997 ?auto_620008 ) ) ( not ( = ?auto_619997 ?auto_620009 ) ) ( not ( = ?auto_619997 ?auto_620010 ) ) ( not ( = ?auto_619997 ?auto_620011 ) ) ( not ( = ?auto_619997 ?auto_620012 ) ) ( not ( = ?auto_619997 ?auto_620013 ) ) ( not ( = ?auto_619998 ?auto_619999 ) ) ( not ( = ?auto_619998 ?auto_620000 ) ) ( not ( = ?auto_619998 ?auto_620001 ) ) ( not ( = ?auto_619998 ?auto_620002 ) ) ( not ( = ?auto_619998 ?auto_620003 ) ) ( not ( = ?auto_619998 ?auto_620004 ) ) ( not ( = ?auto_619998 ?auto_620005 ) ) ( not ( = ?auto_619998 ?auto_620006 ) ) ( not ( = ?auto_619998 ?auto_620007 ) ) ( not ( = ?auto_619998 ?auto_620008 ) ) ( not ( = ?auto_619998 ?auto_620009 ) ) ( not ( = ?auto_619998 ?auto_620010 ) ) ( not ( = ?auto_619998 ?auto_620011 ) ) ( not ( = ?auto_619998 ?auto_620012 ) ) ( not ( = ?auto_619998 ?auto_620013 ) ) ( not ( = ?auto_619999 ?auto_620000 ) ) ( not ( = ?auto_619999 ?auto_620001 ) ) ( not ( = ?auto_619999 ?auto_620002 ) ) ( not ( = ?auto_619999 ?auto_620003 ) ) ( not ( = ?auto_619999 ?auto_620004 ) ) ( not ( = ?auto_619999 ?auto_620005 ) ) ( not ( = ?auto_619999 ?auto_620006 ) ) ( not ( = ?auto_619999 ?auto_620007 ) ) ( not ( = ?auto_619999 ?auto_620008 ) ) ( not ( = ?auto_619999 ?auto_620009 ) ) ( not ( = ?auto_619999 ?auto_620010 ) ) ( not ( = ?auto_619999 ?auto_620011 ) ) ( not ( = ?auto_619999 ?auto_620012 ) ) ( not ( = ?auto_619999 ?auto_620013 ) ) ( not ( = ?auto_620000 ?auto_620001 ) ) ( not ( = ?auto_620000 ?auto_620002 ) ) ( not ( = ?auto_620000 ?auto_620003 ) ) ( not ( = ?auto_620000 ?auto_620004 ) ) ( not ( = ?auto_620000 ?auto_620005 ) ) ( not ( = ?auto_620000 ?auto_620006 ) ) ( not ( = ?auto_620000 ?auto_620007 ) ) ( not ( = ?auto_620000 ?auto_620008 ) ) ( not ( = ?auto_620000 ?auto_620009 ) ) ( not ( = ?auto_620000 ?auto_620010 ) ) ( not ( = ?auto_620000 ?auto_620011 ) ) ( not ( = ?auto_620000 ?auto_620012 ) ) ( not ( = ?auto_620000 ?auto_620013 ) ) ( not ( = ?auto_620001 ?auto_620002 ) ) ( not ( = ?auto_620001 ?auto_620003 ) ) ( not ( = ?auto_620001 ?auto_620004 ) ) ( not ( = ?auto_620001 ?auto_620005 ) ) ( not ( = ?auto_620001 ?auto_620006 ) ) ( not ( = ?auto_620001 ?auto_620007 ) ) ( not ( = ?auto_620001 ?auto_620008 ) ) ( not ( = ?auto_620001 ?auto_620009 ) ) ( not ( = ?auto_620001 ?auto_620010 ) ) ( not ( = ?auto_620001 ?auto_620011 ) ) ( not ( = ?auto_620001 ?auto_620012 ) ) ( not ( = ?auto_620001 ?auto_620013 ) ) ( not ( = ?auto_620002 ?auto_620003 ) ) ( not ( = ?auto_620002 ?auto_620004 ) ) ( not ( = ?auto_620002 ?auto_620005 ) ) ( not ( = ?auto_620002 ?auto_620006 ) ) ( not ( = ?auto_620002 ?auto_620007 ) ) ( not ( = ?auto_620002 ?auto_620008 ) ) ( not ( = ?auto_620002 ?auto_620009 ) ) ( not ( = ?auto_620002 ?auto_620010 ) ) ( not ( = ?auto_620002 ?auto_620011 ) ) ( not ( = ?auto_620002 ?auto_620012 ) ) ( not ( = ?auto_620002 ?auto_620013 ) ) ( not ( = ?auto_620003 ?auto_620004 ) ) ( not ( = ?auto_620003 ?auto_620005 ) ) ( not ( = ?auto_620003 ?auto_620006 ) ) ( not ( = ?auto_620003 ?auto_620007 ) ) ( not ( = ?auto_620003 ?auto_620008 ) ) ( not ( = ?auto_620003 ?auto_620009 ) ) ( not ( = ?auto_620003 ?auto_620010 ) ) ( not ( = ?auto_620003 ?auto_620011 ) ) ( not ( = ?auto_620003 ?auto_620012 ) ) ( not ( = ?auto_620003 ?auto_620013 ) ) ( not ( = ?auto_620004 ?auto_620005 ) ) ( not ( = ?auto_620004 ?auto_620006 ) ) ( not ( = ?auto_620004 ?auto_620007 ) ) ( not ( = ?auto_620004 ?auto_620008 ) ) ( not ( = ?auto_620004 ?auto_620009 ) ) ( not ( = ?auto_620004 ?auto_620010 ) ) ( not ( = ?auto_620004 ?auto_620011 ) ) ( not ( = ?auto_620004 ?auto_620012 ) ) ( not ( = ?auto_620004 ?auto_620013 ) ) ( not ( = ?auto_620005 ?auto_620006 ) ) ( not ( = ?auto_620005 ?auto_620007 ) ) ( not ( = ?auto_620005 ?auto_620008 ) ) ( not ( = ?auto_620005 ?auto_620009 ) ) ( not ( = ?auto_620005 ?auto_620010 ) ) ( not ( = ?auto_620005 ?auto_620011 ) ) ( not ( = ?auto_620005 ?auto_620012 ) ) ( not ( = ?auto_620005 ?auto_620013 ) ) ( not ( = ?auto_620006 ?auto_620007 ) ) ( not ( = ?auto_620006 ?auto_620008 ) ) ( not ( = ?auto_620006 ?auto_620009 ) ) ( not ( = ?auto_620006 ?auto_620010 ) ) ( not ( = ?auto_620006 ?auto_620011 ) ) ( not ( = ?auto_620006 ?auto_620012 ) ) ( not ( = ?auto_620006 ?auto_620013 ) ) ( not ( = ?auto_620007 ?auto_620008 ) ) ( not ( = ?auto_620007 ?auto_620009 ) ) ( not ( = ?auto_620007 ?auto_620010 ) ) ( not ( = ?auto_620007 ?auto_620011 ) ) ( not ( = ?auto_620007 ?auto_620012 ) ) ( not ( = ?auto_620007 ?auto_620013 ) ) ( not ( = ?auto_620008 ?auto_620009 ) ) ( not ( = ?auto_620008 ?auto_620010 ) ) ( not ( = ?auto_620008 ?auto_620011 ) ) ( not ( = ?auto_620008 ?auto_620012 ) ) ( not ( = ?auto_620008 ?auto_620013 ) ) ( not ( = ?auto_620009 ?auto_620010 ) ) ( not ( = ?auto_620009 ?auto_620011 ) ) ( not ( = ?auto_620009 ?auto_620012 ) ) ( not ( = ?auto_620009 ?auto_620013 ) ) ( not ( = ?auto_620010 ?auto_620011 ) ) ( not ( = ?auto_620010 ?auto_620012 ) ) ( not ( = ?auto_620010 ?auto_620013 ) ) ( not ( = ?auto_620011 ?auto_620012 ) ) ( not ( = ?auto_620011 ?auto_620013 ) ) ( not ( = ?auto_620012 ?auto_620013 ) ) ( ON ?auto_620012 ?auto_620013 ) ( ON ?auto_620011 ?auto_620012 ) ( ON ?auto_620010 ?auto_620011 ) ( ON ?auto_620009 ?auto_620010 ) ( ON ?auto_620008 ?auto_620009 ) ( ON ?auto_620007 ?auto_620008 ) ( ON ?auto_620006 ?auto_620007 ) ( ON ?auto_620005 ?auto_620006 ) ( ON ?auto_620004 ?auto_620005 ) ( ON ?auto_620003 ?auto_620004 ) ( ON ?auto_620002 ?auto_620003 ) ( ON ?auto_620001 ?auto_620002 ) ( CLEAR ?auto_619999 ) ( ON ?auto_620000 ?auto_620001 ) ( CLEAR ?auto_620000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_619997 ?auto_619998 ?auto_619999 ?auto_620000 )
      ( MAKE-17PILE ?auto_619997 ?auto_619998 ?auto_619999 ?auto_620000 ?auto_620001 ?auto_620002 ?auto_620003 ?auto_620004 ?auto_620005 ?auto_620006 ?auto_620007 ?auto_620008 ?auto_620009 ?auto_620010 ?auto_620011 ?auto_620012 ?auto_620013 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_620031 - BLOCK
      ?auto_620032 - BLOCK
      ?auto_620033 - BLOCK
      ?auto_620034 - BLOCK
      ?auto_620035 - BLOCK
      ?auto_620036 - BLOCK
      ?auto_620037 - BLOCK
      ?auto_620038 - BLOCK
      ?auto_620039 - BLOCK
      ?auto_620040 - BLOCK
      ?auto_620041 - BLOCK
      ?auto_620042 - BLOCK
      ?auto_620043 - BLOCK
      ?auto_620044 - BLOCK
      ?auto_620045 - BLOCK
      ?auto_620046 - BLOCK
      ?auto_620047 - BLOCK
    )
    :vars
    (
      ?auto_620048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620047 ?auto_620048 ) ( ON-TABLE ?auto_620031 ) ( ON ?auto_620032 ?auto_620031 ) ( not ( = ?auto_620031 ?auto_620032 ) ) ( not ( = ?auto_620031 ?auto_620033 ) ) ( not ( = ?auto_620031 ?auto_620034 ) ) ( not ( = ?auto_620031 ?auto_620035 ) ) ( not ( = ?auto_620031 ?auto_620036 ) ) ( not ( = ?auto_620031 ?auto_620037 ) ) ( not ( = ?auto_620031 ?auto_620038 ) ) ( not ( = ?auto_620031 ?auto_620039 ) ) ( not ( = ?auto_620031 ?auto_620040 ) ) ( not ( = ?auto_620031 ?auto_620041 ) ) ( not ( = ?auto_620031 ?auto_620042 ) ) ( not ( = ?auto_620031 ?auto_620043 ) ) ( not ( = ?auto_620031 ?auto_620044 ) ) ( not ( = ?auto_620031 ?auto_620045 ) ) ( not ( = ?auto_620031 ?auto_620046 ) ) ( not ( = ?auto_620031 ?auto_620047 ) ) ( not ( = ?auto_620031 ?auto_620048 ) ) ( not ( = ?auto_620032 ?auto_620033 ) ) ( not ( = ?auto_620032 ?auto_620034 ) ) ( not ( = ?auto_620032 ?auto_620035 ) ) ( not ( = ?auto_620032 ?auto_620036 ) ) ( not ( = ?auto_620032 ?auto_620037 ) ) ( not ( = ?auto_620032 ?auto_620038 ) ) ( not ( = ?auto_620032 ?auto_620039 ) ) ( not ( = ?auto_620032 ?auto_620040 ) ) ( not ( = ?auto_620032 ?auto_620041 ) ) ( not ( = ?auto_620032 ?auto_620042 ) ) ( not ( = ?auto_620032 ?auto_620043 ) ) ( not ( = ?auto_620032 ?auto_620044 ) ) ( not ( = ?auto_620032 ?auto_620045 ) ) ( not ( = ?auto_620032 ?auto_620046 ) ) ( not ( = ?auto_620032 ?auto_620047 ) ) ( not ( = ?auto_620032 ?auto_620048 ) ) ( not ( = ?auto_620033 ?auto_620034 ) ) ( not ( = ?auto_620033 ?auto_620035 ) ) ( not ( = ?auto_620033 ?auto_620036 ) ) ( not ( = ?auto_620033 ?auto_620037 ) ) ( not ( = ?auto_620033 ?auto_620038 ) ) ( not ( = ?auto_620033 ?auto_620039 ) ) ( not ( = ?auto_620033 ?auto_620040 ) ) ( not ( = ?auto_620033 ?auto_620041 ) ) ( not ( = ?auto_620033 ?auto_620042 ) ) ( not ( = ?auto_620033 ?auto_620043 ) ) ( not ( = ?auto_620033 ?auto_620044 ) ) ( not ( = ?auto_620033 ?auto_620045 ) ) ( not ( = ?auto_620033 ?auto_620046 ) ) ( not ( = ?auto_620033 ?auto_620047 ) ) ( not ( = ?auto_620033 ?auto_620048 ) ) ( not ( = ?auto_620034 ?auto_620035 ) ) ( not ( = ?auto_620034 ?auto_620036 ) ) ( not ( = ?auto_620034 ?auto_620037 ) ) ( not ( = ?auto_620034 ?auto_620038 ) ) ( not ( = ?auto_620034 ?auto_620039 ) ) ( not ( = ?auto_620034 ?auto_620040 ) ) ( not ( = ?auto_620034 ?auto_620041 ) ) ( not ( = ?auto_620034 ?auto_620042 ) ) ( not ( = ?auto_620034 ?auto_620043 ) ) ( not ( = ?auto_620034 ?auto_620044 ) ) ( not ( = ?auto_620034 ?auto_620045 ) ) ( not ( = ?auto_620034 ?auto_620046 ) ) ( not ( = ?auto_620034 ?auto_620047 ) ) ( not ( = ?auto_620034 ?auto_620048 ) ) ( not ( = ?auto_620035 ?auto_620036 ) ) ( not ( = ?auto_620035 ?auto_620037 ) ) ( not ( = ?auto_620035 ?auto_620038 ) ) ( not ( = ?auto_620035 ?auto_620039 ) ) ( not ( = ?auto_620035 ?auto_620040 ) ) ( not ( = ?auto_620035 ?auto_620041 ) ) ( not ( = ?auto_620035 ?auto_620042 ) ) ( not ( = ?auto_620035 ?auto_620043 ) ) ( not ( = ?auto_620035 ?auto_620044 ) ) ( not ( = ?auto_620035 ?auto_620045 ) ) ( not ( = ?auto_620035 ?auto_620046 ) ) ( not ( = ?auto_620035 ?auto_620047 ) ) ( not ( = ?auto_620035 ?auto_620048 ) ) ( not ( = ?auto_620036 ?auto_620037 ) ) ( not ( = ?auto_620036 ?auto_620038 ) ) ( not ( = ?auto_620036 ?auto_620039 ) ) ( not ( = ?auto_620036 ?auto_620040 ) ) ( not ( = ?auto_620036 ?auto_620041 ) ) ( not ( = ?auto_620036 ?auto_620042 ) ) ( not ( = ?auto_620036 ?auto_620043 ) ) ( not ( = ?auto_620036 ?auto_620044 ) ) ( not ( = ?auto_620036 ?auto_620045 ) ) ( not ( = ?auto_620036 ?auto_620046 ) ) ( not ( = ?auto_620036 ?auto_620047 ) ) ( not ( = ?auto_620036 ?auto_620048 ) ) ( not ( = ?auto_620037 ?auto_620038 ) ) ( not ( = ?auto_620037 ?auto_620039 ) ) ( not ( = ?auto_620037 ?auto_620040 ) ) ( not ( = ?auto_620037 ?auto_620041 ) ) ( not ( = ?auto_620037 ?auto_620042 ) ) ( not ( = ?auto_620037 ?auto_620043 ) ) ( not ( = ?auto_620037 ?auto_620044 ) ) ( not ( = ?auto_620037 ?auto_620045 ) ) ( not ( = ?auto_620037 ?auto_620046 ) ) ( not ( = ?auto_620037 ?auto_620047 ) ) ( not ( = ?auto_620037 ?auto_620048 ) ) ( not ( = ?auto_620038 ?auto_620039 ) ) ( not ( = ?auto_620038 ?auto_620040 ) ) ( not ( = ?auto_620038 ?auto_620041 ) ) ( not ( = ?auto_620038 ?auto_620042 ) ) ( not ( = ?auto_620038 ?auto_620043 ) ) ( not ( = ?auto_620038 ?auto_620044 ) ) ( not ( = ?auto_620038 ?auto_620045 ) ) ( not ( = ?auto_620038 ?auto_620046 ) ) ( not ( = ?auto_620038 ?auto_620047 ) ) ( not ( = ?auto_620038 ?auto_620048 ) ) ( not ( = ?auto_620039 ?auto_620040 ) ) ( not ( = ?auto_620039 ?auto_620041 ) ) ( not ( = ?auto_620039 ?auto_620042 ) ) ( not ( = ?auto_620039 ?auto_620043 ) ) ( not ( = ?auto_620039 ?auto_620044 ) ) ( not ( = ?auto_620039 ?auto_620045 ) ) ( not ( = ?auto_620039 ?auto_620046 ) ) ( not ( = ?auto_620039 ?auto_620047 ) ) ( not ( = ?auto_620039 ?auto_620048 ) ) ( not ( = ?auto_620040 ?auto_620041 ) ) ( not ( = ?auto_620040 ?auto_620042 ) ) ( not ( = ?auto_620040 ?auto_620043 ) ) ( not ( = ?auto_620040 ?auto_620044 ) ) ( not ( = ?auto_620040 ?auto_620045 ) ) ( not ( = ?auto_620040 ?auto_620046 ) ) ( not ( = ?auto_620040 ?auto_620047 ) ) ( not ( = ?auto_620040 ?auto_620048 ) ) ( not ( = ?auto_620041 ?auto_620042 ) ) ( not ( = ?auto_620041 ?auto_620043 ) ) ( not ( = ?auto_620041 ?auto_620044 ) ) ( not ( = ?auto_620041 ?auto_620045 ) ) ( not ( = ?auto_620041 ?auto_620046 ) ) ( not ( = ?auto_620041 ?auto_620047 ) ) ( not ( = ?auto_620041 ?auto_620048 ) ) ( not ( = ?auto_620042 ?auto_620043 ) ) ( not ( = ?auto_620042 ?auto_620044 ) ) ( not ( = ?auto_620042 ?auto_620045 ) ) ( not ( = ?auto_620042 ?auto_620046 ) ) ( not ( = ?auto_620042 ?auto_620047 ) ) ( not ( = ?auto_620042 ?auto_620048 ) ) ( not ( = ?auto_620043 ?auto_620044 ) ) ( not ( = ?auto_620043 ?auto_620045 ) ) ( not ( = ?auto_620043 ?auto_620046 ) ) ( not ( = ?auto_620043 ?auto_620047 ) ) ( not ( = ?auto_620043 ?auto_620048 ) ) ( not ( = ?auto_620044 ?auto_620045 ) ) ( not ( = ?auto_620044 ?auto_620046 ) ) ( not ( = ?auto_620044 ?auto_620047 ) ) ( not ( = ?auto_620044 ?auto_620048 ) ) ( not ( = ?auto_620045 ?auto_620046 ) ) ( not ( = ?auto_620045 ?auto_620047 ) ) ( not ( = ?auto_620045 ?auto_620048 ) ) ( not ( = ?auto_620046 ?auto_620047 ) ) ( not ( = ?auto_620046 ?auto_620048 ) ) ( not ( = ?auto_620047 ?auto_620048 ) ) ( ON ?auto_620046 ?auto_620047 ) ( ON ?auto_620045 ?auto_620046 ) ( ON ?auto_620044 ?auto_620045 ) ( ON ?auto_620043 ?auto_620044 ) ( ON ?auto_620042 ?auto_620043 ) ( ON ?auto_620041 ?auto_620042 ) ( ON ?auto_620040 ?auto_620041 ) ( ON ?auto_620039 ?auto_620040 ) ( ON ?auto_620038 ?auto_620039 ) ( ON ?auto_620037 ?auto_620038 ) ( ON ?auto_620036 ?auto_620037 ) ( ON ?auto_620035 ?auto_620036 ) ( ON ?auto_620034 ?auto_620035 ) ( CLEAR ?auto_620032 ) ( ON ?auto_620033 ?auto_620034 ) ( CLEAR ?auto_620033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_620031 ?auto_620032 ?auto_620033 )
      ( MAKE-17PILE ?auto_620031 ?auto_620032 ?auto_620033 ?auto_620034 ?auto_620035 ?auto_620036 ?auto_620037 ?auto_620038 ?auto_620039 ?auto_620040 ?auto_620041 ?auto_620042 ?auto_620043 ?auto_620044 ?auto_620045 ?auto_620046 ?auto_620047 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_620066 - BLOCK
      ?auto_620067 - BLOCK
      ?auto_620068 - BLOCK
      ?auto_620069 - BLOCK
      ?auto_620070 - BLOCK
      ?auto_620071 - BLOCK
      ?auto_620072 - BLOCK
      ?auto_620073 - BLOCK
      ?auto_620074 - BLOCK
      ?auto_620075 - BLOCK
      ?auto_620076 - BLOCK
      ?auto_620077 - BLOCK
      ?auto_620078 - BLOCK
      ?auto_620079 - BLOCK
      ?auto_620080 - BLOCK
      ?auto_620081 - BLOCK
      ?auto_620082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_620082 ) ( ON-TABLE ?auto_620066 ) ( ON ?auto_620067 ?auto_620066 ) ( not ( = ?auto_620066 ?auto_620067 ) ) ( not ( = ?auto_620066 ?auto_620068 ) ) ( not ( = ?auto_620066 ?auto_620069 ) ) ( not ( = ?auto_620066 ?auto_620070 ) ) ( not ( = ?auto_620066 ?auto_620071 ) ) ( not ( = ?auto_620066 ?auto_620072 ) ) ( not ( = ?auto_620066 ?auto_620073 ) ) ( not ( = ?auto_620066 ?auto_620074 ) ) ( not ( = ?auto_620066 ?auto_620075 ) ) ( not ( = ?auto_620066 ?auto_620076 ) ) ( not ( = ?auto_620066 ?auto_620077 ) ) ( not ( = ?auto_620066 ?auto_620078 ) ) ( not ( = ?auto_620066 ?auto_620079 ) ) ( not ( = ?auto_620066 ?auto_620080 ) ) ( not ( = ?auto_620066 ?auto_620081 ) ) ( not ( = ?auto_620066 ?auto_620082 ) ) ( not ( = ?auto_620067 ?auto_620068 ) ) ( not ( = ?auto_620067 ?auto_620069 ) ) ( not ( = ?auto_620067 ?auto_620070 ) ) ( not ( = ?auto_620067 ?auto_620071 ) ) ( not ( = ?auto_620067 ?auto_620072 ) ) ( not ( = ?auto_620067 ?auto_620073 ) ) ( not ( = ?auto_620067 ?auto_620074 ) ) ( not ( = ?auto_620067 ?auto_620075 ) ) ( not ( = ?auto_620067 ?auto_620076 ) ) ( not ( = ?auto_620067 ?auto_620077 ) ) ( not ( = ?auto_620067 ?auto_620078 ) ) ( not ( = ?auto_620067 ?auto_620079 ) ) ( not ( = ?auto_620067 ?auto_620080 ) ) ( not ( = ?auto_620067 ?auto_620081 ) ) ( not ( = ?auto_620067 ?auto_620082 ) ) ( not ( = ?auto_620068 ?auto_620069 ) ) ( not ( = ?auto_620068 ?auto_620070 ) ) ( not ( = ?auto_620068 ?auto_620071 ) ) ( not ( = ?auto_620068 ?auto_620072 ) ) ( not ( = ?auto_620068 ?auto_620073 ) ) ( not ( = ?auto_620068 ?auto_620074 ) ) ( not ( = ?auto_620068 ?auto_620075 ) ) ( not ( = ?auto_620068 ?auto_620076 ) ) ( not ( = ?auto_620068 ?auto_620077 ) ) ( not ( = ?auto_620068 ?auto_620078 ) ) ( not ( = ?auto_620068 ?auto_620079 ) ) ( not ( = ?auto_620068 ?auto_620080 ) ) ( not ( = ?auto_620068 ?auto_620081 ) ) ( not ( = ?auto_620068 ?auto_620082 ) ) ( not ( = ?auto_620069 ?auto_620070 ) ) ( not ( = ?auto_620069 ?auto_620071 ) ) ( not ( = ?auto_620069 ?auto_620072 ) ) ( not ( = ?auto_620069 ?auto_620073 ) ) ( not ( = ?auto_620069 ?auto_620074 ) ) ( not ( = ?auto_620069 ?auto_620075 ) ) ( not ( = ?auto_620069 ?auto_620076 ) ) ( not ( = ?auto_620069 ?auto_620077 ) ) ( not ( = ?auto_620069 ?auto_620078 ) ) ( not ( = ?auto_620069 ?auto_620079 ) ) ( not ( = ?auto_620069 ?auto_620080 ) ) ( not ( = ?auto_620069 ?auto_620081 ) ) ( not ( = ?auto_620069 ?auto_620082 ) ) ( not ( = ?auto_620070 ?auto_620071 ) ) ( not ( = ?auto_620070 ?auto_620072 ) ) ( not ( = ?auto_620070 ?auto_620073 ) ) ( not ( = ?auto_620070 ?auto_620074 ) ) ( not ( = ?auto_620070 ?auto_620075 ) ) ( not ( = ?auto_620070 ?auto_620076 ) ) ( not ( = ?auto_620070 ?auto_620077 ) ) ( not ( = ?auto_620070 ?auto_620078 ) ) ( not ( = ?auto_620070 ?auto_620079 ) ) ( not ( = ?auto_620070 ?auto_620080 ) ) ( not ( = ?auto_620070 ?auto_620081 ) ) ( not ( = ?auto_620070 ?auto_620082 ) ) ( not ( = ?auto_620071 ?auto_620072 ) ) ( not ( = ?auto_620071 ?auto_620073 ) ) ( not ( = ?auto_620071 ?auto_620074 ) ) ( not ( = ?auto_620071 ?auto_620075 ) ) ( not ( = ?auto_620071 ?auto_620076 ) ) ( not ( = ?auto_620071 ?auto_620077 ) ) ( not ( = ?auto_620071 ?auto_620078 ) ) ( not ( = ?auto_620071 ?auto_620079 ) ) ( not ( = ?auto_620071 ?auto_620080 ) ) ( not ( = ?auto_620071 ?auto_620081 ) ) ( not ( = ?auto_620071 ?auto_620082 ) ) ( not ( = ?auto_620072 ?auto_620073 ) ) ( not ( = ?auto_620072 ?auto_620074 ) ) ( not ( = ?auto_620072 ?auto_620075 ) ) ( not ( = ?auto_620072 ?auto_620076 ) ) ( not ( = ?auto_620072 ?auto_620077 ) ) ( not ( = ?auto_620072 ?auto_620078 ) ) ( not ( = ?auto_620072 ?auto_620079 ) ) ( not ( = ?auto_620072 ?auto_620080 ) ) ( not ( = ?auto_620072 ?auto_620081 ) ) ( not ( = ?auto_620072 ?auto_620082 ) ) ( not ( = ?auto_620073 ?auto_620074 ) ) ( not ( = ?auto_620073 ?auto_620075 ) ) ( not ( = ?auto_620073 ?auto_620076 ) ) ( not ( = ?auto_620073 ?auto_620077 ) ) ( not ( = ?auto_620073 ?auto_620078 ) ) ( not ( = ?auto_620073 ?auto_620079 ) ) ( not ( = ?auto_620073 ?auto_620080 ) ) ( not ( = ?auto_620073 ?auto_620081 ) ) ( not ( = ?auto_620073 ?auto_620082 ) ) ( not ( = ?auto_620074 ?auto_620075 ) ) ( not ( = ?auto_620074 ?auto_620076 ) ) ( not ( = ?auto_620074 ?auto_620077 ) ) ( not ( = ?auto_620074 ?auto_620078 ) ) ( not ( = ?auto_620074 ?auto_620079 ) ) ( not ( = ?auto_620074 ?auto_620080 ) ) ( not ( = ?auto_620074 ?auto_620081 ) ) ( not ( = ?auto_620074 ?auto_620082 ) ) ( not ( = ?auto_620075 ?auto_620076 ) ) ( not ( = ?auto_620075 ?auto_620077 ) ) ( not ( = ?auto_620075 ?auto_620078 ) ) ( not ( = ?auto_620075 ?auto_620079 ) ) ( not ( = ?auto_620075 ?auto_620080 ) ) ( not ( = ?auto_620075 ?auto_620081 ) ) ( not ( = ?auto_620075 ?auto_620082 ) ) ( not ( = ?auto_620076 ?auto_620077 ) ) ( not ( = ?auto_620076 ?auto_620078 ) ) ( not ( = ?auto_620076 ?auto_620079 ) ) ( not ( = ?auto_620076 ?auto_620080 ) ) ( not ( = ?auto_620076 ?auto_620081 ) ) ( not ( = ?auto_620076 ?auto_620082 ) ) ( not ( = ?auto_620077 ?auto_620078 ) ) ( not ( = ?auto_620077 ?auto_620079 ) ) ( not ( = ?auto_620077 ?auto_620080 ) ) ( not ( = ?auto_620077 ?auto_620081 ) ) ( not ( = ?auto_620077 ?auto_620082 ) ) ( not ( = ?auto_620078 ?auto_620079 ) ) ( not ( = ?auto_620078 ?auto_620080 ) ) ( not ( = ?auto_620078 ?auto_620081 ) ) ( not ( = ?auto_620078 ?auto_620082 ) ) ( not ( = ?auto_620079 ?auto_620080 ) ) ( not ( = ?auto_620079 ?auto_620081 ) ) ( not ( = ?auto_620079 ?auto_620082 ) ) ( not ( = ?auto_620080 ?auto_620081 ) ) ( not ( = ?auto_620080 ?auto_620082 ) ) ( not ( = ?auto_620081 ?auto_620082 ) ) ( ON ?auto_620081 ?auto_620082 ) ( ON ?auto_620080 ?auto_620081 ) ( ON ?auto_620079 ?auto_620080 ) ( ON ?auto_620078 ?auto_620079 ) ( ON ?auto_620077 ?auto_620078 ) ( ON ?auto_620076 ?auto_620077 ) ( ON ?auto_620075 ?auto_620076 ) ( ON ?auto_620074 ?auto_620075 ) ( ON ?auto_620073 ?auto_620074 ) ( ON ?auto_620072 ?auto_620073 ) ( ON ?auto_620071 ?auto_620072 ) ( ON ?auto_620070 ?auto_620071 ) ( ON ?auto_620069 ?auto_620070 ) ( CLEAR ?auto_620067 ) ( ON ?auto_620068 ?auto_620069 ) ( CLEAR ?auto_620068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_620066 ?auto_620067 ?auto_620068 )
      ( MAKE-17PILE ?auto_620066 ?auto_620067 ?auto_620068 ?auto_620069 ?auto_620070 ?auto_620071 ?auto_620072 ?auto_620073 ?auto_620074 ?auto_620075 ?auto_620076 ?auto_620077 ?auto_620078 ?auto_620079 ?auto_620080 ?auto_620081 ?auto_620082 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_620100 - BLOCK
      ?auto_620101 - BLOCK
      ?auto_620102 - BLOCK
      ?auto_620103 - BLOCK
      ?auto_620104 - BLOCK
      ?auto_620105 - BLOCK
      ?auto_620106 - BLOCK
      ?auto_620107 - BLOCK
      ?auto_620108 - BLOCK
      ?auto_620109 - BLOCK
      ?auto_620110 - BLOCK
      ?auto_620111 - BLOCK
      ?auto_620112 - BLOCK
      ?auto_620113 - BLOCK
      ?auto_620114 - BLOCK
      ?auto_620115 - BLOCK
      ?auto_620116 - BLOCK
    )
    :vars
    (
      ?auto_620117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620116 ?auto_620117 ) ( ON-TABLE ?auto_620100 ) ( not ( = ?auto_620100 ?auto_620101 ) ) ( not ( = ?auto_620100 ?auto_620102 ) ) ( not ( = ?auto_620100 ?auto_620103 ) ) ( not ( = ?auto_620100 ?auto_620104 ) ) ( not ( = ?auto_620100 ?auto_620105 ) ) ( not ( = ?auto_620100 ?auto_620106 ) ) ( not ( = ?auto_620100 ?auto_620107 ) ) ( not ( = ?auto_620100 ?auto_620108 ) ) ( not ( = ?auto_620100 ?auto_620109 ) ) ( not ( = ?auto_620100 ?auto_620110 ) ) ( not ( = ?auto_620100 ?auto_620111 ) ) ( not ( = ?auto_620100 ?auto_620112 ) ) ( not ( = ?auto_620100 ?auto_620113 ) ) ( not ( = ?auto_620100 ?auto_620114 ) ) ( not ( = ?auto_620100 ?auto_620115 ) ) ( not ( = ?auto_620100 ?auto_620116 ) ) ( not ( = ?auto_620100 ?auto_620117 ) ) ( not ( = ?auto_620101 ?auto_620102 ) ) ( not ( = ?auto_620101 ?auto_620103 ) ) ( not ( = ?auto_620101 ?auto_620104 ) ) ( not ( = ?auto_620101 ?auto_620105 ) ) ( not ( = ?auto_620101 ?auto_620106 ) ) ( not ( = ?auto_620101 ?auto_620107 ) ) ( not ( = ?auto_620101 ?auto_620108 ) ) ( not ( = ?auto_620101 ?auto_620109 ) ) ( not ( = ?auto_620101 ?auto_620110 ) ) ( not ( = ?auto_620101 ?auto_620111 ) ) ( not ( = ?auto_620101 ?auto_620112 ) ) ( not ( = ?auto_620101 ?auto_620113 ) ) ( not ( = ?auto_620101 ?auto_620114 ) ) ( not ( = ?auto_620101 ?auto_620115 ) ) ( not ( = ?auto_620101 ?auto_620116 ) ) ( not ( = ?auto_620101 ?auto_620117 ) ) ( not ( = ?auto_620102 ?auto_620103 ) ) ( not ( = ?auto_620102 ?auto_620104 ) ) ( not ( = ?auto_620102 ?auto_620105 ) ) ( not ( = ?auto_620102 ?auto_620106 ) ) ( not ( = ?auto_620102 ?auto_620107 ) ) ( not ( = ?auto_620102 ?auto_620108 ) ) ( not ( = ?auto_620102 ?auto_620109 ) ) ( not ( = ?auto_620102 ?auto_620110 ) ) ( not ( = ?auto_620102 ?auto_620111 ) ) ( not ( = ?auto_620102 ?auto_620112 ) ) ( not ( = ?auto_620102 ?auto_620113 ) ) ( not ( = ?auto_620102 ?auto_620114 ) ) ( not ( = ?auto_620102 ?auto_620115 ) ) ( not ( = ?auto_620102 ?auto_620116 ) ) ( not ( = ?auto_620102 ?auto_620117 ) ) ( not ( = ?auto_620103 ?auto_620104 ) ) ( not ( = ?auto_620103 ?auto_620105 ) ) ( not ( = ?auto_620103 ?auto_620106 ) ) ( not ( = ?auto_620103 ?auto_620107 ) ) ( not ( = ?auto_620103 ?auto_620108 ) ) ( not ( = ?auto_620103 ?auto_620109 ) ) ( not ( = ?auto_620103 ?auto_620110 ) ) ( not ( = ?auto_620103 ?auto_620111 ) ) ( not ( = ?auto_620103 ?auto_620112 ) ) ( not ( = ?auto_620103 ?auto_620113 ) ) ( not ( = ?auto_620103 ?auto_620114 ) ) ( not ( = ?auto_620103 ?auto_620115 ) ) ( not ( = ?auto_620103 ?auto_620116 ) ) ( not ( = ?auto_620103 ?auto_620117 ) ) ( not ( = ?auto_620104 ?auto_620105 ) ) ( not ( = ?auto_620104 ?auto_620106 ) ) ( not ( = ?auto_620104 ?auto_620107 ) ) ( not ( = ?auto_620104 ?auto_620108 ) ) ( not ( = ?auto_620104 ?auto_620109 ) ) ( not ( = ?auto_620104 ?auto_620110 ) ) ( not ( = ?auto_620104 ?auto_620111 ) ) ( not ( = ?auto_620104 ?auto_620112 ) ) ( not ( = ?auto_620104 ?auto_620113 ) ) ( not ( = ?auto_620104 ?auto_620114 ) ) ( not ( = ?auto_620104 ?auto_620115 ) ) ( not ( = ?auto_620104 ?auto_620116 ) ) ( not ( = ?auto_620104 ?auto_620117 ) ) ( not ( = ?auto_620105 ?auto_620106 ) ) ( not ( = ?auto_620105 ?auto_620107 ) ) ( not ( = ?auto_620105 ?auto_620108 ) ) ( not ( = ?auto_620105 ?auto_620109 ) ) ( not ( = ?auto_620105 ?auto_620110 ) ) ( not ( = ?auto_620105 ?auto_620111 ) ) ( not ( = ?auto_620105 ?auto_620112 ) ) ( not ( = ?auto_620105 ?auto_620113 ) ) ( not ( = ?auto_620105 ?auto_620114 ) ) ( not ( = ?auto_620105 ?auto_620115 ) ) ( not ( = ?auto_620105 ?auto_620116 ) ) ( not ( = ?auto_620105 ?auto_620117 ) ) ( not ( = ?auto_620106 ?auto_620107 ) ) ( not ( = ?auto_620106 ?auto_620108 ) ) ( not ( = ?auto_620106 ?auto_620109 ) ) ( not ( = ?auto_620106 ?auto_620110 ) ) ( not ( = ?auto_620106 ?auto_620111 ) ) ( not ( = ?auto_620106 ?auto_620112 ) ) ( not ( = ?auto_620106 ?auto_620113 ) ) ( not ( = ?auto_620106 ?auto_620114 ) ) ( not ( = ?auto_620106 ?auto_620115 ) ) ( not ( = ?auto_620106 ?auto_620116 ) ) ( not ( = ?auto_620106 ?auto_620117 ) ) ( not ( = ?auto_620107 ?auto_620108 ) ) ( not ( = ?auto_620107 ?auto_620109 ) ) ( not ( = ?auto_620107 ?auto_620110 ) ) ( not ( = ?auto_620107 ?auto_620111 ) ) ( not ( = ?auto_620107 ?auto_620112 ) ) ( not ( = ?auto_620107 ?auto_620113 ) ) ( not ( = ?auto_620107 ?auto_620114 ) ) ( not ( = ?auto_620107 ?auto_620115 ) ) ( not ( = ?auto_620107 ?auto_620116 ) ) ( not ( = ?auto_620107 ?auto_620117 ) ) ( not ( = ?auto_620108 ?auto_620109 ) ) ( not ( = ?auto_620108 ?auto_620110 ) ) ( not ( = ?auto_620108 ?auto_620111 ) ) ( not ( = ?auto_620108 ?auto_620112 ) ) ( not ( = ?auto_620108 ?auto_620113 ) ) ( not ( = ?auto_620108 ?auto_620114 ) ) ( not ( = ?auto_620108 ?auto_620115 ) ) ( not ( = ?auto_620108 ?auto_620116 ) ) ( not ( = ?auto_620108 ?auto_620117 ) ) ( not ( = ?auto_620109 ?auto_620110 ) ) ( not ( = ?auto_620109 ?auto_620111 ) ) ( not ( = ?auto_620109 ?auto_620112 ) ) ( not ( = ?auto_620109 ?auto_620113 ) ) ( not ( = ?auto_620109 ?auto_620114 ) ) ( not ( = ?auto_620109 ?auto_620115 ) ) ( not ( = ?auto_620109 ?auto_620116 ) ) ( not ( = ?auto_620109 ?auto_620117 ) ) ( not ( = ?auto_620110 ?auto_620111 ) ) ( not ( = ?auto_620110 ?auto_620112 ) ) ( not ( = ?auto_620110 ?auto_620113 ) ) ( not ( = ?auto_620110 ?auto_620114 ) ) ( not ( = ?auto_620110 ?auto_620115 ) ) ( not ( = ?auto_620110 ?auto_620116 ) ) ( not ( = ?auto_620110 ?auto_620117 ) ) ( not ( = ?auto_620111 ?auto_620112 ) ) ( not ( = ?auto_620111 ?auto_620113 ) ) ( not ( = ?auto_620111 ?auto_620114 ) ) ( not ( = ?auto_620111 ?auto_620115 ) ) ( not ( = ?auto_620111 ?auto_620116 ) ) ( not ( = ?auto_620111 ?auto_620117 ) ) ( not ( = ?auto_620112 ?auto_620113 ) ) ( not ( = ?auto_620112 ?auto_620114 ) ) ( not ( = ?auto_620112 ?auto_620115 ) ) ( not ( = ?auto_620112 ?auto_620116 ) ) ( not ( = ?auto_620112 ?auto_620117 ) ) ( not ( = ?auto_620113 ?auto_620114 ) ) ( not ( = ?auto_620113 ?auto_620115 ) ) ( not ( = ?auto_620113 ?auto_620116 ) ) ( not ( = ?auto_620113 ?auto_620117 ) ) ( not ( = ?auto_620114 ?auto_620115 ) ) ( not ( = ?auto_620114 ?auto_620116 ) ) ( not ( = ?auto_620114 ?auto_620117 ) ) ( not ( = ?auto_620115 ?auto_620116 ) ) ( not ( = ?auto_620115 ?auto_620117 ) ) ( not ( = ?auto_620116 ?auto_620117 ) ) ( ON ?auto_620115 ?auto_620116 ) ( ON ?auto_620114 ?auto_620115 ) ( ON ?auto_620113 ?auto_620114 ) ( ON ?auto_620112 ?auto_620113 ) ( ON ?auto_620111 ?auto_620112 ) ( ON ?auto_620110 ?auto_620111 ) ( ON ?auto_620109 ?auto_620110 ) ( ON ?auto_620108 ?auto_620109 ) ( ON ?auto_620107 ?auto_620108 ) ( ON ?auto_620106 ?auto_620107 ) ( ON ?auto_620105 ?auto_620106 ) ( ON ?auto_620104 ?auto_620105 ) ( ON ?auto_620103 ?auto_620104 ) ( ON ?auto_620102 ?auto_620103 ) ( CLEAR ?auto_620100 ) ( ON ?auto_620101 ?auto_620102 ) ( CLEAR ?auto_620101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_620100 ?auto_620101 )
      ( MAKE-17PILE ?auto_620100 ?auto_620101 ?auto_620102 ?auto_620103 ?auto_620104 ?auto_620105 ?auto_620106 ?auto_620107 ?auto_620108 ?auto_620109 ?auto_620110 ?auto_620111 ?auto_620112 ?auto_620113 ?auto_620114 ?auto_620115 ?auto_620116 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_620135 - BLOCK
      ?auto_620136 - BLOCK
      ?auto_620137 - BLOCK
      ?auto_620138 - BLOCK
      ?auto_620139 - BLOCK
      ?auto_620140 - BLOCK
      ?auto_620141 - BLOCK
      ?auto_620142 - BLOCK
      ?auto_620143 - BLOCK
      ?auto_620144 - BLOCK
      ?auto_620145 - BLOCK
      ?auto_620146 - BLOCK
      ?auto_620147 - BLOCK
      ?auto_620148 - BLOCK
      ?auto_620149 - BLOCK
      ?auto_620150 - BLOCK
      ?auto_620151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_620151 ) ( ON-TABLE ?auto_620135 ) ( not ( = ?auto_620135 ?auto_620136 ) ) ( not ( = ?auto_620135 ?auto_620137 ) ) ( not ( = ?auto_620135 ?auto_620138 ) ) ( not ( = ?auto_620135 ?auto_620139 ) ) ( not ( = ?auto_620135 ?auto_620140 ) ) ( not ( = ?auto_620135 ?auto_620141 ) ) ( not ( = ?auto_620135 ?auto_620142 ) ) ( not ( = ?auto_620135 ?auto_620143 ) ) ( not ( = ?auto_620135 ?auto_620144 ) ) ( not ( = ?auto_620135 ?auto_620145 ) ) ( not ( = ?auto_620135 ?auto_620146 ) ) ( not ( = ?auto_620135 ?auto_620147 ) ) ( not ( = ?auto_620135 ?auto_620148 ) ) ( not ( = ?auto_620135 ?auto_620149 ) ) ( not ( = ?auto_620135 ?auto_620150 ) ) ( not ( = ?auto_620135 ?auto_620151 ) ) ( not ( = ?auto_620136 ?auto_620137 ) ) ( not ( = ?auto_620136 ?auto_620138 ) ) ( not ( = ?auto_620136 ?auto_620139 ) ) ( not ( = ?auto_620136 ?auto_620140 ) ) ( not ( = ?auto_620136 ?auto_620141 ) ) ( not ( = ?auto_620136 ?auto_620142 ) ) ( not ( = ?auto_620136 ?auto_620143 ) ) ( not ( = ?auto_620136 ?auto_620144 ) ) ( not ( = ?auto_620136 ?auto_620145 ) ) ( not ( = ?auto_620136 ?auto_620146 ) ) ( not ( = ?auto_620136 ?auto_620147 ) ) ( not ( = ?auto_620136 ?auto_620148 ) ) ( not ( = ?auto_620136 ?auto_620149 ) ) ( not ( = ?auto_620136 ?auto_620150 ) ) ( not ( = ?auto_620136 ?auto_620151 ) ) ( not ( = ?auto_620137 ?auto_620138 ) ) ( not ( = ?auto_620137 ?auto_620139 ) ) ( not ( = ?auto_620137 ?auto_620140 ) ) ( not ( = ?auto_620137 ?auto_620141 ) ) ( not ( = ?auto_620137 ?auto_620142 ) ) ( not ( = ?auto_620137 ?auto_620143 ) ) ( not ( = ?auto_620137 ?auto_620144 ) ) ( not ( = ?auto_620137 ?auto_620145 ) ) ( not ( = ?auto_620137 ?auto_620146 ) ) ( not ( = ?auto_620137 ?auto_620147 ) ) ( not ( = ?auto_620137 ?auto_620148 ) ) ( not ( = ?auto_620137 ?auto_620149 ) ) ( not ( = ?auto_620137 ?auto_620150 ) ) ( not ( = ?auto_620137 ?auto_620151 ) ) ( not ( = ?auto_620138 ?auto_620139 ) ) ( not ( = ?auto_620138 ?auto_620140 ) ) ( not ( = ?auto_620138 ?auto_620141 ) ) ( not ( = ?auto_620138 ?auto_620142 ) ) ( not ( = ?auto_620138 ?auto_620143 ) ) ( not ( = ?auto_620138 ?auto_620144 ) ) ( not ( = ?auto_620138 ?auto_620145 ) ) ( not ( = ?auto_620138 ?auto_620146 ) ) ( not ( = ?auto_620138 ?auto_620147 ) ) ( not ( = ?auto_620138 ?auto_620148 ) ) ( not ( = ?auto_620138 ?auto_620149 ) ) ( not ( = ?auto_620138 ?auto_620150 ) ) ( not ( = ?auto_620138 ?auto_620151 ) ) ( not ( = ?auto_620139 ?auto_620140 ) ) ( not ( = ?auto_620139 ?auto_620141 ) ) ( not ( = ?auto_620139 ?auto_620142 ) ) ( not ( = ?auto_620139 ?auto_620143 ) ) ( not ( = ?auto_620139 ?auto_620144 ) ) ( not ( = ?auto_620139 ?auto_620145 ) ) ( not ( = ?auto_620139 ?auto_620146 ) ) ( not ( = ?auto_620139 ?auto_620147 ) ) ( not ( = ?auto_620139 ?auto_620148 ) ) ( not ( = ?auto_620139 ?auto_620149 ) ) ( not ( = ?auto_620139 ?auto_620150 ) ) ( not ( = ?auto_620139 ?auto_620151 ) ) ( not ( = ?auto_620140 ?auto_620141 ) ) ( not ( = ?auto_620140 ?auto_620142 ) ) ( not ( = ?auto_620140 ?auto_620143 ) ) ( not ( = ?auto_620140 ?auto_620144 ) ) ( not ( = ?auto_620140 ?auto_620145 ) ) ( not ( = ?auto_620140 ?auto_620146 ) ) ( not ( = ?auto_620140 ?auto_620147 ) ) ( not ( = ?auto_620140 ?auto_620148 ) ) ( not ( = ?auto_620140 ?auto_620149 ) ) ( not ( = ?auto_620140 ?auto_620150 ) ) ( not ( = ?auto_620140 ?auto_620151 ) ) ( not ( = ?auto_620141 ?auto_620142 ) ) ( not ( = ?auto_620141 ?auto_620143 ) ) ( not ( = ?auto_620141 ?auto_620144 ) ) ( not ( = ?auto_620141 ?auto_620145 ) ) ( not ( = ?auto_620141 ?auto_620146 ) ) ( not ( = ?auto_620141 ?auto_620147 ) ) ( not ( = ?auto_620141 ?auto_620148 ) ) ( not ( = ?auto_620141 ?auto_620149 ) ) ( not ( = ?auto_620141 ?auto_620150 ) ) ( not ( = ?auto_620141 ?auto_620151 ) ) ( not ( = ?auto_620142 ?auto_620143 ) ) ( not ( = ?auto_620142 ?auto_620144 ) ) ( not ( = ?auto_620142 ?auto_620145 ) ) ( not ( = ?auto_620142 ?auto_620146 ) ) ( not ( = ?auto_620142 ?auto_620147 ) ) ( not ( = ?auto_620142 ?auto_620148 ) ) ( not ( = ?auto_620142 ?auto_620149 ) ) ( not ( = ?auto_620142 ?auto_620150 ) ) ( not ( = ?auto_620142 ?auto_620151 ) ) ( not ( = ?auto_620143 ?auto_620144 ) ) ( not ( = ?auto_620143 ?auto_620145 ) ) ( not ( = ?auto_620143 ?auto_620146 ) ) ( not ( = ?auto_620143 ?auto_620147 ) ) ( not ( = ?auto_620143 ?auto_620148 ) ) ( not ( = ?auto_620143 ?auto_620149 ) ) ( not ( = ?auto_620143 ?auto_620150 ) ) ( not ( = ?auto_620143 ?auto_620151 ) ) ( not ( = ?auto_620144 ?auto_620145 ) ) ( not ( = ?auto_620144 ?auto_620146 ) ) ( not ( = ?auto_620144 ?auto_620147 ) ) ( not ( = ?auto_620144 ?auto_620148 ) ) ( not ( = ?auto_620144 ?auto_620149 ) ) ( not ( = ?auto_620144 ?auto_620150 ) ) ( not ( = ?auto_620144 ?auto_620151 ) ) ( not ( = ?auto_620145 ?auto_620146 ) ) ( not ( = ?auto_620145 ?auto_620147 ) ) ( not ( = ?auto_620145 ?auto_620148 ) ) ( not ( = ?auto_620145 ?auto_620149 ) ) ( not ( = ?auto_620145 ?auto_620150 ) ) ( not ( = ?auto_620145 ?auto_620151 ) ) ( not ( = ?auto_620146 ?auto_620147 ) ) ( not ( = ?auto_620146 ?auto_620148 ) ) ( not ( = ?auto_620146 ?auto_620149 ) ) ( not ( = ?auto_620146 ?auto_620150 ) ) ( not ( = ?auto_620146 ?auto_620151 ) ) ( not ( = ?auto_620147 ?auto_620148 ) ) ( not ( = ?auto_620147 ?auto_620149 ) ) ( not ( = ?auto_620147 ?auto_620150 ) ) ( not ( = ?auto_620147 ?auto_620151 ) ) ( not ( = ?auto_620148 ?auto_620149 ) ) ( not ( = ?auto_620148 ?auto_620150 ) ) ( not ( = ?auto_620148 ?auto_620151 ) ) ( not ( = ?auto_620149 ?auto_620150 ) ) ( not ( = ?auto_620149 ?auto_620151 ) ) ( not ( = ?auto_620150 ?auto_620151 ) ) ( ON ?auto_620150 ?auto_620151 ) ( ON ?auto_620149 ?auto_620150 ) ( ON ?auto_620148 ?auto_620149 ) ( ON ?auto_620147 ?auto_620148 ) ( ON ?auto_620146 ?auto_620147 ) ( ON ?auto_620145 ?auto_620146 ) ( ON ?auto_620144 ?auto_620145 ) ( ON ?auto_620143 ?auto_620144 ) ( ON ?auto_620142 ?auto_620143 ) ( ON ?auto_620141 ?auto_620142 ) ( ON ?auto_620140 ?auto_620141 ) ( ON ?auto_620139 ?auto_620140 ) ( ON ?auto_620138 ?auto_620139 ) ( ON ?auto_620137 ?auto_620138 ) ( CLEAR ?auto_620135 ) ( ON ?auto_620136 ?auto_620137 ) ( CLEAR ?auto_620136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_620135 ?auto_620136 )
      ( MAKE-17PILE ?auto_620135 ?auto_620136 ?auto_620137 ?auto_620138 ?auto_620139 ?auto_620140 ?auto_620141 ?auto_620142 ?auto_620143 ?auto_620144 ?auto_620145 ?auto_620146 ?auto_620147 ?auto_620148 ?auto_620149 ?auto_620150 ?auto_620151 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_620169 - BLOCK
      ?auto_620170 - BLOCK
      ?auto_620171 - BLOCK
      ?auto_620172 - BLOCK
      ?auto_620173 - BLOCK
      ?auto_620174 - BLOCK
      ?auto_620175 - BLOCK
      ?auto_620176 - BLOCK
      ?auto_620177 - BLOCK
      ?auto_620178 - BLOCK
      ?auto_620179 - BLOCK
      ?auto_620180 - BLOCK
      ?auto_620181 - BLOCK
      ?auto_620182 - BLOCK
      ?auto_620183 - BLOCK
      ?auto_620184 - BLOCK
      ?auto_620185 - BLOCK
    )
    :vars
    (
      ?auto_620186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620185 ?auto_620186 ) ( not ( = ?auto_620169 ?auto_620170 ) ) ( not ( = ?auto_620169 ?auto_620171 ) ) ( not ( = ?auto_620169 ?auto_620172 ) ) ( not ( = ?auto_620169 ?auto_620173 ) ) ( not ( = ?auto_620169 ?auto_620174 ) ) ( not ( = ?auto_620169 ?auto_620175 ) ) ( not ( = ?auto_620169 ?auto_620176 ) ) ( not ( = ?auto_620169 ?auto_620177 ) ) ( not ( = ?auto_620169 ?auto_620178 ) ) ( not ( = ?auto_620169 ?auto_620179 ) ) ( not ( = ?auto_620169 ?auto_620180 ) ) ( not ( = ?auto_620169 ?auto_620181 ) ) ( not ( = ?auto_620169 ?auto_620182 ) ) ( not ( = ?auto_620169 ?auto_620183 ) ) ( not ( = ?auto_620169 ?auto_620184 ) ) ( not ( = ?auto_620169 ?auto_620185 ) ) ( not ( = ?auto_620169 ?auto_620186 ) ) ( not ( = ?auto_620170 ?auto_620171 ) ) ( not ( = ?auto_620170 ?auto_620172 ) ) ( not ( = ?auto_620170 ?auto_620173 ) ) ( not ( = ?auto_620170 ?auto_620174 ) ) ( not ( = ?auto_620170 ?auto_620175 ) ) ( not ( = ?auto_620170 ?auto_620176 ) ) ( not ( = ?auto_620170 ?auto_620177 ) ) ( not ( = ?auto_620170 ?auto_620178 ) ) ( not ( = ?auto_620170 ?auto_620179 ) ) ( not ( = ?auto_620170 ?auto_620180 ) ) ( not ( = ?auto_620170 ?auto_620181 ) ) ( not ( = ?auto_620170 ?auto_620182 ) ) ( not ( = ?auto_620170 ?auto_620183 ) ) ( not ( = ?auto_620170 ?auto_620184 ) ) ( not ( = ?auto_620170 ?auto_620185 ) ) ( not ( = ?auto_620170 ?auto_620186 ) ) ( not ( = ?auto_620171 ?auto_620172 ) ) ( not ( = ?auto_620171 ?auto_620173 ) ) ( not ( = ?auto_620171 ?auto_620174 ) ) ( not ( = ?auto_620171 ?auto_620175 ) ) ( not ( = ?auto_620171 ?auto_620176 ) ) ( not ( = ?auto_620171 ?auto_620177 ) ) ( not ( = ?auto_620171 ?auto_620178 ) ) ( not ( = ?auto_620171 ?auto_620179 ) ) ( not ( = ?auto_620171 ?auto_620180 ) ) ( not ( = ?auto_620171 ?auto_620181 ) ) ( not ( = ?auto_620171 ?auto_620182 ) ) ( not ( = ?auto_620171 ?auto_620183 ) ) ( not ( = ?auto_620171 ?auto_620184 ) ) ( not ( = ?auto_620171 ?auto_620185 ) ) ( not ( = ?auto_620171 ?auto_620186 ) ) ( not ( = ?auto_620172 ?auto_620173 ) ) ( not ( = ?auto_620172 ?auto_620174 ) ) ( not ( = ?auto_620172 ?auto_620175 ) ) ( not ( = ?auto_620172 ?auto_620176 ) ) ( not ( = ?auto_620172 ?auto_620177 ) ) ( not ( = ?auto_620172 ?auto_620178 ) ) ( not ( = ?auto_620172 ?auto_620179 ) ) ( not ( = ?auto_620172 ?auto_620180 ) ) ( not ( = ?auto_620172 ?auto_620181 ) ) ( not ( = ?auto_620172 ?auto_620182 ) ) ( not ( = ?auto_620172 ?auto_620183 ) ) ( not ( = ?auto_620172 ?auto_620184 ) ) ( not ( = ?auto_620172 ?auto_620185 ) ) ( not ( = ?auto_620172 ?auto_620186 ) ) ( not ( = ?auto_620173 ?auto_620174 ) ) ( not ( = ?auto_620173 ?auto_620175 ) ) ( not ( = ?auto_620173 ?auto_620176 ) ) ( not ( = ?auto_620173 ?auto_620177 ) ) ( not ( = ?auto_620173 ?auto_620178 ) ) ( not ( = ?auto_620173 ?auto_620179 ) ) ( not ( = ?auto_620173 ?auto_620180 ) ) ( not ( = ?auto_620173 ?auto_620181 ) ) ( not ( = ?auto_620173 ?auto_620182 ) ) ( not ( = ?auto_620173 ?auto_620183 ) ) ( not ( = ?auto_620173 ?auto_620184 ) ) ( not ( = ?auto_620173 ?auto_620185 ) ) ( not ( = ?auto_620173 ?auto_620186 ) ) ( not ( = ?auto_620174 ?auto_620175 ) ) ( not ( = ?auto_620174 ?auto_620176 ) ) ( not ( = ?auto_620174 ?auto_620177 ) ) ( not ( = ?auto_620174 ?auto_620178 ) ) ( not ( = ?auto_620174 ?auto_620179 ) ) ( not ( = ?auto_620174 ?auto_620180 ) ) ( not ( = ?auto_620174 ?auto_620181 ) ) ( not ( = ?auto_620174 ?auto_620182 ) ) ( not ( = ?auto_620174 ?auto_620183 ) ) ( not ( = ?auto_620174 ?auto_620184 ) ) ( not ( = ?auto_620174 ?auto_620185 ) ) ( not ( = ?auto_620174 ?auto_620186 ) ) ( not ( = ?auto_620175 ?auto_620176 ) ) ( not ( = ?auto_620175 ?auto_620177 ) ) ( not ( = ?auto_620175 ?auto_620178 ) ) ( not ( = ?auto_620175 ?auto_620179 ) ) ( not ( = ?auto_620175 ?auto_620180 ) ) ( not ( = ?auto_620175 ?auto_620181 ) ) ( not ( = ?auto_620175 ?auto_620182 ) ) ( not ( = ?auto_620175 ?auto_620183 ) ) ( not ( = ?auto_620175 ?auto_620184 ) ) ( not ( = ?auto_620175 ?auto_620185 ) ) ( not ( = ?auto_620175 ?auto_620186 ) ) ( not ( = ?auto_620176 ?auto_620177 ) ) ( not ( = ?auto_620176 ?auto_620178 ) ) ( not ( = ?auto_620176 ?auto_620179 ) ) ( not ( = ?auto_620176 ?auto_620180 ) ) ( not ( = ?auto_620176 ?auto_620181 ) ) ( not ( = ?auto_620176 ?auto_620182 ) ) ( not ( = ?auto_620176 ?auto_620183 ) ) ( not ( = ?auto_620176 ?auto_620184 ) ) ( not ( = ?auto_620176 ?auto_620185 ) ) ( not ( = ?auto_620176 ?auto_620186 ) ) ( not ( = ?auto_620177 ?auto_620178 ) ) ( not ( = ?auto_620177 ?auto_620179 ) ) ( not ( = ?auto_620177 ?auto_620180 ) ) ( not ( = ?auto_620177 ?auto_620181 ) ) ( not ( = ?auto_620177 ?auto_620182 ) ) ( not ( = ?auto_620177 ?auto_620183 ) ) ( not ( = ?auto_620177 ?auto_620184 ) ) ( not ( = ?auto_620177 ?auto_620185 ) ) ( not ( = ?auto_620177 ?auto_620186 ) ) ( not ( = ?auto_620178 ?auto_620179 ) ) ( not ( = ?auto_620178 ?auto_620180 ) ) ( not ( = ?auto_620178 ?auto_620181 ) ) ( not ( = ?auto_620178 ?auto_620182 ) ) ( not ( = ?auto_620178 ?auto_620183 ) ) ( not ( = ?auto_620178 ?auto_620184 ) ) ( not ( = ?auto_620178 ?auto_620185 ) ) ( not ( = ?auto_620178 ?auto_620186 ) ) ( not ( = ?auto_620179 ?auto_620180 ) ) ( not ( = ?auto_620179 ?auto_620181 ) ) ( not ( = ?auto_620179 ?auto_620182 ) ) ( not ( = ?auto_620179 ?auto_620183 ) ) ( not ( = ?auto_620179 ?auto_620184 ) ) ( not ( = ?auto_620179 ?auto_620185 ) ) ( not ( = ?auto_620179 ?auto_620186 ) ) ( not ( = ?auto_620180 ?auto_620181 ) ) ( not ( = ?auto_620180 ?auto_620182 ) ) ( not ( = ?auto_620180 ?auto_620183 ) ) ( not ( = ?auto_620180 ?auto_620184 ) ) ( not ( = ?auto_620180 ?auto_620185 ) ) ( not ( = ?auto_620180 ?auto_620186 ) ) ( not ( = ?auto_620181 ?auto_620182 ) ) ( not ( = ?auto_620181 ?auto_620183 ) ) ( not ( = ?auto_620181 ?auto_620184 ) ) ( not ( = ?auto_620181 ?auto_620185 ) ) ( not ( = ?auto_620181 ?auto_620186 ) ) ( not ( = ?auto_620182 ?auto_620183 ) ) ( not ( = ?auto_620182 ?auto_620184 ) ) ( not ( = ?auto_620182 ?auto_620185 ) ) ( not ( = ?auto_620182 ?auto_620186 ) ) ( not ( = ?auto_620183 ?auto_620184 ) ) ( not ( = ?auto_620183 ?auto_620185 ) ) ( not ( = ?auto_620183 ?auto_620186 ) ) ( not ( = ?auto_620184 ?auto_620185 ) ) ( not ( = ?auto_620184 ?auto_620186 ) ) ( not ( = ?auto_620185 ?auto_620186 ) ) ( ON ?auto_620184 ?auto_620185 ) ( ON ?auto_620183 ?auto_620184 ) ( ON ?auto_620182 ?auto_620183 ) ( ON ?auto_620181 ?auto_620182 ) ( ON ?auto_620180 ?auto_620181 ) ( ON ?auto_620179 ?auto_620180 ) ( ON ?auto_620178 ?auto_620179 ) ( ON ?auto_620177 ?auto_620178 ) ( ON ?auto_620176 ?auto_620177 ) ( ON ?auto_620175 ?auto_620176 ) ( ON ?auto_620174 ?auto_620175 ) ( ON ?auto_620173 ?auto_620174 ) ( ON ?auto_620172 ?auto_620173 ) ( ON ?auto_620171 ?auto_620172 ) ( ON ?auto_620170 ?auto_620171 ) ( ON ?auto_620169 ?auto_620170 ) ( CLEAR ?auto_620169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_620169 )
      ( MAKE-17PILE ?auto_620169 ?auto_620170 ?auto_620171 ?auto_620172 ?auto_620173 ?auto_620174 ?auto_620175 ?auto_620176 ?auto_620177 ?auto_620178 ?auto_620179 ?auto_620180 ?auto_620181 ?auto_620182 ?auto_620183 ?auto_620184 ?auto_620185 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_620204 - BLOCK
      ?auto_620205 - BLOCK
      ?auto_620206 - BLOCK
      ?auto_620207 - BLOCK
      ?auto_620208 - BLOCK
      ?auto_620209 - BLOCK
      ?auto_620210 - BLOCK
      ?auto_620211 - BLOCK
      ?auto_620212 - BLOCK
      ?auto_620213 - BLOCK
      ?auto_620214 - BLOCK
      ?auto_620215 - BLOCK
      ?auto_620216 - BLOCK
      ?auto_620217 - BLOCK
      ?auto_620218 - BLOCK
      ?auto_620219 - BLOCK
      ?auto_620220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_620220 ) ( not ( = ?auto_620204 ?auto_620205 ) ) ( not ( = ?auto_620204 ?auto_620206 ) ) ( not ( = ?auto_620204 ?auto_620207 ) ) ( not ( = ?auto_620204 ?auto_620208 ) ) ( not ( = ?auto_620204 ?auto_620209 ) ) ( not ( = ?auto_620204 ?auto_620210 ) ) ( not ( = ?auto_620204 ?auto_620211 ) ) ( not ( = ?auto_620204 ?auto_620212 ) ) ( not ( = ?auto_620204 ?auto_620213 ) ) ( not ( = ?auto_620204 ?auto_620214 ) ) ( not ( = ?auto_620204 ?auto_620215 ) ) ( not ( = ?auto_620204 ?auto_620216 ) ) ( not ( = ?auto_620204 ?auto_620217 ) ) ( not ( = ?auto_620204 ?auto_620218 ) ) ( not ( = ?auto_620204 ?auto_620219 ) ) ( not ( = ?auto_620204 ?auto_620220 ) ) ( not ( = ?auto_620205 ?auto_620206 ) ) ( not ( = ?auto_620205 ?auto_620207 ) ) ( not ( = ?auto_620205 ?auto_620208 ) ) ( not ( = ?auto_620205 ?auto_620209 ) ) ( not ( = ?auto_620205 ?auto_620210 ) ) ( not ( = ?auto_620205 ?auto_620211 ) ) ( not ( = ?auto_620205 ?auto_620212 ) ) ( not ( = ?auto_620205 ?auto_620213 ) ) ( not ( = ?auto_620205 ?auto_620214 ) ) ( not ( = ?auto_620205 ?auto_620215 ) ) ( not ( = ?auto_620205 ?auto_620216 ) ) ( not ( = ?auto_620205 ?auto_620217 ) ) ( not ( = ?auto_620205 ?auto_620218 ) ) ( not ( = ?auto_620205 ?auto_620219 ) ) ( not ( = ?auto_620205 ?auto_620220 ) ) ( not ( = ?auto_620206 ?auto_620207 ) ) ( not ( = ?auto_620206 ?auto_620208 ) ) ( not ( = ?auto_620206 ?auto_620209 ) ) ( not ( = ?auto_620206 ?auto_620210 ) ) ( not ( = ?auto_620206 ?auto_620211 ) ) ( not ( = ?auto_620206 ?auto_620212 ) ) ( not ( = ?auto_620206 ?auto_620213 ) ) ( not ( = ?auto_620206 ?auto_620214 ) ) ( not ( = ?auto_620206 ?auto_620215 ) ) ( not ( = ?auto_620206 ?auto_620216 ) ) ( not ( = ?auto_620206 ?auto_620217 ) ) ( not ( = ?auto_620206 ?auto_620218 ) ) ( not ( = ?auto_620206 ?auto_620219 ) ) ( not ( = ?auto_620206 ?auto_620220 ) ) ( not ( = ?auto_620207 ?auto_620208 ) ) ( not ( = ?auto_620207 ?auto_620209 ) ) ( not ( = ?auto_620207 ?auto_620210 ) ) ( not ( = ?auto_620207 ?auto_620211 ) ) ( not ( = ?auto_620207 ?auto_620212 ) ) ( not ( = ?auto_620207 ?auto_620213 ) ) ( not ( = ?auto_620207 ?auto_620214 ) ) ( not ( = ?auto_620207 ?auto_620215 ) ) ( not ( = ?auto_620207 ?auto_620216 ) ) ( not ( = ?auto_620207 ?auto_620217 ) ) ( not ( = ?auto_620207 ?auto_620218 ) ) ( not ( = ?auto_620207 ?auto_620219 ) ) ( not ( = ?auto_620207 ?auto_620220 ) ) ( not ( = ?auto_620208 ?auto_620209 ) ) ( not ( = ?auto_620208 ?auto_620210 ) ) ( not ( = ?auto_620208 ?auto_620211 ) ) ( not ( = ?auto_620208 ?auto_620212 ) ) ( not ( = ?auto_620208 ?auto_620213 ) ) ( not ( = ?auto_620208 ?auto_620214 ) ) ( not ( = ?auto_620208 ?auto_620215 ) ) ( not ( = ?auto_620208 ?auto_620216 ) ) ( not ( = ?auto_620208 ?auto_620217 ) ) ( not ( = ?auto_620208 ?auto_620218 ) ) ( not ( = ?auto_620208 ?auto_620219 ) ) ( not ( = ?auto_620208 ?auto_620220 ) ) ( not ( = ?auto_620209 ?auto_620210 ) ) ( not ( = ?auto_620209 ?auto_620211 ) ) ( not ( = ?auto_620209 ?auto_620212 ) ) ( not ( = ?auto_620209 ?auto_620213 ) ) ( not ( = ?auto_620209 ?auto_620214 ) ) ( not ( = ?auto_620209 ?auto_620215 ) ) ( not ( = ?auto_620209 ?auto_620216 ) ) ( not ( = ?auto_620209 ?auto_620217 ) ) ( not ( = ?auto_620209 ?auto_620218 ) ) ( not ( = ?auto_620209 ?auto_620219 ) ) ( not ( = ?auto_620209 ?auto_620220 ) ) ( not ( = ?auto_620210 ?auto_620211 ) ) ( not ( = ?auto_620210 ?auto_620212 ) ) ( not ( = ?auto_620210 ?auto_620213 ) ) ( not ( = ?auto_620210 ?auto_620214 ) ) ( not ( = ?auto_620210 ?auto_620215 ) ) ( not ( = ?auto_620210 ?auto_620216 ) ) ( not ( = ?auto_620210 ?auto_620217 ) ) ( not ( = ?auto_620210 ?auto_620218 ) ) ( not ( = ?auto_620210 ?auto_620219 ) ) ( not ( = ?auto_620210 ?auto_620220 ) ) ( not ( = ?auto_620211 ?auto_620212 ) ) ( not ( = ?auto_620211 ?auto_620213 ) ) ( not ( = ?auto_620211 ?auto_620214 ) ) ( not ( = ?auto_620211 ?auto_620215 ) ) ( not ( = ?auto_620211 ?auto_620216 ) ) ( not ( = ?auto_620211 ?auto_620217 ) ) ( not ( = ?auto_620211 ?auto_620218 ) ) ( not ( = ?auto_620211 ?auto_620219 ) ) ( not ( = ?auto_620211 ?auto_620220 ) ) ( not ( = ?auto_620212 ?auto_620213 ) ) ( not ( = ?auto_620212 ?auto_620214 ) ) ( not ( = ?auto_620212 ?auto_620215 ) ) ( not ( = ?auto_620212 ?auto_620216 ) ) ( not ( = ?auto_620212 ?auto_620217 ) ) ( not ( = ?auto_620212 ?auto_620218 ) ) ( not ( = ?auto_620212 ?auto_620219 ) ) ( not ( = ?auto_620212 ?auto_620220 ) ) ( not ( = ?auto_620213 ?auto_620214 ) ) ( not ( = ?auto_620213 ?auto_620215 ) ) ( not ( = ?auto_620213 ?auto_620216 ) ) ( not ( = ?auto_620213 ?auto_620217 ) ) ( not ( = ?auto_620213 ?auto_620218 ) ) ( not ( = ?auto_620213 ?auto_620219 ) ) ( not ( = ?auto_620213 ?auto_620220 ) ) ( not ( = ?auto_620214 ?auto_620215 ) ) ( not ( = ?auto_620214 ?auto_620216 ) ) ( not ( = ?auto_620214 ?auto_620217 ) ) ( not ( = ?auto_620214 ?auto_620218 ) ) ( not ( = ?auto_620214 ?auto_620219 ) ) ( not ( = ?auto_620214 ?auto_620220 ) ) ( not ( = ?auto_620215 ?auto_620216 ) ) ( not ( = ?auto_620215 ?auto_620217 ) ) ( not ( = ?auto_620215 ?auto_620218 ) ) ( not ( = ?auto_620215 ?auto_620219 ) ) ( not ( = ?auto_620215 ?auto_620220 ) ) ( not ( = ?auto_620216 ?auto_620217 ) ) ( not ( = ?auto_620216 ?auto_620218 ) ) ( not ( = ?auto_620216 ?auto_620219 ) ) ( not ( = ?auto_620216 ?auto_620220 ) ) ( not ( = ?auto_620217 ?auto_620218 ) ) ( not ( = ?auto_620217 ?auto_620219 ) ) ( not ( = ?auto_620217 ?auto_620220 ) ) ( not ( = ?auto_620218 ?auto_620219 ) ) ( not ( = ?auto_620218 ?auto_620220 ) ) ( not ( = ?auto_620219 ?auto_620220 ) ) ( ON ?auto_620219 ?auto_620220 ) ( ON ?auto_620218 ?auto_620219 ) ( ON ?auto_620217 ?auto_620218 ) ( ON ?auto_620216 ?auto_620217 ) ( ON ?auto_620215 ?auto_620216 ) ( ON ?auto_620214 ?auto_620215 ) ( ON ?auto_620213 ?auto_620214 ) ( ON ?auto_620212 ?auto_620213 ) ( ON ?auto_620211 ?auto_620212 ) ( ON ?auto_620210 ?auto_620211 ) ( ON ?auto_620209 ?auto_620210 ) ( ON ?auto_620208 ?auto_620209 ) ( ON ?auto_620207 ?auto_620208 ) ( ON ?auto_620206 ?auto_620207 ) ( ON ?auto_620205 ?auto_620206 ) ( ON ?auto_620204 ?auto_620205 ) ( CLEAR ?auto_620204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_620204 )
      ( MAKE-17PILE ?auto_620204 ?auto_620205 ?auto_620206 ?auto_620207 ?auto_620208 ?auto_620209 ?auto_620210 ?auto_620211 ?auto_620212 ?auto_620213 ?auto_620214 ?auto_620215 ?auto_620216 ?auto_620217 ?auto_620218 ?auto_620219 ?auto_620220 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_620238 - BLOCK
      ?auto_620239 - BLOCK
      ?auto_620240 - BLOCK
      ?auto_620241 - BLOCK
      ?auto_620242 - BLOCK
      ?auto_620243 - BLOCK
      ?auto_620244 - BLOCK
      ?auto_620245 - BLOCK
      ?auto_620246 - BLOCK
      ?auto_620247 - BLOCK
      ?auto_620248 - BLOCK
      ?auto_620249 - BLOCK
      ?auto_620250 - BLOCK
      ?auto_620251 - BLOCK
      ?auto_620252 - BLOCK
      ?auto_620253 - BLOCK
      ?auto_620254 - BLOCK
    )
    :vars
    (
      ?auto_620255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_620238 ?auto_620239 ) ) ( not ( = ?auto_620238 ?auto_620240 ) ) ( not ( = ?auto_620238 ?auto_620241 ) ) ( not ( = ?auto_620238 ?auto_620242 ) ) ( not ( = ?auto_620238 ?auto_620243 ) ) ( not ( = ?auto_620238 ?auto_620244 ) ) ( not ( = ?auto_620238 ?auto_620245 ) ) ( not ( = ?auto_620238 ?auto_620246 ) ) ( not ( = ?auto_620238 ?auto_620247 ) ) ( not ( = ?auto_620238 ?auto_620248 ) ) ( not ( = ?auto_620238 ?auto_620249 ) ) ( not ( = ?auto_620238 ?auto_620250 ) ) ( not ( = ?auto_620238 ?auto_620251 ) ) ( not ( = ?auto_620238 ?auto_620252 ) ) ( not ( = ?auto_620238 ?auto_620253 ) ) ( not ( = ?auto_620238 ?auto_620254 ) ) ( not ( = ?auto_620239 ?auto_620240 ) ) ( not ( = ?auto_620239 ?auto_620241 ) ) ( not ( = ?auto_620239 ?auto_620242 ) ) ( not ( = ?auto_620239 ?auto_620243 ) ) ( not ( = ?auto_620239 ?auto_620244 ) ) ( not ( = ?auto_620239 ?auto_620245 ) ) ( not ( = ?auto_620239 ?auto_620246 ) ) ( not ( = ?auto_620239 ?auto_620247 ) ) ( not ( = ?auto_620239 ?auto_620248 ) ) ( not ( = ?auto_620239 ?auto_620249 ) ) ( not ( = ?auto_620239 ?auto_620250 ) ) ( not ( = ?auto_620239 ?auto_620251 ) ) ( not ( = ?auto_620239 ?auto_620252 ) ) ( not ( = ?auto_620239 ?auto_620253 ) ) ( not ( = ?auto_620239 ?auto_620254 ) ) ( not ( = ?auto_620240 ?auto_620241 ) ) ( not ( = ?auto_620240 ?auto_620242 ) ) ( not ( = ?auto_620240 ?auto_620243 ) ) ( not ( = ?auto_620240 ?auto_620244 ) ) ( not ( = ?auto_620240 ?auto_620245 ) ) ( not ( = ?auto_620240 ?auto_620246 ) ) ( not ( = ?auto_620240 ?auto_620247 ) ) ( not ( = ?auto_620240 ?auto_620248 ) ) ( not ( = ?auto_620240 ?auto_620249 ) ) ( not ( = ?auto_620240 ?auto_620250 ) ) ( not ( = ?auto_620240 ?auto_620251 ) ) ( not ( = ?auto_620240 ?auto_620252 ) ) ( not ( = ?auto_620240 ?auto_620253 ) ) ( not ( = ?auto_620240 ?auto_620254 ) ) ( not ( = ?auto_620241 ?auto_620242 ) ) ( not ( = ?auto_620241 ?auto_620243 ) ) ( not ( = ?auto_620241 ?auto_620244 ) ) ( not ( = ?auto_620241 ?auto_620245 ) ) ( not ( = ?auto_620241 ?auto_620246 ) ) ( not ( = ?auto_620241 ?auto_620247 ) ) ( not ( = ?auto_620241 ?auto_620248 ) ) ( not ( = ?auto_620241 ?auto_620249 ) ) ( not ( = ?auto_620241 ?auto_620250 ) ) ( not ( = ?auto_620241 ?auto_620251 ) ) ( not ( = ?auto_620241 ?auto_620252 ) ) ( not ( = ?auto_620241 ?auto_620253 ) ) ( not ( = ?auto_620241 ?auto_620254 ) ) ( not ( = ?auto_620242 ?auto_620243 ) ) ( not ( = ?auto_620242 ?auto_620244 ) ) ( not ( = ?auto_620242 ?auto_620245 ) ) ( not ( = ?auto_620242 ?auto_620246 ) ) ( not ( = ?auto_620242 ?auto_620247 ) ) ( not ( = ?auto_620242 ?auto_620248 ) ) ( not ( = ?auto_620242 ?auto_620249 ) ) ( not ( = ?auto_620242 ?auto_620250 ) ) ( not ( = ?auto_620242 ?auto_620251 ) ) ( not ( = ?auto_620242 ?auto_620252 ) ) ( not ( = ?auto_620242 ?auto_620253 ) ) ( not ( = ?auto_620242 ?auto_620254 ) ) ( not ( = ?auto_620243 ?auto_620244 ) ) ( not ( = ?auto_620243 ?auto_620245 ) ) ( not ( = ?auto_620243 ?auto_620246 ) ) ( not ( = ?auto_620243 ?auto_620247 ) ) ( not ( = ?auto_620243 ?auto_620248 ) ) ( not ( = ?auto_620243 ?auto_620249 ) ) ( not ( = ?auto_620243 ?auto_620250 ) ) ( not ( = ?auto_620243 ?auto_620251 ) ) ( not ( = ?auto_620243 ?auto_620252 ) ) ( not ( = ?auto_620243 ?auto_620253 ) ) ( not ( = ?auto_620243 ?auto_620254 ) ) ( not ( = ?auto_620244 ?auto_620245 ) ) ( not ( = ?auto_620244 ?auto_620246 ) ) ( not ( = ?auto_620244 ?auto_620247 ) ) ( not ( = ?auto_620244 ?auto_620248 ) ) ( not ( = ?auto_620244 ?auto_620249 ) ) ( not ( = ?auto_620244 ?auto_620250 ) ) ( not ( = ?auto_620244 ?auto_620251 ) ) ( not ( = ?auto_620244 ?auto_620252 ) ) ( not ( = ?auto_620244 ?auto_620253 ) ) ( not ( = ?auto_620244 ?auto_620254 ) ) ( not ( = ?auto_620245 ?auto_620246 ) ) ( not ( = ?auto_620245 ?auto_620247 ) ) ( not ( = ?auto_620245 ?auto_620248 ) ) ( not ( = ?auto_620245 ?auto_620249 ) ) ( not ( = ?auto_620245 ?auto_620250 ) ) ( not ( = ?auto_620245 ?auto_620251 ) ) ( not ( = ?auto_620245 ?auto_620252 ) ) ( not ( = ?auto_620245 ?auto_620253 ) ) ( not ( = ?auto_620245 ?auto_620254 ) ) ( not ( = ?auto_620246 ?auto_620247 ) ) ( not ( = ?auto_620246 ?auto_620248 ) ) ( not ( = ?auto_620246 ?auto_620249 ) ) ( not ( = ?auto_620246 ?auto_620250 ) ) ( not ( = ?auto_620246 ?auto_620251 ) ) ( not ( = ?auto_620246 ?auto_620252 ) ) ( not ( = ?auto_620246 ?auto_620253 ) ) ( not ( = ?auto_620246 ?auto_620254 ) ) ( not ( = ?auto_620247 ?auto_620248 ) ) ( not ( = ?auto_620247 ?auto_620249 ) ) ( not ( = ?auto_620247 ?auto_620250 ) ) ( not ( = ?auto_620247 ?auto_620251 ) ) ( not ( = ?auto_620247 ?auto_620252 ) ) ( not ( = ?auto_620247 ?auto_620253 ) ) ( not ( = ?auto_620247 ?auto_620254 ) ) ( not ( = ?auto_620248 ?auto_620249 ) ) ( not ( = ?auto_620248 ?auto_620250 ) ) ( not ( = ?auto_620248 ?auto_620251 ) ) ( not ( = ?auto_620248 ?auto_620252 ) ) ( not ( = ?auto_620248 ?auto_620253 ) ) ( not ( = ?auto_620248 ?auto_620254 ) ) ( not ( = ?auto_620249 ?auto_620250 ) ) ( not ( = ?auto_620249 ?auto_620251 ) ) ( not ( = ?auto_620249 ?auto_620252 ) ) ( not ( = ?auto_620249 ?auto_620253 ) ) ( not ( = ?auto_620249 ?auto_620254 ) ) ( not ( = ?auto_620250 ?auto_620251 ) ) ( not ( = ?auto_620250 ?auto_620252 ) ) ( not ( = ?auto_620250 ?auto_620253 ) ) ( not ( = ?auto_620250 ?auto_620254 ) ) ( not ( = ?auto_620251 ?auto_620252 ) ) ( not ( = ?auto_620251 ?auto_620253 ) ) ( not ( = ?auto_620251 ?auto_620254 ) ) ( not ( = ?auto_620252 ?auto_620253 ) ) ( not ( = ?auto_620252 ?auto_620254 ) ) ( not ( = ?auto_620253 ?auto_620254 ) ) ( ON ?auto_620238 ?auto_620255 ) ( not ( = ?auto_620254 ?auto_620255 ) ) ( not ( = ?auto_620253 ?auto_620255 ) ) ( not ( = ?auto_620252 ?auto_620255 ) ) ( not ( = ?auto_620251 ?auto_620255 ) ) ( not ( = ?auto_620250 ?auto_620255 ) ) ( not ( = ?auto_620249 ?auto_620255 ) ) ( not ( = ?auto_620248 ?auto_620255 ) ) ( not ( = ?auto_620247 ?auto_620255 ) ) ( not ( = ?auto_620246 ?auto_620255 ) ) ( not ( = ?auto_620245 ?auto_620255 ) ) ( not ( = ?auto_620244 ?auto_620255 ) ) ( not ( = ?auto_620243 ?auto_620255 ) ) ( not ( = ?auto_620242 ?auto_620255 ) ) ( not ( = ?auto_620241 ?auto_620255 ) ) ( not ( = ?auto_620240 ?auto_620255 ) ) ( not ( = ?auto_620239 ?auto_620255 ) ) ( not ( = ?auto_620238 ?auto_620255 ) ) ( ON ?auto_620239 ?auto_620238 ) ( ON ?auto_620240 ?auto_620239 ) ( ON ?auto_620241 ?auto_620240 ) ( ON ?auto_620242 ?auto_620241 ) ( ON ?auto_620243 ?auto_620242 ) ( ON ?auto_620244 ?auto_620243 ) ( ON ?auto_620245 ?auto_620244 ) ( ON ?auto_620246 ?auto_620245 ) ( ON ?auto_620247 ?auto_620246 ) ( ON ?auto_620248 ?auto_620247 ) ( ON ?auto_620249 ?auto_620248 ) ( ON ?auto_620250 ?auto_620249 ) ( ON ?auto_620251 ?auto_620250 ) ( ON ?auto_620252 ?auto_620251 ) ( ON ?auto_620253 ?auto_620252 ) ( ON ?auto_620254 ?auto_620253 ) ( CLEAR ?auto_620254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_620254 ?auto_620253 ?auto_620252 ?auto_620251 ?auto_620250 ?auto_620249 ?auto_620248 ?auto_620247 ?auto_620246 ?auto_620245 ?auto_620244 ?auto_620243 ?auto_620242 ?auto_620241 ?auto_620240 ?auto_620239 ?auto_620238 )
      ( MAKE-17PILE ?auto_620238 ?auto_620239 ?auto_620240 ?auto_620241 ?auto_620242 ?auto_620243 ?auto_620244 ?auto_620245 ?auto_620246 ?auto_620247 ?auto_620248 ?auto_620249 ?auto_620250 ?auto_620251 ?auto_620252 ?auto_620253 ?auto_620254 ) )
  )

)

