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
      ?auto_694897 - BLOCK
    )
    :vars
    (
      ?auto_694898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694897 ?auto_694898 ) ( CLEAR ?auto_694897 ) ( HAND-EMPTY ) ( not ( = ?auto_694897 ?auto_694898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_694897 ?auto_694898 )
      ( !PUTDOWN ?auto_694897 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_694904 - BLOCK
      ?auto_694905 - BLOCK
    )
    :vars
    (
      ?auto_694906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_694904 ) ( ON ?auto_694905 ?auto_694906 ) ( CLEAR ?auto_694905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_694904 ) ( not ( = ?auto_694904 ?auto_694905 ) ) ( not ( = ?auto_694904 ?auto_694906 ) ) ( not ( = ?auto_694905 ?auto_694906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_694905 ?auto_694906 )
      ( !STACK ?auto_694905 ?auto_694904 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_694914 - BLOCK
      ?auto_694915 - BLOCK
    )
    :vars
    (
      ?auto_694916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694915 ?auto_694916 ) ( not ( = ?auto_694914 ?auto_694915 ) ) ( not ( = ?auto_694914 ?auto_694916 ) ) ( not ( = ?auto_694915 ?auto_694916 ) ) ( ON ?auto_694914 ?auto_694915 ) ( CLEAR ?auto_694914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_694914 )
      ( MAKE-2PILE ?auto_694914 ?auto_694915 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_694925 - BLOCK
      ?auto_694926 - BLOCK
      ?auto_694927 - BLOCK
    )
    :vars
    (
      ?auto_694928 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_694926 ) ( ON ?auto_694927 ?auto_694928 ) ( CLEAR ?auto_694927 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_694925 ) ( ON ?auto_694926 ?auto_694925 ) ( not ( = ?auto_694925 ?auto_694926 ) ) ( not ( = ?auto_694925 ?auto_694927 ) ) ( not ( = ?auto_694925 ?auto_694928 ) ) ( not ( = ?auto_694926 ?auto_694927 ) ) ( not ( = ?auto_694926 ?auto_694928 ) ) ( not ( = ?auto_694927 ?auto_694928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_694927 ?auto_694928 )
      ( !STACK ?auto_694927 ?auto_694926 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_694939 - BLOCK
      ?auto_694940 - BLOCK
      ?auto_694941 - BLOCK
    )
    :vars
    (
      ?auto_694942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694941 ?auto_694942 ) ( ON-TABLE ?auto_694939 ) ( not ( = ?auto_694939 ?auto_694940 ) ) ( not ( = ?auto_694939 ?auto_694941 ) ) ( not ( = ?auto_694939 ?auto_694942 ) ) ( not ( = ?auto_694940 ?auto_694941 ) ) ( not ( = ?auto_694940 ?auto_694942 ) ) ( not ( = ?auto_694941 ?auto_694942 ) ) ( CLEAR ?auto_694939 ) ( ON ?auto_694940 ?auto_694941 ) ( CLEAR ?auto_694940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_694939 ?auto_694940 )
      ( MAKE-3PILE ?auto_694939 ?auto_694940 ?auto_694941 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_694953 - BLOCK
      ?auto_694954 - BLOCK
      ?auto_694955 - BLOCK
    )
    :vars
    (
      ?auto_694956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694955 ?auto_694956 ) ( not ( = ?auto_694953 ?auto_694954 ) ) ( not ( = ?auto_694953 ?auto_694955 ) ) ( not ( = ?auto_694953 ?auto_694956 ) ) ( not ( = ?auto_694954 ?auto_694955 ) ) ( not ( = ?auto_694954 ?auto_694956 ) ) ( not ( = ?auto_694955 ?auto_694956 ) ) ( ON ?auto_694954 ?auto_694955 ) ( ON ?auto_694953 ?auto_694954 ) ( CLEAR ?auto_694953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_694953 )
      ( MAKE-3PILE ?auto_694953 ?auto_694954 ?auto_694955 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_694968 - BLOCK
      ?auto_694969 - BLOCK
      ?auto_694970 - BLOCK
      ?auto_694971 - BLOCK
    )
    :vars
    (
      ?auto_694972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_694970 ) ( ON ?auto_694971 ?auto_694972 ) ( CLEAR ?auto_694971 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_694968 ) ( ON ?auto_694969 ?auto_694968 ) ( ON ?auto_694970 ?auto_694969 ) ( not ( = ?auto_694968 ?auto_694969 ) ) ( not ( = ?auto_694968 ?auto_694970 ) ) ( not ( = ?auto_694968 ?auto_694971 ) ) ( not ( = ?auto_694968 ?auto_694972 ) ) ( not ( = ?auto_694969 ?auto_694970 ) ) ( not ( = ?auto_694969 ?auto_694971 ) ) ( not ( = ?auto_694969 ?auto_694972 ) ) ( not ( = ?auto_694970 ?auto_694971 ) ) ( not ( = ?auto_694970 ?auto_694972 ) ) ( not ( = ?auto_694971 ?auto_694972 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_694971 ?auto_694972 )
      ( !STACK ?auto_694971 ?auto_694970 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_694986 - BLOCK
      ?auto_694987 - BLOCK
      ?auto_694988 - BLOCK
      ?auto_694989 - BLOCK
    )
    :vars
    (
      ?auto_694990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694989 ?auto_694990 ) ( ON-TABLE ?auto_694986 ) ( ON ?auto_694987 ?auto_694986 ) ( not ( = ?auto_694986 ?auto_694987 ) ) ( not ( = ?auto_694986 ?auto_694988 ) ) ( not ( = ?auto_694986 ?auto_694989 ) ) ( not ( = ?auto_694986 ?auto_694990 ) ) ( not ( = ?auto_694987 ?auto_694988 ) ) ( not ( = ?auto_694987 ?auto_694989 ) ) ( not ( = ?auto_694987 ?auto_694990 ) ) ( not ( = ?auto_694988 ?auto_694989 ) ) ( not ( = ?auto_694988 ?auto_694990 ) ) ( not ( = ?auto_694989 ?auto_694990 ) ) ( CLEAR ?auto_694987 ) ( ON ?auto_694988 ?auto_694989 ) ( CLEAR ?auto_694988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_694986 ?auto_694987 ?auto_694988 )
      ( MAKE-4PILE ?auto_694986 ?auto_694987 ?auto_694988 ?auto_694989 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_695004 - BLOCK
      ?auto_695005 - BLOCK
      ?auto_695006 - BLOCK
      ?auto_695007 - BLOCK
    )
    :vars
    (
      ?auto_695008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695007 ?auto_695008 ) ( ON-TABLE ?auto_695004 ) ( not ( = ?auto_695004 ?auto_695005 ) ) ( not ( = ?auto_695004 ?auto_695006 ) ) ( not ( = ?auto_695004 ?auto_695007 ) ) ( not ( = ?auto_695004 ?auto_695008 ) ) ( not ( = ?auto_695005 ?auto_695006 ) ) ( not ( = ?auto_695005 ?auto_695007 ) ) ( not ( = ?auto_695005 ?auto_695008 ) ) ( not ( = ?auto_695006 ?auto_695007 ) ) ( not ( = ?auto_695006 ?auto_695008 ) ) ( not ( = ?auto_695007 ?auto_695008 ) ) ( ON ?auto_695006 ?auto_695007 ) ( CLEAR ?auto_695004 ) ( ON ?auto_695005 ?auto_695006 ) ( CLEAR ?auto_695005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_695004 ?auto_695005 )
      ( MAKE-4PILE ?auto_695004 ?auto_695005 ?auto_695006 ?auto_695007 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_695022 - BLOCK
      ?auto_695023 - BLOCK
      ?auto_695024 - BLOCK
      ?auto_695025 - BLOCK
    )
    :vars
    (
      ?auto_695026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695025 ?auto_695026 ) ( not ( = ?auto_695022 ?auto_695023 ) ) ( not ( = ?auto_695022 ?auto_695024 ) ) ( not ( = ?auto_695022 ?auto_695025 ) ) ( not ( = ?auto_695022 ?auto_695026 ) ) ( not ( = ?auto_695023 ?auto_695024 ) ) ( not ( = ?auto_695023 ?auto_695025 ) ) ( not ( = ?auto_695023 ?auto_695026 ) ) ( not ( = ?auto_695024 ?auto_695025 ) ) ( not ( = ?auto_695024 ?auto_695026 ) ) ( not ( = ?auto_695025 ?auto_695026 ) ) ( ON ?auto_695024 ?auto_695025 ) ( ON ?auto_695023 ?auto_695024 ) ( ON ?auto_695022 ?auto_695023 ) ( CLEAR ?auto_695022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_695022 )
      ( MAKE-4PILE ?auto_695022 ?auto_695023 ?auto_695024 ?auto_695025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_695041 - BLOCK
      ?auto_695042 - BLOCK
      ?auto_695043 - BLOCK
      ?auto_695044 - BLOCK
      ?auto_695045 - BLOCK
    )
    :vars
    (
      ?auto_695046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_695044 ) ( ON ?auto_695045 ?auto_695046 ) ( CLEAR ?auto_695045 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_695041 ) ( ON ?auto_695042 ?auto_695041 ) ( ON ?auto_695043 ?auto_695042 ) ( ON ?auto_695044 ?auto_695043 ) ( not ( = ?auto_695041 ?auto_695042 ) ) ( not ( = ?auto_695041 ?auto_695043 ) ) ( not ( = ?auto_695041 ?auto_695044 ) ) ( not ( = ?auto_695041 ?auto_695045 ) ) ( not ( = ?auto_695041 ?auto_695046 ) ) ( not ( = ?auto_695042 ?auto_695043 ) ) ( not ( = ?auto_695042 ?auto_695044 ) ) ( not ( = ?auto_695042 ?auto_695045 ) ) ( not ( = ?auto_695042 ?auto_695046 ) ) ( not ( = ?auto_695043 ?auto_695044 ) ) ( not ( = ?auto_695043 ?auto_695045 ) ) ( not ( = ?auto_695043 ?auto_695046 ) ) ( not ( = ?auto_695044 ?auto_695045 ) ) ( not ( = ?auto_695044 ?auto_695046 ) ) ( not ( = ?auto_695045 ?auto_695046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_695045 ?auto_695046 )
      ( !STACK ?auto_695045 ?auto_695044 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_695063 - BLOCK
      ?auto_695064 - BLOCK
      ?auto_695065 - BLOCK
      ?auto_695066 - BLOCK
      ?auto_695067 - BLOCK
    )
    :vars
    (
      ?auto_695068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695067 ?auto_695068 ) ( ON-TABLE ?auto_695063 ) ( ON ?auto_695064 ?auto_695063 ) ( ON ?auto_695065 ?auto_695064 ) ( not ( = ?auto_695063 ?auto_695064 ) ) ( not ( = ?auto_695063 ?auto_695065 ) ) ( not ( = ?auto_695063 ?auto_695066 ) ) ( not ( = ?auto_695063 ?auto_695067 ) ) ( not ( = ?auto_695063 ?auto_695068 ) ) ( not ( = ?auto_695064 ?auto_695065 ) ) ( not ( = ?auto_695064 ?auto_695066 ) ) ( not ( = ?auto_695064 ?auto_695067 ) ) ( not ( = ?auto_695064 ?auto_695068 ) ) ( not ( = ?auto_695065 ?auto_695066 ) ) ( not ( = ?auto_695065 ?auto_695067 ) ) ( not ( = ?auto_695065 ?auto_695068 ) ) ( not ( = ?auto_695066 ?auto_695067 ) ) ( not ( = ?auto_695066 ?auto_695068 ) ) ( not ( = ?auto_695067 ?auto_695068 ) ) ( CLEAR ?auto_695065 ) ( ON ?auto_695066 ?auto_695067 ) ( CLEAR ?auto_695066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_695063 ?auto_695064 ?auto_695065 ?auto_695066 )
      ( MAKE-5PILE ?auto_695063 ?auto_695064 ?auto_695065 ?auto_695066 ?auto_695067 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_695085 - BLOCK
      ?auto_695086 - BLOCK
      ?auto_695087 - BLOCK
      ?auto_695088 - BLOCK
      ?auto_695089 - BLOCK
    )
    :vars
    (
      ?auto_695090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695089 ?auto_695090 ) ( ON-TABLE ?auto_695085 ) ( ON ?auto_695086 ?auto_695085 ) ( not ( = ?auto_695085 ?auto_695086 ) ) ( not ( = ?auto_695085 ?auto_695087 ) ) ( not ( = ?auto_695085 ?auto_695088 ) ) ( not ( = ?auto_695085 ?auto_695089 ) ) ( not ( = ?auto_695085 ?auto_695090 ) ) ( not ( = ?auto_695086 ?auto_695087 ) ) ( not ( = ?auto_695086 ?auto_695088 ) ) ( not ( = ?auto_695086 ?auto_695089 ) ) ( not ( = ?auto_695086 ?auto_695090 ) ) ( not ( = ?auto_695087 ?auto_695088 ) ) ( not ( = ?auto_695087 ?auto_695089 ) ) ( not ( = ?auto_695087 ?auto_695090 ) ) ( not ( = ?auto_695088 ?auto_695089 ) ) ( not ( = ?auto_695088 ?auto_695090 ) ) ( not ( = ?auto_695089 ?auto_695090 ) ) ( ON ?auto_695088 ?auto_695089 ) ( CLEAR ?auto_695086 ) ( ON ?auto_695087 ?auto_695088 ) ( CLEAR ?auto_695087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_695085 ?auto_695086 ?auto_695087 )
      ( MAKE-5PILE ?auto_695085 ?auto_695086 ?auto_695087 ?auto_695088 ?auto_695089 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_695107 - BLOCK
      ?auto_695108 - BLOCK
      ?auto_695109 - BLOCK
      ?auto_695110 - BLOCK
      ?auto_695111 - BLOCK
    )
    :vars
    (
      ?auto_695112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695111 ?auto_695112 ) ( ON-TABLE ?auto_695107 ) ( not ( = ?auto_695107 ?auto_695108 ) ) ( not ( = ?auto_695107 ?auto_695109 ) ) ( not ( = ?auto_695107 ?auto_695110 ) ) ( not ( = ?auto_695107 ?auto_695111 ) ) ( not ( = ?auto_695107 ?auto_695112 ) ) ( not ( = ?auto_695108 ?auto_695109 ) ) ( not ( = ?auto_695108 ?auto_695110 ) ) ( not ( = ?auto_695108 ?auto_695111 ) ) ( not ( = ?auto_695108 ?auto_695112 ) ) ( not ( = ?auto_695109 ?auto_695110 ) ) ( not ( = ?auto_695109 ?auto_695111 ) ) ( not ( = ?auto_695109 ?auto_695112 ) ) ( not ( = ?auto_695110 ?auto_695111 ) ) ( not ( = ?auto_695110 ?auto_695112 ) ) ( not ( = ?auto_695111 ?auto_695112 ) ) ( ON ?auto_695110 ?auto_695111 ) ( ON ?auto_695109 ?auto_695110 ) ( CLEAR ?auto_695107 ) ( ON ?auto_695108 ?auto_695109 ) ( CLEAR ?auto_695108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_695107 ?auto_695108 )
      ( MAKE-5PILE ?auto_695107 ?auto_695108 ?auto_695109 ?auto_695110 ?auto_695111 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_695129 - BLOCK
      ?auto_695130 - BLOCK
      ?auto_695131 - BLOCK
      ?auto_695132 - BLOCK
      ?auto_695133 - BLOCK
    )
    :vars
    (
      ?auto_695134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695133 ?auto_695134 ) ( not ( = ?auto_695129 ?auto_695130 ) ) ( not ( = ?auto_695129 ?auto_695131 ) ) ( not ( = ?auto_695129 ?auto_695132 ) ) ( not ( = ?auto_695129 ?auto_695133 ) ) ( not ( = ?auto_695129 ?auto_695134 ) ) ( not ( = ?auto_695130 ?auto_695131 ) ) ( not ( = ?auto_695130 ?auto_695132 ) ) ( not ( = ?auto_695130 ?auto_695133 ) ) ( not ( = ?auto_695130 ?auto_695134 ) ) ( not ( = ?auto_695131 ?auto_695132 ) ) ( not ( = ?auto_695131 ?auto_695133 ) ) ( not ( = ?auto_695131 ?auto_695134 ) ) ( not ( = ?auto_695132 ?auto_695133 ) ) ( not ( = ?auto_695132 ?auto_695134 ) ) ( not ( = ?auto_695133 ?auto_695134 ) ) ( ON ?auto_695132 ?auto_695133 ) ( ON ?auto_695131 ?auto_695132 ) ( ON ?auto_695130 ?auto_695131 ) ( ON ?auto_695129 ?auto_695130 ) ( CLEAR ?auto_695129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_695129 )
      ( MAKE-5PILE ?auto_695129 ?auto_695130 ?auto_695131 ?auto_695132 ?auto_695133 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_695152 - BLOCK
      ?auto_695153 - BLOCK
      ?auto_695154 - BLOCK
      ?auto_695155 - BLOCK
      ?auto_695156 - BLOCK
      ?auto_695157 - BLOCK
    )
    :vars
    (
      ?auto_695158 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_695156 ) ( ON ?auto_695157 ?auto_695158 ) ( CLEAR ?auto_695157 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_695152 ) ( ON ?auto_695153 ?auto_695152 ) ( ON ?auto_695154 ?auto_695153 ) ( ON ?auto_695155 ?auto_695154 ) ( ON ?auto_695156 ?auto_695155 ) ( not ( = ?auto_695152 ?auto_695153 ) ) ( not ( = ?auto_695152 ?auto_695154 ) ) ( not ( = ?auto_695152 ?auto_695155 ) ) ( not ( = ?auto_695152 ?auto_695156 ) ) ( not ( = ?auto_695152 ?auto_695157 ) ) ( not ( = ?auto_695152 ?auto_695158 ) ) ( not ( = ?auto_695153 ?auto_695154 ) ) ( not ( = ?auto_695153 ?auto_695155 ) ) ( not ( = ?auto_695153 ?auto_695156 ) ) ( not ( = ?auto_695153 ?auto_695157 ) ) ( not ( = ?auto_695153 ?auto_695158 ) ) ( not ( = ?auto_695154 ?auto_695155 ) ) ( not ( = ?auto_695154 ?auto_695156 ) ) ( not ( = ?auto_695154 ?auto_695157 ) ) ( not ( = ?auto_695154 ?auto_695158 ) ) ( not ( = ?auto_695155 ?auto_695156 ) ) ( not ( = ?auto_695155 ?auto_695157 ) ) ( not ( = ?auto_695155 ?auto_695158 ) ) ( not ( = ?auto_695156 ?auto_695157 ) ) ( not ( = ?auto_695156 ?auto_695158 ) ) ( not ( = ?auto_695157 ?auto_695158 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_695157 ?auto_695158 )
      ( !STACK ?auto_695157 ?auto_695156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_695178 - BLOCK
      ?auto_695179 - BLOCK
      ?auto_695180 - BLOCK
      ?auto_695181 - BLOCK
      ?auto_695182 - BLOCK
      ?auto_695183 - BLOCK
    )
    :vars
    (
      ?auto_695184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695183 ?auto_695184 ) ( ON-TABLE ?auto_695178 ) ( ON ?auto_695179 ?auto_695178 ) ( ON ?auto_695180 ?auto_695179 ) ( ON ?auto_695181 ?auto_695180 ) ( not ( = ?auto_695178 ?auto_695179 ) ) ( not ( = ?auto_695178 ?auto_695180 ) ) ( not ( = ?auto_695178 ?auto_695181 ) ) ( not ( = ?auto_695178 ?auto_695182 ) ) ( not ( = ?auto_695178 ?auto_695183 ) ) ( not ( = ?auto_695178 ?auto_695184 ) ) ( not ( = ?auto_695179 ?auto_695180 ) ) ( not ( = ?auto_695179 ?auto_695181 ) ) ( not ( = ?auto_695179 ?auto_695182 ) ) ( not ( = ?auto_695179 ?auto_695183 ) ) ( not ( = ?auto_695179 ?auto_695184 ) ) ( not ( = ?auto_695180 ?auto_695181 ) ) ( not ( = ?auto_695180 ?auto_695182 ) ) ( not ( = ?auto_695180 ?auto_695183 ) ) ( not ( = ?auto_695180 ?auto_695184 ) ) ( not ( = ?auto_695181 ?auto_695182 ) ) ( not ( = ?auto_695181 ?auto_695183 ) ) ( not ( = ?auto_695181 ?auto_695184 ) ) ( not ( = ?auto_695182 ?auto_695183 ) ) ( not ( = ?auto_695182 ?auto_695184 ) ) ( not ( = ?auto_695183 ?auto_695184 ) ) ( CLEAR ?auto_695181 ) ( ON ?auto_695182 ?auto_695183 ) ( CLEAR ?auto_695182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_695178 ?auto_695179 ?auto_695180 ?auto_695181 ?auto_695182 )
      ( MAKE-6PILE ?auto_695178 ?auto_695179 ?auto_695180 ?auto_695181 ?auto_695182 ?auto_695183 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_695204 - BLOCK
      ?auto_695205 - BLOCK
      ?auto_695206 - BLOCK
      ?auto_695207 - BLOCK
      ?auto_695208 - BLOCK
      ?auto_695209 - BLOCK
    )
    :vars
    (
      ?auto_695210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695209 ?auto_695210 ) ( ON-TABLE ?auto_695204 ) ( ON ?auto_695205 ?auto_695204 ) ( ON ?auto_695206 ?auto_695205 ) ( not ( = ?auto_695204 ?auto_695205 ) ) ( not ( = ?auto_695204 ?auto_695206 ) ) ( not ( = ?auto_695204 ?auto_695207 ) ) ( not ( = ?auto_695204 ?auto_695208 ) ) ( not ( = ?auto_695204 ?auto_695209 ) ) ( not ( = ?auto_695204 ?auto_695210 ) ) ( not ( = ?auto_695205 ?auto_695206 ) ) ( not ( = ?auto_695205 ?auto_695207 ) ) ( not ( = ?auto_695205 ?auto_695208 ) ) ( not ( = ?auto_695205 ?auto_695209 ) ) ( not ( = ?auto_695205 ?auto_695210 ) ) ( not ( = ?auto_695206 ?auto_695207 ) ) ( not ( = ?auto_695206 ?auto_695208 ) ) ( not ( = ?auto_695206 ?auto_695209 ) ) ( not ( = ?auto_695206 ?auto_695210 ) ) ( not ( = ?auto_695207 ?auto_695208 ) ) ( not ( = ?auto_695207 ?auto_695209 ) ) ( not ( = ?auto_695207 ?auto_695210 ) ) ( not ( = ?auto_695208 ?auto_695209 ) ) ( not ( = ?auto_695208 ?auto_695210 ) ) ( not ( = ?auto_695209 ?auto_695210 ) ) ( ON ?auto_695208 ?auto_695209 ) ( CLEAR ?auto_695206 ) ( ON ?auto_695207 ?auto_695208 ) ( CLEAR ?auto_695207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_695204 ?auto_695205 ?auto_695206 ?auto_695207 )
      ( MAKE-6PILE ?auto_695204 ?auto_695205 ?auto_695206 ?auto_695207 ?auto_695208 ?auto_695209 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_695230 - BLOCK
      ?auto_695231 - BLOCK
      ?auto_695232 - BLOCK
      ?auto_695233 - BLOCK
      ?auto_695234 - BLOCK
      ?auto_695235 - BLOCK
    )
    :vars
    (
      ?auto_695236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695235 ?auto_695236 ) ( ON-TABLE ?auto_695230 ) ( ON ?auto_695231 ?auto_695230 ) ( not ( = ?auto_695230 ?auto_695231 ) ) ( not ( = ?auto_695230 ?auto_695232 ) ) ( not ( = ?auto_695230 ?auto_695233 ) ) ( not ( = ?auto_695230 ?auto_695234 ) ) ( not ( = ?auto_695230 ?auto_695235 ) ) ( not ( = ?auto_695230 ?auto_695236 ) ) ( not ( = ?auto_695231 ?auto_695232 ) ) ( not ( = ?auto_695231 ?auto_695233 ) ) ( not ( = ?auto_695231 ?auto_695234 ) ) ( not ( = ?auto_695231 ?auto_695235 ) ) ( not ( = ?auto_695231 ?auto_695236 ) ) ( not ( = ?auto_695232 ?auto_695233 ) ) ( not ( = ?auto_695232 ?auto_695234 ) ) ( not ( = ?auto_695232 ?auto_695235 ) ) ( not ( = ?auto_695232 ?auto_695236 ) ) ( not ( = ?auto_695233 ?auto_695234 ) ) ( not ( = ?auto_695233 ?auto_695235 ) ) ( not ( = ?auto_695233 ?auto_695236 ) ) ( not ( = ?auto_695234 ?auto_695235 ) ) ( not ( = ?auto_695234 ?auto_695236 ) ) ( not ( = ?auto_695235 ?auto_695236 ) ) ( ON ?auto_695234 ?auto_695235 ) ( ON ?auto_695233 ?auto_695234 ) ( CLEAR ?auto_695231 ) ( ON ?auto_695232 ?auto_695233 ) ( CLEAR ?auto_695232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_695230 ?auto_695231 ?auto_695232 )
      ( MAKE-6PILE ?auto_695230 ?auto_695231 ?auto_695232 ?auto_695233 ?auto_695234 ?auto_695235 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_695256 - BLOCK
      ?auto_695257 - BLOCK
      ?auto_695258 - BLOCK
      ?auto_695259 - BLOCK
      ?auto_695260 - BLOCK
      ?auto_695261 - BLOCK
    )
    :vars
    (
      ?auto_695262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695261 ?auto_695262 ) ( ON-TABLE ?auto_695256 ) ( not ( = ?auto_695256 ?auto_695257 ) ) ( not ( = ?auto_695256 ?auto_695258 ) ) ( not ( = ?auto_695256 ?auto_695259 ) ) ( not ( = ?auto_695256 ?auto_695260 ) ) ( not ( = ?auto_695256 ?auto_695261 ) ) ( not ( = ?auto_695256 ?auto_695262 ) ) ( not ( = ?auto_695257 ?auto_695258 ) ) ( not ( = ?auto_695257 ?auto_695259 ) ) ( not ( = ?auto_695257 ?auto_695260 ) ) ( not ( = ?auto_695257 ?auto_695261 ) ) ( not ( = ?auto_695257 ?auto_695262 ) ) ( not ( = ?auto_695258 ?auto_695259 ) ) ( not ( = ?auto_695258 ?auto_695260 ) ) ( not ( = ?auto_695258 ?auto_695261 ) ) ( not ( = ?auto_695258 ?auto_695262 ) ) ( not ( = ?auto_695259 ?auto_695260 ) ) ( not ( = ?auto_695259 ?auto_695261 ) ) ( not ( = ?auto_695259 ?auto_695262 ) ) ( not ( = ?auto_695260 ?auto_695261 ) ) ( not ( = ?auto_695260 ?auto_695262 ) ) ( not ( = ?auto_695261 ?auto_695262 ) ) ( ON ?auto_695260 ?auto_695261 ) ( ON ?auto_695259 ?auto_695260 ) ( ON ?auto_695258 ?auto_695259 ) ( CLEAR ?auto_695256 ) ( ON ?auto_695257 ?auto_695258 ) ( CLEAR ?auto_695257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_695256 ?auto_695257 )
      ( MAKE-6PILE ?auto_695256 ?auto_695257 ?auto_695258 ?auto_695259 ?auto_695260 ?auto_695261 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_695282 - BLOCK
      ?auto_695283 - BLOCK
      ?auto_695284 - BLOCK
      ?auto_695285 - BLOCK
      ?auto_695286 - BLOCK
      ?auto_695287 - BLOCK
    )
    :vars
    (
      ?auto_695288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695287 ?auto_695288 ) ( not ( = ?auto_695282 ?auto_695283 ) ) ( not ( = ?auto_695282 ?auto_695284 ) ) ( not ( = ?auto_695282 ?auto_695285 ) ) ( not ( = ?auto_695282 ?auto_695286 ) ) ( not ( = ?auto_695282 ?auto_695287 ) ) ( not ( = ?auto_695282 ?auto_695288 ) ) ( not ( = ?auto_695283 ?auto_695284 ) ) ( not ( = ?auto_695283 ?auto_695285 ) ) ( not ( = ?auto_695283 ?auto_695286 ) ) ( not ( = ?auto_695283 ?auto_695287 ) ) ( not ( = ?auto_695283 ?auto_695288 ) ) ( not ( = ?auto_695284 ?auto_695285 ) ) ( not ( = ?auto_695284 ?auto_695286 ) ) ( not ( = ?auto_695284 ?auto_695287 ) ) ( not ( = ?auto_695284 ?auto_695288 ) ) ( not ( = ?auto_695285 ?auto_695286 ) ) ( not ( = ?auto_695285 ?auto_695287 ) ) ( not ( = ?auto_695285 ?auto_695288 ) ) ( not ( = ?auto_695286 ?auto_695287 ) ) ( not ( = ?auto_695286 ?auto_695288 ) ) ( not ( = ?auto_695287 ?auto_695288 ) ) ( ON ?auto_695286 ?auto_695287 ) ( ON ?auto_695285 ?auto_695286 ) ( ON ?auto_695284 ?auto_695285 ) ( ON ?auto_695283 ?auto_695284 ) ( ON ?auto_695282 ?auto_695283 ) ( CLEAR ?auto_695282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_695282 )
      ( MAKE-6PILE ?auto_695282 ?auto_695283 ?auto_695284 ?auto_695285 ?auto_695286 ?auto_695287 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_695309 - BLOCK
      ?auto_695310 - BLOCK
      ?auto_695311 - BLOCK
      ?auto_695312 - BLOCK
      ?auto_695313 - BLOCK
      ?auto_695314 - BLOCK
      ?auto_695315 - BLOCK
    )
    :vars
    (
      ?auto_695316 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_695314 ) ( ON ?auto_695315 ?auto_695316 ) ( CLEAR ?auto_695315 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_695309 ) ( ON ?auto_695310 ?auto_695309 ) ( ON ?auto_695311 ?auto_695310 ) ( ON ?auto_695312 ?auto_695311 ) ( ON ?auto_695313 ?auto_695312 ) ( ON ?auto_695314 ?auto_695313 ) ( not ( = ?auto_695309 ?auto_695310 ) ) ( not ( = ?auto_695309 ?auto_695311 ) ) ( not ( = ?auto_695309 ?auto_695312 ) ) ( not ( = ?auto_695309 ?auto_695313 ) ) ( not ( = ?auto_695309 ?auto_695314 ) ) ( not ( = ?auto_695309 ?auto_695315 ) ) ( not ( = ?auto_695309 ?auto_695316 ) ) ( not ( = ?auto_695310 ?auto_695311 ) ) ( not ( = ?auto_695310 ?auto_695312 ) ) ( not ( = ?auto_695310 ?auto_695313 ) ) ( not ( = ?auto_695310 ?auto_695314 ) ) ( not ( = ?auto_695310 ?auto_695315 ) ) ( not ( = ?auto_695310 ?auto_695316 ) ) ( not ( = ?auto_695311 ?auto_695312 ) ) ( not ( = ?auto_695311 ?auto_695313 ) ) ( not ( = ?auto_695311 ?auto_695314 ) ) ( not ( = ?auto_695311 ?auto_695315 ) ) ( not ( = ?auto_695311 ?auto_695316 ) ) ( not ( = ?auto_695312 ?auto_695313 ) ) ( not ( = ?auto_695312 ?auto_695314 ) ) ( not ( = ?auto_695312 ?auto_695315 ) ) ( not ( = ?auto_695312 ?auto_695316 ) ) ( not ( = ?auto_695313 ?auto_695314 ) ) ( not ( = ?auto_695313 ?auto_695315 ) ) ( not ( = ?auto_695313 ?auto_695316 ) ) ( not ( = ?auto_695314 ?auto_695315 ) ) ( not ( = ?auto_695314 ?auto_695316 ) ) ( not ( = ?auto_695315 ?auto_695316 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_695315 ?auto_695316 )
      ( !STACK ?auto_695315 ?auto_695314 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_695339 - BLOCK
      ?auto_695340 - BLOCK
      ?auto_695341 - BLOCK
      ?auto_695342 - BLOCK
      ?auto_695343 - BLOCK
      ?auto_695344 - BLOCK
      ?auto_695345 - BLOCK
    )
    :vars
    (
      ?auto_695346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695345 ?auto_695346 ) ( ON-TABLE ?auto_695339 ) ( ON ?auto_695340 ?auto_695339 ) ( ON ?auto_695341 ?auto_695340 ) ( ON ?auto_695342 ?auto_695341 ) ( ON ?auto_695343 ?auto_695342 ) ( not ( = ?auto_695339 ?auto_695340 ) ) ( not ( = ?auto_695339 ?auto_695341 ) ) ( not ( = ?auto_695339 ?auto_695342 ) ) ( not ( = ?auto_695339 ?auto_695343 ) ) ( not ( = ?auto_695339 ?auto_695344 ) ) ( not ( = ?auto_695339 ?auto_695345 ) ) ( not ( = ?auto_695339 ?auto_695346 ) ) ( not ( = ?auto_695340 ?auto_695341 ) ) ( not ( = ?auto_695340 ?auto_695342 ) ) ( not ( = ?auto_695340 ?auto_695343 ) ) ( not ( = ?auto_695340 ?auto_695344 ) ) ( not ( = ?auto_695340 ?auto_695345 ) ) ( not ( = ?auto_695340 ?auto_695346 ) ) ( not ( = ?auto_695341 ?auto_695342 ) ) ( not ( = ?auto_695341 ?auto_695343 ) ) ( not ( = ?auto_695341 ?auto_695344 ) ) ( not ( = ?auto_695341 ?auto_695345 ) ) ( not ( = ?auto_695341 ?auto_695346 ) ) ( not ( = ?auto_695342 ?auto_695343 ) ) ( not ( = ?auto_695342 ?auto_695344 ) ) ( not ( = ?auto_695342 ?auto_695345 ) ) ( not ( = ?auto_695342 ?auto_695346 ) ) ( not ( = ?auto_695343 ?auto_695344 ) ) ( not ( = ?auto_695343 ?auto_695345 ) ) ( not ( = ?auto_695343 ?auto_695346 ) ) ( not ( = ?auto_695344 ?auto_695345 ) ) ( not ( = ?auto_695344 ?auto_695346 ) ) ( not ( = ?auto_695345 ?auto_695346 ) ) ( CLEAR ?auto_695343 ) ( ON ?auto_695344 ?auto_695345 ) ( CLEAR ?auto_695344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_695339 ?auto_695340 ?auto_695341 ?auto_695342 ?auto_695343 ?auto_695344 )
      ( MAKE-7PILE ?auto_695339 ?auto_695340 ?auto_695341 ?auto_695342 ?auto_695343 ?auto_695344 ?auto_695345 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_695369 - BLOCK
      ?auto_695370 - BLOCK
      ?auto_695371 - BLOCK
      ?auto_695372 - BLOCK
      ?auto_695373 - BLOCK
      ?auto_695374 - BLOCK
      ?auto_695375 - BLOCK
    )
    :vars
    (
      ?auto_695376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695375 ?auto_695376 ) ( ON-TABLE ?auto_695369 ) ( ON ?auto_695370 ?auto_695369 ) ( ON ?auto_695371 ?auto_695370 ) ( ON ?auto_695372 ?auto_695371 ) ( not ( = ?auto_695369 ?auto_695370 ) ) ( not ( = ?auto_695369 ?auto_695371 ) ) ( not ( = ?auto_695369 ?auto_695372 ) ) ( not ( = ?auto_695369 ?auto_695373 ) ) ( not ( = ?auto_695369 ?auto_695374 ) ) ( not ( = ?auto_695369 ?auto_695375 ) ) ( not ( = ?auto_695369 ?auto_695376 ) ) ( not ( = ?auto_695370 ?auto_695371 ) ) ( not ( = ?auto_695370 ?auto_695372 ) ) ( not ( = ?auto_695370 ?auto_695373 ) ) ( not ( = ?auto_695370 ?auto_695374 ) ) ( not ( = ?auto_695370 ?auto_695375 ) ) ( not ( = ?auto_695370 ?auto_695376 ) ) ( not ( = ?auto_695371 ?auto_695372 ) ) ( not ( = ?auto_695371 ?auto_695373 ) ) ( not ( = ?auto_695371 ?auto_695374 ) ) ( not ( = ?auto_695371 ?auto_695375 ) ) ( not ( = ?auto_695371 ?auto_695376 ) ) ( not ( = ?auto_695372 ?auto_695373 ) ) ( not ( = ?auto_695372 ?auto_695374 ) ) ( not ( = ?auto_695372 ?auto_695375 ) ) ( not ( = ?auto_695372 ?auto_695376 ) ) ( not ( = ?auto_695373 ?auto_695374 ) ) ( not ( = ?auto_695373 ?auto_695375 ) ) ( not ( = ?auto_695373 ?auto_695376 ) ) ( not ( = ?auto_695374 ?auto_695375 ) ) ( not ( = ?auto_695374 ?auto_695376 ) ) ( not ( = ?auto_695375 ?auto_695376 ) ) ( ON ?auto_695374 ?auto_695375 ) ( CLEAR ?auto_695372 ) ( ON ?auto_695373 ?auto_695374 ) ( CLEAR ?auto_695373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_695369 ?auto_695370 ?auto_695371 ?auto_695372 ?auto_695373 )
      ( MAKE-7PILE ?auto_695369 ?auto_695370 ?auto_695371 ?auto_695372 ?auto_695373 ?auto_695374 ?auto_695375 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_695399 - BLOCK
      ?auto_695400 - BLOCK
      ?auto_695401 - BLOCK
      ?auto_695402 - BLOCK
      ?auto_695403 - BLOCK
      ?auto_695404 - BLOCK
      ?auto_695405 - BLOCK
    )
    :vars
    (
      ?auto_695406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695405 ?auto_695406 ) ( ON-TABLE ?auto_695399 ) ( ON ?auto_695400 ?auto_695399 ) ( ON ?auto_695401 ?auto_695400 ) ( not ( = ?auto_695399 ?auto_695400 ) ) ( not ( = ?auto_695399 ?auto_695401 ) ) ( not ( = ?auto_695399 ?auto_695402 ) ) ( not ( = ?auto_695399 ?auto_695403 ) ) ( not ( = ?auto_695399 ?auto_695404 ) ) ( not ( = ?auto_695399 ?auto_695405 ) ) ( not ( = ?auto_695399 ?auto_695406 ) ) ( not ( = ?auto_695400 ?auto_695401 ) ) ( not ( = ?auto_695400 ?auto_695402 ) ) ( not ( = ?auto_695400 ?auto_695403 ) ) ( not ( = ?auto_695400 ?auto_695404 ) ) ( not ( = ?auto_695400 ?auto_695405 ) ) ( not ( = ?auto_695400 ?auto_695406 ) ) ( not ( = ?auto_695401 ?auto_695402 ) ) ( not ( = ?auto_695401 ?auto_695403 ) ) ( not ( = ?auto_695401 ?auto_695404 ) ) ( not ( = ?auto_695401 ?auto_695405 ) ) ( not ( = ?auto_695401 ?auto_695406 ) ) ( not ( = ?auto_695402 ?auto_695403 ) ) ( not ( = ?auto_695402 ?auto_695404 ) ) ( not ( = ?auto_695402 ?auto_695405 ) ) ( not ( = ?auto_695402 ?auto_695406 ) ) ( not ( = ?auto_695403 ?auto_695404 ) ) ( not ( = ?auto_695403 ?auto_695405 ) ) ( not ( = ?auto_695403 ?auto_695406 ) ) ( not ( = ?auto_695404 ?auto_695405 ) ) ( not ( = ?auto_695404 ?auto_695406 ) ) ( not ( = ?auto_695405 ?auto_695406 ) ) ( ON ?auto_695404 ?auto_695405 ) ( ON ?auto_695403 ?auto_695404 ) ( CLEAR ?auto_695401 ) ( ON ?auto_695402 ?auto_695403 ) ( CLEAR ?auto_695402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_695399 ?auto_695400 ?auto_695401 ?auto_695402 )
      ( MAKE-7PILE ?auto_695399 ?auto_695400 ?auto_695401 ?auto_695402 ?auto_695403 ?auto_695404 ?auto_695405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_695429 - BLOCK
      ?auto_695430 - BLOCK
      ?auto_695431 - BLOCK
      ?auto_695432 - BLOCK
      ?auto_695433 - BLOCK
      ?auto_695434 - BLOCK
      ?auto_695435 - BLOCK
    )
    :vars
    (
      ?auto_695436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695435 ?auto_695436 ) ( ON-TABLE ?auto_695429 ) ( ON ?auto_695430 ?auto_695429 ) ( not ( = ?auto_695429 ?auto_695430 ) ) ( not ( = ?auto_695429 ?auto_695431 ) ) ( not ( = ?auto_695429 ?auto_695432 ) ) ( not ( = ?auto_695429 ?auto_695433 ) ) ( not ( = ?auto_695429 ?auto_695434 ) ) ( not ( = ?auto_695429 ?auto_695435 ) ) ( not ( = ?auto_695429 ?auto_695436 ) ) ( not ( = ?auto_695430 ?auto_695431 ) ) ( not ( = ?auto_695430 ?auto_695432 ) ) ( not ( = ?auto_695430 ?auto_695433 ) ) ( not ( = ?auto_695430 ?auto_695434 ) ) ( not ( = ?auto_695430 ?auto_695435 ) ) ( not ( = ?auto_695430 ?auto_695436 ) ) ( not ( = ?auto_695431 ?auto_695432 ) ) ( not ( = ?auto_695431 ?auto_695433 ) ) ( not ( = ?auto_695431 ?auto_695434 ) ) ( not ( = ?auto_695431 ?auto_695435 ) ) ( not ( = ?auto_695431 ?auto_695436 ) ) ( not ( = ?auto_695432 ?auto_695433 ) ) ( not ( = ?auto_695432 ?auto_695434 ) ) ( not ( = ?auto_695432 ?auto_695435 ) ) ( not ( = ?auto_695432 ?auto_695436 ) ) ( not ( = ?auto_695433 ?auto_695434 ) ) ( not ( = ?auto_695433 ?auto_695435 ) ) ( not ( = ?auto_695433 ?auto_695436 ) ) ( not ( = ?auto_695434 ?auto_695435 ) ) ( not ( = ?auto_695434 ?auto_695436 ) ) ( not ( = ?auto_695435 ?auto_695436 ) ) ( ON ?auto_695434 ?auto_695435 ) ( ON ?auto_695433 ?auto_695434 ) ( ON ?auto_695432 ?auto_695433 ) ( CLEAR ?auto_695430 ) ( ON ?auto_695431 ?auto_695432 ) ( CLEAR ?auto_695431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_695429 ?auto_695430 ?auto_695431 )
      ( MAKE-7PILE ?auto_695429 ?auto_695430 ?auto_695431 ?auto_695432 ?auto_695433 ?auto_695434 ?auto_695435 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_695459 - BLOCK
      ?auto_695460 - BLOCK
      ?auto_695461 - BLOCK
      ?auto_695462 - BLOCK
      ?auto_695463 - BLOCK
      ?auto_695464 - BLOCK
      ?auto_695465 - BLOCK
    )
    :vars
    (
      ?auto_695466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695465 ?auto_695466 ) ( ON-TABLE ?auto_695459 ) ( not ( = ?auto_695459 ?auto_695460 ) ) ( not ( = ?auto_695459 ?auto_695461 ) ) ( not ( = ?auto_695459 ?auto_695462 ) ) ( not ( = ?auto_695459 ?auto_695463 ) ) ( not ( = ?auto_695459 ?auto_695464 ) ) ( not ( = ?auto_695459 ?auto_695465 ) ) ( not ( = ?auto_695459 ?auto_695466 ) ) ( not ( = ?auto_695460 ?auto_695461 ) ) ( not ( = ?auto_695460 ?auto_695462 ) ) ( not ( = ?auto_695460 ?auto_695463 ) ) ( not ( = ?auto_695460 ?auto_695464 ) ) ( not ( = ?auto_695460 ?auto_695465 ) ) ( not ( = ?auto_695460 ?auto_695466 ) ) ( not ( = ?auto_695461 ?auto_695462 ) ) ( not ( = ?auto_695461 ?auto_695463 ) ) ( not ( = ?auto_695461 ?auto_695464 ) ) ( not ( = ?auto_695461 ?auto_695465 ) ) ( not ( = ?auto_695461 ?auto_695466 ) ) ( not ( = ?auto_695462 ?auto_695463 ) ) ( not ( = ?auto_695462 ?auto_695464 ) ) ( not ( = ?auto_695462 ?auto_695465 ) ) ( not ( = ?auto_695462 ?auto_695466 ) ) ( not ( = ?auto_695463 ?auto_695464 ) ) ( not ( = ?auto_695463 ?auto_695465 ) ) ( not ( = ?auto_695463 ?auto_695466 ) ) ( not ( = ?auto_695464 ?auto_695465 ) ) ( not ( = ?auto_695464 ?auto_695466 ) ) ( not ( = ?auto_695465 ?auto_695466 ) ) ( ON ?auto_695464 ?auto_695465 ) ( ON ?auto_695463 ?auto_695464 ) ( ON ?auto_695462 ?auto_695463 ) ( ON ?auto_695461 ?auto_695462 ) ( CLEAR ?auto_695459 ) ( ON ?auto_695460 ?auto_695461 ) ( CLEAR ?auto_695460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_695459 ?auto_695460 )
      ( MAKE-7PILE ?auto_695459 ?auto_695460 ?auto_695461 ?auto_695462 ?auto_695463 ?auto_695464 ?auto_695465 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_695489 - BLOCK
      ?auto_695490 - BLOCK
      ?auto_695491 - BLOCK
      ?auto_695492 - BLOCK
      ?auto_695493 - BLOCK
      ?auto_695494 - BLOCK
      ?auto_695495 - BLOCK
    )
    :vars
    (
      ?auto_695496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695495 ?auto_695496 ) ( not ( = ?auto_695489 ?auto_695490 ) ) ( not ( = ?auto_695489 ?auto_695491 ) ) ( not ( = ?auto_695489 ?auto_695492 ) ) ( not ( = ?auto_695489 ?auto_695493 ) ) ( not ( = ?auto_695489 ?auto_695494 ) ) ( not ( = ?auto_695489 ?auto_695495 ) ) ( not ( = ?auto_695489 ?auto_695496 ) ) ( not ( = ?auto_695490 ?auto_695491 ) ) ( not ( = ?auto_695490 ?auto_695492 ) ) ( not ( = ?auto_695490 ?auto_695493 ) ) ( not ( = ?auto_695490 ?auto_695494 ) ) ( not ( = ?auto_695490 ?auto_695495 ) ) ( not ( = ?auto_695490 ?auto_695496 ) ) ( not ( = ?auto_695491 ?auto_695492 ) ) ( not ( = ?auto_695491 ?auto_695493 ) ) ( not ( = ?auto_695491 ?auto_695494 ) ) ( not ( = ?auto_695491 ?auto_695495 ) ) ( not ( = ?auto_695491 ?auto_695496 ) ) ( not ( = ?auto_695492 ?auto_695493 ) ) ( not ( = ?auto_695492 ?auto_695494 ) ) ( not ( = ?auto_695492 ?auto_695495 ) ) ( not ( = ?auto_695492 ?auto_695496 ) ) ( not ( = ?auto_695493 ?auto_695494 ) ) ( not ( = ?auto_695493 ?auto_695495 ) ) ( not ( = ?auto_695493 ?auto_695496 ) ) ( not ( = ?auto_695494 ?auto_695495 ) ) ( not ( = ?auto_695494 ?auto_695496 ) ) ( not ( = ?auto_695495 ?auto_695496 ) ) ( ON ?auto_695494 ?auto_695495 ) ( ON ?auto_695493 ?auto_695494 ) ( ON ?auto_695492 ?auto_695493 ) ( ON ?auto_695491 ?auto_695492 ) ( ON ?auto_695490 ?auto_695491 ) ( ON ?auto_695489 ?auto_695490 ) ( CLEAR ?auto_695489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_695489 )
      ( MAKE-7PILE ?auto_695489 ?auto_695490 ?auto_695491 ?auto_695492 ?auto_695493 ?auto_695494 ?auto_695495 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_695520 - BLOCK
      ?auto_695521 - BLOCK
      ?auto_695522 - BLOCK
      ?auto_695523 - BLOCK
      ?auto_695524 - BLOCK
      ?auto_695525 - BLOCK
      ?auto_695526 - BLOCK
      ?auto_695527 - BLOCK
    )
    :vars
    (
      ?auto_695528 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_695526 ) ( ON ?auto_695527 ?auto_695528 ) ( CLEAR ?auto_695527 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_695520 ) ( ON ?auto_695521 ?auto_695520 ) ( ON ?auto_695522 ?auto_695521 ) ( ON ?auto_695523 ?auto_695522 ) ( ON ?auto_695524 ?auto_695523 ) ( ON ?auto_695525 ?auto_695524 ) ( ON ?auto_695526 ?auto_695525 ) ( not ( = ?auto_695520 ?auto_695521 ) ) ( not ( = ?auto_695520 ?auto_695522 ) ) ( not ( = ?auto_695520 ?auto_695523 ) ) ( not ( = ?auto_695520 ?auto_695524 ) ) ( not ( = ?auto_695520 ?auto_695525 ) ) ( not ( = ?auto_695520 ?auto_695526 ) ) ( not ( = ?auto_695520 ?auto_695527 ) ) ( not ( = ?auto_695520 ?auto_695528 ) ) ( not ( = ?auto_695521 ?auto_695522 ) ) ( not ( = ?auto_695521 ?auto_695523 ) ) ( not ( = ?auto_695521 ?auto_695524 ) ) ( not ( = ?auto_695521 ?auto_695525 ) ) ( not ( = ?auto_695521 ?auto_695526 ) ) ( not ( = ?auto_695521 ?auto_695527 ) ) ( not ( = ?auto_695521 ?auto_695528 ) ) ( not ( = ?auto_695522 ?auto_695523 ) ) ( not ( = ?auto_695522 ?auto_695524 ) ) ( not ( = ?auto_695522 ?auto_695525 ) ) ( not ( = ?auto_695522 ?auto_695526 ) ) ( not ( = ?auto_695522 ?auto_695527 ) ) ( not ( = ?auto_695522 ?auto_695528 ) ) ( not ( = ?auto_695523 ?auto_695524 ) ) ( not ( = ?auto_695523 ?auto_695525 ) ) ( not ( = ?auto_695523 ?auto_695526 ) ) ( not ( = ?auto_695523 ?auto_695527 ) ) ( not ( = ?auto_695523 ?auto_695528 ) ) ( not ( = ?auto_695524 ?auto_695525 ) ) ( not ( = ?auto_695524 ?auto_695526 ) ) ( not ( = ?auto_695524 ?auto_695527 ) ) ( not ( = ?auto_695524 ?auto_695528 ) ) ( not ( = ?auto_695525 ?auto_695526 ) ) ( not ( = ?auto_695525 ?auto_695527 ) ) ( not ( = ?auto_695525 ?auto_695528 ) ) ( not ( = ?auto_695526 ?auto_695527 ) ) ( not ( = ?auto_695526 ?auto_695528 ) ) ( not ( = ?auto_695527 ?auto_695528 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_695527 ?auto_695528 )
      ( !STACK ?auto_695527 ?auto_695526 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_695554 - BLOCK
      ?auto_695555 - BLOCK
      ?auto_695556 - BLOCK
      ?auto_695557 - BLOCK
      ?auto_695558 - BLOCK
      ?auto_695559 - BLOCK
      ?auto_695560 - BLOCK
      ?auto_695561 - BLOCK
    )
    :vars
    (
      ?auto_695562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695561 ?auto_695562 ) ( ON-TABLE ?auto_695554 ) ( ON ?auto_695555 ?auto_695554 ) ( ON ?auto_695556 ?auto_695555 ) ( ON ?auto_695557 ?auto_695556 ) ( ON ?auto_695558 ?auto_695557 ) ( ON ?auto_695559 ?auto_695558 ) ( not ( = ?auto_695554 ?auto_695555 ) ) ( not ( = ?auto_695554 ?auto_695556 ) ) ( not ( = ?auto_695554 ?auto_695557 ) ) ( not ( = ?auto_695554 ?auto_695558 ) ) ( not ( = ?auto_695554 ?auto_695559 ) ) ( not ( = ?auto_695554 ?auto_695560 ) ) ( not ( = ?auto_695554 ?auto_695561 ) ) ( not ( = ?auto_695554 ?auto_695562 ) ) ( not ( = ?auto_695555 ?auto_695556 ) ) ( not ( = ?auto_695555 ?auto_695557 ) ) ( not ( = ?auto_695555 ?auto_695558 ) ) ( not ( = ?auto_695555 ?auto_695559 ) ) ( not ( = ?auto_695555 ?auto_695560 ) ) ( not ( = ?auto_695555 ?auto_695561 ) ) ( not ( = ?auto_695555 ?auto_695562 ) ) ( not ( = ?auto_695556 ?auto_695557 ) ) ( not ( = ?auto_695556 ?auto_695558 ) ) ( not ( = ?auto_695556 ?auto_695559 ) ) ( not ( = ?auto_695556 ?auto_695560 ) ) ( not ( = ?auto_695556 ?auto_695561 ) ) ( not ( = ?auto_695556 ?auto_695562 ) ) ( not ( = ?auto_695557 ?auto_695558 ) ) ( not ( = ?auto_695557 ?auto_695559 ) ) ( not ( = ?auto_695557 ?auto_695560 ) ) ( not ( = ?auto_695557 ?auto_695561 ) ) ( not ( = ?auto_695557 ?auto_695562 ) ) ( not ( = ?auto_695558 ?auto_695559 ) ) ( not ( = ?auto_695558 ?auto_695560 ) ) ( not ( = ?auto_695558 ?auto_695561 ) ) ( not ( = ?auto_695558 ?auto_695562 ) ) ( not ( = ?auto_695559 ?auto_695560 ) ) ( not ( = ?auto_695559 ?auto_695561 ) ) ( not ( = ?auto_695559 ?auto_695562 ) ) ( not ( = ?auto_695560 ?auto_695561 ) ) ( not ( = ?auto_695560 ?auto_695562 ) ) ( not ( = ?auto_695561 ?auto_695562 ) ) ( CLEAR ?auto_695559 ) ( ON ?auto_695560 ?auto_695561 ) ( CLEAR ?auto_695560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_695554 ?auto_695555 ?auto_695556 ?auto_695557 ?auto_695558 ?auto_695559 ?auto_695560 )
      ( MAKE-8PILE ?auto_695554 ?auto_695555 ?auto_695556 ?auto_695557 ?auto_695558 ?auto_695559 ?auto_695560 ?auto_695561 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_695588 - BLOCK
      ?auto_695589 - BLOCK
      ?auto_695590 - BLOCK
      ?auto_695591 - BLOCK
      ?auto_695592 - BLOCK
      ?auto_695593 - BLOCK
      ?auto_695594 - BLOCK
      ?auto_695595 - BLOCK
    )
    :vars
    (
      ?auto_695596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695595 ?auto_695596 ) ( ON-TABLE ?auto_695588 ) ( ON ?auto_695589 ?auto_695588 ) ( ON ?auto_695590 ?auto_695589 ) ( ON ?auto_695591 ?auto_695590 ) ( ON ?auto_695592 ?auto_695591 ) ( not ( = ?auto_695588 ?auto_695589 ) ) ( not ( = ?auto_695588 ?auto_695590 ) ) ( not ( = ?auto_695588 ?auto_695591 ) ) ( not ( = ?auto_695588 ?auto_695592 ) ) ( not ( = ?auto_695588 ?auto_695593 ) ) ( not ( = ?auto_695588 ?auto_695594 ) ) ( not ( = ?auto_695588 ?auto_695595 ) ) ( not ( = ?auto_695588 ?auto_695596 ) ) ( not ( = ?auto_695589 ?auto_695590 ) ) ( not ( = ?auto_695589 ?auto_695591 ) ) ( not ( = ?auto_695589 ?auto_695592 ) ) ( not ( = ?auto_695589 ?auto_695593 ) ) ( not ( = ?auto_695589 ?auto_695594 ) ) ( not ( = ?auto_695589 ?auto_695595 ) ) ( not ( = ?auto_695589 ?auto_695596 ) ) ( not ( = ?auto_695590 ?auto_695591 ) ) ( not ( = ?auto_695590 ?auto_695592 ) ) ( not ( = ?auto_695590 ?auto_695593 ) ) ( not ( = ?auto_695590 ?auto_695594 ) ) ( not ( = ?auto_695590 ?auto_695595 ) ) ( not ( = ?auto_695590 ?auto_695596 ) ) ( not ( = ?auto_695591 ?auto_695592 ) ) ( not ( = ?auto_695591 ?auto_695593 ) ) ( not ( = ?auto_695591 ?auto_695594 ) ) ( not ( = ?auto_695591 ?auto_695595 ) ) ( not ( = ?auto_695591 ?auto_695596 ) ) ( not ( = ?auto_695592 ?auto_695593 ) ) ( not ( = ?auto_695592 ?auto_695594 ) ) ( not ( = ?auto_695592 ?auto_695595 ) ) ( not ( = ?auto_695592 ?auto_695596 ) ) ( not ( = ?auto_695593 ?auto_695594 ) ) ( not ( = ?auto_695593 ?auto_695595 ) ) ( not ( = ?auto_695593 ?auto_695596 ) ) ( not ( = ?auto_695594 ?auto_695595 ) ) ( not ( = ?auto_695594 ?auto_695596 ) ) ( not ( = ?auto_695595 ?auto_695596 ) ) ( ON ?auto_695594 ?auto_695595 ) ( CLEAR ?auto_695592 ) ( ON ?auto_695593 ?auto_695594 ) ( CLEAR ?auto_695593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_695588 ?auto_695589 ?auto_695590 ?auto_695591 ?auto_695592 ?auto_695593 )
      ( MAKE-8PILE ?auto_695588 ?auto_695589 ?auto_695590 ?auto_695591 ?auto_695592 ?auto_695593 ?auto_695594 ?auto_695595 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_695622 - BLOCK
      ?auto_695623 - BLOCK
      ?auto_695624 - BLOCK
      ?auto_695625 - BLOCK
      ?auto_695626 - BLOCK
      ?auto_695627 - BLOCK
      ?auto_695628 - BLOCK
      ?auto_695629 - BLOCK
    )
    :vars
    (
      ?auto_695630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695629 ?auto_695630 ) ( ON-TABLE ?auto_695622 ) ( ON ?auto_695623 ?auto_695622 ) ( ON ?auto_695624 ?auto_695623 ) ( ON ?auto_695625 ?auto_695624 ) ( not ( = ?auto_695622 ?auto_695623 ) ) ( not ( = ?auto_695622 ?auto_695624 ) ) ( not ( = ?auto_695622 ?auto_695625 ) ) ( not ( = ?auto_695622 ?auto_695626 ) ) ( not ( = ?auto_695622 ?auto_695627 ) ) ( not ( = ?auto_695622 ?auto_695628 ) ) ( not ( = ?auto_695622 ?auto_695629 ) ) ( not ( = ?auto_695622 ?auto_695630 ) ) ( not ( = ?auto_695623 ?auto_695624 ) ) ( not ( = ?auto_695623 ?auto_695625 ) ) ( not ( = ?auto_695623 ?auto_695626 ) ) ( not ( = ?auto_695623 ?auto_695627 ) ) ( not ( = ?auto_695623 ?auto_695628 ) ) ( not ( = ?auto_695623 ?auto_695629 ) ) ( not ( = ?auto_695623 ?auto_695630 ) ) ( not ( = ?auto_695624 ?auto_695625 ) ) ( not ( = ?auto_695624 ?auto_695626 ) ) ( not ( = ?auto_695624 ?auto_695627 ) ) ( not ( = ?auto_695624 ?auto_695628 ) ) ( not ( = ?auto_695624 ?auto_695629 ) ) ( not ( = ?auto_695624 ?auto_695630 ) ) ( not ( = ?auto_695625 ?auto_695626 ) ) ( not ( = ?auto_695625 ?auto_695627 ) ) ( not ( = ?auto_695625 ?auto_695628 ) ) ( not ( = ?auto_695625 ?auto_695629 ) ) ( not ( = ?auto_695625 ?auto_695630 ) ) ( not ( = ?auto_695626 ?auto_695627 ) ) ( not ( = ?auto_695626 ?auto_695628 ) ) ( not ( = ?auto_695626 ?auto_695629 ) ) ( not ( = ?auto_695626 ?auto_695630 ) ) ( not ( = ?auto_695627 ?auto_695628 ) ) ( not ( = ?auto_695627 ?auto_695629 ) ) ( not ( = ?auto_695627 ?auto_695630 ) ) ( not ( = ?auto_695628 ?auto_695629 ) ) ( not ( = ?auto_695628 ?auto_695630 ) ) ( not ( = ?auto_695629 ?auto_695630 ) ) ( ON ?auto_695628 ?auto_695629 ) ( ON ?auto_695627 ?auto_695628 ) ( CLEAR ?auto_695625 ) ( ON ?auto_695626 ?auto_695627 ) ( CLEAR ?auto_695626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_695622 ?auto_695623 ?auto_695624 ?auto_695625 ?auto_695626 )
      ( MAKE-8PILE ?auto_695622 ?auto_695623 ?auto_695624 ?auto_695625 ?auto_695626 ?auto_695627 ?auto_695628 ?auto_695629 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_695656 - BLOCK
      ?auto_695657 - BLOCK
      ?auto_695658 - BLOCK
      ?auto_695659 - BLOCK
      ?auto_695660 - BLOCK
      ?auto_695661 - BLOCK
      ?auto_695662 - BLOCK
      ?auto_695663 - BLOCK
    )
    :vars
    (
      ?auto_695664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695663 ?auto_695664 ) ( ON-TABLE ?auto_695656 ) ( ON ?auto_695657 ?auto_695656 ) ( ON ?auto_695658 ?auto_695657 ) ( not ( = ?auto_695656 ?auto_695657 ) ) ( not ( = ?auto_695656 ?auto_695658 ) ) ( not ( = ?auto_695656 ?auto_695659 ) ) ( not ( = ?auto_695656 ?auto_695660 ) ) ( not ( = ?auto_695656 ?auto_695661 ) ) ( not ( = ?auto_695656 ?auto_695662 ) ) ( not ( = ?auto_695656 ?auto_695663 ) ) ( not ( = ?auto_695656 ?auto_695664 ) ) ( not ( = ?auto_695657 ?auto_695658 ) ) ( not ( = ?auto_695657 ?auto_695659 ) ) ( not ( = ?auto_695657 ?auto_695660 ) ) ( not ( = ?auto_695657 ?auto_695661 ) ) ( not ( = ?auto_695657 ?auto_695662 ) ) ( not ( = ?auto_695657 ?auto_695663 ) ) ( not ( = ?auto_695657 ?auto_695664 ) ) ( not ( = ?auto_695658 ?auto_695659 ) ) ( not ( = ?auto_695658 ?auto_695660 ) ) ( not ( = ?auto_695658 ?auto_695661 ) ) ( not ( = ?auto_695658 ?auto_695662 ) ) ( not ( = ?auto_695658 ?auto_695663 ) ) ( not ( = ?auto_695658 ?auto_695664 ) ) ( not ( = ?auto_695659 ?auto_695660 ) ) ( not ( = ?auto_695659 ?auto_695661 ) ) ( not ( = ?auto_695659 ?auto_695662 ) ) ( not ( = ?auto_695659 ?auto_695663 ) ) ( not ( = ?auto_695659 ?auto_695664 ) ) ( not ( = ?auto_695660 ?auto_695661 ) ) ( not ( = ?auto_695660 ?auto_695662 ) ) ( not ( = ?auto_695660 ?auto_695663 ) ) ( not ( = ?auto_695660 ?auto_695664 ) ) ( not ( = ?auto_695661 ?auto_695662 ) ) ( not ( = ?auto_695661 ?auto_695663 ) ) ( not ( = ?auto_695661 ?auto_695664 ) ) ( not ( = ?auto_695662 ?auto_695663 ) ) ( not ( = ?auto_695662 ?auto_695664 ) ) ( not ( = ?auto_695663 ?auto_695664 ) ) ( ON ?auto_695662 ?auto_695663 ) ( ON ?auto_695661 ?auto_695662 ) ( ON ?auto_695660 ?auto_695661 ) ( CLEAR ?auto_695658 ) ( ON ?auto_695659 ?auto_695660 ) ( CLEAR ?auto_695659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_695656 ?auto_695657 ?auto_695658 ?auto_695659 )
      ( MAKE-8PILE ?auto_695656 ?auto_695657 ?auto_695658 ?auto_695659 ?auto_695660 ?auto_695661 ?auto_695662 ?auto_695663 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_695690 - BLOCK
      ?auto_695691 - BLOCK
      ?auto_695692 - BLOCK
      ?auto_695693 - BLOCK
      ?auto_695694 - BLOCK
      ?auto_695695 - BLOCK
      ?auto_695696 - BLOCK
      ?auto_695697 - BLOCK
    )
    :vars
    (
      ?auto_695698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695697 ?auto_695698 ) ( ON-TABLE ?auto_695690 ) ( ON ?auto_695691 ?auto_695690 ) ( not ( = ?auto_695690 ?auto_695691 ) ) ( not ( = ?auto_695690 ?auto_695692 ) ) ( not ( = ?auto_695690 ?auto_695693 ) ) ( not ( = ?auto_695690 ?auto_695694 ) ) ( not ( = ?auto_695690 ?auto_695695 ) ) ( not ( = ?auto_695690 ?auto_695696 ) ) ( not ( = ?auto_695690 ?auto_695697 ) ) ( not ( = ?auto_695690 ?auto_695698 ) ) ( not ( = ?auto_695691 ?auto_695692 ) ) ( not ( = ?auto_695691 ?auto_695693 ) ) ( not ( = ?auto_695691 ?auto_695694 ) ) ( not ( = ?auto_695691 ?auto_695695 ) ) ( not ( = ?auto_695691 ?auto_695696 ) ) ( not ( = ?auto_695691 ?auto_695697 ) ) ( not ( = ?auto_695691 ?auto_695698 ) ) ( not ( = ?auto_695692 ?auto_695693 ) ) ( not ( = ?auto_695692 ?auto_695694 ) ) ( not ( = ?auto_695692 ?auto_695695 ) ) ( not ( = ?auto_695692 ?auto_695696 ) ) ( not ( = ?auto_695692 ?auto_695697 ) ) ( not ( = ?auto_695692 ?auto_695698 ) ) ( not ( = ?auto_695693 ?auto_695694 ) ) ( not ( = ?auto_695693 ?auto_695695 ) ) ( not ( = ?auto_695693 ?auto_695696 ) ) ( not ( = ?auto_695693 ?auto_695697 ) ) ( not ( = ?auto_695693 ?auto_695698 ) ) ( not ( = ?auto_695694 ?auto_695695 ) ) ( not ( = ?auto_695694 ?auto_695696 ) ) ( not ( = ?auto_695694 ?auto_695697 ) ) ( not ( = ?auto_695694 ?auto_695698 ) ) ( not ( = ?auto_695695 ?auto_695696 ) ) ( not ( = ?auto_695695 ?auto_695697 ) ) ( not ( = ?auto_695695 ?auto_695698 ) ) ( not ( = ?auto_695696 ?auto_695697 ) ) ( not ( = ?auto_695696 ?auto_695698 ) ) ( not ( = ?auto_695697 ?auto_695698 ) ) ( ON ?auto_695696 ?auto_695697 ) ( ON ?auto_695695 ?auto_695696 ) ( ON ?auto_695694 ?auto_695695 ) ( ON ?auto_695693 ?auto_695694 ) ( CLEAR ?auto_695691 ) ( ON ?auto_695692 ?auto_695693 ) ( CLEAR ?auto_695692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_695690 ?auto_695691 ?auto_695692 )
      ( MAKE-8PILE ?auto_695690 ?auto_695691 ?auto_695692 ?auto_695693 ?auto_695694 ?auto_695695 ?auto_695696 ?auto_695697 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_695724 - BLOCK
      ?auto_695725 - BLOCK
      ?auto_695726 - BLOCK
      ?auto_695727 - BLOCK
      ?auto_695728 - BLOCK
      ?auto_695729 - BLOCK
      ?auto_695730 - BLOCK
      ?auto_695731 - BLOCK
    )
    :vars
    (
      ?auto_695732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695731 ?auto_695732 ) ( ON-TABLE ?auto_695724 ) ( not ( = ?auto_695724 ?auto_695725 ) ) ( not ( = ?auto_695724 ?auto_695726 ) ) ( not ( = ?auto_695724 ?auto_695727 ) ) ( not ( = ?auto_695724 ?auto_695728 ) ) ( not ( = ?auto_695724 ?auto_695729 ) ) ( not ( = ?auto_695724 ?auto_695730 ) ) ( not ( = ?auto_695724 ?auto_695731 ) ) ( not ( = ?auto_695724 ?auto_695732 ) ) ( not ( = ?auto_695725 ?auto_695726 ) ) ( not ( = ?auto_695725 ?auto_695727 ) ) ( not ( = ?auto_695725 ?auto_695728 ) ) ( not ( = ?auto_695725 ?auto_695729 ) ) ( not ( = ?auto_695725 ?auto_695730 ) ) ( not ( = ?auto_695725 ?auto_695731 ) ) ( not ( = ?auto_695725 ?auto_695732 ) ) ( not ( = ?auto_695726 ?auto_695727 ) ) ( not ( = ?auto_695726 ?auto_695728 ) ) ( not ( = ?auto_695726 ?auto_695729 ) ) ( not ( = ?auto_695726 ?auto_695730 ) ) ( not ( = ?auto_695726 ?auto_695731 ) ) ( not ( = ?auto_695726 ?auto_695732 ) ) ( not ( = ?auto_695727 ?auto_695728 ) ) ( not ( = ?auto_695727 ?auto_695729 ) ) ( not ( = ?auto_695727 ?auto_695730 ) ) ( not ( = ?auto_695727 ?auto_695731 ) ) ( not ( = ?auto_695727 ?auto_695732 ) ) ( not ( = ?auto_695728 ?auto_695729 ) ) ( not ( = ?auto_695728 ?auto_695730 ) ) ( not ( = ?auto_695728 ?auto_695731 ) ) ( not ( = ?auto_695728 ?auto_695732 ) ) ( not ( = ?auto_695729 ?auto_695730 ) ) ( not ( = ?auto_695729 ?auto_695731 ) ) ( not ( = ?auto_695729 ?auto_695732 ) ) ( not ( = ?auto_695730 ?auto_695731 ) ) ( not ( = ?auto_695730 ?auto_695732 ) ) ( not ( = ?auto_695731 ?auto_695732 ) ) ( ON ?auto_695730 ?auto_695731 ) ( ON ?auto_695729 ?auto_695730 ) ( ON ?auto_695728 ?auto_695729 ) ( ON ?auto_695727 ?auto_695728 ) ( ON ?auto_695726 ?auto_695727 ) ( CLEAR ?auto_695724 ) ( ON ?auto_695725 ?auto_695726 ) ( CLEAR ?auto_695725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_695724 ?auto_695725 )
      ( MAKE-8PILE ?auto_695724 ?auto_695725 ?auto_695726 ?auto_695727 ?auto_695728 ?auto_695729 ?auto_695730 ?auto_695731 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_695758 - BLOCK
      ?auto_695759 - BLOCK
      ?auto_695760 - BLOCK
      ?auto_695761 - BLOCK
      ?auto_695762 - BLOCK
      ?auto_695763 - BLOCK
      ?auto_695764 - BLOCK
      ?auto_695765 - BLOCK
    )
    :vars
    (
      ?auto_695766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695765 ?auto_695766 ) ( not ( = ?auto_695758 ?auto_695759 ) ) ( not ( = ?auto_695758 ?auto_695760 ) ) ( not ( = ?auto_695758 ?auto_695761 ) ) ( not ( = ?auto_695758 ?auto_695762 ) ) ( not ( = ?auto_695758 ?auto_695763 ) ) ( not ( = ?auto_695758 ?auto_695764 ) ) ( not ( = ?auto_695758 ?auto_695765 ) ) ( not ( = ?auto_695758 ?auto_695766 ) ) ( not ( = ?auto_695759 ?auto_695760 ) ) ( not ( = ?auto_695759 ?auto_695761 ) ) ( not ( = ?auto_695759 ?auto_695762 ) ) ( not ( = ?auto_695759 ?auto_695763 ) ) ( not ( = ?auto_695759 ?auto_695764 ) ) ( not ( = ?auto_695759 ?auto_695765 ) ) ( not ( = ?auto_695759 ?auto_695766 ) ) ( not ( = ?auto_695760 ?auto_695761 ) ) ( not ( = ?auto_695760 ?auto_695762 ) ) ( not ( = ?auto_695760 ?auto_695763 ) ) ( not ( = ?auto_695760 ?auto_695764 ) ) ( not ( = ?auto_695760 ?auto_695765 ) ) ( not ( = ?auto_695760 ?auto_695766 ) ) ( not ( = ?auto_695761 ?auto_695762 ) ) ( not ( = ?auto_695761 ?auto_695763 ) ) ( not ( = ?auto_695761 ?auto_695764 ) ) ( not ( = ?auto_695761 ?auto_695765 ) ) ( not ( = ?auto_695761 ?auto_695766 ) ) ( not ( = ?auto_695762 ?auto_695763 ) ) ( not ( = ?auto_695762 ?auto_695764 ) ) ( not ( = ?auto_695762 ?auto_695765 ) ) ( not ( = ?auto_695762 ?auto_695766 ) ) ( not ( = ?auto_695763 ?auto_695764 ) ) ( not ( = ?auto_695763 ?auto_695765 ) ) ( not ( = ?auto_695763 ?auto_695766 ) ) ( not ( = ?auto_695764 ?auto_695765 ) ) ( not ( = ?auto_695764 ?auto_695766 ) ) ( not ( = ?auto_695765 ?auto_695766 ) ) ( ON ?auto_695764 ?auto_695765 ) ( ON ?auto_695763 ?auto_695764 ) ( ON ?auto_695762 ?auto_695763 ) ( ON ?auto_695761 ?auto_695762 ) ( ON ?auto_695760 ?auto_695761 ) ( ON ?auto_695759 ?auto_695760 ) ( ON ?auto_695758 ?auto_695759 ) ( CLEAR ?auto_695758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_695758 )
      ( MAKE-8PILE ?auto_695758 ?auto_695759 ?auto_695760 ?auto_695761 ?auto_695762 ?auto_695763 ?auto_695764 ?auto_695765 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_695793 - BLOCK
      ?auto_695794 - BLOCK
      ?auto_695795 - BLOCK
      ?auto_695796 - BLOCK
      ?auto_695797 - BLOCK
      ?auto_695798 - BLOCK
      ?auto_695799 - BLOCK
      ?auto_695800 - BLOCK
      ?auto_695801 - BLOCK
    )
    :vars
    (
      ?auto_695802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_695800 ) ( ON ?auto_695801 ?auto_695802 ) ( CLEAR ?auto_695801 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_695793 ) ( ON ?auto_695794 ?auto_695793 ) ( ON ?auto_695795 ?auto_695794 ) ( ON ?auto_695796 ?auto_695795 ) ( ON ?auto_695797 ?auto_695796 ) ( ON ?auto_695798 ?auto_695797 ) ( ON ?auto_695799 ?auto_695798 ) ( ON ?auto_695800 ?auto_695799 ) ( not ( = ?auto_695793 ?auto_695794 ) ) ( not ( = ?auto_695793 ?auto_695795 ) ) ( not ( = ?auto_695793 ?auto_695796 ) ) ( not ( = ?auto_695793 ?auto_695797 ) ) ( not ( = ?auto_695793 ?auto_695798 ) ) ( not ( = ?auto_695793 ?auto_695799 ) ) ( not ( = ?auto_695793 ?auto_695800 ) ) ( not ( = ?auto_695793 ?auto_695801 ) ) ( not ( = ?auto_695793 ?auto_695802 ) ) ( not ( = ?auto_695794 ?auto_695795 ) ) ( not ( = ?auto_695794 ?auto_695796 ) ) ( not ( = ?auto_695794 ?auto_695797 ) ) ( not ( = ?auto_695794 ?auto_695798 ) ) ( not ( = ?auto_695794 ?auto_695799 ) ) ( not ( = ?auto_695794 ?auto_695800 ) ) ( not ( = ?auto_695794 ?auto_695801 ) ) ( not ( = ?auto_695794 ?auto_695802 ) ) ( not ( = ?auto_695795 ?auto_695796 ) ) ( not ( = ?auto_695795 ?auto_695797 ) ) ( not ( = ?auto_695795 ?auto_695798 ) ) ( not ( = ?auto_695795 ?auto_695799 ) ) ( not ( = ?auto_695795 ?auto_695800 ) ) ( not ( = ?auto_695795 ?auto_695801 ) ) ( not ( = ?auto_695795 ?auto_695802 ) ) ( not ( = ?auto_695796 ?auto_695797 ) ) ( not ( = ?auto_695796 ?auto_695798 ) ) ( not ( = ?auto_695796 ?auto_695799 ) ) ( not ( = ?auto_695796 ?auto_695800 ) ) ( not ( = ?auto_695796 ?auto_695801 ) ) ( not ( = ?auto_695796 ?auto_695802 ) ) ( not ( = ?auto_695797 ?auto_695798 ) ) ( not ( = ?auto_695797 ?auto_695799 ) ) ( not ( = ?auto_695797 ?auto_695800 ) ) ( not ( = ?auto_695797 ?auto_695801 ) ) ( not ( = ?auto_695797 ?auto_695802 ) ) ( not ( = ?auto_695798 ?auto_695799 ) ) ( not ( = ?auto_695798 ?auto_695800 ) ) ( not ( = ?auto_695798 ?auto_695801 ) ) ( not ( = ?auto_695798 ?auto_695802 ) ) ( not ( = ?auto_695799 ?auto_695800 ) ) ( not ( = ?auto_695799 ?auto_695801 ) ) ( not ( = ?auto_695799 ?auto_695802 ) ) ( not ( = ?auto_695800 ?auto_695801 ) ) ( not ( = ?auto_695800 ?auto_695802 ) ) ( not ( = ?auto_695801 ?auto_695802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_695801 ?auto_695802 )
      ( !STACK ?auto_695801 ?auto_695800 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_695831 - BLOCK
      ?auto_695832 - BLOCK
      ?auto_695833 - BLOCK
      ?auto_695834 - BLOCK
      ?auto_695835 - BLOCK
      ?auto_695836 - BLOCK
      ?auto_695837 - BLOCK
      ?auto_695838 - BLOCK
      ?auto_695839 - BLOCK
    )
    :vars
    (
      ?auto_695840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695839 ?auto_695840 ) ( ON-TABLE ?auto_695831 ) ( ON ?auto_695832 ?auto_695831 ) ( ON ?auto_695833 ?auto_695832 ) ( ON ?auto_695834 ?auto_695833 ) ( ON ?auto_695835 ?auto_695834 ) ( ON ?auto_695836 ?auto_695835 ) ( ON ?auto_695837 ?auto_695836 ) ( not ( = ?auto_695831 ?auto_695832 ) ) ( not ( = ?auto_695831 ?auto_695833 ) ) ( not ( = ?auto_695831 ?auto_695834 ) ) ( not ( = ?auto_695831 ?auto_695835 ) ) ( not ( = ?auto_695831 ?auto_695836 ) ) ( not ( = ?auto_695831 ?auto_695837 ) ) ( not ( = ?auto_695831 ?auto_695838 ) ) ( not ( = ?auto_695831 ?auto_695839 ) ) ( not ( = ?auto_695831 ?auto_695840 ) ) ( not ( = ?auto_695832 ?auto_695833 ) ) ( not ( = ?auto_695832 ?auto_695834 ) ) ( not ( = ?auto_695832 ?auto_695835 ) ) ( not ( = ?auto_695832 ?auto_695836 ) ) ( not ( = ?auto_695832 ?auto_695837 ) ) ( not ( = ?auto_695832 ?auto_695838 ) ) ( not ( = ?auto_695832 ?auto_695839 ) ) ( not ( = ?auto_695832 ?auto_695840 ) ) ( not ( = ?auto_695833 ?auto_695834 ) ) ( not ( = ?auto_695833 ?auto_695835 ) ) ( not ( = ?auto_695833 ?auto_695836 ) ) ( not ( = ?auto_695833 ?auto_695837 ) ) ( not ( = ?auto_695833 ?auto_695838 ) ) ( not ( = ?auto_695833 ?auto_695839 ) ) ( not ( = ?auto_695833 ?auto_695840 ) ) ( not ( = ?auto_695834 ?auto_695835 ) ) ( not ( = ?auto_695834 ?auto_695836 ) ) ( not ( = ?auto_695834 ?auto_695837 ) ) ( not ( = ?auto_695834 ?auto_695838 ) ) ( not ( = ?auto_695834 ?auto_695839 ) ) ( not ( = ?auto_695834 ?auto_695840 ) ) ( not ( = ?auto_695835 ?auto_695836 ) ) ( not ( = ?auto_695835 ?auto_695837 ) ) ( not ( = ?auto_695835 ?auto_695838 ) ) ( not ( = ?auto_695835 ?auto_695839 ) ) ( not ( = ?auto_695835 ?auto_695840 ) ) ( not ( = ?auto_695836 ?auto_695837 ) ) ( not ( = ?auto_695836 ?auto_695838 ) ) ( not ( = ?auto_695836 ?auto_695839 ) ) ( not ( = ?auto_695836 ?auto_695840 ) ) ( not ( = ?auto_695837 ?auto_695838 ) ) ( not ( = ?auto_695837 ?auto_695839 ) ) ( not ( = ?auto_695837 ?auto_695840 ) ) ( not ( = ?auto_695838 ?auto_695839 ) ) ( not ( = ?auto_695838 ?auto_695840 ) ) ( not ( = ?auto_695839 ?auto_695840 ) ) ( CLEAR ?auto_695837 ) ( ON ?auto_695838 ?auto_695839 ) ( CLEAR ?auto_695838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_695831 ?auto_695832 ?auto_695833 ?auto_695834 ?auto_695835 ?auto_695836 ?auto_695837 ?auto_695838 )
      ( MAKE-9PILE ?auto_695831 ?auto_695832 ?auto_695833 ?auto_695834 ?auto_695835 ?auto_695836 ?auto_695837 ?auto_695838 ?auto_695839 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_695869 - BLOCK
      ?auto_695870 - BLOCK
      ?auto_695871 - BLOCK
      ?auto_695872 - BLOCK
      ?auto_695873 - BLOCK
      ?auto_695874 - BLOCK
      ?auto_695875 - BLOCK
      ?auto_695876 - BLOCK
      ?auto_695877 - BLOCK
    )
    :vars
    (
      ?auto_695878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695877 ?auto_695878 ) ( ON-TABLE ?auto_695869 ) ( ON ?auto_695870 ?auto_695869 ) ( ON ?auto_695871 ?auto_695870 ) ( ON ?auto_695872 ?auto_695871 ) ( ON ?auto_695873 ?auto_695872 ) ( ON ?auto_695874 ?auto_695873 ) ( not ( = ?auto_695869 ?auto_695870 ) ) ( not ( = ?auto_695869 ?auto_695871 ) ) ( not ( = ?auto_695869 ?auto_695872 ) ) ( not ( = ?auto_695869 ?auto_695873 ) ) ( not ( = ?auto_695869 ?auto_695874 ) ) ( not ( = ?auto_695869 ?auto_695875 ) ) ( not ( = ?auto_695869 ?auto_695876 ) ) ( not ( = ?auto_695869 ?auto_695877 ) ) ( not ( = ?auto_695869 ?auto_695878 ) ) ( not ( = ?auto_695870 ?auto_695871 ) ) ( not ( = ?auto_695870 ?auto_695872 ) ) ( not ( = ?auto_695870 ?auto_695873 ) ) ( not ( = ?auto_695870 ?auto_695874 ) ) ( not ( = ?auto_695870 ?auto_695875 ) ) ( not ( = ?auto_695870 ?auto_695876 ) ) ( not ( = ?auto_695870 ?auto_695877 ) ) ( not ( = ?auto_695870 ?auto_695878 ) ) ( not ( = ?auto_695871 ?auto_695872 ) ) ( not ( = ?auto_695871 ?auto_695873 ) ) ( not ( = ?auto_695871 ?auto_695874 ) ) ( not ( = ?auto_695871 ?auto_695875 ) ) ( not ( = ?auto_695871 ?auto_695876 ) ) ( not ( = ?auto_695871 ?auto_695877 ) ) ( not ( = ?auto_695871 ?auto_695878 ) ) ( not ( = ?auto_695872 ?auto_695873 ) ) ( not ( = ?auto_695872 ?auto_695874 ) ) ( not ( = ?auto_695872 ?auto_695875 ) ) ( not ( = ?auto_695872 ?auto_695876 ) ) ( not ( = ?auto_695872 ?auto_695877 ) ) ( not ( = ?auto_695872 ?auto_695878 ) ) ( not ( = ?auto_695873 ?auto_695874 ) ) ( not ( = ?auto_695873 ?auto_695875 ) ) ( not ( = ?auto_695873 ?auto_695876 ) ) ( not ( = ?auto_695873 ?auto_695877 ) ) ( not ( = ?auto_695873 ?auto_695878 ) ) ( not ( = ?auto_695874 ?auto_695875 ) ) ( not ( = ?auto_695874 ?auto_695876 ) ) ( not ( = ?auto_695874 ?auto_695877 ) ) ( not ( = ?auto_695874 ?auto_695878 ) ) ( not ( = ?auto_695875 ?auto_695876 ) ) ( not ( = ?auto_695875 ?auto_695877 ) ) ( not ( = ?auto_695875 ?auto_695878 ) ) ( not ( = ?auto_695876 ?auto_695877 ) ) ( not ( = ?auto_695876 ?auto_695878 ) ) ( not ( = ?auto_695877 ?auto_695878 ) ) ( ON ?auto_695876 ?auto_695877 ) ( CLEAR ?auto_695874 ) ( ON ?auto_695875 ?auto_695876 ) ( CLEAR ?auto_695875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_695869 ?auto_695870 ?auto_695871 ?auto_695872 ?auto_695873 ?auto_695874 ?auto_695875 )
      ( MAKE-9PILE ?auto_695869 ?auto_695870 ?auto_695871 ?auto_695872 ?auto_695873 ?auto_695874 ?auto_695875 ?auto_695876 ?auto_695877 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_695907 - BLOCK
      ?auto_695908 - BLOCK
      ?auto_695909 - BLOCK
      ?auto_695910 - BLOCK
      ?auto_695911 - BLOCK
      ?auto_695912 - BLOCK
      ?auto_695913 - BLOCK
      ?auto_695914 - BLOCK
      ?auto_695915 - BLOCK
    )
    :vars
    (
      ?auto_695916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695915 ?auto_695916 ) ( ON-TABLE ?auto_695907 ) ( ON ?auto_695908 ?auto_695907 ) ( ON ?auto_695909 ?auto_695908 ) ( ON ?auto_695910 ?auto_695909 ) ( ON ?auto_695911 ?auto_695910 ) ( not ( = ?auto_695907 ?auto_695908 ) ) ( not ( = ?auto_695907 ?auto_695909 ) ) ( not ( = ?auto_695907 ?auto_695910 ) ) ( not ( = ?auto_695907 ?auto_695911 ) ) ( not ( = ?auto_695907 ?auto_695912 ) ) ( not ( = ?auto_695907 ?auto_695913 ) ) ( not ( = ?auto_695907 ?auto_695914 ) ) ( not ( = ?auto_695907 ?auto_695915 ) ) ( not ( = ?auto_695907 ?auto_695916 ) ) ( not ( = ?auto_695908 ?auto_695909 ) ) ( not ( = ?auto_695908 ?auto_695910 ) ) ( not ( = ?auto_695908 ?auto_695911 ) ) ( not ( = ?auto_695908 ?auto_695912 ) ) ( not ( = ?auto_695908 ?auto_695913 ) ) ( not ( = ?auto_695908 ?auto_695914 ) ) ( not ( = ?auto_695908 ?auto_695915 ) ) ( not ( = ?auto_695908 ?auto_695916 ) ) ( not ( = ?auto_695909 ?auto_695910 ) ) ( not ( = ?auto_695909 ?auto_695911 ) ) ( not ( = ?auto_695909 ?auto_695912 ) ) ( not ( = ?auto_695909 ?auto_695913 ) ) ( not ( = ?auto_695909 ?auto_695914 ) ) ( not ( = ?auto_695909 ?auto_695915 ) ) ( not ( = ?auto_695909 ?auto_695916 ) ) ( not ( = ?auto_695910 ?auto_695911 ) ) ( not ( = ?auto_695910 ?auto_695912 ) ) ( not ( = ?auto_695910 ?auto_695913 ) ) ( not ( = ?auto_695910 ?auto_695914 ) ) ( not ( = ?auto_695910 ?auto_695915 ) ) ( not ( = ?auto_695910 ?auto_695916 ) ) ( not ( = ?auto_695911 ?auto_695912 ) ) ( not ( = ?auto_695911 ?auto_695913 ) ) ( not ( = ?auto_695911 ?auto_695914 ) ) ( not ( = ?auto_695911 ?auto_695915 ) ) ( not ( = ?auto_695911 ?auto_695916 ) ) ( not ( = ?auto_695912 ?auto_695913 ) ) ( not ( = ?auto_695912 ?auto_695914 ) ) ( not ( = ?auto_695912 ?auto_695915 ) ) ( not ( = ?auto_695912 ?auto_695916 ) ) ( not ( = ?auto_695913 ?auto_695914 ) ) ( not ( = ?auto_695913 ?auto_695915 ) ) ( not ( = ?auto_695913 ?auto_695916 ) ) ( not ( = ?auto_695914 ?auto_695915 ) ) ( not ( = ?auto_695914 ?auto_695916 ) ) ( not ( = ?auto_695915 ?auto_695916 ) ) ( ON ?auto_695914 ?auto_695915 ) ( ON ?auto_695913 ?auto_695914 ) ( CLEAR ?auto_695911 ) ( ON ?auto_695912 ?auto_695913 ) ( CLEAR ?auto_695912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_695907 ?auto_695908 ?auto_695909 ?auto_695910 ?auto_695911 ?auto_695912 )
      ( MAKE-9PILE ?auto_695907 ?auto_695908 ?auto_695909 ?auto_695910 ?auto_695911 ?auto_695912 ?auto_695913 ?auto_695914 ?auto_695915 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_695945 - BLOCK
      ?auto_695946 - BLOCK
      ?auto_695947 - BLOCK
      ?auto_695948 - BLOCK
      ?auto_695949 - BLOCK
      ?auto_695950 - BLOCK
      ?auto_695951 - BLOCK
      ?auto_695952 - BLOCK
      ?auto_695953 - BLOCK
    )
    :vars
    (
      ?auto_695954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695953 ?auto_695954 ) ( ON-TABLE ?auto_695945 ) ( ON ?auto_695946 ?auto_695945 ) ( ON ?auto_695947 ?auto_695946 ) ( ON ?auto_695948 ?auto_695947 ) ( not ( = ?auto_695945 ?auto_695946 ) ) ( not ( = ?auto_695945 ?auto_695947 ) ) ( not ( = ?auto_695945 ?auto_695948 ) ) ( not ( = ?auto_695945 ?auto_695949 ) ) ( not ( = ?auto_695945 ?auto_695950 ) ) ( not ( = ?auto_695945 ?auto_695951 ) ) ( not ( = ?auto_695945 ?auto_695952 ) ) ( not ( = ?auto_695945 ?auto_695953 ) ) ( not ( = ?auto_695945 ?auto_695954 ) ) ( not ( = ?auto_695946 ?auto_695947 ) ) ( not ( = ?auto_695946 ?auto_695948 ) ) ( not ( = ?auto_695946 ?auto_695949 ) ) ( not ( = ?auto_695946 ?auto_695950 ) ) ( not ( = ?auto_695946 ?auto_695951 ) ) ( not ( = ?auto_695946 ?auto_695952 ) ) ( not ( = ?auto_695946 ?auto_695953 ) ) ( not ( = ?auto_695946 ?auto_695954 ) ) ( not ( = ?auto_695947 ?auto_695948 ) ) ( not ( = ?auto_695947 ?auto_695949 ) ) ( not ( = ?auto_695947 ?auto_695950 ) ) ( not ( = ?auto_695947 ?auto_695951 ) ) ( not ( = ?auto_695947 ?auto_695952 ) ) ( not ( = ?auto_695947 ?auto_695953 ) ) ( not ( = ?auto_695947 ?auto_695954 ) ) ( not ( = ?auto_695948 ?auto_695949 ) ) ( not ( = ?auto_695948 ?auto_695950 ) ) ( not ( = ?auto_695948 ?auto_695951 ) ) ( not ( = ?auto_695948 ?auto_695952 ) ) ( not ( = ?auto_695948 ?auto_695953 ) ) ( not ( = ?auto_695948 ?auto_695954 ) ) ( not ( = ?auto_695949 ?auto_695950 ) ) ( not ( = ?auto_695949 ?auto_695951 ) ) ( not ( = ?auto_695949 ?auto_695952 ) ) ( not ( = ?auto_695949 ?auto_695953 ) ) ( not ( = ?auto_695949 ?auto_695954 ) ) ( not ( = ?auto_695950 ?auto_695951 ) ) ( not ( = ?auto_695950 ?auto_695952 ) ) ( not ( = ?auto_695950 ?auto_695953 ) ) ( not ( = ?auto_695950 ?auto_695954 ) ) ( not ( = ?auto_695951 ?auto_695952 ) ) ( not ( = ?auto_695951 ?auto_695953 ) ) ( not ( = ?auto_695951 ?auto_695954 ) ) ( not ( = ?auto_695952 ?auto_695953 ) ) ( not ( = ?auto_695952 ?auto_695954 ) ) ( not ( = ?auto_695953 ?auto_695954 ) ) ( ON ?auto_695952 ?auto_695953 ) ( ON ?auto_695951 ?auto_695952 ) ( ON ?auto_695950 ?auto_695951 ) ( CLEAR ?auto_695948 ) ( ON ?auto_695949 ?auto_695950 ) ( CLEAR ?auto_695949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_695945 ?auto_695946 ?auto_695947 ?auto_695948 ?auto_695949 )
      ( MAKE-9PILE ?auto_695945 ?auto_695946 ?auto_695947 ?auto_695948 ?auto_695949 ?auto_695950 ?auto_695951 ?auto_695952 ?auto_695953 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_695983 - BLOCK
      ?auto_695984 - BLOCK
      ?auto_695985 - BLOCK
      ?auto_695986 - BLOCK
      ?auto_695987 - BLOCK
      ?auto_695988 - BLOCK
      ?auto_695989 - BLOCK
      ?auto_695990 - BLOCK
      ?auto_695991 - BLOCK
    )
    :vars
    (
      ?auto_695992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695991 ?auto_695992 ) ( ON-TABLE ?auto_695983 ) ( ON ?auto_695984 ?auto_695983 ) ( ON ?auto_695985 ?auto_695984 ) ( not ( = ?auto_695983 ?auto_695984 ) ) ( not ( = ?auto_695983 ?auto_695985 ) ) ( not ( = ?auto_695983 ?auto_695986 ) ) ( not ( = ?auto_695983 ?auto_695987 ) ) ( not ( = ?auto_695983 ?auto_695988 ) ) ( not ( = ?auto_695983 ?auto_695989 ) ) ( not ( = ?auto_695983 ?auto_695990 ) ) ( not ( = ?auto_695983 ?auto_695991 ) ) ( not ( = ?auto_695983 ?auto_695992 ) ) ( not ( = ?auto_695984 ?auto_695985 ) ) ( not ( = ?auto_695984 ?auto_695986 ) ) ( not ( = ?auto_695984 ?auto_695987 ) ) ( not ( = ?auto_695984 ?auto_695988 ) ) ( not ( = ?auto_695984 ?auto_695989 ) ) ( not ( = ?auto_695984 ?auto_695990 ) ) ( not ( = ?auto_695984 ?auto_695991 ) ) ( not ( = ?auto_695984 ?auto_695992 ) ) ( not ( = ?auto_695985 ?auto_695986 ) ) ( not ( = ?auto_695985 ?auto_695987 ) ) ( not ( = ?auto_695985 ?auto_695988 ) ) ( not ( = ?auto_695985 ?auto_695989 ) ) ( not ( = ?auto_695985 ?auto_695990 ) ) ( not ( = ?auto_695985 ?auto_695991 ) ) ( not ( = ?auto_695985 ?auto_695992 ) ) ( not ( = ?auto_695986 ?auto_695987 ) ) ( not ( = ?auto_695986 ?auto_695988 ) ) ( not ( = ?auto_695986 ?auto_695989 ) ) ( not ( = ?auto_695986 ?auto_695990 ) ) ( not ( = ?auto_695986 ?auto_695991 ) ) ( not ( = ?auto_695986 ?auto_695992 ) ) ( not ( = ?auto_695987 ?auto_695988 ) ) ( not ( = ?auto_695987 ?auto_695989 ) ) ( not ( = ?auto_695987 ?auto_695990 ) ) ( not ( = ?auto_695987 ?auto_695991 ) ) ( not ( = ?auto_695987 ?auto_695992 ) ) ( not ( = ?auto_695988 ?auto_695989 ) ) ( not ( = ?auto_695988 ?auto_695990 ) ) ( not ( = ?auto_695988 ?auto_695991 ) ) ( not ( = ?auto_695988 ?auto_695992 ) ) ( not ( = ?auto_695989 ?auto_695990 ) ) ( not ( = ?auto_695989 ?auto_695991 ) ) ( not ( = ?auto_695989 ?auto_695992 ) ) ( not ( = ?auto_695990 ?auto_695991 ) ) ( not ( = ?auto_695990 ?auto_695992 ) ) ( not ( = ?auto_695991 ?auto_695992 ) ) ( ON ?auto_695990 ?auto_695991 ) ( ON ?auto_695989 ?auto_695990 ) ( ON ?auto_695988 ?auto_695989 ) ( ON ?auto_695987 ?auto_695988 ) ( CLEAR ?auto_695985 ) ( ON ?auto_695986 ?auto_695987 ) ( CLEAR ?auto_695986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_695983 ?auto_695984 ?auto_695985 ?auto_695986 )
      ( MAKE-9PILE ?auto_695983 ?auto_695984 ?auto_695985 ?auto_695986 ?auto_695987 ?auto_695988 ?auto_695989 ?auto_695990 ?auto_695991 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_696021 - BLOCK
      ?auto_696022 - BLOCK
      ?auto_696023 - BLOCK
      ?auto_696024 - BLOCK
      ?auto_696025 - BLOCK
      ?auto_696026 - BLOCK
      ?auto_696027 - BLOCK
      ?auto_696028 - BLOCK
      ?auto_696029 - BLOCK
    )
    :vars
    (
      ?auto_696030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696029 ?auto_696030 ) ( ON-TABLE ?auto_696021 ) ( ON ?auto_696022 ?auto_696021 ) ( not ( = ?auto_696021 ?auto_696022 ) ) ( not ( = ?auto_696021 ?auto_696023 ) ) ( not ( = ?auto_696021 ?auto_696024 ) ) ( not ( = ?auto_696021 ?auto_696025 ) ) ( not ( = ?auto_696021 ?auto_696026 ) ) ( not ( = ?auto_696021 ?auto_696027 ) ) ( not ( = ?auto_696021 ?auto_696028 ) ) ( not ( = ?auto_696021 ?auto_696029 ) ) ( not ( = ?auto_696021 ?auto_696030 ) ) ( not ( = ?auto_696022 ?auto_696023 ) ) ( not ( = ?auto_696022 ?auto_696024 ) ) ( not ( = ?auto_696022 ?auto_696025 ) ) ( not ( = ?auto_696022 ?auto_696026 ) ) ( not ( = ?auto_696022 ?auto_696027 ) ) ( not ( = ?auto_696022 ?auto_696028 ) ) ( not ( = ?auto_696022 ?auto_696029 ) ) ( not ( = ?auto_696022 ?auto_696030 ) ) ( not ( = ?auto_696023 ?auto_696024 ) ) ( not ( = ?auto_696023 ?auto_696025 ) ) ( not ( = ?auto_696023 ?auto_696026 ) ) ( not ( = ?auto_696023 ?auto_696027 ) ) ( not ( = ?auto_696023 ?auto_696028 ) ) ( not ( = ?auto_696023 ?auto_696029 ) ) ( not ( = ?auto_696023 ?auto_696030 ) ) ( not ( = ?auto_696024 ?auto_696025 ) ) ( not ( = ?auto_696024 ?auto_696026 ) ) ( not ( = ?auto_696024 ?auto_696027 ) ) ( not ( = ?auto_696024 ?auto_696028 ) ) ( not ( = ?auto_696024 ?auto_696029 ) ) ( not ( = ?auto_696024 ?auto_696030 ) ) ( not ( = ?auto_696025 ?auto_696026 ) ) ( not ( = ?auto_696025 ?auto_696027 ) ) ( not ( = ?auto_696025 ?auto_696028 ) ) ( not ( = ?auto_696025 ?auto_696029 ) ) ( not ( = ?auto_696025 ?auto_696030 ) ) ( not ( = ?auto_696026 ?auto_696027 ) ) ( not ( = ?auto_696026 ?auto_696028 ) ) ( not ( = ?auto_696026 ?auto_696029 ) ) ( not ( = ?auto_696026 ?auto_696030 ) ) ( not ( = ?auto_696027 ?auto_696028 ) ) ( not ( = ?auto_696027 ?auto_696029 ) ) ( not ( = ?auto_696027 ?auto_696030 ) ) ( not ( = ?auto_696028 ?auto_696029 ) ) ( not ( = ?auto_696028 ?auto_696030 ) ) ( not ( = ?auto_696029 ?auto_696030 ) ) ( ON ?auto_696028 ?auto_696029 ) ( ON ?auto_696027 ?auto_696028 ) ( ON ?auto_696026 ?auto_696027 ) ( ON ?auto_696025 ?auto_696026 ) ( ON ?auto_696024 ?auto_696025 ) ( CLEAR ?auto_696022 ) ( ON ?auto_696023 ?auto_696024 ) ( CLEAR ?auto_696023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_696021 ?auto_696022 ?auto_696023 )
      ( MAKE-9PILE ?auto_696021 ?auto_696022 ?auto_696023 ?auto_696024 ?auto_696025 ?auto_696026 ?auto_696027 ?auto_696028 ?auto_696029 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_696059 - BLOCK
      ?auto_696060 - BLOCK
      ?auto_696061 - BLOCK
      ?auto_696062 - BLOCK
      ?auto_696063 - BLOCK
      ?auto_696064 - BLOCK
      ?auto_696065 - BLOCK
      ?auto_696066 - BLOCK
      ?auto_696067 - BLOCK
    )
    :vars
    (
      ?auto_696068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696067 ?auto_696068 ) ( ON-TABLE ?auto_696059 ) ( not ( = ?auto_696059 ?auto_696060 ) ) ( not ( = ?auto_696059 ?auto_696061 ) ) ( not ( = ?auto_696059 ?auto_696062 ) ) ( not ( = ?auto_696059 ?auto_696063 ) ) ( not ( = ?auto_696059 ?auto_696064 ) ) ( not ( = ?auto_696059 ?auto_696065 ) ) ( not ( = ?auto_696059 ?auto_696066 ) ) ( not ( = ?auto_696059 ?auto_696067 ) ) ( not ( = ?auto_696059 ?auto_696068 ) ) ( not ( = ?auto_696060 ?auto_696061 ) ) ( not ( = ?auto_696060 ?auto_696062 ) ) ( not ( = ?auto_696060 ?auto_696063 ) ) ( not ( = ?auto_696060 ?auto_696064 ) ) ( not ( = ?auto_696060 ?auto_696065 ) ) ( not ( = ?auto_696060 ?auto_696066 ) ) ( not ( = ?auto_696060 ?auto_696067 ) ) ( not ( = ?auto_696060 ?auto_696068 ) ) ( not ( = ?auto_696061 ?auto_696062 ) ) ( not ( = ?auto_696061 ?auto_696063 ) ) ( not ( = ?auto_696061 ?auto_696064 ) ) ( not ( = ?auto_696061 ?auto_696065 ) ) ( not ( = ?auto_696061 ?auto_696066 ) ) ( not ( = ?auto_696061 ?auto_696067 ) ) ( not ( = ?auto_696061 ?auto_696068 ) ) ( not ( = ?auto_696062 ?auto_696063 ) ) ( not ( = ?auto_696062 ?auto_696064 ) ) ( not ( = ?auto_696062 ?auto_696065 ) ) ( not ( = ?auto_696062 ?auto_696066 ) ) ( not ( = ?auto_696062 ?auto_696067 ) ) ( not ( = ?auto_696062 ?auto_696068 ) ) ( not ( = ?auto_696063 ?auto_696064 ) ) ( not ( = ?auto_696063 ?auto_696065 ) ) ( not ( = ?auto_696063 ?auto_696066 ) ) ( not ( = ?auto_696063 ?auto_696067 ) ) ( not ( = ?auto_696063 ?auto_696068 ) ) ( not ( = ?auto_696064 ?auto_696065 ) ) ( not ( = ?auto_696064 ?auto_696066 ) ) ( not ( = ?auto_696064 ?auto_696067 ) ) ( not ( = ?auto_696064 ?auto_696068 ) ) ( not ( = ?auto_696065 ?auto_696066 ) ) ( not ( = ?auto_696065 ?auto_696067 ) ) ( not ( = ?auto_696065 ?auto_696068 ) ) ( not ( = ?auto_696066 ?auto_696067 ) ) ( not ( = ?auto_696066 ?auto_696068 ) ) ( not ( = ?auto_696067 ?auto_696068 ) ) ( ON ?auto_696066 ?auto_696067 ) ( ON ?auto_696065 ?auto_696066 ) ( ON ?auto_696064 ?auto_696065 ) ( ON ?auto_696063 ?auto_696064 ) ( ON ?auto_696062 ?auto_696063 ) ( ON ?auto_696061 ?auto_696062 ) ( CLEAR ?auto_696059 ) ( ON ?auto_696060 ?auto_696061 ) ( CLEAR ?auto_696060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_696059 ?auto_696060 )
      ( MAKE-9PILE ?auto_696059 ?auto_696060 ?auto_696061 ?auto_696062 ?auto_696063 ?auto_696064 ?auto_696065 ?auto_696066 ?auto_696067 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_696097 - BLOCK
      ?auto_696098 - BLOCK
      ?auto_696099 - BLOCK
      ?auto_696100 - BLOCK
      ?auto_696101 - BLOCK
      ?auto_696102 - BLOCK
      ?auto_696103 - BLOCK
      ?auto_696104 - BLOCK
      ?auto_696105 - BLOCK
    )
    :vars
    (
      ?auto_696106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696105 ?auto_696106 ) ( not ( = ?auto_696097 ?auto_696098 ) ) ( not ( = ?auto_696097 ?auto_696099 ) ) ( not ( = ?auto_696097 ?auto_696100 ) ) ( not ( = ?auto_696097 ?auto_696101 ) ) ( not ( = ?auto_696097 ?auto_696102 ) ) ( not ( = ?auto_696097 ?auto_696103 ) ) ( not ( = ?auto_696097 ?auto_696104 ) ) ( not ( = ?auto_696097 ?auto_696105 ) ) ( not ( = ?auto_696097 ?auto_696106 ) ) ( not ( = ?auto_696098 ?auto_696099 ) ) ( not ( = ?auto_696098 ?auto_696100 ) ) ( not ( = ?auto_696098 ?auto_696101 ) ) ( not ( = ?auto_696098 ?auto_696102 ) ) ( not ( = ?auto_696098 ?auto_696103 ) ) ( not ( = ?auto_696098 ?auto_696104 ) ) ( not ( = ?auto_696098 ?auto_696105 ) ) ( not ( = ?auto_696098 ?auto_696106 ) ) ( not ( = ?auto_696099 ?auto_696100 ) ) ( not ( = ?auto_696099 ?auto_696101 ) ) ( not ( = ?auto_696099 ?auto_696102 ) ) ( not ( = ?auto_696099 ?auto_696103 ) ) ( not ( = ?auto_696099 ?auto_696104 ) ) ( not ( = ?auto_696099 ?auto_696105 ) ) ( not ( = ?auto_696099 ?auto_696106 ) ) ( not ( = ?auto_696100 ?auto_696101 ) ) ( not ( = ?auto_696100 ?auto_696102 ) ) ( not ( = ?auto_696100 ?auto_696103 ) ) ( not ( = ?auto_696100 ?auto_696104 ) ) ( not ( = ?auto_696100 ?auto_696105 ) ) ( not ( = ?auto_696100 ?auto_696106 ) ) ( not ( = ?auto_696101 ?auto_696102 ) ) ( not ( = ?auto_696101 ?auto_696103 ) ) ( not ( = ?auto_696101 ?auto_696104 ) ) ( not ( = ?auto_696101 ?auto_696105 ) ) ( not ( = ?auto_696101 ?auto_696106 ) ) ( not ( = ?auto_696102 ?auto_696103 ) ) ( not ( = ?auto_696102 ?auto_696104 ) ) ( not ( = ?auto_696102 ?auto_696105 ) ) ( not ( = ?auto_696102 ?auto_696106 ) ) ( not ( = ?auto_696103 ?auto_696104 ) ) ( not ( = ?auto_696103 ?auto_696105 ) ) ( not ( = ?auto_696103 ?auto_696106 ) ) ( not ( = ?auto_696104 ?auto_696105 ) ) ( not ( = ?auto_696104 ?auto_696106 ) ) ( not ( = ?auto_696105 ?auto_696106 ) ) ( ON ?auto_696104 ?auto_696105 ) ( ON ?auto_696103 ?auto_696104 ) ( ON ?auto_696102 ?auto_696103 ) ( ON ?auto_696101 ?auto_696102 ) ( ON ?auto_696100 ?auto_696101 ) ( ON ?auto_696099 ?auto_696100 ) ( ON ?auto_696098 ?auto_696099 ) ( ON ?auto_696097 ?auto_696098 ) ( CLEAR ?auto_696097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_696097 )
      ( MAKE-9PILE ?auto_696097 ?auto_696098 ?auto_696099 ?auto_696100 ?auto_696101 ?auto_696102 ?auto_696103 ?auto_696104 ?auto_696105 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_696136 - BLOCK
      ?auto_696137 - BLOCK
      ?auto_696138 - BLOCK
      ?auto_696139 - BLOCK
      ?auto_696140 - BLOCK
      ?auto_696141 - BLOCK
      ?auto_696142 - BLOCK
      ?auto_696143 - BLOCK
      ?auto_696144 - BLOCK
      ?auto_696145 - BLOCK
    )
    :vars
    (
      ?auto_696146 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_696144 ) ( ON ?auto_696145 ?auto_696146 ) ( CLEAR ?auto_696145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_696136 ) ( ON ?auto_696137 ?auto_696136 ) ( ON ?auto_696138 ?auto_696137 ) ( ON ?auto_696139 ?auto_696138 ) ( ON ?auto_696140 ?auto_696139 ) ( ON ?auto_696141 ?auto_696140 ) ( ON ?auto_696142 ?auto_696141 ) ( ON ?auto_696143 ?auto_696142 ) ( ON ?auto_696144 ?auto_696143 ) ( not ( = ?auto_696136 ?auto_696137 ) ) ( not ( = ?auto_696136 ?auto_696138 ) ) ( not ( = ?auto_696136 ?auto_696139 ) ) ( not ( = ?auto_696136 ?auto_696140 ) ) ( not ( = ?auto_696136 ?auto_696141 ) ) ( not ( = ?auto_696136 ?auto_696142 ) ) ( not ( = ?auto_696136 ?auto_696143 ) ) ( not ( = ?auto_696136 ?auto_696144 ) ) ( not ( = ?auto_696136 ?auto_696145 ) ) ( not ( = ?auto_696136 ?auto_696146 ) ) ( not ( = ?auto_696137 ?auto_696138 ) ) ( not ( = ?auto_696137 ?auto_696139 ) ) ( not ( = ?auto_696137 ?auto_696140 ) ) ( not ( = ?auto_696137 ?auto_696141 ) ) ( not ( = ?auto_696137 ?auto_696142 ) ) ( not ( = ?auto_696137 ?auto_696143 ) ) ( not ( = ?auto_696137 ?auto_696144 ) ) ( not ( = ?auto_696137 ?auto_696145 ) ) ( not ( = ?auto_696137 ?auto_696146 ) ) ( not ( = ?auto_696138 ?auto_696139 ) ) ( not ( = ?auto_696138 ?auto_696140 ) ) ( not ( = ?auto_696138 ?auto_696141 ) ) ( not ( = ?auto_696138 ?auto_696142 ) ) ( not ( = ?auto_696138 ?auto_696143 ) ) ( not ( = ?auto_696138 ?auto_696144 ) ) ( not ( = ?auto_696138 ?auto_696145 ) ) ( not ( = ?auto_696138 ?auto_696146 ) ) ( not ( = ?auto_696139 ?auto_696140 ) ) ( not ( = ?auto_696139 ?auto_696141 ) ) ( not ( = ?auto_696139 ?auto_696142 ) ) ( not ( = ?auto_696139 ?auto_696143 ) ) ( not ( = ?auto_696139 ?auto_696144 ) ) ( not ( = ?auto_696139 ?auto_696145 ) ) ( not ( = ?auto_696139 ?auto_696146 ) ) ( not ( = ?auto_696140 ?auto_696141 ) ) ( not ( = ?auto_696140 ?auto_696142 ) ) ( not ( = ?auto_696140 ?auto_696143 ) ) ( not ( = ?auto_696140 ?auto_696144 ) ) ( not ( = ?auto_696140 ?auto_696145 ) ) ( not ( = ?auto_696140 ?auto_696146 ) ) ( not ( = ?auto_696141 ?auto_696142 ) ) ( not ( = ?auto_696141 ?auto_696143 ) ) ( not ( = ?auto_696141 ?auto_696144 ) ) ( not ( = ?auto_696141 ?auto_696145 ) ) ( not ( = ?auto_696141 ?auto_696146 ) ) ( not ( = ?auto_696142 ?auto_696143 ) ) ( not ( = ?auto_696142 ?auto_696144 ) ) ( not ( = ?auto_696142 ?auto_696145 ) ) ( not ( = ?auto_696142 ?auto_696146 ) ) ( not ( = ?auto_696143 ?auto_696144 ) ) ( not ( = ?auto_696143 ?auto_696145 ) ) ( not ( = ?auto_696143 ?auto_696146 ) ) ( not ( = ?auto_696144 ?auto_696145 ) ) ( not ( = ?auto_696144 ?auto_696146 ) ) ( not ( = ?auto_696145 ?auto_696146 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_696145 ?auto_696146 )
      ( !STACK ?auto_696145 ?auto_696144 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_696178 - BLOCK
      ?auto_696179 - BLOCK
      ?auto_696180 - BLOCK
      ?auto_696181 - BLOCK
      ?auto_696182 - BLOCK
      ?auto_696183 - BLOCK
      ?auto_696184 - BLOCK
      ?auto_696185 - BLOCK
      ?auto_696186 - BLOCK
      ?auto_696187 - BLOCK
    )
    :vars
    (
      ?auto_696188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696187 ?auto_696188 ) ( ON-TABLE ?auto_696178 ) ( ON ?auto_696179 ?auto_696178 ) ( ON ?auto_696180 ?auto_696179 ) ( ON ?auto_696181 ?auto_696180 ) ( ON ?auto_696182 ?auto_696181 ) ( ON ?auto_696183 ?auto_696182 ) ( ON ?auto_696184 ?auto_696183 ) ( ON ?auto_696185 ?auto_696184 ) ( not ( = ?auto_696178 ?auto_696179 ) ) ( not ( = ?auto_696178 ?auto_696180 ) ) ( not ( = ?auto_696178 ?auto_696181 ) ) ( not ( = ?auto_696178 ?auto_696182 ) ) ( not ( = ?auto_696178 ?auto_696183 ) ) ( not ( = ?auto_696178 ?auto_696184 ) ) ( not ( = ?auto_696178 ?auto_696185 ) ) ( not ( = ?auto_696178 ?auto_696186 ) ) ( not ( = ?auto_696178 ?auto_696187 ) ) ( not ( = ?auto_696178 ?auto_696188 ) ) ( not ( = ?auto_696179 ?auto_696180 ) ) ( not ( = ?auto_696179 ?auto_696181 ) ) ( not ( = ?auto_696179 ?auto_696182 ) ) ( not ( = ?auto_696179 ?auto_696183 ) ) ( not ( = ?auto_696179 ?auto_696184 ) ) ( not ( = ?auto_696179 ?auto_696185 ) ) ( not ( = ?auto_696179 ?auto_696186 ) ) ( not ( = ?auto_696179 ?auto_696187 ) ) ( not ( = ?auto_696179 ?auto_696188 ) ) ( not ( = ?auto_696180 ?auto_696181 ) ) ( not ( = ?auto_696180 ?auto_696182 ) ) ( not ( = ?auto_696180 ?auto_696183 ) ) ( not ( = ?auto_696180 ?auto_696184 ) ) ( not ( = ?auto_696180 ?auto_696185 ) ) ( not ( = ?auto_696180 ?auto_696186 ) ) ( not ( = ?auto_696180 ?auto_696187 ) ) ( not ( = ?auto_696180 ?auto_696188 ) ) ( not ( = ?auto_696181 ?auto_696182 ) ) ( not ( = ?auto_696181 ?auto_696183 ) ) ( not ( = ?auto_696181 ?auto_696184 ) ) ( not ( = ?auto_696181 ?auto_696185 ) ) ( not ( = ?auto_696181 ?auto_696186 ) ) ( not ( = ?auto_696181 ?auto_696187 ) ) ( not ( = ?auto_696181 ?auto_696188 ) ) ( not ( = ?auto_696182 ?auto_696183 ) ) ( not ( = ?auto_696182 ?auto_696184 ) ) ( not ( = ?auto_696182 ?auto_696185 ) ) ( not ( = ?auto_696182 ?auto_696186 ) ) ( not ( = ?auto_696182 ?auto_696187 ) ) ( not ( = ?auto_696182 ?auto_696188 ) ) ( not ( = ?auto_696183 ?auto_696184 ) ) ( not ( = ?auto_696183 ?auto_696185 ) ) ( not ( = ?auto_696183 ?auto_696186 ) ) ( not ( = ?auto_696183 ?auto_696187 ) ) ( not ( = ?auto_696183 ?auto_696188 ) ) ( not ( = ?auto_696184 ?auto_696185 ) ) ( not ( = ?auto_696184 ?auto_696186 ) ) ( not ( = ?auto_696184 ?auto_696187 ) ) ( not ( = ?auto_696184 ?auto_696188 ) ) ( not ( = ?auto_696185 ?auto_696186 ) ) ( not ( = ?auto_696185 ?auto_696187 ) ) ( not ( = ?auto_696185 ?auto_696188 ) ) ( not ( = ?auto_696186 ?auto_696187 ) ) ( not ( = ?auto_696186 ?auto_696188 ) ) ( not ( = ?auto_696187 ?auto_696188 ) ) ( CLEAR ?auto_696185 ) ( ON ?auto_696186 ?auto_696187 ) ( CLEAR ?auto_696186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_696178 ?auto_696179 ?auto_696180 ?auto_696181 ?auto_696182 ?auto_696183 ?auto_696184 ?auto_696185 ?auto_696186 )
      ( MAKE-10PILE ?auto_696178 ?auto_696179 ?auto_696180 ?auto_696181 ?auto_696182 ?auto_696183 ?auto_696184 ?auto_696185 ?auto_696186 ?auto_696187 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_696220 - BLOCK
      ?auto_696221 - BLOCK
      ?auto_696222 - BLOCK
      ?auto_696223 - BLOCK
      ?auto_696224 - BLOCK
      ?auto_696225 - BLOCK
      ?auto_696226 - BLOCK
      ?auto_696227 - BLOCK
      ?auto_696228 - BLOCK
      ?auto_696229 - BLOCK
    )
    :vars
    (
      ?auto_696230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696229 ?auto_696230 ) ( ON-TABLE ?auto_696220 ) ( ON ?auto_696221 ?auto_696220 ) ( ON ?auto_696222 ?auto_696221 ) ( ON ?auto_696223 ?auto_696222 ) ( ON ?auto_696224 ?auto_696223 ) ( ON ?auto_696225 ?auto_696224 ) ( ON ?auto_696226 ?auto_696225 ) ( not ( = ?auto_696220 ?auto_696221 ) ) ( not ( = ?auto_696220 ?auto_696222 ) ) ( not ( = ?auto_696220 ?auto_696223 ) ) ( not ( = ?auto_696220 ?auto_696224 ) ) ( not ( = ?auto_696220 ?auto_696225 ) ) ( not ( = ?auto_696220 ?auto_696226 ) ) ( not ( = ?auto_696220 ?auto_696227 ) ) ( not ( = ?auto_696220 ?auto_696228 ) ) ( not ( = ?auto_696220 ?auto_696229 ) ) ( not ( = ?auto_696220 ?auto_696230 ) ) ( not ( = ?auto_696221 ?auto_696222 ) ) ( not ( = ?auto_696221 ?auto_696223 ) ) ( not ( = ?auto_696221 ?auto_696224 ) ) ( not ( = ?auto_696221 ?auto_696225 ) ) ( not ( = ?auto_696221 ?auto_696226 ) ) ( not ( = ?auto_696221 ?auto_696227 ) ) ( not ( = ?auto_696221 ?auto_696228 ) ) ( not ( = ?auto_696221 ?auto_696229 ) ) ( not ( = ?auto_696221 ?auto_696230 ) ) ( not ( = ?auto_696222 ?auto_696223 ) ) ( not ( = ?auto_696222 ?auto_696224 ) ) ( not ( = ?auto_696222 ?auto_696225 ) ) ( not ( = ?auto_696222 ?auto_696226 ) ) ( not ( = ?auto_696222 ?auto_696227 ) ) ( not ( = ?auto_696222 ?auto_696228 ) ) ( not ( = ?auto_696222 ?auto_696229 ) ) ( not ( = ?auto_696222 ?auto_696230 ) ) ( not ( = ?auto_696223 ?auto_696224 ) ) ( not ( = ?auto_696223 ?auto_696225 ) ) ( not ( = ?auto_696223 ?auto_696226 ) ) ( not ( = ?auto_696223 ?auto_696227 ) ) ( not ( = ?auto_696223 ?auto_696228 ) ) ( not ( = ?auto_696223 ?auto_696229 ) ) ( not ( = ?auto_696223 ?auto_696230 ) ) ( not ( = ?auto_696224 ?auto_696225 ) ) ( not ( = ?auto_696224 ?auto_696226 ) ) ( not ( = ?auto_696224 ?auto_696227 ) ) ( not ( = ?auto_696224 ?auto_696228 ) ) ( not ( = ?auto_696224 ?auto_696229 ) ) ( not ( = ?auto_696224 ?auto_696230 ) ) ( not ( = ?auto_696225 ?auto_696226 ) ) ( not ( = ?auto_696225 ?auto_696227 ) ) ( not ( = ?auto_696225 ?auto_696228 ) ) ( not ( = ?auto_696225 ?auto_696229 ) ) ( not ( = ?auto_696225 ?auto_696230 ) ) ( not ( = ?auto_696226 ?auto_696227 ) ) ( not ( = ?auto_696226 ?auto_696228 ) ) ( not ( = ?auto_696226 ?auto_696229 ) ) ( not ( = ?auto_696226 ?auto_696230 ) ) ( not ( = ?auto_696227 ?auto_696228 ) ) ( not ( = ?auto_696227 ?auto_696229 ) ) ( not ( = ?auto_696227 ?auto_696230 ) ) ( not ( = ?auto_696228 ?auto_696229 ) ) ( not ( = ?auto_696228 ?auto_696230 ) ) ( not ( = ?auto_696229 ?auto_696230 ) ) ( ON ?auto_696228 ?auto_696229 ) ( CLEAR ?auto_696226 ) ( ON ?auto_696227 ?auto_696228 ) ( CLEAR ?auto_696227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_696220 ?auto_696221 ?auto_696222 ?auto_696223 ?auto_696224 ?auto_696225 ?auto_696226 ?auto_696227 )
      ( MAKE-10PILE ?auto_696220 ?auto_696221 ?auto_696222 ?auto_696223 ?auto_696224 ?auto_696225 ?auto_696226 ?auto_696227 ?auto_696228 ?auto_696229 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_696262 - BLOCK
      ?auto_696263 - BLOCK
      ?auto_696264 - BLOCK
      ?auto_696265 - BLOCK
      ?auto_696266 - BLOCK
      ?auto_696267 - BLOCK
      ?auto_696268 - BLOCK
      ?auto_696269 - BLOCK
      ?auto_696270 - BLOCK
      ?auto_696271 - BLOCK
    )
    :vars
    (
      ?auto_696272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696271 ?auto_696272 ) ( ON-TABLE ?auto_696262 ) ( ON ?auto_696263 ?auto_696262 ) ( ON ?auto_696264 ?auto_696263 ) ( ON ?auto_696265 ?auto_696264 ) ( ON ?auto_696266 ?auto_696265 ) ( ON ?auto_696267 ?auto_696266 ) ( not ( = ?auto_696262 ?auto_696263 ) ) ( not ( = ?auto_696262 ?auto_696264 ) ) ( not ( = ?auto_696262 ?auto_696265 ) ) ( not ( = ?auto_696262 ?auto_696266 ) ) ( not ( = ?auto_696262 ?auto_696267 ) ) ( not ( = ?auto_696262 ?auto_696268 ) ) ( not ( = ?auto_696262 ?auto_696269 ) ) ( not ( = ?auto_696262 ?auto_696270 ) ) ( not ( = ?auto_696262 ?auto_696271 ) ) ( not ( = ?auto_696262 ?auto_696272 ) ) ( not ( = ?auto_696263 ?auto_696264 ) ) ( not ( = ?auto_696263 ?auto_696265 ) ) ( not ( = ?auto_696263 ?auto_696266 ) ) ( not ( = ?auto_696263 ?auto_696267 ) ) ( not ( = ?auto_696263 ?auto_696268 ) ) ( not ( = ?auto_696263 ?auto_696269 ) ) ( not ( = ?auto_696263 ?auto_696270 ) ) ( not ( = ?auto_696263 ?auto_696271 ) ) ( not ( = ?auto_696263 ?auto_696272 ) ) ( not ( = ?auto_696264 ?auto_696265 ) ) ( not ( = ?auto_696264 ?auto_696266 ) ) ( not ( = ?auto_696264 ?auto_696267 ) ) ( not ( = ?auto_696264 ?auto_696268 ) ) ( not ( = ?auto_696264 ?auto_696269 ) ) ( not ( = ?auto_696264 ?auto_696270 ) ) ( not ( = ?auto_696264 ?auto_696271 ) ) ( not ( = ?auto_696264 ?auto_696272 ) ) ( not ( = ?auto_696265 ?auto_696266 ) ) ( not ( = ?auto_696265 ?auto_696267 ) ) ( not ( = ?auto_696265 ?auto_696268 ) ) ( not ( = ?auto_696265 ?auto_696269 ) ) ( not ( = ?auto_696265 ?auto_696270 ) ) ( not ( = ?auto_696265 ?auto_696271 ) ) ( not ( = ?auto_696265 ?auto_696272 ) ) ( not ( = ?auto_696266 ?auto_696267 ) ) ( not ( = ?auto_696266 ?auto_696268 ) ) ( not ( = ?auto_696266 ?auto_696269 ) ) ( not ( = ?auto_696266 ?auto_696270 ) ) ( not ( = ?auto_696266 ?auto_696271 ) ) ( not ( = ?auto_696266 ?auto_696272 ) ) ( not ( = ?auto_696267 ?auto_696268 ) ) ( not ( = ?auto_696267 ?auto_696269 ) ) ( not ( = ?auto_696267 ?auto_696270 ) ) ( not ( = ?auto_696267 ?auto_696271 ) ) ( not ( = ?auto_696267 ?auto_696272 ) ) ( not ( = ?auto_696268 ?auto_696269 ) ) ( not ( = ?auto_696268 ?auto_696270 ) ) ( not ( = ?auto_696268 ?auto_696271 ) ) ( not ( = ?auto_696268 ?auto_696272 ) ) ( not ( = ?auto_696269 ?auto_696270 ) ) ( not ( = ?auto_696269 ?auto_696271 ) ) ( not ( = ?auto_696269 ?auto_696272 ) ) ( not ( = ?auto_696270 ?auto_696271 ) ) ( not ( = ?auto_696270 ?auto_696272 ) ) ( not ( = ?auto_696271 ?auto_696272 ) ) ( ON ?auto_696270 ?auto_696271 ) ( ON ?auto_696269 ?auto_696270 ) ( CLEAR ?auto_696267 ) ( ON ?auto_696268 ?auto_696269 ) ( CLEAR ?auto_696268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_696262 ?auto_696263 ?auto_696264 ?auto_696265 ?auto_696266 ?auto_696267 ?auto_696268 )
      ( MAKE-10PILE ?auto_696262 ?auto_696263 ?auto_696264 ?auto_696265 ?auto_696266 ?auto_696267 ?auto_696268 ?auto_696269 ?auto_696270 ?auto_696271 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_696304 - BLOCK
      ?auto_696305 - BLOCK
      ?auto_696306 - BLOCK
      ?auto_696307 - BLOCK
      ?auto_696308 - BLOCK
      ?auto_696309 - BLOCK
      ?auto_696310 - BLOCK
      ?auto_696311 - BLOCK
      ?auto_696312 - BLOCK
      ?auto_696313 - BLOCK
    )
    :vars
    (
      ?auto_696314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696313 ?auto_696314 ) ( ON-TABLE ?auto_696304 ) ( ON ?auto_696305 ?auto_696304 ) ( ON ?auto_696306 ?auto_696305 ) ( ON ?auto_696307 ?auto_696306 ) ( ON ?auto_696308 ?auto_696307 ) ( not ( = ?auto_696304 ?auto_696305 ) ) ( not ( = ?auto_696304 ?auto_696306 ) ) ( not ( = ?auto_696304 ?auto_696307 ) ) ( not ( = ?auto_696304 ?auto_696308 ) ) ( not ( = ?auto_696304 ?auto_696309 ) ) ( not ( = ?auto_696304 ?auto_696310 ) ) ( not ( = ?auto_696304 ?auto_696311 ) ) ( not ( = ?auto_696304 ?auto_696312 ) ) ( not ( = ?auto_696304 ?auto_696313 ) ) ( not ( = ?auto_696304 ?auto_696314 ) ) ( not ( = ?auto_696305 ?auto_696306 ) ) ( not ( = ?auto_696305 ?auto_696307 ) ) ( not ( = ?auto_696305 ?auto_696308 ) ) ( not ( = ?auto_696305 ?auto_696309 ) ) ( not ( = ?auto_696305 ?auto_696310 ) ) ( not ( = ?auto_696305 ?auto_696311 ) ) ( not ( = ?auto_696305 ?auto_696312 ) ) ( not ( = ?auto_696305 ?auto_696313 ) ) ( not ( = ?auto_696305 ?auto_696314 ) ) ( not ( = ?auto_696306 ?auto_696307 ) ) ( not ( = ?auto_696306 ?auto_696308 ) ) ( not ( = ?auto_696306 ?auto_696309 ) ) ( not ( = ?auto_696306 ?auto_696310 ) ) ( not ( = ?auto_696306 ?auto_696311 ) ) ( not ( = ?auto_696306 ?auto_696312 ) ) ( not ( = ?auto_696306 ?auto_696313 ) ) ( not ( = ?auto_696306 ?auto_696314 ) ) ( not ( = ?auto_696307 ?auto_696308 ) ) ( not ( = ?auto_696307 ?auto_696309 ) ) ( not ( = ?auto_696307 ?auto_696310 ) ) ( not ( = ?auto_696307 ?auto_696311 ) ) ( not ( = ?auto_696307 ?auto_696312 ) ) ( not ( = ?auto_696307 ?auto_696313 ) ) ( not ( = ?auto_696307 ?auto_696314 ) ) ( not ( = ?auto_696308 ?auto_696309 ) ) ( not ( = ?auto_696308 ?auto_696310 ) ) ( not ( = ?auto_696308 ?auto_696311 ) ) ( not ( = ?auto_696308 ?auto_696312 ) ) ( not ( = ?auto_696308 ?auto_696313 ) ) ( not ( = ?auto_696308 ?auto_696314 ) ) ( not ( = ?auto_696309 ?auto_696310 ) ) ( not ( = ?auto_696309 ?auto_696311 ) ) ( not ( = ?auto_696309 ?auto_696312 ) ) ( not ( = ?auto_696309 ?auto_696313 ) ) ( not ( = ?auto_696309 ?auto_696314 ) ) ( not ( = ?auto_696310 ?auto_696311 ) ) ( not ( = ?auto_696310 ?auto_696312 ) ) ( not ( = ?auto_696310 ?auto_696313 ) ) ( not ( = ?auto_696310 ?auto_696314 ) ) ( not ( = ?auto_696311 ?auto_696312 ) ) ( not ( = ?auto_696311 ?auto_696313 ) ) ( not ( = ?auto_696311 ?auto_696314 ) ) ( not ( = ?auto_696312 ?auto_696313 ) ) ( not ( = ?auto_696312 ?auto_696314 ) ) ( not ( = ?auto_696313 ?auto_696314 ) ) ( ON ?auto_696312 ?auto_696313 ) ( ON ?auto_696311 ?auto_696312 ) ( ON ?auto_696310 ?auto_696311 ) ( CLEAR ?auto_696308 ) ( ON ?auto_696309 ?auto_696310 ) ( CLEAR ?auto_696309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_696304 ?auto_696305 ?auto_696306 ?auto_696307 ?auto_696308 ?auto_696309 )
      ( MAKE-10PILE ?auto_696304 ?auto_696305 ?auto_696306 ?auto_696307 ?auto_696308 ?auto_696309 ?auto_696310 ?auto_696311 ?auto_696312 ?auto_696313 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_696346 - BLOCK
      ?auto_696347 - BLOCK
      ?auto_696348 - BLOCK
      ?auto_696349 - BLOCK
      ?auto_696350 - BLOCK
      ?auto_696351 - BLOCK
      ?auto_696352 - BLOCK
      ?auto_696353 - BLOCK
      ?auto_696354 - BLOCK
      ?auto_696355 - BLOCK
    )
    :vars
    (
      ?auto_696356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696355 ?auto_696356 ) ( ON-TABLE ?auto_696346 ) ( ON ?auto_696347 ?auto_696346 ) ( ON ?auto_696348 ?auto_696347 ) ( ON ?auto_696349 ?auto_696348 ) ( not ( = ?auto_696346 ?auto_696347 ) ) ( not ( = ?auto_696346 ?auto_696348 ) ) ( not ( = ?auto_696346 ?auto_696349 ) ) ( not ( = ?auto_696346 ?auto_696350 ) ) ( not ( = ?auto_696346 ?auto_696351 ) ) ( not ( = ?auto_696346 ?auto_696352 ) ) ( not ( = ?auto_696346 ?auto_696353 ) ) ( not ( = ?auto_696346 ?auto_696354 ) ) ( not ( = ?auto_696346 ?auto_696355 ) ) ( not ( = ?auto_696346 ?auto_696356 ) ) ( not ( = ?auto_696347 ?auto_696348 ) ) ( not ( = ?auto_696347 ?auto_696349 ) ) ( not ( = ?auto_696347 ?auto_696350 ) ) ( not ( = ?auto_696347 ?auto_696351 ) ) ( not ( = ?auto_696347 ?auto_696352 ) ) ( not ( = ?auto_696347 ?auto_696353 ) ) ( not ( = ?auto_696347 ?auto_696354 ) ) ( not ( = ?auto_696347 ?auto_696355 ) ) ( not ( = ?auto_696347 ?auto_696356 ) ) ( not ( = ?auto_696348 ?auto_696349 ) ) ( not ( = ?auto_696348 ?auto_696350 ) ) ( not ( = ?auto_696348 ?auto_696351 ) ) ( not ( = ?auto_696348 ?auto_696352 ) ) ( not ( = ?auto_696348 ?auto_696353 ) ) ( not ( = ?auto_696348 ?auto_696354 ) ) ( not ( = ?auto_696348 ?auto_696355 ) ) ( not ( = ?auto_696348 ?auto_696356 ) ) ( not ( = ?auto_696349 ?auto_696350 ) ) ( not ( = ?auto_696349 ?auto_696351 ) ) ( not ( = ?auto_696349 ?auto_696352 ) ) ( not ( = ?auto_696349 ?auto_696353 ) ) ( not ( = ?auto_696349 ?auto_696354 ) ) ( not ( = ?auto_696349 ?auto_696355 ) ) ( not ( = ?auto_696349 ?auto_696356 ) ) ( not ( = ?auto_696350 ?auto_696351 ) ) ( not ( = ?auto_696350 ?auto_696352 ) ) ( not ( = ?auto_696350 ?auto_696353 ) ) ( not ( = ?auto_696350 ?auto_696354 ) ) ( not ( = ?auto_696350 ?auto_696355 ) ) ( not ( = ?auto_696350 ?auto_696356 ) ) ( not ( = ?auto_696351 ?auto_696352 ) ) ( not ( = ?auto_696351 ?auto_696353 ) ) ( not ( = ?auto_696351 ?auto_696354 ) ) ( not ( = ?auto_696351 ?auto_696355 ) ) ( not ( = ?auto_696351 ?auto_696356 ) ) ( not ( = ?auto_696352 ?auto_696353 ) ) ( not ( = ?auto_696352 ?auto_696354 ) ) ( not ( = ?auto_696352 ?auto_696355 ) ) ( not ( = ?auto_696352 ?auto_696356 ) ) ( not ( = ?auto_696353 ?auto_696354 ) ) ( not ( = ?auto_696353 ?auto_696355 ) ) ( not ( = ?auto_696353 ?auto_696356 ) ) ( not ( = ?auto_696354 ?auto_696355 ) ) ( not ( = ?auto_696354 ?auto_696356 ) ) ( not ( = ?auto_696355 ?auto_696356 ) ) ( ON ?auto_696354 ?auto_696355 ) ( ON ?auto_696353 ?auto_696354 ) ( ON ?auto_696352 ?auto_696353 ) ( ON ?auto_696351 ?auto_696352 ) ( CLEAR ?auto_696349 ) ( ON ?auto_696350 ?auto_696351 ) ( CLEAR ?auto_696350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_696346 ?auto_696347 ?auto_696348 ?auto_696349 ?auto_696350 )
      ( MAKE-10PILE ?auto_696346 ?auto_696347 ?auto_696348 ?auto_696349 ?auto_696350 ?auto_696351 ?auto_696352 ?auto_696353 ?auto_696354 ?auto_696355 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_696388 - BLOCK
      ?auto_696389 - BLOCK
      ?auto_696390 - BLOCK
      ?auto_696391 - BLOCK
      ?auto_696392 - BLOCK
      ?auto_696393 - BLOCK
      ?auto_696394 - BLOCK
      ?auto_696395 - BLOCK
      ?auto_696396 - BLOCK
      ?auto_696397 - BLOCK
    )
    :vars
    (
      ?auto_696398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696397 ?auto_696398 ) ( ON-TABLE ?auto_696388 ) ( ON ?auto_696389 ?auto_696388 ) ( ON ?auto_696390 ?auto_696389 ) ( not ( = ?auto_696388 ?auto_696389 ) ) ( not ( = ?auto_696388 ?auto_696390 ) ) ( not ( = ?auto_696388 ?auto_696391 ) ) ( not ( = ?auto_696388 ?auto_696392 ) ) ( not ( = ?auto_696388 ?auto_696393 ) ) ( not ( = ?auto_696388 ?auto_696394 ) ) ( not ( = ?auto_696388 ?auto_696395 ) ) ( not ( = ?auto_696388 ?auto_696396 ) ) ( not ( = ?auto_696388 ?auto_696397 ) ) ( not ( = ?auto_696388 ?auto_696398 ) ) ( not ( = ?auto_696389 ?auto_696390 ) ) ( not ( = ?auto_696389 ?auto_696391 ) ) ( not ( = ?auto_696389 ?auto_696392 ) ) ( not ( = ?auto_696389 ?auto_696393 ) ) ( not ( = ?auto_696389 ?auto_696394 ) ) ( not ( = ?auto_696389 ?auto_696395 ) ) ( not ( = ?auto_696389 ?auto_696396 ) ) ( not ( = ?auto_696389 ?auto_696397 ) ) ( not ( = ?auto_696389 ?auto_696398 ) ) ( not ( = ?auto_696390 ?auto_696391 ) ) ( not ( = ?auto_696390 ?auto_696392 ) ) ( not ( = ?auto_696390 ?auto_696393 ) ) ( not ( = ?auto_696390 ?auto_696394 ) ) ( not ( = ?auto_696390 ?auto_696395 ) ) ( not ( = ?auto_696390 ?auto_696396 ) ) ( not ( = ?auto_696390 ?auto_696397 ) ) ( not ( = ?auto_696390 ?auto_696398 ) ) ( not ( = ?auto_696391 ?auto_696392 ) ) ( not ( = ?auto_696391 ?auto_696393 ) ) ( not ( = ?auto_696391 ?auto_696394 ) ) ( not ( = ?auto_696391 ?auto_696395 ) ) ( not ( = ?auto_696391 ?auto_696396 ) ) ( not ( = ?auto_696391 ?auto_696397 ) ) ( not ( = ?auto_696391 ?auto_696398 ) ) ( not ( = ?auto_696392 ?auto_696393 ) ) ( not ( = ?auto_696392 ?auto_696394 ) ) ( not ( = ?auto_696392 ?auto_696395 ) ) ( not ( = ?auto_696392 ?auto_696396 ) ) ( not ( = ?auto_696392 ?auto_696397 ) ) ( not ( = ?auto_696392 ?auto_696398 ) ) ( not ( = ?auto_696393 ?auto_696394 ) ) ( not ( = ?auto_696393 ?auto_696395 ) ) ( not ( = ?auto_696393 ?auto_696396 ) ) ( not ( = ?auto_696393 ?auto_696397 ) ) ( not ( = ?auto_696393 ?auto_696398 ) ) ( not ( = ?auto_696394 ?auto_696395 ) ) ( not ( = ?auto_696394 ?auto_696396 ) ) ( not ( = ?auto_696394 ?auto_696397 ) ) ( not ( = ?auto_696394 ?auto_696398 ) ) ( not ( = ?auto_696395 ?auto_696396 ) ) ( not ( = ?auto_696395 ?auto_696397 ) ) ( not ( = ?auto_696395 ?auto_696398 ) ) ( not ( = ?auto_696396 ?auto_696397 ) ) ( not ( = ?auto_696396 ?auto_696398 ) ) ( not ( = ?auto_696397 ?auto_696398 ) ) ( ON ?auto_696396 ?auto_696397 ) ( ON ?auto_696395 ?auto_696396 ) ( ON ?auto_696394 ?auto_696395 ) ( ON ?auto_696393 ?auto_696394 ) ( ON ?auto_696392 ?auto_696393 ) ( CLEAR ?auto_696390 ) ( ON ?auto_696391 ?auto_696392 ) ( CLEAR ?auto_696391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_696388 ?auto_696389 ?auto_696390 ?auto_696391 )
      ( MAKE-10PILE ?auto_696388 ?auto_696389 ?auto_696390 ?auto_696391 ?auto_696392 ?auto_696393 ?auto_696394 ?auto_696395 ?auto_696396 ?auto_696397 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_696430 - BLOCK
      ?auto_696431 - BLOCK
      ?auto_696432 - BLOCK
      ?auto_696433 - BLOCK
      ?auto_696434 - BLOCK
      ?auto_696435 - BLOCK
      ?auto_696436 - BLOCK
      ?auto_696437 - BLOCK
      ?auto_696438 - BLOCK
      ?auto_696439 - BLOCK
    )
    :vars
    (
      ?auto_696440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696439 ?auto_696440 ) ( ON-TABLE ?auto_696430 ) ( ON ?auto_696431 ?auto_696430 ) ( not ( = ?auto_696430 ?auto_696431 ) ) ( not ( = ?auto_696430 ?auto_696432 ) ) ( not ( = ?auto_696430 ?auto_696433 ) ) ( not ( = ?auto_696430 ?auto_696434 ) ) ( not ( = ?auto_696430 ?auto_696435 ) ) ( not ( = ?auto_696430 ?auto_696436 ) ) ( not ( = ?auto_696430 ?auto_696437 ) ) ( not ( = ?auto_696430 ?auto_696438 ) ) ( not ( = ?auto_696430 ?auto_696439 ) ) ( not ( = ?auto_696430 ?auto_696440 ) ) ( not ( = ?auto_696431 ?auto_696432 ) ) ( not ( = ?auto_696431 ?auto_696433 ) ) ( not ( = ?auto_696431 ?auto_696434 ) ) ( not ( = ?auto_696431 ?auto_696435 ) ) ( not ( = ?auto_696431 ?auto_696436 ) ) ( not ( = ?auto_696431 ?auto_696437 ) ) ( not ( = ?auto_696431 ?auto_696438 ) ) ( not ( = ?auto_696431 ?auto_696439 ) ) ( not ( = ?auto_696431 ?auto_696440 ) ) ( not ( = ?auto_696432 ?auto_696433 ) ) ( not ( = ?auto_696432 ?auto_696434 ) ) ( not ( = ?auto_696432 ?auto_696435 ) ) ( not ( = ?auto_696432 ?auto_696436 ) ) ( not ( = ?auto_696432 ?auto_696437 ) ) ( not ( = ?auto_696432 ?auto_696438 ) ) ( not ( = ?auto_696432 ?auto_696439 ) ) ( not ( = ?auto_696432 ?auto_696440 ) ) ( not ( = ?auto_696433 ?auto_696434 ) ) ( not ( = ?auto_696433 ?auto_696435 ) ) ( not ( = ?auto_696433 ?auto_696436 ) ) ( not ( = ?auto_696433 ?auto_696437 ) ) ( not ( = ?auto_696433 ?auto_696438 ) ) ( not ( = ?auto_696433 ?auto_696439 ) ) ( not ( = ?auto_696433 ?auto_696440 ) ) ( not ( = ?auto_696434 ?auto_696435 ) ) ( not ( = ?auto_696434 ?auto_696436 ) ) ( not ( = ?auto_696434 ?auto_696437 ) ) ( not ( = ?auto_696434 ?auto_696438 ) ) ( not ( = ?auto_696434 ?auto_696439 ) ) ( not ( = ?auto_696434 ?auto_696440 ) ) ( not ( = ?auto_696435 ?auto_696436 ) ) ( not ( = ?auto_696435 ?auto_696437 ) ) ( not ( = ?auto_696435 ?auto_696438 ) ) ( not ( = ?auto_696435 ?auto_696439 ) ) ( not ( = ?auto_696435 ?auto_696440 ) ) ( not ( = ?auto_696436 ?auto_696437 ) ) ( not ( = ?auto_696436 ?auto_696438 ) ) ( not ( = ?auto_696436 ?auto_696439 ) ) ( not ( = ?auto_696436 ?auto_696440 ) ) ( not ( = ?auto_696437 ?auto_696438 ) ) ( not ( = ?auto_696437 ?auto_696439 ) ) ( not ( = ?auto_696437 ?auto_696440 ) ) ( not ( = ?auto_696438 ?auto_696439 ) ) ( not ( = ?auto_696438 ?auto_696440 ) ) ( not ( = ?auto_696439 ?auto_696440 ) ) ( ON ?auto_696438 ?auto_696439 ) ( ON ?auto_696437 ?auto_696438 ) ( ON ?auto_696436 ?auto_696437 ) ( ON ?auto_696435 ?auto_696436 ) ( ON ?auto_696434 ?auto_696435 ) ( ON ?auto_696433 ?auto_696434 ) ( CLEAR ?auto_696431 ) ( ON ?auto_696432 ?auto_696433 ) ( CLEAR ?auto_696432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_696430 ?auto_696431 ?auto_696432 )
      ( MAKE-10PILE ?auto_696430 ?auto_696431 ?auto_696432 ?auto_696433 ?auto_696434 ?auto_696435 ?auto_696436 ?auto_696437 ?auto_696438 ?auto_696439 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_696472 - BLOCK
      ?auto_696473 - BLOCK
      ?auto_696474 - BLOCK
      ?auto_696475 - BLOCK
      ?auto_696476 - BLOCK
      ?auto_696477 - BLOCK
      ?auto_696478 - BLOCK
      ?auto_696479 - BLOCK
      ?auto_696480 - BLOCK
      ?auto_696481 - BLOCK
    )
    :vars
    (
      ?auto_696482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696481 ?auto_696482 ) ( ON-TABLE ?auto_696472 ) ( not ( = ?auto_696472 ?auto_696473 ) ) ( not ( = ?auto_696472 ?auto_696474 ) ) ( not ( = ?auto_696472 ?auto_696475 ) ) ( not ( = ?auto_696472 ?auto_696476 ) ) ( not ( = ?auto_696472 ?auto_696477 ) ) ( not ( = ?auto_696472 ?auto_696478 ) ) ( not ( = ?auto_696472 ?auto_696479 ) ) ( not ( = ?auto_696472 ?auto_696480 ) ) ( not ( = ?auto_696472 ?auto_696481 ) ) ( not ( = ?auto_696472 ?auto_696482 ) ) ( not ( = ?auto_696473 ?auto_696474 ) ) ( not ( = ?auto_696473 ?auto_696475 ) ) ( not ( = ?auto_696473 ?auto_696476 ) ) ( not ( = ?auto_696473 ?auto_696477 ) ) ( not ( = ?auto_696473 ?auto_696478 ) ) ( not ( = ?auto_696473 ?auto_696479 ) ) ( not ( = ?auto_696473 ?auto_696480 ) ) ( not ( = ?auto_696473 ?auto_696481 ) ) ( not ( = ?auto_696473 ?auto_696482 ) ) ( not ( = ?auto_696474 ?auto_696475 ) ) ( not ( = ?auto_696474 ?auto_696476 ) ) ( not ( = ?auto_696474 ?auto_696477 ) ) ( not ( = ?auto_696474 ?auto_696478 ) ) ( not ( = ?auto_696474 ?auto_696479 ) ) ( not ( = ?auto_696474 ?auto_696480 ) ) ( not ( = ?auto_696474 ?auto_696481 ) ) ( not ( = ?auto_696474 ?auto_696482 ) ) ( not ( = ?auto_696475 ?auto_696476 ) ) ( not ( = ?auto_696475 ?auto_696477 ) ) ( not ( = ?auto_696475 ?auto_696478 ) ) ( not ( = ?auto_696475 ?auto_696479 ) ) ( not ( = ?auto_696475 ?auto_696480 ) ) ( not ( = ?auto_696475 ?auto_696481 ) ) ( not ( = ?auto_696475 ?auto_696482 ) ) ( not ( = ?auto_696476 ?auto_696477 ) ) ( not ( = ?auto_696476 ?auto_696478 ) ) ( not ( = ?auto_696476 ?auto_696479 ) ) ( not ( = ?auto_696476 ?auto_696480 ) ) ( not ( = ?auto_696476 ?auto_696481 ) ) ( not ( = ?auto_696476 ?auto_696482 ) ) ( not ( = ?auto_696477 ?auto_696478 ) ) ( not ( = ?auto_696477 ?auto_696479 ) ) ( not ( = ?auto_696477 ?auto_696480 ) ) ( not ( = ?auto_696477 ?auto_696481 ) ) ( not ( = ?auto_696477 ?auto_696482 ) ) ( not ( = ?auto_696478 ?auto_696479 ) ) ( not ( = ?auto_696478 ?auto_696480 ) ) ( not ( = ?auto_696478 ?auto_696481 ) ) ( not ( = ?auto_696478 ?auto_696482 ) ) ( not ( = ?auto_696479 ?auto_696480 ) ) ( not ( = ?auto_696479 ?auto_696481 ) ) ( not ( = ?auto_696479 ?auto_696482 ) ) ( not ( = ?auto_696480 ?auto_696481 ) ) ( not ( = ?auto_696480 ?auto_696482 ) ) ( not ( = ?auto_696481 ?auto_696482 ) ) ( ON ?auto_696480 ?auto_696481 ) ( ON ?auto_696479 ?auto_696480 ) ( ON ?auto_696478 ?auto_696479 ) ( ON ?auto_696477 ?auto_696478 ) ( ON ?auto_696476 ?auto_696477 ) ( ON ?auto_696475 ?auto_696476 ) ( ON ?auto_696474 ?auto_696475 ) ( CLEAR ?auto_696472 ) ( ON ?auto_696473 ?auto_696474 ) ( CLEAR ?auto_696473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_696472 ?auto_696473 )
      ( MAKE-10PILE ?auto_696472 ?auto_696473 ?auto_696474 ?auto_696475 ?auto_696476 ?auto_696477 ?auto_696478 ?auto_696479 ?auto_696480 ?auto_696481 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_696514 - BLOCK
      ?auto_696515 - BLOCK
      ?auto_696516 - BLOCK
      ?auto_696517 - BLOCK
      ?auto_696518 - BLOCK
      ?auto_696519 - BLOCK
      ?auto_696520 - BLOCK
      ?auto_696521 - BLOCK
      ?auto_696522 - BLOCK
      ?auto_696523 - BLOCK
    )
    :vars
    (
      ?auto_696524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696523 ?auto_696524 ) ( not ( = ?auto_696514 ?auto_696515 ) ) ( not ( = ?auto_696514 ?auto_696516 ) ) ( not ( = ?auto_696514 ?auto_696517 ) ) ( not ( = ?auto_696514 ?auto_696518 ) ) ( not ( = ?auto_696514 ?auto_696519 ) ) ( not ( = ?auto_696514 ?auto_696520 ) ) ( not ( = ?auto_696514 ?auto_696521 ) ) ( not ( = ?auto_696514 ?auto_696522 ) ) ( not ( = ?auto_696514 ?auto_696523 ) ) ( not ( = ?auto_696514 ?auto_696524 ) ) ( not ( = ?auto_696515 ?auto_696516 ) ) ( not ( = ?auto_696515 ?auto_696517 ) ) ( not ( = ?auto_696515 ?auto_696518 ) ) ( not ( = ?auto_696515 ?auto_696519 ) ) ( not ( = ?auto_696515 ?auto_696520 ) ) ( not ( = ?auto_696515 ?auto_696521 ) ) ( not ( = ?auto_696515 ?auto_696522 ) ) ( not ( = ?auto_696515 ?auto_696523 ) ) ( not ( = ?auto_696515 ?auto_696524 ) ) ( not ( = ?auto_696516 ?auto_696517 ) ) ( not ( = ?auto_696516 ?auto_696518 ) ) ( not ( = ?auto_696516 ?auto_696519 ) ) ( not ( = ?auto_696516 ?auto_696520 ) ) ( not ( = ?auto_696516 ?auto_696521 ) ) ( not ( = ?auto_696516 ?auto_696522 ) ) ( not ( = ?auto_696516 ?auto_696523 ) ) ( not ( = ?auto_696516 ?auto_696524 ) ) ( not ( = ?auto_696517 ?auto_696518 ) ) ( not ( = ?auto_696517 ?auto_696519 ) ) ( not ( = ?auto_696517 ?auto_696520 ) ) ( not ( = ?auto_696517 ?auto_696521 ) ) ( not ( = ?auto_696517 ?auto_696522 ) ) ( not ( = ?auto_696517 ?auto_696523 ) ) ( not ( = ?auto_696517 ?auto_696524 ) ) ( not ( = ?auto_696518 ?auto_696519 ) ) ( not ( = ?auto_696518 ?auto_696520 ) ) ( not ( = ?auto_696518 ?auto_696521 ) ) ( not ( = ?auto_696518 ?auto_696522 ) ) ( not ( = ?auto_696518 ?auto_696523 ) ) ( not ( = ?auto_696518 ?auto_696524 ) ) ( not ( = ?auto_696519 ?auto_696520 ) ) ( not ( = ?auto_696519 ?auto_696521 ) ) ( not ( = ?auto_696519 ?auto_696522 ) ) ( not ( = ?auto_696519 ?auto_696523 ) ) ( not ( = ?auto_696519 ?auto_696524 ) ) ( not ( = ?auto_696520 ?auto_696521 ) ) ( not ( = ?auto_696520 ?auto_696522 ) ) ( not ( = ?auto_696520 ?auto_696523 ) ) ( not ( = ?auto_696520 ?auto_696524 ) ) ( not ( = ?auto_696521 ?auto_696522 ) ) ( not ( = ?auto_696521 ?auto_696523 ) ) ( not ( = ?auto_696521 ?auto_696524 ) ) ( not ( = ?auto_696522 ?auto_696523 ) ) ( not ( = ?auto_696522 ?auto_696524 ) ) ( not ( = ?auto_696523 ?auto_696524 ) ) ( ON ?auto_696522 ?auto_696523 ) ( ON ?auto_696521 ?auto_696522 ) ( ON ?auto_696520 ?auto_696521 ) ( ON ?auto_696519 ?auto_696520 ) ( ON ?auto_696518 ?auto_696519 ) ( ON ?auto_696517 ?auto_696518 ) ( ON ?auto_696516 ?auto_696517 ) ( ON ?auto_696515 ?auto_696516 ) ( ON ?auto_696514 ?auto_696515 ) ( CLEAR ?auto_696514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_696514 )
      ( MAKE-10PILE ?auto_696514 ?auto_696515 ?auto_696516 ?auto_696517 ?auto_696518 ?auto_696519 ?auto_696520 ?auto_696521 ?auto_696522 ?auto_696523 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_696557 - BLOCK
      ?auto_696558 - BLOCK
      ?auto_696559 - BLOCK
      ?auto_696560 - BLOCK
      ?auto_696561 - BLOCK
      ?auto_696562 - BLOCK
      ?auto_696563 - BLOCK
      ?auto_696564 - BLOCK
      ?auto_696565 - BLOCK
      ?auto_696566 - BLOCK
      ?auto_696567 - BLOCK
    )
    :vars
    (
      ?auto_696568 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_696566 ) ( ON ?auto_696567 ?auto_696568 ) ( CLEAR ?auto_696567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_696557 ) ( ON ?auto_696558 ?auto_696557 ) ( ON ?auto_696559 ?auto_696558 ) ( ON ?auto_696560 ?auto_696559 ) ( ON ?auto_696561 ?auto_696560 ) ( ON ?auto_696562 ?auto_696561 ) ( ON ?auto_696563 ?auto_696562 ) ( ON ?auto_696564 ?auto_696563 ) ( ON ?auto_696565 ?auto_696564 ) ( ON ?auto_696566 ?auto_696565 ) ( not ( = ?auto_696557 ?auto_696558 ) ) ( not ( = ?auto_696557 ?auto_696559 ) ) ( not ( = ?auto_696557 ?auto_696560 ) ) ( not ( = ?auto_696557 ?auto_696561 ) ) ( not ( = ?auto_696557 ?auto_696562 ) ) ( not ( = ?auto_696557 ?auto_696563 ) ) ( not ( = ?auto_696557 ?auto_696564 ) ) ( not ( = ?auto_696557 ?auto_696565 ) ) ( not ( = ?auto_696557 ?auto_696566 ) ) ( not ( = ?auto_696557 ?auto_696567 ) ) ( not ( = ?auto_696557 ?auto_696568 ) ) ( not ( = ?auto_696558 ?auto_696559 ) ) ( not ( = ?auto_696558 ?auto_696560 ) ) ( not ( = ?auto_696558 ?auto_696561 ) ) ( not ( = ?auto_696558 ?auto_696562 ) ) ( not ( = ?auto_696558 ?auto_696563 ) ) ( not ( = ?auto_696558 ?auto_696564 ) ) ( not ( = ?auto_696558 ?auto_696565 ) ) ( not ( = ?auto_696558 ?auto_696566 ) ) ( not ( = ?auto_696558 ?auto_696567 ) ) ( not ( = ?auto_696558 ?auto_696568 ) ) ( not ( = ?auto_696559 ?auto_696560 ) ) ( not ( = ?auto_696559 ?auto_696561 ) ) ( not ( = ?auto_696559 ?auto_696562 ) ) ( not ( = ?auto_696559 ?auto_696563 ) ) ( not ( = ?auto_696559 ?auto_696564 ) ) ( not ( = ?auto_696559 ?auto_696565 ) ) ( not ( = ?auto_696559 ?auto_696566 ) ) ( not ( = ?auto_696559 ?auto_696567 ) ) ( not ( = ?auto_696559 ?auto_696568 ) ) ( not ( = ?auto_696560 ?auto_696561 ) ) ( not ( = ?auto_696560 ?auto_696562 ) ) ( not ( = ?auto_696560 ?auto_696563 ) ) ( not ( = ?auto_696560 ?auto_696564 ) ) ( not ( = ?auto_696560 ?auto_696565 ) ) ( not ( = ?auto_696560 ?auto_696566 ) ) ( not ( = ?auto_696560 ?auto_696567 ) ) ( not ( = ?auto_696560 ?auto_696568 ) ) ( not ( = ?auto_696561 ?auto_696562 ) ) ( not ( = ?auto_696561 ?auto_696563 ) ) ( not ( = ?auto_696561 ?auto_696564 ) ) ( not ( = ?auto_696561 ?auto_696565 ) ) ( not ( = ?auto_696561 ?auto_696566 ) ) ( not ( = ?auto_696561 ?auto_696567 ) ) ( not ( = ?auto_696561 ?auto_696568 ) ) ( not ( = ?auto_696562 ?auto_696563 ) ) ( not ( = ?auto_696562 ?auto_696564 ) ) ( not ( = ?auto_696562 ?auto_696565 ) ) ( not ( = ?auto_696562 ?auto_696566 ) ) ( not ( = ?auto_696562 ?auto_696567 ) ) ( not ( = ?auto_696562 ?auto_696568 ) ) ( not ( = ?auto_696563 ?auto_696564 ) ) ( not ( = ?auto_696563 ?auto_696565 ) ) ( not ( = ?auto_696563 ?auto_696566 ) ) ( not ( = ?auto_696563 ?auto_696567 ) ) ( not ( = ?auto_696563 ?auto_696568 ) ) ( not ( = ?auto_696564 ?auto_696565 ) ) ( not ( = ?auto_696564 ?auto_696566 ) ) ( not ( = ?auto_696564 ?auto_696567 ) ) ( not ( = ?auto_696564 ?auto_696568 ) ) ( not ( = ?auto_696565 ?auto_696566 ) ) ( not ( = ?auto_696565 ?auto_696567 ) ) ( not ( = ?auto_696565 ?auto_696568 ) ) ( not ( = ?auto_696566 ?auto_696567 ) ) ( not ( = ?auto_696566 ?auto_696568 ) ) ( not ( = ?auto_696567 ?auto_696568 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_696567 ?auto_696568 )
      ( !STACK ?auto_696567 ?auto_696566 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_696603 - BLOCK
      ?auto_696604 - BLOCK
      ?auto_696605 - BLOCK
      ?auto_696606 - BLOCK
      ?auto_696607 - BLOCK
      ?auto_696608 - BLOCK
      ?auto_696609 - BLOCK
      ?auto_696610 - BLOCK
      ?auto_696611 - BLOCK
      ?auto_696612 - BLOCK
      ?auto_696613 - BLOCK
    )
    :vars
    (
      ?auto_696614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696613 ?auto_696614 ) ( ON-TABLE ?auto_696603 ) ( ON ?auto_696604 ?auto_696603 ) ( ON ?auto_696605 ?auto_696604 ) ( ON ?auto_696606 ?auto_696605 ) ( ON ?auto_696607 ?auto_696606 ) ( ON ?auto_696608 ?auto_696607 ) ( ON ?auto_696609 ?auto_696608 ) ( ON ?auto_696610 ?auto_696609 ) ( ON ?auto_696611 ?auto_696610 ) ( not ( = ?auto_696603 ?auto_696604 ) ) ( not ( = ?auto_696603 ?auto_696605 ) ) ( not ( = ?auto_696603 ?auto_696606 ) ) ( not ( = ?auto_696603 ?auto_696607 ) ) ( not ( = ?auto_696603 ?auto_696608 ) ) ( not ( = ?auto_696603 ?auto_696609 ) ) ( not ( = ?auto_696603 ?auto_696610 ) ) ( not ( = ?auto_696603 ?auto_696611 ) ) ( not ( = ?auto_696603 ?auto_696612 ) ) ( not ( = ?auto_696603 ?auto_696613 ) ) ( not ( = ?auto_696603 ?auto_696614 ) ) ( not ( = ?auto_696604 ?auto_696605 ) ) ( not ( = ?auto_696604 ?auto_696606 ) ) ( not ( = ?auto_696604 ?auto_696607 ) ) ( not ( = ?auto_696604 ?auto_696608 ) ) ( not ( = ?auto_696604 ?auto_696609 ) ) ( not ( = ?auto_696604 ?auto_696610 ) ) ( not ( = ?auto_696604 ?auto_696611 ) ) ( not ( = ?auto_696604 ?auto_696612 ) ) ( not ( = ?auto_696604 ?auto_696613 ) ) ( not ( = ?auto_696604 ?auto_696614 ) ) ( not ( = ?auto_696605 ?auto_696606 ) ) ( not ( = ?auto_696605 ?auto_696607 ) ) ( not ( = ?auto_696605 ?auto_696608 ) ) ( not ( = ?auto_696605 ?auto_696609 ) ) ( not ( = ?auto_696605 ?auto_696610 ) ) ( not ( = ?auto_696605 ?auto_696611 ) ) ( not ( = ?auto_696605 ?auto_696612 ) ) ( not ( = ?auto_696605 ?auto_696613 ) ) ( not ( = ?auto_696605 ?auto_696614 ) ) ( not ( = ?auto_696606 ?auto_696607 ) ) ( not ( = ?auto_696606 ?auto_696608 ) ) ( not ( = ?auto_696606 ?auto_696609 ) ) ( not ( = ?auto_696606 ?auto_696610 ) ) ( not ( = ?auto_696606 ?auto_696611 ) ) ( not ( = ?auto_696606 ?auto_696612 ) ) ( not ( = ?auto_696606 ?auto_696613 ) ) ( not ( = ?auto_696606 ?auto_696614 ) ) ( not ( = ?auto_696607 ?auto_696608 ) ) ( not ( = ?auto_696607 ?auto_696609 ) ) ( not ( = ?auto_696607 ?auto_696610 ) ) ( not ( = ?auto_696607 ?auto_696611 ) ) ( not ( = ?auto_696607 ?auto_696612 ) ) ( not ( = ?auto_696607 ?auto_696613 ) ) ( not ( = ?auto_696607 ?auto_696614 ) ) ( not ( = ?auto_696608 ?auto_696609 ) ) ( not ( = ?auto_696608 ?auto_696610 ) ) ( not ( = ?auto_696608 ?auto_696611 ) ) ( not ( = ?auto_696608 ?auto_696612 ) ) ( not ( = ?auto_696608 ?auto_696613 ) ) ( not ( = ?auto_696608 ?auto_696614 ) ) ( not ( = ?auto_696609 ?auto_696610 ) ) ( not ( = ?auto_696609 ?auto_696611 ) ) ( not ( = ?auto_696609 ?auto_696612 ) ) ( not ( = ?auto_696609 ?auto_696613 ) ) ( not ( = ?auto_696609 ?auto_696614 ) ) ( not ( = ?auto_696610 ?auto_696611 ) ) ( not ( = ?auto_696610 ?auto_696612 ) ) ( not ( = ?auto_696610 ?auto_696613 ) ) ( not ( = ?auto_696610 ?auto_696614 ) ) ( not ( = ?auto_696611 ?auto_696612 ) ) ( not ( = ?auto_696611 ?auto_696613 ) ) ( not ( = ?auto_696611 ?auto_696614 ) ) ( not ( = ?auto_696612 ?auto_696613 ) ) ( not ( = ?auto_696612 ?auto_696614 ) ) ( not ( = ?auto_696613 ?auto_696614 ) ) ( CLEAR ?auto_696611 ) ( ON ?auto_696612 ?auto_696613 ) ( CLEAR ?auto_696612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_696603 ?auto_696604 ?auto_696605 ?auto_696606 ?auto_696607 ?auto_696608 ?auto_696609 ?auto_696610 ?auto_696611 ?auto_696612 )
      ( MAKE-11PILE ?auto_696603 ?auto_696604 ?auto_696605 ?auto_696606 ?auto_696607 ?auto_696608 ?auto_696609 ?auto_696610 ?auto_696611 ?auto_696612 ?auto_696613 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_696649 - BLOCK
      ?auto_696650 - BLOCK
      ?auto_696651 - BLOCK
      ?auto_696652 - BLOCK
      ?auto_696653 - BLOCK
      ?auto_696654 - BLOCK
      ?auto_696655 - BLOCK
      ?auto_696656 - BLOCK
      ?auto_696657 - BLOCK
      ?auto_696658 - BLOCK
      ?auto_696659 - BLOCK
    )
    :vars
    (
      ?auto_696660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696659 ?auto_696660 ) ( ON-TABLE ?auto_696649 ) ( ON ?auto_696650 ?auto_696649 ) ( ON ?auto_696651 ?auto_696650 ) ( ON ?auto_696652 ?auto_696651 ) ( ON ?auto_696653 ?auto_696652 ) ( ON ?auto_696654 ?auto_696653 ) ( ON ?auto_696655 ?auto_696654 ) ( ON ?auto_696656 ?auto_696655 ) ( not ( = ?auto_696649 ?auto_696650 ) ) ( not ( = ?auto_696649 ?auto_696651 ) ) ( not ( = ?auto_696649 ?auto_696652 ) ) ( not ( = ?auto_696649 ?auto_696653 ) ) ( not ( = ?auto_696649 ?auto_696654 ) ) ( not ( = ?auto_696649 ?auto_696655 ) ) ( not ( = ?auto_696649 ?auto_696656 ) ) ( not ( = ?auto_696649 ?auto_696657 ) ) ( not ( = ?auto_696649 ?auto_696658 ) ) ( not ( = ?auto_696649 ?auto_696659 ) ) ( not ( = ?auto_696649 ?auto_696660 ) ) ( not ( = ?auto_696650 ?auto_696651 ) ) ( not ( = ?auto_696650 ?auto_696652 ) ) ( not ( = ?auto_696650 ?auto_696653 ) ) ( not ( = ?auto_696650 ?auto_696654 ) ) ( not ( = ?auto_696650 ?auto_696655 ) ) ( not ( = ?auto_696650 ?auto_696656 ) ) ( not ( = ?auto_696650 ?auto_696657 ) ) ( not ( = ?auto_696650 ?auto_696658 ) ) ( not ( = ?auto_696650 ?auto_696659 ) ) ( not ( = ?auto_696650 ?auto_696660 ) ) ( not ( = ?auto_696651 ?auto_696652 ) ) ( not ( = ?auto_696651 ?auto_696653 ) ) ( not ( = ?auto_696651 ?auto_696654 ) ) ( not ( = ?auto_696651 ?auto_696655 ) ) ( not ( = ?auto_696651 ?auto_696656 ) ) ( not ( = ?auto_696651 ?auto_696657 ) ) ( not ( = ?auto_696651 ?auto_696658 ) ) ( not ( = ?auto_696651 ?auto_696659 ) ) ( not ( = ?auto_696651 ?auto_696660 ) ) ( not ( = ?auto_696652 ?auto_696653 ) ) ( not ( = ?auto_696652 ?auto_696654 ) ) ( not ( = ?auto_696652 ?auto_696655 ) ) ( not ( = ?auto_696652 ?auto_696656 ) ) ( not ( = ?auto_696652 ?auto_696657 ) ) ( not ( = ?auto_696652 ?auto_696658 ) ) ( not ( = ?auto_696652 ?auto_696659 ) ) ( not ( = ?auto_696652 ?auto_696660 ) ) ( not ( = ?auto_696653 ?auto_696654 ) ) ( not ( = ?auto_696653 ?auto_696655 ) ) ( not ( = ?auto_696653 ?auto_696656 ) ) ( not ( = ?auto_696653 ?auto_696657 ) ) ( not ( = ?auto_696653 ?auto_696658 ) ) ( not ( = ?auto_696653 ?auto_696659 ) ) ( not ( = ?auto_696653 ?auto_696660 ) ) ( not ( = ?auto_696654 ?auto_696655 ) ) ( not ( = ?auto_696654 ?auto_696656 ) ) ( not ( = ?auto_696654 ?auto_696657 ) ) ( not ( = ?auto_696654 ?auto_696658 ) ) ( not ( = ?auto_696654 ?auto_696659 ) ) ( not ( = ?auto_696654 ?auto_696660 ) ) ( not ( = ?auto_696655 ?auto_696656 ) ) ( not ( = ?auto_696655 ?auto_696657 ) ) ( not ( = ?auto_696655 ?auto_696658 ) ) ( not ( = ?auto_696655 ?auto_696659 ) ) ( not ( = ?auto_696655 ?auto_696660 ) ) ( not ( = ?auto_696656 ?auto_696657 ) ) ( not ( = ?auto_696656 ?auto_696658 ) ) ( not ( = ?auto_696656 ?auto_696659 ) ) ( not ( = ?auto_696656 ?auto_696660 ) ) ( not ( = ?auto_696657 ?auto_696658 ) ) ( not ( = ?auto_696657 ?auto_696659 ) ) ( not ( = ?auto_696657 ?auto_696660 ) ) ( not ( = ?auto_696658 ?auto_696659 ) ) ( not ( = ?auto_696658 ?auto_696660 ) ) ( not ( = ?auto_696659 ?auto_696660 ) ) ( ON ?auto_696658 ?auto_696659 ) ( CLEAR ?auto_696656 ) ( ON ?auto_696657 ?auto_696658 ) ( CLEAR ?auto_696657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_696649 ?auto_696650 ?auto_696651 ?auto_696652 ?auto_696653 ?auto_696654 ?auto_696655 ?auto_696656 ?auto_696657 )
      ( MAKE-11PILE ?auto_696649 ?auto_696650 ?auto_696651 ?auto_696652 ?auto_696653 ?auto_696654 ?auto_696655 ?auto_696656 ?auto_696657 ?auto_696658 ?auto_696659 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_696695 - BLOCK
      ?auto_696696 - BLOCK
      ?auto_696697 - BLOCK
      ?auto_696698 - BLOCK
      ?auto_696699 - BLOCK
      ?auto_696700 - BLOCK
      ?auto_696701 - BLOCK
      ?auto_696702 - BLOCK
      ?auto_696703 - BLOCK
      ?auto_696704 - BLOCK
      ?auto_696705 - BLOCK
    )
    :vars
    (
      ?auto_696706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696705 ?auto_696706 ) ( ON-TABLE ?auto_696695 ) ( ON ?auto_696696 ?auto_696695 ) ( ON ?auto_696697 ?auto_696696 ) ( ON ?auto_696698 ?auto_696697 ) ( ON ?auto_696699 ?auto_696698 ) ( ON ?auto_696700 ?auto_696699 ) ( ON ?auto_696701 ?auto_696700 ) ( not ( = ?auto_696695 ?auto_696696 ) ) ( not ( = ?auto_696695 ?auto_696697 ) ) ( not ( = ?auto_696695 ?auto_696698 ) ) ( not ( = ?auto_696695 ?auto_696699 ) ) ( not ( = ?auto_696695 ?auto_696700 ) ) ( not ( = ?auto_696695 ?auto_696701 ) ) ( not ( = ?auto_696695 ?auto_696702 ) ) ( not ( = ?auto_696695 ?auto_696703 ) ) ( not ( = ?auto_696695 ?auto_696704 ) ) ( not ( = ?auto_696695 ?auto_696705 ) ) ( not ( = ?auto_696695 ?auto_696706 ) ) ( not ( = ?auto_696696 ?auto_696697 ) ) ( not ( = ?auto_696696 ?auto_696698 ) ) ( not ( = ?auto_696696 ?auto_696699 ) ) ( not ( = ?auto_696696 ?auto_696700 ) ) ( not ( = ?auto_696696 ?auto_696701 ) ) ( not ( = ?auto_696696 ?auto_696702 ) ) ( not ( = ?auto_696696 ?auto_696703 ) ) ( not ( = ?auto_696696 ?auto_696704 ) ) ( not ( = ?auto_696696 ?auto_696705 ) ) ( not ( = ?auto_696696 ?auto_696706 ) ) ( not ( = ?auto_696697 ?auto_696698 ) ) ( not ( = ?auto_696697 ?auto_696699 ) ) ( not ( = ?auto_696697 ?auto_696700 ) ) ( not ( = ?auto_696697 ?auto_696701 ) ) ( not ( = ?auto_696697 ?auto_696702 ) ) ( not ( = ?auto_696697 ?auto_696703 ) ) ( not ( = ?auto_696697 ?auto_696704 ) ) ( not ( = ?auto_696697 ?auto_696705 ) ) ( not ( = ?auto_696697 ?auto_696706 ) ) ( not ( = ?auto_696698 ?auto_696699 ) ) ( not ( = ?auto_696698 ?auto_696700 ) ) ( not ( = ?auto_696698 ?auto_696701 ) ) ( not ( = ?auto_696698 ?auto_696702 ) ) ( not ( = ?auto_696698 ?auto_696703 ) ) ( not ( = ?auto_696698 ?auto_696704 ) ) ( not ( = ?auto_696698 ?auto_696705 ) ) ( not ( = ?auto_696698 ?auto_696706 ) ) ( not ( = ?auto_696699 ?auto_696700 ) ) ( not ( = ?auto_696699 ?auto_696701 ) ) ( not ( = ?auto_696699 ?auto_696702 ) ) ( not ( = ?auto_696699 ?auto_696703 ) ) ( not ( = ?auto_696699 ?auto_696704 ) ) ( not ( = ?auto_696699 ?auto_696705 ) ) ( not ( = ?auto_696699 ?auto_696706 ) ) ( not ( = ?auto_696700 ?auto_696701 ) ) ( not ( = ?auto_696700 ?auto_696702 ) ) ( not ( = ?auto_696700 ?auto_696703 ) ) ( not ( = ?auto_696700 ?auto_696704 ) ) ( not ( = ?auto_696700 ?auto_696705 ) ) ( not ( = ?auto_696700 ?auto_696706 ) ) ( not ( = ?auto_696701 ?auto_696702 ) ) ( not ( = ?auto_696701 ?auto_696703 ) ) ( not ( = ?auto_696701 ?auto_696704 ) ) ( not ( = ?auto_696701 ?auto_696705 ) ) ( not ( = ?auto_696701 ?auto_696706 ) ) ( not ( = ?auto_696702 ?auto_696703 ) ) ( not ( = ?auto_696702 ?auto_696704 ) ) ( not ( = ?auto_696702 ?auto_696705 ) ) ( not ( = ?auto_696702 ?auto_696706 ) ) ( not ( = ?auto_696703 ?auto_696704 ) ) ( not ( = ?auto_696703 ?auto_696705 ) ) ( not ( = ?auto_696703 ?auto_696706 ) ) ( not ( = ?auto_696704 ?auto_696705 ) ) ( not ( = ?auto_696704 ?auto_696706 ) ) ( not ( = ?auto_696705 ?auto_696706 ) ) ( ON ?auto_696704 ?auto_696705 ) ( ON ?auto_696703 ?auto_696704 ) ( CLEAR ?auto_696701 ) ( ON ?auto_696702 ?auto_696703 ) ( CLEAR ?auto_696702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_696695 ?auto_696696 ?auto_696697 ?auto_696698 ?auto_696699 ?auto_696700 ?auto_696701 ?auto_696702 )
      ( MAKE-11PILE ?auto_696695 ?auto_696696 ?auto_696697 ?auto_696698 ?auto_696699 ?auto_696700 ?auto_696701 ?auto_696702 ?auto_696703 ?auto_696704 ?auto_696705 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_696741 - BLOCK
      ?auto_696742 - BLOCK
      ?auto_696743 - BLOCK
      ?auto_696744 - BLOCK
      ?auto_696745 - BLOCK
      ?auto_696746 - BLOCK
      ?auto_696747 - BLOCK
      ?auto_696748 - BLOCK
      ?auto_696749 - BLOCK
      ?auto_696750 - BLOCK
      ?auto_696751 - BLOCK
    )
    :vars
    (
      ?auto_696752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696751 ?auto_696752 ) ( ON-TABLE ?auto_696741 ) ( ON ?auto_696742 ?auto_696741 ) ( ON ?auto_696743 ?auto_696742 ) ( ON ?auto_696744 ?auto_696743 ) ( ON ?auto_696745 ?auto_696744 ) ( ON ?auto_696746 ?auto_696745 ) ( not ( = ?auto_696741 ?auto_696742 ) ) ( not ( = ?auto_696741 ?auto_696743 ) ) ( not ( = ?auto_696741 ?auto_696744 ) ) ( not ( = ?auto_696741 ?auto_696745 ) ) ( not ( = ?auto_696741 ?auto_696746 ) ) ( not ( = ?auto_696741 ?auto_696747 ) ) ( not ( = ?auto_696741 ?auto_696748 ) ) ( not ( = ?auto_696741 ?auto_696749 ) ) ( not ( = ?auto_696741 ?auto_696750 ) ) ( not ( = ?auto_696741 ?auto_696751 ) ) ( not ( = ?auto_696741 ?auto_696752 ) ) ( not ( = ?auto_696742 ?auto_696743 ) ) ( not ( = ?auto_696742 ?auto_696744 ) ) ( not ( = ?auto_696742 ?auto_696745 ) ) ( not ( = ?auto_696742 ?auto_696746 ) ) ( not ( = ?auto_696742 ?auto_696747 ) ) ( not ( = ?auto_696742 ?auto_696748 ) ) ( not ( = ?auto_696742 ?auto_696749 ) ) ( not ( = ?auto_696742 ?auto_696750 ) ) ( not ( = ?auto_696742 ?auto_696751 ) ) ( not ( = ?auto_696742 ?auto_696752 ) ) ( not ( = ?auto_696743 ?auto_696744 ) ) ( not ( = ?auto_696743 ?auto_696745 ) ) ( not ( = ?auto_696743 ?auto_696746 ) ) ( not ( = ?auto_696743 ?auto_696747 ) ) ( not ( = ?auto_696743 ?auto_696748 ) ) ( not ( = ?auto_696743 ?auto_696749 ) ) ( not ( = ?auto_696743 ?auto_696750 ) ) ( not ( = ?auto_696743 ?auto_696751 ) ) ( not ( = ?auto_696743 ?auto_696752 ) ) ( not ( = ?auto_696744 ?auto_696745 ) ) ( not ( = ?auto_696744 ?auto_696746 ) ) ( not ( = ?auto_696744 ?auto_696747 ) ) ( not ( = ?auto_696744 ?auto_696748 ) ) ( not ( = ?auto_696744 ?auto_696749 ) ) ( not ( = ?auto_696744 ?auto_696750 ) ) ( not ( = ?auto_696744 ?auto_696751 ) ) ( not ( = ?auto_696744 ?auto_696752 ) ) ( not ( = ?auto_696745 ?auto_696746 ) ) ( not ( = ?auto_696745 ?auto_696747 ) ) ( not ( = ?auto_696745 ?auto_696748 ) ) ( not ( = ?auto_696745 ?auto_696749 ) ) ( not ( = ?auto_696745 ?auto_696750 ) ) ( not ( = ?auto_696745 ?auto_696751 ) ) ( not ( = ?auto_696745 ?auto_696752 ) ) ( not ( = ?auto_696746 ?auto_696747 ) ) ( not ( = ?auto_696746 ?auto_696748 ) ) ( not ( = ?auto_696746 ?auto_696749 ) ) ( not ( = ?auto_696746 ?auto_696750 ) ) ( not ( = ?auto_696746 ?auto_696751 ) ) ( not ( = ?auto_696746 ?auto_696752 ) ) ( not ( = ?auto_696747 ?auto_696748 ) ) ( not ( = ?auto_696747 ?auto_696749 ) ) ( not ( = ?auto_696747 ?auto_696750 ) ) ( not ( = ?auto_696747 ?auto_696751 ) ) ( not ( = ?auto_696747 ?auto_696752 ) ) ( not ( = ?auto_696748 ?auto_696749 ) ) ( not ( = ?auto_696748 ?auto_696750 ) ) ( not ( = ?auto_696748 ?auto_696751 ) ) ( not ( = ?auto_696748 ?auto_696752 ) ) ( not ( = ?auto_696749 ?auto_696750 ) ) ( not ( = ?auto_696749 ?auto_696751 ) ) ( not ( = ?auto_696749 ?auto_696752 ) ) ( not ( = ?auto_696750 ?auto_696751 ) ) ( not ( = ?auto_696750 ?auto_696752 ) ) ( not ( = ?auto_696751 ?auto_696752 ) ) ( ON ?auto_696750 ?auto_696751 ) ( ON ?auto_696749 ?auto_696750 ) ( ON ?auto_696748 ?auto_696749 ) ( CLEAR ?auto_696746 ) ( ON ?auto_696747 ?auto_696748 ) ( CLEAR ?auto_696747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_696741 ?auto_696742 ?auto_696743 ?auto_696744 ?auto_696745 ?auto_696746 ?auto_696747 )
      ( MAKE-11PILE ?auto_696741 ?auto_696742 ?auto_696743 ?auto_696744 ?auto_696745 ?auto_696746 ?auto_696747 ?auto_696748 ?auto_696749 ?auto_696750 ?auto_696751 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_696787 - BLOCK
      ?auto_696788 - BLOCK
      ?auto_696789 - BLOCK
      ?auto_696790 - BLOCK
      ?auto_696791 - BLOCK
      ?auto_696792 - BLOCK
      ?auto_696793 - BLOCK
      ?auto_696794 - BLOCK
      ?auto_696795 - BLOCK
      ?auto_696796 - BLOCK
      ?auto_696797 - BLOCK
    )
    :vars
    (
      ?auto_696798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696797 ?auto_696798 ) ( ON-TABLE ?auto_696787 ) ( ON ?auto_696788 ?auto_696787 ) ( ON ?auto_696789 ?auto_696788 ) ( ON ?auto_696790 ?auto_696789 ) ( ON ?auto_696791 ?auto_696790 ) ( not ( = ?auto_696787 ?auto_696788 ) ) ( not ( = ?auto_696787 ?auto_696789 ) ) ( not ( = ?auto_696787 ?auto_696790 ) ) ( not ( = ?auto_696787 ?auto_696791 ) ) ( not ( = ?auto_696787 ?auto_696792 ) ) ( not ( = ?auto_696787 ?auto_696793 ) ) ( not ( = ?auto_696787 ?auto_696794 ) ) ( not ( = ?auto_696787 ?auto_696795 ) ) ( not ( = ?auto_696787 ?auto_696796 ) ) ( not ( = ?auto_696787 ?auto_696797 ) ) ( not ( = ?auto_696787 ?auto_696798 ) ) ( not ( = ?auto_696788 ?auto_696789 ) ) ( not ( = ?auto_696788 ?auto_696790 ) ) ( not ( = ?auto_696788 ?auto_696791 ) ) ( not ( = ?auto_696788 ?auto_696792 ) ) ( not ( = ?auto_696788 ?auto_696793 ) ) ( not ( = ?auto_696788 ?auto_696794 ) ) ( not ( = ?auto_696788 ?auto_696795 ) ) ( not ( = ?auto_696788 ?auto_696796 ) ) ( not ( = ?auto_696788 ?auto_696797 ) ) ( not ( = ?auto_696788 ?auto_696798 ) ) ( not ( = ?auto_696789 ?auto_696790 ) ) ( not ( = ?auto_696789 ?auto_696791 ) ) ( not ( = ?auto_696789 ?auto_696792 ) ) ( not ( = ?auto_696789 ?auto_696793 ) ) ( not ( = ?auto_696789 ?auto_696794 ) ) ( not ( = ?auto_696789 ?auto_696795 ) ) ( not ( = ?auto_696789 ?auto_696796 ) ) ( not ( = ?auto_696789 ?auto_696797 ) ) ( not ( = ?auto_696789 ?auto_696798 ) ) ( not ( = ?auto_696790 ?auto_696791 ) ) ( not ( = ?auto_696790 ?auto_696792 ) ) ( not ( = ?auto_696790 ?auto_696793 ) ) ( not ( = ?auto_696790 ?auto_696794 ) ) ( not ( = ?auto_696790 ?auto_696795 ) ) ( not ( = ?auto_696790 ?auto_696796 ) ) ( not ( = ?auto_696790 ?auto_696797 ) ) ( not ( = ?auto_696790 ?auto_696798 ) ) ( not ( = ?auto_696791 ?auto_696792 ) ) ( not ( = ?auto_696791 ?auto_696793 ) ) ( not ( = ?auto_696791 ?auto_696794 ) ) ( not ( = ?auto_696791 ?auto_696795 ) ) ( not ( = ?auto_696791 ?auto_696796 ) ) ( not ( = ?auto_696791 ?auto_696797 ) ) ( not ( = ?auto_696791 ?auto_696798 ) ) ( not ( = ?auto_696792 ?auto_696793 ) ) ( not ( = ?auto_696792 ?auto_696794 ) ) ( not ( = ?auto_696792 ?auto_696795 ) ) ( not ( = ?auto_696792 ?auto_696796 ) ) ( not ( = ?auto_696792 ?auto_696797 ) ) ( not ( = ?auto_696792 ?auto_696798 ) ) ( not ( = ?auto_696793 ?auto_696794 ) ) ( not ( = ?auto_696793 ?auto_696795 ) ) ( not ( = ?auto_696793 ?auto_696796 ) ) ( not ( = ?auto_696793 ?auto_696797 ) ) ( not ( = ?auto_696793 ?auto_696798 ) ) ( not ( = ?auto_696794 ?auto_696795 ) ) ( not ( = ?auto_696794 ?auto_696796 ) ) ( not ( = ?auto_696794 ?auto_696797 ) ) ( not ( = ?auto_696794 ?auto_696798 ) ) ( not ( = ?auto_696795 ?auto_696796 ) ) ( not ( = ?auto_696795 ?auto_696797 ) ) ( not ( = ?auto_696795 ?auto_696798 ) ) ( not ( = ?auto_696796 ?auto_696797 ) ) ( not ( = ?auto_696796 ?auto_696798 ) ) ( not ( = ?auto_696797 ?auto_696798 ) ) ( ON ?auto_696796 ?auto_696797 ) ( ON ?auto_696795 ?auto_696796 ) ( ON ?auto_696794 ?auto_696795 ) ( ON ?auto_696793 ?auto_696794 ) ( CLEAR ?auto_696791 ) ( ON ?auto_696792 ?auto_696793 ) ( CLEAR ?auto_696792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_696787 ?auto_696788 ?auto_696789 ?auto_696790 ?auto_696791 ?auto_696792 )
      ( MAKE-11PILE ?auto_696787 ?auto_696788 ?auto_696789 ?auto_696790 ?auto_696791 ?auto_696792 ?auto_696793 ?auto_696794 ?auto_696795 ?auto_696796 ?auto_696797 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_696833 - BLOCK
      ?auto_696834 - BLOCK
      ?auto_696835 - BLOCK
      ?auto_696836 - BLOCK
      ?auto_696837 - BLOCK
      ?auto_696838 - BLOCK
      ?auto_696839 - BLOCK
      ?auto_696840 - BLOCK
      ?auto_696841 - BLOCK
      ?auto_696842 - BLOCK
      ?auto_696843 - BLOCK
    )
    :vars
    (
      ?auto_696844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696843 ?auto_696844 ) ( ON-TABLE ?auto_696833 ) ( ON ?auto_696834 ?auto_696833 ) ( ON ?auto_696835 ?auto_696834 ) ( ON ?auto_696836 ?auto_696835 ) ( not ( = ?auto_696833 ?auto_696834 ) ) ( not ( = ?auto_696833 ?auto_696835 ) ) ( not ( = ?auto_696833 ?auto_696836 ) ) ( not ( = ?auto_696833 ?auto_696837 ) ) ( not ( = ?auto_696833 ?auto_696838 ) ) ( not ( = ?auto_696833 ?auto_696839 ) ) ( not ( = ?auto_696833 ?auto_696840 ) ) ( not ( = ?auto_696833 ?auto_696841 ) ) ( not ( = ?auto_696833 ?auto_696842 ) ) ( not ( = ?auto_696833 ?auto_696843 ) ) ( not ( = ?auto_696833 ?auto_696844 ) ) ( not ( = ?auto_696834 ?auto_696835 ) ) ( not ( = ?auto_696834 ?auto_696836 ) ) ( not ( = ?auto_696834 ?auto_696837 ) ) ( not ( = ?auto_696834 ?auto_696838 ) ) ( not ( = ?auto_696834 ?auto_696839 ) ) ( not ( = ?auto_696834 ?auto_696840 ) ) ( not ( = ?auto_696834 ?auto_696841 ) ) ( not ( = ?auto_696834 ?auto_696842 ) ) ( not ( = ?auto_696834 ?auto_696843 ) ) ( not ( = ?auto_696834 ?auto_696844 ) ) ( not ( = ?auto_696835 ?auto_696836 ) ) ( not ( = ?auto_696835 ?auto_696837 ) ) ( not ( = ?auto_696835 ?auto_696838 ) ) ( not ( = ?auto_696835 ?auto_696839 ) ) ( not ( = ?auto_696835 ?auto_696840 ) ) ( not ( = ?auto_696835 ?auto_696841 ) ) ( not ( = ?auto_696835 ?auto_696842 ) ) ( not ( = ?auto_696835 ?auto_696843 ) ) ( not ( = ?auto_696835 ?auto_696844 ) ) ( not ( = ?auto_696836 ?auto_696837 ) ) ( not ( = ?auto_696836 ?auto_696838 ) ) ( not ( = ?auto_696836 ?auto_696839 ) ) ( not ( = ?auto_696836 ?auto_696840 ) ) ( not ( = ?auto_696836 ?auto_696841 ) ) ( not ( = ?auto_696836 ?auto_696842 ) ) ( not ( = ?auto_696836 ?auto_696843 ) ) ( not ( = ?auto_696836 ?auto_696844 ) ) ( not ( = ?auto_696837 ?auto_696838 ) ) ( not ( = ?auto_696837 ?auto_696839 ) ) ( not ( = ?auto_696837 ?auto_696840 ) ) ( not ( = ?auto_696837 ?auto_696841 ) ) ( not ( = ?auto_696837 ?auto_696842 ) ) ( not ( = ?auto_696837 ?auto_696843 ) ) ( not ( = ?auto_696837 ?auto_696844 ) ) ( not ( = ?auto_696838 ?auto_696839 ) ) ( not ( = ?auto_696838 ?auto_696840 ) ) ( not ( = ?auto_696838 ?auto_696841 ) ) ( not ( = ?auto_696838 ?auto_696842 ) ) ( not ( = ?auto_696838 ?auto_696843 ) ) ( not ( = ?auto_696838 ?auto_696844 ) ) ( not ( = ?auto_696839 ?auto_696840 ) ) ( not ( = ?auto_696839 ?auto_696841 ) ) ( not ( = ?auto_696839 ?auto_696842 ) ) ( not ( = ?auto_696839 ?auto_696843 ) ) ( not ( = ?auto_696839 ?auto_696844 ) ) ( not ( = ?auto_696840 ?auto_696841 ) ) ( not ( = ?auto_696840 ?auto_696842 ) ) ( not ( = ?auto_696840 ?auto_696843 ) ) ( not ( = ?auto_696840 ?auto_696844 ) ) ( not ( = ?auto_696841 ?auto_696842 ) ) ( not ( = ?auto_696841 ?auto_696843 ) ) ( not ( = ?auto_696841 ?auto_696844 ) ) ( not ( = ?auto_696842 ?auto_696843 ) ) ( not ( = ?auto_696842 ?auto_696844 ) ) ( not ( = ?auto_696843 ?auto_696844 ) ) ( ON ?auto_696842 ?auto_696843 ) ( ON ?auto_696841 ?auto_696842 ) ( ON ?auto_696840 ?auto_696841 ) ( ON ?auto_696839 ?auto_696840 ) ( ON ?auto_696838 ?auto_696839 ) ( CLEAR ?auto_696836 ) ( ON ?auto_696837 ?auto_696838 ) ( CLEAR ?auto_696837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_696833 ?auto_696834 ?auto_696835 ?auto_696836 ?auto_696837 )
      ( MAKE-11PILE ?auto_696833 ?auto_696834 ?auto_696835 ?auto_696836 ?auto_696837 ?auto_696838 ?auto_696839 ?auto_696840 ?auto_696841 ?auto_696842 ?auto_696843 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_696879 - BLOCK
      ?auto_696880 - BLOCK
      ?auto_696881 - BLOCK
      ?auto_696882 - BLOCK
      ?auto_696883 - BLOCK
      ?auto_696884 - BLOCK
      ?auto_696885 - BLOCK
      ?auto_696886 - BLOCK
      ?auto_696887 - BLOCK
      ?auto_696888 - BLOCK
      ?auto_696889 - BLOCK
    )
    :vars
    (
      ?auto_696890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696889 ?auto_696890 ) ( ON-TABLE ?auto_696879 ) ( ON ?auto_696880 ?auto_696879 ) ( ON ?auto_696881 ?auto_696880 ) ( not ( = ?auto_696879 ?auto_696880 ) ) ( not ( = ?auto_696879 ?auto_696881 ) ) ( not ( = ?auto_696879 ?auto_696882 ) ) ( not ( = ?auto_696879 ?auto_696883 ) ) ( not ( = ?auto_696879 ?auto_696884 ) ) ( not ( = ?auto_696879 ?auto_696885 ) ) ( not ( = ?auto_696879 ?auto_696886 ) ) ( not ( = ?auto_696879 ?auto_696887 ) ) ( not ( = ?auto_696879 ?auto_696888 ) ) ( not ( = ?auto_696879 ?auto_696889 ) ) ( not ( = ?auto_696879 ?auto_696890 ) ) ( not ( = ?auto_696880 ?auto_696881 ) ) ( not ( = ?auto_696880 ?auto_696882 ) ) ( not ( = ?auto_696880 ?auto_696883 ) ) ( not ( = ?auto_696880 ?auto_696884 ) ) ( not ( = ?auto_696880 ?auto_696885 ) ) ( not ( = ?auto_696880 ?auto_696886 ) ) ( not ( = ?auto_696880 ?auto_696887 ) ) ( not ( = ?auto_696880 ?auto_696888 ) ) ( not ( = ?auto_696880 ?auto_696889 ) ) ( not ( = ?auto_696880 ?auto_696890 ) ) ( not ( = ?auto_696881 ?auto_696882 ) ) ( not ( = ?auto_696881 ?auto_696883 ) ) ( not ( = ?auto_696881 ?auto_696884 ) ) ( not ( = ?auto_696881 ?auto_696885 ) ) ( not ( = ?auto_696881 ?auto_696886 ) ) ( not ( = ?auto_696881 ?auto_696887 ) ) ( not ( = ?auto_696881 ?auto_696888 ) ) ( not ( = ?auto_696881 ?auto_696889 ) ) ( not ( = ?auto_696881 ?auto_696890 ) ) ( not ( = ?auto_696882 ?auto_696883 ) ) ( not ( = ?auto_696882 ?auto_696884 ) ) ( not ( = ?auto_696882 ?auto_696885 ) ) ( not ( = ?auto_696882 ?auto_696886 ) ) ( not ( = ?auto_696882 ?auto_696887 ) ) ( not ( = ?auto_696882 ?auto_696888 ) ) ( not ( = ?auto_696882 ?auto_696889 ) ) ( not ( = ?auto_696882 ?auto_696890 ) ) ( not ( = ?auto_696883 ?auto_696884 ) ) ( not ( = ?auto_696883 ?auto_696885 ) ) ( not ( = ?auto_696883 ?auto_696886 ) ) ( not ( = ?auto_696883 ?auto_696887 ) ) ( not ( = ?auto_696883 ?auto_696888 ) ) ( not ( = ?auto_696883 ?auto_696889 ) ) ( not ( = ?auto_696883 ?auto_696890 ) ) ( not ( = ?auto_696884 ?auto_696885 ) ) ( not ( = ?auto_696884 ?auto_696886 ) ) ( not ( = ?auto_696884 ?auto_696887 ) ) ( not ( = ?auto_696884 ?auto_696888 ) ) ( not ( = ?auto_696884 ?auto_696889 ) ) ( not ( = ?auto_696884 ?auto_696890 ) ) ( not ( = ?auto_696885 ?auto_696886 ) ) ( not ( = ?auto_696885 ?auto_696887 ) ) ( not ( = ?auto_696885 ?auto_696888 ) ) ( not ( = ?auto_696885 ?auto_696889 ) ) ( not ( = ?auto_696885 ?auto_696890 ) ) ( not ( = ?auto_696886 ?auto_696887 ) ) ( not ( = ?auto_696886 ?auto_696888 ) ) ( not ( = ?auto_696886 ?auto_696889 ) ) ( not ( = ?auto_696886 ?auto_696890 ) ) ( not ( = ?auto_696887 ?auto_696888 ) ) ( not ( = ?auto_696887 ?auto_696889 ) ) ( not ( = ?auto_696887 ?auto_696890 ) ) ( not ( = ?auto_696888 ?auto_696889 ) ) ( not ( = ?auto_696888 ?auto_696890 ) ) ( not ( = ?auto_696889 ?auto_696890 ) ) ( ON ?auto_696888 ?auto_696889 ) ( ON ?auto_696887 ?auto_696888 ) ( ON ?auto_696886 ?auto_696887 ) ( ON ?auto_696885 ?auto_696886 ) ( ON ?auto_696884 ?auto_696885 ) ( ON ?auto_696883 ?auto_696884 ) ( CLEAR ?auto_696881 ) ( ON ?auto_696882 ?auto_696883 ) ( CLEAR ?auto_696882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_696879 ?auto_696880 ?auto_696881 ?auto_696882 )
      ( MAKE-11PILE ?auto_696879 ?auto_696880 ?auto_696881 ?auto_696882 ?auto_696883 ?auto_696884 ?auto_696885 ?auto_696886 ?auto_696887 ?auto_696888 ?auto_696889 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_696925 - BLOCK
      ?auto_696926 - BLOCK
      ?auto_696927 - BLOCK
      ?auto_696928 - BLOCK
      ?auto_696929 - BLOCK
      ?auto_696930 - BLOCK
      ?auto_696931 - BLOCK
      ?auto_696932 - BLOCK
      ?auto_696933 - BLOCK
      ?auto_696934 - BLOCK
      ?auto_696935 - BLOCK
    )
    :vars
    (
      ?auto_696936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696935 ?auto_696936 ) ( ON-TABLE ?auto_696925 ) ( ON ?auto_696926 ?auto_696925 ) ( not ( = ?auto_696925 ?auto_696926 ) ) ( not ( = ?auto_696925 ?auto_696927 ) ) ( not ( = ?auto_696925 ?auto_696928 ) ) ( not ( = ?auto_696925 ?auto_696929 ) ) ( not ( = ?auto_696925 ?auto_696930 ) ) ( not ( = ?auto_696925 ?auto_696931 ) ) ( not ( = ?auto_696925 ?auto_696932 ) ) ( not ( = ?auto_696925 ?auto_696933 ) ) ( not ( = ?auto_696925 ?auto_696934 ) ) ( not ( = ?auto_696925 ?auto_696935 ) ) ( not ( = ?auto_696925 ?auto_696936 ) ) ( not ( = ?auto_696926 ?auto_696927 ) ) ( not ( = ?auto_696926 ?auto_696928 ) ) ( not ( = ?auto_696926 ?auto_696929 ) ) ( not ( = ?auto_696926 ?auto_696930 ) ) ( not ( = ?auto_696926 ?auto_696931 ) ) ( not ( = ?auto_696926 ?auto_696932 ) ) ( not ( = ?auto_696926 ?auto_696933 ) ) ( not ( = ?auto_696926 ?auto_696934 ) ) ( not ( = ?auto_696926 ?auto_696935 ) ) ( not ( = ?auto_696926 ?auto_696936 ) ) ( not ( = ?auto_696927 ?auto_696928 ) ) ( not ( = ?auto_696927 ?auto_696929 ) ) ( not ( = ?auto_696927 ?auto_696930 ) ) ( not ( = ?auto_696927 ?auto_696931 ) ) ( not ( = ?auto_696927 ?auto_696932 ) ) ( not ( = ?auto_696927 ?auto_696933 ) ) ( not ( = ?auto_696927 ?auto_696934 ) ) ( not ( = ?auto_696927 ?auto_696935 ) ) ( not ( = ?auto_696927 ?auto_696936 ) ) ( not ( = ?auto_696928 ?auto_696929 ) ) ( not ( = ?auto_696928 ?auto_696930 ) ) ( not ( = ?auto_696928 ?auto_696931 ) ) ( not ( = ?auto_696928 ?auto_696932 ) ) ( not ( = ?auto_696928 ?auto_696933 ) ) ( not ( = ?auto_696928 ?auto_696934 ) ) ( not ( = ?auto_696928 ?auto_696935 ) ) ( not ( = ?auto_696928 ?auto_696936 ) ) ( not ( = ?auto_696929 ?auto_696930 ) ) ( not ( = ?auto_696929 ?auto_696931 ) ) ( not ( = ?auto_696929 ?auto_696932 ) ) ( not ( = ?auto_696929 ?auto_696933 ) ) ( not ( = ?auto_696929 ?auto_696934 ) ) ( not ( = ?auto_696929 ?auto_696935 ) ) ( not ( = ?auto_696929 ?auto_696936 ) ) ( not ( = ?auto_696930 ?auto_696931 ) ) ( not ( = ?auto_696930 ?auto_696932 ) ) ( not ( = ?auto_696930 ?auto_696933 ) ) ( not ( = ?auto_696930 ?auto_696934 ) ) ( not ( = ?auto_696930 ?auto_696935 ) ) ( not ( = ?auto_696930 ?auto_696936 ) ) ( not ( = ?auto_696931 ?auto_696932 ) ) ( not ( = ?auto_696931 ?auto_696933 ) ) ( not ( = ?auto_696931 ?auto_696934 ) ) ( not ( = ?auto_696931 ?auto_696935 ) ) ( not ( = ?auto_696931 ?auto_696936 ) ) ( not ( = ?auto_696932 ?auto_696933 ) ) ( not ( = ?auto_696932 ?auto_696934 ) ) ( not ( = ?auto_696932 ?auto_696935 ) ) ( not ( = ?auto_696932 ?auto_696936 ) ) ( not ( = ?auto_696933 ?auto_696934 ) ) ( not ( = ?auto_696933 ?auto_696935 ) ) ( not ( = ?auto_696933 ?auto_696936 ) ) ( not ( = ?auto_696934 ?auto_696935 ) ) ( not ( = ?auto_696934 ?auto_696936 ) ) ( not ( = ?auto_696935 ?auto_696936 ) ) ( ON ?auto_696934 ?auto_696935 ) ( ON ?auto_696933 ?auto_696934 ) ( ON ?auto_696932 ?auto_696933 ) ( ON ?auto_696931 ?auto_696932 ) ( ON ?auto_696930 ?auto_696931 ) ( ON ?auto_696929 ?auto_696930 ) ( ON ?auto_696928 ?auto_696929 ) ( CLEAR ?auto_696926 ) ( ON ?auto_696927 ?auto_696928 ) ( CLEAR ?auto_696927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_696925 ?auto_696926 ?auto_696927 )
      ( MAKE-11PILE ?auto_696925 ?auto_696926 ?auto_696927 ?auto_696928 ?auto_696929 ?auto_696930 ?auto_696931 ?auto_696932 ?auto_696933 ?auto_696934 ?auto_696935 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_696971 - BLOCK
      ?auto_696972 - BLOCK
      ?auto_696973 - BLOCK
      ?auto_696974 - BLOCK
      ?auto_696975 - BLOCK
      ?auto_696976 - BLOCK
      ?auto_696977 - BLOCK
      ?auto_696978 - BLOCK
      ?auto_696979 - BLOCK
      ?auto_696980 - BLOCK
      ?auto_696981 - BLOCK
    )
    :vars
    (
      ?auto_696982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696981 ?auto_696982 ) ( ON-TABLE ?auto_696971 ) ( not ( = ?auto_696971 ?auto_696972 ) ) ( not ( = ?auto_696971 ?auto_696973 ) ) ( not ( = ?auto_696971 ?auto_696974 ) ) ( not ( = ?auto_696971 ?auto_696975 ) ) ( not ( = ?auto_696971 ?auto_696976 ) ) ( not ( = ?auto_696971 ?auto_696977 ) ) ( not ( = ?auto_696971 ?auto_696978 ) ) ( not ( = ?auto_696971 ?auto_696979 ) ) ( not ( = ?auto_696971 ?auto_696980 ) ) ( not ( = ?auto_696971 ?auto_696981 ) ) ( not ( = ?auto_696971 ?auto_696982 ) ) ( not ( = ?auto_696972 ?auto_696973 ) ) ( not ( = ?auto_696972 ?auto_696974 ) ) ( not ( = ?auto_696972 ?auto_696975 ) ) ( not ( = ?auto_696972 ?auto_696976 ) ) ( not ( = ?auto_696972 ?auto_696977 ) ) ( not ( = ?auto_696972 ?auto_696978 ) ) ( not ( = ?auto_696972 ?auto_696979 ) ) ( not ( = ?auto_696972 ?auto_696980 ) ) ( not ( = ?auto_696972 ?auto_696981 ) ) ( not ( = ?auto_696972 ?auto_696982 ) ) ( not ( = ?auto_696973 ?auto_696974 ) ) ( not ( = ?auto_696973 ?auto_696975 ) ) ( not ( = ?auto_696973 ?auto_696976 ) ) ( not ( = ?auto_696973 ?auto_696977 ) ) ( not ( = ?auto_696973 ?auto_696978 ) ) ( not ( = ?auto_696973 ?auto_696979 ) ) ( not ( = ?auto_696973 ?auto_696980 ) ) ( not ( = ?auto_696973 ?auto_696981 ) ) ( not ( = ?auto_696973 ?auto_696982 ) ) ( not ( = ?auto_696974 ?auto_696975 ) ) ( not ( = ?auto_696974 ?auto_696976 ) ) ( not ( = ?auto_696974 ?auto_696977 ) ) ( not ( = ?auto_696974 ?auto_696978 ) ) ( not ( = ?auto_696974 ?auto_696979 ) ) ( not ( = ?auto_696974 ?auto_696980 ) ) ( not ( = ?auto_696974 ?auto_696981 ) ) ( not ( = ?auto_696974 ?auto_696982 ) ) ( not ( = ?auto_696975 ?auto_696976 ) ) ( not ( = ?auto_696975 ?auto_696977 ) ) ( not ( = ?auto_696975 ?auto_696978 ) ) ( not ( = ?auto_696975 ?auto_696979 ) ) ( not ( = ?auto_696975 ?auto_696980 ) ) ( not ( = ?auto_696975 ?auto_696981 ) ) ( not ( = ?auto_696975 ?auto_696982 ) ) ( not ( = ?auto_696976 ?auto_696977 ) ) ( not ( = ?auto_696976 ?auto_696978 ) ) ( not ( = ?auto_696976 ?auto_696979 ) ) ( not ( = ?auto_696976 ?auto_696980 ) ) ( not ( = ?auto_696976 ?auto_696981 ) ) ( not ( = ?auto_696976 ?auto_696982 ) ) ( not ( = ?auto_696977 ?auto_696978 ) ) ( not ( = ?auto_696977 ?auto_696979 ) ) ( not ( = ?auto_696977 ?auto_696980 ) ) ( not ( = ?auto_696977 ?auto_696981 ) ) ( not ( = ?auto_696977 ?auto_696982 ) ) ( not ( = ?auto_696978 ?auto_696979 ) ) ( not ( = ?auto_696978 ?auto_696980 ) ) ( not ( = ?auto_696978 ?auto_696981 ) ) ( not ( = ?auto_696978 ?auto_696982 ) ) ( not ( = ?auto_696979 ?auto_696980 ) ) ( not ( = ?auto_696979 ?auto_696981 ) ) ( not ( = ?auto_696979 ?auto_696982 ) ) ( not ( = ?auto_696980 ?auto_696981 ) ) ( not ( = ?auto_696980 ?auto_696982 ) ) ( not ( = ?auto_696981 ?auto_696982 ) ) ( ON ?auto_696980 ?auto_696981 ) ( ON ?auto_696979 ?auto_696980 ) ( ON ?auto_696978 ?auto_696979 ) ( ON ?auto_696977 ?auto_696978 ) ( ON ?auto_696976 ?auto_696977 ) ( ON ?auto_696975 ?auto_696976 ) ( ON ?auto_696974 ?auto_696975 ) ( ON ?auto_696973 ?auto_696974 ) ( CLEAR ?auto_696971 ) ( ON ?auto_696972 ?auto_696973 ) ( CLEAR ?auto_696972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_696971 ?auto_696972 )
      ( MAKE-11PILE ?auto_696971 ?auto_696972 ?auto_696973 ?auto_696974 ?auto_696975 ?auto_696976 ?auto_696977 ?auto_696978 ?auto_696979 ?auto_696980 ?auto_696981 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_697017 - BLOCK
      ?auto_697018 - BLOCK
      ?auto_697019 - BLOCK
      ?auto_697020 - BLOCK
      ?auto_697021 - BLOCK
      ?auto_697022 - BLOCK
      ?auto_697023 - BLOCK
      ?auto_697024 - BLOCK
      ?auto_697025 - BLOCK
      ?auto_697026 - BLOCK
      ?auto_697027 - BLOCK
    )
    :vars
    (
      ?auto_697028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697027 ?auto_697028 ) ( not ( = ?auto_697017 ?auto_697018 ) ) ( not ( = ?auto_697017 ?auto_697019 ) ) ( not ( = ?auto_697017 ?auto_697020 ) ) ( not ( = ?auto_697017 ?auto_697021 ) ) ( not ( = ?auto_697017 ?auto_697022 ) ) ( not ( = ?auto_697017 ?auto_697023 ) ) ( not ( = ?auto_697017 ?auto_697024 ) ) ( not ( = ?auto_697017 ?auto_697025 ) ) ( not ( = ?auto_697017 ?auto_697026 ) ) ( not ( = ?auto_697017 ?auto_697027 ) ) ( not ( = ?auto_697017 ?auto_697028 ) ) ( not ( = ?auto_697018 ?auto_697019 ) ) ( not ( = ?auto_697018 ?auto_697020 ) ) ( not ( = ?auto_697018 ?auto_697021 ) ) ( not ( = ?auto_697018 ?auto_697022 ) ) ( not ( = ?auto_697018 ?auto_697023 ) ) ( not ( = ?auto_697018 ?auto_697024 ) ) ( not ( = ?auto_697018 ?auto_697025 ) ) ( not ( = ?auto_697018 ?auto_697026 ) ) ( not ( = ?auto_697018 ?auto_697027 ) ) ( not ( = ?auto_697018 ?auto_697028 ) ) ( not ( = ?auto_697019 ?auto_697020 ) ) ( not ( = ?auto_697019 ?auto_697021 ) ) ( not ( = ?auto_697019 ?auto_697022 ) ) ( not ( = ?auto_697019 ?auto_697023 ) ) ( not ( = ?auto_697019 ?auto_697024 ) ) ( not ( = ?auto_697019 ?auto_697025 ) ) ( not ( = ?auto_697019 ?auto_697026 ) ) ( not ( = ?auto_697019 ?auto_697027 ) ) ( not ( = ?auto_697019 ?auto_697028 ) ) ( not ( = ?auto_697020 ?auto_697021 ) ) ( not ( = ?auto_697020 ?auto_697022 ) ) ( not ( = ?auto_697020 ?auto_697023 ) ) ( not ( = ?auto_697020 ?auto_697024 ) ) ( not ( = ?auto_697020 ?auto_697025 ) ) ( not ( = ?auto_697020 ?auto_697026 ) ) ( not ( = ?auto_697020 ?auto_697027 ) ) ( not ( = ?auto_697020 ?auto_697028 ) ) ( not ( = ?auto_697021 ?auto_697022 ) ) ( not ( = ?auto_697021 ?auto_697023 ) ) ( not ( = ?auto_697021 ?auto_697024 ) ) ( not ( = ?auto_697021 ?auto_697025 ) ) ( not ( = ?auto_697021 ?auto_697026 ) ) ( not ( = ?auto_697021 ?auto_697027 ) ) ( not ( = ?auto_697021 ?auto_697028 ) ) ( not ( = ?auto_697022 ?auto_697023 ) ) ( not ( = ?auto_697022 ?auto_697024 ) ) ( not ( = ?auto_697022 ?auto_697025 ) ) ( not ( = ?auto_697022 ?auto_697026 ) ) ( not ( = ?auto_697022 ?auto_697027 ) ) ( not ( = ?auto_697022 ?auto_697028 ) ) ( not ( = ?auto_697023 ?auto_697024 ) ) ( not ( = ?auto_697023 ?auto_697025 ) ) ( not ( = ?auto_697023 ?auto_697026 ) ) ( not ( = ?auto_697023 ?auto_697027 ) ) ( not ( = ?auto_697023 ?auto_697028 ) ) ( not ( = ?auto_697024 ?auto_697025 ) ) ( not ( = ?auto_697024 ?auto_697026 ) ) ( not ( = ?auto_697024 ?auto_697027 ) ) ( not ( = ?auto_697024 ?auto_697028 ) ) ( not ( = ?auto_697025 ?auto_697026 ) ) ( not ( = ?auto_697025 ?auto_697027 ) ) ( not ( = ?auto_697025 ?auto_697028 ) ) ( not ( = ?auto_697026 ?auto_697027 ) ) ( not ( = ?auto_697026 ?auto_697028 ) ) ( not ( = ?auto_697027 ?auto_697028 ) ) ( ON ?auto_697026 ?auto_697027 ) ( ON ?auto_697025 ?auto_697026 ) ( ON ?auto_697024 ?auto_697025 ) ( ON ?auto_697023 ?auto_697024 ) ( ON ?auto_697022 ?auto_697023 ) ( ON ?auto_697021 ?auto_697022 ) ( ON ?auto_697020 ?auto_697021 ) ( ON ?auto_697019 ?auto_697020 ) ( ON ?auto_697018 ?auto_697019 ) ( ON ?auto_697017 ?auto_697018 ) ( CLEAR ?auto_697017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_697017 )
      ( MAKE-11PILE ?auto_697017 ?auto_697018 ?auto_697019 ?auto_697020 ?auto_697021 ?auto_697022 ?auto_697023 ?auto_697024 ?auto_697025 ?auto_697026 ?auto_697027 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_697064 - BLOCK
      ?auto_697065 - BLOCK
      ?auto_697066 - BLOCK
      ?auto_697067 - BLOCK
      ?auto_697068 - BLOCK
      ?auto_697069 - BLOCK
      ?auto_697070 - BLOCK
      ?auto_697071 - BLOCK
      ?auto_697072 - BLOCK
      ?auto_697073 - BLOCK
      ?auto_697074 - BLOCK
      ?auto_697075 - BLOCK
    )
    :vars
    (
      ?auto_697076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_697074 ) ( ON ?auto_697075 ?auto_697076 ) ( CLEAR ?auto_697075 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_697064 ) ( ON ?auto_697065 ?auto_697064 ) ( ON ?auto_697066 ?auto_697065 ) ( ON ?auto_697067 ?auto_697066 ) ( ON ?auto_697068 ?auto_697067 ) ( ON ?auto_697069 ?auto_697068 ) ( ON ?auto_697070 ?auto_697069 ) ( ON ?auto_697071 ?auto_697070 ) ( ON ?auto_697072 ?auto_697071 ) ( ON ?auto_697073 ?auto_697072 ) ( ON ?auto_697074 ?auto_697073 ) ( not ( = ?auto_697064 ?auto_697065 ) ) ( not ( = ?auto_697064 ?auto_697066 ) ) ( not ( = ?auto_697064 ?auto_697067 ) ) ( not ( = ?auto_697064 ?auto_697068 ) ) ( not ( = ?auto_697064 ?auto_697069 ) ) ( not ( = ?auto_697064 ?auto_697070 ) ) ( not ( = ?auto_697064 ?auto_697071 ) ) ( not ( = ?auto_697064 ?auto_697072 ) ) ( not ( = ?auto_697064 ?auto_697073 ) ) ( not ( = ?auto_697064 ?auto_697074 ) ) ( not ( = ?auto_697064 ?auto_697075 ) ) ( not ( = ?auto_697064 ?auto_697076 ) ) ( not ( = ?auto_697065 ?auto_697066 ) ) ( not ( = ?auto_697065 ?auto_697067 ) ) ( not ( = ?auto_697065 ?auto_697068 ) ) ( not ( = ?auto_697065 ?auto_697069 ) ) ( not ( = ?auto_697065 ?auto_697070 ) ) ( not ( = ?auto_697065 ?auto_697071 ) ) ( not ( = ?auto_697065 ?auto_697072 ) ) ( not ( = ?auto_697065 ?auto_697073 ) ) ( not ( = ?auto_697065 ?auto_697074 ) ) ( not ( = ?auto_697065 ?auto_697075 ) ) ( not ( = ?auto_697065 ?auto_697076 ) ) ( not ( = ?auto_697066 ?auto_697067 ) ) ( not ( = ?auto_697066 ?auto_697068 ) ) ( not ( = ?auto_697066 ?auto_697069 ) ) ( not ( = ?auto_697066 ?auto_697070 ) ) ( not ( = ?auto_697066 ?auto_697071 ) ) ( not ( = ?auto_697066 ?auto_697072 ) ) ( not ( = ?auto_697066 ?auto_697073 ) ) ( not ( = ?auto_697066 ?auto_697074 ) ) ( not ( = ?auto_697066 ?auto_697075 ) ) ( not ( = ?auto_697066 ?auto_697076 ) ) ( not ( = ?auto_697067 ?auto_697068 ) ) ( not ( = ?auto_697067 ?auto_697069 ) ) ( not ( = ?auto_697067 ?auto_697070 ) ) ( not ( = ?auto_697067 ?auto_697071 ) ) ( not ( = ?auto_697067 ?auto_697072 ) ) ( not ( = ?auto_697067 ?auto_697073 ) ) ( not ( = ?auto_697067 ?auto_697074 ) ) ( not ( = ?auto_697067 ?auto_697075 ) ) ( not ( = ?auto_697067 ?auto_697076 ) ) ( not ( = ?auto_697068 ?auto_697069 ) ) ( not ( = ?auto_697068 ?auto_697070 ) ) ( not ( = ?auto_697068 ?auto_697071 ) ) ( not ( = ?auto_697068 ?auto_697072 ) ) ( not ( = ?auto_697068 ?auto_697073 ) ) ( not ( = ?auto_697068 ?auto_697074 ) ) ( not ( = ?auto_697068 ?auto_697075 ) ) ( not ( = ?auto_697068 ?auto_697076 ) ) ( not ( = ?auto_697069 ?auto_697070 ) ) ( not ( = ?auto_697069 ?auto_697071 ) ) ( not ( = ?auto_697069 ?auto_697072 ) ) ( not ( = ?auto_697069 ?auto_697073 ) ) ( not ( = ?auto_697069 ?auto_697074 ) ) ( not ( = ?auto_697069 ?auto_697075 ) ) ( not ( = ?auto_697069 ?auto_697076 ) ) ( not ( = ?auto_697070 ?auto_697071 ) ) ( not ( = ?auto_697070 ?auto_697072 ) ) ( not ( = ?auto_697070 ?auto_697073 ) ) ( not ( = ?auto_697070 ?auto_697074 ) ) ( not ( = ?auto_697070 ?auto_697075 ) ) ( not ( = ?auto_697070 ?auto_697076 ) ) ( not ( = ?auto_697071 ?auto_697072 ) ) ( not ( = ?auto_697071 ?auto_697073 ) ) ( not ( = ?auto_697071 ?auto_697074 ) ) ( not ( = ?auto_697071 ?auto_697075 ) ) ( not ( = ?auto_697071 ?auto_697076 ) ) ( not ( = ?auto_697072 ?auto_697073 ) ) ( not ( = ?auto_697072 ?auto_697074 ) ) ( not ( = ?auto_697072 ?auto_697075 ) ) ( not ( = ?auto_697072 ?auto_697076 ) ) ( not ( = ?auto_697073 ?auto_697074 ) ) ( not ( = ?auto_697073 ?auto_697075 ) ) ( not ( = ?auto_697073 ?auto_697076 ) ) ( not ( = ?auto_697074 ?auto_697075 ) ) ( not ( = ?auto_697074 ?auto_697076 ) ) ( not ( = ?auto_697075 ?auto_697076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_697075 ?auto_697076 )
      ( !STACK ?auto_697075 ?auto_697074 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_697114 - BLOCK
      ?auto_697115 - BLOCK
      ?auto_697116 - BLOCK
      ?auto_697117 - BLOCK
      ?auto_697118 - BLOCK
      ?auto_697119 - BLOCK
      ?auto_697120 - BLOCK
      ?auto_697121 - BLOCK
      ?auto_697122 - BLOCK
      ?auto_697123 - BLOCK
      ?auto_697124 - BLOCK
      ?auto_697125 - BLOCK
    )
    :vars
    (
      ?auto_697126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697125 ?auto_697126 ) ( ON-TABLE ?auto_697114 ) ( ON ?auto_697115 ?auto_697114 ) ( ON ?auto_697116 ?auto_697115 ) ( ON ?auto_697117 ?auto_697116 ) ( ON ?auto_697118 ?auto_697117 ) ( ON ?auto_697119 ?auto_697118 ) ( ON ?auto_697120 ?auto_697119 ) ( ON ?auto_697121 ?auto_697120 ) ( ON ?auto_697122 ?auto_697121 ) ( ON ?auto_697123 ?auto_697122 ) ( not ( = ?auto_697114 ?auto_697115 ) ) ( not ( = ?auto_697114 ?auto_697116 ) ) ( not ( = ?auto_697114 ?auto_697117 ) ) ( not ( = ?auto_697114 ?auto_697118 ) ) ( not ( = ?auto_697114 ?auto_697119 ) ) ( not ( = ?auto_697114 ?auto_697120 ) ) ( not ( = ?auto_697114 ?auto_697121 ) ) ( not ( = ?auto_697114 ?auto_697122 ) ) ( not ( = ?auto_697114 ?auto_697123 ) ) ( not ( = ?auto_697114 ?auto_697124 ) ) ( not ( = ?auto_697114 ?auto_697125 ) ) ( not ( = ?auto_697114 ?auto_697126 ) ) ( not ( = ?auto_697115 ?auto_697116 ) ) ( not ( = ?auto_697115 ?auto_697117 ) ) ( not ( = ?auto_697115 ?auto_697118 ) ) ( not ( = ?auto_697115 ?auto_697119 ) ) ( not ( = ?auto_697115 ?auto_697120 ) ) ( not ( = ?auto_697115 ?auto_697121 ) ) ( not ( = ?auto_697115 ?auto_697122 ) ) ( not ( = ?auto_697115 ?auto_697123 ) ) ( not ( = ?auto_697115 ?auto_697124 ) ) ( not ( = ?auto_697115 ?auto_697125 ) ) ( not ( = ?auto_697115 ?auto_697126 ) ) ( not ( = ?auto_697116 ?auto_697117 ) ) ( not ( = ?auto_697116 ?auto_697118 ) ) ( not ( = ?auto_697116 ?auto_697119 ) ) ( not ( = ?auto_697116 ?auto_697120 ) ) ( not ( = ?auto_697116 ?auto_697121 ) ) ( not ( = ?auto_697116 ?auto_697122 ) ) ( not ( = ?auto_697116 ?auto_697123 ) ) ( not ( = ?auto_697116 ?auto_697124 ) ) ( not ( = ?auto_697116 ?auto_697125 ) ) ( not ( = ?auto_697116 ?auto_697126 ) ) ( not ( = ?auto_697117 ?auto_697118 ) ) ( not ( = ?auto_697117 ?auto_697119 ) ) ( not ( = ?auto_697117 ?auto_697120 ) ) ( not ( = ?auto_697117 ?auto_697121 ) ) ( not ( = ?auto_697117 ?auto_697122 ) ) ( not ( = ?auto_697117 ?auto_697123 ) ) ( not ( = ?auto_697117 ?auto_697124 ) ) ( not ( = ?auto_697117 ?auto_697125 ) ) ( not ( = ?auto_697117 ?auto_697126 ) ) ( not ( = ?auto_697118 ?auto_697119 ) ) ( not ( = ?auto_697118 ?auto_697120 ) ) ( not ( = ?auto_697118 ?auto_697121 ) ) ( not ( = ?auto_697118 ?auto_697122 ) ) ( not ( = ?auto_697118 ?auto_697123 ) ) ( not ( = ?auto_697118 ?auto_697124 ) ) ( not ( = ?auto_697118 ?auto_697125 ) ) ( not ( = ?auto_697118 ?auto_697126 ) ) ( not ( = ?auto_697119 ?auto_697120 ) ) ( not ( = ?auto_697119 ?auto_697121 ) ) ( not ( = ?auto_697119 ?auto_697122 ) ) ( not ( = ?auto_697119 ?auto_697123 ) ) ( not ( = ?auto_697119 ?auto_697124 ) ) ( not ( = ?auto_697119 ?auto_697125 ) ) ( not ( = ?auto_697119 ?auto_697126 ) ) ( not ( = ?auto_697120 ?auto_697121 ) ) ( not ( = ?auto_697120 ?auto_697122 ) ) ( not ( = ?auto_697120 ?auto_697123 ) ) ( not ( = ?auto_697120 ?auto_697124 ) ) ( not ( = ?auto_697120 ?auto_697125 ) ) ( not ( = ?auto_697120 ?auto_697126 ) ) ( not ( = ?auto_697121 ?auto_697122 ) ) ( not ( = ?auto_697121 ?auto_697123 ) ) ( not ( = ?auto_697121 ?auto_697124 ) ) ( not ( = ?auto_697121 ?auto_697125 ) ) ( not ( = ?auto_697121 ?auto_697126 ) ) ( not ( = ?auto_697122 ?auto_697123 ) ) ( not ( = ?auto_697122 ?auto_697124 ) ) ( not ( = ?auto_697122 ?auto_697125 ) ) ( not ( = ?auto_697122 ?auto_697126 ) ) ( not ( = ?auto_697123 ?auto_697124 ) ) ( not ( = ?auto_697123 ?auto_697125 ) ) ( not ( = ?auto_697123 ?auto_697126 ) ) ( not ( = ?auto_697124 ?auto_697125 ) ) ( not ( = ?auto_697124 ?auto_697126 ) ) ( not ( = ?auto_697125 ?auto_697126 ) ) ( CLEAR ?auto_697123 ) ( ON ?auto_697124 ?auto_697125 ) ( CLEAR ?auto_697124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_697114 ?auto_697115 ?auto_697116 ?auto_697117 ?auto_697118 ?auto_697119 ?auto_697120 ?auto_697121 ?auto_697122 ?auto_697123 ?auto_697124 )
      ( MAKE-12PILE ?auto_697114 ?auto_697115 ?auto_697116 ?auto_697117 ?auto_697118 ?auto_697119 ?auto_697120 ?auto_697121 ?auto_697122 ?auto_697123 ?auto_697124 ?auto_697125 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_697164 - BLOCK
      ?auto_697165 - BLOCK
      ?auto_697166 - BLOCK
      ?auto_697167 - BLOCK
      ?auto_697168 - BLOCK
      ?auto_697169 - BLOCK
      ?auto_697170 - BLOCK
      ?auto_697171 - BLOCK
      ?auto_697172 - BLOCK
      ?auto_697173 - BLOCK
      ?auto_697174 - BLOCK
      ?auto_697175 - BLOCK
    )
    :vars
    (
      ?auto_697176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697175 ?auto_697176 ) ( ON-TABLE ?auto_697164 ) ( ON ?auto_697165 ?auto_697164 ) ( ON ?auto_697166 ?auto_697165 ) ( ON ?auto_697167 ?auto_697166 ) ( ON ?auto_697168 ?auto_697167 ) ( ON ?auto_697169 ?auto_697168 ) ( ON ?auto_697170 ?auto_697169 ) ( ON ?auto_697171 ?auto_697170 ) ( ON ?auto_697172 ?auto_697171 ) ( not ( = ?auto_697164 ?auto_697165 ) ) ( not ( = ?auto_697164 ?auto_697166 ) ) ( not ( = ?auto_697164 ?auto_697167 ) ) ( not ( = ?auto_697164 ?auto_697168 ) ) ( not ( = ?auto_697164 ?auto_697169 ) ) ( not ( = ?auto_697164 ?auto_697170 ) ) ( not ( = ?auto_697164 ?auto_697171 ) ) ( not ( = ?auto_697164 ?auto_697172 ) ) ( not ( = ?auto_697164 ?auto_697173 ) ) ( not ( = ?auto_697164 ?auto_697174 ) ) ( not ( = ?auto_697164 ?auto_697175 ) ) ( not ( = ?auto_697164 ?auto_697176 ) ) ( not ( = ?auto_697165 ?auto_697166 ) ) ( not ( = ?auto_697165 ?auto_697167 ) ) ( not ( = ?auto_697165 ?auto_697168 ) ) ( not ( = ?auto_697165 ?auto_697169 ) ) ( not ( = ?auto_697165 ?auto_697170 ) ) ( not ( = ?auto_697165 ?auto_697171 ) ) ( not ( = ?auto_697165 ?auto_697172 ) ) ( not ( = ?auto_697165 ?auto_697173 ) ) ( not ( = ?auto_697165 ?auto_697174 ) ) ( not ( = ?auto_697165 ?auto_697175 ) ) ( not ( = ?auto_697165 ?auto_697176 ) ) ( not ( = ?auto_697166 ?auto_697167 ) ) ( not ( = ?auto_697166 ?auto_697168 ) ) ( not ( = ?auto_697166 ?auto_697169 ) ) ( not ( = ?auto_697166 ?auto_697170 ) ) ( not ( = ?auto_697166 ?auto_697171 ) ) ( not ( = ?auto_697166 ?auto_697172 ) ) ( not ( = ?auto_697166 ?auto_697173 ) ) ( not ( = ?auto_697166 ?auto_697174 ) ) ( not ( = ?auto_697166 ?auto_697175 ) ) ( not ( = ?auto_697166 ?auto_697176 ) ) ( not ( = ?auto_697167 ?auto_697168 ) ) ( not ( = ?auto_697167 ?auto_697169 ) ) ( not ( = ?auto_697167 ?auto_697170 ) ) ( not ( = ?auto_697167 ?auto_697171 ) ) ( not ( = ?auto_697167 ?auto_697172 ) ) ( not ( = ?auto_697167 ?auto_697173 ) ) ( not ( = ?auto_697167 ?auto_697174 ) ) ( not ( = ?auto_697167 ?auto_697175 ) ) ( not ( = ?auto_697167 ?auto_697176 ) ) ( not ( = ?auto_697168 ?auto_697169 ) ) ( not ( = ?auto_697168 ?auto_697170 ) ) ( not ( = ?auto_697168 ?auto_697171 ) ) ( not ( = ?auto_697168 ?auto_697172 ) ) ( not ( = ?auto_697168 ?auto_697173 ) ) ( not ( = ?auto_697168 ?auto_697174 ) ) ( not ( = ?auto_697168 ?auto_697175 ) ) ( not ( = ?auto_697168 ?auto_697176 ) ) ( not ( = ?auto_697169 ?auto_697170 ) ) ( not ( = ?auto_697169 ?auto_697171 ) ) ( not ( = ?auto_697169 ?auto_697172 ) ) ( not ( = ?auto_697169 ?auto_697173 ) ) ( not ( = ?auto_697169 ?auto_697174 ) ) ( not ( = ?auto_697169 ?auto_697175 ) ) ( not ( = ?auto_697169 ?auto_697176 ) ) ( not ( = ?auto_697170 ?auto_697171 ) ) ( not ( = ?auto_697170 ?auto_697172 ) ) ( not ( = ?auto_697170 ?auto_697173 ) ) ( not ( = ?auto_697170 ?auto_697174 ) ) ( not ( = ?auto_697170 ?auto_697175 ) ) ( not ( = ?auto_697170 ?auto_697176 ) ) ( not ( = ?auto_697171 ?auto_697172 ) ) ( not ( = ?auto_697171 ?auto_697173 ) ) ( not ( = ?auto_697171 ?auto_697174 ) ) ( not ( = ?auto_697171 ?auto_697175 ) ) ( not ( = ?auto_697171 ?auto_697176 ) ) ( not ( = ?auto_697172 ?auto_697173 ) ) ( not ( = ?auto_697172 ?auto_697174 ) ) ( not ( = ?auto_697172 ?auto_697175 ) ) ( not ( = ?auto_697172 ?auto_697176 ) ) ( not ( = ?auto_697173 ?auto_697174 ) ) ( not ( = ?auto_697173 ?auto_697175 ) ) ( not ( = ?auto_697173 ?auto_697176 ) ) ( not ( = ?auto_697174 ?auto_697175 ) ) ( not ( = ?auto_697174 ?auto_697176 ) ) ( not ( = ?auto_697175 ?auto_697176 ) ) ( ON ?auto_697174 ?auto_697175 ) ( CLEAR ?auto_697172 ) ( ON ?auto_697173 ?auto_697174 ) ( CLEAR ?auto_697173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_697164 ?auto_697165 ?auto_697166 ?auto_697167 ?auto_697168 ?auto_697169 ?auto_697170 ?auto_697171 ?auto_697172 ?auto_697173 )
      ( MAKE-12PILE ?auto_697164 ?auto_697165 ?auto_697166 ?auto_697167 ?auto_697168 ?auto_697169 ?auto_697170 ?auto_697171 ?auto_697172 ?auto_697173 ?auto_697174 ?auto_697175 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_697214 - BLOCK
      ?auto_697215 - BLOCK
      ?auto_697216 - BLOCK
      ?auto_697217 - BLOCK
      ?auto_697218 - BLOCK
      ?auto_697219 - BLOCK
      ?auto_697220 - BLOCK
      ?auto_697221 - BLOCK
      ?auto_697222 - BLOCK
      ?auto_697223 - BLOCK
      ?auto_697224 - BLOCK
      ?auto_697225 - BLOCK
    )
    :vars
    (
      ?auto_697226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697225 ?auto_697226 ) ( ON-TABLE ?auto_697214 ) ( ON ?auto_697215 ?auto_697214 ) ( ON ?auto_697216 ?auto_697215 ) ( ON ?auto_697217 ?auto_697216 ) ( ON ?auto_697218 ?auto_697217 ) ( ON ?auto_697219 ?auto_697218 ) ( ON ?auto_697220 ?auto_697219 ) ( ON ?auto_697221 ?auto_697220 ) ( not ( = ?auto_697214 ?auto_697215 ) ) ( not ( = ?auto_697214 ?auto_697216 ) ) ( not ( = ?auto_697214 ?auto_697217 ) ) ( not ( = ?auto_697214 ?auto_697218 ) ) ( not ( = ?auto_697214 ?auto_697219 ) ) ( not ( = ?auto_697214 ?auto_697220 ) ) ( not ( = ?auto_697214 ?auto_697221 ) ) ( not ( = ?auto_697214 ?auto_697222 ) ) ( not ( = ?auto_697214 ?auto_697223 ) ) ( not ( = ?auto_697214 ?auto_697224 ) ) ( not ( = ?auto_697214 ?auto_697225 ) ) ( not ( = ?auto_697214 ?auto_697226 ) ) ( not ( = ?auto_697215 ?auto_697216 ) ) ( not ( = ?auto_697215 ?auto_697217 ) ) ( not ( = ?auto_697215 ?auto_697218 ) ) ( not ( = ?auto_697215 ?auto_697219 ) ) ( not ( = ?auto_697215 ?auto_697220 ) ) ( not ( = ?auto_697215 ?auto_697221 ) ) ( not ( = ?auto_697215 ?auto_697222 ) ) ( not ( = ?auto_697215 ?auto_697223 ) ) ( not ( = ?auto_697215 ?auto_697224 ) ) ( not ( = ?auto_697215 ?auto_697225 ) ) ( not ( = ?auto_697215 ?auto_697226 ) ) ( not ( = ?auto_697216 ?auto_697217 ) ) ( not ( = ?auto_697216 ?auto_697218 ) ) ( not ( = ?auto_697216 ?auto_697219 ) ) ( not ( = ?auto_697216 ?auto_697220 ) ) ( not ( = ?auto_697216 ?auto_697221 ) ) ( not ( = ?auto_697216 ?auto_697222 ) ) ( not ( = ?auto_697216 ?auto_697223 ) ) ( not ( = ?auto_697216 ?auto_697224 ) ) ( not ( = ?auto_697216 ?auto_697225 ) ) ( not ( = ?auto_697216 ?auto_697226 ) ) ( not ( = ?auto_697217 ?auto_697218 ) ) ( not ( = ?auto_697217 ?auto_697219 ) ) ( not ( = ?auto_697217 ?auto_697220 ) ) ( not ( = ?auto_697217 ?auto_697221 ) ) ( not ( = ?auto_697217 ?auto_697222 ) ) ( not ( = ?auto_697217 ?auto_697223 ) ) ( not ( = ?auto_697217 ?auto_697224 ) ) ( not ( = ?auto_697217 ?auto_697225 ) ) ( not ( = ?auto_697217 ?auto_697226 ) ) ( not ( = ?auto_697218 ?auto_697219 ) ) ( not ( = ?auto_697218 ?auto_697220 ) ) ( not ( = ?auto_697218 ?auto_697221 ) ) ( not ( = ?auto_697218 ?auto_697222 ) ) ( not ( = ?auto_697218 ?auto_697223 ) ) ( not ( = ?auto_697218 ?auto_697224 ) ) ( not ( = ?auto_697218 ?auto_697225 ) ) ( not ( = ?auto_697218 ?auto_697226 ) ) ( not ( = ?auto_697219 ?auto_697220 ) ) ( not ( = ?auto_697219 ?auto_697221 ) ) ( not ( = ?auto_697219 ?auto_697222 ) ) ( not ( = ?auto_697219 ?auto_697223 ) ) ( not ( = ?auto_697219 ?auto_697224 ) ) ( not ( = ?auto_697219 ?auto_697225 ) ) ( not ( = ?auto_697219 ?auto_697226 ) ) ( not ( = ?auto_697220 ?auto_697221 ) ) ( not ( = ?auto_697220 ?auto_697222 ) ) ( not ( = ?auto_697220 ?auto_697223 ) ) ( not ( = ?auto_697220 ?auto_697224 ) ) ( not ( = ?auto_697220 ?auto_697225 ) ) ( not ( = ?auto_697220 ?auto_697226 ) ) ( not ( = ?auto_697221 ?auto_697222 ) ) ( not ( = ?auto_697221 ?auto_697223 ) ) ( not ( = ?auto_697221 ?auto_697224 ) ) ( not ( = ?auto_697221 ?auto_697225 ) ) ( not ( = ?auto_697221 ?auto_697226 ) ) ( not ( = ?auto_697222 ?auto_697223 ) ) ( not ( = ?auto_697222 ?auto_697224 ) ) ( not ( = ?auto_697222 ?auto_697225 ) ) ( not ( = ?auto_697222 ?auto_697226 ) ) ( not ( = ?auto_697223 ?auto_697224 ) ) ( not ( = ?auto_697223 ?auto_697225 ) ) ( not ( = ?auto_697223 ?auto_697226 ) ) ( not ( = ?auto_697224 ?auto_697225 ) ) ( not ( = ?auto_697224 ?auto_697226 ) ) ( not ( = ?auto_697225 ?auto_697226 ) ) ( ON ?auto_697224 ?auto_697225 ) ( ON ?auto_697223 ?auto_697224 ) ( CLEAR ?auto_697221 ) ( ON ?auto_697222 ?auto_697223 ) ( CLEAR ?auto_697222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_697214 ?auto_697215 ?auto_697216 ?auto_697217 ?auto_697218 ?auto_697219 ?auto_697220 ?auto_697221 ?auto_697222 )
      ( MAKE-12PILE ?auto_697214 ?auto_697215 ?auto_697216 ?auto_697217 ?auto_697218 ?auto_697219 ?auto_697220 ?auto_697221 ?auto_697222 ?auto_697223 ?auto_697224 ?auto_697225 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_697264 - BLOCK
      ?auto_697265 - BLOCK
      ?auto_697266 - BLOCK
      ?auto_697267 - BLOCK
      ?auto_697268 - BLOCK
      ?auto_697269 - BLOCK
      ?auto_697270 - BLOCK
      ?auto_697271 - BLOCK
      ?auto_697272 - BLOCK
      ?auto_697273 - BLOCK
      ?auto_697274 - BLOCK
      ?auto_697275 - BLOCK
    )
    :vars
    (
      ?auto_697276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697275 ?auto_697276 ) ( ON-TABLE ?auto_697264 ) ( ON ?auto_697265 ?auto_697264 ) ( ON ?auto_697266 ?auto_697265 ) ( ON ?auto_697267 ?auto_697266 ) ( ON ?auto_697268 ?auto_697267 ) ( ON ?auto_697269 ?auto_697268 ) ( ON ?auto_697270 ?auto_697269 ) ( not ( = ?auto_697264 ?auto_697265 ) ) ( not ( = ?auto_697264 ?auto_697266 ) ) ( not ( = ?auto_697264 ?auto_697267 ) ) ( not ( = ?auto_697264 ?auto_697268 ) ) ( not ( = ?auto_697264 ?auto_697269 ) ) ( not ( = ?auto_697264 ?auto_697270 ) ) ( not ( = ?auto_697264 ?auto_697271 ) ) ( not ( = ?auto_697264 ?auto_697272 ) ) ( not ( = ?auto_697264 ?auto_697273 ) ) ( not ( = ?auto_697264 ?auto_697274 ) ) ( not ( = ?auto_697264 ?auto_697275 ) ) ( not ( = ?auto_697264 ?auto_697276 ) ) ( not ( = ?auto_697265 ?auto_697266 ) ) ( not ( = ?auto_697265 ?auto_697267 ) ) ( not ( = ?auto_697265 ?auto_697268 ) ) ( not ( = ?auto_697265 ?auto_697269 ) ) ( not ( = ?auto_697265 ?auto_697270 ) ) ( not ( = ?auto_697265 ?auto_697271 ) ) ( not ( = ?auto_697265 ?auto_697272 ) ) ( not ( = ?auto_697265 ?auto_697273 ) ) ( not ( = ?auto_697265 ?auto_697274 ) ) ( not ( = ?auto_697265 ?auto_697275 ) ) ( not ( = ?auto_697265 ?auto_697276 ) ) ( not ( = ?auto_697266 ?auto_697267 ) ) ( not ( = ?auto_697266 ?auto_697268 ) ) ( not ( = ?auto_697266 ?auto_697269 ) ) ( not ( = ?auto_697266 ?auto_697270 ) ) ( not ( = ?auto_697266 ?auto_697271 ) ) ( not ( = ?auto_697266 ?auto_697272 ) ) ( not ( = ?auto_697266 ?auto_697273 ) ) ( not ( = ?auto_697266 ?auto_697274 ) ) ( not ( = ?auto_697266 ?auto_697275 ) ) ( not ( = ?auto_697266 ?auto_697276 ) ) ( not ( = ?auto_697267 ?auto_697268 ) ) ( not ( = ?auto_697267 ?auto_697269 ) ) ( not ( = ?auto_697267 ?auto_697270 ) ) ( not ( = ?auto_697267 ?auto_697271 ) ) ( not ( = ?auto_697267 ?auto_697272 ) ) ( not ( = ?auto_697267 ?auto_697273 ) ) ( not ( = ?auto_697267 ?auto_697274 ) ) ( not ( = ?auto_697267 ?auto_697275 ) ) ( not ( = ?auto_697267 ?auto_697276 ) ) ( not ( = ?auto_697268 ?auto_697269 ) ) ( not ( = ?auto_697268 ?auto_697270 ) ) ( not ( = ?auto_697268 ?auto_697271 ) ) ( not ( = ?auto_697268 ?auto_697272 ) ) ( not ( = ?auto_697268 ?auto_697273 ) ) ( not ( = ?auto_697268 ?auto_697274 ) ) ( not ( = ?auto_697268 ?auto_697275 ) ) ( not ( = ?auto_697268 ?auto_697276 ) ) ( not ( = ?auto_697269 ?auto_697270 ) ) ( not ( = ?auto_697269 ?auto_697271 ) ) ( not ( = ?auto_697269 ?auto_697272 ) ) ( not ( = ?auto_697269 ?auto_697273 ) ) ( not ( = ?auto_697269 ?auto_697274 ) ) ( not ( = ?auto_697269 ?auto_697275 ) ) ( not ( = ?auto_697269 ?auto_697276 ) ) ( not ( = ?auto_697270 ?auto_697271 ) ) ( not ( = ?auto_697270 ?auto_697272 ) ) ( not ( = ?auto_697270 ?auto_697273 ) ) ( not ( = ?auto_697270 ?auto_697274 ) ) ( not ( = ?auto_697270 ?auto_697275 ) ) ( not ( = ?auto_697270 ?auto_697276 ) ) ( not ( = ?auto_697271 ?auto_697272 ) ) ( not ( = ?auto_697271 ?auto_697273 ) ) ( not ( = ?auto_697271 ?auto_697274 ) ) ( not ( = ?auto_697271 ?auto_697275 ) ) ( not ( = ?auto_697271 ?auto_697276 ) ) ( not ( = ?auto_697272 ?auto_697273 ) ) ( not ( = ?auto_697272 ?auto_697274 ) ) ( not ( = ?auto_697272 ?auto_697275 ) ) ( not ( = ?auto_697272 ?auto_697276 ) ) ( not ( = ?auto_697273 ?auto_697274 ) ) ( not ( = ?auto_697273 ?auto_697275 ) ) ( not ( = ?auto_697273 ?auto_697276 ) ) ( not ( = ?auto_697274 ?auto_697275 ) ) ( not ( = ?auto_697274 ?auto_697276 ) ) ( not ( = ?auto_697275 ?auto_697276 ) ) ( ON ?auto_697274 ?auto_697275 ) ( ON ?auto_697273 ?auto_697274 ) ( ON ?auto_697272 ?auto_697273 ) ( CLEAR ?auto_697270 ) ( ON ?auto_697271 ?auto_697272 ) ( CLEAR ?auto_697271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_697264 ?auto_697265 ?auto_697266 ?auto_697267 ?auto_697268 ?auto_697269 ?auto_697270 ?auto_697271 )
      ( MAKE-12PILE ?auto_697264 ?auto_697265 ?auto_697266 ?auto_697267 ?auto_697268 ?auto_697269 ?auto_697270 ?auto_697271 ?auto_697272 ?auto_697273 ?auto_697274 ?auto_697275 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_697314 - BLOCK
      ?auto_697315 - BLOCK
      ?auto_697316 - BLOCK
      ?auto_697317 - BLOCK
      ?auto_697318 - BLOCK
      ?auto_697319 - BLOCK
      ?auto_697320 - BLOCK
      ?auto_697321 - BLOCK
      ?auto_697322 - BLOCK
      ?auto_697323 - BLOCK
      ?auto_697324 - BLOCK
      ?auto_697325 - BLOCK
    )
    :vars
    (
      ?auto_697326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697325 ?auto_697326 ) ( ON-TABLE ?auto_697314 ) ( ON ?auto_697315 ?auto_697314 ) ( ON ?auto_697316 ?auto_697315 ) ( ON ?auto_697317 ?auto_697316 ) ( ON ?auto_697318 ?auto_697317 ) ( ON ?auto_697319 ?auto_697318 ) ( not ( = ?auto_697314 ?auto_697315 ) ) ( not ( = ?auto_697314 ?auto_697316 ) ) ( not ( = ?auto_697314 ?auto_697317 ) ) ( not ( = ?auto_697314 ?auto_697318 ) ) ( not ( = ?auto_697314 ?auto_697319 ) ) ( not ( = ?auto_697314 ?auto_697320 ) ) ( not ( = ?auto_697314 ?auto_697321 ) ) ( not ( = ?auto_697314 ?auto_697322 ) ) ( not ( = ?auto_697314 ?auto_697323 ) ) ( not ( = ?auto_697314 ?auto_697324 ) ) ( not ( = ?auto_697314 ?auto_697325 ) ) ( not ( = ?auto_697314 ?auto_697326 ) ) ( not ( = ?auto_697315 ?auto_697316 ) ) ( not ( = ?auto_697315 ?auto_697317 ) ) ( not ( = ?auto_697315 ?auto_697318 ) ) ( not ( = ?auto_697315 ?auto_697319 ) ) ( not ( = ?auto_697315 ?auto_697320 ) ) ( not ( = ?auto_697315 ?auto_697321 ) ) ( not ( = ?auto_697315 ?auto_697322 ) ) ( not ( = ?auto_697315 ?auto_697323 ) ) ( not ( = ?auto_697315 ?auto_697324 ) ) ( not ( = ?auto_697315 ?auto_697325 ) ) ( not ( = ?auto_697315 ?auto_697326 ) ) ( not ( = ?auto_697316 ?auto_697317 ) ) ( not ( = ?auto_697316 ?auto_697318 ) ) ( not ( = ?auto_697316 ?auto_697319 ) ) ( not ( = ?auto_697316 ?auto_697320 ) ) ( not ( = ?auto_697316 ?auto_697321 ) ) ( not ( = ?auto_697316 ?auto_697322 ) ) ( not ( = ?auto_697316 ?auto_697323 ) ) ( not ( = ?auto_697316 ?auto_697324 ) ) ( not ( = ?auto_697316 ?auto_697325 ) ) ( not ( = ?auto_697316 ?auto_697326 ) ) ( not ( = ?auto_697317 ?auto_697318 ) ) ( not ( = ?auto_697317 ?auto_697319 ) ) ( not ( = ?auto_697317 ?auto_697320 ) ) ( not ( = ?auto_697317 ?auto_697321 ) ) ( not ( = ?auto_697317 ?auto_697322 ) ) ( not ( = ?auto_697317 ?auto_697323 ) ) ( not ( = ?auto_697317 ?auto_697324 ) ) ( not ( = ?auto_697317 ?auto_697325 ) ) ( not ( = ?auto_697317 ?auto_697326 ) ) ( not ( = ?auto_697318 ?auto_697319 ) ) ( not ( = ?auto_697318 ?auto_697320 ) ) ( not ( = ?auto_697318 ?auto_697321 ) ) ( not ( = ?auto_697318 ?auto_697322 ) ) ( not ( = ?auto_697318 ?auto_697323 ) ) ( not ( = ?auto_697318 ?auto_697324 ) ) ( not ( = ?auto_697318 ?auto_697325 ) ) ( not ( = ?auto_697318 ?auto_697326 ) ) ( not ( = ?auto_697319 ?auto_697320 ) ) ( not ( = ?auto_697319 ?auto_697321 ) ) ( not ( = ?auto_697319 ?auto_697322 ) ) ( not ( = ?auto_697319 ?auto_697323 ) ) ( not ( = ?auto_697319 ?auto_697324 ) ) ( not ( = ?auto_697319 ?auto_697325 ) ) ( not ( = ?auto_697319 ?auto_697326 ) ) ( not ( = ?auto_697320 ?auto_697321 ) ) ( not ( = ?auto_697320 ?auto_697322 ) ) ( not ( = ?auto_697320 ?auto_697323 ) ) ( not ( = ?auto_697320 ?auto_697324 ) ) ( not ( = ?auto_697320 ?auto_697325 ) ) ( not ( = ?auto_697320 ?auto_697326 ) ) ( not ( = ?auto_697321 ?auto_697322 ) ) ( not ( = ?auto_697321 ?auto_697323 ) ) ( not ( = ?auto_697321 ?auto_697324 ) ) ( not ( = ?auto_697321 ?auto_697325 ) ) ( not ( = ?auto_697321 ?auto_697326 ) ) ( not ( = ?auto_697322 ?auto_697323 ) ) ( not ( = ?auto_697322 ?auto_697324 ) ) ( not ( = ?auto_697322 ?auto_697325 ) ) ( not ( = ?auto_697322 ?auto_697326 ) ) ( not ( = ?auto_697323 ?auto_697324 ) ) ( not ( = ?auto_697323 ?auto_697325 ) ) ( not ( = ?auto_697323 ?auto_697326 ) ) ( not ( = ?auto_697324 ?auto_697325 ) ) ( not ( = ?auto_697324 ?auto_697326 ) ) ( not ( = ?auto_697325 ?auto_697326 ) ) ( ON ?auto_697324 ?auto_697325 ) ( ON ?auto_697323 ?auto_697324 ) ( ON ?auto_697322 ?auto_697323 ) ( ON ?auto_697321 ?auto_697322 ) ( CLEAR ?auto_697319 ) ( ON ?auto_697320 ?auto_697321 ) ( CLEAR ?auto_697320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_697314 ?auto_697315 ?auto_697316 ?auto_697317 ?auto_697318 ?auto_697319 ?auto_697320 )
      ( MAKE-12PILE ?auto_697314 ?auto_697315 ?auto_697316 ?auto_697317 ?auto_697318 ?auto_697319 ?auto_697320 ?auto_697321 ?auto_697322 ?auto_697323 ?auto_697324 ?auto_697325 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_697364 - BLOCK
      ?auto_697365 - BLOCK
      ?auto_697366 - BLOCK
      ?auto_697367 - BLOCK
      ?auto_697368 - BLOCK
      ?auto_697369 - BLOCK
      ?auto_697370 - BLOCK
      ?auto_697371 - BLOCK
      ?auto_697372 - BLOCK
      ?auto_697373 - BLOCK
      ?auto_697374 - BLOCK
      ?auto_697375 - BLOCK
    )
    :vars
    (
      ?auto_697376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697375 ?auto_697376 ) ( ON-TABLE ?auto_697364 ) ( ON ?auto_697365 ?auto_697364 ) ( ON ?auto_697366 ?auto_697365 ) ( ON ?auto_697367 ?auto_697366 ) ( ON ?auto_697368 ?auto_697367 ) ( not ( = ?auto_697364 ?auto_697365 ) ) ( not ( = ?auto_697364 ?auto_697366 ) ) ( not ( = ?auto_697364 ?auto_697367 ) ) ( not ( = ?auto_697364 ?auto_697368 ) ) ( not ( = ?auto_697364 ?auto_697369 ) ) ( not ( = ?auto_697364 ?auto_697370 ) ) ( not ( = ?auto_697364 ?auto_697371 ) ) ( not ( = ?auto_697364 ?auto_697372 ) ) ( not ( = ?auto_697364 ?auto_697373 ) ) ( not ( = ?auto_697364 ?auto_697374 ) ) ( not ( = ?auto_697364 ?auto_697375 ) ) ( not ( = ?auto_697364 ?auto_697376 ) ) ( not ( = ?auto_697365 ?auto_697366 ) ) ( not ( = ?auto_697365 ?auto_697367 ) ) ( not ( = ?auto_697365 ?auto_697368 ) ) ( not ( = ?auto_697365 ?auto_697369 ) ) ( not ( = ?auto_697365 ?auto_697370 ) ) ( not ( = ?auto_697365 ?auto_697371 ) ) ( not ( = ?auto_697365 ?auto_697372 ) ) ( not ( = ?auto_697365 ?auto_697373 ) ) ( not ( = ?auto_697365 ?auto_697374 ) ) ( not ( = ?auto_697365 ?auto_697375 ) ) ( not ( = ?auto_697365 ?auto_697376 ) ) ( not ( = ?auto_697366 ?auto_697367 ) ) ( not ( = ?auto_697366 ?auto_697368 ) ) ( not ( = ?auto_697366 ?auto_697369 ) ) ( not ( = ?auto_697366 ?auto_697370 ) ) ( not ( = ?auto_697366 ?auto_697371 ) ) ( not ( = ?auto_697366 ?auto_697372 ) ) ( not ( = ?auto_697366 ?auto_697373 ) ) ( not ( = ?auto_697366 ?auto_697374 ) ) ( not ( = ?auto_697366 ?auto_697375 ) ) ( not ( = ?auto_697366 ?auto_697376 ) ) ( not ( = ?auto_697367 ?auto_697368 ) ) ( not ( = ?auto_697367 ?auto_697369 ) ) ( not ( = ?auto_697367 ?auto_697370 ) ) ( not ( = ?auto_697367 ?auto_697371 ) ) ( not ( = ?auto_697367 ?auto_697372 ) ) ( not ( = ?auto_697367 ?auto_697373 ) ) ( not ( = ?auto_697367 ?auto_697374 ) ) ( not ( = ?auto_697367 ?auto_697375 ) ) ( not ( = ?auto_697367 ?auto_697376 ) ) ( not ( = ?auto_697368 ?auto_697369 ) ) ( not ( = ?auto_697368 ?auto_697370 ) ) ( not ( = ?auto_697368 ?auto_697371 ) ) ( not ( = ?auto_697368 ?auto_697372 ) ) ( not ( = ?auto_697368 ?auto_697373 ) ) ( not ( = ?auto_697368 ?auto_697374 ) ) ( not ( = ?auto_697368 ?auto_697375 ) ) ( not ( = ?auto_697368 ?auto_697376 ) ) ( not ( = ?auto_697369 ?auto_697370 ) ) ( not ( = ?auto_697369 ?auto_697371 ) ) ( not ( = ?auto_697369 ?auto_697372 ) ) ( not ( = ?auto_697369 ?auto_697373 ) ) ( not ( = ?auto_697369 ?auto_697374 ) ) ( not ( = ?auto_697369 ?auto_697375 ) ) ( not ( = ?auto_697369 ?auto_697376 ) ) ( not ( = ?auto_697370 ?auto_697371 ) ) ( not ( = ?auto_697370 ?auto_697372 ) ) ( not ( = ?auto_697370 ?auto_697373 ) ) ( not ( = ?auto_697370 ?auto_697374 ) ) ( not ( = ?auto_697370 ?auto_697375 ) ) ( not ( = ?auto_697370 ?auto_697376 ) ) ( not ( = ?auto_697371 ?auto_697372 ) ) ( not ( = ?auto_697371 ?auto_697373 ) ) ( not ( = ?auto_697371 ?auto_697374 ) ) ( not ( = ?auto_697371 ?auto_697375 ) ) ( not ( = ?auto_697371 ?auto_697376 ) ) ( not ( = ?auto_697372 ?auto_697373 ) ) ( not ( = ?auto_697372 ?auto_697374 ) ) ( not ( = ?auto_697372 ?auto_697375 ) ) ( not ( = ?auto_697372 ?auto_697376 ) ) ( not ( = ?auto_697373 ?auto_697374 ) ) ( not ( = ?auto_697373 ?auto_697375 ) ) ( not ( = ?auto_697373 ?auto_697376 ) ) ( not ( = ?auto_697374 ?auto_697375 ) ) ( not ( = ?auto_697374 ?auto_697376 ) ) ( not ( = ?auto_697375 ?auto_697376 ) ) ( ON ?auto_697374 ?auto_697375 ) ( ON ?auto_697373 ?auto_697374 ) ( ON ?auto_697372 ?auto_697373 ) ( ON ?auto_697371 ?auto_697372 ) ( ON ?auto_697370 ?auto_697371 ) ( CLEAR ?auto_697368 ) ( ON ?auto_697369 ?auto_697370 ) ( CLEAR ?auto_697369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_697364 ?auto_697365 ?auto_697366 ?auto_697367 ?auto_697368 ?auto_697369 )
      ( MAKE-12PILE ?auto_697364 ?auto_697365 ?auto_697366 ?auto_697367 ?auto_697368 ?auto_697369 ?auto_697370 ?auto_697371 ?auto_697372 ?auto_697373 ?auto_697374 ?auto_697375 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_697414 - BLOCK
      ?auto_697415 - BLOCK
      ?auto_697416 - BLOCK
      ?auto_697417 - BLOCK
      ?auto_697418 - BLOCK
      ?auto_697419 - BLOCK
      ?auto_697420 - BLOCK
      ?auto_697421 - BLOCK
      ?auto_697422 - BLOCK
      ?auto_697423 - BLOCK
      ?auto_697424 - BLOCK
      ?auto_697425 - BLOCK
    )
    :vars
    (
      ?auto_697426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697425 ?auto_697426 ) ( ON-TABLE ?auto_697414 ) ( ON ?auto_697415 ?auto_697414 ) ( ON ?auto_697416 ?auto_697415 ) ( ON ?auto_697417 ?auto_697416 ) ( not ( = ?auto_697414 ?auto_697415 ) ) ( not ( = ?auto_697414 ?auto_697416 ) ) ( not ( = ?auto_697414 ?auto_697417 ) ) ( not ( = ?auto_697414 ?auto_697418 ) ) ( not ( = ?auto_697414 ?auto_697419 ) ) ( not ( = ?auto_697414 ?auto_697420 ) ) ( not ( = ?auto_697414 ?auto_697421 ) ) ( not ( = ?auto_697414 ?auto_697422 ) ) ( not ( = ?auto_697414 ?auto_697423 ) ) ( not ( = ?auto_697414 ?auto_697424 ) ) ( not ( = ?auto_697414 ?auto_697425 ) ) ( not ( = ?auto_697414 ?auto_697426 ) ) ( not ( = ?auto_697415 ?auto_697416 ) ) ( not ( = ?auto_697415 ?auto_697417 ) ) ( not ( = ?auto_697415 ?auto_697418 ) ) ( not ( = ?auto_697415 ?auto_697419 ) ) ( not ( = ?auto_697415 ?auto_697420 ) ) ( not ( = ?auto_697415 ?auto_697421 ) ) ( not ( = ?auto_697415 ?auto_697422 ) ) ( not ( = ?auto_697415 ?auto_697423 ) ) ( not ( = ?auto_697415 ?auto_697424 ) ) ( not ( = ?auto_697415 ?auto_697425 ) ) ( not ( = ?auto_697415 ?auto_697426 ) ) ( not ( = ?auto_697416 ?auto_697417 ) ) ( not ( = ?auto_697416 ?auto_697418 ) ) ( not ( = ?auto_697416 ?auto_697419 ) ) ( not ( = ?auto_697416 ?auto_697420 ) ) ( not ( = ?auto_697416 ?auto_697421 ) ) ( not ( = ?auto_697416 ?auto_697422 ) ) ( not ( = ?auto_697416 ?auto_697423 ) ) ( not ( = ?auto_697416 ?auto_697424 ) ) ( not ( = ?auto_697416 ?auto_697425 ) ) ( not ( = ?auto_697416 ?auto_697426 ) ) ( not ( = ?auto_697417 ?auto_697418 ) ) ( not ( = ?auto_697417 ?auto_697419 ) ) ( not ( = ?auto_697417 ?auto_697420 ) ) ( not ( = ?auto_697417 ?auto_697421 ) ) ( not ( = ?auto_697417 ?auto_697422 ) ) ( not ( = ?auto_697417 ?auto_697423 ) ) ( not ( = ?auto_697417 ?auto_697424 ) ) ( not ( = ?auto_697417 ?auto_697425 ) ) ( not ( = ?auto_697417 ?auto_697426 ) ) ( not ( = ?auto_697418 ?auto_697419 ) ) ( not ( = ?auto_697418 ?auto_697420 ) ) ( not ( = ?auto_697418 ?auto_697421 ) ) ( not ( = ?auto_697418 ?auto_697422 ) ) ( not ( = ?auto_697418 ?auto_697423 ) ) ( not ( = ?auto_697418 ?auto_697424 ) ) ( not ( = ?auto_697418 ?auto_697425 ) ) ( not ( = ?auto_697418 ?auto_697426 ) ) ( not ( = ?auto_697419 ?auto_697420 ) ) ( not ( = ?auto_697419 ?auto_697421 ) ) ( not ( = ?auto_697419 ?auto_697422 ) ) ( not ( = ?auto_697419 ?auto_697423 ) ) ( not ( = ?auto_697419 ?auto_697424 ) ) ( not ( = ?auto_697419 ?auto_697425 ) ) ( not ( = ?auto_697419 ?auto_697426 ) ) ( not ( = ?auto_697420 ?auto_697421 ) ) ( not ( = ?auto_697420 ?auto_697422 ) ) ( not ( = ?auto_697420 ?auto_697423 ) ) ( not ( = ?auto_697420 ?auto_697424 ) ) ( not ( = ?auto_697420 ?auto_697425 ) ) ( not ( = ?auto_697420 ?auto_697426 ) ) ( not ( = ?auto_697421 ?auto_697422 ) ) ( not ( = ?auto_697421 ?auto_697423 ) ) ( not ( = ?auto_697421 ?auto_697424 ) ) ( not ( = ?auto_697421 ?auto_697425 ) ) ( not ( = ?auto_697421 ?auto_697426 ) ) ( not ( = ?auto_697422 ?auto_697423 ) ) ( not ( = ?auto_697422 ?auto_697424 ) ) ( not ( = ?auto_697422 ?auto_697425 ) ) ( not ( = ?auto_697422 ?auto_697426 ) ) ( not ( = ?auto_697423 ?auto_697424 ) ) ( not ( = ?auto_697423 ?auto_697425 ) ) ( not ( = ?auto_697423 ?auto_697426 ) ) ( not ( = ?auto_697424 ?auto_697425 ) ) ( not ( = ?auto_697424 ?auto_697426 ) ) ( not ( = ?auto_697425 ?auto_697426 ) ) ( ON ?auto_697424 ?auto_697425 ) ( ON ?auto_697423 ?auto_697424 ) ( ON ?auto_697422 ?auto_697423 ) ( ON ?auto_697421 ?auto_697422 ) ( ON ?auto_697420 ?auto_697421 ) ( ON ?auto_697419 ?auto_697420 ) ( CLEAR ?auto_697417 ) ( ON ?auto_697418 ?auto_697419 ) ( CLEAR ?auto_697418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_697414 ?auto_697415 ?auto_697416 ?auto_697417 ?auto_697418 )
      ( MAKE-12PILE ?auto_697414 ?auto_697415 ?auto_697416 ?auto_697417 ?auto_697418 ?auto_697419 ?auto_697420 ?auto_697421 ?auto_697422 ?auto_697423 ?auto_697424 ?auto_697425 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_697464 - BLOCK
      ?auto_697465 - BLOCK
      ?auto_697466 - BLOCK
      ?auto_697467 - BLOCK
      ?auto_697468 - BLOCK
      ?auto_697469 - BLOCK
      ?auto_697470 - BLOCK
      ?auto_697471 - BLOCK
      ?auto_697472 - BLOCK
      ?auto_697473 - BLOCK
      ?auto_697474 - BLOCK
      ?auto_697475 - BLOCK
    )
    :vars
    (
      ?auto_697476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697475 ?auto_697476 ) ( ON-TABLE ?auto_697464 ) ( ON ?auto_697465 ?auto_697464 ) ( ON ?auto_697466 ?auto_697465 ) ( not ( = ?auto_697464 ?auto_697465 ) ) ( not ( = ?auto_697464 ?auto_697466 ) ) ( not ( = ?auto_697464 ?auto_697467 ) ) ( not ( = ?auto_697464 ?auto_697468 ) ) ( not ( = ?auto_697464 ?auto_697469 ) ) ( not ( = ?auto_697464 ?auto_697470 ) ) ( not ( = ?auto_697464 ?auto_697471 ) ) ( not ( = ?auto_697464 ?auto_697472 ) ) ( not ( = ?auto_697464 ?auto_697473 ) ) ( not ( = ?auto_697464 ?auto_697474 ) ) ( not ( = ?auto_697464 ?auto_697475 ) ) ( not ( = ?auto_697464 ?auto_697476 ) ) ( not ( = ?auto_697465 ?auto_697466 ) ) ( not ( = ?auto_697465 ?auto_697467 ) ) ( not ( = ?auto_697465 ?auto_697468 ) ) ( not ( = ?auto_697465 ?auto_697469 ) ) ( not ( = ?auto_697465 ?auto_697470 ) ) ( not ( = ?auto_697465 ?auto_697471 ) ) ( not ( = ?auto_697465 ?auto_697472 ) ) ( not ( = ?auto_697465 ?auto_697473 ) ) ( not ( = ?auto_697465 ?auto_697474 ) ) ( not ( = ?auto_697465 ?auto_697475 ) ) ( not ( = ?auto_697465 ?auto_697476 ) ) ( not ( = ?auto_697466 ?auto_697467 ) ) ( not ( = ?auto_697466 ?auto_697468 ) ) ( not ( = ?auto_697466 ?auto_697469 ) ) ( not ( = ?auto_697466 ?auto_697470 ) ) ( not ( = ?auto_697466 ?auto_697471 ) ) ( not ( = ?auto_697466 ?auto_697472 ) ) ( not ( = ?auto_697466 ?auto_697473 ) ) ( not ( = ?auto_697466 ?auto_697474 ) ) ( not ( = ?auto_697466 ?auto_697475 ) ) ( not ( = ?auto_697466 ?auto_697476 ) ) ( not ( = ?auto_697467 ?auto_697468 ) ) ( not ( = ?auto_697467 ?auto_697469 ) ) ( not ( = ?auto_697467 ?auto_697470 ) ) ( not ( = ?auto_697467 ?auto_697471 ) ) ( not ( = ?auto_697467 ?auto_697472 ) ) ( not ( = ?auto_697467 ?auto_697473 ) ) ( not ( = ?auto_697467 ?auto_697474 ) ) ( not ( = ?auto_697467 ?auto_697475 ) ) ( not ( = ?auto_697467 ?auto_697476 ) ) ( not ( = ?auto_697468 ?auto_697469 ) ) ( not ( = ?auto_697468 ?auto_697470 ) ) ( not ( = ?auto_697468 ?auto_697471 ) ) ( not ( = ?auto_697468 ?auto_697472 ) ) ( not ( = ?auto_697468 ?auto_697473 ) ) ( not ( = ?auto_697468 ?auto_697474 ) ) ( not ( = ?auto_697468 ?auto_697475 ) ) ( not ( = ?auto_697468 ?auto_697476 ) ) ( not ( = ?auto_697469 ?auto_697470 ) ) ( not ( = ?auto_697469 ?auto_697471 ) ) ( not ( = ?auto_697469 ?auto_697472 ) ) ( not ( = ?auto_697469 ?auto_697473 ) ) ( not ( = ?auto_697469 ?auto_697474 ) ) ( not ( = ?auto_697469 ?auto_697475 ) ) ( not ( = ?auto_697469 ?auto_697476 ) ) ( not ( = ?auto_697470 ?auto_697471 ) ) ( not ( = ?auto_697470 ?auto_697472 ) ) ( not ( = ?auto_697470 ?auto_697473 ) ) ( not ( = ?auto_697470 ?auto_697474 ) ) ( not ( = ?auto_697470 ?auto_697475 ) ) ( not ( = ?auto_697470 ?auto_697476 ) ) ( not ( = ?auto_697471 ?auto_697472 ) ) ( not ( = ?auto_697471 ?auto_697473 ) ) ( not ( = ?auto_697471 ?auto_697474 ) ) ( not ( = ?auto_697471 ?auto_697475 ) ) ( not ( = ?auto_697471 ?auto_697476 ) ) ( not ( = ?auto_697472 ?auto_697473 ) ) ( not ( = ?auto_697472 ?auto_697474 ) ) ( not ( = ?auto_697472 ?auto_697475 ) ) ( not ( = ?auto_697472 ?auto_697476 ) ) ( not ( = ?auto_697473 ?auto_697474 ) ) ( not ( = ?auto_697473 ?auto_697475 ) ) ( not ( = ?auto_697473 ?auto_697476 ) ) ( not ( = ?auto_697474 ?auto_697475 ) ) ( not ( = ?auto_697474 ?auto_697476 ) ) ( not ( = ?auto_697475 ?auto_697476 ) ) ( ON ?auto_697474 ?auto_697475 ) ( ON ?auto_697473 ?auto_697474 ) ( ON ?auto_697472 ?auto_697473 ) ( ON ?auto_697471 ?auto_697472 ) ( ON ?auto_697470 ?auto_697471 ) ( ON ?auto_697469 ?auto_697470 ) ( ON ?auto_697468 ?auto_697469 ) ( CLEAR ?auto_697466 ) ( ON ?auto_697467 ?auto_697468 ) ( CLEAR ?auto_697467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_697464 ?auto_697465 ?auto_697466 ?auto_697467 )
      ( MAKE-12PILE ?auto_697464 ?auto_697465 ?auto_697466 ?auto_697467 ?auto_697468 ?auto_697469 ?auto_697470 ?auto_697471 ?auto_697472 ?auto_697473 ?auto_697474 ?auto_697475 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_697514 - BLOCK
      ?auto_697515 - BLOCK
      ?auto_697516 - BLOCK
      ?auto_697517 - BLOCK
      ?auto_697518 - BLOCK
      ?auto_697519 - BLOCK
      ?auto_697520 - BLOCK
      ?auto_697521 - BLOCK
      ?auto_697522 - BLOCK
      ?auto_697523 - BLOCK
      ?auto_697524 - BLOCK
      ?auto_697525 - BLOCK
    )
    :vars
    (
      ?auto_697526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697525 ?auto_697526 ) ( ON-TABLE ?auto_697514 ) ( ON ?auto_697515 ?auto_697514 ) ( not ( = ?auto_697514 ?auto_697515 ) ) ( not ( = ?auto_697514 ?auto_697516 ) ) ( not ( = ?auto_697514 ?auto_697517 ) ) ( not ( = ?auto_697514 ?auto_697518 ) ) ( not ( = ?auto_697514 ?auto_697519 ) ) ( not ( = ?auto_697514 ?auto_697520 ) ) ( not ( = ?auto_697514 ?auto_697521 ) ) ( not ( = ?auto_697514 ?auto_697522 ) ) ( not ( = ?auto_697514 ?auto_697523 ) ) ( not ( = ?auto_697514 ?auto_697524 ) ) ( not ( = ?auto_697514 ?auto_697525 ) ) ( not ( = ?auto_697514 ?auto_697526 ) ) ( not ( = ?auto_697515 ?auto_697516 ) ) ( not ( = ?auto_697515 ?auto_697517 ) ) ( not ( = ?auto_697515 ?auto_697518 ) ) ( not ( = ?auto_697515 ?auto_697519 ) ) ( not ( = ?auto_697515 ?auto_697520 ) ) ( not ( = ?auto_697515 ?auto_697521 ) ) ( not ( = ?auto_697515 ?auto_697522 ) ) ( not ( = ?auto_697515 ?auto_697523 ) ) ( not ( = ?auto_697515 ?auto_697524 ) ) ( not ( = ?auto_697515 ?auto_697525 ) ) ( not ( = ?auto_697515 ?auto_697526 ) ) ( not ( = ?auto_697516 ?auto_697517 ) ) ( not ( = ?auto_697516 ?auto_697518 ) ) ( not ( = ?auto_697516 ?auto_697519 ) ) ( not ( = ?auto_697516 ?auto_697520 ) ) ( not ( = ?auto_697516 ?auto_697521 ) ) ( not ( = ?auto_697516 ?auto_697522 ) ) ( not ( = ?auto_697516 ?auto_697523 ) ) ( not ( = ?auto_697516 ?auto_697524 ) ) ( not ( = ?auto_697516 ?auto_697525 ) ) ( not ( = ?auto_697516 ?auto_697526 ) ) ( not ( = ?auto_697517 ?auto_697518 ) ) ( not ( = ?auto_697517 ?auto_697519 ) ) ( not ( = ?auto_697517 ?auto_697520 ) ) ( not ( = ?auto_697517 ?auto_697521 ) ) ( not ( = ?auto_697517 ?auto_697522 ) ) ( not ( = ?auto_697517 ?auto_697523 ) ) ( not ( = ?auto_697517 ?auto_697524 ) ) ( not ( = ?auto_697517 ?auto_697525 ) ) ( not ( = ?auto_697517 ?auto_697526 ) ) ( not ( = ?auto_697518 ?auto_697519 ) ) ( not ( = ?auto_697518 ?auto_697520 ) ) ( not ( = ?auto_697518 ?auto_697521 ) ) ( not ( = ?auto_697518 ?auto_697522 ) ) ( not ( = ?auto_697518 ?auto_697523 ) ) ( not ( = ?auto_697518 ?auto_697524 ) ) ( not ( = ?auto_697518 ?auto_697525 ) ) ( not ( = ?auto_697518 ?auto_697526 ) ) ( not ( = ?auto_697519 ?auto_697520 ) ) ( not ( = ?auto_697519 ?auto_697521 ) ) ( not ( = ?auto_697519 ?auto_697522 ) ) ( not ( = ?auto_697519 ?auto_697523 ) ) ( not ( = ?auto_697519 ?auto_697524 ) ) ( not ( = ?auto_697519 ?auto_697525 ) ) ( not ( = ?auto_697519 ?auto_697526 ) ) ( not ( = ?auto_697520 ?auto_697521 ) ) ( not ( = ?auto_697520 ?auto_697522 ) ) ( not ( = ?auto_697520 ?auto_697523 ) ) ( not ( = ?auto_697520 ?auto_697524 ) ) ( not ( = ?auto_697520 ?auto_697525 ) ) ( not ( = ?auto_697520 ?auto_697526 ) ) ( not ( = ?auto_697521 ?auto_697522 ) ) ( not ( = ?auto_697521 ?auto_697523 ) ) ( not ( = ?auto_697521 ?auto_697524 ) ) ( not ( = ?auto_697521 ?auto_697525 ) ) ( not ( = ?auto_697521 ?auto_697526 ) ) ( not ( = ?auto_697522 ?auto_697523 ) ) ( not ( = ?auto_697522 ?auto_697524 ) ) ( not ( = ?auto_697522 ?auto_697525 ) ) ( not ( = ?auto_697522 ?auto_697526 ) ) ( not ( = ?auto_697523 ?auto_697524 ) ) ( not ( = ?auto_697523 ?auto_697525 ) ) ( not ( = ?auto_697523 ?auto_697526 ) ) ( not ( = ?auto_697524 ?auto_697525 ) ) ( not ( = ?auto_697524 ?auto_697526 ) ) ( not ( = ?auto_697525 ?auto_697526 ) ) ( ON ?auto_697524 ?auto_697525 ) ( ON ?auto_697523 ?auto_697524 ) ( ON ?auto_697522 ?auto_697523 ) ( ON ?auto_697521 ?auto_697522 ) ( ON ?auto_697520 ?auto_697521 ) ( ON ?auto_697519 ?auto_697520 ) ( ON ?auto_697518 ?auto_697519 ) ( ON ?auto_697517 ?auto_697518 ) ( CLEAR ?auto_697515 ) ( ON ?auto_697516 ?auto_697517 ) ( CLEAR ?auto_697516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_697514 ?auto_697515 ?auto_697516 )
      ( MAKE-12PILE ?auto_697514 ?auto_697515 ?auto_697516 ?auto_697517 ?auto_697518 ?auto_697519 ?auto_697520 ?auto_697521 ?auto_697522 ?auto_697523 ?auto_697524 ?auto_697525 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_697564 - BLOCK
      ?auto_697565 - BLOCK
      ?auto_697566 - BLOCK
      ?auto_697567 - BLOCK
      ?auto_697568 - BLOCK
      ?auto_697569 - BLOCK
      ?auto_697570 - BLOCK
      ?auto_697571 - BLOCK
      ?auto_697572 - BLOCK
      ?auto_697573 - BLOCK
      ?auto_697574 - BLOCK
      ?auto_697575 - BLOCK
    )
    :vars
    (
      ?auto_697576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697575 ?auto_697576 ) ( ON-TABLE ?auto_697564 ) ( not ( = ?auto_697564 ?auto_697565 ) ) ( not ( = ?auto_697564 ?auto_697566 ) ) ( not ( = ?auto_697564 ?auto_697567 ) ) ( not ( = ?auto_697564 ?auto_697568 ) ) ( not ( = ?auto_697564 ?auto_697569 ) ) ( not ( = ?auto_697564 ?auto_697570 ) ) ( not ( = ?auto_697564 ?auto_697571 ) ) ( not ( = ?auto_697564 ?auto_697572 ) ) ( not ( = ?auto_697564 ?auto_697573 ) ) ( not ( = ?auto_697564 ?auto_697574 ) ) ( not ( = ?auto_697564 ?auto_697575 ) ) ( not ( = ?auto_697564 ?auto_697576 ) ) ( not ( = ?auto_697565 ?auto_697566 ) ) ( not ( = ?auto_697565 ?auto_697567 ) ) ( not ( = ?auto_697565 ?auto_697568 ) ) ( not ( = ?auto_697565 ?auto_697569 ) ) ( not ( = ?auto_697565 ?auto_697570 ) ) ( not ( = ?auto_697565 ?auto_697571 ) ) ( not ( = ?auto_697565 ?auto_697572 ) ) ( not ( = ?auto_697565 ?auto_697573 ) ) ( not ( = ?auto_697565 ?auto_697574 ) ) ( not ( = ?auto_697565 ?auto_697575 ) ) ( not ( = ?auto_697565 ?auto_697576 ) ) ( not ( = ?auto_697566 ?auto_697567 ) ) ( not ( = ?auto_697566 ?auto_697568 ) ) ( not ( = ?auto_697566 ?auto_697569 ) ) ( not ( = ?auto_697566 ?auto_697570 ) ) ( not ( = ?auto_697566 ?auto_697571 ) ) ( not ( = ?auto_697566 ?auto_697572 ) ) ( not ( = ?auto_697566 ?auto_697573 ) ) ( not ( = ?auto_697566 ?auto_697574 ) ) ( not ( = ?auto_697566 ?auto_697575 ) ) ( not ( = ?auto_697566 ?auto_697576 ) ) ( not ( = ?auto_697567 ?auto_697568 ) ) ( not ( = ?auto_697567 ?auto_697569 ) ) ( not ( = ?auto_697567 ?auto_697570 ) ) ( not ( = ?auto_697567 ?auto_697571 ) ) ( not ( = ?auto_697567 ?auto_697572 ) ) ( not ( = ?auto_697567 ?auto_697573 ) ) ( not ( = ?auto_697567 ?auto_697574 ) ) ( not ( = ?auto_697567 ?auto_697575 ) ) ( not ( = ?auto_697567 ?auto_697576 ) ) ( not ( = ?auto_697568 ?auto_697569 ) ) ( not ( = ?auto_697568 ?auto_697570 ) ) ( not ( = ?auto_697568 ?auto_697571 ) ) ( not ( = ?auto_697568 ?auto_697572 ) ) ( not ( = ?auto_697568 ?auto_697573 ) ) ( not ( = ?auto_697568 ?auto_697574 ) ) ( not ( = ?auto_697568 ?auto_697575 ) ) ( not ( = ?auto_697568 ?auto_697576 ) ) ( not ( = ?auto_697569 ?auto_697570 ) ) ( not ( = ?auto_697569 ?auto_697571 ) ) ( not ( = ?auto_697569 ?auto_697572 ) ) ( not ( = ?auto_697569 ?auto_697573 ) ) ( not ( = ?auto_697569 ?auto_697574 ) ) ( not ( = ?auto_697569 ?auto_697575 ) ) ( not ( = ?auto_697569 ?auto_697576 ) ) ( not ( = ?auto_697570 ?auto_697571 ) ) ( not ( = ?auto_697570 ?auto_697572 ) ) ( not ( = ?auto_697570 ?auto_697573 ) ) ( not ( = ?auto_697570 ?auto_697574 ) ) ( not ( = ?auto_697570 ?auto_697575 ) ) ( not ( = ?auto_697570 ?auto_697576 ) ) ( not ( = ?auto_697571 ?auto_697572 ) ) ( not ( = ?auto_697571 ?auto_697573 ) ) ( not ( = ?auto_697571 ?auto_697574 ) ) ( not ( = ?auto_697571 ?auto_697575 ) ) ( not ( = ?auto_697571 ?auto_697576 ) ) ( not ( = ?auto_697572 ?auto_697573 ) ) ( not ( = ?auto_697572 ?auto_697574 ) ) ( not ( = ?auto_697572 ?auto_697575 ) ) ( not ( = ?auto_697572 ?auto_697576 ) ) ( not ( = ?auto_697573 ?auto_697574 ) ) ( not ( = ?auto_697573 ?auto_697575 ) ) ( not ( = ?auto_697573 ?auto_697576 ) ) ( not ( = ?auto_697574 ?auto_697575 ) ) ( not ( = ?auto_697574 ?auto_697576 ) ) ( not ( = ?auto_697575 ?auto_697576 ) ) ( ON ?auto_697574 ?auto_697575 ) ( ON ?auto_697573 ?auto_697574 ) ( ON ?auto_697572 ?auto_697573 ) ( ON ?auto_697571 ?auto_697572 ) ( ON ?auto_697570 ?auto_697571 ) ( ON ?auto_697569 ?auto_697570 ) ( ON ?auto_697568 ?auto_697569 ) ( ON ?auto_697567 ?auto_697568 ) ( ON ?auto_697566 ?auto_697567 ) ( CLEAR ?auto_697564 ) ( ON ?auto_697565 ?auto_697566 ) ( CLEAR ?auto_697565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_697564 ?auto_697565 )
      ( MAKE-12PILE ?auto_697564 ?auto_697565 ?auto_697566 ?auto_697567 ?auto_697568 ?auto_697569 ?auto_697570 ?auto_697571 ?auto_697572 ?auto_697573 ?auto_697574 ?auto_697575 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_697614 - BLOCK
      ?auto_697615 - BLOCK
      ?auto_697616 - BLOCK
      ?auto_697617 - BLOCK
      ?auto_697618 - BLOCK
      ?auto_697619 - BLOCK
      ?auto_697620 - BLOCK
      ?auto_697621 - BLOCK
      ?auto_697622 - BLOCK
      ?auto_697623 - BLOCK
      ?auto_697624 - BLOCK
      ?auto_697625 - BLOCK
    )
    :vars
    (
      ?auto_697626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697625 ?auto_697626 ) ( not ( = ?auto_697614 ?auto_697615 ) ) ( not ( = ?auto_697614 ?auto_697616 ) ) ( not ( = ?auto_697614 ?auto_697617 ) ) ( not ( = ?auto_697614 ?auto_697618 ) ) ( not ( = ?auto_697614 ?auto_697619 ) ) ( not ( = ?auto_697614 ?auto_697620 ) ) ( not ( = ?auto_697614 ?auto_697621 ) ) ( not ( = ?auto_697614 ?auto_697622 ) ) ( not ( = ?auto_697614 ?auto_697623 ) ) ( not ( = ?auto_697614 ?auto_697624 ) ) ( not ( = ?auto_697614 ?auto_697625 ) ) ( not ( = ?auto_697614 ?auto_697626 ) ) ( not ( = ?auto_697615 ?auto_697616 ) ) ( not ( = ?auto_697615 ?auto_697617 ) ) ( not ( = ?auto_697615 ?auto_697618 ) ) ( not ( = ?auto_697615 ?auto_697619 ) ) ( not ( = ?auto_697615 ?auto_697620 ) ) ( not ( = ?auto_697615 ?auto_697621 ) ) ( not ( = ?auto_697615 ?auto_697622 ) ) ( not ( = ?auto_697615 ?auto_697623 ) ) ( not ( = ?auto_697615 ?auto_697624 ) ) ( not ( = ?auto_697615 ?auto_697625 ) ) ( not ( = ?auto_697615 ?auto_697626 ) ) ( not ( = ?auto_697616 ?auto_697617 ) ) ( not ( = ?auto_697616 ?auto_697618 ) ) ( not ( = ?auto_697616 ?auto_697619 ) ) ( not ( = ?auto_697616 ?auto_697620 ) ) ( not ( = ?auto_697616 ?auto_697621 ) ) ( not ( = ?auto_697616 ?auto_697622 ) ) ( not ( = ?auto_697616 ?auto_697623 ) ) ( not ( = ?auto_697616 ?auto_697624 ) ) ( not ( = ?auto_697616 ?auto_697625 ) ) ( not ( = ?auto_697616 ?auto_697626 ) ) ( not ( = ?auto_697617 ?auto_697618 ) ) ( not ( = ?auto_697617 ?auto_697619 ) ) ( not ( = ?auto_697617 ?auto_697620 ) ) ( not ( = ?auto_697617 ?auto_697621 ) ) ( not ( = ?auto_697617 ?auto_697622 ) ) ( not ( = ?auto_697617 ?auto_697623 ) ) ( not ( = ?auto_697617 ?auto_697624 ) ) ( not ( = ?auto_697617 ?auto_697625 ) ) ( not ( = ?auto_697617 ?auto_697626 ) ) ( not ( = ?auto_697618 ?auto_697619 ) ) ( not ( = ?auto_697618 ?auto_697620 ) ) ( not ( = ?auto_697618 ?auto_697621 ) ) ( not ( = ?auto_697618 ?auto_697622 ) ) ( not ( = ?auto_697618 ?auto_697623 ) ) ( not ( = ?auto_697618 ?auto_697624 ) ) ( not ( = ?auto_697618 ?auto_697625 ) ) ( not ( = ?auto_697618 ?auto_697626 ) ) ( not ( = ?auto_697619 ?auto_697620 ) ) ( not ( = ?auto_697619 ?auto_697621 ) ) ( not ( = ?auto_697619 ?auto_697622 ) ) ( not ( = ?auto_697619 ?auto_697623 ) ) ( not ( = ?auto_697619 ?auto_697624 ) ) ( not ( = ?auto_697619 ?auto_697625 ) ) ( not ( = ?auto_697619 ?auto_697626 ) ) ( not ( = ?auto_697620 ?auto_697621 ) ) ( not ( = ?auto_697620 ?auto_697622 ) ) ( not ( = ?auto_697620 ?auto_697623 ) ) ( not ( = ?auto_697620 ?auto_697624 ) ) ( not ( = ?auto_697620 ?auto_697625 ) ) ( not ( = ?auto_697620 ?auto_697626 ) ) ( not ( = ?auto_697621 ?auto_697622 ) ) ( not ( = ?auto_697621 ?auto_697623 ) ) ( not ( = ?auto_697621 ?auto_697624 ) ) ( not ( = ?auto_697621 ?auto_697625 ) ) ( not ( = ?auto_697621 ?auto_697626 ) ) ( not ( = ?auto_697622 ?auto_697623 ) ) ( not ( = ?auto_697622 ?auto_697624 ) ) ( not ( = ?auto_697622 ?auto_697625 ) ) ( not ( = ?auto_697622 ?auto_697626 ) ) ( not ( = ?auto_697623 ?auto_697624 ) ) ( not ( = ?auto_697623 ?auto_697625 ) ) ( not ( = ?auto_697623 ?auto_697626 ) ) ( not ( = ?auto_697624 ?auto_697625 ) ) ( not ( = ?auto_697624 ?auto_697626 ) ) ( not ( = ?auto_697625 ?auto_697626 ) ) ( ON ?auto_697624 ?auto_697625 ) ( ON ?auto_697623 ?auto_697624 ) ( ON ?auto_697622 ?auto_697623 ) ( ON ?auto_697621 ?auto_697622 ) ( ON ?auto_697620 ?auto_697621 ) ( ON ?auto_697619 ?auto_697620 ) ( ON ?auto_697618 ?auto_697619 ) ( ON ?auto_697617 ?auto_697618 ) ( ON ?auto_697616 ?auto_697617 ) ( ON ?auto_697615 ?auto_697616 ) ( ON ?auto_697614 ?auto_697615 ) ( CLEAR ?auto_697614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_697614 )
      ( MAKE-12PILE ?auto_697614 ?auto_697615 ?auto_697616 ?auto_697617 ?auto_697618 ?auto_697619 ?auto_697620 ?auto_697621 ?auto_697622 ?auto_697623 ?auto_697624 ?auto_697625 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_697665 - BLOCK
      ?auto_697666 - BLOCK
      ?auto_697667 - BLOCK
      ?auto_697668 - BLOCK
      ?auto_697669 - BLOCK
      ?auto_697670 - BLOCK
      ?auto_697671 - BLOCK
      ?auto_697672 - BLOCK
      ?auto_697673 - BLOCK
      ?auto_697674 - BLOCK
      ?auto_697675 - BLOCK
      ?auto_697676 - BLOCK
      ?auto_697677 - BLOCK
    )
    :vars
    (
      ?auto_697678 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_697676 ) ( ON ?auto_697677 ?auto_697678 ) ( CLEAR ?auto_697677 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_697665 ) ( ON ?auto_697666 ?auto_697665 ) ( ON ?auto_697667 ?auto_697666 ) ( ON ?auto_697668 ?auto_697667 ) ( ON ?auto_697669 ?auto_697668 ) ( ON ?auto_697670 ?auto_697669 ) ( ON ?auto_697671 ?auto_697670 ) ( ON ?auto_697672 ?auto_697671 ) ( ON ?auto_697673 ?auto_697672 ) ( ON ?auto_697674 ?auto_697673 ) ( ON ?auto_697675 ?auto_697674 ) ( ON ?auto_697676 ?auto_697675 ) ( not ( = ?auto_697665 ?auto_697666 ) ) ( not ( = ?auto_697665 ?auto_697667 ) ) ( not ( = ?auto_697665 ?auto_697668 ) ) ( not ( = ?auto_697665 ?auto_697669 ) ) ( not ( = ?auto_697665 ?auto_697670 ) ) ( not ( = ?auto_697665 ?auto_697671 ) ) ( not ( = ?auto_697665 ?auto_697672 ) ) ( not ( = ?auto_697665 ?auto_697673 ) ) ( not ( = ?auto_697665 ?auto_697674 ) ) ( not ( = ?auto_697665 ?auto_697675 ) ) ( not ( = ?auto_697665 ?auto_697676 ) ) ( not ( = ?auto_697665 ?auto_697677 ) ) ( not ( = ?auto_697665 ?auto_697678 ) ) ( not ( = ?auto_697666 ?auto_697667 ) ) ( not ( = ?auto_697666 ?auto_697668 ) ) ( not ( = ?auto_697666 ?auto_697669 ) ) ( not ( = ?auto_697666 ?auto_697670 ) ) ( not ( = ?auto_697666 ?auto_697671 ) ) ( not ( = ?auto_697666 ?auto_697672 ) ) ( not ( = ?auto_697666 ?auto_697673 ) ) ( not ( = ?auto_697666 ?auto_697674 ) ) ( not ( = ?auto_697666 ?auto_697675 ) ) ( not ( = ?auto_697666 ?auto_697676 ) ) ( not ( = ?auto_697666 ?auto_697677 ) ) ( not ( = ?auto_697666 ?auto_697678 ) ) ( not ( = ?auto_697667 ?auto_697668 ) ) ( not ( = ?auto_697667 ?auto_697669 ) ) ( not ( = ?auto_697667 ?auto_697670 ) ) ( not ( = ?auto_697667 ?auto_697671 ) ) ( not ( = ?auto_697667 ?auto_697672 ) ) ( not ( = ?auto_697667 ?auto_697673 ) ) ( not ( = ?auto_697667 ?auto_697674 ) ) ( not ( = ?auto_697667 ?auto_697675 ) ) ( not ( = ?auto_697667 ?auto_697676 ) ) ( not ( = ?auto_697667 ?auto_697677 ) ) ( not ( = ?auto_697667 ?auto_697678 ) ) ( not ( = ?auto_697668 ?auto_697669 ) ) ( not ( = ?auto_697668 ?auto_697670 ) ) ( not ( = ?auto_697668 ?auto_697671 ) ) ( not ( = ?auto_697668 ?auto_697672 ) ) ( not ( = ?auto_697668 ?auto_697673 ) ) ( not ( = ?auto_697668 ?auto_697674 ) ) ( not ( = ?auto_697668 ?auto_697675 ) ) ( not ( = ?auto_697668 ?auto_697676 ) ) ( not ( = ?auto_697668 ?auto_697677 ) ) ( not ( = ?auto_697668 ?auto_697678 ) ) ( not ( = ?auto_697669 ?auto_697670 ) ) ( not ( = ?auto_697669 ?auto_697671 ) ) ( not ( = ?auto_697669 ?auto_697672 ) ) ( not ( = ?auto_697669 ?auto_697673 ) ) ( not ( = ?auto_697669 ?auto_697674 ) ) ( not ( = ?auto_697669 ?auto_697675 ) ) ( not ( = ?auto_697669 ?auto_697676 ) ) ( not ( = ?auto_697669 ?auto_697677 ) ) ( not ( = ?auto_697669 ?auto_697678 ) ) ( not ( = ?auto_697670 ?auto_697671 ) ) ( not ( = ?auto_697670 ?auto_697672 ) ) ( not ( = ?auto_697670 ?auto_697673 ) ) ( not ( = ?auto_697670 ?auto_697674 ) ) ( not ( = ?auto_697670 ?auto_697675 ) ) ( not ( = ?auto_697670 ?auto_697676 ) ) ( not ( = ?auto_697670 ?auto_697677 ) ) ( not ( = ?auto_697670 ?auto_697678 ) ) ( not ( = ?auto_697671 ?auto_697672 ) ) ( not ( = ?auto_697671 ?auto_697673 ) ) ( not ( = ?auto_697671 ?auto_697674 ) ) ( not ( = ?auto_697671 ?auto_697675 ) ) ( not ( = ?auto_697671 ?auto_697676 ) ) ( not ( = ?auto_697671 ?auto_697677 ) ) ( not ( = ?auto_697671 ?auto_697678 ) ) ( not ( = ?auto_697672 ?auto_697673 ) ) ( not ( = ?auto_697672 ?auto_697674 ) ) ( not ( = ?auto_697672 ?auto_697675 ) ) ( not ( = ?auto_697672 ?auto_697676 ) ) ( not ( = ?auto_697672 ?auto_697677 ) ) ( not ( = ?auto_697672 ?auto_697678 ) ) ( not ( = ?auto_697673 ?auto_697674 ) ) ( not ( = ?auto_697673 ?auto_697675 ) ) ( not ( = ?auto_697673 ?auto_697676 ) ) ( not ( = ?auto_697673 ?auto_697677 ) ) ( not ( = ?auto_697673 ?auto_697678 ) ) ( not ( = ?auto_697674 ?auto_697675 ) ) ( not ( = ?auto_697674 ?auto_697676 ) ) ( not ( = ?auto_697674 ?auto_697677 ) ) ( not ( = ?auto_697674 ?auto_697678 ) ) ( not ( = ?auto_697675 ?auto_697676 ) ) ( not ( = ?auto_697675 ?auto_697677 ) ) ( not ( = ?auto_697675 ?auto_697678 ) ) ( not ( = ?auto_697676 ?auto_697677 ) ) ( not ( = ?auto_697676 ?auto_697678 ) ) ( not ( = ?auto_697677 ?auto_697678 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_697677 ?auto_697678 )
      ( !STACK ?auto_697677 ?auto_697676 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_697719 - BLOCK
      ?auto_697720 - BLOCK
      ?auto_697721 - BLOCK
      ?auto_697722 - BLOCK
      ?auto_697723 - BLOCK
      ?auto_697724 - BLOCK
      ?auto_697725 - BLOCK
      ?auto_697726 - BLOCK
      ?auto_697727 - BLOCK
      ?auto_697728 - BLOCK
      ?auto_697729 - BLOCK
      ?auto_697730 - BLOCK
      ?auto_697731 - BLOCK
    )
    :vars
    (
      ?auto_697732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697731 ?auto_697732 ) ( ON-TABLE ?auto_697719 ) ( ON ?auto_697720 ?auto_697719 ) ( ON ?auto_697721 ?auto_697720 ) ( ON ?auto_697722 ?auto_697721 ) ( ON ?auto_697723 ?auto_697722 ) ( ON ?auto_697724 ?auto_697723 ) ( ON ?auto_697725 ?auto_697724 ) ( ON ?auto_697726 ?auto_697725 ) ( ON ?auto_697727 ?auto_697726 ) ( ON ?auto_697728 ?auto_697727 ) ( ON ?auto_697729 ?auto_697728 ) ( not ( = ?auto_697719 ?auto_697720 ) ) ( not ( = ?auto_697719 ?auto_697721 ) ) ( not ( = ?auto_697719 ?auto_697722 ) ) ( not ( = ?auto_697719 ?auto_697723 ) ) ( not ( = ?auto_697719 ?auto_697724 ) ) ( not ( = ?auto_697719 ?auto_697725 ) ) ( not ( = ?auto_697719 ?auto_697726 ) ) ( not ( = ?auto_697719 ?auto_697727 ) ) ( not ( = ?auto_697719 ?auto_697728 ) ) ( not ( = ?auto_697719 ?auto_697729 ) ) ( not ( = ?auto_697719 ?auto_697730 ) ) ( not ( = ?auto_697719 ?auto_697731 ) ) ( not ( = ?auto_697719 ?auto_697732 ) ) ( not ( = ?auto_697720 ?auto_697721 ) ) ( not ( = ?auto_697720 ?auto_697722 ) ) ( not ( = ?auto_697720 ?auto_697723 ) ) ( not ( = ?auto_697720 ?auto_697724 ) ) ( not ( = ?auto_697720 ?auto_697725 ) ) ( not ( = ?auto_697720 ?auto_697726 ) ) ( not ( = ?auto_697720 ?auto_697727 ) ) ( not ( = ?auto_697720 ?auto_697728 ) ) ( not ( = ?auto_697720 ?auto_697729 ) ) ( not ( = ?auto_697720 ?auto_697730 ) ) ( not ( = ?auto_697720 ?auto_697731 ) ) ( not ( = ?auto_697720 ?auto_697732 ) ) ( not ( = ?auto_697721 ?auto_697722 ) ) ( not ( = ?auto_697721 ?auto_697723 ) ) ( not ( = ?auto_697721 ?auto_697724 ) ) ( not ( = ?auto_697721 ?auto_697725 ) ) ( not ( = ?auto_697721 ?auto_697726 ) ) ( not ( = ?auto_697721 ?auto_697727 ) ) ( not ( = ?auto_697721 ?auto_697728 ) ) ( not ( = ?auto_697721 ?auto_697729 ) ) ( not ( = ?auto_697721 ?auto_697730 ) ) ( not ( = ?auto_697721 ?auto_697731 ) ) ( not ( = ?auto_697721 ?auto_697732 ) ) ( not ( = ?auto_697722 ?auto_697723 ) ) ( not ( = ?auto_697722 ?auto_697724 ) ) ( not ( = ?auto_697722 ?auto_697725 ) ) ( not ( = ?auto_697722 ?auto_697726 ) ) ( not ( = ?auto_697722 ?auto_697727 ) ) ( not ( = ?auto_697722 ?auto_697728 ) ) ( not ( = ?auto_697722 ?auto_697729 ) ) ( not ( = ?auto_697722 ?auto_697730 ) ) ( not ( = ?auto_697722 ?auto_697731 ) ) ( not ( = ?auto_697722 ?auto_697732 ) ) ( not ( = ?auto_697723 ?auto_697724 ) ) ( not ( = ?auto_697723 ?auto_697725 ) ) ( not ( = ?auto_697723 ?auto_697726 ) ) ( not ( = ?auto_697723 ?auto_697727 ) ) ( not ( = ?auto_697723 ?auto_697728 ) ) ( not ( = ?auto_697723 ?auto_697729 ) ) ( not ( = ?auto_697723 ?auto_697730 ) ) ( not ( = ?auto_697723 ?auto_697731 ) ) ( not ( = ?auto_697723 ?auto_697732 ) ) ( not ( = ?auto_697724 ?auto_697725 ) ) ( not ( = ?auto_697724 ?auto_697726 ) ) ( not ( = ?auto_697724 ?auto_697727 ) ) ( not ( = ?auto_697724 ?auto_697728 ) ) ( not ( = ?auto_697724 ?auto_697729 ) ) ( not ( = ?auto_697724 ?auto_697730 ) ) ( not ( = ?auto_697724 ?auto_697731 ) ) ( not ( = ?auto_697724 ?auto_697732 ) ) ( not ( = ?auto_697725 ?auto_697726 ) ) ( not ( = ?auto_697725 ?auto_697727 ) ) ( not ( = ?auto_697725 ?auto_697728 ) ) ( not ( = ?auto_697725 ?auto_697729 ) ) ( not ( = ?auto_697725 ?auto_697730 ) ) ( not ( = ?auto_697725 ?auto_697731 ) ) ( not ( = ?auto_697725 ?auto_697732 ) ) ( not ( = ?auto_697726 ?auto_697727 ) ) ( not ( = ?auto_697726 ?auto_697728 ) ) ( not ( = ?auto_697726 ?auto_697729 ) ) ( not ( = ?auto_697726 ?auto_697730 ) ) ( not ( = ?auto_697726 ?auto_697731 ) ) ( not ( = ?auto_697726 ?auto_697732 ) ) ( not ( = ?auto_697727 ?auto_697728 ) ) ( not ( = ?auto_697727 ?auto_697729 ) ) ( not ( = ?auto_697727 ?auto_697730 ) ) ( not ( = ?auto_697727 ?auto_697731 ) ) ( not ( = ?auto_697727 ?auto_697732 ) ) ( not ( = ?auto_697728 ?auto_697729 ) ) ( not ( = ?auto_697728 ?auto_697730 ) ) ( not ( = ?auto_697728 ?auto_697731 ) ) ( not ( = ?auto_697728 ?auto_697732 ) ) ( not ( = ?auto_697729 ?auto_697730 ) ) ( not ( = ?auto_697729 ?auto_697731 ) ) ( not ( = ?auto_697729 ?auto_697732 ) ) ( not ( = ?auto_697730 ?auto_697731 ) ) ( not ( = ?auto_697730 ?auto_697732 ) ) ( not ( = ?auto_697731 ?auto_697732 ) ) ( CLEAR ?auto_697729 ) ( ON ?auto_697730 ?auto_697731 ) ( CLEAR ?auto_697730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_697719 ?auto_697720 ?auto_697721 ?auto_697722 ?auto_697723 ?auto_697724 ?auto_697725 ?auto_697726 ?auto_697727 ?auto_697728 ?auto_697729 ?auto_697730 )
      ( MAKE-13PILE ?auto_697719 ?auto_697720 ?auto_697721 ?auto_697722 ?auto_697723 ?auto_697724 ?auto_697725 ?auto_697726 ?auto_697727 ?auto_697728 ?auto_697729 ?auto_697730 ?auto_697731 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_697773 - BLOCK
      ?auto_697774 - BLOCK
      ?auto_697775 - BLOCK
      ?auto_697776 - BLOCK
      ?auto_697777 - BLOCK
      ?auto_697778 - BLOCK
      ?auto_697779 - BLOCK
      ?auto_697780 - BLOCK
      ?auto_697781 - BLOCK
      ?auto_697782 - BLOCK
      ?auto_697783 - BLOCK
      ?auto_697784 - BLOCK
      ?auto_697785 - BLOCK
    )
    :vars
    (
      ?auto_697786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697785 ?auto_697786 ) ( ON-TABLE ?auto_697773 ) ( ON ?auto_697774 ?auto_697773 ) ( ON ?auto_697775 ?auto_697774 ) ( ON ?auto_697776 ?auto_697775 ) ( ON ?auto_697777 ?auto_697776 ) ( ON ?auto_697778 ?auto_697777 ) ( ON ?auto_697779 ?auto_697778 ) ( ON ?auto_697780 ?auto_697779 ) ( ON ?auto_697781 ?auto_697780 ) ( ON ?auto_697782 ?auto_697781 ) ( not ( = ?auto_697773 ?auto_697774 ) ) ( not ( = ?auto_697773 ?auto_697775 ) ) ( not ( = ?auto_697773 ?auto_697776 ) ) ( not ( = ?auto_697773 ?auto_697777 ) ) ( not ( = ?auto_697773 ?auto_697778 ) ) ( not ( = ?auto_697773 ?auto_697779 ) ) ( not ( = ?auto_697773 ?auto_697780 ) ) ( not ( = ?auto_697773 ?auto_697781 ) ) ( not ( = ?auto_697773 ?auto_697782 ) ) ( not ( = ?auto_697773 ?auto_697783 ) ) ( not ( = ?auto_697773 ?auto_697784 ) ) ( not ( = ?auto_697773 ?auto_697785 ) ) ( not ( = ?auto_697773 ?auto_697786 ) ) ( not ( = ?auto_697774 ?auto_697775 ) ) ( not ( = ?auto_697774 ?auto_697776 ) ) ( not ( = ?auto_697774 ?auto_697777 ) ) ( not ( = ?auto_697774 ?auto_697778 ) ) ( not ( = ?auto_697774 ?auto_697779 ) ) ( not ( = ?auto_697774 ?auto_697780 ) ) ( not ( = ?auto_697774 ?auto_697781 ) ) ( not ( = ?auto_697774 ?auto_697782 ) ) ( not ( = ?auto_697774 ?auto_697783 ) ) ( not ( = ?auto_697774 ?auto_697784 ) ) ( not ( = ?auto_697774 ?auto_697785 ) ) ( not ( = ?auto_697774 ?auto_697786 ) ) ( not ( = ?auto_697775 ?auto_697776 ) ) ( not ( = ?auto_697775 ?auto_697777 ) ) ( not ( = ?auto_697775 ?auto_697778 ) ) ( not ( = ?auto_697775 ?auto_697779 ) ) ( not ( = ?auto_697775 ?auto_697780 ) ) ( not ( = ?auto_697775 ?auto_697781 ) ) ( not ( = ?auto_697775 ?auto_697782 ) ) ( not ( = ?auto_697775 ?auto_697783 ) ) ( not ( = ?auto_697775 ?auto_697784 ) ) ( not ( = ?auto_697775 ?auto_697785 ) ) ( not ( = ?auto_697775 ?auto_697786 ) ) ( not ( = ?auto_697776 ?auto_697777 ) ) ( not ( = ?auto_697776 ?auto_697778 ) ) ( not ( = ?auto_697776 ?auto_697779 ) ) ( not ( = ?auto_697776 ?auto_697780 ) ) ( not ( = ?auto_697776 ?auto_697781 ) ) ( not ( = ?auto_697776 ?auto_697782 ) ) ( not ( = ?auto_697776 ?auto_697783 ) ) ( not ( = ?auto_697776 ?auto_697784 ) ) ( not ( = ?auto_697776 ?auto_697785 ) ) ( not ( = ?auto_697776 ?auto_697786 ) ) ( not ( = ?auto_697777 ?auto_697778 ) ) ( not ( = ?auto_697777 ?auto_697779 ) ) ( not ( = ?auto_697777 ?auto_697780 ) ) ( not ( = ?auto_697777 ?auto_697781 ) ) ( not ( = ?auto_697777 ?auto_697782 ) ) ( not ( = ?auto_697777 ?auto_697783 ) ) ( not ( = ?auto_697777 ?auto_697784 ) ) ( not ( = ?auto_697777 ?auto_697785 ) ) ( not ( = ?auto_697777 ?auto_697786 ) ) ( not ( = ?auto_697778 ?auto_697779 ) ) ( not ( = ?auto_697778 ?auto_697780 ) ) ( not ( = ?auto_697778 ?auto_697781 ) ) ( not ( = ?auto_697778 ?auto_697782 ) ) ( not ( = ?auto_697778 ?auto_697783 ) ) ( not ( = ?auto_697778 ?auto_697784 ) ) ( not ( = ?auto_697778 ?auto_697785 ) ) ( not ( = ?auto_697778 ?auto_697786 ) ) ( not ( = ?auto_697779 ?auto_697780 ) ) ( not ( = ?auto_697779 ?auto_697781 ) ) ( not ( = ?auto_697779 ?auto_697782 ) ) ( not ( = ?auto_697779 ?auto_697783 ) ) ( not ( = ?auto_697779 ?auto_697784 ) ) ( not ( = ?auto_697779 ?auto_697785 ) ) ( not ( = ?auto_697779 ?auto_697786 ) ) ( not ( = ?auto_697780 ?auto_697781 ) ) ( not ( = ?auto_697780 ?auto_697782 ) ) ( not ( = ?auto_697780 ?auto_697783 ) ) ( not ( = ?auto_697780 ?auto_697784 ) ) ( not ( = ?auto_697780 ?auto_697785 ) ) ( not ( = ?auto_697780 ?auto_697786 ) ) ( not ( = ?auto_697781 ?auto_697782 ) ) ( not ( = ?auto_697781 ?auto_697783 ) ) ( not ( = ?auto_697781 ?auto_697784 ) ) ( not ( = ?auto_697781 ?auto_697785 ) ) ( not ( = ?auto_697781 ?auto_697786 ) ) ( not ( = ?auto_697782 ?auto_697783 ) ) ( not ( = ?auto_697782 ?auto_697784 ) ) ( not ( = ?auto_697782 ?auto_697785 ) ) ( not ( = ?auto_697782 ?auto_697786 ) ) ( not ( = ?auto_697783 ?auto_697784 ) ) ( not ( = ?auto_697783 ?auto_697785 ) ) ( not ( = ?auto_697783 ?auto_697786 ) ) ( not ( = ?auto_697784 ?auto_697785 ) ) ( not ( = ?auto_697784 ?auto_697786 ) ) ( not ( = ?auto_697785 ?auto_697786 ) ) ( ON ?auto_697784 ?auto_697785 ) ( CLEAR ?auto_697782 ) ( ON ?auto_697783 ?auto_697784 ) ( CLEAR ?auto_697783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_697773 ?auto_697774 ?auto_697775 ?auto_697776 ?auto_697777 ?auto_697778 ?auto_697779 ?auto_697780 ?auto_697781 ?auto_697782 ?auto_697783 )
      ( MAKE-13PILE ?auto_697773 ?auto_697774 ?auto_697775 ?auto_697776 ?auto_697777 ?auto_697778 ?auto_697779 ?auto_697780 ?auto_697781 ?auto_697782 ?auto_697783 ?auto_697784 ?auto_697785 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_697827 - BLOCK
      ?auto_697828 - BLOCK
      ?auto_697829 - BLOCK
      ?auto_697830 - BLOCK
      ?auto_697831 - BLOCK
      ?auto_697832 - BLOCK
      ?auto_697833 - BLOCK
      ?auto_697834 - BLOCK
      ?auto_697835 - BLOCK
      ?auto_697836 - BLOCK
      ?auto_697837 - BLOCK
      ?auto_697838 - BLOCK
      ?auto_697839 - BLOCK
    )
    :vars
    (
      ?auto_697840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697839 ?auto_697840 ) ( ON-TABLE ?auto_697827 ) ( ON ?auto_697828 ?auto_697827 ) ( ON ?auto_697829 ?auto_697828 ) ( ON ?auto_697830 ?auto_697829 ) ( ON ?auto_697831 ?auto_697830 ) ( ON ?auto_697832 ?auto_697831 ) ( ON ?auto_697833 ?auto_697832 ) ( ON ?auto_697834 ?auto_697833 ) ( ON ?auto_697835 ?auto_697834 ) ( not ( = ?auto_697827 ?auto_697828 ) ) ( not ( = ?auto_697827 ?auto_697829 ) ) ( not ( = ?auto_697827 ?auto_697830 ) ) ( not ( = ?auto_697827 ?auto_697831 ) ) ( not ( = ?auto_697827 ?auto_697832 ) ) ( not ( = ?auto_697827 ?auto_697833 ) ) ( not ( = ?auto_697827 ?auto_697834 ) ) ( not ( = ?auto_697827 ?auto_697835 ) ) ( not ( = ?auto_697827 ?auto_697836 ) ) ( not ( = ?auto_697827 ?auto_697837 ) ) ( not ( = ?auto_697827 ?auto_697838 ) ) ( not ( = ?auto_697827 ?auto_697839 ) ) ( not ( = ?auto_697827 ?auto_697840 ) ) ( not ( = ?auto_697828 ?auto_697829 ) ) ( not ( = ?auto_697828 ?auto_697830 ) ) ( not ( = ?auto_697828 ?auto_697831 ) ) ( not ( = ?auto_697828 ?auto_697832 ) ) ( not ( = ?auto_697828 ?auto_697833 ) ) ( not ( = ?auto_697828 ?auto_697834 ) ) ( not ( = ?auto_697828 ?auto_697835 ) ) ( not ( = ?auto_697828 ?auto_697836 ) ) ( not ( = ?auto_697828 ?auto_697837 ) ) ( not ( = ?auto_697828 ?auto_697838 ) ) ( not ( = ?auto_697828 ?auto_697839 ) ) ( not ( = ?auto_697828 ?auto_697840 ) ) ( not ( = ?auto_697829 ?auto_697830 ) ) ( not ( = ?auto_697829 ?auto_697831 ) ) ( not ( = ?auto_697829 ?auto_697832 ) ) ( not ( = ?auto_697829 ?auto_697833 ) ) ( not ( = ?auto_697829 ?auto_697834 ) ) ( not ( = ?auto_697829 ?auto_697835 ) ) ( not ( = ?auto_697829 ?auto_697836 ) ) ( not ( = ?auto_697829 ?auto_697837 ) ) ( not ( = ?auto_697829 ?auto_697838 ) ) ( not ( = ?auto_697829 ?auto_697839 ) ) ( not ( = ?auto_697829 ?auto_697840 ) ) ( not ( = ?auto_697830 ?auto_697831 ) ) ( not ( = ?auto_697830 ?auto_697832 ) ) ( not ( = ?auto_697830 ?auto_697833 ) ) ( not ( = ?auto_697830 ?auto_697834 ) ) ( not ( = ?auto_697830 ?auto_697835 ) ) ( not ( = ?auto_697830 ?auto_697836 ) ) ( not ( = ?auto_697830 ?auto_697837 ) ) ( not ( = ?auto_697830 ?auto_697838 ) ) ( not ( = ?auto_697830 ?auto_697839 ) ) ( not ( = ?auto_697830 ?auto_697840 ) ) ( not ( = ?auto_697831 ?auto_697832 ) ) ( not ( = ?auto_697831 ?auto_697833 ) ) ( not ( = ?auto_697831 ?auto_697834 ) ) ( not ( = ?auto_697831 ?auto_697835 ) ) ( not ( = ?auto_697831 ?auto_697836 ) ) ( not ( = ?auto_697831 ?auto_697837 ) ) ( not ( = ?auto_697831 ?auto_697838 ) ) ( not ( = ?auto_697831 ?auto_697839 ) ) ( not ( = ?auto_697831 ?auto_697840 ) ) ( not ( = ?auto_697832 ?auto_697833 ) ) ( not ( = ?auto_697832 ?auto_697834 ) ) ( not ( = ?auto_697832 ?auto_697835 ) ) ( not ( = ?auto_697832 ?auto_697836 ) ) ( not ( = ?auto_697832 ?auto_697837 ) ) ( not ( = ?auto_697832 ?auto_697838 ) ) ( not ( = ?auto_697832 ?auto_697839 ) ) ( not ( = ?auto_697832 ?auto_697840 ) ) ( not ( = ?auto_697833 ?auto_697834 ) ) ( not ( = ?auto_697833 ?auto_697835 ) ) ( not ( = ?auto_697833 ?auto_697836 ) ) ( not ( = ?auto_697833 ?auto_697837 ) ) ( not ( = ?auto_697833 ?auto_697838 ) ) ( not ( = ?auto_697833 ?auto_697839 ) ) ( not ( = ?auto_697833 ?auto_697840 ) ) ( not ( = ?auto_697834 ?auto_697835 ) ) ( not ( = ?auto_697834 ?auto_697836 ) ) ( not ( = ?auto_697834 ?auto_697837 ) ) ( not ( = ?auto_697834 ?auto_697838 ) ) ( not ( = ?auto_697834 ?auto_697839 ) ) ( not ( = ?auto_697834 ?auto_697840 ) ) ( not ( = ?auto_697835 ?auto_697836 ) ) ( not ( = ?auto_697835 ?auto_697837 ) ) ( not ( = ?auto_697835 ?auto_697838 ) ) ( not ( = ?auto_697835 ?auto_697839 ) ) ( not ( = ?auto_697835 ?auto_697840 ) ) ( not ( = ?auto_697836 ?auto_697837 ) ) ( not ( = ?auto_697836 ?auto_697838 ) ) ( not ( = ?auto_697836 ?auto_697839 ) ) ( not ( = ?auto_697836 ?auto_697840 ) ) ( not ( = ?auto_697837 ?auto_697838 ) ) ( not ( = ?auto_697837 ?auto_697839 ) ) ( not ( = ?auto_697837 ?auto_697840 ) ) ( not ( = ?auto_697838 ?auto_697839 ) ) ( not ( = ?auto_697838 ?auto_697840 ) ) ( not ( = ?auto_697839 ?auto_697840 ) ) ( ON ?auto_697838 ?auto_697839 ) ( ON ?auto_697837 ?auto_697838 ) ( CLEAR ?auto_697835 ) ( ON ?auto_697836 ?auto_697837 ) ( CLEAR ?auto_697836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_697827 ?auto_697828 ?auto_697829 ?auto_697830 ?auto_697831 ?auto_697832 ?auto_697833 ?auto_697834 ?auto_697835 ?auto_697836 )
      ( MAKE-13PILE ?auto_697827 ?auto_697828 ?auto_697829 ?auto_697830 ?auto_697831 ?auto_697832 ?auto_697833 ?auto_697834 ?auto_697835 ?auto_697836 ?auto_697837 ?auto_697838 ?auto_697839 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_697881 - BLOCK
      ?auto_697882 - BLOCK
      ?auto_697883 - BLOCK
      ?auto_697884 - BLOCK
      ?auto_697885 - BLOCK
      ?auto_697886 - BLOCK
      ?auto_697887 - BLOCK
      ?auto_697888 - BLOCK
      ?auto_697889 - BLOCK
      ?auto_697890 - BLOCK
      ?auto_697891 - BLOCK
      ?auto_697892 - BLOCK
      ?auto_697893 - BLOCK
    )
    :vars
    (
      ?auto_697894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697893 ?auto_697894 ) ( ON-TABLE ?auto_697881 ) ( ON ?auto_697882 ?auto_697881 ) ( ON ?auto_697883 ?auto_697882 ) ( ON ?auto_697884 ?auto_697883 ) ( ON ?auto_697885 ?auto_697884 ) ( ON ?auto_697886 ?auto_697885 ) ( ON ?auto_697887 ?auto_697886 ) ( ON ?auto_697888 ?auto_697887 ) ( not ( = ?auto_697881 ?auto_697882 ) ) ( not ( = ?auto_697881 ?auto_697883 ) ) ( not ( = ?auto_697881 ?auto_697884 ) ) ( not ( = ?auto_697881 ?auto_697885 ) ) ( not ( = ?auto_697881 ?auto_697886 ) ) ( not ( = ?auto_697881 ?auto_697887 ) ) ( not ( = ?auto_697881 ?auto_697888 ) ) ( not ( = ?auto_697881 ?auto_697889 ) ) ( not ( = ?auto_697881 ?auto_697890 ) ) ( not ( = ?auto_697881 ?auto_697891 ) ) ( not ( = ?auto_697881 ?auto_697892 ) ) ( not ( = ?auto_697881 ?auto_697893 ) ) ( not ( = ?auto_697881 ?auto_697894 ) ) ( not ( = ?auto_697882 ?auto_697883 ) ) ( not ( = ?auto_697882 ?auto_697884 ) ) ( not ( = ?auto_697882 ?auto_697885 ) ) ( not ( = ?auto_697882 ?auto_697886 ) ) ( not ( = ?auto_697882 ?auto_697887 ) ) ( not ( = ?auto_697882 ?auto_697888 ) ) ( not ( = ?auto_697882 ?auto_697889 ) ) ( not ( = ?auto_697882 ?auto_697890 ) ) ( not ( = ?auto_697882 ?auto_697891 ) ) ( not ( = ?auto_697882 ?auto_697892 ) ) ( not ( = ?auto_697882 ?auto_697893 ) ) ( not ( = ?auto_697882 ?auto_697894 ) ) ( not ( = ?auto_697883 ?auto_697884 ) ) ( not ( = ?auto_697883 ?auto_697885 ) ) ( not ( = ?auto_697883 ?auto_697886 ) ) ( not ( = ?auto_697883 ?auto_697887 ) ) ( not ( = ?auto_697883 ?auto_697888 ) ) ( not ( = ?auto_697883 ?auto_697889 ) ) ( not ( = ?auto_697883 ?auto_697890 ) ) ( not ( = ?auto_697883 ?auto_697891 ) ) ( not ( = ?auto_697883 ?auto_697892 ) ) ( not ( = ?auto_697883 ?auto_697893 ) ) ( not ( = ?auto_697883 ?auto_697894 ) ) ( not ( = ?auto_697884 ?auto_697885 ) ) ( not ( = ?auto_697884 ?auto_697886 ) ) ( not ( = ?auto_697884 ?auto_697887 ) ) ( not ( = ?auto_697884 ?auto_697888 ) ) ( not ( = ?auto_697884 ?auto_697889 ) ) ( not ( = ?auto_697884 ?auto_697890 ) ) ( not ( = ?auto_697884 ?auto_697891 ) ) ( not ( = ?auto_697884 ?auto_697892 ) ) ( not ( = ?auto_697884 ?auto_697893 ) ) ( not ( = ?auto_697884 ?auto_697894 ) ) ( not ( = ?auto_697885 ?auto_697886 ) ) ( not ( = ?auto_697885 ?auto_697887 ) ) ( not ( = ?auto_697885 ?auto_697888 ) ) ( not ( = ?auto_697885 ?auto_697889 ) ) ( not ( = ?auto_697885 ?auto_697890 ) ) ( not ( = ?auto_697885 ?auto_697891 ) ) ( not ( = ?auto_697885 ?auto_697892 ) ) ( not ( = ?auto_697885 ?auto_697893 ) ) ( not ( = ?auto_697885 ?auto_697894 ) ) ( not ( = ?auto_697886 ?auto_697887 ) ) ( not ( = ?auto_697886 ?auto_697888 ) ) ( not ( = ?auto_697886 ?auto_697889 ) ) ( not ( = ?auto_697886 ?auto_697890 ) ) ( not ( = ?auto_697886 ?auto_697891 ) ) ( not ( = ?auto_697886 ?auto_697892 ) ) ( not ( = ?auto_697886 ?auto_697893 ) ) ( not ( = ?auto_697886 ?auto_697894 ) ) ( not ( = ?auto_697887 ?auto_697888 ) ) ( not ( = ?auto_697887 ?auto_697889 ) ) ( not ( = ?auto_697887 ?auto_697890 ) ) ( not ( = ?auto_697887 ?auto_697891 ) ) ( not ( = ?auto_697887 ?auto_697892 ) ) ( not ( = ?auto_697887 ?auto_697893 ) ) ( not ( = ?auto_697887 ?auto_697894 ) ) ( not ( = ?auto_697888 ?auto_697889 ) ) ( not ( = ?auto_697888 ?auto_697890 ) ) ( not ( = ?auto_697888 ?auto_697891 ) ) ( not ( = ?auto_697888 ?auto_697892 ) ) ( not ( = ?auto_697888 ?auto_697893 ) ) ( not ( = ?auto_697888 ?auto_697894 ) ) ( not ( = ?auto_697889 ?auto_697890 ) ) ( not ( = ?auto_697889 ?auto_697891 ) ) ( not ( = ?auto_697889 ?auto_697892 ) ) ( not ( = ?auto_697889 ?auto_697893 ) ) ( not ( = ?auto_697889 ?auto_697894 ) ) ( not ( = ?auto_697890 ?auto_697891 ) ) ( not ( = ?auto_697890 ?auto_697892 ) ) ( not ( = ?auto_697890 ?auto_697893 ) ) ( not ( = ?auto_697890 ?auto_697894 ) ) ( not ( = ?auto_697891 ?auto_697892 ) ) ( not ( = ?auto_697891 ?auto_697893 ) ) ( not ( = ?auto_697891 ?auto_697894 ) ) ( not ( = ?auto_697892 ?auto_697893 ) ) ( not ( = ?auto_697892 ?auto_697894 ) ) ( not ( = ?auto_697893 ?auto_697894 ) ) ( ON ?auto_697892 ?auto_697893 ) ( ON ?auto_697891 ?auto_697892 ) ( ON ?auto_697890 ?auto_697891 ) ( CLEAR ?auto_697888 ) ( ON ?auto_697889 ?auto_697890 ) ( CLEAR ?auto_697889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_697881 ?auto_697882 ?auto_697883 ?auto_697884 ?auto_697885 ?auto_697886 ?auto_697887 ?auto_697888 ?auto_697889 )
      ( MAKE-13PILE ?auto_697881 ?auto_697882 ?auto_697883 ?auto_697884 ?auto_697885 ?auto_697886 ?auto_697887 ?auto_697888 ?auto_697889 ?auto_697890 ?auto_697891 ?auto_697892 ?auto_697893 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_697935 - BLOCK
      ?auto_697936 - BLOCK
      ?auto_697937 - BLOCK
      ?auto_697938 - BLOCK
      ?auto_697939 - BLOCK
      ?auto_697940 - BLOCK
      ?auto_697941 - BLOCK
      ?auto_697942 - BLOCK
      ?auto_697943 - BLOCK
      ?auto_697944 - BLOCK
      ?auto_697945 - BLOCK
      ?auto_697946 - BLOCK
      ?auto_697947 - BLOCK
    )
    :vars
    (
      ?auto_697948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_697947 ?auto_697948 ) ( ON-TABLE ?auto_697935 ) ( ON ?auto_697936 ?auto_697935 ) ( ON ?auto_697937 ?auto_697936 ) ( ON ?auto_697938 ?auto_697937 ) ( ON ?auto_697939 ?auto_697938 ) ( ON ?auto_697940 ?auto_697939 ) ( ON ?auto_697941 ?auto_697940 ) ( not ( = ?auto_697935 ?auto_697936 ) ) ( not ( = ?auto_697935 ?auto_697937 ) ) ( not ( = ?auto_697935 ?auto_697938 ) ) ( not ( = ?auto_697935 ?auto_697939 ) ) ( not ( = ?auto_697935 ?auto_697940 ) ) ( not ( = ?auto_697935 ?auto_697941 ) ) ( not ( = ?auto_697935 ?auto_697942 ) ) ( not ( = ?auto_697935 ?auto_697943 ) ) ( not ( = ?auto_697935 ?auto_697944 ) ) ( not ( = ?auto_697935 ?auto_697945 ) ) ( not ( = ?auto_697935 ?auto_697946 ) ) ( not ( = ?auto_697935 ?auto_697947 ) ) ( not ( = ?auto_697935 ?auto_697948 ) ) ( not ( = ?auto_697936 ?auto_697937 ) ) ( not ( = ?auto_697936 ?auto_697938 ) ) ( not ( = ?auto_697936 ?auto_697939 ) ) ( not ( = ?auto_697936 ?auto_697940 ) ) ( not ( = ?auto_697936 ?auto_697941 ) ) ( not ( = ?auto_697936 ?auto_697942 ) ) ( not ( = ?auto_697936 ?auto_697943 ) ) ( not ( = ?auto_697936 ?auto_697944 ) ) ( not ( = ?auto_697936 ?auto_697945 ) ) ( not ( = ?auto_697936 ?auto_697946 ) ) ( not ( = ?auto_697936 ?auto_697947 ) ) ( not ( = ?auto_697936 ?auto_697948 ) ) ( not ( = ?auto_697937 ?auto_697938 ) ) ( not ( = ?auto_697937 ?auto_697939 ) ) ( not ( = ?auto_697937 ?auto_697940 ) ) ( not ( = ?auto_697937 ?auto_697941 ) ) ( not ( = ?auto_697937 ?auto_697942 ) ) ( not ( = ?auto_697937 ?auto_697943 ) ) ( not ( = ?auto_697937 ?auto_697944 ) ) ( not ( = ?auto_697937 ?auto_697945 ) ) ( not ( = ?auto_697937 ?auto_697946 ) ) ( not ( = ?auto_697937 ?auto_697947 ) ) ( not ( = ?auto_697937 ?auto_697948 ) ) ( not ( = ?auto_697938 ?auto_697939 ) ) ( not ( = ?auto_697938 ?auto_697940 ) ) ( not ( = ?auto_697938 ?auto_697941 ) ) ( not ( = ?auto_697938 ?auto_697942 ) ) ( not ( = ?auto_697938 ?auto_697943 ) ) ( not ( = ?auto_697938 ?auto_697944 ) ) ( not ( = ?auto_697938 ?auto_697945 ) ) ( not ( = ?auto_697938 ?auto_697946 ) ) ( not ( = ?auto_697938 ?auto_697947 ) ) ( not ( = ?auto_697938 ?auto_697948 ) ) ( not ( = ?auto_697939 ?auto_697940 ) ) ( not ( = ?auto_697939 ?auto_697941 ) ) ( not ( = ?auto_697939 ?auto_697942 ) ) ( not ( = ?auto_697939 ?auto_697943 ) ) ( not ( = ?auto_697939 ?auto_697944 ) ) ( not ( = ?auto_697939 ?auto_697945 ) ) ( not ( = ?auto_697939 ?auto_697946 ) ) ( not ( = ?auto_697939 ?auto_697947 ) ) ( not ( = ?auto_697939 ?auto_697948 ) ) ( not ( = ?auto_697940 ?auto_697941 ) ) ( not ( = ?auto_697940 ?auto_697942 ) ) ( not ( = ?auto_697940 ?auto_697943 ) ) ( not ( = ?auto_697940 ?auto_697944 ) ) ( not ( = ?auto_697940 ?auto_697945 ) ) ( not ( = ?auto_697940 ?auto_697946 ) ) ( not ( = ?auto_697940 ?auto_697947 ) ) ( not ( = ?auto_697940 ?auto_697948 ) ) ( not ( = ?auto_697941 ?auto_697942 ) ) ( not ( = ?auto_697941 ?auto_697943 ) ) ( not ( = ?auto_697941 ?auto_697944 ) ) ( not ( = ?auto_697941 ?auto_697945 ) ) ( not ( = ?auto_697941 ?auto_697946 ) ) ( not ( = ?auto_697941 ?auto_697947 ) ) ( not ( = ?auto_697941 ?auto_697948 ) ) ( not ( = ?auto_697942 ?auto_697943 ) ) ( not ( = ?auto_697942 ?auto_697944 ) ) ( not ( = ?auto_697942 ?auto_697945 ) ) ( not ( = ?auto_697942 ?auto_697946 ) ) ( not ( = ?auto_697942 ?auto_697947 ) ) ( not ( = ?auto_697942 ?auto_697948 ) ) ( not ( = ?auto_697943 ?auto_697944 ) ) ( not ( = ?auto_697943 ?auto_697945 ) ) ( not ( = ?auto_697943 ?auto_697946 ) ) ( not ( = ?auto_697943 ?auto_697947 ) ) ( not ( = ?auto_697943 ?auto_697948 ) ) ( not ( = ?auto_697944 ?auto_697945 ) ) ( not ( = ?auto_697944 ?auto_697946 ) ) ( not ( = ?auto_697944 ?auto_697947 ) ) ( not ( = ?auto_697944 ?auto_697948 ) ) ( not ( = ?auto_697945 ?auto_697946 ) ) ( not ( = ?auto_697945 ?auto_697947 ) ) ( not ( = ?auto_697945 ?auto_697948 ) ) ( not ( = ?auto_697946 ?auto_697947 ) ) ( not ( = ?auto_697946 ?auto_697948 ) ) ( not ( = ?auto_697947 ?auto_697948 ) ) ( ON ?auto_697946 ?auto_697947 ) ( ON ?auto_697945 ?auto_697946 ) ( ON ?auto_697944 ?auto_697945 ) ( ON ?auto_697943 ?auto_697944 ) ( CLEAR ?auto_697941 ) ( ON ?auto_697942 ?auto_697943 ) ( CLEAR ?auto_697942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_697935 ?auto_697936 ?auto_697937 ?auto_697938 ?auto_697939 ?auto_697940 ?auto_697941 ?auto_697942 )
      ( MAKE-13PILE ?auto_697935 ?auto_697936 ?auto_697937 ?auto_697938 ?auto_697939 ?auto_697940 ?auto_697941 ?auto_697942 ?auto_697943 ?auto_697944 ?auto_697945 ?auto_697946 ?auto_697947 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_697989 - BLOCK
      ?auto_697990 - BLOCK
      ?auto_697991 - BLOCK
      ?auto_697992 - BLOCK
      ?auto_697993 - BLOCK
      ?auto_697994 - BLOCK
      ?auto_697995 - BLOCK
      ?auto_697996 - BLOCK
      ?auto_697997 - BLOCK
      ?auto_697998 - BLOCK
      ?auto_697999 - BLOCK
      ?auto_698000 - BLOCK
      ?auto_698001 - BLOCK
    )
    :vars
    (
      ?auto_698002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698001 ?auto_698002 ) ( ON-TABLE ?auto_697989 ) ( ON ?auto_697990 ?auto_697989 ) ( ON ?auto_697991 ?auto_697990 ) ( ON ?auto_697992 ?auto_697991 ) ( ON ?auto_697993 ?auto_697992 ) ( ON ?auto_697994 ?auto_697993 ) ( not ( = ?auto_697989 ?auto_697990 ) ) ( not ( = ?auto_697989 ?auto_697991 ) ) ( not ( = ?auto_697989 ?auto_697992 ) ) ( not ( = ?auto_697989 ?auto_697993 ) ) ( not ( = ?auto_697989 ?auto_697994 ) ) ( not ( = ?auto_697989 ?auto_697995 ) ) ( not ( = ?auto_697989 ?auto_697996 ) ) ( not ( = ?auto_697989 ?auto_697997 ) ) ( not ( = ?auto_697989 ?auto_697998 ) ) ( not ( = ?auto_697989 ?auto_697999 ) ) ( not ( = ?auto_697989 ?auto_698000 ) ) ( not ( = ?auto_697989 ?auto_698001 ) ) ( not ( = ?auto_697989 ?auto_698002 ) ) ( not ( = ?auto_697990 ?auto_697991 ) ) ( not ( = ?auto_697990 ?auto_697992 ) ) ( not ( = ?auto_697990 ?auto_697993 ) ) ( not ( = ?auto_697990 ?auto_697994 ) ) ( not ( = ?auto_697990 ?auto_697995 ) ) ( not ( = ?auto_697990 ?auto_697996 ) ) ( not ( = ?auto_697990 ?auto_697997 ) ) ( not ( = ?auto_697990 ?auto_697998 ) ) ( not ( = ?auto_697990 ?auto_697999 ) ) ( not ( = ?auto_697990 ?auto_698000 ) ) ( not ( = ?auto_697990 ?auto_698001 ) ) ( not ( = ?auto_697990 ?auto_698002 ) ) ( not ( = ?auto_697991 ?auto_697992 ) ) ( not ( = ?auto_697991 ?auto_697993 ) ) ( not ( = ?auto_697991 ?auto_697994 ) ) ( not ( = ?auto_697991 ?auto_697995 ) ) ( not ( = ?auto_697991 ?auto_697996 ) ) ( not ( = ?auto_697991 ?auto_697997 ) ) ( not ( = ?auto_697991 ?auto_697998 ) ) ( not ( = ?auto_697991 ?auto_697999 ) ) ( not ( = ?auto_697991 ?auto_698000 ) ) ( not ( = ?auto_697991 ?auto_698001 ) ) ( not ( = ?auto_697991 ?auto_698002 ) ) ( not ( = ?auto_697992 ?auto_697993 ) ) ( not ( = ?auto_697992 ?auto_697994 ) ) ( not ( = ?auto_697992 ?auto_697995 ) ) ( not ( = ?auto_697992 ?auto_697996 ) ) ( not ( = ?auto_697992 ?auto_697997 ) ) ( not ( = ?auto_697992 ?auto_697998 ) ) ( not ( = ?auto_697992 ?auto_697999 ) ) ( not ( = ?auto_697992 ?auto_698000 ) ) ( not ( = ?auto_697992 ?auto_698001 ) ) ( not ( = ?auto_697992 ?auto_698002 ) ) ( not ( = ?auto_697993 ?auto_697994 ) ) ( not ( = ?auto_697993 ?auto_697995 ) ) ( not ( = ?auto_697993 ?auto_697996 ) ) ( not ( = ?auto_697993 ?auto_697997 ) ) ( not ( = ?auto_697993 ?auto_697998 ) ) ( not ( = ?auto_697993 ?auto_697999 ) ) ( not ( = ?auto_697993 ?auto_698000 ) ) ( not ( = ?auto_697993 ?auto_698001 ) ) ( not ( = ?auto_697993 ?auto_698002 ) ) ( not ( = ?auto_697994 ?auto_697995 ) ) ( not ( = ?auto_697994 ?auto_697996 ) ) ( not ( = ?auto_697994 ?auto_697997 ) ) ( not ( = ?auto_697994 ?auto_697998 ) ) ( not ( = ?auto_697994 ?auto_697999 ) ) ( not ( = ?auto_697994 ?auto_698000 ) ) ( not ( = ?auto_697994 ?auto_698001 ) ) ( not ( = ?auto_697994 ?auto_698002 ) ) ( not ( = ?auto_697995 ?auto_697996 ) ) ( not ( = ?auto_697995 ?auto_697997 ) ) ( not ( = ?auto_697995 ?auto_697998 ) ) ( not ( = ?auto_697995 ?auto_697999 ) ) ( not ( = ?auto_697995 ?auto_698000 ) ) ( not ( = ?auto_697995 ?auto_698001 ) ) ( not ( = ?auto_697995 ?auto_698002 ) ) ( not ( = ?auto_697996 ?auto_697997 ) ) ( not ( = ?auto_697996 ?auto_697998 ) ) ( not ( = ?auto_697996 ?auto_697999 ) ) ( not ( = ?auto_697996 ?auto_698000 ) ) ( not ( = ?auto_697996 ?auto_698001 ) ) ( not ( = ?auto_697996 ?auto_698002 ) ) ( not ( = ?auto_697997 ?auto_697998 ) ) ( not ( = ?auto_697997 ?auto_697999 ) ) ( not ( = ?auto_697997 ?auto_698000 ) ) ( not ( = ?auto_697997 ?auto_698001 ) ) ( not ( = ?auto_697997 ?auto_698002 ) ) ( not ( = ?auto_697998 ?auto_697999 ) ) ( not ( = ?auto_697998 ?auto_698000 ) ) ( not ( = ?auto_697998 ?auto_698001 ) ) ( not ( = ?auto_697998 ?auto_698002 ) ) ( not ( = ?auto_697999 ?auto_698000 ) ) ( not ( = ?auto_697999 ?auto_698001 ) ) ( not ( = ?auto_697999 ?auto_698002 ) ) ( not ( = ?auto_698000 ?auto_698001 ) ) ( not ( = ?auto_698000 ?auto_698002 ) ) ( not ( = ?auto_698001 ?auto_698002 ) ) ( ON ?auto_698000 ?auto_698001 ) ( ON ?auto_697999 ?auto_698000 ) ( ON ?auto_697998 ?auto_697999 ) ( ON ?auto_697997 ?auto_697998 ) ( ON ?auto_697996 ?auto_697997 ) ( CLEAR ?auto_697994 ) ( ON ?auto_697995 ?auto_697996 ) ( CLEAR ?auto_697995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_697989 ?auto_697990 ?auto_697991 ?auto_697992 ?auto_697993 ?auto_697994 ?auto_697995 )
      ( MAKE-13PILE ?auto_697989 ?auto_697990 ?auto_697991 ?auto_697992 ?auto_697993 ?auto_697994 ?auto_697995 ?auto_697996 ?auto_697997 ?auto_697998 ?auto_697999 ?auto_698000 ?auto_698001 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_698043 - BLOCK
      ?auto_698044 - BLOCK
      ?auto_698045 - BLOCK
      ?auto_698046 - BLOCK
      ?auto_698047 - BLOCK
      ?auto_698048 - BLOCK
      ?auto_698049 - BLOCK
      ?auto_698050 - BLOCK
      ?auto_698051 - BLOCK
      ?auto_698052 - BLOCK
      ?auto_698053 - BLOCK
      ?auto_698054 - BLOCK
      ?auto_698055 - BLOCK
    )
    :vars
    (
      ?auto_698056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698055 ?auto_698056 ) ( ON-TABLE ?auto_698043 ) ( ON ?auto_698044 ?auto_698043 ) ( ON ?auto_698045 ?auto_698044 ) ( ON ?auto_698046 ?auto_698045 ) ( ON ?auto_698047 ?auto_698046 ) ( not ( = ?auto_698043 ?auto_698044 ) ) ( not ( = ?auto_698043 ?auto_698045 ) ) ( not ( = ?auto_698043 ?auto_698046 ) ) ( not ( = ?auto_698043 ?auto_698047 ) ) ( not ( = ?auto_698043 ?auto_698048 ) ) ( not ( = ?auto_698043 ?auto_698049 ) ) ( not ( = ?auto_698043 ?auto_698050 ) ) ( not ( = ?auto_698043 ?auto_698051 ) ) ( not ( = ?auto_698043 ?auto_698052 ) ) ( not ( = ?auto_698043 ?auto_698053 ) ) ( not ( = ?auto_698043 ?auto_698054 ) ) ( not ( = ?auto_698043 ?auto_698055 ) ) ( not ( = ?auto_698043 ?auto_698056 ) ) ( not ( = ?auto_698044 ?auto_698045 ) ) ( not ( = ?auto_698044 ?auto_698046 ) ) ( not ( = ?auto_698044 ?auto_698047 ) ) ( not ( = ?auto_698044 ?auto_698048 ) ) ( not ( = ?auto_698044 ?auto_698049 ) ) ( not ( = ?auto_698044 ?auto_698050 ) ) ( not ( = ?auto_698044 ?auto_698051 ) ) ( not ( = ?auto_698044 ?auto_698052 ) ) ( not ( = ?auto_698044 ?auto_698053 ) ) ( not ( = ?auto_698044 ?auto_698054 ) ) ( not ( = ?auto_698044 ?auto_698055 ) ) ( not ( = ?auto_698044 ?auto_698056 ) ) ( not ( = ?auto_698045 ?auto_698046 ) ) ( not ( = ?auto_698045 ?auto_698047 ) ) ( not ( = ?auto_698045 ?auto_698048 ) ) ( not ( = ?auto_698045 ?auto_698049 ) ) ( not ( = ?auto_698045 ?auto_698050 ) ) ( not ( = ?auto_698045 ?auto_698051 ) ) ( not ( = ?auto_698045 ?auto_698052 ) ) ( not ( = ?auto_698045 ?auto_698053 ) ) ( not ( = ?auto_698045 ?auto_698054 ) ) ( not ( = ?auto_698045 ?auto_698055 ) ) ( not ( = ?auto_698045 ?auto_698056 ) ) ( not ( = ?auto_698046 ?auto_698047 ) ) ( not ( = ?auto_698046 ?auto_698048 ) ) ( not ( = ?auto_698046 ?auto_698049 ) ) ( not ( = ?auto_698046 ?auto_698050 ) ) ( not ( = ?auto_698046 ?auto_698051 ) ) ( not ( = ?auto_698046 ?auto_698052 ) ) ( not ( = ?auto_698046 ?auto_698053 ) ) ( not ( = ?auto_698046 ?auto_698054 ) ) ( not ( = ?auto_698046 ?auto_698055 ) ) ( not ( = ?auto_698046 ?auto_698056 ) ) ( not ( = ?auto_698047 ?auto_698048 ) ) ( not ( = ?auto_698047 ?auto_698049 ) ) ( not ( = ?auto_698047 ?auto_698050 ) ) ( not ( = ?auto_698047 ?auto_698051 ) ) ( not ( = ?auto_698047 ?auto_698052 ) ) ( not ( = ?auto_698047 ?auto_698053 ) ) ( not ( = ?auto_698047 ?auto_698054 ) ) ( not ( = ?auto_698047 ?auto_698055 ) ) ( not ( = ?auto_698047 ?auto_698056 ) ) ( not ( = ?auto_698048 ?auto_698049 ) ) ( not ( = ?auto_698048 ?auto_698050 ) ) ( not ( = ?auto_698048 ?auto_698051 ) ) ( not ( = ?auto_698048 ?auto_698052 ) ) ( not ( = ?auto_698048 ?auto_698053 ) ) ( not ( = ?auto_698048 ?auto_698054 ) ) ( not ( = ?auto_698048 ?auto_698055 ) ) ( not ( = ?auto_698048 ?auto_698056 ) ) ( not ( = ?auto_698049 ?auto_698050 ) ) ( not ( = ?auto_698049 ?auto_698051 ) ) ( not ( = ?auto_698049 ?auto_698052 ) ) ( not ( = ?auto_698049 ?auto_698053 ) ) ( not ( = ?auto_698049 ?auto_698054 ) ) ( not ( = ?auto_698049 ?auto_698055 ) ) ( not ( = ?auto_698049 ?auto_698056 ) ) ( not ( = ?auto_698050 ?auto_698051 ) ) ( not ( = ?auto_698050 ?auto_698052 ) ) ( not ( = ?auto_698050 ?auto_698053 ) ) ( not ( = ?auto_698050 ?auto_698054 ) ) ( not ( = ?auto_698050 ?auto_698055 ) ) ( not ( = ?auto_698050 ?auto_698056 ) ) ( not ( = ?auto_698051 ?auto_698052 ) ) ( not ( = ?auto_698051 ?auto_698053 ) ) ( not ( = ?auto_698051 ?auto_698054 ) ) ( not ( = ?auto_698051 ?auto_698055 ) ) ( not ( = ?auto_698051 ?auto_698056 ) ) ( not ( = ?auto_698052 ?auto_698053 ) ) ( not ( = ?auto_698052 ?auto_698054 ) ) ( not ( = ?auto_698052 ?auto_698055 ) ) ( not ( = ?auto_698052 ?auto_698056 ) ) ( not ( = ?auto_698053 ?auto_698054 ) ) ( not ( = ?auto_698053 ?auto_698055 ) ) ( not ( = ?auto_698053 ?auto_698056 ) ) ( not ( = ?auto_698054 ?auto_698055 ) ) ( not ( = ?auto_698054 ?auto_698056 ) ) ( not ( = ?auto_698055 ?auto_698056 ) ) ( ON ?auto_698054 ?auto_698055 ) ( ON ?auto_698053 ?auto_698054 ) ( ON ?auto_698052 ?auto_698053 ) ( ON ?auto_698051 ?auto_698052 ) ( ON ?auto_698050 ?auto_698051 ) ( ON ?auto_698049 ?auto_698050 ) ( CLEAR ?auto_698047 ) ( ON ?auto_698048 ?auto_698049 ) ( CLEAR ?auto_698048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_698043 ?auto_698044 ?auto_698045 ?auto_698046 ?auto_698047 ?auto_698048 )
      ( MAKE-13PILE ?auto_698043 ?auto_698044 ?auto_698045 ?auto_698046 ?auto_698047 ?auto_698048 ?auto_698049 ?auto_698050 ?auto_698051 ?auto_698052 ?auto_698053 ?auto_698054 ?auto_698055 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_698097 - BLOCK
      ?auto_698098 - BLOCK
      ?auto_698099 - BLOCK
      ?auto_698100 - BLOCK
      ?auto_698101 - BLOCK
      ?auto_698102 - BLOCK
      ?auto_698103 - BLOCK
      ?auto_698104 - BLOCK
      ?auto_698105 - BLOCK
      ?auto_698106 - BLOCK
      ?auto_698107 - BLOCK
      ?auto_698108 - BLOCK
      ?auto_698109 - BLOCK
    )
    :vars
    (
      ?auto_698110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698109 ?auto_698110 ) ( ON-TABLE ?auto_698097 ) ( ON ?auto_698098 ?auto_698097 ) ( ON ?auto_698099 ?auto_698098 ) ( ON ?auto_698100 ?auto_698099 ) ( not ( = ?auto_698097 ?auto_698098 ) ) ( not ( = ?auto_698097 ?auto_698099 ) ) ( not ( = ?auto_698097 ?auto_698100 ) ) ( not ( = ?auto_698097 ?auto_698101 ) ) ( not ( = ?auto_698097 ?auto_698102 ) ) ( not ( = ?auto_698097 ?auto_698103 ) ) ( not ( = ?auto_698097 ?auto_698104 ) ) ( not ( = ?auto_698097 ?auto_698105 ) ) ( not ( = ?auto_698097 ?auto_698106 ) ) ( not ( = ?auto_698097 ?auto_698107 ) ) ( not ( = ?auto_698097 ?auto_698108 ) ) ( not ( = ?auto_698097 ?auto_698109 ) ) ( not ( = ?auto_698097 ?auto_698110 ) ) ( not ( = ?auto_698098 ?auto_698099 ) ) ( not ( = ?auto_698098 ?auto_698100 ) ) ( not ( = ?auto_698098 ?auto_698101 ) ) ( not ( = ?auto_698098 ?auto_698102 ) ) ( not ( = ?auto_698098 ?auto_698103 ) ) ( not ( = ?auto_698098 ?auto_698104 ) ) ( not ( = ?auto_698098 ?auto_698105 ) ) ( not ( = ?auto_698098 ?auto_698106 ) ) ( not ( = ?auto_698098 ?auto_698107 ) ) ( not ( = ?auto_698098 ?auto_698108 ) ) ( not ( = ?auto_698098 ?auto_698109 ) ) ( not ( = ?auto_698098 ?auto_698110 ) ) ( not ( = ?auto_698099 ?auto_698100 ) ) ( not ( = ?auto_698099 ?auto_698101 ) ) ( not ( = ?auto_698099 ?auto_698102 ) ) ( not ( = ?auto_698099 ?auto_698103 ) ) ( not ( = ?auto_698099 ?auto_698104 ) ) ( not ( = ?auto_698099 ?auto_698105 ) ) ( not ( = ?auto_698099 ?auto_698106 ) ) ( not ( = ?auto_698099 ?auto_698107 ) ) ( not ( = ?auto_698099 ?auto_698108 ) ) ( not ( = ?auto_698099 ?auto_698109 ) ) ( not ( = ?auto_698099 ?auto_698110 ) ) ( not ( = ?auto_698100 ?auto_698101 ) ) ( not ( = ?auto_698100 ?auto_698102 ) ) ( not ( = ?auto_698100 ?auto_698103 ) ) ( not ( = ?auto_698100 ?auto_698104 ) ) ( not ( = ?auto_698100 ?auto_698105 ) ) ( not ( = ?auto_698100 ?auto_698106 ) ) ( not ( = ?auto_698100 ?auto_698107 ) ) ( not ( = ?auto_698100 ?auto_698108 ) ) ( not ( = ?auto_698100 ?auto_698109 ) ) ( not ( = ?auto_698100 ?auto_698110 ) ) ( not ( = ?auto_698101 ?auto_698102 ) ) ( not ( = ?auto_698101 ?auto_698103 ) ) ( not ( = ?auto_698101 ?auto_698104 ) ) ( not ( = ?auto_698101 ?auto_698105 ) ) ( not ( = ?auto_698101 ?auto_698106 ) ) ( not ( = ?auto_698101 ?auto_698107 ) ) ( not ( = ?auto_698101 ?auto_698108 ) ) ( not ( = ?auto_698101 ?auto_698109 ) ) ( not ( = ?auto_698101 ?auto_698110 ) ) ( not ( = ?auto_698102 ?auto_698103 ) ) ( not ( = ?auto_698102 ?auto_698104 ) ) ( not ( = ?auto_698102 ?auto_698105 ) ) ( not ( = ?auto_698102 ?auto_698106 ) ) ( not ( = ?auto_698102 ?auto_698107 ) ) ( not ( = ?auto_698102 ?auto_698108 ) ) ( not ( = ?auto_698102 ?auto_698109 ) ) ( not ( = ?auto_698102 ?auto_698110 ) ) ( not ( = ?auto_698103 ?auto_698104 ) ) ( not ( = ?auto_698103 ?auto_698105 ) ) ( not ( = ?auto_698103 ?auto_698106 ) ) ( not ( = ?auto_698103 ?auto_698107 ) ) ( not ( = ?auto_698103 ?auto_698108 ) ) ( not ( = ?auto_698103 ?auto_698109 ) ) ( not ( = ?auto_698103 ?auto_698110 ) ) ( not ( = ?auto_698104 ?auto_698105 ) ) ( not ( = ?auto_698104 ?auto_698106 ) ) ( not ( = ?auto_698104 ?auto_698107 ) ) ( not ( = ?auto_698104 ?auto_698108 ) ) ( not ( = ?auto_698104 ?auto_698109 ) ) ( not ( = ?auto_698104 ?auto_698110 ) ) ( not ( = ?auto_698105 ?auto_698106 ) ) ( not ( = ?auto_698105 ?auto_698107 ) ) ( not ( = ?auto_698105 ?auto_698108 ) ) ( not ( = ?auto_698105 ?auto_698109 ) ) ( not ( = ?auto_698105 ?auto_698110 ) ) ( not ( = ?auto_698106 ?auto_698107 ) ) ( not ( = ?auto_698106 ?auto_698108 ) ) ( not ( = ?auto_698106 ?auto_698109 ) ) ( not ( = ?auto_698106 ?auto_698110 ) ) ( not ( = ?auto_698107 ?auto_698108 ) ) ( not ( = ?auto_698107 ?auto_698109 ) ) ( not ( = ?auto_698107 ?auto_698110 ) ) ( not ( = ?auto_698108 ?auto_698109 ) ) ( not ( = ?auto_698108 ?auto_698110 ) ) ( not ( = ?auto_698109 ?auto_698110 ) ) ( ON ?auto_698108 ?auto_698109 ) ( ON ?auto_698107 ?auto_698108 ) ( ON ?auto_698106 ?auto_698107 ) ( ON ?auto_698105 ?auto_698106 ) ( ON ?auto_698104 ?auto_698105 ) ( ON ?auto_698103 ?auto_698104 ) ( ON ?auto_698102 ?auto_698103 ) ( CLEAR ?auto_698100 ) ( ON ?auto_698101 ?auto_698102 ) ( CLEAR ?auto_698101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_698097 ?auto_698098 ?auto_698099 ?auto_698100 ?auto_698101 )
      ( MAKE-13PILE ?auto_698097 ?auto_698098 ?auto_698099 ?auto_698100 ?auto_698101 ?auto_698102 ?auto_698103 ?auto_698104 ?auto_698105 ?auto_698106 ?auto_698107 ?auto_698108 ?auto_698109 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_698151 - BLOCK
      ?auto_698152 - BLOCK
      ?auto_698153 - BLOCK
      ?auto_698154 - BLOCK
      ?auto_698155 - BLOCK
      ?auto_698156 - BLOCK
      ?auto_698157 - BLOCK
      ?auto_698158 - BLOCK
      ?auto_698159 - BLOCK
      ?auto_698160 - BLOCK
      ?auto_698161 - BLOCK
      ?auto_698162 - BLOCK
      ?auto_698163 - BLOCK
    )
    :vars
    (
      ?auto_698164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698163 ?auto_698164 ) ( ON-TABLE ?auto_698151 ) ( ON ?auto_698152 ?auto_698151 ) ( ON ?auto_698153 ?auto_698152 ) ( not ( = ?auto_698151 ?auto_698152 ) ) ( not ( = ?auto_698151 ?auto_698153 ) ) ( not ( = ?auto_698151 ?auto_698154 ) ) ( not ( = ?auto_698151 ?auto_698155 ) ) ( not ( = ?auto_698151 ?auto_698156 ) ) ( not ( = ?auto_698151 ?auto_698157 ) ) ( not ( = ?auto_698151 ?auto_698158 ) ) ( not ( = ?auto_698151 ?auto_698159 ) ) ( not ( = ?auto_698151 ?auto_698160 ) ) ( not ( = ?auto_698151 ?auto_698161 ) ) ( not ( = ?auto_698151 ?auto_698162 ) ) ( not ( = ?auto_698151 ?auto_698163 ) ) ( not ( = ?auto_698151 ?auto_698164 ) ) ( not ( = ?auto_698152 ?auto_698153 ) ) ( not ( = ?auto_698152 ?auto_698154 ) ) ( not ( = ?auto_698152 ?auto_698155 ) ) ( not ( = ?auto_698152 ?auto_698156 ) ) ( not ( = ?auto_698152 ?auto_698157 ) ) ( not ( = ?auto_698152 ?auto_698158 ) ) ( not ( = ?auto_698152 ?auto_698159 ) ) ( not ( = ?auto_698152 ?auto_698160 ) ) ( not ( = ?auto_698152 ?auto_698161 ) ) ( not ( = ?auto_698152 ?auto_698162 ) ) ( not ( = ?auto_698152 ?auto_698163 ) ) ( not ( = ?auto_698152 ?auto_698164 ) ) ( not ( = ?auto_698153 ?auto_698154 ) ) ( not ( = ?auto_698153 ?auto_698155 ) ) ( not ( = ?auto_698153 ?auto_698156 ) ) ( not ( = ?auto_698153 ?auto_698157 ) ) ( not ( = ?auto_698153 ?auto_698158 ) ) ( not ( = ?auto_698153 ?auto_698159 ) ) ( not ( = ?auto_698153 ?auto_698160 ) ) ( not ( = ?auto_698153 ?auto_698161 ) ) ( not ( = ?auto_698153 ?auto_698162 ) ) ( not ( = ?auto_698153 ?auto_698163 ) ) ( not ( = ?auto_698153 ?auto_698164 ) ) ( not ( = ?auto_698154 ?auto_698155 ) ) ( not ( = ?auto_698154 ?auto_698156 ) ) ( not ( = ?auto_698154 ?auto_698157 ) ) ( not ( = ?auto_698154 ?auto_698158 ) ) ( not ( = ?auto_698154 ?auto_698159 ) ) ( not ( = ?auto_698154 ?auto_698160 ) ) ( not ( = ?auto_698154 ?auto_698161 ) ) ( not ( = ?auto_698154 ?auto_698162 ) ) ( not ( = ?auto_698154 ?auto_698163 ) ) ( not ( = ?auto_698154 ?auto_698164 ) ) ( not ( = ?auto_698155 ?auto_698156 ) ) ( not ( = ?auto_698155 ?auto_698157 ) ) ( not ( = ?auto_698155 ?auto_698158 ) ) ( not ( = ?auto_698155 ?auto_698159 ) ) ( not ( = ?auto_698155 ?auto_698160 ) ) ( not ( = ?auto_698155 ?auto_698161 ) ) ( not ( = ?auto_698155 ?auto_698162 ) ) ( not ( = ?auto_698155 ?auto_698163 ) ) ( not ( = ?auto_698155 ?auto_698164 ) ) ( not ( = ?auto_698156 ?auto_698157 ) ) ( not ( = ?auto_698156 ?auto_698158 ) ) ( not ( = ?auto_698156 ?auto_698159 ) ) ( not ( = ?auto_698156 ?auto_698160 ) ) ( not ( = ?auto_698156 ?auto_698161 ) ) ( not ( = ?auto_698156 ?auto_698162 ) ) ( not ( = ?auto_698156 ?auto_698163 ) ) ( not ( = ?auto_698156 ?auto_698164 ) ) ( not ( = ?auto_698157 ?auto_698158 ) ) ( not ( = ?auto_698157 ?auto_698159 ) ) ( not ( = ?auto_698157 ?auto_698160 ) ) ( not ( = ?auto_698157 ?auto_698161 ) ) ( not ( = ?auto_698157 ?auto_698162 ) ) ( not ( = ?auto_698157 ?auto_698163 ) ) ( not ( = ?auto_698157 ?auto_698164 ) ) ( not ( = ?auto_698158 ?auto_698159 ) ) ( not ( = ?auto_698158 ?auto_698160 ) ) ( not ( = ?auto_698158 ?auto_698161 ) ) ( not ( = ?auto_698158 ?auto_698162 ) ) ( not ( = ?auto_698158 ?auto_698163 ) ) ( not ( = ?auto_698158 ?auto_698164 ) ) ( not ( = ?auto_698159 ?auto_698160 ) ) ( not ( = ?auto_698159 ?auto_698161 ) ) ( not ( = ?auto_698159 ?auto_698162 ) ) ( not ( = ?auto_698159 ?auto_698163 ) ) ( not ( = ?auto_698159 ?auto_698164 ) ) ( not ( = ?auto_698160 ?auto_698161 ) ) ( not ( = ?auto_698160 ?auto_698162 ) ) ( not ( = ?auto_698160 ?auto_698163 ) ) ( not ( = ?auto_698160 ?auto_698164 ) ) ( not ( = ?auto_698161 ?auto_698162 ) ) ( not ( = ?auto_698161 ?auto_698163 ) ) ( not ( = ?auto_698161 ?auto_698164 ) ) ( not ( = ?auto_698162 ?auto_698163 ) ) ( not ( = ?auto_698162 ?auto_698164 ) ) ( not ( = ?auto_698163 ?auto_698164 ) ) ( ON ?auto_698162 ?auto_698163 ) ( ON ?auto_698161 ?auto_698162 ) ( ON ?auto_698160 ?auto_698161 ) ( ON ?auto_698159 ?auto_698160 ) ( ON ?auto_698158 ?auto_698159 ) ( ON ?auto_698157 ?auto_698158 ) ( ON ?auto_698156 ?auto_698157 ) ( ON ?auto_698155 ?auto_698156 ) ( CLEAR ?auto_698153 ) ( ON ?auto_698154 ?auto_698155 ) ( CLEAR ?auto_698154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_698151 ?auto_698152 ?auto_698153 ?auto_698154 )
      ( MAKE-13PILE ?auto_698151 ?auto_698152 ?auto_698153 ?auto_698154 ?auto_698155 ?auto_698156 ?auto_698157 ?auto_698158 ?auto_698159 ?auto_698160 ?auto_698161 ?auto_698162 ?auto_698163 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_698205 - BLOCK
      ?auto_698206 - BLOCK
      ?auto_698207 - BLOCK
      ?auto_698208 - BLOCK
      ?auto_698209 - BLOCK
      ?auto_698210 - BLOCK
      ?auto_698211 - BLOCK
      ?auto_698212 - BLOCK
      ?auto_698213 - BLOCK
      ?auto_698214 - BLOCK
      ?auto_698215 - BLOCK
      ?auto_698216 - BLOCK
      ?auto_698217 - BLOCK
    )
    :vars
    (
      ?auto_698218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698217 ?auto_698218 ) ( ON-TABLE ?auto_698205 ) ( ON ?auto_698206 ?auto_698205 ) ( not ( = ?auto_698205 ?auto_698206 ) ) ( not ( = ?auto_698205 ?auto_698207 ) ) ( not ( = ?auto_698205 ?auto_698208 ) ) ( not ( = ?auto_698205 ?auto_698209 ) ) ( not ( = ?auto_698205 ?auto_698210 ) ) ( not ( = ?auto_698205 ?auto_698211 ) ) ( not ( = ?auto_698205 ?auto_698212 ) ) ( not ( = ?auto_698205 ?auto_698213 ) ) ( not ( = ?auto_698205 ?auto_698214 ) ) ( not ( = ?auto_698205 ?auto_698215 ) ) ( not ( = ?auto_698205 ?auto_698216 ) ) ( not ( = ?auto_698205 ?auto_698217 ) ) ( not ( = ?auto_698205 ?auto_698218 ) ) ( not ( = ?auto_698206 ?auto_698207 ) ) ( not ( = ?auto_698206 ?auto_698208 ) ) ( not ( = ?auto_698206 ?auto_698209 ) ) ( not ( = ?auto_698206 ?auto_698210 ) ) ( not ( = ?auto_698206 ?auto_698211 ) ) ( not ( = ?auto_698206 ?auto_698212 ) ) ( not ( = ?auto_698206 ?auto_698213 ) ) ( not ( = ?auto_698206 ?auto_698214 ) ) ( not ( = ?auto_698206 ?auto_698215 ) ) ( not ( = ?auto_698206 ?auto_698216 ) ) ( not ( = ?auto_698206 ?auto_698217 ) ) ( not ( = ?auto_698206 ?auto_698218 ) ) ( not ( = ?auto_698207 ?auto_698208 ) ) ( not ( = ?auto_698207 ?auto_698209 ) ) ( not ( = ?auto_698207 ?auto_698210 ) ) ( not ( = ?auto_698207 ?auto_698211 ) ) ( not ( = ?auto_698207 ?auto_698212 ) ) ( not ( = ?auto_698207 ?auto_698213 ) ) ( not ( = ?auto_698207 ?auto_698214 ) ) ( not ( = ?auto_698207 ?auto_698215 ) ) ( not ( = ?auto_698207 ?auto_698216 ) ) ( not ( = ?auto_698207 ?auto_698217 ) ) ( not ( = ?auto_698207 ?auto_698218 ) ) ( not ( = ?auto_698208 ?auto_698209 ) ) ( not ( = ?auto_698208 ?auto_698210 ) ) ( not ( = ?auto_698208 ?auto_698211 ) ) ( not ( = ?auto_698208 ?auto_698212 ) ) ( not ( = ?auto_698208 ?auto_698213 ) ) ( not ( = ?auto_698208 ?auto_698214 ) ) ( not ( = ?auto_698208 ?auto_698215 ) ) ( not ( = ?auto_698208 ?auto_698216 ) ) ( not ( = ?auto_698208 ?auto_698217 ) ) ( not ( = ?auto_698208 ?auto_698218 ) ) ( not ( = ?auto_698209 ?auto_698210 ) ) ( not ( = ?auto_698209 ?auto_698211 ) ) ( not ( = ?auto_698209 ?auto_698212 ) ) ( not ( = ?auto_698209 ?auto_698213 ) ) ( not ( = ?auto_698209 ?auto_698214 ) ) ( not ( = ?auto_698209 ?auto_698215 ) ) ( not ( = ?auto_698209 ?auto_698216 ) ) ( not ( = ?auto_698209 ?auto_698217 ) ) ( not ( = ?auto_698209 ?auto_698218 ) ) ( not ( = ?auto_698210 ?auto_698211 ) ) ( not ( = ?auto_698210 ?auto_698212 ) ) ( not ( = ?auto_698210 ?auto_698213 ) ) ( not ( = ?auto_698210 ?auto_698214 ) ) ( not ( = ?auto_698210 ?auto_698215 ) ) ( not ( = ?auto_698210 ?auto_698216 ) ) ( not ( = ?auto_698210 ?auto_698217 ) ) ( not ( = ?auto_698210 ?auto_698218 ) ) ( not ( = ?auto_698211 ?auto_698212 ) ) ( not ( = ?auto_698211 ?auto_698213 ) ) ( not ( = ?auto_698211 ?auto_698214 ) ) ( not ( = ?auto_698211 ?auto_698215 ) ) ( not ( = ?auto_698211 ?auto_698216 ) ) ( not ( = ?auto_698211 ?auto_698217 ) ) ( not ( = ?auto_698211 ?auto_698218 ) ) ( not ( = ?auto_698212 ?auto_698213 ) ) ( not ( = ?auto_698212 ?auto_698214 ) ) ( not ( = ?auto_698212 ?auto_698215 ) ) ( not ( = ?auto_698212 ?auto_698216 ) ) ( not ( = ?auto_698212 ?auto_698217 ) ) ( not ( = ?auto_698212 ?auto_698218 ) ) ( not ( = ?auto_698213 ?auto_698214 ) ) ( not ( = ?auto_698213 ?auto_698215 ) ) ( not ( = ?auto_698213 ?auto_698216 ) ) ( not ( = ?auto_698213 ?auto_698217 ) ) ( not ( = ?auto_698213 ?auto_698218 ) ) ( not ( = ?auto_698214 ?auto_698215 ) ) ( not ( = ?auto_698214 ?auto_698216 ) ) ( not ( = ?auto_698214 ?auto_698217 ) ) ( not ( = ?auto_698214 ?auto_698218 ) ) ( not ( = ?auto_698215 ?auto_698216 ) ) ( not ( = ?auto_698215 ?auto_698217 ) ) ( not ( = ?auto_698215 ?auto_698218 ) ) ( not ( = ?auto_698216 ?auto_698217 ) ) ( not ( = ?auto_698216 ?auto_698218 ) ) ( not ( = ?auto_698217 ?auto_698218 ) ) ( ON ?auto_698216 ?auto_698217 ) ( ON ?auto_698215 ?auto_698216 ) ( ON ?auto_698214 ?auto_698215 ) ( ON ?auto_698213 ?auto_698214 ) ( ON ?auto_698212 ?auto_698213 ) ( ON ?auto_698211 ?auto_698212 ) ( ON ?auto_698210 ?auto_698211 ) ( ON ?auto_698209 ?auto_698210 ) ( ON ?auto_698208 ?auto_698209 ) ( CLEAR ?auto_698206 ) ( ON ?auto_698207 ?auto_698208 ) ( CLEAR ?auto_698207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_698205 ?auto_698206 ?auto_698207 )
      ( MAKE-13PILE ?auto_698205 ?auto_698206 ?auto_698207 ?auto_698208 ?auto_698209 ?auto_698210 ?auto_698211 ?auto_698212 ?auto_698213 ?auto_698214 ?auto_698215 ?auto_698216 ?auto_698217 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_698259 - BLOCK
      ?auto_698260 - BLOCK
      ?auto_698261 - BLOCK
      ?auto_698262 - BLOCK
      ?auto_698263 - BLOCK
      ?auto_698264 - BLOCK
      ?auto_698265 - BLOCK
      ?auto_698266 - BLOCK
      ?auto_698267 - BLOCK
      ?auto_698268 - BLOCK
      ?auto_698269 - BLOCK
      ?auto_698270 - BLOCK
      ?auto_698271 - BLOCK
    )
    :vars
    (
      ?auto_698272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698271 ?auto_698272 ) ( ON-TABLE ?auto_698259 ) ( not ( = ?auto_698259 ?auto_698260 ) ) ( not ( = ?auto_698259 ?auto_698261 ) ) ( not ( = ?auto_698259 ?auto_698262 ) ) ( not ( = ?auto_698259 ?auto_698263 ) ) ( not ( = ?auto_698259 ?auto_698264 ) ) ( not ( = ?auto_698259 ?auto_698265 ) ) ( not ( = ?auto_698259 ?auto_698266 ) ) ( not ( = ?auto_698259 ?auto_698267 ) ) ( not ( = ?auto_698259 ?auto_698268 ) ) ( not ( = ?auto_698259 ?auto_698269 ) ) ( not ( = ?auto_698259 ?auto_698270 ) ) ( not ( = ?auto_698259 ?auto_698271 ) ) ( not ( = ?auto_698259 ?auto_698272 ) ) ( not ( = ?auto_698260 ?auto_698261 ) ) ( not ( = ?auto_698260 ?auto_698262 ) ) ( not ( = ?auto_698260 ?auto_698263 ) ) ( not ( = ?auto_698260 ?auto_698264 ) ) ( not ( = ?auto_698260 ?auto_698265 ) ) ( not ( = ?auto_698260 ?auto_698266 ) ) ( not ( = ?auto_698260 ?auto_698267 ) ) ( not ( = ?auto_698260 ?auto_698268 ) ) ( not ( = ?auto_698260 ?auto_698269 ) ) ( not ( = ?auto_698260 ?auto_698270 ) ) ( not ( = ?auto_698260 ?auto_698271 ) ) ( not ( = ?auto_698260 ?auto_698272 ) ) ( not ( = ?auto_698261 ?auto_698262 ) ) ( not ( = ?auto_698261 ?auto_698263 ) ) ( not ( = ?auto_698261 ?auto_698264 ) ) ( not ( = ?auto_698261 ?auto_698265 ) ) ( not ( = ?auto_698261 ?auto_698266 ) ) ( not ( = ?auto_698261 ?auto_698267 ) ) ( not ( = ?auto_698261 ?auto_698268 ) ) ( not ( = ?auto_698261 ?auto_698269 ) ) ( not ( = ?auto_698261 ?auto_698270 ) ) ( not ( = ?auto_698261 ?auto_698271 ) ) ( not ( = ?auto_698261 ?auto_698272 ) ) ( not ( = ?auto_698262 ?auto_698263 ) ) ( not ( = ?auto_698262 ?auto_698264 ) ) ( not ( = ?auto_698262 ?auto_698265 ) ) ( not ( = ?auto_698262 ?auto_698266 ) ) ( not ( = ?auto_698262 ?auto_698267 ) ) ( not ( = ?auto_698262 ?auto_698268 ) ) ( not ( = ?auto_698262 ?auto_698269 ) ) ( not ( = ?auto_698262 ?auto_698270 ) ) ( not ( = ?auto_698262 ?auto_698271 ) ) ( not ( = ?auto_698262 ?auto_698272 ) ) ( not ( = ?auto_698263 ?auto_698264 ) ) ( not ( = ?auto_698263 ?auto_698265 ) ) ( not ( = ?auto_698263 ?auto_698266 ) ) ( not ( = ?auto_698263 ?auto_698267 ) ) ( not ( = ?auto_698263 ?auto_698268 ) ) ( not ( = ?auto_698263 ?auto_698269 ) ) ( not ( = ?auto_698263 ?auto_698270 ) ) ( not ( = ?auto_698263 ?auto_698271 ) ) ( not ( = ?auto_698263 ?auto_698272 ) ) ( not ( = ?auto_698264 ?auto_698265 ) ) ( not ( = ?auto_698264 ?auto_698266 ) ) ( not ( = ?auto_698264 ?auto_698267 ) ) ( not ( = ?auto_698264 ?auto_698268 ) ) ( not ( = ?auto_698264 ?auto_698269 ) ) ( not ( = ?auto_698264 ?auto_698270 ) ) ( not ( = ?auto_698264 ?auto_698271 ) ) ( not ( = ?auto_698264 ?auto_698272 ) ) ( not ( = ?auto_698265 ?auto_698266 ) ) ( not ( = ?auto_698265 ?auto_698267 ) ) ( not ( = ?auto_698265 ?auto_698268 ) ) ( not ( = ?auto_698265 ?auto_698269 ) ) ( not ( = ?auto_698265 ?auto_698270 ) ) ( not ( = ?auto_698265 ?auto_698271 ) ) ( not ( = ?auto_698265 ?auto_698272 ) ) ( not ( = ?auto_698266 ?auto_698267 ) ) ( not ( = ?auto_698266 ?auto_698268 ) ) ( not ( = ?auto_698266 ?auto_698269 ) ) ( not ( = ?auto_698266 ?auto_698270 ) ) ( not ( = ?auto_698266 ?auto_698271 ) ) ( not ( = ?auto_698266 ?auto_698272 ) ) ( not ( = ?auto_698267 ?auto_698268 ) ) ( not ( = ?auto_698267 ?auto_698269 ) ) ( not ( = ?auto_698267 ?auto_698270 ) ) ( not ( = ?auto_698267 ?auto_698271 ) ) ( not ( = ?auto_698267 ?auto_698272 ) ) ( not ( = ?auto_698268 ?auto_698269 ) ) ( not ( = ?auto_698268 ?auto_698270 ) ) ( not ( = ?auto_698268 ?auto_698271 ) ) ( not ( = ?auto_698268 ?auto_698272 ) ) ( not ( = ?auto_698269 ?auto_698270 ) ) ( not ( = ?auto_698269 ?auto_698271 ) ) ( not ( = ?auto_698269 ?auto_698272 ) ) ( not ( = ?auto_698270 ?auto_698271 ) ) ( not ( = ?auto_698270 ?auto_698272 ) ) ( not ( = ?auto_698271 ?auto_698272 ) ) ( ON ?auto_698270 ?auto_698271 ) ( ON ?auto_698269 ?auto_698270 ) ( ON ?auto_698268 ?auto_698269 ) ( ON ?auto_698267 ?auto_698268 ) ( ON ?auto_698266 ?auto_698267 ) ( ON ?auto_698265 ?auto_698266 ) ( ON ?auto_698264 ?auto_698265 ) ( ON ?auto_698263 ?auto_698264 ) ( ON ?auto_698262 ?auto_698263 ) ( ON ?auto_698261 ?auto_698262 ) ( CLEAR ?auto_698259 ) ( ON ?auto_698260 ?auto_698261 ) ( CLEAR ?auto_698260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_698259 ?auto_698260 )
      ( MAKE-13PILE ?auto_698259 ?auto_698260 ?auto_698261 ?auto_698262 ?auto_698263 ?auto_698264 ?auto_698265 ?auto_698266 ?auto_698267 ?auto_698268 ?auto_698269 ?auto_698270 ?auto_698271 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_698313 - BLOCK
      ?auto_698314 - BLOCK
      ?auto_698315 - BLOCK
      ?auto_698316 - BLOCK
      ?auto_698317 - BLOCK
      ?auto_698318 - BLOCK
      ?auto_698319 - BLOCK
      ?auto_698320 - BLOCK
      ?auto_698321 - BLOCK
      ?auto_698322 - BLOCK
      ?auto_698323 - BLOCK
      ?auto_698324 - BLOCK
      ?auto_698325 - BLOCK
    )
    :vars
    (
      ?auto_698326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698325 ?auto_698326 ) ( not ( = ?auto_698313 ?auto_698314 ) ) ( not ( = ?auto_698313 ?auto_698315 ) ) ( not ( = ?auto_698313 ?auto_698316 ) ) ( not ( = ?auto_698313 ?auto_698317 ) ) ( not ( = ?auto_698313 ?auto_698318 ) ) ( not ( = ?auto_698313 ?auto_698319 ) ) ( not ( = ?auto_698313 ?auto_698320 ) ) ( not ( = ?auto_698313 ?auto_698321 ) ) ( not ( = ?auto_698313 ?auto_698322 ) ) ( not ( = ?auto_698313 ?auto_698323 ) ) ( not ( = ?auto_698313 ?auto_698324 ) ) ( not ( = ?auto_698313 ?auto_698325 ) ) ( not ( = ?auto_698313 ?auto_698326 ) ) ( not ( = ?auto_698314 ?auto_698315 ) ) ( not ( = ?auto_698314 ?auto_698316 ) ) ( not ( = ?auto_698314 ?auto_698317 ) ) ( not ( = ?auto_698314 ?auto_698318 ) ) ( not ( = ?auto_698314 ?auto_698319 ) ) ( not ( = ?auto_698314 ?auto_698320 ) ) ( not ( = ?auto_698314 ?auto_698321 ) ) ( not ( = ?auto_698314 ?auto_698322 ) ) ( not ( = ?auto_698314 ?auto_698323 ) ) ( not ( = ?auto_698314 ?auto_698324 ) ) ( not ( = ?auto_698314 ?auto_698325 ) ) ( not ( = ?auto_698314 ?auto_698326 ) ) ( not ( = ?auto_698315 ?auto_698316 ) ) ( not ( = ?auto_698315 ?auto_698317 ) ) ( not ( = ?auto_698315 ?auto_698318 ) ) ( not ( = ?auto_698315 ?auto_698319 ) ) ( not ( = ?auto_698315 ?auto_698320 ) ) ( not ( = ?auto_698315 ?auto_698321 ) ) ( not ( = ?auto_698315 ?auto_698322 ) ) ( not ( = ?auto_698315 ?auto_698323 ) ) ( not ( = ?auto_698315 ?auto_698324 ) ) ( not ( = ?auto_698315 ?auto_698325 ) ) ( not ( = ?auto_698315 ?auto_698326 ) ) ( not ( = ?auto_698316 ?auto_698317 ) ) ( not ( = ?auto_698316 ?auto_698318 ) ) ( not ( = ?auto_698316 ?auto_698319 ) ) ( not ( = ?auto_698316 ?auto_698320 ) ) ( not ( = ?auto_698316 ?auto_698321 ) ) ( not ( = ?auto_698316 ?auto_698322 ) ) ( not ( = ?auto_698316 ?auto_698323 ) ) ( not ( = ?auto_698316 ?auto_698324 ) ) ( not ( = ?auto_698316 ?auto_698325 ) ) ( not ( = ?auto_698316 ?auto_698326 ) ) ( not ( = ?auto_698317 ?auto_698318 ) ) ( not ( = ?auto_698317 ?auto_698319 ) ) ( not ( = ?auto_698317 ?auto_698320 ) ) ( not ( = ?auto_698317 ?auto_698321 ) ) ( not ( = ?auto_698317 ?auto_698322 ) ) ( not ( = ?auto_698317 ?auto_698323 ) ) ( not ( = ?auto_698317 ?auto_698324 ) ) ( not ( = ?auto_698317 ?auto_698325 ) ) ( not ( = ?auto_698317 ?auto_698326 ) ) ( not ( = ?auto_698318 ?auto_698319 ) ) ( not ( = ?auto_698318 ?auto_698320 ) ) ( not ( = ?auto_698318 ?auto_698321 ) ) ( not ( = ?auto_698318 ?auto_698322 ) ) ( not ( = ?auto_698318 ?auto_698323 ) ) ( not ( = ?auto_698318 ?auto_698324 ) ) ( not ( = ?auto_698318 ?auto_698325 ) ) ( not ( = ?auto_698318 ?auto_698326 ) ) ( not ( = ?auto_698319 ?auto_698320 ) ) ( not ( = ?auto_698319 ?auto_698321 ) ) ( not ( = ?auto_698319 ?auto_698322 ) ) ( not ( = ?auto_698319 ?auto_698323 ) ) ( not ( = ?auto_698319 ?auto_698324 ) ) ( not ( = ?auto_698319 ?auto_698325 ) ) ( not ( = ?auto_698319 ?auto_698326 ) ) ( not ( = ?auto_698320 ?auto_698321 ) ) ( not ( = ?auto_698320 ?auto_698322 ) ) ( not ( = ?auto_698320 ?auto_698323 ) ) ( not ( = ?auto_698320 ?auto_698324 ) ) ( not ( = ?auto_698320 ?auto_698325 ) ) ( not ( = ?auto_698320 ?auto_698326 ) ) ( not ( = ?auto_698321 ?auto_698322 ) ) ( not ( = ?auto_698321 ?auto_698323 ) ) ( not ( = ?auto_698321 ?auto_698324 ) ) ( not ( = ?auto_698321 ?auto_698325 ) ) ( not ( = ?auto_698321 ?auto_698326 ) ) ( not ( = ?auto_698322 ?auto_698323 ) ) ( not ( = ?auto_698322 ?auto_698324 ) ) ( not ( = ?auto_698322 ?auto_698325 ) ) ( not ( = ?auto_698322 ?auto_698326 ) ) ( not ( = ?auto_698323 ?auto_698324 ) ) ( not ( = ?auto_698323 ?auto_698325 ) ) ( not ( = ?auto_698323 ?auto_698326 ) ) ( not ( = ?auto_698324 ?auto_698325 ) ) ( not ( = ?auto_698324 ?auto_698326 ) ) ( not ( = ?auto_698325 ?auto_698326 ) ) ( ON ?auto_698324 ?auto_698325 ) ( ON ?auto_698323 ?auto_698324 ) ( ON ?auto_698322 ?auto_698323 ) ( ON ?auto_698321 ?auto_698322 ) ( ON ?auto_698320 ?auto_698321 ) ( ON ?auto_698319 ?auto_698320 ) ( ON ?auto_698318 ?auto_698319 ) ( ON ?auto_698317 ?auto_698318 ) ( ON ?auto_698316 ?auto_698317 ) ( ON ?auto_698315 ?auto_698316 ) ( ON ?auto_698314 ?auto_698315 ) ( ON ?auto_698313 ?auto_698314 ) ( CLEAR ?auto_698313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_698313 )
      ( MAKE-13PILE ?auto_698313 ?auto_698314 ?auto_698315 ?auto_698316 ?auto_698317 ?auto_698318 ?auto_698319 ?auto_698320 ?auto_698321 ?auto_698322 ?auto_698323 ?auto_698324 ?auto_698325 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_698368 - BLOCK
      ?auto_698369 - BLOCK
      ?auto_698370 - BLOCK
      ?auto_698371 - BLOCK
      ?auto_698372 - BLOCK
      ?auto_698373 - BLOCK
      ?auto_698374 - BLOCK
      ?auto_698375 - BLOCK
      ?auto_698376 - BLOCK
      ?auto_698377 - BLOCK
      ?auto_698378 - BLOCK
      ?auto_698379 - BLOCK
      ?auto_698380 - BLOCK
      ?auto_698381 - BLOCK
    )
    :vars
    (
      ?auto_698382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_698380 ) ( ON ?auto_698381 ?auto_698382 ) ( CLEAR ?auto_698381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_698368 ) ( ON ?auto_698369 ?auto_698368 ) ( ON ?auto_698370 ?auto_698369 ) ( ON ?auto_698371 ?auto_698370 ) ( ON ?auto_698372 ?auto_698371 ) ( ON ?auto_698373 ?auto_698372 ) ( ON ?auto_698374 ?auto_698373 ) ( ON ?auto_698375 ?auto_698374 ) ( ON ?auto_698376 ?auto_698375 ) ( ON ?auto_698377 ?auto_698376 ) ( ON ?auto_698378 ?auto_698377 ) ( ON ?auto_698379 ?auto_698378 ) ( ON ?auto_698380 ?auto_698379 ) ( not ( = ?auto_698368 ?auto_698369 ) ) ( not ( = ?auto_698368 ?auto_698370 ) ) ( not ( = ?auto_698368 ?auto_698371 ) ) ( not ( = ?auto_698368 ?auto_698372 ) ) ( not ( = ?auto_698368 ?auto_698373 ) ) ( not ( = ?auto_698368 ?auto_698374 ) ) ( not ( = ?auto_698368 ?auto_698375 ) ) ( not ( = ?auto_698368 ?auto_698376 ) ) ( not ( = ?auto_698368 ?auto_698377 ) ) ( not ( = ?auto_698368 ?auto_698378 ) ) ( not ( = ?auto_698368 ?auto_698379 ) ) ( not ( = ?auto_698368 ?auto_698380 ) ) ( not ( = ?auto_698368 ?auto_698381 ) ) ( not ( = ?auto_698368 ?auto_698382 ) ) ( not ( = ?auto_698369 ?auto_698370 ) ) ( not ( = ?auto_698369 ?auto_698371 ) ) ( not ( = ?auto_698369 ?auto_698372 ) ) ( not ( = ?auto_698369 ?auto_698373 ) ) ( not ( = ?auto_698369 ?auto_698374 ) ) ( not ( = ?auto_698369 ?auto_698375 ) ) ( not ( = ?auto_698369 ?auto_698376 ) ) ( not ( = ?auto_698369 ?auto_698377 ) ) ( not ( = ?auto_698369 ?auto_698378 ) ) ( not ( = ?auto_698369 ?auto_698379 ) ) ( not ( = ?auto_698369 ?auto_698380 ) ) ( not ( = ?auto_698369 ?auto_698381 ) ) ( not ( = ?auto_698369 ?auto_698382 ) ) ( not ( = ?auto_698370 ?auto_698371 ) ) ( not ( = ?auto_698370 ?auto_698372 ) ) ( not ( = ?auto_698370 ?auto_698373 ) ) ( not ( = ?auto_698370 ?auto_698374 ) ) ( not ( = ?auto_698370 ?auto_698375 ) ) ( not ( = ?auto_698370 ?auto_698376 ) ) ( not ( = ?auto_698370 ?auto_698377 ) ) ( not ( = ?auto_698370 ?auto_698378 ) ) ( not ( = ?auto_698370 ?auto_698379 ) ) ( not ( = ?auto_698370 ?auto_698380 ) ) ( not ( = ?auto_698370 ?auto_698381 ) ) ( not ( = ?auto_698370 ?auto_698382 ) ) ( not ( = ?auto_698371 ?auto_698372 ) ) ( not ( = ?auto_698371 ?auto_698373 ) ) ( not ( = ?auto_698371 ?auto_698374 ) ) ( not ( = ?auto_698371 ?auto_698375 ) ) ( not ( = ?auto_698371 ?auto_698376 ) ) ( not ( = ?auto_698371 ?auto_698377 ) ) ( not ( = ?auto_698371 ?auto_698378 ) ) ( not ( = ?auto_698371 ?auto_698379 ) ) ( not ( = ?auto_698371 ?auto_698380 ) ) ( not ( = ?auto_698371 ?auto_698381 ) ) ( not ( = ?auto_698371 ?auto_698382 ) ) ( not ( = ?auto_698372 ?auto_698373 ) ) ( not ( = ?auto_698372 ?auto_698374 ) ) ( not ( = ?auto_698372 ?auto_698375 ) ) ( not ( = ?auto_698372 ?auto_698376 ) ) ( not ( = ?auto_698372 ?auto_698377 ) ) ( not ( = ?auto_698372 ?auto_698378 ) ) ( not ( = ?auto_698372 ?auto_698379 ) ) ( not ( = ?auto_698372 ?auto_698380 ) ) ( not ( = ?auto_698372 ?auto_698381 ) ) ( not ( = ?auto_698372 ?auto_698382 ) ) ( not ( = ?auto_698373 ?auto_698374 ) ) ( not ( = ?auto_698373 ?auto_698375 ) ) ( not ( = ?auto_698373 ?auto_698376 ) ) ( not ( = ?auto_698373 ?auto_698377 ) ) ( not ( = ?auto_698373 ?auto_698378 ) ) ( not ( = ?auto_698373 ?auto_698379 ) ) ( not ( = ?auto_698373 ?auto_698380 ) ) ( not ( = ?auto_698373 ?auto_698381 ) ) ( not ( = ?auto_698373 ?auto_698382 ) ) ( not ( = ?auto_698374 ?auto_698375 ) ) ( not ( = ?auto_698374 ?auto_698376 ) ) ( not ( = ?auto_698374 ?auto_698377 ) ) ( not ( = ?auto_698374 ?auto_698378 ) ) ( not ( = ?auto_698374 ?auto_698379 ) ) ( not ( = ?auto_698374 ?auto_698380 ) ) ( not ( = ?auto_698374 ?auto_698381 ) ) ( not ( = ?auto_698374 ?auto_698382 ) ) ( not ( = ?auto_698375 ?auto_698376 ) ) ( not ( = ?auto_698375 ?auto_698377 ) ) ( not ( = ?auto_698375 ?auto_698378 ) ) ( not ( = ?auto_698375 ?auto_698379 ) ) ( not ( = ?auto_698375 ?auto_698380 ) ) ( not ( = ?auto_698375 ?auto_698381 ) ) ( not ( = ?auto_698375 ?auto_698382 ) ) ( not ( = ?auto_698376 ?auto_698377 ) ) ( not ( = ?auto_698376 ?auto_698378 ) ) ( not ( = ?auto_698376 ?auto_698379 ) ) ( not ( = ?auto_698376 ?auto_698380 ) ) ( not ( = ?auto_698376 ?auto_698381 ) ) ( not ( = ?auto_698376 ?auto_698382 ) ) ( not ( = ?auto_698377 ?auto_698378 ) ) ( not ( = ?auto_698377 ?auto_698379 ) ) ( not ( = ?auto_698377 ?auto_698380 ) ) ( not ( = ?auto_698377 ?auto_698381 ) ) ( not ( = ?auto_698377 ?auto_698382 ) ) ( not ( = ?auto_698378 ?auto_698379 ) ) ( not ( = ?auto_698378 ?auto_698380 ) ) ( not ( = ?auto_698378 ?auto_698381 ) ) ( not ( = ?auto_698378 ?auto_698382 ) ) ( not ( = ?auto_698379 ?auto_698380 ) ) ( not ( = ?auto_698379 ?auto_698381 ) ) ( not ( = ?auto_698379 ?auto_698382 ) ) ( not ( = ?auto_698380 ?auto_698381 ) ) ( not ( = ?auto_698380 ?auto_698382 ) ) ( not ( = ?auto_698381 ?auto_698382 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_698381 ?auto_698382 )
      ( !STACK ?auto_698381 ?auto_698380 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_698426 - BLOCK
      ?auto_698427 - BLOCK
      ?auto_698428 - BLOCK
      ?auto_698429 - BLOCK
      ?auto_698430 - BLOCK
      ?auto_698431 - BLOCK
      ?auto_698432 - BLOCK
      ?auto_698433 - BLOCK
      ?auto_698434 - BLOCK
      ?auto_698435 - BLOCK
      ?auto_698436 - BLOCK
      ?auto_698437 - BLOCK
      ?auto_698438 - BLOCK
      ?auto_698439 - BLOCK
    )
    :vars
    (
      ?auto_698440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698439 ?auto_698440 ) ( ON-TABLE ?auto_698426 ) ( ON ?auto_698427 ?auto_698426 ) ( ON ?auto_698428 ?auto_698427 ) ( ON ?auto_698429 ?auto_698428 ) ( ON ?auto_698430 ?auto_698429 ) ( ON ?auto_698431 ?auto_698430 ) ( ON ?auto_698432 ?auto_698431 ) ( ON ?auto_698433 ?auto_698432 ) ( ON ?auto_698434 ?auto_698433 ) ( ON ?auto_698435 ?auto_698434 ) ( ON ?auto_698436 ?auto_698435 ) ( ON ?auto_698437 ?auto_698436 ) ( not ( = ?auto_698426 ?auto_698427 ) ) ( not ( = ?auto_698426 ?auto_698428 ) ) ( not ( = ?auto_698426 ?auto_698429 ) ) ( not ( = ?auto_698426 ?auto_698430 ) ) ( not ( = ?auto_698426 ?auto_698431 ) ) ( not ( = ?auto_698426 ?auto_698432 ) ) ( not ( = ?auto_698426 ?auto_698433 ) ) ( not ( = ?auto_698426 ?auto_698434 ) ) ( not ( = ?auto_698426 ?auto_698435 ) ) ( not ( = ?auto_698426 ?auto_698436 ) ) ( not ( = ?auto_698426 ?auto_698437 ) ) ( not ( = ?auto_698426 ?auto_698438 ) ) ( not ( = ?auto_698426 ?auto_698439 ) ) ( not ( = ?auto_698426 ?auto_698440 ) ) ( not ( = ?auto_698427 ?auto_698428 ) ) ( not ( = ?auto_698427 ?auto_698429 ) ) ( not ( = ?auto_698427 ?auto_698430 ) ) ( not ( = ?auto_698427 ?auto_698431 ) ) ( not ( = ?auto_698427 ?auto_698432 ) ) ( not ( = ?auto_698427 ?auto_698433 ) ) ( not ( = ?auto_698427 ?auto_698434 ) ) ( not ( = ?auto_698427 ?auto_698435 ) ) ( not ( = ?auto_698427 ?auto_698436 ) ) ( not ( = ?auto_698427 ?auto_698437 ) ) ( not ( = ?auto_698427 ?auto_698438 ) ) ( not ( = ?auto_698427 ?auto_698439 ) ) ( not ( = ?auto_698427 ?auto_698440 ) ) ( not ( = ?auto_698428 ?auto_698429 ) ) ( not ( = ?auto_698428 ?auto_698430 ) ) ( not ( = ?auto_698428 ?auto_698431 ) ) ( not ( = ?auto_698428 ?auto_698432 ) ) ( not ( = ?auto_698428 ?auto_698433 ) ) ( not ( = ?auto_698428 ?auto_698434 ) ) ( not ( = ?auto_698428 ?auto_698435 ) ) ( not ( = ?auto_698428 ?auto_698436 ) ) ( not ( = ?auto_698428 ?auto_698437 ) ) ( not ( = ?auto_698428 ?auto_698438 ) ) ( not ( = ?auto_698428 ?auto_698439 ) ) ( not ( = ?auto_698428 ?auto_698440 ) ) ( not ( = ?auto_698429 ?auto_698430 ) ) ( not ( = ?auto_698429 ?auto_698431 ) ) ( not ( = ?auto_698429 ?auto_698432 ) ) ( not ( = ?auto_698429 ?auto_698433 ) ) ( not ( = ?auto_698429 ?auto_698434 ) ) ( not ( = ?auto_698429 ?auto_698435 ) ) ( not ( = ?auto_698429 ?auto_698436 ) ) ( not ( = ?auto_698429 ?auto_698437 ) ) ( not ( = ?auto_698429 ?auto_698438 ) ) ( not ( = ?auto_698429 ?auto_698439 ) ) ( not ( = ?auto_698429 ?auto_698440 ) ) ( not ( = ?auto_698430 ?auto_698431 ) ) ( not ( = ?auto_698430 ?auto_698432 ) ) ( not ( = ?auto_698430 ?auto_698433 ) ) ( not ( = ?auto_698430 ?auto_698434 ) ) ( not ( = ?auto_698430 ?auto_698435 ) ) ( not ( = ?auto_698430 ?auto_698436 ) ) ( not ( = ?auto_698430 ?auto_698437 ) ) ( not ( = ?auto_698430 ?auto_698438 ) ) ( not ( = ?auto_698430 ?auto_698439 ) ) ( not ( = ?auto_698430 ?auto_698440 ) ) ( not ( = ?auto_698431 ?auto_698432 ) ) ( not ( = ?auto_698431 ?auto_698433 ) ) ( not ( = ?auto_698431 ?auto_698434 ) ) ( not ( = ?auto_698431 ?auto_698435 ) ) ( not ( = ?auto_698431 ?auto_698436 ) ) ( not ( = ?auto_698431 ?auto_698437 ) ) ( not ( = ?auto_698431 ?auto_698438 ) ) ( not ( = ?auto_698431 ?auto_698439 ) ) ( not ( = ?auto_698431 ?auto_698440 ) ) ( not ( = ?auto_698432 ?auto_698433 ) ) ( not ( = ?auto_698432 ?auto_698434 ) ) ( not ( = ?auto_698432 ?auto_698435 ) ) ( not ( = ?auto_698432 ?auto_698436 ) ) ( not ( = ?auto_698432 ?auto_698437 ) ) ( not ( = ?auto_698432 ?auto_698438 ) ) ( not ( = ?auto_698432 ?auto_698439 ) ) ( not ( = ?auto_698432 ?auto_698440 ) ) ( not ( = ?auto_698433 ?auto_698434 ) ) ( not ( = ?auto_698433 ?auto_698435 ) ) ( not ( = ?auto_698433 ?auto_698436 ) ) ( not ( = ?auto_698433 ?auto_698437 ) ) ( not ( = ?auto_698433 ?auto_698438 ) ) ( not ( = ?auto_698433 ?auto_698439 ) ) ( not ( = ?auto_698433 ?auto_698440 ) ) ( not ( = ?auto_698434 ?auto_698435 ) ) ( not ( = ?auto_698434 ?auto_698436 ) ) ( not ( = ?auto_698434 ?auto_698437 ) ) ( not ( = ?auto_698434 ?auto_698438 ) ) ( not ( = ?auto_698434 ?auto_698439 ) ) ( not ( = ?auto_698434 ?auto_698440 ) ) ( not ( = ?auto_698435 ?auto_698436 ) ) ( not ( = ?auto_698435 ?auto_698437 ) ) ( not ( = ?auto_698435 ?auto_698438 ) ) ( not ( = ?auto_698435 ?auto_698439 ) ) ( not ( = ?auto_698435 ?auto_698440 ) ) ( not ( = ?auto_698436 ?auto_698437 ) ) ( not ( = ?auto_698436 ?auto_698438 ) ) ( not ( = ?auto_698436 ?auto_698439 ) ) ( not ( = ?auto_698436 ?auto_698440 ) ) ( not ( = ?auto_698437 ?auto_698438 ) ) ( not ( = ?auto_698437 ?auto_698439 ) ) ( not ( = ?auto_698437 ?auto_698440 ) ) ( not ( = ?auto_698438 ?auto_698439 ) ) ( not ( = ?auto_698438 ?auto_698440 ) ) ( not ( = ?auto_698439 ?auto_698440 ) ) ( CLEAR ?auto_698437 ) ( ON ?auto_698438 ?auto_698439 ) ( CLEAR ?auto_698438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_698426 ?auto_698427 ?auto_698428 ?auto_698429 ?auto_698430 ?auto_698431 ?auto_698432 ?auto_698433 ?auto_698434 ?auto_698435 ?auto_698436 ?auto_698437 ?auto_698438 )
      ( MAKE-14PILE ?auto_698426 ?auto_698427 ?auto_698428 ?auto_698429 ?auto_698430 ?auto_698431 ?auto_698432 ?auto_698433 ?auto_698434 ?auto_698435 ?auto_698436 ?auto_698437 ?auto_698438 ?auto_698439 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_698484 - BLOCK
      ?auto_698485 - BLOCK
      ?auto_698486 - BLOCK
      ?auto_698487 - BLOCK
      ?auto_698488 - BLOCK
      ?auto_698489 - BLOCK
      ?auto_698490 - BLOCK
      ?auto_698491 - BLOCK
      ?auto_698492 - BLOCK
      ?auto_698493 - BLOCK
      ?auto_698494 - BLOCK
      ?auto_698495 - BLOCK
      ?auto_698496 - BLOCK
      ?auto_698497 - BLOCK
    )
    :vars
    (
      ?auto_698498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698497 ?auto_698498 ) ( ON-TABLE ?auto_698484 ) ( ON ?auto_698485 ?auto_698484 ) ( ON ?auto_698486 ?auto_698485 ) ( ON ?auto_698487 ?auto_698486 ) ( ON ?auto_698488 ?auto_698487 ) ( ON ?auto_698489 ?auto_698488 ) ( ON ?auto_698490 ?auto_698489 ) ( ON ?auto_698491 ?auto_698490 ) ( ON ?auto_698492 ?auto_698491 ) ( ON ?auto_698493 ?auto_698492 ) ( ON ?auto_698494 ?auto_698493 ) ( not ( = ?auto_698484 ?auto_698485 ) ) ( not ( = ?auto_698484 ?auto_698486 ) ) ( not ( = ?auto_698484 ?auto_698487 ) ) ( not ( = ?auto_698484 ?auto_698488 ) ) ( not ( = ?auto_698484 ?auto_698489 ) ) ( not ( = ?auto_698484 ?auto_698490 ) ) ( not ( = ?auto_698484 ?auto_698491 ) ) ( not ( = ?auto_698484 ?auto_698492 ) ) ( not ( = ?auto_698484 ?auto_698493 ) ) ( not ( = ?auto_698484 ?auto_698494 ) ) ( not ( = ?auto_698484 ?auto_698495 ) ) ( not ( = ?auto_698484 ?auto_698496 ) ) ( not ( = ?auto_698484 ?auto_698497 ) ) ( not ( = ?auto_698484 ?auto_698498 ) ) ( not ( = ?auto_698485 ?auto_698486 ) ) ( not ( = ?auto_698485 ?auto_698487 ) ) ( not ( = ?auto_698485 ?auto_698488 ) ) ( not ( = ?auto_698485 ?auto_698489 ) ) ( not ( = ?auto_698485 ?auto_698490 ) ) ( not ( = ?auto_698485 ?auto_698491 ) ) ( not ( = ?auto_698485 ?auto_698492 ) ) ( not ( = ?auto_698485 ?auto_698493 ) ) ( not ( = ?auto_698485 ?auto_698494 ) ) ( not ( = ?auto_698485 ?auto_698495 ) ) ( not ( = ?auto_698485 ?auto_698496 ) ) ( not ( = ?auto_698485 ?auto_698497 ) ) ( not ( = ?auto_698485 ?auto_698498 ) ) ( not ( = ?auto_698486 ?auto_698487 ) ) ( not ( = ?auto_698486 ?auto_698488 ) ) ( not ( = ?auto_698486 ?auto_698489 ) ) ( not ( = ?auto_698486 ?auto_698490 ) ) ( not ( = ?auto_698486 ?auto_698491 ) ) ( not ( = ?auto_698486 ?auto_698492 ) ) ( not ( = ?auto_698486 ?auto_698493 ) ) ( not ( = ?auto_698486 ?auto_698494 ) ) ( not ( = ?auto_698486 ?auto_698495 ) ) ( not ( = ?auto_698486 ?auto_698496 ) ) ( not ( = ?auto_698486 ?auto_698497 ) ) ( not ( = ?auto_698486 ?auto_698498 ) ) ( not ( = ?auto_698487 ?auto_698488 ) ) ( not ( = ?auto_698487 ?auto_698489 ) ) ( not ( = ?auto_698487 ?auto_698490 ) ) ( not ( = ?auto_698487 ?auto_698491 ) ) ( not ( = ?auto_698487 ?auto_698492 ) ) ( not ( = ?auto_698487 ?auto_698493 ) ) ( not ( = ?auto_698487 ?auto_698494 ) ) ( not ( = ?auto_698487 ?auto_698495 ) ) ( not ( = ?auto_698487 ?auto_698496 ) ) ( not ( = ?auto_698487 ?auto_698497 ) ) ( not ( = ?auto_698487 ?auto_698498 ) ) ( not ( = ?auto_698488 ?auto_698489 ) ) ( not ( = ?auto_698488 ?auto_698490 ) ) ( not ( = ?auto_698488 ?auto_698491 ) ) ( not ( = ?auto_698488 ?auto_698492 ) ) ( not ( = ?auto_698488 ?auto_698493 ) ) ( not ( = ?auto_698488 ?auto_698494 ) ) ( not ( = ?auto_698488 ?auto_698495 ) ) ( not ( = ?auto_698488 ?auto_698496 ) ) ( not ( = ?auto_698488 ?auto_698497 ) ) ( not ( = ?auto_698488 ?auto_698498 ) ) ( not ( = ?auto_698489 ?auto_698490 ) ) ( not ( = ?auto_698489 ?auto_698491 ) ) ( not ( = ?auto_698489 ?auto_698492 ) ) ( not ( = ?auto_698489 ?auto_698493 ) ) ( not ( = ?auto_698489 ?auto_698494 ) ) ( not ( = ?auto_698489 ?auto_698495 ) ) ( not ( = ?auto_698489 ?auto_698496 ) ) ( not ( = ?auto_698489 ?auto_698497 ) ) ( not ( = ?auto_698489 ?auto_698498 ) ) ( not ( = ?auto_698490 ?auto_698491 ) ) ( not ( = ?auto_698490 ?auto_698492 ) ) ( not ( = ?auto_698490 ?auto_698493 ) ) ( not ( = ?auto_698490 ?auto_698494 ) ) ( not ( = ?auto_698490 ?auto_698495 ) ) ( not ( = ?auto_698490 ?auto_698496 ) ) ( not ( = ?auto_698490 ?auto_698497 ) ) ( not ( = ?auto_698490 ?auto_698498 ) ) ( not ( = ?auto_698491 ?auto_698492 ) ) ( not ( = ?auto_698491 ?auto_698493 ) ) ( not ( = ?auto_698491 ?auto_698494 ) ) ( not ( = ?auto_698491 ?auto_698495 ) ) ( not ( = ?auto_698491 ?auto_698496 ) ) ( not ( = ?auto_698491 ?auto_698497 ) ) ( not ( = ?auto_698491 ?auto_698498 ) ) ( not ( = ?auto_698492 ?auto_698493 ) ) ( not ( = ?auto_698492 ?auto_698494 ) ) ( not ( = ?auto_698492 ?auto_698495 ) ) ( not ( = ?auto_698492 ?auto_698496 ) ) ( not ( = ?auto_698492 ?auto_698497 ) ) ( not ( = ?auto_698492 ?auto_698498 ) ) ( not ( = ?auto_698493 ?auto_698494 ) ) ( not ( = ?auto_698493 ?auto_698495 ) ) ( not ( = ?auto_698493 ?auto_698496 ) ) ( not ( = ?auto_698493 ?auto_698497 ) ) ( not ( = ?auto_698493 ?auto_698498 ) ) ( not ( = ?auto_698494 ?auto_698495 ) ) ( not ( = ?auto_698494 ?auto_698496 ) ) ( not ( = ?auto_698494 ?auto_698497 ) ) ( not ( = ?auto_698494 ?auto_698498 ) ) ( not ( = ?auto_698495 ?auto_698496 ) ) ( not ( = ?auto_698495 ?auto_698497 ) ) ( not ( = ?auto_698495 ?auto_698498 ) ) ( not ( = ?auto_698496 ?auto_698497 ) ) ( not ( = ?auto_698496 ?auto_698498 ) ) ( not ( = ?auto_698497 ?auto_698498 ) ) ( ON ?auto_698496 ?auto_698497 ) ( CLEAR ?auto_698494 ) ( ON ?auto_698495 ?auto_698496 ) ( CLEAR ?auto_698495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_698484 ?auto_698485 ?auto_698486 ?auto_698487 ?auto_698488 ?auto_698489 ?auto_698490 ?auto_698491 ?auto_698492 ?auto_698493 ?auto_698494 ?auto_698495 )
      ( MAKE-14PILE ?auto_698484 ?auto_698485 ?auto_698486 ?auto_698487 ?auto_698488 ?auto_698489 ?auto_698490 ?auto_698491 ?auto_698492 ?auto_698493 ?auto_698494 ?auto_698495 ?auto_698496 ?auto_698497 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_698542 - BLOCK
      ?auto_698543 - BLOCK
      ?auto_698544 - BLOCK
      ?auto_698545 - BLOCK
      ?auto_698546 - BLOCK
      ?auto_698547 - BLOCK
      ?auto_698548 - BLOCK
      ?auto_698549 - BLOCK
      ?auto_698550 - BLOCK
      ?auto_698551 - BLOCK
      ?auto_698552 - BLOCK
      ?auto_698553 - BLOCK
      ?auto_698554 - BLOCK
      ?auto_698555 - BLOCK
    )
    :vars
    (
      ?auto_698556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698555 ?auto_698556 ) ( ON-TABLE ?auto_698542 ) ( ON ?auto_698543 ?auto_698542 ) ( ON ?auto_698544 ?auto_698543 ) ( ON ?auto_698545 ?auto_698544 ) ( ON ?auto_698546 ?auto_698545 ) ( ON ?auto_698547 ?auto_698546 ) ( ON ?auto_698548 ?auto_698547 ) ( ON ?auto_698549 ?auto_698548 ) ( ON ?auto_698550 ?auto_698549 ) ( ON ?auto_698551 ?auto_698550 ) ( not ( = ?auto_698542 ?auto_698543 ) ) ( not ( = ?auto_698542 ?auto_698544 ) ) ( not ( = ?auto_698542 ?auto_698545 ) ) ( not ( = ?auto_698542 ?auto_698546 ) ) ( not ( = ?auto_698542 ?auto_698547 ) ) ( not ( = ?auto_698542 ?auto_698548 ) ) ( not ( = ?auto_698542 ?auto_698549 ) ) ( not ( = ?auto_698542 ?auto_698550 ) ) ( not ( = ?auto_698542 ?auto_698551 ) ) ( not ( = ?auto_698542 ?auto_698552 ) ) ( not ( = ?auto_698542 ?auto_698553 ) ) ( not ( = ?auto_698542 ?auto_698554 ) ) ( not ( = ?auto_698542 ?auto_698555 ) ) ( not ( = ?auto_698542 ?auto_698556 ) ) ( not ( = ?auto_698543 ?auto_698544 ) ) ( not ( = ?auto_698543 ?auto_698545 ) ) ( not ( = ?auto_698543 ?auto_698546 ) ) ( not ( = ?auto_698543 ?auto_698547 ) ) ( not ( = ?auto_698543 ?auto_698548 ) ) ( not ( = ?auto_698543 ?auto_698549 ) ) ( not ( = ?auto_698543 ?auto_698550 ) ) ( not ( = ?auto_698543 ?auto_698551 ) ) ( not ( = ?auto_698543 ?auto_698552 ) ) ( not ( = ?auto_698543 ?auto_698553 ) ) ( not ( = ?auto_698543 ?auto_698554 ) ) ( not ( = ?auto_698543 ?auto_698555 ) ) ( not ( = ?auto_698543 ?auto_698556 ) ) ( not ( = ?auto_698544 ?auto_698545 ) ) ( not ( = ?auto_698544 ?auto_698546 ) ) ( not ( = ?auto_698544 ?auto_698547 ) ) ( not ( = ?auto_698544 ?auto_698548 ) ) ( not ( = ?auto_698544 ?auto_698549 ) ) ( not ( = ?auto_698544 ?auto_698550 ) ) ( not ( = ?auto_698544 ?auto_698551 ) ) ( not ( = ?auto_698544 ?auto_698552 ) ) ( not ( = ?auto_698544 ?auto_698553 ) ) ( not ( = ?auto_698544 ?auto_698554 ) ) ( not ( = ?auto_698544 ?auto_698555 ) ) ( not ( = ?auto_698544 ?auto_698556 ) ) ( not ( = ?auto_698545 ?auto_698546 ) ) ( not ( = ?auto_698545 ?auto_698547 ) ) ( not ( = ?auto_698545 ?auto_698548 ) ) ( not ( = ?auto_698545 ?auto_698549 ) ) ( not ( = ?auto_698545 ?auto_698550 ) ) ( not ( = ?auto_698545 ?auto_698551 ) ) ( not ( = ?auto_698545 ?auto_698552 ) ) ( not ( = ?auto_698545 ?auto_698553 ) ) ( not ( = ?auto_698545 ?auto_698554 ) ) ( not ( = ?auto_698545 ?auto_698555 ) ) ( not ( = ?auto_698545 ?auto_698556 ) ) ( not ( = ?auto_698546 ?auto_698547 ) ) ( not ( = ?auto_698546 ?auto_698548 ) ) ( not ( = ?auto_698546 ?auto_698549 ) ) ( not ( = ?auto_698546 ?auto_698550 ) ) ( not ( = ?auto_698546 ?auto_698551 ) ) ( not ( = ?auto_698546 ?auto_698552 ) ) ( not ( = ?auto_698546 ?auto_698553 ) ) ( not ( = ?auto_698546 ?auto_698554 ) ) ( not ( = ?auto_698546 ?auto_698555 ) ) ( not ( = ?auto_698546 ?auto_698556 ) ) ( not ( = ?auto_698547 ?auto_698548 ) ) ( not ( = ?auto_698547 ?auto_698549 ) ) ( not ( = ?auto_698547 ?auto_698550 ) ) ( not ( = ?auto_698547 ?auto_698551 ) ) ( not ( = ?auto_698547 ?auto_698552 ) ) ( not ( = ?auto_698547 ?auto_698553 ) ) ( not ( = ?auto_698547 ?auto_698554 ) ) ( not ( = ?auto_698547 ?auto_698555 ) ) ( not ( = ?auto_698547 ?auto_698556 ) ) ( not ( = ?auto_698548 ?auto_698549 ) ) ( not ( = ?auto_698548 ?auto_698550 ) ) ( not ( = ?auto_698548 ?auto_698551 ) ) ( not ( = ?auto_698548 ?auto_698552 ) ) ( not ( = ?auto_698548 ?auto_698553 ) ) ( not ( = ?auto_698548 ?auto_698554 ) ) ( not ( = ?auto_698548 ?auto_698555 ) ) ( not ( = ?auto_698548 ?auto_698556 ) ) ( not ( = ?auto_698549 ?auto_698550 ) ) ( not ( = ?auto_698549 ?auto_698551 ) ) ( not ( = ?auto_698549 ?auto_698552 ) ) ( not ( = ?auto_698549 ?auto_698553 ) ) ( not ( = ?auto_698549 ?auto_698554 ) ) ( not ( = ?auto_698549 ?auto_698555 ) ) ( not ( = ?auto_698549 ?auto_698556 ) ) ( not ( = ?auto_698550 ?auto_698551 ) ) ( not ( = ?auto_698550 ?auto_698552 ) ) ( not ( = ?auto_698550 ?auto_698553 ) ) ( not ( = ?auto_698550 ?auto_698554 ) ) ( not ( = ?auto_698550 ?auto_698555 ) ) ( not ( = ?auto_698550 ?auto_698556 ) ) ( not ( = ?auto_698551 ?auto_698552 ) ) ( not ( = ?auto_698551 ?auto_698553 ) ) ( not ( = ?auto_698551 ?auto_698554 ) ) ( not ( = ?auto_698551 ?auto_698555 ) ) ( not ( = ?auto_698551 ?auto_698556 ) ) ( not ( = ?auto_698552 ?auto_698553 ) ) ( not ( = ?auto_698552 ?auto_698554 ) ) ( not ( = ?auto_698552 ?auto_698555 ) ) ( not ( = ?auto_698552 ?auto_698556 ) ) ( not ( = ?auto_698553 ?auto_698554 ) ) ( not ( = ?auto_698553 ?auto_698555 ) ) ( not ( = ?auto_698553 ?auto_698556 ) ) ( not ( = ?auto_698554 ?auto_698555 ) ) ( not ( = ?auto_698554 ?auto_698556 ) ) ( not ( = ?auto_698555 ?auto_698556 ) ) ( ON ?auto_698554 ?auto_698555 ) ( ON ?auto_698553 ?auto_698554 ) ( CLEAR ?auto_698551 ) ( ON ?auto_698552 ?auto_698553 ) ( CLEAR ?auto_698552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_698542 ?auto_698543 ?auto_698544 ?auto_698545 ?auto_698546 ?auto_698547 ?auto_698548 ?auto_698549 ?auto_698550 ?auto_698551 ?auto_698552 )
      ( MAKE-14PILE ?auto_698542 ?auto_698543 ?auto_698544 ?auto_698545 ?auto_698546 ?auto_698547 ?auto_698548 ?auto_698549 ?auto_698550 ?auto_698551 ?auto_698552 ?auto_698553 ?auto_698554 ?auto_698555 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_698600 - BLOCK
      ?auto_698601 - BLOCK
      ?auto_698602 - BLOCK
      ?auto_698603 - BLOCK
      ?auto_698604 - BLOCK
      ?auto_698605 - BLOCK
      ?auto_698606 - BLOCK
      ?auto_698607 - BLOCK
      ?auto_698608 - BLOCK
      ?auto_698609 - BLOCK
      ?auto_698610 - BLOCK
      ?auto_698611 - BLOCK
      ?auto_698612 - BLOCK
      ?auto_698613 - BLOCK
    )
    :vars
    (
      ?auto_698614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698613 ?auto_698614 ) ( ON-TABLE ?auto_698600 ) ( ON ?auto_698601 ?auto_698600 ) ( ON ?auto_698602 ?auto_698601 ) ( ON ?auto_698603 ?auto_698602 ) ( ON ?auto_698604 ?auto_698603 ) ( ON ?auto_698605 ?auto_698604 ) ( ON ?auto_698606 ?auto_698605 ) ( ON ?auto_698607 ?auto_698606 ) ( ON ?auto_698608 ?auto_698607 ) ( not ( = ?auto_698600 ?auto_698601 ) ) ( not ( = ?auto_698600 ?auto_698602 ) ) ( not ( = ?auto_698600 ?auto_698603 ) ) ( not ( = ?auto_698600 ?auto_698604 ) ) ( not ( = ?auto_698600 ?auto_698605 ) ) ( not ( = ?auto_698600 ?auto_698606 ) ) ( not ( = ?auto_698600 ?auto_698607 ) ) ( not ( = ?auto_698600 ?auto_698608 ) ) ( not ( = ?auto_698600 ?auto_698609 ) ) ( not ( = ?auto_698600 ?auto_698610 ) ) ( not ( = ?auto_698600 ?auto_698611 ) ) ( not ( = ?auto_698600 ?auto_698612 ) ) ( not ( = ?auto_698600 ?auto_698613 ) ) ( not ( = ?auto_698600 ?auto_698614 ) ) ( not ( = ?auto_698601 ?auto_698602 ) ) ( not ( = ?auto_698601 ?auto_698603 ) ) ( not ( = ?auto_698601 ?auto_698604 ) ) ( not ( = ?auto_698601 ?auto_698605 ) ) ( not ( = ?auto_698601 ?auto_698606 ) ) ( not ( = ?auto_698601 ?auto_698607 ) ) ( not ( = ?auto_698601 ?auto_698608 ) ) ( not ( = ?auto_698601 ?auto_698609 ) ) ( not ( = ?auto_698601 ?auto_698610 ) ) ( not ( = ?auto_698601 ?auto_698611 ) ) ( not ( = ?auto_698601 ?auto_698612 ) ) ( not ( = ?auto_698601 ?auto_698613 ) ) ( not ( = ?auto_698601 ?auto_698614 ) ) ( not ( = ?auto_698602 ?auto_698603 ) ) ( not ( = ?auto_698602 ?auto_698604 ) ) ( not ( = ?auto_698602 ?auto_698605 ) ) ( not ( = ?auto_698602 ?auto_698606 ) ) ( not ( = ?auto_698602 ?auto_698607 ) ) ( not ( = ?auto_698602 ?auto_698608 ) ) ( not ( = ?auto_698602 ?auto_698609 ) ) ( not ( = ?auto_698602 ?auto_698610 ) ) ( not ( = ?auto_698602 ?auto_698611 ) ) ( not ( = ?auto_698602 ?auto_698612 ) ) ( not ( = ?auto_698602 ?auto_698613 ) ) ( not ( = ?auto_698602 ?auto_698614 ) ) ( not ( = ?auto_698603 ?auto_698604 ) ) ( not ( = ?auto_698603 ?auto_698605 ) ) ( not ( = ?auto_698603 ?auto_698606 ) ) ( not ( = ?auto_698603 ?auto_698607 ) ) ( not ( = ?auto_698603 ?auto_698608 ) ) ( not ( = ?auto_698603 ?auto_698609 ) ) ( not ( = ?auto_698603 ?auto_698610 ) ) ( not ( = ?auto_698603 ?auto_698611 ) ) ( not ( = ?auto_698603 ?auto_698612 ) ) ( not ( = ?auto_698603 ?auto_698613 ) ) ( not ( = ?auto_698603 ?auto_698614 ) ) ( not ( = ?auto_698604 ?auto_698605 ) ) ( not ( = ?auto_698604 ?auto_698606 ) ) ( not ( = ?auto_698604 ?auto_698607 ) ) ( not ( = ?auto_698604 ?auto_698608 ) ) ( not ( = ?auto_698604 ?auto_698609 ) ) ( not ( = ?auto_698604 ?auto_698610 ) ) ( not ( = ?auto_698604 ?auto_698611 ) ) ( not ( = ?auto_698604 ?auto_698612 ) ) ( not ( = ?auto_698604 ?auto_698613 ) ) ( not ( = ?auto_698604 ?auto_698614 ) ) ( not ( = ?auto_698605 ?auto_698606 ) ) ( not ( = ?auto_698605 ?auto_698607 ) ) ( not ( = ?auto_698605 ?auto_698608 ) ) ( not ( = ?auto_698605 ?auto_698609 ) ) ( not ( = ?auto_698605 ?auto_698610 ) ) ( not ( = ?auto_698605 ?auto_698611 ) ) ( not ( = ?auto_698605 ?auto_698612 ) ) ( not ( = ?auto_698605 ?auto_698613 ) ) ( not ( = ?auto_698605 ?auto_698614 ) ) ( not ( = ?auto_698606 ?auto_698607 ) ) ( not ( = ?auto_698606 ?auto_698608 ) ) ( not ( = ?auto_698606 ?auto_698609 ) ) ( not ( = ?auto_698606 ?auto_698610 ) ) ( not ( = ?auto_698606 ?auto_698611 ) ) ( not ( = ?auto_698606 ?auto_698612 ) ) ( not ( = ?auto_698606 ?auto_698613 ) ) ( not ( = ?auto_698606 ?auto_698614 ) ) ( not ( = ?auto_698607 ?auto_698608 ) ) ( not ( = ?auto_698607 ?auto_698609 ) ) ( not ( = ?auto_698607 ?auto_698610 ) ) ( not ( = ?auto_698607 ?auto_698611 ) ) ( not ( = ?auto_698607 ?auto_698612 ) ) ( not ( = ?auto_698607 ?auto_698613 ) ) ( not ( = ?auto_698607 ?auto_698614 ) ) ( not ( = ?auto_698608 ?auto_698609 ) ) ( not ( = ?auto_698608 ?auto_698610 ) ) ( not ( = ?auto_698608 ?auto_698611 ) ) ( not ( = ?auto_698608 ?auto_698612 ) ) ( not ( = ?auto_698608 ?auto_698613 ) ) ( not ( = ?auto_698608 ?auto_698614 ) ) ( not ( = ?auto_698609 ?auto_698610 ) ) ( not ( = ?auto_698609 ?auto_698611 ) ) ( not ( = ?auto_698609 ?auto_698612 ) ) ( not ( = ?auto_698609 ?auto_698613 ) ) ( not ( = ?auto_698609 ?auto_698614 ) ) ( not ( = ?auto_698610 ?auto_698611 ) ) ( not ( = ?auto_698610 ?auto_698612 ) ) ( not ( = ?auto_698610 ?auto_698613 ) ) ( not ( = ?auto_698610 ?auto_698614 ) ) ( not ( = ?auto_698611 ?auto_698612 ) ) ( not ( = ?auto_698611 ?auto_698613 ) ) ( not ( = ?auto_698611 ?auto_698614 ) ) ( not ( = ?auto_698612 ?auto_698613 ) ) ( not ( = ?auto_698612 ?auto_698614 ) ) ( not ( = ?auto_698613 ?auto_698614 ) ) ( ON ?auto_698612 ?auto_698613 ) ( ON ?auto_698611 ?auto_698612 ) ( ON ?auto_698610 ?auto_698611 ) ( CLEAR ?auto_698608 ) ( ON ?auto_698609 ?auto_698610 ) ( CLEAR ?auto_698609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_698600 ?auto_698601 ?auto_698602 ?auto_698603 ?auto_698604 ?auto_698605 ?auto_698606 ?auto_698607 ?auto_698608 ?auto_698609 )
      ( MAKE-14PILE ?auto_698600 ?auto_698601 ?auto_698602 ?auto_698603 ?auto_698604 ?auto_698605 ?auto_698606 ?auto_698607 ?auto_698608 ?auto_698609 ?auto_698610 ?auto_698611 ?auto_698612 ?auto_698613 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_698658 - BLOCK
      ?auto_698659 - BLOCK
      ?auto_698660 - BLOCK
      ?auto_698661 - BLOCK
      ?auto_698662 - BLOCK
      ?auto_698663 - BLOCK
      ?auto_698664 - BLOCK
      ?auto_698665 - BLOCK
      ?auto_698666 - BLOCK
      ?auto_698667 - BLOCK
      ?auto_698668 - BLOCK
      ?auto_698669 - BLOCK
      ?auto_698670 - BLOCK
      ?auto_698671 - BLOCK
    )
    :vars
    (
      ?auto_698672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698671 ?auto_698672 ) ( ON-TABLE ?auto_698658 ) ( ON ?auto_698659 ?auto_698658 ) ( ON ?auto_698660 ?auto_698659 ) ( ON ?auto_698661 ?auto_698660 ) ( ON ?auto_698662 ?auto_698661 ) ( ON ?auto_698663 ?auto_698662 ) ( ON ?auto_698664 ?auto_698663 ) ( ON ?auto_698665 ?auto_698664 ) ( not ( = ?auto_698658 ?auto_698659 ) ) ( not ( = ?auto_698658 ?auto_698660 ) ) ( not ( = ?auto_698658 ?auto_698661 ) ) ( not ( = ?auto_698658 ?auto_698662 ) ) ( not ( = ?auto_698658 ?auto_698663 ) ) ( not ( = ?auto_698658 ?auto_698664 ) ) ( not ( = ?auto_698658 ?auto_698665 ) ) ( not ( = ?auto_698658 ?auto_698666 ) ) ( not ( = ?auto_698658 ?auto_698667 ) ) ( not ( = ?auto_698658 ?auto_698668 ) ) ( not ( = ?auto_698658 ?auto_698669 ) ) ( not ( = ?auto_698658 ?auto_698670 ) ) ( not ( = ?auto_698658 ?auto_698671 ) ) ( not ( = ?auto_698658 ?auto_698672 ) ) ( not ( = ?auto_698659 ?auto_698660 ) ) ( not ( = ?auto_698659 ?auto_698661 ) ) ( not ( = ?auto_698659 ?auto_698662 ) ) ( not ( = ?auto_698659 ?auto_698663 ) ) ( not ( = ?auto_698659 ?auto_698664 ) ) ( not ( = ?auto_698659 ?auto_698665 ) ) ( not ( = ?auto_698659 ?auto_698666 ) ) ( not ( = ?auto_698659 ?auto_698667 ) ) ( not ( = ?auto_698659 ?auto_698668 ) ) ( not ( = ?auto_698659 ?auto_698669 ) ) ( not ( = ?auto_698659 ?auto_698670 ) ) ( not ( = ?auto_698659 ?auto_698671 ) ) ( not ( = ?auto_698659 ?auto_698672 ) ) ( not ( = ?auto_698660 ?auto_698661 ) ) ( not ( = ?auto_698660 ?auto_698662 ) ) ( not ( = ?auto_698660 ?auto_698663 ) ) ( not ( = ?auto_698660 ?auto_698664 ) ) ( not ( = ?auto_698660 ?auto_698665 ) ) ( not ( = ?auto_698660 ?auto_698666 ) ) ( not ( = ?auto_698660 ?auto_698667 ) ) ( not ( = ?auto_698660 ?auto_698668 ) ) ( not ( = ?auto_698660 ?auto_698669 ) ) ( not ( = ?auto_698660 ?auto_698670 ) ) ( not ( = ?auto_698660 ?auto_698671 ) ) ( not ( = ?auto_698660 ?auto_698672 ) ) ( not ( = ?auto_698661 ?auto_698662 ) ) ( not ( = ?auto_698661 ?auto_698663 ) ) ( not ( = ?auto_698661 ?auto_698664 ) ) ( not ( = ?auto_698661 ?auto_698665 ) ) ( not ( = ?auto_698661 ?auto_698666 ) ) ( not ( = ?auto_698661 ?auto_698667 ) ) ( not ( = ?auto_698661 ?auto_698668 ) ) ( not ( = ?auto_698661 ?auto_698669 ) ) ( not ( = ?auto_698661 ?auto_698670 ) ) ( not ( = ?auto_698661 ?auto_698671 ) ) ( not ( = ?auto_698661 ?auto_698672 ) ) ( not ( = ?auto_698662 ?auto_698663 ) ) ( not ( = ?auto_698662 ?auto_698664 ) ) ( not ( = ?auto_698662 ?auto_698665 ) ) ( not ( = ?auto_698662 ?auto_698666 ) ) ( not ( = ?auto_698662 ?auto_698667 ) ) ( not ( = ?auto_698662 ?auto_698668 ) ) ( not ( = ?auto_698662 ?auto_698669 ) ) ( not ( = ?auto_698662 ?auto_698670 ) ) ( not ( = ?auto_698662 ?auto_698671 ) ) ( not ( = ?auto_698662 ?auto_698672 ) ) ( not ( = ?auto_698663 ?auto_698664 ) ) ( not ( = ?auto_698663 ?auto_698665 ) ) ( not ( = ?auto_698663 ?auto_698666 ) ) ( not ( = ?auto_698663 ?auto_698667 ) ) ( not ( = ?auto_698663 ?auto_698668 ) ) ( not ( = ?auto_698663 ?auto_698669 ) ) ( not ( = ?auto_698663 ?auto_698670 ) ) ( not ( = ?auto_698663 ?auto_698671 ) ) ( not ( = ?auto_698663 ?auto_698672 ) ) ( not ( = ?auto_698664 ?auto_698665 ) ) ( not ( = ?auto_698664 ?auto_698666 ) ) ( not ( = ?auto_698664 ?auto_698667 ) ) ( not ( = ?auto_698664 ?auto_698668 ) ) ( not ( = ?auto_698664 ?auto_698669 ) ) ( not ( = ?auto_698664 ?auto_698670 ) ) ( not ( = ?auto_698664 ?auto_698671 ) ) ( not ( = ?auto_698664 ?auto_698672 ) ) ( not ( = ?auto_698665 ?auto_698666 ) ) ( not ( = ?auto_698665 ?auto_698667 ) ) ( not ( = ?auto_698665 ?auto_698668 ) ) ( not ( = ?auto_698665 ?auto_698669 ) ) ( not ( = ?auto_698665 ?auto_698670 ) ) ( not ( = ?auto_698665 ?auto_698671 ) ) ( not ( = ?auto_698665 ?auto_698672 ) ) ( not ( = ?auto_698666 ?auto_698667 ) ) ( not ( = ?auto_698666 ?auto_698668 ) ) ( not ( = ?auto_698666 ?auto_698669 ) ) ( not ( = ?auto_698666 ?auto_698670 ) ) ( not ( = ?auto_698666 ?auto_698671 ) ) ( not ( = ?auto_698666 ?auto_698672 ) ) ( not ( = ?auto_698667 ?auto_698668 ) ) ( not ( = ?auto_698667 ?auto_698669 ) ) ( not ( = ?auto_698667 ?auto_698670 ) ) ( not ( = ?auto_698667 ?auto_698671 ) ) ( not ( = ?auto_698667 ?auto_698672 ) ) ( not ( = ?auto_698668 ?auto_698669 ) ) ( not ( = ?auto_698668 ?auto_698670 ) ) ( not ( = ?auto_698668 ?auto_698671 ) ) ( not ( = ?auto_698668 ?auto_698672 ) ) ( not ( = ?auto_698669 ?auto_698670 ) ) ( not ( = ?auto_698669 ?auto_698671 ) ) ( not ( = ?auto_698669 ?auto_698672 ) ) ( not ( = ?auto_698670 ?auto_698671 ) ) ( not ( = ?auto_698670 ?auto_698672 ) ) ( not ( = ?auto_698671 ?auto_698672 ) ) ( ON ?auto_698670 ?auto_698671 ) ( ON ?auto_698669 ?auto_698670 ) ( ON ?auto_698668 ?auto_698669 ) ( ON ?auto_698667 ?auto_698668 ) ( CLEAR ?auto_698665 ) ( ON ?auto_698666 ?auto_698667 ) ( CLEAR ?auto_698666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_698658 ?auto_698659 ?auto_698660 ?auto_698661 ?auto_698662 ?auto_698663 ?auto_698664 ?auto_698665 ?auto_698666 )
      ( MAKE-14PILE ?auto_698658 ?auto_698659 ?auto_698660 ?auto_698661 ?auto_698662 ?auto_698663 ?auto_698664 ?auto_698665 ?auto_698666 ?auto_698667 ?auto_698668 ?auto_698669 ?auto_698670 ?auto_698671 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_698716 - BLOCK
      ?auto_698717 - BLOCK
      ?auto_698718 - BLOCK
      ?auto_698719 - BLOCK
      ?auto_698720 - BLOCK
      ?auto_698721 - BLOCK
      ?auto_698722 - BLOCK
      ?auto_698723 - BLOCK
      ?auto_698724 - BLOCK
      ?auto_698725 - BLOCK
      ?auto_698726 - BLOCK
      ?auto_698727 - BLOCK
      ?auto_698728 - BLOCK
      ?auto_698729 - BLOCK
    )
    :vars
    (
      ?auto_698730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698729 ?auto_698730 ) ( ON-TABLE ?auto_698716 ) ( ON ?auto_698717 ?auto_698716 ) ( ON ?auto_698718 ?auto_698717 ) ( ON ?auto_698719 ?auto_698718 ) ( ON ?auto_698720 ?auto_698719 ) ( ON ?auto_698721 ?auto_698720 ) ( ON ?auto_698722 ?auto_698721 ) ( not ( = ?auto_698716 ?auto_698717 ) ) ( not ( = ?auto_698716 ?auto_698718 ) ) ( not ( = ?auto_698716 ?auto_698719 ) ) ( not ( = ?auto_698716 ?auto_698720 ) ) ( not ( = ?auto_698716 ?auto_698721 ) ) ( not ( = ?auto_698716 ?auto_698722 ) ) ( not ( = ?auto_698716 ?auto_698723 ) ) ( not ( = ?auto_698716 ?auto_698724 ) ) ( not ( = ?auto_698716 ?auto_698725 ) ) ( not ( = ?auto_698716 ?auto_698726 ) ) ( not ( = ?auto_698716 ?auto_698727 ) ) ( not ( = ?auto_698716 ?auto_698728 ) ) ( not ( = ?auto_698716 ?auto_698729 ) ) ( not ( = ?auto_698716 ?auto_698730 ) ) ( not ( = ?auto_698717 ?auto_698718 ) ) ( not ( = ?auto_698717 ?auto_698719 ) ) ( not ( = ?auto_698717 ?auto_698720 ) ) ( not ( = ?auto_698717 ?auto_698721 ) ) ( not ( = ?auto_698717 ?auto_698722 ) ) ( not ( = ?auto_698717 ?auto_698723 ) ) ( not ( = ?auto_698717 ?auto_698724 ) ) ( not ( = ?auto_698717 ?auto_698725 ) ) ( not ( = ?auto_698717 ?auto_698726 ) ) ( not ( = ?auto_698717 ?auto_698727 ) ) ( not ( = ?auto_698717 ?auto_698728 ) ) ( not ( = ?auto_698717 ?auto_698729 ) ) ( not ( = ?auto_698717 ?auto_698730 ) ) ( not ( = ?auto_698718 ?auto_698719 ) ) ( not ( = ?auto_698718 ?auto_698720 ) ) ( not ( = ?auto_698718 ?auto_698721 ) ) ( not ( = ?auto_698718 ?auto_698722 ) ) ( not ( = ?auto_698718 ?auto_698723 ) ) ( not ( = ?auto_698718 ?auto_698724 ) ) ( not ( = ?auto_698718 ?auto_698725 ) ) ( not ( = ?auto_698718 ?auto_698726 ) ) ( not ( = ?auto_698718 ?auto_698727 ) ) ( not ( = ?auto_698718 ?auto_698728 ) ) ( not ( = ?auto_698718 ?auto_698729 ) ) ( not ( = ?auto_698718 ?auto_698730 ) ) ( not ( = ?auto_698719 ?auto_698720 ) ) ( not ( = ?auto_698719 ?auto_698721 ) ) ( not ( = ?auto_698719 ?auto_698722 ) ) ( not ( = ?auto_698719 ?auto_698723 ) ) ( not ( = ?auto_698719 ?auto_698724 ) ) ( not ( = ?auto_698719 ?auto_698725 ) ) ( not ( = ?auto_698719 ?auto_698726 ) ) ( not ( = ?auto_698719 ?auto_698727 ) ) ( not ( = ?auto_698719 ?auto_698728 ) ) ( not ( = ?auto_698719 ?auto_698729 ) ) ( not ( = ?auto_698719 ?auto_698730 ) ) ( not ( = ?auto_698720 ?auto_698721 ) ) ( not ( = ?auto_698720 ?auto_698722 ) ) ( not ( = ?auto_698720 ?auto_698723 ) ) ( not ( = ?auto_698720 ?auto_698724 ) ) ( not ( = ?auto_698720 ?auto_698725 ) ) ( not ( = ?auto_698720 ?auto_698726 ) ) ( not ( = ?auto_698720 ?auto_698727 ) ) ( not ( = ?auto_698720 ?auto_698728 ) ) ( not ( = ?auto_698720 ?auto_698729 ) ) ( not ( = ?auto_698720 ?auto_698730 ) ) ( not ( = ?auto_698721 ?auto_698722 ) ) ( not ( = ?auto_698721 ?auto_698723 ) ) ( not ( = ?auto_698721 ?auto_698724 ) ) ( not ( = ?auto_698721 ?auto_698725 ) ) ( not ( = ?auto_698721 ?auto_698726 ) ) ( not ( = ?auto_698721 ?auto_698727 ) ) ( not ( = ?auto_698721 ?auto_698728 ) ) ( not ( = ?auto_698721 ?auto_698729 ) ) ( not ( = ?auto_698721 ?auto_698730 ) ) ( not ( = ?auto_698722 ?auto_698723 ) ) ( not ( = ?auto_698722 ?auto_698724 ) ) ( not ( = ?auto_698722 ?auto_698725 ) ) ( not ( = ?auto_698722 ?auto_698726 ) ) ( not ( = ?auto_698722 ?auto_698727 ) ) ( not ( = ?auto_698722 ?auto_698728 ) ) ( not ( = ?auto_698722 ?auto_698729 ) ) ( not ( = ?auto_698722 ?auto_698730 ) ) ( not ( = ?auto_698723 ?auto_698724 ) ) ( not ( = ?auto_698723 ?auto_698725 ) ) ( not ( = ?auto_698723 ?auto_698726 ) ) ( not ( = ?auto_698723 ?auto_698727 ) ) ( not ( = ?auto_698723 ?auto_698728 ) ) ( not ( = ?auto_698723 ?auto_698729 ) ) ( not ( = ?auto_698723 ?auto_698730 ) ) ( not ( = ?auto_698724 ?auto_698725 ) ) ( not ( = ?auto_698724 ?auto_698726 ) ) ( not ( = ?auto_698724 ?auto_698727 ) ) ( not ( = ?auto_698724 ?auto_698728 ) ) ( not ( = ?auto_698724 ?auto_698729 ) ) ( not ( = ?auto_698724 ?auto_698730 ) ) ( not ( = ?auto_698725 ?auto_698726 ) ) ( not ( = ?auto_698725 ?auto_698727 ) ) ( not ( = ?auto_698725 ?auto_698728 ) ) ( not ( = ?auto_698725 ?auto_698729 ) ) ( not ( = ?auto_698725 ?auto_698730 ) ) ( not ( = ?auto_698726 ?auto_698727 ) ) ( not ( = ?auto_698726 ?auto_698728 ) ) ( not ( = ?auto_698726 ?auto_698729 ) ) ( not ( = ?auto_698726 ?auto_698730 ) ) ( not ( = ?auto_698727 ?auto_698728 ) ) ( not ( = ?auto_698727 ?auto_698729 ) ) ( not ( = ?auto_698727 ?auto_698730 ) ) ( not ( = ?auto_698728 ?auto_698729 ) ) ( not ( = ?auto_698728 ?auto_698730 ) ) ( not ( = ?auto_698729 ?auto_698730 ) ) ( ON ?auto_698728 ?auto_698729 ) ( ON ?auto_698727 ?auto_698728 ) ( ON ?auto_698726 ?auto_698727 ) ( ON ?auto_698725 ?auto_698726 ) ( ON ?auto_698724 ?auto_698725 ) ( CLEAR ?auto_698722 ) ( ON ?auto_698723 ?auto_698724 ) ( CLEAR ?auto_698723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_698716 ?auto_698717 ?auto_698718 ?auto_698719 ?auto_698720 ?auto_698721 ?auto_698722 ?auto_698723 )
      ( MAKE-14PILE ?auto_698716 ?auto_698717 ?auto_698718 ?auto_698719 ?auto_698720 ?auto_698721 ?auto_698722 ?auto_698723 ?auto_698724 ?auto_698725 ?auto_698726 ?auto_698727 ?auto_698728 ?auto_698729 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_698774 - BLOCK
      ?auto_698775 - BLOCK
      ?auto_698776 - BLOCK
      ?auto_698777 - BLOCK
      ?auto_698778 - BLOCK
      ?auto_698779 - BLOCK
      ?auto_698780 - BLOCK
      ?auto_698781 - BLOCK
      ?auto_698782 - BLOCK
      ?auto_698783 - BLOCK
      ?auto_698784 - BLOCK
      ?auto_698785 - BLOCK
      ?auto_698786 - BLOCK
      ?auto_698787 - BLOCK
    )
    :vars
    (
      ?auto_698788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698787 ?auto_698788 ) ( ON-TABLE ?auto_698774 ) ( ON ?auto_698775 ?auto_698774 ) ( ON ?auto_698776 ?auto_698775 ) ( ON ?auto_698777 ?auto_698776 ) ( ON ?auto_698778 ?auto_698777 ) ( ON ?auto_698779 ?auto_698778 ) ( not ( = ?auto_698774 ?auto_698775 ) ) ( not ( = ?auto_698774 ?auto_698776 ) ) ( not ( = ?auto_698774 ?auto_698777 ) ) ( not ( = ?auto_698774 ?auto_698778 ) ) ( not ( = ?auto_698774 ?auto_698779 ) ) ( not ( = ?auto_698774 ?auto_698780 ) ) ( not ( = ?auto_698774 ?auto_698781 ) ) ( not ( = ?auto_698774 ?auto_698782 ) ) ( not ( = ?auto_698774 ?auto_698783 ) ) ( not ( = ?auto_698774 ?auto_698784 ) ) ( not ( = ?auto_698774 ?auto_698785 ) ) ( not ( = ?auto_698774 ?auto_698786 ) ) ( not ( = ?auto_698774 ?auto_698787 ) ) ( not ( = ?auto_698774 ?auto_698788 ) ) ( not ( = ?auto_698775 ?auto_698776 ) ) ( not ( = ?auto_698775 ?auto_698777 ) ) ( not ( = ?auto_698775 ?auto_698778 ) ) ( not ( = ?auto_698775 ?auto_698779 ) ) ( not ( = ?auto_698775 ?auto_698780 ) ) ( not ( = ?auto_698775 ?auto_698781 ) ) ( not ( = ?auto_698775 ?auto_698782 ) ) ( not ( = ?auto_698775 ?auto_698783 ) ) ( not ( = ?auto_698775 ?auto_698784 ) ) ( not ( = ?auto_698775 ?auto_698785 ) ) ( not ( = ?auto_698775 ?auto_698786 ) ) ( not ( = ?auto_698775 ?auto_698787 ) ) ( not ( = ?auto_698775 ?auto_698788 ) ) ( not ( = ?auto_698776 ?auto_698777 ) ) ( not ( = ?auto_698776 ?auto_698778 ) ) ( not ( = ?auto_698776 ?auto_698779 ) ) ( not ( = ?auto_698776 ?auto_698780 ) ) ( not ( = ?auto_698776 ?auto_698781 ) ) ( not ( = ?auto_698776 ?auto_698782 ) ) ( not ( = ?auto_698776 ?auto_698783 ) ) ( not ( = ?auto_698776 ?auto_698784 ) ) ( not ( = ?auto_698776 ?auto_698785 ) ) ( not ( = ?auto_698776 ?auto_698786 ) ) ( not ( = ?auto_698776 ?auto_698787 ) ) ( not ( = ?auto_698776 ?auto_698788 ) ) ( not ( = ?auto_698777 ?auto_698778 ) ) ( not ( = ?auto_698777 ?auto_698779 ) ) ( not ( = ?auto_698777 ?auto_698780 ) ) ( not ( = ?auto_698777 ?auto_698781 ) ) ( not ( = ?auto_698777 ?auto_698782 ) ) ( not ( = ?auto_698777 ?auto_698783 ) ) ( not ( = ?auto_698777 ?auto_698784 ) ) ( not ( = ?auto_698777 ?auto_698785 ) ) ( not ( = ?auto_698777 ?auto_698786 ) ) ( not ( = ?auto_698777 ?auto_698787 ) ) ( not ( = ?auto_698777 ?auto_698788 ) ) ( not ( = ?auto_698778 ?auto_698779 ) ) ( not ( = ?auto_698778 ?auto_698780 ) ) ( not ( = ?auto_698778 ?auto_698781 ) ) ( not ( = ?auto_698778 ?auto_698782 ) ) ( not ( = ?auto_698778 ?auto_698783 ) ) ( not ( = ?auto_698778 ?auto_698784 ) ) ( not ( = ?auto_698778 ?auto_698785 ) ) ( not ( = ?auto_698778 ?auto_698786 ) ) ( not ( = ?auto_698778 ?auto_698787 ) ) ( not ( = ?auto_698778 ?auto_698788 ) ) ( not ( = ?auto_698779 ?auto_698780 ) ) ( not ( = ?auto_698779 ?auto_698781 ) ) ( not ( = ?auto_698779 ?auto_698782 ) ) ( not ( = ?auto_698779 ?auto_698783 ) ) ( not ( = ?auto_698779 ?auto_698784 ) ) ( not ( = ?auto_698779 ?auto_698785 ) ) ( not ( = ?auto_698779 ?auto_698786 ) ) ( not ( = ?auto_698779 ?auto_698787 ) ) ( not ( = ?auto_698779 ?auto_698788 ) ) ( not ( = ?auto_698780 ?auto_698781 ) ) ( not ( = ?auto_698780 ?auto_698782 ) ) ( not ( = ?auto_698780 ?auto_698783 ) ) ( not ( = ?auto_698780 ?auto_698784 ) ) ( not ( = ?auto_698780 ?auto_698785 ) ) ( not ( = ?auto_698780 ?auto_698786 ) ) ( not ( = ?auto_698780 ?auto_698787 ) ) ( not ( = ?auto_698780 ?auto_698788 ) ) ( not ( = ?auto_698781 ?auto_698782 ) ) ( not ( = ?auto_698781 ?auto_698783 ) ) ( not ( = ?auto_698781 ?auto_698784 ) ) ( not ( = ?auto_698781 ?auto_698785 ) ) ( not ( = ?auto_698781 ?auto_698786 ) ) ( not ( = ?auto_698781 ?auto_698787 ) ) ( not ( = ?auto_698781 ?auto_698788 ) ) ( not ( = ?auto_698782 ?auto_698783 ) ) ( not ( = ?auto_698782 ?auto_698784 ) ) ( not ( = ?auto_698782 ?auto_698785 ) ) ( not ( = ?auto_698782 ?auto_698786 ) ) ( not ( = ?auto_698782 ?auto_698787 ) ) ( not ( = ?auto_698782 ?auto_698788 ) ) ( not ( = ?auto_698783 ?auto_698784 ) ) ( not ( = ?auto_698783 ?auto_698785 ) ) ( not ( = ?auto_698783 ?auto_698786 ) ) ( not ( = ?auto_698783 ?auto_698787 ) ) ( not ( = ?auto_698783 ?auto_698788 ) ) ( not ( = ?auto_698784 ?auto_698785 ) ) ( not ( = ?auto_698784 ?auto_698786 ) ) ( not ( = ?auto_698784 ?auto_698787 ) ) ( not ( = ?auto_698784 ?auto_698788 ) ) ( not ( = ?auto_698785 ?auto_698786 ) ) ( not ( = ?auto_698785 ?auto_698787 ) ) ( not ( = ?auto_698785 ?auto_698788 ) ) ( not ( = ?auto_698786 ?auto_698787 ) ) ( not ( = ?auto_698786 ?auto_698788 ) ) ( not ( = ?auto_698787 ?auto_698788 ) ) ( ON ?auto_698786 ?auto_698787 ) ( ON ?auto_698785 ?auto_698786 ) ( ON ?auto_698784 ?auto_698785 ) ( ON ?auto_698783 ?auto_698784 ) ( ON ?auto_698782 ?auto_698783 ) ( ON ?auto_698781 ?auto_698782 ) ( CLEAR ?auto_698779 ) ( ON ?auto_698780 ?auto_698781 ) ( CLEAR ?auto_698780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_698774 ?auto_698775 ?auto_698776 ?auto_698777 ?auto_698778 ?auto_698779 ?auto_698780 )
      ( MAKE-14PILE ?auto_698774 ?auto_698775 ?auto_698776 ?auto_698777 ?auto_698778 ?auto_698779 ?auto_698780 ?auto_698781 ?auto_698782 ?auto_698783 ?auto_698784 ?auto_698785 ?auto_698786 ?auto_698787 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_698832 - BLOCK
      ?auto_698833 - BLOCK
      ?auto_698834 - BLOCK
      ?auto_698835 - BLOCK
      ?auto_698836 - BLOCK
      ?auto_698837 - BLOCK
      ?auto_698838 - BLOCK
      ?auto_698839 - BLOCK
      ?auto_698840 - BLOCK
      ?auto_698841 - BLOCK
      ?auto_698842 - BLOCK
      ?auto_698843 - BLOCK
      ?auto_698844 - BLOCK
      ?auto_698845 - BLOCK
    )
    :vars
    (
      ?auto_698846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698845 ?auto_698846 ) ( ON-TABLE ?auto_698832 ) ( ON ?auto_698833 ?auto_698832 ) ( ON ?auto_698834 ?auto_698833 ) ( ON ?auto_698835 ?auto_698834 ) ( ON ?auto_698836 ?auto_698835 ) ( not ( = ?auto_698832 ?auto_698833 ) ) ( not ( = ?auto_698832 ?auto_698834 ) ) ( not ( = ?auto_698832 ?auto_698835 ) ) ( not ( = ?auto_698832 ?auto_698836 ) ) ( not ( = ?auto_698832 ?auto_698837 ) ) ( not ( = ?auto_698832 ?auto_698838 ) ) ( not ( = ?auto_698832 ?auto_698839 ) ) ( not ( = ?auto_698832 ?auto_698840 ) ) ( not ( = ?auto_698832 ?auto_698841 ) ) ( not ( = ?auto_698832 ?auto_698842 ) ) ( not ( = ?auto_698832 ?auto_698843 ) ) ( not ( = ?auto_698832 ?auto_698844 ) ) ( not ( = ?auto_698832 ?auto_698845 ) ) ( not ( = ?auto_698832 ?auto_698846 ) ) ( not ( = ?auto_698833 ?auto_698834 ) ) ( not ( = ?auto_698833 ?auto_698835 ) ) ( not ( = ?auto_698833 ?auto_698836 ) ) ( not ( = ?auto_698833 ?auto_698837 ) ) ( not ( = ?auto_698833 ?auto_698838 ) ) ( not ( = ?auto_698833 ?auto_698839 ) ) ( not ( = ?auto_698833 ?auto_698840 ) ) ( not ( = ?auto_698833 ?auto_698841 ) ) ( not ( = ?auto_698833 ?auto_698842 ) ) ( not ( = ?auto_698833 ?auto_698843 ) ) ( not ( = ?auto_698833 ?auto_698844 ) ) ( not ( = ?auto_698833 ?auto_698845 ) ) ( not ( = ?auto_698833 ?auto_698846 ) ) ( not ( = ?auto_698834 ?auto_698835 ) ) ( not ( = ?auto_698834 ?auto_698836 ) ) ( not ( = ?auto_698834 ?auto_698837 ) ) ( not ( = ?auto_698834 ?auto_698838 ) ) ( not ( = ?auto_698834 ?auto_698839 ) ) ( not ( = ?auto_698834 ?auto_698840 ) ) ( not ( = ?auto_698834 ?auto_698841 ) ) ( not ( = ?auto_698834 ?auto_698842 ) ) ( not ( = ?auto_698834 ?auto_698843 ) ) ( not ( = ?auto_698834 ?auto_698844 ) ) ( not ( = ?auto_698834 ?auto_698845 ) ) ( not ( = ?auto_698834 ?auto_698846 ) ) ( not ( = ?auto_698835 ?auto_698836 ) ) ( not ( = ?auto_698835 ?auto_698837 ) ) ( not ( = ?auto_698835 ?auto_698838 ) ) ( not ( = ?auto_698835 ?auto_698839 ) ) ( not ( = ?auto_698835 ?auto_698840 ) ) ( not ( = ?auto_698835 ?auto_698841 ) ) ( not ( = ?auto_698835 ?auto_698842 ) ) ( not ( = ?auto_698835 ?auto_698843 ) ) ( not ( = ?auto_698835 ?auto_698844 ) ) ( not ( = ?auto_698835 ?auto_698845 ) ) ( not ( = ?auto_698835 ?auto_698846 ) ) ( not ( = ?auto_698836 ?auto_698837 ) ) ( not ( = ?auto_698836 ?auto_698838 ) ) ( not ( = ?auto_698836 ?auto_698839 ) ) ( not ( = ?auto_698836 ?auto_698840 ) ) ( not ( = ?auto_698836 ?auto_698841 ) ) ( not ( = ?auto_698836 ?auto_698842 ) ) ( not ( = ?auto_698836 ?auto_698843 ) ) ( not ( = ?auto_698836 ?auto_698844 ) ) ( not ( = ?auto_698836 ?auto_698845 ) ) ( not ( = ?auto_698836 ?auto_698846 ) ) ( not ( = ?auto_698837 ?auto_698838 ) ) ( not ( = ?auto_698837 ?auto_698839 ) ) ( not ( = ?auto_698837 ?auto_698840 ) ) ( not ( = ?auto_698837 ?auto_698841 ) ) ( not ( = ?auto_698837 ?auto_698842 ) ) ( not ( = ?auto_698837 ?auto_698843 ) ) ( not ( = ?auto_698837 ?auto_698844 ) ) ( not ( = ?auto_698837 ?auto_698845 ) ) ( not ( = ?auto_698837 ?auto_698846 ) ) ( not ( = ?auto_698838 ?auto_698839 ) ) ( not ( = ?auto_698838 ?auto_698840 ) ) ( not ( = ?auto_698838 ?auto_698841 ) ) ( not ( = ?auto_698838 ?auto_698842 ) ) ( not ( = ?auto_698838 ?auto_698843 ) ) ( not ( = ?auto_698838 ?auto_698844 ) ) ( not ( = ?auto_698838 ?auto_698845 ) ) ( not ( = ?auto_698838 ?auto_698846 ) ) ( not ( = ?auto_698839 ?auto_698840 ) ) ( not ( = ?auto_698839 ?auto_698841 ) ) ( not ( = ?auto_698839 ?auto_698842 ) ) ( not ( = ?auto_698839 ?auto_698843 ) ) ( not ( = ?auto_698839 ?auto_698844 ) ) ( not ( = ?auto_698839 ?auto_698845 ) ) ( not ( = ?auto_698839 ?auto_698846 ) ) ( not ( = ?auto_698840 ?auto_698841 ) ) ( not ( = ?auto_698840 ?auto_698842 ) ) ( not ( = ?auto_698840 ?auto_698843 ) ) ( not ( = ?auto_698840 ?auto_698844 ) ) ( not ( = ?auto_698840 ?auto_698845 ) ) ( not ( = ?auto_698840 ?auto_698846 ) ) ( not ( = ?auto_698841 ?auto_698842 ) ) ( not ( = ?auto_698841 ?auto_698843 ) ) ( not ( = ?auto_698841 ?auto_698844 ) ) ( not ( = ?auto_698841 ?auto_698845 ) ) ( not ( = ?auto_698841 ?auto_698846 ) ) ( not ( = ?auto_698842 ?auto_698843 ) ) ( not ( = ?auto_698842 ?auto_698844 ) ) ( not ( = ?auto_698842 ?auto_698845 ) ) ( not ( = ?auto_698842 ?auto_698846 ) ) ( not ( = ?auto_698843 ?auto_698844 ) ) ( not ( = ?auto_698843 ?auto_698845 ) ) ( not ( = ?auto_698843 ?auto_698846 ) ) ( not ( = ?auto_698844 ?auto_698845 ) ) ( not ( = ?auto_698844 ?auto_698846 ) ) ( not ( = ?auto_698845 ?auto_698846 ) ) ( ON ?auto_698844 ?auto_698845 ) ( ON ?auto_698843 ?auto_698844 ) ( ON ?auto_698842 ?auto_698843 ) ( ON ?auto_698841 ?auto_698842 ) ( ON ?auto_698840 ?auto_698841 ) ( ON ?auto_698839 ?auto_698840 ) ( ON ?auto_698838 ?auto_698839 ) ( CLEAR ?auto_698836 ) ( ON ?auto_698837 ?auto_698838 ) ( CLEAR ?auto_698837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_698832 ?auto_698833 ?auto_698834 ?auto_698835 ?auto_698836 ?auto_698837 )
      ( MAKE-14PILE ?auto_698832 ?auto_698833 ?auto_698834 ?auto_698835 ?auto_698836 ?auto_698837 ?auto_698838 ?auto_698839 ?auto_698840 ?auto_698841 ?auto_698842 ?auto_698843 ?auto_698844 ?auto_698845 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_698890 - BLOCK
      ?auto_698891 - BLOCK
      ?auto_698892 - BLOCK
      ?auto_698893 - BLOCK
      ?auto_698894 - BLOCK
      ?auto_698895 - BLOCK
      ?auto_698896 - BLOCK
      ?auto_698897 - BLOCK
      ?auto_698898 - BLOCK
      ?auto_698899 - BLOCK
      ?auto_698900 - BLOCK
      ?auto_698901 - BLOCK
      ?auto_698902 - BLOCK
      ?auto_698903 - BLOCK
    )
    :vars
    (
      ?auto_698904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698903 ?auto_698904 ) ( ON-TABLE ?auto_698890 ) ( ON ?auto_698891 ?auto_698890 ) ( ON ?auto_698892 ?auto_698891 ) ( ON ?auto_698893 ?auto_698892 ) ( not ( = ?auto_698890 ?auto_698891 ) ) ( not ( = ?auto_698890 ?auto_698892 ) ) ( not ( = ?auto_698890 ?auto_698893 ) ) ( not ( = ?auto_698890 ?auto_698894 ) ) ( not ( = ?auto_698890 ?auto_698895 ) ) ( not ( = ?auto_698890 ?auto_698896 ) ) ( not ( = ?auto_698890 ?auto_698897 ) ) ( not ( = ?auto_698890 ?auto_698898 ) ) ( not ( = ?auto_698890 ?auto_698899 ) ) ( not ( = ?auto_698890 ?auto_698900 ) ) ( not ( = ?auto_698890 ?auto_698901 ) ) ( not ( = ?auto_698890 ?auto_698902 ) ) ( not ( = ?auto_698890 ?auto_698903 ) ) ( not ( = ?auto_698890 ?auto_698904 ) ) ( not ( = ?auto_698891 ?auto_698892 ) ) ( not ( = ?auto_698891 ?auto_698893 ) ) ( not ( = ?auto_698891 ?auto_698894 ) ) ( not ( = ?auto_698891 ?auto_698895 ) ) ( not ( = ?auto_698891 ?auto_698896 ) ) ( not ( = ?auto_698891 ?auto_698897 ) ) ( not ( = ?auto_698891 ?auto_698898 ) ) ( not ( = ?auto_698891 ?auto_698899 ) ) ( not ( = ?auto_698891 ?auto_698900 ) ) ( not ( = ?auto_698891 ?auto_698901 ) ) ( not ( = ?auto_698891 ?auto_698902 ) ) ( not ( = ?auto_698891 ?auto_698903 ) ) ( not ( = ?auto_698891 ?auto_698904 ) ) ( not ( = ?auto_698892 ?auto_698893 ) ) ( not ( = ?auto_698892 ?auto_698894 ) ) ( not ( = ?auto_698892 ?auto_698895 ) ) ( not ( = ?auto_698892 ?auto_698896 ) ) ( not ( = ?auto_698892 ?auto_698897 ) ) ( not ( = ?auto_698892 ?auto_698898 ) ) ( not ( = ?auto_698892 ?auto_698899 ) ) ( not ( = ?auto_698892 ?auto_698900 ) ) ( not ( = ?auto_698892 ?auto_698901 ) ) ( not ( = ?auto_698892 ?auto_698902 ) ) ( not ( = ?auto_698892 ?auto_698903 ) ) ( not ( = ?auto_698892 ?auto_698904 ) ) ( not ( = ?auto_698893 ?auto_698894 ) ) ( not ( = ?auto_698893 ?auto_698895 ) ) ( not ( = ?auto_698893 ?auto_698896 ) ) ( not ( = ?auto_698893 ?auto_698897 ) ) ( not ( = ?auto_698893 ?auto_698898 ) ) ( not ( = ?auto_698893 ?auto_698899 ) ) ( not ( = ?auto_698893 ?auto_698900 ) ) ( not ( = ?auto_698893 ?auto_698901 ) ) ( not ( = ?auto_698893 ?auto_698902 ) ) ( not ( = ?auto_698893 ?auto_698903 ) ) ( not ( = ?auto_698893 ?auto_698904 ) ) ( not ( = ?auto_698894 ?auto_698895 ) ) ( not ( = ?auto_698894 ?auto_698896 ) ) ( not ( = ?auto_698894 ?auto_698897 ) ) ( not ( = ?auto_698894 ?auto_698898 ) ) ( not ( = ?auto_698894 ?auto_698899 ) ) ( not ( = ?auto_698894 ?auto_698900 ) ) ( not ( = ?auto_698894 ?auto_698901 ) ) ( not ( = ?auto_698894 ?auto_698902 ) ) ( not ( = ?auto_698894 ?auto_698903 ) ) ( not ( = ?auto_698894 ?auto_698904 ) ) ( not ( = ?auto_698895 ?auto_698896 ) ) ( not ( = ?auto_698895 ?auto_698897 ) ) ( not ( = ?auto_698895 ?auto_698898 ) ) ( not ( = ?auto_698895 ?auto_698899 ) ) ( not ( = ?auto_698895 ?auto_698900 ) ) ( not ( = ?auto_698895 ?auto_698901 ) ) ( not ( = ?auto_698895 ?auto_698902 ) ) ( not ( = ?auto_698895 ?auto_698903 ) ) ( not ( = ?auto_698895 ?auto_698904 ) ) ( not ( = ?auto_698896 ?auto_698897 ) ) ( not ( = ?auto_698896 ?auto_698898 ) ) ( not ( = ?auto_698896 ?auto_698899 ) ) ( not ( = ?auto_698896 ?auto_698900 ) ) ( not ( = ?auto_698896 ?auto_698901 ) ) ( not ( = ?auto_698896 ?auto_698902 ) ) ( not ( = ?auto_698896 ?auto_698903 ) ) ( not ( = ?auto_698896 ?auto_698904 ) ) ( not ( = ?auto_698897 ?auto_698898 ) ) ( not ( = ?auto_698897 ?auto_698899 ) ) ( not ( = ?auto_698897 ?auto_698900 ) ) ( not ( = ?auto_698897 ?auto_698901 ) ) ( not ( = ?auto_698897 ?auto_698902 ) ) ( not ( = ?auto_698897 ?auto_698903 ) ) ( not ( = ?auto_698897 ?auto_698904 ) ) ( not ( = ?auto_698898 ?auto_698899 ) ) ( not ( = ?auto_698898 ?auto_698900 ) ) ( not ( = ?auto_698898 ?auto_698901 ) ) ( not ( = ?auto_698898 ?auto_698902 ) ) ( not ( = ?auto_698898 ?auto_698903 ) ) ( not ( = ?auto_698898 ?auto_698904 ) ) ( not ( = ?auto_698899 ?auto_698900 ) ) ( not ( = ?auto_698899 ?auto_698901 ) ) ( not ( = ?auto_698899 ?auto_698902 ) ) ( not ( = ?auto_698899 ?auto_698903 ) ) ( not ( = ?auto_698899 ?auto_698904 ) ) ( not ( = ?auto_698900 ?auto_698901 ) ) ( not ( = ?auto_698900 ?auto_698902 ) ) ( not ( = ?auto_698900 ?auto_698903 ) ) ( not ( = ?auto_698900 ?auto_698904 ) ) ( not ( = ?auto_698901 ?auto_698902 ) ) ( not ( = ?auto_698901 ?auto_698903 ) ) ( not ( = ?auto_698901 ?auto_698904 ) ) ( not ( = ?auto_698902 ?auto_698903 ) ) ( not ( = ?auto_698902 ?auto_698904 ) ) ( not ( = ?auto_698903 ?auto_698904 ) ) ( ON ?auto_698902 ?auto_698903 ) ( ON ?auto_698901 ?auto_698902 ) ( ON ?auto_698900 ?auto_698901 ) ( ON ?auto_698899 ?auto_698900 ) ( ON ?auto_698898 ?auto_698899 ) ( ON ?auto_698897 ?auto_698898 ) ( ON ?auto_698896 ?auto_698897 ) ( ON ?auto_698895 ?auto_698896 ) ( CLEAR ?auto_698893 ) ( ON ?auto_698894 ?auto_698895 ) ( CLEAR ?auto_698894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_698890 ?auto_698891 ?auto_698892 ?auto_698893 ?auto_698894 )
      ( MAKE-14PILE ?auto_698890 ?auto_698891 ?auto_698892 ?auto_698893 ?auto_698894 ?auto_698895 ?auto_698896 ?auto_698897 ?auto_698898 ?auto_698899 ?auto_698900 ?auto_698901 ?auto_698902 ?auto_698903 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_698948 - BLOCK
      ?auto_698949 - BLOCK
      ?auto_698950 - BLOCK
      ?auto_698951 - BLOCK
      ?auto_698952 - BLOCK
      ?auto_698953 - BLOCK
      ?auto_698954 - BLOCK
      ?auto_698955 - BLOCK
      ?auto_698956 - BLOCK
      ?auto_698957 - BLOCK
      ?auto_698958 - BLOCK
      ?auto_698959 - BLOCK
      ?auto_698960 - BLOCK
      ?auto_698961 - BLOCK
    )
    :vars
    (
      ?auto_698962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_698961 ?auto_698962 ) ( ON-TABLE ?auto_698948 ) ( ON ?auto_698949 ?auto_698948 ) ( ON ?auto_698950 ?auto_698949 ) ( not ( = ?auto_698948 ?auto_698949 ) ) ( not ( = ?auto_698948 ?auto_698950 ) ) ( not ( = ?auto_698948 ?auto_698951 ) ) ( not ( = ?auto_698948 ?auto_698952 ) ) ( not ( = ?auto_698948 ?auto_698953 ) ) ( not ( = ?auto_698948 ?auto_698954 ) ) ( not ( = ?auto_698948 ?auto_698955 ) ) ( not ( = ?auto_698948 ?auto_698956 ) ) ( not ( = ?auto_698948 ?auto_698957 ) ) ( not ( = ?auto_698948 ?auto_698958 ) ) ( not ( = ?auto_698948 ?auto_698959 ) ) ( not ( = ?auto_698948 ?auto_698960 ) ) ( not ( = ?auto_698948 ?auto_698961 ) ) ( not ( = ?auto_698948 ?auto_698962 ) ) ( not ( = ?auto_698949 ?auto_698950 ) ) ( not ( = ?auto_698949 ?auto_698951 ) ) ( not ( = ?auto_698949 ?auto_698952 ) ) ( not ( = ?auto_698949 ?auto_698953 ) ) ( not ( = ?auto_698949 ?auto_698954 ) ) ( not ( = ?auto_698949 ?auto_698955 ) ) ( not ( = ?auto_698949 ?auto_698956 ) ) ( not ( = ?auto_698949 ?auto_698957 ) ) ( not ( = ?auto_698949 ?auto_698958 ) ) ( not ( = ?auto_698949 ?auto_698959 ) ) ( not ( = ?auto_698949 ?auto_698960 ) ) ( not ( = ?auto_698949 ?auto_698961 ) ) ( not ( = ?auto_698949 ?auto_698962 ) ) ( not ( = ?auto_698950 ?auto_698951 ) ) ( not ( = ?auto_698950 ?auto_698952 ) ) ( not ( = ?auto_698950 ?auto_698953 ) ) ( not ( = ?auto_698950 ?auto_698954 ) ) ( not ( = ?auto_698950 ?auto_698955 ) ) ( not ( = ?auto_698950 ?auto_698956 ) ) ( not ( = ?auto_698950 ?auto_698957 ) ) ( not ( = ?auto_698950 ?auto_698958 ) ) ( not ( = ?auto_698950 ?auto_698959 ) ) ( not ( = ?auto_698950 ?auto_698960 ) ) ( not ( = ?auto_698950 ?auto_698961 ) ) ( not ( = ?auto_698950 ?auto_698962 ) ) ( not ( = ?auto_698951 ?auto_698952 ) ) ( not ( = ?auto_698951 ?auto_698953 ) ) ( not ( = ?auto_698951 ?auto_698954 ) ) ( not ( = ?auto_698951 ?auto_698955 ) ) ( not ( = ?auto_698951 ?auto_698956 ) ) ( not ( = ?auto_698951 ?auto_698957 ) ) ( not ( = ?auto_698951 ?auto_698958 ) ) ( not ( = ?auto_698951 ?auto_698959 ) ) ( not ( = ?auto_698951 ?auto_698960 ) ) ( not ( = ?auto_698951 ?auto_698961 ) ) ( not ( = ?auto_698951 ?auto_698962 ) ) ( not ( = ?auto_698952 ?auto_698953 ) ) ( not ( = ?auto_698952 ?auto_698954 ) ) ( not ( = ?auto_698952 ?auto_698955 ) ) ( not ( = ?auto_698952 ?auto_698956 ) ) ( not ( = ?auto_698952 ?auto_698957 ) ) ( not ( = ?auto_698952 ?auto_698958 ) ) ( not ( = ?auto_698952 ?auto_698959 ) ) ( not ( = ?auto_698952 ?auto_698960 ) ) ( not ( = ?auto_698952 ?auto_698961 ) ) ( not ( = ?auto_698952 ?auto_698962 ) ) ( not ( = ?auto_698953 ?auto_698954 ) ) ( not ( = ?auto_698953 ?auto_698955 ) ) ( not ( = ?auto_698953 ?auto_698956 ) ) ( not ( = ?auto_698953 ?auto_698957 ) ) ( not ( = ?auto_698953 ?auto_698958 ) ) ( not ( = ?auto_698953 ?auto_698959 ) ) ( not ( = ?auto_698953 ?auto_698960 ) ) ( not ( = ?auto_698953 ?auto_698961 ) ) ( not ( = ?auto_698953 ?auto_698962 ) ) ( not ( = ?auto_698954 ?auto_698955 ) ) ( not ( = ?auto_698954 ?auto_698956 ) ) ( not ( = ?auto_698954 ?auto_698957 ) ) ( not ( = ?auto_698954 ?auto_698958 ) ) ( not ( = ?auto_698954 ?auto_698959 ) ) ( not ( = ?auto_698954 ?auto_698960 ) ) ( not ( = ?auto_698954 ?auto_698961 ) ) ( not ( = ?auto_698954 ?auto_698962 ) ) ( not ( = ?auto_698955 ?auto_698956 ) ) ( not ( = ?auto_698955 ?auto_698957 ) ) ( not ( = ?auto_698955 ?auto_698958 ) ) ( not ( = ?auto_698955 ?auto_698959 ) ) ( not ( = ?auto_698955 ?auto_698960 ) ) ( not ( = ?auto_698955 ?auto_698961 ) ) ( not ( = ?auto_698955 ?auto_698962 ) ) ( not ( = ?auto_698956 ?auto_698957 ) ) ( not ( = ?auto_698956 ?auto_698958 ) ) ( not ( = ?auto_698956 ?auto_698959 ) ) ( not ( = ?auto_698956 ?auto_698960 ) ) ( not ( = ?auto_698956 ?auto_698961 ) ) ( not ( = ?auto_698956 ?auto_698962 ) ) ( not ( = ?auto_698957 ?auto_698958 ) ) ( not ( = ?auto_698957 ?auto_698959 ) ) ( not ( = ?auto_698957 ?auto_698960 ) ) ( not ( = ?auto_698957 ?auto_698961 ) ) ( not ( = ?auto_698957 ?auto_698962 ) ) ( not ( = ?auto_698958 ?auto_698959 ) ) ( not ( = ?auto_698958 ?auto_698960 ) ) ( not ( = ?auto_698958 ?auto_698961 ) ) ( not ( = ?auto_698958 ?auto_698962 ) ) ( not ( = ?auto_698959 ?auto_698960 ) ) ( not ( = ?auto_698959 ?auto_698961 ) ) ( not ( = ?auto_698959 ?auto_698962 ) ) ( not ( = ?auto_698960 ?auto_698961 ) ) ( not ( = ?auto_698960 ?auto_698962 ) ) ( not ( = ?auto_698961 ?auto_698962 ) ) ( ON ?auto_698960 ?auto_698961 ) ( ON ?auto_698959 ?auto_698960 ) ( ON ?auto_698958 ?auto_698959 ) ( ON ?auto_698957 ?auto_698958 ) ( ON ?auto_698956 ?auto_698957 ) ( ON ?auto_698955 ?auto_698956 ) ( ON ?auto_698954 ?auto_698955 ) ( ON ?auto_698953 ?auto_698954 ) ( ON ?auto_698952 ?auto_698953 ) ( CLEAR ?auto_698950 ) ( ON ?auto_698951 ?auto_698952 ) ( CLEAR ?auto_698951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_698948 ?auto_698949 ?auto_698950 ?auto_698951 )
      ( MAKE-14PILE ?auto_698948 ?auto_698949 ?auto_698950 ?auto_698951 ?auto_698952 ?auto_698953 ?auto_698954 ?auto_698955 ?auto_698956 ?auto_698957 ?auto_698958 ?auto_698959 ?auto_698960 ?auto_698961 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_699006 - BLOCK
      ?auto_699007 - BLOCK
      ?auto_699008 - BLOCK
      ?auto_699009 - BLOCK
      ?auto_699010 - BLOCK
      ?auto_699011 - BLOCK
      ?auto_699012 - BLOCK
      ?auto_699013 - BLOCK
      ?auto_699014 - BLOCK
      ?auto_699015 - BLOCK
      ?auto_699016 - BLOCK
      ?auto_699017 - BLOCK
      ?auto_699018 - BLOCK
      ?auto_699019 - BLOCK
    )
    :vars
    (
      ?auto_699020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699019 ?auto_699020 ) ( ON-TABLE ?auto_699006 ) ( ON ?auto_699007 ?auto_699006 ) ( not ( = ?auto_699006 ?auto_699007 ) ) ( not ( = ?auto_699006 ?auto_699008 ) ) ( not ( = ?auto_699006 ?auto_699009 ) ) ( not ( = ?auto_699006 ?auto_699010 ) ) ( not ( = ?auto_699006 ?auto_699011 ) ) ( not ( = ?auto_699006 ?auto_699012 ) ) ( not ( = ?auto_699006 ?auto_699013 ) ) ( not ( = ?auto_699006 ?auto_699014 ) ) ( not ( = ?auto_699006 ?auto_699015 ) ) ( not ( = ?auto_699006 ?auto_699016 ) ) ( not ( = ?auto_699006 ?auto_699017 ) ) ( not ( = ?auto_699006 ?auto_699018 ) ) ( not ( = ?auto_699006 ?auto_699019 ) ) ( not ( = ?auto_699006 ?auto_699020 ) ) ( not ( = ?auto_699007 ?auto_699008 ) ) ( not ( = ?auto_699007 ?auto_699009 ) ) ( not ( = ?auto_699007 ?auto_699010 ) ) ( not ( = ?auto_699007 ?auto_699011 ) ) ( not ( = ?auto_699007 ?auto_699012 ) ) ( not ( = ?auto_699007 ?auto_699013 ) ) ( not ( = ?auto_699007 ?auto_699014 ) ) ( not ( = ?auto_699007 ?auto_699015 ) ) ( not ( = ?auto_699007 ?auto_699016 ) ) ( not ( = ?auto_699007 ?auto_699017 ) ) ( not ( = ?auto_699007 ?auto_699018 ) ) ( not ( = ?auto_699007 ?auto_699019 ) ) ( not ( = ?auto_699007 ?auto_699020 ) ) ( not ( = ?auto_699008 ?auto_699009 ) ) ( not ( = ?auto_699008 ?auto_699010 ) ) ( not ( = ?auto_699008 ?auto_699011 ) ) ( not ( = ?auto_699008 ?auto_699012 ) ) ( not ( = ?auto_699008 ?auto_699013 ) ) ( not ( = ?auto_699008 ?auto_699014 ) ) ( not ( = ?auto_699008 ?auto_699015 ) ) ( not ( = ?auto_699008 ?auto_699016 ) ) ( not ( = ?auto_699008 ?auto_699017 ) ) ( not ( = ?auto_699008 ?auto_699018 ) ) ( not ( = ?auto_699008 ?auto_699019 ) ) ( not ( = ?auto_699008 ?auto_699020 ) ) ( not ( = ?auto_699009 ?auto_699010 ) ) ( not ( = ?auto_699009 ?auto_699011 ) ) ( not ( = ?auto_699009 ?auto_699012 ) ) ( not ( = ?auto_699009 ?auto_699013 ) ) ( not ( = ?auto_699009 ?auto_699014 ) ) ( not ( = ?auto_699009 ?auto_699015 ) ) ( not ( = ?auto_699009 ?auto_699016 ) ) ( not ( = ?auto_699009 ?auto_699017 ) ) ( not ( = ?auto_699009 ?auto_699018 ) ) ( not ( = ?auto_699009 ?auto_699019 ) ) ( not ( = ?auto_699009 ?auto_699020 ) ) ( not ( = ?auto_699010 ?auto_699011 ) ) ( not ( = ?auto_699010 ?auto_699012 ) ) ( not ( = ?auto_699010 ?auto_699013 ) ) ( not ( = ?auto_699010 ?auto_699014 ) ) ( not ( = ?auto_699010 ?auto_699015 ) ) ( not ( = ?auto_699010 ?auto_699016 ) ) ( not ( = ?auto_699010 ?auto_699017 ) ) ( not ( = ?auto_699010 ?auto_699018 ) ) ( not ( = ?auto_699010 ?auto_699019 ) ) ( not ( = ?auto_699010 ?auto_699020 ) ) ( not ( = ?auto_699011 ?auto_699012 ) ) ( not ( = ?auto_699011 ?auto_699013 ) ) ( not ( = ?auto_699011 ?auto_699014 ) ) ( not ( = ?auto_699011 ?auto_699015 ) ) ( not ( = ?auto_699011 ?auto_699016 ) ) ( not ( = ?auto_699011 ?auto_699017 ) ) ( not ( = ?auto_699011 ?auto_699018 ) ) ( not ( = ?auto_699011 ?auto_699019 ) ) ( not ( = ?auto_699011 ?auto_699020 ) ) ( not ( = ?auto_699012 ?auto_699013 ) ) ( not ( = ?auto_699012 ?auto_699014 ) ) ( not ( = ?auto_699012 ?auto_699015 ) ) ( not ( = ?auto_699012 ?auto_699016 ) ) ( not ( = ?auto_699012 ?auto_699017 ) ) ( not ( = ?auto_699012 ?auto_699018 ) ) ( not ( = ?auto_699012 ?auto_699019 ) ) ( not ( = ?auto_699012 ?auto_699020 ) ) ( not ( = ?auto_699013 ?auto_699014 ) ) ( not ( = ?auto_699013 ?auto_699015 ) ) ( not ( = ?auto_699013 ?auto_699016 ) ) ( not ( = ?auto_699013 ?auto_699017 ) ) ( not ( = ?auto_699013 ?auto_699018 ) ) ( not ( = ?auto_699013 ?auto_699019 ) ) ( not ( = ?auto_699013 ?auto_699020 ) ) ( not ( = ?auto_699014 ?auto_699015 ) ) ( not ( = ?auto_699014 ?auto_699016 ) ) ( not ( = ?auto_699014 ?auto_699017 ) ) ( not ( = ?auto_699014 ?auto_699018 ) ) ( not ( = ?auto_699014 ?auto_699019 ) ) ( not ( = ?auto_699014 ?auto_699020 ) ) ( not ( = ?auto_699015 ?auto_699016 ) ) ( not ( = ?auto_699015 ?auto_699017 ) ) ( not ( = ?auto_699015 ?auto_699018 ) ) ( not ( = ?auto_699015 ?auto_699019 ) ) ( not ( = ?auto_699015 ?auto_699020 ) ) ( not ( = ?auto_699016 ?auto_699017 ) ) ( not ( = ?auto_699016 ?auto_699018 ) ) ( not ( = ?auto_699016 ?auto_699019 ) ) ( not ( = ?auto_699016 ?auto_699020 ) ) ( not ( = ?auto_699017 ?auto_699018 ) ) ( not ( = ?auto_699017 ?auto_699019 ) ) ( not ( = ?auto_699017 ?auto_699020 ) ) ( not ( = ?auto_699018 ?auto_699019 ) ) ( not ( = ?auto_699018 ?auto_699020 ) ) ( not ( = ?auto_699019 ?auto_699020 ) ) ( ON ?auto_699018 ?auto_699019 ) ( ON ?auto_699017 ?auto_699018 ) ( ON ?auto_699016 ?auto_699017 ) ( ON ?auto_699015 ?auto_699016 ) ( ON ?auto_699014 ?auto_699015 ) ( ON ?auto_699013 ?auto_699014 ) ( ON ?auto_699012 ?auto_699013 ) ( ON ?auto_699011 ?auto_699012 ) ( ON ?auto_699010 ?auto_699011 ) ( ON ?auto_699009 ?auto_699010 ) ( CLEAR ?auto_699007 ) ( ON ?auto_699008 ?auto_699009 ) ( CLEAR ?auto_699008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_699006 ?auto_699007 ?auto_699008 )
      ( MAKE-14PILE ?auto_699006 ?auto_699007 ?auto_699008 ?auto_699009 ?auto_699010 ?auto_699011 ?auto_699012 ?auto_699013 ?auto_699014 ?auto_699015 ?auto_699016 ?auto_699017 ?auto_699018 ?auto_699019 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_699064 - BLOCK
      ?auto_699065 - BLOCK
      ?auto_699066 - BLOCK
      ?auto_699067 - BLOCK
      ?auto_699068 - BLOCK
      ?auto_699069 - BLOCK
      ?auto_699070 - BLOCK
      ?auto_699071 - BLOCK
      ?auto_699072 - BLOCK
      ?auto_699073 - BLOCK
      ?auto_699074 - BLOCK
      ?auto_699075 - BLOCK
      ?auto_699076 - BLOCK
      ?auto_699077 - BLOCK
    )
    :vars
    (
      ?auto_699078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699077 ?auto_699078 ) ( ON-TABLE ?auto_699064 ) ( not ( = ?auto_699064 ?auto_699065 ) ) ( not ( = ?auto_699064 ?auto_699066 ) ) ( not ( = ?auto_699064 ?auto_699067 ) ) ( not ( = ?auto_699064 ?auto_699068 ) ) ( not ( = ?auto_699064 ?auto_699069 ) ) ( not ( = ?auto_699064 ?auto_699070 ) ) ( not ( = ?auto_699064 ?auto_699071 ) ) ( not ( = ?auto_699064 ?auto_699072 ) ) ( not ( = ?auto_699064 ?auto_699073 ) ) ( not ( = ?auto_699064 ?auto_699074 ) ) ( not ( = ?auto_699064 ?auto_699075 ) ) ( not ( = ?auto_699064 ?auto_699076 ) ) ( not ( = ?auto_699064 ?auto_699077 ) ) ( not ( = ?auto_699064 ?auto_699078 ) ) ( not ( = ?auto_699065 ?auto_699066 ) ) ( not ( = ?auto_699065 ?auto_699067 ) ) ( not ( = ?auto_699065 ?auto_699068 ) ) ( not ( = ?auto_699065 ?auto_699069 ) ) ( not ( = ?auto_699065 ?auto_699070 ) ) ( not ( = ?auto_699065 ?auto_699071 ) ) ( not ( = ?auto_699065 ?auto_699072 ) ) ( not ( = ?auto_699065 ?auto_699073 ) ) ( not ( = ?auto_699065 ?auto_699074 ) ) ( not ( = ?auto_699065 ?auto_699075 ) ) ( not ( = ?auto_699065 ?auto_699076 ) ) ( not ( = ?auto_699065 ?auto_699077 ) ) ( not ( = ?auto_699065 ?auto_699078 ) ) ( not ( = ?auto_699066 ?auto_699067 ) ) ( not ( = ?auto_699066 ?auto_699068 ) ) ( not ( = ?auto_699066 ?auto_699069 ) ) ( not ( = ?auto_699066 ?auto_699070 ) ) ( not ( = ?auto_699066 ?auto_699071 ) ) ( not ( = ?auto_699066 ?auto_699072 ) ) ( not ( = ?auto_699066 ?auto_699073 ) ) ( not ( = ?auto_699066 ?auto_699074 ) ) ( not ( = ?auto_699066 ?auto_699075 ) ) ( not ( = ?auto_699066 ?auto_699076 ) ) ( not ( = ?auto_699066 ?auto_699077 ) ) ( not ( = ?auto_699066 ?auto_699078 ) ) ( not ( = ?auto_699067 ?auto_699068 ) ) ( not ( = ?auto_699067 ?auto_699069 ) ) ( not ( = ?auto_699067 ?auto_699070 ) ) ( not ( = ?auto_699067 ?auto_699071 ) ) ( not ( = ?auto_699067 ?auto_699072 ) ) ( not ( = ?auto_699067 ?auto_699073 ) ) ( not ( = ?auto_699067 ?auto_699074 ) ) ( not ( = ?auto_699067 ?auto_699075 ) ) ( not ( = ?auto_699067 ?auto_699076 ) ) ( not ( = ?auto_699067 ?auto_699077 ) ) ( not ( = ?auto_699067 ?auto_699078 ) ) ( not ( = ?auto_699068 ?auto_699069 ) ) ( not ( = ?auto_699068 ?auto_699070 ) ) ( not ( = ?auto_699068 ?auto_699071 ) ) ( not ( = ?auto_699068 ?auto_699072 ) ) ( not ( = ?auto_699068 ?auto_699073 ) ) ( not ( = ?auto_699068 ?auto_699074 ) ) ( not ( = ?auto_699068 ?auto_699075 ) ) ( not ( = ?auto_699068 ?auto_699076 ) ) ( not ( = ?auto_699068 ?auto_699077 ) ) ( not ( = ?auto_699068 ?auto_699078 ) ) ( not ( = ?auto_699069 ?auto_699070 ) ) ( not ( = ?auto_699069 ?auto_699071 ) ) ( not ( = ?auto_699069 ?auto_699072 ) ) ( not ( = ?auto_699069 ?auto_699073 ) ) ( not ( = ?auto_699069 ?auto_699074 ) ) ( not ( = ?auto_699069 ?auto_699075 ) ) ( not ( = ?auto_699069 ?auto_699076 ) ) ( not ( = ?auto_699069 ?auto_699077 ) ) ( not ( = ?auto_699069 ?auto_699078 ) ) ( not ( = ?auto_699070 ?auto_699071 ) ) ( not ( = ?auto_699070 ?auto_699072 ) ) ( not ( = ?auto_699070 ?auto_699073 ) ) ( not ( = ?auto_699070 ?auto_699074 ) ) ( not ( = ?auto_699070 ?auto_699075 ) ) ( not ( = ?auto_699070 ?auto_699076 ) ) ( not ( = ?auto_699070 ?auto_699077 ) ) ( not ( = ?auto_699070 ?auto_699078 ) ) ( not ( = ?auto_699071 ?auto_699072 ) ) ( not ( = ?auto_699071 ?auto_699073 ) ) ( not ( = ?auto_699071 ?auto_699074 ) ) ( not ( = ?auto_699071 ?auto_699075 ) ) ( not ( = ?auto_699071 ?auto_699076 ) ) ( not ( = ?auto_699071 ?auto_699077 ) ) ( not ( = ?auto_699071 ?auto_699078 ) ) ( not ( = ?auto_699072 ?auto_699073 ) ) ( not ( = ?auto_699072 ?auto_699074 ) ) ( not ( = ?auto_699072 ?auto_699075 ) ) ( not ( = ?auto_699072 ?auto_699076 ) ) ( not ( = ?auto_699072 ?auto_699077 ) ) ( not ( = ?auto_699072 ?auto_699078 ) ) ( not ( = ?auto_699073 ?auto_699074 ) ) ( not ( = ?auto_699073 ?auto_699075 ) ) ( not ( = ?auto_699073 ?auto_699076 ) ) ( not ( = ?auto_699073 ?auto_699077 ) ) ( not ( = ?auto_699073 ?auto_699078 ) ) ( not ( = ?auto_699074 ?auto_699075 ) ) ( not ( = ?auto_699074 ?auto_699076 ) ) ( not ( = ?auto_699074 ?auto_699077 ) ) ( not ( = ?auto_699074 ?auto_699078 ) ) ( not ( = ?auto_699075 ?auto_699076 ) ) ( not ( = ?auto_699075 ?auto_699077 ) ) ( not ( = ?auto_699075 ?auto_699078 ) ) ( not ( = ?auto_699076 ?auto_699077 ) ) ( not ( = ?auto_699076 ?auto_699078 ) ) ( not ( = ?auto_699077 ?auto_699078 ) ) ( ON ?auto_699076 ?auto_699077 ) ( ON ?auto_699075 ?auto_699076 ) ( ON ?auto_699074 ?auto_699075 ) ( ON ?auto_699073 ?auto_699074 ) ( ON ?auto_699072 ?auto_699073 ) ( ON ?auto_699071 ?auto_699072 ) ( ON ?auto_699070 ?auto_699071 ) ( ON ?auto_699069 ?auto_699070 ) ( ON ?auto_699068 ?auto_699069 ) ( ON ?auto_699067 ?auto_699068 ) ( ON ?auto_699066 ?auto_699067 ) ( CLEAR ?auto_699064 ) ( ON ?auto_699065 ?auto_699066 ) ( CLEAR ?auto_699065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_699064 ?auto_699065 )
      ( MAKE-14PILE ?auto_699064 ?auto_699065 ?auto_699066 ?auto_699067 ?auto_699068 ?auto_699069 ?auto_699070 ?auto_699071 ?auto_699072 ?auto_699073 ?auto_699074 ?auto_699075 ?auto_699076 ?auto_699077 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_699122 - BLOCK
      ?auto_699123 - BLOCK
      ?auto_699124 - BLOCK
      ?auto_699125 - BLOCK
      ?auto_699126 - BLOCK
      ?auto_699127 - BLOCK
      ?auto_699128 - BLOCK
      ?auto_699129 - BLOCK
      ?auto_699130 - BLOCK
      ?auto_699131 - BLOCK
      ?auto_699132 - BLOCK
      ?auto_699133 - BLOCK
      ?auto_699134 - BLOCK
      ?auto_699135 - BLOCK
    )
    :vars
    (
      ?auto_699136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699135 ?auto_699136 ) ( not ( = ?auto_699122 ?auto_699123 ) ) ( not ( = ?auto_699122 ?auto_699124 ) ) ( not ( = ?auto_699122 ?auto_699125 ) ) ( not ( = ?auto_699122 ?auto_699126 ) ) ( not ( = ?auto_699122 ?auto_699127 ) ) ( not ( = ?auto_699122 ?auto_699128 ) ) ( not ( = ?auto_699122 ?auto_699129 ) ) ( not ( = ?auto_699122 ?auto_699130 ) ) ( not ( = ?auto_699122 ?auto_699131 ) ) ( not ( = ?auto_699122 ?auto_699132 ) ) ( not ( = ?auto_699122 ?auto_699133 ) ) ( not ( = ?auto_699122 ?auto_699134 ) ) ( not ( = ?auto_699122 ?auto_699135 ) ) ( not ( = ?auto_699122 ?auto_699136 ) ) ( not ( = ?auto_699123 ?auto_699124 ) ) ( not ( = ?auto_699123 ?auto_699125 ) ) ( not ( = ?auto_699123 ?auto_699126 ) ) ( not ( = ?auto_699123 ?auto_699127 ) ) ( not ( = ?auto_699123 ?auto_699128 ) ) ( not ( = ?auto_699123 ?auto_699129 ) ) ( not ( = ?auto_699123 ?auto_699130 ) ) ( not ( = ?auto_699123 ?auto_699131 ) ) ( not ( = ?auto_699123 ?auto_699132 ) ) ( not ( = ?auto_699123 ?auto_699133 ) ) ( not ( = ?auto_699123 ?auto_699134 ) ) ( not ( = ?auto_699123 ?auto_699135 ) ) ( not ( = ?auto_699123 ?auto_699136 ) ) ( not ( = ?auto_699124 ?auto_699125 ) ) ( not ( = ?auto_699124 ?auto_699126 ) ) ( not ( = ?auto_699124 ?auto_699127 ) ) ( not ( = ?auto_699124 ?auto_699128 ) ) ( not ( = ?auto_699124 ?auto_699129 ) ) ( not ( = ?auto_699124 ?auto_699130 ) ) ( not ( = ?auto_699124 ?auto_699131 ) ) ( not ( = ?auto_699124 ?auto_699132 ) ) ( not ( = ?auto_699124 ?auto_699133 ) ) ( not ( = ?auto_699124 ?auto_699134 ) ) ( not ( = ?auto_699124 ?auto_699135 ) ) ( not ( = ?auto_699124 ?auto_699136 ) ) ( not ( = ?auto_699125 ?auto_699126 ) ) ( not ( = ?auto_699125 ?auto_699127 ) ) ( not ( = ?auto_699125 ?auto_699128 ) ) ( not ( = ?auto_699125 ?auto_699129 ) ) ( not ( = ?auto_699125 ?auto_699130 ) ) ( not ( = ?auto_699125 ?auto_699131 ) ) ( not ( = ?auto_699125 ?auto_699132 ) ) ( not ( = ?auto_699125 ?auto_699133 ) ) ( not ( = ?auto_699125 ?auto_699134 ) ) ( not ( = ?auto_699125 ?auto_699135 ) ) ( not ( = ?auto_699125 ?auto_699136 ) ) ( not ( = ?auto_699126 ?auto_699127 ) ) ( not ( = ?auto_699126 ?auto_699128 ) ) ( not ( = ?auto_699126 ?auto_699129 ) ) ( not ( = ?auto_699126 ?auto_699130 ) ) ( not ( = ?auto_699126 ?auto_699131 ) ) ( not ( = ?auto_699126 ?auto_699132 ) ) ( not ( = ?auto_699126 ?auto_699133 ) ) ( not ( = ?auto_699126 ?auto_699134 ) ) ( not ( = ?auto_699126 ?auto_699135 ) ) ( not ( = ?auto_699126 ?auto_699136 ) ) ( not ( = ?auto_699127 ?auto_699128 ) ) ( not ( = ?auto_699127 ?auto_699129 ) ) ( not ( = ?auto_699127 ?auto_699130 ) ) ( not ( = ?auto_699127 ?auto_699131 ) ) ( not ( = ?auto_699127 ?auto_699132 ) ) ( not ( = ?auto_699127 ?auto_699133 ) ) ( not ( = ?auto_699127 ?auto_699134 ) ) ( not ( = ?auto_699127 ?auto_699135 ) ) ( not ( = ?auto_699127 ?auto_699136 ) ) ( not ( = ?auto_699128 ?auto_699129 ) ) ( not ( = ?auto_699128 ?auto_699130 ) ) ( not ( = ?auto_699128 ?auto_699131 ) ) ( not ( = ?auto_699128 ?auto_699132 ) ) ( not ( = ?auto_699128 ?auto_699133 ) ) ( not ( = ?auto_699128 ?auto_699134 ) ) ( not ( = ?auto_699128 ?auto_699135 ) ) ( not ( = ?auto_699128 ?auto_699136 ) ) ( not ( = ?auto_699129 ?auto_699130 ) ) ( not ( = ?auto_699129 ?auto_699131 ) ) ( not ( = ?auto_699129 ?auto_699132 ) ) ( not ( = ?auto_699129 ?auto_699133 ) ) ( not ( = ?auto_699129 ?auto_699134 ) ) ( not ( = ?auto_699129 ?auto_699135 ) ) ( not ( = ?auto_699129 ?auto_699136 ) ) ( not ( = ?auto_699130 ?auto_699131 ) ) ( not ( = ?auto_699130 ?auto_699132 ) ) ( not ( = ?auto_699130 ?auto_699133 ) ) ( not ( = ?auto_699130 ?auto_699134 ) ) ( not ( = ?auto_699130 ?auto_699135 ) ) ( not ( = ?auto_699130 ?auto_699136 ) ) ( not ( = ?auto_699131 ?auto_699132 ) ) ( not ( = ?auto_699131 ?auto_699133 ) ) ( not ( = ?auto_699131 ?auto_699134 ) ) ( not ( = ?auto_699131 ?auto_699135 ) ) ( not ( = ?auto_699131 ?auto_699136 ) ) ( not ( = ?auto_699132 ?auto_699133 ) ) ( not ( = ?auto_699132 ?auto_699134 ) ) ( not ( = ?auto_699132 ?auto_699135 ) ) ( not ( = ?auto_699132 ?auto_699136 ) ) ( not ( = ?auto_699133 ?auto_699134 ) ) ( not ( = ?auto_699133 ?auto_699135 ) ) ( not ( = ?auto_699133 ?auto_699136 ) ) ( not ( = ?auto_699134 ?auto_699135 ) ) ( not ( = ?auto_699134 ?auto_699136 ) ) ( not ( = ?auto_699135 ?auto_699136 ) ) ( ON ?auto_699134 ?auto_699135 ) ( ON ?auto_699133 ?auto_699134 ) ( ON ?auto_699132 ?auto_699133 ) ( ON ?auto_699131 ?auto_699132 ) ( ON ?auto_699130 ?auto_699131 ) ( ON ?auto_699129 ?auto_699130 ) ( ON ?auto_699128 ?auto_699129 ) ( ON ?auto_699127 ?auto_699128 ) ( ON ?auto_699126 ?auto_699127 ) ( ON ?auto_699125 ?auto_699126 ) ( ON ?auto_699124 ?auto_699125 ) ( ON ?auto_699123 ?auto_699124 ) ( ON ?auto_699122 ?auto_699123 ) ( CLEAR ?auto_699122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_699122 )
      ( MAKE-14PILE ?auto_699122 ?auto_699123 ?auto_699124 ?auto_699125 ?auto_699126 ?auto_699127 ?auto_699128 ?auto_699129 ?auto_699130 ?auto_699131 ?auto_699132 ?auto_699133 ?auto_699134 ?auto_699135 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699181 - BLOCK
      ?auto_699182 - BLOCK
      ?auto_699183 - BLOCK
      ?auto_699184 - BLOCK
      ?auto_699185 - BLOCK
      ?auto_699186 - BLOCK
      ?auto_699187 - BLOCK
      ?auto_699188 - BLOCK
      ?auto_699189 - BLOCK
      ?auto_699190 - BLOCK
      ?auto_699191 - BLOCK
      ?auto_699192 - BLOCK
      ?auto_699193 - BLOCK
      ?auto_699194 - BLOCK
      ?auto_699195 - BLOCK
    )
    :vars
    (
      ?auto_699196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_699194 ) ( ON ?auto_699195 ?auto_699196 ) ( CLEAR ?auto_699195 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_699181 ) ( ON ?auto_699182 ?auto_699181 ) ( ON ?auto_699183 ?auto_699182 ) ( ON ?auto_699184 ?auto_699183 ) ( ON ?auto_699185 ?auto_699184 ) ( ON ?auto_699186 ?auto_699185 ) ( ON ?auto_699187 ?auto_699186 ) ( ON ?auto_699188 ?auto_699187 ) ( ON ?auto_699189 ?auto_699188 ) ( ON ?auto_699190 ?auto_699189 ) ( ON ?auto_699191 ?auto_699190 ) ( ON ?auto_699192 ?auto_699191 ) ( ON ?auto_699193 ?auto_699192 ) ( ON ?auto_699194 ?auto_699193 ) ( not ( = ?auto_699181 ?auto_699182 ) ) ( not ( = ?auto_699181 ?auto_699183 ) ) ( not ( = ?auto_699181 ?auto_699184 ) ) ( not ( = ?auto_699181 ?auto_699185 ) ) ( not ( = ?auto_699181 ?auto_699186 ) ) ( not ( = ?auto_699181 ?auto_699187 ) ) ( not ( = ?auto_699181 ?auto_699188 ) ) ( not ( = ?auto_699181 ?auto_699189 ) ) ( not ( = ?auto_699181 ?auto_699190 ) ) ( not ( = ?auto_699181 ?auto_699191 ) ) ( not ( = ?auto_699181 ?auto_699192 ) ) ( not ( = ?auto_699181 ?auto_699193 ) ) ( not ( = ?auto_699181 ?auto_699194 ) ) ( not ( = ?auto_699181 ?auto_699195 ) ) ( not ( = ?auto_699181 ?auto_699196 ) ) ( not ( = ?auto_699182 ?auto_699183 ) ) ( not ( = ?auto_699182 ?auto_699184 ) ) ( not ( = ?auto_699182 ?auto_699185 ) ) ( not ( = ?auto_699182 ?auto_699186 ) ) ( not ( = ?auto_699182 ?auto_699187 ) ) ( not ( = ?auto_699182 ?auto_699188 ) ) ( not ( = ?auto_699182 ?auto_699189 ) ) ( not ( = ?auto_699182 ?auto_699190 ) ) ( not ( = ?auto_699182 ?auto_699191 ) ) ( not ( = ?auto_699182 ?auto_699192 ) ) ( not ( = ?auto_699182 ?auto_699193 ) ) ( not ( = ?auto_699182 ?auto_699194 ) ) ( not ( = ?auto_699182 ?auto_699195 ) ) ( not ( = ?auto_699182 ?auto_699196 ) ) ( not ( = ?auto_699183 ?auto_699184 ) ) ( not ( = ?auto_699183 ?auto_699185 ) ) ( not ( = ?auto_699183 ?auto_699186 ) ) ( not ( = ?auto_699183 ?auto_699187 ) ) ( not ( = ?auto_699183 ?auto_699188 ) ) ( not ( = ?auto_699183 ?auto_699189 ) ) ( not ( = ?auto_699183 ?auto_699190 ) ) ( not ( = ?auto_699183 ?auto_699191 ) ) ( not ( = ?auto_699183 ?auto_699192 ) ) ( not ( = ?auto_699183 ?auto_699193 ) ) ( not ( = ?auto_699183 ?auto_699194 ) ) ( not ( = ?auto_699183 ?auto_699195 ) ) ( not ( = ?auto_699183 ?auto_699196 ) ) ( not ( = ?auto_699184 ?auto_699185 ) ) ( not ( = ?auto_699184 ?auto_699186 ) ) ( not ( = ?auto_699184 ?auto_699187 ) ) ( not ( = ?auto_699184 ?auto_699188 ) ) ( not ( = ?auto_699184 ?auto_699189 ) ) ( not ( = ?auto_699184 ?auto_699190 ) ) ( not ( = ?auto_699184 ?auto_699191 ) ) ( not ( = ?auto_699184 ?auto_699192 ) ) ( not ( = ?auto_699184 ?auto_699193 ) ) ( not ( = ?auto_699184 ?auto_699194 ) ) ( not ( = ?auto_699184 ?auto_699195 ) ) ( not ( = ?auto_699184 ?auto_699196 ) ) ( not ( = ?auto_699185 ?auto_699186 ) ) ( not ( = ?auto_699185 ?auto_699187 ) ) ( not ( = ?auto_699185 ?auto_699188 ) ) ( not ( = ?auto_699185 ?auto_699189 ) ) ( not ( = ?auto_699185 ?auto_699190 ) ) ( not ( = ?auto_699185 ?auto_699191 ) ) ( not ( = ?auto_699185 ?auto_699192 ) ) ( not ( = ?auto_699185 ?auto_699193 ) ) ( not ( = ?auto_699185 ?auto_699194 ) ) ( not ( = ?auto_699185 ?auto_699195 ) ) ( not ( = ?auto_699185 ?auto_699196 ) ) ( not ( = ?auto_699186 ?auto_699187 ) ) ( not ( = ?auto_699186 ?auto_699188 ) ) ( not ( = ?auto_699186 ?auto_699189 ) ) ( not ( = ?auto_699186 ?auto_699190 ) ) ( not ( = ?auto_699186 ?auto_699191 ) ) ( not ( = ?auto_699186 ?auto_699192 ) ) ( not ( = ?auto_699186 ?auto_699193 ) ) ( not ( = ?auto_699186 ?auto_699194 ) ) ( not ( = ?auto_699186 ?auto_699195 ) ) ( not ( = ?auto_699186 ?auto_699196 ) ) ( not ( = ?auto_699187 ?auto_699188 ) ) ( not ( = ?auto_699187 ?auto_699189 ) ) ( not ( = ?auto_699187 ?auto_699190 ) ) ( not ( = ?auto_699187 ?auto_699191 ) ) ( not ( = ?auto_699187 ?auto_699192 ) ) ( not ( = ?auto_699187 ?auto_699193 ) ) ( not ( = ?auto_699187 ?auto_699194 ) ) ( not ( = ?auto_699187 ?auto_699195 ) ) ( not ( = ?auto_699187 ?auto_699196 ) ) ( not ( = ?auto_699188 ?auto_699189 ) ) ( not ( = ?auto_699188 ?auto_699190 ) ) ( not ( = ?auto_699188 ?auto_699191 ) ) ( not ( = ?auto_699188 ?auto_699192 ) ) ( not ( = ?auto_699188 ?auto_699193 ) ) ( not ( = ?auto_699188 ?auto_699194 ) ) ( not ( = ?auto_699188 ?auto_699195 ) ) ( not ( = ?auto_699188 ?auto_699196 ) ) ( not ( = ?auto_699189 ?auto_699190 ) ) ( not ( = ?auto_699189 ?auto_699191 ) ) ( not ( = ?auto_699189 ?auto_699192 ) ) ( not ( = ?auto_699189 ?auto_699193 ) ) ( not ( = ?auto_699189 ?auto_699194 ) ) ( not ( = ?auto_699189 ?auto_699195 ) ) ( not ( = ?auto_699189 ?auto_699196 ) ) ( not ( = ?auto_699190 ?auto_699191 ) ) ( not ( = ?auto_699190 ?auto_699192 ) ) ( not ( = ?auto_699190 ?auto_699193 ) ) ( not ( = ?auto_699190 ?auto_699194 ) ) ( not ( = ?auto_699190 ?auto_699195 ) ) ( not ( = ?auto_699190 ?auto_699196 ) ) ( not ( = ?auto_699191 ?auto_699192 ) ) ( not ( = ?auto_699191 ?auto_699193 ) ) ( not ( = ?auto_699191 ?auto_699194 ) ) ( not ( = ?auto_699191 ?auto_699195 ) ) ( not ( = ?auto_699191 ?auto_699196 ) ) ( not ( = ?auto_699192 ?auto_699193 ) ) ( not ( = ?auto_699192 ?auto_699194 ) ) ( not ( = ?auto_699192 ?auto_699195 ) ) ( not ( = ?auto_699192 ?auto_699196 ) ) ( not ( = ?auto_699193 ?auto_699194 ) ) ( not ( = ?auto_699193 ?auto_699195 ) ) ( not ( = ?auto_699193 ?auto_699196 ) ) ( not ( = ?auto_699194 ?auto_699195 ) ) ( not ( = ?auto_699194 ?auto_699196 ) ) ( not ( = ?auto_699195 ?auto_699196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_699195 ?auto_699196 )
      ( !STACK ?auto_699195 ?auto_699194 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699243 - BLOCK
      ?auto_699244 - BLOCK
      ?auto_699245 - BLOCK
      ?auto_699246 - BLOCK
      ?auto_699247 - BLOCK
      ?auto_699248 - BLOCK
      ?auto_699249 - BLOCK
      ?auto_699250 - BLOCK
      ?auto_699251 - BLOCK
      ?auto_699252 - BLOCK
      ?auto_699253 - BLOCK
      ?auto_699254 - BLOCK
      ?auto_699255 - BLOCK
      ?auto_699256 - BLOCK
      ?auto_699257 - BLOCK
    )
    :vars
    (
      ?auto_699258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699257 ?auto_699258 ) ( ON-TABLE ?auto_699243 ) ( ON ?auto_699244 ?auto_699243 ) ( ON ?auto_699245 ?auto_699244 ) ( ON ?auto_699246 ?auto_699245 ) ( ON ?auto_699247 ?auto_699246 ) ( ON ?auto_699248 ?auto_699247 ) ( ON ?auto_699249 ?auto_699248 ) ( ON ?auto_699250 ?auto_699249 ) ( ON ?auto_699251 ?auto_699250 ) ( ON ?auto_699252 ?auto_699251 ) ( ON ?auto_699253 ?auto_699252 ) ( ON ?auto_699254 ?auto_699253 ) ( ON ?auto_699255 ?auto_699254 ) ( not ( = ?auto_699243 ?auto_699244 ) ) ( not ( = ?auto_699243 ?auto_699245 ) ) ( not ( = ?auto_699243 ?auto_699246 ) ) ( not ( = ?auto_699243 ?auto_699247 ) ) ( not ( = ?auto_699243 ?auto_699248 ) ) ( not ( = ?auto_699243 ?auto_699249 ) ) ( not ( = ?auto_699243 ?auto_699250 ) ) ( not ( = ?auto_699243 ?auto_699251 ) ) ( not ( = ?auto_699243 ?auto_699252 ) ) ( not ( = ?auto_699243 ?auto_699253 ) ) ( not ( = ?auto_699243 ?auto_699254 ) ) ( not ( = ?auto_699243 ?auto_699255 ) ) ( not ( = ?auto_699243 ?auto_699256 ) ) ( not ( = ?auto_699243 ?auto_699257 ) ) ( not ( = ?auto_699243 ?auto_699258 ) ) ( not ( = ?auto_699244 ?auto_699245 ) ) ( not ( = ?auto_699244 ?auto_699246 ) ) ( not ( = ?auto_699244 ?auto_699247 ) ) ( not ( = ?auto_699244 ?auto_699248 ) ) ( not ( = ?auto_699244 ?auto_699249 ) ) ( not ( = ?auto_699244 ?auto_699250 ) ) ( not ( = ?auto_699244 ?auto_699251 ) ) ( not ( = ?auto_699244 ?auto_699252 ) ) ( not ( = ?auto_699244 ?auto_699253 ) ) ( not ( = ?auto_699244 ?auto_699254 ) ) ( not ( = ?auto_699244 ?auto_699255 ) ) ( not ( = ?auto_699244 ?auto_699256 ) ) ( not ( = ?auto_699244 ?auto_699257 ) ) ( not ( = ?auto_699244 ?auto_699258 ) ) ( not ( = ?auto_699245 ?auto_699246 ) ) ( not ( = ?auto_699245 ?auto_699247 ) ) ( not ( = ?auto_699245 ?auto_699248 ) ) ( not ( = ?auto_699245 ?auto_699249 ) ) ( not ( = ?auto_699245 ?auto_699250 ) ) ( not ( = ?auto_699245 ?auto_699251 ) ) ( not ( = ?auto_699245 ?auto_699252 ) ) ( not ( = ?auto_699245 ?auto_699253 ) ) ( not ( = ?auto_699245 ?auto_699254 ) ) ( not ( = ?auto_699245 ?auto_699255 ) ) ( not ( = ?auto_699245 ?auto_699256 ) ) ( not ( = ?auto_699245 ?auto_699257 ) ) ( not ( = ?auto_699245 ?auto_699258 ) ) ( not ( = ?auto_699246 ?auto_699247 ) ) ( not ( = ?auto_699246 ?auto_699248 ) ) ( not ( = ?auto_699246 ?auto_699249 ) ) ( not ( = ?auto_699246 ?auto_699250 ) ) ( not ( = ?auto_699246 ?auto_699251 ) ) ( not ( = ?auto_699246 ?auto_699252 ) ) ( not ( = ?auto_699246 ?auto_699253 ) ) ( not ( = ?auto_699246 ?auto_699254 ) ) ( not ( = ?auto_699246 ?auto_699255 ) ) ( not ( = ?auto_699246 ?auto_699256 ) ) ( not ( = ?auto_699246 ?auto_699257 ) ) ( not ( = ?auto_699246 ?auto_699258 ) ) ( not ( = ?auto_699247 ?auto_699248 ) ) ( not ( = ?auto_699247 ?auto_699249 ) ) ( not ( = ?auto_699247 ?auto_699250 ) ) ( not ( = ?auto_699247 ?auto_699251 ) ) ( not ( = ?auto_699247 ?auto_699252 ) ) ( not ( = ?auto_699247 ?auto_699253 ) ) ( not ( = ?auto_699247 ?auto_699254 ) ) ( not ( = ?auto_699247 ?auto_699255 ) ) ( not ( = ?auto_699247 ?auto_699256 ) ) ( not ( = ?auto_699247 ?auto_699257 ) ) ( not ( = ?auto_699247 ?auto_699258 ) ) ( not ( = ?auto_699248 ?auto_699249 ) ) ( not ( = ?auto_699248 ?auto_699250 ) ) ( not ( = ?auto_699248 ?auto_699251 ) ) ( not ( = ?auto_699248 ?auto_699252 ) ) ( not ( = ?auto_699248 ?auto_699253 ) ) ( not ( = ?auto_699248 ?auto_699254 ) ) ( not ( = ?auto_699248 ?auto_699255 ) ) ( not ( = ?auto_699248 ?auto_699256 ) ) ( not ( = ?auto_699248 ?auto_699257 ) ) ( not ( = ?auto_699248 ?auto_699258 ) ) ( not ( = ?auto_699249 ?auto_699250 ) ) ( not ( = ?auto_699249 ?auto_699251 ) ) ( not ( = ?auto_699249 ?auto_699252 ) ) ( not ( = ?auto_699249 ?auto_699253 ) ) ( not ( = ?auto_699249 ?auto_699254 ) ) ( not ( = ?auto_699249 ?auto_699255 ) ) ( not ( = ?auto_699249 ?auto_699256 ) ) ( not ( = ?auto_699249 ?auto_699257 ) ) ( not ( = ?auto_699249 ?auto_699258 ) ) ( not ( = ?auto_699250 ?auto_699251 ) ) ( not ( = ?auto_699250 ?auto_699252 ) ) ( not ( = ?auto_699250 ?auto_699253 ) ) ( not ( = ?auto_699250 ?auto_699254 ) ) ( not ( = ?auto_699250 ?auto_699255 ) ) ( not ( = ?auto_699250 ?auto_699256 ) ) ( not ( = ?auto_699250 ?auto_699257 ) ) ( not ( = ?auto_699250 ?auto_699258 ) ) ( not ( = ?auto_699251 ?auto_699252 ) ) ( not ( = ?auto_699251 ?auto_699253 ) ) ( not ( = ?auto_699251 ?auto_699254 ) ) ( not ( = ?auto_699251 ?auto_699255 ) ) ( not ( = ?auto_699251 ?auto_699256 ) ) ( not ( = ?auto_699251 ?auto_699257 ) ) ( not ( = ?auto_699251 ?auto_699258 ) ) ( not ( = ?auto_699252 ?auto_699253 ) ) ( not ( = ?auto_699252 ?auto_699254 ) ) ( not ( = ?auto_699252 ?auto_699255 ) ) ( not ( = ?auto_699252 ?auto_699256 ) ) ( not ( = ?auto_699252 ?auto_699257 ) ) ( not ( = ?auto_699252 ?auto_699258 ) ) ( not ( = ?auto_699253 ?auto_699254 ) ) ( not ( = ?auto_699253 ?auto_699255 ) ) ( not ( = ?auto_699253 ?auto_699256 ) ) ( not ( = ?auto_699253 ?auto_699257 ) ) ( not ( = ?auto_699253 ?auto_699258 ) ) ( not ( = ?auto_699254 ?auto_699255 ) ) ( not ( = ?auto_699254 ?auto_699256 ) ) ( not ( = ?auto_699254 ?auto_699257 ) ) ( not ( = ?auto_699254 ?auto_699258 ) ) ( not ( = ?auto_699255 ?auto_699256 ) ) ( not ( = ?auto_699255 ?auto_699257 ) ) ( not ( = ?auto_699255 ?auto_699258 ) ) ( not ( = ?auto_699256 ?auto_699257 ) ) ( not ( = ?auto_699256 ?auto_699258 ) ) ( not ( = ?auto_699257 ?auto_699258 ) ) ( CLEAR ?auto_699255 ) ( ON ?auto_699256 ?auto_699257 ) ( CLEAR ?auto_699256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_699243 ?auto_699244 ?auto_699245 ?auto_699246 ?auto_699247 ?auto_699248 ?auto_699249 ?auto_699250 ?auto_699251 ?auto_699252 ?auto_699253 ?auto_699254 ?auto_699255 ?auto_699256 )
      ( MAKE-15PILE ?auto_699243 ?auto_699244 ?auto_699245 ?auto_699246 ?auto_699247 ?auto_699248 ?auto_699249 ?auto_699250 ?auto_699251 ?auto_699252 ?auto_699253 ?auto_699254 ?auto_699255 ?auto_699256 ?auto_699257 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699305 - BLOCK
      ?auto_699306 - BLOCK
      ?auto_699307 - BLOCK
      ?auto_699308 - BLOCK
      ?auto_699309 - BLOCK
      ?auto_699310 - BLOCK
      ?auto_699311 - BLOCK
      ?auto_699312 - BLOCK
      ?auto_699313 - BLOCK
      ?auto_699314 - BLOCK
      ?auto_699315 - BLOCK
      ?auto_699316 - BLOCK
      ?auto_699317 - BLOCK
      ?auto_699318 - BLOCK
      ?auto_699319 - BLOCK
    )
    :vars
    (
      ?auto_699320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699319 ?auto_699320 ) ( ON-TABLE ?auto_699305 ) ( ON ?auto_699306 ?auto_699305 ) ( ON ?auto_699307 ?auto_699306 ) ( ON ?auto_699308 ?auto_699307 ) ( ON ?auto_699309 ?auto_699308 ) ( ON ?auto_699310 ?auto_699309 ) ( ON ?auto_699311 ?auto_699310 ) ( ON ?auto_699312 ?auto_699311 ) ( ON ?auto_699313 ?auto_699312 ) ( ON ?auto_699314 ?auto_699313 ) ( ON ?auto_699315 ?auto_699314 ) ( ON ?auto_699316 ?auto_699315 ) ( not ( = ?auto_699305 ?auto_699306 ) ) ( not ( = ?auto_699305 ?auto_699307 ) ) ( not ( = ?auto_699305 ?auto_699308 ) ) ( not ( = ?auto_699305 ?auto_699309 ) ) ( not ( = ?auto_699305 ?auto_699310 ) ) ( not ( = ?auto_699305 ?auto_699311 ) ) ( not ( = ?auto_699305 ?auto_699312 ) ) ( not ( = ?auto_699305 ?auto_699313 ) ) ( not ( = ?auto_699305 ?auto_699314 ) ) ( not ( = ?auto_699305 ?auto_699315 ) ) ( not ( = ?auto_699305 ?auto_699316 ) ) ( not ( = ?auto_699305 ?auto_699317 ) ) ( not ( = ?auto_699305 ?auto_699318 ) ) ( not ( = ?auto_699305 ?auto_699319 ) ) ( not ( = ?auto_699305 ?auto_699320 ) ) ( not ( = ?auto_699306 ?auto_699307 ) ) ( not ( = ?auto_699306 ?auto_699308 ) ) ( not ( = ?auto_699306 ?auto_699309 ) ) ( not ( = ?auto_699306 ?auto_699310 ) ) ( not ( = ?auto_699306 ?auto_699311 ) ) ( not ( = ?auto_699306 ?auto_699312 ) ) ( not ( = ?auto_699306 ?auto_699313 ) ) ( not ( = ?auto_699306 ?auto_699314 ) ) ( not ( = ?auto_699306 ?auto_699315 ) ) ( not ( = ?auto_699306 ?auto_699316 ) ) ( not ( = ?auto_699306 ?auto_699317 ) ) ( not ( = ?auto_699306 ?auto_699318 ) ) ( not ( = ?auto_699306 ?auto_699319 ) ) ( not ( = ?auto_699306 ?auto_699320 ) ) ( not ( = ?auto_699307 ?auto_699308 ) ) ( not ( = ?auto_699307 ?auto_699309 ) ) ( not ( = ?auto_699307 ?auto_699310 ) ) ( not ( = ?auto_699307 ?auto_699311 ) ) ( not ( = ?auto_699307 ?auto_699312 ) ) ( not ( = ?auto_699307 ?auto_699313 ) ) ( not ( = ?auto_699307 ?auto_699314 ) ) ( not ( = ?auto_699307 ?auto_699315 ) ) ( not ( = ?auto_699307 ?auto_699316 ) ) ( not ( = ?auto_699307 ?auto_699317 ) ) ( not ( = ?auto_699307 ?auto_699318 ) ) ( not ( = ?auto_699307 ?auto_699319 ) ) ( not ( = ?auto_699307 ?auto_699320 ) ) ( not ( = ?auto_699308 ?auto_699309 ) ) ( not ( = ?auto_699308 ?auto_699310 ) ) ( not ( = ?auto_699308 ?auto_699311 ) ) ( not ( = ?auto_699308 ?auto_699312 ) ) ( not ( = ?auto_699308 ?auto_699313 ) ) ( not ( = ?auto_699308 ?auto_699314 ) ) ( not ( = ?auto_699308 ?auto_699315 ) ) ( not ( = ?auto_699308 ?auto_699316 ) ) ( not ( = ?auto_699308 ?auto_699317 ) ) ( not ( = ?auto_699308 ?auto_699318 ) ) ( not ( = ?auto_699308 ?auto_699319 ) ) ( not ( = ?auto_699308 ?auto_699320 ) ) ( not ( = ?auto_699309 ?auto_699310 ) ) ( not ( = ?auto_699309 ?auto_699311 ) ) ( not ( = ?auto_699309 ?auto_699312 ) ) ( not ( = ?auto_699309 ?auto_699313 ) ) ( not ( = ?auto_699309 ?auto_699314 ) ) ( not ( = ?auto_699309 ?auto_699315 ) ) ( not ( = ?auto_699309 ?auto_699316 ) ) ( not ( = ?auto_699309 ?auto_699317 ) ) ( not ( = ?auto_699309 ?auto_699318 ) ) ( not ( = ?auto_699309 ?auto_699319 ) ) ( not ( = ?auto_699309 ?auto_699320 ) ) ( not ( = ?auto_699310 ?auto_699311 ) ) ( not ( = ?auto_699310 ?auto_699312 ) ) ( not ( = ?auto_699310 ?auto_699313 ) ) ( not ( = ?auto_699310 ?auto_699314 ) ) ( not ( = ?auto_699310 ?auto_699315 ) ) ( not ( = ?auto_699310 ?auto_699316 ) ) ( not ( = ?auto_699310 ?auto_699317 ) ) ( not ( = ?auto_699310 ?auto_699318 ) ) ( not ( = ?auto_699310 ?auto_699319 ) ) ( not ( = ?auto_699310 ?auto_699320 ) ) ( not ( = ?auto_699311 ?auto_699312 ) ) ( not ( = ?auto_699311 ?auto_699313 ) ) ( not ( = ?auto_699311 ?auto_699314 ) ) ( not ( = ?auto_699311 ?auto_699315 ) ) ( not ( = ?auto_699311 ?auto_699316 ) ) ( not ( = ?auto_699311 ?auto_699317 ) ) ( not ( = ?auto_699311 ?auto_699318 ) ) ( not ( = ?auto_699311 ?auto_699319 ) ) ( not ( = ?auto_699311 ?auto_699320 ) ) ( not ( = ?auto_699312 ?auto_699313 ) ) ( not ( = ?auto_699312 ?auto_699314 ) ) ( not ( = ?auto_699312 ?auto_699315 ) ) ( not ( = ?auto_699312 ?auto_699316 ) ) ( not ( = ?auto_699312 ?auto_699317 ) ) ( not ( = ?auto_699312 ?auto_699318 ) ) ( not ( = ?auto_699312 ?auto_699319 ) ) ( not ( = ?auto_699312 ?auto_699320 ) ) ( not ( = ?auto_699313 ?auto_699314 ) ) ( not ( = ?auto_699313 ?auto_699315 ) ) ( not ( = ?auto_699313 ?auto_699316 ) ) ( not ( = ?auto_699313 ?auto_699317 ) ) ( not ( = ?auto_699313 ?auto_699318 ) ) ( not ( = ?auto_699313 ?auto_699319 ) ) ( not ( = ?auto_699313 ?auto_699320 ) ) ( not ( = ?auto_699314 ?auto_699315 ) ) ( not ( = ?auto_699314 ?auto_699316 ) ) ( not ( = ?auto_699314 ?auto_699317 ) ) ( not ( = ?auto_699314 ?auto_699318 ) ) ( not ( = ?auto_699314 ?auto_699319 ) ) ( not ( = ?auto_699314 ?auto_699320 ) ) ( not ( = ?auto_699315 ?auto_699316 ) ) ( not ( = ?auto_699315 ?auto_699317 ) ) ( not ( = ?auto_699315 ?auto_699318 ) ) ( not ( = ?auto_699315 ?auto_699319 ) ) ( not ( = ?auto_699315 ?auto_699320 ) ) ( not ( = ?auto_699316 ?auto_699317 ) ) ( not ( = ?auto_699316 ?auto_699318 ) ) ( not ( = ?auto_699316 ?auto_699319 ) ) ( not ( = ?auto_699316 ?auto_699320 ) ) ( not ( = ?auto_699317 ?auto_699318 ) ) ( not ( = ?auto_699317 ?auto_699319 ) ) ( not ( = ?auto_699317 ?auto_699320 ) ) ( not ( = ?auto_699318 ?auto_699319 ) ) ( not ( = ?auto_699318 ?auto_699320 ) ) ( not ( = ?auto_699319 ?auto_699320 ) ) ( ON ?auto_699318 ?auto_699319 ) ( CLEAR ?auto_699316 ) ( ON ?auto_699317 ?auto_699318 ) ( CLEAR ?auto_699317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_699305 ?auto_699306 ?auto_699307 ?auto_699308 ?auto_699309 ?auto_699310 ?auto_699311 ?auto_699312 ?auto_699313 ?auto_699314 ?auto_699315 ?auto_699316 ?auto_699317 )
      ( MAKE-15PILE ?auto_699305 ?auto_699306 ?auto_699307 ?auto_699308 ?auto_699309 ?auto_699310 ?auto_699311 ?auto_699312 ?auto_699313 ?auto_699314 ?auto_699315 ?auto_699316 ?auto_699317 ?auto_699318 ?auto_699319 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699367 - BLOCK
      ?auto_699368 - BLOCK
      ?auto_699369 - BLOCK
      ?auto_699370 - BLOCK
      ?auto_699371 - BLOCK
      ?auto_699372 - BLOCK
      ?auto_699373 - BLOCK
      ?auto_699374 - BLOCK
      ?auto_699375 - BLOCK
      ?auto_699376 - BLOCK
      ?auto_699377 - BLOCK
      ?auto_699378 - BLOCK
      ?auto_699379 - BLOCK
      ?auto_699380 - BLOCK
      ?auto_699381 - BLOCK
    )
    :vars
    (
      ?auto_699382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699381 ?auto_699382 ) ( ON-TABLE ?auto_699367 ) ( ON ?auto_699368 ?auto_699367 ) ( ON ?auto_699369 ?auto_699368 ) ( ON ?auto_699370 ?auto_699369 ) ( ON ?auto_699371 ?auto_699370 ) ( ON ?auto_699372 ?auto_699371 ) ( ON ?auto_699373 ?auto_699372 ) ( ON ?auto_699374 ?auto_699373 ) ( ON ?auto_699375 ?auto_699374 ) ( ON ?auto_699376 ?auto_699375 ) ( ON ?auto_699377 ?auto_699376 ) ( not ( = ?auto_699367 ?auto_699368 ) ) ( not ( = ?auto_699367 ?auto_699369 ) ) ( not ( = ?auto_699367 ?auto_699370 ) ) ( not ( = ?auto_699367 ?auto_699371 ) ) ( not ( = ?auto_699367 ?auto_699372 ) ) ( not ( = ?auto_699367 ?auto_699373 ) ) ( not ( = ?auto_699367 ?auto_699374 ) ) ( not ( = ?auto_699367 ?auto_699375 ) ) ( not ( = ?auto_699367 ?auto_699376 ) ) ( not ( = ?auto_699367 ?auto_699377 ) ) ( not ( = ?auto_699367 ?auto_699378 ) ) ( not ( = ?auto_699367 ?auto_699379 ) ) ( not ( = ?auto_699367 ?auto_699380 ) ) ( not ( = ?auto_699367 ?auto_699381 ) ) ( not ( = ?auto_699367 ?auto_699382 ) ) ( not ( = ?auto_699368 ?auto_699369 ) ) ( not ( = ?auto_699368 ?auto_699370 ) ) ( not ( = ?auto_699368 ?auto_699371 ) ) ( not ( = ?auto_699368 ?auto_699372 ) ) ( not ( = ?auto_699368 ?auto_699373 ) ) ( not ( = ?auto_699368 ?auto_699374 ) ) ( not ( = ?auto_699368 ?auto_699375 ) ) ( not ( = ?auto_699368 ?auto_699376 ) ) ( not ( = ?auto_699368 ?auto_699377 ) ) ( not ( = ?auto_699368 ?auto_699378 ) ) ( not ( = ?auto_699368 ?auto_699379 ) ) ( not ( = ?auto_699368 ?auto_699380 ) ) ( not ( = ?auto_699368 ?auto_699381 ) ) ( not ( = ?auto_699368 ?auto_699382 ) ) ( not ( = ?auto_699369 ?auto_699370 ) ) ( not ( = ?auto_699369 ?auto_699371 ) ) ( not ( = ?auto_699369 ?auto_699372 ) ) ( not ( = ?auto_699369 ?auto_699373 ) ) ( not ( = ?auto_699369 ?auto_699374 ) ) ( not ( = ?auto_699369 ?auto_699375 ) ) ( not ( = ?auto_699369 ?auto_699376 ) ) ( not ( = ?auto_699369 ?auto_699377 ) ) ( not ( = ?auto_699369 ?auto_699378 ) ) ( not ( = ?auto_699369 ?auto_699379 ) ) ( not ( = ?auto_699369 ?auto_699380 ) ) ( not ( = ?auto_699369 ?auto_699381 ) ) ( not ( = ?auto_699369 ?auto_699382 ) ) ( not ( = ?auto_699370 ?auto_699371 ) ) ( not ( = ?auto_699370 ?auto_699372 ) ) ( not ( = ?auto_699370 ?auto_699373 ) ) ( not ( = ?auto_699370 ?auto_699374 ) ) ( not ( = ?auto_699370 ?auto_699375 ) ) ( not ( = ?auto_699370 ?auto_699376 ) ) ( not ( = ?auto_699370 ?auto_699377 ) ) ( not ( = ?auto_699370 ?auto_699378 ) ) ( not ( = ?auto_699370 ?auto_699379 ) ) ( not ( = ?auto_699370 ?auto_699380 ) ) ( not ( = ?auto_699370 ?auto_699381 ) ) ( not ( = ?auto_699370 ?auto_699382 ) ) ( not ( = ?auto_699371 ?auto_699372 ) ) ( not ( = ?auto_699371 ?auto_699373 ) ) ( not ( = ?auto_699371 ?auto_699374 ) ) ( not ( = ?auto_699371 ?auto_699375 ) ) ( not ( = ?auto_699371 ?auto_699376 ) ) ( not ( = ?auto_699371 ?auto_699377 ) ) ( not ( = ?auto_699371 ?auto_699378 ) ) ( not ( = ?auto_699371 ?auto_699379 ) ) ( not ( = ?auto_699371 ?auto_699380 ) ) ( not ( = ?auto_699371 ?auto_699381 ) ) ( not ( = ?auto_699371 ?auto_699382 ) ) ( not ( = ?auto_699372 ?auto_699373 ) ) ( not ( = ?auto_699372 ?auto_699374 ) ) ( not ( = ?auto_699372 ?auto_699375 ) ) ( not ( = ?auto_699372 ?auto_699376 ) ) ( not ( = ?auto_699372 ?auto_699377 ) ) ( not ( = ?auto_699372 ?auto_699378 ) ) ( not ( = ?auto_699372 ?auto_699379 ) ) ( not ( = ?auto_699372 ?auto_699380 ) ) ( not ( = ?auto_699372 ?auto_699381 ) ) ( not ( = ?auto_699372 ?auto_699382 ) ) ( not ( = ?auto_699373 ?auto_699374 ) ) ( not ( = ?auto_699373 ?auto_699375 ) ) ( not ( = ?auto_699373 ?auto_699376 ) ) ( not ( = ?auto_699373 ?auto_699377 ) ) ( not ( = ?auto_699373 ?auto_699378 ) ) ( not ( = ?auto_699373 ?auto_699379 ) ) ( not ( = ?auto_699373 ?auto_699380 ) ) ( not ( = ?auto_699373 ?auto_699381 ) ) ( not ( = ?auto_699373 ?auto_699382 ) ) ( not ( = ?auto_699374 ?auto_699375 ) ) ( not ( = ?auto_699374 ?auto_699376 ) ) ( not ( = ?auto_699374 ?auto_699377 ) ) ( not ( = ?auto_699374 ?auto_699378 ) ) ( not ( = ?auto_699374 ?auto_699379 ) ) ( not ( = ?auto_699374 ?auto_699380 ) ) ( not ( = ?auto_699374 ?auto_699381 ) ) ( not ( = ?auto_699374 ?auto_699382 ) ) ( not ( = ?auto_699375 ?auto_699376 ) ) ( not ( = ?auto_699375 ?auto_699377 ) ) ( not ( = ?auto_699375 ?auto_699378 ) ) ( not ( = ?auto_699375 ?auto_699379 ) ) ( not ( = ?auto_699375 ?auto_699380 ) ) ( not ( = ?auto_699375 ?auto_699381 ) ) ( not ( = ?auto_699375 ?auto_699382 ) ) ( not ( = ?auto_699376 ?auto_699377 ) ) ( not ( = ?auto_699376 ?auto_699378 ) ) ( not ( = ?auto_699376 ?auto_699379 ) ) ( not ( = ?auto_699376 ?auto_699380 ) ) ( not ( = ?auto_699376 ?auto_699381 ) ) ( not ( = ?auto_699376 ?auto_699382 ) ) ( not ( = ?auto_699377 ?auto_699378 ) ) ( not ( = ?auto_699377 ?auto_699379 ) ) ( not ( = ?auto_699377 ?auto_699380 ) ) ( not ( = ?auto_699377 ?auto_699381 ) ) ( not ( = ?auto_699377 ?auto_699382 ) ) ( not ( = ?auto_699378 ?auto_699379 ) ) ( not ( = ?auto_699378 ?auto_699380 ) ) ( not ( = ?auto_699378 ?auto_699381 ) ) ( not ( = ?auto_699378 ?auto_699382 ) ) ( not ( = ?auto_699379 ?auto_699380 ) ) ( not ( = ?auto_699379 ?auto_699381 ) ) ( not ( = ?auto_699379 ?auto_699382 ) ) ( not ( = ?auto_699380 ?auto_699381 ) ) ( not ( = ?auto_699380 ?auto_699382 ) ) ( not ( = ?auto_699381 ?auto_699382 ) ) ( ON ?auto_699380 ?auto_699381 ) ( ON ?auto_699379 ?auto_699380 ) ( CLEAR ?auto_699377 ) ( ON ?auto_699378 ?auto_699379 ) ( CLEAR ?auto_699378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_699367 ?auto_699368 ?auto_699369 ?auto_699370 ?auto_699371 ?auto_699372 ?auto_699373 ?auto_699374 ?auto_699375 ?auto_699376 ?auto_699377 ?auto_699378 )
      ( MAKE-15PILE ?auto_699367 ?auto_699368 ?auto_699369 ?auto_699370 ?auto_699371 ?auto_699372 ?auto_699373 ?auto_699374 ?auto_699375 ?auto_699376 ?auto_699377 ?auto_699378 ?auto_699379 ?auto_699380 ?auto_699381 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699429 - BLOCK
      ?auto_699430 - BLOCK
      ?auto_699431 - BLOCK
      ?auto_699432 - BLOCK
      ?auto_699433 - BLOCK
      ?auto_699434 - BLOCK
      ?auto_699435 - BLOCK
      ?auto_699436 - BLOCK
      ?auto_699437 - BLOCK
      ?auto_699438 - BLOCK
      ?auto_699439 - BLOCK
      ?auto_699440 - BLOCK
      ?auto_699441 - BLOCK
      ?auto_699442 - BLOCK
      ?auto_699443 - BLOCK
    )
    :vars
    (
      ?auto_699444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699443 ?auto_699444 ) ( ON-TABLE ?auto_699429 ) ( ON ?auto_699430 ?auto_699429 ) ( ON ?auto_699431 ?auto_699430 ) ( ON ?auto_699432 ?auto_699431 ) ( ON ?auto_699433 ?auto_699432 ) ( ON ?auto_699434 ?auto_699433 ) ( ON ?auto_699435 ?auto_699434 ) ( ON ?auto_699436 ?auto_699435 ) ( ON ?auto_699437 ?auto_699436 ) ( ON ?auto_699438 ?auto_699437 ) ( not ( = ?auto_699429 ?auto_699430 ) ) ( not ( = ?auto_699429 ?auto_699431 ) ) ( not ( = ?auto_699429 ?auto_699432 ) ) ( not ( = ?auto_699429 ?auto_699433 ) ) ( not ( = ?auto_699429 ?auto_699434 ) ) ( not ( = ?auto_699429 ?auto_699435 ) ) ( not ( = ?auto_699429 ?auto_699436 ) ) ( not ( = ?auto_699429 ?auto_699437 ) ) ( not ( = ?auto_699429 ?auto_699438 ) ) ( not ( = ?auto_699429 ?auto_699439 ) ) ( not ( = ?auto_699429 ?auto_699440 ) ) ( not ( = ?auto_699429 ?auto_699441 ) ) ( not ( = ?auto_699429 ?auto_699442 ) ) ( not ( = ?auto_699429 ?auto_699443 ) ) ( not ( = ?auto_699429 ?auto_699444 ) ) ( not ( = ?auto_699430 ?auto_699431 ) ) ( not ( = ?auto_699430 ?auto_699432 ) ) ( not ( = ?auto_699430 ?auto_699433 ) ) ( not ( = ?auto_699430 ?auto_699434 ) ) ( not ( = ?auto_699430 ?auto_699435 ) ) ( not ( = ?auto_699430 ?auto_699436 ) ) ( not ( = ?auto_699430 ?auto_699437 ) ) ( not ( = ?auto_699430 ?auto_699438 ) ) ( not ( = ?auto_699430 ?auto_699439 ) ) ( not ( = ?auto_699430 ?auto_699440 ) ) ( not ( = ?auto_699430 ?auto_699441 ) ) ( not ( = ?auto_699430 ?auto_699442 ) ) ( not ( = ?auto_699430 ?auto_699443 ) ) ( not ( = ?auto_699430 ?auto_699444 ) ) ( not ( = ?auto_699431 ?auto_699432 ) ) ( not ( = ?auto_699431 ?auto_699433 ) ) ( not ( = ?auto_699431 ?auto_699434 ) ) ( not ( = ?auto_699431 ?auto_699435 ) ) ( not ( = ?auto_699431 ?auto_699436 ) ) ( not ( = ?auto_699431 ?auto_699437 ) ) ( not ( = ?auto_699431 ?auto_699438 ) ) ( not ( = ?auto_699431 ?auto_699439 ) ) ( not ( = ?auto_699431 ?auto_699440 ) ) ( not ( = ?auto_699431 ?auto_699441 ) ) ( not ( = ?auto_699431 ?auto_699442 ) ) ( not ( = ?auto_699431 ?auto_699443 ) ) ( not ( = ?auto_699431 ?auto_699444 ) ) ( not ( = ?auto_699432 ?auto_699433 ) ) ( not ( = ?auto_699432 ?auto_699434 ) ) ( not ( = ?auto_699432 ?auto_699435 ) ) ( not ( = ?auto_699432 ?auto_699436 ) ) ( not ( = ?auto_699432 ?auto_699437 ) ) ( not ( = ?auto_699432 ?auto_699438 ) ) ( not ( = ?auto_699432 ?auto_699439 ) ) ( not ( = ?auto_699432 ?auto_699440 ) ) ( not ( = ?auto_699432 ?auto_699441 ) ) ( not ( = ?auto_699432 ?auto_699442 ) ) ( not ( = ?auto_699432 ?auto_699443 ) ) ( not ( = ?auto_699432 ?auto_699444 ) ) ( not ( = ?auto_699433 ?auto_699434 ) ) ( not ( = ?auto_699433 ?auto_699435 ) ) ( not ( = ?auto_699433 ?auto_699436 ) ) ( not ( = ?auto_699433 ?auto_699437 ) ) ( not ( = ?auto_699433 ?auto_699438 ) ) ( not ( = ?auto_699433 ?auto_699439 ) ) ( not ( = ?auto_699433 ?auto_699440 ) ) ( not ( = ?auto_699433 ?auto_699441 ) ) ( not ( = ?auto_699433 ?auto_699442 ) ) ( not ( = ?auto_699433 ?auto_699443 ) ) ( not ( = ?auto_699433 ?auto_699444 ) ) ( not ( = ?auto_699434 ?auto_699435 ) ) ( not ( = ?auto_699434 ?auto_699436 ) ) ( not ( = ?auto_699434 ?auto_699437 ) ) ( not ( = ?auto_699434 ?auto_699438 ) ) ( not ( = ?auto_699434 ?auto_699439 ) ) ( not ( = ?auto_699434 ?auto_699440 ) ) ( not ( = ?auto_699434 ?auto_699441 ) ) ( not ( = ?auto_699434 ?auto_699442 ) ) ( not ( = ?auto_699434 ?auto_699443 ) ) ( not ( = ?auto_699434 ?auto_699444 ) ) ( not ( = ?auto_699435 ?auto_699436 ) ) ( not ( = ?auto_699435 ?auto_699437 ) ) ( not ( = ?auto_699435 ?auto_699438 ) ) ( not ( = ?auto_699435 ?auto_699439 ) ) ( not ( = ?auto_699435 ?auto_699440 ) ) ( not ( = ?auto_699435 ?auto_699441 ) ) ( not ( = ?auto_699435 ?auto_699442 ) ) ( not ( = ?auto_699435 ?auto_699443 ) ) ( not ( = ?auto_699435 ?auto_699444 ) ) ( not ( = ?auto_699436 ?auto_699437 ) ) ( not ( = ?auto_699436 ?auto_699438 ) ) ( not ( = ?auto_699436 ?auto_699439 ) ) ( not ( = ?auto_699436 ?auto_699440 ) ) ( not ( = ?auto_699436 ?auto_699441 ) ) ( not ( = ?auto_699436 ?auto_699442 ) ) ( not ( = ?auto_699436 ?auto_699443 ) ) ( not ( = ?auto_699436 ?auto_699444 ) ) ( not ( = ?auto_699437 ?auto_699438 ) ) ( not ( = ?auto_699437 ?auto_699439 ) ) ( not ( = ?auto_699437 ?auto_699440 ) ) ( not ( = ?auto_699437 ?auto_699441 ) ) ( not ( = ?auto_699437 ?auto_699442 ) ) ( not ( = ?auto_699437 ?auto_699443 ) ) ( not ( = ?auto_699437 ?auto_699444 ) ) ( not ( = ?auto_699438 ?auto_699439 ) ) ( not ( = ?auto_699438 ?auto_699440 ) ) ( not ( = ?auto_699438 ?auto_699441 ) ) ( not ( = ?auto_699438 ?auto_699442 ) ) ( not ( = ?auto_699438 ?auto_699443 ) ) ( not ( = ?auto_699438 ?auto_699444 ) ) ( not ( = ?auto_699439 ?auto_699440 ) ) ( not ( = ?auto_699439 ?auto_699441 ) ) ( not ( = ?auto_699439 ?auto_699442 ) ) ( not ( = ?auto_699439 ?auto_699443 ) ) ( not ( = ?auto_699439 ?auto_699444 ) ) ( not ( = ?auto_699440 ?auto_699441 ) ) ( not ( = ?auto_699440 ?auto_699442 ) ) ( not ( = ?auto_699440 ?auto_699443 ) ) ( not ( = ?auto_699440 ?auto_699444 ) ) ( not ( = ?auto_699441 ?auto_699442 ) ) ( not ( = ?auto_699441 ?auto_699443 ) ) ( not ( = ?auto_699441 ?auto_699444 ) ) ( not ( = ?auto_699442 ?auto_699443 ) ) ( not ( = ?auto_699442 ?auto_699444 ) ) ( not ( = ?auto_699443 ?auto_699444 ) ) ( ON ?auto_699442 ?auto_699443 ) ( ON ?auto_699441 ?auto_699442 ) ( ON ?auto_699440 ?auto_699441 ) ( CLEAR ?auto_699438 ) ( ON ?auto_699439 ?auto_699440 ) ( CLEAR ?auto_699439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_699429 ?auto_699430 ?auto_699431 ?auto_699432 ?auto_699433 ?auto_699434 ?auto_699435 ?auto_699436 ?auto_699437 ?auto_699438 ?auto_699439 )
      ( MAKE-15PILE ?auto_699429 ?auto_699430 ?auto_699431 ?auto_699432 ?auto_699433 ?auto_699434 ?auto_699435 ?auto_699436 ?auto_699437 ?auto_699438 ?auto_699439 ?auto_699440 ?auto_699441 ?auto_699442 ?auto_699443 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699491 - BLOCK
      ?auto_699492 - BLOCK
      ?auto_699493 - BLOCK
      ?auto_699494 - BLOCK
      ?auto_699495 - BLOCK
      ?auto_699496 - BLOCK
      ?auto_699497 - BLOCK
      ?auto_699498 - BLOCK
      ?auto_699499 - BLOCK
      ?auto_699500 - BLOCK
      ?auto_699501 - BLOCK
      ?auto_699502 - BLOCK
      ?auto_699503 - BLOCK
      ?auto_699504 - BLOCK
      ?auto_699505 - BLOCK
    )
    :vars
    (
      ?auto_699506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699505 ?auto_699506 ) ( ON-TABLE ?auto_699491 ) ( ON ?auto_699492 ?auto_699491 ) ( ON ?auto_699493 ?auto_699492 ) ( ON ?auto_699494 ?auto_699493 ) ( ON ?auto_699495 ?auto_699494 ) ( ON ?auto_699496 ?auto_699495 ) ( ON ?auto_699497 ?auto_699496 ) ( ON ?auto_699498 ?auto_699497 ) ( ON ?auto_699499 ?auto_699498 ) ( not ( = ?auto_699491 ?auto_699492 ) ) ( not ( = ?auto_699491 ?auto_699493 ) ) ( not ( = ?auto_699491 ?auto_699494 ) ) ( not ( = ?auto_699491 ?auto_699495 ) ) ( not ( = ?auto_699491 ?auto_699496 ) ) ( not ( = ?auto_699491 ?auto_699497 ) ) ( not ( = ?auto_699491 ?auto_699498 ) ) ( not ( = ?auto_699491 ?auto_699499 ) ) ( not ( = ?auto_699491 ?auto_699500 ) ) ( not ( = ?auto_699491 ?auto_699501 ) ) ( not ( = ?auto_699491 ?auto_699502 ) ) ( not ( = ?auto_699491 ?auto_699503 ) ) ( not ( = ?auto_699491 ?auto_699504 ) ) ( not ( = ?auto_699491 ?auto_699505 ) ) ( not ( = ?auto_699491 ?auto_699506 ) ) ( not ( = ?auto_699492 ?auto_699493 ) ) ( not ( = ?auto_699492 ?auto_699494 ) ) ( not ( = ?auto_699492 ?auto_699495 ) ) ( not ( = ?auto_699492 ?auto_699496 ) ) ( not ( = ?auto_699492 ?auto_699497 ) ) ( not ( = ?auto_699492 ?auto_699498 ) ) ( not ( = ?auto_699492 ?auto_699499 ) ) ( not ( = ?auto_699492 ?auto_699500 ) ) ( not ( = ?auto_699492 ?auto_699501 ) ) ( not ( = ?auto_699492 ?auto_699502 ) ) ( not ( = ?auto_699492 ?auto_699503 ) ) ( not ( = ?auto_699492 ?auto_699504 ) ) ( not ( = ?auto_699492 ?auto_699505 ) ) ( not ( = ?auto_699492 ?auto_699506 ) ) ( not ( = ?auto_699493 ?auto_699494 ) ) ( not ( = ?auto_699493 ?auto_699495 ) ) ( not ( = ?auto_699493 ?auto_699496 ) ) ( not ( = ?auto_699493 ?auto_699497 ) ) ( not ( = ?auto_699493 ?auto_699498 ) ) ( not ( = ?auto_699493 ?auto_699499 ) ) ( not ( = ?auto_699493 ?auto_699500 ) ) ( not ( = ?auto_699493 ?auto_699501 ) ) ( not ( = ?auto_699493 ?auto_699502 ) ) ( not ( = ?auto_699493 ?auto_699503 ) ) ( not ( = ?auto_699493 ?auto_699504 ) ) ( not ( = ?auto_699493 ?auto_699505 ) ) ( not ( = ?auto_699493 ?auto_699506 ) ) ( not ( = ?auto_699494 ?auto_699495 ) ) ( not ( = ?auto_699494 ?auto_699496 ) ) ( not ( = ?auto_699494 ?auto_699497 ) ) ( not ( = ?auto_699494 ?auto_699498 ) ) ( not ( = ?auto_699494 ?auto_699499 ) ) ( not ( = ?auto_699494 ?auto_699500 ) ) ( not ( = ?auto_699494 ?auto_699501 ) ) ( not ( = ?auto_699494 ?auto_699502 ) ) ( not ( = ?auto_699494 ?auto_699503 ) ) ( not ( = ?auto_699494 ?auto_699504 ) ) ( not ( = ?auto_699494 ?auto_699505 ) ) ( not ( = ?auto_699494 ?auto_699506 ) ) ( not ( = ?auto_699495 ?auto_699496 ) ) ( not ( = ?auto_699495 ?auto_699497 ) ) ( not ( = ?auto_699495 ?auto_699498 ) ) ( not ( = ?auto_699495 ?auto_699499 ) ) ( not ( = ?auto_699495 ?auto_699500 ) ) ( not ( = ?auto_699495 ?auto_699501 ) ) ( not ( = ?auto_699495 ?auto_699502 ) ) ( not ( = ?auto_699495 ?auto_699503 ) ) ( not ( = ?auto_699495 ?auto_699504 ) ) ( not ( = ?auto_699495 ?auto_699505 ) ) ( not ( = ?auto_699495 ?auto_699506 ) ) ( not ( = ?auto_699496 ?auto_699497 ) ) ( not ( = ?auto_699496 ?auto_699498 ) ) ( not ( = ?auto_699496 ?auto_699499 ) ) ( not ( = ?auto_699496 ?auto_699500 ) ) ( not ( = ?auto_699496 ?auto_699501 ) ) ( not ( = ?auto_699496 ?auto_699502 ) ) ( not ( = ?auto_699496 ?auto_699503 ) ) ( not ( = ?auto_699496 ?auto_699504 ) ) ( not ( = ?auto_699496 ?auto_699505 ) ) ( not ( = ?auto_699496 ?auto_699506 ) ) ( not ( = ?auto_699497 ?auto_699498 ) ) ( not ( = ?auto_699497 ?auto_699499 ) ) ( not ( = ?auto_699497 ?auto_699500 ) ) ( not ( = ?auto_699497 ?auto_699501 ) ) ( not ( = ?auto_699497 ?auto_699502 ) ) ( not ( = ?auto_699497 ?auto_699503 ) ) ( not ( = ?auto_699497 ?auto_699504 ) ) ( not ( = ?auto_699497 ?auto_699505 ) ) ( not ( = ?auto_699497 ?auto_699506 ) ) ( not ( = ?auto_699498 ?auto_699499 ) ) ( not ( = ?auto_699498 ?auto_699500 ) ) ( not ( = ?auto_699498 ?auto_699501 ) ) ( not ( = ?auto_699498 ?auto_699502 ) ) ( not ( = ?auto_699498 ?auto_699503 ) ) ( not ( = ?auto_699498 ?auto_699504 ) ) ( not ( = ?auto_699498 ?auto_699505 ) ) ( not ( = ?auto_699498 ?auto_699506 ) ) ( not ( = ?auto_699499 ?auto_699500 ) ) ( not ( = ?auto_699499 ?auto_699501 ) ) ( not ( = ?auto_699499 ?auto_699502 ) ) ( not ( = ?auto_699499 ?auto_699503 ) ) ( not ( = ?auto_699499 ?auto_699504 ) ) ( not ( = ?auto_699499 ?auto_699505 ) ) ( not ( = ?auto_699499 ?auto_699506 ) ) ( not ( = ?auto_699500 ?auto_699501 ) ) ( not ( = ?auto_699500 ?auto_699502 ) ) ( not ( = ?auto_699500 ?auto_699503 ) ) ( not ( = ?auto_699500 ?auto_699504 ) ) ( not ( = ?auto_699500 ?auto_699505 ) ) ( not ( = ?auto_699500 ?auto_699506 ) ) ( not ( = ?auto_699501 ?auto_699502 ) ) ( not ( = ?auto_699501 ?auto_699503 ) ) ( not ( = ?auto_699501 ?auto_699504 ) ) ( not ( = ?auto_699501 ?auto_699505 ) ) ( not ( = ?auto_699501 ?auto_699506 ) ) ( not ( = ?auto_699502 ?auto_699503 ) ) ( not ( = ?auto_699502 ?auto_699504 ) ) ( not ( = ?auto_699502 ?auto_699505 ) ) ( not ( = ?auto_699502 ?auto_699506 ) ) ( not ( = ?auto_699503 ?auto_699504 ) ) ( not ( = ?auto_699503 ?auto_699505 ) ) ( not ( = ?auto_699503 ?auto_699506 ) ) ( not ( = ?auto_699504 ?auto_699505 ) ) ( not ( = ?auto_699504 ?auto_699506 ) ) ( not ( = ?auto_699505 ?auto_699506 ) ) ( ON ?auto_699504 ?auto_699505 ) ( ON ?auto_699503 ?auto_699504 ) ( ON ?auto_699502 ?auto_699503 ) ( ON ?auto_699501 ?auto_699502 ) ( CLEAR ?auto_699499 ) ( ON ?auto_699500 ?auto_699501 ) ( CLEAR ?auto_699500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_699491 ?auto_699492 ?auto_699493 ?auto_699494 ?auto_699495 ?auto_699496 ?auto_699497 ?auto_699498 ?auto_699499 ?auto_699500 )
      ( MAKE-15PILE ?auto_699491 ?auto_699492 ?auto_699493 ?auto_699494 ?auto_699495 ?auto_699496 ?auto_699497 ?auto_699498 ?auto_699499 ?auto_699500 ?auto_699501 ?auto_699502 ?auto_699503 ?auto_699504 ?auto_699505 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699553 - BLOCK
      ?auto_699554 - BLOCK
      ?auto_699555 - BLOCK
      ?auto_699556 - BLOCK
      ?auto_699557 - BLOCK
      ?auto_699558 - BLOCK
      ?auto_699559 - BLOCK
      ?auto_699560 - BLOCK
      ?auto_699561 - BLOCK
      ?auto_699562 - BLOCK
      ?auto_699563 - BLOCK
      ?auto_699564 - BLOCK
      ?auto_699565 - BLOCK
      ?auto_699566 - BLOCK
      ?auto_699567 - BLOCK
    )
    :vars
    (
      ?auto_699568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699567 ?auto_699568 ) ( ON-TABLE ?auto_699553 ) ( ON ?auto_699554 ?auto_699553 ) ( ON ?auto_699555 ?auto_699554 ) ( ON ?auto_699556 ?auto_699555 ) ( ON ?auto_699557 ?auto_699556 ) ( ON ?auto_699558 ?auto_699557 ) ( ON ?auto_699559 ?auto_699558 ) ( ON ?auto_699560 ?auto_699559 ) ( not ( = ?auto_699553 ?auto_699554 ) ) ( not ( = ?auto_699553 ?auto_699555 ) ) ( not ( = ?auto_699553 ?auto_699556 ) ) ( not ( = ?auto_699553 ?auto_699557 ) ) ( not ( = ?auto_699553 ?auto_699558 ) ) ( not ( = ?auto_699553 ?auto_699559 ) ) ( not ( = ?auto_699553 ?auto_699560 ) ) ( not ( = ?auto_699553 ?auto_699561 ) ) ( not ( = ?auto_699553 ?auto_699562 ) ) ( not ( = ?auto_699553 ?auto_699563 ) ) ( not ( = ?auto_699553 ?auto_699564 ) ) ( not ( = ?auto_699553 ?auto_699565 ) ) ( not ( = ?auto_699553 ?auto_699566 ) ) ( not ( = ?auto_699553 ?auto_699567 ) ) ( not ( = ?auto_699553 ?auto_699568 ) ) ( not ( = ?auto_699554 ?auto_699555 ) ) ( not ( = ?auto_699554 ?auto_699556 ) ) ( not ( = ?auto_699554 ?auto_699557 ) ) ( not ( = ?auto_699554 ?auto_699558 ) ) ( not ( = ?auto_699554 ?auto_699559 ) ) ( not ( = ?auto_699554 ?auto_699560 ) ) ( not ( = ?auto_699554 ?auto_699561 ) ) ( not ( = ?auto_699554 ?auto_699562 ) ) ( not ( = ?auto_699554 ?auto_699563 ) ) ( not ( = ?auto_699554 ?auto_699564 ) ) ( not ( = ?auto_699554 ?auto_699565 ) ) ( not ( = ?auto_699554 ?auto_699566 ) ) ( not ( = ?auto_699554 ?auto_699567 ) ) ( not ( = ?auto_699554 ?auto_699568 ) ) ( not ( = ?auto_699555 ?auto_699556 ) ) ( not ( = ?auto_699555 ?auto_699557 ) ) ( not ( = ?auto_699555 ?auto_699558 ) ) ( not ( = ?auto_699555 ?auto_699559 ) ) ( not ( = ?auto_699555 ?auto_699560 ) ) ( not ( = ?auto_699555 ?auto_699561 ) ) ( not ( = ?auto_699555 ?auto_699562 ) ) ( not ( = ?auto_699555 ?auto_699563 ) ) ( not ( = ?auto_699555 ?auto_699564 ) ) ( not ( = ?auto_699555 ?auto_699565 ) ) ( not ( = ?auto_699555 ?auto_699566 ) ) ( not ( = ?auto_699555 ?auto_699567 ) ) ( not ( = ?auto_699555 ?auto_699568 ) ) ( not ( = ?auto_699556 ?auto_699557 ) ) ( not ( = ?auto_699556 ?auto_699558 ) ) ( not ( = ?auto_699556 ?auto_699559 ) ) ( not ( = ?auto_699556 ?auto_699560 ) ) ( not ( = ?auto_699556 ?auto_699561 ) ) ( not ( = ?auto_699556 ?auto_699562 ) ) ( not ( = ?auto_699556 ?auto_699563 ) ) ( not ( = ?auto_699556 ?auto_699564 ) ) ( not ( = ?auto_699556 ?auto_699565 ) ) ( not ( = ?auto_699556 ?auto_699566 ) ) ( not ( = ?auto_699556 ?auto_699567 ) ) ( not ( = ?auto_699556 ?auto_699568 ) ) ( not ( = ?auto_699557 ?auto_699558 ) ) ( not ( = ?auto_699557 ?auto_699559 ) ) ( not ( = ?auto_699557 ?auto_699560 ) ) ( not ( = ?auto_699557 ?auto_699561 ) ) ( not ( = ?auto_699557 ?auto_699562 ) ) ( not ( = ?auto_699557 ?auto_699563 ) ) ( not ( = ?auto_699557 ?auto_699564 ) ) ( not ( = ?auto_699557 ?auto_699565 ) ) ( not ( = ?auto_699557 ?auto_699566 ) ) ( not ( = ?auto_699557 ?auto_699567 ) ) ( not ( = ?auto_699557 ?auto_699568 ) ) ( not ( = ?auto_699558 ?auto_699559 ) ) ( not ( = ?auto_699558 ?auto_699560 ) ) ( not ( = ?auto_699558 ?auto_699561 ) ) ( not ( = ?auto_699558 ?auto_699562 ) ) ( not ( = ?auto_699558 ?auto_699563 ) ) ( not ( = ?auto_699558 ?auto_699564 ) ) ( not ( = ?auto_699558 ?auto_699565 ) ) ( not ( = ?auto_699558 ?auto_699566 ) ) ( not ( = ?auto_699558 ?auto_699567 ) ) ( not ( = ?auto_699558 ?auto_699568 ) ) ( not ( = ?auto_699559 ?auto_699560 ) ) ( not ( = ?auto_699559 ?auto_699561 ) ) ( not ( = ?auto_699559 ?auto_699562 ) ) ( not ( = ?auto_699559 ?auto_699563 ) ) ( not ( = ?auto_699559 ?auto_699564 ) ) ( not ( = ?auto_699559 ?auto_699565 ) ) ( not ( = ?auto_699559 ?auto_699566 ) ) ( not ( = ?auto_699559 ?auto_699567 ) ) ( not ( = ?auto_699559 ?auto_699568 ) ) ( not ( = ?auto_699560 ?auto_699561 ) ) ( not ( = ?auto_699560 ?auto_699562 ) ) ( not ( = ?auto_699560 ?auto_699563 ) ) ( not ( = ?auto_699560 ?auto_699564 ) ) ( not ( = ?auto_699560 ?auto_699565 ) ) ( not ( = ?auto_699560 ?auto_699566 ) ) ( not ( = ?auto_699560 ?auto_699567 ) ) ( not ( = ?auto_699560 ?auto_699568 ) ) ( not ( = ?auto_699561 ?auto_699562 ) ) ( not ( = ?auto_699561 ?auto_699563 ) ) ( not ( = ?auto_699561 ?auto_699564 ) ) ( not ( = ?auto_699561 ?auto_699565 ) ) ( not ( = ?auto_699561 ?auto_699566 ) ) ( not ( = ?auto_699561 ?auto_699567 ) ) ( not ( = ?auto_699561 ?auto_699568 ) ) ( not ( = ?auto_699562 ?auto_699563 ) ) ( not ( = ?auto_699562 ?auto_699564 ) ) ( not ( = ?auto_699562 ?auto_699565 ) ) ( not ( = ?auto_699562 ?auto_699566 ) ) ( not ( = ?auto_699562 ?auto_699567 ) ) ( not ( = ?auto_699562 ?auto_699568 ) ) ( not ( = ?auto_699563 ?auto_699564 ) ) ( not ( = ?auto_699563 ?auto_699565 ) ) ( not ( = ?auto_699563 ?auto_699566 ) ) ( not ( = ?auto_699563 ?auto_699567 ) ) ( not ( = ?auto_699563 ?auto_699568 ) ) ( not ( = ?auto_699564 ?auto_699565 ) ) ( not ( = ?auto_699564 ?auto_699566 ) ) ( not ( = ?auto_699564 ?auto_699567 ) ) ( not ( = ?auto_699564 ?auto_699568 ) ) ( not ( = ?auto_699565 ?auto_699566 ) ) ( not ( = ?auto_699565 ?auto_699567 ) ) ( not ( = ?auto_699565 ?auto_699568 ) ) ( not ( = ?auto_699566 ?auto_699567 ) ) ( not ( = ?auto_699566 ?auto_699568 ) ) ( not ( = ?auto_699567 ?auto_699568 ) ) ( ON ?auto_699566 ?auto_699567 ) ( ON ?auto_699565 ?auto_699566 ) ( ON ?auto_699564 ?auto_699565 ) ( ON ?auto_699563 ?auto_699564 ) ( ON ?auto_699562 ?auto_699563 ) ( CLEAR ?auto_699560 ) ( ON ?auto_699561 ?auto_699562 ) ( CLEAR ?auto_699561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_699553 ?auto_699554 ?auto_699555 ?auto_699556 ?auto_699557 ?auto_699558 ?auto_699559 ?auto_699560 ?auto_699561 )
      ( MAKE-15PILE ?auto_699553 ?auto_699554 ?auto_699555 ?auto_699556 ?auto_699557 ?auto_699558 ?auto_699559 ?auto_699560 ?auto_699561 ?auto_699562 ?auto_699563 ?auto_699564 ?auto_699565 ?auto_699566 ?auto_699567 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699615 - BLOCK
      ?auto_699616 - BLOCK
      ?auto_699617 - BLOCK
      ?auto_699618 - BLOCK
      ?auto_699619 - BLOCK
      ?auto_699620 - BLOCK
      ?auto_699621 - BLOCK
      ?auto_699622 - BLOCK
      ?auto_699623 - BLOCK
      ?auto_699624 - BLOCK
      ?auto_699625 - BLOCK
      ?auto_699626 - BLOCK
      ?auto_699627 - BLOCK
      ?auto_699628 - BLOCK
      ?auto_699629 - BLOCK
    )
    :vars
    (
      ?auto_699630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699629 ?auto_699630 ) ( ON-TABLE ?auto_699615 ) ( ON ?auto_699616 ?auto_699615 ) ( ON ?auto_699617 ?auto_699616 ) ( ON ?auto_699618 ?auto_699617 ) ( ON ?auto_699619 ?auto_699618 ) ( ON ?auto_699620 ?auto_699619 ) ( ON ?auto_699621 ?auto_699620 ) ( not ( = ?auto_699615 ?auto_699616 ) ) ( not ( = ?auto_699615 ?auto_699617 ) ) ( not ( = ?auto_699615 ?auto_699618 ) ) ( not ( = ?auto_699615 ?auto_699619 ) ) ( not ( = ?auto_699615 ?auto_699620 ) ) ( not ( = ?auto_699615 ?auto_699621 ) ) ( not ( = ?auto_699615 ?auto_699622 ) ) ( not ( = ?auto_699615 ?auto_699623 ) ) ( not ( = ?auto_699615 ?auto_699624 ) ) ( not ( = ?auto_699615 ?auto_699625 ) ) ( not ( = ?auto_699615 ?auto_699626 ) ) ( not ( = ?auto_699615 ?auto_699627 ) ) ( not ( = ?auto_699615 ?auto_699628 ) ) ( not ( = ?auto_699615 ?auto_699629 ) ) ( not ( = ?auto_699615 ?auto_699630 ) ) ( not ( = ?auto_699616 ?auto_699617 ) ) ( not ( = ?auto_699616 ?auto_699618 ) ) ( not ( = ?auto_699616 ?auto_699619 ) ) ( not ( = ?auto_699616 ?auto_699620 ) ) ( not ( = ?auto_699616 ?auto_699621 ) ) ( not ( = ?auto_699616 ?auto_699622 ) ) ( not ( = ?auto_699616 ?auto_699623 ) ) ( not ( = ?auto_699616 ?auto_699624 ) ) ( not ( = ?auto_699616 ?auto_699625 ) ) ( not ( = ?auto_699616 ?auto_699626 ) ) ( not ( = ?auto_699616 ?auto_699627 ) ) ( not ( = ?auto_699616 ?auto_699628 ) ) ( not ( = ?auto_699616 ?auto_699629 ) ) ( not ( = ?auto_699616 ?auto_699630 ) ) ( not ( = ?auto_699617 ?auto_699618 ) ) ( not ( = ?auto_699617 ?auto_699619 ) ) ( not ( = ?auto_699617 ?auto_699620 ) ) ( not ( = ?auto_699617 ?auto_699621 ) ) ( not ( = ?auto_699617 ?auto_699622 ) ) ( not ( = ?auto_699617 ?auto_699623 ) ) ( not ( = ?auto_699617 ?auto_699624 ) ) ( not ( = ?auto_699617 ?auto_699625 ) ) ( not ( = ?auto_699617 ?auto_699626 ) ) ( not ( = ?auto_699617 ?auto_699627 ) ) ( not ( = ?auto_699617 ?auto_699628 ) ) ( not ( = ?auto_699617 ?auto_699629 ) ) ( not ( = ?auto_699617 ?auto_699630 ) ) ( not ( = ?auto_699618 ?auto_699619 ) ) ( not ( = ?auto_699618 ?auto_699620 ) ) ( not ( = ?auto_699618 ?auto_699621 ) ) ( not ( = ?auto_699618 ?auto_699622 ) ) ( not ( = ?auto_699618 ?auto_699623 ) ) ( not ( = ?auto_699618 ?auto_699624 ) ) ( not ( = ?auto_699618 ?auto_699625 ) ) ( not ( = ?auto_699618 ?auto_699626 ) ) ( not ( = ?auto_699618 ?auto_699627 ) ) ( not ( = ?auto_699618 ?auto_699628 ) ) ( not ( = ?auto_699618 ?auto_699629 ) ) ( not ( = ?auto_699618 ?auto_699630 ) ) ( not ( = ?auto_699619 ?auto_699620 ) ) ( not ( = ?auto_699619 ?auto_699621 ) ) ( not ( = ?auto_699619 ?auto_699622 ) ) ( not ( = ?auto_699619 ?auto_699623 ) ) ( not ( = ?auto_699619 ?auto_699624 ) ) ( not ( = ?auto_699619 ?auto_699625 ) ) ( not ( = ?auto_699619 ?auto_699626 ) ) ( not ( = ?auto_699619 ?auto_699627 ) ) ( not ( = ?auto_699619 ?auto_699628 ) ) ( not ( = ?auto_699619 ?auto_699629 ) ) ( not ( = ?auto_699619 ?auto_699630 ) ) ( not ( = ?auto_699620 ?auto_699621 ) ) ( not ( = ?auto_699620 ?auto_699622 ) ) ( not ( = ?auto_699620 ?auto_699623 ) ) ( not ( = ?auto_699620 ?auto_699624 ) ) ( not ( = ?auto_699620 ?auto_699625 ) ) ( not ( = ?auto_699620 ?auto_699626 ) ) ( not ( = ?auto_699620 ?auto_699627 ) ) ( not ( = ?auto_699620 ?auto_699628 ) ) ( not ( = ?auto_699620 ?auto_699629 ) ) ( not ( = ?auto_699620 ?auto_699630 ) ) ( not ( = ?auto_699621 ?auto_699622 ) ) ( not ( = ?auto_699621 ?auto_699623 ) ) ( not ( = ?auto_699621 ?auto_699624 ) ) ( not ( = ?auto_699621 ?auto_699625 ) ) ( not ( = ?auto_699621 ?auto_699626 ) ) ( not ( = ?auto_699621 ?auto_699627 ) ) ( not ( = ?auto_699621 ?auto_699628 ) ) ( not ( = ?auto_699621 ?auto_699629 ) ) ( not ( = ?auto_699621 ?auto_699630 ) ) ( not ( = ?auto_699622 ?auto_699623 ) ) ( not ( = ?auto_699622 ?auto_699624 ) ) ( not ( = ?auto_699622 ?auto_699625 ) ) ( not ( = ?auto_699622 ?auto_699626 ) ) ( not ( = ?auto_699622 ?auto_699627 ) ) ( not ( = ?auto_699622 ?auto_699628 ) ) ( not ( = ?auto_699622 ?auto_699629 ) ) ( not ( = ?auto_699622 ?auto_699630 ) ) ( not ( = ?auto_699623 ?auto_699624 ) ) ( not ( = ?auto_699623 ?auto_699625 ) ) ( not ( = ?auto_699623 ?auto_699626 ) ) ( not ( = ?auto_699623 ?auto_699627 ) ) ( not ( = ?auto_699623 ?auto_699628 ) ) ( not ( = ?auto_699623 ?auto_699629 ) ) ( not ( = ?auto_699623 ?auto_699630 ) ) ( not ( = ?auto_699624 ?auto_699625 ) ) ( not ( = ?auto_699624 ?auto_699626 ) ) ( not ( = ?auto_699624 ?auto_699627 ) ) ( not ( = ?auto_699624 ?auto_699628 ) ) ( not ( = ?auto_699624 ?auto_699629 ) ) ( not ( = ?auto_699624 ?auto_699630 ) ) ( not ( = ?auto_699625 ?auto_699626 ) ) ( not ( = ?auto_699625 ?auto_699627 ) ) ( not ( = ?auto_699625 ?auto_699628 ) ) ( not ( = ?auto_699625 ?auto_699629 ) ) ( not ( = ?auto_699625 ?auto_699630 ) ) ( not ( = ?auto_699626 ?auto_699627 ) ) ( not ( = ?auto_699626 ?auto_699628 ) ) ( not ( = ?auto_699626 ?auto_699629 ) ) ( not ( = ?auto_699626 ?auto_699630 ) ) ( not ( = ?auto_699627 ?auto_699628 ) ) ( not ( = ?auto_699627 ?auto_699629 ) ) ( not ( = ?auto_699627 ?auto_699630 ) ) ( not ( = ?auto_699628 ?auto_699629 ) ) ( not ( = ?auto_699628 ?auto_699630 ) ) ( not ( = ?auto_699629 ?auto_699630 ) ) ( ON ?auto_699628 ?auto_699629 ) ( ON ?auto_699627 ?auto_699628 ) ( ON ?auto_699626 ?auto_699627 ) ( ON ?auto_699625 ?auto_699626 ) ( ON ?auto_699624 ?auto_699625 ) ( ON ?auto_699623 ?auto_699624 ) ( CLEAR ?auto_699621 ) ( ON ?auto_699622 ?auto_699623 ) ( CLEAR ?auto_699622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_699615 ?auto_699616 ?auto_699617 ?auto_699618 ?auto_699619 ?auto_699620 ?auto_699621 ?auto_699622 )
      ( MAKE-15PILE ?auto_699615 ?auto_699616 ?auto_699617 ?auto_699618 ?auto_699619 ?auto_699620 ?auto_699621 ?auto_699622 ?auto_699623 ?auto_699624 ?auto_699625 ?auto_699626 ?auto_699627 ?auto_699628 ?auto_699629 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699677 - BLOCK
      ?auto_699678 - BLOCK
      ?auto_699679 - BLOCK
      ?auto_699680 - BLOCK
      ?auto_699681 - BLOCK
      ?auto_699682 - BLOCK
      ?auto_699683 - BLOCK
      ?auto_699684 - BLOCK
      ?auto_699685 - BLOCK
      ?auto_699686 - BLOCK
      ?auto_699687 - BLOCK
      ?auto_699688 - BLOCK
      ?auto_699689 - BLOCK
      ?auto_699690 - BLOCK
      ?auto_699691 - BLOCK
    )
    :vars
    (
      ?auto_699692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699691 ?auto_699692 ) ( ON-TABLE ?auto_699677 ) ( ON ?auto_699678 ?auto_699677 ) ( ON ?auto_699679 ?auto_699678 ) ( ON ?auto_699680 ?auto_699679 ) ( ON ?auto_699681 ?auto_699680 ) ( ON ?auto_699682 ?auto_699681 ) ( not ( = ?auto_699677 ?auto_699678 ) ) ( not ( = ?auto_699677 ?auto_699679 ) ) ( not ( = ?auto_699677 ?auto_699680 ) ) ( not ( = ?auto_699677 ?auto_699681 ) ) ( not ( = ?auto_699677 ?auto_699682 ) ) ( not ( = ?auto_699677 ?auto_699683 ) ) ( not ( = ?auto_699677 ?auto_699684 ) ) ( not ( = ?auto_699677 ?auto_699685 ) ) ( not ( = ?auto_699677 ?auto_699686 ) ) ( not ( = ?auto_699677 ?auto_699687 ) ) ( not ( = ?auto_699677 ?auto_699688 ) ) ( not ( = ?auto_699677 ?auto_699689 ) ) ( not ( = ?auto_699677 ?auto_699690 ) ) ( not ( = ?auto_699677 ?auto_699691 ) ) ( not ( = ?auto_699677 ?auto_699692 ) ) ( not ( = ?auto_699678 ?auto_699679 ) ) ( not ( = ?auto_699678 ?auto_699680 ) ) ( not ( = ?auto_699678 ?auto_699681 ) ) ( not ( = ?auto_699678 ?auto_699682 ) ) ( not ( = ?auto_699678 ?auto_699683 ) ) ( not ( = ?auto_699678 ?auto_699684 ) ) ( not ( = ?auto_699678 ?auto_699685 ) ) ( not ( = ?auto_699678 ?auto_699686 ) ) ( not ( = ?auto_699678 ?auto_699687 ) ) ( not ( = ?auto_699678 ?auto_699688 ) ) ( not ( = ?auto_699678 ?auto_699689 ) ) ( not ( = ?auto_699678 ?auto_699690 ) ) ( not ( = ?auto_699678 ?auto_699691 ) ) ( not ( = ?auto_699678 ?auto_699692 ) ) ( not ( = ?auto_699679 ?auto_699680 ) ) ( not ( = ?auto_699679 ?auto_699681 ) ) ( not ( = ?auto_699679 ?auto_699682 ) ) ( not ( = ?auto_699679 ?auto_699683 ) ) ( not ( = ?auto_699679 ?auto_699684 ) ) ( not ( = ?auto_699679 ?auto_699685 ) ) ( not ( = ?auto_699679 ?auto_699686 ) ) ( not ( = ?auto_699679 ?auto_699687 ) ) ( not ( = ?auto_699679 ?auto_699688 ) ) ( not ( = ?auto_699679 ?auto_699689 ) ) ( not ( = ?auto_699679 ?auto_699690 ) ) ( not ( = ?auto_699679 ?auto_699691 ) ) ( not ( = ?auto_699679 ?auto_699692 ) ) ( not ( = ?auto_699680 ?auto_699681 ) ) ( not ( = ?auto_699680 ?auto_699682 ) ) ( not ( = ?auto_699680 ?auto_699683 ) ) ( not ( = ?auto_699680 ?auto_699684 ) ) ( not ( = ?auto_699680 ?auto_699685 ) ) ( not ( = ?auto_699680 ?auto_699686 ) ) ( not ( = ?auto_699680 ?auto_699687 ) ) ( not ( = ?auto_699680 ?auto_699688 ) ) ( not ( = ?auto_699680 ?auto_699689 ) ) ( not ( = ?auto_699680 ?auto_699690 ) ) ( not ( = ?auto_699680 ?auto_699691 ) ) ( not ( = ?auto_699680 ?auto_699692 ) ) ( not ( = ?auto_699681 ?auto_699682 ) ) ( not ( = ?auto_699681 ?auto_699683 ) ) ( not ( = ?auto_699681 ?auto_699684 ) ) ( not ( = ?auto_699681 ?auto_699685 ) ) ( not ( = ?auto_699681 ?auto_699686 ) ) ( not ( = ?auto_699681 ?auto_699687 ) ) ( not ( = ?auto_699681 ?auto_699688 ) ) ( not ( = ?auto_699681 ?auto_699689 ) ) ( not ( = ?auto_699681 ?auto_699690 ) ) ( not ( = ?auto_699681 ?auto_699691 ) ) ( not ( = ?auto_699681 ?auto_699692 ) ) ( not ( = ?auto_699682 ?auto_699683 ) ) ( not ( = ?auto_699682 ?auto_699684 ) ) ( not ( = ?auto_699682 ?auto_699685 ) ) ( not ( = ?auto_699682 ?auto_699686 ) ) ( not ( = ?auto_699682 ?auto_699687 ) ) ( not ( = ?auto_699682 ?auto_699688 ) ) ( not ( = ?auto_699682 ?auto_699689 ) ) ( not ( = ?auto_699682 ?auto_699690 ) ) ( not ( = ?auto_699682 ?auto_699691 ) ) ( not ( = ?auto_699682 ?auto_699692 ) ) ( not ( = ?auto_699683 ?auto_699684 ) ) ( not ( = ?auto_699683 ?auto_699685 ) ) ( not ( = ?auto_699683 ?auto_699686 ) ) ( not ( = ?auto_699683 ?auto_699687 ) ) ( not ( = ?auto_699683 ?auto_699688 ) ) ( not ( = ?auto_699683 ?auto_699689 ) ) ( not ( = ?auto_699683 ?auto_699690 ) ) ( not ( = ?auto_699683 ?auto_699691 ) ) ( not ( = ?auto_699683 ?auto_699692 ) ) ( not ( = ?auto_699684 ?auto_699685 ) ) ( not ( = ?auto_699684 ?auto_699686 ) ) ( not ( = ?auto_699684 ?auto_699687 ) ) ( not ( = ?auto_699684 ?auto_699688 ) ) ( not ( = ?auto_699684 ?auto_699689 ) ) ( not ( = ?auto_699684 ?auto_699690 ) ) ( not ( = ?auto_699684 ?auto_699691 ) ) ( not ( = ?auto_699684 ?auto_699692 ) ) ( not ( = ?auto_699685 ?auto_699686 ) ) ( not ( = ?auto_699685 ?auto_699687 ) ) ( not ( = ?auto_699685 ?auto_699688 ) ) ( not ( = ?auto_699685 ?auto_699689 ) ) ( not ( = ?auto_699685 ?auto_699690 ) ) ( not ( = ?auto_699685 ?auto_699691 ) ) ( not ( = ?auto_699685 ?auto_699692 ) ) ( not ( = ?auto_699686 ?auto_699687 ) ) ( not ( = ?auto_699686 ?auto_699688 ) ) ( not ( = ?auto_699686 ?auto_699689 ) ) ( not ( = ?auto_699686 ?auto_699690 ) ) ( not ( = ?auto_699686 ?auto_699691 ) ) ( not ( = ?auto_699686 ?auto_699692 ) ) ( not ( = ?auto_699687 ?auto_699688 ) ) ( not ( = ?auto_699687 ?auto_699689 ) ) ( not ( = ?auto_699687 ?auto_699690 ) ) ( not ( = ?auto_699687 ?auto_699691 ) ) ( not ( = ?auto_699687 ?auto_699692 ) ) ( not ( = ?auto_699688 ?auto_699689 ) ) ( not ( = ?auto_699688 ?auto_699690 ) ) ( not ( = ?auto_699688 ?auto_699691 ) ) ( not ( = ?auto_699688 ?auto_699692 ) ) ( not ( = ?auto_699689 ?auto_699690 ) ) ( not ( = ?auto_699689 ?auto_699691 ) ) ( not ( = ?auto_699689 ?auto_699692 ) ) ( not ( = ?auto_699690 ?auto_699691 ) ) ( not ( = ?auto_699690 ?auto_699692 ) ) ( not ( = ?auto_699691 ?auto_699692 ) ) ( ON ?auto_699690 ?auto_699691 ) ( ON ?auto_699689 ?auto_699690 ) ( ON ?auto_699688 ?auto_699689 ) ( ON ?auto_699687 ?auto_699688 ) ( ON ?auto_699686 ?auto_699687 ) ( ON ?auto_699685 ?auto_699686 ) ( ON ?auto_699684 ?auto_699685 ) ( CLEAR ?auto_699682 ) ( ON ?auto_699683 ?auto_699684 ) ( CLEAR ?auto_699683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_699677 ?auto_699678 ?auto_699679 ?auto_699680 ?auto_699681 ?auto_699682 ?auto_699683 )
      ( MAKE-15PILE ?auto_699677 ?auto_699678 ?auto_699679 ?auto_699680 ?auto_699681 ?auto_699682 ?auto_699683 ?auto_699684 ?auto_699685 ?auto_699686 ?auto_699687 ?auto_699688 ?auto_699689 ?auto_699690 ?auto_699691 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699739 - BLOCK
      ?auto_699740 - BLOCK
      ?auto_699741 - BLOCK
      ?auto_699742 - BLOCK
      ?auto_699743 - BLOCK
      ?auto_699744 - BLOCK
      ?auto_699745 - BLOCK
      ?auto_699746 - BLOCK
      ?auto_699747 - BLOCK
      ?auto_699748 - BLOCK
      ?auto_699749 - BLOCK
      ?auto_699750 - BLOCK
      ?auto_699751 - BLOCK
      ?auto_699752 - BLOCK
      ?auto_699753 - BLOCK
    )
    :vars
    (
      ?auto_699754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699753 ?auto_699754 ) ( ON-TABLE ?auto_699739 ) ( ON ?auto_699740 ?auto_699739 ) ( ON ?auto_699741 ?auto_699740 ) ( ON ?auto_699742 ?auto_699741 ) ( ON ?auto_699743 ?auto_699742 ) ( not ( = ?auto_699739 ?auto_699740 ) ) ( not ( = ?auto_699739 ?auto_699741 ) ) ( not ( = ?auto_699739 ?auto_699742 ) ) ( not ( = ?auto_699739 ?auto_699743 ) ) ( not ( = ?auto_699739 ?auto_699744 ) ) ( not ( = ?auto_699739 ?auto_699745 ) ) ( not ( = ?auto_699739 ?auto_699746 ) ) ( not ( = ?auto_699739 ?auto_699747 ) ) ( not ( = ?auto_699739 ?auto_699748 ) ) ( not ( = ?auto_699739 ?auto_699749 ) ) ( not ( = ?auto_699739 ?auto_699750 ) ) ( not ( = ?auto_699739 ?auto_699751 ) ) ( not ( = ?auto_699739 ?auto_699752 ) ) ( not ( = ?auto_699739 ?auto_699753 ) ) ( not ( = ?auto_699739 ?auto_699754 ) ) ( not ( = ?auto_699740 ?auto_699741 ) ) ( not ( = ?auto_699740 ?auto_699742 ) ) ( not ( = ?auto_699740 ?auto_699743 ) ) ( not ( = ?auto_699740 ?auto_699744 ) ) ( not ( = ?auto_699740 ?auto_699745 ) ) ( not ( = ?auto_699740 ?auto_699746 ) ) ( not ( = ?auto_699740 ?auto_699747 ) ) ( not ( = ?auto_699740 ?auto_699748 ) ) ( not ( = ?auto_699740 ?auto_699749 ) ) ( not ( = ?auto_699740 ?auto_699750 ) ) ( not ( = ?auto_699740 ?auto_699751 ) ) ( not ( = ?auto_699740 ?auto_699752 ) ) ( not ( = ?auto_699740 ?auto_699753 ) ) ( not ( = ?auto_699740 ?auto_699754 ) ) ( not ( = ?auto_699741 ?auto_699742 ) ) ( not ( = ?auto_699741 ?auto_699743 ) ) ( not ( = ?auto_699741 ?auto_699744 ) ) ( not ( = ?auto_699741 ?auto_699745 ) ) ( not ( = ?auto_699741 ?auto_699746 ) ) ( not ( = ?auto_699741 ?auto_699747 ) ) ( not ( = ?auto_699741 ?auto_699748 ) ) ( not ( = ?auto_699741 ?auto_699749 ) ) ( not ( = ?auto_699741 ?auto_699750 ) ) ( not ( = ?auto_699741 ?auto_699751 ) ) ( not ( = ?auto_699741 ?auto_699752 ) ) ( not ( = ?auto_699741 ?auto_699753 ) ) ( not ( = ?auto_699741 ?auto_699754 ) ) ( not ( = ?auto_699742 ?auto_699743 ) ) ( not ( = ?auto_699742 ?auto_699744 ) ) ( not ( = ?auto_699742 ?auto_699745 ) ) ( not ( = ?auto_699742 ?auto_699746 ) ) ( not ( = ?auto_699742 ?auto_699747 ) ) ( not ( = ?auto_699742 ?auto_699748 ) ) ( not ( = ?auto_699742 ?auto_699749 ) ) ( not ( = ?auto_699742 ?auto_699750 ) ) ( not ( = ?auto_699742 ?auto_699751 ) ) ( not ( = ?auto_699742 ?auto_699752 ) ) ( not ( = ?auto_699742 ?auto_699753 ) ) ( not ( = ?auto_699742 ?auto_699754 ) ) ( not ( = ?auto_699743 ?auto_699744 ) ) ( not ( = ?auto_699743 ?auto_699745 ) ) ( not ( = ?auto_699743 ?auto_699746 ) ) ( not ( = ?auto_699743 ?auto_699747 ) ) ( not ( = ?auto_699743 ?auto_699748 ) ) ( not ( = ?auto_699743 ?auto_699749 ) ) ( not ( = ?auto_699743 ?auto_699750 ) ) ( not ( = ?auto_699743 ?auto_699751 ) ) ( not ( = ?auto_699743 ?auto_699752 ) ) ( not ( = ?auto_699743 ?auto_699753 ) ) ( not ( = ?auto_699743 ?auto_699754 ) ) ( not ( = ?auto_699744 ?auto_699745 ) ) ( not ( = ?auto_699744 ?auto_699746 ) ) ( not ( = ?auto_699744 ?auto_699747 ) ) ( not ( = ?auto_699744 ?auto_699748 ) ) ( not ( = ?auto_699744 ?auto_699749 ) ) ( not ( = ?auto_699744 ?auto_699750 ) ) ( not ( = ?auto_699744 ?auto_699751 ) ) ( not ( = ?auto_699744 ?auto_699752 ) ) ( not ( = ?auto_699744 ?auto_699753 ) ) ( not ( = ?auto_699744 ?auto_699754 ) ) ( not ( = ?auto_699745 ?auto_699746 ) ) ( not ( = ?auto_699745 ?auto_699747 ) ) ( not ( = ?auto_699745 ?auto_699748 ) ) ( not ( = ?auto_699745 ?auto_699749 ) ) ( not ( = ?auto_699745 ?auto_699750 ) ) ( not ( = ?auto_699745 ?auto_699751 ) ) ( not ( = ?auto_699745 ?auto_699752 ) ) ( not ( = ?auto_699745 ?auto_699753 ) ) ( not ( = ?auto_699745 ?auto_699754 ) ) ( not ( = ?auto_699746 ?auto_699747 ) ) ( not ( = ?auto_699746 ?auto_699748 ) ) ( not ( = ?auto_699746 ?auto_699749 ) ) ( not ( = ?auto_699746 ?auto_699750 ) ) ( not ( = ?auto_699746 ?auto_699751 ) ) ( not ( = ?auto_699746 ?auto_699752 ) ) ( not ( = ?auto_699746 ?auto_699753 ) ) ( not ( = ?auto_699746 ?auto_699754 ) ) ( not ( = ?auto_699747 ?auto_699748 ) ) ( not ( = ?auto_699747 ?auto_699749 ) ) ( not ( = ?auto_699747 ?auto_699750 ) ) ( not ( = ?auto_699747 ?auto_699751 ) ) ( not ( = ?auto_699747 ?auto_699752 ) ) ( not ( = ?auto_699747 ?auto_699753 ) ) ( not ( = ?auto_699747 ?auto_699754 ) ) ( not ( = ?auto_699748 ?auto_699749 ) ) ( not ( = ?auto_699748 ?auto_699750 ) ) ( not ( = ?auto_699748 ?auto_699751 ) ) ( not ( = ?auto_699748 ?auto_699752 ) ) ( not ( = ?auto_699748 ?auto_699753 ) ) ( not ( = ?auto_699748 ?auto_699754 ) ) ( not ( = ?auto_699749 ?auto_699750 ) ) ( not ( = ?auto_699749 ?auto_699751 ) ) ( not ( = ?auto_699749 ?auto_699752 ) ) ( not ( = ?auto_699749 ?auto_699753 ) ) ( not ( = ?auto_699749 ?auto_699754 ) ) ( not ( = ?auto_699750 ?auto_699751 ) ) ( not ( = ?auto_699750 ?auto_699752 ) ) ( not ( = ?auto_699750 ?auto_699753 ) ) ( not ( = ?auto_699750 ?auto_699754 ) ) ( not ( = ?auto_699751 ?auto_699752 ) ) ( not ( = ?auto_699751 ?auto_699753 ) ) ( not ( = ?auto_699751 ?auto_699754 ) ) ( not ( = ?auto_699752 ?auto_699753 ) ) ( not ( = ?auto_699752 ?auto_699754 ) ) ( not ( = ?auto_699753 ?auto_699754 ) ) ( ON ?auto_699752 ?auto_699753 ) ( ON ?auto_699751 ?auto_699752 ) ( ON ?auto_699750 ?auto_699751 ) ( ON ?auto_699749 ?auto_699750 ) ( ON ?auto_699748 ?auto_699749 ) ( ON ?auto_699747 ?auto_699748 ) ( ON ?auto_699746 ?auto_699747 ) ( ON ?auto_699745 ?auto_699746 ) ( CLEAR ?auto_699743 ) ( ON ?auto_699744 ?auto_699745 ) ( CLEAR ?auto_699744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_699739 ?auto_699740 ?auto_699741 ?auto_699742 ?auto_699743 ?auto_699744 )
      ( MAKE-15PILE ?auto_699739 ?auto_699740 ?auto_699741 ?auto_699742 ?auto_699743 ?auto_699744 ?auto_699745 ?auto_699746 ?auto_699747 ?auto_699748 ?auto_699749 ?auto_699750 ?auto_699751 ?auto_699752 ?auto_699753 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699801 - BLOCK
      ?auto_699802 - BLOCK
      ?auto_699803 - BLOCK
      ?auto_699804 - BLOCK
      ?auto_699805 - BLOCK
      ?auto_699806 - BLOCK
      ?auto_699807 - BLOCK
      ?auto_699808 - BLOCK
      ?auto_699809 - BLOCK
      ?auto_699810 - BLOCK
      ?auto_699811 - BLOCK
      ?auto_699812 - BLOCK
      ?auto_699813 - BLOCK
      ?auto_699814 - BLOCK
      ?auto_699815 - BLOCK
    )
    :vars
    (
      ?auto_699816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699815 ?auto_699816 ) ( ON-TABLE ?auto_699801 ) ( ON ?auto_699802 ?auto_699801 ) ( ON ?auto_699803 ?auto_699802 ) ( ON ?auto_699804 ?auto_699803 ) ( not ( = ?auto_699801 ?auto_699802 ) ) ( not ( = ?auto_699801 ?auto_699803 ) ) ( not ( = ?auto_699801 ?auto_699804 ) ) ( not ( = ?auto_699801 ?auto_699805 ) ) ( not ( = ?auto_699801 ?auto_699806 ) ) ( not ( = ?auto_699801 ?auto_699807 ) ) ( not ( = ?auto_699801 ?auto_699808 ) ) ( not ( = ?auto_699801 ?auto_699809 ) ) ( not ( = ?auto_699801 ?auto_699810 ) ) ( not ( = ?auto_699801 ?auto_699811 ) ) ( not ( = ?auto_699801 ?auto_699812 ) ) ( not ( = ?auto_699801 ?auto_699813 ) ) ( not ( = ?auto_699801 ?auto_699814 ) ) ( not ( = ?auto_699801 ?auto_699815 ) ) ( not ( = ?auto_699801 ?auto_699816 ) ) ( not ( = ?auto_699802 ?auto_699803 ) ) ( not ( = ?auto_699802 ?auto_699804 ) ) ( not ( = ?auto_699802 ?auto_699805 ) ) ( not ( = ?auto_699802 ?auto_699806 ) ) ( not ( = ?auto_699802 ?auto_699807 ) ) ( not ( = ?auto_699802 ?auto_699808 ) ) ( not ( = ?auto_699802 ?auto_699809 ) ) ( not ( = ?auto_699802 ?auto_699810 ) ) ( not ( = ?auto_699802 ?auto_699811 ) ) ( not ( = ?auto_699802 ?auto_699812 ) ) ( not ( = ?auto_699802 ?auto_699813 ) ) ( not ( = ?auto_699802 ?auto_699814 ) ) ( not ( = ?auto_699802 ?auto_699815 ) ) ( not ( = ?auto_699802 ?auto_699816 ) ) ( not ( = ?auto_699803 ?auto_699804 ) ) ( not ( = ?auto_699803 ?auto_699805 ) ) ( not ( = ?auto_699803 ?auto_699806 ) ) ( not ( = ?auto_699803 ?auto_699807 ) ) ( not ( = ?auto_699803 ?auto_699808 ) ) ( not ( = ?auto_699803 ?auto_699809 ) ) ( not ( = ?auto_699803 ?auto_699810 ) ) ( not ( = ?auto_699803 ?auto_699811 ) ) ( not ( = ?auto_699803 ?auto_699812 ) ) ( not ( = ?auto_699803 ?auto_699813 ) ) ( not ( = ?auto_699803 ?auto_699814 ) ) ( not ( = ?auto_699803 ?auto_699815 ) ) ( not ( = ?auto_699803 ?auto_699816 ) ) ( not ( = ?auto_699804 ?auto_699805 ) ) ( not ( = ?auto_699804 ?auto_699806 ) ) ( not ( = ?auto_699804 ?auto_699807 ) ) ( not ( = ?auto_699804 ?auto_699808 ) ) ( not ( = ?auto_699804 ?auto_699809 ) ) ( not ( = ?auto_699804 ?auto_699810 ) ) ( not ( = ?auto_699804 ?auto_699811 ) ) ( not ( = ?auto_699804 ?auto_699812 ) ) ( not ( = ?auto_699804 ?auto_699813 ) ) ( not ( = ?auto_699804 ?auto_699814 ) ) ( not ( = ?auto_699804 ?auto_699815 ) ) ( not ( = ?auto_699804 ?auto_699816 ) ) ( not ( = ?auto_699805 ?auto_699806 ) ) ( not ( = ?auto_699805 ?auto_699807 ) ) ( not ( = ?auto_699805 ?auto_699808 ) ) ( not ( = ?auto_699805 ?auto_699809 ) ) ( not ( = ?auto_699805 ?auto_699810 ) ) ( not ( = ?auto_699805 ?auto_699811 ) ) ( not ( = ?auto_699805 ?auto_699812 ) ) ( not ( = ?auto_699805 ?auto_699813 ) ) ( not ( = ?auto_699805 ?auto_699814 ) ) ( not ( = ?auto_699805 ?auto_699815 ) ) ( not ( = ?auto_699805 ?auto_699816 ) ) ( not ( = ?auto_699806 ?auto_699807 ) ) ( not ( = ?auto_699806 ?auto_699808 ) ) ( not ( = ?auto_699806 ?auto_699809 ) ) ( not ( = ?auto_699806 ?auto_699810 ) ) ( not ( = ?auto_699806 ?auto_699811 ) ) ( not ( = ?auto_699806 ?auto_699812 ) ) ( not ( = ?auto_699806 ?auto_699813 ) ) ( not ( = ?auto_699806 ?auto_699814 ) ) ( not ( = ?auto_699806 ?auto_699815 ) ) ( not ( = ?auto_699806 ?auto_699816 ) ) ( not ( = ?auto_699807 ?auto_699808 ) ) ( not ( = ?auto_699807 ?auto_699809 ) ) ( not ( = ?auto_699807 ?auto_699810 ) ) ( not ( = ?auto_699807 ?auto_699811 ) ) ( not ( = ?auto_699807 ?auto_699812 ) ) ( not ( = ?auto_699807 ?auto_699813 ) ) ( not ( = ?auto_699807 ?auto_699814 ) ) ( not ( = ?auto_699807 ?auto_699815 ) ) ( not ( = ?auto_699807 ?auto_699816 ) ) ( not ( = ?auto_699808 ?auto_699809 ) ) ( not ( = ?auto_699808 ?auto_699810 ) ) ( not ( = ?auto_699808 ?auto_699811 ) ) ( not ( = ?auto_699808 ?auto_699812 ) ) ( not ( = ?auto_699808 ?auto_699813 ) ) ( not ( = ?auto_699808 ?auto_699814 ) ) ( not ( = ?auto_699808 ?auto_699815 ) ) ( not ( = ?auto_699808 ?auto_699816 ) ) ( not ( = ?auto_699809 ?auto_699810 ) ) ( not ( = ?auto_699809 ?auto_699811 ) ) ( not ( = ?auto_699809 ?auto_699812 ) ) ( not ( = ?auto_699809 ?auto_699813 ) ) ( not ( = ?auto_699809 ?auto_699814 ) ) ( not ( = ?auto_699809 ?auto_699815 ) ) ( not ( = ?auto_699809 ?auto_699816 ) ) ( not ( = ?auto_699810 ?auto_699811 ) ) ( not ( = ?auto_699810 ?auto_699812 ) ) ( not ( = ?auto_699810 ?auto_699813 ) ) ( not ( = ?auto_699810 ?auto_699814 ) ) ( not ( = ?auto_699810 ?auto_699815 ) ) ( not ( = ?auto_699810 ?auto_699816 ) ) ( not ( = ?auto_699811 ?auto_699812 ) ) ( not ( = ?auto_699811 ?auto_699813 ) ) ( not ( = ?auto_699811 ?auto_699814 ) ) ( not ( = ?auto_699811 ?auto_699815 ) ) ( not ( = ?auto_699811 ?auto_699816 ) ) ( not ( = ?auto_699812 ?auto_699813 ) ) ( not ( = ?auto_699812 ?auto_699814 ) ) ( not ( = ?auto_699812 ?auto_699815 ) ) ( not ( = ?auto_699812 ?auto_699816 ) ) ( not ( = ?auto_699813 ?auto_699814 ) ) ( not ( = ?auto_699813 ?auto_699815 ) ) ( not ( = ?auto_699813 ?auto_699816 ) ) ( not ( = ?auto_699814 ?auto_699815 ) ) ( not ( = ?auto_699814 ?auto_699816 ) ) ( not ( = ?auto_699815 ?auto_699816 ) ) ( ON ?auto_699814 ?auto_699815 ) ( ON ?auto_699813 ?auto_699814 ) ( ON ?auto_699812 ?auto_699813 ) ( ON ?auto_699811 ?auto_699812 ) ( ON ?auto_699810 ?auto_699811 ) ( ON ?auto_699809 ?auto_699810 ) ( ON ?auto_699808 ?auto_699809 ) ( ON ?auto_699807 ?auto_699808 ) ( ON ?auto_699806 ?auto_699807 ) ( CLEAR ?auto_699804 ) ( ON ?auto_699805 ?auto_699806 ) ( CLEAR ?auto_699805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_699801 ?auto_699802 ?auto_699803 ?auto_699804 ?auto_699805 )
      ( MAKE-15PILE ?auto_699801 ?auto_699802 ?auto_699803 ?auto_699804 ?auto_699805 ?auto_699806 ?auto_699807 ?auto_699808 ?auto_699809 ?auto_699810 ?auto_699811 ?auto_699812 ?auto_699813 ?auto_699814 ?auto_699815 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699863 - BLOCK
      ?auto_699864 - BLOCK
      ?auto_699865 - BLOCK
      ?auto_699866 - BLOCK
      ?auto_699867 - BLOCK
      ?auto_699868 - BLOCK
      ?auto_699869 - BLOCK
      ?auto_699870 - BLOCK
      ?auto_699871 - BLOCK
      ?auto_699872 - BLOCK
      ?auto_699873 - BLOCK
      ?auto_699874 - BLOCK
      ?auto_699875 - BLOCK
      ?auto_699876 - BLOCK
      ?auto_699877 - BLOCK
    )
    :vars
    (
      ?auto_699878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699877 ?auto_699878 ) ( ON-TABLE ?auto_699863 ) ( ON ?auto_699864 ?auto_699863 ) ( ON ?auto_699865 ?auto_699864 ) ( not ( = ?auto_699863 ?auto_699864 ) ) ( not ( = ?auto_699863 ?auto_699865 ) ) ( not ( = ?auto_699863 ?auto_699866 ) ) ( not ( = ?auto_699863 ?auto_699867 ) ) ( not ( = ?auto_699863 ?auto_699868 ) ) ( not ( = ?auto_699863 ?auto_699869 ) ) ( not ( = ?auto_699863 ?auto_699870 ) ) ( not ( = ?auto_699863 ?auto_699871 ) ) ( not ( = ?auto_699863 ?auto_699872 ) ) ( not ( = ?auto_699863 ?auto_699873 ) ) ( not ( = ?auto_699863 ?auto_699874 ) ) ( not ( = ?auto_699863 ?auto_699875 ) ) ( not ( = ?auto_699863 ?auto_699876 ) ) ( not ( = ?auto_699863 ?auto_699877 ) ) ( not ( = ?auto_699863 ?auto_699878 ) ) ( not ( = ?auto_699864 ?auto_699865 ) ) ( not ( = ?auto_699864 ?auto_699866 ) ) ( not ( = ?auto_699864 ?auto_699867 ) ) ( not ( = ?auto_699864 ?auto_699868 ) ) ( not ( = ?auto_699864 ?auto_699869 ) ) ( not ( = ?auto_699864 ?auto_699870 ) ) ( not ( = ?auto_699864 ?auto_699871 ) ) ( not ( = ?auto_699864 ?auto_699872 ) ) ( not ( = ?auto_699864 ?auto_699873 ) ) ( not ( = ?auto_699864 ?auto_699874 ) ) ( not ( = ?auto_699864 ?auto_699875 ) ) ( not ( = ?auto_699864 ?auto_699876 ) ) ( not ( = ?auto_699864 ?auto_699877 ) ) ( not ( = ?auto_699864 ?auto_699878 ) ) ( not ( = ?auto_699865 ?auto_699866 ) ) ( not ( = ?auto_699865 ?auto_699867 ) ) ( not ( = ?auto_699865 ?auto_699868 ) ) ( not ( = ?auto_699865 ?auto_699869 ) ) ( not ( = ?auto_699865 ?auto_699870 ) ) ( not ( = ?auto_699865 ?auto_699871 ) ) ( not ( = ?auto_699865 ?auto_699872 ) ) ( not ( = ?auto_699865 ?auto_699873 ) ) ( not ( = ?auto_699865 ?auto_699874 ) ) ( not ( = ?auto_699865 ?auto_699875 ) ) ( not ( = ?auto_699865 ?auto_699876 ) ) ( not ( = ?auto_699865 ?auto_699877 ) ) ( not ( = ?auto_699865 ?auto_699878 ) ) ( not ( = ?auto_699866 ?auto_699867 ) ) ( not ( = ?auto_699866 ?auto_699868 ) ) ( not ( = ?auto_699866 ?auto_699869 ) ) ( not ( = ?auto_699866 ?auto_699870 ) ) ( not ( = ?auto_699866 ?auto_699871 ) ) ( not ( = ?auto_699866 ?auto_699872 ) ) ( not ( = ?auto_699866 ?auto_699873 ) ) ( not ( = ?auto_699866 ?auto_699874 ) ) ( not ( = ?auto_699866 ?auto_699875 ) ) ( not ( = ?auto_699866 ?auto_699876 ) ) ( not ( = ?auto_699866 ?auto_699877 ) ) ( not ( = ?auto_699866 ?auto_699878 ) ) ( not ( = ?auto_699867 ?auto_699868 ) ) ( not ( = ?auto_699867 ?auto_699869 ) ) ( not ( = ?auto_699867 ?auto_699870 ) ) ( not ( = ?auto_699867 ?auto_699871 ) ) ( not ( = ?auto_699867 ?auto_699872 ) ) ( not ( = ?auto_699867 ?auto_699873 ) ) ( not ( = ?auto_699867 ?auto_699874 ) ) ( not ( = ?auto_699867 ?auto_699875 ) ) ( not ( = ?auto_699867 ?auto_699876 ) ) ( not ( = ?auto_699867 ?auto_699877 ) ) ( not ( = ?auto_699867 ?auto_699878 ) ) ( not ( = ?auto_699868 ?auto_699869 ) ) ( not ( = ?auto_699868 ?auto_699870 ) ) ( not ( = ?auto_699868 ?auto_699871 ) ) ( not ( = ?auto_699868 ?auto_699872 ) ) ( not ( = ?auto_699868 ?auto_699873 ) ) ( not ( = ?auto_699868 ?auto_699874 ) ) ( not ( = ?auto_699868 ?auto_699875 ) ) ( not ( = ?auto_699868 ?auto_699876 ) ) ( not ( = ?auto_699868 ?auto_699877 ) ) ( not ( = ?auto_699868 ?auto_699878 ) ) ( not ( = ?auto_699869 ?auto_699870 ) ) ( not ( = ?auto_699869 ?auto_699871 ) ) ( not ( = ?auto_699869 ?auto_699872 ) ) ( not ( = ?auto_699869 ?auto_699873 ) ) ( not ( = ?auto_699869 ?auto_699874 ) ) ( not ( = ?auto_699869 ?auto_699875 ) ) ( not ( = ?auto_699869 ?auto_699876 ) ) ( not ( = ?auto_699869 ?auto_699877 ) ) ( not ( = ?auto_699869 ?auto_699878 ) ) ( not ( = ?auto_699870 ?auto_699871 ) ) ( not ( = ?auto_699870 ?auto_699872 ) ) ( not ( = ?auto_699870 ?auto_699873 ) ) ( not ( = ?auto_699870 ?auto_699874 ) ) ( not ( = ?auto_699870 ?auto_699875 ) ) ( not ( = ?auto_699870 ?auto_699876 ) ) ( not ( = ?auto_699870 ?auto_699877 ) ) ( not ( = ?auto_699870 ?auto_699878 ) ) ( not ( = ?auto_699871 ?auto_699872 ) ) ( not ( = ?auto_699871 ?auto_699873 ) ) ( not ( = ?auto_699871 ?auto_699874 ) ) ( not ( = ?auto_699871 ?auto_699875 ) ) ( not ( = ?auto_699871 ?auto_699876 ) ) ( not ( = ?auto_699871 ?auto_699877 ) ) ( not ( = ?auto_699871 ?auto_699878 ) ) ( not ( = ?auto_699872 ?auto_699873 ) ) ( not ( = ?auto_699872 ?auto_699874 ) ) ( not ( = ?auto_699872 ?auto_699875 ) ) ( not ( = ?auto_699872 ?auto_699876 ) ) ( not ( = ?auto_699872 ?auto_699877 ) ) ( not ( = ?auto_699872 ?auto_699878 ) ) ( not ( = ?auto_699873 ?auto_699874 ) ) ( not ( = ?auto_699873 ?auto_699875 ) ) ( not ( = ?auto_699873 ?auto_699876 ) ) ( not ( = ?auto_699873 ?auto_699877 ) ) ( not ( = ?auto_699873 ?auto_699878 ) ) ( not ( = ?auto_699874 ?auto_699875 ) ) ( not ( = ?auto_699874 ?auto_699876 ) ) ( not ( = ?auto_699874 ?auto_699877 ) ) ( not ( = ?auto_699874 ?auto_699878 ) ) ( not ( = ?auto_699875 ?auto_699876 ) ) ( not ( = ?auto_699875 ?auto_699877 ) ) ( not ( = ?auto_699875 ?auto_699878 ) ) ( not ( = ?auto_699876 ?auto_699877 ) ) ( not ( = ?auto_699876 ?auto_699878 ) ) ( not ( = ?auto_699877 ?auto_699878 ) ) ( ON ?auto_699876 ?auto_699877 ) ( ON ?auto_699875 ?auto_699876 ) ( ON ?auto_699874 ?auto_699875 ) ( ON ?auto_699873 ?auto_699874 ) ( ON ?auto_699872 ?auto_699873 ) ( ON ?auto_699871 ?auto_699872 ) ( ON ?auto_699870 ?auto_699871 ) ( ON ?auto_699869 ?auto_699870 ) ( ON ?auto_699868 ?auto_699869 ) ( ON ?auto_699867 ?auto_699868 ) ( CLEAR ?auto_699865 ) ( ON ?auto_699866 ?auto_699867 ) ( CLEAR ?auto_699866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_699863 ?auto_699864 ?auto_699865 ?auto_699866 )
      ( MAKE-15PILE ?auto_699863 ?auto_699864 ?auto_699865 ?auto_699866 ?auto_699867 ?auto_699868 ?auto_699869 ?auto_699870 ?auto_699871 ?auto_699872 ?auto_699873 ?auto_699874 ?auto_699875 ?auto_699876 ?auto_699877 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699925 - BLOCK
      ?auto_699926 - BLOCK
      ?auto_699927 - BLOCK
      ?auto_699928 - BLOCK
      ?auto_699929 - BLOCK
      ?auto_699930 - BLOCK
      ?auto_699931 - BLOCK
      ?auto_699932 - BLOCK
      ?auto_699933 - BLOCK
      ?auto_699934 - BLOCK
      ?auto_699935 - BLOCK
      ?auto_699936 - BLOCK
      ?auto_699937 - BLOCK
      ?auto_699938 - BLOCK
      ?auto_699939 - BLOCK
    )
    :vars
    (
      ?auto_699940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_699939 ?auto_699940 ) ( ON-TABLE ?auto_699925 ) ( ON ?auto_699926 ?auto_699925 ) ( not ( = ?auto_699925 ?auto_699926 ) ) ( not ( = ?auto_699925 ?auto_699927 ) ) ( not ( = ?auto_699925 ?auto_699928 ) ) ( not ( = ?auto_699925 ?auto_699929 ) ) ( not ( = ?auto_699925 ?auto_699930 ) ) ( not ( = ?auto_699925 ?auto_699931 ) ) ( not ( = ?auto_699925 ?auto_699932 ) ) ( not ( = ?auto_699925 ?auto_699933 ) ) ( not ( = ?auto_699925 ?auto_699934 ) ) ( not ( = ?auto_699925 ?auto_699935 ) ) ( not ( = ?auto_699925 ?auto_699936 ) ) ( not ( = ?auto_699925 ?auto_699937 ) ) ( not ( = ?auto_699925 ?auto_699938 ) ) ( not ( = ?auto_699925 ?auto_699939 ) ) ( not ( = ?auto_699925 ?auto_699940 ) ) ( not ( = ?auto_699926 ?auto_699927 ) ) ( not ( = ?auto_699926 ?auto_699928 ) ) ( not ( = ?auto_699926 ?auto_699929 ) ) ( not ( = ?auto_699926 ?auto_699930 ) ) ( not ( = ?auto_699926 ?auto_699931 ) ) ( not ( = ?auto_699926 ?auto_699932 ) ) ( not ( = ?auto_699926 ?auto_699933 ) ) ( not ( = ?auto_699926 ?auto_699934 ) ) ( not ( = ?auto_699926 ?auto_699935 ) ) ( not ( = ?auto_699926 ?auto_699936 ) ) ( not ( = ?auto_699926 ?auto_699937 ) ) ( not ( = ?auto_699926 ?auto_699938 ) ) ( not ( = ?auto_699926 ?auto_699939 ) ) ( not ( = ?auto_699926 ?auto_699940 ) ) ( not ( = ?auto_699927 ?auto_699928 ) ) ( not ( = ?auto_699927 ?auto_699929 ) ) ( not ( = ?auto_699927 ?auto_699930 ) ) ( not ( = ?auto_699927 ?auto_699931 ) ) ( not ( = ?auto_699927 ?auto_699932 ) ) ( not ( = ?auto_699927 ?auto_699933 ) ) ( not ( = ?auto_699927 ?auto_699934 ) ) ( not ( = ?auto_699927 ?auto_699935 ) ) ( not ( = ?auto_699927 ?auto_699936 ) ) ( not ( = ?auto_699927 ?auto_699937 ) ) ( not ( = ?auto_699927 ?auto_699938 ) ) ( not ( = ?auto_699927 ?auto_699939 ) ) ( not ( = ?auto_699927 ?auto_699940 ) ) ( not ( = ?auto_699928 ?auto_699929 ) ) ( not ( = ?auto_699928 ?auto_699930 ) ) ( not ( = ?auto_699928 ?auto_699931 ) ) ( not ( = ?auto_699928 ?auto_699932 ) ) ( not ( = ?auto_699928 ?auto_699933 ) ) ( not ( = ?auto_699928 ?auto_699934 ) ) ( not ( = ?auto_699928 ?auto_699935 ) ) ( not ( = ?auto_699928 ?auto_699936 ) ) ( not ( = ?auto_699928 ?auto_699937 ) ) ( not ( = ?auto_699928 ?auto_699938 ) ) ( not ( = ?auto_699928 ?auto_699939 ) ) ( not ( = ?auto_699928 ?auto_699940 ) ) ( not ( = ?auto_699929 ?auto_699930 ) ) ( not ( = ?auto_699929 ?auto_699931 ) ) ( not ( = ?auto_699929 ?auto_699932 ) ) ( not ( = ?auto_699929 ?auto_699933 ) ) ( not ( = ?auto_699929 ?auto_699934 ) ) ( not ( = ?auto_699929 ?auto_699935 ) ) ( not ( = ?auto_699929 ?auto_699936 ) ) ( not ( = ?auto_699929 ?auto_699937 ) ) ( not ( = ?auto_699929 ?auto_699938 ) ) ( not ( = ?auto_699929 ?auto_699939 ) ) ( not ( = ?auto_699929 ?auto_699940 ) ) ( not ( = ?auto_699930 ?auto_699931 ) ) ( not ( = ?auto_699930 ?auto_699932 ) ) ( not ( = ?auto_699930 ?auto_699933 ) ) ( not ( = ?auto_699930 ?auto_699934 ) ) ( not ( = ?auto_699930 ?auto_699935 ) ) ( not ( = ?auto_699930 ?auto_699936 ) ) ( not ( = ?auto_699930 ?auto_699937 ) ) ( not ( = ?auto_699930 ?auto_699938 ) ) ( not ( = ?auto_699930 ?auto_699939 ) ) ( not ( = ?auto_699930 ?auto_699940 ) ) ( not ( = ?auto_699931 ?auto_699932 ) ) ( not ( = ?auto_699931 ?auto_699933 ) ) ( not ( = ?auto_699931 ?auto_699934 ) ) ( not ( = ?auto_699931 ?auto_699935 ) ) ( not ( = ?auto_699931 ?auto_699936 ) ) ( not ( = ?auto_699931 ?auto_699937 ) ) ( not ( = ?auto_699931 ?auto_699938 ) ) ( not ( = ?auto_699931 ?auto_699939 ) ) ( not ( = ?auto_699931 ?auto_699940 ) ) ( not ( = ?auto_699932 ?auto_699933 ) ) ( not ( = ?auto_699932 ?auto_699934 ) ) ( not ( = ?auto_699932 ?auto_699935 ) ) ( not ( = ?auto_699932 ?auto_699936 ) ) ( not ( = ?auto_699932 ?auto_699937 ) ) ( not ( = ?auto_699932 ?auto_699938 ) ) ( not ( = ?auto_699932 ?auto_699939 ) ) ( not ( = ?auto_699932 ?auto_699940 ) ) ( not ( = ?auto_699933 ?auto_699934 ) ) ( not ( = ?auto_699933 ?auto_699935 ) ) ( not ( = ?auto_699933 ?auto_699936 ) ) ( not ( = ?auto_699933 ?auto_699937 ) ) ( not ( = ?auto_699933 ?auto_699938 ) ) ( not ( = ?auto_699933 ?auto_699939 ) ) ( not ( = ?auto_699933 ?auto_699940 ) ) ( not ( = ?auto_699934 ?auto_699935 ) ) ( not ( = ?auto_699934 ?auto_699936 ) ) ( not ( = ?auto_699934 ?auto_699937 ) ) ( not ( = ?auto_699934 ?auto_699938 ) ) ( not ( = ?auto_699934 ?auto_699939 ) ) ( not ( = ?auto_699934 ?auto_699940 ) ) ( not ( = ?auto_699935 ?auto_699936 ) ) ( not ( = ?auto_699935 ?auto_699937 ) ) ( not ( = ?auto_699935 ?auto_699938 ) ) ( not ( = ?auto_699935 ?auto_699939 ) ) ( not ( = ?auto_699935 ?auto_699940 ) ) ( not ( = ?auto_699936 ?auto_699937 ) ) ( not ( = ?auto_699936 ?auto_699938 ) ) ( not ( = ?auto_699936 ?auto_699939 ) ) ( not ( = ?auto_699936 ?auto_699940 ) ) ( not ( = ?auto_699937 ?auto_699938 ) ) ( not ( = ?auto_699937 ?auto_699939 ) ) ( not ( = ?auto_699937 ?auto_699940 ) ) ( not ( = ?auto_699938 ?auto_699939 ) ) ( not ( = ?auto_699938 ?auto_699940 ) ) ( not ( = ?auto_699939 ?auto_699940 ) ) ( ON ?auto_699938 ?auto_699939 ) ( ON ?auto_699937 ?auto_699938 ) ( ON ?auto_699936 ?auto_699937 ) ( ON ?auto_699935 ?auto_699936 ) ( ON ?auto_699934 ?auto_699935 ) ( ON ?auto_699933 ?auto_699934 ) ( ON ?auto_699932 ?auto_699933 ) ( ON ?auto_699931 ?auto_699932 ) ( ON ?auto_699930 ?auto_699931 ) ( ON ?auto_699929 ?auto_699930 ) ( ON ?auto_699928 ?auto_699929 ) ( CLEAR ?auto_699926 ) ( ON ?auto_699927 ?auto_699928 ) ( CLEAR ?auto_699927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_699925 ?auto_699926 ?auto_699927 )
      ( MAKE-15PILE ?auto_699925 ?auto_699926 ?auto_699927 ?auto_699928 ?auto_699929 ?auto_699930 ?auto_699931 ?auto_699932 ?auto_699933 ?auto_699934 ?auto_699935 ?auto_699936 ?auto_699937 ?auto_699938 ?auto_699939 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_699987 - BLOCK
      ?auto_699988 - BLOCK
      ?auto_699989 - BLOCK
      ?auto_699990 - BLOCK
      ?auto_699991 - BLOCK
      ?auto_699992 - BLOCK
      ?auto_699993 - BLOCK
      ?auto_699994 - BLOCK
      ?auto_699995 - BLOCK
      ?auto_699996 - BLOCK
      ?auto_699997 - BLOCK
      ?auto_699998 - BLOCK
      ?auto_699999 - BLOCK
      ?auto_700000 - BLOCK
      ?auto_700001 - BLOCK
    )
    :vars
    (
      ?auto_700002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700001 ?auto_700002 ) ( ON-TABLE ?auto_699987 ) ( not ( = ?auto_699987 ?auto_699988 ) ) ( not ( = ?auto_699987 ?auto_699989 ) ) ( not ( = ?auto_699987 ?auto_699990 ) ) ( not ( = ?auto_699987 ?auto_699991 ) ) ( not ( = ?auto_699987 ?auto_699992 ) ) ( not ( = ?auto_699987 ?auto_699993 ) ) ( not ( = ?auto_699987 ?auto_699994 ) ) ( not ( = ?auto_699987 ?auto_699995 ) ) ( not ( = ?auto_699987 ?auto_699996 ) ) ( not ( = ?auto_699987 ?auto_699997 ) ) ( not ( = ?auto_699987 ?auto_699998 ) ) ( not ( = ?auto_699987 ?auto_699999 ) ) ( not ( = ?auto_699987 ?auto_700000 ) ) ( not ( = ?auto_699987 ?auto_700001 ) ) ( not ( = ?auto_699987 ?auto_700002 ) ) ( not ( = ?auto_699988 ?auto_699989 ) ) ( not ( = ?auto_699988 ?auto_699990 ) ) ( not ( = ?auto_699988 ?auto_699991 ) ) ( not ( = ?auto_699988 ?auto_699992 ) ) ( not ( = ?auto_699988 ?auto_699993 ) ) ( not ( = ?auto_699988 ?auto_699994 ) ) ( not ( = ?auto_699988 ?auto_699995 ) ) ( not ( = ?auto_699988 ?auto_699996 ) ) ( not ( = ?auto_699988 ?auto_699997 ) ) ( not ( = ?auto_699988 ?auto_699998 ) ) ( not ( = ?auto_699988 ?auto_699999 ) ) ( not ( = ?auto_699988 ?auto_700000 ) ) ( not ( = ?auto_699988 ?auto_700001 ) ) ( not ( = ?auto_699988 ?auto_700002 ) ) ( not ( = ?auto_699989 ?auto_699990 ) ) ( not ( = ?auto_699989 ?auto_699991 ) ) ( not ( = ?auto_699989 ?auto_699992 ) ) ( not ( = ?auto_699989 ?auto_699993 ) ) ( not ( = ?auto_699989 ?auto_699994 ) ) ( not ( = ?auto_699989 ?auto_699995 ) ) ( not ( = ?auto_699989 ?auto_699996 ) ) ( not ( = ?auto_699989 ?auto_699997 ) ) ( not ( = ?auto_699989 ?auto_699998 ) ) ( not ( = ?auto_699989 ?auto_699999 ) ) ( not ( = ?auto_699989 ?auto_700000 ) ) ( not ( = ?auto_699989 ?auto_700001 ) ) ( not ( = ?auto_699989 ?auto_700002 ) ) ( not ( = ?auto_699990 ?auto_699991 ) ) ( not ( = ?auto_699990 ?auto_699992 ) ) ( not ( = ?auto_699990 ?auto_699993 ) ) ( not ( = ?auto_699990 ?auto_699994 ) ) ( not ( = ?auto_699990 ?auto_699995 ) ) ( not ( = ?auto_699990 ?auto_699996 ) ) ( not ( = ?auto_699990 ?auto_699997 ) ) ( not ( = ?auto_699990 ?auto_699998 ) ) ( not ( = ?auto_699990 ?auto_699999 ) ) ( not ( = ?auto_699990 ?auto_700000 ) ) ( not ( = ?auto_699990 ?auto_700001 ) ) ( not ( = ?auto_699990 ?auto_700002 ) ) ( not ( = ?auto_699991 ?auto_699992 ) ) ( not ( = ?auto_699991 ?auto_699993 ) ) ( not ( = ?auto_699991 ?auto_699994 ) ) ( not ( = ?auto_699991 ?auto_699995 ) ) ( not ( = ?auto_699991 ?auto_699996 ) ) ( not ( = ?auto_699991 ?auto_699997 ) ) ( not ( = ?auto_699991 ?auto_699998 ) ) ( not ( = ?auto_699991 ?auto_699999 ) ) ( not ( = ?auto_699991 ?auto_700000 ) ) ( not ( = ?auto_699991 ?auto_700001 ) ) ( not ( = ?auto_699991 ?auto_700002 ) ) ( not ( = ?auto_699992 ?auto_699993 ) ) ( not ( = ?auto_699992 ?auto_699994 ) ) ( not ( = ?auto_699992 ?auto_699995 ) ) ( not ( = ?auto_699992 ?auto_699996 ) ) ( not ( = ?auto_699992 ?auto_699997 ) ) ( not ( = ?auto_699992 ?auto_699998 ) ) ( not ( = ?auto_699992 ?auto_699999 ) ) ( not ( = ?auto_699992 ?auto_700000 ) ) ( not ( = ?auto_699992 ?auto_700001 ) ) ( not ( = ?auto_699992 ?auto_700002 ) ) ( not ( = ?auto_699993 ?auto_699994 ) ) ( not ( = ?auto_699993 ?auto_699995 ) ) ( not ( = ?auto_699993 ?auto_699996 ) ) ( not ( = ?auto_699993 ?auto_699997 ) ) ( not ( = ?auto_699993 ?auto_699998 ) ) ( not ( = ?auto_699993 ?auto_699999 ) ) ( not ( = ?auto_699993 ?auto_700000 ) ) ( not ( = ?auto_699993 ?auto_700001 ) ) ( not ( = ?auto_699993 ?auto_700002 ) ) ( not ( = ?auto_699994 ?auto_699995 ) ) ( not ( = ?auto_699994 ?auto_699996 ) ) ( not ( = ?auto_699994 ?auto_699997 ) ) ( not ( = ?auto_699994 ?auto_699998 ) ) ( not ( = ?auto_699994 ?auto_699999 ) ) ( not ( = ?auto_699994 ?auto_700000 ) ) ( not ( = ?auto_699994 ?auto_700001 ) ) ( not ( = ?auto_699994 ?auto_700002 ) ) ( not ( = ?auto_699995 ?auto_699996 ) ) ( not ( = ?auto_699995 ?auto_699997 ) ) ( not ( = ?auto_699995 ?auto_699998 ) ) ( not ( = ?auto_699995 ?auto_699999 ) ) ( not ( = ?auto_699995 ?auto_700000 ) ) ( not ( = ?auto_699995 ?auto_700001 ) ) ( not ( = ?auto_699995 ?auto_700002 ) ) ( not ( = ?auto_699996 ?auto_699997 ) ) ( not ( = ?auto_699996 ?auto_699998 ) ) ( not ( = ?auto_699996 ?auto_699999 ) ) ( not ( = ?auto_699996 ?auto_700000 ) ) ( not ( = ?auto_699996 ?auto_700001 ) ) ( not ( = ?auto_699996 ?auto_700002 ) ) ( not ( = ?auto_699997 ?auto_699998 ) ) ( not ( = ?auto_699997 ?auto_699999 ) ) ( not ( = ?auto_699997 ?auto_700000 ) ) ( not ( = ?auto_699997 ?auto_700001 ) ) ( not ( = ?auto_699997 ?auto_700002 ) ) ( not ( = ?auto_699998 ?auto_699999 ) ) ( not ( = ?auto_699998 ?auto_700000 ) ) ( not ( = ?auto_699998 ?auto_700001 ) ) ( not ( = ?auto_699998 ?auto_700002 ) ) ( not ( = ?auto_699999 ?auto_700000 ) ) ( not ( = ?auto_699999 ?auto_700001 ) ) ( not ( = ?auto_699999 ?auto_700002 ) ) ( not ( = ?auto_700000 ?auto_700001 ) ) ( not ( = ?auto_700000 ?auto_700002 ) ) ( not ( = ?auto_700001 ?auto_700002 ) ) ( ON ?auto_700000 ?auto_700001 ) ( ON ?auto_699999 ?auto_700000 ) ( ON ?auto_699998 ?auto_699999 ) ( ON ?auto_699997 ?auto_699998 ) ( ON ?auto_699996 ?auto_699997 ) ( ON ?auto_699995 ?auto_699996 ) ( ON ?auto_699994 ?auto_699995 ) ( ON ?auto_699993 ?auto_699994 ) ( ON ?auto_699992 ?auto_699993 ) ( ON ?auto_699991 ?auto_699992 ) ( ON ?auto_699990 ?auto_699991 ) ( ON ?auto_699989 ?auto_699990 ) ( CLEAR ?auto_699987 ) ( ON ?auto_699988 ?auto_699989 ) ( CLEAR ?auto_699988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_699987 ?auto_699988 )
      ( MAKE-15PILE ?auto_699987 ?auto_699988 ?auto_699989 ?auto_699990 ?auto_699991 ?auto_699992 ?auto_699993 ?auto_699994 ?auto_699995 ?auto_699996 ?auto_699997 ?auto_699998 ?auto_699999 ?auto_700000 ?auto_700001 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_700049 - BLOCK
      ?auto_700050 - BLOCK
      ?auto_700051 - BLOCK
      ?auto_700052 - BLOCK
      ?auto_700053 - BLOCK
      ?auto_700054 - BLOCK
      ?auto_700055 - BLOCK
      ?auto_700056 - BLOCK
      ?auto_700057 - BLOCK
      ?auto_700058 - BLOCK
      ?auto_700059 - BLOCK
      ?auto_700060 - BLOCK
      ?auto_700061 - BLOCK
      ?auto_700062 - BLOCK
      ?auto_700063 - BLOCK
    )
    :vars
    (
      ?auto_700064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700063 ?auto_700064 ) ( not ( = ?auto_700049 ?auto_700050 ) ) ( not ( = ?auto_700049 ?auto_700051 ) ) ( not ( = ?auto_700049 ?auto_700052 ) ) ( not ( = ?auto_700049 ?auto_700053 ) ) ( not ( = ?auto_700049 ?auto_700054 ) ) ( not ( = ?auto_700049 ?auto_700055 ) ) ( not ( = ?auto_700049 ?auto_700056 ) ) ( not ( = ?auto_700049 ?auto_700057 ) ) ( not ( = ?auto_700049 ?auto_700058 ) ) ( not ( = ?auto_700049 ?auto_700059 ) ) ( not ( = ?auto_700049 ?auto_700060 ) ) ( not ( = ?auto_700049 ?auto_700061 ) ) ( not ( = ?auto_700049 ?auto_700062 ) ) ( not ( = ?auto_700049 ?auto_700063 ) ) ( not ( = ?auto_700049 ?auto_700064 ) ) ( not ( = ?auto_700050 ?auto_700051 ) ) ( not ( = ?auto_700050 ?auto_700052 ) ) ( not ( = ?auto_700050 ?auto_700053 ) ) ( not ( = ?auto_700050 ?auto_700054 ) ) ( not ( = ?auto_700050 ?auto_700055 ) ) ( not ( = ?auto_700050 ?auto_700056 ) ) ( not ( = ?auto_700050 ?auto_700057 ) ) ( not ( = ?auto_700050 ?auto_700058 ) ) ( not ( = ?auto_700050 ?auto_700059 ) ) ( not ( = ?auto_700050 ?auto_700060 ) ) ( not ( = ?auto_700050 ?auto_700061 ) ) ( not ( = ?auto_700050 ?auto_700062 ) ) ( not ( = ?auto_700050 ?auto_700063 ) ) ( not ( = ?auto_700050 ?auto_700064 ) ) ( not ( = ?auto_700051 ?auto_700052 ) ) ( not ( = ?auto_700051 ?auto_700053 ) ) ( not ( = ?auto_700051 ?auto_700054 ) ) ( not ( = ?auto_700051 ?auto_700055 ) ) ( not ( = ?auto_700051 ?auto_700056 ) ) ( not ( = ?auto_700051 ?auto_700057 ) ) ( not ( = ?auto_700051 ?auto_700058 ) ) ( not ( = ?auto_700051 ?auto_700059 ) ) ( not ( = ?auto_700051 ?auto_700060 ) ) ( not ( = ?auto_700051 ?auto_700061 ) ) ( not ( = ?auto_700051 ?auto_700062 ) ) ( not ( = ?auto_700051 ?auto_700063 ) ) ( not ( = ?auto_700051 ?auto_700064 ) ) ( not ( = ?auto_700052 ?auto_700053 ) ) ( not ( = ?auto_700052 ?auto_700054 ) ) ( not ( = ?auto_700052 ?auto_700055 ) ) ( not ( = ?auto_700052 ?auto_700056 ) ) ( not ( = ?auto_700052 ?auto_700057 ) ) ( not ( = ?auto_700052 ?auto_700058 ) ) ( not ( = ?auto_700052 ?auto_700059 ) ) ( not ( = ?auto_700052 ?auto_700060 ) ) ( not ( = ?auto_700052 ?auto_700061 ) ) ( not ( = ?auto_700052 ?auto_700062 ) ) ( not ( = ?auto_700052 ?auto_700063 ) ) ( not ( = ?auto_700052 ?auto_700064 ) ) ( not ( = ?auto_700053 ?auto_700054 ) ) ( not ( = ?auto_700053 ?auto_700055 ) ) ( not ( = ?auto_700053 ?auto_700056 ) ) ( not ( = ?auto_700053 ?auto_700057 ) ) ( not ( = ?auto_700053 ?auto_700058 ) ) ( not ( = ?auto_700053 ?auto_700059 ) ) ( not ( = ?auto_700053 ?auto_700060 ) ) ( not ( = ?auto_700053 ?auto_700061 ) ) ( not ( = ?auto_700053 ?auto_700062 ) ) ( not ( = ?auto_700053 ?auto_700063 ) ) ( not ( = ?auto_700053 ?auto_700064 ) ) ( not ( = ?auto_700054 ?auto_700055 ) ) ( not ( = ?auto_700054 ?auto_700056 ) ) ( not ( = ?auto_700054 ?auto_700057 ) ) ( not ( = ?auto_700054 ?auto_700058 ) ) ( not ( = ?auto_700054 ?auto_700059 ) ) ( not ( = ?auto_700054 ?auto_700060 ) ) ( not ( = ?auto_700054 ?auto_700061 ) ) ( not ( = ?auto_700054 ?auto_700062 ) ) ( not ( = ?auto_700054 ?auto_700063 ) ) ( not ( = ?auto_700054 ?auto_700064 ) ) ( not ( = ?auto_700055 ?auto_700056 ) ) ( not ( = ?auto_700055 ?auto_700057 ) ) ( not ( = ?auto_700055 ?auto_700058 ) ) ( not ( = ?auto_700055 ?auto_700059 ) ) ( not ( = ?auto_700055 ?auto_700060 ) ) ( not ( = ?auto_700055 ?auto_700061 ) ) ( not ( = ?auto_700055 ?auto_700062 ) ) ( not ( = ?auto_700055 ?auto_700063 ) ) ( not ( = ?auto_700055 ?auto_700064 ) ) ( not ( = ?auto_700056 ?auto_700057 ) ) ( not ( = ?auto_700056 ?auto_700058 ) ) ( not ( = ?auto_700056 ?auto_700059 ) ) ( not ( = ?auto_700056 ?auto_700060 ) ) ( not ( = ?auto_700056 ?auto_700061 ) ) ( not ( = ?auto_700056 ?auto_700062 ) ) ( not ( = ?auto_700056 ?auto_700063 ) ) ( not ( = ?auto_700056 ?auto_700064 ) ) ( not ( = ?auto_700057 ?auto_700058 ) ) ( not ( = ?auto_700057 ?auto_700059 ) ) ( not ( = ?auto_700057 ?auto_700060 ) ) ( not ( = ?auto_700057 ?auto_700061 ) ) ( not ( = ?auto_700057 ?auto_700062 ) ) ( not ( = ?auto_700057 ?auto_700063 ) ) ( not ( = ?auto_700057 ?auto_700064 ) ) ( not ( = ?auto_700058 ?auto_700059 ) ) ( not ( = ?auto_700058 ?auto_700060 ) ) ( not ( = ?auto_700058 ?auto_700061 ) ) ( not ( = ?auto_700058 ?auto_700062 ) ) ( not ( = ?auto_700058 ?auto_700063 ) ) ( not ( = ?auto_700058 ?auto_700064 ) ) ( not ( = ?auto_700059 ?auto_700060 ) ) ( not ( = ?auto_700059 ?auto_700061 ) ) ( not ( = ?auto_700059 ?auto_700062 ) ) ( not ( = ?auto_700059 ?auto_700063 ) ) ( not ( = ?auto_700059 ?auto_700064 ) ) ( not ( = ?auto_700060 ?auto_700061 ) ) ( not ( = ?auto_700060 ?auto_700062 ) ) ( not ( = ?auto_700060 ?auto_700063 ) ) ( not ( = ?auto_700060 ?auto_700064 ) ) ( not ( = ?auto_700061 ?auto_700062 ) ) ( not ( = ?auto_700061 ?auto_700063 ) ) ( not ( = ?auto_700061 ?auto_700064 ) ) ( not ( = ?auto_700062 ?auto_700063 ) ) ( not ( = ?auto_700062 ?auto_700064 ) ) ( not ( = ?auto_700063 ?auto_700064 ) ) ( ON ?auto_700062 ?auto_700063 ) ( ON ?auto_700061 ?auto_700062 ) ( ON ?auto_700060 ?auto_700061 ) ( ON ?auto_700059 ?auto_700060 ) ( ON ?auto_700058 ?auto_700059 ) ( ON ?auto_700057 ?auto_700058 ) ( ON ?auto_700056 ?auto_700057 ) ( ON ?auto_700055 ?auto_700056 ) ( ON ?auto_700054 ?auto_700055 ) ( ON ?auto_700053 ?auto_700054 ) ( ON ?auto_700052 ?auto_700053 ) ( ON ?auto_700051 ?auto_700052 ) ( ON ?auto_700050 ?auto_700051 ) ( ON ?auto_700049 ?auto_700050 ) ( CLEAR ?auto_700049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_700049 )
      ( MAKE-15PILE ?auto_700049 ?auto_700050 ?auto_700051 ?auto_700052 ?auto_700053 ?auto_700054 ?auto_700055 ?auto_700056 ?auto_700057 ?auto_700058 ?auto_700059 ?auto_700060 ?auto_700061 ?auto_700062 ?auto_700063 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700112 - BLOCK
      ?auto_700113 - BLOCK
      ?auto_700114 - BLOCK
      ?auto_700115 - BLOCK
      ?auto_700116 - BLOCK
      ?auto_700117 - BLOCK
      ?auto_700118 - BLOCK
      ?auto_700119 - BLOCK
      ?auto_700120 - BLOCK
      ?auto_700121 - BLOCK
      ?auto_700122 - BLOCK
      ?auto_700123 - BLOCK
      ?auto_700124 - BLOCK
      ?auto_700125 - BLOCK
      ?auto_700126 - BLOCK
      ?auto_700127 - BLOCK
    )
    :vars
    (
      ?auto_700128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_700126 ) ( ON ?auto_700127 ?auto_700128 ) ( CLEAR ?auto_700127 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_700112 ) ( ON ?auto_700113 ?auto_700112 ) ( ON ?auto_700114 ?auto_700113 ) ( ON ?auto_700115 ?auto_700114 ) ( ON ?auto_700116 ?auto_700115 ) ( ON ?auto_700117 ?auto_700116 ) ( ON ?auto_700118 ?auto_700117 ) ( ON ?auto_700119 ?auto_700118 ) ( ON ?auto_700120 ?auto_700119 ) ( ON ?auto_700121 ?auto_700120 ) ( ON ?auto_700122 ?auto_700121 ) ( ON ?auto_700123 ?auto_700122 ) ( ON ?auto_700124 ?auto_700123 ) ( ON ?auto_700125 ?auto_700124 ) ( ON ?auto_700126 ?auto_700125 ) ( not ( = ?auto_700112 ?auto_700113 ) ) ( not ( = ?auto_700112 ?auto_700114 ) ) ( not ( = ?auto_700112 ?auto_700115 ) ) ( not ( = ?auto_700112 ?auto_700116 ) ) ( not ( = ?auto_700112 ?auto_700117 ) ) ( not ( = ?auto_700112 ?auto_700118 ) ) ( not ( = ?auto_700112 ?auto_700119 ) ) ( not ( = ?auto_700112 ?auto_700120 ) ) ( not ( = ?auto_700112 ?auto_700121 ) ) ( not ( = ?auto_700112 ?auto_700122 ) ) ( not ( = ?auto_700112 ?auto_700123 ) ) ( not ( = ?auto_700112 ?auto_700124 ) ) ( not ( = ?auto_700112 ?auto_700125 ) ) ( not ( = ?auto_700112 ?auto_700126 ) ) ( not ( = ?auto_700112 ?auto_700127 ) ) ( not ( = ?auto_700112 ?auto_700128 ) ) ( not ( = ?auto_700113 ?auto_700114 ) ) ( not ( = ?auto_700113 ?auto_700115 ) ) ( not ( = ?auto_700113 ?auto_700116 ) ) ( not ( = ?auto_700113 ?auto_700117 ) ) ( not ( = ?auto_700113 ?auto_700118 ) ) ( not ( = ?auto_700113 ?auto_700119 ) ) ( not ( = ?auto_700113 ?auto_700120 ) ) ( not ( = ?auto_700113 ?auto_700121 ) ) ( not ( = ?auto_700113 ?auto_700122 ) ) ( not ( = ?auto_700113 ?auto_700123 ) ) ( not ( = ?auto_700113 ?auto_700124 ) ) ( not ( = ?auto_700113 ?auto_700125 ) ) ( not ( = ?auto_700113 ?auto_700126 ) ) ( not ( = ?auto_700113 ?auto_700127 ) ) ( not ( = ?auto_700113 ?auto_700128 ) ) ( not ( = ?auto_700114 ?auto_700115 ) ) ( not ( = ?auto_700114 ?auto_700116 ) ) ( not ( = ?auto_700114 ?auto_700117 ) ) ( not ( = ?auto_700114 ?auto_700118 ) ) ( not ( = ?auto_700114 ?auto_700119 ) ) ( not ( = ?auto_700114 ?auto_700120 ) ) ( not ( = ?auto_700114 ?auto_700121 ) ) ( not ( = ?auto_700114 ?auto_700122 ) ) ( not ( = ?auto_700114 ?auto_700123 ) ) ( not ( = ?auto_700114 ?auto_700124 ) ) ( not ( = ?auto_700114 ?auto_700125 ) ) ( not ( = ?auto_700114 ?auto_700126 ) ) ( not ( = ?auto_700114 ?auto_700127 ) ) ( not ( = ?auto_700114 ?auto_700128 ) ) ( not ( = ?auto_700115 ?auto_700116 ) ) ( not ( = ?auto_700115 ?auto_700117 ) ) ( not ( = ?auto_700115 ?auto_700118 ) ) ( not ( = ?auto_700115 ?auto_700119 ) ) ( not ( = ?auto_700115 ?auto_700120 ) ) ( not ( = ?auto_700115 ?auto_700121 ) ) ( not ( = ?auto_700115 ?auto_700122 ) ) ( not ( = ?auto_700115 ?auto_700123 ) ) ( not ( = ?auto_700115 ?auto_700124 ) ) ( not ( = ?auto_700115 ?auto_700125 ) ) ( not ( = ?auto_700115 ?auto_700126 ) ) ( not ( = ?auto_700115 ?auto_700127 ) ) ( not ( = ?auto_700115 ?auto_700128 ) ) ( not ( = ?auto_700116 ?auto_700117 ) ) ( not ( = ?auto_700116 ?auto_700118 ) ) ( not ( = ?auto_700116 ?auto_700119 ) ) ( not ( = ?auto_700116 ?auto_700120 ) ) ( not ( = ?auto_700116 ?auto_700121 ) ) ( not ( = ?auto_700116 ?auto_700122 ) ) ( not ( = ?auto_700116 ?auto_700123 ) ) ( not ( = ?auto_700116 ?auto_700124 ) ) ( not ( = ?auto_700116 ?auto_700125 ) ) ( not ( = ?auto_700116 ?auto_700126 ) ) ( not ( = ?auto_700116 ?auto_700127 ) ) ( not ( = ?auto_700116 ?auto_700128 ) ) ( not ( = ?auto_700117 ?auto_700118 ) ) ( not ( = ?auto_700117 ?auto_700119 ) ) ( not ( = ?auto_700117 ?auto_700120 ) ) ( not ( = ?auto_700117 ?auto_700121 ) ) ( not ( = ?auto_700117 ?auto_700122 ) ) ( not ( = ?auto_700117 ?auto_700123 ) ) ( not ( = ?auto_700117 ?auto_700124 ) ) ( not ( = ?auto_700117 ?auto_700125 ) ) ( not ( = ?auto_700117 ?auto_700126 ) ) ( not ( = ?auto_700117 ?auto_700127 ) ) ( not ( = ?auto_700117 ?auto_700128 ) ) ( not ( = ?auto_700118 ?auto_700119 ) ) ( not ( = ?auto_700118 ?auto_700120 ) ) ( not ( = ?auto_700118 ?auto_700121 ) ) ( not ( = ?auto_700118 ?auto_700122 ) ) ( not ( = ?auto_700118 ?auto_700123 ) ) ( not ( = ?auto_700118 ?auto_700124 ) ) ( not ( = ?auto_700118 ?auto_700125 ) ) ( not ( = ?auto_700118 ?auto_700126 ) ) ( not ( = ?auto_700118 ?auto_700127 ) ) ( not ( = ?auto_700118 ?auto_700128 ) ) ( not ( = ?auto_700119 ?auto_700120 ) ) ( not ( = ?auto_700119 ?auto_700121 ) ) ( not ( = ?auto_700119 ?auto_700122 ) ) ( not ( = ?auto_700119 ?auto_700123 ) ) ( not ( = ?auto_700119 ?auto_700124 ) ) ( not ( = ?auto_700119 ?auto_700125 ) ) ( not ( = ?auto_700119 ?auto_700126 ) ) ( not ( = ?auto_700119 ?auto_700127 ) ) ( not ( = ?auto_700119 ?auto_700128 ) ) ( not ( = ?auto_700120 ?auto_700121 ) ) ( not ( = ?auto_700120 ?auto_700122 ) ) ( not ( = ?auto_700120 ?auto_700123 ) ) ( not ( = ?auto_700120 ?auto_700124 ) ) ( not ( = ?auto_700120 ?auto_700125 ) ) ( not ( = ?auto_700120 ?auto_700126 ) ) ( not ( = ?auto_700120 ?auto_700127 ) ) ( not ( = ?auto_700120 ?auto_700128 ) ) ( not ( = ?auto_700121 ?auto_700122 ) ) ( not ( = ?auto_700121 ?auto_700123 ) ) ( not ( = ?auto_700121 ?auto_700124 ) ) ( not ( = ?auto_700121 ?auto_700125 ) ) ( not ( = ?auto_700121 ?auto_700126 ) ) ( not ( = ?auto_700121 ?auto_700127 ) ) ( not ( = ?auto_700121 ?auto_700128 ) ) ( not ( = ?auto_700122 ?auto_700123 ) ) ( not ( = ?auto_700122 ?auto_700124 ) ) ( not ( = ?auto_700122 ?auto_700125 ) ) ( not ( = ?auto_700122 ?auto_700126 ) ) ( not ( = ?auto_700122 ?auto_700127 ) ) ( not ( = ?auto_700122 ?auto_700128 ) ) ( not ( = ?auto_700123 ?auto_700124 ) ) ( not ( = ?auto_700123 ?auto_700125 ) ) ( not ( = ?auto_700123 ?auto_700126 ) ) ( not ( = ?auto_700123 ?auto_700127 ) ) ( not ( = ?auto_700123 ?auto_700128 ) ) ( not ( = ?auto_700124 ?auto_700125 ) ) ( not ( = ?auto_700124 ?auto_700126 ) ) ( not ( = ?auto_700124 ?auto_700127 ) ) ( not ( = ?auto_700124 ?auto_700128 ) ) ( not ( = ?auto_700125 ?auto_700126 ) ) ( not ( = ?auto_700125 ?auto_700127 ) ) ( not ( = ?auto_700125 ?auto_700128 ) ) ( not ( = ?auto_700126 ?auto_700127 ) ) ( not ( = ?auto_700126 ?auto_700128 ) ) ( not ( = ?auto_700127 ?auto_700128 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_700127 ?auto_700128 )
      ( !STACK ?auto_700127 ?auto_700126 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700178 - BLOCK
      ?auto_700179 - BLOCK
      ?auto_700180 - BLOCK
      ?auto_700181 - BLOCK
      ?auto_700182 - BLOCK
      ?auto_700183 - BLOCK
      ?auto_700184 - BLOCK
      ?auto_700185 - BLOCK
      ?auto_700186 - BLOCK
      ?auto_700187 - BLOCK
      ?auto_700188 - BLOCK
      ?auto_700189 - BLOCK
      ?auto_700190 - BLOCK
      ?auto_700191 - BLOCK
      ?auto_700192 - BLOCK
      ?auto_700193 - BLOCK
    )
    :vars
    (
      ?auto_700194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700193 ?auto_700194 ) ( ON-TABLE ?auto_700178 ) ( ON ?auto_700179 ?auto_700178 ) ( ON ?auto_700180 ?auto_700179 ) ( ON ?auto_700181 ?auto_700180 ) ( ON ?auto_700182 ?auto_700181 ) ( ON ?auto_700183 ?auto_700182 ) ( ON ?auto_700184 ?auto_700183 ) ( ON ?auto_700185 ?auto_700184 ) ( ON ?auto_700186 ?auto_700185 ) ( ON ?auto_700187 ?auto_700186 ) ( ON ?auto_700188 ?auto_700187 ) ( ON ?auto_700189 ?auto_700188 ) ( ON ?auto_700190 ?auto_700189 ) ( ON ?auto_700191 ?auto_700190 ) ( not ( = ?auto_700178 ?auto_700179 ) ) ( not ( = ?auto_700178 ?auto_700180 ) ) ( not ( = ?auto_700178 ?auto_700181 ) ) ( not ( = ?auto_700178 ?auto_700182 ) ) ( not ( = ?auto_700178 ?auto_700183 ) ) ( not ( = ?auto_700178 ?auto_700184 ) ) ( not ( = ?auto_700178 ?auto_700185 ) ) ( not ( = ?auto_700178 ?auto_700186 ) ) ( not ( = ?auto_700178 ?auto_700187 ) ) ( not ( = ?auto_700178 ?auto_700188 ) ) ( not ( = ?auto_700178 ?auto_700189 ) ) ( not ( = ?auto_700178 ?auto_700190 ) ) ( not ( = ?auto_700178 ?auto_700191 ) ) ( not ( = ?auto_700178 ?auto_700192 ) ) ( not ( = ?auto_700178 ?auto_700193 ) ) ( not ( = ?auto_700178 ?auto_700194 ) ) ( not ( = ?auto_700179 ?auto_700180 ) ) ( not ( = ?auto_700179 ?auto_700181 ) ) ( not ( = ?auto_700179 ?auto_700182 ) ) ( not ( = ?auto_700179 ?auto_700183 ) ) ( not ( = ?auto_700179 ?auto_700184 ) ) ( not ( = ?auto_700179 ?auto_700185 ) ) ( not ( = ?auto_700179 ?auto_700186 ) ) ( not ( = ?auto_700179 ?auto_700187 ) ) ( not ( = ?auto_700179 ?auto_700188 ) ) ( not ( = ?auto_700179 ?auto_700189 ) ) ( not ( = ?auto_700179 ?auto_700190 ) ) ( not ( = ?auto_700179 ?auto_700191 ) ) ( not ( = ?auto_700179 ?auto_700192 ) ) ( not ( = ?auto_700179 ?auto_700193 ) ) ( not ( = ?auto_700179 ?auto_700194 ) ) ( not ( = ?auto_700180 ?auto_700181 ) ) ( not ( = ?auto_700180 ?auto_700182 ) ) ( not ( = ?auto_700180 ?auto_700183 ) ) ( not ( = ?auto_700180 ?auto_700184 ) ) ( not ( = ?auto_700180 ?auto_700185 ) ) ( not ( = ?auto_700180 ?auto_700186 ) ) ( not ( = ?auto_700180 ?auto_700187 ) ) ( not ( = ?auto_700180 ?auto_700188 ) ) ( not ( = ?auto_700180 ?auto_700189 ) ) ( not ( = ?auto_700180 ?auto_700190 ) ) ( not ( = ?auto_700180 ?auto_700191 ) ) ( not ( = ?auto_700180 ?auto_700192 ) ) ( not ( = ?auto_700180 ?auto_700193 ) ) ( not ( = ?auto_700180 ?auto_700194 ) ) ( not ( = ?auto_700181 ?auto_700182 ) ) ( not ( = ?auto_700181 ?auto_700183 ) ) ( not ( = ?auto_700181 ?auto_700184 ) ) ( not ( = ?auto_700181 ?auto_700185 ) ) ( not ( = ?auto_700181 ?auto_700186 ) ) ( not ( = ?auto_700181 ?auto_700187 ) ) ( not ( = ?auto_700181 ?auto_700188 ) ) ( not ( = ?auto_700181 ?auto_700189 ) ) ( not ( = ?auto_700181 ?auto_700190 ) ) ( not ( = ?auto_700181 ?auto_700191 ) ) ( not ( = ?auto_700181 ?auto_700192 ) ) ( not ( = ?auto_700181 ?auto_700193 ) ) ( not ( = ?auto_700181 ?auto_700194 ) ) ( not ( = ?auto_700182 ?auto_700183 ) ) ( not ( = ?auto_700182 ?auto_700184 ) ) ( not ( = ?auto_700182 ?auto_700185 ) ) ( not ( = ?auto_700182 ?auto_700186 ) ) ( not ( = ?auto_700182 ?auto_700187 ) ) ( not ( = ?auto_700182 ?auto_700188 ) ) ( not ( = ?auto_700182 ?auto_700189 ) ) ( not ( = ?auto_700182 ?auto_700190 ) ) ( not ( = ?auto_700182 ?auto_700191 ) ) ( not ( = ?auto_700182 ?auto_700192 ) ) ( not ( = ?auto_700182 ?auto_700193 ) ) ( not ( = ?auto_700182 ?auto_700194 ) ) ( not ( = ?auto_700183 ?auto_700184 ) ) ( not ( = ?auto_700183 ?auto_700185 ) ) ( not ( = ?auto_700183 ?auto_700186 ) ) ( not ( = ?auto_700183 ?auto_700187 ) ) ( not ( = ?auto_700183 ?auto_700188 ) ) ( not ( = ?auto_700183 ?auto_700189 ) ) ( not ( = ?auto_700183 ?auto_700190 ) ) ( not ( = ?auto_700183 ?auto_700191 ) ) ( not ( = ?auto_700183 ?auto_700192 ) ) ( not ( = ?auto_700183 ?auto_700193 ) ) ( not ( = ?auto_700183 ?auto_700194 ) ) ( not ( = ?auto_700184 ?auto_700185 ) ) ( not ( = ?auto_700184 ?auto_700186 ) ) ( not ( = ?auto_700184 ?auto_700187 ) ) ( not ( = ?auto_700184 ?auto_700188 ) ) ( not ( = ?auto_700184 ?auto_700189 ) ) ( not ( = ?auto_700184 ?auto_700190 ) ) ( not ( = ?auto_700184 ?auto_700191 ) ) ( not ( = ?auto_700184 ?auto_700192 ) ) ( not ( = ?auto_700184 ?auto_700193 ) ) ( not ( = ?auto_700184 ?auto_700194 ) ) ( not ( = ?auto_700185 ?auto_700186 ) ) ( not ( = ?auto_700185 ?auto_700187 ) ) ( not ( = ?auto_700185 ?auto_700188 ) ) ( not ( = ?auto_700185 ?auto_700189 ) ) ( not ( = ?auto_700185 ?auto_700190 ) ) ( not ( = ?auto_700185 ?auto_700191 ) ) ( not ( = ?auto_700185 ?auto_700192 ) ) ( not ( = ?auto_700185 ?auto_700193 ) ) ( not ( = ?auto_700185 ?auto_700194 ) ) ( not ( = ?auto_700186 ?auto_700187 ) ) ( not ( = ?auto_700186 ?auto_700188 ) ) ( not ( = ?auto_700186 ?auto_700189 ) ) ( not ( = ?auto_700186 ?auto_700190 ) ) ( not ( = ?auto_700186 ?auto_700191 ) ) ( not ( = ?auto_700186 ?auto_700192 ) ) ( not ( = ?auto_700186 ?auto_700193 ) ) ( not ( = ?auto_700186 ?auto_700194 ) ) ( not ( = ?auto_700187 ?auto_700188 ) ) ( not ( = ?auto_700187 ?auto_700189 ) ) ( not ( = ?auto_700187 ?auto_700190 ) ) ( not ( = ?auto_700187 ?auto_700191 ) ) ( not ( = ?auto_700187 ?auto_700192 ) ) ( not ( = ?auto_700187 ?auto_700193 ) ) ( not ( = ?auto_700187 ?auto_700194 ) ) ( not ( = ?auto_700188 ?auto_700189 ) ) ( not ( = ?auto_700188 ?auto_700190 ) ) ( not ( = ?auto_700188 ?auto_700191 ) ) ( not ( = ?auto_700188 ?auto_700192 ) ) ( not ( = ?auto_700188 ?auto_700193 ) ) ( not ( = ?auto_700188 ?auto_700194 ) ) ( not ( = ?auto_700189 ?auto_700190 ) ) ( not ( = ?auto_700189 ?auto_700191 ) ) ( not ( = ?auto_700189 ?auto_700192 ) ) ( not ( = ?auto_700189 ?auto_700193 ) ) ( not ( = ?auto_700189 ?auto_700194 ) ) ( not ( = ?auto_700190 ?auto_700191 ) ) ( not ( = ?auto_700190 ?auto_700192 ) ) ( not ( = ?auto_700190 ?auto_700193 ) ) ( not ( = ?auto_700190 ?auto_700194 ) ) ( not ( = ?auto_700191 ?auto_700192 ) ) ( not ( = ?auto_700191 ?auto_700193 ) ) ( not ( = ?auto_700191 ?auto_700194 ) ) ( not ( = ?auto_700192 ?auto_700193 ) ) ( not ( = ?auto_700192 ?auto_700194 ) ) ( not ( = ?auto_700193 ?auto_700194 ) ) ( CLEAR ?auto_700191 ) ( ON ?auto_700192 ?auto_700193 ) ( CLEAR ?auto_700192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_700178 ?auto_700179 ?auto_700180 ?auto_700181 ?auto_700182 ?auto_700183 ?auto_700184 ?auto_700185 ?auto_700186 ?auto_700187 ?auto_700188 ?auto_700189 ?auto_700190 ?auto_700191 ?auto_700192 )
      ( MAKE-16PILE ?auto_700178 ?auto_700179 ?auto_700180 ?auto_700181 ?auto_700182 ?auto_700183 ?auto_700184 ?auto_700185 ?auto_700186 ?auto_700187 ?auto_700188 ?auto_700189 ?auto_700190 ?auto_700191 ?auto_700192 ?auto_700193 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700244 - BLOCK
      ?auto_700245 - BLOCK
      ?auto_700246 - BLOCK
      ?auto_700247 - BLOCK
      ?auto_700248 - BLOCK
      ?auto_700249 - BLOCK
      ?auto_700250 - BLOCK
      ?auto_700251 - BLOCK
      ?auto_700252 - BLOCK
      ?auto_700253 - BLOCK
      ?auto_700254 - BLOCK
      ?auto_700255 - BLOCK
      ?auto_700256 - BLOCK
      ?auto_700257 - BLOCK
      ?auto_700258 - BLOCK
      ?auto_700259 - BLOCK
    )
    :vars
    (
      ?auto_700260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700259 ?auto_700260 ) ( ON-TABLE ?auto_700244 ) ( ON ?auto_700245 ?auto_700244 ) ( ON ?auto_700246 ?auto_700245 ) ( ON ?auto_700247 ?auto_700246 ) ( ON ?auto_700248 ?auto_700247 ) ( ON ?auto_700249 ?auto_700248 ) ( ON ?auto_700250 ?auto_700249 ) ( ON ?auto_700251 ?auto_700250 ) ( ON ?auto_700252 ?auto_700251 ) ( ON ?auto_700253 ?auto_700252 ) ( ON ?auto_700254 ?auto_700253 ) ( ON ?auto_700255 ?auto_700254 ) ( ON ?auto_700256 ?auto_700255 ) ( not ( = ?auto_700244 ?auto_700245 ) ) ( not ( = ?auto_700244 ?auto_700246 ) ) ( not ( = ?auto_700244 ?auto_700247 ) ) ( not ( = ?auto_700244 ?auto_700248 ) ) ( not ( = ?auto_700244 ?auto_700249 ) ) ( not ( = ?auto_700244 ?auto_700250 ) ) ( not ( = ?auto_700244 ?auto_700251 ) ) ( not ( = ?auto_700244 ?auto_700252 ) ) ( not ( = ?auto_700244 ?auto_700253 ) ) ( not ( = ?auto_700244 ?auto_700254 ) ) ( not ( = ?auto_700244 ?auto_700255 ) ) ( not ( = ?auto_700244 ?auto_700256 ) ) ( not ( = ?auto_700244 ?auto_700257 ) ) ( not ( = ?auto_700244 ?auto_700258 ) ) ( not ( = ?auto_700244 ?auto_700259 ) ) ( not ( = ?auto_700244 ?auto_700260 ) ) ( not ( = ?auto_700245 ?auto_700246 ) ) ( not ( = ?auto_700245 ?auto_700247 ) ) ( not ( = ?auto_700245 ?auto_700248 ) ) ( not ( = ?auto_700245 ?auto_700249 ) ) ( not ( = ?auto_700245 ?auto_700250 ) ) ( not ( = ?auto_700245 ?auto_700251 ) ) ( not ( = ?auto_700245 ?auto_700252 ) ) ( not ( = ?auto_700245 ?auto_700253 ) ) ( not ( = ?auto_700245 ?auto_700254 ) ) ( not ( = ?auto_700245 ?auto_700255 ) ) ( not ( = ?auto_700245 ?auto_700256 ) ) ( not ( = ?auto_700245 ?auto_700257 ) ) ( not ( = ?auto_700245 ?auto_700258 ) ) ( not ( = ?auto_700245 ?auto_700259 ) ) ( not ( = ?auto_700245 ?auto_700260 ) ) ( not ( = ?auto_700246 ?auto_700247 ) ) ( not ( = ?auto_700246 ?auto_700248 ) ) ( not ( = ?auto_700246 ?auto_700249 ) ) ( not ( = ?auto_700246 ?auto_700250 ) ) ( not ( = ?auto_700246 ?auto_700251 ) ) ( not ( = ?auto_700246 ?auto_700252 ) ) ( not ( = ?auto_700246 ?auto_700253 ) ) ( not ( = ?auto_700246 ?auto_700254 ) ) ( not ( = ?auto_700246 ?auto_700255 ) ) ( not ( = ?auto_700246 ?auto_700256 ) ) ( not ( = ?auto_700246 ?auto_700257 ) ) ( not ( = ?auto_700246 ?auto_700258 ) ) ( not ( = ?auto_700246 ?auto_700259 ) ) ( not ( = ?auto_700246 ?auto_700260 ) ) ( not ( = ?auto_700247 ?auto_700248 ) ) ( not ( = ?auto_700247 ?auto_700249 ) ) ( not ( = ?auto_700247 ?auto_700250 ) ) ( not ( = ?auto_700247 ?auto_700251 ) ) ( not ( = ?auto_700247 ?auto_700252 ) ) ( not ( = ?auto_700247 ?auto_700253 ) ) ( not ( = ?auto_700247 ?auto_700254 ) ) ( not ( = ?auto_700247 ?auto_700255 ) ) ( not ( = ?auto_700247 ?auto_700256 ) ) ( not ( = ?auto_700247 ?auto_700257 ) ) ( not ( = ?auto_700247 ?auto_700258 ) ) ( not ( = ?auto_700247 ?auto_700259 ) ) ( not ( = ?auto_700247 ?auto_700260 ) ) ( not ( = ?auto_700248 ?auto_700249 ) ) ( not ( = ?auto_700248 ?auto_700250 ) ) ( not ( = ?auto_700248 ?auto_700251 ) ) ( not ( = ?auto_700248 ?auto_700252 ) ) ( not ( = ?auto_700248 ?auto_700253 ) ) ( not ( = ?auto_700248 ?auto_700254 ) ) ( not ( = ?auto_700248 ?auto_700255 ) ) ( not ( = ?auto_700248 ?auto_700256 ) ) ( not ( = ?auto_700248 ?auto_700257 ) ) ( not ( = ?auto_700248 ?auto_700258 ) ) ( not ( = ?auto_700248 ?auto_700259 ) ) ( not ( = ?auto_700248 ?auto_700260 ) ) ( not ( = ?auto_700249 ?auto_700250 ) ) ( not ( = ?auto_700249 ?auto_700251 ) ) ( not ( = ?auto_700249 ?auto_700252 ) ) ( not ( = ?auto_700249 ?auto_700253 ) ) ( not ( = ?auto_700249 ?auto_700254 ) ) ( not ( = ?auto_700249 ?auto_700255 ) ) ( not ( = ?auto_700249 ?auto_700256 ) ) ( not ( = ?auto_700249 ?auto_700257 ) ) ( not ( = ?auto_700249 ?auto_700258 ) ) ( not ( = ?auto_700249 ?auto_700259 ) ) ( not ( = ?auto_700249 ?auto_700260 ) ) ( not ( = ?auto_700250 ?auto_700251 ) ) ( not ( = ?auto_700250 ?auto_700252 ) ) ( not ( = ?auto_700250 ?auto_700253 ) ) ( not ( = ?auto_700250 ?auto_700254 ) ) ( not ( = ?auto_700250 ?auto_700255 ) ) ( not ( = ?auto_700250 ?auto_700256 ) ) ( not ( = ?auto_700250 ?auto_700257 ) ) ( not ( = ?auto_700250 ?auto_700258 ) ) ( not ( = ?auto_700250 ?auto_700259 ) ) ( not ( = ?auto_700250 ?auto_700260 ) ) ( not ( = ?auto_700251 ?auto_700252 ) ) ( not ( = ?auto_700251 ?auto_700253 ) ) ( not ( = ?auto_700251 ?auto_700254 ) ) ( not ( = ?auto_700251 ?auto_700255 ) ) ( not ( = ?auto_700251 ?auto_700256 ) ) ( not ( = ?auto_700251 ?auto_700257 ) ) ( not ( = ?auto_700251 ?auto_700258 ) ) ( not ( = ?auto_700251 ?auto_700259 ) ) ( not ( = ?auto_700251 ?auto_700260 ) ) ( not ( = ?auto_700252 ?auto_700253 ) ) ( not ( = ?auto_700252 ?auto_700254 ) ) ( not ( = ?auto_700252 ?auto_700255 ) ) ( not ( = ?auto_700252 ?auto_700256 ) ) ( not ( = ?auto_700252 ?auto_700257 ) ) ( not ( = ?auto_700252 ?auto_700258 ) ) ( not ( = ?auto_700252 ?auto_700259 ) ) ( not ( = ?auto_700252 ?auto_700260 ) ) ( not ( = ?auto_700253 ?auto_700254 ) ) ( not ( = ?auto_700253 ?auto_700255 ) ) ( not ( = ?auto_700253 ?auto_700256 ) ) ( not ( = ?auto_700253 ?auto_700257 ) ) ( not ( = ?auto_700253 ?auto_700258 ) ) ( not ( = ?auto_700253 ?auto_700259 ) ) ( not ( = ?auto_700253 ?auto_700260 ) ) ( not ( = ?auto_700254 ?auto_700255 ) ) ( not ( = ?auto_700254 ?auto_700256 ) ) ( not ( = ?auto_700254 ?auto_700257 ) ) ( not ( = ?auto_700254 ?auto_700258 ) ) ( not ( = ?auto_700254 ?auto_700259 ) ) ( not ( = ?auto_700254 ?auto_700260 ) ) ( not ( = ?auto_700255 ?auto_700256 ) ) ( not ( = ?auto_700255 ?auto_700257 ) ) ( not ( = ?auto_700255 ?auto_700258 ) ) ( not ( = ?auto_700255 ?auto_700259 ) ) ( not ( = ?auto_700255 ?auto_700260 ) ) ( not ( = ?auto_700256 ?auto_700257 ) ) ( not ( = ?auto_700256 ?auto_700258 ) ) ( not ( = ?auto_700256 ?auto_700259 ) ) ( not ( = ?auto_700256 ?auto_700260 ) ) ( not ( = ?auto_700257 ?auto_700258 ) ) ( not ( = ?auto_700257 ?auto_700259 ) ) ( not ( = ?auto_700257 ?auto_700260 ) ) ( not ( = ?auto_700258 ?auto_700259 ) ) ( not ( = ?auto_700258 ?auto_700260 ) ) ( not ( = ?auto_700259 ?auto_700260 ) ) ( ON ?auto_700258 ?auto_700259 ) ( CLEAR ?auto_700256 ) ( ON ?auto_700257 ?auto_700258 ) ( CLEAR ?auto_700257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_700244 ?auto_700245 ?auto_700246 ?auto_700247 ?auto_700248 ?auto_700249 ?auto_700250 ?auto_700251 ?auto_700252 ?auto_700253 ?auto_700254 ?auto_700255 ?auto_700256 ?auto_700257 )
      ( MAKE-16PILE ?auto_700244 ?auto_700245 ?auto_700246 ?auto_700247 ?auto_700248 ?auto_700249 ?auto_700250 ?auto_700251 ?auto_700252 ?auto_700253 ?auto_700254 ?auto_700255 ?auto_700256 ?auto_700257 ?auto_700258 ?auto_700259 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700310 - BLOCK
      ?auto_700311 - BLOCK
      ?auto_700312 - BLOCK
      ?auto_700313 - BLOCK
      ?auto_700314 - BLOCK
      ?auto_700315 - BLOCK
      ?auto_700316 - BLOCK
      ?auto_700317 - BLOCK
      ?auto_700318 - BLOCK
      ?auto_700319 - BLOCK
      ?auto_700320 - BLOCK
      ?auto_700321 - BLOCK
      ?auto_700322 - BLOCK
      ?auto_700323 - BLOCK
      ?auto_700324 - BLOCK
      ?auto_700325 - BLOCK
    )
    :vars
    (
      ?auto_700326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700325 ?auto_700326 ) ( ON-TABLE ?auto_700310 ) ( ON ?auto_700311 ?auto_700310 ) ( ON ?auto_700312 ?auto_700311 ) ( ON ?auto_700313 ?auto_700312 ) ( ON ?auto_700314 ?auto_700313 ) ( ON ?auto_700315 ?auto_700314 ) ( ON ?auto_700316 ?auto_700315 ) ( ON ?auto_700317 ?auto_700316 ) ( ON ?auto_700318 ?auto_700317 ) ( ON ?auto_700319 ?auto_700318 ) ( ON ?auto_700320 ?auto_700319 ) ( ON ?auto_700321 ?auto_700320 ) ( not ( = ?auto_700310 ?auto_700311 ) ) ( not ( = ?auto_700310 ?auto_700312 ) ) ( not ( = ?auto_700310 ?auto_700313 ) ) ( not ( = ?auto_700310 ?auto_700314 ) ) ( not ( = ?auto_700310 ?auto_700315 ) ) ( not ( = ?auto_700310 ?auto_700316 ) ) ( not ( = ?auto_700310 ?auto_700317 ) ) ( not ( = ?auto_700310 ?auto_700318 ) ) ( not ( = ?auto_700310 ?auto_700319 ) ) ( not ( = ?auto_700310 ?auto_700320 ) ) ( not ( = ?auto_700310 ?auto_700321 ) ) ( not ( = ?auto_700310 ?auto_700322 ) ) ( not ( = ?auto_700310 ?auto_700323 ) ) ( not ( = ?auto_700310 ?auto_700324 ) ) ( not ( = ?auto_700310 ?auto_700325 ) ) ( not ( = ?auto_700310 ?auto_700326 ) ) ( not ( = ?auto_700311 ?auto_700312 ) ) ( not ( = ?auto_700311 ?auto_700313 ) ) ( not ( = ?auto_700311 ?auto_700314 ) ) ( not ( = ?auto_700311 ?auto_700315 ) ) ( not ( = ?auto_700311 ?auto_700316 ) ) ( not ( = ?auto_700311 ?auto_700317 ) ) ( not ( = ?auto_700311 ?auto_700318 ) ) ( not ( = ?auto_700311 ?auto_700319 ) ) ( not ( = ?auto_700311 ?auto_700320 ) ) ( not ( = ?auto_700311 ?auto_700321 ) ) ( not ( = ?auto_700311 ?auto_700322 ) ) ( not ( = ?auto_700311 ?auto_700323 ) ) ( not ( = ?auto_700311 ?auto_700324 ) ) ( not ( = ?auto_700311 ?auto_700325 ) ) ( not ( = ?auto_700311 ?auto_700326 ) ) ( not ( = ?auto_700312 ?auto_700313 ) ) ( not ( = ?auto_700312 ?auto_700314 ) ) ( not ( = ?auto_700312 ?auto_700315 ) ) ( not ( = ?auto_700312 ?auto_700316 ) ) ( not ( = ?auto_700312 ?auto_700317 ) ) ( not ( = ?auto_700312 ?auto_700318 ) ) ( not ( = ?auto_700312 ?auto_700319 ) ) ( not ( = ?auto_700312 ?auto_700320 ) ) ( not ( = ?auto_700312 ?auto_700321 ) ) ( not ( = ?auto_700312 ?auto_700322 ) ) ( not ( = ?auto_700312 ?auto_700323 ) ) ( not ( = ?auto_700312 ?auto_700324 ) ) ( not ( = ?auto_700312 ?auto_700325 ) ) ( not ( = ?auto_700312 ?auto_700326 ) ) ( not ( = ?auto_700313 ?auto_700314 ) ) ( not ( = ?auto_700313 ?auto_700315 ) ) ( not ( = ?auto_700313 ?auto_700316 ) ) ( not ( = ?auto_700313 ?auto_700317 ) ) ( not ( = ?auto_700313 ?auto_700318 ) ) ( not ( = ?auto_700313 ?auto_700319 ) ) ( not ( = ?auto_700313 ?auto_700320 ) ) ( not ( = ?auto_700313 ?auto_700321 ) ) ( not ( = ?auto_700313 ?auto_700322 ) ) ( not ( = ?auto_700313 ?auto_700323 ) ) ( not ( = ?auto_700313 ?auto_700324 ) ) ( not ( = ?auto_700313 ?auto_700325 ) ) ( not ( = ?auto_700313 ?auto_700326 ) ) ( not ( = ?auto_700314 ?auto_700315 ) ) ( not ( = ?auto_700314 ?auto_700316 ) ) ( not ( = ?auto_700314 ?auto_700317 ) ) ( not ( = ?auto_700314 ?auto_700318 ) ) ( not ( = ?auto_700314 ?auto_700319 ) ) ( not ( = ?auto_700314 ?auto_700320 ) ) ( not ( = ?auto_700314 ?auto_700321 ) ) ( not ( = ?auto_700314 ?auto_700322 ) ) ( not ( = ?auto_700314 ?auto_700323 ) ) ( not ( = ?auto_700314 ?auto_700324 ) ) ( not ( = ?auto_700314 ?auto_700325 ) ) ( not ( = ?auto_700314 ?auto_700326 ) ) ( not ( = ?auto_700315 ?auto_700316 ) ) ( not ( = ?auto_700315 ?auto_700317 ) ) ( not ( = ?auto_700315 ?auto_700318 ) ) ( not ( = ?auto_700315 ?auto_700319 ) ) ( not ( = ?auto_700315 ?auto_700320 ) ) ( not ( = ?auto_700315 ?auto_700321 ) ) ( not ( = ?auto_700315 ?auto_700322 ) ) ( not ( = ?auto_700315 ?auto_700323 ) ) ( not ( = ?auto_700315 ?auto_700324 ) ) ( not ( = ?auto_700315 ?auto_700325 ) ) ( not ( = ?auto_700315 ?auto_700326 ) ) ( not ( = ?auto_700316 ?auto_700317 ) ) ( not ( = ?auto_700316 ?auto_700318 ) ) ( not ( = ?auto_700316 ?auto_700319 ) ) ( not ( = ?auto_700316 ?auto_700320 ) ) ( not ( = ?auto_700316 ?auto_700321 ) ) ( not ( = ?auto_700316 ?auto_700322 ) ) ( not ( = ?auto_700316 ?auto_700323 ) ) ( not ( = ?auto_700316 ?auto_700324 ) ) ( not ( = ?auto_700316 ?auto_700325 ) ) ( not ( = ?auto_700316 ?auto_700326 ) ) ( not ( = ?auto_700317 ?auto_700318 ) ) ( not ( = ?auto_700317 ?auto_700319 ) ) ( not ( = ?auto_700317 ?auto_700320 ) ) ( not ( = ?auto_700317 ?auto_700321 ) ) ( not ( = ?auto_700317 ?auto_700322 ) ) ( not ( = ?auto_700317 ?auto_700323 ) ) ( not ( = ?auto_700317 ?auto_700324 ) ) ( not ( = ?auto_700317 ?auto_700325 ) ) ( not ( = ?auto_700317 ?auto_700326 ) ) ( not ( = ?auto_700318 ?auto_700319 ) ) ( not ( = ?auto_700318 ?auto_700320 ) ) ( not ( = ?auto_700318 ?auto_700321 ) ) ( not ( = ?auto_700318 ?auto_700322 ) ) ( not ( = ?auto_700318 ?auto_700323 ) ) ( not ( = ?auto_700318 ?auto_700324 ) ) ( not ( = ?auto_700318 ?auto_700325 ) ) ( not ( = ?auto_700318 ?auto_700326 ) ) ( not ( = ?auto_700319 ?auto_700320 ) ) ( not ( = ?auto_700319 ?auto_700321 ) ) ( not ( = ?auto_700319 ?auto_700322 ) ) ( not ( = ?auto_700319 ?auto_700323 ) ) ( not ( = ?auto_700319 ?auto_700324 ) ) ( not ( = ?auto_700319 ?auto_700325 ) ) ( not ( = ?auto_700319 ?auto_700326 ) ) ( not ( = ?auto_700320 ?auto_700321 ) ) ( not ( = ?auto_700320 ?auto_700322 ) ) ( not ( = ?auto_700320 ?auto_700323 ) ) ( not ( = ?auto_700320 ?auto_700324 ) ) ( not ( = ?auto_700320 ?auto_700325 ) ) ( not ( = ?auto_700320 ?auto_700326 ) ) ( not ( = ?auto_700321 ?auto_700322 ) ) ( not ( = ?auto_700321 ?auto_700323 ) ) ( not ( = ?auto_700321 ?auto_700324 ) ) ( not ( = ?auto_700321 ?auto_700325 ) ) ( not ( = ?auto_700321 ?auto_700326 ) ) ( not ( = ?auto_700322 ?auto_700323 ) ) ( not ( = ?auto_700322 ?auto_700324 ) ) ( not ( = ?auto_700322 ?auto_700325 ) ) ( not ( = ?auto_700322 ?auto_700326 ) ) ( not ( = ?auto_700323 ?auto_700324 ) ) ( not ( = ?auto_700323 ?auto_700325 ) ) ( not ( = ?auto_700323 ?auto_700326 ) ) ( not ( = ?auto_700324 ?auto_700325 ) ) ( not ( = ?auto_700324 ?auto_700326 ) ) ( not ( = ?auto_700325 ?auto_700326 ) ) ( ON ?auto_700324 ?auto_700325 ) ( ON ?auto_700323 ?auto_700324 ) ( CLEAR ?auto_700321 ) ( ON ?auto_700322 ?auto_700323 ) ( CLEAR ?auto_700322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_700310 ?auto_700311 ?auto_700312 ?auto_700313 ?auto_700314 ?auto_700315 ?auto_700316 ?auto_700317 ?auto_700318 ?auto_700319 ?auto_700320 ?auto_700321 ?auto_700322 )
      ( MAKE-16PILE ?auto_700310 ?auto_700311 ?auto_700312 ?auto_700313 ?auto_700314 ?auto_700315 ?auto_700316 ?auto_700317 ?auto_700318 ?auto_700319 ?auto_700320 ?auto_700321 ?auto_700322 ?auto_700323 ?auto_700324 ?auto_700325 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700376 - BLOCK
      ?auto_700377 - BLOCK
      ?auto_700378 - BLOCK
      ?auto_700379 - BLOCK
      ?auto_700380 - BLOCK
      ?auto_700381 - BLOCK
      ?auto_700382 - BLOCK
      ?auto_700383 - BLOCK
      ?auto_700384 - BLOCK
      ?auto_700385 - BLOCK
      ?auto_700386 - BLOCK
      ?auto_700387 - BLOCK
      ?auto_700388 - BLOCK
      ?auto_700389 - BLOCK
      ?auto_700390 - BLOCK
      ?auto_700391 - BLOCK
    )
    :vars
    (
      ?auto_700392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700391 ?auto_700392 ) ( ON-TABLE ?auto_700376 ) ( ON ?auto_700377 ?auto_700376 ) ( ON ?auto_700378 ?auto_700377 ) ( ON ?auto_700379 ?auto_700378 ) ( ON ?auto_700380 ?auto_700379 ) ( ON ?auto_700381 ?auto_700380 ) ( ON ?auto_700382 ?auto_700381 ) ( ON ?auto_700383 ?auto_700382 ) ( ON ?auto_700384 ?auto_700383 ) ( ON ?auto_700385 ?auto_700384 ) ( ON ?auto_700386 ?auto_700385 ) ( not ( = ?auto_700376 ?auto_700377 ) ) ( not ( = ?auto_700376 ?auto_700378 ) ) ( not ( = ?auto_700376 ?auto_700379 ) ) ( not ( = ?auto_700376 ?auto_700380 ) ) ( not ( = ?auto_700376 ?auto_700381 ) ) ( not ( = ?auto_700376 ?auto_700382 ) ) ( not ( = ?auto_700376 ?auto_700383 ) ) ( not ( = ?auto_700376 ?auto_700384 ) ) ( not ( = ?auto_700376 ?auto_700385 ) ) ( not ( = ?auto_700376 ?auto_700386 ) ) ( not ( = ?auto_700376 ?auto_700387 ) ) ( not ( = ?auto_700376 ?auto_700388 ) ) ( not ( = ?auto_700376 ?auto_700389 ) ) ( not ( = ?auto_700376 ?auto_700390 ) ) ( not ( = ?auto_700376 ?auto_700391 ) ) ( not ( = ?auto_700376 ?auto_700392 ) ) ( not ( = ?auto_700377 ?auto_700378 ) ) ( not ( = ?auto_700377 ?auto_700379 ) ) ( not ( = ?auto_700377 ?auto_700380 ) ) ( not ( = ?auto_700377 ?auto_700381 ) ) ( not ( = ?auto_700377 ?auto_700382 ) ) ( not ( = ?auto_700377 ?auto_700383 ) ) ( not ( = ?auto_700377 ?auto_700384 ) ) ( not ( = ?auto_700377 ?auto_700385 ) ) ( not ( = ?auto_700377 ?auto_700386 ) ) ( not ( = ?auto_700377 ?auto_700387 ) ) ( not ( = ?auto_700377 ?auto_700388 ) ) ( not ( = ?auto_700377 ?auto_700389 ) ) ( not ( = ?auto_700377 ?auto_700390 ) ) ( not ( = ?auto_700377 ?auto_700391 ) ) ( not ( = ?auto_700377 ?auto_700392 ) ) ( not ( = ?auto_700378 ?auto_700379 ) ) ( not ( = ?auto_700378 ?auto_700380 ) ) ( not ( = ?auto_700378 ?auto_700381 ) ) ( not ( = ?auto_700378 ?auto_700382 ) ) ( not ( = ?auto_700378 ?auto_700383 ) ) ( not ( = ?auto_700378 ?auto_700384 ) ) ( not ( = ?auto_700378 ?auto_700385 ) ) ( not ( = ?auto_700378 ?auto_700386 ) ) ( not ( = ?auto_700378 ?auto_700387 ) ) ( not ( = ?auto_700378 ?auto_700388 ) ) ( not ( = ?auto_700378 ?auto_700389 ) ) ( not ( = ?auto_700378 ?auto_700390 ) ) ( not ( = ?auto_700378 ?auto_700391 ) ) ( not ( = ?auto_700378 ?auto_700392 ) ) ( not ( = ?auto_700379 ?auto_700380 ) ) ( not ( = ?auto_700379 ?auto_700381 ) ) ( not ( = ?auto_700379 ?auto_700382 ) ) ( not ( = ?auto_700379 ?auto_700383 ) ) ( not ( = ?auto_700379 ?auto_700384 ) ) ( not ( = ?auto_700379 ?auto_700385 ) ) ( not ( = ?auto_700379 ?auto_700386 ) ) ( not ( = ?auto_700379 ?auto_700387 ) ) ( not ( = ?auto_700379 ?auto_700388 ) ) ( not ( = ?auto_700379 ?auto_700389 ) ) ( not ( = ?auto_700379 ?auto_700390 ) ) ( not ( = ?auto_700379 ?auto_700391 ) ) ( not ( = ?auto_700379 ?auto_700392 ) ) ( not ( = ?auto_700380 ?auto_700381 ) ) ( not ( = ?auto_700380 ?auto_700382 ) ) ( not ( = ?auto_700380 ?auto_700383 ) ) ( not ( = ?auto_700380 ?auto_700384 ) ) ( not ( = ?auto_700380 ?auto_700385 ) ) ( not ( = ?auto_700380 ?auto_700386 ) ) ( not ( = ?auto_700380 ?auto_700387 ) ) ( not ( = ?auto_700380 ?auto_700388 ) ) ( not ( = ?auto_700380 ?auto_700389 ) ) ( not ( = ?auto_700380 ?auto_700390 ) ) ( not ( = ?auto_700380 ?auto_700391 ) ) ( not ( = ?auto_700380 ?auto_700392 ) ) ( not ( = ?auto_700381 ?auto_700382 ) ) ( not ( = ?auto_700381 ?auto_700383 ) ) ( not ( = ?auto_700381 ?auto_700384 ) ) ( not ( = ?auto_700381 ?auto_700385 ) ) ( not ( = ?auto_700381 ?auto_700386 ) ) ( not ( = ?auto_700381 ?auto_700387 ) ) ( not ( = ?auto_700381 ?auto_700388 ) ) ( not ( = ?auto_700381 ?auto_700389 ) ) ( not ( = ?auto_700381 ?auto_700390 ) ) ( not ( = ?auto_700381 ?auto_700391 ) ) ( not ( = ?auto_700381 ?auto_700392 ) ) ( not ( = ?auto_700382 ?auto_700383 ) ) ( not ( = ?auto_700382 ?auto_700384 ) ) ( not ( = ?auto_700382 ?auto_700385 ) ) ( not ( = ?auto_700382 ?auto_700386 ) ) ( not ( = ?auto_700382 ?auto_700387 ) ) ( not ( = ?auto_700382 ?auto_700388 ) ) ( not ( = ?auto_700382 ?auto_700389 ) ) ( not ( = ?auto_700382 ?auto_700390 ) ) ( not ( = ?auto_700382 ?auto_700391 ) ) ( not ( = ?auto_700382 ?auto_700392 ) ) ( not ( = ?auto_700383 ?auto_700384 ) ) ( not ( = ?auto_700383 ?auto_700385 ) ) ( not ( = ?auto_700383 ?auto_700386 ) ) ( not ( = ?auto_700383 ?auto_700387 ) ) ( not ( = ?auto_700383 ?auto_700388 ) ) ( not ( = ?auto_700383 ?auto_700389 ) ) ( not ( = ?auto_700383 ?auto_700390 ) ) ( not ( = ?auto_700383 ?auto_700391 ) ) ( not ( = ?auto_700383 ?auto_700392 ) ) ( not ( = ?auto_700384 ?auto_700385 ) ) ( not ( = ?auto_700384 ?auto_700386 ) ) ( not ( = ?auto_700384 ?auto_700387 ) ) ( not ( = ?auto_700384 ?auto_700388 ) ) ( not ( = ?auto_700384 ?auto_700389 ) ) ( not ( = ?auto_700384 ?auto_700390 ) ) ( not ( = ?auto_700384 ?auto_700391 ) ) ( not ( = ?auto_700384 ?auto_700392 ) ) ( not ( = ?auto_700385 ?auto_700386 ) ) ( not ( = ?auto_700385 ?auto_700387 ) ) ( not ( = ?auto_700385 ?auto_700388 ) ) ( not ( = ?auto_700385 ?auto_700389 ) ) ( not ( = ?auto_700385 ?auto_700390 ) ) ( not ( = ?auto_700385 ?auto_700391 ) ) ( not ( = ?auto_700385 ?auto_700392 ) ) ( not ( = ?auto_700386 ?auto_700387 ) ) ( not ( = ?auto_700386 ?auto_700388 ) ) ( not ( = ?auto_700386 ?auto_700389 ) ) ( not ( = ?auto_700386 ?auto_700390 ) ) ( not ( = ?auto_700386 ?auto_700391 ) ) ( not ( = ?auto_700386 ?auto_700392 ) ) ( not ( = ?auto_700387 ?auto_700388 ) ) ( not ( = ?auto_700387 ?auto_700389 ) ) ( not ( = ?auto_700387 ?auto_700390 ) ) ( not ( = ?auto_700387 ?auto_700391 ) ) ( not ( = ?auto_700387 ?auto_700392 ) ) ( not ( = ?auto_700388 ?auto_700389 ) ) ( not ( = ?auto_700388 ?auto_700390 ) ) ( not ( = ?auto_700388 ?auto_700391 ) ) ( not ( = ?auto_700388 ?auto_700392 ) ) ( not ( = ?auto_700389 ?auto_700390 ) ) ( not ( = ?auto_700389 ?auto_700391 ) ) ( not ( = ?auto_700389 ?auto_700392 ) ) ( not ( = ?auto_700390 ?auto_700391 ) ) ( not ( = ?auto_700390 ?auto_700392 ) ) ( not ( = ?auto_700391 ?auto_700392 ) ) ( ON ?auto_700390 ?auto_700391 ) ( ON ?auto_700389 ?auto_700390 ) ( ON ?auto_700388 ?auto_700389 ) ( CLEAR ?auto_700386 ) ( ON ?auto_700387 ?auto_700388 ) ( CLEAR ?auto_700387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_700376 ?auto_700377 ?auto_700378 ?auto_700379 ?auto_700380 ?auto_700381 ?auto_700382 ?auto_700383 ?auto_700384 ?auto_700385 ?auto_700386 ?auto_700387 )
      ( MAKE-16PILE ?auto_700376 ?auto_700377 ?auto_700378 ?auto_700379 ?auto_700380 ?auto_700381 ?auto_700382 ?auto_700383 ?auto_700384 ?auto_700385 ?auto_700386 ?auto_700387 ?auto_700388 ?auto_700389 ?auto_700390 ?auto_700391 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700442 - BLOCK
      ?auto_700443 - BLOCK
      ?auto_700444 - BLOCK
      ?auto_700445 - BLOCK
      ?auto_700446 - BLOCK
      ?auto_700447 - BLOCK
      ?auto_700448 - BLOCK
      ?auto_700449 - BLOCK
      ?auto_700450 - BLOCK
      ?auto_700451 - BLOCK
      ?auto_700452 - BLOCK
      ?auto_700453 - BLOCK
      ?auto_700454 - BLOCK
      ?auto_700455 - BLOCK
      ?auto_700456 - BLOCK
      ?auto_700457 - BLOCK
    )
    :vars
    (
      ?auto_700458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700457 ?auto_700458 ) ( ON-TABLE ?auto_700442 ) ( ON ?auto_700443 ?auto_700442 ) ( ON ?auto_700444 ?auto_700443 ) ( ON ?auto_700445 ?auto_700444 ) ( ON ?auto_700446 ?auto_700445 ) ( ON ?auto_700447 ?auto_700446 ) ( ON ?auto_700448 ?auto_700447 ) ( ON ?auto_700449 ?auto_700448 ) ( ON ?auto_700450 ?auto_700449 ) ( ON ?auto_700451 ?auto_700450 ) ( not ( = ?auto_700442 ?auto_700443 ) ) ( not ( = ?auto_700442 ?auto_700444 ) ) ( not ( = ?auto_700442 ?auto_700445 ) ) ( not ( = ?auto_700442 ?auto_700446 ) ) ( not ( = ?auto_700442 ?auto_700447 ) ) ( not ( = ?auto_700442 ?auto_700448 ) ) ( not ( = ?auto_700442 ?auto_700449 ) ) ( not ( = ?auto_700442 ?auto_700450 ) ) ( not ( = ?auto_700442 ?auto_700451 ) ) ( not ( = ?auto_700442 ?auto_700452 ) ) ( not ( = ?auto_700442 ?auto_700453 ) ) ( not ( = ?auto_700442 ?auto_700454 ) ) ( not ( = ?auto_700442 ?auto_700455 ) ) ( not ( = ?auto_700442 ?auto_700456 ) ) ( not ( = ?auto_700442 ?auto_700457 ) ) ( not ( = ?auto_700442 ?auto_700458 ) ) ( not ( = ?auto_700443 ?auto_700444 ) ) ( not ( = ?auto_700443 ?auto_700445 ) ) ( not ( = ?auto_700443 ?auto_700446 ) ) ( not ( = ?auto_700443 ?auto_700447 ) ) ( not ( = ?auto_700443 ?auto_700448 ) ) ( not ( = ?auto_700443 ?auto_700449 ) ) ( not ( = ?auto_700443 ?auto_700450 ) ) ( not ( = ?auto_700443 ?auto_700451 ) ) ( not ( = ?auto_700443 ?auto_700452 ) ) ( not ( = ?auto_700443 ?auto_700453 ) ) ( not ( = ?auto_700443 ?auto_700454 ) ) ( not ( = ?auto_700443 ?auto_700455 ) ) ( not ( = ?auto_700443 ?auto_700456 ) ) ( not ( = ?auto_700443 ?auto_700457 ) ) ( not ( = ?auto_700443 ?auto_700458 ) ) ( not ( = ?auto_700444 ?auto_700445 ) ) ( not ( = ?auto_700444 ?auto_700446 ) ) ( not ( = ?auto_700444 ?auto_700447 ) ) ( not ( = ?auto_700444 ?auto_700448 ) ) ( not ( = ?auto_700444 ?auto_700449 ) ) ( not ( = ?auto_700444 ?auto_700450 ) ) ( not ( = ?auto_700444 ?auto_700451 ) ) ( not ( = ?auto_700444 ?auto_700452 ) ) ( not ( = ?auto_700444 ?auto_700453 ) ) ( not ( = ?auto_700444 ?auto_700454 ) ) ( not ( = ?auto_700444 ?auto_700455 ) ) ( not ( = ?auto_700444 ?auto_700456 ) ) ( not ( = ?auto_700444 ?auto_700457 ) ) ( not ( = ?auto_700444 ?auto_700458 ) ) ( not ( = ?auto_700445 ?auto_700446 ) ) ( not ( = ?auto_700445 ?auto_700447 ) ) ( not ( = ?auto_700445 ?auto_700448 ) ) ( not ( = ?auto_700445 ?auto_700449 ) ) ( not ( = ?auto_700445 ?auto_700450 ) ) ( not ( = ?auto_700445 ?auto_700451 ) ) ( not ( = ?auto_700445 ?auto_700452 ) ) ( not ( = ?auto_700445 ?auto_700453 ) ) ( not ( = ?auto_700445 ?auto_700454 ) ) ( not ( = ?auto_700445 ?auto_700455 ) ) ( not ( = ?auto_700445 ?auto_700456 ) ) ( not ( = ?auto_700445 ?auto_700457 ) ) ( not ( = ?auto_700445 ?auto_700458 ) ) ( not ( = ?auto_700446 ?auto_700447 ) ) ( not ( = ?auto_700446 ?auto_700448 ) ) ( not ( = ?auto_700446 ?auto_700449 ) ) ( not ( = ?auto_700446 ?auto_700450 ) ) ( not ( = ?auto_700446 ?auto_700451 ) ) ( not ( = ?auto_700446 ?auto_700452 ) ) ( not ( = ?auto_700446 ?auto_700453 ) ) ( not ( = ?auto_700446 ?auto_700454 ) ) ( not ( = ?auto_700446 ?auto_700455 ) ) ( not ( = ?auto_700446 ?auto_700456 ) ) ( not ( = ?auto_700446 ?auto_700457 ) ) ( not ( = ?auto_700446 ?auto_700458 ) ) ( not ( = ?auto_700447 ?auto_700448 ) ) ( not ( = ?auto_700447 ?auto_700449 ) ) ( not ( = ?auto_700447 ?auto_700450 ) ) ( not ( = ?auto_700447 ?auto_700451 ) ) ( not ( = ?auto_700447 ?auto_700452 ) ) ( not ( = ?auto_700447 ?auto_700453 ) ) ( not ( = ?auto_700447 ?auto_700454 ) ) ( not ( = ?auto_700447 ?auto_700455 ) ) ( not ( = ?auto_700447 ?auto_700456 ) ) ( not ( = ?auto_700447 ?auto_700457 ) ) ( not ( = ?auto_700447 ?auto_700458 ) ) ( not ( = ?auto_700448 ?auto_700449 ) ) ( not ( = ?auto_700448 ?auto_700450 ) ) ( not ( = ?auto_700448 ?auto_700451 ) ) ( not ( = ?auto_700448 ?auto_700452 ) ) ( not ( = ?auto_700448 ?auto_700453 ) ) ( not ( = ?auto_700448 ?auto_700454 ) ) ( not ( = ?auto_700448 ?auto_700455 ) ) ( not ( = ?auto_700448 ?auto_700456 ) ) ( not ( = ?auto_700448 ?auto_700457 ) ) ( not ( = ?auto_700448 ?auto_700458 ) ) ( not ( = ?auto_700449 ?auto_700450 ) ) ( not ( = ?auto_700449 ?auto_700451 ) ) ( not ( = ?auto_700449 ?auto_700452 ) ) ( not ( = ?auto_700449 ?auto_700453 ) ) ( not ( = ?auto_700449 ?auto_700454 ) ) ( not ( = ?auto_700449 ?auto_700455 ) ) ( not ( = ?auto_700449 ?auto_700456 ) ) ( not ( = ?auto_700449 ?auto_700457 ) ) ( not ( = ?auto_700449 ?auto_700458 ) ) ( not ( = ?auto_700450 ?auto_700451 ) ) ( not ( = ?auto_700450 ?auto_700452 ) ) ( not ( = ?auto_700450 ?auto_700453 ) ) ( not ( = ?auto_700450 ?auto_700454 ) ) ( not ( = ?auto_700450 ?auto_700455 ) ) ( not ( = ?auto_700450 ?auto_700456 ) ) ( not ( = ?auto_700450 ?auto_700457 ) ) ( not ( = ?auto_700450 ?auto_700458 ) ) ( not ( = ?auto_700451 ?auto_700452 ) ) ( not ( = ?auto_700451 ?auto_700453 ) ) ( not ( = ?auto_700451 ?auto_700454 ) ) ( not ( = ?auto_700451 ?auto_700455 ) ) ( not ( = ?auto_700451 ?auto_700456 ) ) ( not ( = ?auto_700451 ?auto_700457 ) ) ( not ( = ?auto_700451 ?auto_700458 ) ) ( not ( = ?auto_700452 ?auto_700453 ) ) ( not ( = ?auto_700452 ?auto_700454 ) ) ( not ( = ?auto_700452 ?auto_700455 ) ) ( not ( = ?auto_700452 ?auto_700456 ) ) ( not ( = ?auto_700452 ?auto_700457 ) ) ( not ( = ?auto_700452 ?auto_700458 ) ) ( not ( = ?auto_700453 ?auto_700454 ) ) ( not ( = ?auto_700453 ?auto_700455 ) ) ( not ( = ?auto_700453 ?auto_700456 ) ) ( not ( = ?auto_700453 ?auto_700457 ) ) ( not ( = ?auto_700453 ?auto_700458 ) ) ( not ( = ?auto_700454 ?auto_700455 ) ) ( not ( = ?auto_700454 ?auto_700456 ) ) ( not ( = ?auto_700454 ?auto_700457 ) ) ( not ( = ?auto_700454 ?auto_700458 ) ) ( not ( = ?auto_700455 ?auto_700456 ) ) ( not ( = ?auto_700455 ?auto_700457 ) ) ( not ( = ?auto_700455 ?auto_700458 ) ) ( not ( = ?auto_700456 ?auto_700457 ) ) ( not ( = ?auto_700456 ?auto_700458 ) ) ( not ( = ?auto_700457 ?auto_700458 ) ) ( ON ?auto_700456 ?auto_700457 ) ( ON ?auto_700455 ?auto_700456 ) ( ON ?auto_700454 ?auto_700455 ) ( ON ?auto_700453 ?auto_700454 ) ( CLEAR ?auto_700451 ) ( ON ?auto_700452 ?auto_700453 ) ( CLEAR ?auto_700452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_700442 ?auto_700443 ?auto_700444 ?auto_700445 ?auto_700446 ?auto_700447 ?auto_700448 ?auto_700449 ?auto_700450 ?auto_700451 ?auto_700452 )
      ( MAKE-16PILE ?auto_700442 ?auto_700443 ?auto_700444 ?auto_700445 ?auto_700446 ?auto_700447 ?auto_700448 ?auto_700449 ?auto_700450 ?auto_700451 ?auto_700452 ?auto_700453 ?auto_700454 ?auto_700455 ?auto_700456 ?auto_700457 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700508 - BLOCK
      ?auto_700509 - BLOCK
      ?auto_700510 - BLOCK
      ?auto_700511 - BLOCK
      ?auto_700512 - BLOCK
      ?auto_700513 - BLOCK
      ?auto_700514 - BLOCK
      ?auto_700515 - BLOCK
      ?auto_700516 - BLOCK
      ?auto_700517 - BLOCK
      ?auto_700518 - BLOCK
      ?auto_700519 - BLOCK
      ?auto_700520 - BLOCK
      ?auto_700521 - BLOCK
      ?auto_700522 - BLOCK
      ?auto_700523 - BLOCK
    )
    :vars
    (
      ?auto_700524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700523 ?auto_700524 ) ( ON-TABLE ?auto_700508 ) ( ON ?auto_700509 ?auto_700508 ) ( ON ?auto_700510 ?auto_700509 ) ( ON ?auto_700511 ?auto_700510 ) ( ON ?auto_700512 ?auto_700511 ) ( ON ?auto_700513 ?auto_700512 ) ( ON ?auto_700514 ?auto_700513 ) ( ON ?auto_700515 ?auto_700514 ) ( ON ?auto_700516 ?auto_700515 ) ( not ( = ?auto_700508 ?auto_700509 ) ) ( not ( = ?auto_700508 ?auto_700510 ) ) ( not ( = ?auto_700508 ?auto_700511 ) ) ( not ( = ?auto_700508 ?auto_700512 ) ) ( not ( = ?auto_700508 ?auto_700513 ) ) ( not ( = ?auto_700508 ?auto_700514 ) ) ( not ( = ?auto_700508 ?auto_700515 ) ) ( not ( = ?auto_700508 ?auto_700516 ) ) ( not ( = ?auto_700508 ?auto_700517 ) ) ( not ( = ?auto_700508 ?auto_700518 ) ) ( not ( = ?auto_700508 ?auto_700519 ) ) ( not ( = ?auto_700508 ?auto_700520 ) ) ( not ( = ?auto_700508 ?auto_700521 ) ) ( not ( = ?auto_700508 ?auto_700522 ) ) ( not ( = ?auto_700508 ?auto_700523 ) ) ( not ( = ?auto_700508 ?auto_700524 ) ) ( not ( = ?auto_700509 ?auto_700510 ) ) ( not ( = ?auto_700509 ?auto_700511 ) ) ( not ( = ?auto_700509 ?auto_700512 ) ) ( not ( = ?auto_700509 ?auto_700513 ) ) ( not ( = ?auto_700509 ?auto_700514 ) ) ( not ( = ?auto_700509 ?auto_700515 ) ) ( not ( = ?auto_700509 ?auto_700516 ) ) ( not ( = ?auto_700509 ?auto_700517 ) ) ( not ( = ?auto_700509 ?auto_700518 ) ) ( not ( = ?auto_700509 ?auto_700519 ) ) ( not ( = ?auto_700509 ?auto_700520 ) ) ( not ( = ?auto_700509 ?auto_700521 ) ) ( not ( = ?auto_700509 ?auto_700522 ) ) ( not ( = ?auto_700509 ?auto_700523 ) ) ( not ( = ?auto_700509 ?auto_700524 ) ) ( not ( = ?auto_700510 ?auto_700511 ) ) ( not ( = ?auto_700510 ?auto_700512 ) ) ( not ( = ?auto_700510 ?auto_700513 ) ) ( not ( = ?auto_700510 ?auto_700514 ) ) ( not ( = ?auto_700510 ?auto_700515 ) ) ( not ( = ?auto_700510 ?auto_700516 ) ) ( not ( = ?auto_700510 ?auto_700517 ) ) ( not ( = ?auto_700510 ?auto_700518 ) ) ( not ( = ?auto_700510 ?auto_700519 ) ) ( not ( = ?auto_700510 ?auto_700520 ) ) ( not ( = ?auto_700510 ?auto_700521 ) ) ( not ( = ?auto_700510 ?auto_700522 ) ) ( not ( = ?auto_700510 ?auto_700523 ) ) ( not ( = ?auto_700510 ?auto_700524 ) ) ( not ( = ?auto_700511 ?auto_700512 ) ) ( not ( = ?auto_700511 ?auto_700513 ) ) ( not ( = ?auto_700511 ?auto_700514 ) ) ( not ( = ?auto_700511 ?auto_700515 ) ) ( not ( = ?auto_700511 ?auto_700516 ) ) ( not ( = ?auto_700511 ?auto_700517 ) ) ( not ( = ?auto_700511 ?auto_700518 ) ) ( not ( = ?auto_700511 ?auto_700519 ) ) ( not ( = ?auto_700511 ?auto_700520 ) ) ( not ( = ?auto_700511 ?auto_700521 ) ) ( not ( = ?auto_700511 ?auto_700522 ) ) ( not ( = ?auto_700511 ?auto_700523 ) ) ( not ( = ?auto_700511 ?auto_700524 ) ) ( not ( = ?auto_700512 ?auto_700513 ) ) ( not ( = ?auto_700512 ?auto_700514 ) ) ( not ( = ?auto_700512 ?auto_700515 ) ) ( not ( = ?auto_700512 ?auto_700516 ) ) ( not ( = ?auto_700512 ?auto_700517 ) ) ( not ( = ?auto_700512 ?auto_700518 ) ) ( not ( = ?auto_700512 ?auto_700519 ) ) ( not ( = ?auto_700512 ?auto_700520 ) ) ( not ( = ?auto_700512 ?auto_700521 ) ) ( not ( = ?auto_700512 ?auto_700522 ) ) ( not ( = ?auto_700512 ?auto_700523 ) ) ( not ( = ?auto_700512 ?auto_700524 ) ) ( not ( = ?auto_700513 ?auto_700514 ) ) ( not ( = ?auto_700513 ?auto_700515 ) ) ( not ( = ?auto_700513 ?auto_700516 ) ) ( not ( = ?auto_700513 ?auto_700517 ) ) ( not ( = ?auto_700513 ?auto_700518 ) ) ( not ( = ?auto_700513 ?auto_700519 ) ) ( not ( = ?auto_700513 ?auto_700520 ) ) ( not ( = ?auto_700513 ?auto_700521 ) ) ( not ( = ?auto_700513 ?auto_700522 ) ) ( not ( = ?auto_700513 ?auto_700523 ) ) ( not ( = ?auto_700513 ?auto_700524 ) ) ( not ( = ?auto_700514 ?auto_700515 ) ) ( not ( = ?auto_700514 ?auto_700516 ) ) ( not ( = ?auto_700514 ?auto_700517 ) ) ( not ( = ?auto_700514 ?auto_700518 ) ) ( not ( = ?auto_700514 ?auto_700519 ) ) ( not ( = ?auto_700514 ?auto_700520 ) ) ( not ( = ?auto_700514 ?auto_700521 ) ) ( not ( = ?auto_700514 ?auto_700522 ) ) ( not ( = ?auto_700514 ?auto_700523 ) ) ( not ( = ?auto_700514 ?auto_700524 ) ) ( not ( = ?auto_700515 ?auto_700516 ) ) ( not ( = ?auto_700515 ?auto_700517 ) ) ( not ( = ?auto_700515 ?auto_700518 ) ) ( not ( = ?auto_700515 ?auto_700519 ) ) ( not ( = ?auto_700515 ?auto_700520 ) ) ( not ( = ?auto_700515 ?auto_700521 ) ) ( not ( = ?auto_700515 ?auto_700522 ) ) ( not ( = ?auto_700515 ?auto_700523 ) ) ( not ( = ?auto_700515 ?auto_700524 ) ) ( not ( = ?auto_700516 ?auto_700517 ) ) ( not ( = ?auto_700516 ?auto_700518 ) ) ( not ( = ?auto_700516 ?auto_700519 ) ) ( not ( = ?auto_700516 ?auto_700520 ) ) ( not ( = ?auto_700516 ?auto_700521 ) ) ( not ( = ?auto_700516 ?auto_700522 ) ) ( not ( = ?auto_700516 ?auto_700523 ) ) ( not ( = ?auto_700516 ?auto_700524 ) ) ( not ( = ?auto_700517 ?auto_700518 ) ) ( not ( = ?auto_700517 ?auto_700519 ) ) ( not ( = ?auto_700517 ?auto_700520 ) ) ( not ( = ?auto_700517 ?auto_700521 ) ) ( not ( = ?auto_700517 ?auto_700522 ) ) ( not ( = ?auto_700517 ?auto_700523 ) ) ( not ( = ?auto_700517 ?auto_700524 ) ) ( not ( = ?auto_700518 ?auto_700519 ) ) ( not ( = ?auto_700518 ?auto_700520 ) ) ( not ( = ?auto_700518 ?auto_700521 ) ) ( not ( = ?auto_700518 ?auto_700522 ) ) ( not ( = ?auto_700518 ?auto_700523 ) ) ( not ( = ?auto_700518 ?auto_700524 ) ) ( not ( = ?auto_700519 ?auto_700520 ) ) ( not ( = ?auto_700519 ?auto_700521 ) ) ( not ( = ?auto_700519 ?auto_700522 ) ) ( not ( = ?auto_700519 ?auto_700523 ) ) ( not ( = ?auto_700519 ?auto_700524 ) ) ( not ( = ?auto_700520 ?auto_700521 ) ) ( not ( = ?auto_700520 ?auto_700522 ) ) ( not ( = ?auto_700520 ?auto_700523 ) ) ( not ( = ?auto_700520 ?auto_700524 ) ) ( not ( = ?auto_700521 ?auto_700522 ) ) ( not ( = ?auto_700521 ?auto_700523 ) ) ( not ( = ?auto_700521 ?auto_700524 ) ) ( not ( = ?auto_700522 ?auto_700523 ) ) ( not ( = ?auto_700522 ?auto_700524 ) ) ( not ( = ?auto_700523 ?auto_700524 ) ) ( ON ?auto_700522 ?auto_700523 ) ( ON ?auto_700521 ?auto_700522 ) ( ON ?auto_700520 ?auto_700521 ) ( ON ?auto_700519 ?auto_700520 ) ( ON ?auto_700518 ?auto_700519 ) ( CLEAR ?auto_700516 ) ( ON ?auto_700517 ?auto_700518 ) ( CLEAR ?auto_700517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_700508 ?auto_700509 ?auto_700510 ?auto_700511 ?auto_700512 ?auto_700513 ?auto_700514 ?auto_700515 ?auto_700516 ?auto_700517 )
      ( MAKE-16PILE ?auto_700508 ?auto_700509 ?auto_700510 ?auto_700511 ?auto_700512 ?auto_700513 ?auto_700514 ?auto_700515 ?auto_700516 ?auto_700517 ?auto_700518 ?auto_700519 ?auto_700520 ?auto_700521 ?auto_700522 ?auto_700523 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700574 - BLOCK
      ?auto_700575 - BLOCK
      ?auto_700576 - BLOCK
      ?auto_700577 - BLOCK
      ?auto_700578 - BLOCK
      ?auto_700579 - BLOCK
      ?auto_700580 - BLOCK
      ?auto_700581 - BLOCK
      ?auto_700582 - BLOCK
      ?auto_700583 - BLOCK
      ?auto_700584 - BLOCK
      ?auto_700585 - BLOCK
      ?auto_700586 - BLOCK
      ?auto_700587 - BLOCK
      ?auto_700588 - BLOCK
      ?auto_700589 - BLOCK
    )
    :vars
    (
      ?auto_700590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700589 ?auto_700590 ) ( ON-TABLE ?auto_700574 ) ( ON ?auto_700575 ?auto_700574 ) ( ON ?auto_700576 ?auto_700575 ) ( ON ?auto_700577 ?auto_700576 ) ( ON ?auto_700578 ?auto_700577 ) ( ON ?auto_700579 ?auto_700578 ) ( ON ?auto_700580 ?auto_700579 ) ( ON ?auto_700581 ?auto_700580 ) ( not ( = ?auto_700574 ?auto_700575 ) ) ( not ( = ?auto_700574 ?auto_700576 ) ) ( not ( = ?auto_700574 ?auto_700577 ) ) ( not ( = ?auto_700574 ?auto_700578 ) ) ( not ( = ?auto_700574 ?auto_700579 ) ) ( not ( = ?auto_700574 ?auto_700580 ) ) ( not ( = ?auto_700574 ?auto_700581 ) ) ( not ( = ?auto_700574 ?auto_700582 ) ) ( not ( = ?auto_700574 ?auto_700583 ) ) ( not ( = ?auto_700574 ?auto_700584 ) ) ( not ( = ?auto_700574 ?auto_700585 ) ) ( not ( = ?auto_700574 ?auto_700586 ) ) ( not ( = ?auto_700574 ?auto_700587 ) ) ( not ( = ?auto_700574 ?auto_700588 ) ) ( not ( = ?auto_700574 ?auto_700589 ) ) ( not ( = ?auto_700574 ?auto_700590 ) ) ( not ( = ?auto_700575 ?auto_700576 ) ) ( not ( = ?auto_700575 ?auto_700577 ) ) ( not ( = ?auto_700575 ?auto_700578 ) ) ( not ( = ?auto_700575 ?auto_700579 ) ) ( not ( = ?auto_700575 ?auto_700580 ) ) ( not ( = ?auto_700575 ?auto_700581 ) ) ( not ( = ?auto_700575 ?auto_700582 ) ) ( not ( = ?auto_700575 ?auto_700583 ) ) ( not ( = ?auto_700575 ?auto_700584 ) ) ( not ( = ?auto_700575 ?auto_700585 ) ) ( not ( = ?auto_700575 ?auto_700586 ) ) ( not ( = ?auto_700575 ?auto_700587 ) ) ( not ( = ?auto_700575 ?auto_700588 ) ) ( not ( = ?auto_700575 ?auto_700589 ) ) ( not ( = ?auto_700575 ?auto_700590 ) ) ( not ( = ?auto_700576 ?auto_700577 ) ) ( not ( = ?auto_700576 ?auto_700578 ) ) ( not ( = ?auto_700576 ?auto_700579 ) ) ( not ( = ?auto_700576 ?auto_700580 ) ) ( not ( = ?auto_700576 ?auto_700581 ) ) ( not ( = ?auto_700576 ?auto_700582 ) ) ( not ( = ?auto_700576 ?auto_700583 ) ) ( not ( = ?auto_700576 ?auto_700584 ) ) ( not ( = ?auto_700576 ?auto_700585 ) ) ( not ( = ?auto_700576 ?auto_700586 ) ) ( not ( = ?auto_700576 ?auto_700587 ) ) ( not ( = ?auto_700576 ?auto_700588 ) ) ( not ( = ?auto_700576 ?auto_700589 ) ) ( not ( = ?auto_700576 ?auto_700590 ) ) ( not ( = ?auto_700577 ?auto_700578 ) ) ( not ( = ?auto_700577 ?auto_700579 ) ) ( not ( = ?auto_700577 ?auto_700580 ) ) ( not ( = ?auto_700577 ?auto_700581 ) ) ( not ( = ?auto_700577 ?auto_700582 ) ) ( not ( = ?auto_700577 ?auto_700583 ) ) ( not ( = ?auto_700577 ?auto_700584 ) ) ( not ( = ?auto_700577 ?auto_700585 ) ) ( not ( = ?auto_700577 ?auto_700586 ) ) ( not ( = ?auto_700577 ?auto_700587 ) ) ( not ( = ?auto_700577 ?auto_700588 ) ) ( not ( = ?auto_700577 ?auto_700589 ) ) ( not ( = ?auto_700577 ?auto_700590 ) ) ( not ( = ?auto_700578 ?auto_700579 ) ) ( not ( = ?auto_700578 ?auto_700580 ) ) ( not ( = ?auto_700578 ?auto_700581 ) ) ( not ( = ?auto_700578 ?auto_700582 ) ) ( not ( = ?auto_700578 ?auto_700583 ) ) ( not ( = ?auto_700578 ?auto_700584 ) ) ( not ( = ?auto_700578 ?auto_700585 ) ) ( not ( = ?auto_700578 ?auto_700586 ) ) ( not ( = ?auto_700578 ?auto_700587 ) ) ( not ( = ?auto_700578 ?auto_700588 ) ) ( not ( = ?auto_700578 ?auto_700589 ) ) ( not ( = ?auto_700578 ?auto_700590 ) ) ( not ( = ?auto_700579 ?auto_700580 ) ) ( not ( = ?auto_700579 ?auto_700581 ) ) ( not ( = ?auto_700579 ?auto_700582 ) ) ( not ( = ?auto_700579 ?auto_700583 ) ) ( not ( = ?auto_700579 ?auto_700584 ) ) ( not ( = ?auto_700579 ?auto_700585 ) ) ( not ( = ?auto_700579 ?auto_700586 ) ) ( not ( = ?auto_700579 ?auto_700587 ) ) ( not ( = ?auto_700579 ?auto_700588 ) ) ( not ( = ?auto_700579 ?auto_700589 ) ) ( not ( = ?auto_700579 ?auto_700590 ) ) ( not ( = ?auto_700580 ?auto_700581 ) ) ( not ( = ?auto_700580 ?auto_700582 ) ) ( not ( = ?auto_700580 ?auto_700583 ) ) ( not ( = ?auto_700580 ?auto_700584 ) ) ( not ( = ?auto_700580 ?auto_700585 ) ) ( not ( = ?auto_700580 ?auto_700586 ) ) ( not ( = ?auto_700580 ?auto_700587 ) ) ( not ( = ?auto_700580 ?auto_700588 ) ) ( not ( = ?auto_700580 ?auto_700589 ) ) ( not ( = ?auto_700580 ?auto_700590 ) ) ( not ( = ?auto_700581 ?auto_700582 ) ) ( not ( = ?auto_700581 ?auto_700583 ) ) ( not ( = ?auto_700581 ?auto_700584 ) ) ( not ( = ?auto_700581 ?auto_700585 ) ) ( not ( = ?auto_700581 ?auto_700586 ) ) ( not ( = ?auto_700581 ?auto_700587 ) ) ( not ( = ?auto_700581 ?auto_700588 ) ) ( not ( = ?auto_700581 ?auto_700589 ) ) ( not ( = ?auto_700581 ?auto_700590 ) ) ( not ( = ?auto_700582 ?auto_700583 ) ) ( not ( = ?auto_700582 ?auto_700584 ) ) ( not ( = ?auto_700582 ?auto_700585 ) ) ( not ( = ?auto_700582 ?auto_700586 ) ) ( not ( = ?auto_700582 ?auto_700587 ) ) ( not ( = ?auto_700582 ?auto_700588 ) ) ( not ( = ?auto_700582 ?auto_700589 ) ) ( not ( = ?auto_700582 ?auto_700590 ) ) ( not ( = ?auto_700583 ?auto_700584 ) ) ( not ( = ?auto_700583 ?auto_700585 ) ) ( not ( = ?auto_700583 ?auto_700586 ) ) ( not ( = ?auto_700583 ?auto_700587 ) ) ( not ( = ?auto_700583 ?auto_700588 ) ) ( not ( = ?auto_700583 ?auto_700589 ) ) ( not ( = ?auto_700583 ?auto_700590 ) ) ( not ( = ?auto_700584 ?auto_700585 ) ) ( not ( = ?auto_700584 ?auto_700586 ) ) ( not ( = ?auto_700584 ?auto_700587 ) ) ( not ( = ?auto_700584 ?auto_700588 ) ) ( not ( = ?auto_700584 ?auto_700589 ) ) ( not ( = ?auto_700584 ?auto_700590 ) ) ( not ( = ?auto_700585 ?auto_700586 ) ) ( not ( = ?auto_700585 ?auto_700587 ) ) ( not ( = ?auto_700585 ?auto_700588 ) ) ( not ( = ?auto_700585 ?auto_700589 ) ) ( not ( = ?auto_700585 ?auto_700590 ) ) ( not ( = ?auto_700586 ?auto_700587 ) ) ( not ( = ?auto_700586 ?auto_700588 ) ) ( not ( = ?auto_700586 ?auto_700589 ) ) ( not ( = ?auto_700586 ?auto_700590 ) ) ( not ( = ?auto_700587 ?auto_700588 ) ) ( not ( = ?auto_700587 ?auto_700589 ) ) ( not ( = ?auto_700587 ?auto_700590 ) ) ( not ( = ?auto_700588 ?auto_700589 ) ) ( not ( = ?auto_700588 ?auto_700590 ) ) ( not ( = ?auto_700589 ?auto_700590 ) ) ( ON ?auto_700588 ?auto_700589 ) ( ON ?auto_700587 ?auto_700588 ) ( ON ?auto_700586 ?auto_700587 ) ( ON ?auto_700585 ?auto_700586 ) ( ON ?auto_700584 ?auto_700585 ) ( ON ?auto_700583 ?auto_700584 ) ( CLEAR ?auto_700581 ) ( ON ?auto_700582 ?auto_700583 ) ( CLEAR ?auto_700582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_700574 ?auto_700575 ?auto_700576 ?auto_700577 ?auto_700578 ?auto_700579 ?auto_700580 ?auto_700581 ?auto_700582 )
      ( MAKE-16PILE ?auto_700574 ?auto_700575 ?auto_700576 ?auto_700577 ?auto_700578 ?auto_700579 ?auto_700580 ?auto_700581 ?auto_700582 ?auto_700583 ?auto_700584 ?auto_700585 ?auto_700586 ?auto_700587 ?auto_700588 ?auto_700589 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700640 - BLOCK
      ?auto_700641 - BLOCK
      ?auto_700642 - BLOCK
      ?auto_700643 - BLOCK
      ?auto_700644 - BLOCK
      ?auto_700645 - BLOCK
      ?auto_700646 - BLOCK
      ?auto_700647 - BLOCK
      ?auto_700648 - BLOCK
      ?auto_700649 - BLOCK
      ?auto_700650 - BLOCK
      ?auto_700651 - BLOCK
      ?auto_700652 - BLOCK
      ?auto_700653 - BLOCK
      ?auto_700654 - BLOCK
      ?auto_700655 - BLOCK
    )
    :vars
    (
      ?auto_700656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700655 ?auto_700656 ) ( ON-TABLE ?auto_700640 ) ( ON ?auto_700641 ?auto_700640 ) ( ON ?auto_700642 ?auto_700641 ) ( ON ?auto_700643 ?auto_700642 ) ( ON ?auto_700644 ?auto_700643 ) ( ON ?auto_700645 ?auto_700644 ) ( ON ?auto_700646 ?auto_700645 ) ( not ( = ?auto_700640 ?auto_700641 ) ) ( not ( = ?auto_700640 ?auto_700642 ) ) ( not ( = ?auto_700640 ?auto_700643 ) ) ( not ( = ?auto_700640 ?auto_700644 ) ) ( not ( = ?auto_700640 ?auto_700645 ) ) ( not ( = ?auto_700640 ?auto_700646 ) ) ( not ( = ?auto_700640 ?auto_700647 ) ) ( not ( = ?auto_700640 ?auto_700648 ) ) ( not ( = ?auto_700640 ?auto_700649 ) ) ( not ( = ?auto_700640 ?auto_700650 ) ) ( not ( = ?auto_700640 ?auto_700651 ) ) ( not ( = ?auto_700640 ?auto_700652 ) ) ( not ( = ?auto_700640 ?auto_700653 ) ) ( not ( = ?auto_700640 ?auto_700654 ) ) ( not ( = ?auto_700640 ?auto_700655 ) ) ( not ( = ?auto_700640 ?auto_700656 ) ) ( not ( = ?auto_700641 ?auto_700642 ) ) ( not ( = ?auto_700641 ?auto_700643 ) ) ( not ( = ?auto_700641 ?auto_700644 ) ) ( not ( = ?auto_700641 ?auto_700645 ) ) ( not ( = ?auto_700641 ?auto_700646 ) ) ( not ( = ?auto_700641 ?auto_700647 ) ) ( not ( = ?auto_700641 ?auto_700648 ) ) ( not ( = ?auto_700641 ?auto_700649 ) ) ( not ( = ?auto_700641 ?auto_700650 ) ) ( not ( = ?auto_700641 ?auto_700651 ) ) ( not ( = ?auto_700641 ?auto_700652 ) ) ( not ( = ?auto_700641 ?auto_700653 ) ) ( not ( = ?auto_700641 ?auto_700654 ) ) ( not ( = ?auto_700641 ?auto_700655 ) ) ( not ( = ?auto_700641 ?auto_700656 ) ) ( not ( = ?auto_700642 ?auto_700643 ) ) ( not ( = ?auto_700642 ?auto_700644 ) ) ( not ( = ?auto_700642 ?auto_700645 ) ) ( not ( = ?auto_700642 ?auto_700646 ) ) ( not ( = ?auto_700642 ?auto_700647 ) ) ( not ( = ?auto_700642 ?auto_700648 ) ) ( not ( = ?auto_700642 ?auto_700649 ) ) ( not ( = ?auto_700642 ?auto_700650 ) ) ( not ( = ?auto_700642 ?auto_700651 ) ) ( not ( = ?auto_700642 ?auto_700652 ) ) ( not ( = ?auto_700642 ?auto_700653 ) ) ( not ( = ?auto_700642 ?auto_700654 ) ) ( not ( = ?auto_700642 ?auto_700655 ) ) ( not ( = ?auto_700642 ?auto_700656 ) ) ( not ( = ?auto_700643 ?auto_700644 ) ) ( not ( = ?auto_700643 ?auto_700645 ) ) ( not ( = ?auto_700643 ?auto_700646 ) ) ( not ( = ?auto_700643 ?auto_700647 ) ) ( not ( = ?auto_700643 ?auto_700648 ) ) ( not ( = ?auto_700643 ?auto_700649 ) ) ( not ( = ?auto_700643 ?auto_700650 ) ) ( not ( = ?auto_700643 ?auto_700651 ) ) ( not ( = ?auto_700643 ?auto_700652 ) ) ( not ( = ?auto_700643 ?auto_700653 ) ) ( not ( = ?auto_700643 ?auto_700654 ) ) ( not ( = ?auto_700643 ?auto_700655 ) ) ( not ( = ?auto_700643 ?auto_700656 ) ) ( not ( = ?auto_700644 ?auto_700645 ) ) ( not ( = ?auto_700644 ?auto_700646 ) ) ( not ( = ?auto_700644 ?auto_700647 ) ) ( not ( = ?auto_700644 ?auto_700648 ) ) ( not ( = ?auto_700644 ?auto_700649 ) ) ( not ( = ?auto_700644 ?auto_700650 ) ) ( not ( = ?auto_700644 ?auto_700651 ) ) ( not ( = ?auto_700644 ?auto_700652 ) ) ( not ( = ?auto_700644 ?auto_700653 ) ) ( not ( = ?auto_700644 ?auto_700654 ) ) ( not ( = ?auto_700644 ?auto_700655 ) ) ( not ( = ?auto_700644 ?auto_700656 ) ) ( not ( = ?auto_700645 ?auto_700646 ) ) ( not ( = ?auto_700645 ?auto_700647 ) ) ( not ( = ?auto_700645 ?auto_700648 ) ) ( not ( = ?auto_700645 ?auto_700649 ) ) ( not ( = ?auto_700645 ?auto_700650 ) ) ( not ( = ?auto_700645 ?auto_700651 ) ) ( not ( = ?auto_700645 ?auto_700652 ) ) ( not ( = ?auto_700645 ?auto_700653 ) ) ( not ( = ?auto_700645 ?auto_700654 ) ) ( not ( = ?auto_700645 ?auto_700655 ) ) ( not ( = ?auto_700645 ?auto_700656 ) ) ( not ( = ?auto_700646 ?auto_700647 ) ) ( not ( = ?auto_700646 ?auto_700648 ) ) ( not ( = ?auto_700646 ?auto_700649 ) ) ( not ( = ?auto_700646 ?auto_700650 ) ) ( not ( = ?auto_700646 ?auto_700651 ) ) ( not ( = ?auto_700646 ?auto_700652 ) ) ( not ( = ?auto_700646 ?auto_700653 ) ) ( not ( = ?auto_700646 ?auto_700654 ) ) ( not ( = ?auto_700646 ?auto_700655 ) ) ( not ( = ?auto_700646 ?auto_700656 ) ) ( not ( = ?auto_700647 ?auto_700648 ) ) ( not ( = ?auto_700647 ?auto_700649 ) ) ( not ( = ?auto_700647 ?auto_700650 ) ) ( not ( = ?auto_700647 ?auto_700651 ) ) ( not ( = ?auto_700647 ?auto_700652 ) ) ( not ( = ?auto_700647 ?auto_700653 ) ) ( not ( = ?auto_700647 ?auto_700654 ) ) ( not ( = ?auto_700647 ?auto_700655 ) ) ( not ( = ?auto_700647 ?auto_700656 ) ) ( not ( = ?auto_700648 ?auto_700649 ) ) ( not ( = ?auto_700648 ?auto_700650 ) ) ( not ( = ?auto_700648 ?auto_700651 ) ) ( not ( = ?auto_700648 ?auto_700652 ) ) ( not ( = ?auto_700648 ?auto_700653 ) ) ( not ( = ?auto_700648 ?auto_700654 ) ) ( not ( = ?auto_700648 ?auto_700655 ) ) ( not ( = ?auto_700648 ?auto_700656 ) ) ( not ( = ?auto_700649 ?auto_700650 ) ) ( not ( = ?auto_700649 ?auto_700651 ) ) ( not ( = ?auto_700649 ?auto_700652 ) ) ( not ( = ?auto_700649 ?auto_700653 ) ) ( not ( = ?auto_700649 ?auto_700654 ) ) ( not ( = ?auto_700649 ?auto_700655 ) ) ( not ( = ?auto_700649 ?auto_700656 ) ) ( not ( = ?auto_700650 ?auto_700651 ) ) ( not ( = ?auto_700650 ?auto_700652 ) ) ( not ( = ?auto_700650 ?auto_700653 ) ) ( not ( = ?auto_700650 ?auto_700654 ) ) ( not ( = ?auto_700650 ?auto_700655 ) ) ( not ( = ?auto_700650 ?auto_700656 ) ) ( not ( = ?auto_700651 ?auto_700652 ) ) ( not ( = ?auto_700651 ?auto_700653 ) ) ( not ( = ?auto_700651 ?auto_700654 ) ) ( not ( = ?auto_700651 ?auto_700655 ) ) ( not ( = ?auto_700651 ?auto_700656 ) ) ( not ( = ?auto_700652 ?auto_700653 ) ) ( not ( = ?auto_700652 ?auto_700654 ) ) ( not ( = ?auto_700652 ?auto_700655 ) ) ( not ( = ?auto_700652 ?auto_700656 ) ) ( not ( = ?auto_700653 ?auto_700654 ) ) ( not ( = ?auto_700653 ?auto_700655 ) ) ( not ( = ?auto_700653 ?auto_700656 ) ) ( not ( = ?auto_700654 ?auto_700655 ) ) ( not ( = ?auto_700654 ?auto_700656 ) ) ( not ( = ?auto_700655 ?auto_700656 ) ) ( ON ?auto_700654 ?auto_700655 ) ( ON ?auto_700653 ?auto_700654 ) ( ON ?auto_700652 ?auto_700653 ) ( ON ?auto_700651 ?auto_700652 ) ( ON ?auto_700650 ?auto_700651 ) ( ON ?auto_700649 ?auto_700650 ) ( ON ?auto_700648 ?auto_700649 ) ( CLEAR ?auto_700646 ) ( ON ?auto_700647 ?auto_700648 ) ( CLEAR ?auto_700647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_700640 ?auto_700641 ?auto_700642 ?auto_700643 ?auto_700644 ?auto_700645 ?auto_700646 ?auto_700647 )
      ( MAKE-16PILE ?auto_700640 ?auto_700641 ?auto_700642 ?auto_700643 ?auto_700644 ?auto_700645 ?auto_700646 ?auto_700647 ?auto_700648 ?auto_700649 ?auto_700650 ?auto_700651 ?auto_700652 ?auto_700653 ?auto_700654 ?auto_700655 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700706 - BLOCK
      ?auto_700707 - BLOCK
      ?auto_700708 - BLOCK
      ?auto_700709 - BLOCK
      ?auto_700710 - BLOCK
      ?auto_700711 - BLOCK
      ?auto_700712 - BLOCK
      ?auto_700713 - BLOCK
      ?auto_700714 - BLOCK
      ?auto_700715 - BLOCK
      ?auto_700716 - BLOCK
      ?auto_700717 - BLOCK
      ?auto_700718 - BLOCK
      ?auto_700719 - BLOCK
      ?auto_700720 - BLOCK
      ?auto_700721 - BLOCK
    )
    :vars
    (
      ?auto_700722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700721 ?auto_700722 ) ( ON-TABLE ?auto_700706 ) ( ON ?auto_700707 ?auto_700706 ) ( ON ?auto_700708 ?auto_700707 ) ( ON ?auto_700709 ?auto_700708 ) ( ON ?auto_700710 ?auto_700709 ) ( ON ?auto_700711 ?auto_700710 ) ( not ( = ?auto_700706 ?auto_700707 ) ) ( not ( = ?auto_700706 ?auto_700708 ) ) ( not ( = ?auto_700706 ?auto_700709 ) ) ( not ( = ?auto_700706 ?auto_700710 ) ) ( not ( = ?auto_700706 ?auto_700711 ) ) ( not ( = ?auto_700706 ?auto_700712 ) ) ( not ( = ?auto_700706 ?auto_700713 ) ) ( not ( = ?auto_700706 ?auto_700714 ) ) ( not ( = ?auto_700706 ?auto_700715 ) ) ( not ( = ?auto_700706 ?auto_700716 ) ) ( not ( = ?auto_700706 ?auto_700717 ) ) ( not ( = ?auto_700706 ?auto_700718 ) ) ( not ( = ?auto_700706 ?auto_700719 ) ) ( not ( = ?auto_700706 ?auto_700720 ) ) ( not ( = ?auto_700706 ?auto_700721 ) ) ( not ( = ?auto_700706 ?auto_700722 ) ) ( not ( = ?auto_700707 ?auto_700708 ) ) ( not ( = ?auto_700707 ?auto_700709 ) ) ( not ( = ?auto_700707 ?auto_700710 ) ) ( not ( = ?auto_700707 ?auto_700711 ) ) ( not ( = ?auto_700707 ?auto_700712 ) ) ( not ( = ?auto_700707 ?auto_700713 ) ) ( not ( = ?auto_700707 ?auto_700714 ) ) ( not ( = ?auto_700707 ?auto_700715 ) ) ( not ( = ?auto_700707 ?auto_700716 ) ) ( not ( = ?auto_700707 ?auto_700717 ) ) ( not ( = ?auto_700707 ?auto_700718 ) ) ( not ( = ?auto_700707 ?auto_700719 ) ) ( not ( = ?auto_700707 ?auto_700720 ) ) ( not ( = ?auto_700707 ?auto_700721 ) ) ( not ( = ?auto_700707 ?auto_700722 ) ) ( not ( = ?auto_700708 ?auto_700709 ) ) ( not ( = ?auto_700708 ?auto_700710 ) ) ( not ( = ?auto_700708 ?auto_700711 ) ) ( not ( = ?auto_700708 ?auto_700712 ) ) ( not ( = ?auto_700708 ?auto_700713 ) ) ( not ( = ?auto_700708 ?auto_700714 ) ) ( not ( = ?auto_700708 ?auto_700715 ) ) ( not ( = ?auto_700708 ?auto_700716 ) ) ( not ( = ?auto_700708 ?auto_700717 ) ) ( not ( = ?auto_700708 ?auto_700718 ) ) ( not ( = ?auto_700708 ?auto_700719 ) ) ( not ( = ?auto_700708 ?auto_700720 ) ) ( not ( = ?auto_700708 ?auto_700721 ) ) ( not ( = ?auto_700708 ?auto_700722 ) ) ( not ( = ?auto_700709 ?auto_700710 ) ) ( not ( = ?auto_700709 ?auto_700711 ) ) ( not ( = ?auto_700709 ?auto_700712 ) ) ( not ( = ?auto_700709 ?auto_700713 ) ) ( not ( = ?auto_700709 ?auto_700714 ) ) ( not ( = ?auto_700709 ?auto_700715 ) ) ( not ( = ?auto_700709 ?auto_700716 ) ) ( not ( = ?auto_700709 ?auto_700717 ) ) ( not ( = ?auto_700709 ?auto_700718 ) ) ( not ( = ?auto_700709 ?auto_700719 ) ) ( not ( = ?auto_700709 ?auto_700720 ) ) ( not ( = ?auto_700709 ?auto_700721 ) ) ( not ( = ?auto_700709 ?auto_700722 ) ) ( not ( = ?auto_700710 ?auto_700711 ) ) ( not ( = ?auto_700710 ?auto_700712 ) ) ( not ( = ?auto_700710 ?auto_700713 ) ) ( not ( = ?auto_700710 ?auto_700714 ) ) ( not ( = ?auto_700710 ?auto_700715 ) ) ( not ( = ?auto_700710 ?auto_700716 ) ) ( not ( = ?auto_700710 ?auto_700717 ) ) ( not ( = ?auto_700710 ?auto_700718 ) ) ( not ( = ?auto_700710 ?auto_700719 ) ) ( not ( = ?auto_700710 ?auto_700720 ) ) ( not ( = ?auto_700710 ?auto_700721 ) ) ( not ( = ?auto_700710 ?auto_700722 ) ) ( not ( = ?auto_700711 ?auto_700712 ) ) ( not ( = ?auto_700711 ?auto_700713 ) ) ( not ( = ?auto_700711 ?auto_700714 ) ) ( not ( = ?auto_700711 ?auto_700715 ) ) ( not ( = ?auto_700711 ?auto_700716 ) ) ( not ( = ?auto_700711 ?auto_700717 ) ) ( not ( = ?auto_700711 ?auto_700718 ) ) ( not ( = ?auto_700711 ?auto_700719 ) ) ( not ( = ?auto_700711 ?auto_700720 ) ) ( not ( = ?auto_700711 ?auto_700721 ) ) ( not ( = ?auto_700711 ?auto_700722 ) ) ( not ( = ?auto_700712 ?auto_700713 ) ) ( not ( = ?auto_700712 ?auto_700714 ) ) ( not ( = ?auto_700712 ?auto_700715 ) ) ( not ( = ?auto_700712 ?auto_700716 ) ) ( not ( = ?auto_700712 ?auto_700717 ) ) ( not ( = ?auto_700712 ?auto_700718 ) ) ( not ( = ?auto_700712 ?auto_700719 ) ) ( not ( = ?auto_700712 ?auto_700720 ) ) ( not ( = ?auto_700712 ?auto_700721 ) ) ( not ( = ?auto_700712 ?auto_700722 ) ) ( not ( = ?auto_700713 ?auto_700714 ) ) ( not ( = ?auto_700713 ?auto_700715 ) ) ( not ( = ?auto_700713 ?auto_700716 ) ) ( not ( = ?auto_700713 ?auto_700717 ) ) ( not ( = ?auto_700713 ?auto_700718 ) ) ( not ( = ?auto_700713 ?auto_700719 ) ) ( not ( = ?auto_700713 ?auto_700720 ) ) ( not ( = ?auto_700713 ?auto_700721 ) ) ( not ( = ?auto_700713 ?auto_700722 ) ) ( not ( = ?auto_700714 ?auto_700715 ) ) ( not ( = ?auto_700714 ?auto_700716 ) ) ( not ( = ?auto_700714 ?auto_700717 ) ) ( not ( = ?auto_700714 ?auto_700718 ) ) ( not ( = ?auto_700714 ?auto_700719 ) ) ( not ( = ?auto_700714 ?auto_700720 ) ) ( not ( = ?auto_700714 ?auto_700721 ) ) ( not ( = ?auto_700714 ?auto_700722 ) ) ( not ( = ?auto_700715 ?auto_700716 ) ) ( not ( = ?auto_700715 ?auto_700717 ) ) ( not ( = ?auto_700715 ?auto_700718 ) ) ( not ( = ?auto_700715 ?auto_700719 ) ) ( not ( = ?auto_700715 ?auto_700720 ) ) ( not ( = ?auto_700715 ?auto_700721 ) ) ( not ( = ?auto_700715 ?auto_700722 ) ) ( not ( = ?auto_700716 ?auto_700717 ) ) ( not ( = ?auto_700716 ?auto_700718 ) ) ( not ( = ?auto_700716 ?auto_700719 ) ) ( not ( = ?auto_700716 ?auto_700720 ) ) ( not ( = ?auto_700716 ?auto_700721 ) ) ( not ( = ?auto_700716 ?auto_700722 ) ) ( not ( = ?auto_700717 ?auto_700718 ) ) ( not ( = ?auto_700717 ?auto_700719 ) ) ( not ( = ?auto_700717 ?auto_700720 ) ) ( not ( = ?auto_700717 ?auto_700721 ) ) ( not ( = ?auto_700717 ?auto_700722 ) ) ( not ( = ?auto_700718 ?auto_700719 ) ) ( not ( = ?auto_700718 ?auto_700720 ) ) ( not ( = ?auto_700718 ?auto_700721 ) ) ( not ( = ?auto_700718 ?auto_700722 ) ) ( not ( = ?auto_700719 ?auto_700720 ) ) ( not ( = ?auto_700719 ?auto_700721 ) ) ( not ( = ?auto_700719 ?auto_700722 ) ) ( not ( = ?auto_700720 ?auto_700721 ) ) ( not ( = ?auto_700720 ?auto_700722 ) ) ( not ( = ?auto_700721 ?auto_700722 ) ) ( ON ?auto_700720 ?auto_700721 ) ( ON ?auto_700719 ?auto_700720 ) ( ON ?auto_700718 ?auto_700719 ) ( ON ?auto_700717 ?auto_700718 ) ( ON ?auto_700716 ?auto_700717 ) ( ON ?auto_700715 ?auto_700716 ) ( ON ?auto_700714 ?auto_700715 ) ( ON ?auto_700713 ?auto_700714 ) ( CLEAR ?auto_700711 ) ( ON ?auto_700712 ?auto_700713 ) ( CLEAR ?auto_700712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_700706 ?auto_700707 ?auto_700708 ?auto_700709 ?auto_700710 ?auto_700711 ?auto_700712 )
      ( MAKE-16PILE ?auto_700706 ?auto_700707 ?auto_700708 ?auto_700709 ?auto_700710 ?auto_700711 ?auto_700712 ?auto_700713 ?auto_700714 ?auto_700715 ?auto_700716 ?auto_700717 ?auto_700718 ?auto_700719 ?auto_700720 ?auto_700721 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700772 - BLOCK
      ?auto_700773 - BLOCK
      ?auto_700774 - BLOCK
      ?auto_700775 - BLOCK
      ?auto_700776 - BLOCK
      ?auto_700777 - BLOCK
      ?auto_700778 - BLOCK
      ?auto_700779 - BLOCK
      ?auto_700780 - BLOCK
      ?auto_700781 - BLOCK
      ?auto_700782 - BLOCK
      ?auto_700783 - BLOCK
      ?auto_700784 - BLOCK
      ?auto_700785 - BLOCK
      ?auto_700786 - BLOCK
      ?auto_700787 - BLOCK
    )
    :vars
    (
      ?auto_700788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700787 ?auto_700788 ) ( ON-TABLE ?auto_700772 ) ( ON ?auto_700773 ?auto_700772 ) ( ON ?auto_700774 ?auto_700773 ) ( ON ?auto_700775 ?auto_700774 ) ( ON ?auto_700776 ?auto_700775 ) ( not ( = ?auto_700772 ?auto_700773 ) ) ( not ( = ?auto_700772 ?auto_700774 ) ) ( not ( = ?auto_700772 ?auto_700775 ) ) ( not ( = ?auto_700772 ?auto_700776 ) ) ( not ( = ?auto_700772 ?auto_700777 ) ) ( not ( = ?auto_700772 ?auto_700778 ) ) ( not ( = ?auto_700772 ?auto_700779 ) ) ( not ( = ?auto_700772 ?auto_700780 ) ) ( not ( = ?auto_700772 ?auto_700781 ) ) ( not ( = ?auto_700772 ?auto_700782 ) ) ( not ( = ?auto_700772 ?auto_700783 ) ) ( not ( = ?auto_700772 ?auto_700784 ) ) ( not ( = ?auto_700772 ?auto_700785 ) ) ( not ( = ?auto_700772 ?auto_700786 ) ) ( not ( = ?auto_700772 ?auto_700787 ) ) ( not ( = ?auto_700772 ?auto_700788 ) ) ( not ( = ?auto_700773 ?auto_700774 ) ) ( not ( = ?auto_700773 ?auto_700775 ) ) ( not ( = ?auto_700773 ?auto_700776 ) ) ( not ( = ?auto_700773 ?auto_700777 ) ) ( not ( = ?auto_700773 ?auto_700778 ) ) ( not ( = ?auto_700773 ?auto_700779 ) ) ( not ( = ?auto_700773 ?auto_700780 ) ) ( not ( = ?auto_700773 ?auto_700781 ) ) ( not ( = ?auto_700773 ?auto_700782 ) ) ( not ( = ?auto_700773 ?auto_700783 ) ) ( not ( = ?auto_700773 ?auto_700784 ) ) ( not ( = ?auto_700773 ?auto_700785 ) ) ( not ( = ?auto_700773 ?auto_700786 ) ) ( not ( = ?auto_700773 ?auto_700787 ) ) ( not ( = ?auto_700773 ?auto_700788 ) ) ( not ( = ?auto_700774 ?auto_700775 ) ) ( not ( = ?auto_700774 ?auto_700776 ) ) ( not ( = ?auto_700774 ?auto_700777 ) ) ( not ( = ?auto_700774 ?auto_700778 ) ) ( not ( = ?auto_700774 ?auto_700779 ) ) ( not ( = ?auto_700774 ?auto_700780 ) ) ( not ( = ?auto_700774 ?auto_700781 ) ) ( not ( = ?auto_700774 ?auto_700782 ) ) ( not ( = ?auto_700774 ?auto_700783 ) ) ( not ( = ?auto_700774 ?auto_700784 ) ) ( not ( = ?auto_700774 ?auto_700785 ) ) ( not ( = ?auto_700774 ?auto_700786 ) ) ( not ( = ?auto_700774 ?auto_700787 ) ) ( not ( = ?auto_700774 ?auto_700788 ) ) ( not ( = ?auto_700775 ?auto_700776 ) ) ( not ( = ?auto_700775 ?auto_700777 ) ) ( not ( = ?auto_700775 ?auto_700778 ) ) ( not ( = ?auto_700775 ?auto_700779 ) ) ( not ( = ?auto_700775 ?auto_700780 ) ) ( not ( = ?auto_700775 ?auto_700781 ) ) ( not ( = ?auto_700775 ?auto_700782 ) ) ( not ( = ?auto_700775 ?auto_700783 ) ) ( not ( = ?auto_700775 ?auto_700784 ) ) ( not ( = ?auto_700775 ?auto_700785 ) ) ( not ( = ?auto_700775 ?auto_700786 ) ) ( not ( = ?auto_700775 ?auto_700787 ) ) ( not ( = ?auto_700775 ?auto_700788 ) ) ( not ( = ?auto_700776 ?auto_700777 ) ) ( not ( = ?auto_700776 ?auto_700778 ) ) ( not ( = ?auto_700776 ?auto_700779 ) ) ( not ( = ?auto_700776 ?auto_700780 ) ) ( not ( = ?auto_700776 ?auto_700781 ) ) ( not ( = ?auto_700776 ?auto_700782 ) ) ( not ( = ?auto_700776 ?auto_700783 ) ) ( not ( = ?auto_700776 ?auto_700784 ) ) ( not ( = ?auto_700776 ?auto_700785 ) ) ( not ( = ?auto_700776 ?auto_700786 ) ) ( not ( = ?auto_700776 ?auto_700787 ) ) ( not ( = ?auto_700776 ?auto_700788 ) ) ( not ( = ?auto_700777 ?auto_700778 ) ) ( not ( = ?auto_700777 ?auto_700779 ) ) ( not ( = ?auto_700777 ?auto_700780 ) ) ( not ( = ?auto_700777 ?auto_700781 ) ) ( not ( = ?auto_700777 ?auto_700782 ) ) ( not ( = ?auto_700777 ?auto_700783 ) ) ( not ( = ?auto_700777 ?auto_700784 ) ) ( not ( = ?auto_700777 ?auto_700785 ) ) ( not ( = ?auto_700777 ?auto_700786 ) ) ( not ( = ?auto_700777 ?auto_700787 ) ) ( not ( = ?auto_700777 ?auto_700788 ) ) ( not ( = ?auto_700778 ?auto_700779 ) ) ( not ( = ?auto_700778 ?auto_700780 ) ) ( not ( = ?auto_700778 ?auto_700781 ) ) ( not ( = ?auto_700778 ?auto_700782 ) ) ( not ( = ?auto_700778 ?auto_700783 ) ) ( not ( = ?auto_700778 ?auto_700784 ) ) ( not ( = ?auto_700778 ?auto_700785 ) ) ( not ( = ?auto_700778 ?auto_700786 ) ) ( not ( = ?auto_700778 ?auto_700787 ) ) ( not ( = ?auto_700778 ?auto_700788 ) ) ( not ( = ?auto_700779 ?auto_700780 ) ) ( not ( = ?auto_700779 ?auto_700781 ) ) ( not ( = ?auto_700779 ?auto_700782 ) ) ( not ( = ?auto_700779 ?auto_700783 ) ) ( not ( = ?auto_700779 ?auto_700784 ) ) ( not ( = ?auto_700779 ?auto_700785 ) ) ( not ( = ?auto_700779 ?auto_700786 ) ) ( not ( = ?auto_700779 ?auto_700787 ) ) ( not ( = ?auto_700779 ?auto_700788 ) ) ( not ( = ?auto_700780 ?auto_700781 ) ) ( not ( = ?auto_700780 ?auto_700782 ) ) ( not ( = ?auto_700780 ?auto_700783 ) ) ( not ( = ?auto_700780 ?auto_700784 ) ) ( not ( = ?auto_700780 ?auto_700785 ) ) ( not ( = ?auto_700780 ?auto_700786 ) ) ( not ( = ?auto_700780 ?auto_700787 ) ) ( not ( = ?auto_700780 ?auto_700788 ) ) ( not ( = ?auto_700781 ?auto_700782 ) ) ( not ( = ?auto_700781 ?auto_700783 ) ) ( not ( = ?auto_700781 ?auto_700784 ) ) ( not ( = ?auto_700781 ?auto_700785 ) ) ( not ( = ?auto_700781 ?auto_700786 ) ) ( not ( = ?auto_700781 ?auto_700787 ) ) ( not ( = ?auto_700781 ?auto_700788 ) ) ( not ( = ?auto_700782 ?auto_700783 ) ) ( not ( = ?auto_700782 ?auto_700784 ) ) ( not ( = ?auto_700782 ?auto_700785 ) ) ( not ( = ?auto_700782 ?auto_700786 ) ) ( not ( = ?auto_700782 ?auto_700787 ) ) ( not ( = ?auto_700782 ?auto_700788 ) ) ( not ( = ?auto_700783 ?auto_700784 ) ) ( not ( = ?auto_700783 ?auto_700785 ) ) ( not ( = ?auto_700783 ?auto_700786 ) ) ( not ( = ?auto_700783 ?auto_700787 ) ) ( not ( = ?auto_700783 ?auto_700788 ) ) ( not ( = ?auto_700784 ?auto_700785 ) ) ( not ( = ?auto_700784 ?auto_700786 ) ) ( not ( = ?auto_700784 ?auto_700787 ) ) ( not ( = ?auto_700784 ?auto_700788 ) ) ( not ( = ?auto_700785 ?auto_700786 ) ) ( not ( = ?auto_700785 ?auto_700787 ) ) ( not ( = ?auto_700785 ?auto_700788 ) ) ( not ( = ?auto_700786 ?auto_700787 ) ) ( not ( = ?auto_700786 ?auto_700788 ) ) ( not ( = ?auto_700787 ?auto_700788 ) ) ( ON ?auto_700786 ?auto_700787 ) ( ON ?auto_700785 ?auto_700786 ) ( ON ?auto_700784 ?auto_700785 ) ( ON ?auto_700783 ?auto_700784 ) ( ON ?auto_700782 ?auto_700783 ) ( ON ?auto_700781 ?auto_700782 ) ( ON ?auto_700780 ?auto_700781 ) ( ON ?auto_700779 ?auto_700780 ) ( ON ?auto_700778 ?auto_700779 ) ( CLEAR ?auto_700776 ) ( ON ?auto_700777 ?auto_700778 ) ( CLEAR ?auto_700777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_700772 ?auto_700773 ?auto_700774 ?auto_700775 ?auto_700776 ?auto_700777 )
      ( MAKE-16PILE ?auto_700772 ?auto_700773 ?auto_700774 ?auto_700775 ?auto_700776 ?auto_700777 ?auto_700778 ?auto_700779 ?auto_700780 ?auto_700781 ?auto_700782 ?auto_700783 ?auto_700784 ?auto_700785 ?auto_700786 ?auto_700787 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700838 - BLOCK
      ?auto_700839 - BLOCK
      ?auto_700840 - BLOCK
      ?auto_700841 - BLOCK
      ?auto_700842 - BLOCK
      ?auto_700843 - BLOCK
      ?auto_700844 - BLOCK
      ?auto_700845 - BLOCK
      ?auto_700846 - BLOCK
      ?auto_700847 - BLOCK
      ?auto_700848 - BLOCK
      ?auto_700849 - BLOCK
      ?auto_700850 - BLOCK
      ?auto_700851 - BLOCK
      ?auto_700852 - BLOCK
      ?auto_700853 - BLOCK
    )
    :vars
    (
      ?auto_700854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700853 ?auto_700854 ) ( ON-TABLE ?auto_700838 ) ( ON ?auto_700839 ?auto_700838 ) ( ON ?auto_700840 ?auto_700839 ) ( ON ?auto_700841 ?auto_700840 ) ( not ( = ?auto_700838 ?auto_700839 ) ) ( not ( = ?auto_700838 ?auto_700840 ) ) ( not ( = ?auto_700838 ?auto_700841 ) ) ( not ( = ?auto_700838 ?auto_700842 ) ) ( not ( = ?auto_700838 ?auto_700843 ) ) ( not ( = ?auto_700838 ?auto_700844 ) ) ( not ( = ?auto_700838 ?auto_700845 ) ) ( not ( = ?auto_700838 ?auto_700846 ) ) ( not ( = ?auto_700838 ?auto_700847 ) ) ( not ( = ?auto_700838 ?auto_700848 ) ) ( not ( = ?auto_700838 ?auto_700849 ) ) ( not ( = ?auto_700838 ?auto_700850 ) ) ( not ( = ?auto_700838 ?auto_700851 ) ) ( not ( = ?auto_700838 ?auto_700852 ) ) ( not ( = ?auto_700838 ?auto_700853 ) ) ( not ( = ?auto_700838 ?auto_700854 ) ) ( not ( = ?auto_700839 ?auto_700840 ) ) ( not ( = ?auto_700839 ?auto_700841 ) ) ( not ( = ?auto_700839 ?auto_700842 ) ) ( not ( = ?auto_700839 ?auto_700843 ) ) ( not ( = ?auto_700839 ?auto_700844 ) ) ( not ( = ?auto_700839 ?auto_700845 ) ) ( not ( = ?auto_700839 ?auto_700846 ) ) ( not ( = ?auto_700839 ?auto_700847 ) ) ( not ( = ?auto_700839 ?auto_700848 ) ) ( not ( = ?auto_700839 ?auto_700849 ) ) ( not ( = ?auto_700839 ?auto_700850 ) ) ( not ( = ?auto_700839 ?auto_700851 ) ) ( not ( = ?auto_700839 ?auto_700852 ) ) ( not ( = ?auto_700839 ?auto_700853 ) ) ( not ( = ?auto_700839 ?auto_700854 ) ) ( not ( = ?auto_700840 ?auto_700841 ) ) ( not ( = ?auto_700840 ?auto_700842 ) ) ( not ( = ?auto_700840 ?auto_700843 ) ) ( not ( = ?auto_700840 ?auto_700844 ) ) ( not ( = ?auto_700840 ?auto_700845 ) ) ( not ( = ?auto_700840 ?auto_700846 ) ) ( not ( = ?auto_700840 ?auto_700847 ) ) ( not ( = ?auto_700840 ?auto_700848 ) ) ( not ( = ?auto_700840 ?auto_700849 ) ) ( not ( = ?auto_700840 ?auto_700850 ) ) ( not ( = ?auto_700840 ?auto_700851 ) ) ( not ( = ?auto_700840 ?auto_700852 ) ) ( not ( = ?auto_700840 ?auto_700853 ) ) ( not ( = ?auto_700840 ?auto_700854 ) ) ( not ( = ?auto_700841 ?auto_700842 ) ) ( not ( = ?auto_700841 ?auto_700843 ) ) ( not ( = ?auto_700841 ?auto_700844 ) ) ( not ( = ?auto_700841 ?auto_700845 ) ) ( not ( = ?auto_700841 ?auto_700846 ) ) ( not ( = ?auto_700841 ?auto_700847 ) ) ( not ( = ?auto_700841 ?auto_700848 ) ) ( not ( = ?auto_700841 ?auto_700849 ) ) ( not ( = ?auto_700841 ?auto_700850 ) ) ( not ( = ?auto_700841 ?auto_700851 ) ) ( not ( = ?auto_700841 ?auto_700852 ) ) ( not ( = ?auto_700841 ?auto_700853 ) ) ( not ( = ?auto_700841 ?auto_700854 ) ) ( not ( = ?auto_700842 ?auto_700843 ) ) ( not ( = ?auto_700842 ?auto_700844 ) ) ( not ( = ?auto_700842 ?auto_700845 ) ) ( not ( = ?auto_700842 ?auto_700846 ) ) ( not ( = ?auto_700842 ?auto_700847 ) ) ( not ( = ?auto_700842 ?auto_700848 ) ) ( not ( = ?auto_700842 ?auto_700849 ) ) ( not ( = ?auto_700842 ?auto_700850 ) ) ( not ( = ?auto_700842 ?auto_700851 ) ) ( not ( = ?auto_700842 ?auto_700852 ) ) ( not ( = ?auto_700842 ?auto_700853 ) ) ( not ( = ?auto_700842 ?auto_700854 ) ) ( not ( = ?auto_700843 ?auto_700844 ) ) ( not ( = ?auto_700843 ?auto_700845 ) ) ( not ( = ?auto_700843 ?auto_700846 ) ) ( not ( = ?auto_700843 ?auto_700847 ) ) ( not ( = ?auto_700843 ?auto_700848 ) ) ( not ( = ?auto_700843 ?auto_700849 ) ) ( not ( = ?auto_700843 ?auto_700850 ) ) ( not ( = ?auto_700843 ?auto_700851 ) ) ( not ( = ?auto_700843 ?auto_700852 ) ) ( not ( = ?auto_700843 ?auto_700853 ) ) ( not ( = ?auto_700843 ?auto_700854 ) ) ( not ( = ?auto_700844 ?auto_700845 ) ) ( not ( = ?auto_700844 ?auto_700846 ) ) ( not ( = ?auto_700844 ?auto_700847 ) ) ( not ( = ?auto_700844 ?auto_700848 ) ) ( not ( = ?auto_700844 ?auto_700849 ) ) ( not ( = ?auto_700844 ?auto_700850 ) ) ( not ( = ?auto_700844 ?auto_700851 ) ) ( not ( = ?auto_700844 ?auto_700852 ) ) ( not ( = ?auto_700844 ?auto_700853 ) ) ( not ( = ?auto_700844 ?auto_700854 ) ) ( not ( = ?auto_700845 ?auto_700846 ) ) ( not ( = ?auto_700845 ?auto_700847 ) ) ( not ( = ?auto_700845 ?auto_700848 ) ) ( not ( = ?auto_700845 ?auto_700849 ) ) ( not ( = ?auto_700845 ?auto_700850 ) ) ( not ( = ?auto_700845 ?auto_700851 ) ) ( not ( = ?auto_700845 ?auto_700852 ) ) ( not ( = ?auto_700845 ?auto_700853 ) ) ( not ( = ?auto_700845 ?auto_700854 ) ) ( not ( = ?auto_700846 ?auto_700847 ) ) ( not ( = ?auto_700846 ?auto_700848 ) ) ( not ( = ?auto_700846 ?auto_700849 ) ) ( not ( = ?auto_700846 ?auto_700850 ) ) ( not ( = ?auto_700846 ?auto_700851 ) ) ( not ( = ?auto_700846 ?auto_700852 ) ) ( not ( = ?auto_700846 ?auto_700853 ) ) ( not ( = ?auto_700846 ?auto_700854 ) ) ( not ( = ?auto_700847 ?auto_700848 ) ) ( not ( = ?auto_700847 ?auto_700849 ) ) ( not ( = ?auto_700847 ?auto_700850 ) ) ( not ( = ?auto_700847 ?auto_700851 ) ) ( not ( = ?auto_700847 ?auto_700852 ) ) ( not ( = ?auto_700847 ?auto_700853 ) ) ( not ( = ?auto_700847 ?auto_700854 ) ) ( not ( = ?auto_700848 ?auto_700849 ) ) ( not ( = ?auto_700848 ?auto_700850 ) ) ( not ( = ?auto_700848 ?auto_700851 ) ) ( not ( = ?auto_700848 ?auto_700852 ) ) ( not ( = ?auto_700848 ?auto_700853 ) ) ( not ( = ?auto_700848 ?auto_700854 ) ) ( not ( = ?auto_700849 ?auto_700850 ) ) ( not ( = ?auto_700849 ?auto_700851 ) ) ( not ( = ?auto_700849 ?auto_700852 ) ) ( not ( = ?auto_700849 ?auto_700853 ) ) ( not ( = ?auto_700849 ?auto_700854 ) ) ( not ( = ?auto_700850 ?auto_700851 ) ) ( not ( = ?auto_700850 ?auto_700852 ) ) ( not ( = ?auto_700850 ?auto_700853 ) ) ( not ( = ?auto_700850 ?auto_700854 ) ) ( not ( = ?auto_700851 ?auto_700852 ) ) ( not ( = ?auto_700851 ?auto_700853 ) ) ( not ( = ?auto_700851 ?auto_700854 ) ) ( not ( = ?auto_700852 ?auto_700853 ) ) ( not ( = ?auto_700852 ?auto_700854 ) ) ( not ( = ?auto_700853 ?auto_700854 ) ) ( ON ?auto_700852 ?auto_700853 ) ( ON ?auto_700851 ?auto_700852 ) ( ON ?auto_700850 ?auto_700851 ) ( ON ?auto_700849 ?auto_700850 ) ( ON ?auto_700848 ?auto_700849 ) ( ON ?auto_700847 ?auto_700848 ) ( ON ?auto_700846 ?auto_700847 ) ( ON ?auto_700845 ?auto_700846 ) ( ON ?auto_700844 ?auto_700845 ) ( ON ?auto_700843 ?auto_700844 ) ( CLEAR ?auto_700841 ) ( ON ?auto_700842 ?auto_700843 ) ( CLEAR ?auto_700842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_700838 ?auto_700839 ?auto_700840 ?auto_700841 ?auto_700842 )
      ( MAKE-16PILE ?auto_700838 ?auto_700839 ?auto_700840 ?auto_700841 ?auto_700842 ?auto_700843 ?auto_700844 ?auto_700845 ?auto_700846 ?auto_700847 ?auto_700848 ?auto_700849 ?auto_700850 ?auto_700851 ?auto_700852 ?auto_700853 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700904 - BLOCK
      ?auto_700905 - BLOCK
      ?auto_700906 - BLOCK
      ?auto_700907 - BLOCK
      ?auto_700908 - BLOCK
      ?auto_700909 - BLOCK
      ?auto_700910 - BLOCK
      ?auto_700911 - BLOCK
      ?auto_700912 - BLOCK
      ?auto_700913 - BLOCK
      ?auto_700914 - BLOCK
      ?auto_700915 - BLOCK
      ?auto_700916 - BLOCK
      ?auto_700917 - BLOCK
      ?auto_700918 - BLOCK
      ?auto_700919 - BLOCK
    )
    :vars
    (
      ?auto_700920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700919 ?auto_700920 ) ( ON-TABLE ?auto_700904 ) ( ON ?auto_700905 ?auto_700904 ) ( ON ?auto_700906 ?auto_700905 ) ( not ( = ?auto_700904 ?auto_700905 ) ) ( not ( = ?auto_700904 ?auto_700906 ) ) ( not ( = ?auto_700904 ?auto_700907 ) ) ( not ( = ?auto_700904 ?auto_700908 ) ) ( not ( = ?auto_700904 ?auto_700909 ) ) ( not ( = ?auto_700904 ?auto_700910 ) ) ( not ( = ?auto_700904 ?auto_700911 ) ) ( not ( = ?auto_700904 ?auto_700912 ) ) ( not ( = ?auto_700904 ?auto_700913 ) ) ( not ( = ?auto_700904 ?auto_700914 ) ) ( not ( = ?auto_700904 ?auto_700915 ) ) ( not ( = ?auto_700904 ?auto_700916 ) ) ( not ( = ?auto_700904 ?auto_700917 ) ) ( not ( = ?auto_700904 ?auto_700918 ) ) ( not ( = ?auto_700904 ?auto_700919 ) ) ( not ( = ?auto_700904 ?auto_700920 ) ) ( not ( = ?auto_700905 ?auto_700906 ) ) ( not ( = ?auto_700905 ?auto_700907 ) ) ( not ( = ?auto_700905 ?auto_700908 ) ) ( not ( = ?auto_700905 ?auto_700909 ) ) ( not ( = ?auto_700905 ?auto_700910 ) ) ( not ( = ?auto_700905 ?auto_700911 ) ) ( not ( = ?auto_700905 ?auto_700912 ) ) ( not ( = ?auto_700905 ?auto_700913 ) ) ( not ( = ?auto_700905 ?auto_700914 ) ) ( not ( = ?auto_700905 ?auto_700915 ) ) ( not ( = ?auto_700905 ?auto_700916 ) ) ( not ( = ?auto_700905 ?auto_700917 ) ) ( not ( = ?auto_700905 ?auto_700918 ) ) ( not ( = ?auto_700905 ?auto_700919 ) ) ( not ( = ?auto_700905 ?auto_700920 ) ) ( not ( = ?auto_700906 ?auto_700907 ) ) ( not ( = ?auto_700906 ?auto_700908 ) ) ( not ( = ?auto_700906 ?auto_700909 ) ) ( not ( = ?auto_700906 ?auto_700910 ) ) ( not ( = ?auto_700906 ?auto_700911 ) ) ( not ( = ?auto_700906 ?auto_700912 ) ) ( not ( = ?auto_700906 ?auto_700913 ) ) ( not ( = ?auto_700906 ?auto_700914 ) ) ( not ( = ?auto_700906 ?auto_700915 ) ) ( not ( = ?auto_700906 ?auto_700916 ) ) ( not ( = ?auto_700906 ?auto_700917 ) ) ( not ( = ?auto_700906 ?auto_700918 ) ) ( not ( = ?auto_700906 ?auto_700919 ) ) ( not ( = ?auto_700906 ?auto_700920 ) ) ( not ( = ?auto_700907 ?auto_700908 ) ) ( not ( = ?auto_700907 ?auto_700909 ) ) ( not ( = ?auto_700907 ?auto_700910 ) ) ( not ( = ?auto_700907 ?auto_700911 ) ) ( not ( = ?auto_700907 ?auto_700912 ) ) ( not ( = ?auto_700907 ?auto_700913 ) ) ( not ( = ?auto_700907 ?auto_700914 ) ) ( not ( = ?auto_700907 ?auto_700915 ) ) ( not ( = ?auto_700907 ?auto_700916 ) ) ( not ( = ?auto_700907 ?auto_700917 ) ) ( not ( = ?auto_700907 ?auto_700918 ) ) ( not ( = ?auto_700907 ?auto_700919 ) ) ( not ( = ?auto_700907 ?auto_700920 ) ) ( not ( = ?auto_700908 ?auto_700909 ) ) ( not ( = ?auto_700908 ?auto_700910 ) ) ( not ( = ?auto_700908 ?auto_700911 ) ) ( not ( = ?auto_700908 ?auto_700912 ) ) ( not ( = ?auto_700908 ?auto_700913 ) ) ( not ( = ?auto_700908 ?auto_700914 ) ) ( not ( = ?auto_700908 ?auto_700915 ) ) ( not ( = ?auto_700908 ?auto_700916 ) ) ( not ( = ?auto_700908 ?auto_700917 ) ) ( not ( = ?auto_700908 ?auto_700918 ) ) ( not ( = ?auto_700908 ?auto_700919 ) ) ( not ( = ?auto_700908 ?auto_700920 ) ) ( not ( = ?auto_700909 ?auto_700910 ) ) ( not ( = ?auto_700909 ?auto_700911 ) ) ( not ( = ?auto_700909 ?auto_700912 ) ) ( not ( = ?auto_700909 ?auto_700913 ) ) ( not ( = ?auto_700909 ?auto_700914 ) ) ( not ( = ?auto_700909 ?auto_700915 ) ) ( not ( = ?auto_700909 ?auto_700916 ) ) ( not ( = ?auto_700909 ?auto_700917 ) ) ( not ( = ?auto_700909 ?auto_700918 ) ) ( not ( = ?auto_700909 ?auto_700919 ) ) ( not ( = ?auto_700909 ?auto_700920 ) ) ( not ( = ?auto_700910 ?auto_700911 ) ) ( not ( = ?auto_700910 ?auto_700912 ) ) ( not ( = ?auto_700910 ?auto_700913 ) ) ( not ( = ?auto_700910 ?auto_700914 ) ) ( not ( = ?auto_700910 ?auto_700915 ) ) ( not ( = ?auto_700910 ?auto_700916 ) ) ( not ( = ?auto_700910 ?auto_700917 ) ) ( not ( = ?auto_700910 ?auto_700918 ) ) ( not ( = ?auto_700910 ?auto_700919 ) ) ( not ( = ?auto_700910 ?auto_700920 ) ) ( not ( = ?auto_700911 ?auto_700912 ) ) ( not ( = ?auto_700911 ?auto_700913 ) ) ( not ( = ?auto_700911 ?auto_700914 ) ) ( not ( = ?auto_700911 ?auto_700915 ) ) ( not ( = ?auto_700911 ?auto_700916 ) ) ( not ( = ?auto_700911 ?auto_700917 ) ) ( not ( = ?auto_700911 ?auto_700918 ) ) ( not ( = ?auto_700911 ?auto_700919 ) ) ( not ( = ?auto_700911 ?auto_700920 ) ) ( not ( = ?auto_700912 ?auto_700913 ) ) ( not ( = ?auto_700912 ?auto_700914 ) ) ( not ( = ?auto_700912 ?auto_700915 ) ) ( not ( = ?auto_700912 ?auto_700916 ) ) ( not ( = ?auto_700912 ?auto_700917 ) ) ( not ( = ?auto_700912 ?auto_700918 ) ) ( not ( = ?auto_700912 ?auto_700919 ) ) ( not ( = ?auto_700912 ?auto_700920 ) ) ( not ( = ?auto_700913 ?auto_700914 ) ) ( not ( = ?auto_700913 ?auto_700915 ) ) ( not ( = ?auto_700913 ?auto_700916 ) ) ( not ( = ?auto_700913 ?auto_700917 ) ) ( not ( = ?auto_700913 ?auto_700918 ) ) ( not ( = ?auto_700913 ?auto_700919 ) ) ( not ( = ?auto_700913 ?auto_700920 ) ) ( not ( = ?auto_700914 ?auto_700915 ) ) ( not ( = ?auto_700914 ?auto_700916 ) ) ( not ( = ?auto_700914 ?auto_700917 ) ) ( not ( = ?auto_700914 ?auto_700918 ) ) ( not ( = ?auto_700914 ?auto_700919 ) ) ( not ( = ?auto_700914 ?auto_700920 ) ) ( not ( = ?auto_700915 ?auto_700916 ) ) ( not ( = ?auto_700915 ?auto_700917 ) ) ( not ( = ?auto_700915 ?auto_700918 ) ) ( not ( = ?auto_700915 ?auto_700919 ) ) ( not ( = ?auto_700915 ?auto_700920 ) ) ( not ( = ?auto_700916 ?auto_700917 ) ) ( not ( = ?auto_700916 ?auto_700918 ) ) ( not ( = ?auto_700916 ?auto_700919 ) ) ( not ( = ?auto_700916 ?auto_700920 ) ) ( not ( = ?auto_700917 ?auto_700918 ) ) ( not ( = ?auto_700917 ?auto_700919 ) ) ( not ( = ?auto_700917 ?auto_700920 ) ) ( not ( = ?auto_700918 ?auto_700919 ) ) ( not ( = ?auto_700918 ?auto_700920 ) ) ( not ( = ?auto_700919 ?auto_700920 ) ) ( ON ?auto_700918 ?auto_700919 ) ( ON ?auto_700917 ?auto_700918 ) ( ON ?auto_700916 ?auto_700917 ) ( ON ?auto_700915 ?auto_700916 ) ( ON ?auto_700914 ?auto_700915 ) ( ON ?auto_700913 ?auto_700914 ) ( ON ?auto_700912 ?auto_700913 ) ( ON ?auto_700911 ?auto_700912 ) ( ON ?auto_700910 ?auto_700911 ) ( ON ?auto_700909 ?auto_700910 ) ( ON ?auto_700908 ?auto_700909 ) ( CLEAR ?auto_700906 ) ( ON ?auto_700907 ?auto_700908 ) ( CLEAR ?auto_700907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_700904 ?auto_700905 ?auto_700906 ?auto_700907 )
      ( MAKE-16PILE ?auto_700904 ?auto_700905 ?auto_700906 ?auto_700907 ?auto_700908 ?auto_700909 ?auto_700910 ?auto_700911 ?auto_700912 ?auto_700913 ?auto_700914 ?auto_700915 ?auto_700916 ?auto_700917 ?auto_700918 ?auto_700919 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_700970 - BLOCK
      ?auto_700971 - BLOCK
      ?auto_700972 - BLOCK
      ?auto_700973 - BLOCK
      ?auto_700974 - BLOCK
      ?auto_700975 - BLOCK
      ?auto_700976 - BLOCK
      ?auto_700977 - BLOCK
      ?auto_700978 - BLOCK
      ?auto_700979 - BLOCK
      ?auto_700980 - BLOCK
      ?auto_700981 - BLOCK
      ?auto_700982 - BLOCK
      ?auto_700983 - BLOCK
      ?auto_700984 - BLOCK
      ?auto_700985 - BLOCK
    )
    :vars
    (
      ?auto_700986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_700985 ?auto_700986 ) ( ON-TABLE ?auto_700970 ) ( ON ?auto_700971 ?auto_700970 ) ( not ( = ?auto_700970 ?auto_700971 ) ) ( not ( = ?auto_700970 ?auto_700972 ) ) ( not ( = ?auto_700970 ?auto_700973 ) ) ( not ( = ?auto_700970 ?auto_700974 ) ) ( not ( = ?auto_700970 ?auto_700975 ) ) ( not ( = ?auto_700970 ?auto_700976 ) ) ( not ( = ?auto_700970 ?auto_700977 ) ) ( not ( = ?auto_700970 ?auto_700978 ) ) ( not ( = ?auto_700970 ?auto_700979 ) ) ( not ( = ?auto_700970 ?auto_700980 ) ) ( not ( = ?auto_700970 ?auto_700981 ) ) ( not ( = ?auto_700970 ?auto_700982 ) ) ( not ( = ?auto_700970 ?auto_700983 ) ) ( not ( = ?auto_700970 ?auto_700984 ) ) ( not ( = ?auto_700970 ?auto_700985 ) ) ( not ( = ?auto_700970 ?auto_700986 ) ) ( not ( = ?auto_700971 ?auto_700972 ) ) ( not ( = ?auto_700971 ?auto_700973 ) ) ( not ( = ?auto_700971 ?auto_700974 ) ) ( not ( = ?auto_700971 ?auto_700975 ) ) ( not ( = ?auto_700971 ?auto_700976 ) ) ( not ( = ?auto_700971 ?auto_700977 ) ) ( not ( = ?auto_700971 ?auto_700978 ) ) ( not ( = ?auto_700971 ?auto_700979 ) ) ( not ( = ?auto_700971 ?auto_700980 ) ) ( not ( = ?auto_700971 ?auto_700981 ) ) ( not ( = ?auto_700971 ?auto_700982 ) ) ( not ( = ?auto_700971 ?auto_700983 ) ) ( not ( = ?auto_700971 ?auto_700984 ) ) ( not ( = ?auto_700971 ?auto_700985 ) ) ( not ( = ?auto_700971 ?auto_700986 ) ) ( not ( = ?auto_700972 ?auto_700973 ) ) ( not ( = ?auto_700972 ?auto_700974 ) ) ( not ( = ?auto_700972 ?auto_700975 ) ) ( not ( = ?auto_700972 ?auto_700976 ) ) ( not ( = ?auto_700972 ?auto_700977 ) ) ( not ( = ?auto_700972 ?auto_700978 ) ) ( not ( = ?auto_700972 ?auto_700979 ) ) ( not ( = ?auto_700972 ?auto_700980 ) ) ( not ( = ?auto_700972 ?auto_700981 ) ) ( not ( = ?auto_700972 ?auto_700982 ) ) ( not ( = ?auto_700972 ?auto_700983 ) ) ( not ( = ?auto_700972 ?auto_700984 ) ) ( not ( = ?auto_700972 ?auto_700985 ) ) ( not ( = ?auto_700972 ?auto_700986 ) ) ( not ( = ?auto_700973 ?auto_700974 ) ) ( not ( = ?auto_700973 ?auto_700975 ) ) ( not ( = ?auto_700973 ?auto_700976 ) ) ( not ( = ?auto_700973 ?auto_700977 ) ) ( not ( = ?auto_700973 ?auto_700978 ) ) ( not ( = ?auto_700973 ?auto_700979 ) ) ( not ( = ?auto_700973 ?auto_700980 ) ) ( not ( = ?auto_700973 ?auto_700981 ) ) ( not ( = ?auto_700973 ?auto_700982 ) ) ( not ( = ?auto_700973 ?auto_700983 ) ) ( not ( = ?auto_700973 ?auto_700984 ) ) ( not ( = ?auto_700973 ?auto_700985 ) ) ( not ( = ?auto_700973 ?auto_700986 ) ) ( not ( = ?auto_700974 ?auto_700975 ) ) ( not ( = ?auto_700974 ?auto_700976 ) ) ( not ( = ?auto_700974 ?auto_700977 ) ) ( not ( = ?auto_700974 ?auto_700978 ) ) ( not ( = ?auto_700974 ?auto_700979 ) ) ( not ( = ?auto_700974 ?auto_700980 ) ) ( not ( = ?auto_700974 ?auto_700981 ) ) ( not ( = ?auto_700974 ?auto_700982 ) ) ( not ( = ?auto_700974 ?auto_700983 ) ) ( not ( = ?auto_700974 ?auto_700984 ) ) ( not ( = ?auto_700974 ?auto_700985 ) ) ( not ( = ?auto_700974 ?auto_700986 ) ) ( not ( = ?auto_700975 ?auto_700976 ) ) ( not ( = ?auto_700975 ?auto_700977 ) ) ( not ( = ?auto_700975 ?auto_700978 ) ) ( not ( = ?auto_700975 ?auto_700979 ) ) ( not ( = ?auto_700975 ?auto_700980 ) ) ( not ( = ?auto_700975 ?auto_700981 ) ) ( not ( = ?auto_700975 ?auto_700982 ) ) ( not ( = ?auto_700975 ?auto_700983 ) ) ( not ( = ?auto_700975 ?auto_700984 ) ) ( not ( = ?auto_700975 ?auto_700985 ) ) ( not ( = ?auto_700975 ?auto_700986 ) ) ( not ( = ?auto_700976 ?auto_700977 ) ) ( not ( = ?auto_700976 ?auto_700978 ) ) ( not ( = ?auto_700976 ?auto_700979 ) ) ( not ( = ?auto_700976 ?auto_700980 ) ) ( not ( = ?auto_700976 ?auto_700981 ) ) ( not ( = ?auto_700976 ?auto_700982 ) ) ( not ( = ?auto_700976 ?auto_700983 ) ) ( not ( = ?auto_700976 ?auto_700984 ) ) ( not ( = ?auto_700976 ?auto_700985 ) ) ( not ( = ?auto_700976 ?auto_700986 ) ) ( not ( = ?auto_700977 ?auto_700978 ) ) ( not ( = ?auto_700977 ?auto_700979 ) ) ( not ( = ?auto_700977 ?auto_700980 ) ) ( not ( = ?auto_700977 ?auto_700981 ) ) ( not ( = ?auto_700977 ?auto_700982 ) ) ( not ( = ?auto_700977 ?auto_700983 ) ) ( not ( = ?auto_700977 ?auto_700984 ) ) ( not ( = ?auto_700977 ?auto_700985 ) ) ( not ( = ?auto_700977 ?auto_700986 ) ) ( not ( = ?auto_700978 ?auto_700979 ) ) ( not ( = ?auto_700978 ?auto_700980 ) ) ( not ( = ?auto_700978 ?auto_700981 ) ) ( not ( = ?auto_700978 ?auto_700982 ) ) ( not ( = ?auto_700978 ?auto_700983 ) ) ( not ( = ?auto_700978 ?auto_700984 ) ) ( not ( = ?auto_700978 ?auto_700985 ) ) ( not ( = ?auto_700978 ?auto_700986 ) ) ( not ( = ?auto_700979 ?auto_700980 ) ) ( not ( = ?auto_700979 ?auto_700981 ) ) ( not ( = ?auto_700979 ?auto_700982 ) ) ( not ( = ?auto_700979 ?auto_700983 ) ) ( not ( = ?auto_700979 ?auto_700984 ) ) ( not ( = ?auto_700979 ?auto_700985 ) ) ( not ( = ?auto_700979 ?auto_700986 ) ) ( not ( = ?auto_700980 ?auto_700981 ) ) ( not ( = ?auto_700980 ?auto_700982 ) ) ( not ( = ?auto_700980 ?auto_700983 ) ) ( not ( = ?auto_700980 ?auto_700984 ) ) ( not ( = ?auto_700980 ?auto_700985 ) ) ( not ( = ?auto_700980 ?auto_700986 ) ) ( not ( = ?auto_700981 ?auto_700982 ) ) ( not ( = ?auto_700981 ?auto_700983 ) ) ( not ( = ?auto_700981 ?auto_700984 ) ) ( not ( = ?auto_700981 ?auto_700985 ) ) ( not ( = ?auto_700981 ?auto_700986 ) ) ( not ( = ?auto_700982 ?auto_700983 ) ) ( not ( = ?auto_700982 ?auto_700984 ) ) ( not ( = ?auto_700982 ?auto_700985 ) ) ( not ( = ?auto_700982 ?auto_700986 ) ) ( not ( = ?auto_700983 ?auto_700984 ) ) ( not ( = ?auto_700983 ?auto_700985 ) ) ( not ( = ?auto_700983 ?auto_700986 ) ) ( not ( = ?auto_700984 ?auto_700985 ) ) ( not ( = ?auto_700984 ?auto_700986 ) ) ( not ( = ?auto_700985 ?auto_700986 ) ) ( ON ?auto_700984 ?auto_700985 ) ( ON ?auto_700983 ?auto_700984 ) ( ON ?auto_700982 ?auto_700983 ) ( ON ?auto_700981 ?auto_700982 ) ( ON ?auto_700980 ?auto_700981 ) ( ON ?auto_700979 ?auto_700980 ) ( ON ?auto_700978 ?auto_700979 ) ( ON ?auto_700977 ?auto_700978 ) ( ON ?auto_700976 ?auto_700977 ) ( ON ?auto_700975 ?auto_700976 ) ( ON ?auto_700974 ?auto_700975 ) ( ON ?auto_700973 ?auto_700974 ) ( CLEAR ?auto_700971 ) ( ON ?auto_700972 ?auto_700973 ) ( CLEAR ?auto_700972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_700970 ?auto_700971 ?auto_700972 )
      ( MAKE-16PILE ?auto_700970 ?auto_700971 ?auto_700972 ?auto_700973 ?auto_700974 ?auto_700975 ?auto_700976 ?auto_700977 ?auto_700978 ?auto_700979 ?auto_700980 ?auto_700981 ?auto_700982 ?auto_700983 ?auto_700984 ?auto_700985 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_701036 - BLOCK
      ?auto_701037 - BLOCK
      ?auto_701038 - BLOCK
      ?auto_701039 - BLOCK
      ?auto_701040 - BLOCK
      ?auto_701041 - BLOCK
      ?auto_701042 - BLOCK
      ?auto_701043 - BLOCK
      ?auto_701044 - BLOCK
      ?auto_701045 - BLOCK
      ?auto_701046 - BLOCK
      ?auto_701047 - BLOCK
      ?auto_701048 - BLOCK
      ?auto_701049 - BLOCK
      ?auto_701050 - BLOCK
      ?auto_701051 - BLOCK
    )
    :vars
    (
      ?auto_701052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701051 ?auto_701052 ) ( ON-TABLE ?auto_701036 ) ( not ( = ?auto_701036 ?auto_701037 ) ) ( not ( = ?auto_701036 ?auto_701038 ) ) ( not ( = ?auto_701036 ?auto_701039 ) ) ( not ( = ?auto_701036 ?auto_701040 ) ) ( not ( = ?auto_701036 ?auto_701041 ) ) ( not ( = ?auto_701036 ?auto_701042 ) ) ( not ( = ?auto_701036 ?auto_701043 ) ) ( not ( = ?auto_701036 ?auto_701044 ) ) ( not ( = ?auto_701036 ?auto_701045 ) ) ( not ( = ?auto_701036 ?auto_701046 ) ) ( not ( = ?auto_701036 ?auto_701047 ) ) ( not ( = ?auto_701036 ?auto_701048 ) ) ( not ( = ?auto_701036 ?auto_701049 ) ) ( not ( = ?auto_701036 ?auto_701050 ) ) ( not ( = ?auto_701036 ?auto_701051 ) ) ( not ( = ?auto_701036 ?auto_701052 ) ) ( not ( = ?auto_701037 ?auto_701038 ) ) ( not ( = ?auto_701037 ?auto_701039 ) ) ( not ( = ?auto_701037 ?auto_701040 ) ) ( not ( = ?auto_701037 ?auto_701041 ) ) ( not ( = ?auto_701037 ?auto_701042 ) ) ( not ( = ?auto_701037 ?auto_701043 ) ) ( not ( = ?auto_701037 ?auto_701044 ) ) ( not ( = ?auto_701037 ?auto_701045 ) ) ( not ( = ?auto_701037 ?auto_701046 ) ) ( not ( = ?auto_701037 ?auto_701047 ) ) ( not ( = ?auto_701037 ?auto_701048 ) ) ( not ( = ?auto_701037 ?auto_701049 ) ) ( not ( = ?auto_701037 ?auto_701050 ) ) ( not ( = ?auto_701037 ?auto_701051 ) ) ( not ( = ?auto_701037 ?auto_701052 ) ) ( not ( = ?auto_701038 ?auto_701039 ) ) ( not ( = ?auto_701038 ?auto_701040 ) ) ( not ( = ?auto_701038 ?auto_701041 ) ) ( not ( = ?auto_701038 ?auto_701042 ) ) ( not ( = ?auto_701038 ?auto_701043 ) ) ( not ( = ?auto_701038 ?auto_701044 ) ) ( not ( = ?auto_701038 ?auto_701045 ) ) ( not ( = ?auto_701038 ?auto_701046 ) ) ( not ( = ?auto_701038 ?auto_701047 ) ) ( not ( = ?auto_701038 ?auto_701048 ) ) ( not ( = ?auto_701038 ?auto_701049 ) ) ( not ( = ?auto_701038 ?auto_701050 ) ) ( not ( = ?auto_701038 ?auto_701051 ) ) ( not ( = ?auto_701038 ?auto_701052 ) ) ( not ( = ?auto_701039 ?auto_701040 ) ) ( not ( = ?auto_701039 ?auto_701041 ) ) ( not ( = ?auto_701039 ?auto_701042 ) ) ( not ( = ?auto_701039 ?auto_701043 ) ) ( not ( = ?auto_701039 ?auto_701044 ) ) ( not ( = ?auto_701039 ?auto_701045 ) ) ( not ( = ?auto_701039 ?auto_701046 ) ) ( not ( = ?auto_701039 ?auto_701047 ) ) ( not ( = ?auto_701039 ?auto_701048 ) ) ( not ( = ?auto_701039 ?auto_701049 ) ) ( not ( = ?auto_701039 ?auto_701050 ) ) ( not ( = ?auto_701039 ?auto_701051 ) ) ( not ( = ?auto_701039 ?auto_701052 ) ) ( not ( = ?auto_701040 ?auto_701041 ) ) ( not ( = ?auto_701040 ?auto_701042 ) ) ( not ( = ?auto_701040 ?auto_701043 ) ) ( not ( = ?auto_701040 ?auto_701044 ) ) ( not ( = ?auto_701040 ?auto_701045 ) ) ( not ( = ?auto_701040 ?auto_701046 ) ) ( not ( = ?auto_701040 ?auto_701047 ) ) ( not ( = ?auto_701040 ?auto_701048 ) ) ( not ( = ?auto_701040 ?auto_701049 ) ) ( not ( = ?auto_701040 ?auto_701050 ) ) ( not ( = ?auto_701040 ?auto_701051 ) ) ( not ( = ?auto_701040 ?auto_701052 ) ) ( not ( = ?auto_701041 ?auto_701042 ) ) ( not ( = ?auto_701041 ?auto_701043 ) ) ( not ( = ?auto_701041 ?auto_701044 ) ) ( not ( = ?auto_701041 ?auto_701045 ) ) ( not ( = ?auto_701041 ?auto_701046 ) ) ( not ( = ?auto_701041 ?auto_701047 ) ) ( not ( = ?auto_701041 ?auto_701048 ) ) ( not ( = ?auto_701041 ?auto_701049 ) ) ( not ( = ?auto_701041 ?auto_701050 ) ) ( not ( = ?auto_701041 ?auto_701051 ) ) ( not ( = ?auto_701041 ?auto_701052 ) ) ( not ( = ?auto_701042 ?auto_701043 ) ) ( not ( = ?auto_701042 ?auto_701044 ) ) ( not ( = ?auto_701042 ?auto_701045 ) ) ( not ( = ?auto_701042 ?auto_701046 ) ) ( not ( = ?auto_701042 ?auto_701047 ) ) ( not ( = ?auto_701042 ?auto_701048 ) ) ( not ( = ?auto_701042 ?auto_701049 ) ) ( not ( = ?auto_701042 ?auto_701050 ) ) ( not ( = ?auto_701042 ?auto_701051 ) ) ( not ( = ?auto_701042 ?auto_701052 ) ) ( not ( = ?auto_701043 ?auto_701044 ) ) ( not ( = ?auto_701043 ?auto_701045 ) ) ( not ( = ?auto_701043 ?auto_701046 ) ) ( not ( = ?auto_701043 ?auto_701047 ) ) ( not ( = ?auto_701043 ?auto_701048 ) ) ( not ( = ?auto_701043 ?auto_701049 ) ) ( not ( = ?auto_701043 ?auto_701050 ) ) ( not ( = ?auto_701043 ?auto_701051 ) ) ( not ( = ?auto_701043 ?auto_701052 ) ) ( not ( = ?auto_701044 ?auto_701045 ) ) ( not ( = ?auto_701044 ?auto_701046 ) ) ( not ( = ?auto_701044 ?auto_701047 ) ) ( not ( = ?auto_701044 ?auto_701048 ) ) ( not ( = ?auto_701044 ?auto_701049 ) ) ( not ( = ?auto_701044 ?auto_701050 ) ) ( not ( = ?auto_701044 ?auto_701051 ) ) ( not ( = ?auto_701044 ?auto_701052 ) ) ( not ( = ?auto_701045 ?auto_701046 ) ) ( not ( = ?auto_701045 ?auto_701047 ) ) ( not ( = ?auto_701045 ?auto_701048 ) ) ( not ( = ?auto_701045 ?auto_701049 ) ) ( not ( = ?auto_701045 ?auto_701050 ) ) ( not ( = ?auto_701045 ?auto_701051 ) ) ( not ( = ?auto_701045 ?auto_701052 ) ) ( not ( = ?auto_701046 ?auto_701047 ) ) ( not ( = ?auto_701046 ?auto_701048 ) ) ( not ( = ?auto_701046 ?auto_701049 ) ) ( not ( = ?auto_701046 ?auto_701050 ) ) ( not ( = ?auto_701046 ?auto_701051 ) ) ( not ( = ?auto_701046 ?auto_701052 ) ) ( not ( = ?auto_701047 ?auto_701048 ) ) ( not ( = ?auto_701047 ?auto_701049 ) ) ( not ( = ?auto_701047 ?auto_701050 ) ) ( not ( = ?auto_701047 ?auto_701051 ) ) ( not ( = ?auto_701047 ?auto_701052 ) ) ( not ( = ?auto_701048 ?auto_701049 ) ) ( not ( = ?auto_701048 ?auto_701050 ) ) ( not ( = ?auto_701048 ?auto_701051 ) ) ( not ( = ?auto_701048 ?auto_701052 ) ) ( not ( = ?auto_701049 ?auto_701050 ) ) ( not ( = ?auto_701049 ?auto_701051 ) ) ( not ( = ?auto_701049 ?auto_701052 ) ) ( not ( = ?auto_701050 ?auto_701051 ) ) ( not ( = ?auto_701050 ?auto_701052 ) ) ( not ( = ?auto_701051 ?auto_701052 ) ) ( ON ?auto_701050 ?auto_701051 ) ( ON ?auto_701049 ?auto_701050 ) ( ON ?auto_701048 ?auto_701049 ) ( ON ?auto_701047 ?auto_701048 ) ( ON ?auto_701046 ?auto_701047 ) ( ON ?auto_701045 ?auto_701046 ) ( ON ?auto_701044 ?auto_701045 ) ( ON ?auto_701043 ?auto_701044 ) ( ON ?auto_701042 ?auto_701043 ) ( ON ?auto_701041 ?auto_701042 ) ( ON ?auto_701040 ?auto_701041 ) ( ON ?auto_701039 ?auto_701040 ) ( ON ?auto_701038 ?auto_701039 ) ( CLEAR ?auto_701036 ) ( ON ?auto_701037 ?auto_701038 ) ( CLEAR ?auto_701037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_701036 ?auto_701037 )
      ( MAKE-16PILE ?auto_701036 ?auto_701037 ?auto_701038 ?auto_701039 ?auto_701040 ?auto_701041 ?auto_701042 ?auto_701043 ?auto_701044 ?auto_701045 ?auto_701046 ?auto_701047 ?auto_701048 ?auto_701049 ?auto_701050 ?auto_701051 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_701102 - BLOCK
      ?auto_701103 - BLOCK
      ?auto_701104 - BLOCK
      ?auto_701105 - BLOCK
      ?auto_701106 - BLOCK
      ?auto_701107 - BLOCK
      ?auto_701108 - BLOCK
      ?auto_701109 - BLOCK
      ?auto_701110 - BLOCK
      ?auto_701111 - BLOCK
      ?auto_701112 - BLOCK
      ?auto_701113 - BLOCK
      ?auto_701114 - BLOCK
      ?auto_701115 - BLOCK
      ?auto_701116 - BLOCK
      ?auto_701117 - BLOCK
    )
    :vars
    (
      ?auto_701118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701117 ?auto_701118 ) ( not ( = ?auto_701102 ?auto_701103 ) ) ( not ( = ?auto_701102 ?auto_701104 ) ) ( not ( = ?auto_701102 ?auto_701105 ) ) ( not ( = ?auto_701102 ?auto_701106 ) ) ( not ( = ?auto_701102 ?auto_701107 ) ) ( not ( = ?auto_701102 ?auto_701108 ) ) ( not ( = ?auto_701102 ?auto_701109 ) ) ( not ( = ?auto_701102 ?auto_701110 ) ) ( not ( = ?auto_701102 ?auto_701111 ) ) ( not ( = ?auto_701102 ?auto_701112 ) ) ( not ( = ?auto_701102 ?auto_701113 ) ) ( not ( = ?auto_701102 ?auto_701114 ) ) ( not ( = ?auto_701102 ?auto_701115 ) ) ( not ( = ?auto_701102 ?auto_701116 ) ) ( not ( = ?auto_701102 ?auto_701117 ) ) ( not ( = ?auto_701102 ?auto_701118 ) ) ( not ( = ?auto_701103 ?auto_701104 ) ) ( not ( = ?auto_701103 ?auto_701105 ) ) ( not ( = ?auto_701103 ?auto_701106 ) ) ( not ( = ?auto_701103 ?auto_701107 ) ) ( not ( = ?auto_701103 ?auto_701108 ) ) ( not ( = ?auto_701103 ?auto_701109 ) ) ( not ( = ?auto_701103 ?auto_701110 ) ) ( not ( = ?auto_701103 ?auto_701111 ) ) ( not ( = ?auto_701103 ?auto_701112 ) ) ( not ( = ?auto_701103 ?auto_701113 ) ) ( not ( = ?auto_701103 ?auto_701114 ) ) ( not ( = ?auto_701103 ?auto_701115 ) ) ( not ( = ?auto_701103 ?auto_701116 ) ) ( not ( = ?auto_701103 ?auto_701117 ) ) ( not ( = ?auto_701103 ?auto_701118 ) ) ( not ( = ?auto_701104 ?auto_701105 ) ) ( not ( = ?auto_701104 ?auto_701106 ) ) ( not ( = ?auto_701104 ?auto_701107 ) ) ( not ( = ?auto_701104 ?auto_701108 ) ) ( not ( = ?auto_701104 ?auto_701109 ) ) ( not ( = ?auto_701104 ?auto_701110 ) ) ( not ( = ?auto_701104 ?auto_701111 ) ) ( not ( = ?auto_701104 ?auto_701112 ) ) ( not ( = ?auto_701104 ?auto_701113 ) ) ( not ( = ?auto_701104 ?auto_701114 ) ) ( not ( = ?auto_701104 ?auto_701115 ) ) ( not ( = ?auto_701104 ?auto_701116 ) ) ( not ( = ?auto_701104 ?auto_701117 ) ) ( not ( = ?auto_701104 ?auto_701118 ) ) ( not ( = ?auto_701105 ?auto_701106 ) ) ( not ( = ?auto_701105 ?auto_701107 ) ) ( not ( = ?auto_701105 ?auto_701108 ) ) ( not ( = ?auto_701105 ?auto_701109 ) ) ( not ( = ?auto_701105 ?auto_701110 ) ) ( not ( = ?auto_701105 ?auto_701111 ) ) ( not ( = ?auto_701105 ?auto_701112 ) ) ( not ( = ?auto_701105 ?auto_701113 ) ) ( not ( = ?auto_701105 ?auto_701114 ) ) ( not ( = ?auto_701105 ?auto_701115 ) ) ( not ( = ?auto_701105 ?auto_701116 ) ) ( not ( = ?auto_701105 ?auto_701117 ) ) ( not ( = ?auto_701105 ?auto_701118 ) ) ( not ( = ?auto_701106 ?auto_701107 ) ) ( not ( = ?auto_701106 ?auto_701108 ) ) ( not ( = ?auto_701106 ?auto_701109 ) ) ( not ( = ?auto_701106 ?auto_701110 ) ) ( not ( = ?auto_701106 ?auto_701111 ) ) ( not ( = ?auto_701106 ?auto_701112 ) ) ( not ( = ?auto_701106 ?auto_701113 ) ) ( not ( = ?auto_701106 ?auto_701114 ) ) ( not ( = ?auto_701106 ?auto_701115 ) ) ( not ( = ?auto_701106 ?auto_701116 ) ) ( not ( = ?auto_701106 ?auto_701117 ) ) ( not ( = ?auto_701106 ?auto_701118 ) ) ( not ( = ?auto_701107 ?auto_701108 ) ) ( not ( = ?auto_701107 ?auto_701109 ) ) ( not ( = ?auto_701107 ?auto_701110 ) ) ( not ( = ?auto_701107 ?auto_701111 ) ) ( not ( = ?auto_701107 ?auto_701112 ) ) ( not ( = ?auto_701107 ?auto_701113 ) ) ( not ( = ?auto_701107 ?auto_701114 ) ) ( not ( = ?auto_701107 ?auto_701115 ) ) ( not ( = ?auto_701107 ?auto_701116 ) ) ( not ( = ?auto_701107 ?auto_701117 ) ) ( not ( = ?auto_701107 ?auto_701118 ) ) ( not ( = ?auto_701108 ?auto_701109 ) ) ( not ( = ?auto_701108 ?auto_701110 ) ) ( not ( = ?auto_701108 ?auto_701111 ) ) ( not ( = ?auto_701108 ?auto_701112 ) ) ( not ( = ?auto_701108 ?auto_701113 ) ) ( not ( = ?auto_701108 ?auto_701114 ) ) ( not ( = ?auto_701108 ?auto_701115 ) ) ( not ( = ?auto_701108 ?auto_701116 ) ) ( not ( = ?auto_701108 ?auto_701117 ) ) ( not ( = ?auto_701108 ?auto_701118 ) ) ( not ( = ?auto_701109 ?auto_701110 ) ) ( not ( = ?auto_701109 ?auto_701111 ) ) ( not ( = ?auto_701109 ?auto_701112 ) ) ( not ( = ?auto_701109 ?auto_701113 ) ) ( not ( = ?auto_701109 ?auto_701114 ) ) ( not ( = ?auto_701109 ?auto_701115 ) ) ( not ( = ?auto_701109 ?auto_701116 ) ) ( not ( = ?auto_701109 ?auto_701117 ) ) ( not ( = ?auto_701109 ?auto_701118 ) ) ( not ( = ?auto_701110 ?auto_701111 ) ) ( not ( = ?auto_701110 ?auto_701112 ) ) ( not ( = ?auto_701110 ?auto_701113 ) ) ( not ( = ?auto_701110 ?auto_701114 ) ) ( not ( = ?auto_701110 ?auto_701115 ) ) ( not ( = ?auto_701110 ?auto_701116 ) ) ( not ( = ?auto_701110 ?auto_701117 ) ) ( not ( = ?auto_701110 ?auto_701118 ) ) ( not ( = ?auto_701111 ?auto_701112 ) ) ( not ( = ?auto_701111 ?auto_701113 ) ) ( not ( = ?auto_701111 ?auto_701114 ) ) ( not ( = ?auto_701111 ?auto_701115 ) ) ( not ( = ?auto_701111 ?auto_701116 ) ) ( not ( = ?auto_701111 ?auto_701117 ) ) ( not ( = ?auto_701111 ?auto_701118 ) ) ( not ( = ?auto_701112 ?auto_701113 ) ) ( not ( = ?auto_701112 ?auto_701114 ) ) ( not ( = ?auto_701112 ?auto_701115 ) ) ( not ( = ?auto_701112 ?auto_701116 ) ) ( not ( = ?auto_701112 ?auto_701117 ) ) ( not ( = ?auto_701112 ?auto_701118 ) ) ( not ( = ?auto_701113 ?auto_701114 ) ) ( not ( = ?auto_701113 ?auto_701115 ) ) ( not ( = ?auto_701113 ?auto_701116 ) ) ( not ( = ?auto_701113 ?auto_701117 ) ) ( not ( = ?auto_701113 ?auto_701118 ) ) ( not ( = ?auto_701114 ?auto_701115 ) ) ( not ( = ?auto_701114 ?auto_701116 ) ) ( not ( = ?auto_701114 ?auto_701117 ) ) ( not ( = ?auto_701114 ?auto_701118 ) ) ( not ( = ?auto_701115 ?auto_701116 ) ) ( not ( = ?auto_701115 ?auto_701117 ) ) ( not ( = ?auto_701115 ?auto_701118 ) ) ( not ( = ?auto_701116 ?auto_701117 ) ) ( not ( = ?auto_701116 ?auto_701118 ) ) ( not ( = ?auto_701117 ?auto_701118 ) ) ( ON ?auto_701116 ?auto_701117 ) ( ON ?auto_701115 ?auto_701116 ) ( ON ?auto_701114 ?auto_701115 ) ( ON ?auto_701113 ?auto_701114 ) ( ON ?auto_701112 ?auto_701113 ) ( ON ?auto_701111 ?auto_701112 ) ( ON ?auto_701110 ?auto_701111 ) ( ON ?auto_701109 ?auto_701110 ) ( ON ?auto_701108 ?auto_701109 ) ( ON ?auto_701107 ?auto_701108 ) ( ON ?auto_701106 ?auto_701107 ) ( ON ?auto_701105 ?auto_701106 ) ( ON ?auto_701104 ?auto_701105 ) ( ON ?auto_701103 ?auto_701104 ) ( ON ?auto_701102 ?auto_701103 ) ( CLEAR ?auto_701102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_701102 )
      ( MAKE-16PILE ?auto_701102 ?auto_701103 ?auto_701104 ?auto_701105 ?auto_701106 ?auto_701107 ?auto_701108 ?auto_701109 ?auto_701110 ?auto_701111 ?auto_701112 ?auto_701113 ?auto_701114 ?auto_701115 ?auto_701116 ?auto_701117 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701169 - BLOCK
      ?auto_701170 - BLOCK
      ?auto_701171 - BLOCK
      ?auto_701172 - BLOCK
      ?auto_701173 - BLOCK
      ?auto_701174 - BLOCK
      ?auto_701175 - BLOCK
      ?auto_701176 - BLOCK
      ?auto_701177 - BLOCK
      ?auto_701178 - BLOCK
      ?auto_701179 - BLOCK
      ?auto_701180 - BLOCK
      ?auto_701181 - BLOCK
      ?auto_701182 - BLOCK
      ?auto_701183 - BLOCK
      ?auto_701184 - BLOCK
      ?auto_701185 - BLOCK
    )
    :vars
    (
      ?auto_701186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_701184 ) ( ON ?auto_701185 ?auto_701186 ) ( CLEAR ?auto_701185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_701169 ) ( ON ?auto_701170 ?auto_701169 ) ( ON ?auto_701171 ?auto_701170 ) ( ON ?auto_701172 ?auto_701171 ) ( ON ?auto_701173 ?auto_701172 ) ( ON ?auto_701174 ?auto_701173 ) ( ON ?auto_701175 ?auto_701174 ) ( ON ?auto_701176 ?auto_701175 ) ( ON ?auto_701177 ?auto_701176 ) ( ON ?auto_701178 ?auto_701177 ) ( ON ?auto_701179 ?auto_701178 ) ( ON ?auto_701180 ?auto_701179 ) ( ON ?auto_701181 ?auto_701180 ) ( ON ?auto_701182 ?auto_701181 ) ( ON ?auto_701183 ?auto_701182 ) ( ON ?auto_701184 ?auto_701183 ) ( not ( = ?auto_701169 ?auto_701170 ) ) ( not ( = ?auto_701169 ?auto_701171 ) ) ( not ( = ?auto_701169 ?auto_701172 ) ) ( not ( = ?auto_701169 ?auto_701173 ) ) ( not ( = ?auto_701169 ?auto_701174 ) ) ( not ( = ?auto_701169 ?auto_701175 ) ) ( not ( = ?auto_701169 ?auto_701176 ) ) ( not ( = ?auto_701169 ?auto_701177 ) ) ( not ( = ?auto_701169 ?auto_701178 ) ) ( not ( = ?auto_701169 ?auto_701179 ) ) ( not ( = ?auto_701169 ?auto_701180 ) ) ( not ( = ?auto_701169 ?auto_701181 ) ) ( not ( = ?auto_701169 ?auto_701182 ) ) ( not ( = ?auto_701169 ?auto_701183 ) ) ( not ( = ?auto_701169 ?auto_701184 ) ) ( not ( = ?auto_701169 ?auto_701185 ) ) ( not ( = ?auto_701169 ?auto_701186 ) ) ( not ( = ?auto_701170 ?auto_701171 ) ) ( not ( = ?auto_701170 ?auto_701172 ) ) ( not ( = ?auto_701170 ?auto_701173 ) ) ( not ( = ?auto_701170 ?auto_701174 ) ) ( not ( = ?auto_701170 ?auto_701175 ) ) ( not ( = ?auto_701170 ?auto_701176 ) ) ( not ( = ?auto_701170 ?auto_701177 ) ) ( not ( = ?auto_701170 ?auto_701178 ) ) ( not ( = ?auto_701170 ?auto_701179 ) ) ( not ( = ?auto_701170 ?auto_701180 ) ) ( not ( = ?auto_701170 ?auto_701181 ) ) ( not ( = ?auto_701170 ?auto_701182 ) ) ( not ( = ?auto_701170 ?auto_701183 ) ) ( not ( = ?auto_701170 ?auto_701184 ) ) ( not ( = ?auto_701170 ?auto_701185 ) ) ( not ( = ?auto_701170 ?auto_701186 ) ) ( not ( = ?auto_701171 ?auto_701172 ) ) ( not ( = ?auto_701171 ?auto_701173 ) ) ( not ( = ?auto_701171 ?auto_701174 ) ) ( not ( = ?auto_701171 ?auto_701175 ) ) ( not ( = ?auto_701171 ?auto_701176 ) ) ( not ( = ?auto_701171 ?auto_701177 ) ) ( not ( = ?auto_701171 ?auto_701178 ) ) ( not ( = ?auto_701171 ?auto_701179 ) ) ( not ( = ?auto_701171 ?auto_701180 ) ) ( not ( = ?auto_701171 ?auto_701181 ) ) ( not ( = ?auto_701171 ?auto_701182 ) ) ( not ( = ?auto_701171 ?auto_701183 ) ) ( not ( = ?auto_701171 ?auto_701184 ) ) ( not ( = ?auto_701171 ?auto_701185 ) ) ( not ( = ?auto_701171 ?auto_701186 ) ) ( not ( = ?auto_701172 ?auto_701173 ) ) ( not ( = ?auto_701172 ?auto_701174 ) ) ( not ( = ?auto_701172 ?auto_701175 ) ) ( not ( = ?auto_701172 ?auto_701176 ) ) ( not ( = ?auto_701172 ?auto_701177 ) ) ( not ( = ?auto_701172 ?auto_701178 ) ) ( not ( = ?auto_701172 ?auto_701179 ) ) ( not ( = ?auto_701172 ?auto_701180 ) ) ( not ( = ?auto_701172 ?auto_701181 ) ) ( not ( = ?auto_701172 ?auto_701182 ) ) ( not ( = ?auto_701172 ?auto_701183 ) ) ( not ( = ?auto_701172 ?auto_701184 ) ) ( not ( = ?auto_701172 ?auto_701185 ) ) ( not ( = ?auto_701172 ?auto_701186 ) ) ( not ( = ?auto_701173 ?auto_701174 ) ) ( not ( = ?auto_701173 ?auto_701175 ) ) ( not ( = ?auto_701173 ?auto_701176 ) ) ( not ( = ?auto_701173 ?auto_701177 ) ) ( not ( = ?auto_701173 ?auto_701178 ) ) ( not ( = ?auto_701173 ?auto_701179 ) ) ( not ( = ?auto_701173 ?auto_701180 ) ) ( not ( = ?auto_701173 ?auto_701181 ) ) ( not ( = ?auto_701173 ?auto_701182 ) ) ( not ( = ?auto_701173 ?auto_701183 ) ) ( not ( = ?auto_701173 ?auto_701184 ) ) ( not ( = ?auto_701173 ?auto_701185 ) ) ( not ( = ?auto_701173 ?auto_701186 ) ) ( not ( = ?auto_701174 ?auto_701175 ) ) ( not ( = ?auto_701174 ?auto_701176 ) ) ( not ( = ?auto_701174 ?auto_701177 ) ) ( not ( = ?auto_701174 ?auto_701178 ) ) ( not ( = ?auto_701174 ?auto_701179 ) ) ( not ( = ?auto_701174 ?auto_701180 ) ) ( not ( = ?auto_701174 ?auto_701181 ) ) ( not ( = ?auto_701174 ?auto_701182 ) ) ( not ( = ?auto_701174 ?auto_701183 ) ) ( not ( = ?auto_701174 ?auto_701184 ) ) ( not ( = ?auto_701174 ?auto_701185 ) ) ( not ( = ?auto_701174 ?auto_701186 ) ) ( not ( = ?auto_701175 ?auto_701176 ) ) ( not ( = ?auto_701175 ?auto_701177 ) ) ( not ( = ?auto_701175 ?auto_701178 ) ) ( not ( = ?auto_701175 ?auto_701179 ) ) ( not ( = ?auto_701175 ?auto_701180 ) ) ( not ( = ?auto_701175 ?auto_701181 ) ) ( not ( = ?auto_701175 ?auto_701182 ) ) ( not ( = ?auto_701175 ?auto_701183 ) ) ( not ( = ?auto_701175 ?auto_701184 ) ) ( not ( = ?auto_701175 ?auto_701185 ) ) ( not ( = ?auto_701175 ?auto_701186 ) ) ( not ( = ?auto_701176 ?auto_701177 ) ) ( not ( = ?auto_701176 ?auto_701178 ) ) ( not ( = ?auto_701176 ?auto_701179 ) ) ( not ( = ?auto_701176 ?auto_701180 ) ) ( not ( = ?auto_701176 ?auto_701181 ) ) ( not ( = ?auto_701176 ?auto_701182 ) ) ( not ( = ?auto_701176 ?auto_701183 ) ) ( not ( = ?auto_701176 ?auto_701184 ) ) ( not ( = ?auto_701176 ?auto_701185 ) ) ( not ( = ?auto_701176 ?auto_701186 ) ) ( not ( = ?auto_701177 ?auto_701178 ) ) ( not ( = ?auto_701177 ?auto_701179 ) ) ( not ( = ?auto_701177 ?auto_701180 ) ) ( not ( = ?auto_701177 ?auto_701181 ) ) ( not ( = ?auto_701177 ?auto_701182 ) ) ( not ( = ?auto_701177 ?auto_701183 ) ) ( not ( = ?auto_701177 ?auto_701184 ) ) ( not ( = ?auto_701177 ?auto_701185 ) ) ( not ( = ?auto_701177 ?auto_701186 ) ) ( not ( = ?auto_701178 ?auto_701179 ) ) ( not ( = ?auto_701178 ?auto_701180 ) ) ( not ( = ?auto_701178 ?auto_701181 ) ) ( not ( = ?auto_701178 ?auto_701182 ) ) ( not ( = ?auto_701178 ?auto_701183 ) ) ( not ( = ?auto_701178 ?auto_701184 ) ) ( not ( = ?auto_701178 ?auto_701185 ) ) ( not ( = ?auto_701178 ?auto_701186 ) ) ( not ( = ?auto_701179 ?auto_701180 ) ) ( not ( = ?auto_701179 ?auto_701181 ) ) ( not ( = ?auto_701179 ?auto_701182 ) ) ( not ( = ?auto_701179 ?auto_701183 ) ) ( not ( = ?auto_701179 ?auto_701184 ) ) ( not ( = ?auto_701179 ?auto_701185 ) ) ( not ( = ?auto_701179 ?auto_701186 ) ) ( not ( = ?auto_701180 ?auto_701181 ) ) ( not ( = ?auto_701180 ?auto_701182 ) ) ( not ( = ?auto_701180 ?auto_701183 ) ) ( not ( = ?auto_701180 ?auto_701184 ) ) ( not ( = ?auto_701180 ?auto_701185 ) ) ( not ( = ?auto_701180 ?auto_701186 ) ) ( not ( = ?auto_701181 ?auto_701182 ) ) ( not ( = ?auto_701181 ?auto_701183 ) ) ( not ( = ?auto_701181 ?auto_701184 ) ) ( not ( = ?auto_701181 ?auto_701185 ) ) ( not ( = ?auto_701181 ?auto_701186 ) ) ( not ( = ?auto_701182 ?auto_701183 ) ) ( not ( = ?auto_701182 ?auto_701184 ) ) ( not ( = ?auto_701182 ?auto_701185 ) ) ( not ( = ?auto_701182 ?auto_701186 ) ) ( not ( = ?auto_701183 ?auto_701184 ) ) ( not ( = ?auto_701183 ?auto_701185 ) ) ( not ( = ?auto_701183 ?auto_701186 ) ) ( not ( = ?auto_701184 ?auto_701185 ) ) ( not ( = ?auto_701184 ?auto_701186 ) ) ( not ( = ?auto_701185 ?auto_701186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_701185 ?auto_701186 )
      ( !STACK ?auto_701185 ?auto_701184 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701204 - BLOCK
      ?auto_701205 - BLOCK
      ?auto_701206 - BLOCK
      ?auto_701207 - BLOCK
      ?auto_701208 - BLOCK
      ?auto_701209 - BLOCK
      ?auto_701210 - BLOCK
      ?auto_701211 - BLOCK
      ?auto_701212 - BLOCK
      ?auto_701213 - BLOCK
      ?auto_701214 - BLOCK
      ?auto_701215 - BLOCK
      ?auto_701216 - BLOCK
      ?auto_701217 - BLOCK
      ?auto_701218 - BLOCK
      ?auto_701219 - BLOCK
      ?auto_701220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_701219 ) ( ON-TABLE ?auto_701220 ) ( CLEAR ?auto_701220 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_701204 ) ( ON ?auto_701205 ?auto_701204 ) ( ON ?auto_701206 ?auto_701205 ) ( ON ?auto_701207 ?auto_701206 ) ( ON ?auto_701208 ?auto_701207 ) ( ON ?auto_701209 ?auto_701208 ) ( ON ?auto_701210 ?auto_701209 ) ( ON ?auto_701211 ?auto_701210 ) ( ON ?auto_701212 ?auto_701211 ) ( ON ?auto_701213 ?auto_701212 ) ( ON ?auto_701214 ?auto_701213 ) ( ON ?auto_701215 ?auto_701214 ) ( ON ?auto_701216 ?auto_701215 ) ( ON ?auto_701217 ?auto_701216 ) ( ON ?auto_701218 ?auto_701217 ) ( ON ?auto_701219 ?auto_701218 ) ( not ( = ?auto_701204 ?auto_701205 ) ) ( not ( = ?auto_701204 ?auto_701206 ) ) ( not ( = ?auto_701204 ?auto_701207 ) ) ( not ( = ?auto_701204 ?auto_701208 ) ) ( not ( = ?auto_701204 ?auto_701209 ) ) ( not ( = ?auto_701204 ?auto_701210 ) ) ( not ( = ?auto_701204 ?auto_701211 ) ) ( not ( = ?auto_701204 ?auto_701212 ) ) ( not ( = ?auto_701204 ?auto_701213 ) ) ( not ( = ?auto_701204 ?auto_701214 ) ) ( not ( = ?auto_701204 ?auto_701215 ) ) ( not ( = ?auto_701204 ?auto_701216 ) ) ( not ( = ?auto_701204 ?auto_701217 ) ) ( not ( = ?auto_701204 ?auto_701218 ) ) ( not ( = ?auto_701204 ?auto_701219 ) ) ( not ( = ?auto_701204 ?auto_701220 ) ) ( not ( = ?auto_701205 ?auto_701206 ) ) ( not ( = ?auto_701205 ?auto_701207 ) ) ( not ( = ?auto_701205 ?auto_701208 ) ) ( not ( = ?auto_701205 ?auto_701209 ) ) ( not ( = ?auto_701205 ?auto_701210 ) ) ( not ( = ?auto_701205 ?auto_701211 ) ) ( not ( = ?auto_701205 ?auto_701212 ) ) ( not ( = ?auto_701205 ?auto_701213 ) ) ( not ( = ?auto_701205 ?auto_701214 ) ) ( not ( = ?auto_701205 ?auto_701215 ) ) ( not ( = ?auto_701205 ?auto_701216 ) ) ( not ( = ?auto_701205 ?auto_701217 ) ) ( not ( = ?auto_701205 ?auto_701218 ) ) ( not ( = ?auto_701205 ?auto_701219 ) ) ( not ( = ?auto_701205 ?auto_701220 ) ) ( not ( = ?auto_701206 ?auto_701207 ) ) ( not ( = ?auto_701206 ?auto_701208 ) ) ( not ( = ?auto_701206 ?auto_701209 ) ) ( not ( = ?auto_701206 ?auto_701210 ) ) ( not ( = ?auto_701206 ?auto_701211 ) ) ( not ( = ?auto_701206 ?auto_701212 ) ) ( not ( = ?auto_701206 ?auto_701213 ) ) ( not ( = ?auto_701206 ?auto_701214 ) ) ( not ( = ?auto_701206 ?auto_701215 ) ) ( not ( = ?auto_701206 ?auto_701216 ) ) ( not ( = ?auto_701206 ?auto_701217 ) ) ( not ( = ?auto_701206 ?auto_701218 ) ) ( not ( = ?auto_701206 ?auto_701219 ) ) ( not ( = ?auto_701206 ?auto_701220 ) ) ( not ( = ?auto_701207 ?auto_701208 ) ) ( not ( = ?auto_701207 ?auto_701209 ) ) ( not ( = ?auto_701207 ?auto_701210 ) ) ( not ( = ?auto_701207 ?auto_701211 ) ) ( not ( = ?auto_701207 ?auto_701212 ) ) ( not ( = ?auto_701207 ?auto_701213 ) ) ( not ( = ?auto_701207 ?auto_701214 ) ) ( not ( = ?auto_701207 ?auto_701215 ) ) ( not ( = ?auto_701207 ?auto_701216 ) ) ( not ( = ?auto_701207 ?auto_701217 ) ) ( not ( = ?auto_701207 ?auto_701218 ) ) ( not ( = ?auto_701207 ?auto_701219 ) ) ( not ( = ?auto_701207 ?auto_701220 ) ) ( not ( = ?auto_701208 ?auto_701209 ) ) ( not ( = ?auto_701208 ?auto_701210 ) ) ( not ( = ?auto_701208 ?auto_701211 ) ) ( not ( = ?auto_701208 ?auto_701212 ) ) ( not ( = ?auto_701208 ?auto_701213 ) ) ( not ( = ?auto_701208 ?auto_701214 ) ) ( not ( = ?auto_701208 ?auto_701215 ) ) ( not ( = ?auto_701208 ?auto_701216 ) ) ( not ( = ?auto_701208 ?auto_701217 ) ) ( not ( = ?auto_701208 ?auto_701218 ) ) ( not ( = ?auto_701208 ?auto_701219 ) ) ( not ( = ?auto_701208 ?auto_701220 ) ) ( not ( = ?auto_701209 ?auto_701210 ) ) ( not ( = ?auto_701209 ?auto_701211 ) ) ( not ( = ?auto_701209 ?auto_701212 ) ) ( not ( = ?auto_701209 ?auto_701213 ) ) ( not ( = ?auto_701209 ?auto_701214 ) ) ( not ( = ?auto_701209 ?auto_701215 ) ) ( not ( = ?auto_701209 ?auto_701216 ) ) ( not ( = ?auto_701209 ?auto_701217 ) ) ( not ( = ?auto_701209 ?auto_701218 ) ) ( not ( = ?auto_701209 ?auto_701219 ) ) ( not ( = ?auto_701209 ?auto_701220 ) ) ( not ( = ?auto_701210 ?auto_701211 ) ) ( not ( = ?auto_701210 ?auto_701212 ) ) ( not ( = ?auto_701210 ?auto_701213 ) ) ( not ( = ?auto_701210 ?auto_701214 ) ) ( not ( = ?auto_701210 ?auto_701215 ) ) ( not ( = ?auto_701210 ?auto_701216 ) ) ( not ( = ?auto_701210 ?auto_701217 ) ) ( not ( = ?auto_701210 ?auto_701218 ) ) ( not ( = ?auto_701210 ?auto_701219 ) ) ( not ( = ?auto_701210 ?auto_701220 ) ) ( not ( = ?auto_701211 ?auto_701212 ) ) ( not ( = ?auto_701211 ?auto_701213 ) ) ( not ( = ?auto_701211 ?auto_701214 ) ) ( not ( = ?auto_701211 ?auto_701215 ) ) ( not ( = ?auto_701211 ?auto_701216 ) ) ( not ( = ?auto_701211 ?auto_701217 ) ) ( not ( = ?auto_701211 ?auto_701218 ) ) ( not ( = ?auto_701211 ?auto_701219 ) ) ( not ( = ?auto_701211 ?auto_701220 ) ) ( not ( = ?auto_701212 ?auto_701213 ) ) ( not ( = ?auto_701212 ?auto_701214 ) ) ( not ( = ?auto_701212 ?auto_701215 ) ) ( not ( = ?auto_701212 ?auto_701216 ) ) ( not ( = ?auto_701212 ?auto_701217 ) ) ( not ( = ?auto_701212 ?auto_701218 ) ) ( not ( = ?auto_701212 ?auto_701219 ) ) ( not ( = ?auto_701212 ?auto_701220 ) ) ( not ( = ?auto_701213 ?auto_701214 ) ) ( not ( = ?auto_701213 ?auto_701215 ) ) ( not ( = ?auto_701213 ?auto_701216 ) ) ( not ( = ?auto_701213 ?auto_701217 ) ) ( not ( = ?auto_701213 ?auto_701218 ) ) ( not ( = ?auto_701213 ?auto_701219 ) ) ( not ( = ?auto_701213 ?auto_701220 ) ) ( not ( = ?auto_701214 ?auto_701215 ) ) ( not ( = ?auto_701214 ?auto_701216 ) ) ( not ( = ?auto_701214 ?auto_701217 ) ) ( not ( = ?auto_701214 ?auto_701218 ) ) ( not ( = ?auto_701214 ?auto_701219 ) ) ( not ( = ?auto_701214 ?auto_701220 ) ) ( not ( = ?auto_701215 ?auto_701216 ) ) ( not ( = ?auto_701215 ?auto_701217 ) ) ( not ( = ?auto_701215 ?auto_701218 ) ) ( not ( = ?auto_701215 ?auto_701219 ) ) ( not ( = ?auto_701215 ?auto_701220 ) ) ( not ( = ?auto_701216 ?auto_701217 ) ) ( not ( = ?auto_701216 ?auto_701218 ) ) ( not ( = ?auto_701216 ?auto_701219 ) ) ( not ( = ?auto_701216 ?auto_701220 ) ) ( not ( = ?auto_701217 ?auto_701218 ) ) ( not ( = ?auto_701217 ?auto_701219 ) ) ( not ( = ?auto_701217 ?auto_701220 ) ) ( not ( = ?auto_701218 ?auto_701219 ) ) ( not ( = ?auto_701218 ?auto_701220 ) ) ( not ( = ?auto_701219 ?auto_701220 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_701220 )
      ( !STACK ?auto_701220 ?auto_701219 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701238 - BLOCK
      ?auto_701239 - BLOCK
      ?auto_701240 - BLOCK
      ?auto_701241 - BLOCK
      ?auto_701242 - BLOCK
      ?auto_701243 - BLOCK
      ?auto_701244 - BLOCK
      ?auto_701245 - BLOCK
      ?auto_701246 - BLOCK
      ?auto_701247 - BLOCK
      ?auto_701248 - BLOCK
      ?auto_701249 - BLOCK
      ?auto_701250 - BLOCK
      ?auto_701251 - BLOCK
      ?auto_701252 - BLOCK
      ?auto_701253 - BLOCK
      ?auto_701254 - BLOCK
    )
    :vars
    (
      ?auto_701255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701254 ?auto_701255 ) ( ON-TABLE ?auto_701238 ) ( ON ?auto_701239 ?auto_701238 ) ( ON ?auto_701240 ?auto_701239 ) ( ON ?auto_701241 ?auto_701240 ) ( ON ?auto_701242 ?auto_701241 ) ( ON ?auto_701243 ?auto_701242 ) ( ON ?auto_701244 ?auto_701243 ) ( ON ?auto_701245 ?auto_701244 ) ( ON ?auto_701246 ?auto_701245 ) ( ON ?auto_701247 ?auto_701246 ) ( ON ?auto_701248 ?auto_701247 ) ( ON ?auto_701249 ?auto_701248 ) ( ON ?auto_701250 ?auto_701249 ) ( ON ?auto_701251 ?auto_701250 ) ( ON ?auto_701252 ?auto_701251 ) ( not ( = ?auto_701238 ?auto_701239 ) ) ( not ( = ?auto_701238 ?auto_701240 ) ) ( not ( = ?auto_701238 ?auto_701241 ) ) ( not ( = ?auto_701238 ?auto_701242 ) ) ( not ( = ?auto_701238 ?auto_701243 ) ) ( not ( = ?auto_701238 ?auto_701244 ) ) ( not ( = ?auto_701238 ?auto_701245 ) ) ( not ( = ?auto_701238 ?auto_701246 ) ) ( not ( = ?auto_701238 ?auto_701247 ) ) ( not ( = ?auto_701238 ?auto_701248 ) ) ( not ( = ?auto_701238 ?auto_701249 ) ) ( not ( = ?auto_701238 ?auto_701250 ) ) ( not ( = ?auto_701238 ?auto_701251 ) ) ( not ( = ?auto_701238 ?auto_701252 ) ) ( not ( = ?auto_701238 ?auto_701253 ) ) ( not ( = ?auto_701238 ?auto_701254 ) ) ( not ( = ?auto_701238 ?auto_701255 ) ) ( not ( = ?auto_701239 ?auto_701240 ) ) ( not ( = ?auto_701239 ?auto_701241 ) ) ( not ( = ?auto_701239 ?auto_701242 ) ) ( not ( = ?auto_701239 ?auto_701243 ) ) ( not ( = ?auto_701239 ?auto_701244 ) ) ( not ( = ?auto_701239 ?auto_701245 ) ) ( not ( = ?auto_701239 ?auto_701246 ) ) ( not ( = ?auto_701239 ?auto_701247 ) ) ( not ( = ?auto_701239 ?auto_701248 ) ) ( not ( = ?auto_701239 ?auto_701249 ) ) ( not ( = ?auto_701239 ?auto_701250 ) ) ( not ( = ?auto_701239 ?auto_701251 ) ) ( not ( = ?auto_701239 ?auto_701252 ) ) ( not ( = ?auto_701239 ?auto_701253 ) ) ( not ( = ?auto_701239 ?auto_701254 ) ) ( not ( = ?auto_701239 ?auto_701255 ) ) ( not ( = ?auto_701240 ?auto_701241 ) ) ( not ( = ?auto_701240 ?auto_701242 ) ) ( not ( = ?auto_701240 ?auto_701243 ) ) ( not ( = ?auto_701240 ?auto_701244 ) ) ( not ( = ?auto_701240 ?auto_701245 ) ) ( not ( = ?auto_701240 ?auto_701246 ) ) ( not ( = ?auto_701240 ?auto_701247 ) ) ( not ( = ?auto_701240 ?auto_701248 ) ) ( not ( = ?auto_701240 ?auto_701249 ) ) ( not ( = ?auto_701240 ?auto_701250 ) ) ( not ( = ?auto_701240 ?auto_701251 ) ) ( not ( = ?auto_701240 ?auto_701252 ) ) ( not ( = ?auto_701240 ?auto_701253 ) ) ( not ( = ?auto_701240 ?auto_701254 ) ) ( not ( = ?auto_701240 ?auto_701255 ) ) ( not ( = ?auto_701241 ?auto_701242 ) ) ( not ( = ?auto_701241 ?auto_701243 ) ) ( not ( = ?auto_701241 ?auto_701244 ) ) ( not ( = ?auto_701241 ?auto_701245 ) ) ( not ( = ?auto_701241 ?auto_701246 ) ) ( not ( = ?auto_701241 ?auto_701247 ) ) ( not ( = ?auto_701241 ?auto_701248 ) ) ( not ( = ?auto_701241 ?auto_701249 ) ) ( not ( = ?auto_701241 ?auto_701250 ) ) ( not ( = ?auto_701241 ?auto_701251 ) ) ( not ( = ?auto_701241 ?auto_701252 ) ) ( not ( = ?auto_701241 ?auto_701253 ) ) ( not ( = ?auto_701241 ?auto_701254 ) ) ( not ( = ?auto_701241 ?auto_701255 ) ) ( not ( = ?auto_701242 ?auto_701243 ) ) ( not ( = ?auto_701242 ?auto_701244 ) ) ( not ( = ?auto_701242 ?auto_701245 ) ) ( not ( = ?auto_701242 ?auto_701246 ) ) ( not ( = ?auto_701242 ?auto_701247 ) ) ( not ( = ?auto_701242 ?auto_701248 ) ) ( not ( = ?auto_701242 ?auto_701249 ) ) ( not ( = ?auto_701242 ?auto_701250 ) ) ( not ( = ?auto_701242 ?auto_701251 ) ) ( not ( = ?auto_701242 ?auto_701252 ) ) ( not ( = ?auto_701242 ?auto_701253 ) ) ( not ( = ?auto_701242 ?auto_701254 ) ) ( not ( = ?auto_701242 ?auto_701255 ) ) ( not ( = ?auto_701243 ?auto_701244 ) ) ( not ( = ?auto_701243 ?auto_701245 ) ) ( not ( = ?auto_701243 ?auto_701246 ) ) ( not ( = ?auto_701243 ?auto_701247 ) ) ( not ( = ?auto_701243 ?auto_701248 ) ) ( not ( = ?auto_701243 ?auto_701249 ) ) ( not ( = ?auto_701243 ?auto_701250 ) ) ( not ( = ?auto_701243 ?auto_701251 ) ) ( not ( = ?auto_701243 ?auto_701252 ) ) ( not ( = ?auto_701243 ?auto_701253 ) ) ( not ( = ?auto_701243 ?auto_701254 ) ) ( not ( = ?auto_701243 ?auto_701255 ) ) ( not ( = ?auto_701244 ?auto_701245 ) ) ( not ( = ?auto_701244 ?auto_701246 ) ) ( not ( = ?auto_701244 ?auto_701247 ) ) ( not ( = ?auto_701244 ?auto_701248 ) ) ( not ( = ?auto_701244 ?auto_701249 ) ) ( not ( = ?auto_701244 ?auto_701250 ) ) ( not ( = ?auto_701244 ?auto_701251 ) ) ( not ( = ?auto_701244 ?auto_701252 ) ) ( not ( = ?auto_701244 ?auto_701253 ) ) ( not ( = ?auto_701244 ?auto_701254 ) ) ( not ( = ?auto_701244 ?auto_701255 ) ) ( not ( = ?auto_701245 ?auto_701246 ) ) ( not ( = ?auto_701245 ?auto_701247 ) ) ( not ( = ?auto_701245 ?auto_701248 ) ) ( not ( = ?auto_701245 ?auto_701249 ) ) ( not ( = ?auto_701245 ?auto_701250 ) ) ( not ( = ?auto_701245 ?auto_701251 ) ) ( not ( = ?auto_701245 ?auto_701252 ) ) ( not ( = ?auto_701245 ?auto_701253 ) ) ( not ( = ?auto_701245 ?auto_701254 ) ) ( not ( = ?auto_701245 ?auto_701255 ) ) ( not ( = ?auto_701246 ?auto_701247 ) ) ( not ( = ?auto_701246 ?auto_701248 ) ) ( not ( = ?auto_701246 ?auto_701249 ) ) ( not ( = ?auto_701246 ?auto_701250 ) ) ( not ( = ?auto_701246 ?auto_701251 ) ) ( not ( = ?auto_701246 ?auto_701252 ) ) ( not ( = ?auto_701246 ?auto_701253 ) ) ( not ( = ?auto_701246 ?auto_701254 ) ) ( not ( = ?auto_701246 ?auto_701255 ) ) ( not ( = ?auto_701247 ?auto_701248 ) ) ( not ( = ?auto_701247 ?auto_701249 ) ) ( not ( = ?auto_701247 ?auto_701250 ) ) ( not ( = ?auto_701247 ?auto_701251 ) ) ( not ( = ?auto_701247 ?auto_701252 ) ) ( not ( = ?auto_701247 ?auto_701253 ) ) ( not ( = ?auto_701247 ?auto_701254 ) ) ( not ( = ?auto_701247 ?auto_701255 ) ) ( not ( = ?auto_701248 ?auto_701249 ) ) ( not ( = ?auto_701248 ?auto_701250 ) ) ( not ( = ?auto_701248 ?auto_701251 ) ) ( not ( = ?auto_701248 ?auto_701252 ) ) ( not ( = ?auto_701248 ?auto_701253 ) ) ( not ( = ?auto_701248 ?auto_701254 ) ) ( not ( = ?auto_701248 ?auto_701255 ) ) ( not ( = ?auto_701249 ?auto_701250 ) ) ( not ( = ?auto_701249 ?auto_701251 ) ) ( not ( = ?auto_701249 ?auto_701252 ) ) ( not ( = ?auto_701249 ?auto_701253 ) ) ( not ( = ?auto_701249 ?auto_701254 ) ) ( not ( = ?auto_701249 ?auto_701255 ) ) ( not ( = ?auto_701250 ?auto_701251 ) ) ( not ( = ?auto_701250 ?auto_701252 ) ) ( not ( = ?auto_701250 ?auto_701253 ) ) ( not ( = ?auto_701250 ?auto_701254 ) ) ( not ( = ?auto_701250 ?auto_701255 ) ) ( not ( = ?auto_701251 ?auto_701252 ) ) ( not ( = ?auto_701251 ?auto_701253 ) ) ( not ( = ?auto_701251 ?auto_701254 ) ) ( not ( = ?auto_701251 ?auto_701255 ) ) ( not ( = ?auto_701252 ?auto_701253 ) ) ( not ( = ?auto_701252 ?auto_701254 ) ) ( not ( = ?auto_701252 ?auto_701255 ) ) ( not ( = ?auto_701253 ?auto_701254 ) ) ( not ( = ?auto_701253 ?auto_701255 ) ) ( not ( = ?auto_701254 ?auto_701255 ) ) ( CLEAR ?auto_701252 ) ( ON ?auto_701253 ?auto_701254 ) ( CLEAR ?auto_701253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_701238 ?auto_701239 ?auto_701240 ?auto_701241 ?auto_701242 ?auto_701243 ?auto_701244 ?auto_701245 ?auto_701246 ?auto_701247 ?auto_701248 ?auto_701249 ?auto_701250 ?auto_701251 ?auto_701252 ?auto_701253 )
      ( MAKE-17PILE ?auto_701238 ?auto_701239 ?auto_701240 ?auto_701241 ?auto_701242 ?auto_701243 ?auto_701244 ?auto_701245 ?auto_701246 ?auto_701247 ?auto_701248 ?auto_701249 ?auto_701250 ?auto_701251 ?auto_701252 ?auto_701253 ?auto_701254 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701273 - BLOCK
      ?auto_701274 - BLOCK
      ?auto_701275 - BLOCK
      ?auto_701276 - BLOCK
      ?auto_701277 - BLOCK
      ?auto_701278 - BLOCK
      ?auto_701279 - BLOCK
      ?auto_701280 - BLOCK
      ?auto_701281 - BLOCK
      ?auto_701282 - BLOCK
      ?auto_701283 - BLOCK
      ?auto_701284 - BLOCK
      ?auto_701285 - BLOCK
      ?auto_701286 - BLOCK
      ?auto_701287 - BLOCK
      ?auto_701288 - BLOCK
      ?auto_701289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_701289 ) ( ON-TABLE ?auto_701273 ) ( ON ?auto_701274 ?auto_701273 ) ( ON ?auto_701275 ?auto_701274 ) ( ON ?auto_701276 ?auto_701275 ) ( ON ?auto_701277 ?auto_701276 ) ( ON ?auto_701278 ?auto_701277 ) ( ON ?auto_701279 ?auto_701278 ) ( ON ?auto_701280 ?auto_701279 ) ( ON ?auto_701281 ?auto_701280 ) ( ON ?auto_701282 ?auto_701281 ) ( ON ?auto_701283 ?auto_701282 ) ( ON ?auto_701284 ?auto_701283 ) ( ON ?auto_701285 ?auto_701284 ) ( ON ?auto_701286 ?auto_701285 ) ( ON ?auto_701287 ?auto_701286 ) ( not ( = ?auto_701273 ?auto_701274 ) ) ( not ( = ?auto_701273 ?auto_701275 ) ) ( not ( = ?auto_701273 ?auto_701276 ) ) ( not ( = ?auto_701273 ?auto_701277 ) ) ( not ( = ?auto_701273 ?auto_701278 ) ) ( not ( = ?auto_701273 ?auto_701279 ) ) ( not ( = ?auto_701273 ?auto_701280 ) ) ( not ( = ?auto_701273 ?auto_701281 ) ) ( not ( = ?auto_701273 ?auto_701282 ) ) ( not ( = ?auto_701273 ?auto_701283 ) ) ( not ( = ?auto_701273 ?auto_701284 ) ) ( not ( = ?auto_701273 ?auto_701285 ) ) ( not ( = ?auto_701273 ?auto_701286 ) ) ( not ( = ?auto_701273 ?auto_701287 ) ) ( not ( = ?auto_701273 ?auto_701288 ) ) ( not ( = ?auto_701273 ?auto_701289 ) ) ( not ( = ?auto_701274 ?auto_701275 ) ) ( not ( = ?auto_701274 ?auto_701276 ) ) ( not ( = ?auto_701274 ?auto_701277 ) ) ( not ( = ?auto_701274 ?auto_701278 ) ) ( not ( = ?auto_701274 ?auto_701279 ) ) ( not ( = ?auto_701274 ?auto_701280 ) ) ( not ( = ?auto_701274 ?auto_701281 ) ) ( not ( = ?auto_701274 ?auto_701282 ) ) ( not ( = ?auto_701274 ?auto_701283 ) ) ( not ( = ?auto_701274 ?auto_701284 ) ) ( not ( = ?auto_701274 ?auto_701285 ) ) ( not ( = ?auto_701274 ?auto_701286 ) ) ( not ( = ?auto_701274 ?auto_701287 ) ) ( not ( = ?auto_701274 ?auto_701288 ) ) ( not ( = ?auto_701274 ?auto_701289 ) ) ( not ( = ?auto_701275 ?auto_701276 ) ) ( not ( = ?auto_701275 ?auto_701277 ) ) ( not ( = ?auto_701275 ?auto_701278 ) ) ( not ( = ?auto_701275 ?auto_701279 ) ) ( not ( = ?auto_701275 ?auto_701280 ) ) ( not ( = ?auto_701275 ?auto_701281 ) ) ( not ( = ?auto_701275 ?auto_701282 ) ) ( not ( = ?auto_701275 ?auto_701283 ) ) ( not ( = ?auto_701275 ?auto_701284 ) ) ( not ( = ?auto_701275 ?auto_701285 ) ) ( not ( = ?auto_701275 ?auto_701286 ) ) ( not ( = ?auto_701275 ?auto_701287 ) ) ( not ( = ?auto_701275 ?auto_701288 ) ) ( not ( = ?auto_701275 ?auto_701289 ) ) ( not ( = ?auto_701276 ?auto_701277 ) ) ( not ( = ?auto_701276 ?auto_701278 ) ) ( not ( = ?auto_701276 ?auto_701279 ) ) ( not ( = ?auto_701276 ?auto_701280 ) ) ( not ( = ?auto_701276 ?auto_701281 ) ) ( not ( = ?auto_701276 ?auto_701282 ) ) ( not ( = ?auto_701276 ?auto_701283 ) ) ( not ( = ?auto_701276 ?auto_701284 ) ) ( not ( = ?auto_701276 ?auto_701285 ) ) ( not ( = ?auto_701276 ?auto_701286 ) ) ( not ( = ?auto_701276 ?auto_701287 ) ) ( not ( = ?auto_701276 ?auto_701288 ) ) ( not ( = ?auto_701276 ?auto_701289 ) ) ( not ( = ?auto_701277 ?auto_701278 ) ) ( not ( = ?auto_701277 ?auto_701279 ) ) ( not ( = ?auto_701277 ?auto_701280 ) ) ( not ( = ?auto_701277 ?auto_701281 ) ) ( not ( = ?auto_701277 ?auto_701282 ) ) ( not ( = ?auto_701277 ?auto_701283 ) ) ( not ( = ?auto_701277 ?auto_701284 ) ) ( not ( = ?auto_701277 ?auto_701285 ) ) ( not ( = ?auto_701277 ?auto_701286 ) ) ( not ( = ?auto_701277 ?auto_701287 ) ) ( not ( = ?auto_701277 ?auto_701288 ) ) ( not ( = ?auto_701277 ?auto_701289 ) ) ( not ( = ?auto_701278 ?auto_701279 ) ) ( not ( = ?auto_701278 ?auto_701280 ) ) ( not ( = ?auto_701278 ?auto_701281 ) ) ( not ( = ?auto_701278 ?auto_701282 ) ) ( not ( = ?auto_701278 ?auto_701283 ) ) ( not ( = ?auto_701278 ?auto_701284 ) ) ( not ( = ?auto_701278 ?auto_701285 ) ) ( not ( = ?auto_701278 ?auto_701286 ) ) ( not ( = ?auto_701278 ?auto_701287 ) ) ( not ( = ?auto_701278 ?auto_701288 ) ) ( not ( = ?auto_701278 ?auto_701289 ) ) ( not ( = ?auto_701279 ?auto_701280 ) ) ( not ( = ?auto_701279 ?auto_701281 ) ) ( not ( = ?auto_701279 ?auto_701282 ) ) ( not ( = ?auto_701279 ?auto_701283 ) ) ( not ( = ?auto_701279 ?auto_701284 ) ) ( not ( = ?auto_701279 ?auto_701285 ) ) ( not ( = ?auto_701279 ?auto_701286 ) ) ( not ( = ?auto_701279 ?auto_701287 ) ) ( not ( = ?auto_701279 ?auto_701288 ) ) ( not ( = ?auto_701279 ?auto_701289 ) ) ( not ( = ?auto_701280 ?auto_701281 ) ) ( not ( = ?auto_701280 ?auto_701282 ) ) ( not ( = ?auto_701280 ?auto_701283 ) ) ( not ( = ?auto_701280 ?auto_701284 ) ) ( not ( = ?auto_701280 ?auto_701285 ) ) ( not ( = ?auto_701280 ?auto_701286 ) ) ( not ( = ?auto_701280 ?auto_701287 ) ) ( not ( = ?auto_701280 ?auto_701288 ) ) ( not ( = ?auto_701280 ?auto_701289 ) ) ( not ( = ?auto_701281 ?auto_701282 ) ) ( not ( = ?auto_701281 ?auto_701283 ) ) ( not ( = ?auto_701281 ?auto_701284 ) ) ( not ( = ?auto_701281 ?auto_701285 ) ) ( not ( = ?auto_701281 ?auto_701286 ) ) ( not ( = ?auto_701281 ?auto_701287 ) ) ( not ( = ?auto_701281 ?auto_701288 ) ) ( not ( = ?auto_701281 ?auto_701289 ) ) ( not ( = ?auto_701282 ?auto_701283 ) ) ( not ( = ?auto_701282 ?auto_701284 ) ) ( not ( = ?auto_701282 ?auto_701285 ) ) ( not ( = ?auto_701282 ?auto_701286 ) ) ( not ( = ?auto_701282 ?auto_701287 ) ) ( not ( = ?auto_701282 ?auto_701288 ) ) ( not ( = ?auto_701282 ?auto_701289 ) ) ( not ( = ?auto_701283 ?auto_701284 ) ) ( not ( = ?auto_701283 ?auto_701285 ) ) ( not ( = ?auto_701283 ?auto_701286 ) ) ( not ( = ?auto_701283 ?auto_701287 ) ) ( not ( = ?auto_701283 ?auto_701288 ) ) ( not ( = ?auto_701283 ?auto_701289 ) ) ( not ( = ?auto_701284 ?auto_701285 ) ) ( not ( = ?auto_701284 ?auto_701286 ) ) ( not ( = ?auto_701284 ?auto_701287 ) ) ( not ( = ?auto_701284 ?auto_701288 ) ) ( not ( = ?auto_701284 ?auto_701289 ) ) ( not ( = ?auto_701285 ?auto_701286 ) ) ( not ( = ?auto_701285 ?auto_701287 ) ) ( not ( = ?auto_701285 ?auto_701288 ) ) ( not ( = ?auto_701285 ?auto_701289 ) ) ( not ( = ?auto_701286 ?auto_701287 ) ) ( not ( = ?auto_701286 ?auto_701288 ) ) ( not ( = ?auto_701286 ?auto_701289 ) ) ( not ( = ?auto_701287 ?auto_701288 ) ) ( not ( = ?auto_701287 ?auto_701289 ) ) ( not ( = ?auto_701288 ?auto_701289 ) ) ( CLEAR ?auto_701287 ) ( ON ?auto_701288 ?auto_701289 ) ( CLEAR ?auto_701288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_701273 ?auto_701274 ?auto_701275 ?auto_701276 ?auto_701277 ?auto_701278 ?auto_701279 ?auto_701280 ?auto_701281 ?auto_701282 ?auto_701283 ?auto_701284 ?auto_701285 ?auto_701286 ?auto_701287 ?auto_701288 )
      ( MAKE-17PILE ?auto_701273 ?auto_701274 ?auto_701275 ?auto_701276 ?auto_701277 ?auto_701278 ?auto_701279 ?auto_701280 ?auto_701281 ?auto_701282 ?auto_701283 ?auto_701284 ?auto_701285 ?auto_701286 ?auto_701287 ?auto_701288 ?auto_701289 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701307 - BLOCK
      ?auto_701308 - BLOCK
      ?auto_701309 - BLOCK
      ?auto_701310 - BLOCK
      ?auto_701311 - BLOCK
      ?auto_701312 - BLOCK
      ?auto_701313 - BLOCK
      ?auto_701314 - BLOCK
      ?auto_701315 - BLOCK
      ?auto_701316 - BLOCK
      ?auto_701317 - BLOCK
      ?auto_701318 - BLOCK
      ?auto_701319 - BLOCK
      ?auto_701320 - BLOCK
      ?auto_701321 - BLOCK
      ?auto_701322 - BLOCK
      ?auto_701323 - BLOCK
    )
    :vars
    (
      ?auto_701324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701323 ?auto_701324 ) ( ON-TABLE ?auto_701307 ) ( ON ?auto_701308 ?auto_701307 ) ( ON ?auto_701309 ?auto_701308 ) ( ON ?auto_701310 ?auto_701309 ) ( ON ?auto_701311 ?auto_701310 ) ( ON ?auto_701312 ?auto_701311 ) ( ON ?auto_701313 ?auto_701312 ) ( ON ?auto_701314 ?auto_701313 ) ( ON ?auto_701315 ?auto_701314 ) ( ON ?auto_701316 ?auto_701315 ) ( ON ?auto_701317 ?auto_701316 ) ( ON ?auto_701318 ?auto_701317 ) ( ON ?auto_701319 ?auto_701318 ) ( ON ?auto_701320 ?auto_701319 ) ( not ( = ?auto_701307 ?auto_701308 ) ) ( not ( = ?auto_701307 ?auto_701309 ) ) ( not ( = ?auto_701307 ?auto_701310 ) ) ( not ( = ?auto_701307 ?auto_701311 ) ) ( not ( = ?auto_701307 ?auto_701312 ) ) ( not ( = ?auto_701307 ?auto_701313 ) ) ( not ( = ?auto_701307 ?auto_701314 ) ) ( not ( = ?auto_701307 ?auto_701315 ) ) ( not ( = ?auto_701307 ?auto_701316 ) ) ( not ( = ?auto_701307 ?auto_701317 ) ) ( not ( = ?auto_701307 ?auto_701318 ) ) ( not ( = ?auto_701307 ?auto_701319 ) ) ( not ( = ?auto_701307 ?auto_701320 ) ) ( not ( = ?auto_701307 ?auto_701321 ) ) ( not ( = ?auto_701307 ?auto_701322 ) ) ( not ( = ?auto_701307 ?auto_701323 ) ) ( not ( = ?auto_701307 ?auto_701324 ) ) ( not ( = ?auto_701308 ?auto_701309 ) ) ( not ( = ?auto_701308 ?auto_701310 ) ) ( not ( = ?auto_701308 ?auto_701311 ) ) ( not ( = ?auto_701308 ?auto_701312 ) ) ( not ( = ?auto_701308 ?auto_701313 ) ) ( not ( = ?auto_701308 ?auto_701314 ) ) ( not ( = ?auto_701308 ?auto_701315 ) ) ( not ( = ?auto_701308 ?auto_701316 ) ) ( not ( = ?auto_701308 ?auto_701317 ) ) ( not ( = ?auto_701308 ?auto_701318 ) ) ( not ( = ?auto_701308 ?auto_701319 ) ) ( not ( = ?auto_701308 ?auto_701320 ) ) ( not ( = ?auto_701308 ?auto_701321 ) ) ( not ( = ?auto_701308 ?auto_701322 ) ) ( not ( = ?auto_701308 ?auto_701323 ) ) ( not ( = ?auto_701308 ?auto_701324 ) ) ( not ( = ?auto_701309 ?auto_701310 ) ) ( not ( = ?auto_701309 ?auto_701311 ) ) ( not ( = ?auto_701309 ?auto_701312 ) ) ( not ( = ?auto_701309 ?auto_701313 ) ) ( not ( = ?auto_701309 ?auto_701314 ) ) ( not ( = ?auto_701309 ?auto_701315 ) ) ( not ( = ?auto_701309 ?auto_701316 ) ) ( not ( = ?auto_701309 ?auto_701317 ) ) ( not ( = ?auto_701309 ?auto_701318 ) ) ( not ( = ?auto_701309 ?auto_701319 ) ) ( not ( = ?auto_701309 ?auto_701320 ) ) ( not ( = ?auto_701309 ?auto_701321 ) ) ( not ( = ?auto_701309 ?auto_701322 ) ) ( not ( = ?auto_701309 ?auto_701323 ) ) ( not ( = ?auto_701309 ?auto_701324 ) ) ( not ( = ?auto_701310 ?auto_701311 ) ) ( not ( = ?auto_701310 ?auto_701312 ) ) ( not ( = ?auto_701310 ?auto_701313 ) ) ( not ( = ?auto_701310 ?auto_701314 ) ) ( not ( = ?auto_701310 ?auto_701315 ) ) ( not ( = ?auto_701310 ?auto_701316 ) ) ( not ( = ?auto_701310 ?auto_701317 ) ) ( not ( = ?auto_701310 ?auto_701318 ) ) ( not ( = ?auto_701310 ?auto_701319 ) ) ( not ( = ?auto_701310 ?auto_701320 ) ) ( not ( = ?auto_701310 ?auto_701321 ) ) ( not ( = ?auto_701310 ?auto_701322 ) ) ( not ( = ?auto_701310 ?auto_701323 ) ) ( not ( = ?auto_701310 ?auto_701324 ) ) ( not ( = ?auto_701311 ?auto_701312 ) ) ( not ( = ?auto_701311 ?auto_701313 ) ) ( not ( = ?auto_701311 ?auto_701314 ) ) ( not ( = ?auto_701311 ?auto_701315 ) ) ( not ( = ?auto_701311 ?auto_701316 ) ) ( not ( = ?auto_701311 ?auto_701317 ) ) ( not ( = ?auto_701311 ?auto_701318 ) ) ( not ( = ?auto_701311 ?auto_701319 ) ) ( not ( = ?auto_701311 ?auto_701320 ) ) ( not ( = ?auto_701311 ?auto_701321 ) ) ( not ( = ?auto_701311 ?auto_701322 ) ) ( not ( = ?auto_701311 ?auto_701323 ) ) ( not ( = ?auto_701311 ?auto_701324 ) ) ( not ( = ?auto_701312 ?auto_701313 ) ) ( not ( = ?auto_701312 ?auto_701314 ) ) ( not ( = ?auto_701312 ?auto_701315 ) ) ( not ( = ?auto_701312 ?auto_701316 ) ) ( not ( = ?auto_701312 ?auto_701317 ) ) ( not ( = ?auto_701312 ?auto_701318 ) ) ( not ( = ?auto_701312 ?auto_701319 ) ) ( not ( = ?auto_701312 ?auto_701320 ) ) ( not ( = ?auto_701312 ?auto_701321 ) ) ( not ( = ?auto_701312 ?auto_701322 ) ) ( not ( = ?auto_701312 ?auto_701323 ) ) ( not ( = ?auto_701312 ?auto_701324 ) ) ( not ( = ?auto_701313 ?auto_701314 ) ) ( not ( = ?auto_701313 ?auto_701315 ) ) ( not ( = ?auto_701313 ?auto_701316 ) ) ( not ( = ?auto_701313 ?auto_701317 ) ) ( not ( = ?auto_701313 ?auto_701318 ) ) ( not ( = ?auto_701313 ?auto_701319 ) ) ( not ( = ?auto_701313 ?auto_701320 ) ) ( not ( = ?auto_701313 ?auto_701321 ) ) ( not ( = ?auto_701313 ?auto_701322 ) ) ( not ( = ?auto_701313 ?auto_701323 ) ) ( not ( = ?auto_701313 ?auto_701324 ) ) ( not ( = ?auto_701314 ?auto_701315 ) ) ( not ( = ?auto_701314 ?auto_701316 ) ) ( not ( = ?auto_701314 ?auto_701317 ) ) ( not ( = ?auto_701314 ?auto_701318 ) ) ( not ( = ?auto_701314 ?auto_701319 ) ) ( not ( = ?auto_701314 ?auto_701320 ) ) ( not ( = ?auto_701314 ?auto_701321 ) ) ( not ( = ?auto_701314 ?auto_701322 ) ) ( not ( = ?auto_701314 ?auto_701323 ) ) ( not ( = ?auto_701314 ?auto_701324 ) ) ( not ( = ?auto_701315 ?auto_701316 ) ) ( not ( = ?auto_701315 ?auto_701317 ) ) ( not ( = ?auto_701315 ?auto_701318 ) ) ( not ( = ?auto_701315 ?auto_701319 ) ) ( not ( = ?auto_701315 ?auto_701320 ) ) ( not ( = ?auto_701315 ?auto_701321 ) ) ( not ( = ?auto_701315 ?auto_701322 ) ) ( not ( = ?auto_701315 ?auto_701323 ) ) ( not ( = ?auto_701315 ?auto_701324 ) ) ( not ( = ?auto_701316 ?auto_701317 ) ) ( not ( = ?auto_701316 ?auto_701318 ) ) ( not ( = ?auto_701316 ?auto_701319 ) ) ( not ( = ?auto_701316 ?auto_701320 ) ) ( not ( = ?auto_701316 ?auto_701321 ) ) ( not ( = ?auto_701316 ?auto_701322 ) ) ( not ( = ?auto_701316 ?auto_701323 ) ) ( not ( = ?auto_701316 ?auto_701324 ) ) ( not ( = ?auto_701317 ?auto_701318 ) ) ( not ( = ?auto_701317 ?auto_701319 ) ) ( not ( = ?auto_701317 ?auto_701320 ) ) ( not ( = ?auto_701317 ?auto_701321 ) ) ( not ( = ?auto_701317 ?auto_701322 ) ) ( not ( = ?auto_701317 ?auto_701323 ) ) ( not ( = ?auto_701317 ?auto_701324 ) ) ( not ( = ?auto_701318 ?auto_701319 ) ) ( not ( = ?auto_701318 ?auto_701320 ) ) ( not ( = ?auto_701318 ?auto_701321 ) ) ( not ( = ?auto_701318 ?auto_701322 ) ) ( not ( = ?auto_701318 ?auto_701323 ) ) ( not ( = ?auto_701318 ?auto_701324 ) ) ( not ( = ?auto_701319 ?auto_701320 ) ) ( not ( = ?auto_701319 ?auto_701321 ) ) ( not ( = ?auto_701319 ?auto_701322 ) ) ( not ( = ?auto_701319 ?auto_701323 ) ) ( not ( = ?auto_701319 ?auto_701324 ) ) ( not ( = ?auto_701320 ?auto_701321 ) ) ( not ( = ?auto_701320 ?auto_701322 ) ) ( not ( = ?auto_701320 ?auto_701323 ) ) ( not ( = ?auto_701320 ?auto_701324 ) ) ( not ( = ?auto_701321 ?auto_701322 ) ) ( not ( = ?auto_701321 ?auto_701323 ) ) ( not ( = ?auto_701321 ?auto_701324 ) ) ( not ( = ?auto_701322 ?auto_701323 ) ) ( not ( = ?auto_701322 ?auto_701324 ) ) ( not ( = ?auto_701323 ?auto_701324 ) ) ( ON ?auto_701322 ?auto_701323 ) ( CLEAR ?auto_701320 ) ( ON ?auto_701321 ?auto_701322 ) ( CLEAR ?auto_701321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_701307 ?auto_701308 ?auto_701309 ?auto_701310 ?auto_701311 ?auto_701312 ?auto_701313 ?auto_701314 ?auto_701315 ?auto_701316 ?auto_701317 ?auto_701318 ?auto_701319 ?auto_701320 ?auto_701321 )
      ( MAKE-17PILE ?auto_701307 ?auto_701308 ?auto_701309 ?auto_701310 ?auto_701311 ?auto_701312 ?auto_701313 ?auto_701314 ?auto_701315 ?auto_701316 ?auto_701317 ?auto_701318 ?auto_701319 ?auto_701320 ?auto_701321 ?auto_701322 ?auto_701323 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701342 - BLOCK
      ?auto_701343 - BLOCK
      ?auto_701344 - BLOCK
      ?auto_701345 - BLOCK
      ?auto_701346 - BLOCK
      ?auto_701347 - BLOCK
      ?auto_701348 - BLOCK
      ?auto_701349 - BLOCK
      ?auto_701350 - BLOCK
      ?auto_701351 - BLOCK
      ?auto_701352 - BLOCK
      ?auto_701353 - BLOCK
      ?auto_701354 - BLOCK
      ?auto_701355 - BLOCK
      ?auto_701356 - BLOCK
      ?auto_701357 - BLOCK
      ?auto_701358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_701358 ) ( ON-TABLE ?auto_701342 ) ( ON ?auto_701343 ?auto_701342 ) ( ON ?auto_701344 ?auto_701343 ) ( ON ?auto_701345 ?auto_701344 ) ( ON ?auto_701346 ?auto_701345 ) ( ON ?auto_701347 ?auto_701346 ) ( ON ?auto_701348 ?auto_701347 ) ( ON ?auto_701349 ?auto_701348 ) ( ON ?auto_701350 ?auto_701349 ) ( ON ?auto_701351 ?auto_701350 ) ( ON ?auto_701352 ?auto_701351 ) ( ON ?auto_701353 ?auto_701352 ) ( ON ?auto_701354 ?auto_701353 ) ( ON ?auto_701355 ?auto_701354 ) ( not ( = ?auto_701342 ?auto_701343 ) ) ( not ( = ?auto_701342 ?auto_701344 ) ) ( not ( = ?auto_701342 ?auto_701345 ) ) ( not ( = ?auto_701342 ?auto_701346 ) ) ( not ( = ?auto_701342 ?auto_701347 ) ) ( not ( = ?auto_701342 ?auto_701348 ) ) ( not ( = ?auto_701342 ?auto_701349 ) ) ( not ( = ?auto_701342 ?auto_701350 ) ) ( not ( = ?auto_701342 ?auto_701351 ) ) ( not ( = ?auto_701342 ?auto_701352 ) ) ( not ( = ?auto_701342 ?auto_701353 ) ) ( not ( = ?auto_701342 ?auto_701354 ) ) ( not ( = ?auto_701342 ?auto_701355 ) ) ( not ( = ?auto_701342 ?auto_701356 ) ) ( not ( = ?auto_701342 ?auto_701357 ) ) ( not ( = ?auto_701342 ?auto_701358 ) ) ( not ( = ?auto_701343 ?auto_701344 ) ) ( not ( = ?auto_701343 ?auto_701345 ) ) ( not ( = ?auto_701343 ?auto_701346 ) ) ( not ( = ?auto_701343 ?auto_701347 ) ) ( not ( = ?auto_701343 ?auto_701348 ) ) ( not ( = ?auto_701343 ?auto_701349 ) ) ( not ( = ?auto_701343 ?auto_701350 ) ) ( not ( = ?auto_701343 ?auto_701351 ) ) ( not ( = ?auto_701343 ?auto_701352 ) ) ( not ( = ?auto_701343 ?auto_701353 ) ) ( not ( = ?auto_701343 ?auto_701354 ) ) ( not ( = ?auto_701343 ?auto_701355 ) ) ( not ( = ?auto_701343 ?auto_701356 ) ) ( not ( = ?auto_701343 ?auto_701357 ) ) ( not ( = ?auto_701343 ?auto_701358 ) ) ( not ( = ?auto_701344 ?auto_701345 ) ) ( not ( = ?auto_701344 ?auto_701346 ) ) ( not ( = ?auto_701344 ?auto_701347 ) ) ( not ( = ?auto_701344 ?auto_701348 ) ) ( not ( = ?auto_701344 ?auto_701349 ) ) ( not ( = ?auto_701344 ?auto_701350 ) ) ( not ( = ?auto_701344 ?auto_701351 ) ) ( not ( = ?auto_701344 ?auto_701352 ) ) ( not ( = ?auto_701344 ?auto_701353 ) ) ( not ( = ?auto_701344 ?auto_701354 ) ) ( not ( = ?auto_701344 ?auto_701355 ) ) ( not ( = ?auto_701344 ?auto_701356 ) ) ( not ( = ?auto_701344 ?auto_701357 ) ) ( not ( = ?auto_701344 ?auto_701358 ) ) ( not ( = ?auto_701345 ?auto_701346 ) ) ( not ( = ?auto_701345 ?auto_701347 ) ) ( not ( = ?auto_701345 ?auto_701348 ) ) ( not ( = ?auto_701345 ?auto_701349 ) ) ( not ( = ?auto_701345 ?auto_701350 ) ) ( not ( = ?auto_701345 ?auto_701351 ) ) ( not ( = ?auto_701345 ?auto_701352 ) ) ( not ( = ?auto_701345 ?auto_701353 ) ) ( not ( = ?auto_701345 ?auto_701354 ) ) ( not ( = ?auto_701345 ?auto_701355 ) ) ( not ( = ?auto_701345 ?auto_701356 ) ) ( not ( = ?auto_701345 ?auto_701357 ) ) ( not ( = ?auto_701345 ?auto_701358 ) ) ( not ( = ?auto_701346 ?auto_701347 ) ) ( not ( = ?auto_701346 ?auto_701348 ) ) ( not ( = ?auto_701346 ?auto_701349 ) ) ( not ( = ?auto_701346 ?auto_701350 ) ) ( not ( = ?auto_701346 ?auto_701351 ) ) ( not ( = ?auto_701346 ?auto_701352 ) ) ( not ( = ?auto_701346 ?auto_701353 ) ) ( not ( = ?auto_701346 ?auto_701354 ) ) ( not ( = ?auto_701346 ?auto_701355 ) ) ( not ( = ?auto_701346 ?auto_701356 ) ) ( not ( = ?auto_701346 ?auto_701357 ) ) ( not ( = ?auto_701346 ?auto_701358 ) ) ( not ( = ?auto_701347 ?auto_701348 ) ) ( not ( = ?auto_701347 ?auto_701349 ) ) ( not ( = ?auto_701347 ?auto_701350 ) ) ( not ( = ?auto_701347 ?auto_701351 ) ) ( not ( = ?auto_701347 ?auto_701352 ) ) ( not ( = ?auto_701347 ?auto_701353 ) ) ( not ( = ?auto_701347 ?auto_701354 ) ) ( not ( = ?auto_701347 ?auto_701355 ) ) ( not ( = ?auto_701347 ?auto_701356 ) ) ( not ( = ?auto_701347 ?auto_701357 ) ) ( not ( = ?auto_701347 ?auto_701358 ) ) ( not ( = ?auto_701348 ?auto_701349 ) ) ( not ( = ?auto_701348 ?auto_701350 ) ) ( not ( = ?auto_701348 ?auto_701351 ) ) ( not ( = ?auto_701348 ?auto_701352 ) ) ( not ( = ?auto_701348 ?auto_701353 ) ) ( not ( = ?auto_701348 ?auto_701354 ) ) ( not ( = ?auto_701348 ?auto_701355 ) ) ( not ( = ?auto_701348 ?auto_701356 ) ) ( not ( = ?auto_701348 ?auto_701357 ) ) ( not ( = ?auto_701348 ?auto_701358 ) ) ( not ( = ?auto_701349 ?auto_701350 ) ) ( not ( = ?auto_701349 ?auto_701351 ) ) ( not ( = ?auto_701349 ?auto_701352 ) ) ( not ( = ?auto_701349 ?auto_701353 ) ) ( not ( = ?auto_701349 ?auto_701354 ) ) ( not ( = ?auto_701349 ?auto_701355 ) ) ( not ( = ?auto_701349 ?auto_701356 ) ) ( not ( = ?auto_701349 ?auto_701357 ) ) ( not ( = ?auto_701349 ?auto_701358 ) ) ( not ( = ?auto_701350 ?auto_701351 ) ) ( not ( = ?auto_701350 ?auto_701352 ) ) ( not ( = ?auto_701350 ?auto_701353 ) ) ( not ( = ?auto_701350 ?auto_701354 ) ) ( not ( = ?auto_701350 ?auto_701355 ) ) ( not ( = ?auto_701350 ?auto_701356 ) ) ( not ( = ?auto_701350 ?auto_701357 ) ) ( not ( = ?auto_701350 ?auto_701358 ) ) ( not ( = ?auto_701351 ?auto_701352 ) ) ( not ( = ?auto_701351 ?auto_701353 ) ) ( not ( = ?auto_701351 ?auto_701354 ) ) ( not ( = ?auto_701351 ?auto_701355 ) ) ( not ( = ?auto_701351 ?auto_701356 ) ) ( not ( = ?auto_701351 ?auto_701357 ) ) ( not ( = ?auto_701351 ?auto_701358 ) ) ( not ( = ?auto_701352 ?auto_701353 ) ) ( not ( = ?auto_701352 ?auto_701354 ) ) ( not ( = ?auto_701352 ?auto_701355 ) ) ( not ( = ?auto_701352 ?auto_701356 ) ) ( not ( = ?auto_701352 ?auto_701357 ) ) ( not ( = ?auto_701352 ?auto_701358 ) ) ( not ( = ?auto_701353 ?auto_701354 ) ) ( not ( = ?auto_701353 ?auto_701355 ) ) ( not ( = ?auto_701353 ?auto_701356 ) ) ( not ( = ?auto_701353 ?auto_701357 ) ) ( not ( = ?auto_701353 ?auto_701358 ) ) ( not ( = ?auto_701354 ?auto_701355 ) ) ( not ( = ?auto_701354 ?auto_701356 ) ) ( not ( = ?auto_701354 ?auto_701357 ) ) ( not ( = ?auto_701354 ?auto_701358 ) ) ( not ( = ?auto_701355 ?auto_701356 ) ) ( not ( = ?auto_701355 ?auto_701357 ) ) ( not ( = ?auto_701355 ?auto_701358 ) ) ( not ( = ?auto_701356 ?auto_701357 ) ) ( not ( = ?auto_701356 ?auto_701358 ) ) ( not ( = ?auto_701357 ?auto_701358 ) ) ( ON ?auto_701357 ?auto_701358 ) ( CLEAR ?auto_701355 ) ( ON ?auto_701356 ?auto_701357 ) ( CLEAR ?auto_701356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_701342 ?auto_701343 ?auto_701344 ?auto_701345 ?auto_701346 ?auto_701347 ?auto_701348 ?auto_701349 ?auto_701350 ?auto_701351 ?auto_701352 ?auto_701353 ?auto_701354 ?auto_701355 ?auto_701356 )
      ( MAKE-17PILE ?auto_701342 ?auto_701343 ?auto_701344 ?auto_701345 ?auto_701346 ?auto_701347 ?auto_701348 ?auto_701349 ?auto_701350 ?auto_701351 ?auto_701352 ?auto_701353 ?auto_701354 ?auto_701355 ?auto_701356 ?auto_701357 ?auto_701358 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701376 - BLOCK
      ?auto_701377 - BLOCK
      ?auto_701378 - BLOCK
      ?auto_701379 - BLOCK
      ?auto_701380 - BLOCK
      ?auto_701381 - BLOCK
      ?auto_701382 - BLOCK
      ?auto_701383 - BLOCK
      ?auto_701384 - BLOCK
      ?auto_701385 - BLOCK
      ?auto_701386 - BLOCK
      ?auto_701387 - BLOCK
      ?auto_701388 - BLOCK
      ?auto_701389 - BLOCK
      ?auto_701390 - BLOCK
      ?auto_701391 - BLOCK
      ?auto_701392 - BLOCK
    )
    :vars
    (
      ?auto_701393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701392 ?auto_701393 ) ( ON-TABLE ?auto_701376 ) ( ON ?auto_701377 ?auto_701376 ) ( ON ?auto_701378 ?auto_701377 ) ( ON ?auto_701379 ?auto_701378 ) ( ON ?auto_701380 ?auto_701379 ) ( ON ?auto_701381 ?auto_701380 ) ( ON ?auto_701382 ?auto_701381 ) ( ON ?auto_701383 ?auto_701382 ) ( ON ?auto_701384 ?auto_701383 ) ( ON ?auto_701385 ?auto_701384 ) ( ON ?auto_701386 ?auto_701385 ) ( ON ?auto_701387 ?auto_701386 ) ( ON ?auto_701388 ?auto_701387 ) ( not ( = ?auto_701376 ?auto_701377 ) ) ( not ( = ?auto_701376 ?auto_701378 ) ) ( not ( = ?auto_701376 ?auto_701379 ) ) ( not ( = ?auto_701376 ?auto_701380 ) ) ( not ( = ?auto_701376 ?auto_701381 ) ) ( not ( = ?auto_701376 ?auto_701382 ) ) ( not ( = ?auto_701376 ?auto_701383 ) ) ( not ( = ?auto_701376 ?auto_701384 ) ) ( not ( = ?auto_701376 ?auto_701385 ) ) ( not ( = ?auto_701376 ?auto_701386 ) ) ( not ( = ?auto_701376 ?auto_701387 ) ) ( not ( = ?auto_701376 ?auto_701388 ) ) ( not ( = ?auto_701376 ?auto_701389 ) ) ( not ( = ?auto_701376 ?auto_701390 ) ) ( not ( = ?auto_701376 ?auto_701391 ) ) ( not ( = ?auto_701376 ?auto_701392 ) ) ( not ( = ?auto_701376 ?auto_701393 ) ) ( not ( = ?auto_701377 ?auto_701378 ) ) ( not ( = ?auto_701377 ?auto_701379 ) ) ( not ( = ?auto_701377 ?auto_701380 ) ) ( not ( = ?auto_701377 ?auto_701381 ) ) ( not ( = ?auto_701377 ?auto_701382 ) ) ( not ( = ?auto_701377 ?auto_701383 ) ) ( not ( = ?auto_701377 ?auto_701384 ) ) ( not ( = ?auto_701377 ?auto_701385 ) ) ( not ( = ?auto_701377 ?auto_701386 ) ) ( not ( = ?auto_701377 ?auto_701387 ) ) ( not ( = ?auto_701377 ?auto_701388 ) ) ( not ( = ?auto_701377 ?auto_701389 ) ) ( not ( = ?auto_701377 ?auto_701390 ) ) ( not ( = ?auto_701377 ?auto_701391 ) ) ( not ( = ?auto_701377 ?auto_701392 ) ) ( not ( = ?auto_701377 ?auto_701393 ) ) ( not ( = ?auto_701378 ?auto_701379 ) ) ( not ( = ?auto_701378 ?auto_701380 ) ) ( not ( = ?auto_701378 ?auto_701381 ) ) ( not ( = ?auto_701378 ?auto_701382 ) ) ( not ( = ?auto_701378 ?auto_701383 ) ) ( not ( = ?auto_701378 ?auto_701384 ) ) ( not ( = ?auto_701378 ?auto_701385 ) ) ( not ( = ?auto_701378 ?auto_701386 ) ) ( not ( = ?auto_701378 ?auto_701387 ) ) ( not ( = ?auto_701378 ?auto_701388 ) ) ( not ( = ?auto_701378 ?auto_701389 ) ) ( not ( = ?auto_701378 ?auto_701390 ) ) ( not ( = ?auto_701378 ?auto_701391 ) ) ( not ( = ?auto_701378 ?auto_701392 ) ) ( not ( = ?auto_701378 ?auto_701393 ) ) ( not ( = ?auto_701379 ?auto_701380 ) ) ( not ( = ?auto_701379 ?auto_701381 ) ) ( not ( = ?auto_701379 ?auto_701382 ) ) ( not ( = ?auto_701379 ?auto_701383 ) ) ( not ( = ?auto_701379 ?auto_701384 ) ) ( not ( = ?auto_701379 ?auto_701385 ) ) ( not ( = ?auto_701379 ?auto_701386 ) ) ( not ( = ?auto_701379 ?auto_701387 ) ) ( not ( = ?auto_701379 ?auto_701388 ) ) ( not ( = ?auto_701379 ?auto_701389 ) ) ( not ( = ?auto_701379 ?auto_701390 ) ) ( not ( = ?auto_701379 ?auto_701391 ) ) ( not ( = ?auto_701379 ?auto_701392 ) ) ( not ( = ?auto_701379 ?auto_701393 ) ) ( not ( = ?auto_701380 ?auto_701381 ) ) ( not ( = ?auto_701380 ?auto_701382 ) ) ( not ( = ?auto_701380 ?auto_701383 ) ) ( not ( = ?auto_701380 ?auto_701384 ) ) ( not ( = ?auto_701380 ?auto_701385 ) ) ( not ( = ?auto_701380 ?auto_701386 ) ) ( not ( = ?auto_701380 ?auto_701387 ) ) ( not ( = ?auto_701380 ?auto_701388 ) ) ( not ( = ?auto_701380 ?auto_701389 ) ) ( not ( = ?auto_701380 ?auto_701390 ) ) ( not ( = ?auto_701380 ?auto_701391 ) ) ( not ( = ?auto_701380 ?auto_701392 ) ) ( not ( = ?auto_701380 ?auto_701393 ) ) ( not ( = ?auto_701381 ?auto_701382 ) ) ( not ( = ?auto_701381 ?auto_701383 ) ) ( not ( = ?auto_701381 ?auto_701384 ) ) ( not ( = ?auto_701381 ?auto_701385 ) ) ( not ( = ?auto_701381 ?auto_701386 ) ) ( not ( = ?auto_701381 ?auto_701387 ) ) ( not ( = ?auto_701381 ?auto_701388 ) ) ( not ( = ?auto_701381 ?auto_701389 ) ) ( not ( = ?auto_701381 ?auto_701390 ) ) ( not ( = ?auto_701381 ?auto_701391 ) ) ( not ( = ?auto_701381 ?auto_701392 ) ) ( not ( = ?auto_701381 ?auto_701393 ) ) ( not ( = ?auto_701382 ?auto_701383 ) ) ( not ( = ?auto_701382 ?auto_701384 ) ) ( not ( = ?auto_701382 ?auto_701385 ) ) ( not ( = ?auto_701382 ?auto_701386 ) ) ( not ( = ?auto_701382 ?auto_701387 ) ) ( not ( = ?auto_701382 ?auto_701388 ) ) ( not ( = ?auto_701382 ?auto_701389 ) ) ( not ( = ?auto_701382 ?auto_701390 ) ) ( not ( = ?auto_701382 ?auto_701391 ) ) ( not ( = ?auto_701382 ?auto_701392 ) ) ( not ( = ?auto_701382 ?auto_701393 ) ) ( not ( = ?auto_701383 ?auto_701384 ) ) ( not ( = ?auto_701383 ?auto_701385 ) ) ( not ( = ?auto_701383 ?auto_701386 ) ) ( not ( = ?auto_701383 ?auto_701387 ) ) ( not ( = ?auto_701383 ?auto_701388 ) ) ( not ( = ?auto_701383 ?auto_701389 ) ) ( not ( = ?auto_701383 ?auto_701390 ) ) ( not ( = ?auto_701383 ?auto_701391 ) ) ( not ( = ?auto_701383 ?auto_701392 ) ) ( not ( = ?auto_701383 ?auto_701393 ) ) ( not ( = ?auto_701384 ?auto_701385 ) ) ( not ( = ?auto_701384 ?auto_701386 ) ) ( not ( = ?auto_701384 ?auto_701387 ) ) ( not ( = ?auto_701384 ?auto_701388 ) ) ( not ( = ?auto_701384 ?auto_701389 ) ) ( not ( = ?auto_701384 ?auto_701390 ) ) ( not ( = ?auto_701384 ?auto_701391 ) ) ( not ( = ?auto_701384 ?auto_701392 ) ) ( not ( = ?auto_701384 ?auto_701393 ) ) ( not ( = ?auto_701385 ?auto_701386 ) ) ( not ( = ?auto_701385 ?auto_701387 ) ) ( not ( = ?auto_701385 ?auto_701388 ) ) ( not ( = ?auto_701385 ?auto_701389 ) ) ( not ( = ?auto_701385 ?auto_701390 ) ) ( not ( = ?auto_701385 ?auto_701391 ) ) ( not ( = ?auto_701385 ?auto_701392 ) ) ( not ( = ?auto_701385 ?auto_701393 ) ) ( not ( = ?auto_701386 ?auto_701387 ) ) ( not ( = ?auto_701386 ?auto_701388 ) ) ( not ( = ?auto_701386 ?auto_701389 ) ) ( not ( = ?auto_701386 ?auto_701390 ) ) ( not ( = ?auto_701386 ?auto_701391 ) ) ( not ( = ?auto_701386 ?auto_701392 ) ) ( not ( = ?auto_701386 ?auto_701393 ) ) ( not ( = ?auto_701387 ?auto_701388 ) ) ( not ( = ?auto_701387 ?auto_701389 ) ) ( not ( = ?auto_701387 ?auto_701390 ) ) ( not ( = ?auto_701387 ?auto_701391 ) ) ( not ( = ?auto_701387 ?auto_701392 ) ) ( not ( = ?auto_701387 ?auto_701393 ) ) ( not ( = ?auto_701388 ?auto_701389 ) ) ( not ( = ?auto_701388 ?auto_701390 ) ) ( not ( = ?auto_701388 ?auto_701391 ) ) ( not ( = ?auto_701388 ?auto_701392 ) ) ( not ( = ?auto_701388 ?auto_701393 ) ) ( not ( = ?auto_701389 ?auto_701390 ) ) ( not ( = ?auto_701389 ?auto_701391 ) ) ( not ( = ?auto_701389 ?auto_701392 ) ) ( not ( = ?auto_701389 ?auto_701393 ) ) ( not ( = ?auto_701390 ?auto_701391 ) ) ( not ( = ?auto_701390 ?auto_701392 ) ) ( not ( = ?auto_701390 ?auto_701393 ) ) ( not ( = ?auto_701391 ?auto_701392 ) ) ( not ( = ?auto_701391 ?auto_701393 ) ) ( not ( = ?auto_701392 ?auto_701393 ) ) ( ON ?auto_701391 ?auto_701392 ) ( ON ?auto_701390 ?auto_701391 ) ( CLEAR ?auto_701388 ) ( ON ?auto_701389 ?auto_701390 ) ( CLEAR ?auto_701389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_701376 ?auto_701377 ?auto_701378 ?auto_701379 ?auto_701380 ?auto_701381 ?auto_701382 ?auto_701383 ?auto_701384 ?auto_701385 ?auto_701386 ?auto_701387 ?auto_701388 ?auto_701389 )
      ( MAKE-17PILE ?auto_701376 ?auto_701377 ?auto_701378 ?auto_701379 ?auto_701380 ?auto_701381 ?auto_701382 ?auto_701383 ?auto_701384 ?auto_701385 ?auto_701386 ?auto_701387 ?auto_701388 ?auto_701389 ?auto_701390 ?auto_701391 ?auto_701392 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701411 - BLOCK
      ?auto_701412 - BLOCK
      ?auto_701413 - BLOCK
      ?auto_701414 - BLOCK
      ?auto_701415 - BLOCK
      ?auto_701416 - BLOCK
      ?auto_701417 - BLOCK
      ?auto_701418 - BLOCK
      ?auto_701419 - BLOCK
      ?auto_701420 - BLOCK
      ?auto_701421 - BLOCK
      ?auto_701422 - BLOCK
      ?auto_701423 - BLOCK
      ?auto_701424 - BLOCK
      ?auto_701425 - BLOCK
      ?auto_701426 - BLOCK
      ?auto_701427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_701427 ) ( ON-TABLE ?auto_701411 ) ( ON ?auto_701412 ?auto_701411 ) ( ON ?auto_701413 ?auto_701412 ) ( ON ?auto_701414 ?auto_701413 ) ( ON ?auto_701415 ?auto_701414 ) ( ON ?auto_701416 ?auto_701415 ) ( ON ?auto_701417 ?auto_701416 ) ( ON ?auto_701418 ?auto_701417 ) ( ON ?auto_701419 ?auto_701418 ) ( ON ?auto_701420 ?auto_701419 ) ( ON ?auto_701421 ?auto_701420 ) ( ON ?auto_701422 ?auto_701421 ) ( ON ?auto_701423 ?auto_701422 ) ( not ( = ?auto_701411 ?auto_701412 ) ) ( not ( = ?auto_701411 ?auto_701413 ) ) ( not ( = ?auto_701411 ?auto_701414 ) ) ( not ( = ?auto_701411 ?auto_701415 ) ) ( not ( = ?auto_701411 ?auto_701416 ) ) ( not ( = ?auto_701411 ?auto_701417 ) ) ( not ( = ?auto_701411 ?auto_701418 ) ) ( not ( = ?auto_701411 ?auto_701419 ) ) ( not ( = ?auto_701411 ?auto_701420 ) ) ( not ( = ?auto_701411 ?auto_701421 ) ) ( not ( = ?auto_701411 ?auto_701422 ) ) ( not ( = ?auto_701411 ?auto_701423 ) ) ( not ( = ?auto_701411 ?auto_701424 ) ) ( not ( = ?auto_701411 ?auto_701425 ) ) ( not ( = ?auto_701411 ?auto_701426 ) ) ( not ( = ?auto_701411 ?auto_701427 ) ) ( not ( = ?auto_701412 ?auto_701413 ) ) ( not ( = ?auto_701412 ?auto_701414 ) ) ( not ( = ?auto_701412 ?auto_701415 ) ) ( not ( = ?auto_701412 ?auto_701416 ) ) ( not ( = ?auto_701412 ?auto_701417 ) ) ( not ( = ?auto_701412 ?auto_701418 ) ) ( not ( = ?auto_701412 ?auto_701419 ) ) ( not ( = ?auto_701412 ?auto_701420 ) ) ( not ( = ?auto_701412 ?auto_701421 ) ) ( not ( = ?auto_701412 ?auto_701422 ) ) ( not ( = ?auto_701412 ?auto_701423 ) ) ( not ( = ?auto_701412 ?auto_701424 ) ) ( not ( = ?auto_701412 ?auto_701425 ) ) ( not ( = ?auto_701412 ?auto_701426 ) ) ( not ( = ?auto_701412 ?auto_701427 ) ) ( not ( = ?auto_701413 ?auto_701414 ) ) ( not ( = ?auto_701413 ?auto_701415 ) ) ( not ( = ?auto_701413 ?auto_701416 ) ) ( not ( = ?auto_701413 ?auto_701417 ) ) ( not ( = ?auto_701413 ?auto_701418 ) ) ( not ( = ?auto_701413 ?auto_701419 ) ) ( not ( = ?auto_701413 ?auto_701420 ) ) ( not ( = ?auto_701413 ?auto_701421 ) ) ( not ( = ?auto_701413 ?auto_701422 ) ) ( not ( = ?auto_701413 ?auto_701423 ) ) ( not ( = ?auto_701413 ?auto_701424 ) ) ( not ( = ?auto_701413 ?auto_701425 ) ) ( not ( = ?auto_701413 ?auto_701426 ) ) ( not ( = ?auto_701413 ?auto_701427 ) ) ( not ( = ?auto_701414 ?auto_701415 ) ) ( not ( = ?auto_701414 ?auto_701416 ) ) ( not ( = ?auto_701414 ?auto_701417 ) ) ( not ( = ?auto_701414 ?auto_701418 ) ) ( not ( = ?auto_701414 ?auto_701419 ) ) ( not ( = ?auto_701414 ?auto_701420 ) ) ( not ( = ?auto_701414 ?auto_701421 ) ) ( not ( = ?auto_701414 ?auto_701422 ) ) ( not ( = ?auto_701414 ?auto_701423 ) ) ( not ( = ?auto_701414 ?auto_701424 ) ) ( not ( = ?auto_701414 ?auto_701425 ) ) ( not ( = ?auto_701414 ?auto_701426 ) ) ( not ( = ?auto_701414 ?auto_701427 ) ) ( not ( = ?auto_701415 ?auto_701416 ) ) ( not ( = ?auto_701415 ?auto_701417 ) ) ( not ( = ?auto_701415 ?auto_701418 ) ) ( not ( = ?auto_701415 ?auto_701419 ) ) ( not ( = ?auto_701415 ?auto_701420 ) ) ( not ( = ?auto_701415 ?auto_701421 ) ) ( not ( = ?auto_701415 ?auto_701422 ) ) ( not ( = ?auto_701415 ?auto_701423 ) ) ( not ( = ?auto_701415 ?auto_701424 ) ) ( not ( = ?auto_701415 ?auto_701425 ) ) ( not ( = ?auto_701415 ?auto_701426 ) ) ( not ( = ?auto_701415 ?auto_701427 ) ) ( not ( = ?auto_701416 ?auto_701417 ) ) ( not ( = ?auto_701416 ?auto_701418 ) ) ( not ( = ?auto_701416 ?auto_701419 ) ) ( not ( = ?auto_701416 ?auto_701420 ) ) ( not ( = ?auto_701416 ?auto_701421 ) ) ( not ( = ?auto_701416 ?auto_701422 ) ) ( not ( = ?auto_701416 ?auto_701423 ) ) ( not ( = ?auto_701416 ?auto_701424 ) ) ( not ( = ?auto_701416 ?auto_701425 ) ) ( not ( = ?auto_701416 ?auto_701426 ) ) ( not ( = ?auto_701416 ?auto_701427 ) ) ( not ( = ?auto_701417 ?auto_701418 ) ) ( not ( = ?auto_701417 ?auto_701419 ) ) ( not ( = ?auto_701417 ?auto_701420 ) ) ( not ( = ?auto_701417 ?auto_701421 ) ) ( not ( = ?auto_701417 ?auto_701422 ) ) ( not ( = ?auto_701417 ?auto_701423 ) ) ( not ( = ?auto_701417 ?auto_701424 ) ) ( not ( = ?auto_701417 ?auto_701425 ) ) ( not ( = ?auto_701417 ?auto_701426 ) ) ( not ( = ?auto_701417 ?auto_701427 ) ) ( not ( = ?auto_701418 ?auto_701419 ) ) ( not ( = ?auto_701418 ?auto_701420 ) ) ( not ( = ?auto_701418 ?auto_701421 ) ) ( not ( = ?auto_701418 ?auto_701422 ) ) ( not ( = ?auto_701418 ?auto_701423 ) ) ( not ( = ?auto_701418 ?auto_701424 ) ) ( not ( = ?auto_701418 ?auto_701425 ) ) ( not ( = ?auto_701418 ?auto_701426 ) ) ( not ( = ?auto_701418 ?auto_701427 ) ) ( not ( = ?auto_701419 ?auto_701420 ) ) ( not ( = ?auto_701419 ?auto_701421 ) ) ( not ( = ?auto_701419 ?auto_701422 ) ) ( not ( = ?auto_701419 ?auto_701423 ) ) ( not ( = ?auto_701419 ?auto_701424 ) ) ( not ( = ?auto_701419 ?auto_701425 ) ) ( not ( = ?auto_701419 ?auto_701426 ) ) ( not ( = ?auto_701419 ?auto_701427 ) ) ( not ( = ?auto_701420 ?auto_701421 ) ) ( not ( = ?auto_701420 ?auto_701422 ) ) ( not ( = ?auto_701420 ?auto_701423 ) ) ( not ( = ?auto_701420 ?auto_701424 ) ) ( not ( = ?auto_701420 ?auto_701425 ) ) ( not ( = ?auto_701420 ?auto_701426 ) ) ( not ( = ?auto_701420 ?auto_701427 ) ) ( not ( = ?auto_701421 ?auto_701422 ) ) ( not ( = ?auto_701421 ?auto_701423 ) ) ( not ( = ?auto_701421 ?auto_701424 ) ) ( not ( = ?auto_701421 ?auto_701425 ) ) ( not ( = ?auto_701421 ?auto_701426 ) ) ( not ( = ?auto_701421 ?auto_701427 ) ) ( not ( = ?auto_701422 ?auto_701423 ) ) ( not ( = ?auto_701422 ?auto_701424 ) ) ( not ( = ?auto_701422 ?auto_701425 ) ) ( not ( = ?auto_701422 ?auto_701426 ) ) ( not ( = ?auto_701422 ?auto_701427 ) ) ( not ( = ?auto_701423 ?auto_701424 ) ) ( not ( = ?auto_701423 ?auto_701425 ) ) ( not ( = ?auto_701423 ?auto_701426 ) ) ( not ( = ?auto_701423 ?auto_701427 ) ) ( not ( = ?auto_701424 ?auto_701425 ) ) ( not ( = ?auto_701424 ?auto_701426 ) ) ( not ( = ?auto_701424 ?auto_701427 ) ) ( not ( = ?auto_701425 ?auto_701426 ) ) ( not ( = ?auto_701425 ?auto_701427 ) ) ( not ( = ?auto_701426 ?auto_701427 ) ) ( ON ?auto_701426 ?auto_701427 ) ( ON ?auto_701425 ?auto_701426 ) ( CLEAR ?auto_701423 ) ( ON ?auto_701424 ?auto_701425 ) ( CLEAR ?auto_701424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_701411 ?auto_701412 ?auto_701413 ?auto_701414 ?auto_701415 ?auto_701416 ?auto_701417 ?auto_701418 ?auto_701419 ?auto_701420 ?auto_701421 ?auto_701422 ?auto_701423 ?auto_701424 )
      ( MAKE-17PILE ?auto_701411 ?auto_701412 ?auto_701413 ?auto_701414 ?auto_701415 ?auto_701416 ?auto_701417 ?auto_701418 ?auto_701419 ?auto_701420 ?auto_701421 ?auto_701422 ?auto_701423 ?auto_701424 ?auto_701425 ?auto_701426 ?auto_701427 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701445 - BLOCK
      ?auto_701446 - BLOCK
      ?auto_701447 - BLOCK
      ?auto_701448 - BLOCK
      ?auto_701449 - BLOCK
      ?auto_701450 - BLOCK
      ?auto_701451 - BLOCK
      ?auto_701452 - BLOCK
      ?auto_701453 - BLOCK
      ?auto_701454 - BLOCK
      ?auto_701455 - BLOCK
      ?auto_701456 - BLOCK
      ?auto_701457 - BLOCK
      ?auto_701458 - BLOCK
      ?auto_701459 - BLOCK
      ?auto_701460 - BLOCK
      ?auto_701461 - BLOCK
    )
    :vars
    (
      ?auto_701462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701461 ?auto_701462 ) ( ON-TABLE ?auto_701445 ) ( ON ?auto_701446 ?auto_701445 ) ( ON ?auto_701447 ?auto_701446 ) ( ON ?auto_701448 ?auto_701447 ) ( ON ?auto_701449 ?auto_701448 ) ( ON ?auto_701450 ?auto_701449 ) ( ON ?auto_701451 ?auto_701450 ) ( ON ?auto_701452 ?auto_701451 ) ( ON ?auto_701453 ?auto_701452 ) ( ON ?auto_701454 ?auto_701453 ) ( ON ?auto_701455 ?auto_701454 ) ( ON ?auto_701456 ?auto_701455 ) ( not ( = ?auto_701445 ?auto_701446 ) ) ( not ( = ?auto_701445 ?auto_701447 ) ) ( not ( = ?auto_701445 ?auto_701448 ) ) ( not ( = ?auto_701445 ?auto_701449 ) ) ( not ( = ?auto_701445 ?auto_701450 ) ) ( not ( = ?auto_701445 ?auto_701451 ) ) ( not ( = ?auto_701445 ?auto_701452 ) ) ( not ( = ?auto_701445 ?auto_701453 ) ) ( not ( = ?auto_701445 ?auto_701454 ) ) ( not ( = ?auto_701445 ?auto_701455 ) ) ( not ( = ?auto_701445 ?auto_701456 ) ) ( not ( = ?auto_701445 ?auto_701457 ) ) ( not ( = ?auto_701445 ?auto_701458 ) ) ( not ( = ?auto_701445 ?auto_701459 ) ) ( not ( = ?auto_701445 ?auto_701460 ) ) ( not ( = ?auto_701445 ?auto_701461 ) ) ( not ( = ?auto_701445 ?auto_701462 ) ) ( not ( = ?auto_701446 ?auto_701447 ) ) ( not ( = ?auto_701446 ?auto_701448 ) ) ( not ( = ?auto_701446 ?auto_701449 ) ) ( not ( = ?auto_701446 ?auto_701450 ) ) ( not ( = ?auto_701446 ?auto_701451 ) ) ( not ( = ?auto_701446 ?auto_701452 ) ) ( not ( = ?auto_701446 ?auto_701453 ) ) ( not ( = ?auto_701446 ?auto_701454 ) ) ( not ( = ?auto_701446 ?auto_701455 ) ) ( not ( = ?auto_701446 ?auto_701456 ) ) ( not ( = ?auto_701446 ?auto_701457 ) ) ( not ( = ?auto_701446 ?auto_701458 ) ) ( not ( = ?auto_701446 ?auto_701459 ) ) ( not ( = ?auto_701446 ?auto_701460 ) ) ( not ( = ?auto_701446 ?auto_701461 ) ) ( not ( = ?auto_701446 ?auto_701462 ) ) ( not ( = ?auto_701447 ?auto_701448 ) ) ( not ( = ?auto_701447 ?auto_701449 ) ) ( not ( = ?auto_701447 ?auto_701450 ) ) ( not ( = ?auto_701447 ?auto_701451 ) ) ( not ( = ?auto_701447 ?auto_701452 ) ) ( not ( = ?auto_701447 ?auto_701453 ) ) ( not ( = ?auto_701447 ?auto_701454 ) ) ( not ( = ?auto_701447 ?auto_701455 ) ) ( not ( = ?auto_701447 ?auto_701456 ) ) ( not ( = ?auto_701447 ?auto_701457 ) ) ( not ( = ?auto_701447 ?auto_701458 ) ) ( not ( = ?auto_701447 ?auto_701459 ) ) ( not ( = ?auto_701447 ?auto_701460 ) ) ( not ( = ?auto_701447 ?auto_701461 ) ) ( not ( = ?auto_701447 ?auto_701462 ) ) ( not ( = ?auto_701448 ?auto_701449 ) ) ( not ( = ?auto_701448 ?auto_701450 ) ) ( not ( = ?auto_701448 ?auto_701451 ) ) ( not ( = ?auto_701448 ?auto_701452 ) ) ( not ( = ?auto_701448 ?auto_701453 ) ) ( not ( = ?auto_701448 ?auto_701454 ) ) ( not ( = ?auto_701448 ?auto_701455 ) ) ( not ( = ?auto_701448 ?auto_701456 ) ) ( not ( = ?auto_701448 ?auto_701457 ) ) ( not ( = ?auto_701448 ?auto_701458 ) ) ( not ( = ?auto_701448 ?auto_701459 ) ) ( not ( = ?auto_701448 ?auto_701460 ) ) ( not ( = ?auto_701448 ?auto_701461 ) ) ( not ( = ?auto_701448 ?auto_701462 ) ) ( not ( = ?auto_701449 ?auto_701450 ) ) ( not ( = ?auto_701449 ?auto_701451 ) ) ( not ( = ?auto_701449 ?auto_701452 ) ) ( not ( = ?auto_701449 ?auto_701453 ) ) ( not ( = ?auto_701449 ?auto_701454 ) ) ( not ( = ?auto_701449 ?auto_701455 ) ) ( not ( = ?auto_701449 ?auto_701456 ) ) ( not ( = ?auto_701449 ?auto_701457 ) ) ( not ( = ?auto_701449 ?auto_701458 ) ) ( not ( = ?auto_701449 ?auto_701459 ) ) ( not ( = ?auto_701449 ?auto_701460 ) ) ( not ( = ?auto_701449 ?auto_701461 ) ) ( not ( = ?auto_701449 ?auto_701462 ) ) ( not ( = ?auto_701450 ?auto_701451 ) ) ( not ( = ?auto_701450 ?auto_701452 ) ) ( not ( = ?auto_701450 ?auto_701453 ) ) ( not ( = ?auto_701450 ?auto_701454 ) ) ( not ( = ?auto_701450 ?auto_701455 ) ) ( not ( = ?auto_701450 ?auto_701456 ) ) ( not ( = ?auto_701450 ?auto_701457 ) ) ( not ( = ?auto_701450 ?auto_701458 ) ) ( not ( = ?auto_701450 ?auto_701459 ) ) ( not ( = ?auto_701450 ?auto_701460 ) ) ( not ( = ?auto_701450 ?auto_701461 ) ) ( not ( = ?auto_701450 ?auto_701462 ) ) ( not ( = ?auto_701451 ?auto_701452 ) ) ( not ( = ?auto_701451 ?auto_701453 ) ) ( not ( = ?auto_701451 ?auto_701454 ) ) ( not ( = ?auto_701451 ?auto_701455 ) ) ( not ( = ?auto_701451 ?auto_701456 ) ) ( not ( = ?auto_701451 ?auto_701457 ) ) ( not ( = ?auto_701451 ?auto_701458 ) ) ( not ( = ?auto_701451 ?auto_701459 ) ) ( not ( = ?auto_701451 ?auto_701460 ) ) ( not ( = ?auto_701451 ?auto_701461 ) ) ( not ( = ?auto_701451 ?auto_701462 ) ) ( not ( = ?auto_701452 ?auto_701453 ) ) ( not ( = ?auto_701452 ?auto_701454 ) ) ( not ( = ?auto_701452 ?auto_701455 ) ) ( not ( = ?auto_701452 ?auto_701456 ) ) ( not ( = ?auto_701452 ?auto_701457 ) ) ( not ( = ?auto_701452 ?auto_701458 ) ) ( not ( = ?auto_701452 ?auto_701459 ) ) ( not ( = ?auto_701452 ?auto_701460 ) ) ( not ( = ?auto_701452 ?auto_701461 ) ) ( not ( = ?auto_701452 ?auto_701462 ) ) ( not ( = ?auto_701453 ?auto_701454 ) ) ( not ( = ?auto_701453 ?auto_701455 ) ) ( not ( = ?auto_701453 ?auto_701456 ) ) ( not ( = ?auto_701453 ?auto_701457 ) ) ( not ( = ?auto_701453 ?auto_701458 ) ) ( not ( = ?auto_701453 ?auto_701459 ) ) ( not ( = ?auto_701453 ?auto_701460 ) ) ( not ( = ?auto_701453 ?auto_701461 ) ) ( not ( = ?auto_701453 ?auto_701462 ) ) ( not ( = ?auto_701454 ?auto_701455 ) ) ( not ( = ?auto_701454 ?auto_701456 ) ) ( not ( = ?auto_701454 ?auto_701457 ) ) ( not ( = ?auto_701454 ?auto_701458 ) ) ( not ( = ?auto_701454 ?auto_701459 ) ) ( not ( = ?auto_701454 ?auto_701460 ) ) ( not ( = ?auto_701454 ?auto_701461 ) ) ( not ( = ?auto_701454 ?auto_701462 ) ) ( not ( = ?auto_701455 ?auto_701456 ) ) ( not ( = ?auto_701455 ?auto_701457 ) ) ( not ( = ?auto_701455 ?auto_701458 ) ) ( not ( = ?auto_701455 ?auto_701459 ) ) ( not ( = ?auto_701455 ?auto_701460 ) ) ( not ( = ?auto_701455 ?auto_701461 ) ) ( not ( = ?auto_701455 ?auto_701462 ) ) ( not ( = ?auto_701456 ?auto_701457 ) ) ( not ( = ?auto_701456 ?auto_701458 ) ) ( not ( = ?auto_701456 ?auto_701459 ) ) ( not ( = ?auto_701456 ?auto_701460 ) ) ( not ( = ?auto_701456 ?auto_701461 ) ) ( not ( = ?auto_701456 ?auto_701462 ) ) ( not ( = ?auto_701457 ?auto_701458 ) ) ( not ( = ?auto_701457 ?auto_701459 ) ) ( not ( = ?auto_701457 ?auto_701460 ) ) ( not ( = ?auto_701457 ?auto_701461 ) ) ( not ( = ?auto_701457 ?auto_701462 ) ) ( not ( = ?auto_701458 ?auto_701459 ) ) ( not ( = ?auto_701458 ?auto_701460 ) ) ( not ( = ?auto_701458 ?auto_701461 ) ) ( not ( = ?auto_701458 ?auto_701462 ) ) ( not ( = ?auto_701459 ?auto_701460 ) ) ( not ( = ?auto_701459 ?auto_701461 ) ) ( not ( = ?auto_701459 ?auto_701462 ) ) ( not ( = ?auto_701460 ?auto_701461 ) ) ( not ( = ?auto_701460 ?auto_701462 ) ) ( not ( = ?auto_701461 ?auto_701462 ) ) ( ON ?auto_701460 ?auto_701461 ) ( ON ?auto_701459 ?auto_701460 ) ( ON ?auto_701458 ?auto_701459 ) ( CLEAR ?auto_701456 ) ( ON ?auto_701457 ?auto_701458 ) ( CLEAR ?auto_701457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_701445 ?auto_701446 ?auto_701447 ?auto_701448 ?auto_701449 ?auto_701450 ?auto_701451 ?auto_701452 ?auto_701453 ?auto_701454 ?auto_701455 ?auto_701456 ?auto_701457 )
      ( MAKE-17PILE ?auto_701445 ?auto_701446 ?auto_701447 ?auto_701448 ?auto_701449 ?auto_701450 ?auto_701451 ?auto_701452 ?auto_701453 ?auto_701454 ?auto_701455 ?auto_701456 ?auto_701457 ?auto_701458 ?auto_701459 ?auto_701460 ?auto_701461 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701480 - BLOCK
      ?auto_701481 - BLOCK
      ?auto_701482 - BLOCK
      ?auto_701483 - BLOCK
      ?auto_701484 - BLOCK
      ?auto_701485 - BLOCK
      ?auto_701486 - BLOCK
      ?auto_701487 - BLOCK
      ?auto_701488 - BLOCK
      ?auto_701489 - BLOCK
      ?auto_701490 - BLOCK
      ?auto_701491 - BLOCK
      ?auto_701492 - BLOCK
      ?auto_701493 - BLOCK
      ?auto_701494 - BLOCK
      ?auto_701495 - BLOCK
      ?auto_701496 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_701496 ) ( ON-TABLE ?auto_701480 ) ( ON ?auto_701481 ?auto_701480 ) ( ON ?auto_701482 ?auto_701481 ) ( ON ?auto_701483 ?auto_701482 ) ( ON ?auto_701484 ?auto_701483 ) ( ON ?auto_701485 ?auto_701484 ) ( ON ?auto_701486 ?auto_701485 ) ( ON ?auto_701487 ?auto_701486 ) ( ON ?auto_701488 ?auto_701487 ) ( ON ?auto_701489 ?auto_701488 ) ( ON ?auto_701490 ?auto_701489 ) ( ON ?auto_701491 ?auto_701490 ) ( not ( = ?auto_701480 ?auto_701481 ) ) ( not ( = ?auto_701480 ?auto_701482 ) ) ( not ( = ?auto_701480 ?auto_701483 ) ) ( not ( = ?auto_701480 ?auto_701484 ) ) ( not ( = ?auto_701480 ?auto_701485 ) ) ( not ( = ?auto_701480 ?auto_701486 ) ) ( not ( = ?auto_701480 ?auto_701487 ) ) ( not ( = ?auto_701480 ?auto_701488 ) ) ( not ( = ?auto_701480 ?auto_701489 ) ) ( not ( = ?auto_701480 ?auto_701490 ) ) ( not ( = ?auto_701480 ?auto_701491 ) ) ( not ( = ?auto_701480 ?auto_701492 ) ) ( not ( = ?auto_701480 ?auto_701493 ) ) ( not ( = ?auto_701480 ?auto_701494 ) ) ( not ( = ?auto_701480 ?auto_701495 ) ) ( not ( = ?auto_701480 ?auto_701496 ) ) ( not ( = ?auto_701481 ?auto_701482 ) ) ( not ( = ?auto_701481 ?auto_701483 ) ) ( not ( = ?auto_701481 ?auto_701484 ) ) ( not ( = ?auto_701481 ?auto_701485 ) ) ( not ( = ?auto_701481 ?auto_701486 ) ) ( not ( = ?auto_701481 ?auto_701487 ) ) ( not ( = ?auto_701481 ?auto_701488 ) ) ( not ( = ?auto_701481 ?auto_701489 ) ) ( not ( = ?auto_701481 ?auto_701490 ) ) ( not ( = ?auto_701481 ?auto_701491 ) ) ( not ( = ?auto_701481 ?auto_701492 ) ) ( not ( = ?auto_701481 ?auto_701493 ) ) ( not ( = ?auto_701481 ?auto_701494 ) ) ( not ( = ?auto_701481 ?auto_701495 ) ) ( not ( = ?auto_701481 ?auto_701496 ) ) ( not ( = ?auto_701482 ?auto_701483 ) ) ( not ( = ?auto_701482 ?auto_701484 ) ) ( not ( = ?auto_701482 ?auto_701485 ) ) ( not ( = ?auto_701482 ?auto_701486 ) ) ( not ( = ?auto_701482 ?auto_701487 ) ) ( not ( = ?auto_701482 ?auto_701488 ) ) ( not ( = ?auto_701482 ?auto_701489 ) ) ( not ( = ?auto_701482 ?auto_701490 ) ) ( not ( = ?auto_701482 ?auto_701491 ) ) ( not ( = ?auto_701482 ?auto_701492 ) ) ( not ( = ?auto_701482 ?auto_701493 ) ) ( not ( = ?auto_701482 ?auto_701494 ) ) ( not ( = ?auto_701482 ?auto_701495 ) ) ( not ( = ?auto_701482 ?auto_701496 ) ) ( not ( = ?auto_701483 ?auto_701484 ) ) ( not ( = ?auto_701483 ?auto_701485 ) ) ( not ( = ?auto_701483 ?auto_701486 ) ) ( not ( = ?auto_701483 ?auto_701487 ) ) ( not ( = ?auto_701483 ?auto_701488 ) ) ( not ( = ?auto_701483 ?auto_701489 ) ) ( not ( = ?auto_701483 ?auto_701490 ) ) ( not ( = ?auto_701483 ?auto_701491 ) ) ( not ( = ?auto_701483 ?auto_701492 ) ) ( not ( = ?auto_701483 ?auto_701493 ) ) ( not ( = ?auto_701483 ?auto_701494 ) ) ( not ( = ?auto_701483 ?auto_701495 ) ) ( not ( = ?auto_701483 ?auto_701496 ) ) ( not ( = ?auto_701484 ?auto_701485 ) ) ( not ( = ?auto_701484 ?auto_701486 ) ) ( not ( = ?auto_701484 ?auto_701487 ) ) ( not ( = ?auto_701484 ?auto_701488 ) ) ( not ( = ?auto_701484 ?auto_701489 ) ) ( not ( = ?auto_701484 ?auto_701490 ) ) ( not ( = ?auto_701484 ?auto_701491 ) ) ( not ( = ?auto_701484 ?auto_701492 ) ) ( not ( = ?auto_701484 ?auto_701493 ) ) ( not ( = ?auto_701484 ?auto_701494 ) ) ( not ( = ?auto_701484 ?auto_701495 ) ) ( not ( = ?auto_701484 ?auto_701496 ) ) ( not ( = ?auto_701485 ?auto_701486 ) ) ( not ( = ?auto_701485 ?auto_701487 ) ) ( not ( = ?auto_701485 ?auto_701488 ) ) ( not ( = ?auto_701485 ?auto_701489 ) ) ( not ( = ?auto_701485 ?auto_701490 ) ) ( not ( = ?auto_701485 ?auto_701491 ) ) ( not ( = ?auto_701485 ?auto_701492 ) ) ( not ( = ?auto_701485 ?auto_701493 ) ) ( not ( = ?auto_701485 ?auto_701494 ) ) ( not ( = ?auto_701485 ?auto_701495 ) ) ( not ( = ?auto_701485 ?auto_701496 ) ) ( not ( = ?auto_701486 ?auto_701487 ) ) ( not ( = ?auto_701486 ?auto_701488 ) ) ( not ( = ?auto_701486 ?auto_701489 ) ) ( not ( = ?auto_701486 ?auto_701490 ) ) ( not ( = ?auto_701486 ?auto_701491 ) ) ( not ( = ?auto_701486 ?auto_701492 ) ) ( not ( = ?auto_701486 ?auto_701493 ) ) ( not ( = ?auto_701486 ?auto_701494 ) ) ( not ( = ?auto_701486 ?auto_701495 ) ) ( not ( = ?auto_701486 ?auto_701496 ) ) ( not ( = ?auto_701487 ?auto_701488 ) ) ( not ( = ?auto_701487 ?auto_701489 ) ) ( not ( = ?auto_701487 ?auto_701490 ) ) ( not ( = ?auto_701487 ?auto_701491 ) ) ( not ( = ?auto_701487 ?auto_701492 ) ) ( not ( = ?auto_701487 ?auto_701493 ) ) ( not ( = ?auto_701487 ?auto_701494 ) ) ( not ( = ?auto_701487 ?auto_701495 ) ) ( not ( = ?auto_701487 ?auto_701496 ) ) ( not ( = ?auto_701488 ?auto_701489 ) ) ( not ( = ?auto_701488 ?auto_701490 ) ) ( not ( = ?auto_701488 ?auto_701491 ) ) ( not ( = ?auto_701488 ?auto_701492 ) ) ( not ( = ?auto_701488 ?auto_701493 ) ) ( not ( = ?auto_701488 ?auto_701494 ) ) ( not ( = ?auto_701488 ?auto_701495 ) ) ( not ( = ?auto_701488 ?auto_701496 ) ) ( not ( = ?auto_701489 ?auto_701490 ) ) ( not ( = ?auto_701489 ?auto_701491 ) ) ( not ( = ?auto_701489 ?auto_701492 ) ) ( not ( = ?auto_701489 ?auto_701493 ) ) ( not ( = ?auto_701489 ?auto_701494 ) ) ( not ( = ?auto_701489 ?auto_701495 ) ) ( not ( = ?auto_701489 ?auto_701496 ) ) ( not ( = ?auto_701490 ?auto_701491 ) ) ( not ( = ?auto_701490 ?auto_701492 ) ) ( not ( = ?auto_701490 ?auto_701493 ) ) ( not ( = ?auto_701490 ?auto_701494 ) ) ( not ( = ?auto_701490 ?auto_701495 ) ) ( not ( = ?auto_701490 ?auto_701496 ) ) ( not ( = ?auto_701491 ?auto_701492 ) ) ( not ( = ?auto_701491 ?auto_701493 ) ) ( not ( = ?auto_701491 ?auto_701494 ) ) ( not ( = ?auto_701491 ?auto_701495 ) ) ( not ( = ?auto_701491 ?auto_701496 ) ) ( not ( = ?auto_701492 ?auto_701493 ) ) ( not ( = ?auto_701492 ?auto_701494 ) ) ( not ( = ?auto_701492 ?auto_701495 ) ) ( not ( = ?auto_701492 ?auto_701496 ) ) ( not ( = ?auto_701493 ?auto_701494 ) ) ( not ( = ?auto_701493 ?auto_701495 ) ) ( not ( = ?auto_701493 ?auto_701496 ) ) ( not ( = ?auto_701494 ?auto_701495 ) ) ( not ( = ?auto_701494 ?auto_701496 ) ) ( not ( = ?auto_701495 ?auto_701496 ) ) ( ON ?auto_701495 ?auto_701496 ) ( ON ?auto_701494 ?auto_701495 ) ( ON ?auto_701493 ?auto_701494 ) ( CLEAR ?auto_701491 ) ( ON ?auto_701492 ?auto_701493 ) ( CLEAR ?auto_701492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_701480 ?auto_701481 ?auto_701482 ?auto_701483 ?auto_701484 ?auto_701485 ?auto_701486 ?auto_701487 ?auto_701488 ?auto_701489 ?auto_701490 ?auto_701491 ?auto_701492 )
      ( MAKE-17PILE ?auto_701480 ?auto_701481 ?auto_701482 ?auto_701483 ?auto_701484 ?auto_701485 ?auto_701486 ?auto_701487 ?auto_701488 ?auto_701489 ?auto_701490 ?auto_701491 ?auto_701492 ?auto_701493 ?auto_701494 ?auto_701495 ?auto_701496 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701514 - BLOCK
      ?auto_701515 - BLOCK
      ?auto_701516 - BLOCK
      ?auto_701517 - BLOCK
      ?auto_701518 - BLOCK
      ?auto_701519 - BLOCK
      ?auto_701520 - BLOCK
      ?auto_701521 - BLOCK
      ?auto_701522 - BLOCK
      ?auto_701523 - BLOCK
      ?auto_701524 - BLOCK
      ?auto_701525 - BLOCK
      ?auto_701526 - BLOCK
      ?auto_701527 - BLOCK
      ?auto_701528 - BLOCK
      ?auto_701529 - BLOCK
      ?auto_701530 - BLOCK
    )
    :vars
    (
      ?auto_701531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701530 ?auto_701531 ) ( ON-TABLE ?auto_701514 ) ( ON ?auto_701515 ?auto_701514 ) ( ON ?auto_701516 ?auto_701515 ) ( ON ?auto_701517 ?auto_701516 ) ( ON ?auto_701518 ?auto_701517 ) ( ON ?auto_701519 ?auto_701518 ) ( ON ?auto_701520 ?auto_701519 ) ( ON ?auto_701521 ?auto_701520 ) ( ON ?auto_701522 ?auto_701521 ) ( ON ?auto_701523 ?auto_701522 ) ( ON ?auto_701524 ?auto_701523 ) ( not ( = ?auto_701514 ?auto_701515 ) ) ( not ( = ?auto_701514 ?auto_701516 ) ) ( not ( = ?auto_701514 ?auto_701517 ) ) ( not ( = ?auto_701514 ?auto_701518 ) ) ( not ( = ?auto_701514 ?auto_701519 ) ) ( not ( = ?auto_701514 ?auto_701520 ) ) ( not ( = ?auto_701514 ?auto_701521 ) ) ( not ( = ?auto_701514 ?auto_701522 ) ) ( not ( = ?auto_701514 ?auto_701523 ) ) ( not ( = ?auto_701514 ?auto_701524 ) ) ( not ( = ?auto_701514 ?auto_701525 ) ) ( not ( = ?auto_701514 ?auto_701526 ) ) ( not ( = ?auto_701514 ?auto_701527 ) ) ( not ( = ?auto_701514 ?auto_701528 ) ) ( not ( = ?auto_701514 ?auto_701529 ) ) ( not ( = ?auto_701514 ?auto_701530 ) ) ( not ( = ?auto_701514 ?auto_701531 ) ) ( not ( = ?auto_701515 ?auto_701516 ) ) ( not ( = ?auto_701515 ?auto_701517 ) ) ( not ( = ?auto_701515 ?auto_701518 ) ) ( not ( = ?auto_701515 ?auto_701519 ) ) ( not ( = ?auto_701515 ?auto_701520 ) ) ( not ( = ?auto_701515 ?auto_701521 ) ) ( not ( = ?auto_701515 ?auto_701522 ) ) ( not ( = ?auto_701515 ?auto_701523 ) ) ( not ( = ?auto_701515 ?auto_701524 ) ) ( not ( = ?auto_701515 ?auto_701525 ) ) ( not ( = ?auto_701515 ?auto_701526 ) ) ( not ( = ?auto_701515 ?auto_701527 ) ) ( not ( = ?auto_701515 ?auto_701528 ) ) ( not ( = ?auto_701515 ?auto_701529 ) ) ( not ( = ?auto_701515 ?auto_701530 ) ) ( not ( = ?auto_701515 ?auto_701531 ) ) ( not ( = ?auto_701516 ?auto_701517 ) ) ( not ( = ?auto_701516 ?auto_701518 ) ) ( not ( = ?auto_701516 ?auto_701519 ) ) ( not ( = ?auto_701516 ?auto_701520 ) ) ( not ( = ?auto_701516 ?auto_701521 ) ) ( not ( = ?auto_701516 ?auto_701522 ) ) ( not ( = ?auto_701516 ?auto_701523 ) ) ( not ( = ?auto_701516 ?auto_701524 ) ) ( not ( = ?auto_701516 ?auto_701525 ) ) ( not ( = ?auto_701516 ?auto_701526 ) ) ( not ( = ?auto_701516 ?auto_701527 ) ) ( not ( = ?auto_701516 ?auto_701528 ) ) ( not ( = ?auto_701516 ?auto_701529 ) ) ( not ( = ?auto_701516 ?auto_701530 ) ) ( not ( = ?auto_701516 ?auto_701531 ) ) ( not ( = ?auto_701517 ?auto_701518 ) ) ( not ( = ?auto_701517 ?auto_701519 ) ) ( not ( = ?auto_701517 ?auto_701520 ) ) ( not ( = ?auto_701517 ?auto_701521 ) ) ( not ( = ?auto_701517 ?auto_701522 ) ) ( not ( = ?auto_701517 ?auto_701523 ) ) ( not ( = ?auto_701517 ?auto_701524 ) ) ( not ( = ?auto_701517 ?auto_701525 ) ) ( not ( = ?auto_701517 ?auto_701526 ) ) ( not ( = ?auto_701517 ?auto_701527 ) ) ( not ( = ?auto_701517 ?auto_701528 ) ) ( not ( = ?auto_701517 ?auto_701529 ) ) ( not ( = ?auto_701517 ?auto_701530 ) ) ( not ( = ?auto_701517 ?auto_701531 ) ) ( not ( = ?auto_701518 ?auto_701519 ) ) ( not ( = ?auto_701518 ?auto_701520 ) ) ( not ( = ?auto_701518 ?auto_701521 ) ) ( not ( = ?auto_701518 ?auto_701522 ) ) ( not ( = ?auto_701518 ?auto_701523 ) ) ( not ( = ?auto_701518 ?auto_701524 ) ) ( not ( = ?auto_701518 ?auto_701525 ) ) ( not ( = ?auto_701518 ?auto_701526 ) ) ( not ( = ?auto_701518 ?auto_701527 ) ) ( not ( = ?auto_701518 ?auto_701528 ) ) ( not ( = ?auto_701518 ?auto_701529 ) ) ( not ( = ?auto_701518 ?auto_701530 ) ) ( not ( = ?auto_701518 ?auto_701531 ) ) ( not ( = ?auto_701519 ?auto_701520 ) ) ( not ( = ?auto_701519 ?auto_701521 ) ) ( not ( = ?auto_701519 ?auto_701522 ) ) ( not ( = ?auto_701519 ?auto_701523 ) ) ( not ( = ?auto_701519 ?auto_701524 ) ) ( not ( = ?auto_701519 ?auto_701525 ) ) ( not ( = ?auto_701519 ?auto_701526 ) ) ( not ( = ?auto_701519 ?auto_701527 ) ) ( not ( = ?auto_701519 ?auto_701528 ) ) ( not ( = ?auto_701519 ?auto_701529 ) ) ( not ( = ?auto_701519 ?auto_701530 ) ) ( not ( = ?auto_701519 ?auto_701531 ) ) ( not ( = ?auto_701520 ?auto_701521 ) ) ( not ( = ?auto_701520 ?auto_701522 ) ) ( not ( = ?auto_701520 ?auto_701523 ) ) ( not ( = ?auto_701520 ?auto_701524 ) ) ( not ( = ?auto_701520 ?auto_701525 ) ) ( not ( = ?auto_701520 ?auto_701526 ) ) ( not ( = ?auto_701520 ?auto_701527 ) ) ( not ( = ?auto_701520 ?auto_701528 ) ) ( not ( = ?auto_701520 ?auto_701529 ) ) ( not ( = ?auto_701520 ?auto_701530 ) ) ( not ( = ?auto_701520 ?auto_701531 ) ) ( not ( = ?auto_701521 ?auto_701522 ) ) ( not ( = ?auto_701521 ?auto_701523 ) ) ( not ( = ?auto_701521 ?auto_701524 ) ) ( not ( = ?auto_701521 ?auto_701525 ) ) ( not ( = ?auto_701521 ?auto_701526 ) ) ( not ( = ?auto_701521 ?auto_701527 ) ) ( not ( = ?auto_701521 ?auto_701528 ) ) ( not ( = ?auto_701521 ?auto_701529 ) ) ( not ( = ?auto_701521 ?auto_701530 ) ) ( not ( = ?auto_701521 ?auto_701531 ) ) ( not ( = ?auto_701522 ?auto_701523 ) ) ( not ( = ?auto_701522 ?auto_701524 ) ) ( not ( = ?auto_701522 ?auto_701525 ) ) ( not ( = ?auto_701522 ?auto_701526 ) ) ( not ( = ?auto_701522 ?auto_701527 ) ) ( not ( = ?auto_701522 ?auto_701528 ) ) ( not ( = ?auto_701522 ?auto_701529 ) ) ( not ( = ?auto_701522 ?auto_701530 ) ) ( not ( = ?auto_701522 ?auto_701531 ) ) ( not ( = ?auto_701523 ?auto_701524 ) ) ( not ( = ?auto_701523 ?auto_701525 ) ) ( not ( = ?auto_701523 ?auto_701526 ) ) ( not ( = ?auto_701523 ?auto_701527 ) ) ( not ( = ?auto_701523 ?auto_701528 ) ) ( not ( = ?auto_701523 ?auto_701529 ) ) ( not ( = ?auto_701523 ?auto_701530 ) ) ( not ( = ?auto_701523 ?auto_701531 ) ) ( not ( = ?auto_701524 ?auto_701525 ) ) ( not ( = ?auto_701524 ?auto_701526 ) ) ( not ( = ?auto_701524 ?auto_701527 ) ) ( not ( = ?auto_701524 ?auto_701528 ) ) ( not ( = ?auto_701524 ?auto_701529 ) ) ( not ( = ?auto_701524 ?auto_701530 ) ) ( not ( = ?auto_701524 ?auto_701531 ) ) ( not ( = ?auto_701525 ?auto_701526 ) ) ( not ( = ?auto_701525 ?auto_701527 ) ) ( not ( = ?auto_701525 ?auto_701528 ) ) ( not ( = ?auto_701525 ?auto_701529 ) ) ( not ( = ?auto_701525 ?auto_701530 ) ) ( not ( = ?auto_701525 ?auto_701531 ) ) ( not ( = ?auto_701526 ?auto_701527 ) ) ( not ( = ?auto_701526 ?auto_701528 ) ) ( not ( = ?auto_701526 ?auto_701529 ) ) ( not ( = ?auto_701526 ?auto_701530 ) ) ( not ( = ?auto_701526 ?auto_701531 ) ) ( not ( = ?auto_701527 ?auto_701528 ) ) ( not ( = ?auto_701527 ?auto_701529 ) ) ( not ( = ?auto_701527 ?auto_701530 ) ) ( not ( = ?auto_701527 ?auto_701531 ) ) ( not ( = ?auto_701528 ?auto_701529 ) ) ( not ( = ?auto_701528 ?auto_701530 ) ) ( not ( = ?auto_701528 ?auto_701531 ) ) ( not ( = ?auto_701529 ?auto_701530 ) ) ( not ( = ?auto_701529 ?auto_701531 ) ) ( not ( = ?auto_701530 ?auto_701531 ) ) ( ON ?auto_701529 ?auto_701530 ) ( ON ?auto_701528 ?auto_701529 ) ( ON ?auto_701527 ?auto_701528 ) ( ON ?auto_701526 ?auto_701527 ) ( CLEAR ?auto_701524 ) ( ON ?auto_701525 ?auto_701526 ) ( CLEAR ?auto_701525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_701514 ?auto_701515 ?auto_701516 ?auto_701517 ?auto_701518 ?auto_701519 ?auto_701520 ?auto_701521 ?auto_701522 ?auto_701523 ?auto_701524 ?auto_701525 )
      ( MAKE-17PILE ?auto_701514 ?auto_701515 ?auto_701516 ?auto_701517 ?auto_701518 ?auto_701519 ?auto_701520 ?auto_701521 ?auto_701522 ?auto_701523 ?auto_701524 ?auto_701525 ?auto_701526 ?auto_701527 ?auto_701528 ?auto_701529 ?auto_701530 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701549 - BLOCK
      ?auto_701550 - BLOCK
      ?auto_701551 - BLOCK
      ?auto_701552 - BLOCK
      ?auto_701553 - BLOCK
      ?auto_701554 - BLOCK
      ?auto_701555 - BLOCK
      ?auto_701556 - BLOCK
      ?auto_701557 - BLOCK
      ?auto_701558 - BLOCK
      ?auto_701559 - BLOCK
      ?auto_701560 - BLOCK
      ?auto_701561 - BLOCK
      ?auto_701562 - BLOCK
      ?auto_701563 - BLOCK
      ?auto_701564 - BLOCK
      ?auto_701565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_701565 ) ( ON-TABLE ?auto_701549 ) ( ON ?auto_701550 ?auto_701549 ) ( ON ?auto_701551 ?auto_701550 ) ( ON ?auto_701552 ?auto_701551 ) ( ON ?auto_701553 ?auto_701552 ) ( ON ?auto_701554 ?auto_701553 ) ( ON ?auto_701555 ?auto_701554 ) ( ON ?auto_701556 ?auto_701555 ) ( ON ?auto_701557 ?auto_701556 ) ( ON ?auto_701558 ?auto_701557 ) ( ON ?auto_701559 ?auto_701558 ) ( not ( = ?auto_701549 ?auto_701550 ) ) ( not ( = ?auto_701549 ?auto_701551 ) ) ( not ( = ?auto_701549 ?auto_701552 ) ) ( not ( = ?auto_701549 ?auto_701553 ) ) ( not ( = ?auto_701549 ?auto_701554 ) ) ( not ( = ?auto_701549 ?auto_701555 ) ) ( not ( = ?auto_701549 ?auto_701556 ) ) ( not ( = ?auto_701549 ?auto_701557 ) ) ( not ( = ?auto_701549 ?auto_701558 ) ) ( not ( = ?auto_701549 ?auto_701559 ) ) ( not ( = ?auto_701549 ?auto_701560 ) ) ( not ( = ?auto_701549 ?auto_701561 ) ) ( not ( = ?auto_701549 ?auto_701562 ) ) ( not ( = ?auto_701549 ?auto_701563 ) ) ( not ( = ?auto_701549 ?auto_701564 ) ) ( not ( = ?auto_701549 ?auto_701565 ) ) ( not ( = ?auto_701550 ?auto_701551 ) ) ( not ( = ?auto_701550 ?auto_701552 ) ) ( not ( = ?auto_701550 ?auto_701553 ) ) ( not ( = ?auto_701550 ?auto_701554 ) ) ( not ( = ?auto_701550 ?auto_701555 ) ) ( not ( = ?auto_701550 ?auto_701556 ) ) ( not ( = ?auto_701550 ?auto_701557 ) ) ( not ( = ?auto_701550 ?auto_701558 ) ) ( not ( = ?auto_701550 ?auto_701559 ) ) ( not ( = ?auto_701550 ?auto_701560 ) ) ( not ( = ?auto_701550 ?auto_701561 ) ) ( not ( = ?auto_701550 ?auto_701562 ) ) ( not ( = ?auto_701550 ?auto_701563 ) ) ( not ( = ?auto_701550 ?auto_701564 ) ) ( not ( = ?auto_701550 ?auto_701565 ) ) ( not ( = ?auto_701551 ?auto_701552 ) ) ( not ( = ?auto_701551 ?auto_701553 ) ) ( not ( = ?auto_701551 ?auto_701554 ) ) ( not ( = ?auto_701551 ?auto_701555 ) ) ( not ( = ?auto_701551 ?auto_701556 ) ) ( not ( = ?auto_701551 ?auto_701557 ) ) ( not ( = ?auto_701551 ?auto_701558 ) ) ( not ( = ?auto_701551 ?auto_701559 ) ) ( not ( = ?auto_701551 ?auto_701560 ) ) ( not ( = ?auto_701551 ?auto_701561 ) ) ( not ( = ?auto_701551 ?auto_701562 ) ) ( not ( = ?auto_701551 ?auto_701563 ) ) ( not ( = ?auto_701551 ?auto_701564 ) ) ( not ( = ?auto_701551 ?auto_701565 ) ) ( not ( = ?auto_701552 ?auto_701553 ) ) ( not ( = ?auto_701552 ?auto_701554 ) ) ( not ( = ?auto_701552 ?auto_701555 ) ) ( not ( = ?auto_701552 ?auto_701556 ) ) ( not ( = ?auto_701552 ?auto_701557 ) ) ( not ( = ?auto_701552 ?auto_701558 ) ) ( not ( = ?auto_701552 ?auto_701559 ) ) ( not ( = ?auto_701552 ?auto_701560 ) ) ( not ( = ?auto_701552 ?auto_701561 ) ) ( not ( = ?auto_701552 ?auto_701562 ) ) ( not ( = ?auto_701552 ?auto_701563 ) ) ( not ( = ?auto_701552 ?auto_701564 ) ) ( not ( = ?auto_701552 ?auto_701565 ) ) ( not ( = ?auto_701553 ?auto_701554 ) ) ( not ( = ?auto_701553 ?auto_701555 ) ) ( not ( = ?auto_701553 ?auto_701556 ) ) ( not ( = ?auto_701553 ?auto_701557 ) ) ( not ( = ?auto_701553 ?auto_701558 ) ) ( not ( = ?auto_701553 ?auto_701559 ) ) ( not ( = ?auto_701553 ?auto_701560 ) ) ( not ( = ?auto_701553 ?auto_701561 ) ) ( not ( = ?auto_701553 ?auto_701562 ) ) ( not ( = ?auto_701553 ?auto_701563 ) ) ( not ( = ?auto_701553 ?auto_701564 ) ) ( not ( = ?auto_701553 ?auto_701565 ) ) ( not ( = ?auto_701554 ?auto_701555 ) ) ( not ( = ?auto_701554 ?auto_701556 ) ) ( not ( = ?auto_701554 ?auto_701557 ) ) ( not ( = ?auto_701554 ?auto_701558 ) ) ( not ( = ?auto_701554 ?auto_701559 ) ) ( not ( = ?auto_701554 ?auto_701560 ) ) ( not ( = ?auto_701554 ?auto_701561 ) ) ( not ( = ?auto_701554 ?auto_701562 ) ) ( not ( = ?auto_701554 ?auto_701563 ) ) ( not ( = ?auto_701554 ?auto_701564 ) ) ( not ( = ?auto_701554 ?auto_701565 ) ) ( not ( = ?auto_701555 ?auto_701556 ) ) ( not ( = ?auto_701555 ?auto_701557 ) ) ( not ( = ?auto_701555 ?auto_701558 ) ) ( not ( = ?auto_701555 ?auto_701559 ) ) ( not ( = ?auto_701555 ?auto_701560 ) ) ( not ( = ?auto_701555 ?auto_701561 ) ) ( not ( = ?auto_701555 ?auto_701562 ) ) ( not ( = ?auto_701555 ?auto_701563 ) ) ( not ( = ?auto_701555 ?auto_701564 ) ) ( not ( = ?auto_701555 ?auto_701565 ) ) ( not ( = ?auto_701556 ?auto_701557 ) ) ( not ( = ?auto_701556 ?auto_701558 ) ) ( not ( = ?auto_701556 ?auto_701559 ) ) ( not ( = ?auto_701556 ?auto_701560 ) ) ( not ( = ?auto_701556 ?auto_701561 ) ) ( not ( = ?auto_701556 ?auto_701562 ) ) ( not ( = ?auto_701556 ?auto_701563 ) ) ( not ( = ?auto_701556 ?auto_701564 ) ) ( not ( = ?auto_701556 ?auto_701565 ) ) ( not ( = ?auto_701557 ?auto_701558 ) ) ( not ( = ?auto_701557 ?auto_701559 ) ) ( not ( = ?auto_701557 ?auto_701560 ) ) ( not ( = ?auto_701557 ?auto_701561 ) ) ( not ( = ?auto_701557 ?auto_701562 ) ) ( not ( = ?auto_701557 ?auto_701563 ) ) ( not ( = ?auto_701557 ?auto_701564 ) ) ( not ( = ?auto_701557 ?auto_701565 ) ) ( not ( = ?auto_701558 ?auto_701559 ) ) ( not ( = ?auto_701558 ?auto_701560 ) ) ( not ( = ?auto_701558 ?auto_701561 ) ) ( not ( = ?auto_701558 ?auto_701562 ) ) ( not ( = ?auto_701558 ?auto_701563 ) ) ( not ( = ?auto_701558 ?auto_701564 ) ) ( not ( = ?auto_701558 ?auto_701565 ) ) ( not ( = ?auto_701559 ?auto_701560 ) ) ( not ( = ?auto_701559 ?auto_701561 ) ) ( not ( = ?auto_701559 ?auto_701562 ) ) ( not ( = ?auto_701559 ?auto_701563 ) ) ( not ( = ?auto_701559 ?auto_701564 ) ) ( not ( = ?auto_701559 ?auto_701565 ) ) ( not ( = ?auto_701560 ?auto_701561 ) ) ( not ( = ?auto_701560 ?auto_701562 ) ) ( not ( = ?auto_701560 ?auto_701563 ) ) ( not ( = ?auto_701560 ?auto_701564 ) ) ( not ( = ?auto_701560 ?auto_701565 ) ) ( not ( = ?auto_701561 ?auto_701562 ) ) ( not ( = ?auto_701561 ?auto_701563 ) ) ( not ( = ?auto_701561 ?auto_701564 ) ) ( not ( = ?auto_701561 ?auto_701565 ) ) ( not ( = ?auto_701562 ?auto_701563 ) ) ( not ( = ?auto_701562 ?auto_701564 ) ) ( not ( = ?auto_701562 ?auto_701565 ) ) ( not ( = ?auto_701563 ?auto_701564 ) ) ( not ( = ?auto_701563 ?auto_701565 ) ) ( not ( = ?auto_701564 ?auto_701565 ) ) ( ON ?auto_701564 ?auto_701565 ) ( ON ?auto_701563 ?auto_701564 ) ( ON ?auto_701562 ?auto_701563 ) ( ON ?auto_701561 ?auto_701562 ) ( CLEAR ?auto_701559 ) ( ON ?auto_701560 ?auto_701561 ) ( CLEAR ?auto_701560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_701549 ?auto_701550 ?auto_701551 ?auto_701552 ?auto_701553 ?auto_701554 ?auto_701555 ?auto_701556 ?auto_701557 ?auto_701558 ?auto_701559 ?auto_701560 )
      ( MAKE-17PILE ?auto_701549 ?auto_701550 ?auto_701551 ?auto_701552 ?auto_701553 ?auto_701554 ?auto_701555 ?auto_701556 ?auto_701557 ?auto_701558 ?auto_701559 ?auto_701560 ?auto_701561 ?auto_701562 ?auto_701563 ?auto_701564 ?auto_701565 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701583 - BLOCK
      ?auto_701584 - BLOCK
      ?auto_701585 - BLOCK
      ?auto_701586 - BLOCK
      ?auto_701587 - BLOCK
      ?auto_701588 - BLOCK
      ?auto_701589 - BLOCK
      ?auto_701590 - BLOCK
      ?auto_701591 - BLOCK
      ?auto_701592 - BLOCK
      ?auto_701593 - BLOCK
      ?auto_701594 - BLOCK
      ?auto_701595 - BLOCK
      ?auto_701596 - BLOCK
      ?auto_701597 - BLOCK
      ?auto_701598 - BLOCK
      ?auto_701599 - BLOCK
    )
    :vars
    (
      ?auto_701600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701599 ?auto_701600 ) ( ON-TABLE ?auto_701583 ) ( ON ?auto_701584 ?auto_701583 ) ( ON ?auto_701585 ?auto_701584 ) ( ON ?auto_701586 ?auto_701585 ) ( ON ?auto_701587 ?auto_701586 ) ( ON ?auto_701588 ?auto_701587 ) ( ON ?auto_701589 ?auto_701588 ) ( ON ?auto_701590 ?auto_701589 ) ( ON ?auto_701591 ?auto_701590 ) ( ON ?auto_701592 ?auto_701591 ) ( not ( = ?auto_701583 ?auto_701584 ) ) ( not ( = ?auto_701583 ?auto_701585 ) ) ( not ( = ?auto_701583 ?auto_701586 ) ) ( not ( = ?auto_701583 ?auto_701587 ) ) ( not ( = ?auto_701583 ?auto_701588 ) ) ( not ( = ?auto_701583 ?auto_701589 ) ) ( not ( = ?auto_701583 ?auto_701590 ) ) ( not ( = ?auto_701583 ?auto_701591 ) ) ( not ( = ?auto_701583 ?auto_701592 ) ) ( not ( = ?auto_701583 ?auto_701593 ) ) ( not ( = ?auto_701583 ?auto_701594 ) ) ( not ( = ?auto_701583 ?auto_701595 ) ) ( not ( = ?auto_701583 ?auto_701596 ) ) ( not ( = ?auto_701583 ?auto_701597 ) ) ( not ( = ?auto_701583 ?auto_701598 ) ) ( not ( = ?auto_701583 ?auto_701599 ) ) ( not ( = ?auto_701583 ?auto_701600 ) ) ( not ( = ?auto_701584 ?auto_701585 ) ) ( not ( = ?auto_701584 ?auto_701586 ) ) ( not ( = ?auto_701584 ?auto_701587 ) ) ( not ( = ?auto_701584 ?auto_701588 ) ) ( not ( = ?auto_701584 ?auto_701589 ) ) ( not ( = ?auto_701584 ?auto_701590 ) ) ( not ( = ?auto_701584 ?auto_701591 ) ) ( not ( = ?auto_701584 ?auto_701592 ) ) ( not ( = ?auto_701584 ?auto_701593 ) ) ( not ( = ?auto_701584 ?auto_701594 ) ) ( not ( = ?auto_701584 ?auto_701595 ) ) ( not ( = ?auto_701584 ?auto_701596 ) ) ( not ( = ?auto_701584 ?auto_701597 ) ) ( not ( = ?auto_701584 ?auto_701598 ) ) ( not ( = ?auto_701584 ?auto_701599 ) ) ( not ( = ?auto_701584 ?auto_701600 ) ) ( not ( = ?auto_701585 ?auto_701586 ) ) ( not ( = ?auto_701585 ?auto_701587 ) ) ( not ( = ?auto_701585 ?auto_701588 ) ) ( not ( = ?auto_701585 ?auto_701589 ) ) ( not ( = ?auto_701585 ?auto_701590 ) ) ( not ( = ?auto_701585 ?auto_701591 ) ) ( not ( = ?auto_701585 ?auto_701592 ) ) ( not ( = ?auto_701585 ?auto_701593 ) ) ( not ( = ?auto_701585 ?auto_701594 ) ) ( not ( = ?auto_701585 ?auto_701595 ) ) ( not ( = ?auto_701585 ?auto_701596 ) ) ( not ( = ?auto_701585 ?auto_701597 ) ) ( not ( = ?auto_701585 ?auto_701598 ) ) ( not ( = ?auto_701585 ?auto_701599 ) ) ( not ( = ?auto_701585 ?auto_701600 ) ) ( not ( = ?auto_701586 ?auto_701587 ) ) ( not ( = ?auto_701586 ?auto_701588 ) ) ( not ( = ?auto_701586 ?auto_701589 ) ) ( not ( = ?auto_701586 ?auto_701590 ) ) ( not ( = ?auto_701586 ?auto_701591 ) ) ( not ( = ?auto_701586 ?auto_701592 ) ) ( not ( = ?auto_701586 ?auto_701593 ) ) ( not ( = ?auto_701586 ?auto_701594 ) ) ( not ( = ?auto_701586 ?auto_701595 ) ) ( not ( = ?auto_701586 ?auto_701596 ) ) ( not ( = ?auto_701586 ?auto_701597 ) ) ( not ( = ?auto_701586 ?auto_701598 ) ) ( not ( = ?auto_701586 ?auto_701599 ) ) ( not ( = ?auto_701586 ?auto_701600 ) ) ( not ( = ?auto_701587 ?auto_701588 ) ) ( not ( = ?auto_701587 ?auto_701589 ) ) ( not ( = ?auto_701587 ?auto_701590 ) ) ( not ( = ?auto_701587 ?auto_701591 ) ) ( not ( = ?auto_701587 ?auto_701592 ) ) ( not ( = ?auto_701587 ?auto_701593 ) ) ( not ( = ?auto_701587 ?auto_701594 ) ) ( not ( = ?auto_701587 ?auto_701595 ) ) ( not ( = ?auto_701587 ?auto_701596 ) ) ( not ( = ?auto_701587 ?auto_701597 ) ) ( not ( = ?auto_701587 ?auto_701598 ) ) ( not ( = ?auto_701587 ?auto_701599 ) ) ( not ( = ?auto_701587 ?auto_701600 ) ) ( not ( = ?auto_701588 ?auto_701589 ) ) ( not ( = ?auto_701588 ?auto_701590 ) ) ( not ( = ?auto_701588 ?auto_701591 ) ) ( not ( = ?auto_701588 ?auto_701592 ) ) ( not ( = ?auto_701588 ?auto_701593 ) ) ( not ( = ?auto_701588 ?auto_701594 ) ) ( not ( = ?auto_701588 ?auto_701595 ) ) ( not ( = ?auto_701588 ?auto_701596 ) ) ( not ( = ?auto_701588 ?auto_701597 ) ) ( not ( = ?auto_701588 ?auto_701598 ) ) ( not ( = ?auto_701588 ?auto_701599 ) ) ( not ( = ?auto_701588 ?auto_701600 ) ) ( not ( = ?auto_701589 ?auto_701590 ) ) ( not ( = ?auto_701589 ?auto_701591 ) ) ( not ( = ?auto_701589 ?auto_701592 ) ) ( not ( = ?auto_701589 ?auto_701593 ) ) ( not ( = ?auto_701589 ?auto_701594 ) ) ( not ( = ?auto_701589 ?auto_701595 ) ) ( not ( = ?auto_701589 ?auto_701596 ) ) ( not ( = ?auto_701589 ?auto_701597 ) ) ( not ( = ?auto_701589 ?auto_701598 ) ) ( not ( = ?auto_701589 ?auto_701599 ) ) ( not ( = ?auto_701589 ?auto_701600 ) ) ( not ( = ?auto_701590 ?auto_701591 ) ) ( not ( = ?auto_701590 ?auto_701592 ) ) ( not ( = ?auto_701590 ?auto_701593 ) ) ( not ( = ?auto_701590 ?auto_701594 ) ) ( not ( = ?auto_701590 ?auto_701595 ) ) ( not ( = ?auto_701590 ?auto_701596 ) ) ( not ( = ?auto_701590 ?auto_701597 ) ) ( not ( = ?auto_701590 ?auto_701598 ) ) ( not ( = ?auto_701590 ?auto_701599 ) ) ( not ( = ?auto_701590 ?auto_701600 ) ) ( not ( = ?auto_701591 ?auto_701592 ) ) ( not ( = ?auto_701591 ?auto_701593 ) ) ( not ( = ?auto_701591 ?auto_701594 ) ) ( not ( = ?auto_701591 ?auto_701595 ) ) ( not ( = ?auto_701591 ?auto_701596 ) ) ( not ( = ?auto_701591 ?auto_701597 ) ) ( not ( = ?auto_701591 ?auto_701598 ) ) ( not ( = ?auto_701591 ?auto_701599 ) ) ( not ( = ?auto_701591 ?auto_701600 ) ) ( not ( = ?auto_701592 ?auto_701593 ) ) ( not ( = ?auto_701592 ?auto_701594 ) ) ( not ( = ?auto_701592 ?auto_701595 ) ) ( not ( = ?auto_701592 ?auto_701596 ) ) ( not ( = ?auto_701592 ?auto_701597 ) ) ( not ( = ?auto_701592 ?auto_701598 ) ) ( not ( = ?auto_701592 ?auto_701599 ) ) ( not ( = ?auto_701592 ?auto_701600 ) ) ( not ( = ?auto_701593 ?auto_701594 ) ) ( not ( = ?auto_701593 ?auto_701595 ) ) ( not ( = ?auto_701593 ?auto_701596 ) ) ( not ( = ?auto_701593 ?auto_701597 ) ) ( not ( = ?auto_701593 ?auto_701598 ) ) ( not ( = ?auto_701593 ?auto_701599 ) ) ( not ( = ?auto_701593 ?auto_701600 ) ) ( not ( = ?auto_701594 ?auto_701595 ) ) ( not ( = ?auto_701594 ?auto_701596 ) ) ( not ( = ?auto_701594 ?auto_701597 ) ) ( not ( = ?auto_701594 ?auto_701598 ) ) ( not ( = ?auto_701594 ?auto_701599 ) ) ( not ( = ?auto_701594 ?auto_701600 ) ) ( not ( = ?auto_701595 ?auto_701596 ) ) ( not ( = ?auto_701595 ?auto_701597 ) ) ( not ( = ?auto_701595 ?auto_701598 ) ) ( not ( = ?auto_701595 ?auto_701599 ) ) ( not ( = ?auto_701595 ?auto_701600 ) ) ( not ( = ?auto_701596 ?auto_701597 ) ) ( not ( = ?auto_701596 ?auto_701598 ) ) ( not ( = ?auto_701596 ?auto_701599 ) ) ( not ( = ?auto_701596 ?auto_701600 ) ) ( not ( = ?auto_701597 ?auto_701598 ) ) ( not ( = ?auto_701597 ?auto_701599 ) ) ( not ( = ?auto_701597 ?auto_701600 ) ) ( not ( = ?auto_701598 ?auto_701599 ) ) ( not ( = ?auto_701598 ?auto_701600 ) ) ( not ( = ?auto_701599 ?auto_701600 ) ) ( ON ?auto_701598 ?auto_701599 ) ( ON ?auto_701597 ?auto_701598 ) ( ON ?auto_701596 ?auto_701597 ) ( ON ?auto_701595 ?auto_701596 ) ( ON ?auto_701594 ?auto_701595 ) ( CLEAR ?auto_701592 ) ( ON ?auto_701593 ?auto_701594 ) ( CLEAR ?auto_701593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_701583 ?auto_701584 ?auto_701585 ?auto_701586 ?auto_701587 ?auto_701588 ?auto_701589 ?auto_701590 ?auto_701591 ?auto_701592 ?auto_701593 )
      ( MAKE-17PILE ?auto_701583 ?auto_701584 ?auto_701585 ?auto_701586 ?auto_701587 ?auto_701588 ?auto_701589 ?auto_701590 ?auto_701591 ?auto_701592 ?auto_701593 ?auto_701594 ?auto_701595 ?auto_701596 ?auto_701597 ?auto_701598 ?auto_701599 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701618 - BLOCK
      ?auto_701619 - BLOCK
      ?auto_701620 - BLOCK
      ?auto_701621 - BLOCK
      ?auto_701622 - BLOCK
      ?auto_701623 - BLOCK
      ?auto_701624 - BLOCK
      ?auto_701625 - BLOCK
      ?auto_701626 - BLOCK
      ?auto_701627 - BLOCK
      ?auto_701628 - BLOCK
      ?auto_701629 - BLOCK
      ?auto_701630 - BLOCK
      ?auto_701631 - BLOCK
      ?auto_701632 - BLOCK
      ?auto_701633 - BLOCK
      ?auto_701634 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_701634 ) ( ON-TABLE ?auto_701618 ) ( ON ?auto_701619 ?auto_701618 ) ( ON ?auto_701620 ?auto_701619 ) ( ON ?auto_701621 ?auto_701620 ) ( ON ?auto_701622 ?auto_701621 ) ( ON ?auto_701623 ?auto_701622 ) ( ON ?auto_701624 ?auto_701623 ) ( ON ?auto_701625 ?auto_701624 ) ( ON ?auto_701626 ?auto_701625 ) ( ON ?auto_701627 ?auto_701626 ) ( not ( = ?auto_701618 ?auto_701619 ) ) ( not ( = ?auto_701618 ?auto_701620 ) ) ( not ( = ?auto_701618 ?auto_701621 ) ) ( not ( = ?auto_701618 ?auto_701622 ) ) ( not ( = ?auto_701618 ?auto_701623 ) ) ( not ( = ?auto_701618 ?auto_701624 ) ) ( not ( = ?auto_701618 ?auto_701625 ) ) ( not ( = ?auto_701618 ?auto_701626 ) ) ( not ( = ?auto_701618 ?auto_701627 ) ) ( not ( = ?auto_701618 ?auto_701628 ) ) ( not ( = ?auto_701618 ?auto_701629 ) ) ( not ( = ?auto_701618 ?auto_701630 ) ) ( not ( = ?auto_701618 ?auto_701631 ) ) ( not ( = ?auto_701618 ?auto_701632 ) ) ( not ( = ?auto_701618 ?auto_701633 ) ) ( not ( = ?auto_701618 ?auto_701634 ) ) ( not ( = ?auto_701619 ?auto_701620 ) ) ( not ( = ?auto_701619 ?auto_701621 ) ) ( not ( = ?auto_701619 ?auto_701622 ) ) ( not ( = ?auto_701619 ?auto_701623 ) ) ( not ( = ?auto_701619 ?auto_701624 ) ) ( not ( = ?auto_701619 ?auto_701625 ) ) ( not ( = ?auto_701619 ?auto_701626 ) ) ( not ( = ?auto_701619 ?auto_701627 ) ) ( not ( = ?auto_701619 ?auto_701628 ) ) ( not ( = ?auto_701619 ?auto_701629 ) ) ( not ( = ?auto_701619 ?auto_701630 ) ) ( not ( = ?auto_701619 ?auto_701631 ) ) ( not ( = ?auto_701619 ?auto_701632 ) ) ( not ( = ?auto_701619 ?auto_701633 ) ) ( not ( = ?auto_701619 ?auto_701634 ) ) ( not ( = ?auto_701620 ?auto_701621 ) ) ( not ( = ?auto_701620 ?auto_701622 ) ) ( not ( = ?auto_701620 ?auto_701623 ) ) ( not ( = ?auto_701620 ?auto_701624 ) ) ( not ( = ?auto_701620 ?auto_701625 ) ) ( not ( = ?auto_701620 ?auto_701626 ) ) ( not ( = ?auto_701620 ?auto_701627 ) ) ( not ( = ?auto_701620 ?auto_701628 ) ) ( not ( = ?auto_701620 ?auto_701629 ) ) ( not ( = ?auto_701620 ?auto_701630 ) ) ( not ( = ?auto_701620 ?auto_701631 ) ) ( not ( = ?auto_701620 ?auto_701632 ) ) ( not ( = ?auto_701620 ?auto_701633 ) ) ( not ( = ?auto_701620 ?auto_701634 ) ) ( not ( = ?auto_701621 ?auto_701622 ) ) ( not ( = ?auto_701621 ?auto_701623 ) ) ( not ( = ?auto_701621 ?auto_701624 ) ) ( not ( = ?auto_701621 ?auto_701625 ) ) ( not ( = ?auto_701621 ?auto_701626 ) ) ( not ( = ?auto_701621 ?auto_701627 ) ) ( not ( = ?auto_701621 ?auto_701628 ) ) ( not ( = ?auto_701621 ?auto_701629 ) ) ( not ( = ?auto_701621 ?auto_701630 ) ) ( not ( = ?auto_701621 ?auto_701631 ) ) ( not ( = ?auto_701621 ?auto_701632 ) ) ( not ( = ?auto_701621 ?auto_701633 ) ) ( not ( = ?auto_701621 ?auto_701634 ) ) ( not ( = ?auto_701622 ?auto_701623 ) ) ( not ( = ?auto_701622 ?auto_701624 ) ) ( not ( = ?auto_701622 ?auto_701625 ) ) ( not ( = ?auto_701622 ?auto_701626 ) ) ( not ( = ?auto_701622 ?auto_701627 ) ) ( not ( = ?auto_701622 ?auto_701628 ) ) ( not ( = ?auto_701622 ?auto_701629 ) ) ( not ( = ?auto_701622 ?auto_701630 ) ) ( not ( = ?auto_701622 ?auto_701631 ) ) ( not ( = ?auto_701622 ?auto_701632 ) ) ( not ( = ?auto_701622 ?auto_701633 ) ) ( not ( = ?auto_701622 ?auto_701634 ) ) ( not ( = ?auto_701623 ?auto_701624 ) ) ( not ( = ?auto_701623 ?auto_701625 ) ) ( not ( = ?auto_701623 ?auto_701626 ) ) ( not ( = ?auto_701623 ?auto_701627 ) ) ( not ( = ?auto_701623 ?auto_701628 ) ) ( not ( = ?auto_701623 ?auto_701629 ) ) ( not ( = ?auto_701623 ?auto_701630 ) ) ( not ( = ?auto_701623 ?auto_701631 ) ) ( not ( = ?auto_701623 ?auto_701632 ) ) ( not ( = ?auto_701623 ?auto_701633 ) ) ( not ( = ?auto_701623 ?auto_701634 ) ) ( not ( = ?auto_701624 ?auto_701625 ) ) ( not ( = ?auto_701624 ?auto_701626 ) ) ( not ( = ?auto_701624 ?auto_701627 ) ) ( not ( = ?auto_701624 ?auto_701628 ) ) ( not ( = ?auto_701624 ?auto_701629 ) ) ( not ( = ?auto_701624 ?auto_701630 ) ) ( not ( = ?auto_701624 ?auto_701631 ) ) ( not ( = ?auto_701624 ?auto_701632 ) ) ( not ( = ?auto_701624 ?auto_701633 ) ) ( not ( = ?auto_701624 ?auto_701634 ) ) ( not ( = ?auto_701625 ?auto_701626 ) ) ( not ( = ?auto_701625 ?auto_701627 ) ) ( not ( = ?auto_701625 ?auto_701628 ) ) ( not ( = ?auto_701625 ?auto_701629 ) ) ( not ( = ?auto_701625 ?auto_701630 ) ) ( not ( = ?auto_701625 ?auto_701631 ) ) ( not ( = ?auto_701625 ?auto_701632 ) ) ( not ( = ?auto_701625 ?auto_701633 ) ) ( not ( = ?auto_701625 ?auto_701634 ) ) ( not ( = ?auto_701626 ?auto_701627 ) ) ( not ( = ?auto_701626 ?auto_701628 ) ) ( not ( = ?auto_701626 ?auto_701629 ) ) ( not ( = ?auto_701626 ?auto_701630 ) ) ( not ( = ?auto_701626 ?auto_701631 ) ) ( not ( = ?auto_701626 ?auto_701632 ) ) ( not ( = ?auto_701626 ?auto_701633 ) ) ( not ( = ?auto_701626 ?auto_701634 ) ) ( not ( = ?auto_701627 ?auto_701628 ) ) ( not ( = ?auto_701627 ?auto_701629 ) ) ( not ( = ?auto_701627 ?auto_701630 ) ) ( not ( = ?auto_701627 ?auto_701631 ) ) ( not ( = ?auto_701627 ?auto_701632 ) ) ( not ( = ?auto_701627 ?auto_701633 ) ) ( not ( = ?auto_701627 ?auto_701634 ) ) ( not ( = ?auto_701628 ?auto_701629 ) ) ( not ( = ?auto_701628 ?auto_701630 ) ) ( not ( = ?auto_701628 ?auto_701631 ) ) ( not ( = ?auto_701628 ?auto_701632 ) ) ( not ( = ?auto_701628 ?auto_701633 ) ) ( not ( = ?auto_701628 ?auto_701634 ) ) ( not ( = ?auto_701629 ?auto_701630 ) ) ( not ( = ?auto_701629 ?auto_701631 ) ) ( not ( = ?auto_701629 ?auto_701632 ) ) ( not ( = ?auto_701629 ?auto_701633 ) ) ( not ( = ?auto_701629 ?auto_701634 ) ) ( not ( = ?auto_701630 ?auto_701631 ) ) ( not ( = ?auto_701630 ?auto_701632 ) ) ( not ( = ?auto_701630 ?auto_701633 ) ) ( not ( = ?auto_701630 ?auto_701634 ) ) ( not ( = ?auto_701631 ?auto_701632 ) ) ( not ( = ?auto_701631 ?auto_701633 ) ) ( not ( = ?auto_701631 ?auto_701634 ) ) ( not ( = ?auto_701632 ?auto_701633 ) ) ( not ( = ?auto_701632 ?auto_701634 ) ) ( not ( = ?auto_701633 ?auto_701634 ) ) ( ON ?auto_701633 ?auto_701634 ) ( ON ?auto_701632 ?auto_701633 ) ( ON ?auto_701631 ?auto_701632 ) ( ON ?auto_701630 ?auto_701631 ) ( ON ?auto_701629 ?auto_701630 ) ( CLEAR ?auto_701627 ) ( ON ?auto_701628 ?auto_701629 ) ( CLEAR ?auto_701628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_701618 ?auto_701619 ?auto_701620 ?auto_701621 ?auto_701622 ?auto_701623 ?auto_701624 ?auto_701625 ?auto_701626 ?auto_701627 ?auto_701628 )
      ( MAKE-17PILE ?auto_701618 ?auto_701619 ?auto_701620 ?auto_701621 ?auto_701622 ?auto_701623 ?auto_701624 ?auto_701625 ?auto_701626 ?auto_701627 ?auto_701628 ?auto_701629 ?auto_701630 ?auto_701631 ?auto_701632 ?auto_701633 ?auto_701634 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701652 - BLOCK
      ?auto_701653 - BLOCK
      ?auto_701654 - BLOCK
      ?auto_701655 - BLOCK
      ?auto_701656 - BLOCK
      ?auto_701657 - BLOCK
      ?auto_701658 - BLOCK
      ?auto_701659 - BLOCK
      ?auto_701660 - BLOCK
      ?auto_701661 - BLOCK
      ?auto_701662 - BLOCK
      ?auto_701663 - BLOCK
      ?auto_701664 - BLOCK
      ?auto_701665 - BLOCK
      ?auto_701666 - BLOCK
      ?auto_701667 - BLOCK
      ?auto_701668 - BLOCK
    )
    :vars
    (
      ?auto_701669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701668 ?auto_701669 ) ( ON-TABLE ?auto_701652 ) ( ON ?auto_701653 ?auto_701652 ) ( ON ?auto_701654 ?auto_701653 ) ( ON ?auto_701655 ?auto_701654 ) ( ON ?auto_701656 ?auto_701655 ) ( ON ?auto_701657 ?auto_701656 ) ( ON ?auto_701658 ?auto_701657 ) ( ON ?auto_701659 ?auto_701658 ) ( ON ?auto_701660 ?auto_701659 ) ( not ( = ?auto_701652 ?auto_701653 ) ) ( not ( = ?auto_701652 ?auto_701654 ) ) ( not ( = ?auto_701652 ?auto_701655 ) ) ( not ( = ?auto_701652 ?auto_701656 ) ) ( not ( = ?auto_701652 ?auto_701657 ) ) ( not ( = ?auto_701652 ?auto_701658 ) ) ( not ( = ?auto_701652 ?auto_701659 ) ) ( not ( = ?auto_701652 ?auto_701660 ) ) ( not ( = ?auto_701652 ?auto_701661 ) ) ( not ( = ?auto_701652 ?auto_701662 ) ) ( not ( = ?auto_701652 ?auto_701663 ) ) ( not ( = ?auto_701652 ?auto_701664 ) ) ( not ( = ?auto_701652 ?auto_701665 ) ) ( not ( = ?auto_701652 ?auto_701666 ) ) ( not ( = ?auto_701652 ?auto_701667 ) ) ( not ( = ?auto_701652 ?auto_701668 ) ) ( not ( = ?auto_701652 ?auto_701669 ) ) ( not ( = ?auto_701653 ?auto_701654 ) ) ( not ( = ?auto_701653 ?auto_701655 ) ) ( not ( = ?auto_701653 ?auto_701656 ) ) ( not ( = ?auto_701653 ?auto_701657 ) ) ( not ( = ?auto_701653 ?auto_701658 ) ) ( not ( = ?auto_701653 ?auto_701659 ) ) ( not ( = ?auto_701653 ?auto_701660 ) ) ( not ( = ?auto_701653 ?auto_701661 ) ) ( not ( = ?auto_701653 ?auto_701662 ) ) ( not ( = ?auto_701653 ?auto_701663 ) ) ( not ( = ?auto_701653 ?auto_701664 ) ) ( not ( = ?auto_701653 ?auto_701665 ) ) ( not ( = ?auto_701653 ?auto_701666 ) ) ( not ( = ?auto_701653 ?auto_701667 ) ) ( not ( = ?auto_701653 ?auto_701668 ) ) ( not ( = ?auto_701653 ?auto_701669 ) ) ( not ( = ?auto_701654 ?auto_701655 ) ) ( not ( = ?auto_701654 ?auto_701656 ) ) ( not ( = ?auto_701654 ?auto_701657 ) ) ( not ( = ?auto_701654 ?auto_701658 ) ) ( not ( = ?auto_701654 ?auto_701659 ) ) ( not ( = ?auto_701654 ?auto_701660 ) ) ( not ( = ?auto_701654 ?auto_701661 ) ) ( not ( = ?auto_701654 ?auto_701662 ) ) ( not ( = ?auto_701654 ?auto_701663 ) ) ( not ( = ?auto_701654 ?auto_701664 ) ) ( not ( = ?auto_701654 ?auto_701665 ) ) ( not ( = ?auto_701654 ?auto_701666 ) ) ( not ( = ?auto_701654 ?auto_701667 ) ) ( not ( = ?auto_701654 ?auto_701668 ) ) ( not ( = ?auto_701654 ?auto_701669 ) ) ( not ( = ?auto_701655 ?auto_701656 ) ) ( not ( = ?auto_701655 ?auto_701657 ) ) ( not ( = ?auto_701655 ?auto_701658 ) ) ( not ( = ?auto_701655 ?auto_701659 ) ) ( not ( = ?auto_701655 ?auto_701660 ) ) ( not ( = ?auto_701655 ?auto_701661 ) ) ( not ( = ?auto_701655 ?auto_701662 ) ) ( not ( = ?auto_701655 ?auto_701663 ) ) ( not ( = ?auto_701655 ?auto_701664 ) ) ( not ( = ?auto_701655 ?auto_701665 ) ) ( not ( = ?auto_701655 ?auto_701666 ) ) ( not ( = ?auto_701655 ?auto_701667 ) ) ( not ( = ?auto_701655 ?auto_701668 ) ) ( not ( = ?auto_701655 ?auto_701669 ) ) ( not ( = ?auto_701656 ?auto_701657 ) ) ( not ( = ?auto_701656 ?auto_701658 ) ) ( not ( = ?auto_701656 ?auto_701659 ) ) ( not ( = ?auto_701656 ?auto_701660 ) ) ( not ( = ?auto_701656 ?auto_701661 ) ) ( not ( = ?auto_701656 ?auto_701662 ) ) ( not ( = ?auto_701656 ?auto_701663 ) ) ( not ( = ?auto_701656 ?auto_701664 ) ) ( not ( = ?auto_701656 ?auto_701665 ) ) ( not ( = ?auto_701656 ?auto_701666 ) ) ( not ( = ?auto_701656 ?auto_701667 ) ) ( not ( = ?auto_701656 ?auto_701668 ) ) ( not ( = ?auto_701656 ?auto_701669 ) ) ( not ( = ?auto_701657 ?auto_701658 ) ) ( not ( = ?auto_701657 ?auto_701659 ) ) ( not ( = ?auto_701657 ?auto_701660 ) ) ( not ( = ?auto_701657 ?auto_701661 ) ) ( not ( = ?auto_701657 ?auto_701662 ) ) ( not ( = ?auto_701657 ?auto_701663 ) ) ( not ( = ?auto_701657 ?auto_701664 ) ) ( not ( = ?auto_701657 ?auto_701665 ) ) ( not ( = ?auto_701657 ?auto_701666 ) ) ( not ( = ?auto_701657 ?auto_701667 ) ) ( not ( = ?auto_701657 ?auto_701668 ) ) ( not ( = ?auto_701657 ?auto_701669 ) ) ( not ( = ?auto_701658 ?auto_701659 ) ) ( not ( = ?auto_701658 ?auto_701660 ) ) ( not ( = ?auto_701658 ?auto_701661 ) ) ( not ( = ?auto_701658 ?auto_701662 ) ) ( not ( = ?auto_701658 ?auto_701663 ) ) ( not ( = ?auto_701658 ?auto_701664 ) ) ( not ( = ?auto_701658 ?auto_701665 ) ) ( not ( = ?auto_701658 ?auto_701666 ) ) ( not ( = ?auto_701658 ?auto_701667 ) ) ( not ( = ?auto_701658 ?auto_701668 ) ) ( not ( = ?auto_701658 ?auto_701669 ) ) ( not ( = ?auto_701659 ?auto_701660 ) ) ( not ( = ?auto_701659 ?auto_701661 ) ) ( not ( = ?auto_701659 ?auto_701662 ) ) ( not ( = ?auto_701659 ?auto_701663 ) ) ( not ( = ?auto_701659 ?auto_701664 ) ) ( not ( = ?auto_701659 ?auto_701665 ) ) ( not ( = ?auto_701659 ?auto_701666 ) ) ( not ( = ?auto_701659 ?auto_701667 ) ) ( not ( = ?auto_701659 ?auto_701668 ) ) ( not ( = ?auto_701659 ?auto_701669 ) ) ( not ( = ?auto_701660 ?auto_701661 ) ) ( not ( = ?auto_701660 ?auto_701662 ) ) ( not ( = ?auto_701660 ?auto_701663 ) ) ( not ( = ?auto_701660 ?auto_701664 ) ) ( not ( = ?auto_701660 ?auto_701665 ) ) ( not ( = ?auto_701660 ?auto_701666 ) ) ( not ( = ?auto_701660 ?auto_701667 ) ) ( not ( = ?auto_701660 ?auto_701668 ) ) ( not ( = ?auto_701660 ?auto_701669 ) ) ( not ( = ?auto_701661 ?auto_701662 ) ) ( not ( = ?auto_701661 ?auto_701663 ) ) ( not ( = ?auto_701661 ?auto_701664 ) ) ( not ( = ?auto_701661 ?auto_701665 ) ) ( not ( = ?auto_701661 ?auto_701666 ) ) ( not ( = ?auto_701661 ?auto_701667 ) ) ( not ( = ?auto_701661 ?auto_701668 ) ) ( not ( = ?auto_701661 ?auto_701669 ) ) ( not ( = ?auto_701662 ?auto_701663 ) ) ( not ( = ?auto_701662 ?auto_701664 ) ) ( not ( = ?auto_701662 ?auto_701665 ) ) ( not ( = ?auto_701662 ?auto_701666 ) ) ( not ( = ?auto_701662 ?auto_701667 ) ) ( not ( = ?auto_701662 ?auto_701668 ) ) ( not ( = ?auto_701662 ?auto_701669 ) ) ( not ( = ?auto_701663 ?auto_701664 ) ) ( not ( = ?auto_701663 ?auto_701665 ) ) ( not ( = ?auto_701663 ?auto_701666 ) ) ( not ( = ?auto_701663 ?auto_701667 ) ) ( not ( = ?auto_701663 ?auto_701668 ) ) ( not ( = ?auto_701663 ?auto_701669 ) ) ( not ( = ?auto_701664 ?auto_701665 ) ) ( not ( = ?auto_701664 ?auto_701666 ) ) ( not ( = ?auto_701664 ?auto_701667 ) ) ( not ( = ?auto_701664 ?auto_701668 ) ) ( not ( = ?auto_701664 ?auto_701669 ) ) ( not ( = ?auto_701665 ?auto_701666 ) ) ( not ( = ?auto_701665 ?auto_701667 ) ) ( not ( = ?auto_701665 ?auto_701668 ) ) ( not ( = ?auto_701665 ?auto_701669 ) ) ( not ( = ?auto_701666 ?auto_701667 ) ) ( not ( = ?auto_701666 ?auto_701668 ) ) ( not ( = ?auto_701666 ?auto_701669 ) ) ( not ( = ?auto_701667 ?auto_701668 ) ) ( not ( = ?auto_701667 ?auto_701669 ) ) ( not ( = ?auto_701668 ?auto_701669 ) ) ( ON ?auto_701667 ?auto_701668 ) ( ON ?auto_701666 ?auto_701667 ) ( ON ?auto_701665 ?auto_701666 ) ( ON ?auto_701664 ?auto_701665 ) ( ON ?auto_701663 ?auto_701664 ) ( ON ?auto_701662 ?auto_701663 ) ( CLEAR ?auto_701660 ) ( ON ?auto_701661 ?auto_701662 ) ( CLEAR ?auto_701661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_701652 ?auto_701653 ?auto_701654 ?auto_701655 ?auto_701656 ?auto_701657 ?auto_701658 ?auto_701659 ?auto_701660 ?auto_701661 )
      ( MAKE-17PILE ?auto_701652 ?auto_701653 ?auto_701654 ?auto_701655 ?auto_701656 ?auto_701657 ?auto_701658 ?auto_701659 ?auto_701660 ?auto_701661 ?auto_701662 ?auto_701663 ?auto_701664 ?auto_701665 ?auto_701666 ?auto_701667 ?auto_701668 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701687 - BLOCK
      ?auto_701688 - BLOCK
      ?auto_701689 - BLOCK
      ?auto_701690 - BLOCK
      ?auto_701691 - BLOCK
      ?auto_701692 - BLOCK
      ?auto_701693 - BLOCK
      ?auto_701694 - BLOCK
      ?auto_701695 - BLOCK
      ?auto_701696 - BLOCK
      ?auto_701697 - BLOCK
      ?auto_701698 - BLOCK
      ?auto_701699 - BLOCK
      ?auto_701700 - BLOCK
      ?auto_701701 - BLOCK
      ?auto_701702 - BLOCK
      ?auto_701703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_701703 ) ( ON-TABLE ?auto_701687 ) ( ON ?auto_701688 ?auto_701687 ) ( ON ?auto_701689 ?auto_701688 ) ( ON ?auto_701690 ?auto_701689 ) ( ON ?auto_701691 ?auto_701690 ) ( ON ?auto_701692 ?auto_701691 ) ( ON ?auto_701693 ?auto_701692 ) ( ON ?auto_701694 ?auto_701693 ) ( ON ?auto_701695 ?auto_701694 ) ( not ( = ?auto_701687 ?auto_701688 ) ) ( not ( = ?auto_701687 ?auto_701689 ) ) ( not ( = ?auto_701687 ?auto_701690 ) ) ( not ( = ?auto_701687 ?auto_701691 ) ) ( not ( = ?auto_701687 ?auto_701692 ) ) ( not ( = ?auto_701687 ?auto_701693 ) ) ( not ( = ?auto_701687 ?auto_701694 ) ) ( not ( = ?auto_701687 ?auto_701695 ) ) ( not ( = ?auto_701687 ?auto_701696 ) ) ( not ( = ?auto_701687 ?auto_701697 ) ) ( not ( = ?auto_701687 ?auto_701698 ) ) ( not ( = ?auto_701687 ?auto_701699 ) ) ( not ( = ?auto_701687 ?auto_701700 ) ) ( not ( = ?auto_701687 ?auto_701701 ) ) ( not ( = ?auto_701687 ?auto_701702 ) ) ( not ( = ?auto_701687 ?auto_701703 ) ) ( not ( = ?auto_701688 ?auto_701689 ) ) ( not ( = ?auto_701688 ?auto_701690 ) ) ( not ( = ?auto_701688 ?auto_701691 ) ) ( not ( = ?auto_701688 ?auto_701692 ) ) ( not ( = ?auto_701688 ?auto_701693 ) ) ( not ( = ?auto_701688 ?auto_701694 ) ) ( not ( = ?auto_701688 ?auto_701695 ) ) ( not ( = ?auto_701688 ?auto_701696 ) ) ( not ( = ?auto_701688 ?auto_701697 ) ) ( not ( = ?auto_701688 ?auto_701698 ) ) ( not ( = ?auto_701688 ?auto_701699 ) ) ( not ( = ?auto_701688 ?auto_701700 ) ) ( not ( = ?auto_701688 ?auto_701701 ) ) ( not ( = ?auto_701688 ?auto_701702 ) ) ( not ( = ?auto_701688 ?auto_701703 ) ) ( not ( = ?auto_701689 ?auto_701690 ) ) ( not ( = ?auto_701689 ?auto_701691 ) ) ( not ( = ?auto_701689 ?auto_701692 ) ) ( not ( = ?auto_701689 ?auto_701693 ) ) ( not ( = ?auto_701689 ?auto_701694 ) ) ( not ( = ?auto_701689 ?auto_701695 ) ) ( not ( = ?auto_701689 ?auto_701696 ) ) ( not ( = ?auto_701689 ?auto_701697 ) ) ( not ( = ?auto_701689 ?auto_701698 ) ) ( not ( = ?auto_701689 ?auto_701699 ) ) ( not ( = ?auto_701689 ?auto_701700 ) ) ( not ( = ?auto_701689 ?auto_701701 ) ) ( not ( = ?auto_701689 ?auto_701702 ) ) ( not ( = ?auto_701689 ?auto_701703 ) ) ( not ( = ?auto_701690 ?auto_701691 ) ) ( not ( = ?auto_701690 ?auto_701692 ) ) ( not ( = ?auto_701690 ?auto_701693 ) ) ( not ( = ?auto_701690 ?auto_701694 ) ) ( not ( = ?auto_701690 ?auto_701695 ) ) ( not ( = ?auto_701690 ?auto_701696 ) ) ( not ( = ?auto_701690 ?auto_701697 ) ) ( not ( = ?auto_701690 ?auto_701698 ) ) ( not ( = ?auto_701690 ?auto_701699 ) ) ( not ( = ?auto_701690 ?auto_701700 ) ) ( not ( = ?auto_701690 ?auto_701701 ) ) ( not ( = ?auto_701690 ?auto_701702 ) ) ( not ( = ?auto_701690 ?auto_701703 ) ) ( not ( = ?auto_701691 ?auto_701692 ) ) ( not ( = ?auto_701691 ?auto_701693 ) ) ( not ( = ?auto_701691 ?auto_701694 ) ) ( not ( = ?auto_701691 ?auto_701695 ) ) ( not ( = ?auto_701691 ?auto_701696 ) ) ( not ( = ?auto_701691 ?auto_701697 ) ) ( not ( = ?auto_701691 ?auto_701698 ) ) ( not ( = ?auto_701691 ?auto_701699 ) ) ( not ( = ?auto_701691 ?auto_701700 ) ) ( not ( = ?auto_701691 ?auto_701701 ) ) ( not ( = ?auto_701691 ?auto_701702 ) ) ( not ( = ?auto_701691 ?auto_701703 ) ) ( not ( = ?auto_701692 ?auto_701693 ) ) ( not ( = ?auto_701692 ?auto_701694 ) ) ( not ( = ?auto_701692 ?auto_701695 ) ) ( not ( = ?auto_701692 ?auto_701696 ) ) ( not ( = ?auto_701692 ?auto_701697 ) ) ( not ( = ?auto_701692 ?auto_701698 ) ) ( not ( = ?auto_701692 ?auto_701699 ) ) ( not ( = ?auto_701692 ?auto_701700 ) ) ( not ( = ?auto_701692 ?auto_701701 ) ) ( not ( = ?auto_701692 ?auto_701702 ) ) ( not ( = ?auto_701692 ?auto_701703 ) ) ( not ( = ?auto_701693 ?auto_701694 ) ) ( not ( = ?auto_701693 ?auto_701695 ) ) ( not ( = ?auto_701693 ?auto_701696 ) ) ( not ( = ?auto_701693 ?auto_701697 ) ) ( not ( = ?auto_701693 ?auto_701698 ) ) ( not ( = ?auto_701693 ?auto_701699 ) ) ( not ( = ?auto_701693 ?auto_701700 ) ) ( not ( = ?auto_701693 ?auto_701701 ) ) ( not ( = ?auto_701693 ?auto_701702 ) ) ( not ( = ?auto_701693 ?auto_701703 ) ) ( not ( = ?auto_701694 ?auto_701695 ) ) ( not ( = ?auto_701694 ?auto_701696 ) ) ( not ( = ?auto_701694 ?auto_701697 ) ) ( not ( = ?auto_701694 ?auto_701698 ) ) ( not ( = ?auto_701694 ?auto_701699 ) ) ( not ( = ?auto_701694 ?auto_701700 ) ) ( not ( = ?auto_701694 ?auto_701701 ) ) ( not ( = ?auto_701694 ?auto_701702 ) ) ( not ( = ?auto_701694 ?auto_701703 ) ) ( not ( = ?auto_701695 ?auto_701696 ) ) ( not ( = ?auto_701695 ?auto_701697 ) ) ( not ( = ?auto_701695 ?auto_701698 ) ) ( not ( = ?auto_701695 ?auto_701699 ) ) ( not ( = ?auto_701695 ?auto_701700 ) ) ( not ( = ?auto_701695 ?auto_701701 ) ) ( not ( = ?auto_701695 ?auto_701702 ) ) ( not ( = ?auto_701695 ?auto_701703 ) ) ( not ( = ?auto_701696 ?auto_701697 ) ) ( not ( = ?auto_701696 ?auto_701698 ) ) ( not ( = ?auto_701696 ?auto_701699 ) ) ( not ( = ?auto_701696 ?auto_701700 ) ) ( not ( = ?auto_701696 ?auto_701701 ) ) ( not ( = ?auto_701696 ?auto_701702 ) ) ( not ( = ?auto_701696 ?auto_701703 ) ) ( not ( = ?auto_701697 ?auto_701698 ) ) ( not ( = ?auto_701697 ?auto_701699 ) ) ( not ( = ?auto_701697 ?auto_701700 ) ) ( not ( = ?auto_701697 ?auto_701701 ) ) ( not ( = ?auto_701697 ?auto_701702 ) ) ( not ( = ?auto_701697 ?auto_701703 ) ) ( not ( = ?auto_701698 ?auto_701699 ) ) ( not ( = ?auto_701698 ?auto_701700 ) ) ( not ( = ?auto_701698 ?auto_701701 ) ) ( not ( = ?auto_701698 ?auto_701702 ) ) ( not ( = ?auto_701698 ?auto_701703 ) ) ( not ( = ?auto_701699 ?auto_701700 ) ) ( not ( = ?auto_701699 ?auto_701701 ) ) ( not ( = ?auto_701699 ?auto_701702 ) ) ( not ( = ?auto_701699 ?auto_701703 ) ) ( not ( = ?auto_701700 ?auto_701701 ) ) ( not ( = ?auto_701700 ?auto_701702 ) ) ( not ( = ?auto_701700 ?auto_701703 ) ) ( not ( = ?auto_701701 ?auto_701702 ) ) ( not ( = ?auto_701701 ?auto_701703 ) ) ( not ( = ?auto_701702 ?auto_701703 ) ) ( ON ?auto_701702 ?auto_701703 ) ( ON ?auto_701701 ?auto_701702 ) ( ON ?auto_701700 ?auto_701701 ) ( ON ?auto_701699 ?auto_701700 ) ( ON ?auto_701698 ?auto_701699 ) ( ON ?auto_701697 ?auto_701698 ) ( CLEAR ?auto_701695 ) ( ON ?auto_701696 ?auto_701697 ) ( CLEAR ?auto_701696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_701687 ?auto_701688 ?auto_701689 ?auto_701690 ?auto_701691 ?auto_701692 ?auto_701693 ?auto_701694 ?auto_701695 ?auto_701696 )
      ( MAKE-17PILE ?auto_701687 ?auto_701688 ?auto_701689 ?auto_701690 ?auto_701691 ?auto_701692 ?auto_701693 ?auto_701694 ?auto_701695 ?auto_701696 ?auto_701697 ?auto_701698 ?auto_701699 ?auto_701700 ?auto_701701 ?auto_701702 ?auto_701703 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701721 - BLOCK
      ?auto_701722 - BLOCK
      ?auto_701723 - BLOCK
      ?auto_701724 - BLOCK
      ?auto_701725 - BLOCK
      ?auto_701726 - BLOCK
      ?auto_701727 - BLOCK
      ?auto_701728 - BLOCK
      ?auto_701729 - BLOCK
      ?auto_701730 - BLOCK
      ?auto_701731 - BLOCK
      ?auto_701732 - BLOCK
      ?auto_701733 - BLOCK
      ?auto_701734 - BLOCK
      ?auto_701735 - BLOCK
      ?auto_701736 - BLOCK
      ?auto_701737 - BLOCK
    )
    :vars
    (
      ?auto_701738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701737 ?auto_701738 ) ( ON-TABLE ?auto_701721 ) ( ON ?auto_701722 ?auto_701721 ) ( ON ?auto_701723 ?auto_701722 ) ( ON ?auto_701724 ?auto_701723 ) ( ON ?auto_701725 ?auto_701724 ) ( ON ?auto_701726 ?auto_701725 ) ( ON ?auto_701727 ?auto_701726 ) ( ON ?auto_701728 ?auto_701727 ) ( not ( = ?auto_701721 ?auto_701722 ) ) ( not ( = ?auto_701721 ?auto_701723 ) ) ( not ( = ?auto_701721 ?auto_701724 ) ) ( not ( = ?auto_701721 ?auto_701725 ) ) ( not ( = ?auto_701721 ?auto_701726 ) ) ( not ( = ?auto_701721 ?auto_701727 ) ) ( not ( = ?auto_701721 ?auto_701728 ) ) ( not ( = ?auto_701721 ?auto_701729 ) ) ( not ( = ?auto_701721 ?auto_701730 ) ) ( not ( = ?auto_701721 ?auto_701731 ) ) ( not ( = ?auto_701721 ?auto_701732 ) ) ( not ( = ?auto_701721 ?auto_701733 ) ) ( not ( = ?auto_701721 ?auto_701734 ) ) ( not ( = ?auto_701721 ?auto_701735 ) ) ( not ( = ?auto_701721 ?auto_701736 ) ) ( not ( = ?auto_701721 ?auto_701737 ) ) ( not ( = ?auto_701721 ?auto_701738 ) ) ( not ( = ?auto_701722 ?auto_701723 ) ) ( not ( = ?auto_701722 ?auto_701724 ) ) ( not ( = ?auto_701722 ?auto_701725 ) ) ( not ( = ?auto_701722 ?auto_701726 ) ) ( not ( = ?auto_701722 ?auto_701727 ) ) ( not ( = ?auto_701722 ?auto_701728 ) ) ( not ( = ?auto_701722 ?auto_701729 ) ) ( not ( = ?auto_701722 ?auto_701730 ) ) ( not ( = ?auto_701722 ?auto_701731 ) ) ( not ( = ?auto_701722 ?auto_701732 ) ) ( not ( = ?auto_701722 ?auto_701733 ) ) ( not ( = ?auto_701722 ?auto_701734 ) ) ( not ( = ?auto_701722 ?auto_701735 ) ) ( not ( = ?auto_701722 ?auto_701736 ) ) ( not ( = ?auto_701722 ?auto_701737 ) ) ( not ( = ?auto_701722 ?auto_701738 ) ) ( not ( = ?auto_701723 ?auto_701724 ) ) ( not ( = ?auto_701723 ?auto_701725 ) ) ( not ( = ?auto_701723 ?auto_701726 ) ) ( not ( = ?auto_701723 ?auto_701727 ) ) ( not ( = ?auto_701723 ?auto_701728 ) ) ( not ( = ?auto_701723 ?auto_701729 ) ) ( not ( = ?auto_701723 ?auto_701730 ) ) ( not ( = ?auto_701723 ?auto_701731 ) ) ( not ( = ?auto_701723 ?auto_701732 ) ) ( not ( = ?auto_701723 ?auto_701733 ) ) ( not ( = ?auto_701723 ?auto_701734 ) ) ( not ( = ?auto_701723 ?auto_701735 ) ) ( not ( = ?auto_701723 ?auto_701736 ) ) ( not ( = ?auto_701723 ?auto_701737 ) ) ( not ( = ?auto_701723 ?auto_701738 ) ) ( not ( = ?auto_701724 ?auto_701725 ) ) ( not ( = ?auto_701724 ?auto_701726 ) ) ( not ( = ?auto_701724 ?auto_701727 ) ) ( not ( = ?auto_701724 ?auto_701728 ) ) ( not ( = ?auto_701724 ?auto_701729 ) ) ( not ( = ?auto_701724 ?auto_701730 ) ) ( not ( = ?auto_701724 ?auto_701731 ) ) ( not ( = ?auto_701724 ?auto_701732 ) ) ( not ( = ?auto_701724 ?auto_701733 ) ) ( not ( = ?auto_701724 ?auto_701734 ) ) ( not ( = ?auto_701724 ?auto_701735 ) ) ( not ( = ?auto_701724 ?auto_701736 ) ) ( not ( = ?auto_701724 ?auto_701737 ) ) ( not ( = ?auto_701724 ?auto_701738 ) ) ( not ( = ?auto_701725 ?auto_701726 ) ) ( not ( = ?auto_701725 ?auto_701727 ) ) ( not ( = ?auto_701725 ?auto_701728 ) ) ( not ( = ?auto_701725 ?auto_701729 ) ) ( not ( = ?auto_701725 ?auto_701730 ) ) ( not ( = ?auto_701725 ?auto_701731 ) ) ( not ( = ?auto_701725 ?auto_701732 ) ) ( not ( = ?auto_701725 ?auto_701733 ) ) ( not ( = ?auto_701725 ?auto_701734 ) ) ( not ( = ?auto_701725 ?auto_701735 ) ) ( not ( = ?auto_701725 ?auto_701736 ) ) ( not ( = ?auto_701725 ?auto_701737 ) ) ( not ( = ?auto_701725 ?auto_701738 ) ) ( not ( = ?auto_701726 ?auto_701727 ) ) ( not ( = ?auto_701726 ?auto_701728 ) ) ( not ( = ?auto_701726 ?auto_701729 ) ) ( not ( = ?auto_701726 ?auto_701730 ) ) ( not ( = ?auto_701726 ?auto_701731 ) ) ( not ( = ?auto_701726 ?auto_701732 ) ) ( not ( = ?auto_701726 ?auto_701733 ) ) ( not ( = ?auto_701726 ?auto_701734 ) ) ( not ( = ?auto_701726 ?auto_701735 ) ) ( not ( = ?auto_701726 ?auto_701736 ) ) ( not ( = ?auto_701726 ?auto_701737 ) ) ( not ( = ?auto_701726 ?auto_701738 ) ) ( not ( = ?auto_701727 ?auto_701728 ) ) ( not ( = ?auto_701727 ?auto_701729 ) ) ( not ( = ?auto_701727 ?auto_701730 ) ) ( not ( = ?auto_701727 ?auto_701731 ) ) ( not ( = ?auto_701727 ?auto_701732 ) ) ( not ( = ?auto_701727 ?auto_701733 ) ) ( not ( = ?auto_701727 ?auto_701734 ) ) ( not ( = ?auto_701727 ?auto_701735 ) ) ( not ( = ?auto_701727 ?auto_701736 ) ) ( not ( = ?auto_701727 ?auto_701737 ) ) ( not ( = ?auto_701727 ?auto_701738 ) ) ( not ( = ?auto_701728 ?auto_701729 ) ) ( not ( = ?auto_701728 ?auto_701730 ) ) ( not ( = ?auto_701728 ?auto_701731 ) ) ( not ( = ?auto_701728 ?auto_701732 ) ) ( not ( = ?auto_701728 ?auto_701733 ) ) ( not ( = ?auto_701728 ?auto_701734 ) ) ( not ( = ?auto_701728 ?auto_701735 ) ) ( not ( = ?auto_701728 ?auto_701736 ) ) ( not ( = ?auto_701728 ?auto_701737 ) ) ( not ( = ?auto_701728 ?auto_701738 ) ) ( not ( = ?auto_701729 ?auto_701730 ) ) ( not ( = ?auto_701729 ?auto_701731 ) ) ( not ( = ?auto_701729 ?auto_701732 ) ) ( not ( = ?auto_701729 ?auto_701733 ) ) ( not ( = ?auto_701729 ?auto_701734 ) ) ( not ( = ?auto_701729 ?auto_701735 ) ) ( not ( = ?auto_701729 ?auto_701736 ) ) ( not ( = ?auto_701729 ?auto_701737 ) ) ( not ( = ?auto_701729 ?auto_701738 ) ) ( not ( = ?auto_701730 ?auto_701731 ) ) ( not ( = ?auto_701730 ?auto_701732 ) ) ( not ( = ?auto_701730 ?auto_701733 ) ) ( not ( = ?auto_701730 ?auto_701734 ) ) ( not ( = ?auto_701730 ?auto_701735 ) ) ( not ( = ?auto_701730 ?auto_701736 ) ) ( not ( = ?auto_701730 ?auto_701737 ) ) ( not ( = ?auto_701730 ?auto_701738 ) ) ( not ( = ?auto_701731 ?auto_701732 ) ) ( not ( = ?auto_701731 ?auto_701733 ) ) ( not ( = ?auto_701731 ?auto_701734 ) ) ( not ( = ?auto_701731 ?auto_701735 ) ) ( not ( = ?auto_701731 ?auto_701736 ) ) ( not ( = ?auto_701731 ?auto_701737 ) ) ( not ( = ?auto_701731 ?auto_701738 ) ) ( not ( = ?auto_701732 ?auto_701733 ) ) ( not ( = ?auto_701732 ?auto_701734 ) ) ( not ( = ?auto_701732 ?auto_701735 ) ) ( not ( = ?auto_701732 ?auto_701736 ) ) ( not ( = ?auto_701732 ?auto_701737 ) ) ( not ( = ?auto_701732 ?auto_701738 ) ) ( not ( = ?auto_701733 ?auto_701734 ) ) ( not ( = ?auto_701733 ?auto_701735 ) ) ( not ( = ?auto_701733 ?auto_701736 ) ) ( not ( = ?auto_701733 ?auto_701737 ) ) ( not ( = ?auto_701733 ?auto_701738 ) ) ( not ( = ?auto_701734 ?auto_701735 ) ) ( not ( = ?auto_701734 ?auto_701736 ) ) ( not ( = ?auto_701734 ?auto_701737 ) ) ( not ( = ?auto_701734 ?auto_701738 ) ) ( not ( = ?auto_701735 ?auto_701736 ) ) ( not ( = ?auto_701735 ?auto_701737 ) ) ( not ( = ?auto_701735 ?auto_701738 ) ) ( not ( = ?auto_701736 ?auto_701737 ) ) ( not ( = ?auto_701736 ?auto_701738 ) ) ( not ( = ?auto_701737 ?auto_701738 ) ) ( ON ?auto_701736 ?auto_701737 ) ( ON ?auto_701735 ?auto_701736 ) ( ON ?auto_701734 ?auto_701735 ) ( ON ?auto_701733 ?auto_701734 ) ( ON ?auto_701732 ?auto_701733 ) ( ON ?auto_701731 ?auto_701732 ) ( ON ?auto_701730 ?auto_701731 ) ( CLEAR ?auto_701728 ) ( ON ?auto_701729 ?auto_701730 ) ( CLEAR ?auto_701729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_701721 ?auto_701722 ?auto_701723 ?auto_701724 ?auto_701725 ?auto_701726 ?auto_701727 ?auto_701728 ?auto_701729 )
      ( MAKE-17PILE ?auto_701721 ?auto_701722 ?auto_701723 ?auto_701724 ?auto_701725 ?auto_701726 ?auto_701727 ?auto_701728 ?auto_701729 ?auto_701730 ?auto_701731 ?auto_701732 ?auto_701733 ?auto_701734 ?auto_701735 ?auto_701736 ?auto_701737 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701756 - BLOCK
      ?auto_701757 - BLOCK
      ?auto_701758 - BLOCK
      ?auto_701759 - BLOCK
      ?auto_701760 - BLOCK
      ?auto_701761 - BLOCK
      ?auto_701762 - BLOCK
      ?auto_701763 - BLOCK
      ?auto_701764 - BLOCK
      ?auto_701765 - BLOCK
      ?auto_701766 - BLOCK
      ?auto_701767 - BLOCK
      ?auto_701768 - BLOCK
      ?auto_701769 - BLOCK
      ?auto_701770 - BLOCK
      ?auto_701771 - BLOCK
      ?auto_701772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_701772 ) ( ON-TABLE ?auto_701756 ) ( ON ?auto_701757 ?auto_701756 ) ( ON ?auto_701758 ?auto_701757 ) ( ON ?auto_701759 ?auto_701758 ) ( ON ?auto_701760 ?auto_701759 ) ( ON ?auto_701761 ?auto_701760 ) ( ON ?auto_701762 ?auto_701761 ) ( ON ?auto_701763 ?auto_701762 ) ( not ( = ?auto_701756 ?auto_701757 ) ) ( not ( = ?auto_701756 ?auto_701758 ) ) ( not ( = ?auto_701756 ?auto_701759 ) ) ( not ( = ?auto_701756 ?auto_701760 ) ) ( not ( = ?auto_701756 ?auto_701761 ) ) ( not ( = ?auto_701756 ?auto_701762 ) ) ( not ( = ?auto_701756 ?auto_701763 ) ) ( not ( = ?auto_701756 ?auto_701764 ) ) ( not ( = ?auto_701756 ?auto_701765 ) ) ( not ( = ?auto_701756 ?auto_701766 ) ) ( not ( = ?auto_701756 ?auto_701767 ) ) ( not ( = ?auto_701756 ?auto_701768 ) ) ( not ( = ?auto_701756 ?auto_701769 ) ) ( not ( = ?auto_701756 ?auto_701770 ) ) ( not ( = ?auto_701756 ?auto_701771 ) ) ( not ( = ?auto_701756 ?auto_701772 ) ) ( not ( = ?auto_701757 ?auto_701758 ) ) ( not ( = ?auto_701757 ?auto_701759 ) ) ( not ( = ?auto_701757 ?auto_701760 ) ) ( not ( = ?auto_701757 ?auto_701761 ) ) ( not ( = ?auto_701757 ?auto_701762 ) ) ( not ( = ?auto_701757 ?auto_701763 ) ) ( not ( = ?auto_701757 ?auto_701764 ) ) ( not ( = ?auto_701757 ?auto_701765 ) ) ( not ( = ?auto_701757 ?auto_701766 ) ) ( not ( = ?auto_701757 ?auto_701767 ) ) ( not ( = ?auto_701757 ?auto_701768 ) ) ( not ( = ?auto_701757 ?auto_701769 ) ) ( not ( = ?auto_701757 ?auto_701770 ) ) ( not ( = ?auto_701757 ?auto_701771 ) ) ( not ( = ?auto_701757 ?auto_701772 ) ) ( not ( = ?auto_701758 ?auto_701759 ) ) ( not ( = ?auto_701758 ?auto_701760 ) ) ( not ( = ?auto_701758 ?auto_701761 ) ) ( not ( = ?auto_701758 ?auto_701762 ) ) ( not ( = ?auto_701758 ?auto_701763 ) ) ( not ( = ?auto_701758 ?auto_701764 ) ) ( not ( = ?auto_701758 ?auto_701765 ) ) ( not ( = ?auto_701758 ?auto_701766 ) ) ( not ( = ?auto_701758 ?auto_701767 ) ) ( not ( = ?auto_701758 ?auto_701768 ) ) ( not ( = ?auto_701758 ?auto_701769 ) ) ( not ( = ?auto_701758 ?auto_701770 ) ) ( not ( = ?auto_701758 ?auto_701771 ) ) ( not ( = ?auto_701758 ?auto_701772 ) ) ( not ( = ?auto_701759 ?auto_701760 ) ) ( not ( = ?auto_701759 ?auto_701761 ) ) ( not ( = ?auto_701759 ?auto_701762 ) ) ( not ( = ?auto_701759 ?auto_701763 ) ) ( not ( = ?auto_701759 ?auto_701764 ) ) ( not ( = ?auto_701759 ?auto_701765 ) ) ( not ( = ?auto_701759 ?auto_701766 ) ) ( not ( = ?auto_701759 ?auto_701767 ) ) ( not ( = ?auto_701759 ?auto_701768 ) ) ( not ( = ?auto_701759 ?auto_701769 ) ) ( not ( = ?auto_701759 ?auto_701770 ) ) ( not ( = ?auto_701759 ?auto_701771 ) ) ( not ( = ?auto_701759 ?auto_701772 ) ) ( not ( = ?auto_701760 ?auto_701761 ) ) ( not ( = ?auto_701760 ?auto_701762 ) ) ( not ( = ?auto_701760 ?auto_701763 ) ) ( not ( = ?auto_701760 ?auto_701764 ) ) ( not ( = ?auto_701760 ?auto_701765 ) ) ( not ( = ?auto_701760 ?auto_701766 ) ) ( not ( = ?auto_701760 ?auto_701767 ) ) ( not ( = ?auto_701760 ?auto_701768 ) ) ( not ( = ?auto_701760 ?auto_701769 ) ) ( not ( = ?auto_701760 ?auto_701770 ) ) ( not ( = ?auto_701760 ?auto_701771 ) ) ( not ( = ?auto_701760 ?auto_701772 ) ) ( not ( = ?auto_701761 ?auto_701762 ) ) ( not ( = ?auto_701761 ?auto_701763 ) ) ( not ( = ?auto_701761 ?auto_701764 ) ) ( not ( = ?auto_701761 ?auto_701765 ) ) ( not ( = ?auto_701761 ?auto_701766 ) ) ( not ( = ?auto_701761 ?auto_701767 ) ) ( not ( = ?auto_701761 ?auto_701768 ) ) ( not ( = ?auto_701761 ?auto_701769 ) ) ( not ( = ?auto_701761 ?auto_701770 ) ) ( not ( = ?auto_701761 ?auto_701771 ) ) ( not ( = ?auto_701761 ?auto_701772 ) ) ( not ( = ?auto_701762 ?auto_701763 ) ) ( not ( = ?auto_701762 ?auto_701764 ) ) ( not ( = ?auto_701762 ?auto_701765 ) ) ( not ( = ?auto_701762 ?auto_701766 ) ) ( not ( = ?auto_701762 ?auto_701767 ) ) ( not ( = ?auto_701762 ?auto_701768 ) ) ( not ( = ?auto_701762 ?auto_701769 ) ) ( not ( = ?auto_701762 ?auto_701770 ) ) ( not ( = ?auto_701762 ?auto_701771 ) ) ( not ( = ?auto_701762 ?auto_701772 ) ) ( not ( = ?auto_701763 ?auto_701764 ) ) ( not ( = ?auto_701763 ?auto_701765 ) ) ( not ( = ?auto_701763 ?auto_701766 ) ) ( not ( = ?auto_701763 ?auto_701767 ) ) ( not ( = ?auto_701763 ?auto_701768 ) ) ( not ( = ?auto_701763 ?auto_701769 ) ) ( not ( = ?auto_701763 ?auto_701770 ) ) ( not ( = ?auto_701763 ?auto_701771 ) ) ( not ( = ?auto_701763 ?auto_701772 ) ) ( not ( = ?auto_701764 ?auto_701765 ) ) ( not ( = ?auto_701764 ?auto_701766 ) ) ( not ( = ?auto_701764 ?auto_701767 ) ) ( not ( = ?auto_701764 ?auto_701768 ) ) ( not ( = ?auto_701764 ?auto_701769 ) ) ( not ( = ?auto_701764 ?auto_701770 ) ) ( not ( = ?auto_701764 ?auto_701771 ) ) ( not ( = ?auto_701764 ?auto_701772 ) ) ( not ( = ?auto_701765 ?auto_701766 ) ) ( not ( = ?auto_701765 ?auto_701767 ) ) ( not ( = ?auto_701765 ?auto_701768 ) ) ( not ( = ?auto_701765 ?auto_701769 ) ) ( not ( = ?auto_701765 ?auto_701770 ) ) ( not ( = ?auto_701765 ?auto_701771 ) ) ( not ( = ?auto_701765 ?auto_701772 ) ) ( not ( = ?auto_701766 ?auto_701767 ) ) ( not ( = ?auto_701766 ?auto_701768 ) ) ( not ( = ?auto_701766 ?auto_701769 ) ) ( not ( = ?auto_701766 ?auto_701770 ) ) ( not ( = ?auto_701766 ?auto_701771 ) ) ( not ( = ?auto_701766 ?auto_701772 ) ) ( not ( = ?auto_701767 ?auto_701768 ) ) ( not ( = ?auto_701767 ?auto_701769 ) ) ( not ( = ?auto_701767 ?auto_701770 ) ) ( not ( = ?auto_701767 ?auto_701771 ) ) ( not ( = ?auto_701767 ?auto_701772 ) ) ( not ( = ?auto_701768 ?auto_701769 ) ) ( not ( = ?auto_701768 ?auto_701770 ) ) ( not ( = ?auto_701768 ?auto_701771 ) ) ( not ( = ?auto_701768 ?auto_701772 ) ) ( not ( = ?auto_701769 ?auto_701770 ) ) ( not ( = ?auto_701769 ?auto_701771 ) ) ( not ( = ?auto_701769 ?auto_701772 ) ) ( not ( = ?auto_701770 ?auto_701771 ) ) ( not ( = ?auto_701770 ?auto_701772 ) ) ( not ( = ?auto_701771 ?auto_701772 ) ) ( ON ?auto_701771 ?auto_701772 ) ( ON ?auto_701770 ?auto_701771 ) ( ON ?auto_701769 ?auto_701770 ) ( ON ?auto_701768 ?auto_701769 ) ( ON ?auto_701767 ?auto_701768 ) ( ON ?auto_701766 ?auto_701767 ) ( ON ?auto_701765 ?auto_701766 ) ( CLEAR ?auto_701763 ) ( ON ?auto_701764 ?auto_701765 ) ( CLEAR ?auto_701764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_701756 ?auto_701757 ?auto_701758 ?auto_701759 ?auto_701760 ?auto_701761 ?auto_701762 ?auto_701763 ?auto_701764 )
      ( MAKE-17PILE ?auto_701756 ?auto_701757 ?auto_701758 ?auto_701759 ?auto_701760 ?auto_701761 ?auto_701762 ?auto_701763 ?auto_701764 ?auto_701765 ?auto_701766 ?auto_701767 ?auto_701768 ?auto_701769 ?auto_701770 ?auto_701771 ?auto_701772 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701790 - BLOCK
      ?auto_701791 - BLOCK
      ?auto_701792 - BLOCK
      ?auto_701793 - BLOCK
      ?auto_701794 - BLOCK
      ?auto_701795 - BLOCK
      ?auto_701796 - BLOCK
      ?auto_701797 - BLOCK
      ?auto_701798 - BLOCK
      ?auto_701799 - BLOCK
      ?auto_701800 - BLOCK
      ?auto_701801 - BLOCK
      ?auto_701802 - BLOCK
      ?auto_701803 - BLOCK
      ?auto_701804 - BLOCK
      ?auto_701805 - BLOCK
      ?auto_701806 - BLOCK
    )
    :vars
    (
      ?auto_701807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701806 ?auto_701807 ) ( ON-TABLE ?auto_701790 ) ( ON ?auto_701791 ?auto_701790 ) ( ON ?auto_701792 ?auto_701791 ) ( ON ?auto_701793 ?auto_701792 ) ( ON ?auto_701794 ?auto_701793 ) ( ON ?auto_701795 ?auto_701794 ) ( ON ?auto_701796 ?auto_701795 ) ( not ( = ?auto_701790 ?auto_701791 ) ) ( not ( = ?auto_701790 ?auto_701792 ) ) ( not ( = ?auto_701790 ?auto_701793 ) ) ( not ( = ?auto_701790 ?auto_701794 ) ) ( not ( = ?auto_701790 ?auto_701795 ) ) ( not ( = ?auto_701790 ?auto_701796 ) ) ( not ( = ?auto_701790 ?auto_701797 ) ) ( not ( = ?auto_701790 ?auto_701798 ) ) ( not ( = ?auto_701790 ?auto_701799 ) ) ( not ( = ?auto_701790 ?auto_701800 ) ) ( not ( = ?auto_701790 ?auto_701801 ) ) ( not ( = ?auto_701790 ?auto_701802 ) ) ( not ( = ?auto_701790 ?auto_701803 ) ) ( not ( = ?auto_701790 ?auto_701804 ) ) ( not ( = ?auto_701790 ?auto_701805 ) ) ( not ( = ?auto_701790 ?auto_701806 ) ) ( not ( = ?auto_701790 ?auto_701807 ) ) ( not ( = ?auto_701791 ?auto_701792 ) ) ( not ( = ?auto_701791 ?auto_701793 ) ) ( not ( = ?auto_701791 ?auto_701794 ) ) ( not ( = ?auto_701791 ?auto_701795 ) ) ( not ( = ?auto_701791 ?auto_701796 ) ) ( not ( = ?auto_701791 ?auto_701797 ) ) ( not ( = ?auto_701791 ?auto_701798 ) ) ( not ( = ?auto_701791 ?auto_701799 ) ) ( not ( = ?auto_701791 ?auto_701800 ) ) ( not ( = ?auto_701791 ?auto_701801 ) ) ( not ( = ?auto_701791 ?auto_701802 ) ) ( not ( = ?auto_701791 ?auto_701803 ) ) ( not ( = ?auto_701791 ?auto_701804 ) ) ( not ( = ?auto_701791 ?auto_701805 ) ) ( not ( = ?auto_701791 ?auto_701806 ) ) ( not ( = ?auto_701791 ?auto_701807 ) ) ( not ( = ?auto_701792 ?auto_701793 ) ) ( not ( = ?auto_701792 ?auto_701794 ) ) ( not ( = ?auto_701792 ?auto_701795 ) ) ( not ( = ?auto_701792 ?auto_701796 ) ) ( not ( = ?auto_701792 ?auto_701797 ) ) ( not ( = ?auto_701792 ?auto_701798 ) ) ( not ( = ?auto_701792 ?auto_701799 ) ) ( not ( = ?auto_701792 ?auto_701800 ) ) ( not ( = ?auto_701792 ?auto_701801 ) ) ( not ( = ?auto_701792 ?auto_701802 ) ) ( not ( = ?auto_701792 ?auto_701803 ) ) ( not ( = ?auto_701792 ?auto_701804 ) ) ( not ( = ?auto_701792 ?auto_701805 ) ) ( not ( = ?auto_701792 ?auto_701806 ) ) ( not ( = ?auto_701792 ?auto_701807 ) ) ( not ( = ?auto_701793 ?auto_701794 ) ) ( not ( = ?auto_701793 ?auto_701795 ) ) ( not ( = ?auto_701793 ?auto_701796 ) ) ( not ( = ?auto_701793 ?auto_701797 ) ) ( not ( = ?auto_701793 ?auto_701798 ) ) ( not ( = ?auto_701793 ?auto_701799 ) ) ( not ( = ?auto_701793 ?auto_701800 ) ) ( not ( = ?auto_701793 ?auto_701801 ) ) ( not ( = ?auto_701793 ?auto_701802 ) ) ( not ( = ?auto_701793 ?auto_701803 ) ) ( not ( = ?auto_701793 ?auto_701804 ) ) ( not ( = ?auto_701793 ?auto_701805 ) ) ( not ( = ?auto_701793 ?auto_701806 ) ) ( not ( = ?auto_701793 ?auto_701807 ) ) ( not ( = ?auto_701794 ?auto_701795 ) ) ( not ( = ?auto_701794 ?auto_701796 ) ) ( not ( = ?auto_701794 ?auto_701797 ) ) ( not ( = ?auto_701794 ?auto_701798 ) ) ( not ( = ?auto_701794 ?auto_701799 ) ) ( not ( = ?auto_701794 ?auto_701800 ) ) ( not ( = ?auto_701794 ?auto_701801 ) ) ( not ( = ?auto_701794 ?auto_701802 ) ) ( not ( = ?auto_701794 ?auto_701803 ) ) ( not ( = ?auto_701794 ?auto_701804 ) ) ( not ( = ?auto_701794 ?auto_701805 ) ) ( not ( = ?auto_701794 ?auto_701806 ) ) ( not ( = ?auto_701794 ?auto_701807 ) ) ( not ( = ?auto_701795 ?auto_701796 ) ) ( not ( = ?auto_701795 ?auto_701797 ) ) ( not ( = ?auto_701795 ?auto_701798 ) ) ( not ( = ?auto_701795 ?auto_701799 ) ) ( not ( = ?auto_701795 ?auto_701800 ) ) ( not ( = ?auto_701795 ?auto_701801 ) ) ( not ( = ?auto_701795 ?auto_701802 ) ) ( not ( = ?auto_701795 ?auto_701803 ) ) ( not ( = ?auto_701795 ?auto_701804 ) ) ( not ( = ?auto_701795 ?auto_701805 ) ) ( not ( = ?auto_701795 ?auto_701806 ) ) ( not ( = ?auto_701795 ?auto_701807 ) ) ( not ( = ?auto_701796 ?auto_701797 ) ) ( not ( = ?auto_701796 ?auto_701798 ) ) ( not ( = ?auto_701796 ?auto_701799 ) ) ( not ( = ?auto_701796 ?auto_701800 ) ) ( not ( = ?auto_701796 ?auto_701801 ) ) ( not ( = ?auto_701796 ?auto_701802 ) ) ( not ( = ?auto_701796 ?auto_701803 ) ) ( not ( = ?auto_701796 ?auto_701804 ) ) ( not ( = ?auto_701796 ?auto_701805 ) ) ( not ( = ?auto_701796 ?auto_701806 ) ) ( not ( = ?auto_701796 ?auto_701807 ) ) ( not ( = ?auto_701797 ?auto_701798 ) ) ( not ( = ?auto_701797 ?auto_701799 ) ) ( not ( = ?auto_701797 ?auto_701800 ) ) ( not ( = ?auto_701797 ?auto_701801 ) ) ( not ( = ?auto_701797 ?auto_701802 ) ) ( not ( = ?auto_701797 ?auto_701803 ) ) ( not ( = ?auto_701797 ?auto_701804 ) ) ( not ( = ?auto_701797 ?auto_701805 ) ) ( not ( = ?auto_701797 ?auto_701806 ) ) ( not ( = ?auto_701797 ?auto_701807 ) ) ( not ( = ?auto_701798 ?auto_701799 ) ) ( not ( = ?auto_701798 ?auto_701800 ) ) ( not ( = ?auto_701798 ?auto_701801 ) ) ( not ( = ?auto_701798 ?auto_701802 ) ) ( not ( = ?auto_701798 ?auto_701803 ) ) ( not ( = ?auto_701798 ?auto_701804 ) ) ( not ( = ?auto_701798 ?auto_701805 ) ) ( not ( = ?auto_701798 ?auto_701806 ) ) ( not ( = ?auto_701798 ?auto_701807 ) ) ( not ( = ?auto_701799 ?auto_701800 ) ) ( not ( = ?auto_701799 ?auto_701801 ) ) ( not ( = ?auto_701799 ?auto_701802 ) ) ( not ( = ?auto_701799 ?auto_701803 ) ) ( not ( = ?auto_701799 ?auto_701804 ) ) ( not ( = ?auto_701799 ?auto_701805 ) ) ( not ( = ?auto_701799 ?auto_701806 ) ) ( not ( = ?auto_701799 ?auto_701807 ) ) ( not ( = ?auto_701800 ?auto_701801 ) ) ( not ( = ?auto_701800 ?auto_701802 ) ) ( not ( = ?auto_701800 ?auto_701803 ) ) ( not ( = ?auto_701800 ?auto_701804 ) ) ( not ( = ?auto_701800 ?auto_701805 ) ) ( not ( = ?auto_701800 ?auto_701806 ) ) ( not ( = ?auto_701800 ?auto_701807 ) ) ( not ( = ?auto_701801 ?auto_701802 ) ) ( not ( = ?auto_701801 ?auto_701803 ) ) ( not ( = ?auto_701801 ?auto_701804 ) ) ( not ( = ?auto_701801 ?auto_701805 ) ) ( not ( = ?auto_701801 ?auto_701806 ) ) ( not ( = ?auto_701801 ?auto_701807 ) ) ( not ( = ?auto_701802 ?auto_701803 ) ) ( not ( = ?auto_701802 ?auto_701804 ) ) ( not ( = ?auto_701802 ?auto_701805 ) ) ( not ( = ?auto_701802 ?auto_701806 ) ) ( not ( = ?auto_701802 ?auto_701807 ) ) ( not ( = ?auto_701803 ?auto_701804 ) ) ( not ( = ?auto_701803 ?auto_701805 ) ) ( not ( = ?auto_701803 ?auto_701806 ) ) ( not ( = ?auto_701803 ?auto_701807 ) ) ( not ( = ?auto_701804 ?auto_701805 ) ) ( not ( = ?auto_701804 ?auto_701806 ) ) ( not ( = ?auto_701804 ?auto_701807 ) ) ( not ( = ?auto_701805 ?auto_701806 ) ) ( not ( = ?auto_701805 ?auto_701807 ) ) ( not ( = ?auto_701806 ?auto_701807 ) ) ( ON ?auto_701805 ?auto_701806 ) ( ON ?auto_701804 ?auto_701805 ) ( ON ?auto_701803 ?auto_701804 ) ( ON ?auto_701802 ?auto_701803 ) ( ON ?auto_701801 ?auto_701802 ) ( ON ?auto_701800 ?auto_701801 ) ( ON ?auto_701799 ?auto_701800 ) ( ON ?auto_701798 ?auto_701799 ) ( CLEAR ?auto_701796 ) ( ON ?auto_701797 ?auto_701798 ) ( CLEAR ?auto_701797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_701790 ?auto_701791 ?auto_701792 ?auto_701793 ?auto_701794 ?auto_701795 ?auto_701796 ?auto_701797 )
      ( MAKE-17PILE ?auto_701790 ?auto_701791 ?auto_701792 ?auto_701793 ?auto_701794 ?auto_701795 ?auto_701796 ?auto_701797 ?auto_701798 ?auto_701799 ?auto_701800 ?auto_701801 ?auto_701802 ?auto_701803 ?auto_701804 ?auto_701805 ?auto_701806 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701825 - BLOCK
      ?auto_701826 - BLOCK
      ?auto_701827 - BLOCK
      ?auto_701828 - BLOCK
      ?auto_701829 - BLOCK
      ?auto_701830 - BLOCK
      ?auto_701831 - BLOCK
      ?auto_701832 - BLOCK
      ?auto_701833 - BLOCK
      ?auto_701834 - BLOCK
      ?auto_701835 - BLOCK
      ?auto_701836 - BLOCK
      ?auto_701837 - BLOCK
      ?auto_701838 - BLOCK
      ?auto_701839 - BLOCK
      ?auto_701840 - BLOCK
      ?auto_701841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_701841 ) ( ON-TABLE ?auto_701825 ) ( ON ?auto_701826 ?auto_701825 ) ( ON ?auto_701827 ?auto_701826 ) ( ON ?auto_701828 ?auto_701827 ) ( ON ?auto_701829 ?auto_701828 ) ( ON ?auto_701830 ?auto_701829 ) ( ON ?auto_701831 ?auto_701830 ) ( not ( = ?auto_701825 ?auto_701826 ) ) ( not ( = ?auto_701825 ?auto_701827 ) ) ( not ( = ?auto_701825 ?auto_701828 ) ) ( not ( = ?auto_701825 ?auto_701829 ) ) ( not ( = ?auto_701825 ?auto_701830 ) ) ( not ( = ?auto_701825 ?auto_701831 ) ) ( not ( = ?auto_701825 ?auto_701832 ) ) ( not ( = ?auto_701825 ?auto_701833 ) ) ( not ( = ?auto_701825 ?auto_701834 ) ) ( not ( = ?auto_701825 ?auto_701835 ) ) ( not ( = ?auto_701825 ?auto_701836 ) ) ( not ( = ?auto_701825 ?auto_701837 ) ) ( not ( = ?auto_701825 ?auto_701838 ) ) ( not ( = ?auto_701825 ?auto_701839 ) ) ( not ( = ?auto_701825 ?auto_701840 ) ) ( not ( = ?auto_701825 ?auto_701841 ) ) ( not ( = ?auto_701826 ?auto_701827 ) ) ( not ( = ?auto_701826 ?auto_701828 ) ) ( not ( = ?auto_701826 ?auto_701829 ) ) ( not ( = ?auto_701826 ?auto_701830 ) ) ( not ( = ?auto_701826 ?auto_701831 ) ) ( not ( = ?auto_701826 ?auto_701832 ) ) ( not ( = ?auto_701826 ?auto_701833 ) ) ( not ( = ?auto_701826 ?auto_701834 ) ) ( not ( = ?auto_701826 ?auto_701835 ) ) ( not ( = ?auto_701826 ?auto_701836 ) ) ( not ( = ?auto_701826 ?auto_701837 ) ) ( not ( = ?auto_701826 ?auto_701838 ) ) ( not ( = ?auto_701826 ?auto_701839 ) ) ( not ( = ?auto_701826 ?auto_701840 ) ) ( not ( = ?auto_701826 ?auto_701841 ) ) ( not ( = ?auto_701827 ?auto_701828 ) ) ( not ( = ?auto_701827 ?auto_701829 ) ) ( not ( = ?auto_701827 ?auto_701830 ) ) ( not ( = ?auto_701827 ?auto_701831 ) ) ( not ( = ?auto_701827 ?auto_701832 ) ) ( not ( = ?auto_701827 ?auto_701833 ) ) ( not ( = ?auto_701827 ?auto_701834 ) ) ( not ( = ?auto_701827 ?auto_701835 ) ) ( not ( = ?auto_701827 ?auto_701836 ) ) ( not ( = ?auto_701827 ?auto_701837 ) ) ( not ( = ?auto_701827 ?auto_701838 ) ) ( not ( = ?auto_701827 ?auto_701839 ) ) ( not ( = ?auto_701827 ?auto_701840 ) ) ( not ( = ?auto_701827 ?auto_701841 ) ) ( not ( = ?auto_701828 ?auto_701829 ) ) ( not ( = ?auto_701828 ?auto_701830 ) ) ( not ( = ?auto_701828 ?auto_701831 ) ) ( not ( = ?auto_701828 ?auto_701832 ) ) ( not ( = ?auto_701828 ?auto_701833 ) ) ( not ( = ?auto_701828 ?auto_701834 ) ) ( not ( = ?auto_701828 ?auto_701835 ) ) ( not ( = ?auto_701828 ?auto_701836 ) ) ( not ( = ?auto_701828 ?auto_701837 ) ) ( not ( = ?auto_701828 ?auto_701838 ) ) ( not ( = ?auto_701828 ?auto_701839 ) ) ( not ( = ?auto_701828 ?auto_701840 ) ) ( not ( = ?auto_701828 ?auto_701841 ) ) ( not ( = ?auto_701829 ?auto_701830 ) ) ( not ( = ?auto_701829 ?auto_701831 ) ) ( not ( = ?auto_701829 ?auto_701832 ) ) ( not ( = ?auto_701829 ?auto_701833 ) ) ( not ( = ?auto_701829 ?auto_701834 ) ) ( not ( = ?auto_701829 ?auto_701835 ) ) ( not ( = ?auto_701829 ?auto_701836 ) ) ( not ( = ?auto_701829 ?auto_701837 ) ) ( not ( = ?auto_701829 ?auto_701838 ) ) ( not ( = ?auto_701829 ?auto_701839 ) ) ( not ( = ?auto_701829 ?auto_701840 ) ) ( not ( = ?auto_701829 ?auto_701841 ) ) ( not ( = ?auto_701830 ?auto_701831 ) ) ( not ( = ?auto_701830 ?auto_701832 ) ) ( not ( = ?auto_701830 ?auto_701833 ) ) ( not ( = ?auto_701830 ?auto_701834 ) ) ( not ( = ?auto_701830 ?auto_701835 ) ) ( not ( = ?auto_701830 ?auto_701836 ) ) ( not ( = ?auto_701830 ?auto_701837 ) ) ( not ( = ?auto_701830 ?auto_701838 ) ) ( not ( = ?auto_701830 ?auto_701839 ) ) ( not ( = ?auto_701830 ?auto_701840 ) ) ( not ( = ?auto_701830 ?auto_701841 ) ) ( not ( = ?auto_701831 ?auto_701832 ) ) ( not ( = ?auto_701831 ?auto_701833 ) ) ( not ( = ?auto_701831 ?auto_701834 ) ) ( not ( = ?auto_701831 ?auto_701835 ) ) ( not ( = ?auto_701831 ?auto_701836 ) ) ( not ( = ?auto_701831 ?auto_701837 ) ) ( not ( = ?auto_701831 ?auto_701838 ) ) ( not ( = ?auto_701831 ?auto_701839 ) ) ( not ( = ?auto_701831 ?auto_701840 ) ) ( not ( = ?auto_701831 ?auto_701841 ) ) ( not ( = ?auto_701832 ?auto_701833 ) ) ( not ( = ?auto_701832 ?auto_701834 ) ) ( not ( = ?auto_701832 ?auto_701835 ) ) ( not ( = ?auto_701832 ?auto_701836 ) ) ( not ( = ?auto_701832 ?auto_701837 ) ) ( not ( = ?auto_701832 ?auto_701838 ) ) ( not ( = ?auto_701832 ?auto_701839 ) ) ( not ( = ?auto_701832 ?auto_701840 ) ) ( not ( = ?auto_701832 ?auto_701841 ) ) ( not ( = ?auto_701833 ?auto_701834 ) ) ( not ( = ?auto_701833 ?auto_701835 ) ) ( not ( = ?auto_701833 ?auto_701836 ) ) ( not ( = ?auto_701833 ?auto_701837 ) ) ( not ( = ?auto_701833 ?auto_701838 ) ) ( not ( = ?auto_701833 ?auto_701839 ) ) ( not ( = ?auto_701833 ?auto_701840 ) ) ( not ( = ?auto_701833 ?auto_701841 ) ) ( not ( = ?auto_701834 ?auto_701835 ) ) ( not ( = ?auto_701834 ?auto_701836 ) ) ( not ( = ?auto_701834 ?auto_701837 ) ) ( not ( = ?auto_701834 ?auto_701838 ) ) ( not ( = ?auto_701834 ?auto_701839 ) ) ( not ( = ?auto_701834 ?auto_701840 ) ) ( not ( = ?auto_701834 ?auto_701841 ) ) ( not ( = ?auto_701835 ?auto_701836 ) ) ( not ( = ?auto_701835 ?auto_701837 ) ) ( not ( = ?auto_701835 ?auto_701838 ) ) ( not ( = ?auto_701835 ?auto_701839 ) ) ( not ( = ?auto_701835 ?auto_701840 ) ) ( not ( = ?auto_701835 ?auto_701841 ) ) ( not ( = ?auto_701836 ?auto_701837 ) ) ( not ( = ?auto_701836 ?auto_701838 ) ) ( not ( = ?auto_701836 ?auto_701839 ) ) ( not ( = ?auto_701836 ?auto_701840 ) ) ( not ( = ?auto_701836 ?auto_701841 ) ) ( not ( = ?auto_701837 ?auto_701838 ) ) ( not ( = ?auto_701837 ?auto_701839 ) ) ( not ( = ?auto_701837 ?auto_701840 ) ) ( not ( = ?auto_701837 ?auto_701841 ) ) ( not ( = ?auto_701838 ?auto_701839 ) ) ( not ( = ?auto_701838 ?auto_701840 ) ) ( not ( = ?auto_701838 ?auto_701841 ) ) ( not ( = ?auto_701839 ?auto_701840 ) ) ( not ( = ?auto_701839 ?auto_701841 ) ) ( not ( = ?auto_701840 ?auto_701841 ) ) ( ON ?auto_701840 ?auto_701841 ) ( ON ?auto_701839 ?auto_701840 ) ( ON ?auto_701838 ?auto_701839 ) ( ON ?auto_701837 ?auto_701838 ) ( ON ?auto_701836 ?auto_701837 ) ( ON ?auto_701835 ?auto_701836 ) ( ON ?auto_701834 ?auto_701835 ) ( ON ?auto_701833 ?auto_701834 ) ( CLEAR ?auto_701831 ) ( ON ?auto_701832 ?auto_701833 ) ( CLEAR ?auto_701832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_701825 ?auto_701826 ?auto_701827 ?auto_701828 ?auto_701829 ?auto_701830 ?auto_701831 ?auto_701832 )
      ( MAKE-17PILE ?auto_701825 ?auto_701826 ?auto_701827 ?auto_701828 ?auto_701829 ?auto_701830 ?auto_701831 ?auto_701832 ?auto_701833 ?auto_701834 ?auto_701835 ?auto_701836 ?auto_701837 ?auto_701838 ?auto_701839 ?auto_701840 ?auto_701841 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701859 - BLOCK
      ?auto_701860 - BLOCK
      ?auto_701861 - BLOCK
      ?auto_701862 - BLOCK
      ?auto_701863 - BLOCK
      ?auto_701864 - BLOCK
      ?auto_701865 - BLOCK
      ?auto_701866 - BLOCK
      ?auto_701867 - BLOCK
      ?auto_701868 - BLOCK
      ?auto_701869 - BLOCK
      ?auto_701870 - BLOCK
      ?auto_701871 - BLOCK
      ?auto_701872 - BLOCK
      ?auto_701873 - BLOCK
      ?auto_701874 - BLOCK
      ?auto_701875 - BLOCK
    )
    :vars
    (
      ?auto_701876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701875 ?auto_701876 ) ( ON-TABLE ?auto_701859 ) ( ON ?auto_701860 ?auto_701859 ) ( ON ?auto_701861 ?auto_701860 ) ( ON ?auto_701862 ?auto_701861 ) ( ON ?auto_701863 ?auto_701862 ) ( ON ?auto_701864 ?auto_701863 ) ( not ( = ?auto_701859 ?auto_701860 ) ) ( not ( = ?auto_701859 ?auto_701861 ) ) ( not ( = ?auto_701859 ?auto_701862 ) ) ( not ( = ?auto_701859 ?auto_701863 ) ) ( not ( = ?auto_701859 ?auto_701864 ) ) ( not ( = ?auto_701859 ?auto_701865 ) ) ( not ( = ?auto_701859 ?auto_701866 ) ) ( not ( = ?auto_701859 ?auto_701867 ) ) ( not ( = ?auto_701859 ?auto_701868 ) ) ( not ( = ?auto_701859 ?auto_701869 ) ) ( not ( = ?auto_701859 ?auto_701870 ) ) ( not ( = ?auto_701859 ?auto_701871 ) ) ( not ( = ?auto_701859 ?auto_701872 ) ) ( not ( = ?auto_701859 ?auto_701873 ) ) ( not ( = ?auto_701859 ?auto_701874 ) ) ( not ( = ?auto_701859 ?auto_701875 ) ) ( not ( = ?auto_701859 ?auto_701876 ) ) ( not ( = ?auto_701860 ?auto_701861 ) ) ( not ( = ?auto_701860 ?auto_701862 ) ) ( not ( = ?auto_701860 ?auto_701863 ) ) ( not ( = ?auto_701860 ?auto_701864 ) ) ( not ( = ?auto_701860 ?auto_701865 ) ) ( not ( = ?auto_701860 ?auto_701866 ) ) ( not ( = ?auto_701860 ?auto_701867 ) ) ( not ( = ?auto_701860 ?auto_701868 ) ) ( not ( = ?auto_701860 ?auto_701869 ) ) ( not ( = ?auto_701860 ?auto_701870 ) ) ( not ( = ?auto_701860 ?auto_701871 ) ) ( not ( = ?auto_701860 ?auto_701872 ) ) ( not ( = ?auto_701860 ?auto_701873 ) ) ( not ( = ?auto_701860 ?auto_701874 ) ) ( not ( = ?auto_701860 ?auto_701875 ) ) ( not ( = ?auto_701860 ?auto_701876 ) ) ( not ( = ?auto_701861 ?auto_701862 ) ) ( not ( = ?auto_701861 ?auto_701863 ) ) ( not ( = ?auto_701861 ?auto_701864 ) ) ( not ( = ?auto_701861 ?auto_701865 ) ) ( not ( = ?auto_701861 ?auto_701866 ) ) ( not ( = ?auto_701861 ?auto_701867 ) ) ( not ( = ?auto_701861 ?auto_701868 ) ) ( not ( = ?auto_701861 ?auto_701869 ) ) ( not ( = ?auto_701861 ?auto_701870 ) ) ( not ( = ?auto_701861 ?auto_701871 ) ) ( not ( = ?auto_701861 ?auto_701872 ) ) ( not ( = ?auto_701861 ?auto_701873 ) ) ( not ( = ?auto_701861 ?auto_701874 ) ) ( not ( = ?auto_701861 ?auto_701875 ) ) ( not ( = ?auto_701861 ?auto_701876 ) ) ( not ( = ?auto_701862 ?auto_701863 ) ) ( not ( = ?auto_701862 ?auto_701864 ) ) ( not ( = ?auto_701862 ?auto_701865 ) ) ( not ( = ?auto_701862 ?auto_701866 ) ) ( not ( = ?auto_701862 ?auto_701867 ) ) ( not ( = ?auto_701862 ?auto_701868 ) ) ( not ( = ?auto_701862 ?auto_701869 ) ) ( not ( = ?auto_701862 ?auto_701870 ) ) ( not ( = ?auto_701862 ?auto_701871 ) ) ( not ( = ?auto_701862 ?auto_701872 ) ) ( not ( = ?auto_701862 ?auto_701873 ) ) ( not ( = ?auto_701862 ?auto_701874 ) ) ( not ( = ?auto_701862 ?auto_701875 ) ) ( not ( = ?auto_701862 ?auto_701876 ) ) ( not ( = ?auto_701863 ?auto_701864 ) ) ( not ( = ?auto_701863 ?auto_701865 ) ) ( not ( = ?auto_701863 ?auto_701866 ) ) ( not ( = ?auto_701863 ?auto_701867 ) ) ( not ( = ?auto_701863 ?auto_701868 ) ) ( not ( = ?auto_701863 ?auto_701869 ) ) ( not ( = ?auto_701863 ?auto_701870 ) ) ( not ( = ?auto_701863 ?auto_701871 ) ) ( not ( = ?auto_701863 ?auto_701872 ) ) ( not ( = ?auto_701863 ?auto_701873 ) ) ( not ( = ?auto_701863 ?auto_701874 ) ) ( not ( = ?auto_701863 ?auto_701875 ) ) ( not ( = ?auto_701863 ?auto_701876 ) ) ( not ( = ?auto_701864 ?auto_701865 ) ) ( not ( = ?auto_701864 ?auto_701866 ) ) ( not ( = ?auto_701864 ?auto_701867 ) ) ( not ( = ?auto_701864 ?auto_701868 ) ) ( not ( = ?auto_701864 ?auto_701869 ) ) ( not ( = ?auto_701864 ?auto_701870 ) ) ( not ( = ?auto_701864 ?auto_701871 ) ) ( not ( = ?auto_701864 ?auto_701872 ) ) ( not ( = ?auto_701864 ?auto_701873 ) ) ( not ( = ?auto_701864 ?auto_701874 ) ) ( not ( = ?auto_701864 ?auto_701875 ) ) ( not ( = ?auto_701864 ?auto_701876 ) ) ( not ( = ?auto_701865 ?auto_701866 ) ) ( not ( = ?auto_701865 ?auto_701867 ) ) ( not ( = ?auto_701865 ?auto_701868 ) ) ( not ( = ?auto_701865 ?auto_701869 ) ) ( not ( = ?auto_701865 ?auto_701870 ) ) ( not ( = ?auto_701865 ?auto_701871 ) ) ( not ( = ?auto_701865 ?auto_701872 ) ) ( not ( = ?auto_701865 ?auto_701873 ) ) ( not ( = ?auto_701865 ?auto_701874 ) ) ( not ( = ?auto_701865 ?auto_701875 ) ) ( not ( = ?auto_701865 ?auto_701876 ) ) ( not ( = ?auto_701866 ?auto_701867 ) ) ( not ( = ?auto_701866 ?auto_701868 ) ) ( not ( = ?auto_701866 ?auto_701869 ) ) ( not ( = ?auto_701866 ?auto_701870 ) ) ( not ( = ?auto_701866 ?auto_701871 ) ) ( not ( = ?auto_701866 ?auto_701872 ) ) ( not ( = ?auto_701866 ?auto_701873 ) ) ( not ( = ?auto_701866 ?auto_701874 ) ) ( not ( = ?auto_701866 ?auto_701875 ) ) ( not ( = ?auto_701866 ?auto_701876 ) ) ( not ( = ?auto_701867 ?auto_701868 ) ) ( not ( = ?auto_701867 ?auto_701869 ) ) ( not ( = ?auto_701867 ?auto_701870 ) ) ( not ( = ?auto_701867 ?auto_701871 ) ) ( not ( = ?auto_701867 ?auto_701872 ) ) ( not ( = ?auto_701867 ?auto_701873 ) ) ( not ( = ?auto_701867 ?auto_701874 ) ) ( not ( = ?auto_701867 ?auto_701875 ) ) ( not ( = ?auto_701867 ?auto_701876 ) ) ( not ( = ?auto_701868 ?auto_701869 ) ) ( not ( = ?auto_701868 ?auto_701870 ) ) ( not ( = ?auto_701868 ?auto_701871 ) ) ( not ( = ?auto_701868 ?auto_701872 ) ) ( not ( = ?auto_701868 ?auto_701873 ) ) ( not ( = ?auto_701868 ?auto_701874 ) ) ( not ( = ?auto_701868 ?auto_701875 ) ) ( not ( = ?auto_701868 ?auto_701876 ) ) ( not ( = ?auto_701869 ?auto_701870 ) ) ( not ( = ?auto_701869 ?auto_701871 ) ) ( not ( = ?auto_701869 ?auto_701872 ) ) ( not ( = ?auto_701869 ?auto_701873 ) ) ( not ( = ?auto_701869 ?auto_701874 ) ) ( not ( = ?auto_701869 ?auto_701875 ) ) ( not ( = ?auto_701869 ?auto_701876 ) ) ( not ( = ?auto_701870 ?auto_701871 ) ) ( not ( = ?auto_701870 ?auto_701872 ) ) ( not ( = ?auto_701870 ?auto_701873 ) ) ( not ( = ?auto_701870 ?auto_701874 ) ) ( not ( = ?auto_701870 ?auto_701875 ) ) ( not ( = ?auto_701870 ?auto_701876 ) ) ( not ( = ?auto_701871 ?auto_701872 ) ) ( not ( = ?auto_701871 ?auto_701873 ) ) ( not ( = ?auto_701871 ?auto_701874 ) ) ( not ( = ?auto_701871 ?auto_701875 ) ) ( not ( = ?auto_701871 ?auto_701876 ) ) ( not ( = ?auto_701872 ?auto_701873 ) ) ( not ( = ?auto_701872 ?auto_701874 ) ) ( not ( = ?auto_701872 ?auto_701875 ) ) ( not ( = ?auto_701872 ?auto_701876 ) ) ( not ( = ?auto_701873 ?auto_701874 ) ) ( not ( = ?auto_701873 ?auto_701875 ) ) ( not ( = ?auto_701873 ?auto_701876 ) ) ( not ( = ?auto_701874 ?auto_701875 ) ) ( not ( = ?auto_701874 ?auto_701876 ) ) ( not ( = ?auto_701875 ?auto_701876 ) ) ( ON ?auto_701874 ?auto_701875 ) ( ON ?auto_701873 ?auto_701874 ) ( ON ?auto_701872 ?auto_701873 ) ( ON ?auto_701871 ?auto_701872 ) ( ON ?auto_701870 ?auto_701871 ) ( ON ?auto_701869 ?auto_701870 ) ( ON ?auto_701868 ?auto_701869 ) ( ON ?auto_701867 ?auto_701868 ) ( ON ?auto_701866 ?auto_701867 ) ( CLEAR ?auto_701864 ) ( ON ?auto_701865 ?auto_701866 ) ( CLEAR ?auto_701865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_701859 ?auto_701860 ?auto_701861 ?auto_701862 ?auto_701863 ?auto_701864 ?auto_701865 )
      ( MAKE-17PILE ?auto_701859 ?auto_701860 ?auto_701861 ?auto_701862 ?auto_701863 ?auto_701864 ?auto_701865 ?auto_701866 ?auto_701867 ?auto_701868 ?auto_701869 ?auto_701870 ?auto_701871 ?auto_701872 ?auto_701873 ?auto_701874 ?auto_701875 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701894 - BLOCK
      ?auto_701895 - BLOCK
      ?auto_701896 - BLOCK
      ?auto_701897 - BLOCK
      ?auto_701898 - BLOCK
      ?auto_701899 - BLOCK
      ?auto_701900 - BLOCK
      ?auto_701901 - BLOCK
      ?auto_701902 - BLOCK
      ?auto_701903 - BLOCK
      ?auto_701904 - BLOCK
      ?auto_701905 - BLOCK
      ?auto_701906 - BLOCK
      ?auto_701907 - BLOCK
      ?auto_701908 - BLOCK
      ?auto_701909 - BLOCK
      ?auto_701910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_701910 ) ( ON-TABLE ?auto_701894 ) ( ON ?auto_701895 ?auto_701894 ) ( ON ?auto_701896 ?auto_701895 ) ( ON ?auto_701897 ?auto_701896 ) ( ON ?auto_701898 ?auto_701897 ) ( ON ?auto_701899 ?auto_701898 ) ( not ( = ?auto_701894 ?auto_701895 ) ) ( not ( = ?auto_701894 ?auto_701896 ) ) ( not ( = ?auto_701894 ?auto_701897 ) ) ( not ( = ?auto_701894 ?auto_701898 ) ) ( not ( = ?auto_701894 ?auto_701899 ) ) ( not ( = ?auto_701894 ?auto_701900 ) ) ( not ( = ?auto_701894 ?auto_701901 ) ) ( not ( = ?auto_701894 ?auto_701902 ) ) ( not ( = ?auto_701894 ?auto_701903 ) ) ( not ( = ?auto_701894 ?auto_701904 ) ) ( not ( = ?auto_701894 ?auto_701905 ) ) ( not ( = ?auto_701894 ?auto_701906 ) ) ( not ( = ?auto_701894 ?auto_701907 ) ) ( not ( = ?auto_701894 ?auto_701908 ) ) ( not ( = ?auto_701894 ?auto_701909 ) ) ( not ( = ?auto_701894 ?auto_701910 ) ) ( not ( = ?auto_701895 ?auto_701896 ) ) ( not ( = ?auto_701895 ?auto_701897 ) ) ( not ( = ?auto_701895 ?auto_701898 ) ) ( not ( = ?auto_701895 ?auto_701899 ) ) ( not ( = ?auto_701895 ?auto_701900 ) ) ( not ( = ?auto_701895 ?auto_701901 ) ) ( not ( = ?auto_701895 ?auto_701902 ) ) ( not ( = ?auto_701895 ?auto_701903 ) ) ( not ( = ?auto_701895 ?auto_701904 ) ) ( not ( = ?auto_701895 ?auto_701905 ) ) ( not ( = ?auto_701895 ?auto_701906 ) ) ( not ( = ?auto_701895 ?auto_701907 ) ) ( not ( = ?auto_701895 ?auto_701908 ) ) ( not ( = ?auto_701895 ?auto_701909 ) ) ( not ( = ?auto_701895 ?auto_701910 ) ) ( not ( = ?auto_701896 ?auto_701897 ) ) ( not ( = ?auto_701896 ?auto_701898 ) ) ( not ( = ?auto_701896 ?auto_701899 ) ) ( not ( = ?auto_701896 ?auto_701900 ) ) ( not ( = ?auto_701896 ?auto_701901 ) ) ( not ( = ?auto_701896 ?auto_701902 ) ) ( not ( = ?auto_701896 ?auto_701903 ) ) ( not ( = ?auto_701896 ?auto_701904 ) ) ( not ( = ?auto_701896 ?auto_701905 ) ) ( not ( = ?auto_701896 ?auto_701906 ) ) ( not ( = ?auto_701896 ?auto_701907 ) ) ( not ( = ?auto_701896 ?auto_701908 ) ) ( not ( = ?auto_701896 ?auto_701909 ) ) ( not ( = ?auto_701896 ?auto_701910 ) ) ( not ( = ?auto_701897 ?auto_701898 ) ) ( not ( = ?auto_701897 ?auto_701899 ) ) ( not ( = ?auto_701897 ?auto_701900 ) ) ( not ( = ?auto_701897 ?auto_701901 ) ) ( not ( = ?auto_701897 ?auto_701902 ) ) ( not ( = ?auto_701897 ?auto_701903 ) ) ( not ( = ?auto_701897 ?auto_701904 ) ) ( not ( = ?auto_701897 ?auto_701905 ) ) ( not ( = ?auto_701897 ?auto_701906 ) ) ( not ( = ?auto_701897 ?auto_701907 ) ) ( not ( = ?auto_701897 ?auto_701908 ) ) ( not ( = ?auto_701897 ?auto_701909 ) ) ( not ( = ?auto_701897 ?auto_701910 ) ) ( not ( = ?auto_701898 ?auto_701899 ) ) ( not ( = ?auto_701898 ?auto_701900 ) ) ( not ( = ?auto_701898 ?auto_701901 ) ) ( not ( = ?auto_701898 ?auto_701902 ) ) ( not ( = ?auto_701898 ?auto_701903 ) ) ( not ( = ?auto_701898 ?auto_701904 ) ) ( not ( = ?auto_701898 ?auto_701905 ) ) ( not ( = ?auto_701898 ?auto_701906 ) ) ( not ( = ?auto_701898 ?auto_701907 ) ) ( not ( = ?auto_701898 ?auto_701908 ) ) ( not ( = ?auto_701898 ?auto_701909 ) ) ( not ( = ?auto_701898 ?auto_701910 ) ) ( not ( = ?auto_701899 ?auto_701900 ) ) ( not ( = ?auto_701899 ?auto_701901 ) ) ( not ( = ?auto_701899 ?auto_701902 ) ) ( not ( = ?auto_701899 ?auto_701903 ) ) ( not ( = ?auto_701899 ?auto_701904 ) ) ( not ( = ?auto_701899 ?auto_701905 ) ) ( not ( = ?auto_701899 ?auto_701906 ) ) ( not ( = ?auto_701899 ?auto_701907 ) ) ( not ( = ?auto_701899 ?auto_701908 ) ) ( not ( = ?auto_701899 ?auto_701909 ) ) ( not ( = ?auto_701899 ?auto_701910 ) ) ( not ( = ?auto_701900 ?auto_701901 ) ) ( not ( = ?auto_701900 ?auto_701902 ) ) ( not ( = ?auto_701900 ?auto_701903 ) ) ( not ( = ?auto_701900 ?auto_701904 ) ) ( not ( = ?auto_701900 ?auto_701905 ) ) ( not ( = ?auto_701900 ?auto_701906 ) ) ( not ( = ?auto_701900 ?auto_701907 ) ) ( not ( = ?auto_701900 ?auto_701908 ) ) ( not ( = ?auto_701900 ?auto_701909 ) ) ( not ( = ?auto_701900 ?auto_701910 ) ) ( not ( = ?auto_701901 ?auto_701902 ) ) ( not ( = ?auto_701901 ?auto_701903 ) ) ( not ( = ?auto_701901 ?auto_701904 ) ) ( not ( = ?auto_701901 ?auto_701905 ) ) ( not ( = ?auto_701901 ?auto_701906 ) ) ( not ( = ?auto_701901 ?auto_701907 ) ) ( not ( = ?auto_701901 ?auto_701908 ) ) ( not ( = ?auto_701901 ?auto_701909 ) ) ( not ( = ?auto_701901 ?auto_701910 ) ) ( not ( = ?auto_701902 ?auto_701903 ) ) ( not ( = ?auto_701902 ?auto_701904 ) ) ( not ( = ?auto_701902 ?auto_701905 ) ) ( not ( = ?auto_701902 ?auto_701906 ) ) ( not ( = ?auto_701902 ?auto_701907 ) ) ( not ( = ?auto_701902 ?auto_701908 ) ) ( not ( = ?auto_701902 ?auto_701909 ) ) ( not ( = ?auto_701902 ?auto_701910 ) ) ( not ( = ?auto_701903 ?auto_701904 ) ) ( not ( = ?auto_701903 ?auto_701905 ) ) ( not ( = ?auto_701903 ?auto_701906 ) ) ( not ( = ?auto_701903 ?auto_701907 ) ) ( not ( = ?auto_701903 ?auto_701908 ) ) ( not ( = ?auto_701903 ?auto_701909 ) ) ( not ( = ?auto_701903 ?auto_701910 ) ) ( not ( = ?auto_701904 ?auto_701905 ) ) ( not ( = ?auto_701904 ?auto_701906 ) ) ( not ( = ?auto_701904 ?auto_701907 ) ) ( not ( = ?auto_701904 ?auto_701908 ) ) ( not ( = ?auto_701904 ?auto_701909 ) ) ( not ( = ?auto_701904 ?auto_701910 ) ) ( not ( = ?auto_701905 ?auto_701906 ) ) ( not ( = ?auto_701905 ?auto_701907 ) ) ( not ( = ?auto_701905 ?auto_701908 ) ) ( not ( = ?auto_701905 ?auto_701909 ) ) ( not ( = ?auto_701905 ?auto_701910 ) ) ( not ( = ?auto_701906 ?auto_701907 ) ) ( not ( = ?auto_701906 ?auto_701908 ) ) ( not ( = ?auto_701906 ?auto_701909 ) ) ( not ( = ?auto_701906 ?auto_701910 ) ) ( not ( = ?auto_701907 ?auto_701908 ) ) ( not ( = ?auto_701907 ?auto_701909 ) ) ( not ( = ?auto_701907 ?auto_701910 ) ) ( not ( = ?auto_701908 ?auto_701909 ) ) ( not ( = ?auto_701908 ?auto_701910 ) ) ( not ( = ?auto_701909 ?auto_701910 ) ) ( ON ?auto_701909 ?auto_701910 ) ( ON ?auto_701908 ?auto_701909 ) ( ON ?auto_701907 ?auto_701908 ) ( ON ?auto_701906 ?auto_701907 ) ( ON ?auto_701905 ?auto_701906 ) ( ON ?auto_701904 ?auto_701905 ) ( ON ?auto_701903 ?auto_701904 ) ( ON ?auto_701902 ?auto_701903 ) ( ON ?auto_701901 ?auto_701902 ) ( CLEAR ?auto_701899 ) ( ON ?auto_701900 ?auto_701901 ) ( CLEAR ?auto_701900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_701894 ?auto_701895 ?auto_701896 ?auto_701897 ?auto_701898 ?auto_701899 ?auto_701900 )
      ( MAKE-17PILE ?auto_701894 ?auto_701895 ?auto_701896 ?auto_701897 ?auto_701898 ?auto_701899 ?auto_701900 ?auto_701901 ?auto_701902 ?auto_701903 ?auto_701904 ?auto_701905 ?auto_701906 ?auto_701907 ?auto_701908 ?auto_701909 ?auto_701910 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701928 - BLOCK
      ?auto_701929 - BLOCK
      ?auto_701930 - BLOCK
      ?auto_701931 - BLOCK
      ?auto_701932 - BLOCK
      ?auto_701933 - BLOCK
      ?auto_701934 - BLOCK
      ?auto_701935 - BLOCK
      ?auto_701936 - BLOCK
      ?auto_701937 - BLOCK
      ?auto_701938 - BLOCK
      ?auto_701939 - BLOCK
      ?auto_701940 - BLOCK
      ?auto_701941 - BLOCK
      ?auto_701942 - BLOCK
      ?auto_701943 - BLOCK
      ?auto_701944 - BLOCK
    )
    :vars
    (
      ?auto_701945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_701944 ?auto_701945 ) ( ON-TABLE ?auto_701928 ) ( ON ?auto_701929 ?auto_701928 ) ( ON ?auto_701930 ?auto_701929 ) ( ON ?auto_701931 ?auto_701930 ) ( ON ?auto_701932 ?auto_701931 ) ( not ( = ?auto_701928 ?auto_701929 ) ) ( not ( = ?auto_701928 ?auto_701930 ) ) ( not ( = ?auto_701928 ?auto_701931 ) ) ( not ( = ?auto_701928 ?auto_701932 ) ) ( not ( = ?auto_701928 ?auto_701933 ) ) ( not ( = ?auto_701928 ?auto_701934 ) ) ( not ( = ?auto_701928 ?auto_701935 ) ) ( not ( = ?auto_701928 ?auto_701936 ) ) ( not ( = ?auto_701928 ?auto_701937 ) ) ( not ( = ?auto_701928 ?auto_701938 ) ) ( not ( = ?auto_701928 ?auto_701939 ) ) ( not ( = ?auto_701928 ?auto_701940 ) ) ( not ( = ?auto_701928 ?auto_701941 ) ) ( not ( = ?auto_701928 ?auto_701942 ) ) ( not ( = ?auto_701928 ?auto_701943 ) ) ( not ( = ?auto_701928 ?auto_701944 ) ) ( not ( = ?auto_701928 ?auto_701945 ) ) ( not ( = ?auto_701929 ?auto_701930 ) ) ( not ( = ?auto_701929 ?auto_701931 ) ) ( not ( = ?auto_701929 ?auto_701932 ) ) ( not ( = ?auto_701929 ?auto_701933 ) ) ( not ( = ?auto_701929 ?auto_701934 ) ) ( not ( = ?auto_701929 ?auto_701935 ) ) ( not ( = ?auto_701929 ?auto_701936 ) ) ( not ( = ?auto_701929 ?auto_701937 ) ) ( not ( = ?auto_701929 ?auto_701938 ) ) ( not ( = ?auto_701929 ?auto_701939 ) ) ( not ( = ?auto_701929 ?auto_701940 ) ) ( not ( = ?auto_701929 ?auto_701941 ) ) ( not ( = ?auto_701929 ?auto_701942 ) ) ( not ( = ?auto_701929 ?auto_701943 ) ) ( not ( = ?auto_701929 ?auto_701944 ) ) ( not ( = ?auto_701929 ?auto_701945 ) ) ( not ( = ?auto_701930 ?auto_701931 ) ) ( not ( = ?auto_701930 ?auto_701932 ) ) ( not ( = ?auto_701930 ?auto_701933 ) ) ( not ( = ?auto_701930 ?auto_701934 ) ) ( not ( = ?auto_701930 ?auto_701935 ) ) ( not ( = ?auto_701930 ?auto_701936 ) ) ( not ( = ?auto_701930 ?auto_701937 ) ) ( not ( = ?auto_701930 ?auto_701938 ) ) ( not ( = ?auto_701930 ?auto_701939 ) ) ( not ( = ?auto_701930 ?auto_701940 ) ) ( not ( = ?auto_701930 ?auto_701941 ) ) ( not ( = ?auto_701930 ?auto_701942 ) ) ( not ( = ?auto_701930 ?auto_701943 ) ) ( not ( = ?auto_701930 ?auto_701944 ) ) ( not ( = ?auto_701930 ?auto_701945 ) ) ( not ( = ?auto_701931 ?auto_701932 ) ) ( not ( = ?auto_701931 ?auto_701933 ) ) ( not ( = ?auto_701931 ?auto_701934 ) ) ( not ( = ?auto_701931 ?auto_701935 ) ) ( not ( = ?auto_701931 ?auto_701936 ) ) ( not ( = ?auto_701931 ?auto_701937 ) ) ( not ( = ?auto_701931 ?auto_701938 ) ) ( not ( = ?auto_701931 ?auto_701939 ) ) ( not ( = ?auto_701931 ?auto_701940 ) ) ( not ( = ?auto_701931 ?auto_701941 ) ) ( not ( = ?auto_701931 ?auto_701942 ) ) ( not ( = ?auto_701931 ?auto_701943 ) ) ( not ( = ?auto_701931 ?auto_701944 ) ) ( not ( = ?auto_701931 ?auto_701945 ) ) ( not ( = ?auto_701932 ?auto_701933 ) ) ( not ( = ?auto_701932 ?auto_701934 ) ) ( not ( = ?auto_701932 ?auto_701935 ) ) ( not ( = ?auto_701932 ?auto_701936 ) ) ( not ( = ?auto_701932 ?auto_701937 ) ) ( not ( = ?auto_701932 ?auto_701938 ) ) ( not ( = ?auto_701932 ?auto_701939 ) ) ( not ( = ?auto_701932 ?auto_701940 ) ) ( not ( = ?auto_701932 ?auto_701941 ) ) ( not ( = ?auto_701932 ?auto_701942 ) ) ( not ( = ?auto_701932 ?auto_701943 ) ) ( not ( = ?auto_701932 ?auto_701944 ) ) ( not ( = ?auto_701932 ?auto_701945 ) ) ( not ( = ?auto_701933 ?auto_701934 ) ) ( not ( = ?auto_701933 ?auto_701935 ) ) ( not ( = ?auto_701933 ?auto_701936 ) ) ( not ( = ?auto_701933 ?auto_701937 ) ) ( not ( = ?auto_701933 ?auto_701938 ) ) ( not ( = ?auto_701933 ?auto_701939 ) ) ( not ( = ?auto_701933 ?auto_701940 ) ) ( not ( = ?auto_701933 ?auto_701941 ) ) ( not ( = ?auto_701933 ?auto_701942 ) ) ( not ( = ?auto_701933 ?auto_701943 ) ) ( not ( = ?auto_701933 ?auto_701944 ) ) ( not ( = ?auto_701933 ?auto_701945 ) ) ( not ( = ?auto_701934 ?auto_701935 ) ) ( not ( = ?auto_701934 ?auto_701936 ) ) ( not ( = ?auto_701934 ?auto_701937 ) ) ( not ( = ?auto_701934 ?auto_701938 ) ) ( not ( = ?auto_701934 ?auto_701939 ) ) ( not ( = ?auto_701934 ?auto_701940 ) ) ( not ( = ?auto_701934 ?auto_701941 ) ) ( not ( = ?auto_701934 ?auto_701942 ) ) ( not ( = ?auto_701934 ?auto_701943 ) ) ( not ( = ?auto_701934 ?auto_701944 ) ) ( not ( = ?auto_701934 ?auto_701945 ) ) ( not ( = ?auto_701935 ?auto_701936 ) ) ( not ( = ?auto_701935 ?auto_701937 ) ) ( not ( = ?auto_701935 ?auto_701938 ) ) ( not ( = ?auto_701935 ?auto_701939 ) ) ( not ( = ?auto_701935 ?auto_701940 ) ) ( not ( = ?auto_701935 ?auto_701941 ) ) ( not ( = ?auto_701935 ?auto_701942 ) ) ( not ( = ?auto_701935 ?auto_701943 ) ) ( not ( = ?auto_701935 ?auto_701944 ) ) ( not ( = ?auto_701935 ?auto_701945 ) ) ( not ( = ?auto_701936 ?auto_701937 ) ) ( not ( = ?auto_701936 ?auto_701938 ) ) ( not ( = ?auto_701936 ?auto_701939 ) ) ( not ( = ?auto_701936 ?auto_701940 ) ) ( not ( = ?auto_701936 ?auto_701941 ) ) ( not ( = ?auto_701936 ?auto_701942 ) ) ( not ( = ?auto_701936 ?auto_701943 ) ) ( not ( = ?auto_701936 ?auto_701944 ) ) ( not ( = ?auto_701936 ?auto_701945 ) ) ( not ( = ?auto_701937 ?auto_701938 ) ) ( not ( = ?auto_701937 ?auto_701939 ) ) ( not ( = ?auto_701937 ?auto_701940 ) ) ( not ( = ?auto_701937 ?auto_701941 ) ) ( not ( = ?auto_701937 ?auto_701942 ) ) ( not ( = ?auto_701937 ?auto_701943 ) ) ( not ( = ?auto_701937 ?auto_701944 ) ) ( not ( = ?auto_701937 ?auto_701945 ) ) ( not ( = ?auto_701938 ?auto_701939 ) ) ( not ( = ?auto_701938 ?auto_701940 ) ) ( not ( = ?auto_701938 ?auto_701941 ) ) ( not ( = ?auto_701938 ?auto_701942 ) ) ( not ( = ?auto_701938 ?auto_701943 ) ) ( not ( = ?auto_701938 ?auto_701944 ) ) ( not ( = ?auto_701938 ?auto_701945 ) ) ( not ( = ?auto_701939 ?auto_701940 ) ) ( not ( = ?auto_701939 ?auto_701941 ) ) ( not ( = ?auto_701939 ?auto_701942 ) ) ( not ( = ?auto_701939 ?auto_701943 ) ) ( not ( = ?auto_701939 ?auto_701944 ) ) ( not ( = ?auto_701939 ?auto_701945 ) ) ( not ( = ?auto_701940 ?auto_701941 ) ) ( not ( = ?auto_701940 ?auto_701942 ) ) ( not ( = ?auto_701940 ?auto_701943 ) ) ( not ( = ?auto_701940 ?auto_701944 ) ) ( not ( = ?auto_701940 ?auto_701945 ) ) ( not ( = ?auto_701941 ?auto_701942 ) ) ( not ( = ?auto_701941 ?auto_701943 ) ) ( not ( = ?auto_701941 ?auto_701944 ) ) ( not ( = ?auto_701941 ?auto_701945 ) ) ( not ( = ?auto_701942 ?auto_701943 ) ) ( not ( = ?auto_701942 ?auto_701944 ) ) ( not ( = ?auto_701942 ?auto_701945 ) ) ( not ( = ?auto_701943 ?auto_701944 ) ) ( not ( = ?auto_701943 ?auto_701945 ) ) ( not ( = ?auto_701944 ?auto_701945 ) ) ( ON ?auto_701943 ?auto_701944 ) ( ON ?auto_701942 ?auto_701943 ) ( ON ?auto_701941 ?auto_701942 ) ( ON ?auto_701940 ?auto_701941 ) ( ON ?auto_701939 ?auto_701940 ) ( ON ?auto_701938 ?auto_701939 ) ( ON ?auto_701937 ?auto_701938 ) ( ON ?auto_701936 ?auto_701937 ) ( ON ?auto_701935 ?auto_701936 ) ( ON ?auto_701934 ?auto_701935 ) ( CLEAR ?auto_701932 ) ( ON ?auto_701933 ?auto_701934 ) ( CLEAR ?auto_701933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_701928 ?auto_701929 ?auto_701930 ?auto_701931 ?auto_701932 ?auto_701933 )
      ( MAKE-17PILE ?auto_701928 ?auto_701929 ?auto_701930 ?auto_701931 ?auto_701932 ?auto_701933 ?auto_701934 ?auto_701935 ?auto_701936 ?auto_701937 ?auto_701938 ?auto_701939 ?auto_701940 ?auto_701941 ?auto_701942 ?auto_701943 ?auto_701944 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701963 - BLOCK
      ?auto_701964 - BLOCK
      ?auto_701965 - BLOCK
      ?auto_701966 - BLOCK
      ?auto_701967 - BLOCK
      ?auto_701968 - BLOCK
      ?auto_701969 - BLOCK
      ?auto_701970 - BLOCK
      ?auto_701971 - BLOCK
      ?auto_701972 - BLOCK
      ?auto_701973 - BLOCK
      ?auto_701974 - BLOCK
      ?auto_701975 - BLOCK
      ?auto_701976 - BLOCK
      ?auto_701977 - BLOCK
      ?auto_701978 - BLOCK
      ?auto_701979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_701979 ) ( ON-TABLE ?auto_701963 ) ( ON ?auto_701964 ?auto_701963 ) ( ON ?auto_701965 ?auto_701964 ) ( ON ?auto_701966 ?auto_701965 ) ( ON ?auto_701967 ?auto_701966 ) ( not ( = ?auto_701963 ?auto_701964 ) ) ( not ( = ?auto_701963 ?auto_701965 ) ) ( not ( = ?auto_701963 ?auto_701966 ) ) ( not ( = ?auto_701963 ?auto_701967 ) ) ( not ( = ?auto_701963 ?auto_701968 ) ) ( not ( = ?auto_701963 ?auto_701969 ) ) ( not ( = ?auto_701963 ?auto_701970 ) ) ( not ( = ?auto_701963 ?auto_701971 ) ) ( not ( = ?auto_701963 ?auto_701972 ) ) ( not ( = ?auto_701963 ?auto_701973 ) ) ( not ( = ?auto_701963 ?auto_701974 ) ) ( not ( = ?auto_701963 ?auto_701975 ) ) ( not ( = ?auto_701963 ?auto_701976 ) ) ( not ( = ?auto_701963 ?auto_701977 ) ) ( not ( = ?auto_701963 ?auto_701978 ) ) ( not ( = ?auto_701963 ?auto_701979 ) ) ( not ( = ?auto_701964 ?auto_701965 ) ) ( not ( = ?auto_701964 ?auto_701966 ) ) ( not ( = ?auto_701964 ?auto_701967 ) ) ( not ( = ?auto_701964 ?auto_701968 ) ) ( not ( = ?auto_701964 ?auto_701969 ) ) ( not ( = ?auto_701964 ?auto_701970 ) ) ( not ( = ?auto_701964 ?auto_701971 ) ) ( not ( = ?auto_701964 ?auto_701972 ) ) ( not ( = ?auto_701964 ?auto_701973 ) ) ( not ( = ?auto_701964 ?auto_701974 ) ) ( not ( = ?auto_701964 ?auto_701975 ) ) ( not ( = ?auto_701964 ?auto_701976 ) ) ( not ( = ?auto_701964 ?auto_701977 ) ) ( not ( = ?auto_701964 ?auto_701978 ) ) ( not ( = ?auto_701964 ?auto_701979 ) ) ( not ( = ?auto_701965 ?auto_701966 ) ) ( not ( = ?auto_701965 ?auto_701967 ) ) ( not ( = ?auto_701965 ?auto_701968 ) ) ( not ( = ?auto_701965 ?auto_701969 ) ) ( not ( = ?auto_701965 ?auto_701970 ) ) ( not ( = ?auto_701965 ?auto_701971 ) ) ( not ( = ?auto_701965 ?auto_701972 ) ) ( not ( = ?auto_701965 ?auto_701973 ) ) ( not ( = ?auto_701965 ?auto_701974 ) ) ( not ( = ?auto_701965 ?auto_701975 ) ) ( not ( = ?auto_701965 ?auto_701976 ) ) ( not ( = ?auto_701965 ?auto_701977 ) ) ( not ( = ?auto_701965 ?auto_701978 ) ) ( not ( = ?auto_701965 ?auto_701979 ) ) ( not ( = ?auto_701966 ?auto_701967 ) ) ( not ( = ?auto_701966 ?auto_701968 ) ) ( not ( = ?auto_701966 ?auto_701969 ) ) ( not ( = ?auto_701966 ?auto_701970 ) ) ( not ( = ?auto_701966 ?auto_701971 ) ) ( not ( = ?auto_701966 ?auto_701972 ) ) ( not ( = ?auto_701966 ?auto_701973 ) ) ( not ( = ?auto_701966 ?auto_701974 ) ) ( not ( = ?auto_701966 ?auto_701975 ) ) ( not ( = ?auto_701966 ?auto_701976 ) ) ( not ( = ?auto_701966 ?auto_701977 ) ) ( not ( = ?auto_701966 ?auto_701978 ) ) ( not ( = ?auto_701966 ?auto_701979 ) ) ( not ( = ?auto_701967 ?auto_701968 ) ) ( not ( = ?auto_701967 ?auto_701969 ) ) ( not ( = ?auto_701967 ?auto_701970 ) ) ( not ( = ?auto_701967 ?auto_701971 ) ) ( not ( = ?auto_701967 ?auto_701972 ) ) ( not ( = ?auto_701967 ?auto_701973 ) ) ( not ( = ?auto_701967 ?auto_701974 ) ) ( not ( = ?auto_701967 ?auto_701975 ) ) ( not ( = ?auto_701967 ?auto_701976 ) ) ( not ( = ?auto_701967 ?auto_701977 ) ) ( not ( = ?auto_701967 ?auto_701978 ) ) ( not ( = ?auto_701967 ?auto_701979 ) ) ( not ( = ?auto_701968 ?auto_701969 ) ) ( not ( = ?auto_701968 ?auto_701970 ) ) ( not ( = ?auto_701968 ?auto_701971 ) ) ( not ( = ?auto_701968 ?auto_701972 ) ) ( not ( = ?auto_701968 ?auto_701973 ) ) ( not ( = ?auto_701968 ?auto_701974 ) ) ( not ( = ?auto_701968 ?auto_701975 ) ) ( not ( = ?auto_701968 ?auto_701976 ) ) ( not ( = ?auto_701968 ?auto_701977 ) ) ( not ( = ?auto_701968 ?auto_701978 ) ) ( not ( = ?auto_701968 ?auto_701979 ) ) ( not ( = ?auto_701969 ?auto_701970 ) ) ( not ( = ?auto_701969 ?auto_701971 ) ) ( not ( = ?auto_701969 ?auto_701972 ) ) ( not ( = ?auto_701969 ?auto_701973 ) ) ( not ( = ?auto_701969 ?auto_701974 ) ) ( not ( = ?auto_701969 ?auto_701975 ) ) ( not ( = ?auto_701969 ?auto_701976 ) ) ( not ( = ?auto_701969 ?auto_701977 ) ) ( not ( = ?auto_701969 ?auto_701978 ) ) ( not ( = ?auto_701969 ?auto_701979 ) ) ( not ( = ?auto_701970 ?auto_701971 ) ) ( not ( = ?auto_701970 ?auto_701972 ) ) ( not ( = ?auto_701970 ?auto_701973 ) ) ( not ( = ?auto_701970 ?auto_701974 ) ) ( not ( = ?auto_701970 ?auto_701975 ) ) ( not ( = ?auto_701970 ?auto_701976 ) ) ( not ( = ?auto_701970 ?auto_701977 ) ) ( not ( = ?auto_701970 ?auto_701978 ) ) ( not ( = ?auto_701970 ?auto_701979 ) ) ( not ( = ?auto_701971 ?auto_701972 ) ) ( not ( = ?auto_701971 ?auto_701973 ) ) ( not ( = ?auto_701971 ?auto_701974 ) ) ( not ( = ?auto_701971 ?auto_701975 ) ) ( not ( = ?auto_701971 ?auto_701976 ) ) ( not ( = ?auto_701971 ?auto_701977 ) ) ( not ( = ?auto_701971 ?auto_701978 ) ) ( not ( = ?auto_701971 ?auto_701979 ) ) ( not ( = ?auto_701972 ?auto_701973 ) ) ( not ( = ?auto_701972 ?auto_701974 ) ) ( not ( = ?auto_701972 ?auto_701975 ) ) ( not ( = ?auto_701972 ?auto_701976 ) ) ( not ( = ?auto_701972 ?auto_701977 ) ) ( not ( = ?auto_701972 ?auto_701978 ) ) ( not ( = ?auto_701972 ?auto_701979 ) ) ( not ( = ?auto_701973 ?auto_701974 ) ) ( not ( = ?auto_701973 ?auto_701975 ) ) ( not ( = ?auto_701973 ?auto_701976 ) ) ( not ( = ?auto_701973 ?auto_701977 ) ) ( not ( = ?auto_701973 ?auto_701978 ) ) ( not ( = ?auto_701973 ?auto_701979 ) ) ( not ( = ?auto_701974 ?auto_701975 ) ) ( not ( = ?auto_701974 ?auto_701976 ) ) ( not ( = ?auto_701974 ?auto_701977 ) ) ( not ( = ?auto_701974 ?auto_701978 ) ) ( not ( = ?auto_701974 ?auto_701979 ) ) ( not ( = ?auto_701975 ?auto_701976 ) ) ( not ( = ?auto_701975 ?auto_701977 ) ) ( not ( = ?auto_701975 ?auto_701978 ) ) ( not ( = ?auto_701975 ?auto_701979 ) ) ( not ( = ?auto_701976 ?auto_701977 ) ) ( not ( = ?auto_701976 ?auto_701978 ) ) ( not ( = ?auto_701976 ?auto_701979 ) ) ( not ( = ?auto_701977 ?auto_701978 ) ) ( not ( = ?auto_701977 ?auto_701979 ) ) ( not ( = ?auto_701978 ?auto_701979 ) ) ( ON ?auto_701978 ?auto_701979 ) ( ON ?auto_701977 ?auto_701978 ) ( ON ?auto_701976 ?auto_701977 ) ( ON ?auto_701975 ?auto_701976 ) ( ON ?auto_701974 ?auto_701975 ) ( ON ?auto_701973 ?auto_701974 ) ( ON ?auto_701972 ?auto_701973 ) ( ON ?auto_701971 ?auto_701972 ) ( ON ?auto_701970 ?auto_701971 ) ( ON ?auto_701969 ?auto_701970 ) ( CLEAR ?auto_701967 ) ( ON ?auto_701968 ?auto_701969 ) ( CLEAR ?auto_701968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_701963 ?auto_701964 ?auto_701965 ?auto_701966 ?auto_701967 ?auto_701968 )
      ( MAKE-17PILE ?auto_701963 ?auto_701964 ?auto_701965 ?auto_701966 ?auto_701967 ?auto_701968 ?auto_701969 ?auto_701970 ?auto_701971 ?auto_701972 ?auto_701973 ?auto_701974 ?auto_701975 ?auto_701976 ?auto_701977 ?auto_701978 ?auto_701979 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_701997 - BLOCK
      ?auto_701998 - BLOCK
      ?auto_701999 - BLOCK
      ?auto_702000 - BLOCK
      ?auto_702001 - BLOCK
      ?auto_702002 - BLOCK
      ?auto_702003 - BLOCK
      ?auto_702004 - BLOCK
      ?auto_702005 - BLOCK
      ?auto_702006 - BLOCK
      ?auto_702007 - BLOCK
      ?auto_702008 - BLOCK
      ?auto_702009 - BLOCK
      ?auto_702010 - BLOCK
      ?auto_702011 - BLOCK
      ?auto_702012 - BLOCK
      ?auto_702013 - BLOCK
    )
    :vars
    (
      ?auto_702014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702013 ?auto_702014 ) ( ON-TABLE ?auto_701997 ) ( ON ?auto_701998 ?auto_701997 ) ( ON ?auto_701999 ?auto_701998 ) ( ON ?auto_702000 ?auto_701999 ) ( not ( = ?auto_701997 ?auto_701998 ) ) ( not ( = ?auto_701997 ?auto_701999 ) ) ( not ( = ?auto_701997 ?auto_702000 ) ) ( not ( = ?auto_701997 ?auto_702001 ) ) ( not ( = ?auto_701997 ?auto_702002 ) ) ( not ( = ?auto_701997 ?auto_702003 ) ) ( not ( = ?auto_701997 ?auto_702004 ) ) ( not ( = ?auto_701997 ?auto_702005 ) ) ( not ( = ?auto_701997 ?auto_702006 ) ) ( not ( = ?auto_701997 ?auto_702007 ) ) ( not ( = ?auto_701997 ?auto_702008 ) ) ( not ( = ?auto_701997 ?auto_702009 ) ) ( not ( = ?auto_701997 ?auto_702010 ) ) ( not ( = ?auto_701997 ?auto_702011 ) ) ( not ( = ?auto_701997 ?auto_702012 ) ) ( not ( = ?auto_701997 ?auto_702013 ) ) ( not ( = ?auto_701997 ?auto_702014 ) ) ( not ( = ?auto_701998 ?auto_701999 ) ) ( not ( = ?auto_701998 ?auto_702000 ) ) ( not ( = ?auto_701998 ?auto_702001 ) ) ( not ( = ?auto_701998 ?auto_702002 ) ) ( not ( = ?auto_701998 ?auto_702003 ) ) ( not ( = ?auto_701998 ?auto_702004 ) ) ( not ( = ?auto_701998 ?auto_702005 ) ) ( not ( = ?auto_701998 ?auto_702006 ) ) ( not ( = ?auto_701998 ?auto_702007 ) ) ( not ( = ?auto_701998 ?auto_702008 ) ) ( not ( = ?auto_701998 ?auto_702009 ) ) ( not ( = ?auto_701998 ?auto_702010 ) ) ( not ( = ?auto_701998 ?auto_702011 ) ) ( not ( = ?auto_701998 ?auto_702012 ) ) ( not ( = ?auto_701998 ?auto_702013 ) ) ( not ( = ?auto_701998 ?auto_702014 ) ) ( not ( = ?auto_701999 ?auto_702000 ) ) ( not ( = ?auto_701999 ?auto_702001 ) ) ( not ( = ?auto_701999 ?auto_702002 ) ) ( not ( = ?auto_701999 ?auto_702003 ) ) ( not ( = ?auto_701999 ?auto_702004 ) ) ( not ( = ?auto_701999 ?auto_702005 ) ) ( not ( = ?auto_701999 ?auto_702006 ) ) ( not ( = ?auto_701999 ?auto_702007 ) ) ( not ( = ?auto_701999 ?auto_702008 ) ) ( not ( = ?auto_701999 ?auto_702009 ) ) ( not ( = ?auto_701999 ?auto_702010 ) ) ( not ( = ?auto_701999 ?auto_702011 ) ) ( not ( = ?auto_701999 ?auto_702012 ) ) ( not ( = ?auto_701999 ?auto_702013 ) ) ( not ( = ?auto_701999 ?auto_702014 ) ) ( not ( = ?auto_702000 ?auto_702001 ) ) ( not ( = ?auto_702000 ?auto_702002 ) ) ( not ( = ?auto_702000 ?auto_702003 ) ) ( not ( = ?auto_702000 ?auto_702004 ) ) ( not ( = ?auto_702000 ?auto_702005 ) ) ( not ( = ?auto_702000 ?auto_702006 ) ) ( not ( = ?auto_702000 ?auto_702007 ) ) ( not ( = ?auto_702000 ?auto_702008 ) ) ( not ( = ?auto_702000 ?auto_702009 ) ) ( not ( = ?auto_702000 ?auto_702010 ) ) ( not ( = ?auto_702000 ?auto_702011 ) ) ( not ( = ?auto_702000 ?auto_702012 ) ) ( not ( = ?auto_702000 ?auto_702013 ) ) ( not ( = ?auto_702000 ?auto_702014 ) ) ( not ( = ?auto_702001 ?auto_702002 ) ) ( not ( = ?auto_702001 ?auto_702003 ) ) ( not ( = ?auto_702001 ?auto_702004 ) ) ( not ( = ?auto_702001 ?auto_702005 ) ) ( not ( = ?auto_702001 ?auto_702006 ) ) ( not ( = ?auto_702001 ?auto_702007 ) ) ( not ( = ?auto_702001 ?auto_702008 ) ) ( not ( = ?auto_702001 ?auto_702009 ) ) ( not ( = ?auto_702001 ?auto_702010 ) ) ( not ( = ?auto_702001 ?auto_702011 ) ) ( not ( = ?auto_702001 ?auto_702012 ) ) ( not ( = ?auto_702001 ?auto_702013 ) ) ( not ( = ?auto_702001 ?auto_702014 ) ) ( not ( = ?auto_702002 ?auto_702003 ) ) ( not ( = ?auto_702002 ?auto_702004 ) ) ( not ( = ?auto_702002 ?auto_702005 ) ) ( not ( = ?auto_702002 ?auto_702006 ) ) ( not ( = ?auto_702002 ?auto_702007 ) ) ( not ( = ?auto_702002 ?auto_702008 ) ) ( not ( = ?auto_702002 ?auto_702009 ) ) ( not ( = ?auto_702002 ?auto_702010 ) ) ( not ( = ?auto_702002 ?auto_702011 ) ) ( not ( = ?auto_702002 ?auto_702012 ) ) ( not ( = ?auto_702002 ?auto_702013 ) ) ( not ( = ?auto_702002 ?auto_702014 ) ) ( not ( = ?auto_702003 ?auto_702004 ) ) ( not ( = ?auto_702003 ?auto_702005 ) ) ( not ( = ?auto_702003 ?auto_702006 ) ) ( not ( = ?auto_702003 ?auto_702007 ) ) ( not ( = ?auto_702003 ?auto_702008 ) ) ( not ( = ?auto_702003 ?auto_702009 ) ) ( not ( = ?auto_702003 ?auto_702010 ) ) ( not ( = ?auto_702003 ?auto_702011 ) ) ( not ( = ?auto_702003 ?auto_702012 ) ) ( not ( = ?auto_702003 ?auto_702013 ) ) ( not ( = ?auto_702003 ?auto_702014 ) ) ( not ( = ?auto_702004 ?auto_702005 ) ) ( not ( = ?auto_702004 ?auto_702006 ) ) ( not ( = ?auto_702004 ?auto_702007 ) ) ( not ( = ?auto_702004 ?auto_702008 ) ) ( not ( = ?auto_702004 ?auto_702009 ) ) ( not ( = ?auto_702004 ?auto_702010 ) ) ( not ( = ?auto_702004 ?auto_702011 ) ) ( not ( = ?auto_702004 ?auto_702012 ) ) ( not ( = ?auto_702004 ?auto_702013 ) ) ( not ( = ?auto_702004 ?auto_702014 ) ) ( not ( = ?auto_702005 ?auto_702006 ) ) ( not ( = ?auto_702005 ?auto_702007 ) ) ( not ( = ?auto_702005 ?auto_702008 ) ) ( not ( = ?auto_702005 ?auto_702009 ) ) ( not ( = ?auto_702005 ?auto_702010 ) ) ( not ( = ?auto_702005 ?auto_702011 ) ) ( not ( = ?auto_702005 ?auto_702012 ) ) ( not ( = ?auto_702005 ?auto_702013 ) ) ( not ( = ?auto_702005 ?auto_702014 ) ) ( not ( = ?auto_702006 ?auto_702007 ) ) ( not ( = ?auto_702006 ?auto_702008 ) ) ( not ( = ?auto_702006 ?auto_702009 ) ) ( not ( = ?auto_702006 ?auto_702010 ) ) ( not ( = ?auto_702006 ?auto_702011 ) ) ( not ( = ?auto_702006 ?auto_702012 ) ) ( not ( = ?auto_702006 ?auto_702013 ) ) ( not ( = ?auto_702006 ?auto_702014 ) ) ( not ( = ?auto_702007 ?auto_702008 ) ) ( not ( = ?auto_702007 ?auto_702009 ) ) ( not ( = ?auto_702007 ?auto_702010 ) ) ( not ( = ?auto_702007 ?auto_702011 ) ) ( not ( = ?auto_702007 ?auto_702012 ) ) ( not ( = ?auto_702007 ?auto_702013 ) ) ( not ( = ?auto_702007 ?auto_702014 ) ) ( not ( = ?auto_702008 ?auto_702009 ) ) ( not ( = ?auto_702008 ?auto_702010 ) ) ( not ( = ?auto_702008 ?auto_702011 ) ) ( not ( = ?auto_702008 ?auto_702012 ) ) ( not ( = ?auto_702008 ?auto_702013 ) ) ( not ( = ?auto_702008 ?auto_702014 ) ) ( not ( = ?auto_702009 ?auto_702010 ) ) ( not ( = ?auto_702009 ?auto_702011 ) ) ( not ( = ?auto_702009 ?auto_702012 ) ) ( not ( = ?auto_702009 ?auto_702013 ) ) ( not ( = ?auto_702009 ?auto_702014 ) ) ( not ( = ?auto_702010 ?auto_702011 ) ) ( not ( = ?auto_702010 ?auto_702012 ) ) ( not ( = ?auto_702010 ?auto_702013 ) ) ( not ( = ?auto_702010 ?auto_702014 ) ) ( not ( = ?auto_702011 ?auto_702012 ) ) ( not ( = ?auto_702011 ?auto_702013 ) ) ( not ( = ?auto_702011 ?auto_702014 ) ) ( not ( = ?auto_702012 ?auto_702013 ) ) ( not ( = ?auto_702012 ?auto_702014 ) ) ( not ( = ?auto_702013 ?auto_702014 ) ) ( ON ?auto_702012 ?auto_702013 ) ( ON ?auto_702011 ?auto_702012 ) ( ON ?auto_702010 ?auto_702011 ) ( ON ?auto_702009 ?auto_702010 ) ( ON ?auto_702008 ?auto_702009 ) ( ON ?auto_702007 ?auto_702008 ) ( ON ?auto_702006 ?auto_702007 ) ( ON ?auto_702005 ?auto_702006 ) ( ON ?auto_702004 ?auto_702005 ) ( ON ?auto_702003 ?auto_702004 ) ( ON ?auto_702002 ?auto_702003 ) ( CLEAR ?auto_702000 ) ( ON ?auto_702001 ?auto_702002 ) ( CLEAR ?auto_702001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_701997 ?auto_701998 ?auto_701999 ?auto_702000 ?auto_702001 )
      ( MAKE-17PILE ?auto_701997 ?auto_701998 ?auto_701999 ?auto_702000 ?auto_702001 ?auto_702002 ?auto_702003 ?auto_702004 ?auto_702005 ?auto_702006 ?auto_702007 ?auto_702008 ?auto_702009 ?auto_702010 ?auto_702011 ?auto_702012 ?auto_702013 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_702032 - BLOCK
      ?auto_702033 - BLOCK
      ?auto_702034 - BLOCK
      ?auto_702035 - BLOCK
      ?auto_702036 - BLOCK
      ?auto_702037 - BLOCK
      ?auto_702038 - BLOCK
      ?auto_702039 - BLOCK
      ?auto_702040 - BLOCK
      ?auto_702041 - BLOCK
      ?auto_702042 - BLOCK
      ?auto_702043 - BLOCK
      ?auto_702044 - BLOCK
      ?auto_702045 - BLOCK
      ?auto_702046 - BLOCK
      ?auto_702047 - BLOCK
      ?auto_702048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_702048 ) ( ON-TABLE ?auto_702032 ) ( ON ?auto_702033 ?auto_702032 ) ( ON ?auto_702034 ?auto_702033 ) ( ON ?auto_702035 ?auto_702034 ) ( not ( = ?auto_702032 ?auto_702033 ) ) ( not ( = ?auto_702032 ?auto_702034 ) ) ( not ( = ?auto_702032 ?auto_702035 ) ) ( not ( = ?auto_702032 ?auto_702036 ) ) ( not ( = ?auto_702032 ?auto_702037 ) ) ( not ( = ?auto_702032 ?auto_702038 ) ) ( not ( = ?auto_702032 ?auto_702039 ) ) ( not ( = ?auto_702032 ?auto_702040 ) ) ( not ( = ?auto_702032 ?auto_702041 ) ) ( not ( = ?auto_702032 ?auto_702042 ) ) ( not ( = ?auto_702032 ?auto_702043 ) ) ( not ( = ?auto_702032 ?auto_702044 ) ) ( not ( = ?auto_702032 ?auto_702045 ) ) ( not ( = ?auto_702032 ?auto_702046 ) ) ( not ( = ?auto_702032 ?auto_702047 ) ) ( not ( = ?auto_702032 ?auto_702048 ) ) ( not ( = ?auto_702033 ?auto_702034 ) ) ( not ( = ?auto_702033 ?auto_702035 ) ) ( not ( = ?auto_702033 ?auto_702036 ) ) ( not ( = ?auto_702033 ?auto_702037 ) ) ( not ( = ?auto_702033 ?auto_702038 ) ) ( not ( = ?auto_702033 ?auto_702039 ) ) ( not ( = ?auto_702033 ?auto_702040 ) ) ( not ( = ?auto_702033 ?auto_702041 ) ) ( not ( = ?auto_702033 ?auto_702042 ) ) ( not ( = ?auto_702033 ?auto_702043 ) ) ( not ( = ?auto_702033 ?auto_702044 ) ) ( not ( = ?auto_702033 ?auto_702045 ) ) ( not ( = ?auto_702033 ?auto_702046 ) ) ( not ( = ?auto_702033 ?auto_702047 ) ) ( not ( = ?auto_702033 ?auto_702048 ) ) ( not ( = ?auto_702034 ?auto_702035 ) ) ( not ( = ?auto_702034 ?auto_702036 ) ) ( not ( = ?auto_702034 ?auto_702037 ) ) ( not ( = ?auto_702034 ?auto_702038 ) ) ( not ( = ?auto_702034 ?auto_702039 ) ) ( not ( = ?auto_702034 ?auto_702040 ) ) ( not ( = ?auto_702034 ?auto_702041 ) ) ( not ( = ?auto_702034 ?auto_702042 ) ) ( not ( = ?auto_702034 ?auto_702043 ) ) ( not ( = ?auto_702034 ?auto_702044 ) ) ( not ( = ?auto_702034 ?auto_702045 ) ) ( not ( = ?auto_702034 ?auto_702046 ) ) ( not ( = ?auto_702034 ?auto_702047 ) ) ( not ( = ?auto_702034 ?auto_702048 ) ) ( not ( = ?auto_702035 ?auto_702036 ) ) ( not ( = ?auto_702035 ?auto_702037 ) ) ( not ( = ?auto_702035 ?auto_702038 ) ) ( not ( = ?auto_702035 ?auto_702039 ) ) ( not ( = ?auto_702035 ?auto_702040 ) ) ( not ( = ?auto_702035 ?auto_702041 ) ) ( not ( = ?auto_702035 ?auto_702042 ) ) ( not ( = ?auto_702035 ?auto_702043 ) ) ( not ( = ?auto_702035 ?auto_702044 ) ) ( not ( = ?auto_702035 ?auto_702045 ) ) ( not ( = ?auto_702035 ?auto_702046 ) ) ( not ( = ?auto_702035 ?auto_702047 ) ) ( not ( = ?auto_702035 ?auto_702048 ) ) ( not ( = ?auto_702036 ?auto_702037 ) ) ( not ( = ?auto_702036 ?auto_702038 ) ) ( not ( = ?auto_702036 ?auto_702039 ) ) ( not ( = ?auto_702036 ?auto_702040 ) ) ( not ( = ?auto_702036 ?auto_702041 ) ) ( not ( = ?auto_702036 ?auto_702042 ) ) ( not ( = ?auto_702036 ?auto_702043 ) ) ( not ( = ?auto_702036 ?auto_702044 ) ) ( not ( = ?auto_702036 ?auto_702045 ) ) ( not ( = ?auto_702036 ?auto_702046 ) ) ( not ( = ?auto_702036 ?auto_702047 ) ) ( not ( = ?auto_702036 ?auto_702048 ) ) ( not ( = ?auto_702037 ?auto_702038 ) ) ( not ( = ?auto_702037 ?auto_702039 ) ) ( not ( = ?auto_702037 ?auto_702040 ) ) ( not ( = ?auto_702037 ?auto_702041 ) ) ( not ( = ?auto_702037 ?auto_702042 ) ) ( not ( = ?auto_702037 ?auto_702043 ) ) ( not ( = ?auto_702037 ?auto_702044 ) ) ( not ( = ?auto_702037 ?auto_702045 ) ) ( not ( = ?auto_702037 ?auto_702046 ) ) ( not ( = ?auto_702037 ?auto_702047 ) ) ( not ( = ?auto_702037 ?auto_702048 ) ) ( not ( = ?auto_702038 ?auto_702039 ) ) ( not ( = ?auto_702038 ?auto_702040 ) ) ( not ( = ?auto_702038 ?auto_702041 ) ) ( not ( = ?auto_702038 ?auto_702042 ) ) ( not ( = ?auto_702038 ?auto_702043 ) ) ( not ( = ?auto_702038 ?auto_702044 ) ) ( not ( = ?auto_702038 ?auto_702045 ) ) ( not ( = ?auto_702038 ?auto_702046 ) ) ( not ( = ?auto_702038 ?auto_702047 ) ) ( not ( = ?auto_702038 ?auto_702048 ) ) ( not ( = ?auto_702039 ?auto_702040 ) ) ( not ( = ?auto_702039 ?auto_702041 ) ) ( not ( = ?auto_702039 ?auto_702042 ) ) ( not ( = ?auto_702039 ?auto_702043 ) ) ( not ( = ?auto_702039 ?auto_702044 ) ) ( not ( = ?auto_702039 ?auto_702045 ) ) ( not ( = ?auto_702039 ?auto_702046 ) ) ( not ( = ?auto_702039 ?auto_702047 ) ) ( not ( = ?auto_702039 ?auto_702048 ) ) ( not ( = ?auto_702040 ?auto_702041 ) ) ( not ( = ?auto_702040 ?auto_702042 ) ) ( not ( = ?auto_702040 ?auto_702043 ) ) ( not ( = ?auto_702040 ?auto_702044 ) ) ( not ( = ?auto_702040 ?auto_702045 ) ) ( not ( = ?auto_702040 ?auto_702046 ) ) ( not ( = ?auto_702040 ?auto_702047 ) ) ( not ( = ?auto_702040 ?auto_702048 ) ) ( not ( = ?auto_702041 ?auto_702042 ) ) ( not ( = ?auto_702041 ?auto_702043 ) ) ( not ( = ?auto_702041 ?auto_702044 ) ) ( not ( = ?auto_702041 ?auto_702045 ) ) ( not ( = ?auto_702041 ?auto_702046 ) ) ( not ( = ?auto_702041 ?auto_702047 ) ) ( not ( = ?auto_702041 ?auto_702048 ) ) ( not ( = ?auto_702042 ?auto_702043 ) ) ( not ( = ?auto_702042 ?auto_702044 ) ) ( not ( = ?auto_702042 ?auto_702045 ) ) ( not ( = ?auto_702042 ?auto_702046 ) ) ( not ( = ?auto_702042 ?auto_702047 ) ) ( not ( = ?auto_702042 ?auto_702048 ) ) ( not ( = ?auto_702043 ?auto_702044 ) ) ( not ( = ?auto_702043 ?auto_702045 ) ) ( not ( = ?auto_702043 ?auto_702046 ) ) ( not ( = ?auto_702043 ?auto_702047 ) ) ( not ( = ?auto_702043 ?auto_702048 ) ) ( not ( = ?auto_702044 ?auto_702045 ) ) ( not ( = ?auto_702044 ?auto_702046 ) ) ( not ( = ?auto_702044 ?auto_702047 ) ) ( not ( = ?auto_702044 ?auto_702048 ) ) ( not ( = ?auto_702045 ?auto_702046 ) ) ( not ( = ?auto_702045 ?auto_702047 ) ) ( not ( = ?auto_702045 ?auto_702048 ) ) ( not ( = ?auto_702046 ?auto_702047 ) ) ( not ( = ?auto_702046 ?auto_702048 ) ) ( not ( = ?auto_702047 ?auto_702048 ) ) ( ON ?auto_702047 ?auto_702048 ) ( ON ?auto_702046 ?auto_702047 ) ( ON ?auto_702045 ?auto_702046 ) ( ON ?auto_702044 ?auto_702045 ) ( ON ?auto_702043 ?auto_702044 ) ( ON ?auto_702042 ?auto_702043 ) ( ON ?auto_702041 ?auto_702042 ) ( ON ?auto_702040 ?auto_702041 ) ( ON ?auto_702039 ?auto_702040 ) ( ON ?auto_702038 ?auto_702039 ) ( ON ?auto_702037 ?auto_702038 ) ( CLEAR ?auto_702035 ) ( ON ?auto_702036 ?auto_702037 ) ( CLEAR ?auto_702036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_702032 ?auto_702033 ?auto_702034 ?auto_702035 ?auto_702036 )
      ( MAKE-17PILE ?auto_702032 ?auto_702033 ?auto_702034 ?auto_702035 ?auto_702036 ?auto_702037 ?auto_702038 ?auto_702039 ?auto_702040 ?auto_702041 ?auto_702042 ?auto_702043 ?auto_702044 ?auto_702045 ?auto_702046 ?auto_702047 ?auto_702048 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_702066 - BLOCK
      ?auto_702067 - BLOCK
      ?auto_702068 - BLOCK
      ?auto_702069 - BLOCK
      ?auto_702070 - BLOCK
      ?auto_702071 - BLOCK
      ?auto_702072 - BLOCK
      ?auto_702073 - BLOCK
      ?auto_702074 - BLOCK
      ?auto_702075 - BLOCK
      ?auto_702076 - BLOCK
      ?auto_702077 - BLOCK
      ?auto_702078 - BLOCK
      ?auto_702079 - BLOCK
      ?auto_702080 - BLOCK
      ?auto_702081 - BLOCK
      ?auto_702082 - BLOCK
    )
    :vars
    (
      ?auto_702083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702082 ?auto_702083 ) ( ON-TABLE ?auto_702066 ) ( ON ?auto_702067 ?auto_702066 ) ( ON ?auto_702068 ?auto_702067 ) ( not ( = ?auto_702066 ?auto_702067 ) ) ( not ( = ?auto_702066 ?auto_702068 ) ) ( not ( = ?auto_702066 ?auto_702069 ) ) ( not ( = ?auto_702066 ?auto_702070 ) ) ( not ( = ?auto_702066 ?auto_702071 ) ) ( not ( = ?auto_702066 ?auto_702072 ) ) ( not ( = ?auto_702066 ?auto_702073 ) ) ( not ( = ?auto_702066 ?auto_702074 ) ) ( not ( = ?auto_702066 ?auto_702075 ) ) ( not ( = ?auto_702066 ?auto_702076 ) ) ( not ( = ?auto_702066 ?auto_702077 ) ) ( not ( = ?auto_702066 ?auto_702078 ) ) ( not ( = ?auto_702066 ?auto_702079 ) ) ( not ( = ?auto_702066 ?auto_702080 ) ) ( not ( = ?auto_702066 ?auto_702081 ) ) ( not ( = ?auto_702066 ?auto_702082 ) ) ( not ( = ?auto_702066 ?auto_702083 ) ) ( not ( = ?auto_702067 ?auto_702068 ) ) ( not ( = ?auto_702067 ?auto_702069 ) ) ( not ( = ?auto_702067 ?auto_702070 ) ) ( not ( = ?auto_702067 ?auto_702071 ) ) ( not ( = ?auto_702067 ?auto_702072 ) ) ( not ( = ?auto_702067 ?auto_702073 ) ) ( not ( = ?auto_702067 ?auto_702074 ) ) ( not ( = ?auto_702067 ?auto_702075 ) ) ( not ( = ?auto_702067 ?auto_702076 ) ) ( not ( = ?auto_702067 ?auto_702077 ) ) ( not ( = ?auto_702067 ?auto_702078 ) ) ( not ( = ?auto_702067 ?auto_702079 ) ) ( not ( = ?auto_702067 ?auto_702080 ) ) ( not ( = ?auto_702067 ?auto_702081 ) ) ( not ( = ?auto_702067 ?auto_702082 ) ) ( not ( = ?auto_702067 ?auto_702083 ) ) ( not ( = ?auto_702068 ?auto_702069 ) ) ( not ( = ?auto_702068 ?auto_702070 ) ) ( not ( = ?auto_702068 ?auto_702071 ) ) ( not ( = ?auto_702068 ?auto_702072 ) ) ( not ( = ?auto_702068 ?auto_702073 ) ) ( not ( = ?auto_702068 ?auto_702074 ) ) ( not ( = ?auto_702068 ?auto_702075 ) ) ( not ( = ?auto_702068 ?auto_702076 ) ) ( not ( = ?auto_702068 ?auto_702077 ) ) ( not ( = ?auto_702068 ?auto_702078 ) ) ( not ( = ?auto_702068 ?auto_702079 ) ) ( not ( = ?auto_702068 ?auto_702080 ) ) ( not ( = ?auto_702068 ?auto_702081 ) ) ( not ( = ?auto_702068 ?auto_702082 ) ) ( not ( = ?auto_702068 ?auto_702083 ) ) ( not ( = ?auto_702069 ?auto_702070 ) ) ( not ( = ?auto_702069 ?auto_702071 ) ) ( not ( = ?auto_702069 ?auto_702072 ) ) ( not ( = ?auto_702069 ?auto_702073 ) ) ( not ( = ?auto_702069 ?auto_702074 ) ) ( not ( = ?auto_702069 ?auto_702075 ) ) ( not ( = ?auto_702069 ?auto_702076 ) ) ( not ( = ?auto_702069 ?auto_702077 ) ) ( not ( = ?auto_702069 ?auto_702078 ) ) ( not ( = ?auto_702069 ?auto_702079 ) ) ( not ( = ?auto_702069 ?auto_702080 ) ) ( not ( = ?auto_702069 ?auto_702081 ) ) ( not ( = ?auto_702069 ?auto_702082 ) ) ( not ( = ?auto_702069 ?auto_702083 ) ) ( not ( = ?auto_702070 ?auto_702071 ) ) ( not ( = ?auto_702070 ?auto_702072 ) ) ( not ( = ?auto_702070 ?auto_702073 ) ) ( not ( = ?auto_702070 ?auto_702074 ) ) ( not ( = ?auto_702070 ?auto_702075 ) ) ( not ( = ?auto_702070 ?auto_702076 ) ) ( not ( = ?auto_702070 ?auto_702077 ) ) ( not ( = ?auto_702070 ?auto_702078 ) ) ( not ( = ?auto_702070 ?auto_702079 ) ) ( not ( = ?auto_702070 ?auto_702080 ) ) ( not ( = ?auto_702070 ?auto_702081 ) ) ( not ( = ?auto_702070 ?auto_702082 ) ) ( not ( = ?auto_702070 ?auto_702083 ) ) ( not ( = ?auto_702071 ?auto_702072 ) ) ( not ( = ?auto_702071 ?auto_702073 ) ) ( not ( = ?auto_702071 ?auto_702074 ) ) ( not ( = ?auto_702071 ?auto_702075 ) ) ( not ( = ?auto_702071 ?auto_702076 ) ) ( not ( = ?auto_702071 ?auto_702077 ) ) ( not ( = ?auto_702071 ?auto_702078 ) ) ( not ( = ?auto_702071 ?auto_702079 ) ) ( not ( = ?auto_702071 ?auto_702080 ) ) ( not ( = ?auto_702071 ?auto_702081 ) ) ( not ( = ?auto_702071 ?auto_702082 ) ) ( not ( = ?auto_702071 ?auto_702083 ) ) ( not ( = ?auto_702072 ?auto_702073 ) ) ( not ( = ?auto_702072 ?auto_702074 ) ) ( not ( = ?auto_702072 ?auto_702075 ) ) ( not ( = ?auto_702072 ?auto_702076 ) ) ( not ( = ?auto_702072 ?auto_702077 ) ) ( not ( = ?auto_702072 ?auto_702078 ) ) ( not ( = ?auto_702072 ?auto_702079 ) ) ( not ( = ?auto_702072 ?auto_702080 ) ) ( not ( = ?auto_702072 ?auto_702081 ) ) ( not ( = ?auto_702072 ?auto_702082 ) ) ( not ( = ?auto_702072 ?auto_702083 ) ) ( not ( = ?auto_702073 ?auto_702074 ) ) ( not ( = ?auto_702073 ?auto_702075 ) ) ( not ( = ?auto_702073 ?auto_702076 ) ) ( not ( = ?auto_702073 ?auto_702077 ) ) ( not ( = ?auto_702073 ?auto_702078 ) ) ( not ( = ?auto_702073 ?auto_702079 ) ) ( not ( = ?auto_702073 ?auto_702080 ) ) ( not ( = ?auto_702073 ?auto_702081 ) ) ( not ( = ?auto_702073 ?auto_702082 ) ) ( not ( = ?auto_702073 ?auto_702083 ) ) ( not ( = ?auto_702074 ?auto_702075 ) ) ( not ( = ?auto_702074 ?auto_702076 ) ) ( not ( = ?auto_702074 ?auto_702077 ) ) ( not ( = ?auto_702074 ?auto_702078 ) ) ( not ( = ?auto_702074 ?auto_702079 ) ) ( not ( = ?auto_702074 ?auto_702080 ) ) ( not ( = ?auto_702074 ?auto_702081 ) ) ( not ( = ?auto_702074 ?auto_702082 ) ) ( not ( = ?auto_702074 ?auto_702083 ) ) ( not ( = ?auto_702075 ?auto_702076 ) ) ( not ( = ?auto_702075 ?auto_702077 ) ) ( not ( = ?auto_702075 ?auto_702078 ) ) ( not ( = ?auto_702075 ?auto_702079 ) ) ( not ( = ?auto_702075 ?auto_702080 ) ) ( not ( = ?auto_702075 ?auto_702081 ) ) ( not ( = ?auto_702075 ?auto_702082 ) ) ( not ( = ?auto_702075 ?auto_702083 ) ) ( not ( = ?auto_702076 ?auto_702077 ) ) ( not ( = ?auto_702076 ?auto_702078 ) ) ( not ( = ?auto_702076 ?auto_702079 ) ) ( not ( = ?auto_702076 ?auto_702080 ) ) ( not ( = ?auto_702076 ?auto_702081 ) ) ( not ( = ?auto_702076 ?auto_702082 ) ) ( not ( = ?auto_702076 ?auto_702083 ) ) ( not ( = ?auto_702077 ?auto_702078 ) ) ( not ( = ?auto_702077 ?auto_702079 ) ) ( not ( = ?auto_702077 ?auto_702080 ) ) ( not ( = ?auto_702077 ?auto_702081 ) ) ( not ( = ?auto_702077 ?auto_702082 ) ) ( not ( = ?auto_702077 ?auto_702083 ) ) ( not ( = ?auto_702078 ?auto_702079 ) ) ( not ( = ?auto_702078 ?auto_702080 ) ) ( not ( = ?auto_702078 ?auto_702081 ) ) ( not ( = ?auto_702078 ?auto_702082 ) ) ( not ( = ?auto_702078 ?auto_702083 ) ) ( not ( = ?auto_702079 ?auto_702080 ) ) ( not ( = ?auto_702079 ?auto_702081 ) ) ( not ( = ?auto_702079 ?auto_702082 ) ) ( not ( = ?auto_702079 ?auto_702083 ) ) ( not ( = ?auto_702080 ?auto_702081 ) ) ( not ( = ?auto_702080 ?auto_702082 ) ) ( not ( = ?auto_702080 ?auto_702083 ) ) ( not ( = ?auto_702081 ?auto_702082 ) ) ( not ( = ?auto_702081 ?auto_702083 ) ) ( not ( = ?auto_702082 ?auto_702083 ) ) ( ON ?auto_702081 ?auto_702082 ) ( ON ?auto_702080 ?auto_702081 ) ( ON ?auto_702079 ?auto_702080 ) ( ON ?auto_702078 ?auto_702079 ) ( ON ?auto_702077 ?auto_702078 ) ( ON ?auto_702076 ?auto_702077 ) ( ON ?auto_702075 ?auto_702076 ) ( ON ?auto_702074 ?auto_702075 ) ( ON ?auto_702073 ?auto_702074 ) ( ON ?auto_702072 ?auto_702073 ) ( ON ?auto_702071 ?auto_702072 ) ( ON ?auto_702070 ?auto_702071 ) ( CLEAR ?auto_702068 ) ( ON ?auto_702069 ?auto_702070 ) ( CLEAR ?auto_702069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_702066 ?auto_702067 ?auto_702068 ?auto_702069 )
      ( MAKE-17PILE ?auto_702066 ?auto_702067 ?auto_702068 ?auto_702069 ?auto_702070 ?auto_702071 ?auto_702072 ?auto_702073 ?auto_702074 ?auto_702075 ?auto_702076 ?auto_702077 ?auto_702078 ?auto_702079 ?auto_702080 ?auto_702081 ?auto_702082 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_702101 - BLOCK
      ?auto_702102 - BLOCK
      ?auto_702103 - BLOCK
      ?auto_702104 - BLOCK
      ?auto_702105 - BLOCK
      ?auto_702106 - BLOCK
      ?auto_702107 - BLOCK
      ?auto_702108 - BLOCK
      ?auto_702109 - BLOCK
      ?auto_702110 - BLOCK
      ?auto_702111 - BLOCK
      ?auto_702112 - BLOCK
      ?auto_702113 - BLOCK
      ?auto_702114 - BLOCK
      ?auto_702115 - BLOCK
      ?auto_702116 - BLOCK
      ?auto_702117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_702117 ) ( ON-TABLE ?auto_702101 ) ( ON ?auto_702102 ?auto_702101 ) ( ON ?auto_702103 ?auto_702102 ) ( not ( = ?auto_702101 ?auto_702102 ) ) ( not ( = ?auto_702101 ?auto_702103 ) ) ( not ( = ?auto_702101 ?auto_702104 ) ) ( not ( = ?auto_702101 ?auto_702105 ) ) ( not ( = ?auto_702101 ?auto_702106 ) ) ( not ( = ?auto_702101 ?auto_702107 ) ) ( not ( = ?auto_702101 ?auto_702108 ) ) ( not ( = ?auto_702101 ?auto_702109 ) ) ( not ( = ?auto_702101 ?auto_702110 ) ) ( not ( = ?auto_702101 ?auto_702111 ) ) ( not ( = ?auto_702101 ?auto_702112 ) ) ( not ( = ?auto_702101 ?auto_702113 ) ) ( not ( = ?auto_702101 ?auto_702114 ) ) ( not ( = ?auto_702101 ?auto_702115 ) ) ( not ( = ?auto_702101 ?auto_702116 ) ) ( not ( = ?auto_702101 ?auto_702117 ) ) ( not ( = ?auto_702102 ?auto_702103 ) ) ( not ( = ?auto_702102 ?auto_702104 ) ) ( not ( = ?auto_702102 ?auto_702105 ) ) ( not ( = ?auto_702102 ?auto_702106 ) ) ( not ( = ?auto_702102 ?auto_702107 ) ) ( not ( = ?auto_702102 ?auto_702108 ) ) ( not ( = ?auto_702102 ?auto_702109 ) ) ( not ( = ?auto_702102 ?auto_702110 ) ) ( not ( = ?auto_702102 ?auto_702111 ) ) ( not ( = ?auto_702102 ?auto_702112 ) ) ( not ( = ?auto_702102 ?auto_702113 ) ) ( not ( = ?auto_702102 ?auto_702114 ) ) ( not ( = ?auto_702102 ?auto_702115 ) ) ( not ( = ?auto_702102 ?auto_702116 ) ) ( not ( = ?auto_702102 ?auto_702117 ) ) ( not ( = ?auto_702103 ?auto_702104 ) ) ( not ( = ?auto_702103 ?auto_702105 ) ) ( not ( = ?auto_702103 ?auto_702106 ) ) ( not ( = ?auto_702103 ?auto_702107 ) ) ( not ( = ?auto_702103 ?auto_702108 ) ) ( not ( = ?auto_702103 ?auto_702109 ) ) ( not ( = ?auto_702103 ?auto_702110 ) ) ( not ( = ?auto_702103 ?auto_702111 ) ) ( not ( = ?auto_702103 ?auto_702112 ) ) ( not ( = ?auto_702103 ?auto_702113 ) ) ( not ( = ?auto_702103 ?auto_702114 ) ) ( not ( = ?auto_702103 ?auto_702115 ) ) ( not ( = ?auto_702103 ?auto_702116 ) ) ( not ( = ?auto_702103 ?auto_702117 ) ) ( not ( = ?auto_702104 ?auto_702105 ) ) ( not ( = ?auto_702104 ?auto_702106 ) ) ( not ( = ?auto_702104 ?auto_702107 ) ) ( not ( = ?auto_702104 ?auto_702108 ) ) ( not ( = ?auto_702104 ?auto_702109 ) ) ( not ( = ?auto_702104 ?auto_702110 ) ) ( not ( = ?auto_702104 ?auto_702111 ) ) ( not ( = ?auto_702104 ?auto_702112 ) ) ( not ( = ?auto_702104 ?auto_702113 ) ) ( not ( = ?auto_702104 ?auto_702114 ) ) ( not ( = ?auto_702104 ?auto_702115 ) ) ( not ( = ?auto_702104 ?auto_702116 ) ) ( not ( = ?auto_702104 ?auto_702117 ) ) ( not ( = ?auto_702105 ?auto_702106 ) ) ( not ( = ?auto_702105 ?auto_702107 ) ) ( not ( = ?auto_702105 ?auto_702108 ) ) ( not ( = ?auto_702105 ?auto_702109 ) ) ( not ( = ?auto_702105 ?auto_702110 ) ) ( not ( = ?auto_702105 ?auto_702111 ) ) ( not ( = ?auto_702105 ?auto_702112 ) ) ( not ( = ?auto_702105 ?auto_702113 ) ) ( not ( = ?auto_702105 ?auto_702114 ) ) ( not ( = ?auto_702105 ?auto_702115 ) ) ( not ( = ?auto_702105 ?auto_702116 ) ) ( not ( = ?auto_702105 ?auto_702117 ) ) ( not ( = ?auto_702106 ?auto_702107 ) ) ( not ( = ?auto_702106 ?auto_702108 ) ) ( not ( = ?auto_702106 ?auto_702109 ) ) ( not ( = ?auto_702106 ?auto_702110 ) ) ( not ( = ?auto_702106 ?auto_702111 ) ) ( not ( = ?auto_702106 ?auto_702112 ) ) ( not ( = ?auto_702106 ?auto_702113 ) ) ( not ( = ?auto_702106 ?auto_702114 ) ) ( not ( = ?auto_702106 ?auto_702115 ) ) ( not ( = ?auto_702106 ?auto_702116 ) ) ( not ( = ?auto_702106 ?auto_702117 ) ) ( not ( = ?auto_702107 ?auto_702108 ) ) ( not ( = ?auto_702107 ?auto_702109 ) ) ( not ( = ?auto_702107 ?auto_702110 ) ) ( not ( = ?auto_702107 ?auto_702111 ) ) ( not ( = ?auto_702107 ?auto_702112 ) ) ( not ( = ?auto_702107 ?auto_702113 ) ) ( not ( = ?auto_702107 ?auto_702114 ) ) ( not ( = ?auto_702107 ?auto_702115 ) ) ( not ( = ?auto_702107 ?auto_702116 ) ) ( not ( = ?auto_702107 ?auto_702117 ) ) ( not ( = ?auto_702108 ?auto_702109 ) ) ( not ( = ?auto_702108 ?auto_702110 ) ) ( not ( = ?auto_702108 ?auto_702111 ) ) ( not ( = ?auto_702108 ?auto_702112 ) ) ( not ( = ?auto_702108 ?auto_702113 ) ) ( not ( = ?auto_702108 ?auto_702114 ) ) ( not ( = ?auto_702108 ?auto_702115 ) ) ( not ( = ?auto_702108 ?auto_702116 ) ) ( not ( = ?auto_702108 ?auto_702117 ) ) ( not ( = ?auto_702109 ?auto_702110 ) ) ( not ( = ?auto_702109 ?auto_702111 ) ) ( not ( = ?auto_702109 ?auto_702112 ) ) ( not ( = ?auto_702109 ?auto_702113 ) ) ( not ( = ?auto_702109 ?auto_702114 ) ) ( not ( = ?auto_702109 ?auto_702115 ) ) ( not ( = ?auto_702109 ?auto_702116 ) ) ( not ( = ?auto_702109 ?auto_702117 ) ) ( not ( = ?auto_702110 ?auto_702111 ) ) ( not ( = ?auto_702110 ?auto_702112 ) ) ( not ( = ?auto_702110 ?auto_702113 ) ) ( not ( = ?auto_702110 ?auto_702114 ) ) ( not ( = ?auto_702110 ?auto_702115 ) ) ( not ( = ?auto_702110 ?auto_702116 ) ) ( not ( = ?auto_702110 ?auto_702117 ) ) ( not ( = ?auto_702111 ?auto_702112 ) ) ( not ( = ?auto_702111 ?auto_702113 ) ) ( not ( = ?auto_702111 ?auto_702114 ) ) ( not ( = ?auto_702111 ?auto_702115 ) ) ( not ( = ?auto_702111 ?auto_702116 ) ) ( not ( = ?auto_702111 ?auto_702117 ) ) ( not ( = ?auto_702112 ?auto_702113 ) ) ( not ( = ?auto_702112 ?auto_702114 ) ) ( not ( = ?auto_702112 ?auto_702115 ) ) ( not ( = ?auto_702112 ?auto_702116 ) ) ( not ( = ?auto_702112 ?auto_702117 ) ) ( not ( = ?auto_702113 ?auto_702114 ) ) ( not ( = ?auto_702113 ?auto_702115 ) ) ( not ( = ?auto_702113 ?auto_702116 ) ) ( not ( = ?auto_702113 ?auto_702117 ) ) ( not ( = ?auto_702114 ?auto_702115 ) ) ( not ( = ?auto_702114 ?auto_702116 ) ) ( not ( = ?auto_702114 ?auto_702117 ) ) ( not ( = ?auto_702115 ?auto_702116 ) ) ( not ( = ?auto_702115 ?auto_702117 ) ) ( not ( = ?auto_702116 ?auto_702117 ) ) ( ON ?auto_702116 ?auto_702117 ) ( ON ?auto_702115 ?auto_702116 ) ( ON ?auto_702114 ?auto_702115 ) ( ON ?auto_702113 ?auto_702114 ) ( ON ?auto_702112 ?auto_702113 ) ( ON ?auto_702111 ?auto_702112 ) ( ON ?auto_702110 ?auto_702111 ) ( ON ?auto_702109 ?auto_702110 ) ( ON ?auto_702108 ?auto_702109 ) ( ON ?auto_702107 ?auto_702108 ) ( ON ?auto_702106 ?auto_702107 ) ( ON ?auto_702105 ?auto_702106 ) ( CLEAR ?auto_702103 ) ( ON ?auto_702104 ?auto_702105 ) ( CLEAR ?auto_702104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_702101 ?auto_702102 ?auto_702103 ?auto_702104 )
      ( MAKE-17PILE ?auto_702101 ?auto_702102 ?auto_702103 ?auto_702104 ?auto_702105 ?auto_702106 ?auto_702107 ?auto_702108 ?auto_702109 ?auto_702110 ?auto_702111 ?auto_702112 ?auto_702113 ?auto_702114 ?auto_702115 ?auto_702116 ?auto_702117 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_702135 - BLOCK
      ?auto_702136 - BLOCK
      ?auto_702137 - BLOCK
      ?auto_702138 - BLOCK
      ?auto_702139 - BLOCK
      ?auto_702140 - BLOCK
      ?auto_702141 - BLOCK
      ?auto_702142 - BLOCK
      ?auto_702143 - BLOCK
      ?auto_702144 - BLOCK
      ?auto_702145 - BLOCK
      ?auto_702146 - BLOCK
      ?auto_702147 - BLOCK
      ?auto_702148 - BLOCK
      ?auto_702149 - BLOCK
      ?auto_702150 - BLOCK
      ?auto_702151 - BLOCK
    )
    :vars
    (
      ?auto_702152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702151 ?auto_702152 ) ( ON-TABLE ?auto_702135 ) ( ON ?auto_702136 ?auto_702135 ) ( not ( = ?auto_702135 ?auto_702136 ) ) ( not ( = ?auto_702135 ?auto_702137 ) ) ( not ( = ?auto_702135 ?auto_702138 ) ) ( not ( = ?auto_702135 ?auto_702139 ) ) ( not ( = ?auto_702135 ?auto_702140 ) ) ( not ( = ?auto_702135 ?auto_702141 ) ) ( not ( = ?auto_702135 ?auto_702142 ) ) ( not ( = ?auto_702135 ?auto_702143 ) ) ( not ( = ?auto_702135 ?auto_702144 ) ) ( not ( = ?auto_702135 ?auto_702145 ) ) ( not ( = ?auto_702135 ?auto_702146 ) ) ( not ( = ?auto_702135 ?auto_702147 ) ) ( not ( = ?auto_702135 ?auto_702148 ) ) ( not ( = ?auto_702135 ?auto_702149 ) ) ( not ( = ?auto_702135 ?auto_702150 ) ) ( not ( = ?auto_702135 ?auto_702151 ) ) ( not ( = ?auto_702135 ?auto_702152 ) ) ( not ( = ?auto_702136 ?auto_702137 ) ) ( not ( = ?auto_702136 ?auto_702138 ) ) ( not ( = ?auto_702136 ?auto_702139 ) ) ( not ( = ?auto_702136 ?auto_702140 ) ) ( not ( = ?auto_702136 ?auto_702141 ) ) ( not ( = ?auto_702136 ?auto_702142 ) ) ( not ( = ?auto_702136 ?auto_702143 ) ) ( not ( = ?auto_702136 ?auto_702144 ) ) ( not ( = ?auto_702136 ?auto_702145 ) ) ( not ( = ?auto_702136 ?auto_702146 ) ) ( not ( = ?auto_702136 ?auto_702147 ) ) ( not ( = ?auto_702136 ?auto_702148 ) ) ( not ( = ?auto_702136 ?auto_702149 ) ) ( not ( = ?auto_702136 ?auto_702150 ) ) ( not ( = ?auto_702136 ?auto_702151 ) ) ( not ( = ?auto_702136 ?auto_702152 ) ) ( not ( = ?auto_702137 ?auto_702138 ) ) ( not ( = ?auto_702137 ?auto_702139 ) ) ( not ( = ?auto_702137 ?auto_702140 ) ) ( not ( = ?auto_702137 ?auto_702141 ) ) ( not ( = ?auto_702137 ?auto_702142 ) ) ( not ( = ?auto_702137 ?auto_702143 ) ) ( not ( = ?auto_702137 ?auto_702144 ) ) ( not ( = ?auto_702137 ?auto_702145 ) ) ( not ( = ?auto_702137 ?auto_702146 ) ) ( not ( = ?auto_702137 ?auto_702147 ) ) ( not ( = ?auto_702137 ?auto_702148 ) ) ( not ( = ?auto_702137 ?auto_702149 ) ) ( not ( = ?auto_702137 ?auto_702150 ) ) ( not ( = ?auto_702137 ?auto_702151 ) ) ( not ( = ?auto_702137 ?auto_702152 ) ) ( not ( = ?auto_702138 ?auto_702139 ) ) ( not ( = ?auto_702138 ?auto_702140 ) ) ( not ( = ?auto_702138 ?auto_702141 ) ) ( not ( = ?auto_702138 ?auto_702142 ) ) ( not ( = ?auto_702138 ?auto_702143 ) ) ( not ( = ?auto_702138 ?auto_702144 ) ) ( not ( = ?auto_702138 ?auto_702145 ) ) ( not ( = ?auto_702138 ?auto_702146 ) ) ( not ( = ?auto_702138 ?auto_702147 ) ) ( not ( = ?auto_702138 ?auto_702148 ) ) ( not ( = ?auto_702138 ?auto_702149 ) ) ( not ( = ?auto_702138 ?auto_702150 ) ) ( not ( = ?auto_702138 ?auto_702151 ) ) ( not ( = ?auto_702138 ?auto_702152 ) ) ( not ( = ?auto_702139 ?auto_702140 ) ) ( not ( = ?auto_702139 ?auto_702141 ) ) ( not ( = ?auto_702139 ?auto_702142 ) ) ( not ( = ?auto_702139 ?auto_702143 ) ) ( not ( = ?auto_702139 ?auto_702144 ) ) ( not ( = ?auto_702139 ?auto_702145 ) ) ( not ( = ?auto_702139 ?auto_702146 ) ) ( not ( = ?auto_702139 ?auto_702147 ) ) ( not ( = ?auto_702139 ?auto_702148 ) ) ( not ( = ?auto_702139 ?auto_702149 ) ) ( not ( = ?auto_702139 ?auto_702150 ) ) ( not ( = ?auto_702139 ?auto_702151 ) ) ( not ( = ?auto_702139 ?auto_702152 ) ) ( not ( = ?auto_702140 ?auto_702141 ) ) ( not ( = ?auto_702140 ?auto_702142 ) ) ( not ( = ?auto_702140 ?auto_702143 ) ) ( not ( = ?auto_702140 ?auto_702144 ) ) ( not ( = ?auto_702140 ?auto_702145 ) ) ( not ( = ?auto_702140 ?auto_702146 ) ) ( not ( = ?auto_702140 ?auto_702147 ) ) ( not ( = ?auto_702140 ?auto_702148 ) ) ( not ( = ?auto_702140 ?auto_702149 ) ) ( not ( = ?auto_702140 ?auto_702150 ) ) ( not ( = ?auto_702140 ?auto_702151 ) ) ( not ( = ?auto_702140 ?auto_702152 ) ) ( not ( = ?auto_702141 ?auto_702142 ) ) ( not ( = ?auto_702141 ?auto_702143 ) ) ( not ( = ?auto_702141 ?auto_702144 ) ) ( not ( = ?auto_702141 ?auto_702145 ) ) ( not ( = ?auto_702141 ?auto_702146 ) ) ( not ( = ?auto_702141 ?auto_702147 ) ) ( not ( = ?auto_702141 ?auto_702148 ) ) ( not ( = ?auto_702141 ?auto_702149 ) ) ( not ( = ?auto_702141 ?auto_702150 ) ) ( not ( = ?auto_702141 ?auto_702151 ) ) ( not ( = ?auto_702141 ?auto_702152 ) ) ( not ( = ?auto_702142 ?auto_702143 ) ) ( not ( = ?auto_702142 ?auto_702144 ) ) ( not ( = ?auto_702142 ?auto_702145 ) ) ( not ( = ?auto_702142 ?auto_702146 ) ) ( not ( = ?auto_702142 ?auto_702147 ) ) ( not ( = ?auto_702142 ?auto_702148 ) ) ( not ( = ?auto_702142 ?auto_702149 ) ) ( not ( = ?auto_702142 ?auto_702150 ) ) ( not ( = ?auto_702142 ?auto_702151 ) ) ( not ( = ?auto_702142 ?auto_702152 ) ) ( not ( = ?auto_702143 ?auto_702144 ) ) ( not ( = ?auto_702143 ?auto_702145 ) ) ( not ( = ?auto_702143 ?auto_702146 ) ) ( not ( = ?auto_702143 ?auto_702147 ) ) ( not ( = ?auto_702143 ?auto_702148 ) ) ( not ( = ?auto_702143 ?auto_702149 ) ) ( not ( = ?auto_702143 ?auto_702150 ) ) ( not ( = ?auto_702143 ?auto_702151 ) ) ( not ( = ?auto_702143 ?auto_702152 ) ) ( not ( = ?auto_702144 ?auto_702145 ) ) ( not ( = ?auto_702144 ?auto_702146 ) ) ( not ( = ?auto_702144 ?auto_702147 ) ) ( not ( = ?auto_702144 ?auto_702148 ) ) ( not ( = ?auto_702144 ?auto_702149 ) ) ( not ( = ?auto_702144 ?auto_702150 ) ) ( not ( = ?auto_702144 ?auto_702151 ) ) ( not ( = ?auto_702144 ?auto_702152 ) ) ( not ( = ?auto_702145 ?auto_702146 ) ) ( not ( = ?auto_702145 ?auto_702147 ) ) ( not ( = ?auto_702145 ?auto_702148 ) ) ( not ( = ?auto_702145 ?auto_702149 ) ) ( not ( = ?auto_702145 ?auto_702150 ) ) ( not ( = ?auto_702145 ?auto_702151 ) ) ( not ( = ?auto_702145 ?auto_702152 ) ) ( not ( = ?auto_702146 ?auto_702147 ) ) ( not ( = ?auto_702146 ?auto_702148 ) ) ( not ( = ?auto_702146 ?auto_702149 ) ) ( not ( = ?auto_702146 ?auto_702150 ) ) ( not ( = ?auto_702146 ?auto_702151 ) ) ( not ( = ?auto_702146 ?auto_702152 ) ) ( not ( = ?auto_702147 ?auto_702148 ) ) ( not ( = ?auto_702147 ?auto_702149 ) ) ( not ( = ?auto_702147 ?auto_702150 ) ) ( not ( = ?auto_702147 ?auto_702151 ) ) ( not ( = ?auto_702147 ?auto_702152 ) ) ( not ( = ?auto_702148 ?auto_702149 ) ) ( not ( = ?auto_702148 ?auto_702150 ) ) ( not ( = ?auto_702148 ?auto_702151 ) ) ( not ( = ?auto_702148 ?auto_702152 ) ) ( not ( = ?auto_702149 ?auto_702150 ) ) ( not ( = ?auto_702149 ?auto_702151 ) ) ( not ( = ?auto_702149 ?auto_702152 ) ) ( not ( = ?auto_702150 ?auto_702151 ) ) ( not ( = ?auto_702150 ?auto_702152 ) ) ( not ( = ?auto_702151 ?auto_702152 ) ) ( ON ?auto_702150 ?auto_702151 ) ( ON ?auto_702149 ?auto_702150 ) ( ON ?auto_702148 ?auto_702149 ) ( ON ?auto_702147 ?auto_702148 ) ( ON ?auto_702146 ?auto_702147 ) ( ON ?auto_702145 ?auto_702146 ) ( ON ?auto_702144 ?auto_702145 ) ( ON ?auto_702143 ?auto_702144 ) ( ON ?auto_702142 ?auto_702143 ) ( ON ?auto_702141 ?auto_702142 ) ( ON ?auto_702140 ?auto_702141 ) ( ON ?auto_702139 ?auto_702140 ) ( ON ?auto_702138 ?auto_702139 ) ( CLEAR ?auto_702136 ) ( ON ?auto_702137 ?auto_702138 ) ( CLEAR ?auto_702137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_702135 ?auto_702136 ?auto_702137 )
      ( MAKE-17PILE ?auto_702135 ?auto_702136 ?auto_702137 ?auto_702138 ?auto_702139 ?auto_702140 ?auto_702141 ?auto_702142 ?auto_702143 ?auto_702144 ?auto_702145 ?auto_702146 ?auto_702147 ?auto_702148 ?auto_702149 ?auto_702150 ?auto_702151 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_702170 - BLOCK
      ?auto_702171 - BLOCK
      ?auto_702172 - BLOCK
      ?auto_702173 - BLOCK
      ?auto_702174 - BLOCK
      ?auto_702175 - BLOCK
      ?auto_702176 - BLOCK
      ?auto_702177 - BLOCK
      ?auto_702178 - BLOCK
      ?auto_702179 - BLOCK
      ?auto_702180 - BLOCK
      ?auto_702181 - BLOCK
      ?auto_702182 - BLOCK
      ?auto_702183 - BLOCK
      ?auto_702184 - BLOCK
      ?auto_702185 - BLOCK
      ?auto_702186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_702186 ) ( ON-TABLE ?auto_702170 ) ( ON ?auto_702171 ?auto_702170 ) ( not ( = ?auto_702170 ?auto_702171 ) ) ( not ( = ?auto_702170 ?auto_702172 ) ) ( not ( = ?auto_702170 ?auto_702173 ) ) ( not ( = ?auto_702170 ?auto_702174 ) ) ( not ( = ?auto_702170 ?auto_702175 ) ) ( not ( = ?auto_702170 ?auto_702176 ) ) ( not ( = ?auto_702170 ?auto_702177 ) ) ( not ( = ?auto_702170 ?auto_702178 ) ) ( not ( = ?auto_702170 ?auto_702179 ) ) ( not ( = ?auto_702170 ?auto_702180 ) ) ( not ( = ?auto_702170 ?auto_702181 ) ) ( not ( = ?auto_702170 ?auto_702182 ) ) ( not ( = ?auto_702170 ?auto_702183 ) ) ( not ( = ?auto_702170 ?auto_702184 ) ) ( not ( = ?auto_702170 ?auto_702185 ) ) ( not ( = ?auto_702170 ?auto_702186 ) ) ( not ( = ?auto_702171 ?auto_702172 ) ) ( not ( = ?auto_702171 ?auto_702173 ) ) ( not ( = ?auto_702171 ?auto_702174 ) ) ( not ( = ?auto_702171 ?auto_702175 ) ) ( not ( = ?auto_702171 ?auto_702176 ) ) ( not ( = ?auto_702171 ?auto_702177 ) ) ( not ( = ?auto_702171 ?auto_702178 ) ) ( not ( = ?auto_702171 ?auto_702179 ) ) ( not ( = ?auto_702171 ?auto_702180 ) ) ( not ( = ?auto_702171 ?auto_702181 ) ) ( not ( = ?auto_702171 ?auto_702182 ) ) ( not ( = ?auto_702171 ?auto_702183 ) ) ( not ( = ?auto_702171 ?auto_702184 ) ) ( not ( = ?auto_702171 ?auto_702185 ) ) ( not ( = ?auto_702171 ?auto_702186 ) ) ( not ( = ?auto_702172 ?auto_702173 ) ) ( not ( = ?auto_702172 ?auto_702174 ) ) ( not ( = ?auto_702172 ?auto_702175 ) ) ( not ( = ?auto_702172 ?auto_702176 ) ) ( not ( = ?auto_702172 ?auto_702177 ) ) ( not ( = ?auto_702172 ?auto_702178 ) ) ( not ( = ?auto_702172 ?auto_702179 ) ) ( not ( = ?auto_702172 ?auto_702180 ) ) ( not ( = ?auto_702172 ?auto_702181 ) ) ( not ( = ?auto_702172 ?auto_702182 ) ) ( not ( = ?auto_702172 ?auto_702183 ) ) ( not ( = ?auto_702172 ?auto_702184 ) ) ( not ( = ?auto_702172 ?auto_702185 ) ) ( not ( = ?auto_702172 ?auto_702186 ) ) ( not ( = ?auto_702173 ?auto_702174 ) ) ( not ( = ?auto_702173 ?auto_702175 ) ) ( not ( = ?auto_702173 ?auto_702176 ) ) ( not ( = ?auto_702173 ?auto_702177 ) ) ( not ( = ?auto_702173 ?auto_702178 ) ) ( not ( = ?auto_702173 ?auto_702179 ) ) ( not ( = ?auto_702173 ?auto_702180 ) ) ( not ( = ?auto_702173 ?auto_702181 ) ) ( not ( = ?auto_702173 ?auto_702182 ) ) ( not ( = ?auto_702173 ?auto_702183 ) ) ( not ( = ?auto_702173 ?auto_702184 ) ) ( not ( = ?auto_702173 ?auto_702185 ) ) ( not ( = ?auto_702173 ?auto_702186 ) ) ( not ( = ?auto_702174 ?auto_702175 ) ) ( not ( = ?auto_702174 ?auto_702176 ) ) ( not ( = ?auto_702174 ?auto_702177 ) ) ( not ( = ?auto_702174 ?auto_702178 ) ) ( not ( = ?auto_702174 ?auto_702179 ) ) ( not ( = ?auto_702174 ?auto_702180 ) ) ( not ( = ?auto_702174 ?auto_702181 ) ) ( not ( = ?auto_702174 ?auto_702182 ) ) ( not ( = ?auto_702174 ?auto_702183 ) ) ( not ( = ?auto_702174 ?auto_702184 ) ) ( not ( = ?auto_702174 ?auto_702185 ) ) ( not ( = ?auto_702174 ?auto_702186 ) ) ( not ( = ?auto_702175 ?auto_702176 ) ) ( not ( = ?auto_702175 ?auto_702177 ) ) ( not ( = ?auto_702175 ?auto_702178 ) ) ( not ( = ?auto_702175 ?auto_702179 ) ) ( not ( = ?auto_702175 ?auto_702180 ) ) ( not ( = ?auto_702175 ?auto_702181 ) ) ( not ( = ?auto_702175 ?auto_702182 ) ) ( not ( = ?auto_702175 ?auto_702183 ) ) ( not ( = ?auto_702175 ?auto_702184 ) ) ( not ( = ?auto_702175 ?auto_702185 ) ) ( not ( = ?auto_702175 ?auto_702186 ) ) ( not ( = ?auto_702176 ?auto_702177 ) ) ( not ( = ?auto_702176 ?auto_702178 ) ) ( not ( = ?auto_702176 ?auto_702179 ) ) ( not ( = ?auto_702176 ?auto_702180 ) ) ( not ( = ?auto_702176 ?auto_702181 ) ) ( not ( = ?auto_702176 ?auto_702182 ) ) ( not ( = ?auto_702176 ?auto_702183 ) ) ( not ( = ?auto_702176 ?auto_702184 ) ) ( not ( = ?auto_702176 ?auto_702185 ) ) ( not ( = ?auto_702176 ?auto_702186 ) ) ( not ( = ?auto_702177 ?auto_702178 ) ) ( not ( = ?auto_702177 ?auto_702179 ) ) ( not ( = ?auto_702177 ?auto_702180 ) ) ( not ( = ?auto_702177 ?auto_702181 ) ) ( not ( = ?auto_702177 ?auto_702182 ) ) ( not ( = ?auto_702177 ?auto_702183 ) ) ( not ( = ?auto_702177 ?auto_702184 ) ) ( not ( = ?auto_702177 ?auto_702185 ) ) ( not ( = ?auto_702177 ?auto_702186 ) ) ( not ( = ?auto_702178 ?auto_702179 ) ) ( not ( = ?auto_702178 ?auto_702180 ) ) ( not ( = ?auto_702178 ?auto_702181 ) ) ( not ( = ?auto_702178 ?auto_702182 ) ) ( not ( = ?auto_702178 ?auto_702183 ) ) ( not ( = ?auto_702178 ?auto_702184 ) ) ( not ( = ?auto_702178 ?auto_702185 ) ) ( not ( = ?auto_702178 ?auto_702186 ) ) ( not ( = ?auto_702179 ?auto_702180 ) ) ( not ( = ?auto_702179 ?auto_702181 ) ) ( not ( = ?auto_702179 ?auto_702182 ) ) ( not ( = ?auto_702179 ?auto_702183 ) ) ( not ( = ?auto_702179 ?auto_702184 ) ) ( not ( = ?auto_702179 ?auto_702185 ) ) ( not ( = ?auto_702179 ?auto_702186 ) ) ( not ( = ?auto_702180 ?auto_702181 ) ) ( not ( = ?auto_702180 ?auto_702182 ) ) ( not ( = ?auto_702180 ?auto_702183 ) ) ( not ( = ?auto_702180 ?auto_702184 ) ) ( not ( = ?auto_702180 ?auto_702185 ) ) ( not ( = ?auto_702180 ?auto_702186 ) ) ( not ( = ?auto_702181 ?auto_702182 ) ) ( not ( = ?auto_702181 ?auto_702183 ) ) ( not ( = ?auto_702181 ?auto_702184 ) ) ( not ( = ?auto_702181 ?auto_702185 ) ) ( not ( = ?auto_702181 ?auto_702186 ) ) ( not ( = ?auto_702182 ?auto_702183 ) ) ( not ( = ?auto_702182 ?auto_702184 ) ) ( not ( = ?auto_702182 ?auto_702185 ) ) ( not ( = ?auto_702182 ?auto_702186 ) ) ( not ( = ?auto_702183 ?auto_702184 ) ) ( not ( = ?auto_702183 ?auto_702185 ) ) ( not ( = ?auto_702183 ?auto_702186 ) ) ( not ( = ?auto_702184 ?auto_702185 ) ) ( not ( = ?auto_702184 ?auto_702186 ) ) ( not ( = ?auto_702185 ?auto_702186 ) ) ( ON ?auto_702185 ?auto_702186 ) ( ON ?auto_702184 ?auto_702185 ) ( ON ?auto_702183 ?auto_702184 ) ( ON ?auto_702182 ?auto_702183 ) ( ON ?auto_702181 ?auto_702182 ) ( ON ?auto_702180 ?auto_702181 ) ( ON ?auto_702179 ?auto_702180 ) ( ON ?auto_702178 ?auto_702179 ) ( ON ?auto_702177 ?auto_702178 ) ( ON ?auto_702176 ?auto_702177 ) ( ON ?auto_702175 ?auto_702176 ) ( ON ?auto_702174 ?auto_702175 ) ( ON ?auto_702173 ?auto_702174 ) ( CLEAR ?auto_702171 ) ( ON ?auto_702172 ?auto_702173 ) ( CLEAR ?auto_702172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_702170 ?auto_702171 ?auto_702172 )
      ( MAKE-17PILE ?auto_702170 ?auto_702171 ?auto_702172 ?auto_702173 ?auto_702174 ?auto_702175 ?auto_702176 ?auto_702177 ?auto_702178 ?auto_702179 ?auto_702180 ?auto_702181 ?auto_702182 ?auto_702183 ?auto_702184 ?auto_702185 ?auto_702186 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_702204 - BLOCK
      ?auto_702205 - BLOCK
      ?auto_702206 - BLOCK
      ?auto_702207 - BLOCK
      ?auto_702208 - BLOCK
      ?auto_702209 - BLOCK
      ?auto_702210 - BLOCK
      ?auto_702211 - BLOCK
      ?auto_702212 - BLOCK
      ?auto_702213 - BLOCK
      ?auto_702214 - BLOCK
      ?auto_702215 - BLOCK
      ?auto_702216 - BLOCK
      ?auto_702217 - BLOCK
      ?auto_702218 - BLOCK
      ?auto_702219 - BLOCK
      ?auto_702220 - BLOCK
    )
    :vars
    (
      ?auto_702221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702220 ?auto_702221 ) ( ON-TABLE ?auto_702204 ) ( not ( = ?auto_702204 ?auto_702205 ) ) ( not ( = ?auto_702204 ?auto_702206 ) ) ( not ( = ?auto_702204 ?auto_702207 ) ) ( not ( = ?auto_702204 ?auto_702208 ) ) ( not ( = ?auto_702204 ?auto_702209 ) ) ( not ( = ?auto_702204 ?auto_702210 ) ) ( not ( = ?auto_702204 ?auto_702211 ) ) ( not ( = ?auto_702204 ?auto_702212 ) ) ( not ( = ?auto_702204 ?auto_702213 ) ) ( not ( = ?auto_702204 ?auto_702214 ) ) ( not ( = ?auto_702204 ?auto_702215 ) ) ( not ( = ?auto_702204 ?auto_702216 ) ) ( not ( = ?auto_702204 ?auto_702217 ) ) ( not ( = ?auto_702204 ?auto_702218 ) ) ( not ( = ?auto_702204 ?auto_702219 ) ) ( not ( = ?auto_702204 ?auto_702220 ) ) ( not ( = ?auto_702204 ?auto_702221 ) ) ( not ( = ?auto_702205 ?auto_702206 ) ) ( not ( = ?auto_702205 ?auto_702207 ) ) ( not ( = ?auto_702205 ?auto_702208 ) ) ( not ( = ?auto_702205 ?auto_702209 ) ) ( not ( = ?auto_702205 ?auto_702210 ) ) ( not ( = ?auto_702205 ?auto_702211 ) ) ( not ( = ?auto_702205 ?auto_702212 ) ) ( not ( = ?auto_702205 ?auto_702213 ) ) ( not ( = ?auto_702205 ?auto_702214 ) ) ( not ( = ?auto_702205 ?auto_702215 ) ) ( not ( = ?auto_702205 ?auto_702216 ) ) ( not ( = ?auto_702205 ?auto_702217 ) ) ( not ( = ?auto_702205 ?auto_702218 ) ) ( not ( = ?auto_702205 ?auto_702219 ) ) ( not ( = ?auto_702205 ?auto_702220 ) ) ( not ( = ?auto_702205 ?auto_702221 ) ) ( not ( = ?auto_702206 ?auto_702207 ) ) ( not ( = ?auto_702206 ?auto_702208 ) ) ( not ( = ?auto_702206 ?auto_702209 ) ) ( not ( = ?auto_702206 ?auto_702210 ) ) ( not ( = ?auto_702206 ?auto_702211 ) ) ( not ( = ?auto_702206 ?auto_702212 ) ) ( not ( = ?auto_702206 ?auto_702213 ) ) ( not ( = ?auto_702206 ?auto_702214 ) ) ( not ( = ?auto_702206 ?auto_702215 ) ) ( not ( = ?auto_702206 ?auto_702216 ) ) ( not ( = ?auto_702206 ?auto_702217 ) ) ( not ( = ?auto_702206 ?auto_702218 ) ) ( not ( = ?auto_702206 ?auto_702219 ) ) ( not ( = ?auto_702206 ?auto_702220 ) ) ( not ( = ?auto_702206 ?auto_702221 ) ) ( not ( = ?auto_702207 ?auto_702208 ) ) ( not ( = ?auto_702207 ?auto_702209 ) ) ( not ( = ?auto_702207 ?auto_702210 ) ) ( not ( = ?auto_702207 ?auto_702211 ) ) ( not ( = ?auto_702207 ?auto_702212 ) ) ( not ( = ?auto_702207 ?auto_702213 ) ) ( not ( = ?auto_702207 ?auto_702214 ) ) ( not ( = ?auto_702207 ?auto_702215 ) ) ( not ( = ?auto_702207 ?auto_702216 ) ) ( not ( = ?auto_702207 ?auto_702217 ) ) ( not ( = ?auto_702207 ?auto_702218 ) ) ( not ( = ?auto_702207 ?auto_702219 ) ) ( not ( = ?auto_702207 ?auto_702220 ) ) ( not ( = ?auto_702207 ?auto_702221 ) ) ( not ( = ?auto_702208 ?auto_702209 ) ) ( not ( = ?auto_702208 ?auto_702210 ) ) ( not ( = ?auto_702208 ?auto_702211 ) ) ( not ( = ?auto_702208 ?auto_702212 ) ) ( not ( = ?auto_702208 ?auto_702213 ) ) ( not ( = ?auto_702208 ?auto_702214 ) ) ( not ( = ?auto_702208 ?auto_702215 ) ) ( not ( = ?auto_702208 ?auto_702216 ) ) ( not ( = ?auto_702208 ?auto_702217 ) ) ( not ( = ?auto_702208 ?auto_702218 ) ) ( not ( = ?auto_702208 ?auto_702219 ) ) ( not ( = ?auto_702208 ?auto_702220 ) ) ( not ( = ?auto_702208 ?auto_702221 ) ) ( not ( = ?auto_702209 ?auto_702210 ) ) ( not ( = ?auto_702209 ?auto_702211 ) ) ( not ( = ?auto_702209 ?auto_702212 ) ) ( not ( = ?auto_702209 ?auto_702213 ) ) ( not ( = ?auto_702209 ?auto_702214 ) ) ( not ( = ?auto_702209 ?auto_702215 ) ) ( not ( = ?auto_702209 ?auto_702216 ) ) ( not ( = ?auto_702209 ?auto_702217 ) ) ( not ( = ?auto_702209 ?auto_702218 ) ) ( not ( = ?auto_702209 ?auto_702219 ) ) ( not ( = ?auto_702209 ?auto_702220 ) ) ( not ( = ?auto_702209 ?auto_702221 ) ) ( not ( = ?auto_702210 ?auto_702211 ) ) ( not ( = ?auto_702210 ?auto_702212 ) ) ( not ( = ?auto_702210 ?auto_702213 ) ) ( not ( = ?auto_702210 ?auto_702214 ) ) ( not ( = ?auto_702210 ?auto_702215 ) ) ( not ( = ?auto_702210 ?auto_702216 ) ) ( not ( = ?auto_702210 ?auto_702217 ) ) ( not ( = ?auto_702210 ?auto_702218 ) ) ( not ( = ?auto_702210 ?auto_702219 ) ) ( not ( = ?auto_702210 ?auto_702220 ) ) ( not ( = ?auto_702210 ?auto_702221 ) ) ( not ( = ?auto_702211 ?auto_702212 ) ) ( not ( = ?auto_702211 ?auto_702213 ) ) ( not ( = ?auto_702211 ?auto_702214 ) ) ( not ( = ?auto_702211 ?auto_702215 ) ) ( not ( = ?auto_702211 ?auto_702216 ) ) ( not ( = ?auto_702211 ?auto_702217 ) ) ( not ( = ?auto_702211 ?auto_702218 ) ) ( not ( = ?auto_702211 ?auto_702219 ) ) ( not ( = ?auto_702211 ?auto_702220 ) ) ( not ( = ?auto_702211 ?auto_702221 ) ) ( not ( = ?auto_702212 ?auto_702213 ) ) ( not ( = ?auto_702212 ?auto_702214 ) ) ( not ( = ?auto_702212 ?auto_702215 ) ) ( not ( = ?auto_702212 ?auto_702216 ) ) ( not ( = ?auto_702212 ?auto_702217 ) ) ( not ( = ?auto_702212 ?auto_702218 ) ) ( not ( = ?auto_702212 ?auto_702219 ) ) ( not ( = ?auto_702212 ?auto_702220 ) ) ( not ( = ?auto_702212 ?auto_702221 ) ) ( not ( = ?auto_702213 ?auto_702214 ) ) ( not ( = ?auto_702213 ?auto_702215 ) ) ( not ( = ?auto_702213 ?auto_702216 ) ) ( not ( = ?auto_702213 ?auto_702217 ) ) ( not ( = ?auto_702213 ?auto_702218 ) ) ( not ( = ?auto_702213 ?auto_702219 ) ) ( not ( = ?auto_702213 ?auto_702220 ) ) ( not ( = ?auto_702213 ?auto_702221 ) ) ( not ( = ?auto_702214 ?auto_702215 ) ) ( not ( = ?auto_702214 ?auto_702216 ) ) ( not ( = ?auto_702214 ?auto_702217 ) ) ( not ( = ?auto_702214 ?auto_702218 ) ) ( not ( = ?auto_702214 ?auto_702219 ) ) ( not ( = ?auto_702214 ?auto_702220 ) ) ( not ( = ?auto_702214 ?auto_702221 ) ) ( not ( = ?auto_702215 ?auto_702216 ) ) ( not ( = ?auto_702215 ?auto_702217 ) ) ( not ( = ?auto_702215 ?auto_702218 ) ) ( not ( = ?auto_702215 ?auto_702219 ) ) ( not ( = ?auto_702215 ?auto_702220 ) ) ( not ( = ?auto_702215 ?auto_702221 ) ) ( not ( = ?auto_702216 ?auto_702217 ) ) ( not ( = ?auto_702216 ?auto_702218 ) ) ( not ( = ?auto_702216 ?auto_702219 ) ) ( not ( = ?auto_702216 ?auto_702220 ) ) ( not ( = ?auto_702216 ?auto_702221 ) ) ( not ( = ?auto_702217 ?auto_702218 ) ) ( not ( = ?auto_702217 ?auto_702219 ) ) ( not ( = ?auto_702217 ?auto_702220 ) ) ( not ( = ?auto_702217 ?auto_702221 ) ) ( not ( = ?auto_702218 ?auto_702219 ) ) ( not ( = ?auto_702218 ?auto_702220 ) ) ( not ( = ?auto_702218 ?auto_702221 ) ) ( not ( = ?auto_702219 ?auto_702220 ) ) ( not ( = ?auto_702219 ?auto_702221 ) ) ( not ( = ?auto_702220 ?auto_702221 ) ) ( ON ?auto_702219 ?auto_702220 ) ( ON ?auto_702218 ?auto_702219 ) ( ON ?auto_702217 ?auto_702218 ) ( ON ?auto_702216 ?auto_702217 ) ( ON ?auto_702215 ?auto_702216 ) ( ON ?auto_702214 ?auto_702215 ) ( ON ?auto_702213 ?auto_702214 ) ( ON ?auto_702212 ?auto_702213 ) ( ON ?auto_702211 ?auto_702212 ) ( ON ?auto_702210 ?auto_702211 ) ( ON ?auto_702209 ?auto_702210 ) ( ON ?auto_702208 ?auto_702209 ) ( ON ?auto_702207 ?auto_702208 ) ( ON ?auto_702206 ?auto_702207 ) ( CLEAR ?auto_702204 ) ( ON ?auto_702205 ?auto_702206 ) ( CLEAR ?auto_702205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_702204 ?auto_702205 )
      ( MAKE-17PILE ?auto_702204 ?auto_702205 ?auto_702206 ?auto_702207 ?auto_702208 ?auto_702209 ?auto_702210 ?auto_702211 ?auto_702212 ?auto_702213 ?auto_702214 ?auto_702215 ?auto_702216 ?auto_702217 ?auto_702218 ?auto_702219 ?auto_702220 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_702239 - BLOCK
      ?auto_702240 - BLOCK
      ?auto_702241 - BLOCK
      ?auto_702242 - BLOCK
      ?auto_702243 - BLOCK
      ?auto_702244 - BLOCK
      ?auto_702245 - BLOCK
      ?auto_702246 - BLOCK
      ?auto_702247 - BLOCK
      ?auto_702248 - BLOCK
      ?auto_702249 - BLOCK
      ?auto_702250 - BLOCK
      ?auto_702251 - BLOCK
      ?auto_702252 - BLOCK
      ?auto_702253 - BLOCK
      ?auto_702254 - BLOCK
      ?auto_702255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_702255 ) ( ON-TABLE ?auto_702239 ) ( not ( = ?auto_702239 ?auto_702240 ) ) ( not ( = ?auto_702239 ?auto_702241 ) ) ( not ( = ?auto_702239 ?auto_702242 ) ) ( not ( = ?auto_702239 ?auto_702243 ) ) ( not ( = ?auto_702239 ?auto_702244 ) ) ( not ( = ?auto_702239 ?auto_702245 ) ) ( not ( = ?auto_702239 ?auto_702246 ) ) ( not ( = ?auto_702239 ?auto_702247 ) ) ( not ( = ?auto_702239 ?auto_702248 ) ) ( not ( = ?auto_702239 ?auto_702249 ) ) ( not ( = ?auto_702239 ?auto_702250 ) ) ( not ( = ?auto_702239 ?auto_702251 ) ) ( not ( = ?auto_702239 ?auto_702252 ) ) ( not ( = ?auto_702239 ?auto_702253 ) ) ( not ( = ?auto_702239 ?auto_702254 ) ) ( not ( = ?auto_702239 ?auto_702255 ) ) ( not ( = ?auto_702240 ?auto_702241 ) ) ( not ( = ?auto_702240 ?auto_702242 ) ) ( not ( = ?auto_702240 ?auto_702243 ) ) ( not ( = ?auto_702240 ?auto_702244 ) ) ( not ( = ?auto_702240 ?auto_702245 ) ) ( not ( = ?auto_702240 ?auto_702246 ) ) ( not ( = ?auto_702240 ?auto_702247 ) ) ( not ( = ?auto_702240 ?auto_702248 ) ) ( not ( = ?auto_702240 ?auto_702249 ) ) ( not ( = ?auto_702240 ?auto_702250 ) ) ( not ( = ?auto_702240 ?auto_702251 ) ) ( not ( = ?auto_702240 ?auto_702252 ) ) ( not ( = ?auto_702240 ?auto_702253 ) ) ( not ( = ?auto_702240 ?auto_702254 ) ) ( not ( = ?auto_702240 ?auto_702255 ) ) ( not ( = ?auto_702241 ?auto_702242 ) ) ( not ( = ?auto_702241 ?auto_702243 ) ) ( not ( = ?auto_702241 ?auto_702244 ) ) ( not ( = ?auto_702241 ?auto_702245 ) ) ( not ( = ?auto_702241 ?auto_702246 ) ) ( not ( = ?auto_702241 ?auto_702247 ) ) ( not ( = ?auto_702241 ?auto_702248 ) ) ( not ( = ?auto_702241 ?auto_702249 ) ) ( not ( = ?auto_702241 ?auto_702250 ) ) ( not ( = ?auto_702241 ?auto_702251 ) ) ( not ( = ?auto_702241 ?auto_702252 ) ) ( not ( = ?auto_702241 ?auto_702253 ) ) ( not ( = ?auto_702241 ?auto_702254 ) ) ( not ( = ?auto_702241 ?auto_702255 ) ) ( not ( = ?auto_702242 ?auto_702243 ) ) ( not ( = ?auto_702242 ?auto_702244 ) ) ( not ( = ?auto_702242 ?auto_702245 ) ) ( not ( = ?auto_702242 ?auto_702246 ) ) ( not ( = ?auto_702242 ?auto_702247 ) ) ( not ( = ?auto_702242 ?auto_702248 ) ) ( not ( = ?auto_702242 ?auto_702249 ) ) ( not ( = ?auto_702242 ?auto_702250 ) ) ( not ( = ?auto_702242 ?auto_702251 ) ) ( not ( = ?auto_702242 ?auto_702252 ) ) ( not ( = ?auto_702242 ?auto_702253 ) ) ( not ( = ?auto_702242 ?auto_702254 ) ) ( not ( = ?auto_702242 ?auto_702255 ) ) ( not ( = ?auto_702243 ?auto_702244 ) ) ( not ( = ?auto_702243 ?auto_702245 ) ) ( not ( = ?auto_702243 ?auto_702246 ) ) ( not ( = ?auto_702243 ?auto_702247 ) ) ( not ( = ?auto_702243 ?auto_702248 ) ) ( not ( = ?auto_702243 ?auto_702249 ) ) ( not ( = ?auto_702243 ?auto_702250 ) ) ( not ( = ?auto_702243 ?auto_702251 ) ) ( not ( = ?auto_702243 ?auto_702252 ) ) ( not ( = ?auto_702243 ?auto_702253 ) ) ( not ( = ?auto_702243 ?auto_702254 ) ) ( not ( = ?auto_702243 ?auto_702255 ) ) ( not ( = ?auto_702244 ?auto_702245 ) ) ( not ( = ?auto_702244 ?auto_702246 ) ) ( not ( = ?auto_702244 ?auto_702247 ) ) ( not ( = ?auto_702244 ?auto_702248 ) ) ( not ( = ?auto_702244 ?auto_702249 ) ) ( not ( = ?auto_702244 ?auto_702250 ) ) ( not ( = ?auto_702244 ?auto_702251 ) ) ( not ( = ?auto_702244 ?auto_702252 ) ) ( not ( = ?auto_702244 ?auto_702253 ) ) ( not ( = ?auto_702244 ?auto_702254 ) ) ( not ( = ?auto_702244 ?auto_702255 ) ) ( not ( = ?auto_702245 ?auto_702246 ) ) ( not ( = ?auto_702245 ?auto_702247 ) ) ( not ( = ?auto_702245 ?auto_702248 ) ) ( not ( = ?auto_702245 ?auto_702249 ) ) ( not ( = ?auto_702245 ?auto_702250 ) ) ( not ( = ?auto_702245 ?auto_702251 ) ) ( not ( = ?auto_702245 ?auto_702252 ) ) ( not ( = ?auto_702245 ?auto_702253 ) ) ( not ( = ?auto_702245 ?auto_702254 ) ) ( not ( = ?auto_702245 ?auto_702255 ) ) ( not ( = ?auto_702246 ?auto_702247 ) ) ( not ( = ?auto_702246 ?auto_702248 ) ) ( not ( = ?auto_702246 ?auto_702249 ) ) ( not ( = ?auto_702246 ?auto_702250 ) ) ( not ( = ?auto_702246 ?auto_702251 ) ) ( not ( = ?auto_702246 ?auto_702252 ) ) ( not ( = ?auto_702246 ?auto_702253 ) ) ( not ( = ?auto_702246 ?auto_702254 ) ) ( not ( = ?auto_702246 ?auto_702255 ) ) ( not ( = ?auto_702247 ?auto_702248 ) ) ( not ( = ?auto_702247 ?auto_702249 ) ) ( not ( = ?auto_702247 ?auto_702250 ) ) ( not ( = ?auto_702247 ?auto_702251 ) ) ( not ( = ?auto_702247 ?auto_702252 ) ) ( not ( = ?auto_702247 ?auto_702253 ) ) ( not ( = ?auto_702247 ?auto_702254 ) ) ( not ( = ?auto_702247 ?auto_702255 ) ) ( not ( = ?auto_702248 ?auto_702249 ) ) ( not ( = ?auto_702248 ?auto_702250 ) ) ( not ( = ?auto_702248 ?auto_702251 ) ) ( not ( = ?auto_702248 ?auto_702252 ) ) ( not ( = ?auto_702248 ?auto_702253 ) ) ( not ( = ?auto_702248 ?auto_702254 ) ) ( not ( = ?auto_702248 ?auto_702255 ) ) ( not ( = ?auto_702249 ?auto_702250 ) ) ( not ( = ?auto_702249 ?auto_702251 ) ) ( not ( = ?auto_702249 ?auto_702252 ) ) ( not ( = ?auto_702249 ?auto_702253 ) ) ( not ( = ?auto_702249 ?auto_702254 ) ) ( not ( = ?auto_702249 ?auto_702255 ) ) ( not ( = ?auto_702250 ?auto_702251 ) ) ( not ( = ?auto_702250 ?auto_702252 ) ) ( not ( = ?auto_702250 ?auto_702253 ) ) ( not ( = ?auto_702250 ?auto_702254 ) ) ( not ( = ?auto_702250 ?auto_702255 ) ) ( not ( = ?auto_702251 ?auto_702252 ) ) ( not ( = ?auto_702251 ?auto_702253 ) ) ( not ( = ?auto_702251 ?auto_702254 ) ) ( not ( = ?auto_702251 ?auto_702255 ) ) ( not ( = ?auto_702252 ?auto_702253 ) ) ( not ( = ?auto_702252 ?auto_702254 ) ) ( not ( = ?auto_702252 ?auto_702255 ) ) ( not ( = ?auto_702253 ?auto_702254 ) ) ( not ( = ?auto_702253 ?auto_702255 ) ) ( not ( = ?auto_702254 ?auto_702255 ) ) ( ON ?auto_702254 ?auto_702255 ) ( ON ?auto_702253 ?auto_702254 ) ( ON ?auto_702252 ?auto_702253 ) ( ON ?auto_702251 ?auto_702252 ) ( ON ?auto_702250 ?auto_702251 ) ( ON ?auto_702249 ?auto_702250 ) ( ON ?auto_702248 ?auto_702249 ) ( ON ?auto_702247 ?auto_702248 ) ( ON ?auto_702246 ?auto_702247 ) ( ON ?auto_702245 ?auto_702246 ) ( ON ?auto_702244 ?auto_702245 ) ( ON ?auto_702243 ?auto_702244 ) ( ON ?auto_702242 ?auto_702243 ) ( ON ?auto_702241 ?auto_702242 ) ( CLEAR ?auto_702239 ) ( ON ?auto_702240 ?auto_702241 ) ( CLEAR ?auto_702240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_702239 ?auto_702240 )
      ( MAKE-17PILE ?auto_702239 ?auto_702240 ?auto_702241 ?auto_702242 ?auto_702243 ?auto_702244 ?auto_702245 ?auto_702246 ?auto_702247 ?auto_702248 ?auto_702249 ?auto_702250 ?auto_702251 ?auto_702252 ?auto_702253 ?auto_702254 ?auto_702255 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_702273 - BLOCK
      ?auto_702274 - BLOCK
      ?auto_702275 - BLOCK
      ?auto_702276 - BLOCK
      ?auto_702277 - BLOCK
      ?auto_702278 - BLOCK
      ?auto_702279 - BLOCK
      ?auto_702280 - BLOCK
      ?auto_702281 - BLOCK
      ?auto_702282 - BLOCK
      ?auto_702283 - BLOCK
      ?auto_702284 - BLOCK
      ?auto_702285 - BLOCK
      ?auto_702286 - BLOCK
      ?auto_702287 - BLOCK
      ?auto_702288 - BLOCK
      ?auto_702289 - BLOCK
    )
    :vars
    (
      ?auto_702290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702289 ?auto_702290 ) ( not ( = ?auto_702273 ?auto_702274 ) ) ( not ( = ?auto_702273 ?auto_702275 ) ) ( not ( = ?auto_702273 ?auto_702276 ) ) ( not ( = ?auto_702273 ?auto_702277 ) ) ( not ( = ?auto_702273 ?auto_702278 ) ) ( not ( = ?auto_702273 ?auto_702279 ) ) ( not ( = ?auto_702273 ?auto_702280 ) ) ( not ( = ?auto_702273 ?auto_702281 ) ) ( not ( = ?auto_702273 ?auto_702282 ) ) ( not ( = ?auto_702273 ?auto_702283 ) ) ( not ( = ?auto_702273 ?auto_702284 ) ) ( not ( = ?auto_702273 ?auto_702285 ) ) ( not ( = ?auto_702273 ?auto_702286 ) ) ( not ( = ?auto_702273 ?auto_702287 ) ) ( not ( = ?auto_702273 ?auto_702288 ) ) ( not ( = ?auto_702273 ?auto_702289 ) ) ( not ( = ?auto_702273 ?auto_702290 ) ) ( not ( = ?auto_702274 ?auto_702275 ) ) ( not ( = ?auto_702274 ?auto_702276 ) ) ( not ( = ?auto_702274 ?auto_702277 ) ) ( not ( = ?auto_702274 ?auto_702278 ) ) ( not ( = ?auto_702274 ?auto_702279 ) ) ( not ( = ?auto_702274 ?auto_702280 ) ) ( not ( = ?auto_702274 ?auto_702281 ) ) ( not ( = ?auto_702274 ?auto_702282 ) ) ( not ( = ?auto_702274 ?auto_702283 ) ) ( not ( = ?auto_702274 ?auto_702284 ) ) ( not ( = ?auto_702274 ?auto_702285 ) ) ( not ( = ?auto_702274 ?auto_702286 ) ) ( not ( = ?auto_702274 ?auto_702287 ) ) ( not ( = ?auto_702274 ?auto_702288 ) ) ( not ( = ?auto_702274 ?auto_702289 ) ) ( not ( = ?auto_702274 ?auto_702290 ) ) ( not ( = ?auto_702275 ?auto_702276 ) ) ( not ( = ?auto_702275 ?auto_702277 ) ) ( not ( = ?auto_702275 ?auto_702278 ) ) ( not ( = ?auto_702275 ?auto_702279 ) ) ( not ( = ?auto_702275 ?auto_702280 ) ) ( not ( = ?auto_702275 ?auto_702281 ) ) ( not ( = ?auto_702275 ?auto_702282 ) ) ( not ( = ?auto_702275 ?auto_702283 ) ) ( not ( = ?auto_702275 ?auto_702284 ) ) ( not ( = ?auto_702275 ?auto_702285 ) ) ( not ( = ?auto_702275 ?auto_702286 ) ) ( not ( = ?auto_702275 ?auto_702287 ) ) ( not ( = ?auto_702275 ?auto_702288 ) ) ( not ( = ?auto_702275 ?auto_702289 ) ) ( not ( = ?auto_702275 ?auto_702290 ) ) ( not ( = ?auto_702276 ?auto_702277 ) ) ( not ( = ?auto_702276 ?auto_702278 ) ) ( not ( = ?auto_702276 ?auto_702279 ) ) ( not ( = ?auto_702276 ?auto_702280 ) ) ( not ( = ?auto_702276 ?auto_702281 ) ) ( not ( = ?auto_702276 ?auto_702282 ) ) ( not ( = ?auto_702276 ?auto_702283 ) ) ( not ( = ?auto_702276 ?auto_702284 ) ) ( not ( = ?auto_702276 ?auto_702285 ) ) ( not ( = ?auto_702276 ?auto_702286 ) ) ( not ( = ?auto_702276 ?auto_702287 ) ) ( not ( = ?auto_702276 ?auto_702288 ) ) ( not ( = ?auto_702276 ?auto_702289 ) ) ( not ( = ?auto_702276 ?auto_702290 ) ) ( not ( = ?auto_702277 ?auto_702278 ) ) ( not ( = ?auto_702277 ?auto_702279 ) ) ( not ( = ?auto_702277 ?auto_702280 ) ) ( not ( = ?auto_702277 ?auto_702281 ) ) ( not ( = ?auto_702277 ?auto_702282 ) ) ( not ( = ?auto_702277 ?auto_702283 ) ) ( not ( = ?auto_702277 ?auto_702284 ) ) ( not ( = ?auto_702277 ?auto_702285 ) ) ( not ( = ?auto_702277 ?auto_702286 ) ) ( not ( = ?auto_702277 ?auto_702287 ) ) ( not ( = ?auto_702277 ?auto_702288 ) ) ( not ( = ?auto_702277 ?auto_702289 ) ) ( not ( = ?auto_702277 ?auto_702290 ) ) ( not ( = ?auto_702278 ?auto_702279 ) ) ( not ( = ?auto_702278 ?auto_702280 ) ) ( not ( = ?auto_702278 ?auto_702281 ) ) ( not ( = ?auto_702278 ?auto_702282 ) ) ( not ( = ?auto_702278 ?auto_702283 ) ) ( not ( = ?auto_702278 ?auto_702284 ) ) ( not ( = ?auto_702278 ?auto_702285 ) ) ( not ( = ?auto_702278 ?auto_702286 ) ) ( not ( = ?auto_702278 ?auto_702287 ) ) ( not ( = ?auto_702278 ?auto_702288 ) ) ( not ( = ?auto_702278 ?auto_702289 ) ) ( not ( = ?auto_702278 ?auto_702290 ) ) ( not ( = ?auto_702279 ?auto_702280 ) ) ( not ( = ?auto_702279 ?auto_702281 ) ) ( not ( = ?auto_702279 ?auto_702282 ) ) ( not ( = ?auto_702279 ?auto_702283 ) ) ( not ( = ?auto_702279 ?auto_702284 ) ) ( not ( = ?auto_702279 ?auto_702285 ) ) ( not ( = ?auto_702279 ?auto_702286 ) ) ( not ( = ?auto_702279 ?auto_702287 ) ) ( not ( = ?auto_702279 ?auto_702288 ) ) ( not ( = ?auto_702279 ?auto_702289 ) ) ( not ( = ?auto_702279 ?auto_702290 ) ) ( not ( = ?auto_702280 ?auto_702281 ) ) ( not ( = ?auto_702280 ?auto_702282 ) ) ( not ( = ?auto_702280 ?auto_702283 ) ) ( not ( = ?auto_702280 ?auto_702284 ) ) ( not ( = ?auto_702280 ?auto_702285 ) ) ( not ( = ?auto_702280 ?auto_702286 ) ) ( not ( = ?auto_702280 ?auto_702287 ) ) ( not ( = ?auto_702280 ?auto_702288 ) ) ( not ( = ?auto_702280 ?auto_702289 ) ) ( not ( = ?auto_702280 ?auto_702290 ) ) ( not ( = ?auto_702281 ?auto_702282 ) ) ( not ( = ?auto_702281 ?auto_702283 ) ) ( not ( = ?auto_702281 ?auto_702284 ) ) ( not ( = ?auto_702281 ?auto_702285 ) ) ( not ( = ?auto_702281 ?auto_702286 ) ) ( not ( = ?auto_702281 ?auto_702287 ) ) ( not ( = ?auto_702281 ?auto_702288 ) ) ( not ( = ?auto_702281 ?auto_702289 ) ) ( not ( = ?auto_702281 ?auto_702290 ) ) ( not ( = ?auto_702282 ?auto_702283 ) ) ( not ( = ?auto_702282 ?auto_702284 ) ) ( not ( = ?auto_702282 ?auto_702285 ) ) ( not ( = ?auto_702282 ?auto_702286 ) ) ( not ( = ?auto_702282 ?auto_702287 ) ) ( not ( = ?auto_702282 ?auto_702288 ) ) ( not ( = ?auto_702282 ?auto_702289 ) ) ( not ( = ?auto_702282 ?auto_702290 ) ) ( not ( = ?auto_702283 ?auto_702284 ) ) ( not ( = ?auto_702283 ?auto_702285 ) ) ( not ( = ?auto_702283 ?auto_702286 ) ) ( not ( = ?auto_702283 ?auto_702287 ) ) ( not ( = ?auto_702283 ?auto_702288 ) ) ( not ( = ?auto_702283 ?auto_702289 ) ) ( not ( = ?auto_702283 ?auto_702290 ) ) ( not ( = ?auto_702284 ?auto_702285 ) ) ( not ( = ?auto_702284 ?auto_702286 ) ) ( not ( = ?auto_702284 ?auto_702287 ) ) ( not ( = ?auto_702284 ?auto_702288 ) ) ( not ( = ?auto_702284 ?auto_702289 ) ) ( not ( = ?auto_702284 ?auto_702290 ) ) ( not ( = ?auto_702285 ?auto_702286 ) ) ( not ( = ?auto_702285 ?auto_702287 ) ) ( not ( = ?auto_702285 ?auto_702288 ) ) ( not ( = ?auto_702285 ?auto_702289 ) ) ( not ( = ?auto_702285 ?auto_702290 ) ) ( not ( = ?auto_702286 ?auto_702287 ) ) ( not ( = ?auto_702286 ?auto_702288 ) ) ( not ( = ?auto_702286 ?auto_702289 ) ) ( not ( = ?auto_702286 ?auto_702290 ) ) ( not ( = ?auto_702287 ?auto_702288 ) ) ( not ( = ?auto_702287 ?auto_702289 ) ) ( not ( = ?auto_702287 ?auto_702290 ) ) ( not ( = ?auto_702288 ?auto_702289 ) ) ( not ( = ?auto_702288 ?auto_702290 ) ) ( not ( = ?auto_702289 ?auto_702290 ) ) ( ON ?auto_702288 ?auto_702289 ) ( ON ?auto_702287 ?auto_702288 ) ( ON ?auto_702286 ?auto_702287 ) ( ON ?auto_702285 ?auto_702286 ) ( ON ?auto_702284 ?auto_702285 ) ( ON ?auto_702283 ?auto_702284 ) ( ON ?auto_702282 ?auto_702283 ) ( ON ?auto_702281 ?auto_702282 ) ( ON ?auto_702280 ?auto_702281 ) ( ON ?auto_702279 ?auto_702280 ) ( ON ?auto_702278 ?auto_702279 ) ( ON ?auto_702277 ?auto_702278 ) ( ON ?auto_702276 ?auto_702277 ) ( ON ?auto_702275 ?auto_702276 ) ( ON ?auto_702274 ?auto_702275 ) ( ON ?auto_702273 ?auto_702274 ) ( CLEAR ?auto_702273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_702273 )
      ( MAKE-17PILE ?auto_702273 ?auto_702274 ?auto_702275 ?auto_702276 ?auto_702277 ?auto_702278 ?auto_702279 ?auto_702280 ?auto_702281 ?auto_702282 ?auto_702283 ?auto_702284 ?auto_702285 ?auto_702286 ?auto_702287 ?auto_702288 ?auto_702289 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_702308 - BLOCK
      ?auto_702309 - BLOCK
      ?auto_702310 - BLOCK
      ?auto_702311 - BLOCK
      ?auto_702312 - BLOCK
      ?auto_702313 - BLOCK
      ?auto_702314 - BLOCK
      ?auto_702315 - BLOCK
      ?auto_702316 - BLOCK
      ?auto_702317 - BLOCK
      ?auto_702318 - BLOCK
      ?auto_702319 - BLOCK
      ?auto_702320 - BLOCK
      ?auto_702321 - BLOCK
      ?auto_702322 - BLOCK
      ?auto_702323 - BLOCK
      ?auto_702324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_702324 ) ( not ( = ?auto_702308 ?auto_702309 ) ) ( not ( = ?auto_702308 ?auto_702310 ) ) ( not ( = ?auto_702308 ?auto_702311 ) ) ( not ( = ?auto_702308 ?auto_702312 ) ) ( not ( = ?auto_702308 ?auto_702313 ) ) ( not ( = ?auto_702308 ?auto_702314 ) ) ( not ( = ?auto_702308 ?auto_702315 ) ) ( not ( = ?auto_702308 ?auto_702316 ) ) ( not ( = ?auto_702308 ?auto_702317 ) ) ( not ( = ?auto_702308 ?auto_702318 ) ) ( not ( = ?auto_702308 ?auto_702319 ) ) ( not ( = ?auto_702308 ?auto_702320 ) ) ( not ( = ?auto_702308 ?auto_702321 ) ) ( not ( = ?auto_702308 ?auto_702322 ) ) ( not ( = ?auto_702308 ?auto_702323 ) ) ( not ( = ?auto_702308 ?auto_702324 ) ) ( not ( = ?auto_702309 ?auto_702310 ) ) ( not ( = ?auto_702309 ?auto_702311 ) ) ( not ( = ?auto_702309 ?auto_702312 ) ) ( not ( = ?auto_702309 ?auto_702313 ) ) ( not ( = ?auto_702309 ?auto_702314 ) ) ( not ( = ?auto_702309 ?auto_702315 ) ) ( not ( = ?auto_702309 ?auto_702316 ) ) ( not ( = ?auto_702309 ?auto_702317 ) ) ( not ( = ?auto_702309 ?auto_702318 ) ) ( not ( = ?auto_702309 ?auto_702319 ) ) ( not ( = ?auto_702309 ?auto_702320 ) ) ( not ( = ?auto_702309 ?auto_702321 ) ) ( not ( = ?auto_702309 ?auto_702322 ) ) ( not ( = ?auto_702309 ?auto_702323 ) ) ( not ( = ?auto_702309 ?auto_702324 ) ) ( not ( = ?auto_702310 ?auto_702311 ) ) ( not ( = ?auto_702310 ?auto_702312 ) ) ( not ( = ?auto_702310 ?auto_702313 ) ) ( not ( = ?auto_702310 ?auto_702314 ) ) ( not ( = ?auto_702310 ?auto_702315 ) ) ( not ( = ?auto_702310 ?auto_702316 ) ) ( not ( = ?auto_702310 ?auto_702317 ) ) ( not ( = ?auto_702310 ?auto_702318 ) ) ( not ( = ?auto_702310 ?auto_702319 ) ) ( not ( = ?auto_702310 ?auto_702320 ) ) ( not ( = ?auto_702310 ?auto_702321 ) ) ( not ( = ?auto_702310 ?auto_702322 ) ) ( not ( = ?auto_702310 ?auto_702323 ) ) ( not ( = ?auto_702310 ?auto_702324 ) ) ( not ( = ?auto_702311 ?auto_702312 ) ) ( not ( = ?auto_702311 ?auto_702313 ) ) ( not ( = ?auto_702311 ?auto_702314 ) ) ( not ( = ?auto_702311 ?auto_702315 ) ) ( not ( = ?auto_702311 ?auto_702316 ) ) ( not ( = ?auto_702311 ?auto_702317 ) ) ( not ( = ?auto_702311 ?auto_702318 ) ) ( not ( = ?auto_702311 ?auto_702319 ) ) ( not ( = ?auto_702311 ?auto_702320 ) ) ( not ( = ?auto_702311 ?auto_702321 ) ) ( not ( = ?auto_702311 ?auto_702322 ) ) ( not ( = ?auto_702311 ?auto_702323 ) ) ( not ( = ?auto_702311 ?auto_702324 ) ) ( not ( = ?auto_702312 ?auto_702313 ) ) ( not ( = ?auto_702312 ?auto_702314 ) ) ( not ( = ?auto_702312 ?auto_702315 ) ) ( not ( = ?auto_702312 ?auto_702316 ) ) ( not ( = ?auto_702312 ?auto_702317 ) ) ( not ( = ?auto_702312 ?auto_702318 ) ) ( not ( = ?auto_702312 ?auto_702319 ) ) ( not ( = ?auto_702312 ?auto_702320 ) ) ( not ( = ?auto_702312 ?auto_702321 ) ) ( not ( = ?auto_702312 ?auto_702322 ) ) ( not ( = ?auto_702312 ?auto_702323 ) ) ( not ( = ?auto_702312 ?auto_702324 ) ) ( not ( = ?auto_702313 ?auto_702314 ) ) ( not ( = ?auto_702313 ?auto_702315 ) ) ( not ( = ?auto_702313 ?auto_702316 ) ) ( not ( = ?auto_702313 ?auto_702317 ) ) ( not ( = ?auto_702313 ?auto_702318 ) ) ( not ( = ?auto_702313 ?auto_702319 ) ) ( not ( = ?auto_702313 ?auto_702320 ) ) ( not ( = ?auto_702313 ?auto_702321 ) ) ( not ( = ?auto_702313 ?auto_702322 ) ) ( not ( = ?auto_702313 ?auto_702323 ) ) ( not ( = ?auto_702313 ?auto_702324 ) ) ( not ( = ?auto_702314 ?auto_702315 ) ) ( not ( = ?auto_702314 ?auto_702316 ) ) ( not ( = ?auto_702314 ?auto_702317 ) ) ( not ( = ?auto_702314 ?auto_702318 ) ) ( not ( = ?auto_702314 ?auto_702319 ) ) ( not ( = ?auto_702314 ?auto_702320 ) ) ( not ( = ?auto_702314 ?auto_702321 ) ) ( not ( = ?auto_702314 ?auto_702322 ) ) ( not ( = ?auto_702314 ?auto_702323 ) ) ( not ( = ?auto_702314 ?auto_702324 ) ) ( not ( = ?auto_702315 ?auto_702316 ) ) ( not ( = ?auto_702315 ?auto_702317 ) ) ( not ( = ?auto_702315 ?auto_702318 ) ) ( not ( = ?auto_702315 ?auto_702319 ) ) ( not ( = ?auto_702315 ?auto_702320 ) ) ( not ( = ?auto_702315 ?auto_702321 ) ) ( not ( = ?auto_702315 ?auto_702322 ) ) ( not ( = ?auto_702315 ?auto_702323 ) ) ( not ( = ?auto_702315 ?auto_702324 ) ) ( not ( = ?auto_702316 ?auto_702317 ) ) ( not ( = ?auto_702316 ?auto_702318 ) ) ( not ( = ?auto_702316 ?auto_702319 ) ) ( not ( = ?auto_702316 ?auto_702320 ) ) ( not ( = ?auto_702316 ?auto_702321 ) ) ( not ( = ?auto_702316 ?auto_702322 ) ) ( not ( = ?auto_702316 ?auto_702323 ) ) ( not ( = ?auto_702316 ?auto_702324 ) ) ( not ( = ?auto_702317 ?auto_702318 ) ) ( not ( = ?auto_702317 ?auto_702319 ) ) ( not ( = ?auto_702317 ?auto_702320 ) ) ( not ( = ?auto_702317 ?auto_702321 ) ) ( not ( = ?auto_702317 ?auto_702322 ) ) ( not ( = ?auto_702317 ?auto_702323 ) ) ( not ( = ?auto_702317 ?auto_702324 ) ) ( not ( = ?auto_702318 ?auto_702319 ) ) ( not ( = ?auto_702318 ?auto_702320 ) ) ( not ( = ?auto_702318 ?auto_702321 ) ) ( not ( = ?auto_702318 ?auto_702322 ) ) ( not ( = ?auto_702318 ?auto_702323 ) ) ( not ( = ?auto_702318 ?auto_702324 ) ) ( not ( = ?auto_702319 ?auto_702320 ) ) ( not ( = ?auto_702319 ?auto_702321 ) ) ( not ( = ?auto_702319 ?auto_702322 ) ) ( not ( = ?auto_702319 ?auto_702323 ) ) ( not ( = ?auto_702319 ?auto_702324 ) ) ( not ( = ?auto_702320 ?auto_702321 ) ) ( not ( = ?auto_702320 ?auto_702322 ) ) ( not ( = ?auto_702320 ?auto_702323 ) ) ( not ( = ?auto_702320 ?auto_702324 ) ) ( not ( = ?auto_702321 ?auto_702322 ) ) ( not ( = ?auto_702321 ?auto_702323 ) ) ( not ( = ?auto_702321 ?auto_702324 ) ) ( not ( = ?auto_702322 ?auto_702323 ) ) ( not ( = ?auto_702322 ?auto_702324 ) ) ( not ( = ?auto_702323 ?auto_702324 ) ) ( ON ?auto_702323 ?auto_702324 ) ( ON ?auto_702322 ?auto_702323 ) ( ON ?auto_702321 ?auto_702322 ) ( ON ?auto_702320 ?auto_702321 ) ( ON ?auto_702319 ?auto_702320 ) ( ON ?auto_702318 ?auto_702319 ) ( ON ?auto_702317 ?auto_702318 ) ( ON ?auto_702316 ?auto_702317 ) ( ON ?auto_702315 ?auto_702316 ) ( ON ?auto_702314 ?auto_702315 ) ( ON ?auto_702313 ?auto_702314 ) ( ON ?auto_702312 ?auto_702313 ) ( ON ?auto_702311 ?auto_702312 ) ( ON ?auto_702310 ?auto_702311 ) ( ON ?auto_702309 ?auto_702310 ) ( ON ?auto_702308 ?auto_702309 ) ( CLEAR ?auto_702308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_702308 )
      ( MAKE-17PILE ?auto_702308 ?auto_702309 ?auto_702310 ?auto_702311 ?auto_702312 ?auto_702313 ?auto_702314 ?auto_702315 ?auto_702316 ?auto_702317 ?auto_702318 ?auto_702319 ?auto_702320 ?auto_702321 ?auto_702322 ?auto_702323 ?auto_702324 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_702342 - BLOCK
      ?auto_702343 - BLOCK
      ?auto_702344 - BLOCK
      ?auto_702345 - BLOCK
      ?auto_702346 - BLOCK
      ?auto_702347 - BLOCK
      ?auto_702348 - BLOCK
      ?auto_702349 - BLOCK
      ?auto_702350 - BLOCK
      ?auto_702351 - BLOCK
      ?auto_702352 - BLOCK
      ?auto_702353 - BLOCK
      ?auto_702354 - BLOCK
      ?auto_702355 - BLOCK
      ?auto_702356 - BLOCK
      ?auto_702357 - BLOCK
      ?auto_702358 - BLOCK
    )
    :vars
    (
      ?auto_702359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_702342 ?auto_702343 ) ) ( not ( = ?auto_702342 ?auto_702344 ) ) ( not ( = ?auto_702342 ?auto_702345 ) ) ( not ( = ?auto_702342 ?auto_702346 ) ) ( not ( = ?auto_702342 ?auto_702347 ) ) ( not ( = ?auto_702342 ?auto_702348 ) ) ( not ( = ?auto_702342 ?auto_702349 ) ) ( not ( = ?auto_702342 ?auto_702350 ) ) ( not ( = ?auto_702342 ?auto_702351 ) ) ( not ( = ?auto_702342 ?auto_702352 ) ) ( not ( = ?auto_702342 ?auto_702353 ) ) ( not ( = ?auto_702342 ?auto_702354 ) ) ( not ( = ?auto_702342 ?auto_702355 ) ) ( not ( = ?auto_702342 ?auto_702356 ) ) ( not ( = ?auto_702342 ?auto_702357 ) ) ( not ( = ?auto_702342 ?auto_702358 ) ) ( not ( = ?auto_702343 ?auto_702344 ) ) ( not ( = ?auto_702343 ?auto_702345 ) ) ( not ( = ?auto_702343 ?auto_702346 ) ) ( not ( = ?auto_702343 ?auto_702347 ) ) ( not ( = ?auto_702343 ?auto_702348 ) ) ( not ( = ?auto_702343 ?auto_702349 ) ) ( not ( = ?auto_702343 ?auto_702350 ) ) ( not ( = ?auto_702343 ?auto_702351 ) ) ( not ( = ?auto_702343 ?auto_702352 ) ) ( not ( = ?auto_702343 ?auto_702353 ) ) ( not ( = ?auto_702343 ?auto_702354 ) ) ( not ( = ?auto_702343 ?auto_702355 ) ) ( not ( = ?auto_702343 ?auto_702356 ) ) ( not ( = ?auto_702343 ?auto_702357 ) ) ( not ( = ?auto_702343 ?auto_702358 ) ) ( not ( = ?auto_702344 ?auto_702345 ) ) ( not ( = ?auto_702344 ?auto_702346 ) ) ( not ( = ?auto_702344 ?auto_702347 ) ) ( not ( = ?auto_702344 ?auto_702348 ) ) ( not ( = ?auto_702344 ?auto_702349 ) ) ( not ( = ?auto_702344 ?auto_702350 ) ) ( not ( = ?auto_702344 ?auto_702351 ) ) ( not ( = ?auto_702344 ?auto_702352 ) ) ( not ( = ?auto_702344 ?auto_702353 ) ) ( not ( = ?auto_702344 ?auto_702354 ) ) ( not ( = ?auto_702344 ?auto_702355 ) ) ( not ( = ?auto_702344 ?auto_702356 ) ) ( not ( = ?auto_702344 ?auto_702357 ) ) ( not ( = ?auto_702344 ?auto_702358 ) ) ( not ( = ?auto_702345 ?auto_702346 ) ) ( not ( = ?auto_702345 ?auto_702347 ) ) ( not ( = ?auto_702345 ?auto_702348 ) ) ( not ( = ?auto_702345 ?auto_702349 ) ) ( not ( = ?auto_702345 ?auto_702350 ) ) ( not ( = ?auto_702345 ?auto_702351 ) ) ( not ( = ?auto_702345 ?auto_702352 ) ) ( not ( = ?auto_702345 ?auto_702353 ) ) ( not ( = ?auto_702345 ?auto_702354 ) ) ( not ( = ?auto_702345 ?auto_702355 ) ) ( not ( = ?auto_702345 ?auto_702356 ) ) ( not ( = ?auto_702345 ?auto_702357 ) ) ( not ( = ?auto_702345 ?auto_702358 ) ) ( not ( = ?auto_702346 ?auto_702347 ) ) ( not ( = ?auto_702346 ?auto_702348 ) ) ( not ( = ?auto_702346 ?auto_702349 ) ) ( not ( = ?auto_702346 ?auto_702350 ) ) ( not ( = ?auto_702346 ?auto_702351 ) ) ( not ( = ?auto_702346 ?auto_702352 ) ) ( not ( = ?auto_702346 ?auto_702353 ) ) ( not ( = ?auto_702346 ?auto_702354 ) ) ( not ( = ?auto_702346 ?auto_702355 ) ) ( not ( = ?auto_702346 ?auto_702356 ) ) ( not ( = ?auto_702346 ?auto_702357 ) ) ( not ( = ?auto_702346 ?auto_702358 ) ) ( not ( = ?auto_702347 ?auto_702348 ) ) ( not ( = ?auto_702347 ?auto_702349 ) ) ( not ( = ?auto_702347 ?auto_702350 ) ) ( not ( = ?auto_702347 ?auto_702351 ) ) ( not ( = ?auto_702347 ?auto_702352 ) ) ( not ( = ?auto_702347 ?auto_702353 ) ) ( not ( = ?auto_702347 ?auto_702354 ) ) ( not ( = ?auto_702347 ?auto_702355 ) ) ( not ( = ?auto_702347 ?auto_702356 ) ) ( not ( = ?auto_702347 ?auto_702357 ) ) ( not ( = ?auto_702347 ?auto_702358 ) ) ( not ( = ?auto_702348 ?auto_702349 ) ) ( not ( = ?auto_702348 ?auto_702350 ) ) ( not ( = ?auto_702348 ?auto_702351 ) ) ( not ( = ?auto_702348 ?auto_702352 ) ) ( not ( = ?auto_702348 ?auto_702353 ) ) ( not ( = ?auto_702348 ?auto_702354 ) ) ( not ( = ?auto_702348 ?auto_702355 ) ) ( not ( = ?auto_702348 ?auto_702356 ) ) ( not ( = ?auto_702348 ?auto_702357 ) ) ( not ( = ?auto_702348 ?auto_702358 ) ) ( not ( = ?auto_702349 ?auto_702350 ) ) ( not ( = ?auto_702349 ?auto_702351 ) ) ( not ( = ?auto_702349 ?auto_702352 ) ) ( not ( = ?auto_702349 ?auto_702353 ) ) ( not ( = ?auto_702349 ?auto_702354 ) ) ( not ( = ?auto_702349 ?auto_702355 ) ) ( not ( = ?auto_702349 ?auto_702356 ) ) ( not ( = ?auto_702349 ?auto_702357 ) ) ( not ( = ?auto_702349 ?auto_702358 ) ) ( not ( = ?auto_702350 ?auto_702351 ) ) ( not ( = ?auto_702350 ?auto_702352 ) ) ( not ( = ?auto_702350 ?auto_702353 ) ) ( not ( = ?auto_702350 ?auto_702354 ) ) ( not ( = ?auto_702350 ?auto_702355 ) ) ( not ( = ?auto_702350 ?auto_702356 ) ) ( not ( = ?auto_702350 ?auto_702357 ) ) ( not ( = ?auto_702350 ?auto_702358 ) ) ( not ( = ?auto_702351 ?auto_702352 ) ) ( not ( = ?auto_702351 ?auto_702353 ) ) ( not ( = ?auto_702351 ?auto_702354 ) ) ( not ( = ?auto_702351 ?auto_702355 ) ) ( not ( = ?auto_702351 ?auto_702356 ) ) ( not ( = ?auto_702351 ?auto_702357 ) ) ( not ( = ?auto_702351 ?auto_702358 ) ) ( not ( = ?auto_702352 ?auto_702353 ) ) ( not ( = ?auto_702352 ?auto_702354 ) ) ( not ( = ?auto_702352 ?auto_702355 ) ) ( not ( = ?auto_702352 ?auto_702356 ) ) ( not ( = ?auto_702352 ?auto_702357 ) ) ( not ( = ?auto_702352 ?auto_702358 ) ) ( not ( = ?auto_702353 ?auto_702354 ) ) ( not ( = ?auto_702353 ?auto_702355 ) ) ( not ( = ?auto_702353 ?auto_702356 ) ) ( not ( = ?auto_702353 ?auto_702357 ) ) ( not ( = ?auto_702353 ?auto_702358 ) ) ( not ( = ?auto_702354 ?auto_702355 ) ) ( not ( = ?auto_702354 ?auto_702356 ) ) ( not ( = ?auto_702354 ?auto_702357 ) ) ( not ( = ?auto_702354 ?auto_702358 ) ) ( not ( = ?auto_702355 ?auto_702356 ) ) ( not ( = ?auto_702355 ?auto_702357 ) ) ( not ( = ?auto_702355 ?auto_702358 ) ) ( not ( = ?auto_702356 ?auto_702357 ) ) ( not ( = ?auto_702356 ?auto_702358 ) ) ( not ( = ?auto_702357 ?auto_702358 ) ) ( ON ?auto_702342 ?auto_702359 ) ( not ( = ?auto_702358 ?auto_702359 ) ) ( not ( = ?auto_702357 ?auto_702359 ) ) ( not ( = ?auto_702356 ?auto_702359 ) ) ( not ( = ?auto_702355 ?auto_702359 ) ) ( not ( = ?auto_702354 ?auto_702359 ) ) ( not ( = ?auto_702353 ?auto_702359 ) ) ( not ( = ?auto_702352 ?auto_702359 ) ) ( not ( = ?auto_702351 ?auto_702359 ) ) ( not ( = ?auto_702350 ?auto_702359 ) ) ( not ( = ?auto_702349 ?auto_702359 ) ) ( not ( = ?auto_702348 ?auto_702359 ) ) ( not ( = ?auto_702347 ?auto_702359 ) ) ( not ( = ?auto_702346 ?auto_702359 ) ) ( not ( = ?auto_702345 ?auto_702359 ) ) ( not ( = ?auto_702344 ?auto_702359 ) ) ( not ( = ?auto_702343 ?auto_702359 ) ) ( not ( = ?auto_702342 ?auto_702359 ) ) ( ON ?auto_702343 ?auto_702342 ) ( ON ?auto_702344 ?auto_702343 ) ( ON ?auto_702345 ?auto_702344 ) ( ON ?auto_702346 ?auto_702345 ) ( ON ?auto_702347 ?auto_702346 ) ( ON ?auto_702348 ?auto_702347 ) ( ON ?auto_702349 ?auto_702348 ) ( ON ?auto_702350 ?auto_702349 ) ( ON ?auto_702351 ?auto_702350 ) ( ON ?auto_702352 ?auto_702351 ) ( ON ?auto_702353 ?auto_702352 ) ( ON ?auto_702354 ?auto_702353 ) ( ON ?auto_702355 ?auto_702354 ) ( ON ?auto_702356 ?auto_702355 ) ( ON ?auto_702357 ?auto_702356 ) ( ON ?auto_702358 ?auto_702357 ) ( CLEAR ?auto_702358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_702358 ?auto_702357 ?auto_702356 ?auto_702355 ?auto_702354 ?auto_702353 ?auto_702352 ?auto_702351 ?auto_702350 ?auto_702349 ?auto_702348 ?auto_702347 ?auto_702346 ?auto_702345 ?auto_702344 ?auto_702343 ?auto_702342 )
      ( MAKE-17PILE ?auto_702342 ?auto_702343 ?auto_702344 ?auto_702345 ?auto_702346 ?auto_702347 ?auto_702348 ?auto_702349 ?auto_702350 ?auto_702351 ?auto_702352 ?auto_702353 ?auto_702354 ?auto_702355 ?auto_702356 ?auto_702357 ?auto_702358 ) )
  )

)

