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
      ?auto_10014 - BLOCK
      ?auto_10015 - BLOCK
      ?auto_10016 - BLOCK
      ?auto_10017 - BLOCK
    )
    :vars
    (
      ?auto_10018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10018 ?auto_10017 ) ( CLEAR ?auto_10018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10014 ) ( ON ?auto_10015 ?auto_10014 ) ( ON ?auto_10016 ?auto_10015 ) ( ON ?auto_10017 ?auto_10016 ) ( not ( = ?auto_10014 ?auto_10015 ) ) ( not ( = ?auto_10014 ?auto_10016 ) ) ( not ( = ?auto_10014 ?auto_10017 ) ) ( not ( = ?auto_10014 ?auto_10018 ) ) ( not ( = ?auto_10015 ?auto_10016 ) ) ( not ( = ?auto_10015 ?auto_10017 ) ) ( not ( = ?auto_10015 ?auto_10018 ) ) ( not ( = ?auto_10016 ?auto_10017 ) ) ( not ( = ?auto_10016 ?auto_10018 ) ) ( not ( = ?auto_10017 ?auto_10018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10018 ?auto_10017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10020 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10020 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10021 - BLOCK
    )
    :vars
    (
      ?auto_10022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10021 ?auto_10022 ) ( CLEAR ?auto_10021 ) ( HAND-EMPTY ) ( not ( = ?auto_10021 ?auto_10022 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10021 ?auto_10022 )
      ( MAKE-1PILE ?auto_10021 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10026 - BLOCK
      ?auto_10027 - BLOCK
      ?auto_10028 - BLOCK
    )
    :vars
    (
      ?auto_10029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10029 ?auto_10028 ) ( CLEAR ?auto_10029 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10026 ) ( ON ?auto_10027 ?auto_10026 ) ( ON ?auto_10028 ?auto_10027 ) ( not ( = ?auto_10026 ?auto_10027 ) ) ( not ( = ?auto_10026 ?auto_10028 ) ) ( not ( = ?auto_10026 ?auto_10029 ) ) ( not ( = ?auto_10027 ?auto_10028 ) ) ( not ( = ?auto_10027 ?auto_10029 ) ) ( not ( = ?auto_10028 ?auto_10029 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10029 ?auto_10028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10030 - BLOCK
      ?auto_10031 - BLOCK
      ?auto_10032 - BLOCK
    )
    :vars
    (
      ?auto_10033 - BLOCK
      ?auto_10034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10033 ?auto_10032 ) ( CLEAR ?auto_10033 ) ( ON-TABLE ?auto_10030 ) ( ON ?auto_10031 ?auto_10030 ) ( ON ?auto_10032 ?auto_10031 ) ( not ( = ?auto_10030 ?auto_10031 ) ) ( not ( = ?auto_10030 ?auto_10032 ) ) ( not ( = ?auto_10030 ?auto_10033 ) ) ( not ( = ?auto_10031 ?auto_10032 ) ) ( not ( = ?auto_10031 ?auto_10033 ) ) ( not ( = ?auto_10032 ?auto_10033 ) ) ( HOLDING ?auto_10034 ) ( not ( = ?auto_10030 ?auto_10034 ) ) ( not ( = ?auto_10031 ?auto_10034 ) ) ( not ( = ?auto_10032 ?auto_10034 ) ) ( not ( = ?auto_10033 ?auto_10034 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10034 )
      ( MAKE-3PILE ?auto_10030 ?auto_10031 ?auto_10032 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10035 - BLOCK
      ?auto_10036 - BLOCK
      ?auto_10037 - BLOCK
    )
    :vars
    (
      ?auto_10038 - BLOCK
      ?auto_10039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10038 ?auto_10037 ) ( ON-TABLE ?auto_10035 ) ( ON ?auto_10036 ?auto_10035 ) ( ON ?auto_10037 ?auto_10036 ) ( not ( = ?auto_10035 ?auto_10036 ) ) ( not ( = ?auto_10035 ?auto_10037 ) ) ( not ( = ?auto_10035 ?auto_10038 ) ) ( not ( = ?auto_10036 ?auto_10037 ) ) ( not ( = ?auto_10036 ?auto_10038 ) ) ( not ( = ?auto_10037 ?auto_10038 ) ) ( not ( = ?auto_10035 ?auto_10039 ) ) ( not ( = ?auto_10036 ?auto_10039 ) ) ( not ( = ?auto_10037 ?auto_10039 ) ) ( not ( = ?auto_10038 ?auto_10039 ) ) ( ON ?auto_10039 ?auto_10038 ) ( CLEAR ?auto_10039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10035 ?auto_10036 ?auto_10037 ?auto_10038 )
      ( MAKE-3PILE ?auto_10035 ?auto_10036 ?auto_10037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10042 - BLOCK
      ?auto_10043 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10043 ) ( CLEAR ?auto_10042 ) ( ON-TABLE ?auto_10042 ) ( not ( = ?auto_10042 ?auto_10043 ) ) )
    :subtasks
    ( ( !STACK ?auto_10043 ?auto_10042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10044 - BLOCK
      ?auto_10045 - BLOCK
    )
    :vars
    (
      ?auto_10046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10044 ) ( ON-TABLE ?auto_10044 ) ( not ( = ?auto_10044 ?auto_10045 ) ) ( ON ?auto_10045 ?auto_10046 ) ( CLEAR ?auto_10045 ) ( HAND-EMPTY ) ( not ( = ?auto_10044 ?auto_10046 ) ) ( not ( = ?auto_10045 ?auto_10046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10045 ?auto_10046 )
      ( MAKE-2PILE ?auto_10044 ?auto_10045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10047 - BLOCK
      ?auto_10048 - BLOCK
    )
    :vars
    (
      ?auto_10049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10047 ?auto_10048 ) ) ( ON ?auto_10048 ?auto_10049 ) ( CLEAR ?auto_10048 ) ( not ( = ?auto_10047 ?auto_10049 ) ) ( not ( = ?auto_10048 ?auto_10049 ) ) ( HOLDING ?auto_10047 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10047 )
      ( MAKE-2PILE ?auto_10047 ?auto_10048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10050 - BLOCK
      ?auto_10051 - BLOCK
    )
    :vars
    (
      ?auto_10052 - BLOCK
      ?auto_10053 - BLOCK
      ?auto_10054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10050 ?auto_10051 ) ) ( ON ?auto_10051 ?auto_10052 ) ( not ( = ?auto_10050 ?auto_10052 ) ) ( not ( = ?auto_10051 ?auto_10052 ) ) ( ON ?auto_10050 ?auto_10051 ) ( CLEAR ?auto_10050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10053 ) ( ON ?auto_10054 ?auto_10053 ) ( ON ?auto_10052 ?auto_10054 ) ( not ( = ?auto_10053 ?auto_10054 ) ) ( not ( = ?auto_10053 ?auto_10052 ) ) ( not ( = ?auto_10053 ?auto_10051 ) ) ( not ( = ?auto_10053 ?auto_10050 ) ) ( not ( = ?auto_10054 ?auto_10052 ) ) ( not ( = ?auto_10054 ?auto_10051 ) ) ( not ( = ?auto_10054 ?auto_10050 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10053 ?auto_10054 ?auto_10052 ?auto_10051 )
      ( MAKE-2PILE ?auto_10050 ?auto_10051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10057 - BLOCK
      ?auto_10058 - BLOCK
    )
    :vars
    (
      ?auto_10059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10059 ?auto_10058 ) ( CLEAR ?auto_10059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10057 ) ( ON ?auto_10058 ?auto_10057 ) ( not ( = ?auto_10057 ?auto_10058 ) ) ( not ( = ?auto_10057 ?auto_10059 ) ) ( not ( = ?auto_10058 ?auto_10059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10059 ?auto_10058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10060 - BLOCK
      ?auto_10061 - BLOCK
    )
    :vars
    (
      ?auto_10062 - BLOCK
      ?auto_10063 - BLOCK
      ?auto_10064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10062 ?auto_10061 ) ( CLEAR ?auto_10062 ) ( ON-TABLE ?auto_10060 ) ( ON ?auto_10061 ?auto_10060 ) ( not ( = ?auto_10060 ?auto_10061 ) ) ( not ( = ?auto_10060 ?auto_10062 ) ) ( not ( = ?auto_10061 ?auto_10062 ) ) ( HOLDING ?auto_10063 ) ( CLEAR ?auto_10064 ) ( not ( = ?auto_10060 ?auto_10063 ) ) ( not ( = ?auto_10060 ?auto_10064 ) ) ( not ( = ?auto_10061 ?auto_10063 ) ) ( not ( = ?auto_10061 ?auto_10064 ) ) ( not ( = ?auto_10062 ?auto_10063 ) ) ( not ( = ?auto_10062 ?auto_10064 ) ) ( not ( = ?auto_10063 ?auto_10064 ) ) )
    :subtasks
    ( ( !STACK ?auto_10063 ?auto_10064 )
      ( MAKE-2PILE ?auto_10060 ?auto_10061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10065 - BLOCK
      ?auto_10066 - BLOCK
    )
    :vars
    (
      ?auto_10069 - BLOCK
      ?auto_10067 - BLOCK
      ?auto_10068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10069 ?auto_10066 ) ( ON-TABLE ?auto_10065 ) ( ON ?auto_10066 ?auto_10065 ) ( not ( = ?auto_10065 ?auto_10066 ) ) ( not ( = ?auto_10065 ?auto_10069 ) ) ( not ( = ?auto_10066 ?auto_10069 ) ) ( CLEAR ?auto_10067 ) ( not ( = ?auto_10065 ?auto_10068 ) ) ( not ( = ?auto_10065 ?auto_10067 ) ) ( not ( = ?auto_10066 ?auto_10068 ) ) ( not ( = ?auto_10066 ?auto_10067 ) ) ( not ( = ?auto_10069 ?auto_10068 ) ) ( not ( = ?auto_10069 ?auto_10067 ) ) ( not ( = ?auto_10068 ?auto_10067 ) ) ( ON ?auto_10068 ?auto_10069 ) ( CLEAR ?auto_10068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10065 ?auto_10066 ?auto_10069 )
      ( MAKE-2PILE ?auto_10065 ?auto_10066 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10070 - BLOCK
      ?auto_10071 - BLOCK
    )
    :vars
    (
      ?auto_10073 - BLOCK
      ?auto_10072 - BLOCK
      ?auto_10074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10073 ?auto_10071 ) ( ON-TABLE ?auto_10070 ) ( ON ?auto_10071 ?auto_10070 ) ( not ( = ?auto_10070 ?auto_10071 ) ) ( not ( = ?auto_10070 ?auto_10073 ) ) ( not ( = ?auto_10071 ?auto_10073 ) ) ( not ( = ?auto_10070 ?auto_10072 ) ) ( not ( = ?auto_10070 ?auto_10074 ) ) ( not ( = ?auto_10071 ?auto_10072 ) ) ( not ( = ?auto_10071 ?auto_10074 ) ) ( not ( = ?auto_10073 ?auto_10072 ) ) ( not ( = ?auto_10073 ?auto_10074 ) ) ( not ( = ?auto_10072 ?auto_10074 ) ) ( ON ?auto_10072 ?auto_10073 ) ( CLEAR ?auto_10072 ) ( HOLDING ?auto_10074 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10074 )
      ( MAKE-2PILE ?auto_10070 ?auto_10071 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10075 - BLOCK
      ?auto_10076 - BLOCK
    )
    :vars
    (
      ?auto_10079 - BLOCK
      ?auto_10078 - BLOCK
      ?auto_10077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10079 ?auto_10076 ) ( ON-TABLE ?auto_10075 ) ( ON ?auto_10076 ?auto_10075 ) ( not ( = ?auto_10075 ?auto_10076 ) ) ( not ( = ?auto_10075 ?auto_10079 ) ) ( not ( = ?auto_10076 ?auto_10079 ) ) ( not ( = ?auto_10075 ?auto_10078 ) ) ( not ( = ?auto_10075 ?auto_10077 ) ) ( not ( = ?auto_10076 ?auto_10078 ) ) ( not ( = ?auto_10076 ?auto_10077 ) ) ( not ( = ?auto_10079 ?auto_10078 ) ) ( not ( = ?auto_10079 ?auto_10077 ) ) ( not ( = ?auto_10078 ?auto_10077 ) ) ( ON ?auto_10078 ?auto_10079 ) ( ON ?auto_10077 ?auto_10078 ) ( CLEAR ?auto_10077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10075 ?auto_10076 ?auto_10079 ?auto_10078 )
      ( MAKE-2PILE ?auto_10075 ?auto_10076 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10083 - BLOCK
      ?auto_10084 - BLOCK
      ?auto_10085 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10085 ) ( CLEAR ?auto_10084 ) ( ON-TABLE ?auto_10083 ) ( ON ?auto_10084 ?auto_10083 ) ( not ( = ?auto_10083 ?auto_10084 ) ) ( not ( = ?auto_10083 ?auto_10085 ) ) ( not ( = ?auto_10084 ?auto_10085 ) ) )
    :subtasks
    ( ( !STACK ?auto_10085 ?auto_10084 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10086 - BLOCK
      ?auto_10087 - BLOCK
      ?auto_10088 - BLOCK
    )
    :vars
    (
      ?auto_10089 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10087 ) ( ON-TABLE ?auto_10086 ) ( ON ?auto_10087 ?auto_10086 ) ( not ( = ?auto_10086 ?auto_10087 ) ) ( not ( = ?auto_10086 ?auto_10088 ) ) ( not ( = ?auto_10087 ?auto_10088 ) ) ( ON ?auto_10088 ?auto_10089 ) ( CLEAR ?auto_10088 ) ( HAND-EMPTY ) ( not ( = ?auto_10086 ?auto_10089 ) ) ( not ( = ?auto_10087 ?auto_10089 ) ) ( not ( = ?auto_10088 ?auto_10089 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10088 ?auto_10089 )
      ( MAKE-3PILE ?auto_10086 ?auto_10087 ?auto_10088 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10090 - BLOCK
      ?auto_10091 - BLOCK
      ?auto_10092 - BLOCK
    )
    :vars
    (
      ?auto_10093 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10090 ) ( not ( = ?auto_10090 ?auto_10091 ) ) ( not ( = ?auto_10090 ?auto_10092 ) ) ( not ( = ?auto_10091 ?auto_10092 ) ) ( ON ?auto_10092 ?auto_10093 ) ( CLEAR ?auto_10092 ) ( not ( = ?auto_10090 ?auto_10093 ) ) ( not ( = ?auto_10091 ?auto_10093 ) ) ( not ( = ?auto_10092 ?auto_10093 ) ) ( HOLDING ?auto_10091 ) ( CLEAR ?auto_10090 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10090 ?auto_10091 )
      ( MAKE-3PILE ?auto_10090 ?auto_10091 ?auto_10092 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10094 - BLOCK
      ?auto_10095 - BLOCK
      ?auto_10096 - BLOCK
    )
    :vars
    (
      ?auto_10097 - BLOCK
      ?auto_10098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10094 ) ( not ( = ?auto_10094 ?auto_10095 ) ) ( not ( = ?auto_10094 ?auto_10096 ) ) ( not ( = ?auto_10095 ?auto_10096 ) ) ( ON ?auto_10096 ?auto_10097 ) ( not ( = ?auto_10094 ?auto_10097 ) ) ( not ( = ?auto_10095 ?auto_10097 ) ) ( not ( = ?auto_10096 ?auto_10097 ) ) ( CLEAR ?auto_10094 ) ( ON ?auto_10095 ?auto_10096 ) ( CLEAR ?auto_10095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10098 ) ( ON ?auto_10097 ?auto_10098 ) ( not ( = ?auto_10098 ?auto_10097 ) ) ( not ( = ?auto_10098 ?auto_10096 ) ) ( not ( = ?auto_10098 ?auto_10095 ) ) ( not ( = ?auto_10094 ?auto_10098 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10098 ?auto_10097 ?auto_10096 )
      ( MAKE-3PILE ?auto_10094 ?auto_10095 ?auto_10096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10099 - BLOCK
      ?auto_10100 - BLOCK
      ?auto_10101 - BLOCK
    )
    :vars
    (
      ?auto_10103 - BLOCK
      ?auto_10102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10099 ?auto_10100 ) ) ( not ( = ?auto_10099 ?auto_10101 ) ) ( not ( = ?auto_10100 ?auto_10101 ) ) ( ON ?auto_10101 ?auto_10103 ) ( not ( = ?auto_10099 ?auto_10103 ) ) ( not ( = ?auto_10100 ?auto_10103 ) ) ( not ( = ?auto_10101 ?auto_10103 ) ) ( ON ?auto_10100 ?auto_10101 ) ( CLEAR ?auto_10100 ) ( ON-TABLE ?auto_10102 ) ( ON ?auto_10103 ?auto_10102 ) ( not ( = ?auto_10102 ?auto_10103 ) ) ( not ( = ?auto_10102 ?auto_10101 ) ) ( not ( = ?auto_10102 ?auto_10100 ) ) ( not ( = ?auto_10099 ?auto_10102 ) ) ( HOLDING ?auto_10099 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10099 )
      ( MAKE-3PILE ?auto_10099 ?auto_10100 ?auto_10101 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10104 - BLOCK
      ?auto_10105 - BLOCK
      ?auto_10106 - BLOCK
    )
    :vars
    (
      ?auto_10108 - BLOCK
      ?auto_10107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10104 ?auto_10105 ) ) ( not ( = ?auto_10104 ?auto_10106 ) ) ( not ( = ?auto_10105 ?auto_10106 ) ) ( ON ?auto_10106 ?auto_10108 ) ( not ( = ?auto_10104 ?auto_10108 ) ) ( not ( = ?auto_10105 ?auto_10108 ) ) ( not ( = ?auto_10106 ?auto_10108 ) ) ( ON ?auto_10105 ?auto_10106 ) ( ON-TABLE ?auto_10107 ) ( ON ?auto_10108 ?auto_10107 ) ( not ( = ?auto_10107 ?auto_10108 ) ) ( not ( = ?auto_10107 ?auto_10106 ) ) ( not ( = ?auto_10107 ?auto_10105 ) ) ( not ( = ?auto_10104 ?auto_10107 ) ) ( ON ?auto_10104 ?auto_10105 ) ( CLEAR ?auto_10104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10107 ?auto_10108 ?auto_10106 ?auto_10105 )
      ( MAKE-3PILE ?auto_10104 ?auto_10105 ?auto_10106 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10110 - BLOCK
    )
    :vars
    (
      ?auto_10111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10111 ?auto_10110 ) ( CLEAR ?auto_10111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10110 ) ( not ( = ?auto_10110 ?auto_10111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10111 ?auto_10110 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10112 - BLOCK
    )
    :vars
    (
      ?auto_10113 - BLOCK
      ?auto_10114 - BLOCK
      ?auto_10115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10113 ?auto_10112 ) ( CLEAR ?auto_10113 ) ( ON-TABLE ?auto_10112 ) ( not ( = ?auto_10112 ?auto_10113 ) ) ( HOLDING ?auto_10114 ) ( CLEAR ?auto_10115 ) ( not ( = ?auto_10112 ?auto_10114 ) ) ( not ( = ?auto_10112 ?auto_10115 ) ) ( not ( = ?auto_10113 ?auto_10114 ) ) ( not ( = ?auto_10113 ?auto_10115 ) ) ( not ( = ?auto_10114 ?auto_10115 ) ) )
    :subtasks
    ( ( !STACK ?auto_10114 ?auto_10115 )
      ( MAKE-1PILE ?auto_10112 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10116 - BLOCK
    )
    :vars
    (
      ?auto_10119 - BLOCK
      ?auto_10118 - BLOCK
      ?auto_10117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10119 ?auto_10116 ) ( ON-TABLE ?auto_10116 ) ( not ( = ?auto_10116 ?auto_10119 ) ) ( CLEAR ?auto_10118 ) ( not ( = ?auto_10116 ?auto_10117 ) ) ( not ( = ?auto_10116 ?auto_10118 ) ) ( not ( = ?auto_10119 ?auto_10117 ) ) ( not ( = ?auto_10119 ?auto_10118 ) ) ( not ( = ?auto_10117 ?auto_10118 ) ) ( ON ?auto_10117 ?auto_10119 ) ( CLEAR ?auto_10117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10116 ?auto_10119 )
      ( MAKE-1PILE ?auto_10116 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10120 - BLOCK
    )
    :vars
    (
      ?auto_10122 - BLOCK
      ?auto_10121 - BLOCK
      ?auto_10123 - BLOCK
      ?auto_10124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10122 ?auto_10120 ) ( ON-TABLE ?auto_10120 ) ( not ( = ?auto_10120 ?auto_10122 ) ) ( not ( = ?auto_10120 ?auto_10121 ) ) ( not ( = ?auto_10120 ?auto_10123 ) ) ( not ( = ?auto_10122 ?auto_10121 ) ) ( not ( = ?auto_10122 ?auto_10123 ) ) ( not ( = ?auto_10121 ?auto_10123 ) ) ( ON ?auto_10121 ?auto_10122 ) ( CLEAR ?auto_10121 ) ( HOLDING ?auto_10123 ) ( CLEAR ?auto_10124 ) ( ON-TABLE ?auto_10124 ) ( not ( = ?auto_10124 ?auto_10123 ) ) ( not ( = ?auto_10120 ?auto_10124 ) ) ( not ( = ?auto_10122 ?auto_10124 ) ) ( not ( = ?auto_10121 ?auto_10124 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10124 ?auto_10123 )
      ( MAKE-1PILE ?auto_10120 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10125 - BLOCK
    )
    :vars
    (
      ?auto_10126 - BLOCK
      ?auto_10127 - BLOCK
      ?auto_10128 - BLOCK
      ?auto_10129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10126 ?auto_10125 ) ( ON-TABLE ?auto_10125 ) ( not ( = ?auto_10125 ?auto_10126 ) ) ( not ( = ?auto_10125 ?auto_10127 ) ) ( not ( = ?auto_10125 ?auto_10128 ) ) ( not ( = ?auto_10126 ?auto_10127 ) ) ( not ( = ?auto_10126 ?auto_10128 ) ) ( not ( = ?auto_10127 ?auto_10128 ) ) ( ON ?auto_10127 ?auto_10126 ) ( CLEAR ?auto_10129 ) ( ON-TABLE ?auto_10129 ) ( not ( = ?auto_10129 ?auto_10128 ) ) ( not ( = ?auto_10125 ?auto_10129 ) ) ( not ( = ?auto_10126 ?auto_10129 ) ) ( not ( = ?auto_10127 ?auto_10129 ) ) ( ON ?auto_10128 ?auto_10127 ) ( CLEAR ?auto_10128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10125 ?auto_10126 ?auto_10127 )
      ( MAKE-1PILE ?auto_10125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10130 - BLOCK
    )
    :vars
    (
      ?auto_10131 - BLOCK
      ?auto_10134 - BLOCK
      ?auto_10132 - BLOCK
      ?auto_10133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10131 ?auto_10130 ) ( ON-TABLE ?auto_10130 ) ( not ( = ?auto_10130 ?auto_10131 ) ) ( not ( = ?auto_10130 ?auto_10134 ) ) ( not ( = ?auto_10130 ?auto_10132 ) ) ( not ( = ?auto_10131 ?auto_10134 ) ) ( not ( = ?auto_10131 ?auto_10132 ) ) ( not ( = ?auto_10134 ?auto_10132 ) ) ( ON ?auto_10134 ?auto_10131 ) ( not ( = ?auto_10133 ?auto_10132 ) ) ( not ( = ?auto_10130 ?auto_10133 ) ) ( not ( = ?auto_10131 ?auto_10133 ) ) ( not ( = ?auto_10134 ?auto_10133 ) ) ( ON ?auto_10132 ?auto_10134 ) ( CLEAR ?auto_10132 ) ( HOLDING ?auto_10133 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10133 )
      ( MAKE-1PILE ?auto_10130 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10135 - BLOCK
    )
    :vars
    (
      ?auto_10139 - BLOCK
      ?auto_10138 - BLOCK
      ?auto_10136 - BLOCK
      ?auto_10137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10139 ?auto_10135 ) ( ON-TABLE ?auto_10135 ) ( not ( = ?auto_10135 ?auto_10139 ) ) ( not ( = ?auto_10135 ?auto_10138 ) ) ( not ( = ?auto_10135 ?auto_10136 ) ) ( not ( = ?auto_10139 ?auto_10138 ) ) ( not ( = ?auto_10139 ?auto_10136 ) ) ( not ( = ?auto_10138 ?auto_10136 ) ) ( ON ?auto_10138 ?auto_10139 ) ( not ( = ?auto_10137 ?auto_10136 ) ) ( not ( = ?auto_10135 ?auto_10137 ) ) ( not ( = ?auto_10139 ?auto_10137 ) ) ( not ( = ?auto_10138 ?auto_10137 ) ) ( ON ?auto_10136 ?auto_10138 ) ( ON ?auto_10137 ?auto_10136 ) ( CLEAR ?auto_10137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10135 ?auto_10139 ?auto_10138 ?auto_10136 )
      ( MAKE-1PILE ?auto_10135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10144 - BLOCK
      ?auto_10145 - BLOCK
      ?auto_10146 - BLOCK
      ?auto_10147 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10147 ) ( CLEAR ?auto_10146 ) ( ON-TABLE ?auto_10144 ) ( ON ?auto_10145 ?auto_10144 ) ( ON ?auto_10146 ?auto_10145 ) ( not ( = ?auto_10144 ?auto_10145 ) ) ( not ( = ?auto_10144 ?auto_10146 ) ) ( not ( = ?auto_10144 ?auto_10147 ) ) ( not ( = ?auto_10145 ?auto_10146 ) ) ( not ( = ?auto_10145 ?auto_10147 ) ) ( not ( = ?auto_10146 ?auto_10147 ) ) )
    :subtasks
    ( ( !STACK ?auto_10147 ?auto_10146 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10148 - BLOCK
      ?auto_10149 - BLOCK
      ?auto_10150 - BLOCK
      ?auto_10151 - BLOCK
    )
    :vars
    (
      ?auto_10152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10150 ) ( ON-TABLE ?auto_10148 ) ( ON ?auto_10149 ?auto_10148 ) ( ON ?auto_10150 ?auto_10149 ) ( not ( = ?auto_10148 ?auto_10149 ) ) ( not ( = ?auto_10148 ?auto_10150 ) ) ( not ( = ?auto_10148 ?auto_10151 ) ) ( not ( = ?auto_10149 ?auto_10150 ) ) ( not ( = ?auto_10149 ?auto_10151 ) ) ( not ( = ?auto_10150 ?auto_10151 ) ) ( ON ?auto_10151 ?auto_10152 ) ( CLEAR ?auto_10151 ) ( HAND-EMPTY ) ( not ( = ?auto_10148 ?auto_10152 ) ) ( not ( = ?auto_10149 ?auto_10152 ) ) ( not ( = ?auto_10150 ?auto_10152 ) ) ( not ( = ?auto_10151 ?auto_10152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10151 ?auto_10152 )
      ( MAKE-4PILE ?auto_10148 ?auto_10149 ?auto_10150 ?auto_10151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10153 - BLOCK
      ?auto_10154 - BLOCK
      ?auto_10155 - BLOCK
      ?auto_10156 - BLOCK
    )
    :vars
    (
      ?auto_10157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10153 ) ( ON ?auto_10154 ?auto_10153 ) ( not ( = ?auto_10153 ?auto_10154 ) ) ( not ( = ?auto_10153 ?auto_10155 ) ) ( not ( = ?auto_10153 ?auto_10156 ) ) ( not ( = ?auto_10154 ?auto_10155 ) ) ( not ( = ?auto_10154 ?auto_10156 ) ) ( not ( = ?auto_10155 ?auto_10156 ) ) ( ON ?auto_10156 ?auto_10157 ) ( CLEAR ?auto_10156 ) ( not ( = ?auto_10153 ?auto_10157 ) ) ( not ( = ?auto_10154 ?auto_10157 ) ) ( not ( = ?auto_10155 ?auto_10157 ) ) ( not ( = ?auto_10156 ?auto_10157 ) ) ( HOLDING ?auto_10155 ) ( CLEAR ?auto_10154 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10153 ?auto_10154 ?auto_10155 )
      ( MAKE-4PILE ?auto_10153 ?auto_10154 ?auto_10155 ?auto_10156 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10158 - BLOCK
      ?auto_10159 - BLOCK
      ?auto_10160 - BLOCK
      ?auto_10161 - BLOCK
    )
    :vars
    (
      ?auto_10162 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10158 ) ( ON ?auto_10159 ?auto_10158 ) ( not ( = ?auto_10158 ?auto_10159 ) ) ( not ( = ?auto_10158 ?auto_10160 ) ) ( not ( = ?auto_10158 ?auto_10161 ) ) ( not ( = ?auto_10159 ?auto_10160 ) ) ( not ( = ?auto_10159 ?auto_10161 ) ) ( not ( = ?auto_10160 ?auto_10161 ) ) ( ON ?auto_10161 ?auto_10162 ) ( not ( = ?auto_10158 ?auto_10162 ) ) ( not ( = ?auto_10159 ?auto_10162 ) ) ( not ( = ?auto_10160 ?auto_10162 ) ) ( not ( = ?auto_10161 ?auto_10162 ) ) ( CLEAR ?auto_10159 ) ( ON ?auto_10160 ?auto_10161 ) ( CLEAR ?auto_10160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10162 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10162 ?auto_10161 )
      ( MAKE-4PILE ?auto_10158 ?auto_10159 ?auto_10160 ?auto_10161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10163 - BLOCK
      ?auto_10164 - BLOCK
      ?auto_10165 - BLOCK
      ?auto_10166 - BLOCK
    )
    :vars
    (
      ?auto_10167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10163 ) ( not ( = ?auto_10163 ?auto_10164 ) ) ( not ( = ?auto_10163 ?auto_10165 ) ) ( not ( = ?auto_10163 ?auto_10166 ) ) ( not ( = ?auto_10164 ?auto_10165 ) ) ( not ( = ?auto_10164 ?auto_10166 ) ) ( not ( = ?auto_10165 ?auto_10166 ) ) ( ON ?auto_10166 ?auto_10167 ) ( not ( = ?auto_10163 ?auto_10167 ) ) ( not ( = ?auto_10164 ?auto_10167 ) ) ( not ( = ?auto_10165 ?auto_10167 ) ) ( not ( = ?auto_10166 ?auto_10167 ) ) ( ON ?auto_10165 ?auto_10166 ) ( CLEAR ?auto_10165 ) ( ON-TABLE ?auto_10167 ) ( HOLDING ?auto_10164 ) ( CLEAR ?auto_10163 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10163 ?auto_10164 )
      ( MAKE-4PILE ?auto_10163 ?auto_10164 ?auto_10165 ?auto_10166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10168 - BLOCK
      ?auto_10169 - BLOCK
      ?auto_10170 - BLOCK
      ?auto_10171 - BLOCK
    )
    :vars
    (
      ?auto_10172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10168 ) ( not ( = ?auto_10168 ?auto_10169 ) ) ( not ( = ?auto_10168 ?auto_10170 ) ) ( not ( = ?auto_10168 ?auto_10171 ) ) ( not ( = ?auto_10169 ?auto_10170 ) ) ( not ( = ?auto_10169 ?auto_10171 ) ) ( not ( = ?auto_10170 ?auto_10171 ) ) ( ON ?auto_10171 ?auto_10172 ) ( not ( = ?auto_10168 ?auto_10172 ) ) ( not ( = ?auto_10169 ?auto_10172 ) ) ( not ( = ?auto_10170 ?auto_10172 ) ) ( not ( = ?auto_10171 ?auto_10172 ) ) ( ON ?auto_10170 ?auto_10171 ) ( ON-TABLE ?auto_10172 ) ( CLEAR ?auto_10168 ) ( ON ?auto_10169 ?auto_10170 ) ( CLEAR ?auto_10169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10172 ?auto_10171 ?auto_10170 )
      ( MAKE-4PILE ?auto_10168 ?auto_10169 ?auto_10170 ?auto_10171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10173 - BLOCK
      ?auto_10174 - BLOCK
      ?auto_10175 - BLOCK
      ?auto_10176 - BLOCK
    )
    :vars
    (
      ?auto_10177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10173 ?auto_10174 ) ) ( not ( = ?auto_10173 ?auto_10175 ) ) ( not ( = ?auto_10173 ?auto_10176 ) ) ( not ( = ?auto_10174 ?auto_10175 ) ) ( not ( = ?auto_10174 ?auto_10176 ) ) ( not ( = ?auto_10175 ?auto_10176 ) ) ( ON ?auto_10176 ?auto_10177 ) ( not ( = ?auto_10173 ?auto_10177 ) ) ( not ( = ?auto_10174 ?auto_10177 ) ) ( not ( = ?auto_10175 ?auto_10177 ) ) ( not ( = ?auto_10176 ?auto_10177 ) ) ( ON ?auto_10175 ?auto_10176 ) ( ON-TABLE ?auto_10177 ) ( ON ?auto_10174 ?auto_10175 ) ( CLEAR ?auto_10174 ) ( HOLDING ?auto_10173 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10173 )
      ( MAKE-4PILE ?auto_10173 ?auto_10174 ?auto_10175 ?auto_10176 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10178 - BLOCK
      ?auto_10179 - BLOCK
      ?auto_10180 - BLOCK
      ?auto_10181 - BLOCK
    )
    :vars
    (
      ?auto_10182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10178 ?auto_10179 ) ) ( not ( = ?auto_10178 ?auto_10180 ) ) ( not ( = ?auto_10178 ?auto_10181 ) ) ( not ( = ?auto_10179 ?auto_10180 ) ) ( not ( = ?auto_10179 ?auto_10181 ) ) ( not ( = ?auto_10180 ?auto_10181 ) ) ( ON ?auto_10181 ?auto_10182 ) ( not ( = ?auto_10178 ?auto_10182 ) ) ( not ( = ?auto_10179 ?auto_10182 ) ) ( not ( = ?auto_10180 ?auto_10182 ) ) ( not ( = ?auto_10181 ?auto_10182 ) ) ( ON ?auto_10180 ?auto_10181 ) ( ON-TABLE ?auto_10182 ) ( ON ?auto_10179 ?auto_10180 ) ( ON ?auto_10178 ?auto_10179 ) ( CLEAR ?auto_10178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10182 ?auto_10181 ?auto_10180 ?auto_10179 )
      ( MAKE-4PILE ?auto_10178 ?auto_10179 ?auto_10180 ?auto_10181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10186 - BLOCK
      ?auto_10187 - BLOCK
      ?auto_10188 - BLOCK
    )
    :vars
    (
      ?auto_10189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10189 ?auto_10188 ) ( CLEAR ?auto_10189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10186 ) ( ON ?auto_10187 ?auto_10186 ) ( ON ?auto_10188 ?auto_10187 ) ( not ( = ?auto_10186 ?auto_10187 ) ) ( not ( = ?auto_10186 ?auto_10188 ) ) ( not ( = ?auto_10186 ?auto_10189 ) ) ( not ( = ?auto_10187 ?auto_10188 ) ) ( not ( = ?auto_10187 ?auto_10189 ) ) ( not ( = ?auto_10188 ?auto_10189 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10189 ?auto_10188 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10199 - BLOCK
      ?auto_10200 - BLOCK
      ?auto_10201 - BLOCK
    )
    :vars
    (
      ?auto_10202 - BLOCK
      ?auto_10203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10199 ) ( ON ?auto_10200 ?auto_10199 ) ( not ( = ?auto_10199 ?auto_10200 ) ) ( not ( = ?auto_10199 ?auto_10201 ) ) ( not ( = ?auto_10199 ?auto_10202 ) ) ( not ( = ?auto_10200 ?auto_10201 ) ) ( not ( = ?auto_10200 ?auto_10202 ) ) ( not ( = ?auto_10201 ?auto_10202 ) ) ( ON ?auto_10202 ?auto_10203 ) ( CLEAR ?auto_10202 ) ( not ( = ?auto_10199 ?auto_10203 ) ) ( not ( = ?auto_10200 ?auto_10203 ) ) ( not ( = ?auto_10201 ?auto_10203 ) ) ( not ( = ?auto_10202 ?auto_10203 ) ) ( HOLDING ?auto_10201 ) ( CLEAR ?auto_10200 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10199 ?auto_10200 ?auto_10201 ?auto_10202 )
      ( MAKE-3PILE ?auto_10199 ?auto_10200 ?auto_10201 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10204 - BLOCK
      ?auto_10205 - BLOCK
      ?auto_10206 - BLOCK
    )
    :vars
    (
      ?auto_10208 - BLOCK
      ?auto_10207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10204 ) ( ON ?auto_10205 ?auto_10204 ) ( not ( = ?auto_10204 ?auto_10205 ) ) ( not ( = ?auto_10204 ?auto_10206 ) ) ( not ( = ?auto_10204 ?auto_10208 ) ) ( not ( = ?auto_10205 ?auto_10206 ) ) ( not ( = ?auto_10205 ?auto_10208 ) ) ( not ( = ?auto_10206 ?auto_10208 ) ) ( ON ?auto_10208 ?auto_10207 ) ( not ( = ?auto_10204 ?auto_10207 ) ) ( not ( = ?auto_10205 ?auto_10207 ) ) ( not ( = ?auto_10206 ?auto_10207 ) ) ( not ( = ?auto_10208 ?auto_10207 ) ) ( CLEAR ?auto_10205 ) ( ON ?auto_10206 ?auto_10208 ) ( CLEAR ?auto_10206 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10207 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10207 ?auto_10208 )
      ( MAKE-3PILE ?auto_10204 ?auto_10205 ?auto_10206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10209 - BLOCK
      ?auto_10210 - BLOCK
      ?auto_10211 - BLOCK
    )
    :vars
    (
      ?auto_10213 - BLOCK
      ?auto_10212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10209 ) ( not ( = ?auto_10209 ?auto_10210 ) ) ( not ( = ?auto_10209 ?auto_10211 ) ) ( not ( = ?auto_10209 ?auto_10213 ) ) ( not ( = ?auto_10210 ?auto_10211 ) ) ( not ( = ?auto_10210 ?auto_10213 ) ) ( not ( = ?auto_10211 ?auto_10213 ) ) ( ON ?auto_10213 ?auto_10212 ) ( not ( = ?auto_10209 ?auto_10212 ) ) ( not ( = ?auto_10210 ?auto_10212 ) ) ( not ( = ?auto_10211 ?auto_10212 ) ) ( not ( = ?auto_10213 ?auto_10212 ) ) ( ON ?auto_10211 ?auto_10213 ) ( CLEAR ?auto_10211 ) ( ON-TABLE ?auto_10212 ) ( HOLDING ?auto_10210 ) ( CLEAR ?auto_10209 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10209 ?auto_10210 )
      ( MAKE-3PILE ?auto_10209 ?auto_10210 ?auto_10211 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10214 - BLOCK
      ?auto_10215 - BLOCK
      ?auto_10216 - BLOCK
    )
    :vars
    (
      ?auto_10217 - BLOCK
      ?auto_10218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10214 ) ( not ( = ?auto_10214 ?auto_10215 ) ) ( not ( = ?auto_10214 ?auto_10216 ) ) ( not ( = ?auto_10214 ?auto_10217 ) ) ( not ( = ?auto_10215 ?auto_10216 ) ) ( not ( = ?auto_10215 ?auto_10217 ) ) ( not ( = ?auto_10216 ?auto_10217 ) ) ( ON ?auto_10217 ?auto_10218 ) ( not ( = ?auto_10214 ?auto_10218 ) ) ( not ( = ?auto_10215 ?auto_10218 ) ) ( not ( = ?auto_10216 ?auto_10218 ) ) ( not ( = ?auto_10217 ?auto_10218 ) ) ( ON ?auto_10216 ?auto_10217 ) ( ON-TABLE ?auto_10218 ) ( CLEAR ?auto_10214 ) ( ON ?auto_10215 ?auto_10216 ) ( CLEAR ?auto_10215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10218 ?auto_10217 ?auto_10216 )
      ( MAKE-3PILE ?auto_10214 ?auto_10215 ?auto_10216 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10219 - BLOCK
      ?auto_10220 - BLOCK
      ?auto_10221 - BLOCK
    )
    :vars
    (
      ?auto_10222 - BLOCK
      ?auto_10223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10219 ?auto_10220 ) ) ( not ( = ?auto_10219 ?auto_10221 ) ) ( not ( = ?auto_10219 ?auto_10222 ) ) ( not ( = ?auto_10220 ?auto_10221 ) ) ( not ( = ?auto_10220 ?auto_10222 ) ) ( not ( = ?auto_10221 ?auto_10222 ) ) ( ON ?auto_10222 ?auto_10223 ) ( not ( = ?auto_10219 ?auto_10223 ) ) ( not ( = ?auto_10220 ?auto_10223 ) ) ( not ( = ?auto_10221 ?auto_10223 ) ) ( not ( = ?auto_10222 ?auto_10223 ) ) ( ON ?auto_10221 ?auto_10222 ) ( ON-TABLE ?auto_10223 ) ( ON ?auto_10220 ?auto_10221 ) ( CLEAR ?auto_10220 ) ( HOLDING ?auto_10219 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10219 )
      ( MAKE-3PILE ?auto_10219 ?auto_10220 ?auto_10221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10224 - BLOCK
      ?auto_10225 - BLOCK
      ?auto_10226 - BLOCK
    )
    :vars
    (
      ?auto_10227 - BLOCK
      ?auto_10228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10224 ?auto_10225 ) ) ( not ( = ?auto_10224 ?auto_10226 ) ) ( not ( = ?auto_10224 ?auto_10227 ) ) ( not ( = ?auto_10225 ?auto_10226 ) ) ( not ( = ?auto_10225 ?auto_10227 ) ) ( not ( = ?auto_10226 ?auto_10227 ) ) ( ON ?auto_10227 ?auto_10228 ) ( not ( = ?auto_10224 ?auto_10228 ) ) ( not ( = ?auto_10225 ?auto_10228 ) ) ( not ( = ?auto_10226 ?auto_10228 ) ) ( not ( = ?auto_10227 ?auto_10228 ) ) ( ON ?auto_10226 ?auto_10227 ) ( ON-TABLE ?auto_10228 ) ( ON ?auto_10225 ?auto_10226 ) ( ON ?auto_10224 ?auto_10225 ) ( CLEAR ?auto_10224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10228 ?auto_10227 ?auto_10226 ?auto_10225 )
      ( MAKE-3PILE ?auto_10224 ?auto_10225 ?auto_10226 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10230 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10230 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10230 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10231 - BLOCK
    )
    :vars
    (
      ?auto_10232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10231 ?auto_10232 ) ( CLEAR ?auto_10231 ) ( HAND-EMPTY ) ( not ( = ?auto_10231 ?auto_10232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10231 ?auto_10232 )
      ( MAKE-1PILE ?auto_10231 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10233 - BLOCK
    )
    :vars
    (
      ?auto_10234 - BLOCK
      ?auto_10236 - BLOCK
      ?auto_10235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10233 ?auto_10234 ) ) ( HOLDING ?auto_10233 ) ( CLEAR ?auto_10234 ) ( ON-TABLE ?auto_10236 ) ( ON ?auto_10235 ?auto_10236 ) ( ON ?auto_10234 ?auto_10235 ) ( not ( = ?auto_10236 ?auto_10235 ) ) ( not ( = ?auto_10236 ?auto_10234 ) ) ( not ( = ?auto_10236 ?auto_10233 ) ) ( not ( = ?auto_10235 ?auto_10234 ) ) ( not ( = ?auto_10235 ?auto_10233 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10236 ?auto_10235 ?auto_10234 ?auto_10233 )
      ( MAKE-1PILE ?auto_10233 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10237 - BLOCK
    )
    :vars
    (
      ?auto_10238 - BLOCK
      ?auto_10240 - BLOCK
      ?auto_10239 - BLOCK
      ?auto_10241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10237 ?auto_10238 ) ) ( CLEAR ?auto_10238 ) ( ON-TABLE ?auto_10240 ) ( ON ?auto_10239 ?auto_10240 ) ( ON ?auto_10238 ?auto_10239 ) ( not ( = ?auto_10240 ?auto_10239 ) ) ( not ( = ?auto_10240 ?auto_10238 ) ) ( not ( = ?auto_10240 ?auto_10237 ) ) ( not ( = ?auto_10239 ?auto_10238 ) ) ( not ( = ?auto_10239 ?auto_10237 ) ) ( ON ?auto_10237 ?auto_10241 ) ( CLEAR ?auto_10237 ) ( HAND-EMPTY ) ( not ( = ?auto_10237 ?auto_10241 ) ) ( not ( = ?auto_10238 ?auto_10241 ) ) ( not ( = ?auto_10240 ?auto_10241 ) ) ( not ( = ?auto_10239 ?auto_10241 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10237 ?auto_10241 )
      ( MAKE-1PILE ?auto_10237 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10242 - BLOCK
    )
    :vars
    (
      ?auto_10245 - BLOCK
      ?auto_10243 - BLOCK
      ?auto_10244 - BLOCK
      ?auto_10246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10242 ?auto_10245 ) ) ( ON-TABLE ?auto_10243 ) ( ON ?auto_10244 ?auto_10243 ) ( not ( = ?auto_10243 ?auto_10244 ) ) ( not ( = ?auto_10243 ?auto_10245 ) ) ( not ( = ?auto_10243 ?auto_10242 ) ) ( not ( = ?auto_10244 ?auto_10245 ) ) ( not ( = ?auto_10244 ?auto_10242 ) ) ( ON ?auto_10242 ?auto_10246 ) ( CLEAR ?auto_10242 ) ( not ( = ?auto_10242 ?auto_10246 ) ) ( not ( = ?auto_10245 ?auto_10246 ) ) ( not ( = ?auto_10243 ?auto_10246 ) ) ( not ( = ?auto_10244 ?auto_10246 ) ) ( HOLDING ?auto_10245 ) ( CLEAR ?auto_10244 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10243 ?auto_10244 ?auto_10245 )
      ( MAKE-1PILE ?auto_10242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10247 - BLOCK
    )
    :vars
    (
      ?auto_10251 - BLOCK
      ?auto_10248 - BLOCK
      ?auto_10249 - BLOCK
      ?auto_10250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10247 ?auto_10251 ) ) ( ON-TABLE ?auto_10248 ) ( ON ?auto_10249 ?auto_10248 ) ( not ( = ?auto_10248 ?auto_10249 ) ) ( not ( = ?auto_10248 ?auto_10251 ) ) ( not ( = ?auto_10248 ?auto_10247 ) ) ( not ( = ?auto_10249 ?auto_10251 ) ) ( not ( = ?auto_10249 ?auto_10247 ) ) ( ON ?auto_10247 ?auto_10250 ) ( not ( = ?auto_10247 ?auto_10250 ) ) ( not ( = ?auto_10251 ?auto_10250 ) ) ( not ( = ?auto_10248 ?auto_10250 ) ) ( not ( = ?auto_10249 ?auto_10250 ) ) ( CLEAR ?auto_10249 ) ( ON ?auto_10251 ?auto_10247 ) ( CLEAR ?auto_10251 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10250 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10250 ?auto_10247 )
      ( MAKE-1PILE ?auto_10247 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10252 - BLOCK
    )
    :vars
    (
      ?auto_10256 - BLOCK
      ?auto_10255 - BLOCK
      ?auto_10254 - BLOCK
      ?auto_10253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10252 ?auto_10256 ) ) ( ON-TABLE ?auto_10255 ) ( not ( = ?auto_10255 ?auto_10254 ) ) ( not ( = ?auto_10255 ?auto_10256 ) ) ( not ( = ?auto_10255 ?auto_10252 ) ) ( not ( = ?auto_10254 ?auto_10256 ) ) ( not ( = ?auto_10254 ?auto_10252 ) ) ( ON ?auto_10252 ?auto_10253 ) ( not ( = ?auto_10252 ?auto_10253 ) ) ( not ( = ?auto_10256 ?auto_10253 ) ) ( not ( = ?auto_10255 ?auto_10253 ) ) ( not ( = ?auto_10254 ?auto_10253 ) ) ( ON ?auto_10256 ?auto_10252 ) ( CLEAR ?auto_10256 ) ( ON-TABLE ?auto_10253 ) ( HOLDING ?auto_10254 ) ( CLEAR ?auto_10255 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10255 ?auto_10254 )
      ( MAKE-1PILE ?auto_10252 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10257 - BLOCK
    )
    :vars
    (
      ?auto_10260 - BLOCK
      ?auto_10261 - BLOCK
      ?auto_10258 - BLOCK
      ?auto_10259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10257 ?auto_10260 ) ) ( ON-TABLE ?auto_10261 ) ( not ( = ?auto_10261 ?auto_10258 ) ) ( not ( = ?auto_10261 ?auto_10260 ) ) ( not ( = ?auto_10261 ?auto_10257 ) ) ( not ( = ?auto_10258 ?auto_10260 ) ) ( not ( = ?auto_10258 ?auto_10257 ) ) ( ON ?auto_10257 ?auto_10259 ) ( not ( = ?auto_10257 ?auto_10259 ) ) ( not ( = ?auto_10260 ?auto_10259 ) ) ( not ( = ?auto_10261 ?auto_10259 ) ) ( not ( = ?auto_10258 ?auto_10259 ) ) ( ON ?auto_10260 ?auto_10257 ) ( ON-TABLE ?auto_10259 ) ( CLEAR ?auto_10261 ) ( ON ?auto_10258 ?auto_10260 ) ( CLEAR ?auto_10258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10259 ?auto_10257 ?auto_10260 )
      ( MAKE-1PILE ?auto_10257 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10262 - BLOCK
    )
    :vars
    (
      ?auto_10264 - BLOCK
      ?auto_10263 - BLOCK
      ?auto_10266 - BLOCK
      ?auto_10265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10262 ?auto_10264 ) ) ( not ( = ?auto_10263 ?auto_10266 ) ) ( not ( = ?auto_10263 ?auto_10264 ) ) ( not ( = ?auto_10263 ?auto_10262 ) ) ( not ( = ?auto_10266 ?auto_10264 ) ) ( not ( = ?auto_10266 ?auto_10262 ) ) ( ON ?auto_10262 ?auto_10265 ) ( not ( = ?auto_10262 ?auto_10265 ) ) ( not ( = ?auto_10264 ?auto_10265 ) ) ( not ( = ?auto_10263 ?auto_10265 ) ) ( not ( = ?auto_10266 ?auto_10265 ) ) ( ON ?auto_10264 ?auto_10262 ) ( ON-TABLE ?auto_10265 ) ( ON ?auto_10266 ?auto_10264 ) ( CLEAR ?auto_10266 ) ( HOLDING ?auto_10263 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10263 )
      ( MAKE-1PILE ?auto_10262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10267 - BLOCK
    )
    :vars
    (
      ?auto_10270 - BLOCK
      ?auto_10269 - BLOCK
      ?auto_10268 - BLOCK
      ?auto_10271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10267 ?auto_10270 ) ) ( not ( = ?auto_10269 ?auto_10268 ) ) ( not ( = ?auto_10269 ?auto_10270 ) ) ( not ( = ?auto_10269 ?auto_10267 ) ) ( not ( = ?auto_10268 ?auto_10270 ) ) ( not ( = ?auto_10268 ?auto_10267 ) ) ( ON ?auto_10267 ?auto_10271 ) ( not ( = ?auto_10267 ?auto_10271 ) ) ( not ( = ?auto_10270 ?auto_10271 ) ) ( not ( = ?auto_10269 ?auto_10271 ) ) ( not ( = ?auto_10268 ?auto_10271 ) ) ( ON ?auto_10270 ?auto_10267 ) ( ON-TABLE ?auto_10271 ) ( ON ?auto_10268 ?auto_10270 ) ( ON ?auto_10269 ?auto_10268 ) ( CLEAR ?auto_10269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10271 ?auto_10267 ?auto_10270 ?auto_10268 )
      ( MAKE-1PILE ?auto_10267 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10274 - BLOCK
      ?auto_10275 - BLOCK
    )
    :vars
    (
      ?auto_10276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10276 ?auto_10275 ) ( CLEAR ?auto_10276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10274 ) ( ON ?auto_10275 ?auto_10274 ) ( not ( = ?auto_10274 ?auto_10275 ) ) ( not ( = ?auto_10274 ?auto_10276 ) ) ( not ( = ?auto_10275 ?auto_10276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10276 ?auto_10275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10277 - BLOCK
      ?auto_10278 - BLOCK
    )
    :vars
    (
      ?auto_10279 - BLOCK
      ?auto_10280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10279 ?auto_10278 ) ( CLEAR ?auto_10279 ) ( ON-TABLE ?auto_10277 ) ( ON ?auto_10278 ?auto_10277 ) ( not ( = ?auto_10277 ?auto_10278 ) ) ( not ( = ?auto_10277 ?auto_10279 ) ) ( not ( = ?auto_10278 ?auto_10279 ) ) ( HOLDING ?auto_10280 ) ( not ( = ?auto_10277 ?auto_10280 ) ) ( not ( = ?auto_10278 ?auto_10280 ) ) ( not ( = ?auto_10279 ?auto_10280 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10280 )
      ( MAKE-2PILE ?auto_10277 ?auto_10278 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10281 - BLOCK
      ?auto_10282 - BLOCK
    )
    :vars
    (
      ?auto_10284 - BLOCK
      ?auto_10283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10284 ?auto_10282 ) ( ON-TABLE ?auto_10281 ) ( ON ?auto_10282 ?auto_10281 ) ( not ( = ?auto_10281 ?auto_10282 ) ) ( not ( = ?auto_10281 ?auto_10284 ) ) ( not ( = ?auto_10282 ?auto_10284 ) ) ( not ( = ?auto_10281 ?auto_10283 ) ) ( not ( = ?auto_10282 ?auto_10283 ) ) ( not ( = ?auto_10284 ?auto_10283 ) ) ( ON ?auto_10283 ?auto_10284 ) ( CLEAR ?auto_10283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10281 ?auto_10282 ?auto_10284 )
      ( MAKE-2PILE ?auto_10281 ?auto_10282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10285 - BLOCK
      ?auto_10286 - BLOCK
    )
    :vars
    (
      ?auto_10288 - BLOCK
      ?auto_10287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10288 ?auto_10286 ) ( ON-TABLE ?auto_10285 ) ( ON ?auto_10286 ?auto_10285 ) ( not ( = ?auto_10285 ?auto_10286 ) ) ( not ( = ?auto_10285 ?auto_10288 ) ) ( not ( = ?auto_10286 ?auto_10288 ) ) ( not ( = ?auto_10285 ?auto_10287 ) ) ( not ( = ?auto_10286 ?auto_10287 ) ) ( not ( = ?auto_10288 ?auto_10287 ) ) ( HOLDING ?auto_10287 ) ( CLEAR ?auto_10288 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10285 ?auto_10286 ?auto_10288 ?auto_10287 )
      ( MAKE-2PILE ?auto_10285 ?auto_10286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10289 - BLOCK
      ?auto_10290 - BLOCK
    )
    :vars
    (
      ?auto_10292 - BLOCK
      ?auto_10291 - BLOCK
      ?auto_10293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10292 ?auto_10290 ) ( ON-TABLE ?auto_10289 ) ( ON ?auto_10290 ?auto_10289 ) ( not ( = ?auto_10289 ?auto_10290 ) ) ( not ( = ?auto_10289 ?auto_10292 ) ) ( not ( = ?auto_10290 ?auto_10292 ) ) ( not ( = ?auto_10289 ?auto_10291 ) ) ( not ( = ?auto_10290 ?auto_10291 ) ) ( not ( = ?auto_10292 ?auto_10291 ) ) ( CLEAR ?auto_10292 ) ( ON ?auto_10291 ?auto_10293 ) ( CLEAR ?auto_10291 ) ( HAND-EMPTY ) ( not ( = ?auto_10289 ?auto_10293 ) ) ( not ( = ?auto_10290 ?auto_10293 ) ) ( not ( = ?auto_10292 ?auto_10293 ) ) ( not ( = ?auto_10291 ?auto_10293 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10291 ?auto_10293 )
      ( MAKE-2PILE ?auto_10289 ?auto_10290 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10304 - BLOCK
      ?auto_10305 - BLOCK
    )
    :vars
    (
      ?auto_10306 - BLOCK
      ?auto_10308 - BLOCK
      ?auto_10307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10304 ) ( not ( = ?auto_10304 ?auto_10305 ) ) ( not ( = ?auto_10304 ?auto_10306 ) ) ( not ( = ?auto_10305 ?auto_10306 ) ) ( not ( = ?auto_10304 ?auto_10308 ) ) ( not ( = ?auto_10305 ?auto_10308 ) ) ( not ( = ?auto_10306 ?auto_10308 ) ) ( ON ?auto_10308 ?auto_10307 ) ( not ( = ?auto_10304 ?auto_10307 ) ) ( not ( = ?auto_10305 ?auto_10307 ) ) ( not ( = ?auto_10306 ?auto_10307 ) ) ( not ( = ?auto_10308 ?auto_10307 ) ) ( ON ?auto_10306 ?auto_10308 ) ( CLEAR ?auto_10306 ) ( HOLDING ?auto_10305 ) ( CLEAR ?auto_10304 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10304 ?auto_10305 ?auto_10306 )
      ( MAKE-2PILE ?auto_10304 ?auto_10305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10309 - BLOCK
      ?auto_10310 - BLOCK
    )
    :vars
    (
      ?auto_10312 - BLOCK
      ?auto_10313 - BLOCK
      ?auto_10311 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10309 ) ( not ( = ?auto_10309 ?auto_10310 ) ) ( not ( = ?auto_10309 ?auto_10312 ) ) ( not ( = ?auto_10310 ?auto_10312 ) ) ( not ( = ?auto_10309 ?auto_10313 ) ) ( not ( = ?auto_10310 ?auto_10313 ) ) ( not ( = ?auto_10312 ?auto_10313 ) ) ( ON ?auto_10313 ?auto_10311 ) ( not ( = ?auto_10309 ?auto_10311 ) ) ( not ( = ?auto_10310 ?auto_10311 ) ) ( not ( = ?auto_10312 ?auto_10311 ) ) ( not ( = ?auto_10313 ?auto_10311 ) ) ( ON ?auto_10312 ?auto_10313 ) ( CLEAR ?auto_10309 ) ( ON ?auto_10310 ?auto_10312 ) ( CLEAR ?auto_10310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10311 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10311 ?auto_10313 ?auto_10312 )
      ( MAKE-2PILE ?auto_10309 ?auto_10310 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10314 - BLOCK
      ?auto_10315 - BLOCK
    )
    :vars
    (
      ?auto_10317 - BLOCK
      ?auto_10316 - BLOCK
      ?auto_10318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10314 ?auto_10315 ) ) ( not ( = ?auto_10314 ?auto_10317 ) ) ( not ( = ?auto_10315 ?auto_10317 ) ) ( not ( = ?auto_10314 ?auto_10316 ) ) ( not ( = ?auto_10315 ?auto_10316 ) ) ( not ( = ?auto_10317 ?auto_10316 ) ) ( ON ?auto_10316 ?auto_10318 ) ( not ( = ?auto_10314 ?auto_10318 ) ) ( not ( = ?auto_10315 ?auto_10318 ) ) ( not ( = ?auto_10317 ?auto_10318 ) ) ( not ( = ?auto_10316 ?auto_10318 ) ) ( ON ?auto_10317 ?auto_10316 ) ( ON ?auto_10315 ?auto_10317 ) ( CLEAR ?auto_10315 ) ( ON-TABLE ?auto_10318 ) ( HOLDING ?auto_10314 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10314 )
      ( MAKE-2PILE ?auto_10314 ?auto_10315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10319 - BLOCK
      ?auto_10320 - BLOCK
    )
    :vars
    (
      ?auto_10322 - BLOCK
      ?auto_10323 - BLOCK
      ?auto_10321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10319 ?auto_10320 ) ) ( not ( = ?auto_10319 ?auto_10322 ) ) ( not ( = ?auto_10320 ?auto_10322 ) ) ( not ( = ?auto_10319 ?auto_10323 ) ) ( not ( = ?auto_10320 ?auto_10323 ) ) ( not ( = ?auto_10322 ?auto_10323 ) ) ( ON ?auto_10323 ?auto_10321 ) ( not ( = ?auto_10319 ?auto_10321 ) ) ( not ( = ?auto_10320 ?auto_10321 ) ) ( not ( = ?auto_10322 ?auto_10321 ) ) ( not ( = ?auto_10323 ?auto_10321 ) ) ( ON ?auto_10322 ?auto_10323 ) ( ON ?auto_10320 ?auto_10322 ) ( ON-TABLE ?auto_10321 ) ( ON ?auto_10319 ?auto_10320 ) ( CLEAR ?auto_10319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10321 ?auto_10323 ?auto_10322 ?auto_10320 )
      ( MAKE-2PILE ?auto_10319 ?auto_10320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10326 - BLOCK
      ?auto_10327 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10327 ) ( CLEAR ?auto_10326 ) ( ON-TABLE ?auto_10326 ) ( not ( = ?auto_10326 ?auto_10327 ) ) )
    :subtasks
    ( ( !STACK ?auto_10327 ?auto_10326 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10328 - BLOCK
      ?auto_10329 - BLOCK
    )
    :vars
    (
      ?auto_10330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10328 ) ( ON-TABLE ?auto_10328 ) ( not ( = ?auto_10328 ?auto_10329 ) ) ( ON ?auto_10329 ?auto_10330 ) ( CLEAR ?auto_10329 ) ( HAND-EMPTY ) ( not ( = ?auto_10328 ?auto_10330 ) ) ( not ( = ?auto_10329 ?auto_10330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10329 ?auto_10330 )
      ( MAKE-2PILE ?auto_10328 ?auto_10329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10331 - BLOCK
      ?auto_10332 - BLOCK
    )
    :vars
    (
      ?auto_10333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10331 ?auto_10332 ) ) ( ON ?auto_10332 ?auto_10333 ) ( CLEAR ?auto_10332 ) ( not ( = ?auto_10331 ?auto_10333 ) ) ( not ( = ?auto_10332 ?auto_10333 ) ) ( HOLDING ?auto_10331 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10331 )
      ( MAKE-2PILE ?auto_10331 ?auto_10332 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10334 - BLOCK
      ?auto_10335 - BLOCK
    )
    :vars
    (
      ?auto_10336 - BLOCK
      ?auto_10337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10334 ?auto_10335 ) ) ( ON ?auto_10335 ?auto_10336 ) ( not ( = ?auto_10334 ?auto_10336 ) ) ( not ( = ?auto_10335 ?auto_10336 ) ) ( ON ?auto_10334 ?auto_10335 ) ( CLEAR ?auto_10334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10337 ) ( ON ?auto_10336 ?auto_10337 ) ( not ( = ?auto_10337 ?auto_10336 ) ) ( not ( = ?auto_10337 ?auto_10335 ) ) ( not ( = ?auto_10337 ?auto_10334 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10337 ?auto_10336 ?auto_10335 )
      ( MAKE-2PILE ?auto_10334 ?auto_10335 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10338 - BLOCK
      ?auto_10339 - BLOCK
    )
    :vars
    (
      ?auto_10340 - BLOCK
      ?auto_10341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10338 ?auto_10339 ) ) ( ON ?auto_10339 ?auto_10340 ) ( not ( = ?auto_10338 ?auto_10340 ) ) ( not ( = ?auto_10339 ?auto_10340 ) ) ( ON-TABLE ?auto_10341 ) ( ON ?auto_10340 ?auto_10341 ) ( not ( = ?auto_10341 ?auto_10340 ) ) ( not ( = ?auto_10341 ?auto_10339 ) ) ( not ( = ?auto_10341 ?auto_10338 ) ) ( HOLDING ?auto_10338 ) ( CLEAR ?auto_10339 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10341 ?auto_10340 ?auto_10339 ?auto_10338 )
      ( MAKE-2PILE ?auto_10338 ?auto_10339 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10342 - BLOCK
      ?auto_10343 - BLOCK
    )
    :vars
    (
      ?auto_10344 - BLOCK
      ?auto_10345 - BLOCK
      ?auto_10346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10342 ?auto_10343 ) ) ( ON ?auto_10343 ?auto_10344 ) ( not ( = ?auto_10342 ?auto_10344 ) ) ( not ( = ?auto_10343 ?auto_10344 ) ) ( ON-TABLE ?auto_10345 ) ( ON ?auto_10344 ?auto_10345 ) ( not ( = ?auto_10345 ?auto_10344 ) ) ( not ( = ?auto_10345 ?auto_10343 ) ) ( not ( = ?auto_10345 ?auto_10342 ) ) ( CLEAR ?auto_10343 ) ( ON ?auto_10342 ?auto_10346 ) ( CLEAR ?auto_10342 ) ( HAND-EMPTY ) ( not ( = ?auto_10342 ?auto_10346 ) ) ( not ( = ?auto_10343 ?auto_10346 ) ) ( not ( = ?auto_10344 ?auto_10346 ) ) ( not ( = ?auto_10345 ?auto_10346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10342 ?auto_10346 )
      ( MAKE-2PILE ?auto_10342 ?auto_10343 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10347 - BLOCK
      ?auto_10348 - BLOCK
    )
    :vars
    (
      ?auto_10351 - BLOCK
      ?auto_10350 - BLOCK
      ?auto_10349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10347 ?auto_10348 ) ) ( not ( = ?auto_10347 ?auto_10351 ) ) ( not ( = ?auto_10348 ?auto_10351 ) ) ( ON-TABLE ?auto_10350 ) ( ON ?auto_10351 ?auto_10350 ) ( not ( = ?auto_10350 ?auto_10351 ) ) ( not ( = ?auto_10350 ?auto_10348 ) ) ( not ( = ?auto_10350 ?auto_10347 ) ) ( ON ?auto_10347 ?auto_10349 ) ( CLEAR ?auto_10347 ) ( not ( = ?auto_10347 ?auto_10349 ) ) ( not ( = ?auto_10348 ?auto_10349 ) ) ( not ( = ?auto_10351 ?auto_10349 ) ) ( not ( = ?auto_10350 ?auto_10349 ) ) ( HOLDING ?auto_10348 ) ( CLEAR ?auto_10351 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10350 ?auto_10351 ?auto_10348 )
      ( MAKE-2PILE ?auto_10347 ?auto_10348 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10352 - BLOCK
      ?auto_10353 - BLOCK
    )
    :vars
    (
      ?auto_10356 - BLOCK
      ?auto_10355 - BLOCK
      ?auto_10354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10352 ?auto_10353 ) ) ( not ( = ?auto_10352 ?auto_10356 ) ) ( not ( = ?auto_10353 ?auto_10356 ) ) ( ON-TABLE ?auto_10355 ) ( ON ?auto_10356 ?auto_10355 ) ( not ( = ?auto_10355 ?auto_10356 ) ) ( not ( = ?auto_10355 ?auto_10353 ) ) ( not ( = ?auto_10355 ?auto_10352 ) ) ( ON ?auto_10352 ?auto_10354 ) ( not ( = ?auto_10352 ?auto_10354 ) ) ( not ( = ?auto_10353 ?auto_10354 ) ) ( not ( = ?auto_10356 ?auto_10354 ) ) ( not ( = ?auto_10355 ?auto_10354 ) ) ( CLEAR ?auto_10356 ) ( ON ?auto_10353 ?auto_10352 ) ( CLEAR ?auto_10353 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10354 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10354 ?auto_10352 )
      ( MAKE-2PILE ?auto_10352 ?auto_10353 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10357 - BLOCK
      ?auto_10358 - BLOCK
    )
    :vars
    (
      ?auto_10359 - BLOCK
      ?auto_10360 - BLOCK
      ?auto_10361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10357 ?auto_10358 ) ) ( not ( = ?auto_10357 ?auto_10359 ) ) ( not ( = ?auto_10358 ?auto_10359 ) ) ( ON-TABLE ?auto_10360 ) ( not ( = ?auto_10360 ?auto_10359 ) ) ( not ( = ?auto_10360 ?auto_10358 ) ) ( not ( = ?auto_10360 ?auto_10357 ) ) ( ON ?auto_10357 ?auto_10361 ) ( not ( = ?auto_10357 ?auto_10361 ) ) ( not ( = ?auto_10358 ?auto_10361 ) ) ( not ( = ?auto_10359 ?auto_10361 ) ) ( not ( = ?auto_10360 ?auto_10361 ) ) ( ON ?auto_10358 ?auto_10357 ) ( CLEAR ?auto_10358 ) ( ON-TABLE ?auto_10361 ) ( HOLDING ?auto_10359 ) ( CLEAR ?auto_10360 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10360 ?auto_10359 )
      ( MAKE-2PILE ?auto_10357 ?auto_10358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10362 - BLOCK
      ?auto_10363 - BLOCK
    )
    :vars
    (
      ?auto_10365 - BLOCK
      ?auto_10364 - BLOCK
      ?auto_10366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10362 ?auto_10363 ) ) ( not ( = ?auto_10362 ?auto_10365 ) ) ( not ( = ?auto_10363 ?auto_10365 ) ) ( ON-TABLE ?auto_10364 ) ( not ( = ?auto_10364 ?auto_10365 ) ) ( not ( = ?auto_10364 ?auto_10363 ) ) ( not ( = ?auto_10364 ?auto_10362 ) ) ( ON ?auto_10362 ?auto_10366 ) ( not ( = ?auto_10362 ?auto_10366 ) ) ( not ( = ?auto_10363 ?auto_10366 ) ) ( not ( = ?auto_10365 ?auto_10366 ) ) ( not ( = ?auto_10364 ?auto_10366 ) ) ( ON ?auto_10363 ?auto_10362 ) ( ON-TABLE ?auto_10366 ) ( CLEAR ?auto_10364 ) ( ON ?auto_10365 ?auto_10363 ) ( CLEAR ?auto_10365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10366 ?auto_10362 ?auto_10363 )
      ( MAKE-2PILE ?auto_10362 ?auto_10363 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10367 - BLOCK
      ?auto_10368 - BLOCK
    )
    :vars
    (
      ?auto_10371 - BLOCK
      ?auto_10369 - BLOCK
      ?auto_10370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10367 ?auto_10368 ) ) ( not ( = ?auto_10367 ?auto_10371 ) ) ( not ( = ?auto_10368 ?auto_10371 ) ) ( not ( = ?auto_10369 ?auto_10371 ) ) ( not ( = ?auto_10369 ?auto_10368 ) ) ( not ( = ?auto_10369 ?auto_10367 ) ) ( ON ?auto_10367 ?auto_10370 ) ( not ( = ?auto_10367 ?auto_10370 ) ) ( not ( = ?auto_10368 ?auto_10370 ) ) ( not ( = ?auto_10371 ?auto_10370 ) ) ( not ( = ?auto_10369 ?auto_10370 ) ) ( ON ?auto_10368 ?auto_10367 ) ( ON-TABLE ?auto_10370 ) ( ON ?auto_10371 ?auto_10368 ) ( CLEAR ?auto_10371 ) ( HOLDING ?auto_10369 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10369 )
      ( MAKE-2PILE ?auto_10367 ?auto_10368 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10372 - BLOCK
      ?auto_10373 - BLOCK
    )
    :vars
    (
      ?auto_10374 - BLOCK
      ?auto_10376 - BLOCK
      ?auto_10375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10372 ?auto_10373 ) ) ( not ( = ?auto_10372 ?auto_10374 ) ) ( not ( = ?auto_10373 ?auto_10374 ) ) ( not ( = ?auto_10376 ?auto_10374 ) ) ( not ( = ?auto_10376 ?auto_10373 ) ) ( not ( = ?auto_10376 ?auto_10372 ) ) ( ON ?auto_10372 ?auto_10375 ) ( not ( = ?auto_10372 ?auto_10375 ) ) ( not ( = ?auto_10373 ?auto_10375 ) ) ( not ( = ?auto_10374 ?auto_10375 ) ) ( not ( = ?auto_10376 ?auto_10375 ) ) ( ON ?auto_10373 ?auto_10372 ) ( ON-TABLE ?auto_10375 ) ( ON ?auto_10374 ?auto_10373 ) ( ON ?auto_10376 ?auto_10374 ) ( CLEAR ?auto_10376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10375 ?auto_10372 ?auto_10373 ?auto_10374 )
      ( MAKE-2PILE ?auto_10372 ?auto_10373 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10378 - BLOCK
    )
    :vars
    (
      ?auto_10379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10379 ?auto_10378 ) ( CLEAR ?auto_10379 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10378 ) ( not ( = ?auto_10378 ?auto_10379 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10379 ?auto_10378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10380 - BLOCK
    )
    :vars
    (
      ?auto_10381 - BLOCK
      ?auto_10382 - BLOCK
      ?auto_10383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10381 ?auto_10380 ) ( CLEAR ?auto_10381 ) ( ON-TABLE ?auto_10380 ) ( not ( = ?auto_10380 ?auto_10381 ) ) ( HOLDING ?auto_10382 ) ( CLEAR ?auto_10383 ) ( not ( = ?auto_10380 ?auto_10382 ) ) ( not ( = ?auto_10380 ?auto_10383 ) ) ( not ( = ?auto_10381 ?auto_10382 ) ) ( not ( = ?auto_10381 ?auto_10383 ) ) ( not ( = ?auto_10382 ?auto_10383 ) ) )
    :subtasks
    ( ( !STACK ?auto_10382 ?auto_10383 )
      ( MAKE-1PILE ?auto_10380 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10384 - BLOCK
    )
    :vars
    (
      ?auto_10387 - BLOCK
      ?auto_10385 - BLOCK
      ?auto_10386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10387 ?auto_10384 ) ( ON-TABLE ?auto_10384 ) ( not ( = ?auto_10384 ?auto_10387 ) ) ( CLEAR ?auto_10385 ) ( not ( = ?auto_10384 ?auto_10386 ) ) ( not ( = ?auto_10384 ?auto_10385 ) ) ( not ( = ?auto_10387 ?auto_10386 ) ) ( not ( = ?auto_10387 ?auto_10385 ) ) ( not ( = ?auto_10386 ?auto_10385 ) ) ( ON ?auto_10386 ?auto_10387 ) ( CLEAR ?auto_10386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10384 ?auto_10387 )
      ( MAKE-1PILE ?auto_10384 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10388 - BLOCK
    )
    :vars
    (
      ?auto_10389 - BLOCK
      ?auto_10391 - BLOCK
      ?auto_10390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10389 ?auto_10388 ) ( ON-TABLE ?auto_10388 ) ( not ( = ?auto_10388 ?auto_10389 ) ) ( not ( = ?auto_10388 ?auto_10391 ) ) ( not ( = ?auto_10388 ?auto_10390 ) ) ( not ( = ?auto_10389 ?auto_10391 ) ) ( not ( = ?auto_10389 ?auto_10390 ) ) ( not ( = ?auto_10391 ?auto_10390 ) ) ( ON ?auto_10391 ?auto_10389 ) ( CLEAR ?auto_10391 ) ( HOLDING ?auto_10390 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10390 )
      ( MAKE-1PILE ?auto_10388 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10392 - BLOCK
    )
    :vars
    (
      ?auto_10393 - BLOCK
      ?auto_10395 - BLOCK
      ?auto_10394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10393 ?auto_10392 ) ( ON-TABLE ?auto_10392 ) ( not ( = ?auto_10392 ?auto_10393 ) ) ( not ( = ?auto_10392 ?auto_10395 ) ) ( not ( = ?auto_10392 ?auto_10394 ) ) ( not ( = ?auto_10393 ?auto_10395 ) ) ( not ( = ?auto_10393 ?auto_10394 ) ) ( not ( = ?auto_10395 ?auto_10394 ) ) ( ON ?auto_10395 ?auto_10393 ) ( ON ?auto_10394 ?auto_10395 ) ( CLEAR ?auto_10394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10392 ?auto_10393 ?auto_10395 )
      ( MAKE-1PILE ?auto_10392 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10396 - BLOCK
    )
    :vars
    (
      ?auto_10399 - BLOCK
      ?auto_10398 - BLOCK
      ?auto_10397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10399 ?auto_10396 ) ( ON-TABLE ?auto_10396 ) ( not ( = ?auto_10396 ?auto_10399 ) ) ( not ( = ?auto_10396 ?auto_10398 ) ) ( not ( = ?auto_10396 ?auto_10397 ) ) ( not ( = ?auto_10399 ?auto_10398 ) ) ( not ( = ?auto_10399 ?auto_10397 ) ) ( not ( = ?auto_10398 ?auto_10397 ) ) ( ON ?auto_10398 ?auto_10399 ) ( HOLDING ?auto_10397 ) ( CLEAR ?auto_10398 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10396 ?auto_10399 ?auto_10398 ?auto_10397 )
      ( MAKE-1PILE ?auto_10396 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10400 - BLOCK
    )
    :vars
    (
      ?auto_10401 - BLOCK
      ?auto_10403 - BLOCK
      ?auto_10402 - BLOCK
      ?auto_10404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10401 ?auto_10400 ) ( ON-TABLE ?auto_10400 ) ( not ( = ?auto_10400 ?auto_10401 ) ) ( not ( = ?auto_10400 ?auto_10403 ) ) ( not ( = ?auto_10400 ?auto_10402 ) ) ( not ( = ?auto_10401 ?auto_10403 ) ) ( not ( = ?auto_10401 ?auto_10402 ) ) ( not ( = ?auto_10403 ?auto_10402 ) ) ( ON ?auto_10403 ?auto_10401 ) ( CLEAR ?auto_10403 ) ( ON ?auto_10402 ?auto_10404 ) ( CLEAR ?auto_10402 ) ( HAND-EMPTY ) ( not ( = ?auto_10400 ?auto_10404 ) ) ( not ( = ?auto_10401 ?auto_10404 ) ) ( not ( = ?auto_10403 ?auto_10404 ) ) ( not ( = ?auto_10402 ?auto_10404 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10402 ?auto_10404 )
      ( MAKE-1PILE ?auto_10400 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10405 - BLOCK
    )
    :vars
    (
      ?auto_10406 - BLOCK
      ?auto_10407 - BLOCK
      ?auto_10409 - BLOCK
      ?auto_10408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10406 ?auto_10405 ) ( ON-TABLE ?auto_10405 ) ( not ( = ?auto_10405 ?auto_10406 ) ) ( not ( = ?auto_10405 ?auto_10407 ) ) ( not ( = ?auto_10405 ?auto_10409 ) ) ( not ( = ?auto_10406 ?auto_10407 ) ) ( not ( = ?auto_10406 ?auto_10409 ) ) ( not ( = ?auto_10407 ?auto_10409 ) ) ( ON ?auto_10409 ?auto_10408 ) ( CLEAR ?auto_10409 ) ( not ( = ?auto_10405 ?auto_10408 ) ) ( not ( = ?auto_10406 ?auto_10408 ) ) ( not ( = ?auto_10407 ?auto_10408 ) ) ( not ( = ?auto_10409 ?auto_10408 ) ) ( HOLDING ?auto_10407 ) ( CLEAR ?auto_10406 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10405 ?auto_10406 ?auto_10407 )
      ( MAKE-1PILE ?auto_10405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10410 - BLOCK
    )
    :vars
    (
      ?auto_10414 - BLOCK
      ?auto_10411 - BLOCK
      ?auto_10413 - BLOCK
      ?auto_10412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10414 ?auto_10410 ) ( ON-TABLE ?auto_10410 ) ( not ( = ?auto_10410 ?auto_10414 ) ) ( not ( = ?auto_10410 ?auto_10411 ) ) ( not ( = ?auto_10410 ?auto_10413 ) ) ( not ( = ?auto_10414 ?auto_10411 ) ) ( not ( = ?auto_10414 ?auto_10413 ) ) ( not ( = ?auto_10411 ?auto_10413 ) ) ( ON ?auto_10413 ?auto_10412 ) ( not ( = ?auto_10410 ?auto_10412 ) ) ( not ( = ?auto_10414 ?auto_10412 ) ) ( not ( = ?auto_10411 ?auto_10412 ) ) ( not ( = ?auto_10413 ?auto_10412 ) ) ( CLEAR ?auto_10414 ) ( ON ?auto_10411 ?auto_10413 ) ( CLEAR ?auto_10411 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10412 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10412 ?auto_10413 )
      ( MAKE-1PILE ?auto_10410 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10425 - BLOCK
    )
    :vars
    (
      ?auto_10429 - BLOCK
      ?auto_10428 - BLOCK
      ?auto_10427 - BLOCK
      ?auto_10426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10425 ?auto_10429 ) ) ( not ( = ?auto_10425 ?auto_10428 ) ) ( not ( = ?auto_10425 ?auto_10427 ) ) ( not ( = ?auto_10429 ?auto_10428 ) ) ( not ( = ?auto_10429 ?auto_10427 ) ) ( not ( = ?auto_10428 ?auto_10427 ) ) ( ON ?auto_10427 ?auto_10426 ) ( not ( = ?auto_10425 ?auto_10426 ) ) ( not ( = ?auto_10429 ?auto_10426 ) ) ( not ( = ?auto_10428 ?auto_10426 ) ) ( not ( = ?auto_10427 ?auto_10426 ) ) ( ON ?auto_10428 ?auto_10427 ) ( ON-TABLE ?auto_10426 ) ( ON ?auto_10429 ?auto_10428 ) ( CLEAR ?auto_10429 ) ( HOLDING ?auto_10425 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10425 ?auto_10429 )
      ( MAKE-1PILE ?auto_10425 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10430 - BLOCK
    )
    :vars
    (
      ?auto_10431 - BLOCK
      ?auto_10432 - BLOCK
      ?auto_10434 - BLOCK
      ?auto_10433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10430 ?auto_10431 ) ) ( not ( = ?auto_10430 ?auto_10432 ) ) ( not ( = ?auto_10430 ?auto_10434 ) ) ( not ( = ?auto_10431 ?auto_10432 ) ) ( not ( = ?auto_10431 ?auto_10434 ) ) ( not ( = ?auto_10432 ?auto_10434 ) ) ( ON ?auto_10434 ?auto_10433 ) ( not ( = ?auto_10430 ?auto_10433 ) ) ( not ( = ?auto_10431 ?auto_10433 ) ) ( not ( = ?auto_10432 ?auto_10433 ) ) ( not ( = ?auto_10434 ?auto_10433 ) ) ( ON ?auto_10432 ?auto_10434 ) ( ON-TABLE ?auto_10433 ) ( ON ?auto_10431 ?auto_10432 ) ( ON ?auto_10430 ?auto_10431 ) ( CLEAR ?auto_10430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10433 ?auto_10434 ?auto_10432 ?auto_10431 )
      ( MAKE-1PILE ?auto_10430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10438 - BLOCK
      ?auto_10439 - BLOCK
      ?auto_10440 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10440 ) ( CLEAR ?auto_10439 ) ( ON-TABLE ?auto_10438 ) ( ON ?auto_10439 ?auto_10438 ) ( not ( = ?auto_10438 ?auto_10439 ) ) ( not ( = ?auto_10438 ?auto_10440 ) ) ( not ( = ?auto_10439 ?auto_10440 ) ) )
    :subtasks
    ( ( !STACK ?auto_10440 ?auto_10439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10441 - BLOCK
      ?auto_10442 - BLOCK
      ?auto_10443 - BLOCK
    )
    :vars
    (
      ?auto_10444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10442 ) ( ON-TABLE ?auto_10441 ) ( ON ?auto_10442 ?auto_10441 ) ( not ( = ?auto_10441 ?auto_10442 ) ) ( not ( = ?auto_10441 ?auto_10443 ) ) ( not ( = ?auto_10442 ?auto_10443 ) ) ( ON ?auto_10443 ?auto_10444 ) ( CLEAR ?auto_10443 ) ( HAND-EMPTY ) ( not ( = ?auto_10441 ?auto_10444 ) ) ( not ( = ?auto_10442 ?auto_10444 ) ) ( not ( = ?auto_10443 ?auto_10444 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10443 ?auto_10444 )
      ( MAKE-3PILE ?auto_10441 ?auto_10442 ?auto_10443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10445 - BLOCK
      ?auto_10446 - BLOCK
      ?auto_10447 - BLOCK
    )
    :vars
    (
      ?auto_10448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10445 ) ( not ( = ?auto_10445 ?auto_10446 ) ) ( not ( = ?auto_10445 ?auto_10447 ) ) ( not ( = ?auto_10446 ?auto_10447 ) ) ( ON ?auto_10447 ?auto_10448 ) ( CLEAR ?auto_10447 ) ( not ( = ?auto_10445 ?auto_10448 ) ) ( not ( = ?auto_10446 ?auto_10448 ) ) ( not ( = ?auto_10447 ?auto_10448 ) ) ( HOLDING ?auto_10446 ) ( CLEAR ?auto_10445 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10445 ?auto_10446 )
      ( MAKE-3PILE ?auto_10445 ?auto_10446 ?auto_10447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10449 - BLOCK
      ?auto_10450 - BLOCK
      ?auto_10451 - BLOCK
    )
    :vars
    (
      ?auto_10452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10449 ) ( not ( = ?auto_10449 ?auto_10450 ) ) ( not ( = ?auto_10449 ?auto_10451 ) ) ( not ( = ?auto_10450 ?auto_10451 ) ) ( ON ?auto_10451 ?auto_10452 ) ( not ( = ?auto_10449 ?auto_10452 ) ) ( not ( = ?auto_10450 ?auto_10452 ) ) ( not ( = ?auto_10451 ?auto_10452 ) ) ( CLEAR ?auto_10449 ) ( ON ?auto_10450 ?auto_10451 ) ( CLEAR ?auto_10450 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10452 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10452 ?auto_10451 )
      ( MAKE-3PILE ?auto_10449 ?auto_10450 ?auto_10451 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10453 - BLOCK
      ?auto_10454 - BLOCK
      ?auto_10455 - BLOCK
    )
    :vars
    (
      ?auto_10456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10453 ?auto_10454 ) ) ( not ( = ?auto_10453 ?auto_10455 ) ) ( not ( = ?auto_10454 ?auto_10455 ) ) ( ON ?auto_10455 ?auto_10456 ) ( not ( = ?auto_10453 ?auto_10456 ) ) ( not ( = ?auto_10454 ?auto_10456 ) ) ( not ( = ?auto_10455 ?auto_10456 ) ) ( ON ?auto_10454 ?auto_10455 ) ( CLEAR ?auto_10454 ) ( ON-TABLE ?auto_10456 ) ( HOLDING ?auto_10453 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10453 )
      ( MAKE-3PILE ?auto_10453 ?auto_10454 ?auto_10455 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10457 - BLOCK
      ?auto_10458 - BLOCK
      ?auto_10459 - BLOCK
    )
    :vars
    (
      ?auto_10460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10457 ?auto_10458 ) ) ( not ( = ?auto_10457 ?auto_10459 ) ) ( not ( = ?auto_10458 ?auto_10459 ) ) ( ON ?auto_10459 ?auto_10460 ) ( not ( = ?auto_10457 ?auto_10460 ) ) ( not ( = ?auto_10458 ?auto_10460 ) ) ( not ( = ?auto_10459 ?auto_10460 ) ) ( ON ?auto_10458 ?auto_10459 ) ( ON-TABLE ?auto_10460 ) ( ON ?auto_10457 ?auto_10458 ) ( CLEAR ?auto_10457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10460 ?auto_10459 ?auto_10458 )
      ( MAKE-3PILE ?auto_10457 ?auto_10458 ?auto_10459 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10461 - BLOCK
      ?auto_10462 - BLOCK
      ?auto_10463 - BLOCK
    )
    :vars
    (
      ?auto_10464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10461 ?auto_10462 ) ) ( not ( = ?auto_10461 ?auto_10463 ) ) ( not ( = ?auto_10462 ?auto_10463 ) ) ( ON ?auto_10463 ?auto_10464 ) ( not ( = ?auto_10461 ?auto_10464 ) ) ( not ( = ?auto_10462 ?auto_10464 ) ) ( not ( = ?auto_10463 ?auto_10464 ) ) ( ON ?auto_10462 ?auto_10463 ) ( ON-TABLE ?auto_10464 ) ( HOLDING ?auto_10461 ) ( CLEAR ?auto_10462 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10464 ?auto_10463 ?auto_10462 ?auto_10461 )
      ( MAKE-3PILE ?auto_10461 ?auto_10462 ?auto_10463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10465 - BLOCK
      ?auto_10466 - BLOCK
      ?auto_10467 - BLOCK
    )
    :vars
    (
      ?auto_10468 - BLOCK
      ?auto_10469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10465 ?auto_10466 ) ) ( not ( = ?auto_10465 ?auto_10467 ) ) ( not ( = ?auto_10466 ?auto_10467 ) ) ( ON ?auto_10467 ?auto_10468 ) ( not ( = ?auto_10465 ?auto_10468 ) ) ( not ( = ?auto_10466 ?auto_10468 ) ) ( not ( = ?auto_10467 ?auto_10468 ) ) ( ON ?auto_10466 ?auto_10467 ) ( ON-TABLE ?auto_10468 ) ( CLEAR ?auto_10466 ) ( ON ?auto_10465 ?auto_10469 ) ( CLEAR ?auto_10465 ) ( HAND-EMPTY ) ( not ( = ?auto_10465 ?auto_10469 ) ) ( not ( = ?auto_10466 ?auto_10469 ) ) ( not ( = ?auto_10467 ?auto_10469 ) ) ( not ( = ?auto_10468 ?auto_10469 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10465 ?auto_10469 )
      ( MAKE-3PILE ?auto_10465 ?auto_10466 ?auto_10467 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10470 - BLOCK
      ?auto_10471 - BLOCK
      ?auto_10472 - BLOCK
    )
    :vars
    (
      ?auto_10474 - BLOCK
      ?auto_10473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10470 ?auto_10471 ) ) ( not ( = ?auto_10470 ?auto_10472 ) ) ( not ( = ?auto_10471 ?auto_10472 ) ) ( ON ?auto_10472 ?auto_10474 ) ( not ( = ?auto_10470 ?auto_10474 ) ) ( not ( = ?auto_10471 ?auto_10474 ) ) ( not ( = ?auto_10472 ?auto_10474 ) ) ( ON-TABLE ?auto_10474 ) ( ON ?auto_10470 ?auto_10473 ) ( CLEAR ?auto_10470 ) ( not ( = ?auto_10470 ?auto_10473 ) ) ( not ( = ?auto_10471 ?auto_10473 ) ) ( not ( = ?auto_10472 ?auto_10473 ) ) ( not ( = ?auto_10474 ?auto_10473 ) ) ( HOLDING ?auto_10471 ) ( CLEAR ?auto_10472 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10474 ?auto_10472 ?auto_10471 )
      ( MAKE-3PILE ?auto_10470 ?auto_10471 ?auto_10472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10475 - BLOCK
      ?auto_10476 - BLOCK
      ?auto_10477 - BLOCK
    )
    :vars
    (
      ?auto_10479 - BLOCK
      ?auto_10478 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10475 ?auto_10476 ) ) ( not ( = ?auto_10475 ?auto_10477 ) ) ( not ( = ?auto_10476 ?auto_10477 ) ) ( ON ?auto_10477 ?auto_10479 ) ( not ( = ?auto_10475 ?auto_10479 ) ) ( not ( = ?auto_10476 ?auto_10479 ) ) ( not ( = ?auto_10477 ?auto_10479 ) ) ( ON-TABLE ?auto_10479 ) ( ON ?auto_10475 ?auto_10478 ) ( not ( = ?auto_10475 ?auto_10478 ) ) ( not ( = ?auto_10476 ?auto_10478 ) ) ( not ( = ?auto_10477 ?auto_10478 ) ) ( not ( = ?auto_10479 ?auto_10478 ) ) ( CLEAR ?auto_10477 ) ( ON ?auto_10476 ?auto_10475 ) ( CLEAR ?auto_10476 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10478 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10478 ?auto_10475 )
      ( MAKE-3PILE ?auto_10475 ?auto_10476 ?auto_10477 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10480 - BLOCK
      ?auto_10481 - BLOCK
      ?auto_10482 - BLOCK
    )
    :vars
    (
      ?auto_10483 - BLOCK
      ?auto_10484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10480 ?auto_10481 ) ) ( not ( = ?auto_10480 ?auto_10482 ) ) ( not ( = ?auto_10481 ?auto_10482 ) ) ( not ( = ?auto_10480 ?auto_10483 ) ) ( not ( = ?auto_10481 ?auto_10483 ) ) ( not ( = ?auto_10482 ?auto_10483 ) ) ( ON-TABLE ?auto_10483 ) ( ON ?auto_10480 ?auto_10484 ) ( not ( = ?auto_10480 ?auto_10484 ) ) ( not ( = ?auto_10481 ?auto_10484 ) ) ( not ( = ?auto_10482 ?auto_10484 ) ) ( not ( = ?auto_10483 ?auto_10484 ) ) ( ON ?auto_10481 ?auto_10480 ) ( CLEAR ?auto_10481 ) ( ON-TABLE ?auto_10484 ) ( HOLDING ?auto_10482 ) ( CLEAR ?auto_10483 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10483 ?auto_10482 )
      ( MAKE-3PILE ?auto_10480 ?auto_10481 ?auto_10482 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10485 - BLOCK
      ?auto_10486 - BLOCK
      ?auto_10487 - BLOCK
    )
    :vars
    (
      ?auto_10489 - BLOCK
      ?auto_10488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10485 ?auto_10486 ) ) ( not ( = ?auto_10485 ?auto_10487 ) ) ( not ( = ?auto_10486 ?auto_10487 ) ) ( not ( = ?auto_10485 ?auto_10489 ) ) ( not ( = ?auto_10486 ?auto_10489 ) ) ( not ( = ?auto_10487 ?auto_10489 ) ) ( ON-TABLE ?auto_10489 ) ( ON ?auto_10485 ?auto_10488 ) ( not ( = ?auto_10485 ?auto_10488 ) ) ( not ( = ?auto_10486 ?auto_10488 ) ) ( not ( = ?auto_10487 ?auto_10488 ) ) ( not ( = ?auto_10489 ?auto_10488 ) ) ( ON ?auto_10486 ?auto_10485 ) ( ON-TABLE ?auto_10488 ) ( CLEAR ?auto_10489 ) ( ON ?auto_10487 ?auto_10486 ) ( CLEAR ?auto_10487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10488 ?auto_10485 ?auto_10486 )
      ( MAKE-3PILE ?auto_10485 ?auto_10486 ?auto_10487 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10490 - BLOCK
      ?auto_10491 - BLOCK
      ?auto_10492 - BLOCK
    )
    :vars
    (
      ?auto_10493 - BLOCK
      ?auto_10494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10490 ?auto_10491 ) ) ( not ( = ?auto_10490 ?auto_10492 ) ) ( not ( = ?auto_10491 ?auto_10492 ) ) ( not ( = ?auto_10490 ?auto_10493 ) ) ( not ( = ?auto_10491 ?auto_10493 ) ) ( not ( = ?auto_10492 ?auto_10493 ) ) ( ON ?auto_10490 ?auto_10494 ) ( not ( = ?auto_10490 ?auto_10494 ) ) ( not ( = ?auto_10491 ?auto_10494 ) ) ( not ( = ?auto_10492 ?auto_10494 ) ) ( not ( = ?auto_10493 ?auto_10494 ) ) ( ON ?auto_10491 ?auto_10490 ) ( ON-TABLE ?auto_10494 ) ( ON ?auto_10492 ?auto_10491 ) ( CLEAR ?auto_10492 ) ( HOLDING ?auto_10493 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10493 )
      ( MAKE-3PILE ?auto_10490 ?auto_10491 ?auto_10492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10495 - BLOCK
      ?auto_10496 - BLOCK
      ?auto_10497 - BLOCK
    )
    :vars
    (
      ?auto_10498 - BLOCK
      ?auto_10499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10495 ?auto_10496 ) ) ( not ( = ?auto_10495 ?auto_10497 ) ) ( not ( = ?auto_10496 ?auto_10497 ) ) ( not ( = ?auto_10495 ?auto_10498 ) ) ( not ( = ?auto_10496 ?auto_10498 ) ) ( not ( = ?auto_10497 ?auto_10498 ) ) ( ON ?auto_10495 ?auto_10499 ) ( not ( = ?auto_10495 ?auto_10499 ) ) ( not ( = ?auto_10496 ?auto_10499 ) ) ( not ( = ?auto_10497 ?auto_10499 ) ) ( not ( = ?auto_10498 ?auto_10499 ) ) ( ON ?auto_10496 ?auto_10495 ) ( ON-TABLE ?auto_10499 ) ( ON ?auto_10497 ?auto_10496 ) ( ON ?auto_10498 ?auto_10497 ) ( CLEAR ?auto_10498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10499 ?auto_10495 ?auto_10496 ?auto_10497 )
      ( MAKE-3PILE ?auto_10495 ?auto_10496 ?auto_10497 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10504 - BLOCK
      ?auto_10505 - BLOCK
      ?auto_10506 - BLOCK
      ?auto_10507 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10507 ) ( CLEAR ?auto_10506 ) ( ON-TABLE ?auto_10504 ) ( ON ?auto_10505 ?auto_10504 ) ( ON ?auto_10506 ?auto_10505 ) ( not ( = ?auto_10504 ?auto_10505 ) ) ( not ( = ?auto_10504 ?auto_10506 ) ) ( not ( = ?auto_10504 ?auto_10507 ) ) ( not ( = ?auto_10505 ?auto_10506 ) ) ( not ( = ?auto_10505 ?auto_10507 ) ) ( not ( = ?auto_10506 ?auto_10507 ) ) )
    :subtasks
    ( ( !STACK ?auto_10507 ?auto_10506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10508 - BLOCK
      ?auto_10509 - BLOCK
      ?auto_10510 - BLOCK
      ?auto_10511 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10510 ) ( ON-TABLE ?auto_10508 ) ( ON ?auto_10509 ?auto_10508 ) ( ON ?auto_10510 ?auto_10509 ) ( not ( = ?auto_10508 ?auto_10509 ) ) ( not ( = ?auto_10508 ?auto_10510 ) ) ( not ( = ?auto_10508 ?auto_10511 ) ) ( not ( = ?auto_10509 ?auto_10510 ) ) ( not ( = ?auto_10509 ?auto_10511 ) ) ( not ( = ?auto_10510 ?auto_10511 ) ) ( ON-TABLE ?auto_10511 ) ( CLEAR ?auto_10511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_10511 )
      ( MAKE-4PILE ?auto_10508 ?auto_10509 ?auto_10510 ?auto_10511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10512 - BLOCK
      ?auto_10513 - BLOCK
      ?auto_10514 - BLOCK
      ?auto_10515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10512 ) ( ON ?auto_10513 ?auto_10512 ) ( not ( = ?auto_10512 ?auto_10513 ) ) ( not ( = ?auto_10512 ?auto_10514 ) ) ( not ( = ?auto_10512 ?auto_10515 ) ) ( not ( = ?auto_10513 ?auto_10514 ) ) ( not ( = ?auto_10513 ?auto_10515 ) ) ( not ( = ?auto_10514 ?auto_10515 ) ) ( ON-TABLE ?auto_10515 ) ( CLEAR ?auto_10515 ) ( HOLDING ?auto_10514 ) ( CLEAR ?auto_10513 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10512 ?auto_10513 ?auto_10514 )
      ( MAKE-4PILE ?auto_10512 ?auto_10513 ?auto_10514 ?auto_10515 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10516 - BLOCK
      ?auto_10517 - BLOCK
      ?auto_10518 - BLOCK
      ?auto_10519 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10516 ) ( ON ?auto_10517 ?auto_10516 ) ( not ( = ?auto_10516 ?auto_10517 ) ) ( not ( = ?auto_10516 ?auto_10518 ) ) ( not ( = ?auto_10516 ?auto_10519 ) ) ( not ( = ?auto_10517 ?auto_10518 ) ) ( not ( = ?auto_10517 ?auto_10519 ) ) ( not ( = ?auto_10518 ?auto_10519 ) ) ( ON-TABLE ?auto_10519 ) ( CLEAR ?auto_10517 ) ( ON ?auto_10518 ?auto_10519 ) ( CLEAR ?auto_10518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10519 )
      ( MAKE-4PILE ?auto_10516 ?auto_10517 ?auto_10518 ?auto_10519 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10520 - BLOCK
      ?auto_10521 - BLOCK
      ?auto_10522 - BLOCK
      ?auto_10523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10520 ) ( not ( = ?auto_10520 ?auto_10521 ) ) ( not ( = ?auto_10520 ?auto_10522 ) ) ( not ( = ?auto_10520 ?auto_10523 ) ) ( not ( = ?auto_10521 ?auto_10522 ) ) ( not ( = ?auto_10521 ?auto_10523 ) ) ( not ( = ?auto_10522 ?auto_10523 ) ) ( ON-TABLE ?auto_10523 ) ( ON ?auto_10522 ?auto_10523 ) ( CLEAR ?auto_10522 ) ( HOLDING ?auto_10521 ) ( CLEAR ?auto_10520 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10520 ?auto_10521 )
      ( MAKE-4PILE ?auto_10520 ?auto_10521 ?auto_10522 ?auto_10523 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10524 - BLOCK
      ?auto_10525 - BLOCK
      ?auto_10526 - BLOCK
      ?auto_10527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10524 ) ( not ( = ?auto_10524 ?auto_10525 ) ) ( not ( = ?auto_10524 ?auto_10526 ) ) ( not ( = ?auto_10524 ?auto_10527 ) ) ( not ( = ?auto_10525 ?auto_10526 ) ) ( not ( = ?auto_10525 ?auto_10527 ) ) ( not ( = ?auto_10526 ?auto_10527 ) ) ( ON-TABLE ?auto_10527 ) ( ON ?auto_10526 ?auto_10527 ) ( CLEAR ?auto_10524 ) ( ON ?auto_10525 ?auto_10526 ) ( CLEAR ?auto_10525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10527 ?auto_10526 )
      ( MAKE-4PILE ?auto_10524 ?auto_10525 ?auto_10526 ?auto_10527 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10528 - BLOCK
      ?auto_10529 - BLOCK
      ?auto_10530 - BLOCK
      ?auto_10531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10528 ?auto_10529 ) ) ( not ( = ?auto_10528 ?auto_10530 ) ) ( not ( = ?auto_10528 ?auto_10531 ) ) ( not ( = ?auto_10529 ?auto_10530 ) ) ( not ( = ?auto_10529 ?auto_10531 ) ) ( not ( = ?auto_10530 ?auto_10531 ) ) ( ON-TABLE ?auto_10531 ) ( ON ?auto_10530 ?auto_10531 ) ( ON ?auto_10529 ?auto_10530 ) ( CLEAR ?auto_10529 ) ( HOLDING ?auto_10528 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10528 )
      ( MAKE-4PILE ?auto_10528 ?auto_10529 ?auto_10530 ?auto_10531 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10532 - BLOCK
      ?auto_10533 - BLOCK
      ?auto_10534 - BLOCK
      ?auto_10535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10532 ?auto_10533 ) ) ( not ( = ?auto_10532 ?auto_10534 ) ) ( not ( = ?auto_10532 ?auto_10535 ) ) ( not ( = ?auto_10533 ?auto_10534 ) ) ( not ( = ?auto_10533 ?auto_10535 ) ) ( not ( = ?auto_10534 ?auto_10535 ) ) ( ON-TABLE ?auto_10535 ) ( ON ?auto_10534 ?auto_10535 ) ( ON ?auto_10533 ?auto_10534 ) ( ON ?auto_10532 ?auto_10533 ) ( CLEAR ?auto_10532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10535 ?auto_10534 ?auto_10533 )
      ( MAKE-4PILE ?auto_10532 ?auto_10533 ?auto_10534 ?auto_10535 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10536 - BLOCK
      ?auto_10537 - BLOCK
      ?auto_10538 - BLOCK
      ?auto_10539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10536 ?auto_10537 ) ) ( not ( = ?auto_10536 ?auto_10538 ) ) ( not ( = ?auto_10536 ?auto_10539 ) ) ( not ( = ?auto_10537 ?auto_10538 ) ) ( not ( = ?auto_10537 ?auto_10539 ) ) ( not ( = ?auto_10538 ?auto_10539 ) ) ( ON-TABLE ?auto_10539 ) ( ON ?auto_10538 ?auto_10539 ) ( ON ?auto_10537 ?auto_10538 ) ( HOLDING ?auto_10536 ) ( CLEAR ?auto_10537 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10539 ?auto_10538 ?auto_10537 ?auto_10536 )
      ( MAKE-4PILE ?auto_10536 ?auto_10537 ?auto_10538 ?auto_10539 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10540 - BLOCK
      ?auto_10541 - BLOCK
      ?auto_10542 - BLOCK
      ?auto_10543 - BLOCK
    )
    :vars
    (
      ?auto_10544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10540 ?auto_10541 ) ) ( not ( = ?auto_10540 ?auto_10542 ) ) ( not ( = ?auto_10540 ?auto_10543 ) ) ( not ( = ?auto_10541 ?auto_10542 ) ) ( not ( = ?auto_10541 ?auto_10543 ) ) ( not ( = ?auto_10542 ?auto_10543 ) ) ( ON-TABLE ?auto_10543 ) ( ON ?auto_10542 ?auto_10543 ) ( ON ?auto_10541 ?auto_10542 ) ( CLEAR ?auto_10541 ) ( ON ?auto_10540 ?auto_10544 ) ( CLEAR ?auto_10540 ) ( HAND-EMPTY ) ( not ( = ?auto_10540 ?auto_10544 ) ) ( not ( = ?auto_10541 ?auto_10544 ) ) ( not ( = ?auto_10542 ?auto_10544 ) ) ( not ( = ?auto_10543 ?auto_10544 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10540 ?auto_10544 )
      ( MAKE-4PILE ?auto_10540 ?auto_10541 ?auto_10542 ?auto_10543 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10545 - BLOCK
      ?auto_10546 - BLOCK
      ?auto_10547 - BLOCK
      ?auto_10548 - BLOCK
    )
    :vars
    (
      ?auto_10549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10545 ?auto_10546 ) ) ( not ( = ?auto_10545 ?auto_10547 ) ) ( not ( = ?auto_10545 ?auto_10548 ) ) ( not ( = ?auto_10546 ?auto_10547 ) ) ( not ( = ?auto_10546 ?auto_10548 ) ) ( not ( = ?auto_10547 ?auto_10548 ) ) ( ON-TABLE ?auto_10548 ) ( ON ?auto_10547 ?auto_10548 ) ( ON ?auto_10545 ?auto_10549 ) ( CLEAR ?auto_10545 ) ( not ( = ?auto_10545 ?auto_10549 ) ) ( not ( = ?auto_10546 ?auto_10549 ) ) ( not ( = ?auto_10547 ?auto_10549 ) ) ( not ( = ?auto_10548 ?auto_10549 ) ) ( HOLDING ?auto_10546 ) ( CLEAR ?auto_10547 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10548 ?auto_10547 ?auto_10546 )
      ( MAKE-4PILE ?auto_10545 ?auto_10546 ?auto_10547 ?auto_10548 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10550 - BLOCK
      ?auto_10551 - BLOCK
      ?auto_10552 - BLOCK
      ?auto_10553 - BLOCK
    )
    :vars
    (
      ?auto_10554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10550 ?auto_10551 ) ) ( not ( = ?auto_10550 ?auto_10552 ) ) ( not ( = ?auto_10550 ?auto_10553 ) ) ( not ( = ?auto_10551 ?auto_10552 ) ) ( not ( = ?auto_10551 ?auto_10553 ) ) ( not ( = ?auto_10552 ?auto_10553 ) ) ( ON-TABLE ?auto_10553 ) ( ON ?auto_10552 ?auto_10553 ) ( ON ?auto_10550 ?auto_10554 ) ( not ( = ?auto_10550 ?auto_10554 ) ) ( not ( = ?auto_10551 ?auto_10554 ) ) ( not ( = ?auto_10552 ?auto_10554 ) ) ( not ( = ?auto_10553 ?auto_10554 ) ) ( CLEAR ?auto_10552 ) ( ON ?auto_10551 ?auto_10550 ) ( CLEAR ?auto_10551 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10554 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10554 ?auto_10550 )
      ( MAKE-4PILE ?auto_10550 ?auto_10551 ?auto_10552 ?auto_10553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10555 - BLOCK
      ?auto_10556 - BLOCK
      ?auto_10557 - BLOCK
      ?auto_10558 - BLOCK
    )
    :vars
    (
      ?auto_10559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10555 ?auto_10556 ) ) ( not ( = ?auto_10555 ?auto_10557 ) ) ( not ( = ?auto_10555 ?auto_10558 ) ) ( not ( = ?auto_10556 ?auto_10557 ) ) ( not ( = ?auto_10556 ?auto_10558 ) ) ( not ( = ?auto_10557 ?auto_10558 ) ) ( ON-TABLE ?auto_10558 ) ( ON ?auto_10555 ?auto_10559 ) ( not ( = ?auto_10555 ?auto_10559 ) ) ( not ( = ?auto_10556 ?auto_10559 ) ) ( not ( = ?auto_10557 ?auto_10559 ) ) ( not ( = ?auto_10558 ?auto_10559 ) ) ( ON ?auto_10556 ?auto_10555 ) ( CLEAR ?auto_10556 ) ( ON-TABLE ?auto_10559 ) ( HOLDING ?auto_10557 ) ( CLEAR ?auto_10558 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10558 ?auto_10557 )
      ( MAKE-4PILE ?auto_10555 ?auto_10556 ?auto_10557 ?auto_10558 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10560 - BLOCK
      ?auto_10561 - BLOCK
      ?auto_10562 - BLOCK
      ?auto_10563 - BLOCK
    )
    :vars
    (
      ?auto_10564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10560 ?auto_10561 ) ) ( not ( = ?auto_10560 ?auto_10562 ) ) ( not ( = ?auto_10560 ?auto_10563 ) ) ( not ( = ?auto_10561 ?auto_10562 ) ) ( not ( = ?auto_10561 ?auto_10563 ) ) ( not ( = ?auto_10562 ?auto_10563 ) ) ( ON-TABLE ?auto_10563 ) ( ON ?auto_10560 ?auto_10564 ) ( not ( = ?auto_10560 ?auto_10564 ) ) ( not ( = ?auto_10561 ?auto_10564 ) ) ( not ( = ?auto_10562 ?auto_10564 ) ) ( not ( = ?auto_10563 ?auto_10564 ) ) ( ON ?auto_10561 ?auto_10560 ) ( ON-TABLE ?auto_10564 ) ( CLEAR ?auto_10563 ) ( ON ?auto_10562 ?auto_10561 ) ( CLEAR ?auto_10562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10564 ?auto_10560 ?auto_10561 )
      ( MAKE-4PILE ?auto_10560 ?auto_10561 ?auto_10562 ?auto_10563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10565 - BLOCK
      ?auto_10566 - BLOCK
      ?auto_10567 - BLOCK
      ?auto_10568 - BLOCK
    )
    :vars
    (
      ?auto_10569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10565 ?auto_10566 ) ) ( not ( = ?auto_10565 ?auto_10567 ) ) ( not ( = ?auto_10565 ?auto_10568 ) ) ( not ( = ?auto_10566 ?auto_10567 ) ) ( not ( = ?auto_10566 ?auto_10568 ) ) ( not ( = ?auto_10567 ?auto_10568 ) ) ( ON ?auto_10565 ?auto_10569 ) ( not ( = ?auto_10565 ?auto_10569 ) ) ( not ( = ?auto_10566 ?auto_10569 ) ) ( not ( = ?auto_10567 ?auto_10569 ) ) ( not ( = ?auto_10568 ?auto_10569 ) ) ( ON ?auto_10566 ?auto_10565 ) ( ON-TABLE ?auto_10569 ) ( ON ?auto_10567 ?auto_10566 ) ( CLEAR ?auto_10567 ) ( HOLDING ?auto_10568 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10568 )
      ( MAKE-4PILE ?auto_10565 ?auto_10566 ?auto_10567 ?auto_10568 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10570 - BLOCK
      ?auto_10571 - BLOCK
      ?auto_10572 - BLOCK
      ?auto_10573 - BLOCK
    )
    :vars
    (
      ?auto_10574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10570 ?auto_10571 ) ) ( not ( = ?auto_10570 ?auto_10572 ) ) ( not ( = ?auto_10570 ?auto_10573 ) ) ( not ( = ?auto_10571 ?auto_10572 ) ) ( not ( = ?auto_10571 ?auto_10573 ) ) ( not ( = ?auto_10572 ?auto_10573 ) ) ( ON ?auto_10570 ?auto_10574 ) ( not ( = ?auto_10570 ?auto_10574 ) ) ( not ( = ?auto_10571 ?auto_10574 ) ) ( not ( = ?auto_10572 ?auto_10574 ) ) ( not ( = ?auto_10573 ?auto_10574 ) ) ( ON ?auto_10571 ?auto_10570 ) ( ON-TABLE ?auto_10574 ) ( ON ?auto_10572 ?auto_10571 ) ( ON ?auto_10573 ?auto_10572 ) ( CLEAR ?auto_10573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10574 ?auto_10570 ?auto_10571 ?auto_10572 )
      ( MAKE-4PILE ?auto_10570 ?auto_10571 ?auto_10572 ?auto_10573 ) )
  )

)

