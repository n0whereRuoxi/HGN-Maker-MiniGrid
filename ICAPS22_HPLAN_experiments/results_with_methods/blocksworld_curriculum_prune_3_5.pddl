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
      ?auto_941 - BLOCK
    )
    :vars
    (
      ?auto_942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_941 ?auto_942 ) ( CLEAR ?auto_941 ) ( HAND-EMPTY ) ( not ( = ?auto_941 ?auto_942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_941 ?auto_942 )
      ( !PUTDOWN ?auto_941 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_948 - BLOCK
      ?auto_949 - BLOCK
    )
    :vars
    (
      ?auto_950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_948 ) ( ON ?auto_949 ?auto_950 ) ( CLEAR ?auto_949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_948 ) ( not ( = ?auto_948 ?auto_949 ) ) ( not ( = ?auto_948 ?auto_950 ) ) ( not ( = ?auto_949 ?auto_950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_949 ?auto_950 )
      ( !STACK ?auto_949 ?auto_948 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_958 - BLOCK
      ?auto_959 - BLOCK
    )
    :vars
    (
      ?auto_960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_959 ?auto_960 ) ( not ( = ?auto_958 ?auto_959 ) ) ( not ( = ?auto_958 ?auto_960 ) ) ( not ( = ?auto_959 ?auto_960 ) ) ( ON ?auto_958 ?auto_959 ) ( CLEAR ?auto_958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_958 )
      ( MAKE-2PILE ?auto_958 ?auto_959 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_969 - BLOCK
      ?auto_970 - BLOCK
      ?auto_971 - BLOCK
    )
    :vars
    (
      ?auto_972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_970 ) ( ON ?auto_971 ?auto_972 ) ( CLEAR ?auto_971 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_969 ) ( ON ?auto_970 ?auto_969 ) ( not ( = ?auto_969 ?auto_970 ) ) ( not ( = ?auto_969 ?auto_971 ) ) ( not ( = ?auto_969 ?auto_972 ) ) ( not ( = ?auto_970 ?auto_971 ) ) ( not ( = ?auto_970 ?auto_972 ) ) ( not ( = ?auto_971 ?auto_972 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_971 ?auto_972 )
      ( !STACK ?auto_971 ?auto_970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_976 - BLOCK
      ?auto_977 - BLOCK
      ?auto_978 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_977 ) ( ON-TABLE ?auto_978 ) ( CLEAR ?auto_978 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_976 ) ( ON ?auto_977 ?auto_976 ) ( not ( = ?auto_976 ?auto_977 ) ) ( not ( = ?auto_976 ?auto_978 ) ) ( not ( = ?auto_977 ?auto_978 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_978 )
      ( !STACK ?auto_978 ?auto_977 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_982 - BLOCK
      ?auto_983 - BLOCK
      ?auto_984 - BLOCK
    )
    :vars
    (
      ?auto_985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_984 ?auto_985 ) ( ON-TABLE ?auto_982 ) ( not ( = ?auto_982 ?auto_983 ) ) ( not ( = ?auto_982 ?auto_984 ) ) ( not ( = ?auto_982 ?auto_985 ) ) ( not ( = ?auto_983 ?auto_984 ) ) ( not ( = ?auto_983 ?auto_985 ) ) ( not ( = ?auto_984 ?auto_985 ) ) ( CLEAR ?auto_982 ) ( ON ?auto_983 ?auto_984 ) ( CLEAR ?auto_983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_982 ?auto_983 )
      ( MAKE-3PILE ?auto_982 ?auto_983 ?auto_984 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_989 - BLOCK
      ?auto_990 - BLOCK
      ?auto_991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_991 ) ( ON-TABLE ?auto_989 ) ( not ( = ?auto_989 ?auto_990 ) ) ( not ( = ?auto_989 ?auto_991 ) ) ( not ( = ?auto_990 ?auto_991 ) ) ( CLEAR ?auto_989 ) ( ON ?auto_990 ?auto_991 ) ( CLEAR ?auto_990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_989 ?auto_990 )
      ( MAKE-3PILE ?auto_989 ?auto_990 ?auto_991 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_995 - BLOCK
      ?auto_996 - BLOCK
      ?auto_997 - BLOCK
    )
    :vars
    (
      ?auto_998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_997 ?auto_998 ) ( not ( = ?auto_995 ?auto_996 ) ) ( not ( = ?auto_995 ?auto_997 ) ) ( not ( = ?auto_995 ?auto_998 ) ) ( not ( = ?auto_996 ?auto_997 ) ) ( not ( = ?auto_996 ?auto_998 ) ) ( not ( = ?auto_997 ?auto_998 ) ) ( ON ?auto_996 ?auto_997 ) ( ON ?auto_995 ?auto_996 ) ( CLEAR ?auto_995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_995 )
      ( MAKE-3PILE ?auto_995 ?auto_996 ?auto_997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1002 - BLOCK
      ?auto_1003 - BLOCK
      ?auto_1004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1004 ) ( not ( = ?auto_1002 ?auto_1003 ) ) ( not ( = ?auto_1002 ?auto_1004 ) ) ( not ( = ?auto_1003 ?auto_1004 ) ) ( ON ?auto_1003 ?auto_1004 ) ( ON ?auto_1002 ?auto_1003 ) ( CLEAR ?auto_1002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1002 )
      ( MAKE-3PILE ?auto_1002 ?auto_1003 ?auto_1004 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1008 - BLOCK
      ?auto_1009 - BLOCK
      ?auto_1010 - BLOCK
    )
    :vars
    (
      ?auto_1011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1008 ?auto_1009 ) ) ( not ( = ?auto_1008 ?auto_1010 ) ) ( not ( = ?auto_1009 ?auto_1010 ) ) ( ON ?auto_1008 ?auto_1011 ) ( not ( = ?auto_1010 ?auto_1011 ) ) ( not ( = ?auto_1009 ?auto_1011 ) ) ( not ( = ?auto_1008 ?auto_1011 ) ) ( ON ?auto_1009 ?auto_1008 ) ( ON ?auto_1010 ?auto_1009 ) ( CLEAR ?auto_1010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1010 ?auto_1009 ?auto_1008 )
      ( MAKE-3PILE ?auto_1008 ?auto_1009 ?auto_1010 ) )
  )

)

