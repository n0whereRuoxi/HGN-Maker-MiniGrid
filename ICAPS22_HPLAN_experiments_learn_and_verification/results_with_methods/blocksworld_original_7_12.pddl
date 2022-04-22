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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109995 - BLOCK
      ?auto_109996 - BLOCK
      ?auto_109997 - BLOCK
      ?auto_109998 - BLOCK
      ?auto_109999 - BLOCK
      ?auto_110000 - BLOCK
      ?auto_110001 - BLOCK
    )
    :vars
    (
      ?auto_110002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110002 ?auto_110001 ) ( CLEAR ?auto_110002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109995 ) ( ON ?auto_109996 ?auto_109995 ) ( ON ?auto_109997 ?auto_109996 ) ( ON ?auto_109998 ?auto_109997 ) ( ON ?auto_109999 ?auto_109998 ) ( ON ?auto_110000 ?auto_109999 ) ( ON ?auto_110001 ?auto_110000 ) ( not ( = ?auto_109995 ?auto_109996 ) ) ( not ( = ?auto_109995 ?auto_109997 ) ) ( not ( = ?auto_109995 ?auto_109998 ) ) ( not ( = ?auto_109995 ?auto_109999 ) ) ( not ( = ?auto_109995 ?auto_110000 ) ) ( not ( = ?auto_109995 ?auto_110001 ) ) ( not ( = ?auto_109995 ?auto_110002 ) ) ( not ( = ?auto_109996 ?auto_109997 ) ) ( not ( = ?auto_109996 ?auto_109998 ) ) ( not ( = ?auto_109996 ?auto_109999 ) ) ( not ( = ?auto_109996 ?auto_110000 ) ) ( not ( = ?auto_109996 ?auto_110001 ) ) ( not ( = ?auto_109996 ?auto_110002 ) ) ( not ( = ?auto_109997 ?auto_109998 ) ) ( not ( = ?auto_109997 ?auto_109999 ) ) ( not ( = ?auto_109997 ?auto_110000 ) ) ( not ( = ?auto_109997 ?auto_110001 ) ) ( not ( = ?auto_109997 ?auto_110002 ) ) ( not ( = ?auto_109998 ?auto_109999 ) ) ( not ( = ?auto_109998 ?auto_110000 ) ) ( not ( = ?auto_109998 ?auto_110001 ) ) ( not ( = ?auto_109998 ?auto_110002 ) ) ( not ( = ?auto_109999 ?auto_110000 ) ) ( not ( = ?auto_109999 ?auto_110001 ) ) ( not ( = ?auto_109999 ?auto_110002 ) ) ( not ( = ?auto_110000 ?auto_110001 ) ) ( not ( = ?auto_110000 ?auto_110002 ) ) ( not ( = ?auto_110001 ?auto_110002 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110002 ?auto_110001 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110004 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_110004 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_110004 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110005 - BLOCK
    )
    :vars
    (
      ?auto_110006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110005 ?auto_110006 ) ( CLEAR ?auto_110005 ) ( HAND-EMPTY ) ( not ( = ?auto_110005 ?auto_110006 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110005 ?auto_110006 )
      ( MAKE-1PILE ?auto_110005 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110013 - BLOCK
      ?auto_110014 - BLOCK
      ?auto_110015 - BLOCK
      ?auto_110016 - BLOCK
      ?auto_110017 - BLOCK
      ?auto_110018 - BLOCK
    )
    :vars
    (
      ?auto_110019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110019 ?auto_110018 ) ( CLEAR ?auto_110019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110013 ) ( ON ?auto_110014 ?auto_110013 ) ( ON ?auto_110015 ?auto_110014 ) ( ON ?auto_110016 ?auto_110015 ) ( ON ?auto_110017 ?auto_110016 ) ( ON ?auto_110018 ?auto_110017 ) ( not ( = ?auto_110013 ?auto_110014 ) ) ( not ( = ?auto_110013 ?auto_110015 ) ) ( not ( = ?auto_110013 ?auto_110016 ) ) ( not ( = ?auto_110013 ?auto_110017 ) ) ( not ( = ?auto_110013 ?auto_110018 ) ) ( not ( = ?auto_110013 ?auto_110019 ) ) ( not ( = ?auto_110014 ?auto_110015 ) ) ( not ( = ?auto_110014 ?auto_110016 ) ) ( not ( = ?auto_110014 ?auto_110017 ) ) ( not ( = ?auto_110014 ?auto_110018 ) ) ( not ( = ?auto_110014 ?auto_110019 ) ) ( not ( = ?auto_110015 ?auto_110016 ) ) ( not ( = ?auto_110015 ?auto_110017 ) ) ( not ( = ?auto_110015 ?auto_110018 ) ) ( not ( = ?auto_110015 ?auto_110019 ) ) ( not ( = ?auto_110016 ?auto_110017 ) ) ( not ( = ?auto_110016 ?auto_110018 ) ) ( not ( = ?auto_110016 ?auto_110019 ) ) ( not ( = ?auto_110017 ?auto_110018 ) ) ( not ( = ?auto_110017 ?auto_110019 ) ) ( not ( = ?auto_110018 ?auto_110019 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110019 ?auto_110018 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110020 - BLOCK
      ?auto_110021 - BLOCK
      ?auto_110022 - BLOCK
      ?auto_110023 - BLOCK
      ?auto_110024 - BLOCK
      ?auto_110025 - BLOCK
    )
    :vars
    (
      ?auto_110026 - BLOCK
      ?auto_110027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110026 ?auto_110025 ) ( CLEAR ?auto_110026 ) ( ON-TABLE ?auto_110020 ) ( ON ?auto_110021 ?auto_110020 ) ( ON ?auto_110022 ?auto_110021 ) ( ON ?auto_110023 ?auto_110022 ) ( ON ?auto_110024 ?auto_110023 ) ( ON ?auto_110025 ?auto_110024 ) ( not ( = ?auto_110020 ?auto_110021 ) ) ( not ( = ?auto_110020 ?auto_110022 ) ) ( not ( = ?auto_110020 ?auto_110023 ) ) ( not ( = ?auto_110020 ?auto_110024 ) ) ( not ( = ?auto_110020 ?auto_110025 ) ) ( not ( = ?auto_110020 ?auto_110026 ) ) ( not ( = ?auto_110021 ?auto_110022 ) ) ( not ( = ?auto_110021 ?auto_110023 ) ) ( not ( = ?auto_110021 ?auto_110024 ) ) ( not ( = ?auto_110021 ?auto_110025 ) ) ( not ( = ?auto_110021 ?auto_110026 ) ) ( not ( = ?auto_110022 ?auto_110023 ) ) ( not ( = ?auto_110022 ?auto_110024 ) ) ( not ( = ?auto_110022 ?auto_110025 ) ) ( not ( = ?auto_110022 ?auto_110026 ) ) ( not ( = ?auto_110023 ?auto_110024 ) ) ( not ( = ?auto_110023 ?auto_110025 ) ) ( not ( = ?auto_110023 ?auto_110026 ) ) ( not ( = ?auto_110024 ?auto_110025 ) ) ( not ( = ?auto_110024 ?auto_110026 ) ) ( not ( = ?auto_110025 ?auto_110026 ) ) ( HOLDING ?auto_110027 ) ( not ( = ?auto_110020 ?auto_110027 ) ) ( not ( = ?auto_110021 ?auto_110027 ) ) ( not ( = ?auto_110022 ?auto_110027 ) ) ( not ( = ?auto_110023 ?auto_110027 ) ) ( not ( = ?auto_110024 ?auto_110027 ) ) ( not ( = ?auto_110025 ?auto_110027 ) ) ( not ( = ?auto_110026 ?auto_110027 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_110027 )
      ( MAKE-6PILE ?auto_110020 ?auto_110021 ?auto_110022 ?auto_110023 ?auto_110024 ?auto_110025 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110028 - BLOCK
      ?auto_110029 - BLOCK
      ?auto_110030 - BLOCK
      ?auto_110031 - BLOCK
      ?auto_110032 - BLOCK
      ?auto_110033 - BLOCK
    )
    :vars
    (
      ?auto_110034 - BLOCK
      ?auto_110035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110034 ?auto_110033 ) ( ON-TABLE ?auto_110028 ) ( ON ?auto_110029 ?auto_110028 ) ( ON ?auto_110030 ?auto_110029 ) ( ON ?auto_110031 ?auto_110030 ) ( ON ?auto_110032 ?auto_110031 ) ( ON ?auto_110033 ?auto_110032 ) ( not ( = ?auto_110028 ?auto_110029 ) ) ( not ( = ?auto_110028 ?auto_110030 ) ) ( not ( = ?auto_110028 ?auto_110031 ) ) ( not ( = ?auto_110028 ?auto_110032 ) ) ( not ( = ?auto_110028 ?auto_110033 ) ) ( not ( = ?auto_110028 ?auto_110034 ) ) ( not ( = ?auto_110029 ?auto_110030 ) ) ( not ( = ?auto_110029 ?auto_110031 ) ) ( not ( = ?auto_110029 ?auto_110032 ) ) ( not ( = ?auto_110029 ?auto_110033 ) ) ( not ( = ?auto_110029 ?auto_110034 ) ) ( not ( = ?auto_110030 ?auto_110031 ) ) ( not ( = ?auto_110030 ?auto_110032 ) ) ( not ( = ?auto_110030 ?auto_110033 ) ) ( not ( = ?auto_110030 ?auto_110034 ) ) ( not ( = ?auto_110031 ?auto_110032 ) ) ( not ( = ?auto_110031 ?auto_110033 ) ) ( not ( = ?auto_110031 ?auto_110034 ) ) ( not ( = ?auto_110032 ?auto_110033 ) ) ( not ( = ?auto_110032 ?auto_110034 ) ) ( not ( = ?auto_110033 ?auto_110034 ) ) ( not ( = ?auto_110028 ?auto_110035 ) ) ( not ( = ?auto_110029 ?auto_110035 ) ) ( not ( = ?auto_110030 ?auto_110035 ) ) ( not ( = ?auto_110031 ?auto_110035 ) ) ( not ( = ?auto_110032 ?auto_110035 ) ) ( not ( = ?auto_110033 ?auto_110035 ) ) ( not ( = ?auto_110034 ?auto_110035 ) ) ( ON ?auto_110035 ?auto_110034 ) ( CLEAR ?auto_110035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110028 ?auto_110029 ?auto_110030 ?auto_110031 ?auto_110032 ?auto_110033 ?auto_110034 )
      ( MAKE-6PILE ?auto_110028 ?auto_110029 ?auto_110030 ?auto_110031 ?auto_110032 ?auto_110033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110038 - BLOCK
      ?auto_110039 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_110039 ) ( CLEAR ?auto_110038 ) ( ON-TABLE ?auto_110038 ) ( not ( = ?auto_110038 ?auto_110039 ) ) )
    :subtasks
    ( ( !STACK ?auto_110039 ?auto_110038 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110040 - BLOCK
      ?auto_110041 - BLOCK
    )
    :vars
    (
      ?auto_110042 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_110040 ) ( ON-TABLE ?auto_110040 ) ( not ( = ?auto_110040 ?auto_110041 ) ) ( ON ?auto_110041 ?auto_110042 ) ( CLEAR ?auto_110041 ) ( HAND-EMPTY ) ( not ( = ?auto_110040 ?auto_110042 ) ) ( not ( = ?auto_110041 ?auto_110042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110041 ?auto_110042 )
      ( MAKE-2PILE ?auto_110040 ?auto_110041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110043 - BLOCK
      ?auto_110044 - BLOCK
    )
    :vars
    (
      ?auto_110045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110043 ?auto_110044 ) ) ( ON ?auto_110044 ?auto_110045 ) ( CLEAR ?auto_110044 ) ( not ( = ?auto_110043 ?auto_110045 ) ) ( not ( = ?auto_110044 ?auto_110045 ) ) ( HOLDING ?auto_110043 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110043 )
      ( MAKE-2PILE ?auto_110043 ?auto_110044 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110046 - BLOCK
      ?auto_110047 - BLOCK
    )
    :vars
    (
      ?auto_110048 - BLOCK
      ?auto_110052 - BLOCK
      ?auto_110053 - BLOCK
      ?auto_110050 - BLOCK
      ?auto_110049 - BLOCK
      ?auto_110051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110046 ?auto_110047 ) ) ( ON ?auto_110047 ?auto_110048 ) ( not ( = ?auto_110046 ?auto_110048 ) ) ( not ( = ?auto_110047 ?auto_110048 ) ) ( ON ?auto_110046 ?auto_110047 ) ( CLEAR ?auto_110046 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110052 ) ( ON ?auto_110053 ?auto_110052 ) ( ON ?auto_110050 ?auto_110053 ) ( ON ?auto_110049 ?auto_110050 ) ( ON ?auto_110051 ?auto_110049 ) ( ON ?auto_110048 ?auto_110051 ) ( not ( = ?auto_110052 ?auto_110053 ) ) ( not ( = ?auto_110052 ?auto_110050 ) ) ( not ( = ?auto_110052 ?auto_110049 ) ) ( not ( = ?auto_110052 ?auto_110051 ) ) ( not ( = ?auto_110052 ?auto_110048 ) ) ( not ( = ?auto_110052 ?auto_110047 ) ) ( not ( = ?auto_110052 ?auto_110046 ) ) ( not ( = ?auto_110053 ?auto_110050 ) ) ( not ( = ?auto_110053 ?auto_110049 ) ) ( not ( = ?auto_110053 ?auto_110051 ) ) ( not ( = ?auto_110053 ?auto_110048 ) ) ( not ( = ?auto_110053 ?auto_110047 ) ) ( not ( = ?auto_110053 ?auto_110046 ) ) ( not ( = ?auto_110050 ?auto_110049 ) ) ( not ( = ?auto_110050 ?auto_110051 ) ) ( not ( = ?auto_110050 ?auto_110048 ) ) ( not ( = ?auto_110050 ?auto_110047 ) ) ( not ( = ?auto_110050 ?auto_110046 ) ) ( not ( = ?auto_110049 ?auto_110051 ) ) ( not ( = ?auto_110049 ?auto_110048 ) ) ( not ( = ?auto_110049 ?auto_110047 ) ) ( not ( = ?auto_110049 ?auto_110046 ) ) ( not ( = ?auto_110051 ?auto_110048 ) ) ( not ( = ?auto_110051 ?auto_110047 ) ) ( not ( = ?auto_110051 ?auto_110046 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110052 ?auto_110053 ?auto_110050 ?auto_110049 ?auto_110051 ?auto_110048 ?auto_110047 )
      ( MAKE-2PILE ?auto_110046 ?auto_110047 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110059 - BLOCK
      ?auto_110060 - BLOCK
      ?auto_110061 - BLOCK
      ?auto_110062 - BLOCK
      ?auto_110063 - BLOCK
    )
    :vars
    (
      ?auto_110064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110064 ?auto_110063 ) ( CLEAR ?auto_110064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110059 ) ( ON ?auto_110060 ?auto_110059 ) ( ON ?auto_110061 ?auto_110060 ) ( ON ?auto_110062 ?auto_110061 ) ( ON ?auto_110063 ?auto_110062 ) ( not ( = ?auto_110059 ?auto_110060 ) ) ( not ( = ?auto_110059 ?auto_110061 ) ) ( not ( = ?auto_110059 ?auto_110062 ) ) ( not ( = ?auto_110059 ?auto_110063 ) ) ( not ( = ?auto_110059 ?auto_110064 ) ) ( not ( = ?auto_110060 ?auto_110061 ) ) ( not ( = ?auto_110060 ?auto_110062 ) ) ( not ( = ?auto_110060 ?auto_110063 ) ) ( not ( = ?auto_110060 ?auto_110064 ) ) ( not ( = ?auto_110061 ?auto_110062 ) ) ( not ( = ?auto_110061 ?auto_110063 ) ) ( not ( = ?auto_110061 ?auto_110064 ) ) ( not ( = ?auto_110062 ?auto_110063 ) ) ( not ( = ?auto_110062 ?auto_110064 ) ) ( not ( = ?auto_110063 ?auto_110064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110064 ?auto_110063 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110065 - BLOCK
      ?auto_110066 - BLOCK
      ?auto_110067 - BLOCK
      ?auto_110068 - BLOCK
      ?auto_110069 - BLOCK
    )
    :vars
    (
      ?auto_110070 - BLOCK
      ?auto_110071 - BLOCK
      ?auto_110072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110070 ?auto_110069 ) ( CLEAR ?auto_110070 ) ( ON-TABLE ?auto_110065 ) ( ON ?auto_110066 ?auto_110065 ) ( ON ?auto_110067 ?auto_110066 ) ( ON ?auto_110068 ?auto_110067 ) ( ON ?auto_110069 ?auto_110068 ) ( not ( = ?auto_110065 ?auto_110066 ) ) ( not ( = ?auto_110065 ?auto_110067 ) ) ( not ( = ?auto_110065 ?auto_110068 ) ) ( not ( = ?auto_110065 ?auto_110069 ) ) ( not ( = ?auto_110065 ?auto_110070 ) ) ( not ( = ?auto_110066 ?auto_110067 ) ) ( not ( = ?auto_110066 ?auto_110068 ) ) ( not ( = ?auto_110066 ?auto_110069 ) ) ( not ( = ?auto_110066 ?auto_110070 ) ) ( not ( = ?auto_110067 ?auto_110068 ) ) ( not ( = ?auto_110067 ?auto_110069 ) ) ( not ( = ?auto_110067 ?auto_110070 ) ) ( not ( = ?auto_110068 ?auto_110069 ) ) ( not ( = ?auto_110068 ?auto_110070 ) ) ( not ( = ?auto_110069 ?auto_110070 ) ) ( HOLDING ?auto_110071 ) ( CLEAR ?auto_110072 ) ( not ( = ?auto_110065 ?auto_110071 ) ) ( not ( = ?auto_110065 ?auto_110072 ) ) ( not ( = ?auto_110066 ?auto_110071 ) ) ( not ( = ?auto_110066 ?auto_110072 ) ) ( not ( = ?auto_110067 ?auto_110071 ) ) ( not ( = ?auto_110067 ?auto_110072 ) ) ( not ( = ?auto_110068 ?auto_110071 ) ) ( not ( = ?auto_110068 ?auto_110072 ) ) ( not ( = ?auto_110069 ?auto_110071 ) ) ( not ( = ?auto_110069 ?auto_110072 ) ) ( not ( = ?auto_110070 ?auto_110071 ) ) ( not ( = ?auto_110070 ?auto_110072 ) ) ( not ( = ?auto_110071 ?auto_110072 ) ) )
    :subtasks
    ( ( !STACK ?auto_110071 ?auto_110072 )
      ( MAKE-5PILE ?auto_110065 ?auto_110066 ?auto_110067 ?auto_110068 ?auto_110069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110073 - BLOCK
      ?auto_110074 - BLOCK
      ?auto_110075 - BLOCK
      ?auto_110076 - BLOCK
      ?auto_110077 - BLOCK
    )
    :vars
    (
      ?auto_110079 - BLOCK
      ?auto_110080 - BLOCK
      ?auto_110078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110079 ?auto_110077 ) ( ON-TABLE ?auto_110073 ) ( ON ?auto_110074 ?auto_110073 ) ( ON ?auto_110075 ?auto_110074 ) ( ON ?auto_110076 ?auto_110075 ) ( ON ?auto_110077 ?auto_110076 ) ( not ( = ?auto_110073 ?auto_110074 ) ) ( not ( = ?auto_110073 ?auto_110075 ) ) ( not ( = ?auto_110073 ?auto_110076 ) ) ( not ( = ?auto_110073 ?auto_110077 ) ) ( not ( = ?auto_110073 ?auto_110079 ) ) ( not ( = ?auto_110074 ?auto_110075 ) ) ( not ( = ?auto_110074 ?auto_110076 ) ) ( not ( = ?auto_110074 ?auto_110077 ) ) ( not ( = ?auto_110074 ?auto_110079 ) ) ( not ( = ?auto_110075 ?auto_110076 ) ) ( not ( = ?auto_110075 ?auto_110077 ) ) ( not ( = ?auto_110075 ?auto_110079 ) ) ( not ( = ?auto_110076 ?auto_110077 ) ) ( not ( = ?auto_110076 ?auto_110079 ) ) ( not ( = ?auto_110077 ?auto_110079 ) ) ( CLEAR ?auto_110080 ) ( not ( = ?auto_110073 ?auto_110078 ) ) ( not ( = ?auto_110073 ?auto_110080 ) ) ( not ( = ?auto_110074 ?auto_110078 ) ) ( not ( = ?auto_110074 ?auto_110080 ) ) ( not ( = ?auto_110075 ?auto_110078 ) ) ( not ( = ?auto_110075 ?auto_110080 ) ) ( not ( = ?auto_110076 ?auto_110078 ) ) ( not ( = ?auto_110076 ?auto_110080 ) ) ( not ( = ?auto_110077 ?auto_110078 ) ) ( not ( = ?auto_110077 ?auto_110080 ) ) ( not ( = ?auto_110079 ?auto_110078 ) ) ( not ( = ?auto_110079 ?auto_110080 ) ) ( not ( = ?auto_110078 ?auto_110080 ) ) ( ON ?auto_110078 ?auto_110079 ) ( CLEAR ?auto_110078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110073 ?auto_110074 ?auto_110075 ?auto_110076 ?auto_110077 ?auto_110079 )
      ( MAKE-5PILE ?auto_110073 ?auto_110074 ?auto_110075 ?auto_110076 ?auto_110077 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110081 - BLOCK
      ?auto_110082 - BLOCK
      ?auto_110083 - BLOCK
      ?auto_110084 - BLOCK
      ?auto_110085 - BLOCK
    )
    :vars
    (
      ?auto_110086 - BLOCK
      ?auto_110088 - BLOCK
      ?auto_110087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110086 ?auto_110085 ) ( ON-TABLE ?auto_110081 ) ( ON ?auto_110082 ?auto_110081 ) ( ON ?auto_110083 ?auto_110082 ) ( ON ?auto_110084 ?auto_110083 ) ( ON ?auto_110085 ?auto_110084 ) ( not ( = ?auto_110081 ?auto_110082 ) ) ( not ( = ?auto_110081 ?auto_110083 ) ) ( not ( = ?auto_110081 ?auto_110084 ) ) ( not ( = ?auto_110081 ?auto_110085 ) ) ( not ( = ?auto_110081 ?auto_110086 ) ) ( not ( = ?auto_110082 ?auto_110083 ) ) ( not ( = ?auto_110082 ?auto_110084 ) ) ( not ( = ?auto_110082 ?auto_110085 ) ) ( not ( = ?auto_110082 ?auto_110086 ) ) ( not ( = ?auto_110083 ?auto_110084 ) ) ( not ( = ?auto_110083 ?auto_110085 ) ) ( not ( = ?auto_110083 ?auto_110086 ) ) ( not ( = ?auto_110084 ?auto_110085 ) ) ( not ( = ?auto_110084 ?auto_110086 ) ) ( not ( = ?auto_110085 ?auto_110086 ) ) ( not ( = ?auto_110081 ?auto_110088 ) ) ( not ( = ?auto_110081 ?auto_110087 ) ) ( not ( = ?auto_110082 ?auto_110088 ) ) ( not ( = ?auto_110082 ?auto_110087 ) ) ( not ( = ?auto_110083 ?auto_110088 ) ) ( not ( = ?auto_110083 ?auto_110087 ) ) ( not ( = ?auto_110084 ?auto_110088 ) ) ( not ( = ?auto_110084 ?auto_110087 ) ) ( not ( = ?auto_110085 ?auto_110088 ) ) ( not ( = ?auto_110085 ?auto_110087 ) ) ( not ( = ?auto_110086 ?auto_110088 ) ) ( not ( = ?auto_110086 ?auto_110087 ) ) ( not ( = ?auto_110088 ?auto_110087 ) ) ( ON ?auto_110088 ?auto_110086 ) ( CLEAR ?auto_110088 ) ( HOLDING ?auto_110087 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110087 )
      ( MAKE-5PILE ?auto_110081 ?auto_110082 ?auto_110083 ?auto_110084 ?auto_110085 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110089 - BLOCK
      ?auto_110090 - BLOCK
      ?auto_110091 - BLOCK
      ?auto_110092 - BLOCK
      ?auto_110093 - BLOCK
    )
    :vars
    (
      ?auto_110094 - BLOCK
      ?auto_110095 - BLOCK
      ?auto_110096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110094 ?auto_110093 ) ( ON-TABLE ?auto_110089 ) ( ON ?auto_110090 ?auto_110089 ) ( ON ?auto_110091 ?auto_110090 ) ( ON ?auto_110092 ?auto_110091 ) ( ON ?auto_110093 ?auto_110092 ) ( not ( = ?auto_110089 ?auto_110090 ) ) ( not ( = ?auto_110089 ?auto_110091 ) ) ( not ( = ?auto_110089 ?auto_110092 ) ) ( not ( = ?auto_110089 ?auto_110093 ) ) ( not ( = ?auto_110089 ?auto_110094 ) ) ( not ( = ?auto_110090 ?auto_110091 ) ) ( not ( = ?auto_110090 ?auto_110092 ) ) ( not ( = ?auto_110090 ?auto_110093 ) ) ( not ( = ?auto_110090 ?auto_110094 ) ) ( not ( = ?auto_110091 ?auto_110092 ) ) ( not ( = ?auto_110091 ?auto_110093 ) ) ( not ( = ?auto_110091 ?auto_110094 ) ) ( not ( = ?auto_110092 ?auto_110093 ) ) ( not ( = ?auto_110092 ?auto_110094 ) ) ( not ( = ?auto_110093 ?auto_110094 ) ) ( not ( = ?auto_110089 ?auto_110095 ) ) ( not ( = ?auto_110089 ?auto_110096 ) ) ( not ( = ?auto_110090 ?auto_110095 ) ) ( not ( = ?auto_110090 ?auto_110096 ) ) ( not ( = ?auto_110091 ?auto_110095 ) ) ( not ( = ?auto_110091 ?auto_110096 ) ) ( not ( = ?auto_110092 ?auto_110095 ) ) ( not ( = ?auto_110092 ?auto_110096 ) ) ( not ( = ?auto_110093 ?auto_110095 ) ) ( not ( = ?auto_110093 ?auto_110096 ) ) ( not ( = ?auto_110094 ?auto_110095 ) ) ( not ( = ?auto_110094 ?auto_110096 ) ) ( not ( = ?auto_110095 ?auto_110096 ) ) ( ON ?auto_110095 ?auto_110094 ) ( ON ?auto_110096 ?auto_110095 ) ( CLEAR ?auto_110096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110089 ?auto_110090 ?auto_110091 ?auto_110092 ?auto_110093 ?auto_110094 ?auto_110095 )
      ( MAKE-5PILE ?auto_110089 ?auto_110090 ?auto_110091 ?auto_110092 ?auto_110093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110100 - BLOCK
      ?auto_110101 - BLOCK
      ?auto_110102 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_110102 ) ( CLEAR ?auto_110101 ) ( ON-TABLE ?auto_110100 ) ( ON ?auto_110101 ?auto_110100 ) ( not ( = ?auto_110100 ?auto_110101 ) ) ( not ( = ?auto_110100 ?auto_110102 ) ) ( not ( = ?auto_110101 ?auto_110102 ) ) )
    :subtasks
    ( ( !STACK ?auto_110102 ?auto_110101 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110103 - BLOCK
      ?auto_110104 - BLOCK
      ?auto_110105 - BLOCK
    )
    :vars
    (
      ?auto_110106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_110104 ) ( ON-TABLE ?auto_110103 ) ( ON ?auto_110104 ?auto_110103 ) ( not ( = ?auto_110103 ?auto_110104 ) ) ( not ( = ?auto_110103 ?auto_110105 ) ) ( not ( = ?auto_110104 ?auto_110105 ) ) ( ON ?auto_110105 ?auto_110106 ) ( CLEAR ?auto_110105 ) ( HAND-EMPTY ) ( not ( = ?auto_110103 ?auto_110106 ) ) ( not ( = ?auto_110104 ?auto_110106 ) ) ( not ( = ?auto_110105 ?auto_110106 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110105 ?auto_110106 )
      ( MAKE-3PILE ?auto_110103 ?auto_110104 ?auto_110105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110107 - BLOCK
      ?auto_110108 - BLOCK
      ?auto_110109 - BLOCK
    )
    :vars
    (
      ?auto_110110 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110107 ) ( not ( = ?auto_110107 ?auto_110108 ) ) ( not ( = ?auto_110107 ?auto_110109 ) ) ( not ( = ?auto_110108 ?auto_110109 ) ) ( ON ?auto_110109 ?auto_110110 ) ( CLEAR ?auto_110109 ) ( not ( = ?auto_110107 ?auto_110110 ) ) ( not ( = ?auto_110108 ?auto_110110 ) ) ( not ( = ?auto_110109 ?auto_110110 ) ) ( HOLDING ?auto_110108 ) ( CLEAR ?auto_110107 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110107 ?auto_110108 )
      ( MAKE-3PILE ?auto_110107 ?auto_110108 ?auto_110109 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110111 - BLOCK
      ?auto_110112 - BLOCK
      ?auto_110113 - BLOCK
    )
    :vars
    (
      ?auto_110114 - BLOCK
      ?auto_110118 - BLOCK
      ?auto_110116 - BLOCK
      ?auto_110117 - BLOCK
      ?auto_110115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110111 ) ( not ( = ?auto_110111 ?auto_110112 ) ) ( not ( = ?auto_110111 ?auto_110113 ) ) ( not ( = ?auto_110112 ?auto_110113 ) ) ( ON ?auto_110113 ?auto_110114 ) ( not ( = ?auto_110111 ?auto_110114 ) ) ( not ( = ?auto_110112 ?auto_110114 ) ) ( not ( = ?auto_110113 ?auto_110114 ) ) ( CLEAR ?auto_110111 ) ( ON ?auto_110112 ?auto_110113 ) ( CLEAR ?auto_110112 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110118 ) ( ON ?auto_110116 ?auto_110118 ) ( ON ?auto_110117 ?auto_110116 ) ( ON ?auto_110115 ?auto_110117 ) ( ON ?auto_110114 ?auto_110115 ) ( not ( = ?auto_110118 ?auto_110116 ) ) ( not ( = ?auto_110118 ?auto_110117 ) ) ( not ( = ?auto_110118 ?auto_110115 ) ) ( not ( = ?auto_110118 ?auto_110114 ) ) ( not ( = ?auto_110118 ?auto_110113 ) ) ( not ( = ?auto_110118 ?auto_110112 ) ) ( not ( = ?auto_110116 ?auto_110117 ) ) ( not ( = ?auto_110116 ?auto_110115 ) ) ( not ( = ?auto_110116 ?auto_110114 ) ) ( not ( = ?auto_110116 ?auto_110113 ) ) ( not ( = ?auto_110116 ?auto_110112 ) ) ( not ( = ?auto_110117 ?auto_110115 ) ) ( not ( = ?auto_110117 ?auto_110114 ) ) ( not ( = ?auto_110117 ?auto_110113 ) ) ( not ( = ?auto_110117 ?auto_110112 ) ) ( not ( = ?auto_110115 ?auto_110114 ) ) ( not ( = ?auto_110115 ?auto_110113 ) ) ( not ( = ?auto_110115 ?auto_110112 ) ) ( not ( = ?auto_110111 ?auto_110118 ) ) ( not ( = ?auto_110111 ?auto_110116 ) ) ( not ( = ?auto_110111 ?auto_110117 ) ) ( not ( = ?auto_110111 ?auto_110115 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110118 ?auto_110116 ?auto_110117 ?auto_110115 ?auto_110114 ?auto_110113 )
      ( MAKE-3PILE ?auto_110111 ?auto_110112 ?auto_110113 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110119 - BLOCK
      ?auto_110120 - BLOCK
      ?auto_110121 - BLOCK
    )
    :vars
    (
      ?auto_110125 - BLOCK
      ?auto_110122 - BLOCK
      ?auto_110126 - BLOCK
      ?auto_110124 - BLOCK
      ?auto_110123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110119 ?auto_110120 ) ) ( not ( = ?auto_110119 ?auto_110121 ) ) ( not ( = ?auto_110120 ?auto_110121 ) ) ( ON ?auto_110121 ?auto_110125 ) ( not ( = ?auto_110119 ?auto_110125 ) ) ( not ( = ?auto_110120 ?auto_110125 ) ) ( not ( = ?auto_110121 ?auto_110125 ) ) ( ON ?auto_110120 ?auto_110121 ) ( CLEAR ?auto_110120 ) ( ON-TABLE ?auto_110122 ) ( ON ?auto_110126 ?auto_110122 ) ( ON ?auto_110124 ?auto_110126 ) ( ON ?auto_110123 ?auto_110124 ) ( ON ?auto_110125 ?auto_110123 ) ( not ( = ?auto_110122 ?auto_110126 ) ) ( not ( = ?auto_110122 ?auto_110124 ) ) ( not ( = ?auto_110122 ?auto_110123 ) ) ( not ( = ?auto_110122 ?auto_110125 ) ) ( not ( = ?auto_110122 ?auto_110121 ) ) ( not ( = ?auto_110122 ?auto_110120 ) ) ( not ( = ?auto_110126 ?auto_110124 ) ) ( not ( = ?auto_110126 ?auto_110123 ) ) ( not ( = ?auto_110126 ?auto_110125 ) ) ( not ( = ?auto_110126 ?auto_110121 ) ) ( not ( = ?auto_110126 ?auto_110120 ) ) ( not ( = ?auto_110124 ?auto_110123 ) ) ( not ( = ?auto_110124 ?auto_110125 ) ) ( not ( = ?auto_110124 ?auto_110121 ) ) ( not ( = ?auto_110124 ?auto_110120 ) ) ( not ( = ?auto_110123 ?auto_110125 ) ) ( not ( = ?auto_110123 ?auto_110121 ) ) ( not ( = ?auto_110123 ?auto_110120 ) ) ( not ( = ?auto_110119 ?auto_110122 ) ) ( not ( = ?auto_110119 ?auto_110126 ) ) ( not ( = ?auto_110119 ?auto_110124 ) ) ( not ( = ?auto_110119 ?auto_110123 ) ) ( HOLDING ?auto_110119 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110119 )
      ( MAKE-3PILE ?auto_110119 ?auto_110120 ?auto_110121 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110127 - BLOCK
      ?auto_110128 - BLOCK
      ?auto_110129 - BLOCK
    )
    :vars
    (
      ?auto_110134 - BLOCK
      ?auto_110130 - BLOCK
      ?auto_110132 - BLOCK
      ?auto_110131 - BLOCK
      ?auto_110133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110127 ?auto_110128 ) ) ( not ( = ?auto_110127 ?auto_110129 ) ) ( not ( = ?auto_110128 ?auto_110129 ) ) ( ON ?auto_110129 ?auto_110134 ) ( not ( = ?auto_110127 ?auto_110134 ) ) ( not ( = ?auto_110128 ?auto_110134 ) ) ( not ( = ?auto_110129 ?auto_110134 ) ) ( ON ?auto_110128 ?auto_110129 ) ( ON-TABLE ?auto_110130 ) ( ON ?auto_110132 ?auto_110130 ) ( ON ?auto_110131 ?auto_110132 ) ( ON ?auto_110133 ?auto_110131 ) ( ON ?auto_110134 ?auto_110133 ) ( not ( = ?auto_110130 ?auto_110132 ) ) ( not ( = ?auto_110130 ?auto_110131 ) ) ( not ( = ?auto_110130 ?auto_110133 ) ) ( not ( = ?auto_110130 ?auto_110134 ) ) ( not ( = ?auto_110130 ?auto_110129 ) ) ( not ( = ?auto_110130 ?auto_110128 ) ) ( not ( = ?auto_110132 ?auto_110131 ) ) ( not ( = ?auto_110132 ?auto_110133 ) ) ( not ( = ?auto_110132 ?auto_110134 ) ) ( not ( = ?auto_110132 ?auto_110129 ) ) ( not ( = ?auto_110132 ?auto_110128 ) ) ( not ( = ?auto_110131 ?auto_110133 ) ) ( not ( = ?auto_110131 ?auto_110134 ) ) ( not ( = ?auto_110131 ?auto_110129 ) ) ( not ( = ?auto_110131 ?auto_110128 ) ) ( not ( = ?auto_110133 ?auto_110134 ) ) ( not ( = ?auto_110133 ?auto_110129 ) ) ( not ( = ?auto_110133 ?auto_110128 ) ) ( not ( = ?auto_110127 ?auto_110130 ) ) ( not ( = ?auto_110127 ?auto_110132 ) ) ( not ( = ?auto_110127 ?auto_110131 ) ) ( not ( = ?auto_110127 ?auto_110133 ) ) ( ON ?auto_110127 ?auto_110128 ) ( CLEAR ?auto_110127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110130 ?auto_110132 ?auto_110131 ?auto_110133 ?auto_110134 ?auto_110129 ?auto_110128 )
      ( MAKE-3PILE ?auto_110127 ?auto_110128 ?auto_110129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110139 - BLOCK
      ?auto_110140 - BLOCK
      ?auto_110141 - BLOCK
      ?auto_110142 - BLOCK
    )
    :vars
    (
      ?auto_110143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110143 ?auto_110142 ) ( CLEAR ?auto_110143 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110139 ) ( ON ?auto_110140 ?auto_110139 ) ( ON ?auto_110141 ?auto_110140 ) ( ON ?auto_110142 ?auto_110141 ) ( not ( = ?auto_110139 ?auto_110140 ) ) ( not ( = ?auto_110139 ?auto_110141 ) ) ( not ( = ?auto_110139 ?auto_110142 ) ) ( not ( = ?auto_110139 ?auto_110143 ) ) ( not ( = ?auto_110140 ?auto_110141 ) ) ( not ( = ?auto_110140 ?auto_110142 ) ) ( not ( = ?auto_110140 ?auto_110143 ) ) ( not ( = ?auto_110141 ?auto_110142 ) ) ( not ( = ?auto_110141 ?auto_110143 ) ) ( not ( = ?auto_110142 ?auto_110143 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110143 ?auto_110142 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110144 - BLOCK
      ?auto_110145 - BLOCK
      ?auto_110146 - BLOCK
      ?auto_110147 - BLOCK
    )
    :vars
    (
      ?auto_110148 - BLOCK
      ?auto_110149 - BLOCK
      ?auto_110150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110148 ?auto_110147 ) ( CLEAR ?auto_110148 ) ( ON-TABLE ?auto_110144 ) ( ON ?auto_110145 ?auto_110144 ) ( ON ?auto_110146 ?auto_110145 ) ( ON ?auto_110147 ?auto_110146 ) ( not ( = ?auto_110144 ?auto_110145 ) ) ( not ( = ?auto_110144 ?auto_110146 ) ) ( not ( = ?auto_110144 ?auto_110147 ) ) ( not ( = ?auto_110144 ?auto_110148 ) ) ( not ( = ?auto_110145 ?auto_110146 ) ) ( not ( = ?auto_110145 ?auto_110147 ) ) ( not ( = ?auto_110145 ?auto_110148 ) ) ( not ( = ?auto_110146 ?auto_110147 ) ) ( not ( = ?auto_110146 ?auto_110148 ) ) ( not ( = ?auto_110147 ?auto_110148 ) ) ( HOLDING ?auto_110149 ) ( CLEAR ?auto_110150 ) ( not ( = ?auto_110144 ?auto_110149 ) ) ( not ( = ?auto_110144 ?auto_110150 ) ) ( not ( = ?auto_110145 ?auto_110149 ) ) ( not ( = ?auto_110145 ?auto_110150 ) ) ( not ( = ?auto_110146 ?auto_110149 ) ) ( not ( = ?auto_110146 ?auto_110150 ) ) ( not ( = ?auto_110147 ?auto_110149 ) ) ( not ( = ?auto_110147 ?auto_110150 ) ) ( not ( = ?auto_110148 ?auto_110149 ) ) ( not ( = ?auto_110148 ?auto_110150 ) ) ( not ( = ?auto_110149 ?auto_110150 ) ) )
    :subtasks
    ( ( !STACK ?auto_110149 ?auto_110150 )
      ( MAKE-4PILE ?auto_110144 ?auto_110145 ?auto_110146 ?auto_110147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110151 - BLOCK
      ?auto_110152 - BLOCK
      ?auto_110153 - BLOCK
      ?auto_110154 - BLOCK
    )
    :vars
    (
      ?auto_110156 - BLOCK
      ?auto_110157 - BLOCK
      ?auto_110155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110156 ?auto_110154 ) ( ON-TABLE ?auto_110151 ) ( ON ?auto_110152 ?auto_110151 ) ( ON ?auto_110153 ?auto_110152 ) ( ON ?auto_110154 ?auto_110153 ) ( not ( = ?auto_110151 ?auto_110152 ) ) ( not ( = ?auto_110151 ?auto_110153 ) ) ( not ( = ?auto_110151 ?auto_110154 ) ) ( not ( = ?auto_110151 ?auto_110156 ) ) ( not ( = ?auto_110152 ?auto_110153 ) ) ( not ( = ?auto_110152 ?auto_110154 ) ) ( not ( = ?auto_110152 ?auto_110156 ) ) ( not ( = ?auto_110153 ?auto_110154 ) ) ( not ( = ?auto_110153 ?auto_110156 ) ) ( not ( = ?auto_110154 ?auto_110156 ) ) ( CLEAR ?auto_110157 ) ( not ( = ?auto_110151 ?auto_110155 ) ) ( not ( = ?auto_110151 ?auto_110157 ) ) ( not ( = ?auto_110152 ?auto_110155 ) ) ( not ( = ?auto_110152 ?auto_110157 ) ) ( not ( = ?auto_110153 ?auto_110155 ) ) ( not ( = ?auto_110153 ?auto_110157 ) ) ( not ( = ?auto_110154 ?auto_110155 ) ) ( not ( = ?auto_110154 ?auto_110157 ) ) ( not ( = ?auto_110156 ?auto_110155 ) ) ( not ( = ?auto_110156 ?auto_110157 ) ) ( not ( = ?auto_110155 ?auto_110157 ) ) ( ON ?auto_110155 ?auto_110156 ) ( CLEAR ?auto_110155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110151 ?auto_110152 ?auto_110153 ?auto_110154 ?auto_110156 )
      ( MAKE-4PILE ?auto_110151 ?auto_110152 ?auto_110153 ?auto_110154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110158 - BLOCK
      ?auto_110159 - BLOCK
      ?auto_110160 - BLOCK
      ?auto_110161 - BLOCK
    )
    :vars
    (
      ?auto_110164 - BLOCK
      ?auto_110163 - BLOCK
      ?auto_110162 - BLOCK
      ?auto_110165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110164 ?auto_110161 ) ( ON-TABLE ?auto_110158 ) ( ON ?auto_110159 ?auto_110158 ) ( ON ?auto_110160 ?auto_110159 ) ( ON ?auto_110161 ?auto_110160 ) ( not ( = ?auto_110158 ?auto_110159 ) ) ( not ( = ?auto_110158 ?auto_110160 ) ) ( not ( = ?auto_110158 ?auto_110161 ) ) ( not ( = ?auto_110158 ?auto_110164 ) ) ( not ( = ?auto_110159 ?auto_110160 ) ) ( not ( = ?auto_110159 ?auto_110161 ) ) ( not ( = ?auto_110159 ?auto_110164 ) ) ( not ( = ?auto_110160 ?auto_110161 ) ) ( not ( = ?auto_110160 ?auto_110164 ) ) ( not ( = ?auto_110161 ?auto_110164 ) ) ( not ( = ?auto_110158 ?auto_110163 ) ) ( not ( = ?auto_110158 ?auto_110162 ) ) ( not ( = ?auto_110159 ?auto_110163 ) ) ( not ( = ?auto_110159 ?auto_110162 ) ) ( not ( = ?auto_110160 ?auto_110163 ) ) ( not ( = ?auto_110160 ?auto_110162 ) ) ( not ( = ?auto_110161 ?auto_110163 ) ) ( not ( = ?auto_110161 ?auto_110162 ) ) ( not ( = ?auto_110164 ?auto_110163 ) ) ( not ( = ?auto_110164 ?auto_110162 ) ) ( not ( = ?auto_110163 ?auto_110162 ) ) ( ON ?auto_110163 ?auto_110164 ) ( CLEAR ?auto_110163 ) ( HOLDING ?auto_110162 ) ( CLEAR ?auto_110165 ) ( ON-TABLE ?auto_110165 ) ( not ( = ?auto_110165 ?auto_110162 ) ) ( not ( = ?auto_110158 ?auto_110165 ) ) ( not ( = ?auto_110159 ?auto_110165 ) ) ( not ( = ?auto_110160 ?auto_110165 ) ) ( not ( = ?auto_110161 ?auto_110165 ) ) ( not ( = ?auto_110164 ?auto_110165 ) ) ( not ( = ?auto_110163 ?auto_110165 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110165 ?auto_110162 )
      ( MAKE-4PILE ?auto_110158 ?auto_110159 ?auto_110160 ?auto_110161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110166 - BLOCK
      ?auto_110167 - BLOCK
      ?auto_110168 - BLOCK
      ?auto_110169 - BLOCK
    )
    :vars
    (
      ?auto_110171 - BLOCK
      ?auto_110172 - BLOCK
      ?auto_110170 - BLOCK
      ?auto_110173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110171 ?auto_110169 ) ( ON-TABLE ?auto_110166 ) ( ON ?auto_110167 ?auto_110166 ) ( ON ?auto_110168 ?auto_110167 ) ( ON ?auto_110169 ?auto_110168 ) ( not ( = ?auto_110166 ?auto_110167 ) ) ( not ( = ?auto_110166 ?auto_110168 ) ) ( not ( = ?auto_110166 ?auto_110169 ) ) ( not ( = ?auto_110166 ?auto_110171 ) ) ( not ( = ?auto_110167 ?auto_110168 ) ) ( not ( = ?auto_110167 ?auto_110169 ) ) ( not ( = ?auto_110167 ?auto_110171 ) ) ( not ( = ?auto_110168 ?auto_110169 ) ) ( not ( = ?auto_110168 ?auto_110171 ) ) ( not ( = ?auto_110169 ?auto_110171 ) ) ( not ( = ?auto_110166 ?auto_110172 ) ) ( not ( = ?auto_110166 ?auto_110170 ) ) ( not ( = ?auto_110167 ?auto_110172 ) ) ( not ( = ?auto_110167 ?auto_110170 ) ) ( not ( = ?auto_110168 ?auto_110172 ) ) ( not ( = ?auto_110168 ?auto_110170 ) ) ( not ( = ?auto_110169 ?auto_110172 ) ) ( not ( = ?auto_110169 ?auto_110170 ) ) ( not ( = ?auto_110171 ?auto_110172 ) ) ( not ( = ?auto_110171 ?auto_110170 ) ) ( not ( = ?auto_110172 ?auto_110170 ) ) ( ON ?auto_110172 ?auto_110171 ) ( CLEAR ?auto_110173 ) ( ON-TABLE ?auto_110173 ) ( not ( = ?auto_110173 ?auto_110170 ) ) ( not ( = ?auto_110166 ?auto_110173 ) ) ( not ( = ?auto_110167 ?auto_110173 ) ) ( not ( = ?auto_110168 ?auto_110173 ) ) ( not ( = ?auto_110169 ?auto_110173 ) ) ( not ( = ?auto_110171 ?auto_110173 ) ) ( not ( = ?auto_110172 ?auto_110173 ) ) ( ON ?auto_110170 ?auto_110172 ) ( CLEAR ?auto_110170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110166 ?auto_110167 ?auto_110168 ?auto_110169 ?auto_110171 ?auto_110172 )
      ( MAKE-4PILE ?auto_110166 ?auto_110167 ?auto_110168 ?auto_110169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110174 - BLOCK
      ?auto_110175 - BLOCK
      ?auto_110176 - BLOCK
      ?auto_110177 - BLOCK
    )
    :vars
    (
      ?auto_110178 - BLOCK
      ?auto_110179 - BLOCK
      ?auto_110180 - BLOCK
      ?auto_110181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110178 ?auto_110177 ) ( ON-TABLE ?auto_110174 ) ( ON ?auto_110175 ?auto_110174 ) ( ON ?auto_110176 ?auto_110175 ) ( ON ?auto_110177 ?auto_110176 ) ( not ( = ?auto_110174 ?auto_110175 ) ) ( not ( = ?auto_110174 ?auto_110176 ) ) ( not ( = ?auto_110174 ?auto_110177 ) ) ( not ( = ?auto_110174 ?auto_110178 ) ) ( not ( = ?auto_110175 ?auto_110176 ) ) ( not ( = ?auto_110175 ?auto_110177 ) ) ( not ( = ?auto_110175 ?auto_110178 ) ) ( not ( = ?auto_110176 ?auto_110177 ) ) ( not ( = ?auto_110176 ?auto_110178 ) ) ( not ( = ?auto_110177 ?auto_110178 ) ) ( not ( = ?auto_110174 ?auto_110179 ) ) ( not ( = ?auto_110174 ?auto_110180 ) ) ( not ( = ?auto_110175 ?auto_110179 ) ) ( not ( = ?auto_110175 ?auto_110180 ) ) ( not ( = ?auto_110176 ?auto_110179 ) ) ( not ( = ?auto_110176 ?auto_110180 ) ) ( not ( = ?auto_110177 ?auto_110179 ) ) ( not ( = ?auto_110177 ?auto_110180 ) ) ( not ( = ?auto_110178 ?auto_110179 ) ) ( not ( = ?auto_110178 ?auto_110180 ) ) ( not ( = ?auto_110179 ?auto_110180 ) ) ( ON ?auto_110179 ?auto_110178 ) ( not ( = ?auto_110181 ?auto_110180 ) ) ( not ( = ?auto_110174 ?auto_110181 ) ) ( not ( = ?auto_110175 ?auto_110181 ) ) ( not ( = ?auto_110176 ?auto_110181 ) ) ( not ( = ?auto_110177 ?auto_110181 ) ) ( not ( = ?auto_110178 ?auto_110181 ) ) ( not ( = ?auto_110179 ?auto_110181 ) ) ( ON ?auto_110180 ?auto_110179 ) ( CLEAR ?auto_110180 ) ( HOLDING ?auto_110181 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110181 )
      ( MAKE-4PILE ?auto_110174 ?auto_110175 ?auto_110176 ?auto_110177 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110182 - BLOCK
      ?auto_110183 - BLOCK
      ?auto_110184 - BLOCK
      ?auto_110185 - BLOCK
    )
    :vars
    (
      ?auto_110188 - BLOCK
      ?auto_110187 - BLOCK
      ?auto_110186 - BLOCK
      ?auto_110189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110188 ?auto_110185 ) ( ON-TABLE ?auto_110182 ) ( ON ?auto_110183 ?auto_110182 ) ( ON ?auto_110184 ?auto_110183 ) ( ON ?auto_110185 ?auto_110184 ) ( not ( = ?auto_110182 ?auto_110183 ) ) ( not ( = ?auto_110182 ?auto_110184 ) ) ( not ( = ?auto_110182 ?auto_110185 ) ) ( not ( = ?auto_110182 ?auto_110188 ) ) ( not ( = ?auto_110183 ?auto_110184 ) ) ( not ( = ?auto_110183 ?auto_110185 ) ) ( not ( = ?auto_110183 ?auto_110188 ) ) ( not ( = ?auto_110184 ?auto_110185 ) ) ( not ( = ?auto_110184 ?auto_110188 ) ) ( not ( = ?auto_110185 ?auto_110188 ) ) ( not ( = ?auto_110182 ?auto_110187 ) ) ( not ( = ?auto_110182 ?auto_110186 ) ) ( not ( = ?auto_110183 ?auto_110187 ) ) ( not ( = ?auto_110183 ?auto_110186 ) ) ( not ( = ?auto_110184 ?auto_110187 ) ) ( not ( = ?auto_110184 ?auto_110186 ) ) ( not ( = ?auto_110185 ?auto_110187 ) ) ( not ( = ?auto_110185 ?auto_110186 ) ) ( not ( = ?auto_110188 ?auto_110187 ) ) ( not ( = ?auto_110188 ?auto_110186 ) ) ( not ( = ?auto_110187 ?auto_110186 ) ) ( ON ?auto_110187 ?auto_110188 ) ( not ( = ?auto_110189 ?auto_110186 ) ) ( not ( = ?auto_110182 ?auto_110189 ) ) ( not ( = ?auto_110183 ?auto_110189 ) ) ( not ( = ?auto_110184 ?auto_110189 ) ) ( not ( = ?auto_110185 ?auto_110189 ) ) ( not ( = ?auto_110188 ?auto_110189 ) ) ( not ( = ?auto_110187 ?auto_110189 ) ) ( ON ?auto_110186 ?auto_110187 ) ( ON ?auto_110189 ?auto_110186 ) ( CLEAR ?auto_110189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110182 ?auto_110183 ?auto_110184 ?auto_110185 ?auto_110188 ?auto_110187 ?auto_110186 )
      ( MAKE-4PILE ?auto_110182 ?auto_110183 ?auto_110184 ?auto_110185 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110194 - BLOCK
      ?auto_110195 - BLOCK
      ?auto_110196 - BLOCK
      ?auto_110197 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_110197 ) ( CLEAR ?auto_110196 ) ( ON-TABLE ?auto_110194 ) ( ON ?auto_110195 ?auto_110194 ) ( ON ?auto_110196 ?auto_110195 ) ( not ( = ?auto_110194 ?auto_110195 ) ) ( not ( = ?auto_110194 ?auto_110196 ) ) ( not ( = ?auto_110194 ?auto_110197 ) ) ( not ( = ?auto_110195 ?auto_110196 ) ) ( not ( = ?auto_110195 ?auto_110197 ) ) ( not ( = ?auto_110196 ?auto_110197 ) ) )
    :subtasks
    ( ( !STACK ?auto_110197 ?auto_110196 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110198 - BLOCK
      ?auto_110199 - BLOCK
      ?auto_110200 - BLOCK
      ?auto_110201 - BLOCK
    )
    :vars
    (
      ?auto_110202 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_110200 ) ( ON-TABLE ?auto_110198 ) ( ON ?auto_110199 ?auto_110198 ) ( ON ?auto_110200 ?auto_110199 ) ( not ( = ?auto_110198 ?auto_110199 ) ) ( not ( = ?auto_110198 ?auto_110200 ) ) ( not ( = ?auto_110198 ?auto_110201 ) ) ( not ( = ?auto_110199 ?auto_110200 ) ) ( not ( = ?auto_110199 ?auto_110201 ) ) ( not ( = ?auto_110200 ?auto_110201 ) ) ( ON ?auto_110201 ?auto_110202 ) ( CLEAR ?auto_110201 ) ( HAND-EMPTY ) ( not ( = ?auto_110198 ?auto_110202 ) ) ( not ( = ?auto_110199 ?auto_110202 ) ) ( not ( = ?auto_110200 ?auto_110202 ) ) ( not ( = ?auto_110201 ?auto_110202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110201 ?auto_110202 )
      ( MAKE-4PILE ?auto_110198 ?auto_110199 ?auto_110200 ?auto_110201 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110203 - BLOCK
      ?auto_110204 - BLOCK
      ?auto_110205 - BLOCK
      ?auto_110206 - BLOCK
    )
    :vars
    (
      ?auto_110207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110203 ) ( ON ?auto_110204 ?auto_110203 ) ( not ( = ?auto_110203 ?auto_110204 ) ) ( not ( = ?auto_110203 ?auto_110205 ) ) ( not ( = ?auto_110203 ?auto_110206 ) ) ( not ( = ?auto_110204 ?auto_110205 ) ) ( not ( = ?auto_110204 ?auto_110206 ) ) ( not ( = ?auto_110205 ?auto_110206 ) ) ( ON ?auto_110206 ?auto_110207 ) ( CLEAR ?auto_110206 ) ( not ( = ?auto_110203 ?auto_110207 ) ) ( not ( = ?auto_110204 ?auto_110207 ) ) ( not ( = ?auto_110205 ?auto_110207 ) ) ( not ( = ?auto_110206 ?auto_110207 ) ) ( HOLDING ?auto_110205 ) ( CLEAR ?auto_110204 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110203 ?auto_110204 ?auto_110205 )
      ( MAKE-4PILE ?auto_110203 ?auto_110204 ?auto_110205 ?auto_110206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110208 - BLOCK
      ?auto_110209 - BLOCK
      ?auto_110210 - BLOCK
      ?auto_110211 - BLOCK
    )
    :vars
    (
      ?auto_110212 - BLOCK
      ?auto_110214 - BLOCK
      ?auto_110215 - BLOCK
      ?auto_110213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110208 ) ( ON ?auto_110209 ?auto_110208 ) ( not ( = ?auto_110208 ?auto_110209 ) ) ( not ( = ?auto_110208 ?auto_110210 ) ) ( not ( = ?auto_110208 ?auto_110211 ) ) ( not ( = ?auto_110209 ?auto_110210 ) ) ( not ( = ?auto_110209 ?auto_110211 ) ) ( not ( = ?auto_110210 ?auto_110211 ) ) ( ON ?auto_110211 ?auto_110212 ) ( not ( = ?auto_110208 ?auto_110212 ) ) ( not ( = ?auto_110209 ?auto_110212 ) ) ( not ( = ?auto_110210 ?auto_110212 ) ) ( not ( = ?auto_110211 ?auto_110212 ) ) ( CLEAR ?auto_110209 ) ( ON ?auto_110210 ?auto_110211 ) ( CLEAR ?auto_110210 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110214 ) ( ON ?auto_110215 ?auto_110214 ) ( ON ?auto_110213 ?auto_110215 ) ( ON ?auto_110212 ?auto_110213 ) ( not ( = ?auto_110214 ?auto_110215 ) ) ( not ( = ?auto_110214 ?auto_110213 ) ) ( not ( = ?auto_110214 ?auto_110212 ) ) ( not ( = ?auto_110214 ?auto_110211 ) ) ( not ( = ?auto_110214 ?auto_110210 ) ) ( not ( = ?auto_110215 ?auto_110213 ) ) ( not ( = ?auto_110215 ?auto_110212 ) ) ( not ( = ?auto_110215 ?auto_110211 ) ) ( not ( = ?auto_110215 ?auto_110210 ) ) ( not ( = ?auto_110213 ?auto_110212 ) ) ( not ( = ?auto_110213 ?auto_110211 ) ) ( not ( = ?auto_110213 ?auto_110210 ) ) ( not ( = ?auto_110208 ?auto_110214 ) ) ( not ( = ?auto_110208 ?auto_110215 ) ) ( not ( = ?auto_110208 ?auto_110213 ) ) ( not ( = ?auto_110209 ?auto_110214 ) ) ( not ( = ?auto_110209 ?auto_110215 ) ) ( not ( = ?auto_110209 ?auto_110213 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110214 ?auto_110215 ?auto_110213 ?auto_110212 ?auto_110211 )
      ( MAKE-4PILE ?auto_110208 ?auto_110209 ?auto_110210 ?auto_110211 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110216 - BLOCK
      ?auto_110217 - BLOCK
      ?auto_110218 - BLOCK
      ?auto_110219 - BLOCK
    )
    :vars
    (
      ?auto_110223 - BLOCK
      ?auto_110221 - BLOCK
      ?auto_110220 - BLOCK
      ?auto_110222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110216 ) ( not ( = ?auto_110216 ?auto_110217 ) ) ( not ( = ?auto_110216 ?auto_110218 ) ) ( not ( = ?auto_110216 ?auto_110219 ) ) ( not ( = ?auto_110217 ?auto_110218 ) ) ( not ( = ?auto_110217 ?auto_110219 ) ) ( not ( = ?auto_110218 ?auto_110219 ) ) ( ON ?auto_110219 ?auto_110223 ) ( not ( = ?auto_110216 ?auto_110223 ) ) ( not ( = ?auto_110217 ?auto_110223 ) ) ( not ( = ?auto_110218 ?auto_110223 ) ) ( not ( = ?auto_110219 ?auto_110223 ) ) ( ON ?auto_110218 ?auto_110219 ) ( CLEAR ?auto_110218 ) ( ON-TABLE ?auto_110221 ) ( ON ?auto_110220 ?auto_110221 ) ( ON ?auto_110222 ?auto_110220 ) ( ON ?auto_110223 ?auto_110222 ) ( not ( = ?auto_110221 ?auto_110220 ) ) ( not ( = ?auto_110221 ?auto_110222 ) ) ( not ( = ?auto_110221 ?auto_110223 ) ) ( not ( = ?auto_110221 ?auto_110219 ) ) ( not ( = ?auto_110221 ?auto_110218 ) ) ( not ( = ?auto_110220 ?auto_110222 ) ) ( not ( = ?auto_110220 ?auto_110223 ) ) ( not ( = ?auto_110220 ?auto_110219 ) ) ( not ( = ?auto_110220 ?auto_110218 ) ) ( not ( = ?auto_110222 ?auto_110223 ) ) ( not ( = ?auto_110222 ?auto_110219 ) ) ( not ( = ?auto_110222 ?auto_110218 ) ) ( not ( = ?auto_110216 ?auto_110221 ) ) ( not ( = ?auto_110216 ?auto_110220 ) ) ( not ( = ?auto_110216 ?auto_110222 ) ) ( not ( = ?auto_110217 ?auto_110221 ) ) ( not ( = ?auto_110217 ?auto_110220 ) ) ( not ( = ?auto_110217 ?auto_110222 ) ) ( HOLDING ?auto_110217 ) ( CLEAR ?auto_110216 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110216 ?auto_110217 )
      ( MAKE-4PILE ?auto_110216 ?auto_110217 ?auto_110218 ?auto_110219 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110224 - BLOCK
      ?auto_110225 - BLOCK
      ?auto_110226 - BLOCK
      ?auto_110227 - BLOCK
    )
    :vars
    (
      ?auto_110229 - BLOCK
      ?auto_110230 - BLOCK
      ?auto_110231 - BLOCK
      ?auto_110228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110224 ) ( not ( = ?auto_110224 ?auto_110225 ) ) ( not ( = ?auto_110224 ?auto_110226 ) ) ( not ( = ?auto_110224 ?auto_110227 ) ) ( not ( = ?auto_110225 ?auto_110226 ) ) ( not ( = ?auto_110225 ?auto_110227 ) ) ( not ( = ?auto_110226 ?auto_110227 ) ) ( ON ?auto_110227 ?auto_110229 ) ( not ( = ?auto_110224 ?auto_110229 ) ) ( not ( = ?auto_110225 ?auto_110229 ) ) ( not ( = ?auto_110226 ?auto_110229 ) ) ( not ( = ?auto_110227 ?auto_110229 ) ) ( ON ?auto_110226 ?auto_110227 ) ( ON-TABLE ?auto_110230 ) ( ON ?auto_110231 ?auto_110230 ) ( ON ?auto_110228 ?auto_110231 ) ( ON ?auto_110229 ?auto_110228 ) ( not ( = ?auto_110230 ?auto_110231 ) ) ( not ( = ?auto_110230 ?auto_110228 ) ) ( not ( = ?auto_110230 ?auto_110229 ) ) ( not ( = ?auto_110230 ?auto_110227 ) ) ( not ( = ?auto_110230 ?auto_110226 ) ) ( not ( = ?auto_110231 ?auto_110228 ) ) ( not ( = ?auto_110231 ?auto_110229 ) ) ( not ( = ?auto_110231 ?auto_110227 ) ) ( not ( = ?auto_110231 ?auto_110226 ) ) ( not ( = ?auto_110228 ?auto_110229 ) ) ( not ( = ?auto_110228 ?auto_110227 ) ) ( not ( = ?auto_110228 ?auto_110226 ) ) ( not ( = ?auto_110224 ?auto_110230 ) ) ( not ( = ?auto_110224 ?auto_110231 ) ) ( not ( = ?auto_110224 ?auto_110228 ) ) ( not ( = ?auto_110225 ?auto_110230 ) ) ( not ( = ?auto_110225 ?auto_110231 ) ) ( not ( = ?auto_110225 ?auto_110228 ) ) ( CLEAR ?auto_110224 ) ( ON ?auto_110225 ?auto_110226 ) ( CLEAR ?auto_110225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110230 ?auto_110231 ?auto_110228 ?auto_110229 ?auto_110227 ?auto_110226 )
      ( MAKE-4PILE ?auto_110224 ?auto_110225 ?auto_110226 ?auto_110227 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110232 - BLOCK
      ?auto_110233 - BLOCK
      ?auto_110234 - BLOCK
      ?auto_110235 - BLOCK
    )
    :vars
    (
      ?auto_110239 - BLOCK
      ?auto_110236 - BLOCK
      ?auto_110237 - BLOCK
      ?auto_110238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110232 ?auto_110233 ) ) ( not ( = ?auto_110232 ?auto_110234 ) ) ( not ( = ?auto_110232 ?auto_110235 ) ) ( not ( = ?auto_110233 ?auto_110234 ) ) ( not ( = ?auto_110233 ?auto_110235 ) ) ( not ( = ?auto_110234 ?auto_110235 ) ) ( ON ?auto_110235 ?auto_110239 ) ( not ( = ?auto_110232 ?auto_110239 ) ) ( not ( = ?auto_110233 ?auto_110239 ) ) ( not ( = ?auto_110234 ?auto_110239 ) ) ( not ( = ?auto_110235 ?auto_110239 ) ) ( ON ?auto_110234 ?auto_110235 ) ( ON-TABLE ?auto_110236 ) ( ON ?auto_110237 ?auto_110236 ) ( ON ?auto_110238 ?auto_110237 ) ( ON ?auto_110239 ?auto_110238 ) ( not ( = ?auto_110236 ?auto_110237 ) ) ( not ( = ?auto_110236 ?auto_110238 ) ) ( not ( = ?auto_110236 ?auto_110239 ) ) ( not ( = ?auto_110236 ?auto_110235 ) ) ( not ( = ?auto_110236 ?auto_110234 ) ) ( not ( = ?auto_110237 ?auto_110238 ) ) ( not ( = ?auto_110237 ?auto_110239 ) ) ( not ( = ?auto_110237 ?auto_110235 ) ) ( not ( = ?auto_110237 ?auto_110234 ) ) ( not ( = ?auto_110238 ?auto_110239 ) ) ( not ( = ?auto_110238 ?auto_110235 ) ) ( not ( = ?auto_110238 ?auto_110234 ) ) ( not ( = ?auto_110232 ?auto_110236 ) ) ( not ( = ?auto_110232 ?auto_110237 ) ) ( not ( = ?auto_110232 ?auto_110238 ) ) ( not ( = ?auto_110233 ?auto_110236 ) ) ( not ( = ?auto_110233 ?auto_110237 ) ) ( not ( = ?auto_110233 ?auto_110238 ) ) ( ON ?auto_110233 ?auto_110234 ) ( CLEAR ?auto_110233 ) ( HOLDING ?auto_110232 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110232 )
      ( MAKE-4PILE ?auto_110232 ?auto_110233 ?auto_110234 ?auto_110235 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110240 - BLOCK
      ?auto_110241 - BLOCK
      ?auto_110242 - BLOCK
      ?auto_110243 - BLOCK
    )
    :vars
    (
      ?auto_110246 - BLOCK
      ?auto_110247 - BLOCK
      ?auto_110244 - BLOCK
      ?auto_110245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110240 ?auto_110241 ) ) ( not ( = ?auto_110240 ?auto_110242 ) ) ( not ( = ?auto_110240 ?auto_110243 ) ) ( not ( = ?auto_110241 ?auto_110242 ) ) ( not ( = ?auto_110241 ?auto_110243 ) ) ( not ( = ?auto_110242 ?auto_110243 ) ) ( ON ?auto_110243 ?auto_110246 ) ( not ( = ?auto_110240 ?auto_110246 ) ) ( not ( = ?auto_110241 ?auto_110246 ) ) ( not ( = ?auto_110242 ?auto_110246 ) ) ( not ( = ?auto_110243 ?auto_110246 ) ) ( ON ?auto_110242 ?auto_110243 ) ( ON-TABLE ?auto_110247 ) ( ON ?auto_110244 ?auto_110247 ) ( ON ?auto_110245 ?auto_110244 ) ( ON ?auto_110246 ?auto_110245 ) ( not ( = ?auto_110247 ?auto_110244 ) ) ( not ( = ?auto_110247 ?auto_110245 ) ) ( not ( = ?auto_110247 ?auto_110246 ) ) ( not ( = ?auto_110247 ?auto_110243 ) ) ( not ( = ?auto_110247 ?auto_110242 ) ) ( not ( = ?auto_110244 ?auto_110245 ) ) ( not ( = ?auto_110244 ?auto_110246 ) ) ( not ( = ?auto_110244 ?auto_110243 ) ) ( not ( = ?auto_110244 ?auto_110242 ) ) ( not ( = ?auto_110245 ?auto_110246 ) ) ( not ( = ?auto_110245 ?auto_110243 ) ) ( not ( = ?auto_110245 ?auto_110242 ) ) ( not ( = ?auto_110240 ?auto_110247 ) ) ( not ( = ?auto_110240 ?auto_110244 ) ) ( not ( = ?auto_110240 ?auto_110245 ) ) ( not ( = ?auto_110241 ?auto_110247 ) ) ( not ( = ?auto_110241 ?auto_110244 ) ) ( not ( = ?auto_110241 ?auto_110245 ) ) ( ON ?auto_110241 ?auto_110242 ) ( ON ?auto_110240 ?auto_110241 ) ( CLEAR ?auto_110240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110247 ?auto_110244 ?auto_110245 ?auto_110246 ?auto_110243 ?auto_110242 ?auto_110241 )
      ( MAKE-4PILE ?auto_110240 ?auto_110241 ?auto_110242 ?auto_110243 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110251 - BLOCK
      ?auto_110252 - BLOCK
      ?auto_110253 - BLOCK
    )
    :vars
    (
      ?auto_110254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110254 ?auto_110253 ) ( CLEAR ?auto_110254 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110251 ) ( ON ?auto_110252 ?auto_110251 ) ( ON ?auto_110253 ?auto_110252 ) ( not ( = ?auto_110251 ?auto_110252 ) ) ( not ( = ?auto_110251 ?auto_110253 ) ) ( not ( = ?auto_110251 ?auto_110254 ) ) ( not ( = ?auto_110252 ?auto_110253 ) ) ( not ( = ?auto_110252 ?auto_110254 ) ) ( not ( = ?auto_110253 ?auto_110254 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110254 ?auto_110253 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110255 - BLOCK
      ?auto_110256 - BLOCK
      ?auto_110257 - BLOCK
    )
    :vars
    (
      ?auto_110258 - BLOCK
      ?auto_110259 - BLOCK
      ?auto_110260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110258 ?auto_110257 ) ( CLEAR ?auto_110258 ) ( ON-TABLE ?auto_110255 ) ( ON ?auto_110256 ?auto_110255 ) ( ON ?auto_110257 ?auto_110256 ) ( not ( = ?auto_110255 ?auto_110256 ) ) ( not ( = ?auto_110255 ?auto_110257 ) ) ( not ( = ?auto_110255 ?auto_110258 ) ) ( not ( = ?auto_110256 ?auto_110257 ) ) ( not ( = ?auto_110256 ?auto_110258 ) ) ( not ( = ?auto_110257 ?auto_110258 ) ) ( HOLDING ?auto_110259 ) ( CLEAR ?auto_110260 ) ( not ( = ?auto_110255 ?auto_110259 ) ) ( not ( = ?auto_110255 ?auto_110260 ) ) ( not ( = ?auto_110256 ?auto_110259 ) ) ( not ( = ?auto_110256 ?auto_110260 ) ) ( not ( = ?auto_110257 ?auto_110259 ) ) ( not ( = ?auto_110257 ?auto_110260 ) ) ( not ( = ?auto_110258 ?auto_110259 ) ) ( not ( = ?auto_110258 ?auto_110260 ) ) ( not ( = ?auto_110259 ?auto_110260 ) ) )
    :subtasks
    ( ( !STACK ?auto_110259 ?auto_110260 )
      ( MAKE-3PILE ?auto_110255 ?auto_110256 ?auto_110257 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110261 - BLOCK
      ?auto_110262 - BLOCK
      ?auto_110263 - BLOCK
    )
    :vars
    (
      ?auto_110264 - BLOCK
      ?auto_110265 - BLOCK
      ?auto_110266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110264 ?auto_110263 ) ( ON-TABLE ?auto_110261 ) ( ON ?auto_110262 ?auto_110261 ) ( ON ?auto_110263 ?auto_110262 ) ( not ( = ?auto_110261 ?auto_110262 ) ) ( not ( = ?auto_110261 ?auto_110263 ) ) ( not ( = ?auto_110261 ?auto_110264 ) ) ( not ( = ?auto_110262 ?auto_110263 ) ) ( not ( = ?auto_110262 ?auto_110264 ) ) ( not ( = ?auto_110263 ?auto_110264 ) ) ( CLEAR ?auto_110265 ) ( not ( = ?auto_110261 ?auto_110266 ) ) ( not ( = ?auto_110261 ?auto_110265 ) ) ( not ( = ?auto_110262 ?auto_110266 ) ) ( not ( = ?auto_110262 ?auto_110265 ) ) ( not ( = ?auto_110263 ?auto_110266 ) ) ( not ( = ?auto_110263 ?auto_110265 ) ) ( not ( = ?auto_110264 ?auto_110266 ) ) ( not ( = ?auto_110264 ?auto_110265 ) ) ( not ( = ?auto_110266 ?auto_110265 ) ) ( ON ?auto_110266 ?auto_110264 ) ( CLEAR ?auto_110266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110261 ?auto_110262 ?auto_110263 ?auto_110264 )
      ( MAKE-3PILE ?auto_110261 ?auto_110262 ?auto_110263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110267 - BLOCK
      ?auto_110268 - BLOCK
      ?auto_110269 - BLOCK
    )
    :vars
    (
      ?auto_110272 - BLOCK
      ?auto_110271 - BLOCK
      ?auto_110270 - BLOCK
      ?auto_110273 - BLOCK
      ?auto_110274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110272 ?auto_110269 ) ( ON-TABLE ?auto_110267 ) ( ON ?auto_110268 ?auto_110267 ) ( ON ?auto_110269 ?auto_110268 ) ( not ( = ?auto_110267 ?auto_110268 ) ) ( not ( = ?auto_110267 ?auto_110269 ) ) ( not ( = ?auto_110267 ?auto_110272 ) ) ( not ( = ?auto_110268 ?auto_110269 ) ) ( not ( = ?auto_110268 ?auto_110272 ) ) ( not ( = ?auto_110269 ?auto_110272 ) ) ( not ( = ?auto_110267 ?auto_110271 ) ) ( not ( = ?auto_110267 ?auto_110270 ) ) ( not ( = ?auto_110268 ?auto_110271 ) ) ( not ( = ?auto_110268 ?auto_110270 ) ) ( not ( = ?auto_110269 ?auto_110271 ) ) ( not ( = ?auto_110269 ?auto_110270 ) ) ( not ( = ?auto_110272 ?auto_110271 ) ) ( not ( = ?auto_110272 ?auto_110270 ) ) ( not ( = ?auto_110271 ?auto_110270 ) ) ( ON ?auto_110271 ?auto_110272 ) ( CLEAR ?auto_110271 ) ( HOLDING ?auto_110270 ) ( CLEAR ?auto_110273 ) ( ON-TABLE ?auto_110274 ) ( ON ?auto_110273 ?auto_110274 ) ( not ( = ?auto_110274 ?auto_110273 ) ) ( not ( = ?auto_110274 ?auto_110270 ) ) ( not ( = ?auto_110273 ?auto_110270 ) ) ( not ( = ?auto_110267 ?auto_110273 ) ) ( not ( = ?auto_110267 ?auto_110274 ) ) ( not ( = ?auto_110268 ?auto_110273 ) ) ( not ( = ?auto_110268 ?auto_110274 ) ) ( not ( = ?auto_110269 ?auto_110273 ) ) ( not ( = ?auto_110269 ?auto_110274 ) ) ( not ( = ?auto_110272 ?auto_110273 ) ) ( not ( = ?auto_110272 ?auto_110274 ) ) ( not ( = ?auto_110271 ?auto_110273 ) ) ( not ( = ?auto_110271 ?auto_110274 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110274 ?auto_110273 ?auto_110270 )
      ( MAKE-3PILE ?auto_110267 ?auto_110268 ?auto_110269 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110275 - BLOCK
      ?auto_110276 - BLOCK
      ?auto_110277 - BLOCK
    )
    :vars
    (
      ?auto_110279 - BLOCK
      ?auto_110280 - BLOCK
      ?auto_110281 - BLOCK
      ?auto_110282 - BLOCK
      ?auto_110278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110279 ?auto_110277 ) ( ON-TABLE ?auto_110275 ) ( ON ?auto_110276 ?auto_110275 ) ( ON ?auto_110277 ?auto_110276 ) ( not ( = ?auto_110275 ?auto_110276 ) ) ( not ( = ?auto_110275 ?auto_110277 ) ) ( not ( = ?auto_110275 ?auto_110279 ) ) ( not ( = ?auto_110276 ?auto_110277 ) ) ( not ( = ?auto_110276 ?auto_110279 ) ) ( not ( = ?auto_110277 ?auto_110279 ) ) ( not ( = ?auto_110275 ?auto_110280 ) ) ( not ( = ?auto_110275 ?auto_110281 ) ) ( not ( = ?auto_110276 ?auto_110280 ) ) ( not ( = ?auto_110276 ?auto_110281 ) ) ( not ( = ?auto_110277 ?auto_110280 ) ) ( not ( = ?auto_110277 ?auto_110281 ) ) ( not ( = ?auto_110279 ?auto_110280 ) ) ( not ( = ?auto_110279 ?auto_110281 ) ) ( not ( = ?auto_110280 ?auto_110281 ) ) ( ON ?auto_110280 ?auto_110279 ) ( CLEAR ?auto_110282 ) ( ON-TABLE ?auto_110278 ) ( ON ?auto_110282 ?auto_110278 ) ( not ( = ?auto_110278 ?auto_110282 ) ) ( not ( = ?auto_110278 ?auto_110281 ) ) ( not ( = ?auto_110282 ?auto_110281 ) ) ( not ( = ?auto_110275 ?auto_110282 ) ) ( not ( = ?auto_110275 ?auto_110278 ) ) ( not ( = ?auto_110276 ?auto_110282 ) ) ( not ( = ?auto_110276 ?auto_110278 ) ) ( not ( = ?auto_110277 ?auto_110282 ) ) ( not ( = ?auto_110277 ?auto_110278 ) ) ( not ( = ?auto_110279 ?auto_110282 ) ) ( not ( = ?auto_110279 ?auto_110278 ) ) ( not ( = ?auto_110280 ?auto_110282 ) ) ( not ( = ?auto_110280 ?auto_110278 ) ) ( ON ?auto_110281 ?auto_110280 ) ( CLEAR ?auto_110281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110275 ?auto_110276 ?auto_110277 ?auto_110279 ?auto_110280 )
      ( MAKE-3PILE ?auto_110275 ?auto_110276 ?auto_110277 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110283 - BLOCK
      ?auto_110284 - BLOCK
      ?auto_110285 - BLOCK
    )
    :vars
    (
      ?auto_110288 - BLOCK
      ?auto_110290 - BLOCK
      ?auto_110289 - BLOCK
      ?auto_110287 - BLOCK
      ?auto_110286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110288 ?auto_110285 ) ( ON-TABLE ?auto_110283 ) ( ON ?auto_110284 ?auto_110283 ) ( ON ?auto_110285 ?auto_110284 ) ( not ( = ?auto_110283 ?auto_110284 ) ) ( not ( = ?auto_110283 ?auto_110285 ) ) ( not ( = ?auto_110283 ?auto_110288 ) ) ( not ( = ?auto_110284 ?auto_110285 ) ) ( not ( = ?auto_110284 ?auto_110288 ) ) ( not ( = ?auto_110285 ?auto_110288 ) ) ( not ( = ?auto_110283 ?auto_110290 ) ) ( not ( = ?auto_110283 ?auto_110289 ) ) ( not ( = ?auto_110284 ?auto_110290 ) ) ( not ( = ?auto_110284 ?auto_110289 ) ) ( not ( = ?auto_110285 ?auto_110290 ) ) ( not ( = ?auto_110285 ?auto_110289 ) ) ( not ( = ?auto_110288 ?auto_110290 ) ) ( not ( = ?auto_110288 ?auto_110289 ) ) ( not ( = ?auto_110290 ?auto_110289 ) ) ( ON ?auto_110290 ?auto_110288 ) ( ON-TABLE ?auto_110287 ) ( not ( = ?auto_110287 ?auto_110286 ) ) ( not ( = ?auto_110287 ?auto_110289 ) ) ( not ( = ?auto_110286 ?auto_110289 ) ) ( not ( = ?auto_110283 ?auto_110286 ) ) ( not ( = ?auto_110283 ?auto_110287 ) ) ( not ( = ?auto_110284 ?auto_110286 ) ) ( not ( = ?auto_110284 ?auto_110287 ) ) ( not ( = ?auto_110285 ?auto_110286 ) ) ( not ( = ?auto_110285 ?auto_110287 ) ) ( not ( = ?auto_110288 ?auto_110286 ) ) ( not ( = ?auto_110288 ?auto_110287 ) ) ( not ( = ?auto_110290 ?auto_110286 ) ) ( not ( = ?auto_110290 ?auto_110287 ) ) ( ON ?auto_110289 ?auto_110290 ) ( CLEAR ?auto_110289 ) ( HOLDING ?auto_110286 ) ( CLEAR ?auto_110287 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110287 ?auto_110286 )
      ( MAKE-3PILE ?auto_110283 ?auto_110284 ?auto_110285 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110291 - BLOCK
      ?auto_110292 - BLOCK
      ?auto_110293 - BLOCK
    )
    :vars
    (
      ?auto_110298 - BLOCK
      ?auto_110295 - BLOCK
      ?auto_110296 - BLOCK
      ?auto_110294 - BLOCK
      ?auto_110297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110298 ?auto_110293 ) ( ON-TABLE ?auto_110291 ) ( ON ?auto_110292 ?auto_110291 ) ( ON ?auto_110293 ?auto_110292 ) ( not ( = ?auto_110291 ?auto_110292 ) ) ( not ( = ?auto_110291 ?auto_110293 ) ) ( not ( = ?auto_110291 ?auto_110298 ) ) ( not ( = ?auto_110292 ?auto_110293 ) ) ( not ( = ?auto_110292 ?auto_110298 ) ) ( not ( = ?auto_110293 ?auto_110298 ) ) ( not ( = ?auto_110291 ?auto_110295 ) ) ( not ( = ?auto_110291 ?auto_110296 ) ) ( not ( = ?auto_110292 ?auto_110295 ) ) ( not ( = ?auto_110292 ?auto_110296 ) ) ( not ( = ?auto_110293 ?auto_110295 ) ) ( not ( = ?auto_110293 ?auto_110296 ) ) ( not ( = ?auto_110298 ?auto_110295 ) ) ( not ( = ?auto_110298 ?auto_110296 ) ) ( not ( = ?auto_110295 ?auto_110296 ) ) ( ON ?auto_110295 ?auto_110298 ) ( ON-TABLE ?auto_110294 ) ( not ( = ?auto_110294 ?auto_110297 ) ) ( not ( = ?auto_110294 ?auto_110296 ) ) ( not ( = ?auto_110297 ?auto_110296 ) ) ( not ( = ?auto_110291 ?auto_110297 ) ) ( not ( = ?auto_110291 ?auto_110294 ) ) ( not ( = ?auto_110292 ?auto_110297 ) ) ( not ( = ?auto_110292 ?auto_110294 ) ) ( not ( = ?auto_110293 ?auto_110297 ) ) ( not ( = ?auto_110293 ?auto_110294 ) ) ( not ( = ?auto_110298 ?auto_110297 ) ) ( not ( = ?auto_110298 ?auto_110294 ) ) ( not ( = ?auto_110295 ?auto_110297 ) ) ( not ( = ?auto_110295 ?auto_110294 ) ) ( ON ?auto_110296 ?auto_110295 ) ( CLEAR ?auto_110294 ) ( ON ?auto_110297 ?auto_110296 ) ( CLEAR ?auto_110297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110291 ?auto_110292 ?auto_110293 ?auto_110298 ?auto_110295 ?auto_110296 )
      ( MAKE-3PILE ?auto_110291 ?auto_110292 ?auto_110293 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110299 - BLOCK
      ?auto_110300 - BLOCK
      ?auto_110301 - BLOCK
    )
    :vars
    (
      ?auto_110306 - BLOCK
      ?auto_110302 - BLOCK
      ?auto_110304 - BLOCK
      ?auto_110303 - BLOCK
      ?auto_110305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110306 ?auto_110301 ) ( ON-TABLE ?auto_110299 ) ( ON ?auto_110300 ?auto_110299 ) ( ON ?auto_110301 ?auto_110300 ) ( not ( = ?auto_110299 ?auto_110300 ) ) ( not ( = ?auto_110299 ?auto_110301 ) ) ( not ( = ?auto_110299 ?auto_110306 ) ) ( not ( = ?auto_110300 ?auto_110301 ) ) ( not ( = ?auto_110300 ?auto_110306 ) ) ( not ( = ?auto_110301 ?auto_110306 ) ) ( not ( = ?auto_110299 ?auto_110302 ) ) ( not ( = ?auto_110299 ?auto_110304 ) ) ( not ( = ?auto_110300 ?auto_110302 ) ) ( not ( = ?auto_110300 ?auto_110304 ) ) ( not ( = ?auto_110301 ?auto_110302 ) ) ( not ( = ?auto_110301 ?auto_110304 ) ) ( not ( = ?auto_110306 ?auto_110302 ) ) ( not ( = ?auto_110306 ?auto_110304 ) ) ( not ( = ?auto_110302 ?auto_110304 ) ) ( ON ?auto_110302 ?auto_110306 ) ( not ( = ?auto_110303 ?auto_110305 ) ) ( not ( = ?auto_110303 ?auto_110304 ) ) ( not ( = ?auto_110305 ?auto_110304 ) ) ( not ( = ?auto_110299 ?auto_110305 ) ) ( not ( = ?auto_110299 ?auto_110303 ) ) ( not ( = ?auto_110300 ?auto_110305 ) ) ( not ( = ?auto_110300 ?auto_110303 ) ) ( not ( = ?auto_110301 ?auto_110305 ) ) ( not ( = ?auto_110301 ?auto_110303 ) ) ( not ( = ?auto_110306 ?auto_110305 ) ) ( not ( = ?auto_110306 ?auto_110303 ) ) ( not ( = ?auto_110302 ?auto_110305 ) ) ( not ( = ?auto_110302 ?auto_110303 ) ) ( ON ?auto_110304 ?auto_110302 ) ( ON ?auto_110305 ?auto_110304 ) ( CLEAR ?auto_110305 ) ( HOLDING ?auto_110303 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110303 )
      ( MAKE-3PILE ?auto_110299 ?auto_110300 ?auto_110301 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110307 - BLOCK
      ?auto_110308 - BLOCK
      ?auto_110309 - BLOCK
    )
    :vars
    (
      ?auto_110314 - BLOCK
      ?auto_110310 - BLOCK
      ?auto_110313 - BLOCK
      ?auto_110312 - BLOCK
      ?auto_110311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110314 ?auto_110309 ) ( ON-TABLE ?auto_110307 ) ( ON ?auto_110308 ?auto_110307 ) ( ON ?auto_110309 ?auto_110308 ) ( not ( = ?auto_110307 ?auto_110308 ) ) ( not ( = ?auto_110307 ?auto_110309 ) ) ( not ( = ?auto_110307 ?auto_110314 ) ) ( not ( = ?auto_110308 ?auto_110309 ) ) ( not ( = ?auto_110308 ?auto_110314 ) ) ( not ( = ?auto_110309 ?auto_110314 ) ) ( not ( = ?auto_110307 ?auto_110310 ) ) ( not ( = ?auto_110307 ?auto_110313 ) ) ( not ( = ?auto_110308 ?auto_110310 ) ) ( not ( = ?auto_110308 ?auto_110313 ) ) ( not ( = ?auto_110309 ?auto_110310 ) ) ( not ( = ?auto_110309 ?auto_110313 ) ) ( not ( = ?auto_110314 ?auto_110310 ) ) ( not ( = ?auto_110314 ?auto_110313 ) ) ( not ( = ?auto_110310 ?auto_110313 ) ) ( ON ?auto_110310 ?auto_110314 ) ( not ( = ?auto_110312 ?auto_110311 ) ) ( not ( = ?auto_110312 ?auto_110313 ) ) ( not ( = ?auto_110311 ?auto_110313 ) ) ( not ( = ?auto_110307 ?auto_110311 ) ) ( not ( = ?auto_110307 ?auto_110312 ) ) ( not ( = ?auto_110308 ?auto_110311 ) ) ( not ( = ?auto_110308 ?auto_110312 ) ) ( not ( = ?auto_110309 ?auto_110311 ) ) ( not ( = ?auto_110309 ?auto_110312 ) ) ( not ( = ?auto_110314 ?auto_110311 ) ) ( not ( = ?auto_110314 ?auto_110312 ) ) ( not ( = ?auto_110310 ?auto_110311 ) ) ( not ( = ?auto_110310 ?auto_110312 ) ) ( ON ?auto_110313 ?auto_110310 ) ( ON ?auto_110311 ?auto_110313 ) ( ON ?auto_110312 ?auto_110311 ) ( CLEAR ?auto_110312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110307 ?auto_110308 ?auto_110309 ?auto_110314 ?auto_110310 ?auto_110313 ?auto_110311 )
      ( MAKE-3PILE ?auto_110307 ?auto_110308 ?auto_110309 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110320 - BLOCK
      ?auto_110321 - BLOCK
      ?auto_110322 - BLOCK
      ?auto_110323 - BLOCK
      ?auto_110324 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_110324 ) ( CLEAR ?auto_110323 ) ( ON-TABLE ?auto_110320 ) ( ON ?auto_110321 ?auto_110320 ) ( ON ?auto_110322 ?auto_110321 ) ( ON ?auto_110323 ?auto_110322 ) ( not ( = ?auto_110320 ?auto_110321 ) ) ( not ( = ?auto_110320 ?auto_110322 ) ) ( not ( = ?auto_110320 ?auto_110323 ) ) ( not ( = ?auto_110320 ?auto_110324 ) ) ( not ( = ?auto_110321 ?auto_110322 ) ) ( not ( = ?auto_110321 ?auto_110323 ) ) ( not ( = ?auto_110321 ?auto_110324 ) ) ( not ( = ?auto_110322 ?auto_110323 ) ) ( not ( = ?auto_110322 ?auto_110324 ) ) ( not ( = ?auto_110323 ?auto_110324 ) ) )
    :subtasks
    ( ( !STACK ?auto_110324 ?auto_110323 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110325 - BLOCK
      ?auto_110326 - BLOCK
      ?auto_110327 - BLOCK
      ?auto_110328 - BLOCK
      ?auto_110329 - BLOCK
    )
    :vars
    (
      ?auto_110330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_110328 ) ( ON-TABLE ?auto_110325 ) ( ON ?auto_110326 ?auto_110325 ) ( ON ?auto_110327 ?auto_110326 ) ( ON ?auto_110328 ?auto_110327 ) ( not ( = ?auto_110325 ?auto_110326 ) ) ( not ( = ?auto_110325 ?auto_110327 ) ) ( not ( = ?auto_110325 ?auto_110328 ) ) ( not ( = ?auto_110325 ?auto_110329 ) ) ( not ( = ?auto_110326 ?auto_110327 ) ) ( not ( = ?auto_110326 ?auto_110328 ) ) ( not ( = ?auto_110326 ?auto_110329 ) ) ( not ( = ?auto_110327 ?auto_110328 ) ) ( not ( = ?auto_110327 ?auto_110329 ) ) ( not ( = ?auto_110328 ?auto_110329 ) ) ( ON ?auto_110329 ?auto_110330 ) ( CLEAR ?auto_110329 ) ( HAND-EMPTY ) ( not ( = ?auto_110325 ?auto_110330 ) ) ( not ( = ?auto_110326 ?auto_110330 ) ) ( not ( = ?auto_110327 ?auto_110330 ) ) ( not ( = ?auto_110328 ?auto_110330 ) ) ( not ( = ?auto_110329 ?auto_110330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110329 ?auto_110330 )
      ( MAKE-5PILE ?auto_110325 ?auto_110326 ?auto_110327 ?auto_110328 ?auto_110329 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110331 - BLOCK
      ?auto_110332 - BLOCK
      ?auto_110333 - BLOCK
      ?auto_110334 - BLOCK
      ?auto_110335 - BLOCK
    )
    :vars
    (
      ?auto_110336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110331 ) ( ON ?auto_110332 ?auto_110331 ) ( ON ?auto_110333 ?auto_110332 ) ( not ( = ?auto_110331 ?auto_110332 ) ) ( not ( = ?auto_110331 ?auto_110333 ) ) ( not ( = ?auto_110331 ?auto_110334 ) ) ( not ( = ?auto_110331 ?auto_110335 ) ) ( not ( = ?auto_110332 ?auto_110333 ) ) ( not ( = ?auto_110332 ?auto_110334 ) ) ( not ( = ?auto_110332 ?auto_110335 ) ) ( not ( = ?auto_110333 ?auto_110334 ) ) ( not ( = ?auto_110333 ?auto_110335 ) ) ( not ( = ?auto_110334 ?auto_110335 ) ) ( ON ?auto_110335 ?auto_110336 ) ( CLEAR ?auto_110335 ) ( not ( = ?auto_110331 ?auto_110336 ) ) ( not ( = ?auto_110332 ?auto_110336 ) ) ( not ( = ?auto_110333 ?auto_110336 ) ) ( not ( = ?auto_110334 ?auto_110336 ) ) ( not ( = ?auto_110335 ?auto_110336 ) ) ( HOLDING ?auto_110334 ) ( CLEAR ?auto_110333 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110331 ?auto_110332 ?auto_110333 ?auto_110334 )
      ( MAKE-5PILE ?auto_110331 ?auto_110332 ?auto_110333 ?auto_110334 ?auto_110335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110337 - BLOCK
      ?auto_110338 - BLOCK
      ?auto_110339 - BLOCK
      ?auto_110340 - BLOCK
      ?auto_110341 - BLOCK
    )
    :vars
    (
      ?auto_110342 - BLOCK
      ?auto_110343 - BLOCK
      ?auto_110344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110337 ) ( ON ?auto_110338 ?auto_110337 ) ( ON ?auto_110339 ?auto_110338 ) ( not ( = ?auto_110337 ?auto_110338 ) ) ( not ( = ?auto_110337 ?auto_110339 ) ) ( not ( = ?auto_110337 ?auto_110340 ) ) ( not ( = ?auto_110337 ?auto_110341 ) ) ( not ( = ?auto_110338 ?auto_110339 ) ) ( not ( = ?auto_110338 ?auto_110340 ) ) ( not ( = ?auto_110338 ?auto_110341 ) ) ( not ( = ?auto_110339 ?auto_110340 ) ) ( not ( = ?auto_110339 ?auto_110341 ) ) ( not ( = ?auto_110340 ?auto_110341 ) ) ( ON ?auto_110341 ?auto_110342 ) ( not ( = ?auto_110337 ?auto_110342 ) ) ( not ( = ?auto_110338 ?auto_110342 ) ) ( not ( = ?auto_110339 ?auto_110342 ) ) ( not ( = ?auto_110340 ?auto_110342 ) ) ( not ( = ?auto_110341 ?auto_110342 ) ) ( CLEAR ?auto_110339 ) ( ON ?auto_110340 ?auto_110341 ) ( CLEAR ?auto_110340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110343 ) ( ON ?auto_110344 ?auto_110343 ) ( ON ?auto_110342 ?auto_110344 ) ( not ( = ?auto_110343 ?auto_110344 ) ) ( not ( = ?auto_110343 ?auto_110342 ) ) ( not ( = ?auto_110343 ?auto_110341 ) ) ( not ( = ?auto_110343 ?auto_110340 ) ) ( not ( = ?auto_110344 ?auto_110342 ) ) ( not ( = ?auto_110344 ?auto_110341 ) ) ( not ( = ?auto_110344 ?auto_110340 ) ) ( not ( = ?auto_110337 ?auto_110343 ) ) ( not ( = ?auto_110337 ?auto_110344 ) ) ( not ( = ?auto_110338 ?auto_110343 ) ) ( not ( = ?auto_110338 ?auto_110344 ) ) ( not ( = ?auto_110339 ?auto_110343 ) ) ( not ( = ?auto_110339 ?auto_110344 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110343 ?auto_110344 ?auto_110342 ?auto_110341 )
      ( MAKE-5PILE ?auto_110337 ?auto_110338 ?auto_110339 ?auto_110340 ?auto_110341 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110345 - BLOCK
      ?auto_110346 - BLOCK
      ?auto_110347 - BLOCK
      ?auto_110348 - BLOCK
      ?auto_110349 - BLOCK
    )
    :vars
    (
      ?auto_110352 - BLOCK
      ?auto_110350 - BLOCK
      ?auto_110351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110345 ) ( ON ?auto_110346 ?auto_110345 ) ( not ( = ?auto_110345 ?auto_110346 ) ) ( not ( = ?auto_110345 ?auto_110347 ) ) ( not ( = ?auto_110345 ?auto_110348 ) ) ( not ( = ?auto_110345 ?auto_110349 ) ) ( not ( = ?auto_110346 ?auto_110347 ) ) ( not ( = ?auto_110346 ?auto_110348 ) ) ( not ( = ?auto_110346 ?auto_110349 ) ) ( not ( = ?auto_110347 ?auto_110348 ) ) ( not ( = ?auto_110347 ?auto_110349 ) ) ( not ( = ?auto_110348 ?auto_110349 ) ) ( ON ?auto_110349 ?auto_110352 ) ( not ( = ?auto_110345 ?auto_110352 ) ) ( not ( = ?auto_110346 ?auto_110352 ) ) ( not ( = ?auto_110347 ?auto_110352 ) ) ( not ( = ?auto_110348 ?auto_110352 ) ) ( not ( = ?auto_110349 ?auto_110352 ) ) ( ON ?auto_110348 ?auto_110349 ) ( CLEAR ?auto_110348 ) ( ON-TABLE ?auto_110350 ) ( ON ?auto_110351 ?auto_110350 ) ( ON ?auto_110352 ?auto_110351 ) ( not ( = ?auto_110350 ?auto_110351 ) ) ( not ( = ?auto_110350 ?auto_110352 ) ) ( not ( = ?auto_110350 ?auto_110349 ) ) ( not ( = ?auto_110350 ?auto_110348 ) ) ( not ( = ?auto_110351 ?auto_110352 ) ) ( not ( = ?auto_110351 ?auto_110349 ) ) ( not ( = ?auto_110351 ?auto_110348 ) ) ( not ( = ?auto_110345 ?auto_110350 ) ) ( not ( = ?auto_110345 ?auto_110351 ) ) ( not ( = ?auto_110346 ?auto_110350 ) ) ( not ( = ?auto_110346 ?auto_110351 ) ) ( not ( = ?auto_110347 ?auto_110350 ) ) ( not ( = ?auto_110347 ?auto_110351 ) ) ( HOLDING ?auto_110347 ) ( CLEAR ?auto_110346 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110345 ?auto_110346 ?auto_110347 )
      ( MAKE-5PILE ?auto_110345 ?auto_110346 ?auto_110347 ?auto_110348 ?auto_110349 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110353 - BLOCK
      ?auto_110354 - BLOCK
      ?auto_110355 - BLOCK
      ?auto_110356 - BLOCK
      ?auto_110357 - BLOCK
    )
    :vars
    (
      ?auto_110358 - BLOCK
      ?auto_110360 - BLOCK
      ?auto_110359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110353 ) ( ON ?auto_110354 ?auto_110353 ) ( not ( = ?auto_110353 ?auto_110354 ) ) ( not ( = ?auto_110353 ?auto_110355 ) ) ( not ( = ?auto_110353 ?auto_110356 ) ) ( not ( = ?auto_110353 ?auto_110357 ) ) ( not ( = ?auto_110354 ?auto_110355 ) ) ( not ( = ?auto_110354 ?auto_110356 ) ) ( not ( = ?auto_110354 ?auto_110357 ) ) ( not ( = ?auto_110355 ?auto_110356 ) ) ( not ( = ?auto_110355 ?auto_110357 ) ) ( not ( = ?auto_110356 ?auto_110357 ) ) ( ON ?auto_110357 ?auto_110358 ) ( not ( = ?auto_110353 ?auto_110358 ) ) ( not ( = ?auto_110354 ?auto_110358 ) ) ( not ( = ?auto_110355 ?auto_110358 ) ) ( not ( = ?auto_110356 ?auto_110358 ) ) ( not ( = ?auto_110357 ?auto_110358 ) ) ( ON ?auto_110356 ?auto_110357 ) ( ON-TABLE ?auto_110360 ) ( ON ?auto_110359 ?auto_110360 ) ( ON ?auto_110358 ?auto_110359 ) ( not ( = ?auto_110360 ?auto_110359 ) ) ( not ( = ?auto_110360 ?auto_110358 ) ) ( not ( = ?auto_110360 ?auto_110357 ) ) ( not ( = ?auto_110360 ?auto_110356 ) ) ( not ( = ?auto_110359 ?auto_110358 ) ) ( not ( = ?auto_110359 ?auto_110357 ) ) ( not ( = ?auto_110359 ?auto_110356 ) ) ( not ( = ?auto_110353 ?auto_110360 ) ) ( not ( = ?auto_110353 ?auto_110359 ) ) ( not ( = ?auto_110354 ?auto_110360 ) ) ( not ( = ?auto_110354 ?auto_110359 ) ) ( not ( = ?auto_110355 ?auto_110360 ) ) ( not ( = ?auto_110355 ?auto_110359 ) ) ( CLEAR ?auto_110354 ) ( ON ?auto_110355 ?auto_110356 ) ( CLEAR ?auto_110355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110360 ?auto_110359 ?auto_110358 ?auto_110357 ?auto_110356 )
      ( MAKE-5PILE ?auto_110353 ?auto_110354 ?auto_110355 ?auto_110356 ?auto_110357 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110361 - BLOCK
      ?auto_110362 - BLOCK
      ?auto_110363 - BLOCK
      ?auto_110364 - BLOCK
      ?auto_110365 - BLOCK
    )
    :vars
    (
      ?auto_110366 - BLOCK
      ?auto_110368 - BLOCK
      ?auto_110367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110361 ) ( not ( = ?auto_110361 ?auto_110362 ) ) ( not ( = ?auto_110361 ?auto_110363 ) ) ( not ( = ?auto_110361 ?auto_110364 ) ) ( not ( = ?auto_110361 ?auto_110365 ) ) ( not ( = ?auto_110362 ?auto_110363 ) ) ( not ( = ?auto_110362 ?auto_110364 ) ) ( not ( = ?auto_110362 ?auto_110365 ) ) ( not ( = ?auto_110363 ?auto_110364 ) ) ( not ( = ?auto_110363 ?auto_110365 ) ) ( not ( = ?auto_110364 ?auto_110365 ) ) ( ON ?auto_110365 ?auto_110366 ) ( not ( = ?auto_110361 ?auto_110366 ) ) ( not ( = ?auto_110362 ?auto_110366 ) ) ( not ( = ?auto_110363 ?auto_110366 ) ) ( not ( = ?auto_110364 ?auto_110366 ) ) ( not ( = ?auto_110365 ?auto_110366 ) ) ( ON ?auto_110364 ?auto_110365 ) ( ON-TABLE ?auto_110368 ) ( ON ?auto_110367 ?auto_110368 ) ( ON ?auto_110366 ?auto_110367 ) ( not ( = ?auto_110368 ?auto_110367 ) ) ( not ( = ?auto_110368 ?auto_110366 ) ) ( not ( = ?auto_110368 ?auto_110365 ) ) ( not ( = ?auto_110368 ?auto_110364 ) ) ( not ( = ?auto_110367 ?auto_110366 ) ) ( not ( = ?auto_110367 ?auto_110365 ) ) ( not ( = ?auto_110367 ?auto_110364 ) ) ( not ( = ?auto_110361 ?auto_110368 ) ) ( not ( = ?auto_110361 ?auto_110367 ) ) ( not ( = ?auto_110362 ?auto_110368 ) ) ( not ( = ?auto_110362 ?auto_110367 ) ) ( not ( = ?auto_110363 ?auto_110368 ) ) ( not ( = ?auto_110363 ?auto_110367 ) ) ( ON ?auto_110363 ?auto_110364 ) ( CLEAR ?auto_110363 ) ( HOLDING ?auto_110362 ) ( CLEAR ?auto_110361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110361 ?auto_110362 )
      ( MAKE-5PILE ?auto_110361 ?auto_110362 ?auto_110363 ?auto_110364 ?auto_110365 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110369 - BLOCK
      ?auto_110370 - BLOCK
      ?auto_110371 - BLOCK
      ?auto_110372 - BLOCK
      ?auto_110373 - BLOCK
    )
    :vars
    (
      ?auto_110375 - BLOCK
      ?auto_110376 - BLOCK
      ?auto_110374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110369 ) ( not ( = ?auto_110369 ?auto_110370 ) ) ( not ( = ?auto_110369 ?auto_110371 ) ) ( not ( = ?auto_110369 ?auto_110372 ) ) ( not ( = ?auto_110369 ?auto_110373 ) ) ( not ( = ?auto_110370 ?auto_110371 ) ) ( not ( = ?auto_110370 ?auto_110372 ) ) ( not ( = ?auto_110370 ?auto_110373 ) ) ( not ( = ?auto_110371 ?auto_110372 ) ) ( not ( = ?auto_110371 ?auto_110373 ) ) ( not ( = ?auto_110372 ?auto_110373 ) ) ( ON ?auto_110373 ?auto_110375 ) ( not ( = ?auto_110369 ?auto_110375 ) ) ( not ( = ?auto_110370 ?auto_110375 ) ) ( not ( = ?auto_110371 ?auto_110375 ) ) ( not ( = ?auto_110372 ?auto_110375 ) ) ( not ( = ?auto_110373 ?auto_110375 ) ) ( ON ?auto_110372 ?auto_110373 ) ( ON-TABLE ?auto_110376 ) ( ON ?auto_110374 ?auto_110376 ) ( ON ?auto_110375 ?auto_110374 ) ( not ( = ?auto_110376 ?auto_110374 ) ) ( not ( = ?auto_110376 ?auto_110375 ) ) ( not ( = ?auto_110376 ?auto_110373 ) ) ( not ( = ?auto_110376 ?auto_110372 ) ) ( not ( = ?auto_110374 ?auto_110375 ) ) ( not ( = ?auto_110374 ?auto_110373 ) ) ( not ( = ?auto_110374 ?auto_110372 ) ) ( not ( = ?auto_110369 ?auto_110376 ) ) ( not ( = ?auto_110369 ?auto_110374 ) ) ( not ( = ?auto_110370 ?auto_110376 ) ) ( not ( = ?auto_110370 ?auto_110374 ) ) ( not ( = ?auto_110371 ?auto_110376 ) ) ( not ( = ?auto_110371 ?auto_110374 ) ) ( ON ?auto_110371 ?auto_110372 ) ( CLEAR ?auto_110369 ) ( ON ?auto_110370 ?auto_110371 ) ( CLEAR ?auto_110370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110376 ?auto_110374 ?auto_110375 ?auto_110373 ?auto_110372 ?auto_110371 )
      ( MAKE-5PILE ?auto_110369 ?auto_110370 ?auto_110371 ?auto_110372 ?auto_110373 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110377 - BLOCK
      ?auto_110378 - BLOCK
      ?auto_110379 - BLOCK
      ?auto_110380 - BLOCK
      ?auto_110381 - BLOCK
    )
    :vars
    (
      ?auto_110383 - BLOCK
      ?auto_110384 - BLOCK
      ?auto_110382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110377 ?auto_110378 ) ) ( not ( = ?auto_110377 ?auto_110379 ) ) ( not ( = ?auto_110377 ?auto_110380 ) ) ( not ( = ?auto_110377 ?auto_110381 ) ) ( not ( = ?auto_110378 ?auto_110379 ) ) ( not ( = ?auto_110378 ?auto_110380 ) ) ( not ( = ?auto_110378 ?auto_110381 ) ) ( not ( = ?auto_110379 ?auto_110380 ) ) ( not ( = ?auto_110379 ?auto_110381 ) ) ( not ( = ?auto_110380 ?auto_110381 ) ) ( ON ?auto_110381 ?auto_110383 ) ( not ( = ?auto_110377 ?auto_110383 ) ) ( not ( = ?auto_110378 ?auto_110383 ) ) ( not ( = ?auto_110379 ?auto_110383 ) ) ( not ( = ?auto_110380 ?auto_110383 ) ) ( not ( = ?auto_110381 ?auto_110383 ) ) ( ON ?auto_110380 ?auto_110381 ) ( ON-TABLE ?auto_110384 ) ( ON ?auto_110382 ?auto_110384 ) ( ON ?auto_110383 ?auto_110382 ) ( not ( = ?auto_110384 ?auto_110382 ) ) ( not ( = ?auto_110384 ?auto_110383 ) ) ( not ( = ?auto_110384 ?auto_110381 ) ) ( not ( = ?auto_110384 ?auto_110380 ) ) ( not ( = ?auto_110382 ?auto_110383 ) ) ( not ( = ?auto_110382 ?auto_110381 ) ) ( not ( = ?auto_110382 ?auto_110380 ) ) ( not ( = ?auto_110377 ?auto_110384 ) ) ( not ( = ?auto_110377 ?auto_110382 ) ) ( not ( = ?auto_110378 ?auto_110384 ) ) ( not ( = ?auto_110378 ?auto_110382 ) ) ( not ( = ?auto_110379 ?auto_110384 ) ) ( not ( = ?auto_110379 ?auto_110382 ) ) ( ON ?auto_110379 ?auto_110380 ) ( ON ?auto_110378 ?auto_110379 ) ( CLEAR ?auto_110378 ) ( HOLDING ?auto_110377 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110377 )
      ( MAKE-5PILE ?auto_110377 ?auto_110378 ?auto_110379 ?auto_110380 ?auto_110381 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110385 - BLOCK
      ?auto_110386 - BLOCK
      ?auto_110387 - BLOCK
      ?auto_110388 - BLOCK
      ?auto_110389 - BLOCK
    )
    :vars
    (
      ?auto_110391 - BLOCK
      ?auto_110390 - BLOCK
      ?auto_110392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110385 ?auto_110386 ) ) ( not ( = ?auto_110385 ?auto_110387 ) ) ( not ( = ?auto_110385 ?auto_110388 ) ) ( not ( = ?auto_110385 ?auto_110389 ) ) ( not ( = ?auto_110386 ?auto_110387 ) ) ( not ( = ?auto_110386 ?auto_110388 ) ) ( not ( = ?auto_110386 ?auto_110389 ) ) ( not ( = ?auto_110387 ?auto_110388 ) ) ( not ( = ?auto_110387 ?auto_110389 ) ) ( not ( = ?auto_110388 ?auto_110389 ) ) ( ON ?auto_110389 ?auto_110391 ) ( not ( = ?auto_110385 ?auto_110391 ) ) ( not ( = ?auto_110386 ?auto_110391 ) ) ( not ( = ?auto_110387 ?auto_110391 ) ) ( not ( = ?auto_110388 ?auto_110391 ) ) ( not ( = ?auto_110389 ?auto_110391 ) ) ( ON ?auto_110388 ?auto_110389 ) ( ON-TABLE ?auto_110390 ) ( ON ?auto_110392 ?auto_110390 ) ( ON ?auto_110391 ?auto_110392 ) ( not ( = ?auto_110390 ?auto_110392 ) ) ( not ( = ?auto_110390 ?auto_110391 ) ) ( not ( = ?auto_110390 ?auto_110389 ) ) ( not ( = ?auto_110390 ?auto_110388 ) ) ( not ( = ?auto_110392 ?auto_110391 ) ) ( not ( = ?auto_110392 ?auto_110389 ) ) ( not ( = ?auto_110392 ?auto_110388 ) ) ( not ( = ?auto_110385 ?auto_110390 ) ) ( not ( = ?auto_110385 ?auto_110392 ) ) ( not ( = ?auto_110386 ?auto_110390 ) ) ( not ( = ?auto_110386 ?auto_110392 ) ) ( not ( = ?auto_110387 ?auto_110390 ) ) ( not ( = ?auto_110387 ?auto_110392 ) ) ( ON ?auto_110387 ?auto_110388 ) ( ON ?auto_110386 ?auto_110387 ) ( ON ?auto_110385 ?auto_110386 ) ( CLEAR ?auto_110385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110390 ?auto_110392 ?auto_110391 ?auto_110389 ?auto_110388 ?auto_110387 ?auto_110386 )
      ( MAKE-5PILE ?auto_110385 ?auto_110386 ?auto_110387 ?auto_110388 ?auto_110389 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110395 - BLOCK
      ?auto_110396 - BLOCK
    )
    :vars
    (
      ?auto_110397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110397 ?auto_110396 ) ( CLEAR ?auto_110397 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110395 ) ( ON ?auto_110396 ?auto_110395 ) ( not ( = ?auto_110395 ?auto_110396 ) ) ( not ( = ?auto_110395 ?auto_110397 ) ) ( not ( = ?auto_110396 ?auto_110397 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110397 ?auto_110396 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110398 - BLOCK
      ?auto_110399 - BLOCK
    )
    :vars
    (
      ?auto_110400 - BLOCK
      ?auto_110401 - BLOCK
      ?auto_110402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110400 ?auto_110399 ) ( CLEAR ?auto_110400 ) ( ON-TABLE ?auto_110398 ) ( ON ?auto_110399 ?auto_110398 ) ( not ( = ?auto_110398 ?auto_110399 ) ) ( not ( = ?auto_110398 ?auto_110400 ) ) ( not ( = ?auto_110399 ?auto_110400 ) ) ( HOLDING ?auto_110401 ) ( CLEAR ?auto_110402 ) ( not ( = ?auto_110398 ?auto_110401 ) ) ( not ( = ?auto_110398 ?auto_110402 ) ) ( not ( = ?auto_110399 ?auto_110401 ) ) ( not ( = ?auto_110399 ?auto_110402 ) ) ( not ( = ?auto_110400 ?auto_110401 ) ) ( not ( = ?auto_110400 ?auto_110402 ) ) ( not ( = ?auto_110401 ?auto_110402 ) ) )
    :subtasks
    ( ( !STACK ?auto_110401 ?auto_110402 )
      ( MAKE-2PILE ?auto_110398 ?auto_110399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110403 - BLOCK
      ?auto_110404 - BLOCK
    )
    :vars
    (
      ?auto_110407 - BLOCK
      ?auto_110406 - BLOCK
      ?auto_110405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110407 ?auto_110404 ) ( ON-TABLE ?auto_110403 ) ( ON ?auto_110404 ?auto_110403 ) ( not ( = ?auto_110403 ?auto_110404 ) ) ( not ( = ?auto_110403 ?auto_110407 ) ) ( not ( = ?auto_110404 ?auto_110407 ) ) ( CLEAR ?auto_110406 ) ( not ( = ?auto_110403 ?auto_110405 ) ) ( not ( = ?auto_110403 ?auto_110406 ) ) ( not ( = ?auto_110404 ?auto_110405 ) ) ( not ( = ?auto_110404 ?auto_110406 ) ) ( not ( = ?auto_110407 ?auto_110405 ) ) ( not ( = ?auto_110407 ?auto_110406 ) ) ( not ( = ?auto_110405 ?auto_110406 ) ) ( ON ?auto_110405 ?auto_110407 ) ( CLEAR ?auto_110405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110403 ?auto_110404 ?auto_110407 )
      ( MAKE-2PILE ?auto_110403 ?auto_110404 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110408 - BLOCK
      ?auto_110409 - BLOCK
    )
    :vars
    (
      ?auto_110411 - BLOCK
      ?auto_110412 - BLOCK
      ?auto_110410 - BLOCK
      ?auto_110415 - BLOCK
      ?auto_110414 - BLOCK
      ?auto_110413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110411 ?auto_110409 ) ( ON-TABLE ?auto_110408 ) ( ON ?auto_110409 ?auto_110408 ) ( not ( = ?auto_110408 ?auto_110409 ) ) ( not ( = ?auto_110408 ?auto_110411 ) ) ( not ( = ?auto_110409 ?auto_110411 ) ) ( not ( = ?auto_110408 ?auto_110412 ) ) ( not ( = ?auto_110408 ?auto_110410 ) ) ( not ( = ?auto_110409 ?auto_110412 ) ) ( not ( = ?auto_110409 ?auto_110410 ) ) ( not ( = ?auto_110411 ?auto_110412 ) ) ( not ( = ?auto_110411 ?auto_110410 ) ) ( not ( = ?auto_110412 ?auto_110410 ) ) ( ON ?auto_110412 ?auto_110411 ) ( CLEAR ?auto_110412 ) ( HOLDING ?auto_110410 ) ( CLEAR ?auto_110415 ) ( ON-TABLE ?auto_110414 ) ( ON ?auto_110413 ?auto_110414 ) ( ON ?auto_110415 ?auto_110413 ) ( not ( = ?auto_110414 ?auto_110413 ) ) ( not ( = ?auto_110414 ?auto_110415 ) ) ( not ( = ?auto_110414 ?auto_110410 ) ) ( not ( = ?auto_110413 ?auto_110415 ) ) ( not ( = ?auto_110413 ?auto_110410 ) ) ( not ( = ?auto_110415 ?auto_110410 ) ) ( not ( = ?auto_110408 ?auto_110415 ) ) ( not ( = ?auto_110408 ?auto_110414 ) ) ( not ( = ?auto_110408 ?auto_110413 ) ) ( not ( = ?auto_110409 ?auto_110415 ) ) ( not ( = ?auto_110409 ?auto_110414 ) ) ( not ( = ?auto_110409 ?auto_110413 ) ) ( not ( = ?auto_110411 ?auto_110415 ) ) ( not ( = ?auto_110411 ?auto_110414 ) ) ( not ( = ?auto_110411 ?auto_110413 ) ) ( not ( = ?auto_110412 ?auto_110415 ) ) ( not ( = ?auto_110412 ?auto_110414 ) ) ( not ( = ?auto_110412 ?auto_110413 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110414 ?auto_110413 ?auto_110415 ?auto_110410 )
      ( MAKE-2PILE ?auto_110408 ?auto_110409 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110416 - BLOCK
      ?auto_110417 - BLOCK
    )
    :vars
    (
      ?auto_110420 - BLOCK
      ?auto_110421 - BLOCK
      ?auto_110418 - BLOCK
      ?auto_110419 - BLOCK
      ?auto_110422 - BLOCK
      ?auto_110423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110420 ?auto_110417 ) ( ON-TABLE ?auto_110416 ) ( ON ?auto_110417 ?auto_110416 ) ( not ( = ?auto_110416 ?auto_110417 ) ) ( not ( = ?auto_110416 ?auto_110420 ) ) ( not ( = ?auto_110417 ?auto_110420 ) ) ( not ( = ?auto_110416 ?auto_110421 ) ) ( not ( = ?auto_110416 ?auto_110418 ) ) ( not ( = ?auto_110417 ?auto_110421 ) ) ( not ( = ?auto_110417 ?auto_110418 ) ) ( not ( = ?auto_110420 ?auto_110421 ) ) ( not ( = ?auto_110420 ?auto_110418 ) ) ( not ( = ?auto_110421 ?auto_110418 ) ) ( ON ?auto_110421 ?auto_110420 ) ( CLEAR ?auto_110419 ) ( ON-TABLE ?auto_110422 ) ( ON ?auto_110423 ?auto_110422 ) ( ON ?auto_110419 ?auto_110423 ) ( not ( = ?auto_110422 ?auto_110423 ) ) ( not ( = ?auto_110422 ?auto_110419 ) ) ( not ( = ?auto_110422 ?auto_110418 ) ) ( not ( = ?auto_110423 ?auto_110419 ) ) ( not ( = ?auto_110423 ?auto_110418 ) ) ( not ( = ?auto_110419 ?auto_110418 ) ) ( not ( = ?auto_110416 ?auto_110419 ) ) ( not ( = ?auto_110416 ?auto_110422 ) ) ( not ( = ?auto_110416 ?auto_110423 ) ) ( not ( = ?auto_110417 ?auto_110419 ) ) ( not ( = ?auto_110417 ?auto_110422 ) ) ( not ( = ?auto_110417 ?auto_110423 ) ) ( not ( = ?auto_110420 ?auto_110419 ) ) ( not ( = ?auto_110420 ?auto_110422 ) ) ( not ( = ?auto_110420 ?auto_110423 ) ) ( not ( = ?auto_110421 ?auto_110419 ) ) ( not ( = ?auto_110421 ?auto_110422 ) ) ( not ( = ?auto_110421 ?auto_110423 ) ) ( ON ?auto_110418 ?auto_110421 ) ( CLEAR ?auto_110418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110416 ?auto_110417 ?auto_110420 ?auto_110421 )
      ( MAKE-2PILE ?auto_110416 ?auto_110417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110424 - BLOCK
      ?auto_110425 - BLOCK
    )
    :vars
    (
      ?auto_110431 - BLOCK
      ?auto_110428 - BLOCK
      ?auto_110430 - BLOCK
      ?auto_110426 - BLOCK
      ?auto_110429 - BLOCK
      ?auto_110427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110431 ?auto_110425 ) ( ON-TABLE ?auto_110424 ) ( ON ?auto_110425 ?auto_110424 ) ( not ( = ?auto_110424 ?auto_110425 ) ) ( not ( = ?auto_110424 ?auto_110431 ) ) ( not ( = ?auto_110425 ?auto_110431 ) ) ( not ( = ?auto_110424 ?auto_110428 ) ) ( not ( = ?auto_110424 ?auto_110430 ) ) ( not ( = ?auto_110425 ?auto_110428 ) ) ( not ( = ?auto_110425 ?auto_110430 ) ) ( not ( = ?auto_110431 ?auto_110428 ) ) ( not ( = ?auto_110431 ?auto_110430 ) ) ( not ( = ?auto_110428 ?auto_110430 ) ) ( ON ?auto_110428 ?auto_110431 ) ( ON-TABLE ?auto_110426 ) ( ON ?auto_110429 ?auto_110426 ) ( not ( = ?auto_110426 ?auto_110429 ) ) ( not ( = ?auto_110426 ?auto_110427 ) ) ( not ( = ?auto_110426 ?auto_110430 ) ) ( not ( = ?auto_110429 ?auto_110427 ) ) ( not ( = ?auto_110429 ?auto_110430 ) ) ( not ( = ?auto_110427 ?auto_110430 ) ) ( not ( = ?auto_110424 ?auto_110427 ) ) ( not ( = ?auto_110424 ?auto_110426 ) ) ( not ( = ?auto_110424 ?auto_110429 ) ) ( not ( = ?auto_110425 ?auto_110427 ) ) ( not ( = ?auto_110425 ?auto_110426 ) ) ( not ( = ?auto_110425 ?auto_110429 ) ) ( not ( = ?auto_110431 ?auto_110427 ) ) ( not ( = ?auto_110431 ?auto_110426 ) ) ( not ( = ?auto_110431 ?auto_110429 ) ) ( not ( = ?auto_110428 ?auto_110427 ) ) ( not ( = ?auto_110428 ?auto_110426 ) ) ( not ( = ?auto_110428 ?auto_110429 ) ) ( ON ?auto_110430 ?auto_110428 ) ( CLEAR ?auto_110430 ) ( HOLDING ?auto_110427 ) ( CLEAR ?auto_110429 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110426 ?auto_110429 ?auto_110427 )
      ( MAKE-2PILE ?auto_110424 ?auto_110425 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110432 - BLOCK
      ?auto_110433 - BLOCK
    )
    :vars
    (
      ?auto_110434 - BLOCK
      ?auto_110437 - BLOCK
      ?auto_110435 - BLOCK
      ?auto_110438 - BLOCK
      ?auto_110439 - BLOCK
      ?auto_110436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110434 ?auto_110433 ) ( ON-TABLE ?auto_110432 ) ( ON ?auto_110433 ?auto_110432 ) ( not ( = ?auto_110432 ?auto_110433 ) ) ( not ( = ?auto_110432 ?auto_110434 ) ) ( not ( = ?auto_110433 ?auto_110434 ) ) ( not ( = ?auto_110432 ?auto_110437 ) ) ( not ( = ?auto_110432 ?auto_110435 ) ) ( not ( = ?auto_110433 ?auto_110437 ) ) ( not ( = ?auto_110433 ?auto_110435 ) ) ( not ( = ?auto_110434 ?auto_110437 ) ) ( not ( = ?auto_110434 ?auto_110435 ) ) ( not ( = ?auto_110437 ?auto_110435 ) ) ( ON ?auto_110437 ?auto_110434 ) ( ON-TABLE ?auto_110438 ) ( ON ?auto_110439 ?auto_110438 ) ( not ( = ?auto_110438 ?auto_110439 ) ) ( not ( = ?auto_110438 ?auto_110436 ) ) ( not ( = ?auto_110438 ?auto_110435 ) ) ( not ( = ?auto_110439 ?auto_110436 ) ) ( not ( = ?auto_110439 ?auto_110435 ) ) ( not ( = ?auto_110436 ?auto_110435 ) ) ( not ( = ?auto_110432 ?auto_110436 ) ) ( not ( = ?auto_110432 ?auto_110438 ) ) ( not ( = ?auto_110432 ?auto_110439 ) ) ( not ( = ?auto_110433 ?auto_110436 ) ) ( not ( = ?auto_110433 ?auto_110438 ) ) ( not ( = ?auto_110433 ?auto_110439 ) ) ( not ( = ?auto_110434 ?auto_110436 ) ) ( not ( = ?auto_110434 ?auto_110438 ) ) ( not ( = ?auto_110434 ?auto_110439 ) ) ( not ( = ?auto_110437 ?auto_110436 ) ) ( not ( = ?auto_110437 ?auto_110438 ) ) ( not ( = ?auto_110437 ?auto_110439 ) ) ( ON ?auto_110435 ?auto_110437 ) ( CLEAR ?auto_110439 ) ( ON ?auto_110436 ?auto_110435 ) ( CLEAR ?auto_110436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110432 ?auto_110433 ?auto_110434 ?auto_110437 ?auto_110435 )
      ( MAKE-2PILE ?auto_110432 ?auto_110433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110440 - BLOCK
      ?auto_110441 - BLOCK
    )
    :vars
    (
      ?auto_110445 - BLOCK
      ?auto_110442 - BLOCK
      ?auto_110447 - BLOCK
      ?auto_110444 - BLOCK
      ?auto_110443 - BLOCK
      ?auto_110446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110445 ?auto_110441 ) ( ON-TABLE ?auto_110440 ) ( ON ?auto_110441 ?auto_110440 ) ( not ( = ?auto_110440 ?auto_110441 ) ) ( not ( = ?auto_110440 ?auto_110445 ) ) ( not ( = ?auto_110441 ?auto_110445 ) ) ( not ( = ?auto_110440 ?auto_110442 ) ) ( not ( = ?auto_110440 ?auto_110447 ) ) ( not ( = ?auto_110441 ?auto_110442 ) ) ( not ( = ?auto_110441 ?auto_110447 ) ) ( not ( = ?auto_110445 ?auto_110442 ) ) ( not ( = ?auto_110445 ?auto_110447 ) ) ( not ( = ?auto_110442 ?auto_110447 ) ) ( ON ?auto_110442 ?auto_110445 ) ( ON-TABLE ?auto_110444 ) ( not ( = ?auto_110444 ?auto_110443 ) ) ( not ( = ?auto_110444 ?auto_110446 ) ) ( not ( = ?auto_110444 ?auto_110447 ) ) ( not ( = ?auto_110443 ?auto_110446 ) ) ( not ( = ?auto_110443 ?auto_110447 ) ) ( not ( = ?auto_110446 ?auto_110447 ) ) ( not ( = ?auto_110440 ?auto_110446 ) ) ( not ( = ?auto_110440 ?auto_110444 ) ) ( not ( = ?auto_110440 ?auto_110443 ) ) ( not ( = ?auto_110441 ?auto_110446 ) ) ( not ( = ?auto_110441 ?auto_110444 ) ) ( not ( = ?auto_110441 ?auto_110443 ) ) ( not ( = ?auto_110445 ?auto_110446 ) ) ( not ( = ?auto_110445 ?auto_110444 ) ) ( not ( = ?auto_110445 ?auto_110443 ) ) ( not ( = ?auto_110442 ?auto_110446 ) ) ( not ( = ?auto_110442 ?auto_110444 ) ) ( not ( = ?auto_110442 ?auto_110443 ) ) ( ON ?auto_110447 ?auto_110442 ) ( ON ?auto_110446 ?auto_110447 ) ( CLEAR ?auto_110446 ) ( HOLDING ?auto_110443 ) ( CLEAR ?auto_110444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110444 ?auto_110443 )
      ( MAKE-2PILE ?auto_110440 ?auto_110441 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110448 - BLOCK
      ?auto_110449 - BLOCK
    )
    :vars
    (
      ?auto_110453 - BLOCK
      ?auto_110450 - BLOCK
      ?auto_110451 - BLOCK
      ?auto_110454 - BLOCK
      ?auto_110455 - BLOCK
      ?auto_110452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110453 ?auto_110449 ) ( ON-TABLE ?auto_110448 ) ( ON ?auto_110449 ?auto_110448 ) ( not ( = ?auto_110448 ?auto_110449 ) ) ( not ( = ?auto_110448 ?auto_110453 ) ) ( not ( = ?auto_110449 ?auto_110453 ) ) ( not ( = ?auto_110448 ?auto_110450 ) ) ( not ( = ?auto_110448 ?auto_110451 ) ) ( not ( = ?auto_110449 ?auto_110450 ) ) ( not ( = ?auto_110449 ?auto_110451 ) ) ( not ( = ?auto_110453 ?auto_110450 ) ) ( not ( = ?auto_110453 ?auto_110451 ) ) ( not ( = ?auto_110450 ?auto_110451 ) ) ( ON ?auto_110450 ?auto_110453 ) ( ON-TABLE ?auto_110454 ) ( not ( = ?auto_110454 ?auto_110455 ) ) ( not ( = ?auto_110454 ?auto_110452 ) ) ( not ( = ?auto_110454 ?auto_110451 ) ) ( not ( = ?auto_110455 ?auto_110452 ) ) ( not ( = ?auto_110455 ?auto_110451 ) ) ( not ( = ?auto_110452 ?auto_110451 ) ) ( not ( = ?auto_110448 ?auto_110452 ) ) ( not ( = ?auto_110448 ?auto_110454 ) ) ( not ( = ?auto_110448 ?auto_110455 ) ) ( not ( = ?auto_110449 ?auto_110452 ) ) ( not ( = ?auto_110449 ?auto_110454 ) ) ( not ( = ?auto_110449 ?auto_110455 ) ) ( not ( = ?auto_110453 ?auto_110452 ) ) ( not ( = ?auto_110453 ?auto_110454 ) ) ( not ( = ?auto_110453 ?auto_110455 ) ) ( not ( = ?auto_110450 ?auto_110452 ) ) ( not ( = ?auto_110450 ?auto_110454 ) ) ( not ( = ?auto_110450 ?auto_110455 ) ) ( ON ?auto_110451 ?auto_110450 ) ( ON ?auto_110452 ?auto_110451 ) ( CLEAR ?auto_110454 ) ( ON ?auto_110455 ?auto_110452 ) ( CLEAR ?auto_110455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110448 ?auto_110449 ?auto_110453 ?auto_110450 ?auto_110451 ?auto_110452 )
      ( MAKE-2PILE ?auto_110448 ?auto_110449 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110456 - BLOCK
      ?auto_110457 - BLOCK
    )
    :vars
    (
      ?auto_110463 - BLOCK
      ?auto_110459 - BLOCK
      ?auto_110458 - BLOCK
      ?auto_110460 - BLOCK
      ?auto_110461 - BLOCK
      ?auto_110462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110463 ?auto_110457 ) ( ON-TABLE ?auto_110456 ) ( ON ?auto_110457 ?auto_110456 ) ( not ( = ?auto_110456 ?auto_110457 ) ) ( not ( = ?auto_110456 ?auto_110463 ) ) ( not ( = ?auto_110457 ?auto_110463 ) ) ( not ( = ?auto_110456 ?auto_110459 ) ) ( not ( = ?auto_110456 ?auto_110458 ) ) ( not ( = ?auto_110457 ?auto_110459 ) ) ( not ( = ?auto_110457 ?auto_110458 ) ) ( not ( = ?auto_110463 ?auto_110459 ) ) ( not ( = ?auto_110463 ?auto_110458 ) ) ( not ( = ?auto_110459 ?auto_110458 ) ) ( ON ?auto_110459 ?auto_110463 ) ( not ( = ?auto_110460 ?auto_110461 ) ) ( not ( = ?auto_110460 ?auto_110462 ) ) ( not ( = ?auto_110460 ?auto_110458 ) ) ( not ( = ?auto_110461 ?auto_110462 ) ) ( not ( = ?auto_110461 ?auto_110458 ) ) ( not ( = ?auto_110462 ?auto_110458 ) ) ( not ( = ?auto_110456 ?auto_110462 ) ) ( not ( = ?auto_110456 ?auto_110460 ) ) ( not ( = ?auto_110456 ?auto_110461 ) ) ( not ( = ?auto_110457 ?auto_110462 ) ) ( not ( = ?auto_110457 ?auto_110460 ) ) ( not ( = ?auto_110457 ?auto_110461 ) ) ( not ( = ?auto_110463 ?auto_110462 ) ) ( not ( = ?auto_110463 ?auto_110460 ) ) ( not ( = ?auto_110463 ?auto_110461 ) ) ( not ( = ?auto_110459 ?auto_110462 ) ) ( not ( = ?auto_110459 ?auto_110460 ) ) ( not ( = ?auto_110459 ?auto_110461 ) ) ( ON ?auto_110458 ?auto_110459 ) ( ON ?auto_110462 ?auto_110458 ) ( ON ?auto_110461 ?auto_110462 ) ( CLEAR ?auto_110461 ) ( HOLDING ?auto_110460 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110460 )
      ( MAKE-2PILE ?auto_110456 ?auto_110457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110464 - BLOCK
      ?auto_110465 - BLOCK
    )
    :vars
    (
      ?auto_110468 - BLOCK
      ?auto_110470 - BLOCK
      ?auto_110466 - BLOCK
      ?auto_110467 - BLOCK
      ?auto_110471 - BLOCK
      ?auto_110469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110468 ?auto_110465 ) ( ON-TABLE ?auto_110464 ) ( ON ?auto_110465 ?auto_110464 ) ( not ( = ?auto_110464 ?auto_110465 ) ) ( not ( = ?auto_110464 ?auto_110468 ) ) ( not ( = ?auto_110465 ?auto_110468 ) ) ( not ( = ?auto_110464 ?auto_110470 ) ) ( not ( = ?auto_110464 ?auto_110466 ) ) ( not ( = ?auto_110465 ?auto_110470 ) ) ( not ( = ?auto_110465 ?auto_110466 ) ) ( not ( = ?auto_110468 ?auto_110470 ) ) ( not ( = ?auto_110468 ?auto_110466 ) ) ( not ( = ?auto_110470 ?auto_110466 ) ) ( ON ?auto_110470 ?auto_110468 ) ( not ( = ?auto_110467 ?auto_110471 ) ) ( not ( = ?auto_110467 ?auto_110469 ) ) ( not ( = ?auto_110467 ?auto_110466 ) ) ( not ( = ?auto_110471 ?auto_110469 ) ) ( not ( = ?auto_110471 ?auto_110466 ) ) ( not ( = ?auto_110469 ?auto_110466 ) ) ( not ( = ?auto_110464 ?auto_110469 ) ) ( not ( = ?auto_110464 ?auto_110467 ) ) ( not ( = ?auto_110464 ?auto_110471 ) ) ( not ( = ?auto_110465 ?auto_110469 ) ) ( not ( = ?auto_110465 ?auto_110467 ) ) ( not ( = ?auto_110465 ?auto_110471 ) ) ( not ( = ?auto_110468 ?auto_110469 ) ) ( not ( = ?auto_110468 ?auto_110467 ) ) ( not ( = ?auto_110468 ?auto_110471 ) ) ( not ( = ?auto_110470 ?auto_110469 ) ) ( not ( = ?auto_110470 ?auto_110467 ) ) ( not ( = ?auto_110470 ?auto_110471 ) ) ( ON ?auto_110466 ?auto_110470 ) ( ON ?auto_110469 ?auto_110466 ) ( ON ?auto_110471 ?auto_110469 ) ( ON ?auto_110467 ?auto_110471 ) ( CLEAR ?auto_110467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110464 ?auto_110465 ?auto_110468 ?auto_110470 ?auto_110466 ?auto_110469 ?auto_110471 )
      ( MAKE-2PILE ?auto_110464 ?auto_110465 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110478 - BLOCK
      ?auto_110479 - BLOCK
      ?auto_110480 - BLOCK
      ?auto_110481 - BLOCK
      ?auto_110482 - BLOCK
      ?auto_110483 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_110483 ) ( CLEAR ?auto_110482 ) ( ON-TABLE ?auto_110478 ) ( ON ?auto_110479 ?auto_110478 ) ( ON ?auto_110480 ?auto_110479 ) ( ON ?auto_110481 ?auto_110480 ) ( ON ?auto_110482 ?auto_110481 ) ( not ( = ?auto_110478 ?auto_110479 ) ) ( not ( = ?auto_110478 ?auto_110480 ) ) ( not ( = ?auto_110478 ?auto_110481 ) ) ( not ( = ?auto_110478 ?auto_110482 ) ) ( not ( = ?auto_110478 ?auto_110483 ) ) ( not ( = ?auto_110479 ?auto_110480 ) ) ( not ( = ?auto_110479 ?auto_110481 ) ) ( not ( = ?auto_110479 ?auto_110482 ) ) ( not ( = ?auto_110479 ?auto_110483 ) ) ( not ( = ?auto_110480 ?auto_110481 ) ) ( not ( = ?auto_110480 ?auto_110482 ) ) ( not ( = ?auto_110480 ?auto_110483 ) ) ( not ( = ?auto_110481 ?auto_110482 ) ) ( not ( = ?auto_110481 ?auto_110483 ) ) ( not ( = ?auto_110482 ?auto_110483 ) ) )
    :subtasks
    ( ( !STACK ?auto_110483 ?auto_110482 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110484 - BLOCK
      ?auto_110485 - BLOCK
      ?auto_110486 - BLOCK
      ?auto_110487 - BLOCK
      ?auto_110488 - BLOCK
      ?auto_110489 - BLOCK
    )
    :vars
    (
      ?auto_110490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_110488 ) ( ON-TABLE ?auto_110484 ) ( ON ?auto_110485 ?auto_110484 ) ( ON ?auto_110486 ?auto_110485 ) ( ON ?auto_110487 ?auto_110486 ) ( ON ?auto_110488 ?auto_110487 ) ( not ( = ?auto_110484 ?auto_110485 ) ) ( not ( = ?auto_110484 ?auto_110486 ) ) ( not ( = ?auto_110484 ?auto_110487 ) ) ( not ( = ?auto_110484 ?auto_110488 ) ) ( not ( = ?auto_110484 ?auto_110489 ) ) ( not ( = ?auto_110485 ?auto_110486 ) ) ( not ( = ?auto_110485 ?auto_110487 ) ) ( not ( = ?auto_110485 ?auto_110488 ) ) ( not ( = ?auto_110485 ?auto_110489 ) ) ( not ( = ?auto_110486 ?auto_110487 ) ) ( not ( = ?auto_110486 ?auto_110488 ) ) ( not ( = ?auto_110486 ?auto_110489 ) ) ( not ( = ?auto_110487 ?auto_110488 ) ) ( not ( = ?auto_110487 ?auto_110489 ) ) ( not ( = ?auto_110488 ?auto_110489 ) ) ( ON ?auto_110489 ?auto_110490 ) ( CLEAR ?auto_110489 ) ( HAND-EMPTY ) ( not ( = ?auto_110484 ?auto_110490 ) ) ( not ( = ?auto_110485 ?auto_110490 ) ) ( not ( = ?auto_110486 ?auto_110490 ) ) ( not ( = ?auto_110487 ?auto_110490 ) ) ( not ( = ?auto_110488 ?auto_110490 ) ) ( not ( = ?auto_110489 ?auto_110490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110489 ?auto_110490 )
      ( MAKE-6PILE ?auto_110484 ?auto_110485 ?auto_110486 ?auto_110487 ?auto_110488 ?auto_110489 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110491 - BLOCK
      ?auto_110492 - BLOCK
      ?auto_110493 - BLOCK
      ?auto_110494 - BLOCK
      ?auto_110495 - BLOCK
      ?auto_110496 - BLOCK
    )
    :vars
    (
      ?auto_110497 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110491 ) ( ON ?auto_110492 ?auto_110491 ) ( ON ?auto_110493 ?auto_110492 ) ( ON ?auto_110494 ?auto_110493 ) ( not ( = ?auto_110491 ?auto_110492 ) ) ( not ( = ?auto_110491 ?auto_110493 ) ) ( not ( = ?auto_110491 ?auto_110494 ) ) ( not ( = ?auto_110491 ?auto_110495 ) ) ( not ( = ?auto_110491 ?auto_110496 ) ) ( not ( = ?auto_110492 ?auto_110493 ) ) ( not ( = ?auto_110492 ?auto_110494 ) ) ( not ( = ?auto_110492 ?auto_110495 ) ) ( not ( = ?auto_110492 ?auto_110496 ) ) ( not ( = ?auto_110493 ?auto_110494 ) ) ( not ( = ?auto_110493 ?auto_110495 ) ) ( not ( = ?auto_110493 ?auto_110496 ) ) ( not ( = ?auto_110494 ?auto_110495 ) ) ( not ( = ?auto_110494 ?auto_110496 ) ) ( not ( = ?auto_110495 ?auto_110496 ) ) ( ON ?auto_110496 ?auto_110497 ) ( CLEAR ?auto_110496 ) ( not ( = ?auto_110491 ?auto_110497 ) ) ( not ( = ?auto_110492 ?auto_110497 ) ) ( not ( = ?auto_110493 ?auto_110497 ) ) ( not ( = ?auto_110494 ?auto_110497 ) ) ( not ( = ?auto_110495 ?auto_110497 ) ) ( not ( = ?auto_110496 ?auto_110497 ) ) ( HOLDING ?auto_110495 ) ( CLEAR ?auto_110494 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110491 ?auto_110492 ?auto_110493 ?auto_110494 ?auto_110495 )
      ( MAKE-6PILE ?auto_110491 ?auto_110492 ?auto_110493 ?auto_110494 ?auto_110495 ?auto_110496 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110498 - BLOCK
      ?auto_110499 - BLOCK
      ?auto_110500 - BLOCK
      ?auto_110501 - BLOCK
      ?auto_110502 - BLOCK
      ?auto_110503 - BLOCK
    )
    :vars
    (
      ?auto_110504 - BLOCK
      ?auto_110505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110498 ) ( ON ?auto_110499 ?auto_110498 ) ( ON ?auto_110500 ?auto_110499 ) ( ON ?auto_110501 ?auto_110500 ) ( not ( = ?auto_110498 ?auto_110499 ) ) ( not ( = ?auto_110498 ?auto_110500 ) ) ( not ( = ?auto_110498 ?auto_110501 ) ) ( not ( = ?auto_110498 ?auto_110502 ) ) ( not ( = ?auto_110498 ?auto_110503 ) ) ( not ( = ?auto_110499 ?auto_110500 ) ) ( not ( = ?auto_110499 ?auto_110501 ) ) ( not ( = ?auto_110499 ?auto_110502 ) ) ( not ( = ?auto_110499 ?auto_110503 ) ) ( not ( = ?auto_110500 ?auto_110501 ) ) ( not ( = ?auto_110500 ?auto_110502 ) ) ( not ( = ?auto_110500 ?auto_110503 ) ) ( not ( = ?auto_110501 ?auto_110502 ) ) ( not ( = ?auto_110501 ?auto_110503 ) ) ( not ( = ?auto_110502 ?auto_110503 ) ) ( ON ?auto_110503 ?auto_110504 ) ( not ( = ?auto_110498 ?auto_110504 ) ) ( not ( = ?auto_110499 ?auto_110504 ) ) ( not ( = ?auto_110500 ?auto_110504 ) ) ( not ( = ?auto_110501 ?auto_110504 ) ) ( not ( = ?auto_110502 ?auto_110504 ) ) ( not ( = ?auto_110503 ?auto_110504 ) ) ( CLEAR ?auto_110501 ) ( ON ?auto_110502 ?auto_110503 ) ( CLEAR ?auto_110502 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110505 ) ( ON ?auto_110504 ?auto_110505 ) ( not ( = ?auto_110505 ?auto_110504 ) ) ( not ( = ?auto_110505 ?auto_110503 ) ) ( not ( = ?auto_110505 ?auto_110502 ) ) ( not ( = ?auto_110498 ?auto_110505 ) ) ( not ( = ?auto_110499 ?auto_110505 ) ) ( not ( = ?auto_110500 ?auto_110505 ) ) ( not ( = ?auto_110501 ?auto_110505 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110505 ?auto_110504 ?auto_110503 )
      ( MAKE-6PILE ?auto_110498 ?auto_110499 ?auto_110500 ?auto_110501 ?auto_110502 ?auto_110503 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110506 - BLOCK
      ?auto_110507 - BLOCK
      ?auto_110508 - BLOCK
      ?auto_110509 - BLOCK
      ?auto_110510 - BLOCK
      ?auto_110511 - BLOCK
    )
    :vars
    (
      ?auto_110513 - BLOCK
      ?auto_110512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110506 ) ( ON ?auto_110507 ?auto_110506 ) ( ON ?auto_110508 ?auto_110507 ) ( not ( = ?auto_110506 ?auto_110507 ) ) ( not ( = ?auto_110506 ?auto_110508 ) ) ( not ( = ?auto_110506 ?auto_110509 ) ) ( not ( = ?auto_110506 ?auto_110510 ) ) ( not ( = ?auto_110506 ?auto_110511 ) ) ( not ( = ?auto_110507 ?auto_110508 ) ) ( not ( = ?auto_110507 ?auto_110509 ) ) ( not ( = ?auto_110507 ?auto_110510 ) ) ( not ( = ?auto_110507 ?auto_110511 ) ) ( not ( = ?auto_110508 ?auto_110509 ) ) ( not ( = ?auto_110508 ?auto_110510 ) ) ( not ( = ?auto_110508 ?auto_110511 ) ) ( not ( = ?auto_110509 ?auto_110510 ) ) ( not ( = ?auto_110509 ?auto_110511 ) ) ( not ( = ?auto_110510 ?auto_110511 ) ) ( ON ?auto_110511 ?auto_110513 ) ( not ( = ?auto_110506 ?auto_110513 ) ) ( not ( = ?auto_110507 ?auto_110513 ) ) ( not ( = ?auto_110508 ?auto_110513 ) ) ( not ( = ?auto_110509 ?auto_110513 ) ) ( not ( = ?auto_110510 ?auto_110513 ) ) ( not ( = ?auto_110511 ?auto_110513 ) ) ( ON ?auto_110510 ?auto_110511 ) ( CLEAR ?auto_110510 ) ( ON-TABLE ?auto_110512 ) ( ON ?auto_110513 ?auto_110512 ) ( not ( = ?auto_110512 ?auto_110513 ) ) ( not ( = ?auto_110512 ?auto_110511 ) ) ( not ( = ?auto_110512 ?auto_110510 ) ) ( not ( = ?auto_110506 ?auto_110512 ) ) ( not ( = ?auto_110507 ?auto_110512 ) ) ( not ( = ?auto_110508 ?auto_110512 ) ) ( not ( = ?auto_110509 ?auto_110512 ) ) ( HOLDING ?auto_110509 ) ( CLEAR ?auto_110508 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110506 ?auto_110507 ?auto_110508 ?auto_110509 )
      ( MAKE-6PILE ?auto_110506 ?auto_110507 ?auto_110508 ?auto_110509 ?auto_110510 ?auto_110511 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110514 - BLOCK
      ?auto_110515 - BLOCK
      ?auto_110516 - BLOCK
      ?auto_110517 - BLOCK
      ?auto_110518 - BLOCK
      ?auto_110519 - BLOCK
    )
    :vars
    (
      ?auto_110521 - BLOCK
      ?auto_110520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110514 ) ( ON ?auto_110515 ?auto_110514 ) ( ON ?auto_110516 ?auto_110515 ) ( not ( = ?auto_110514 ?auto_110515 ) ) ( not ( = ?auto_110514 ?auto_110516 ) ) ( not ( = ?auto_110514 ?auto_110517 ) ) ( not ( = ?auto_110514 ?auto_110518 ) ) ( not ( = ?auto_110514 ?auto_110519 ) ) ( not ( = ?auto_110515 ?auto_110516 ) ) ( not ( = ?auto_110515 ?auto_110517 ) ) ( not ( = ?auto_110515 ?auto_110518 ) ) ( not ( = ?auto_110515 ?auto_110519 ) ) ( not ( = ?auto_110516 ?auto_110517 ) ) ( not ( = ?auto_110516 ?auto_110518 ) ) ( not ( = ?auto_110516 ?auto_110519 ) ) ( not ( = ?auto_110517 ?auto_110518 ) ) ( not ( = ?auto_110517 ?auto_110519 ) ) ( not ( = ?auto_110518 ?auto_110519 ) ) ( ON ?auto_110519 ?auto_110521 ) ( not ( = ?auto_110514 ?auto_110521 ) ) ( not ( = ?auto_110515 ?auto_110521 ) ) ( not ( = ?auto_110516 ?auto_110521 ) ) ( not ( = ?auto_110517 ?auto_110521 ) ) ( not ( = ?auto_110518 ?auto_110521 ) ) ( not ( = ?auto_110519 ?auto_110521 ) ) ( ON ?auto_110518 ?auto_110519 ) ( ON-TABLE ?auto_110520 ) ( ON ?auto_110521 ?auto_110520 ) ( not ( = ?auto_110520 ?auto_110521 ) ) ( not ( = ?auto_110520 ?auto_110519 ) ) ( not ( = ?auto_110520 ?auto_110518 ) ) ( not ( = ?auto_110514 ?auto_110520 ) ) ( not ( = ?auto_110515 ?auto_110520 ) ) ( not ( = ?auto_110516 ?auto_110520 ) ) ( not ( = ?auto_110517 ?auto_110520 ) ) ( CLEAR ?auto_110516 ) ( ON ?auto_110517 ?auto_110518 ) ( CLEAR ?auto_110517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110520 ?auto_110521 ?auto_110519 ?auto_110518 )
      ( MAKE-6PILE ?auto_110514 ?auto_110515 ?auto_110516 ?auto_110517 ?auto_110518 ?auto_110519 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110522 - BLOCK
      ?auto_110523 - BLOCK
      ?auto_110524 - BLOCK
      ?auto_110525 - BLOCK
      ?auto_110526 - BLOCK
      ?auto_110527 - BLOCK
    )
    :vars
    (
      ?auto_110528 - BLOCK
      ?auto_110529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110522 ) ( ON ?auto_110523 ?auto_110522 ) ( not ( = ?auto_110522 ?auto_110523 ) ) ( not ( = ?auto_110522 ?auto_110524 ) ) ( not ( = ?auto_110522 ?auto_110525 ) ) ( not ( = ?auto_110522 ?auto_110526 ) ) ( not ( = ?auto_110522 ?auto_110527 ) ) ( not ( = ?auto_110523 ?auto_110524 ) ) ( not ( = ?auto_110523 ?auto_110525 ) ) ( not ( = ?auto_110523 ?auto_110526 ) ) ( not ( = ?auto_110523 ?auto_110527 ) ) ( not ( = ?auto_110524 ?auto_110525 ) ) ( not ( = ?auto_110524 ?auto_110526 ) ) ( not ( = ?auto_110524 ?auto_110527 ) ) ( not ( = ?auto_110525 ?auto_110526 ) ) ( not ( = ?auto_110525 ?auto_110527 ) ) ( not ( = ?auto_110526 ?auto_110527 ) ) ( ON ?auto_110527 ?auto_110528 ) ( not ( = ?auto_110522 ?auto_110528 ) ) ( not ( = ?auto_110523 ?auto_110528 ) ) ( not ( = ?auto_110524 ?auto_110528 ) ) ( not ( = ?auto_110525 ?auto_110528 ) ) ( not ( = ?auto_110526 ?auto_110528 ) ) ( not ( = ?auto_110527 ?auto_110528 ) ) ( ON ?auto_110526 ?auto_110527 ) ( ON-TABLE ?auto_110529 ) ( ON ?auto_110528 ?auto_110529 ) ( not ( = ?auto_110529 ?auto_110528 ) ) ( not ( = ?auto_110529 ?auto_110527 ) ) ( not ( = ?auto_110529 ?auto_110526 ) ) ( not ( = ?auto_110522 ?auto_110529 ) ) ( not ( = ?auto_110523 ?auto_110529 ) ) ( not ( = ?auto_110524 ?auto_110529 ) ) ( not ( = ?auto_110525 ?auto_110529 ) ) ( ON ?auto_110525 ?auto_110526 ) ( CLEAR ?auto_110525 ) ( HOLDING ?auto_110524 ) ( CLEAR ?auto_110523 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110522 ?auto_110523 ?auto_110524 )
      ( MAKE-6PILE ?auto_110522 ?auto_110523 ?auto_110524 ?auto_110525 ?auto_110526 ?auto_110527 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110530 - BLOCK
      ?auto_110531 - BLOCK
      ?auto_110532 - BLOCK
      ?auto_110533 - BLOCK
      ?auto_110534 - BLOCK
      ?auto_110535 - BLOCK
    )
    :vars
    (
      ?auto_110537 - BLOCK
      ?auto_110536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110530 ) ( ON ?auto_110531 ?auto_110530 ) ( not ( = ?auto_110530 ?auto_110531 ) ) ( not ( = ?auto_110530 ?auto_110532 ) ) ( not ( = ?auto_110530 ?auto_110533 ) ) ( not ( = ?auto_110530 ?auto_110534 ) ) ( not ( = ?auto_110530 ?auto_110535 ) ) ( not ( = ?auto_110531 ?auto_110532 ) ) ( not ( = ?auto_110531 ?auto_110533 ) ) ( not ( = ?auto_110531 ?auto_110534 ) ) ( not ( = ?auto_110531 ?auto_110535 ) ) ( not ( = ?auto_110532 ?auto_110533 ) ) ( not ( = ?auto_110532 ?auto_110534 ) ) ( not ( = ?auto_110532 ?auto_110535 ) ) ( not ( = ?auto_110533 ?auto_110534 ) ) ( not ( = ?auto_110533 ?auto_110535 ) ) ( not ( = ?auto_110534 ?auto_110535 ) ) ( ON ?auto_110535 ?auto_110537 ) ( not ( = ?auto_110530 ?auto_110537 ) ) ( not ( = ?auto_110531 ?auto_110537 ) ) ( not ( = ?auto_110532 ?auto_110537 ) ) ( not ( = ?auto_110533 ?auto_110537 ) ) ( not ( = ?auto_110534 ?auto_110537 ) ) ( not ( = ?auto_110535 ?auto_110537 ) ) ( ON ?auto_110534 ?auto_110535 ) ( ON-TABLE ?auto_110536 ) ( ON ?auto_110537 ?auto_110536 ) ( not ( = ?auto_110536 ?auto_110537 ) ) ( not ( = ?auto_110536 ?auto_110535 ) ) ( not ( = ?auto_110536 ?auto_110534 ) ) ( not ( = ?auto_110530 ?auto_110536 ) ) ( not ( = ?auto_110531 ?auto_110536 ) ) ( not ( = ?auto_110532 ?auto_110536 ) ) ( not ( = ?auto_110533 ?auto_110536 ) ) ( ON ?auto_110533 ?auto_110534 ) ( CLEAR ?auto_110531 ) ( ON ?auto_110532 ?auto_110533 ) ( CLEAR ?auto_110532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110536 ?auto_110537 ?auto_110535 ?auto_110534 ?auto_110533 )
      ( MAKE-6PILE ?auto_110530 ?auto_110531 ?auto_110532 ?auto_110533 ?auto_110534 ?auto_110535 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110538 - BLOCK
      ?auto_110539 - BLOCK
      ?auto_110540 - BLOCK
      ?auto_110541 - BLOCK
      ?auto_110542 - BLOCK
      ?auto_110543 - BLOCK
    )
    :vars
    (
      ?auto_110545 - BLOCK
      ?auto_110544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110538 ) ( not ( = ?auto_110538 ?auto_110539 ) ) ( not ( = ?auto_110538 ?auto_110540 ) ) ( not ( = ?auto_110538 ?auto_110541 ) ) ( not ( = ?auto_110538 ?auto_110542 ) ) ( not ( = ?auto_110538 ?auto_110543 ) ) ( not ( = ?auto_110539 ?auto_110540 ) ) ( not ( = ?auto_110539 ?auto_110541 ) ) ( not ( = ?auto_110539 ?auto_110542 ) ) ( not ( = ?auto_110539 ?auto_110543 ) ) ( not ( = ?auto_110540 ?auto_110541 ) ) ( not ( = ?auto_110540 ?auto_110542 ) ) ( not ( = ?auto_110540 ?auto_110543 ) ) ( not ( = ?auto_110541 ?auto_110542 ) ) ( not ( = ?auto_110541 ?auto_110543 ) ) ( not ( = ?auto_110542 ?auto_110543 ) ) ( ON ?auto_110543 ?auto_110545 ) ( not ( = ?auto_110538 ?auto_110545 ) ) ( not ( = ?auto_110539 ?auto_110545 ) ) ( not ( = ?auto_110540 ?auto_110545 ) ) ( not ( = ?auto_110541 ?auto_110545 ) ) ( not ( = ?auto_110542 ?auto_110545 ) ) ( not ( = ?auto_110543 ?auto_110545 ) ) ( ON ?auto_110542 ?auto_110543 ) ( ON-TABLE ?auto_110544 ) ( ON ?auto_110545 ?auto_110544 ) ( not ( = ?auto_110544 ?auto_110545 ) ) ( not ( = ?auto_110544 ?auto_110543 ) ) ( not ( = ?auto_110544 ?auto_110542 ) ) ( not ( = ?auto_110538 ?auto_110544 ) ) ( not ( = ?auto_110539 ?auto_110544 ) ) ( not ( = ?auto_110540 ?auto_110544 ) ) ( not ( = ?auto_110541 ?auto_110544 ) ) ( ON ?auto_110541 ?auto_110542 ) ( ON ?auto_110540 ?auto_110541 ) ( CLEAR ?auto_110540 ) ( HOLDING ?auto_110539 ) ( CLEAR ?auto_110538 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110538 ?auto_110539 )
      ( MAKE-6PILE ?auto_110538 ?auto_110539 ?auto_110540 ?auto_110541 ?auto_110542 ?auto_110543 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110546 - BLOCK
      ?auto_110547 - BLOCK
      ?auto_110548 - BLOCK
      ?auto_110549 - BLOCK
      ?auto_110550 - BLOCK
      ?auto_110551 - BLOCK
    )
    :vars
    (
      ?auto_110552 - BLOCK
      ?auto_110553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110546 ) ( not ( = ?auto_110546 ?auto_110547 ) ) ( not ( = ?auto_110546 ?auto_110548 ) ) ( not ( = ?auto_110546 ?auto_110549 ) ) ( not ( = ?auto_110546 ?auto_110550 ) ) ( not ( = ?auto_110546 ?auto_110551 ) ) ( not ( = ?auto_110547 ?auto_110548 ) ) ( not ( = ?auto_110547 ?auto_110549 ) ) ( not ( = ?auto_110547 ?auto_110550 ) ) ( not ( = ?auto_110547 ?auto_110551 ) ) ( not ( = ?auto_110548 ?auto_110549 ) ) ( not ( = ?auto_110548 ?auto_110550 ) ) ( not ( = ?auto_110548 ?auto_110551 ) ) ( not ( = ?auto_110549 ?auto_110550 ) ) ( not ( = ?auto_110549 ?auto_110551 ) ) ( not ( = ?auto_110550 ?auto_110551 ) ) ( ON ?auto_110551 ?auto_110552 ) ( not ( = ?auto_110546 ?auto_110552 ) ) ( not ( = ?auto_110547 ?auto_110552 ) ) ( not ( = ?auto_110548 ?auto_110552 ) ) ( not ( = ?auto_110549 ?auto_110552 ) ) ( not ( = ?auto_110550 ?auto_110552 ) ) ( not ( = ?auto_110551 ?auto_110552 ) ) ( ON ?auto_110550 ?auto_110551 ) ( ON-TABLE ?auto_110553 ) ( ON ?auto_110552 ?auto_110553 ) ( not ( = ?auto_110553 ?auto_110552 ) ) ( not ( = ?auto_110553 ?auto_110551 ) ) ( not ( = ?auto_110553 ?auto_110550 ) ) ( not ( = ?auto_110546 ?auto_110553 ) ) ( not ( = ?auto_110547 ?auto_110553 ) ) ( not ( = ?auto_110548 ?auto_110553 ) ) ( not ( = ?auto_110549 ?auto_110553 ) ) ( ON ?auto_110549 ?auto_110550 ) ( ON ?auto_110548 ?auto_110549 ) ( CLEAR ?auto_110546 ) ( ON ?auto_110547 ?auto_110548 ) ( CLEAR ?auto_110547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110553 ?auto_110552 ?auto_110551 ?auto_110550 ?auto_110549 ?auto_110548 )
      ( MAKE-6PILE ?auto_110546 ?auto_110547 ?auto_110548 ?auto_110549 ?auto_110550 ?auto_110551 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110554 - BLOCK
      ?auto_110555 - BLOCK
      ?auto_110556 - BLOCK
      ?auto_110557 - BLOCK
      ?auto_110558 - BLOCK
      ?auto_110559 - BLOCK
    )
    :vars
    (
      ?auto_110561 - BLOCK
      ?auto_110560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110554 ?auto_110555 ) ) ( not ( = ?auto_110554 ?auto_110556 ) ) ( not ( = ?auto_110554 ?auto_110557 ) ) ( not ( = ?auto_110554 ?auto_110558 ) ) ( not ( = ?auto_110554 ?auto_110559 ) ) ( not ( = ?auto_110555 ?auto_110556 ) ) ( not ( = ?auto_110555 ?auto_110557 ) ) ( not ( = ?auto_110555 ?auto_110558 ) ) ( not ( = ?auto_110555 ?auto_110559 ) ) ( not ( = ?auto_110556 ?auto_110557 ) ) ( not ( = ?auto_110556 ?auto_110558 ) ) ( not ( = ?auto_110556 ?auto_110559 ) ) ( not ( = ?auto_110557 ?auto_110558 ) ) ( not ( = ?auto_110557 ?auto_110559 ) ) ( not ( = ?auto_110558 ?auto_110559 ) ) ( ON ?auto_110559 ?auto_110561 ) ( not ( = ?auto_110554 ?auto_110561 ) ) ( not ( = ?auto_110555 ?auto_110561 ) ) ( not ( = ?auto_110556 ?auto_110561 ) ) ( not ( = ?auto_110557 ?auto_110561 ) ) ( not ( = ?auto_110558 ?auto_110561 ) ) ( not ( = ?auto_110559 ?auto_110561 ) ) ( ON ?auto_110558 ?auto_110559 ) ( ON-TABLE ?auto_110560 ) ( ON ?auto_110561 ?auto_110560 ) ( not ( = ?auto_110560 ?auto_110561 ) ) ( not ( = ?auto_110560 ?auto_110559 ) ) ( not ( = ?auto_110560 ?auto_110558 ) ) ( not ( = ?auto_110554 ?auto_110560 ) ) ( not ( = ?auto_110555 ?auto_110560 ) ) ( not ( = ?auto_110556 ?auto_110560 ) ) ( not ( = ?auto_110557 ?auto_110560 ) ) ( ON ?auto_110557 ?auto_110558 ) ( ON ?auto_110556 ?auto_110557 ) ( ON ?auto_110555 ?auto_110556 ) ( CLEAR ?auto_110555 ) ( HOLDING ?auto_110554 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110554 )
      ( MAKE-6PILE ?auto_110554 ?auto_110555 ?auto_110556 ?auto_110557 ?auto_110558 ?auto_110559 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110562 - BLOCK
      ?auto_110563 - BLOCK
      ?auto_110564 - BLOCK
      ?auto_110565 - BLOCK
      ?auto_110566 - BLOCK
      ?auto_110567 - BLOCK
    )
    :vars
    (
      ?auto_110569 - BLOCK
      ?auto_110568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110562 ?auto_110563 ) ) ( not ( = ?auto_110562 ?auto_110564 ) ) ( not ( = ?auto_110562 ?auto_110565 ) ) ( not ( = ?auto_110562 ?auto_110566 ) ) ( not ( = ?auto_110562 ?auto_110567 ) ) ( not ( = ?auto_110563 ?auto_110564 ) ) ( not ( = ?auto_110563 ?auto_110565 ) ) ( not ( = ?auto_110563 ?auto_110566 ) ) ( not ( = ?auto_110563 ?auto_110567 ) ) ( not ( = ?auto_110564 ?auto_110565 ) ) ( not ( = ?auto_110564 ?auto_110566 ) ) ( not ( = ?auto_110564 ?auto_110567 ) ) ( not ( = ?auto_110565 ?auto_110566 ) ) ( not ( = ?auto_110565 ?auto_110567 ) ) ( not ( = ?auto_110566 ?auto_110567 ) ) ( ON ?auto_110567 ?auto_110569 ) ( not ( = ?auto_110562 ?auto_110569 ) ) ( not ( = ?auto_110563 ?auto_110569 ) ) ( not ( = ?auto_110564 ?auto_110569 ) ) ( not ( = ?auto_110565 ?auto_110569 ) ) ( not ( = ?auto_110566 ?auto_110569 ) ) ( not ( = ?auto_110567 ?auto_110569 ) ) ( ON ?auto_110566 ?auto_110567 ) ( ON-TABLE ?auto_110568 ) ( ON ?auto_110569 ?auto_110568 ) ( not ( = ?auto_110568 ?auto_110569 ) ) ( not ( = ?auto_110568 ?auto_110567 ) ) ( not ( = ?auto_110568 ?auto_110566 ) ) ( not ( = ?auto_110562 ?auto_110568 ) ) ( not ( = ?auto_110563 ?auto_110568 ) ) ( not ( = ?auto_110564 ?auto_110568 ) ) ( not ( = ?auto_110565 ?auto_110568 ) ) ( ON ?auto_110565 ?auto_110566 ) ( ON ?auto_110564 ?auto_110565 ) ( ON ?auto_110563 ?auto_110564 ) ( ON ?auto_110562 ?auto_110563 ) ( CLEAR ?auto_110562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110568 ?auto_110569 ?auto_110567 ?auto_110566 ?auto_110565 ?auto_110564 ?auto_110563 )
      ( MAKE-6PILE ?auto_110562 ?auto_110563 ?auto_110564 ?auto_110565 ?auto_110566 ?auto_110567 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110571 - BLOCK
    )
    :vars
    (
      ?auto_110572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110572 ?auto_110571 ) ( CLEAR ?auto_110572 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110571 ) ( not ( = ?auto_110571 ?auto_110572 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110572 ?auto_110571 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110573 - BLOCK
    )
    :vars
    (
      ?auto_110574 - BLOCK
      ?auto_110575 - BLOCK
      ?auto_110576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110574 ?auto_110573 ) ( CLEAR ?auto_110574 ) ( ON-TABLE ?auto_110573 ) ( not ( = ?auto_110573 ?auto_110574 ) ) ( HOLDING ?auto_110575 ) ( CLEAR ?auto_110576 ) ( not ( = ?auto_110573 ?auto_110575 ) ) ( not ( = ?auto_110573 ?auto_110576 ) ) ( not ( = ?auto_110574 ?auto_110575 ) ) ( not ( = ?auto_110574 ?auto_110576 ) ) ( not ( = ?auto_110575 ?auto_110576 ) ) )
    :subtasks
    ( ( !STACK ?auto_110575 ?auto_110576 )
      ( MAKE-1PILE ?auto_110573 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110577 - BLOCK
    )
    :vars
    (
      ?auto_110578 - BLOCK
      ?auto_110580 - BLOCK
      ?auto_110579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110578 ?auto_110577 ) ( ON-TABLE ?auto_110577 ) ( not ( = ?auto_110577 ?auto_110578 ) ) ( CLEAR ?auto_110580 ) ( not ( = ?auto_110577 ?auto_110579 ) ) ( not ( = ?auto_110577 ?auto_110580 ) ) ( not ( = ?auto_110578 ?auto_110579 ) ) ( not ( = ?auto_110578 ?auto_110580 ) ) ( not ( = ?auto_110579 ?auto_110580 ) ) ( ON ?auto_110579 ?auto_110578 ) ( CLEAR ?auto_110579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110577 ?auto_110578 )
      ( MAKE-1PILE ?auto_110577 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110581 - BLOCK
    )
    :vars
    (
      ?auto_110583 - BLOCK
      ?auto_110582 - BLOCK
      ?auto_110584 - BLOCK
      ?auto_110586 - BLOCK
      ?auto_110587 - BLOCK
      ?auto_110585 - BLOCK
      ?auto_110588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110583 ?auto_110581 ) ( ON-TABLE ?auto_110581 ) ( not ( = ?auto_110581 ?auto_110583 ) ) ( not ( = ?auto_110581 ?auto_110582 ) ) ( not ( = ?auto_110581 ?auto_110584 ) ) ( not ( = ?auto_110583 ?auto_110582 ) ) ( not ( = ?auto_110583 ?auto_110584 ) ) ( not ( = ?auto_110582 ?auto_110584 ) ) ( ON ?auto_110582 ?auto_110583 ) ( CLEAR ?auto_110582 ) ( HOLDING ?auto_110584 ) ( CLEAR ?auto_110586 ) ( ON-TABLE ?auto_110587 ) ( ON ?auto_110585 ?auto_110587 ) ( ON ?auto_110588 ?auto_110585 ) ( ON ?auto_110586 ?auto_110588 ) ( not ( = ?auto_110587 ?auto_110585 ) ) ( not ( = ?auto_110587 ?auto_110588 ) ) ( not ( = ?auto_110587 ?auto_110586 ) ) ( not ( = ?auto_110587 ?auto_110584 ) ) ( not ( = ?auto_110585 ?auto_110588 ) ) ( not ( = ?auto_110585 ?auto_110586 ) ) ( not ( = ?auto_110585 ?auto_110584 ) ) ( not ( = ?auto_110588 ?auto_110586 ) ) ( not ( = ?auto_110588 ?auto_110584 ) ) ( not ( = ?auto_110586 ?auto_110584 ) ) ( not ( = ?auto_110581 ?auto_110586 ) ) ( not ( = ?auto_110581 ?auto_110587 ) ) ( not ( = ?auto_110581 ?auto_110585 ) ) ( not ( = ?auto_110581 ?auto_110588 ) ) ( not ( = ?auto_110583 ?auto_110586 ) ) ( not ( = ?auto_110583 ?auto_110587 ) ) ( not ( = ?auto_110583 ?auto_110585 ) ) ( not ( = ?auto_110583 ?auto_110588 ) ) ( not ( = ?auto_110582 ?auto_110586 ) ) ( not ( = ?auto_110582 ?auto_110587 ) ) ( not ( = ?auto_110582 ?auto_110585 ) ) ( not ( = ?auto_110582 ?auto_110588 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110587 ?auto_110585 ?auto_110588 ?auto_110586 ?auto_110584 )
      ( MAKE-1PILE ?auto_110581 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110589 - BLOCK
    )
    :vars
    (
      ?auto_110591 - BLOCK
      ?auto_110590 - BLOCK
      ?auto_110596 - BLOCK
      ?auto_110592 - BLOCK
      ?auto_110595 - BLOCK
      ?auto_110594 - BLOCK
      ?auto_110593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110591 ?auto_110589 ) ( ON-TABLE ?auto_110589 ) ( not ( = ?auto_110589 ?auto_110591 ) ) ( not ( = ?auto_110589 ?auto_110590 ) ) ( not ( = ?auto_110589 ?auto_110596 ) ) ( not ( = ?auto_110591 ?auto_110590 ) ) ( not ( = ?auto_110591 ?auto_110596 ) ) ( not ( = ?auto_110590 ?auto_110596 ) ) ( ON ?auto_110590 ?auto_110591 ) ( CLEAR ?auto_110592 ) ( ON-TABLE ?auto_110595 ) ( ON ?auto_110594 ?auto_110595 ) ( ON ?auto_110593 ?auto_110594 ) ( ON ?auto_110592 ?auto_110593 ) ( not ( = ?auto_110595 ?auto_110594 ) ) ( not ( = ?auto_110595 ?auto_110593 ) ) ( not ( = ?auto_110595 ?auto_110592 ) ) ( not ( = ?auto_110595 ?auto_110596 ) ) ( not ( = ?auto_110594 ?auto_110593 ) ) ( not ( = ?auto_110594 ?auto_110592 ) ) ( not ( = ?auto_110594 ?auto_110596 ) ) ( not ( = ?auto_110593 ?auto_110592 ) ) ( not ( = ?auto_110593 ?auto_110596 ) ) ( not ( = ?auto_110592 ?auto_110596 ) ) ( not ( = ?auto_110589 ?auto_110592 ) ) ( not ( = ?auto_110589 ?auto_110595 ) ) ( not ( = ?auto_110589 ?auto_110594 ) ) ( not ( = ?auto_110589 ?auto_110593 ) ) ( not ( = ?auto_110591 ?auto_110592 ) ) ( not ( = ?auto_110591 ?auto_110595 ) ) ( not ( = ?auto_110591 ?auto_110594 ) ) ( not ( = ?auto_110591 ?auto_110593 ) ) ( not ( = ?auto_110590 ?auto_110592 ) ) ( not ( = ?auto_110590 ?auto_110595 ) ) ( not ( = ?auto_110590 ?auto_110594 ) ) ( not ( = ?auto_110590 ?auto_110593 ) ) ( ON ?auto_110596 ?auto_110590 ) ( CLEAR ?auto_110596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110589 ?auto_110591 ?auto_110590 )
      ( MAKE-1PILE ?auto_110589 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110597 - BLOCK
    )
    :vars
    (
      ?auto_110599 - BLOCK
      ?auto_110601 - BLOCK
      ?auto_110604 - BLOCK
      ?auto_110600 - BLOCK
      ?auto_110603 - BLOCK
      ?auto_110598 - BLOCK
      ?auto_110602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110599 ?auto_110597 ) ( ON-TABLE ?auto_110597 ) ( not ( = ?auto_110597 ?auto_110599 ) ) ( not ( = ?auto_110597 ?auto_110601 ) ) ( not ( = ?auto_110597 ?auto_110604 ) ) ( not ( = ?auto_110599 ?auto_110601 ) ) ( not ( = ?auto_110599 ?auto_110604 ) ) ( not ( = ?auto_110601 ?auto_110604 ) ) ( ON ?auto_110601 ?auto_110599 ) ( ON-TABLE ?auto_110600 ) ( ON ?auto_110603 ?auto_110600 ) ( ON ?auto_110598 ?auto_110603 ) ( not ( = ?auto_110600 ?auto_110603 ) ) ( not ( = ?auto_110600 ?auto_110598 ) ) ( not ( = ?auto_110600 ?auto_110602 ) ) ( not ( = ?auto_110600 ?auto_110604 ) ) ( not ( = ?auto_110603 ?auto_110598 ) ) ( not ( = ?auto_110603 ?auto_110602 ) ) ( not ( = ?auto_110603 ?auto_110604 ) ) ( not ( = ?auto_110598 ?auto_110602 ) ) ( not ( = ?auto_110598 ?auto_110604 ) ) ( not ( = ?auto_110602 ?auto_110604 ) ) ( not ( = ?auto_110597 ?auto_110602 ) ) ( not ( = ?auto_110597 ?auto_110600 ) ) ( not ( = ?auto_110597 ?auto_110603 ) ) ( not ( = ?auto_110597 ?auto_110598 ) ) ( not ( = ?auto_110599 ?auto_110602 ) ) ( not ( = ?auto_110599 ?auto_110600 ) ) ( not ( = ?auto_110599 ?auto_110603 ) ) ( not ( = ?auto_110599 ?auto_110598 ) ) ( not ( = ?auto_110601 ?auto_110602 ) ) ( not ( = ?auto_110601 ?auto_110600 ) ) ( not ( = ?auto_110601 ?auto_110603 ) ) ( not ( = ?auto_110601 ?auto_110598 ) ) ( ON ?auto_110604 ?auto_110601 ) ( CLEAR ?auto_110604 ) ( HOLDING ?auto_110602 ) ( CLEAR ?auto_110598 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110600 ?auto_110603 ?auto_110598 ?auto_110602 )
      ( MAKE-1PILE ?auto_110597 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110605 - BLOCK
    )
    :vars
    (
      ?auto_110611 - BLOCK
      ?auto_110610 - BLOCK
      ?auto_110608 - BLOCK
      ?auto_110609 - BLOCK
      ?auto_110607 - BLOCK
      ?auto_110612 - BLOCK
      ?auto_110606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110611 ?auto_110605 ) ( ON-TABLE ?auto_110605 ) ( not ( = ?auto_110605 ?auto_110611 ) ) ( not ( = ?auto_110605 ?auto_110610 ) ) ( not ( = ?auto_110605 ?auto_110608 ) ) ( not ( = ?auto_110611 ?auto_110610 ) ) ( not ( = ?auto_110611 ?auto_110608 ) ) ( not ( = ?auto_110610 ?auto_110608 ) ) ( ON ?auto_110610 ?auto_110611 ) ( ON-TABLE ?auto_110609 ) ( ON ?auto_110607 ?auto_110609 ) ( ON ?auto_110612 ?auto_110607 ) ( not ( = ?auto_110609 ?auto_110607 ) ) ( not ( = ?auto_110609 ?auto_110612 ) ) ( not ( = ?auto_110609 ?auto_110606 ) ) ( not ( = ?auto_110609 ?auto_110608 ) ) ( not ( = ?auto_110607 ?auto_110612 ) ) ( not ( = ?auto_110607 ?auto_110606 ) ) ( not ( = ?auto_110607 ?auto_110608 ) ) ( not ( = ?auto_110612 ?auto_110606 ) ) ( not ( = ?auto_110612 ?auto_110608 ) ) ( not ( = ?auto_110606 ?auto_110608 ) ) ( not ( = ?auto_110605 ?auto_110606 ) ) ( not ( = ?auto_110605 ?auto_110609 ) ) ( not ( = ?auto_110605 ?auto_110607 ) ) ( not ( = ?auto_110605 ?auto_110612 ) ) ( not ( = ?auto_110611 ?auto_110606 ) ) ( not ( = ?auto_110611 ?auto_110609 ) ) ( not ( = ?auto_110611 ?auto_110607 ) ) ( not ( = ?auto_110611 ?auto_110612 ) ) ( not ( = ?auto_110610 ?auto_110606 ) ) ( not ( = ?auto_110610 ?auto_110609 ) ) ( not ( = ?auto_110610 ?auto_110607 ) ) ( not ( = ?auto_110610 ?auto_110612 ) ) ( ON ?auto_110608 ?auto_110610 ) ( CLEAR ?auto_110612 ) ( ON ?auto_110606 ?auto_110608 ) ( CLEAR ?auto_110606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110605 ?auto_110611 ?auto_110610 ?auto_110608 )
      ( MAKE-1PILE ?auto_110605 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110613 - BLOCK
    )
    :vars
    (
      ?auto_110614 - BLOCK
      ?auto_110616 - BLOCK
      ?auto_110619 - BLOCK
      ?auto_110618 - BLOCK
      ?auto_110617 - BLOCK
      ?auto_110615 - BLOCK
      ?auto_110620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110614 ?auto_110613 ) ( ON-TABLE ?auto_110613 ) ( not ( = ?auto_110613 ?auto_110614 ) ) ( not ( = ?auto_110613 ?auto_110616 ) ) ( not ( = ?auto_110613 ?auto_110619 ) ) ( not ( = ?auto_110614 ?auto_110616 ) ) ( not ( = ?auto_110614 ?auto_110619 ) ) ( not ( = ?auto_110616 ?auto_110619 ) ) ( ON ?auto_110616 ?auto_110614 ) ( ON-TABLE ?auto_110618 ) ( ON ?auto_110617 ?auto_110618 ) ( not ( = ?auto_110618 ?auto_110617 ) ) ( not ( = ?auto_110618 ?auto_110615 ) ) ( not ( = ?auto_110618 ?auto_110620 ) ) ( not ( = ?auto_110618 ?auto_110619 ) ) ( not ( = ?auto_110617 ?auto_110615 ) ) ( not ( = ?auto_110617 ?auto_110620 ) ) ( not ( = ?auto_110617 ?auto_110619 ) ) ( not ( = ?auto_110615 ?auto_110620 ) ) ( not ( = ?auto_110615 ?auto_110619 ) ) ( not ( = ?auto_110620 ?auto_110619 ) ) ( not ( = ?auto_110613 ?auto_110620 ) ) ( not ( = ?auto_110613 ?auto_110618 ) ) ( not ( = ?auto_110613 ?auto_110617 ) ) ( not ( = ?auto_110613 ?auto_110615 ) ) ( not ( = ?auto_110614 ?auto_110620 ) ) ( not ( = ?auto_110614 ?auto_110618 ) ) ( not ( = ?auto_110614 ?auto_110617 ) ) ( not ( = ?auto_110614 ?auto_110615 ) ) ( not ( = ?auto_110616 ?auto_110620 ) ) ( not ( = ?auto_110616 ?auto_110618 ) ) ( not ( = ?auto_110616 ?auto_110617 ) ) ( not ( = ?auto_110616 ?auto_110615 ) ) ( ON ?auto_110619 ?auto_110616 ) ( ON ?auto_110620 ?auto_110619 ) ( CLEAR ?auto_110620 ) ( HOLDING ?auto_110615 ) ( CLEAR ?auto_110617 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110618 ?auto_110617 ?auto_110615 )
      ( MAKE-1PILE ?auto_110613 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110621 - BLOCK
    )
    :vars
    (
      ?auto_110626 - BLOCK
      ?auto_110624 - BLOCK
      ?auto_110625 - BLOCK
      ?auto_110627 - BLOCK
      ?auto_110623 - BLOCK
      ?auto_110622 - BLOCK
      ?auto_110628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110626 ?auto_110621 ) ( ON-TABLE ?auto_110621 ) ( not ( = ?auto_110621 ?auto_110626 ) ) ( not ( = ?auto_110621 ?auto_110624 ) ) ( not ( = ?auto_110621 ?auto_110625 ) ) ( not ( = ?auto_110626 ?auto_110624 ) ) ( not ( = ?auto_110626 ?auto_110625 ) ) ( not ( = ?auto_110624 ?auto_110625 ) ) ( ON ?auto_110624 ?auto_110626 ) ( ON-TABLE ?auto_110627 ) ( ON ?auto_110623 ?auto_110627 ) ( not ( = ?auto_110627 ?auto_110623 ) ) ( not ( = ?auto_110627 ?auto_110622 ) ) ( not ( = ?auto_110627 ?auto_110628 ) ) ( not ( = ?auto_110627 ?auto_110625 ) ) ( not ( = ?auto_110623 ?auto_110622 ) ) ( not ( = ?auto_110623 ?auto_110628 ) ) ( not ( = ?auto_110623 ?auto_110625 ) ) ( not ( = ?auto_110622 ?auto_110628 ) ) ( not ( = ?auto_110622 ?auto_110625 ) ) ( not ( = ?auto_110628 ?auto_110625 ) ) ( not ( = ?auto_110621 ?auto_110628 ) ) ( not ( = ?auto_110621 ?auto_110627 ) ) ( not ( = ?auto_110621 ?auto_110623 ) ) ( not ( = ?auto_110621 ?auto_110622 ) ) ( not ( = ?auto_110626 ?auto_110628 ) ) ( not ( = ?auto_110626 ?auto_110627 ) ) ( not ( = ?auto_110626 ?auto_110623 ) ) ( not ( = ?auto_110626 ?auto_110622 ) ) ( not ( = ?auto_110624 ?auto_110628 ) ) ( not ( = ?auto_110624 ?auto_110627 ) ) ( not ( = ?auto_110624 ?auto_110623 ) ) ( not ( = ?auto_110624 ?auto_110622 ) ) ( ON ?auto_110625 ?auto_110624 ) ( ON ?auto_110628 ?auto_110625 ) ( CLEAR ?auto_110623 ) ( ON ?auto_110622 ?auto_110628 ) ( CLEAR ?auto_110622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110621 ?auto_110626 ?auto_110624 ?auto_110625 ?auto_110628 )
      ( MAKE-1PILE ?auto_110621 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110629 - BLOCK
    )
    :vars
    (
      ?auto_110632 - BLOCK
      ?auto_110631 - BLOCK
      ?auto_110635 - BLOCK
      ?auto_110634 - BLOCK
      ?auto_110633 - BLOCK
      ?auto_110630 - BLOCK
      ?auto_110636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110632 ?auto_110629 ) ( ON-TABLE ?auto_110629 ) ( not ( = ?auto_110629 ?auto_110632 ) ) ( not ( = ?auto_110629 ?auto_110631 ) ) ( not ( = ?auto_110629 ?auto_110635 ) ) ( not ( = ?auto_110632 ?auto_110631 ) ) ( not ( = ?auto_110632 ?auto_110635 ) ) ( not ( = ?auto_110631 ?auto_110635 ) ) ( ON ?auto_110631 ?auto_110632 ) ( ON-TABLE ?auto_110634 ) ( not ( = ?auto_110634 ?auto_110633 ) ) ( not ( = ?auto_110634 ?auto_110630 ) ) ( not ( = ?auto_110634 ?auto_110636 ) ) ( not ( = ?auto_110634 ?auto_110635 ) ) ( not ( = ?auto_110633 ?auto_110630 ) ) ( not ( = ?auto_110633 ?auto_110636 ) ) ( not ( = ?auto_110633 ?auto_110635 ) ) ( not ( = ?auto_110630 ?auto_110636 ) ) ( not ( = ?auto_110630 ?auto_110635 ) ) ( not ( = ?auto_110636 ?auto_110635 ) ) ( not ( = ?auto_110629 ?auto_110636 ) ) ( not ( = ?auto_110629 ?auto_110634 ) ) ( not ( = ?auto_110629 ?auto_110633 ) ) ( not ( = ?auto_110629 ?auto_110630 ) ) ( not ( = ?auto_110632 ?auto_110636 ) ) ( not ( = ?auto_110632 ?auto_110634 ) ) ( not ( = ?auto_110632 ?auto_110633 ) ) ( not ( = ?auto_110632 ?auto_110630 ) ) ( not ( = ?auto_110631 ?auto_110636 ) ) ( not ( = ?auto_110631 ?auto_110634 ) ) ( not ( = ?auto_110631 ?auto_110633 ) ) ( not ( = ?auto_110631 ?auto_110630 ) ) ( ON ?auto_110635 ?auto_110631 ) ( ON ?auto_110636 ?auto_110635 ) ( ON ?auto_110630 ?auto_110636 ) ( CLEAR ?auto_110630 ) ( HOLDING ?auto_110633 ) ( CLEAR ?auto_110634 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110634 ?auto_110633 )
      ( MAKE-1PILE ?auto_110629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110637 - BLOCK
    )
    :vars
    (
      ?auto_110643 - BLOCK
      ?auto_110640 - BLOCK
      ?auto_110638 - BLOCK
      ?auto_110642 - BLOCK
      ?auto_110644 - BLOCK
      ?auto_110639 - BLOCK
      ?auto_110641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110643 ?auto_110637 ) ( ON-TABLE ?auto_110637 ) ( not ( = ?auto_110637 ?auto_110643 ) ) ( not ( = ?auto_110637 ?auto_110640 ) ) ( not ( = ?auto_110637 ?auto_110638 ) ) ( not ( = ?auto_110643 ?auto_110640 ) ) ( not ( = ?auto_110643 ?auto_110638 ) ) ( not ( = ?auto_110640 ?auto_110638 ) ) ( ON ?auto_110640 ?auto_110643 ) ( ON-TABLE ?auto_110642 ) ( not ( = ?auto_110642 ?auto_110644 ) ) ( not ( = ?auto_110642 ?auto_110639 ) ) ( not ( = ?auto_110642 ?auto_110641 ) ) ( not ( = ?auto_110642 ?auto_110638 ) ) ( not ( = ?auto_110644 ?auto_110639 ) ) ( not ( = ?auto_110644 ?auto_110641 ) ) ( not ( = ?auto_110644 ?auto_110638 ) ) ( not ( = ?auto_110639 ?auto_110641 ) ) ( not ( = ?auto_110639 ?auto_110638 ) ) ( not ( = ?auto_110641 ?auto_110638 ) ) ( not ( = ?auto_110637 ?auto_110641 ) ) ( not ( = ?auto_110637 ?auto_110642 ) ) ( not ( = ?auto_110637 ?auto_110644 ) ) ( not ( = ?auto_110637 ?auto_110639 ) ) ( not ( = ?auto_110643 ?auto_110641 ) ) ( not ( = ?auto_110643 ?auto_110642 ) ) ( not ( = ?auto_110643 ?auto_110644 ) ) ( not ( = ?auto_110643 ?auto_110639 ) ) ( not ( = ?auto_110640 ?auto_110641 ) ) ( not ( = ?auto_110640 ?auto_110642 ) ) ( not ( = ?auto_110640 ?auto_110644 ) ) ( not ( = ?auto_110640 ?auto_110639 ) ) ( ON ?auto_110638 ?auto_110640 ) ( ON ?auto_110641 ?auto_110638 ) ( ON ?auto_110639 ?auto_110641 ) ( CLEAR ?auto_110642 ) ( ON ?auto_110644 ?auto_110639 ) ( CLEAR ?auto_110644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110637 ?auto_110643 ?auto_110640 ?auto_110638 ?auto_110641 ?auto_110639 )
      ( MAKE-1PILE ?auto_110637 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110645 - BLOCK
    )
    :vars
    (
      ?auto_110649 - BLOCK
      ?auto_110652 - BLOCK
      ?auto_110648 - BLOCK
      ?auto_110646 - BLOCK
      ?auto_110647 - BLOCK
      ?auto_110651 - BLOCK
      ?auto_110650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110649 ?auto_110645 ) ( ON-TABLE ?auto_110645 ) ( not ( = ?auto_110645 ?auto_110649 ) ) ( not ( = ?auto_110645 ?auto_110652 ) ) ( not ( = ?auto_110645 ?auto_110648 ) ) ( not ( = ?auto_110649 ?auto_110652 ) ) ( not ( = ?auto_110649 ?auto_110648 ) ) ( not ( = ?auto_110652 ?auto_110648 ) ) ( ON ?auto_110652 ?auto_110649 ) ( not ( = ?auto_110646 ?auto_110647 ) ) ( not ( = ?auto_110646 ?auto_110651 ) ) ( not ( = ?auto_110646 ?auto_110650 ) ) ( not ( = ?auto_110646 ?auto_110648 ) ) ( not ( = ?auto_110647 ?auto_110651 ) ) ( not ( = ?auto_110647 ?auto_110650 ) ) ( not ( = ?auto_110647 ?auto_110648 ) ) ( not ( = ?auto_110651 ?auto_110650 ) ) ( not ( = ?auto_110651 ?auto_110648 ) ) ( not ( = ?auto_110650 ?auto_110648 ) ) ( not ( = ?auto_110645 ?auto_110650 ) ) ( not ( = ?auto_110645 ?auto_110646 ) ) ( not ( = ?auto_110645 ?auto_110647 ) ) ( not ( = ?auto_110645 ?auto_110651 ) ) ( not ( = ?auto_110649 ?auto_110650 ) ) ( not ( = ?auto_110649 ?auto_110646 ) ) ( not ( = ?auto_110649 ?auto_110647 ) ) ( not ( = ?auto_110649 ?auto_110651 ) ) ( not ( = ?auto_110652 ?auto_110650 ) ) ( not ( = ?auto_110652 ?auto_110646 ) ) ( not ( = ?auto_110652 ?auto_110647 ) ) ( not ( = ?auto_110652 ?auto_110651 ) ) ( ON ?auto_110648 ?auto_110652 ) ( ON ?auto_110650 ?auto_110648 ) ( ON ?auto_110651 ?auto_110650 ) ( ON ?auto_110647 ?auto_110651 ) ( CLEAR ?auto_110647 ) ( HOLDING ?auto_110646 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110646 )
      ( MAKE-1PILE ?auto_110645 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110653 - BLOCK
    )
    :vars
    (
      ?auto_110655 - BLOCK
      ?auto_110656 - BLOCK
      ?auto_110659 - BLOCK
      ?auto_110654 - BLOCK
      ?auto_110660 - BLOCK
      ?auto_110657 - BLOCK
      ?auto_110658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110655 ?auto_110653 ) ( ON-TABLE ?auto_110653 ) ( not ( = ?auto_110653 ?auto_110655 ) ) ( not ( = ?auto_110653 ?auto_110656 ) ) ( not ( = ?auto_110653 ?auto_110659 ) ) ( not ( = ?auto_110655 ?auto_110656 ) ) ( not ( = ?auto_110655 ?auto_110659 ) ) ( not ( = ?auto_110656 ?auto_110659 ) ) ( ON ?auto_110656 ?auto_110655 ) ( not ( = ?auto_110654 ?auto_110660 ) ) ( not ( = ?auto_110654 ?auto_110657 ) ) ( not ( = ?auto_110654 ?auto_110658 ) ) ( not ( = ?auto_110654 ?auto_110659 ) ) ( not ( = ?auto_110660 ?auto_110657 ) ) ( not ( = ?auto_110660 ?auto_110658 ) ) ( not ( = ?auto_110660 ?auto_110659 ) ) ( not ( = ?auto_110657 ?auto_110658 ) ) ( not ( = ?auto_110657 ?auto_110659 ) ) ( not ( = ?auto_110658 ?auto_110659 ) ) ( not ( = ?auto_110653 ?auto_110658 ) ) ( not ( = ?auto_110653 ?auto_110654 ) ) ( not ( = ?auto_110653 ?auto_110660 ) ) ( not ( = ?auto_110653 ?auto_110657 ) ) ( not ( = ?auto_110655 ?auto_110658 ) ) ( not ( = ?auto_110655 ?auto_110654 ) ) ( not ( = ?auto_110655 ?auto_110660 ) ) ( not ( = ?auto_110655 ?auto_110657 ) ) ( not ( = ?auto_110656 ?auto_110658 ) ) ( not ( = ?auto_110656 ?auto_110654 ) ) ( not ( = ?auto_110656 ?auto_110660 ) ) ( not ( = ?auto_110656 ?auto_110657 ) ) ( ON ?auto_110659 ?auto_110656 ) ( ON ?auto_110658 ?auto_110659 ) ( ON ?auto_110657 ?auto_110658 ) ( ON ?auto_110660 ?auto_110657 ) ( ON ?auto_110654 ?auto_110660 ) ( CLEAR ?auto_110654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110653 ?auto_110655 ?auto_110656 ?auto_110659 ?auto_110658 ?auto_110657 ?auto_110660 )
      ( MAKE-1PILE ?auto_110653 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110668 - BLOCK
      ?auto_110669 - BLOCK
      ?auto_110670 - BLOCK
      ?auto_110671 - BLOCK
      ?auto_110672 - BLOCK
      ?auto_110673 - BLOCK
      ?auto_110674 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_110674 ) ( CLEAR ?auto_110673 ) ( ON-TABLE ?auto_110668 ) ( ON ?auto_110669 ?auto_110668 ) ( ON ?auto_110670 ?auto_110669 ) ( ON ?auto_110671 ?auto_110670 ) ( ON ?auto_110672 ?auto_110671 ) ( ON ?auto_110673 ?auto_110672 ) ( not ( = ?auto_110668 ?auto_110669 ) ) ( not ( = ?auto_110668 ?auto_110670 ) ) ( not ( = ?auto_110668 ?auto_110671 ) ) ( not ( = ?auto_110668 ?auto_110672 ) ) ( not ( = ?auto_110668 ?auto_110673 ) ) ( not ( = ?auto_110668 ?auto_110674 ) ) ( not ( = ?auto_110669 ?auto_110670 ) ) ( not ( = ?auto_110669 ?auto_110671 ) ) ( not ( = ?auto_110669 ?auto_110672 ) ) ( not ( = ?auto_110669 ?auto_110673 ) ) ( not ( = ?auto_110669 ?auto_110674 ) ) ( not ( = ?auto_110670 ?auto_110671 ) ) ( not ( = ?auto_110670 ?auto_110672 ) ) ( not ( = ?auto_110670 ?auto_110673 ) ) ( not ( = ?auto_110670 ?auto_110674 ) ) ( not ( = ?auto_110671 ?auto_110672 ) ) ( not ( = ?auto_110671 ?auto_110673 ) ) ( not ( = ?auto_110671 ?auto_110674 ) ) ( not ( = ?auto_110672 ?auto_110673 ) ) ( not ( = ?auto_110672 ?auto_110674 ) ) ( not ( = ?auto_110673 ?auto_110674 ) ) )
    :subtasks
    ( ( !STACK ?auto_110674 ?auto_110673 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110675 - BLOCK
      ?auto_110676 - BLOCK
      ?auto_110677 - BLOCK
      ?auto_110678 - BLOCK
      ?auto_110679 - BLOCK
      ?auto_110680 - BLOCK
      ?auto_110681 - BLOCK
    )
    :vars
    (
      ?auto_110682 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_110680 ) ( ON-TABLE ?auto_110675 ) ( ON ?auto_110676 ?auto_110675 ) ( ON ?auto_110677 ?auto_110676 ) ( ON ?auto_110678 ?auto_110677 ) ( ON ?auto_110679 ?auto_110678 ) ( ON ?auto_110680 ?auto_110679 ) ( not ( = ?auto_110675 ?auto_110676 ) ) ( not ( = ?auto_110675 ?auto_110677 ) ) ( not ( = ?auto_110675 ?auto_110678 ) ) ( not ( = ?auto_110675 ?auto_110679 ) ) ( not ( = ?auto_110675 ?auto_110680 ) ) ( not ( = ?auto_110675 ?auto_110681 ) ) ( not ( = ?auto_110676 ?auto_110677 ) ) ( not ( = ?auto_110676 ?auto_110678 ) ) ( not ( = ?auto_110676 ?auto_110679 ) ) ( not ( = ?auto_110676 ?auto_110680 ) ) ( not ( = ?auto_110676 ?auto_110681 ) ) ( not ( = ?auto_110677 ?auto_110678 ) ) ( not ( = ?auto_110677 ?auto_110679 ) ) ( not ( = ?auto_110677 ?auto_110680 ) ) ( not ( = ?auto_110677 ?auto_110681 ) ) ( not ( = ?auto_110678 ?auto_110679 ) ) ( not ( = ?auto_110678 ?auto_110680 ) ) ( not ( = ?auto_110678 ?auto_110681 ) ) ( not ( = ?auto_110679 ?auto_110680 ) ) ( not ( = ?auto_110679 ?auto_110681 ) ) ( not ( = ?auto_110680 ?auto_110681 ) ) ( ON ?auto_110681 ?auto_110682 ) ( CLEAR ?auto_110681 ) ( HAND-EMPTY ) ( not ( = ?auto_110675 ?auto_110682 ) ) ( not ( = ?auto_110676 ?auto_110682 ) ) ( not ( = ?auto_110677 ?auto_110682 ) ) ( not ( = ?auto_110678 ?auto_110682 ) ) ( not ( = ?auto_110679 ?auto_110682 ) ) ( not ( = ?auto_110680 ?auto_110682 ) ) ( not ( = ?auto_110681 ?auto_110682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110681 ?auto_110682 )
      ( MAKE-7PILE ?auto_110675 ?auto_110676 ?auto_110677 ?auto_110678 ?auto_110679 ?auto_110680 ?auto_110681 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110683 - BLOCK
      ?auto_110684 - BLOCK
      ?auto_110685 - BLOCK
      ?auto_110686 - BLOCK
      ?auto_110687 - BLOCK
      ?auto_110688 - BLOCK
      ?auto_110689 - BLOCK
    )
    :vars
    (
      ?auto_110690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110683 ) ( ON ?auto_110684 ?auto_110683 ) ( ON ?auto_110685 ?auto_110684 ) ( ON ?auto_110686 ?auto_110685 ) ( ON ?auto_110687 ?auto_110686 ) ( not ( = ?auto_110683 ?auto_110684 ) ) ( not ( = ?auto_110683 ?auto_110685 ) ) ( not ( = ?auto_110683 ?auto_110686 ) ) ( not ( = ?auto_110683 ?auto_110687 ) ) ( not ( = ?auto_110683 ?auto_110688 ) ) ( not ( = ?auto_110683 ?auto_110689 ) ) ( not ( = ?auto_110684 ?auto_110685 ) ) ( not ( = ?auto_110684 ?auto_110686 ) ) ( not ( = ?auto_110684 ?auto_110687 ) ) ( not ( = ?auto_110684 ?auto_110688 ) ) ( not ( = ?auto_110684 ?auto_110689 ) ) ( not ( = ?auto_110685 ?auto_110686 ) ) ( not ( = ?auto_110685 ?auto_110687 ) ) ( not ( = ?auto_110685 ?auto_110688 ) ) ( not ( = ?auto_110685 ?auto_110689 ) ) ( not ( = ?auto_110686 ?auto_110687 ) ) ( not ( = ?auto_110686 ?auto_110688 ) ) ( not ( = ?auto_110686 ?auto_110689 ) ) ( not ( = ?auto_110687 ?auto_110688 ) ) ( not ( = ?auto_110687 ?auto_110689 ) ) ( not ( = ?auto_110688 ?auto_110689 ) ) ( ON ?auto_110689 ?auto_110690 ) ( CLEAR ?auto_110689 ) ( not ( = ?auto_110683 ?auto_110690 ) ) ( not ( = ?auto_110684 ?auto_110690 ) ) ( not ( = ?auto_110685 ?auto_110690 ) ) ( not ( = ?auto_110686 ?auto_110690 ) ) ( not ( = ?auto_110687 ?auto_110690 ) ) ( not ( = ?auto_110688 ?auto_110690 ) ) ( not ( = ?auto_110689 ?auto_110690 ) ) ( HOLDING ?auto_110688 ) ( CLEAR ?auto_110687 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110683 ?auto_110684 ?auto_110685 ?auto_110686 ?auto_110687 ?auto_110688 )
      ( MAKE-7PILE ?auto_110683 ?auto_110684 ?auto_110685 ?auto_110686 ?auto_110687 ?auto_110688 ?auto_110689 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110691 - BLOCK
      ?auto_110692 - BLOCK
      ?auto_110693 - BLOCK
      ?auto_110694 - BLOCK
      ?auto_110695 - BLOCK
      ?auto_110696 - BLOCK
      ?auto_110697 - BLOCK
    )
    :vars
    (
      ?auto_110698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110691 ) ( ON ?auto_110692 ?auto_110691 ) ( ON ?auto_110693 ?auto_110692 ) ( ON ?auto_110694 ?auto_110693 ) ( ON ?auto_110695 ?auto_110694 ) ( not ( = ?auto_110691 ?auto_110692 ) ) ( not ( = ?auto_110691 ?auto_110693 ) ) ( not ( = ?auto_110691 ?auto_110694 ) ) ( not ( = ?auto_110691 ?auto_110695 ) ) ( not ( = ?auto_110691 ?auto_110696 ) ) ( not ( = ?auto_110691 ?auto_110697 ) ) ( not ( = ?auto_110692 ?auto_110693 ) ) ( not ( = ?auto_110692 ?auto_110694 ) ) ( not ( = ?auto_110692 ?auto_110695 ) ) ( not ( = ?auto_110692 ?auto_110696 ) ) ( not ( = ?auto_110692 ?auto_110697 ) ) ( not ( = ?auto_110693 ?auto_110694 ) ) ( not ( = ?auto_110693 ?auto_110695 ) ) ( not ( = ?auto_110693 ?auto_110696 ) ) ( not ( = ?auto_110693 ?auto_110697 ) ) ( not ( = ?auto_110694 ?auto_110695 ) ) ( not ( = ?auto_110694 ?auto_110696 ) ) ( not ( = ?auto_110694 ?auto_110697 ) ) ( not ( = ?auto_110695 ?auto_110696 ) ) ( not ( = ?auto_110695 ?auto_110697 ) ) ( not ( = ?auto_110696 ?auto_110697 ) ) ( ON ?auto_110697 ?auto_110698 ) ( not ( = ?auto_110691 ?auto_110698 ) ) ( not ( = ?auto_110692 ?auto_110698 ) ) ( not ( = ?auto_110693 ?auto_110698 ) ) ( not ( = ?auto_110694 ?auto_110698 ) ) ( not ( = ?auto_110695 ?auto_110698 ) ) ( not ( = ?auto_110696 ?auto_110698 ) ) ( not ( = ?auto_110697 ?auto_110698 ) ) ( CLEAR ?auto_110695 ) ( ON ?auto_110696 ?auto_110697 ) ( CLEAR ?auto_110696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110698 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110698 ?auto_110697 )
      ( MAKE-7PILE ?auto_110691 ?auto_110692 ?auto_110693 ?auto_110694 ?auto_110695 ?auto_110696 ?auto_110697 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110699 - BLOCK
      ?auto_110700 - BLOCK
      ?auto_110701 - BLOCK
      ?auto_110702 - BLOCK
      ?auto_110703 - BLOCK
      ?auto_110704 - BLOCK
      ?auto_110705 - BLOCK
    )
    :vars
    (
      ?auto_110706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110699 ) ( ON ?auto_110700 ?auto_110699 ) ( ON ?auto_110701 ?auto_110700 ) ( ON ?auto_110702 ?auto_110701 ) ( not ( = ?auto_110699 ?auto_110700 ) ) ( not ( = ?auto_110699 ?auto_110701 ) ) ( not ( = ?auto_110699 ?auto_110702 ) ) ( not ( = ?auto_110699 ?auto_110703 ) ) ( not ( = ?auto_110699 ?auto_110704 ) ) ( not ( = ?auto_110699 ?auto_110705 ) ) ( not ( = ?auto_110700 ?auto_110701 ) ) ( not ( = ?auto_110700 ?auto_110702 ) ) ( not ( = ?auto_110700 ?auto_110703 ) ) ( not ( = ?auto_110700 ?auto_110704 ) ) ( not ( = ?auto_110700 ?auto_110705 ) ) ( not ( = ?auto_110701 ?auto_110702 ) ) ( not ( = ?auto_110701 ?auto_110703 ) ) ( not ( = ?auto_110701 ?auto_110704 ) ) ( not ( = ?auto_110701 ?auto_110705 ) ) ( not ( = ?auto_110702 ?auto_110703 ) ) ( not ( = ?auto_110702 ?auto_110704 ) ) ( not ( = ?auto_110702 ?auto_110705 ) ) ( not ( = ?auto_110703 ?auto_110704 ) ) ( not ( = ?auto_110703 ?auto_110705 ) ) ( not ( = ?auto_110704 ?auto_110705 ) ) ( ON ?auto_110705 ?auto_110706 ) ( not ( = ?auto_110699 ?auto_110706 ) ) ( not ( = ?auto_110700 ?auto_110706 ) ) ( not ( = ?auto_110701 ?auto_110706 ) ) ( not ( = ?auto_110702 ?auto_110706 ) ) ( not ( = ?auto_110703 ?auto_110706 ) ) ( not ( = ?auto_110704 ?auto_110706 ) ) ( not ( = ?auto_110705 ?auto_110706 ) ) ( ON ?auto_110704 ?auto_110705 ) ( CLEAR ?auto_110704 ) ( ON-TABLE ?auto_110706 ) ( HOLDING ?auto_110703 ) ( CLEAR ?auto_110702 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110699 ?auto_110700 ?auto_110701 ?auto_110702 ?auto_110703 )
      ( MAKE-7PILE ?auto_110699 ?auto_110700 ?auto_110701 ?auto_110702 ?auto_110703 ?auto_110704 ?auto_110705 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110707 - BLOCK
      ?auto_110708 - BLOCK
      ?auto_110709 - BLOCK
      ?auto_110710 - BLOCK
      ?auto_110711 - BLOCK
      ?auto_110712 - BLOCK
      ?auto_110713 - BLOCK
    )
    :vars
    (
      ?auto_110714 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110707 ) ( ON ?auto_110708 ?auto_110707 ) ( ON ?auto_110709 ?auto_110708 ) ( ON ?auto_110710 ?auto_110709 ) ( not ( = ?auto_110707 ?auto_110708 ) ) ( not ( = ?auto_110707 ?auto_110709 ) ) ( not ( = ?auto_110707 ?auto_110710 ) ) ( not ( = ?auto_110707 ?auto_110711 ) ) ( not ( = ?auto_110707 ?auto_110712 ) ) ( not ( = ?auto_110707 ?auto_110713 ) ) ( not ( = ?auto_110708 ?auto_110709 ) ) ( not ( = ?auto_110708 ?auto_110710 ) ) ( not ( = ?auto_110708 ?auto_110711 ) ) ( not ( = ?auto_110708 ?auto_110712 ) ) ( not ( = ?auto_110708 ?auto_110713 ) ) ( not ( = ?auto_110709 ?auto_110710 ) ) ( not ( = ?auto_110709 ?auto_110711 ) ) ( not ( = ?auto_110709 ?auto_110712 ) ) ( not ( = ?auto_110709 ?auto_110713 ) ) ( not ( = ?auto_110710 ?auto_110711 ) ) ( not ( = ?auto_110710 ?auto_110712 ) ) ( not ( = ?auto_110710 ?auto_110713 ) ) ( not ( = ?auto_110711 ?auto_110712 ) ) ( not ( = ?auto_110711 ?auto_110713 ) ) ( not ( = ?auto_110712 ?auto_110713 ) ) ( ON ?auto_110713 ?auto_110714 ) ( not ( = ?auto_110707 ?auto_110714 ) ) ( not ( = ?auto_110708 ?auto_110714 ) ) ( not ( = ?auto_110709 ?auto_110714 ) ) ( not ( = ?auto_110710 ?auto_110714 ) ) ( not ( = ?auto_110711 ?auto_110714 ) ) ( not ( = ?auto_110712 ?auto_110714 ) ) ( not ( = ?auto_110713 ?auto_110714 ) ) ( ON ?auto_110712 ?auto_110713 ) ( ON-TABLE ?auto_110714 ) ( CLEAR ?auto_110710 ) ( ON ?auto_110711 ?auto_110712 ) ( CLEAR ?auto_110711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110714 ?auto_110713 ?auto_110712 )
      ( MAKE-7PILE ?auto_110707 ?auto_110708 ?auto_110709 ?auto_110710 ?auto_110711 ?auto_110712 ?auto_110713 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110715 - BLOCK
      ?auto_110716 - BLOCK
      ?auto_110717 - BLOCK
      ?auto_110718 - BLOCK
      ?auto_110719 - BLOCK
      ?auto_110720 - BLOCK
      ?auto_110721 - BLOCK
    )
    :vars
    (
      ?auto_110722 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110715 ) ( ON ?auto_110716 ?auto_110715 ) ( ON ?auto_110717 ?auto_110716 ) ( not ( = ?auto_110715 ?auto_110716 ) ) ( not ( = ?auto_110715 ?auto_110717 ) ) ( not ( = ?auto_110715 ?auto_110718 ) ) ( not ( = ?auto_110715 ?auto_110719 ) ) ( not ( = ?auto_110715 ?auto_110720 ) ) ( not ( = ?auto_110715 ?auto_110721 ) ) ( not ( = ?auto_110716 ?auto_110717 ) ) ( not ( = ?auto_110716 ?auto_110718 ) ) ( not ( = ?auto_110716 ?auto_110719 ) ) ( not ( = ?auto_110716 ?auto_110720 ) ) ( not ( = ?auto_110716 ?auto_110721 ) ) ( not ( = ?auto_110717 ?auto_110718 ) ) ( not ( = ?auto_110717 ?auto_110719 ) ) ( not ( = ?auto_110717 ?auto_110720 ) ) ( not ( = ?auto_110717 ?auto_110721 ) ) ( not ( = ?auto_110718 ?auto_110719 ) ) ( not ( = ?auto_110718 ?auto_110720 ) ) ( not ( = ?auto_110718 ?auto_110721 ) ) ( not ( = ?auto_110719 ?auto_110720 ) ) ( not ( = ?auto_110719 ?auto_110721 ) ) ( not ( = ?auto_110720 ?auto_110721 ) ) ( ON ?auto_110721 ?auto_110722 ) ( not ( = ?auto_110715 ?auto_110722 ) ) ( not ( = ?auto_110716 ?auto_110722 ) ) ( not ( = ?auto_110717 ?auto_110722 ) ) ( not ( = ?auto_110718 ?auto_110722 ) ) ( not ( = ?auto_110719 ?auto_110722 ) ) ( not ( = ?auto_110720 ?auto_110722 ) ) ( not ( = ?auto_110721 ?auto_110722 ) ) ( ON ?auto_110720 ?auto_110721 ) ( ON-TABLE ?auto_110722 ) ( ON ?auto_110719 ?auto_110720 ) ( CLEAR ?auto_110719 ) ( HOLDING ?auto_110718 ) ( CLEAR ?auto_110717 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110715 ?auto_110716 ?auto_110717 ?auto_110718 )
      ( MAKE-7PILE ?auto_110715 ?auto_110716 ?auto_110717 ?auto_110718 ?auto_110719 ?auto_110720 ?auto_110721 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110723 - BLOCK
      ?auto_110724 - BLOCK
      ?auto_110725 - BLOCK
      ?auto_110726 - BLOCK
      ?auto_110727 - BLOCK
      ?auto_110728 - BLOCK
      ?auto_110729 - BLOCK
    )
    :vars
    (
      ?auto_110730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110723 ) ( ON ?auto_110724 ?auto_110723 ) ( ON ?auto_110725 ?auto_110724 ) ( not ( = ?auto_110723 ?auto_110724 ) ) ( not ( = ?auto_110723 ?auto_110725 ) ) ( not ( = ?auto_110723 ?auto_110726 ) ) ( not ( = ?auto_110723 ?auto_110727 ) ) ( not ( = ?auto_110723 ?auto_110728 ) ) ( not ( = ?auto_110723 ?auto_110729 ) ) ( not ( = ?auto_110724 ?auto_110725 ) ) ( not ( = ?auto_110724 ?auto_110726 ) ) ( not ( = ?auto_110724 ?auto_110727 ) ) ( not ( = ?auto_110724 ?auto_110728 ) ) ( not ( = ?auto_110724 ?auto_110729 ) ) ( not ( = ?auto_110725 ?auto_110726 ) ) ( not ( = ?auto_110725 ?auto_110727 ) ) ( not ( = ?auto_110725 ?auto_110728 ) ) ( not ( = ?auto_110725 ?auto_110729 ) ) ( not ( = ?auto_110726 ?auto_110727 ) ) ( not ( = ?auto_110726 ?auto_110728 ) ) ( not ( = ?auto_110726 ?auto_110729 ) ) ( not ( = ?auto_110727 ?auto_110728 ) ) ( not ( = ?auto_110727 ?auto_110729 ) ) ( not ( = ?auto_110728 ?auto_110729 ) ) ( ON ?auto_110729 ?auto_110730 ) ( not ( = ?auto_110723 ?auto_110730 ) ) ( not ( = ?auto_110724 ?auto_110730 ) ) ( not ( = ?auto_110725 ?auto_110730 ) ) ( not ( = ?auto_110726 ?auto_110730 ) ) ( not ( = ?auto_110727 ?auto_110730 ) ) ( not ( = ?auto_110728 ?auto_110730 ) ) ( not ( = ?auto_110729 ?auto_110730 ) ) ( ON ?auto_110728 ?auto_110729 ) ( ON-TABLE ?auto_110730 ) ( ON ?auto_110727 ?auto_110728 ) ( CLEAR ?auto_110725 ) ( ON ?auto_110726 ?auto_110727 ) ( CLEAR ?auto_110726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110730 ?auto_110729 ?auto_110728 ?auto_110727 )
      ( MAKE-7PILE ?auto_110723 ?auto_110724 ?auto_110725 ?auto_110726 ?auto_110727 ?auto_110728 ?auto_110729 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110731 - BLOCK
      ?auto_110732 - BLOCK
      ?auto_110733 - BLOCK
      ?auto_110734 - BLOCK
      ?auto_110735 - BLOCK
      ?auto_110736 - BLOCK
      ?auto_110737 - BLOCK
    )
    :vars
    (
      ?auto_110738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110731 ) ( ON ?auto_110732 ?auto_110731 ) ( not ( = ?auto_110731 ?auto_110732 ) ) ( not ( = ?auto_110731 ?auto_110733 ) ) ( not ( = ?auto_110731 ?auto_110734 ) ) ( not ( = ?auto_110731 ?auto_110735 ) ) ( not ( = ?auto_110731 ?auto_110736 ) ) ( not ( = ?auto_110731 ?auto_110737 ) ) ( not ( = ?auto_110732 ?auto_110733 ) ) ( not ( = ?auto_110732 ?auto_110734 ) ) ( not ( = ?auto_110732 ?auto_110735 ) ) ( not ( = ?auto_110732 ?auto_110736 ) ) ( not ( = ?auto_110732 ?auto_110737 ) ) ( not ( = ?auto_110733 ?auto_110734 ) ) ( not ( = ?auto_110733 ?auto_110735 ) ) ( not ( = ?auto_110733 ?auto_110736 ) ) ( not ( = ?auto_110733 ?auto_110737 ) ) ( not ( = ?auto_110734 ?auto_110735 ) ) ( not ( = ?auto_110734 ?auto_110736 ) ) ( not ( = ?auto_110734 ?auto_110737 ) ) ( not ( = ?auto_110735 ?auto_110736 ) ) ( not ( = ?auto_110735 ?auto_110737 ) ) ( not ( = ?auto_110736 ?auto_110737 ) ) ( ON ?auto_110737 ?auto_110738 ) ( not ( = ?auto_110731 ?auto_110738 ) ) ( not ( = ?auto_110732 ?auto_110738 ) ) ( not ( = ?auto_110733 ?auto_110738 ) ) ( not ( = ?auto_110734 ?auto_110738 ) ) ( not ( = ?auto_110735 ?auto_110738 ) ) ( not ( = ?auto_110736 ?auto_110738 ) ) ( not ( = ?auto_110737 ?auto_110738 ) ) ( ON ?auto_110736 ?auto_110737 ) ( ON-TABLE ?auto_110738 ) ( ON ?auto_110735 ?auto_110736 ) ( ON ?auto_110734 ?auto_110735 ) ( CLEAR ?auto_110734 ) ( HOLDING ?auto_110733 ) ( CLEAR ?auto_110732 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110731 ?auto_110732 ?auto_110733 )
      ( MAKE-7PILE ?auto_110731 ?auto_110732 ?auto_110733 ?auto_110734 ?auto_110735 ?auto_110736 ?auto_110737 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110739 - BLOCK
      ?auto_110740 - BLOCK
      ?auto_110741 - BLOCK
      ?auto_110742 - BLOCK
      ?auto_110743 - BLOCK
      ?auto_110744 - BLOCK
      ?auto_110745 - BLOCK
    )
    :vars
    (
      ?auto_110746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110739 ) ( ON ?auto_110740 ?auto_110739 ) ( not ( = ?auto_110739 ?auto_110740 ) ) ( not ( = ?auto_110739 ?auto_110741 ) ) ( not ( = ?auto_110739 ?auto_110742 ) ) ( not ( = ?auto_110739 ?auto_110743 ) ) ( not ( = ?auto_110739 ?auto_110744 ) ) ( not ( = ?auto_110739 ?auto_110745 ) ) ( not ( = ?auto_110740 ?auto_110741 ) ) ( not ( = ?auto_110740 ?auto_110742 ) ) ( not ( = ?auto_110740 ?auto_110743 ) ) ( not ( = ?auto_110740 ?auto_110744 ) ) ( not ( = ?auto_110740 ?auto_110745 ) ) ( not ( = ?auto_110741 ?auto_110742 ) ) ( not ( = ?auto_110741 ?auto_110743 ) ) ( not ( = ?auto_110741 ?auto_110744 ) ) ( not ( = ?auto_110741 ?auto_110745 ) ) ( not ( = ?auto_110742 ?auto_110743 ) ) ( not ( = ?auto_110742 ?auto_110744 ) ) ( not ( = ?auto_110742 ?auto_110745 ) ) ( not ( = ?auto_110743 ?auto_110744 ) ) ( not ( = ?auto_110743 ?auto_110745 ) ) ( not ( = ?auto_110744 ?auto_110745 ) ) ( ON ?auto_110745 ?auto_110746 ) ( not ( = ?auto_110739 ?auto_110746 ) ) ( not ( = ?auto_110740 ?auto_110746 ) ) ( not ( = ?auto_110741 ?auto_110746 ) ) ( not ( = ?auto_110742 ?auto_110746 ) ) ( not ( = ?auto_110743 ?auto_110746 ) ) ( not ( = ?auto_110744 ?auto_110746 ) ) ( not ( = ?auto_110745 ?auto_110746 ) ) ( ON ?auto_110744 ?auto_110745 ) ( ON-TABLE ?auto_110746 ) ( ON ?auto_110743 ?auto_110744 ) ( ON ?auto_110742 ?auto_110743 ) ( CLEAR ?auto_110740 ) ( ON ?auto_110741 ?auto_110742 ) ( CLEAR ?auto_110741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110746 ?auto_110745 ?auto_110744 ?auto_110743 ?auto_110742 )
      ( MAKE-7PILE ?auto_110739 ?auto_110740 ?auto_110741 ?auto_110742 ?auto_110743 ?auto_110744 ?auto_110745 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110747 - BLOCK
      ?auto_110748 - BLOCK
      ?auto_110749 - BLOCK
      ?auto_110750 - BLOCK
      ?auto_110751 - BLOCK
      ?auto_110752 - BLOCK
      ?auto_110753 - BLOCK
    )
    :vars
    (
      ?auto_110754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110747 ) ( not ( = ?auto_110747 ?auto_110748 ) ) ( not ( = ?auto_110747 ?auto_110749 ) ) ( not ( = ?auto_110747 ?auto_110750 ) ) ( not ( = ?auto_110747 ?auto_110751 ) ) ( not ( = ?auto_110747 ?auto_110752 ) ) ( not ( = ?auto_110747 ?auto_110753 ) ) ( not ( = ?auto_110748 ?auto_110749 ) ) ( not ( = ?auto_110748 ?auto_110750 ) ) ( not ( = ?auto_110748 ?auto_110751 ) ) ( not ( = ?auto_110748 ?auto_110752 ) ) ( not ( = ?auto_110748 ?auto_110753 ) ) ( not ( = ?auto_110749 ?auto_110750 ) ) ( not ( = ?auto_110749 ?auto_110751 ) ) ( not ( = ?auto_110749 ?auto_110752 ) ) ( not ( = ?auto_110749 ?auto_110753 ) ) ( not ( = ?auto_110750 ?auto_110751 ) ) ( not ( = ?auto_110750 ?auto_110752 ) ) ( not ( = ?auto_110750 ?auto_110753 ) ) ( not ( = ?auto_110751 ?auto_110752 ) ) ( not ( = ?auto_110751 ?auto_110753 ) ) ( not ( = ?auto_110752 ?auto_110753 ) ) ( ON ?auto_110753 ?auto_110754 ) ( not ( = ?auto_110747 ?auto_110754 ) ) ( not ( = ?auto_110748 ?auto_110754 ) ) ( not ( = ?auto_110749 ?auto_110754 ) ) ( not ( = ?auto_110750 ?auto_110754 ) ) ( not ( = ?auto_110751 ?auto_110754 ) ) ( not ( = ?auto_110752 ?auto_110754 ) ) ( not ( = ?auto_110753 ?auto_110754 ) ) ( ON ?auto_110752 ?auto_110753 ) ( ON-TABLE ?auto_110754 ) ( ON ?auto_110751 ?auto_110752 ) ( ON ?auto_110750 ?auto_110751 ) ( ON ?auto_110749 ?auto_110750 ) ( CLEAR ?auto_110749 ) ( HOLDING ?auto_110748 ) ( CLEAR ?auto_110747 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110747 ?auto_110748 )
      ( MAKE-7PILE ?auto_110747 ?auto_110748 ?auto_110749 ?auto_110750 ?auto_110751 ?auto_110752 ?auto_110753 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110755 - BLOCK
      ?auto_110756 - BLOCK
      ?auto_110757 - BLOCK
      ?auto_110758 - BLOCK
      ?auto_110759 - BLOCK
      ?auto_110760 - BLOCK
      ?auto_110761 - BLOCK
    )
    :vars
    (
      ?auto_110762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110755 ) ( not ( = ?auto_110755 ?auto_110756 ) ) ( not ( = ?auto_110755 ?auto_110757 ) ) ( not ( = ?auto_110755 ?auto_110758 ) ) ( not ( = ?auto_110755 ?auto_110759 ) ) ( not ( = ?auto_110755 ?auto_110760 ) ) ( not ( = ?auto_110755 ?auto_110761 ) ) ( not ( = ?auto_110756 ?auto_110757 ) ) ( not ( = ?auto_110756 ?auto_110758 ) ) ( not ( = ?auto_110756 ?auto_110759 ) ) ( not ( = ?auto_110756 ?auto_110760 ) ) ( not ( = ?auto_110756 ?auto_110761 ) ) ( not ( = ?auto_110757 ?auto_110758 ) ) ( not ( = ?auto_110757 ?auto_110759 ) ) ( not ( = ?auto_110757 ?auto_110760 ) ) ( not ( = ?auto_110757 ?auto_110761 ) ) ( not ( = ?auto_110758 ?auto_110759 ) ) ( not ( = ?auto_110758 ?auto_110760 ) ) ( not ( = ?auto_110758 ?auto_110761 ) ) ( not ( = ?auto_110759 ?auto_110760 ) ) ( not ( = ?auto_110759 ?auto_110761 ) ) ( not ( = ?auto_110760 ?auto_110761 ) ) ( ON ?auto_110761 ?auto_110762 ) ( not ( = ?auto_110755 ?auto_110762 ) ) ( not ( = ?auto_110756 ?auto_110762 ) ) ( not ( = ?auto_110757 ?auto_110762 ) ) ( not ( = ?auto_110758 ?auto_110762 ) ) ( not ( = ?auto_110759 ?auto_110762 ) ) ( not ( = ?auto_110760 ?auto_110762 ) ) ( not ( = ?auto_110761 ?auto_110762 ) ) ( ON ?auto_110760 ?auto_110761 ) ( ON-TABLE ?auto_110762 ) ( ON ?auto_110759 ?auto_110760 ) ( ON ?auto_110758 ?auto_110759 ) ( ON ?auto_110757 ?auto_110758 ) ( CLEAR ?auto_110755 ) ( ON ?auto_110756 ?auto_110757 ) ( CLEAR ?auto_110756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110762 ?auto_110761 ?auto_110760 ?auto_110759 ?auto_110758 ?auto_110757 )
      ( MAKE-7PILE ?auto_110755 ?auto_110756 ?auto_110757 ?auto_110758 ?auto_110759 ?auto_110760 ?auto_110761 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110763 - BLOCK
      ?auto_110764 - BLOCK
      ?auto_110765 - BLOCK
      ?auto_110766 - BLOCK
      ?auto_110767 - BLOCK
      ?auto_110768 - BLOCK
      ?auto_110769 - BLOCK
    )
    :vars
    (
      ?auto_110770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110763 ?auto_110764 ) ) ( not ( = ?auto_110763 ?auto_110765 ) ) ( not ( = ?auto_110763 ?auto_110766 ) ) ( not ( = ?auto_110763 ?auto_110767 ) ) ( not ( = ?auto_110763 ?auto_110768 ) ) ( not ( = ?auto_110763 ?auto_110769 ) ) ( not ( = ?auto_110764 ?auto_110765 ) ) ( not ( = ?auto_110764 ?auto_110766 ) ) ( not ( = ?auto_110764 ?auto_110767 ) ) ( not ( = ?auto_110764 ?auto_110768 ) ) ( not ( = ?auto_110764 ?auto_110769 ) ) ( not ( = ?auto_110765 ?auto_110766 ) ) ( not ( = ?auto_110765 ?auto_110767 ) ) ( not ( = ?auto_110765 ?auto_110768 ) ) ( not ( = ?auto_110765 ?auto_110769 ) ) ( not ( = ?auto_110766 ?auto_110767 ) ) ( not ( = ?auto_110766 ?auto_110768 ) ) ( not ( = ?auto_110766 ?auto_110769 ) ) ( not ( = ?auto_110767 ?auto_110768 ) ) ( not ( = ?auto_110767 ?auto_110769 ) ) ( not ( = ?auto_110768 ?auto_110769 ) ) ( ON ?auto_110769 ?auto_110770 ) ( not ( = ?auto_110763 ?auto_110770 ) ) ( not ( = ?auto_110764 ?auto_110770 ) ) ( not ( = ?auto_110765 ?auto_110770 ) ) ( not ( = ?auto_110766 ?auto_110770 ) ) ( not ( = ?auto_110767 ?auto_110770 ) ) ( not ( = ?auto_110768 ?auto_110770 ) ) ( not ( = ?auto_110769 ?auto_110770 ) ) ( ON ?auto_110768 ?auto_110769 ) ( ON-TABLE ?auto_110770 ) ( ON ?auto_110767 ?auto_110768 ) ( ON ?auto_110766 ?auto_110767 ) ( ON ?auto_110765 ?auto_110766 ) ( ON ?auto_110764 ?auto_110765 ) ( CLEAR ?auto_110764 ) ( HOLDING ?auto_110763 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110763 )
      ( MAKE-7PILE ?auto_110763 ?auto_110764 ?auto_110765 ?auto_110766 ?auto_110767 ?auto_110768 ?auto_110769 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110771 - BLOCK
      ?auto_110772 - BLOCK
      ?auto_110773 - BLOCK
      ?auto_110774 - BLOCK
      ?auto_110775 - BLOCK
      ?auto_110776 - BLOCK
      ?auto_110777 - BLOCK
    )
    :vars
    (
      ?auto_110778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110771 ?auto_110772 ) ) ( not ( = ?auto_110771 ?auto_110773 ) ) ( not ( = ?auto_110771 ?auto_110774 ) ) ( not ( = ?auto_110771 ?auto_110775 ) ) ( not ( = ?auto_110771 ?auto_110776 ) ) ( not ( = ?auto_110771 ?auto_110777 ) ) ( not ( = ?auto_110772 ?auto_110773 ) ) ( not ( = ?auto_110772 ?auto_110774 ) ) ( not ( = ?auto_110772 ?auto_110775 ) ) ( not ( = ?auto_110772 ?auto_110776 ) ) ( not ( = ?auto_110772 ?auto_110777 ) ) ( not ( = ?auto_110773 ?auto_110774 ) ) ( not ( = ?auto_110773 ?auto_110775 ) ) ( not ( = ?auto_110773 ?auto_110776 ) ) ( not ( = ?auto_110773 ?auto_110777 ) ) ( not ( = ?auto_110774 ?auto_110775 ) ) ( not ( = ?auto_110774 ?auto_110776 ) ) ( not ( = ?auto_110774 ?auto_110777 ) ) ( not ( = ?auto_110775 ?auto_110776 ) ) ( not ( = ?auto_110775 ?auto_110777 ) ) ( not ( = ?auto_110776 ?auto_110777 ) ) ( ON ?auto_110777 ?auto_110778 ) ( not ( = ?auto_110771 ?auto_110778 ) ) ( not ( = ?auto_110772 ?auto_110778 ) ) ( not ( = ?auto_110773 ?auto_110778 ) ) ( not ( = ?auto_110774 ?auto_110778 ) ) ( not ( = ?auto_110775 ?auto_110778 ) ) ( not ( = ?auto_110776 ?auto_110778 ) ) ( not ( = ?auto_110777 ?auto_110778 ) ) ( ON ?auto_110776 ?auto_110777 ) ( ON-TABLE ?auto_110778 ) ( ON ?auto_110775 ?auto_110776 ) ( ON ?auto_110774 ?auto_110775 ) ( ON ?auto_110773 ?auto_110774 ) ( ON ?auto_110772 ?auto_110773 ) ( ON ?auto_110771 ?auto_110772 ) ( CLEAR ?auto_110771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110778 ?auto_110777 ?auto_110776 ?auto_110775 ?auto_110774 ?auto_110773 ?auto_110772 )
      ( MAKE-7PILE ?auto_110771 ?auto_110772 ?auto_110773 ?auto_110774 ?auto_110775 ?auto_110776 ?auto_110777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110785 - BLOCK
      ?auto_110786 - BLOCK
      ?auto_110787 - BLOCK
      ?auto_110788 - BLOCK
      ?auto_110789 - BLOCK
      ?auto_110790 - BLOCK
    )
    :vars
    (
      ?auto_110791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110791 ?auto_110790 ) ( CLEAR ?auto_110791 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110785 ) ( ON ?auto_110786 ?auto_110785 ) ( ON ?auto_110787 ?auto_110786 ) ( ON ?auto_110788 ?auto_110787 ) ( ON ?auto_110789 ?auto_110788 ) ( ON ?auto_110790 ?auto_110789 ) ( not ( = ?auto_110785 ?auto_110786 ) ) ( not ( = ?auto_110785 ?auto_110787 ) ) ( not ( = ?auto_110785 ?auto_110788 ) ) ( not ( = ?auto_110785 ?auto_110789 ) ) ( not ( = ?auto_110785 ?auto_110790 ) ) ( not ( = ?auto_110785 ?auto_110791 ) ) ( not ( = ?auto_110786 ?auto_110787 ) ) ( not ( = ?auto_110786 ?auto_110788 ) ) ( not ( = ?auto_110786 ?auto_110789 ) ) ( not ( = ?auto_110786 ?auto_110790 ) ) ( not ( = ?auto_110786 ?auto_110791 ) ) ( not ( = ?auto_110787 ?auto_110788 ) ) ( not ( = ?auto_110787 ?auto_110789 ) ) ( not ( = ?auto_110787 ?auto_110790 ) ) ( not ( = ?auto_110787 ?auto_110791 ) ) ( not ( = ?auto_110788 ?auto_110789 ) ) ( not ( = ?auto_110788 ?auto_110790 ) ) ( not ( = ?auto_110788 ?auto_110791 ) ) ( not ( = ?auto_110789 ?auto_110790 ) ) ( not ( = ?auto_110789 ?auto_110791 ) ) ( not ( = ?auto_110790 ?auto_110791 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110791 ?auto_110790 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110807 - BLOCK
      ?auto_110808 - BLOCK
      ?auto_110809 - BLOCK
      ?auto_110810 - BLOCK
      ?auto_110811 - BLOCK
      ?auto_110812 - BLOCK
    )
    :vars
    (
      ?auto_110813 - BLOCK
      ?auto_110814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110807 ) ( ON ?auto_110808 ?auto_110807 ) ( ON ?auto_110809 ?auto_110808 ) ( ON ?auto_110810 ?auto_110809 ) ( ON ?auto_110811 ?auto_110810 ) ( not ( = ?auto_110807 ?auto_110808 ) ) ( not ( = ?auto_110807 ?auto_110809 ) ) ( not ( = ?auto_110807 ?auto_110810 ) ) ( not ( = ?auto_110807 ?auto_110811 ) ) ( not ( = ?auto_110807 ?auto_110812 ) ) ( not ( = ?auto_110807 ?auto_110813 ) ) ( not ( = ?auto_110808 ?auto_110809 ) ) ( not ( = ?auto_110808 ?auto_110810 ) ) ( not ( = ?auto_110808 ?auto_110811 ) ) ( not ( = ?auto_110808 ?auto_110812 ) ) ( not ( = ?auto_110808 ?auto_110813 ) ) ( not ( = ?auto_110809 ?auto_110810 ) ) ( not ( = ?auto_110809 ?auto_110811 ) ) ( not ( = ?auto_110809 ?auto_110812 ) ) ( not ( = ?auto_110809 ?auto_110813 ) ) ( not ( = ?auto_110810 ?auto_110811 ) ) ( not ( = ?auto_110810 ?auto_110812 ) ) ( not ( = ?auto_110810 ?auto_110813 ) ) ( not ( = ?auto_110811 ?auto_110812 ) ) ( not ( = ?auto_110811 ?auto_110813 ) ) ( not ( = ?auto_110812 ?auto_110813 ) ) ( ON ?auto_110813 ?auto_110814 ) ( CLEAR ?auto_110813 ) ( not ( = ?auto_110807 ?auto_110814 ) ) ( not ( = ?auto_110808 ?auto_110814 ) ) ( not ( = ?auto_110809 ?auto_110814 ) ) ( not ( = ?auto_110810 ?auto_110814 ) ) ( not ( = ?auto_110811 ?auto_110814 ) ) ( not ( = ?auto_110812 ?auto_110814 ) ) ( not ( = ?auto_110813 ?auto_110814 ) ) ( HOLDING ?auto_110812 ) ( CLEAR ?auto_110811 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110807 ?auto_110808 ?auto_110809 ?auto_110810 ?auto_110811 ?auto_110812 ?auto_110813 )
      ( MAKE-6PILE ?auto_110807 ?auto_110808 ?auto_110809 ?auto_110810 ?auto_110811 ?auto_110812 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110815 - BLOCK
      ?auto_110816 - BLOCK
      ?auto_110817 - BLOCK
      ?auto_110818 - BLOCK
      ?auto_110819 - BLOCK
      ?auto_110820 - BLOCK
    )
    :vars
    (
      ?auto_110821 - BLOCK
      ?auto_110822 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110815 ) ( ON ?auto_110816 ?auto_110815 ) ( ON ?auto_110817 ?auto_110816 ) ( ON ?auto_110818 ?auto_110817 ) ( ON ?auto_110819 ?auto_110818 ) ( not ( = ?auto_110815 ?auto_110816 ) ) ( not ( = ?auto_110815 ?auto_110817 ) ) ( not ( = ?auto_110815 ?auto_110818 ) ) ( not ( = ?auto_110815 ?auto_110819 ) ) ( not ( = ?auto_110815 ?auto_110820 ) ) ( not ( = ?auto_110815 ?auto_110821 ) ) ( not ( = ?auto_110816 ?auto_110817 ) ) ( not ( = ?auto_110816 ?auto_110818 ) ) ( not ( = ?auto_110816 ?auto_110819 ) ) ( not ( = ?auto_110816 ?auto_110820 ) ) ( not ( = ?auto_110816 ?auto_110821 ) ) ( not ( = ?auto_110817 ?auto_110818 ) ) ( not ( = ?auto_110817 ?auto_110819 ) ) ( not ( = ?auto_110817 ?auto_110820 ) ) ( not ( = ?auto_110817 ?auto_110821 ) ) ( not ( = ?auto_110818 ?auto_110819 ) ) ( not ( = ?auto_110818 ?auto_110820 ) ) ( not ( = ?auto_110818 ?auto_110821 ) ) ( not ( = ?auto_110819 ?auto_110820 ) ) ( not ( = ?auto_110819 ?auto_110821 ) ) ( not ( = ?auto_110820 ?auto_110821 ) ) ( ON ?auto_110821 ?auto_110822 ) ( not ( = ?auto_110815 ?auto_110822 ) ) ( not ( = ?auto_110816 ?auto_110822 ) ) ( not ( = ?auto_110817 ?auto_110822 ) ) ( not ( = ?auto_110818 ?auto_110822 ) ) ( not ( = ?auto_110819 ?auto_110822 ) ) ( not ( = ?auto_110820 ?auto_110822 ) ) ( not ( = ?auto_110821 ?auto_110822 ) ) ( CLEAR ?auto_110819 ) ( ON ?auto_110820 ?auto_110821 ) ( CLEAR ?auto_110820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110822 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110822 ?auto_110821 )
      ( MAKE-6PILE ?auto_110815 ?auto_110816 ?auto_110817 ?auto_110818 ?auto_110819 ?auto_110820 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110823 - BLOCK
      ?auto_110824 - BLOCK
      ?auto_110825 - BLOCK
      ?auto_110826 - BLOCK
      ?auto_110827 - BLOCK
      ?auto_110828 - BLOCK
    )
    :vars
    (
      ?auto_110829 - BLOCK
      ?auto_110830 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110823 ) ( ON ?auto_110824 ?auto_110823 ) ( ON ?auto_110825 ?auto_110824 ) ( ON ?auto_110826 ?auto_110825 ) ( not ( = ?auto_110823 ?auto_110824 ) ) ( not ( = ?auto_110823 ?auto_110825 ) ) ( not ( = ?auto_110823 ?auto_110826 ) ) ( not ( = ?auto_110823 ?auto_110827 ) ) ( not ( = ?auto_110823 ?auto_110828 ) ) ( not ( = ?auto_110823 ?auto_110829 ) ) ( not ( = ?auto_110824 ?auto_110825 ) ) ( not ( = ?auto_110824 ?auto_110826 ) ) ( not ( = ?auto_110824 ?auto_110827 ) ) ( not ( = ?auto_110824 ?auto_110828 ) ) ( not ( = ?auto_110824 ?auto_110829 ) ) ( not ( = ?auto_110825 ?auto_110826 ) ) ( not ( = ?auto_110825 ?auto_110827 ) ) ( not ( = ?auto_110825 ?auto_110828 ) ) ( not ( = ?auto_110825 ?auto_110829 ) ) ( not ( = ?auto_110826 ?auto_110827 ) ) ( not ( = ?auto_110826 ?auto_110828 ) ) ( not ( = ?auto_110826 ?auto_110829 ) ) ( not ( = ?auto_110827 ?auto_110828 ) ) ( not ( = ?auto_110827 ?auto_110829 ) ) ( not ( = ?auto_110828 ?auto_110829 ) ) ( ON ?auto_110829 ?auto_110830 ) ( not ( = ?auto_110823 ?auto_110830 ) ) ( not ( = ?auto_110824 ?auto_110830 ) ) ( not ( = ?auto_110825 ?auto_110830 ) ) ( not ( = ?auto_110826 ?auto_110830 ) ) ( not ( = ?auto_110827 ?auto_110830 ) ) ( not ( = ?auto_110828 ?auto_110830 ) ) ( not ( = ?auto_110829 ?auto_110830 ) ) ( ON ?auto_110828 ?auto_110829 ) ( CLEAR ?auto_110828 ) ( ON-TABLE ?auto_110830 ) ( HOLDING ?auto_110827 ) ( CLEAR ?auto_110826 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110823 ?auto_110824 ?auto_110825 ?auto_110826 ?auto_110827 )
      ( MAKE-6PILE ?auto_110823 ?auto_110824 ?auto_110825 ?auto_110826 ?auto_110827 ?auto_110828 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110831 - BLOCK
      ?auto_110832 - BLOCK
      ?auto_110833 - BLOCK
      ?auto_110834 - BLOCK
      ?auto_110835 - BLOCK
      ?auto_110836 - BLOCK
    )
    :vars
    (
      ?auto_110837 - BLOCK
      ?auto_110838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110831 ) ( ON ?auto_110832 ?auto_110831 ) ( ON ?auto_110833 ?auto_110832 ) ( ON ?auto_110834 ?auto_110833 ) ( not ( = ?auto_110831 ?auto_110832 ) ) ( not ( = ?auto_110831 ?auto_110833 ) ) ( not ( = ?auto_110831 ?auto_110834 ) ) ( not ( = ?auto_110831 ?auto_110835 ) ) ( not ( = ?auto_110831 ?auto_110836 ) ) ( not ( = ?auto_110831 ?auto_110837 ) ) ( not ( = ?auto_110832 ?auto_110833 ) ) ( not ( = ?auto_110832 ?auto_110834 ) ) ( not ( = ?auto_110832 ?auto_110835 ) ) ( not ( = ?auto_110832 ?auto_110836 ) ) ( not ( = ?auto_110832 ?auto_110837 ) ) ( not ( = ?auto_110833 ?auto_110834 ) ) ( not ( = ?auto_110833 ?auto_110835 ) ) ( not ( = ?auto_110833 ?auto_110836 ) ) ( not ( = ?auto_110833 ?auto_110837 ) ) ( not ( = ?auto_110834 ?auto_110835 ) ) ( not ( = ?auto_110834 ?auto_110836 ) ) ( not ( = ?auto_110834 ?auto_110837 ) ) ( not ( = ?auto_110835 ?auto_110836 ) ) ( not ( = ?auto_110835 ?auto_110837 ) ) ( not ( = ?auto_110836 ?auto_110837 ) ) ( ON ?auto_110837 ?auto_110838 ) ( not ( = ?auto_110831 ?auto_110838 ) ) ( not ( = ?auto_110832 ?auto_110838 ) ) ( not ( = ?auto_110833 ?auto_110838 ) ) ( not ( = ?auto_110834 ?auto_110838 ) ) ( not ( = ?auto_110835 ?auto_110838 ) ) ( not ( = ?auto_110836 ?auto_110838 ) ) ( not ( = ?auto_110837 ?auto_110838 ) ) ( ON ?auto_110836 ?auto_110837 ) ( ON-TABLE ?auto_110838 ) ( CLEAR ?auto_110834 ) ( ON ?auto_110835 ?auto_110836 ) ( CLEAR ?auto_110835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110838 ?auto_110837 ?auto_110836 )
      ( MAKE-6PILE ?auto_110831 ?auto_110832 ?auto_110833 ?auto_110834 ?auto_110835 ?auto_110836 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110839 - BLOCK
      ?auto_110840 - BLOCK
      ?auto_110841 - BLOCK
      ?auto_110842 - BLOCK
      ?auto_110843 - BLOCK
      ?auto_110844 - BLOCK
    )
    :vars
    (
      ?auto_110846 - BLOCK
      ?auto_110845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110839 ) ( ON ?auto_110840 ?auto_110839 ) ( ON ?auto_110841 ?auto_110840 ) ( not ( = ?auto_110839 ?auto_110840 ) ) ( not ( = ?auto_110839 ?auto_110841 ) ) ( not ( = ?auto_110839 ?auto_110842 ) ) ( not ( = ?auto_110839 ?auto_110843 ) ) ( not ( = ?auto_110839 ?auto_110844 ) ) ( not ( = ?auto_110839 ?auto_110846 ) ) ( not ( = ?auto_110840 ?auto_110841 ) ) ( not ( = ?auto_110840 ?auto_110842 ) ) ( not ( = ?auto_110840 ?auto_110843 ) ) ( not ( = ?auto_110840 ?auto_110844 ) ) ( not ( = ?auto_110840 ?auto_110846 ) ) ( not ( = ?auto_110841 ?auto_110842 ) ) ( not ( = ?auto_110841 ?auto_110843 ) ) ( not ( = ?auto_110841 ?auto_110844 ) ) ( not ( = ?auto_110841 ?auto_110846 ) ) ( not ( = ?auto_110842 ?auto_110843 ) ) ( not ( = ?auto_110842 ?auto_110844 ) ) ( not ( = ?auto_110842 ?auto_110846 ) ) ( not ( = ?auto_110843 ?auto_110844 ) ) ( not ( = ?auto_110843 ?auto_110846 ) ) ( not ( = ?auto_110844 ?auto_110846 ) ) ( ON ?auto_110846 ?auto_110845 ) ( not ( = ?auto_110839 ?auto_110845 ) ) ( not ( = ?auto_110840 ?auto_110845 ) ) ( not ( = ?auto_110841 ?auto_110845 ) ) ( not ( = ?auto_110842 ?auto_110845 ) ) ( not ( = ?auto_110843 ?auto_110845 ) ) ( not ( = ?auto_110844 ?auto_110845 ) ) ( not ( = ?auto_110846 ?auto_110845 ) ) ( ON ?auto_110844 ?auto_110846 ) ( ON-TABLE ?auto_110845 ) ( ON ?auto_110843 ?auto_110844 ) ( CLEAR ?auto_110843 ) ( HOLDING ?auto_110842 ) ( CLEAR ?auto_110841 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110839 ?auto_110840 ?auto_110841 ?auto_110842 )
      ( MAKE-6PILE ?auto_110839 ?auto_110840 ?auto_110841 ?auto_110842 ?auto_110843 ?auto_110844 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110847 - BLOCK
      ?auto_110848 - BLOCK
      ?auto_110849 - BLOCK
      ?auto_110850 - BLOCK
      ?auto_110851 - BLOCK
      ?auto_110852 - BLOCK
    )
    :vars
    (
      ?auto_110854 - BLOCK
      ?auto_110853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110847 ) ( ON ?auto_110848 ?auto_110847 ) ( ON ?auto_110849 ?auto_110848 ) ( not ( = ?auto_110847 ?auto_110848 ) ) ( not ( = ?auto_110847 ?auto_110849 ) ) ( not ( = ?auto_110847 ?auto_110850 ) ) ( not ( = ?auto_110847 ?auto_110851 ) ) ( not ( = ?auto_110847 ?auto_110852 ) ) ( not ( = ?auto_110847 ?auto_110854 ) ) ( not ( = ?auto_110848 ?auto_110849 ) ) ( not ( = ?auto_110848 ?auto_110850 ) ) ( not ( = ?auto_110848 ?auto_110851 ) ) ( not ( = ?auto_110848 ?auto_110852 ) ) ( not ( = ?auto_110848 ?auto_110854 ) ) ( not ( = ?auto_110849 ?auto_110850 ) ) ( not ( = ?auto_110849 ?auto_110851 ) ) ( not ( = ?auto_110849 ?auto_110852 ) ) ( not ( = ?auto_110849 ?auto_110854 ) ) ( not ( = ?auto_110850 ?auto_110851 ) ) ( not ( = ?auto_110850 ?auto_110852 ) ) ( not ( = ?auto_110850 ?auto_110854 ) ) ( not ( = ?auto_110851 ?auto_110852 ) ) ( not ( = ?auto_110851 ?auto_110854 ) ) ( not ( = ?auto_110852 ?auto_110854 ) ) ( ON ?auto_110854 ?auto_110853 ) ( not ( = ?auto_110847 ?auto_110853 ) ) ( not ( = ?auto_110848 ?auto_110853 ) ) ( not ( = ?auto_110849 ?auto_110853 ) ) ( not ( = ?auto_110850 ?auto_110853 ) ) ( not ( = ?auto_110851 ?auto_110853 ) ) ( not ( = ?auto_110852 ?auto_110853 ) ) ( not ( = ?auto_110854 ?auto_110853 ) ) ( ON ?auto_110852 ?auto_110854 ) ( ON-TABLE ?auto_110853 ) ( ON ?auto_110851 ?auto_110852 ) ( CLEAR ?auto_110849 ) ( ON ?auto_110850 ?auto_110851 ) ( CLEAR ?auto_110850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110853 ?auto_110854 ?auto_110852 ?auto_110851 )
      ( MAKE-6PILE ?auto_110847 ?auto_110848 ?auto_110849 ?auto_110850 ?auto_110851 ?auto_110852 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110855 - BLOCK
      ?auto_110856 - BLOCK
      ?auto_110857 - BLOCK
      ?auto_110858 - BLOCK
      ?auto_110859 - BLOCK
      ?auto_110860 - BLOCK
    )
    :vars
    (
      ?auto_110862 - BLOCK
      ?auto_110861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110855 ) ( ON ?auto_110856 ?auto_110855 ) ( not ( = ?auto_110855 ?auto_110856 ) ) ( not ( = ?auto_110855 ?auto_110857 ) ) ( not ( = ?auto_110855 ?auto_110858 ) ) ( not ( = ?auto_110855 ?auto_110859 ) ) ( not ( = ?auto_110855 ?auto_110860 ) ) ( not ( = ?auto_110855 ?auto_110862 ) ) ( not ( = ?auto_110856 ?auto_110857 ) ) ( not ( = ?auto_110856 ?auto_110858 ) ) ( not ( = ?auto_110856 ?auto_110859 ) ) ( not ( = ?auto_110856 ?auto_110860 ) ) ( not ( = ?auto_110856 ?auto_110862 ) ) ( not ( = ?auto_110857 ?auto_110858 ) ) ( not ( = ?auto_110857 ?auto_110859 ) ) ( not ( = ?auto_110857 ?auto_110860 ) ) ( not ( = ?auto_110857 ?auto_110862 ) ) ( not ( = ?auto_110858 ?auto_110859 ) ) ( not ( = ?auto_110858 ?auto_110860 ) ) ( not ( = ?auto_110858 ?auto_110862 ) ) ( not ( = ?auto_110859 ?auto_110860 ) ) ( not ( = ?auto_110859 ?auto_110862 ) ) ( not ( = ?auto_110860 ?auto_110862 ) ) ( ON ?auto_110862 ?auto_110861 ) ( not ( = ?auto_110855 ?auto_110861 ) ) ( not ( = ?auto_110856 ?auto_110861 ) ) ( not ( = ?auto_110857 ?auto_110861 ) ) ( not ( = ?auto_110858 ?auto_110861 ) ) ( not ( = ?auto_110859 ?auto_110861 ) ) ( not ( = ?auto_110860 ?auto_110861 ) ) ( not ( = ?auto_110862 ?auto_110861 ) ) ( ON ?auto_110860 ?auto_110862 ) ( ON-TABLE ?auto_110861 ) ( ON ?auto_110859 ?auto_110860 ) ( ON ?auto_110858 ?auto_110859 ) ( CLEAR ?auto_110858 ) ( HOLDING ?auto_110857 ) ( CLEAR ?auto_110856 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110855 ?auto_110856 ?auto_110857 )
      ( MAKE-6PILE ?auto_110855 ?auto_110856 ?auto_110857 ?auto_110858 ?auto_110859 ?auto_110860 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110863 - BLOCK
      ?auto_110864 - BLOCK
      ?auto_110865 - BLOCK
      ?auto_110866 - BLOCK
      ?auto_110867 - BLOCK
      ?auto_110868 - BLOCK
    )
    :vars
    (
      ?auto_110869 - BLOCK
      ?auto_110870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110863 ) ( ON ?auto_110864 ?auto_110863 ) ( not ( = ?auto_110863 ?auto_110864 ) ) ( not ( = ?auto_110863 ?auto_110865 ) ) ( not ( = ?auto_110863 ?auto_110866 ) ) ( not ( = ?auto_110863 ?auto_110867 ) ) ( not ( = ?auto_110863 ?auto_110868 ) ) ( not ( = ?auto_110863 ?auto_110869 ) ) ( not ( = ?auto_110864 ?auto_110865 ) ) ( not ( = ?auto_110864 ?auto_110866 ) ) ( not ( = ?auto_110864 ?auto_110867 ) ) ( not ( = ?auto_110864 ?auto_110868 ) ) ( not ( = ?auto_110864 ?auto_110869 ) ) ( not ( = ?auto_110865 ?auto_110866 ) ) ( not ( = ?auto_110865 ?auto_110867 ) ) ( not ( = ?auto_110865 ?auto_110868 ) ) ( not ( = ?auto_110865 ?auto_110869 ) ) ( not ( = ?auto_110866 ?auto_110867 ) ) ( not ( = ?auto_110866 ?auto_110868 ) ) ( not ( = ?auto_110866 ?auto_110869 ) ) ( not ( = ?auto_110867 ?auto_110868 ) ) ( not ( = ?auto_110867 ?auto_110869 ) ) ( not ( = ?auto_110868 ?auto_110869 ) ) ( ON ?auto_110869 ?auto_110870 ) ( not ( = ?auto_110863 ?auto_110870 ) ) ( not ( = ?auto_110864 ?auto_110870 ) ) ( not ( = ?auto_110865 ?auto_110870 ) ) ( not ( = ?auto_110866 ?auto_110870 ) ) ( not ( = ?auto_110867 ?auto_110870 ) ) ( not ( = ?auto_110868 ?auto_110870 ) ) ( not ( = ?auto_110869 ?auto_110870 ) ) ( ON ?auto_110868 ?auto_110869 ) ( ON-TABLE ?auto_110870 ) ( ON ?auto_110867 ?auto_110868 ) ( ON ?auto_110866 ?auto_110867 ) ( CLEAR ?auto_110864 ) ( ON ?auto_110865 ?auto_110866 ) ( CLEAR ?auto_110865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110870 ?auto_110869 ?auto_110868 ?auto_110867 ?auto_110866 )
      ( MAKE-6PILE ?auto_110863 ?auto_110864 ?auto_110865 ?auto_110866 ?auto_110867 ?auto_110868 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110871 - BLOCK
      ?auto_110872 - BLOCK
      ?auto_110873 - BLOCK
      ?auto_110874 - BLOCK
      ?auto_110875 - BLOCK
      ?auto_110876 - BLOCK
    )
    :vars
    (
      ?auto_110878 - BLOCK
      ?auto_110877 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110871 ) ( not ( = ?auto_110871 ?auto_110872 ) ) ( not ( = ?auto_110871 ?auto_110873 ) ) ( not ( = ?auto_110871 ?auto_110874 ) ) ( not ( = ?auto_110871 ?auto_110875 ) ) ( not ( = ?auto_110871 ?auto_110876 ) ) ( not ( = ?auto_110871 ?auto_110878 ) ) ( not ( = ?auto_110872 ?auto_110873 ) ) ( not ( = ?auto_110872 ?auto_110874 ) ) ( not ( = ?auto_110872 ?auto_110875 ) ) ( not ( = ?auto_110872 ?auto_110876 ) ) ( not ( = ?auto_110872 ?auto_110878 ) ) ( not ( = ?auto_110873 ?auto_110874 ) ) ( not ( = ?auto_110873 ?auto_110875 ) ) ( not ( = ?auto_110873 ?auto_110876 ) ) ( not ( = ?auto_110873 ?auto_110878 ) ) ( not ( = ?auto_110874 ?auto_110875 ) ) ( not ( = ?auto_110874 ?auto_110876 ) ) ( not ( = ?auto_110874 ?auto_110878 ) ) ( not ( = ?auto_110875 ?auto_110876 ) ) ( not ( = ?auto_110875 ?auto_110878 ) ) ( not ( = ?auto_110876 ?auto_110878 ) ) ( ON ?auto_110878 ?auto_110877 ) ( not ( = ?auto_110871 ?auto_110877 ) ) ( not ( = ?auto_110872 ?auto_110877 ) ) ( not ( = ?auto_110873 ?auto_110877 ) ) ( not ( = ?auto_110874 ?auto_110877 ) ) ( not ( = ?auto_110875 ?auto_110877 ) ) ( not ( = ?auto_110876 ?auto_110877 ) ) ( not ( = ?auto_110878 ?auto_110877 ) ) ( ON ?auto_110876 ?auto_110878 ) ( ON-TABLE ?auto_110877 ) ( ON ?auto_110875 ?auto_110876 ) ( ON ?auto_110874 ?auto_110875 ) ( ON ?auto_110873 ?auto_110874 ) ( CLEAR ?auto_110873 ) ( HOLDING ?auto_110872 ) ( CLEAR ?auto_110871 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110871 ?auto_110872 )
      ( MAKE-6PILE ?auto_110871 ?auto_110872 ?auto_110873 ?auto_110874 ?auto_110875 ?auto_110876 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110879 - BLOCK
      ?auto_110880 - BLOCK
      ?auto_110881 - BLOCK
      ?auto_110882 - BLOCK
      ?auto_110883 - BLOCK
      ?auto_110884 - BLOCK
    )
    :vars
    (
      ?auto_110885 - BLOCK
      ?auto_110886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110879 ) ( not ( = ?auto_110879 ?auto_110880 ) ) ( not ( = ?auto_110879 ?auto_110881 ) ) ( not ( = ?auto_110879 ?auto_110882 ) ) ( not ( = ?auto_110879 ?auto_110883 ) ) ( not ( = ?auto_110879 ?auto_110884 ) ) ( not ( = ?auto_110879 ?auto_110885 ) ) ( not ( = ?auto_110880 ?auto_110881 ) ) ( not ( = ?auto_110880 ?auto_110882 ) ) ( not ( = ?auto_110880 ?auto_110883 ) ) ( not ( = ?auto_110880 ?auto_110884 ) ) ( not ( = ?auto_110880 ?auto_110885 ) ) ( not ( = ?auto_110881 ?auto_110882 ) ) ( not ( = ?auto_110881 ?auto_110883 ) ) ( not ( = ?auto_110881 ?auto_110884 ) ) ( not ( = ?auto_110881 ?auto_110885 ) ) ( not ( = ?auto_110882 ?auto_110883 ) ) ( not ( = ?auto_110882 ?auto_110884 ) ) ( not ( = ?auto_110882 ?auto_110885 ) ) ( not ( = ?auto_110883 ?auto_110884 ) ) ( not ( = ?auto_110883 ?auto_110885 ) ) ( not ( = ?auto_110884 ?auto_110885 ) ) ( ON ?auto_110885 ?auto_110886 ) ( not ( = ?auto_110879 ?auto_110886 ) ) ( not ( = ?auto_110880 ?auto_110886 ) ) ( not ( = ?auto_110881 ?auto_110886 ) ) ( not ( = ?auto_110882 ?auto_110886 ) ) ( not ( = ?auto_110883 ?auto_110886 ) ) ( not ( = ?auto_110884 ?auto_110886 ) ) ( not ( = ?auto_110885 ?auto_110886 ) ) ( ON ?auto_110884 ?auto_110885 ) ( ON-TABLE ?auto_110886 ) ( ON ?auto_110883 ?auto_110884 ) ( ON ?auto_110882 ?auto_110883 ) ( ON ?auto_110881 ?auto_110882 ) ( CLEAR ?auto_110879 ) ( ON ?auto_110880 ?auto_110881 ) ( CLEAR ?auto_110880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110886 ?auto_110885 ?auto_110884 ?auto_110883 ?auto_110882 ?auto_110881 )
      ( MAKE-6PILE ?auto_110879 ?auto_110880 ?auto_110881 ?auto_110882 ?auto_110883 ?auto_110884 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110887 - BLOCK
      ?auto_110888 - BLOCK
      ?auto_110889 - BLOCK
      ?auto_110890 - BLOCK
      ?auto_110891 - BLOCK
      ?auto_110892 - BLOCK
    )
    :vars
    (
      ?auto_110894 - BLOCK
      ?auto_110893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110887 ?auto_110888 ) ) ( not ( = ?auto_110887 ?auto_110889 ) ) ( not ( = ?auto_110887 ?auto_110890 ) ) ( not ( = ?auto_110887 ?auto_110891 ) ) ( not ( = ?auto_110887 ?auto_110892 ) ) ( not ( = ?auto_110887 ?auto_110894 ) ) ( not ( = ?auto_110888 ?auto_110889 ) ) ( not ( = ?auto_110888 ?auto_110890 ) ) ( not ( = ?auto_110888 ?auto_110891 ) ) ( not ( = ?auto_110888 ?auto_110892 ) ) ( not ( = ?auto_110888 ?auto_110894 ) ) ( not ( = ?auto_110889 ?auto_110890 ) ) ( not ( = ?auto_110889 ?auto_110891 ) ) ( not ( = ?auto_110889 ?auto_110892 ) ) ( not ( = ?auto_110889 ?auto_110894 ) ) ( not ( = ?auto_110890 ?auto_110891 ) ) ( not ( = ?auto_110890 ?auto_110892 ) ) ( not ( = ?auto_110890 ?auto_110894 ) ) ( not ( = ?auto_110891 ?auto_110892 ) ) ( not ( = ?auto_110891 ?auto_110894 ) ) ( not ( = ?auto_110892 ?auto_110894 ) ) ( ON ?auto_110894 ?auto_110893 ) ( not ( = ?auto_110887 ?auto_110893 ) ) ( not ( = ?auto_110888 ?auto_110893 ) ) ( not ( = ?auto_110889 ?auto_110893 ) ) ( not ( = ?auto_110890 ?auto_110893 ) ) ( not ( = ?auto_110891 ?auto_110893 ) ) ( not ( = ?auto_110892 ?auto_110893 ) ) ( not ( = ?auto_110894 ?auto_110893 ) ) ( ON ?auto_110892 ?auto_110894 ) ( ON-TABLE ?auto_110893 ) ( ON ?auto_110891 ?auto_110892 ) ( ON ?auto_110890 ?auto_110891 ) ( ON ?auto_110889 ?auto_110890 ) ( ON ?auto_110888 ?auto_110889 ) ( CLEAR ?auto_110888 ) ( HOLDING ?auto_110887 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110887 )
      ( MAKE-6PILE ?auto_110887 ?auto_110888 ?auto_110889 ?auto_110890 ?auto_110891 ?auto_110892 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_110895 - BLOCK
      ?auto_110896 - BLOCK
      ?auto_110897 - BLOCK
      ?auto_110898 - BLOCK
      ?auto_110899 - BLOCK
      ?auto_110900 - BLOCK
    )
    :vars
    (
      ?auto_110902 - BLOCK
      ?auto_110901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110895 ?auto_110896 ) ) ( not ( = ?auto_110895 ?auto_110897 ) ) ( not ( = ?auto_110895 ?auto_110898 ) ) ( not ( = ?auto_110895 ?auto_110899 ) ) ( not ( = ?auto_110895 ?auto_110900 ) ) ( not ( = ?auto_110895 ?auto_110902 ) ) ( not ( = ?auto_110896 ?auto_110897 ) ) ( not ( = ?auto_110896 ?auto_110898 ) ) ( not ( = ?auto_110896 ?auto_110899 ) ) ( not ( = ?auto_110896 ?auto_110900 ) ) ( not ( = ?auto_110896 ?auto_110902 ) ) ( not ( = ?auto_110897 ?auto_110898 ) ) ( not ( = ?auto_110897 ?auto_110899 ) ) ( not ( = ?auto_110897 ?auto_110900 ) ) ( not ( = ?auto_110897 ?auto_110902 ) ) ( not ( = ?auto_110898 ?auto_110899 ) ) ( not ( = ?auto_110898 ?auto_110900 ) ) ( not ( = ?auto_110898 ?auto_110902 ) ) ( not ( = ?auto_110899 ?auto_110900 ) ) ( not ( = ?auto_110899 ?auto_110902 ) ) ( not ( = ?auto_110900 ?auto_110902 ) ) ( ON ?auto_110902 ?auto_110901 ) ( not ( = ?auto_110895 ?auto_110901 ) ) ( not ( = ?auto_110896 ?auto_110901 ) ) ( not ( = ?auto_110897 ?auto_110901 ) ) ( not ( = ?auto_110898 ?auto_110901 ) ) ( not ( = ?auto_110899 ?auto_110901 ) ) ( not ( = ?auto_110900 ?auto_110901 ) ) ( not ( = ?auto_110902 ?auto_110901 ) ) ( ON ?auto_110900 ?auto_110902 ) ( ON-TABLE ?auto_110901 ) ( ON ?auto_110899 ?auto_110900 ) ( ON ?auto_110898 ?auto_110899 ) ( ON ?auto_110897 ?auto_110898 ) ( ON ?auto_110896 ?auto_110897 ) ( ON ?auto_110895 ?auto_110896 ) ( CLEAR ?auto_110895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110901 ?auto_110902 ?auto_110900 ?auto_110899 ?auto_110898 ?auto_110897 ?auto_110896 )
      ( MAKE-6PILE ?auto_110895 ?auto_110896 ?auto_110897 ?auto_110898 ?auto_110899 ?auto_110900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110904 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_110904 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_110904 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110905 - BLOCK
    )
    :vars
    (
      ?auto_110906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110905 ?auto_110906 ) ( CLEAR ?auto_110905 ) ( HAND-EMPTY ) ( not ( = ?auto_110905 ?auto_110906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110905 ?auto_110906 )
      ( MAKE-1PILE ?auto_110905 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110907 - BLOCK
    )
    :vars
    (
      ?auto_110908 - BLOCK
      ?auto_110912 - BLOCK
      ?auto_110910 - BLOCK
      ?auto_110913 - BLOCK
      ?auto_110911 - BLOCK
      ?auto_110909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110907 ?auto_110908 ) ) ( HOLDING ?auto_110907 ) ( CLEAR ?auto_110908 ) ( ON-TABLE ?auto_110912 ) ( ON ?auto_110910 ?auto_110912 ) ( ON ?auto_110913 ?auto_110910 ) ( ON ?auto_110911 ?auto_110913 ) ( ON ?auto_110909 ?auto_110911 ) ( ON ?auto_110908 ?auto_110909 ) ( not ( = ?auto_110912 ?auto_110910 ) ) ( not ( = ?auto_110912 ?auto_110913 ) ) ( not ( = ?auto_110912 ?auto_110911 ) ) ( not ( = ?auto_110912 ?auto_110909 ) ) ( not ( = ?auto_110912 ?auto_110908 ) ) ( not ( = ?auto_110912 ?auto_110907 ) ) ( not ( = ?auto_110910 ?auto_110913 ) ) ( not ( = ?auto_110910 ?auto_110911 ) ) ( not ( = ?auto_110910 ?auto_110909 ) ) ( not ( = ?auto_110910 ?auto_110908 ) ) ( not ( = ?auto_110910 ?auto_110907 ) ) ( not ( = ?auto_110913 ?auto_110911 ) ) ( not ( = ?auto_110913 ?auto_110909 ) ) ( not ( = ?auto_110913 ?auto_110908 ) ) ( not ( = ?auto_110913 ?auto_110907 ) ) ( not ( = ?auto_110911 ?auto_110909 ) ) ( not ( = ?auto_110911 ?auto_110908 ) ) ( not ( = ?auto_110911 ?auto_110907 ) ) ( not ( = ?auto_110909 ?auto_110908 ) ) ( not ( = ?auto_110909 ?auto_110907 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110912 ?auto_110910 ?auto_110913 ?auto_110911 ?auto_110909 ?auto_110908 ?auto_110907 )
      ( MAKE-1PILE ?auto_110907 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110914 - BLOCK
    )
    :vars
    (
      ?auto_110917 - BLOCK
      ?auto_110920 - BLOCK
      ?auto_110915 - BLOCK
      ?auto_110919 - BLOCK
      ?auto_110916 - BLOCK
      ?auto_110918 - BLOCK
      ?auto_110921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110914 ?auto_110917 ) ) ( CLEAR ?auto_110917 ) ( ON-TABLE ?auto_110920 ) ( ON ?auto_110915 ?auto_110920 ) ( ON ?auto_110919 ?auto_110915 ) ( ON ?auto_110916 ?auto_110919 ) ( ON ?auto_110918 ?auto_110916 ) ( ON ?auto_110917 ?auto_110918 ) ( not ( = ?auto_110920 ?auto_110915 ) ) ( not ( = ?auto_110920 ?auto_110919 ) ) ( not ( = ?auto_110920 ?auto_110916 ) ) ( not ( = ?auto_110920 ?auto_110918 ) ) ( not ( = ?auto_110920 ?auto_110917 ) ) ( not ( = ?auto_110920 ?auto_110914 ) ) ( not ( = ?auto_110915 ?auto_110919 ) ) ( not ( = ?auto_110915 ?auto_110916 ) ) ( not ( = ?auto_110915 ?auto_110918 ) ) ( not ( = ?auto_110915 ?auto_110917 ) ) ( not ( = ?auto_110915 ?auto_110914 ) ) ( not ( = ?auto_110919 ?auto_110916 ) ) ( not ( = ?auto_110919 ?auto_110918 ) ) ( not ( = ?auto_110919 ?auto_110917 ) ) ( not ( = ?auto_110919 ?auto_110914 ) ) ( not ( = ?auto_110916 ?auto_110918 ) ) ( not ( = ?auto_110916 ?auto_110917 ) ) ( not ( = ?auto_110916 ?auto_110914 ) ) ( not ( = ?auto_110918 ?auto_110917 ) ) ( not ( = ?auto_110918 ?auto_110914 ) ) ( ON ?auto_110914 ?auto_110921 ) ( CLEAR ?auto_110914 ) ( HAND-EMPTY ) ( not ( = ?auto_110914 ?auto_110921 ) ) ( not ( = ?auto_110917 ?auto_110921 ) ) ( not ( = ?auto_110920 ?auto_110921 ) ) ( not ( = ?auto_110915 ?auto_110921 ) ) ( not ( = ?auto_110919 ?auto_110921 ) ) ( not ( = ?auto_110916 ?auto_110921 ) ) ( not ( = ?auto_110918 ?auto_110921 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110914 ?auto_110921 )
      ( MAKE-1PILE ?auto_110914 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110922 - BLOCK
    )
    :vars
    (
      ?auto_110929 - BLOCK
      ?auto_110924 - BLOCK
      ?auto_110926 - BLOCK
      ?auto_110923 - BLOCK
      ?auto_110928 - BLOCK
      ?auto_110927 - BLOCK
      ?auto_110925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110922 ?auto_110929 ) ) ( ON-TABLE ?auto_110924 ) ( ON ?auto_110926 ?auto_110924 ) ( ON ?auto_110923 ?auto_110926 ) ( ON ?auto_110928 ?auto_110923 ) ( ON ?auto_110927 ?auto_110928 ) ( not ( = ?auto_110924 ?auto_110926 ) ) ( not ( = ?auto_110924 ?auto_110923 ) ) ( not ( = ?auto_110924 ?auto_110928 ) ) ( not ( = ?auto_110924 ?auto_110927 ) ) ( not ( = ?auto_110924 ?auto_110929 ) ) ( not ( = ?auto_110924 ?auto_110922 ) ) ( not ( = ?auto_110926 ?auto_110923 ) ) ( not ( = ?auto_110926 ?auto_110928 ) ) ( not ( = ?auto_110926 ?auto_110927 ) ) ( not ( = ?auto_110926 ?auto_110929 ) ) ( not ( = ?auto_110926 ?auto_110922 ) ) ( not ( = ?auto_110923 ?auto_110928 ) ) ( not ( = ?auto_110923 ?auto_110927 ) ) ( not ( = ?auto_110923 ?auto_110929 ) ) ( not ( = ?auto_110923 ?auto_110922 ) ) ( not ( = ?auto_110928 ?auto_110927 ) ) ( not ( = ?auto_110928 ?auto_110929 ) ) ( not ( = ?auto_110928 ?auto_110922 ) ) ( not ( = ?auto_110927 ?auto_110929 ) ) ( not ( = ?auto_110927 ?auto_110922 ) ) ( ON ?auto_110922 ?auto_110925 ) ( CLEAR ?auto_110922 ) ( not ( = ?auto_110922 ?auto_110925 ) ) ( not ( = ?auto_110929 ?auto_110925 ) ) ( not ( = ?auto_110924 ?auto_110925 ) ) ( not ( = ?auto_110926 ?auto_110925 ) ) ( not ( = ?auto_110923 ?auto_110925 ) ) ( not ( = ?auto_110928 ?auto_110925 ) ) ( not ( = ?auto_110927 ?auto_110925 ) ) ( HOLDING ?auto_110929 ) ( CLEAR ?auto_110927 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110924 ?auto_110926 ?auto_110923 ?auto_110928 ?auto_110927 ?auto_110929 )
      ( MAKE-1PILE ?auto_110922 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110930 - BLOCK
    )
    :vars
    (
      ?auto_110932 - BLOCK
      ?auto_110937 - BLOCK
      ?auto_110933 - BLOCK
      ?auto_110934 - BLOCK
      ?auto_110936 - BLOCK
      ?auto_110935 - BLOCK
      ?auto_110931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110930 ?auto_110932 ) ) ( ON-TABLE ?auto_110937 ) ( ON ?auto_110933 ?auto_110937 ) ( ON ?auto_110934 ?auto_110933 ) ( ON ?auto_110936 ?auto_110934 ) ( ON ?auto_110935 ?auto_110936 ) ( not ( = ?auto_110937 ?auto_110933 ) ) ( not ( = ?auto_110937 ?auto_110934 ) ) ( not ( = ?auto_110937 ?auto_110936 ) ) ( not ( = ?auto_110937 ?auto_110935 ) ) ( not ( = ?auto_110937 ?auto_110932 ) ) ( not ( = ?auto_110937 ?auto_110930 ) ) ( not ( = ?auto_110933 ?auto_110934 ) ) ( not ( = ?auto_110933 ?auto_110936 ) ) ( not ( = ?auto_110933 ?auto_110935 ) ) ( not ( = ?auto_110933 ?auto_110932 ) ) ( not ( = ?auto_110933 ?auto_110930 ) ) ( not ( = ?auto_110934 ?auto_110936 ) ) ( not ( = ?auto_110934 ?auto_110935 ) ) ( not ( = ?auto_110934 ?auto_110932 ) ) ( not ( = ?auto_110934 ?auto_110930 ) ) ( not ( = ?auto_110936 ?auto_110935 ) ) ( not ( = ?auto_110936 ?auto_110932 ) ) ( not ( = ?auto_110936 ?auto_110930 ) ) ( not ( = ?auto_110935 ?auto_110932 ) ) ( not ( = ?auto_110935 ?auto_110930 ) ) ( ON ?auto_110930 ?auto_110931 ) ( not ( = ?auto_110930 ?auto_110931 ) ) ( not ( = ?auto_110932 ?auto_110931 ) ) ( not ( = ?auto_110937 ?auto_110931 ) ) ( not ( = ?auto_110933 ?auto_110931 ) ) ( not ( = ?auto_110934 ?auto_110931 ) ) ( not ( = ?auto_110936 ?auto_110931 ) ) ( not ( = ?auto_110935 ?auto_110931 ) ) ( CLEAR ?auto_110935 ) ( ON ?auto_110932 ?auto_110930 ) ( CLEAR ?auto_110932 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110931 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110931 ?auto_110930 )
      ( MAKE-1PILE ?auto_110930 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110938 - BLOCK
    )
    :vars
    (
      ?auto_110941 - BLOCK
      ?auto_110943 - BLOCK
      ?auto_110945 - BLOCK
      ?auto_110942 - BLOCK
      ?auto_110940 - BLOCK
      ?auto_110944 - BLOCK
      ?auto_110939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110938 ?auto_110941 ) ) ( ON-TABLE ?auto_110943 ) ( ON ?auto_110945 ?auto_110943 ) ( ON ?auto_110942 ?auto_110945 ) ( ON ?auto_110940 ?auto_110942 ) ( not ( = ?auto_110943 ?auto_110945 ) ) ( not ( = ?auto_110943 ?auto_110942 ) ) ( not ( = ?auto_110943 ?auto_110940 ) ) ( not ( = ?auto_110943 ?auto_110944 ) ) ( not ( = ?auto_110943 ?auto_110941 ) ) ( not ( = ?auto_110943 ?auto_110938 ) ) ( not ( = ?auto_110945 ?auto_110942 ) ) ( not ( = ?auto_110945 ?auto_110940 ) ) ( not ( = ?auto_110945 ?auto_110944 ) ) ( not ( = ?auto_110945 ?auto_110941 ) ) ( not ( = ?auto_110945 ?auto_110938 ) ) ( not ( = ?auto_110942 ?auto_110940 ) ) ( not ( = ?auto_110942 ?auto_110944 ) ) ( not ( = ?auto_110942 ?auto_110941 ) ) ( not ( = ?auto_110942 ?auto_110938 ) ) ( not ( = ?auto_110940 ?auto_110944 ) ) ( not ( = ?auto_110940 ?auto_110941 ) ) ( not ( = ?auto_110940 ?auto_110938 ) ) ( not ( = ?auto_110944 ?auto_110941 ) ) ( not ( = ?auto_110944 ?auto_110938 ) ) ( ON ?auto_110938 ?auto_110939 ) ( not ( = ?auto_110938 ?auto_110939 ) ) ( not ( = ?auto_110941 ?auto_110939 ) ) ( not ( = ?auto_110943 ?auto_110939 ) ) ( not ( = ?auto_110945 ?auto_110939 ) ) ( not ( = ?auto_110942 ?auto_110939 ) ) ( not ( = ?auto_110940 ?auto_110939 ) ) ( not ( = ?auto_110944 ?auto_110939 ) ) ( ON ?auto_110941 ?auto_110938 ) ( CLEAR ?auto_110941 ) ( ON-TABLE ?auto_110939 ) ( HOLDING ?auto_110944 ) ( CLEAR ?auto_110940 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110943 ?auto_110945 ?auto_110942 ?auto_110940 ?auto_110944 )
      ( MAKE-1PILE ?auto_110938 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110946 - BLOCK
    )
    :vars
    (
      ?auto_110948 - BLOCK
      ?auto_110953 - BLOCK
      ?auto_110947 - BLOCK
      ?auto_110949 - BLOCK
      ?auto_110951 - BLOCK
      ?auto_110952 - BLOCK
      ?auto_110950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110946 ?auto_110948 ) ) ( ON-TABLE ?auto_110953 ) ( ON ?auto_110947 ?auto_110953 ) ( ON ?auto_110949 ?auto_110947 ) ( ON ?auto_110951 ?auto_110949 ) ( not ( = ?auto_110953 ?auto_110947 ) ) ( not ( = ?auto_110953 ?auto_110949 ) ) ( not ( = ?auto_110953 ?auto_110951 ) ) ( not ( = ?auto_110953 ?auto_110952 ) ) ( not ( = ?auto_110953 ?auto_110948 ) ) ( not ( = ?auto_110953 ?auto_110946 ) ) ( not ( = ?auto_110947 ?auto_110949 ) ) ( not ( = ?auto_110947 ?auto_110951 ) ) ( not ( = ?auto_110947 ?auto_110952 ) ) ( not ( = ?auto_110947 ?auto_110948 ) ) ( not ( = ?auto_110947 ?auto_110946 ) ) ( not ( = ?auto_110949 ?auto_110951 ) ) ( not ( = ?auto_110949 ?auto_110952 ) ) ( not ( = ?auto_110949 ?auto_110948 ) ) ( not ( = ?auto_110949 ?auto_110946 ) ) ( not ( = ?auto_110951 ?auto_110952 ) ) ( not ( = ?auto_110951 ?auto_110948 ) ) ( not ( = ?auto_110951 ?auto_110946 ) ) ( not ( = ?auto_110952 ?auto_110948 ) ) ( not ( = ?auto_110952 ?auto_110946 ) ) ( ON ?auto_110946 ?auto_110950 ) ( not ( = ?auto_110946 ?auto_110950 ) ) ( not ( = ?auto_110948 ?auto_110950 ) ) ( not ( = ?auto_110953 ?auto_110950 ) ) ( not ( = ?auto_110947 ?auto_110950 ) ) ( not ( = ?auto_110949 ?auto_110950 ) ) ( not ( = ?auto_110951 ?auto_110950 ) ) ( not ( = ?auto_110952 ?auto_110950 ) ) ( ON ?auto_110948 ?auto_110946 ) ( ON-TABLE ?auto_110950 ) ( CLEAR ?auto_110951 ) ( ON ?auto_110952 ?auto_110948 ) ( CLEAR ?auto_110952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110950 ?auto_110946 ?auto_110948 )
      ( MAKE-1PILE ?auto_110946 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110954 - BLOCK
    )
    :vars
    (
      ?auto_110956 - BLOCK
      ?auto_110958 - BLOCK
      ?auto_110957 - BLOCK
      ?auto_110959 - BLOCK
      ?auto_110961 - BLOCK
      ?auto_110955 - BLOCK
      ?auto_110960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110954 ?auto_110956 ) ) ( ON-TABLE ?auto_110958 ) ( ON ?auto_110957 ?auto_110958 ) ( ON ?auto_110959 ?auto_110957 ) ( not ( = ?auto_110958 ?auto_110957 ) ) ( not ( = ?auto_110958 ?auto_110959 ) ) ( not ( = ?auto_110958 ?auto_110961 ) ) ( not ( = ?auto_110958 ?auto_110955 ) ) ( not ( = ?auto_110958 ?auto_110956 ) ) ( not ( = ?auto_110958 ?auto_110954 ) ) ( not ( = ?auto_110957 ?auto_110959 ) ) ( not ( = ?auto_110957 ?auto_110961 ) ) ( not ( = ?auto_110957 ?auto_110955 ) ) ( not ( = ?auto_110957 ?auto_110956 ) ) ( not ( = ?auto_110957 ?auto_110954 ) ) ( not ( = ?auto_110959 ?auto_110961 ) ) ( not ( = ?auto_110959 ?auto_110955 ) ) ( not ( = ?auto_110959 ?auto_110956 ) ) ( not ( = ?auto_110959 ?auto_110954 ) ) ( not ( = ?auto_110961 ?auto_110955 ) ) ( not ( = ?auto_110961 ?auto_110956 ) ) ( not ( = ?auto_110961 ?auto_110954 ) ) ( not ( = ?auto_110955 ?auto_110956 ) ) ( not ( = ?auto_110955 ?auto_110954 ) ) ( ON ?auto_110954 ?auto_110960 ) ( not ( = ?auto_110954 ?auto_110960 ) ) ( not ( = ?auto_110956 ?auto_110960 ) ) ( not ( = ?auto_110958 ?auto_110960 ) ) ( not ( = ?auto_110957 ?auto_110960 ) ) ( not ( = ?auto_110959 ?auto_110960 ) ) ( not ( = ?auto_110961 ?auto_110960 ) ) ( not ( = ?auto_110955 ?auto_110960 ) ) ( ON ?auto_110956 ?auto_110954 ) ( ON-TABLE ?auto_110960 ) ( ON ?auto_110955 ?auto_110956 ) ( CLEAR ?auto_110955 ) ( HOLDING ?auto_110961 ) ( CLEAR ?auto_110959 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110958 ?auto_110957 ?auto_110959 ?auto_110961 )
      ( MAKE-1PILE ?auto_110954 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110962 - BLOCK
    )
    :vars
    (
      ?auto_110964 - BLOCK
      ?auto_110965 - BLOCK
      ?auto_110967 - BLOCK
      ?auto_110969 - BLOCK
      ?auto_110966 - BLOCK
      ?auto_110968 - BLOCK
      ?auto_110963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110962 ?auto_110964 ) ) ( ON-TABLE ?auto_110965 ) ( ON ?auto_110967 ?auto_110965 ) ( ON ?auto_110969 ?auto_110967 ) ( not ( = ?auto_110965 ?auto_110967 ) ) ( not ( = ?auto_110965 ?auto_110969 ) ) ( not ( = ?auto_110965 ?auto_110966 ) ) ( not ( = ?auto_110965 ?auto_110968 ) ) ( not ( = ?auto_110965 ?auto_110964 ) ) ( not ( = ?auto_110965 ?auto_110962 ) ) ( not ( = ?auto_110967 ?auto_110969 ) ) ( not ( = ?auto_110967 ?auto_110966 ) ) ( not ( = ?auto_110967 ?auto_110968 ) ) ( not ( = ?auto_110967 ?auto_110964 ) ) ( not ( = ?auto_110967 ?auto_110962 ) ) ( not ( = ?auto_110969 ?auto_110966 ) ) ( not ( = ?auto_110969 ?auto_110968 ) ) ( not ( = ?auto_110969 ?auto_110964 ) ) ( not ( = ?auto_110969 ?auto_110962 ) ) ( not ( = ?auto_110966 ?auto_110968 ) ) ( not ( = ?auto_110966 ?auto_110964 ) ) ( not ( = ?auto_110966 ?auto_110962 ) ) ( not ( = ?auto_110968 ?auto_110964 ) ) ( not ( = ?auto_110968 ?auto_110962 ) ) ( ON ?auto_110962 ?auto_110963 ) ( not ( = ?auto_110962 ?auto_110963 ) ) ( not ( = ?auto_110964 ?auto_110963 ) ) ( not ( = ?auto_110965 ?auto_110963 ) ) ( not ( = ?auto_110967 ?auto_110963 ) ) ( not ( = ?auto_110969 ?auto_110963 ) ) ( not ( = ?auto_110966 ?auto_110963 ) ) ( not ( = ?auto_110968 ?auto_110963 ) ) ( ON ?auto_110964 ?auto_110962 ) ( ON-TABLE ?auto_110963 ) ( ON ?auto_110968 ?auto_110964 ) ( CLEAR ?auto_110969 ) ( ON ?auto_110966 ?auto_110968 ) ( CLEAR ?auto_110966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110963 ?auto_110962 ?auto_110964 ?auto_110968 )
      ( MAKE-1PILE ?auto_110962 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110970 - BLOCK
    )
    :vars
    (
      ?auto_110972 - BLOCK
      ?auto_110974 - BLOCK
      ?auto_110977 - BLOCK
      ?auto_110976 - BLOCK
      ?auto_110975 - BLOCK
      ?auto_110971 - BLOCK
      ?auto_110973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110970 ?auto_110972 ) ) ( ON-TABLE ?auto_110974 ) ( ON ?auto_110977 ?auto_110974 ) ( not ( = ?auto_110974 ?auto_110977 ) ) ( not ( = ?auto_110974 ?auto_110976 ) ) ( not ( = ?auto_110974 ?auto_110975 ) ) ( not ( = ?auto_110974 ?auto_110971 ) ) ( not ( = ?auto_110974 ?auto_110972 ) ) ( not ( = ?auto_110974 ?auto_110970 ) ) ( not ( = ?auto_110977 ?auto_110976 ) ) ( not ( = ?auto_110977 ?auto_110975 ) ) ( not ( = ?auto_110977 ?auto_110971 ) ) ( not ( = ?auto_110977 ?auto_110972 ) ) ( not ( = ?auto_110977 ?auto_110970 ) ) ( not ( = ?auto_110976 ?auto_110975 ) ) ( not ( = ?auto_110976 ?auto_110971 ) ) ( not ( = ?auto_110976 ?auto_110972 ) ) ( not ( = ?auto_110976 ?auto_110970 ) ) ( not ( = ?auto_110975 ?auto_110971 ) ) ( not ( = ?auto_110975 ?auto_110972 ) ) ( not ( = ?auto_110975 ?auto_110970 ) ) ( not ( = ?auto_110971 ?auto_110972 ) ) ( not ( = ?auto_110971 ?auto_110970 ) ) ( ON ?auto_110970 ?auto_110973 ) ( not ( = ?auto_110970 ?auto_110973 ) ) ( not ( = ?auto_110972 ?auto_110973 ) ) ( not ( = ?auto_110974 ?auto_110973 ) ) ( not ( = ?auto_110977 ?auto_110973 ) ) ( not ( = ?auto_110976 ?auto_110973 ) ) ( not ( = ?auto_110975 ?auto_110973 ) ) ( not ( = ?auto_110971 ?auto_110973 ) ) ( ON ?auto_110972 ?auto_110970 ) ( ON-TABLE ?auto_110973 ) ( ON ?auto_110971 ?auto_110972 ) ( ON ?auto_110975 ?auto_110971 ) ( CLEAR ?auto_110975 ) ( HOLDING ?auto_110976 ) ( CLEAR ?auto_110977 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110974 ?auto_110977 ?auto_110976 )
      ( MAKE-1PILE ?auto_110970 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110978 - BLOCK
    )
    :vars
    (
      ?auto_110980 - BLOCK
      ?auto_110981 - BLOCK
      ?auto_110979 - BLOCK
      ?auto_110984 - BLOCK
      ?auto_110982 - BLOCK
      ?auto_110983 - BLOCK
      ?auto_110985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110978 ?auto_110980 ) ) ( ON-TABLE ?auto_110981 ) ( ON ?auto_110979 ?auto_110981 ) ( not ( = ?auto_110981 ?auto_110979 ) ) ( not ( = ?auto_110981 ?auto_110984 ) ) ( not ( = ?auto_110981 ?auto_110982 ) ) ( not ( = ?auto_110981 ?auto_110983 ) ) ( not ( = ?auto_110981 ?auto_110980 ) ) ( not ( = ?auto_110981 ?auto_110978 ) ) ( not ( = ?auto_110979 ?auto_110984 ) ) ( not ( = ?auto_110979 ?auto_110982 ) ) ( not ( = ?auto_110979 ?auto_110983 ) ) ( not ( = ?auto_110979 ?auto_110980 ) ) ( not ( = ?auto_110979 ?auto_110978 ) ) ( not ( = ?auto_110984 ?auto_110982 ) ) ( not ( = ?auto_110984 ?auto_110983 ) ) ( not ( = ?auto_110984 ?auto_110980 ) ) ( not ( = ?auto_110984 ?auto_110978 ) ) ( not ( = ?auto_110982 ?auto_110983 ) ) ( not ( = ?auto_110982 ?auto_110980 ) ) ( not ( = ?auto_110982 ?auto_110978 ) ) ( not ( = ?auto_110983 ?auto_110980 ) ) ( not ( = ?auto_110983 ?auto_110978 ) ) ( ON ?auto_110978 ?auto_110985 ) ( not ( = ?auto_110978 ?auto_110985 ) ) ( not ( = ?auto_110980 ?auto_110985 ) ) ( not ( = ?auto_110981 ?auto_110985 ) ) ( not ( = ?auto_110979 ?auto_110985 ) ) ( not ( = ?auto_110984 ?auto_110985 ) ) ( not ( = ?auto_110982 ?auto_110985 ) ) ( not ( = ?auto_110983 ?auto_110985 ) ) ( ON ?auto_110980 ?auto_110978 ) ( ON-TABLE ?auto_110985 ) ( ON ?auto_110983 ?auto_110980 ) ( ON ?auto_110982 ?auto_110983 ) ( CLEAR ?auto_110979 ) ( ON ?auto_110984 ?auto_110982 ) ( CLEAR ?auto_110984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110985 ?auto_110978 ?auto_110980 ?auto_110983 ?auto_110982 )
      ( MAKE-1PILE ?auto_110978 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110986 - BLOCK
    )
    :vars
    (
      ?auto_110991 - BLOCK
      ?auto_110993 - BLOCK
      ?auto_110987 - BLOCK
      ?auto_110990 - BLOCK
      ?auto_110989 - BLOCK
      ?auto_110988 - BLOCK
      ?auto_110992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110986 ?auto_110991 ) ) ( ON-TABLE ?auto_110993 ) ( not ( = ?auto_110993 ?auto_110987 ) ) ( not ( = ?auto_110993 ?auto_110990 ) ) ( not ( = ?auto_110993 ?auto_110989 ) ) ( not ( = ?auto_110993 ?auto_110988 ) ) ( not ( = ?auto_110993 ?auto_110991 ) ) ( not ( = ?auto_110993 ?auto_110986 ) ) ( not ( = ?auto_110987 ?auto_110990 ) ) ( not ( = ?auto_110987 ?auto_110989 ) ) ( not ( = ?auto_110987 ?auto_110988 ) ) ( not ( = ?auto_110987 ?auto_110991 ) ) ( not ( = ?auto_110987 ?auto_110986 ) ) ( not ( = ?auto_110990 ?auto_110989 ) ) ( not ( = ?auto_110990 ?auto_110988 ) ) ( not ( = ?auto_110990 ?auto_110991 ) ) ( not ( = ?auto_110990 ?auto_110986 ) ) ( not ( = ?auto_110989 ?auto_110988 ) ) ( not ( = ?auto_110989 ?auto_110991 ) ) ( not ( = ?auto_110989 ?auto_110986 ) ) ( not ( = ?auto_110988 ?auto_110991 ) ) ( not ( = ?auto_110988 ?auto_110986 ) ) ( ON ?auto_110986 ?auto_110992 ) ( not ( = ?auto_110986 ?auto_110992 ) ) ( not ( = ?auto_110991 ?auto_110992 ) ) ( not ( = ?auto_110993 ?auto_110992 ) ) ( not ( = ?auto_110987 ?auto_110992 ) ) ( not ( = ?auto_110990 ?auto_110992 ) ) ( not ( = ?auto_110989 ?auto_110992 ) ) ( not ( = ?auto_110988 ?auto_110992 ) ) ( ON ?auto_110991 ?auto_110986 ) ( ON-TABLE ?auto_110992 ) ( ON ?auto_110988 ?auto_110991 ) ( ON ?auto_110989 ?auto_110988 ) ( ON ?auto_110990 ?auto_110989 ) ( CLEAR ?auto_110990 ) ( HOLDING ?auto_110987 ) ( CLEAR ?auto_110993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110993 ?auto_110987 )
      ( MAKE-1PILE ?auto_110986 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110994 - BLOCK
    )
    :vars
    (
      ?auto_110996 - BLOCK
      ?auto_110997 - BLOCK
      ?auto_110999 - BLOCK
      ?auto_111000 - BLOCK
      ?auto_110998 - BLOCK
      ?auto_110995 - BLOCK
      ?auto_111001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110994 ?auto_110996 ) ) ( ON-TABLE ?auto_110997 ) ( not ( = ?auto_110997 ?auto_110999 ) ) ( not ( = ?auto_110997 ?auto_111000 ) ) ( not ( = ?auto_110997 ?auto_110998 ) ) ( not ( = ?auto_110997 ?auto_110995 ) ) ( not ( = ?auto_110997 ?auto_110996 ) ) ( not ( = ?auto_110997 ?auto_110994 ) ) ( not ( = ?auto_110999 ?auto_111000 ) ) ( not ( = ?auto_110999 ?auto_110998 ) ) ( not ( = ?auto_110999 ?auto_110995 ) ) ( not ( = ?auto_110999 ?auto_110996 ) ) ( not ( = ?auto_110999 ?auto_110994 ) ) ( not ( = ?auto_111000 ?auto_110998 ) ) ( not ( = ?auto_111000 ?auto_110995 ) ) ( not ( = ?auto_111000 ?auto_110996 ) ) ( not ( = ?auto_111000 ?auto_110994 ) ) ( not ( = ?auto_110998 ?auto_110995 ) ) ( not ( = ?auto_110998 ?auto_110996 ) ) ( not ( = ?auto_110998 ?auto_110994 ) ) ( not ( = ?auto_110995 ?auto_110996 ) ) ( not ( = ?auto_110995 ?auto_110994 ) ) ( ON ?auto_110994 ?auto_111001 ) ( not ( = ?auto_110994 ?auto_111001 ) ) ( not ( = ?auto_110996 ?auto_111001 ) ) ( not ( = ?auto_110997 ?auto_111001 ) ) ( not ( = ?auto_110999 ?auto_111001 ) ) ( not ( = ?auto_111000 ?auto_111001 ) ) ( not ( = ?auto_110998 ?auto_111001 ) ) ( not ( = ?auto_110995 ?auto_111001 ) ) ( ON ?auto_110996 ?auto_110994 ) ( ON-TABLE ?auto_111001 ) ( ON ?auto_110995 ?auto_110996 ) ( ON ?auto_110998 ?auto_110995 ) ( ON ?auto_111000 ?auto_110998 ) ( CLEAR ?auto_110997 ) ( ON ?auto_110999 ?auto_111000 ) ( CLEAR ?auto_110999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111001 ?auto_110994 ?auto_110996 ?auto_110995 ?auto_110998 ?auto_111000 )
      ( MAKE-1PILE ?auto_110994 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111002 - BLOCK
    )
    :vars
    (
      ?auto_111005 - BLOCK
      ?auto_111007 - BLOCK
      ?auto_111004 - BLOCK
      ?auto_111008 - BLOCK
      ?auto_111009 - BLOCK
      ?auto_111006 - BLOCK
      ?auto_111003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111002 ?auto_111005 ) ) ( not ( = ?auto_111007 ?auto_111004 ) ) ( not ( = ?auto_111007 ?auto_111008 ) ) ( not ( = ?auto_111007 ?auto_111009 ) ) ( not ( = ?auto_111007 ?auto_111006 ) ) ( not ( = ?auto_111007 ?auto_111005 ) ) ( not ( = ?auto_111007 ?auto_111002 ) ) ( not ( = ?auto_111004 ?auto_111008 ) ) ( not ( = ?auto_111004 ?auto_111009 ) ) ( not ( = ?auto_111004 ?auto_111006 ) ) ( not ( = ?auto_111004 ?auto_111005 ) ) ( not ( = ?auto_111004 ?auto_111002 ) ) ( not ( = ?auto_111008 ?auto_111009 ) ) ( not ( = ?auto_111008 ?auto_111006 ) ) ( not ( = ?auto_111008 ?auto_111005 ) ) ( not ( = ?auto_111008 ?auto_111002 ) ) ( not ( = ?auto_111009 ?auto_111006 ) ) ( not ( = ?auto_111009 ?auto_111005 ) ) ( not ( = ?auto_111009 ?auto_111002 ) ) ( not ( = ?auto_111006 ?auto_111005 ) ) ( not ( = ?auto_111006 ?auto_111002 ) ) ( ON ?auto_111002 ?auto_111003 ) ( not ( = ?auto_111002 ?auto_111003 ) ) ( not ( = ?auto_111005 ?auto_111003 ) ) ( not ( = ?auto_111007 ?auto_111003 ) ) ( not ( = ?auto_111004 ?auto_111003 ) ) ( not ( = ?auto_111008 ?auto_111003 ) ) ( not ( = ?auto_111009 ?auto_111003 ) ) ( not ( = ?auto_111006 ?auto_111003 ) ) ( ON ?auto_111005 ?auto_111002 ) ( ON-TABLE ?auto_111003 ) ( ON ?auto_111006 ?auto_111005 ) ( ON ?auto_111009 ?auto_111006 ) ( ON ?auto_111008 ?auto_111009 ) ( ON ?auto_111004 ?auto_111008 ) ( CLEAR ?auto_111004 ) ( HOLDING ?auto_111007 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111007 )
      ( MAKE-1PILE ?auto_111002 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111010 - BLOCK
    )
    :vars
    (
      ?auto_111011 - BLOCK
      ?auto_111014 - BLOCK
      ?auto_111012 - BLOCK
      ?auto_111017 - BLOCK
      ?auto_111015 - BLOCK
      ?auto_111013 - BLOCK
      ?auto_111016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111010 ?auto_111011 ) ) ( not ( = ?auto_111014 ?auto_111012 ) ) ( not ( = ?auto_111014 ?auto_111017 ) ) ( not ( = ?auto_111014 ?auto_111015 ) ) ( not ( = ?auto_111014 ?auto_111013 ) ) ( not ( = ?auto_111014 ?auto_111011 ) ) ( not ( = ?auto_111014 ?auto_111010 ) ) ( not ( = ?auto_111012 ?auto_111017 ) ) ( not ( = ?auto_111012 ?auto_111015 ) ) ( not ( = ?auto_111012 ?auto_111013 ) ) ( not ( = ?auto_111012 ?auto_111011 ) ) ( not ( = ?auto_111012 ?auto_111010 ) ) ( not ( = ?auto_111017 ?auto_111015 ) ) ( not ( = ?auto_111017 ?auto_111013 ) ) ( not ( = ?auto_111017 ?auto_111011 ) ) ( not ( = ?auto_111017 ?auto_111010 ) ) ( not ( = ?auto_111015 ?auto_111013 ) ) ( not ( = ?auto_111015 ?auto_111011 ) ) ( not ( = ?auto_111015 ?auto_111010 ) ) ( not ( = ?auto_111013 ?auto_111011 ) ) ( not ( = ?auto_111013 ?auto_111010 ) ) ( ON ?auto_111010 ?auto_111016 ) ( not ( = ?auto_111010 ?auto_111016 ) ) ( not ( = ?auto_111011 ?auto_111016 ) ) ( not ( = ?auto_111014 ?auto_111016 ) ) ( not ( = ?auto_111012 ?auto_111016 ) ) ( not ( = ?auto_111017 ?auto_111016 ) ) ( not ( = ?auto_111015 ?auto_111016 ) ) ( not ( = ?auto_111013 ?auto_111016 ) ) ( ON ?auto_111011 ?auto_111010 ) ( ON-TABLE ?auto_111016 ) ( ON ?auto_111013 ?auto_111011 ) ( ON ?auto_111015 ?auto_111013 ) ( ON ?auto_111017 ?auto_111015 ) ( ON ?auto_111012 ?auto_111017 ) ( ON ?auto_111014 ?auto_111012 ) ( CLEAR ?auto_111014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111016 ?auto_111010 ?auto_111011 ?auto_111013 ?auto_111015 ?auto_111017 ?auto_111012 )
      ( MAKE-1PILE ?auto_111010 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111023 - BLOCK
      ?auto_111024 - BLOCK
      ?auto_111025 - BLOCK
      ?auto_111026 - BLOCK
      ?auto_111027 - BLOCK
    )
    :vars
    (
      ?auto_111028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111028 ?auto_111027 ) ( CLEAR ?auto_111028 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111023 ) ( ON ?auto_111024 ?auto_111023 ) ( ON ?auto_111025 ?auto_111024 ) ( ON ?auto_111026 ?auto_111025 ) ( ON ?auto_111027 ?auto_111026 ) ( not ( = ?auto_111023 ?auto_111024 ) ) ( not ( = ?auto_111023 ?auto_111025 ) ) ( not ( = ?auto_111023 ?auto_111026 ) ) ( not ( = ?auto_111023 ?auto_111027 ) ) ( not ( = ?auto_111023 ?auto_111028 ) ) ( not ( = ?auto_111024 ?auto_111025 ) ) ( not ( = ?auto_111024 ?auto_111026 ) ) ( not ( = ?auto_111024 ?auto_111027 ) ) ( not ( = ?auto_111024 ?auto_111028 ) ) ( not ( = ?auto_111025 ?auto_111026 ) ) ( not ( = ?auto_111025 ?auto_111027 ) ) ( not ( = ?auto_111025 ?auto_111028 ) ) ( not ( = ?auto_111026 ?auto_111027 ) ) ( not ( = ?auto_111026 ?auto_111028 ) ) ( not ( = ?auto_111027 ?auto_111028 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111028 ?auto_111027 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111029 - BLOCK
      ?auto_111030 - BLOCK
      ?auto_111031 - BLOCK
      ?auto_111032 - BLOCK
      ?auto_111033 - BLOCK
    )
    :vars
    (
      ?auto_111034 - BLOCK
      ?auto_111035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111034 ?auto_111033 ) ( CLEAR ?auto_111034 ) ( ON-TABLE ?auto_111029 ) ( ON ?auto_111030 ?auto_111029 ) ( ON ?auto_111031 ?auto_111030 ) ( ON ?auto_111032 ?auto_111031 ) ( ON ?auto_111033 ?auto_111032 ) ( not ( = ?auto_111029 ?auto_111030 ) ) ( not ( = ?auto_111029 ?auto_111031 ) ) ( not ( = ?auto_111029 ?auto_111032 ) ) ( not ( = ?auto_111029 ?auto_111033 ) ) ( not ( = ?auto_111029 ?auto_111034 ) ) ( not ( = ?auto_111030 ?auto_111031 ) ) ( not ( = ?auto_111030 ?auto_111032 ) ) ( not ( = ?auto_111030 ?auto_111033 ) ) ( not ( = ?auto_111030 ?auto_111034 ) ) ( not ( = ?auto_111031 ?auto_111032 ) ) ( not ( = ?auto_111031 ?auto_111033 ) ) ( not ( = ?auto_111031 ?auto_111034 ) ) ( not ( = ?auto_111032 ?auto_111033 ) ) ( not ( = ?auto_111032 ?auto_111034 ) ) ( not ( = ?auto_111033 ?auto_111034 ) ) ( HOLDING ?auto_111035 ) ( not ( = ?auto_111029 ?auto_111035 ) ) ( not ( = ?auto_111030 ?auto_111035 ) ) ( not ( = ?auto_111031 ?auto_111035 ) ) ( not ( = ?auto_111032 ?auto_111035 ) ) ( not ( = ?auto_111033 ?auto_111035 ) ) ( not ( = ?auto_111034 ?auto_111035 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_111035 )
      ( MAKE-5PILE ?auto_111029 ?auto_111030 ?auto_111031 ?auto_111032 ?auto_111033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111036 - BLOCK
      ?auto_111037 - BLOCK
      ?auto_111038 - BLOCK
      ?auto_111039 - BLOCK
      ?auto_111040 - BLOCK
    )
    :vars
    (
      ?auto_111041 - BLOCK
      ?auto_111042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111041 ?auto_111040 ) ( ON-TABLE ?auto_111036 ) ( ON ?auto_111037 ?auto_111036 ) ( ON ?auto_111038 ?auto_111037 ) ( ON ?auto_111039 ?auto_111038 ) ( ON ?auto_111040 ?auto_111039 ) ( not ( = ?auto_111036 ?auto_111037 ) ) ( not ( = ?auto_111036 ?auto_111038 ) ) ( not ( = ?auto_111036 ?auto_111039 ) ) ( not ( = ?auto_111036 ?auto_111040 ) ) ( not ( = ?auto_111036 ?auto_111041 ) ) ( not ( = ?auto_111037 ?auto_111038 ) ) ( not ( = ?auto_111037 ?auto_111039 ) ) ( not ( = ?auto_111037 ?auto_111040 ) ) ( not ( = ?auto_111037 ?auto_111041 ) ) ( not ( = ?auto_111038 ?auto_111039 ) ) ( not ( = ?auto_111038 ?auto_111040 ) ) ( not ( = ?auto_111038 ?auto_111041 ) ) ( not ( = ?auto_111039 ?auto_111040 ) ) ( not ( = ?auto_111039 ?auto_111041 ) ) ( not ( = ?auto_111040 ?auto_111041 ) ) ( not ( = ?auto_111036 ?auto_111042 ) ) ( not ( = ?auto_111037 ?auto_111042 ) ) ( not ( = ?auto_111038 ?auto_111042 ) ) ( not ( = ?auto_111039 ?auto_111042 ) ) ( not ( = ?auto_111040 ?auto_111042 ) ) ( not ( = ?auto_111041 ?auto_111042 ) ) ( ON ?auto_111042 ?auto_111041 ) ( CLEAR ?auto_111042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111036 ?auto_111037 ?auto_111038 ?auto_111039 ?auto_111040 ?auto_111041 )
      ( MAKE-5PILE ?auto_111036 ?auto_111037 ?auto_111038 ?auto_111039 ?auto_111040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111043 - BLOCK
      ?auto_111044 - BLOCK
      ?auto_111045 - BLOCK
      ?auto_111046 - BLOCK
      ?auto_111047 - BLOCK
    )
    :vars
    (
      ?auto_111048 - BLOCK
      ?auto_111049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111048 ?auto_111047 ) ( ON-TABLE ?auto_111043 ) ( ON ?auto_111044 ?auto_111043 ) ( ON ?auto_111045 ?auto_111044 ) ( ON ?auto_111046 ?auto_111045 ) ( ON ?auto_111047 ?auto_111046 ) ( not ( = ?auto_111043 ?auto_111044 ) ) ( not ( = ?auto_111043 ?auto_111045 ) ) ( not ( = ?auto_111043 ?auto_111046 ) ) ( not ( = ?auto_111043 ?auto_111047 ) ) ( not ( = ?auto_111043 ?auto_111048 ) ) ( not ( = ?auto_111044 ?auto_111045 ) ) ( not ( = ?auto_111044 ?auto_111046 ) ) ( not ( = ?auto_111044 ?auto_111047 ) ) ( not ( = ?auto_111044 ?auto_111048 ) ) ( not ( = ?auto_111045 ?auto_111046 ) ) ( not ( = ?auto_111045 ?auto_111047 ) ) ( not ( = ?auto_111045 ?auto_111048 ) ) ( not ( = ?auto_111046 ?auto_111047 ) ) ( not ( = ?auto_111046 ?auto_111048 ) ) ( not ( = ?auto_111047 ?auto_111048 ) ) ( not ( = ?auto_111043 ?auto_111049 ) ) ( not ( = ?auto_111044 ?auto_111049 ) ) ( not ( = ?auto_111045 ?auto_111049 ) ) ( not ( = ?auto_111046 ?auto_111049 ) ) ( not ( = ?auto_111047 ?auto_111049 ) ) ( not ( = ?auto_111048 ?auto_111049 ) ) ( HOLDING ?auto_111049 ) ( CLEAR ?auto_111048 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111043 ?auto_111044 ?auto_111045 ?auto_111046 ?auto_111047 ?auto_111048 ?auto_111049 )
      ( MAKE-5PILE ?auto_111043 ?auto_111044 ?auto_111045 ?auto_111046 ?auto_111047 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111050 - BLOCK
      ?auto_111051 - BLOCK
      ?auto_111052 - BLOCK
      ?auto_111053 - BLOCK
      ?auto_111054 - BLOCK
    )
    :vars
    (
      ?auto_111055 - BLOCK
      ?auto_111056 - BLOCK
      ?auto_111057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111055 ?auto_111054 ) ( ON-TABLE ?auto_111050 ) ( ON ?auto_111051 ?auto_111050 ) ( ON ?auto_111052 ?auto_111051 ) ( ON ?auto_111053 ?auto_111052 ) ( ON ?auto_111054 ?auto_111053 ) ( not ( = ?auto_111050 ?auto_111051 ) ) ( not ( = ?auto_111050 ?auto_111052 ) ) ( not ( = ?auto_111050 ?auto_111053 ) ) ( not ( = ?auto_111050 ?auto_111054 ) ) ( not ( = ?auto_111050 ?auto_111055 ) ) ( not ( = ?auto_111051 ?auto_111052 ) ) ( not ( = ?auto_111051 ?auto_111053 ) ) ( not ( = ?auto_111051 ?auto_111054 ) ) ( not ( = ?auto_111051 ?auto_111055 ) ) ( not ( = ?auto_111052 ?auto_111053 ) ) ( not ( = ?auto_111052 ?auto_111054 ) ) ( not ( = ?auto_111052 ?auto_111055 ) ) ( not ( = ?auto_111053 ?auto_111054 ) ) ( not ( = ?auto_111053 ?auto_111055 ) ) ( not ( = ?auto_111054 ?auto_111055 ) ) ( not ( = ?auto_111050 ?auto_111056 ) ) ( not ( = ?auto_111051 ?auto_111056 ) ) ( not ( = ?auto_111052 ?auto_111056 ) ) ( not ( = ?auto_111053 ?auto_111056 ) ) ( not ( = ?auto_111054 ?auto_111056 ) ) ( not ( = ?auto_111055 ?auto_111056 ) ) ( CLEAR ?auto_111055 ) ( ON ?auto_111056 ?auto_111057 ) ( CLEAR ?auto_111056 ) ( HAND-EMPTY ) ( not ( = ?auto_111050 ?auto_111057 ) ) ( not ( = ?auto_111051 ?auto_111057 ) ) ( not ( = ?auto_111052 ?auto_111057 ) ) ( not ( = ?auto_111053 ?auto_111057 ) ) ( not ( = ?auto_111054 ?auto_111057 ) ) ( not ( = ?auto_111055 ?auto_111057 ) ) ( not ( = ?auto_111056 ?auto_111057 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111056 ?auto_111057 )
      ( MAKE-5PILE ?auto_111050 ?auto_111051 ?auto_111052 ?auto_111053 ?auto_111054 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111074 - BLOCK
      ?auto_111075 - BLOCK
      ?auto_111076 - BLOCK
      ?auto_111077 - BLOCK
      ?auto_111078 - BLOCK
    )
    :vars
    (
      ?auto_111079 - BLOCK
      ?auto_111081 - BLOCK
      ?auto_111080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111074 ) ( ON ?auto_111075 ?auto_111074 ) ( ON ?auto_111076 ?auto_111075 ) ( ON ?auto_111077 ?auto_111076 ) ( not ( = ?auto_111074 ?auto_111075 ) ) ( not ( = ?auto_111074 ?auto_111076 ) ) ( not ( = ?auto_111074 ?auto_111077 ) ) ( not ( = ?auto_111074 ?auto_111078 ) ) ( not ( = ?auto_111074 ?auto_111079 ) ) ( not ( = ?auto_111075 ?auto_111076 ) ) ( not ( = ?auto_111075 ?auto_111077 ) ) ( not ( = ?auto_111075 ?auto_111078 ) ) ( not ( = ?auto_111075 ?auto_111079 ) ) ( not ( = ?auto_111076 ?auto_111077 ) ) ( not ( = ?auto_111076 ?auto_111078 ) ) ( not ( = ?auto_111076 ?auto_111079 ) ) ( not ( = ?auto_111077 ?auto_111078 ) ) ( not ( = ?auto_111077 ?auto_111079 ) ) ( not ( = ?auto_111078 ?auto_111079 ) ) ( not ( = ?auto_111074 ?auto_111081 ) ) ( not ( = ?auto_111075 ?auto_111081 ) ) ( not ( = ?auto_111076 ?auto_111081 ) ) ( not ( = ?auto_111077 ?auto_111081 ) ) ( not ( = ?auto_111078 ?auto_111081 ) ) ( not ( = ?auto_111079 ?auto_111081 ) ) ( ON ?auto_111081 ?auto_111080 ) ( not ( = ?auto_111074 ?auto_111080 ) ) ( not ( = ?auto_111075 ?auto_111080 ) ) ( not ( = ?auto_111076 ?auto_111080 ) ) ( not ( = ?auto_111077 ?auto_111080 ) ) ( not ( = ?auto_111078 ?auto_111080 ) ) ( not ( = ?auto_111079 ?auto_111080 ) ) ( not ( = ?auto_111081 ?auto_111080 ) ) ( ON ?auto_111079 ?auto_111081 ) ( CLEAR ?auto_111079 ) ( HOLDING ?auto_111078 ) ( CLEAR ?auto_111077 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111074 ?auto_111075 ?auto_111076 ?auto_111077 ?auto_111078 ?auto_111079 )
      ( MAKE-5PILE ?auto_111074 ?auto_111075 ?auto_111076 ?auto_111077 ?auto_111078 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111082 - BLOCK
      ?auto_111083 - BLOCK
      ?auto_111084 - BLOCK
      ?auto_111085 - BLOCK
      ?auto_111086 - BLOCK
    )
    :vars
    (
      ?auto_111087 - BLOCK
      ?auto_111088 - BLOCK
      ?auto_111089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111082 ) ( ON ?auto_111083 ?auto_111082 ) ( ON ?auto_111084 ?auto_111083 ) ( ON ?auto_111085 ?auto_111084 ) ( not ( = ?auto_111082 ?auto_111083 ) ) ( not ( = ?auto_111082 ?auto_111084 ) ) ( not ( = ?auto_111082 ?auto_111085 ) ) ( not ( = ?auto_111082 ?auto_111086 ) ) ( not ( = ?auto_111082 ?auto_111087 ) ) ( not ( = ?auto_111083 ?auto_111084 ) ) ( not ( = ?auto_111083 ?auto_111085 ) ) ( not ( = ?auto_111083 ?auto_111086 ) ) ( not ( = ?auto_111083 ?auto_111087 ) ) ( not ( = ?auto_111084 ?auto_111085 ) ) ( not ( = ?auto_111084 ?auto_111086 ) ) ( not ( = ?auto_111084 ?auto_111087 ) ) ( not ( = ?auto_111085 ?auto_111086 ) ) ( not ( = ?auto_111085 ?auto_111087 ) ) ( not ( = ?auto_111086 ?auto_111087 ) ) ( not ( = ?auto_111082 ?auto_111088 ) ) ( not ( = ?auto_111083 ?auto_111088 ) ) ( not ( = ?auto_111084 ?auto_111088 ) ) ( not ( = ?auto_111085 ?auto_111088 ) ) ( not ( = ?auto_111086 ?auto_111088 ) ) ( not ( = ?auto_111087 ?auto_111088 ) ) ( ON ?auto_111088 ?auto_111089 ) ( not ( = ?auto_111082 ?auto_111089 ) ) ( not ( = ?auto_111083 ?auto_111089 ) ) ( not ( = ?auto_111084 ?auto_111089 ) ) ( not ( = ?auto_111085 ?auto_111089 ) ) ( not ( = ?auto_111086 ?auto_111089 ) ) ( not ( = ?auto_111087 ?auto_111089 ) ) ( not ( = ?auto_111088 ?auto_111089 ) ) ( ON ?auto_111087 ?auto_111088 ) ( CLEAR ?auto_111085 ) ( ON ?auto_111086 ?auto_111087 ) ( CLEAR ?auto_111086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111089 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111089 ?auto_111088 ?auto_111087 )
      ( MAKE-5PILE ?auto_111082 ?auto_111083 ?auto_111084 ?auto_111085 ?auto_111086 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111090 - BLOCK
      ?auto_111091 - BLOCK
      ?auto_111092 - BLOCK
      ?auto_111093 - BLOCK
      ?auto_111094 - BLOCK
    )
    :vars
    (
      ?auto_111095 - BLOCK
      ?auto_111097 - BLOCK
      ?auto_111096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111090 ) ( ON ?auto_111091 ?auto_111090 ) ( ON ?auto_111092 ?auto_111091 ) ( not ( = ?auto_111090 ?auto_111091 ) ) ( not ( = ?auto_111090 ?auto_111092 ) ) ( not ( = ?auto_111090 ?auto_111093 ) ) ( not ( = ?auto_111090 ?auto_111094 ) ) ( not ( = ?auto_111090 ?auto_111095 ) ) ( not ( = ?auto_111091 ?auto_111092 ) ) ( not ( = ?auto_111091 ?auto_111093 ) ) ( not ( = ?auto_111091 ?auto_111094 ) ) ( not ( = ?auto_111091 ?auto_111095 ) ) ( not ( = ?auto_111092 ?auto_111093 ) ) ( not ( = ?auto_111092 ?auto_111094 ) ) ( not ( = ?auto_111092 ?auto_111095 ) ) ( not ( = ?auto_111093 ?auto_111094 ) ) ( not ( = ?auto_111093 ?auto_111095 ) ) ( not ( = ?auto_111094 ?auto_111095 ) ) ( not ( = ?auto_111090 ?auto_111097 ) ) ( not ( = ?auto_111091 ?auto_111097 ) ) ( not ( = ?auto_111092 ?auto_111097 ) ) ( not ( = ?auto_111093 ?auto_111097 ) ) ( not ( = ?auto_111094 ?auto_111097 ) ) ( not ( = ?auto_111095 ?auto_111097 ) ) ( ON ?auto_111097 ?auto_111096 ) ( not ( = ?auto_111090 ?auto_111096 ) ) ( not ( = ?auto_111091 ?auto_111096 ) ) ( not ( = ?auto_111092 ?auto_111096 ) ) ( not ( = ?auto_111093 ?auto_111096 ) ) ( not ( = ?auto_111094 ?auto_111096 ) ) ( not ( = ?auto_111095 ?auto_111096 ) ) ( not ( = ?auto_111097 ?auto_111096 ) ) ( ON ?auto_111095 ?auto_111097 ) ( ON ?auto_111094 ?auto_111095 ) ( CLEAR ?auto_111094 ) ( ON-TABLE ?auto_111096 ) ( HOLDING ?auto_111093 ) ( CLEAR ?auto_111092 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111090 ?auto_111091 ?auto_111092 ?auto_111093 )
      ( MAKE-5PILE ?auto_111090 ?auto_111091 ?auto_111092 ?auto_111093 ?auto_111094 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111098 - BLOCK
      ?auto_111099 - BLOCK
      ?auto_111100 - BLOCK
      ?auto_111101 - BLOCK
      ?auto_111102 - BLOCK
    )
    :vars
    (
      ?auto_111105 - BLOCK
      ?auto_111103 - BLOCK
      ?auto_111104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111098 ) ( ON ?auto_111099 ?auto_111098 ) ( ON ?auto_111100 ?auto_111099 ) ( not ( = ?auto_111098 ?auto_111099 ) ) ( not ( = ?auto_111098 ?auto_111100 ) ) ( not ( = ?auto_111098 ?auto_111101 ) ) ( not ( = ?auto_111098 ?auto_111102 ) ) ( not ( = ?auto_111098 ?auto_111105 ) ) ( not ( = ?auto_111099 ?auto_111100 ) ) ( not ( = ?auto_111099 ?auto_111101 ) ) ( not ( = ?auto_111099 ?auto_111102 ) ) ( not ( = ?auto_111099 ?auto_111105 ) ) ( not ( = ?auto_111100 ?auto_111101 ) ) ( not ( = ?auto_111100 ?auto_111102 ) ) ( not ( = ?auto_111100 ?auto_111105 ) ) ( not ( = ?auto_111101 ?auto_111102 ) ) ( not ( = ?auto_111101 ?auto_111105 ) ) ( not ( = ?auto_111102 ?auto_111105 ) ) ( not ( = ?auto_111098 ?auto_111103 ) ) ( not ( = ?auto_111099 ?auto_111103 ) ) ( not ( = ?auto_111100 ?auto_111103 ) ) ( not ( = ?auto_111101 ?auto_111103 ) ) ( not ( = ?auto_111102 ?auto_111103 ) ) ( not ( = ?auto_111105 ?auto_111103 ) ) ( ON ?auto_111103 ?auto_111104 ) ( not ( = ?auto_111098 ?auto_111104 ) ) ( not ( = ?auto_111099 ?auto_111104 ) ) ( not ( = ?auto_111100 ?auto_111104 ) ) ( not ( = ?auto_111101 ?auto_111104 ) ) ( not ( = ?auto_111102 ?auto_111104 ) ) ( not ( = ?auto_111105 ?auto_111104 ) ) ( not ( = ?auto_111103 ?auto_111104 ) ) ( ON ?auto_111105 ?auto_111103 ) ( ON ?auto_111102 ?auto_111105 ) ( ON-TABLE ?auto_111104 ) ( CLEAR ?auto_111100 ) ( ON ?auto_111101 ?auto_111102 ) ( CLEAR ?auto_111101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111104 ?auto_111103 ?auto_111105 ?auto_111102 )
      ( MAKE-5PILE ?auto_111098 ?auto_111099 ?auto_111100 ?auto_111101 ?auto_111102 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111106 - BLOCK
      ?auto_111107 - BLOCK
      ?auto_111108 - BLOCK
      ?auto_111109 - BLOCK
      ?auto_111110 - BLOCK
    )
    :vars
    (
      ?auto_111112 - BLOCK
      ?auto_111111 - BLOCK
      ?auto_111113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111106 ) ( ON ?auto_111107 ?auto_111106 ) ( not ( = ?auto_111106 ?auto_111107 ) ) ( not ( = ?auto_111106 ?auto_111108 ) ) ( not ( = ?auto_111106 ?auto_111109 ) ) ( not ( = ?auto_111106 ?auto_111110 ) ) ( not ( = ?auto_111106 ?auto_111112 ) ) ( not ( = ?auto_111107 ?auto_111108 ) ) ( not ( = ?auto_111107 ?auto_111109 ) ) ( not ( = ?auto_111107 ?auto_111110 ) ) ( not ( = ?auto_111107 ?auto_111112 ) ) ( not ( = ?auto_111108 ?auto_111109 ) ) ( not ( = ?auto_111108 ?auto_111110 ) ) ( not ( = ?auto_111108 ?auto_111112 ) ) ( not ( = ?auto_111109 ?auto_111110 ) ) ( not ( = ?auto_111109 ?auto_111112 ) ) ( not ( = ?auto_111110 ?auto_111112 ) ) ( not ( = ?auto_111106 ?auto_111111 ) ) ( not ( = ?auto_111107 ?auto_111111 ) ) ( not ( = ?auto_111108 ?auto_111111 ) ) ( not ( = ?auto_111109 ?auto_111111 ) ) ( not ( = ?auto_111110 ?auto_111111 ) ) ( not ( = ?auto_111112 ?auto_111111 ) ) ( ON ?auto_111111 ?auto_111113 ) ( not ( = ?auto_111106 ?auto_111113 ) ) ( not ( = ?auto_111107 ?auto_111113 ) ) ( not ( = ?auto_111108 ?auto_111113 ) ) ( not ( = ?auto_111109 ?auto_111113 ) ) ( not ( = ?auto_111110 ?auto_111113 ) ) ( not ( = ?auto_111112 ?auto_111113 ) ) ( not ( = ?auto_111111 ?auto_111113 ) ) ( ON ?auto_111112 ?auto_111111 ) ( ON ?auto_111110 ?auto_111112 ) ( ON-TABLE ?auto_111113 ) ( ON ?auto_111109 ?auto_111110 ) ( CLEAR ?auto_111109 ) ( HOLDING ?auto_111108 ) ( CLEAR ?auto_111107 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111106 ?auto_111107 ?auto_111108 )
      ( MAKE-5PILE ?auto_111106 ?auto_111107 ?auto_111108 ?auto_111109 ?auto_111110 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111114 - BLOCK
      ?auto_111115 - BLOCK
      ?auto_111116 - BLOCK
      ?auto_111117 - BLOCK
      ?auto_111118 - BLOCK
    )
    :vars
    (
      ?auto_111120 - BLOCK
      ?auto_111119 - BLOCK
      ?auto_111121 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111114 ) ( ON ?auto_111115 ?auto_111114 ) ( not ( = ?auto_111114 ?auto_111115 ) ) ( not ( = ?auto_111114 ?auto_111116 ) ) ( not ( = ?auto_111114 ?auto_111117 ) ) ( not ( = ?auto_111114 ?auto_111118 ) ) ( not ( = ?auto_111114 ?auto_111120 ) ) ( not ( = ?auto_111115 ?auto_111116 ) ) ( not ( = ?auto_111115 ?auto_111117 ) ) ( not ( = ?auto_111115 ?auto_111118 ) ) ( not ( = ?auto_111115 ?auto_111120 ) ) ( not ( = ?auto_111116 ?auto_111117 ) ) ( not ( = ?auto_111116 ?auto_111118 ) ) ( not ( = ?auto_111116 ?auto_111120 ) ) ( not ( = ?auto_111117 ?auto_111118 ) ) ( not ( = ?auto_111117 ?auto_111120 ) ) ( not ( = ?auto_111118 ?auto_111120 ) ) ( not ( = ?auto_111114 ?auto_111119 ) ) ( not ( = ?auto_111115 ?auto_111119 ) ) ( not ( = ?auto_111116 ?auto_111119 ) ) ( not ( = ?auto_111117 ?auto_111119 ) ) ( not ( = ?auto_111118 ?auto_111119 ) ) ( not ( = ?auto_111120 ?auto_111119 ) ) ( ON ?auto_111119 ?auto_111121 ) ( not ( = ?auto_111114 ?auto_111121 ) ) ( not ( = ?auto_111115 ?auto_111121 ) ) ( not ( = ?auto_111116 ?auto_111121 ) ) ( not ( = ?auto_111117 ?auto_111121 ) ) ( not ( = ?auto_111118 ?auto_111121 ) ) ( not ( = ?auto_111120 ?auto_111121 ) ) ( not ( = ?auto_111119 ?auto_111121 ) ) ( ON ?auto_111120 ?auto_111119 ) ( ON ?auto_111118 ?auto_111120 ) ( ON-TABLE ?auto_111121 ) ( ON ?auto_111117 ?auto_111118 ) ( CLEAR ?auto_111115 ) ( ON ?auto_111116 ?auto_111117 ) ( CLEAR ?auto_111116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111121 ?auto_111119 ?auto_111120 ?auto_111118 ?auto_111117 )
      ( MAKE-5PILE ?auto_111114 ?auto_111115 ?auto_111116 ?auto_111117 ?auto_111118 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111122 - BLOCK
      ?auto_111123 - BLOCK
      ?auto_111124 - BLOCK
      ?auto_111125 - BLOCK
      ?auto_111126 - BLOCK
    )
    :vars
    (
      ?auto_111128 - BLOCK
      ?auto_111129 - BLOCK
      ?auto_111127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111122 ) ( not ( = ?auto_111122 ?auto_111123 ) ) ( not ( = ?auto_111122 ?auto_111124 ) ) ( not ( = ?auto_111122 ?auto_111125 ) ) ( not ( = ?auto_111122 ?auto_111126 ) ) ( not ( = ?auto_111122 ?auto_111128 ) ) ( not ( = ?auto_111123 ?auto_111124 ) ) ( not ( = ?auto_111123 ?auto_111125 ) ) ( not ( = ?auto_111123 ?auto_111126 ) ) ( not ( = ?auto_111123 ?auto_111128 ) ) ( not ( = ?auto_111124 ?auto_111125 ) ) ( not ( = ?auto_111124 ?auto_111126 ) ) ( not ( = ?auto_111124 ?auto_111128 ) ) ( not ( = ?auto_111125 ?auto_111126 ) ) ( not ( = ?auto_111125 ?auto_111128 ) ) ( not ( = ?auto_111126 ?auto_111128 ) ) ( not ( = ?auto_111122 ?auto_111129 ) ) ( not ( = ?auto_111123 ?auto_111129 ) ) ( not ( = ?auto_111124 ?auto_111129 ) ) ( not ( = ?auto_111125 ?auto_111129 ) ) ( not ( = ?auto_111126 ?auto_111129 ) ) ( not ( = ?auto_111128 ?auto_111129 ) ) ( ON ?auto_111129 ?auto_111127 ) ( not ( = ?auto_111122 ?auto_111127 ) ) ( not ( = ?auto_111123 ?auto_111127 ) ) ( not ( = ?auto_111124 ?auto_111127 ) ) ( not ( = ?auto_111125 ?auto_111127 ) ) ( not ( = ?auto_111126 ?auto_111127 ) ) ( not ( = ?auto_111128 ?auto_111127 ) ) ( not ( = ?auto_111129 ?auto_111127 ) ) ( ON ?auto_111128 ?auto_111129 ) ( ON ?auto_111126 ?auto_111128 ) ( ON-TABLE ?auto_111127 ) ( ON ?auto_111125 ?auto_111126 ) ( ON ?auto_111124 ?auto_111125 ) ( CLEAR ?auto_111124 ) ( HOLDING ?auto_111123 ) ( CLEAR ?auto_111122 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111122 ?auto_111123 )
      ( MAKE-5PILE ?auto_111122 ?auto_111123 ?auto_111124 ?auto_111125 ?auto_111126 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111130 - BLOCK
      ?auto_111131 - BLOCK
      ?auto_111132 - BLOCK
      ?auto_111133 - BLOCK
      ?auto_111134 - BLOCK
    )
    :vars
    (
      ?auto_111137 - BLOCK
      ?auto_111135 - BLOCK
      ?auto_111136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111130 ) ( not ( = ?auto_111130 ?auto_111131 ) ) ( not ( = ?auto_111130 ?auto_111132 ) ) ( not ( = ?auto_111130 ?auto_111133 ) ) ( not ( = ?auto_111130 ?auto_111134 ) ) ( not ( = ?auto_111130 ?auto_111137 ) ) ( not ( = ?auto_111131 ?auto_111132 ) ) ( not ( = ?auto_111131 ?auto_111133 ) ) ( not ( = ?auto_111131 ?auto_111134 ) ) ( not ( = ?auto_111131 ?auto_111137 ) ) ( not ( = ?auto_111132 ?auto_111133 ) ) ( not ( = ?auto_111132 ?auto_111134 ) ) ( not ( = ?auto_111132 ?auto_111137 ) ) ( not ( = ?auto_111133 ?auto_111134 ) ) ( not ( = ?auto_111133 ?auto_111137 ) ) ( not ( = ?auto_111134 ?auto_111137 ) ) ( not ( = ?auto_111130 ?auto_111135 ) ) ( not ( = ?auto_111131 ?auto_111135 ) ) ( not ( = ?auto_111132 ?auto_111135 ) ) ( not ( = ?auto_111133 ?auto_111135 ) ) ( not ( = ?auto_111134 ?auto_111135 ) ) ( not ( = ?auto_111137 ?auto_111135 ) ) ( ON ?auto_111135 ?auto_111136 ) ( not ( = ?auto_111130 ?auto_111136 ) ) ( not ( = ?auto_111131 ?auto_111136 ) ) ( not ( = ?auto_111132 ?auto_111136 ) ) ( not ( = ?auto_111133 ?auto_111136 ) ) ( not ( = ?auto_111134 ?auto_111136 ) ) ( not ( = ?auto_111137 ?auto_111136 ) ) ( not ( = ?auto_111135 ?auto_111136 ) ) ( ON ?auto_111137 ?auto_111135 ) ( ON ?auto_111134 ?auto_111137 ) ( ON-TABLE ?auto_111136 ) ( ON ?auto_111133 ?auto_111134 ) ( ON ?auto_111132 ?auto_111133 ) ( CLEAR ?auto_111130 ) ( ON ?auto_111131 ?auto_111132 ) ( CLEAR ?auto_111131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111136 ?auto_111135 ?auto_111137 ?auto_111134 ?auto_111133 ?auto_111132 )
      ( MAKE-5PILE ?auto_111130 ?auto_111131 ?auto_111132 ?auto_111133 ?auto_111134 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111138 - BLOCK
      ?auto_111139 - BLOCK
      ?auto_111140 - BLOCK
      ?auto_111141 - BLOCK
      ?auto_111142 - BLOCK
    )
    :vars
    (
      ?auto_111145 - BLOCK
      ?auto_111144 - BLOCK
      ?auto_111143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111138 ?auto_111139 ) ) ( not ( = ?auto_111138 ?auto_111140 ) ) ( not ( = ?auto_111138 ?auto_111141 ) ) ( not ( = ?auto_111138 ?auto_111142 ) ) ( not ( = ?auto_111138 ?auto_111145 ) ) ( not ( = ?auto_111139 ?auto_111140 ) ) ( not ( = ?auto_111139 ?auto_111141 ) ) ( not ( = ?auto_111139 ?auto_111142 ) ) ( not ( = ?auto_111139 ?auto_111145 ) ) ( not ( = ?auto_111140 ?auto_111141 ) ) ( not ( = ?auto_111140 ?auto_111142 ) ) ( not ( = ?auto_111140 ?auto_111145 ) ) ( not ( = ?auto_111141 ?auto_111142 ) ) ( not ( = ?auto_111141 ?auto_111145 ) ) ( not ( = ?auto_111142 ?auto_111145 ) ) ( not ( = ?auto_111138 ?auto_111144 ) ) ( not ( = ?auto_111139 ?auto_111144 ) ) ( not ( = ?auto_111140 ?auto_111144 ) ) ( not ( = ?auto_111141 ?auto_111144 ) ) ( not ( = ?auto_111142 ?auto_111144 ) ) ( not ( = ?auto_111145 ?auto_111144 ) ) ( ON ?auto_111144 ?auto_111143 ) ( not ( = ?auto_111138 ?auto_111143 ) ) ( not ( = ?auto_111139 ?auto_111143 ) ) ( not ( = ?auto_111140 ?auto_111143 ) ) ( not ( = ?auto_111141 ?auto_111143 ) ) ( not ( = ?auto_111142 ?auto_111143 ) ) ( not ( = ?auto_111145 ?auto_111143 ) ) ( not ( = ?auto_111144 ?auto_111143 ) ) ( ON ?auto_111145 ?auto_111144 ) ( ON ?auto_111142 ?auto_111145 ) ( ON-TABLE ?auto_111143 ) ( ON ?auto_111141 ?auto_111142 ) ( ON ?auto_111140 ?auto_111141 ) ( ON ?auto_111139 ?auto_111140 ) ( CLEAR ?auto_111139 ) ( HOLDING ?auto_111138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111138 )
      ( MAKE-5PILE ?auto_111138 ?auto_111139 ?auto_111140 ?auto_111141 ?auto_111142 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111146 - BLOCK
      ?auto_111147 - BLOCK
      ?auto_111148 - BLOCK
      ?auto_111149 - BLOCK
      ?auto_111150 - BLOCK
    )
    :vars
    (
      ?auto_111151 - BLOCK
      ?auto_111153 - BLOCK
      ?auto_111152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111146 ?auto_111147 ) ) ( not ( = ?auto_111146 ?auto_111148 ) ) ( not ( = ?auto_111146 ?auto_111149 ) ) ( not ( = ?auto_111146 ?auto_111150 ) ) ( not ( = ?auto_111146 ?auto_111151 ) ) ( not ( = ?auto_111147 ?auto_111148 ) ) ( not ( = ?auto_111147 ?auto_111149 ) ) ( not ( = ?auto_111147 ?auto_111150 ) ) ( not ( = ?auto_111147 ?auto_111151 ) ) ( not ( = ?auto_111148 ?auto_111149 ) ) ( not ( = ?auto_111148 ?auto_111150 ) ) ( not ( = ?auto_111148 ?auto_111151 ) ) ( not ( = ?auto_111149 ?auto_111150 ) ) ( not ( = ?auto_111149 ?auto_111151 ) ) ( not ( = ?auto_111150 ?auto_111151 ) ) ( not ( = ?auto_111146 ?auto_111153 ) ) ( not ( = ?auto_111147 ?auto_111153 ) ) ( not ( = ?auto_111148 ?auto_111153 ) ) ( not ( = ?auto_111149 ?auto_111153 ) ) ( not ( = ?auto_111150 ?auto_111153 ) ) ( not ( = ?auto_111151 ?auto_111153 ) ) ( ON ?auto_111153 ?auto_111152 ) ( not ( = ?auto_111146 ?auto_111152 ) ) ( not ( = ?auto_111147 ?auto_111152 ) ) ( not ( = ?auto_111148 ?auto_111152 ) ) ( not ( = ?auto_111149 ?auto_111152 ) ) ( not ( = ?auto_111150 ?auto_111152 ) ) ( not ( = ?auto_111151 ?auto_111152 ) ) ( not ( = ?auto_111153 ?auto_111152 ) ) ( ON ?auto_111151 ?auto_111153 ) ( ON ?auto_111150 ?auto_111151 ) ( ON-TABLE ?auto_111152 ) ( ON ?auto_111149 ?auto_111150 ) ( ON ?auto_111148 ?auto_111149 ) ( ON ?auto_111147 ?auto_111148 ) ( ON ?auto_111146 ?auto_111147 ) ( CLEAR ?auto_111146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111152 ?auto_111153 ?auto_111151 ?auto_111150 ?auto_111149 ?auto_111148 ?auto_111147 )
      ( MAKE-5PILE ?auto_111146 ?auto_111147 ?auto_111148 ?auto_111149 ?auto_111150 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111156 - BLOCK
      ?auto_111157 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_111157 ) ( CLEAR ?auto_111156 ) ( ON-TABLE ?auto_111156 ) ( not ( = ?auto_111156 ?auto_111157 ) ) )
    :subtasks
    ( ( !STACK ?auto_111157 ?auto_111156 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111158 - BLOCK
      ?auto_111159 - BLOCK
    )
    :vars
    (
      ?auto_111160 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111158 ) ( ON-TABLE ?auto_111158 ) ( not ( = ?auto_111158 ?auto_111159 ) ) ( ON ?auto_111159 ?auto_111160 ) ( CLEAR ?auto_111159 ) ( HAND-EMPTY ) ( not ( = ?auto_111158 ?auto_111160 ) ) ( not ( = ?auto_111159 ?auto_111160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111159 ?auto_111160 )
      ( MAKE-2PILE ?auto_111158 ?auto_111159 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111161 - BLOCK
      ?auto_111162 - BLOCK
    )
    :vars
    (
      ?auto_111163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111161 ?auto_111162 ) ) ( ON ?auto_111162 ?auto_111163 ) ( CLEAR ?auto_111162 ) ( not ( = ?auto_111161 ?auto_111163 ) ) ( not ( = ?auto_111162 ?auto_111163 ) ) ( HOLDING ?auto_111161 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111161 )
      ( MAKE-2PILE ?auto_111161 ?auto_111162 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111164 - BLOCK
      ?auto_111165 - BLOCK
    )
    :vars
    (
      ?auto_111166 - BLOCK
      ?auto_111170 - BLOCK
      ?auto_111169 - BLOCK
      ?auto_111168 - BLOCK
      ?auto_111167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111164 ?auto_111165 ) ) ( ON ?auto_111165 ?auto_111166 ) ( not ( = ?auto_111164 ?auto_111166 ) ) ( not ( = ?auto_111165 ?auto_111166 ) ) ( ON ?auto_111164 ?auto_111165 ) ( CLEAR ?auto_111164 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111170 ) ( ON ?auto_111169 ?auto_111170 ) ( ON ?auto_111168 ?auto_111169 ) ( ON ?auto_111167 ?auto_111168 ) ( ON ?auto_111166 ?auto_111167 ) ( not ( = ?auto_111170 ?auto_111169 ) ) ( not ( = ?auto_111170 ?auto_111168 ) ) ( not ( = ?auto_111170 ?auto_111167 ) ) ( not ( = ?auto_111170 ?auto_111166 ) ) ( not ( = ?auto_111170 ?auto_111165 ) ) ( not ( = ?auto_111170 ?auto_111164 ) ) ( not ( = ?auto_111169 ?auto_111168 ) ) ( not ( = ?auto_111169 ?auto_111167 ) ) ( not ( = ?auto_111169 ?auto_111166 ) ) ( not ( = ?auto_111169 ?auto_111165 ) ) ( not ( = ?auto_111169 ?auto_111164 ) ) ( not ( = ?auto_111168 ?auto_111167 ) ) ( not ( = ?auto_111168 ?auto_111166 ) ) ( not ( = ?auto_111168 ?auto_111165 ) ) ( not ( = ?auto_111168 ?auto_111164 ) ) ( not ( = ?auto_111167 ?auto_111166 ) ) ( not ( = ?auto_111167 ?auto_111165 ) ) ( not ( = ?auto_111167 ?auto_111164 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111170 ?auto_111169 ?auto_111168 ?auto_111167 ?auto_111166 ?auto_111165 )
      ( MAKE-2PILE ?auto_111164 ?auto_111165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111171 - BLOCK
      ?auto_111172 - BLOCK
    )
    :vars
    (
      ?auto_111175 - BLOCK
      ?auto_111173 - BLOCK
      ?auto_111176 - BLOCK
      ?auto_111177 - BLOCK
      ?auto_111174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111171 ?auto_111172 ) ) ( ON ?auto_111172 ?auto_111175 ) ( not ( = ?auto_111171 ?auto_111175 ) ) ( not ( = ?auto_111172 ?auto_111175 ) ) ( ON-TABLE ?auto_111173 ) ( ON ?auto_111176 ?auto_111173 ) ( ON ?auto_111177 ?auto_111176 ) ( ON ?auto_111174 ?auto_111177 ) ( ON ?auto_111175 ?auto_111174 ) ( not ( = ?auto_111173 ?auto_111176 ) ) ( not ( = ?auto_111173 ?auto_111177 ) ) ( not ( = ?auto_111173 ?auto_111174 ) ) ( not ( = ?auto_111173 ?auto_111175 ) ) ( not ( = ?auto_111173 ?auto_111172 ) ) ( not ( = ?auto_111173 ?auto_111171 ) ) ( not ( = ?auto_111176 ?auto_111177 ) ) ( not ( = ?auto_111176 ?auto_111174 ) ) ( not ( = ?auto_111176 ?auto_111175 ) ) ( not ( = ?auto_111176 ?auto_111172 ) ) ( not ( = ?auto_111176 ?auto_111171 ) ) ( not ( = ?auto_111177 ?auto_111174 ) ) ( not ( = ?auto_111177 ?auto_111175 ) ) ( not ( = ?auto_111177 ?auto_111172 ) ) ( not ( = ?auto_111177 ?auto_111171 ) ) ( not ( = ?auto_111174 ?auto_111175 ) ) ( not ( = ?auto_111174 ?auto_111172 ) ) ( not ( = ?auto_111174 ?auto_111171 ) ) ( HOLDING ?auto_111171 ) ( CLEAR ?auto_111172 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111173 ?auto_111176 ?auto_111177 ?auto_111174 ?auto_111175 ?auto_111172 ?auto_111171 )
      ( MAKE-2PILE ?auto_111171 ?auto_111172 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111178 - BLOCK
      ?auto_111179 - BLOCK
    )
    :vars
    (
      ?auto_111184 - BLOCK
      ?auto_111183 - BLOCK
      ?auto_111180 - BLOCK
      ?auto_111182 - BLOCK
      ?auto_111181 - BLOCK
      ?auto_111185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111178 ?auto_111179 ) ) ( ON ?auto_111179 ?auto_111184 ) ( not ( = ?auto_111178 ?auto_111184 ) ) ( not ( = ?auto_111179 ?auto_111184 ) ) ( ON-TABLE ?auto_111183 ) ( ON ?auto_111180 ?auto_111183 ) ( ON ?auto_111182 ?auto_111180 ) ( ON ?auto_111181 ?auto_111182 ) ( ON ?auto_111184 ?auto_111181 ) ( not ( = ?auto_111183 ?auto_111180 ) ) ( not ( = ?auto_111183 ?auto_111182 ) ) ( not ( = ?auto_111183 ?auto_111181 ) ) ( not ( = ?auto_111183 ?auto_111184 ) ) ( not ( = ?auto_111183 ?auto_111179 ) ) ( not ( = ?auto_111183 ?auto_111178 ) ) ( not ( = ?auto_111180 ?auto_111182 ) ) ( not ( = ?auto_111180 ?auto_111181 ) ) ( not ( = ?auto_111180 ?auto_111184 ) ) ( not ( = ?auto_111180 ?auto_111179 ) ) ( not ( = ?auto_111180 ?auto_111178 ) ) ( not ( = ?auto_111182 ?auto_111181 ) ) ( not ( = ?auto_111182 ?auto_111184 ) ) ( not ( = ?auto_111182 ?auto_111179 ) ) ( not ( = ?auto_111182 ?auto_111178 ) ) ( not ( = ?auto_111181 ?auto_111184 ) ) ( not ( = ?auto_111181 ?auto_111179 ) ) ( not ( = ?auto_111181 ?auto_111178 ) ) ( CLEAR ?auto_111179 ) ( ON ?auto_111178 ?auto_111185 ) ( CLEAR ?auto_111178 ) ( HAND-EMPTY ) ( not ( = ?auto_111178 ?auto_111185 ) ) ( not ( = ?auto_111179 ?auto_111185 ) ) ( not ( = ?auto_111184 ?auto_111185 ) ) ( not ( = ?auto_111183 ?auto_111185 ) ) ( not ( = ?auto_111180 ?auto_111185 ) ) ( not ( = ?auto_111182 ?auto_111185 ) ) ( not ( = ?auto_111181 ?auto_111185 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111178 ?auto_111185 )
      ( MAKE-2PILE ?auto_111178 ?auto_111179 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111186 - BLOCK
      ?auto_111187 - BLOCK
    )
    :vars
    (
      ?auto_111193 - BLOCK
      ?auto_111189 - BLOCK
      ?auto_111188 - BLOCK
      ?auto_111190 - BLOCK
      ?auto_111191 - BLOCK
      ?auto_111192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111186 ?auto_111187 ) ) ( not ( = ?auto_111186 ?auto_111193 ) ) ( not ( = ?auto_111187 ?auto_111193 ) ) ( ON-TABLE ?auto_111189 ) ( ON ?auto_111188 ?auto_111189 ) ( ON ?auto_111190 ?auto_111188 ) ( ON ?auto_111191 ?auto_111190 ) ( ON ?auto_111193 ?auto_111191 ) ( not ( = ?auto_111189 ?auto_111188 ) ) ( not ( = ?auto_111189 ?auto_111190 ) ) ( not ( = ?auto_111189 ?auto_111191 ) ) ( not ( = ?auto_111189 ?auto_111193 ) ) ( not ( = ?auto_111189 ?auto_111187 ) ) ( not ( = ?auto_111189 ?auto_111186 ) ) ( not ( = ?auto_111188 ?auto_111190 ) ) ( not ( = ?auto_111188 ?auto_111191 ) ) ( not ( = ?auto_111188 ?auto_111193 ) ) ( not ( = ?auto_111188 ?auto_111187 ) ) ( not ( = ?auto_111188 ?auto_111186 ) ) ( not ( = ?auto_111190 ?auto_111191 ) ) ( not ( = ?auto_111190 ?auto_111193 ) ) ( not ( = ?auto_111190 ?auto_111187 ) ) ( not ( = ?auto_111190 ?auto_111186 ) ) ( not ( = ?auto_111191 ?auto_111193 ) ) ( not ( = ?auto_111191 ?auto_111187 ) ) ( not ( = ?auto_111191 ?auto_111186 ) ) ( ON ?auto_111186 ?auto_111192 ) ( CLEAR ?auto_111186 ) ( not ( = ?auto_111186 ?auto_111192 ) ) ( not ( = ?auto_111187 ?auto_111192 ) ) ( not ( = ?auto_111193 ?auto_111192 ) ) ( not ( = ?auto_111189 ?auto_111192 ) ) ( not ( = ?auto_111188 ?auto_111192 ) ) ( not ( = ?auto_111190 ?auto_111192 ) ) ( not ( = ?auto_111191 ?auto_111192 ) ) ( HOLDING ?auto_111187 ) ( CLEAR ?auto_111193 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111189 ?auto_111188 ?auto_111190 ?auto_111191 ?auto_111193 ?auto_111187 )
      ( MAKE-2PILE ?auto_111186 ?auto_111187 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111194 - BLOCK
      ?auto_111195 - BLOCK
    )
    :vars
    (
      ?auto_111199 - BLOCK
      ?auto_111196 - BLOCK
      ?auto_111197 - BLOCK
      ?auto_111201 - BLOCK
      ?auto_111198 - BLOCK
      ?auto_111200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111194 ?auto_111195 ) ) ( not ( = ?auto_111194 ?auto_111199 ) ) ( not ( = ?auto_111195 ?auto_111199 ) ) ( ON-TABLE ?auto_111196 ) ( ON ?auto_111197 ?auto_111196 ) ( ON ?auto_111201 ?auto_111197 ) ( ON ?auto_111198 ?auto_111201 ) ( ON ?auto_111199 ?auto_111198 ) ( not ( = ?auto_111196 ?auto_111197 ) ) ( not ( = ?auto_111196 ?auto_111201 ) ) ( not ( = ?auto_111196 ?auto_111198 ) ) ( not ( = ?auto_111196 ?auto_111199 ) ) ( not ( = ?auto_111196 ?auto_111195 ) ) ( not ( = ?auto_111196 ?auto_111194 ) ) ( not ( = ?auto_111197 ?auto_111201 ) ) ( not ( = ?auto_111197 ?auto_111198 ) ) ( not ( = ?auto_111197 ?auto_111199 ) ) ( not ( = ?auto_111197 ?auto_111195 ) ) ( not ( = ?auto_111197 ?auto_111194 ) ) ( not ( = ?auto_111201 ?auto_111198 ) ) ( not ( = ?auto_111201 ?auto_111199 ) ) ( not ( = ?auto_111201 ?auto_111195 ) ) ( not ( = ?auto_111201 ?auto_111194 ) ) ( not ( = ?auto_111198 ?auto_111199 ) ) ( not ( = ?auto_111198 ?auto_111195 ) ) ( not ( = ?auto_111198 ?auto_111194 ) ) ( ON ?auto_111194 ?auto_111200 ) ( not ( = ?auto_111194 ?auto_111200 ) ) ( not ( = ?auto_111195 ?auto_111200 ) ) ( not ( = ?auto_111199 ?auto_111200 ) ) ( not ( = ?auto_111196 ?auto_111200 ) ) ( not ( = ?auto_111197 ?auto_111200 ) ) ( not ( = ?auto_111201 ?auto_111200 ) ) ( not ( = ?auto_111198 ?auto_111200 ) ) ( CLEAR ?auto_111199 ) ( ON ?auto_111195 ?auto_111194 ) ( CLEAR ?auto_111195 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111200 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111200 ?auto_111194 )
      ( MAKE-2PILE ?auto_111194 ?auto_111195 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111202 - BLOCK
      ?auto_111203 - BLOCK
    )
    :vars
    (
      ?auto_111207 - BLOCK
      ?auto_111205 - BLOCK
      ?auto_111209 - BLOCK
      ?auto_111204 - BLOCK
      ?auto_111208 - BLOCK
      ?auto_111206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111202 ?auto_111203 ) ) ( not ( = ?auto_111202 ?auto_111207 ) ) ( not ( = ?auto_111203 ?auto_111207 ) ) ( ON-TABLE ?auto_111205 ) ( ON ?auto_111209 ?auto_111205 ) ( ON ?auto_111204 ?auto_111209 ) ( ON ?auto_111208 ?auto_111204 ) ( not ( = ?auto_111205 ?auto_111209 ) ) ( not ( = ?auto_111205 ?auto_111204 ) ) ( not ( = ?auto_111205 ?auto_111208 ) ) ( not ( = ?auto_111205 ?auto_111207 ) ) ( not ( = ?auto_111205 ?auto_111203 ) ) ( not ( = ?auto_111205 ?auto_111202 ) ) ( not ( = ?auto_111209 ?auto_111204 ) ) ( not ( = ?auto_111209 ?auto_111208 ) ) ( not ( = ?auto_111209 ?auto_111207 ) ) ( not ( = ?auto_111209 ?auto_111203 ) ) ( not ( = ?auto_111209 ?auto_111202 ) ) ( not ( = ?auto_111204 ?auto_111208 ) ) ( not ( = ?auto_111204 ?auto_111207 ) ) ( not ( = ?auto_111204 ?auto_111203 ) ) ( not ( = ?auto_111204 ?auto_111202 ) ) ( not ( = ?auto_111208 ?auto_111207 ) ) ( not ( = ?auto_111208 ?auto_111203 ) ) ( not ( = ?auto_111208 ?auto_111202 ) ) ( ON ?auto_111202 ?auto_111206 ) ( not ( = ?auto_111202 ?auto_111206 ) ) ( not ( = ?auto_111203 ?auto_111206 ) ) ( not ( = ?auto_111207 ?auto_111206 ) ) ( not ( = ?auto_111205 ?auto_111206 ) ) ( not ( = ?auto_111209 ?auto_111206 ) ) ( not ( = ?auto_111204 ?auto_111206 ) ) ( not ( = ?auto_111208 ?auto_111206 ) ) ( ON ?auto_111203 ?auto_111202 ) ( CLEAR ?auto_111203 ) ( ON-TABLE ?auto_111206 ) ( HOLDING ?auto_111207 ) ( CLEAR ?auto_111208 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111205 ?auto_111209 ?auto_111204 ?auto_111208 ?auto_111207 )
      ( MAKE-2PILE ?auto_111202 ?auto_111203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111210 - BLOCK
      ?auto_111211 - BLOCK
    )
    :vars
    (
      ?auto_111217 - BLOCK
      ?auto_111213 - BLOCK
      ?auto_111212 - BLOCK
      ?auto_111215 - BLOCK
      ?auto_111216 - BLOCK
      ?auto_111214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111210 ?auto_111211 ) ) ( not ( = ?auto_111210 ?auto_111217 ) ) ( not ( = ?auto_111211 ?auto_111217 ) ) ( ON-TABLE ?auto_111213 ) ( ON ?auto_111212 ?auto_111213 ) ( ON ?auto_111215 ?auto_111212 ) ( ON ?auto_111216 ?auto_111215 ) ( not ( = ?auto_111213 ?auto_111212 ) ) ( not ( = ?auto_111213 ?auto_111215 ) ) ( not ( = ?auto_111213 ?auto_111216 ) ) ( not ( = ?auto_111213 ?auto_111217 ) ) ( not ( = ?auto_111213 ?auto_111211 ) ) ( not ( = ?auto_111213 ?auto_111210 ) ) ( not ( = ?auto_111212 ?auto_111215 ) ) ( not ( = ?auto_111212 ?auto_111216 ) ) ( not ( = ?auto_111212 ?auto_111217 ) ) ( not ( = ?auto_111212 ?auto_111211 ) ) ( not ( = ?auto_111212 ?auto_111210 ) ) ( not ( = ?auto_111215 ?auto_111216 ) ) ( not ( = ?auto_111215 ?auto_111217 ) ) ( not ( = ?auto_111215 ?auto_111211 ) ) ( not ( = ?auto_111215 ?auto_111210 ) ) ( not ( = ?auto_111216 ?auto_111217 ) ) ( not ( = ?auto_111216 ?auto_111211 ) ) ( not ( = ?auto_111216 ?auto_111210 ) ) ( ON ?auto_111210 ?auto_111214 ) ( not ( = ?auto_111210 ?auto_111214 ) ) ( not ( = ?auto_111211 ?auto_111214 ) ) ( not ( = ?auto_111217 ?auto_111214 ) ) ( not ( = ?auto_111213 ?auto_111214 ) ) ( not ( = ?auto_111212 ?auto_111214 ) ) ( not ( = ?auto_111215 ?auto_111214 ) ) ( not ( = ?auto_111216 ?auto_111214 ) ) ( ON ?auto_111211 ?auto_111210 ) ( ON-TABLE ?auto_111214 ) ( CLEAR ?auto_111216 ) ( ON ?auto_111217 ?auto_111211 ) ( CLEAR ?auto_111217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111214 ?auto_111210 ?auto_111211 )
      ( MAKE-2PILE ?auto_111210 ?auto_111211 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111218 - BLOCK
      ?auto_111219 - BLOCK
    )
    :vars
    (
      ?auto_111220 - BLOCK
      ?auto_111222 - BLOCK
      ?auto_111224 - BLOCK
      ?auto_111225 - BLOCK
      ?auto_111223 - BLOCK
      ?auto_111221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111218 ?auto_111219 ) ) ( not ( = ?auto_111218 ?auto_111220 ) ) ( not ( = ?auto_111219 ?auto_111220 ) ) ( ON-TABLE ?auto_111222 ) ( ON ?auto_111224 ?auto_111222 ) ( ON ?auto_111225 ?auto_111224 ) ( not ( = ?auto_111222 ?auto_111224 ) ) ( not ( = ?auto_111222 ?auto_111225 ) ) ( not ( = ?auto_111222 ?auto_111223 ) ) ( not ( = ?auto_111222 ?auto_111220 ) ) ( not ( = ?auto_111222 ?auto_111219 ) ) ( not ( = ?auto_111222 ?auto_111218 ) ) ( not ( = ?auto_111224 ?auto_111225 ) ) ( not ( = ?auto_111224 ?auto_111223 ) ) ( not ( = ?auto_111224 ?auto_111220 ) ) ( not ( = ?auto_111224 ?auto_111219 ) ) ( not ( = ?auto_111224 ?auto_111218 ) ) ( not ( = ?auto_111225 ?auto_111223 ) ) ( not ( = ?auto_111225 ?auto_111220 ) ) ( not ( = ?auto_111225 ?auto_111219 ) ) ( not ( = ?auto_111225 ?auto_111218 ) ) ( not ( = ?auto_111223 ?auto_111220 ) ) ( not ( = ?auto_111223 ?auto_111219 ) ) ( not ( = ?auto_111223 ?auto_111218 ) ) ( ON ?auto_111218 ?auto_111221 ) ( not ( = ?auto_111218 ?auto_111221 ) ) ( not ( = ?auto_111219 ?auto_111221 ) ) ( not ( = ?auto_111220 ?auto_111221 ) ) ( not ( = ?auto_111222 ?auto_111221 ) ) ( not ( = ?auto_111224 ?auto_111221 ) ) ( not ( = ?auto_111225 ?auto_111221 ) ) ( not ( = ?auto_111223 ?auto_111221 ) ) ( ON ?auto_111219 ?auto_111218 ) ( ON-TABLE ?auto_111221 ) ( ON ?auto_111220 ?auto_111219 ) ( CLEAR ?auto_111220 ) ( HOLDING ?auto_111223 ) ( CLEAR ?auto_111225 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111222 ?auto_111224 ?auto_111225 ?auto_111223 )
      ( MAKE-2PILE ?auto_111218 ?auto_111219 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111226 - BLOCK
      ?auto_111227 - BLOCK
    )
    :vars
    (
      ?auto_111228 - BLOCK
      ?auto_111233 - BLOCK
      ?auto_111232 - BLOCK
      ?auto_111230 - BLOCK
      ?auto_111229 - BLOCK
      ?auto_111231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111226 ?auto_111227 ) ) ( not ( = ?auto_111226 ?auto_111228 ) ) ( not ( = ?auto_111227 ?auto_111228 ) ) ( ON-TABLE ?auto_111233 ) ( ON ?auto_111232 ?auto_111233 ) ( ON ?auto_111230 ?auto_111232 ) ( not ( = ?auto_111233 ?auto_111232 ) ) ( not ( = ?auto_111233 ?auto_111230 ) ) ( not ( = ?auto_111233 ?auto_111229 ) ) ( not ( = ?auto_111233 ?auto_111228 ) ) ( not ( = ?auto_111233 ?auto_111227 ) ) ( not ( = ?auto_111233 ?auto_111226 ) ) ( not ( = ?auto_111232 ?auto_111230 ) ) ( not ( = ?auto_111232 ?auto_111229 ) ) ( not ( = ?auto_111232 ?auto_111228 ) ) ( not ( = ?auto_111232 ?auto_111227 ) ) ( not ( = ?auto_111232 ?auto_111226 ) ) ( not ( = ?auto_111230 ?auto_111229 ) ) ( not ( = ?auto_111230 ?auto_111228 ) ) ( not ( = ?auto_111230 ?auto_111227 ) ) ( not ( = ?auto_111230 ?auto_111226 ) ) ( not ( = ?auto_111229 ?auto_111228 ) ) ( not ( = ?auto_111229 ?auto_111227 ) ) ( not ( = ?auto_111229 ?auto_111226 ) ) ( ON ?auto_111226 ?auto_111231 ) ( not ( = ?auto_111226 ?auto_111231 ) ) ( not ( = ?auto_111227 ?auto_111231 ) ) ( not ( = ?auto_111228 ?auto_111231 ) ) ( not ( = ?auto_111233 ?auto_111231 ) ) ( not ( = ?auto_111232 ?auto_111231 ) ) ( not ( = ?auto_111230 ?auto_111231 ) ) ( not ( = ?auto_111229 ?auto_111231 ) ) ( ON ?auto_111227 ?auto_111226 ) ( ON-TABLE ?auto_111231 ) ( ON ?auto_111228 ?auto_111227 ) ( CLEAR ?auto_111230 ) ( ON ?auto_111229 ?auto_111228 ) ( CLEAR ?auto_111229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111231 ?auto_111226 ?auto_111227 ?auto_111228 )
      ( MAKE-2PILE ?auto_111226 ?auto_111227 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111234 - BLOCK
      ?auto_111235 - BLOCK
    )
    :vars
    (
      ?auto_111236 - BLOCK
      ?auto_111239 - BLOCK
      ?auto_111240 - BLOCK
      ?auto_111238 - BLOCK
      ?auto_111237 - BLOCK
      ?auto_111241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111234 ?auto_111235 ) ) ( not ( = ?auto_111234 ?auto_111236 ) ) ( not ( = ?auto_111235 ?auto_111236 ) ) ( ON-TABLE ?auto_111239 ) ( ON ?auto_111240 ?auto_111239 ) ( not ( = ?auto_111239 ?auto_111240 ) ) ( not ( = ?auto_111239 ?auto_111238 ) ) ( not ( = ?auto_111239 ?auto_111237 ) ) ( not ( = ?auto_111239 ?auto_111236 ) ) ( not ( = ?auto_111239 ?auto_111235 ) ) ( not ( = ?auto_111239 ?auto_111234 ) ) ( not ( = ?auto_111240 ?auto_111238 ) ) ( not ( = ?auto_111240 ?auto_111237 ) ) ( not ( = ?auto_111240 ?auto_111236 ) ) ( not ( = ?auto_111240 ?auto_111235 ) ) ( not ( = ?auto_111240 ?auto_111234 ) ) ( not ( = ?auto_111238 ?auto_111237 ) ) ( not ( = ?auto_111238 ?auto_111236 ) ) ( not ( = ?auto_111238 ?auto_111235 ) ) ( not ( = ?auto_111238 ?auto_111234 ) ) ( not ( = ?auto_111237 ?auto_111236 ) ) ( not ( = ?auto_111237 ?auto_111235 ) ) ( not ( = ?auto_111237 ?auto_111234 ) ) ( ON ?auto_111234 ?auto_111241 ) ( not ( = ?auto_111234 ?auto_111241 ) ) ( not ( = ?auto_111235 ?auto_111241 ) ) ( not ( = ?auto_111236 ?auto_111241 ) ) ( not ( = ?auto_111239 ?auto_111241 ) ) ( not ( = ?auto_111240 ?auto_111241 ) ) ( not ( = ?auto_111238 ?auto_111241 ) ) ( not ( = ?auto_111237 ?auto_111241 ) ) ( ON ?auto_111235 ?auto_111234 ) ( ON-TABLE ?auto_111241 ) ( ON ?auto_111236 ?auto_111235 ) ( ON ?auto_111237 ?auto_111236 ) ( CLEAR ?auto_111237 ) ( HOLDING ?auto_111238 ) ( CLEAR ?auto_111240 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111239 ?auto_111240 ?auto_111238 )
      ( MAKE-2PILE ?auto_111234 ?auto_111235 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111242 - BLOCK
      ?auto_111243 - BLOCK
    )
    :vars
    (
      ?auto_111244 - BLOCK
      ?auto_111249 - BLOCK
      ?auto_111247 - BLOCK
      ?auto_111248 - BLOCK
      ?auto_111245 - BLOCK
      ?auto_111246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111242 ?auto_111243 ) ) ( not ( = ?auto_111242 ?auto_111244 ) ) ( not ( = ?auto_111243 ?auto_111244 ) ) ( ON-TABLE ?auto_111249 ) ( ON ?auto_111247 ?auto_111249 ) ( not ( = ?auto_111249 ?auto_111247 ) ) ( not ( = ?auto_111249 ?auto_111248 ) ) ( not ( = ?auto_111249 ?auto_111245 ) ) ( not ( = ?auto_111249 ?auto_111244 ) ) ( not ( = ?auto_111249 ?auto_111243 ) ) ( not ( = ?auto_111249 ?auto_111242 ) ) ( not ( = ?auto_111247 ?auto_111248 ) ) ( not ( = ?auto_111247 ?auto_111245 ) ) ( not ( = ?auto_111247 ?auto_111244 ) ) ( not ( = ?auto_111247 ?auto_111243 ) ) ( not ( = ?auto_111247 ?auto_111242 ) ) ( not ( = ?auto_111248 ?auto_111245 ) ) ( not ( = ?auto_111248 ?auto_111244 ) ) ( not ( = ?auto_111248 ?auto_111243 ) ) ( not ( = ?auto_111248 ?auto_111242 ) ) ( not ( = ?auto_111245 ?auto_111244 ) ) ( not ( = ?auto_111245 ?auto_111243 ) ) ( not ( = ?auto_111245 ?auto_111242 ) ) ( ON ?auto_111242 ?auto_111246 ) ( not ( = ?auto_111242 ?auto_111246 ) ) ( not ( = ?auto_111243 ?auto_111246 ) ) ( not ( = ?auto_111244 ?auto_111246 ) ) ( not ( = ?auto_111249 ?auto_111246 ) ) ( not ( = ?auto_111247 ?auto_111246 ) ) ( not ( = ?auto_111248 ?auto_111246 ) ) ( not ( = ?auto_111245 ?auto_111246 ) ) ( ON ?auto_111243 ?auto_111242 ) ( ON-TABLE ?auto_111246 ) ( ON ?auto_111244 ?auto_111243 ) ( ON ?auto_111245 ?auto_111244 ) ( CLEAR ?auto_111247 ) ( ON ?auto_111248 ?auto_111245 ) ( CLEAR ?auto_111248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111246 ?auto_111242 ?auto_111243 ?auto_111244 ?auto_111245 )
      ( MAKE-2PILE ?auto_111242 ?auto_111243 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111250 - BLOCK
      ?auto_111251 - BLOCK
    )
    :vars
    (
      ?auto_111255 - BLOCK
      ?auto_111252 - BLOCK
      ?auto_111257 - BLOCK
      ?auto_111253 - BLOCK
      ?auto_111256 - BLOCK
      ?auto_111254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111250 ?auto_111251 ) ) ( not ( = ?auto_111250 ?auto_111255 ) ) ( not ( = ?auto_111251 ?auto_111255 ) ) ( ON-TABLE ?auto_111252 ) ( not ( = ?auto_111252 ?auto_111257 ) ) ( not ( = ?auto_111252 ?auto_111253 ) ) ( not ( = ?auto_111252 ?auto_111256 ) ) ( not ( = ?auto_111252 ?auto_111255 ) ) ( not ( = ?auto_111252 ?auto_111251 ) ) ( not ( = ?auto_111252 ?auto_111250 ) ) ( not ( = ?auto_111257 ?auto_111253 ) ) ( not ( = ?auto_111257 ?auto_111256 ) ) ( not ( = ?auto_111257 ?auto_111255 ) ) ( not ( = ?auto_111257 ?auto_111251 ) ) ( not ( = ?auto_111257 ?auto_111250 ) ) ( not ( = ?auto_111253 ?auto_111256 ) ) ( not ( = ?auto_111253 ?auto_111255 ) ) ( not ( = ?auto_111253 ?auto_111251 ) ) ( not ( = ?auto_111253 ?auto_111250 ) ) ( not ( = ?auto_111256 ?auto_111255 ) ) ( not ( = ?auto_111256 ?auto_111251 ) ) ( not ( = ?auto_111256 ?auto_111250 ) ) ( ON ?auto_111250 ?auto_111254 ) ( not ( = ?auto_111250 ?auto_111254 ) ) ( not ( = ?auto_111251 ?auto_111254 ) ) ( not ( = ?auto_111255 ?auto_111254 ) ) ( not ( = ?auto_111252 ?auto_111254 ) ) ( not ( = ?auto_111257 ?auto_111254 ) ) ( not ( = ?auto_111253 ?auto_111254 ) ) ( not ( = ?auto_111256 ?auto_111254 ) ) ( ON ?auto_111251 ?auto_111250 ) ( ON-TABLE ?auto_111254 ) ( ON ?auto_111255 ?auto_111251 ) ( ON ?auto_111256 ?auto_111255 ) ( ON ?auto_111253 ?auto_111256 ) ( CLEAR ?auto_111253 ) ( HOLDING ?auto_111257 ) ( CLEAR ?auto_111252 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111252 ?auto_111257 )
      ( MAKE-2PILE ?auto_111250 ?auto_111251 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111258 - BLOCK
      ?auto_111259 - BLOCK
    )
    :vars
    (
      ?auto_111264 - BLOCK
      ?auto_111262 - BLOCK
      ?auto_111260 - BLOCK
      ?auto_111263 - BLOCK
      ?auto_111261 - BLOCK
      ?auto_111265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111258 ?auto_111259 ) ) ( not ( = ?auto_111258 ?auto_111264 ) ) ( not ( = ?auto_111259 ?auto_111264 ) ) ( ON-TABLE ?auto_111262 ) ( not ( = ?auto_111262 ?auto_111260 ) ) ( not ( = ?auto_111262 ?auto_111263 ) ) ( not ( = ?auto_111262 ?auto_111261 ) ) ( not ( = ?auto_111262 ?auto_111264 ) ) ( not ( = ?auto_111262 ?auto_111259 ) ) ( not ( = ?auto_111262 ?auto_111258 ) ) ( not ( = ?auto_111260 ?auto_111263 ) ) ( not ( = ?auto_111260 ?auto_111261 ) ) ( not ( = ?auto_111260 ?auto_111264 ) ) ( not ( = ?auto_111260 ?auto_111259 ) ) ( not ( = ?auto_111260 ?auto_111258 ) ) ( not ( = ?auto_111263 ?auto_111261 ) ) ( not ( = ?auto_111263 ?auto_111264 ) ) ( not ( = ?auto_111263 ?auto_111259 ) ) ( not ( = ?auto_111263 ?auto_111258 ) ) ( not ( = ?auto_111261 ?auto_111264 ) ) ( not ( = ?auto_111261 ?auto_111259 ) ) ( not ( = ?auto_111261 ?auto_111258 ) ) ( ON ?auto_111258 ?auto_111265 ) ( not ( = ?auto_111258 ?auto_111265 ) ) ( not ( = ?auto_111259 ?auto_111265 ) ) ( not ( = ?auto_111264 ?auto_111265 ) ) ( not ( = ?auto_111262 ?auto_111265 ) ) ( not ( = ?auto_111260 ?auto_111265 ) ) ( not ( = ?auto_111263 ?auto_111265 ) ) ( not ( = ?auto_111261 ?auto_111265 ) ) ( ON ?auto_111259 ?auto_111258 ) ( ON-TABLE ?auto_111265 ) ( ON ?auto_111264 ?auto_111259 ) ( ON ?auto_111261 ?auto_111264 ) ( ON ?auto_111263 ?auto_111261 ) ( CLEAR ?auto_111262 ) ( ON ?auto_111260 ?auto_111263 ) ( CLEAR ?auto_111260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111265 ?auto_111258 ?auto_111259 ?auto_111264 ?auto_111261 ?auto_111263 )
      ( MAKE-2PILE ?auto_111258 ?auto_111259 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111266 - BLOCK
      ?auto_111267 - BLOCK
    )
    :vars
    (
      ?auto_111271 - BLOCK
      ?auto_111273 - BLOCK
      ?auto_111269 - BLOCK
      ?auto_111268 - BLOCK
      ?auto_111270 - BLOCK
      ?auto_111272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111266 ?auto_111267 ) ) ( not ( = ?auto_111266 ?auto_111271 ) ) ( not ( = ?auto_111267 ?auto_111271 ) ) ( not ( = ?auto_111273 ?auto_111269 ) ) ( not ( = ?auto_111273 ?auto_111268 ) ) ( not ( = ?auto_111273 ?auto_111270 ) ) ( not ( = ?auto_111273 ?auto_111271 ) ) ( not ( = ?auto_111273 ?auto_111267 ) ) ( not ( = ?auto_111273 ?auto_111266 ) ) ( not ( = ?auto_111269 ?auto_111268 ) ) ( not ( = ?auto_111269 ?auto_111270 ) ) ( not ( = ?auto_111269 ?auto_111271 ) ) ( not ( = ?auto_111269 ?auto_111267 ) ) ( not ( = ?auto_111269 ?auto_111266 ) ) ( not ( = ?auto_111268 ?auto_111270 ) ) ( not ( = ?auto_111268 ?auto_111271 ) ) ( not ( = ?auto_111268 ?auto_111267 ) ) ( not ( = ?auto_111268 ?auto_111266 ) ) ( not ( = ?auto_111270 ?auto_111271 ) ) ( not ( = ?auto_111270 ?auto_111267 ) ) ( not ( = ?auto_111270 ?auto_111266 ) ) ( ON ?auto_111266 ?auto_111272 ) ( not ( = ?auto_111266 ?auto_111272 ) ) ( not ( = ?auto_111267 ?auto_111272 ) ) ( not ( = ?auto_111271 ?auto_111272 ) ) ( not ( = ?auto_111273 ?auto_111272 ) ) ( not ( = ?auto_111269 ?auto_111272 ) ) ( not ( = ?auto_111268 ?auto_111272 ) ) ( not ( = ?auto_111270 ?auto_111272 ) ) ( ON ?auto_111267 ?auto_111266 ) ( ON-TABLE ?auto_111272 ) ( ON ?auto_111271 ?auto_111267 ) ( ON ?auto_111270 ?auto_111271 ) ( ON ?auto_111268 ?auto_111270 ) ( ON ?auto_111269 ?auto_111268 ) ( CLEAR ?auto_111269 ) ( HOLDING ?auto_111273 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111273 )
      ( MAKE-2PILE ?auto_111266 ?auto_111267 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111274 - BLOCK
      ?auto_111275 - BLOCK
    )
    :vars
    (
      ?auto_111281 - BLOCK
      ?auto_111279 - BLOCK
      ?auto_111280 - BLOCK
      ?auto_111277 - BLOCK
      ?auto_111276 - BLOCK
      ?auto_111278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111274 ?auto_111275 ) ) ( not ( = ?auto_111274 ?auto_111281 ) ) ( not ( = ?auto_111275 ?auto_111281 ) ) ( not ( = ?auto_111279 ?auto_111280 ) ) ( not ( = ?auto_111279 ?auto_111277 ) ) ( not ( = ?auto_111279 ?auto_111276 ) ) ( not ( = ?auto_111279 ?auto_111281 ) ) ( not ( = ?auto_111279 ?auto_111275 ) ) ( not ( = ?auto_111279 ?auto_111274 ) ) ( not ( = ?auto_111280 ?auto_111277 ) ) ( not ( = ?auto_111280 ?auto_111276 ) ) ( not ( = ?auto_111280 ?auto_111281 ) ) ( not ( = ?auto_111280 ?auto_111275 ) ) ( not ( = ?auto_111280 ?auto_111274 ) ) ( not ( = ?auto_111277 ?auto_111276 ) ) ( not ( = ?auto_111277 ?auto_111281 ) ) ( not ( = ?auto_111277 ?auto_111275 ) ) ( not ( = ?auto_111277 ?auto_111274 ) ) ( not ( = ?auto_111276 ?auto_111281 ) ) ( not ( = ?auto_111276 ?auto_111275 ) ) ( not ( = ?auto_111276 ?auto_111274 ) ) ( ON ?auto_111274 ?auto_111278 ) ( not ( = ?auto_111274 ?auto_111278 ) ) ( not ( = ?auto_111275 ?auto_111278 ) ) ( not ( = ?auto_111281 ?auto_111278 ) ) ( not ( = ?auto_111279 ?auto_111278 ) ) ( not ( = ?auto_111280 ?auto_111278 ) ) ( not ( = ?auto_111277 ?auto_111278 ) ) ( not ( = ?auto_111276 ?auto_111278 ) ) ( ON ?auto_111275 ?auto_111274 ) ( ON-TABLE ?auto_111278 ) ( ON ?auto_111281 ?auto_111275 ) ( ON ?auto_111276 ?auto_111281 ) ( ON ?auto_111277 ?auto_111276 ) ( ON ?auto_111280 ?auto_111277 ) ( ON ?auto_111279 ?auto_111280 ) ( CLEAR ?auto_111279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111278 ?auto_111274 ?auto_111275 ?auto_111281 ?auto_111276 ?auto_111277 ?auto_111280 )
      ( MAKE-2PILE ?auto_111274 ?auto_111275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111286 - BLOCK
      ?auto_111287 - BLOCK
      ?auto_111288 - BLOCK
      ?auto_111289 - BLOCK
    )
    :vars
    (
      ?auto_111290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111290 ?auto_111289 ) ( CLEAR ?auto_111290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111286 ) ( ON ?auto_111287 ?auto_111286 ) ( ON ?auto_111288 ?auto_111287 ) ( ON ?auto_111289 ?auto_111288 ) ( not ( = ?auto_111286 ?auto_111287 ) ) ( not ( = ?auto_111286 ?auto_111288 ) ) ( not ( = ?auto_111286 ?auto_111289 ) ) ( not ( = ?auto_111286 ?auto_111290 ) ) ( not ( = ?auto_111287 ?auto_111288 ) ) ( not ( = ?auto_111287 ?auto_111289 ) ) ( not ( = ?auto_111287 ?auto_111290 ) ) ( not ( = ?auto_111288 ?auto_111289 ) ) ( not ( = ?auto_111288 ?auto_111290 ) ) ( not ( = ?auto_111289 ?auto_111290 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111290 ?auto_111289 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111291 - BLOCK
      ?auto_111292 - BLOCK
      ?auto_111293 - BLOCK
      ?auto_111294 - BLOCK
    )
    :vars
    (
      ?auto_111295 - BLOCK
      ?auto_111296 - BLOCK
      ?auto_111297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111295 ?auto_111294 ) ( CLEAR ?auto_111295 ) ( ON-TABLE ?auto_111291 ) ( ON ?auto_111292 ?auto_111291 ) ( ON ?auto_111293 ?auto_111292 ) ( ON ?auto_111294 ?auto_111293 ) ( not ( = ?auto_111291 ?auto_111292 ) ) ( not ( = ?auto_111291 ?auto_111293 ) ) ( not ( = ?auto_111291 ?auto_111294 ) ) ( not ( = ?auto_111291 ?auto_111295 ) ) ( not ( = ?auto_111292 ?auto_111293 ) ) ( not ( = ?auto_111292 ?auto_111294 ) ) ( not ( = ?auto_111292 ?auto_111295 ) ) ( not ( = ?auto_111293 ?auto_111294 ) ) ( not ( = ?auto_111293 ?auto_111295 ) ) ( not ( = ?auto_111294 ?auto_111295 ) ) ( HOLDING ?auto_111296 ) ( CLEAR ?auto_111297 ) ( not ( = ?auto_111291 ?auto_111296 ) ) ( not ( = ?auto_111291 ?auto_111297 ) ) ( not ( = ?auto_111292 ?auto_111296 ) ) ( not ( = ?auto_111292 ?auto_111297 ) ) ( not ( = ?auto_111293 ?auto_111296 ) ) ( not ( = ?auto_111293 ?auto_111297 ) ) ( not ( = ?auto_111294 ?auto_111296 ) ) ( not ( = ?auto_111294 ?auto_111297 ) ) ( not ( = ?auto_111295 ?auto_111296 ) ) ( not ( = ?auto_111295 ?auto_111297 ) ) ( not ( = ?auto_111296 ?auto_111297 ) ) )
    :subtasks
    ( ( !STACK ?auto_111296 ?auto_111297 )
      ( MAKE-4PILE ?auto_111291 ?auto_111292 ?auto_111293 ?auto_111294 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111298 - BLOCK
      ?auto_111299 - BLOCK
      ?auto_111300 - BLOCK
      ?auto_111301 - BLOCK
    )
    :vars
    (
      ?auto_111304 - BLOCK
      ?auto_111303 - BLOCK
      ?auto_111302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111304 ?auto_111301 ) ( ON-TABLE ?auto_111298 ) ( ON ?auto_111299 ?auto_111298 ) ( ON ?auto_111300 ?auto_111299 ) ( ON ?auto_111301 ?auto_111300 ) ( not ( = ?auto_111298 ?auto_111299 ) ) ( not ( = ?auto_111298 ?auto_111300 ) ) ( not ( = ?auto_111298 ?auto_111301 ) ) ( not ( = ?auto_111298 ?auto_111304 ) ) ( not ( = ?auto_111299 ?auto_111300 ) ) ( not ( = ?auto_111299 ?auto_111301 ) ) ( not ( = ?auto_111299 ?auto_111304 ) ) ( not ( = ?auto_111300 ?auto_111301 ) ) ( not ( = ?auto_111300 ?auto_111304 ) ) ( not ( = ?auto_111301 ?auto_111304 ) ) ( CLEAR ?auto_111303 ) ( not ( = ?auto_111298 ?auto_111302 ) ) ( not ( = ?auto_111298 ?auto_111303 ) ) ( not ( = ?auto_111299 ?auto_111302 ) ) ( not ( = ?auto_111299 ?auto_111303 ) ) ( not ( = ?auto_111300 ?auto_111302 ) ) ( not ( = ?auto_111300 ?auto_111303 ) ) ( not ( = ?auto_111301 ?auto_111302 ) ) ( not ( = ?auto_111301 ?auto_111303 ) ) ( not ( = ?auto_111304 ?auto_111302 ) ) ( not ( = ?auto_111304 ?auto_111303 ) ) ( not ( = ?auto_111302 ?auto_111303 ) ) ( ON ?auto_111302 ?auto_111304 ) ( CLEAR ?auto_111302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111298 ?auto_111299 ?auto_111300 ?auto_111301 ?auto_111304 )
      ( MAKE-4PILE ?auto_111298 ?auto_111299 ?auto_111300 ?auto_111301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111305 - BLOCK
      ?auto_111306 - BLOCK
      ?auto_111307 - BLOCK
      ?auto_111308 - BLOCK
    )
    :vars
    (
      ?auto_111309 - BLOCK
      ?auto_111311 - BLOCK
      ?auto_111310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111309 ?auto_111308 ) ( ON-TABLE ?auto_111305 ) ( ON ?auto_111306 ?auto_111305 ) ( ON ?auto_111307 ?auto_111306 ) ( ON ?auto_111308 ?auto_111307 ) ( not ( = ?auto_111305 ?auto_111306 ) ) ( not ( = ?auto_111305 ?auto_111307 ) ) ( not ( = ?auto_111305 ?auto_111308 ) ) ( not ( = ?auto_111305 ?auto_111309 ) ) ( not ( = ?auto_111306 ?auto_111307 ) ) ( not ( = ?auto_111306 ?auto_111308 ) ) ( not ( = ?auto_111306 ?auto_111309 ) ) ( not ( = ?auto_111307 ?auto_111308 ) ) ( not ( = ?auto_111307 ?auto_111309 ) ) ( not ( = ?auto_111308 ?auto_111309 ) ) ( not ( = ?auto_111305 ?auto_111311 ) ) ( not ( = ?auto_111305 ?auto_111310 ) ) ( not ( = ?auto_111306 ?auto_111311 ) ) ( not ( = ?auto_111306 ?auto_111310 ) ) ( not ( = ?auto_111307 ?auto_111311 ) ) ( not ( = ?auto_111307 ?auto_111310 ) ) ( not ( = ?auto_111308 ?auto_111311 ) ) ( not ( = ?auto_111308 ?auto_111310 ) ) ( not ( = ?auto_111309 ?auto_111311 ) ) ( not ( = ?auto_111309 ?auto_111310 ) ) ( not ( = ?auto_111311 ?auto_111310 ) ) ( ON ?auto_111311 ?auto_111309 ) ( CLEAR ?auto_111311 ) ( HOLDING ?auto_111310 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111310 )
      ( MAKE-4PILE ?auto_111305 ?auto_111306 ?auto_111307 ?auto_111308 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111312 - BLOCK
      ?auto_111313 - BLOCK
      ?auto_111314 - BLOCK
      ?auto_111315 - BLOCK
    )
    :vars
    (
      ?auto_111317 - BLOCK
      ?auto_111316 - BLOCK
      ?auto_111318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111317 ?auto_111315 ) ( ON-TABLE ?auto_111312 ) ( ON ?auto_111313 ?auto_111312 ) ( ON ?auto_111314 ?auto_111313 ) ( ON ?auto_111315 ?auto_111314 ) ( not ( = ?auto_111312 ?auto_111313 ) ) ( not ( = ?auto_111312 ?auto_111314 ) ) ( not ( = ?auto_111312 ?auto_111315 ) ) ( not ( = ?auto_111312 ?auto_111317 ) ) ( not ( = ?auto_111313 ?auto_111314 ) ) ( not ( = ?auto_111313 ?auto_111315 ) ) ( not ( = ?auto_111313 ?auto_111317 ) ) ( not ( = ?auto_111314 ?auto_111315 ) ) ( not ( = ?auto_111314 ?auto_111317 ) ) ( not ( = ?auto_111315 ?auto_111317 ) ) ( not ( = ?auto_111312 ?auto_111316 ) ) ( not ( = ?auto_111312 ?auto_111318 ) ) ( not ( = ?auto_111313 ?auto_111316 ) ) ( not ( = ?auto_111313 ?auto_111318 ) ) ( not ( = ?auto_111314 ?auto_111316 ) ) ( not ( = ?auto_111314 ?auto_111318 ) ) ( not ( = ?auto_111315 ?auto_111316 ) ) ( not ( = ?auto_111315 ?auto_111318 ) ) ( not ( = ?auto_111317 ?auto_111316 ) ) ( not ( = ?auto_111317 ?auto_111318 ) ) ( not ( = ?auto_111316 ?auto_111318 ) ) ( ON ?auto_111316 ?auto_111317 ) ( ON ?auto_111318 ?auto_111316 ) ( CLEAR ?auto_111318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111312 ?auto_111313 ?auto_111314 ?auto_111315 ?auto_111317 ?auto_111316 )
      ( MAKE-4PILE ?auto_111312 ?auto_111313 ?auto_111314 ?auto_111315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111319 - BLOCK
      ?auto_111320 - BLOCK
      ?auto_111321 - BLOCK
      ?auto_111322 - BLOCK
    )
    :vars
    (
      ?auto_111324 - BLOCK
      ?auto_111325 - BLOCK
      ?auto_111323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111324 ?auto_111322 ) ( ON-TABLE ?auto_111319 ) ( ON ?auto_111320 ?auto_111319 ) ( ON ?auto_111321 ?auto_111320 ) ( ON ?auto_111322 ?auto_111321 ) ( not ( = ?auto_111319 ?auto_111320 ) ) ( not ( = ?auto_111319 ?auto_111321 ) ) ( not ( = ?auto_111319 ?auto_111322 ) ) ( not ( = ?auto_111319 ?auto_111324 ) ) ( not ( = ?auto_111320 ?auto_111321 ) ) ( not ( = ?auto_111320 ?auto_111322 ) ) ( not ( = ?auto_111320 ?auto_111324 ) ) ( not ( = ?auto_111321 ?auto_111322 ) ) ( not ( = ?auto_111321 ?auto_111324 ) ) ( not ( = ?auto_111322 ?auto_111324 ) ) ( not ( = ?auto_111319 ?auto_111325 ) ) ( not ( = ?auto_111319 ?auto_111323 ) ) ( not ( = ?auto_111320 ?auto_111325 ) ) ( not ( = ?auto_111320 ?auto_111323 ) ) ( not ( = ?auto_111321 ?auto_111325 ) ) ( not ( = ?auto_111321 ?auto_111323 ) ) ( not ( = ?auto_111322 ?auto_111325 ) ) ( not ( = ?auto_111322 ?auto_111323 ) ) ( not ( = ?auto_111324 ?auto_111325 ) ) ( not ( = ?auto_111324 ?auto_111323 ) ) ( not ( = ?auto_111325 ?auto_111323 ) ) ( ON ?auto_111325 ?auto_111324 ) ( HOLDING ?auto_111323 ) ( CLEAR ?auto_111325 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111319 ?auto_111320 ?auto_111321 ?auto_111322 ?auto_111324 ?auto_111325 ?auto_111323 )
      ( MAKE-4PILE ?auto_111319 ?auto_111320 ?auto_111321 ?auto_111322 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111326 - BLOCK
      ?auto_111327 - BLOCK
      ?auto_111328 - BLOCK
      ?auto_111329 - BLOCK
    )
    :vars
    (
      ?auto_111331 - BLOCK
      ?auto_111330 - BLOCK
      ?auto_111332 - BLOCK
      ?auto_111333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111331 ?auto_111329 ) ( ON-TABLE ?auto_111326 ) ( ON ?auto_111327 ?auto_111326 ) ( ON ?auto_111328 ?auto_111327 ) ( ON ?auto_111329 ?auto_111328 ) ( not ( = ?auto_111326 ?auto_111327 ) ) ( not ( = ?auto_111326 ?auto_111328 ) ) ( not ( = ?auto_111326 ?auto_111329 ) ) ( not ( = ?auto_111326 ?auto_111331 ) ) ( not ( = ?auto_111327 ?auto_111328 ) ) ( not ( = ?auto_111327 ?auto_111329 ) ) ( not ( = ?auto_111327 ?auto_111331 ) ) ( not ( = ?auto_111328 ?auto_111329 ) ) ( not ( = ?auto_111328 ?auto_111331 ) ) ( not ( = ?auto_111329 ?auto_111331 ) ) ( not ( = ?auto_111326 ?auto_111330 ) ) ( not ( = ?auto_111326 ?auto_111332 ) ) ( not ( = ?auto_111327 ?auto_111330 ) ) ( not ( = ?auto_111327 ?auto_111332 ) ) ( not ( = ?auto_111328 ?auto_111330 ) ) ( not ( = ?auto_111328 ?auto_111332 ) ) ( not ( = ?auto_111329 ?auto_111330 ) ) ( not ( = ?auto_111329 ?auto_111332 ) ) ( not ( = ?auto_111331 ?auto_111330 ) ) ( not ( = ?auto_111331 ?auto_111332 ) ) ( not ( = ?auto_111330 ?auto_111332 ) ) ( ON ?auto_111330 ?auto_111331 ) ( CLEAR ?auto_111330 ) ( ON ?auto_111332 ?auto_111333 ) ( CLEAR ?auto_111332 ) ( HAND-EMPTY ) ( not ( = ?auto_111326 ?auto_111333 ) ) ( not ( = ?auto_111327 ?auto_111333 ) ) ( not ( = ?auto_111328 ?auto_111333 ) ) ( not ( = ?auto_111329 ?auto_111333 ) ) ( not ( = ?auto_111331 ?auto_111333 ) ) ( not ( = ?auto_111330 ?auto_111333 ) ) ( not ( = ?auto_111332 ?auto_111333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111332 ?auto_111333 )
      ( MAKE-4PILE ?auto_111326 ?auto_111327 ?auto_111328 ?auto_111329 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111334 - BLOCK
      ?auto_111335 - BLOCK
      ?auto_111336 - BLOCK
      ?auto_111337 - BLOCK
    )
    :vars
    (
      ?auto_111338 - BLOCK
      ?auto_111340 - BLOCK
      ?auto_111339 - BLOCK
      ?auto_111341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111338 ?auto_111337 ) ( ON-TABLE ?auto_111334 ) ( ON ?auto_111335 ?auto_111334 ) ( ON ?auto_111336 ?auto_111335 ) ( ON ?auto_111337 ?auto_111336 ) ( not ( = ?auto_111334 ?auto_111335 ) ) ( not ( = ?auto_111334 ?auto_111336 ) ) ( not ( = ?auto_111334 ?auto_111337 ) ) ( not ( = ?auto_111334 ?auto_111338 ) ) ( not ( = ?auto_111335 ?auto_111336 ) ) ( not ( = ?auto_111335 ?auto_111337 ) ) ( not ( = ?auto_111335 ?auto_111338 ) ) ( not ( = ?auto_111336 ?auto_111337 ) ) ( not ( = ?auto_111336 ?auto_111338 ) ) ( not ( = ?auto_111337 ?auto_111338 ) ) ( not ( = ?auto_111334 ?auto_111340 ) ) ( not ( = ?auto_111334 ?auto_111339 ) ) ( not ( = ?auto_111335 ?auto_111340 ) ) ( not ( = ?auto_111335 ?auto_111339 ) ) ( not ( = ?auto_111336 ?auto_111340 ) ) ( not ( = ?auto_111336 ?auto_111339 ) ) ( not ( = ?auto_111337 ?auto_111340 ) ) ( not ( = ?auto_111337 ?auto_111339 ) ) ( not ( = ?auto_111338 ?auto_111340 ) ) ( not ( = ?auto_111338 ?auto_111339 ) ) ( not ( = ?auto_111340 ?auto_111339 ) ) ( ON ?auto_111339 ?auto_111341 ) ( CLEAR ?auto_111339 ) ( not ( = ?auto_111334 ?auto_111341 ) ) ( not ( = ?auto_111335 ?auto_111341 ) ) ( not ( = ?auto_111336 ?auto_111341 ) ) ( not ( = ?auto_111337 ?auto_111341 ) ) ( not ( = ?auto_111338 ?auto_111341 ) ) ( not ( = ?auto_111340 ?auto_111341 ) ) ( not ( = ?auto_111339 ?auto_111341 ) ) ( HOLDING ?auto_111340 ) ( CLEAR ?auto_111338 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111334 ?auto_111335 ?auto_111336 ?auto_111337 ?auto_111338 ?auto_111340 )
      ( MAKE-4PILE ?auto_111334 ?auto_111335 ?auto_111336 ?auto_111337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111342 - BLOCK
      ?auto_111343 - BLOCK
      ?auto_111344 - BLOCK
      ?auto_111345 - BLOCK
    )
    :vars
    (
      ?auto_111348 - BLOCK
      ?auto_111347 - BLOCK
      ?auto_111346 - BLOCK
      ?auto_111349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111348 ?auto_111345 ) ( ON-TABLE ?auto_111342 ) ( ON ?auto_111343 ?auto_111342 ) ( ON ?auto_111344 ?auto_111343 ) ( ON ?auto_111345 ?auto_111344 ) ( not ( = ?auto_111342 ?auto_111343 ) ) ( not ( = ?auto_111342 ?auto_111344 ) ) ( not ( = ?auto_111342 ?auto_111345 ) ) ( not ( = ?auto_111342 ?auto_111348 ) ) ( not ( = ?auto_111343 ?auto_111344 ) ) ( not ( = ?auto_111343 ?auto_111345 ) ) ( not ( = ?auto_111343 ?auto_111348 ) ) ( not ( = ?auto_111344 ?auto_111345 ) ) ( not ( = ?auto_111344 ?auto_111348 ) ) ( not ( = ?auto_111345 ?auto_111348 ) ) ( not ( = ?auto_111342 ?auto_111347 ) ) ( not ( = ?auto_111342 ?auto_111346 ) ) ( not ( = ?auto_111343 ?auto_111347 ) ) ( not ( = ?auto_111343 ?auto_111346 ) ) ( not ( = ?auto_111344 ?auto_111347 ) ) ( not ( = ?auto_111344 ?auto_111346 ) ) ( not ( = ?auto_111345 ?auto_111347 ) ) ( not ( = ?auto_111345 ?auto_111346 ) ) ( not ( = ?auto_111348 ?auto_111347 ) ) ( not ( = ?auto_111348 ?auto_111346 ) ) ( not ( = ?auto_111347 ?auto_111346 ) ) ( ON ?auto_111346 ?auto_111349 ) ( not ( = ?auto_111342 ?auto_111349 ) ) ( not ( = ?auto_111343 ?auto_111349 ) ) ( not ( = ?auto_111344 ?auto_111349 ) ) ( not ( = ?auto_111345 ?auto_111349 ) ) ( not ( = ?auto_111348 ?auto_111349 ) ) ( not ( = ?auto_111347 ?auto_111349 ) ) ( not ( = ?auto_111346 ?auto_111349 ) ) ( CLEAR ?auto_111348 ) ( ON ?auto_111347 ?auto_111346 ) ( CLEAR ?auto_111347 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111349 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111349 ?auto_111346 )
      ( MAKE-4PILE ?auto_111342 ?auto_111343 ?auto_111344 ?auto_111345 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111366 - BLOCK
      ?auto_111367 - BLOCK
      ?auto_111368 - BLOCK
      ?auto_111369 - BLOCK
    )
    :vars
    (
      ?auto_111372 - BLOCK
      ?auto_111373 - BLOCK
      ?auto_111371 - BLOCK
      ?auto_111370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111366 ) ( ON ?auto_111367 ?auto_111366 ) ( ON ?auto_111368 ?auto_111367 ) ( not ( = ?auto_111366 ?auto_111367 ) ) ( not ( = ?auto_111366 ?auto_111368 ) ) ( not ( = ?auto_111366 ?auto_111369 ) ) ( not ( = ?auto_111366 ?auto_111372 ) ) ( not ( = ?auto_111367 ?auto_111368 ) ) ( not ( = ?auto_111367 ?auto_111369 ) ) ( not ( = ?auto_111367 ?auto_111372 ) ) ( not ( = ?auto_111368 ?auto_111369 ) ) ( not ( = ?auto_111368 ?auto_111372 ) ) ( not ( = ?auto_111369 ?auto_111372 ) ) ( not ( = ?auto_111366 ?auto_111373 ) ) ( not ( = ?auto_111366 ?auto_111371 ) ) ( not ( = ?auto_111367 ?auto_111373 ) ) ( not ( = ?auto_111367 ?auto_111371 ) ) ( not ( = ?auto_111368 ?auto_111373 ) ) ( not ( = ?auto_111368 ?auto_111371 ) ) ( not ( = ?auto_111369 ?auto_111373 ) ) ( not ( = ?auto_111369 ?auto_111371 ) ) ( not ( = ?auto_111372 ?auto_111373 ) ) ( not ( = ?auto_111372 ?auto_111371 ) ) ( not ( = ?auto_111373 ?auto_111371 ) ) ( ON ?auto_111371 ?auto_111370 ) ( not ( = ?auto_111366 ?auto_111370 ) ) ( not ( = ?auto_111367 ?auto_111370 ) ) ( not ( = ?auto_111368 ?auto_111370 ) ) ( not ( = ?auto_111369 ?auto_111370 ) ) ( not ( = ?auto_111372 ?auto_111370 ) ) ( not ( = ?auto_111373 ?auto_111370 ) ) ( not ( = ?auto_111371 ?auto_111370 ) ) ( ON ?auto_111373 ?auto_111371 ) ( ON-TABLE ?auto_111370 ) ( ON ?auto_111372 ?auto_111373 ) ( CLEAR ?auto_111372 ) ( HOLDING ?auto_111369 ) ( CLEAR ?auto_111368 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111366 ?auto_111367 ?auto_111368 ?auto_111369 ?auto_111372 )
      ( MAKE-4PILE ?auto_111366 ?auto_111367 ?auto_111368 ?auto_111369 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111374 - BLOCK
      ?auto_111375 - BLOCK
      ?auto_111376 - BLOCK
      ?auto_111377 - BLOCK
    )
    :vars
    (
      ?auto_111381 - BLOCK
      ?auto_111380 - BLOCK
      ?auto_111378 - BLOCK
      ?auto_111379 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111374 ) ( ON ?auto_111375 ?auto_111374 ) ( ON ?auto_111376 ?auto_111375 ) ( not ( = ?auto_111374 ?auto_111375 ) ) ( not ( = ?auto_111374 ?auto_111376 ) ) ( not ( = ?auto_111374 ?auto_111377 ) ) ( not ( = ?auto_111374 ?auto_111381 ) ) ( not ( = ?auto_111375 ?auto_111376 ) ) ( not ( = ?auto_111375 ?auto_111377 ) ) ( not ( = ?auto_111375 ?auto_111381 ) ) ( not ( = ?auto_111376 ?auto_111377 ) ) ( not ( = ?auto_111376 ?auto_111381 ) ) ( not ( = ?auto_111377 ?auto_111381 ) ) ( not ( = ?auto_111374 ?auto_111380 ) ) ( not ( = ?auto_111374 ?auto_111378 ) ) ( not ( = ?auto_111375 ?auto_111380 ) ) ( not ( = ?auto_111375 ?auto_111378 ) ) ( not ( = ?auto_111376 ?auto_111380 ) ) ( not ( = ?auto_111376 ?auto_111378 ) ) ( not ( = ?auto_111377 ?auto_111380 ) ) ( not ( = ?auto_111377 ?auto_111378 ) ) ( not ( = ?auto_111381 ?auto_111380 ) ) ( not ( = ?auto_111381 ?auto_111378 ) ) ( not ( = ?auto_111380 ?auto_111378 ) ) ( ON ?auto_111378 ?auto_111379 ) ( not ( = ?auto_111374 ?auto_111379 ) ) ( not ( = ?auto_111375 ?auto_111379 ) ) ( not ( = ?auto_111376 ?auto_111379 ) ) ( not ( = ?auto_111377 ?auto_111379 ) ) ( not ( = ?auto_111381 ?auto_111379 ) ) ( not ( = ?auto_111380 ?auto_111379 ) ) ( not ( = ?auto_111378 ?auto_111379 ) ) ( ON ?auto_111380 ?auto_111378 ) ( ON-TABLE ?auto_111379 ) ( ON ?auto_111381 ?auto_111380 ) ( CLEAR ?auto_111376 ) ( ON ?auto_111377 ?auto_111381 ) ( CLEAR ?auto_111377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111379 ?auto_111378 ?auto_111380 ?auto_111381 )
      ( MAKE-4PILE ?auto_111374 ?auto_111375 ?auto_111376 ?auto_111377 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111382 - BLOCK
      ?auto_111383 - BLOCK
      ?auto_111384 - BLOCK
      ?auto_111385 - BLOCK
    )
    :vars
    (
      ?auto_111388 - BLOCK
      ?auto_111389 - BLOCK
      ?auto_111387 - BLOCK
      ?auto_111386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111382 ) ( ON ?auto_111383 ?auto_111382 ) ( not ( = ?auto_111382 ?auto_111383 ) ) ( not ( = ?auto_111382 ?auto_111384 ) ) ( not ( = ?auto_111382 ?auto_111385 ) ) ( not ( = ?auto_111382 ?auto_111388 ) ) ( not ( = ?auto_111383 ?auto_111384 ) ) ( not ( = ?auto_111383 ?auto_111385 ) ) ( not ( = ?auto_111383 ?auto_111388 ) ) ( not ( = ?auto_111384 ?auto_111385 ) ) ( not ( = ?auto_111384 ?auto_111388 ) ) ( not ( = ?auto_111385 ?auto_111388 ) ) ( not ( = ?auto_111382 ?auto_111389 ) ) ( not ( = ?auto_111382 ?auto_111387 ) ) ( not ( = ?auto_111383 ?auto_111389 ) ) ( not ( = ?auto_111383 ?auto_111387 ) ) ( not ( = ?auto_111384 ?auto_111389 ) ) ( not ( = ?auto_111384 ?auto_111387 ) ) ( not ( = ?auto_111385 ?auto_111389 ) ) ( not ( = ?auto_111385 ?auto_111387 ) ) ( not ( = ?auto_111388 ?auto_111389 ) ) ( not ( = ?auto_111388 ?auto_111387 ) ) ( not ( = ?auto_111389 ?auto_111387 ) ) ( ON ?auto_111387 ?auto_111386 ) ( not ( = ?auto_111382 ?auto_111386 ) ) ( not ( = ?auto_111383 ?auto_111386 ) ) ( not ( = ?auto_111384 ?auto_111386 ) ) ( not ( = ?auto_111385 ?auto_111386 ) ) ( not ( = ?auto_111388 ?auto_111386 ) ) ( not ( = ?auto_111389 ?auto_111386 ) ) ( not ( = ?auto_111387 ?auto_111386 ) ) ( ON ?auto_111389 ?auto_111387 ) ( ON-TABLE ?auto_111386 ) ( ON ?auto_111388 ?auto_111389 ) ( ON ?auto_111385 ?auto_111388 ) ( CLEAR ?auto_111385 ) ( HOLDING ?auto_111384 ) ( CLEAR ?auto_111383 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111382 ?auto_111383 ?auto_111384 )
      ( MAKE-4PILE ?auto_111382 ?auto_111383 ?auto_111384 ?auto_111385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111390 - BLOCK
      ?auto_111391 - BLOCK
      ?auto_111392 - BLOCK
      ?auto_111393 - BLOCK
    )
    :vars
    (
      ?auto_111397 - BLOCK
      ?auto_111394 - BLOCK
      ?auto_111395 - BLOCK
      ?auto_111396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111390 ) ( ON ?auto_111391 ?auto_111390 ) ( not ( = ?auto_111390 ?auto_111391 ) ) ( not ( = ?auto_111390 ?auto_111392 ) ) ( not ( = ?auto_111390 ?auto_111393 ) ) ( not ( = ?auto_111390 ?auto_111397 ) ) ( not ( = ?auto_111391 ?auto_111392 ) ) ( not ( = ?auto_111391 ?auto_111393 ) ) ( not ( = ?auto_111391 ?auto_111397 ) ) ( not ( = ?auto_111392 ?auto_111393 ) ) ( not ( = ?auto_111392 ?auto_111397 ) ) ( not ( = ?auto_111393 ?auto_111397 ) ) ( not ( = ?auto_111390 ?auto_111394 ) ) ( not ( = ?auto_111390 ?auto_111395 ) ) ( not ( = ?auto_111391 ?auto_111394 ) ) ( not ( = ?auto_111391 ?auto_111395 ) ) ( not ( = ?auto_111392 ?auto_111394 ) ) ( not ( = ?auto_111392 ?auto_111395 ) ) ( not ( = ?auto_111393 ?auto_111394 ) ) ( not ( = ?auto_111393 ?auto_111395 ) ) ( not ( = ?auto_111397 ?auto_111394 ) ) ( not ( = ?auto_111397 ?auto_111395 ) ) ( not ( = ?auto_111394 ?auto_111395 ) ) ( ON ?auto_111395 ?auto_111396 ) ( not ( = ?auto_111390 ?auto_111396 ) ) ( not ( = ?auto_111391 ?auto_111396 ) ) ( not ( = ?auto_111392 ?auto_111396 ) ) ( not ( = ?auto_111393 ?auto_111396 ) ) ( not ( = ?auto_111397 ?auto_111396 ) ) ( not ( = ?auto_111394 ?auto_111396 ) ) ( not ( = ?auto_111395 ?auto_111396 ) ) ( ON ?auto_111394 ?auto_111395 ) ( ON-TABLE ?auto_111396 ) ( ON ?auto_111397 ?auto_111394 ) ( ON ?auto_111393 ?auto_111397 ) ( CLEAR ?auto_111391 ) ( ON ?auto_111392 ?auto_111393 ) ( CLEAR ?auto_111392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111396 ?auto_111395 ?auto_111394 ?auto_111397 ?auto_111393 )
      ( MAKE-4PILE ?auto_111390 ?auto_111391 ?auto_111392 ?auto_111393 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111398 - BLOCK
      ?auto_111399 - BLOCK
      ?auto_111400 - BLOCK
      ?auto_111401 - BLOCK
    )
    :vars
    (
      ?auto_111404 - BLOCK
      ?auto_111402 - BLOCK
      ?auto_111405 - BLOCK
      ?auto_111403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111398 ) ( not ( = ?auto_111398 ?auto_111399 ) ) ( not ( = ?auto_111398 ?auto_111400 ) ) ( not ( = ?auto_111398 ?auto_111401 ) ) ( not ( = ?auto_111398 ?auto_111404 ) ) ( not ( = ?auto_111399 ?auto_111400 ) ) ( not ( = ?auto_111399 ?auto_111401 ) ) ( not ( = ?auto_111399 ?auto_111404 ) ) ( not ( = ?auto_111400 ?auto_111401 ) ) ( not ( = ?auto_111400 ?auto_111404 ) ) ( not ( = ?auto_111401 ?auto_111404 ) ) ( not ( = ?auto_111398 ?auto_111402 ) ) ( not ( = ?auto_111398 ?auto_111405 ) ) ( not ( = ?auto_111399 ?auto_111402 ) ) ( not ( = ?auto_111399 ?auto_111405 ) ) ( not ( = ?auto_111400 ?auto_111402 ) ) ( not ( = ?auto_111400 ?auto_111405 ) ) ( not ( = ?auto_111401 ?auto_111402 ) ) ( not ( = ?auto_111401 ?auto_111405 ) ) ( not ( = ?auto_111404 ?auto_111402 ) ) ( not ( = ?auto_111404 ?auto_111405 ) ) ( not ( = ?auto_111402 ?auto_111405 ) ) ( ON ?auto_111405 ?auto_111403 ) ( not ( = ?auto_111398 ?auto_111403 ) ) ( not ( = ?auto_111399 ?auto_111403 ) ) ( not ( = ?auto_111400 ?auto_111403 ) ) ( not ( = ?auto_111401 ?auto_111403 ) ) ( not ( = ?auto_111404 ?auto_111403 ) ) ( not ( = ?auto_111402 ?auto_111403 ) ) ( not ( = ?auto_111405 ?auto_111403 ) ) ( ON ?auto_111402 ?auto_111405 ) ( ON-TABLE ?auto_111403 ) ( ON ?auto_111404 ?auto_111402 ) ( ON ?auto_111401 ?auto_111404 ) ( ON ?auto_111400 ?auto_111401 ) ( CLEAR ?auto_111400 ) ( HOLDING ?auto_111399 ) ( CLEAR ?auto_111398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111398 ?auto_111399 )
      ( MAKE-4PILE ?auto_111398 ?auto_111399 ?auto_111400 ?auto_111401 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111406 - BLOCK
      ?auto_111407 - BLOCK
      ?auto_111408 - BLOCK
      ?auto_111409 - BLOCK
    )
    :vars
    (
      ?auto_111411 - BLOCK
      ?auto_111413 - BLOCK
      ?auto_111412 - BLOCK
      ?auto_111410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111406 ) ( not ( = ?auto_111406 ?auto_111407 ) ) ( not ( = ?auto_111406 ?auto_111408 ) ) ( not ( = ?auto_111406 ?auto_111409 ) ) ( not ( = ?auto_111406 ?auto_111411 ) ) ( not ( = ?auto_111407 ?auto_111408 ) ) ( not ( = ?auto_111407 ?auto_111409 ) ) ( not ( = ?auto_111407 ?auto_111411 ) ) ( not ( = ?auto_111408 ?auto_111409 ) ) ( not ( = ?auto_111408 ?auto_111411 ) ) ( not ( = ?auto_111409 ?auto_111411 ) ) ( not ( = ?auto_111406 ?auto_111413 ) ) ( not ( = ?auto_111406 ?auto_111412 ) ) ( not ( = ?auto_111407 ?auto_111413 ) ) ( not ( = ?auto_111407 ?auto_111412 ) ) ( not ( = ?auto_111408 ?auto_111413 ) ) ( not ( = ?auto_111408 ?auto_111412 ) ) ( not ( = ?auto_111409 ?auto_111413 ) ) ( not ( = ?auto_111409 ?auto_111412 ) ) ( not ( = ?auto_111411 ?auto_111413 ) ) ( not ( = ?auto_111411 ?auto_111412 ) ) ( not ( = ?auto_111413 ?auto_111412 ) ) ( ON ?auto_111412 ?auto_111410 ) ( not ( = ?auto_111406 ?auto_111410 ) ) ( not ( = ?auto_111407 ?auto_111410 ) ) ( not ( = ?auto_111408 ?auto_111410 ) ) ( not ( = ?auto_111409 ?auto_111410 ) ) ( not ( = ?auto_111411 ?auto_111410 ) ) ( not ( = ?auto_111413 ?auto_111410 ) ) ( not ( = ?auto_111412 ?auto_111410 ) ) ( ON ?auto_111413 ?auto_111412 ) ( ON-TABLE ?auto_111410 ) ( ON ?auto_111411 ?auto_111413 ) ( ON ?auto_111409 ?auto_111411 ) ( ON ?auto_111408 ?auto_111409 ) ( CLEAR ?auto_111406 ) ( ON ?auto_111407 ?auto_111408 ) ( CLEAR ?auto_111407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111410 ?auto_111412 ?auto_111413 ?auto_111411 ?auto_111409 ?auto_111408 )
      ( MAKE-4PILE ?auto_111406 ?auto_111407 ?auto_111408 ?auto_111409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111414 - BLOCK
      ?auto_111415 - BLOCK
      ?auto_111416 - BLOCK
      ?auto_111417 - BLOCK
    )
    :vars
    (
      ?auto_111419 - BLOCK
      ?auto_111418 - BLOCK
      ?auto_111421 - BLOCK
      ?auto_111420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111414 ?auto_111415 ) ) ( not ( = ?auto_111414 ?auto_111416 ) ) ( not ( = ?auto_111414 ?auto_111417 ) ) ( not ( = ?auto_111414 ?auto_111419 ) ) ( not ( = ?auto_111415 ?auto_111416 ) ) ( not ( = ?auto_111415 ?auto_111417 ) ) ( not ( = ?auto_111415 ?auto_111419 ) ) ( not ( = ?auto_111416 ?auto_111417 ) ) ( not ( = ?auto_111416 ?auto_111419 ) ) ( not ( = ?auto_111417 ?auto_111419 ) ) ( not ( = ?auto_111414 ?auto_111418 ) ) ( not ( = ?auto_111414 ?auto_111421 ) ) ( not ( = ?auto_111415 ?auto_111418 ) ) ( not ( = ?auto_111415 ?auto_111421 ) ) ( not ( = ?auto_111416 ?auto_111418 ) ) ( not ( = ?auto_111416 ?auto_111421 ) ) ( not ( = ?auto_111417 ?auto_111418 ) ) ( not ( = ?auto_111417 ?auto_111421 ) ) ( not ( = ?auto_111419 ?auto_111418 ) ) ( not ( = ?auto_111419 ?auto_111421 ) ) ( not ( = ?auto_111418 ?auto_111421 ) ) ( ON ?auto_111421 ?auto_111420 ) ( not ( = ?auto_111414 ?auto_111420 ) ) ( not ( = ?auto_111415 ?auto_111420 ) ) ( not ( = ?auto_111416 ?auto_111420 ) ) ( not ( = ?auto_111417 ?auto_111420 ) ) ( not ( = ?auto_111419 ?auto_111420 ) ) ( not ( = ?auto_111418 ?auto_111420 ) ) ( not ( = ?auto_111421 ?auto_111420 ) ) ( ON ?auto_111418 ?auto_111421 ) ( ON-TABLE ?auto_111420 ) ( ON ?auto_111419 ?auto_111418 ) ( ON ?auto_111417 ?auto_111419 ) ( ON ?auto_111416 ?auto_111417 ) ( ON ?auto_111415 ?auto_111416 ) ( CLEAR ?auto_111415 ) ( HOLDING ?auto_111414 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111414 )
      ( MAKE-4PILE ?auto_111414 ?auto_111415 ?auto_111416 ?auto_111417 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111422 - BLOCK
      ?auto_111423 - BLOCK
      ?auto_111424 - BLOCK
      ?auto_111425 - BLOCK
    )
    :vars
    (
      ?auto_111426 - BLOCK
      ?auto_111427 - BLOCK
      ?auto_111429 - BLOCK
      ?auto_111428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111422 ?auto_111423 ) ) ( not ( = ?auto_111422 ?auto_111424 ) ) ( not ( = ?auto_111422 ?auto_111425 ) ) ( not ( = ?auto_111422 ?auto_111426 ) ) ( not ( = ?auto_111423 ?auto_111424 ) ) ( not ( = ?auto_111423 ?auto_111425 ) ) ( not ( = ?auto_111423 ?auto_111426 ) ) ( not ( = ?auto_111424 ?auto_111425 ) ) ( not ( = ?auto_111424 ?auto_111426 ) ) ( not ( = ?auto_111425 ?auto_111426 ) ) ( not ( = ?auto_111422 ?auto_111427 ) ) ( not ( = ?auto_111422 ?auto_111429 ) ) ( not ( = ?auto_111423 ?auto_111427 ) ) ( not ( = ?auto_111423 ?auto_111429 ) ) ( not ( = ?auto_111424 ?auto_111427 ) ) ( not ( = ?auto_111424 ?auto_111429 ) ) ( not ( = ?auto_111425 ?auto_111427 ) ) ( not ( = ?auto_111425 ?auto_111429 ) ) ( not ( = ?auto_111426 ?auto_111427 ) ) ( not ( = ?auto_111426 ?auto_111429 ) ) ( not ( = ?auto_111427 ?auto_111429 ) ) ( ON ?auto_111429 ?auto_111428 ) ( not ( = ?auto_111422 ?auto_111428 ) ) ( not ( = ?auto_111423 ?auto_111428 ) ) ( not ( = ?auto_111424 ?auto_111428 ) ) ( not ( = ?auto_111425 ?auto_111428 ) ) ( not ( = ?auto_111426 ?auto_111428 ) ) ( not ( = ?auto_111427 ?auto_111428 ) ) ( not ( = ?auto_111429 ?auto_111428 ) ) ( ON ?auto_111427 ?auto_111429 ) ( ON-TABLE ?auto_111428 ) ( ON ?auto_111426 ?auto_111427 ) ( ON ?auto_111425 ?auto_111426 ) ( ON ?auto_111424 ?auto_111425 ) ( ON ?auto_111423 ?auto_111424 ) ( ON ?auto_111422 ?auto_111423 ) ( CLEAR ?auto_111422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111428 ?auto_111429 ?auto_111427 ?auto_111426 ?auto_111425 ?auto_111424 ?auto_111423 )
      ( MAKE-4PILE ?auto_111422 ?auto_111423 ?auto_111424 ?auto_111425 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111433 - BLOCK
      ?auto_111434 - BLOCK
      ?auto_111435 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_111435 ) ( CLEAR ?auto_111434 ) ( ON-TABLE ?auto_111433 ) ( ON ?auto_111434 ?auto_111433 ) ( not ( = ?auto_111433 ?auto_111434 ) ) ( not ( = ?auto_111433 ?auto_111435 ) ) ( not ( = ?auto_111434 ?auto_111435 ) ) )
    :subtasks
    ( ( !STACK ?auto_111435 ?auto_111434 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111436 - BLOCK
      ?auto_111437 - BLOCK
      ?auto_111438 - BLOCK
    )
    :vars
    (
      ?auto_111439 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111437 ) ( ON-TABLE ?auto_111436 ) ( ON ?auto_111437 ?auto_111436 ) ( not ( = ?auto_111436 ?auto_111437 ) ) ( not ( = ?auto_111436 ?auto_111438 ) ) ( not ( = ?auto_111437 ?auto_111438 ) ) ( ON ?auto_111438 ?auto_111439 ) ( CLEAR ?auto_111438 ) ( HAND-EMPTY ) ( not ( = ?auto_111436 ?auto_111439 ) ) ( not ( = ?auto_111437 ?auto_111439 ) ) ( not ( = ?auto_111438 ?auto_111439 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111438 ?auto_111439 )
      ( MAKE-3PILE ?auto_111436 ?auto_111437 ?auto_111438 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111440 - BLOCK
      ?auto_111441 - BLOCK
      ?auto_111442 - BLOCK
    )
    :vars
    (
      ?auto_111443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111440 ) ( not ( = ?auto_111440 ?auto_111441 ) ) ( not ( = ?auto_111440 ?auto_111442 ) ) ( not ( = ?auto_111441 ?auto_111442 ) ) ( ON ?auto_111442 ?auto_111443 ) ( CLEAR ?auto_111442 ) ( not ( = ?auto_111440 ?auto_111443 ) ) ( not ( = ?auto_111441 ?auto_111443 ) ) ( not ( = ?auto_111442 ?auto_111443 ) ) ( HOLDING ?auto_111441 ) ( CLEAR ?auto_111440 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111440 ?auto_111441 )
      ( MAKE-3PILE ?auto_111440 ?auto_111441 ?auto_111442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111444 - BLOCK
      ?auto_111445 - BLOCK
      ?auto_111446 - BLOCK
    )
    :vars
    (
      ?auto_111447 - BLOCK
      ?auto_111448 - BLOCK
      ?auto_111449 - BLOCK
      ?auto_111450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111444 ) ( not ( = ?auto_111444 ?auto_111445 ) ) ( not ( = ?auto_111444 ?auto_111446 ) ) ( not ( = ?auto_111445 ?auto_111446 ) ) ( ON ?auto_111446 ?auto_111447 ) ( not ( = ?auto_111444 ?auto_111447 ) ) ( not ( = ?auto_111445 ?auto_111447 ) ) ( not ( = ?auto_111446 ?auto_111447 ) ) ( CLEAR ?auto_111444 ) ( ON ?auto_111445 ?auto_111446 ) ( CLEAR ?auto_111445 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111448 ) ( ON ?auto_111449 ?auto_111448 ) ( ON ?auto_111450 ?auto_111449 ) ( ON ?auto_111447 ?auto_111450 ) ( not ( = ?auto_111448 ?auto_111449 ) ) ( not ( = ?auto_111448 ?auto_111450 ) ) ( not ( = ?auto_111448 ?auto_111447 ) ) ( not ( = ?auto_111448 ?auto_111446 ) ) ( not ( = ?auto_111448 ?auto_111445 ) ) ( not ( = ?auto_111449 ?auto_111450 ) ) ( not ( = ?auto_111449 ?auto_111447 ) ) ( not ( = ?auto_111449 ?auto_111446 ) ) ( not ( = ?auto_111449 ?auto_111445 ) ) ( not ( = ?auto_111450 ?auto_111447 ) ) ( not ( = ?auto_111450 ?auto_111446 ) ) ( not ( = ?auto_111450 ?auto_111445 ) ) ( not ( = ?auto_111444 ?auto_111448 ) ) ( not ( = ?auto_111444 ?auto_111449 ) ) ( not ( = ?auto_111444 ?auto_111450 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111448 ?auto_111449 ?auto_111450 ?auto_111447 ?auto_111446 )
      ( MAKE-3PILE ?auto_111444 ?auto_111445 ?auto_111446 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111451 - BLOCK
      ?auto_111452 - BLOCK
      ?auto_111453 - BLOCK
    )
    :vars
    (
      ?auto_111455 - BLOCK
      ?auto_111456 - BLOCK
      ?auto_111454 - BLOCK
      ?auto_111457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111451 ?auto_111452 ) ) ( not ( = ?auto_111451 ?auto_111453 ) ) ( not ( = ?auto_111452 ?auto_111453 ) ) ( ON ?auto_111453 ?auto_111455 ) ( not ( = ?auto_111451 ?auto_111455 ) ) ( not ( = ?auto_111452 ?auto_111455 ) ) ( not ( = ?auto_111453 ?auto_111455 ) ) ( ON ?auto_111452 ?auto_111453 ) ( CLEAR ?auto_111452 ) ( ON-TABLE ?auto_111456 ) ( ON ?auto_111454 ?auto_111456 ) ( ON ?auto_111457 ?auto_111454 ) ( ON ?auto_111455 ?auto_111457 ) ( not ( = ?auto_111456 ?auto_111454 ) ) ( not ( = ?auto_111456 ?auto_111457 ) ) ( not ( = ?auto_111456 ?auto_111455 ) ) ( not ( = ?auto_111456 ?auto_111453 ) ) ( not ( = ?auto_111456 ?auto_111452 ) ) ( not ( = ?auto_111454 ?auto_111457 ) ) ( not ( = ?auto_111454 ?auto_111455 ) ) ( not ( = ?auto_111454 ?auto_111453 ) ) ( not ( = ?auto_111454 ?auto_111452 ) ) ( not ( = ?auto_111457 ?auto_111455 ) ) ( not ( = ?auto_111457 ?auto_111453 ) ) ( not ( = ?auto_111457 ?auto_111452 ) ) ( not ( = ?auto_111451 ?auto_111456 ) ) ( not ( = ?auto_111451 ?auto_111454 ) ) ( not ( = ?auto_111451 ?auto_111457 ) ) ( HOLDING ?auto_111451 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111451 )
      ( MAKE-3PILE ?auto_111451 ?auto_111452 ?auto_111453 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111458 - BLOCK
      ?auto_111459 - BLOCK
      ?auto_111460 - BLOCK
    )
    :vars
    (
      ?auto_111462 - BLOCK
      ?auto_111464 - BLOCK
      ?auto_111463 - BLOCK
      ?auto_111461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111458 ?auto_111459 ) ) ( not ( = ?auto_111458 ?auto_111460 ) ) ( not ( = ?auto_111459 ?auto_111460 ) ) ( ON ?auto_111460 ?auto_111462 ) ( not ( = ?auto_111458 ?auto_111462 ) ) ( not ( = ?auto_111459 ?auto_111462 ) ) ( not ( = ?auto_111460 ?auto_111462 ) ) ( ON ?auto_111459 ?auto_111460 ) ( ON-TABLE ?auto_111464 ) ( ON ?auto_111463 ?auto_111464 ) ( ON ?auto_111461 ?auto_111463 ) ( ON ?auto_111462 ?auto_111461 ) ( not ( = ?auto_111464 ?auto_111463 ) ) ( not ( = ?auto_111464 ?auto_111461 ) ) ( not ( = ?auto_111464 ?auto_111462 ) ) ( not ( = ?auto_111464 ?auto_111460 ) ) ( not ( = ?auto_111464 ?auto_111459 ) ) ( not ( = ?auto_111463 ?auto_111461 ) ) ( not ( = ?auto_111463 ?auto_111462 ) ) ( not ( = ?auto_111463 ?auto_111460 ) ) ( not ( = ?auto_111463 ?auto_111459 ) ) ( not ( = ?auto_111461 ?auto_111462 ) ) ( not ( = ?auto_111461 ?auto_111460 ) ) ( not ( = ?auto_111461 ?auto_111459 ) ) ( not ( = ?auto_111458 ?auto_111464 ) ) ( not ( = ?auto_111458 ?auto_111463 ) ) ( not ( = ?auto_111458 ?auto_111461 ) ) ( ON ?auto_111458 ?auto_111459 ) ( CLEAR ?auto_111458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111464 ?auto_111463 ?auto_111461 ?auto_111462 ?auto_111460 ?auto_111459 )
      ( MAKE-3PILE ?auto_111458 ?auto_111459 ?auto_111460 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111465 - BLOCK
      ?auto_111466 - BLOCK
      ?auto_111467 - BLOCK
    )
    :vars
    (
      ?auto_111470 - BLOCK
      ?auto_111469 - BLOCK
      ?auto_111468 - BLOCK
      ?auto_111471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111465 ?auto_111466 ) ) ( not ( = ?auto_111465 ?auto_111467 ) ) ( not ( = ?auto_111466 ?auto_111467 ) ) ( ON ?auto_111467 ?auto_111470 ) ( not ( = ?auto_111465 ?auto_111470 ) ) ( not ( = ?auto_111466 ?auto_111470 ) ) ( not ( = ?auto_111467 ?auto_111470 ) ) ( ON ?auto_111466 ?auto_111467 ) ( ON-TABLE ?auto_111469 ) ( ON ?auto_111468 ?auto_111469 ) ( ON ?auto_111471 ?auto_111468 ) ( ON ?auto_111470 ?auto_111471 ) ( not ( = ?auto_111469 ?auto_111468 ) ) ( not ( = ?auto_111469 ?auto_111471 ) ) ( not ( = ?auto_111469 ?auto_111470 ) ) ( not ( = ?auto_111469 ?auto_111467 ) ) ( not ( = ?auto_111469 ?auto_111466 ) ) ( not ( = ?auto_111468 ?auto_111471 ) ) ( not ( = ?auto_111468 ?auto_111470 ) ) ( not ( = ?auto_111468 ?auto_111467 ) ) ( not ( = ?auto_111468 ?auto_111466 ) ) ( not ( = ?auto_111471 ?auto_111470 ) ) ( not ( = ?auto_111471 ?auto_111467 ) ) ( not ( = ?auto_111471 ?auto_111466 ) ) ( not ( = ?auto_111465 ?auto_111469 ) ) ( not ( = ?auto_111465 ?auto_111468 ) ) ( not ( = ?auto_111465 ?auto_111471 ) ) ( HOLDING ?auto_111465 ) ( CLEAR ?auto_111466 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111469 ?auto_111468 ?auto_111471 ?auto_111470 ?auto_111467 ?auto_111466 ?auto_111465 )
      ( MAKE-3PILE ?auto_111465 ?auto_111466 ?auto_111467 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111472 - BLOCK
      ?auto_111473 - BLOCK
      ?auto_111474 - BLOCK
    )
    :vars
    (
      ?auto_111475 - BLOCK
      ?auto_111478 - BLOCK
      ?auto_111476 - BLOCK
      ?auto_111477 - BLOCK
      ?auto_111479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111472 ?auto_111473 ) ) ( not ( = ?auto_111472 ?auto_111474 ) ) ( not ( = ?auto_111473 ?auto_111474 ) ) ( ON ?auto_111474 ?auto_111475 ) ( not ( = ?auto_111472 ?auto_111475 ) ) ( not ( = ?auto_111473 ?auto_111475 ) ) ( not ( = ?auto_111474 ?auto_111475 ) ) ( ON ?auto_111473 ?auto_111474 ) ( ON-TABLE ?auto_111478 ) ( ON ?auto_111476 ?auto_111478 ) ( ON ?auto_111477 ?auto_111476 ) ( ON ?auto_111475 ?auto_111477 ) ( not ( = ?auto_111478 ?auto_111476 ) ) ( not ( = ?auto_111478 ?auto_111477 ) ) ( not ( = ?auto_111478 ?auto_111475 ) ) ( not ( = ?auto_111478 ?auto_111474 ) ) ( not ( = ?auto_111478 ?auto_111473 ) ) ( not ( = ?auto_111476 ?auto_111477 ) ) ( not ( = ?auto_111476 ?auto_111475 ) ) ( not ( = ?auto_111476 ?auto_111474 ) ) ( not ( = ?auto_111476 ?auto_111473 ) ) ( not ( = ?auto_111477 ?auto_111475 ) ) ( not ( = ?auto_111477 ?auto_111474 ) ) ( not ( = ?auto_111477 ?auto_111473 ) ) ( not ( = ?auto_111472 ?auto_111478 ) ) ( not ( = ?auto_111472 ?auto_111476 ) ) ( not ( = ?auto_111472 ?auto_111477 ) ) ( CLEAR ?auto_111473 ) ( ON ?auto_111472 ?auto_111479 ) ( CLEAR ?auto_111472 ) ( HAND-EMPTY ) ( not ( = ?auto_111472 ?auto_111479 ) ) ( not ( = ?auto_111473 ?auto_111479 ) ) ( not ( = ?auto_111474 ?auto_111479 ) ) ( not ( = ?auto_111475 ?auto_111479 ) ) ( not ( = ?auto_111478 ?auto_111479 ) ) ( not ( = ?auto_111476 ?auto_111479 ) ) ( not ( = ?auto_111477 ?auto_111479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111472 ?auto_111479 )
      ( MAKE-3PILE ?auto_111472 ?auto_111473 ?auto_111474 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111480 - BLOCK
      ?auto_111481 - BLOCK
      ?auto_111482 - BLOCK
    )
    :vars
    (
      ?auto_111484 - BLOCK
      ?auto_111487 - BLOCK
      ?auto_111483 - BLOCK
      ?auto_111485 - BLOCK
      ?auto_111486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111480 ?auto_111481 ) ) ( not ( = ?auto_111480 ?auto_111482 ) ) ( not ( = ?auto_111481 ?auto_111482 ) ) ( ON ?auto_111482 ?auto_111484 ) ( not ( = ?auto_111480 ?auto_111484 ) ) ( not ( = ?auto_111481 ?auto_111484 ) ) ( not ( = ?auto_111482 ?auto_111484 ) ) ( ON-TABLE ?auto_111487 ) ( ON ?auto_111483 ?auto_111487 ) ( ON ?auto_111485 ?auto_111483 ) ( ON ?auto_111484 ?auto_111485 ) ( not ( = ?auto_111487 ?auto_111483 ) ) ( not ( = ?auto_111487 ?auto_111485 ) ) ( not ( = ?auto_111487 ?auto_111484 ) ) ( not ( = ?auto_111487 ?auto_111482 ) ) ( not ( = ?auto_111487 ?auto_111481 ) ) ( not ( = ?auto_111483 ?auto_111485 ) ) ( not ( = ?auto_111483 ?auto_111484 ) ) ( not ( = ?auto_111483 ?auto_111482 ) ) ( not ( = ?auto_111483 ?auto_111481 ) ) ( not ( = ?auto_111485 ?auto_111484 ) ) ( not ( = ?auto_111485 ?auto_111482 ) ) ( not ( = ?auto_111485 ?auto_111481 ) ) ( not ( = ?auto_111480 ?auto_111487 ) ) ( not ( = ?auto_111480 ?auto_111483 ) ) ( not ( = ?auto_111480 ?auto_111485 ) ) ( ON ?auto_111480 ?auto_111486 ) ( CLEAR ?auto_111480 ) ( not ( = ?auto_111480 ?auto_111486 ) ) ( not ( = ?auto_111481 ?auto_111486 ) ) ( not ( = ?auto_111482 ?auto_111486 ) ) ( not ( = ?auto_111484 ?auto_111486 ) ) ( not ( = ?auto_111487 ?auto_111486 ) ) ( not ( = ?auto_111483 ?auto_111486 ) ) ( not ( = ?auto_111485 ?auto_111486 ) ) ( HOLDING ?auto_111481 ) ( CLEAR ?auto_111482 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111487 ?auto_111483 ?auto_111485 ?auto_111484 ?auto_111482 ?auto_111481 )
      ( MAKE-3PILE ?auto_111480 ?auto_111481 ?auto_111482 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111488 - BLOCK
      ?auto_111489 - BLOCK
      ?auto_111490 - BLOCK
    )
    :vars
    (
      ?auto_111491 - BLOCK
      ?auto_111494 - BLOCK
      ?auto_111493 - BLOCK
      ?auto_111495 - BLOCK
      ?auto_111492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111488 ?auto_111489 ) ) ( not ( = ?auto_111488 ?auto_111490 ) ) ( not ( = ?auto_111489 ?auto_111490 ) ) ( ON ?auto_111490 ?auto_111491 ) ( not ( = ?auto_111488 ?auto_111491 ) ) ( not ( = ?auto_111489 ?auto_111491 ) ) ( not ( = ?auto_111490 ?auto_111491 ) ) ( ON-TABLE ?auto_111494 ) ( ON ?auto_111493 ?auto_111494 ) ( ON ?auto_111495 ?auto_111493 ) ( ON ?auto_111491 ?auto_111495 ) ( not ( = ?auto_111494 ?auto_111493 ) ) ( not ( = ?auto_111494 ?auto_111495 ) ) ( not ( = ?auto_111494 ?auto_111491 ) ) ( not ( = ?auto_111494 ?auto_111490 ) ) ( not ( = ?auto_111494 ?auto_111489 ) ) ( not ( = ?auto_111493 ?auto_111495 ) ) ( not ( = ?auto_111493 ?auto_111491 ) ) ( not ( = ?auto_111493 ?auto_111490 ) ) ( not ( = ?auto_111493 ?auto_111489 ) ) ( not ( = ?auto_111495 ?auto_111491 ) ) ( not ( = ?auto_111495 ?auto_111490 ) ) ( not ( = ?auto_111495 ?auto_111489 ) ) ( not ( = ?auto_111488 ?auto_111494 ) ) ( not ( = ?auto_111488 ?auto_111493 ) ) ( not ( = ?auto_111488 ?auto_111495 ) ) ( ON ?auto_111488 ?auto_111492 ) ( not ( = ?auto_111488 ?auto_111492 ) ) ( not ( = ?auto_111489 ?auto_111492 ) ) ( not ( = ?auto_111490 ?auto_111492 ) ) ( not ( = ?auto_111491 ?auto_111492 ) ) ( not ( = ?auto_111494 ?auto_111492 ) ) ( not ( = ?auto_111493 ?auto_111492 ) ) ( not ( = ?auto_111495 ?auto_111492 ) ) ( CLEAR ?auto_111490 ) ( ON ?auto_111489 ?auto_111488 ) ( CLEAR ?auto_111489 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111492 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111492 ?auto_111488 )
      ( MAKE-3PILE ?auto_111488 ?auto_111489 ?auto_111490 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111496 - BLOCK
      ?auto_111497 - BLOCK
      ?auto_111498 - BLOCK
    )
    :vars
    (
      ?auto_111501 - BLOCK
      ?auto_111502 - BLOCK
      ?auto_111500 - BLOCK
      ?auto_111499 - BLOCK
      ?auto_111503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111496 ?auto_111497 ) ) ( not ( = ?auto_111496 ?auto_111498 ) ) ( not ( = ?auto_111497 ?auto_111498 ) ) ( not ( = ?auto_111496 ?auto_111501 ) ) ( not ( = ?auto_111497 ?auto_111501 ) ) ( not ( = ?auto_111498 ?auto_111501 ) ) ( ON-TABLE ?auto_111502 ) ( ON ?auto_111500 ?auto_111502 ) ( ON ?auto_111499 ?auto_111500 ) ( ON ?auto_111501 ?auto_111499 ) ( not ( = ?auto_111502 ?auto_111500 ) ) ( not ( = ?auto_111502 ?auto_111499 ) ) ( not ( = ?auto_111502 ?auto_111501 ) ) ( not ( = ?auto_111502 ?auto_111498 ) ) ( not ( = ?auto_111502 ?auto_111497 ) ) ( not ( = ?auto_111500 ?auto_111499 ) ) ( not ( = ?auto_111500 ?auto_111501 ) ) ( not ( = ?auto_111500 ?auto_111498 ) ) ( not ( = ?auto_111500 ?auto_111497 ) ) ( not ( = ?auto_111499 ?auto_111501 ) ) ( not ( = ?auto_111499 ?auto_111498 ) ) ( not ( = ?auto_111499 ?auto_111497 ) ) ( not ( = ?auto_111496 ?auto_111502 ) ) ( not ( = ?auto_111496 ?auto_111500 ) ) ( not ( = ?auto_111496 ?auto_111499 ) ) ( ON ?auto_111496 ?auto_111503 ) ( not ( = ?auto_111496 ?auto_111503 ) ) ( not ( = ?auto_111497 ?auto_111503 ) ) ( not ( = ?auto_111498 ?auto_111503 ) ) ( not ( = ?auto_111501 ?auto_111503 ) ) ( not ( = ?auto_111502 ?auto_111503 ) ) ( not ( = ?auto_111500 ?auto_111503 ) ) ( not ( = ?auto_111499 ?auto_111503 ) ) ( ON ?auto_111497 ?auto_111496 ) ( CLEAR ?auto_111497 ) ( ON-TABLE ?auto_111503 ) ( HOLDING ?auto_111498 ) ( CLEAR ?auto_111501 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111502 ?auto_111500 ?auto_111499 ?auto_111501 ?auto_111498 )
      ( MAKE-3PILE ?auto_111496 ?auto_111497 ?auto_111498 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111504 - BLOCK
      ?auto_111505 - BLOCK
      ?auto_111506 - BLOCK
    )
    :vars
    (
      ?auto_111509 - BLOCK
      ?auto_111510 - BLOCK
      ?auto_111508 - BLOCK
      ?auto_111507 - BLOCK
      ?auto_111511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111504 ?auto_111505 ) ) ( not ( = ?auto_111504 ?auto_111506 ) ) ( not ( = ?auto_111505 ?auto_111506 ) ) ( not ( = ?auto_111504 ?auto_111509 ) ) ( not ( = ?auto_111505 ?auto_111509 ) ) ( not ( = ?auto_111506 ?auto_111509 ) ) ( ON-TABLE ?auto_111510 ) ( ON ?auto_111508 ?auto_111510 ) ( ON ?auto_111507 ?auto_111508 ) ( ON ?auto_111509 ?auto_111507 ) ( not ( = ?auto_111510 ?auto_111508 ) ) ( not ( = ?auto_111510 ?auto_111507 ) ) ( not ( = ?auto_111510 ?auto_111509 ) ) ( not ( = ?auto_111510 ?auto_111506 ) ) ( not ( = ?auto_111510 ?auto_111505 ) ) ( not ( = ?auto_111508 ?auto_111507 ) ) ( not ( = ?auto_111508 ?auto_111509 ) ) ( not ( = ?auto_111508 ?auto_111506 ) ) ( not ( = ?auto_111508 ?auto_111505 ) ) ( not ( = ?auto_111507 ?auto_111509 ) ) ( not ( = ?auto_111507 ?auto_111506 ) ) ( not ( = ?auto_111507 ?auto_111505 ) ) ( not ( = ?auto_111504 ?auto_111510 ) ) ( not ( = ?auto_111504 ?auto_111508 ) ) ( not ( = ?auto_111504 ?auto_111507 ) ) ( ON ?auto_111504 ?auto_111511 ) ( not ( = ?auto_111504 ?auto_111511 ) ) ( not ( = ?auto_111505 ?auto_111511 ) ) ( not ( = ?auto_111506 ?auto_111511 ) ) ( not ( = ?auto_111509 ?auto_111511 ) ) ( not ( = ?auto_111510 ?auto_111511 ) ) ( not ( = ?auto_111508 ?auto_111511 ) ) ( not ( = ?auto_111507 ?auto_111511 ) ) ( ON ?auto_111505 ?auto_111504 ) ( ON-TABLE ?auto_111511 ) ( CLEAR ?auto_111509 ) ( ON ?auto_111506 ?auto_111505 ) ( CLEAR ?auto_111506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111511 ?auto_111504 ?auto_111505 )
      ( MAKE-3PILE ?auto_111504 ?auto_111505 ?auto_111506 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111512 - BLOCK
      ?auto_111513 - BLOCK
      ?auto_111514 - BLOCK
    )
    :vars
    (
      ?auto_111516 - BLOCK
      ?auto_111518 - BLOCK
      ?auto_111515 - BLOCK
      ?auto_111519 - BLOCK
      ?auto_111517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111512 ?auto_111513 ) ) ( not ( = ?auto_111512 ?auto_111514 ) ) ( not ( = ?auto_111513 ?auto_111514 ) ) ( not ( = ?auto_111512 ?auto_111516 ) ) ( not ( = ?auto_111513 ?auto_111516 ) ) ( not ( = ?auto_111514 ?auto_111516 ) ) ( ON-TABLE ?auto_111518 ) ( ON ?auto_111515 ?auto_111518 ) ( ON ?auto_111519 ?auto_111515 ) ( not ( = ?auto_111518 ?auto_111515 ) ) ( not ( = ?auto_111518 ?auto_111519 ) ) ( not ( = ?auto_111518 ?auto_111516 ) ) ( not ( = ?auto_111518 ?auto_111514 ) ) ( not ( = ?auto_111518 ?auto_111513 ) ) ( not ( = ?auto_111515 ?auto_111519 ) ) ( not ( = ?auto_111515 ?auto_111516 ) ) ( not ( = ?auto_111515 ?auto_111514 ) ) ( not ( = ?auto_111515 ?auto_111513 ) ) ( not ( = ?auto_111519 ?auto_111516 ) ) ( not ( = ?auto_111519 ?auto_111514 ) ) ( not ( = ?auto_111519 ?auto_111513 ) ) ( not ( = ?auto_111512 ?auto_111518 ) ) ( not ( = ?auto_111512 ?auto_111515 ) ) ( not ( = ?auto_111512 ?auto_111519 ) ) ( ON ?auto_111512 ?auto_111517 ) ( not ( = ?auto_111512 ?auto_111517 ) ) ( not ( = ?auto_111513 ?auto_111517 ) ) ( not ( = ?auto_111514 ?auto_111517 ) ) ( not ( = ?auto_111516 ?auto_111517 ) ) ( not ( = ?auto_111518 ?auto_111517 ) ) ( not ( = ?auto_111515 ?auto_111517 ) ) ( not ( = ?auto_111519 ?auto_111517 ) ) ( ON ?auto_111513 ?auto_111512 ) ( ON-TABLE ?auto_111517 ) ( ON ?auto_111514 ?auto_111513 ) ( CLEAR ?auto_111514 ) ( HOLDING ?auto_111516 ) ( CLEAR ?auto_111519 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111518 ?auto_111515 ?auto_111519 ?auto_111516 )
      ( MAKE-3PILE ?auto_111512 ?auto_111513 ?auto_111514 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111520 - BLOCK
      ?auto_111521 - BLOCK
      ?auto_111522 - BLOCK
    )
    :vars
    (
      ?auto_111524 - BLOCK
      ?auto_111526 - BLOCK
      ?auto_111523 - BLOCK
      ?auto_111525 - BLOCK
      ?auto_111527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111520 ?auto_111521 ) ) ( not ( = ?auto_111520 ?auto_111522 ) ) ( not ( = ?auto_111521 ?auto_111522 ) ) ( not ( = ?auto_111520 ?auto_111524 ) ) ( not ( = ?auto_111521 ?auto_111524 ) ) ( not ( = ?auto_111522 ?auto_111524 ) ) ( ON-TABLE ?auto_111526 ) ( ON ?auto_111523 ?auto_111526 ) ( ON ?auto_111525 ?auto_111523 ) ( not ( = ?auto_111526 ?auto_111523 ) ) ( not ( = ?auto_111526 ?auto_111525 ) ) ( not ( = ?auto_111526 ?auto_111524 ) ) ( not ( = ?auto_111526 ?auto_111522 ) ) ( not ( = ?auto_111526 ?auto_111521 ) ) ( not ( = ?auto_111523 ?auto_111525 ) ) ( not ( = ?auto_111523 ?auto_111524 ) ) ( not ( = ?auto_111523 ?auto_111522 ) ) ( not ( = ?auto_111523 ?auto_111521 ) ) ( not ( = ?auto_111525 ?auto_111524 ) ) ( not ( = ?auto_111525 ?auto_111522 ) ) ( not ( = ?auto_111525 ?auto_111521 ) ) ( not ( = ?auto_111520 ?auto_111526 ) ) ( not ( = ?auto_111520 ?auto_111523 ) ) ( not ( = ?auto_111520 ?auto_111525 ) ) ( ON ?auto_111520 ?auto_111527 ) ( not ( = ?auto_111520 ?auto_111527 ) ) ( not ( = ?auto_111521 ?auto_111527 ) ) ( not ( = ?auto_111522 ?auto_111527 ) ) ( not ( = ?auto_111524 ?auto_111527 ) ) ( not ( = ?auto_111526 ?auto_111527 ) ) ( not ( = ?auto_111523 ?auto_111527 ) ) ( not ( = ?auto_111525 ?auto_111527 ) ) ( ON ?auto_111521 ?auto_111520 ) ( ON-TABLE ?auto_111527 ) ( ON ?auto_111522 ?auto_111521 ) ( CLEAR ?auto_111525 ) ( ON ?auto_111524 ?auto_111522 ) ( CLEAR ?auto_111524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111527 ?auto_111520 ?auto_111521 ?auto_111522 )
      ( MAKE-3PILE ?auto_111520 ?auto_111521 ?auto_111522 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111528 - BLOCK
      ?auto_111529 - BLOCK
      ?auto_111530 - BLOCK
    )
    :vars
    (
      ?auto_111535 - BLOCK
      ?auto_111532 - BLOCK
      ?auto_111533 - BLOCK
      ?auto_111531 - BLOCK
      ?auto_111534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111528 ?auto_111529 ) ) ( not ( = ?auto_111528 ?auto_111530 ) ) ( not ( = ?auto_111529 ?auto_111530 ) ) ( not ( = ?auto_111528 ?auto_111535 ) ) ( not ( = ?auto_111529 ?auto_111535 ) ) ( not ( = ?auto_111530 ?auto_111535 ) ) ( ON-TABLE ?auto_111532 ) ( ON ?auto_111533 ?auto_111532 ) ( not ( = ?auto_111532 ?auto_111533 ) ) ( not ( = ?auto_111532 ?auto_111531 ) ) ( not ( = ?auto_111532 ?auto_111535 ) ) ( not ( = ?auto_111532 ?auto_111530 ) ) ( not ( = ?auto_111532 ?auto_111529 ) ) ( not ( = ?auto_111533 ?auto_111531 ) ) ( not ( = ?auto_111533 ?auto_111535 ) ) ( not ( = ?auto_111533 ?auto_111530 ) ) ( not ( = ?auto_111533 ?auto_111529 ) ) ( not ( = ?auto_111531 ?auto_111535 ) ) ( not ( = ?auto_111531 ?auto_111530 ) ) ( not ( = ?auto_111531 ?auto_111529 ) ) ( not ( = ?auto_111528 ?auto_111532 ) ) ( not ( = ?auto_111528 ?auto_111533 ) ) ( not ( = ?auto_111528 ?auto_111531 ) ) ( ON ?auto_111528 ?auto_111534 ) ( not ( = ?auto_111528 ?auto_111534 ) ) ( not ( = ?auto_111529 ?auto_111534 ) ) ( not ( = ?auto_111530 ?auto_111534 ) ) ( not ( = ?auto_111535 ?auto_111534 ) ) ( not ( = ?auto_111532 ?auto_111534 ) ) ( not ( = ?auto_111533 ?auto_111534 ) ) ( not ( = ?auto_111531 ?auto_111534 ) ) ( ON ?auto_111529 ?auto_111528 ) ( ON-TABLE ?auto_111534 ) ( ON ?auto_111530 ?auto_111529 ) ( ON ?auto_111535 ?auto_111530 ) ( CLEAR ?auto_111535 ) ( HOLDING ?auto_111531 ) ( CLEAR ?auto_111533 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111532 ?auto_111533 ?auto_111531 )
      ( MAKE-3PILE ?auto_111528 ?auto_111529 ?auto_111530 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111536 - BLOCK
      ?auto_111537 - BLOCK
      ?auto_111538 - BLOCK
    )
    :vars
    (
      ?auto_111541 - BLOCK
      ?auto_111540 - BLOCK
      ?auto_111543 - BLOCK
      ?auto_111542 - BLOCK
      ?auto_111539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111536 ?auto_111537 ) ) ( not ( = ?auto_111536 ?auto_111538 ) ) ( not ( = ?auto_111537 ?auto_111538 ) ) ( not ( = ?auto_111536 ?auto_111541 ) ) ( not ( = ?auto_111537 ?auto_111541 ) ) ( not ( = ?auto_111538 ?auto_111541 ) ) ( ON-TABLE ?auto_111540 ) ( ON ?auto_111543 ?auto_111540 ) ( not ( = ?auto_111540 ?auto_111543 ) ) ( not ( = ?auto_111540 ?auto_111542 ) ) ( not ( = ?auto_111540 ?auto_111541 ) ) ( not ( = ?auto_111540 ?auto_111538 ) ) ( not ( = ?auto_111540 ?auto_111537 ) ) ( not ( = ?auto_111543 ?auto_111542 ) ) ( not ( = ?auto_111543 ?auto_111541 ) ) ( not ( = ?auto_111543 ?auto_111538 ) ) ( not ( = ?auto_111543 ?auto_111537 ) ) ( not ( = ?auto_111542 ?auto_111541 ) ) ( not ( = ?auto_111542 ?auto_111538 ) ) ( not ( = ?auto_111542 ?auto_111537 ) ) ( not ( = ?auto_111536 ?auto_111540 ) ) ( not ( = ?auto_111536 ?auto_111543 ) ) ( not ( = ?auto_111536 ?auto_111542 ) ) ( ON ?auto_111536 ?auto_111539 ) ( not ( = ?auto_111536 ?auto_111539 ) ) ( not ( = ?auto_111537 ?auto_111539 ) ) ( not ( = ?auto_111538 ?auto_111539 ) ) ( not ( = ?auto_111541 ?auto_111539 ) ) ( not ( = ?auto_111540 ?auto_111539 ) ) ( not ( = ?auto_111543 ?auto_111539 ) ) ( not ( = ?auto_111542 ?auto_111539 ) ) ( ON ?auto_111537 ?auto_111536 ) ( ON-TABLE ?auto_111539 ) ( ON ?auto_111538 ?auto_111537 ) ( ON ?auto_111541 ?auto_111538 ) ( CLEAR ?auto_111543 ) ( ON ?auto_111542 ?auto_111541 ) ( CLEAR ?auto_111542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111539 ?auto_111536 ?auto_111537 ?auto_111538 ?auto_111541 )
      ( MAKE-3PILE ?auto_111536 ?auto_111537 ?auto_111538 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111544 - BLOCK
      ?auto_111545 - BLOCK
      ?auto_111546 - BLOCK
    )
    :vars
    (
      ?auto_111548 - BLOCK
      ?auto_111547 - BLOCK
      ?auto_111550 - BLOCK
      ?auto_111549 - BLOCK
      ?auto_111551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111544 ?auto_111545 ) ) ( not ( = ?auto_111544 ?auto_111546 ) ) ( not ( = ?auto_111545 ?auto_111546 ) ) ( not ( = ?auto_111544 ?auto_111548 ) ) ( not ( = ?auto_111545 ?auto_111548 ) ) ( not ( = ?auto_111546 ?auto_111548 ) ) ( ON-TABLE ?auto_111547 ) ( not ( = ?auto_111547 ?auto_111550 ) ) ( not ( = ?auto_111547 ?auto_111549 ) ) ( not ( = ?auto_111547 ?auto_111548 ) ) ( not ( = ?auto_111547 ?auto_111546 ) ) ( not ( = ?auto_111547 ?auto_111545 ) ) ( not ( = ?auto_111550 ?auto_111549 ) ) ( not ( = ?auto_111550 ?auto_111548 ) ) ( not ( = ?auto_111550 ?auto_111546 ) ) ( not ( = ?auto_111550 ?auto_111545 ) ) ( not ( = ?auto_111549 ?auto_111548 ) ) ( not ( = ?auto_111549 ?auto_111546 ) ) ( not ( = ?auto_111549 ?auto_111545 ) ) ( not ( = ?auto_111544 ?auto_111547 ) ) ( not ( = ?auto_111544 ?auto_111550 ) ) ( not ( = ?auto_111544 ?auto_111549 ) ) ( ON ?auto_111544 ?auto_111551 ) ( not ( = ?auto_111544 ?auto_111551 ) ) ( not ( = ?auto_111545 ?auto_111551 ) ) ( not ( = ?auto_111546 ?auto_111551 ) ) ( not ( = ?auto_111548 ?auto_111551 ) ) ( not ( = ?auto_111547 ?auto_111551 ) ) ( not ( = ?auto_111550 ?auto_111551 ) ) ( not ( = ?auto_111549 ?auto_111551 ) ) ( ON ?auto_111545 ?auto_111544 ) ( ON-TABLE ?auto_111551 ) ( ON ?auto_111546 ?auto_111545 ) ( ON ?auto_111548 ?auto_111546 ) ( ON ?auto_111549 ?auto_111548 ) ( CLEAR ?auto_111549 ) ( HOLDING ?auto_111550 ) ( CLEAR ?auto_111547 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111547 ?auto_111550 )
      ( MAKE-3PILE ?auto_111544 ?auto_111545 ?auto_111546 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111552 - BLOCK
      ?auto_111553 - BLOCK
      ?auto_111554 - BLOCK
    )
    :vars
    (
      ?auto_111556 - BLOCK
      ?auto_111559 - BLOCK
      ?auto_111558 - BLOCK
      ?auto_111557 - BLOCK
      ?auto_111555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111552 ?auto_111553 ) ) ( not ( = ?auto_111552 ?auto_111554 ) ) ( not ( = ?auto_111553 ?auto_111554 ) ) ( not ( = ?auto_111552 ?auto_111556 ) ) ( not ( = ?auto_111553 ?auto_111556 ) ) ( not ( = ?auto_111554 ?auto_111556 ) ) ( ON-TABLE ?auto_111559 ) ( not ( = ?auto_111559 ?auto_111558 ) ) ( not ( = ?auto_111559 ?auto_111557 ) ) ( not ( = ?auto_111559 ?auto_111556 ) ) ( not ( = ?auto_111559 ?auto_111554 ) ) ( not ( = ?auto_111559 ?auto_111553 ) ) ( not ( = ?auto_111558 ?auto_111557 ) ) ( not ( = ?auto_111558 ?auto_111556 ) ) ( not ( = ?auto_111558 ?auto_111554 ) ) ( not ( = ?auto_111558 ?auto_111553 ) ) ( not ( = ?auto_111557 ?auto_111556 ) ) ( not ( = ?auto_111557 ?auto_111554 ) ) ( not ( = ?auto_111557 ?auto_111553 ) ) ( not ( = ?auto_111552 ?auto_111559 ) ) ( not ( = ?auto_111552 ?auto_111558 ) ) ( not ( = ?auto_111552 ?auto_111557 ) ) ( ON ?auto_111552 ?auto_111555 ) ( not ( = ?auto_111552 ?auto_111555 ) ) ( not ( = ?auto_111553 ?auto_111555 ) ) ( not ( = ?auto_111554 ?auto_111555 ) ) ( not ( = ?auto_111556 ?auto_111555 ) ) ( not ( = ?auto_111559 ?auto_111555 ) ) ( not ( = ?auto_111558 ?auto_111555 ) ) ( not ( = ?auto_111557 ?auto_111555 ) ) ( ON ?auto_111553 ?auto_111552 ) ( ON-TABLE ?auto_111555 ) ( ON ?auto_111554 ?auto_111553 ) ( ON ?auto_111556 ?auto_111554 ) ( ON ?auto_111557 ?auto_111556 ) ( CLEAR ?auto_111559 ) ( ON ?auto_111558 ?auto_111557 ) ( CLEAR ?auto_111558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111555 ?auto_111552 ?auto_111553 ?auto_111554 ?auto_111556 ?auto_111557 )
      ( MAKE-3PILE ?auto_111552 ?auto_111553 ?auto_111554 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111560 - BLOCK
      ?auto_111561 - BLOCK
      ?auto_111562 - BLOCK
    )
    :vars
    (
      ?auto_111566 - BLOCK
      ?auto_111565 - BLOCK
      ?auto_111563 - BLOCK
      ?auto_111567 - BLOCK
      ?auto_111564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111560 ?auto_111561 ) ) ( not ( = ?auto_111560 ?auto_111562 ) ) ( not ( = ?auto_111561 ?auto_111562 ) ) ( not ( = ?auto_111560 ?auto_111566 ) ) ( not ( = ?auto_111561 ?auto_111566 ) ) ( not ( = ?auto_111562 ?auto_111566 ) ) ( not ( = ?auto_111565 ?auto_111563 ) ) ( not ( = ?auto_111565 ?auto_111567 ) ) ( not ( = ?auto_111565 ?auto_111566 ) ) ( not ( = ?auto_111565 ?auto_111562 ) ) ( not ( = ?auto_111565 ?auto_111561 ) ) ( not ( = ?auto_111563 ?auto_111567 ) ) ( not ( = ?auto_111563 ?auto_111566 ) ) ( not ( = ?auto_111563 ?auto_111562 ) ) ( not ( = ?auto_111563 ?auto_111561 ) ) ( not ( = ?auto_111567 ?auto_111566 ) ) ( not ( = ?auto_111567 ?auto_111562 ) ) ( not ( = ?auto_111567 ?auto_111561 ) ) ( not ( = ?auto_111560 ?auto_111565 ) ) ( not ( = ?auto_111560 ?auto_111563 ) ) ( not ( = ?auto_111560 ?auto_111567 ) ) ( ON ?auto_111560 ?auto_111564 ) ( not ( = ?auto_111560 ?auto_111564 ) ) ( not ( = ?auto_111561 ?auto_111564 ) ) ( not ( = ?auto_111562 ?auto_111564 ) ) ( not ( = ?auto_111566 ?auto_111564 ) ) ( not ( = ?auto_111565 ?auto_111564 ) ) ( not ( = ?auto_111563 ?auto_111564 ) ) ( not ( = ?auto_111567 ?auto_111564 ) ) ( ON ?auto_111561 ?auto_111560 ) ( ON-TABLE ?auto_111564 ) ( ON ?auto_111562 ?auto_111561 ) ( ON ?auto_111566 ?auto_111562 ) ( ON ?auto_111567 ?auto_111566 ) ( ON ?auto_111563 ?auto_111567 ) ( CLEAR ?auto_111563 ) ( HOLDING ?auto_111565 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111565 )
      ( MAKE-3PILE ?auto_111560 ?auto_111561 ?auto_111562 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111568 - BLOCK
      ?auto_111569 - BLOCK
      ?auto_111570 - BLOCK
    )
    :vars
    (
      ?auto_111571 - BLOCK
      ?auto_111572 - BLOCK
      ?auto_111573 - BLOCK
      ?auto_111574 - BLOCK
      ?auto_111575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111568 ?auto_111569 ) ) ( not ( = ?auto_111568 ?auto_111570 ) ) ( not ( = ?auto_111569 ?auto_111570 ) ) ( not ( = ?auto_111568 ?auto_111571 ) ) ( not ( = ?auto_111569 ?auto_111571 ) ) ( not ( = ?auto_111570 ?auto_111571 ) ) ( not ( = ?auto_111572 ?auto_111573 ) ) ( not ( = ?auto_111572 ?auto_111574 ) ) ( not ( = ?auto_111572 ?auto_111571 ) ) ( not ( = ?auto_111572 ?auto_111570 ) ) ( not ( = ?auto_111572 ?auto_111569 ) ) ( not ( = ?auto_111573 ?auto_111574 ) ) ( not ( = ?auto_111573 ?auto_111571 ) ) ( not ( = ?auto_111573 ?auto_111570 ) ) ( not ( = ?auto_111573 ?auto_111569 ) ) ( not ( = ?auto_111574 ?auto_111571 ) ) ( not ( = ?auto_111574 ?auto_111570 ) ) ( not ( = ?auto_111574 ?auto_111569 ) ) ( not ( = ?auto_111568 ?auto_111572 ) ) ( not ( = ?auto_111568 ?auto_111573 ) ) ( not ( = ?auto_111568 ?auto_111574 ) ) ( ON ?auto_111568 ?auto_111575 ) ( not ( = ?auto_111568 ?auto_111575 ) ) ( not ( = ?auto_111569 ?auto_111575 ) ) ( not ( = ?auto_111570 ?auto_111575 ) ) ( not ( = ?auto_111571 ?auto_111575 ) ) ( not ( = ?auto_111572 ?auto_111575 ) ) ( not ( = ?auto_111573 ?auto_111575 ) ) ( not ( = ?auto_111574 ?auto_111575 ) ) ( ON ?auto_111569 ?auto_111568 ) ( ON-TABLE ?auto_111575 ) ( ON ?auto_111570 ?auto_111569 ) ( ON ?auto_111571 ?auto_111570 ) ( ON ?auto_111574 ?auto_111571 ) ( ON ?auto_111573 ?auto_111574 ) ( ON ?auto_111572 ?auto_111573 ) ( CLEAR ?auto_111572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111575 ?auto_111568 ?auto_111569 ?auto_111570 ?auto_111571 ?auto_111574 ?auto_111573 )
      ( MAKE-3PILE ?auto_111568 ?auto_111569 ?auto_111570 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111579 - BLOCK
      ?auto_111580 - BLOCK
      ?auto_111581 - BLOCK
    )
    :vars
    (
      ?auto_111582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111582 ?auto_111581 ) ( CLEAR ?auto_111582 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111579 ) ( ON ?auto_111580 ?auto_111579 ) ( ON ?auto_111581 ?auto_111580 ) ( not ( = ?auto_111579 ?auto_111580 ) ) ( not ( = ?auto_111579 ?auto_111581 ) ) ( not ( = ?auto_111579 ?auto_111582 ) ) ( not ( = ?auto_111580 ?auto_111581 ) ) ( not ( = ?auto_111580 ?auto_111582 ) ) ( not ( = ?auto_111581 ?auto_111582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111582 ?auto_111581 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111583 - BLOCK
      ?auto_111584 - BLOCK
      ?auto_111585 - BLOCK
    )
    :vars
    (
      ?auto_111586 - BLOCK
      ?auto_111587 - BLOCK
      ?auto_111588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111586 ?auto_111585 ) ( CLEAR ?auto_111586 ) ( ON-TABLE ?auto_111583 ) ( ON ?auto_111584 ?auto_111583 ) ( ON ?auto_111585 ?auto_111584 ) ( not ( = ?auto_111583 ?auto_111584 ) ) ( not ( = ?auto_111583 ?auto_111585 ) ) ( not ( = ?auto_111583 ?auto_111586 ) ) ( not ( = ?auto_111584 ?auto_111585 ) ) ( not ( = ?auto_111584 ?auto_111586 ) ) ( not ( = ?auto_111585 ?auto_111586 ) ) ( HOLDING ?auto_111587 ) ( CLEAR ?auto_111588 ) ( not ( = ?auto_111583 ?auto_111587 ) ) ( not ( = ?auto_111583 ?auto_111588 ) ) ( not ( = ?auto_111584 ?auto_111587 ) ) ( not ( = ?auto_111584 ?auto_111588 ) ) ( not ( = ?auto_111585 ?auto_111587 ) ) ( not ( = ?auto_111585 ?auto_111588 ) ) ( not ( = ?auto_111586 ?auto_111587 ) ) ( not ( = ?auto_111586 ?auto_111588 ) ) ( not ( = ?auto_111587 ?auto_111588 ) ) )
    :subtasks
    ( ( !STACK ?auto_111587 ?auto_111588 )
      ( MAKE-3PILE ?auto_111583 ?auto_111584 ?auto_111585 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111589 - BLOCK
      ?auto_111590 - BLOCK
      ?auto_111591 - BLOCK
    )
    :vars
    (
      ?auto_111593 - BLOCK
      ?auto_111592 - BLOCK
      ?auto_111594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111593 ?auto_111591 ) ( ON-TABLE ?auto_111589 ) ( ON ?auto_111590 ?auto_111589 ) ( ON ?auto_111591 ?auto_111590 ) ( not ( = ?auto_111589 ?auto_111590 ) ) ( not ( = ?auto_111589 ?auto_111591 ) ) ( not ( = ?auto_111589 ?auto_111593 ) ) ( not ( = ?auto_111590 ?auto_111591 ) ) ( not ( = ?auto_111590 ?auto_111593 ) ) ( not ( = ?auto_111591 ?auto_111593 ) ) ( CLEAR ?auto_111592 ) ( not ( = ?auto_111589 ?auto_111594 ) ) ( not ( = ?auto_111589 ?auto_111592 ) ) ( not ( = ?auto_111590 ?auto_111594 ) ) ( not ( = ?auto_111590 ?auto_111592 ) ) ( not ( = ?auto_111591 ?auto_111594 ) ) ( not ( = ?auto_111591 ?auto_111592 ) ) ( not ( = ?auto_111593 ?auto_111594 ) ) ( not ( = ?auto_111593 ?auto_111592 ) ) ( not ( = ?auto_111594 ?auto_111592 ) ) ( ON ?auto_111594 ?auto_111593 ) ( CLEAR ?auto_111594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111589 ?auto_111590 ?auto_111591 ?auto_111593 )
      ( MAKE-3PILE ?auto_111589 ?auto_111590 ?auto_111591 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111595 - BLOCK
      ?auto_111596 - BLOCK
      ?auto_111597 - BLOCK
    )
    :vars
    (
      ?auto_111600 - BLOCK
      ?auto_111598 - BLOCK
      ?auto_111599 - BLOCK
      ?auto_111601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111600 ?auto_111597 ) ( ON-TABLE ?auto_111595 ) ( ON ?auto_111596 ?auto_111595 ) ( ON ?auto_111597 ?auto_111596 ) ( not ( = ?auto_111595 ?auto_111596 ) ) ( not ( = ?auto_111595 ?auto_111597 ) ) ( not ( = ?auto_111595 ?auto_111600 ) ) ( not ( = ?auto_111596 ?auto_111597 ) ) ( not ( = ?auto_111596 ?auto_111600 ) ) ( not ( = ?auto_111597 ?auto_111600 ) ) ( not ( = ?auto_111595 ?auto_111598 ) ) ( not ( = ?auto_111595 ?auto_111599 ) ) ( not ( = ?auto_111596 ?auto_111598 ) ) ( not ( = ?auto_111596 ?auto_111599 ) ) ( not ( = ?auto_111597 ?auto_111598 ) ) ( not ( = ?auto_111597 ?auto_111599 ) ) ( not ( = ?auto_111600 ?auto_111598 ) ) ( not ( = ?auto_111600 ?auto_111599 ) ) ( not ( = ?auto_111598 ?auto_111599 ) ) ( ON ?auto_111598 ?auto_111600 ) ( CLEAR ?auto_111598 ) ( HOLDING ?auto_111599 ) ( CLEAR ?auto_111601 ) ( ON-TABLE ?auto_111601 ) ( not ( = ?auto_111601 ?auto_111599 ) ) ( not ( = ?auto_111595 ?auto_111601 ) ) ( not ( = ?auto_111596 ?auto_111601 ) ) ( not ( = ?auto_111597 ?auto_111601 ) ) ( not ( = ?auto_111600 ?auto_111601 ) ) ( not ( = ?auto_111598 ?auto_111601 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111601 ?auto_111599 )
      ( MAKE-3PILE ?auto_111595 ?auto_111596 ?auto_111597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111602 - BLOCK
      ?auto_111603 - BLOCK
      ?auto_111604 - BLOCK
    )
    :vars
    (
      ?auto_111608 - BLOCK
      ?auto_111606 - BLOCK
      ?auto_111605 - BLOCK
      ?auto_111607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111608 ?auto_111604 ) ( ON-TABLE ?auto_111602 ) ( ON ?auto_111603 ?auto_111602 ) ( ON ?auto_111604 ?auto_111603 ) ( not ( = ?auto_111602 ?auto_111603 ) ) ( not ( = ?auto_111602 ?auto_111604 ) ) ( not ( = ?auto_111602 ?auto_111608 ) ) ( not ( = ?auto_111603 ?auto_111604 ) ) ( not ( = ?auto_111603 ?auto_111608 ) ) ( not ( = ?auto_111604 ?auto_111608 ) ) ( not ( = ?auto_111602 ?auto_111606 ) ) ( not ( = ?auto_111602 ?auto_111605 ) ) ( not ( = ?auto_111603 ?auto_111606 ) ) ( not ( = ?auto_111603 ?auto_111605 ) ) ( not ( = ?auto_111604 ?auto_111606 ) ) ( not ( = ?auto_111604 ?auto_111605 ) ) ( not ( = ?auto_111608 ?auto_111606 ) ) ( not ( = ?auto_111608 ?auto_111605 ) ) ( not ( = ?auto_111606 ?auto_111605 ) ) ( ON ?auto_111606 ?auto_111608 ) ( CLEAR ?auto_111607 ) ( ON-TABLE ?auto_111607 ) ( not ( = ?auto_111607 ?auto_111605 ) ) ( not ( = ?auto_111602 ?auto_111607 ) ) ( not ( = ?auto_111603 ?auto_111607 ) ) ( not ( = ?auto_111604 ?auto_111607 ) ) ( not ( = ?auto_111608 ?auto_111607 ) ) ( not ( = ?auto_111606 ?auto_111607 ) ) ( ON ?auto_111605 ?auto_111606 ) ( CLEAR ?auto_111605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111602 ?auto_111603 ?auto_111604 ?auto_111608 ?auto_111606 )
      ( MAKE-3PILE ?auto_111602 ?auto_111603 ?auto_111604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111609 - BLOCK
      ?auto_111610 - BLOCK
      ?auto_111611 - BLOCK
    )
    :vars
    (
      ?auto_111612 - BLOCK
      ?auto_111613 - BLOCK
      ?auto_111614 - BLOCK
      ?auto_111615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111612 ?auto_111611 ) ( ON-TABLE ?auto_111609 ) ( ON ?auto_111610 ?auto_111609 ) ( ON ?auto_111611 ?auto_111610 ) ( not ( = ?auto_111609 ?auto_111610 ) ) ( not ( = ?auto_111609 ?auto_111611 ) ) ( not ( = ?auto_111609 ?auto_111612 ) ) ( not ( = ?auto_111610 ?auto_111611 ) ) ( not ( = ?auto_111610 ?auto_111612 ) ) ( not ( = ?auto_111611 ?auto_111612 ) ) ( not ( = ?auto_111609 ?auto_111613 ) ) ( not ( = ?auto_111609 ?auto_111614 ) ) ( not ( = ?auto_111610 ?auto_111613 ) ) ( not ( = ?auto_111610 ?auto_111614 ) ) ( not ( = ?auto_111611 ?auto_111613 ) ) ( not ( = ?auto_111611 ?auto_111614 ) ) ( not ( = ?auto_111612 ?auto_111613 ) ) ( not ( = ?auto_111612 ?auto_111614 ) ) ( not ( = ?auto_111613 ?auto_111614 ) ) ( ON ?auto_111613 ?auto_111612 ) ( not ( = ?auto_111615 ?auto_111614 ) ) ( not ( = ?auto_111609 ?auto_111615 ) ) ( not ( = ?auto_111610 ?auto_111615 ) ) ( not ( = ?auto_111611 ?auto_111615 ) ) ( not ( = ?auto_111612 ?auto_111615 ) ) ( not ( = ?auto_111613 ?auto_111615 ) ) ( ON ?auto_111614 ?auto_111613 ) ( CLEAR ?auto_111614 ) ( HOLDING ?auto_111615 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111615 )
      ( MAKE-3PILE ?auto_111609 ?auto_111610 ?auto_111611 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111616 - BLOCK
      ?auto_111617 - BLOCK
      ?auto_111618 - BLOCK
    )
    :vars
    (
      ?auto_111619 - BLOCK
      ?auto_111620 - BLOCK
      ?auto_111621 - BLOCK
      ?auto_111622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111619 ?auto_111618 ) ( ON-TABLE ?auto_111616 ) ( ON ?auto_111617 ?auto_111616 ) ( ON ?auto_111618 ?auto_111617 ) ( not ( = ?auto_111616 ?auto_111617 ) ) ( not ( = ?auto_111616 ?auto_111618 ) ) ( not ( = ?auto_111616 ?auto_111619 ) ) ( not ( = ?auto_111617 ?auto_111618 ) ) ( not ( = ?auto_111617 ?auto_111619 ) ) ( not ( = ?auto_111618 ?auto_111619 ) ) ( not ( = ?auto_111616 ?auto_111620 ) ) ( not ( = ?auto_111616 ?auto_111621 ) ) ( not ( = ?auto_111617 ?auto_111620 ) ) ( not ( = ?auto_111617 ?auto_111621 ) ) ( not ( = ?auto_111618 ?auto_111620 ) ) ( not ( = ?auto_111618 ?auto_111621 ) ) ( not ( = ?auto_111619 ?auto_111620 ) ) ( not ( = ?auto_111619 ?auto_111621 ) ) ( not ( = ?auto_111620 ?auto_111621 ) ) ( ON ?auto_111620 ?auto_111619 ) ( not ( = ?auto_111622 ?auto_111621 ) ) ( not ( = ?auto_111616 ?auto_111622 ) ) ( not ( = ?auto_111617 ?auto_111622 ) ) ( not ( = ?auto_111618 ?auto_111622 ) ) ( not ( = ?auto_111619 ?auto_111622 ) ) ( not ( = ?auto_111620 ?auto_111622 ) ) ( ON ?auto_111621 ?auto_111620 ) ( ON ?auto_111622 ?auto_111621 ) ( CLEAR ?auto_111622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111616 ?auto_111617 ?auto_111618 ?auto_111619 ?auto_111620 ?auto_111621 )
      ( MAKE-3PILE ?auto_111616 ?auto_111617 ?auto_111618 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111623 - BLOCK
      ?auto_111624 - BLOCK
      ?auto_111625 - BLOCK
    )
    :vars
    (
      ?auto_111627 - BLOCK
      ?auto_111626 - BLOCK
      ?auto_111628 - BLOCK
      ?auto_111629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111627 ?auto_111625 ) ( ON-TABLE ?auto_111623 ) ( ON ?auto_111624 ?auto_111623 ) ( ON ?auto_111625 ?auto_111624 ) ( not ( = ?auto_111623 ?auto_111624 ) ) ( not ( = ?auto_111623 ?auto_111625 ) ) ( not ( = ?auto_111623 ?auto_111627 ) ) ( not ( = ?auto_111624 ?auto_111625 ) ) ( not ( = ?auto_111624 ?auto_111627 ) ) ( not ( = ?auto_111625 ?auto_111627 ) ) ( not ( = ?auto_111623 ?auto_111626 ) ) ( not ( = ?auto_111623 ?auto_111628 ) ) ( not ( = ?auto_111624 ?auto_111626 ) ) ( not ( = ?auto_111624 ?auto_111628 ) ) ( not ( = ?auto_111625 ?auto_111626 ) ) ( not ( = ?auto_111625 ?auto_111628 ) ) ( not ( = ?auto_111627 ?auto_111626 ) ) ( not ( = ?auto_111627 ?auto_111628 ) ) ( not ( = ?auto_111626 ?auto_111628 ) ) ( ON ?auto_111626 ?auto_111627 ) ( not ( = ?auto_111629 ?auto_111628 ) ) ( not ( = ?auto_111623 ?auto_111629 ) ) ( not ( = ?auto_111624 ?auto_111629 ) ) ( not ( = ?auto_111625 ?auto_111629 ) ) ( not ( = ?auto_111627 ?auto_111629 ) ) ( not ( = ?auto_111626 ?auto_111629 ) ) ( ON ?auto_111628 ?auto_111626 ) ( HOLDING ?auto_111629 ) ( CLEAR ?auto_111628 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111623 ?auto_111624 ?auto_111625 ?auto_111627 ?auto_111626 ?auto_111628 ?auto_111629 )
      ( MAKE-3PILE ?auto_111623 ?auto_111624 ?auto_111625 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111630 - BLOCK
      ?auto_111631 - BLOCK
      ?auto_111632 - BLOCK
    )
    :vars
    (
      ?auto_111634 - BLOCK
      ?auto_111635 - BLOCK
      ?auto_111633 - BLOCK
      ?auto_111636 - BLOCK
      ?auto_111637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111634 ?auto_111632 ) ( ON-TABLE ?auto_111630 ) ( ON ?auto_111631 ?auto_111630 ) ( ON ?auto_111632 ?auto_111631 ) ( not ( = ?auto_111630 ?auto_111631 ) ) ( not ( = ?auto_111630 ?auto_111632 ) ) ( not ( = ?auto_111630 ?auto_111634 ) ) ( not ( = ?auto_111631 ?auto_111632 ) ) ( not ( = ?auto_111631 ?auto_111634 ) ) ( not ( = ?auto_111632 ?auto_111634 ) ) ( not ( = ?auto_111630 ?auto_111635 ) ) ( not ( = ?auto_111630 ?auto_111633 ) ) ( not ( = ?auto_111631 ?auto_111635 ) ) ( not ( = ?auto_111631 ?auto_111633 ) ) ( not ( = ?auto_111632 ?auto_111635 ) ) ( not ( = ?auto_111632 ?auto_111633 ) ) ( not ( = ?auto_111634 ?auto_111635 ) ) ( not ( = ?auto_111634 ?auto_111633 ) ) ( not ( = ?auto_111635 ?auto_111633 ) ) ( ON ?auto_111635 ?auto_111634 ) ( not ( = ?auto_111636 ?auto_111633 ) ) ( not ( = ?auto_111630 ?auto_111636 ) ) ( not ( = ?auto_111631 ?auto_111636 ) ) ( not ( = ?auto_111632 ?auto_111636 ) ) ( not ( = ?auto_111634 ?auto_111636 ) ) ( not ( = ?auto_111635 ?auto_111636 ) ) ( ON ?auto_111633 ?auto_111635 ) ( CLEAR ?auto_111633 ) ( ON ?auto_111636 ?auto_111637 ) ( CLEAR ?auto_111636 ) ( HAND-EMPTY ) ( not ( = ?auto_111630 ?auto_111637 ) ) ( not ( = ?auto_111631 ?auto_111637 ) ) ( not ( = ?auto_111632 ?auto_111637 ) ) ( not ( = ?auto_111634 ?auto_111637 ) ) ( not ( = ?auto_111635 ?auto_111637 ) ) ( not ( = ?auto_111633 ?auto_111637 ) ) ( not ( = ?auto_111636 ?auto_111637 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111636 ?auto_111637 )
      ( MAKE-3PILE ?auto_111630 ?auto_111631 ?auto_111632 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111638 - BLOCK
      ?auto_111639 - BLOCK
      ?auto_111640 - BLOCK
    )
    :vars
    (
      ?auto_111643 - BLOCK
      ?auto_111645 - BLOCK
      ?auto_111642 - BLOCK
      ?auto_111644 - BLOCK
      ?auto_111641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111643 ?auto_111640 ) ( ON-TABLE ?auto_111638 ) ( ON ?auto_111639 ?auto_111638 ) ( ON ?auto_111640 ?auto_111639 ) ( not ( = ?auto_111638 ?auto_111639 ) ) ( not ( = ?auto_111638 ?auto_111640 ) ) ( not ( = ?auto_111638 ?auto_111643 ) ) ( not ( = ?auto_111639 ?auto_111640 ) ) ( not ( = ?auto_111639 ?auto_111643 ) ) ( not ( = ?auto_111640 ?auto_111643 ) ) ( not ( = ?auto_111638 ?auto_111645 ) ) ( not ( = ?auto_111638 ?auto_111642 ) ) ( not ( = ?auto_111639 ?auto_111645 ) ) ( not ( = ?auto_111639 ?auto_111642 ) ) ( not ( = ?auto_111640 ?auto_111645 ) ) ( not ( = ?auto_111640 ?auto_111642 ) ) ( not ( = ?auto_111643 ?auto_111645 ) ) ( not ( = ?auto_111643 ?auto_111642 ) ) ( not ( = ?auto_111645 ?auto_111642 ) ) ( ON ?auto_111645 ?auto_111643 ) ( not ( = ?auto_111644 ?auto_111642 ) ) ( not ( = ?auto_111638 ?auto_111644 ) ) ( not ( = ?auto_111639 ?auto_111644 ) ) ( not ( = ?auto_111640 ?auto_111644 ) ) ( not ( = ?auto_111643 ?auto_111644 ) ) ( not ( = ?auto_111645 ?auto_111644 ) ) ( ON ?auto_111644 ?auto_111641 ) ( CLEAR ?auto_111644 ) ( not ( = ?auto_111638 ?auto_111641 ) ) ( not ( = ?auto_111639 ?auto_111641 ) ) ( not ( = ?auto_111640 ?auto_111641 ) ) ( not ( = ?auto_111643 ?auto_111641 ) ) ( not ( = ?auto_111645 ?auto_111641 ) ) ( not ( = ?auto_111642 ?auto_111641 ) ) ( not ( = ?auto_111644 ?auto_111641 ) ) ( HOLDING ?auto_111642 ) ( CLEAR ?auto_111645 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111638 ?auto_111639 ?auto_111640 ?auto_111643 ?auto_111645 ?auto_111642 )
      ( MAKE-3PILE ?auto_111638 ?auto_111639 ?auto_111640 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111646 - BLOCK
      ?auto_111647 - BLOCK
      ?auto_111648 - BLOCK
    )
    :vars
    (
      ?auto_111652 - BLOCK
      ?auto_111650 - BLOCK
      ?auto_111653 - BLOCK
      ?auto_111649 - BLOCK
      ?auto_111651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111652 ?auto_111648 ) ( ON-TABLE ?auto_111646 ) ( ON ?auto_111647 ?auto_111646 ) ( ON ?auto_111648 ?auto_111647 ) ( not ( = ?auto_111646 ?auto_111647 ) ) ( not ( = ?auto_111646 ?auto_111648 ) ) ( not ( = ?auto_111646 ?auto_111652 ) ) ( not ( = ?auto_111647 ?auto_111648 ) ) ( not ( = ?auto_111647 ?auto_111652 ) ) ( not ( = ?auto_111648 ?auto_111652 ) ) ( not ( = ?auto_111646 ?auto_111650 ) ) ( not ( = ?auto_111646 ?auto_111653 ) ) ( not ( = ?auto_111647 ?auto_111650 ) ) ( not ( = ?auto_111647 ?auto_111653 ) ) ( not ( = ?auto_111648 ?auto_111650 ) ) ( not ( = ?auto_111648 ?auto_111653 ) ) ( not ( = ?auto_111652 ?auto_111650 ) ) ( not ( = ?auto_111652 ?auto_111653 ) ) ( not ( = ?auto_111650 ?auto_111653 ) ) ( ON ?auto_111650 ?auto_111652 ) ( not ( = ?auto_111649 ?auto_111653 ) ) ( not ( = ?auto_111646 ?auto_111649 ) ) ( not ( = ?auto_111647 ?auto_111649 ) ) ( not ( = ?auto_111648 ?auto_111649 ) ) ( not ( = ?auto_111652 ?auto_111649 ) ) ( not ( = ?auto_111650 ?auto_111649 ) ) ( ON ?auto_111649 ?auto_111651 ) ( not ( = ?auto_111646 ?auto_111651 ) ) ( not ( = ?auto_111647 ?auto_111651 ) ) ( not ( = ?auto_111648 ?auto_111651 ) ) ( not ( = ?auto_111652 ?auto_111651 ) ) ( not ( = ?auto_111650 ?auto_111651 ) ) ( not ( = ?auto_111653 ?auto_111651 ) ) ( not ( = ?auto_111649 ?auto_111651 ) ) ( CLEAR ?auto_111650 ) ( ON ?auto_111653 ?auto_111649 ) ( CLEAR ?auto_111653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111651 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111651 ?auto_111649 )
      ( MAKE-3PILE ?auto_111646 ?auto_111647 ?auto_111648 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111654 - BLOCK
      ?auto_111655 - BLOCK
      ?auto_111656 - BLOCK
    )
    :vars
    (
      ?auto_111657 - BLOCK
      ?auto_111660 - BLOCK
      ?auto_111659 - BLOCK
      ?auto_111658 - BLOCK
      ?auto_111661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111657 ?auto_111656 ) ( ON-TABLE ?auto_111654 ) ( ON ?auto_111655 ?auto_111654 ) ( ON ?auto_111656 ?auto_111655 ) ( not ( = ?auto_111654 ?auto_111655 ) ) ( not ( = ?auto_111654 ?auto_111656 ) ) ( not ( = ?auto_111654 ?auto_111657 ) ) ( not ( = ?auto_111655 ?auto_111656 ) ) ( not ( = ?auto_111655 ?auto_111657 ) ) ( not ( = ?auto_111656 ?auto_111657 ) ) ( not ( = ?auto_111654 ?auto_111660 ) ) ( not ( = ?auto_111654 ?auto_111659 ) ) ( not ( = ?auto_111655 ?auto_111660 ) ) ( not ( = ?auto_111655 ?auto_111659 ) ) ( not ( = ?auto_111656 ?auto_111660 ) ) ( not ( = ?auto_111656 ?auto_111659 ) ) ( not ( = ?auto_111657 ?auto_111660 ) ) ( not ( = ?auto_111657 ?auto_111659 ) ) ( not ( = ?auto_111660 ?auto_111659 ) ) ( not ( = ?auto_111658 ?auto_111659 ) ) ( not ( = ?auto_111654 ?auto_111658 ) ) ( not ( = ?auto_111655 ?auto_111658 ) ) ( not ( = ?auto_111656 ?auto_111658 ) ) ( not ( = ?auto_111657 ?auto_111658 ) ) ( not ( = ?auto_111660 ?auto_111658 ) ) ( ON ?auto_111658 ?auto_111661 ) ( not ( = ?auto_111654 ?auto_111661 ) ) ( not ( = ?auto_111655 ?auto_111661 ) ) ( not ( = ?auto_111656 ?auto_111661 ) ) ( not ( = ?auto_111657 ?auto_111661 ) ) ( not ( = ?auto_111660 ?auto_111661 ) ) ( not ( = ?auto_111659 ?auto_111661 ) ) ( not ( = ?auto_111658 ?auto_111661 ) ) ( ON ?auto_111659 ?auto_111658 ) ( CLEAR ?auto_111659 ) ( ON-TABLE ?auto_111661 ) ( HOLDING ?auto_111660 ) ( CLEAR ?auto_111657 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111654 ?auto_111655 ?auto_111656 ?auto_111657 ?auto_111660 )
      ( MAKE-3PILE ?auto_111654 ?auto_111655 ?auto_111656 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111662 - BLOCK
      ?auto_111663 - BLOCK
      ?auto_111664 - BLOCK
    )
    :vars
    (
      ?auto_111668 - BLOCK
      ?auto_111666 - BLOCK
      ?auto_111665 - BLOCK
      ?auto_111667 - BLOCK
      ?auto_111669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111668 ?auto_111664 ) ( ON-TABLE ?auto_111662 ) ( ON ?auto_111663 ?auto_111662 ) ( ON ?auto_111664 ?auto_111663 ) ( not ( = ?auto_111662 ?auto_111663 ) ) ( not ( = ?auto_111662 ?auto_111664 ) ) ( not ( = ?auto_111662 ?auto_111668 ) ) ( not ( = ?auto_111663 ?auto_111664 ) ) ( not ( = ?auto_111663 ?auto_111668 ) ) ( not ( = ?auto_111664 ?auto_111668 ) ) ( not ( = ?auto_111662 ?auto_111666 ) ) ( not ( = ?auto_111662 ?auto_111665 ) ) ( not ( = ?auto_111663 ?auto_111666 ) ) ( not ( = ?auto_111663 ?auto_111665 ) ) ( not ( = ?auto_111664 ?auto_111666 ) ) ( not ( = ?auto_111664 ?auto_111665 ) ) ( not ( = ?auto_111668 ?auto_111666 ) ) ( not ( = ?auto_111668 ?auto_111665 ) ) ( not ( = ?auto_111666 ?auto_111665 ) ) ( not ( = ?auto_111667 ?auto_111665 ) ) ( not ( = ?auto_111662 ?auto_111667 ) ) ( not ( = ?auto_111663 ?auto_111667 ) ) ( not ( = ?auto_111664 ?auto_111667 ) ) ( not ( = ?auto_111668 ?auto_111667 ) ) ( not ( = ?auto_111666 ?auto_111667 ) ) ( ON ?auto_111667 ?auto_111669 ) ( not ( = ?auto_111662 ?auto_111669 ) ) ( not ( = ?auto_111663 ?auto_111669 ) ) ( not ( = ?auto_111664 ?auto_111669 ) ) ( not ( = ?auto_111668 ?auto_111669 ) ) ( not ( = ?auto_111666 ?auto_111669 ) ) ( not ( = ?auto_111665 ?auto_111669 ) ) ( not ( = ?auto_111667 ?auto_111669 ) ) ( ON ?auto_111665 ?auto_111667 ) ( ON-TABLE ?auto_111669 ) ( CLEAR ?auto_111668 ) ( ON ?auto_111666 ?auto_111665 ) ( CLEAR ?auto_111666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111669 ?auto_111667 ?auto_111665 )
      ( MAKE-3PILE ?auto_111662 ?auto_111663 ?auto_111664 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111686 - BLOCK
      ?auto_111687 - BLOCK
      ?auto_111688 - BLOCK
    )
    :vars
    (
      ?auto_111690 - BLOCK
      ?auto_111692 - BLOCK
      ?auto_111691 - BLOCK
      ?auto_111693 - BLOCK
      ?auto_111689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111686 ) ( ON ?auto_111687 ?auto_111686 ) ( not ( = ?auto_111686 ?auto_111687 ) ) ( not ( = ?auto_111686 ?auto_111688 ) ) ( not ( = ?auto_111686 ?auto_111690 ) ) ( not ( = ?auto_111687 ?auto_111688 ) ) ( not ( = ?auto_111687 ?auto_111690 ) ) ( not ( = ?auto_111688 ?auto_111690 ) ) ( not ( = ?auto_111686 ?auto_111692 ) ) ( not ( = ?auto_111686 ?auto_111691 ) ) ( not ( = ?auto_111687 ?auto_111692 ) ) ( not ( = ?auto_111687 ?auto_111691 ) ) ( not ( = ?auto_111688 ?auto_111692 ) ) ( not ( = ?auto_111688 ?auto_111691 ) ) ( not ( = ?auto_111690 ?auto_111692 ) ) ( not ( = ?auto_111690 ?auto_111691 ) ) ( not ( = ?auto_111692 ?auto_111691 ) ) ( not ( = ?auto_111693 ?auto_111691 ) ) ( not ( = ?auto_111686 ?auto_111693 ) ) ( not ( = ?auto_111687 ?auto_111693 ) ) ( not ( = ?auto_111688 ?auto_111693 ) ) ( not ( = ?auto_111690 ?auto_111693 ) ) ( not ( = ?auto_111692 ?auto_111693 ) ) ( ON ?auto_111693 ?auto_111689 ) ( not ( = ?auto_111686 ?auto_111689 ) ) ( not ( = ?auto_111687 ?auto_111689 ) ) ( not ( = ?auto_111688 ?auto_111689 ) ) ( not ( = ?auto_111690 ?auto_111689 ) ) ( not ( = ?auto_111692 ?auto_111689 ) ) ( not ( = ?auto_111691 ?auto_111689 ) ) ( not ( = ?auto_111693 ?auto_111689 ) ) ( ON ?auto_111691 ?auto_111693 ) ( ON-TABLE ?auto_111689 ) ( ON ?auto_111692 ?auto_111691 ) ( ON ?auto_111690 ?auto_111692 ) ( CLEAR ?auto_111690 ) ( HOLDING ?auto_111688 ) ( CLEAR ?auto_111687 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111686 ?auto_111687 ?auto_111688 ?auto_111690 )
      ( MAKE-3PILE ?auto_111686 ?auto_111687 ?auto_111688 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111694 - BLOCK
      ?auto_111695 - BLOCK
      ?auto_111696 - BLOCK
    )
    :vars
    (
      ?auto_111699 - BLOCK
      ?auto_111698 - BLOCK
      ?auto_111701 - BLOCK
      ?auto_111700 - BLOCK
      ?auto_111697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111694 ) ( ON ?auto_111695 ?auto_111694 ) ( not ( = ?auto_111694 ?auto_111695 ) ) ( not ( = ?auto_111694 ?auto_111696 ) ) ( not ( = ?auto_111694 ?auto_111699 ) ) ( not ( = ?auto_111695 ?auto_111696 ) ) ( not ( = ?auto_111695 ?auto_111699 ) ) ( not ( = ?auto_111696 ?auto_111699 ) ) ( not ( = ?auto_111694 ?auto_111698 ) ) ( not ( = ?auto_111694 ?auto_111701 ) ) ( not ( = ?auto_111695 ?auto_111698 ) ) ( not ( = ?auto_111695 ?auto_111701 ) ) ( not ( = ?auto_111696 ?auto_111698 ) ) ( not ( = ?auto_111696 ?auto_111701 ) ) ( not ( = ?auto_111699 ?auto_111698 ) ) ( not ( = ?auto_111699 ?auto_111701 ) ) ( not ( = ?auto_111698 ?auto_111701 ) ) ( not ( = ?auto_111700 ?auto_111701 ) ) ( not ( = ?auto_111694 ?auto_111700 ) ) ( not ( = ?auto_111695 ?auto_111700 ) ) ( not ( = ?auto_111696 ?auto_111700 ) ) ( not ( = ?auto_111699 ?auto_111700 ) ) ( not ( = ?auto_111698 ?auto_111700 ) ) ( ON ?auto_111700 ?auto_111697 ) ( not ( = ?auto_111694 ?auto_111697 ) ) ( not ( = ?auto_111695 ?auto_111697 ) ) ( not ( = ?auto_111696 ?auto_111697 ) ) ( not ( = ?auto_111699 ?auto_111697 ) ) ( not ( = ?auto_111698 ?auto_111697 ) ) ( not ( = ?auto_111701 ?auto_111697 ) ) ( not ( = ?auto_111700 ?auto_111697 ) ) ( ON ?auto_111701 ?auto_111700 ) ( ON-TABLE ?auto_111697 ) ( ON ?auto_111698 ?auto_111701 ) ( ON ?auto_111699 ?auto_111698 ) ( CLEAR ?auto_111695 ) ( ON ?auto_111696 ?auto_111699 ) ( CLEAR ?auto_111696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111697 ?auto_111700 ?auto_111701 ?auto_111698 ?auto_111699 )
      ( MAKE-3PILE ?auto_111694 ?auto_111695 ?auto_111696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111702 - BLOCK
      ?auto_111703 - BLOCK
      ?auto_111704 - BLOCK
    )
    :vars
    (
      ?auto_111705 - BLOCK
      ?auto_111706 - BLOCK
      ?auto_111709 - BLOCK
      ?auto_111707 - BLOCK
      ?auto_111708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111702 ) ( not ( = ?auto_111702 ?auto_111703 ) ) ( not ( = ?auto_111702 ?auto_111704 ) ) ( not ( = ?auto_111702 ?auto_111705 ) ) ( not ( = ?auto_111703 ?auto_111704 ) ) ( not ( = ?auto_111703 ?auto_111705 ) ) ( not ( = ?auto_111704 ?auto_111705 ) ) ( not ( = ?auto_111702 ?auto_111706 ) ) ( not ( = ?auto_111702 ?auto_111709 ) ) ( not ( = ?auto_111703 ?auto_111706 ) ) ( not ( = ?auto_111703 ?auto_111709 ) ) ( not ( = ?auto_111704 ?auto_111706 ) ) ( not ( = ?auto_111704 ?auto_111709 ) ) ( not ( = ?auto_111705 ?auto_111706 ) ) ( not ( = ?auto_111705 ?auto_111709 ) ) ( not ( = ?auto_111706 ?auto_111709 ) ) ( not ( = ?auto_111707 ?auto_111709 ) ) ( not ( = ?auto_111702 ?auto_111707 ) ) ( not ( = ?auto_111703 ?auto_111707 ) ) ( not ( = ?auto_111704 ?auto_111707 ) ) ( not ( = ?auto_111705 ?auto_111707 ) ) ( not ( = ?auto_111706 ?auto_111707 ) ) ( ON ?auto_111707 ?auto_111708 ) ( not ( = ?auto_111702 ?auto_111708 ) ) ( not ( = ?auto_111703 ?auto_111708 ) ) ( not ( = ?auto_111704 ?auto_111708 ) ) ( not ( = ?auto_111705 ?auto_111708 ) ) ( not ( = ?auto_111706 ?auto_111708 ) ) ( not ( = ?auto_111709 ?auto_111708 ) ) ( not ( = ?auto_111707 ?auto_111708 ) ) ( ON ?auto_111709 ?auto_111707 ) ( ON-TABLE ?auto_111708 ) ( ON ?auto_111706 ?auto_111709 ) ( ON ?auto_111705 ?auto_111706 ) ( ON ?auto_111704 ?auto_111705 ) ( CLEAR ?auto_111704 ) ( HOLDING ?auto_111703 ) ( CLEAR ?auto_111702 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111702 ?auto_111703 )
      ( MAKE-3PILE ?auto_111702 ?auto_111703 ?auto_111704 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111710 - BLOCK
      ?auto_111711 - BLOCK
      ?auto_111712 - BLOCK
    )
    :vars
    (
      ?auto_111715 - BLOCK
      ?auto_111716 - BLOCK
      ?auto_111714 - BLOCK
      ?auto_111717 - BLOCK
      ?auto_111713 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111710 ) ( not ( = ?auto_111710 ?auto_111711 ) ) ( not ( = ?auto_111710 ?auto_111712 ) ) ( not ( = ?auto_111710 ?auto_111715 ) ) ( not ( = ?auto_111711 ?auto_111712 ) ) ( not ( = ?auto_111711 ?auto_111715 ) ) ( not ( = ?auto_111712 ?auto_111715 ) ) ( not ( = ?auto_111710 ?auto_111716 ) ) ( not ( = ?auto_111710 ?auto_111714 ) ) ( not ( = ?auto_111711 ?auto_111716 ) ) ( not ( = ?auto_111711 ?auto_111714 ) ) ( not ( = ?auto_111712 ?auto_111716 ) ) ( not ( = ?auto_111712 ?auto_111714 ) ) ( not ( = ?auto_111715 ?auto_111716 ) ) ( not ( = ?auto_111715 ?auto_111714 ) ) ( not ( = ?auto_111716 ?auto_111714 ) ) ( not ( = ?auto_111717 ?auto_111714 ) ) ( not ( = ?auto_111710 ?auto_111717 ) ) ( not ( = ?auto_111711 ?auto_111717 ) ) ( not ( = ?auto_111712 ?auto_111717 ) ) ( not ( = ?auto_111715 ?auto_111717 ) ) ( not ( = ?auto_111716 ?auto_111717 ) ) ( ON ?auto_111717 ?auto_111713 ) ( not ( = ?auto_111710 ?auto_111713 ) ) ( not ( = ?auto_111711 ?auto_111713 ) ) ( not ( = ?auto_111712 ?auto_111713 ) ) ( not ( = ?auto_111715 ?auto_111713 ) ) ( not ( = ?auto_111716 ?auto_111713 ) ) ( not ( = ?auto_111714 ?auto_111713 ) ) ( not ( = ?auto_111717 ?auto_111713 ) ) ( ON ?auto_111714 ?auto_111717 ) ( ON-TABLE ?auto_111713 ) ( ON ?auto_111716 ?auto_111714 ) ( ON ?auto_111715 ?auto_111716 ) ( ON ?auto_111712 ?auto_111715 ) ( CLEAR ?auto_111710 ) ( ON ?auto_111711 ?auto_111712 ) ( CLEAR ?auto_111711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111713 ?auto_111717 ?auto_111714 ?auto_111716 ?auto_111715 ?auto_111712 )
      ( MAKE-3PILE ?auto_111710 ?auto_111711 ?auto_111712 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111718 - BLOCK
      ?auto_111719 - BLOCK
      ?auto_111720 - BLOCK
    )
    :vars
    (
      ?auto_111721 - BLOCK
      ?auto_111723 - BLOCK
      ?auto_111724 - BLOCK
      ?auto_111722 - BLOCK
      ?auto_111725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111718 ?auto_111719 ) ) ( not ( = ?auto_111718 ?auto_111720 ) ) ( not ( = ?auto_111718 ?auto_111721 ) ) ( not ( = ?auto_111719 ?auto_111720 ) ) ( not ( = ?auto_111719 ?auto_111721 ) ) ( not ( = ?auto_111720 ?auto_111721 ) ) ( not ( = ?auto_111718 ?auto_111723 ) ) ( not ( = ?auto_111718 ?auto_111724 ) ) ( not ( = ?auto_111719 ?auto_111723 ) ) ( not ( = ?auto_111719 ?auto_111724 ) ) ( not ( = ?auto_111720 ?auto_111723 ) ) ( not ( = ?auto_111720 ?auto_111724 ) ) ( not ( = ?auto_111721 ?auto_111723 ) ) ( not ( = ?auto_111721 ?auto_111724 ) ) ( not ( = ?auto_111723 ?auto_111724 ) ) ( not ( = ?auto_111722 ?auto_111724 ) ) ( not ( = ?auto_111718 ?auto_111722 ) ) ( not ( = ?auto_111719 ?auto_111722 ) ) ( not ( = ?auto_111720 ?auto_111722 ) ) ( not ( = ?auto_111721 ?auto_111722 ) ) ( not ( = ?auto_111723 ?auto_111722 ) ) ( ON ?auto_111722 ?auto_111725 ) ( not ( = ?auto_111718 ?auto_111725 ) ) ( not ( = ?auto_111719 ?auto_111725 ) ) ( not ( = ?auto_111720 ?auto_111725 ) ) ( not ( = ?auto_111721 ?auto_111725 ) ) ( not ( = ?auto_111723 ?auto_111725 ) ) ( not ( = ?auto_111724 ?auto_111725 ) ) ( not ( = ?auto_111722 ?auto_111725 ) ) ( ON ?auto_111724 ?auto_111722 ) ( ON-TABLE ?auto_111725 ) ( ON ?auto_111723 ?auto_111724 ) ( ON ?auto_111721 ?auto_111723 ) ( ON ?auto_111720 ?auto_111721 ) ( ON ?auto_111719 ?auto_111720 ) ( CLEAR ?auto_111719 ) ( HOLDING ?auto_111718 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111718 )
      ( MAKE-3PILE ?auto_111718 ?auto_111719 ?auto_111720 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111726 - BLOCK
      ?auto_111727 - BLOCK
      ?auto_111728 - BLOCK
    )
    :vars
    (
      ?auto_111729 - BLOCK
      ?auto_111731 - BLOCK
      ?auto_111732 - BLOCK
      ?auto_111733 - BLOCK
      ?auto_111730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111726 ?auto_111727 ) ) ( not ( = ?auto_111726 ?auto_111728 ) ) ( not ( = ?auto_111726 ?auto_111729 ) ) ( not ( = ?auto_111727 ?auto_111728 ) ) ( not ( = ?auto_111727 ?auto_111729 ) ) ( not ( = ?auto_111728 ?auto_111729 ) ) ( not ( = ?auto_111726 ?auto_111731 ) ) ( not ( = ?auto_111726 ?auto_111732 ) ) ( not ( = ?auto_111727 ?auto_111731 ) ) ( not ( = ?auto_111727 ?auto_111732 ) ) ( not ( = ?auto_111728 ?auto_111731 ) ) ( not ( = ?auto_111728 ?auto_111732 ) ) ( not ( = ?auto_111729 ?auto_111731 ) ) ( not ( = ?auto_111729 ?auto_111732 ) ) ( not ( = ?auto_111731 ?auto_111732 ) ) ( not ( = ?auto_111733 ?auto_111732 ) ) ( not ( = ?auto_111726 ?auto_111733 ) ) ( not ( = ?auto_111727 ?auto_111733 ) ) ( not ( = ?auto_111728 ?auto_111733 ) ) ( not ( = ?auto_111729 ?auto_111733 ) ) ( not ( = ?auto_111731 ?auto_111733 ) ) ( ON ?auto_111733 ?auto_111730 ) ( not ( = ?auto_111726 ?auto_111730 ) ) ( not ( = ?auto_111727 ?auto_111730 ) ) ( not ( = ?auto_111728 ?auto_111730 ) ) ( not ( = ?auto_111729 ?auto_111730 ) ) ( not ( = ?auto_111731 ?auto_111730 ) ) ( not ( = ?auto_111732 ?auto_111730 ) ) ( not ( = ?auto_111733 ?auto_111730 ) ) ( ON ?auto_111732 ?auto_111733 ) ( ON-TABLE ?auto_111730 ) ( ON ?auto_111731 ?auto_111732 ) ( ON ?auto_111729 ?auto_111731 ) ( ON ?auto_111728 ?auto_111729 ) ( ON ?auto_111727 ?auto_111728 ) ( ON ?auto_111726 ?auto_111727 ) ( CLEAR ?auto_111726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111730 ?auto_111733 ?auto_111732 ?auto_111731 ?auto_111729 ?auto_111728 ?auto_111727 )
      ( MAKE-3PILE ?auto_111726 ?auto_111727 ?auto_111728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111738 - BLOCK
      ?auto_111739 - BLOCK
      ?auto_111740 - BLOCK
      ?auto_111741 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_111741 ) ( CLEAR ?auto_111740 ) ( ON-TABLE ?auto_111738 ) ( ON ?auto_111739 ?auto_111738 ) ( ON ?auto_111740 ?auto_111739 ) ( not ( = ?auto_111738 ?auto_111739 ) ) ( not ( = ?auto_111738 ?auto_111740 ) ) ( not ( = ?auto_111738 ?auto_111741 ) ) ( not ( = ?auto_111739 ?auto_111740 ) ) ( not ( = ?auto_111739 ?auto_111741 ) ) ( not ( = ?auto_111740 ?auto_111741 ) ) )
    :subtasks
    ( ( !STACK ?auto_111741 ?auto_111740 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111742 - BLOCK
      ?auto_111743 - BLOCK
      ?auto_111744 - BLOCK
      ?auto_111745 - BLOCK
    )
    :vars
    (
      ?auto_111746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111744 ) ( ON-TABLE ?auto_111742 ) ( ON ?auto_111743 ?auto_111742 ) ( ON ?auto_111744 ?auto_111743 ) ( not ( = ?auto_111742 ?auto_111743 ) ) ( not ( = ?auto_111742 ?auto_111744 ) ) ( not ( = ?auto_111742 ?auto_111745 ) ) ( not ( = ?auto_111743 ?auto_111744 ) ) ( not ( = ?auto_111743 ?auto_111745 ) ) ( not ( = ?auto_111744 ?auto_111745 ) ) ( ON ?auto_111745 ?auto_111746 ) ( CLEAR ?auto_111745 ) ( HAND-EMPTY ) ( not ( = ?auto_111742 ?auto_111746 ) ) ( not ( = ?auto_111743 ?auto_111746 ) ) ( not ( = ?auto_111744 ?auto_111746 ) ) ( not ( = ?auto_111745 ?auto_111746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111745 ?auto_111746 )
      ( MAKE-4PILE ?auto_111742 ?auto_111743 ?auto_111744 ?auto_111745 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111747 - BLOCK
      ?auto_111748 - BLOCK
      ?auto_111749 - BLOCK
      ?auto_111750 - BLOCK
    )
    :vars
    (
      ?auto_111751 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111747 ) ( ON ?auto_111748 ?auto_111747 ) ( not ( = ?auto_111747 ?auto_111748 ) ) ( not ( = ?auto_111747 ?auto_111749 ) ) ( not ( = ?auto_111747 ?auto_111750 ) ) ( not ( = ?auto_111748 ?auto_111749 ) ) ( not ( = ?auto_111748 ?auto_111750 ) ) ( not ( = ?auto_111749 ?auto_111750 ) ) ( ON ?auto_111750 ?auto_111751 ) ( CLEAR ?auto_111750 ) ( not ( = ?auto_111747 ?auto_111751 ) ) ( not ( = ?auto_111748 ?auto_111751 ) ) ( not ( = ?auto_111749 ?auto_111751 ) ) ( not ( = ?auto_111750 ?auto_111751 ) ) ( HOLDING ?auto_111749 ) ( CLEAR ?auto_111748 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111747 ?auto_111748 ?auto_111749 )
      ( MAKE-4PILE ?auto_111747 ?auto_111748 ?auto_111749 ?auto_111750 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111752 - BLOCK
      ?auto_111753 - BLOCK
      ?auto_111754 - BLOCK
      ?auto_111755 - BLOCK
    )
    :vars
    (
      ?auto_111756 - BLOCK
      ?auto_111757 - BLOCK
      ?auto_111758 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111752 ) ( ON ?auto_111753 ?auto_111752 ) ( not ( = ?auto_111752 ?auto_111753 ) ) ( not ( = ?auto_111752 ?auto_111754 ) ) ( not ( = ?auto_111752 ?auto_111755 ) ) ( not ( = ?auto_111753 ?auto_111754 ) ) ( not ( = ?auto_111753 ?auto_111755 ) ) ( not ( = ?auto_111754 ?auto_111755 ) ) ( ON ?auto_111755 ?auto_111756 ) ( not ( = ?auto_111752 ?auto_111756 ) ) ( not ( = ?auto_111753 ?auto_111756 ) ) ( not ( = ?auto_111754 ?auto_111756 ) ) ( not ( = ?auto_111755 ?auto_111756 ) ) ( CLEAR ?auto_111753 ) ( ON ?auto_111754 ?auto_111755 ) ( CLEAR ?auto_111754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111757 ) ( ON ?auto_111758 ?auto_111757 ) ( ON ?auto_111756 ?auto_111758 ) ( not ( = ?auto_111757 ?auto_111758 ) ) ( not ( = ?auto_111757 ?auto_111756 ) ) ( not ( = ?auto_111757 ?auto_111755 ) ) ( not ( = ?auto_111757 ?auto_111754 ) ) ( not ( = ?auto_111758 ?auto_111756 ) ) ( not ( = ?auto_111758 ?auto_111755 ) ) ( not ( = ?auto_111758 ?auto_111754 ) ) ( not ( = ?auto_111752 ?auto_111757 ) ) ( not ( = ?auto_111752 ?auto_111758 ) ) ( not ( = ?auto_111753 ?auto_111757 ) ) ( not ( = ?auto_111753 ?auto_111758 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111757 ?auto_111758 ?auto_111756 ?auto_111755 )
      ( MAKE-4PILE ?auto_111752 ?auto_111753 ?auto_111754 ?auto_111755 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111759 - BLOCK
      ?auto_111760 - BLOCK
      ?auto_111761 - BLOCK
      ?auto_111762 - BLOCK
    )
    :vars
    (
      ?auto_111763 - BLOCK
      ?auto_111765 - BLOCK
      ?auto_111764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111759 ) ( not ( = ?auto_111759 ?auto_111760 ) ) ( not ( = ?auto_111759 ?auto_111761 ) ) ( not ( = ?auto_111759 ?auto_111762 ) ) ( not ( = ?auto_111760 ?auto_111761 ) ) ( not ( = ?auto_111760 ?auto_111762 ) ) ( not ( = ?auto_111761 ?auto_111762 ) ) ( ON ?auto_111762 ?auto_111763 ) ( not ( = ?auto_111759 ?auto_111763 ) ) ( not ( = ?auto_111760 ?auto_111763 ) ) ( not ( = ?auto_111761 ?auto_111763 ) ) ( not ( = ?auto_111762 ?auto_111763 ) ) ( ON ?auto_111761 ?auto_111762 ) ( CLEAR ?auto_111761 ) ( ON-TABLE ?auto_111765 ) ( ON ?auto_111764 ?auto_111765 ) ( ON ?auto_111763 ?auto_111764 ) ( not ( = ?auto_111765 ?auto_111764 ) ) ( not ( = ?auto_111765 ?auto_111763 ) ) ( not ( = ?auto_111765 ?auto_111762 ) ) ( not ( = ?auto_111765 ?auto_111761 ) ) ( not ( = ?auto_111764 ?auto_111763 ) ) ( not ( = ?auto_111764 ?auto_111762 ) ) ( not ( = ?auto_111764 ?auto_111761 ) ) ( not ( = ?auto_111759 ?auto_111765 ) ) ( not ( = ?auto_111759 ?auto_111764 ) ) ( not ( = ?auto_111760 ?auto_111765 ) ) ( not ( = ?auto_111760 ?auto_111764 ) ) ( HOLDING ?auto_111760 ) ( CLEAR ?auto_111759 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111759 ?auto_111760 )
      ( MAKE-4PILE ?auto_111759 ?auto_111760 ?auto_111761 ?auto_111762 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111766 - BLOCK
      ?auto_111767 - BLOCK
      ?auto_111768 - BLOCK
      ?auto_111769 - BLOCK
    )
    :vars
    (
      ?auto_111770 - BLOCK
      ?auto_111771 - BLOCK
      ?auto_111772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111766 ) ( not ( = ?auto_111766 ?auto_111767 ) ) ( not ( = ?auto_111766 ?auto_111768 ) ) ( not ( = ?auto_111766 ?auto_111769 ) ) ( not ( = ?auto_111767 ?auto_111768 ) ) ( not ( = ?auto_111767 ?auto_111769 ) ) ( not ( = ?auto_111768 ?auto_111769 ) ) ( ON ?auto_111769 ?auto_111770 ) ( not ( = ?auto_111766 ?auto_111770 ) ) ( not ( = ?auto_111767 ?auto_111770 ) ) ( not ( = ?auto_111768 ?auto_111770 ) ) ( not ( = ?auto_111769 ?auto_111770 ) ) ( ON ?auto_111768 ?auto_111769 ) ( ON-TABLE ?auto_111771 ) ( ON ?auto_111772 ?auto_111771 ) ( ON ?auto_111770 ?auto_111772 ) ( not ( = ?auto_111771 ?auto_111772 ) ) ( not ( = ?auto_111771 ?auto_111770 ) ) ( not ( = ?auto_111771 ?auto_111769 ) ) ( not ( = ?auto_111771 ?auto_111768 ) ) ( not ( = ?auto_111772 ?auto_111770 ) ) ( not ( = ?auto_111772 ?auto_111769 ) ) ( not ( = ?auto_111772 ?auto_111768 ) ) ( not ( = ?auto_111766 ?auto_111771 ) ) ( not ( = ?auto_111766 ?auto_111772 ) ) ( not ( = ?auto_111767 ?auto_111771 ) ) ( not ( = ?auto_111767 ?auto_111772 ) ) ( CLEAR ?auto_111766 ) ( ON ?auto_111767 ?auto_111768 ) ( CLEAR ?auto_111767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111771 ?auto_111772 ?auto_111770 ?auto_111769 ?auto_111768 )
      ( MAKE-4PILE ?auto_111766 ?auto_111767 ?auto_111768 ?auto_111769 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111773 - BLOCK
      ?auto_111774 - BLOCK
      ?auto_111775 - BLOCK
      ?auto_111776 - BLOCK
    )
    :vars
    (
      ?auto_111779 - BLOCK
      ?auto_111777 - BLOCK
      ?auto_111778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111773 ?auto_111774 ) ) ( not ( = ?auto_111773 ?auto_111775 ) ) ( not ( = ?auto_111773 ?auto_111776 ) ) ( not ( = ?auto_111774 ?auto_111775 ) ) ( not ( = ?auto_111774 ?auto_111776 ) ) ( not ( = ?auto_111775 ?auto_111776 ) ) ( ON ?auto_111776 ?auto_111779 ) ( not ( = ?auto_111773 ?auto_111779 ) ) ( not ( = ?auto_111774 ?auto_111779 ) ) ( not ( = ?auto_111775 ?auto_111779 ) ) ( not ( = ?auto_111776 ?auto_111779 ) ) ( ON ?auto_111775 ?auto_111776 ) ( ON-TABLE ?auto_111777 ) ( ON ?auto_111778 ?auto_111777 ) ( ON ?auto_111779 ?auto_111778 ) ( not ( = ?auto_111777 ?auto_111778 ) ) ( not ( = ?auto_111777 ?auto_111779 ) ) ( not ( = ?auto_111777 ?auto_111776 ) ) ( not ( = ?auto_111777 ?auto_111775 ) ) ( not ( = ?auto_111778 ?auto_111779 ) ) ( not ( = ?auto_111778 ?auto_111776 ) ) ( not ( = ?auto_111778 ?auto_111775 ) ) ( not ( = ?auto_111773 ?auto_111777 ) ) ( not ( = ?auto_111773 ?auto_111778 ) ) ( not ( = ?auto_111774 ?auto_111777 ) ) ( not ( = ?auto_111774 ?auto_111778 ) ) ( ON ?auto_111774 ?auto_111775 ) ( CLEAR ?auto_111774 ) ( HOLDING ?auto_111773 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111773 )
      ( MAKE-4PILE ?auto_111773 ?auto_111774 ?auto_111775 ?auto_111776 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111780 - BLOCK
      ?auto_111781 - BLOCK
      ?auto_111782 - BLOCK
      ?auto_111783 - BLOCK
    )
    :vars
    (
      ?auto_111784 - BLOCK
      ?auto_111785 - BLOCK
      ?auto_111786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111780 ?auto_111781 ) ) ( not ( = ?auto_111780 ?auto_111782 ) ) ( not ( = ?auto_111780 ?auto_111783 ) ) ( not ( = ?auto_111781 ?auto_111782 ) ) ( not ( = ?auto_111781 ?auto_111783 ) ) ( not ( = ?auto_111782 ?auto_111783 ) ) ( ON ?auto_111783 ?auto_111784 ) ( not ( = ?auto_111780 ?auto_111784 ) ) ( not ( = ?auto_111781 ?auto_111784 ) ) ( not ( = ?auto_111782 ?auto_111784 ) ) ( not ( = ?auto_111783 ?auto_111784 ) ) ( ON ?auto_111782 ?auto_111783 ) ( ON-TABLE ?auto_111785 ) ( ON ?auto_111786 ?auto_111785 ) ( ON ?auto_111784 ?auto_111786 ) ( not ( = ?auto_111785 ?auto_111786 ) ) ( not ( = ?auto_111785 ?auto_111784 ) ) ( not ( = ?auto_111785 ?auto_111783 ) ) ( not ( = ?auto_111785 ?auto_111782 ) ) ( not ( = ?auto_111786 ?auto_111784 ) ) ( not ( = ?auto_111786 ?auto_111783 ) ) ( not ( = ?auto_111786 ?auto_111782 ) ) ( not ( = ?auto_111780 ?auto_111785 ) ) ( not ( = ?auto_111780 ?auto_111786 ) ) ( not ( = ?auto_111781 ?auto_111785 ) ) ( not ( = ?auto_111781 ?auto_111786 ) ) ( ON ?auto_111781 ?auto_111782 ) ( ON ?auto_111780 ?auto_111781 ) ( CLEAR ?auto_111780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111785 ?auto_111786 ?auto_111784 ?auto_111783 ?auto_111782 ?auto_111781 )
      ( MAKE-4PILE ?auto_111780 ?auto_111781 ?auto_111782 ?auto_111783 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111787 - BLOCK
      ?auto_111788 - BLOCK
      ?auto_111789 - BLOCK
      ?auto_111790 - BLOCK
    )
    :vars
    (
      ?auto_111791 - BLOCK
      ?auto_111792 - BLOCK
      ?auto_111793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111787 ?auto_111788 ) ) ( not ( = ?auto_111787 ?auto_111789 ) ) ( not ( = ?auto_111787 ?auto_111790 ) ) ( not ( = ?auto_111788 ?auto_111789 ) ) ( not ( = ?auto_111788 ?auto_111790 ) ) ( not ( = ?auto_111789 ?auto_111790 ) ) ( ON ?auto_111790 ?auto_111791 ) ( not ( = ?auto_111787 ?auto_111791 ) ) ( not ( = ?auto_111788 ?auto_111791 ) ) ( not ( = ?auto_111789 ?auto_111791 ) ) ( not ( = ?auto_111790 ?auto_111791 ) ) ( ON ?auto_111789 ?auto_111790 ) ( ON-TABLE ?auto_111792 ) ( ON ?auto_111793 ?auto_111792 ) ( ON ?auto_111791 ?auto_111793 ) ( not ( = ?auto_111792 ?auto_111793 ) ) ( not ( = ?auto_111792 ?auto_111791 ) ) ( not ( = ?auto_111792 ?auto_111790 ) ) ( not ( = ?auto_111792 ?auto_111789 ) ) ( not ( = ?auto_111793 ?auto_111791 ) ) ( not ( = ?auto_111793 ?auto_111790 ) ) ( not ( = ?auto_111793 ?auto_111789 ) ) ( not ( = ?auto_111787 ?auto_111792 ) ) ( not ( = ?auto_111787 ?auto_111793 ) ) ( not ( = ?auto_111788 ?auto_111792 ) ) ( not ( = ?auto_111788 ?auto_111793 ) ) ( ON ?auto_111788 ?auto_111789 ) ( HOLDING ?auto_111787 ) ( CLEAR ?auto_111788 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111792 ?auto_111793 ?auto_111791 ?auto_111790 ?auto_111789 ?auto_111788 ?auto_111787 )
      ( MAKE-4PILE ?auto_111787 ?auto_111788 ?auto_111789 ?auto_111790 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111794 - BLOCK
      ?auto_111795 - BLOCK
      ?auto_111796 - BLOCK
      ?auto_111797 - BLOCK
    )
    :vars
    (
      ?auto_111799 - BLOCK
      ?auto_111798 - BLOCK
      ?auto_111800 - BLOCK
      ?auto_111801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111794 ?auto_111795 ) ) ( not ( = ?auto_111794 ?auto_111796 ) ) ( not ( = ?auto_111794 ?auto_111797 ) ) ( not ( = ?auto_111795 ?auto_111796 ) ) ( not ( = ?auto_111795 ?auto_111797 ) ) ( not ( = ?auto_111796 ?auto_111797 ) ) ( ON ?auto_111797 ?auto_111799 ) ( not ( = ?auto_111794 ?auto_111799 ) ) ( not ( = ?auto_111795 ?auto_111799 ) ) ( not ( = ?auto_111796 ?auto_111799 ) ) ( not ( = ?auto_111797 ?auto_111799 ) ) ( ON ?auto_111796 ?auto_111797 ) ( ON-TABLE ?auto_111798 ) ( ON ?auto_111800 ?auto_111798 ) ( ON ?auto_111799 ?auto_111800 ) ( not ( = ?auto_111798 ?auto_111800 ) ) ( not ( = ?auto_111798 ?auto_111799 ) ) ( not ( = ?auto_111798 ?auto_111797 ) ) ( not ( = ?auto_111798 ?auto_111796 ) ) ( not ( = ?auto_111800 ?auto_111799 ) ) ( not ( = ?auto_111800 ?auto_111797 ) ) ( not ( = ?auto_111800 ?auto_111796 ) ) ( not ( = ?auto_111794 ?auto_111798 ) ) ( not ( = ?auto_111794 ?auto_111800 ) ) ( not ( = ?auto_111795 ?auto_111798 ) ) ( not ( = ?auto_111795 ?auto_111800 ) ) ( ON ?auto_111795 ?auto_111796 ) ( CLEAR ?auto_111795 ) ( ON ?auto_111794 ?auto_111801 ) ( CLEAR ?auto_111794 ) ( HAND-EMPTY ) ( not ( = ?auto_111794 ?auto_111801 ) ) ( not ( = ?auto_111795 ?auto_111801 ) ) ( not ( = ?auto_111796 ?auto_111801 ) ) ( not ( = ?auto_111797 ?auto_111801 ) ) ( not ( = ?auto_111799 ?auto_111801 ) ) ( not ( = ?auto_111798 ?auto_111801 ) ) ( not ( = ?auto_111800 ?auto_111801 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111794 ?auto_111801 )
      ( MAKE-4PILE ?auto_111794 ?auto_111795 ?auto_111796 ?auto_111797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111802 - BLOCK
      ?auto_111803 - BLOCK
      ?auto_111804 - BLOCK
      ?auto_111805 - BLOCK
    )
    :vars
    (
      ?auto_111809 - BLOCK
      ?auto_111806 - BLOCK
      ?auto_111807 - BLOCK
      ?auto_111808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111802 ?auto_111803 ) ) ( not ( = ?auto_111802 ?auto_111804 ) ) ( not ( = ?auto_111802 ?auto_111805 ) ) ( not ( = ?auto_111803 ?auto_111804 ) ) ( not ( = ?auto_111803 ?auto_111805 ) ) ( not ( = ?auto_111804 ?auto_111805 ) ) ( ON ?auto_111805 ?auto_111809 ) ( not ( = ?auto_111802 ?auto_111809 ) ) ( not ( = ?auto_111803 ?auto_111809 ) ) ( not ( = ?auto_111804 ?auto_111809 ) ) ( not ( = ?auto_111805 ?auto_111809 ) ) ( ON ?auto_111804 ?auto_111805 ) ( ON-TABLE ?auto_111806 ) ( ON ?auto_111807 ?auto_111806 ) ( ON ?auto_111809 ?auto_111807 ) ( not ( = ?auto_111806 ?auto_111807 ) ) ( not ( = ?auto_111806 ?auto_111809 ) ) ( not ( = ?auto_111806 ?auto_111805 ) ) ( not ( = ?auto_111806 ?auto_111804 ) ) ( not ( = ?auto_111807 ?auto_111809 ) ) ( not ( = ?auto_111807 ?auto_111805 ) ) ( not ( = ?auto_111807 ?auto_111804 ) ) ( not ( = ?auto_111802 ?auto_111806 ) ) ( not ( = ?auto_111802 ?auto_111807 ) ) ( not ( = ?auto_111803 ?auto_111806 ) ) ( not ( = ?auto_111803 ?auto_111807 ) ) ( ON ?auto_111802 ?auto_111808 ) ( CLEAR ?auto_111802 ) ( not ( = ?auto_111802 ?auto_111808 ) ) ( not ( = ?auto_111803 ?auto_111808 ) ) ( not ( = ?auto_111804 ?auto_111808 ) ) ( not ( = ?auto_111805 ?auto_111808 ) ) ( not ( = ?auto_111809 ?auto_111808 ) ) ( not ( = ?auto_111806 ?auto_111808 ) ) ( not ( = ?auto_111807 ?auto_111808 ) ) ( HOLDING ?auto_111803 ) ( CLEAR ?auto_111804 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111806 ?auto_111807 ?auto_111809 ?auto_111805 ?auto_111804 ?auto_111803 )
      ( MAKE-4PILE ?auto_111802 ?auto_111803 ?auto_111804 ?auto_111805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111810 - BLOCK
      ?auto_111811 - BLOCK
      ?auto_111812 - BLOCK
      ?auto_111813 - BLOCK
    )
    :vars
    (
      ?auto_111814 - BLOCK
      ?auto_111817 - BLOCK
      ?auto_111816 - BLOCK
      ?auto_111815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111810 ?auto_111811 ) ) ( not ( = ?auto_111810 ?auto_111812 ) ) ( not ( = ?auto_111810 ?auto_111813 ) ) ( not ( = ?auto_111811 ?auto_111812 ) ) ( not ( = ?auto_111811 ?auto_111813 ) ) ( not ( = ?auto_111812 ?auto_111813 ) ) ( ON ?auto_111813 ?auto_111814 ) ( not ( = ?auto_111810 ?auto_111814 ) ) ( not ( = ?auto_111811 ?auto_111814 ) ) ( not ( = ?auto_111812 ?auto_111814 ) ) ( not ( = ?auto_111813 ?auto_111814 ) ) ( ON ?auto_111812 ?auto_111813 ) ( ON-TABLE ?auto_111817 ) ( ON ?auto_111816 ?auto_111817 ) ( ON ?auto_111814 ?auto_111816 ) ( not ( = ?auto_111817 ?auto_111816 ) ) ( not ( = ?auto_111817 ?auto_111814 ) ) ( not ( = ?auto_111817 ?auto_111813 ) ) ( not ( = ?auto_111817 ?auto_111812 ) ) ( not ( = ?auto_111816 ?auto_111814 ) ) ( not ( = ?auto_111816 ?auto_111813 ) ) ( not ( = ?auto_111816 ?auto_111812 ) ) ( not ( = ?auto_111810 ?auto_111817 ) ) ( not ( = ?auto_111810 ?auto_111816 ) ) ( not ( = ?auto_111811 ?auto_111817 ) ) ( not ( = ?auto_111811 ?auto_111816 ) ) ( ON ?auto_111810 ?auto_111815 ) ( not ( = ?auto_111810 ?auto_111815 ) ) ( not ( = ?auto_111811 ?auto_111815 ) ) ( not ( = ?auto_111812 ?auto_111815 ) ) ( not ( = ?auto_111813 ?auto_111815 ) ) ( not ( = ?auto_111814 ?auto_111815 ) ) ( not ( = ?auto_111817 ?auto_111815 ) ) ( not ( = ?auto_111816 ?auto_111815 ) ) ( CLEAR ?auto_111812 ) ( ON ?auto_111811 ?auto_111810 ) ( CLEAR ?auto_111811 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111815 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111815 ?auto_111810 )
      ( MAKE-4PILE ?auto_111810 ?auto_111811 ?auto_111812 ?auto_111813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111818 - BLOCK
      ?auto_111819 - BLOCK
      ?auto_111820 - BLOCK
      ?auto_111821 - BLOCK
    )
    :vars
    (
      ?auto_111824 - BLOCK
      ?auto_111822 - BLOCK
      ?auto_111825 - BLOCK
      ?auto_111823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111818 ?auto_111819 ) ) ( not ( = ?auto_111818 ?auto_111820 ) ) ( not ( = ?auto_111818 ?auto_111821 ) ) ( not ( = ?auto_111819 ?auto_111820 ) ) ( not ( = ?auto_111819 ?auto_111821 ) ) ( not ( = ?auto_111820 ?auto_111821 ) ) ( ON ?auto_111821 ?auto_111824 ) ( not ( = ?auto_111818 ?auto_111824 ) ) ( not ( = ?auto_111819 ?auto_111824 ) ) ( not ( = ?auto_111820 ?auto_111824 ) ) ( not ( = ?auto_111821 ?auto_111824 ) ) ( ON-TABLE ?auto_111822 ) ( ON ?auto_111825 ?auto_111822 ) ( ON ?auto_111824 ?auto_111825 ) ( not ( = ?auto_111822 ?auto_111825 ) ) ( not ( = ?auto_111822 ?auto_111824 ) ) ( not ( = ?auto_111822 ?auto_111821 ) ) ( not ( = ?auto_111822 ?auto_111820 ) ) ( not ( = ?auto_111825 ?auto_111824 ) ) ( not ( = ?auto_111825 ?auto_111821 ) ) ( not ( = ?auto_111825 ?auto_111820 ) ) ( not ( = ?auto_111818 ?auto_111822 ) ) ( not ( = ?auto_111818 ?auto_111825 ) ) ( not ( = ?auto_111819 ?auto_111822 ) ) ( not ( = ?auto_111819 ?auto_111825 ) ) ( ON ?auto_111818 ?auto_111823 ) ( not ( = ?auto_111818 ?auto_111823 ) ) ( not ( = ?auto_111819 ?auto_111823 ) ) ( not ( = ?auto_111820 ?auto_111823 ) ) ( not ( = ?auto_111821 ?auto_111823 ) ) ( not ( = ?auto_111824 ?auto_111823 ) ) ( not ( = ?auto_111822 ?auto_111823 ) ) ( not ( = ?auto_111825 ?auto_111823 ) ) ( ON ?auto_111819 ?auto_111818 ) ( CLEAR ?auto_111819 ) ( ON-TABLE ?auto_111823 ) ( HOLDING ?auto_111820 ) ( CLEAR ?auto_111821 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111822 ?auto_111825 ?auto_111824 ?auto_111821 ?auto_111820 )
      ( MAKE-4PILE ?auto_111818 ?auto_111819 ?auto_111820 ?auto_111821 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111826 - BLOCK
      ?auto_111827 - BLOCK
      ?auto_111828 - BLOCK
      ?auto_111829 - BLOCK
    )
    :vars
    (
      ?auto_111833 - BLOCK
      ?auto_111832 - BLOCK
      ?auto_111830 - BLOCK
      ?auto_111831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111826 ?auto_111827 ) ) ( not ( = ?auto_111826 ?auto_111828 ) ) ( not ( = ?auto_111826 ?auto_111829 ) ) ( not ( = ?auto_111827 ?auto_111828 ) ) ( not ( = ?auto_111827 ?auto_111829 ) ) ( not ( = ?auto_111828 ?auto_111829 ) ) ( ON ?auto_111829 ?auto_111833 ) ( not ( = ?auto_111826 ?auto_111833 ) ) ( not ( = ?auto_111827 ?auto_111833 ) ) ( not ( = ?auto_111828 ?auto_111833 ) ) ( not ( = ?auto_111829 ?auto_111833 ) ) ( ON-TABLE ?auto_111832 ) ( ON ?auto_111830 ?auto_111832 ) ( ON ?auto_111833 ?auto_111830 ) ( not ( = ?auto_111832 ?auto_111830 ) ) ( not ( = ?auto_111832 ?auto_111833 ) ) ( not ( = ?auto_111832 ?auto_111829 ) ) ( not ( = ?auto_111832 ?auto_111828 ) ) ( not ( = ?auto_111830 ?auto_111833 ) ) ( not ( = ?auto_111830 ?auto_111829 ) ) ( not ( = ?auto_111830 ?auto_111828 ) ) ( not ( = ?auto_111826 ?auto_111832 ) ) ( not ( = ?auto_111826 ?auto_111830 ) ) ( not ( = ?auto_111827 ?auto_111832 ) ) ( not ( = ?auto_111827 ?auto_111830 ) ) ( ON ?auto_111826 ?auto_111831 ) ( not ( = ?auto_111826 ?auto_111831 ) ) ( not ( = ?auto_111827 ?auto_111831 ) ) ( not ( = ?auto_111828 ?auto_111831 ) ) ( not ( = ?auto_111829 ?auto_111831 ) ) ( not ( = ?auto_111833 ?auto_111831 ) ) ( not ( = ?auto_111832 ?auto_111831 ) ) ( not ( = ?auto_111830 ?auto_111831 ) ) ( ON ?auto_111827 ?auto_111826 ) ( ON-TABLE ?auto_111831 ) ( CLEAR ?auto_111829 ) ( ON ?auto_111828 ?auto_111827 ) ( CLEAR ?auto_111828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111831 ?auto_111826 ?auto_111827 )
      ( MAKE-4PILE ?auto_111826 ?auto_111827 ?auto_111828 ?auto_111829 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111834 - BLOCK
      ?auto_111835 - BLOCK
      ?auto_111836 - BLOCK
      ?auto_111837 - BLOCK
    )
    :vars
    (
      ?auto_111840 - BLOCK
      ?auto_111839 - BLOCK
      ?auto_111838 - BLOCK
      ?auto_111841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111834 ?auto_111835 ) ) ( not ( = ?auto_111834 ?auto_111836 ) ) ( not ( = ?auto_111834 ?auto_111837 ) ) ( not ( = ?auto_111835 ?auto_111836 ) ) ( not ( = ?auto_111835 ?auto_111837 ) ) ( not ( = ?auto_111836 ?auto_111837 ) ) ( not ( = ?auto_111834 ?auto_111840 ) ) ( not ( = ?auto_111835 ?auto_111840 ) ) ( not ( = ?auto_111836 ?auto_111840 ) ) ( not ( = ?auto_111837 ?auto_111840 ) ) ( ON-TABLE ?auto_111839 ) ( ON ?auto_111838 ?auto_111839 ) ( ON ?auto_111840 ?auto_111838 ) ( not ( = ?auto_111839 ?auto_111838 ) ) ( not ( = ?auto_111839 ?auto_111840 ) ) ( not ( = ?auto_111839 ?auto_111837 ) ) ( not ( = ?auto_111839 ?auto_111836 ) ) ( not ( = ?auto_111838 ?auto_111840 ) ) ( not ( = ?auto_111838 ?auto_111837 ) ) ( not ( = ?auto_111838 ?auto_111836 ) ) ( not ( = ?auto_111834 ?auto_111839 ) ) ( not ( = ?auto_111834 ?auto_111838 ) ) ( not ( = ?auto_111835 ?auto_111839 ) ) ( not ( = ?auto_111835 ?auto_111838 ) ) ( ON ?auto_111834 ?auto_111841 ) ( not ( = ?auto_111834 ?auto_111841 ) ) ( not ( = ?auto_111835 ?auto_111841 ) ) ( not ( = ?auto_111836 ?auto_111841 ) ) ( not ( = ?auto_111837 ?auto_111841 ) ) ( not ( = ?auto_111840 ?auto_111841 ) ) ( not ( = ?auto_111839 ?auto_111841 ) ) ( not ( = ?auto_111838 ?auto_111841 ) ) ( ON ?auto_111835 ?auto_111834 ) ( ON-TABLE ?auto_111841 ) ( ON ?auto_111836 ?auto_111835 ) ( CLEAR ?auto_111836 ) ( HOLDING ?auto_111837 ) ( CLEAR ?auto_111840 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111839 ?auto_111838 ?auto_111840 ?auto_111837 )
      ( MAKE-4PILE ?auto_111834 ?auto_111835 ?auto_111836 ?auto_111837 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111842 - BLOCK
      ?auto_111843 - BLOCK
      ?auto_111844 - BLOCK
      ?auto_111845 - BLOCK
    )
    :vars
    (
      ?auto_111848 - BLOCK
      ?auto_111849 - BLOCK
      ?auto_111847 - BLOCK
      ?auto_111846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111842 ?auto_111843 ) ) ( not ( = ?auto_111842 ?auto_111844 ) ) ( not ( = ?auto_111842 ?auto_111845 ) ) ( not ( = ?auto_111843 ?auto_111844 ) ) ( not ( = ?auto_111843 ?auto_111845 ) ) ( not ( = ?auto_111844 ?auto_111845 ) ) ( not ( = ?auto_111842 ?auto_111848 ) ) ( not ( = ?auto_111843 ?auto_111848 ) ) ( not ( = ?auto_111844 ?auto_111848 ) ) ( not ( = ?auto_111845 ?auto_111848 ) ) ( ON-TABLE ?auto_111849 ) ( ON ?auto_111847 ?auto_111849 ) ( ON ?auto_111848 ?auto_111847 ) ( not ( = ?auto_111849 ?auto_111847 ) ) ( not ( = ?auto_111849 ?auto_111848 ) ) ( not ( = ?auto_111849 ?auto_111845 ) ) ( not ( = ?auto_111849 ?auto_111844 ) ) ( not ( = ?auto_111847 ?auto_111848 ) ) ( not ( = ?auto_111847 ?auto_111845 ) ) ( not ( = ?auto_111847 ?auto_111844 ) ) ( not ( = ?auto_111842 ?auto_111849 ) ) ( not ( = ?auto_111842 ?auto_111847 ) ) ( not ( = ?auto_111843 ?auto_111849 ) ) ( not ( = ?auto_111843 ?auto_111847 ) ) ( ON ?auto_111842 ?auto_111846 ) ( not ( = ?auto_111842 ?auto_111846 ) ) ( not ( = ?auto_111843 ?auto_111846 ) ) ( not ( = ?auto_111844 ?auto_111846 ) ) ( not ( = ?auto_111845 ?auto_111846 ) ) ( not ( = ?auto_111848 ?auto_111846 ) ) ( not ( = ?auto_111849 ?auto_111846 ) ) ( not ( = ?auto_111847 ?auto_111846 ) ) ( ON ?auto_111843 ?auto_111842 ) ( ON-TABLE ?auto_111846 ) ( ON ?auto_111844 ?auto_111843 ) ( CLEAR ?auto_111848 ) ( ON ?auto_111845 ?auto_111844 ) ( CLEAR ?auto_111845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111846 ?auto_111842 ?auto_111843 ?auto_111844 )
      ( MAKE-4PILE ?auto_111842 ?auto_111843 ?auto_111844 ?auto_111845 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111850 - BLOCK
      ?auto_111851 - BLOCK
      ?auto_111852 - BLOCK
      ?auto_111853 - BLOCK
    )
    :vars
    (
      ?auto_111855 - BLOCK
      ?auto_111857 - BLOCK
      ?auto_111854 - BLOCK
      ?auto_111856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111850 ?auto_111851 ) ) ( not ( = ?auto_111850 ?auto_111852 ) ) ( not ( = ?auto_111850 ?auto_111853 ) ) ( not ( = ?auto_111851 ?auto_111852 ) ) ( not ( = ?auto_111851 ?auto_111853 ) ) ( not ( = ?auto_111852 ?auto_111853 ) ) ( not ( = ?auto_111850 ?auto_111855 ) ) ( not ( = ?auto_111851 ?auto_111855 ) ) ( not ( = ?auto_111852 ?auto_111855 ) ) ( not ( = ?auto_111853 ?auto_111855 ) ) ( ON-TABLE ?auto_111857 ) ( ON ?auto_111854 ?auto_111857 ) ( not ( = ?auto_111857 ?auto_111854 ) ) ( not ( = ?auto_111857 ?auto_111855 ) ) ( not ( = ?auto_111857 ?auto_111853 ) ) ( not ( = ?auto_111857 ?auto_111852 ) ) ( not ( = ?auto_111854 ?auto_111855 ) ) ( not ( = ?auto_111854 ?auto_111853 ) ) ( not ( = ?auto_111854 ?auto_111852 ) ) ( not ( = ?auto_111850 ?auto_111857 ) ) ( not ( = ?auto_111850 ?auto_111854 ) ) ( not ( = ?auto_111851 ?auto_111857 ) ) ( not ( = ?auto_111851 ?auto_111854 ) ) ( ON ?auto_111850 ?auto_111856 ) ( not ( = ?auto_111850 ?auto_111856 ) ) ( not ( = ?auto_111851 ?auto_111856 ) ) ( not ( = ?auto_111852 ?auto_111856 ) ) ( not ( = ?auto_111853 ?auto_111856 ) ) ( not ( = ?auto_111855 ?auto_111856 ) ) ( not ( = ?auto_111857 ?auto_111856 ) ) ( not ( = ?auto_111854 ?auto_111856 ) ) ( ON ?auto_111851 ?auto_111850 ) ( ON-TABLE ?auto_111856 ) ( ON ?auto_111852 ?auto_111851 ) ( ON ?auto_111853 ?auto_111852 ) ( CLEAR ?auto_111853 ) ( HOLDING ?auto_111855 ) ( CLEAR ?auto_111854 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111857 ?auto_111854 ?auto_111855 )
      ( MAKE-4PILE ?auto_111850 ?auto_111851 ?auto_111852 ?auto_111853 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111858 - BLOCK
      ?auto_111859 - BLOCK
      ?auto_111860 - BLOCK
      ?auto_111861 - BLOCK
    )
    :vars
    (
      ?auto_111862 - BLOCK
      ?auto_111863 - BLOCK
      ?auto_111865 - BLOCK
      ?auto_111864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111858 ?auto_111859 ) ) ( not ( = ?auto_111858 ?auto_111860 ) ) ( not ( = ?auto_111858 ?auto_111861 ) ) ( not ( = ?auto_111859 ?auto_111860 ) ) ( not ( = ?auto_111859 ?auto_111861 ) ) ( not ( = ?auto_111860 ?auto_111861 ) ) ( not ( = ?auto_111858 ?auto_111862 ) ) ( not ( = ?auto_111859 ?auto_111862 ) ) ( not ( = ?auto_111860 ?auto_111862 ) ) ( not ( = ?auto_111861 ?auto_111862 ) ) ( ON-TABLE ?auto_111863 ) ( ON ?auto_111865 ?auto_111863 ) ( not ( = ?auto_111863 ?auto_111865 ) ) ( not ( = ?auto_111863 ?auto_111862 ) ) ( not ( = ?auto_111863 ?auto_111861 ) ) ( not ( = ?auto_111863 ?auto_111860 ) ) ( not ( = ?auto_111865 ?auto_111862 ) ) ( not ( = ?auto_111865 ?auto_111861 ) ) ( not ( = ?auto_111865 ?auto_111860 ) ) ( not ( = ?auto_111858 ?auto_111863 ) ) ( not ( = ?auto_111858 ?auto_111865 ) ) ( not ( = ?auto_111859 ?auto_111863 ) ) ( not ( = ?auto_111859 ?auto_111865 ) ) ( ON ?auto_111858 ?auto_111864 ) ( not ( = ?auto_111858 ?auto_111864 ) ) ( not ( = ?auto_111859 ?auto_111864 ) ) ( not ( = ?auto_111860 ?auto_111864 ) ) ( not ( = ?auto_111861 ?auto_111864 ) ) ( not ( = ?auto_111862 ?auto_111864 ) ) ( not ( = ?auto_111863 ?auto_111864 ) ) ( not ( = ?auto_111865 ?auto_111864 ) ) ( ON ?auto_111859 ?auto_111858 ) ( ON-TABLE ?auto_111864 ) ( ON ?auto_111860 ?auto_111859 ) ( ON ?auto_111861 ?auto_111860 ) ( CLEAR ?auto_111865 ) ( ON ?auto_111862 ?auto_111861 ) ( CLEAR ?auto_111862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111864 ?auto_111858 ?auto_111859 ?auto_111860 ?auto_111861 )
      ( MAKE-4PILE ?auto_111858 ?auto_111859 ?auto_111860 ?auto_111861 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111866 - BLOCK
      ?auto_111867 - BLOCK
      ?auto_111868 - BLOCK
      ?auto_111869 - BLOCK
    )
    :vars
    (
      ?auto_111871 - BLOCK
      ?auto_111873 - BLOCK
      ?auto_111872 - BLOCK
      ?auto_111870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111866 ?auto_111867 ) ) ( not ( = ?auto_111866 ?auto_111868 ) ) ( not ( = ?auto_111866 ?auto_111869 ) ) ( not ( = ?auto_111867 ?auto_111868 ) ) ( not ( = ?auto_111867 ?auto_111869 ) ) ( not ( = ?auto_111868 ?auto_111869 ) ) ( not ( = ?auto_111866 ?auto_111871 ) ) ( not ( = ?auto_111867 ?auto_111871 ) ) ( not ( = ?auto_111868 ?auto_111871 ) ) ( not ( = ?auto_111869 ?auto_111871 ) ) ( ON-TABLE ?auto_111873 ) ( not ( = ?auto_111873 ?auto_111872 ) ) ( not ( = ?auto_111873 ?auto_111871 ) ) ( not ( = ?auto_111873 ?auto_111869 ) ) ( not ( = ?auto_111873 ?auto_111868 ) ) ( not ( = ?auto_111872 ?auto_111871 ) ) ( not ( = ?auto_111872 ?auto_111869 ) ) ( not ( = ?auto_111872 ?auto_111868 ) ) ( not ( = ?auto_111866 ?auto_111873 ) ) ( not ( = ?auto_111866 ?auto_111872 ) ) ( not ( = ?auto_111867 ?auto_111873 ) ) ( not ( = ?auto_111867 ?auto_111872 ) ) ( ON ?auto_111866 ?auto_111870 ) ( not ( = ?auto_111866 ?auto_111870 ) ) ( not ( = ?auto_111867 ?auto_111870 ) ) ( not ( = ?auto_111868 ?auto_111870 ) ) ( not ( = ?auto_111869 ?auto_111870 ) ) ( not ( = ?auto_111871 ?auto_111870 ) ) ( not ( = ?auto_111873 ?auto_111870 ) ) ( not ( = ?auto_111872 ?auto_111870 ) ) ( ON ?auto_111867 ?auto_111866 ) ( ON-TABLE ?auto_111870 ) ( ON ?auto_111868 ?auto_111867 ) ( ON ?auto_111869 ?auto_111868 ) ( ON ?auto_111871 ?auto_111869 ) ( CLEAR ?auto_111871 ) ( HOLDING ?auto_111872 ) ( CLEAR ?auto_111873 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111873 ?auto_111872 )
      ( MAKE-4PILE ?auto_111866 ?auto_111867 ?auto_111868 ?auto_111869 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111874 - BLOCK
      ?auto_111875 - BLOCK
      ?auto_111876 - BLOCK
      ?auto_111877 - BLOCK
    )
    :vars
    (
      ?auto_111881 - BLOCK
      ?auto_111879 - BLOCK
      ?auto_111878 - BLOCK
      ?auto_111880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111874 ?auto_111875 ) ) ( not ( = ?auto_111874 ?auto_111876 ) ) ( not ( = ?auto_111874 ?auto_111877 ) ) ( not ( = ?auto_111875 ?auto_111876 ) ) ( not ( = ?auto_111875 ?auto_111877 ) ) ( not ( = ?auto_111876 ?auto_111877 ) ) ( not ( = ?auto_111874 ?auto_111881 ) ) ( not ( = ?auto_111875 ?auto_111881 ) ) ( not ( = ?auto_111876 ?auto_111881 ) ) ( not ( = ?auto_111877 ?auto_111881 ) ) ( ON-TABLE ?auto_111879 ) ( not ( = ?auto_111879 ?auto_111878 ) ) ( not ( = ?auto_111879 ?auto_111881 ) ) ( not ( = ?auto_111879 ?auto_111877 ) ) ( not ( = ?auto_111879 ?auto_111876 ) ) ( not ( = ?auto_111878 ?auto_111881 ) ) ( not ( = ?auto_111878 ?auto_111877 ) ) ( not ( = ?auto_111878 ?auto_111876 ) ) ( not ( = ?auto_111874 ?auto_111879 ) ) ( not ( = ?auto_111874 ?auto_111878 ) ) ( not ( = ?auto_111875 ?auto_111879 ) ) ( not ( = ?auto_111875 ?auto_111878 ) ) ( ON ?auto_111874 ?auto_111880 ) ( not ( = ?auto_111874 ?auto_111880 ) ) ( not ( = ?auto_111875 ?auto_111880 ) ) ( not ( = ?auto_111876 ?auto_111880 ) ) ( not ( = ?auto_111877 ?auto_111880 ) ) ( not ( = ?auto_111881 ?auto_111880 ) ) ( not ( = ?auto_111879 ?auto_111880 ) ) ( not ( = ?auto_111878 ?auto_111880 ) ) ( ON ?auto_111875 ?auto_111874 ) ( ON-TABLE ?auto_111880 ) ( ON ?auto_111876 ?auto_111875 ) ( ON ?auto_111877 ?auto_111876 ) ( ON ?auto_111881 ?auto_111877 ) ( CLEAR ?auto_111879 ) ( ON ?auto_111878 ?auto_111881 ) ( CLEAR ?auto_111878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111880 ?auto_111874 ?auto_111875 ?auto_111876 ?auto_111877 ?auto_111881 )
      ( MAKE-4PILE ?auto_111874 ?auto_111875 ?auto_111876 ?auto_111877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111882 - BLOCK
      ?auto_111883 - BLOCK
      ?auto_111884 - BLOCK
      ?auto_111885 - BLOCK
    )
    :vars
    (
      ?auto_111888 - BLOCK
      ?auto_111889 - BLOCK
      ?auto_111887 - BLOCK
      ?auto_111886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111882 ?auto_111883 ) ) ( not ( = ?auto_111882 ?auto_111884 ) ) ( not ( = ?auto_111882 ?auto_111885 ) ) ( not ( = ?auto_111883 ?auto_111884 ) ) ( not ( = ?auto_111883 ?auto_111885 ) ) ( not ( = ?auto_111884 ?auto_111885 ) ) ( not ( = ?auto_111882 ?auto_111888 ) ) ( not ( = ?auto_111883 ?auto_111888 ) ) ( not ( = ?auto_111884 ?auto_111888 ) ) ( not ( = ?auto_111885 ?auto_111888 ) ) ( not ( = ?auto_111889 ?auto_111887 ) ) ( not ( = ?auto_111889 ?auto_111888 ) ) ( not ( = ?auto_111889 ?auto_111885 ) ) ( not ( = ?auto_111889 ?auto_111884 ) ) ( not ( = ?auto_111887 ?auto_111888 ) ) ( not ( = ?auto_111887 ?auto_111885 ) ) ( not ( = ?auto_111887 ?auto_111884 ) ) ( not ( = ?auto_111882 ?auto_111889 ) ) ( not ( = ?auto_111882 ?auto_111887 ) ) ( not ( = ?auto_111883 ?auto_111889 ) ) ( not ( = ?auto_111883 ?auto_111887 ) ) ( ON ?auto_111882 ?auto_111886 ) ( not ( = ?auto_111882 ?auto_111886 ) ) ( not ( = ?auto_111883 ?auto_111886 ) ) ( not ( = ?auto_111884 ?auto_111886 ) ) ( not ( = ?auto_111885 ?auto_111886 ) ) ( not ( = ?auto_111888 ?auto_111886 ) ) ( not ( = ?auto_111889 ?auto_111886 ) ) ( not ( = ?auto_111887 ?auto_111886 ) ) ( ON ?auto_111883 ?auto_111882 ) ( ON-TABLE ?auto_111886 ) ( ON ?auto_111884 ?auto_111883 ) ( ON ?auto_111885 ?auto_111884 ) ( ON ?auto_111888 ?auto_111885 ) ( ON ?auto_111887 ?auto_111888 ) ( CLEAR ?auto_111887 ) ( HOLDING ?auto_111889 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111889 )
      ( MAKE-4PILE ?auto_111882 ?auto_111883 ?auto_111884 ?auto_111885 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111890 - BLOCK
      ?auto_111891 - BLOCK
      ?auto_111892 - BLOCK
      ?auto_111893 - BLOCK
    )
    :vars
    (
      ?auto_111894 - BLOCK
      ?auto_111897 - BLOCK
      ?auto_111896 - BLOCK
      ?auto_111895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111890 ?auto_111891 ) ) ( not ( = ?auto_111890 ?auto_111892 ) ) ( not ( = ?auto_111890 ?auto_111893 ) ) ( not ( = ?auto_111891 ?auto_111892 ) ) ( not ( = ?auto_111891 ?auto_111893 ) ) ( not ( = ?auto_111892 ?auto_111893 ) ) ( not ( = ?auto_111890 ?auto_111894 ) ) ( not ( = ?auto_111891 ?auto_111894 ) ) ( not ( = ?auto_111892 ?auto_111894 ) ) ( not ( = ?auto_111893 ?auto_111894 ) ) ( not ( = ?auto_111897 ?auto_111896 ) ) ( not ( = ?auto_111897 ?auto_111894 ) ) ( not ( = ?auto_111897 ?auto_111893 ) ) ( not ( = ?auto_111897 ?auto_111892 ) ) ( not ( = ?auto_111896 ?auto_111894 ) ) ( not ( = ?auto_111896 ?auto_111893 ) ) ( not ( = ?auto_111896 ?auto_111892 ) ) ( not ( = ?auto_111890 ?auto_111897 ) ) ( not ( = ?auto_111890 ?auto_111896 ) ) ( not ( = ?auto_111891 ?auto_111897 ) ) ( not ( = ?auto_111891 ?auto_111896 ) ) ( ON ?auto_111890 ?auto_111895 ) ( not ( = ?auto_111890 ?auto_111895 ) ) ( not ( = ?auto_111891 ?auto_111895 ) ) ( not ( = ?auto_111892 ?auto_111895 ) ) ( not ( = ?auto_111893 ?auto_111895 ) ) ( not ( = ?auto_111894 ?auto_111895 ) ) ( not ( = ?auto_111897 ?auto_111895 ) ) ( not ( = ?auto_111896 ?auto_111895 ) ) ( ON ?auto_111891 ?auto_111890 ) ( ON-TABLE ?auto_111895 ) ( ON ?auto_111892 ?auto_111891 ) ( ON ?auto_111893 ?auto_111892 ) ( ON ?auto_111894 ?auto_111893 ) ( ON ?auto_111896 ?auto_111894 ) ( ON ?auto_111897 ?auto_111896 ) ( CLEAR ?auto_111897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111895 ?auto_111890 ?auto_111891 ?auto_111892 ?auto_111893 ?auto_111894 ?auto_111896 )
      ( MAKE-4PILE ?auto_111890 ?auto_111891 ?auto_111892 ?auto_111893 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111900 - BLOCK
      ?auto_111901 - BLOCK
    )
    :vars
    (
      ?auto_111902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111902 ?auto_111901 ) ( CLEAR ?auto_111902 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111900 ) ( ON ?auto_111901 ?auto_111900 ) ( not ( = ?auto_111900 ?auto_111901 ) ) ( not ( = ?auto_111900 ?auto_111902 ) ) ( not ( = ?auto_111901 ?auto_111902 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111902 ?auto_111901 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111903 - BLOCK
      ?auto_111904 - BLOCK
    )
    :vars
    (
      ?auto_111905 - BLOCK
      ?auto_111906 - BLOCK
      ?auto_111907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111905 ?auto_111904 ) ( CLEAR ?auto_111905 ) ( ON-TABLE ?auto_111903 ) ( ON ?auto_111904 ?auto_111903 ) ( not ( = ?auto_111903 ?auto_111904 ) ) ( not ( = ?auto_111903 ?auto_111905 ) ) ( not ( = ?auto_111904 ?auto_111905 ) ) ( HOLDING ?auto_111906 ) ( CLEAR ?auto_111907 ) ( not ( = ?auto_111903 ?auto_111906 ) ) ( not ( = ?auto_111903 ?auto_111907 ) ) ( not ( = ?auto_111904 ?auto_111906 ) ) ( not ( = ?auto_111904 ?auto_111907 ) ) ( not ( = ?auto_111905 ?auto_111906 ) ) ( not ( = ?auto_111905 ?auto_111907 ) ) ( not ( = ?auto_111906 ?auto_111907 ) ) )
    :subtasks
    ( ( !STACK ?auto_111906 ?auto_111907 )
      ( MAKE-2PILE ?auto_111903 ?auto_111904 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111908 - BLOCK
      ?auto_111909 - BLOCK
    )
    :vars
    (
      ?auto_111912 - BLOCK
      ?auto_111910 - BLOCK
      ?auto_111911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111912 ?auto_111909 ) ( ON-TABLE ?auto_111908 ) ( ON ?auto_111909 ?auto_111908 ) ( not ( = ?auto_111908 ?auto_111909 ) ) ( not ( = ?auto_111908 ?auto_111912 ) ) ( not ( = ?auto_111909 ?auto_111912 ) ) ( CLEAR ?auto_111910 ) ( not ( = ?auto_111908 ?auto_111911 ) ) ( not ( = ?auto_111908 ?auto_111910 ) ) ( not ( = ?auto_111909 ?auto_111911 ) ) ( not ( = ?auto_111909 ?auto_111910 ) ) ( not ( = ?auto_111912 ?auto_111911 ) ) ( not ( = ?auto_111912 ?auto_111910 ) ) ( not ( = ?auto_111911 ?auto_111910 ) ) ( ON ?auto_111911 ?auto_111912 ) ( CLEAR ?auto_111911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111908 ?auto_111909 ?auto_111912 )
      ( MAKE-2PILE ?auto_111908 ?auto_111909 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111913 - BLOCK
      ?auto_111914 - BLOCK
    )
    :vars
    (
      ?auto_111915 - BLOCK
      ?auto_111916 - BLOCK
      ?auto_111917 - BLOCK
      ?auto_111918 - BLOCK
      ?auto_111919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111915 ?auto_111914 ) ( ON-TABLE ?auto_111913 ) ( ON ?auto_111914 ?auto_111913 ) ( not ( = ?auto_111913 ?auto_111914 ) ) ( not ( = ?auto_111913 ?auto_111915 ) ) ( not ( = ?auto_111914 ?auto_111915 ) ) ( not ( = ?auto_111913 ?auto_111916 ) ) ( not ( = ?auto_111913 ?auto_111917 ) ) ( not ( = ?auto_111914 ?auto_111916 ) ) ( not ( = ?auto_111914 ?auto_111917 ) ) ( not ( = ?auto_111915 ?auto_111916 ) ) ( not ( = ?auto_111915 ?auto_111917 ) ) ( not ( = ?auto_111916 ?auto_111917 ) ) ( ON ?auto_111916 ?auto_111915 ) ( CLEAR ?auto_111916 ) ( HOLDING ?auto_111917 ) ( CLEAR ?auto_111918 ) ( ON-TABLE ?auto_111919 ) ( ON ?auto_111918 ?auto_111919 ) ( not ( = ?auto_111919 ?auto_111918 ) ) ( not ( = ?auto_111919 ?auto_111917 ) ) ( not ( = ?auto_111918 ?auto_111917 ) ) ( not ( = ?auto_111913 ?auto_111918 ) ) ( not ( = ?auto_111913 ?auto_111919 ) ) ( not ( = ?auto_111914 ?auto_111918 ) ) ( not ( = ?auto_111914 ?auto_111919 ) ) ( not ( = ?auto_111915 ?auto_111918 ) ) ( not ( = ?auto_111915 ?auto_111919 ) ) ( not ( = ?auto_111916 ?auto_111918 ) ) ( not ( = ?auto_111916 ?auto_111919 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111919 ?auto_111918 ?auto_111917 )
      ( MAKE-2PILE ?auto_111913 ?auto_111914 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111920 - BLOCK
      ?auto_111921 - BLOCK
    )
    :vars
    (
      ?auto_111922 - BLOCK
      ?auto_111923 - BLOCK
      ?auto_111924 - BLOCK
      ?auto_111926 - BLOCK
      ?auto_111925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111922 ?auto_111921 ) ( ON-TABLE ?auto_111920 ) ( ON ?auto_111921 ?auto_111920 ) ( not ( = ?auto_111920 ?auto_111921 ) ) ( not ( = ?auto_111920 ?auto_111922 ) ) ( not ( = ?auto_111921 ?auto_111922 ) ) ( not ( = ?auto_111920 ?auto_111923 ) ) ( not ( = ?auto_111920 ?auto_111924 ) ) ( not ( = ?auto_111921 ?auto_111923 ) ) ( not ( = ?auto_111921 ?auto_111924 ) ) ( not ( = ?auto_111922 ?auto_111923 ) ) ( not ( = ?auto_111922 ?auto_111924 ) ) ( not ( = ?auto_111923 ?auto_111924 ) ) ( ON ?auto_111923 ?auto_111922 ) ( CLEAR ?auto_111926 ) ( ON-TABLE ?auto_111925 ) ( ON ?auto_111926 ?auto_111925 ) ( not ( = ?auto_111925 ?auto_111926 ) ) ( not ( = ?auto_111925 ?auto_111924 ) ) ( not ( = ?auto_111926 ?auto_111924 ) ) ( not ( = ?auto_111920 ?auto_111926 ) ) ( not ( = ?auto_111920 ?auto_111925 ) ) ( not ( = ?auto_111921 ?auto_111926 ) ) ( not ( = ?auto_111921 ?auto_111925 ) ) ( not ( = ?auto_111922 ?auto_111926 ) ) ( not ( = ?auto_111922 ?auto_111925 ) ) ( not ( = ?auto_111923 ?auto_111926 ) ) ( not ( = ?auto_111923 ?auto_111925 ) ) ( ON ?auto_111924 ?auto_111923 ) ( CLEAR ?auto_111924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111920 ?auto_111921 ?auto_111922 ?auto_111923 )
      ( MAKE-2PILE ?auto_111920 ?auto_111921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111927 - BLOCK
      ?auto_111928 - BLOCK
    )
    :vars
    (
      ?auto_111929 - BLOCK
      ?auto_111930 - BLOCK
      ?auto_111932 - BLOCK
      ?auto_111931 - BLOCK
      ?auto_111933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111929 ?auto_111928 ) ( ON-TABLE ?auto_111927 ) ( ON ?auto_111928 ?auto_111927 ) ( not ( = ?auto_111927 ?auto_111928 ) ) ( not ( = ?auto_111927 ?auto_111929 ) ) ( not ( = ?auto_111928 ?auto_111929 ) ) ( not ( = ?auto_111927 ?auto_111930 ) ) ( not ( = ?auto_111927 ?auto_111932 ) ) ( not ( = ?auto_111928 ?auto_111930 ) ) ( not ( = ?auto_111928 ?auto_111932 ) ) ( not ( = ?auto_111929 ?auto_111930 ) ) ( not ( = ?auto_111929 ?auto_111932 ) ) ( not ( = ?auto_111930 ?auto_111932 ) ) ( ON ?auto_111930 ?auto_111929 ) ( ON-TABLE ?auto_111931 ) ( not ( = ?auto_111931 ?auto_111933 ) ) ( not ( = ?auto_111931 ?auto_111932 ) ) ( not ( = ?auto_111933 ?auto_111932 ) ) ( not ( = ?auto_111927 ?auto_111933 ) ) ( not ( = ?auto_111927 ?auto_111931 ) ) ( not ( = ?auto_111928 ?auto_111933 ) ) ( not ( = ?auto_111928 ?auto_111931 ) ) ( not ( = ?auto_111929 ?auto_111933 ) ) ( not ( = ?auto_111929 ?auto_111931 ) ) ( not ( = ?auto_111930 ?auto_111933 ) ) ( not ( = ?auto_111930 ?auto_111931 ) ) ( ON ?auto_111932 ?auto_111930 ) ( CLEAR ?auto_111932 ) ( HOLDING ?auto_111933 ) ( CLEAR ?auto_111931 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111931 ?auto_111933 )
      ( MAKE-2PILE ?auto_111927 ?auto_111928 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111934 - BLOCK
      ?auto_111935 - BLOCK
    )
    :vars
    (
      ?auto_111937 - BLOCK
      ?auto_111936 - BLOCK
      ?auto_111938 - BLOCK
      ?auto_111940 - BLOCK
      ?auto_111939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111937 ?auto_111935 ) ( ON-TABLE ?auto_111934 ) ( ON ?auto_111935 ?auto_111934 ) ( not ( = ?auto_111934 ?auto_111935 ) ) ( not ( = ?auto_111934 ?auto_111937 ) ) ( not ( = ?auto_111935 ?auto_111937 ) ) ( not ( = ?auto_111934 ?auto_111936 ) ) ( not ( = ?auto_111934 ?auto_111938 ) ) ( not ( = ?auto_111935 ?auto_111936 ) ) ( not ( = ?auto_111935 ?auto_111938 ) ) ( not ( = ?auto_111937 ?auto_111936 ) ) ( not ( = ?auto_111937 ?auto_111938 ) ) ( not ( = ?auto_111936 ?auto_111938 ) ) ( ON ?auto_111936 ?auto_111937 ) ( ON-TABLE ?auto_111940 ) ( not ( = ?auto_111940 ?auto_111939 ) ) ( not ( = ?auto_111940 ?auto_111938 ) ) ( not ( = ?auto_111939 ?auto_111938 ) ) ( not ( = ?auto_111934 ?auto_111939 ) ) ( not ( = ?auto_111934 ?auto_111940 ) ) ( not ( = ?auto_111935 ?auto_111939 ) ) ( not ( = ?auto_111935 ?auto_111940 ) ) ( not ( = ?auto_111937 ?auto_111939 ) ) ( not ( = ?auto_111937 ?auto_111940 ) ) ( not ( = ?auto_111936 ?auto_111939 ) ) ( not ( = ?auto_111936 ?auto_111940 ) ) ( ON ?auto_111938 ?auto_111936 ) ( CLEAR ?auto_111940 ) ( ON ?auto_111939 ?auto_111938 ) ( CLEAR ?auto_111939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111934 ?auto_111935 ?auto_111937 ?auto_111936 ?auto_111938 )
      ( MAKE-2PILE ?auto_111934 ?auto_111935 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111941 - BLOCK
      ?auto_111942 - BLOCK
    )
    :vars
    (
      ?auto_111943 - BLOCK
      ?auto_111945 - BLOCK
      ?auto_111946 - BLOCK
      ?auto_111947 - BLOCK
      ?auto_111944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111943 ?auto_111942 ) ( ON-TABLE ?auto_111941 ) ( ON ?auto_111942 ?auto_111941 ) ( not ( = ?auto_111941 ?auto_111942 ) ) ( not ( = ?auto_111941 ?auto_111943 ) ) ( not ( = ?auto_111942 ?auto_111943 ) ) ( not ( = ?auto_111941 ?auto_111945 ) ) ( not ( = ?auto_111941 ?auto_111946 ) ) ( not ( = ?auto_111942 ?auto_111945 ) ) ( not ( = ?auto_111942 ?auto_111946 ) ) ( not ( = ?auto_111943 ?auto_111945 ) ) ( not ( = ?auto_111943 ?auto_111946 ) ) ( not ( = ?auto_111945 ?auto_111946 ) ) ( ON ?auto_111945 ?auto_111943 ) ( not ( = ?auto_111947 ?auto_111944 ) ) ( not ( = ?auto_111947 ?auto_111946 ) ) ( not ( = ?auto_111944 ?auto_111946 ) ) ( not ( = ?auto_111941 ?auto_111944 ) ) ( not ( = ?auto_111941 ?auto_111947 ) ) ( not ( = ?auto_111942 ?auto_111944 ) ) ( not ( = ?auto_111942 ?auto_111947 ) ) ( not ( = ?auto_111943 ?auto_111944 ) ) ( not ( = ?auto_111943 ?auto_111947 ) ) ( not ( = ?auto_111945 ?auto_111944 ) ) ( not ( = ?auto_111945 ?auto_111947 ) ) ( ON ?auto_111946 ?auto_111945 ) ( ON ?auto_111944 ?auto_111946 ) ( CLEAR ?auto_111944 ) ( HOLDING ?auto_111947 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111947 )
      ( MAKE-2PILE ?auto_111941 ?auto_111942 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111948 - BLOCK
      ?auto_111949 - BLOCK
    )
    :vars
    (
      ?auto_111953 - BLOCK
      ?auto_111952 - BLOCK
      ?auto_111951 - BLOCK
      ?auto_111954 - BLOCK
      ?auto_111950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111953 ?auto_111949 ) ( ON-TABLE ?auto_111948 ) ( ON ?auto_111949 ?auto_111948 ) ( not ( = ?auto_111948 ?auto_111949 ) ) ( not ( = ?auto_111948 ?auto_111953 ) ) ( not ( = ?auto_111949 ?auto_111953 ) ) ( not ( = ?auto_111948 ?auto_111952 ) ) ( not ( = ?auto_111948 ?auto_111951 ) ) ( not ( = ?auto_111949 ?auto_111952 ) ) ( not ( = ?auto_111949 ?auto_111951 ) ) ( not ( = ?auto_111953 ?auto_111952 ) ) ( not ( = ?auto_111953 ?auto_111951 ) ) ( not ( = ?auto_111952 ?auto_111951 ) ) ( ON ?auto_111952 ?auto_111953 ) ( not ( = ?auto_111954 ?auto_111950 ) ) ( not ( = ?auto_111954 ?auto_111951 ) ) ( not ( = ?auto_111950 ?auto_111951 ) ) ( not ( = ?auto_111948 ?auto_111950 ) ) ( not ( = ?auto_111948 ?auto_111954 ) ) ( not ( = ?auto_111949 ?auto_111950 ) ) ( not ( = ?auto_111949 ?auto_111954 ) ) ( not ( = ?auto_111953 ?auto_111950 ) ) ( not ( = ?auto_111953 ?auto_111954 ) ) ( not ( = ?auto_111952 ?auto_111950 ) ) ( not ( = ?auto_111952 ?auto_111954 ) ) ( ON ?auto_111951 ?auto_111952 ) ( ON ?auto_111950 ?auto_111951 ) ( ON ?auto_111954 ?auto_111950 ) ( CLEAR ?auto_111954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111948 ?auto_111949 ?auto_111953 ?auto_111952 ?auto_111951 ?auto_111950 )
      ( MAKE-2PILE ?auto_111948 ?auto_111949 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111955 - BLOCK
      ?auto_111956 - BLOCK
    )
    :vars
    (
      ?auto_111959 - BLOCK
      ?auto_111957 - BLOCK
      ?auto_111961 - BLOCK
      ?auto_111958 - BLOCK
      ?auto_111960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111959 ?auto_111956 ) ( ON-TABLE ?auto_111955 ) ( ON ?auto_111956 ?auto_111955 ) ( not ( = ?auto_111955 ?auto_111956 ) ) ( not ( = ?auto_111955 ?auto_111959 ) ) ( not ( = ?auto_111956 ?auto_111959 ) ) ( not ( = ?auto_111955 ?auto_111957 ) ) ( not ( = ?auto_111955 ?auto_111961 ) ) ( not ( = ?auto_111956 ?auto_111957 ) ) ( not ( = ?auto_111956 ?auto_111961 ) ) ( not ( = ?auto_111959 ?auto_111957 ) ) ( not ( = ?auto_111959 ?auto_111961 ) ) ( not ( = ?auto_111957 ?auto_111961 ) ) ( ON ?auto_111957 ?auto_111959 ) ( not ( = ?auto_111958 ?auto_111960 ) ) ( not ( = ?auto_111958 ?auto_111961 ) ) ( not ( = ?auto_111960 ?auto_111961 ) ) ( not ( = ?auto_111955 ?auto_111960 ) ) ( not ( = ?auto_111955 ?auto_111958 ) ) ( not ( = ?auto_111956 ?auto_111960 ) ) ( not ( = ?auto_111956 ?auto_111958 ) ) ( not ( = ?auto_111959 ?auto_111960 ) ) ( not ( = ?auto_111959 ?auto_111958 ) ) ( not ( = ?auto_111957 ?auto_111960 ) ) ( not ( = ?auto_111957 ?auto_111958 ) ) ( ON ?auto_111961 ?auto_111957 ) ( ON ?auto_111960 ?auto_111961 ) ( HOLDING ?auto_111958 ) ( CLEAR ?auto_111960 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111955 ?auto_111956 ?auto_111959 ?auto_111957 ?auto_111961 ?auto_111960 ?auto_111958 )
      ( MAKE-2PILE ?auto_111955 ?auto_111956 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111962 - BLOCK
      ?auto_111963 - BLOCK
    )
    :vars
    (
      ?auto_111968 - BLOCK
      ?auto_111964 - BLOCK
      ?auto_111967 - BLOCK
      ?auto_111966 - BLOCK
      ?auto_111965 - BLOCK
      ?auto_111969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111968 ?auto_111963 ) ( ON-TABLE ?auto_111962 ) ( ON ?auto_111963 ?auto_111962 ) ( not ( = ?auto_111962 ?auto_111963 ) ) ( not ( = ?auto_111962 ?auto_111968 ) ) ( not ( = ?auto_111963 ?auto_111968 ) ) ( not ( = ?auto_111962 ?auto_111964 ) ) ( not ( = ?auto_111962 ?auto_111967 ) ) ( not ( = ?auto_111963 ?auto_111964 ) ) ( not ( = ?auto_111963 ?auto_111967 ) ) ( not ( = ?auto_111968 ?auto_111964 ) ) ( not ( = ?auto_111968 ?auto_111967 ) ) ( not ( = ?auto_111964 ?auto_111967 ) ) ( ON ?auto_111964 ?auto_111968 ) ( not ( = ?auto_111966 ?auto_111965 ) ) ( not ( = ?auto_111966 ?auto_111967 ) ) ( not ( = ?auto_111965 ?auto_111967 ) ) ( not ( = ?auto_111962 ?auto_111965 ) ) ( not ( = ?auto_111962 ?auto_111966 ) ) ( not ( = ?auto_111963 ?auto_111965 ) ) ( not ( = ?auto_111963 ?auto_111966 ) ) ( not ( = ?auto_111968 ?auto_111965 ) ) ( not ( = ?auto_111968 ?auto_111966 ) ) ( not ( = ?auto_111964 ?auto_111965 ) ) ( not ( = ?auto_111964 ?auto_111966 ) ) ( ON ?auto_111967 ?auto_111964 ) ( ON ?auto_111965 ?auto_111967 ) ( CLEAR ?auto_111965 ) ( ON ?auto_111966 ?auto_111969 ) ( CLEAR ?auto_111966 ) ( HAND-EMPTY ) ( not ( = ?auto_111962 ?auto_111969 ) ) ( not ( = ?auto_111963 ?auto_111969 ) ) ( not ( = ?auto_111968 ?auto_111969 ) ) ( not ( = ?auto_111964 ?auto_111969 ) ) ( not ( = ?auto_111967 ?auto_111969 ) ) ( not ( = ?auto_111966 ?auto_111969 ) ) ( not ( = ?auto_111965 ?auto_111969 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111966 ?auto_111969 )
      ( MAKE-2PILE ?auto_111962 ?auto_111963 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111970 - BLOCK
      ?auto_111971 - BLOCK
    )
    :vars
    (
      ?auto_111974 - BLOCK
      ?auto_111975 - BLOCK
      ?auto_111976 - BLOCK
      ?auto_111973 - BLOCK
      ?auto_111977 - BLOCK
      ?auto_111972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111974 ?auto_111971 ) ( ON-TABLE ?auto_111970 ) ( ON ?auto_111971 ?auto_111970 ) ( not ( = ?auto_111970 ?auto_111971 ) ) ( not ( = ?auto_111970 ?auto_111974 ) ) ( not ( = ?auto_111971 ?auto_111974 ) ) ( not ( = ?auto_111970 ?auto_111975 ) ) ( not ( = ?auto_111970 ?auto_111976 ) ) ( not ( = ?auto_111971 ?auto_111975 ) ) ( not ( = ?auto_111971 ?auto_111976 ) ) ( not ( = ?auto_111974 ?auto_111975 ) ) ( not ( = ?auto_111974 ?auto_111976 ) ) ( not ( = ?auto_111975 ?auto_111976 ) ) ( ON ?auto_111975 ?auto_111974 ) ( not ( = ?auto_111973 ?auto_111977 ) ) ( not ( = ?auto_111973 ?auto_111976 ) ) ( not ( = ?auto_111977 ?auto_111976 ) ) ( not ( = ?auto_111970 ?auto_111977 ) ) ( not ( = ?auto_111970 ?auto_111973 ) ) ( not ( = ?auto_111971 ?auto_111977 ) ) ( not ( = ?auto_111971 ?auto_111973 ) ) ( not ( = ?auto_111974 ?auto_111977 ) ) ( not ( = ?auto_111974 ?auto_111973 ) ) ( not ( = ?auto_111975 ?auto_111977 ) ) ( not ( = ?auto_111975 ?auto_111973 ) ) ( ON ?auto_111976 ?auto_111975 ) ( ON ?auto_111973 ?auto_111972 ) ( CLEAR ?auto_111973 ) ( not ( = ?auto_111970 ?auto_111972 ) ) ( not ( = ?auto_111971 ?auto_111972 ) ) ( not ( = ?auto_111974 ?auto_111972 ) ) ( not ( = ?auto_111975 ?auto_111972 ) ) ( not ( = ?auto_111976 ?auto_111972 ) ) ( not ( = ?auto_111973 ?auto_111972 ) ) ( not ( = ?auto_111977 ?auto_111972 ) ) ( HOLDING ?auto_111977 ) ( CLEAR ?auto_111976 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111970 ?auto_111971 ?auto_111974 ?auto_111975 ?auto_111976 ?auto_111977 )
      ( MAKE-2PILE ?auto_111970 ?auto_111971 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111978 - BLOCK
      ?auto_111979 - BLOCK
    )
    :vars
    (
      ?auto_111980 - BLOCK
      ?auto_111983 - BLOCK
      ?auto_111984 - BLOCK
      ?auto_111981 - BLOCK
      ?auto_111985 - BLOCK
      ?auto_111982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111980 ?auto_111979 ) ( ON-TABLE ?auto_111978 ) ( ON ?auto_111979 ?auto_111978 ) ( not ( = ?auto_111978 ?auto_111979 ) ) ( not ( = ?auto_111978 ?auto_111980 ) ) ( not ( = ?auto_111979 ?auto_111980 ) ) ( not ( = ?auto_111978 ?auto_111983 ) ) ( not ( = ?auto_111978 ?auto_111984 ) ) ( not ( = ?auto_111979 ?auto_111983 ) ) ( not ( = ?auto_111979 ?auto_111984 ) ) ( not ( = ?auto_111980 ?auto_111983 ) ) ( not ( = ?auto_111980 ?auto_111984 ) ) ( not ( = ?auto_111983 ?auto_111984 ) ) ( ON ?auto_111983 ?auto_111980 ) ( not ( = ?auto_111981 ?auto_111985 ) ) ( not ( = ?auto_111981 ?auto_111984 ) ) ( not ( = ?auto_111985 ?auto_111984 ) ) ( not ( = ?auto_111978 ?auto_111985 ) ) ( not ( = ?auto_111978 ?auto_111981 ) ) ( not ( = ?auto_111979 ?auto_111985 ) ) ( not ( = ?auto_111979 ?auto_111981 ) ) ( not ( = ?auto_111980 ?auto_111985 ) ) ( not ( = ?auto_111980 ?auto_111981 ) ) ( not ( = ?auto_111983 ?auto_111985 ) ) ( not ( = ?auto_111983 ?auto_111981 ) ) ( ON ?auto_111984 ?auto_111983 ) ( ON ?auto_111981 ?auto_111982 ) ( not ( = ?auto_111978 ?auto_111982 ) ) ( not ( = ?auto_111979 ?auto_111982 ) ) ( not ( = ?auto_111980 ?auto_111982 ) ) ( not ( = ?auto_111983 ?auto_111982 ) ) ( not ( = ?auto_111984 ?auto_111982 ) ) ( not ( = ?auto_111981 ?auto_111982 ) ) ( not ( = ?auto_111985 ?auto_111982 ) ) ( CLEAR ?auto_111984 ) ( ON ?auto_111985 ?auto_111981 ) ( CLEAR ?auto_111985 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111982 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111982 ?auto_111981 )
      ( MAKE-2PILE ?auto_111978 ?auto_111979 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111986 - BLOCK
      ?auto_111987 - BLOCK
    )
    :vars
    (
      ?auto_111990 - BLOCK
      ?auto_111992 - BLOCK
      ?auto_111991 - BLOCK
      ?auto_111993 - BLOCK
      ?auto_111988 - BLOCK
      ?auto_111989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111990 ?auto_111987 ) ( ON-TABLE ?auto_111986 ) ( ON ?auto_111987 ?auto_111986 ) ( not ( = ?auto_111986 ?auto_111987 ) ) ( not ( = ?auto_111986 ?auto_111990 ) ) ( not ( = ?auto_111987 ?auto_111990 ) ) ( not ( = ?auto_111986 ?auto_111992 ) ) ( not ( = ?auto_111986 ?auto_111991 ) ) ( not ( = ?auto_111987 ?auto_111992 ) ) ( not ( = ?auto_111987 ?auto_111991 ) ) ( not ( = ?auto_111990 ?auto_111992 ) ) ( not ( = ?auto_111990 ?auto_111991 ) ) ( not ( = ?auto_111992 ?auto_111991 ) ) ( ON ?auto_111992 ?auto_111990 ) ( not ( = ?auto_111993 ?auto_111988 ) ) ( not ( = ?auto_111993 ?auto_111991 ) ) ( not ( = ?auto_111988 ?auto_111991 ) ) ( not ( = ?auto_111986 ?auto_111988 ) ) ( not ( = ?auto_111986 ?auto_111993 ) ) ( not ( = ?auto_111987 ?auto_111988 ) ) ( not ( = ?auto_111987 ?auto_111993 ) ) ( not ( = ?auto_111990 ?auto_111988 ) ) ( not ( = ?auto_111990 ?auto_111993 ) ) ( not ( = ?auto_111992 ?auto_111988 ) ) ( not ( = ?auto_111992 ?auto_111993 ) ) ( ON ?auto_111993 ?auto_111989 ) ( not ( = ?auto_111986 ?auto_111989 ) ) ( not ( = ?auto_111987 ?auto_111989 ) ) ( not ( = ?auto_111990 ?auto_111989 ) ) ( not ( = ?auto_111992 ?auto_111989 ) ) ( not ( = ?auto_111991 ?auto_111989 ) ) ( not ( = ?auto_111993 ?auto_111989 ) ) ( not ( = ?auto_111988 ?auto_111989 ) ) ( ON ?auto_111988 ?auto_111993 ) ( CLEAR ?auto_111988 ) ( ON-TABLE ?auto_111989 ) ( HOLDING ?auto_111991 ) ( CLEAR ?auto_111992 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111986 ?auto_111987 ?auto_111990 ?auto_111992 ?auto_111991 )
      ( MAKE-2PILE ?auto_111986 ?auto_111987 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111994 - BLOCK
      ?auto_111995 - BLOCK
    )
    :vars
    (
      ?auto_111996 - BLOCK
      ?auto_111997 - BLOCK
      ?auto_111999 - BLOCK
      ?auto_111998 - BLOCK
      ?auto_112001 - BLOCK
      ?auto_112000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111996 ?auto_111995 ) ( ON-TABLE ?auto_111994 ) ( ON ?auto_111995 ?auto_111994 ) ( not ( = ?auto_111994 ?auto_111995 ) ) ( not ( = ?auto_111994 ?auto_111996 ) ) ( not ( = ?auto_111995 ?auto_111996 ) ) ( not ( = ?auto_111994 ?auto_111997 ) ) ( not ( = ?auto_111994 ?auto_111999 ) ) ( not ( = ?auto_111995 ?auto_111997 ) ) ( not ( = ?auto_111995 ?auto_111999 ) ) ( not ( = ?auto_111996 ?auto_111997 ) ) ( not ( = ?auto_111996 ?auto_111999 ) ) ( not ( = ?auto_111997 ?auto_111999 ) ) ( ON ?auto_111997 ?auto_111996 ) ( not ( = ?auto_111998 ?auto_112001 ) ) ( not ( = ?auto_111998 ?auto_111999 ) ) ( not ( = ?auto_112001 ?auto_111999 ) ) ( not ( = ?auto_111994 ?auto_112001 ) ) ( not ( = ?auto_111994 ?auto_111998 ) ) ( not ( = ?auto_111995 ?auto_112001 ) ) ( not ( = ?auto_111995 ?auto_111998 ) ) ( not ( = ?auto_111996 ?auto_112001 ) ) ( not ( = ?auto_111996 ?auto_111998 ) ) ( not ( = ?auto_111997 ?auto_112001 ) ) ( not ( = ?auto_111997 ?auto_111998 ) ) ( ON ?auto_111998 ?auto_112000 ) ( not ( = ?auto_111994 ?auto_112000 ) ) ( not ( = ?auto_111995 ?auto_112000 ) ) ( not ( = ?auto_111996 ?auto_112000 ) ) ( not ( = ?auto_111997 ?auto_112000 ) ) ( not ( = ?auto_111999 ?auto_112000 ) ) ( not ( = ?auto_111998 ?auto_112000 ) ) ( not ( = ?auto_112001 ?auto_112000 ) ) ( ON ?auto_112001 ?auto_111998 ) ( ON-TABLE ?auto_112000 ) ( CLEAR ?auto_111997 ) ( ON ?auto_111999 ?auto_112001 ) ( CLEAR ?auto_111999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112000 ?auto_111998 ?auto_112001 )
      ( MAKE-2PILE ?auto_111994 ?auto_111995 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112002 - BLOCK
      ?auto_112003 - BLOCK
    )
    :vars
    (
      ?auto_112009 - BLOCK
      ?auto_112008 - BLOCK
      ?auto_112005 - BLOCK
      ?auto_112006 - BLOCK
      ?auto_112007 - BLOCK
      ?auto_112004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112009 ?auto_112003 ) ( ON-TABLE ?auto_112002 ) ( ON ?auto_112003 ?auto_112002 ) ( not ( = ?auto_112002 ?auto_112003 ) ) ( not ( = ?auto_112002 ?auto_112009 ) ) ( not ( = ?auto_112003 ?auto_112009 ) ) ( not ( = ?auto_112002 ?auto_112008 ) ) ( not ( = ?auto_112002 ?auto_112005 ) ) ( not ( = ?auto_112003 ?auto_112008 ) ) ( not ( = ?auto_112003 ?auto_112005 ) ) ( not ( = ?auto_112009 ?auto_112008 ) ) ( not ( = ?auto_112009 ?auto_112005 ) ) ( not ( = ?auto_112008 ?auto_112005 ) ) ( not ( = ?auto_112006 ?auto_112007 ) ) ( not ( = ?auto_112006 ?auto_112005 ) ) ( not ( = ?auto_112007 ?auto_112005 ) ) ( not ( = ?auto_112002 ?auto_112007 ) ) ( not ( = ?auto_112002 ?auto_112006 ) ) ( not ( = ?auto_112003 ?auto_112007 ) ) ( not ( = ?auto_112003 ?auto_112006 ) ) ( not ( = ?auto_112009 ?auto_112007 ) ) ( not ( = ?auto_112009 ?auto_112006 ) ) ( not ( = ?auto_112008 ?auto_112007 ) ) ( not ( = ?auto_112008 ?auto_112006 ) ) ( ON ?auto_112006 ?auto_112004 ) ( not ( = ?auto_112002 ?auto_112004 ) ) ( not ( = ?auto_112003 ?auto_112004 ) ) ( not ( = ?auto_112009 ?auto_112004 ) ) ( not ( = ?auto_112008 ?auto_112004 ) ) ( not ( = ?auto_112005 ?auto_112004 ) ) ( not ( = ?auto_112006 ?auto_112004 ) ) ( not ( = ?auto_112007 ?auto_112004 ) ) ( ON ?auto_112007 ?auto_112006 ) ( ON-TABLE ?auto_112004 ) ( ON ?auto_112005 ?auto_112007 ) ( CLEAR ?auto_112005 ) ( HOLDING ?auto_112008 ) ( CLEAR ?auto_112009 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112002 ?auto_112003 ?auto_112009 ?auto_112008 )
      ( MAKE-2PILE ?auto_112002 ?auto_112003 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112010 - BLOCK
      ?auto_112011 - BLOCK
    )
    :vars
    (
      ?auto_112013 - BLOCK
      ?auto_112015 - BLOCK
      ?auto_112012 - BLOCK
      ?auto_112017 - BLOCK
      ?auto_112014 - BLOCK
      ?auto_112016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112013 ?auto_112011 ) ( ON-TABLE ?auto_112010 ) ( ON ?auto_112011 ?auto_112010 ) ( not ( = ?auto_112010 ?auto_112011 ) ) ( not ( = ?auto_112010 ?auto_112013 ) ) ( not ( = ?auto_112011 ?auto_112013 ) ) ( not ( = ?auto_112010 ?auto_112015 ) ) ( not ( = ?auto_112010 ?auto_112012 ) ) ( not ( = ?auto_112011 ?auto_112015 ) ) ( not ( = ?auto_112011 ?auto_112012 ) ) ( not ( = ?auto_112013 ?auto_112015 ) ) ( not ( = ?auto_112013 ?auto_112012 ) ) ( not ( = ?auto_112015 ?auto_112012 ) ) ( not ( = ?auto_112017 ?auto_112014 ) ) ( not ( = ?auto_112017 ?auto_112012 ) ) ( not ( = ?auto_112014 ?auto_112012 ) ) ( not ( = ?auto_112010 ?auto_112014 ) ) ( not ( = ?auto_112010 ?auto_112017 ) ) ( not ( = ?auto_112011 ?auto_112014 ) ) ( not ( = ?auto_112011 ?auto_112017 ) ) ( not ( = ?auto_112013 ?auto_112014 ) ) ( not ( = ?auto_112013 ?auto_112017 ) ) ( not ( = ?auto_112015 ?auto_112014 ) ) ( not ( = ?auto_112015 ?auto_112017 ) ) ( ON ?auto_112017 ?auto_112016 ) ( not ( = ?auto_112010 ?auto_112016 ) ) ( not ( = ?auto_112011 ?auto_112016 ) ) ( not ( = ?auto_112013 ?auto_112016 ) ) ( not ( = ?auto_112015 ?auto_112016 ) ) ( not ( = ?auto_112012 ?auto_112016 ) ) ( not ( = ?auto_112017 ?auto_112016 ) ) ( not ( = ?auto_112014 ?auto_112016 ) ) ( ON ?auto_112014 ?auto_112017 ) ( ON-TABLE ?auto_112016 ) ( ON ?auto_112012 ?auto_112014 ) ( CLEAR ?auto_112013 ) ( ON ?auto_112015 ?auto_112012 ) ( CLEAR ?auto_112015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112016 ?auto_112017 ?auto_112014 ?auto_112012 )
      ( MAKE-2PILE ?auto_112010 ?auto_112011 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112034 - BLOCK
      ?auto_112035 - BLOCK
    )
    :vars
    (
      ?auto_112037 - BLOCK
      ?auto_112039 - BLOCK
      ?auto_112036 - BLOCK
      ?auto_112041 - BLOCK
      ?auto_112040 - BLOCK
      ?auto_112038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112034 ) ( not ( = ?auto_112034 ?auto_112035 ) ) ( not ( = ?auto_112034 ?auto_112037 ) ) ( not ( = ?auto_112035 ?auto_112037 ) ) ( not ( = ?auto_112034 ?auto_112039 ) ) ( not ( = ?auto_112034 ?auto_112036 ) ) ( not ( = ?auto_112035 ?auto_112039 ) ) ( not ( = ?auto_112035 ?auto_112036 ) ) ( not ( = ?auto_112037 ?auto_112039 ) ) ( not ( = ?auto_112037 ?auto_112036 ) ) ( not ( = ?auto_112039 ?auto_112036 ) ) ( not ( = ?auto_112041 ?auto_112040 ) ) ( not ( = ?auto_112041 ?auto_112036 ) ) ( not ( = ?auto_112040 ?auto_112036 ) ) ( not ( = ?auto_112034 ?auto_112040 ) ) ( not ( = ?auto_112034 ?auto_112041 ) ) ( not ( = ?auto_112035 ?auto_112040 ) ) ( not ( = ?auto_112035 ?auto_112041 ) ) ( not ( = ?auto_112037 ?auto_112040 ) ) ( not ( = ?auto_112037 ?auto_112041 ) ) ( not ( = ?auto_112039 ?auto_112040 ) ) ( not ( = ?auto_112039 ?auto_112041 ) ) ( ON ?auto_112041 ?auto_112038 ) ( not ( = ?auto_112034 ?auto_112038 ) ) ( not ( = ?auto_112035 ?auto_112038 ) ) ( not ( = ?auto_112037 ?auto_112038 ) ) ( not ( = ?auto_112039 ?auto_112038 ) ) ( not ( = ?auto_112036 ?auto_112038 ) ) ( not ( = ?auto_112041 ?auto_112038 ) ) ( not ( = ?auto_112040 ?auto_112038 ) ) ( ON ?auto_112040 ?auto_112041 ) ( ON-TABLE ?auto_112038 ) ( ON ?auto_112036 ?auto_112040 ) ( ON ?auto_112039 ?auto_112036 ) ( ON ?auto_112037 ?auto_112039 ) ( CLEAR ?auto_112037 ) ( HOLDING ?auto_112035 ) ( CLEAR ?auto_112034 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112034 ?auto_112035 ?auto_112037 )
      ( MAKE-2PILE ?auto_112034 ?auto_112035 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112042 - BLOCK
      ?auto_112043 - BLOCK
    )
    :vars
    (
      ?auto_112047 - BLOCK
      ?auto_112046 - BLOCK
      ?auto_112049 - BLOCK
      ?auto_112044 - BLOCK
      ?auto_112045 - BLOCK
      ?auto_112048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112042 ) ( not ( = ?auto_112042 ?auto_112043 ) ) ( not ( = ?auto_112042 ?auto_112047 ) ) ( not ( = ?auto_112043 ?auto_112047 ) ) ( not ( = ?auto_112042 ?auto_112046 ) ) ( not ( = ?auto_112042 ?auto_112049 ) ) ( not ( = ?auto_112043 ?auto_112046 ) ) ( not ( = ?auto_112043 ?auto_112049 ) ) ( not ( = ?auto_112047 ?auto_112046 ) ) ( not ( = ?auto_112047 ?auto_112049 ) ) ( not ( = ?auto_112046 ?auto_112049 ) ) ( not ( = ?auto_112044 ?auto_112045 ) ) ( not ( = ?auto_112044 ?auto_112049 ) ) ( not ( = ?auto_112045 ?auto_112049 ) ) ( not ( = ?auto_112042 ?auto_112045 ) ) ( not ( = ?auto_112042 ?auto_112044 ) ) ( not ( = ?auto_112043 ?auto_112045 ) ) ( not ( = ?auto_112043 ?auto_112044 ) ) ( not ( = ?auto_112047 ?auto_112045 ) ) ( not ( = ?auto_112047 ?auto_112044 ) ) ( not ( = ?auto_112046 ?auto_112045 ) ) ( not ( = ?auto_112046 ?auto_112044 ) ) ( ON ?auto_112044 ?auto_112048 ) ( not ( = ?auto_112042 ?auto_112048 ) ) ( not ( = ?auto_112043 ?auto_112048 ) ) ( not ( = ?auto_112047 ?auto_112048 ) ) ( not ( = ?auto_112046 ?auto_112048 ) ) ( not ( = ?auto_112049 ?auto_112048 ) ) ( not ( = ?auto_112044 ?auto_112048 ) ) ( not ( = ?auto_112045 ?auto_112048 ) ) ( ON ?auto_112045 ?auto_112044 ) ( ON-TABLE ?auto_112048 ) ( ON ?auto_112049 ?auto_112045 ) ( ON ?auto_112046 ?auto_112049 ) ( ON ?auto_112047 ?auto_112046 ) ( CLEAR ?auto_112042 ) ( ON ?auto_112043 ?auto_112047 ) ( CLEAR ?auto_112043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112048 ?auto_112044 ?auto_112045 ?auto_112049 ?auto_112046 ?auto_112047 )
      ( MAKE-2PILE ?auto_112042 ?auto_112043 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112050 - BLOCK
      ?auto_112051 - BLOCK
    )
    :vars
    (
      ?auto_112053 - BLOCK
      ?auto_112056 - BLOCK
      ?auto_112055 - BLOCK
      ?auto_112052 - BLOCK
      ?auto_112054 - BLOCK
      ?auto_112057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112050 ?auto_112051 ) ) ( not ( = ?auto_112050 ?auto_112053 ) ) ( not ( = ?auto_112051 ?auto_112053 ) ) ( not ( = ?auto_112050 ?auto_112056 ) ) ( not ( = ?auto_112050 ?auto_112055 ) ) ( not ( = ?auto_112051 ?auto_112056 ) ) ( not ( = ?auto_112051 ?auto_112055 ) ) ( not ( = ?auto_112053 ?auto_112056 ) ) ( not ( = ?auto_112053 ?auto_112055 ) ) ( not ( = ?auto_112056 ?auto_112055 ) ) ( not ( = ?auto_112052 ?auto_112054 ) ) ( not ( = ?auto_112052 ?auto_112055 ) ) ( not ( = ?auto_112054 ?auto_112055 ) ) ( not ( = ?auto_112050 ?auto_112054 ) ) ( not ( = ?auto_112050 ?auto_112052 ) ) ( not ( = ?auto_112051 ?auto_112054 ) ) ( not ( = ?auto_112051 ?auto_112052 ) ) ( not ( = ?auto_112053 ?auto_112054 ) ) ( not ( = ?auto_112053 ?auto_112052 ) ) ( not ( = ?auto_112056 ?auto_112054 ) ) ( not ( = ?auto_112056 ?auto_112052 ) ) ( ON ?auto_112052 ?auto_112057 ) ( not ( = ?auto_112050 ?auto_112057 ) ) ( not ( = ?auto_112051 ?auto_112057 ) ) ( not ( = ?auto_112053 ?auto_112057 ) ) ( not ( = ?auto_112056 ?auto_112057 ) ) ( not ( = ?auto_112055 ?auto_112057 ) ) ( not ( = ?auto_112052 ?auto_112057 ) ) ( not ( = ?auto_112054 ?auto_112057 ) ) ( ON ?auto_112054 ?auto_112052 ) ( ON-TABLE ?auto_112057 ) ( ON ?auto_112055 ?auto_112054 ) ( ON ?auto_112056 ?auto_112055 ) ( ON ?auto_112053 ?auto_112056 ) ( ON ?auto_112051 ?auto_112053 ) ( CLEAR ?auto_112051 ) ( HOLDING ?auto_112050 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112050 )
      ( MAKE-2PILE ?auto_112050 ?auto_112051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112058 - BLOCK
      ?auto_112059 - BLOCK
    )
    :vars
    (
      ?auto_112060 - BLOCK
      ?auto_112065 - BLOCK
      ?auto_112061 - BLOCK
      ?auto_112062 - BLOCK
      ?auto_112064 - BLOCK
      ?auto_112063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112058 ?auto_112059 ) ) ( not ( = ?auto_112058 ?auto_112060 ) ) ( not ( = ?auto_112059 ?auto_112060 ) ) ( not ( = ?auto_112058 ?auto_112065 ) ) ( not ( = ?auto_112058 ?auto_112061 ) ) ( not ( = ?auto_112059 ?auto_112065 ) ) ( not ( = ?auto_112059 ?auto_112061 ) ) ( not ( = ?auto_112060 ?auto_112065 ) ) ( not ( = ?auto_112060 ?auto_112061 ) ) ( not ( = ?auto_112065 ?auto_112061 ) ) ( not ( = ?auto_112062 ?auto_112064 ) ) ( not ( = ?auto_112062 ?auto_112061 ) ) ( not ( = ?auto_112064 ?auto_112061 ) ) ( not ( = ?auto_112058 ?auto_112064 ) ) ( not ( = ?auto_112058 ?auto_112062 ) ) ( not ( = ?auto_112059 ?auto_112064 ) ) ( not ( = ?auto_112059 ?auto_112062 ) ) ( not ( = ?auto_112060 ?auto_112064 ) ) ( not ( = ?auto_112060 ?auto_112062 ) ) ( not ( = ?auto_112065 ?auto_112064 ) ) ( not ( = ?auto_112065 ?auto_112062 ) ) ( ON ?auto_112062 ?auto_112063 ) ( not ( = ?auto_112058 ?auto_112063 ) ) ( not ( = ?auto_112059 ?auto_112063 ) ) ( not ( = ?auto_112060 ?auto_112063 ) ) ( not ( = ?auto_112065 ?auto_112063 ) ) ( not ( = ?auto_112061 ?auto_112063 ) ) ( not ( = ?auto_112062 ?auto_112063 ) ) ( not ( = ?auto_112064 ?auto_112063 ) ) ( ON ?auto_112064 ?auto_112062 ) ( ON-TABLE ?auto_112063 ) ( ON ?auto_112061 ?auto_112064 ) ( ON ?auto_112065 ?auto_112061 ) ( ON ?auto_112060 ?auto_112065 ) ( ON ?auto_112059 ?auto_112060 ) ( ON ?auto_112058 ?auto_112059 ) ( CLEAR ?auto_112058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112063 ?auto_112062 ?auto_112064 ?auto_112061 ?auto_112065 ?auto_112060 ?auto_112059 )
      ( MAKE-2PILE ?auto_112058 ?auto_112059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112071 - BLOCK
      ?auto_112072 - BLOCK
      ?auto_112073 - BLOCK
      ?auto_112074 - BLOCK
      ?auto_112075 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_112075 ) ( CLEAR ?auto_112074 ) ( ON-TABLE ?auto_112071 ) ( ON ?auto_112072 ?auto_112071 ) ( ON ?auto_112073 ?auto_112072 ) ( ON ?auto_112074 ?auto_112073 ) ( not ( = ?auto_112071 ?auto_112072 ) ) ( not ( = ?auto_112071 ?auto_112073 ) ) ( not ( = ?auto_112071 ?auto_112074 ) ) ( not ( = ?auto_112071 ?auto_112075 ) ) ( not ( = ?auto_112072 ?auto_112073 ) ) ( not ( = ?auto_112072 ?auto_112074 ) ) ( not ( = ?auto_112072 ?auto_112075 ) ) ( not ( = ?auto_112073 ?auto_112074 ) ) ( not ( = ?auto_112073 ?auto_112075 ) ) ( not ( = ?auto_112074 ?auto_112075 ) ) )
    :subtasks
    ( ( !STACK ?auto_112075 ?auto_112074 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112076 - BLOCK
      ?auto_112077 - BLOCK
      ?auto_112078 - BLOCK
      ?auto_112079 - BLOCK
      ?auto_112080 - BLOCK
    )
    :vars
    (
      ?auto_112081 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_112079 ) ( ON-TABLE ?auto_112076 ) ( ON ?auto_112077 ?auto_112076 ) ( ON ?auto_112078 ?auto_112077 ) ( ON ?auto_112079 ?auto_112078 ) ( not ( = ?auto_112076 ?auto_112077 ) ) ( not ( = ?auto_112076 ?auto_112078 ) ) ( not ( = ?auto_112076 ?auto_112079 ) ) ( not ( = ?auto_112076 ?auto_112080 ) ) ( not ( = ?auto_112077 ?auto_112078 ) ) ( not ( = ?auto_112077 ?auto_112079 ) ) ( not ( = ?auto_112077 ?auto_112080 ) ) ( not ( = ?auto_112078 ?auto_112079 ) ) ( not ( = ?auto_112078 ?auto_112080 ) ) ( not ( = ?auto_112079 ?auto_112080 ) ) ( ON ?auto_112080 ?auto_112081 ) ( CLEAR ?auto_112080 ) ( HAND-EMPTY ) ( not ( = ?auto_112076 ?auto_112081 ) ) ( not ( = ?auto_112077 ?auto_112081 ) ) ( not ( = ?auto_112078 ?auto_112081 ) ) ( not ( = ?auto_112079 ?auto_112081 ) ) ( not ( = ?auto_112080 ?auto_112081 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112080 ?auto_112081 )
      ( MAKE-5PILE ?auto_112076 ?auto_112077 ?auto_112078 ?auto_112079 ?auto_112080 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112082 - BLOCK
      ?auto_112083 - BLOCK
      ?auto_112084 - BLOCK
      ?auto_112085 - BLOCK
      ?auto_112086 - BLOCK
    )
    :vars
    (
      ?auto_112087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112082 ) ( ON ?auto_112083 ?auto_112082 ) ( ON ?auto_112084 ?auto_112083 ) ( not ( = ?auto_112082 ?auto_112083 ) ) ( not ( = ?auto_112082 ?auto_112084 ) ) ( not ( = ?auto_112082 ?auto_112085 ) ) ( not ( = ?auto_112082 ?auto_112086 ) ) ( not ( = ?auto_112083 ?auto_112084 ) ) ( not ( = ?auto_112083 ?auto_112085 ) ) ( not ( = ?auto_112083 ?auto_112086 ) ) ( not ( = ?auto_112084 ?auto_112085 ) ) ( not ( = ?auto_112084 ?auto_112086 ) ) ( not ( = ?auto_112085 ?auto_112086 ) ) ( ON ?auto_112086 ?auto_112087 ) ( CLEAR ?auto_112086 ) ( not ( = ?auto_112082 ?auto_112087 ) ) ( not ( = ?auto_112083 ?auto_112087 ) ) ( not ( = ?auto_112084 ?auto_112087 ) ) ( not ( = ?auto_112085 ?auto_112087 ) ) ( not ( = ?auto_112086 ?auto_112087 ) ) ( HOLDING ?auto_112085 ) ( CLEAR ?auto_112084 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112082 ?auto_112083 ?auto_112084 ?auto_112085 )
      ( MAKE-5PILE ?auto_112082 ?auto_112083 ?auto_112084 ?auto_112085 ?auto_112086 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112088 - BLOCK
      ?auto_112089 - BLOCK
      ?auto_112090 - BLOCK
      ?auto_112091 - BLOCK
      ?auto_112092 - BLOCK
    )
    :vars
    (
      ?auto_112093 - BLOCK
      ?auto_112094 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112088 ) ( ON ?auto_112089 ?auto_112088 ) ( ON ?auto_112090 ?auto_112089 ) ( not ( = ?auto_112088 ?auto_112089 ) ) ( not ( = ?auto_112088 ?auto_112090 ) ) ( not ( = ?auto_112088 ?auto_112091 ) ) ( not ( = ?auto_112088 ?auto_112092 ) ) ( not ( = ?auto_112089 ?auto_112090 ) ) ( not ( = ?auto_112089 ?auto_112091 ) ) ( not ( = ?auto_112089 ?auto_112092 ) ) ( not ( = ?auto_112090 ?auto_112091 ) ) ( not ( = ?auto_112090 ?auto_112092 ) ) ( not ( = ?auto_112091 ?auto_112092 ) ) ( ON ?auto_112092 ?auto_112093 ) ( not ( = ?auto_112088 ?auto_112093 ) ) ( not ( = ?auto_112089 ?auto_112093 ) ) ( not ( = ?auto_112090 ?auto_112093 ) ) ( not ( = ?auto_112091 ?auto_112093 ) ) ( not ( = ?auto_112092 ?auto_112093 ) ) ( CLEAR ?auto_112090 ) ( ON ?auto_112091 ?auto_112092 ) ( CLEAR ?auto_112091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112094 ) ( ON ?auto_112093 ?auto_112094 ) ( not ( = ?auto_112094 ?auto_112093 ) ) ( not ( = ?auto_112094 ?auto_112092 ) ) ( not ( = ?auto_112094 ?auto_112091 ) ) ( not ( = ?auto_112088 ?auto_112094 ) ) ( not ( = ?auto_112089 ?auto_112094 ) ) ( not ( = ?auto_112090 ?auto_112094 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112094 ?auto_112093 ?auto_112092 )
      ( MAKE-5PILE ?auto_112088 ?auto_112089 ?auto_112090 ?auto_112091 ?auto_112092 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112095 - BLOCK
      ?auto_112096 - BLOCK
      ?auto_112097 - BLOCK
      ?auto_112098 - BLOCK
      ?auto_112099 - BLOCK
    )
    :vars
    (
      ?auto_112100 - BLOCK
      ?auto_112101 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112095 ) ( ON ?auto_112096 ?auto_112095 ) ( not ( = ?auto_112095 ?auto_112096 ) ) ( not ( = ?auto_112095 ?auto_112097 ) ) ( not ( = ?auto_112095 ?auto_112098 ) ) ( not ( = ?auto_112095 ?auto_112099 ) ) ( not ( = ?auto_112096 ?auto_112097 ) ) ( not ( = ?auto_112096 ?auto_112098 ) ) ( not ( = ?auto_112096 ?auto_112099 ) ) ( not ( = ?auto_112097 ?auto_112098 ) ) ( not ( = ?auto_112097 ?auto_112099 ) ) ( not ( = ?auto_112098 ?auto_112099 ) ) ( ON ?auto_112099 ?auto_112100 ) ( not ( = ?auto_112095 ?auto_112100 ) ) ( not ( = ?auto_112096 ?auto_112100 ) ) ( not ( = ?auto_112097 ?auto_112100 ) ) ( not ( = ?auto_112098 ?auto_112100 ) ) ( not ( = ?auto_112099 ?auto_112100 ) ) ( ON ?auto_112098 ?auto_112099 ) ( CLEAR ?auto_112098 ) ( ON-TABLE ?auto_112101 ) ( ON ?auto_112100 ?auto_112101 ) ( not ( = ?auto_112101 ?auto_112100 ) ) ( not ( = ?auto_112101 ?auto_112099 ) ) ( not ( = ?auto_112101 ?auto_112098 ) ) ( not ( = ?auto_112095 ?auto_112101 ) ) ( not ( = ?auto_112096 ?auto_112101 ) ) ( not ( = ?auto_112097 ?auto_112101 ) ) ( HOLDING ?auto_112097 ) ( CLEAR ?auto_112096 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112095 ?auto_112096 ?auto_112097 )
      ( MAKE-5PILE ?auto_112095 ?auto_112096 ?auto_112097 ?auto_112098 ?auto_112099 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112102 - BLOCK
      ?auto_112103 - BLOCK
      ?auto_112104 - BLOCK
      ?auto_112105 - BLOCK
      ?auto_112106 - BLOCK
    )
    :vars
    (
      ?auto_112107 - BLOCK
      ?auto_112108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112102 ) ( ON ?auto_112103 ?auto_112102 ) ( not ( = ?auto_112102 ?auto_112103 ) ) ( not ( = ?auto_112102 ?auto_112104 ) ) ( not ( = ?auto_112102 ?auto_112105 ) ) ( not ( = ?auto_112102 ?auto_112106 ) ) ( not ( = ?auto_112103 ?auto_112104 ) ) ( not ( = ?auto_112103 ?auto_112105 ) ) ( not ( = ?auto_112103 ?auto_112106 ) ) ( not ( = ?auto_112104 ?auto_112105 ) ) ( not ( = ?auto_112104 ?auto_112106 ) ) ( not ( = ?auto_112105 ?auto_112106 ) ) ( ON ?auto_112106 ?auto_112107 ) ( not ( = ?auto_112102 ?auto_112107 ) ) ( not ( = ?auto_112103 ?auto_112107 ) ) ( not ( = ?auto_112104 ?auto_112107 ) ) ( not ( = ?auto_112105 ?auto_112107 ) ) ( not ( = ?auto_112106 ?auto_112107 ) ) ( ON ?auto_112105 ?auto_112106 ) ( ON-TABLE ?auto_112108 ) ( ON ?auto_112107 ?auto_112108 ) ( not ( = ?auto_112108 ?auto_112107 ) ) ( not ( = ?auto_112108 ?auto_112106 ) ) ( not ( = ?auto_112108 ?auto_112105 ) ) ( not ( = ?auto_112102 ?auto_112108 ) ) ( not ( = ?auto_112103 ?auto_112108 ) ) ( not ( = ?auto_112104 ?auto_112108 ) ) ( CLEAR ?auto_112103 ) ( ON ?auto_112104 ?auto_112105 ) ( CLEAR ?auto_112104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112108 ?auto_112107 ?auto_112106 ?auto_112105 )
      ( MAKE-5PILE ?auto_112102 ?auto_112103 ?auto_112104 ?auto_112105 ?auto_112106 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112109 - BLOCK
      ?auto_112110 - BLOCK
      ?auto_112111 - BLOCK
      ?auto_112112 - BLOCK
      ?auto_112113 - BLOCK
    )
    :vars
    (
      ?auto_112114 - BLOCK
      ?auto_112115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112109 ) ( not ( = ?auto_112109 ?auto_112110 ) ) ( not ( = ?auto_112109 ?auto_112111 ) ) ( not ( = ?auto_112109 ?auto_112112 ) ) ( not ( = ?auto_112109 ?auto_112113 ) ) ( not ( = ?auto_112110 ?auto_112111 ) ) ( not ( = ?auto_112110 ?auto_112112 ) ) ( not ( = ?auto_112110 ?auto_112113 ) ) ( not ( = ?auto_112111 ?auto_112112 ) ) ( not ( = ?auto_112111 ?auto_112113 ) ) ( not ( = ?auto_112112 ?auto_112113 ) ) ( ON ?auto_112113 ?auto_112114 ) ( not ( = ?auto_112109 ?auto_112114 ) ) ( not ( = ?auto_112110 ?auto_112114 ) ) ( not ( = ?auto_112111 ?auto_112114 ) ) ( not ( = ?auto_112112 ?auto_112114 ) ) ( not ( = ?auto_112113 ?auto_112114 ) ) ( ON ?auto_112112 ?auto_112113 ) ( ON-TABLE ?auto_112115 ) ( ON ?auto_112114 ?auto_112115 ) ( not ( = ?auto_112115 ?auto_112114 ) ) ( not ( = ?auto_112115 ?auto_112113 ) ) ( not ( = ?auto_112115 ?auto_112112 ) ) ( not ( = ?auto_112109 ?auto_112115 ) ) ( not ( = ?auto_112110 ?auto_112115 ) ) ( not ( = ?auto_112111 ?auto_112115 ) ) ( ON ?auto_112111 ?auto_112112 ) ( CLEAR ?auto_112111 ) ( HOLDING ?auto_112110 ) ( CLEAR ?auto_112109 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112109 ?auto_112110 )
      ( MAKE-5PILE ?auto_112109 ?auto_112110 ?auto_112111 ?auto_112112 ?auto_112113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112116 - BLOCK
      ?auto_112117 - BLOCK
      ?auto_112118 - BLOCK
      ?auto_112119 - BLOCK
      ?auto_112120 - BLOCK
    )
    :vars
    (
      ?auto_112122 - BLOCK
      ?auto_112121 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112116 ) ( not ( = ?auto_112116 ?auto_112117 ) ) ( not ( = ?auto_112116 ?auto_112118 ) ) ( not ( = ?auto_112116 ?auto_112119 ) ) ( not ( = ?auto_112116 ?auto_112120 ) ) ( not ( = ?auto_112117 ?auto_112118 ) ) ( not ( = ?auto_112117 ?auto_112119 ) ) ( not ( = ?auto_112117 ?auto_112120 ) ) ( not ( = ?auto_112118 ?auto_112119 ) ) ( not ( = ?auto_112118 ?auto_112120 ) ) ( not ( = ?auto_112119 ?auto_112120 ) ) ( ON ?auto_112120 ?auto_112122 ) ( not ( = ?auto_112116 ?auto_112122 ) ) ( not ( = ?auto_112117 ?auto_112122 ) ) ( not ( = ?auto_112118 ?auto_112122 ) ) ( not ( = ?auto_112119 ?auto_112122 ) ) ( not ( = ?auto_112120 ?auto_112122 ) ) ( ON ?auto_112119 ?auto_112120 ) ( ON-TABLE ?auto_112121 ) ( ON ?auto_112122 ?auto_112121 ) ( not ( = ?auto_112121 ?auto_112122 ) ) ( not ( = ?auto_112121 ?auto_112120 ) ) ( not ( = ?auto_112121 ?auto_112119 ) ) ( not ( = ?auto_112116 ?auto_112121 ) ) ( not ( = ?auto_112117 ?auto_112121 ) ) ( not ( = ?auto_112118 ?auto_112121 ) ) ( ON ?auto_112118 ?auto_112119 ) ( CLEAR ?auto_112116 ) ( ON ?auto_112117 ?auto_112118 ) ( CLEAR ?auto_112117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112121 ?auto_112122 ?auto_112120 ?auto_112119 ?auto_112118 )
      ( MAKE-5PILE ?auto_112116 ?auto_112117 ?auto_112118 ?auto_112119 ?auto_112120 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112123 - BLOCK
      ?auto_112124 - BLOCK
      ?auto_112125 - BLOCK
      ?auto_112126 - BLOCK
      ?auto_112127 - BLOCK
    )
    :vars
    (
      ?auto_112128 - BLOCK
      ?auto_112129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112123 ?auto_112124 ) ) ( not ( = ?auto_112123 ?auto_112125 ) ) ( not ( = ?auto_112123 ?auto_112126 ) ) ( not ( = ?auto_112123 ?auto_112127 ) ) ( not ( = ?auto_112124 ?auto_112125 ) ) ( not ( = ?auto_112124 ?auto_112126 ) ) ( not ( = ?auto_112124 ?auto_112127 ) ) ( not ( = ?auto_112125 ?auto_112126 ) ) ( not ( = ?auto_112125 ?auto_112127 ) ) ( not ( = ?auto_112126 ?auto_112127 ) ) ( ON ?auto_112127 ?auto_112128 ) ( not ( = ?auto_112123 ?auto_112128 ) ) ( not ( = ?auto_112124 ?auto_112128 ) ) ( not ( = ?auto_112125 ?auto_112128 ) ) ( not ( = ?auto_112126 ?auto_112128 ) ) ( not ( = ?auto_112127 ?auto_112128 ) ) ( ON ?auto_112126 ?auto_112127 ) ( ON-TABLE ?auto_112129 ) ( ON ?auto_112128 ?auto_112129 ) ( not ( = ?auto_112129 ?auto_112128 ) ) ( not ( = ?auto_112129 ?auto_112127 ) ) ( not ( = ?auto_112129 ?auto_112126 ) ) ( not ( = ?auto_112123 ?auto_112129 ) ) ( not ( = ?auto_112124 ?auto_112129 ) ) ( not ( = ?auto_112125 ?auto_112129 ) ) ( ON ?auto_112125 ?auto_112126 ) ( ON ?auto_112124 ?auto_112125 ) ( CLEAR ?auto_112124 ) ( HOLDING ?auto_112123 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112123 )
      ( MAKE-5PILE ?auto_112123 ?auto_112124 ?auto_112125 ?auto_112126 ?auto_112127 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112130 - BLOCK
      ?auto_112131 - BLOCK
      ?auto_112132 - BLOCK
      ?auto_112133 - BLOCK
      ?auto_112134 - BLOCK
    )
    :vars
    (
      ?auto_112136 - BLOCK
      ?auto_112135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112130 ?auto_112131 ) ) ( not ( = ?auto_112130 ?auto_112132 ) ) ( not ( = ?auto_112130 ?auto_112133 ) ) ( not ( = ?auto_112130 ?auto_112134 ) ) ( not ( = ?auto_112131 ?auto_112132 ) ) ( not ( = ?auto_112131 ?auto_112133 ) ) ( not ( = ?auto_112131 ?auto_112134 ) ) ( not ( = ?auto_112132 ?auto_112133 ) ) ( not ( = ?auto_112132 ?auto_112134 ) ) ( not ( = ?auto_112133 ?auto_112134 ) ) ( ON ?auto_112134 ?auto_112136 ) ( not ( = ?auto_112130 ?auto_112136 ) ) ( not ( = ?auto_112131 ?auto_112136 ) ) ( not ( = ?auto_112132 ?auto_112136 ) ) ( not ( = ?auto_112133 ?auto_112136 ) ) ( not ( = ?auto_112134 ?auto_112136 ) ) ( ON ?auto_112133 ?auto_112134 ) ( ON-TABLE ?auto_112135 ) ( ON ?auto_112136 ?auto_112135 ) ( not ( = ?auto_112135 ?auto_112136 ) ) ( not ( = ?auto_112135 ?auto_112134 ) ) ( not ( = ?auto_112135 ?auto_112133 ) ) ( not ( = ?auto_112130 ?auto_112135 ) ) ( not ( = ?auto_112131 ?auto_112135 ) ) ( not ( = ?auto_112132 ?auto_112135 ) ) ( ON ?auto_112132 ?auto_112133 ) ( ON ?auto_112131 ?auto_112132 ) ( ON ?auto_112130 ?auto_112131 ) ( CLEAR ?auto_112130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112135 ?auto_112136 ?auto_112134 ?auto_112133 ?auto_112132 ?auto_112131 )
      ( MAKE-5PILE ?auto_112130 ?auto_112131 ?auto_112132 ?auto_112133 ?auto_112134 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112137 - BLOCK
      ?auto_112138 - BLOCK
      ?auto_112139 - BLOCK
      ?auto_112140 - BLOCK
      ?auto_112141 - BLOCK
    )
    :vars
    (
      ?auto_112143 - BLOCK
      ?auto_112142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112137 ?auto_112138 ) ) ( not ( = ?auto_112137 ?auto_112139 ) ) ( not ( = ?auto_112137 ?auto_112140 ) ) ( not ( = ?auto_112137 ?auto_112141 ) ) ( not ( = ?auto_112138 ?auto_112139 ) ) ( not ( = ?auto_112138 ?auto_112140 ) ) ( not ( = ?auto_112138 ?auto_112141 ) ) ( not ( = ?auto_112139 ?auto_112140 ) ) ( not ( = ?auto_112139 ?auto_112141 ) ) ( not ( = ?auto_112140 ?auto_112141 ) ) ( ON ?auto_112141 ?auto_112143 ) ( not ( = ?auto_112137 ?auto_112143 ) ) ( not ( = ?auto_112138 ?auto_112143 ) ) ( not ( = ?auto_112139 ?auto_112143 ) ) ( not ( = ?auto_112140 ?auto_112143 ) ) ( not ( = ?auto_112141 ?auto_112143 ) ) ( ON ?auto_112140 ?auto_112141 ) ( ON-TABLE ?auto_112142 ) ( ON ?auto_112143 ?auto_112142 ) ( not ( = ?auto_112142 ?auto_112143 ) ) ( not ( = ?auto_112142 ?auto_112141 ) ) ( not ( = ?auto_112142 ?auto_112140 ) ) ( not ( = ?auto_112137 ?auto_112142 ) ) ( not ( = ?auto_112138 ?auto_112142 ) ) ( not ( = ?auto_112139 ?auto_112142 ) ) ( ON ?auto_112139 ?auto_112140 ) ( ON ?auto_112138 ?auto_112139 ) ( HOLDING ?auto_112137 ) ( CLEAR ?auto_112138 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112142 ?auto_112143 ?auto_112141 ?auto_112140 ?auto_112139 ?auto_112138 ?auto_112137 )
      ( MAKE-5PILE ?auto_112137 ?auto_112138 ?auto_112139 ?auto_112140 ?auto_112141 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112144 - BLOCK
      ?auto_112145 - BLOCK
      ?auto_112146 - BLOCK
      ?auto_112147 - BLOCK
      ?auto_112148 - BLOCK
    )
    :vars
    (
      ?auto_112149 - BLOCK
      ?auto_112150 - BLOCK
      ?auto_112151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112144 ?auto_112145 ) ) ( not ( = ?auto_112144 ?auto_112146 ) ) ( not ( = ?auto_112144 ?auto_112147 ) ) ( not ( = ?auto_112144 ?auto_112148 ) ) ( not ( = ?auto_112145 ?auto_112146 ) ) ( not ( = ?auto_112145 ?auto_112147 ) ) ( not ( = ?auto_112145 ?auto_112148 ) ) ( not ( = ?auto_112146 ?auto_112147 ) ) ( not ( = ?auto_112146 ?auto_112148 ) ) ( not ( = ?auto_112147 ?auto_112148 ) ) ( ON ?auto_112148 ?auto_112149 ) ( not ( = ?auto_112144 ?auto_112149 ) ) ( not ( = ?auto_112145 ?auto_112149 ) ) ( not ( = ?auto_112146 ?auto_112149 ) ) ( not ( = ?auto_112147 ?auto_112149 ) ) ( not ( = ?auto_112148 ?auto_112149 ) ) ( ON ?auto_112147 ?auto_112148 ) ( ON-TABLE ?auto_112150 ) ( ON ?auto_112149 ?auto_112150 ) ( not ( = ?auto_112150 ?auto_112149 ) ) ( not ( = ?auto_112150 ?auto_112148 ) ) ( not ( = ?auto_112150 ?auto_112147 ) ) ( not ( = ?auto_112144 ?auto_112150 ) ) ( not ( = ?auto_112145 ?auto_112150 ) ) ( not ( = ?auto_112146 ?auto_112150 ) ) ( ON ?auto_112146 ?auto_112147 ) ( ON ?auto_112145 ?auto_112146 ) ( CLEAR ?auto_112145 ) ( ON ?auto_112144 ?auto_112151 ) ( CLEAR ?auto_112144 ) ( HAND-EMPTY ) ( not ( = ?auto_112144 ?auto_112151 ) ) ( not ( = ?auto_112145 ?auto_112151 ) ) ( not ( = ?auto_112146 ?auto_112151 ) ) ( not ( = ?auto_112147 ?auto_112151 ) ) ( not ( = ?auto_112148 ?auto_112151 ) ) ( not ( = ?auto_112149 ?auto_112151 ) ) ( not ( = ?auto_112150 ?auto_112151 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112144 ?auto_112151 )
      ( MAKE-5PILE ?auto_112144 ?auto_112145 ?auto_112146 ?auto_112147 ?auto_112148 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112152 - BLOCK
      ?auto_112153 - BLOCK
      ?auto_112154 - BLOCK
      ?auto_112155 - BLOCK
      ?auto_112156 - BLOCK
    )
    :vars
    (
      ?auto_112159 - BLOCK
      ?auto_112157 - BLOCK
      ?auto_112158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112152 ?auto_112153 ) ) ( not ( = ?auto_112152 ?auto_112154 ) ) ( not ( = ?auto_112152 ?auto_112155 ) ) ( not ( = ?auto_112152 ?auto_112156 ) ) ( not ( = ?auto_112153 ?auto_112154 ) ) ( not ( = ?auto_112153 ?auto_112155 ) ) ( not ( = ?auto_112153 ?auto_112156 ) ) ( not ( = ?auto_112154 ?auto_112155 ) ) ( not ( = ?auto_112154 ?auto_112156 ) ) ( not ( = ?auto_112155 ?auto_112156 ) ) ( ON ?auto_112156 ?auto_112159 ) ( not ( = ?auto_112152 ?auto_112159 ) ) ( not ( = ?auto_112153 ?auto_112159 ) ) ( not ( = ?auto_112154 ?auto_112159 ) ) ( not ( = ?auto_112155 ?auto_112159 ) ) ( not ( = ?auto_112156 ?auto_112159 ) ) ( ON ?auto_112155 ?auto_112156 ) ( ON-TABLE ?auto_112157 ) ( ON ?auto_112159 ?auto_112157 ) ( not ( = ?auto_112157 ?auto_112159 ) ) ( not ( = ?auto_112157 ?auto_112156 ) ) ( not ( = ?auto_112157 ?auto_112155 ) ) ( not ( = ?auto_112152 ?auto_112157 ) ) ( not ( = ?auto_112153 ?auto_112157 ) ) ( not ( = ?auto_112154 ?auto_112157 ) ) ( ON ?auto_112154 ?auto_112155 ) ( ON ?auto_112152 ?auto_112158 ) ( CLEAR ?auto_112152 ) ( not ( = ?auto_112152 ?auto_112158 ) ) ( not ( = ?auto_112153 ?auto_112158 ) ) ( not ( = ?auto_112154 ?auto_112158 ) ) ( not ( = ?auto_112155 ?auto_112158 ) ) ( not ( = ?auto_112156 ?auto_112158 ) ) ( not ( = ?auto_112159 ?auto_112158 ) ) ( not ( = ?auto_112157 ?auto_112158 ) ) ( HOLDING ?auto_112153 ) ( CLEAR ?auto_112154 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112157 ?auto_112159 ?auto_112156 ?auto_112155 ?auto_112154 ?auto_112153 )
      ( MAKE-5PILE ?auto_112152 ?auto_112153 ?auto_112154 ?auto_112155 ?auto_112156 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112160 - BLOCK
      ?auto_112161 - BLOCK
      ?auto_112162 - BLOCK
      ?auto_112163 - BLOCK
      ?auto_112164 - BLOCK
    )
    :vars
    (
      ?auto_112167 - BLOCK
      ?auto_112166 - BLOCK
      ?auto_112165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112160 ?auto_112161 ) ) ( not ( = ?auto_112160 ?auto_112162 ) ) ( not ( = ?auto_112160 ?auto_112163 ) ) ( not ( = ?auto_112160 ?auto_112164 ) ) ( not ( = ?auto_112161 ?auto_112162 ) ) ( not ( = ?auto_112161 ?auto_112163 ) ) ( not ( = ?auto_112161 ?auto_112164 ) ) ( not ( = ?auto_112162 ?auto_112163 ) ) ( not ( = ?auto_112162 ?auto_112164 ) ) ( not ( = ?auto_112163 ?auto_112164 ) ) ( ON ?auto_112164 ?auto_112167 ) ( not ( = ?auto_112160 ?auto_112167 ) ) ( not ( = ?auto_112161 ?auto_112167 ) ) ( not ( = ?auto_112162 ?auto_112167 ) ) ( not ( = ?auto_112163 ?auto_112167 ) ) ( not ( = ?auto_112164 ?auto_112167 ) ) ( ON ?auto_112163 ?auto_112164 ) ( ON-TABLE ?auto_112166 ) ( ON ?auto_112167 ?auto_112166 ) ( not ( = ?auto_112166 ?auto_112167 ) ) ( not ( = ?auto_112166 ?auto_112164 ) ) ( not ( = ?auto_112166 ?auto_112163 ) ) ( not ( = ?auto_112160 ?auto_112166 ) ) ( not ( = ?auto_112161 ?auto_112166 ) ) ( not ( = ?auto_112162 ?auto_112166 ) ) ( ON ?auto_112162 ?auto_112163 ) ( ON ?auto_112160 ?auto_112165 ) ( not ( = ?auto_112160 ?auto_112165 ) ) ( not ( = ?auto_112161 ?auto_112165 ) ) ( not ( = ?auto_112162 ?auto_112165 ) ) ( not ( = ?auto_112163 ?auto_112165 ) ) ( not ( = ?auto_112164 ?auto_112165 ) ) ( not ( = ?auto_112167 ?auto_112165 ) ) ( not ( = ?auto_112166 ?auto_112165 ) ) ( CLEAR ?auto_112162 ) ( ON ?auto_112161 ?auto_112160 ) ( CLEAR ?auto_112161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112165 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112165 ?auto_112160 )
      ( MAKE-5PILE ?auto_112160 ?auto_112161 ?auto_112162 ?auto_112163 ?auto_112164 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112168 - BLOCK
      ?auto_112169 - BLOCK
      ?auto_112170 - BLOCK
      ?auto_112171 - BLOCK
      ?auto_112172 - BLOCK
    )
    :vars
    (
      ?auto_112173 - BLOCK
      ?auto_112175 - BLOCK
      ?auto_112174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112168 ?auto_112169 ) ) ( not ( = ?auto_112168 ?auto_112170 ) ) ( not ( = ?auto_112168 ?auto_112171 ) ) ( not ( = ?auto_112168 ?auto_112172 ) ) ( not ( = ?auto_112169 ?auto_112170 ) ) ( not ( = ?auto_112169 ?auto_112171 ) ) ( not ( = ?auto_112169 ?auto_112172 ) ) ( not ( = ?auto_112170 ?auto_112171 ) ) ( not ( = ?auto_112170 ?auto_112172 ) ) ( not ( = ?auto_112171 ?auto_112172 ) ) ( ON ?auto_112172 ?auto_112173 ) ( not ( = ?auto_112168 ?auto_112173 ) ) ( not ( = ?auto_112169 ?auto_112173 ) ) ( not ( = ?auto_112170 ?auto_112173 ) ) ( not ( = ?auto_112171 ?auto_112173 ) ) ( not ( = ?auto_112172 ?auto_112173 ) ) ( ON ?auto_112171 ?auto_112172 ) ( ON-TABLE ?auto_112175 ) ( ON ?auto_112173 ?auto_112175 ) ( not ( = ?auto_112175 ?auto_112173 ) ) ( not ( = ?auto_112175 ?auto_112172 ) ) ( not ( = ?auto_112175 ?auto_112171 ) ) ( not ( = ?auto_112168 ?auto_112175 ) ) ( not ( = ?auto_112169 ?auto_112175 ) ) ( not ( = ?auto_112170 ?auto_112175 ) ) ( ON ?auto_112168 ?auto_112174 ) ( not ( = ?auto_112168 ?auto_112174 ) ) ( not ( = ?auto_112169 ?auto_112174 ) ) ( not ( = ?auto_112170 ?auto_112174 ) ) ( not ( = ?auto_112171 ?auto_112174 ) ) ( not ( = ?auto_112172 ?auto_112174 ) ) ( not ( = ?auto_112173 ?auto_112174 ) ) ( not ( = ?auto_112175 ?auto_112174 ) ) ( ON ?auto_112169 ?auto_112168 ) ( CLEAR ?auto_112169 ) ( ON-TABLE ?auto_112174 ) ( HOLDING ?auto_112170 ) ( CLEAR ?auto_112171 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112175 ?auto_112173 ?auto_112172 ?auto_112171 ?auto_112170 )
      ( MAKE-5PILE ?auto_112168 ?auto_112169 ?auto_112170 ?auto_112171 ?auto_112172 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112176 - BLOCK
      ?auto_112177 - BLOCK
      ?auto_112178 - BLOCK
      ?auto_112179 - BLOCK
      ?auto_112180 - BLOCK
    )
    :vars
    (
      ?auto_112183 - BLOCK
      ?auto_112181 - BLOCK
      ?auto_112182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112176 ?auto_112177 ) ) ( not ( = ?auto_112176 ?auto_112178 ) ) ( not ( = ?auto_112176 ?auto_112179 ) ) ( not ( = ?auto_112176 ?auto_112180 ) ) ( not ( = ?auto_112177 ?auto_112178 ) ) ( not ( = ?auto_112177 ?auto_112179 ) ) ( not ( = ?auto_112177 ?auto_112180 ) ) ( not ( = ?auto_112178 ?auto_112179 ) ) ( not ( = ?auto_112178 ?auto_112180 ) ) ( not ( = ?auto_112179 ?auto_112180 ) ) ( ON ?auto_112180 ?auto_112183 ) ( not ( = ?auto_112176 ?auto_112183 ) ) ( not ( = ?auto_112177 ?auto_112183 ) ) ( not ( = ?auto_112178 ?auto_112183 ) ) ( not ( = ?auto_112179 ?auto_112183 ) ) ( not ( = ?auto_112180 ?auto_112183 ) ) ( ON ?auto_112179 ?auto_112180 ) ( ON-TABLE ?auto_112181 ) ( ON ?auto_112183 ?auto_112181 ) ( not ( = ?auto_112181 ?auto_112183 ) ) ( not ( = ?auto_112181 ?auto_112180 ) ) ( not ( = ?auto_112181 ?auto_112179 ) ) ( not ( = ?auto_112176 ?auto_112181 ) ) ( not ( = ?auto_112177 ?auto_112181 ) ) ( not ( = ?auto_112178 ?auto_112181 ) ) ( ON ?auto_112176 ?auto_112182 ) ( not ( = ?auto_112176 ?auto_112182 ) ) ( not ( = ?auto_112177 ?auto_112182 ) ) ( not ( = ?auto_112178 ?auto_112182 ) ) ( not ( = ?auto_112179 ?auto_112182 ) ) ( not ( = ?auto_112180 ?auto_112182 ) ) ( not ( = ?auto_112183 ?auto_112182 ) ) ( not ( = ?auto_112181 ?auto_112182 ) ) ( ON ?auto_112177 ?auto_112176 ) ( ON-TABLE ?auto_112182 ) ( CLEAR ?auto_112179 ) ( ON ?auto_112178 ?auto_112177 ) ( CLEAR ?auto_112178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112182 ?auto_112176 ?auto_112177 )
      ( MAKE-5PILE ?auto_112176 ?auto_112177 ?auto_112178 ?auto_112179 ?auto_112180 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112184 - BLOCK
      ?auto_112185 - BLOCK
      ?auto_112186 - BLOCK
      ?auto_112187 - BLOCK
      ?auto_112188 - BLOCK
    )
    :vars
    (
      ?auto_112189 - BLOCK
      ?auto_112191 - BLOCK
      ?auto_112190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112184 ?auto_112185 ) ) ( not ( = ?auto_112184 ?auto_112186 ) ) ( not ( = ?auto_112184 ?auto_112187 ) ) ( not ( = ?auto_112184 ?auto_112188 ) ) ( not ( = ?auto_112185 ?auto_112186 ) ) ( not ( = ?auto_112185 ?auto_112187 ) ) ( not ( = ?auto_112185 ?auto_112188 ) ) ( not ( = ?auto_112186 ?auto_112187 ) ) ( not ( = ?auto_112186 ?auto_112188 ) ) ( not ( = ?auto_112187 ?auto_112188 ) ) ( ON ?auto_112188 ?auto_112189 ) ( not ( = ?auto_112184 ?auto_112189 ) ) ( not ( = ?auto_112185 ?auto_112189 ) ) ( not ( = ?auto_112186 ?auto_112189 ) ) ( not ( = ?auto_112187 ?auto_112189 ) ) ( not ( = ?auto_112188 ?auto_112189 ) ) ( ON-TABLE ?auto_112191 ) ( ON ?auto_112189 ?auto_112191 ) ( not ( = ?auto_112191 ?auto_112189 ) ) ( not ( = ?auto_112191 ?auto_112188 ) ) ( not ( = ?auto_112191 ?auto_112187 ) ) ( not ( = ?auto_112184 ?auto_112191 ) ) ( not ( = ?auto_112185 ?auto_112191 ) ) ( not ( = ?auto_112186 ?auto_112191 ) ) ( ON ?auto_112184 ?auto_112190 ) ( not ( = ?auto_112184 ?auto_112190 ) ) ( not ( = ?auto_112185 ?auto_112190 ) ) ( not ( = ?auto_112186 ?auto_112190 ) ) ( not ( = ?auto_112187 ?auto_112190 ) ) ( not ( = ?auto_112188 ?auto_112190 ) ) ( not ( = ?auto_112189 ?auto_112190 ) ) ( not ( = ?auto_112191 ?auto_112190 ) ) ( ON ?auto_112185 ?auto_112184 ) ( ON-TABLE ?auto_112190 ) ( ON ?auto_112186 ?auto_112185 ) ( CLEAR ?auto_112186 ) ( HOLDING ?auto_112187 ) ( CLEAR ?auto_112188 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112191 ?auto_112189 ?auto_112188 ?auto_112187 )
      ( MAKE-5PILE ?auto_112184 ?auto_112185 ?auto_112186 ?auto_112187 ?auto_112188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112192 - BLOCK
      ?auto_112193 - BLOCK
      ?auto_112194 - BLOCK
      ?auto_112195 - BLOCK
      ?auto_112196 - BLOCK
    )
    :vars
    (
      ?auto_112198 - BLOCK
      ?auto_112197 - BLOCK
      ?auto_112199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112192 ?auto_112193 ) ) ( not ( = ?auto_112192 ?auto_112194 ) ) ( not ( = ?auto_112192 ?auto_112195 ) ) ( not ( = ?auto_112192 ?auto_112196 ) ) ( not ( = ?auto_112193 ?auto_112194 ) ) ( not ( = ?auto_112193 ?auto_112195 ) ) ( not ( = ?auto_112193 ?auto_112196 ) ) ( not ( = ?auto_112194 ?auto_112195 ) ) ( not ( = ?auto_112194 ?auto_112196 ) ) ( not ( = ?auto_112195 ?auto_112196 ) ) ( ON ?auto_112196 ?auto_112198 ) ( not ( = ?auto_112192 ?auto_112198 ) ) ( not ( = ?auto_112193 ?auto_112198 ) ) ( not ( = ?auto_112194 ?auto_112198 ) ) ( not ( = ?auto_112195 ?auto_112198 ) ) ( not ( = ?auto_112196 ?auto_112198 ) ) ( ON-TABLE ?auto_112197 ) ( ON ?auto_112198 ?auto_112197 ) ( not ( = ?auto_112197 ?auto_112198 ) ) ( not ( = ?auto_112197 ?auto_112196 ) ) ( not ( = ?auto_112197 ?auto_112195 ) ) ( not ( = ?auto_112192 ?auto_112197 ) ) ( not ( = ?auto_112193 ?auto_112197 ) ) ( not ( = ?auto_112194 ?auto_112197 ) ) ( ON ?auto_112192 ?auto_112199 ) ( not ( = ?auto_112192 ?auto_112199 ) ) ( not ( = ?auto_112193 ?auto_112199 ) ) ( not ( = ?auto_112194 ?auto_112199 ) ) ( not ( = ?auto_112195 ?auto_112199 ) ) ( not ( = ?auto_112196 ?auto_112199 ) ) ( not ( = ?auto_112198 ?auto_112199 ) ) ( not ( = ?auto_112197 ?auto_112199 ) ) ( ON ?auto_112193 ?auto_112192 ) ( ON-TABLE ?auto_112199 ) ( ON ?auto_112194 ?auto_112193 ) ( CLEAR ?auto_112196 ) ( ON ?auto_112195 ?auto_112194 ) ( CLEAR ?auto_112195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112199 ?auto_112192 ?auto_112193 ?auto_112194 )
      ( MAKE-5PILE ?auto_112192 ?auto_112193 ?auto_112194 ?auto_112195 ?auto_112196 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112200 - BLOCK
      ?auto_112201 - BLOCK
      ?auto_112202 - BLOCK
      ?auto_112203 - BLOCK
      ?auto_112204 - BLOCK
    )
    :vars
    (
      ?auto_112205 - BLOCK
      ?auto_112206 - BLOCK
      ?auto_112207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112200 ?auto_112201 ) ) ( not ( = ?auto_112200 ?auto_112202 ) ) ( not ( = ?auto_112200 ?auto_112203 ) ) ( not ( = ?auto_112200 ?auto_112204 ) ) ( not ( = ?auto_112201 ?auto_112202 ) ) ( not ( = ?auto_112201 ?auto_112203 ) ) ( not ( = ?auto_112201 ?auto_112204 ) ) ( not ( = ?auto_112202 ?auto_112203 ) ) ( not ( = ?auto_112202 ?auto_112204 ) ) ( not ( = ?auto_112203 ?auto_112204 ) ) ( not ( = ?auto_112200 ?auto_112205 ) ) ( not ( = ?auto_112201 ?auto_112205 ) ) ( not ( = ?auto_112202 ?auto_112205 ) ) ( not ( = ?auto_112203 ?auto_112205 ) ) ( not ( = ?auto_112204 ?auto_112205 ) ) ( ON-TABLE ?auto_112206 ) ( ON ?auto_112205 ?auto_112206 ) ( not ( = ?auto_112206 ?auto_112205 ) ) ( not ( = ?auto_112206 ?auto_112204 ) ) ( not ( = ?auto_112206 ?auto_112203 ) ) ( not ( = ?auto_112200 ?auto_112206 ) ) ( not ( = ?auto_112201 ?auto_112206 ) ) ( not ( = ?auto_112202 ?auto_112206 ) ) ( ON ?auto_112200 ?auto_112207 ) ( not ( = ?auto_112200 ?auto_112207 ) ) ( not ( = ?auto_112201 ?auto_112207 ) ) ( not ( = ?auto_112202 ?auto_112207 ) ) ( not ( = ?auto_112203 ?auto_112207 ) ) ( not ( = ?auto_112204 ?auto_112207 ) ) ( not ( = ?auto_112205 ?auto_112207 ) ) ( not ( = ?auto_112206 ?auto_112207 ) ) ( ON ?auto_112201 ?auto_112200 ) ( ON-TABLE ?auto_112207 ) ( ON ?auto_112202 ?auto_112201 ) ( ON ?auto_112203 ?auto_112202 ) ( CLEAR ?auto_112203 ) ( HOLDING ?auto_112204 ) ( CLEAR ?auto_112205 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112206 ?auto_112205 ?auto_112204 )
      ( MAKE-5PILE ?auto_112200 ?auto_112201 ?auto_112202 ?auto_112203 ?auto_112204 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112208 - BLOCK
      ?auto_112209 - BLOCK
      ?auto_112210 - BLOCK
      ?auto_112211 - BLOCK
      ?auto_112212 - BLOCK
    )
    :vars
    (
      ?auto_112214 - BLOCK
      ?auto_112215 - BLOCK
      ?auto_112213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112208 ?auto_112209 ) ) ( not ( = ?auto_112208 ?auto_112210 ) ) ( not ( = ?auto_112208 ?auto_112211 ) ) ( not ( = ?auto_112208 ?auto_112212 ) ) ( not ( = ?auto_112209 ?auto_112210 ) ) ( not ( = ?auto_112209 ?auto_112211 ) ) ( not ( = ?auto_112209 ?auto_112212 ) ) ( not ( = ?auto_112210 ?auto_112211 ) ) ( not ( = ?auto_112210 ?auto_112212 ) ) ( not ( = ?auto_112211 ?auto_112212 ) ) ( not ( = ?auto_112208 ?auto_112214 ) ) ( not ( = ?auto_112209 ?auto_112214 ) ) ( not ( = ?auto_112210 ?auto_112214 ) ) ( not ( = ?auto_112211 ?auto_112214 ) ) ( not ( = ?auto_112212 ?auto_112214 ) ) ( ON-TABLE ?auto_112215 ) ( ON ?auto_112214 ?auto_112215 ) ( not ( = ?auto_112215 ?auto_112214 ) ) ( not ( = ?auto_112215 ?auto_112212 ) ) ( not ( = ?auto_112215 ?auto_112211 ) ) ( not ( = ?auto_112208 ?auto_112215 ) ) ( not ( = ?auto_112209 ?auto_112215 ) ) ( not ( = ?auto_112210 ?auto_112215 ) ) ( ON ?auto_112208 ?auto_112213 ) ( not ( = ?auto_112208 ?auto_112213 ) ) ( not ( = ?auto_112209 ?auto_112213 ) ) ( not ( = ?auto_112210 ?auto_112213 ) ) ( not ( = ?auto_112211 ?auto_112213 ) ) ( not ( = ?auto_112212 ?auto_112213 ) ) ( not ( = ?auto_112214 ?auto_112213 ) ) ( not ( = ?auto_112215 ?auto_112213 ) ) ( ON ?auto_112209 ?auto_112208 ) ( ON-TABLE ?auto_112213 ) ( ON ?auto_112210 ?auto_112209 ) ( ON ?auto_112211 ?auto_112210 ) ( CLEAR ?auto_112214 ) ( ON ?auto_112212 ?auto_112211 ) ( CLEAR ?auto_112212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112213 ?auto_112208 ?auto_112209 ?auto_112210 ?auto_112211 )
      ( MAKE-5PILE ?auto_112208 ?auto_112209 ?auto_112210 ?auto_112211 ?auto_112212 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112216 - BLOCK
      ?auto_112217 - BLOCK
      ?auto_112218 - BLOCK
      ?auto_112219 - BLOCK
      ?auto_112220 - BLOCK
    )
    :vars
    (
      ?auto_112223 - BLOCK
      ?auto_112221 - BLOCK
      ?auto_112222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112216 ?auto_112217 ) ) ( not ( = ?auto_112216 ?auto_112218 ) ) ( not ( = ?auto_112216 ?auto_112219 ) ) ( not ( = ?auto_112216 ?auto_112220 ) ) ( not ( = ?auto_112217 ?auto_112218 ) ) ( not ( = ?auto_112217 ?auto_112219 ) ) ( not ( = ?auto_112217 ?auto_112220 ) ) ( not ( = ?auto_112218 ?auto_112219 ) ) ( not ( = ?auto_112218 ?auto_112220 ) ) ( not ( = ?auto_112219 ?auto_112220 ) ) ( not ( = ?auto_112216 ?auto_112223 ) ) ( not ( = ?auto_112217 ?auto_112223 ) ) ( not ( = ?auto_112218 ?auto_112223 ) ) ( not ( = ?auto_112219 ?auto_112223 ) ) ( not ( = ?auto_112220 ?auto_112223 ) ) ( ON-TABLE ?auto_112221 ) ( not ( = ?auto_112221 ?auto_112223 ) ) ( not ( = ?auto_112221 ?auto_112220 ) ) ( not ( = ?auto_112221 ?auto_112219 ) ) ( not ( = ?auto_112216 ?auto_112221 ) ) ( not ( = ?auto_112217 ?auto_112221 ) ) ( not ( = ?auto_112218 ?auto_112221 ) ) ( ON ?auto_112216 ?auto_112222 ) ( not ( = ?auto_112216 ?auto_112222 ) ) ( not ( = ?auto_112217 ?auto_112222 ) ) ( not ( = ?auto_112218 ?auto_112222 ) ) ( not ( = ?auto_112219 ?auto_112222 ) ) ( not ( = ?auto_112220 ?auto_112222 ) ) ( not ( = ?auto_112223 ?auto_112222 ) ) ( not ( = ?auto_112221 ?auto_112222 ) ) ( ON ?auto_112217 ?auto_112216 ) ( ON-TABLE ?auto_112222 ) ( ON ?auto_112218 ?auto_112217 ) ( ON ?auto_112219 ?auto_112218 ) ( ON ?auto_112220 ?auto_112219 ) ( CLEAR ?auto_112220 ) ( HOLDING ?auto_112223 ) ( CLEAR ?auto_112221 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112221 ?auto_112223 )
      ( MAKE-5PILE ?auto_112216 ?auto_112217 ?auto_112218 ?auto_112219 ?auto_112220 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112224 - BLOCK
      ?auto_112225 - BLOCK
      ?auto_112226 - BLOCK
      ?auto_112227 - BLOCK
      ?auto_112228 - BLOCK
    )
    :vars
    (
      ?auto_112229 - BLOCK
      ?auto_112230 - BLOCK
      ?auto_112231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112224 ?auto_112225 ) ) ( not ( = ?auto_112224 ?auto_112226 ) ) ( not ( = ?auto_112224 ?auto_112227 ) ) ( not ( = ?auto_112224 ?auto_112228 ) ) ( not ( = ?auto_112225 ?auto_112226 ) ) ( not ( = ?auto_112225 ?auto_112227 ) ) ( not ( = ?auto_112225 ?auto_112228 ) ) ( not ( = ?auto_112226 ?auto_112227 ) ) ( not ( = ?auto_112226 ?auto_112228 ) ) ( not ( = ?auto_112227 ?auto_112228 ) ) ( not ( = ?auto_112224 ?auto_112229 ) ) ( not ( = ?auto_112225 ?auto_112229 ) ) ( not ( = ?auto_112226 ?auto_112229 ) ) ( not ( = ?auto_112227 ?auto_112229 ) ) ( not ( = ?auto_112228 ?auto_112229 ) ) ( ON-TABLE ?auto_112230 ) ( not ( = ?auto_112230 ?auto_112229 ) ) ( not ( = ?auto_112230 ?auto_112228 ) ) ( not ( = ?auto_112230 ?auto_112227 ) ) ( not ( = ?auto_112224 ?auto_112230 ) ) ( not ( = ?auto_112225 ?auto_112230 ) ) ( not ( = ?auto_112226 ?auto_112230 ) ) ( ON ?auto_112224 ?auto_112231 ) ( not ( = ?auto_112224 ?auto_112231 ) ) ( not ( = ?auto_112225 ?auto_112231 ) ) ( not ( = ?auto_112226 ?auto_112231 ) ) ( not ( = ?auto_112227 ?auto_112231 ) ) ( not ( = ?auto_112228 ?auto_112231 ) ) ( not ( = ?auto_112229 ?auto_112231 ) ) ( not ( = ?auto_112230 ?auto_112231 ) ) ( ON ?auto_112225 ?auto_112224 ) ( ON-TABLE ?auto_112231 ) ( ON ?auto_112226 ?auto_112225 ) ( ON ?auto_112227 ?auto_112226 ) ( ON ?auto_112228 ?auto_112227 ) ( CLEAR ?auto_112230 ) ( ON ?auto_112229 ?auto_112228 ) ( CLEAR ?auto_112229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112231 ?auto_112224 ?auto_112225 ?auto_112226 ?auto_112227 ?auto_112228 )
      ( MAKE-5PILE ?auto_112224 ?auto_112225 ?auto_112226 ?auto_112227 ?auto_112228 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112232 - BLOCK
      ?auto_112233 - BLOCK
      ?auto_112234 - BLOCK
      ?auto_112235 - BLOCK
      ?auto_112236 - BLOCK
    )
    :vars
    (
      ?auto_112237 - BLOCK
      ?auto_112239 - BLOCK
      ?auto_112238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112232 ?auto_112233 ) ) ( not ( = ?auto_112232 ?auto_112234 ) ) ( not ( = ?auto_112232 ?auto_112235 ) ) ( not ( = ?auto_112232 ?auto_112236 ) ) ( not ( = ?auto_112233 ?auto_112234 ) ) ( not ( = ?auto_112233 ?auto_112235 ) ) ( not ( = ?auto_112233 ?auto_112236 ) ) ( not ( = ?auto_112234 ?auto_112235 ) ) ( not ( = ?auto_112234 ?auto_112236 ) ) ( not ( = ?auto_112235 ?auto_112236 ) ) ( not ( = ?auto_112232 ?auto_112237 ) ) ( not ( = ?auto_112233 ?auto_112237 ) ) ( not ( = ?auto_112234 ?auto_112237 ) ) ( not ( = ?auto_112235 ?auto_112237 ) ) ( not ( = ?auto_112236 ?auto_112237 ) ) ( not ( = ?auto_112239 ?auto_112237 ) ) ( not ( = ?auto_112239 ?auto_112236 ) ) ( not ( = ?auto_112239 ?auto_112235 ) ) ( not ( = ?auto_112232 ?auto_112239 ) ) ( not ( = ?auto_112233 ?auto_112239 ) ) ( not ( = ?auto_112234 ?auto_112239 ) ) ( ON ?auto_112232 ?auto_112238 ) ( not ( = ?auto_112232 ?auto_112238 ) ) ( not ( = ?auto_112233 ?auto_112238 ) ) ( not ( = ?auto_112234 ?auto_112238 ) ) ( not ( = ?auto_112235 ?auto_112238 ) ) ( not ( = ?auto_112236 ?auto_112238 ) ) ( not ( = ?auto_112237 ?auto_112238 ) ) ( not ( = ?auto_112239 ?auto_112238 ) ) ( ON ?auto_112233 ?auto_112232 ) ( ON-TABLE ?auto_112238 ) ( ON ?auto_112234 ?auto_112233 ) ( ON ?auto_112235 ?auto_112234 ) ( ON ?auto_112236 ?auto_112235 ) ( ON ?auto_112237 ?auto_112236 ) ( CLEAR ?auto_112237 ) ( HOLDING ?auto_112239 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112239 )
      ( MAKE-5PILE ?auto_112232 ?auto_112233 ?auto_112234 ?auto_112235 ?auto_112236 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112240 - BLOCK
      ?auto_112241 - BLOCK
      ?auto_112242 - BLOCK
      ?auto_112243 - BLOCK
      ?auto_112244 - BLOCK
    )
    :vars
    (
      ?auto_112246 - BLOCK
      ?auto_112245 - BLOCK
      ?auto_112247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112240 ?auto_112241 ) ) ( not ( = ?auto_112240 ?auto_112242 ) ) ( not ( = ?auto_112240 ?auto_112243 ) ) ( not ( = ?auto_112240 ?auto_112244 ) ) ( not ( = ?auto_112241 ?auto_112242 ) ) ( not ( = ?auto_112241 ?auto_112243 ) ) ( not ( = ?auto_112241 ?auto_112244 ) ) ( not ( = ?auto_112242 ?auto_112243 ) ) ( not ( = ?auto_112242 ?auto_112244 ) ) ( not ( = ?auto_112243 ?auto_112244 ) ) ( not ( = ?auto_112240 ?auto_112246 ) ) ( not ( = ?auto_112241 ?auto_112246 ) ) ( not ( = ?auto_112242 ?auto_112246 ) ) ( not ( = ?auto_112243 ?auto_112246 ) ) ( not ( = ?auto_112244 ?auto_112246 ) ) ( not ( = ?auto_112245 ?auto_112246 ) ) ( not ( = ?auto_112245 ?auto_112244 ) ) ( not ( = ?auto_112245 ?auto_112243 ) ) ( not ( = ?auto_112240 ?auto_112245 ) ) ( not ( = ?auto_112241 ?auto_112245 ) ) ( not ( = ?auto_112242 ?auto_112245 ) ) ( ON ?auto_112240 ?auto_112247 ) ( not ( = ?auto_112240 ?auto_112247 ) ) ( not ( = ?auto_112241 ?auto_112247 ) ) ( not ( = ?auto_112242 ?auto_112247 ) ) ( not ( = ?auto_112243 ?auto_112247 ) ) ( not ( = ?auto_112244 ?auto_112247 ) ) ( not ( = ?auto_112246 ?auto_112247 ) ) ( not ( = ?auto_112245 ?auto_112247 ) ) ( ON ?auto_112241 ?auto_112240 ) ( ON-TABLE ?auto_112247 ) ( ON ?auto_112242 ?auto_112241 ) ( ON ?auto_112243 ?auto_112242 ) ( ON ?auto_112244 ?auto_112243 ) ( ON ?auto_112246 ?auto_112244 ) ( ON ?auto_112245 ?auto_112246 ) ( CLEAR ?auto_112245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112247 ?auto_112240 ?auto_112241 ?auto_112242 ?auto_112243 ?auto_112244 ?auto_112246 )
      ( MAKE-5PILE ?auto_112240 ?auto_112241 ?auto_112242 ?auto_112243 ?auto_112244 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112249 - BLOCK
    )
    :vars
    (
      ?auto_112250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112250 ?auto_112249 ) ( CLEAR ?auto_112250 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112249 ) ( not ( = ?auto_112249 ?auto_112250 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112250 ?auto_112249 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112251 - BLOCK
    )
    :vars
    (
      ?auto_112252 - BLOCK
      ?auto_112253 - BLOCK
      ?auto_112254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112252 ?auto_112251 ) ( CLEAR ?auto_112252 ) ( ON-TABLE ?auto_112251 ) ( not ( = ?auto_112251 ?auto_112252 ) ) ( HOLDING ?auto_112253 ) ( CLEAR ?auto_112254 ) ( not ( = ?auto_112251 ?auto_112253 ) ) ( not ( = ?auto_112251 ?auto_112254 ) ) ( not ( = ?auto_112252 ?auto_112253 ) ) ( not ( = ?auto_112252 ?auto_112254 ) ) ( not ( = ?auto_112253 ?auto_112254 ) ) )
    :subtasks
    ( ( !STACK ?auto_112253 ?auto_112254 )
      ( MAKE-1PILE ?auto_112251 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112255 - BLOCK
    )
    :vars
    (
      ?auto_112258 - BLOCK
      ?auto_112256 - BLOCK
      ?auto_112257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112258 ?auto_112255 ) ( ON-TABLE ?auto_112255 ) ( not ( = ?auto_112255 ?auto_112258 ) ) ( CLEAR ?auto_112256 ) ( not ( = ?auto_112255 ?auto_112257 ) ) ( not ( = ?auto_112255 ?auto_112256 ) ) ( not ( = ?auto_112258 ?auto_112257 ) ) ( not ( = ?auto_112258 ?auto_112256 ) ) ( not ( = ?auto_112257 ?auto_112256 ) ) ( ON ?auto_112257 ?auto_112258 ) ( CLEAR ?auto_112257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112255 ?auto_112258 )
      ( MAKE-1PILE ?auto_112255 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112259 - BLOCK
    )
    :vars
    (
      ?auto_112262 - BLOCK
      ?auto_112260 - BLOCK
      ?auto_112261 - BLOCK
      ?auto_112264 - BLOCK
      ?auto_112265 - BLOCK
      ?auto_112263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112262 ?auto_112259 ) ( ON-TABLE ?auto_112259 ) ( not ( = ?auto_112259 ?auto_112262 ) ) ( not ( = ?auto_112259 ?auto_112260 ) ) ( not ( = ?auto_112259 ?auto_112261 ) ) ( not ( = ?auto_112262 ?auto_112260 ) ) ( not ( = ?auto_112262 ?auto_112261 ) ) ( not ( = ?auto_112260 ?auto_112261 ) ) ( ON ?auto_112260 ?auto_112262 ) ( CLEAR ?auto_112260 ) ( HOLDING ?auto_112261 ) ( CLEAR ?auto_112264 ) ( ON-TABLE ?auto_112265 ) ( ON ?auto_112263 ?auto_112265 ) ( ON ?auto_112264 ?auto_112263 ) ( not ( = ?auto_112265 ?auto_112263 ) ) ( not ( = ?auto_112265 ?auto_112264 ) ) ( not ( = ?auto_112265 ?auto_112261 ) ) ( not ( = ?auto_112263 ?auto_112264 ) ) ( not ( = ?auto_112263 ?auto_112261 ) ) ( not ( = ?auto_112264 ?auto_112261 ) ) ( not ( = ?auto_112259 ?auto_112264 ) ) ( not ( = ?auto_112259 ?auto_112265 ) ) ( not ( = ?auto_112259 ?auto_112263 ) ) ( not ( = ?auto_112262 ?auto_112264 ) ) ( not ( = ?auto_112262 ?auto_112265 ) ) ( not ( = ?auto_112262 ?auto_112263 ) ) ( not ( = ?auto_112260 ?auto_112264 ) ) ( not ( = ?auto_112260 ?auto_112265 ) ) ( not ( = ?auto_112260 ?auto_112263 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112265 ?auto_112263 ?auto_112264 ?auto_112261 )
      ( MAKE-1PILE ?auto_112259 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112266 - BLOCK
    )
    :vars
    (
      ?auto_112267 - BLOCK
      ?auto_112270 - BLOCK
      ?auto_112268 - BLOCK
      ?auto_112271 - BLOCK
      ?auto_112272 - BLOCK
      ?auto_112269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112267 ?auto_112266 ) ( ON-TABLE ?auto_112266 ) ( not ( = ?auto_112266 ?auto_112267 ) ) ( not ( = ?auto_112266 ?auto_112270 ) ) ( not ( = ?auto_112266 ?auto_112268 ) ) ( not ( = ?auto_112267 ?auto_112270 ) ) ( not ( = ?auto_112267 ?auto_112268 ) ) ( not ( = ?auto_112270 ?auto_112268 ) ) ( ON ?auto_112270 ?auto_112267 ) ( CLEAR ?auto_112271 ) ( ON-TABLE ?auto_112272 ) ( ON ?auto_112269 ?auto_112272 ) ( ON ?auto_112271 ?auto_112269 ) ( not ( = ?auto_112272 ?auto_112269 ) ) ( not ( = ?auto_112272 ?auto_112271 ) ) ( not ( = ?auto_112272 ?auto_112268 ) ) ( not ( = ?auto_112269 ?auto_112271 ) ) ( not ( = ?auto_112269 ?auto_112268 ) ) ( not ( = ?auto_112271 ?auto_112268 ) ) ( not ( = ?auto_112266 ?auto_112271 ) ) ( not ( = ?auto_112266 ?auto_112272 ) ) ( not ( = ?auto_112266 ?auto_112269 ) ) ( not ( = ?auto_112267 ?auto_112271 ) ) ( not ( = ?auto_112267 ?auto_112272 ) ) ( not ( = ?auto_112267 ?auto_112269 ) ) ( not ( = ?auto_112270 ?auto_112271 ) ) ( not ( = ?auto_112270 ?auto_112272 ) ) ( not ( = ?auto_112270 ?auto_112269 ) ) ( ON ?auto_112268 ?auto_112270 ) ( CLEAR ?auto_112268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112266 ?auto_112267 ?auto_112270 )
      ( MAKE-1PILE ?auto_112266 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112273 - BLOCK
    )
    :vars
    (
      ?auto_112275 - BLOCK
      ?auto_112279 - BLOCK
      ?auto_112277 - BLOCK
      ?auto_112278 - BLOCK
      ?auto_112276 - BLOCK
      ?auto_112274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112275 ?auto_112273 ) ( ON-TABLE ?auto_112273 ) ( not ( = ?auto_112273 ?auto_112275 ) ) ( not ( = ?auto_112273 ?auto_112279 ) ) ( not ( = ?auto_112273 ?auto_112277 ) ) ( not ( = ?auto_112275 ?auto_112279 ) ) ( not ( = ?auto_112275 ?auto_112277 ) ) ( not ( = ?auto_112279 ?auto_112277 ) ) ( ON ?auto_112279 ?auto_112275 ) ( ON-TABLE ?auto_112278 ) ( ON ?auto_112276 ?auto_112278 ) ( not ( = ?auto_112278 ?auto_112276 ) ) ( not ( = ?auto_112278 ?auto_112274 ) ) ( not ( = ?auto_112278 ?auto_112277 ) ) ( not ( = ?auto_112276 ?auto_112274 ) ) ( not ( = ?auto_112276 ?auto_112277 ) ) ( not ( = ?auto_112274 ?auto_112277 ) ) ( not ( = ?auto_112273 ?auto_112274 ) ) ( not ( = ?auto_112273 ?auto_112278 ) ) ( not ( = ?auto_112273 ?auto_112276 ) ) ( not ( = ?auto_112275 ?auto_112274 ) ) ( not ( = ?auto_112275 ?auto_112278 ) ) ( not ( = ?auto_112275 ?auto_112276 ) ) ( not ( = ?auto_112279 ?auto_112274 ) ) ( not ( = ?auto_112279 ?auto_112278 ) ) ( not ( = ?auto_112279 ?auto_112276 ) ) ( ON ?auto_112277 ?auto_112279 ) ( CLEAR ?auto_112277 ) ( HOLDING ?auto_112274 ) ( CLEAR ?auto_112276 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112278 ?auto_112276 ?auto_112274 )
      ( MAKE-1PILE ?auto_112273 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112280 - BLOCK
    )
    :vars
    (
      ?auto_112282 - BLOCK
      ?auto_112284 - BLOCK
      ?auto_112286 - BLOCK
      ?auto_112283 - BLOCK
      ?auto_112285 - BLOCK
      ?auto_112281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112282 ?auto_112280 ) ( ON-TABLE ?auto_112280 ) ( not ( = ?auto_112280 ?auto_112282 ) ) ( not ( = ?auto_112280 ?auto_112284 ) ) ( not ( = ?auto_112280 ?auto_112286 ) ) ( not ( = ?auto_112282 ?auto_112284 ) ) ( not ( = ?auto_112282 ?auto_112286 ) ) ( not ( = ?auto_112284 ?auto_112286 ) ) ( ON ?auto_112284 ?auto_112282 ) ( ON-TABLE ?auto_112283 ) ( ON ?auto_112285 ?auto_112283 ) ( not ( = ?auto_112283 ?auto_112285 ) ) ( not ( = ?auto_112283 ?auto_112281 ) ) ( not ( = ?auto_112283 ?auto_112286 ) ) ( not ( = ?auto_112285 ?auto_112281 ) ) ( not ( = ?auto_112285 ?auto_112286 ) ) ( not ( = ?auto_112281 ?auto_112286 ) ) ( not ( = ?auto_112280 ?auto_112281 ) ) ( not ( = ?auto_112280 ?auto_112283 ) ) ( not ( = ?auto_112280 ?auto_112285 ) ) ( not ( = ?auto_112282 ?auto_112281 ) ) ( not ( = ?auto_112282 ?auto_112283 ) ) ( not ( = ?auto_112282 ?auto_112285 ) ) ( not ( = ?auto_112284 ?auto_112281 ) ) ( not ( = ?auto_112284 ?auto_112283 ) ) ( not ( = ?auto_112284 ?auto_112285 ) ) ( ON ?auto_112286 ?auto_112284 ) ( CLEAR ?auto_112285 ) ( ON ?auto_112281 ?auto_112286 ) ( CLEAR ?auto_112281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112280 ?auto_112282 ?auto_112284 ?auto_112286 )
      ( MAKE-1PILE ?auto_112280 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112287 - BLOCK
    )
    :vars
    (
      ?auto_112290 - BLOCK
      ?auto_112292 - BLOCK
      ?auto_112289 - BLOCK
      ?auto_112293 - BLOCK
      ?auto_112288 - BLOCK
      ?auto_112291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112290 ?auto_112287 ) ( ON-TABLE ?auto_112287 ) ( not ( = ?auto_112287 ?auto_112290 ) ) ( not ( = ?auto_112287 ?auto_112292 ) ) ( not ( = ?auto_112287 ?auto_112289 ) ) ( not ( = ?auto_112290 ?auto_112292 ) ) ( not ( = ?auto_112290 ?auto_112289 ) ) ( not ( = ?auto_112292 ?auto_112289 ) ) ( ON ?auto_112292 ?auto_112290 ) ( ON-TABLE ?auto_112293 ) ( not ( = ?auto_112293 ?auto_112288 ) ) ( not ( = ?auto_112293 ?auto_112291 ) ) ( not ( = ?auto_112293 ?auto_112289 ) ) ( not ( = ?auto_112288 ?auto_112291 ) ) ( not ( = ?auto_112288 ?auto_112289 ) ) ( not ( = ?auto_112291 ?auto_112289 ) ) ( not ( = ?auto_112287 ?auto_112291 ) ) ( not ( = ?auto_112287 ?auto_112293 ) ) ( not ( = ?auto_112287 ?auto_112288 ) ) ( not ( = ?auto_112290 ?auto_112291 ) ) ( not ( = ?auto_112290 ?auto_112293 ) ) ( not ( = ?auto_112290 ?auto_112288 ) ) ( not ( = ?auto_112292 ?auto_112291 ) ) ( not ( = ?auto_112292 ?auto_112293 ) ) ( not ( = ?auto_112292 ?auto_112288 ) ) ( ON ?auto_112289 ?auto_112292 ) ( ON ?auto_112291 ?auto_112289 ) ( CLEAR ?auto_112291 ) ( HOLDING ?auto_112288 ) ( CLEAR ?auto_112293 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112293 ?auto_112288 )
      ( MAKE-1PILE ?auto_112287 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112294 - BLOCK
    )
    :vars
    (
      ?auto_112300 - BLOCK
      ?auto_112299 - BLOCK
      ?auto_112295 - BLOCK
      ?auto_112297 - BLOCK
      ?auto_112298 - BLOCK
      ?auto_112296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112300 ?auto_112294 ) ( ON-TABLE ?auto_112294 ) ( not ( = ?auto_112294 ?auto_112300 ) ) ( not ( = ?auto_112294 ?auto_112299 ) ) ( not ( = ?auto_112294 ?auto_112295 ) ) ( not ( = ?auto_112300 ?auto_112299 ) ) ( not ( = ?auto_112300 ?auto_112295 ) ) ( not ( = ?auto_112299 ?auto_112295 ) ) ( ON ?auto_112299 ?auto_112300 ) ( ON-TABLE ?auto_112297 ) ( not ( = ?auto_112297 ?auto_112298 ) ) ( not ( = ?auto_112297 ?auto_112296 ) ) ( not ( = ?auto_112297 ?auto_112295 ) ) ( not ( = ?auto_112298 ?auto_112296 ) ) ( not ( = ?auto_112298 ?auto_112295 ) ) ( not ( = ?auto_112296 ?auto_112295 ) ) ( not ( = ?auto_112294 ?auto_112296 ) ) ( not ( = ?auto_112294 ?auto_112297 ) ) ( not ( = ?auto_112294 ?auto_112298 ) ) ( not ( = ?auto_112300 ?auto_112296 ) ) ( not ( = ?auto_112300 ?auto_112297 ) ) ( not ( = ?auto_112300 ?auto_112298 ) ) ( not ( = ?auto_112299 ?auto_112296 ) ) ( not ( = ?auto_112299 ?auto_112297 ) ) ( not ( = ?auto_112299 ?auto_112298 ) ) ( ON ?auto_112295 ?auto_112299 ) ( ON ?auto_112296 ?auto_112295 ) ( CLEAR ?auto_112297 ) ( ON ?auto_112298 ?auto_112296 ) ( CLEAR ?auto_112298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112294 ?auto_112300 ?auto_112299 ?auto_112295 ?auto_112296 )
      ( MAKE-1PILE ?auto_112294 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112301 - BLOCK
    )
    :vars
    (
      ?auto_112303 - BLOCK
      ?auto_112307 - BLOCK
      ?auto_112304 - BLOCK
      ?auto_112305 - BLOCK
      ?auto_112306 - BLOCK
      ?auto_112302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112303 ?auto_112301 ) ( ON-TABLE ?auto_112301 ) ( not ( = ?auto_112301 ?auto_112303 ) ) ( not ( = ?auto_112301 ?auto_112307 ) ) ( not ( = ?auto_112301 ?auto_112304 ) ) ( not ( = ?auto_112303 ?auto_112307 ) ) ( not ( = ?auto_112303 ?auto_112304 ) ) ( not ( = ?auto_112307 ?auto_112304 ) ) ( ON ?auto_112307 ?auto_112303 ) ( not ( = ?auto_112305 ?auto_112306 ) ) ( not ( = ?auto_112305 ?auto_112302 ) ) ( not ( = ?auto_112305 ?auto_112304 ) ) ( not ( = ?auto_112306 ?auto_112302 ) ) ( not ( = ?auto_112306 ?auto_112304 ) ) ( not ( = ?auto_112302 ?auto_112304 ) ) ( not ( = ?auto_112301 ?auto_112302 ) ) ( not ( = ?auto_112301 ?auto_112305 ) ) ( not ( = ?auto_112301 ?auto_112306 ) ) ( not ( = ?auto_112303 ?auto_112302 ) ) ( not ( = ?auto_112303 ?auto_112305 ) ) ( not ( = ?auto_112303 ?auto_112306 ) ) ( not ( = ?auto_112307 ?auto_112302 ) ) ( not ( = ?auto_112307 ?auto_112305 ) ) ( not ( = ?auto_112307 ?auto_112306 ) ) ( ON ?auto_112304 ?auto_112307 ) ( ON ?auto_112302 ?auto_112304 ) ( ON ?auto_112306 ?auto_112302 ) ( CLEAR ?auto_112306 ) ( HOLDING ?auto_112305 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112305 )
      ( MAKE-1PILE ?auto_112301 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112308 - BLOCK
    )
    :vars
    (
      ?auto_112310 - BLOCK
      ?auto_112312 - BLOCK
      ?auto_112311 - BLOCK
      ?auto_112314 - BLOCK
      ?auto_112313 - BLOCK
      ?auto_112309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112310 ?auto_112308 ) ( ON-TABLE ?auto_112308 ) ( not ( = ?auto_112308 ?auto_112310 ) ) ( not ( = ?auto_112308 ?auto_112312 ) ) ( not ( = ?auto_112308 ?auto_112311 ) ) ( not ( = ?auto_112310 ?auto_112312 ) ) ( not ( = ?auto_112310 ?auto_112311 ) ) ( not ( = ?auto_112312 ?auto_112311 ) ) ( ON ?auto_112312 ?auto_112310 ) ( not ( = ?auto_112314 ?auto_112313 ) ) ( not ( = ?auto_112314 ?auto_112309 ) ) ( not ( = ?auto_112314 ?auto_112311 ) ) ( not ( = ?auto_112313 ?auto_112309 ) ) ( not ( = ?auto_112313 ?auto_112311 ) ) ( not ( = ?auto_112309 ?auto_112311 ) ) ( not ( = ?auto_112308 ?auto_112309 ) ) ( not ( = ?auto_112308 ?auto_112314 ) ) ( not ( = ?auto_112308 ?auto_112313 ) ) ( not ( = ?auto_112310 ?auto_112309 ) ) ( not ( = ?auto_112310 ?auto_112314 ) ) ( not ( = ?auto_112310 ?auto_112313 ) ) ( not ( = ?auto_112312 ?auto_112309 ) ) ( not ( = ?auto_112312 ?auto_112314 ) ) ( not ( = ?auto_112312 ?auto_112313 ) ) ( ON ?auto_112311 ?auto_112312 ) ( ON ?auto_112309 ?auto_112311 ) ( ON ?auto_112313 ?auto_112309 ) ( ON ?auto_112314 ?auto_112313 ) ( CLEAR ?auto_112314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112308 ?auto_112310 ?auto_112312 ?auto_112311 ?auto_112309 ?auto_112313 )
      ( MAKE-1PILE ?auto_112308 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112315 - BLOCK
    )
    :vars
    (
      ?auto_112319 - BLOCK
      ?auto_112316 - BLOCK
      ?auto_112317 - BLOCK
      ?auto_112320 - BLOCK
      ?auto_112321 - BLOCK
      ?auto_112318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112319 ?auto_112315 ) ( ON-TABLE ?auto_112315 ) ( not ( = ?auto_112315 ?auto_112319 ) ) ( not ( = ?auto_112315 ?auto_112316 ) ) ( not ( = ?auto_112315 ?auto_112317 ) ) ( not ( = ?auto_112319 ?auto_112316 ) ) ( not ( = ?auto_112319 ?auto_112317 ) ) ( not ( = ?auto_112316 ?auto_112317 ) ) ( ON ?auto_112316 ?auto_112319 ) ( not ( = ?auto_112320 ?auto_112321 ) ) ( not ( = ?auto_112320 ?auto_112318 ) ) ( not ( = ?auto_112320 ?auto_112317 ) ) ( not ( = ?auto_112321 ?auto_112318 ) ) ( not ( = ?auto_112321 ?auto_112317 ) ) ( not ( = ?auto_112318 ?auto_112317 ) ) ( not ( = ?auto_112315 ?auto_112318 ) ) ( not ( = ?auto_112315 ?auto_112320 ) ) ( not ( = ?auto_112315 ?auto_112321 ) ) ( not ( = ?auto_112319 ?auto_112318 ) ) ( not ( = ?auto_112319 ?auto_112320 ) ) ( not ( = ?auto_112319 ?auto_112321 ) ) ( not ( = ?auto_112316 ?auto_112318 ) ) ( not ( = ?auto_112316 ?auto_112320 ) ) ( not ( = ?auto_112316 ?auto_112321 ) ) ( ON ?auto_112317 ?auto_112316 ) ( ON ?auto_112318 ?auto_112317 ) ( ON ?auto_112321 ?auto_112318 ) ( HOLDING ?auto_112320 ) ( CLEAR ?auto_112321 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112315 ?auto_112319 ?auto_112316 ?auto_112317 ?auto_112318 ?auto_112321 ?auto_112320 )
      ( MAKE-1PILE ?auto_112315 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112322 - BLOCK
    )
    :vars
    (
      ?auto_112325 - BLOCK
      ?auto_112328 - BLOCK
      ?auto_112326 - BLOCK
      ?auto_112327 - BLOCK
      ?auto_112323 - BLOCK
      ?auto_112324 - BLOCK
      ?auto_112329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112325 ?auto_112322 ) ( ON-TABLE ?auto_112322 ) ( not ( = ?auto_112322 ?auto_112325 ) ) ( not ( = ?auto_112322 ?auto_112328 ) ) ( not ( = ?auto_112322 ?auto_112326 ) ) ( not ( = ?auto_112325 ?auto_112328 ) ) ( not ( = ?auto_112325 ?auto_112326 ) ) ( not ( = ?auto_112328 ?auto_112326 ) ) ( ON ?auto_112328 ?auto_112325 ) ( not ( = ?auto_112327 ?auto_112323 ) ) ( not ( = ?auto_112327 ?auto_112324 ) ) ( not ( = ?auto_112327 ?auto_112326 ) ) ( not ( = ?auto_112323 ?auto_112324 ) ) ( not ( = ?auto_112323 ?auto_112326 ) ) ( not ( = ?auto_112324 ?auto_112326 ) ) ( not ( = ?auto_112322 ?auto_112324 ) ) ( not ( = ?auto_112322 ?auto_112327 ) ) ( not ( = ?auto_112322 ?auto_112323 ) ) ( not ( = ?auto_112325 ?auto_112324 ) ) ( not ( = ?auto_112325 ?auto_112327 ) ) ( not ( = ?auto_112325 ?auto_112323 ) ) ( not ( = ?auto_112328 ?auto_112324 ) ) ( not ( = ?auto_112328 ?auto_112327 ) ) ( not ( = ?auto_112328 ?auto_112323 ) ) ( ON ?auto_112326 ?auto_112328 ) ( ON ?auto_112324 ?auto_112326 ) ( ON ?auto_112323 ?auto_112324 ) ( CLEAR ?auto_112323 ) ( ON ?auto_112327 ?auto_112329 ) ( CLEAR ?auto_112327 ) ( HAND-EMPTY ) ( not ( = ?auto_112322 ?auto_112329 ) ) ( not ( = ?auto_112325 ?auto_112329 ) ) ( not ( = ?auto_112328 ?auto_112329 ) ) ( not ( = ?auto_112326 ?auto_112329 ) ) ( not ( = ?auto_112327 ?auto_112329 ) ) ( not ( = ?auto_112323 ?auto_112329 ) ) ( not ( = ?auto_112324 ?auto_112329 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112327 ?auto_112329 )
      ( MAKE-1PILE ?auto_112322 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112330 - BLOCK
    )
    :vars
    (
      ?auto_112337 - BLOCK
      ?auto_112336 - BLOCK
      ?auto_112335 - BLOCK
      ?auto_112334 - BLOCK
      ?auto_112331 - BLOCK
      ?auto_112332 - BLOCK
      ?auto_112333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112337 ?auto_112330 ) ( ON-TABLE ?auto_112330 ) ( not ( = ?auto_112330 ?auto_112337 ) ) ( not ( = ?auto_112330 ?auto_112336 ) ) ( not ( = ?auto_112330 ?auto_112335 ) ) ( not ( = ?auto_112337 ?auto_112336 ) ) ( not ( = ?auto_112337 ?auto_112335 ) ) ( not ( = ?auto_112336 ?auto_112335 ) ) ( ON ?auto_112336 ?auto_112337 ) ( not ( = ?auto_112334 ?auto_112331 ) ) ( not ( = ?auto_112334 ?auto_112332 ) ) ( not ( = ?auto_112334 ?auto_112335 ) ) ( not ( = ?auto_112331 ?auto_112332 ) ) ( not ( = ?auto_112331 ?auto_112335 ) ) ( not ( = ?auto_112332 ?auto_112335 ) ) ( not ( = ?auto_112330 ?auto_112332 ) ) ( not ( = ?auto_112330 ?auto_112334 ) ) ( not ( = ?auto_112330 ?auto_112331 ) ) ( not ( = ?auto_112337 ?auto_112332 ) ) ( not ( = ?auto_112337 ?auto_112334 ) ) ( not ( = ?auto_112337 ?auto_112331 ) ) ( not ( = ?auto_112336 ?auto_112332 ) ) ( not ( = ?auto_112336 ?auto_112334 ) ) ( not ( = ?auto_112336 ?auto_112331 ) ) ( ON ?auto_112335 ?auto_112336 ) ( ON ?auto_112332 ?auto_112335 ) ( ON ?auto_112334 ?auto_112333 ) ( CLEAR ?auto_112334 ) ( not ( = ?auto_112330 ?auto_112333 ) ) ( not ( = ?auto_112337 ?auto_112333 ) ) ( not ( = ?auto_112336 ?auto_112333 ) ) ( not ( = ?auto_112335 ?auto_112333 ) ) ( not ( = ?auto_112334 ?auto_112333 ) ) ( not ( = ?auto_112331 ?auto_112333 ) ) ( not ( = ?auto_112332 ?auto_112333 ) ) ( HOLDING ?auto_112331 ) ( CLEAR ?auto_112332 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112330 ?auto_112337 ?auto_112336 ?auto_112335 ?auto_112332 ?auto_112331 )
      ( MAKE-1PILE ?auto_112330 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112338 - BLOCK
    )
    :vars
    (
      ?auto_112345 - BLOCK
      ?auto_112339 - BLOCK
      ?auto_112344 - BLOCK
      ?auto_112343 - BLOCK
      ?auto_112340 - BLOCK
      ?auto_112342 - BLOCK
      ?auto_112341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112345 ?auto_112338 ) ( ON-TABLE ?auto_112338 ) ( not ( = ?auto_112338 ?auto_112345 ) ) ( not ( = ?auto_112338 ?auto_112339 ) ) ( not ( = ?auto_112338 ?auto_112344 ) ) ( not ( = ?auto_112345 ?auto_112339 ) ) ( not ( = ?auto_112345 ?auto_112344 ) ) ( not ( = ?auto_112339 ?auto_112344 ) ) ( ON ?auto_112339 ?auto_112345 ) ( not ( = ?auto_112343 ?auto_112340 ) ) ( not ( = ?auto_112343 ?auto_112342 ) ) ( not ( = ?auto_112343 ?auto_112344 ) ) ( not ( = ?auto_112340 ?auto_112342 ) ) ( not ( = ?auto_112340 ?auto_112344 ) ) ( not ( = ?auto_112342 ?auto_112344 ) ) ( not ( = ?auto_112338 ?auto_112342 ) ) ( not ( = ?auto_112338 ?auto_112343 ) ) ( not ( = ?auto_112338 ?auto_112340 ) ) ( not ( = ?auto_112345 ?auto_112342 ) ) ( not ( = ?auto_112345 ?auto_112343 ) ) ( not ( = ?auto_112345 ?auto_112340 ) ) ( not ( = ?auto_112339 ?auto_112342 ) ) ( not ( = ?auto_112339 ?auto_112343 ) ) ( not ( = ?auto_112339 ?auto_112340 ) ) ( ON ?auto_112344 ?auto_112339 ) ( ON ?auto_112342 ?auto_112344 ) ( ON ?auto_112343 ?auto_112341 ) ( not ( = ?auto_112338 ?auto_112341 ) ) ( not ( = ?auto_112345 ?auto_112341 ) ) ( not ( = ?auto_112339 ?auto_112341 ) ) ( not ( = ?auto_112344 ?auto_112341 ) ) ( not ( = ?auto_112343 ?auto_112341 ) ) ( not ( = ?auto_112340 ?auto_112341 ) ) ( not ( = ?auto_112342 ?auto_112341 ) ) ( CLEAR ?auto_112342 ) ( ON ?auto_112340 ?auto_112343 ) ( CLEAR ?auto_112340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112341 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112341 ?auto_112343 )
      ( MAKE-1PILE ?auto_112338 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112346 - BLOCK
    )
    :vars
    (
      ?auto_112353 - BLOCK
      ?auto_112351 - BLOCK
      ?auto_112348 - BLOCK
      ?auto_112349 - BLOCK
      ?auto_112347 - BLOCK
      ?auto_112350 - BLOCK
      ?auto_112352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112353 ?auto_112346 ) ( ON-TABLE ?auto_112346 ) ( not ( = ?auto_112346 ?auto_112353 ) ) ( not ( = ?auto_112346 ?auto_112351 ) ) ( not ( = ?auto_112346 ?auto_112348 ) ) ( not ( = ?auto_112353 ?auto_112351 ) ) ( not ( = ?auto_112353 ?auto_112348 ) ) ( not ( = ?auto_112351 ?auto_112348 ) ) ( ON ?auto_112351 ?auto_112353 ) ( not ( = ?auto_112349 ?auto_112347 ) ) ( not ( = ?auto_112349 ?auto_112350 ) ) ( not ( = ?auto_112349 ?auto_112348 ) ) ( not ( = ?auto_112347 ?auto_112350 ) ) ( not ( = ?auto_112347 ?auto_112348 ) ) ( not ( = ?auto_112350 ?auto_112348 ) ) ( not ( = ?auto_112346 ?auto_112350 ) ) ( not ( = ?auto_112346 ?auto_112349 ) ) ( not ( = ?auto_112346 ?auto_112347 ) ) ( not ( = ?auto_112353 ?auto_112350 ) ) ( not ( = ?auto_112353 ?auto_112349 ) ) ( not ( = ?auto_112353 ?auto_112347 ) ) ( not ( = ?auto_112351 ?auto_112350 ) ) ( not ( = ?auto_112351 ?auto_112349 ) ) ( not ( = ?auto_112351 ?auto_112347 ) ) ( ON ?auto_112348 ?auto_112351 ) ( ON ?auto_112349 ?auto_112352 ) ( not ( = ?auto_112346 ?auto_112352 ) ) ( not ( = ?auto_112353 ?auto_112352 ) ) ( not ( = ?auto_112351 ?auto_112352 ) ) ( not ( = ?auto_112348 ?auto_112352 ) ) ( not ( = ?auto_112349 ?auto_112352 ) ) ( not ( = ?auto_112347 ?auto_112352 ) ) ( not ( = ?auto_112350 ?auto_112352 ) ) ( ON ?auto_112347 ?auto_112349 ) ( CLEAR ?auto_112347 ) ( ON-TABLE ?auto_112352 ) ( HOLDING ?auto_112350 ) ( CLEAR ?auto_112348 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112346 ?auto_112353 ?auto_112351 ?auto_112348 ?auto_112350 )
      ( MAKE-1PILE ?auto_112346 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112354 - BLOCK
    )
    :vars
    (
      ?auto_112359 - BLOCK
      ?auto_112360 - BLOCK
      ?auto_112357 - BLOCK
      ?auto_112358 - BLOCK
      ?auto_112355 - BLOCK
      ?auto_112356 - BLOCK
      ?auto_112361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112359 ?auto_112354 ) ( ON-TABLE ?auto_112354 ) ( not ( = ?auto_112354 ?auto_112359 ) ) ( not ( = ?auto_112354 ?auto_112360 ) ) ( not ( = ?auto_112354 ?auto_112357 ) ) ( not ( = ?auto_112359 ?auto_112360 ) ) ( not ( = ?auto_112359 ?auto_112357 ) ) ( not ( = ?auto_112360 ?auto_112357 ) ) ( ON ?auto_112360 ?auto_112359 ) ( not ( = ?auto_112358 ?auto_112355 ) ) ( not ( = ?auto_112358 ?auto_112356 ) ) ( not ( = ?auto_112358 ?auto_112357 ) ) ( not ( = ?auto_112355 ?auto_112356 ) ) ( not ( = ?auto_112355 ?auto_112357 ) ) ( not ( = ?auto_112356 ?auto_112357 ) ) ( not ( = ?auto_112354 ?auto_112356 ) ) ( not ( = ?auto_112354 ?auto_112358 ) ) ( not ( = ?auto_112354 ?auto_112355 ) ) ( not ( = ?auto_112359 ?auto_112356 ) ) ( not ( = ?auto_112359 ?auto_112358 ) ) ( not ( = ?auto_112359 ?auto_112355 ) ) ( not ( = ?auto_112360 ?auto_112356 ) ) ( not ( = ?auto_112360 ?auto_112358 ) ) ( not ( = ?auto_112360 ?auto_112355 ) ) ( ON ?auto_112357 ?auto_112360 ) ( ON ?auto_112358 ?auto_112361 ) ( not ( = ?auto_112354 ?auto_112361 ) ) ( not ( = ?auto_112359 ?auto_112361 ) ) ( not ( = ?auto_112360 ?auto_112361 ) ) ( not ( = ?auto_112357 ?auto_112361 ) ) ( not ( = ?auto_112358 ?auto_112361 ) ) ( not ( = ?auto_112355 ?auto_112361 ) ) ( not ( = ?auto_112356 ?auto_112361 ) ) ( ON ?auto_112355 ?auto_112358 ) ( ON-TABLE ?auto_112361 ) ( CLEAR ?auto_112357 ) ( ON ?auto_112356 ?auto_112355 ) ( CLEAR ?auto_112356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112361 ?auto_112358 ?auto_112355 )
      ( MAKE-1PILE ?auto_112354 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112362 - BLOCK
    )
    :vars
    (
      ?auto_112365 - BLOCK
      ?auto_112368 - BLOCK
      ?auto_112366 - BLOCK
      ?auto_112364 - BLOCK
      ?auto_112367 - BLOCK
      ?auto_112369 - BLOCK
      ?auto_112363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112365 ?auto_112362 ) ( ON-TABLE ?auto_112362 ) ( not ( = ?auto_112362 ?auto_112365 ) ) ( not ( = ?auto_112362 ?auto_112368 ) ) ( not ( = ?auto_112362 ?auto_112366 ) ) ( not ( = ?auto_112365 ?auto_112368 ) ) ( not ( = ?auto_112365 ?auto_112366 ) ) ( not ( = ?auto_112368 ?auto_112366 ) ) ( ON ?auto_112368 ?auto_112365 ) ( not ( = ?auto_112364 ?auto_112367 ) ) ( not ( = ?auto_112364 ?auto_112369 ) ) ( not ( = ?auto_112364 ?auto_112366 ) ) ( not ( = ?auto_112367 ?auto_112369 ) ) ( not ( = ?auto_112367 ?auto_112366 ) ) ( not ( = ?auto_112369 ?auto_112366 ) ) ( not ( = ?auto_112362 ?auto_112369 ) ) ( not ( = ?auto_112362 ?auto_112364 ) ) ( not ( = ?auto_112362 ?auto_112367 ) ) ( not ( = ?auto_112365 ?auto_112369 ) ) ( not ( = ?auto_112365 ?auto_112364 ) ) ( not ( = ?auto_112365 ?auto_112367 ) ) ( not ( = ?auto_112368 ?auto_112369 ) ) ( not ( = ?auto_112368 ?auto_112364 ) ) ( not ( = ?auto_112368 ?auto_112367 ) ) ( ON ?auto_112364 ?auto_112363 ) ( not ( = ?auto_112362 ?auto_112363 ) ) ( not ( = ?auto_112365 ?auto_112363 ) ) ( not ( = ?auto_112368 ?auto_112363 ) ) ( not ( = ?auto_112366 ?auto_112363 ) ) ( not ( = ?auto_112364 ?auto_112363 ) ) ( not ( = ?auto_112367 ?auto_112363 ) ) ( not ( = ?auto_112369 ?auto_112363 ) ) ( ON ?auto_112367 ?auto_112364 ) ( ON-TABLE ?auto_112363 ) ( ON ?auto_112369 ?auto_112367 ) ( CLEAR ?auto_112369 ) ( HOLDING ?auto_112366 ) ( CLEAR ?auto_112368 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112362 ?auto_112365 ?auto_112368 ?auto_112366 )
      ( MAKE-1PILE ?auto_112362 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112370 - BLOCK
    )
    :vars
    (
      ?auto_112372 - BLOCK
      ?auto_112377 - BLOCK
      ?auto_112373 - BLOCK
      ?auto_112374 - BLOCK
      ?auto_112376 - BLOCK
      ?auto_112375 - BLOCK
      ?auto_112371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112372 ?auto_112370 ) ( ON-TABLE ?auto_112370 ) ( not ( = ?auto_112370 ?auto_112372 ) ) ( not ( = ?auto_112370 ?auto_112377 ) ) ( not ( = ?auto_112370 ?auto_112373 ) ) ( not ( = ?auto_112372 ?auto_112377 ) ) ( not ( = ?auto_112372 ?auto_112373 ) ) ( not ( = ?auto_112377 ?auto_112373 ) ) ( ON ?auto_112377 ?auto_112372 ) ( not ( = ?auto_112374 ?auto_112376 ) ) ( not ( = ?auto_112374 ?auto_112375 ) ) ( not ( = ?auto_112374 ?auto_112373 ) ) ( not ( = ?auto_112376 ?auto_112375 ) ) ( not ( = ?auto_112376 ?auto_112373 ) ) ( not ( = ?auto_112375 ?auto_112373 ) ) ( not ( = ?auto_112370 ?auto_112375 ) ) ( not ( = ?auto_112370 ?auto_112374 ) ) ( not ( = ?auto_112370 ?auto_112376 ) ) ( not ( = ?auto_112372 ?auto_112375 ) ) ( not ( = ?auto_112372 ?auto_112374 ) ) ( not ( = ?auto_112372 ?auto_112376 ) ) ( not ( = ?auto_112377 ?auto_112375 ) ) ( not ( = ?auto_112377 ?auto_112374 ) ) ( not ( = ?auto_112377 ?auto_112376 ) ) ( ON ?auto_112374 ?auto_112371 ) ( not ( = ?auto_112370 ?auto_112371 ) ) ( not ( = ?auto_112372 ?auto_112371 ) ) ( not ( = ?auto_112377 ?auto_112371 ) ) ( not ( = ?auto_112373 ?auto_112371 ) ) ( not ( = ?auto_112374 ?auto_112371 ) ) ( not ( = ?auto_112376 ?auto_112371 ) ) ( not ( = ?auto_112375 ?auto_112371 ) ) ( ON ?auto_112376 ?auto_112374 ) ( ON-TABLE ?auto_112371 ) ( ON ?auto_112375 ?auto_112376 ) ( CLEAR ?auto_112377 ) ( ON ?auto_112373 ?auto_112375 ) ( CLEAR ?auto_112373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112371 ?auto_112374 ?auto_112376 ?auto_112375 )
      ( MAKE-1PILE ?auto_112370 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112378 - BLOCK
    )
    :vars
    (
      ?auto_112383 - BLOCK
      ?auto_112382 - BLOCK
      ?auto_112384 - BLOCK
      ?auto_112380 - BLOCK
      ?auto_112379 - BLOCK
      ?auto_112385 - BLOCK
      ?auto_112381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112383 ?auto_112378 ) ( ON-TABLE ?auto_112378 ) ( not ( = ?auto_112378 ?auto_112383 ) ) ( not ( = ?auto_112378 ?auto_112382 ) ) ( not ( = ?auto_112378 ?auto_112384 ) ) ( not ( = ?auto_112383 ?auto_112382 ) ) ( not ( = ?auto_112383 ?auto_112384 ) ) ( not ( = ?auto_112382 ?auto_112384 ) ) ( not ( = ?auto_112380 ?auto_112379 ) ) ( not ( = ?auto_112380 ?auto_112385 ) ) ( not ( = ?auto_112380 ?auto_112384 ) ) ( not ( = ?auto_112379 ?auto_112385 ) ) ( not ( = ?auto_112379 ?auto_112384 ) ) ( not ( = ?auto_112385 ?auto_112384 ) ) ( not ( = ?auto_112378 ?auto_112385 ) ) ( not ( = ?auto_112378 ?auto_112380 ) ) ( not ( = ?auto_112378 ?auto_112379 ) ) ( not ( = ?auto_112383 ?auto_112385 ) ) ( not ( = ?auto_112383 ?auto_112380 ) ) ( not ( = ?auto_112383 ?auto_112379 ) ) ( not ( = ?auto_112382 ?auto_112385 ) ) ( not ( = ?auto_112382 ?auto_112380 ) ) ( not ( = ?auto_112382 ?auto_112379 ) ) ( ON ?auto_112380 ?auto_112381 ) ( not ( = ?auto_112378 ?auto_112381 ) ) ( not ( = ?auto_112383 ?auto_112381 ) ) ( not ( = ?auto_112382 ?auto_112381 ) ) ( not ( = ?auto_112384 ?auto_112381 ) ) ( not ( = ?auto_112380 ?auto_112381 ) ) ( not ( = ?auto_112379 ?auto_112381 ) ) ( not ( = ?auto_112385 ?auto_112381 ) ) ( ON ?auto_112379 ?auto_112380 ) ( ON-TABLE ?auto_112381 ) ( ON ?auto_112385 ?auto_112379 ) ( ON ?auto_112384 ?auto_112385 ) ( CLEAR ?auto_112384 ) ( HOLDING ?auto_112382 ) ( CLEAR ?auto_112383 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112378 ?auto_112383 ?auto_112382 )
      ( MAKE-1PILE ?auto_112378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112386 - BLOCK
    )
    :vars
    (
      ?auto_112393 - BLOCK
      ?auto_112392 - BLOCK
      ?auto_112388 - BLOCK
      ?auto_112389 - BLOCK
      ?auto_112387 - BLOCK
      ?auto_112390 - BLOCK
      ?auto_112391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112393 ?auto_112386 ) ( ON-TABLE ?auto_112386 ) ( not ( = ?auto_112386 ?auto_112393 ) ) ( not ( = ?auto_112386 ?auto_112392 ) ) ( not ( = ?auto_112386 ?auto_112388 ) ) ( not ( = ?auto_112393 ?auto_112392 ) ) ( not ( = ?auto_112393 ?auto_112388 ) ) ( not ( = ?auto_112392 ?auto_112388 ) ) ( not ( = ?auto_112389 ?auto_112387 ) ) ( not ( = ?auto_112389 ?auto_112390 ) ) ( not ( = ?auto_112389 ?auto_112388 ) ) ( not ( = ?auto_112387 ?auto_112390 ) ) ( not ( = ?auto_112387 ?auto_112388 ) ) ( not ( = ?auto_112390 ?auto_112388 ) ) ( not ( = ?auto_112386 ?auto_112390 ) ) ( not ( = ?auto_112386 ?auto_112389 ) ) ( not ( = ?auto_112386 ?auto_112387 ) ) ( not ( = ?auto_112393 ?auto_112390 ) ) ( not ( = ?auto_112393 ?auto_112389 ) ) ( not ( = ?auto_112393 ?auto_112387 ) ) ( not ( = ?auto_112392 ?auto_112390 ) ) ( not ( = ?auto_112392 ?auto_112389 ) ) ( not ( = ?auto_112392 ?auto_112387 ) ) ( ON ?auto_112389 ?auto_112391 ) ( not ( = ?auto_112386 ?auto_112391 ) ) ( not ( = ?auto_112393 ?auto_112391 ) ) ( not ( = ?auto_112392 ?auto_112391 ) ) ( not ( = ?auto_112388 ?auto_112391 ) ) ( not ( = ?auto_112389 ?auto_112391 ) ) ( not ( = ?auto_112387 ?auto_112391 ) ) ( not ( = ?auto_112390 ?auto_112391 ) ) ( ON ?auto_112387 ?auto_112389 ) ( ON-TABLE ?auto_112391 ) ( ON ?auto_112390 ?auto_112387 ) ( ON ?auto_112388 ?auto_112390 ) ( CLEAR ?auto_112393 ) ( ON ?auto_112392 ?auto_112388 ) ( CLEAR ?auto_112392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112391 ?auto_112389 ?auto_112387 ?auto_112390 ?auto_112388 )
      ( MAKE-1PILE ?auto_112386 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112410 - BLOCK
    )
    :vars
    (
      ?auto_112411 - BLOCK
      ?auto_112414 - BLOCK
      ?auto_112416 - BLOCK
      ?auto_112417 - BLOCK
      ?auto_112415 - BLOCK
      ?auto_112412 - BLOCK
      ?auto_112413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112410 ?auto_112411 ) ) ( not ( = ?auto_112410 ?auto_112414 ) ) ( not ( = ?auto_112410 ?auto_112416 ) ) ( not ( = ?auto_112411 ?auto_112414 ) ) ( not ( = ?auto_112411 ?auto_112416 ) ) ( not ( = ?auto_112414 ?auto_112416 ) ) ( not ( = ?auto_112417 ?auto_112415 ) ) ( not ( = ?auto_112417 ?auto_112412 ) ) ( not ( = ?auto_112417 ?auto_112416 ) ) ( not ( = ?auto_112415 ?auto_112412 ) ) ( not ( = ?auto_112415 ?auto_112416 ) ) ( not ( = ?auto_112412 ?auto_112416 ) ) ( not ( = ?auto_112410 ?auto_112412 ) ) ( not ( = ?auto_112410 ?auto_112417 ) ) ( not ( = ?auto_112410 ?auto_112415 ) ) ( not ( = ?auto_112411 ?auto_112412 ) ) ( not ( = ?auto_112411 ?auto_112417 ) ) ( not ( = ?auto_112411 ?auto_112415 ) ) ( not ( = ?auto_112414 ?auto_112412 ) ) ( not ( = ?auto_112414 ?auto_112417 ) ) ( not ( = ?auto_112414 ?auto_112415 ) ) ( ON ?auto_112417 ?auto_112413 ) ( not ( = ?auto_112410 ?auto_112413 ) ) ( not ( = ?auto_112411 ?auto_112413 ) ) ( not ( = ?auto_112414 ?auto_112413 ) ) ( not ( = ?auto_112416 ?auto_112413 ) ) ( not ( = ?auto_112417 ?auto_112413 ) ) ( not ( = ?auto_112415 ?auto_112413 ) ) ( not ( = ?auto_112412 ?auto_112413 ) ) ( ON ?auto_112415 ?auto_112417 ) ( ON-TABLE ?auto_112413 ) ( ON ?auto_112412 ?auto_112415 ) ( ON ?auto_112416 ?auto_112412 ) ( ON ?auto_112414 ?auto_112416 ) ( ON ?auto_112411 ?auto_112414 ) ( CLEAR ?auto_112411 ) ( HOLDING ?auto_112410 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112410 ?auto_112411 )
      ( MAKE-1PILE ?auto_112410 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112418 - BLOCK
    )
    :vars
    (
      ?auto_112422 - BLOCK
      ?auto_112425 - BLOCK
      ?auto_112421 - BLOCK
      ?auto_112419 - BLOCK
      ?auto_112424 - BLOCK
      ?auto_112423 - BLOCK
      ?auto_112420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112418 ?auto_112422 ) ) ( not ( = ?auto_112418 ?auto_112425 ) ) ( not ( = ?auto_112418 ?auto_112421 ) ) ( not ( = ?auto_112422 ?auto_112425 ) ) ( not ( = ?auto_112422 ?auto_112421 ) ) ( not ( = ?auto_112425 ?auto_112421 ) ) ( not ( = ?auto_112419 ?auto_112424 ) ) ( not ( = ?auto_112419 ?auto_112423 ) ) ( not ( = ?auto_112419 ?auto_112421 ) ) ( not ( = ?auto_112424 ?auto_112423 ) ) ( not ( = ?auto_112424 ?auto_112421 ) ) ( not ( = ?auto_112423 ?auto_112421 ) ) ( not ( = ?auto_112418 ?auto_112423 ) ) ( not ( = ?auto_112418 ?auto_112419 ) ) ( not ( = ?auto_112418 ?auto_112424 ) ) ( not ( = ?auto_112422 ?auto_112423 ) ) ( not ( = ?auto_112422 ?auto_112419 ) ) ( not ( = ?auto_112422 ?auto_112424 ) ) ( not ( = ?auto_112425 ?auto_112423 ) ) ( not ( = ?auto_112425 ?auto_112419 ) ) ( not ( = ?auto_112425 ?auto_112424 ) ) ( ON ?auto_112419 ?auto_112420 ) ( not ( = ?auto_112418 ?auto_112420 ) ) ( not ( = ?auto_112422 ?auto_112420 ) ) ( not ( = ?auto_112425 ?auto_112420 ) ) ( not ( = ?auto_112421 ?auto_112420 ) ) ( not ( = ?auto_112419 ?auto_112420 ) ) ( not ( = ?auto_112424 ?auto_112420 ) ) ( not ( = ?auto_112423 ?auto_112420 ) ) ( ON ?auto_112424 ?auto_112419 ) ( ON-TABLE ?auto_112420 ) ( ON ?auto_112423 ?auto_112424 ) ( ON ?auto_112421 ?auto_112423 ) ( ON ?auto_112425 ?auto_112421 ) ( ON ?auto_112422 ?auto_112425 ) ( ON ?auto_112418 ?auto_112422 ) ( CLEAR ?auto_112418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112420 ?auto_112419 ?auto_112424 ?auto_112423 ?auto_112421 ?auto_112425 ?auto_112422 )
      ( MAKE-1PILE ?auto_112418 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112432 - BLOCK
      ?auto_112433 - BLOCK
      ?auto_112434 - BLOCK
      ?auto_112435 - BLOCK
      ?auto_112436 - BLOCK
      ?auto_112437 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_112437 ) ( CLEAR ?auto_112436 ) ( ON-TABLE ?auto_112432 ) ( ON ?auto_112433 ?auto_112432 ) ( ON ?auto_112434 ?auto_112433 ) ( ON ?auto_112435 ?auto_112434 ) ( ON ?auto_112436 ?auto_112435 ) ( not ( = ?auto_112432 ?auto_112433 ) ) ( not ( = ?auto_112432 ?auto_112434 ) ) ( not ( = ?auto_112432 ?auto_112435 ) ) ( not ( = ?auto_112432 ?auto_112436 ) ) ( not ( = ?auto_112432 ?auto_112437 ) ) ( not ( = ?auto_112433 ?auto_112434 ) ) ( not ( = ?auto_112433 ?auto_112435 ) ) ( not ( = ?auto_112433 ?auto_112436 ) ) ( not ( = ?auto_112433 ?auto_112437 ) ) ( not ( = ?auto_112434 ?auto_112435 ) ) ( not ( = ?auto_112434 ?auto_112436 ) ) ( not ( = ?auto_112434 ?auto_112437 ) ) ( not ( = ?auto_112435 ?auto_112436 ) ) ( not ( = ?auto_112435 ?auto_112437 ) ) ( not ( = ?auto_112436 ?auto_112437 ) ) )
    :subtasks
    ( ( !STACK ?auto_112437 ?auto_112436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112438 - BLOCK
      ?auto_112439 - BLOCK
      ?auto_112440 - BLOCK
      ?auto_112441 - BLOCK
      ?auto_112442 - BLOCK
      ?auto_112443 - BLOCK
    )
    :vars
    (
      ?auto_112444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_112442 ) ( ON-TABLE ?auto_112438 ) ( ON ?auto_112439 ?auto_112438 ) ( ON ?auto_112440 ?auto_112439 ) ( ON ?auto_112441 ?auto_112440 ) ( ON ?auto_112442 ?auto_112441 ) ( not ( = ?auto_112438 ?auto_112439 ) ) ( not ( = ?auto_112438 ?auto_112440 ) ) ( not ( = ?auto_112438 ?auto_112441 ) ) ( not ( = ?auto_112438 ?auto_112442 ) ) ( not ( = ?auto_112438 ?auto_112443 ) ) ( not ( = ?auto_112439 ?auto_112440 ) ) ( not ( = ?auto_112439 ?auto_112441 ) ) ( not ( = ?auto_112439 ?auto_112442 ) ) ( not ( = ?auto_112439 ?auto_112443 ) ) ( not ( = ?auto_112440 ?auto_112441 ) ) ( not ( = ?auto_112440 ?auto_112442 ) ) ( not ( = ?auto_112440 ?auto_112443 ) ) ( not ( = ?auto_112441 ?auto_112442 ) ) ( not ( = ?auto_112441 ?auto_112443 ) ) ( not ( = ?auto_112442 ?auto_112443 ) ) ( ON ?auto_112443 ?auto_112444 ) ( CLEAR ?auto_112443 ) ( HAND-EMPTY ) ( not ( = ?auto_112438 ?auto_112444 ) ) ( not ( = ?auto_112439 ?auto_112444 ) ) ( not ( = ?auto_112440 ?auto_112444 ) ) ( not ( = ?auto_112441 ?auto_112444 ) ) ( not ( = ?auto_112442 ?auto_112444 ) ) ( not ( = ?auto_112443 ?auto_112444 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112443 ?auto_112444 )
      ( MAKE-6PILE ?auto_112438 ?auto_112439 ?auto_112440 ?auto_112441 ?auto_112442 ?auto_112443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112445 - BLOCK
      ?auto_112446 - BLOCK
      ?auto_112447 - BLOCK
      ?auto_112448 - BLOCK
      ?auto_112449 - BLOCK
      ?auto_112450 - BLOCK
    )
    :vars
    (
      ?auto_112451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112445 ) ( ON ?auto_112446 ?auto_112445 ) ( ON ?auto_112447 ?auto_112446 ) ( ON ?auto_112448 ?auto_112447 ) ( not ( = ?auto_112445 ?auto_112446 ) ) ( not ( = ?auto_112445 ?auto_112447 ) ) ( not ( = ?auto_112445 ?auto_112448 ) ) ( not ( = ?auto_112445 ?auto_112449 ) ) ( not ( = ?auto_112445 ?auto_112450 ) ) ( not ( = ?auto_112446 ?auto_112447 ) ) ( not ( = ?auto_112446 ?auto_112448 ) ) ( not ( = ?auto_112446 ?auto_112449 ) ) ( not ( = ?auto_112446 ?auto_112450 ) ) ( not ( = ?auto_112447 ?auto_112448 ) ) ( not ( = ?auto_112447 ?auto_112449 ) ) ( not ( = ?auto_112447 ?auto_112450 ) ) ( not ( = ?auto_112448 ?auto_112449 ) ) ( not ( = ?auto_112448 ?auto_112450 ) ) ( not ( = ?auto_112449 ?auto_112450 ) ) ( ON ?auto_112450 ?auto_112451 ) ( CLEAR ?auto_112450 ) ( not ( = ?auto_112445 ?auto_112451 ) ) ( not ( = ?auto_112446 ?auto_112451 ) ) ( not ( = ?auto_112447 ?auto_112451 ) ) ( not ( = ?auto_112448 ?auto_112451 ) ) ( not ( = ?auto_112449 ?auto_112451 ) ) ( not ( = ?auto_112450 ?auto_112451 ) ) ( HOLDING ?auto_112449 ) ( CLEAR ?auto_112448 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112445 ?auto_112446 ?auto_112447 ?auto_112448 ?auto_112449 )
      ( MAKE-6PILE ?auto_112445 ?auto_112446 ?auto_112447 ?auto_112448 ?auto_112449 ?auto_112450 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112452 - BLOCK
      ?auto_112453 - BLOCK
      ?auto_112454 - BLOCK
      ?auto_112455 - BLOCK
      ?auto_112456 - BLOCK
      ?auto_112457 - BLOCK
    )
    :vars
    (
      ?auto_112458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112452 ) ( ON ?auto_112453 ?auto_112452 ) ( ON ?auto_112454 ?auto_112453 ) ( ON ?auto_112455 ?auto_112454 ) ( not ( = ?auto_112452 ?auto_112453 ) ) ( not ( = ?auto_112452 ?auto_112454 ) ) ( not ( = ?auto_112452 ?auto_112455 ) ) ( not ( = ?auto_112452 ?auto_112456 ) ) ( not ( = ?auto_112452 ?auto_112457 ) ) ( not ( = ?auto_112453 ?auto_112454 ) ) ( not ( = ?auto_112453 ?auto_112455 ) ) ( not ( = ?auto_112453 ?auto_112456 ) ) ( not ( = ?auto_112453 ?auto_112457 ) ) ( not ( = ?auto_112454 ?auto_112455 ) ) ( not ( = ?auto_112454 ?auto_112456 ) ) ( not ( = ?auto_112454 ?auto_112457 ) ) ( not ( = ?auto_112455 ?auto_112456 ) ) ( not ( = ?auto_112455 ?auto_112457 ) ) ( not ( = ?auto_112456 ?auto_112457 ) ) ( ON ?auto_112457 ?auto_112458 ) ( not ( = ?auto_112452 ?auto_112458 ) ) ( not ( = ?auto_112453 ?auto_112458 ) ) ( not ( = ?auto_112454 ?auto_112458 ) ) ( not ( = ?auto_112455 ?auto_112458 ) ) ( not ( = ?auto_112456 ?auto_112458 ) ) ( not ( = ?auto_112457 ?auto_112458 ) ) ( CLEAR ?auto_112455 ) ( ON ?auto_112456 ?auto_112457 ) ( CLEAR ?auto_112456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112458 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112458 ?auto_112457 )
      ( MAKE-6PILE ?auto_112452 ?auto_112453 ?auto_112454 ?auto_112455 ?auto_112456 ?auto_112457 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112459 - BLOCK
      ?auto_112460 - BLOCK
      ?auto_112461 - BLOCK
      ?auto_112462 - BLOCK
      ?auto_112463 - BLOCK
      ?auto_112464 - BLOCK
    )
    :vars
    (
      ?auto_112465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112459 ) ( ON ?auto_112460 ?auto_112459 ) ( ON ?auto_112461 ?auto_112460 ) ( not ( = ?auto_112459 ?auto_112460 ) ) ( not ( = ?auto_112459 ?auto_112461 ) ) ( not ( = ?auto_112459 ?auto_112462 ) ) ( not ( = ?auto_112459 ?auto_112463 ) ) ( not ( = ?auto_112459 ?auto_112464 ) ) ( not ( = ?auto_112460 ?auto_112461 ) ) ( not ( = ?auto_112460 ?auto_112462 ) ) ( not ( = ?auto_112460 ?auto_112463 ) ) ( not ( = ?auto_112460 ?auto_112464 ) ) ( not ( = ?auto_112461 ?auto_112462 ) ) ( not ( = ?auto_112461 ?auto_112463 ) ) ( not ( = ?auto_112461 ?auto_112464 ) ) ( not ( = ?auto_112462 ?auto_112463 ) ) ( not ( = ?auto_112462 ?auto_112464 ) ) ( not ( = ?auto_112463 ?auto_112464 ) ) ( ON ?auto_112464 ?auto_112465 ) ( not ( = ?auto_112459 ?auto_112465 ) ) ( not ( = ?auto_112460 ?auto_112465 ) ) ( not ( = ?auto_112461 ?auto_112465 ) ) ( not ( = ?auto_112462 ?auto_112465 ) ) ( not ( = ?auto_112463 ?auto_112465 ) ) ( not ( = ?auto_112464 ?auto_112465 ) ) ( ON ?auto_112463 ?auto_112464 ) ( CLEAR ?auto_112463 ) ( ON-TABLE ?auto_112465 ) ( HOLDING ?auto_112462 ) ( CLEAR ?auto_112461 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112459 ?auto_112460 ?auto_112461 ?auto_112462 )
      ( MAKE-6PILE ?auto_112459 ?auto_112460 ?auto_112461 ?auto_112462 ?auto_112463 ?auto_112464 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112466 - BLOCK
      ?auto_112467 - BLOCK
      ?auto_112468 - BLOCK
      ?auto_112469 - BLOCK
      ?auto_112470 - BLOCK
      ?auto_112471 - BLOCK
    )
    :vars
    (
      ?auto_112472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112466 ) ( ON ?auto_112467 ?auto_112466 ) ( ON ?auto_112468 ?auto_112467 ) ( not ( = ?auto_112466 ?auto_112467 ) ) ( not ( = ?auto_112466 ?auto_112468 ) ) ( not ( = ?auto_112466 ?auto_112469 ) ) ( not ( = ?auto_112466 ?auto_112470 ) ) ( not ( = ?auto_112466 ?auto_112471 ) ) ( not ( = ?auto_112467 ?auto_112468 ) ) ( not ( = ?auto_112467 ?auto_112469 ) ) ( not ( = ?auto_112467 ?auto_112470 ) ) ( not ( = ?auto_112467 ?auto_112471 ) ) ( not ( = ?auto_112468 ?auto_112469 ) ) ( not ( = ?auto_112468 ?auto_112470 ) ) ( not ( = ?auto_112468 ?auto_112471 ) ) ( not ( = ?auto_112469 ?auto_112470 ) ) ( not ( = ?auto_112469 ?auto_112471 ) ) ( not ( = ?auto_112470 ?auto_112471 ) ) ( ON ?auto_112471 ?auto_112472 ) ( not ( = ?auto_112466 ?auto_112472 ) ) ( not ( = ?auto_112467 ?auto_112472 ) ) ( not ( = ?auto_112468 ?auto_112472 ) ) ( not ( = ?auto_112469 ?auto_112472 ) ) ( not ( = ?auto_112470 ?auto_112472 ) ) ( not ( = ?auto_112471 ?auto_112472 ) ) ( ON ?auto_112470 ?auto_112471 ) ( ON-TABLE ?auto_112472 ) ( CLEAR ?auto_112468 ) ( ON ?auto_112469 ?auto_112470 ) ( CLEAR ?auto_112469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112472 ?auto_112471 ?auto_112470 )
      ( MAKE-6PILE ?auto_112466 ?auto_112467 ?auto_112468 ?auto_112469 ?auto_112470 ?auto_112471 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112473 - BLOCK
      ?auto_112474 - BLOCK
      ?auto_112475 - BLOCK
      ?auto_112476 - BLOCK
      ?auto_112477 - BLOCK
      ?auto_112478 - BLOCK
    )
    :vars
    (
      ?auto_112479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112473 ) ( ON ?auto_112474 ?auto_112473 ) ( not ( = ?auto_112473 ?auto_112474 ) ) ( not ( = ?auto_112473 ?auto_112475 ) ) ( not ( = ?auto_112473 ?auto_112476 ) ) ( not ( = ?auto_112473 ?auto_112477 ) ) ( not ( = ?auto_112473 ?auto_112478 ) ) ( not ( = ?auto_112474 ?auto_112475 ) ) ( not ( = ?auto_112474 ?auto_112476 ) ) ( not ( = ?auto_112474 ?auto_112477 ) ) ( not ( = ?auto_112474 ?auto_112478 ) ) ( not ( = ?auto_112475 ?auto_112476 ) ) ( not ( = ?auto_112475 ?auto_112477 ) ) ( not ( = ?auto_112475 ?auto_112478 ) ) ( not ( = ?auto_112476 ?auto_112477 ) ) ( not ( = ?auto_112476 ?auto_112478 ) ) ( not ( = ?auto_112477 ?auto_112478 ) ) ( ON ?auto_112478 ?auto_112479 ) ( not ( = ?auto_112473 ?auto_112479 ) ) ( not ( = ?auto_112474 ?auto_112479 ) ) ( not ( = ?auto_112475 ?auto_112479 ) ) ( not ( = ?auto_112476 ?auto_112479 ) ) ( not ( = ?auto_112477 ?auto_112479 ) ) ( not ( = ?auto_112478 ?auto_112479 ) ) ( ON ?auto_112477 ?auto_112478 ) ( ON-TABLE ?auto_112479 ) ( ON ?auto_112476 ?auto_112477 ) ( CLEAR ?auto_112476 ) ( HOLDING ?auto_112475 ) ( CLEAR ?auto_112474 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112473 ?auto_112474 ?auto_112475 )
      ( MAKE-6PILE ?auto_112473 ?auto_112474 ?auto_112475 ?auto_112476 ?auto_112477 ?auto_112478 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112480 - BLOCK
      ?auto_112481 - BLOCK
      ?auto_112482 - BLOCK
      ?auto_112483 - BLOCK
      ?auto_112484 - BLOCK
      ?auto_112485 - BLOCK
    )
    :vars
    (
      ?auto_112486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112480 ) ( ON ?auto_112481 ?auto_112480 ) ( not ( = ?auto_112480 ?auto_112481 ) ) ( not ( = ?auto_112480 ?auto_112482 ) ) ( not ( = ?auto_112480 ?auto_112483 ) ) ( not ( = ?auto_112480 ?auto_112484 ) ) ( not ( = ?auto_112480 ?auto_112485 ) ) ( not ( = ?auto_112481 ?auto_112482 ) ) ( not ( = ?auto_112481 ?auto_112483 ) ) ( not ( = ?auto_112481 ?auto_112484 ) ) ( not ( = ?auto_112481 ?auto_112485 ) ) ( not ( = ?auto_112482 ?auto_112483 ) ) ( not ( = ?auto_112482 ?auto_112484 ) ) ( not ( = ?auto_112482 ?auto_112485 ) ) ( not ( = ?auto_112483 ?auto_112484 ) ) ( not ( = ?auto_112483 ?auto_112485 ) ) ( not ( = ?auto_112484 ?auto_112485 ) ) ( ON ?auto_112485 ?auto_112486 ) ( not ( = ?auto_112480 ?auto_112486 ) ) ( not ( = ?auto_112481 ?auto_112486 ) ) ( not ( = ?auto_112482 ?auto_112486 ) ) ( not ( = ?auto_112483 ?auto_112486 ) ) ( not ( = ?auto_112484 ?auto_112486 ) ) ( not ( = ?auto_112485 ?auto_112486 ) ) ( ON ?auto_112484 ?auto_112485 ) ( ON-TABLE ?auto_112486 ) ( ON ?auto_112483 ?auto_112484 ) ( CLEAR ?auto_112481 ) ( ON ?auto_112482 ?auto_112483 ) ( CLEAR ?auto_112482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112486 ?auto_112485 ?auto_112484 ?auto_112483 )
      ( MAKE-6PILE ?auto_112480 ?auto_112481 ?auto_112482 ?auto_112483 ?auto_112484 ?auto_112485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112487 - BLOCK
      ?auto_112488 - BLOCK
      ?auto_112489 - BLOCK
      ?auto_112490 - BLOCK
      ?auto_112491 - BLOCK
      ?auto_112492 - BLOCK
    )
    :vars
    (
      ?auto_112493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112487 ) ( not ( = ?auto_112487 ?auto_112488 ) ) ( not ( = ?auto_112487 ?auto_112489 ) ) ( not ( = ?auto_112487 ?auto_112490 ) ) ( not ( = ?auto_112487 ?auto_112491 ) ) ( not ( = ?auto_112487 ?auto_112492 ) ) ( not ( = ?auto_112488 ?auto_112489 ) ) ( not ( = ?auto_112488 ?auto_112490 ) ) ( not ( = ?auto_112488 ?auto_112491 ) ) ( not ( = ?auto_112488 ?auto_112492 ) ) ( not ( = ?auto_112489 ?auto_112490 ) ) ( not ( = ?auto_112489 ?auto_112491 ) ) ( not ( = ?auto_112489 ?auto_112492 ) ) ( not ( = ?auto_112490 ?auto_112491 ) ) ( not ( = ?auto_112490 ?auto_112492 ) ) ( not ( = ?auto_112491 ?auto_112492 ) ) ( ON ?auto_112492 ?auto_112493 ) ( not ( = ?auto_112487 ?auto_112493 ) ) ( not ( = ?auto_112488 ?auto_112493 ) ) ( not ( = ?auto_112489 ?auto_112493 ) ) ( not ( = ?auto_112490 ?auto_112493 ) ) ( not ( = ?auto_112491 ?auto_112493 ) ) ( not ( = ?auto_112492 ?auto_112493 ) ) ( ON ?auto_112491 ?auto_112492 ) ( ON-TABLE ?auto_112493 ) ( ON ?auto_112490 ?auto_112491 ) ( ON ?auto_112489 ?auto_112490 ) ( CLEAR ?auto_112489 ) ( HOLDING ?auto_112488 ) ( CLEAR ?auto_112487 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112487 ?auto_112488 )
      ( MAKE-6PILE ?auto_112487 ?auto_112488 ?auto_112489 ?auto_112490 ?auto_112491 ?auto_112492 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112494 - BLOCK
      ?auto_112495 - BLOCK
      ?auto_112496 - BLOCK
      ?auto_112497 - BLOCK
      ?auto_112498 - BLOCK
      ?auto_112499 - BLOCK
    )
    :vars
    (
      ?auto_112500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112494 ) ( not ( = ?auto_112494 ?auto_112495 ) ) ( not ( = ?auto_112494 ?auto_112496 ) ) ( not ( = ?auto_112494 ?auto_112497 ) ) ( not ( = ?auto_112494 ?auto_112498 ) ) ( not ( = ?auto_112494 ?auto_112499 ) ) ( not ( = ?auto_112495 ?auto_112496 ) ) ( not ( = ?auto_112495 ?auto_112497 ) ) ( not ( = ?auto_112495 ?auto_112498 ) ) ( not ( = ?auto_112495 ?auto_112499 ) ) ( not ( = ?auto_112496 ?auto_112497 ) ) ( not ( = ?auto_112496 ?auto_112498 ) ) ( not ( = ?auto_112496 ?auto_112499 ) ) ( not ( = ?auto_112497 ?auto_112498 ) ) ( not ( = ?auto_112497 ?auto_112499 ) ) ( not ( = ?auto_112498 ?auto_112499 ) ) ( ON ?auto_112499 ?auto_112500 ) ( not ( = ?auto_112494 ?auto_112500 ) ) ( not ( = ?auto_112495 ?auto_112500 ) ) ( not ( = ?auto_112496 ?auto_112500 ) ) ( not ( = ?auto_112497 ?auto_112500 ) ) ( not ( = ?auto_112498 ?auto_112500 ) ) ( not ( = ?auto_112499 ?auto_112500 ) ) ( ON ?auto_112498 ?auto_112499 ) ( ON-TABLE ?auto_112500 ) ( ON ?auto_112497 ?auto_112498 ) ( ON ?auto_112496 ?auto_112497 ) ( CLEAR ?auto_112494 ) ( ON ?auto_112495 ?auto_112496 ) ( CLEAR ?auto_112495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112500 ?auto_112499 ?auto_112498 ?auto_112497 ?auto_112496 )
      ( MAKE-6PILE ?auto_112494 ?auto_112495 ?auto_112496 ?auto_112497 ?auto_112498 ?auto_112499 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112501 - BLOCK
      ?auto_112502 - BLOCK
      ?auto_112503 - BLOCK
      ?auto_112504 - BLOCK
      ?auto_112505 - BLOCK
      ?auto_112506 - BLOCK
    )
    :vars
    (
      ?auto_112507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112501 ?auto_112502 ) ) ( not ( = ?auto_112501 ?auto_112503 ) ) ( not ( = ?auto_112501 ?auto_112504 ) ) ( not ( = ?auto_112501 ?auto_112505 ) ) ( not ( = ?auto_112501 ?auto_112506 ) ) ( not ( = ?auto_112502 ?auto_112503 ) ) ( not ( = ?auto_112502 ?auto_112504 ) ) ( not ( = ?auto_112502 ?auto_112505 ) ) ( not ( = ?auto_112502 ?auto_112506 ) ) ( not ( = ?auto_112503 ?auto_112504 ) ) ( not ( = ?auto_112503 ?auto_112505 ) ) ( not ( = ?auto_112503 ?auto_112506 ) ) ( not ( = ?auto_112504 ?auto_112505 ) ) ( not ( = ?auto_112504 ?auto_112506 ) ) ( not ( = ?auto_112505 ?auto_112506 ) ) ( ON ?auto_112506 ?auto_112507 ) ( not ( = ?auto_112501 ?auto_112507 ) ) ( not ( = ?auto_112502 ?auto_112507 ) ) ( not ( = ?auto_112503 ?auto_112507 ) ) ( not ( = ?auto_112504 ?auto_112507 ) ) ( not ( = ?auto_112505 ?auto_112507 ) ) ( not ( = ?auto_112506 ?auto_112507 ) ) ( ON ?auto_112505 ?auto_112506 ) ( ON-TABLE ?auto_112507 ) ( ON ?auto_112504 ?auto_112505 ) ( ON ?auto_112503 ?auto_112504 ) ( ON ?auto_112502 ?auto_112503 ) ( CLEAR ?auto_112502 ) ( HOLDING ?auto_112501 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112501 )
      ( MAKE-6PILE ?auto_112501 ?auto_112502 ?auto_112503 ?auto_112504 ?auto_112505 ?auto_112506 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112508 - BLOCK
      ?auto_112509 - BLOCK
      ?auto_112510 - BLOCK
      ?auto_112511 - BLOCK
      ?auto_112512 - BLOCK
      ?auto_112513 - BLOCK
    )
    :vars
    (
      ?auto_112514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112508 ?auto_112509 ) ) ( not ( = ?auto_112508 ?auto_112510 ) ) ( not ( = ?auto_112508 ?auto_112511 ) ) ( not ( = ?auto_112508 ?auto_112512 ) ) ( not ( = ?auto_112508 ?auto_112513 ) ) ( not ( = ?auto_112509 ?auto_112510 ) ) ( not ( = ?auto_112509 ?auto_112511 ) ) ( not ( = ?auto_112509 ?auto_112512 ) ) ( not ( = ?auto_112509 ?auto_112513 ) ) ( not ( = ?auto_112510 ?auto_112511 ) ) ( not ( = ?auto_112510 ?auto_112512 ) ) ( not ( = ?auto_112510 ?auto_112513 ) ) ( not ( = ?auto_112511 ?auto_112512 ) ) ( not ( = ?auto_112511 ?auto_112513 ) ) ( not ( = ?auto_112512 ?auto_112513 ) ) ( ON ?auto_112513 ?auto_112514 ) ( not ( = ?auto_112508 ?auto_112514 ) ) ( not ( = ?auto_112509 ?auto_112514 ) ) ( not ( = ?auto_112510 ?auto_112514 ) ) ( not ( = ?auto_112511 ?auto_112514 ) ) ( not ( = ?auto_112512 ?auto_112514 ) ) ( not ( = ?auto_112513 ?auto_112514 ) ) ( ON ?auto_112512 ?auto_112513 ) ( ON-TABLE ?auto_112514 ) ( ON ?auto_112511 ?auto_112512 ) ( ON ?auto_112510 ?auto_112511 ) ( ON ?auto_112509 ?auto_112510 ) ( ON ?auto_112508 ?auto_112509 ) ( CLEAR ?auto_112508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112514 ?auto_112513 ?auto_112512 ?auto_112511 ?auto_112510 ?auto_112509 )
      ( MAKE-6PILE ?auto_112508 ?auto_112509 ?auto_112510 ?auto_112511 ?auto_112512 ?auto_112513 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112515 - BLOCK
      ?auto_112516 - BLOCK
      ?auto_112517 - BLOCK
      ?auto_112518 - BLOCK
      ?auto_112519 - BLOCK
      ?auto_112520 - BLOCK
    )
    :vars
    (
      ?auto_112521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112515 ?auto_112516 ) ) ( not ( = ?auto_112515 ?auto_112517 ) ) ( not ( = ?auto_112515 ?auto_112518 ) ) ( not ( = ?auto_112515 ?auto_112519 ) ) ( not ( = ?auto_112515 ?auto_112520 ) ) ( not ( = ?auto_112516 ?auto_112517 ) ) ( not ( = ?auto_112516 ?auto_112518 ) ) ( not ( = ?auto_112516 ?auto_112519 ) ) ( not ( = ?auto_112516 ?auto_112520 ) ) ( not ( = ?auto_112517 ?auto_112518 ) ) ( not ( = ?auto_112517 ?auto_112519 ) ) ( not ( = ?auto_112517 ?auto_112520 ) ) ( not ( = ?auto_112518 ?auto_112519 ) ) ( not ( = ?auto_112518 ?auto_112520 ) ) ( not ( = ?auto_112519 ?auto_112520 ) ) ( ON ?auto_112520 ?auto_112521 ) ( not ( = ?auto_112515 ?auto_112521 ) ) ( not ( = ?auto_112516 ?auto_112521 ) ) ( not ( = ?auto_112517 ?auto_112521 ) ) ( not ( = ?auto_112518 ?auto_112521 ) ) ( not ( = ?auto_112519 ?auto_112521 ) ) ( not ( = ?auto_112520 ?auto_112521 ) ) ( ON ?auto_112519 ?auto_112520 ) ( ON-TABLE ?auto_112521 ) ( ON ?auto_112518 ?auto_112519 ) ( ON ?auto_112517 ?auto_112518 ) ( ON ?auto_112516 ?auto_112517 ) ( HOLDING ?auto_112515 ) ( CLEAR ?auto_112516 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112521 ?auto_112520 ?auto_112519 ?auto_112518 ?auto_112517 ?auto_112516 ?auto_112515 )
      ( MAKE-6PILE ?auto_112515 ?auto_112516 ?auto_112517 ?auto_112518 ?auto_112519 ?auto_112520 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112522 - BLOCK
      ?auto_112523 - BLOCK
      ?auto_112524 - BLOCK
      ?auto_112525 - BLOCK
      ?auto_112526 - BLOCK
      ?auto_112527 - BLOCK
    )
    :vars
    (
      ?auto_112528 - BLOCK
      ?auto_112529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112522 ?auto_112523 ) ) ( not ( = ?auto_112522 ?auto_112524 ) ) ( not ( = ?auto_112522 ?auto_112525 ) ) ( not ( = ?auto_112522 ?auto_112526 ) ) ( not ( = ?auto_112522 ?auto_112527 ) ) ( not ( = ?auto_112523 ?auto_112524 ) ) ( not ( = ?auto_112523 ?auto_112525 ) ) ( not ( = ?auto_112523 ?auto_112526 ) ) ( not ( = ?auto_112523 ?auto_112527 ) ) ( not ( = ?auto_112524 ?auto_112525 ) ) ( not ( = ?auto_112524 ?auto_112526 ) ) ( not ( = ?auto_112524 ?auto_112527 ) ) ( not ( = ?auto_112525 ?auto_112526 ) ) ( not ( = ?auto_112525 ?auto_112527 ) ) ( not ( = ?auto_112526 ?auto_112527 ) ) ( ON ?auto_112527 ?auto_112528 ) ( not ( = ?auto_112522 ?auto_112528 ) ) ( not ( = ?auto_112523 ?auto_112528 ) ) ( not ( = ?auto_112524 ?auto_112528 ) ) ( not ( = ?auto_112525 ?auto_112528 ) ) ( not ( = ?auto_112526 ?auto_112528 ) ) ( not ( = ?auto_112527 ?auto_112528 ) ) ( ON ?auto_112526 ?auto_112527 ) ( ON-TABLE ?auto_112528 ) ( ON ?auto_112525 ?auto_112526 ) ( ON ?auto_112524 ?auto_112525 ) ( ON ?auto_112523 ?auto_112524 ) ( CLEAR ?auto_112523 ) ( ON ?auto_112522 ?auto_112529 ) ( CLEAR ?auto_112522 ) ( HAND-EMPTY ) ( not ( = ?auto_112522 ?auto_112529 ) ) ( not ( = ?auto_112523 ?auto_112529 ) ) ( not ( = ?auto_112524 ?auto_112529 ) ) ( not ( = ?auto_112525 ?auto_112529 ) ) ( not ( = ?auto_112526 ?auto_112529 ) ) ( not ( = ?auto_112527 ?auto_112529 ) ) ( not ( = ?auto_112528 ?auto_112529 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112522 ?auto_112529 )
      ( MAKE-6PILE ?auto_112522 ?auto_112523 ?auto_112524 ?auto_112525 ?auto_112526 ?auto_112527 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112530 - BLOCK
      ?auto_112531 - BLOCK
      ?auto_112532 - BLOCK
      ?auto_112533 - BLOCK
      ?auto_112534 - BLOCK
      ?auto_112535 - BLOCK
    )
    :vars
    (
      ?auto_112537 - BLOCK
      ?auto_112536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112530 ?auto_112531 ) ) ( not ( = ?auto_112530 ?auto_112532 ) ) ( not ( = ?auto_112530 ?auto_112533 ) ) ( not ( = ?auto_112530 ?auto_112534 ) ) ( not ( = ?auto_112530 ?auto_112535 ) ) ( not ( = ?auto_112531 ?auto_112532 ) ) ( not ( = ?auto_112531 ?auto_112533 ) ) ( not ( = ?auto_112531 ?auto_112534 ) ) ( not ( = ?auto_112531 ?auto_112535 ) ) ( not ( = ?auto_112532 ?auto_112533 ) ) ( not ( = ?auto_112532 ?auto_112534 ) ) ( not ( = ?auto_112532 ?auto_112535 ) ) ( not ( = ?auto_112533 ?auto_112534 ) ) ( not ( = ?auto_112533 ?auto_112535 ) ) ( not ( = ?auto_112534 ?auto_112535 ) ) ( ON ?auto_112535 ?auto_112537 ) ( not ( = ?auto_112530 ?auto_112537 ) ) ( not ( = ?auto_112531 ?auto_112537 ) ) ( not ( = ?auto_112532 ?auto_112537 ) ) ( not ( = ?auto_112533 ?auto_112537 ) ) ( not ( = ?auto_112534 ?auto_112537 ) ) ( not ( = ?auto_112535 ?auto_112537 ) ) ( ON ?auto_112534 ?auto_112535 ) ( ON-TABLE ?auto_112537 ) ( ON ?auto_112533 ?auto_112534 ) ( ON ?auto_112532 ?auto_112533 ) ( ON ?auto_112530 ?auto_112536 ) ( CLEAR ?auto_112530 ) ( not ( = ?auto_112530 ?auto_112536 ) ) ( not ( = ?auto_112531 ?auto_112536 ) ) ( not ( = ?auto_112532 ?auto_112536 ) ) ( not ( = ?auto_112533 ?auto_112536 ) ) ( not ( = ?auto_112534 ?auto_112536 ) ) ( not ( = ?auto_112535 ?auto_112536 ) ) ( not ( = ?auto_112537 ?auto_112536 ) ) ( HOLDING ?auto_112531 ) ( CLEAR ?auto_112532 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112537 ?auto_112535 ?auto_112534 ?auto_112533 ?auto_112532 ?auto_112531 )
      ( MAKE-6PILE ?auto_112530 ?auto_112531 ?auto_112532 ?auto_112533 ?auto_112534 ?auto_112535 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112538 - BLOCK
      ?auto_112539 - BLOCK
      ?auto_112540 - BLOCK
      ?auto_112541 - BLOCK
      ?auto_112542 - BLOCK
      ?auto_112543 - BLOCK
    )
    :vars
    (
      ?auto_112545 - BLOCK
      ?auto_112544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112538 ?auto_112539 ) ) ( not ( = ?auto_112538 ?auto_112540 ) ) ( not ( = ?auto_112538 ?auto_112541 ) ) ( not ( = ?auto_112538 ?auto_112542 ) ) ( not ( = ?auto_112538 ?auto_112543 ) ) ( not ( = ?auto_112539 ?auto_112540 ) ) ( not ( = ?auto_112539 ?auto_112541 ) ) ( not ( = ?auto_112539 ?auto_112542 ) ) ( not ( = ?auto_112539 ?auto_112543 ) ) ( not ( = ?auto_112540 ?auto_112541 ) ) ( not ( = ?auto_112540 ?auto_112542 ) ) ( not ( = ?auto_112540 ?auto_112543 ) ) ( not ( = ?auto_112541 ?auto_112542 ) ) ( not ( = ?auto_112541 ?auto_112543 ) ) ( not ( = ?auto_112542 ?auto_112543 ) ) ( ON ?auto_112543 ?auto_112545 ) ( not ( = ?auto_112538 ?auto_112545 ) ) ( not ( = ?auto_112539 ?auto_112545 ) ) ( not ( = ?auto_112540 ?auto_112545 ) ) ( not ( = ?auto_112541 ?auto_112545 ) ) ( not ( = ?auto_112542 ?auto_112545 ) ) ( not ( = ?auto_112543 ?auto_112545 ) ) ( ON ?auto_112542 ?auto_112543 ) ( ON-TABLE ?auto_112545 ) ( ON ?auto_112541 ?auto_112542 ) ( ON ?auto_112540 ?auto_112541 ) ( ON ?auto_112538 ?auto_112544 ) ( not ( = ?auto_112538 ?auto_112544 ) ) ( not ( = ?auto_112539 ?auto_112544 ) ) ( not ( = ?auto_112540 ?auto_112544 ) ) ( not ( = ?auto_112541 ?auto_112544 ) ) ( not ( = ?auto_112542 ?auto_112544 ) ) ( not ( = ?auto_112543 ?auto_112544 ) ) ( not ( = ?auto_112545 ?auto_112544 ) ) ( CLEAR ?auto_112540 ) ( ON ?auto_112539 ?auto_112538 ) ( CLEAR ?auto_112539 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112544 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112544 ?auto_112538 )
      ( MAKE-6PILE ?auto_112538 ?auto_112539 ?auto_112540 ?auto_112541 ?auto_112542 ?auto_112543 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112546 - BLOCK
      ?auto_112547 - BLOCK
      ?auto_112548 - BLOCK
      ?auto_112549 - BLOCK
      ?auto_112550 - BLOCK
      ?auto_112551 - BLOCK
    )
    :vars
    (
      ?auto_112553 - BLOCK
      ?auto_112552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112546 ?auto_112547 ) ) ( not ( = ?auto_112546 ?auto_112548 ) ) ( not ( = ?auto_112546 ?auto_112549 ) ) ( not ( = ?auto_112546 ?auto_112550 ) ) ( not ( = ?auto_112546 ?auto_112551 ) ) ( not ( = ?auto_112547 ?auto_112548 ) ) ( not ( = ?auto_112547 ?auto_112549 ) ) ( not ( = ?auto_112547 ?auto_112550 ) ) ( not ( = ?auto_112547 ?auto_112551 ) ) ( not ( = ?auto_112548 ?auto_112549 ) ) ( not ( = ?auto_112548 ?auto_112550 ) ) ( not ( = ?auto_112548 ?auto_112551 ) ) ( not ( = ?auto_112549 ?auto_112550 ) ) ( not ( = ?auto_112549 ?auto_112551 ) ) ( not ( = ?auto_112550 ?auto_112551 ) ) ( ON ?auto_112551 ?auto_112553 ) ( not ( = ?auto_112546 ?auto_112553 ) ) ( not ( = ?auto_112547 ?auto_112553 ) ) ( not ( = ?auto_112548 ?auto_112553 ) ) ( not ( = ?auto_112549 ?auto_112553 ) ) ( not ( = ?auto_112550 ?auto_112553 ) ) ( not ( = ?auto_112551 ?auto_112553 ) ) ( ON ?auto_112550 ?auto_112551 ) ( ON-TABLE ?auto_112553 ) ( ON ?auto_112549 ?auto_112550 ) ( ON ?auto_112546 ?auto_112552 ) ( not ( = ?auto_112546 ?auto_112552 ) ) ( not ( = ?auto_112547 ?auto_112552 ) ) ( not ( = ?auto_112548 ?auto_112552 ) ) ( not ( = ?auto_112549 ?auto_112552 ) ) ( not ( = ?auto_112550 ?auto_112552 ) ) ( not ( = ?auto_112551 ?auto_112552 ) ) ( not ( = ?auto_112553 ?auto_112552 ) ) ( ON ?auto_112547 ?auto_112546 ) ( CLEAR ?auto_112547 ) ( ON-TABLE ?auto_112552 ) ( HOLDING ?auto_112548 ) ( CLEAR ?auto_112549 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112553 ?auto_112551 ?auto_112550 ?auto_112549 ?auto_112548 )
      ( MAKE-6PILE ?auto_112546 ?auto_112547 ?auto_112548 ?auto_112549 ?auto_112550 ?auto_112551 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112554 - BLOCK
      ?auto_112555 - BLOCK
      ?auto_112556 - BLOCK
      ?auto_112557 - BLOCK
      ?auto_112558 - BLOCK
      ?auto_112559 - BLOCK
    )
    :vars
    (
      ?auto_112561 - BLOCK
      ?auto_112560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112554 ?auto_112555 ) ) ( not ( = ?auto_112554 ?auto_112556 ) ) ( not ( = ?auto_112554 ?auto_112557 ) ) ( not ( = ?auto_112554 ?auto_112558 ) ) ( not ( = ?auto_112554 ?auto_112559 ) ) ( not ( = ?auto_112555 ?auto_112556 ) ) ( not ( = ?auto_112555 ?auto_112557 ) ) ( not ( = ?auto_112555 ?auto_112558 ) ) ( not ( = ?auto_112555 ?auto_112559 ) ) ( not ( = ?auto_112556 ?auto_112557 ) ) ( not ( = ?auto_112556 ?auto_112558 ) ) ( not ( = ?auto_112556 ?auto_112559 ) ) ( not ( = ?auto_112557 ?auto_112558 ) ) ( not ( = ?auto_112557 ?auto_112559 ) ) ( not ( = ?auto_112558 ?auto_112559 ) ) ( ON ?auto_112559 ?auto_112561 ) ( not ( = ?auto_112554 ?auto_112561 ) ) ( not ( = ?auto_112555 ?auto_112561 ) ) ( not ( = ?auto_112556 ?auto_112561 ) ) ( not ( = ?auto_112557 ?auto_112561 ) ) ( not ( = ?auto_112558 ?auto_112561 ) ) ( not ( = ?auto_112559 ?auto_112561 ) ) ( ON ?auto_112558 ?auto_112559 ) ( ON-TABLE ?auto_112561 ) ( ON ?auto_112557 ?auto_112558 ) ( ON ?auto_112554 ?auto_112560 ) ( not ( = ?auto_112554 ?auto_112560 ) ) ( not ( = ?auto_112555 ?auto_112560 ) ) ( not ( = ?auto_112556 ?auto_112560 ) ) ( not ( = ?auto_112557 ?auto_112560 ) ) ( not ( = ?auto_112558 ?auto_112560 ) ) ( not ( = ?auto_112559 ?auto_112560 ) ) ( not ( = ?auto_112561 ?auto_112560 ) ) ( ON ?auto_112555 ?auto_112554 ) ( ON-TABLE ?auto_112560 ) ( CLEAR ?auto_112557 ) ( ON ?auto_112556 ?auto_112555 ) ( CLEAR ?auto_112556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112560 ?auto_112554 ?auto_112555 )
      ( MAKE-6PILE ?auto_112554 ?auto_112555 ?auto_112556 ?auto_112557 ?auto_112558 ?auto_112559 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112562 - BLOCK
      ?auto_112563 - BLOCK
      ?auto_112564 - BLOCK
      ?auto_112565 - BLOCK
      ?auto_112566 - BLOCK
      ?auto_112567 - BLOCK
    )
    :vars
    (
      ?auto_112568 - BLOCK
      ?auto_112569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112562 ?auto_112563 ) ) ( not ( = ?auto_112562 ?auto_112564 ) ) ( not ( = ?auto_112562 ?auto_112565 ) ) ( not ( = ?auto_112562 ?auto_112566 ) ) ( not ( = ?auto_112562 ?auto_112567 ) ) ( not ( = ?auto_112563 ?auto_112564 ) ) ( not ( = ?auto_112563 ?auto_112565 ) ) ( not ( = ?auto_112563 ?auto_112566 ) ) ( not ( = ?auto_112563 ?auto_112567 ) ) ( not ( = ?auto_112564 ?auto_112565 ) ) ( not ( = ?auto_112564 ?auto_112566 ) ) ( not ( = ?auto_112564 ?auto_112567 ) ) ( not ( = ?auto_112565 ?auto_112566 ) ) ( not ( = ?auto_112565 ?auto_112567 ) ) ( not ( = ?auto_112566 ?auto_112567 ) ) ( ON ?auto_112567 ?auto_112568 ) ( not ( = ?auto_112562 ?auto_112568 ) ) ( not ( = ?auto_112563 ?auto_112568 ) ) ( not ( = ?auto_112564 ?auto_112568 ) ) ( not ( = ?auto_112565 ?auto_112568 ) ) ( not ( = ?auto_112566 ?auto_112568 ) ) ( not ( = ?auto_112567 ?auto_112568 ) ) ( ON ?auto_112566 ?auto_112567 ) ( ON-TABLE ?auto_112568 ) ( ON ?auto_112562 ?auto_112569 ) ( not ( = ?auto_112562 ?auto_112569 ) ) ( not ( = ?auto_112563 ?auto_112569 ) ) ( not ( = ?auto_112564 ?auto_112569 ) ) ( not ( = ?auto_112565 ?auto_112569 ) ) ( not ( = ?auto_112566 ?auto_112569 ) ) ( not ( = ?auto_112567 ?auto_112569 ) ) ( not ( = ?auto_112568 ?auto_112569 ) ) ( ON ?auto_112563 ?auto_112562 ) ( ON-TABLE ?auto_112569 ) ( ON ?auto_112564 ?auto_112563 ) ( CLEAR ?auto_112564 ) ( HOLDING ?auto_112565 ) ( CLEAR ?auto_112566 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112568 ?auto_112567 ?auto_112566 ?auto_112565 )
      ( MAKE-6PILE ?auto_112562 ?auto_112563 ?auto_112564 ?auto_112565 ?auto_112566 ?auto_112567 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112570 - BLOCK
      ?auto_112571 - BLOCK
      ?auto_112572 - BLOCK
      ?auto_112573 - BLOCK
      ?auto_112574 - BLOCK
      ?auto_112575 - BLOCK
    )
    :vars
    (
      ?auto_112577 - BLOCK
      ?auto_112576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112570 ?auto_112571 ) ) ( not ( = ?auto_112570 ?auto_112572 ) ) ( not ( = ?auto_112570 ?auto_112573 ) ) ( not ( = ?auto_112570 ?auto_112574 ) ) ( not ( = ?auto_112570 ?auto_112575 ) ) ( not ( = ?auto_112571 ?auto_112572 ) ) ( not ( = ?auto_112571 ?auto_112573 ) ) ( not ( = ?auto_112571 ?auto_112574 ) ) ( not ( = ?auto_112571 ?auto_112575 ) ) ( not ( = ?auto_112572 ?auto_112573 ) ) ( not ( = ?auto_112572 ?auto_112574 ) ) ( not ( = ?auto_112572 ?auto_112575 ) ) ( not ( = ?auto_112573 ?auto_112574 ) ) ( not ( = ?auto_112573 ?auto_112575 ) ) ( not ( = ?auto_112574 ?auto_112575 ) ) ( ON ?auto_112575 ?auto_112577 ) ( not ( = ?auto_112570 ?auto_112577 ) ) ( not ( = ?auto_112571 ?auto_112577 ) ) ( not ( = ?auto_112572 ?auto_112577 ) ) ( not ( = ?auto_112573 ?auto_112577 ) ) ( not ( = ?auto_112574 ?auto_112577 ) ) ( not ( = ?auto_112575 ?auto_112577 ) ) ( ON ?auto_112574 ?auto_112575 ) ( ON-TABLE ?auto_112577 ) ( ON ?auto_112570 ?auto_112576 ) ( not ( = ?auto_112570 ?auto_112576 ) ) ( not ( = ?auto_112571 ?auto_112576 ) ) ( not ( = ?auto_112572 ?auto_112576 ) ) ( not ( = ?auto_112573 ?auto_112576 ) ) ( not ( = ?auto_112574 ?auto_112576 ) ) ( not ( = ?auto_112575 ?auto_112576 ) ) ( not ( = ?auto_112577 ?auto_112576 ) ) ( ON ?auto_112571 ?auto_112570 ) ( ON-TABLE ?auto_112576 ) ( ON ?auto_112572 ?auto_112571 ) ( CLEAR ?auto_112574 ) ( ON ?auto_112573 ?auto_112572 ) ( CLEAR ?auto_112573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112576 ?auto_112570 ?auto_112571 ?auto_112572 )
      ( MAKE-6PILE ?auto_112570 ?auto_112571 ?auto_112572 ?auto_112573 ?auto_112574 ?auto_112575 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112578 - BLOCK
      ?auto_112579 - BLOCK
      ?auto_112580 - BLOCK
      ?auto_112581 - BLOCK
      ?auto_112582 - BLOCK
      ?auto_112583 - BLOCK
    )
    :vars
    (
      ?auto_112585 - BLOCK
      ?auto_112584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112578 ?auto_112579 ) ) ( not ( = ?auto_112578 ?auto_112580 ) ) ( not ( = ?auto_112578 ?auto_112581 ) ) ( not ( = ?auto_112578 ?auto_112582 ) ) ( not ( = ?auto_112578 ?auto_112583 ) ) ( not ( = ?auto_112579 ?auto_112580 ) ) ( not ( = ?auto_112579 ?auto_112581 ) ) ( not ( = ?auto_112579 ?auto_112582 ) ) ( not ( = ?auto_112579 ?auto_112583 ) ) ( not ( = ?auto_112580 ?auto_112581 ) ) ( not ( = ?auto_112580 ?auto_112582 ) ) ( not ( = ?auto_112580 ?auto_112583 ) ) ( not ( = ?auto_112581 ?auto_112582 ) ) ( not ( = ?auto_112581 ?auto_112583 ) ) ( not ( = ?auto_112582 ?auto_112583 ) ) ( ON ?auto_112583 ?auto_112585 ) ( not ( = ?auto_112578 ?auto_112585 ) ) ( not ( = ?auto_112579 ?auto_112585 ) ) ( not ( = ?auto_112580 ?auto_112585 ) ) ( not ( = ?auto_112581 ?auto_112585 ) ) ( not ( = ?auto_112582 ?auto_112585 ) ) ( not ( = ?auto_112583 ?auto_112585 ) ) ( ON-TABLE ?auto_112585 ) ( ON ?auto_112578 ?auto_112584 ) ( not ( = ?auto_112578 ?auto_112584 ) ) ( not ( = ?auto_112579 ?auto_112584 ) ) ( not ( = ?auto_112580 ?auto_112584 ) ) ( not ( = ?auto_112581 ?auto_112584 ) ) ( not ( = ?auto_112582 ?auto_112584 ) ) ( not ( = ?auto_112583 ?auto_112584 ) ) ( not ( = ?auto_112585 ?auto_112584 ) ) ( ON ?auto_112579 ?auto_112578 ) ( ON-TABLE ?auto_112584 ) ( ON ?auto_112580 ?auto_112579 ) ( ON ?auto_112581 ?auto_112580 ) ( CLEAR ?auto_112581 ) ( HOLDING ?auto_112582 ) ( CLEAR ?auto_112583 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112585 ?auto_112583 ?auto_112582 )
      ( MAKE-6PILE ?auto_112578 ?auto_112579 ?auto_112580 ?auto_112581 ?auto_112582 ?auto_112583 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112586 - BLOCK
      ?auto_112587 - BLOCK
      ?auto_112588 - BLOCK
      ?auto_112589 - BLOCK
      ?auto_112590 - BLOCK
      ?auto_112591 - BLOCK
    )
    :vars
    (
      ?auto_112592 - BLOCK
      ?auto_112593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112586 ?auto_112587 ) ) ( not ( = ?auto_112586 ?auto_112588 ) ) ( not ( = ?auto_112586 ?auto_112589 ) ) ( not ( = ?auto_112586 ?auto_112590 ) ) ( not ( = ?auto_112586 ?auto_112591 ) ) ( not ( = ?auto_112587 ?auto_112588 ) ) ( not ( = ?auto_112587 ?auto_112589 ) ) ( not ( = ?auto_112587 ?auto_112590 ) ) ( not ( = ?auto_112587 ?auto_112591 ) ) ( not ( = ?auto_112588 ?auto_112589 ) ) ( not ( = ?auto_112588 ?auto_112590 ) ) ( not ( = ?auto_112588 ?auto_112591 ) ) ( not ( = ?auto_112589 ?auto_112590 ) ) ( not ( = ?auto_112589 ?auto_112591 ) ) ( not ( = ?auto_112590 ?auto_112591 ) ) ( ON ?auto_112591 ?auto_112592 ) ( not ( = ?auto_112586 ?auto_112592 ) ) ( not ( = ?auto_112587 ?auto_112592 ) ) ( not ( = ?auto_112588 ?auto_112592 ) ) ( not ( = ?auto_112589 ?auto_112592 ) ) ( not ( = ?auto_112590 ?auto_112592 ) ) ( not ( = ?auto_112591 ?auto_112592 ) ) ( ON-TABLE ?auto_112592 ) ( ON ?auto_112586 ?auto_112593 ) ( not ( = ?auto_112586 ?auto_112593 ) ) ( not ( = ?auto_112587 ?auto_112593 ) ) ( not ( = ?auto_112588 ?auto_112593 ) ) ( not ( = ?auto_112589 ?auto_112593 ) ) ( not ( = ?auto_112590 ?auto_112593 ) ) ( not ( = ?auto_112591 ?auto_112593 ) ) ( not ( = ?auto_112592 ?auto_112593 ) ) ( ON ?auto_112587 ?auto_112586 ) ( ON-TABLE ?auto_112593 ) ( ON ?auto_112588 ?auto_112587 ) ( ON ?auto_112589 ?auto_112588 ) ( CLEAR ?auto_112591 ) ( ON ?auto_112590 ?auto_112589 ) ( CLEAR ?auto_112590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112593 ?auto_112586 ?auto_112587 ?auto_112588 ?auto_112589 )
      ( MAKE-6PILE ?auto_112586 ?auto_112587 ?auto_112588 ?auto_112589 ?auto_112590 ?auto_112591 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112594 - BLOCK
      ?auto_112595 - BLOCK
      ?auto_112596 - BLOCK
      ?auto_112597 - BLOCK
      ?auto_112598 - BLOCK
      ?auto_112599 - BLOCK
    )
    :vars
    (
      ?auto_112600 - BLOCK
      ?auto_112601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112594 ?auto_112595 ) ) ( not ( = ?auto_112594 ?auto_112596 ) ) ( not ( = ?auto_112594 ?auto_112597 ) ) ( not ( = ?auto_112594 ?auto_112598 ) ) ( not ( = ?auto_112594 ?auto_112599 ) ) ( not ( = ?auto_112595 ?auto_112596 ) ) ( not ( = ?auto_112595 ?auto_112597 ) ) ( not ( = ?auto_112595 ?auto_112598 ) ) ( not ( = ?auto_112595 ?auto_112599 ) ) ( not ( = ?auto_112596 ?auto_112597 ) ) ( not ( = ?auto_112596 ?auto_112598 ) ) ( not ( = ?auto_112596 ?auto_112599 ) ) ( not ( = ?auto_112597 ?auto_112598 ) ) ( not ( = ?auto_112597 ?auto_112599 ) ) ( not ( = ?auto_112598 ?auto_112599 ) ) ( not ( = ?auto_112594 ?auto_112600 ) ) ( not ( = ?auto_112595 ?auto_112600 ) ) ( not ( = ?auto_112596 ?auto_112600 ) ) ( not ( = ?auto_112597 ?auto_112600 ) ) ( not ( = ?auto_112598 ?auto_112600 ) ) ( not ( = ?auto_112599 ?auto_112600 ) ) ( ON-TABLE ?auto_112600 ) ( ON ?auto_112594 ?auto_112601 ) ( not ( = ?auto_112594 ?auto_112601 ) ) ( not ( = ?auto_112595 ?auto_112601 ) ) ( not ( = ?auto_112596 ?auto_112601 ) ) ( not ( = ?auto_112597 ?auto_112601 ) ) ( not ( = ?auto_112598 ?auto_112601 ) ) ( not ( = ?auto_112599 ?auto_112601 ) ) ( not ( = ?auto_112600 ?auto_112601 ) ) ( ON ?auto_112595 ?auto_112594 ) ( ON-TABLE ?auto_112601 ) ( ON ?auto_112596 ?auto_112595 ) ( ON ?auto_112597 ?auto_112596 ) ( ON ?auto_112598 ?auto_112597 ) ( CLEAR ?auto_112598 ) ( HOLDING ?auto_112599 ) ( CLEAR ?auto_112600 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112600 ?auto_112599 )
      ( MAKE-6PILE ?auto_112594 ?auto_112595 ?auto_112596 ?auto_112597 ?auto_112598 ?auto_112599 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112602 - BLOCK
      ?auto_112603 - BLOCK
      ?auto_112604 - BLOCK
      ?auto_112605 - BLOCK
      ?auto_112606 - BLOCK
      ?auto_112607 - BLOCK
    )
    :vars
    (
      ?auto_112608 - BLOCK
      ?auto_112609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112602 ?auto_112603 ) ) ( not ( = ?auto_112602 ?auto_112604 ) ) ( not ( = ?auto_112602 ?auto_112605 ) ) ( not ( = ?auto_112602 ?auto_112606 ) ) ( not ( = ?auto_112602 ?auto_112607 ) ) ( not ( = ?auto_112603 ?auto_112604 ) ) ( not ( = ?auto_112603 ?auto_112605 ) ) ( not ( = ?auto_112603 ?auto_112606 ) ) ( not ( = ?auto_112603 ?auto_112607 ) ) ( not ( = ?auto_112604 ?auto_112605 ) ) ( not ( = ?auto_112604 ?auto_112606 ) ) ( not ( = ?auto_112604 ?auto_112607 ) ) ( not ( = ?auto_112605 ?auto_112606 ) ) ( not ( = ?auto_112605 ?auto_112607 ) ) ( not ( = ?auto_112606 ?auto_112607 ) ) ( not ( = ?auto_112602 ?auto_112608 ) ) ( not ( = ?auto_112603 ?auto_112608 ) ) ( not ( = ?auto_112604 ?auto_112608 ) ) ( not ( = ?auto_112605 ?auto_112608 ) ) ( not ( = ?auto_112606 ?auto_112608 ) ) ( not ( = ?auto_112607 ?auto_112608 ) ) ( ON-TABLE ?auto_112608 ) ( ON ?auto_112602 ?auto_112609 ) ( not ( = ?auto_112602 ?auto_112609 ) ) ( not ( = ?auto_112603 ?auto_112609 ) ) ( not ( = ?auto_112604 ?auto_112609 ) ) ( not ( = ?auto_112605 ?auto_112609 ) ) ( not ( = ?auto_112606 ?auto_112609 ) ) ( not ( = ?auto_112607 ?auto_112609 ) ) ( not ( = ?auto_112608 ?auto_112609 ) ) ( ON ?auto_112603 ?auto_112602 ) ( ON-TABLE ?auto_112609 ) ( ON ?auto_112604 ?auto_112603 ) ( ON ?auto_112605 ?auto_112604 ) ( ON ?auto_112606 ?auto_112605 ) ( CLEAR ?auto_112608 ) ( ON ?auto_112607 ?auto_112606 ) ( CLEAR ?auto_112607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112609 ?auto_112602 ?auto_112603 ?auto_112604 ?auto_112605 ?auto_112606 )
      ( MAKE-6PILE ?auto_112602 ?auto_112603 ?auto_112604 ?auto_112605 ?auto_112606 ?auto_112607 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112610 - BLOCK
      ?auto_112611 - BLOCK
      ?auto_112612 - BLOCK
      ?auto_112613 - BLOCK
      ?auto_112614 - BLOCK
      ?auto_112615 - BLOCK
    )
    :vars
    (
      ?auto_112616 - BLOCK
      ?auto_112617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112610 ?auto_112611 ) ) ( not ( = ?auto_112610 ?auto_112612 ) ) ( not ( = ?auto_112610 ?auto_112613 ) ) ( not ( = ?auto_112610 ?auto_112614 ) ) ( not ( = ?auto_112610 ?auto_112615 ) ) ( not ( = ?auto_112611 ?auto_112612 ) ) ( not ( = ?auto_112611 ?auto_112613 ) ) ( not ( = ?auto_112611 ?auto_112614 ) ) ( not ( = ?auto_112611 ?auto_112615 ) ) ( not ( = ?auto_112612 ?auto_112613 ) ) ( not ( = ?auto_112612 ?auto_112614 ) ) ( not ( = ?auto_112612 ?auto_112615 ) ) ( not ( = ?auto_112613 ?auto_112614 ) ) ( not ( = ?auto_112613 ?auto_112615 ) ) ( not ( = ?auto_112614 ?auto_112615 ) ) ( not ( = ?auto_112610 ?auto_112616 ) ) ( not ( = ?auto_112611 ?auto_112616 ) ) ( not ( = ?auto_112612 ?auto_112616 ) ) ( not ( = ?auto_112613 ?auto_112616 ) ) ( not ( = ?auto_112614 ?auto_112616 ) ) ( not ( = ?auto_112615 ?auto_112616 ) ) ( ON ?auto_112610 ?auto_112617 ) ( not ( = ?auto_112610 ?auto_112617 ) ) ( not ( = ?auto_112611 ?auto_112617 ) ) ( not ( = ?auto_112612 ?auto_112617 ) ) ( not ( = ?auto_112613 ?auto_112617 ) ) ( not ( = ?auto_112614 ?auto_112617 ) ) ( not ( = ?auto_112615 ?auto_112617 ) ) ( not ( = ?auto_112616 ?auto_112617 ) ) ( ON ?auto_112611 ?auto_112610 ) ( ON-TABLE ?auto_112617 ) ( ON ?auto_112612 ?auto_112611 ) ( ON ?auto_112613 ?auto_112612 ) ( ON ?auto_112614 ?auto_112613 ) ( ON ?auto_112615 ?auto_112614 ) ( CLEAR ?auto_112615 ) ( HOLDING ?auto_112616 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112616 )
      ( MAKE-6PILE ?auto_112610 ?auto_112611 ?auto_112612 ?auto_112613 ?auto_112614 ?auto_112615 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112618 - BLOCK
      ?auto_112619 - BLOCK
      ?auto_112620 - BLOCK
      ?auto_112621 - BLOCK
      ?auto_112622 - BLOCK
      ?auto_112623 - BLOCK
    )
    :vars
    (
      ?auto_112624 - BLOCK
      ?auto_112625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112618 ?auto_112619 ) ) ( not ( = ?auto_112618 ?auto_112620 ) ) ( not ( = ?auto_112618 ?auto_112621 ) ) ( not ( = ?auto_112618 ?auto_112622 ) ) ( not ( = ?auto_112618 ?auto_112623 ) ) ( not ( = ?auto_112619 ?auto_112620 ) ) ( not ( = ?auto_112619 ?auto_112621 ) ) ( not ( = ?auto_112619 ?auto_112622 ) ) ( not ( = ?auto_112619 ?auto_112623 ) ) ( not ( = ?auto_112620 ?auto_112621 ) ) ( not ( = ?auto_112620 ?auto_112622 ) ) ( not ( = ?auto_112620 ?auto_112623 ) ) ( not ( = ?auto_112621 ?auto_112622 ) ) ( not ( = ?auto_112621 ?auto_112623 ) ) ( not ( = ?auto_112622 ?auto_112623 ) ) ( not ( = ?auto_112618 ?auto_112624 ) ) ( not ( = ?auto_112619 ?auto_112624 ) ) ( not ( = ?auto_112620 ?auto_112624 ) ) ( not ( = ?auto_112621 ?auto_112624 ) ) ( not ( = ?auto_112622 ?auto_112624 ) ) ( not ( = ?auto_112623 ?auto_112624 ) ) ( ON ?auto_112618 ?auto_112625 ) ( not ( = ?auto_112618 ?auto_112625 ) ) ( not ( = ?auto_112619 ?auto_112625 ) ) ( not ( = ?auto_112620 ?auto_112625 ) ) ( not ( = ?auto_112621 ?auto_112625 ) ) ( not ( = ?auto_112622 ?auto_112625 ) ) ( not ( = ?auto_112623 ?auto_112625 ) ) ( not ( = ?auto_112624 ?auto_112625 ) ) ( ON ?auto_112619 ?auto_112618 ) ( ON-TABLE ?auto_112625 ) ( ON ?auto_112620 ?auto_112619 ) ( ON ?auto_112621 ?auto_112620 ) ( ON ?auto_112622 ?auto_112621 ) ( ON ?auto_112623 ?auto_112622 ) ( ON ?auto_112624 ?auto_112623 ) ( CLEAR ?auto_112624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112625 ?auto_112618 ?auto_112619 ?auto_112620 ?auto_112621 ?auto_112622 ?auto_112623 )
      ( MAKE-6PILE ?auto_112618 ?auto_112619 ?auto_112620 ?auto_112621 ?auto_112622 ?auto_112623 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112633 - BLOCK
      ?auto_112634 - BLOCK
      ?auto_112635 - BLOCK
      ?auto_112636 - BLOCK
      ?auto_112637 - BLOCK
      ?auto_112638 - BLOCK
      ?auto_112639 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_112639 ) ( CLEAR ?auto_112638 ) ( ON-TABLE ?auto_112633 ) ( ON ?auto_112634 ?auto_112633 ) ( ON ?auto_112635 ?auto_112634 ) ( ON ?auto_112636 ?auto_112635 ) ( ON ?auto_112637 ?auto_112636 ) ( ON ?auto_112638 ?auto_112637 ) ( not ( = ?auto_112633 ?auto_112634 ) ) ( not ( = ?auto_112633 ?auto_112635 ) ) ( not ( = ?auto_112633 ?auto_112636 ) ) ( not ( = ?auto_112633 ?auto_112637 ) ) ( not ( = ?auto_112633 ?auto_112638 ) ) ( not ( = ?auto_112633 ?auto_112639 ) ) ( not ( = ?auto_112634 ?auto_112635 ) ) ( not ( = ?auto_112634 ?auto_112636 ) ) ( not ( = ?auto_112634 ?auto_112637 ) ) ( not ( = ?auto_112634 ?auto_112638 ) ) ( not ( = ?auto_112634 ?auto_112639 ) ) ( not ( = ?auto_112635 ?auto_112636 ) ) ( not ( = ?auto_112635 ?auto_112637 ) ) ( not ( = ?auto_112635 ?auto_112638 ) ) ( not ( = ?auto_112635 ?auto_112639 ) ) ( not ( = ?auto_112636 ?auto_112637 ) ) ( not ( = ?auto_112636 ?auto_112638 ) ) ( not ( = ?auto_112636 ?auto_112639 ) ) ( not ( = ?auto_112637 ?auto_112638 ) ) ( not ( = ?auto_112637 ?auto_112639 ) ) ( not ( = ?auto_112638 ?auto_112639 ) ) )
    :subtasks
    ( ( !STACK ?auto_112639 ?auto_112638 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112640 - BLOCK
      ?auto_112641 - BLOCK
      ?auto_112642 - BLOCK
      ?auto_112643 - BLOCK
      ?auto_112644 - BLOCK
      ?auto_112645 - BLOCK
      ?auto_112646 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_112645 ) ( ON-TABLE ?auto_112640 ) ( ON ?auto_112641 ?auto_112640 ) ( ON ?auto_112642 ?auto_112641 ) ( ON ?auto_112643 ?auto_112642 ) ( ON ?auto_112644 ?auto_112643 ) ( ON ?auto_112645 ?auto_112644 ) ( not ( = ?auto_112640 ?auto_112641 ) ) ( not ( = ?auto_112640 ?auto_112642 ) ) ( not ( = ?auto_112640 ?auto_112643 ) ) ( not ( = ?auto_112640 ?auto_112644 ) ) ( not ( = ?auto_112640 ?auto_112645 ) ) ( not ( = ?auto_112640 ?auto_112646 ) ) ( not ( = ?auto_112641 ?auto_112642 ) ) ( not ( = ?auto_112641 ?auto_112643 ) ) ( not ( = ?auto_112641 ?auto_112644 ) ) ( not ( = ?auto_112641 ?auto_112645 ) ) ( not ( = ?auto_112641 ?auto_112646 ) ) ( not ( = ?auto_112642 ?auto_112643 ) ) ( not ( = ?auto_112642 ?auto_112644 ) ) ( not ( = ?auto_112642 ?auto_112645 ) ) ( not ( = ?auto_112642 ?auto_112646 ) ) ( not ( = ?auto_112643 ?auto_112644 ) ) ( not ( = ?auto_112643 ?auto_112645 ) ) ( not ( = ?auto_112643 ?auto_112646 ) ) ( not ( = ?auto_112644 ?auto_112645 ) ) ( not ( = ?auto_112644 ?auto_112646 ) ) ( not ( = ?auto_112645 ?auto_112646 ) ) ( ON-TABLE ?auto_112646 ) ( CLEAR ?auto_112646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_112646 )
      ( MAKE-7PILE ?auto_112640 ?auto_112641 ?auto_112642 ?auto_112643 ?auto_112644 ?auto_112645 ?auto_112646 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112647 - BLOCK
      ?auto_112648 - BLOCK
      ?auto_112649 - BLOCK
      ?auto_112650 - BLOCK
      ?auto_112651 - BLOCK
      ?auto_112652 - BLOCK
      ?auto_112653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112647 ) ( ON ?auto_112648 ?auto_112647 ) ( ON ?auto_112649 ?auto_112648 ) ( ON ?auto_112650 ?auto_112649 ) ( ON ?auto_112651 ?auto_112650 ) ( not ( = ?auto_112647 ?auto_112648 ) ) ( not ( = ?auto_112647 ?auto_112649 ) ) ( not ( = ?auto_112647 ?auto_112650 ) ) ( not ( = ?auto_112647 ?auto_112651 ) ) ( not ( = ?auto_112647 ?auto_112652 ) ) ( not ( = ?auto_112647 ?auto_112653 ) ) ( not ( = ?auto_112648 ?auto_112649 ) ) ( not ( = ?auto_112648 ?auto_112650 ) ) ( not ( = ?auto_112648 ?auto_112651 ) ) ( not ( = ?auto_112648 ?auto_112652 ) ) ( not ( = ?auto_112648 ?auto_112653 ) ) ( not ( = ?auto_112649 ?auto_112650 ) ) ( not ( = ?auto_112649 ?auto_112651 ) ) ( not ( = ?auto_112649 ?auto_112652 ) ) ( not ( = ?auto_112649 ?auto_112653 ) ) ( not ( = ?auto_112650 ?auto_112651 ) ) ( not ( = ?auto_112650 ?auto_112652 ) ) ( not ( = ?auto_112650 ?auto_112653 ) ) ( not ( = ?auto_112651 ?auto_112652 ) ) ( not ( = ?auto_112651 ?auto_112653 ) ) ( not ( = ?auto_112652 ?auto_112653 ) ) ( ON-TABLE ?auto_112653 ) ( CLEAR ?auto_112653 ) ( HOLDING ?auto_112652 ) ( CLEAR ?auto_112651 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112647 ?auto_112648 ?auto_112649 ?auto_112650 ?auto_112651 ?auto_112652 )
      ( MAKE-7PILE ?auto_112647 ?auto_112648 ?auto_112649 ?auto_112650 ?auto_112651 ?auto_112652 ?auto_112653 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112654 - BLOCK
      ?auto_112655 - BLOCK
      ?auto_112656 - BLOCK
      ?auto_112657 - BLOCK
      ?auto_112658 - BLOCK
      ?auto_112659 - BLOCK
      ?auto_112660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112654 ) ( ON ?auto_112655 ?auto_112654 ) ( ON ?auto_112656 ?auto_112655 ) ( ON ?auto_112657 ?auto_112656 ) ( ON ?auto_112658 ?auto_112657 ) ( not ( = ?auto_112654 ?auto_112655 ) ) ( not ( = ?auto_112654 ?auto_112656 ) ) ( not ( = ?auto_112654 ?auto_112657 ) ) ( not ( = ?auto_112654 ?auto_112658 ) ) ( not ( = ?auto_112654 ?auto_112659 ) ) ( not ( = ?auto_112654 ?auto_112660 ) ) ( not ( = ?auto_112655 ?auto_112656 ) ) ( not ( = ?auto_112655 ?auto_112657 ) ) ( not ( = ?auto_112655 ?auto_112658 ) ) ( not ( = ?auto_112655 ?auto_112659 ) ) ( not ( = ?auto_112655 ?auto_112660 ) ) ( not ( = ?auto_112656 ?auto_112657 ) ) ( not ( = ?auto_112656 ?auto_112658 ) ) ( not ( = ?auto_112656 ?auto_112659 ) ) ( not ( = ?auto_112656 ?auto_112660 ) ) ( not ( = ?auto_112657 ?auto_112658 ) ) ( not ( = ?auto_112657 ?auto_112659 ) ) ( not ( = ?auto_112657 ?auto_112660 ) ) ( not ( = ?auto_112658 ?auto_112659 ) ) ( not ( = ?auto_112658 ?auto_112660 ) ) ( not ( = ?auto_112659 ?auto_112660 ) ) ( ON-TABLE ?auto_112660 ) ( CLEAR ?auto_112658 ) ( ON ?auto_112659 ?auto_112660 ) ( CLEAR ?auto_112659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112660 )
      ( MAKE-7PILE ?auto_112654 ?auto_112655 ?auto_112656 ?auto_112657 ?auto_112658 ?auto_112659 ?auto_112660 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112661 - BLOCK
      ?auto_112662 - BLOCK
      ?auto_112663 - BLOCK
      ?auto_112664 - BLOCK
      ?auto_112665 - BLOCK
      ?auto_112666 - BLOCK
      ?auto_112667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112661 ) ( ON ?auto_112662 ?auto_112661 ) ( ON ?auto_112663 ?auto_112662 ) ( ON ?auto_112664 ?auto_112663 ) ( not ( = ?auto_112661 ?auto_112662 ) ) ( not ( = ?auto_112661 ?auto_112663 ) ) ( not ( = ?auto_112661 ?auto_112664 ) ) ( not ( = ?auto_112661 ?auto_112665 ) ) ( not ( = ?auto_112661 ?auto_112666 ) ) ( not ( = ?auto_112661 ?auto_112667 ) ) ( not ( = ?auto_112662 ?auto_112663 ) ) ( not ( = ?auto_112662 ?auto_112664 ) ) ( not ( = ?auto_112662 ?auto_112665 ) ) ( not ( = ?auto_112662 ?auto_112666 ) ) ( not ( = ?auto_112662 ?auto_112667 ) ) ( not ( = ?auto_112663 ?auto_112664 ) ) ( not ( = ?auto_112663 ?auto_112665 ) ) ( not ( = ?auto_112663 ?auto_112666 ) ) ( not ( = ?auto_112663 ?auto_112667 ) ) ( not ( = ?auto_112664 ?auto_112665 ) ) ( not ( = ?auto_112664 ?auto_112666 ) ) ( not ( = ?auto_112664 ?auto_112667 ) ) ( not ( = ?auto_112665 ?auto_112666 ) ) ( not ( = ?auto_112665 ?auto_112667 ) ) ( not ( = ?auto_112666 ?auto_112667 ) ) ( ON-TABLE ?auto_112667 ) ( ON ?auto_112666 ?auto_112667 ) ( CLEAR ?auto_112666 ) ( HOLDING ?auto_112665 ) ( CLEAR ?auto_112664 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112661 ?auto_112662 ?auto_112663 ?auto_112664 ?auto_112665 )
      ( MAKE-7PILE ?auto_112661 ?auto_112662 ?auto_112663 ?auto_112664 ?auto_112665 ?auto_112666 ?auto_112667 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112668 - BLOCK
      ?auto_112669 - BLOCK
      ?auto_112670 - BLOCK
      ?auto_112671 - BLOCK
      ?auto_112672 - BLOCK
      ?auto_112673 - BLOCK
      ?auto_112674 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112668 ) ( ON ?auto_112669 ?auto_112668 ) ( ON ?auto_112670 ?auto_112669 ) ( ON ?auto_112671 ?auto_112670 ) ( not ( = ?auto_112668 ?auto_112669 ) ) ( not ( = ?auto_112668 ?auto_112670 ) ) ( not ( = ?auto_112668 ?auto_112671 ) ) ( not ( = ?auto_112668 ?auto_112672 ) ) ( not ( = ?auto_112668 ?auto_112673 ) ) ( not ( = ?auto_112668 ?auto_112674 ) ) ( not ( = ?auto_112669 ?auto_112670 ) ) ( not ( = ?auto_112669 ?auto_112671 ) ) ( not ( = ?auto_112669 ?auto_112672 ) ) ( not ( = ?auto_112669 ?auto_112673 ) ) ( not ( = ?auto_112669 ?auto_112674 ) ) ( not ( = ?auto_112670 ?auto_112671 ) ) ( not ( = ?auto_112670 ?auto_112672 ) ) ( not ( = ?auto_112670 ?auto_112673 ) ) ( not ( = ?auto_112670 ?auto_112674 ) ) ( not ( = ?auto_112671 ?auto_112672 ) ) ( not ( = ?auto_112671 ?auto_112673 ) ) ( not ( = ?auto_112671 ?auto_112674 ) ) ( not ( = ?auto_112672 ?auto_112673 ) ) ( not ( = ?auto_112672 ?auto_112674 ) ) ( not ( = ?auto_112673 ?auto_112674 ) ) ( ON-TABLE ?auto_112674 ) ( ON ?auto_112673 ?auto_112674 ) ( CLEAR ?auto_112671 ) ( ON ?auto_112672 ?auto_112673 ) ( CLEAR ?auto_112672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112674 ?auto_112673 )
      ( MAKE-7PILE ?auto_112668 ?auto_112669 ?auto_112670 ?auto_112671 ?auto_112672 ?auto_112673 ?auto_112674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112675 - BLOCK
      ?auto_112676 - BLOCK
      ?auto_112677 - BLOCK
      ?auto_112678 - BLOCK
      ?auto_112679 - BLOCK
      ?auto_112680 - BLOCK
      ?auto_112681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112675 ) ( ON ?auto_112676 ?auto_112675 ) ( ON ?auto_112677 ?auto_112676 ) ( not ( = ?auto_112675 ?auto_112676 ) ) ( not ( = ?auto_112675 ?auto_112677 ) ) ( not ( = ?auto_112675 ?auto_112678 ) ) ( not ( = ?auto_112675 ?auto_112679 ) ) ( not ( = ?auto_112675 ?auto_112680 ) ) ( not ( = ?auto_112675 ?auto_112681 ) ) ( not ( = ?auto_112676 ?auto_112677 ) ) ( not ( = ?auto_112676 ?auto_112678 ) ) ( not ( = ?auto_112676 ?auto_112679 ) ) ( not ( = ?auto_112676 ?auto_112680 ) ) ( not ( = ?auto_112676 ?auto_112681 ) ) ( not ( = ?auto_112677 ?auto_112678 ) ) ( not ( = ?auto_112677 ?auto_112679 ) ) ( not ( = ?auto_112677 ?auto_112680 ) ) ( not ( = ?auto_112677 ?auto_112681 ) ) ( not ( = ?auto_112678 ?auto_112679 ) ) ( not ( = ?auto_112678 ?auto_112680 ) ) ( not ( = ?auto_112678 ?auto_112681 ) ) ( not ( = ?auto_112679 ?auto_112680 ) ) ( not ( = ?auto_112679 ?auto_112681 ) ) ( not ( = ?auto_112680 ?auto_112681 ) ) ( ON-TABLE ?auto_112681 ) ( ON ?auto_112680 ?auto_112681 ) ( ON ?auto_112679 ?auto_112680 ) ( CLEAR ?auto_112679 ) ( HOLDING ?auto_112678 ) ( CLEAR ?auto_112677 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112675 ?auto_112676 ?auto_112677 ?auto_112678 )
      ( MAKE-7PILE ?auto_112675 ?auto_112676 ?auto_112677 ?auto_112678 ?auto_112679 ?auto_112680 ?auto_112681 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112682 - BLOCK
      ?auto_112683 - BLOCK
      ?auto_112684 - BLOCK
      ?auto_112685 - BLOCK
      ?auto_112686 - BLOCK
      ?auto_112687 - BLOCK
      ?auto_112688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112682 ) ( ON ?auto_112683 ?auto_112682 ) ( ON ?auto_112684 ?auto_112683 ) ( not ( = ?auto_112682 ?auto_112683 ) ) ( not ( = ?auto_112682 ?auto_112684 ) ) ( not ( = ?auto_112682 ?auto_112685 ) ) ( not ( = ?auto_112682 ?auto_112686 ) ) ( not ( = ?auto_112682 ?auto_112687 ) ) ( not ( = ?auto_112682 ?auto_112688 ) ) ( not ( = ?auto_112683 ?auto_112684 ) ) ( not ( = ?auto_112683 ?auto_112685 ) ) ( not ( = ?auto_112683 ?auto_112686 ) ) ( not ( = ?auto_112683 ?auto_112687 ) ) ( not ( = ?auto_112683 ?auto_112688 ) ) ( not ( = ?auto_112684 ?auto_112685 ) ) ( not ( = ?auto_112684 ?auto_112686 ) ) ( not ( = ?auto_112684 ?auto_112687 ) ) ( not ( = ?auto_112684 ?auto_112688 ) ) ( not ( = ?auto_112685 ?auto_112686 ) ) ( not ( = ?auto_112685 ?auto_112687 ) ) ( not ( = ?auto_112685 ?auto_112688 ) ) ( not ( = ?auto_112686 ?auto_112687 ) ) ( not ( = ?auto_112686 ?auto_112688 ) ) ( not ( = ?auto_112687 ?auto_112688 ) ) ( ON-TABLE ?auto_112688 ) ( ON ?auto_112687 ?auto_112688 ) ( ON ?auto_112686 ?auto_112687 ) ( CLEAR ?auto_112684 ) ( ON ?auto_112685 ?auto_112686 ) ( CLEAR ?auto_112685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112688 ?auto_112687 ?auto_112686 )
      ( MAKE-7PILE ?auto_112682 ?auto_112683 ?auto_112684 ?auto_112685 ?auto_112686 ?auto_112687 ?auto_112688 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112689 - BLOCK
      ?auto_112690 - BLOCK
      ?auto_112691 - BLOCK
      ?auto_112692 - BLOCK
      ?auto_112693 - BLOCK
      ?auto_112694 - BLOCK
      ?auto_112695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112689 ) ( ON ?auto_112690 ?auto_112689 ) ( not ( = ?auto_112689 ?auto_112690 ) ) ( not ( = ?auto_112689 ?auto_112691 ) ) ( not ( = ?auto_112689 ?auto_112692 ) ) ( not ( = ?auto_112689 ?auto_112693 ) ) ( not ( = ?auto_112689 ?auto_112694 ) ) ( not ( = ?auto_112689 ?auto_112695 ) ) ( not ( = ?auto_112690 ?auto_112691 ) ) ( not ( = ?auto_112690 ?auto_112692 ) ) ( not ( = ?auto_112690 ?auto_112693 ) ) ( not ( = ?auto_112690 ?auto_112694 ) ) ( not ( = ?auto_112690 ?auto_112695 ) ) ( not ( = ?auto_112691 ?auto_112692 ) ) ( not ( = ?auto_112691 ?auto_112693 ) ) ( not ( = ?auto_112691 ?auto_112694 ) ) ( not ( = ?auto_112691 ?auto_112695 ) ) ( not ( = ?auto_112692 ?auto_112693 ) ) ( not ( = ?auto_112692 ?auto_112694 ) ) ( not ( = ?auto_112692 ?auto_112695 ) ) ( not ( = ?auto_112693 ?auto_112694 ) ) ( not ( = ?auto_112693 ?auto_112695 ) ) ( not ( = ?auto_112694 ?auto_112695 ) ) ( ON-TABLE ?auto_112695 ) ( ON ?auto_112694 ?auto_112695 ) ( ON ?auto_112693 ?auto_112694 ) ( ON ?auto_112692 ?auto_112693 ) ( CLEAR ?auto_112692 ) ( HOLDING ?auto_112691 ) ( CLEAR ?auto_112690 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112689 ?auto_112690 ?auto_112691 )
      ( MAKE-7PILE ?auto_112689 ?auto_112690 ?auto_112691 ?auto_112692 ?auto_112693 ?auto_112694 ?auto_112695 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112696 - BLOCK
      ?auto_112697 - BLOCK
      ?auto_112698 - BLOCK
      ?auto_112699 - BLOCK
      ?auto_112700 - BLOCK
      ?auto_112701 - BLOCK
      ?auto_112702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112696 ) ( ON ?auto_112697 ?auto_112696 ) ( not ( = ?auto_112696 ?auto_112697 ) ) ( not ( = ?auto_112696 ?auto_112698 ) ) ( not ( = ?auto_112696 ?auto_112699 ) ) ( not ( = ?auto_112696 ?auto_112700 ) ) ( not ( = ?auto_112696 ?auto_112701 ) ) ( not ( = ?auto_112696 ?auto_112702 ) ) ( not ( = ?auto_112697 ?auto_112698 ) ) ( not ( = ?auto_112697 ?auto_112699 ) ) ( not ( = ?auto_112697 ?auto_112700 ) ) ( not ( = ?auto_112697 ?auto_112701 ) ) ( not ( = ?auto_112697 ?auto_112702 ) ) ( not ( = ?auto_112698 ?auto_112699 ) ) ( not ( = ?auto_112698 ?auto_112700 ) ) ( not ( = ?auto_112698 ?auto_112701 ) ) ( not ( = ?auto_112698 ?auto_112702 ) ) ( not ( = ?auto_112699 ?auto_112700 ) ) ( not ( = ?auto_112699 ?auto_112701 ) ) ( not ( = ?auto_112699 ?auto_112702 ) ) ( not ( = ?auto_112700 ?auto_112701 ) ) ( not ( = ?auto_112700 ?auto_112702 ) ) ( not ( = ?auto_112701 ?auto_112702 ) ) ( ON-TABLE ?auto_112702 ) ( ON ?auto_112701 ?auto_112702 ) ( ON ?auto_112700 ?auto_112701 ) ( ON ?auto_112699 ?auto_112700 ) ( CLEAR ?auto_112697 ) ( ON ?auto_112698 ?auto_112699 ) ( CLEAR ?auto_112698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112702 ?auto_112701 ?auto_112700 ?auto_112699 )
      ( MAKE-7PILE ?auto_112696 ?auto_112697 ?auto_112698 ?auto_112699 ?auto_112700 ?auto_112701 ?auto_112702 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112703 - BLOCK
      ?auto_112704 - BLOCK
      ?auto_112705 - BLOCK
      ?auto_112706 - BLOCK
      ?auto_112707 - BLOCK
      ?auto_112708 - BLOCK
      ?auto_112709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112703 ) ( not ( = ?auto_112703 ?auto_112704 ) ) ( not ( = ?auto_112703 ?auto_112705 ) ) ( not ( = ?auto_112703 ?auto_112706 ) ) ( not ( = ?auto_112703 ?auto_112707 ) ) ( not ( = ?auto_112703 ?auto_112708 ) ) ( not ( = ?auto_112703 ?auto_112709 ) ) ( not ( = ?auto_112704 ?auto_112705 ) ) ( not ( = ?auto_112704 ?auto_112706 ) ) ( not ( = ?auto_112704 ?auto_112707 ) ) ( not ( = ?auto_112704 ?auto_112708 ) ) ( not ( = ?auto_112704 ?auto_112709 ) ) ( not ( = ?auto_112705 ?auto_112706 ) ) ( not ( = ?auto_112705 ?auto_112707 ) ) ( not ( = ?auto_112705 ?auto_112708 ) ) ( not ( = ?auto_112705 ?auto_112709 ) ) ( not ( = ?auto_112706 ?auto_112707 ) ) ( not ( = ?auto_112706 ?auto_112708 ) ) ( not ( = ?auto_112706 ?auto_112709 ) ) ( not ( = ?auto_112707 ?auto_112708 ) ) ( not ( = ?auto_112707 ?auto_112709 ) ) ( not ( = ?auto_112708 ?auto_112709 ) ) ( ON-TABLE ?auto_112709 ) ( ON ?auto_112708 ?auto_112709 ) ( ON ?auto_112707 ?auto_112708 ) ( ON ?auto_112706 ?auto_112707 ) ( ON ?auto_112705 ?auto_112706 ) ( CLEAR ?auto_112705 ) ( HOLDING ?auto_112704 ) ( CLEAR ?auto_112703 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112703 ?auto_112704 )
      ( MAKE-7PILE ?auto_112703 ?auto_112704 ?auto_112705 ?auto_112706 ?auto_112707 ?auto_112708 ?auto_112709 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112710 - BLOCK
      ?auto_112711 - BLOCK
      ?auto_112712 - BLOCK
      ?auto_112713 - BLOCK
      ?auto_112714 - BLOCK
      ?auto_112715 - BLOCK
      ?auto_112716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112710 ) ( not ( = ?auto_112710 ?auto_112711 ) ) ( not ( = ?auto_112710 ?auto_112712 ) ) ( not ( = ?auto_112710 ?auto_112713 ) ) ( not ( = ?auto_112710 ?auto_112714 ) ) ( not ( = ?auto_112710 ?auto_112715 ) ) ( not ( = ?auto_112710 ?auto_112716 ) ) ( not ( = ?auto_112711 ?auto_112712 ) ) ( not ( = ?auto_112711 ?auto_112713 ) ) ( not ( = ?auto_112711 ?auto_112714 ) ) ( not ( = ?auto_112711 ?auto_112715 ) ) ( not ( = ?auto_112711 ?auto_112716 ) ) ( not ( = ?auto_112712 ?auto_112713 ) ) ( not ( = ?auto_112712 ?auto_112714 ) ) ( not ( = ?auto_112712 ?auto_112715 ) ) ( not ( = ?auto_112712 ?auto_112716 ) ) ( not ( = ?auto_112713 ?auto_112714 ) ) ( not ( = ?auto_112713 ?auto_112715 ) ) ( not ( = ?auto_112713 ?auto_112716 ) ) ( not ( = ?auto_112714 ?auto_112715 ) ) ( not ( = ?auto_112714 ?auto_112716 ) ) ( not ( = ?auto_112715 ?auto_112716 ) ) ( ON-TABLE ?auto_112716 ) ( ON ?auto_112715 ?auto_112716 ) ( ON ?auto_112714 ?auto_112715 ) ( ON ?auto_112713 ?auto_112714 ) ( ON ?auto_112712 ?auto_112713 ) ( CLEAR ?auto_112710 ) ( ON ?auto_112711 ?auto_112712 ) ( CLEAR ?auto_112711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112716 ?auto_112715 ?auto_112714 ?auto_112713 ?auto_112712 )
      ( MAKE-7PILE ?auto_112710 ?auto_112711 ?auto_112712 ?auto_112713 ?auto_112714 ?auto_112715 ?auto_112716 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112717 - BLOCK
      ?auto_112718 - BLOCK
      ?auto_112719 - BLOCK
      ?auto_112720 - BLOCK
      ?auto_112721 - BLOCK
      ?auto_112722 - BLOCK
      ?auto_112723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112717 ?auto_112718 ) ) ( not ( = ?auto_112717 ?auto_112719 ) ) ( not ( = ?auto_112717 ?auto_112720 ) ) ( not ( = ?auto_112717 ?auto_112721 ) ) ( not ( = ?auto_112717 ?auto_112722 ) ) ( not ( = ?auto_112717 ?auto_112723 ) ) ( not ( = ?auto_112718 ?auto_112719 ) ) ( not ( = ?auto_112718 ?auto_112720 ) ) ( not ( = ?auto_112718 ?auto_112721 ) ) ( not ( = ?auto_112718 ?auto_112722 ) ) ( not ( = ?auto_112718 ?auto_112723 ) ) ( not ( = ?auto_112719 ?auto_112720 ) ) ( not ( = ?auto_112719 ?auto_112721 ) ) ( not ( = ?auto_112719 ?auto_112722 ) ) ( not ( = ?auto_112719 ?auto_112723 ) ) ( not ( = ?auto_112720 ?auto_112721 ) ) ( not ( = ?auto_112720 ?auto_112722 ) ) ( not ( = ?auto_112720 ?auto_112723 ) ) ( not ( = ?auto_112721 ?auto_112722 ) ) ( not ( = ?auto_112721 ?auto_112723 ) ) ( not ( = ?auto_112722 ?auto_112723 ) ) ( ON-TABLE ?auto_112723 ) ( ON ?auto_112722 ?auto_112723 ) ( ON ?auto_112721 ?auto_112722 ) ( ON ?auto_112720 ?auto_112721 ) ( ON ?auto_112719 ?auto_112720 ) ( ON ?auto_112718 ?auto_112719 ) ( CLEAR ?auto_112718 ) ( HOLDING ?auto_112717 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112717 )
      ( MAKE-7PILE ?auto_112717 ?auto_112718 ?auto_112719 ?auto_112720 ?auto_112721 ?auto_112722 ?auto_112723 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112724 - BLOCK
      ?auto_112725 - BLOCK
      ?auto_112726 - BLOCK
      ?auto_112727 - BLOCK
      ?auto_112728 - BLOCK
      ?auto_112729 - BLOCK
      ?auto_112730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112724 ?auto_112725 ) ) ( not ( = ?auto_112724 ?auto_112726 ) ) ( not ( = ?auto_112724 ?auto_112727 ) ) ( not ( = ?auto_112724 ?auto_112728 ) ) ( not ( = ?auto_112724 ?auto_112729 ) ) ( not ( = ?auto_112724 ?auto_112730 ) ) ( not ( = ?auto_112725 ?auto_112726 ) ) ( not ( = ?auto_112725 ?auto_112727 ) ) ( not ( = ?auto_112725 ?auto_112728 ) ) ( not ( = ?auto_112725 ?auto_112729 ) ) ( not ( = ?auto_112725 ?auto_112730 ) ) ( not ( = ?auto_112726 ?auto_112727 ) ) ( not ( = ?auto_112726 ?auto_112728 ) ) ( not ( = ?auto_112726 ?auto_112729 ) ) ( not ( = ?auto_112726 ?auto_112730 ) ) ( not ( = ?auto_112727 ?auto_112728 ) ) ( not ( = ?auto_112727 ?auto_112729 ) ) ( not ( = ?auto_112727 ?auto_112730 ) ) ( not ( = ?auto_112728 ?auto_112729 ) ) ( not ( = ?auto_112728 ?auto_112730 ) ) ( not ( = ?auto_112729 ?auto_112730 ) ) ( ON-TABLE ?auto_112730 ) ( ON ?auto_112729 ?auto_112730 ) ( ON ?auto_112728 ?auto_112729 ) ( ON ?auto_112727 ?auto_112728 ) ( ON ?auto_112726 ?auto_112727 ) ( ON ?auto_112725 ?auto_112726 ) ( ON ?auto_112724 ?auto_112725 ) ( CLEAR ?auto_112724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112730 ?auto_112729 ?auto_112728 ?auto_112727 ?auto_112726 ?auto_112725 )
      ( MAKE-7PILE ?auto_112724 ?auto_112725 ?auto_112726 ?auto_112727 ?auto_112728 ?auto_112729 ?auto_112730 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112731 - BLOCK
      ?auto_112732 - BLOCK
      ?auto_112733 - BLOCK
      ?auto_112734 - BLOCK
      ?auto_112735 - BLOCK
      ?auto_112736 - BLOCK
      ?auto_112737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112731 ?auto_112732 ) ) ( not ( = ?auto_112731 ?auto_112733 ) ) ( not ( = ?auto_112731 ?auto_112734 ) ) ( not ( = ?auto_112731 ?auto_112735 ) ) ( not ( = ?auto_112731 ?auto_112736 ) ) ( not ( = ?auto_112731 ?auto_112737 ) ) ( not ( = ?auto_112732 ?auto_112733 ) ) ( not ( = ?auto_112732 ?auto_112734 ) ) ( not ( = ?auto_112732 ?auto_112735 ) ) ( not ( = ?auto_112732 ?auto_112736 ) ) ( not ( = ?auto_112732 ?auto_112737 ) ) ( not ( = ?auto_112733 ?auto_112734 ) ) ( not ( = ?auto_112733 ?auto_112735 ) ) ( not ( = ?auto_112733 ?auto_112736 ) ) ( not ( = ?auto_112733 ?auto_112737 ) ) ( not ( = ?auto_112734 ?auto_112735 ) ) ( not ( = ?auto_112734 ?auto_112736 ) ) ( not ( = ?auto_112734 ?auto_112737 ) ) ( not ( = ?auto_112735 ?auto_112736 ) ) ( not ( = ?auto_112735 ?auto_112737 ) ) ( not ( = ?auto_112736 ?auto_112737 ) ) ( ON-TABLE ?auto_112737 ) ( ON ?auto_112736 ?auto_112737 ) ( ON ?auto_112735 ?auto_112736 ) ( ON ?auto_112734 ?auto_112735 ) ( ON ?auto_112733 ?auto_112734 ) ( ON ?auto_112732 ?auto_112733 ) ( HOLDING ?auto_112731 ) ( CLEAR ?auto_112732 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112737 ?auto_112736 ?auto_112735 ?auto_112734 ?auto_112733 ?auto_112732 ?auto_112731 )
      ( MAKE-7PILE ?auto_112731 ?auto_112732 ?auto_112733 ?auto_112734 ?auto_112735 ?auto_112736 ?auto_112737 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112738 - BLOCK
      ?auto_112739 - BLOCK
      ?auto_112740 - BLOCK
      ?auto_112741 - BLOCK
      ?auto_112742 - BLOCK
      ?auto_112743 - BLOCK
      ?auto_112744 - BLOCK
    )
    :vars
    (
      ?auto_112745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112738 ?auto_112739 ) ) ( not ( = ?auto_112738 ?auto_112740 ) ) ( not ( = ?auto_112738 ?auto_112741 ) ) ( not ( = ?auto_112738 ?auto_112742 ) ) ( not ( = ?auto_112738 ?auto_112743 ) ) ( not ( = ?auto_112738 ?auto_112744 ) ) ( not ( = ?auto_112739 ?auto_112740 ) ) ( not ( = ?auto_112739 ?auto_112741 ) ) ( not ( = ?auto_112739 ?auto_112742 ) ) ( not ( = ?auto_112739 ?auto_112743 ) ) ( not ( = ?auto_112739 ?auto_112744 ) ) ( not ( = ?auto_112740 ?auto_112741 ) ) ( not ( = ?auto_112740 ?auto_112742 ) ) ( not ( = ?auto_112740 ?auto_112743 ) ) ( not ( = ?auto_112740 ?auto_112744 ) ) ( not ( = ?auto_112741 ?auto_112742 ) ) ( not ( = ?auto_112741 ?auto_112743 ) ) ( not ( = ?auto_112741 ?auto_112744 ) ) ( not ( = ?auto_112742 ?auto_112743 ) ) ( not ( = ?auto_112742 ?auto_112744 ) ) ( not ( = ?auto_112743 ?auto_112744 ) ) ( ON-TABLE ?auto_112744 ) ( ON ?auto_112743 ?auto_112744 ) ( ON ?auto_112742 ?auto_112743 ) ( ON ?auto_112741 ?auto_112742 ) ( ON ?auto_112740 ?auto_112741 ) ( ON ?auto_112739 ?auto_112740 ) ( CLEAR ?auto_112739 ) ( ON ?auto_112738 ?auto_112745 ) ( CLEAR ?auto_112738 ) ( HAND-EMPTY ) ( not ( = ?auto_112738 ?auto_112745 ) ) ( not ( = ?auto_112739 ?auto_112745 ) ) ( not ( = ?auto_112740 ?auto_112745 ) ) ( not ( = ?auto_112741 ?auto_112745 ) ) ( not ( = ?auto_112742 ?auto_112745 ) ) ( not ( = ?auto_112743 ?auto_112745 ) ) ( not ( = ?auto_112744 ?auto_112745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112738 ?auto_112745 )
      ( MAKE-7PILE ?auto_112738 ?auto_112739 ?auto_112740 ?auto_112741 ?auto_112742 ?auto_112743 ?auto_112744 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112746 - BLOCK
      ?auto_112747 - BLOCK
      ?auto_112748 - BLOCK
      ?auto_112749 - BLOCK
      ?auto_112750 - BLOCK
      ?auto_112751 - BLOCK
      ?auto_112752 - BLOCK
    )
    :vars
    (
      ?auto_112753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112746 ?auto_112747 ) ) ( not ( = ?auto_112746 ?auto_112748 ) ) ( not ( = ?auto_112746 ?auto_112749 ) ) ( not ( = ?auto_112746 ?auto_112750 ) ) ( not ( = ?auto_112746 ?auto_112751 ) ) ( not ( = ?auto_112746 ?auto_112752 ) ) ( not ( = ?auto_112747 ?auto_112748 ) ) ( not ( = ?auto_112747 ?auto_112749 ) ) ( not ( = ?auto_112747 ?auto_112750 ) ) ( not ( = ?auto_112747 ?auto_112751 ) ) ( not ( = ?auto_112747 ?auto_112752 ) ) ( not ( = ?auto_112748 ?auto_112749 ) ) ( not ( = ?auto_112748 ?auto_112750 ) ) ( not ( = ?auto_112748 ?auto_112751 ) ) ( not ( = ?auto_112748 ?auto_112752 ) ) ( not ( = ?auto_112749 ?auto_112750 ) ) ( not ( = ?auto_112749 ?auto_112751 ) ) ( not ( = ?auto_112749 ?auto_112752 ) ) ( not ( = ?auto_112750 ?auto_112751 ) ) ( not ( = ?auto_112750 ?auto_112752 ) ) ( not ( = ?auto_112751 ?auto_112752 ) ) ( ON-TABLE ?auto_112752 ) ( ON ?auto_112751 ?auto_112752 ) ( ON ?auto_112750 ?auto_112751 ) ( ON ?auto_112749 ?auto_112750 ) ( ON ?auto_112748 ?auto_112749 ) ( ON ?auto_112746 ?auto_112753 ) ( CLEAR ?auto_112746 ) ( not ( = ?auto_112746 ?auto_112753 ) ) ( not ( = ?auto_112747 ?auto_112753 ) ) ( not ( = ?auto_112748 ?auto_112753 ) ) ( not ( = ?auto_112749 ?auto_112753 ) ) ( not ( = ?auto_112750 ?auto_112753 ) ) ( not ( = ?auto_112751 ?auto_112753 ) ) ( not ( = ?auto_112752 ?auto_112753 ) ) ( HOLDING ?auto_112747 ) ( CLEAR ?auto_112748 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112752 ?auto_112751 ?auto_112750 ?auto_112749 ?auto_112748 ?auto_112747 )
      ( MAKE-7PILE ?auto_112746 ?auto_112747 ?auto_112748 ?auto_112749 ?auto_112750 ?auto_112751 ?auto_112752 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112754 - BLOCK
      ?auto_112755 - BLOCK
      ?auto_112756 - BLOCK
      ?auto_112757 - BLOCK
      ?auto_112758 - BLOCK
      ?auto_112759 - BLOCK
      ?auto_112760 - BLOCK
    )
    :vars
    (
      ?auto_112761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112754 ?auto_112755 ) ) ( not ( = ?auto_112754 ?auto_112756 ) ) ( not ( = ?auto_112754 ?auto_112757 ) ) ( not ( = ?auto_112754 ?auto_112758 ) ) ( not ( = ?auto_112754 ?auto_112759 ) ) ( not ( = ?auto_112754 ?auto_112760 ) ) ( not ( = ?auto_112755 ?auto_112756 ) ) ( not ( = ?auto_112755 ?auto_112757 ) ) ( not ( = ?auto_112755 ?auto_112758 ) ) ( not ( = ?auto_112755 ?auto_112759 ) ) ( not ( = ?auto_112755 ?auto_112760 ) ) ( not ( = ?auto_112756 ?auto_112757 ) ) ( not ( = ?auto_112756 ?auto_112758 ) ) ( not ( = ?auto_112756 ?auto_112759 ) ) ( not ( = ?auto_112756 ?auto_112760 ) ) ( not ( = ?auto_112757 ?auto_112758 ) ) ( not ( = ?auto_112757 ?auto_112759 ) ) ( not ( = ?auto_112757 ?auto_112760 ) ) ( not ( = ?auto_112758 ?auto_112759 ) ) ( not ( = ?auto_112758 ?auto_112760 ) ) ( not ( = ?auto_112759 ?auto_112760 ) ) ( ON-TABLE ?auto_112760 ) ( ON ?auto_112759 ?auto_112760 ) ( ON ?auto_112758 ?auto_112759 ) ( ON ?auto_112757 ?auto_112758 ) ( ON ?auto_112756 ?auto_112757 ) ( ON ?auto_112754 ?auto_112761 ) ( not ( = ?auto_112754 ?auto_112761 ) ) ( not ( = ?auto_112755 ?auto_112761 ) ) ( not ( = ?auto_112756 ?auto_112761 ) ) ( not ( = ?auto_112757 ?auto_112761 ) ) ( not ( = ?auto_112758 ?auto_112761 ) ) ( not ( = ?auto_112759 ?auto_112761 ) ) ( not ( = ?auto_112760 ?auto_112761 ) ) ( CLEAR ?auto_112756 ) ( ON ?auto_112755 ?auto_112754 ) ( CLEAR ?auto_112755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112761 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112761 ?auto_112754 )
      ( MAKE-7PILE ?auto_112754 ?auto_112755 ?auto_112756 ?auto_112757 ?auto_112758 ?auto_112759 ?auto_112760 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112762 - BLOCK
      ?auto_112763 - BLOCK
      ?auto_112764 - BLOCK
      ?auto_112765 - BLOCK
      ?auto_112766 - BLOCK
      ?auto_112767 - BLOCK
      ?auto_112768 - BLOCK
    )
    :vars
    (
      ?auto_112769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112762 ?auto_112763 ) ) ( not ( = ?auto_112762 ?auto_112764 ) ) ( not ( = ?auto_112762 ?auto_112765 ) ) ( not ( = ?auto_112762 ?auto_112766 ) ) ( not ( = ?auto_112762 ?auto_112767 ) ) ( not ( = ?auto_112762 ?auto_112768 ) ) ( not ( = ?auto_112763 ?auto_112764 ) ) ( not ( = ?auto_112763 ?auto_112765 ) ) ( not ( = ?auto_112763 ?auto_112766 ) ) ( not ( = ?auto_112763 ?auto_112767 ) ) ( not ( = ?auto_112763 ?auto_112768 ) ) ( not ( = ?auto_112764 ?auto_112765 ) ) ( not ( = ?auto_112764 ?auto_112766 ) ) ( not ( = ?auto_112764 ?auto_112767 ) ) ( not ( = ?auto_112764 ?auto_112768 ) ) ( not ( = ?auto_112765 ?auto_112766 ) ) ( not ( = ?auto_112765 ?auto_112767 ) ) ( not ( = ?auto_112765 ?auto_112768 ) ) ( not ( = ?auto_112766 ?auto_112767 ) ) ( not ( = ?auto_112766 ?auto_112768 ) ) ( not ( = ?auto_112767 ?auto_112768 ) ) ( ON-TABLE ?auto_112768 ) ( ON ?auto_112767 ?auto_112768 ) ( ON ?auto_112766 ?auto_112767 ) ( ON ?auto_112765 ?auto_112766 ) ( ON ?auto_112762 ?auto_112769 ) ( not ( = ?auto_112762 ?auto_112769 ) ) ( not ( = ?auto_112763 ?auto_112769 ) ) ( not ( = ?auto_112764 ?auto_112769 ) ) ( not ( = ?auto_112765 ?auto_112769 ) ) ( not ( = ?auto_112766 ?auto_112769 ) ) ( not ( = ?auto_112767 ?auto_112769 ) ) ( not ( = ?auto_112768 ?auto_112769 ) ) ( ON ?auto_112763 ?auto_112762 ) ( CLEAR ?auto_112763 ) ( ON-TABLE ?auto_112769 ) ( HOLDING ?auto_112764 ) ( CLEAR ?auto_112765 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112768 ?auto_112767 ?auto_112766 ?auto_112765 ?auto_112764 )
      ( MAKE-7PILE ?auto_112762 ?auto_112763 ?auto_112764 ?auto_112765 ?auto_112766 ?auto_112767 ?auto_112768 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112770 - BLOCK
      ?auto_112771 - BLOCK
      ?auto_112772 - BLOCK
      ?auto_112773 - BLOCK
      ?auto_112774 - BLOCK
      ?auto_112775 - BLOCK
      ?auto_112776 - BLOCK
    )
    :vars
    (
      ?auto_112777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112770 ?auto_112771 ) ) ( not ( = ?auto_112770 ?auto_112772 ) ) ( not ( = ?auto_112770 ?auto_112773 ) ) ( not ( = ?auto_112770 ?auto_112774 ) ) ( not ( = ?auto_112770 ?auto_112775 ) ) ( not ( = ?auto_112770 ?auto_112776 ) ) ( not ( = ?auto_112771 ?auto_112772 ) ) ( not ( = ?auto_112771 ?auto_112773 ) ) ( not ( = ?auto_112771 ?auto_112774 ) ) ( not ( = ?auto_112771 ?auto_112775 ) ) ( not ( = ?auto_112771 ?auto_112776 ) ) ( not ( = ?auto_112772 ?auto_112773 ) ) ( not ( = ?auto_112772 ?auto_112774 ) ) ( not ( = ?auto_112772 ?auto_112775 ) ) ( not ( = ?auto_112772 ?auto_112776 ) ) ( not ( = ?auto_112773 ?auto_112774 ) ) ( not ( = ?auto_112773 ?auto_112775 ) ) ( not ( = ?auto_112773 ?auto_112776 ) ) ( not ( = ?auto_112774 ?auto_112775 ) ) ( not ( = ?auto_112774 ?auto_112776 ) ) ( not ( = ?auto_112775 ?auto_112776 ) ) ( ON-TABLE ?auto_112776 ) ( ON ?auto_112775 ?auto_112776 ) ( ON ?auto_112774 ?auto_112775 ) ( ON ?auto_112773 ?auto_112774 ) ( ON ?auto_112770 ?auto_112777 ) ( not ( = ?auto_112770 ?auto_112777 ) ) ( not ( = ?auto_112771 ?auto_112777 ) ) ( not ( = ?auto_112772 ?auto_112777 ) ) ( not ( = ?auto_112773 ?auto_112777 ) ) ( not ( = ?auto_112774 ?auto_112777 ) ) ( not ( = ?auto_112775 ?auto_112777 ) ) ( not ( = ?auto_112776 ?auto_112777 ) ) ( ON ?auto_112771 ?auto_112770 ) ( ON-TABLE ?auto_112777 ) ( CLEAR ?auto_112773 ) ( ON ?auto_112772 ?auto_112771 ) ( CLEAR ?auto_112772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112777 ?auto_112770 ?auto_112771 )
      ( MAKE-7PILE ?auto_112770 ?auto_112771 ?auto_112772 ?auto_112773 ?auto_112774 ?auto_112775 ?auto_112776 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112778 - BLOCK
      ?auto_112779 - BLOCK
      ?auto_112780 - BLOCK
      ?auto_112781 - BLOCK
      ?auto_112782 - BLOCK
      ?auto_112783 - BLOCK
      ?auto_112784 - BLOCK
    )
    :vars
    (
      ?auto_112785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112778 ?auto_112779 ) ) ( not ( = ?auto_112778 ?auto_112780 ) ) ( not ( = ?auto_112778 ?auto_112781 ) ) ( not ( = ?auto_112778 ?auto_112782 ) ) ( not ( = ?auto_112778 ?auto_112783 ) ) ( not ( = ?auto_112778 ?auto_112784 ) ) ( not ( = ?auto_112779 ?auto_112780 ) ) ( not ( = ?auto_112779 ?auto_112781 ) ) ( not ( = ?auto_112779 ?auto_112782 ) ) ( not ( = ?auto_112779 ?auto_112783 ) ) ( not ( = ?auto_112779 ?auto_112784 ) ) ( not ( = ?auto_112780 ?auto_112781 ) ) ( not ( = ?auto_112780 ?auto_112782 ) ) ( not ( = ?auto_112780 ?auto_112783 ) ) ( not ( = ?auto_112780 ?auto_112784 ) ) ( not ( = ?auto_112781 ?auto_112782 ) ) ( not ( = ?auto_112781 ?auto_112783 ) ) ( not ( = ?auto_112781 ?auto_112784 ) ) ( not ( = ?auto_112782 ?auto_112783 ) ) ( not ( = ?auto_112782 ?auto_112784 ) ) ( not ( = ?auto_112783 ?auto_112784 ) ) ( ON-TABLE ?auto_112784 ) ( ON ?auto_112783 ?auto_112784 ) ( ON ?auto_112782 ?auto_112783 ) ( ON ?auto_112778 ?auto_112785 ) ( not ( = ?auto_112778 ?auto_112785 ) ) ( not ( = ?auto_112779 ?auto_112785 ) ) ( not ( = ?auto_112780 ?auto_112785 ) ) ( not ( = ?auto_112781 ?auto_112785 ) ) ( not ( = ?auto_112782 ?auto_112785 ) ) ( not ( = ?auto_112783 ?auto_112785 ) ) ( not ( = ?auto_112784 ?auto_112785 ) ) ( ON ?auto_112779 ?auto_112778 ) ( ON-TABLE ?auto_112785 ) ( ON ?auto_112780 ?auto_112779 ) ( CLEAR ?auto_112780 ) ( HOLDING ?auto_112781 ) ( CLEAR ?auto_112782 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112784 ?auto_112783 ?auto_112782 ?auto_112781 )
      ( MAKE-7PILE ?auto_112778 ?auto_112779 ?auto_112780 ?auto_112781 ?auto_112782 ?auto_112783 ?auto_112784 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112786 - BLOCK
      ?auto_112787 - BLOCK
      ?auto_112788 - BLOCK
      ?auto_112789 - BLOCK
      ?auto_112790 - BLOCK
      ?auto_112791 - BLOCK
      ?auto_112792 - BLOCK
    )
    :vars
    (
      ?auto_112793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112786 ?auto_112787 ) ) ( not ( = ?auto_112786 ?auto_112788 ) ) ( not ( = ?auto_112786 ?auto_112789 ) ) ( not ( = ?auto_112786 ?auto_112790 ) ) ( not ( = ?auto_112786 ?auto_112791 ) ) ( not ( = ?auto_112786 ?auto_112792 ) ) ( not ( = ?auto_112787 ?auto_112788 ) ) ( not ( = ?auto_112787 ?auto_112789 ) ) ( not ( = ?auto_112787 ?auto_112790 ) ) ( not ( = ?auto_112787 ?auto_112791 ) ) ( not ( = ?auto_112787 ?auto_112792 ) ) ( not ( = ?auto_112788 ?auto_112789 ) ) ( not ( = ?auto_112788 ?auto_112790 ) ) ( not ( = ?auto_112788 ?auto_112791 ) ) ( not ( = ?auto_112788 ?auto_112792 ) ) ( not ( = ?auto_112789 ?auto_112790 ) ) ( not ( = ?auto_112789 ?auto_112791 ) ) ( not ( = ?auto_112789 ?auto_112792 ) ) ( not ( = ?auto_112790 ?auto_112791 ) ) ( not ( = ?auto_112790 ?auto_112792 ) ) ( not ( = ?auto_112791 ?auto_112792 ) ) ( ON-TABLE ?auto_112792 ) ( ON ?auto_112791 ?auto_112792 ) ( ON ?auto_112790 ?auto_112791 ) ( ON ?auto_112786 ?auto_112793 ) ( not ( = ?auto_112786 ?auto_112793 ) ) ( not ( = ?auto_112787 ?auto_112793 ) ) ( not ( = ?auto_112788 ?auto_112793 ) ) ( not ( = ?auto_112789 ?auto_112793 ) ) ( not ( = ?auto_112790 ?auto_112793 ) ) ( not ( = ?auto_112791 ?auto_112793 ) ) ( not ( = ?auto_112792 ?auto_112793 ) ) ( ON ?auto_112787 ?auto_112786 ) ( ON-TABLE ?auto_112793 ) ( ON ?auto_112788 ?auto_112787 ) ( CLEAR ?auto_112790 ) ( ON ?auto_112789 ?auto_112788 ) ( CLEAR ?auto_112789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112793 ?auto_112786 ?auto_112787 ?auto_112788 )
      ( MAKE-7PILE ?auto_112786 ?auto_112787 ?auto_112788 ?auto_112789 ?auto_112790 ?auto_112791 ?auto_112792 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112794 - BLOCK
      ?auto_112795 - BLOCK
      ?auto_112796 - BLOCK
      ?auto_112797 - BLOCK
      ?auto_112798 - BLOCK
      ?auto_112799 - BLOCK
      ?auto_112800 - BLOCK
    )
    :vars
    (
      ?auto_112801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112794 ?auto_112795 ) ) ( not ( = ?auto_112794 ?auto_112796 ) ) ( not ( = ?auto_112794 ?auto_112797 ) ) ( not ( = ?auto_112794 ?auto_112798 ) ) ( not ( = ?auto_112794 ?auto_112799 ) ) ( not ( = ?auto_112794 ?auto_112800 ) ) ( not ( = ?auto_112795 ?auto_112796 ) ) ( not ( = ?auto_112795 ?auto_112797 ) ) ( not ( = ?auto_112795 ?auto_112798 ) ) ( not ( = ?auto_112795 ?auto_112799 ) ) ( not ( = ?auto_112795 ?auto_112800 ) ) ( not ( = ?auto_112796 ?auto_112797 ) ) ( not ( = ?auto_112796 ?auto_112798 ) ) ( not ( = ?auto_112796 ?auto_112799 ) ) ( not ( = ?auto_112796 ?auto_112800 ) ) ( not ( = ?auto_112797 ?auto_112798 ) ) ( not ( = ?auto_112797 ?auto_112799 ) ) ( not ( = ?auto_112797 ?auto_112800 ) ) ( not ( = ?auto_112798 ?auto_112799 ) ) ( not ( = ?auto_112798 ?auto_112800 ) ) ( not ( = ?auto_112799 ?auto_112800 ) ) ( ON-TABLE ?auto_112800 ) ( ON ?auto_112799 ?auto_112800 ) ( ON ?auto_112794 ?auto_112801 ) ( not ( = ?auto_112794 ?auto_112801 ) ) ( not ( = ?auto_112795 ?auto_112801 ) ) ( not ( = ?auto_112796 ?auto_112801 ) ) ( not ( = ?auto_112797 ?auto_112801 ) ) ( not ( = ?auto_112798 ?auto_112801 ) ) ( not ( = ?auto_112799 ?auto_112801 ) ) ( not ( = ?auto_112800 ?auto_112801 ) ) ( ON ?auto_112795 ?auto_112794 ) ( ON-TABLE ?auto_112801 ) ( ON ?auto_112796 ?auto_112795 ) ( ON ?auto_112797 ?auto_112796 ) ( CLEAR ?auto_112797 ) ( HOLDING ?auto_112798 ) ( CLEAR ?auto_112799 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112800 ?auto_112799 ?auto_112798 )
      ( MAKE-7PILE ?auto_112794 ?auto_112795 ?auto_112796 ?auto_112797 ?auto_112798 ?auto_112799 ?auto_112800 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112802 - BLOCK
      ?auto_112803 - BLOCK
      ?auto_112804 - BLOCK
      ?auto_112805 - BLOCK
      ?auto_112806 - BLOCK
      ?auto_112807 - BLOCK
      ?auto_112808 - BLOCK
    )
    :vars
    (
      ?auto_112809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112802 ?auto_112803 ) ) ( not ( = ?auto_112802 ?auto_112804 ) ) ( not ( = ?auto_112802 ?auto_112805 ) ) ( not ( = ?auto_112802 ?auto_112806 ) ) ( not ( = ?auto_112802 ?auto_112807 ) ) ( not ( = ?auto_112802 ?auto_112808 ) ) ( not ( = ?auto_112803 ?auto_112804 ) ) ( not ( = ?auto_112803 ?auto_112805 ) ) ( not ( = ?auto_112803 ?auto_112806 ) ) ( not ( = ?auto_112803 ?auto_112807 ) ) ( not ( = ?auto_112803 ?auto_112808 ) ) ( not ( = ?auto_112804 ?auto_112805 ) ) ( not ( = ?auto_112804 ?auto_112806 ) ) ( not ( = ?auto_112804 ?auto_112807 ) ) ( not ( = ?auto_112804 ?auto_112808 ) ) ( not ( = ?auto_112805 ?auto_112806 ) ) ( not ( = ?auto_112805 ?auto_112807 ) ) ( not ( = ?auto_112805 ?auto_112808 ) ) ( not ( = ?auto_112806 ?auto_112807 ) ) ( not ( = ?auto_112806 ?auto_112808 ) ) ( not ( = ?auto_112807 ?auto_112808 ) ) ( ON-TABLE ?auto_112808 ) ( ON ?auto_112807 ?auto_112808 ) ( ON ?auto_112802 ?auto_112809 ) ( not ( = ?auto_112802 ?auto_112809 ) ) ( not ( = ?auto_112803 ?auto_112809 ) ) ( not ( = ?auto_112804 ?auto_112809 ) ) ( not ( = ?auto_112805 ?auto_112809 ) ) ( not ( = ?auto_112806 ?auto_112809 ) ) ( not ( = ?auto_112807 ?auto_112809 ) ) ( not ( = ?auto_112808 ?auto_112809 ) ) ( ON ?auto_112803 ?auto_112802 ) ( ON-TABLE ?auto_112809 ) ( ON ?auto_112804 ?auto_112803 ) ( ON ?auto_112805 ?auto_112804 ) ( CLEAR ?auto_112807 ) ( ON ?auto_112806 ?auto_112805 ) ( CLEAR ?auto_112806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112809 ?auto_112802 ?auto_112803 ?auto_112804 ?auto_112805 )
      ( MAKE-7PILE ?auto_112802 ?auto_112803 ?auto_112804 ?auto_112805 ?auto_112806 ?auto_112807 ?auto_112808 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112810 - BLOCK
      ?auto_112811 - BLOCK
      ?auto_112812 - BLOCK
      ?auto_112813 - BLOCK
      ?auto_112814 - BLOCK
      ?auto_112815 - BLOCK
      ?auto_112816 - BLOCK
    )
    :vars
    (
      ?auto_112817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112810 ?auto_112811 ) ) ( not ( = ?auto_112810 ?auto_112812 ) ) ( not ( = ?auto_112810 ?auto_112813 ) ) ( not ( = ?auto_112810 ?auto_112814 ) ) ( not ( = ?auto_112810 ?auto_112815 ) ) ( not ( = ?auto_112810 ?auto_112816 ) ) ( not ( = ?auto_112811 ?auto_112812 ) ) ( not ( = ?auto_112811 ?auto_112813 ) ) ( not ( = ?auto_112811 ?auto_112814 ) ) ( not ( = ?auto_112811 ?auto_112815 ) ) ( not ( = ?auto_112811 ?auto_112816 ) ) ( not ( = ?auto_112812 ?auto_112813 ) ) ( not ( = ?auto_112812 ?auto_112814 ) ) ( not ( = ?auto_112812 ?auto_112815 ) ) ( not ( = ?auto_112812 ?auto_112816 ) ) ( not ( = ?auto_112813 ?auto_112814 ) ) ( not ( = ?auto_112813 ?auto_112815 ) ) ( not ( = ?auto_112813 ?auto_112816 ) ) ( not ( = ?auto_112814 ?auto_112815 ) ) ( not ( = ?auto_112814 ?auto_112816 ) ) ( not ( = ?auto_112815 ?auto_112816 ) ) ( ON-TABLE ?auto_112816 ) ( ON ?auto_112810 ?auto_112817 ) ( not ( = ?auto_112810 ?auto_112817 ) ) ( not ( = ?auto_112811 ?auto_112817 ) ) ( not ( = ?auto_112812 ?auto_112817 ) ) ( not ( = ?auto_112813 ?auto_112817 ) ) ( not ( = ?auto_112814 ?auto_112817 ) ) ( not ( = ?auto_112815 ?auto_112817 ) ) ( not ( = ?auto_112816 ?auto_112817 ) ) ( ON ?auto_112811 ?auto_112810 ) ( ON-TABLE ?auto_112817 ) ( ON ?auto_112812 ?auto_112811 ) ( ON ?auto_112813 ?auto_112812 ) ( ON ?auto_112814 ?auto_112813 ) ( CLEAR ?auto_112814 ) ( HOLDING ?auto_112815 ) ( CLEAR ?auto_112816 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112816 ?auto_112815 )
      ( MAKE-7PILE ?auto_112810 ?auto_112811 ?auto_112812 ?auto_112813 ?auto_112814 ?auto_112815 ?auto_112816 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112818 - BLOCK
      ?auto_112819 - BLOCK
      ?auto_112820 - BLOCK
      ?auto_112821 - BLOCK
      ?auto_112822 - BLOCK
      ?auto_112823 - BLOCK
      ?auto_112824 - BLOCK
    )
    :vars
    (
      ?auto_112825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112818 ?auto_112819 ) ) ( not ( = ?auto_112818 ?auto_112820 ) ) ( not ( = ?auto_112818 ?auto_112821 ) ) ( not ( = ?auto_112818 ?auto_112822 ) ) ( not ( = ?auto_112818 ?auto_112823 ) ) ( not ( = ?auto_112818 ?auto_112824 ) ) ( not ( = ?auto_112819 ?auto_112820 ) ) ( not ( = ?auto_112819 ?auto_112821 ) ) ( not ( = ?auto_112819 ?auto_112822 ) ) ( not ( = ?auto_112819 ?auto_112823 ) ) ( not ( = ?auto_112819 ?auto_112824 ) ) ( not ( = ?auto_112820 ?auto_112821 ) ) ( not ( = ?auto_112820 ?auto_112822 ) ) ( not ( = ?auto_112820 ?auto_112823 ) ) ( not ( = ?auto_112820 ?auto_112824 ) ) ( not ( = ?auto_112821 ?auto_112822 ) ) ( not ( = ?auto_112821 ?auto_112823 ) ) ( not ( = ?auto_112821 ?auto_112824 ) ) ( not ( = ?auto_112822 ?auto_112823 ) ) ( not ( = ?auto_112822 ?auto_112824 ) ) ( not ( = ?auto_112823 ?auto_112824 ) ) ( ON-TABLE ?auto_112824 ) ( ON ?auto_112818 ?auto_112825 ) ( not ( = ?auto_112818 ?auto_112825 ) ) ( not ( = ?auto_112819 ?auto_112825 ) ) ( not ( = ?auto_112820 ?auto_112825 ) ) ( not ( = ?auto_112821 ?auto_112825 ) ) ( not ( = ?auto_112822 ?auto_112825 ) ) ( not ( = ?auto_112823 ?auto_112825 ) ) ( not ( = ?auto_112824 ?auto_112825 ) ) ( ON ?auto_112819 ?auto_112818 ) ( ON-TABLE ?auto_112825 ) ( ON ?auto_112820 ?auto_112819 ) ( ON ?auto_112821 ?auto_112820 ) ( ON ?auto_112822 ?auto_112821 ) ( CLEAR ?auto_112824 ) ( ON ?auto_112823 ?auto_112822 ) ( CLEAR ?auto_112823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112825 ?auto_112818 ?auto_112819 ?auto_112820 ?auto_112821 ?auto_112822 )
      ( MAKE-7PILE ?auto_112818 ?auto_112819 ?auto_112820 ?auto_112821 ?auto_112822 ?auto_112823 ?auto_112824 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112826 - BLOCK
      ?auto_112827 - BLOCK
      ?auto_112828 - BLOCK
      ?auto_112829 - BLOCK
      ?auto_112830 - BLOCK
      ?auto_112831 - BLOCK
      ?auto_112832 - BLOCK
    )
    :vars
    (
      ?auto_112833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112826 ?auto_112827 ) ) ( not ( = ?auto_112826 ?auto_112828 ) ) ( not ( = ?auto_112826 ?auto_112829 ) ) ( not ( = ?auto_112826 ?auto_112830 ) ) ( not ( = ?auto_112826 ?auto_112831 ) ) ( not ( = ?auto_112826 ?auto_112832 ) ) ( not ( = ?auto_112827 ?auto_112828 ) ) ( not ( = ?auto_112827 ?auto_112829 ) ) ( not ( = ?auto_112827 ?auto_112830 ) ) ( not ( = ?auto_112827 ?auto_112831 ) ) ( not ( = ?auto_112827 ?auto_112832 ) ) ( not ( = ?auto_112828 ?auto_112829 ) ) ( not ( = ?auto_112828 ?auto_112830 ) ) ( not ( = ?auto_112828 ?auto_112831 ) ) ( not ( = ?auto_112828 ?auto_112832 ) ) ( not ( = ?auto_112829 ?auto_112830 ) ) ( not ( = ?auto_112829 ?auto_112831 ) ) ( not ( = ?auto_112829 ?auto_112832 ) ) ( not ( = ?auto_112830 ?auto_112831 ) ) ( not ( = ?auto_112830 ?auto_112832 ) ) ( not ( = ?auto_112831 ?auto_112832 ) ) ( ON ?auto_112826 ?auto_112833 ) ( not ( = ?auto_112826 ?auto_112833 ) ) ( not ( = ?auto_112827 ?auto_112833 ) ) ( not ( = ?auto_112828 ?auto_112833 ) ) ( not ( = ?auto_112829 ?auto_112833 ) ) ( not ( = ?auto_112830 ?auto_112833 ) ) ( not ( = ?auto_112831 ?auto_112833 ) ) ( not ( = ?auto_112832 ?auto_112833 ) ) ( ON ?auto_112827 ?auto_112826 ) ( ON-TABLE ?auto_112833 ) ( ON ?auto_112828 ?auto_112827 ) ( ON ?auto_112829 ?auto_112828 ) ( ON ?auto_112830 ?auto_112829 ) ( ON ?auto_112831 ?auto_112830 ) ( CLEAR ?auto_112831 ) ( HOLDING ?auto_112832 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112832 )
      ( MAKE-7PILE ?auto_112826 ?auto_112827 ?auto_112828 ?auto_112829 ?auto_112830 ?auto_112831 ?auto_112832 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112834 - BLOCK
      ?auto_112835 - BLOCK
      ?auto_112836 - BLOCK
      ?auto_112837 - BLOCK
      ?auto_112838 - BLOCK
      ?auto_112839 - BLOCK
      ?auto_112840 - BLOCK
    )
    :vars
    (
      ?auto_112841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112834 ?auto_112835 ) ) ( not ( = ?auto_112834 ?auto_112836 ) ) ( not ( = ?auto_112834 ?auto_112837 ) ) ( not ( = ?auto_112834 ?auto_112838 ) ) ( not ( = ?auto_112834 ?auto_112839 ) ) ( not ( = ?auto_112834 ?auto_112840 ) ) ( not ( = ?auto_112835 ?auto_112836 ) ) ( not ( = ?auto_112835 ?auto_112837 ) ) ( not ( = ?auto_112835 ?auto_112838 ) ) ( not ( = ?auto_112835 ?auto_112839 ) ) ( not ( = ?auto_112835 ?auto_112840 ) ) ( not ( = ?auto_112836 ?auto_112837 ) ) ( not ( = ?auto_112836 ?auto_112838 ) ) ( not ( = ?auto_112836 ?auto_112839 ) ) ( not ( = ?auto_112836 ?auto_112840 ) ) ( not ( = ?auto_112837 ?auto_112838 ) ) ( not ( = ?auto_112837 ?auto_112839 ) ) ( not ( = ?auto_112837 ?auto_112840 ) ) ( not ( = ?auto_112838 ?auto_112839 ) ) ( not ( = ?auto_112838 ?auto_112840 ) ) ( not ( = ?auto_112839 ?auto_112840 ) ) ( ON ?auto_112834 ?auto_112841 ) ( not ( = ?auto_112834 ?auto_112841 ) ) ( not ( = ?auto_112835 ?auto_112841 ) ) ( not ( = ?auto_112836 ?auto_112841 ) ) ( not ( = ?auto_112837 ?auto_112841 ) ) ( not ( = ?auto_112838 ?auto_112841 ) ) ( not ( = ?auto_112839 ?auto_112841 ) ) ( not ( = ?auto_112840 ?auto_112841 ) ) ( ON ?auto_112835 ?auto_112834 ) ( ON-TABLE ?auto_112841 ) ( ON ?auto_112836 ?auto_112835 ) ( ON ?auto_112837 ?auto_112836 ) ( ON ?auto_112838 ?auto_112837 ) ( ON ?auto_112839 ?auto_112838 ) ( ON ?auto_112840 ?auto_112839 ) ( CLEAR ?auto_112840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112841 ?auto_112834 ?auto_112835 ?auto_112836 ?auto_112837 ?auto_112838 ?auto_112839 )
      ( MAKE-7PILE ?auto_112834 ?auto_112835 ?auto_112836 ?auto_112837 ?auto_112838 ?auto_112839 ?auto_112840 ) )
  )

)

