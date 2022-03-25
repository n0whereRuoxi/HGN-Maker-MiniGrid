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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27009 - BLOCK
      ?auto_27010 - BLOCK
      ?auto_27011 - BLOCK
      ?auto_27012 - BLOCK
      ?auto_27013 - BLOCK
    )
    :vars
    (
      ?auto_27014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27014 ?auto_27013 ) ( CLEAR ?auto_27014 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27009 ) ( ON ?auto_27010 ?auto_27009 ) ( ON ?auto_27011 ?auto_27010 ) ( ON ?auto_27012 ?auto_27011 ) ( ON ?auto_27013 ?auto_27012 ) ( not ( = ?auto_27009 ?auto_27010 ) ) ( not ( = ?auto_27009 ?auto_27011 ) ) ( not ( = ?auto_27009 ?auto_27012 ) ) ( not ( = ?auto_27009 ?auto_27013 ) ) ( not ( = ?auto_27009 ?auto_27014 ) ) ( not ( = ?auto_27010 ?auto_27011 ) ) ( not ( = ?auto_27010 ?auto_27012 ) ) ( not ( = ?auto_27010 ?auto_27013 ) ) ( not ( = ?auto_27010 ?auto_27014 ) ) ( not ( = ?auto_27011 ?auto_27012 ) ) ( not ( = ?auto_27011 ?auto_27013 ) ) ( not ( = ?auto_27011 ?auto_27014 ) ) ( not ( = ?auto_27012 ?auto_27013 ) ) ( not ( = ?auto_27012 ?auto_27014 ) ) ( not ( = ?auto_27013 ?auto_27014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27014 ?auto_27013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27016 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27016 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_27016 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27017 - BLOCK
    )
    :vars
    (
      ?auto_27018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27017 ?auto_27018 ) ( CLEAR ?auto_27017 ) ( HAND-EMPTY ) ( not ( = ?auto_27017 ?auto_27018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27017 ?auto_27018 )
      ( MAKE-1PILE ?auto_27017 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27023 - BLOCK
      ?auto_27024 - BLOCK
      ?auto_27025 - BLOCK
      ?auto_27026 - BLOCK
    )
    :vars
    (
      ?auto_27027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27027 ?auto_27026 ) ( CLEAR ?auto_27027 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27023 ) ( ON ?auto_27024 ?auto_27023 ) ( ON ?auto_27025 ?auto_27024 ) ( ON ?auto_27026 ?auto_27025 ) ( not ( = ?auto_27023 ?auto_27024 ) ) ( not ( = ?auto_27023 ?auto_27025 ) ) ( not ( = ?auto_27023 ?auto_27026 ) ) ( not ( = ?auto_27023 ?auto_27027 ) ) ( not ( = ?auto_27024 ?auto_27025 ) ) ( not ( = ?auto_27024 ?auto_27026 ) ) ( not ( = ?auto_27024 ?auto_27027 ) ) ( not ( = ?auto_27025 ?auto_27026 ) ) ( not ( = ?auto_27025 ?auto_27027 ) ) ( not ( = ?auto_27026 ?auto_27027 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27027 ?auto_27026 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27028 - BLOCK
      ?auto_27029 - BLOCK
      ?auto_27030 - BLOCK
      ?auto_27031 - BLOCK
    )
    :vars
    (
      ?auto_27032 - BLOCK
      ?auto_27033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27032 ?auto_27031 ) ( CLEAR ?auto_27032 ) ( ON-TABLE ?auto_27028 ) ( ON ?auto_27029 ?auto_27028 ) ( ON ?auto_27030 ?auto_27029 ) ( ON ?auto_27031 ?auto_27030 ) ( not ( = ?auto_27028 ?auto_27029 ) ) ( not ( = ?auto_27028 ?auto_27030 ) ) ( not ( = ?auto_27028 ?auto_27031 ) ) ( not ( = ?auto_27028 ?auto_27032 ) ) ( not ( = ?auto_27029 ?auto_27030 ) ) ( not ( = ?auto_27029 ?auto_27031 ) ) ( not ( = ?auto_27029 ?auto_27032 ) ) ( not ( = ?auto_27030 ?auto_27031 ) ) ( not ( = ?auto_27030 ?auto_27032 ) ) ( not ( = ?auto_27031 ?auto_27032 ) ) ( HOLDING ?auto_27033 ) ( not ( = ?auto_27028 ?auto_27033 ) ) ( not ( = ?auto_27029 ?auto_27033 ) ) ( not ( = ?auto_27030 ?auto_27033 ) ) ( not ( = ?auto_27031 ?auto_27033 ) ) ( not ( = ?auto_27032 ?auto_27033 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_27033 )
      ( MAKE-4PILE ?auto_27028 ?auto_27029 ?auto_27030 ?auto_27031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27034 - BLOCK
      ?auto_27035 - BLOCK
      ?auto_27036 - BLOCK
      ?auto_27037 - BLOCK
    )
    :vars
    (
      ?auto_27038 - BLOCK
      ?auto_27039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27038 ?auto_27037 ) ( ON-TABLE ?auto_27034 ) ( ON ?auto_27035 ?auto_27034 ) ( ON ?auto_27036 ?auto_27035 ) ( ON ?auto_27037 ?auto_27036 ) ( not ( = ?auto_27034 ?auto_27035 ) ) ( not ( = ?auto_27034 ?auto_27036 ) ) ( not ( = ?auto_27034 ?auto_27037 ) ) ( not ( = ?auto_27034 ?auto_27038 ) ) ( not ( = ?auto_27035 ?auto_27036 ) ) ( not ( = ?auto_27035 ?auto_27037 ) ) ( not ( = ?auto_27035 ?auto_27038 ) ) ( not ( = ?auto_27036 ?auto_27037 ) ) ( not ( = ?auto_27036 ?auto_27038 ) ) ( not ( = ?auto_27037 ?auto_27038 ) ) ( not ( = ?auto_27034 ?auto_27039 ) ) ( not ( = ?auto_27035 ?auto_27039 ) ) ( not ( = ?auto_27036 ?auto_27039 ) ) ( not ( = ?auto_27037 ?auto_27039 ) ) ( not ( = ?auto_27038 ?auto_27039 ) ) ( ON ?auto_27039 ?auto_27038 ) ( CLEAR ?auto_27039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27034 ?auto_27035 ?auto_27036 ?auto_27037 ?auto_27038 )
      ( MAKE-4PILE ?auto_27034 ?auto_27035 ?auto_27036 ?auto_27037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27042 - BLOCK
      ?auto_27043 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27043 ) ( CLEAR ?auto_27042 ) ( ON-TABLE ?auto_27042 ) ( not ( = ?auto_27042 ?auto_27043 ) ) )
    :subtasks
    ( ( !STACK ?auto_27043 ?auto_27042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27044 - BLOCK
      ?auto_27045 - BLOCK
    )
    :vars
    (
      ?auto_27046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27044 ) ( ON-TABLE ?auto_27044 ) ( not ( = ?auto_27044 ?auto_27045 ) ) ( ON ?auto_27045 ?auto_27046 ) ( CLEAR ?auto_27045 ) ( HAND-EMPTY ) ( not ( = ?auto_27044 ?auto_27046 ) ) ( not ( = ?auto_27045 ?auto_27046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27045 ?auto_27046 )
      ( MAKE-2PILE ?auto_27044 ?auto_27045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27047 - BLOCK
      ?auto_27048 - BLOCK
    )
    :vars
    (
      ?auto_27049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27047 ?auto_27048 ) ) ( ON ?auto_27048 ?auto_27049 ) ( CLEAR ?auto_27048 ) ( not ( = ?auto_27047 ?auto_27049 ) ) ( not ( = ?auto_27048 ?auto_27049 ) ) ( HOLDING ?auto_27047 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27047 )
      ( MAKE-2PILE ?auto_27047 ?auto_27048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27050 - BLOCK
      ?auto_27051 - BLOCK
    )
    :vars
    (
      ?auto_27052 - BLOCK
      ?auto_27054 - BLOCK
      ?auto_27053 - BLOCK
      ?auto_27055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27050 ?auto_27051 ) ) ( ON ?auto_27051 ?auto_27052 ) ( not ( = ?auto_27050 ?auto_27052 ) ) ( not ( = ?auto_27051 ?auto_27052 ) ) ( ON ?auto_27050 ?auto_27051 ) ( CLEAR ?auto_27050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27054 ) ( ON ?auto_27053 ?auto_27054 ) ( ON ?auto_27055 ?auto_27053 ) ( ON ?auto_27052 ?auto_27055 ) ( not ( = ?auto_27054 ?auto_27053 ) ) ( not ( = ?auto_27054 ?auto_27055 ) ) ( not ( = ?auto_27054 ?auto_27052 ) ) ( not ( = ?auto_27054 ?auto_27051 ) ) ( not ( = ?auto_27054 ?auto_27050 ) ) ( not ( = ?auto_27053 ?auto_27055 ) ) ( not ( = ?auto_27053 ?auto_27052 ) ) ( not ( = ?auto_27053 ?auto_27051 ) ) ( not ( = ?auto_27053 ?auto_27050 ) ) ( not ( = ?auto_27055 ?auto_27052 ) ) ( not ( = ?auto_27055 ?auto_27051 ) ) ( not ( = ?auto_27055 ?auto_27050 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27054 ?auto_27053 ?auto_27055 ?auto_27052 ?auto_27051 )
      ( MAKE-2PILE ?auto_27050 ?auto_27051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27059 - BLOCK
      ?auto_27060 - BLOCK
      ?auto_27061 - BLOCK
    )
    :vars
    (
      ?auto_27062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27062 ?auto_27061 ) ( CLEAR ?auto_27062 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27059 ) ( ON ?auto_27060 ?auto_27059 ) ( ON ?auto_27061 ?auto_27060 ) ( not ( = ?auto_27059 ?auto_27060 ) ) ( not ( = ?auto_27059 ?auto_27061 ) ) ( not ( = ?auto_27059 ?auto_27062 ) ) ( not ( = ?auto_27060 ?auto_27061 ) ) ( not ( = ?auto_27060 ?auto_27062 ) ) ( not ( = ?auto_27061 ?auto_27062 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27062 ?auto_27061 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27063 - BLOCK
      ?auto_27064 - BLOCK
      ?auto_27065 - BLOCK
    )
    :vars
    (
      ?auto_27066 - BLOCK
      ?auto_27067 - BLOCK
      ?auto_27068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27066 ?auto_27065 ) ( CLEAR ?auto_27066 ) ( ON-TABLE ?auto_27063 ) ( ON ?auto_27064 ?auto_27063 ) ( ON ?auto_27065 ?auto_27064 ) ( not ( = ?auto_27063 ?auto_27064 ) ) ( not ( = ?auto_27063 ?auto_27065 ) ) ( not ( = ?auto_27063 ?auto_27066 ) ) ( not ( = ?auto_27064 ?auto_27065 ) ) ( not ( = ?auto_27064 ?auto_27066 ) ) ( not ( = ?auto_27065 ?auto_27066 ) ) ( HOLDING ?auto_27067 ) ( CLEAR ?auto_27068 ) ( not ( = ?auto_27063 ?auto_27067 ) ) ( not ( = ?auto_27063 ?auto_27068 ) ) ( not ( = ?auto_27064 ?auto_27067 ) ) ( not ( = ?auto_27064 ?auto_27068 ) ) ( not ( = ?auto_27065 ?auto_27067 ) ) ( not ( = ?auto_27065 ?auto_27068 ) ) ( not ( = ?auto_27066 ?auto_27067 ) ) ( not ( = ?auto_27066 ?auto_27068 ) ) ( not ( = ?auto_27067 ?auto_27068 ) ) )
    :subtasks
    ( ( !STACK ?auto_27067 ?auto_27068 )
      ( MAKE-3PILE ?auto_27063 ?auto_27064 ?auto_27065 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27431 - BLOCK
      ?auto_27432 - BLOCK
      ?auto_27433 - BLOCK
    )
    :vars
    (
      ?auto_27435 - BLOCK
      ?auto_27434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27435 ?auto_27433 ) ( ON-TABLE ?auto_27431 ) ( ON ?auto_27432 ?auto_27431 ) ( ON ?auto_27433 ?auto_27432 ) ( not ( = ?auto_27431 ?auto_27432 ) ) ( not ( = ?auto_27431 ?auto_27433 ) ) ( not ( = ?auto_27431 ?auto_27435 ) ) ( not ( = ?auto_27432 ?auto_27433 ) ) ( not ( = ?auto_27432 ?auto_27435 ) ) ( not ( = ?auto_27433 ?auto_27435 ) ) ( not ( = ?auto_27431 ?auto_27434 ) ) ( not ( = ?auto_27432 ?auto_27434 ) ) ( not ( = ?auto_27433 ?auto_27434 ) ) ( not ( = ?auto_27435 ?auto_27434 ) ) ( ON ?auto_27434 ?auto_27435 ) ( CLEAR ?auto_27434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27431 ?auto_27432 ?auto_27433 ?auto_27435 )
      ( MAKE-3PILE ?auto_27431 ?auto_27432 ?auto_27433 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27075 - BLOCK
      ?auto_27076 - BLOCK
      ?auto_27077 - BLOCK
    )
    :vars
    (
      ?auto_27080 - BLOCK
      ?auto_27079 - BLOCK
      ?auto_27078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27080 ?auto_27077 ) ( ON-TABLE ?auto_27075 ) ( ON ?auto_27076 ?auto_27075 ) ( ON ?auto_27077 ?auto_27076 ) ( not ( = ?auto_27075 ?auto_27076 ) ) ( not ( = ?auto_27075 ?auto_27077 ) ) ( not ( = ?auto_27075 ?auto_27080 ) ) ( not ( = ?auto_27076 ?auto_27077 ) ) ( not ( = ?auto_27076 ?auto_27080 ) ) ( not ( = ?auto_27077 ?auto_27080 ) ) ( not ( = ?auto_27075 ?auto_27079 ) ) ( not ( = ?auto_27075 ?auto_27078 ) ) ( not ( = ?auto_27076 ?auto_27079 ) ) ( not ( = ?auto_27076 ?auto_27078 ) ) ( not ( = ?auto_27077 ?auto_27079 ) ) ( not ( = ?auto_27077 ?auto_27078 ) ) ( not ( = ?auto_27080 ?auto_27079 ) ) ( not ( = ?auto_27080 ?auto_27078 ) ) ( not ( = ?auto_27079 ?auto_27078 ) ) ( ON ?auto_27079 ?auto_27080 ) ( CLEAR ?auto_27079 ) ( HOLDING ?auto_27078 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27078 )
      ( MAKE-3PILE ?auto_27075 ?auto_27076 ?auto_27077 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27081 - BLOCK
      ?auto_27082 - BLOCK
      ?auto_27083 - BLOCK
    )
    :vars
    (
      ?auto_27084 - BLOCK
      ?auto_27085 - BLOCK
      ?auto_27086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27084 ?auto_27083 ) ( ON-TABLE ?auto_27081 ) ( ON ?auto_27082 ?auto_27081 ) ( ON ?auto_27083 ?auto_27082 ) ( not ( = ?auto_27081 ?auto_27082 ) ) ( not ( = ?auto_27081 ?auto_27083 ) ) ( not ( = ?auto_27081 ?auto_27084 ) ) ( not ( = ?auto_27082 ?auto_27083 ) ) ( not ( = ?auto_27082 ?auto_27084 ) ) ( not ( = ?auto_27083 ?auto_27084 ) ) ( not ( = ?auto_27081 ?auto_27085 ) ) ( not ( = ?auto_27081 ?auto_27086 ) ) ( not ( = ?auto_27082 ?auto_27085 ) ) ( not ( = ?auto_27082 ?auto_27086 ) ) ( not ( = ?auto_27083 ?auto_27085 ) ) ( not ( = ?auto_27083 ?auto_27086 ) ) ( not ( = ?auto_27084 ?auto_27085 ) ) ( not ( = ?auto_27084 ?auto_27086 ) ) ( not ( = ?auto_27085 ?auto_27086 ) ) ( ON ?auto_27085 ?auto_27084 ) ( ON ?auto_27086 ?auto_27085 ) ( CLEAR ?auto_27086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27081 ?auto_27082 ?auto_27083 ?auto_27084 ?auto_27085 )
      ( MAKE-3PILE ?auto_27081 ?auto_27082 ?auto_27083 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27090 - BLOCK
      ?auto_27091 - BLOCK
      ?auto_27092 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27092 ) ( CLEAR ?auto_27091 ) ( ON-TABLE ?auto_27090 ) ( ON ?auto_27091 ?auto_27090 ) ( not ( = ?auto_27090 ?auto_27091 ) ) ( not ( = ?auto_27090 ?auto_27092 ) ) ( not ( = ?auto_27091 ?auto_27092 ) ) )
    :subtasks
    ( ( !STACK ?auto_27092 ?auto_27091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27093 - BLOCK
      ?auto_27094 - BLOCK
      ?auto_27095 - BLOCK
    )
    :vars
    (
      ?auto_27096 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27094 ) ( ON-TABLE ?auto_27093 ) ( ON ?auto_27094 ?auto_27093 ) ( not ( = ?auto_27093 ?auto_27094 ) ) ( not ( = ?auto_27093 ?auto_27095 ) ) ( not ( = ?auto_27094 ?auto_27095 ) ) ( ON ?auto_27095 ?auto_27096 ) ( CLEAR ?auto_27095 ) ( HAND-EMPTY ) ( not ( = ?auto_27093 ?auto_27096 ) ) ( not ( = ?auto_27094 ?auto_27096 ) ) ( not ( = ?auto_27095 ?auto_27096 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27095 ?auto_27096 )
      ( MAKE-3PILE ?auto_27093 ?auto_27094 ?auto_27095 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27097 - BLOCK
      ?auto_27098 - BLOCK
      ?auto_27099 - BLOCK
    )
    :vars
    (
      ?auto_27100 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27097 ) ( not ( = ?auto_27097 ?auto_27098 ) ) ( not ( = ?auto_27097 ?auto_27099 ) ) ( not ( = ?auto_27098 ?auto_27099 ) ) ( ON ?auto_27099 ?auto_27100 ) ( CLEAR ?auto_27099 ) ( not ( = ?auto_27097 ?auto_27100 ) ) ( not ( = ?auto_27098 ?auto_27100 ) ) ( not ( = ?auto_27099 ?auto_27100 ) ) ( HOLDING ?auto_27098 ) ( CLEAR ?auto_27097 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27097 ?auto_27098 )
      ( MAKE-3PILE ?auto_27097 ?auto_27098 ?auto_27099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27101 - BLOCK
      ?auto_27102 - BLOCK
      ?auto_27103 - BLOCK
    )
    :vars
    (
      ?auto_27104 - BLOCK
      ?auto_27105 - BLOCK
      ?auto_27106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27101 ) ( not ( = ?auto_27101 ?auto_27102 ) ) ( not ( = ?auto_27101 ?auto_27103 ) ) ( not ( = ?auto_27102 ?auto_27103 ) ) ( ON ?auto_27103 ?auto_27104 ) ( not ( = ?auto_27101 ?auto_27104 ) ) ( not ( = ?auto_27102 ?auto_27104 ) ) ( not ( = ?auto_27103 ?auto_27104 ) ) ( CLEAR ?auto_27101 ) ( ON ?auto_27102 ?auto_27103 ) ( CLEAR ?auto_27102 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27105 ) ( ON ?auto_27106 ?auto_27105 ) ( ON ?auto_27104 ?auto_27106 ) ( not ( = ?auto_27105 ?auto_27106 ) ) ( not ( = ?auto_27105 ?auto_27104 ) ) ( not ( = ?auto_27105 ?auto_27103 ) ) ( not ( = ?auto_27105 ?auto_27102 ) ) ( not ( = ?auto_27106 ?auto_27104 ) ) ( not ( = ?auto_27106 ?auto_27103 ) ) ( not ( = ?auto_27106 ?auto_27102 ) ) ( not ( = ?auto_27101 ?auto_27105 ) ) ( not ( = ?auto_27101 ?auto_27106 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27105 ?auto_27106 ?auto_27104 ?auto_27103 )
      ( MAKE-3PILE ?auto_27101 ?auto_27102 ?auto_27103 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27107 - BLOCK
      ?auto_27108 - BLOCK
      ?auto_27109 - BLOCK
    )
    :vars
    (
      ?auto_27110 - BLOCK
      ?auto_27112 - BLOCK
      ?auto_27111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27107 ?auto_27108 ) ) ( not ( = ?auto_27107 ?auto_27109 ) ) ( not ( = ?auto_27108 ?auto_27109 ) ) ( ON ?auto_27109 ?auto_27110 ) ( not ( = ?auto_27107 ?auto_27110 ) ) ( not ( = ?auto_27108 ?auto_27110 ) ) ( not ( = ?auto_27109 ?auto_27110 ) ) ( ON ?auto_27108 ?auto_27109 ) ( CLEAR ?auto_27108 ) ( ON-TABLE ?auto_27112 ) ( ON ?auto_27111 ?auto_27112 ) ( ON ?auto_27110 ?auto_27111 ) ( not ( = ?auto_27112 ?auto_27111 ) ) ( not ( = ?auto_27112 ?auto_27110 ) ) ( not ( = ?auto_27112 ?auto_27109 ) ) ( not ( = ?auto_27112 ?auto_27108 ) ) ( not ( = ?auto_27111 ?auto_27110 ) ) ( not ( = ?auto_27111 ?auto_27109 ) ) ( not ( = ?auto_27111 ?auto_27108 ) ) ( not ( = ?auto_27107 ?auto_27112 ) ) ( not ( = ?auto_27107 ?auto_27111 ) ) ( HOLDING ?auto_27107 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27107 )
      ( MAKE-3PILE ?auto_27107 ?auto_27108 ?auto_27109 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27113 - BLOCK
      ?auto_27114 - BLOCK
      ?auto_27115 - BLOCK
    )
    :vars
    (
      ?auto_27116 - BLOCK
      ?auto_27118 - BLOCK
      ?auto_27117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27113 ?auto_27114 ) ) ( not ( = ?auto_27113 ?auto_27115 ) ) ( not ( = ?auto_27114 ?auto_27115 ) ) ( ON ?auto_27115 ?auto_27116 ) ( not ( = ?auto_27113 ?auto_27116 ) ) ( not ( = ?auto_27114 ?auto_27116 ) ) ( not ( = ?auto_27115 ?auto_27116 ) ) ( ON ?auto_27114 ?auto_27115 ) ( ON-TABLE ?auto_27118 ) ( ON ?auto_27117 ?auto_27118 ) ( ON ?auto_27116 ?auto_27117 ) ( not ( = ?auto_27118 ?auto_27117 ) ) ( not ( = ?auto_27118 ?auto_27116 ) ) ( not ( = ?auto_27118 ?auto_27115 ) ) ( not ( = ?auto_27118 ?auto_27114 ) ) ( not ( = ?auto_27117 ?auto_27116 ) ) ( not ( = ?auto_27117 ?auto_27115 ) ) ( not ( = ?auto_27117 ?auto_27114 ) ) ( not ( = ?auto_27113 ?auto_27118 ) ) ( not ( = ?auto_27113 ?auto_27117 ) ) ( ON ?auto_27113 ?auto_27114 ) ( CLEAR ?auto_27113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27118 ?auto_27117 ?auto_27116 ?auto_27115 ?auto_27114 )
      ( MAKE-3PILE ?auto_27113 ?auto_27114 ?auto_27115 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27121 - BLOCK
      ?auto_27122 - BLOCK
    )
    :vars
    (
      ?auto_27123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27123 ?auto_27122 ) ( CLEAR ?auto_27123 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27121 ) ( ON ?auto_27122 ?auto_27121 ) ( not ( = ?auto_27121 ?auto_27122 ) ) ( not ( = ?auto_27121 ?auto_27123 ) ) ( not ( = ?auto_27122 ?auto_27123 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27123 ?auto_27122 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27124 - BLOCK
      ?auto_27125 - BLOCK
    )
    :vars
    (
      ?auto_27126 - BLOCK
      ?auto_27127 - BLOCK
      ?auto_27128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27126 ?auto_27125 ) ( CLEAR ?auto_27126 ) ( ON-TABLE ?auto_27124 ) ( ON ?auto_27125 ?auto_27124 ) ( not ( = ?auto_27124 ?auto_27125 ) ) ( not ( = ?auto_27124 ?auto_27126 ) ) ( not ( = ?auto_27125 ?auto_27126 ) ) ( HOLDING ?auto_27127 ) ( CLEAR ?auto_27128 ) ( not ( = ?auto_27124 ?auto_27127 ) ) ( not ( = ?auto_27124 ?auto_27128 ) ) ( not ( = ?auto_27125 ?auto_27127 ) ) ( not ( = ?auto_27125 ?auto_27128 ) ) ( not ( = ?auto_27126 ?auto_27127 ) ) ( not ( = ?auto_27126 ?auto_27128 ) ) ( not ( = ?auto_27127 ?auto_27128 ) ) )
    :subtasks
    ( ( !STACK ?auto_27127 ?auto_27128 )
      ( MAKE-2PILE ?auto_27124 ?auto_27125 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27129 - BLOCK
      ?auto_27130 - BLOCK
    )
    :vars
    (
      ?auto_27132 - BLOCK
      ?auto_27133 - BLOCK
      ?auto_27131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27132 ?auto_27130 ) ( ON-TABLE ?auto_27129 ) ( ON ?auto_27130 ?auto_27129 ) ( not ( = ?auto_27129 ?auto_27130 ) ) ( not ( = ?auto_27129 ?auto_27132 ) ) ( not ( = ?auto_27130 ?auto_27132 ) ) ( CLEAR ?auto_27133 ) ( not ( = ?auto_27129 ?auto_27131 ) ) ( not ( = ?auto_27129 ?auto_27133 ) ) ( not ( = ?auto_27130 ?auto_27131 ) ) ( not ( = ?auto_27130 ?auto_27133 ) ) ( not ( = ?auto_27132 ?auto_27131 ) ) ( not ( = ?auto_27132 ?auto_27133 ) ) ( not ( = ?auto_27131 ?auto_27133 ) ) ( ON ?auto_27131 ?auto_27132 ) ( CLEAR ?auto_27131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27129 ?auto_27130 ?auto_27132 )
      ( MAKE-2PILE ?auto_27129 ?auto_27130 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27134 - BLOCK
      ?auto_27135 - BLOCK
    )
    :vars
    (
      ?auto_27138 - BLOCK
      ?auto_27136 - BLOCK
      ?auto_27137 - BLOCK
      ?auto_27139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27138 ?auto_27135 ) ( ON-TABLE ?auto_27134 ) ( ON ?auto_27135 ?auto_27134 ) ( not ( = ?auto_27134 ?auto_27135 ) ) ( not ( = ?auto_27134 ?auto_27138 ) ) ( not ( = ?auto_27135 ?auto_27138 ) ) ( not ( = ?auto_27134 ?auto_27136 ) ) ( not ( = ?auto_27134 ?auto_27137 ) ) ( not ( = ?auto_27135 ?auto_27136 ) ) ( not ( = ?auto_27135 ?auto_27137 ) ) ( not ( = ?auto_27138 ?auto_27136 ) ) ( not ( = ?auto_27138 ?auto_27137 ) ) ( not ( = ?auto_27136 ?auto_27137 ) ) ( ON ?auto_27136 ?auto_27138 ) ( CLEAR ?auto_27136 ) ( HOLDING ?auto_27137 ) ( CLEAR ?auto_27139 ) ( ON-TABLE ?auto_27139 ) ( not ( = ?auto_27139 ?auto_27137 ) ) ( not ( = ?auto_27134 ?auto_27139 ) ) ( not ( = ?auto_27135 ?auto_27139 ) ) ( not ( = ?auto_27138 ?auto_27139 ) ) ( not ( = ?auto_27136 ?auto_27139 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27139 ?auto_27137 )
      ( MAKE-2PILE ?auto_27134 ?auto_27135 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27558 - BLOCK
      ?auto_27559 - BLOCK
    )
    :vars
    (
      ?auto_27561 - BLOCK
      ?auto_27560 - BLOCK
      ?auto_27562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27561 ?auto_27559 ) ( ON-TABLE ?auto_27558 ) ( ON ?auto_27559 ?auto_27558 ) ( not ( = ?auto_27558 ?auto_27559 ) ) ( not ( = ?auto_27558 ?auto_27561 ) ) ( not ( = ?auto_27559 ?auto_27561 ) ) ( not ( = ?auto_27558 ?auto_27560 ) ) ( not ( = ?auto_27558 ?auto_27562 ) ) ( not ( = ?auto_27559 ?auto_27560 ) ) ( not ( = ?auto_27559 ?auto_27562 ) ) ( not ( = ?auto_27561 ?auto_27560 ) ) ( not ( = ?auto_27561 ?auto_27562 ) ) ( not ( = ?auto_27560 ?auto_27562 ) ) ( ON ?auto_27560 ?auto_27561 ) ( ON ?auto_27562 ?auto_27560 ) ( CLEAR ?auto_27562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27558 ?auto_27559 ?auto_27561 ?auto_27560 )
      ( MAKE-2PILE ?auto_27558 ?auto_27559 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27146 - BLOCK
      ?auto_27147 - BLOCK
    )
    :vars
    (
      ?auto_27151 - BLOCK
      ?auto_27150 - BLOCK
      ?auto_27148 - BLOCK
      ?auto_27149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27151 ?auto_27147 ) ( ON-TABLE ?auto_27146 ) ( ON ?auto_27147 ?auto_27146 ) ( not ( = ?auto_27146 ?auto_27147 ) ) ( not ( = ?auto_27146 ?auto_27151 ) ) ( not ( = ?auto_27147 ?auto_27151 ) ) ( not ( = ?auto_27146 ?auto_27150 ) ) ( not ( = ?auto_27146 ?auto_27148 ) ) ( not ( = ?auto_27147 ?auto_27150 ) ) ( not ( = ?auto_27147 ?auto_27148 ) ) ( not ( = ?auto_27151 ?auto_27150 ) ) ( not ( = ?auto_27151 ?auto_27148 ) ) ( not ( = ?auto_27150 ?auto_27148 ) ) ( ON ?auto_27150 ?auto_27151 ) ( not ( = ?auto_27149 ?auto_27148 ) ) ( not ( = ?auto_27146 ?auto_27149 ) ) ( not ( = ?auto_27147 ?auto_27149 ) ) ( not ( = ?auto_27151 ?auto_27149 ) ) ( not ( = ?auto_27150 ?auto_27149 ) ) ( ON ?auto_27148 ?auto_27150 ) ( CLEAR ?auto_27148 ) ( HOLDING ?auto_27149 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27149 )
      ( MAKE-2PILE ?auto_27146 ?auto_27147 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27152 - BLOCK
      ?auto_27153 - BLOCK
    )
    :vars
    (
      ?auto_27156 - BLOCK
      ?auto_27154 - BLOCK
      ?auto_27157 - BLOCK
      ?auto_27155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27156 ?auto_27153 ) ( ON-TABLE ?auto_27152 ) ( ON ?auto_27153 ?auto_27152 ) ( not ( = ?auto_27152 ?auto_27153 ) ) ( not ( = ?auto_27152 ?auto_27156 ) ) ( not ( = ?auto_27153 ?auto_27156 ) ) ( not ( = ?auto_27152 ?auto_27154 ) ) ( not ( = ?auto_27152 ?auto_27157 ) ) ( not ( = ?auto_27153 ?auto_27154 ) ) ( not ( = ?auto_27153 ?auto_27157 ) ) ( not ( = ?auto_27156 ?auto_27154 ) ) ( not ( = ?auto_27156 ?auto_27157 ) ) ( not ( = ?auto_27154 ?auto_27157 ) ) ( ON ?auto_27154 ?auto_27156 ) ( not ( = ?auto_27155 ?auto_27157 ) ) ( not ( = ?auto_27152 ?auto_27155 ) ) ( not ( = ?auto_27153 ?auto_27155 ) ) ( not ( = ?auto_27156 ?auto_27155 ) ) ( not ( = ?auto_27154 ?auto_27155 ) ) ( ON ?auto_27157 ?auto_27154 ) ( ON ?auto_27155 ?auto_27157 ) ( CLEAR ?auto_27155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27152 ?auto_27153 ?auto_27156 ?auto_27154 ?auto_27157 )
      ( MAKE-2PILE ?auto_27152 ?auto_27153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27162 - BLOCK
      ?auto_27163 - BLOCK
      ?auto_27164 - BLOCK
      ?auto_27165 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27165 ) ( CLEAR ?auto_27164 ) ( ON-TABLE ?auto_27162 ) ( ON ?auto_27163 ?auto_27162 ) ( ON ?auto_27164 ?auto_27163 ) ( not ( = ?auto_27162 ?auto_27163 ) ) ( not ( = ?auto_27162 ?auto_27164 ) ) ( not ( = ?auto_27162 ?auto_27165 ) ) ( not ( = ?auto_27163 ?auto_27164 ) ) ( not ( = ?auto_27163 ?auto_27165 ) ) ( not ( = ?auto_27164 ?auto_27165 ) ) )
    :subtasks
    ( ( !STACK ?auto_27165 ?auto_27164 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27166 - BLOCK
      ?auto_27167 - BLOCK
      ?auto_27168 - BLOCK
      ?auto_27169 - BLOCK
    )
    :vars
    (
      ?auto_27170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27168 ) ( ON-TABLE ?auto_27166 ) ( ON ?auto_27167 ?auto_27166 ) ( ON ?auto_27168 ?auto_27167 ) ( not ( = ?auto_27166 ?auto_27167 ) ) ( not ( = ?auto_27166 ?auto_27168 ) ) ( not ( = ?auto_27166 ?auto_27169 ) ) ( not ( = ?auto_27167 ?auto_27168 ) ) ( not ( = ?auto_27167 ?auto_27169 ) ) ( not ( = ?auto_27168 ?auto_27169 ) ) ( ON ?auto_27169 ?auto_27170 ) ( CLEAR ?auto_27169 ) ( HAND-EMPTY ) ( not ( = ?auto_27166 ?auto_27170 ) ) ( not ( = ?auto_27167 ?auto_27170 ) ) ( not ( = ?auto_27168 ?auto_27170 ) ) ( not ( = ?auto_27169 ?auto_27170 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27169 ?auto_27170 )
      ( MAKE-4PILE ?auto_27166 ?auto_27167 ?auto_27168 ?auto_27169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27171 - BLOCK
      ?auto_27172 - BLOCK
      ?auto_27173 - BLOCK
      ?auto_27174 - BLOCK
    )
    :vars
    (
      ?auto_27175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27171 ) ( ON ?auto_27172 ?auto_27171 ) ( not ( = ?auto_27171 ?auto_27172 ) ) ( not ( = ?auto_27171 ?auto_27173 ) ) ( not ( = ?auto_27171 ?auto_27174 ) ) ( not ( = ?auto_27172 ?auto_27173 ) ) ( not ( = ?auto_27172 ?auto_27174 ) ) ( not ( = ?auto_27173 ?auto_27174 ) ) ( ON ?auto_27174 ?auto_27175 ) ( CLEAR ?auto_27174 ) ( not ( = ?auto_27171 ?auto_27175 ) ) ( not ( = ?auto_27172 ?auto_27175 ) ) ( not ( = ?auto_27173 ?auto_27175 ) ) ( not ( = ?auto_27174 ?auto_27175 ) ) ( HOLDING ?auto_27173 ) ( CLEAR ?auto_27172 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27171 ?auto_27172 ?auto_27173 )
      ( MAKE-4PILE ?auto_27171 ?auto_27172 ?auto_27173 ?auto_27174 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27176 - BLOCK
      ?auto_27177 - BLOCK
      ?auto_27178 - BLOCK
      ?auto_27179 - BLOCK
    )
    :vars
    (
      ?auto_27180 - BLOCK
      ?auto_27181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27176 ) ( ON ?auto_27177 ?auto_27176 ) ( not ( = ?auto_27176 ?auto_27177 ) ) ( not ( = ?auto_27176 ?auto_27178 ) ) ( not ( = ?auto_27176 ?auto_27179 ) ) ( not ( = ?auto_27177 ?auto_27178 ) ) ( not ( = ?auto_27177 ?auto_27179 ) ) ( not ( = ?auto_27178 ?auto_27179 ) ) ( ON ?auto_27179 ?auto_27180 ) ( not ( = ?auto_27176 ?auto_27180 ) ) ( not ( = ?auto_27177 ?auto_27180 ) ) ( not ( = ?auto_27178 ?auto_27180 ) ) ( not ( = ?auto_27179 ?auto_27180 ) ) ( CLEAR ?auto_27177 ) ( ON ?auto_27178 ?auto_27179 ) ( CLEAR ?auto_27178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27181 ) ( ON ?auto_27180 ?auto_27181 ) ( not ( = ?auto_27181 ?auto_27180 ) ) ( not ( = ?auto_27181 ?auto_27179 ) ) ( not ( = ?auto_27181 ?auto_27178 ) ) ( not ( = ?auto_27176 ?auto_27181 ) ) ( not ( = ?auto_27177 ?auto_27181 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27181 ?auto_27180 ?auto_27179 )
      ( MAKE-4PILE ?auto_27176 ?auto_27177 ?auto_27178 ?auto_27179 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27182 - BLOCK
      ?auto_27183 - BLOCK
      ?auto_27184 - BLOCK
      ?auto_27185 - BLOCK
    )
    :vars
    (
      ?auto_27186 - BLOCK
      ?auto_27187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27182 ) ( not ( = ?auto_27182 ?auto_27183 ) ) ( not ( = ?auto_27182 ?auto_27184 ) ) ( not ( = ?auto_27182 ?auto_27185 ) ) ( not ( = ?auto_27183 ?auto_27184 ) ) ( not ( = ?auto_27183 ?auto_27185 ) ) ( not ( = ?auto_27184 ?auto_27185 ) ) ( ON ?auto_27185 ?auto_27186 ) ( not ( = ?auto_27182 ?auto_27186 ) ) ( not ( = ?auto_27183 ?auto_27186 ) ) ( not ( = ?auto_27184 ?auto_27186 ) ) ( not ( = ?auto_27185 ?auto_27186 ) ) ( ON ?auto_27184 ?auto_27185 ) ( CLEAR ?auto_27184 ) ( ON-TABLE ?auto_27187 ) ( ON ?auto_27186 ?auto_27187 ) ( not ( = ?auto_27187 ?auto_27186 ) ) ( not ( = ?auto_27187 ?auto_27185 ) ) ( not ( = ?auto_27187 ?auto_27184 ) ) ( not ( = ?auto_27182 ?auto_27187 ) ) ( not ( = ?auto_27183 ?auto_27187 ) ) ( HOLDING ?auto_27183 ) ( CLEAR ?auto_27182 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27182 ?auto_27183 )
      ( MAKE-4PILE ?auto_27182 ?auto_27183 ?auto_27184 ?auto_27185 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27188 - BLOCK
      ?auto_27189 - BLOCK
      ?auto_27190 - BLOCK
      ?auto_27191 - BLOCK
    )
    :vars
    (
      ?auto_27193 - BLOCK
      ?auto_27192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27188 ) ( not ( = ?auto_27188 ?auto_27189 ) ) ( not ( = ?auto_27188 ?auto_27190 ) ) ( not ( = ?auto_27188 ?auto_27191 ) ) ( not ( = ?auto_27189 ?auto_27190 ) ) ( not ( = ?auto_27189 ?auto_27191 ) ) ( not ( = ?auto_27190 ?auto_27191 ) ) ( ON ?auto_27191 ?auto_27193 ) ( not ( = ?auto_27188 ?auto_27193 ) ) ( not ( = ?auto_27189 ?auto_27193 ) ) ( not ( = ?auto_27190 ?auto_27193 ) ) ( not ( = ?auto_27191 ?auto_27193 ) ) ( ON ?auto_27190 ?auto_27191 ) ( ON-TABLE ?auto_27192 ) ( ON ?auto_27193 ?auto_27192 ) ( not ( = ?auto_27192 ?auto_27193 ) ) ( not ( = ?auto_27192 ?auto_27191 ) ) ( not ( = ?auto_27192 ?auto_27190 ) ) ( not ( = ?auto_27188 ?auto_27192 ) ) ( not ( = ?auto_27189 ?auto_27192 ) ) ( CLEAR ?auto_27188 ) ( ON ?auto_27189 ?auto_27190 ) ( CLEAR ?auto_27189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27192 ?auto_27193 ?auto_27191 ?auto_27190 )
      ( MAKE-4PILE ?auto_27188 ?auto_27189 ?auto_27190 ?auto_27191 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27194 - BLOCK
      ?auto_27195 - BLOCK
      ?auto_27196 - BLOCK
      ?auto_27197 - BLOCK
    )
    :vars
    (
      ?auto_27198 - BLOCK
      ?auto_27199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27194 ?auto_27195 ) ) ( not ( = ?auto_27194 ?auto_27196 ) ) ( not ( = ?auto_27194 ?auto_27197 ) ) ( not ( = ?auto_27195 ?auto_27196 ) ) ( not ( = ?auto_27195 ?auto_27197 ) ) ( not ( = ?auto_27196 ?auto_27197 ) ) ( ON ?auto_27197 ?auto_27198 ) ( not ( = ?auto_27194 ?auto_27198 ) ) ( not ( = ?auto_27195 ?auto_27198 ) ) ( not ( = ?auto_27196 ?auto_27198 ) ) ( not ( = ?auto_27197 ?auto_27198 ) ) ( ON ?auto_27196 ?auto_27197 ) ( ON-TABLE ?auto_27199 ) ( ON ?auto_27198 ?auto_27199 ) ( not ( = ?auto_27199 ?auto_27198 ) ) ( not ( = ?auto_27199 ?auto_27197 ) ) ( not ( = ?auto_27199 ?auto_27196 ) ) ( not ( = ?auto_27194 ?auto_27199 ) ) ( not ( = ?auto_27195 ?auto_27199 ) ) ( ON ?auto_27195 ?auto_27196 ) ( CLEAR ?auto_27195 ) ( HOLDING ?auto_27194 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27194 )
      ( MAKE-4PILE ?auto_27194 ?auto_27195 ?auto_27196 ?auto_27197 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27200 - BLOCK
      ?auto_27201 - BLOCK
      ?auto_27202 - BLOCK
      ?auto_27203 - BLOCK
    )
    :vars
    (
      ?auto_27205 - BLOCK
      ?auto_27204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27200 ?auto_27201 ) ) ( not ( = ?auto_27200 ?auto_27202 ) ) ( not ( = ?auto_27200 ?auto_27203 ) ) ( not ( = ?auto_27201 ?auto_27202 ) ) ( not ( = ?auto_27201 ?auto_27203 ) ) ( not ( = ?auto_27202 ?auto_27203 ) ) ( ON ?auto_27203 ?auto_27205 ) ( not ( = ?auto_27200 ?auto_27205 ) ) ( not ( = ?auto_27201 ?auto_27205 ) ) ( not ( = ?auto_27202 ?auto_27205 ) ) ( not ( = ?auto_27203 ?auto_27205 ) ) ( ON ?auto_27202 ?auto_27203 ) ( ON-TABLE ?auto_27204 ) ( ON ?auto_27205 ?auto_27204 ) ( not ( = ?auto_27204 ?auto_27205 ) ) ( not ( = ?auto_27204 ?auto_27203 ) ) ( not ( = ?auto_27204 ?auto_27202 ) ) ( not ( = ?auto_27200 ?auto_27204 ) ) ( not ( = ?auto_27201 ?auto_27204 ) ) ( ON ?auto_27201 ?auto_27202 ) ( ON ?auto_27200 ?auto_27201 ) ( CLEAR ?auto_27200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27204 ?auto_27205 ?auto_27203 ?auto_27202 ?auto_27201 )
      ( MAKE-4PILE ?auto_27200 ?auto_27201 ?auto_27202 ?auto_27203 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27207 - BLOCK
    )
    :vars
    (
      ?auto_27208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27208 ?auto_27207 ) ( CLEAR ?auto_27208 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27207 ) ( not ( = ?auto_27207 ?auto_27208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27208 ?auto_27207 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27209 - BLOCK
    )
    :vars
    (
      ?auto_27210 - BLOCK
      ?auto_27211 - BLOCK
      ?auto_27212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27210 ?auto_27209 ) ( CLEAR ?auto_27210 ) ( ON-TABLE ?auto_27209 ) ( not ( = ?auto_27209 ?auto_27210 ) ) ( HOLDING ?auto_27211 ) ( CLEAR ?auto_27212 ) ( not ( = ?auto_27209 ?auto_27211 ) ) ( not ( = ?auto_27209 ?auto_27212 ) ) ( not ( = ?auto_27210 ?auto_27211 ) ) ( not ( = ?auto_27210 ?auto_27212 ) ) ( not ( = ?auto_27211 ?auto_27212 ) ) )
    :subtasks
    ( ( !STACK ?auto_27211 ?auto_27212 )
      ( MAKE-1PILE ?auto_27209 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27213 - BLOCK
    )
    :vars
    (
      ?auto_27215 - BLOCK
      ?auto_27214 - BLOCK
      ?auto_27216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27215 ?auto_27213 ) ( ON-TABLE ?auto_27213 ) ( not ( = ?auto_27213 ?auto_27215 ) ) ( CLEAR ?auto_27214 ) ( not ( = ?auto_27213 ?auto_27216 ) ) ( not ( = ?auto_27213 ?auto_27214 ) ) ( not ( = ?auto_27215 ?auto_27216 ) ) ( not ( = ?auto_27215 ?auto_27214 ) ) ( not ( = ?auto_27216 ?auto_27214 ) ) ( ON ?auto_27216 ?auto_27215 ) ( CLEAR ?auto_27216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27213 ?auto_27215 )
      ( MAKE-1PILE ?auto_27213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27217 - BLOCK
    )
    :vars
    (
      ?auto_27219 - BLOCK
      ?auto_27218 - BLOCK
      ?auto_27220 - BLOCK
      ?auto_27222 - BLOCK
      ?auto_27221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27219 ?auto_27217 ) ( ON-TABLE ?auto_27217 ) ( not ( = ?auto_27217 ?auto_27219 ) ) ( not ( = ?auto_27217 ?auto_27218 ) ) ( not ( = ?auto_27217 ?auto_27220 ) ) ( not ( = ?auto_27219 ?auto_27218 ) ) ( not ( = ?auto_27219 ?auto_27220 ) ) ( not ( = ?auto_27218 ?auto_27220 ) ) ( ON ?auto_27218 ?auto_27219 ) ( CLEAR ?auto_27218 ) ( HOLDING ?auto_27220 ) ( CLEAR ?auto_27222 ) ( ON-TABLE ?auto_27221 ) ( ON ?auto_27222 ?auto_27221 ) ( not ( = ?auto_27221 ?auto_27222 ) ) ( not ( = ?auto_27221 ?auto_27220 ) ) ( not ( = ?auto_27222 ?auto_27220 ) ) ( not ( = ?auto_27217 ?auto_27222 ) ) ( not ( = ?auto_27217 ?auto_27221 ) ) ( not ( = ?auto_27219 ?auto_27222 ) ) ( not ( = ?auto_27219 ?auto_27221 ) ) ( not ( = ?auto_27218 ?auto_27222 ) ) ( not ( = ?auto_27218 ?auto_27221 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27221 ?auto_27222 ?auto_27220 )
      ( MAKE-1PILE ?auto_27217 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27223 - BLOCK
    )
    :vars
    (
      ?auto_27225 - BLOCK
      ?auto_27227 - BLOCK
      ?auto_27228 - BLOCK
      ?auto_27224 - BLOCK
      ?auto_27226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27225 ?auto_27223 ) ( ON-TABLE ?auto_27223 ) ( not ( = ?auto_27223 ?auto_27225 ) ) ( not ( = ?auto_27223 ?auto_27227 ) ) ( not ( = ?auto_27223 ?auto_27228 ) ) ( not ( = ?auto_27225 ?auto_27227 ) ) ( not ( = ?auto_27225 ?auto_27228 ) ) ( not ( = ?auto_27227 ?auto_27228 ) ) ( ON ?auto_27227 ?auto_27225 ) ( CLEAR ?auto_27224 ) ( ON-TABLE ?auto_27226 ) ( ON ?auto_27224 ?auto_27226 ) ( not ( = ?auto_27226 ?auto_27224 ) ) ( not ( = ?auto_27226 ?auto_27228 ) ) ( not ( = ?auto_27224 ?auto_27228 ) ) ( not ( = ?auto_27223 ?auto_27224 ) ) ( not ( = ?auto_27223 ?auto_27226 ) ) ( not ( = ?auto_27225 ?auto_27224 ) ) ( not ( = ?auto_27225 ?auto_27226 ) ) ( not ( = ?auto_27227 ?auto_27224 ) ) ( not ( = ?auto_27227 ?auto_27226 ) ) ( ON ?auto_27228 ?auto_27227 ) ( CLEAR ?auto_27228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27223 ?auto_27225 ?auto_27227 )
      ( MAKE-1PILE ?auto_27223 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27229 - BLOCK
    )
    :vars
    (
      ?auto_27233 - BLOCK
      ?auto_27232 - BLOCK
      ?auto_27234 - BLOCK
      ?auto_27230 - BLOCK
      ?auto_27231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27233 ?auto_27229 ) ( ON-TABLE ?auto_27229 ) ( not ( = ?auto_27229 ?auto_27233 ) ) ( not ( = ?auto_27229 ?auto_27232 ) ) ( not ( = ?auto_27229 ?auto_27234 ) ) ( not ( = ?auto_27233 ?auto_27232 ) ) ( not ( = ?auto_27233 ?auto_27234 ) ) ( not ( = ?auto_27232 ?auto_27234 ) ) ( ON ?auto_27232 ?auto_27233 ) ( ON-TABLE ?auto_27230 ) ( not ( = ?auto_27230 ?auto_27231 ) ) ( not ( = ?auto_27230 ?auto_27234 ) ) ( not ( = ?auto_27231 ?auto_27234 ) ) ( not ( = ?auto_27229 ?auto_27231 ) ) ( not ( = ?auto_27229 ?auto_27230 ) ) ( not ( = ?auto_27233 ?auto_27231 ) ) ( not ( = ?auto_27233 ?auto_27230 ) ) ( not ( = ?auto_27232 ?auto_27231 ) ) ( not ( = ?auto_27232 ?auto_27230 ) ) ( ON ?auto_27234 ?auto_27232 ) ( CLEAR ?auto_27234 ) ( HOLDING ?auto_27231 ) ( CLEAR ?auto_27230 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27230 ?auto_27231 )
      ( MAKE-1PILE ?auto_27229 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27698 - BLOCK
    )
    :vars
    (
      ?auto_27699 - BLOCK
      ?auto_27702 - BLOCK
      ?auto_27701 - BLOCK
      ?auto_27700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27699 ?auto_27698 ) ( ON-TABLE ?auto_27698 ) ( not ( = ?auto_27698 ?auto_27699 ) ) ( not ( = ?auto_27698 ?auto_27702 ) ) ( not ( = ?auto_27698 ?auto_27701 ) ) ( not ( = ?auto_27699 ?auto_27702 ) ) ( not ( = ?auto_27699 ?auto_27701 ) ) ( not ( = ?auto_27702 ?auto_27701 ) ) ( ON ?auto_27702 ?auto_27699 ) ( not ( = ?auto_27700 ?auto_27701 ) ) ( not ( = ?auto_27698 ?auto_27700 ) ) ( not ( = ?auto_27699 ?auto_27700 ) ) ( not ( = ?auto_27702 ?auto_27700 ) ) ( ON ?auto_27701 ?auto_27702 ) ( ON ?auto_27700 ?auto_27701 ) ( CLEAR ?auto_27700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27698 ?auto_27699 ?auto_27702 ?auto_27701 )
      ( MAKE-1PILE ?auto_27698 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27241 - BLOCK
    )
    :vars
    (
      ?auto_27243 - BLOCK
      ?auto_27244 - BLOCK
      ?auto_27242 - BLOCK
      ?auto_27245 - BLOCK
      ?auto_27246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27243 ?auto_27241 ) ( ON-TABLE ?auto_27241 ) ( not ( = ?auto_27241 ?auto_27243 ) ) ( not ( = ?auto_27241 ?auto_27244 ) ) ( not ( = ?auto_27241 ?auto_27242 ) ) ( not ( = ?auto_27243 ?auto_27244 ) ) ( not ( = ?auto_27243 ?auto_27242 ) ) ( not ( = ?auto_27244 ?auto_27242 ) ) ( ON ?auto_27244 ?auto_27243 ) ( not ( = ?auto_27245 ?auto_27246 ) ) ( not ( = ?auto_27245 ?auto_27242 ) ) ( not ( = ?auto_27246 ?auto_27242 ) ) ( not ( = ?auto_27241 ?auto_27246 ) ) ( not ( = ?auto_27241 ?auto_27245 ) ) ( not ( = ?auto_27243 ?auto_27246 ) ) ( not ( = ?auto_27243 ?auto_27245 ) ) ( not ( = ?auto_27244 ?auto_27246 ) ) ( not ( = ?auto_27244 ?auto_27245 ) ) ( ON ?auto_27242 ?auto_27244 ) ( ON ?auto_27246 ?auto_27242 ) ( CLEAR ?auto_27246 ) ( HOLDING ?auto_27245 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27245 )
      ( MAKE-1PILE ?auto_27241 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27247 - BLOCK
    )
    :vars
    (
      ?auto_27250 - BLOCK
      ?auto_27251 - BLOCK
      ?auto_27252 - BLOCK
      ?auto_27249 - BLOCK
      ?auto_27248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27250 ?auto_27247 ) ( ON-TABLE ?auto_27247 ) ( not ( = ?auto_27247 ?auto_27250 ) ) ( not ( = ?auto_27247 ?auto_27251 ) ) ( not ( = ?auto_27247 ?auto_27252 ) ) ( not ( = ?auto_27250 ?auto_27251 ) ) ( not ( = ?auto_27250 ?auto_27252 ) ) ( not ( = ?auto_27251 ?auto_27252 ) ) ( ON ?auto_27251 ?auto_27250 ) ( not ( = ?auto_27249 ?auto_27248 ) ) ( not ( = ?auto_27249 ?auto_27252 ) ) ( not ( = ?auto_27248 ?auto_27252 ) ) ( not ( = ?auto_27247 ?auto_27248 ) ) ( not ( = ?auto_27247 ?auto_27249 ) ) ( not ( = ?auto_27250 ?auto_27248 ) ) ( not ( = ?auto_27250 ?auto_27249 ) ) ( not ( = ?auto_27251 ?auto_27248 ) ) ( not ( = ?auto_27251 ?auto_27249 ) ) ( ON ?auto_27252 ?auto_27251 ) ( ON ?auto_27248 ?auto_27252 ) ( ON ?auto_27249 ?auto_27248 ) ( CLEAR ?auto_27249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27247 ?auto_27250 ?auto_27251 ?auto_27252 ?auto_27248 )
      ( MAKE-1PILE ?auto_27247 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27258 - BLOCK
      ?auto_27259 - BLOCK
      ?auto_27260 - BLOCK
      ?auto_27261 - BLOCK
      ?auto_27262 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27262 ) ( CLEAR ?auto_27261 ) ( ON-TABLE ?auto_27258 ) ( ON ?auto_27259 ?auto_27258 ) ( ON ?auto_27260 ?auto_27259 ) ( ON ?auto_27261 ?auto_27260 ) ( not ( = ?auto_27258 ?auto_27259 ) ) ( not ( = ?auto_27258 ?auto_27260 ) ) ( not ( = ?auto_27258 ?auto_27261 ) ) ( not ( = ?auto_27258 ?auto_27262 ) ) ( not ( = ?auto_27259 ?auto_27260 ) ) ( not ( = ?auto_27259 ?auto_27261 ) ) ( not ( = ?auto_27259 ?auto_27262 ) ) ( not ( = ?auto_27260 ?auto_27261 ) ) ( not ( = ?auto_27260 ?auto_27262 ) ) ( not ( = ?auto_27261 ?auto_27262 ) ) )
    :subtasks
    ( ( !STACK ?auto_27262 ?auto_27261 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27263 - BLOCK
      ?auto_27264 - BLOCK
      ?auto_27265 - BLOCK
      ?auto_27266 - BLOCK
      ?auto_27267 - BLOCK
    )
    :vars
    (
      ?auto_27268 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27266 ) ( ON-TABLE ?auto_27263 ) ( ON ?auto_27264 ?auto_27263 ) ( ON ?auto_27265 ?auto_27264 ) ( ON ?auto_27266 ?auto_27265 ) ( not ( = ?auto_27263 ?auto_27264 ) ) ( not ( = ?auto_27263 ?auto_27265 ) ) ( not ( = ?auto_27263 ?auto_27266 ) ) ( not ( = ?auto_27263 ?auto_27267 ) ) ( not ( = ?auto_27264 ?auto_27265 ) ) ( not ( = ?auto_27264 ?auto_27266 ) ) ( not ( = ?auto_27264 ?auto_27267 ) ) ( not ( = ?auto_27265 ?auto_27266 ) ) ( not ( = ?auto_27265 ?auto_27267 ) ) ( not ( = ?auto_27266 ?auto_27267 ) ) ( ON ?auto_27267 ?auto_27268 ) ( CLEAR ?auto_27267 ) ( HAND-EMPTY ) ( not ( = ?auto_27263 ?auto_27268 ) ) ( not ( = ?auto_27264 ?auto_27268 ) ) ( not ( = ?auto_27265 ?auto_27268 ) ) ( not ( = ?auto_27266 ?auto_27268 ) ) ( not ( = ?auto_27267 ?auto_27268 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27267 ?auto_27268 )
      ( MAKE-5PILE ?auto_27263 ?auto_27264 ?auto_27265 ?auto_27266 ?auto_27267 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27269 - BLOCK
      ?auto_27270 - BLOCK
      ?auto_27271 - BLOCK
      ?auto_27272 - BLOCK
      ?auto_27273 - BLOCK
    )
    :vars
    (
      ?auto_27274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27269 ) ( ON ?auto_27270 ?auto_27269 ) ( ON ?auto_27271 ?auto_27270 ) ( not ( = ?auto_27269 ?auto_27270 ) ) ( not ( = ?auto_27269 ?auto_27271 ) ) ( not ( = ?auto_27269 ?auto_27272 ) ) ( not ( = ?auto_27269 ?auto_27273 ) ) ( not ( = ?auto_27270 ?auto_27271 ) ) ( not ( = ?auto_27270 ?auto_27272 ) ) ( not ( = ?auto_27270 ?auto_27273 ) ) ( not ( = ?auto_27271 ?auto_27272 ) ) ( not ( = ?auto_27271 ?auto_27273 ) ) ( not ( = ?auto_27272 ?auto_27273 ) ) ( ON ?auto_27273 ?auto_27274 ) ( CLEAR ?auto_27273 ) ( not ( = ?auto_27269 ?auto_27274 ) ) ( not ( = ?auto_27270 ?auto_27274 ) ) ( not ( = ?auto_27271 ?auto_27274 ) ) ( not ( = ?auto_27272 ?auto_27274 ) ) ( not ( = ?auto_27273 ?auto_27274 ) ) ( HOLDING ?auto_27272 ) ( CLEAR ?auto_27271 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27269 ?auto_27270 ?auto_27271 ?auto_27272 )
      ( MAKE-5PILE ?auto_27269 ?auto_27270 ?auto_27271 ?auto_27272 ?auto_27273 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27275 - BLOCK
      ?auto_27276 - BLOCK
      ?auto_27277 - BLOCK
      ?auto_27278 - BLOCK
      ?auto_27279 - BLOCK
    )
    :vars
    (
      ?auto_27280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27275 ) ( ON ?auto_27276 ?auto_27275 ) ( ON ?auto_27277 ?auto_27276 ) ( not ( = ?auto_27275 ?auto_27276 ) ) ( not ( = ?auto_27275 ?auto_27277 ) ) ( not ( = ?auto_27275 ?auto_27278 ) ) ( not ( = ?auto_27275 ?auto_27279 ) ) ( not ( = ?auto_27276 ?auto_27277 ) ) ( not ( = ?auto_27276 ?auto_27278 ) ) ( not ( = ?auto_27276 ?auto_27279 ) ) ( not ( = ?auto_27277 ?auto_27278 ) ) ( not ( = ?auto_27277 ?auto_27279 ) ) ( not ( = ?auto_27278 ?auto_27279 ) ) ( ON ?auto_27279 ?auto_27280 ) ( not ( = ?auto_27275 ?auto_27280 ) ) ( not ( = ?auto_27276 ?auto_27280 ) ) ( not ( = ?auto_27277 ?auto_27280 ) ) ( not ( = ?auto_27278 ?auto_27280 ) ) ( not ( = ?auto_27279 ?auto_27280 ) ) ( CLEAR ?auto_27277 ) ( ON ?auto_27278 ?auto_27279 ) ( CLEAR ?auto_27278 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27280 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27280 ?auto_27279 )
      ( MAKE-5PILE ?auto_27275 ?auto_27276 ?auto_27277 ?auto_27278 ?auto_27279 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27281 - BLOCK
      ?auto_27282 - BLOCK
      ?auto_27283 - BLOCK
      ?auto_27284 - BLOCK
      ?auto_27285 - BLOCK
    )
    :vars
    (
      ?auto_27286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27281 ) ( ON ?auto_27282 ?auto_27281 ) ( not ( = ?auto_27281 ?auto_27282 ) ) ( not ( = ?auto_27281 ?auto_27283 ) ) ( not ( = ?auto_27281 ?auto_27284 ) ) ( not ( = ?auto_27281 ?auto_27285 ) ) ( not ( = ?auto_27282 ?auto_27283 ) ) ( not ( = ?auto_27282 ?auto_27284 ) ) ( not ( = ?auto_27282 ?auto_27285 ) ) ( not ( = ?auto_27283 ?auto_27284 ) ) ( not ( = ?auto_27283 ?auto_27285 ) ) ( not ( = ?auto_27284 ?auto_27285 ) ) ( ON ?auto_27285 ?auto_27286 ) ( not ( = ?auto_27281 ?auto_27286 ) ) ( not ( = ?auto_27282 ?auto_27286 ) ) ( not ( = ?auto_27283 ?auto_27286 ) ) ( not ( = ?auto_27284 ?auto_27286 ) ) ( not ( = ?auto_27285 ?auto_27286 ) ) ( ON ?auto_27284 ?auto_27285 ) ( CLEAR ?auto_27284 ) ( ON-TABLE ?auto_27286 ) ( HOLDING ?auto_27283 ) ( CLEAR ?auto_27282 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27281 ?auto_27282 ?auto_27283 )
      ( MAKE-5PILE ?auto_27281 ?auto_27282 ?auto_27283 ?auto_27284 ?auto_27285 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27287 - BLOCK
      ?auto_27288 - BLOCK
      ?auto_27289 - BLOCK
      ?auto_27290 - BLOCK
      ?auto_27291 - BLOCK
    )
    :vars
    (
      ?auto_27292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27287 ) ( ON ?auto_27288 ?auto_27287 ) ( not ( = ?auto_27287 ?auto_27288 ) ) ( not ( = ?auto_27287 ?auto_27289 ) ) ( not ( = ?auto_27287 ?auto_27290 ) ) ( not ( = ?auto_27287 ?auto_27291 ) ) ( not ( = ?auto_27288 ?auto_27289 ) ) ( not ( = ?auto_27288 ?auto_27290 ) ) ( not ( = ?auto_27288 ?auto_27291 ) ) ( not ( = ?auto_27289 ?auto_27290 ) ) ( not ( = ?auto_27289 ?auto_27291 ) ) ( not ( = ?auto_27290 ?auto_27291 ) ) ( ON ?auto_27291 ?auto_27292 ) ( not ( = ?auto_27287 ?auto_27292 ) ) ( not ( = ?auto_27288 ?auto_27292 ) ) ( not ( = ?auto_27289 ?auto_27292 ) ) ( not ( = ?auto_27290 ?auto_27292 ) ) ( not ( = ?auto_27291 ?auto_27292 ) ) ( ON ?auto_27290 ?auto_27291 ) ( ON-TABLE ?auto_27292 ) ( CLEAR ?auto_27288 ) ( ON ?auto_27289 ?auto_27290 ) ( CLEAR ?auto_27289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27292 ?auto_27291 ?auto_27290 )
      ( MAKE-5PILE ?auto_27287 ?auto_27288 ?auto_27289 ?auto_27290 ?auto_27291 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27293 - BLOCK
      ?auto_27294 - BLOCK
      ?auto_27295 - BLOCK
      ?auto_27296 - BLOCK
      ?auto_27297 - BLOCK
    )
    :vars
    (
      ?auto_27298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27293 ) ( not ( = ?auto_27293 ?auto_27294 ) ) ( not ( = ?auto_27293 ?auto_27295 ) ) ( not ( = ?auto_27293 ?auto_27296 ) ) ( not ( = ?auto_27293 ?auto_27297 ) ) ( not ( = ?auto_27294 ?auto_27295 ) ) ( not ( = ?auto_27294 ?auto_27296 ) ) ( not ( = ?auto_27294 ?auto_27297 ) ) ( not ( = ?auto_27295 ?auto_27296 ) ) ( not ( = ?auto_27295 ?auto_27297 ) ) ( not ( = ?auto_27296 ?auto_27297 ) ) ( ON ?auto_27297 ?auto_27298 ) ( not ( = ?auto_27293 ?auto_27298 ) ) ( not ( = ?auto_27294 ?auto_27298 ) ) ( not ( = ?auto_27295 ?auto_27298 ) ) ( not ( = ?auto_27296 ?auto_27298 ) ) ( not ( = ?auto_27297 ?auto_27298 ) ) ( ON ?auto_27296 ?auto_27297 ) ( ON-TABLE ?auto_27298 ) ( ON ?auto_27295 ?auto_27296 ) ( CLEAR ?auto_27295 ) ( HOLDING ?auto_27294 ) ( CLEAR ?auto_27293 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27293 ?auto_27294 )
      ( MAKE-5PILE ?auto_27293 ?auto_27294 ?auto_27295 ?auto_27296 ?auto_27297 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27299 - BLOCK
      ?auto_27300 - BLOCK
      ?auto_27301 - BLOCK
      ?auto_27302 - BLOCK
      ?auto_27303 - BLOCK
    )
    :vars
    (
      ?auto_27304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27299 ) ( not ( = ?auto_27299 ?auto_27300 ) ) ( not ( = ?auto_27299 ?auto_27301 ) ) ( not ( = ?auto_27299 ?auto_27302 ) ) ( not ( = ?auto_27299 ?auto_27303 ) ) ( not ( = ?auto_27300 ?auto_27301 ) ) ( not ( = ?auto_27300 ?auto_27302 ) ) ( not ( = ?auto_27300 ?auto_27303 ) ) ( not ( = ?auto_27301 ?auto_27302 ) ) ( not ( = ?auto_27301 ?auto_27303 ) ) ( not ( = ?auto_27302 ?auto_27303 ) ) ( ON ?auto_27303 ?auto_27304 ) ( not ( = ?auto_27299 ?auto_27304 ) ) ( not ( = ?auto_27300 ?auto_27304 ) ) ( not ( = ?auto_27301 ?auto_27304 ) ) ( not ( = ?auto_27302 ?auto_27304 ) ) ( not ( = ?auto_27303 ?auto_27304 ) ) ( ON ?auto_27302 ?auto_27303 ) ( ON-TABLE ?auto_27304 ) ( ON ?auto_27301 ?auto_27302 ) ( CLEAR ?auto_27299 ) ( ON ?auto_27300 ?auto_27301 ) ( CLEAR ?auto_27300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27304 ?auto_27303 ?auto_27302 ?auto_27301 )
      ( MAKE-5PILE ?auto_27299 ?auto_27300 ?auto_27301 ?auto_27302 ?auto_27303 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27305 - BLOCK
      ?auto_27306 - BLOCK
      ?auto_27307 - BLOCK
      ?auto_27308 - BLOCK
      ?auto_27309 - BLOCK
    )
    :vars
    (
      ?auto_27310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27305 ?auto_27306 ) ) ( not ( = ?auto_27305 ?auto_27307 ) ) ( not ( = ?auto_27305 ?auto_27308 ) ) ( not ( = ?auto_27305 ?auto_27309 ) ) ( not ( = ?auto_27306 ?auto_27307 ) ) ( not ( = ?auto_27306 ?auto_27308 ) ) ( not ( = ?auto_27306 ?auto_27309 ) ) ( not ( = ?auto_27307 ?auto_27308 ) ) ( not ( = ?auto_27307 ?auto_27309 ) ) ( not ( = ?auto_27308 ?auto_27309 ) ) ( ON ?auto_27309 ?auto_27310 ) ( not ( = ?auto_27305 ?auto_27310 ) ) ( not ( = ?auto_27306 ?auto_27310 ) ) ( not ( = ?auto_27307 ?auto_27310 ) ) ( not ( = ?auto_27308 ?auto_27310 ) ) ( not ( = ?auto_27309 ?auto_27310 ) ) ( ON ?auto_27308 ?auto_27309 ) ( ON-TABLE ?auto_27310 ) ( ON ?auto_27307 ?auto_27308 ) ( ON ?auto_27306 ?auto_27307 ) ( CLEAR ?auto_27306 ) ( HOLDING ?auto_27305 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27305 )
      ( MAKE-5PILE ?auto_27305 ?auto_27306 ?auto_27307 ?auto_27308 ?auto_27309 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27311 - BLOCK
      ?auto_27312 - BLOCK
      ?auto_27313 - BLOCK
      ?auto_27314 - BLOCK
      ?auto_27315 - BLOCK
    )
    :vars
    (
      ?auto_27316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27311 ?auto_27312 ) ) ( not ( = ?auto_27311 ?auto_27313 ) ) ( not ( = ?auto_27311 ?auto_27314 ) ) ( not ( = ?auto_27311 ?auto_27315 ) ) ( not ( = ?auto_27312 ?auto_27313 ) ) ( not ( = ?auto_27312 ?auto_27314 ) ) ( not ( = ?auto_27312 ?auto_27315 ) ) ( not ( = ?auto_27313 ?auto_27314 ) ) ( not ( = ?auto_27313 ?auto_27315 ) ) ( not ( = ?auto_27314 ?auto_27315 ) ) ( ON ?auto_27315 ?auto_27316 ) ( not ( = ?auto_27311 ?auto_27316 ) ) ( not ( = ?auto_27312 ?auto_27316 ) ) ( not ( = ?auto_27313 ?auto_27316 ) ) ( not ( = ?auto_27314 ?auto_27316 ) ) ( not ( = ?auto_27315 ?auto_27316 ) ) ( ON ?auto_27314 ?auto_27315 ) ( ON-TABLE ?auto_27316 ) ( ON ?auto_27313 ?auto_27314 ) ( ON ?auto_27312 ?auto_27313 ) ( ON ?auto_27311 ?auto_27312 ) ( CLEAR ?auto_27311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27316 ?auto_27315 ?auto_27314 ?auto_27313 ?auto_27312 )
      ( MAKE-5PILE ?auto_27311 ?auto_27312 ?auto_27313 ?auto_27314 ?auto_27315 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27375 - BLOCK
    )
    :vars
    (
      ?auto_27376 - BLOCK
      ?auto_27377 - BLOCK
      ?auto_27378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27375 ?auto_27376 ) ( CLEAR ?auto_27375 ) ( not ( = ?auto_27375 ?auto_27376 ) ) ( HOLDING ?auto_27377 ) ( CLEAR ?auto_27378 ) ( not ( = ?auto_27375 ?auto_27377 ) ) ( not ( = ?auto_27375 ?auto_27378 ) ) ( not ( = ?auto_27376 ?auto_27377 ) ) ( not ( = ?auto_27376 ?auto_27378 ) ) ( not ( = ?auto_27377 ?auto_27378 ) ) )
    :subtasks
    ( ( !STACK ?auto_27377 ?auto_27378 )
      ( MAKE-1PILE ?auto_27375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27379 - BLOCK
    )
    :vars
    (
      ?auto_27380 - BLOCK
      ?auto_27381 - BLOCK
      ?auto_27382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27379 ?auto_27380 ) ( not ( = ?auto_27379 ?auto_27380 ) ) ( CLEAR ?auto_27381 ) ( not ( = ?auto_27379 ?auto_27382 ) ) ( not ( = ?auto_27379 ?auto_27381 ) ) ( not ( = ?auto_27380 ?auto_27382 ) ) ( not ( = ?auto_27380 ?auto_27381 ) ) ( not ( = ?auto_27382 ?auto_27381 ) ) ( ON ?auto_27382 ?auto_27379 ) ( CLEAR ?auto_27382 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27380 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27380 ?auto_27379 )
      ( MAKE-1PILE ?auto_27379 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27383 - BLOCK
    )
    :vars
    (
      ?auto_27384 - BLOCK
      ?auto_27385 - BLOCK
      ?auto_27386 - BLOCK
      ?auto_27388 - BLOCK
      ?auto_27387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27383 ?auto_27384 ) ( not ( = ?auto_27383 ?auto_27384 ) ) ( not ( = ?auto_27383 ?auto_27385 ) ) ( not ( = ?auto_27383 ?auto_27386 ) ) ( not ( = ?auto_27384 ?auto_27385 ) ) ( not ( = ?auto_27384 ?auto_27386 ) ) ( not ( = ?auto_27385 ?auto_27386 ) ) ( ON ?auto_27385 ?auto_27383 ) ( CLEAR ?auto_27385 ) ( ON-TABLE ?auto_27384 ) ( HOLDING ?auto_27386 ) ( CLEAR ?auto_27388 ) ( ON-TABLE ?auto_27387 ) ( ON ?auto_27388 ?auto_27387 ) ( not ( = ?auto_27387 ?auto_27388 ) ) ( not ( = ?auto_27387 ?auto_27386 ) ) ( not ( = ?auto_27388 ?auto_27386 ) ) ( not ( = ?auto_27383 ?auto_27388 ) ) ( not ( = ?auto_27383 ?auto_27387 ) ) ( not ( = ?auto_27384 ?auto_27388 ) ) ( not ( = ?auto_27384 ?auto_27387 ) ) ( not ( = ?auto_27385 ?auto_27388 ) ) ( not ( = ?auto_27385 ?auto_27387 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27387 ?auto_27388 ?auto_27386 )
      ( MAKE-1PILE ?auto_27383 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27389 - BLOCK
    )
    :vars
    (
      ?auto_27393 - BLOCK
      ?auto_27391 - BLOCK
      ?auto_27392 - BLOCK
      ?auto_27390 - BLOCK
      ?auto_27394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27389 ?auto_27393 ) ( not ( = ?auto_27389 ?auto_27393 ) ) ( not ( = ?auto_27389 ?auto_27391 ) ) ( not ( = ?auto_27389 ?auto_27392 ) ) ( not ( = ?auto_27393 ?auto_27391 ) ) ( not ( = ?auto_27393 ?auto_27392 ) ) ( not ( = ?auto_27391 ?auto_27392 ) ) ( ON ?auto_27391 ?auto_27389 ) ( ON-TABLE ?auto_27393 ) ( CLEAR ?auto_27390 ) ( ON-TABLE ?auto_27394 ) ( ON ?auto_27390 ?auto_27394 ) ( not ( = ?auto_27394 ?auto_27390 ) ) ( not ( = ?auto_27394 ?auto_27392 ) ) ( not ( = ?auto_27390 ?auto_27392 ) ) ( not ( = ?auto_27389 ?auto_27390 ) ) ( not ( = ?auto_27389 ?auto_27394 ) ) ( not ( = ?auto_27393 ?auto_27390 ) ) ( not ( = ?auto_27393 ?auto_27394 ) ) ( not ( = ?auto_27391 ?auto_27390 ) ) ( not ( = ?auto_27391 ?auto_27394 ) ) ( ON ?auto_27392 ?auto_27391 ) ( CLEAR ?auto_27392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27393 ?auto_27389 ?auto_27391 )
      ( MAKE-1PILE ?auto_27389 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27395 - BLOCK
    )
    :vars
    (
      ?auto_27399 - BLOCK
      ?auto_27398 - BLOCK
      ?auto_27397 - BLOCK
      ?auto_27396 - BLOCK
      ?auto_27400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27395 ?auto_27399 ) ( not ( = ?auto_27395 ?auto_27399 ) ) ( not ( = ?auto_27395 ?auto_27398 ) ) ( not ( = ?auto_27395 ?auto_27397 ) ) ( not ( = ?auto_27399 ?auto_27398 ) ) ( not ( = ?auto_27399 ?auto_27397 ) ) ( not ( = ?auto_27398 ?auto_27397 ) ) ( ON ?auto_27398 ?auto_27395 ) ( ON-TABLE ?auto_27399 ) ( ON-TABLE ?auto_27396 ) ( not ( = ?auto_27396 ?auto_27400 ) ) ( not ( = ?auto_27396 ?auto_27397 ) ) ( not ( = ?auto_27400 ?auto_27397 ) ) ( not ( = ?auto_27395 ?auto_27400 ) ) ( not ( = ?auto_27395 ?auto_27396 ) ) ( not ( = ?auto_27399 ?auto_27400 ) ) ( not ( = ?auto_27399 ?auto_27396 ) ) ( not ( = ?auto_27398 ?auto_27400 ) ) ( not ( = ?auto_27398 ?auto_27396 ) ) ( ON ?auto_27397 ?auto_27398 ) ( CLEAR ?auto_27397 ) ( HOLDING ?auto_27400 ) ( CLEAR ?auto_27396 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27396 ?auto_27400 )
      ( MAKE-1PILE ?auto_27395 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27401 - BLOCK
    )
    :vars
    (
      ?auto_27406 - BLOCK
      ?auto_27403 - BLOCK
      ?auto_27405 - BLOCK
      ?auto_27404 - BLOCK
      ?auto_27402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27401 ?auto_27406 ) ( not ( = ?auto_27401 ?auto_27406 ) ) ( not ( = ?auto_27401 ?auto_27403 ) ) ( not ( = ?auto_27401 ?auto_27405 ) ) ( not ( = ?auto_27406 ?auto_27403 ) ) ( not ( = ?auto_27406 ?auto_27405 ) ) ( not ( = ?auto_27403 ?auto_27405 ) ) ( ON ?auto_27403 ?auto_27401 ) ( ON-TABLE ?auto_27406 ) ( ON-TABLE ?auto_27404 ) ( not ( = ?auto_27404 ?auto_27402 ) ) ( not ( = ?auto_27404 ?auto_27405 ) ) ( not ( = ?auto_27402 ?auto_27405 ) ) ( not ( = ?auto_27401 ?auto_27402 ) ) ( not ( = ?auto_27401 ?auto_27404 ) ) ( not ( = ?auto_27406 ?auto_27402 ) ) ( not ( = ?auto_27406 ?auto_27404 ) ) ( not ( = ?auto_27403 ?auto_27402 ) ) ( not ( = ?auto_27403 ?auto_27404 ) ) ( ON ?auto_27405 ?auto_27403 ) ( CLEAR ?auto_27404 ) ( ON ?auto_27402 ?auto_27405 ) ( CLEAR ?auto_27402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27406 ?auto_27401 ?auto_27403 ?auto_27405 )
      ( MAKE-1PILE ?auto_27401 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27407 - BLOCK
    )
    :vars
    (
      ?auto_27410 - BLOCK
      ?auto_27409 - BLOCK
      ?auto_27408 - BLOCK
      ?auto_27412 - BLOCK
      ?auto_27411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27407 ?auto_27410 ) ( not ( = ?auto_27407 ?auto_27410 ) ) ( not ( = ?auto_27407 ?auto_27409 ) ) ( not ( = ?auto_27407 ?auto_27408 ) ) ( not ( = ?auto_27410 ?auto_27409 ) ) ( not ( = ?auto_27410 ?auto_27408 ) ) ( not ( = ?auto_27409 ?auto_27408 ) ) ( ON ?auto_27409 ?auto_27407 ) ( ON-TABLE ?auto_27410 ) ( not ( = ?auto_27412 ?auto_27411 ) ) ( not ( = ?auto_27412 ?auto_27408 ) ) ( not ( = ?auto_27411 ?auto_27408 ) ) ( not ( = ?auto_27407 ?auto_27411 ) ) ( not ( = ?auto_27407 ?auto_27412 ) ) ( not ( = ?auto_27410 ?auto_27411 ) ) ( not ( = ?auto_27410 ?auto_27412 ) ) ( not ( = ?auto_27409 ?auto_27411 ) ) ( not ( = ?auto_27409 ?auto_27412 ) ) ( ON ?auto_27408 ?auto_27409 ) ( ON ?auto_27411 ?auto_27408 ) ( CLEAR ?auto_27411 ) ( HOLDING ?auto_27412 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27412 )
      ( MAKE-1PILE ?auto_27407 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27413 - BLOCK
    )
    :vars
    (
      ?auto_27418 - BLOCK
      ?auto_27416 - BLOCK
      ?auto_27417 - BLOCK
      ?auto_27415 - BLOCK
      ?auto_27414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27413 ?auto_27418 ) ( not ( = ?auto_27413 ?auto_27418 ) ) ( not ( = ?auto_27413 ?auto_27416 ) ) ( not ( = ?auto_27413 ?auto_27417 ) ) ( not ( = ?auto_27418 ?auto_27416 ) ) ( not ( = ?auto_27418 ?auto_27417 ) ) ( not ( = ?auto_27416 ?auto_27417 ) ) ( ON ?auto_27416 ?auto_27413 ) ( ON-TABLE ?auto_27418 ) ( not ( = ?auto_27415 ?auto_27414 ) ) ( not ( = ?auto_27415 ?auto_27417 ) ) ( not ( = ?auto_27414 ?auto_27417 ) ) ( not ( = ?auto_27413 ?auto_27414 ) ) ( not ( = ?auto_27413 ?auto_27415 ) ) ( not ( = ?auto_27418 ?auto_27414 ) ) ( not ( = ?auto_27418 ?auto_27415 ) ) ( not ( = ?auto_27416 ?auto_27414 ) ) ( not ( = ?auto_27416 ?auto_27415 ) ) ( ON ?auto_27417 ?auto_27416 ) ( ON ?auto_27414 ?auto_27417 ) ( ON ?auto_27415 ?auto_27414 ) ( CLEAR ?auto_27415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27418 ?auto_27413 ?auto_27416 ?auto_27417 ?auto_27414 )
      ( MAKE-1PILE ?auto_27413 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27426 - BLOCK
      ?auto_27427 - BLOCK
      ?auto_27428 - BLOCK
    )
    :vars
    (
      ?auto_27429 - BLOCK
      ?auto_27430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27429 ?auto_27428 ) ( CLEAR ?auto_27429 ) ( ON-TABLE ?auto_27426 ) ( ON ?auto_27427 ?auto_27426 ) ( ON ?auto_27428 ?auto_27427 ) ( not ( = ?auto_27426 ?auto_27427 ) ) ( not ( = ?auto_27426 ?auto_27428 ) ) ( not ( = ?auto_27426 ?auto_27429 ) ) ( not ( = ?auto_27427 ?auto_27428 ) ) ( not ( = ?auto_27427 ?auto_27429 ) ) ( not ( = ?auto_27428 ?auto_27429 ) ) ( HOLDING ?auto_27430 ) ( not ( = ?auto_27426 ?auto_27430 ) ) ( not ( = ?auto_27427 ?auto_27430 ) ) ( not ( = ?auto_27428 ?auto_27430 ) ) ( not ( = ?auto_27429 ?auto_27430 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_27430 )
      ( MAKE-3PILE ?auto_27426 ?auto_27427 ?auto_27428 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27479 - BLOCK
      ?auto_27480 - BLOCK
    )
    :vars
    (
      ?auto_27481 - BLOCK
      ?auto_27483 - BLOCK
      ?auto_27482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27479 ?auto_27480 ) ) ( ON ?auto_27480 ?auto_27481 ) ( not ( = ?auto_27479 ?auto_27481 ) ) ( not ( = ?auto_27480 ?auto_27481 ) ) ( ON ?auto_27479 ?auto_27480 ) ( CLEAR ?auto_27479 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27483 ) ( ON ?auto_27482 ?auto_27483 ) ( ON ?auto_27481 ?auto_27482 ) ( not ( = ?auto_27483 ?auto_27482 ) ) ( not ( = ?auto_27483 ?auto_27481 ) ) ( not ( = ?auto_27483 ?auto_27480 ) ) ( not ( = ?auto_27483 ?auto_27479 ) ) ( not ( = ?auto_27482 ?auto_27481 ) ) ( not ( = ?auto_27482 ?auto_27480 ) ) ( not ( = ?auto_27482 ?auto_27479 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27483 ?auto_27482 ?auto_27481 ?auto_27480 )
      ( MAKE-2PILE ?auto_27479 ?auto_27480 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27486 - BLOCK
      ?auto_27487 - BLOCK
    )
    :vars
    (
      ?auto_27488 - BLOCK
      ?auto_27489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27486 ?auto_27487 ) ) ( ON ?auto_27487 ?auto_27488 ) ( CLEAR ?auto_27487 ) ( not ( = ?auto_27486 ?auto_27488 ) ) ( not ( = ?auto_27487 ?auto_27488 ) ) ( ON ?auto_27486 ?auto_27489 ) ( CLEAR ?auto_27486 ) ( HAND-EMPTY ) ( not ( = ?auto_27486 ?auto_27489 ) ) ( not ( = ?auto_27487 ?auto_27489 ) ) ( not ( = ?auto_27488 ?auto_27489 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27486 ?auto_27489 )
      ( MAKE-2PILE ?auto_27486 ?auto_27487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27490 - BLOCK
      ?auto_27491 - BLOCK
    )
    :vars
    (
      ?auto_27493 - BLOCK
      ?auto_27492 - BLOCK
      ?auto_27494 - BLOCK
      ?auto_27495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27490 ?auto_27491 ) ) ( not ( = ?auto_27490 ?auto_27493 ) ) ( not ( = ?auto_27491 ?auto_27493 ) ) ( ON ?auto_27490 ?auto_27492 ) ( CLEAR ?auto_27490 ) ( not ( = ?auto_27490 ?auto_27492 ) ) ( not ( = ?auto_27491 ?auto_27492 ) ) ( not ( = ?auto_27493 ?auto_27492 ) ) ( HOLDING ?auto_27491 ) ( CLEAR ?auto_27493 ) ( ON-TABLE ?auto_27494 ) ( ON ?auto_27495 ?auto_27494 ) ( ON ?auto_27493 ?auto_27495 ) ( not ( = ?auto_27494 ?auto_27495 ) ) ( not ( = ?auto_27494 ?auto_27493 ) ) ( not ( = ?auto_27494 ?auto_27491 ) ) ( not ( = ?auto_27495 ?auto_27493 ) ) ( not ( = ?auto_27495 ?auto_27491 ) ) ( not ( = ?auto_27490 ?auto_27494 ) ) ( not ( = ?auto_27490 ?auto_27495 ) ) ( not ( = ?auto_27492 ?auto_27494 ) ) ( not ( = ?auto_27492 ?auto_27495 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27494 ?auto_27495 ?auto_27493 ?auto_27491 )
      ( MAKE-2PILE ?auto_27490 ?auto_27491 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27496 - BLOCK
      ?auto_27497 - BLOCK
    )
    :vars
    (
      ?auto_27501 - BLOCK
      ?auto_27500 - BLOCK
      ?auto_27498 - BLOCK
      ?auto_27499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27496 ?auto_27497 ) ) ( not ( = ?auto_27496 ?auto_27501 ) ) ( not ( = ?auto_27497 ?auto_27501 ) ) ( ON ?auto_27496 ?auto_27500 ) ( not ( = ?auto_27496 ?auto_27500 ) ) ( not ( = ?auto_27497 ?auto_27500 ) ) ( not ( = ?auto_27501 ?auto_27500 ) ) ( CLEAR ?auto_27501 ) ( ON-TABLE ?auto_27498 ) ( ON ?auto_27499 ?auto_27498 ) ( ON ?auto_27501 ?auto_27499 ) ( not ( = ?auto_27498 ?auto_27499 ) ) ( not ( = ?auto_27498 ?auto_27501 ) ) ( not ( = ?auto_27498 ?auto_27497 ) ) ( not ( = ?auto_27499 ?auto_27501 ) ) ( not ( = ?auto_27499 ?auto_27497 ) ) ( not ( = ?auto_27496 ?auto_27498 ) ) ( not ( = ?auto_27496 ?auto_27499 ) ) ( not ( = ?auto_27500 ?auto_27498 ) ) ( not ( = ?auto_27500 ?auto_27499 ) ) ( ON ?auto_27497 ?auto_27496 ) ( CLEAR ?auto_27497 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27500 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27500 ?auto_27496 )
      ( MAKE-2PILE ?auto_27496 ?auto_27497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27502 - BLOCK
      ?auto_27503 - BLOCK
    )
    :vars
    (
      ?auto_27507 - BLOCK
      ?auto_27505 - BLOCK
      ?auto_27506 - BLOCK
      ?auto_27504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27502 ?auto_27503 ) ) ( not ( = ?auto_27502 ?auto_27507 ) ) ( not ( = ?auto_27503 ?auto_27507 ) ) ( ON ?auto_27502 ?auto_27505 ) ( not ( = ?auto_27502 ?auto_27505 ) ) ( not ( = ?auto_27503 ?auto_27505 ) ) ( not ( = ?auto_27507 ?auto_27505 ) ) ( ON-TABLE ?auto_27506 ) ( ON ?auto_27504 ?auto_27506 ) ( not ( = ?auto_27506 ?auto_27504 ) ) ( not ( = ?auto_27506 ?auto_27507 ) ) ( not ( = ?auto_27506 ?auto_27503 ) ) ( not ( = ?auto_27504 ?auto_27507 ) ) ( not ( = ?auto_27504 ?auto_27503 ) ) ( not ( = ?auto_27502 ?auto_27506 ) ) ( not ( = ?auto_27502 ?auto_27504 ) ) ( not ( = ?auto_27505 ?auto_27506 ) ) ( not ( = ?auto_27505 ?auto_27504 ) ) ( ON ?auto_27503 ?auto_27502 ) ( CLEAR ?auto_27503 ) ( ON-TABLE ?auto_27505 ) ( HOLDING ?auto_27507 ) ( CLEAR ?auto_27504 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27506 ?auto_27504 ?auto_27507 )
      ( MAKE-2PILE ?auto_27502 ?auto_27503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27508 - BLOCK
      ?auto_27509 - BLOCK
    )
    :vars
    (
      ?auto_27511 - BLOCK
      ?auto_27512 - BLOCK
      ?auto_27513 - BLOCK
      ?auto_27510 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27508 ?auto_27509 ) ) ( not ( = ?auto_27508 ?auto_27511 ) ) ( not ( = ?auto_27509 ?auto_27511 ) ) ( ON ?auto_27508 ?auto_27512 ) ( not ( = ?auto_27508 ?auto_27512 ) ) ( not ( = ?auto_27509 ?auto_27512 ) ) ( not ( = ?auto_27511 ?auto_27512 ) ) ( ON-TABLE ?auto_27513 ) ( ON ?auto_27510 ?auto_27513 ) ( not ( = ?auto_27513 ?auto_27510 ) ) ( not ( = ?auto_27513 ?auto_27511 ) ) ( not ( = ?auto_27513 ?auto_27509 ) ) ( not ( = ?auto_27510 ?auto_27511 ) ) ( not ( = ?auto_27510 ?auto_27509 ) ) ( not ( = ?auto_27508 ?auto_27513 ) ) ( not ( = ?auto_27508 ?auto_27510 ) ) ( not ( = ?auto_27512 ?auto_27513 ) ) ( not ( = ?auto_27512 ?auto_27510 ) ) ( ON ?auto_27509 ?auto_27508 ) ( ON-TABLE ?auto_27512 ) ( CLEAR ?auto_27510 ) ( ON ?auto_27511 ?auto_27509 ) ( CLEAR ?auto_27511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27512 ?auto_27508 ?auto_27509 )
      ( MAKE-2PILE ?auto_27508 ?auto_27509 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27514 - BLOCK
      ?auto_27515 - BLOCK
    )
    :vars
    (
      ?auto_27516 - BLOCK
      ?auto_27519 - BLOCK
      ?auto_27517 - BLOCK
      ?auto_27518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27514 ?auto_27515 ) ) ( not ( = ?auto_27514 ?auto_27516 ) ) ( not ( = ?auto_27515 ?auto_27516 ) ) ( ON ?auto_27514 ?auto_27519 ) ( not ( = ?auto_27514 ?auto_27519 ) ) ( not ( = ?auto_27515 ?auto_27519 ) ) ( not ( = ?auto_27516 ?auto_27519 ) ) ( ON-TABLE ?auto_27517 ) ( not ( = ?auto_27517 ?auto_27518 ) ) ( not ( = ?auto_27517 ?auto_27516 ) ) ( not ( = ?auto_27517 ?auto_27515 ) ) ( not ( = ?auto_27518 ?auto_27516 ) ) ( not ( = ?auto_27518 ?auto_27515 ) ) ( not ( = ?auto_27514 ?auto_27517 ) ) ( not ( = ?auto_27514 ?auto_27518 ) ) ( not ( = ?auto_27519 ?auto_27517 ) ) ( not ( = ?auto_27519 ?auto_27518 ) ) ( ON ?auto_27515 ?auto_27514 ) ( ON-TABLE ?auto_27519 ) ( ON ?auto_27516 ?auto_27515 ) ( CLEAR ?auto_27516 ) ( HOLDING ?auto_27518 ) ( CLEAR ?auto_27517 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27517 ?auto_27518 )
      ( MAKE-2PILE ?auto_27514 ?auto_27515 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27520 - BLOCK
      ?auto_27521 - BLOCK
    )
    :vars
    (
      ?auto_27525 - BLOCK
      ?auto_27524 - BLOCK
      ?auto_27523 - BLOCK
      ?auto_27522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27520 ?auto_27521 ) ) ( not ( = ?auto_27520 ?auto_27525 ) ) ( not ( = ?auto_27521 ?auto_27525 ) ) ( ON ?auto_27520 ?auto_27524 ) ( not ( = ?auto_27520 ?auto_27524 ) ) ( not ( = ?auto_27521 ?auto_27524 ) ) ( not ( = ?auto_27525 ?auto_27524 ) ) ( ON-TABLE ?auto_27523 ) ( not ( = ?auto_27523 ?auto_27522 ) ) ( not ( = ?auto_27523 ?auto_27525 ) ) ( not ( = ?auto_27523 ?auto_27521 ) ) ( not ( = ?auto_27522 ?auto_27525 ) ) ( not ( = ?auto_27522 ?auto_27521 ) ) ( not ( = ?auto_27520 ?auto_27523 ) ) ( not ( = ?auto_27520 ?auto_27522 ) ) ( not ( = ?auto_27524 ?auto_27523 ) ) ( not ( = ?auto_27524 ?auto_27522 ) ) ( ON ?auto_27521 ?auto_27520 ) ( ON-TABLE ?auto_27524 ) ( ON ?auto_27525 ?auto_27521 ) ( CLEAR ?auto_27523 ) ( ON ?auto_27522 ?auto_27525 ) ( CLEAR ?auto_27522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27524 ?auto_27520 ?auto_27521 ?auto_27525 )
      ( MAKE-2PILE ?auto_27520 ?auto_27521 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27526 - BLOCK
      ?auto_27527 - BLOCK
    )
    :vars
    (
      ?auto_27531 - BLOCK
      ?auto_27528 - BLOCK
      ?auto_27530 - BLOCK
      ?auto_27529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27526 ?auto_27527 ) ) ( not ( = ?auto_27526 ?auto_27531 ) ) ( not ( = ?auto_27527 ?auto_27531 ) ) ( ON ?auto_27526 ?auto_27528 ) ( not ( = ?auto_27526 ?auto_27528 ) ) ( not ( = ?auto_27527 ?auto_27528 ) ) ( not ( = ?auto_27531 ?auto_27528 ) ) ( not ( = ?auto_27530 ?auto_27529 ) ) ( not ( = ?auto_27530 ?auto_27531 ) ) ( not ( = ?auto_27530 ?auto_27527 ) ) ( not ( = ?auto_27529 ?auto_27531 ) ) ( not ( = ?auto_27529 ?auto_27527 ) ) ( not ( = ?auto_27526 ?auto_27530 ) ) ( not ( = ?auto_27526 ?auto_27529 ) ) ( not ( = ?auto_27528 ?auto_27530 ) ) ( not ( = ?auto_27528 ?auto_27529 ) ) ( ON ?auto_27527 ?auto_27526 ) ( ON-TABLE ?auto_27528 ) ( ON ?auto_27531 ?auto_27527 ) ( ON ?auto_27529 ?auto_27531 ) ( CLEAR ?auto_27529 ) ( HOLDING ?auto_27530 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27530 )
      ( MAKE-2PILE ?auto_27526 ?auto_27527 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27532 - BLOCK
      ?auto_27533 - BLOCK
    )
    :vars
    (
      ?auto_27534 - BLOCK
      ?auto_27535 - BLOCK
      ?auto_27537 - BLOCK
      ?auto_27536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27532 ?auto_27533 ) ) ( not ( = ?auto_27532 ?auto_27534 ) ) ( not ( = ?auto_27533 ?auto_27534 ) ) ( ON ?auto_27532 ?auto_27535 ) ( not ( = ?auto_27532 ?auto_27535 ) ) ( not ( = ?auto_27533 ?auto_27535 ) ) ( not ( = ?auto_27534 ?auto_27535 ) ) ( not ( = ?auto_27537 ?auto_27536 ) ) ( not ( = ?auto_27537 ?auto_27534 ) ) ( not ( = ?auto_27537 ?auto_27533 ) ) ( not ( = ?auto_27536 ?auto_27534 ) ) ( not ( = ?auto_27536 ?auto_27533 ) ) ( not ( = ?auto_27532 ?auto_27537 ) ) ( not ( = ?auto_27532 ?auto_27536 ) ) ( not ( = ?auto_27535 ?auto_27537 ) ) ( not ( = ?auto_27535 ?auto_27536 ) ) ( ON ?auto_27533 ?auto_27532 ) ( ON-TABLE ?auto_27535 ) ( ON ?auto_27534 ?auto_27533 ) ( ON ?auto_27536 ?auto_27534 ) ( ON ?auto_27537 ?auto_27536 ) ( CLEAR ?auto_27537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27535 ?auto_27532 ?auto_27533 ?auto_27534 ?auto_27536 )
      ( MAKE-2PILE ?auto_27532 ?auto_27533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27553 - BLOCK
      ?auto_27554 - BLOCK
    )
    :vars
    (
      ?auto_27555 - BLOCK
      ?auto_27556 - BLOCK
      ?auto_27557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27555 ?auto_27554 ) ( ON-TABLE ?auto_27553 ) ( ON ?auto_27554 ?auto_27553 ) ( not ( = ?auto_27553 ?auto_27554 ) ) ( not ( = ?auto_27553 ?auto_27555 ) ) ( not ( = ?auto_27554 ?auto_27555 ) ) ( not ( = ?auto_27553 ?auto_27556 ) ) ( not ( = ?auto_27553 ?auto_27557 ) ) ( not ( = ?auto_27554 ?auto_27556 ) ) ( not ( = ?auto_27554 ?auto_27557 ) ) ( not ( = ?auto_27555 ?auto_27556 ) ) ( not ( = ?auto_27555 ?auto_27557 ) ) ( not ( = ?auto_27556 ?auto_27557 ) ) ( ON ?auto_27556 ?auto_27555 ) ( CLEAR ?auto_27556 ) ( HOLDING ?auto_27557 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27557 )
      ( MAKE-2PILE ?auto_27553 ?auto_27554 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27600 - BLOCK
      ?auto_27601 - BLOCK
      ?auto_27602 - BLOCK
    )
    :vars
    (
      ?auto_27603 - BLOCK
      ?auto_27604 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27600 ) ( not ( = ?auto_27600 ?auto_27601 ) ) ( not ( = ?auto_27600 ?auto_27602 ) ) ( not ( = ?auto_27601 ?auto_27602 ) ) ( ON ?auto_27602 ?auto_27603 ) ( not ( = ?auto_27600 ?auto_27603 ) ) ( not ( = ?auto_27601 ?auto_27603 ) ) ( not ( = ?auto_27602 ?auto_27603 ) ) ( CLEAR ?auto_27600 ) ( ON ?auto_27601 ?auto_27602 ) ( CLEAR ?auto_27601 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27604 ) ( ON ?auto_27603 ?auto_27604 ) ( not ( = ?auto_27604 ?auto_27603 ) ) ( not ( = ?auto_27604 ?auto_27602 ) ) ( not ( = ?auto_27604 ?auto_27601 ) ) ( not ( = ?auto_27600 ?auto_27604 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27604 ?auto_27603 ?auto_27602 )
      ( MAKE-3PILE ?auto_27600 ?auto_27601 ?auto_27602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27605 - BLOCK
      ?auto_27606 - BLOCK
      ?auto_27607 - BLOCK
    )
    :vars
    (
      ?auto_27608 - BLOCK
      ?auto_27609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27605 ?auto_27606 ) ) ( not ( = ?auto_27605 ?auto_27607 ) ) ( not ( = ?auto_27606 ?auto_27607 ) ) ( ON ?auto_27607 ?auto_27608 ) ( not ( = ?auto_27605 ?auto_27608 ) ) ( not ( = ?auto_27606 ?auto_27608 ) ) ( not ( = ?auto_27607 ?auto_27608 ) ) ( ON ?auto_27606 ?auto_27607 ) ( CLEAR ?auto_27606 ) ( ON-TABLE ?auto_27609 ) ( ON ?auto_27608 ?auto_27609 ) ( not ( = ?auto_27609 ?auto_27608 ) ) ( not ( = ?auto_27609 ?auto_27607 ) ) ( not ( = ?auto_27609 ?auto_27606 ) ) ( not ( = ?auto_27605 ?auto_27609 ) ) ( HOLDING ?auto_27605 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27605 )
      ( MAKE-3PILE ?auto_27605 ?auto_27606 ?auto_27607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27610 - BLOCK
      ?auto_27611 - BLOCK
      ?auto_27612 - BLOCK
    )
    :vars
    (
      ?auto_27614 - BLOCK
      ?auto_27613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27610 ?auto_27611 ) ) ( not ( = ?auto_27610 ?auto_27612 ) ) ( not ( = ?auto_27611 ?auto_27612 ) ) ( ON ?auto_27612 ?auto_27614 ) ( not ( = ?auto_27610 ?auto_27614 ) ) ( not ( = ?auto_27611 ?auto_27614 ) ) ( not ( = ?auto_27612 ?auto_27614 ) ) ( ON ?auto_27611 ?auto_27612 ) ( ON-TABLE ?auto_27613 ) ( ON ?auto_27614 ?auto_27613 ) ( not ( = ?auto_27613 ?auto_27614 ) ) ( not ( = ?auto_27613 ?auto_27612 ) ) ( not ( = ?auto_27613 ?auto_27611 ) ) ( not ( = ?auto_27610 ?auto_27613 ) ) ( ON ?auto_27610 ?auto_27611 ) ( CLEAR ?auto_27610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27613 ?auto_27614 ?auto_27612 ?auto_27611 )
      ( MAKE-3PILE ?auto_27610 ?auto_27611 ?auto_27612 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27618 - BLOCK
      ?auto_27619 - BLOCK
      ?auto_27620 - BLOCK
    )
    :vars
    (
      ?auto_27622 - BLOCK
      ?auto_27621 - BLOCK
      ?auto_27623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27618 ?auto_27619 ) ) ( not ( = ?auto_27618 ?auto_27620 ) ) ( not ( = ?auto_27619 ?auto_27620 ) ) ( ON ?auto_27620 ?auto_27622 ) ( not ( = ?auto_27618 ?auto_27622 ) ) ( not ( = ?auto_27619 ?auto_27622 ) ) ( not ( = ?auto_27620 ?auto_27622 ) ) ( ON ?auto_27619 ?auto_27620 ) ( CLEAR ?auto_27619 ) ( ON-TABLE ?auto_27621 ) ( ON ?auto_27622 ?auto_27621 ) ( not ( = ?auto_27621 ?auto_27622 ) ) ( not ( = ?auto_27621 ?auto_27620 ) ) ( not ( = ?auto_27621 ?auto_27619 ) ) ( not ( = ?auto_27618 ?auto_27621 ) ) ( ON ?auto_27618 ?auto_27623 ) ( CLEAR ?auto_27618 ) ( HAND-EMPTY ) ( not ( = ?auto_27618 ?auto_27623 ) ) ( not ( = ?auto_27619 ?auto_27623 ) ) ( not ( = ?auto_27620 ?auto_27623 ) ) ( not ( = ?auto_27622 ?auto_27623 ) ) ( not ( = ?auto_27621 ?auto_27623 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27618 ?auto_27623 )
      ( MAKE-3PILE ?auto_27618 ?auto_27619 ?auto_27620 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27624 - BLOCK
      ?auto_27625 - BLOCK
      ?auto_27626 - BLOCK
    )
    :vars
    (
      ?auto_27627 - BLOCK
      ?auto_27628 - BLOCK
      ?auto_27629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27624 ?auto_27625 ) ) ( not ( = ?auto_27624 ?auto_27626 ) ) ( not ( = ?auto_27625 ?auto_27626 ) ) ( ON ?auto_27626 ?auto_27627 ) ( not ( = ?auto_27624 ?auto_27627 ) ) ( not ( = ?auto_27625 ?auto_27627 ) ) ( not ( = ?auto_27626 ?auto_27627 ) ) ( ON-TABLE ?auto_27628 ) ( ON ?auto_27627 ?auto_27628 ) ( not ( = ?auto_27628 ?auto_27627 ) ) ( not ( = ?auto_27628 ?auto_27626 ) ) ( not ( = ?auto_27628 ?auto_27625 ) ) ( not ( = ?auto_27624 ?auto_27628 ) ) ( ON ?auto_27624 ?auto_27629 ) ( CLEAR ?auto_27624 ) ( not ( = ?auto_27624 ?auto_27629 ) ) ( not ( = ?auto_27625 ?auto_27629 ) ) ( not ( = ?auto_27626 ?auto_27629 ) ) ( not ( = ?auto_27627 ?auto_27629 ) ) ( not ( = ?auto_27628 ?auto_27629 ) ) ( HOLDING ?auto_27625 ) ( CLEAR ?auto_27626 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27628 ?auto_27627 ?auto_27626 ?auto_27625 )
      ( MAKE-3PILE ?auto_27624 ?auto_27625 ?auto_27626 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27630 - BLOCK
      ?auto_27631 - BLOCK
      ?auto_27632 - BLOCK
    )
    :vars
    (
      ?auto_27633 - BLOCK
      ?auto_27635 - BLOCK
      ?auto_27634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27630 ?auto_27631 ) ) ( not ( = ?auto_27630 ?auto_27632 ) ) ( not ( = ?auto_27631 ?auto_27632 ) ) ( ON ?auto_27632 ?auto_27633 ) ( not ( = ?auto_27630 ?auto_27633 ) ) ( not ( = ?auto_27631 ?auto_27633 ) ) ( not ( = ?auto_27632 ?auto_27633 ) ) ( ON-TABLE ?auto_27635 ) ( ON ?auto_27633 ?auto_27635 ) ( not ( = ?auto_27635 ?auto_27633 ) ) ( not ( = ?auto_27635 ?auto_27632 ) ) ( not ( = ?auto_27635 ?auto_27631 ) ) ( not ( = ?auto_27630 ?auto_27635 ) ) ( ON ?auto_27630 ?auto_27634 ) ( not ( = ?auto_27630 ?auto_27634 ) ) ( not ( = ?auto_27631 ?auto_27634 ) ) ( not ( = ?auto_27632 ?auto_27634 ) ) ( not ( = ?auto_27633 ?auto_27634 ) ) ( not ( = ?auto_27635 ?auto_27634 ) ) ( CLEAR ?auto_27632 ) ( ON ?auto_27631 ?auto_27630 ) ( CLEAR ?auto_27631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27634 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27634 ?auto_27630 )
      ( MAKE-3PILE ?auto_27630 ?auto_27631 ?auto_27632 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27636 - BLOCK
      ?auto_27637 - BLOCK
      ?auto_27638 - BLOCK
    )
    :vars
    (
      ?auto_27641 - BLOCK
      ?auto_27640 - BLOCK
      ?auto_27639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27636 ?auto_27637 ) ) ( not ( = ?auto_27636 ?auto_27638 ) ) ( not ( = ?auto_27637 ?auto_27638 ) ) ( not ( = ?auto_27636 ?auto_27641 ) ) ( not ( = ?auto_27637 ?auto_27641 ) ) ( not ( = ?auto_27638 ?auto_27641 ) ) ( ON-TABLE ?auto_27640 ) ( ON ?auto_27641 ?auto_27640 ) ( not ( = ?auto_27640 ?auto_27641 ) ) ( not ( = ?auto_27640 ?auto_27638 ) ) ( not ( = ?auto_27640 ?auto_27637 ) ) ( not ( = ?auto_27636 ?auto_27640 ) ) ( ON ?auto_27636 ?auto_27639 ) ( not ( = ?auto_27636 ?auto_27639 ) ) ( not ( = ?auto_27637 ?auto_27639 ) ) ( not ( = ?auto_27638 ?auto_27639 ) ) ( not ( = ?auto_27641 ?auto_27639 ) ) ( not ( = ?auto_27640 ?auto_27639 ) ) ( ON ?auto_27637 ?auto_27636 ) ( CLEAR ?auto_27637 ) ( ON-TABLE ?auto_27639 ) ( HOLDING ?auto_27638 ) ( CLEAR ?auto_27641 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27640 ?auto_27641 ?auto_27638 )
      ( MAKE-3PILE ?auto_27636 ?auto_27637 ?auto_27638 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27642 - BLOCK
      ?auto_27643 - BLOCK
      ?auto_27644 - BLOCK
    )
    :vars
    (
      ?auto_27647 - BLOCK
      ?auto_27646 - BLOCK
      ?auto_27645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27642 ?auto_27643 ) ) ( not ( = ?auto_27642 ?auto_27644 ) ) ( not ( = ?auto_27643 ?auto_27644 ) ) ( not ( = ?auto_27642 ?auto_27647 ) ) ( not ( = ?auto_27643 ?auto_27647 ) ) ( not ( = ?auto_27644 ?auto_27647 ) ) ( ON-TABLE ?auto_27646 ) ( ON ?auto_27647 ?auto_27646 ) ( not ( = ?auto_27646 ?auto_27647 ) ) ( not ( = ?auto_27646 ?auto_27644 ) ) ( not ( = ?auto_27646 ?auto_27643 ) ) ( not ( = ?auto_27642 ?auto_27646 ) ) ( ON ?auto_27642 ?auto_27645 ) ( not ( = ?auto_27642 ?auto_27645 ) ) ( not ( = ?auto_27643 ?auto_27645 ) ) ( not ( = ?auto_27644 ?auto_27645 ) ) ( not ( = ?auto_27647 ?auto_27645 ) ) ( not ( = ?auto_27646 ?auto_27645 ) ) ( ON ?auto_27643 ?auto_27642 ) ( ON-TABLE ?auto_27645 ) ( CLEAR ?auto_27647 ) ( ON ?auto_27644 ?auto_27643 ) ( CLEAR ?auto_27644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27645 ?auto_27642 ?auto_27643 )
      ( MAKE-3PILE ?auto_27642 ?auto_27643 ?auto_27644 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27648 - BLOCK
      ?auto_27649 - BLOCK
      ?auto_27650 - BLOCK
    )
    :vars
    (
      ?auto_27653 - BLOCK
      ?auto_27652 - BLOCK
      ?auto_27651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27648 ?auto_27649 ) ) ( not ( = ?auto_27648 ?auto_27650 ) ) ( not ( = ?auto_27649 ?auto_27650 ) ) ( not ( = ?auto_27648 ?auto_27653 ) ) ( not ( = ?auto_27649 ?auto_27653 ) ) ( not ( = ?auto_27650 ?auto_27653 ) ) ( ON-TABLE ?auto_27652 ) ( not ( = ?auto_27652 ?auto_27653 ) ) ( not ( = ?auto_27652 ?auto_27650 ) ) ( not ( = ?auto_27652 ?auto_27649 ) ) ( not ( = ?auto_27648 ?auto_27652 ) ) ( ON ?auto_27648 ?auto_27651 ) ( not ( = ?auto_27648 ?auto_27651 ) ) ( not ( = ?auto_27649 ?auto_27651 ) ) ( not ( = ?auto_27650 ?auto_27651 ) ) ( not ( = ?auto_27653 ?auto_27651 ) ) ( not ( = ?auto_27652 ?auto_27651 ) ) ( ON ?auto_27649 ?auto_27648 ) ( ON-TABLE ?auto_27651 ) ( ON ?auto_27650 ?auto_27649 ) ( CLEAR ?auto_27650 ) ( HOLDING ?auto_27653 ) ( CLEAR ?auto_27652 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27652 ?auto_27653 )
      ( MAKE-3PILE ?auto_27648 ?auto_27649 ?auto_27650 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27654 - BLOCK
      ?auto_27655 - BLOCK
      ?auto_27656 - BLOCK
    )
    :vars
    (
      ?auto_27658 - BLOCK
      ?auto_27659 - BLOCK
      ?auto_27657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27654 ?auto_27655 ) ) ( not ( = ?auto_27654 ?auto_27656 ) ) ( not ( = ?auto_27655 ?auto_27656 ) ) ( not ( = ?auto_27654 ?auto_27658 ) ) ( not ( = ?auto_27655 ?auto_27658 ) ) ( not ( = ?auto_27656 ?auto_27658 ) ) ( ON-TABLE ?auto_27659 ) ( not ( = ?auto_27659 ?auto_27658 ) ) ( not ( = ?auto_27659 ?auto_27656 ) ) ( not ( = ?auto_27659 ?auto_27655 ) ) ( not ( = ?auto_27654 ?auto_27659 ) ) ( ON ?auto_27654 ?auto_27657 ) ( not ( = ?auto_27654 ?auto_27657 ) ) ( not ( = ?auto_27655 ?auto_27657 ) ) ( not ( = ?auto_27656 ?auto_27657 ) ) ( not ( = ?auto_27658 ?auto_27657 ) ) ( not ( = ?auto_27659 ?auto_27657 ) ) ( ON ?auto_27655 ?auto_27654 ) ( ON-TABLE ?auto_27657 ) ( ON ?auto_27656 ?auto_27655 ) ( CLEAR ?auto_27659 ) ( ON ?auto_27658 ?auto_27656 ) ( CLEAR ?auto_27658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27657 ?auto_27654 ?auto_27655 ?auto_27656 )
      ( MAKE-3PILE ?auto_27654 ?auto_27655 ?auto_27656 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27660 - BLOCK
      ?auto_27661 - BLOCK
      ?auto_27662 - BLOCK
    )
    :vars
    (
      ?auto_27663 - BLOCK
      ?auto_27665 - BLOCK
      ?auto_27664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27660 ?auto_27661 ) ) ( not ( = ?auto_27660 ?auto_27662 ) ) ( not ( = ?auto_27661 ?auto_27662 ) ) ( not ( = ?auto_27660 ?auto_27663 ) ) ( not ( = ?auto_27661 ?auto_27663 ) ) ( not ( = ?auto_27662 ?auto_27663 ) ) ( not ( = ?auto_27665 ?auto_27663 ) ) ( not ( = ?auto_27665 ?auto_27662 ) ) ( not ( = ?auto_27665 ?auto_27661 ) ) ( not ( = ?auto_27660 ?auto_27665 ) ) ( ON ?auto_27660 ?auto_27664 ) ( not ( = ?auto_27660 ?auto_27664 ) ) ( not ( = ?auto_27661 ?auto_27664 ) ) ( not ( = ?auto_27662 ?auto_27664 ) ) ( not ( = ?auto_27663 ?auto_27664 ) ) ( not ( = ?auto_27665 ?auto_27664 ) ) ( ON ?auto_27661 ?auto_27660 ) ( ON-TABLE ?auto_27664 ) ( ON ?auto_27662 ?auto_27661 ) ( ON ?auto_27663 ?auto_27662 ) ( CLEAR ?auto_27663 ) ( HOLDING ?auto_27665 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27665 )
      ( MAKE-3PILE ?auto_27660 ?auto_27661 ?auto_27662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27666 - BLOCK
      ?auto_27667 - BLOCK
      ?auto_27668 - BLOCK
    )
    :vars
    (
      ?auto_27671 - BLOCK
      ?auto_27669 - BLOCK
      ?auto_27670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27666 ?auto_27667 ) ) ( not ( = ?auto_27666 ?auto_27668 ) ) ( not ( = ?auto_27667 ?auto_27668 ) ) ( not ( = ?auto_27666 ?auto_27671 ) ) ( not ( = ?auto_27667 ?auto_27671 ) ) ( not ( = ?auto_27668 ?auto_27671 ) ) ( not ( = ?auto_27669 ?auto_27671 ) ) ( not ( = ?auto_27669 ?auto_27668 ) ) ( not ( = ?auto_27669 ?auto_27667 ) ) ( not ( = ?auto_27666 ?auto_27669 ) ) ( ON ?auto_27666 ?auto_27670 ) ( not ( = ?auto_27666 ?auto_27670 ) ) ( not ( = ?auto_27667 ?auto_27670 ) ) ( not ( = ?auto_27668 ?auto_27670 ) ) ( not ( = ?auto_27671 ?auto_27670 ) ) ( not ( = ?auto_27669 ?auto_27670 ) ) ( ON ?auto_27667 ?auto_27666 ) ( ON-TABLE ?auto_27670 ) ( ON ?auto_27668 ?auto_27667 ) ( ON ?auto_27671 ?auto_27668 ) ( ON ?auto_27669 ?auto_27671 ) ( CLEAR ?auto_27669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27670 ?auto_27666 ?auto_27667 ?auto_27668 ?auto_27671 )
      ( MAKE-3PILE ?auto_27666 ?auto_27667 ?auto_27668 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27683 - BLOCK
    )
    :vars
    (
      ?auto_27685 - BLOCK
      ?auto_27684 - BLOCK
      ?auto_27686 - BLOCK
      ?auto_27687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27685 ?auto_27683 ) ( ON-TABLE ?auto_27683 ) ( not ( = ?auto_27683 ?auto_27685 ) ) ( not ( = ?auto_27683 ?auto_27684 ) ) ( not ( = ?auto_27683 ?auto_27686 ) ) ( not ( = ?auto_27685 ?auto_27684 ) ) ( not ( = ?auto_27685 ?auto_27686 ) ) ( not ( = ?auto_27684 ?auto_27686 ) ) ( ON ?auto_27684 ?auto_27685 ) ( CLEAR ?auto_27684 ) ( HOLDING ?auto_27686 ) ( CLEAR ?auto_27687 ) ( ON-TABLE ?auto_27687 ) ( not ( = ?auto_27687 ?auto_27686 ) ) ( not ( = ?auto_27683 ?auto_27687 ) ) ( not ( = ?auto_27685 ?auto_27687 ) ) ( not ( = ?auto_27684 ?auto_27687 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27687 ?auto_27686 )
      ( MAKE-1PILE ?auto_27683 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27688 - BLOCK
    )
    :vars
    (
      ?auto_27690 - BLOCK
      ?auto_27692 - BLOCK
      ?auto_27691 - BLOCK
      ?auto_27689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27690 ?auto_27688 ) ( ON-TABLE ?auto_27688 ) ( not ( = ?auto_27688 ?auto_27690 ) ) ( not ( = ?auto_27688 ?auto_27692 ) ) ( not ( = ?auto_27688 ?auto_27691 ) ) ( not ( = ?auto_27690 ?auto_27692 ) ) ( not ( = ?auto_27690 ?auto_27691 ) ) ( not ( = ?auto_27692 ?auto_27691 ) ) ( ON ?auto_27692 ?auto_27690 ) ( CLEAR ?auto_27689 ) ( ON-TABLE ?auto_27689 ) ( not ( = ?auto_27689 ?auto_27691 ) ) ( not ( = ?auto_27688 ?auto_27689 ) ) ( not ( = ?auto_27690 ?auto_27689 ) ) ( not ( = ?auto_27692 ?auto_27689 ) ) ( ON ?auto_27691 ?auto_27692 ) ( CLEAR ?auto_27691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27688 ?auto_27690 ?auto_27692 )
      ( MAKE-1PILE ?auto_27688 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27693 - BLOCK
    )
    :vars
    (
      ?auto_27694 - BLOCK
      ?auto_27697 - BLOCK
      ?auto_27695 - BLOCK
      ?auto_27696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27694 ?auto_27693 ) ( ON-TABLE ?auto_27693 ) ( not ( = ?auto_27693 ?auto_27694 ) ) ( not ( = ?auto_27693 ?auto_27697 ) ) ( not ( = ?auto_27693 ?auto_27695 ) ) ( not ( = ?auto_27694 ?auto_27697 ) ) ( not ( = ?auto_27694 ?auto_27695 ) ) ( not ( = ?auto_27697 ?auto_27695 ) ) ( ON ?auto_27697 ?auto_27694 ) ( not ( = ?auto_27696 ?auto_27695 ) ) ( not ( = ?auto_27693 ?auto_27696 ) ) ( not ( = ?auto_27694 ?auto_27696 ) ) ( not ( = ?auto_27697 ?auto_27696 ) ) ( ON ?auto_27695 ?auto_27697 ) ( CLEAR ?auto_27695 ) ( HOLDING ?auto_27696 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27696 )
      ( MAKE-1PILE ?auto_27693 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27704 - BLOCK
    )
    :vars
    (
      ?auto_27705 - BLOCK
      ?auto_27707 - BLOCK
      ?auto_27708 - BLOCK
      ?auto_27706 - BLOCK
      ?auto_27709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27705 ?auto_27704 ) ( ON-TABLE ?auto_27704 ) ( not ( = ?auto_27704 ?auto_27705 ) ) ( not ( = ?auto_27704 ?auto_27707 ) ) ( not ( = ?auto_27704 ?auto_27708 ) ) ( not ( = ?auto_27705 ?auto_27707 ) ) ( not ( = ?auto_27705 ?auto_27708 ) ) ( not ( = ?auto_27707 ?auto_27708 ) ) ( ON ?auto_27707 ?auto_27705 ) ( not ( = ?auto_27706 ?auto_27708 ) ) ( not ( = ?auto_27704 ?auto_27706 ) ) ( not ( = ?auto_27705 ?auto_27706 ) ) ( not ( = ?auto_27707 ?auto_27706 ) ) ( ON ?auto_27708 ?auto_27707 ) ( CLEAR ?auto_27708 ) ( ON ?auto_27706 ?auto_27709 ) ( CLEAR ?auto_27706 ) ( HAND-EMPTY ) ( not ( = ?auto_27704 ?auto_27709 ) ) ( not ( = ?auto_27705 ?auto_27709 ) ) ( not ( = ?auto_27707 ?auto_27709 ) ) ( not ( = ?auto_27708 ?auto_27709 ) ) ( not ( = ?auto_27706 ?auto_27709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27706 ?auto_27709 )
      ( MAKE-1PILE ?auto_27704 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27710 - BLOCK
    )
    :vars
    (
      ?auto_27711 - BLOCK
      ?auto_27714 - BLOCK
      ?auto_27712 - BLOCK
      ?auto_27713 - BLOCK
      ?auto_27715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27711 ?auto_27710 ) ( ON-TABLE ?auto_27710 ) ( not ( = ?auto_27710 ?auto_27711 ) ) ( not ( = ?auto_27710 ?auto_27714 ) ) ( not ( = ?auto_27710 ?auto_27712 ) ) ( not ( = ?auto_27711 ?auto_27714 ) ) ( not ( = ?auto_27711 ?auto_27712 ) ) ( not ( = ?auto_27714 ?auto_27712 ) ) ( ON ?auto_27714 ?auto_27711 ) ( not ( = ?auto_27713 ?auto_27712 ) ) ( not ( = ?auto_27710 ?auto_27713 ) ) ( not ( = ?auto_27711 ?auto_27713 ) ) ( not ( = ?auto_27714 ?auto_27713 ) ) ( ON ?auto_27713 ?auto_27715 ) ( CLEAR ?auto_27713 ) ( not ( = ?auto_27710 ?auto_27715 ) ) ( not ( = ?auto_27711 ?auto_27715 ) ) ( not ( = ?auto_27714 ?auto_27715 ) ) ( not ( = ?auto_27712 ?auto_27715 ) ) ( not ( = ?auto_27713 ?auto_27715 ) ) ( HOLDING ?auto_27712 ) ( CLEAR ?auto_27714 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27710 ?auto_27711 ?auto_27714 ?auto_27712 )
      ( MAKE-1PILE ?auto_27710 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27744 - BLOCK
      ?auto_27745 - BLOCK
      ?auto_27746 - BLOCK
      ?auto_27747 - BLOCK
    )
    :vars
    (
      ?auto_27748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27744 ) ( ON ?auto_27745 ?auto_27744 ) ( not ( = ?auto_27744 ?auto_27745 ) ) ( not ( = ?auto_27744 ?auto_27746 ) ) ( not ( = ?auto_27744 ?auto_27747 ) ) ( not ( = ?auto_27745 ?auto_27746 ) ) ( not ( = ?auto_27745 ?auto_27747 ) ) ( not ( = ?auto_27746 ?auto_27747 ) ) ( ON ?auto_27747 ?auto_27748 ) ( not ( = ?auto_27744 ?auto_27748 ) ) ( not ( = ?auto_27745 ?auto_27748 ) ) ( not ( = ?auto_27746 ?auto_27748 ) ) ( not ( = ?auto_27747 ?auto_27748 ) ) ( CLEAR ?auto_27745 ) ( ON ?auto_27746 ?auto_27747 ) ( CLEAR ?auto_27746 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27748 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27748 ?auto_27747 )
      ( MAKE-4PILE ?auto_27744 ?auto_27745 ?auto_27746 ?auto_27747 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27749 - BLOCK
      ?auto_27750 - BLOCK
      ?auto_27751 - BLOCK
      ?auto_27752 - BLOCK
    )
    :vars
    (
      ?auto_27753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27749 ) ( not ( = ?auto_27749 ?auto_27750 ) ) ( not ( = ?auto_27749 ?auto_27751 ) ) ( not ( = ?auto_27749 ?auto_27752 ) ) ( not ( = ?auto_27750 ?auto_27751 ) ) ( not ( = ?auto_27750 ?auto_27752 ) ) ( not ( = ?auto_27751 ?auto_27752 ) ) ( ON ?auto_27752 ?auto_27753 ) ( not ( = ?auto_27749 ?auto_27753 ) ) ( not ( = ?auto_27750 ?auto_27753 ) ) ( not ( = ?auto_27751 ?auto_27753 ) ) ( not ( = ?auto_27752 ?auto_27753 ) ) ( ON ?auto_27751 ?auto_27752 ) ( CLEAR ?auto_27751 ) ( ON-TABLE ?auto_27753 ) ( HOLDING ?auto_27750 ) ( CLEAR ?auto_27749 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27749 ?auto_27750 )
      ( MAKE-4PILE ?auto_27749 ?auto_27750 ?auto_27751 ?auto_27752 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27754 - BLOCK
      ?auto_27755 - BLOCK
      ?auto_27756 - BLOCK
      ?auto_27757 - BLOCK
    )
    :vars
    (
      ?auto_27758 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27754 ) ( not ( = ?auto_27754 ?auto_27755 ) ) ( not ( = ?auto_27754 ?auto_27756 ) ) ( not ( = ?auto_27754 ?auto_27757 ) ) ( not ( = ?auto_27755 ?auto_27756 ) ) ( not ( = ?auto_27755 ?auto_27757 ) ) ( not ( = ?auto_27756 ?auto_27757 ) ) ( ON ?auto_27757 ?auto_27758 ) ( not ( = ?auto_27754 ?auto_27758 ) ) ( not ( = ?auto_27755 ?auto_27758 ) ) ( not ( = ?auto_27756 ?auto_27758 ) ) ( not ( = ?auto_27757 ?auto_27758 ) ) ( ON ?auto_27756 ?auto_27757 ) ( ON-TABLE ?auto_27758 ) ( CLEAR ?auto_27754 ) ( ON ?auto_27755 ?auto_27756 ) ( CLEAR ?auto_27755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27758 ?auto_27757 ?auto_27756 )
      ( MAKE-4PILE ?auto_27754 ?auto_27755 ?auto_27756 ?auto_27757 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27759 - BLOCK
      ?auto_27760 - BLOCK
      ?auto_27761 - BLOCK
      ?auto_27762 - BLOCK
    )
    :vars
    (
      ?auto_27763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27759 ?auto_27760 ) ) ( not ( = ?auto_27759 ?auto_27761 ) ) ( not ( = ?auto_27759 ?auto_27762 ) ) ( not ( = ?auto_27760 ?auto_27761 ) ) ( not ( = ?auto_27760 ?auto_27762 ) ) ( not ( = ?auto_27761 ?auto_27762 ) ) ( ON ?auto_27762 ?auto_27763 ) ( not ( = ?auto_27759 ?auto_27763 ) ) ( not ( = ?auto_27760 ?auto_27763 ) ) ( not ( = ?auto_27761 ?auto_27763 ) ) ( not ( = ?auto_27762 ?auto_27763 ) ) ( ON ?auto_27761 ?auto_27762 ) ( ON-TABLE ?auto_27763 ) ( ON ?auto_27760 ?auto_27761 ) ( CLEAR ?auto_27760 ) ( HOLDING ?auto_27759 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27759 )
      ( MAKE-4PILE ?auto_27759 ?auto_27760 ?auto_27761 ?auto_27762 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27764 - BLOCK
      ?auto_27765 - BLOCK
      ?auto_27766 - BLOCK
      ?auto_27767 - BLOCK
    )
    :vars
    (
      ?auto_27768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27764 ?auto_27765 ) ) ( not ( = ?auto_27764 ?auto_27766 ) ) ( not ( = ?auto_27764 ?auto_27767 ) ) ( not ( = ?auto_27765 ?auto_27766 ) ) ( not ( = ?auto_27765 ?auto_27767 ) ) ( not ( = ?auto_27766 ?auto_27767 ) ) ( ON ?auto_27767 ?auto_27768 ) ( not ( = ?auto_27764 ?auto_27768 ) ) ( not ( = ?auto_27765 ?auto_27768 ) ) ( not ( = ?auto_27766 ?auto_27768 ) ) ( not ( = ?auto_27767 ?auto_27768 ) ) ( ON ?auto_27766 ?auto_27767 ) ( ON-TABLE ?auto_27768 ) ( ON ?auto_27765 ?auto_27766 ) ( ON ?auto_27764 ?auto_27765 ) ( CLEAR ?auto_27764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27768 ?auto_27767 ?auto_27766 ?auto_27765 )
      ( MAKE-4PILE ?auto_27764 ?auto_27765 ?auto_27766 ?auto_27767 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27773 - BLOCK
      ?auto_27774 - BLOCK
      ?auto_27775 - BLOCK
      ?auto_27776 - BLOCK
    )
    :vars
    (
      ?auto_27777 - BLOCK
      ?auto_27778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27773 ?auto_27774 ) ) ( not ( = ?auto_27773 ?auto_27775 ) ) ( not ( = ?auto_27773 ?auto_27776 ) ) ( not ( = ?auto_27774 ?auto_27775 ) ) ( not ( = ?auto_27774 ?auto_27776 ) ) ( not ( = ?auto_27775 ?auto_27776 ) ) ( ON ?auto_27776 ?auto_27777 ) ( not ( = ?auto_27773 ?auto_27777 ) ) ( not ( = ?auto_27774 ?auto_27777 ) ) ( not ( = ?auto_27775 ?auto_27777 ) ) ( not ( = ?auto_27776 ?auto_27777 ) ) ( ON ?auto_27775 ?auto_27776 ) ( ON-TABLE ?auto_27777 ) ( ON ?auto_27774 ?auto_27775 ) ( CLEAR ?auto_27774 ) ( ON ?auto_27773 ?auto_27778 ) ( CLEAR ?auto_27773 ) ( HAND-EMPTY ) ( not ( = ?auto_27773 ?auto_27778 ) ) ( not ( = ?auto_27774 ?auto_27778 ) ) ( not ( = ?auto_27775 ?auto_27778 ) ) ( not ( = ?auto_27776 ?auto_27778 ) ) ( not ( = ?auto_27777 ?auto_27778 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27773 ?auto_27778 )
      ( MAKE-4PILE ?auto_27773 ?auto_27774 ?auto_27775 ?auto_27776 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27779 - BLOCK
      ?auto_27780 - BLOCK
      ?auto_27781 - BLOCK
      ?auto_27782 - BLOCK
    )
    :vars
    (
      ?auto_27783 - BLOCK
      ?auto_27784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27779 ?auto_27780 ) ) ( not ( = ?auto_27779 ?auto_27781 ) ) ( not ( = ?auto_27779 ?auto_27782 ) ) ( not ( = ?auto_27780 ?auto_27781 ) ) ( not ( = ?auto_27780 ?auto_27782 ) ) ( not ( = ?auto_27781 ?auto_27782 ) ) ( ON ?auto_27782 ?auto_27783 ) ( not ( = ?auto_27779 ?auto_27783 ) ) ( not ( = ?auto_27780 ?auto_27783 ) ) ( not ( = ?auto_27781 ?auto_27783 ) ) ( not ( = ?auto_27782 ?auto_27783 ) ) ( ON ?auto_27781 ?auto_27782 ) ( ON-TABLE ?auto_27783 ) ( ON ?auto_27779 ?auto_27784 ) ( CLEAR ?auto_27779 ) ( not ( = ?auto_27779 ?auto_27784 ) ) ( not ( = ?auto_27780 ?auto_27784 ) ) ( not ( = ?auto_27781 ?auto_27784 ) ) ( not ( = ?auto_27782 ?auto_27784 ) ) ( not ( = ?auto_27783 ?auto_27784 ) ) ( HOLDING ?auto_27780 ) ( CLEAR ?auto_27781 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27783 ?auto_27782 ?auto_27781 ?auto_27780 )
      ( MAKE-4PILE ?auto_27779 ?auto_27780 ?auto_27781 ?auto_27782 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27785 - BLOCK
      ?auto_27786 - BLOCK
      ?auto_27787 - BLOCK
      ?auto_27788 - BLOCK
    )
    :vars
    (
      ?auto_27790 - BLOCK
      ?auto_27789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27785 ?auto_27786 ) ) ( not ( = ?auto_27785 ?auto_27787 ) ) ( not ( = ?auto_27785 ?auto_27788 ) ) ( not ( = ?auto_27786 ?auto_27787 ) ) ( not ( = ?auto_27786 ?auto_27788 ) ) ( not ( = ?auto_27787 ?auto_27788 ) ) ( ON ?auto_27788 ?auto_27790 ) ( not ( = ?auto_27785 ?auto_27790 ) ) ( not ( = ?auto_27786 ?auto_27790 ) ) ( not ( = ?auto_27787 ?auto_27790 ) ) ( not ( = ?auto_27788 ?auto_27790 ) ) ( ON ?auto_27787 ?auto_27788 ) ( ON-TABLE ?auto_27790 ) ( ON ?auto_27785 ?auto_27789 ) ( not ( = ?auto_27785 ?auto_27789 ) ) ( not ( = ?auto_27786 ?auto_27789 ) ) ( not ( = ?auto_27787 ?auto_27789 ) ) ( not ( = ?auto_27788 ?auto_27789 ) ) ( not ( = ?auto_27790 ?auto_27789 ) ) ( CLEAR ?auto_27787 ) ( ON ?auto_27786 ?auto_27785 ) ( CLEAR ?auto_27786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27789 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27789 ?auto_27785 )
      ( MAKE-4PILE ?auto_27785 ?auto_27786 ?auto_27787 ?auto_27788 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27791 - BLOCK
      ?auto_27792 - BLOCK
      ?auto_27793 - BLOCK
      ?auto_27794 - BLOCK
    )
    :vars
    (
      ?auto_27796 - BLOCK
      ?auto_27795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27791 ?auto_27792 ) ) ( not ( = ?auto_27791 ?auto_27793 ) ) ( not ( = ?auto_27791 ?auto_27794 ) ) ( not ( = ?auto_27792 ?auto_27793 ) ) ( not ( = ?auto_27792 ?auto_27794 ) ) ( not ( = ?auto_27793 ?auto_27794 ) ) ( ON ?auto_27794 ?auto_27796 ) ( not ( = ?auto_27791 ?auto_27796 ) ) ( not ( = ?auto_27792 ?auto_27796 ) ) ( not ( = ?auto_27793 ?auto_27796 ) ) ( not ( = ?auto_27794 ?auto_27796 ) ) ( ON-TABLE ?auto_27796 ) ( ON ?auto_27791 ?auto_27795 ) ( not ( = ?auto_27791 ?auto_27795 ) ) ( not ( = ?auto_27792 ?auto_27795 ) ) ( not ( = ?auto_27793 ?auto_27795 ) ) ( not ( = ?auto_27794 ?auto_27795 ) ) ( not ( = ?auto_27796 ?auto_27795 ) ) ( ON ?auto_27792 ?auto_27791 ) ( CLEAR ?auto_27792 ) ( ON-TABLE ?auto_27795 ) ( HOLDING ?auto_27793 ) ( CLEAR ?auto_27794 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27796 ?auto_27794 ?auto_27793 )
      ( MAKE-4PILE ?auto_27791 ?auto_27792 ?auto_27793 ?auto_27794 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27797 - BLOCK
      ?auto_27798 - BLOCK
      ?auto_27799 - BLOCK
      ?auto_27800 - BLOCK
    )
    :vars
    (
      ?auto_27801 - BLOCK
      ?auto_27802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27797 ?auto_27798 ) ) ( not ( = ?auto_27797 ?auto_27799 ) ) ( not ( = ?auto_27797 ?auto_27800 ) ) ( not ( = ?auto_27798 ?auto_27799 ) ) ( not ( = ?auto_27798 ?auto_27800 ) ) ( not ( = ?auto_27799 ?auto_27800 ) ) ( ON ?auto_27800 ?auto_27801 ) ( not ( = ?auto_27797 ?auto_27801 ) ) ( not ( = ?auto_27798 ?auto_27801 ) ) ( not ( = ?auto_27799 ?auto_27801 ) ) ( not ( = ?auto_27800 ?auto_27801 ) ) ( ON-TABLE ?auto_27801 ) ( ON ?auto_27797 ?auto_27802 ) ( not ( = ?auto_27797 ?auto_27802 ) ) ( not ( = ?auto_27798 ?auto_27802 ) ) ( not ( = ?auto_27799 ?auto_27802 ) ) ( not ( = ?auto_27800 ?auto_27802 ) ) ( not ( = ?auto_27801 ?auto_27802 ) ) ( ON ?auto_27798 ?auto_27797 ) ( ON-TABLE ?auto_27802 ) ( CLEAR ?auto_27800 ) ( ON ?auto_27799 ?auto_27798 ) ( CLEAR ?auto_27799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27802 ?auto_27797 ?auto_27798 )
      ( MAKE-4PILE ?auto_27797 ?auto_27798 ?auto_27799 ?auto_27800 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27803 - BLOCK
      ?auto_27804 - BLOCK
      ?auto_27805 - BLOCK
      ?auto_27806 - BLOCK
    )
    :vars
    (
      ?auto_27807 - BLOCK
      ?auto_27808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27803 ?auto_27804 ) ) ( not ( = ?auto_27803 ?auto_27805 ) ) ( not ( = ?auto_27803 ?auto_27806 ) ) ( not ( = ?auto_27804 ?auto_27805 ) ) ( not ( = ?auto_27804 ?auto_27806 ) ) ( not ( = ?auto_27805 ?auto_27806 ) ) ( not ( = ?auto_27803 ?auto_27807 ) ) ( not ( = ?auto_27804 ?auto_27807 ) ) ( not ( = ?auto_27805 ?auto_27807 ) ) ( not ( = ?auto_27806 ?auto_27807 ) ) ( ON-TABLE ?auto_27807 ) ( ON ?auto_27803 ?auto_27808 ) ( not ( = ?auto_27803 ?auto_27808 ) ) ( not ( = ?auto_27804 ?auto_27808 ) ) ( not ( = ?auto_27805 ?auto_27808 ) ) ( not ( = ?auto_27806 ?auto_27808 ) ) ( not ( = ?auto_27807 ?auto_27808 ) ) ( ON ?auto_27804 ?auto_27803 ) ( ON-TABLE ?auto_27808 ) ( ON ?auto_27805 ?auto_27804 ) ( CLEAR ?auto_27805 ) ( HOLDING ?auto_27806 ) ( CLEAR ?auto_27807 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27807 ?auto_27806 )
      ( MAKE-4PILE ?auto_27803 ?auto_27804 ?auto_27805 ?auto_27806 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27809 - BLOCK
      ?auto_27810 - BLOCK
      ?auto_27811 - BLOCK
      ?auto_27812 - BLOCK
    )
    :vars
    (
      ?auto_27813 - BLOCK
      ?auto_27814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27809 ?auto_27810 ) ) ( not ( = ?auto_27809 ?auto_27811 ) ) ( not ( = ?auto_27809 ?auto_27812 ) ) ( not ( = ?auto_27810 ?auto_27811 ) ) ( not ( = ?auto_27810 ?auto_27812 ) ) ( not ( = ?auto_27811 ?auto_27812 ) ) ( not ( = ?auto_27809 ?auto_27813 ) ) ( not ( = ?auto_27810 ?auto_27813 ) ) ( not ( = ?auto_27811 ?auto_27813 ) ) ( not ( = ?auto_27812 ?auto_27813 ) ) ( ON-TABLE ?auto_27813 ) ( ON ?auto_27809 ?auto_27814 ) ( not ( = ?auto_27809 ?auto_27814 ) ) ( not ( = ?auto_27810 ?auto_27814 ) ) ( not ( = ?auto_27811 ?auto_27814 ) ) ( not ( = ?auto_27812 ?auto_27814 ) ) ( not ( = ?auto_27813 ?auto_27814 ) ) ( ON ?auto_27810 ?auto_27809 ) ( ON-TABLE ?auto_27814 ) ( ON ?auto_27811 ?auto_27810 ) ( CLEAR ?auto_27813 ) ( ON ?auto_27812 ?auto_27811 ) ( CLEAR ?auto_27812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27814 ?auto_27809 ?auto_27810 ?auto_27811 )
      ( MAKE-4PILE ?auto_27809 ?auto_27810 ?auto_27811 ?auto_27812 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27815 - BLOCK
      ?auto_27816 - BLOCK
      ?auto_27817 - BLOCK
      ?auto_27818 - BLOCK
    )
    :vars
    (
      ?auto_27819 - BLOCK
      ?auto_27820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27815 ?auto_27816 ) ) ( not ( = ?auto_27815 ?auto_27817 ) ) ( not ( = ?auto_27815 ?auto_27818 ) ) ( not ( = ?auto_27816 ?auto_27817 ) ) ( not ( = ?auto_27816 ?auto_27818 ) ) ( not ( = ?auto_27817 ?auto_27818 ) ) ( not ( = ?auto_27815 ?auto_27819 ) ) ( not ( = ?auto_27816 ?auto_27819 ) ) ( not ( = ?auto_27817 ?auto_27819 ) ) ( not ( = ?auto_27818 ?auto_27819 ) ) ( ON ?auto_27815 ?auto_27820 ) ( not ( = ?auto_27815 ?auto_27820 ) ) ( not ( = ?auto_27816 ?auto_27820 ) ) ( not ( = ?auto_27817 ?auto_27820 ) ) ( not ( = ?auto_27818 ?auto_27820 ) ) ( not ( = ?auto_27819 ?auto_27820 ) ) ( ON ?auto_27816 ?auto_27815 ) ( ON-TABLE ?auto_27820 ) ( ON ?auto_27817 ?auto_27816 ) ( ON ?auto_27818 ?auto_27817 ) ( CLEAR ?auto_27818 ) ( HOLDING ?auto_27819 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27819 )
      ( MAKE-4PILE ?auto_27815 ?auto_27816 ?auto_27817 ?auto_27818 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27821 - BLOCK
      ?auto_27822 - BLOCK
      ?auto_27823 - BLOCK
      ?auto_27824 - BLOCK
    )
    :vars
    (
      ?auto_27825 - BLOCK
      ?auto_27826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27821 ?auto_27822 ) ) ( not ( = ?auto_27821 ?auto_27823 ) ) ( not ( = ?auto_27821 ?auto_27824 ) ) ( not ( = ?auto_27822 ?auto_27823 ) ) ( not ( = ?auto_27822 ?auto_27824 ) ) ( not ( = ?auto_27823 ?auto_27824 ) ) ( not ( = ?auto_27821 ?auto_27825 ) ) ( not ( = ?auto_27822 ?auto_27825 ) ) ( not ( = ?auto_27823 ?auto_27825 ) ) ( not ( = ?auto_27824 ?auto_27825 ) ) ( ON ?auto_27821 ?auto_27826 ) ( not ( = ?auto_27821 ?auto_27826 ) ) ( not ( = ?auto_27822 ?auto_27826 ) ) ( not ( = ?auto_27823 ?auto_27826 ) ) ( not ( = ?auto_27824 ?auto_27826 ) ) ( not ( = ?auto_27825 ?auto_27826 ) ) ( ON ?auto_27822 ?auto_27821 ) ( ON-TABLE ?auto_27826 ) ( ON ?auto_27823 ?auto_27822 ) ( ON ?auto_27824 ?auto_27823 ) ( ON ?auto_27825 ?auto_27824 ) ( CLEAR ?auto_27825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27826 ?auto_27821 ?auto_27822 ?auto_27823 ?auto_27824 )
      ( MAKE-4PILE ?auto_27821 ?auto_27822 ?auto_27823 ?auto_27824 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27837 - BLOCK
      ?auto_27838 - BLOCK
      ?auto_27839 - BLOCK
      ?auto_27840 - BLOCK
      ?auto_27841 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27840 ) ( ON-TABLE ?auto_27837 ) ( ON ?auto_27838 ?auto_27837 ) ( ON ?auto_27839 ?auto_27838 ) ( ON ?auto_27840 ?auto_27839 ) ( not ( = ?auto_27837 ?auto_27838 ) ) ( not ( = ?auto_27837 ?auto_27839 ) ) ( not ( = ?auto_27837 ?auto_27840 ) ) ( not ( = ?auto_27837 ?auto_27841 ) ) ( not ( = ?auto_27838 ?auto_27839 ) ) ( not ( = ?auto_27838 ?auto_27840 ) ) ( not ( = ?auto_27838 ?auto_27841 ) ) ( not ( = ?auto_27839 ?auto_27840 ) ) ( not ( = ?auto_27839 ?auto_27841 ) ) ( not ( = ?auto_27840 ?auto_27841 ) ) ( ON-TABLE ?auto_27841 ) ( CLEAR ?auto_27841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_27841 )
      ( MAKE-5PILE ?auto_27837 ?auto_27838 ?auto_27839 ?auto_27840 ?auto_27841 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27842 - BLOCK
      ?auto_27843 - BLOCK
      ?auto_27844 - BLOCK
      ?auto_27845 - BLOCK
      ?auto_27846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27842 ) ( ON ?auto_27843 ?auto_27842 ) ( ON ?auto_27844 ?auto_27843 ) ( not ( = ?auto_27842 ?auto_27843 ) ) ( not ( = ?auto_27842 ?auto_27844 ) ) ( not ( = ?auto_27842 ?auto_27845 ) ) ( not ( = ?auto_27842 ?auto_27846 ) ) ( not ( = ?auto_27843 ?auto_27844 ) ) ( not ( = ?auto_27843 ?auto_27845 ) ) ( not ( = ?auto_27843 ?auto_27846 ) ) ( not ( = ?auto_27844 ?auto_27845 ) ) ( not ( = ?auto_27844 ?auto_27846 ) ) ( not ( = ?auto_27845 ?auto_27846 ) ) ( ON-TABLE ?auto_27846 ) ( CLEAR ?auto_27846 ) ( HOLDING ?auto_27845 ) ( CLEAR ?auto_27844 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27842 ?auto_27843 ?auto_27844 ?auto_27845 )
      ( MAKE-5PILE ?auto_27842 ?auto_27843 ?auto_27844 ?auto_27845 ?auto_27846 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27847 - BLOCK
      ?auto_27848 - BLOCK
      ?auto_27849 - BLOCK
      ?auto_27850 - BLOCK
      ?auto_27851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27847 ) ( ON ?auto_27848 ?auto_27847 ) ( ON ?auto_27849 ?auto_27848 ) ( not ( = ?auto_27847 ?auto_27848 ) ) ( not ( = ?auto_27847 ?auto_27849 ) ) ( not ( = ?auto_27847 ?auto_27850 ) ) ( not ( = ?auto_27847 ?auto_27851 ) ) ( not ( = ?auto_27848 ?auto_27849 ) ) ( not ( = ?auto_27848 ?auto_27850 ) ) ( not ( = ?auto_27848 ?auto_27851 ) ) ( not ( = ?auto_27849 ?auto_27850 ) ) ( not ( = ?auto_27849 ?auto_27851 ) ) ( not ( = ?auto_27850 ?auto_27851 ) ) ( ON-TABLE ?auto_27851 ) ( CLEAR ?auto_27849 ) ( ON ?auto_27850 ?auto_27851 ) ( CLEAR ?auto_27850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27851 )
      ( MAKE-5PILE ?auto_27847 ?auto_27848 ?auto_27849 ?auto_27850 ?auto_27851 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27852 - BLOCK
      ?auto_27853 - BLOCK
      ?auto_27854 - BLOCK
      ?auto_27855 - BLOCK
      ?auto_27856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27852 ) ( ON ?auto_27853 ?auto_27852 ) ( not ( = ?auto_27852 ?auto_27853 ) ) ( not ( = ?auto_27852 ?auto_27854 ) ) ( not ( = ?auto_27852 ?auto_27855 ) ) ( not ( = ?auto_27852 ?auto_27856 ) ) ( not ( = ?auto_27853 ?auto_27854 ) ) ( not ( = ?auto_27853 ?auto_27855 ) ) ( not ( = ?auto_27853 ?auto_27856 ) ) ( not ( = ?auto_27854 ?auto_27855 ) ) ( not ( = ?auto_27854 ?auto_27856 ) ) ( not ( = ?auto_27855 ?auto_27856 ) ) ( ON-TABLE ?auto_27856 ) ( ON ?auto_27855 ?auto_27856 ) ( CLEAR ?auto_27855 ) ( HOLDING ?auto_27854 ) ( CLEAR ?auto_27853 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27852 ?auto_27853 ?auto_27854 )
      ( MAKE-5PILE ?auto_27852 ?auto_27853 ?auto_27854 ?auto_27855 ?auto_27856 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27857 - BLOCK
      ?auto_27858 - BLOCK
      ?auto_27859 - BLOCK
      ?auto_27860 - BLOCK
      ?auto_27861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27857 ) ( ON ?auto_27858 ?auto_27857 ) ( not ( = ?auto_27857 ?auto_27858 ) ) ( not ( = ?auto_27857 ?auto_27859 ) ) ( not ( = ?auto_27857 ?auto_27860 ) ) ( not ( = ?auto_27857 ?auto_27861 ) ) ( not ( = ?auto_27858 ?auto_27859 ) ) ( not ( = ?auto_27858 ?auto_27860 ) ) ( not ( = ?auto_27858 ?auto_27861 ) ) ( not ( = ?auto_27859 ?auto_27860 ) ) ( not ( = ?auto_27859 ?auto_27861 ) ) ( not ( = ?auto_27860 ?auto_27861 ) ) ( ON-TABLE ?auto_27861 ) ( ON ?auto_27860 ?auto_27861 ) ( CLEAR ?auto_27858 ) ( ON ?auto_27859 ?auto_27860 ) ( CLEAR ?auto_27859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27861 ?auto_27860 )
      ( MAKE-5PILE ?auto_27857 ?auto_27858 ?auto_27859 ?auto_27860 ?auto_27861 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27862 - BLOCK
      ?auto_27863 - BLOCK
      ?auto_27864 - BLOCK
      ?auto_27865 - BLOCK
      ?auto_27866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27862 ) ( not ( = ?auto_27862 ?auto_27863 ) ) ( not ( = ?auto_27862 ?auto_27864 ) ) ( not ( = ?auto_27862 ?auto_27865 ) ) ( not ( = ?auto_27862 ?auto_27866 ) ) ( not ( = ?auto_27863 ?auto_27864 ) ) ( not ( = ?auto_27863 ?auto_27865 ) ) ( not ( = ?auto_27863 ?auto_27866 ) ) ( not ( = ?auto_27864 ?auto_27865 ) ) ( not ( = ?auto_27864 ?auto_27866 ) ) ( not ( = ?auto_27865 ?auto_27866 ) ) ( ON-TABLE ?auto_27866 ) ( ON ?auto_27865 ?auto_27866 ) ( ON ?auto_27864 ?auto_27865 ) ( CLEAR ?auto_27864 ) ( HOLDING ?auto_27863 ) ( CLEAR ?auto_27862 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27862 ?auto_27863 )
      ( MAKE-5PILE ?auto_27862 ?auto_27863 ?auto_27864 ?auto_27865 ?auto_27866 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27867 - BLOCK
      ?auto_27868 - BLOCK
      ?auto_27869 - BLOCK
      ?auto_27870 - BLOCK
      ?auto_27871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27867 ) ( not ( = ?auto_27867 ?auto_27868 ) ) ( not ( = ?auto_27867 ?auto_27869 ) ) ( not ( = ?auto_27867 ?auto_27870 ) ) ( not ( = ?auto_27867 ?auto_27871 ) ) ( not ( = ?auto_27868 ?auto_27869 ) ) ( not ( = ?auto_27868 ?auto_27870 ) ) ( not ( = ?auto_27868 ?auto_27871 ) ) ( not ( = ?auto_27869 ?auto_27870 ) ) ( not ( = ?auto_27869 ?auto_27871 ) ) ( not ( = ?auto_27870 ?auto_27871 ) ) ( ON-TABLE ?auto_27871 ) ( ON ?auto_27870 ?auto_27871 ) ( ON ?auto_27869 ?auto_27870 ) ( CLEAR ?auto_27867 ) ( ON ?auto_27868 ?auto_27869 ) ( CLEAR ?auto_27868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27871 ?auto_27870 ?auto_27869 )
      ( MAKE-5PILE ?auto_27867 ?auto_27868 ?auto_27869 ?auto_27870 ?auto_27871 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27872 - BLOCK
      ?auto_27873 - BLOCK
      ?auto_27874 - BLOCK
      ?auto_27875 - BLOCK
      ?auto_27876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27872 ?auto_27873 ) ) ( not ( = ?auto_27872 ?auto_27874 ) ) ( not ( = ?auto_27872 ?auto_27875 ) ) ( not ( = ?auto_27872 ?auto_27876 ) ) ( not ( = ?auto_27873 ?auto_27874 ) ) ( not ( = ?auto_27873 ?auto_27875 ) ) ( not ( = ?auto_27873 ?auto_27876 ) ) ( not ( = ?auto_27874 ?auto_27875 ) ) ( not ( = ?auto_27874 ?auto_27876 ) ) ( not ( = ?auto_27875 ?auto_27876 ) ) ( ON-TABLE ?auto_27876 ) ( ON ?auto_27875 ?auto_27876 ) ( ON ?auto_27874 ?auto_27875 ) ( ON ?auto_27873 ?auto_27874 ) ( CLEAR ?auto_27873 ) ( HOLDING ?auto_27872 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27872 )
      ( MAKE-5PILE ?auto_27872 ?auto_27873 ?auto_27874 ?auto_27875 ?auto_27876 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27877 - BLOCK
      ?auto_27878 - BLOCK
      ?auto_27879 - BLOCK
      ?auto_27880 - BLOCK
      ?auto_27881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27877 ?auto_27878 ) ) ( not ( = ?auto_27877 ?auto_27879 ) ) ( not ( = ?auto_27877 ?auto_27880 ) ) ( not ( = ?auto_27877 ?auto_27881 ) ) ( not ( = ?auto_27878 ?auto_27879 ) ) ( not ( = ?auto_27878 ?auto_27880 ) ) ( not ( = ?auto_27878 ?auto_27881 ) ) ( not ( = ?auto_27879 ?auto_27880 ) ) ( not ( = ?auto_27879 ?auto_27881 ) ) ( not ( = ?auto_27880 ?auto_27881 ) ) ( ON-TABLE ?auto_27881 ) ( ON ?auto_27880 ?auto_27881 ) ( ON ?auto_27879 ?auto_27880 ) ( ON ?auto_27878 ?auto_27879 ) ( ON ?auto_27877 ?auto_27878 ) ( CLEAR ?auto_27877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27881 ?auto_27880 ?auto_27879 ?auto_27878 )
      ( MAKE-5PILE ?auto_27877 ?auto_27878 ?auto_27879 ?auto_27880 ?auto_27881 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27887 - BLOCK
      ?auto_27888 - BLOCK
      ?auto_27889 - BLOCK
      ?auto_27890 - BLOCK
      ?auto_27891 - BLOCK
    )
    :vars
    (
      ?auto_27892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27887 ?auto_27888 ) ) ( not ( = ?auto_27887 ?auto_27889 ) ) ( not ( = ?auto_27887 ?auto_27890 ) ) ( not ( = ?auto_27887 ?auto_27891 ) ) ( not ( = ?auto_27888 ?auto_27889 ) ) ( not ( = ?auto_27888 ?auto_27890 ) ) ( not ( = ?auto_27888 ?auto_27891 ) ) ( not ( = ?auto_27889 ?auto_27890 ) ) ( not ( = ?auto_27889 ?auto_27891 ) ) ( not ( = ?auto_27890 ?auto_27891 ) ) ( ON-TABLE ?auto_27891 ) ( ON ?auto_27890 ?auto_27891 ) ( ON ?auto_27889 ?auto_27890 ) ( ON ?auto_27888 ?auto_27889 ) ( CLEAR ?auto_27888 ) ( ON ?auto_27887 ?auto_27892 ) ( CLEAR ?auto_27887 ) ( HAND-EMPTY ) ( not ( = ?auto_27887 ?auto_27892 ) ) ( not ( = ?auto_27888 ?auto_27892 ) ) ( not ( = ?auto_27889 ?auto_27892 ) ) ( not ( = ?auto_27890 ?auto_27892 ) ) ( not ( = ?auto_27891 ?auto_27892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27887 ?auto_27892 )
      ( MAKE-5PILE ?auto_27887 ?auto_27888 ?auto_27889 ?auto_27890 ?auto_27891 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27893 - BLOCK
      ?auto_27894 - BLOCK
      ?auto_27895 - BLOCK
      ?auto_27896 - BLOCK
      ?auto_27897 - BLOCK
    )
    :vars
    (
      ?auto_27898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27893 ?auto_27894 ) ) ( not ( = ?auto_27893 ?auto_27895 ) ) ( not ( = ?auto_27893 ?auto_27896 ) ) ( not ( = ?auto_27893 ?auto_27897 ) ) ( not ( = ?auto_27894 ?auto_27895 ) ) ( not ( = ?auto_27894 ?auto_27896 ) ) ( not ( = ?auto_27894 ?auto_27897 ) ) ( not ( = ?auto_27895 ?auto_27896 ) ) ( not ( = ?auto_27895 ?auto_27897 ) ) ( not ( = ?auto_27896 ?auto_27897 ) ) ( ON-TABLE ?auto_27897 ) ( ON ?auto_27896 ?auto_27897 ) ( ON ?auto_27895 ?auto_27896 ) ( ON ?auto_27893 ?auto_27898 ) ( CLEAR ?auto_27893 ) ( not ( = ?auto_27893 ?auto_27898 ) ) ( not ( = ?auto_27894 ?auto_27898 ) ) ( not ( = ?auto_27895 ?auto_27898 ) ) ( not ( = ?auto_27896 ?auto_27898 ) ) ( not ( = ?auto_27897 ?auto_27898 ) ) ( HOLDING ?auto_27894 ) ( CLEAR ?auto_27895 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27897 ?auto_27896 ?auto_27895 ?auto_27894 )
      ( MAKE-5PILE ?auto_27893 ?auto_27894 ?auto_27895 ?auto_27896 ?auto_27897 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27899 - BLOCK
      ?auto_27900 - BLOCK
      ?auto_27901 - BLOCK
      ?auto_27902 - BLOCK
      ?auto_27903 - BLOCK
    )
    :vars
    (
      ?auto_27904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27899 ?auto_27900 ) ) ( not ( = ?auto_27899 ?auto_27901 ) ) ( not ( = ?auto_27899 ?auto_27902 ) ) ( not ( = ?auto_27899 ?auto_27903 ) ) ( not ( = ?auto_27900 ?auto_27901 ) ) ( not ( = ?auto_27900 ?auto_27902 ) ) ( not ( = ?auto_27900 ?auto_27903 ) ) ( not ( = ?auto_27901 ?auto_27902 ) ) ( not ( = ?auto_27901 ?auto_27903 ) ) ( not ( = ?auto_27902 ?auto_27903 ) ) ( ON-TABLE ?auto_27903 ) ( ON ?auto_27902 ?auto_27903 ) ( ON ?auto_27901 ?auto_27902 ) ( ON ?auto_27899 ?auto_27904 ) ( not ( = ?auto_27899 ?auto_27904 ) ) ( not ( = ?auto_27900 ?auto_27904 ) ) ( not ( = ?auto_27901 ?auto_27904 ) ) ( not ( = ?auto_27902 ?auto_27904 ) ) ( not ( = ?auto_27903 ?auto_27904 ) ) ( CLEAR ?auto_27901 ) ( ON ?auto_27900 ?auto_27899 ) ( CLEAR ?auto_27900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27904 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27904 ?auto_27899 )
      ( MAKE-5PILE ?auto_27899 ?auto_27900 ?auto_27901 ?auto_27902 ?auto_27903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27905 - BLOCK
      ?auto_27906 - BLOCK
      ?auto_27907 - BLOCK
      ?auto_27908 - BLOCK
      ?auto_27909 - BLOCK
    )
    :vars
    (
      ?auto_27910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27905 ?auto_27906 ) ) ( not ( = ?auto_27905 ?auto_27907 ) ) ( not ( = ?auto_27905 ?auto_27908 ) ) ( not ( = ?auto_27905 ?auto_27909 ) ) ( not ( = ?auto_27906 ?auto_27907 ) ) ( not ( = ?auto_27906 ?auto_27908 ) ) ( not ( = ?auto_27906 ?auto_27909 ) ) ( not ( = ?auto_27907 ?auto_27908 ) ) ( not ( = ?auto_27907 ?auto_27909 ) ) ( not ( = ?auto_27908 ?auto_27909 ) ) ( ON-TABLE ?auto_27909 ) ( ON ?auto_27908 ?auto_27909 ) ( ON ?auto_27905 ?auto_27910 ) ( not ( = ?auto_27905 ?auto_27910 ) ) ( not ( = ?auto_27906 ?auto_27910 ) ) ( not ( = ?auto_27907 ?auto_27910 ) ) ( not ( = ?auto_27908 ?auto_27910 ) ) ( not ( = ?auto_27909 ?auto_27910 ) ) ( ON ?auto_27906 ?auto_27905 ) ( CLEAR ?auto_27906 ) ( ON-TABLE ?auto_27910 ) ( HOLDING ?auto_27907 ) ( CLEAR ?auto_27908 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27909 ?auto_27908 ?auto_27907 )
      ( MAKE-5PILE ?auto_27905 ?auto_27906 ?auto_27907 ?auto_27908 ?auto_27909 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27911 - BLOCK
      ?auto_27912 - BLOCK
      ?auto_27913 - BLOCK
      ?auto_27914 - BLOCK
      ?auto_27915 - BLOCK
    )
    :vars
    (
      ?auto_27916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27911 ?auto_27912 ) ) ( not ( = ?auto_27911 ?auto_27913 ) ) ( not ( = ?auto_27911 ?auto_27914 ) ) ( not ( = ?auto_27911 ?auto_27915 ) ) ( not ( = ?auto_27912 ?auto_27913 ) ) ( not ( = ?auto_27912 ?auto_27914 ) ) ( not ( = ?auto_27912 ?auto_27915 ) ) ( not ( = ?auto_27913 ?auto_27914 ) ) ( not ( = ?auto_27913 ?auto_27915 ) ) ( not ( = ?auto_27914 ?auto_27915 ) ) ( ON-TABLE ?auto_27915 ) ( ON ?auto_27914 ?auto_27915 ) ( ON ?auto_27911 ?auto_27916 ) ( not ( = ?auto_27911 ?auto_27916 ) ) ( not ( = ?auto_27912 ?auto_27916 ) ) ( not ( = ?auto_27913 ?auto_27916 ) ) ( not ( = ?auto_27914 ?auto_27916 ) ) ( not ( = ?auto_27915 ?auto_27916 ) ) ( ON ?auto_27912 ?auto_27911 ) ( ON-TABLE ?auto_27916 ) ( CLEAR ?auto_27914 ) ( ON ?auto_27913 ?auto_27912 ) ( CLEAR ?auto_27913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27916 ?auto_27911 ?auto_27912 )
      ( MAKE-5PILE ?auto_27911 ?auto_27912 ?auto_27913 ?auto_27914 ?auto_27915 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27917 - BLOCK
      ?auto_27918 - BLOCK
      ?auto_27919 - BLOCK
      ?auto_27920 - BLOCK
      ?auto_27921 - BLOCK
    )
    :vars
    (
      ?auto_27922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27917 ?auto_27918 ) ) ( not ( = ?auto_27917 ?auto_27919 ) ) ( not ( = ?auto_27917 ?auto_27920 ) ) ( not ( = ?auto_27917 ?auto_27921 ) ) ( not ( = ?auto_27918 ?auto_27919 ) ) ( not ( = ?auto_27918 ?auto_27920 ) ) ( not ( = ?auto_27918 ?auto_27921 ) ) ( not ( = ?auto_27919 ?auto_27920 ) ) ( not ( = ?auto_27919 ?auto_27921 ) ) ( not ( = ?auto_27920 ?auto_27921 ) ) ( ON-TABLE ?auto_27921 ) ( ON ?auto_27917 ?auto_27922 ) ( not ( = ?auto_27917 ?auto_27922 ) ) ( not ( = ?auto_27918 ?auto_27922 ) ) ( not ( = ?auto_27919 ?auto_27922 ) ) ( not ( = ?auto_27920 ?auto_27922 ) ) ( not ( = ?auto_27921 ?auto_27922 ) ) ( ON ?auto_27918 ?auto_27917 ) ( ON-TABLE ?auto_27922 ) ( ON ?auto_27919 ?auto_27918 ) ( CLEAR ?auto_27919 ) ( HOLDING ?auto_27920 ) ( CLEAR ?auto_27921 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27921 ?auto_27920 )
      ( MAKE-5PILE ?auto_27917 ?auto_27918 ?auto_27919 ?auto_27920 ?auto_27921 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27923 - BLOCK
      ?auto_27924 - BLOCK
      ?auto_27925 - BLOCK
      ?auto_27926 - BLOCK
      ?auto_27927 - BLOCK
    )
    :vars
    (
      ?auto_27928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27923 ?auto_27924 ) ) ( not ( = ?auto_27923 ?auto_27925 ) ) ( not ( = ?auto_27923 ?auto_27926 ) ) ( not ( = ?auto_27923 ?auto_27927 ) ) ( not ( = ?auto_27924 ?auto_27925 ) ) ( not ( = ?auto_27924 ?auto_27926 ) ) ( not ( = ?auto_27924 ?auto_27927 ) ) ( not ( = ?auto_27925 ?auto_27926 ) ) ( not ( = ?auto_27925 ?auto_27927 ) ) ( not ( = ?auto_27926 ?auto_27927 ) ) ( ON-TABLE ?auto_27927 ) ( ON ?auto_27923 ?auto_27928 ) ( not ( = ?auto_27923 ?auto_27928 ) ) ( not ( = ?auto_27924 ?auto_27928 ) ) ( not ( = ?auto_27925 ?auto_27928 ) ) ( not ( = ?auto_27926 ?auto_27928 ) ) ( not ( = ?auto_27927 ?auto_27928 ) ) ( ON ?auto_27924 ?auto_27923 ) ( ON-TABLE ?auto_27928 ) ( ON ?auto_27925 ?auto_27924 ) ( CLEAR ?auto_27927 ) ( ON ?auto_27926 ?auto_27925 ) ( CLEAR ?auto_27926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27928 ?auto_27923 ?auto_27924 ?auto_27925 )
      ( MAKE-5PILE ?auto_27923 ?auto_27924 ?auto_27925 ?auto_27926 ?auto_27927 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27929 - BLOCK
      ?auto_27930 - BLOCK
      ?auto_27931 - BLOCK
      ?auto_27932 - BLOCK
      ?auto_27933 - BLOCK
    )
    :vars
    (
      ?auto_27934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27929 ?auto_27930 ) ) ( not ( = ?auto_27929 ?auto_27931 ) ) ( not ( = ?auto_27929 ?auto_27932 ) ) ( not ( = ?auto_27929 ?auto_27933 ) ) ( not ( = ?auto_27930 ?auto_27931 ) ) ( not ( = ?auto_27930 ?auto_27932 ) ) ( not ( = ?auto_27930 ?auto_27933 ) ) ( not ( = ?auto_27931 ?auto_27932 ) ) ( not ( = ?auto_27931 ?auto_27933 ) ) ( not ( = ?auto_27932 ?auto_27933 ) ) ( ON ?auto_27929 ?auto_27934 ) ( not ( = ?auto_27929 ?auto_27934 ) ) ( not ( = ?auto_27930 ?auto_27934 ) ) ( not ( = ?auto_27931 ?auto_27934 ) ) ( not ( = ?auto_27932 ?auto_27934 ) ) ( not ( = ?auto_27933 ?auto_27934 ) ) ( ON ?auto_27930 ?auto_27929 ) ( ON-TABLE ?auto_27934 ) ( ON ?auto_27931 ?auto_27930 ) ( ON ?auto_27932 ?auto_27931 ) ( CLEAR ?auto_27932 ) ( HOLDING ?auto_27933 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27933 )
      ( MAKE-5PILE ?auto_27929 ?auto_27930 ?auto_27931 ?auto_27932 ?auto_27933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27935 - BLOCK
      ?auto_27936 - BLOCK
      ?auto_27937 - BLOCK
      ?auto_27938 - BLOCK
      ?auto_27939 - BLOCK
    )
    :vars
    (
      ?auto_27940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27935 ?auto_27936 ) ) ( not ( = ?auto_27935 ?auto_27937 ) ) ( not ( = ?auto_27935 ?auto_27938 ) ) ( not ( = ?auto_27935 ?auto_27939 ) ) ( not ( = ?auto_27936 ?auto_27937 ) ) ( not ( = ?auto_27936 ?auto_27938 ) ) ( not ( = ?auto_27936 ?auto_27939 ) ) ( not ( = ?auto_27937 ?auto_27938 ) ) ( not ( = ?auto_27937 ?auto_27939 ) ) ( not ( = ?auto_27938 ?auto_27939 ) ) ( ON ?auto_27935 ?auto_27940 ) ( not ( = ?auto_27935 ?auto_27940 ) ) ( not ( = ?auto_27936 ?auto_27940 ) ) ( not ( = ?auto_27937 ?auto_27940 ) ) ( not ( = ?auto_27938 ?auto_27940 ) ) ( not ( = ?auto_27939 ?auto_27940 ) ) ( ON ?auto_27936 ?auto_27935 ) ( ON-TABLE ?auto_27940 ) ( ON ?auto_27937 ?auto_27936 ) ( ON ?auto_27938 ?auto_27937 ) ( ON ?auto_27939 ?auto_27938 ) ( CLEAR ?auto_27939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27940 ?auto_27935 ?auto_27936 ?auto_27937 ?auto_27938 )
      ( MAKE-5PILE ?auto_27935 ?auto_27936 ?auto_27937 ?auto_27938 ?auto_27939 ) )
  )

)

