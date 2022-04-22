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
      ?auto_37957 - BLOCK
    )
    :vars
    (
      ?auto_37958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37957 ?auto_37958 ) ( CLEAR ?auto_37957 ) ( HAND-EMPTY ) ( not ( = ?auto_37957 ?auto_37958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37957 ?auto_37958 )
      ( !PUTDOWN ?auto_37957 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37960 - BLOCK
    )
    :vars
    (
      ?auto_37961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37960 ?auto_37961 ) ( CLEAR ?auto_37960 ) ( HAND-EMPTY ) ( not ( = ?auto_37960 ?auto_37961 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37960 ?auto_37961 )
      ( !PUTDOWN ?auto_37960 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37964 - BLOCK
      ?auto_37965 - BLOCK
    )
    :vars
    (
      ?auto_37966 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37964 ) ( ON ?auto_37965 ?auto_37966 ) ( CLEAR ?auto_37965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37964 ) ( not ( = ?auto_37964 ?auto_37965 ) ) ( not ( = ?auto_37964 ?auto_37966 ) ) ( not ( = ?auto_37965 ?auto_37966 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37965 ?auto_37966 )
      ( !STACK ?auto_37965 ?auto_37964 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37969 - BLOCK
      ?auto_37970 - BLOCK
    )
    :vars
    (
      ?auto_37971 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37969 ) ( ON ?auto_37970 ?auto_37971 ) ( CLEAR ?auto_37970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37969 ) ( not ( = ?auto_37969 ?auto_37970 ) ) ( not ( = ?auto_37969 ?auto_37971 ) ) ( not ( = ?auto_37970 ?auto_37971 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37970 ?auto_37971 )
      ( !STACK ?auto_37970 ?auto_37969 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37974 - BLOCK
      ?auto_37975 - BLOCK
    )
    :vars
    (
      ?auto_37976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37975 ?auto_37976 ) ( not ( = ?auto_37974 ?auto_37975 ) ) ( not ( = ?auto_37974 ?auto_37976 ) ) ( not ( = ?auto_37975 ?auto_37976 ) ) ( ON ?auto_37974 ?auto_37975 ) ( CLEAR ?auto_37974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37974 )
      ( MAKE-2PILE ?auto_37974 ?auto_37975 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37979 - BLOCK
      ?auto_37980 - BLOCK
    )
    :vars
    (
      ?auto_37981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37980 ?auto_37981 ) ( not ( = ?auto_37979 ?auto_37980 ) ) ( not ( = ?auto_37979 ?auto_37981 ) ) ( not ( = ?auto_37980 ?auto_37981 ) ) ( ON ?auto_37979 ?auto_37980 ) ( CLEAR ?auto_37979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37979 )
      ( MAKE-2PILE ?auto_37979 ?auto_37980 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37985 - BLOCK
      ?auto_37986 - BLOCK
      ?auto_37987 - BLOCK
    )
    :vars
    (
      ?auto_37988 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37986 ) ( ON ?auto_37987 ?auto_37988 ) ( CLEAR ?auto_37987 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37985 ) ( ON ?auto_37986 ?auto_37985 ) ( not ( = ?auto_37985 ?auto_37986 ) ) ( not ( = ?auto_37985 ?auto_37987 ) ) ( not ( = ?auto_37985 ?auto_37988 ) ) ( not ( = ?auto_37986 ?auto_37987 ) ) ( not ( = ?auto_37986 ?auto_37988 ) ) ( not ( = ?auto_37987 ?auto_37988 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37987 ?auto_37988 )
      ( !STACK ?auto_37987 ?auto_37986 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37992 - BLOCK
      ?auto_37993 - BLOCK
      ?auto_37994 - BLOCK
    )
    :vars
    (
      ?auto_37995 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37993 ) ( ON ?auto_37994 ?auto_37995 ) ( CLEAR ?auto_37994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37992 ) ( ON ?auto_37993 ?auto_37992 ) ( not ( = ?auto_37992 ?auto_37993 ) ) ( not ( = ?auto_37992 ?auto_37994 ) ) ( not ( = ?auto_37992 ?auto_37995 ) ) ( not ( = ?auto_37993 ?auto_37994 ) ) ( not ( = ?auto_37993 ?auto_37995 ) ) ( not ( = ?auto_37994 ?auto_37995 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37994 ?auto_37995 )
      ( !STACK ?auto_37994 ?auto_37993 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37999 - BLOCK
      ?auto_38000 - BLOCK
      ?auto_38001 - BLOCK
    )
    :vars
    (
      ?auto_38002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38001 ?auto_38002 ) ( ON-TABLE ?auto_37999 ) ( not ( = ?auto_37999 ?auto_38000 ) ) ( not ( = ?auto_37999 ?auto_38001 ) ) ( not ( = ?auto_37999 ?auto_38002 ) ) ( not ( = ?auto_38000 ?auto_38001 ) ) ( not ( = ?auto_38000 ?auto_38002 ) ) ( not ( = ?auto_38001 ?auto_38002 ) ) ( CLEAR ?auto_37999 ) ( ON ?auto_38000 ?auto_38001 ) ( CLEAR ?auto_38000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37999 ?auto_38000 )
      ( MAKE-3PILE ?auto_37999 ?auto_38000 ?auto_38001 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38006 - BLOCK
      ?auto_38007 - BLOCK
      ?auto_38008 - BLOCK
    )
    :vars
    (
      ?auto_38009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38008 ?auto_38009 ) ( ON-TABLE ?auto_38006 ) ( not ( = ?auto_38006 ?auto_38007 ) ) ( not ( = ?auto_38006 ?auto_38008 ) ) ( not ( = ?auto_38006 ?auto_38009 ) ) ( not ( = ?auto_38007 ?auto_38008 ) ) ( not ( = ?auto_38007 ?auto_38009 ) ) ( not ( = ?auto_38008 ?auto_38009 ) ) ( CLEAR ?auto_38006 ) ( ON ?auto_38007 ?auto_38008 ) ( CLEAR ?auto_38007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38006 ?auto_38007 )
      ( MAKE-3PILE ?auto_38006 ?auto_38007 ?auto_38008 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38013 - BLOCK
      ?auto_38014 - BLOCK
      ?auto_38015 - BLOCK
    )
    :vars
    (
      ?auto_38016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38015 ?auto_38016 ) ( not ( = ?auto_38013 ?auto_38014 ) ) ( not ( = ?auto_38013 ?auto_38015 ) ) ( not ( = ?auto_38013 ?auto_38016 ) ) ( not ( = ?auto_38014 ?auto_38015 ) ) ( not ( = ?auto_38014 ?auto_38016 ) ) ( not ( = ?auto_38015 ?auto_38016 ) ) ( ON ?auto_38014 ?auto_38015 ) ( ON ?auto_38013 ?auto_38014 ) ( CLEAR ?auto_38013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38013 )
      ( MAKE-3PILE ?auto_38013 ?auto_38014 ?auto_38015 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38020 - BLOCK
      ?auto_38021 - BLOCK
      ?auto_38022 - BLOCK
    )
    :vars
    (
      ?auto_38023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38022 ?auto_38023 ) ( not ( = ?auto_38020 ?auto_38021 ) ) ( not ( = ?auto_38020 ?auto_38022 ) ) ( not ( = ?auto_38020 ?auto_38023 ) ) ( not ( = ?auto_38021 ?auto_38022 ) ) ( not ( = ?auto_38021 ?auto_38023 ) ) ( not ( = ?auto_38022 ?auto_38023 ) ) ( ON ?auto_38021 ?auto_38022 ) ( ON ?auto_38020 ?auto_38021 ) ( CLEAR ?auto_38020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38020 )
      ( MAKE-3PILE ?auto_38020 ?auto_38021 ?auto_38022 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38028 - BLOCK
      ?auto_38029 - BLOCK
      ?auto_38030 - BLOCK
      ?auto_38031 - BLOCK
    )
    :vars
    (
      ?auto_38032 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38030 ) ( ON ?auto_38031 ?auto_38032 ) ( CLEAR ?auto_38031 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38028 ) ( ON ?auto_38029 ?auto_38028 ) ( ON ?auto_38030 ?auto_38029 ) ( not ( = ?auto_38028 ?auto_38029 ) ) ( not ( = ?auto_38028 ?auto_38030 ) ) ( not ( = ?auto_38028 ?auto_38031 ) ) ( not ( = ?auto_38028 ?auto_38032 ) ) ( not ( = ?auto_38029 ?auto_38030 ) ) ( not ( = ?auto_38029 ?auto_38031 ) ) ( not ( = ?auto_38029 ?auto_38032 ) ) ( not ( = ?auto_38030 ?auto_38031 ) ) ( not ( = ?auto_38030 ?auto_38032 ) ) ( not ( = ?auto_38031 ?auto_38032 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38031 ?auto_38032 )
      ( !STACK ?auto_38031 ?auto_38030 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38037 - BLOCK
      ?auto_38038 - BLOCK
      ?auto_38039 - BLOCK
      ?auto_38040 - BLOCK
    )
    :vars
    (
      ?auto_38041 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38039 ) ( ON ?auto_38040 ?auto_38041 ) ( CLEAR ?auto_38040 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38037 ) ( ON ?auto_38038 ?auto_38037 ) ( ON ?auto_38039 ?auto_38038 ) ( not ( = ?auto_38037 ?auto_38038 ) ) ( not ( = ?auto_38037 ?auto_38039 ) ) ( not ( = ?auto_38037 ?auto_38040 ) ) ( not ( = ?auto_38037 ?auto_38041 ) ) ( not ( = ?auto_38038 ?auto_38039 ) ) ( not ( = ?auto_38038 ?auto_38040 ) ) ( not ( = ?auto_38038 ?auto_38041 ) ) ( not ( = ?auto_38039 ?auto_38040 ) ) ( not ( = ?auto_38039 ?auto_38041 ) ) ( not ( = ?auto_38040 ?auto_38041 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38040 ?auto_38041 )
      ( !STACK ?auto_38040 ?auto_38039 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38046 - BLOCK
      ?auto_38047 - BLOCK
      ?auto_38048 - BLOCK
      ?auto_38049 - BLOCK
    )
    :vars
    (
      ?auto_38050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38049 ?auto_38050 ) ( ON-TABLE ?auto_38046 ) ( ON ?auto_38047 ?auto_38046 ) ( not ( = ?auto_38046 ?auto_38047 ) ) ( not ( = ?auto_38046 ?auto_38048 ) ) ( not ( = ?auto_38046 ?auto_38049 ) ) ( not ( = ?auto_38046 ?auto_38050 ) ) ( not ( = ?auto_38047 ?auto_38048 ) ) ( not ( = ?auto_38047 ?auto_38049 ) ) ( not ( = ?auto_38047 ?auto_38050 ) ) ( not ( = ?auto_38048 ?auto_38049 ) ) ( not ( = ?auto_38048 ?auto_38050 ) ) ( not ( = ?auto_38049 ?auto_38050 ) ) ( CLEAR ?auto_38047 ) ( ON ?auto_38048 ?auto_38049 ) ( CLEAR ?auto_38048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38046 ?auto_38047 ?auto_38048 )
      ( MAKE-4PILE ?auto_38046 ?auto_38047 ?auto_38048 ?auto_38049 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38055 - BLOCK
      ?auto_38056 - BLOCK
      ?auto_38057 - BLOCK
      ?auto_38058 - BLOCK
    )
    :vars
    (
      ?auto_38059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38058 ?auto_38059 ) ( ON-TABLE ?auto_38055 ) ( ON ?auto_38056 ?auto_38055 ) ( not ( = ?auto_38055 ?auto_38056 ) ) ( not ( = ?auto_38055 ?auto_38057 ) ) ( not ( = ?auto_38055 ?auto_38058 ) ) ( not ( = ?auto_38055 ?auto_38059 ) ) ( not ( = ?auto_38056 ?auto_38057 ) ) ( not ( = ?auto_38056 ?auto_38058 ) ) ( not ( = ?auto_38056 ?auto_38059 ) ) ( not ( = ?auto_38057 ?auto_38058 ) ) ( not ( = ?auto_38057 ?auto_38059 ) ) ( not ( = ?auto_38058 ?auto_38059 ) ) ( CLEAR ?auto_38056 ) ( ON ?auto_38057 ?auto_38058 ) ( CLEAR ?auto_38057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38055 ?auto_38056 ?auto_38057 )
      ( MAKE-4PILE ?auto_38055 ?auto_38056 ?auto_38057 ?auto_38058 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38064 - BLOCK
      ?auto_38065 - BLOCK
      ?auto_38066 - BLOCK
      ?auto_38067 - BLOCK
    )
    :vars
    (
      ?auto_38068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38067 ?auto_38068 ) ( ON-TABLE ?auto_38064 ) ( not ( = ?auto_38064 ?auto_38065 ) ) ( not ( = ?auto_38064 ?auto_38066 ) ) ( not ( = ?auto_38064 ?auto_38067 ) ) ( not ( = ?auto_38064 ?auto_38068 ) ) ( not ( = ?auto_38065 ?auto_38066 ) ) ( not ( = ?auto_38065 ?auto_38067 ) ) ( not ( = ?auto_38065 ?auto_38068 ) ) ( not ( = ?auto_38066 ?auto_38067 ) ) ( not ( = ?auto_38066 ?auto_38068 ) ) ( not ( = ?auto_38067 ?auto_38068 ) ) ( ON ?auto_38066 ?auto_38067 ) ( CLEAR ?auto_38064 ) ( ON ?auto_38065 ?auto_38066 ) ( CLEAR ?auto_38065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38064 ?auto_38065 )
      ( MAKE-4PILE ?auto_38064 ?auto_38065 ?auto_38066 ?auto_38067 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38073 - BLOCK
      ?auto_38074 - BLOCK
      ?auto_38075 - BLOCK
      ?auto_38076 - BLOCK
    )
    :vars
    (
      ?auto_38077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38076 ?auto_38077 ) ( ON-TABLE ?auto_38073 ) ( not ( = ?auto_38073 ?auto_38074 ) ) ( not ( = ?auto_38073 ?auto_38075 ) ) ( not ( = ?auto_38073 ?auto_38076 ) ) ( not ( = ?auto_38073 ?auto_38077 ) ) ( not ( = ?auto_38074 ?auto_38075 ) ) ( not ( = ?auto_38074 ?auto_38076 ) ) ( not ( = ?auto_38074 ?auto_38077 ) ) ( not ( = ?auto_38075 ?auto_38076 ) ) ( not ( = ?auto_38075 ?auto_38077 ) ) ( not ( = ?auto_38076 ?auto_38077 ) ) ( ON ?auto_38075 ?auto_38076 ) ( CLEAR ?auto_38073 ) ( ON ?auto_38074 ?auto_38075 ) ( CLEAR ?auto_38074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38073 ?auto_38074 )
      ( MAKE-4PILE ?auto_38073 ?auto_38074 ?auto_38075 ?auto_38076 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38082 - BLOCK
      ?auto_38083 - BLOCK
      ?auto_38084 - BLOCK
      ?auto_38085 - BLOCK
    )
    :vars
    (
      ?auto_38086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38085 ?auto_38086 ) ( not ( = ?auto_38082 ?auto_38083 ) ) ( not ( = ?auto_38082 ?auto_38084 ) ) ( not ( = ?auto_38082 ?auto_38085 ) ) ( not ( = ?auto_38082 ?auto_38086 ) ) ( not ( = ?auto_38083 ?auto_38084 ) ) ( not ( = ?auto_38083 ?auto_38085 ) ) ( not ( = ?auto_38083 ?auto_38086 ) ) ( not ( = ?auto_38084 ?auto_38085 ) ) ( not ( = ?auto_38084 ?auto_38086 ) ) ( not ( = ?auto_38085 ?auto_38086 ) ) ( ON ?auto_38084 ?auto_38085 ) ( ON ?auto_38083 ?auto_38084 ) ( ON ?auto_38082 ?auto_38083 ) ( CLEAR ?auto_38082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38082 )
      ( MAKE-4PILE ?auto_38082 ?auto_38083 ?auto_38084 ?auto_38085 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38091 - BLOCK
      ?auto_38092 - BLOCK
      ?auto_38093 - BLOCK
      ?auto_38094 - BLOCK
    )
    :vars
    (
      ?auto_38095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38094 ?auto_38095 ) ( not ( = ?auto_38091 ?auto_38092 ) ) ( not ( = ?auto_38091 ?auto_38093 ) ) ( not ( = ?auto_38091 ?auto_38094 ) ) ( not ( = ?auto_38091 ?auto_38095 ) ) ( not ( = ?auto_38092 ?auto_38093 ) ) ( not ( = ?auto_38092 ?auto_38094 ) ) ( not ( = ?auto_38092 ?auto_38095 ) ) ( not ( = ?auto_38093 ?auto_38094 ) ) ( not ( = ?auto_38093 ?auto_38095 ) ) ( not ( = ?auto_38094 ?auto_38095 ) ) ( ON ?auto_38093 ?auto_38094 ) ( ON ?auto_38092 ?auto_38093 ) ( ON ?auto_38091 ?auto_38092 ) ( CLEAR ?auto_38091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38091 )
      ( MAKE-4PILE ?auto_38091 ?auto_38092 ?auto_38093 ?auto_38094 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38101 - BLOCK
      ?auto_38102 - BLOCK
      ?auto_38103 - BLOCK
      ?auto_38104 - BLOCK
      ?auto_38105 - BLOCK
    )
    :vars
    (
      ?auto_38106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38104 ) ( ON ?auto_38105 ?auto_38106 ) ( CLEAR ?auto_38105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38101 ) ( ON ?auto_38102 ?auto_38101 ) ( ON ?auto_38103 ?auto_38102 ) ( ON ?auto_38104 ?auto_38103 ) ( not ( = ?auto_38101 ?auto_38102 ) ) ( not ( = ?auto_38101 ?auto_38103 ) ) ( not ( = ?auto_38101 ?auto_38104 ) ) ( not ( = ?auto_38101 ?auto_38105 ) ) ( not ( = ?auto_38101 ?auto_38106 ) ) ( not ( = ?auto_38102 ?auto_38103 ) ) ( not ( = ?auto_38102 ?auto_38104 ) ) ( not ( = ?auto_38102 ?auto_38105 ) ) ( not ( = ?auto_38102 ?auto_38106 ) ) ( not ( = ?auto_38103 ?auto_38104 ) ) ( not ( = ?auto_38103 ?auto_38105 ) ) ( not ( = ?auto_38103 ?auto_38106 ) ) ( not ( = ?auto_38104 ?auto_38105 ) ) ( not ( = ?auto_38104 ?auto_38106 ) ) ( not ( = ?auto_38105 ?auto_38106 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38105 ?auto_38106 )
      ( !STACK ?auto_38105 ?auto_38104 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38112 - BLOCK
      ?auto_38113 - BLOCK
      ?auto_38114 - BLOCK
      ?auto_38115 - BLOCK
      ?auto_38116 - BLOCK
    )
    :vars
    (
      ?auto_38117 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38115 ) ( ON ?auto_38116 ?auto_38117 ) ( CLEAR ?auto_38116 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38112 ) ( ON ?auto_38113 ?auto_38112 ) ( ON ?auto_38114 ?auto_38113 ) ( ON ?auto_38115 ?auto_38114 ) ( not ( = ?auto_38112 ?auto_38113 ) ) ( not ( = ?auto_38112 ?auto_38114 ) ) ( not ( = ?auto_38112 ?auto_38115 ) ) ( not ( = ?auto_38112 ?auto_38116 ) ) ( not ( = ?auto_38112 ?auto_38117 ) ) ( not ( = ?auto_38113 ?auto_38114 ) ) ( not ( = ?auto_38113 ?auto_38115 ) ) ( not ( = ?auto_38113 ?auto_38116 ) ) ( not ( = ?auto_38113 ?auto_38117 ) ) ( not ( = ?auto_38114 ?auto_38115 ) ) ( not ( = ?auto_38114 ?auto_38116 ) ) ( not ( = ?auto_38114 ?auto_38117 ) ) ( not ( = ?auto_38115 ?auto_38116 ) ) ( not ( = ?auto_38115 ?auto_38117 ) ) ( not ( = ?auto_38116 ?auto_38117 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38116 ?auto_38117 )
      ( !STACK ?auto_38116 ?auto_38115 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38123 - BLOCK
      ?auto_38124 - BLOCK
      ?auto_38125 - BLOCK
      ?auto_38126 - BLOCK
      ?auto_38127 - BLOCK
    )
    :vars
    (
      ?auto_38128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38127 ?auto_38128 ) ( ON-TABLE ?auto_38123 ) ( ON ?auto_38124 ?auto_38123 ) ( ON ?auto_38125 ?auto_38124 ) ( not ( = ?auto_38123 ?auto_38124 ) ) ( not ( = ?auto_38123 ?auto_38125 ) ) ( not ( = ?auto_38123 ?auto_38126 ) ) ( not ( = ?auto_38123 ?auto_38127 ) ) ( not ( = ?auto_38123 ?auto_38128 ) ) ( not ( = ?auto_38124 ?auto_38125 ) ) ( not ( = ?auto_38124 ?auto_38126 ) ) ( not ( = ?auto_38124 ?auto_38127 ) ) ( not ( = ?auto_38124 ?auto_38128 ) ) ( not ( = ?auto_38125 ?auto_38126 ) ) ( not ( = ?auto_38125 ?auto_38127 ) ) ( not ( = ?auto_38125 ?auto_38128 ) ) ( not ( = ?auto_38126 ?auto_38127 ) ) ( not ( = ?auto_38126 ?auto_38128 ) ) ( not ( = ?auto_38127 ?auto_38128 ) ) ( CLEAR ?auto_38125 ) ( ON ?auto_38126 ?auto_38127 ) ( CLEAR ?auto_38126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38123 ?auto_38124 ?auto_38125 ?auto_38126 )
      ( MAKE-5PILE ?auto_38123 ?auto_38124 ?auto_38125 ?auto_38126 ?auto_38127 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38134 - BLOCK
      ?auto_38135 - BLOCK
      ?auto_38136 - BLOCK
      ?auto_38137 - BLOCK
      ?auto_38138 - BLOCK
    )
    :vars
    (
      ?auto_38139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38138 ?auto_38139 ) ( ON-TABLE ?auto_38134 ) ( ON ?auto_38135 ?auto_38134 ) ( ON ?auto_38136 ?auto_38135 ) ( not ( = ?auto_38134 ?auto_38135 ) ) ( not ( = ?auto_38134 ?auto_38136 ) ) ( not ( = ?auto_38134 ?auto_38137 ) ) ( not ( = ?auto_38134 ?auto_38138 ) ) ( not ( = ?auto_38134 ?auto_38139 ) ) ( not ( = ?auto_38135 ?auto_38136 ) ) ( not ( = ?auto_38135 ?auto_38137 ) ) ( not ( = ?auto_38135 ?auto_38138 ) ) ( not ( = ?auto_38135 ?auto_38139 ) ) ( not ( = ?auto_38136 ?auto_38137 ) ) ( not ( = ?auto_38136 ?auto_38138 ) ) ( not ( = ?auto_38136 ?auto_38139 ) ) ( not ( = ?auto_38137 ?auto_38138 ) ) ( not ( = ?auto_38137 ?auto_38139 ) ) ( not ( = ?auto_38138 ?auto_38139 ) ) ( CLEAR ?auto_38136 ) ( ON ?auto_38137 ?auto_38138 ) ( CLEAR ?auto_38137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38134 ?auto_38135 ?auto_38136 ?auto_38137 )
      ( MAKE-5PILE ?auto_38134 ?auto_38135 ?auto_38136 ?auto_38137 ?auto_38138 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38145 - BLOCK
      ?auto_38146 - BLOCK
      ?auto_38147 - BLOCK
      ?auto_38148 - BLOCK
      ?auto_38149 - BLOCK
    )
    :vars
    (
      ?auto_38150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38149 ?auto_38150 ) ( ON-TABLE ?auto_38145 ) ( ON ?auto_38146 ?auto_38145 ) ( not ( = ?auto_38145 ?auto_38146 ) ) ( not ( = ?auto_38145 ?auto_38147 ) ) ( not ( = ?auto_38145 ?auto_38148 ) ) ( not ( = ?auto_38145 ?auto_38149 ) ) ( not ( = ?auto_38145 ?auto_38150 ) ) ( not ( = ?auto_38146 ?auto_38147 ) ) ( not ( = ?auto_38146 ?auto_38148 ) ) ( not ( = ?auto_38146 ?auto_38149 ) ) ( not ( = ?auto_38146 ?auto_38150 ) ) ( not ( = ?auto_38147 ?auto_38148 ) ) ( not ( = ?auto_38147 ?auto_38149 ) ) ( not ( = ?auto_38147 ?auto_38150 ) ) ( not ( = ?auto_38148 ?auto_38149 ) ) ( not ( = ?auto_38148 ?auto_38150 ) ) ( not ( = ?auto_38149 ?auto_38150 ) ) ( ON ?auto_38148 ?auto_38149 ) ( CLEAR ?auto_38146 ) ( ON ?auto_38147 ?auto_38148 ) ( CLEAR ?auto_38147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38145 ?auto_38146 ?auto_38147 )
      ( MAKE-5PILE ?auto_38145 ?auto_38146 ?auto_38147 ?auto_38148 ?auto_38149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38156 - BLOCK
      ?auto_38157 - BLOCK
      ?auto_38158 - BLOCK
      ?auto_38159 - BLOCK
      ?auto_38160 - BLOCK
    )
    :vars
    (
      ?auto_38161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38160 ?auto_38161 ) ( ON-TABLE ?auto_38156 ) ( ON ?auto_38157 ?auto_38156 ) ( not ( = ?auto_38156 ?auto_38157 ) ) ( not ( = ?auto_38156 ?auto_38158 ) ) ( not ( = ?auto_38156 ?auto_38159 ) ) ( not ( = ?auto_38156 ?auto_38160 ) ) ( not ( = ?auto_38156 ?auto_38161 ) ) ( not ( = ?auto_38157 ?auto_38158 ) ) ( not ( = ?auto_38157 ?auto_38159 ) ) ( not ( = ?auto_38157 ?auto_38160 ) ) ( not ( = ?auto_38157 ?auto_38161 ) ) ( not ( = ?auto_38158 ?auto_38159 ) ) ( not ( = ?auto_38158 ?auto_38160 ) ) ( not ( = ?auto_38158 ?auto_38161 ) ) ( not ( = ?auto_38159 ?auto_38160 ) ) ( not ( = ?auto_38159 ?auto_38161 ) ) ( not ( = ?auto_38160 ?auto_38161 ) ) ( ON ?auto_38159 ?auto_38160 ) ( CLEAR ?auto_38157 ) ( ON ?auto_38158 ?auto_38159 ) ( CLEAR ?auto_38158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38156 ?auto_38157 ?auto_38158 )
      ( MAKE-5PILE ?auto_38156 ?auto_38157 ?auto_38158 ?auto_38159 ?auto_38160 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38167 - BLOCK
      ?auto_38168 - BLOCK
      ?auto_38169 - BLOCK
      ?auto_38170 - BLOCK
      ?auto_38171 - BLOCK
    )
    :vars
    (
      ?auto_38172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38171 ?auto_38172 ) ( ON-TABLE ?auto_38167 ) ( not ( = ?auto_38167 ?auto_38168 ) ) ( not ( = ?auto_38167 ?auto_38169 ) ) ( not ( = ?auto_38167 ?auto_38170 ) ) ( not ( = ?auto_38167 ?auto_38171 ) ) ( not ( = ?auto_38167 ?auto_38172 ) ) ( not ( = ?auto_38168 ?auto_38169 ) ) ( not ( = ?auto_38168 ?auto_38170 ) ) ( not ( = ?auto_38168 ?auto_38171 ) ) ( not ( = ?auto_38168 ?auto_38172 ) ) ( not ( = ?auto_38169 ?auto_38170 ) ) ( not ( = ?auto_38169 ?auto_38171 ) ) ( not ( = ?auto_38169 ?auto_38172 ) ) ( not ( = ?auto_38170 ?auto_38171 ) ) ( not ( = ?auto_38170 ?auto_38172 ) ) ( not ( = ?auto_38171 ?auto_38172 ) ) ( ON ?auto_38170 ?auto_38171 ) ( ON ?auto_38169 ?auto_38170 ) ( CLEAR ?auto_38167 ) ( ON ?auto_38168 ?auto_38169 ) ( CLEAR ?auto_38168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38167 ?auto_38168 )
      ( MAKE-5PILE ?auto_38167 ?auto_38168 ?auto_38169 ?auto_38170 ?auto_38171 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38178 - BLOCK
      ?auto_38179 - BLOCK
      ?auto_38180 - BLOCK
      ?auto_38181 - BLOCK
      ?auto_38182 - BLOCK
    )
    :vars
    (
      ?auto_38183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38182 ?auto_38183 ) ( ON-TABLE ?auto_38178 ) ( not ( = ?auto_38178 ?auto_38179 ) ) ( not ( = ?auto_38178 ?auto_38180 ) ) ( not ( = ?auto_38178 ?auto_38181 ) ) ( not ( = ?auto_38178 ?auto_38182 ) ) ( not ( = ?auto_38178 ?auto_38183 ) ) ( not ( = ?auto_38179 ?auto_38180 ) ) ( not ( = ?auto_38179 ?auto_38181 ) ) ( not ( = ?auto_38179 ?auto_38182 ) ) ( not ( = ?auto_38179 ?auto_38183 ) ) ( not ( = ?auto_38180 ?auto_38181 ) ) ( not ( = ?auto_38180 ?auto_38182 ) ) ( not ( = ?auto_38180 ?auto_38183 ) ) ( not ( = ?auto_38181 ?auto_38182 ) ) ( not ( = ?auto_38181 ?auto_38183 ) ) ( not ( = ?auto_38182 ?auto_38183 ) ) ( ON ?auto_38181 ?auto_38182 ) ( ON ?auto_38180 ?auto_38181 ) ( CLEAR ?auto_38178 ) ( ON ?auto_38179 ?auto_38180 ) ( CLEAR ?auto_38179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38178 ?auto_38179 )
      ( MAKE-5PILE ?auto_38178 ?auto_38179 ?auto_38180 ?auto_38181 ?auto_38182 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38189 - BLOCK
      ?auto_38190 - BLOCK
      ?auto_38191 - BLOCK
      ?auto_38192 - BLOCK
      ?auto_38193 - BLOCK
    )
    :vars
    (
      ?auto_38194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38193 ?auto_38194 ) ( not ( = ?auto_38189 ?auto_38190 ) ) ( not ( = ?auto_38189 ?auto_38191 ) ) ( not ( = ?auto_38189 ?auto_38192 ) ) ( not ( = ?auto_38189 ?auto_38193 ) ) ( not ( = ?auto_38189 ?auto_38194 ) ) ( not ( = ?auto_38190 ?auto_38191 ) ) ( not ( = ?auto_38190 ?auto_38192 ) ) ( not ( = ?auto_38190 ?auto_38193 ) ) ( not ( = ?auto_38190 ?auto_38194 ) ) ( not ( = ?auto_38191 ?auto_38192 ) ) ( not ( = ?auto_38191 ?auto_38193 ) ) ( not ( = ?auto_38191 ?auto_38194 ) ) ( not ( = ?auto_38192 ?auto_38193 ) ) ( not ( = ?auto_38192 ?auto_38194 ) ) ( not ( = ?auto_38193 ?auto_38194 ) ) ( ON ?auto_38192 ?auto_38193 ) ( ON ?auto_38191 ?auto_38192 ) ( ON ?auto_38190 ?auto_38191 ) ( ON ?auto_38189 ?auto_38190 ) ( CLEAR ?auto_38189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38189 )
      ( MAKE-5PILE ?auto_38189 ?auto_38190 ?auto_38191 ?auto_38192 ?auto_38193 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38200 - BLOCK
      ?auto_38201 - BLOCK
      ?auto_38202 - BLOCK
      ?auto_38203 - BLOCK
      ?auto_38204 - BLOCK
    )
    :vars
    (
      ?auto_38205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38204 ?auto_38205 ) ( not ( = ?auto_38200 ?auto_38201 ) ) ( not ( = ?auto_38200 ?auto_38202 ) ) ( not ( = ?auto_38200 ?auto_38203 ) ) ( not ( = ?auto_38200 ?auto_38204 ) ) ( not ( = ?auto_38200 ?auto_38205 ) ) ( not ( = ?auto_38201 ?auto_38202 ) ) ( not ( = ?auto_38201 ?auto_38203 ) ) ( not ( = ?auto_38201 ?auto_38204 ) ) ( not ( = ?auto_38201 ?auto_38205 ) ) ( not ( = ?auto_38202 ?auto_38203 ) ) ( not ( = ?auto_38202 ?auto_38204 ) ) ( not ( = ?auto_38202 ?auto_38205 ) ) ( not ( = ?auto_38203 ?auto_38204 ) ) ( not ( = ?auto_38203 ?auto_38205 ) ) ( not ( = ?auto_38204 ?auto_38205 ) ) ( ON ?auto_38203 ?auto_38204 ) ( ON ?auto_38202 ?auto_38203 ) ( ON ?auto_38201 ?auto_38202 ) ( ON ?auto_38200 ?auto_38201 ) ( CLEAR ?auto_38200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38200 )
      ( MAKE-5PILE ?auto_38200 ?auto_38201 ?auto_38202 ?auto_38203 ?auto_38204 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38212 - BLOCK
      ?auto_38213 - BLOCK
      ?auto_38214 - BLOCK
      ?auto_38215 - BLOCK
      ?auto_38216 - BLOCK
      ?auto_38217 - BLOCK
    )
    :vars
    (
      ?auto_38218 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38216 ) ( ON ?auto_38217 ?auto_38218 ) ( CLEAR ?auto_38217 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38212 ) ( ON ?auto_38213 ?auto_38212 ) ( ON ?auto_38214 ?auto_38213 ) ( ON ?auto_38215 ?auto_38214 ) ( ON ?auto_38216 ?auto_38215 ) ( not ( = ?auto_38212 ?auto_38213 ) ) ( not ( = ?auto_38212 ?auto_38214 ) ) ( not ( = ?auto_38212 ?auto_38215 ) ) ( not ( = ?auto_38212 ?auto_38216 ) ) ( not ( = ?auto_38212 ?auto_38217 ) ) ( not ( = ?auto_38212 ?auto_38218 ) ) ( not ( = ?auto_38213 ?auto_38214 ) ) ( not ( = ?auto_38213 ?auto_38215 ) ) ( not ( = ?auto_38213 ?auto_38216 ) ) ( not ( = ?auto_38213 ?auto_38217 ) ) ( not ( = ?auto_38213 ?auto_38218 ) ) ( not ( = ?auto_38214 ?auto_38215 ) ) ( not ( = ?auto_38214 ?auto_38216 ) ) ( not ( = ?auto_38214 ?auto_38217 ) ) ( not ( = ?auto_38214 ?auto_38218 ) ) ( not ( = ?auto_38215 ?auto_38216 ) ) ( not ( = ?auto_38215 ?auto_38217 ) ) ( not ( = ?auto_38215 ?auto_38218 ) ) ( not ( = ?auto_38216 ?auto_38217 ) ) ( not ( = ?auto_38216 ?auto_38218 ) ) ( not ( = ?auto_38217 ?auto_38218 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38217 ?auto_38218 )
      ( !STACK ?auto_38217 ?auto_38216 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38225 - BLOCK
      ?auto_38226 - BLOCK
      ?auto_38227 - BLOCK
      ?auto_38228 - BLOCK
      ?auto_38229 - BLOCK
      ?auto_38230 - BLOCK
    )
    :vars
    (
      ?auto_38231 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38229 ) ( ON ?auto_38230 ?auto_38231 ) ( CLEAR ?auto_38230 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38225 ) ( ON ?auto_38226 ?auto_38225 ) ( ON ?auto_38227 ?auto_38226 ) ( ON ?auto_38228 ?auto_38227 ) ( ON ?auto_38229 ?auto_38228 ) ( not ( = ?auto_38225 ?auto_38226 ) ) ( not ( = ?auto_38225 ?auto_38227 ) ) ( not ( = ?auto_38225 ?auto_38228 ) ) ( not ( = ?auto_38225 ?auto_38229 ) ) ( not ( = ?auto_38225 ?auto_38230 ) ) ( not ( = ?auto_38225 ?auto_38231 ) ) ( not ( = ?auto_38226 ?auto_38227 ) ) ( not ( = ?auto_38226 ?auto_38228 ) ) ( not ( = ?auto_38226 ?auto_38229 ) ) ( not ( = ?auto_38226 ?auto_38230 ) ) ( not ( = ?auto_38226 ?auto_38231 ) ) ( not ( = ?auto_38227 ?auto_38228 ) ) ( not ( = ?auto_38227 ?auto_38229 ) ) ( not ( = ?auto_38227 ?auto_38230 ) ) ( not ( = ?auto_38227 ?auto_38231 ) ) ( not ( = ?auto_38228 ?auto_38229 ) ) ( not ( = ?auto_38228 ?auto_38230 ) ) ( not ( = ?auto_38228 ?auto_38231 ) ) ( not ( = ?auto_38229 ?auto_38230 ) ) ( not ( = ?auto_38229 ?auto_38231 ) ) ( not ( = ?auto_38230 ?auto_38231 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38230 ?auto_38231 )
      ( !STACK ?auto_38230 ?auto_38229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38238 - BLOCK
      ?auto_38239 - BLOCK
      ?auto_38240 - BLOCK
      ?auto_38241 - BLOCK
      ?auto_38242 - BLOCK
      ?auto_38243 - BLOCK
    )
    :vars
    (
      ?auto_38244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38243 ?auto_38244 ) ( ON-TABLE ?auto_38238 ) ( ON ?auto_38239 ?auto_38238 ) ( ON ?auto_38240 ?auto_38239 ) ( ON ?auto_38241 ?auto_38240 ) ( not ( = ?auto_38238 ?auto_38239 ) ) ( not ( = ?auto_38238 ?auto_38240 ) ) ( not ( = ?auto_38238 ?auto_38241 ) ) ( not ( = ?auto_38238 ?auto_38242 ) ) ( not ( = ?auto_38238 ?auto_38243 ) ) ( not ( = ?auto_38238 ?auto_38244 ) ) ( not ( = ?auto_38239 ?auto_38240 ) ) ( not ( = ?auto_38239 ?auto_38241 ) ) ( not ( = ?auto_38239 ?auto_38242 ) ) ( not ( = ?auto_38239 ?auto_38243 ) ) ( not ( = ?auto_38239 ?auto_38244 ) ) ( not ( = ?auto_38240 ?auto_38241 ) ) ( not ( = ?auto_38240 ?auto_38242 ) ) ( not ( = ?auto_38240 ?auto_38243 ) ) ( not ( = ?auto_38240 ?auto_38244 ) ) ( not ( = ?auto_38241 ?auto_38242 ) ) ( not ( = ?auto_38241 ?auto_38243 ) ) ( not ( = ?auto_38241 ?auto_38244 ) ) ( not ( = ?auto_38242 ?auto_38243 ) ) ( not ( = ?auto_38242 ?auto_38244 ) ) ( not ( = ?auto_38243 ?auto_38244 ) ) ( CLEAR ?auto_38241 ) ( ON ?auto_38242 ?auto_38243 ) ( CLEAR ?auto_38242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38238 ?auto_38239 ?auto_38240 ?auto_38241 ?auto_38242 )
      ( MAKE-6PILE ?auto_38238 ?auto_38239 ?auto_38240 ?auto_38241 ?auto_38242 ?auto_38243 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38251 - BLOCK
      ?auto_38252 - BLOCK
      ?auto_38253 - BLOCK
      ?auto_38254 - BLOCK
      ?auto_38255 - BLOCK
      ?auto_38256 - BLOCK
    )
    :vars
    (
      ?auto_38257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38256 ?auto_38257 ) ( ON-TABLE ?auto_38251 ) ( ON ?auto_38252 ?auto_38251 ) ( ON ?auto_38253 ?auto_38252 ) ( ON ?auto_38254 ?auto_38253 ) ( not ( = ?auto_38251 ?auto_38252 ) ) ( not ( = ?auto_38251 ?auto_38253 ) ) ( not ( = ?auto_38251 ?auto_38254 ) ) ( not ( = ?auto_38251 ?auto_38255 ) ) ( not ( = ?auto_38251 ?auto_38256 ) ) ( not ( = ?auto_38251 ?auto_38257 ) ) ( not ( = ?auto_38252 ?auto_38253 ) ) ( not ( = ?auto_38252 ?auto_38254 ) ) ( not ( = ?auto_38252 ?auto_38255 ) ) ( not ( = ?auto_38252 ?auto_38256 ) ) ( not ( = ?auto_38252 ?auto_38257 ) ) ( not ( = ?auto_38253 ?auto_38254 ) ) ( not ( = ?auto_38253 ?auto_38255 ) ) ( not ( = ?auto_38253 ?auto_38256 ) ) ( not ( = ?auto_38253 ?auto_38257 ) ) ( not ( = ?auto_38254 ?auto_38255 ) ) ( not ( = ?auto_38254 ?auto_38256 ) ) ( not ( = ?auto_38254 ?auto_38257 ) ) ( not ( = ?auto_38255 ?auto_38256 ) ) ( not ( = ?auto_38255 ?auto_38257 ) ) ( not ( = ?auto_38256 ?auto_38257 ) ) ( CLEAR ?auto_38254 ) ( ON ?auto_38255 ?auto_38256 ) ( CLEAR ?auto_38255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38251 ?auto_38252 ?auto_38253 ?auto_38254 ?auto_38255 )
      ( MAKE-6PILE ?auto_38251 ?auto_38252 ?auto_38253 ?auto_38254 ?auto_38255 ?auto_38256 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38264 - BLOCK
      ?auto_38265 - BLOCK
      ?auto_38266 - BLOCK
      ?auto_38267 - BLOCK
      ?auto_38268 - BLOCK
      ?auto_38269 - BLOCK
    )
    :vars
    (
      ?auto_38270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38269 ?auto_38270 ) ( ON-TABLE ?auto_38264 ) ( ON ?auto_38265 ?auto_38264 ) ( ON ?auto_38266 ?auto_38265 ) ( not ( = ?auto_38264 ?auto_38265 ) ) ( not ( = ?auto_38264 ?auto_38266 ) ) ( not ( = ?auto_38264 ?auto_38267 ) ) ( not ( = ?auto_38264 ?auto_38268 ) ) ( not ( = ?auto_38264 ?auto_38269 ) ) ( not ( = ?auto_38264 ?auto_38270 ) ) ( not ( = ?auto_38265 ?auto_38266 ) ) ( not ( = ?auto_38265 ?auto_38267 ) ) ( not ( = ?auto_38265 ?auto_38268 ) ) ( not ( = ?auto_38265 ?auto_38269 ) ) ( not ( = ?auto_38265 ?auto_38270 ) ) ( not ( = ?auto_38266 ?auto_38267 ) ) ( not ( = ?auto_38266 ?auto_38268 ) ) ( not ( = ?auto_38266 ?auto_38269 ) ) ( not ( = ?auto_38266 ?auto_38270 ) ) ( not ( = ?auto_38267 ?auto_38268 ) ) ( not ( = ?auto_38267 ?auto_38269 ) ) ( not ( = ?auto_38267 ?auto_38270 ) ) ( not ( = ?auto_38268 ?auto_38269 ) ) ( not ( = ?auto_38268 ?auto_38270 ) ) ( not ( = ?auto_38269 ?auto_38270 ) ) ( ON ?auto_38268 ?auto_38269 ) ( CLEAR ?auto_38266 ) ( ON ?auto_38267 ?auto_38268 ) ( CLEAR ?auto_38267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38264 ?auto_38265 ?auto_38266 ?auto_38267 )
      ( MAKE-6PILE ?auto_38264 ?auto_38265 ?auto_38266 ?auto_38267 ?auto_38268 ?auto_38269 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38277 - BLOCK
      ?auto_38278 - BLOCK
      ?auto_38279 - BLOCK
      ?auto_38280 - BLOCK
      ?auto_38281 - BLOCK
      ?auto_38282 - BLOCK
    )
    :vars
    (
      ?auto_38283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38282 ?auto_38283 ) ( ON-TABLE ?auto_38277 ) ( ON ?auto_38278 ?auto_38277 ) ( ON ?auto_38279 ?auto_38278 ) ( not ( = ?auto_38277 ?auto_38278 ) ) ( not ( = ?auto_38277 ?auto_38279 ) ) ( not ( = ?auto_38277 ?auto_38280 ) ) ( not ( = ?auto_38277 ?auto_38281 ) ) ( not ( = ?auto_38277 ?auto_38282 ) ) ( not ( = ?auto_38277 ?auto_38283 ) ) ( not ( = ?auto_38278 ?auto_38279 ) ) ( not ( = ?auto_38278 ?auto_38280 ) ) ( not ( = ?auto_38278 ?auto_38281 ) ) ( not ( = ?auto_38278 ?auto_38282 ) ) ( not ( = ?auto_38278 ?auto_38283 ) ) ( not ( = ?auto_38279 ?auto_38280 ) ) ( not ( = ?auto_38279 ?auto_38281 ) ) ( not ( = ?auto_38279 ?auto_38282 ) ) ( not ( = ?auto_38279 ?auto_38283 ) ) ( not ( = ?auto_38280 ?auto_38281 ) ) ( not ( = ?auto_38280 ?auto_38282 ) ) ( not ( = ?auto_38280 ?auto_38283 ) ) ( not ( = ?auto_38281 ?auto_38282 ) ) ( not ( = ?auto_38281 ?auto_38283 ) ) ( not ( = ?auto_38282 ?auto_38283 ) ) ( ON ?auto_38281 ?auto_38282 ) ( CLEAR ?auto_38279 ) ( ON ?auto_38280 ?auto_38281 ) ( CLEAR ?auto_38280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38277 ?auto_38278 ?auto_38279 ?auto_38280 )
      ( MAKE-6PILE ?auto_38277 ?auto_38278 ?auto_38279 ?auto_38280 ?auto_38281 ?auto_38282 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38290 - BLOCK
      ?auto_38291 - BLOCK
      ?auto_38292 - BLOCK
      ?auto_38293 - BLOCK
      ?auto_38294 - BLOCK
      ?auto_38295 - BLOCK
    )
    :vars
    (
      ?auto_38296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38295 ?auto_38296 ) ( ON-TABLE ?auto_38290 ) ( ON ?auto_38291 ?auto_38290 ) ( not ( = ?auto_38290 ?auto_38291 ) ) ( not ( = ?auto_38290 ?auto_38292 ) ) ( not ( = ?auto_38290 ?auto_38293 ) ) ( not ( = ?auto_38290 ?auto_38294 ) ) ( not ( = ?auto_38290 ?auto_38295 ) ) ( not ( = ?auto_38290 ?auto_38296 ) ) ( not ( = ?auto_38291 ?auto_38292 ) ) ( not ( = ?auto_38291 ?auto_38293 ) ) ( not ( = ?auto_38291 ?auto_38294 ) ) ( not ( = ?auto_38291 ?auto_38295 ) ) ( not ( = ?auto_38291 ?auto_38296 ) ) ( not ( = ?auto_38292 ?auto_38293 ) ) ( not ( = ?auto_38292 ?auto_38294 ) ) ( not ( = ?auto_38292 ?auto_38295 ) ) ( not ( = ?auto_38292 ?auto_38296 ) ) ( not ( = ?auto_38293 ?auto_38294 ) ) ( not ( = ?auto_38293 ?auto_38295 ) ) ( not ( = ?auto_38293 ?auto_38296 ) ) ( not ( = ?auto_38294 ?auto_38295 ) ) ( not ( = ?auto_38294 ?auto_38296 ) ) ( not ( = ?auto_38295 ?auto_38296 ) ) ( ON ?auto_38294 ?auto_38295 ) ( ON ?auto_38293 ?auto_38294 ) ( CLEAR ?auto_38291 ) ( ON ?auto_38292 ?auto_38293 ) ( CLEAR ?auto_38292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38290 ?auto_38291 ?auto_38292 )
      ( MAKE-6PILE ?auto_38290 ?auto_38291 ?auto_38292 ?auto_38293 ?auto_38294 ?auto_38295 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38303 - BLOCK
      ?auto_38304 - BLOCK
      ?auto_38305 - BLOCK
      ?auto_38306 - BLOCK
      ?auto_38307 - BLOCK
      ?auto_38308 - BLOCK
    )
    :vars
    (
      ?auto_38309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38308 ?auto_38309 ) ( ON-TABLE ?auto_38303 ) ( ON ?auto_38304 ?auto_38303 ) ( not ( = ?auto_38303 ?auto_38304 ) ) ( not ( = ?auto_38303 ?auto_38305 ) ) ( not ( = ?auto_38303 ?auto_38306 ) ) ( not ( = ?auto_38303 ?auto_38307 ) ) ( not ( = ?auto_38303 ?auto_38308 ) ) ( not ( = ?auto_38303 ?auto_38309 ) ) ( not ( = ?auto_38304 ?auto_38305 ) ) ( not ( = ?auto_38304 ?auto_38306 ) ) ( not ( = ?auto_38304 ?auto_38307 ) ) ( not ( = ?auto_38304 ?auto_38308 ) ) ( not ( = ?auto_38304 ?auto_38309 ) ) ( not ( = ?auto_38305 ?auto_38306 ) ) ( not ( = ?auto_38305 ?auto_38307 ) ) ( not ( = ?auto_38305 ?auto_38308 ) ) ( not ( = ?auto_38305 ?auto_38309 ) ) ( not ( = ?auto_38306 ?auto_38307 ) ) ( not ( = ?auto_38306 ?auto_38308 ) ) ( not ( = ?auto_38306 ?auto_38309 ) ) ( not ( = ?auto_38307 ?auto_38308 ) ) ( not ( = ?auto_38307 ?auto_38309 ) ) ( not ( = ?auto_38308 ?auto_38309 ) ) ( ON ?auto_38307 ?auto_38308 ) ( ON ?auto_38306 ?auto_38307 ) ( CLEAR ?auto_38304 ) ( ON ?auto_38305 ?auto_38306 ) ( CLEAR ?auto_38305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38303 ?auto_38304 ?auto_38305 )
      ( MAKE-6PILE ?auto_38303 ?auto_38304 ?auto_38305 ?auto_38306 ?auto_38307 ?auto_38308 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38316 - BLOCK
      ?auto_38317 - BLOCK
      ?auto_38318 - BLOCK
      ?auto_38319 - BLOCK
      ?auto_38320 - BLOCK
      ?auto_38321 - BLOCK
    )
    :vars
    (
      ?auto_38322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38321 ?auto_38322 ) ( ON-TABLE ?auto_38316 ) ( not ( = ?auto_38316 ?auto_38317 ) ) ( not ( = ?auto_38316 ?auto_38318 ) ) ( not ( = ?auto_38316 ?auto_38319 ) ) ( not ( = ?auto_38316 ?auto_38320 ) ) ( not ( = ?auto_38316 ?auto_38321 ) ) ( not ( = ?auto_38316 ?auto_38322 ) ) ( not ( = ?auto_38317 ?auto_38318 ) ) ( not ( = ?auto_38317 ?auto_38319 ) ) ( not ( = ?auto_38317 ?auto_38320 ) ) ( not ( = ?auto_38317 ?auto_38321 ) ) ( not ( = ?auto_38317 ?auto_38322 ) ) ( not ( = ?auto_38318 ?auto_38319 ) ) ( not ( = ?auto_38318 ?auto_38320 ) ) ( not ( = ?auto_38318 ?auto_38321 ) ) ( not ( = ?auto_38318 ?auto_38322 ) ) ( not ( = ?auto_38319 ?auto_38320 ) ) ( not ( = ?auto_38319 ?auto_38321 ) ) ( not ( = ?auto_38319 ?auto_38322 ) ) ( not ( = ?auto_38320 ?auto_38321 ) ) ( not ( = ?auto_38320 ?auto_38322 ) ) ( not ( = ?auto_38321 ?auto_38322 ) ) ( ON ?auto_38320 ?auto_38321 ) ( ON ?auto_38319 ?auto_38320 ) ( ON ?auto_38318 ?auto_38319 ) ( CLEAR ?auto_38316 ) ( ON ?auto_38317 ?auto_38318 ) ( CLEAR ?auto_38317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38316 ?auto_38317 )
      ( MAKE-6PILE ?auto_38316 ?auto_38317 ?auto_38318 ?auto_38319 ?auto_38320 ?auto_38321 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38329 - BLOCK
      ?auto_38330 - BLOCK
      ?auto_38331 - BLOCK
      ?auto_38332 - BLOCK
      ?auto_38333 - BLOCK
      ?auto_38334 - BLOCK
    )
    :vars
    (
      ?auto_38335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38334 ?auto_38335 ) ( ON-TABLE ?auto_38329 ) ( not ( = ?auto_38329 ?auto_38330 ) ) ( not ( = ?auto_38329 ?auto_38331 ) ) ( not ( = ?auto_38329 ?auto_38332 ) ) ( not ( = ?auto_38329 ?auto_38333 ) ) ( not ( = ?auto_38329 ?auto_38334 ) ) ( not ( = ?auto_38329 ?auto_38335 ) ) ( not ( = ?auto_38330 ?auto_38331 ) ) ( not ( = ?auto_38330 ?auto_38332 ) ) ( not ( = ?auto_38330 ?auto_38333 ) ) ( not ( = ?auto_38330 ?auto_38334 ) ) ( not ( = ?auto_38330 ?auto_38335 ) ) ( not ( = ?auto_38331 ?auto_38332 ) ) ( not ( = ?auto_38331 ?auto_38333 ) ) ( not ( = ?auto_38331 ?auto_38334 ) ) ( not ( = ?auto_38331 ?auto_38335 ) ) ( not ( = ?auto_38332 ?auto_38333 ) ) ( not ( = ?auto_38332 ?auto_38334 ) ) ( not ( = ?auto_38332 ?auto_38335 ) ) ( not ( = ?auto_38333 ?auto_38334 ) ) ( not ( = ?auto_38333 ?auto_38335 ) ) ( not ( = ?auto_38334 ?auto_38335 ) ) ( ON ?auto_38333 ?auto_38334 ) ( ON ?auto_38332 ?auto_38333 ) ( ON ?auto_38331 ?auto_38332 ) ( CLEAR ?auto_38329 ) ( ON ?auto_38330 ?auto_38331 ) ( CLEAR ?auto_38330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38329 ?auto_38330 )
      ( MAKE-6PILE ?auto_38329 ?auto_38330 ?auto_38331 ?auto_38332 ?auto_38333 ?auto_38334 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38342 - BLOCK
      ?auto_38343 - BLOCK
      ?auto_38344 - BLOCK
      ?auto_38345 - BLOCK
      ?auto_38346 - BLOCK
      ?auto_38347 - BLOCK
    )
    :vars
    (
      ?auto_38348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38347 ?auto_38348 ) ( not ( = ?auto_38342 ?auto_38343 ) ) ( not ( = ?auto_38342 ?auto_38344 ) ) ( not ( = ?auto_38342 ?auto_38345 ) ) ( not ( = ?auto_38342 ?auto_38346 ) ) ( not ( = ?auto_38342 ?auto_38347 ) ) ( not ( = ?auto_38342 ?auto_38348 ) ) ( not ( = ?auto_38343 ?auto_38344 ) ) ( not ( = ?auto_38343 ?auto_38345 ) ) ( not ( = ?auto_38343 ?auto_38346 ) ) ( not ( = ?auto_38343 ?auto_38347 ) ) ( not ( = ?auto_38343 ?auto_38348 ) ) ( not ( = ?auto_38344 ?auto_38345 ) ) ( not ( = ?auto_38344 ?auto_38346 ) ) ( not ( = ?auto_38344 ?auto_38347 ) ) ( not ( = ?auto_38344 ?auto_38348 ) ) ( not ( = ?auto_38345 ?auto_38346 ) ) ( not ( = ?auto_38345 ?auto_38347 ) ) ( not ( = ?auto_38345 ?auto_38348 ) ) ( not ( = ?auto_38346 ?auto_38347 ) ) ( not ( = ?auto_38346 ?auto_38348 ) ) ( not ( = ?auto_38347 ?auto_38348 ) ) ( ON ?auto_38346 ?auto_38347 ) ( ON ?auto_38345 ?auto_38346 ) ( ON ?auto_38344 ?auto_38345 ) ( ON ?auto_38343 ?auto_38344 ) ( ON ?auto_38342 ?auto_38343 ) ( CLEAR ?auto_38342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38342 )
      ( MAKE-6PILE ?auto_38342 ?auto_38343 ?auto_38344 ?auto_38345 ?auto_38346 ?auto_38347 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38355 - BLOCK
      ?auto_38356 - BLOCK
      ?auto_38357 - BLOCK
      ?auto_38358 - BLOCK
      ?auto_38359 - BLOCK
      ?auto_38360 - BLOCK
    )
    :vars
    (
      ?auto_38361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38360 ?auto_38361 ) ( not ( = ?auto_38355 ?auto_38356 ) ) ( not ( = ?auto_38355 ?auto_38357 ) ) ( not ( = ?auto_38355 ?auto_38358 ) ) ( not ( = ?auto_38355 ?auto_38359 ) ) ( not ( = ?auto_38355 ?auto_38360 ) ) ( not ( = ?auto_38355 ?auto_38361 ) ) ( not ( = ?auto_38356 ?auto_38357 ) ) ( not ( = ?auto_38356 ?auto_38358 ) ) ( not ( = ?auto_38356 ?auto_38359 ) ) ( not ( = ?auto_38356 ?auto_38360 ) ) ( not ( = ?auto_38356 ?auto_38361 ) ) ( not ( = ?auto_38357 ?auto_38358 ) ) ( not ( = ?auto_38357 ?auto_38359 ) ) ( not ( = ?auto_38357 ?auto_38360 ) ) ( not ( = ?auto_38357 ?auto_38361 ) ) ( not ( = ?auto_38358 ?auto_38359 ) ) ( not ( = ?auto_38358 ?auto_38360 ) ) ( not ( = ?auto_38358 ?auto_38361 ) ) ( not ( = ?auto_38359 ?auto_38360 ) ) ( not ( = ?auto_38359 ?auto_38361 ) ) ( not ( = ?auto_38360 ?auto_38361 ) ) ( ON ?auto_38359 ?auto_38360 ) ( ON ?auto_38358 ?auto_38359 ) ( ON ?auto_38357 ?auto_38358 ) ( ON ?auto_38356 ?auto_38357 ) ( ON ?auto_38355 ?auto_38356 ) ( CLEAR ?auto_38355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38355 )
      ( MAKE-6PILE ?auto_38355 ?auto_38356 ?auto_38357 ?auto_38358 ?auto_38359 ?auto_38360 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38369 - BLOCK
      ?auto_38370 - BLOCK
      ?auto_38371 - BLOCK
      ?auto_38372 - BLOCK
      ?auto_38373 - BLOCK
      ?auto_38374 - BLOCK
      ?auto_38375 - BLOCK
    )
    :vars
    (
      ?auto_38376 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38374 ) ( ON ?auto_38375 ?auto_38376 ) ( CLEAR ?auto_38375 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38369 ) ( ON ?auto_38370 ?auto_38369 ) ( ON ?auto_38371 ?auto_38370 ) ( ON ?auto_38372 ?auto_38371 ) ( ON ?auto_38373 ?auto_38372 ) ( ON ?auto_38374 ?auto_38373 ) ( not ( = ?auto_38369 ?auto_38370 ) ) ( not ( = ?auto_38369 ?auto_38371 ) ) ( not ( = ?auto_38369 ?auto_38372 ) ) ( not ( = ?auto_38369 ?auto_38373 ) ) ( not ( = ?auto_38369 ?auto_38374 ) ) ( not ( = ?auto_38369 ?auto_38375 ) ) ( not ( = ?auto_38369 ?auto_38376 ) ) ( not ( = ?auto_38370 ?auto_38371 ) ) ( not ( = ?auto_38370 ?auto_38372 ) ) ( not ( = ?auto_38370 ?auto_38373 ) ) ( not ( = ?auto_38370 ?auto_38374 ) ) ( not ( = ?auto_38370 ?auto_38375 ) ) ( not ( = ?auto_38370 ?auto_38376 ) ) ( not ( = ?auto_38371 ?auto_38372 ) ) ( not ( = ?auto_38371 ?auto_38373 ) ) ( not ( = ?auto_38371 ?auto_38374 ) ) ( not ( = ?auto_38371 ?auto_38375 ) ) ( not ( = ?auto_38371 ?auto_38376 ) ) ( not ( = ?auto_38372 ?auto_38373 ) ) ( not ( = ?auto_38372 ?auto_38374 ) ) ( not ( = ?auto_38372 ?auto_38375 ) ) ( not ( = ?auto_38372 ?auto_38376 ) ) ( not ( = ?auto_38373 ?auto_38374 ) ) ( not ( = ?auto_38373 ?auto_38375 ) ) ( not ( = ?auto_38373 ?auto_38376 ) ) ( not ( = ?auto_38374 ?auto_38375 ) ) ( not ( = ?auto_38374 ?auto_38376 ) ) ( not ( = ?auto_38375 ?auto_38376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38375 ?auto_38376 )
      ( !STACK ?auto_38375 ?auto_38374 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38384 - BLOCK
      ?auto_38385 - BLOCK
      ?auto_38386 - BLOCK
      ?auto_38387 - BLOCK
      ?auto_38388 - BLOCK
      ?auto_38389 - BLOCK
      ?auto_38390 - BLOCK
    )
    :vars
    (
      ?auto_38391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38389 ) ( ON ?auto_38390 ?auto_38391 ) ( CLEAR ?auto_38390 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38384 ) ( ON ?auto_38385 ?auto_38384 ) ( ON ?auto_38386 ?auto_38385 ) ( ON ?auto_38387 ?auto_38386 ) ( ON ?auto_38388 ?auto_38387 ) ( ON ?auto_38389 ?auto_38388 ) ( not ( = ?auto_38384 ?auto_38385 ) ) ( not ( = ?auto_38384 ?auto_38386 ) ) ( not ( = ?auto_38384 ?auto_38387 ) ) ( not ( = ?auto_38384 ?auto_38388 ) ) ( not ( = ?auto_38384 ?auto_38389 ) ) ( not ( = ?auto_38384 ?auto_38390 ) ) ( not ( = ?auto_38384 ?auto_38391 ) ) ( not ( = ?auto_38385 ?auto_38386 ) ) ( not ( = ?auto_38385 ?auto_38387 ) ) ( not ( = ?auto_38385 ?auto_38388 ) ) ( not ( = ?auto_38385 ?auto_38389 ) ) ( not ( = ?auto_38385 ?auto_38390 ) ) ( not ( = ?auto_38385 ?auto_38391 ) ) ( not ( = ?auto_38386 ?auto_38387 ) ) ( not ( = ?auto_38386 ?auto_38388 ) ) ( not ( = ?auto_38386 ?auto_38389 ) ) ( not ( = ?auto_38386 ?auto_38390 ) ) ( not ( = ?auto_38386 ?auto_38391 ) ) ( not ( = ?auto_38387 ?auto_38388 ) ) ( not ( = ?auto_38387 ?auto_38389 ) ) ( not ( = ?auto_38387 ?auto_38390 ) ) ( not ( = ?auto_38387 ?auto_38391 ) ) ( not ( = ?auto_38388 ?auto_38389 ) ) ( not ( = ?auto_38388 ?auto_38390 ) ) ( not ( = ?auto_38388 ?auto_38391 ) ) ( not ( = ?auto_38389 ?auto_38390 ) ) ( not ( = ?auto_38389 ?auto_38391 ) ) ( not ( = ?auto_38390 ?auto_38391 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38390 ?auto_38391 )
      ( !STACK ?auto_38390 ?auto_38389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38399 - BLOCK
      ?auto_38400 - BLOCK
      ?auto_38401 - BLOCK
      ?auto_38402 - BLOCK
      ?auto_38403 - BLOCK
      ?auto_38404 - BLOCK
      ?auto_38405 - BLOCK
    )
    :vars
    (
      ?auto_38406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38405 ?auto_38406 ) ( ON-TABLE ?auto_38399 ) ( ON ?auto_38400 ?auto_38399 ) ( ON ?auto_38401 ?auto_38400 ) ( ON ?auto_38402 ?auto_38401 ) ( ON ?auto_38403 ?auto_38402 ) ( not ( = ?auto_38399 ?auto_38400 ) ) ( not ( = ?auto_38399 ?auto_38401 ) ) ( not ( = ?auto_38399 ?auto_38402 ) ) ( not ( = ?auto_38399 ?auto_38403 ) ) ( not ( = ?auto_38399 ?auto_38404 ) ) ( not ( = ?auto_38399 ?auto_38405 ) ) ( not ( = ?auto_38399 ?auto_38406 ) ) ( not ( = ?auto_38400 ?auto_38401 ) ) ( not ( = ?auto_38400 ?auto_38402 ) ) ( not ( = ?auto_38400 ?auto_38403 ) ) ( not ( = ?auto_38400 ?auto_38404 ) ) ( not ( = ?auto_38400 ?auto_38405 ) ) ( not ( = ?auto_38400 ?auto_38406 ) ) ( not ( = ?auto_38401 ?auto_38402 ) ) ( not ( = ?auto_38401 ?auto_38403 ) ) ( not ( = ?auto_38401 ?auto_38404 ) ) ( not ( = ?auto_38401 ?auto_38405 ) ) ( not ( = ?auto_38401 ?auto_38406 ) ) ( not ( = ?auto_38402 ?auto_38403 ) ) ( not ( = ?auto_38402 ?auto_38404 ) ) ( not ( = ?auto_38402 ?auto_38405 ) ) ( not ( = ?auto_38402 ?auto_38406 ) ) ( not ( = ?auto_38403 ?auto_38404 ) ) ( not ( = ?auto_38403 ?auto_38405 ) ) ( not ( = ?auto_38403 ?auto_38406 ) ) ( not ( = ?auto_38404 ?auto_38405 ) ) ( not ( = ?auto_38404 ?auto_38406 ) ) ( not ( = ?auto_38405 ?auto_38406 ) ) ( CLEAR ?auto_38403 ) ( ON ?auto_38404 ?auto_38405 ) ( CLEAR ?auto_38404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_38399 ?auto_38400 ?auto_38401 ?auto_38402 ?auto_38403 ?auto_38404 )
      ( MAKE-7PILE ?auto_38399 ?auto_38400 ?auto_38401 ?auto_38402 ?auto_38403 ?auto_38404 ?auto_38405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38414 - BLOCK
      ?auto_38415 - BLOCK
      ?auto_38416 - BLOCK
      ?auto_38417 - BLOCK
      ?auto_38418 - BLOCK
      ?auto_38419 - BLOCK
      ?auto_38420 - BLOCK
    )
    :vars
    (
      ?auto_38421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38420 ?auto_38421 ) ( ON-TABLE ?auto_38414 ) ( ON ?auto_38415 ?auto_38414 ) ( ON ?auto_38416 ?auto_38415 ) ( ON ?auto_38417 ?auto_38416 ) ( ON ?auto_38418 ?auto_38417 ) ( not ( = ?auto_38414 ?auto_38415 ) ) ( not ( = ?auto_38414 ?auto_38416 ) ) ( not ( = ?auto_38414 ?auto_38417 ) ) ( not ( = ?auto_38414 ?auto_38418 ) ) ( not ( = ?auto_38414 ?auto_38419 ) ) ( not ( = ?auto_38414 ?auto_38420 ) ) ( not ( = ?auto_38414 ?auto_38421 ) ) ( not ( = ?auto_38415 ?auto_38416 ) ) ( not ( = ?auto_38415 ?auto_38417 ) ) ( not ( = ?auto_38415 ?auto_38418 ) ) ( not ( = ?auto_38415 ?auto_38419 ) ) ( not ( = ?auto_38415 ?auto_38420 ) ) ( not ( = ?auto_38415 ?auto_38421 ) ) ( not ( = ?auto_38416 ?auto_38417 ) ) ( not ( = ?auto_38416 ?auto_38418 ) ) ( not ( = ?auto_38416 ?auto_38419 ) ) ( not ( = ?auto_38416 ?auto_38420 ) ) ( not ( = ?auto_38416 ?auto_38421 ) ) ( not ( = ?auto_38417 ?auto_38418 ) ) ( not ( = ?auto_38417 ?auto_38419 ) ) ( not ( = ?auto_38417 ?auto_38420 ) ) ( not ( = ?auto_38417 ?auto_38421 ) ) ( not ( = ?auto_38418 ?auto_38419 ) ) ( not ( = ?auto_38418 ?auto_38420 ) ) ( not ( = ?auto_38418 ?auto_38421 ) ) ( not ( = ?auto_38419 ?auto_38420 ) ) ( not ( = ?auto_38419 ?auto_38421 ) ) ( not ( = ?auto_38420 ?auto_38421 ) ) ( CLEAR ?auto_38418 ) ( ON ?auto_38419 ?auto_38420 ) ( CLEAR ?auto_38419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_38414 ?auto_38415 ?auto_38416 ?auto_38417 ?auto_38418 ?auto_38419 )
      ( MAKE-7PILE ?auto_38414 ?auto_38415 ?auto_38416 ?auto_38417 ?auto_38418 ?auto_38419 ?auto_38420 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38429 - BLOCK
      ?auto_38430 - BLOCK
      ?auto_38431 - BLOCK
      ?auto_38432 - BLOCK
      ?auto_38433 - BLOCK
      ?auto_38434 - BLOCK
      ?auto_38435 - BLOCK
    )
    :vars
    (
      ?auto_38436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38435 ?auto_38436 ) ( ON-TABLE ?auto_38429 ) ( ON ?auto_38430 ?auto_38429 ) ( ON ?auto_38431 ?auto_38430 ) ( ON ?auto_38432 ?auto_38431 ) ( not ( = ?auto_38429 ?auto_38430 ) ) ( not ( = ?auto_38429 ?auto_38431 ) ) ( not ( = ?auto_38429 ?auto_38432 ) ) ( not ( = ?auto_38429 ?auto_38433 ) ) ( not ( = ?auto_38429 ?auto_38434 ) ) ( not ( = ?auto_38429 ?auto_38435 ) ) ( not ( = ?auto_38429 ?auto_38436 ) ) ( not ( = ?auto_38430 ?auto_38431 ) ) ( not ( = ?auto_38430 ?auto_38432 ) ) ( not ( = ?auto_38430 ?auto_38433 ) ) ( not ( = ?auto_38430 ?auto_38434 ) ) ( not ( = ?auto_38430 ?auto_38435 ) ) ( not ( = ?auto_38430 ?auto_38436 ) ) ( not ( = ?auto_38431 ?auto_38432 ) ) ( not ( = ?auto_38431 ?auto_38433 ) ) ( not ( = ?auto_38431 ?auto_38434 ) ) ( not ( = ?auto_38431 ?auto_38435 ) ) ( not ( = ?auto_38431 ?auto_38436 ) ) ( not ( = ?auto_38432 ?auto_38433 ) ) ( not ( = ?auto_38432 ?auto_38434 ) ) ( not ( = ?auto_38432 ?auto_38435 ) ) ( not ( = ?auto_38432 ?auto_38436 ) ) ( not ( = ?auto_38433 ?auto_38434 ) ) ( not ( = ?auto_38433 ?auto_38435 ) ) ( not ( = ?auto_38433 ?auto_38436 ) ) ( not ( = ?auto_38434 ?auto_38435 ) ) ( not ( = ?auto_38434 ?auto_38436 ) ) ( not ( = ?auto_38435 ?auto_38436 ) ) ( ON ?auto_38434 ?auto_38435 ) ( CLEAR ?auto_38432 ) ( ON ?auto_38433 ?auto_38434 ) ( CLEAR ?auto_38433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38429 ?auto_38430 ?auto_38431 ?auto_38432 ?auto_38433 )
      ( MAKE-7PILE ?auto_38429 ?auto_38430 ?auto_38431 ?auto_38432 ?auto_38433 ?auto_38434 ?auto_38435 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38444 - BLOCK
      ?auto_38445 - BLOCK
      ?auto_38446 - BLOCK
      ?auto_38447 - BLOCK
      ?auto_38448 - BLOCK
      ?auto_38449 - BLOCK
      ?auto_38450 - BLOCK
    )
    :vars
    (
      ?auto_38451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38450 ?auto_38451 ) ( ON-TABLE ?auto_38444 ) ( ON ?auto_38445 ?auto_38444 ) ( ON ?auto_38446 ?auto_38445 ) ( ON ?auto_38447 ?auto_38446 ) ( not ( = ?auto_38444 ?auto_38445 ) ) ( not ( = ?auto_38444 ?auto_38446 ) ) ( not ( = ?auto_38444 ?auto_38447 ) ) ( not ( = ?auto_38444 ?auto_38448 ) ) ( not ( = ?auto_38444 ?auto_38449 ) ) ( not ( = ?auto_38444 ?auto_38450 ) ) ( not ( = ?auto_38444 ?auto_38451 ) ) ( not ( = ?auto_38445 ?auto_38446 ) ) ( not ( = ?auto_38445 ?auto_38447 ) ) ( not ( = ?auto_38445 ?auto_38448 ) ) ( not ( = ?auto_38445 ?auto_38449 ) ) ( not ( = ?auto_38445 ?auto_38450 ) ) ( not ( = ?auto_38445 ?auto_38451 ) ) ( not ( = ?auto_38446 ?auto_38447 ) ) ( not ( = ?auto_38446 ?auto_38448 ) ) ( not ( = ?auto_38446 ?auto_38449 ) ) ( not ( = ?auto_38446 ?auto_38450 ) ) ( not ( = ?auto_38446 ?auto_38451 ) ) ( not ( = ?auto_38447 ?auto_38448 ) ) ( not ( = ?auto_38447 ?auto_38449 ) ) ( not ( = ?auto_38447 ?auto_38450 ) ) ( not ( = ?auto_38447 ?auto_38451 ) ) ( not ( = ?auto_38448 ?auto_38449 ) ) ( not ( = ?auto_38448 ?auto_38450 ) ) ( not ( = ?auto_38448 ?auto_38451 ) ) ( not ( = ?auto_38449 ?auto_38450 ) ) ( not ( = ?auto_38449 ?auto_38451 ) ) ( not ( = ?auto_38450 ?auto_38451 ) ) ( ON ?auto_38449 ?auto_38450 ) ( CLEAR ?auto_38447 ) ( ON ?auto_38448 ?auto_38449 ) ( CLEAR ?auto_38448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38444 ?auto_38445 ?auto_38446 ?auto_38447 ?auto_38448 )
      ( MAKE-7PILE ?auto_38444 ?auto_38445 ?auto_38446 ?auto_38447 ?auto_38448 ?auto_38449 ?auto_38450 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38459 - BLOCK
      ?auto_38460 - BLOCK
      ?auto_38461 - BLOCK
      ?auto_38462 - BLOCK
      ?auto_38463 - BLOCK
      ?auto_38464 - BLOCK
      ?auto_38465 - BLOCK
    )
    :vars
    (
      ?auto_38466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38465 ?auto_38466 ) ( ON-TABLE ?auto_38459 ) ( ON ?auto_38460 ?auto_38459 ) ( ON ?auto_38461 ?auto_38460 ) ( not ( = ?auto_38459 ?auto_38460 ) ) ( not ( = ?auto_38459 ?auto_38461 ) ) ( not ( = ?auto_38459 ?auto_38462 ) ) ( not ( = ?auto_38459 ?auto_38463 ) ) ( not ( = ?auto_38459 ?auto_38464 ) ) ( not ( = ?auto_38459 ?auto_38465 ) ) ( not ( = ?auto_38459 ?auto_38466 ) ) ( not ( = ?auto_38460 ?auto_38461 ) ) ( not ( = ?auto_38460 ?auto_38462 ) ) ( not ( = ?auto_38460 ?auto_38463 ) ) ( not ( = ?auto_38460 ?auto_38464 ) ) ( not ( = ?auto_38460 ?auto_38465 ) ) ( not ( = ?auto_38460 ?auto_38466 ) ) ( not ( = ?auto_38461 ?auto_38462 ) ) ( not ( = ?auto_38461 ?auto_38463 ) ) ( not ( = ?auto_38461 ?auto_38464 ) ) ( not ( = ?auto_38461 ?auto_38465 ) ) ( not ( = ?auto_38461 ?auto_38466 ) ) ( not ( = ?auto_38462 ?auto_38463 ) ) ( not ( = ?auto_38462 ?auto_38464 ) ) ( not ( = ?auto_38462 ?auto_38465 ) ) ( not ( = ?auto_38462 ?auto_38466 ) ) ( not ( = ?auto_38463 ?auto_38464 ) ) ( not ( = ?auto_38463 ?auto_38465 ) ) ( not ( = ?auto_38463 ?auto_38466 ) ) ( not ( = ?auto_38464 ?auto_38465 ) ) ( not ( = ?auto_38464 ?auto_38466 ) ) ( not ( = ?auto_38465 ?auto_38466 ) ) ( ON ?auto_38464 ?auto_38465 ) ( ON ?auto_38463 ?auto_38464 ) ( CLEAR ?auto_38461 ) ( ON ?auto_38462 ?auto_38463 ) ( CLEAR ?auto_38462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38459 ?auto_38460 ?auto_38461 ?auto_38462 )
      ( MAKE-7PILE ?auto_38459 ?auto_38460 ?auto_38461 ?auto_38462 ?auto_38463 ?auto_38464 ?auto_38465 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38474 - BLOCK
      ?auto_38475 - BLOCK
      ?auto_38476 - BLOCK
      ?auto_38477 - BLOCK
      ?auto_38478 - BLOCK
      ?auto_38479 - BLOCK
      ?auto_38480 - BLOCK
    )
    :vars
    (
      ?auto_38481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38480 ?auto_38481 ) ( ON-TABLE ?auto_38474 ) ( ON ?auto_38475 ?auto_38474 ) ( ON ?auto_38476 ?auto_38475 ) ( not ( = ?auto_38474 ?auto_38475 ) ) ( not ( = ?auto_38474 ?auto_38476 ) ) ( not ( = ?auto_38474 ?auto_38477 ) ) ( not ( = ?auto_38474 ?auto_38478 ) ) ( not ( = ?auto_38474 ?auto_38479 ) ) ( not ( = ?auto_38474 ?auto_38480 ) ) ( not ( = ?auto_38474 ?auto_38481 ) ) ( not ( = ?auto_38475 ?auto_38476 ) ) ( not ( = ?auto_38475 ?auto_38477 ) ) ( not ( = ?auto_38475 ?auto_38478 ) ) ( not ( = ?auto_38475 ?auto_38479 ) ) ( not ( = ?auto_38475 ?auto_38480 ) ) ( not ( = ?auto_38475 ?auto_38481 ) ) ( not ( = ?auto_38476 ?auto_38477 ) ) ( not ( = ?auto_38476 ?auto_38478 ) ) ( not ( = ?auto_38476 ?auto_38479 ) ) ( not ( = ?auto_38476 ?auto_38480 ) ) ( not ( = ?auto_38476 ?auto_38481 ) ) ( not ( = ?auto_38477 ?auto_38478 ) ) ( not ( = ?auto_38477 ?auto_38479 ) ) ( not ( = ?auto_38477 ?auto_38480 ) ) ( not ( = ?auto_38477 ?auto_38481 ) ) ( not ( = ?auto_38478 ?auto_38479 ) ) ( not ( = ?auto_38478 ?auto_38480 ) ) ( not ( = ?auto_38478 ?auto_38481 ) ) ( not ( = ?auto_38479 ?auto_38480 ) ) ( not ( = ?auto_38479 ?auto_38481 ) ) ( not ( = ?auto_38480 ?auto_38481 ) ) ( ON ?auto_38479 ?auto_38480 ) ( ON ?auto_38478 ?auto_38479 ) ( CLEAR ?auto_38476 ) ( ON ?auto_38477 ?auto_38478 ) ( CLEAR ?auto_38477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38474 ?auto_38475 ?auto_38476 ?auto_38477 )
      ( MAKE-7PILE ?auto_38474 ?auto_38475 ?auto_38476 ?auto_38477 ?auto_38478 ?auto_38479 ?auto_38480 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38489 - BLOCK
      ?auto_38490 - BLOCK
      ?auto_38491 - BLOCK
      ?auto_38492 - BLOCK
      ?auto_38493 - BLOCK
      ?auto_38494 - BLOCK
      ?auto_38495 - BLOCK
    )
    :vars
    (
      ?auto_38496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38495 ?auto_38496 ) ( ON-TABLE ?auto_38489 ) ( ON ?auto_38490 ?auto_38489 ) ( not ( = ?auto_38489 ?auto_38490 ) ) ( not ( = ?auto_38489 ?auto_38491 ) ) ( not ( = ?auto_38489 ?auto_38492 ) ) ( not ( = ?auto_38489 ?auto_38493 ) ) ( not ( = ?auto_38489 ?auto_38494 ) ) ( not ( = ?auto_38489 ?auto_38495 ) ) ( not ( = ?auto_38489 ?auto_38496 ) ) ( not ( = ?auto_38490 ?auto_38491 ) ) ( not ( = ?auto_38490 ?auto_38492 ) ) ( not ( = ?auto_38490 ?auto_38493 ) ) ( not ( = ?auto_38490 ?auto_38494 ) ) ( not ( = ?auto_38490 ?auto_38495 ) ) ( not ( = ?auto_38490 ?auto_38496 ) ) ( not ( = ?auto_38491 ?auto_38492 ) ) ( not ( = ?auto_38491 ?auto_38493 ) ) ( not ( = ?auto_38491 ?auto_38494 ) ) ( not ( = ?auto_38491 ?auto_38495 ) ) ( not ( = ?auto_38491 ?auto_38496 ) ) ( not ( = ?auto_38492 ?auto_38493 ) ) ( not ( = ?auto_38492 ?auto_38494 ) ) ( not ( = ?auto_38492 ?auto_38495 ) ) ( not ( = ?auto_38492 ?auto_38496 ) ) ( not ( = ?auto_38493 ?auto_38494 ) ) ( not ( = ?auto_38493 ?auto_38495 ) ) ( not ( = ?auto_38493 ?auto_38496 ) ) ( not ( = ?auto_38494 ?auto_38495 ) ) ( not ( = ?auto_38494 ?auto_38496 ) ) ( not ( = ?auto_38495 ?auto_38496 ) ) ( ON ?auto_38494 ?auto_38495 ) ( ON ?auto_38493 ?auto_38494 ) ( ON ?auto_38492 ?auto_38493 ) ( CLEAR ?auto_38490 ) ( ON ?auto_38491 ?auto_38492 ) ( CLEAR ?auto_38491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38489 ?auto_38490 ?auto_38491 )
      ( MAKE-7PILE ?auto_38489 ?auto_38490 ?auto_38491 ?auto_38492 ?auto_38493 ?auto_38494 ?auto_38495 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38504 - BLOCK
      ?auto_38505 - BLOCK
      ?auto_38506 - BLOCK
      ?auto_38507 - BLOCK
      ?auto_38508 - BLOCK
      ?auto_38509 - BLOCK
      ?auto_38510 - BLOCK
    )
    :vars
    (
      ?auto_38511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38510 ?auto_38511 ) ( ON-TABLE ?auto_38504 ) ( ON ?auto_38505 ?auto_38504 ) ( not ( = ?auto_38504 ?auto_38505 ) ) ( not ( = ?auto_38504 ?auto_38506 ) ) ( not ( = ?auto_38504 ?auto_38507 ) ) ( not ( = ?auto_38504 ?auto_38508 ) ) ( not ( = ?auto_38504 ?auto_38509 ) ) ( not ( = ?auto_38504 ?auto_38510 ) ) ( not ( = ?auto_38504 ?auto_38511 ) ) ( not ( = ?auto_38505 ?auto_38506 ) ) ( not ( = ?auto_38505 ?auto_38507 ) ) ( not ( = ?auto_38505 ?auto_38508 ) ) ( not ( = ?auto_38505 ?auto_38509 ) ) ( not ( = ?auto_38505 ?auto_38510 ) ) ( not ( = ?auto_38505 ?auto_38511 ) ) ( not ( = ?auto_38506 ?auto_38507 ) ) ( not ( = ?auto_38506 ?auto_38508 ) ) ( not ( = ?auto_38506 ?auto_38509 ) ) ( not ( = ?auto_38506 ?auto_38510 ) ) ( not ( = ?auto_38506 ?auto_38511 ) ) ( not ( = ?auto_38507 ?auto_38508 ) ) ( not ( = ?auto_38507 ?auto_38509 ) ) ( not ( = ?auto_38507 ?auto_38510 ) ) ( not ( = ?auto_38507 ?auto_38511 ) ) ( not ( = ?auto_38508 ?auto_38509 ) ) ( not ( = ?auto_38508 ?auto_38510 ) ) ( not ( = ?auto_38508 ?auto_38511 ) ) ( not ( = ?auto_38509 ?auto_38510 ) ) ( not ( = ?auto_38509 ?auto_38511 ) ) ( not ( = ?auto_38510 ?auto_38511 ) ) ( ON ?auto_38509 ?auto_38510 ) ( ON ?auto_38508 ?auto_38509 ) ( ON ?auto_38507 ?auto_38508 ) ( CLEAR ?auto_38505 ) ( ON ?auto_38506 ?auto_38507 ) ( CLEAR ?auto_38506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38504 ?auto_38505 ?auto_38506 )
      ( MAKE-7PILE ?auto_38504 ?auto_38505 ?auto_38506 ?auto_38507 ?auto_38508 ?auto_38509 ?auto_38510 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38519 - BLOCK
      ?auto_38520 - BLOCK
      ?auto_38521 - BLOCK
      ?auto_38522 - BLOCK
      ?auto_38523 - BLOCK
      ?auto_38524 - BLOCK
      ?auto_38525 - BLOCK
    )
    :vars
    (
      ?auto_38526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38525 ?auto_38526 ) ( ON-TABLE ?auto_38519 ) ( not ( = ?auto_38519 ?auto_38520 ) ) ( not ( = ?auto_38519 ?auto_38521 ) ) ( not ( = ?auto_38519 ?auto_38522 ) ) ( not ( = ?auto_38519 ?auto_38523 ) ) ( not ( = ?auto_38519 ?auto_38524 ) ) ( not ( = ?auto_38519 ?auto_38525 ) ) ( not ( = ?auto_38519 ?auto_38526 ) ) ( not ( = ?auto_38520 ?auto_38521 ) ) ( not ( = ?auto_38520 ?auto_38522 ) ) ( not ( = ?auto_38520 ?auto_38523 ) ) ( not ( = ?auto_38520 ?auto_38524 ) ) ( not ( = ?auto_38520 ?auto_38525 ) ) ( not ( = ?auto_38520 ?auto_38526 ) ) ( not ( = ?auto_38521 ?auto_38522 ) ) ( not ( = ?auto_38521 ?auto_38523 ) ) ( not ( = ?auto_38521 ?auto_38524 ) ) ( not ( = ?auto_38521 ?auto_38525 ) ) ( not ( = ?auto_38521 ?auto_38526 ) ) ( not ( = ?auto_38522 ?auto_38523 ) ) ( not ( = ?auto_38522 ?auto_38524 ) ) ( not ( = ?auto_38522 ?auto_38525 ) ) ( not ( = ?auto_38522 ?auto_38526 ) ) ( not ( = ?auto_38523 ?auto_38524 ) ) ( not ( = ?auto_38523 ?auto_38525 ) ) ( not ( = ?auto_38523 ?auto_38526 ) ) ( not ( = ?auto_38524 ?auto_38525 ) ) ( not ( = ?auto_38524 ?auto_38526 ) ) ( not ( = ?auto_38525 ?auto_38526 ) ) ( ON ?auto_38524 ?auto_38525 ) ( ON ?auto_38523 ?auto_38524 ) ( ON ?auto_38522 ?auto_38523 ) ( ON ?auto_38521 ?auto_38522 ) ( CLEAR ?auto_38519 ) ( ON ?auto_38520 ?auto_38521 ) ( CLEAR ?auto_38520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38519 ?auto_38520 )
      ( MAKE-7PILE ?auto_38519 ?auto_38520 ?auto_38521 ?auto_38522 ?auto_38523 ?auto_38524 ?auto_38525 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38534 - BLOCK
      ?auto_38535 - BLOCK
      ?auto_38536 - BLOCK
      ?auto_38537 - BLOCK
      ?auto_38538 - BLOCK
      ?auto_38539 - BLOCK
      ?auto_38540 - BLOCK
    )
    :vars
    (
      ?auto_38541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38540 ?auto_38541 ) ( ON-TABLE ?auto_38534 ) ( not ( = ?auto_38534 ?auto_38535 ) ) ( not ( = ?auto_38534 ?auto_38536 ) ) ( not ( = ?auto_38534 ?auto_38537 ) ) ( not ( = ?auto_38534 ?auto_38538 ) ) ( not ( = ?auto_38534 ?auto_38539 ) ) ( not ( = ?auto_38534 ?auto_38540 ) ) ( not ( = ?auto_38534 ?auto_38541 ) ) ( not ( = ?auto_38535 ?auto_38536 ) ) ( not ( = ?auto_38535 ?auto_38537 ) ) ( not ( = ?auto_38535 ?auto_38538 ) ) ( not ( = ?auto_38535 ?auto_38539 ) ) ( not ( = ?auto_38535 ?auto_38540 ) ) ( not ( = ?auto_38535 ?auto_38541 ) ) ( not ( = ?auto_38536 ?auto_38537 ) ) ( not ( = ?auto_38536 ?auto_38538 ) ) ( not ( = ?auto_38536 ?auto_38539 ) ) ( not ( = ?auto_38536 ?auto_38540 ) ) ( not ( = ?auto_38536 ?auto_38541 ) ) ( not ( = ?auto_38537 ?auto_38538 ) ) ( not ( = ?auto_38537 ?auto_38539 ) ) ( not ( = ?auto_38537 ?auto_38540 ) ) ( not ( = ?auto_38537 ?auto_38541 ) ) ( not ( = ?auto_38538 ?auto_38539 ) ) ( not ( = ?auto_38538 ?auto_38540 ) ) ( not ( = ?auto_38538 ?auto_38541 ) ) ( not ( = ?auto_38539 ?auto_38540 ) ) ( not ( = ?auto_38539 ?auto_38541 ) ) ( not ( = ?auto_38540 ?auto_38541 ) ) ( ON ?auto_38539 ?auto_38540 ) ( ON ?auto_38538 ?auto_38539 ) ( ON ?auto_38537 ?auto_38538 ) ( ON ?auto_38536 ?auto_38537 ) ( CLEAR ?auto_38534 ) ( ON ?auto_38535 ?auto_38536 ) ( CLEAR ?auto_38535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38534 ?auto_38535 )
      ( MAKE-7PILE ?auto_38534 ?auto_38535 ?auto_38536 ?auto_38537 ?auto_38538 ?auto_38539 ?auto_38540 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38549 - BLOCK
      ?auto_38550 - BLOCK
      ?auto_38551 - BLOCK
      ?auto_38552 - BLOCK
      ?auto_38553 - BLOCK
      ?auto_38554 - BLOCK
      ?auto_38555 - BLOCK
    )
    :vars
    (
      ?auto_38556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38555 ?auto_38556 ) ( not ( = ?auto_38549 ?auto_38550 ) ) ( not ( = ?auto_38549 ?auto_38551 ) ) ( not ( = ?auto_38549 ?auto_38552 ) ) ( not ( = ?auto_38549 ?auto_38553 ) ) ( not ( = ?auto_38549 ?auto_38554 ) ) ( not ( = ?auto_38549 ?auto_38555 ) ) ( not ( = ?auto_38549 ?auto_38556 ) ) ( not ( = ?auto_38550 ?auto_38551 ) ) ( not ( = ?auto_38550 ?auto_38552 ) ) ( not ( = ?auto_38550 ?auto_38553 ) ) ( not ( = ?auto_38550 ?auto_38554 ) ) ( not ( = ?auto_38550 ?auto_38555 ) ) ( not ( = ?auto_38550 ?auto_38556 ) ) ( not ( = ?auto_38551 ?auto_38552 ) ) ( not ( = ?auto_38551 ?auto_38553 ) ) ( not ( = ?auto_38551 ?auto_38554 ) ) ( not ( = ?auto_38551 ?auto_38555 ) ) ( not ( = ?auto_38551 ?auto_38556 ) ) ( not ( = ?auto_38552 ?auto_38553 ) ) ( not ( = ?auto_38552 ?auto_38554 ) ) ( not ( = ?auto_38552 ?auto_38555 ) ) ( not ( = ?auto_38552 ?auto_38556 ) ) ( not ( = ?auto_38553 ?auto_38554 ) ) ( not ( = ?auto_38553 ?auto_38555 ) ) ( not ( = ?auto_38553 ?auto_38556 ) ) ( not ( = ?auto_38554 ?auto_38555 ) ) ( not ( = ?auto_38554 ?auto_38556 ) ) ( not ( = ?auto_38555 ?auto_38556 ) ) ( ON ?auto_38554 ?auto_38555 ) ( ON ?auto_38553 ?auto_38554 ) ( ON ?auto_38552 ?auto_38553 ) ( ON ?auto_38551 ?auto_38552 ) ( ON ?auto_38550 ?auto_38551 ) ( ON ?auto_38549 ?auto_38550 ) ( CLEAR ?auto_38549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38549 )
      ( MAKE-7PILE ?auto_38549 ?auto_38550 ?auto_38551 ?auto_38552 ?auto_38553 ?auto_38554 ?auto_38555 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_38564 - BLOCK
      ?auto_38565 - BLOCK
      ?auto_38566 - BLOCK
      ?auto_38567 - BLOCK
      ?auto_38568 - BLOCK
      ?auto_38569 - BLOCK
      ?auto_38570 - BLOCK
    )
    :vars
    (
      ?auto_38571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38570 ?auto_38571 ) ( not ( = ?auto_38564 ?auto_38565 ) ) ( not ( = ?auto_38564 ?auto_38566 ) ) ( not ( = ?auto_38564 ?auto_38567 ) ) ( not ( = ?auto_38564 ?auto_38568 ) ) ( not ( = ?auto_38564 ?auto_38569 ) ) ( not ( = ?auto_38564 ?auto_38570 ) ) ( not ( = ?auto_38564 ?auto_38571 ) ) ( not ( = ?auto_38565 ?auto_38566 ) ) ( not ( = ?auto_38565 ?auto_38567 ) ) ( not ( = ?auto_38565 ?auto_38568 ) ) ( not ( = ?auto_38565 ?auto_38569 ) ) ( not ( = ?auto_38565 ?auto_38570 ) ) ( not ( = ?auto_38565 ?auto_38571 ) ) ( not ( = ?auto_38566 ?auto_38567 ) ) ( not ( = ?auto_38566 ?auto_38568 ) ) ( not ( = ?auto_38566 ?auto_38569 ) ) ( not ( = ?auto_38566 ?auto_38570 ) ) ( not ( = ?auto_38566 ?auto_38571 ) ) ( not ( = ?auto_38567 ?auto_38568 ) ) ( not ( = ?auto_38567 ?auto_38569 ) ) ( not ( = ?auto_38567 ?auto_38570 ) ) ( not ( = ?auto_38567 ?auto_38571 ) ) ( not ( = ?auto_38568 ?auto_38569 ) ) ( not ( = ?auto_38568 ?auto_38570 ) ) ( not ( = ?auto_38568 ?auto_38571 ) ) ( not ( = ?auto_38569 ?auto_38570 ) ) ( not ( = ?auto_38569 ?auto_38571 ) ) ( not ( = ?auto_38570 ?auto_38571 ) ) ( ON ?auto_38569 ?auto_38570 ) ( ON ?auto_38568 ?auto_38569 ) ( ON ?auto_38567 ?auto_38568 ) ( ON ?auto_38566 ?auto_38567 ) ( ON ?auto_38565 ?auto_38566 ) ( ON ?auto_38564 ?auto_38565 ) ( CLEAR ?auto_38564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38564 )
      ( MAKE-7PILE ?auto_38564 ?auto_38565 ?auto_38566 ?auto_38567 ?auto_38568 ?auto_38569 ?auto_38570 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38580 - BLOCK
      ?auto_38581 - BLOCK
      ?auto_38582 - BLOCK
      ?auto_38583 - BLOCK
      ?auto_38584 - BLOCK
      ?auto_38585 - BLOCK
      ?auto_38586 - BLOCK
      ?auto_38587 - BLOCK
    )
    :vars
    (
      ?auto_38588 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38586 ) ( ON ?auto_38587 ?auto_38588 ) ( CLEAR ?auto_38587 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38580 ) ( ON ?auto_38581 ?auto_38580 ) ( ON ?auto_38582 ?auto_38581 ) ( ON ?auto_38583 ?auto_38582 ) ( ON ?auto_38584 ?auto_38583 ) ( ON ?auto_38585 ?auto_38584 ) ( ON ?auto_38586 ?auto_38585 ) ( not ( = ?auto_38580 ?auto_38581 ) ) ( not ( = ?auto_38580 ?auto_38582 ) ) ( not ( = ?auto_38580 ?auto_38583 ) ) ( not ( = ?auto_38580 ?auto_38584 ) ) ( not ( = ?auto_38580 ?auto_38585 ) ) ( not ( = ?auto_38580 ?auto_38586 ) ) ( not ( = ?auto_38580 ?auto_38587 ) ) ( not ( = ?auto_38580 ?auto_38588 ) ) ( not ( = ?auto_38581 ?auto_38582 ) ) ( not ( = ?auto_38581 ?auto_38583 ) ) ( not ( = ?auto_38581 ?auto_38584 ) ) ( not ( = ?auto_38581 ?auto_38585 ) ) ( not ( = ?auto_38581 ?auto_38586 ) ) ( not ( = ?auto_38581 ?auto_38587 ) ) ( not ( = ?auto_38581 ?auto_38588 ) ) ( not ( = ?auto_38582 ?auto_38583 ) ) ( not ( = ?auto_38582 ?auto_38584 ) ) ( not ( = ?auto_38582 ?auto_38585 ) ) ( not ( = ?auto_38582 ?auto_38586 ) ) ( not ( = ?auto_38582 ?auto_38587 ) ) ( not ( = ?auto_38582 ?auto_38588 ) ) ( not ( = ?auto_38583 ?auto_38584 ) ) ( not ( = ?auto_38583 ?auto_38585 ) ) ( not ( = ?auto_38583 ?auto_38586 ) ) ( not ( = ?auto_38583 ?auto_38587 ) ) ( not ( = ?auto_38583 ?auto_38588 ) ) ( not ( = ?auto_38584 ?auto_38585 ) ) ( not ( = ?auto_38584 ?auto_38586 ) ) ( not ( = ?auto_38584 ?auto_38587 ) ) ( not ( = ?auto_38584 ?auto_38588 ) ) ( not ( = ?auto_38585 ?auto_38586 ) ) ( not ( = ?auto_38585 ?auto_38587 ) ) ( not ( = ?auto_38585 ?auto_38588 ) ) ( not ( = ?auto_38586 ?auto_38587 ) ) ( not ( = ?auto_38586 ?auto_38588 ) ) ( not ( = ?auto_38587 ?auto_38588 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38587 ?auto_38588 )
      ( !STACK ?auto_38587 ?auto_38586 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38597 - BLOCK
      ?auto_38598 - BLOCK
      ?auto_38599 - BLOCK
      ?auto_38600 - BLOCK
      ?auto_38601 - BLOCK
      ?auto_38602 - BLOCK
      ?auto_38603 - BLOCK
      ?auto_38604 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38603 ) ( ON-TABLE ?auto_38604 ) ( CLEAR ?auto_38604 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38597 ) ( ON ?auto_38598 ?auto_38597 ) ( ON ?auto_38599 ?auto_38598 ) ( ON ?auto_38600 ?auto_38599 ) ( ON ?auto_38601 ?auto_38600 ) ( ON ?auto_38602 ?auto_38601 ) ( ON ?auto_38603 ?auto_38602 ) ( not ( = ?auto_38597 ?auto_38598 ) ) ( not ( = ?auto_38597 ?auto_38599 ) ) ( not ( = ?auto_38597 ?auto_38600 ) ) ( not ( = ?auto_38597 ?auto_38601 ) ) ( not ( = ?auto_38597 ?auto_38602 ) ) ( not ( = ?auto_38597 ?auto_38603 ) ) ( not ( = ?auto_38597 ?auto_38604 ) ) ( not ( = ?auto_38598 ?auto_38599 ) ) ( not ( = ?auto_38598 ?auto_38600 ) ) ( not ( = ?auto_38598 ?auto_38601 ) ) ( not ( = ?auto_38598 ?auto_38602 ) ) ( not ( = ?auto_38598 ?auto_38603 ) ) ( not ( = ?auto_38598 ?auto_38604 ) ) ( not ( = ?auto_38599 ?auto_38600 ) ) ( not ( = ?auto_38599 ?auto_38601 ) ) ( not ( = ?auto_38599 ?auto_38602 ) ) ( not ( = ?auto_38599 ?auto_38603 ) ) ( not ( = ?auto_38599 ?auto_38604 ) ) ( not ( = ?auto_38600 ?auto_38601 ) ) ( not ( = ?auto_38600 ?auto_38602 ) ) ( not ( = ?auto_38600 ?auto_38603 ) ) ( not ( = ?auto_38600 ?auto_38604 ) ) ( not ( = ?auto_38601 ?auto_38602 ) ) ( not ( = ?auto_38601 ?auto_38603 ) ) ( not ( = ?auto_38601 ?auto_38604 ) ) ( not ( = ?auto_38602 ?auto_38603 ) ) ( not ( = ?auto_38602 ?auto_38604 ) ) ( not ( = ?auto_38603 ?auto_38604 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_38604 )
      ( !STACK ?auto_38604 ?auto_38603 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38613 - BLOCK
      ?auto_38614 - BLOCK
      ?auto_38615 - BLOCK
      ?auto_38616 - BLOCK
      ?auto_38617 - BLOCK
      ?auto_38618 - BLOCK
      ?auto_38619 - BLOCK
      ?auto_38620 - BLOCK
    )
    :vars
    (
      ?auto_38621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38620 ?auto_38621 ) ( ON-TABLE ?auto_38613 ) ( ON ?auto_38614 ?auto_38613 ) ( ON ?auto_38615 ?auto_38614 ) ( ON ?auto_38616 ?auto_38615 ) ( ON ?auto_38617 ?auto_38616 ) ( ON ?auto_38618 ?auto_38617 ) ( not ( = ?auto_38613 ?auto_38614 ) ) ( not ( = ?auto_38613 ?auto_38615 ) ) ( not ( = ?auto_38613 ?auto_38616 ) ) ( not ( = ?auto_38613 ?auto_38617 ) ) ( not ( = ?auto_38613 ?auto_38618 ) ) ( not ( = ?auto_38613 ?auto_38619 ) ) ( not ( = ?auto_38613 ?auto_38620 ) ) ( not ( = ?auto_38613 ?auto_38621 ) ) ( not ( = ?auto_38614 ?auto_38615 ) ) ( not ( = ?auto_38614 ?auto_38616 ) ) ( not ( = ?auto_38614 ?auto_38617 ) ) ( not ( = ?auto_38614 ?auto_38618 ) ) ( not ( = ?auto_38614 ?auto_38619 ) ) ( not ( = ?auto_38614 ?auto_38620 ) ) ( not ( = ?auto_38614 ?auto_38621 ) ) ( not ( = ?auto_38615 ?auto_38616 ) ) ( not ( = ?auto_38615 ?auto_38617 ) ) ( not ( = ?auto_38615 ?auto_38618 ) ) ( not ( = ?auto_38615 ?auto_38619 ) ) ( not ( = ?auto_38615 ?auto_38620 ) ) ( not ( = ?auto_38615 ?auto_38621 ) ) ( not ( = ?auto_38616 ?auto_38617 ) ) ( not ( = ?auto_38616 ?auto_38618 ) ) ( not ( = ?auto_38616 ?auto_38619 ) ) ( not ( = ?auto_38616 ?auto_38620 ) ) ( not ( = ?auto_38616 ?auto_38621 ) ) ( not ( = ?auto_38617 ?auto_38618 ) ) ( not ( = ?auto_38617 ?auto_38619 ) ) ( not ( = ?auto_38617 ?auto_38620 ) ) ( not ( = ?auto_38617 ?auto_38621 ) ) ( not ( = ?auto_38618 ?auto_38619 ) ) ( not ( = ?auto_38618 ?auto_38620 ) ) ( not ( = ?auto_38618 ?auto_38621 ) ) ( not ( = ?auto_38619 ?auto_38620 ) ) ( not ( = ?auto_38619 ?auto_38621 ) ) ( not ( = ?auto_38620 ?auto_38621 ) ) ( CLEAR ?auto_38618 ) ( ON ?auto_38619 ?auto_38620 ) ( CLEAR ?auto_38619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_38613 ?auto_38614 ?auto_38615 ?auto_38616 ?auto_38617 ?auto_38618 ?auto_38619 )
      ( MAKE-8PILE ?auto_38613 ?auto_38614 ?auto_38615 ?auto_38616 ?auto_38617 ?auto_38618 ?auto_38619 ?auto_38620 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38630 - BLOCK
      ?auto_38631 - BLOCK
      ?auto_38632 - BLOCK
      ?auto_38633 - BLOCK
      ?auto_38634 - BLOCK
      ?auto_38635 - BLOCK
      ?auto_38636 - BLOCK
      ?auto_38637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38637 ) ( ON-TABLE ?auto_38630 ) ( ON ?auto_38631 ?auto_38630 ) ( ON ?auto_38632 ?auto_38631 ) ( ON ?auto_38633 ?auto_38632 ) ( ON ?auto_38634 ?auto_38633 ) ( ON ?auto_38635 ?auto_38634 ) ( not ( = ?auto_38630 ?auto_38631 ) ) ( not ( = ?auto_38630 ?auto_38632 ) ) ( not ( = ?auto_38630 ?auto_38633 ) ) ( not ( = ?auto_38630 ?auto_38634 ) ) ( not ( = ?auto_38630 ?auto_38635 ) ) ( not ( = ?auto_38630 ?auto_38636 ) ) ( not ( = ?auto_38630 ?auto_38637 ) ) ( not ( = ?auto_38631 ?auto_38632 ) ) ( not ( = ?auto_38631 ?auto_38633 ) ) ( not ( = ?auto_38631 ?auto_38634 ) ) ( not ( = ?auto_38631 ?auto_38635 ) ) ( not ( = ?auto_38631 ?auto_38636 ) ) ( not ( = ?auto_38631 ?auto_38637 ) ) ( not ( = ?auto_38632 ?auto_38633 ) ) ( not ( = ?auto_38632 ?auto_38634 ) ) ( not ( = ?auto_38632 ?auto_38635 ) ) ( not ( = ?auto_38632 ?auto_38636 ) ) ( not ( = ?auto_38632 ?auto_38637 ) ) ( not ( = ?auto_38633 ?auto_38634 ) ) ( not ( = ?auto_38633 ?auto_38635 ) ) ( not ( = ?auto_38633 ?auto_38636 ) ) ( not ( = ?auto_38633 ?auto_38637 ) ) ( not ( = ?auto_38634 ?auto_38635 ) ) ( not ( = ?auto_38634 ?auto_38636 ) ) ( not ( = ?auto_38634 ?auto_38637 ) ) ( not ( = ?auto_38635 ?auto_38636 ) ) ( not ( = ?auto_38635 ?auto_38637 ) ) ( not ( = ?auto_38636 ?auto_38637 ) ) ( CLEAR ?auto_38635 ) ( ON ?auto_38636 ?auto_38637 ) ( CLEAR ?auto_38636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_38630 ?auto_38631 ?auto_38632 ?auto_38633 ?auto_38634 ?auto_38635 ?auto_38636 )
      ( MAKE-8PILE ?auto_38630 ?auto_38631 ?auto_38632 ?auto_38633 ?auto_38634 ?auto_38635 ?auto_38636 ?auto_38637 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38646 - BLOCK
      ?auto_38647 - BLOCK
      ?auto_38648 - BLOCK
      ?auto_38649 - BLOCK
      ?auto_38650 - BLOCK
      ?auto_38651 - BLOCK
      ?auto_38652 - BLOCK
      ?auto_38653 - BLOCK
    )
    :vars
    (
      ?auto_38654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38653 ?auto_38654 ) ( ON-TABLE ?auto_38646 ) ( ON ?auto_38647 ?auto_38646 ) ( ON ?auto_38648 ?auto_38647 ) ( ON ?auto_38649 ?auto_38648 ) ( ON ?auto_38650 ?auto_38649 ) ( not ( = ?auto_38646 ?auto_38647 ) ) ( not ( = ?auto_38646 ?auto_38648 ) ) ( not ( = ?auto_38646 ?auto_38649 ) ) ( not ( = ?auto_38646 ?auto_38650 ) ) ( not ( = ?auto_38646 ?auto_38651 ) ) ( not ( = ?auto_38646 ?auto_38652 ) ) ( not ( = ?auto_38646 ?auto_38653 ) ) ( not ( = ?auto_38646 ?auto_38654 ) ) ( not ( = ?auto_38647 ?auto_38648 ) ) ( not ( = ?auto_38647 ?auto_38649 ) ) ( not ( = ?auto_38647 ?auto_38650 ) ) ( not ( = ?auto_38647 ?auto_38651 ) ) ( not ( = ?auto_38647 ?auto_38652 ) ) ( not ( = ?auto_38647 ?auto_38653 ) ) ( not ( = ?auto_38647 ?auto_38654 ) ) ( not ( = ?auto_38648 ?auto_38649 ) ) ( not ( = ?auto_38648 ?auto_38650 ) ) ( not ( = ?auto_38648 ?auto_38651 ) ) ( not ( = ?auto_38648 ?auto_38652 ) ) ( not ( = ?auto_38648 ?auto_38653 ) ) ( not ( = ?auto_38648 ?auto_38654 ) ) ( not ( = ?auto_38649 ?auto_38650 ) ) ( not ( = ?auto_38649 ?auto_38651 ) ) ( not ( = ?auto_38649 ?auto_38652 ) ) ( not ( = ?auto_38649 ?auto_38653 ) ) ( not ( = ?auto_38649 ?auto_38654 ) ) ( not ( = ?auto_38650 ?auto_38651 ) ) ( not ( = ?auto_38650 ?auto_38652 ) ) ( not ( = ?auto_38650 ?auto_38653 ) ) ( not ( = ?auto_38650 ?auto_38654 ) ) ( not ( = ?auto_38651 ?auto_38652 ) ) ( not ( = ?auto_38651 ?auto_38653 ) ) ( not ( = ?auto_38651 ?auto_38654 ) ) ( not ( = ?auto_38652 ?auto_38653 ) ) ( not ( = ?auto_38652 ?auto_38654 ) ) ( not ( = ?auto_38653 ?auto_38654 ) ) ( ON ?auto_38652 ?auto_38653 ) ( CLEAR ?auto_38650 ) ( ON ?auto_38651 ?auto_38652 ) ( CLEAR ?auto_38651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_38646 ?auto_38647 ?auto_38648 ?auto_38649 ?auto_38650 ?auto_38651 )
      ( MAKE-8PILE ?auto_38646 ?auto_38647 ?auto_38648 ?auto_38649 ?auto_38650 ?auto_38651 ?auto_38652 ?auto_38653 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38663 - BLOCK
      ?auto_38664 - BLOCK
      ?auto_38665 - BLOCK
      ?auto_38666 - BLOCK
      ?auto_38667 - BLOCK
      ?auto_38668 - BLOCK
      ?auto_38669 - BLOCK
      ?auto_38670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38670 ) ( ON-TABLE ?auto_38663 ) ( ON ?auto_38664 ?auto_38663 ) ( ON ?auto_38665 ?auto_38664 ) ( ON ?auto_38666 ?auto_38665 ) ( ON ?auto_38667 ?auto_38666 ) ( not ( = ?auto_38663 ?auto_38664 ) ) ( not ( = ?auto_38663 ?auto_38665 ) ) ( not ( = ?auto_38663 ?auto_38666 ) ) ( not ( = ?auto_38663 ?auto_38667 ) ) ( not ( = ?auto_38663 ?auto_38668 ) ) ( not ( = ?auto_38663 ?auto_38669 ) ) ( not ( = ?auto_38663 ?auto_38670 ) ) ( not ( = ?auto_38664 ?auto_38665 ) ) ( not ( = ?auto_38664 ?auto_38666 ) ) ( not ( = ?auto_38664 ?auto_38667 ) ) ( not ( = ?auto_38664 ?auto_38668 ) ) ( not ( = ?auto_38664 ?auto_38669 ) ) ( not ( = ?auto_38664 ?auto_38670 ) ) ( not ( = ?auto_38665 ?auto_38666 ) ) ( not ( = ?auto_38665 ?auto_38667 ) ) ( not ( = ?auto_38665 ?auto_38668 ) ) ( not ( = ?auto_38665 ?auto_38669 ) ) ( not ( = ?auto_38665 ?auto_38670 ) ) ( not ( = ?auto_38666 ?auto_38667 ) ) ( not ( = ?auto_38666 ?auto_38668 ) ) ( not ( = ?auto_38666 ?auto_38669 ) ) ( not ( = ?auto_38666 ?auto_38670 ) ) ( not ( = ?auto_38667 ?auto_38668 ) ) ( not ( = ?auto_38667 ?auto_38669 ) ) ( not ( = ?auto_38667 ?auto_38670 ) ) ( not ( = ?auto_38668 ?auto_38669 ) ) ( not ( = ?auto_38668 ?auto_38670 ) ) ( not ( = ?auto_38669 ?auto_38670 ) ) ( ON ?auto_38669 ?auto_38670 ) ( CLEAR ?auto_38667 ) ( ON ?auto_38668 ?auto_38669 ) ( CLEAR ?auto_38668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_38663 ?auto_38664 ?auto_38665 ?auto_38666 ?auto_38667 ?auto_38668 )
      ( MAKE-8PILE ?auto_38663 ?auto_38664 ?auto_38665 ?auto_38666 ?auto_38667 ?auto_38668 ?auto_38669 ?auto_38670 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38679 - BLOCK
      ?auto_38680 - BLOCK
      ?auto_38681 - BLOCK
      ?auto_38682 - BLOCK
      ?auto_38683 - BLOCK
      ?auto_38684 - BLOCK
      ?auto_38685 - BLOCK
      ?auto_38686 - BLOCK
    )
    :vars
    (
      ?auto_38687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38686 ?auto_38687 ) ( ON-TABLE ?auto_38679 ) ( ON ?auto_38680 ?auto_38679 ) ( ON ?auto_38681 ?auto_38680 ) ( ON ?auto_38682 ?auto_38681 ) ( not ( = ?auto_38679 ?auto_38680 ) ) ( not ( = ?auto_38679 ?auto_38681 ) ) ( not ( = ?auto_38679 ?auto_38682 ) ) ( not ( = ?auto_38679 ?auto_38683 ) ) ( not ( = ?auto_38679 ?auto_38684 ) ) ( not ( = ?auto_38679 ?auto_38685 ) ) ( not ( = ?auto_38679 ?auto_38686 ) ) ( not ( = ?auto_38679 ?auto_38687 ) ) ( not ( = ?auto_38680 ?auto_38681 ) ) ( not ( = ?auto_38680 ?auto_38682 ) ) ( not ( = ?auto_38680 ?auto_38683 ) ) ( not ( = ?auto_38680 ?auto_38684 ) ) ( not ( = ?auto_38680 ?auto_38685 ) ) ( not ( = ?auto_38680 ?auto_38686 ) ) ( not ( = ?auto_38680 ?auto_38687 ) ) ( not ( = ?auto_38681 ?auto_38682 ) ) ( not ( = ?auto_38681 ?auto_38683 ) ) ( not ( = ?auto_38681 ?auto_38684 ) ) ( not ( = ?auto_38681 ?auto_38685 ) ) ( not ( = ?auto_38681 ?auto_38686 ) ) ( not ( = ?auto_38681 ?auto_38687 ) ) ( not ( = ?auto_38682 ?auto_38683 ) ) ( not ( = ?auto_38682 ?auto_38684 ) ) ( not ( = ?auto_38682 ?auto_38685 ) ) ( not ( = ?auto_38682 ?auto_38686 ) ) ( not ( = ?auto_38682 ?auto_38687 ) ) ( not ( = ?auto_38683 ?auto_38684 ) ) ( not ( = ?auto_38683 ?auto_38685 ) ) ( not ( = ?auto_38683 ?auto_38686 ) ) ( not ( = ?auto_38683 ?auto_38687 ) ) ( not ( = ?auto_38684 ?auto_38685 ) ) ( not ( = ?auto_38684 ?auto_38686 ) ) ( not ( = ?auto_38684 ?auto_38687 ) ) ( not ( = ?auto_38685 ?auto_38686 ) ) ( not ( = ?auto_38685 ?auto_38687 ) ) ( not ( = ?auto_38686 ?auto_38687 ) ) ( ON ?auto_38685 ?auto_38686 ) ( ON ?auto_38684 ?auto_38685 ) ( CLEAR ?auto_38682 ) ( ON ?auto_38683 ?auto_38684 ) ( CLEAR ?auto_38683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38679 ?auto_38680 ?auto_38681 ?auto_38682 ?auto_38683 )
      ( MAKE-8PILE ?auto_38679 ?auto_38680 ?auto_38681 ?auto_38682 ?auto_38683 ?auto_38684 ?auto_38685 ?auto_38686 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38696 - BLOCK
      ?auto_38697 - BLOCK
      ?auto_38698 - BLOCK
      ?auto_38699 - BLOCK
      ?auto_38700 - BLOCK
      ?auto_38701 - BLOCK
      ?auto_38702 - BLOCK
      ?auto_38703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38703 ) ( ON-TABLE ?auto_38696 ) ( ON ?auto_38697 ?auto_38696 ) ( ON ?auto_38698 ?auto_38697 ) ( ON ?auto_38699 ?auto_38698 ) ( not ( = ?auto_38696 ?auto_38697 ) ) ( not ( = ?auto_38696 ?auto_38698 ) ) ( not ( = ?auto_38696 ?auto_38699 ) ) ( not ( = ?auto_38696 ?auto_38700 ) ) ( not ( = ?auto_38696 ?auto_38701 ) ) ( not ( = ?auto_38696 ?auto_38702 ) ) ( not ( = ?auto_38696 ?auto_38703 ) ) ( not ( = ?auto_38697 ?auto_38698 ) ) ( not ( = ?auto_38697 ?auto_38699 ) ) ( not ( = ?auto_38697 ?auto_38700 ) ) ( not ( = ?auto_38697 ?auto_38701 ) ) ( not ( = ?auto_38697 ?auto_38702 ) ) ( not ( = ?auto_38697 ?auto_38703 ) ) ( not ( = ?auto_38698 ?auto_38699 ) ) ( not ( = ?auto_38698 ?auto_38700 ) ) ( not ( = ?auto_38698 ?auto_38701 ) ) ( not ( = ?auto_38698 ?auto_38702 ) ) ( not ( = ?auto_38698 ?auto_38703 ) ) ( not ( = ?auto_38699 ?auto_38700 ) ) ( not ( = ?auto_38699 ?auto_38701 ) ) ( not ( = ?auto_38699 ?auto_38702 ) ) ( not ( = ?auto_38699 ?auto_38703 ) ) ( not ( = ?auto_38700 ?auto_38701 ) ) ( not ( = ?auto_38700 ?auto_38702 ) ) ( not ( = ?auto_38700 ?auto_38703 ) ) ( not ( = ?auto_38701 ?auto_38702 ) ) ( not ( = ?auto_38701 ?auto_38703 ) ) ( not ( = ?auto_38702 ?auto_38703 ) ) ( ON ?auto_38702 ?auto_38703 ) ( ON ?auto_38701 ?auto_38702 ) ( CLEAR ?auto_38699 ) ( ON ?auto_38700 ?auto_38701 ) ( CLEAR ?auto_38700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38696 ?auto_38697 ?auto_38698 ?auto_38699 ?auto_38700 )
      ( MAKE-8PILE ?auto_38696 ?auto_38697 ?auto_38698 ?auto_38699 ?auto_38700 ?auto_38701 ?auto_38702 ?auto_38703 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38712 - BLOCK
      ?auto_38713 - BLOCK
      ?auto_38714 - BLOCK
      ?auto_38715 - BLOCK
      ?auto_38716 - BLOCK
      ?auto_38717 - BLOCK
      ?auto_38718 - BLOCK
      ?auto_38719 - BLOCK
    )
    :vars
    (
      ?auto_38720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38719 ?auto_38720 ) ( ON-TABLE ?auto_38712 ) ( ON ?auto_38713 ?auto_38712 ) ( ON ?auto_38714 ?auto_38713 ) ( not ( = ?auto_38712 ?auto_38713 ) ) ( not ( = ?auto_38712 ?auto_38714 ) ) ( not ( = ?auto_38712 ?auto_38715 ) ) ( not ( = ?auto_38712 ?auto_38716 ) ) ( not ( = ?auto_38712 ?auto_38717 ) ) ( not ( = ?auto_38712 ?auto_38718 ) ) ( not ( = ?auto_38712 ?auto_38719 ) ) ( not ( = ?auto_38712 ?auto_38720 ) ) ( not ( = ?auto_38713 ?auto_38714 ) ) ( not ( = ?auto_38713 ?auto_38715 ) ) ( not ( = ?auto_38713 ?auto_38716 ) ) ( not ( = ?auto_38713 ?auto_38717 ) ) ( not ( = ?auto_38713 ?auto_38718 ) ) ( not ( = ?auto_38713 ?auto_38719 ) ) ( not ( = ?auto_38713 ?auto_38720 ) ) ( not ( = ?auto_38714 ?auto_38715 ) ) ( not ( = ?auto_38714 ?auto_38716 ) ) ( not ( = ?auto_38714 ?auto_38717 ) ) ( not ( = ?auto_38714 ?auto_38718 ) ) ( not ( = ?auto_38714 ?auto_38719 ) ) ( not ( = ?auto_38714 ?auto_38720 ) ) ( not ( = ?auto_38715 ?auto_38716 ) ) ( not ( = ?auto_38715 ?auto_38717 ) ) ( not ( = ?auto_38715 ?auto_38718 ) ) ( not ( = ?auto_38715 ?auto_38719 ) ) ( not ( = ?auto_38715 ?auto_38720 ) ) ( not ( = ?auto_38716 ?auto_38717 ) ) ( not ( = ?auto_38716 ?auto_38718 ) ) ( not ( = ?auto_38716 ?auto_38719 ) ) ( not ( = ?auto_38716 ?auto_38720 ) ) ( not ( = ?auto_38717 ?auto_38718 ) ) ( not ( = ?auto_38717 ?auto_38719 ) ) ( not ( = ?auto_38717 ?auto_38720 ) ) ( not ( = ?auto_38718 ?auto_38719 ) ) ( not ( = ?auto_38718 ?auto_38720 ) ) ( not ( = ?auto_38719 ?auto_38720 ) ) ( ON ?auto_38718 ?auto_38719 ) ( ON ?auto_38717 ?auto_38718 ) ( ON ?auto_38716 ?auto_38717 ) ( CLEAR ?auto_38714 ) ( ON ?auto_38715 ?auto_38716 ) ( CLEAR ?auto_38715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38712 ?auto_38713 ?auto_38714 ?auto_38715 )
      ( MAKE-8PILE ?auto_38712 ?auto_38713 ?auto_38714 ?auto_38715 ?auto_38716 ?auto_38717 ?auto_38718 ?auto_38719 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38729 - BLOCK
      ?auto_38730 - BLOCK
      ?auto_38731 - BLOCK
      ?auto_38732 - BLOCK
      ?auto_38733 - BLOCK
      ?auto_38734 - BLOCK
      ?auto_38735 - BLOCK
      ?auto_38736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38736 ) ( ON-TABLE ?auto_38729 ) ( ON ?auto_38730 ?auto_38729 ) ( ON ?auto_38731 ?auto_38730 ) ( not ( = ?auto_38729 ?auto_38730 ) ) ( not ( = ?auto_38729 ?auto_38731 ) ) ( not ( = ?auto_38729 ?auto_38732 ) ) ( not ( = ?auto_38729 ?auto_38733 ) ) ( not ( = ?auto_38729 ?auto_38734 ) ) ( not ( = ?auto_38729 ?auto_38735 ) ) ( not ( = ?auto_38729 ?auto_38736 ) ) ( not ( = ?auto_38730 ?auto_38731 ) ) ( not ( = ?auto_38730 ?auto_38732 ) ) ( not ( = ?auto_38730 ?auto_38733 ) ) ( not ( = ?auto_38730 ?auto_38734 ) ) ( not ( = ?auto_38730 ?auto_38735 ) ) ( not ( = ?auto_38730 ?auto_38736 ) ) ( not ( = ?auto_38731 ?auto_38732 ) ) ( not ( = ?auto_38731 ?auto_38733 ) ) ( not ( = ?auto_38731 ?auto_38734 ) ) ( not ( = ?auto_38731 ?auto_38735 ) ) ( not ( = ?auto_38731 ?auto_38736 ) ) ( not ( = ?auto_38732 ?auto_38733 ) ) ( not ( = ?auto_38732 ?auto_38734 ) ) ( not ( = ?auto_38732 ?auto_38735 ) ) ( not ( = ?auto_38732 ?auto_38736 ) ) ( not ( = ?auto_38733 ?auto_38734 ) ) ( not ( = ?auto_38733 ?auto_38735 ) ) ( not ( = ?auto_38733 ?auto_38736 ) ) ( not ( = ?auto_38734 ?auto_38735 ) ) ( not ( = ?auto_38734 ?auto_38736 ) ) ( not ( = ?auto_38735 ?auto_38736 ) ) ( ON ?auto_38735 ?auto_38736 ) ( ON ?auto_38734 ?auto_38735 ) ( ON ?auto_38733 ?auto_38734 ) ( CLEAR ?auto_38731 ) ( ON ?auto_38732 ?auto_38733 ) ( CLEAR ?auto_38732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38729 ?auto_38730 ?auto_38731 ?auto_38732 )
      ( MAKE-8PILE ?auto_38729 ?auto_38730 ?auto_38731 ?auto_38732 ?auto_38733 ?auto_38734 ?auto_38735 ?auto_38736 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38745 - BLOCK
      ?auto_38746 - BLOCK
      ?auto_38747 - BLOCK
      ?auto_38748 - BLOCK
      ?auto_38749 - BLOCK
      ?auto_38750 - BLOCK
      ?auto_38751 - BLOCK
      ?auto_38752 - BLOCK
    )
    :vars
    (
      ?auto_38753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38752 ?auto_38753 ) ( ON-TABLE ?auto_38745 ) ( ON ?auto_38746 ?auto_38745 ) ( not ( = ?auto_38745 ?auto_38746 ) ) ( not ( = ?auto_38745 ?auto_38747 ) ) ( not ( = ?auto_38745 ?auto_38748 ) ) ( not ( = ?auto_38745 ?auto_38749 ) ) ( not ( = ?auto_38745 ?auto_38750 ) ) ( not ( = ?auto_38745 ?auto_38751 ) ) ( not ( = ?auto_38745 ?auto_38752 ) ) ( not ( = ?auto_38745 ?auto_38753 ) ) ( not ( = ?auto_38746 ?auto_38747 ) ) ( not ( = ?auto_38746 ?auto_38748 ) ) ( not ( = ?auto_38746 ?auto_38749 ) ) ( not ( = ?auto_38746 ?auto_38750 ) ) ( not ( = ?auto_38746 ?auto_38751 ) ) ( not ( = ?auto_38746 ?auto_38752 ) ) ( not ( = ?auto_38746 ?auto_38753 ) ) ( not ( = ?auto_38747 ?auto_38748 ) ) ( not ( = ?auto_38747 ?auto_38749 ) ) ( not ( = ?auto_38747 ?auto_38750 ) ) ( not ( = ?auto_38747 ?auto_38751 ) ) ( not ( = ?auto_38747 ?auto_38752 ) ) ( not ( = ?auto_38747 ?auto_38753 ) ) ( not ( = ?auto_38748 ?auto_38749 ) ) ( not ( = ?auto_38748 ?auto_38750 ) ) ( not ( = ?auto_38748 ?auto_38751 ) ) ( not ( = ?auto_38748 ?auto_38752 ) ) ( not ( = ?auto_38748 ?auto_38753 ) ) ( not ( = ?auto_38749 ?auto_38750 ) ) ( not ( = ?auto_38749 ?auto_38751 ) ) ( not ( = ?auto_38749 ?auto_38752 ) ) ( not ( = ?auto_38749 ?auto_38753 ) ) ( not ( = ?auto_38750 ?auto_38751 ) ) ( not ( = ?auto_38750 ?auto_38752 ) ) ( not ( = ?auto_38750 ?auto_38753 ) ) ( not ( = ?auto_38751 ?auto_38752 ) ) ( not ( = ?auto_38751 ?auto_38753 ) ) ( not ( = ?auto_38752 ?auto_38753 ) ) ( ON ?auto_38751 ?auto_38752 ) ( ON ?auto_38750 ?auto_38751 ) ( ON ?auto_38749 ?auto_38750 ) ( ON ?auto_38748 ?auto_38749 ) ( CLEAR ?auto_38746 ) ( ON ?auto_38747 ?auto_38748 ) ( CLEAR ?auto_38747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38745 ?auto_38746 ?auto_38747 )
      ( MAKE-8PILE ?auto_38745 ?auto_38746 ?auto_38747 ?auto_38748 ?auto_38749 ?auto_38750 ?auto_38751 ?auto_38752 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38762 - BLOCK
      ?auto_38763 - BLOCK
      ?auto_38764 - BLOCK
      ?auto_38765 - BLOCK
      ?auto_38766 - BLOCK
      ?auto_38767 - BLOCK
      ?auto_38768 - BLOCK
      ?auto_38769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38769 ) ( ON-TABLE ?auto_38762 ) ( ON ?auto_38763 ?auto_38762 ) ( not ( = ?auto_38762 ?auto_38763 ) ) ( not ( = ?auto_38762 ?auto_38764 ) ) ( not ( = ?auto_38762 ?auto_38765 ) ) ( not ( = ?auto_38762 ?auto_38766 ) ) ( not ( = ?auto_38762 ?auto_38767 ) ) ( not ( = ?auto_38762 ?auto_38768 ) ) ( not ( = ?auto_38762 ?auto_38769 ) ) ( not ( = ?auto_38763 ?auto_38764 ) ) ( not ( = ?auto_38763 ?auto_38765 ) ) ( not ( = ?auto_38763 ?auto_38766 ) ) ( not ( = ?auto_38763 ?auto_38767 ) ) ( not ( = ?auto_38763 ?auto_38768 ) ) ( not ( = ?auto_38763 ?auto_38769 ) ) ( not ( = ?auto_38764 ?auto_38765 ) ) ( not ( = ?auto_38764 ?auto_38766 ) ) ( not ( = ?auto_38764 ?auto_38767 ) ) ( not ( = ?auto_38764 ?auto_38768 ) ) ( not ( = ?auto_38764 ?auto_38769 ) ) ( not ( = ?auto_38765 ?auto_38766 ) ) ( not ( = ?auto_38765 ?auto_38767 ) ) ( not ( = ?auto_38765 ?auto_38768 ) ) ( not ( = ?auto_38765 ?auto_38769 ) ) ( not ( = ?auto_38766 ?auto_38767 ) ) ( not ( = ?auto_38766 ?auto_38768 ) ) ( not ( = ?auto_38766 ?auto_38769 ) ) ( not ( = ?auto_38767 ?auto_38768 ) ) ( not ( = ?auto_38767 ?auto_38769 ) ) ( not ( = ?auto_38768 ?auto_38769 ) ) ( ON ?auto_38768 ?auto_38769 ) ( ON ?auto_38767 ?auto_38768 ) ( ON ?auto_38766 ?auto_38767 ) ( ON ?auto_38765 ?auto_38766 ) ( CLEAR ?auto_38763 ) ( ON ?auto_38764 ?auto_38765 ) ( CLEAR ?auto_38764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38762 ?auto_38763 ?auto_38764 )
      ( MAKE-8PILE ?auto_38762 ?auto_38763 ?auto_38764 ?auto_38765 ?auto_38766 ?auto_38767 ?auto_38768 ?auto_38769 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38778 - BLOCK
      ?auto_38779 - BLOCK
      ?auto_38780 - BLOCK
      ?auto_38781 - BLOCK
      ?auto_38782 - BLOCK
      ?auto_38783 - BLOCK
      ?auto_38784 - BLOCK
      ?auto_38785 - BLOCK
    )
    :vars
    (
      ?auto_38786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38785 ?auto_38786 ) ( ON-TABLE ?auto_38778 ) ( not ( = ?auto_38778 ?auto_38779 ) ) ( not ( = ?auto_38778 ?auto_38780 ) ) ( not ( = ?auto_38778 ?auto_38781 ) ) ( not ( = ?auto_38778 ?auto_38782 ) ) ( not ( = ?auto_38778 ?auto_38783 ) ) ( not ( = ?auto_38778 ?auto_38784 ) ) ( not ( = ?auto_38778 ?auto_38785 ) ) ( not ( = ?auto_38778 ?auto_38786 ) ) ( not ( = ?auto_38779 ?auto_38780 ) ) ( not ( = ?auto_38779 ?auto_38781 ) ) ( not ( = ?auto_38779 ?auto_38782 ) ) ( not ( = ?auto_38779 ?auto_38783 ) ) ( not ( = ?auto_38779 ?auto_38784 ) ) ( not ( = ?auto_38779 ?auto_38785 ) ) ( not ( = ?auto_38779 ?auto_38786 ) ) ( not ( = ?auto_38780 ?auto_38781 ) ) ( not ( = ?auto_38780 ?auto_38782 ) ) ( not ( = ?auto_38780 ?auto_38783 ) ) ( not ( = ?auto_38780 ?auto_38784 ) ) ( not ( = ?auto_38780 ?auto_38785 ) ) ( not ( = ?auto_38780 ?auto_38786 ) ) ( not ( = ?auto_38781 ?auto_38782 ) ) ( not ( = ?auto_38781 ?auto_38783 ) ) ( not ( = ?auto_38781 ?auto_38784 ) ) ( not ( = ?auto_38781 ?auto_38785 ) ) ( not ( = ?auto_38781 ?auto_38786 ) ) ( not ( = ?auto_38782 ?auto_38783 ) ) ( not ( = ?auto_38782 ?auto_38784 ) ) ( not ( = ?auto_38782 ?auto_38785 ) ) ( not ( = ?auto_38782 ?auto_38786 ) ) ( not ( = ?auto_38783 ?auto_38784 ) ) ( not ( = ?auto_38783 ?auto_38785 ) ) ( not ( = ?auto_38783 ?auto_38786 ) ) ( not ( = ?auto_38784 ?auto_38785 ) ) ( not ( = ?auto_38784 ?auto_38786 ) ) ( not ( = ?auto_38785 ?auto_38786 ) ) ( ON ?auto_38784 ?auto_38785 ) ( ON ?auto_38783 ?auto_38784 ) ( ON ?auto_38782 ?auto_38783 ) ( ON ?auto_38781 ?auto_38782 ) ( ON ?auto_38780 ?auto_38781 ) ( CLEAR ?auto_38778 ) ( ON ?auto_38779 ?auto_38780 ) ( CLEAR ?auto_38779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38778 ?auto_38779 )
      ( MAKE-8PILE ?auto_38778 ?auto_38779 ?auto_38780 ?auto_38781 ?auto_38782 ?auto_38783 ?auto_38784 ?auto_38785 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38795 - BLOCK
      ?auto_38796 - BLOCK
      ?auto_38797 - BLOCK
      ?auto_38798 - BLOCK
      ?auto_38799 - BLOCK
      ?auto_38800 - BLOCK
      ?auto_38801 - BLOCK
      ?auto_38802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38802 ) ( ON-TABLE ?auto_38795 ) ( not ( = ?auto_38795 ?auto_38796 ) ) ( not ( = ?auto_38795 ?auto_38797 ) ) ( not ( = ?auto_38795 ?auto_38798 ) ) ( not ( = ?auto_38795 ?auto_38799 ) ) ( not ( = ?auto_38795 ?auto_38800 ) ) ( not ( = ?auto_38795 ?auto_38801 ) ) ( not ( = ?auto_38795 ?auto_38802 ) ) ( not ( = ?auto_38796 ?auto_38797 ) ) ( not ( = ?auto_38796 ?auto_38798 ) ) ( not ( = ?auto_38796 ?auto_38799 ) ) ( not ( = ?auto_38796 ?auto_38800 ) ) ( not ( = ?auto_38796 ?auto_38801 ) ) ( not ( = ?auto_38796 ?auto_38802 ) ) ( not ( = ?auto_38797 ?auto_38798 ) ) ( not ( = ?auto_38797 ?auto_38799 ) ) ( not ( = ?auto_38797 ?auto_38800 ) ) ( not ( = ?auto_38797 ?auto_38801 ) ) ( not ( = ?auto_38797 ?auto_38802 ) ) ( not ( = ?auto_38798 ?auto_38799 ) ) ( not ( = ?auto_38798 ?auto_38800 ) ) ( not ( = ?auto_38798 ?auto_38801 ) ) ( not ( = ?auto_38798 ?auto_38802 ) ) ( not ( = ?auto_38799 ?auto_38800 ) ) ( not ( = ?auto_38799 ?auto_38801 ) ) ( not ( = ?auto_38799 ?auto_38802 ) ) ( not ( = ?auto_38800 ?auto_38801 ) ) ( not ( = ?auto_38800 ?auto_38802 ) ) ( not ( = ?auto_38801 ?auto_38802 ) ) ( ON ?auto_38801 ?auto_38802 ) ( ON ?auto_38800 ?auto_38801 ) ( ON ?auto_38799 ?auto_38800 ) ( ON ?auto_38798 ?auto_38799 ) ( ON ?auto_38797 ?auto_38798 ) ( CLEAR ?auto_38795 ) ( ON ?auto_38796 ?auto_38797 ) ( CLEAR ?auto_38796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38795 ?auto_38796 )
      ( MAKE-8PILE ?auto_38795 ?auto_38796 ?auto_38797 ?auto_38798 ?auto_38799 ?auto_38800 ?auto_38801 ?auto_38802 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38811 - BLOCK
      ?auto_38812 - BLOCK
      ?auto_38813 - BLOCK
      ?auto_38814 - BLOCK
      ?auto_38815 - BLOCK
      ?auto_38816 - BLOCK
      ?auto_38817 - BLOCK
      ?auto_38818 - BLOCK
    )
    :vars
    (
      ?auto_38819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38818 ?auto_38819 ) ( not ( = ?auto_38811 ?auto_38812 ) ) ( not ( = ?auto_38811 ?auto_38813 ) ) ( not ( = ?auto_38811 ?auto_38814 ) ) ( not ( = ?auto_38811 ?auto_38815 ) ) ( not ( = ?auto_38811 ?auto_38816 ) ) ( not ( = ?auto_38811 ?auto_38817 ) ) ( not ( = ?auto_38811 ?auto_38818 ) ) ( not ( = ?auto_38811 ?auto_38819 ) ) ( not ( = ?auto_38812 ?auto_38813 ) ) ( not ( = ?auto_38812 ?auto_38814 ) ) ( not ( = ?auto_38812 ?auto_38815 ) ) ( not ( = ?auto_38812 ?auto_38816 ) ) ( not ( = ?auto_38812 ?auto_38817 ) ) ( not ( = ?auto_38812 ?auto_38818 ) ) ( not ( = ?auto_38812 ?auto_38819 ) ) ( not ( = ?auto_38813 ?auto_38814 ) ) ( not ( = ?auto_38813 ?auto_38815 ) ) ( not ( = ?auto_38813 ?auto_38816 ) ) ( not ( = ?auto_38813 ?auto_38817 ) ) ( not ( = ?auto_38813 ?auto_38818 ) ) ( not ( = ?auto_38813 ?auto_38819 ) ) ( not ( = ?auto_38814 ?auto_38815 ) ) ( not ( = ?auto_38814 ?auto_38816 ) ) ( not ( = ?auto_38814 ?auto_38817 ) ) ( not ( = ?auto_38814 ?auto_38818 ) ) ( not ( = ?auto_38814 ?auto_38819 ) ) ( not ( = ?auto_38815 ?auto_38816 ) ) ( not ( = ?auto_38815 ?auto_38817 ) ) ( not ( = ?auto_38815 ?auto_38818 ) ) ( not ( = ?auto_38815 ?auto_38819 ) ) ( not ( = ?auto_38816 ?auto_38817 ) ) ( not ( = ?auto_38816 ?auto_38818 ) ) ( not ( = ?auto_38816 ?auto_38819 ) ) ( not ( = ?auto_38817 ?auto_38818 ) ) ( not ( = ?auto_38817 ?auto_38819 ) ) ( not ( = ?auto_38818 ?auto_38819 ) ) ( ON ?auto_38817 ?auto_38818 ) ( ON ?auto_38816 ?auto_38817 ) ( ON ?auto_38815 ?auto_38816 ) ( ON ?auto_38814 ?auto_38815 ) ( ON ?auto_38813 ?auto_38814 ) ( ON ?auto_38812 ?auto_38813 ) ( ON ?auto_38811 ?auto_38812 ) ( CLEAR ?auto_38811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38811 )
      ( MAKE-8PILE ?auto_38811 ?auto_38812 ?auto_38813 ?auto_38814 ?auto_38815 ?auto_38816 ?auto_38817 ?auto_38818 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38828 - BLOCK
      ?auto_38829 - BLOCK
      ?auto_38830 - BLOCK
      ?auto_38831 - BLOCK
      ?auto_38832 - BLOCK
      ?auto_38833 - BLOCK
      ?auto_38834 - BLOCK
      ?auto_38835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38835 ) ( not ( = ?auto_38828 ?auto_38829 ) ) ( not ( = ?auto_38828 ?auto_38830 ) ) ( not ( = ?auto_38828 ?auto_38831 ) ) ( not ( = ?auto_38828 ?auto_38832 ) ) ( not ( = ?auto_38828 ?auto_38833 ) ) ( not ( = ?auto_38828 ?auto_38834 ) ) ( not ( = ?auto_38828 ?auto_38835 ) ) ( not ( = ?auto_38829 ?auto_38830 ) ) ( not ( = ?auto_38829 ?auto_38831 ) ) ( not ( = ?auto_38829 ?auto_38832 ) ) ( not ( = ?auto_38829 ?auto_38833 ) ) ( not ( = ?auto_38829 ?auto_38834 ) ) ( not ( = ?auto_38829 ?auto_38835 ) ) ( not ( = ?auto_38830 ?auto_38831 ) ) ( not ( = ?auto_38830 ?auto_38832 ) ) ( not ( = ?auto_38830 ?auto_38833 ) ) ( not ( = ?auto_38830 ?auto_38834 ) ) ( not ( = ?auto_38830 ?auto_38835 ) ) ( not ( = ?auto_38831 ?auto_38832 ) ) ( not ( = ?auto_38831 ?auto_38833 ) ) ( not ( = ?auto_38831 ?auto_38834 ) ) ( not ( = ?auto_38831 ?auto_38835 ) ) ( not ( = ?auto_38832 ?auto_38833 ) ) ( not ( = ?auto_38832 ?auto_38834 ) ) ( not ( = ?auto_38832 ?auto_38835 ) ) ( not ( = ?auto_38833 ?auto_38834 ) ) ( not ( = ?auto_38833 ?auto_38835 ) ) ( not ( = ?auto_38834 ?auto_38835 ) ) ( ON ?auto_38834 ?auto_38835 ) ( ON ?auto_38833 ?auto_38834 ) ( ON ?auto_38832 ?auto_38833 ) ( ON ?auto_38831 ?auto_38832 ) ( ON ?auto_38830 ?auto_38831 ) ( ON ?auto_38829 ?auto_38830 ) ( ON ?auto_38828 ?auto_38829 ) ( CLEAR ?auto_38828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38828 )
      ( MAKE-8PILE ?auto_38828 ?auto_38829 ?auto_38830 ?auto_38831 ?auto_38832 ?auto_38833 ?auto_38834 ?auto_38835 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_38844 - BLOCK
      ?auto_38845 - BLOCK
      ?auto_38846 - BLOCK
      ?auto_38847 - BLOCK
      ?auto_38848 - BLOCK
      ?auto_38849 - BLOCK
      ?auto_38850 - BLOCK
      ?auto_38851 - BLOCK
    )
    :vars
    (
      ?auto_38852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38844 ?auto_38845 ) ) ( not ( = ?auto_38844 ?auto_38846 ) ) ( not ( = ?auto_38844 ?auto_38847 ) ) ( not ( = ?auto_38844 ?auto_38848 ) ) ( not ( = ?auto_38844 ?auto_38849 ) ) ( not ( = ?auto_38844 ?auto_38850 ) ) ( not ( = ?auto_38844 ?auto_38851 ) ) ( not ( = ?auto_38845 ?auto_38846 ) ) ( not ( = ?auto_38845 ?auto_38847 ) ) ( not ( = ?auto_38845 ?auto_38848 ) ) ( not ( = ?auto_38845 ?auto_38849 ) ) ( not ( = ?auto_38845 ?auto_38850 ) ) ( not ( = ?auto_38845 ?auto_38851 ) ) ( not ( = ?auto_38846 ?auto_38847 ) ) ( not ( = ?auto_38846 ?auto_38848 ) ) ( not ( = ?auto_38846 ?auto_38849 ) ) ( not ( = ?auto_38846 ?auto_38850 ) ) ( not ( = ?auto_38846 ?auto_38851 ) ) ( not ( = ?auto_38847 ?auto_38848 ) ) ( not ( = ?auto_38847 ?auto_38849 ) ) ( not ( = ?auto_38847 ?auto_38850 ) ) ( not ( = ?auto_38847 ?auto_38851 ) ) ( not ( = ?auto_38848 ?auto_38849 ) ) ( not ( = ?auto_38848 ?auto_38850 ) ) ( not ( = ?auto_38848 ?auto_38851 ) ) ( not ( = ?auto_38849 ?auto_38850 ) ) ( not ( = ?auto_38849 ?auto_38851 ) ) ( not ( = ?auto_38850 ?auto_38851 ) ) ( ON ?auto_38844 ?auto_38852 ) ( not ( = ?auto_38851 ?auto_38852 ) ) ( not ( = ?auto_38850 ?auto_38852 ) ) ( not ( = ?auto_38849 ?auto_38852 ) ) ( not ( = ?auto_38848 ?auto_38852 ) ) ( not ( = ?auto_38847 ?auto_38852 ) ) ( not ( = ?auto_38846 ?auto_38852 ) ) ( not ( = ?auto_38845 ?auto_38852 ) ) ( not ( = ?auto_38844 ?auto_38852 ) ) ( ON ?auto_38845 ?auto_38844 ) ( ON ?auto_38846 ?auto_38845 ) ( ON ?auto_38847 ?auto_38846 ) ( ON ?auto_38848 ?auto_38847 ) ( ON ?auto_38849 ?auto_38848 ) ( ON ?auto_38850 ?auto_38849 ) ( ON ?auto_38851 ?auto_38850 ) ( CLEAR ?auto_38851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_38851 ?auto_38850 ?auto_38849 ?auto_38848 ?auto_38847 ?auto_38846 ?auto_38845 ?auto_38844 )
      ( MAKE-8PILE ?auto_38844 ?auto_38845 ?auto_38846 ?auto_38847 ?auto_38848 ?auto_38849 ?auto_38850 ?auto_38851 ) )
  )

)

