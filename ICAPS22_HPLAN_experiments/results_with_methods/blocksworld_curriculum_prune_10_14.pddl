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
      ?auto_96775 - BLOCK
    )
    :vars
    (
      ?auto_96776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96775 ?auto_96776 ) ( CLEAR ?auto_96775 ) ( HAND-EMPTY ) ( not ( = ?auto_96775 ?auto_96776 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96775 ?auto_96776 )
      ( !PUTDOWN ?auto_96775 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96782 - BLOCK
      ?auto_96783 - BLOCK
    )
    :vars
    (
      ?auto_96784 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96782 ) ( ON ?auto_96783 ?auto_96784 ) ( CLEAR ?auto_96783 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96782 ) ( not ( = ?auto_96782 ?auto_96783 ) ) ( not ( = ?auto_96782 ?auto_96784 ) ) ( not ( = ?auto_96783 ?auto_96784 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96783 ?auto_96784 )
      ( !STACK ?auto_96783 ?auto_96782 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96792 - BLOCK
      ?auto_96793 - BLOCK
    )
    :vars
    (
      ?auto_96794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96793 ?auto_96794 ) ( not ( = ?auto_96792 ?auto_96793 ) ) ( not ( = ?auto_96792 ?auto_96794 ) ) ( not ( = ?auto_96793 ?auto_96794 ) ) ( ON ?auto_96792 ?auto_96793 ) ( CLEAR ?auto_96792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96792 )
      ( MAKE-2PILE ?auto_96792 ?auto_96793 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96803 - BLOCK
      ?auto_96804 - BLOCK
      ?auto_96805 - BLOCK
    )
    :vars
    (
      ?auto_96806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96804 ) ( ON ?auto_96805 ?auto_96806 ) ( CLEAR ?auto_96805 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96803 ) ( ON ?auto_96804 ?auto_96803 ) ( not ( = ?auto_96803 ?auto_96804 ) ) ( not ( = ?auto_96803 ?auto_96805 ) ) ( not ( = ?auto_96803 ?auto_96806 ) ) ( not ( = ?auto_96804 ?auto_96805 ) ) ( not ( = ?auto_96804 ?auto_96806 ) ) ( not ( = ?auto_96805 ?auto_96806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96805 ?auto_96806 )
      ( !STACK ?auto_96805 ?auto_96804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96817 - BLOCK
      ?auto_96818 - BLOCK
      ?auto_96819 - BLOCK
    )
    :vars
    (
      ?auto_96820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96819 ?auto_96820 ) ( ON-TABLE ?auto_96817 ) ( not ( = ?auto_96817 ?auto_96818 ) ) ( not ( = ?auto_96817 ?auto_96819 ) ) ( not ( = ?auto_96817 ?auto_96820 ) ) ( not ( = ?auto_96818 ?auto_96819 ) ) ( not ( = ?auto_96818 ?auto_96820 ) ) ( not ( = ?auto_96819 ?auto_96820 ) ) ( CLEAR ?auto_96817 ) ( ON ?auto_96818 ?auto_96819 ) ( CLEAR ?auto_96818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96817 ?auto_96818 )
      ( MAKE-3PILE ?auto_96817 ?auto_96818 ?auto_96819 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96831 - BLOCK
      ?auto_96832 - BLOCK
      ?auto_96833 - BLOCK
    )
    :vars
    (
      ?auto_96834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96833 ?auto_96834 ) ( not ( = ?auto_96831 ?auto_96832 ) ) ( not ( = ?auto_96831 ?auto_96833 ) ) ( not ( = ?auto_96831 ?auto_96834 ) ) ( not ( = ?auto_96832 ?auto_96833 ) ) ( not ( = ?auto_96832 ?auto_96834 ) ) ( not ( = ?auto_96833 ?auto_96834 ) ) ( ON ?auto_96832 ?auto_96833 ) ( ON ?auto_96831 ?auto_96832 ) ( CLEAR ?auto_96831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96831 )
      ( MAKE-3PILE ?auto_96831 ?auto_96832 ?auto_96833 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96846 - BLOCK
      ?auto_96847 - BLOCK
      ?auto_96848 - BLOCK
      ?auto_96849 - BLOCK
    )
    :vars
    (
      ?auto_96850 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96848 ) ( ON ?auto_96849 ?auto_96850 ) ( CLEAR ?auto_96849 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96846 ) ( ON ?auto_96847 ?auto_96846 ) ( ON ?auto_96848 ?auto_96847 ) ( not ( = ?auto_96846 ?auto_96847 ) ) ( not ( = ?auto_96846 ?auto_96848 ) ) ( not ( = ?auto_96846 ?auto_96849 ) ) ( not ( = ?auto_96846 ?auto_96850 ) ) ( not ( = ?auto_96847 ?auto_96848 ) ) ( not ( = ?auto_96847 ?auto_96849 ) ) ( not ( = ?auto_96847 ?auto_96850 ) ) ( not ( = ?auto_96848 ?auto_96849 ) ) ( not ( = ?auto_96848 ?auto_96850 ) ) ( not ( = ?auto_96849 ?auto_96850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96849 ?auto_96850 )
      ( !STACK ?auto_96849 ?auto_96848 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96864 - BLOCK
      ?auto_96865 - BLOCK
      ?auto_96866 - BLOCK
      ?auto_96867 - BLOCK
    )
    :vars
    (
      ?auto_96868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96867 ?auto_96868 ) ( ON-TABLE ?auto_96864 ) ( ON ?auto_96865 ?auto_96864 ) ( not ( = ?auto_96864 ?auto_96865 ) ) ( not ( = ?auto_96864 ?auto_96866 ) ) ( not ( = ?auto_96864 ?auto_96867 ) ) ( not ( = ?auto_96864 ?auto_96868 ) ) ( not ( = ?auto_96865 ?auto_96866 ) ) ( not ( = ?auto_96865 ?auto_96867 ) ) ( not ( = ?auto_96865 ?auto_96868 ) ) ( not ( = ?auto_96866 ?auto_96867 ) ) ( not ( = ?auto_96866 ?auto_96868 ) ) ( not ( = ?auto_96867 ?auto_96868 ) ) ( CLEAR ?auto_96865 ) ( ON ?auto_96866 ?auto_96867 ) ( CLEAR ?auto_96866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96864 ?auto_96865 ?auto_96866 )
      ( MAKE-4PILE ?auto_96864 ?auto_96865 ?auto_96866 ?auto_96867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96882 - BLOCK
      ?auto_96883 - BLOCK
      ?auto_96884 - BLOCK
      ?auto_96885 - BLOCK
    )
    :vars
    (
      ?auto_96886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96885 ?auto_96886 ) ( ON-TABLE ?auto_96882 ) ( not ( = ?auto_96882 ?auto_96883 ) ) ( not ( = ?auto_96882 ?auto_96884 ) ) ( not ( = ?auto_96882 ?auto_96885 ) ) ( not ( = ?auto_96882 ?auto_96886 ) ) ( not ( = ?auto_96883 ?auto_96884 ) ) ( not ( = ?auto_96883 ?auto_96885 ) ) ( not ( = ?auto_96883 ?auto_96886 ) ) ( not ( = ?auto_96884 ?auto_96885 ) ) ( not ( = ?auto_96884 ?auto_96886 ) ) ( not ( = ?auto_96885 ?auto_96886 ) ) ( ON ?auto_96884 ?auto_96885 ) ( CLEAR ?auto_96882 ) ( ON ?auto_96883 ?auto_96884 ) ( CLEAR ?auto_96883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96882 ?auto_96883 )
      ( MAKE-4PILE ?auto_96882 ?auto_96883 ?auto_96884 ?auto_96885 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96900 - BLOCK
      ?auto_96901 - BLOCK
      ?auto_96902 - BLOCK
      ?auto_96903 - BLOCK
    )
    :vars
    (
      ?auto_96904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96903 ?auto_96904 ) ( not ( = ?auto_96900 ?auto_96901 ) ) ( not ( = ?auto_96900 ?auto_96902 ) ) ( not ( = ?auto_96900 ?auto_96903 ) ) ( not ( = ?auto_96900 ?auto_96904 ) ) ( not ( = ?auto_96901 ?auto_96902 ) ) ( not ( = ?auto_96901 ?auto_96903 ) ) ( not ( = ?auto_96901 ?auto_96904 ) ) ( not ( = ?auto_96902 ?auto_96903 ) ) ( not ( = ?auto_96902 ?auto_96904 ) ) ( not ( = ?auto_96903 ?auto_96904 ) ) ( ON ?auto_96902 ?auto_96903 ) ( ON ?auto_96901 ?auto_96902 ) ( ON ?auto_96900 ?auto_96901 ) ( CLEAR ?auto_96900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96900 )
      ( MAKE-4PILE ?auto_96900 ?auto_96901 ?auto_96902 ?auto_96903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96919 - BLOCK
      ?auto_96920 - BLOCK
      ?auto_96921 - BLOCK
      ?auto_96922 - BLOCK
      ?auto_96923 - BLOCK
    )
    :vars
    (
      ?auto_96924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96922 ) ( ON ?auto_96923 ?auto_96924 ) ( CLEAR ?auto_96923 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96919 ) ( ON ?auto_96920 ?auto_96919 ) ( ON ?auto_96921 ?auto_96920 ) ( ON ?auto_96922 ?auto_96921 ) ( not ( = ?auto_96919 ?auto_96920 ) ) ( not ( = ?auto_96919 ?auto_96921 ) ) ( not ( = ?auto_96919 ?auto_96922 ) ) ( not ( = ?auto_96919 ?auto_96923 ) ) ( not ( = ?auto_96919 ?auto_96924 ) ) ( not ( = ?auto_96920 ?auto_96921 ) ) ( not ( = ?auto_96920 ?auto_96922 ) ) ( not ( = ?auto_96920 ?auto_96923 ) ) ( not ( = ?auto_96920 ?auto_96924 ) ) ( not ( = ?auto_96921 ?auto_96922 ) ) ( not ( = ?auto_96921 ?auto_96923 ) ) ( not ( = ?auto_96921 ?auto_96924 ) ) ( not ( = ?auto_96922 ?auto_96923 ) ) ( not ( = ?auto_96922 ?auto_96924 ) ) ( not ( = ?auto_96923 ?auto_96924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96923 ?auto_96924 )
      ( !STACK ?auto_96923 ?auto_96922 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96941 - BLOCK
      ?auto_96942 - BLOCK
      ?auto_96943 - BLOCK
      ?auto_96944 - BLOCK
      ?auto_96945 - BLOCK
    )
    :vars
    (
      ?auto_96946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96945 ?auto_96946 ) ( ON-TABLE ?auto_96941 ) ( ON ?auto_96942 ?auto_96941 ) ( ON ?auto_96943 ?auto_96942 ) ( not ( = ?auto_96941 ?auto_96942 ) ) ( not ( = ?auto_96941 ?auto_96943 ) ) ( not ( = ?auto_96941 ?auto_96944 ) ) ( not ( = ?auto_96941 ?auto_96945 ) ) ( not ( = ?auto_96941 ?auto_96946 ) ) ( not ( = ?auto_96942 ?auto_96943 ) ) ( not ( = ?auto_96942 ?auto_96944 ) ) ( not ( = ?auto_96942 ?auto_96945 ) ) ( not ( = ?auto_96942 ?auto_96946 ) ) ( not ( = ?auto_96943 ?auto_96944 ) ) ( not ( = ?auto_96943 ?auto_96945 ) ) ( not ( = ?auto_96943 ?auto_96946 ) ) ( not ( = ?auto_96944 ?auto_96945 ) ) ( not ( = ?auto_96944 ?auto_96946 ) ) ( not ( = ?auto_96945 ?auto_96946 ) ) ( CLEAR ?auto_96943 ) ( ON ?auto_96944 ?auto_96945 ) ( CLEAR ?auto_96944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96941 ?auto_96942 ?auto_96943 ?auto_96944 )
      ( MAKE-5PILE ?auto_96941 ?auto_96942 ?auto_96943 ?auto_96944 ?auto_96945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96963 - BLOCK
      ?auto_96964 - BLOCK
      ?auto_96965 - BLOCK
      ?auto_96966 - BLOCK
      ?auto_96967 - BLOCK
    )
    :vars
    (
      ?auto_96968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96967 ?auto_96968 ) ( ON-TABLE ?auto_96963 ) ( ON ?auto_96964 ?auto_96963 ) ( not ( = ?auto_96963 ?auto_96964 ) ) ( not ( = ?auto_96963 ?auto_96965 ) ) ( not ( = ?auto_96963 ?auto_96966 ) ) ( not ( = ?auto_96963 ?auto_96967 ) ) ( not ( = ?auto_96963 ?auto_96968 ) ) ( not ( = ?auto_96964 ?auto_96965 ) ) ( not ( = ?auto_96964 ?auto_96966 ) ) ( not ( = ?auto_96964 ?auto_96967 ) ) ( not ( = ?auto_96964 ?auto_96968 ) ) ( not ( = ?auto_96965 ?auto_96966 ) ) ( not ( = ?auto_96965 ?auto_96967 ) ) ( not ( = ?auto_96965 ?auto_96968 ) ) ( not ( = ?auto_96966 ?auto_96967 ) ) ( not ( = ?auto_96966 ?auto_96968 ) ) ( not ( = ?auto_96967 ?auto_96968 ) ) ( ON ?auto_96966 ?auto_96967 ) ( CLEAR ?auto_96964 ) ( ON ?auto_96965 ?auto_96966 ) ( CLEAR ?auto_96965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96963 ?auto_96964 ?auto_96965 )
      ( MAKE-5PILE ?auto_96963 ?auto_96964 ?auto_96965 ?auto_96966 ?auto_96967 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96985 - BLOCK
      ?auto_96986 - BLOCK
      ?auto_96987 - BLOCK
      ?auto_96988 - BLOCK
      ?auto_96989 - BLOCK
    )
    :vars
    (
      ?auto_96990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96989 ?auto_96990 ) ( ON-TABLE ?auto_96985 ) ( not ( = ?auto_96985 ?auto_96986 ) ) ( not ( = ?auto_96985 ?auto_96987 ) ) ( not ( = ?auto_96985 ?auto_96988 ) ) ( not ( = ?auto_96985 ?auto_96989 ) ) ( not ( = ?auto_96985 ?auto_96990 ) ) ( not ( = ?auto_96986 ?auto_96987 ) ) ( not ( = ?auto_96986 ?auto_96988 ) ) ( not ( = ?auto_96986 ?auto_96989 ) ) ( not ( = ?auto_96986 ?auto_96990 ) ) ( not ( = ?auto_96987 ?auto_96988 ) ) ( not ( = ?auto_96987 ?auto_96989 ) ) ( not ( = ?auto_96987 ?auto_96990 ) ) ( not ( = ?auto_96988 ?auto_96989 ) ) ( not ( = ?auto_96988 ?auto_96990 ) ) ( not ( = ?auto_96989 ?auto_96990 ) ) ( ON ?auto_96988 ?auto_96989 ) ( ON ?auto_96987 ?auto_96988 ) ( CLEAR ?auto_96985 ) ( ON ?auto_96986 ?auto_96987 ) ( CLEAR ?auto_96986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96985 ?auto_96986 )
      ( MAKE-5PILE ?auto_96985 ?auto_96986 ?auto_96987 ?auto_96988 ?auto_96989 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97007 - BLOCK
      ?auto_97008 - BLOCK
      ?auto_97009 - BLOCK
      ?auto_97010 - BLOCK
      ?auto_97011 - BLOCK
    )
    :vars
    (
      ?auto_97012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97011 ?auto_97012 ) ( not ( = ?auto_97007 ?auto_97008 ) ) ( not ( = ?auto_97007 ?auto_97009 ) ) ( not ( = ?auto_97007 ?auto_97010 ) ) ( not ( = ?auto_97007 ?auto_97011 ) ) ( not ( = ?auto_97007 ?auto_97012 ) ) ( not ( = ?auto_97008 ?auto_97009 ) ) ( not ( = ?auto_97008 ?auto_97010 ) ) ( not ( = ?auto_97008 ?auto_97011 ) ) ( not ( = ?auto_97008 ?auto_97012 ) ) ( not ( = ?auto_97009 ?auto_97010 ) ) ( not ( = ?auto_97009 ?auto_97011 ) ) ( not ( = ?auto_97009 ?auto_97012 ) ) ( not ( = ?auto_97010 ?auto_97011 ) ) ( not ( = ?auto_97010 ?auto_97012 ) ) ( not ( = ?auto_97011 ?auto_97012 ) ) ( ON ?auto_97010 ?auto_97011 ) ( ON ?auto_97009 ?auto_97010 ) ( ON ?auto_97008 ?auto_97009 ) ( ON ?auto_97007 ?auto_97008 ) ( CLEAR ?auto_97007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97007 )
      ( MAKE-5PILE ?auto_97007 ?auto_97008 ?auto_97009 ?auto_97010 ?auto_97011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97030 - BLOCK
      ?auto_97031 - BLOCK
      ?auto_97032 - BLOCK
      ?auto_97033 - BLOCK
      ?auto_97034 - BLOCK
      ?auto_97035 - BLOCK
    )
    :vars
    (
      ?auto_97036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_97034 ) ( ON ?auto_97035 ?auto_97036 ) ( CLEAR ?auto_97035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97030 ) ( ON ?auto_97031 ?auto_97030 ) ( ON ?auto_97032 ?auto_97031 ) ( ON ?auto_97033 ?auto_97032 ) ( ON ?auto_97034 ?auto_97033 ) ( not ( = ?auto_97030 ?auto_97031 ) ) ( not ( = ?auto_97030 ?auto_97032 ) ) ( not ( = ?auto_97030 ?auto_97033 ) ) ( not ( = ?auto_97030 ?auto_97034 ) ) ( not ( = ?auto_97030 ?auto_97035 ) ) ( not ( = ?auto_97030 ?auto_97036 ) ) ( not ( = ?auto_97031 ?auto_97032 ) ) ( not ( = ?auto_97031 ?auto_97033 ) ) ( not ( = ?auto_97031 ?auto_97034 ) ) ( not ( = ?auto_97031 ?auto_97035 ) ) ( not ( = ?auto_97031 ?auto_97036 ) ) ( not ( = ?auto_97032 ?auto_97033 ) ) ( not ( = ?auto_97032 ?auto_97034 ) ) ( not ( = ?auto_97032 ?auto_97035 ) ) ( not ( = ?auto_97032 ?auto_97036 ) ) ( not ( = ?auto_97033 ?auto_97034 ) ) ( not ( = ?auto_97033 ?auto_97035 ) ) ( not ( = ?auto_97033 ?auto_97036 ) ) ( not ( = ?auto_97034 ?auto_97035 ) ) ( not ( = ?auto_97034 ?auto_97036 ) ) ( not ( = ?auto_97035 ?auto_97036 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97035 ?auto_97036 )
      ( !STACK ?auto_97035 ?auto_97034 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97056 - BLOCK
      ?auto_97057 - BLOCK
      ?auto_97058 - BLOCK
      ?auto_97059 - BLOCK
      ?auto_97060 - BLOCK
      ?auto_97061 - BLOCK
    )
    :vars
    (
      ?auto_97062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97061 ?auto_97062 ) ( ON-TABLE ?auto_97056 ) ( ON ?auto_97057 ?auto_97056 ) ( ON ?auto_97058 ?auto_97057 ) ( ON ?auto_97059 ?auto_97058 ) ( not ( = ?auto_97056 ?auto_97057 ) ) ( not ( = ?auto_97056 ?auto_97058 ) ) ( not ( = ?auto_97056 ?auto_97059 ) ) ( not ( = ?auto_97056 ?auto_97060 ) ) ( not ( = ?auto_97056 ?auto_97061 ) ) ( not ( = ?auto_97056 ?auto_97062 ) ) ( not ( = ?auto_97057 ?auto_97058 ) ) ( not ( = ?auto_97057 ?auto_97059 ) ) ( not ( = ?auto_97057 ?auto_97060 ) ) ( not ( = ?auto_97057 ?auto_97061 ) ) ( not ( = ?auto_97057 ?auto_97062 ) ) ( not ( = ?auto_97058 ?auto_97059 ) ) ( not ( = ?auto_97058 ?auto_97060 ) ) ( not ( = ?auto_97058 ?auto_97061 ) ) ( not ( = ?auto_97058 ?auto_97062 ) ) ( not ( = ?auto_97059 ?auto_97060 ) ) ( not ( = ?auto_97059 ?auto_97061 ) ) ( not ( = ?auto_97059 ?auto_97062 ) ) ( not ( = ?auto_97060 ?auto_97061 ) ) ( not ( = ?auto_97060 ?auto_97062 ) ) ( not ( = ?auto_97061 ?auto_97062 ) ) ( CLEAR ?auto_97059 ) ( ON ?auto_97060 ?auto_97061 ) ( CLEAR ?auto_97060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97056 ?auto_97057 ?auto_97058 ?auto_97059 ?auto_97060 )
      ( MAKE-6PILE ?auto_97056 ?auto_97057 ?auto_97058 ?auto_97059 ?auto_97060 ?auto_97061 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97082 - BLOCK
      ?auto_97083 - BLOCK
      ?auto_97084 - BLOCK
      ?auto_97085 - BLOCK
      ?auto_97086 - BLOCK
      ?auto_97087 - BLOCK
    )
    :vars
    (
      ?auto_97088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97087 ?auto_97088 ) ( ON-TABLE ?auto_97082 ) ( ON ?auto_97083 ?auto_97082 ) ( ON ?auto_97084 ?auto_97083 ) ( not ( = ?auto_97082 ?auto_97083 ) ) ( not ( = ?auto_97082 ?auto_97084 ) ) ( not ( = ?auto_97082 ?auto_97085 ) ) ( not ( = ?auto_97082 ?auto_97086 ) ) ( not ( = ?auto_97082 ?auto_97087 ) ) ( not ( = ?auto_97082 ?auto_97088 ) ) ( not ( = ?auto_97083 ?auto_97084 ) ) ( not ( = ?auto_97083 ?auto_97085 ) ) ( not ( = ?auto_97083 ?auto_97086 ) ) ( not ( = ?auto_97083 ?auto_97087 ) ) ( not ( = ?auto_97083 ?auto_97088 ) ) ( not ( = ?auto_97084 ?auto_97085 ) ) ( not ( = ?auto_97084 ?auto_97086 ) ) ( not ( = ?auto_97084 ?auto_97087 ) ) ( not ( = ?auto_97084 ?auto_97088 ) ) ( not ( = ?auto_97085 ?auto_97086 ) ) ( not ( = ?auto_97085 ?auto_97087 ) ) ( not ( = ?auto_97085 ?auto_97088 ) ) ( not ( = ?auto_97086 ?auto_97087 ) ) ( not ( = ?auto_97086 ?auto_97088 ) ) ( not ( = ?auto_97087 ?auto_97088 ) ) ( ON ?auto_97086 ?auto_97087 ) ( CLEAR ?auto_97084 ) ( ON ?auto_97085 ?auto_97086 ) ( CLEAR ?auto_97085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97082 ?auto_97083 ?auto_97084 ?auto_97085 )
      ( MAKE-6PILE ?auto_97082 ?auto_97083 ?auto_97084 ?auto_97085 ?auto_97086 ?auto_97087 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97108 - BLOCK
      ?auto_97109 - BLOCK
      ?auto_97110 - BLOCK
      ?auto_97111 - BLOCK
      ?auto_97112 - BLOCK
      ?auto_97113 - BLOCK
    )
    :vars
    (
      ?auto_97114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97113 ?auto_97114 ) ( ON-TABLE ?auto_97108 ) ( ON ?auto_97109 ?auto_97108 ) ( not ( = ?auto_97108 ?auto_97109 ) ) ( not ( = ?auto_97108 ?auto_97110 ) ) ( not ( = ?auto_97108 ?auto_97111 ) ) ( not ( = ?auto_97108 ?auto_97112 ) ) ( not ( = ?auto_97108 ?auto_97113 ) ) ( not ( = ?auto_97108 ?auto_97114 ) ) ( not ( = ?auto_97109 ?auto_97110 ) ) ( not ( = ?auto_97109 ?auto_97111 ) ) ( not ( = ?auto_97109 ?auto_97112 ) ) ( not ( = ?auto_97109 ?auto_97113 ) ) ( not ( = ?auto_97109 ?auto_97114 ) ) ( not ( = ?auto_97110 ?auto_97111 ) ) ( not ( = ?auto_97110 ?auto_97112 ) ) ( not ( = ?auto_97110 ?auto_97113 ) ) ( not ( = ?auto_97110 ?auto_97114 ) ) ( not ( = ?auto_97111 ?auto_97112 ) ) ( not ( = ?auto_97111 ?auto_97113 ) ) ( not ( = ?auto_97111 ?auto_97114 ) ) ( not ( = ?auto_97112 ?auto_97113 ) ) ( not ( = ?auto_97112 ?auto_97114 ) ) ( not ( = ?auto_97113 ?auto_97114 ) ) ( ON ?auto_97112 ?auto_97113 ) ( ON ?auto_97111 ?auto_97112 ) ( CLEAR ?auto_97109 ) ( ON ?auto_97110 ?auto_97111 ) ( CLEAR ?auto_97110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97108 ?auto_97109 ?auto_97110 )
      ( MAKE-6PILE ?auto_97108 ?auto_97109 ?auto_97110 ?auto_97111 ?auto_97112 ?auto_97113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97134 - BLOCK
      ?auto_97135 - BLOCK
      ?auto_97136 - BLOCK
      ?auto_97137 - BLOCK
      ?auto_97138 - BLOCK
      ?auto_97139 - BLOCK
    )
    :vars
    (
      ?auto_97140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97139 ?auto_97140 ) ( ON-TABLE ?auto_97134 ) ( not ( = ?auto_97134 ?auto_97135 ) ) ( not ( = ?auto_97134 ?auto_97136 ) ) ( not ( = ?auto_97134 ?auto_97137 ) ) ( not ( = ?auto_97134 ?auto_97138 ) ) ( not ( = ?auto_97134 ?auto_97139 ) ) ( not ( = ?auto_97134 ?auto_97140 ) ) ( not ( = ?auto_97135 ?auto_97136 ) ) ( not ( = ?auto_97135 ?auto_97137 ) ) ( not ( = ?auto_97135 ?auto_97138 ) ) ( not ( = ?auto_97135 ?auto_97139 ) ) ( not ( = ?auto_97135 ?auto_97140 ) ) ( not ( = ?auto_97136 ?auto_97137 ) ) ( not ( = ?auto_97136 ?auto_97138 ) ) ( not ( = ?auto_97136 ?auto_97139 ) ) ( not ( = ?auto_97136 ?auto_97140 ) ) ( not ( = ?auto_97137 ?auto_97138 ) ) ( not ( = ?auto_97137 ?auto_97139 ) ) ( not ( = ?auto_97137 ?auto_97140 ) ) ( not ( = ?auto_97138 ?auto_97139 ) ) ( not ( = ?auto_97138 ?auto_97140 ) ) ( not ( = ?auto_97139 ?auto_97140 ) ) ( ON ?auto_97138 ?auto_97139 ) ( ON ?auto_97137 ?auto_97138 ) ( ON ?auto_97136 ?auto_97137 ) ( CLEAR ?auto_97134 ) ( ON ?auto_97135 ?auto_97136 ) ( CLEAR ?auto_97135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97134 ?auto_97135 )
      ( MAKE-6PILE ?auto_97134 ?auto_97135 ?auto_97136 ?auto_97137 ?auto_97138 ?auto_97139 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97160 - BLOCK
      ?auto_97161 - BLOCK
      ?auto_97162 - BLOCK
      ?auto_97163 - BLOCK
      ?auto_97164 - BLOCK
      ?auto_97165 - BLOCK
    )
    :vars
    (
      ?auto_97166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97165 ?auto_97166 ) ( not ( = ?auto_97160 ?auto_97161 ) ) ( not ( = ?auto_97160 ?auto_97162 ) ) ( not ( = ?auto_97160 ?auto_97163 ) ) ( not ( = ?auto_97160 ?auto_97164 ) ) ( not ( = ?auto_97160 ?auto_97165 ) ) ( not ( = ?auto_97160 ?auto_97166 ) ) ( not ( = ?auto_97161 ?auto_97162 ) ) ( not ( = ?auto_97161 ?auto_97163 ) ) ( not ( = ?auto_97161 ?auto_97164 ) ) ( not ( = ?auto_97161 ?auto_97165 ) ) ( not ( = ?auto_97161 ?auto_97166 ) ) ( not ( = ?auto_97162 ?auto_97163 ) ) ( not ( = ?auto_97162 ?auto_97164 ) ) ( not ( = ?auto_97162 ?auto_97165 ) ) ( not ( = ?auto_97162 ?auto_97166 ) ) ( not ( = ?auto_97163 ?auto_97164 ) ) ( not ( = ?auto_97163 ?auto_97165 ) ) ( not ( = ?auto_97163 ?auto_97166 ) ) ( not ( = ?auto_97164 ?auto_97165 ) ) ( not ( = ?auto_97164 ?auto_97166 ) ) ( not ( = ?auto_97165 ?auto_97166 ) ) ( ON ?auto_97164 ?auto_97165 ) ( ON ?auto_97163 ?auto_97164 ) ( ON ?auto_97162 ?auto_97163 ) ( ON ?auto_97161 ?auto_97162 ) ( ON ?auto_97160 ?auto_97161 ) ( CLEAR ?auto_97160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97160 )
      ( MAKE-6PILE ?auto_97160 ?auto_97161 ?auto_97162 ?auto_97163 ?auto_97164 ?auto_97165 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97187 - BLOCK
      ?auto_97188 - BLOCK
      ?auto_97189 - BLOCK
      ?auto_97190 - BLOCK
      ?auto_97191 - BLOCK
      ?auto_97192 - BLOCK
      ?auto_97193 - BLOCK
    )
    :vars
    (
      ?auto_97194 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_97192 ) ( ON ?auto_97193 ?auto_97194 ) ( CLEAR ?auto_97193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97187 ) ( ON ?auto_97188 ?auto_97187 ) ( ON ?auto_97189 ?auto_97188 ) ( ON ?auto_97190 ?auto_97189 ) ( ON ?auto_97191 ?auto_97190 ) ( ON ?auto_97192 ?auto_97191 ) ( not ( = ?auto_97187 ?auto_97188 ) ) ( not ( = ?auto_97187 ?auto_97189 ) ) ( not ( = ?auto_97187 ?auto_97190 ) ) ( not ( = ?auto_97187 ?auto_97191 ) ) ( not ( = ?auto_97187 ?auto_97192 ) ) ( not ( = ?auto_97187 ?auto_97193 ) ) ( not ( = ?auto_97187 ?auto_97194 ) ) ( not ( = ?auto_97188 ?auto_97189 ) ) ( not ( = ?auto_97188 ?auto_97190 ) ) ( not ( = ?auto_97188 ?auto_97191 ) ) ( not ( = ?auto_97188 ?auto_97192 ) ) ( not ( = ?auto_97188 ?auto_97193 ) ) ( not ( = ?auto_97188 ?auto_97194 ) ) ( not ( = ?auto_97189 ?auto_97190 ) ) ( not ( = ?auto_97189 ?auto_97191 ) ) ( not ( = ?auto_97189 ?auto_97192 ) ) ( not ( = ?auto_97189 ?auto_97193 ) ) ( not ( = ?auto_97189 ?auto_97194 ) ) ( not ( = ?auto_97190 ?auto_97191 ) ) ( not ( = ?auto_97190 ?auto_97192 ) ) ( not ( = ?auto_97190 ?auto_97193 ) ) ( not ( = ?auto_97190 ?auto_97194 ) ) ( not ( = ?auto_97191 ?auto_97192 ) ) ( not ( = ?auto_97191 ?auto_97193 ) ) ( not ( = ?auto_97191 ?auto_97194 ) ) ( not ( = ?auto_97192 ?auto_97193 ) ) ( not ( = ?auto_97192 ?auto_97194 ) ) ( not ( = ?auto_97193 ?auto_97194 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97193 ?auto_97194 )
      ( !STACK ?auto_97193 ?auto_97192 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97217 - BLOCK
      ?auto_97218 - BLOCK
      ?auto_97219 - BLOCK
      ?auto_97220 - BLOCK
      ?auto_97221 - BLOCK
      ?auto_97222 - BLOCK
      ?auto_97223 - BLOCK
    )
    :vars
    (
      ?auto_97224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97223 ?auto_97224 ) ( ON-TABLE ?auto_97217 ) ( ON ?auto_97218 ?auto_97217 ) ( ON ?auto_97219 ?auto_97218 ) ( ON ?auto_97220 ?auto_97219 ) ( ON ?auto_97221 ?auto_97220 ) ( not ( = ?auto_97217 ?auto_97218 ) ) ( not ( = ?auto_97217 ?auto_97219 ) ) ( not ( = ?auto_97217 ?auto_97220 ) ) ( not ( = ?auto_97217 ?auto_97221 ) ) ( not ( = ?auto_97217 ?auto_97222 ) ) ( not ( = ?auto_97217 ?auto_97223 ) ) ( not ( = ?auto_97217 ?auto_97224 ) ) ( not ( = ?auto_97218 ?auto_97219 ) ) ( not ( = ?auto_97218 ?auto_97220 ) ) ( not ( = ?auto_97218 ?auto_97221 ) ) ( not ( = ?auto_97218 ?auto_97222 ) ) ( not ( = ?auto_97218 ?auto_97223 ) ) ( not ( = ?auto_97218 ?auto_97224 ) ) ( not ( = ?auto_97219 ?auto_97220 ) ) ( not ( = ?auto_97219 ?auto_97221 ) ) ( not ( = ?auto_97219 ?auto_97222 ) ) ( not ( = ?auto_97219 ?auto_97223 ) ) ( not ( = ?auto_97219 ?auto_97224 ) ) ( not ( = ?auto_97220 ?auto_97221 ) ) ( not ( = ?auto_97220 ?auto_97222 ) ) ( not ( = ?auto_97220 ?auto_97223 ) ) ( not ( = ?auto_97220 ?auto_97224 ) ) ( not ( = ?auto_97221 ?auto_97222 ) ) ( not ( = ?auto_97221 ?auto_97223 ) ) ( not ( = ?auto_97221 ?auto_97224 ) ) ( not ( = ?auto_97222 ?auto_97223 ) ) ( not ( = ?auto_97222 ?auto_97224 ) ) ( not ( = ?auto_97223 ?auto_97224 ) ) ( CLEAR ?auto_97221 ) ( ON ?auto_97222 ?auto_97223 ) ( CLEAR ?auto_97222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97217 ?auto_97218 ?auto_97219 ?auto_97220 ?auto_97221 ?auto_97222 )
      ( MAKE-7PILE ?auto_97217 ?auto_97218 ?auto_97219 ?auto_97220 ?auto_97221 ?auto_97222 ?auto_97223 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97247 - BLOCK
      ?auto_97248 - BLOCK
      ?auto_97249 - BLOCK
      ?auto_97250 - BLOCK
      ?auto_97251 - BLOCK
      ?auto_97252 - BLOCK
      ?auto_97253 - BLOCK
    )
    :vars
    (
      ?auto_97254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97253 ?auto_97254 ) ( ON-TABLE ?auto_97247 ) ( ON ?auto_97248 ?auto_97247 ) ( ON ?auto_97249 ?auto_97248 ) ( ON ?auto_97250 ?auto_97249 ) ( not ( = ?auto_97247 ?auto_97248 ) ) ( not ( = ?auto_97247 ?auto_97249 ) ) ( not ( = ?auto_97247 ?auto_97250 ) ) ( not ( = ?auto_97247 ?auto_97251 ) ) ( not ( = ?auto_97247 ?auto_97252 ) ) ( not ( = ?auto_97247 ?auto_97253 ) ) ( not ( = ?auto_97247 ?auto_97254 ) ) ( not ( = ?auto_97248 ?auto_97249 ) ) ( not ( = ?auto_97248 ?auto_97250 ) ) ( not ( = ?auto_97248 ?auto_97251 ) ) ( not ( = ?auto_97248 ?auto_97252 ) ) ( not ( = ?auto_97248 ?auto_97253 ) ) ( not ( = ?auto_97248 ?auto_97254 ) ) ( not ( = ?auto_97249 ?auto_97250 ) ) ( not ( = ?auto_97249 ?auto_97251 ) ) ( not ( = ?auto_97249 ?auto_97252 ) ) ( not ( = ?auto_97249 ?auto_97253 ) ) ( not ( = ?auto_97249 ?auto_97254 ) ) ( not ( = ?auto_97250 ?auto_97251 ) ) ( not ( = ?auto_97250 ?auto_97252 ) ) ( not ( = ?auto_97250 ?auto_97253 ) ) ( not ( = ?auto_97250 ?auto_97254 ) ) ( not ( = ?auto_97251 ?auto_97252 ) ) ( not ( = ?auto_97251 ?auto_97253 ) ) ( not ( = ?auto_97251 ?auto_97254 ) ) ( not ( = ?auto_97252 ?auto_97253 ) ) ( not ( = ?auto_97252 ?auto_97254 ) ) ( not ( = ?auto_97253 ?auto_97254 ) ) ( ON ?auto_97252 ?auto_97253 ) ( CLEAR ?auto_97250 ) ( ON ?auto_97251 ?auto_97252 ) ( CLEAR ?auto_97251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97247 ?auto_97248 ?auto_97249 ?auto_97250 ?auto_97251 )
      ( MAKE-7PILE ?auto_97247 ?auto_97248 ?auto_97249 ?auto_97250 ?auto_97251 ?auto_97252 ?auto_97253 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97277 - BLOCK
      ?auto_97278 - BLOCK
      ?auto_97279 - BLOCK
      ?auto_97280 - BLOCK
      ?auto_97281 - BLOCK
      ?auto_97282 - BLOCK
      ?auto_97283 - BLOCK
    )
    :vars
    (
      ?auto_97284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97283 ?auto_97284 ) ( ON-TABLE ?auto_97277 ) ( ON ?auto_97278 ?auto_97277 ) ( ON ?auto_97279 ?auto_97278 ) ( not ( = ?auto_97277 ?auto_97278 ) ) ( not ( = ?auto_97277 ?auto_97279 ) ) ( not ( = ?auto_97277 ?auto_97280 ) ) ( not ( = ?auto_97277 ?auto_97281 ) ) ( not ( = ?auto_97277 ?auto_97282 ) ) ( not ( = ?auto_97277 ?auto_97283 ) ) ( not ( = ?auto_97277 ?auto_97284 ) ) ( not ( = ?auto_97278 ?auto_97279 ) ) ( not ( = ?auto_97278 ?auto_97280 ) ) ( not ( = ?auto_97278 ?auto_97281 ) ) ( not ( = ?auto_97278 ?auto_97282 ) ) ( not ( = ?auto_97278 ?auto_97283 ) ) ( not ( = ?auto_97278 ?auto_97284 ) ) ( not ( = ?auto_97279 ?auto_97280 ) ) ( not ( = ?auto_97279 ?auto_97281 ) ) ( not ( = ?auto_97279 ?auto_97282 ) ) ( not ( = ?auto_97279 ?auto_97283 ) ) ( not ( = ?auto_97279 ?auto_97284 ) ) ( not ( = ?auto_97280 ?auto_97281 ) ) ( not ( = ?auto_97280 ?auto_97282 ) ) ( not ( = ?auto_97280 ?auto_97283 ) ) ( not ( = ?auto_97280 ?auto_97284 ) ) ( not ( = ?auto_97281 ?auto_97282 ) ) ( not ( = ?auto_97281 ?auto_97283 ) ) ( not ( = ?auto_97281 ?auto_97284 ) ) ( not ( = ?auto_97282 ?auto_97283 ) ) ( not ( = ?auto_97282 ?auto_97284 ) ) ( not ( = ?auto_97283 ?auto_97284 ) ) ( ON ?auto_97282 ?auto_97283 ) ( ON ?auto_97281 ?auto_97282 ) ( CLEAR ?auto_97279 ) ( ON ?auto_97280 ?auto_97281 ) ( CLEAR ?auto_97280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97277 ?auto_97278 ?auto_97279 ?auto_97280 )
      ( MAKE-7PILE ?auto_97277 ?auto_97278 ?auto_97279 ?auto_97280 ?auto_97281 ?auto_97282 ?auto_97283 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97307 - BLOCK
      ?auto_97308 - BLOCK
      ?auto_97309 - BLOCK
      ?auto_97310 - BLOCK
      ?auto_97311 - BLOCK
      ?auto_97312 - BLOCK
      ?auto_97313 - BLOCK
    )
    :vars
    (
      ?auto_97314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97313 ?auto_97314 ) ( ON-TABLE ?auto_97307 ) ( ON ?auto_97308 ?auto_97307 ) ( not ( = ?auto_97307 ?auto_97308 ) ) ( not ( = ?auto_97307 ?auto_97309 ) ) ( not ( = ?auto_97307 ?auto_97310 ) ) ( not ( = ?auto_97307 ?auto_97311 ) ) ( not ( = ?auto_97307 ?auto_97312 ) ) ( not ( = ?auto_97307 ?auto_97313 ) ) ( not ( = ?auto_97307 ?auto_97314 ) ) ( not ( = ?auto_97308 ?auto_97309 ) ) ( not ( = ?auto_97308 ?auto_97310 ) ) ( not ( = ?auto_97308 ?auto_97311 ) ) ( not ( = ?auto_97308 ?auto_97312 ) ) ( not ( = ?auto_97308 ?auto_97313 ) ) ( not ( = ?auto_97308 ?auto_97314 ) ) ( not ( = ?auto_97309 ?auto_97310 ) ) ( not ( = ?auto_97309 ?auto_97311 ) ) ( not ( = ?auto_97309 ?auto_97312 ) ) ( not ( = ?auto_97309 ?auto_97313 ) ) ( not ( = ?auto_97309 ?auto_97314 ) ) ( not ( = ?auto_97310 ?auto_97311 ) ) ( not ( = ?auto_97310 ?auto_97312 ) ) ( not ( = ?auto_97310 ?auto_97313 ) ) ( not ( = ?auto_97310 ?auto_97314 ) ) ( not ( = ?auto_97311 ?auto_97312 ) ) ( not ( = ?auto_97311 ?auto_97313 ) ) ( not ( = ?auto_97311 ?auto_97314 ) ) ( not ( = ?auto_97312 ?auto_97313 ) ) ( not ( = ?auto_97312 ?auto_97314 ) ) ( not ( = ?auto_97313 ?auto_97314 ) ) ( ON ?auto_97312 ?auto_97313 ) ( ON ?auto_97311 ?auto_97312 ) ( ON ?auto_97310 ?auto_97311 ) ( CLEAR ?auto_97308 ) ( ON ?auto_97309 ?auto_97310 ) ( CLEAR ?auto_97309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97307 ?auto_97308 ?auto_97309 )
      ( MAKE-7PILE ?auto_97307 ?auto_97308 ?auto_97309 ?auto_97310 ?auto_97311 ?auto_97312 ?auto_97313 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97337 - BLOCK
      ?auto_97338 - BLOCK
      ?auto_97339 - BLOCK
      ?auto_97340 - BLOCK
      ?auto_97341 - BLOCK
      ?auto_97342 - BLOCK
      ?auto_97343 - BLOCK
    )
    :vars
    (
      ?auto_97344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97343 ?auto_97344 ) ( ON-TABLE ?auto_97337 ) ( not ( = ?auto_97337 ?auto_97338 ) ) ( not ( = ?auto_97337 ?auto_97339 ) ) ( not ( = ?auto_97337 ?auto_97340 ) ) ( not ( = ?auto_97337 ?auto_97341 ) ) ( not ( = ?auto_97337 ?auto_97342 ) ) ( not ( = ?auto_97337 ?auto_97343 ) ) ( not ( = ?auto_97337 ?auto_97344 ) ) ( not ( = ?auto_97338 ?auto_97339 ) ) ( not ( = ?auto_97338 ?auto_97340 ) ) ( not ( = ?auto_97338 ?auto_97341 ) ) ( not ( = ?auto_97338 ?auto_97342 ) ) ( not ( = ?auto_97338 ?auto_97343 ) ) ( not ( = ?auto_97338 ?auto_97344 ) ) ( not ( = ?auto_97339 ?auto_97340 ) ) ( not ( = ?auto_97339 ?auto_97341 ) ) ( not ( = ?auto_97339 ?auto_97342 ) ) ( not ( = ?auto_97339 ?auto_97343 ) ) ( not ( = ?auto_97339 ?auto_97344 ) ) ( not ( = ?auto_97340 ?auto_97341 ) ) ( not ( = ?auto_97340 ?auto_97342 ) ) ( not ( = ?auto_97340 ?auto_97343 ) ) ( not ( = ?auto_97340 ?auto_97344 ) ) ( not ( = ?auto_97341 ?auto_97342 ) ) ( not ( = ?auto_97341 ?auto_97343 ) ) ( not ( = ?auto_97341 ?auto_97344 ) ) ( not ( = ?auto_97342 ?auto_97343 ) ) ( not ( = ?auto_97342 ?auto_97344 ) ) ( not ( = ?auto_97343 ?auto_97344 ) ) ( ON ?auto_97342 ?auto_97343 ) ( ON ?auto_97341 ?auto_97342 ) ( ON ?auto_97340 ?auto_97341 ) ( ON ?auto_97339 ?auto_97340 ) ( CLEAR ?auto_97337 ) ( ON ?auto_97338 ?auto_97339 ) ( CLEAR ?auto_97338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97337 ?auto_97338 )
      ( MAKE-7PILE ?auto_97337 ?auto_97338 ?auto_97339 ?auto_97340 ?auto_97341 ?auto_97342 ?auto_97343 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97367 - BLOCK
      ?auto_97368 - BLOCK
      ?auto_97369 - BLOCK
      ?auto_97370 - BLOCK
      ?auto_97371 - BLOCK
      ?auto_97372 - BLOCK
      ?auto_97373 - BLOCK
    )
    :vars
    (
      ?auto_97374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97373 ?auto_97374 ) ( not ( = ?auto_97367 ?auto_97368 ) ) ( not ( = ?auto_97367 ?auto_97369 ) ) ( not ( = ?auto_97367 ?auto_97370 ) ) ( not ( = ?auto_97367 ?auto_97371 ) ) ( not ( = ?auto_97367 ?auto_97372 ) ) ( not ( = ?auto_97367 ?auto_97373 ) ) ( not ( = ?auto_97367 ?auto_97374 ) ) ( not ( = ?auto_97368 ?auto_97369 ) ) ( not ( = ?auto_97368 ?auto_97370 ) ) ( not ( = ?auto_97368 ?auto_97371 ) ) ( not ( = ?auto_97368 ?auto_97372 ) ) ( not ( = ?auto_97368 ?auto_97373 ) ) ( not ( = ?auto_97368 ?auto_97374 ) ) ( not ( = ?auto_97369 ?auto_97370 ) ) ( not ( = ?auto_97369 ?auto_97371 ) ) ( not ( = ?auto_97369 ?auto_97372 ) ) ( not ( = ?auto_97369 ?auto_97373 ) ) ( not ( = ?auto_97369 ?auto_97374 ) ) ( not ( = ?auto_97370 ?auto_97371 ) ) ( not ( = ?auto_97370 ?auto_97372 ) ) ( not ( = ?auto_97370 ?auto_97373 ) ) ( not ( = ?auto_97370 ?auto_97374 ) ) ( not ( = ?auto_97371 ?auto_97372 ) ) ( not ( = ?auto_97371 ?auto_97373 ) ) ( not ( = ?auto_97371 ?auto_97374 ) ) ( not ( = ?auto_97372 ?auto_97373 ) ) ( not ( = ?auto_97372 ?auto_97374 ) ) ( not ( = ?auto_97373 ?auto_97374 ) ) ( ON ?auto_97372 ?auto_97373 ) ( ON ?auto_97371 ?auto_97372 ) ( ON ?auto_97370 ?auto_97371 ) ( ON ?auto_97369 ?auto_97370 ) ( ON ?auto_97368 ?auto_97369 ) ( ON ?auto_97367 ?auto_97368 ) ( CLEAR ?auto_97367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97367 )
      ( MAKE-7PILE ?auto_97367 ?auto_97368 ?auto_97369 ?auto_97370 ?auto_97371 ?auto_97372 ?auto_97373 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_97398 - BLOCK
      ?auto_97399 - BLOCK
      ?auto_97400 - BLOCK
      ?auto_97401 - BLOCK
      ?auto_97402 - BLOCK
      ?auto_97403 - BLOCK
      ?auto_97404 - BLOCK
      ?auto_97405 - BLOCK
    )
    :vars
    (
      ?auto_97406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_97404 ) ( ON ?auto_97405 ?auto_97406 ) ( CLEAR ?auto_97405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97398 ) ( ON ?auto_97399 ?auto_97398 ) ( ON ?auto_97400 ?auto_97399 ) ( ON ?auto_97401 ?auto_97400 ) ( ON ?auto_97402 ?auto_97401 ) ( ON ?auto_97403 ?auto_97402 ) ( ON ?auto_97404 ?auto_97403 ) ( not ( = ?auto_97398 ?auto_97399 ) ) ( not ( = ?auto_97398 ?auto_97400 ) ) ( not ( = ?auto_97398 ?auto_97401 ) ) ( not ( = ?auto_97398 ?auto_97402 ) ) ( not ( = ?auto_97398 ?auto_97403 ) ) ( not ( = ?auto_97398 ?auto_97404 ) ) ( not ( = ?auto_97398 ?auto_97405 ) ) ( not ( = ?auto_97398 ?auto_97406 ) ) ( not ( = ?auto_97399 ?auto_97400 ) ) ( not ( = ?auto_97399 ?auto_97401 ) ) ( not ( = ?auto_97399 ?auto_97402 ) ) ( not ( = ?auto_97399 ?auto_97403 ) ) ( not ( = ?auto_97399 ?auto_97404 ) ) ( not ( = ?auto_97399 ?auto_97405 ) ) ( not ( = ?auto_97399 ?auto_97406 ) ) ( not ( = ?auto_97400 ?auto_97401 ) ) ( not ( = ?auto_97400 ?auto_97402 ) ) ( not ( = ?auto_97400 ?auto_97403 ) ) ( not ( = ?auto_97400 ?auto_97404 ) ) ( not ( = ?auto_97400 ?auto_97405 ) ) ( not ( = ?auto_97400 ?auto_97406 ) ) ( not ( = ?auto_97401 ?auto_97402 ) ) ( not ( = ?auto_97401 ?auto_97403 ) ) ( not ( = ?auto_97401 ?auto_97404 ) ) ( not ( = ?auto_97401 ?auto_97405 ) ) ( not ( = ?auto_97401 ?auto_97406 ) ) ( not ( = ?auto_97402 ?auto_97403 ) ) ( not ( = ?auto_97402 ?auto_97404 ) ) ( not ( = ?auto_97402 ?auto_97405 ) ) ( not ( = ?auto_97402 ?auto_97406 ) ) ( not ( = ?auto_97403 ?auto_97404 ) ) ( not ( = ?auto_97403 ?auto_97405 ) ) ( not ( = ?auto_97403 ?auto_97406 ) ) ( not ( = ?auto_97404 ?auto_97405 ) ) ( not ( = ?auto_97404 ?auto_97406 ) ) ( not ( = ?auto_97405 ?auto_97406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97405 ?auto_97406 )
      ( !STACK ?auto_97405 ?auto_97404 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_97432 - BLOCK
      ?auto_97433 - BLOCK
      ?auto_97434 - BLOCK
      ?auto_97435 - BLOCK
      ?auto_97436 - BLOCK
      ?auto_97437 - BLOCK
      ?auto_97438 - BLOCK
      ?auto_97439 - BLOCK
    )
    :vars
    (
      ?auto_97440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97439 ?auto_97440 ) ( ON-TABLE ?auto_97432 ) ( ON ?auto_97433 ?auto_97432 ) ( ON ?auto_97434 ?auto_97433 ) ( ON ?auto_97435 ?auto_97434 ) ( ON ?auto_97436 ?auto_97435 ) ( ON ?auto_97437 ?auto_97436 ) ( not ( = ?auto_97432 ?auto_97433 ) ) ( not ( = ?auto_97432 ?auto_97434 ) ) ( not ( = ?auto_97432 ?auto_97435 ) ) ( not ( = ?auto_97432 ?auto_97436 ) ) ( not ( = ?auto_97432 ?auto_97437 ) ) ( not ( = ?auto_97432 ?auto_97438 ) ) ( not ( = ?auto_97432 ?auto_97439 ) ) ( not ( = ?auto_97432 ?auto_97440 ) ) ( not ( = ?auto_97433 ?auto_97434 ) ) ( not ( = ?auto_97433 ?auto_97435 ) ) ( not ( = ?auto_97433 ?auto_97436 ) ) ( not ( = ?auto_97433 ?auto_97437 ) ) ( not ( = ?auto_97433 ?auto_97438 ) ) ( not ( = ?auto_97433 ?auto_97439 ) ) ( not ( = ?auto_97433 ?auto_97440 ) ) ( not ( = ?auto_97434 ?auto_97435 ) ) ( not ( = ?auto_97434 ?auto_97436 ) ) ( not ( = ?auto_97434 ?auto_97437 ) ) ( not ( = ?auto_97434 ?auto_97438 ) ) ( not ( = ?auto_97434 ?auto_97439 ) ) ( not ( = ?auto_97434 ?auto_97440 ) ) ( not ( = ?auto_97435 ?auto_97436 ) ) ( not ( = ?auto_97435 ?auto_97437 ) ) ( not ( = ?auto_97435 ?auto_97438 ) ) ( not ( = ?auto_97435 ?auto_97439 ) ) ( not ( = ?auto_97435 ?auto_97440 ) ) ( not ( = ?auto_97436 ?auto_97437 ) ) ( not ( = ?auto_97436 ?auto_97438 ) ) ( not ( = ?auto_97436 ?auto_97439 ) ) ( not ( = ?auto_97436 ?auto_97440 ) ) ( not ( = ?auto_97437 ?auto_97438 ) ) ( not ( = ?auto_97437 ?auto_97439 ) ) ( not ( = ?auto_97437 ?auto_97440 ) ) ( not ( = ?auto_97438 ?auto_97439 ) ) ( not ( = ?auto_97438 ?auto_97440 ) ) ( not ( = ?auto_97439 ?auto_97440 ) ) ( CLEAR ?auto_97437 ) ( ON ?auto_97438 ?auto_97439 ) ( CLEAR ?auto_97438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97432 ?auto_97433 ?auto_97434 ?auto_97435 ?auto_97436 ?auto_97437 ?auto_97438 )
      ( MAKE-8PILE ?auto_97432 ?auto_97433 ?auto_97434 ?auto_97435 ?auto_97436 ?auto_97437 ?auto_97438 ?auto_97439 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_97466 - BLOCK
      ?auto_97467 - BLOCK
      ?auto_97468 - BLOCK
      ?auto_97469 - BLOCK
      ?auto_97470 - BLOCK
      ?auto_97471 - BLOCK
      ?auto_97472 - BLOCK
      ?auto_97473 - BLOCK
    )
    :vars
    (
      ?auto_97474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97473 ?auto_97474 ) ( ON-TABLE ?auto_97466 ) ( ON ?auto_97467 ?auto_97466 ) ( ON ?auto_97468 ?auto_97467 ) ( ON ?auto_97469 ?auto_97468 ) ( ON ?auto_97470 ?auto_97469 ) ( not ( = ?auto_97466 ?auto_97467 ) ) ( not ( = ?auto_97466 ?auto_97468 ) ) ( not ( = ?auto_97466 ?auto_97469 ) ) ( not ( = ?auto_97466 ?auto_97470 ) ) ( not ( = ?auto_97466 ?auto_97471 ) ) ( not ( = ?auto_97466 ?auto_97472 ) ) ( not ( = ?auto_97466 ?auto_97473 ) ) ( not ( = ?auto_97466 ?auto_97474 ) ) ( not ( = ?auto_97467 ?auto_97468 ) ) ( not ( = ?auto_97467 ?auto_97469 ) ) ( not ( = ?auto_97467 ?auto_97470 ) ) ( not ( = ?auto_97467 ?auto_97471 ) ) ( not ( = ?auto_97467 ?auto_97472 ) ) ( not ( = ?auto_97467 ?auto_97473 ) ) ( not ( = ?auto_97467 ?auto_97474 ) ) ( not ( = ?auto_97468 ?auto_97469 ) ) ( not ( = ?auto_97468 ?auto_97470 ) ) ( not ( = ?auto_97468 ?auto_97471 ) ) ( not ( = ?auto_97468 ?auto_97472 ) ) ( not ( = ?auto_97468 ?auto_97473 ) ) ( not ( = ?auto_97468 ?auto_97474 ) ) ( not ( = ?auto_97469 ?auto_97470 ) ) ( not ( = ?auto_97469 ?auto_97471 ) ) ( not ( = ?auto_97469 ?auto_97472 ) ) ( not ( = ?auto_97469 ?auto_97473 ) ) ( not ( = ?auto_97469 ?auto_97474 ) ) ( not ( = ?auto_97470 ?auto_97471 ) ) ( not ( = ?auto_97470 ?auto_97472 ) ) ( not ( = ?auto_97470 ?auto_97473 ) ) ( not ( = ?auto_97470 ?auto_97474 ) ) ( not ( = ?auto_97471 ?auto_97472 ) ) ( not ( = ?auto_97471 ?auto_97473 ) ) ( not ( = ?auto_97471 ?auto_97474 ) ) ( not ( = ?auto_97472 ?auto_97473 ) ) ( not ( = ?auto_97472 ?auto_97474 ) ) ( not ( = ?auto_97473 ?auto_97474 ) ) ( ON ?auto_97472 ?auto_97473 ) ( CLEAR ?auto_97470 ) ( ON ?auto_97471 ?auto_97472 ) ( CLEAR ?auto_97471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97466 ?auto_97467 ?auto_97468 ?auto_97469 ?auto_97470 ?auto_97471 )
      ( MAKE-8PILE ?auto_97466 ?auto_97467 ?auto_97468 ?auto_97469 ?auto_97470 ?auto_97471 ?auto_97472 ?auto_97473 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_97500 - BLOCK
      ?auto_97501 - BLOCK
      ?auto_97502 - BLOCK
      ?auto_97503 - BLOCK
      ?auto_97504 - BLOCK
      ?auto_97505 - BLOCK
      ?auto_97506 - BLOCK
      ?auto_97507 - BLOCK
    )
    :vars
    (
      ?auto_97508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97507 ?auto_97508 ) ( ON-TABLE ?auto_97500 ) ( ON ?auto_97501 ?auto_97500 ) ( ON ?auto_97502 ?auto_97501 ) ( ON ?auto_97503 ?auto_97502 ) ( not ( = ?auto_97500 ?auto_97501 ) ) ( not ( = ?auto_97500 ?auto_97502 ) ) ( not ( = ?auto_97500 ?auto_97503 ) ) ( not ( = ?auto_97500 ?auto_97504 ) ) ( not ( = ?auto_97500 ?auto_97505 ) ) ( not ( = ?auto_97500 ?auto_97506 ) ) ( not ( = ?auto_97500 ?auto_97507 ) ) ( not ( = ?auto_97500 ?auto_97508 ) ) ( not ( = ?auto_97501 ?auto_97502 ) ) ( not ( = ?auto_97501 ?auto_97503 ) ) ( not ( = ?auto_97501 ?auto_97504 ) ) ( not ( = ?auto_97501 ?auto_97505 ) ) ( not ( = ?auto_97501 ?auto_97506 ) ) ( not ( = ?auto_97501 ?auto_97507 ) ) ( not ( = ?auto_97501 ?auto_97508 ) ) ( not ( = ?auto_97502 ?auto_97503 ) ) ( not ( = ?auto_97502 ?auto_97504 ) ) ( not ( = ?auto_97502 ?auto_97505 ) ) ( not ( = ?auto_97502 ?auto_97506 ) ) ( not ( = ?auto_97502 ?auto_97507 ) ) ( not ( = ?auto_97502 ?auto_97508 ) ) ( not ( = ?auto_97503 ?auto_97504 ) ) ( not ( = ?auto_97503 ?auto_97505 ) ) ( not ( = ?auto_97503 ?auto_97506 ) ) ( not ( = ?auto_97503 ?auto_97507 ) ) ( not ( = ?auto_97503 ?auto_97508 ) ) ( not ( = ?auto_97504 ?auto_97505 ) ) ( not ( = ?auto_97504 ?auto_97506 ) ) ( not ( = ?auto_97504 ?auto_97507 ) ) ( not ( = ?auto_97504 ?auto_97508 ) ) ( not ( = ?auto_97505 ?auto_97506 ) ) ( not ( = ?auto_97505 ?auto_97507 ) ) ( not ( = ?auto_97505 ?auto_97508 ) ) ( not ( = ?auto_97506 ?auto_97507 ) ) ( not ( = ?auto_97506 ?auto_97508 ) ) ( not ( = ?auto_97507 ?auto_97508 ) ) ( ON ?auto_97506 ?auto_97507 ) ( ON ?auto_97505 ?auto_97506 ) ( CLEAR ?auto_97503 ) ( ON ?auto_97504 ?auto_97505 ) ( CLEAR ?auto_97504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97500 ?auto_97501 ?auto_97502 ?auto_97503 ?auto_97504 )
      ( MAKE-8PILE ?auto_97500 ?auto_97501 ?auto_97502 ?auto_97503 ?auto_97504 ?auto_97505 ?auto_97506 ?auto_97507 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_97534 - BLOCK
      ?auto_97535 - BLOCK
      ?auto_97536 - BLOCK
      ?auto_97537 - BLOCK
      ?auto_97538 - BLOCK
      ?auto_97539 - BLOCK
      ?auto_97540 - BLOCK
      ?auto_97541 - BLOCK
    )
    :vars
    (
      ?auto_97542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97541 ?auto_97542 ) ( ON-TABLE ?auto_97534 ) ( ON ?auto_97535 ?auto_97534 ) ( ON ?auto_97536 ?auto_97535 ) ( not ( = ?auto_97534 ?auto_97535 ) ) ( not ( = ?auto_97534 ?auto_97536 ) ) ( not ( = ?auto_97534 ?auto_97537 ) ) ( not ( = ?auto_97534 ?auto_97538 ) ) ( not ( = ?auto_97534 ?auto_97539 ) ) ( not ( = ?auto_97534 ?auto_97540 ) ) ( not ( = ?auto_97534 ?auto_97541 ) ) ( not ( = ?auto_97534 ?auto_97542 ) ) ( not ( = ?auto_97535 ?auto_97536 ) ) ( not ( = ?auto_97535 ?auto_97537 ) ) ( not ( = ?auto_97535 ?auto_97538 ) ) ( not ( = ?auto_97535 ?auto_97539 ) ) ( not ( = ?auto_97535 ?auto_97540 ) ) ( not ( = ?auto_97535 ?auto_97541 ) ) ( not ( = ?auto_97535 ?auto_97542 ) ) ( not ( = ?auto_97536 ?auto_97537 ) ) ( not ( = ?auto_97536 ?auto_97538 ) ) ( not ( = ?auto_97536 ?auto_97539 ) ) ( not ( = ?auto_97536 ?auto_97540 ) ) ( not ( = ?auto_97536 ?auto_97541 ) ) ( not ( = ?auto_97536 ?auto_97542 ) ) ( not ( = ?auto_97537 ?auto_97538 ) ) ( not ( = ?auto_97537 ?auto_97539 ) ) ( not ( = ?auto_97537 ?auto_97540 ) ) ( not ( = ?auto_97537 ?auto_97541 ) ) ( not ( = ?auto_97537 ?auto_97542 ) ) ( not ( = ?auto_97538 ?auto_97539 ) ) ( not ( = ?auto_97538 ?auto_97540 ) ) ( not ( = ?auto_97538 ?auto_97541 ) ) ( not ( = ?auto_97538 ?auto_97542 ) ) ( not ( = ?auto_97539 ?auto_97540 ) ) ( not ( = ?auto_97539 ?auto_97541 ) ) ( not ( = ?auto_97539 ?auto_97542 ) ) ( not ( = ?auto_97540 ?auto_97541 ) ) ( not ( = ?auto_97540 ?auto_97542 ) ) ( not ( = ?auto_97541 ?auto_97542 ) ) ( ON ?auto_97540 ?auto_97541 ) ( ON ?auto_97539 ?auto_97540 ) ( ON ?auto_97538 ?auto_97539 ) ( CLEAR ?auto_97536 ) ( ON ?auto_97537 ?auto_97538 ) ( CLEAR ?auto_97537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97534 ?auto_97535 ?auto_97536 ?auto_97537 )
      ( MAKE-8PILE ?auto_97534 ?auto_97535 ?auto_97536 ?auto_97537 ?auto_97538 ?auto_97539 ?auto_97540 ?auto_97541 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_97568 - BLOCK
      ?auto_97569 - BLOCK
      ?auto_97570 - BLOCK
      ?auto_97571 - BLOCK
      ?auto_97572 - BLOCK
      ?auto_97573 - BLOCK
      ?auto_97574 - BLOCK
      ?auto_97575 - BLOCK
    )
    :vars
    (
      ?auto_97576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97575 ?auto_97576 ) ( ON-TABLE ?auto_97568 ) ( ON ?auto_97569 ?auto_97568 ) ( not ( = ?auto_97568 ?auto_97569 ) ) ( not ( = ?auto_97568 ?auto_97570 ) ) ( not ( = ?auto_97568 ?auto_97571 ) ) ( not ( = ?auto_97568 ?auto_97572 ) ) ( not ( = ?auto_97568 ?auto_97573 ) ) ( not ( = ?auto_97568 ?auto_97574 ) ) ( not ( = ?auto_97568 ?auto_97575 ) ) ( not ( = ?auto_97568 ?auto_97576 ) ) ( not ( = ?auto_97569 ?auto_97570 ) ) ( not ( = ?auto_97569 ?auto_97571 ) ) ( not ( = ?auto_97569 ?auto_97572 ) ) ( not ( = ?auto_97569 ?auto_97573 ) ) ( not ( = ?auto_97569 ?auto_97574 ) ) ( not ( = ?auto_97569 ?auto_97575 ) ) ( not ( = ?auto_97569 ?auto_97576 ) ) ( not ( = ?auto_97570 ?auto_97571 ) ) ( not ( = ?auto_97570 ?auto_97572 ) ) ( not ( = ?auto_97570 ?auto_97573 ) ) ( not ( = ?auto_97570 ?auto_97574 ) ) ( not ( = ?auto_97570 ?auto_97575 ) ) ( not ( = ?auto_97570 ?auto_97576 ) ) ( not ( = ?auto_97571 ?auto_97572 ) ) ( not ( = ?auto_97571 ?auto_97573 ) ) ( not ( = ?auto_97571 ?auto_97574 ) ) ( not ( = ?auto_97571 ?auto_97575 ) ) ( not ( = ?auto_97571 ?auto_97576 ) ) ( not ( = ?auto_97572 ?auto_97573 ) ) ( not ( = ?auto_97572 ?auto_97574 ) ) ( not ( = ?auto_97572 ?auto_97575 ) ) ( not ( = ?auto_97572 ?auto_97576 ) ) ( not ( = ?auto_97573 ?auto_97574 ) ) ( not ( = ?auto_97573 ?auto_97575 ) ) ( not ( = ?auto_97573 ?auto_97576 ) ) ( not ( = ?auto_97574 ?auto_97575 ) ) ( not ( = ?auto_97574 ?auto_97576 ) ) ( not ( = ?auto_97575 ?auto_97576 ) ) ( ON ?auto_97574 ?auto_97575 ) ( ON ?auto_97573 ?auto_97574 ) ( ON ?auto_97572 ?auto_97573 ) ( ON ?auto_97571 ?auto_97572 ) ( CLEAR ?auto_97569 ) ( ON ?auto_97570 ?auto_97571 ) ( CLEAR ?auto_97570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97568 ?auto_97569 ?auto_97570 )
      ( MAKE-8PILE ?auto_97568 ?auto_97569 ?auto_97570 ?auto_97571 ?auto_97572 ?auto_97573 ?auto_97574 ?auto_97575 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_97602 - BLOCK
      ?auto_97603 - BLOCK
      ?auto_97604 - BLOCK
      ?auto_97605 - BLOCK
      ?auto_97606 - BLOCK
      ?auto_97607 - BLOCK
      ?auto_97608 - BLOCK
      ?auto_97609 - BLOCK
    )
    :vars
    (
      ?auto_97610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97609 ?auto_97610 ) ( ON-TABLE ?auto_97602 ) ( not ( = ?auto_97602 ?auto_97603 ) ) ( not ( = ?auto_97602 ?auto_97604 ) ) ( not ( = ?auto_97602 ?auto_97605 ) ) ( not ( = ?auto_97602 ?auto_97606 ) ) ( not ( = ?auto_97602 ?auto_97607 ) ) ( not ( = ?auto_97602 ?auto_97608 ) ) ( not ( = ?auto_97602 ?auto_97609 ) ) ( not ( = ?auto_97602 ?auto_97610 ) ) ( not ( = ?auto_97603 ?auto_97604 ) ) ( not ( = ?auto_97603 ?auto_97605 ) ) ( not ( = ?auto_97603 ?auto_97606 ) ) ( not ( = ?auto_97603 ?auto_97607 ) ) ( not ( = ?auto_97603 ?auto_97608 ) ) ( not ( = ?auto_97603 ?auto_97609 ) ) ( not ( = ?auto_97603 ?auto_97610 ) ) ( not ( = ?auto_97604 ?auto_97605 ) ) ( not ( = ?auto_97604 ?auto_97606 ) ) ( not ( = ?auto_97604 ?auto_97607 ) ) ( not ( = ?auto_97604 ?auto_97608 ) ) ( not ( = ?auto_97604 ?auto_97609 ) ) ( not ( = ?auto_97604 ?auto_97610 ) ) ( not ( = ?auto_97605 ?auto_97606 ) ) ( not ( = ?auto_97605 ?auto_97607 ) ) ( not ( = ?auto_97605 ?auto_97608 ) ) ( not ( = ?auto_97605 ?auto_97609 ) ) ( not ( = ?auto_97605 ?auto_97610 ) ) ( not ( = ?auto_97606 ?auto_97607 ) ) ( not ( = ?auto_97606 ?auto_97608 ) ) ( not ( = ?auto_97606 ?auto_97609 ) ) ( not ( = ?auto_97606 ?auto_97610 ) ) ( not ( = ?auto_97607 ?auto_97608 ) ) ( not ( = ?auto_97607 ?auto_97609 ) ) ( not ( = ?auto_97607 ?auto_97610 ) ) ( not ( = ?auto_97608 ?auto_97609 ) ) ( not ( = ?auto_97608 ?auto_97610 ) ) ( not ( = ?auto_97609 ?auto_97610 ) ) ( ON ?auto_97608 ?auto_97609 ) ( ON ?auto_97607 ?auto_97608 ) ( ON ?auto_97606 ?auto_97607 ) ( ON ?auto_97605 ?auto_97606 ) ( ON ?auto_97604 ?auto_97605 ) ( CLEAR ?auto_97602 ) ( ON ?auto_97603 ?auto_97604 ) ( CLEAR ?auto_97603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97602 ?auto_97603 )
      ( MAKE-8PILE ?auto_97602 ?auto_97603 ?auto_97604 ?auto_97605 ?auto_97606 ?auto_97607 ?auto_97608 ?auto_97609 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_97636 - BLOCK
      ?auto_97637 - BLOCK
      ?auto_97638 - BLOCK
      ?auto_97639 - BLOCK
      ?auto_97640 - BLOCK
      ?auto_97641 - BLOCK
      ?auto_97642 - BLOCK
      ?auto_97643 - BLOCK
    )
    :vars
    (
      ?auto_97644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97643 ?auto_97644 ) ( not ( = ?auto_97636 ?auto_97637 ) ) ( not ( = ?auto_97636 ?auto_97638 ) ) ( not ( = ?auto_97636 ?auto_97639 ) ) ( not ( = ?auto_97636 ?auto_97640 ) ) ( not ( = ?auto_97636 ?auto_97641 ) ) ( not ( = ?auto_97636 ?auto_97642 ) ) ( not ( = ?auto_97636 ?auto_97643 ) ) ( not ( = ?auto_97636 ?auto_97644 ) ) ( not ( = ?auto_97637 ?auto_97638 ) ) ( not ( = ?auto_97637 ?auto_97639 ) ) ( not ( = ?auto_97637 ?auto_97640 ) ) ( not ( = ?auto_97637 ?auto_97641 ) ) ( not ( = ?auto_97637 ?auto_97642 ) ) ( not ( = ?auto_97637 ?auto_97643 ) ) ( not ( = ?auto_97637 ?auto_97644 ) ) ( not ( = ?auto_97638 ?auto_97639 ) ) ( not ( = ?auto_97638 ?auto_97640 ) ) ( not ( = ?auto_97638 ?auto_97641 ) ) ( not ( = ?auto_97638 ?auto_97642 ) ) ( not ( = ?auto_97638 ?auto_97643 ) ) ( not ( = ?auto_97638 ?auto_97644 ) ) ( not ( = ?auto_97639 ?auto_97640 ) ) ( not ( = ?auto_97639 ?auto_97641 ) ) ( not ( = ?auto_97639 ?auto_97642 ) ) ( not ( = ?auto_97639 ?auto_97643 ) ) ( not ( = ?auto_97639 ?auto_97644 ) ) ( not ( = ?auto_97640 ?auto_97641 ) ) ( not ( = ?auto_97640 ?auto_97642 ) ) ( not ( = ?auto_97640 ?auto_97643 ) ) ( not ( = ?auto_97640 ?auto_97644 ) ) ( not ( = ?auto_97641 ?auto_97642 ) ) ( not ( = ?auto_97641 ?auto_97643 ) ) ( not ( = ?auto_97641 ?auto_97644 ) ) ( not ( = ?auto_97642 ?auto_97643 ) ) ( not ( = ?auto_97642 ?auto_97644 ) ) ( not ( = ?auto_97643 ?auto_97644 ) ) ( ON ?auto_97642 ?auto_97643 ) ( ON ?auto_97641 ?auto_97642 ) ( ON ?auto_97640 ?auto_97641 ) ( ON ?auto_97639 ?auto_97640 ) ( ON ?auto_97638 ?auto_97639 ) ( ON ?auto_97637 ?auto_97638 ) ( ON ?auto_97636 ?auto_97637 ) ( CLEAR ?auto_97636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97636 )
      ( MAKE-8PILE ?auto_97636 ?auto_97637 ?auto_97638 ?auto_97639 ?auto_97640 ?auto_97641 ?auto_97642 ?auto_97643 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_97671 - BLOCK
      ?auto_97672 - BLOCK
      ?auto_97673 - BLOCK
      ?auto_97674 - BLOCK
      ?auto_97675 - BLOCK
      ?auto_97676 - BLOCK
      ?auto_97677 - BLOCK
      ?auto_97678 - BLOCK
      ?auto_97679 - BLOCK
    )
    :vars
    (
      ?auto_97680 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_97678 ) ( ON ?auto_97679 ?auto_97680 ) ( CLEAR ?auto_97679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97671 ) ( ON ?auto_97672 ?auto_97671 ) ( ON ?auto_97673 ?auto_97672 ) ( ON ?auto_97674 ?auto_97673 ) ( ON ?auto_97675 ?auto_97674 ) ( ON ?auto_97676 ?auto_97675 ) ( ON ?auto_97677 ?auto_97676 ) ( ON ?auto_97678 ?auto_97677 ) ( not ( = ?auto_97671 ?auto_97672 ) ) ( not ( = ?auto_97671 ?auto_97673 ) ) ( not ( = ?auto_97671 ?auto_97674 ) ) ( not ( = ?auto_97671 ?auto_97675 ) ) ( not ( = ?auto_97671 ?auto_97676 ) ) ( not ( = ?auto_97671 ?auto_97677 ) ) ( not ( = ?auto_97671 ?auto_97678 ) ) ( not ( = ?auto_97671 ?auto_97679 ) ) ( not ( = ?auto_97671 ?auto_97680 ) ) ( not ( = ?auto_97672 ?auto_97673 ) ) ( not ( = ?auto_97672 ?auto_97674 ) ) ( not ( = ?auto_97672 ?auto_97675 ) ) ( not ( = ?auto_97672 ?auto_97676 ) ) ( not ( = ?auto_97672 ?auto_97677 ) ) ( not ( = ?auto_97672 ?auto_97678 ) ) ( not ( = ?auto_97672 ?auto_97679 ) ) ( not ( = ?auto_97672 ?auto_97680 ) ) ( not ( = ?auto_97673 ?auto_97674 ) ) ( not ( = ?auto_97673 ?auto_97675 ) ) ( not ( = ?auto_97673 ?auto_97676 ) ) ( not ( = ?auto_97673 ?auto_97677 ) ) ( not ( = ?auto_97673 ?auto_97678 ) ) ( not ( = ?auto_97673 ?auto_97679 ) ) ( not ( = ?auto_97673 ?auto_97680 ) ) ( not ( = ?auto_97674 ?auto_97675 ) ) ( not ( = ?auto_97674 ?auto_97676 ) ) ( not ( = ?auto_97674 ?auto_97677 ) ) ( not ( = ?auto_97674 ?auto_97678 ) ) ( not ( = ?auto_97674 ?auto_97679 ) ) ( not ( = ?auto_97674 ?auto_97680 ) ) ( not ( = ?auto_97675 ?auto_97676 ) ) ( not ( = ?auto_97675 ?auto_97677 ) ) ( not ( = ?auto_97675 ?auto_97678 ) ) ( not ( = ?auto_97675 ?auto_97679 ) ) ( not ( = ?auto_97675 ?auto_97680 ) ) ( not ( = ?auto_97676 ?auto_97677 ) ) ( not ( = ?auto_97676 ?auto_97678 ) ) ( not ( = ?auto_97676 ?auto_97679 ) ) ( not ( = ?auto_97676 ?auto_97680 ) ) ( not ( = ?auto_97677 ?auto_97678 ) ) ( not ( = ?auto_97677 ?auto_97679 ) ) ( not ( = ?auto_97677 ?auto_97680 ) ) ( not ( = ?auto_97678 ?auto_97679 ) ) ( not ( = ?auto_97678 ?auto_97680 ) ) ( not ( = ?auto_97679 ?auto_97680 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97679 ?auto_97680 )
      ( !STACK ?auto_97679 ?auto_97678 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_97709 - BLOCK
      ?auto_97710 - BLOCK
      ?auto_97711 - BLOCK
      ?auto_97712 - BLOCK
      ?auto_97713 - BLOCK
      ?auto_97714 - BLOCK
      ?auto_97715 - BLOCK
      ?auto_97716 - BLOCK
      ?auto_97717 - BLOCK
    )
    :vars
    (
      ?auto_97718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97717 ?auto_97718 ) ( ON-TABLE ?auto_97709 ) ( ON ?auto_97710 ?auto_97709 ) ( ON ?auto_97711 ?auto_97710 ) ( ON ?auto_97712 ?auto_97711 ) ( ON ?auto_97713 ?auto_97712 ) ( ON ?auto_97714 ?auto_97713 ) ( ON ?auto_97715 ?auto_97714 ) ( not ( = ?auto_97709 ?auto_97710 ) ) ( not ( = ?auto_97709 ?auto_97711 ) ) ( not ( = ?auto_97709 ?auto_97712 ) ) ( not ( = ?auto_97709 ?auto_97713 ) ) ( not ( = ?auto_97709 ?auto_97714 ) ) ( not ( = ?auto_97709 ?auto_97715 ) ) ( not ( = ?auto_97709 ?auto_97716 ) ) ( not ( = ?auto_97709 ?auto_97717 ) ) ( not ( = ?auto_97709 ?auto_97718 ) ) ( not ( = ?auto_97710 ?auto_97711 ) ) ( not ( = ?auto_97710 ?auto_97712 ) ) ( not ( = ?auto_97710 ?auto_97713 ) ) ( not ( = ?auto_97710 ?auto_97714 ) ) ( not ( = ?auto_97710 ?auto_97715 ) ) ( not ( = ?auto_97710 ?auto_97716 ) ) ( not ( = ?auto_97710 ?auto_97717 ) ) ( not ( = ?auto_97710 ?auto_97718 ) ) ( not ( = ?auto_97711 ?auto_97712 ) ) ( not ( = ?auto_97711 ?auto_97713 ) ) ( not ( = ?auto_97711 ?auto_97714 ) ) ( not ( = ?auto_97711 ?auto_97715 ) ) ( not ( = ?auto_97711 ?auto_97716 ) ) ( not ( = ?auto_97711 ?auto_97717 ) ) ( not ( = ?auto_97711 ?auto_97718 ) ) ( not ( = ?auto_97712 ?auto_97713 ) ) ( not ( = ?auto_97712 ?auto_97714 ) ) ( not ( = ?auto_97712 ?auto_97715 ) ) ( not ( = ?auto_97712 ?auto_97716 ) ) ( not ( = ?auto_97712 ?auto_97717 ) ) ( not ( = ?auto_97712 ?auto_97718 ) ) ( not ( = ?auto_97713 ?auto_97714 ) ) ( not ( = ?auto_97713 ?auto_97715 ) ) ( not ( = ?auto_97713 ?auto_97716 ) ) ( not ( = ?auto_97713 ?auto_97717 ) ) ( not ( = ?auto_97713 ?auto_97718 ) ) ( not ( = ?auto_97714 ?auto_97715 ) ) ( not ( = ?auto_97714 ?auto_97716 ) ) ( not ( = ?auto_97714 ?auto_97717 ) ) ( not ( = ?auto_97714 ?auto_97718 ) ) ( not ( = ?auto_97715 ?auto_97716 ) ) ( not ( = ?auto_97715 ?auto_97717 ) ) ( not ( = ?auto_97715 ?auto_97718 ) ) ( not ( = ?auto_97716 ?auto_97717 ) ) ( not ( = ?auto_97716 ?auto_97718 ) ) ( not ( = ?auto_97717 ?auto_97718 ) ) ( CLEAR ?auto_97715 ) ( ON ?auto_97716 ?auto_97717 ) ( CLEAR ?auto_97716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_97709 ?auto_97710 ?auto_97711 ?auto_97712 ?auto_97713 ?auto_97714 ?auto_97715 ?auto_97716 )
      ( MAKE-9PILE ?auto_97709 ?auto_97710 ?auto_97711 ?auto_97712 ?auto_97713 ?auto_97714 ?auto_97715 ?auto_97716 ?auto_97717 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_97747 - BLOCK
      ?auto_97748 - BLOCK
      ?auto_97749 - BLOCK
      ?auto_97750 - BLOCK
      ?auto_97751 - BLOCK
      ?auto_97752 - BLOCK
      ?auto_97753 - BLOCK
      ?auto_97754 - BLOCK
      ?auto_97755 - BLOCK
    )
    :vars
    (
      ?auto_97756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97755 ?auto_97756 ) ( ON-TABLE ?auto_97747 ) ( ON ?auto_97748 ?auto_97747 ) ( ON ?auto_97749 ?auto_97748 ) ( ON ?auto_97750 ?auto_97749 ) ( ON ?auto_97751 ?auto_97750 ) ( ON ?auto_97752 ?auto_97751 ) ( not ( = ?auto_97747 ?auto_97748 ) ) ( not ( = ?auto_97747 ?auto_97749 ) ) ( not ( = ?auto_97747 ?auto_97750 ) ) ( not ( = ?auto_97747 ?auto_97751 ) ) ( not ( = ?auto_97747 ?auto_97752 ) ) ( not ( = ?auto_97747 ?auto_97753 ) ) ( not ( = ?auto_97747 ?auto_97754 ) ) ( not ( = ?auto_97747 ?auto_97755 ) ) ( not ( = ?auto_97747 ?auto_97756 ) ) ( not ( = ?auto_97748 ?auto_97749 ) ) ( not ( = ?auto_97748 ?auto_97750 ) ) ( not ( = ?auto_97748 ?auto_97751 ) ) ( not ( = ?auto_97748 ?auto_97752 ) ) ( not ( = ?auto_97748 ?auto_97753 ) ) ( not ( = ?auto_97748 ?auto_97754 ) ) ( not ( = ?auto_97748 ?auto_97755 ) ) ( not ( = ?auto_97748 ?auto_97756 ) ) ( not ( = ?auto_97749 ?auto_97750 ) ) ( not ( = ?auto_97749 ?auto_97751 ) ) ( not ( = ?auto_97749 ?auto_97752 ) ) ( not ( = ?auto_97749 ?auto_97753 ) ) ( not ( = ?auto_97749 ?auto_97754 ) ) ( not ( = ?auto_97749 ?auto_97755 ) ) ( not ( = ?auto_97749 ?auto_97756 ) ) ( not ( = ?auto_97750 ?auto_97751 ) ) ( not ( = ?auto_97750 ?auto_97752 ) ) ( not ( = ?auto_97750 ?auto_97753 ) ) ( not ( = ?auto_97750 ?auto_97754 ) ) ( not ( = ?auto_97750 ?auto_97755 ) ) ( not ( = ?auto_97750 ?auto_97756 ) ) ( not ( = ?auto_97751 ?auto_97752 ) ) ( not ( = ?auto_97751 ?auto_97753 ) ) ( not ( = ?auto_97751 ?auto_97754 ) ) ( not ( = ?auto_97751 ?auto_97755 ) ) ( not ( = ?auto_97751 ?auto_97756 ) ) ( not ( = ?auto_97752 ?auto_97753 ) ) ( not ( = ?auto_97752 ?auto_97754 ) ) ( not ( = ?auto_97752 ?auto_97755 ) ) ( not ( = ?auto_97752 ?auto_97756 ) ) ( not ( = ?auto_97753 ?auto_97754 ) ) ( not ( = ?auto_97753 ?auto_97755 ) ) ( not ( = ?auto_97753 ?auto_97756 ) ) ( not ( = ?auto_97754 ?auto_97755 ) ) ( not ( = ?auto_97754 ?auto_97756 ) ) ( not ( = ?auto_97755 ?auto_97756 ) ) ( ON ?auto_97754 ?auto_97755 ) ( CLEAR ?auto_97752 ) ( ON ?auto_97753 ?auto_97754 ) ( CLEAR ?auto_97753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97747 ?auto_97748 ?auto_97749 ?auto_97750 ?auto_97751 ?auto_97752 ?auto_97753 )
      ( MAKE-9PILE ?auto_97747 ?auto_97748 ?auto_97749 ?auto_97750 ?auto_97751 ?auto_97752 ?auto_97753 ?auto_97754 ?auto_97755 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_97785 - BLOCK
      ?auto_97786 - BLOCK
      ?auto_97787 - BLOCK
      ?auto_97788 - BLOCK
      ?auto_97789 - BLOCK
      ?auto_97790 - BLOCK
      ?auto_97791 - BLOCK
      ?auto_97792 - BLOCK
      ?auto_97793 - BLOCK
    )
    :vars
    (
      ?auto_97794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97793 ?auto_97794 ) ( ON-TABLE ?auto_97785 ) ( ON ?auto_97786 ?auto_97785 ) ( ON ?auto_97787 ?auto_97786 ) ( ON ?auto_97788 ?auto_97787 ) ( ON ?auto_97789 ?auto_97788 ) ( not ( = ?auto_97785 ?auto_97786 ) ) ( not ( = ?auto_97785 ?auto_97787 ) ) ( not ( = ?auto_97785 ?auto_97788 ) ) ( not ( = ?auto_97785 ?auto_97789 ) ) ( not ( = ?auto_97785 ?auto_97790 ) ) ( not ( = ?auto_97785 ?auto_97791 ) ) ( not ( = ?auto_97785 ?auto_97792 ) ) ( not ( = ?auto_97785 ?auto_97793 ) ) ( not ( = ?auto_97785 ?auto_97794 ) ) ( not ( = ?auto_97786 ?auto_97787 ) ) ( not ( = ?auto_97786 ?auto_97788 ) ) ( not ( = ?auto_97786 ?auto_97789 ) ) ( not ( = ?auto_97786 ?auto_97790 ) ) ( not ( = ?auto_97786 ?auto_97791 ) ) ( not ( = ?auto_97786 ?auto_97792 ) ) ( not ( = ?auto_97786 ?auto_97793 ) ) ( not ( = ?auto_97786 ?auto_97794 ) ) ( not ( = ?auto_97787 ?auto_97788 ) ) ( not ( = ?auto_97787 ?auto_97789 ) ) ( not ( = ?auto_97787 ?auto_97790 ) ) ( not ( = ?auto_97787 ?auto_97791 ) ) ( not ( = ?auto_97787 ?auto_97792 ) ) ( not ( = ?auto_97787 ?auto_97793 ) ) ( not ( = ?auto_97787 ?auto_97794 ) ) ( not ( = ?auto_97788 ?auto_97789 ) ) ( not ( = ?auto_97788 ?auto_97790 ) ) ( not ( = ?auto_97788 ?auto_97791 ) ) ( not ( = ?auto_97788 ?auto_97792 ) ) ( not ( = ?auto_97788 ?auto_97793 ) ) ( not ( = ?auto_97788 ?auto_97794 ) ) ( not ( = ?auto_97789 ?auto_97790 ) ) ( not ( = ?auto_97789 ?auto_97791 ) ) ( not ( = ?auto_97789 ?auto_97792 ) ) ( not ( = ?auto_97789 ?auto_97793 ) ) ( not ( = ?auto_97789 ?auto_97794 ) ) ( not ( = ?auto_97790 ?auto_97791 ) ) ( not ( = ?auto_97790 ?auto_97792 ) ) ( not ( = ?auto_97790 ?auto_97793 ) ) ( not ( = ?auto_97790 ?auto_97794 ) ) ( not ( = ?auto_97791 ?auto_97792 ) ) ( not ( = ?auto_97791 ?auto_97793 ) ) ( not ( = ?auto_97791 ?auto_97794 ) ) ( not ( = ?auto_97792 ?auto_97793 ) ) ( not ( = ?auto_97792 ?auto_97794 ) ) ( not ( = ?auto_97793 ?auto_97794 ) ) ( ON ?auto_97792 ?auto_97793 ) ( ON ?auto_97791 ?auto_97792 ) ( CLEAR ?auto_97789 ) ( ON ?auto_97790 ?auto_97791 ) ( CLEAR ?auto_97790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97785 ?auto_97786 ?auto_97787 ?auto_97788 ?auto_97789 ?auto_97790 )
      ( MAKE-9PILE ?auto_97785 ?auto_97786 ?auto_97787 ?auto_97788 ?auto_97789 ?auto_97790 ?auto_97791 ?auto_97792 ?auto_97793 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_97823 - BLOCK
      ?auto_97824 - BLOCK
      ?auto_97825 - BLOCK
      ?auto_97826 - BLOCK
      ?auto_97827 - BLOCK
      ?auto_97828 - BLOCK
      ?auto_97829 - BLOCK
      ?auto_97830 - BLOCK
      ?auto_97831 - BLOCK
    )
    :vars
    (
      ?auto_97832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97831 ?auto_97832 ) ( ON-TABLE ?auto_97823 ) ( ON ?auto_97824 ?auto_97823 ) ( ON ?auto_97825 ?auto_97824 ) ( ON ?auto_97826 ?auto_97825 ) ( not ( = ?auto_97823 ?auto_97824 ) ) ( not ( = ?auto_97823 ?auto_97825 ) ) ( not ( = ?auto_97823 ?auto_97826 ) ) ( not ( = ?auto_97823 ?auto_97827 ) ) ( not ( = ?auto_97823 ?auto_97828 ) ) ( not ( = ?auto_97823 ?auto_97829 ) ) ( not ( = ?auto_97823 ?auto_97830 ) ) ( not ( = ?auto_97823 ?auto_97831 ) ) ( not ( = ?auto_97823 ?auto_97832 ) ) ( not ( = ?auto_97824 ?auto_97825 ) ) ( not ( = ?auto_97824 ?auto_97826 ) ) ( not ( = ?auto_97824 ?auto_97827 ) ) ( not ( = ?auto_97824 ?auto_97828 ) ) ( not ( = ?auto_97824 ?auto_97829 ) ) ( not ( = ?auto_97824 ?auto_97830 ) ) ( not ( = ?auto_97824 ?auto_97831 ) ) ( not ( = ?auto_97824 ?auto_97832 ) ) ( not ( = ?auto_97825 ?auto_97826 ) ) ( not ( = ?auto_97825 ?auto_97827 ) ) ( not ( = ?auto_97825 ?auto_97828 ) ) ( not ( = ?auto_97825 ?auto_97829 ) ) ( not ( = ?auto_97825 ?auto_97830 ) ) ( not ( = ?auto_97825 ?auto_97831 ) ) ( not ( = ?auto_97825 ?auto_97832 ) ) ( not ( = ?auto_97826 ?auto_97827 ) ) ( not ( = ?auto_97826 ?auto_97828 ) ) ( not ( = ?auto_97826 ?auto_97829 ) ) ( not ( = ?auto_97826 ?auto_97830 ) ) ( not ( = ?auto_97826 ?auto_97831 ) ) ( not ( = ?auto_97826 ?auto_97832 ) ) ( not ( = ?auto_97827 ?auto_97828 ) ) ( not ( = ?auto_97827 ?auto_97829 ) ) ( not ( = ?auto_97827 ?auto_97830 ) ) ( not ( = ?auto_97827 ?auto_97831 ) ) ( not ( = ?auto_97827 ?auto_97832 ) ) ( not ( = ?auto_97828 ?auto_97829 ) ) ( not ( = ?auto_97828 ?auto_97830 ) ) ( not ( = ?auto_97828 ?auto_97831 ) ) ( not ( = ?auto_97828 ?auto_97832 ) ) ( not ( = ?auto_97829 ?auto_97830 ) ) ( not ( = ?auto_97829 ?auto_97831 ) ) ( not ( = ?auto_97829 ?auto_97832 ) ) ( not ( = ?auto_97830 ?auto_97831 ) ) ( not ( = ?auto_97830 ?auto_97832 ) ) ( not ( = ?auto_97831 ?auto_97832 ) ) ( ON ?auto_97830 ?auto_97831 ) ( ON ?auto_97829 ?auto_97830 ) ( ON ?auto_97828 ?auto_97829 ) ( CLEAR ?auto_97826 ) ( ON ?auto_97827 ?auto_97828 ) ( CLEAR ?auto_97827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97823 ?auto_97824 ?auto_97825 ?auto_97826 ?auto_97827 )
      ( MAKE-9PILE ?auto_97823 ?auto_97824 ?auto_97825 ?auto_97826 ?auto_97827 ?auto_97828 ?auto_97829 ?auto_97830 ?auto_97831 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_97861 - BLOCK
      ?auto_97862 - BLOCK
      ?auto_97863 - BLOCK
      ?auto_97864 - BLOCK
      ?auto_97865 - BLOCK
      ?auto_97866 - BLOCK
      ?auto_97867 - BLOCK
      ?auto_97868 - BLOCK
      ?auto_97869 - BLOCK
    )
    :vars
    (
      ?auto_97870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97869 ?auto_97870 ) ( ON-TABLE ?auto_97861 ) ( ON ?auto_97862 ?auto_97861 ) ( ON ?auto_97863 ?auto_97862 ) ( not ( = ?auto_97861 ?auto_97862 ) ) ( not ( = ?auto_97861 ?auto_97863 ) ) ( not ( = ?auto_97861 ?auto_97864 ) ) ( not ( = ?auto_97861 ?auto_97865 ) ) ( not ( = ?auto_97861 ?auto_97866 ) ) ( not ( = ?auto_97861 ?auto_97867 ) ) ( not ( = ?auto_97861 ?auto_97868 ) ) ( not ( = ?auto_97861 ?auto_97869 ) ) ( not ( = ?auto_97861 ?auto_97870 ) ) ( not ( = ?auto_97862 ?auto_97863 ) ) ( not ( = ?auto_97862 ?auto_97864 ) ) ( not ( = ?auto_97862 ?auto_97865 ) ) ( not ( = ?auto_97862 ?auto_97866 ) ) ( not ( = ?auto_97862 ?auto_97867 ) ) ( not ( = ?auto_97862 ?auto_97868 ) ) ( not ( = ?auto_97862 ?auto_97869 ) ) ( not ( = ?auto_97862 ?auto_97870 ) ) ( not ( = ?auto_97863 ?auto_97864 ) ) ( not ( = ?auto_97863 ?auto_97865 ) ) ( not ( = ?auto_97863 ?auto_97866 ) ) ( not ( = ?auto_97863 ?auto_97867 ) ) ( not ( = ?auto_97863 ?auto_97868 ) ) ( not ( = ?auto_97863 ?auto_97869 ) ) ( not ( = ?auto_97863 ?auto_97870 ) ) ( not ( = ?auto_97864 ?auto_97865 ) ) ( not ( = ?auto_97864 ?auto_97866 ) ) ( not ( = ?auto_97864 ?auto_97867 ) ) ( not ( = ?auto_97864 ?auto_97868 ) ) ( not ( = ?auto_97864 ?auto_97869 ) ) ( not ( = ?auto_97864 ?auto_97870 ) ) ( not ( = ?auto_97865 ?auto_97866 ) ) ( not ( = ?auto_97865 ?auto_97867 ) ) ( not ( = ?auto_97865 ?auto_97868 ) ) ( not ( = ?auto_97865 ?auto_97869 ) ) ( not ( = ?auto_97865 ?auto_97870 ) ) ( not ( = ?auto_97866 ?auto_97867 ) ) ( not ( = ?auto_97866 ?auto_97868 ) ) ( not ( = ?auto_97866 ?auto_97869 ) ) ( not ( = ?auto_97866 ?auto_97870 ) ) ( not ( = ?auto_97867 ?auto_97868 ) ) ( not ( = ?auto_97867 ?auto_97869 ) ) ( not ( = ?auto_97867 ?auto_97870 ) ) ( not ( = ?auto_97868 ?auto_97869 ) ) ( not ( = ?auto_97868 ?auto_97870 ) ) ( not ( = ?auto_97869 ?auto_97870 ) ) ( ON ?auto_97868 ?auto_97869 ) ( ON ?auto_97867 ?auto_97868 ) ( ON ?auto_97866 ?auto_97867 ) ( ON ?auto_97865 ?auto_97866 ) ( CLEAR ?auto_97863 ) ( ON ?auto_97864 ?auto_97865 ) ( CLEAR ?auto_97864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97861 ?auto_97862 ?auto_97863 ?auto_97864 )
      ( MAKE-9PILE ?auto_97861 ?auto_97862 ?auto_97863 ?auto_97864 ?auto_97865 ?auto_97866 ?auto_97867 ?auto_97868 ?auto_97869 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_97899 - BLOCK
      ?auto_97900 - BLOCK
      ?auto_97901 - BLOCK
      ?auto_97902 - BLOCK
      ?auto_97903 - BLOCK
      ?auto_97904 - BLOCK
      ?auto_97905 - BLOCK
      ?auto_97906 - BLOCK
      ?auto_97907 - BLOCK
    )
    :vars
    (
      ?auto_97908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97907 ?auto_97908 ) ( ON-TABLE ?auto_97899 ) ( ON ?auto_97900 ?auto_97899 ) ( not ( = ?auto_97899 ?auto_97900 ) ) ( not ( = ?auto_97899 ?auto_97901 ) ) ( not ( = ?auto_97899 ?auto_97902 ) ) ( not ( = ?auto_97899 ?auto_97903 ) ) ( not ( = ?auto_97899 ?auto_97904 ) ) ( not ( = ?auto_97899 ?auto_97905 ) ) ( not ( = ?auto_97899 ?auto_97906 ) ) ( not ( = ?auto_97899 ?auto_97907 ) ) ( not ( = ?auto_97899 ?auto_97908 ) ) ( not ( = ?auto_97900 ?auto_97901 ) ) ( not ( = ?auto_97900 ?auto_97902 ) ) ( not ( = ?auto_97900 ?auto_97903 ) ) ( not ( = ?auto_97900 ?auto_97904 ) ) ( not ( = ?auto_97900 ?auto_97905 ) ) ( not ( = ?auto_97900 ?auto_97906 ) ) ( not ( = ?auto_97900 ?auto_97907 ) ) ( not ( = ?auto_97900 ?auto_97908 ) ) ( not ( = ?auto_97901 ?auto_97902 ) ) ( not ( = ?auto_97901 ?auto_97903 ) ) ( not ( = ?auto_97901 ?auto_97904 ) ) ( not ( = ?auto_97901 ?auto_97905 ) ) ( not ( = ?auto_97901 ?auto_97906 ) ) ( not ( = ?auto_97901 ?auto_97907 ) ) ( not ( = ?auto_97901 ?auto_97908 ) ) ( not ( = ?auto_97902 ?auto_97903 ) ) ( not ( = ?auto_97902 ?auto_97904 ) ) ( not ( = ?auto_97902 ?auto_97905 ) ) ( not ( = ?auto_97902 ?auto_97906 ) ) ( not ( = ?auto_97902 ?auto_97907 ) ) ( not ( = ?auto_97902 ?auto_97908 ) ) ( not ( = ?auto_97903 ?auto_97904 ) ) ( not ( = ?auto_97903 ?auto_97905 ) ) ( not ( = ?auto_97903 ?auto_97906 ) ) ( not ( = ?auto_97903 ?auto_97907 ) ) ( not ( = ?auto_97903 ?auto_97908 ) ) ( not ( = ?auto_97904 ?auto_97905 ) ) ( not ( = ?auto_97904 ?auto_97906 ) ) ( not ( = ?auto_97904 ?auto_97907 ) ) ( not ( = ?auto_97904 ?auto_97908 ) ) ( not ( = ?auto_97905 ?auto_97906 ) ) ( not ( = ?auto_97905 ?auto_97907 ) ) ( not ( = ?auto_97905 ?auto_97908 ) ) ( not ( = ?auto_97906 ?auto_97907 ) ) ( not ( = ?auto_97906 ?auto_97908 ) ) ( not ( = ?auto_97907 ?auto_97908 ) ) ( ON ?auto_97906 ?auto_97907 ) ( ON ?auto_97905 ?auto_97906 ) ( ON ?auto_97904 ?auto_97905 ) ( ON ?auto_97903 ?auto_97904 ) ( ON ?auto_97902 ?auto_97903 ) ( CLEAR ?auto_97900 ) ( ON ?auto_97901 ?auto_97902 ) ( CLEAR ?auto_97901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97899 ?auto_97900 ?auto_97901 )
      ( MAKE-9PILE ?auto_97899 ?auto_97900 ?auto_97901 ?auto_97902 ?auto_97903 ?auto_97904 ?auto_97905 ?auto_97906 ?auto_97907 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_97937 - BLOCK
      ?auto_97938 - BLOCK
      ?auto_97939 - BLOCK
      ?auto_97940 - BLOCK
      ?auto_97941 - BLOCK
      ?auto_97942 - BLOCK
      ?auto_97943 - BLOCK
      ?auto_97944 - BLOCK
      ?auto_97945 - BLOCK
    )
    :vars
    (
      ?auto_97946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97945 ?auto_97946 ) ( ON-TABLE ?auto_97937 ) ( not ( = ?auto_97937 ?auto_97938 ) ) ( not ( = ?auto_97937 ?auto_97939 ) ) ( not ( = ?auto_97937 ?auto_97940 ) ) ( not ( = ?auto_97937 ?auto_97941 ) ) ( not ( = ?auto_97937 ?auto_97942 ) ) ( not ( = ?auto_97937 ?auto_97943 ) ) ( not ( = ?auto_97937 ?auto_97944 ) ) ( not ( = ?auto_97937 ?auto_97945 ) ) ( not ( = ?auto_97937 ?auto_97946 ) ) ( not ( = ?auto_97938 ?auto_97939 ) ) ( not ( = ?auto_97938 ?auto_97940 ) ) ( not ( = ?auto_97938 ?auto_97941 ) ) ( not ( = ?auto_97938 ?auto_97942 ) ) ( not ( = ?auto_97938 ?auto_97943 ) ) ( not ( = ?auto_97938 ?auto_97944 ) ) ( not ( = ?auto_97938 ?auto_97945 ) ) ( not ( = ?auto_97938 ?auto_97946 ) ) ( not ( = ?auto_97939 ?auto_97940 ) ) ( not ( = ?auto_97939 ?auto_97941 ) ) ( not ( = ?auto_97939 ?auto_97942 ) ) ( not ( = ?auto_97939 ?auto_97943 ) ) ( not ( = ?auto_97939 ?auto_97944 ) ) ( not ( = ?auto_97939 ?auto_97945 ) ) ( not ( = ?auto_97939 ?auto_97946 ) ) ( not ( = ?auto_97940 ?auto_97941 ) ) ( not ( = ?auto_97940 ?auto_97942 ) ) ( not ( = ?auto_97940 ?auto_97943 ) ) ( not ( = ?auto_97940 ?auto_97944 ) ) ( not ( = ?auto_97940 ?auto_97945 ) ) ( not ( = ?auto_97940 ?auto_97946 ) ) ( not ( = ?auto_97941 ?auto_97942 ) ) ( not ( = ?auto_97941 ?auto_97943 ) ) ( not ( = ?auto_97941 ?auto_97944 ) ) ( not ( = ?auto_97941 ?auto_97945 ) ) ( not ( = ?auto_97941 ?auto_97946 ) ) ( not ( = ?auto_97942 ?auto_97943 ) ) ( not ( = ?auto_97942 ?auto_97944 ) ) ( not ( = ?auto_97942 ?auto_97945 ) ) ( not ( = ?auto_97942 ?auto_97946 ) ) ( not ( = ?auto_97943 ?auto_97944 ) ) ( not ( = ?auto_97943 ?auto_97945 ) ) ( not ( = ?auto_97943 ?auto_97946 ) ) ( not ( = ?auto_97944 ?auto_97945 ) ) ( not ( = ?auto_97944 ?auto_97946 ) ) ( not ( = ?auto_97945 ?auto_97946 ) ) ( ON ?auto_97944 ?auto_97945 ) ( ON ?auto_97943 ?auto_97944 ) ( ON ?auto_97942 ?auto_97943 ) ( ON ?auto_97941 ?auto_97942 ) ( ON ?auto_97940 ?auto_97941 ) ( ON ?auto_97939 ?auto_97940 ) ( CLEAR ?auto_97937 ) ( ON ?auto_97938 ?auto_97939 ) ( CLEAR ?auto_97938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97937 ?auto_97938 )
      ( MAKE-9PILE ?auto_97937 ?auto_97938 ?auto_97939 ?auto_97940 ?auto_97941 ?auto_97942 ?auto_97943 ?auto_97944 ?auto_97945 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_97975 - BLOCK
      ?auto_97976 - BLOCK
      ?auto_97977 - BLOCK
      ?auto_97978 - BLOCK
      ?auto_97979 - BLOCK
      ?auto_97980 - BLOCK
      ?auto_97981 - BLOCK
      ?auto_97982 - BLOCK
      ?auto_97983 - BLOCK
    )
    :vars
    (
      ?auto_97984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97983 ?auto_97984 ) ( not ( = ?auto_97975 ?auto_97976 ) ) ( not ( = ?auto_97975 ?auto_97977 ) ) ( not ( = ?auto_97975 ?auto_97978 ) ) ( not ( = ?auto_97975 ?auto_97979 ) ) ( not ( = ?auto_97975 ?auto_97980 ) ) ( not ( = ?auto_97975 ?auto_97981 ) ) ( not ( = ?auto_97975 ?auto_97982 ) ) ( not ( = ?auto_97975 ?auto_97983 ) ) ( not ( = ?auto_97975 ?auto_97984 ) ) ( not ( = ?auto_97976 ?auto_97977 ) ) ( not ( = ?auto_97976 ?auto_97978 ) ) ( not ( = ?auto_97976 ?auto_97979 ) ) ( not ( = ?auto_97976 ?auto_97980 ) ) ( not ( = ?auto_97976 ?auto_97981 ) ) ( not ( = ?auto_97976 ?auto_97982 ) ) ( not ( = ?auto_97976 ?auto_97983 ) ) ( not ( = ?auto_97976 ?auto_97984 ) ) ( not ( = ?auto_97977 ?auto_97978 ) ) ( not ( = ?auto_97977 ?auto_97979 ) ) ( not ( = ?auto_97977 ?auto_97980 ) ) ( not ( = ?auto_97977 ?auto_97981 ) ) ( not ( = ?auto_97977 ?auto_97982 ) ) ( not ( = ?auto_97977 ?auto_97983 ) ) ( not ( = ?auto_97977 ?auto_97984 ) ) ( not ( = ?auto_97978 ?auto_97979 ) ) ( not ( = ?auto_97978 ?auto_97980 ) ) ( not ( = ?auto_97978 ?auto_97981 ) ) ( not ( = ?auto_97978 ?auto_97982 ) ) ( not ( = ?auto_97978 ?auto_97983 ) ) ( not ( = ?auto_97978 ?auto_97984 ) ) ( not ( = ?auto_97979 ?auto_97980 ) ) ( not ( = ?auto_97979 ?auto_97981 ) ) ( not ( = ?auto_97979 ?auto_97982 ) ) ( not ( = ?auto_97979 ?auto_97983 ) ) ( not ( = ?auto_97979 ?auto_97984 ) ) ( not ( = ?auto_97980 ?auto_97981 ) ) ( not ( = ?auto_97980 ?auto_97982 ) ) ( not ( = ?auto_97980 ?auto_97983 ) ) ( not ( = ?auto_97980 ?auto_97984 ) ) ( not ( = ?auto_97981 ?auto_97982 ) ) ( not ( = ?auto_97981 ?auto_97983 ) ) ( not ( = ?auto_97981 ?auto_97984 ) ) ( not ( = ?auto_97982 ?auto_97983 ) ) ( not ( = ?auto_97982 ?auto_97984 ) ) ( not ( = ?auto_97983 ?auto_97984 ) ) ( ON ?auto_97982 ?auto_97983 ) ( ON ?auto_97981 ?auto_97982 ) ( ON ?auto_97980 ?auto_97981 ) ( ON ?auto_97979 ?auto_97980 ) ( ON ?auto_97978 ?auto_97979 ) ( ON ?auto_97977 ?auto_97978 ) ( ON ?auto_97976 ?auto_97977 ) ( ON ?auto_97975 ?auto_97976 ) ( CLEAR ?auto_97975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97975 )
      ( MAKE-9PILE ?auto_97975 ?auto_97976 ?auto_97977 ?auto_97978 ?auto_97979 ?auto_97980 ?auto_97981 ?auto_97982 ?auto_97983 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98014 - BLOCK
      ?auto_98015 - BLOCK
      ?auto_98016 - BLOCK
      ?auto_98017 - BLOCK
      ?auto_98018 - BLOCK
      ?auto_98019 - BLOCK
      ?auto_98020 - BLOCK
      ?auto_98021 - BLOCK
      ?auto_98022 - BLOCK
      ?auto_98023 - BLOCK
    )
    :vars
    (
      ?auto_98024 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98022 ) ( ON ?auto_98023 ?auto_98024 ) ( CLEAR ?auto_98023 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98014 ) ( ON ?auto_98015 ?auto_98014 ) ( ON ?auto_98016 ?auto_98015 ) ( ON ?auto_98017 ?auto_98016 ) ( ON ?auto_98018 ?auto_98017 ) ( ON ?auto_98019 ?auto_98018 ) ( ON ?auto_98020 ?auto_98019 ) ( ON ?auto_98021 ?auto_98020 ) ( ON ?auto_98022 ?auto_98021 ) ( not ( = ?auto_98014 ?auto_98015 ) ) ( not ( = ?auto_98014 ?auto_98016 ) ) ( not ( = ?auto_98014 ?auto_98017 ) ) ( not ( = ?auto_98014 ?auto_98018 ) ) ( not ( = ?auto_98014 ?auto_98019 ) ) ( not ( = ?auto_98014 ?auto_98020 ) ) ( not ( = ?auto_98014 ?auto_98021 ) ) ( not ( = ?auto_98014 ?auto_98022 ) ) ( not ( = ?auto_98014 ?auto_98023 ) ) ( not ( = ?auto_98014 ?auto_98024 ) ) ( not ( = ?auto_98015 ?auto_98016 ) ) ( not ( = ?auto_98015 ?auto_98017 ) ) ( not ( = ?auto_98015 ?auto_98018 ) ) ( not ( = ?auto_98015 ?auto_98019 ) ) ( not ( = ?auto_98015 ?auto_98020 ) ) ( not ( = ?auto_98015 ?auto_98021 ) ) ( not ( = ?auto_98015 ?auto_98022 ) ) ( not ( = ?auto_98015 ?auto_98023 ) ) ( not ( = ?auto_98015 ?auto_98024 ) ) ( not ( = ?auto_98016 ?auto_98017 ) ) ( not ( = ?auto_98016 ?auto_98018 ) ) ( not ( = ?auto_98016 ?auto_98019 ) ) ( not ( = ?auto_98016 ?auto_98020 ) ) ( not ( = ?auto_98016 ?auto_98021 ) ) ( not ( = ?auto_98016 ?auto_98022 ) ) ( not ( = ?auto_98016 ?auto_98023 ) ) ( not ( = ?auto_98016 ?auto_98024 ) ) ( not ( = ?auto_98017 ?auto_98018 ) ) ( not ( = ?auto_98017 ?auto_98019 ) ) ( not ( = ?auto_98017 ?auto_98020 ) ) ( not ( = ?auto_98017 ?auto_98021 ) ) ( not ( = ?auto_98017 ?auto_98022 ) ) ( not ( = ?auto_98017 ?auto_98023 ) ) ( not ( = ?auto_98017 ?auto_98024 ) ) ( not ( = ?auto_98018 ?auto_98019 ) ) ( not ( = ?auto_98018 ?auto_98020 ) ) ( not ( = ?auto_98018 ?auto_98021 ) ) ( not ( = ?auto_98018 ?auto_98022 ) ) ( not ( = ?auto_98018 ?auto_98023 ) ) ( not ( = ?auto_98018 ?auto_98024 ) ) ( not ( = ?auto_98019 ?auto_98020 ) ) ( not ( = ?auto_98019 ?auto_98021 ) ) ( not ( = ?auto_98019 ?auto_98022 ) ) ( not ( = ?auto_98019 ?auto_98023 ) ) ( not ( = ?auto_98019 ?auto_98024 ) ) ( not ( = ?auto_98020 ?auto_98021 ) ) ( not ( = ?auto_98020 ?auto_98022 ) ) ( not ( = ?auto_98020 ?auto_98023 ) ) ( not ( = ?auto_98020 ?auto_98024 ) ) ( not ( = ?auto_98021 ?auto_98022 ) ) ( not ( = ?auto_98021 ?auto_98023 ) ) ( not ( = ?auto_98021 ?auto_98024 ) ) ( not ( = ?auto_98022 ?auto_98023 ) ) ( not ( = ?auto_98022 ?auto_98024 ) ) ( not ( = ?auto_98023 ?auto_98024 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98023 ?auto_98024 )
      ( !STACK ?auto_98023 ?auto_98022 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98035 - BLOCK
      ?auto_98036 - BLOCK
      ?auto_98037 - BLOCK
      ?auto_98038 - BLOCK
      ?auto_98039 - BLOCK
      ?auto_98040 - BLOCK
      ?auto_98041 - BLOCK
      ?auto_98042 - BLOCK
      ?auto_98043 - BLOCK
      ?auto_98044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98043 ) ( ON-TABLE ?auto_98044 ) ( CLEAR ?auto_98044 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98035 ) ( ON ?auto_98036 ?auto_98035 ) ( ON ?auto_98037 ?auto_98036 ) ( ON ?auto_98038 ?auto_98037 ) ( ON ?auto_98039 ?auto_98038 ) ( ON ?auto_98040 ?auto_98039 ) ( ON ?auto_98041 ?auto_98040 ) ( ON ?auto_98042 ?auto_98041 ) ( ON ?auto_98043 ?auto_98042 ) ( not ( = ?auto_98035 ?auto_98036 ) ) ( not ( = ?auto_98035 ?auto_98037 ) ) ( not ( = ?auto_98035 ?auto_98038 ) ) ( not ( = ?auto_98035 ?auto_98039 ) ) ( not ( = ?auto_98035 ?auto_98040 ) ) ( not ( = ?auto_98035 ?auto_98041 ) ) ( not ( = ?auto_98035 ?auto_98042 ) ) ( not ( = ?auto_98035 ?auto_98043 ) ) ( not ( = ?auto_98035 ?auto_98044 ) ) ( not ( = ?auto_98036 ?auto_98037 ) ) ( not ( = ?auto_98036 ?auto_98038 ) ) ( not ( = ?auto_98036 ?auto_98039 ) ) ( not ( = ?auto_98036 ?auto_98040 ) ) ( not ( = ?auto_98036 ?auto_98041 ) ) ( not ( = ?auto_98036 ?auto_98042 ) ) ( not ( = ?auto_98036 ?auto_98043 ) ) ( not ( = ?auto_98036 ?auto_98044 ) ) ( not ( = ?auto_98037 ?auto_98038 ) ) ( not ( = ?auto_98037 ?auto_98039 ) ) ( not ( = ?auto_98037 ?auto_98040 ) ) ( not ( = ?auto_98037 ?auto_98041 ) ) ( not ( = ?auto_98037 ?auto_98042 ) ) ( not ( = ?auto_98037 ?auto_98043 ) ) ( not ( = ?auto_98037 ?auto_98044 ) ) ( not ( = ?auto_98038 ?auto_98039 ) ) ( not ( = ?auto_98038 ?auto_98040 ) ) ( not ( = ?auto_98038 ?auto_98041 ) ) ( not ( = ?auto_98038 ?auto_98042 ) ) ( not ( = ?auto_98038 ?auto_98043 ) ) ( not ( = ?auto_98038 ?auto_98044 ) ) ( not ( = ?auto_98039 ?auto_98040 ) ) ( not ( = ?auto_98039 ?auto_98041 ) ) ( not ( = ?auto_98039 ?auto_98042 ) ) ( not ( = ?auto_98039 ?auto_98043 ) ) ( not ( = ?auto_98039 ?auto_98044 ) ) ( not ( = ?auto_98040 ?auto_98041 ) ) ( not ( = ?auto_98040 ?auto_98042 ) ) ( not ( = ?auto_98040 ?auto_98043 ) ) ( not ( = ?auto_98040 ?auto_98044 ) ) ( not ( = ?auto_98041 ?auto_98042 ) ) ( not ( = ?auto_98041 ?auto_98043 ) ) ( not ( = ?auto_98041 ?auto_98044 ) ) ( not ( = ?auto_98042 ?auto_98043 ) ) ( not ( = ?auto_98042 ?auto_98044 ) ) ( not ( = ?auto_98043 ?auto_98044 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_98044 )
      ( !STACK ?auto_98044 ?auto_98043 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98055 - BLOCK
      ?auto_98056 - BLOCK
      ?auto_98057 - BLOCK
      ?auto_98058 - BLOCK
      ?auto_98059 - BLOCK
      ?auto_98060 - BLOCK
      ?auto_98061 - BLOCK
      ?auto_98062 - BLOCK
      ?auto_98063 - BLOCK
      ?auto_98064 - BLOCK
    )
    :vars
    (
      ?auto_98065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98064 ?auto_98065 ) ( ON-TABLE ?auto_98055 ) ( ON ?auto_98056 ?auto_98055 ) ( ON ?auto_98057 ?auto_98056 ) ( ON ?auto_98058 ?auto_98057 ) ( ON ?auto_98059 ?auto_98058 ) ( ON ?auto_98060 ?auto_98059 ) ( ON ?auto_98061 ?auto_98060 ) ( ON ?auto_98062 ?auto_98061 ) ( not ( = ?auto_98055 ?auto_98056 ) ) ( not ( = ?auto_98055 ?auto_98057 ) ) ( not ( = ?auto_98055 ?auto_98058 ) ) ( not ( = ?auto_98055 ?auto_98059 ) ) ( not ( = ?auto_98055 ?auto_98060 ) ) ( not ( = ?auto_98055 ?auto_98061 ) ) ( not ( = ?auto_98055 ?auto_98062 ) ) ( not ( = ?auto_98055 ?auto_98063 ) ) ( not ( = ?auto_98055 ?auto_98064 ) ) ( not ( = ?auto_98055 ?auto_98065 ) ) ( not ( = ?auto_98056 ?auto_98057 ) ) ( not ( = ?auto_98056 ?auto_98058 ) ) ( not ( = ?auto_98056 ?auto_98059 ) ) ( not ( = ?auto_98056 ?auto_98060 ) ) ( not ( = ?auto_98056 ?auto_98061 ) ) ( not ( = ?auto_98056 ?auto_98062 ) ) ( not ( = ?auto_98056 ?auto_98063 ) ) ( not ( = ?auto_98056 ?auto_98064 ) ) ( not ( = ?auto_98056 ?auto_98065 ) ) ( not ( = ?auto_98057 ?auto_98058 ) ) ( not ( = ?auto_98057 ?auto_98059 ) ) ( not ( = ?auto_98057 ?auto_98060 ) ) ( not ( = ?auto_98057 ?auto_98061 ) ) ( not ( = ?auto_98057 ?auto_98062 ) ) ( not ( = ?auto_98057 ?auto_98063 ) ) ( not ( = ?auto_98057 ?auto_98064 ) ) ( not ( = ?auto_98057 ?auto_98065 ) ) ( not ( = ?auto_98058 ?auto_98059 ) ) ( not ( = ?auto_98058 ?auto_98060 ) ) ( not ( = ?auto_98058 ?auto_98061 ) ) ( not ( = ?auto_98058 ?auto_98062 ) ) ( not ( = ?auto_98058 ?auto_98063 ) ) ( not ( = ?auto_98058 ?auto_98064 ) ) ( not ( = ?auto_98058 ?auto_98065 ) ) ( not ( = ?auto_98059 ?auto_98060 ) ) ( not ( = ?auto_98059 ?auto_98061 ) ) ( not ( = ?auto_98059 ?auto_98062 ) ) ( not ( = ?auto_98059 ?auto_98063 ) ) ( not ( = ?auto_98059 ?auto_98064 ) ) ( not ( = ?auto_98059 ?auto_98065 ) ) ( not ( = ?auto_98060 ?auto_98061 ) ) ( not ( = ?auto_98060 ?auto_98062 ) ) ( not ( = ?auto_98060 ?auto_98063 ) ) ( not ( = ?auto_98060 ?auto_98064 ) ) ( not ( = ?auto_98060 ?auto_98065 ) ) ( not ( = ?auto_98061 ?auto_98062 ) ) ( not ( = ?auto_98061 ?auto_98063 ) ) ( not ( = ?auto_98061 ?auto_98064 ) ) ( not ( = ?auto_98061 ?auto_98065 ) ) ( not ( = ?auto_98062 ?auto_98063 ) ) ( not ( = ?auto_98062 ?auto_98064 ) ) ( not ( = ?auto_98062 ?auto_98065 ) ) ( not ( = ?auto_98063 ?auto_98064 ) ) ( not ( = ?auto_98063 ?auto_98065 ) ) ( not ( = ?auto_98064 ?auto_98065 ) ) ( CLEAR ?auto_98062 ) ( ON ?auto_98063 ?auto_98064 ) ( CLEAR ?auto_98063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_98055 ?auto_98056 ?auto_98057 ?auto_98058 ?auto_98059 ?auto_98060 ?auto_98061 ?auto_98062 ?auto_98063 )
      ( MAKE-10PILE ?auto_98055 ?auto_98056 ?auto_98057 ?auto_98058 ?auto_98059 ?auto_98060 ?auto_98061 ?auto_98062 ?auto_98063 ?auto_98064 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98076 - BLOCK
      ?auto_98077 - BLOCK
      ?auto_98078 - BLOCK
      ?auto_98079 - BLOCK
      ?auto_98080 - BLOCK
      ?auto_98081 - BLOCK
      ?auto_98082 - BLOCK
      ?auto_98083 - BLOCK
      ?auto_98084 - BLOCK
      ?auto_98085 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98085 ) ( ON-TABLE ?auto_98076 ) ( ON ?auto_98077 ?auto_98076 ) ( ON ?auto_98078 ?auto_98077 ) ( ON ?auto_98079 ?auto_98078 ) ( ON ?auto_98080 ?auto_98079 ) ( ON ?auto_98081 ?auto_98080 ) ( ON ?auto_98082 ?auto_98081 ) ( ON ?auto_98083 ?auto_98082 ) ( not ( = ?auto_98076 ?auto_98077 ) ) ( not ( = ?auto_98076 ?auto_98078 ) ) ( not ( = ?auto_98076 ?auto_98079 ) ) ( not ( = ?auto_98076 ?auto_98080 ) ) ( not ( = ?auto_98076 ?auto_98081 ) ) ( not ( = ?auto_98076 ?auto_98082 ) ) ( not ( = ?auto_98076 ?auto_98083 ) ) ( not ( = ?auto_98076 ?auto_98084 ) ) ( not ( = ?auto_98076 ?auto_98085 ) ) ( not ( = ?auto_98077 ?auto_98078 ) ) ( not ( = ?auto_98077 ?auto_98079 ) ) ( not ( = ?auto_98077 ?auto_98080 ) ) ( not ( = ?auto_98077 ?auto_98081 ) ) ( not ( = ?auto_98077 ?auto_98082 ) ) ( not ( = ?auto_98077 ?auto_98083 ) ) ( not ( = ?auto_98077 ?auto_98084 ) ) ( not ( = ?auto_98077 ?auto_98085 ) ) ( not ( = ?auto_98078 ?auto_98079 ) ) ( not ( = ?auto_98078 ?auto_98080 ) ) ( not ( = ?auto_98078 ?auto_98081 ) ) ( not ( = ?auto_98078 ?auto_98082 ) ) ( not ( = ?auto_98078 ?auto_98083 ) ) ( not ( = ?auto_98078 ?auto_98084 ) ) ( not ( = ?auto_98078 ?auto_98085 ) ) ( not ( = ?auto_98079 ?auto_98080 ) ) ( not ( = ?auto_98079 ?auto_98081 ) ) ( not ( = ?auto_98079 ?auto_98082 ) ) ( not ( = ?auto_98079 ?auto_98083 ) ) ( not ( = ?auto_98079 ?auto_98084 ) ) ( not ( = ?auto_98079 ?auto_98085 ) ) ( not ( = ?auto_98080 ?auto_98081 ) ) ( not ( = ?auto_98080 ?auto_98082 ) ) ( not ( = ?auto_98080 ?auto_98083 ) ) ( not ( = ?auto_98080 ?auto_98084 ) ) ( not ( = ?auto_98080 ?auto_98085 ) ) ( not ( = ?auto_98081 ?auto_98082 ) ) ( not ( = ?auto_98081 ?auto_98083 ) ) ( not ( = ?auto_98081 ?auto_98084 ) ) ( not ( = ?auto_98081 ?auto_98085 ) ) ( not ( = ?auto_98082 ?auto_98083 ) ) ( not ( = ?auto_98082 ?auto_98084 ) ) ( not ( = ?auto_98082 ?auto_98085 ) ) ( not ( = ?auto_98083 ?auto_98084 ) ) ( not ( = ?auto_98083 ?auto_98085 ) ) ( not ( = ?auto_98084 ?auto_98085 ) ) ( CLEAR ?auto_98083 ) ( ON ?auto_98084 ?auto_98085 ) ( CLEAR ?auto_98084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_98076 ?auto_98077 ?auto_98078 ?auto_98079 ?auto_98080 ?auto_98081 ?auto_98082 ?auto_98083 ?auto_98084 )
      ( MAKE-10PILE ?auto_98076 ?auto_98077 ?auto_98078 ?auto_98079 ?auto_98080 ?auto_98081 ?auto_98082 ?auto_98083 ?auto_98084 ?auto_98085 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98096 - BLOCK
      ?auto_98097 - BLOCK
      ?auto_98098 - BLOCK
      ?auto_98099 - BLOCK
      ?auto_98100 - BLOCK
      ?auto_98101 - BLOCK
      ?auto_98102 - BLOCK
      ?auto_98103 - BLOCK
      ?auto_98104 - BLOCK
      ?auto_98105 - BLOCK
    )
    :vars
    (
      ?auto_98106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98105 ?auto_98106 ) ( ON-TABLE ?auto_98096 ) ( ON ?auto_98097 ?auto_98096 ) ( ON ?auto_98098 ?auto_98097 ) ( ON ?auto_98099 ?auto_98098 ) ( ON ?auto_98100 ?auto_98099 ) ( ON ?auto_98101 ?auto_98100 ) ( ON ?auto_98102 ?auto_98101 ) ( not ( = ?auto_98096 ?auto_98097 ) ) ( not ( = ?auto_98096 ?auto_98098 ) ) ( not ( = ?auto_98096 ?auto_98099 ) ) ( not ( = ?auto_98096 ?auto_98100 ) ) ( not ( = ?auto_98096 ?auto_98101 ) ) ( not ( = ?auto_98096 ?auto_98102 ) ) ( not ( = ?auto_98096 ?auto_98103 ) ) ( not ( = ?auto_98096 ?auto_98104 ) ) ( not ( = ?auto_98096 ?auto_98105 ) ) ( not ( = ?auto_98096 ?auto_98106 ) ) ( not ( = ?auto_98097 ?auto_98098 ) ) ( not ( = ?auto_98097 ?auto_98099 ) ) ( not ( = ?auto_98097 ?auto_98100 ) ) ( not ( = ?auto_98097 ?auto_98101 ) ) ( not ( = ?auto_98097 ?auto_98102 ) ) ( not ( = ?auto_98097 ?auto_98103 ) ) ( not ( = ?auto_98097 ?auto_98104 ) ) ( not ( = ?auto_98097 ?auto_98105 ) ) ( not ( = ?auto_98097 ?auto_98106 ) ) ( not ( = ?auto_98098 ?auto_98099 ) ) ( not ( = ?auto_98098 ?auto_98100 ) ) ( not ( = ?auto_98098 ?auto_98101 ) ) ( not ( = ?auto_98098 ?auto_98102 ) ) ( not ( = ?auto_98098 ?auto_98103 ) ) ( not ( = ?auto_98098 ?auto_98104 ) ) ( not ( = ?auto_98098 ?auto_98105 ) ) ( not ( = ?auto_98098 ?auto_98106 ) ) ( not ( = ?auto_98099 ?auto_98100 ) ) ( not ( = ?auto_98099 ?auto_98101 ) ) ( not ( = ?auto_98099 ?auto_98102 ) ) ( not ( = ?auto_98099 ?auto_98103 ) ) ( not ( = ?auto_98099 ?auto_98104 ) ) ( not ( = ?auto_98099 ?auto_98105 ) ) ( not ( = ?auto_98099 ?auto_98106 ) ) ( not ( = ?auto_98100 ?auto_98101 ) ) ( not ( = ?auto_98100 ?auto_98102 ) ) ( not ( = ?auto_98100 ?auto_98103 ) ) ( not ( = ?auto_98100 ?auto_98104 ) ) ( not ( = ?auto_98100 ?auto_98105 ) ) ( not ( = ?auto_98100 ?auto_98106 ) ) ( not ( = ?auto_98101 ?auto_98102 ) ) ( not ( = ?auto_98101 ?auto_98103 ) ) ( not ( = ?auto_98101 ?auto_98104 ) ) ( not ( = ?auto_98101 ?auto_98105 ) ) ( not ( = ?auto_98101 ?auto_98106 ) ) ( not ( = ?auto_98102 ?auto_98103 ) ) ( not ( = ?auto_98102 ?auto_98104 ) ) ( not ( = ?auto_98102 ?auto_98105 ) ) ( not ( = ?auto_98102 ?auto_98106 ) ) ( not ( = ?auto_98103 ?auto_98104 ) ) ( not ( = ?auto_98103 ?auto_98105 ) ) ( not ( = ?auto_98103 ?auto_98106 ) ) ( not ( = ?auto_98104 ?auto_98105 ) ) ( not ( = ?auto_98104 ?auto_98106 ) ) ( not ( = ?auto_98105 ?auto_98106 ) ) ( ON ?auto_98104 ?auto_98105 ) ( CLEAR ?auto_98102 ) ( ON ?auto_98103 ?auto_98104 ) ( CLEAR ?auto_98103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_98096 ?auto_98097 ?auto_98098 ?auto_98099 ?auto_98100 ?auto_98101 ?auto_98102 ?auto_98103 )
      ( MAKE-10PILE ?auto_98096 ?auto_98097 ?auto_98098 ?auto_98099 ?auto_98100 ?auto_98101 ?auto_98102 ?auto_98103 ?auto_98104 ?auto_98105 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98117 - BLOCK
      ?auto_98118 - BLOCK
      ?auto_98119 - BLOCK
      ?auto_98120 - BLOCK
      ?auto_98121 - BLOCK
      ?auto_98122 - BLOCK
      ?auto_98123 - BLOCK
      ?auto_98124 - BLOCK
      ?auto_98125 - BLOCK
      ?auto_98126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98126 ) ( ON-TABLE ?auto_98117 ) ( ON ?auto_98118 ?auto_98117 ) ( ON ?auto_98119 ?auto_98118 ) ( ON ?auto_98120 ?auto_98119 ) ( ON ?auto_98121 ?auto_98120 ) ( ON ?auto_98122 ?auto_98121 ) ( ON ?auto_98123 ?auto_98122 ) ( not ( = ?auto_98117 ?auto_98118 ) ) ( not ( = ?auto_98117 ?auto_98119 ) ) ( not ( = ?auto_98117 ?auto_98120 ) ) ( not ( = ?auto_98117 ?auto_98121 ) ) ( not ( = ?auto_98117 ?auto_98122 ) ) ( not ( = ?auto_98117 ?auto_98123 ) ) ( not ( = ?auto_98117 ?auto_98124 ) ) ( not ( = ?auto_98117 ?auto_98125 ) ) ( not ( = ?auto_98117 ?auto_98126 ) ) ( not ( = ?auto_98118 ?auto_98119 ) ) ( not ( = ?auto_98118 ?auto_98120 ) ) ( not ( = ?auto_98118 ?auto_98121 ) ) ( not ( = ?auto_98118 ?auto_98122 ) ) ( not ( = ?auto_98118 ?auto_98123 ) ) ( not ( = ?auto_98118 ?auto_98124 ) ) ( not ( = ?auto_98118 ?auto_98125 ) ) ( not ( = ?auto_98118 ?auto_98126 ) ) ( not ( = ?auto_98119 ?auto_98120 ) ) ( not ( = ?auto_98119 ?auto_98121 ) ) ( not ( = ?auto_98119 ?auto_98122 ) ) ( not ( = ?auto_98119 ?auto_98123 ) ) ( not ( = ?auto_98119 ?auto_98124 ) ) ( not ( = ?auto_98119 ?auto_98125 ) ) ( not ( = ?auto_98119 ?auto_98126 ) ) ( not ( = ?auto_98120 ?auto_98121 ) ) ( not ( = ?auto_98120 ?auto_98122 ) ) ( not ( = ?auto_98120 ?auto_98123 ) ) ( not ( = ?auto_98120 ?auto_98124 ) ) ( not ( = ?auto_98120 ?auto_98125 ) ) ( not ( = ?auto_98120 ?auto_98126 ) ) ( not ( = ?auto_98121 ?auto_98122 ) ) ( not ( = ?auto_98121 ?auto_98123 ) ) ( not ( = ?auto_98121 ?auto_98124 ) ) ( not ( = ?auto_98121 ?auto_98125 ) ) ( not ( = ?auto_98121 ?auto_98126 ) ) ( not ( = ?auto_98122 ?auto_98123 ) ) ( not ( = ?auto_98122 ?auto_98124 ) ) ( not ( = ?auto_98122 ?auto_98125 ) ) ( not ( = ?auto_98122 ?auto_98126 ) ) ( not ( = ?auto_98123 ?auto_98124 ) ) ( not ( = ?auto_98123 ?auto_98125 ) ) ( not ( = ?auto_98123 ?auto_98126 ) ) ( not ( = ?auto_98124 ?auto_98125 ) ) ( not ( = ?auto_98124 ?auto_98126 ) ) ( not ( = ?auto_98125 ?auto_98126 ) ) ( ON ?auto_98125 ?auto_98126 ) ( CLEAR ?auto_98123 ) ( ON ?auto_98124 ?auto_98125 ) ( CLEAR ?auto_98124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_98117 ?auto_98118 ?auto_98119 ?auto_98120 ?auto_98121 ?auto_98122 ?auto_98123 ?auto_98124 )
      ( MAKE-10PILE ?auto_98117 ?auto_98118 ?auto_98119 ?auto_98120 ?auto_98121 ?auto_98122 ?auto_98123 ?auto_98124 ?auto_98125 ?auto_98126 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98137 - BLOCK
      ?auto_98138 - BLOCK
      ?auto_98139 - BLOCK
      ?auto_98140 - BLOCK
      ?auto_98141 - BLOCK
      ?auto_98142 - BLOCK
      ?auto_98143 - BLOCK
      ?auto_98144 - BLOCK
      ?auto_98145 - BLOCK
      ?auto_98146 - BLOCK
    )
    :vars
    (
      ?auto_98147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98146 ?auto_98147 ) ( ON-TABLE ?auto_98137 ) ( ON ?auto_98138 ?auto_98137 ) ( ON ?auto_98139 ?auto_98138 ) ( ON ?auto_98140 ?auto_98139 ) ( ON ?auto_98141 ?auto_98140 ) ( ON ?auto_98142 ?auto_98141 ) ( not ( = ?auto_98137 ?auto_98138 ) ) ( not ( = ?auto_98137 ?auto_98139 ) ) ( not ( = ?auto_98137 ?auto_98140 ) ) ( not ( = ?auto_98137 ?auto_98141 ) ) ( not ( = ?auto_98137 ?auto_98142 ) ) ( not ( = ?auto_98137 ?auto_98143 ) ) ( not ( = ?auto_98137 ?auto_98144 ) ) ( not ( = ?auto_98137 ?auto_98145 ) ) ( not ( = ?auto_98137 ?auto_98146 ) ) ( not ( = ?auto_98137 ?auto_98147 ) ) ( not ( = ?auto_98138 ?auto_98139 ) ) ( not ( = ?auto_98138 ?auto_98140 ) ) ( not ( = ?auto_98138 ?auto_98141 ) ) ( not ( = ?auto_98138 ?auto_98142 ) ) ( not ( = ?auto_98138 ?auto_98143 ) ) ( not ( = ?auto_98138 ?auto_98144 ) ) ( not ( = ?auto_98138 ?auto_98145 ) ) ( not ( = ?auto_98138 ?auto_98146 ) ) ( not ( = ?auto_98138 ?auto_98147 ) ) ( not ( = ?auto_98139 ?auto_98140 ) ) ( not ( = ?auto_98139 ?auto_98141 ) ) ( not ( = ?auto_98139 ?auto_98142 ) ) ( not ( = ?auto_98139 ?auto_98143 ) ) ( not ( = ?auto_98139 ?auto_98144 ) ) ( not ( = ?auto_98139 ?auto_98145 ) ) ( not ( = ?auto_98139 ?auto_98146 ) ) ( not ( = ?auto_98139 ?auto_98147 ) ) ( not ( = ?auto_98140 ?auto_98141 ) ) ( not ( = ?auto_98140 ?auto_98142 ) ) ( not ( = ?auto_98140 ?auto_98143 ) ) ( not ( = ?auto_98140 ?auto_98144 ) ) ( not ( = ?auto_98140 ?auto_98145 ) ) ( not ( = ?auto_98140 ?auto_98146 ) ) ( not ( = ?auto_98140 ?auto_98147 ) ) ( not ( = ?auto_98141 ?auto_98142 ) ) ( not ( = ?auto_98141 ?auto_98143 ) ) ( not ( = ?auto_98141 ?auto_98144 ) ) ( not ( = ?auto_98141 ?auto_98145 ) ) ( not ( = ?auto_98141 ?auto_98146 ) ) ( not ( = ?auto_98141 ?auto_98147 ) ) ( not ( = ?auto_98142 ?auto_98143 ) ) ( not ( = ?auto_98142 ?auto_98144 ) ) ( not ( = ?auto_98142 ?auto_98145 ) ) ( not ( = ?auto_98142 ?auto_98146 ) ) ( not ( = ?auto_98142 ?auto_98147 ) ) ( not ( = ?auto_98143 ?auto_98144 ) ) ( not ( = ?auto_98143 ?auto_98145 ) ) ( not ( = ?auto_98143 ?auto_98146 ) ) ( not ( = ?auto_98143 ?auto_98147 ) ) ( not ( = ?auto_98144 ?auto_98145 ) ) ( not ( = ?auto_98144 ?auto_98146 ) ) ( not ( = ?auto_98144 ?auto_98147 ) ) ( not ( = ?auto_98145 ?auto_98146 ) ) ( not ( = ?auto_98145 ?auto_98147 ) ) ( not ( = ?auto_98146 ?auto_98147 ) ) ( ON ?auto_98145 ?auto_98146 ) ( ON ?auto_98144 ?auto_98145 ) ( CLEAR ?auto_98142 ) ( ON ?auto_98143 ?auto_98144 ) ( CLEAR ?auto_98143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98137 ?auto_98138 ?auto_98139 ?auto_98140 ?auto_98141 ?auto_98142 ?auto_98143 )
      ( MAKE-10PILE ?auto_98137 ?auto_98138 ?auto_98139 ?auto_98140 ?auto_98141 ?auto_98142 ?auto_98143 ?auto_98144 ?auto_98145 ?auto_98146 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98158 - BLOCK
      ?auto_98159 - BLOCK
      ?auto_98160 - BLOCK
      ?auto_98161 - BLOCK
      ?auto_98162 - BLOCK
      ?auto_98163 - BLOCK
      ?auto_98164 - BLOCK
      ?auto_98165 - BLOCK
      ?auto_98166 - BLOCK
      ?auto_98167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98167 ) ( ON-TABLE ?auto_98158 ) ( ON ?auto_98159 ?auto_98158 ) ( ON ?auto_98160 ?auto_98159 ) ( ON ?auto_98161 ?auto_98160 ) ( ON ?auto_98162 ?auto_98161 ) ( ON ?auto_98163 ?auto_98162 ) ( not ( = ?auto_98158 ?auto_98159 ) ) ( not ( = ?auto_98158 ?auto_98160 ) ) ( not ( = ?auto_98158 ?auto_98161 ) ) ( not ( = ?auto_98158 ?auto_98162 ) ) ( not ( = ?auto_98158 ?auto_98163 ) ) ( not ( = ?auto_98158 ?auto_98164 ) ) ( not ( = ?auto_98158 ?auto_98165 ) ) ( not ( = ?auto_98158 ?auto_98166 ) ) ( not ( = ?auto_98158 ?auto_98167 ) ) ( not ( = ?auto_98159 ?auto_98160 ) ) ( not ( = ?auto_98159 ?auto_98161 ) ) ( not ( = ?auto_98159 ?auto_98162 ) ) ( not ( = ?auto_98159 ?auto_98163 ) ) ( not ( = ?auto_98159 ?auto_98164 ) ) ( not ( = ?auto_98159 ?auto_98165 ) ) ( not ( = ?auto_98159 ?auto_98166 ) ) ( not ( = ?auto_98159 ?auto_98167 ) ) ( not ( = ?auto_98160 ?auto_98161 ) ) ( not ( = ?auto_98160 ?auto_98162 ) ) ( not ( = ?auto_98160 ?auto_98163 ) ) ( not ( = ?auto_98160 ?auto_98164 ) ) ( not ( = ?auto_98160 ?auto_98165 ) ) ( not ( = ?auto_98160 ?auto_98166 ) ) ( not ( = ?auto_98160 ?auto_98167 ) ) ( not ( = ?auto_98161 ?auto_98162 ) ) ( not ( = ?auto_98161 ?auto_98163 ) ) ( not ( = ?auto_98161 ?auto_98164 ) ) ( not ( = ?auto_98161 ?auto_98165 ) ) ( not ( = ?auto_98161 ?auto_98166 ) ) ( not ( = ?auto_98161 ?auto_98167 ) ) ( not ( = ?auto_98162 ?auto_98163 ) ) ( not ( = ?auto_98162 ?auto_98164 ) ) ( not ( = ?auto_98162 ?auto_98165 ) ) ( not ( = ?auto_98162 ?auto_98166 ) ) ( not ( = ?auto_98162 ?auto_98167 ) ) ( not ( = ?auto_98163 ?auto_98164 ) ) ( not ( = ?auto_98163 ?auto_98165 ) ) ( not ( = ?auto_98163 ?auto_98166 ) ) ( not ( = ?auto_98163 ?auto_98167 ) ) ( not ( = ?auto_98164 ?auto_98165 ) ) ( not ( = ?auto_98164 ?auto_98166 ) ) ( not ( = ?auto_98164 ?auto_98167 ) ) ( not ( = ?auto_98165 ?auto_98166 ) ) ( not ( = ?auto_98165 ?auto_98167 ) ) ( not ( = ?auto_98166 ?auto_98167 ) ) ( ON ?auto_98166 ?auto_98167 ) ( ON ?auto_98165 ?auto_98166 ) ( CLEAR ?auto_98163 ) ( ON ?auto_98164 ?auto_98165 ) ( CLEAR ?auto_98164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98158 ?auto_98159 ?auto_98160 ?auto_98161 ?auto_98162 ?auto_98163 ?auto_98164 )
      ( MAKE-10PILE ?auto_98158 ?auto_98159 ?auto_98160 ?auto_98161 ?auto_98162 ?auto_98163 ?auto_98164 ?auto_98165 ?auto_98166 ?auto_98167 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98178 - BLOCK
      ?auto_98179 - BLOCK
      ?auto_98180 - BLOCK
      ?auto_98181 - BLOCK
      ?auto_98182 - BLOCK
      ?auto_98183 - BLOCK
      ?auto_98184 - BLOCK
      ?auto_98185 - BLOCK
      ?auto_98186 - BLOCK
      ?auto_98187 - BLOCK
    )
    :vars
    (
      ?auto_98188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98187 ?auto_98188 ) ( ON-TABLE ?auto_98178 ) ( ON ?auto_98179 ?auto_98178 ) ( ON ?auto_98180 ?auto_98179 ) ( ON ?auto_98181 ?auto_98180 ) ( ON ?auto_98182 ?auto_98181 ) ( not ( = ?auto_98178 ?auto_98179 ) ) ( not ( = ?auto_98178 ?auto_98180 ) ) ( not ( = ?auto_98178 ?auto_98181 ) ) ( not ( = ?auto_98178 ?auto_98182 ) ) ( not ( = ?auto_98178 ?auto_98183 ) ) ( not ( = ?auto_98178 ?auto_98184 ) ) ( not ( = ?auto_98178 ?auto_98185 ) ) ( not ( = ?auto_98178 ?auto_98186 ) ) ( not ( = ?auto_98178 ?auto_98187 ) ) ( not ( = ?auto_98178 ?auto_98188 ) ) ( not ( = ?auto_98179 ?auto_98180 ) ) ( not ( = ?auto_98179 ?auto_98181 ) ) ( not ( = ?auto_98179 ?auto_98182 ) ) ( not ( = ?auto_98179 ?auto_98183 ) ) ( not ( = ?auto_98179 ?auto_98184 ) ) ( not ( = ?auto_98179 ?auto_98185 ) ) ( not ( = ?auto_98179 ?auto_98186 ) ) ( not ( = ?auto_98179 ?auto_98187 ) ) ( not ( = ?auto_98179 ?auto_98188 ) ) ( not ( = ?auto_98180 ?auto_98181 ) ) ( not ( = ?auto_98180 ?auto_98182 ) ) ( not ( = ?auto_98180 ?auto_98183 ) ) ( not ( = ?auto_98180 ?auto_98184 ) ) ( not ( = ?auto_98180 ?auto_98185 ) ) ( not ( = ?auto_98180 ?auto_98186 ) ) ( not ( = ?auto_98180 ?auto_98187 ) ) ( not ( = ?auto_98180 ?auto_98188 ) ) ( not ( = ?auto_98181 ?auto_98182 ) ) ( not ( = ?auto_98181 ?auto_98183 ) ) ( not ( = ?auto_98181 ?auto_98184 ) ) ( not ( = ?auto_98181 ?auto_98185 ) ) ( not ( = ?auto_98181 ?auto_98186 ) ) ( not ( = ?auto_98181 ?auto_98187 ) ) ( not ( = ?auto_98181 ?auto_98188 ) ) ( not ( = ?auto_98182 ?auto_98183 ) ) ( not ( = ?auto_98182 ?auto_98184 ) ) ( not ( = ?auto_98182 ?auto_98185 ) ) ( not ( = ?auto_98182 ?auto_98186 ) ) ( not ( = ?auto_98182 ?auto_98187 ) ) ( not ( = ?auto_98182 ?auto_98188 ) ) ( not ( = ?auto_98183 ?auto_98184 ) ) ( not ( = ?auto_98183 ?auto_98185 ) ) ( not ( = ?auto_98183 ?auto_98186 ) ) ( not ( = ?auto_98183 ?auto_98187 ) ) ( not ( = ?auto_98183 ?auto_98188 ) ) ( not ( = ?auto_98184 ?auto_98185 ) ) ( not ( = ?auto_98184 ?auto_98186 ) ) ( not ( = ?auto_98184 ?auto_98187 ) ) ( not ( = ?auto_98184 ?auto_98188 ) ) ( not ( = ?auto_98185 ?auto_98186 ) ) ( not ( = ?auto_98185 ?auto_98187 ) ) ( not ( = ?auto_98185 ?auto_98188 ) ) ( not ( = ?auto_98186 ?auto_98187 ) ) ( not ( = ?auto_98186 ?auto_98188 ) ) ( not ( = ?auto_98187 ?auto_98188 ) ) ( ON ?auto_98186 ?auto_98187 ) ( ON ?auto_98185 ?auto_98186 ) ( ON ?auto_98184 ?auto_98185 ) ( CLEAR ?auto_98182 ) ( ON ?auto_98183 ?auto_98184 ) ( CLEAR ?auto_98183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98178 ?auto_98179 ?auto_98180 ?auto_98181 ?auto_98182 ?auto_98183 )
      ( MAKE-10PILE ?auto_98178 ?auto_98179 ?auto_98180 ?auto_98181 ?auto_98182 ?auto_98183 ?auto_98184 ?auto_98185 ?auto_98186 ?auto_98187 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98199 - BLOCK
      ?auto_98200 - BLOCK
      ?auto_98201 - BLOCK
      ?auto_98202 - BLOCK
      ?auto_98203 - BLOCK
      ?auto_98204 - BLOCK
      ?auto_98205 - BLOCK
      ?auto_98206 - BLOCK
      ?auto_98207 - BLOCK
      ?auto_98208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98208 ) ( ON-TABLE ?auto_98199 ) ( ON ?auto_98200 ?auto_98199 ) ( ON ?auto_98201 ?auto_98200 ) ( ON ?auto_98202 ?auto_98201 ) ( ON ?auto_98203 ?auto_98202 ) ( not ( = ?auto_98199 ?auto_98200 ) ) ( not ( = ?auto_98199 ?auto_98201 ) ) ( not ( = ?auto_98199 ?auto_98202 ) ) ( not ( = ?auto_98199 ?auto_98203 ) ) ( not ( = ?auto_98199 ?auto_98204 ) ) ( not ( = ?auto_98199 ?auto_98205 ) ) ( not ( = ?auto_98199 ?auto_98206 ) ) ( not ( = ?auto_98199 ?auto_98207 ) ) ( not ( = ?auto_98199 ?auto_98208 ) ) ( not ( = ?auto_98200 ?auto_98201 ) ) ( not ( = ?auto_98200 ?auto_98202 ) ) ( not ( = ?auto_98200 ?auto_98203 ) ) ( not ( = ?auto_98200 ?auto_98204 ) ) ( not ( = ?auto_98200 ?auto_98205 ) ) ( not ( = ?auto_98200 ?auto_98206 ) ) ( not ( = ?auto_98200 ?auto_98207 ) ) ( not ( = ?auto_98200 ?auto_98208 ) ) ( not ( = ?auto_98201 ?auto_98202 ) ) ( not ( = ?auto_98201 ?auto_98203 ) ) ( not ( = ?auto_98201 ?auto_98204 ) ) ( not ( = ?auto_98201 ?auto_98205 ) ) ( not ( = ?auto_98201 ?auto_98206 ) ) ( not ( = ?auto_98201 ?auto_98207 ) ) ( not ( = ?auto_98201 ?auto_98208 ) ) ( not ( = ?auto_98202 ?auto_98203 ) ) ( not ( = ?auto_98202 ?auto_98204 ) ) ( not ( = ?auto_98202 ?auto_98205 ) ) ( not ( = ?auto_98202 ?auto_98206 ) ) ( not ( = ?auto_98202 ?auto_98207 ) ) ( not ( = ?auto_98202 ?auto_98208 ) ) ( not ( = ?auto_98203 ?auto_98204 ) ) ( not ( = ?auto_98203 ?auto_98205 ) ) ( not ( = ?auto_98203 ?auto_98206 ) ) ( not ( = ?auto_98203 ?auto_98207 ) ) ( not ( = ?auto_98203 ?auto_98208 ) ) ( not ( = ?auto_98204 ?auto_98205 ) ) ( not ( = ?auto_98204 ?auto_98206 ) ) ( not ( = ?auto_98204 ?auto_98207 ) ) ( not ( = ?auto_98204 ?auto_98208 ) ) ( not ( = ?auto_98205 ?auto_98206 ) ) ( not ( = ?auto_98205 ?auto_98207 ) ) ( not ( = ?auto_98205 ?auto_98208 ) ) ( not ( = ?auto_98206 ?auto_98207 ) ) ( not ( = ?auto_98206 ?auto_98208 ) ) ( not ( = ?auto_98207 ?auto_98208 ) ) ( ON ?auto_98207 ?auto_98208 ) ( ON ?auto_98206 ?auto_98207 ) ( ON ?auto_98205 ?auto_98206 ) ( CLEAR ?auto_98203 ) ( ON ?auto_98204 ?auto_98205 ) ( CLEAR ?auto_98204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98199 ?auto_98200 ?auto_98201 ?auto_98202 ?auto_98203 ?auto_98204 )
      ( MAKE-10PILE ?auto_98199 ?auto_98200 ?auto_98201 ?auto_98202 ?auto_98203 ?auto_98204 ?auto_98205 ?auto_98206 ?auto_98207 ?auto_98208 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98219 - BLOCK
      ?auto_98220 - BLOCK
      ?auto_98221 - BLOCK
      ?auto_98222 - BLOCK
      ?auto_98223 - BLOCK
      ?auto_98224 - BLOCK
      ?auto_98225 - BLOCK
      ?auto_98226 - BLOCK
      ?auto_98227 - BLOCK
      ?auto_98228 - BLOCK
    )
    :vars
    (
      ?auto_98229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98228 ?auto_98229 ) ( ON-TABLE ?auto_98219 ) ( ON ?auto_98220 ?auto_98219 ) ( ON ?auto_98221 ?auto_98220 ) ( ON ?auto_98222 ?auto_98221 ) ( not ( = ?auto_98219 ?auto_98220 ) ) ( not ( = ?auto_98219 ?auto_98221 ) ) ( not ( = ?auto_98219 ?auto_98222 ) ) ( not ( = ?auto_98219 ?auto_98223 ) ) ( not ( = ?auto_98219 ?auto_98224 ) ) ( not ( = ?auto_98219 ?auto_98225 ) ) ( not ( = ?auto_98219 ?auto_98226 ) ) ( not ( = ?auto_98219 ?auto_98227 ) ) ( not ( = ?auto_98219 ?auto_98228 ) ) ( not ( = ?auto_98219 ?auto_98229 ) ) ( not ( = ?auto_98220 ?auto_98221 ) ) ( not ( = ?auto_98220 ?auto_98222 ) ) ( not ( = ?auto_98220 ?auto_98223 ) ) ( not ( = ?auto_98220 ?auto_98224 ) ) ( not ( = ?auto_98220 ?auto_98225 ) ) ( not ( = ?auto_98220 ?auto_98226 ) ) ( not ( = ?auto_98220 ?auto_98227 ) ) ( not ( = ?auto_98220 ?auto_98228 ) ) ( not ( = ?auto_98220 ?auto_98229 ) ) ( not ( = ?auto_98221 ?auto_98222 ) ) ( not ( = ?auto_98221 ?auto_98223 ) ) ( not ( = ?auto_98221 ?auto_98224 ) ) ( not ( = ?auto_98221 ?auto_98225 ) ) ( not ( = ?auto_98221 ?auto_98226 ) ) ( not ( = ?auto_98221 ?auto_98227 ) ) ( not ( = ?auto_98221 ?auto_98228 ) ) ( not ( = ?auto_98221 ?auto_98229 ) ) ( not ( = ?auto_98222 ?auto_98223 ) ) ( not ( = ?auto_98222 ?auto_98224 ) ) ( not ( = ?auto_98222 ?auto_98225 ) ) ( not ( = ?auto_98222 ?auto_98226 ) ) ( not ( = ?auto_98222 ?auto_98227 ) ) ( not ( = ?auto_98222 ?auto_98228 ) ) ( not ( = ?auto_98222 ?auto_98229 ) ) ( not ( = ?auto_98223 ?auto_98224 ) ) ( not ( = ?auto_98223 ?auto_98225 ) ) ( not ( = ?auto_98223 ?auto_98226 ) ) ( not ( = ?auto_98223 ?auto_98227 ) ) ( not ( = ?auto_98223 ?auto_98228 ) ) ( not ( = ?auto_98223 ?auto_98229 ) ) ( not ( = ?auto_98224 ?auto_98225 ) ) ( not ( = ?auto_98224 ?auto_98226 ) ) ( not ( = ?auto_98224 ?auto_98227 ) ) ( not ( = ?auto_98224 ?auto_98228 ) ) ( not ( = ?auto_98224 ?auto_98229 ) ) ( not ( = ?auto_98225 ?auto_98226 ) ) ( not ( = ?auto_98225 ?auto_98227 ) ) ( not ( = ?auto_98225 ?auto_98228 ) ) ( not ( = ?auto_98225 ?auto_98229 ) ) ( not ( = ?auto_98226 ?auto_98227 ) ) ( not ( = ?auto_98226 ?auto_98228 ) ) ( not ( = ?auto_98226 ?auto_98229 ) ) ( not ( = ?auto_98227 ?auto_98228 ) ) ( not ( = ?auto_98227 ?auto_98229 ) ) ( not ( = ?auto_98228 ?auto_98229 ) ) ( ON ?auto_98227 ?auto_98228 ) ( ON ?auto_98226 ?auto_98227 ) ( ON ?auto_98225 ?auto_98226 ) ( ON ?auto_98224 ?auto_98225 ) ( CLEAR ?auto_98222 ) ( ON ?auto_98223 ?auto_98224 ) ( CLEAR ?auto_98223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98219 ?auto_98220 ?auto_98221 ?auto_98222 ?auto_98223 )
      ( MAKE-10PILE ?auto_98219 ?auto_98220 ?auto_98221 ?auto_98222 ?auto_98223 ?auto_98224 ?auto_98225 ?auto_98226 ?auto_98227 ?auto_98228 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98240 - BLOCK
      ?auto_98241 - BLOCK
      ?auto_98242 - BLOCK
      ?auto_98243 - BLOCK
      ?auto_98244 - BLOCK
      ?auto_98245 - BLOCK
      ?auto_98246 - BLOCK
      ?auto_98247 - BLOCK
      ?auto_98248 - BLOCK
      ?auto_98249 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98249 ) ( ON-TABLE ?auto_98240 ) ( ON ?auto_98241 ?auto_98240 ) ( ON ?auto_98242 ?auto_98241 ) ( ON ?auto_98243 ?auto_98242 ) ( not ( = ?auto_98240 ?auto_98241 ) ) ( not ( = ?auto_98240 ?auto_98242 ) ) ( not ( = ?auto_98240 ?auto_98243 ) ) ( not ( = ?auto_98240 ?auto_98244 ) ) ( not ( = ?auto_98240 ?auto_98245 ) ) ( not ( = ?auto_98240 ?auto_98246 ) ) ( not ( = ?auto_98240 ?auto_98247 ) ) ( not ( = ?auto_98240 ?auto_98248 ) ) ( not ( = ?auto_98240 ?auto_98249 ) ) ( not ( = ?auto_98241 ?auto_98242 ) ) ( not ( = ?auto_98241 ?auto_98243 ) ) ( not ( = ?auto_98241 ?auto_98244 ) ) ( not ( = ?auto_98241 ?auto_98245 ) ) ( not ( = ?auto_98241 ?auto_98246 ) ) ( not ( = ?auto_98241 ?auto_98247 ) ) ( not ( = ?auto_98241 ?auto_98248 ) ) ( not ( = ?auto_98241 ?auto_98249 ) ) ( not ( = ?auto_98242 ?auto_98243 ) ) ( not ( = ?auto_98242 ?auto_98244 ) ) ( not ( = ?auto_98242 ?auto_98245 ) ) ( not ( = ?auto_98242 ?auto_98246 ) ) ( not ( = ?auto_98242 ?auto_98247 ) ) ( not ( = ?auto_98242 ?auto_98248 ) ) ( not ( = ?auto_98242 ?auto_98249 ) ) ( not ( = ?auto_98243 ?auto_98244 ) ) ( not ( = ?auto_98243 ?auto_98245 ) ) ( not ( = ?auto_98243 ?auto_98246 ) ) ( not ( = ?auto_98243 ?auto_98247 ) ) ( not ( = ?auto_98243 ?auto_98248 ) ) ( not ( = ?auto_98243 ?auto_98249 ) ) ( not ( = ?auto_98244 ?auto_98245 ) ) ( not ( = ?auto_98244 ?auto_98246 ) ) ( not ( = ?auto_98244 ?auto_98247 ) ) ( not ( = ?auto_98244 ?auto_98248 ) ) ( not ( = ?auto_98244 ?auto_98249 ) ) ( not ( = ?auto_98245 ?auto_98246 ) ) ( not ( = ?auto_98245 ?auto_98247 ) ) ( not ( = ?auto_98245 ?auto_98248 ) ) ( not ( = ?auto_98245 ?auto_98249 ) ) ( not ( = ?auto_98246 ?auto_98247 ) ) ( not ( = ?auto_98246 ?auto_98248 ) ) ( not ( = ?auto_98246 ?auto_98249 ) ) ( not ( = ?auto_98247 ?auto_98248 ) ) ( not ( = ?auto_98247 ?auto_98249 ) ) ( not ( = ?auto_98248 ?auto_98249 ) ) ( ON ?auto_98248 ?auto_98249 ) ( ON ?auto_98247 ?auto_98248 ) ( ON ?auto_98246 ?auto_98247 ) ( ON ?auto_98245 ?auto_98246 ) ( CLEAR ?auto_98243 ) ( ON ?auto_98244 ?auto_98245 ) ( CLEAR ?auto_98244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98240 ?auto_98241 ?auto_98242 ?auto_98243 ?auto_98244 )
      ( MAKE-10PILE ?auto_98240 ?auto_98241 ?auto_98242 ?auto_98243 ?auto_98244 ?auto_98245 ?auto_98246 ?auto_98247 ?auto_98248 ?auto_98249 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98260 - BLOCK
      ?auto_98261 - BLOCK
      ?auto_98262 - BLOCK
      ?auto_98263 - BLOCK
      ?auto_98264 - BLOCK
      ?auto_98265 - BLOCK
      ?auto_98266 - BLOCK
      ?auto_98267 - BLOCK
      ?auto_98268 - BLOCK
      ?auto_98269 - BLOCK
    )
    :vars
    (
      ?auto_98270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98269 ?auto_98270 ) ( ON-TABLE ?auto_98260 ) ( ON ?auto_98261 ?auto_98260 ) ( ON ?auto_98262 ?auto_98261 ) ( not ( = ?auto_98260 ?auto_98261 ) ) ( not ( = ?auto_98260 ?auto_98262 ) ) ( not ( = ?auto_98260 ?auto_98263 ) ) ( not ( = ?auto_98260 ?auto_98264 ) ) ( not ( = ?auto_98260 ?auto_98265 ) ) ( not ( = ?auto_98260 ?auto_98266 ) ) ( not ( = ?auto_98260 ?auto_98267 ) ) ( not ( = ?auto_98260 ?auto_98268 ) ) ( not ( = ?auto_98260 ?auto_98269 ) ) ( not ( = ?auto_98260 ?auto_98270 ) ) ( not ( = ?auto_98261 ?auto_98262 ) ) ( not ( = ?auto_98261 ?auto_98263 ) ) ( not ( = ?auto_98261 ?auto_98264 ) ) ( not ( = ?auto_98261 ?auto_98265 ) ) ( not ( = ?auto_98261 ?auto_98266 ) ) ( not ( = ?auto_98261 ?auto_98267 ) ) ( not ( = ?auto_98261 ?auto_98268 ) ) ( not ( = ?auto_98261 ?auto_98269 ) ) ( not ( = ?auto_98261 ?auto_98270 ) ) ( not ( = ?auto_98262 ?auto_98263 ) ) ( not ( = ?auto_98262 ?auto_98264 ) ) ( not ( = ?auto_98262 ?auto_98265 ) ) ( not ( = ?auto_98262 ?auto_98266 ) ) ( not ( = ?auto_98262 ?auto_98267 ) ) ( not ( = ?auto_98262 ?auto_98268 ) ) ( not ( = ?auto_98262 ?auto_98269 ) ) ( not ( = ?auto_98262 ?auto_98270 ) ) ( not ( = ?auto_98263 ?auto_98264 ) ) ( not ( = ?auto_98263 ?auto_98265 ) ) ( not ( = ?auto_98263 ?auto_98266 ) ) ( not ( = ?auto_98263 ?auto_98267 ) ) ( not ( = ?auto_98263 ?auto_98268 ) ) ( not ( = ?auto_98263 ?auto_98269 ) ) ( not ( = ?auto_98263 ?auto_98270 ) ) ( not ( = ?auto_98264 ?auto_98265 ) ) ( not ( = ?auto_98264 ?auto_98266 ) ) ( not ( = ?auto_98264 ?auto_98267 ) ) ( not ( = ?auto_98264 ?auto_98268 ) ) ( not ( = ?auto_98264 ?auto_98269 ) ) ( not ( = ?auto_98264 ?auto_98270 ) ) ( not ( = ?auto_98265 ?auto_98266 ) ) ( not ( = ?auto_98265 ?auto_98267 ) ) ( not ( = ?auto_98265 ?auto_98268 ) ) ( not ( = ?auto_98265 ?auto_98269 ) ) ( not ( = ?auto_98265 ?auto_98270 ) ) ( not ( = ?auto_98266 ?auto_98267 ) ) ( not ( = ?auto_98266 ?auto_98268 ) ) ( not ( = ?auto_98266 ?auto_98269 ) ) ( not ( = ?auto_98266 ?auto_98270 ) ) ( not ( = ?auto_98267 ?auto_98268 ) ) ( not ( = ?auto_98267 ?auto_98269 ) ) ( not ( = ?auto_98267 ?auto_98270 ) ) ( not ( = ?auto_98268 ?auto_98269 ) ) ( not ( = ?auto_98268 ?auto_98270 ) ) ( not ( = ?auto_98269 ?auto_98270 ) ) ( ON ?auto_98268 ?auto_98269 ) ( ON ?auto_98267 ?auto_98268 ) ( ON ?auto_98266 ?auto_98267 ) ( ON ?auto_98265 ?auto_98266 ) ( ON ?auto_98264 ?auto_98265 ) ( CLEAR ?auto_98262 ) ( ON ?auto_98263 ?auto_98264 ) ( CLEAR ?auto_98263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98260 ?auto_98261 ?auto_98262 ?auto_98263 )
      ( MAKE-10PILE ?auto_98260 ?auto_98261 ?auto_98262 ?auto_98263 ?auto_98264 ?auto_98265 ?auto_98266 ?auto_98267 ?auto_98268 ?auto_98269 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98281 - BLOCK
      ?auto_98282 - BLOCK
      ?auto_98283 - BLOCK
      ?auto_98284 - BLOCK
      ?auto_98285 - BLOCK
      ?auto_98286 - BLOCK
      ?auto_98287 - BLOCK
      ?auto_98288 - BLOCK
      ?auto_98289 - BLOCK
      ?auto_98290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98290 ) ( ON-TABLE ?auto_98281 ) ( ON ?auto_98282 ?auto_98281 ) ( ON ?auto_98283 ?auto_98282 ) ( not ( = ?auto_98281 ?auto_98282 ) ) ( not ( = ?auto_98281 ?auto_98283 ) ) ( not ( = ?auto_98281 ?auto_98284 ) ) ( not ( = ?auto_98281 ?auto_98285 ) ) ( not ( = ?auto_98281 ?auto_98286 ) ) ( not ( = ?auto_98281 ?auto_98287 ) ) ( not ( = ?auto_98281 ?auto_98288 ) ) ( not ( = ?auto_98281 ?auto_98289 ) ) ( not ( = ?auto_98281 ?auto_98290 ) ) ( not ( = ?auto_98282 ?auto_98283 ) ) ( not ( = ?auto_98282 ?auto_98284 ) ) ( not ( = ?auto_98282 ?auto_98285 ) ) ( not ( = ?auto_98282 ?auto_98286 ) ) ( not ( = ?auto_98282 ?auto_98287 ) ) ( not ( = ?auto_98282 ?auto_98288 ) ) ( not ( = ?auto_98282 ?auto_98289 ) ) ( not ( = ?auto_98282 ?auto_98290 ) ) ( not ( = ?auto_98283 ?auto_98284 ) ) ( not ( = ?auto_98283 ?auto_98285 ) ) ( not ( = ?auto_98283 ?auto_98286 ) ) ( not ( = ?auto_98283 ?auto_98287 ) ) ( not ( = ?auto_98283 ?auto_98288 ) ) ( not ( = ?auto_98283 ?auto_98289 ) ) ( not ( = ?auto_98283 ?auto_98290 ) ) ( not ( = ?auto_98284 ?auto_98285 ) ) ( not ( = ?auto_98284 ?auto_98286 ) ) ( not ( = ?auto_98284 ?auto_98287 ) ) ( not ( = ?auto_98284 ?auto_98288 ) ) ( not ( = ?auto_98284 ?auto_98289 ) ) ( not ( = ?auto_98284 ?auto_98290 ) ) ( not ( = ?auto_98285 ?auto_98286 ) ) ( not ( = ?auto_98285 ?auto_98287 ) ) ( not ( = ?auto_98285 ?auto_98288 ) ) ( not ( = ?auto_98285 ?auto_98289 ) ) ( not ( = ?auto_98285 ?auto_98290 ) ) ( not ( = ?auto_98286 ?auto_98287 ) ) ( not ( = ?auto_98286 ?auto_98288 ) ) ( not ( = ?auto_98286 ?auto_98289 ) ) ( not ( = ?auto_98286 ?auto_98290 ) ) ( not ( = ?auto_98287 ?auto_98288 ) ) ( not ( = ?auto_98287 ?auto_98289 ) ) ( not ( = ?auto_98287 ?auto_98290 ) ) ( not ( = ?auto_98288 ?auto_98289 ) ) ( not ( = ?auto_98288 ?auto_98290 ) ) ( not ( = ?auto_98289 ?auto_98290 ) ) ( ON ?auto_98289 ?auto_98290 ) ( ON ?auto_98288 ?auto_98289 ) ( ON ?auto_98287 ?auto_98288 ) ( ON ?auto_98286 ?auto_98287 ) ( ON ?auto_98285 ?auto_98286 ) ( CLEAR ?auto_98283 ) ( ON ?auto_98284 ?auto_98285 ) ( CLEAR ?auto_98284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98281 ?auto_98282 ?auto_98283 ?auto_98284 )
      ( MAKE-10PILE ?auto_98281 ?auto_98282 ?auto_98283 ?auto_98284 ?auto_98285 ?auto_98286 ?auto_98287 ?auto_98288 ?auto_98289 ?auto_98290 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98301 - BLOCK
      ?auto_98302 - BLOCK
      ?auto_98303 - BLOCK
      ?auto_98304 - BLOCK
      ?auto_98305 - BLOCK
      ?auto_98306 - BLOCK
      ?auto_98307 - BLOCK
      ?auto_98308 - BLOCK
      ?auto_98309 - BLOCK
      ?auto_98310 - BLOCK
    )
    :vars
    (
      ?auto_98311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98310 ?auto_98311 ) ( ON-TABLE ?auto_98301 ) ( ON ?auto_98302 ?auto_98301 ) ( not ( = ?auto_98301 ?auto_98302 ) ) ( not ( = ?auto_98301 ?auto_98303 ) ) ( not ( = ?auto_98301 ?auto_98304 ) ) ( not ( = ?auto_98301 ?auto_98305 ) ) ( not ( = ?auto_98301 ?auto_98306 ) ) ( not ( = ?auto_98301 ?auto_98307 ) ) ( not ( = ?auto_98301 ?auto_98308 ) ) ( not ( = ?auto_98301 ?auto_98309 ) ) ( not ( = ?auto_98301 ?auto_98310 ) ) ( not ( = ?auto_98301 ?auto_98311 ) ) ( not ( = ?auto_98302 ?auto_98303 ) ) ( not ( = ?auto_98302 ?auto_98304 ) ) ( not ( = ?auto_98302 ?auto_98305 ) ) ( not ( = ?auto_98302 ?auto_98306 ) ) ( not ( = ?auto_98302 ?auto_98307 ) ) ( not ( = ?auto_98302 ?auto_98308 ) ) ( not ( = ?auto_98302 ?auto_98309 ) ) ( not ( = ?auto_98302 ?auto_98310 ) ) ( not ( = ?auto_98302 ?auto_98311 ) ) ( not ( = ?auto_98303 ?auto_98304 ) ) ( not ( = ?auto_98303 ?auto_98305 ) ) ( not ( = ?auto_98303 ?auto_98306 ) ) ( not ( = ?auto_98303 ?auto_98307 ) ) ( not ( = ?auto_98303 ?auto_98308 ) ) ( not ( = ?auto_98303 ?auto_98309 ) ) ( not ( = ?auto_98303 ?auto_98310 ) ) ( not ( = ?auto_98303 ?auto_98311 ) ) ( not ( = ?auto_98304 ?auto_98305 ) ) ( not ( = ?auto_98304 ?auto_98306 ) ) ( not ( = ?auto_98304 ?auto_98307 ) ) ( not ( = ?auto_98304 ?auto_98308 ) ) ( not ( = ?auto_98304 ?auto_98309 ) ) ( not ( = ?auto_98304 ?auto_98310 ) ) ( not ( = ?auto_98304 ?auto_98311 ) ) ( not ( = ?auto_98305 ?auto_98306 ) ) ( not ( = ?auto_98305 ?auto_98307 ) ) ( not ( = ?auto_98305 ?auto_98308 ) ) ( not ( = ?auto_98305 ?auto_98309 ) ) ( not ( = ?auto_98305 ?auto_98310 ) ) ( not ( = ?auto_98305 ?auto_98311 ) ) ( not ( = ?auto_98306 ?auto_98307 ) ) ( not ( = ?auto_98306 ?auto_98308 ) ) ( not ( = ?auto_98306 ?auto_98309 ) ) ( not ( = ?auto_98306 ?auto_98310 ) ) ( not ( = ?auto_98306 ?auto_98311 ) ) ( not ( = ?auto_98307 ?auto_98308 ) ) ( not ( = ?auto_98307 ?auto_98309 ) ) ( not ( = ?auto_98307 ?auto_98310 ) ) ( not ( = ?auto_98307 ?auto_98311 ) ) ( not ( = ?auto_98308 ?auto_98309 ) ) ( not ( = ?auto_98308 ?auto_98310 ) ) ( not ( = ?auto_98308 ?auto_98311 ) ) ( not ( = ?auto_98309 ?auto_98310 ) ) ( not ( = ?auto_98309 ?auto_98311 ) ) ( not ( = ?auto_98310 ?auto_98311 ) ) ( ON ?auto_98309 ?auto_98310 ) ( ON ?auto_98308 ?auto_98309 ) ( ON ?auto_98307 ?auto_98308 ) ( ON ?auto_98306 ?auto_98307 ) ( ON ?auto_98305 ?auto_98306 ) ( ON ?auto_98304 ?auto_98305 ) ( CLEAR ?auto_98302 ) ( ON ?auto_98303 ?auto_98304 ) ( CLEAR ?auto_98303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98301 ?auto_98302 ?auto_98303 )
      ( MAKE-10PILE ?auto_98301 ?auto_98302 ?auto_98303 ?auto_98304 ?auto_98305 ?auto_98306 ?auto_98307 ?auto_98308 ?auto_98309 ?auto_98310 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98322 - BLOCK
      ?auto_98323 - BLOCK
      ?auto_98324 - BLOCK
      ?auto_98325 - BLOCK
      ?auto_98326 - BLOCK
      ?auto_98327 - BLOCK
      ?auto_98328 - BLOCK
      ?auto_98329 - BLOCK
      ?auto_98330 - BLOCK
      ?auto_98331 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98331 ) ( ON-TABLE ?auto_98322 ) ( ON ?auto_98323 ?auto_98322 ) ( not ( = ?auto_98322 ?auto_98323 ) ) ( not ( = ?auto_98322 ?auto_98324 ) ) ( not ( = ?auto_98322 ?auto_98325 ) ) ( not ( = ?auto_98322 ?auto_98326 ) ) ( not ( = ?auto_98322 ?auto_98327 ) ) ( not ( = ?auto_98322 ?auto_98328 ) ) ( not ( = ?auto_98322 ?auto_98329 ) ) ( not ( = ?auto_98322 ?auto_98330 ) ) ( not ( = ?auto_98322 ?auto_98331 ) ) ( not ( = ?auto_98323 ?auto_98324 ) ) ( not ( = ?auto_98323 ?auto_98325 ) ) ( not ( = ?auto_98323 ?auto_98326 ) ) ( not ( = ?auto_98323 ?auto_98327 ) ) ( not ( = ?auto_98323 ?auto_98328 ) ) ( not ( = ?auto_98323 ?auto_98329 ) ) ( not ( = ?auto_98323 ?auto_98330 ) ) ( not ( = ?auto_98323 ?auto_98331 ) ) ( not ( = ?auto_98324 ?auto_98325 ) ) ( not ( = ?auto_98324 ?auto_98326 ) ) ( not ( = ?auto_98324 ?auto_98327 ) ) ( not ( = ?auto_98324 ?auto_98328 ) ) ( not ( = ?auto_98324 ?auto_98329 ) ) ( not ( = ?auto_98324 ?auto_98330 ) ) ( not ( = ?auto_98324 ?auto_98331 ) ) ( not ( = ?auto_98325 ?auto_98326 ) ) ( not ( = ?auto_98325 ?auto_98327 ) ) ( not ( = ?auto_98325 ?auto_98328 ) ) ( not ( = ?auto_98325 ?auto_98329 ) ) ( not ( = ?auto_98325 ?auto_98330 ) ) ( not ( = ?auto_98325 ?auto_98331 ) ) ( not ( = ?auto_98326 ?auto_98327 ) ) ( not ( = ?auto_98326 ?auto_98328 ) ) ( not ( = ?auto_98326 ?auto_98329 ) ) ( not ( = ?auto_98326 ?auto_98330 ) ) ( not ( = ?auto_98326 ?auto_98331 ) ) ( not ( = ?auto_98327 ?auto_98328 ) ) ( not ( = ?auto_98327 ?auto_98329 ) ) ( not ( = ?auto_98327 ?auto_98330 ) ) ( not ( = ?auto_98327 ?auto_98331 ) ) ( not ( = ?auto_98328 ?auto_98329 ) ) ( not ( = ?auto_98328 ?auto_98330 ) ) ( not ( = ?auto_98328 ?auto_98331 ) ) ( not ( = ?auto_98329 ?auto_98330 ) ) ( not ( = ?auto_98329 ?auto_98331 ) ) ( not ( = ?auto_98330 ?auto_98331 ) ) ( ON ?auto_98330 ?auto_98331 ) ( ON ?auto_98329 ?auto_98330 ) ( ON ?auto_98328 ?auto_98329 ) ( ON ?auto_98327 ?auto_98328 ) ( ON ?auto_98326 ?auto_98327 ) ( ON ?auto_98325 ?auto_98326 ) ( CLEAR ?auto_98323 ) ( ON ?auto_98324 ?auto_98325 ) ( CLEAR ?auto_98324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98322 ?auto_98323 ?auto_98324 )
      ( MAKE-10PILE ?auto_98322 ?auto_98323 ?auto_98324 ?auto_98325 ?auto_98326 ?auto_98327 ?auto_98328 ?auto_98329 ?auto_98330 ?auto_98331 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98342 - BLOCK
      ?auto_98343 - BLOCK
      ?auto_98344 - BLOCK
      ?auto_98345 - BLOCK
      ?auto_98346 - BLOCK
      ?auto_98347 - BLOCK
      ?auto_98348 - BLOCK
      ?auto_98349 - BLOCK
      ?auto_98350 - BLOCK
      ?auto_98351 - BLOCK
    )
    :vars
    (
      ?auto_98352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98351 ?auto_98352 ) ( ON-TABLE ?auto_98342 ) ( not ( = ?auto_98342 ?auto_98343 ) ) ( not ( = ?auto_98342 ?auto_98344 ) ) ( not ( = ?auto_98342 ?auto_98345 ) ) ( not ( = ?auto_98342 ?auto_98346 ) ) ( not ( = ?auto_98342 ?auto_98347 ) ) ( not ( = ?auto_98342 ?auto_98348 ) ) ( not ( = ?auto_98342 ?auto_98349 ) ) ( not ( = ?auto_98342 ?auto_98350 ) ) ( not ( = ?auto_98342 ?auto_98351 ) ) ( not ( = ?auto_98342 ?auto_98352 ) ) ( not ( = ?auto_98343 ?auto_98344 ) ) ( not ( = ?auto_98343 ?auto_98345 ) ) ( not ( = ?auto_98343 ?auto_98346 ) ) ( not ( = ?auto_98343 ?auto_98347 ) ) ( not ( = ?auto_98343 ?auto_98348 ) ) ( not ( = ?auto_98343 ?auto_98349 ) ) ( not ( = ?auto_98343 ?auto_98350 ) ) ( not ( = ?auto_98343 ?auto_98351 ) ) ( not ( = ?auto_98343 ?auto_98352 ) ) ( not ( = ?auto_98344 ?auto_98345 ) ) ( not ( = ?auto_98344 ?auto_98346 ) ) ( not ( = ?auto_98344 ?auto_98347 ) ) ( not ( = ?auto_98344 ?auto_98348 ) ) ( not ( = ?auto_98344 ?auto_98349 ) ) ( not ( = ?auto_98344 ?auto_98350 ) ) ( not ( = ?auto_98344 ?auto_98351 ) ) ( not ( = ?auto_98344 ?auto_98352 ) ) ( not ( = ?auto_98345 ?auto_98346 ) ) ( not ( = ?auto_98345 ?auto_98347 ) ) ( not ( = ?auto_98345 ?auto_98348 ) ) ( not ( = ?auto_98345 ?auto_98349 ) ) ( not ( = ?auto_98345 ?auto_98350 ) ) ( not ( = ?auto_98345 ?auto_98351 ) ) ( not ( = ?auto_98345 ?auto_98352 ) ) ( not ( = ?auto_98346 ?auto_98347 ) ) ( not ( = ?auto_98346 ?auto_98348 ) ) ( not ( = ?auto_98346 ?auto_98349 ) ) ( not ( = ?auto_98346 ?auto_98350 ) ) ( not ( = ?auto_98346 ?auto_98351 ) ) ( not ( = ?auto_98346 ?auto_98352 ) ) ( not ( = ?auto_98347 ?auto_98348 ) ) ( not ( = ?auto_98347 ?auto_98349 ) ) ( not ( = ?auto_98347 ?auto_98350 ) ) ( not ( = ?auto_98347 ?auto_98351 ) ) ( not ( = ?auto_98347 ?auto_98352 ) ) ( not ( = ?auto_98348 ?auto_98349 ) ) ( not ( = ?auto_98348 ?auto_98350 ) ) ( not ( = ?auto_98348 ?auto_98351 ) ) ( not ( = ?auto_98348 ?auto_98352 ) ) ( not ( = ?auto_98349 ?auto_98350 ) ) ( not ( = ?auto_98349 ?auto_98351 ) ) ( not ( = ?auto_98349 ?auto_98352 ) ) ( not ( = ?auto_98350 ?auto_98351 ) ) ( not ( = ?auto_98350 ?auto_98352 ) ) ( not ( = ?auto_98351 ?auto_98352 ) ) ( ON ?auto_98350 ?auto_98351 ) ( ON ?auto_98349 ?auto_98350 ) ( ON ?auto_98348 ?auto_98349 ) ( ON ?auto_98347 ?auto_98348 ) ( ON ?auto_98346 ?auto_98347 ) ( ON ?auto_98345 ?auto_98346 ) ( ON ?auto_98344 ?auto_98345 ) ( CLEAR ?auto_98342 ) ( ON ?auto_98343 ?auto_98344 ) ( CLEAR ?auto_98343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98342 ?auto_98343 )
      ( MAKE-10PILE ?auto_98342 ?auto_98343 ?auto_98344 ?auto_98345 ?auto_98346 ?auto_98347 ?auto_98348 ?auto_98349 ?auto_98350 ?auto_98351 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98363 - BLOCK
      ?auto_98364 - BLOCK
      ?auto_98365 - BLOCK
      ?auto_98366 - BLOCK
      ?auto_98367 - BLOCK
      ?auto_98368 - BLOCK
      ?auto_98369 - BLOCK
      ?auto_98370 - BLOCK
      ?auto_98371 - BLOCK
      ?auto_98372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98372 ) ( ON-TABLE ?auto_98363 ) ( not ( = ?auto_98363 ?auto_98364 ) ) ( not ( = ?auto_98363 ?auto_98365 ) ) ( not ( = ?auto_98363 ?auto_98366 ) ) ( not ( = ?auto_98363 ?auto_98367 ) ) ( not ( = ?auto_98363 ?auto_98368 ) ) ( not ( = ?auto_98363 ?auto_98369 ) ) ( not ( = ?auto_98363 ?auto_98370 ) ) ( not ( = ?auto_98363 ?auto_98371 ) ) ( not ( = ?auto_98363 ?auto_98372 ) ) ( not ( = ?auto_98364 ?auto_98365 ) ) ( not ( = ?auto_98364 ?auto_98366 ) ) ( not ( = ?auto_98364 ?auto_98367 ) ) ( not ( = ?auto_98364 ?auto_98368 ) ) ( not ( = ?auto_98364 ?auto_98369 ) ) ( not ( = ?auto_98364 ?auto_98370 ) ) ( not ( = ?auto_98364 ?auto_98371 ) ) ( not ( = ?auto_98364 ?auto_98372 ) ) ( not ( = ?auto_98365 ?auto_98366 ) ) ( not ( = ?auto_98365 ?auto_98367 ) ) ( not ( = ?auto_98365 ?auto_98368 ) ) ( not ( = ?auto_98365 ?auto_98369 ) ) ( not ( = ?auto_98365 ?auto_98370 ) ) ( not ( = ?auto_98365 ?auto_98371 ) ) ( not ( = ?auto_98365 ?auto_98372 ) ) ( not ( = ?auto_98366 ?auto_98367 ) ) ( not ( = ?auto_98366 ?auto_98368 ) ) ( not ( = ?auto_98366 ?auto_98369 ) ) ( not ( = ?auto_98366 ?auto_98370 ) ) ( not ( = ?auto_98366 ?auto_98371 ) ) ( not ( = ?auto_98366 ?auto_98372 ) ) ( not ( = ?auto_98367 ?auto_98368 ) ) ( not ( = ?auto_98367 ?auto_98369 ) ) ( not ( = ?auto_98367 ?auto_98370 ) ) ( not ( = ?auto_98367 ?auto_98371 ) ) ( not ( = ?auto_98367 ?auto_98372 ) ) ( not ( = ?auto_98368 ?auto_98369 ) ) ( not ( = ?auto_98368 ?auto_98370 ) ) ( not ( = ?auto_98368 ?auto_98371 ) ) ( not ( = ?auto_98368 ?auto_98372 ) ) ( not ( = ?auto_98369 ?auto_98370 ) ) ( not ( = ?auto_98369 ?auto_98371 ) ) ( not ( = ?auto_98369 ?auto_98372 ) ) ( not ( = ?auto_98370 ?auto_98371 ) ) ( not ( = ?auto_98370 ?auto_98372 ) ) ( not ( = ?auto_98371 ?auto_98372 ) ) ( ON ?auto_98371 ?auto_98372 ) ( ON ?auto_98370 ?auto_98371 ) ( ON ?auto_98369 ?auto_98370 ) ( ON ?auto_98368 ?auto_98369 ) ( ON ?auto_98367 ?auto_98368 ) ( ON ?auto_98366 ?auto_98367 ) ( ON ?auto_98365 ?auto_98366 ) ( CLEAR ?auto_98363 ) ( ON ?auto_98364 ?auto_98365 ) ( CLEAR ?auto_98364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98363 ?auto_98364 )
      ( MAKE-10PILE ?auto_98363 ?auto_98364 ?auto_98365 ?auto_98366 ?auto_98367 ?auto_98368 ?auto_98369 ?auto_98370 ?auto_98371 ?auto_98372 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98383 - BLOCK
      ?auto_98384 - BLOCK
      ?auto_98385 - BLOCK
      ?auto_98386 - BLOCK
      ?auto_98387 - BLOCK
      ?auto_98388 - BLOCK
      ?auto_98389 - BLOCK
      ?auto_98390 - BLOCK
      ?auto_98391 - BLOCK
      ?auto_98392 - BLOCK
    )
    :vars
    (
      ?auto_98393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98392 ?auto_98393 ) ( not ( = ?auto_98383 ?auto_98384 ) ) ( not ( = ?auto_98383 ?auto_98385 ) ) ( not ( = ?auto_98383 ?auto_98386 ) ) ( not ( = ?auto_98383 ?auto_98387 ) ) ( not ( = ?auto_98383 ?auto_98388 ) ) ( not ( = ?auto_98383 ?auto_98389 ) ) ( not ( = ?auto_98383 ?auto_98390 ) ) ( not ( = ?auto_98383 ?auto_98391 ) ) ( not ( = ?auto_98383 ?auto_98392 ) ) ( not ( = ?auto_98383 ?auto_98393 ) ) ( not ( = ?auto_98384 ?auto_98385 ) ) ( not ( = ?auto_98384 ?auto_98386 ) ) ( not ( = ?auto_98384 ?auto_98387 ) ) ( not ( = ?auto_98384 ?auto_98388 ) ) ( not ( = ?auto_98384 ?auto_98389 ) ) ( not ( = ?auto_98384 ?auto_98390 ) ) ( not ( = ?auto_98384 ?auto_98391 ) ) ( not ( = ?auto_98384 ?auto_98392 ) ) ( not ( = ?auto_98384 ?auto_98393 ) ) ( not ( = ?auto_98385 ?auto_98386 ) ) ( not ( = ?auto_98385 ?auto_98387 ) ) ( not ( = ?auto_98385 ?auto_98388 ) ) ( not ( = ?auto_98385 ?auto_98389 ) ) ( not ( = ?auto_98385 ?auto_98390 ) ) ( not ( = ?auto_98385 ?auto_98391 ) ) ( not ( = ?auto_98385 ?auto_98392 ) ) ( not ( = ?auto_98385 ?auto_98393 ) ) ( not ( = ?auto_98386 ?auto_98387 ) ) ( not ( = ?auto_98386 ?auto_98388 ) ) ( not ( = ?auto_98386 ?auto_98389 ) ) ( not ( = ?auto_98386 ?auto_98390 ) ) ( not ( = ?auto_98386 ?auto_98391 ) ) ( not ( = ?auto_98386 ?auto_98392 ) ) ( not ( = ?auto_98386 ?auto_98393 ) ) ( not ( = ?auto_98387 ?auto_98388 ) ) ( not ( = ?auto_98387 ?auto_98389 ) ) ( not ( = ?auto_98387 ?auto_98390 ) ) ( not ( = ?auto_98387 ?auto_98391 ) ) ( not ( = ?auto_98387 ?auto_98392 ) ) ( not ( = ?auto_98387 ?auto_98393 ) ) ( not ( = ?auto_98388 ?auto_98389 ) ) ( not ( = ?auto_98388 ?auto_98390 ) ) ( not ( = ?auto_98388 ?auto_98391 ) ) ( not ( = ?auto_98388 ?auto_98392 ) ) ( not ( = ?auto_98388 ?auto_98393 ) ) ( not ( = ?auto_98389 ?auto_98390 ) ) ( not ( = ?auto_98389 ?auto_98391 ) ) ( not ( = ?auto_98389 ?auto_98392 ) ) ( not ( = ?auto_98389 ?auto_98393 ) ) ( not ( = ?auto_98390 ?auto_98391 ) ) ( not ( = ?auto_98390 ?auto_98392 ) ) ( not ( = ?auto_98390 ?auto_98393 ) ) ( not ( = ?auto_98391 ?auto_98392 ) ) ( not ( = ?auto_98391 ?auto_98393 ) ) ( not ( = ?auto_98392 ?auto_98393 ) ) ( ON ?auto_98391 ?auto_98392 ) ( ON ?auto_98390 ?auto_98391 ) ( ON ?auto_98389 ?auto_98390 ) ( ON ?auto_98388 ?auto_98389 ) ( ON ?auto_98387 ?auto_98388 ) ( ON ?auto_98386 ?auto_98387 ) ( ON ?auto_98385 ?auto_98386 ) ( ON ?auto_98384 ?auto_98385 ) ( ON ?auto_98383 ?auto_98384 ) ( CLEAR ?auto_98383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98383 )
      ( MAKE-10PILE ?auto_98383 ?auto_98384 ?auto_98385 ?auto_98386 ?auto_98387 ?auto_98388 ?auto_98389 ?auto_98390 ?auto_98391 ?auto_98392 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98404 - BLOCK
      ?auto_98405 - BLOCK
      ?auto_98406 - BLOCK
      ?auto_98407 - BLOCK
      ?auto_98408 - BLOCK
      ?auto_98409 - BLOCK
      ?auto_98410 - BLOCK
      ?auto_98411 - BLOCK
      ?auto_98412 - BLOCK
      ?auto_98413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98413 ) ( not ( = ?auto_98404 ?auto_98405 ) ) ( not ( = ?auto_98404 ?auto_98406 ) ) ( not ( = ?auto_98404 ?auto_98407 ) ) ( not ( = ?auto_98404 ?auto_98408 ) ) ( not ( = ?auto_98404 ?auto_98409 ) ) ( not ( = ?auto_98404 ?auto_98410 ) ) ( not ( = ?auto_98404 ?auto_98411 ) ) ( not ( = ?auto_98404 ?auto_98412 ) ) ( not ( = ?auto_98404 ?auto_98413 ) ) ( not ( = ?auto_98405 ?auto_98406 ) ) ( not ( = ?auto_98405 ?auto_98407 ) ) ( not ( = ?auto_98405 ?auto_98408 ) ) ( not ( = ?auto_98405 ?auto_98409 ) ) ( not ( = ?auto_98405 ?auto_98410 ) ) ( not ( = ?auto_98405 ?auto_98411 ) ) ( not ( = ?auto_98405 ?auto_98412 ) ) ( not ( = ?auto_98405 ?auto_98413 ) ) ( not ( = ?auto_98406 ?auto_98407 ) ) ( not ( = ?auto_98406 ?auto_98408 ) ) ( not ( = ?auto_98406 ?auto_98409 ) ) ( not ( = ?auto_98406 ?auto_98410 ) ) ( not ( = ?auto_98406 ?auto_98411 ) ) ( not ( = ?auto_98406 ?auto_98412 ) ) ( not ( = ?auto_98406 ?auto_98413 ) ) ( not ( = ?auto_98407 ?auto_98408 ) ) ( not ( = ?auto_98407 ?auto_98409 ) ) ( not ( = ?auto_98407 ?auto_98410 ) ) ( not ( = ?auto_98407 ?auto_98411 ) ) ( not ( = ?auto_98407 ?auto_98412 ) ) ( not ( = ?auto_98407 ?auto_98413 ) ) ( not ( = ?auto_98408 ?auto_98409 ) ) ( not ( = ?auto_98408 ?auto_98410 ) ) ( not ( = ?auto_98408 ?auto_98411 ) ) ( not ( = ?auto_98408 ?auto_98412 ) ) ( not ( = ?auto_98408 ?auto_98413 ) ) ( not ( = ?auto_98409 ?auto_98410 ) ) ( not ( = ?auto_98409 ?auto_98411 ) ) ( not ( = ?auto_98409 ?auto_98412 ) ) ( not ( = ?auto_98409 ?auto_98413 ) ) ( not ( = ?auto_98410 ?auto_98411 ) ) ( not ( = ?auto_98410 ?auto_98412 ) ) ( not ( = ?auto_98410 ?auto_98413 ) ) ( not ( = ?auto_98411 ?auto_98412 ) ) ( not ( = ?auto_98411 ?auto_98413 ) ) ( not ( = ?auto_98412 ?auto_98413 ) ) ( ON ?auto_98412 ?auto_98413 ) ( ON ?auto_98411 ?auto_98412 ) ( ON ?auto_98410 ?auto_98411 ) ( ON ?auto_98409 ?auto_98410 ) ( ON ?auto_98408 ?auto_98409 ) ( ON ?auto_98407 ?auto_98408 ) ( ON ?auto_98406 ?auto_98407 ) ( ON ?auto_98405 ?auto_98406 ) ( ON ?auto_98404 ?auto_98405 ) ( CLEAR ?auto_98404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98404 )
      ( MAKE-10PILE ?auto_98404 ?auto_98405 ?auto_98406 ?auto_98407 ?auto_98408 ?auto_98409 ?auto_98410 ?auto_98411 ?auto_98412 ?auto_98413 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_98424 - BLOCK
      ?auto_98425 - BLOCK
      ?auto_98426 - BLOCK
      ?auto_98427 - BLOCK
      ?auto_98428 - BLOCK
      ?auto_98429 - BLOCK
      ?auto_98430 - BLOCK
      ?auto_98431 - BLOCK
      ?auto_98432 - BLOCK
      ?auto_98433 - BLOCK
    )
    :vars
    (
      ?auto_98434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98424 ?auto_98425 ) ) ( not ( = ?auto_98424 ?auto_98426 ) ) ( not ( = ?auto_98424 ?auto_98427 ) ) ( not ( = ?auto_98424 ?auto_98428 ) ) ( not ( = ?auto_98424 ?auto_98429 ) ) ( not ( = ?auto_98424 ?auto_98430 ) ) ( not ( = ?auto_98424 ?auto_98431 ) ) ( not ( = ?auto_98424 ?auto_98432 ) ) ( not ( = ?auto_98424 ?auto_98433 ) ) ( not ( = ?auto_98425 ?auto_98426 ) ) ( not ( = ?auto_98425 ?auto_98427 ) ) ( not ( = ?auto_98425 ?auto_98428 ) ) ( not ( = ?auto_98425 ?auto_98429 ) ) ( not ( = ?auto_98425 ?auto_98430 ) ) ( not ( = ?auto_98425 ?auto_98431 ) ) ( not ( = ?auto_98425 ?auto_98432 ) ) ( not ( = ?auto_98425 ?auto_98433 ) ) ( not ( = ?auto_98426 ?auto_98427 ) ) ( not ( = ?auto_98426 ?auto_98428 ) ) ( not ( = ?auto_98426 ?auto_98429 ) ) ( not ( = ?auto_98426 ?auto_98430 ) ) ( not ( = ?auto_98426 ?auto_98431 ) ) ( not ( = ?auto_98426 ?auto_98432 ) ) ( not ( = ?auto_98426 ?auto_98433 ) ) ( not ( = ?auto_98427 ?auto_98428 ) ) ( not ( = ?auto_98427 ?auto_98429 ) ) ( not ( = ?auto_98427 ?auto_98430 ) ) ( not ( = ?auto_98427 ?auto_98431 ) ) ( not ( = ?auto_98427 ?auto_98432 ) ) ( not ( = ?auto_98427 ?auto_98433 ) ) ( not ( = ?auto_98428 ?auto_98429 ) ) ( not ( = ?auto_98428 ?auto_98430 ) ) ( not ( = ?auto_98428 ?auto_98431 ) ) ( not ( = ?auto_98428 ?auto_98432 ) ) ( not ( = ?auto_98428 ?auto_98433 ) ) ( not ( = ?auto_98429 ?auto_98430 ) ) ( not ( = ?auto_98429 ?auto_98431 ) ) ( not ( = ?auto_98429 ?auto_98432 ) ) ( not ( = ?auto_98429 ?auto_98433 ) ) ( not ( = ?auto_98430 ?auto_98431 ) ) ( not ( = ?auto_98430 ?auto_98432 ) ) ( not ( = ?auto_98430 ?auto_98433 ) ) ( not ( = ?auto_98431 ?auto_98432 ) ) ( not ( = ?auto_98431 ?auto_98433 ) ) ( not ( = ?auto_98432 ?auto_98433 ) ) ( ON ?auto_98424 ?auto_98434 ) ( not ( = ?auto_98433 ?auto_98434 ) ) ( not ( = ?auto_98432 ?auto_98434 ) ) ( not ( = ?auto_98431 ?auto_98434 ) ) ( not ( = ?auto_98430 ?auto_98434 ) ) ( not ( = ?auto_98429 ?auto_98434 ) ) ( not ( = ?auto_98428 ?auto_98434 ) ) ( not ( = ?auto_98427 ?auto_98434 ) ) ( not ( = ?auto_98426 ?auto_98434 ) ) ( not ( = ?auto_98425 ?auto_98434 ) ) ( not ( = ?auto_98424 ?auto_98434 ) ) ( ON ?auto_98425 ?auto_98424 ) ( ON ?auto_98426 ?auto_98425 ) ( ON ?auto_98427 ?auto_98426 ) ( ON ?auto_98428 ?auto_98427 ) ( ON ?auto_98429 ?auto_98428 ) ( ON ?auto_98430 ?auto_98429 ) ( ON ?auto_98431 ?auto_98430 ) ( ON ?auto_98432 ?auto_98431 ) ( ON ?auto_98433 ?auto_98432 ) ( CLEAR ?auto_98433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_98433 ?auto_98432 ?auto_98431 ?auto_98430 ?auto_98429 ?auto_98428 ?auto_98427 ?auto_98426 ?auto_98425 ?auto_98424 )
      ( MAKE-10PILE ?auto_98424 ?auto_98425 ?auto_98426 ?auto_98427 ?auto_98428 ?auto_98429 ?auto_98430 ?auto_98431 ?auto_98432 ?auto_98433 ) )
  )

)

